unit TratamentosTributariosRepositoryUnit;

interface

uses
  ITratamentosTributariosRepositoryUnit, TratamentoTributarioEtdUnit;

type
  TratamentosTributariosRepository = class(ITratamentosTributariosRepository)
  public
    function ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd; override;
  end;

implementation

uses
  SysUtils,
  CacheableRepositoryUnit;

type
  TTWrapper = class(RecordWrapper)
    Data: TratamentoTributarioEtd;
  end;

{ TratamentosTributariosRepository }

function TratamentosTributariosRepository.ObterTratamentoTributario(Id: Integer): TratamentoTributarioEtd;
var
  CacheKey: string;
  SQL: string;
  W: TTWrapper;
begin
  CacheKey := Format('ObterTratamentoTributario_%d', [ Id ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(W)) then
  begin
    Result := W.Data;
    Exit;
  end;

  with FConnection.CreateQuery(
    'select tt.trtr_id, tt.trtr_descricao, tt.trtr_exps_aliquota, tt.trtr_exps_aliquota_efetiva, ' +
    'tt.trtr_exps_base_calculo, tt.trtr_exps_tributo_calculado, tt.trtr_exps_tributo_devido, ' +
    'tt.trtr_exps_perc_diferimento, tt.trtr_exps_valor_diferimento, tt.trtr_in_incomp_com_suspensao, ' +
    'tt.trtr_in_exige_grupo_desoneracao, tt.trtr_in_possui_perc_reducao, tt.trtr_in_possui_ajuste, ' +
    'tt.trtr_in_possui_redutor, tt.trtr_inicio_vigencia, tt.trtr_fim_vigencia, tt.trtr_in_possui_monofasia ' +
    'from rtc_tratamento_tributario tt ' +
    'where tt.trtr_id = %d', [ Id ]
  ) do
  try
    if IsEmpty then
      Result := TratamentoTributarioEtd.NullInstance()
    else
      Result := TratamentoTributarioEtd.Create(
        FieldAsInteger('TRTR_ID'),
        FieldAsString('TRTR_DESCRICAO'),
        FieldAsStringNullable('TRTR_EXPS_ALIQUOTA'),
        FieldAsStringNullable('TRTR_EXPS_ALIQUOTA_EFETIVA'),
        FieldAsString('TRTR_EXPS_BASE_CALCULO'),
        FieldAsString('TRTR_EXPS_TRIBUTO_CALCULADO'),
        FieldAsString('TRTR_EXPS_TRIBUTO_DEVIDO'),
        FieldAsStringNullable('TRTR_EXPS_PERC_DIFERIMENTO'),
        FieldAsStringNullable('TRTR_EXPS_VALOR_DIFERIMENTO'),
        FieldAreEquals('TRTR_IN_INCOMP_COM_SUSPENSAO', 1),
        FieldAreEquals('TRTR_IN_EXIGE_GRUPO_DESONERACAO', 1),
        FieldAreEquals('TRTR_IN_POSSUI_PERC_REDUCAO', 1),
        FieldAreEquals('TRTR_IN_POSSUI_AJUSTE', 1),
        FieldAreEquals('TRTR_IN_POSSUI_REDUTOR', 1),
        FieldAreEquals('TRTR_IN_POSSUI_MONOFASIA', 1),
        FieldAsDate('TRTR_INICIO_VIGENCIA'),
        FieldAsDateNullable('TRTR_FIM_VIGENCIA')
      );

    W := TTWrapper.Create();
    W.Data := Result;

    FCacheObjs.Add(CacheKey, W, 1);
  finally
    FreeQueryResult();
  end;
end;

end.
