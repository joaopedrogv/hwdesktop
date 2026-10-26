unit UDownloadArquivosFiscaisForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ProgressWithLogFrameUnit, IProgressObserverUnit, ISqlLoggerUnit,
  Vcl.ExtCtrls, ArquivoDownloadModel, AtualizacaoCalculadoraModelUnit, ISincronizarDadosFiscaisUseCaseUnit,
  ISincronizarCalculadoraUseCaseUnit;

type
  TDownloadArquivosFiscaisForm = class(TForm)
    ProgressWithLogFrame1: TProgressWithLogFrame;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FLoggerCalc: ISqlLogger;
    FUIProgressObserver: IProgressObserver;
    FCloseAfter: Boolean;
    FCountErros: Integer;
    FSincronizarFiscalDist: ISincronizarDadosFiscaisUseCase;
    FSincronizarCalculadora: ISincronizarCalculadoraUseCase;
    FFiscalDist: TArray<ArquivoDownload>;
    FAtualizacaoCalculadora: AtualizacaoCalculadoraModel;

    procedure Execute();

    procedure StartEvent();
    procedure LeaveEvent();
    procedure CancelEvent();
    procedure OnErrorEvent(const Error: string);
  public
    procedure Setup(
      ASincronizarFiscalDist: ISincronizarDadosFiscaisUseCase; ASincronizarCalculadora: ISincronizarCalculadoraUseCase;
      const AFiscalDist: TArray<ArquivoDownload>; const AAtualizacaoCalculadora: AtualizacaoCalculadoraModel
    );
    property CloseAfter: Boolean read FCloseAfter write FCloseAfter;
    property CountErros: Integer read FCountErros;
    property UIProgress: IProgressObserver read FUIProgressObserver;
  end;

var
  DownloadArquivosFiscaisForm: TDownloadArquivosFiscaisForm;

implementation

{$R *.dfm}

uses
  StrUtils,
  UIProgressObserverUnit, SqlFileLoggerUnit, FileConfigUnit, UIUtilsUnit, SetupConfigUnit;

{ TDownloadArquivosFiscaisForm }

procedure TDownloadArquivosFiscaisForm.CancelEvent;
begin
  if UIUtils.ShowQuestion('Deseja mesmo cancelar o processamento?', True) <> IDYES then
    Exit;

  FUIProgressObserver.CancelRequest();
end;

procedure TDownloadArquivosFiscaisForm.Execute();
var
  updates: TArray<ArquivoDownload>;
  atualizacao: AtualizacaoCalculadoraModel;
begin
  FCountErros := 0;
  try
    if Length(FFiscalDist) > 0 then
      FSincronizarFiscalDist.Executar(FFiscalDist);

    //updates:= ContainerDFe.GetInstance().DFeFeaturesFactory.CreateObterArquivosFiscaisModificadosUseCase()
      //.Executar();

    //ContainerDFe.GetInstance().DFeFeaturesFactory.CreateSincronizarDadosFiscaisUseCase( FUIProgressObserver )
      //.Executar( updates );

    // Calculadora SERPRO via API Datasette: verificacao + aplicacao no mesmo
    // acionamento manual. Falha da calculadora nao interrompe o fluxo de arquivos.
    try
      //if FAtualizacaoCalculadora.HasValue then
        FSincronizarCalculadora.Executar(FAtualizacaoCalculadora);

      //atualizacao := ContainerDFe.GetInstance().DFeFeaturesFactory
        //.CreateObterAtualizacaoCalculadoraUseCase( FUIProgressObserver ).Executar();

      //if not atualizacao.IsNull then
        //ContainerDFe.GetInstance().DFeFeaturesFactory
          //.CreateSincronizarCalculadoraUseCase( FUIProgressObserver ).Executar( atualizacao );
    except
      on E: Exception do
        FUIProgressObserver.OnMessage('Falha na calculadora SERPRO');
    end;
  finally
    ProgressWithLogFrame1.OnComplete();
  end;
end;

procedure TDownloadArquivosFiscaisForm.FormCreate(Sender: TObject);
begin

  FLoggerCalc := SqlFileLogger.Create(
    FileConfig.CreateLog( ExtractFilePath(ParamStr(0)) + 'log\', 'calc-' )
  );

  FUIProgressObserver := UIProgressObserver.Create(
    ProgressWithLogFrame1.OnMessage,
    ProgressWithLogFrame1.OnWarning,
    OnErrorEvent,
    ProgressWithLogFrame1.OnProgress,
    ProgressWithLogFrame1.OnCounter,
    StartEvent,
    ProgressWithLogFrame1.OnComplete,
    ProgressWithLogFrame1.OnCancel
  );
end;

procedure TDownloadArquivosFiscaisForm.LeaveEvent;
begin
  Close();
end;

procedure TDownloadArquivosFiscaisForm.OnErrorEvent(const Error: string);
begin
  ProgressWithLogFrame1.OnError(Error);
end;

procedure TDownloadArquivosFiscaisForm.Setup(
  ASincronizarFiscalDist: ISincronizarDadosFiscaisUseCase; ASincronizarCalculadora: ISincronizarCalculadoraUseCase;
  const AFiscalDist: TArray<ArquivoDownload>; const AAtualizacaoCalculadora: AtualizacaoCalculadoraModel);
begin
  FSincronizarFiscalDist := ASincronizarFiscalDist;
  FSincronizarCalculadora := ASincronizarCalculadora;
  FFiscalDist := AFiscalDist;
  FAtualizacaoCalculadora := AAtualizacaoCalculadora;
end;

procedure TDownloadArquivosFiscaisForm.StartEvent;
begin
  ProgressWithLogFrame1.Start();
end;

procedure TDownloadArquivosFiscaisForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  ProgressWithLogFrame1.Setup( LeaveEvent, nil );

  Execute();

  if FCloseAfter then
  begin
    if CountErros > 0 then
      Sleep(1000 * 30);
    Close();
  end;

end;

end.


