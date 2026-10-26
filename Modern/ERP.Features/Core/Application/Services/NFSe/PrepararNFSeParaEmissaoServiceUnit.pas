// PrepararNFSeParaEmissaoService.pas
unit PrepararNFSeParaEmissaoServiceUnit;

interface

uses
  IPrepararNFSeParaEmissaoServiceUnit,
  INFSeRepositoryUnit,
  IEntityValidatorUnit,
  ValidacaoNFSeFactoryUnit,
  NFSeAtualizarSituacaoTypesUnit,
  NFSeTypesUnit,
  DateUtils,
  ConfiguracaoNFSeModelUnit, IPedVendaRepositoryUnit;

type
  PrepararNFSeParaEmissaoService = class(TInterfacedObject, IPrepararNFSeParaEmissaoService)
  private
    FNFSeRepo: INFSeRepository;
    FOSRepo: IPedVendaRepository;
  public
    constructor Create(
      NFSeRepo: INFSeRepository;
      OSRepo: IPedVendaRepository
    );

    function Preparar(
      const NFSeId: string; EmpresaId: Integer; const Config: ConfiguracaoNFSeModel
    ): PreparacaoNFSeResult;
  end;

implementation

uses
  SysUtils, EntityValidatorFactoryUnit, ValidationEntityOutputUnit, NFSeEtdUnit, ValidacaoOutputUnit, NFSeOSEtdUnit,
  UpdatePedvendaVinculoDpsNFSeCommandUnit;

constructor PrepararNFSeParaEmissaoService.Create(
  NFSeRepo: INFSeRepository;
  OSRepo: IPedVendaRepository
);
begin
  FNFSeRepo := NFSeRepo;
  FOSRepo := OSRepo;
end;

function PrepararNFSeParaEmissaoService.Preparar(const NFSeId: string; EmpresaId: Integer;
  const Config: ConfiguracaoNFSeModel): PreparacaoNFSeResult;
var
  NFSe: NFSeEtd;
  nfseOS: NFSeOSEtdList;
  Validacoes: ValidationEntityOutput;
  Validator: IEntityValidator;
  dhEmi: TDateTime;
  I: Integer;
begin
  Validacoes := ValidationEntityOutput.Create();

  NFSe := FNFSeRepo.GetNFSe(NFSeId, EmpresaId);
  if NFSe = nil then
  begin
    Validacoes.Add('Id', 'Nenhuma NFSe encontrada com ID informado');
    Result := PreparacaoNFSeResult.Create( nil, Validacoes );
    Exit;
  end;

  // Casos que não precisam de validação (já autorizada ou em processo de emissao)
  if NFSe.Situacao in [sdpsEmissao, sdpsEmProcessamento, sdpsAutorizada] then
  begin
    Result := PreparacaoNFSeResult.Create( NFSe, Validacoes );
    Exit;
  end;

  // Situações finais que não permitem emissão
  if not (NFSe.Situacao in [sdpsRascunho, sdpsRejeicao]) then
  begin
    Validacoes.Add('situacao', 'NFSe já se encontra em uma situação final');
    Result := PreparacaoNFSeResult.Create( NFSe, Validacoes );
    Exit;
  end;

  // Se não tem número RPS/DPS, gera um
  if NFSe.NDps.IsNull or (NFSe.NDps.Value <= 0) then
  begin
    if NFSe.DhEmi.HasValue then
      dhEmi := NFSe.DhEmi.Value
    else
      dhEmi := IncMinute(Now, -1);

    NFSe.Free;
    NFSe := FNFSeRepo.AtualizarNFSe(
      NFSeAtualizarNumeroRPSModel.Create(NFSeId, EmpresaId, Config.Serie, dhEmi)
    );

    nfseOS := FNFSeRepo.ListarRelacionamento(NFSeId);
    try
      for I := 0 to nfseOS.Count - 1 do
        FOSRepo.AtualizarVinculoDPS( UpdatePedvendaVinculoDpsNFSeCommand.Create(
          NFSeId, EmpresaId, nfseOS.Items[I].NumPed, NFSe.NDps, NFSe.DhEmi
        ));
    finally
      nfseOS.Free();
    end;
  end;

  // Validação
  Validator := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe);

  Result := PreparacaoNFSeResult.Create( NFSe, Validator.Result() );
end;

end.
