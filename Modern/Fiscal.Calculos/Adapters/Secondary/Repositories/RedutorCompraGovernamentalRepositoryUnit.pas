unit RedutorCompraGovernamentalRepositoryUnit;

interface

uses
  TipoComunsUnit,
  IRedutorCompraGovernamentalRepositoryUnit,
  CacheableRepositoryUnit,
  CurrencyNullableUnit;

type
  /// <summary>
  ///   Adaptador que consulta o redutor de compra governamental vigente para uma
  ///   data, filtrando apenas por vigencia (sem filtrar por ente governamental).
  /// </summary>
  RedutorCompraGovernamentalRepository = class(IRedutorCompraGovernamentalRepository)
  public
    function ObterValorRedutor(Data: TDate): CurrencyNullable; override;
  end;                   

implementation

uses
  SysUtils,
  ParameterValueUnit;

type
  CWrapper = class(RecordWrapper)
    Data: CurrencyNullable;
  end;

{ RedutorCompraGovernamentalRepository }

function RedutorCompraGovernamentalRepository.ObterValorRedutor(Data: TDate): CurrencyNullable;
var
  CacheKey: string;
  W: CWrapper;
begin
  CacheKey := DateToStr(Data);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'SELECT RCGO_VALOR ' +
    'FROM RTC_REDUTOR_COMPRA_GOV ' +
    'WHERE RCGO_INICIO_VIGENCIA <= :DATA ' +
    'AND (RCGO_FIM_VIGENCIA IS NULL OR RCGO_FIM_VIGENCIA >= :DATA) ',
    ParametersBuilder.Create(1)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := CurrencyNullable.NullInstance()

    else
      Result := FieldAsCurrencyNullable('RCGO_VALOR');

    W := CWrapper.Create;
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W);

  finally
    FreeQueryResult();
  end;
end;

end.
