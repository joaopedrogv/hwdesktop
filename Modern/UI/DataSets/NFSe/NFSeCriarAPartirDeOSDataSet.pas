unit NFSeCriarAPartirDeOSDataSet;

interface       

uses
  DataSetGrid, DB, FieldsConfigUnit, TipoComunsUnit;

type
  TNFSeCriarAPartirDeOSDataSetSetup = record
  private
    AgruparPorCTribNac: Boolean;
    SelectionField: string;
  public
    class function Create(
      AgruparPorCTribNac: Boolean;
      const SelectionField: string
    ): TNFSeCriarAPartirDeOSDataSetSetup; static;
  end;

  TNFSeCriarAPartirDeOSDataSet = class(TDataSetGrid)
  private
    FNumerosOS: TArrayInteger;
    FSQL: string;
    FFieldGrupo: string;
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();
    procedure Setup(Builder: IFieldsConfigBuilder; const Input: TNFSeCriarAPartirDeOSDataSetSetup);

    procedure Executar(const NumerosOS: TArrayInteger);
    function GetSelecionados(): TArrayInteger;
  end;

implementation

uses
  SysUtils, StrUtils,
  uDataSet_OOP, ArrayServiceUnit, StringServiceUnit, Query_OOP, DFeTypesUnit, NumberServiceUnit, MasksConstsUnit;
            

{ TNFSeCriarAPartirDeOSDataSetSetup }

class function TNFSeCriarAPartirDeOSDataSetSetup.Create(AgruparPorCTribNac: Boolean;
  const SelectionField: string): TNFSeCriarAPartirDeOSDataSetSetup;
begin
  Result.AgruparPorCTribNac := AgruparPorCTribNac;
  Result.SelectionField := SelectionField;
end;

{ TNFSeCriarAPartirDeOSDataSet }

constructor TNFSeCriarAPartirDeOSDataSet.Create();
begin
  inherited Create( 'cdsNFSeCriarDaOS', 'PEDVENDA' );

  FSQL :=
    'select c.cod_cliente, c.nome_cliente, c.situacao, c.cpfcnpj, c.tipo_ente_gov, c.ret_fed_nfs, ' +
    '    c.%s, (c.valor_Servicos + c.valor_terceiros) Total_Servicos, ' +
    '    c.iss_ret_cli, c.iss_ret_serv, c.irrf_ret, c.csll_ret, c.pis_ret, c.cofins_ret, c.cp_ret, ' +
    '    c.valor_Servicos, c.valor_terceiros ' +
    'from  ( ' +
    '  SELECT OS.cod_cliente, ts.nfs_servico, ts.ctribnac, cl.nome_cliente, cl.cpfcgc cpfcnpj, cl.tipo_ente_gov, cl.ret_fed_nfs, ' +
    '       case ' +  
    '        when coalesce(s.n_nf, 0) > 0 then ''Indisponível'' ' +
    '        when ns.id is null then ''Disponível'' ' +
    '        when ns.situacao in (1,2) then ''Iniciado e Disponível'' ' +
    '        when ns.situacao in (3,4) then ''Em Emissão'' ' +
    '        else ''Indisponível'' ' +
    '      end situacao, ' +
    '      sum(coalesce(s.valor_tot_serv, 0) + coalesce(s.rateio_acresc, 0) - coalesce(s.rateio_desc, 0)) valor_Servicos, ' +
    '      coalesce(sum( ' +
    '          (coalesce(s.valor_tot_serv, 0) + coalesce(s.rateio_acresc, 0) - coalesce(s.rateio_desc, 0)) ' +
    '          / nullif(t.total_serv, 0) ' +
    '          * coalesce(t.total_terc, 0) ' +
    '      ), 0) as valor_terceiros, ' + 
    '      sum(iif(cl.iss_retido = 1, 1, 0)) iss_ret_cli, ' + 
    '      sum(iif(ts.iss_retido = 1, 1, 0)) iss_ret_serv, ' + 
    '      sum(iif(tse.irrf_servico > 0, 1, 0)) irrf_ret, ' + 
    '      sum(iif(tse.aliq_cssl_ret > 0, 1, 0)) csll_ret, ' + 
    '      sum(iif(tse.aliq_pis_ret > 0, 1, 0)) pis_ret, ' + 
    '      count(iif(tse.aliq_cofins_ret > 0, 1, 0)) cofins_ret, ' + 
    '      sum(iif(tse.aliq_cp_ret > 0, 1, 0)) cp_ret ' + 
    '  from pedvenda os ' + 
    '  inner join clientes cl on cl.cod_cliente = os.cod_cliente and cl.cod_empresa = os.cod_empresa ' + 
    '  left join pedvenda_serv s on s.nped = os.nped and s.tipo = os.tipo and s.cod_empresa = os.cod_empresa ' +
    '  left join nfse ns on s.nfse_id is not null and ns.id = s.nfse_id and ns.cod_empresa = s.cod_empresa ' +
    '  left join tipo_servico ts on ts.cod_servico = s.cod_servico ' + 
    '  left join tiposerviconfse tse on tse.cod_tpservico = ts.nfs_servico ' +
    '  inner join ( ' + 
    '      select ' +
    '          s.nped, s.tipo, s.cod_empresa, ' +
    '          sum(coalesce(s.valor_tot_serv, 0) + coalesce(s.rateio_acresc, 0) - coalesce(s.rateio_desc, 0)) as total_serv, ' +
    '          (select sum(vl_servt) from pedvenda_serv_terc where nped = s.nped and tipo = s.tipo and cod_empresa = s.cod_empresa) as total_terc ' +
    '      from pedvenda_serv s ' +
    '      group by 1,2,3 ' +
    '  ) t on os.nped = t.nped and os.tipo = t.tipo and os.cod_empresa = t.cod_empresa ' +
    '  where os.tipo = ''OS'' and os.cod_empresa = %d and os.data_fech is not null ' +
    '    and os.nped in (%s) ' +
    '  group by 1,2,3,4,5,6,7,8 ' +
    '  order by nome_cliente, cod_cliente ' +
    ') as c '

//    'select c.cod_cliente, c.nome_cliente, c.cpfcnpj, c.tipo_ente_gov, c.ret_fed_nfs, ' +
//    '    c.%s, (c.valor_Servicos + c.valor_terceiros) Total_Servicos, ' +
//    '    c.iss_ret_cli, c.iss_ret_serv, c.irrf_ret, c.csll_ret, c.pis_ret, c.cofins_ret, c.cp_ret ' +
//    'from  ( ' +
//    '  select ' +
//    '    cl.cod_cliente, cl.nome_cliente, cl.cpfcgc cpfcnpj, cl.tipo_ente_gov, cl.ret_fed_nfs, ' +
//    '    ts.nfs_servico, ts.ctribnac, ' +
//    '    sum(coalesce(s.valor_tot_serv, 0) + coalesce(s.rateio_acresc, 0) - coalesce(s.rateio_desc, 0)) valor_Servicos, ' +
//    '    sum(coalesce(t.vl_servt, 0)) valor_terceiros, ' +
//    '    sum(iif(cl.iss_retido = 1, 1, 0)) iss_ret_cli, ' +
//    '    sum(iif(ts.iss_retido = 1, 1, 0)) iss_ret_serv, ' +
//    '    sum(iif(tse.irrf_servico > 0, 1, 0)) irrf_ret, ' +
//    '    sum(iif(tse.aliq_cssl_ret > 0, 1, 0)) csll_ret, ' +
//    '    sum(iif(tse.aliq_pis_ret > 0, 1, 0)) pis_ret, ' +
//    '    count(iif(tse.aliq_cofins_ret > 0, 1, 0)) cofins_ret, ' +
//    '    sum(iif(tse.aliq_cp_ret > 0, 1, 0)) cp_ret ' +
//    '  from pedvenda os ' +
//    '  inner join clientes cl on cl.cod_cliente = os.cod_cliente and cl.cod_empresa = os.cod_empresa ' +
//    '  left join pedvenda_serv s on s.nped = os.nped and s.tipo = os.tipo and s.cod_empresa = os.cod_empresa ' +
//    '  left join pedvenda_serv_terc t on t.nped = os.nped and t.tipo = os.tipo and t.cod_empresa = os.cod_empresa ' +
//    '  left join tipo_servico ts on ts.cod_servico = s.cod_servico ' +
//    '  left join tiposerviconfse tse on tse.cod_tpservico = ts.nfs_servico ' +
//    '  where os.tipo = ''OS'' and os.cod_empresa = %d and os.data_fech is not null ' +
//    '  and os.nped in (%s) ' +
//    '  group by 1,2,3,4,5,6,7 ' +
//    '  order by nome_cliente, cod_cliente' +
//    ') as c '
  ;
end;

procedure TNFSeCriarAPartirDeOSDataSet.GetText(Sender: TField; var Text: string; DisplayText: Boolean);
const
  CAMPOS_RET: array[0..6] of string = (
    'iss_ret_cli', 'iss_ret_serv', 'irrf_ret', 'csll_ret', 'pis_ret', 'cofins_ret', 'cp_ret'
  );
  RET_FED_STR: array[0..3] of string = (
    'Sem retenção', 'Com Retenção do IR', 'Com Retenção PIS, COFINS e CSLL', 'Com Retenção do IR, PIS, COFINS e CSLL'
  );
begin
  if Sender.FieldName = 'TIPO_ENTE_GOV' then
    Text := TipoEnteGovEnumStr[TipoEnteGovEnum(Sender.AsInteger)]

  else if Sender.FieldName = 'RET_FED_NFS' then
    Text := RET_FED_STR[NumberService.RangeOrDefault(0, 3, Sender.AsInteger, 0)]

  else if MatchText(Sender.FieldName, CAMPOS_RET) then
    if Sender.AsInteger > 0 then
      Text := 'Sim'
    else
      Text := 'Não';
end;

procedure TNFSeCriarAPartirDeOSDataSet.Setup(
  Builder: IFieldsConfigBuilder;
  const Input: TNFSeCriarAPartirDeOSDataSetSetup
);
var
  sFieldGrupo, sCaption: string;
begin
  if Input.SelectionField <> '' then
    Builder.Add(Input.SelectionField, '..', fvSempreVisivel);

  FFieldGrupo := IfThen(Input.AgruparPorCTribNac, 'ctribnac', 'nfs_servico');
  sCaption := IfThen(Input.AgruparPorCTribNac, 'Cod Trib Nacional', 'Cod LC 116');

  ConfigFields( Builder
    .Add('cod_empresa,tipo', '', fvInvisivel)
    .Add('cod_cliente', 'Cod Cliente')
    .Add('nome_cliente', 'Cliente - Nome').Width(200)
    .Add('situacao', 'Situação')//.Width(200)
    //.Add('processamento_nfse', 'Processamento')
    .Add('total_servicos', 'Total Serviços', '', MSK_DEC_00)
    .Add(FFieldGrupo, sCaption)
    .Add('iss_ret_cli', 'Retenção ISS - Cliente', GetText)
    .Add('iss_ret_serv', 'Retenção ISS - Serviço', GetText)
    .Add('irrf_ret', 'Retenção IRRF', GetText)
    .Add('csll_ret', 'Retenção CSLL', GetText)
    .Add('pis_ret', 'Retenção PIS', GetText)
    .Add('cofins_ret', 'Retenção COFINS', GetText)
    .Add('cp_ret', 'Retenção CP', GetText)
    .Add('cpfcnpj', 'Cliente - CPF/CNPJ')
    .Add('tipo_ente_gov', 'Cliente - Tipo Ente Governamental', GetText)
    .Add('ret_fed_nfs', 'Cliente - Retenções Fedeais', GetText)
  );
  CreateFieldsBySQL( Format( FSQL, [ FFieldGrupo, -1, '-1' ]) );

  if Input.SelectionField <> '' then
    CreateSelectionField(Input.SelectionField);
end;

procedure TNFSeCriarAPartirDeOSDataSet.Executar(const NumerosOS: TArrayInteger);
var
  sNumeros: string;
begin
  FNumerosOS := NumerosOS;

  sNumeros := StringService.Default( StringService.Join(',',
    ArrayService.IntArrayToStringArray(NumerosOS)
  ), '-1');

  ClientOpen( FSQL, [ FFieldGrupo, EmpresaId, sNumeros ]);
end;

function TNFSeCriarAPartirDeOSDataSet.GetSelecionados: TArrayInteger;
var
  sNumeros: string;
  iCount: Integer;
begin
  sNumeros := StringService.Default( StringService.Join(',',
    ArrayService.IntArrayToStringArray(FNumerosOS)
  ), '-1');

  iCount := 0;
  SetLength( Result, 0);

  Self.storeRecNo;
  dataSet.DisableControls();
  try
    dataSet.First();
    while not dataSet.Eof do
    begin
      if not Assigned(SelectionField) or SelectionField.AsBoolean then
      begin
        queryCons.Table('pedvenda', 'nped')
          .Equals('cod_cliente', fint('cod_cliente'))
          .Equals('cod_empresa', EmpresaId)
          .Equals('tipo', 'OS')
          .InCond('nped', sNumeros)
          .Open();

        while not queryCons.Eof do
        begin
          if iCount >= Length(Result) then
            SetLength( Result, Length(Result) + 4);

          Result[iCount] := queryCons.fint('nped');
          Inc(iCount);

          queryCons.Next();
        end;

        queryCons.Close();
      end;
      dataSet.Next();
    end;

    SetLength( Result, iCount);

  finally
    Self.restoreRecNo;
    dataSet.EnableControls();
  end;
end;

end.
