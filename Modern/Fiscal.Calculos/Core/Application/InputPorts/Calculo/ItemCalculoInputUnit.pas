unit ItemCalculoInputUnit;

interface

uses
  TributacaoRegularInputUnit, ImpostoSeletivoInputUnit, ComponentesBaseCalculoInputUnit,
  CurrencyNullableUnit;

type
  ItemCalculoInput =  record
  private
    FCSTInt: SmallInt;
    FNBS: string;
    FcClassTrib: string;
    FTributacaoRegular: TributacaoRegularInput;
    FNumero: Integer;
    FNCM: string;
    FImpostoSeletivo: ImpostoSeletivoInput;
    FUnidade: string;
    FQuantidade: CurrencyNullable;
    FBaseCalculo: CurrencyNullable;
    FCST: string;
    FGComponentesBC: ComponentesBaseCalculoInput;
    function GetHasGComponentesBC: Boolean;
  public
    class function Create(
      Numero: Integer;
      const NCMouNBS: string;
      const cClassTrib: string;
      const CST: string;
      const ImpostoSeletivo: ImpostoSeletivoInput;
      const TributacaoRegular: TributacaoRegularInput
    ): ItemCalculoInput; overload; static;

    class function Create(
      Numero: Integer;
      const NCMouNBS: string;
      const cClassTrib: string;
      const CST: string;
      const ImpostoSeletivo: ImpostoSeletivoInput;
      const TributacaoRegular: TributacaoRegularInput;
      const BaseCalculo: CurrencyNullable
    ): ItemCalculoInput; overload; static;

    class function Create(
      Numero: Integer;
      const NCMouNBS: string;
      const cClassTrib: string;
      const CST: string;
      const ImpostoSeletivo: ImpostoSeletivoInput;
      const TributacaoRegular: TributacaoRegularInput;
      const BaseCalculo: CurrencyNullable;
      const Quantidade: CurrencyNullable
    ): ItemCalculoInput; overload; static;

    class function Create(
      Numero: Integer;
      const NCMouNBS: string;
      const cClassTrib: string;
      const CST: string;
      const ImpostoSeletivo: ImpostoSeletivoInput;
      const TributacaoRegular: TributacaoRegularInput;
      const BaseCalculo: CurrencyNullable;
      const Quantidade: CurrencyNullable;
      const Unidade: string
    ): ItemCalculoInput; overload; static;

    class function Create(
      Numero: Integer;
      const NCMouNBS: string;
      const cClassTrib: string;
      const CST: string;
      const ImpostoSeletivo: ImpostoSeletivoInput;
      const TributacaoRegular: TributacaoRegularInput;
      const BaseCalculo: CurrencyNullable;
      const Quantidade: CurrencyNullable;
      const Unidade: string;
      const GComponentesBC: ComponentesBaseCalculoInput
    ): ItemCalculoInput; overload; static;

    class function Create(
      Numero: Integer;
      const NCMouNBS: string;
      const cClassTrib: string;
      const CST: string;
      const ImpostoSeletivo: ImpostoSeletivoInput;
      const TributacaoRegular: TributacaoRegularInput;
      const BaseCalculo: Currency;
      Quantidade: Currency = 0;
      const Unidade: string = ''
    ): ItemCalculoInput; overload; static;

    function QuantidadeEfetiva: Currency;

    /// <summary>
    ///   Numero sequencial do item
    /// </summary>
    property Numero: Integer read FNumero;
    property NCM: string read FNCM;
    property NBS: string read FNBS;
    property CST: string read FCST;
    property cClassTrib: string read FcClassTrib;
    property BaseCalculo: CurrencyNullable read FBaseCalculo write FBaseCalculo;
    property Quantidade: CurrencyNullable read FQuantidade write FQuantidade;
    property Unidade: string read FUnidade;
    property GComponentesBC: ComponentesBaseCalculoInput read FGComponentesBC;
    property HasGComponentesBC: Boolean read GetHasGComponentesBC;

    /// <summary>
    ///   Usado para validacao no Imposto Seletivo
    /// </summary>
    property ImpostoSeletivo: ImpostoSeletivoInput read FImpostoSeletivo write FImpostoSeletivo;

    /// <summary>
    ///   Usado para validacao na Desoneracao
    /// </summary>
    property TributacaoRegular: TributacaoRegularInput read FTributacaoRegular;
    property CSTInt: SmallInt read FCSTInt;
  end;

implementation

uses
  SysUtils;

{ ItemCalculoInput }

class function ItemCalculoInput.Create(
  Numero: Integer;
  const NCMouNBS, cClassTrib, CST: string;
  const ImpostoSeletivo: ImpostoSeletivoInput;
  const TributacaoRegular: TributacaoRegularInput
  ): ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    Numero,
    NCMouNBS,
    cClassTrib,
    CST,
    ImpostoSeletivo,
    TributacaoRegular,
    CurrencyNullable.NullInstance()
  );
end;

class function ItemCalculoInput.Create(
  Numero: Integer;
  const NCMouNBS, cClassTrib, CST: string;
  const ImpostoSeletivo: ImpostoSeletivoInput;
  const TributacaoRegular: TributacaoRegularInput;
  const BaseCalculo: CurrencyNullable
  ): ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    Numero,
    NCMouNBS,
    cClassTrib,
    CST,
    ImpostoSeletivo,
    TributacaoRegular,
    BaseCalculo,
    CurrencyNullable.NullInstance()
  );
end;

class function ItemCalculoInput.Create(
  Numero: Integer;
  const NCMouNBS, cClassTrib, CST: string;
  const ImpostoSeletivo: ImpostoSeletivoInput;
  const TributacaoRegular: TributacaoRegularInput;
  const BaseCalculo: CurrencyNullable;
  const Quantidade: CurrencyNullable
  ): ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    Numero,
    NCMouNBS,
    cClassTrib,
    CST,
    ImpostoSeletivo,
    TributacaoRegular,
    BaseCalculo,
    Quantidade,
    ''
  );
end;

class function ItemCalculoInput.Create(
  Numero: Integer;
  const NCMouNBS, cClassTrib, CST: string;
  const ImpostoSeletivo: ImpostoSeletivoInput;
  const TributacaoRegular: TributacaoRegularInput;
  const BaseCalculo: CurrencyNullable;
  const Quantidade: CurrencyNullable;
  const Unidade: string
  ): ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    Numero,
    NCMouNBS,
    cClassTrib,
    CST,
    ImpostoSeletivo,
    TributacaoRegular,
    BaseCalculo,
    Quantidade,
    Unidade,
    ComponentesBaseCalculoInput.NullInstance()
  );
end;

class function ItemCalculoInput.Create(
  Numero: Integer;
  const NCMouNBS, cClassTrib, CST: string;
  const ImpostoSeletivo: ImpostoSeletivoInput;
  const TributacaoRegular: TributacaoRegularInput;
  const BaseCalculo: CurrencyNullable;
  const Quantidade: CurrencyNullable;
  const Unidade: string;
  const GComponentesBC: ComponentesBaseCalculoInput
  ): ItemCalculoInput;
begin
  Result.FNumero := Numero;

  if Length(Trim(NCMouNBS)) = 8 then
    Result.FNCM := Trim(NCMouNBS)

  else if Length(Trim(NCMouNBS)) = 9 then
    Result.FNBS := Trim(NCMouNBS);

  Result.FcClassTrib := Trim(cClassTrib);
  Result.FCST := Trim(CST);
  Result.FCSTInt := StrToIntDef( Trim(Result.FCST), -1 );
  Result.FImpostoSeletivo := ImpostoSeletivo;
  Result.FTributacaoRegular := TributacaoRegular;
  Result.FBaseCalculo := BaseCalculo;
  Result.FQuantidade := Quantidade;
  Result.FUnidade := Trim(Unidade);
  Result.FGComponentesBC := GComponentesBC;
end;

class function ItemCalculoInput.Create(
  Numero: Integer;
  const NCMouNBS, cClassTrib, CST: string;
  const ImpostoSeletivo: ImpostoSeletivoInput;
  const TributacaoRegular: TributacaoRegularInput;
  const BaseCalculo: Currency;
  Quantidade: Currency;
  const Unidade: string
  ): ItemCalculoInput;
begin
  Result := ItemCalculoInput.Create(
    Numero,
    NCMouNBS,
    cClassTrib,
    CST,
    ImpostoSeletivo,
    TributacaoRegular,
    CurrencyNullable.Create(BaseCalculo),
    CurrencyNullable.Create(Quantidade),
    Unidade
  );
end;

function ItemCalculoInput.GetHasGComponentesBC: Boolean;
begin
  Result := not FGComponentesBC.IsNull();
end;

// Quantidade ausente assume 1 no RTC (ProcessamentoItemService:96).
function ItemCalculoInput.QuantidadeEfetiva: Currency;
begin
  if FQuantidade.IsNull then
    Result := 1
  else
    Result := FQuantidade.Value;
end;

end.
