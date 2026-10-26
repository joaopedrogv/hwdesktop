unit UCentralDadosFiscais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, StdCtrls, ExtCtrls, uPadrao, ComCtrls,
  TipoComunsUnit, GrupoFiscalEtdUnit, TipoTributoFiscalEnumUnit,
  ProdutoAnexoResumoModelUnit;

type
  TFrmCentralDadosFiscais = class(TfrmPadrao)
    pnTop: TPanel;
    Label1: TLabel;
    pnBancoCalcSERPRO: TPanel;
    ScrollBox1: TScrollBox;
    Panel3: TPanel;
    Label2: TLabel;
    lbVersao: TLabel;
    Label3: TLabel;
    lbDataVersao: TLabel;
    btVerificarDbSerpro: TSpeedButton;
    pnAnexosGruposFiscaisIbsCbs: TPanel;
    lbQtdeAnexosDisplay: TLabel;
    lbQtdeAnexos: TLabel;
    Label5: TLabel;
    lbFonte: TLabel;
    btSair: TBitBtn;
    ProgressBar1: TProgressBar;
    pnLog: TPanel;
    edLog: TMemo;
    lbQtdeAnexosCompatDisplay: TLabel;
    lbQtdeAnexosCompat: TLabel;
    btCriarGruposFiscais: TSpeedButton;
    lbQtdeGruposFiscais: TLabel;
    lbQtdeGruposFiscaisDisplay: TLabel;
    Panel1: TPanel;
    lbQtdeNcmsIbsCbsCompatDisplay: TLabel;
    lbNcmsCompativeis1p1: TLabel;
    Label9: TLabel;
    lbProdutosCompativeis1p1: TLabel;
    Panel4: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Panel7: TPanel;
    Label4: TLabel;
    cbTipoTributo: TComboBox;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    btConfigurarProdutos1para1: TSpeedButton;
    Label22: TLabel;
    Panel8: TPanel;
    Label18: TLabel;
    lbNcmsCompativeisNp1: TLabel;
    Label20: TLabel;
    lbProdutosCompativeisNp1: TLabel;
    btConfigurarProdutosNpara1: TSpeedButton;
    Label23: TLabel;
    Panel9: TPanel;
    Label24: TLabel;
    lbNcmCompativeis: TLabel;
    Label26: TLabel;
    lbProdutosCompativeis: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    lbRevisaoMaisAntiga: TLabel;
    Label31: TLabel;
    lbRevisaoMaisRecente: TLabel;
    Label6: TLabel;
    lbProdutosIncompativeis: TLabel;
    Label10: TLabel;
    lbNcmsIncompativeis: TLabel;
    btConfigurarProdutosInconpativeis: TSpeedButton;
    Panel2: TPanel;
    Label8: TLabel;
    lbNcmRegulares: TLabel;
    Label12: TLabel;
    lbProdutosRegulares: TLabel;
    Panel5: TPanel;
    Label17: TLabel;
    lbNcmsInexistentes: TLabel;
    Label21: TLabel;
    lbProdutosInexistentes: TLabel;
    Label35: TLabel;
    lbNcmsExtintos: TLabel;
    Label33: TLabel;
    lbProdutosExtintos: TLabel;
    btCorrigirNCMs: TSpeedButton;
    procedure btCorrigirNCMsClick(Sender: TObject);
    procedure btConfigurarProdutosInconpativeisClick(Sender: TObject);
    procedure btConfigurarProdutosNpara1Click(Sender: TObject);
    procedure btConfigurarProdutos1para1Click(Sender: TObject);
    procedure btCriarGruposFiscaisClick(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure cbTipoTributoChange(Sender: TObject);
    procedure btVerificarDbSerproClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSairClick(Sender: TObject);
  private
    FTimerInit: TTimer;
    FDataReferencia: TDateTime;
    FTripoTribFiscal: TipoTributoFiscalEnum;
    FGruposFiscais: GruposFiscaisEtd;
    FAnexosCompativeis: TArrayString;
    FResumoProdutos: ProdutoAnexoResumoModel;

    procedure Init();
    // Alterna entre modo de processamento com Log ativo
    procedure Visual_ToggleProcessamentoAtivo(Ativo: Boolean);
    procedure Visual_UpdateCaptions();
    procedure ReloadAll();
    // Inicializacao das chamadas para atualizar o formulario
    procedure TimerInitTimer(Sender: TObject);
    //Obtetem a versao do banco de dados e atualiza o formulario
    procedure LoadVersaoDataBaseSERPRO();
    // Obtem os anexos e atualiza os formularios
    procedure LoadAnexosGruposFiscais();
    // Chamada de download do banco da calculadora via dll
    procedure DownloadBancoDadosCalculadora();

    // Metodo de log usado no callback do download via dll
    procedure DownloadLog(const AMessage: string);
    // Metodo de progress usado no callback do download via dll
    procedure DownloadProgress(Percent: Integer);
  public

  end;

var
  FrmCentralDadosFiscais: TFrmCentralDadosFiscais;

implementation

uses
  uDtmAtivo,
  hw_utils,
  ContainerUnit,
  DateTimeServiceUnit,
  StringServiceUnit,
  ObterResumoDadosFiscaisOutputUnit,
  CriarGruposFiscaisDeAnexosTypes,
  ObterResumoDadosFiscaisInputUnit, UCriarGruposFiscaisDeAnexos, Contnrs,
  StringNullableUnit, UVincularProdutosGruposFiscais, UCorrelacaoNcmProdutos,
  DateAndTimeNullableUnit;

{$R *.dfm}
               
type
  TMessageCallback = procedure(const AMessage: WideString); stdcall;
  TProgressCallback = procedure(Percent: Integer); stdcall;

var
  GProgressForm: TFrmCentralDadosFiscais;

procedure ProgressCallback(Percent: Integer); stdcall;
begin
  if Assigned(GProgressForm) then
    GProgressForm.DownloadProgress(Percent);
end;
procedure MessageCallback(Msg: WideString); stdcall;
begin
  if Assigned(GProgressForm) then
    GProgressForm.DownloadLog(string(Msg));
end;

procedure TFrmCentralDadosFiscais.btConfigurarProdutos1para1Click(
  Sender: TObject);
var
  F: TFrmVincularProdutosGruposFiscais;
  S: TArrayString;
  I: Integer;
  DataRevisaoProdutos: TDateTime;
begin
  inherited;
  if FTripoTribFiscal = tfIndefinido then
    Exit;

  if FResumoProdutos.PrimeiraRevisaoIbsCbs.IsNull then
    DataRevisaoProdutos := Now()
  else
    DataRevisaoProdutos := FResumoProdutos.PrimeiraRevisaoIbsCbs.Value;

  Application.CreateForm(TFrmVincularProdutosGruposFiscais, F);
  try
    F.Setup( TFrmVincularProdutosGruposFiscaisSetup.Create(
      fvcpVinculoExistente1para1,
      FTripoTribFiscal,
      FDataReferencia,
      DataRevisaoProdutos
    ));
    if f.ShowModal = mrOk then
      ReloadAll();

  finally
    F.Free();
  end;
end;

procedure TFrmCentralDadosFiscais.btConfigurarProdutosInconpativeisClick(
  Sender: TObject);
var
  F: TFrmVincularProdutosGruposFiscais;
  S: TArrayString;
  I: Integer;
  DataRevisaoProdutos: TDateTime;
begin
  inherited;
  if FTripoTribFiscal = tfIndefinido then
    Exit;

  if FResumoProdutos.PrimeiraRevisaoIbsCbs.IsNull then
    DataRevisaoProdutos := Now()
  else
    DataRevisaoProdutos := FResumoProdutos.PrimeiraRevisaoIbsCbs.Value;

  Application.CreateForm(TFrmVincularProdutosGruposFiscais, F);
  try
    F.Setup( TFrmVincularProdutosGruposFiscaisSetup.Create(
      fvcpVinculoIncompativeis,
      FTripoTribFiscal,
      FDataReferencia,
      DataRevisaoProdutos
    ));
    if f.ShowModal = mrOk then
      ReloadAll();

  finally
    F.Free();
  end;
end;

procedure TFrmCentralDadosFiscais.btConfigurarProdutosNpara1Click(
  Sender: TObject);
var
  F: TFrmVincularProdutosGruposFiscais;
  S: TArrayString;
  I: Integer;
  DataRevisaoProdutos: TDateTime;
begin
  inherited;
  if FTripoTribFiscal = tfIndefinido then
    Exit;

  if FResumoProdutos.PrimeiraRevisaoIbsCbs.IsNull then
    DataRevisaoProdutos := Now()
  else
    DataRevisaoProdutos := FResumoProdutos.PrimeiraRevisaoIbsCbs.Value;

  Application.CreateForm(TFrmVincularProdutosGruposFiscais, F);
  try
    F.Setup( TFrmVincularProdutosGruposFiscaisSetup.Create(
      fvcpVinculoExistenteNpara1,
      FTripoTribFiscal,
      FDataReferencia,
      DataRevisaoProdutos
    ));
    if f.ShowModal = mrOk then
      ReloadAll();

  finally
    F.Free();
  end;
end;

procedure TFrmCentralDadosFiscais.btCorrigirNCMsClick(Sender: TObject);
var
  F: TFrmCorrelacaoNcmProdutos;
begin
  inherited;
//  if FTripoTribFiscal = tfIndefinido then
//    Exit;

  Application.CreateForm(TFrmCorrelacaoNcmProdutos, F);
  try
//    F.Setup( TFrmVincularProdutosGruposFiscaisSetup.Create(
//      fvcpVinculoExistenteNpara1,
//      FTripoTribFiscal,
//      FDataReferencia,
//      DataRevisaoProdutos
//    ));
    F.Setup(FDataReferencia);
    if f.ShowModal = mrOk then
      ReloadAll();

  finally
    F.Free();
  end;
end;

procedure TFrmCentralDadosFiscais.btCriarGruposFiscaisClick(
  Sender: TObject);
var
  F: TFrmCriarGruposFiscaisDeAnexos;
  S: TArrayString;
  I: Integer;
begin
  inherited;
  if FTripoTribFiscal = tfIndefinido then
    Exit;

  SetLength(S, FGruposFiscais.Count);
  for I := 0 to FGruposFiscais.Count - 1 do
    S[I] := GrupoFiscalEtd(FGruposFiscais.Items[I]).Anexo.Value;

  Application.CreateForm(TFrmCriarGruposFiscaisDeAnexos, F);
  try
    F.Setup( TFrmCriarGruposFiscaisDeAnexosSetup.Create(
      S, FAnexosCompativeis, FDataReferencia, FTripoTribFiscal, 
    ));
    if f.ShowModal = mrOk then
      ReloadAll();

  finally
    F.Free();
  end;
end;

procedure TFrmCentralDadosFiscais.btSairClick(Sender: TObject);
begin
  Close();
end;

procedure TFrmCentralDadosFiscais.btVerificarDbSerproClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    Visual_ToggleProcessamentoAtivo(True);

    DownloadBancoDadosCalculadora();

    LoadVersaoDataBaseSERPRO();

  finally
    Visual_ToggleProcessamentoAtivo(False);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCentralDadosFiscais.cbTipoTributoChange(Sender: TObject);
begin
  inherited;
  FTripoTribFiscal := TipoTributoFiscalEnum(cbTipoTributo.ItemIndex + 1);

  FTimerInit.Enabled := False;
  FTimerInit.Enabled := True;
end;

procedure TFrmCentralDadosFiscais.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  FDataReferencia := DateTimePicker1.Date;
  FTimerInit.Enabled := False;
  FTimerInit.Enabled := True;
end;

procedure TFrmCentralDadosFiscais.DownloadBancoDadosCalculadora;
type
  //TProcUpdate = function (var BufferError: PAnsiChar; var BufferSize: Integer; callBack: TProgressCallback): Boolean; stdcall;
  TProcUpdate = function (
    MessageCallBack: TMessageCallback;
    ProgressCallBack: TProgressCallback
  ): Boolean; stdcall;
var
  dllHandle: THandle;
  procUpdate: TProcUpdate;
  buff: string;
  buffSize, newBuffSize: Integer;
  pbuff: PAnsiChar;
begin
  dllHandle := LoadLibrary(PAnsiChar('hw.nfe.dx.dll'));

  if dllHandle = 0 then
  begin
    ShowAtencao('Módulo de atualização não pode ser carregado. Contacte o suporte técnico');
    Exit;
  end;

  edLog.Lines.Clear;
  ProgressBar1.Max := 100;
  ProgressBar1.Position := 0;
  try
    @procUpdate := GetProcAddress(dllHandle, PChar('FiscalSincDadosFiscais'));

    GProgressForm := Self;
    try
      try
        procUpdate( @MessageCallback, @ProgressCallback );      

      except on E: Exception do
        ShowErro('Erro inesperado na execução: ' + E.Message);
      end;
    finally
      GProgressForm := nil;
    end;
  finally
    FreeLibrary( dllHandle );
    ShowAtencao(edLog.Lines.Text);
  end;
end;

procedure TFrmCentralDadosFiscais.DownloadLog(const AMessage: string);
begin
  edLog.Lines.Add(AMessage);
  Application.ProcessMessages();
end;

procedure TFrmCentralDadosFiscais.DownloadProgress(Percent: Integer);
begin
  ProgressBar1.Position := Percent;
  Application.ProcessMessages();
end;

procedure TFrmCentralDadosFiscais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FGruposFiscais.Free();

  Action := caFree;
  FrmCentralDadosFiscais := nil;

  inherited;
end;

procedure TFrmCentralDadosFiscais.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  Self.fechar := True;
  inherited;
end;

procedure TFrmCentralDadosFiscais.FormCreate(Sender: TObject);
begin
  inherited;
  FTimerInit := TTimer.Create(Self);
  FTimerInit.Enabled := False;
  FTimerInit.Interval := 1000;
  FTimerInit.OnTimer := TimerInitTimer;
  FGruposFiscais := GruposFiscaisEtd.Create();
  SetLength(FAnexosCompativeis, 0); 
end;

procedure TFrmCentralDadosFiscais.FormShow(Sender: TObject);
begin
  Init();  
end;

procedure TFrmCentralDadosFiscais.Init;
var
  I: Integer;
begin
  pnLog.Visible := False;
  pnLog.Align := alClient;
  ProgressBar1.Visible := False;
  edLog.Lines.Clear();

  cbTipoTributo.Items.Clear;      
  for I := (Ord(Low(TipoTributoFiscalEnum)) + 1) to Ord(High(TipoTributoFiscalEnum)) do
    cbTipoTributo.Items.Add(TipoTributoFiscalEnumDisplay[TipoTributoFiscalEnum(I)]);

  FDataReferencia := Date();
  FTripoTribFiscal := tfIndefinido;

  DateTimePicker1.Date := FDataReferencia;
end;

procedure TFrmCentralDadosFiscais.TimerInitTimer(Sender: TObject);
begin
  FTimerInit.Enabled := False;
  ReloadAll();
end;

procedure TFrmCentralDadosFiscais.Visual_ToggleProcessamentoAtivo(
  Ativo: Boolean);
begin
  btSair.Enabled := not Ativo;
  ScrollBox1.Visible := False;
  try
    ProgressBar1.Visible := Ativo;
    pnLog.Visible := Ativo;
    pnBancoCalcSERPRO.Visible := not Ativo;
    pnAnexosGruposFiscaisIbsCbs.Visible := not Ativo;
    if pnBancoCalcSERPRO.Visible then
    begin
      pnBancoCalcSERPRO.Top := pnTop.Top + pnTop.Height;
      pnAnexosGruposFiscaisIbsCbs.Top := pnBancoCalcSERPRO.Top + pnBancoCalcSERPRO.Height;
    end;
    
  finally
    ScrollBox1.Visible := True;
  end;
end;

procedure TFrmCentralDadosFiscais.Visual_UpdateCaptions;
begin

end;

procedure TFrmCentralDadosFiscais.LoadAnexosGruposFiscais;
var
  I, Count: Integer;
  G: GrupoFiscalEtd;
begin
  FGruposFiscais.Clear();
  with Container.GetInstance().ErpFeaturesFactory.CreateObterResumoDadosFiscaisUseCase()
    .Executar( ObterResumoDadosFiscaisInput.Create( FTripoTribFiscal, vDadosIni.cod_empresa, FDataReferencia ) )
  do
  try
    FResumoProdutos := ResumoProdutos;

    {$REGION 'Anexos'}

    // IbsCbs
    lbQtdeAnexos.Caption := IntToStr( Length(AnexosAgrupados) );
    lbQtdeAnexos.Hint := StringService.Join(', ', AnexosAgrupados );
    lbQtdeAnexosDisplay.Hint := lbQtdeAnexos.Hint;

    lbQtdeAnexosCompat.Caption := IntToStr( Length(AnexosCompativeisAgrupados) );
    lbQtdeAnexosCompat.Hint := StringService.Join(', ', AnexosCompativeisAgrupados );
    lbQtdeAnexosCompatDisplay.Hint := lbQtdeAnexosCompat.Hint;

    Count := 0;
    lbQtdeGruposFiscais.Hint := '';
    for I := 0 to GruposFiscais.Count - 1 do
    begin
      G := GruposFiscais.Items[I] as GrupoFiscalEtd;
      if G.TipoTributo = tfIBSCBS then
      begin
        if lbQtdeGruposFiscais.Hint <> '' then
          lbQtdeGruposFiscais.Hint := lbQtdeGruposFiscais.Hint + sLineBreak;
        lbQtdeGruposFiscais.Hint := lbQtdeGruposFiscais.Hint + G.Descricao;
      end;
      Inc(Count);
    end;
    lbQtdeGruposFiscais.Caption := IntToStr(Count);
    lbQtdeGruposFiscaisDisplay.Hint := lbQtdeGruposFiscais.Hint;

    while GruposFiscais.Count > 0 do
      FGruposFiscais.Add( GruposFiscais.Extract( GruposFiscais.Items[0]) );

    FAnexosCompativeis := AnexosCompativeisAgrupados;
    {$ENDREGION}

    {$REGION 'Ncms e Produtos'}

    if FResumoProdutos.PrimeiraRevisaoIbsCbs.IsNull then
      lbRevisaoMaisAntiga.Caption := 'Sem revisão'
    else
      lbRevisaoMaisAntiga.Caption := FormatDateTime('dd/MM/yyyy hh:mm', FResumoProdutos.PrimeiraRevisaoIbsCbs.Value);

    if FResumoProdutos.UltimaRevisaoIbsCbs.IsNull then
      lbRevisaoMaisRecente.Caption := 'Sem revisão'
    else
      lbRevisaoMaisRecente.Caption := FormatDateTime('dd/MM/yyyy hh:mm', FResumoProdutos.UltimaRevisaoIbsCbs.Value);

    lbNcmRegulares.Caption := IntToStr(FResumoProdutos.QtdeNcmsRegulares);
    lbNcmCompativeis.Caption := IntToStr(FResumoProdutos.QtdeNcmsCompativeisAnexo);
    lbNcmsCompativeis1p1.Caption := IntToStr(FResumoProdutos.QtdeNcmsCompativeisUmParaUm);
    lbNcmsCompativeisNp1.Caption := IntToStr(FResumoProdutos.QtdeNcmsCompativeisNParaUm);
    lbNcmsIncompativeis.Caption := IntToStr(FResumoProdutos.QtdeNcmsIncompativeis);
    lbNcmsInexistentes.Caption := IntToStr(FResumoProdutos.QtdeNcmsInexistentes);
    lbNcmsExtintos.Caption := IntToStr(FResumoProdutos.QtdeNcmsExtintos);

    lbProdutosRegulares.Caption := IntToStr(FResumoProdutos.QtdeProdutosRegulares);
    lbProdutosCompativeis.Caption := IntToStr(FResumoProdutos.QtdeProdutosCompativeisAnexo);
    lbProdutosCompativeis1p1.Caption := IntToStr(FResumoProdutos.QtdeProdutosCompativeisUmParaUm);
    lbProdutosCompativeisNp1.Caption := IntToStr(FResumoProdutos.QtdeProdutosCompativeisNParaUm);
    lbProdutosIncompativeis.Caption := IntToStr(FResumoProdutos.QtdeProdutosIncompativeis);
    lbProdutosInexistentes.Caption := IntToStr(FResumoProdutos.QtdeProdutosNcmInexistentes);
    lbProdutosExtintos.Caption := IntToStr(FResumoProdutos.QtdeProdutosNcmExtintos);

    {$ENDREGION}


  finally
    Free();
  end;

  Application.ProcessMessages();
end;

procedure TFrmCentralDadosFiscais.LoadVersaoDataBaseSERPRO;
begin
  with Container.GetInstance().ErpFeaturesFactory.CreateObterVersaoDadosFiscaisUseCase()
    .Executar()
  do
  begin
    lbFonte.Caption := Fonte;
    lbVersao.Caption := Versao;
    lbDataVersao.Caption := DateService.ParseLocal( Data );
  end;
  Application.ProcessMessages();
end;

procedure TFrmCentralDadosFiscais.ReloadAll;
begin
  Screen.Cursor := crHourGlass;
  try
    if not (FTripoTribFiscal in [ tfIBSCBS, tfIS ]) then
      Exit;

    Visual_UpdateCaptions();

    LoadVersaoDataBaseSERPRO();

    LoadAnexosGruposFiscais();
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.

