unit CalculoInputTestModel;

interface

uses
  SysUtils,
  CalcularTributoInputUnit,
  ItemCalculoInputUnit,
  ImpostoSeletivoInputUnit,
  TributacaoRegularInputUnit;

type
  TributacaoRegularTestInput = class
  private
    FCST: string;
    FcClassTrib: string;
  public
    property CST: string read FCST write FCST;
    property cClassTrib: string read FcClassTrib write FcClassTrib;
  end;

  ImpostoSeletivoTestInput = class
  private
    FCst: string;
    FCClassTrib: string;
    FBaseCalculo: Double;
    FQuantidade: Double;
    FUnidade: string;
    FImpostoInformado: Double;
  public
    property Cst: string read FCst write FCst;
    property CClassTrib: string read FCClassTrib write FCClassTrib;
    property BaseCalculo: Double read FBaseCalculo write FBaseCalculo;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property Unidade: string read FUnidade write FUnidade;
    property ImpostoInformado: Double read FImpostoInformado write FImpostoInformado;
    property ValorImpostoSeletivoInformado: Double read FImpostoInformado write FImpostoInformado;
  end;

  ItemCalculoTestInput = class
  private
    FCSTInt: SmallInt;
    FNBS: string;
    FcClassTrib: string;
    FTributacaoRegular: TributacaoRegularTestInput;
    FNumero: Integer;
    FNCM: string;
    FImpostoSeletivo: ImpostoSeletivoTestInput;
    FUnidade: string;
    FQuantidade: Single;
    FBaseCalculo: Single;
    FCST: string;
  public
    destructor Destroy; override;
    property Numero: Integer read FNumero write FNumero;
    property NCM: string read FNCM write FNCM;
    property NBS: string read FNBS write FNBS;
    property CST: string read FCST write FCST;
    property cClassTrib: string read FcClassTrib write FcClassTrib;
    property BaseCalculo: Single read FBaseCalculo write FBaseCalculo;
    property Quantidade: Single read FQuantidade write FQuantidade;
    property Unidade: string read FUnidade write FUnidade;
    property ImpostoSeletivo: ImpostoSeletivoTestInput read FImpostoSeletivo write FImpostoSeletivo;
    property TributacaoRegular: TributacaoRegularTestInput read FTributacaoRegular write FTributacaoRegular;
    property CSTInt: SmallInt read FCSTInt write FCSTInt;
  end;

  (*
  "gCompraGov": {
    "tpEnteGov": 7,
    "tpOperGov": 1
  }
  *)
  CompraGovTestInput = class
  private
    FTpEnteGov: Integer;
    FTpOperGov: Integer;
  public
    property TpEnteGov: Integer read FTpEnteGov write FTpEnteGov;
    property TpOperGov: Integer read FTpOperGov write FTpOperGov;
  end;

  CalcularTributoTestInput = class
  private
    FDataHoraEmissao: TDateTime;
    FDhFatoGerador: TDateTime;
    FUF: string;
    FItens: TArray<ItemCalculoTestInput>;
    FMunicipio: Integer;
    FGCompraGov: CompraGovTestInput;
  public
    destructor Destroy; override;

    property DataHoraEmissao: TDateTime read FDataHoraEmissao write FDataHoraEmissao;
    property DhFatoGerador: TDateTime read FDhFatoGerador write FDhFatoGerador;
    property Municipio: Integer read FMunicipio write FMunicipio;
    property UF: string read FUF write FUF;
    property Itens: TArray<ItemCalculoTestInput> read FItens write FItens;
    property GCompraGov: CompraGovTestInput read FGCompraGov write FGCompraGov;
  end;

  TCalculoInputConverter = class
  public
    class function ToInput(AInput: CalcularTributoTestInput): CalcularTributoInput; static;
  end;

implementation

{ ItemCalculoTestInput }

uses CompraGovernamentalInputUnit, TipoEnteGovernamentalEnumUnit,
  TipoOperacaoGovernamentalEnumUnit;

destructor ItemCalculoTestInput.Destroy;
begin
  if Assigned(FTributacaoRegular) then
    FTributacaoRegular.Free;
  if Assigned(FImpostoSeletivo) then
    FImpostoSeletivo.Free;
  inherited;
end;

{ CalcularTributoTestInput }

destructor CalcularTributoTestInput.Destroy;
var
  i: Integer;
begin
  for i := Low(FItens) to High(FItens) do
    if Assigned(FItens[i]) then
      FItens[i].Free;
  if Assigned(FGCompraGov) then
    FGCompraGov.Free;
  inherited;
end;

{ TCalculoInputConverter }

class function TCalculoInputConverter.ToInput(AInput: CalcularTributoTestInput): CalcularTributoInput;
var
  i: Integer;
  itens: ItensCalculoInput;
  reg: TributacaoRegularInput;
  sel: ImpostoSeletivoInput;
  CompraGov: CompraGovernamentalInput;
  TpEnteGov: TipoEnteGovernamental;
  TpOperGov: TipoOperacaoGovernamental;
  sNCMouNBS: string;
begin
  if not Assigned(AInput) then
    Exit(Default(CalcularTributoInput));

  SetLength(itens, Length(AInput.Itens));
  for i := Low(AInput.Itens) to High(AInput.Itens) do
  begin
    if Assigned(AInput.Itens[i].TributacaoRegular) then
      reg := TributacaoRegularInput.Create(AInput.Itens[i].TributacaoRegular.CST, AInput.Itens[i].TributacaoRegular.cClassTrib)
    else
      reg := TributacaoRegularInput.NullInstance;

    if Assigned(AInput.Itens[i].ImpostoSeletivo) then
      sel := ImpostoSeletivoInput.Create(
        AInput.Itens[i].ImpostoSeletivo.Cst,
        AInput.Itens[i].ImpostoSeletivo.CClassTrib,
        AInput.Itens[i].ImpostoSeletivo.BaseCalculo,
        AInput.Itens[i].ImpostoSeletivo.Quantidade,
        AInput.Itens[i].ImpostoSeletivo.Unidade,
        AInput.Itens[i].ImpostoSeletivo.ImpostoInformado
      )
    else
      sel := ImpostoSeletivoInput.NullInstance;

    sNCMouNBS := AInput.Itens[i].NCM;
    if sNCMouNBS = '' then
      sNCMouNBS := AInput.Itens[i].NBS;

    itens[i] := ItemCalculoInput.Create(
      AInput.Itens[i].Numero,
      sNCMouNBS,
      AInput.Itens[i].cClassTrib,
      AInput.Itens[i].CST,
      sel,
      reg,
      AInput.Itens[i].BaseCalculo,
      AInput.Itens[i].Quantidade,
      AInput.Itens[i].Unidade
    );
  end;

  if Assigned(AInput.GCompraGov) then
    CompraGov := CompraGovernamentalInput.Create(
      TipoEnteGovernamental(AInput.GCompraGov.TpEnteGov), TipoOperacaoGovernamental(AInput.GCompraGov.TpOperGov)
    )
  else
    CompraGov := CompraGovernamentalInput.NullInstance();

  Result := CalcularTributoInput.Create(
    AInput.DataHoraEmissao,
    AInput.Municipio,
    AInput.UF,
    itens,
    CompraGov,
    AInput.DhFatoGerador
  );
end;

end.
