unit UPrincipalCxl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, Buttons, UdtmBalcao,UdtmPrestacao, EnterantHw,
  ComCtrls, UClassesPend, StdCtrls, FileCtrl, ExtDlgs, uProcessamentosEmSegundoPlano,
  IBQuery, IBDatabase, Query_OOP, DBGrids;

const
  HW_MENS_UPDATE = WM_COPYDATA;

type
  Treestrutura_verificar_hwauto = procedure(VersaoBPL: PChar);
  Treestrutura_verificar_fiscal = procedure(VersaoBPL: PChar);         
  TSimpleProcedure = procedure();

  TOKEN_ELEVATION = record
    TokenIsElevated: DWORD;
  end;

  TVerificaHwSuporteAtivo = class(TThread)
  private
    { Private declarations }
    fImageLoaded: Boolean;
    FImagem: TImage;
    procedure SetImagem(const Value: TImage);
    function TaskRuning(ExeNameWithExtension: string): Boolean;
  protected
    procedure FreeImages; virtual;
    procedure LoadImages; virtual;
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    property Imagem: TImage read FImagem write SetImagem;
  end;

  TFrmPrincipalCxl = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Controles1: TMenuItem;
    PlanodeContas1: TMenuItem;
    N1: TMenuItem;
    MudardeUsurio1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Operaes1: TMenuItem;
    PendnciasdeVeculos1: TMenuItem;
    PendnciaCcia1: TMenuItem;
    PendnciasBalco1: TMenuItem;
    PendnciasOficina1: TMenuItem;
    LanamentosAvulsos1: TMenuItem;
    Fechamentododia1: TMenuItem;
    RecebimentosdePrestaes1: TMenuItem;
    ClculodeJuros1: TMenuItem;
    Relatrios1: TMenuItem;
    Panel1: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    NFe1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    RegistrarSoftware1: TMenuItem;
    N3: TMenuItem;
    Ajuda2: TMenuItem;
    FileListBox1: TFileListBox;
    RecibosAntecipados1: TMenuItem;
    NFSe1: TMenuItem;
    SuporteRemoto1: TMenuItem;
    PopupMenu1: TPopupMenu;
    VerDimensesdareaparaimagem1: TMenuItem;
    Definirplanodefundo11: TMenuItem;
    DefinirPlanodeFundo21: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    NoticiasHW: TMenuItem;
    N4: TMenuItem;
    POSVirtual1: TMenuItem;
    TransacaoAvulsa1: TMenuItem;
    Administrativo1: TMenuItem;
    N5: TMenuItem;
    Verificarnovaverso1: TMenuItem;
    HwUpdate1: TMenuItem;
    HistoricodeTransacoes1: TMenuItem;
    SuporteOnline: TMenuItem;
    TrayIconLicenca: TTrayIcon;
    pnAbout: TPanel;
    Panel5: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Label1: TLabel;
    Memo2: TMemo;
    BitBtn2: TBitBtn;
    TimerProcessamentos: TTimer;
    SpeedButton11: TSpeedButton;
    PendnciasdeEcommerce: TMenuItem;
    Configuracoes1: TMenuItem;
    Timer2: TTimer;
    procedure Timer2Timer(Sender: TObject);
    procedure Configuracoes1Click(Sender: TObject);
    procedure PendnciasdeEcommerceClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure TimerProcessamentosTimer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure SuporteOnlineClick(Sender: TObject);
    procedure HistoricodeTransacoes1Click(Sender: TObject);
    procedure HwUpdate1Click(Sender: TObject);
    procedure Verificarnovaverso1Click(Sender: TObject);
    procedure Administrativo1Click(Sender: TObject);
    procedure TransacaoAvulsa1Click(Sender: TObject);
    procedure NoticiasHWClick(Sender: TObject);
    procedure DefinirPlanodeFundo21Click(Sender: TObject);
    procedure Definirplanodefundo11Click(Sender: TObject);
    procedure VerDimensesdareaparaimagem1Click(Sender: TObject);
    procedure SuporteRemoto1Click(Sender: TObject);
    procedure NFSe1Click(Sender: TObject);
    procedure RegistrarSoftware1Click(Sender: TObject);
    procedure NFe1Click(Sender: TObject);
    procedure Controles1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ClculodeJuros1Click(Sender: TObject);
    procedure RecebimentosdePrestaes1Click(Sender: TObject);
    procedure LanamentosAvulsos1Click(Sender: TObject);
    procedure Fechamentododia1Click(Sender: TObject);
    procedure PendnciasOficina1Click(Sender: TObject);
    procedure PendnciasBalco1Click(Sender: TObject);
    procedure PendnciaCcia1Click(Sender: TObject);
    procedure PendnciasdeVeculos1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure MudardeUsurio1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FechaJanelasMDI(n: integer);
    procedure Menu_Rel(Sender: TObject);
    function _LerConfiguracoesRegistroString(NomeVariavel: string): string;
    procedure _GravaConfiguracoesString(NomeVariavel, Valor: string);
    function CloseQuery: Boolean; override;
  strict private
    procedure SetupModern();
    procedure SetupModernShutdown();
  private
    { Private declarations }
    cxlQuery: TIBQuery;
    cxlTransacao: TIBTransaction;
    hrpesquisa,HrFormpag,HFrBalcao, HFrOficina, HFrPrestacoes, HFrPedVenda,
      hdReestrutura: THandle;
    MySubItems: array[0..99] of TMenuItem; // Herbert
    fProcessamentoSegPlano: TProcessamentosEmSegundoPlano;
    fTimeNotification: TDateTime;
//    thHwSuporte: TVerificaHwSuporteAtivo;
     FtimerChavePeriodica: TTimer;
    FTimeExibirMensagemChavePeriodica: TTime;
    procedure FtimerChavePeriodicaTimer(Sender: TObject);
    procedure _abreHwUpdate(pForcaAtualizacao: Boolean = False);
    procedure _passaVersaoHwUpdate;
    procedure ExibirMensagemChavePeriodica;
    function abreFormAbout: boolean;

    function GridHandlerNeedQueryOOP(var usuario: string): TQuery_OOP;
    function CloseQueryMainFormMsg(AFormName: string; ADBGrid: TDBGrid; AForm: string; AFechar: Boolean; AExibirPerg: Boolean): Boolean;
    function ShowFormMainForm(AFormName: string; AForm: string): Boolean;
    function ShowModalFormMainForm(AFormName: string; AForm: string): Boolean;
    function verificaConfiguracoesJanela: string;
  public
    { Public declarations }
  end;

var
  FrmPrincipalCxl: TFrmPrincipalCxl;
  enterTela: TEnterHw;
  obFecd: TFecdCXL;
  vdiaf: Tdate;


implementation

uses funcoes, UpendBalcao, UpendPrestacao, UPendOficina,UpendVeiculos,UpendRec,uLancCxl,
  uDtmFormPag,uFecDia, uDtmAtivo, uDtmEntrada, URelCrystal, uDadosIni,Registry,
  uNewHw, uCCJ, TlHelp32, StrUtils, DateUtils, ShellAPI, hw_utils, hw_win_utils,
  hw_grid_utils, DB, uCadPadraoModal, uCadPadrao, uPadrao, LegacyDFeDLLAdapterUnit, DFeHwLibUnit;

function validaChaveEmpresa(tipo, vBanco, vcodEmpresa: string): boolean; stdcall; external 'cons40.dll';

function chaveDataLicenca(chave: PChar): PChar; stdcall; external 'cons40.dll';

function sistemasRegistrados(vcnpj: string): string; stdcall; external 'cons40.dll';

function registrarNovoSoftware(vcnpj: string): LongBool; stdcall; external 'cons40.dll';

procedure closeallAuditoria ;stdcall; external 'auditoria.dll';

function _exiteNews(pUsuario: PChar; pBancoHw: PChar): Boolean; stdcall; external 'cons40.dll';

{$R *.dfm}

function TFrmPrincipalCxl.abreFormAbout: boolean;
var
  formulario: TForm;
begin
  try
    formulario := TForm.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Sobre';
    formulario.BorderIcons:= [];
    pnAbout.Visible := True;
    pnAbout.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    pnAbout.Refresh;
    result := (formulario.ShowModal = mrOk);
  finally
    pnAbout.Visible := False;
    pnAbout.Parent := FrmPrincipalCxl;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TFrmPrincipalCxl.Administrativo1Click(Sender: TObject);
var
  vID: Integer;
begin
  if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
  begin
    Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
    Exit;
  end;
  if not vDadosIni.PesqPros('CXL077', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', obFecd.Buscas, True) then
    Exit;
  if not vDadosIni.operacaoPosVirtual(posADM, 'Operação Administrativo', '', 0, obFecd.Buscas) then
  begin
    vDadosIni.GravaAuditoria('CXL077', 'INICIAR', 'OPERACAO CANCELADA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', obFecd.Buscas);
    Exit;
  end
  else if vDadosIni.vPOSV.vLinhasImpressao.Count > 0 then
  begin
    if vDadosIni.vPOSV.retorno = retSucesso then
    begin

      vID := vDadosIni.gravaTransacaoPosVirtual(0, 'ADM', vDadosIni.getTerminalADM(obFecd.Buscas), 0, 0, 0, obFecd.Buscas);

      obFecd.Buscas.Transaction.Commit;
    end;
  end;

  if vDadosIni.vPOSV.retorno = retSucesso then
    vDadosIni.GravaAuditoria('CXL077', 'INICIAR', 'SUCESSO - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', IntToStr(vID), obFecd.Buscas)
  else
    vDadosIni.GravaAuditoria('CXL077', 'INICIAR', 'FALHA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', obFecd.Buscas);
end;

procedure TFrmPrincipalCxl.BitBtn2Click(Sender: TObject);
begin
  TForm(pnAbout.Parent).ModalResult := IDOK;
end;

procedure TFrmPrincipalCxl.ClculodeJuros1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCCJ, frmCCJ);
  frmCCJ.ShowModal;
end;

function TFrmPrincipalCxl.CloseQuery: Boolean;
type
	TCloseQueryMainFormMsg = function (AFormName: string; ADBGrid: TDBGrid; AForm: string; AFechar: Boolean; AExibirPerg: Boolean): Boolean of object;
  TSetCloseQueryMainFormMsg = procedure (evento: TCloseQueryMainFormMsg);
var
	setCloseQueryMainFormMsg: TSetCloseQueryMainFormMsg;
begin
	try
    if vDadosIni.vFormularios.AHandle = 0 then
    	CarregaPacote('pkFormularios', vDadosIni.vFormularios.AHandle);

    @setCloseQueryMainFormMsg := GetProcAddress(vDadosIni.vFormularios.AHandle, PChar('setEventoCloseQueryMainForm'));

    if Assigned(setCloseQueryMainFormMsg) then
      setCloseQueryMainFormMsg(nil);

    Result := inherited CloseQuery();
  finally
  	if not Result then
      setCloseQueryMainFormMsg(CloseQueryMainFormMsg);
  end;
end;

function TFrmPrincipalCxl.CloseQueryMainFormMsg(
	AFormName: string; ADBGrid: TDBGrid; AForm: string; AFechar: Boolean; AExibirPerg: Boolean): Boolean;
var
	X : Byte;
  vform: TForm;
  vTag: Integer;
begin
	Result := False;

  if (AFormName = 'frmPadrao') and (AForm = 'TfrmPadrao') then
  begin
  	Result := True;
    Exit;
  end;

  if AExibirPerg then
    if Assigned(ADBGrid) then
      if ADBGrid.DataSource <> nil then
        if ADBGrid.DataSource.DataSet.State in [dsInsert, dsEdit] then
          if Application.MessageBox('Deseja mesmo sair desta tela. Os dados não serão salvos.',
            'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
              Exit;

  if MDIChildCount > 0 then
    for X := 0 to Pred(MDIChildCount) do
      if (MDIChildren[X].Name = AFormName) then
      begin
        vform := MDIChildren[X];

        if Assigned(ADBGrid) then
          if ADBGrid.DataSource <> nil then
            if ADBGrid.DataSource.DataSet.State in [dsInsert, dsEdit] then
            begin
              if AForm = 'TfrmCadPadraoM' then
              begin
                if TfrmCadPadraoM(vform).PageControl1.ActivePage = TfrmCadPadraoM(vform).TabSheet1 then
                begin
                	try
                    vTag := TfrmCadPadraoM(vform).BitBtn5.Tag;
                    TfrmCadPadraoM(vform).BitBtn5.Tag := 99;// Não perguntar se vai fechar
                    TfrmCadPadraoM(vform).BitBtn5.Click;
                  finally
                    TfrmCadPadraoM(vform).BitBtn5.Tag := vTag;
                  end;
                end
                else
                  ADBGrid.DataSource.DataSet.Cancel;
              end
              else if AForm = 'TfrmCadPadrao' then
              begin
                if TfrmCadPadrao(vform).PageControl1.ActivePage = TfrmCadPadrao(vform).TabSheet1 then
                begin
                	try
                    vTag := TfrmCadPadrao(vform).BitBtn5.Tag;
                    TfrmCadPadrao(vform).BitBtn5.Tag := 99;// Não perguntar se vai fechar
                    TfrmCadPadrao(vform).BitBtn5.Click;
                  finally
                    TfrmCadPadrao(vform).BitBtn5.Tag := vTag;
                  end;
                end
                else
                  ADBGrid.DataSource.DataSet.Cancel;
              end
              else
                ADBGrid.DataSource.DataSet.Cancel;
            end;

        vform.Enabled := False;
        vform.DisableAlign;
        vform.DisableAutoRange;
        
        if AForm = 'TfrmCadPadraoM' then
        begin
        	if TfrmCadPadraoM(vform).PageControl1.ActivePage <> TfrmCadPadraoM(vform).TabSheet2 then
          begin
            TfrmCadPadraoM(vform).PageControl1.ActivePage := TfrmCadPadraoM(vform).TabSheet2;
            TfrmCadPadraoM(vform).TabSheet2.Show;
          end;
      	end
        else if AForm = 'TfrmCadPadrao' then
        begin
        	if TfrmCadPadrao(vform).PageControl1.ActivePage <> TfrmCadPadrao(vform).TabSheet2 then
          begin
            TfrmCadPadrao(vform).PageControl1.ActivePage := TfrmCadPadrao(vform).TabSheet2;
            TfrmCadPadrao(vform).TabSheet2.Show;
          end;
        end;

      	if vform.FormStyle <> fsMDIForm then
        	vform.FormStyle := fsMDIForm;
        vform.Visible := False;

        vform.EnableAlign;
        vform.EnableAutoRange;
        vform.Enabled := True;

        Exit;
      end;

  for X := 0 to Application.ComponentCount - 1 do
    if Application.Components[X] is TForm then
    	if not (TForm(Application.Components[X]) = Application.MainForm) then
        if TForm(Application.Components[X]).Name = AFormName then
        begin
        
        	if Assigned(ADBGrid) then
            if ADBGrid.DataSource <> nil then
              if ADBGrid.DataSource.DataSet.State in [dsInsert, dsEdit] then
              begin
                if AForm = 'TfrmCadPadraoM' then
                begin
                  if TfrmCadPadraoM(TForm(Application.Components[X])).PageControl1.ActivePage = TfrmCadPadraoM(TForm(Application.Components[X])).TabSheet1 then
                    TfrmCadPadraoM(TForm(Application.Components[X])).BitBtn5.Click
                  else
                    ADBGrid.DataSource.DataSet.Cancel;
                end
                else if AForm = 'TfrmCadPadrao' then
                begin
                  if TfrmCadPadrao(TForm(Application.Components[X])).PageControl1.ActivePage = TfrmCadPadrao(TForm(Application.Components[X])).TabSheet1 then
                    TfrmCadPadrao(TForm(Application.Components[X])).BitBtn5.Click
                  else
                    ADBGrid.DataSource.DataSet.Cancel;
                end
                else
                  ADBGrid.DataSource.DataSet.Cancel;
              end;

        	TForm(Application.Components[X]).Enabled := False;
          TForm(Application.Components[X]).DisableAlign;
          TForm(Application.Components[X]).DisableAutoRange;

          if AForm = 'TfrmCadPadraoM' then
          begin
          	if TfrmCadPadraoM(TForm(Application.Components[X])).PageControl1.ActivePage <> TfrmCadPadraoM(TForm(Application.Components[X])).TabSheet2 then
            begin
              TfrmCadPadraoM(TForm(Application.Components[X])).PageControl1.ActivePage := TfrmCadPadraoM(TForm(Application.Components[X])).TabSheet2;
              TfrmCadPadraoM(TForm(Application.Components[X])).TabSheet2.Show;
            end;
          end
          else if AForm = 'TfrmCadPadrao' then
          begin
          	if TfrmCadPadrao(TForm(Application.Components[X])).PageControl1.ActivePage <> TfrmCadPadrao(TForm(Application.Components[X])).TabSheet2 then
            begin
              TfrmCadPadrao(TForm(Application.Components[X])).PageControl1.ActivePage := TfrmCadPadrao(TForm(Application.Components[X])).TabSheet2;
              TfrmCadPadrao(TForm(Application.Components[X])).TabSheet2.Show;
            end;
          end;

          if not AFechar then
       			TForm(Application.Components[X]).OnClose := nil;

          if TForm(Application.Components[X]).FormStyle <> fsNormal then
          	TForm(Application.Components[X]).FormStyle := fsNormal;

          TForm(Application.Components[X]).EnableAlign;
          TForm(Application.Components[X]).EnableAutoRange;
          TForm(Application.Components[X]).Enabled := True;
        end;

  Result := True;
end;

procedure TFrmPrincipalCxl.Configuracoes1Click(Sender: TObject);
begin
	vDadosIni.configurarSistema('cxl_%', obFecd.buscas);
end;

procedure TFrmPrincipalCxl.Controles1Click(Sender: TObject);
//var
// teste: integer;
begin
//  teste:=strtoint('A');
end;

procedure TFrmPrincipalCxl.Definirplanodefundo11Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    _GravaConfiguracoesString(Image1.Name+'_01_' + vDadosIni.codEmpresa, OpenPictureDialog1.FileName);
end;

procedure TFrmPrincipalCxl.DefinirPlanodeFundo21Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    _GravaConfiguracoesString(Image1.Name+'_02_' + vDadosIni.codEmpresa, OpenPictureDialog1.FileName);
end;

procedure TFrmPrincipalCxl.ExibirMensagemChavePeriodica;
var
  vDataRegistro, AStrDataRegistroAviso: string;
  ADataRegistroAviso: TDateTime;
  vDiasVencimento: Extended;
  cQuery: TIBQuery;
begin
  if FTimeExibirMensagemChavePeriodica >= Time  then
    Exit;

  try

    AStrDataRegistroAviso := vDadosIni._LerConfiguracoesRegistroString('DataRegistroAviso');
    if not TryStrToDate(AStrDataRegistroAviso, ADataRegistroAviso) then
      ADataRegistroAviso := 0;

    if DateOf(ADataRegistroAviso) >= DateOf(Date) then
      Exit;

    cQuery:= dtmEnt.qrBuscas;
    vDataRegistro := vDadosIni._dtTemp(cQuery);
    if trim(vDataRegistro) <> '' then
      vDataRegistro := chaveDataLicenca(PChar(vDataRegistro));

    if (Trim(vDataRegistro) = '') or (Trim(vDataRegistro) = 'DATA_INVALIDA') then
    begin
      vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date));
      Exit;
    end;

    vDadosIni.vDataHora := vDadosIni.getDataBanco(cQuery);
    if (StrToDateTime(vDataRegistro) > vDadosIni.vDataHora) then
      vDiasVencimento := (StrToDateTime(vDataRegistro) - vDadosIni.vDataHora)
    else
      vDiasVencimento := 0;

    if ((vDiasVencimento >= 0) and (vDiasVencimento <= 5)) then
    begin
      cQuery.Close;
      cQuery.SQL.Text := 'select cod_faturamento, dataconsulta, datafaturamento, cast(' + vDadosIni.FusoDateTimeFb + ' as timestamp) datahora from NOTIFICACAO_API ' +
        ' where cnpj = ' + QuotedStr(Trim(vDadosIni.vEmp.vCNPJ));
      try
        cQuery.Open;

        if (cQuery.FieldByName('cod_faturamento').AsInteger <> 13) and         // Diferente de 13 não está barrado 
          (DateOf(cQuery.FieldByName('dataconsulta').AsDateTime) = DateOf(cQuery.FieldByName('datafaturamento').AsDateTime)) and     // data da consulta igual a data do faturamento(servidorHw)
          (DateOf(cQuery.FieldByName('dataconsulta').AsDateTime) = DateOf(cQuery.FieldByName('datahora').AsDateTime)) then  // data da consulta igual a data do cliente
          vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date))
        else
        if (cQuery.FieldByName('cod_faturamento').AsInteger = 13) and // 13 = barrado
          (DateOf(cQuery.FieldByName('dataconsulta').AsDateTime) = DateOf(cQuery.FieldByName('datafaturamento').AsDateTime)) and // dia atual da consulta
          (DateOf(cQuery.FieldByName('dataconsulta').AsDateTime) = DateOf(cQuery.FieldByName('datahora').AsDateTime)) then
        begin
          vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date));
          TrayIconLicenca.BalloonTitle := 'Chave periódica expirando';
          TrayIconLicenca.BalloonFlags := bfWarning;//bfInfo;
          TrayIconLicenca.BalloonHint := IntToStr(Trunc(vDiasVencimento)) + ' dia' + IfThen( Trunc(vDiasVencimento) > 1, 's')  +  ' para nova consulta';
          TrayIconLicenca.BalloonTimeout :=  30000;
          //TrayIconLicenca.Animate := True;
          TrayIconLicenca.Visible := True;
          TrayIconLicenca.ShowBalloonHint;
          FtimerChavePeriodica := TTimer.Create(Self);
          FtimerChavePeriodica.Interval := 10000;
          FtimerChavePeriodica.OnTimer := FtimerChavePeriodicaTimer;
          FtimerChavePeriodica.Enabled := True;
        end;

        cQuery.Close;
      except
        vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date));
      end;
    end
    else
      vDadosIni._GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date));
  finally
    FTimeExibirMensagemChavePeriodica := Time + EncodeTime(0, 1, 0, 0);
  end;
end;

procedure TFrmPrincipalCxl.Fechamentododia1Click(Sender: TObject);
begin
  SpeedButton6Click(sender);
end;

procedure TFrmPrincipalCxl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(fProcessamentoSegPlano) then
    FreeAndNil(fProcessamentoSegPlano);

//  UnloadPackage(HFrPedVenda);
  UnloadPackage(HFrPrestacoes);
  UnloadPackage(HFrBalcao);
  UnloadPackage(HrFormpag);
  UnloadPackage(hrpesquisa);
end;

procedure TFrmPrincipalCxl.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
	X: Integer;
begin
	if Self.Tag = 99 then
  	Canclose := True
  else
  	Canclose := Application.MessageBox('Deseja Sair do Sistema', 'Confirmação', MB_YESNO+MB_ICONQUESTION) = IDYES;

  if CanClose then
  begin
  	if MDIChildCount > 0 then
      for X := Pred(MDIChildCount) Downto 0 do
      begin
      	if MDIChildren[X] is TfrmCadPadraoM then
        	TfrmCadPadraoM(MDIChildren[X]).exibirPergFechar := False
        else if MDIChildren[X] is TfrmCadPadrao then
        	TfrmCadPadrao(MDIChildren[X]).exibirPergFechar := False
        else if MDIChildren[X] is TfrmPadrao then
        	TfrmPadrao(MDIChildren[X]).exibirPergFechar := False;

        MDIChildren[X].Close;
      end;

    closeallAuditoria;
    SetupModernShutdown();
  end;
end;

procedure TFrmPrincipalCxl.FormShow(Sender: TObject);
type
	TShowFormMainForm = function (AFormName: string; AForm: string): Boolean of object;
  TsetShowFormMainForm = procedure (evento: TShowFormMainForm);

  TShowModalFormMainForm = function (AFormName: string; AForm: string): Boolean of object;
  TsetShowModalFormMainForm = procedure (evento: TShowModalFormMainForm);

  TCloseQueryMainFormMsg = function (AFormName: string; ADBGrid: TDBGrid; AForm: string; AFechar: Boolean; AExibirPerg: Boolean): Boolean of object;
  TSetCloseQueryMainFormMsg = procedure (evento: TCloseQueryMainFormMsg);
var
  I: Integer;
  totMenu: Integer;
  vsubitem: TMenuItem;
  reestrutura_verificar_hwauto: Treestrutura_verificar_hwauto;
  reestrutura_verificar_fiscal: Treestrutura_verificar_fiscal;
  FileName: string;
  vDataRegistro: string;
  AStrDataRegistroAviso: string;
  ADataRegistroAviso: TDateTime;
  vDiasVencimento: Double;
  setShowFormMainForm: TsetShowFormMainForm;
  setShowModalFormMainForm: TsetShowModalFormMainForm;
  setCloseQueryMainFormMsg: TSetCloseQueryMainFormMsg;
begin
  if IniConf.ReadStr('TrimAppMemorySize', 'Ativo', 'N') = 'S' then
    vDadosIni.TrimAppMemorySize;
  try
  Self.FormStyle := fsMDIForm;
  SpeedButton5.Caption := 'Recibo'+#13+'Antecipado';
  SpeedButton6.Caption := 'Movimento'+#13+'Diário';
  SpeedButton8.Caption := 'Lançamento'+#13+'Avulso';
  CarregaPacote('pkativos',hrpesquisa);
  CarregaPacote('pkFormPag',HrFormpag );
  CarregaPacote('pkbalcao', HFrBalcao);
  CarregaPacote('pkprestacoes', HFrPrestacoes);
//  CarregaPacote('pkPedidoVenda', HFrPedVenda);
//  if dtmFP = nil then
//   dtmFP := TdtmFP.Create(Self);
  if dtmAtivo = nil then
   dtmAtivo:= TdtmAtivo.Create(Self);

  CarregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
  carregaDLLNfe;

  if DtmBalcao = nil then
    DtmBalcao := TDtmBalcao.Create(Self);
  if DtmPrestacao = nil then
    DtmPrestacao := TDtmPrestacao.Create(Self);
//  if DtmPedvenda = nil then
//    DtmPedvenda := TDtmPedvenda.Create(Self);

  CarregaPacote('pkEntrada',hrpesquisa);
  if DtmEnt = nil then
    DtmEnt := TDtmEnt.Create(Self);
  vDadosIni.vSistema := 'Cxl';

  dtmEnt.verificaEstruturaBancoDeDados;

  //Nova reestruturação
  hdReestrutura := 0;
  CarregaPacote('pkReestrutura', hdReestrutura);
  if hdReestrutura = 0 then
    Application.MessageBox('Pacote de reestruturação não carregado', 'Anteção', 0 + 64)
  else
  begin
    try
      @reestrutura_verificar_hwauto := GetProcAddress(hdReestrutura, 'reestrutura_verificar_hwauto');
      if Assigned(reestrutura_verificar_hwauto) then
        reestrutura_verificar_hwauto(PChar(vDadosIni.vVersaoBpl));
      if vDadosIni.GetIni('Configuracao', 'TerminalFiscal', 'N') = 'S' then
      begin
        @reestrutura_verificar_fiscal := GetProcAddress(hdReestrutura, 'reestrutura_verificar_fiscal');
        if Assigned(reestrutura_verificar_fiscal) then
          reestrutura_verificar_fiscal(PChar(vDadosIni.vVersaoBpl));
      end;
    except
      Application.MessageBox('Pacote de reestruturação não executado', 'Anteção', 0 + 64)
    end;
  end;

  if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True) then
  begin
    Abort;
    exit;
    Abort;
  end;

  if vDadosIni.SqlOpen('select DADOS_OFFLINE from EMPDESVOLV where COD_EMPDES = 1', dtmEnt.qrBuscas)
    .FieldByName('DADOS_OFFLINE').AsString = 'C' then
  begin
    Application.ProcessMessages;
    ShowAtencao('Caixa Auxiliar não podes ser usado em um banco de dados configurado para NFCe offline');
    Application.Terminate;
    PostMessage(FrmPrincipalCxl.Handle, WM_CLOSE, 0, 0);
  end;

  if vDadosIni._HwUpdateAtivado(dtmEnt.qrBuscas) then
  begin
    if vDadosIni._novaVersao(dtmEnt.qrBuscas) then
      _abreHwUpdate
    else if vDadosIni._novaVersaoBugSeq(dtmEnt.qrBuscas) then
    	_abreHwUpdate(True)
    else
      _passaVersaoHwUpdate;
  end
  else
    vDadosIni._novaVersao(dtmEnt.qrBuscas);

  if not dtmEnt.verificaEntrada then
  begin
    Exit;
    Abort;
  end;
  vDadosIni.setSistemasRregistrados(sistemasRegistrados(vDadosIni.vEmp.vCNPJ));

  SetupModern();

  if (not vDadosIni.vRegistro.vSisCaixaAuxiliar) then
  begin
    Panel1.Enabled := False;
    for I := 0 to MainMenu1.Items.Count - 1 do
      MainMenu1.Items[i].Enabled := False;
  end;
  if (not vDadosIni.vSistemasUsuario.vSisCaixaAuxiliar) then
  begin
    Application.ProcessMessages;
    Application.MessageBox(pchar('Usuário sem permissão para usar o CXL'), pchar('Erro'), MB_ICONERROR + MB_OK);
    Application.Terminate;
    PostMessage(FrmPrincipalCxl.Handle, WM_CLOSE, 0, 0);
  end;

  if vDadosIni.vEmp.vModoFaturamento <> 'S' then
    if vDadosIni.GetIni('MD', 'CXLSA', 'N') <> 'S' then //Caixa Auxiliar sempre ativo sem verificar a configuracao da empresa
    begin
      Application.ProcessMessages;
      Application.MessageBox(pchar('Módulo de Faturamento não ativado nas configurações da Empresa'), pchar('Erro'), MB_ICONERROR + MB_OK);
      Application.Terminate;
      PostMessage(FrmPrincipalCxl.Handle, WM_CLOSE, 0, 0);
    end;

  vDadosIni.abreStatusProcessamento('','Validando uso do Software', True);
  try

    if not validaChaveEmpresa('HW' + vDadosIni.vVersaoBpl, vDadosIni.vBancoHW, vDadosIni.CodEmpresa) then
    begin
      Application.Terminate;
      PostMessage(FrmPrincipalCxl.Handle, WM_CLOSE, 0, 0);
      Exit;
    end;
    {
    vDataRegistro := vDadosIni._dtTemp(dtmEnt.qrBuscas);
    if trim(vDataRegistro) <> '' then
	    vDataRegistro := chaveDataLicenca(PChar(vDataRegistro));

    AStrDataRegistroAviso := _LerConfiguracoesRegistroString('DataRegistroAviso');
    if not TryStrToDate(AStrDataRegistroAviso, ADataRegistroAviso) then
      ADataRegistroAviso := 0;

    if (Trim(vDataRegistro) <> '') and (Trim(vDataRegistro) <> 'DATA_INVALIDA') and (ADataRegistroAviso < Date) then
    begin
      vDadosIni.vDataHora := vDadosIni.getDataBanco(dtmEnt.qrBuscas);
      if (StrToDateTime(vDataRegistro) > vDadosIni.vDataHora) then
		   vDiasVencimento := (StrToDateTime(vDataRegistro) - vDadosIni.vDataHora)
      else
      	vDiasVencimento := 0;

      if ((vDiasVencimento >= 0) and (vDiasVencimento <= 5)) then
      begin
        _GravaConfiguracoesString('DataRegistroAviso', DateToStr(Date));
        TrayIconLicenca.BalloonTitle := 'Chave periódica expirando';
        TrayIconLicenca.BalloonFlags := bfWarning;//bfInfo;
        TrayIconLicenca.BalloonHint := IntToStr(Trunc(vDiasVencimento)) + ' dia' + IfThen( Trunc(vDiasVencimento) > 1, 's')  +  ' para nova consulta';
        TrayIconLicenca.BalloonTimeout :=  30000;
        //TrayIconLicenca.Animate := True;
        TrayIconLicenca.Visible := True;
        TrayIconLicenca.ShowBalloonHint;
        FtimerChavePeriodica := TTimer.Create(Self);
        FtimerChavePeriodica.Interval := 10000;
        FtimerChavePeriodica.OnTimer := FtimerChavePeriodicaTimer;
        FtimerChavePeriodica.Enabled := True;
      end;
    end;
    }

    if vDadosIni.vFormularios.AHandle = 0 then
      CarregaPacote('pkFormularios', vDadosIni.vFormularios.AHandle);

    @setShowFormMainForm      := GetProcAddress(vDadosIni.vFormularios.AHandle, PChar('setEventoShowFormMainForm'));

    @setShowModalFormMainForm      := GetProcAddress(vDadosIni.vFormularios.AHandle, PChar('setEventoShowModalFormMainForm'));

    @setCloseQueryMainFormMsg := GetProcAddress(vDadosIni.vFormularios.AHandle, PChar('setEventoCloseQueryMainForm'));

    if Assigned(setShowFormMainForm) then
      setShowFormMainForm(ShowFormMainForm);

    if Assigned(setShowModalFormMainForm) then
      setShowModalFormMainForm(ShowModalFormMainForm);

    if Assigned(setCloseQueryMainFormMsg) then
      setCloseQueryMainFormMsg(CloseQueryMainFormMsg);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;

  cxlTransacao := TIBTransaction.Create(Application);
  cxlQuery := TIBQuery.Create(Application);
  cxlTransacao.DefaultDatabase := dtmAtivo.bancoHw;
  cxlTransacao.Params.Add('read_committed');
  cxlTransacao.Params.Add('rec_version');
  cxlTransacao.Params.Add('nowait');
  cxlQuery.Database := dtmAtivo.bancoHw;
  cxlQuery.Transaction := cxlTransacao;

  GridHandlerSingleton.GetInstance().OnNeedQueryOOP := GridHandlerNeedQueryOOP;

  obFecd:=TFecdCXL.create;
  obFecd.DiaAberto;
  obFecd.abreFecDia;

//  Caption := 'Caixa Auxiliar 4.0 - HwSac - Hw Sistemas e Computadores';
  Caption := 'Caixa Auxiliar 4.0 - Hw Sistemas e Computadores - Empresa '+
  vdadosini.StrZero(strtoint(vDadosIni.codEmpresa),3)+'-'+vDadosIni.vEmp.vnomeEmpresa;

  Application.Title := 'Cxl - Caixa Auxiliar 4.0';

  if (not vDadosIni.vRegistro.vSisCaixaAuxiliar) then
  begin
    Ajuda1.Enabled := True;
    RegistrarSoftware1.Enabled := True;
    Ajuda2.Enabled := False;
    Sobre1.Enabled := False;
    StatusBar1.Panels[0].Text := 'Sistema não registrado';
    StatusBar1.Panels[1].Text := 'Sistema não registrado';
    StatusBar1.Panels[2].Text := 'Sistema não registrado';
    StatusBar1.Panels[3].Text := 'Sistema não registrado';
    StatusBar1.Panels[4].Text := 'Sistema não registrado';
    Caption := Caption +' - Sistema não registrado';
  end
  else
  begin
    StatusBar1.Panels[0].Text := 'Caixa Auxiliar 4.0 Versão: ' + vDadosIni._getVersaoCaption + ' - ' + copy(vDadosIni._getDataVersaoBpl, 4, 7);//' 12/2011';
    StatusBar1.Panels[1].Text := 'Usuário: ' + vDadosIni.vNomeUsuario;
    StatusBar1.Panels[2].Text := 'Nível: ' + IntToStr(vDadosIni.vNivel);
    StatusBar1.Panels[3].Text := 'Endereço: ' + vDadosIni.vBancoHW;
    StatusBar1.Panels[3].Width:=350;
    StatusBar1.Panels[4].Text := 'Dia Aberto: ' +DateToStr(vDadosIni.diaAbertoCxl);
    vdiaf:=vDadosIni.diaAbertoCxl;
  end;
  //  if vDadosIni.GetIni('MD', 'MFED', 'N') = 'S' then //MostrarFuncionalidadesEmDesenvolvimento
  vDadosIni.nfc_definirTokenEmissor;
  Memo2.Lines.Clear;
  Memo2.Lines.Add('Desenvolvido por Hw Sistemas e Computadores Ltda');
  Memo2.Lines.Add('Fone: 33 32725351');
  Memo2.Lines.Add('e-mail: suporte@hwsistemas.com.br');
  Memo2.Lines.Add('Home Page: www.hwsistemas.com.br');
  Memo2.Lines.Add('');
  Memo2.Lines.Add('Equipe de Desenvolvimento:');
  Memo2.Lines.Add('Herbert da Silva Costa');
  Memo2.Lines.Add('João Pedro R Costa');
  Memo2.Lines.Add('José Carlos Souza');
  Memo2.Lines.Add('Odilon Gonçalves da P. Junior');
  Memo2.Lines.Add('');
  Memo2.Lines.Add('Versão Sistema: '+ vDadosIni._getVersaoCaption + ' - ' + vDadosIni._getDataVersaoBpl);
  Memo2.Lines.Add('Versão Base Retaguarda: '+ vDadosIni.StrZero(vDadosIni.vVersaoBancoHw,4));
  Memo2.Lines.Add('Versão Processos: '+ vDadosIni.StrZero(vDadosIni.vVersaoTabelaProcessos,4));
  Memo2.Lines.Add('Emissor NFC-e Configurado: '+ vDadosIni.StrZero(vDadosIni.vNFConsumidor.CodEmissor, 3));

  try
//    FileListBox1.Directory :=
    //vDadosIni.VpastaRel;
    FileListBox1.Directory := ExtractFilePath(Application.Exename);
    FileListBox1.Refresh;
    if (FileListBox1.items.count - 1 >= 0) then
    begin
      MySubItems[2] := TMenuItem.Create(Self);
      MySubItems[2].Caption := 'Outros';
      MySubitems[2].Tag := 1;
      MySubitems[2].Name := 'OutrosRelatoriosEstoque';
      Relatrios1.Add(MySubItems[2]);
      //    i * 10;
//      MainMenu1.Items[3].Add(MySubItems[2]);
      vsubitem := MySubItems[2];
    end;
    for i := 0 to FileListBox1.Items.Count - 1 do
    begin
      //Não abrir relatório Recibo Programa Fidelidade
      if (trim(copy(FileListBox1.Items.Strings[i], 1, pos('.', FileListBox1.items.Strings[i]) - 1)) <> 'Recibo Programa Fidelidade') then
      begin
        MySubItems[i] := TMenuItem.Create(Self);
        MySubItems[i].Caption := copy(FileListBox1.Items.Strings[i], 1, pos('.', FileListBox1.items.Strings[i]) - 1);
        MySubItems[i].Hint := copy(FileListBox1.Items.Strings[i], 1, pos('.', FileListBox1.items.Strings[i]) - 1);
        // 'Novo Subitem ' + IntToStr(i);
        MySubitems[i].Tag := 1;
        MySubitems[i].Name := vDadosIni.StringReplace2(
        copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1),'çÇÃãÕõÊêÁáÀàÉéÍíÓóÚú&@-=+*{}()[] ',
                                              '                                 ',true );
        //i * 10;
        vsubitem.Add(MySubItems[i]);
        MySubItems[i].OnClick := Menu_Rel;
      end;
    end;
    FileListBox1.Directory := vDadosIni.vPastaRel + '\Cx\';
    totMenu := FileListBox1.Items.Count;

    for i := 0 to FileListBox1.Items.Count - 1 do
    begin
      if (copy(FileListBox1.Items.Strings[i], 1, pos('.', FileListBox1.items.Strings[i]) - 1) = 'Recebimento Caixa Auxiliar')
      or (copy(FileListBox1.Items.Strings[i], 1, pos('.', FileListBox1.items.Strings[i]) - 1) = 'Recebimentos Caixa Auxiliar') then
      begin
        MySubItems[i + totMenu] := TMenuItem.Create(Self);
        MySubItems[i + totMenu].Caption := copy(FileListBox1.Items.Strings[i], 1, pos('.', FileListBox1.items.Strings[i]) - 1);
        MySubItems[i + totMenu].Hint := copy(FileListBox1.Items.Strings[i], 1, pos('.', FileListBox1.items.Strings[i]) - 1);
        // 'Novo Subitem ' + IntToStr(i);
        MySubitems[i + totMenu].Tag := 1;
        MySubitems[i + totMenu].Name := vDadosIni.StringReplace2(
        copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1),'çÇÃãÕõÊêÁáÀàÉéÍíÓóÚú&@-=+*{}()[] ',
                                              '                                 ',true );
        //i * 10;
        vsubitem.Add(MySubItems[i + totMenu]);
        MySubItems[i + totMenu].OnClick := Menu_Rel;
        break;
      end;
    end;

    FileListBox1.Refresh;
  except
    on E: Exception do
    begin
      if messagedlg('Erro na criação do Menu, Mostrar Erro?', mtconfirmation, [mbYES, mbNO], 0) =
        mrYES then
        showmessage(E.Message);
    end;
  end;

  enterTela := TEnterHw.Create(Self);
  vDadosIni.enterTela := enterTela;
  enterTela.ClassList.Clear;
  enterTela.classList.Add('TMaskEdit');
  enterTela.classList.Add('TEdit');
  enterTela.classList.Add('TDBEdit');
  enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
  enterTela.classList.Add('TEditHw'); { Componente de Moeda e Inteiros HwSistemas melhorado}
  enterTela.classList.Add('TCheckBox');
  enterTela.classList.Add('TDBCheckBox');
  enterTela.classList.Add('TComboBox');
  enterTela.classList.Add('TDBComboBox');
  enterTela.classList.Add('TListBox');
  enterTela.classList.Add('TDBListBox');
  enterTela.classList.Add('TDBLookupListBox');
  enterTela.classList.Add('TDBLookupComboBox');
  enterTela.classList.Add('TSpinEdit');
  enterTela.classList.Add('TDateTimePicker');
  enterTela.classList.Add('TRadioGroup');
  enterTela.classList.Add('TDBRadioGroup');
  enterTela.classList.Add('TRadioButton');
  enterTela.classList.Add('TDBRadioButton');
  //
  SpeedButton11.Enabled:= (vDadosIni.vpecommerce = 'S') and (vDadosIni.vEcommerce.vHabilitarEcommerce);
  PendnciasdeEcommerce.visible:=(vDadosIni.vpecommerce = 'S') and (vDadosIni.vEcommerce.vHabilitarEcommerce);
  //
  SpeedButton4.Enabled:=(vDadosIni.vpoficina = 'S');
  PendnciasOficina1.visible:=(vDadosIni.vpoficina = 'S');
  NFSe1.Visible:=(vDadosIni.vpoficina = 'S');
  //
  SpeedButton1.Enabled:=(vDadosIni.vpveiculos = 'S');
  PendnciasdeVeculos1.visible:=(vDadosIni.vpveiculos = 'S');
  //
  SpeedButton3.Enabled:=(vDadosIni.vpbalcao = 'S');
  PendnciasBalco1.visible:=(vDadosIni.vpbalcao = 'S');

  FileName := _LerConfiguracoesRegistroString(Image1.Name+'_02_' + vDadosIni.codEmpresa);
  if not FileExists(FileName) then
  begin
    FileName := ExtractFilePath(Application.ExeName) + 'logohw4_2.jpg';
    vDadosIni.saveResourceToFile('fundo1366x768', 'jpg', FileName);
    if FileExists(FileName) then
      _GravaConfiguracoesString(Image1.Name+'_02_' + vDadosIni.codEmpresa, FileName);
  end;
  if FileExists(FileName) then
    Image1.Picture.LoadFromFile(FileName)
  else if FileExists( ExtractFilePath(Application.ExeName) + 'logo4_2.jpg' ) then
    Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo4_2.jpg');

//  if FileExists(  _LerConfiguracoesRegistroString(Image1.Name+'_2') ) then
//   Image1.Picture.LoadFromFile(_LerConfiguracoesRegistroString(Image1.Name+'_2'))
//  else if FileExists( ExtractFilePath(Application.ExeName) + 'logo4_2.jpg' ) then
//   Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo4_2.jpg');

  if vDadosIni.vAbrirNews <> 'N' then
  if _exiteNews(pchar(vDadosIni.vNomeUsuario), pchar(vDadosIni.vBancoHW)) then
      NoticiasHW.Click;

  vDadosIni.hw_registra_estatistica(Self.Name);

//  thHwSuporte := TVerificaHwSuporteAtivo.Create(True);
//  thHwSuporte.Imagem := Image1;
//  thHwSuporte.Resume;

  finally
    FTimeExibirMensagemChavePeriodica := Time + EncodeTime(0, 1, 0, 0);
    Timer1.Enabled := True;
    Timer2.Enabled := (vDadosIni.vCodPerfilHorasTrab > 0) and (not vDadosIni.vLoginPosHorarioTrab);
    TimerProcessamentos.Interval := 60 * 1000;
    TimerProcessamentos.Enabled  := True;
  end;
end;

procedure TFrmPrincipalCxl.FtimerChavePeriodicaTimer(Sender: TObject);
begin
  FtimerChavePeriodica.Enabled := False;

  if Assigned(TrayIconLicenca) then
  begin
    TrayIconLicenca.Animate := False;
    TrayIconLicenca.Visible := False;
  end;
end;

function TFrmPrincipalCxl.GridHandlerNeedQueryOOP(
  var usuario: string): TQuery_OOP;
begin
  usuario := vDadosIni.vNomeUsuario;
  Result:= QueryHelper.CreateObj(cxlQuery);
end;

procedure TFrmPrincipalCxl.HistoricodeTransacoes1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('POSV003', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', obFecd.buscas, True) then
    Exit;
  try
    vDadosIni.abreHistoricoTransacoesPOSVirtual;
  finally
  end;
end;

procedure TFrmPrincipalCxl.HwUpdate1Click(Sender: TObject);
var
  vProgRecep: THandle;
  vRetorno: Smallint;
  copyDataStruct : TCopyDataStruct;
begin

  vProgRecep:=FindWindow('TfrmHwUpdate', nil);
  if vProgRecep = 0 then
  begin
    Sleep(2000);
    Application.MessageBox('O Atualizador não esta em execução. O sistema irá tentar carregar o Atualizador. Tente novamente', 'Atenção', 0 + 64);
    vDadosIni.CreateProcessSimple( ExtractFilePath(Application.ExeName) + 'HwUpdate.exe HW_MENS_CONFIGURAR ' + vDadosIni.vVersaoBpl);
    Exit;
  end;

  copyDataStruct.dwData := 3; //use it to identify the message contents
  copyDataStruct.cbData := 1 + Length(vDadosIni.vVersaoBpl) ;
  copyDataStruct.lpData := PChar(vDadosIni.vVersaoBpl);

  vDadosIni.forcaFocoNoSistema(vProgRecep);
  vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@copyDataStruct)) ;
//  vDadosIni.forcaFocoNoSistema(Application.Handle);
  if vRetorno = 0 then
    Application.MessageBox('O Atualizador não esta respondendo', 'Atenção', 0 + 64)
  else if vRetorno = 2 then
    Application.MessageBox('Programa em Execução. Tente depois de alguns minutos', 'Atenção', 0 + 64);
end;

procedure TFrmPrincipalCxl.Label1Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil,
    PChar( vDadosIni.getConfSisStr('hw_url_servicos', obFecd.Buscas) + '/Clientes/ClDownloads/Release_' + vDadosIni.vVersaoDocRelease + '.pdf'), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmPrincipalCxl.LanamentosAvulsos1Click(Sender: TObject);
begin
  SpeedButton8Click(sender);
end;

procedure TFrmPrincipalCxl.Menu_Rel(Sender: TObject);
begin
    try
    Screen.Cursor := crHourGlass;
    Application.CreateForm(TFrRelCrystal, FrRelCrystal);
    FrRelCrystal.Caption := (Sender as TmenuItem).Hint;
    if (FrRelCrystal.Caption = 'Recebimento Caixa Auxiliar') or (FrRelCrystal.Caption = 'Recebimentos Caixa Auxiliar') then
    	FrRelCrystal.Hint := vDadosIni.vPastaRel + '\Cx\'
    else
	    FrRelCrystal.Hint := ExtractFilePath(Application.Exename);
    // vDadosIni.vPastaRel;
    FrRelCrystal.tag := vDadosIni.vNivel;
    FrRelCrystal.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.MudardeUsurio1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  TimerProcessamentos.Enabled  := False;
  try
    FechaJanelasMDI(0);
    dtmEnt.verificaEntrada;
    obFecd.abreFecDia;
    obFecd.DiaAberto;

    StatusBar1.Panels[1].Text := 'Usuário: ' + vDadosIni.vNomeUsuario;
    StatusBar1.Panels[2].Text := 'Nível: ' + IntToStr(vDadosIni.vNivel);
    StatusBar1.Panels[3].Text := 'Endereço: ' + vDadosIni.vBancoHW;
    StatusBar1.Panels[3].Width:=350;
    StatusBar1.Panels[4].Text := 'Dia Aberto: ' +DateToStr(vDadosIni.diaAbertoCxl);

    //  if vDadosIni.GetIni('MD', 'MFED', 'N') = 'S' then //MostrarFuncionalidadesEmDesenvolvimento
    vDadosIni.nfc_definirTokenEmissor;
    Memo2.Lines.Clear;
    Memo2.Lines.Add('Desenvolvido por Hw Sistemas e Computadores Ltda');
    Memo2.Lines.Add('Fone: 33 32725351');
    Memo2.Lines.Add('e-mail: suporte@hwsistemas.com.br');
    Memo2.Lines.Add('Home Page: www.hwsistemas.com.br');
    Memo2.Lines.Add('');
    Memo2.Lines.Add('Equipe de Desenvolvimento:');
    Memo2.Lines.Add('Herbert da Silva Costa');
    Memo2.Lines.Add('João Pedro R Costa');
    Memo2.Lines.Add('José Carlos Souza');
    Memo2.Lines.Add('Odilon Gonçalves da P. Junior');
    Memo2.Lines.Add('');
    Memo2.Lines.Add('Versão Sistema: '+ vDadosIni._getVersaoCaption + ' - ' + vDadosIni._getDataVersaoBpl);
    Memo2.Lines.Add('Versão Base Retaguarda: '+ vDadosIni.StrZero(vDadosIni.vVersaoBancoHw,4));
    Memo2.Lines.Add('Versão Processos: '+ vDadosIni.StrZero(vDadosIni.vVersaoTabelaProcessos,4));
    Memo2.Lines.Add('Emissor NFC-e Configurado: '+ vDadosIni.StrZero(vDadosIni.vNFConsumidor.CodEmissor, 3));

  //  Caption := 'Caixa Auxiliar 4.0 - HwSac - Hw Sistemas e Computadores';
    Caption := 'Caixa Auxiliar 4.0 - Hw Sistemas e Computadores - Empresa '+
    vdadosini.StrZero(strtoint(vDadosIni.codEmpresa),3)+'-'+vDadosIni.vEmp.vnomeEmpresa;

    Application.Title := 'Cxl - Caixa Auxiliar 4.0';
    vDadosIni.fechaStatusProcessamento;

    if vDadosIni.vAbrirNews <> 'N' then
    if _exiteNews(pchar(vDadosIni.vNomeUsuario), pchar(vDadosIni.vBancoHW)) then
      NoticiasHW.Click;
  finally
    FTimeExibirMensagemChavePeriodica := Time + EncodeTime(0, 1, 0, 0);
    Timer1.Enabled := True;
    Timer2.Enabled := (vDadosIni.vCodPerfilHorasTrab > 0) and (not vDadosIni.vLoginPosHorarioTrab);
    TimerProcessamentos.Interval := 60 * 1000;
    TimerProcessamentos.Enabled  := True;
  end;
end;

procedure TFrmPrincipalCxl.NFe1Click(Sender: TObject);
begin
//  carregaDLLNfe;
  VisualizaNFe('N', Pchar(trim(vDadosIni.vBancoHW)), strtoint(vDadosIni.CodEmpresa), Pchar('4.0'),
    pchar(vDadosIni.vNomeUsuario));
end;

procedure TFrmPrincipalCxl.NFSe1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('NF0108', 'VISUALIZAR', vDadosIni.vNomeUsuario, 'NFSE', '') then
    Exit;

  LegacyDFeDLLAdapter.ShowModuloNFSe(vDadosIni.vBancoHW, vDadosIni.Cod_Empresa, vDadosIni.vNomeUsuario);
end;

procedure TFrmPrincipalCxl.NoticiasHWClick(Sender: TObject);
begin
  Application.CreateForm(TfrmNews, frmNews);
  frmNews.ShowModal;
end;

procedure TFrmPrincipalCxl.PendnciaCcia1Click(Sender: TObject);
begin
SpeedButton2Click(sender);
end;

procedure TFrmPrincipalCxl.PendnciasBalco1Click(Sender: TObject);
begin
  SpeedButton3Click(Sender);
end;

procedure TFrmPrincipalCxl.PendnciasdeEcommerceClick(Sender: TObject);
begin
	SpeedButton11Click(Sender);
end;

procedure TFrmPrincipalCxl.PendnciasdeVeculos1Click(Sender: TObject);
begin
  SpeedButton1Click(Sender);
end;

procedure TFrmPrincipalCxl.PendnciasOficina1Click(Sender: TObject);
begin
SpeedButton4Click(sender);
end;

procedure TFrmPrincipalCxl.RecebimentosdePrestaes1Click(Sender: TObject);
begin
  SpeedButton10Click(sender);
end;

procedure TFrmPrincipalCxl.RegistrarSoftware1Click(Sender: TObject);
begin
  registrarNovoSoftware(vDadosIni.vEmp.vCNPJ);
end;

procedure TFrmPrincipalCxl.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmPrincipalCxl.SetupModern;
var
  ProcedureInitialize: TSimpleProcedure;
begin
  if vDadosIni.vModern.AHandle = 0 then
    CarregaPacote('pkModern', vDadosIni.vModern.AHandle);

  if vDadosIni.vModern.AHandle = 0 then
  begin
    Application.MessageBox('Pacote Modern não carregado', 'Atenção', 0 + 64);
    Exit;
  end;

  @ProcedureInitialize := GetProcAddress(vDadosIni.vModern.AHandle, 'ModernInitialize');
  if Assigned(ProcedureInitialize) then
    ProcedureInitialize();
end;

procedure TFrmPrincipalCxl.SetupModernShutdown;
var
  ProcedureInitialize: TSimpleProcedure;
begin
  if vDadosIni.vModern.AHandle = 0 then
    CarregaPacote('pkModern', vDadosIni.vModern.AHandle);

  if vDadosIni.vModern.AHandle = 0 then
  begin
    Application.MessageBox('Pacote Modern não carregado', 'Atenção', 0 + 64);
    Exit;
  end;

  @ProcedureInitialize := GetProcAddress(vDadosIni.vModern.AHandle, 'ModernShutDown');
  if Assigned(ProcedureInitialize) then
    ProcedureInitialize();
end;

function TFrmPrincipalCxl.ShowFormMainForm(AFormName: string; AForm: string): Boolean;
var
	Component: TComponent;
begin
	Result := False;

  if (AFormName = 'frmPadrao') and (AForm = 'TfrmPadrao') then
  begin
  	Result := True;
    Exit;
  end;

  Component := Application.FindComponent(AFormName);
  if Component <> nil then
    if Component is TForm then
    	if (not TForm(Component).Visible) then
      begin
      	TForm(Component).Enabled := False;
        TForm(Component).DisableAlign;
        TForm(Component).DisableAutoRange;

        if TForm(Component).WindowState = wsMaximized then
        	TForm(Component).WindowState := wsNormal;

        if TForm(Component).Position <> poScreenCenter then
        	TForm(Component).Position := poScreenCenter;

        if TForm(Component).FormStyle <> fsMDIChild then
      		TForm(Component).FormStyle := fsMDIChild;

        TForm(Component).Enabled := True;

        if AForm = 'TfrmCadPadraoM' then
        begin
        	TfrmCadPadraoM(TForm(Component)).Height := TfrmCadPadraoM(TForm(Component)).vHeight;
          TfrmCadPadraoM(TForm(Component)).Width  := TfrmCadPadraoM(TForm(Component)).vWidth;
	      end
        else if AForm = 'TfrmCadPadrao' then
        begin
        	TfrmCadPadrao(TForm(Component)).Height := TfrmCadPadrao(TForm(Component)).vHeight;
          TfrmCadPadrao(TForm(Component)).Width  := TfrmCadPadrao(TForm(Component)).vWidth;
	      end
        else if AForm = 'TfrmPadrao' then
        begin
        	TfrmPadrao(TForm(Component)).Height := TfrmPadrao(TForm(Component)).vHeight;
          TfrmPadrao(TForm(Component)).Width  := TfrmPadrao(TForm(Component)).vWidth;
        end;

        TForm(Component).Position := poScreenCenter;
        TForm(Component).EnableAlign;
        TForm(Component).EnableAutoRange;

      	if verificaConfiguracoesJanela = 'S' then
        	if TForm(Component).WindowState <> wsMaximized then
          
        	TForm(Component).WindowState := wsMaximized;

        TForm(Component).Show;

        Exit;
      end;

  Result := True;
end;

function TFrmPrincipalCxl.ShowModalFormMainForm(AFormName: string; AForm: string): Boolean;
var
	Component: TComponent;
begin
	Result := False;

  if (AFormName = 'frmPadrao') or (AForm = 'TfrmPadrao') then
  begin
  	Result := True;
    Exit;
  end;

  Component := Application.FindComponent(AFormName);
  if Component <> nil then
    if Component is TForm then
    	if (not TForm(Component).Visible) then
      begin
        TForm(Component).Enabled := False;
        TForm(Component).DisableAlign;
        TForm(Component).DisableAutoRange;

        if TForm(Component).WindowState <> wsNormal then
        	TForm(Component).WindowState := wsNormal;

        if TForm(Component).Position <> poScreenCenter then
          TForm(Component).Position := poScreenCenter;

        if TForm(Component).FormStyle <> fsNormal then
          TForm(Component).FormStyle := fsNormal;

        TForm(Component).Enabled := True;

        if AForm = 'TfrmCadPadraoM' then
        begin
        	TfrmCadPadraoM(TForm(Component)).Height := TfrmCadPadraoM(TForm(Component)).vHeight;
          TfrmCadPadraoM(TForm(Component)).Width  := TfrmCadPadraoM(TForm(Component)).vWidth;
	      end
        else if AForm = 'TfrmCadPadrao' then
        begin
        	TfrmCadPadrao(TForm(Component)).Height := TfrmCadPadrao(TForm(Component)).vHeight;
          TfrmCadPadrao(TForm(Component)).Width  := TfrmCadPadrao(TForm(Component)).vWidth;
	      end
        else if AForm = 'TfrmPadrao' then
        begin
        	TfrmPadrao(TForm(Component)).Height := TfrmPadrao(TForm(Component)).vHeight;
          TfrmPadrao(TForm(Component)).Width  := TfrmPadrao(TForm(Component)).vWidth;
        end;

        TForm(Component).Position := poScreenCenter;
        TForm(Component).EnableAlign;
        TForm(Component).EnableAutoRange;

        TForm(Component).ShowModal;

        Exit;
      end;

  Result := True;
end;

procedure TFrmPrincipalCxl.Sobre1Click(Sender: TObject);
begin
  abreFormAbout;
end;

procedure TFrmPrincipalCxl.SpeedButton10Click(Sender: TObject);
begin
  try
   if vDadosIni.PesqPros('CXL053','INICIAR',vDadosIni.vNomeUsuario,'','',obFecd.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    if FrmPendPrestacao = nil then
      Application.CreateForm(TFrmPendPrestacao, FrmPendPrestacao)
    else
      FrmPendPrestacao.Show;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.SpeedButton11Click(Sender: TObject);
begin
  try
   if vDadosIni.PesqPros('CXL086','INICIAR',vDadosIni.vNomeUsuario,'','',obFecd.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    vDadosIni.vformosreq:='REQ';
    vDadosIni.vformosecommerce:='S';
    if FrmPendBalcao = nil then
    begin
      Application.CreateForm(TFrmPendBalcao, FrmPendBalcao);
      FrmPendBalcao.Caption:='Pendência E-Commerce';
    end
    else
    begin
      FrmPendBalcao.Caption:='Pendência E-Commerce';
      FrmPendBalcao.show;
      FrmPendBalcao.CadPendReq.vecommerce:='S';
      FrmPendBalcao.CadPendReq.vtipdoc:='REQ';
      FrmPendBalcao.FormShow(Sender);
    end;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.SpeedButton1Click(Sender: TObject);
begin
  try
   if vDadosIni.PesqPros('CXL047','INICIAR',vDadosIni.vNomeUsuario,'','',obFecd.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    if FrmPendVeic = nil then
      Application.CreateForm(TFrmPendVeic, FrmPendVeic)
    else
      FrmPendVeic.show;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.SpeedButton2Click(Sender: TObject);
begin
//
end;

procedure TFrmPrincipalCxl.SpeedButton3Click(Sender: TObject);
begin
  try
   if vDadosIni.PesqPros('CXL048','INICIAR',vDadosIni.vNomeUsuario,'','',obFecd.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    vDadosIni.vformosreq:='REQ';
    vDadosIni.vformosecommerce:='N';
    if FrmPendBalcao = nil then
    begin
      Application.CreateForm(TFrmPendBalcao, FrmPendBalcao);
      FrmPendBalcao.Caption:='Pendência de Balcão';
    end
    else
    begin
      FrmPendBalcao.Caption:='Pendência de Balcão';
      FrmPendBalcao.show;
      FrmPendBalcao.CadPendReq.vecommerce:='N';
      FrmPendBalcao.CadPendReq.vtipdoc:='REQ';
      FrmPendBalcao.FormShow(Sender);
    end;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.SpeedButton4Click(Sender: TObject);
begin
{  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vformosreq:='OS';
    if FrmPendOficina = nil then
      Application.CreateForm(TFrmPendOficina, FrmPendOficina)
    else
      FrmPendOficina.Show;
  finally
    Screen.Cursor := crDefault;
  end;}
  try
   if vDadosIni.PesqPros('CXL049','INICIAR',vDadosIni.vNomeUsuario,'','',obFecd.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    vDadosIni.vformosreq:='OS';
    vDadosIni.vformosecommerce:='N';
    if FrmPendBalcao = nil then
    begin
      Application.CreateForm(TFrmPendBalcao, FrmPendBalcao);
      FrmPendBalcao.Caption:='Pendência de Serviços';
    end
    else
    begin
      FrmPendBalcao.Caption:='Pendência de Serviços';
      FrmPendBalcao.show;
      FrmPendBalcao.CadPendReq.vecommerce:='N';
      FrmPendBalcao.CadPendReq.vtipdoc:='OS';
      FrmPendBalcao.FormShow(Sender);
    end;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.SpeedButton5Click(Sender: TObject);
begin
  try
   if vDadosIni.PesqPros('CXL050','INICIAR',vDadosIni.vNomeUsuario,'','',obFecd.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    if FrmPendRec = nil then
      Application.CreateForm(TFrmPendRec, FrmPendRec)
    else
      FrmPendRec.show;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.SpeedButton6Click(Sender: TObject);
begin
  try
   if vDadosIni.PesqPros('CXL051','INICIAR',vDadosIni.vNomeUsuario,'','',obFecd.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    if FrmFecDia = nil then
      Application.CreateForm(TFrmFecDia, FrmFecDia)
    else
      FrmFecDia.show;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.SpeedButton7Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipalCxl.SpeedButton8Click(Sender: TObject);
begin
  try
   if vDadosIni.PesqPros('CXL052','INICIAR',vDadosIni.vNomeUsuario,'','',obFecd.Buscas,True) then
   begin
    Screen.Cursor := crHourGlass;
    if frmLancCXL = nil then
      Application.CreateForm(TfrmLancCXL, frmLancCXL)
    else
      frmLancCXL.show;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.SuporteOnlineClick(Sender: TObject);
var
  AEmail: string;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.ApiHwemailColaboradorValidoParaAcesso(obFecd.Buscas, AEmail) then
      vDadosIni.ApiHwCentralSuporte(obFecd.Buscas, AEmail);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalCxl.SuporteRemoto1Click(Sender: TObject);
begin
  vDadosIni.CreateProcessSimple('HwSuporte.exe');
end;

procedure TFrmPrincipalCxl.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[4].Text := 'Dia Aberto: ' +DateToStr(vDadosIni.diaAbertoCxl);
  if vDadosIni.diaAbertoCxl <> vdiaf then
  begin
   FechaJanelasMDI(1);
   vdiaf:=vDadosIni.diaAbertoCxl;
  end;

  ExibirMensagemChavePeriodica;

  if vDadosIni.vCodUsuario = 0 then
    Exit;

  if not Assigned(fProcessamentoSegPlano) then
  begin
    fProcessamentoSegPlano := TProcessamentosEmSegundoPlano.create;
    fTimeNotification := Now;
  end;

  if fTimeNotification <= Now then
  begin
    try
      
    finally
      fTimeNotification := Now + EncodeTime(00, 01, 00, 00);
    end;
  end;
end;

procedure TFrmPrincipalCxl.Timer2Timer(Sender: TObject);
var
	vAvisoFechaHorasTrab: boolean;
  cQuery: TIBQuery;
begin
	if Self.Tag = 99 then
  	Exit;

	if ((vDadosIni.vCodUsuario > 0) and (vDadosIni.codEmpresa <> '')) then
  begin
    vAvisoFechaHorasTrab := vDadosIni.vAvisoFechaHorasTrab;
    if Timer2.Interval = 60000 * (5) then
    begin
    	cQuery:= dtmEnt.qrBuscas;
      if vDadosIni.verificarFechamentoSistema(cQuery) then
        Timer2.Enabled  := False
      else if (vAvisoFechaHorasTrab) and (vDadosIni.vFecharSistema) then
      begin
      	Self.Tag := 99;
      	Close;
      end;
    end;

    Timer2.Interval := 60000 * (5);
  end;
end;

procedure TFrmPrincipalCxl.TimerProcessamentosTimer(Sender: TObject);
begin
  //1 minuto
  if Assigned(fProcessamentoSegPlano) then
  begin
    fProcessamentoSegPlano.verificarServiceLessNFCe;
    fProcessamentoSegPlano.verificarNotificacoesApiHw;
    fProcessamentoSegPlano.verificarTrimAppMemorySize;
  end;
end;

procedure TFrmPrincipalCxl.TransacaoAvulsa1Click(Sender: TObject);
var
  vTerminalAdm: string;
  vID: Integer;
begin
  if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
  begin
    Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
    Exit;
  end;
  if not vDadosIni.PesqPros('CXL076', 'INICIAR', vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', obFecd.Buscas, True) then
    Exit;
  if not vDadosIni.operacaoPosVirtual(posCRT, 'Informe o valor da operação', '', 0, obFecd.Buscas) then
  begin
    vDadosIni.GravaAuditoria('CXL076', 'INICIAR', 'OPERACAO CANCELADA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', obFecd.Buscas);
    Exit;
  end;

  if vDadosIni.vPOSV.retorno = retSucesso then
  begin
//    obFecd.Buscas.Close;
//    obFecd.Buscas.SQL.Text :=
//      'select t.cod_term_adm, a.descricao_adm, t.desc_term_adm from adm_cartao a' +
//      ' inner join terminal_cartao t on t.cod_adm = a.cod_adm and t.cod_empresa = a.cod_empresa' +
//      ' where a.redes like ''%|''||' + QuotedStr(Trim(vDadosIni.vPOSV.retornoREDE)) +
//      '||''|%'' and a.cod_empresa = :cod_empresa and t.tipo = ''D''' +
//      ' and t.cod_terminalf = :cod_terminalf';
//    obFecd.Buscas.ParamByName('COD_EMPRESA').AsInteger := StrToIntDef(vDadosIni.codEmpresa, 0);
//    obFecd.Buscas.ParamByName('COD_TERMINALF').AsInteger :=
//      vDadosIni.retornoPorCondicao( StrToIntDef(vDadosIni.vCodTerminal, 0) > 0,
//        StrToIntDef(vDadosIni.vCodTerminal, 0),
//        StrToIntDef(Trim(vDadosIni.GetIni('TEF', 'TerminalF', '0')), 0));
//    obFecd.Buscas.Open;
//
//    if obFecd.Buscas.RecordCount = 1 then
//      vTerminalAdm := obFecd.Buscas.FieldByName('cod_term_adm').AsString;

    vTerminalAdm := vDadosIni.getTerminalADM(obFecd.buscas);

    vID := vDadosIni.gravaTransacaoPosVirtual(0, 'AVL', vTerminalAdm, StrToIntDef(vDadosIni.vPOSV.numeroDocumento,0), 0, 0, obFecd.Buscas);

    obFecd.Buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('CXL076', 'INICIAR',
        'SUCESSO - AVL ' + vDadosIni.vPOSV.numeroDocumento + 'VL: ' + Format('%0.2n', [vDadosIni.vPOSV.valorOperacao]) +
        '-AUT:' + vDadosIni.vPOSV.retornoAUT + '-NSU:' + vDadosIni.vPOSV.retornoNSU, 'TRANSACAO_CARTAO', IntToStr(vID), obFecd.Buscas);
  end
  else
    vDadosIni.GravaAuditoria('CXL076', 'INICIAR', 'FALHA - ' + vDadosIni.vNomeUsuario, 'TRANSACAO_CARTAO', '', obFecd.Buscas);
end;

procedure TFrmPrincipalCxl.VerDimensesdareaparaimagem1Click(Sender: TObject);
begin
  Application.MessageBox(pchar(IntToStr(Image1.Width)+ 'x' + IntToStr(Image1.Height)
  ), 'Informação', 0 + 64);
end;

function TFrmPrincipalCxl.verificaConfiguracoesJanela: string;
var
  Registro: TRegistry;
  vTemp, vTemp2: string;
begin
	try
    Result := '';
    Registro := TRegistry.Create;
    try
      Registro.OpenKey('Software\Hw\Configuracao\Telas\TfrmPrincipalS', True);
      try
        Result := Registro.ReadString('JanelasMaximizadas');
      except
      end;
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmPrincipalCxl.Verificarnovaverso1Click(Sender: TObject);
var
  vProgRecep: THandle;
  vRetorno: Smallint;
  copyDataStruct : TCopyDataStruct;
begin

  vProgRecep:=FindWindow('TfrmHwUpdate', nil);
  if vProgRecep = 0 then
  begin
    Sleep(2000);
    Application.MessageBox('O Atualizador não esta em execução. O sistema irá tentar carregar o Atualizador. Tente novamente', 'Atenção', 0 + 64);
    vDadosIni.CreateProcessSimple( ExtractFilePath(Application.ExeName) + 'HwUpdate.exe HW_MENS_ABRIR ' + vDadosIni.vVersaoBpl);
    Exit;
  end;

  copyDataStruct.dwData := 2; //use it to identify the message contents
  copyDataStruct.cbData := 1 + Length(vDadosIni.vVersaoBpl) ;
  copyDataStruct.lpData := PChar(vDadosIni.vVersaoBpl);

  vDadosIni.forcaFocoNoSistema(vProgRecep);
  vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@copyDataStruct)) ;
  if vRetorno = 0 then
    Application.MessageBox('O Atualizador não esta respondendo', 'Atenção', 0 + 64)
  else if vRetorno = 2 then
    Application.MessageBox('Programa em Execução. Tente depois de alguns minutos', 'Atenção', 0 + 64)
  else if vRetorno = 4 then
    Halt(0)
  else if vRetorno = 6 then
    Application.MessageBox('Programa em Execução. Tente depois de alguns minutos', 'Atenção', 0 + 64)
end;

procedure TFrmPrincipalCxl.FechaJanelasMDI(n: integer);
var
  X : Byte;
begin
  if MDIChildCount > 0 then
    for X := Pred(MDIChildCount) Downto 0 do
    begin
      if n = 0 then
      begin
      	if MDIChildren[X] is TfrmCadPadraoM then
        	TfrmCadPadraoM(MDIChildren[X]).exibirPergFechar := False
        else if MDIChildren[X] is TfrmCadPadrao then
        	TfrmCadPadrao(MDIChildren[X]).exibirPergFechar := False
        else if MDIChildren[X] is TfrmPadrao then
        	TfrmPadrao(MDIChildren[X]).exibirPergFechar := False;

        MDIChildren[X].Close;
      end
      else
      begin
        if MDIChildren[x].Caption <> 'Fechamento do dia...' then
        begin
        	if MDIChildren[X] is TfrmCadPadraoM then
            TfrmCadPadraoM(MDIChildren[X]).exibirPergFechar := False
          else if MDIChildren[X] is TfrmCadPadrao then
            TfrmCadPadrao(MDIChildren[X]).exibirPergFechar := False
          else if MDIChildren[X] is TfrmPadrao then
            TfrmPadrao(MDIChildren[X]).exibirPergFechar := False;

          MDIChildren[X].Close;
        end;
      end;
    end;
end;

function TFrmPrincipalCxl._LerConfiguracoesRegistroString(
  NomeVariavel: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    vTemp := '';
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadString(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmPrincipalCxl._abreHwUpdate(pForcaAtualizacao: Boolean = False);
var
  vProgRecep : THandle;
  vRetorno : integer;
  copyDataStruct : TCopyDataStruct;

  procedure ReiniciarAplicativoComoAdmin;
  var
    SEInfo: TShellExecuteInfo;
  begin
    FillChar(SEInfo, SizeOf(SEInfo), 0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    SEInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
    SEInfo.lpVerb := 'runas'; // Executa como Administrador
    SEInfo.lpFile := PChar(ParamStr(0)); // Caminho da própria aplicação
    SEInfo.lpParameters := nil;
    SEInfo.nShow := SW_SHOWNORMAL;

    if ShellExecuteEx(@SEInfo) then
    begin
      // Encerra a instância atual se a nova foi iniciada com sucesso
      Application.Terminate;
    end;
  end;

  procedure ReiniciarAplicativo;
  var
    SEInfo: TShellExecuteInfo;
  begin
    FillChar(SEInfo, SizeOf(SEInfo), 0);
    SEInfo.cbSize := SizeOf(TShellExecuteInfo);
    SEInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
    SEInfo.lpVerb := 'runas'; // Executa como Administrador
    SEInfo.lpFile := PChar(ParamStr(0)); // Caminho da própria aplicação
    SEInfo.lpParameters := nil;
    SEInfo.nShow := SW_SHOWNORMAL;

    if ShellExecuteEx(@SEInfo) then
    begin
      // Encerra a instância atual se a nova foi iniciada com sucesso
      Application.Terminate;
    end;
  end;

  function IsUserAdmin: Boolean;
  var
    TokenHandle: THandle;
    Elevation: TOKEN_ELEVATION;
    ReturnLength: DWORD;
  begin
    Result := False;
    if OpenProcessToken(GetCurrentProcess, TOKEN_QUERY, TokenHandle) then
    begin
      try
        if GetTokenInformation(
        	 TokenHandle,
          TTokenInformationClass(TokenUser), //TTokenInformationClass(TokenUser),
          @Elevation,
          SizeOf(Elevation),
          ReturnLength) then
          	Result := Elevation.TokenIsElevated <> 0;
      finally
        CloseHandle(TokenHandle);
      end;
    end;
  end;
begin
  try
    while true do
    begin

      vProgRecep:=FindWindow('TfrmHwUpdate', nil);
      if vProgRecep = 0 then
      begin
        Sleep(2000);
        Application.MessageBox('O Atualizador não esta em execução. O sistema irá tentar carregar o Atualizador. Tente novamente', 'Atenção', 0 + 64);
        vDadosIni.CreateProcessSimple( ExtractFilePath(Application.ExeName) + 'HwUpdate.exe HW_INSTALAR ' + vDadosIni.vVersaoBpl);
        Halt(0);
      end;

      copyDataStruct.dwData := vDadosIni.IfThen(pForcaAtualizacao, 5, 1); //use it to identify the message contents
      copyDataStruct.cbData := 1 + Length(vDadosIni.vVersaoBpl) ;
      copyDataStruct.lpData := PChar(vDadosIni.vVersaoBpl);

      vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@copyDataStruct)) ;

      if vRetorno = 0 then
      begin
        Application.MessageBox('O Atualizador não esta respondendo', 'Atenção', 0 + 64);
        if (vDadosIni.vTsPlus <> 'S') then
        begin
          if vDadosIni.IsProcessOpen('HwUpdate.exe') then
          begin
            if Application.MessageBox(PChar(
              'HwUpdate esta em execução e não esta respondendo.' + #13 + #13 +
              'Observações: ' + #13 +
              '1º - Verifique se o HwUpdate esta sendo executado com Administrador e o Sistema não.' + #13 +
              '2º - Execute o sistema como administrador para atualizar.' + #13 + #13 +
              'Deseja fechar e reiniciar aplicativo como Administrador?'),'Confirmação',MB_YESNO+MB_ICONQUESTION) <> IDYES then
              Halt(0)
            else
            begin
              if not IsUserAdmin then
              begin
                ReiniciarAplicativoComoAdmin;
                Break;
              end
              else
              begin
              	 ShellExecute(0, 'open', 'cmd.exe', PChar('/c taskkill /f /im HwUpdate.exe'), nil, SW_HIDE);
                Sleep(2000);

            	 if vDadosIni.IsProcessOpen('HwUpdate.exe') then
                begin
                  ShellExecute(0, 'runas', 'cmd.exe', PChar('/c taskkill /f /im HwUpdate.exe'), nil, SW_HIDE);
                  Sleep(2000);
                end;
              end;
            end;
          end;
        end;
      end
      else if vRetorno = 2 then
        Application.MessageBox('Programa em Execução. Tente depois de alguns instantes', 'Atenção', 0 + 64)
      else if vRetorno = 4 then
        Halt(0)
      else if vRetorno = 6 then
        Application.MessageBox('Programa em Execução. Tente depois de alguns minutos', 'Atenção', 0 + 64)
    end;
//      Halt(0);
  finally
    Halt(0);
  end;
end;

procedure TFrmPrincipalCxl._passaVersaoHwUpdate;
var
  vProgRecep : THandle;
  vRetorno : integer;
  copyDataStruct : TCopyDataStruct;
begin
  try

    vProgRecep:=FindWindow('TfrmHwUpdate', nil);
    if vProgRecep = 0 then
    begin
      Sleep(2000);
      vDadosIni.CreateProcessSimple( ExtractFilePath(Application.ExeName) + 'HwUpdate.exe HwSistemas ' + vDadosIni.vVersaoBpl);
      Exit;
    end;

    copyDataStruct.dwData := 4; //use it to identify the message contents
    copyDataStruct.cbData := 1 + Length(vDadosIni.vVersaoBpl) ;
    copyDataStruct.lpData := PChar(vDadosIni.vVersaoBpl);

    vRetorno := SendMessage(vProgRecep, HW_MENS_UPDATE, Integer(Handle), Integer(@copyDataStruct)) ;

  except
  end;
end;

procedure TFrmPrincipalCxl._GravaConfiguracoesString(NomeVariavel, Valor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

{ TVerificaHwSuporteAtivo }

constructor TVerificaHwSuporteAtivo.Create(CreateSuspended: Boolean);
begin
  inherited Create (CreateSuspended);
  Self.FreeOnTerminate := False;
  Self.Priority := tpLower;
  fImageLoaded := True;
end;

procedure TVerificaHwSuporteAtivo.Execute;
begin
  inherited;
  Sleep(1000);
  while (not Self.Terminated) do
  begin
    try
      if (fImageLoaded) and (TaskRuning('HWSuporte.exe')) then
      begin
        Synchronize(FreeImages);
        fImageLoaded := False;
      end
      else if (not fImageLoaded) and (not TaskRuning('HWSuporte.exe')) then
      begin
        Synchronize(LoadImages);
        fImageLoaded := True;
      end;
    except
    end;
    Sleep(1000);
  end;
end;

procedure TVerificaHwSuporteAtivo.FreeImages;
begin
  if Assigned(Imagem) then
    Imagem.Visible := False;
end;

procedure TVerificaHwSuporteAtivo.LoadImages;
begin
  if Assigned(Imagem) then
    Imagem.Visible := True;
end;

procedure TVerificaHwSuporteAtivo.SetImagem(const Value: TImage);
begin
  FImagem := Value;
end;

function TVerificaHwSuporteAtivo.TaskRuning(
  ExeNameWithExtension: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := False;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeNameWithExtension)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeNameWithExtension))) then
      begin
        Result := True;
        Break;
      end;
     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

initialization
  RegisterClass(TFrmPrincipalCxl);
finalization
  UnRegisterClass(TFrmPrincipalCxl);

end.

