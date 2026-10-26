unit TransferenciaCBSRepositoryUnit;

interface

uses
  TipoComunsUnit,
  ITransferenciaCBSRepositoryUnit,
  CacheableRepositoryUnit,
  CurrencyNullableUnit;

type
  TransferenciaCBSRepository = class(ITransferenciaCBSRepository)
  public
    function ObterPercentualTransferencia(Data: TDate): CurrencyNullable; override;
  end;

implementation

uses
  SysUtils,
  ParameterValueUnit;

type
  CWrapper = class(RecordWrapper)
    Data: CurrencyNullable;
  end;

{ TransferenciaCBSRepository }

function TransferenciaCBSRepository.ObterPercentualTransferencia(Data: TDate): CurrencyNullable;
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
    'SELECT TCEG_VALOR ' +
    'FROM RTC_TRANSFERENCIA_CBS_ENTE_GOV ' +
    'WHERE TCEG_INICIO_VIGENCIA <= :DATA ' +
    'AND (TCEG_FIM_VIGENCIA IS NULL OR TCEG_FIM_VIGENCIA >= :DATA) ',
    ParametersBuilder.Create(1)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := CurrencyNullable.NullInstance()

    else
    begin
      Result := FieldAsCurrencyNullable('TCEG_VALOR');

      W := CWrapper.Create;
      W.Data := Result;

      FCacheObjs.Add(CacheKey, W);
    end;

  finally
    FreeQueryResult();
  end;
end;

end.
