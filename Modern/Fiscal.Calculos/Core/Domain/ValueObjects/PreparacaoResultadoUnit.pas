unit PreparacaoResultadoUnit;

interface

uses
  OperacaoTributacaoModelUnit,
  ValidacaoOutputUnit,
  TributosModelUnit;

type
  PreparacaoResultado = record
  private
    FOperacao: OperacaoTributacaoModel;
    FValidacoes: ValidacaoOutput;
  public
    class function Create(
      const Operacao: OperacaoTributacaoModel;
      const Validacoes: ValidacaoOutput
    ): PreparacaoResultado; static;

    property Operacao: OperacaoTributacaoModel read FOperacao;
    property Validacoes: ValidacaoOutput read FValidacoes;
    function IsValido: Boolean;
  end;

  ProcessamentoItemResult = class
  private
    FTributos: TributosModel;
    FValidacoes: ValidacaoOutput;
  public
    //function IsValido: Boolean;
    constructor Create(ATributos: TributosModel; const AValidacoes: ValidacaoOutput);
    destructor Destroy; override;

    function ExtrairResultado(): TributosModel;

    property Tributos: TributosModel read FTributos;
    property Validacoes: ValidacaoOutput read FValidacoes;
  end;

implementation

{ PreparacaoResultado }

class function PreparacaoResultado.Create(
  const Operacao: OperacaoTributacaoModel;
  const Validacoes: ValidacaoOutput
): PreparacaoResultado;
begin
  Result.FOperacao := Operacao;
  Result.FValidacoes := Validacoes;
end;

function PreparacaoResultado.IsValido: Boolean;
begin
  Result := Length(FValidacoes.Validacoes) = 0;
end;

{ ProcessamentoItemResult }

constructor ProcessamentoItemResult.Create(ATributos: TributosModel; const AValidacoes: ValidacaoOutput);
begin
  FTributos := ATributos;
  FValidacoes := AValidacoes;
end;

destructor ProcessamentoItemResult.Destroy;
begin
  FTributos.Free();

  inherited;
end;

function ProcessamentoItemResult.ExtrairResultado: TributosModel;
begin
  Result := FTributos;
  FTributos := nil;
end;

end.
