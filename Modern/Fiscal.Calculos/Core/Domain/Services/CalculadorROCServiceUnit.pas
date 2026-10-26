unit CalculadorROCServiceUnit;

interface

uses
  ICalculadorROCServiceUnit, CalcularTributoInputUnit, ItemCalculoInputUnit, TributosModelUnit, ROCDomainUnit,
  ROCItemDomainUnit, ValoresTotaisDomainUnit, IPreparacaoCalculoServiceUnit, ICalculoTributoServiceUnit,
  OperacaoConsumoModelUnit, ValidacaoOutputUnit, ITradutorErrosRtcUnit, IMunicipiosRepositoryUnit,
  RedutorCompraGovernamentalServiceUnit;

type
  // Faz a mesma coisa que CalculaTributoUseCaseUnit, porém usa interfaces
  // Java: source\src\main\java\br\gov\serpro\rtc\domain\service\CalculadoraService.java
  CalculadorROCService = class(TInterfacedObject, ICalculadorROCService)
  private
    FMunicipioRepo: IMunicipiosRepository;
    FRedutorCompraGovService: IRedutorCompraGovernamentalService;
    FProcessamentoItemService: IProcessamentoItemService;
    FPreparacaoService: IPreparacaoCalculoServiceInter;
    FCalculoTributo: ICalculoTributoService;
    FValidacoes: ValidacaoOutput;
    FTradutorValidacoes: ITradutorErrosRTC;
    procedure ValidarUF(const UF: string);
    procedure ValidarMunicipio(Codigo: Integer; const UF: string);
    function GetDelhesImposto(Documento: CalcularTributoInput): ROCItens;
    function GetImpostoItemProcessamento(const Documento: CalcularTributoInput; const Item: ItemCalculoInput): TributosModel;
    function GetOperacaoOutput(const Documento: CalcularTributoInput): OperacaoConsumoModel;
  public
    constructor Create(
      MunicipioRepo: IMunicipiosRepository;
      RedutorCompraGovServ: IRedutorCompraGovernamentalService;
      ProcessamentoItemServ: IProcessamentoItemService;
      Preparacao: IPreparacaoCalculoServiceInter;
      CalculoTributo: ICalculoTributoService;
      TradutorValidacoes: ITradutorErrosRTC
    );
    function Executar(const Input: CalcularTributoInput): ROCDomain;
  end;

implementation

uses
  SysUtils, StrUtils,
  TipoComunsUnit, PreparacaoResultadoUnit, CompraGovernamentalModelUnit, ValidacaoItemOutputUnit, CodigosErroValidacao,
  MunicipioEtdUnit, EstadosServiceUnit, EValidacaoRTCUnit;

{ CalculadorROCService }

constructor CalculadorROCService.Create(
  MunicipioRepo: IMunicipiosRepository;
  RedutorCompraGovServ: IRedutorCompraGovernamentalService;
  ProcessamentoItemServ: IProcessamentoItemService;
  Preparacao: IPreparacaoCalculoServiceInter;
  CalculoTributo: ICalculoTributoService;
  TradutorValidacoes: ITradutorErrosRTC
);
begin
  FMunicipioRepo := MunicipioRepo;
  FRedutorCompraGovService := RedutorCompraGovServ;
  FProcessamentoItemService := ProcessamentoItemServ;
  FPreparacaoService := Preparacao;
  FCalculoTributo := CalculoTributo;
  FTradutorValidacoes := TradutorValidacoes;
end;

function CalculadorROCService.Executar(const Input: CalcularTributoInput): ROCDomain;
var
  impostos: ROCItens;
begin

  ValidarUF(Input.UF);
  ValidarMunicipio(Input.Municipio, Input.UF);

  impostos := GetDelhesImposto(Input);

  Result := ROCDomain.Create(
    GetOperacaoOutput( Input ),
    impostos,
    ValoresTotaisDomain.FromObjetos(impostos),
    FValidacoes
  );
end;

function CalculadorROCService.GetDelhesImposto(Documento: CalcularTributoInput): ROCItens;
var
  item: ROCItemDomain;
  I, Count: Integer;
begin

  if not FValidacoes.IsValid then
  begin
    SetLength(Result, 0);
    Exit;
  end;

  SetLength(Result, Length(Documento.Itens));

  Count := 0;
  try
    for I := Low(Documento.Itens) to High(Documento.Itens) do
    begin
      item := ROCItemDomain.Create(
        Documento.Itens[I].Numero,
        Self.GetImpostoItemProcessamento(Documento, Documento.Itens[I])
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

function CalculadorROCService.GetImpostoItemProcessamento(
  const Documento: CalcularTributoInput; const Item: ItemCalculoInput
): TributosModel;
var
  Resultado: ProcessamentoItemResult; // PreparacaoResultado;
  validacao: ValidacaoItemOutput;
  Data: TDate;
begin
  Data := Documento.GetFatoGeradorAplicavel();

  try
    Resultado := FProcessamentoItemService.ProcessarItem(Documento, Item, Data);
    try

      for validacao in Resultado.Validacoes.Validacoes do
        FValidacoes.Add( ValidacaoItemOutput.Create( 0, FTradutorValidacoes.Traduzir( validacao )));

      Result := Resultado.ExtrairResultado();

    finally
      Resultado.Free();
    end;

  except
    on E: EValidacaoRTC do
      begin
        FValidacoes.Add(E.Message);
        Result := nil;
      end;

    on E: Exception do
      raise;
  end;
  {
  Resultado := FPreparacaoService.Preparar( Documento, Item );

  FPRedutorCompraGov := Resultado.Operacao.PRedutor;

  for validacao in Resultado.Validacoes.Validacoes do
    FValidacoes.Add( ValidacaoItemOutput.Create( 0, FTradutorValidacoes.Traduzir( validacao )));

  Result := FCalculoTributo.Calcular( Resultado.Operacao ); // onde as validacoes serao retornadas?
  }
end;

function CalculadorROCService.GetOperacaoOutput(const Documento: CalcularTributoInput): OperacaoConsumoModel;
var
  gCompraGov: CompraGovernamentalModel;
  PRedutor: Currency;
begin
  Result := OperacaoConsumoModel.NullInstance();

  if Documento.GCompraGov.IsNull() then
    Exit;

  try
    PRedutor := FRedutorCompraGovService.BuscarValorRedutor(Documento.GetTpEnteGov(), Documento.GetFatoGeradorAplicavel());
  except
    on E: EValidacaoRTC do
      FValidacoes.Add(E.Message);

    on E: Exception do
      raise;
  end;

  gCompraGov := CompraGovernamentalModel.Create(
    Documento.GCompraGov.TpEnteGov,
    Documento.GCompraGov.TpOperGov,
    PRedutor
  );

  Result := OperacaoConsumoModel.Create( gCompraGov );
end;

procedure CalculadorROCService.ValidarMunicipio(Codigo: Integer; const UF: string);
var
  municipio: MunicipioEtd;
begin
  municipio := FMunicipioRepo.ObterMunicipio(Codigo);
  try
    if municipio = nil then
    begin
      FValidacoes.AddDistinct(ValidacaoItemOutput.Create(ECOD_MUNICIPIO_NAO_EXISTE));
      Exit;
    end

    else if (Copy(IntToStr(municipio.Codigo), 1, 2) <> IntToStr(municipio.Estado.Codigo)) or
      (municipio.Estado.Sigla <> UF)
    then
      FValidacoes.AddDistinct(ValidacaoItemOutput.Create(ECOD_MUNICIPIO_NAO_PERTENCE_UF));
  finally
    municipio.Free();
  end;
end;

procedure CalculadorROCService.ValidarUF(const UF: string);
begin
  if EstadosService.UfToCodigoIBGE(UF) = -1 then
    FValidacoes.AddDistinct(ValidacaoItemOutput.Create(ECOD_UF_INVALIDA));
end;

end.
