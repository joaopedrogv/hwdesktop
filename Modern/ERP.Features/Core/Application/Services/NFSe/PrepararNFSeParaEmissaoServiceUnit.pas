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
  ConfiguracaoNFSeModelUnit, IPedVendaRepositoryUnit,
  NFSeEtdUnit, DateAndTimeNullableUnit, TributoDFeContextEtdUnit,
  ITributosDFeRepositoryUnit, ITratamentoClassificacaoRepositoryUnit, ISituacaoTributariaRepositoryUnit;

type
  PrepararNFSeParaEmissaoService = class(TInterfacedObject, IPrepararNFSeParaEmissaoService)
  private
    FNFSeRepo: INFSeRepository;
    FOSRepo: IPedVendaRepository;
    FTributosDFeRepo: ITributosDFeRepository;
    FTratamentoClassificacaoRepo: ITratamentoClassificacaoRepository;
    FSituacaoTributariaRepo: ISituacaoTributariaRepository;

    function ObterDataReferencia(const NFSe: NFSeEtd): DateNullable;
    function ResolverIndicadorGrupoIbsCbs(const NFSe: NFSeEtd;
      const Tributo: TributoDFeContextEtd): Integer;
    function ResolverContextoIbsCbs(const NFSe: NFSeEtd; const Tributo: TributoDFeContextEtd;
      AIndicadorGrupoIbsCbs: Integer): TValidacaoIbsCbsNFSeContext;
  public
    constructor Create(
      NFSeRepo: INFSeRepository;
      OSRepo: IPedVendaRepository;
      TributosDFeRepo: ITributosDFeRepository;
      TratamentoClassificacaoRepo: ITratamentoClassificacaoRepository;
      SituacaoTributariaRepo: ISituacaoTributariaRepository
    );

    function Preparar(
      const NFSeId: string; EmpresaId: Integer; const Config: ConfiguracaoNFSeModel
    ): PreparacaoNFSeResult;
  end;

implementation

uses
  SysUtils, EntityValidatorFactoryUnit, ValidationEntityOutputUnit, ValidacaoOutputUnit, NFSeOSEtdUnit,
  TipoTributoEnumUnit, SituacaoTributariaEtdUnit, TratamentoClassificacaoEtdUnit, ClassificacaoTributariaEtdUnit,
  TributoDFeOrigemEnumUnit, DoubleNullableUnit, TributoDFeGrupoIbsCbsEtdUnit,
  TributoDFeCredPresOpIbsCbsEtdUnit, TributoDFeIbsCbsTribRegEtdUnit,
  UpdatePedvendaVinculoDpsNFSeCommandUnit;

constructor PrepararNFSeParaEmissaoService.Create(
  NFSeRepo: INFSeRepository;
  OSRepo: IPedVendaRepository;
  TributosDFeRepo: ITributosDFeRepository;
  TratamentoClassificacaoRepo: ITratamentoClassificacaoRepository;
  SituacaoTributariaRepo: ISituacaoTributariaRepository
);
begin
  FNFSeRepo := NFSeRepo;
  FOSRepo := OSRepo;
  FTributosDFeRepo := TributosDFeRepo;
  FTratamentoClassificacaoRepo := TratamentoClassificacaoRepo;
  FSituacaoTributariaRepo := SituacaoTributariaRepo;
end;

function PrepararNFSeParaEmissaoService.Preparar(const NFSeId: string; EmpresaId: Integer;
  const Config: ConfiguracaoNFSeModel): PreparacaoNFSeResult;
var
  NFSe: NFSeEtd;
  nfseOS: NFSeOSEtdList;
  Validacoes: ValidationEntityOutput;
  Validator: IEntityValidator;
  dhEmi: TDateTime;
  Tributo: TributoDFeContextEtd;
  Contexto: TValidacaoIbsCbsNFSeContext;
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

  Tributo := nil;
  Contexto := nil;

  try
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

    if NFSe.LayoutNFSeComIbsCbs then
      Tributo := FTributosDFeRepo.GetById(NFSe.Id, tdfoNFSe);

    Contexto := ResolverContextoIbsCbs(NFSe, Tributo,
      ResolverIndicadorGrupoIbsCbs(NFSe, Tributo));

    // Validação
    Validator := ValidacaoNFSeFactory.BuildEmitirNoWebService(NFSe, Contexto);

    Result := PreparacaoNFSeResult.Create( NFSe, Validator.Result() );
  finally
    Contexto.Free;
    Tributo.Free;
  end;
end;

function PrepararNFSeParaEmissaoService.ObterDataReferencia(const NFSe: NFSeEtd): DateNullable;
begin
  if NFSe.DCompet.HasValue then
    Result := NFSe.DCompet
  else if NFSe.DhEmi.HasValue then
    Result := DateNullable.Create(DateOf(NFSe.DhEmi.Value))
  else
    Result := DateNullable.NullInstance();
end;

function PrepararNFSeParaEmissaoService.ResolverIndicadorGrupoIbsCbs(const NFSe: NFSeEtd;
  const Tributo: TributoDFeContextEtd): Integer;
var
  DataReferencia: DateNullable;
  Cst: string;
  Situacao: SituacaoTributariaEtd;
begin
  Result := -1;

  if not NFSe.LayoutNFSeComIbsCbs then
    Exit;

  if not Assigned(Tributo) or not Assigned(Tributo.IbsCbs) then
    Exit;

  Cst := Tributo.IbsCbs.Cst;
  if Trim(Cst) = '' then
    Exit;

  DataReferencia := ObterDataReferencia(NFSe);
  if not DataReferencia.HasValue then
    Exit;

  Situacao := FSituacaoTributariaRepo.ConsultarSituacaoTributariaPorCodigo(Cst, tbtCBS, DataReferencia.Value);
  if Situacao.IsNull then
    Exit;

  if Situacao.InGrupoIbsCbs then
    Result := 1
  else
    Result := 0;
end;

function PrepararNFSeParaEmissaoService.ResolverContextoIbsCbs(const NFSe: NFSeEtd;
  const Tributo: TributoDFeContextEtd; AIndicadorGrupoIbsCbs: Integer): TValidacaoIbsCbsNFSeContext;
var
  DataReferencia: DateNullable;
  Cst: string;
  CClassTrib: string;
  CstEsperado: string;
  ClassificacaoEncontrada: Boolean;
  DetalhamentoInformado: Boolean;
  Tratamento: TratamentoClassificacaoEtd;
begin
  Result := nil;

  if not NFSe.LayoutNFSeComIbsCbs then
    Exit;

  if not Assigned(Tributo) or not Assigned(Tributo.IbsCbs) then
    Exit;

  Cst := Tributo.IbsCbs.Cst;
  CClassTrib := Tributo.IbsCbs.CClasstrib;
  DataReferencia := ObterDataReferencia(NFSe);
  ClassificacaoEncontrada := False;
  CstEsperado := '';

  DetalhamentoInformado :=
    (Assigned(Tributo.IbsCbs.CredPresOp) and (Tributo.IbsCbs.CredPresOp.Ccredpres <> ''))
    or (Assigned(Tributo.IbsCbs.GIbsCbs) and Assigned(Tributo.IbsCbs.GIbsCbs.TribRegular)
      and (Tributo.IbsCbs.GIbsCbs.TribRegular.CClasstribreg <> ''))
    or (Assigned(Tributo.IbsCbs.GIbsCbs)
      and (not Tributo.IbsCbs.GIbsCbs.IbsUfPdif.IsNullOrZero
        or not Tributo.IbsCbs.GIbsCbs.IbsMunPdif.IsNullOrZero
        or not Tributo.IbsCbs.GIbsCbs.CbsPdif.IsNull));

  if (Trim(CClassTrib) <> '') and DataReferencia.HasValue then
  begin
    Tratamento := FTratamentoClassificacaoRepo.ObterTratamentoClassificacao(CClassTrib, tbtCBS, DataReferencia.Value);
    try
      ClassificacaoEncontrada := Assigned(Tratamento);

      if ClassificacaoEncontrada then
        CstEsperado := Tratamento.ClassificacaoTributaria.SituacaoTributaria.Codigo;
    finally
      Tratamento.Free;
    end;
  end;

  Result := TValidacaoIbsCbsNFSeContext.Create(
    Cst, CClassTrib, DataReferencia, ClassificacaoEncontrada, CstEsperado, AIndicadorGrupoIbsCbs,
    DetalhamentoInformado
  );
end;

end.
