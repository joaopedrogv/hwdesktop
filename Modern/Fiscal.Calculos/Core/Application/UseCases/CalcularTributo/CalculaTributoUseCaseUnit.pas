unit CalculaTributoUseCaseUnit;

interface

uses
  BaseClassUnit,
  CalcularTributoInputUnit,
  ItemCalculoInputUnit,
  TributosModelUnit,
  ROCDomainUnit,
  ROCItemDomainUnit,
  ValoresTotaisDomainUnit,
  IPreparacaoCalculoServiceUnit,
  ICalculoTributoServiceUnit,
  OperacaoConsumoModelUnit,
  ValidacaoOutputUnit, ITradutorErrosRtcUnit, ICalculadorROCServiceUnit;

type
  (*
  ICalculaTributoUseCase = interface
    ['{D64D7793-21EC-43C5-8978-63C96079376F}']
    function Executar(const Input: CalcularTributoInput): ROCDomain;
  end;
  *)

  ICalculaTributoUseCase = class(BaseClass)
  public
    function Executar(const Input: CalcularTributoInput): ROCDomain; virtual; abstract;
  end;

  //CalculaTributoUseCase = class(TInterfacedObject, ICalculaTributoUseCase)
  CalculaTributoUseCase = class(ICalculaTributoUseCase)
  private
    FCalculadorROCService: ICalculadorROCService;
    FPreparacaoService: IPreparacaoCalculoServiceInter;
    FCalculoTributo: ICalculoTributoService;
    FValidacoes: ValidacaoOutput;
    FTradutorValidacoes: ITradutorErrosRTC;
    FPRedutorCompraGov: Currency;
    function ObterImpostos(Documento: CalcularTributoInput): ROCItens;
    function ObterImposto(Documento: CalcularTributoInput; const Item: ItemCalculoInput; DataHoraEmissao: TDateTime): TributosModel;
    function ObterOperacaoConsumo(const Documento: CalcularTributoInput): OperacaoConsumoModel;
  public
    constructor Create(
      CalculadorROCServ: ICalculadorROCService
//      Preparacao: IPreparacaoCalculoServiceInter;
//      CalculoTributo: ICalculoTributoService;
//      TradutorValidacoes: ITradutorErrosRTC
    );
    destructor Destroy(); override;

    function Executar(const Input: CalcularTributoInput): ROCDomain; override;
  end;

implementation

{ CalculaTributoUseCase }

uses
  PreparacaoResultadoUnit,
  CompraGovernamentalModelUnit,
  ValidacaoItemOutputUnit;

constructor CalculaTributoUseCase.Create(
  CalculadorROCServ: ICalculadorROCService
//  Preparacao: IPreparacaoCalculoServiceInter;
//  CalculoTributo: ICalculoTributoService;
//  TradutorValidacoes: ITradutorErrosRTC
);
begin
  FCalculadorROCService := CalculadorROCServ;
//  FPreparacaoService := Preparacao;
//  FCalculoTributo := CalculoTributo;
//  FTradutorValidacoes := TradutorValidacoes;
//  FPRedutorCompraGov := 0;
end;

destructor CalculaTributoUseCase.Destroy;
begin
  //FPreparacaoService.FreeSafe();
  inherited;
end;

function CalculaTributoUseCase.Executar(const Input: CalcularTributoInput): ROCDomain;
var
  impostos: ROCItens;
begin
  Result := FCalculadorROCService.Executar( Input );

//  FValidacoes := ValidacaoOutput.Create();
//
//  impostos := ObterImpostos( Input );
//
//  Result := ROCDomain.Create(
//    ObterOperacaoConsumo( Input ),
//    impostos,
//    ValoresTotaisDomain.FromObjetos(impostos),
//    FValidacoes
//  );

end;

function CalculaTributoUseCase.ObterImpostos(Documento: CalcularTributoInput): ROCItens;
var
  item: ROCItemDomain;
  I, Count: Integer;
begin

  SetLength(Result, Length(Documento.Itens));

  Count := 0;
  try
    for I := Low(Documento.Itens) to High(Documento.Itens) do
    begin
      item := ROCItemDomain.Create(
        Documento.Itens[I].Numero,
        Self.ObterImposto(Documento, Documento.Itens[I], Documento.DhFatoGerador)
      );
      Result[I] := item;
      Inc(Count);
    end;

  except
    for I := 0 to Count - 1 do
      Result[I].Free();

    raise;
  end;
end;

function CalculaTributoUseCase.ObterImposto(Documento: CalcularTributoInput;
  const Item: ItemCalculoInput;
  DataHoraEmissao: TDateTime): TributosModel;
var
  Resultado: PreparacaoResultado;
  validacao: ValidacaoItemOutput;
begin
  Resultado := FPreparacaoService.Preparar( Documento, Item );

  FPRedutorCompraGov := Resultado.Operacao.PRedutor;

  for validacao in Resultado.Validacoes.Validacoes do
    FValidacoes.Add( ValidacaoItemOutput.Create( 0, FTradutorValidacoes.Traduzir( validacao )));

  Result := FCalculoTributo.Calcular( Resultado.Operacao );
end;

function CalculaTributoUseCase.ObterOperacaoConsumo(const Documento: CalcularTributoInput): OperacaoConsumoModel;
var
  gCompraGov: CompraGovernamentalModel;
begin
  Result := OperacaoConsumoModel.NullInstance();

  if Documento.GCompraGov.IsNull() then
    Exit;

  gCompraGov := CompraGovernamentalModel.Create(
    Documento.GCompraGov.TpEnteGov,
    Documento.GCompraGov.TpOperGov,
    FPRedutorCompraGov
  );

  Result := OperacaoConsumoModel.Create( gCompraGov );
end;

end.
