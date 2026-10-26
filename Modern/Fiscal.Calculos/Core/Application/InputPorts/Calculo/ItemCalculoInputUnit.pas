unit ItemCalculoInputUnit;

interface

uses
  TributacaoRegularInputUnit, ImpostoSeletivoInputUnit;

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
    FQuantidade: Currency;
    FBaseCalculo: Currency;
    FCST: string;
  public
    class function Create(
      Numero: Integer;
      const NCMouNBS: string;
      const cClassTrib: string;
      const CST: string;
      const ImpostoSeletivo: ImpostoSeletivoInput;
      const TributacaoRegular: TributacaoRegularInput;
      BaseCalculo: Currency = 0;
      Quantidade: Currency = 0;
      const Unidade: string = ''
    ): ItemCalculoInput; static;

    /// <summary>
    ///   Numero sequencial do item
    /// </summary>
    property Numero: Integer read FNumero;
    property NCM: string read FNCM;
    property NBS: string read FNBS;
    property CST: string read FCST;
    property cClassTrib: string read FcClassTrib;
    property BaseCalculo: Currency read FBaseCalculo write FBaseCalculo;
    property Quantidade: Currency read FQuantidade;
    property Unidade: string read FUnidade;

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
  const TributacaoRegular: TributacaoRegularInput;
  BaseCalculo, Quantidade: Currency;
  const Unidade: string
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
end;

end.