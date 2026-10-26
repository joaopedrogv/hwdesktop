unit efd_ajustes_service;

interface

uses
  uClasseConexao,
  efd_ajustes_model,
  Classes,
//  basefb_class,
  sp_efd_ajustes_class;

type
  TCondAjuste = (cjCfop, cjNcm, cjUF, cjConsumoFinal, cjContribuinteIcms, cjTipoPessoa, cjFinalidade, cjOperaacaoFiscal, cjOrigemMerc, cjCstIcms, cjAliqIcms, cjFinaliEmissao);

  TEfdAjustesConf = class(TSpEfdAjustesList)
  private
    GrupoConfs: TStrings;
    procedure AgruparConfs;
    function GetGrupo(grupoId: string): TEfdAjustesConf;
    function GetAjuste(nfParams: TNotaItemParam): TSpEfdAjustes;
    function CondicaoValida(tipoCondicao: TCondAjuste; valorCondicao: string): Integer;
  public
    function GetAjusterPorNotaItem(nfParams: TNotaItemParamList): TEfdAjustesConfResultList;
  end;

  TAjustesRepo = class
  private
    codigoEmp: Integer;
    con: TConexao;
  public
    destructor Destroy; override;
    constructor Create(codEmpresa: Integer; conexao: TConexao);

    function GetConfAjustes: TEfdAjustesConf;
    function GetNotaFiscal(nfId: Integer): TNotaItemParamList;
  end;

implementation

uses
  StrUtils,
  SysUtils,
//  Contnrs,
  Math,
  hw_utils;

{ TAjustesRepo }

constructor TAjustesRepo.Create(codEmpresa: Integer; conexao: TConexao);
begin
  con := conexao;
  codigoEmp := codEmpresa;
end;

destructor TAjustesRepo.Destroy;
begin

  inherited;
end;

function TAjustesRepo.GetConfAjustes: TEfdAjustesConf;
begin
  Result := TEfdAjustesConf.Create;

  Result.CopyFrom(TSpEfdAjustes, con.SqlOpen('select * from sp_efd_ajustes(%d) order by id, tipo', [codigoEmp]), False);
end;

function TAjustesRepo.GetNotaFiscal(nfId: Integer): TNotaItemParamList;
begin
  Result := TNotaItemParamList.Create;

  con.SqlOpen
    ('select distinct nfi.cod_nf, nfi.nitem, nfi.cod_empresa, nfi.codigo_nop, nfi.ncm, nf.tipo_emissao,' +
     ' iif(nf.nfe_iddest in (''2'', ''3''), nf.dest_uf, uf.sigla_uf) uf, nf.consumidor_final, nf.nfe_indiedest,' +
     ' iif(char_length(trim(nf.cpfcgc)) = 14, ''PJ'', ''PF'') pessoa, f.id finalidadeid, nfi.opf_icms_id, nfi.cst,' +
     ' nfi.aliq_icm, nfi.base_icm, nfi.valor_icm, nfi.aliq_icmsub, nfi.base_icmsub, nfi.valor_icmsub,' +
     ' nfi.valor_total, nfi.rateio_desconto, nfi.rateio_seguro, nfi.rateio_outdesp, nfi.rateio_frete, nfi.valor_ipi,' +
     ' nfi.vicmdeson, nfi.vpisdeson, nfi.vcofinsdeson, nf.frete_f_nfe, nfi.guidt' +
     ' from notafiscal nf' +
     ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
     ' left join produtos p on p.grupo_prod = nfi.grupo_prod and p.cod_prod = nfi.cod_prod and p.cod_empresa = nfi.cod_empresa' +
     ' left join finalidade f on f.id = nf.finalidadeid and f.cod_empresa = nf.finalidadeid' +
     ' inner join empresa e on e.cod_empresa = nf.cod_empresa' +
     ' inner join estados uf on uf.codigo_uf = e.uf_emp' +
     ' where nf.cod_nf = %d and nf.cod_empresa = %d',
    [nfId, codigoEmp]);

  Result.CopyFrom(TNotaItemParam, con.QrAux, false);
end;

{ TEfdAjustesConf }

procedure TEfdAjustesConf.AgruparConfs;
var
  I: Integer;
begin
  GrupoConfs := NewStringList(True);
  GrupoConfs.Clear;

  for I := 0 to Self.Count - 1 do
    GrupoConfs.Add(Self.Items[I].id);
end;

function TEfdAjustesConf.CondicaoValida(tipoCondicao: TCondAjuste;
  valorCondicao: string): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to Self.Count - 1 do
    if tipoCondicao = TCondAjuste(Self.Items[I].tipo) then
    begin

      Result := -2;

      case tipoCondicao of
        cjCfop,
        cjUF,
        cjConsumoFinal,
        cjContribuinteIcms,
        cjTipoPessoa,
        cjFinalidade,
        cjFinaliEmissao,
        cjOperaacaoFiscal,
        cjOrigemMerc,
        cjCstIcms,
        cjAliqIcms:
          if MatchText(valorCondicao, NewArrayString(Self.Items[I].condicao)) then
          begin
            Result := I;
            Break;
          end;

        cjNcm:
          if (Self.Items[I].condicao >= valorCondicao) and (valorCondicao <= Self.Items[I].condicao) then
          begin
            Result := I;
            Break;
          end;
      end;
    end;   
end;

function TEfdAjustesConf.GetAjusterPorNotaItem(nfParams: TNotaItemParamList): TEfdAjustesConfResultList;
var
  idConf: string;
  I, iNf: Integer;
  grupo: TEfdAjustesConf;
  ajuste: TSpEfdAjustes;
begin
  Result := TEfdAjustesConfResultList.Create;
  AgruparConfs;

  for I := 0 to GrupoConfs.Count - 1 do
  begin
    grupo := GetGrupo(GrupoConfs[I]);

    for iNf := 0 to nfParams.Count - 1 do
    begin

      ajuste := grupo.GetAjuste(nfParams.Items[iNf]);         

      if Assigned(ajuste) then
        Result.AddPar(nfParams.Items[iNf], ajuste);
    end;
  end;

end;

function TEfdAjustesConf.GetAjuste(
  nfParams: TNotaItemParam): TSpEfdAjustes;
var
  I, idx, idxAliq: Integer;
  cpo: TCondAjuste;
begin
  Result := nil;

  // CondicaoValida > Retorna o indice caso a condição seja valida, -1 Não existe condicao, -2 Condicao invalida

  idx := Self.CondicaoValida(cjCfop, FloatToStr(nfParams.codigo_nop));
  if idx < 0 then
    Exit;

  if Self.CondicaoValida(cjNcm, nfParams.ncm) = -2 then
    Exit;

  if Self.CondicaoValida(cjUF, nfParams.uf) = -2 then
    Exit;

  if Self.CondicaoValida(cjConsumoFinal, nfParams.consumidor_final) = -2 then
    Exit;

  if Self.CondicaoValida(cjContribuinteIcms, IntToStr(nfParams.nfe_indiedest)) = -2 then
    Exit;

  if Self.CondicaoValida(cjTipoPessoa, nfParams.pessoa) = -2 then
    Exit;

  if Self.CondicaoValida(cjFinalidade, IntToStr(nfParams.finalidadeid)) = -2 then
    Exit;

  if Self.CondicaoValida(cjOperaacaoFiscal, IntToStr(nfParams.opf_icms_id)) = -2 then
    Exit;

  if Self.CondicaoValida(cjOrigemMerc, Copy(nfParams.cst, 1, 1)) = -2 then
    Exit;

  if Self.CondicaoValida(cjCstIcms, Copy(nfParams.cst, 2, 2)) = -2 then
    Exit;

  if Self.CondicaoValida(cjFinaliEmissao, Trim(nfParams.tipo_emissao)) = -2 then
    Exit;

  idxAliq := Self.CondicaoValida(cjAliqIcms, FloatToStr(nfParams.aliq_icm));

  if idxAliq = -2 then
    Exit;

  Result := Self.Items[Max(idx, idxAliq)].Clone as TSpEfdAjustes;//.Create;

end;

function TEfdAjustesConf.GetGrupo(grupoId: string): TEfdAjustesConf;
var
  I: Integer;
begin
  Result := TEfdAjustesConf.Create;

  for I := 0 to Self.Count - 1 do
    if Self.Items[I].id = grupoId then
      Result.Add(Self.Items[I].Clone);
end;

end.
