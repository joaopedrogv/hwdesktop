unit StubSituacaoTributariaRepositoryUnit;

interface

uses
  ISituacaoTributariaRepositoryUnit,
  SituacaoTributariaEtdUnit,
  TipoTributoEnumUnit;

type
  TSituacaoTributariaRepositoryStub = class(ISituacaoTributariaRepository)
  private
    FSituacaoToReturn: SituacaoTributariaEtd;
    FCallCount: Integer;
    FLastCst: string;
    FLastTributo: TipoTributoEnum;
    FLastData: TDate;
  public
    constructor Create; reintroduce;

    function ConsultarSituacaoTributariaPorCodigo(const CST: string;
      IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd; override;

    property SituacaoToReturn: SituacaoTributariaEtd read FSituacaoToReturn write FSituacaoToReturn;
    property CallCount: Integer read FCallCount;
    property LastCst: string read FLastCst;
    property LastTributo: TipoTributoEnum read FLastTributo;
    property LastData: TDate read FLastData;
  end;

implementation

constructor TSituacaoTributariaRepositoryStub.Create;
begin
  inherited Create(nil);
  FSituacaoToReturn := SituacaoTributariaEtd.NullInstance();
end;

function TSituacaoTributariaRepositoryStub.ConsultarSituacaoTributariaPorCodigo(
  const CST: string; IdTributo: TipoTributoEnum; Data: TDate): SituacaoTributariaEtd;
begin
  Inc(FCallCount);
  FLastCst := CST;
  FLastTributo := IdTributo;
  FLastData := Data;
  Result := FSituacaoToReturn;
end;

end.