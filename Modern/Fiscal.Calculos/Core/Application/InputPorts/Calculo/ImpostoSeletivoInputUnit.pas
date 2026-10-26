unit ImpostoSeletivoInputUnit;

interface

uses TipoComunsUnit;

type
  ImpostoSeletivoInput = record
  private
    FInstance: RecordInstance;
    FCst: string;
    FCClassTrib: string;
    FBaseCalculo: Double;
    FQuantidade: Double;
    FUnidade: string;
    FImpostoInformado: Double;
  public
    class function NullInstance(): ImpostoSeletivoInput; static;
    class function Create(
      const Cst: string;
      const CClassTrib: string;
      BaseCalculo: Double;
      Quantidade: Double;
      const Unidade: string;
      ImpostoInformado: Double = 0.0
    ): ImpostoSeletivoInput; static;

    function IsValid(): Boolean;
    function IsNull(): Boolean;

    property Cst: string read FCst;
    property CClassTrib: string read FCClassTrib;
    property BaseCalculo: Double read FBaseCalculo write FBaseCalculo;
    property Quantidade: Double read FQuantidade;
    property Unidade: string read FUnidade;
    property ImpostoInformado: Double read FImpostoInformado;
    property ValorImpostoSeletivoInformado: Double read FImpostoInformado;
  end;

implementation

uses
  SysUtils;

{ ImpostoSeletivoInput }

class function ImpostoSeletivoInput.Create(const Cst, CClassTrib: string; BaseCalculo, Quantidade: Double;
  const Unidade: string; ImpostoInformado: Double): ImpostoSeletivoInput;
begin
  Result.FInstance := riNotNull;
  Result.FCst := Cst;
  Result.FCClassTrib := CClassTrib;
  Result.FBaseCalculo := BaseCalculo;
  Result.FQuantidade := Quantidade;
  Result.FUnidade := Unidade;
  Result.FImpostoInformado := ImpostoInformado;
end;

function ImpostoSeletivoInput.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

function ImpostoSeletivoInput.IsValid: Boolean;
begin
  Result := (Trim(FCst) <> '') and
    (Trim(FCClassTrib) <> ''); // add mais se necessario
end;

class function ImpostoSeletivoInput.NullInstance: ImpostoSeletivoInput;
begin
  Result.FInstance := riNull;
end;

end.