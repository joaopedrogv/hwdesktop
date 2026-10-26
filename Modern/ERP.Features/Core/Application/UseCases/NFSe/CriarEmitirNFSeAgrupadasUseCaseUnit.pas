unit CriarEmitirNFSeAgrupadasUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  ISessionContextUnit,
  ICriarEmitirNFSeAgrupadasUseCaseUnit,
  IDataBaseConnectionUnit,
  INFSeRepositoryUnit,
  ITributosDFeRepositoryUnit,
  IPedVendaRepositoryUnit,
  INFSeAgrupamentoServiceUnit,
  IConfiguracaoNFSeServiceUnit,
  IInicializarDpsServiceUnit,
  ICalcularTributosNFSeServiceUnit,
  ValidacaoOutputUnit,
  NFSeModelUnit,
  NFSeEtdUnit,
  CriarNFSeAgrupadasInputUnit,
  EmissaoLoteNFSeOutputUnit,
  OSItemFiscalEtdUnit,
  IEmitirNFSeServiceUnit,
  INFSeCalculoAplicadorServiceUnit, TipoComunsUnit, IPrepararNFSeParaEmissaoServiceUnit, ConfiguracaoNFSeModelUnit;

type
  CriarEmitirNFSeAgrupadasUseCase = class(TInterfacedBaseUseCase, ICriarEmitirNFSeAgrupadasUseCase)
  private
    FNFSeRepo: INFSeRepository;
    FSession: ISessionContext;
    FTributosDFeRepo: ITributosDFeRepository;
    FOSRepo: IPedVendaRepository;
    FAgrupamentoNFSeOS: INFSeAgrupamentoService;
    FConfigNFSeFactory: IConfiguracaoNFSeService;
    FInicializarNFSe: IInicializarDpsService;
    FCalcularTributos: ICalcularTributosNFSeService;
    FCalculoAplicador: INFSeCalculoAplicadorService;
    FPrepararParaEmissao: IPrepararNFSeParaEmissaoService;
    FEmitirNFSe: IEmitirNFSeService;

    FValidacoes: ValidacaoOutput;
    procedure SepararItensPorStatus(const ItensFiscais: OSItemFiscalEtdlList; ComNF, SemNF: OSItemFiscalEtdlList);
    function LocalizarNFSeExistenteNaLista(
      const ItensFiscais: OSItemFiscalEtdlList;
      ClienteId: Integer;
      const CodigoFiscal: string;
      AgruparPorCtribNac: Boolean
    ): string;
    function CriarMesclarNotas(
      const Notas: NFSeModelList;
      const Grupo: NFSeAgrupamentoOS;
      const ComNF: OSItemFiscalEtdlList;
      const SemNF: OSItemFiscalEtdlList;
      const ConfigNFSe: ConfiguracaoNFSeModel
    ): Integer;
    procedure PrepararClassificarNotas(
      const Notas: NFSeModelList;
      const ConfigNFSe: ConfiguracaoNFSeModel;
      var NFSeIDsValidos, EmailsValidos: TArrayString
    );
    procedure ValidarOrdensServico(ItensFiscais: OSItemFiscalEtdlList);
    procedure MarcarOSComoProcessada(const Grupo: NFSeAgrupamentoOS; const NFSeId: string);
    procedure RegistrarRelacionamento(const Grupo: NFSeAgrupamentoOS; const NFSeId: string);
    procedure CalcularTributosNFSe(Nota: NFSeModel);
    function ObterNFSeExistente(const NFSeId: string): NFSeModel;
    function SalvarDpsNFSe(DPS: NFSeEtd; const ASerie: string): NFSeEtd;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      Session: ISessionContext;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      OSRepo: IPedVendaRepository;
      AgrupamentoNFSeOS: INFSeAgrupamentoService;
      ConfigNFSeFactory: IConfiguracaoNFSeService;
      InicializarNFSe: IInicializarDpsService;
      CalcularTributos: ICalcularTributosNFSeService;
      CalculoAplicador: INFSeCalculoAplicadorService;
      PrepararParaEmissao: IPrepararNFSeParaEmissaoService;
      EmitirNFSe: IEmitirNFSeService
    );
    function Executar(const Input: CriarNFSeAgrupadasInput): EmissaoLoteNFSeOutput;
  end;

implementation

uses
  SysUtils, StrUtils, Math, DateUtils,
  Classes, ValidacaoItemOutputUnit, CodigosErroValidacao, UpdatePedvendaVinculoNFSeCommandsUnit, NFSeOSEtdUnit,
  CalculoTributosNFSeOutputUnit, CalculoTributosNFSeInputUnit, CurrencyNullableUnit,
  StringServiceUnit, ITransactionUnit, IEntityValidatorUnit, NFSeTypesUnit, TributoDFeOrigemEnumUnit,
  ValidacaoNFSeFactoryUnit, EmitirLoteNFSeCommandUnit, NFSeAtualizarSituacaoTypesUnit, ValidationEntityOutputUnit;

{ CriarEmitirNFSeAgrupadasUseCase }

procedure CriarEmitirNFSeAgrupadasUseCase.ValidarOrdensServico(ItensFiscais: OSItemFiscalEtdlList);
var
  I: Integer;
  ItemOS: OSItemFiscalEtd;
  Erros: TStringList;
begin
  Erros := TStringList.Create;
  Erros.Sorted := True;
  Erros.Duplicates := dupIgnore;
  try
    for I := 0 to ItensFiscais.Count - 1 do
    begin
      ItemOS := ItensFiscais.Items[I];

      //if not ItemOS.NFSeId.IsNullOrWhiteSpace() then
        //Erros.Add(Format('OS número %d já processada', [ ItemOS.OSId ]));
      if ItemOS.NumRPSLegado.HasValue and (ItemOS.NumRPSLegado.Value > 0) then
        Erros.Add(Format('OS número %d já processada da forma antiga', [ ItemOS.OSId ]));
    end;

    for I := 0 to Erros.Count - 1 do
      FValidacoes.Add( Erros[I] );

  finally
    Erros.Free();
  end;
end;

procedure CriarEmitirNFSeAgrupadasUseCase.MarcarOSComoProcessada(const Grupo: NFSeAgrupamentoOS; const NFSeId: string);
var
  I: Integer;
begin
  for I := 0 to High(Grupo.RegistrosOS) do
  begin
    FOSRepo.VincularComNFSe( UpdatePedvendaVinculoNFSeCommand.Create(
      Grupo.RegistrosOS[I].NumeroOS,
      FSession.EmpresaId,
      Grupo.RegistrosOS[I].ServicosId,
      NFSeId
    ));
  end;
end;

function CriarEmitirNFSeAgrupadasUseCase.ObterNFSeExistente(const NFSeId: string): NFSeModel;
var
  Nota, Clone: NFSeModel;
  nf: NFSeEtd;
begin
  Nota := NFSeModel.Create(
    FNFSeRepo.GetNFSe(NFSeId, FSession.EmpresaId), FTributosDFeRepo.GetById( NFSeId, tdfoNFSe )
  );

  if not Nota.NFSe.EstaEmDigitacao() then
  begin
    Result := Nota;
    Exit;
  end;

  Clone := Nota.Clone();
  try try
    Nota.NFSe.AplicarAtribuirServico(Nota.NFSe.Servico);

    CalcularTributosNFSe(Nota);

    if not Nota.NFSe.IsEqualTo(Clone.NFSe) then
    begin
      case Nota.NFSe.NaturezaEmissao of
        nemtPrestadorWS:
          Nota.NFSe := FNFSeRepo.AlterarNFSeParaEmissao(Nota.NFSe);

        nemtPrestadorPortal, nemtTomadorTerceiros:
          Nota.NFSe := FNFSeRepo.AlterarNFSeEmitidaNoPortal(Nota.NFSe);

        else
          raise Exception.Create('CriarEmitirNFSeAgrupadasUseCase.ObterNFSeExistente case NaturezaEmissao');
      end;
    end;

    if Assigned(Nota.Tributo) and (not Assigned(Clone.Tributo) or not Nota.Tributo.IsEqualTo(Clone.Tributo)) then
      Nota.Tributo := FTributosDFeRepo.Post(Nota.Tributo);

    Result := Nota;

  except
    Nota.Free();
    raise;
  end;
  finally
    Clone.Free();
  end;
end;

procedure CriarEmitirNFSeAgrupadasUseCase.PrepararClassificarNotas(
  const Notas: NFSeModelList;
  const ConfigNFSe: ConfiguracaoNFSeModel;
  var NFSeIDsValidos, EmailsValidos: TArrayString
);
var
  i, iValid, iNotValid: Integer;
  DpsComFalha: TArrayString;
  Nota: NFSeModel;
  NFSePreparada: NFSeEtd;
  preparacaoResult: PreparacaoNFSeResult;
  validacoes: ValidationEntityOutput;
begin
  iValid := 0;
  iNotValid := 0;
  SetLength(NFSeIDsValidos, Notas.Count);
  SetLength(EmailsValidos, Notas.Count);
  SetLength(DpsComFalha, Notas.Count);
  for I := 0 to Notas.Count - 1 do
  begin
    Nota := Notas.Items[I];

    preparacaoResult := FPrepararParaEmissao.Preparar( Nota.NFSe.Id, FSession.EmpresaId, ConfigNFSe );

    NFSePreparada := preparacaoResult.NFSe;
    try
      validacoes := preparacaoResult.Validacoes;

      if validacoes.IsValid then
      begin
        NFSeIDsValidos[iValid] := NFSePreparada.Id;
        EmailsValidos[iValid] := StringService.Join(',', Nota.NFSe.ParticipantePrincipal.ListaEmails);
        Inc(iValid);
      end
      else
      begin
        DpsComFalha[iNotValid] := IntToStr(NFSePreparada.NDps.Value);
        Inc(iNotValid);
      end;
    finally
      NFSePreparada.Free();
    end;
  end;
  SetLength(NFSeIDsValidos, iValid);
  SetLength(EmailsValidos, iValid);
  SetLength(DpsComFalha, iNotValid);

  if iNotValid > 0 then
    FValidacoes.Add(
      'A lista de DPS/RPS abaixo não pode ser transmitida por conter falhas de validação %s%s',
      [ sLineBreak, StringService.Join(', ', DpsComFalha) ]
    );
end;

procedure CriarEmitirNFSeAgrupadasUseCase.RegistrarRelacionamento(const Grupo: NFSeAgrupamentoOS; const NFSeId: string);
var
  R: Integer;
  NOS: NFSeOSEtd;
begin
  for R := 0 to High(Grupo.RegistrosOS) do
  begin
    NOS := NFSeOSEtd.Create(
      0,
      NFSeId,
      Grupo.RegistrosOS[R].NumeroOS,
      'OS',
      FSession.EmpresaId,
      Grupo.RegistrosOS[R].ValorServicos,
      Grupo.RegistrosOS[R].ValorDescontos,
      0, 0, 0, 0, 0, 0
    );
    try
      FNFSeRepo.CriarRelacionamento( NOS );
    finally
      NOS.Free();
    end;
  end;
end;

procedure CriarEmitirNFSeAgrupadasUseCase.SepararItensPorStatus(const ItensFiscais: OSItemFiscalEtdlList; ComNF,
  SemNF: OSItemFiscalEtdlList);
var
  I: Integer;
begin
  for I := 0 to ItensFiscais.Count - 1 do
  begin
    if not ItensFiscais.Items[I].NFSeId.IsNullOrWhiteSpace then
      ComNF.Add(ItensFiscais.Items[I])
    else
      SemNF.Add(ItensFiscais.Items[I]);
  end;
end;

procedure CriarEmitirNFSeAgrupadasUseCase.CalcularTributosNFSe(Nota: NFSeModel);
var
	Tributos: CalculoTributosNFSeOutput;
  TribInput: CalculoTributosNFSeInput;
  NFSe: NFSeEtd;
  I: Integer;
begin
	try
		Tributos := FCalcularTributos.Executar( CalculoTributosNFSeInput.Create( Nota, True, True ));
		try
      FCalculoAplicador.AplicarCalculo( Nota, Tributos, True, True );

      if Tributos.Validacoes.IsValid then
        for I := 0 to Length(Tributos.Validacoes.Validacoes) - 1 do
          FValidacoes.Add(Tributos.Validacoes.Validacoes[I]);

    finally
			Tributos.Free();
		end;

    // Trantando dados que podem dar falha na validacao
    if Nota.NFSe.IsPadraoNacional() then
    begin
      Nota.NFSe.PTotTribSN := CurrencyNullable.Create( Nota.NFSe.PTotTribSN.Value );
      Nota.NFSe.PTotTribFed := CurrencyNullable.Create( Nota.NFSe.PTotTribFed.Value );
      Nota.NFSe.PTotTribEst := CurrencyNullable.Create( Nota.NFSe.PTotTribEst.Value );
      Nota.NFSe.PTotTribMun := CurrencyNullable.Create( Nota.NFSe.PTotTribMun.Value );
    end;

	except on E: Exception do
    FValidacoes.Add('Erro de execução: ' + E.Message);
	end;
end;

constructor CriarEmitirNFSeAgrupadasUseCase.Create(
  Connection: IDataBaseConnection;
  Session: ISessionContext;
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  OSRepo: IPedVendaRepository;
  AgrupamentoNFSeOS: INFSeAgrupamentoService;
  ConfigNFSeFactory: IConfiguracaoNFSeService;
  InicializarNFSe: IInicializarDpsService;
  CalcularTributos: ICalcularTributosNFSeService;
  CalculoAplicador: INFSeCalculoAplicadorService;
  PrepararParaEmissao: IPrepararNFSeParaEmissaoService;
  EmitirNFSe: IEmitirNFSeService
);
begin
  FConnection := Connection;
  FSession := Session;
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
  FOSRepo := OSRepo;
  FAgrupamentoNFSeOS := AgrupamentoNFSeOS;
  FConfigNFSeFactory := ConfigNFSeFactory;
  FInicializarNFSe := InicializarNFSe;
  FCalcularTributos := CalcularTributos;
  FCalculoAplicador := CalculoAplicador;
  FPrepararParaEmissao := PrepararParaEmissao;
  FEmitirNFSe := EmitirNFSe;

  FValidacoes := ValidacaoOutput.Create();
end;

function ObterDiscriminacaoServicos(
  const NFSeId: string; const OSIds: TArrayInteger; OSItens: OSItemFiscalEtdlList; ConfigNFSe: ConfiguracaoNFSeModel
): string;
var
  IT: OSItemFiscalEtd;
  I, J: Integer;
  A, O: TArrayString;
  S: string;
begin
  SetLength(A, 0);
  for I := 0 to High(OSIds) do
    for J := 0 to OSItens.Count - 1 do
    begin
      IT := OSItens.Items[J];
      if (IT.OSId = OSIds[I])
        or ( not IT.NFSeId.IsNullOrWhiteSpace() and (IT.NFSeId.Value = NFSeId)) then // OS ou Ids iguais
      begin
        if not IT.DescricaoPredefinida.IsNullOrWhiteSpace() then
          S := Trim(IT.DescricaoPredefinida.Value)

        else
          S := Trim(IT.Descricao);

        S := StringReplace( S, sLineBreak, ConfigNFSe.OpcoesDiscriminacao.LineBreaker, [ rfReplaceAll ]);

        if not MatchText(S, A) then
        begin
          SetLength(A, Length(A) + 1);
          A[High(A)] := S;
        end;
      end;
    end;

  if not ConfigNFSe.OpcoesDiscriminacao.SemObsOS then
    for I := 0 to High(OSIds) do
      for J := 0 to OSItens.Count - 1 do
      begin
        IT := OSItens.Items[J];
        if ((IT.OSId = OSIds[I]) or ( not IT.NFSeId.IsNullOrWhiteSpace() and (IT.NFSeId.Value = NFSeId))) // OS ou Ids iguais
          and not IT.ObservacaoOrdemServico.IsNullOrWhiteSpace() then
        begin
          S := Trim(IT.ObservacaoOrdemServico.Value);
          S := StringReplace( S, sLineBreak, ConfigNFSe.OpcoesDiscriminacao.LineBreaker, [ rfReplaceAll ]);

          if not MatchText(S, A) then
          begin
            SetLength(A, Length(A) + 1);
            A[High(A)] := S;
          end;
        end;
      end;

  Result := StringService.Join(ConfigNFSe.OpcoesDiscriminacao.LineBreaker, A);
end;

function CriarEmitirNFSeAgrupadasUseCase.Executar(const Input: CriarNFSeAgrupadasInput): EmissaoLoteNFSeOutput;
var
  transaction: ITransaction;
  OSAgrupadas: NFSeAgrupamentosOS;
  OSItens, OsItensComNF, OsItensSemNF: OSItemFiscalEtdlList;
  ConfigNFSe: ConfiguracaoNFSeModel;
  NFSeValidadas, NFSeCriadas, EmailsClientes: TArrayString;
  I, iCriadas: Integer;
  GerarPdf: Boolean;
  Nota: NFSeModel;
  Notas: NFSeModelList;
  emitirResult: EmissaoLoteNFSeOutput;
begin
  OsItensComNF := OSItemFiscalEtdlList.Create(False);
  OsItensSemNF := OSItemFiscalEtdlList.Create(False);
  Notas := NFSeModelList.Create();
  OSItens := FOSRepo.ListarItensFiscaisOS( Input.NumerosOS );
  transaction := FConnection.BeginTransaction();
  try try

    // 1. Validar OS selecionadas, se as mesmas podem ser emitidas no novo modelo, emitidas no legado nao devem permitir
    ValidarOrdensServico( OSItens );

    if not FValidacoes.IsValid then
    begin
      Result := EmissaoLoteNFSeOutput.Create( StringService.Split([','],''), FValidacoes, 0);
      Exit;
    end;

    // 2. Iniciando configuracao e parametros
    ConfigNFSe := FConfigNFSeFactory.Executar(FSession.EmpresaId);
    // PDF somente padrao nacional
    GerarPdf := Input.Imprimir and (ConfigNFSe.LayoutNFSe in [lytNacionalSemIbsCbs, lytNacionalComIbsCbs ]);

    // 3. Separando os Itens com notas já criadas e notas não criadas
    SepararItensPorStatus( OSItens, OsItensComNF, OsItensSemNF );

    // 4. Agrupa as Ordens  de Servico por cTribNac ou CLC116
    OSAgrupadas := FAgrupamentoNFSeOS.AgruparItensParaNFSe(OsItensSemNF, ConfigNFSe.AgruparPorCTribNac);

    // 5. Criar uam nova NFSe ou Adiciona o grupo em uma existente se corresponder o Cliente/Codigo Fiscal
    iCriadas := 0;
    for I := 0 to High(OSAgrupadas) do
    begin
      iCriadas := iCriadas
        + CriarMesclarNotas( Notas, OSAgrupadas[I], OsItensComNF, OsItensSemNF, ConfigNFSe );
    end;

    // 6. Adiciona a lista de processamento as notas restantes que ainda não foram adicionadas
    for I := 0 to OsItensComNF.Count - 1 do
    begin
      Nota := Notas.Find(OsItensComNF.Items[I].NFSeId.Value);
      if Nota = nil then
        Notas.Add(ObterNFSeExistente(OsItensComNF.Items[I].NFSeId.Value));
    end;

    SetLength(NFSeCriadas, Notas.Count);
    for I := 0 to Notas.Count - 1 do
      NFSeCriadas[I] := Notas.Items[I].NFSe.Id;

    // Para por aqui caso o usuario nao queira emitir direto
    if not Input.CriarEmitir then
    begin
      transaction.Commit();
      Result := EmissaoLoteNFSeOutput.Create( NFSeCriadas, FValidacoes, iCriadas );
      Exit;
    end;

    // 7. Preparando, validando e classificando as notas da lista de processamento
    PrepararClassificarNotas( Notas, ConfigNFSe, NFSeValidadas, EmailsClientes );

    // Salva tudo, notas criadas, alteradas
    transaction.Commit();

    if Length(NFSeValidadas) = 0 then
    begin
      Result := EmissaoLoteNFSeOutput.Create( NFSeCriadas, FValidacoes, iCriadas );
      Exit;
    end;

    if not Input.EnviarEmail then
      SetLength(EmailsClientes, 0);

    // 8. Chama o servico que envia
    emitirResult := FEmitirNFSe.Emitir( EmitirLoteNFSeCommand.Create(
      NFSeValidadas, FSession.EmpresaId, Input.Silent, EmailsClientes
    ));

    // 9. Adiciona as validacoes dessa classe com as validacoes do Servico
    FValidacoes.Add(emitirResult.Validacoes);

    // 10. Resultado Final
    Result := EmissaoLoteNFSeOutput.Create(
      NFSeValidadas,
      FValidacoes,
      emitirResult.TotalNotasCriadas,
      emitirResult.TotalNotasAutorizadas,
      emitirResult.TotalEmEmissao,
      emitirResult.TotalNotasRejeitadas,
      emitirResult.TotalFalhaRegistradas,
      emitirResult.TotalFalhasNaoTratadas,
      emitirResult.ArquivosPDF,
      emitirResult.NFSeIDsAutorizadas
    );

  except on E: Exception do
    begin
      transaction.Rollback();
      raise;
    end;
  end;
  finally
    OSItens.Free();
    OsItensComNF.Free();
    OsItensSemNF.Free();
    Notas.Free();
  end;
end;

function CriarEmitirNFSeAgrupadasUseCase.LocalizarNFSeExistenteNaLista(
  const ItensFiscais: OSItemFiscalEtdlList; ClienteId: Integer; const CodigoFiscal: string; AgruparPorCtribNac: Boolean
): string;
var
  I: Integer;
  Item: OSItemFiscalEtd;
begin
  Result := '';
  if not Assigned(ItensFiscais) then
    Exit;

  for I := 0 to ItensFiscais.Count - 1 do
  begin
    Item := ItensFiscais.Items[I];
    if not Assigned(Item) then
      Continue;

    // Verifica se item não é de terceiro, tem cliente/código fiscal compatível e já tem NFSeId
    if (not Item.IsTerceiro)
      and (Item.ClienteId = ClienteId)
      and not Item.NFSeId.IsNullOrWhiteSpace()
    then
      if AgruparPorCtribNac then
      begin
        if Item.CTribNac = CodigoFiscal then
        begin
          Result := Item.NFSeId.Value;
          Exit;
        end;
      end
      else if Item.CLC116 = CodigoFiscal then
      begin
        Result := Item.NFSeId.Value;
        Exit;
      end;
  end;
end;

function CriarEmitirNFSeAgrupadasUseCase.SalvarDpsNFSe(DPS: NFSeEtd; const ASerie: string): NFSeEtd;
var
  dhEmi: TDateTime;
  nfseId: string;
begin
  if DPS.Id = '' then
    Result := FNFSeRepo.CriarNFSeParaEmissao( DPS )
  else
    Result := FNFSeRepo.AlterarNFSeParaEmissao( DPS );

  nfseId := Result.Id;

  Result.Free();

  Result := FNFSeRepo.AtualizarNFSe( NFSeAtualizarNumeroRPSModel.Create(
    nfseId, FSession.EmpresaId, ASerie, IncMinute(Now(), -1)
  ));
end;

function CriarEmitirNFSeAgrupadasUseCase.CriarMesclarNotas(
  const Notas: NFSeModelList;
  const Grupo: NFSeAgrupamentoOS;
  const ComNF: OSItemFiscalEtdlList;
  const SemNF: OSItemFiscalEtdlList;
  const ConfigNFSe: ConfiguracaoNFSeModel
): Integer;
var
  I: Integer;
  Nota: NFSeModel;
  NFSe: NFSeEtd;
  NFSeID: string;
  DataCompetencia: TDate;
begin
  Result := 0; // Retorna a quantidade de notas criadas

  // 1. Localiza se o agrupamento Cliente/Codigo fiscal tem nota fiscal em edição criada
  NFSeID := LocalizarNFSeExistenteNaLista( ComNF, Grupo.ClienteId, Grupo.CodigoFiscal, ConfigNFSe.AgruparPorCTribNac);

  // 1.1 Nota já existe, procura na lista em processamento e acumula o valor
  if NFSeID <> '' then
  begin
    Nota := Notas.Find(NFSeID);
    if Nota = nil then
    begin
      NFSe := FNFSeRepo.GetNFSe(NFSeID, FSession.EmpresaId);
      if NFSe <> nil then
      begin
        Nota := NFSeModel.Create( NFSe, FTributosDFeRepo.GetById( NFSeID, tdfoNFSe ) );
        Notas.Add(Nota);
      end;
    end;

    // Nao encontrou a nota de jeito nenhum eu nao pode alterar, vai criar uma nova
    if (Nota = nil) or not Nota.NFSe.EstaEmDigitacao() then
      NFSeID := ''
    else
    begin
      Nota.NFSe.VServ.AddValue(Grupo.ValorServicos);
      Nota.NFSe.VDescIncond.AddValue(Grupo.ValorDescontos);
    end;
  end;

  // 1.2 Nota não existe, inicia com os dados da O.S.
  if NFSeID = '' then
  begin
    if ConfigNFSe.OpcoesDiscriminacao.DComptIgualDataAtual then
      DataCompetencia := Date
    else
      DataCompetencia := Grupo.DataPrestacao;

    Nota := FInicializarNFSe.Executar( InicializarDpsCommand.Create(
      FSession.EmpresaId,
      DataCompetencia,
      nemtPrestadorWS,
      Grupo.ClienteId,
      Grupo.ServicoId
    ));

    Nota.NFSe.VServ.SetValue(Grupo.ValorServicos);
    Nota.NFSe.VDescIncond.SetValue(Grupo.ValorDescontos);
    Inc(Result);
  end;

  // 2. Preenchimento dos campos restantes
  Nota.NFSe.XDescServ.SetValue( ObterDiscriminacaoServicos(
    NFSeID, Grupo.OSIDs, SemNF, ConfigNFSe
  ), IfThen(Nota.NFSe.IsPadraoNacional(), 1000, 2000) );

  if Nota.NFSe.DCompet.Value > Date then
    Nota.NFSe.DCompet.SetValue( Date() );

  // 3. Calculando os Tributos da Nota Fiscal
  CalcularTributosNFSe(Nota);

  // 4. Criando e Salvando NFSe no banco de dados
  Nota.NFSe := SalvarDpsNFSe( Nota.NFSe, ConfigNFSe.Serie );

  // 5. Registrar relacionamento (NovaNFSe <-> OS)
  RegistrarRelacionamento( Grupo, Nota.NFSe.Id );

  // 6. Marcar OS como processada
  MarcarOSComoProcessada( Grupo, Nota.NFSe.Id );

  // 7. Salvando Tributo DFe
  if Nota.Tributo <> nil then
  begin
    Nota.Tributo.Id := Nota.NFSe.Id;
    Nota.Tributo.Origem := tdfoNFSe;

    Nota.Tributo := FTributosDFeRepo.Post( Nota.Tributo ); // Simples, faz o replace do objeto
  end;

  // 8. Salva nota na lista de processadas somente se ainda nao está lá
  if Notas.Find(Nota.NFSe.Id ) = nil then
    Notas.Add( Nota );
end;

end.
