unit ValidacaoItemOutputUnit;

interface

type
  ValidacaoItemOutput = record
  private
    FCodigo: Integer;
    FDetalhe: string;
  public
    class function Create(Codigo: Integer; const Detalhe: string = ''): ValidacaoItemOutput; overload; static;
    class function Create(const Detalhe: string): ValidacaoItemOutput; overload; static;
    class function CreateFmt(
    Codigo: Integer; const Detalhe: string; const Args : Array of const
    ): ValidacaoItemOutput; overload; static;
    class function CreateFmt(
      const Detalhe: string; const Args : Array of const
    ): ValidacaoItemOutput; overload; static;

    function Clone(): ValidacaoItemOutput;

    property Codigo: Integer read FCodigo;
    property Detalhe: string read FDetalhe;
  end;

  ValidacaoItensOutput = array of ValidacaoItemOutput;

implementation

uses
  SysUtils;

{ ValidacaoItemOutput }

function ValidacaoItemOutput.Clone: ValidacaoItemOutput;
begin
  Result := ValidacaoItemOutput.Create( FCodigo, FDetalhe );
end;

class function ValidacaoItemOutput.Create(Codigo: Integer; const Detalhe: string): ValidacaoItemOutput;
begin
  Result.FCodigo := Codigo;
  Result.FDetalhe := Detalhe;
end;

class function ValidacaoItemOutput.CreateFmt(Codigo: Integer; const Detalhe: string;
  const Args: array of const): ValidacaoItemOutput;
begin
  Result.FCodigo := Codigo;
  if Length(Args) > 0 then
    Result.FDetalhe := Format(Detalhe, Args)
  else
    Result.FDetalhe := Detalhe;
end;

class function ValidacaoItemOutput.Create(const Detalhe: string): ValidacaoItemOutput;
begin
  Result := ValidacaoItemOutput.Create( 999, Detalhe );
end;

class function ValidacaoItemOutput.CreateFmt(const Detalhe: string; const Args: array of const): ValidacaoItemOutput;
begin
  Result := ValidacaoItemOutput.CreateFmt( 999, Detalhe, Args );
end;

end.