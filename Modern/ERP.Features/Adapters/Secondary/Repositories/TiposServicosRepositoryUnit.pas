unit TiposServicosRepositoryUnit;

interface

uses
  SysUtils, Classes,
  ITiposServicosRepositoryUnit,
  TipoServicoEtdUnit,
  AlteracaoFiscalNFSeModelUnit,
  QueryResultUnit;

type
  TiposServicosRepository = class(ITiposServicosRepository)
  private
    function TratarCampoNFS_SERVICO(const Value: string): string;
    function TratarCampoCOD_SERV_LEICOMPLEMENTAR_166(const Value: string): string;
    function GetSQLBase(): string;
    //function CreateItemFromQuery(Q: QueryResult): TipoServicoEtd;
  public
    function GetById(Codigo: Integer): TipoServicoEtd; override;
    procedure AtualizarFiscalNFSe(const Input: AlteracaoFiscalNFSeModel); override;
  end;

implementation

uses
  MaskUtils,
  StatusRegistroEnumUnit, TipoServicoFactoryUnit, BaseRepositoryUnit, ArrayServiceUnit, StringServiceUnit,
  ParameterValueUnit;

{ TiposServicosRepository }
{
function TiposServicosRepository.CreateItemFromQuery(Q: QueryResult): TipoServicoEtd;
begin
  Result := TipoServicoEtd.Create(
    Q.FieldAsInteger('COD_SERVICO'),
    Q.FieldAsString('DESC_SERVICO'),
    Q.FieldAsCurrencyNullable('ALIQ_ISS'),
    Q.FieldAsStringNullable('CNAE_SERV'),
    Q.FieldAsStringNullable('NFS_SERVICO'),
    Q.FieldAsStringNullable('CTRIBNAC'),
    Q.FieldAsStringNullable('CTRIBMUN'),
		Q.FieldAsStringNullable('CNBS'),
		Q.FieldAsStringNullable('ISENTO_SERV'),
		Q.FieldAsStringNullable('N_INCIDENCIA_SERV'),
		Q.FieldAsIntNullable('ISS_RETIDO'),
		Q.FieldAsStringNullable('CST_PIS'),
		Q.FieldAsCurrencyNullable('IRRF_SERVICO'),
		Q.FieldAsCurrencyNullable('VL_TETO_IRRF'),
		Q.FieldAsCurrencyNullable('ALIQ_PIS_RET'),
		Q.FieldAsCurrencyNullable('ALIQ_COFINS_RET'),
		Q.FieldAsCurrencyNullable('ALIQ_CSSL_RET'),
		Q.FieldAsCurrencyNullable('VL_TETO_CONTRIB'),
		Q.FieldAsStringNullable('GRUPO_FISCAL_IBSCBS'),
		StatusRegistroUtils.FromInt(Q.FieldAsInteger('ATIVO'))
	);
end;
}
procedure TiposServicosRepository.AtualizarFiscalNFSe(const Input: AlteracaoFiscalNFSeModel);
var
  SQLBuilder: TStrings;
  Params: IParametersBuilder;
begin
  if Length(Input.ServicosId) = 0 then
    Exit;

  Params := ParametersBuilder.Create();

  SQLBuilder := TStringList.Create();
  try
    if Input.CCNAE.HasValue then
    begin
      SQLBuilder.Add('CNAE_SERV = :CNAE_SERV');
      Params.Add(Input.CCNAE.Value);
    end;

    if Input.CLC116.HasValue then
    begin
      SQLBuilder.Add('NFS_SERVICO = :NFS_SERVICO');
      Params.Add(TratarCampoNFS_SERVICO(Input.CLC116.Value));

      SQLBuilder.Add('COD_SERV_LEICOMPLEMENTAR_166 = :COD_SERV_LEICOMPLEMENTAR_166');
      Params.Add(TratarCampoCOD_SERV_LEICOMPLEMENTAR_166(Input.CLC116.Value));
    end;

    if Input.CTribNac.HasValue then
    begin
      SQLBuilder.Add('CTRIBNAC = :CTRIBNAC');
      Params.Add(Input.CTribNac.Value);
    end;

    if Input.CTribMun.HasValue then
    begin
      SQLBuilder.Add('CTRIBMUN = :CTRIBMUN');
      Params.Add(Input.CTribMun.Value);
    end;

    if Input.CNBS.HasValue then
    begin
      SQLBuilder.Add('CNBS = :CNBS');
      Params.Add(Input.CNBS.Value);
    end;

    if Input.CIndOp.HasValue then
    begin
      SQLBuilder.Add('CINDOP = :CINDOP');
      Params.Add(Input.CIndOp.Value);
    end;

    FConnection.ExecuteCommand( Format(
      'UPDATE TIPO_SERVICO SET ' +
      '%s ' +
      'WHERE COD_SERVICO IN (%s) ', [
        StringService.Join( ',', SQLBuilder),
        StringService.Join( ',', ArrayService.IntArrayToStringArray(Input.ServicosId))
      ]),
      Params.Build()
    );
  finally
    SQLBuilder.Free();
  end;
end;

function TiposServicosRepository.GetById(Codigo: Integer): TipoServicoEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := Format('cod_%d', [ Codigo ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery( GetSQLBase() +
    ' where t.cod_servico = %d ', [ Codigo ]
  );
  try

    if Q.IsEmpty then
      Result := nil

    else
      Result := TipoServicoFactory.FromQueryResult( Q, '' );

    FCacheObjs.Add( CacheKey, Result, 2 );

  finally
    Q.Free();
  end;
end;

function TiposServicosRepository.GetSQLBase: string;
begin
  // Se mudar aqui tem de mudar em INFSeRepositoryUnit, GetSqlDPS
  // ou seria o caso de colocar no factory
	Result :=
		'select ' +
		't.cod_servico, t.desc_servico, t.aliq_iss, t.ativo, t.nfs_servico, t.cnae_serv, t.iss_retido, t.ctribnac, t.ctribmun, ' +
		't.cnbs, t.cindop, t.isento_serv, t.n_incidencia_serv, t.cst_pis, t.cst_pis_ent, t.grupo_fiscal_ibscbs, ' +
		'te.irrf_servico, te.vl_teto_irrf, te.aliq_pis_ret, te.aliq_cofins_ret, te.aliq_cssl_ret, te.vl_teto_contrib, ' +
    'te.aliq_cp_ret ' +
		'from tipo_servico t ' +
		'left join tiposerviconfse te on te.cod_tpservico = t.nfs_servico '
end;

function TiposServicosRepository.TratarCampoCOD_SERV_LEICOMPLEMENTAR_166(const Value: string): string;
begin
  if Trim(Value) <> '' then
    Result := StringService.PadLeft(StringService.OnlyNumber(Value), 4, '0')
  else
    Result := '';  
end;

function TiposServicosRepository.TratarCampoNFS_SERVICO(const Value: string): string;
begin
  if Trim(Value) <> '' then
    Result := FormatMaskText('00.00;0;_', StringService.PadLeft(StringService.OnlyNumber(Value), 4, '0'))
  else
    Result := '';
end;

end.


