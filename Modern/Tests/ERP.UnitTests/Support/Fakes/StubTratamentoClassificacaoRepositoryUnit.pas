unit StubTratamentoClassificacaoRepositoryUnit;

interface

uses
  ITratamentoClassificacaoRepositoryUnit,
  TratamentoClassificacaoEtdUnit,
  TratamentoClassificacaoModelUnit,
  TipoTributoEnumUnit;

type
  TTratamentoClassificacaoRepositoryStub = class(ITratamentoClassificacaoRepository)
  private
    FTratamentoToReturn: TratamentoClassificacaoEtd;
    FCallCount: Integer;
    FLastCClassTrib: string;
    FLastTributo: TipoTributoEnum;
    FLastData: TDate;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    function ObterTratamentoClassificacaomodel(ClassificacaoFiscalId: Integer;
      Data: TDate): TratamentoClassificacaoModel; override;
    function ObterTratamentoClassificacao(ClassificacaoFiscalId: Integer;
      Data: TDate): TratamentoClassificacaoEtd; overload; override;
    function ObterTratamentoClassificacao(const cClassTrib: string;
      TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd; overload; override;

    property TratamentoToReturn: TratamentoClassificacaoEtd read FTratamentoToReturn write FTratamentoToReturn;
    property CallCount: Integer read FCallCount;
    property LastCClassTrib: string read FLastCClassTrib;
    property LastTributo: TipoTributoEnum read FLastTributo;
    property LastData: TDate read FLastData;
  end;

implementation

uses
  SysUtils;

constructor TTratamentoClassificacaoRepositoryStub.Create;
begin
  inherited Create(nil);
end;

destructor TTratamentoClassificacaoRepositoryStub.Destroy;
begin
  FTratamentoToReturn.Free;
  inherited;
end;

function TTratamentoClassificacaoRepositoryStub.ObterTratamentoClassificacaomodel(
  ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoModel;
begin
  raise Exception.Create('Unexpected call to TTratamentoClassificacaoRepositoryStub.ObterTratamentoClassificacaomodel');
end;

function TTratamentoClassificacaoRepositoryStub.ObterTratamentoClassificacao(
  ClassificacaoFiscalId: Integer; Data: TDate): TratamentoClassificacaoEtd;
begin
  raise Exception.Create('Unexpected call to TTratamentoClassificacaoRepositoryStub.ObterTratamentoClassificacao');
end;

function TTratamentoClassificacaoRepositoryStub.ObterTratamentoClassificacao(
  const cClassTrib: string; TipoTributo: TipoTributoEnum; Data: TDate): TratamentoClassificacaoEtd;
begin
  Inc(FCallCount);
  FLastCClassTrib := cClassTrib;
  FLastTributo := TipoTributo;
  FLastData := Data;
  Result := FTratamentoToReturn;
  FTratamentoToReturn := nil;
end;

end.