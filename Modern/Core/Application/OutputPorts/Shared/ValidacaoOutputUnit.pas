unit ValidacaoOutputUnit;

interface

uses
  ValidacaoItemOutputUnit;

type

  ValidacaoOutput = record
  private
    FValidacoes: ValidacaoItensOutput;
  public
    class function Create(): ValidacaoOutput; static;

    procedure Add(Validacao: ValidacaoItemOutput); overload;
    procedure Add(const AText: string); overload;
    procedure Add(const AText: string; const Args : Array of const); overload;
    procedure AddDistinct(Validacao: ValidacaoItemOutput); overload;
    procedure AddDistinct(const AText: string); overload;
    procedure AddDistinct(const AText: string; const Args : Array of const); overload;
    procedure Add(const AValidacoes: ValidacaoItensOutput); overload;
    procedure Add(const Validacao: ValidacaoOutput); overload;

    function IsValid(): Boolean;
    procedure RaiseIfNotIsValid();

    property Validacoes: ValidacaoItensOutput read FValidacoes;
  end;

implementation

uses
  SysUtils, StrUtils, EValidacaoNegocioUnit;

{ ValidacaoOutput }

procedure ValidacaoOutput.Add(Validacao: ValidacaoItemOutput);
begin
  SetLength(FValidacoes, Length(FValidacoes) + 1);

  FValidacoes[High(FValidacoes)] := Validacao;
end;

procedure ValidacaoOutput.AddDistinct(Validacao: ValidacaoItemOutput);
var
  I: Integer;
begin
  for I := Low(FValidacoes) to High(FValidacoes) do
    if FValidacoes[I].Codigo = Validacao.Codigo then
      Exit;

  Add(Validacao);
end;

procedure ValidacaoOutput.AddDistinct(const AText: string);
var
  I: Integer;
begin
  for I := Low(FValidacoes) to High(FValidacoes) do
    if FValidacoes[I].Detalhe = AText then
      Exit;

  Add( AText );
end;

procedure ValidacaoOutput.Add(const AValidacoes: ValidacaoItensOutput);
var
  A, F: Integer;
  jaExiste: Boolean;
begin
  for A := 0 to High(AValidacoes) do
  begin
    jaExiste := False;
    for F := 0 to High(FValidacoes) do
      if (AValidacoes[A].Codigo = FValidacoes[F].Codigo)
        and (AValidacoes[A].Detalhe = FValidacoes[F].Detalhe) then
      begin
        jaExiste := True;
        Break;
      end;

    if not jaExiste then
      Add(AValidacoes[A]);
  end;
end;

procedure ValidacaoOutput.Add(const Validacao: ValidacaoOutput);
begin
  Add(Validacao.Validacoes);
end;

procedure ValidacaoOutput.AddDistinct(const AText: string; const Args: array of const);
begin
  AddDistinct( Format(AText, Args) );
end;

class function ValidacaoOutput.Create: ValidacaoOutput;
begin
  SetLength(Result.FValidacoes, 0);
end;

function ValidacaoOutput.IsValid: Boolean;
begin
  Result := Length(FValidacoes) = 0;
end;

procedure ValidacaoOutput.RaiseIfNotIsValid;
var
  S: string;
  I: Integer;
begin
  if not Self.IsValid() then
  begin
    S := '';
    for I := Low(FValidacoes) to High(FValidacoes) do
    begin
      if I <> Low(FValidacoes) then
        S := S + sLineBreak;

      S := S
        + IfThen((FValidacoes[I].Codigo <> 0) and (FValidacoes[I].Codigo <> 999), IntToStr(FValidacoes[I].Codigo) + ' - ')
        + FValidacoes[I].Detalhe;
    end;

    raise EValidacaoNegocio.Create( S );
  end;
end;

procedure ValidacaoOutput.Add(const AText: string);
begin
  Add( ValidacaoItemOutput.Create( AText ));
end;

procedure ValidacaoOutput.Add(const AText: string; const Args: array of const);
begin
  Add( ValidacaoItemOutput.CreateFmt( AText, Args ));
end;

end.
