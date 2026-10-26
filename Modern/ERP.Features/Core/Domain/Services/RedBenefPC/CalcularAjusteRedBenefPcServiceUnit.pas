unit CalcularAjusteRedBenefPcServiceUnit;

interface

uses
  SysUtils, Classes,
  ICalcularAjusteRedBenefPcServiceUnit,
  AjusteRedBenefPcModelUnit,
  ContextoDocTribPcModelUnit,
  IRegrasRedBenefPcRepositoryUnit,
  ICalcularPisCofinsServiceUnit,
  IAplicadorRedBenefPcServiceUnit,
  IConfiguracoesRepositoryUnit;

type
  CalcularAjusteRedBenefPcService = class(TInterfacedObject, ICalcularAjusteRedBenefPcService)
  private
    FRegrasRedBenefRepo: IRegrasRedBenefPcRepository;
    FCalcularPisCofins: ICalcularPisCofinsService;
    FAplicadorDeCalculo: IAplicadorRedBenefPcService;
    FConfigRepo: IConfiguracoesRepository;
  public
    constructor Create(
      RegrasRedBenefRepo: IRegrasRedBenefPcRepository;
      CalcularPisCofins: ICalcularPisCofinsService;
      AplicadorDeCalculo: IAplicadorRedBenefPcService;
      ConfigRepo: IConfiguracoesRepository
    );

    function Calcular(const Input: ContextoDocTribPcModel): AjusteRedBenefPcModelList;
  end;

implementation

uses
  RegraRedBenefPcEtdUnit, CalculoPisCofinsResultUnit, CalculoPisCofinsInputUnit, ConfigLegacyTypes;

type
  TItemDistinto = record
    ValorLiquido, ValorIpi, ValorICMS: Currency;
    Cst, RegraId: string;
  end;

  TItemsDistinto = array of TItemDistinto;

  TAgrupador = class
  strict private
    FCount: Integer;
    FItems: TItemsDistinto; 
  public
    constructor Create();
    procedure Somar(const Cst, RegraId: string; ValorLiquido, ValorIpi, ValorICMS: Currency);
    function GetItems(): TItemsDistinto;
  end;

{ TAgrupador }

constructor TAgrupador.Create();
begin
  FCount := 0;
  SetLength(FItems, 4);
end;

function TAgrupador.GetItems: TItemsDistinto;
begin
  SetLength(FItems, FCount);
  Result := FItems;
end;

procedure TAgrupador.Somar(const Cst, RegraId: string; ValorLiquido, ValorIpi, ValorICMS: Currency);
var
  I: Integer;
begin
  for I := 0 to High(FItems) do
    if (FItems[I].Cst = Cst) and (FItems[I].RegraId = RegraId) then  
    begin
      FItems[I].ValorLiquido := FItems[I].ValorLiquido + ValorLiquido;
      FItems[I].ValorIpi     := FItems[I].ValorIpi     + ValorIpi;
      FItems[I].ValorICMS    := FItems[I].ValorICMS    + ValorICMS;
      Exit;
    end;

  if FCount >= Length(FItems) then
    SetLength(FItems, Length(FItems) + 4);

  FItems[FCount].Cst          := Cst;
  FItems[FCount].RegraId      := RegraId;
  FItems[FCount].ValorLiquido := ValorLiquido;
  FItems[FCount].ValorIpi     := ValorIpi;
  FItems[FCount].ValorICMS    := ValorICMS;    
  
  Inc(FCount);   
end;

{ CalcularAjusteRedBenefPcService }

function CalcularAjusteRedBenefPcService.Calcular(const Input: ContextoDocTribPcModel): AjusteRedBenefPcModelList;
var
  Regras: RegraRedBenefPcEtdList;
  I, J: Integer;
  calculo: CalculoPisCofinsResult;
  aliquotas: AplicadorRedBenefPcServiceOutput;
  cfg: ConfigLegacyData;
  ppis, pcofins: Currency;
  Agrupador: TAgrupador;
  Items: TItemsDistinto;
begin
  // Ja filtra as regras vigentes
  Regras := FRegrasRedBenefRepo.ListarRegrasVigentes(Input.EmpresaId, Input.Data);
  Agrupador := TAgrupador.Create;
  try
    Result := AjusteRedBenefPcModelList.Create();

    if (Length(Input.Itens) = 0) or (Regras.Count = 0) then
      Exit;

    cfg := FConfigRepo.GetLegacy([ceAliqPis, ceAliqCofins]);
    ppis := cfg.GetCurrency(ceAliqPis);
    pcofins := cfg.GetCurrency(ceAliqCofins);

    for I := 0 to High(Input.Itens) do
      for J := 0 to Regras.Count - 1 do
        if Regras.Items[J].AplicaAoItem(Input.Itens[I].CST, Input.Itens[I].NaturezaReceita, Input.Itens[I].NCM) then
        begin
          Agrupador.Somar(Input.Itens[I].CST, Regras.Items[J].Id,
            Input.Itens[I].ValorLiquidoCobrado, Input.Itens[I].ValorIpi, Input.Itens[I].ValorIcms
          );
          Break;
        end;

    Items := Agrupador.GetItems();
    for I := 0 to High(Items) do//for I := 0 to High(Input.Itens) do
      for J := 0 to Regras.Count - 1 do
        //if Regras.Items[J].AplicaAoItem(Input.Itens[I].CST, Input.Itens[I].NaturezaReceita, Input.Itens[I].NCM) then
        if Regras.Items[J].Id = Items[I].RegraId then
        begin
          aliquotas := FAplicadorDeCalculo.AplicarReducao(
            ppis, pcofins, Regras.Items[J].PercReducao
          );

          calculo := FCalcularPisCofins.Executar( CalculoPisCofinsInput.Create(
            '01',
            Items[I].ValorLiquido,
            1,
            Items[I].ValorIpi,
            Items[I].ValorIcms,
            aliquotas.PPis,
            aliquotas.PCofins
          ));

          Result.Add(AjusteRedBenefPcModel.Create(
            '',
            Input.ChaveDFe,
            Input.EmpresaId,
            Regras.Items[j].Id,
            Regras.Items[j].IndAjusteEFD,
            Regras.Items[j].CodAjusteEFD,
            Input.Data,
            Regras.Items[j].Cst,
            calculo.VBcOuQtde,
            calculo.PPisOuReais,
            calculo.ValorPis,
            calculo.PCofinsOuReais,
            calculo.ValorCofins,
            True,
            Regras.Items[j].DescricaoAjusteEFD,
            Regras.Items[j].InfComplementarAjusteEFD,
            Regras.Items[j].CodContaContabil,
            nil
          ));
          
          Break;
        end;

  finally
    Regras.Free();
  end;
end;

constructor CalcularAjusteRedBenefPcService.Create(
  RegrasRedBenefRepo: IRegrasRedBenefPcRepository;
  CalcularPisCofins: ICalcularPisCofinsService;
  AplicadorDeCalculo: IAplicadorRedBenefPcService;
  ConfigRepo: IConfiguracoesRepository
);
begin
  FRegrasRedBenefRepo := RegrasRedBenefRepo;
  FCalcularPisCofins := CalcularPisCofins;
  FAplicadorDeCalculo := AplicadorDeCalculo;
  FConfigRepo := ConfigRepo;
end;

end.