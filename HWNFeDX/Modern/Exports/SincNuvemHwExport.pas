unit SincNuvemHwExport;

interface

implementation

uses
  SysUtils, StrUtils, Vcl.Forms, Windows,
  SetupDFeUnit, SetupUnit, UDownloadArquivosFiscaisForm, ContainerDFeUnit, IProgressObserverUnit,
  UIFormObserverFactoryUnit, AtualizacaoCalculadoraModelUnit, ISincronizarDadosFiscaisUseCaseUnit,
  ISincronizarCalculadoraUseCaseUnit, ArquivoDownloadModel, TipoComunsUnit;

procedure ChamarFormAtualizacao(
  AFiscalDist: TArray<ArquivoDownload>;
  AVerAtualizacao: AtualizacaoCalculadoraModel
);
var
  form: TDownloadArquivosFiscaisForm;
begin
  form := TDownloadArquivosFiscaisForm.Create(nil);
  try
    form.Setup(
      ContainerDFe.GetInstance().DFeFeaturesFactory.CreateSincronizarDadosFiscaisUseCase(form.UIProgress),
      ContainerDFe.GetInstance().DFeFeaturesFactory.CreateSincronizarCalculadoraUseCase(form.UIProgress),
      AFiscalDist, AVerAtualizacao
    );

    form.ShowModal;
  finally
    form.free();
  end;
end;

// Metodo interno de verificação de atualizacao
procedure FiscalSincDadosAtualizacaoResolvedorInterno(SilenciarSemAtualizacao: Boolean);
var
  observer: IProgressObserver;
  FiscalDist: TArray<ArquivoDownload>;
  VerAtualizacao: AtualizacaoCalculadoraModel;
  Existe: Boolean;
  S: string;
begin
  SetupDFeInitialize();
  try
    observer := UIFormObserverFactory.CreateSimple('Verificando atualização', False);

    FiscalDist := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateObterArquivosFiscaisModificadosUseCase()
      .Executar();
    VerAtualizacao := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateObterAtualizacaoCalculadoraUseCase(observer)
      .Executar();

    S := '';
    Existe := (Length(FiscalDist) > 0) or (VerAtualizacao.Estado = enNovaVersaoDisponivel);

    case VerAtualizacao.Estado of
      enNovaVersaoERP:
        Application.MessageBox(PChar(
          Format('Existe uma versão nova da base de dados da calculadora RTC que requer atualização do ' +
                 'Sistema. ' + sLineBreak +
                 'Atualize seu sistema quando possível para se manter em conformidade fiscal.' + sLineBreak + sLineBreak +
                 'Versão da base de dados instalada: %s' + sLineBreak +
                 'Versão da base de dados mais recente: %s' + sLineBreak,
                 [VerAtualizacao.VersaoLocal, VerAtualizacao.VersaoRemoto])),
          'Atenção', MB_OK
        );

      enVersaoCompativel:
        S := S + IfThen(S <> '', sLineBreak) +
          Format('Banco de dados da calculadora RTC já atualizado: %s', [VerAtualizacao.VersaoRemoto]);

      enNovaVersaoDisponivel:
        S := S + IfThen(S <> '', sLineBreak) +
          Format('Dados da calculadora RTC local: %s',[VerAtualizacao.VersaoLocal]) + sLineBreak +
          Format('Dados da calculadora RTC remoto: %s',[VerAtualizacao.VersaoRemoto]);
    end;

    if Length(FiscalDist) > 0 then
      S := S + IfThen(S <> '', sLineBreak) +
        Format('Outros Arquivos fiscais: %d ', [Length(FiscalDist)]);

    if Existe then
    begin
      S := 'Novas atualizações fiscais ' + sLineBreak + sLineBreak + S + sLineBreak + sLineBreak +
           'Deseja atualizar agora?';
      if Application.MessageBox(PChar(S), 'Atenção', MB_ICONQUESTION + MB_YESNO) <> ID_YES then
        Exit;

      ChamarFormAtualizacao(FiscalDist, VerAtualizacao);
    end
    else if not SilenciarSemAtualizacao then
    begin
      S := 'Sem novas atualizações fiscais' + IfThen(S <> '', sLineBreak + sLineBreak + S);
      Application.MessageBox(PChar(S), 'Atenção', MB_OK);
    end;

  finally
    observer := nil;
    // Como a conexao é criada por essa classe entao precisei chamar o disconect para nao dar erro
    AppSetup.DatabaseConnection.Disconnect();
    SetupDFeShutDown();
  end;
end;

// Verificação de atualizacao silenciosa, mensagem somente em caso de nova atualizacao
procedure FiscalSincDadosResolverAtualizacao(); stdcall;
begin
  FiscalSincDadosAtualizacaoResolvedorInterno(True);
end;

// Usuario clica em atualizar, mensagens precisa ser claras
procedure FiscalSincDadosComandarAtualizacao(); stdcall;
begin
  FiscalSincDadosAtualizacaoResolvedorInterno(False);
end;

procedure ErpSincConsultasSQL(Silent: Boolean); stdcall;
var
  observer: IProgressObserver;
begin
  SetupDFeInitialize();
  try
    observer := UIFormObserverFactory.CreateSimple('Sincronizando', Silent);

    ContainerDFe.GetInstance().DFeFeaturesFactory.CreateSincronizarConsultasSqlUseCase(observer)
      .Executar();

  finally
    observer := nil;
    AppSetup.DatabaseConnection.Disconnect();
    SetupDFeShutDown();
  end;
end;

function ErpSincConsultasExisteAtualizacao(Silent: Boolean): Boolean; stdcall;
var
  observer: IProgressObserver;
begin
  SetupDFeInitialize();
  try
    observer := UIFormObserverFactory.CreateSimple('Verificando', Silent);

    Result := ContainerDFe.GetInstance().DFeFeaturesFactory.CreateExisteAtualizacaoConsultasSqlUseCase(observer)
      .Executar();

  finally
    observer := nil;
    AppSetup.DatabaseConnection.Disconnect();
    SetupDFeShutDown();
  end;
end;

exports
  FiscalSincDadosResolverAtualizacao,
  FiscalSincDadosComandarAtualizacao,
  ErpSincConsultasSQL,
  ErpSincConsultasExisteAtualizacao;

end.
