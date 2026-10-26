unit TipoServicoFactoryUnit;

interface

uses
  QueryResultUnit,
  TipoServicoEtdUnit;

type
  TipoServicoFactory = class
  public
    class function FromQueryResult(Q: QueryResult; const PrefixFieldNames: string = ''): TipoServicoEtd;
  end;

implementation

uses StatusRegistroEnumUnit;

{ TipoServicoFactory }

class function TipoServicoFactory.FromQueryResult(
  Q: QueryResult;
  const PrefixFieldNames: string
): TipoServicoEtd;

  function G(const FieldName: string): string;
  begin
    Result := PrefixFieldNames + FieldName;
  end;
begin        
  if Q.FieldIsNull(G('COD_SERVICO')) then
    Result := nil
  else
    Result := TipoServicoEtd.Create(
      Q.FieldAsInteger(G('COD_SERVICO')),
      Q.FieldAsString(G('DESC_SERVICO')),
      Q.FieldAsCurrencyNullable(G('ALIQ_ISS')),
      Q.FieldAsStringNullable(G('CNAE_SERV')),
      Q.FieldAsStringNullable(G('NFS_SERVICO')),
      Q.FieldAsStringNullable(G('CTRIBNAC')),
      Q.FieldAsStringNullable(G('CTRIBMUN')),
      Q.FieldAsStringNullable(G('CNBS')),
      Q.FieldAsStringNullable(G('CINDOP')),
      Q.FieldAsStringNullable(G('ISENTO_SERV')),
      Q.FieldAsStringNullable(G('N_INCIDENCIA_SERV')),
      Q.FieldAsIntNullable(G('ISS_RETIDO')),
      Q.FieldAsStringNullable(G('CST_PIS')),
      Q.FieldAsStringNullable(G('CST_PIS_ENT')),
      Q.FieldAsCurrencyNullable(G('IRRF_SERVICO')),
      Q.FieldAsCurrencyNullable(G('VL_TETO_IRRF')),
      Q.FieldAsCurrencyNullable(G('ALIQ_PIS_RET')),
      Q.FieldAsCurrencyNullable(G('ALIQ_COFINS_RET')),
      Q.FieldAsCurrencyNullable(G('ALIQ_CSSL_RET')),
      Q.FieldAsCurrencyNullable(G('VL_TETO_CONTRIB')),
      Q.FieldAsCurrencyNullable(G('ALIQ_CP_RET')),
      Q.FieldAsStringNullable(G('GRUPO_FISCAL_IBSCBS')),
      StatusRegistroUtils.FromInt(Q.FieldAsInteger(G('ATIVO')))
    );
end;

end.
