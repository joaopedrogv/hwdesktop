unit hw_Confirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, hw_const_types;

type
  //CustomDialodType = (dtInfo, dtError, dtQuestion, dtWarning);
  CustomDialodType = TMessageDlgType;
  CustomDontAskUntil = (dauNextRun, dauNextHour, dauNextDay, dauNextWeek, dauNextMonth, dauNextYear, dauDontStore);
  CustomBtnsResult = (brNone, brOk, brCancel, brAbort, brRetry, brIgnore, brYes, brNo, brAll, brNoToAll, brYesToAll);
  CustomBtns = set of CustomBtnsResult;

type
  CustomDialogResponse = record
  private
    function GetResultBtn: CustomBtnsResult;
  public
    ResultDlg: Integer;
    ResultDontAsk: Boolean;
    property ResultBtn: CustomBtnsResult read GetResultBtn;
  end;

  TCustomDialogDontAsk = record
  strict private
    FText: string;
    FKey: string;
    FUntilWhen: CustomDontAskUntil;
  public
    function IsActive: Boolean;
    function KeyHandled: string;

    property Text: string read FText write FText;
    property Key: string read FKey write FKey;
    property UntilWhen: CustomDontAskUntil read FUntilWhen write FUntilWhen;
  end;

  TCustomDialogProps = class
  strict private
    FMsg: string;
    FCaption: string;
    FIconDlg: CustomDialodType;
    FBtns: CustomBtns;
    FDefBtn: CustomBtnsResult;
    FDontAnsk: TCustomDialogDontAsk;
    FWinCtrl: TWinControl;
  public
    property Caption: string read FCaption write FCaption;
    property Msg: string read FMsg write FMsg;
    property DontAnsk: TCustomDialogDontAsk read FDontAnsk write FDontAnsk;
    property IconDlg: CustomDialodType read FIconDlg write FIconDlg;
    property Btns: CustomBtns read FBtns write FBtns;
    property DefBtn: CustomBtnsResult read FDefBtn write FDefBtn;
    property WinCtrl: TWinControl read FWinCtrl write FWinCtrl; 
  end;

  ICustomizedDialog = interface
    ['{2DEB6075-2EFA-46EA-B44A-9687178C8CC4}']
    procedure SetProps(const Value: TCustomDialogProps);  
    function GetProps: TCustomDialogProps;
    function Show(): CustomDialogResponse;
    function SetBtns(btns: CustomBtns): ICustomizedDialog;
    function SetDefaultBtn(btn: CustomBtnsResult): ICustomizedDialog;
    function SetDontAnskAgain(const Text: string; const UntilWhen: CustomDontAskUntil = dauNextDay; const Key: string = ''): ICustomizedDialog;

    property Props: TCustomDialogProps read GetProps write SetProps;
  end;

  TCustomizedDialog = class(TInterfacedObject, ICustomizedDialog)
  strict private
    FProps: TCustomDialogProps;
  private
    function GetProps: TCustomDialogProps;
    procedure SetProps(const Value: TCustomDialogProps);
  public
    constructor Create;
    destructor Destroy; override;
    function DontAskKeyRegistry: string;

    function Show(): CustomDialogResponse;
    function SetBtns(btns: CustomBtns): ICustomizedDialog;
    function SetDefaultBtn(btn: CustomBtnsResult): ICustomizedDialog;
    function SetDontAnskAgain(const Text: string; const UntilWhen: CustomDontAskUntil = dauNextDay; const Key: string = ''): ICustomizedDialog;

    property Props: TCustomDialogProps read GetProps write SetProps;
  end;

  ShowCustomDlg = class
  public
    class function Msg(Text: string; dlgType: CustomDialodType = mdtInfo; btns: CustomBtns = [brOK]): ICustomizedDialog;
    class function Info(const Text: string): Integer; overload;
    class function Info(const Text: string; const Args: array of const): Integer; overload;
    class function Error(const Text: string): Integer; overload;
    class function Error(const Text: string; const Args: array of const): Integer; overload;
    class function Question(const Text: string; defBtn: CustomBtnsResult = brYes): Integer; overload;
    class function Question(const Text: string; const Args: array of const; defBtn: CustomBtnsResult = brYes): Integer; overload;
  end;

  {
  TConfirmacao = class
  public
    class function Preview(tipo, caption, mensagem, checkmensagem: string): boolean;
  end;
  }

  TFrmConfirmacao = class(TForm)
    ImageList1: TImageList;
    pnContainer: TPanel;
    pnMessage: TPanel;
    lbMensagem: TLabel;
    pnIcon: TPanel;
    Image1: TImage;
    pnBtns: TPanel;
    btYes: TBitBtn;
    btNo: TBitBtn;
    ckNaoExibirMensagem: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure lbMensagemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btNoClick(Sender: TObject);
    procedure btYesClick(Sender: TObject);
  private
    FCustomDlg: TCustomizedDialog;
    FResultCustomDlg: CustomDialogResponse;
  public
    property CustomDlg: TCustomizedDialog read FCustomDlg write FCustomDlg;
    property ResultCustomDlg: CustomDialogResponse read FResultCustomDlg write FResultCustomDlg;
  end;

var
  FrmConfirmacao: TFrmConfirmacao;

implementation

uses
  hw_win_utils, hw_graphics_utils, MyShellApi, Math, hw_utils, TypInfo, DateUtils, StrUtils;

{$R *.dfm}

{ TConfirmacao }
{
class function TConfirmacao.Preview(tipo, caption, mensagem, checkmensagem: string): boolean;
var
	vtemp: string;
begin
	Result := False;

  vtemp := RegistroWin.Read('TConfirmacao', 'ckNaoExibirMensagem' + tipo, '');
  if (trim(vtemp) <> '') then
  	if (trim(vtemp) = FormatDateTime('dd/mm/yyyy', Date)) then
    	exit;

	Application.CreateForm(TFrmConfirmacao, FrmConfirmacao);
  FrmConfirmacao.Caption := caption;
  FrmConfirmacao.lbMensagem.Caption := mensagem;
  FrmConfirmacao.ckNaoExibirMensagem.Caption := checkmensagem;
  FrmConfirmacao.ckNaoExibirMensagem.Visible := Trim(checkmensagem) <> '';
  Result := FrmConfirmacao.ShowModal = ID_OK;


  if (not FrmConfirmacao.ckNaoExibirMensagem.Checked) then
    RegistroWin.Write('TConfirmacao', FrmConfirmacao.ckNaoExibirMensagem.Name + tipo, '')
  else
    RegistroWin.Write('TConfirmacao', FrmConfirmacao.ckNaoExibirMensagem.Name + tipo, FormatDateTime('dd/mm/yyyy', Date));
end;
}

procedure TFrmConfirmacao.btNoClick(Sender: TObject);
begin
	ModalResult := IDCANCEL;
end;

procedure TFrmConfirmacao.btYesClick(Sender: TObject);
begin
	ModalResult := IDOK;
end;

procedure TFrmConfirmacao.FormShow(Sender: TObject);
const
  CustomBtnsStr: array[CustomBtnsResult] of string = ('', 'OK', 'Cancelar', 'Anular', 'Repetir', 'Ignorar', 'Sim', 'Não', 'Todos', 'Não para todos', 'Sim para todos');
  CBTNS: array[1..10] of CustomBtnsResult = (brCancel, brIgnore, brRetry, brAbort, brNo, brNoToAll, brYes, brYesToAll, brOk, brAll);
var
  lns, wMsg, hMsg, I, lastBtnLeft, wCont, maxW: Integer;
  resultBtn: CustomBtnsResult;
  newBtn: TBitBtn;
  sTxt: TStrings;
begin
  Self.AutoSize := True;
  if Assigned(CustomDlg) then
  begin
    case CustomDlg.Props.IconDlg of
      mdtInfo:
        Image1.Picture.Icon.Handle := TStockIcon.GetIcon(SIID_INFO);

      mdtError:
        Image1.Picture.Icon.Handle := TStockIcon.GetIcon(SIID_ERROR);

      mdtQuestion:
        Image1.Picture.Icon.Handle := TStockIcon.GetIcon(SIID_HELP);

      mdtWarning:
        Image1.Picture.Icon.Handle := TStockIcon.GetIcon(SIID_WARNING);
    end;

    Self.Caption                := CustomDlg.Props.Caption + ' ';// + IntToStr(lbMensagem.Canvas.TextWidth(CustomDlg.Props.Msg)) + ' ' + IntToStr(lbMensagem.Canvas.TextHeight(CustomDlg.Props.Msg));
    ckNaoExibirMensagem.Caption := '  ' + CustomDlg.Props.DontAnsk.Text;
    ckNaoExibirMensagem.Visible := CustomDlg.Props.DontAnsk.IsActive;
    pnIcon.Visible              := CustomDlg.Props.IconDlg <> mdtNone;

    pnContainer.Width := 200;

    {$REGION 'Criando botoes'}
    
    for resultBtn in CBTNS do
      if resultBtn in CustomDlg.Props.Btns then
      begin
        newBtn                  := TBitBtn.Create(Self);
        newBtn.Parent           := pnBtns;
        newBtn.Caption          := CustomBtnsStr[resultBtn];
        newBtn.AlignWithMargins := True;
        newBtn.Margins.Top      := 9;
        newBtn.Margins.Right    := 0;
        newBtn.Margins.Bottom   := 9;
        newBtn.Margins.Left     := 8;
        newBtn.Left             := -1999;
        newBtn.Align            := alRight;
        newBtn.Name             := GetEnumName(TypeInfo(CustomBtnsResult), Ord(resultBtn)) + '1';
        newBtn.ModalResult      := Ord(resultBtn);
        if TGraphicsUtils.TextWidth(CustomBtnsStr[resultBtn], newBtn.Font) > (newBtn.Width - 20) then
          newBtn.Width := TGraphicsUtils.TextWidth(CustomBtnsStr[resultBtn], newBtn.Font) + 20;

        if (resultBtn = CustomDlg.Props.DefBtn) and
          (newBtn.CanFocus) then
          newBtn.SetFocus;

        if newBtn.Left < 20  then
          pnContainer.Width := pnContainer.Width + IfThen(newBtn.Left > 0 , 20 - newBtn.Left, 20 - newBtn.Left);

        lastBtnLeft := newBtn.Left;
      end;
      
    {$ENDREGION}

    maxW := Max(275, pnContainer.Width);

    {$REGION 'Criando mensagem de texto'}

    if Trim(CustomDlg.Props.Msg) = '' then
    begin
      pnMessage.Visible := False;
      pnMessage.Height := 0;
    end
    else
    begin
      CustomDlg.Props.Msg := TrimS(CustomDlg.Props.Msg, sLineBreak);
      sTxt := NewStringList(CustomDlg.Props.Msg);
      try
        lns := 0;
        wMsg := 0;
        for I := 0 to sTxt.Count - 1 do
        begin
          if lbMensagem.Canvas.TextWidth(sTxt[I]) > wMsg then
            wMsg := lbMensagem.Canvas.TextWidth(sTxt[I]);
          lns  := lns + Ceil(lbMensagem.Canvas.TextWidth(sTxt[I]) / maxW);
        end;
      finally
        sTxt.Free;
      end;

      hMsg := lbMensagem.Canvas.TextHeight(CustomDlg.Props.Msg) + 2;
      wMsg := Min(wMsg, 275);


      lbMensagem.AutoSize := False;
      lbMensagem.Align    := alLeft;
      lbMensagem.Width    := wMsg + lbMensagem.Margins.Left + lbMensagem.Margins.Right;// +lbMensagem.Canvas.TextWidth(lbMensagem.Caption);
      lbMensagem.Height   := (lns * hMsg) + lbMensagem.Margins.Top + lbMensagem.Margins.Bottom;

      wCont := lbMensagem.Left + lbMensagem.Width + lbMensagem.Margins.Right;

      if wCont > pnContainer.Width then
        pnContainer.Width := wCont;

      pnContainer.Width   := IfThen(pnContainer.Width < 200, 200, pnContainer.Width);
      pnMessage.Height := lbMensagem.Margins.Top + lbMensagem.Margins.Bottom + (lns * hMsg);
      pnMessage.Height := Max(pnMessage.Height, 77);
    end;       

    {$ENDREGION}

    {$REGION 'Ajustando componente personalizado'}

    if Assigned(CustomDlg.Props.WinCtrl) then
    begin
      CustomDlg.Props.WinCtrl.Parent := pnContainer;
      CustomDlg.Props.WinCtrl.Align := alTop;
      CustomDlg.Props.WinCtrl.Top := pnBtns.Top + pnBtns.Height;
      pnBtns.Top := CustomDlg.Props.WinCtrl.Top;
    end;

    {$ENDREGION}

    if Assigned(newBtn) then
      lastBtnLeft := newBtn.Left;

    if ckNaoExibirMensagem.Visible then
    begin
      ckNaoExibirMensagem.Width := TGraphicsUtils.TextWidth(ckNaoExibirMensagem.Caption, ckNaoExibirMensagem.Font) + 20;
      if (ckNaoExibirMensagem.Width + ckNaoExibirMensagem.Left) > (lastBtnLeft - 8) then
        pnContainer.Width := pnContainer.Width + (ckNaoExibirMensagem.Width + ckNaoExibirMensagem.Left - lastBtnLeft + 8);
    end;

    lbMensagem.Caption  := CustomDlg.Props.Msg;
    lbMensagem.Align    := alClient;
    pnContainer.Height := pnBtns.Top + pnBtns.Height;
//    hMsg := lbMensagem.Height;
//    wMsg := lbMensagem.Width;


    if not((brCancel in CustomDlg.Props.Btns) or (brOK in CustomDlg.Props.Btns)) then
      EnableMenuItem(GetSystemMenu(Self.Handle , LongBool(False)), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
  end;
end;

procedure TFrmConfirmacao.lbMensagemClick(Sender: TObject);
begin
//  ShowMessage('lbMensagem H ' + IntToStr(lbMensagem.Height) +
//              'W ' + IntToStr(lbMensagem.Width) +
//              'pnMessage H ' + IntToStr(pnMessage.Height) +
//              'W ' + IntToStr(pnMessage.Width) );
//  ShowMessage('H ' + IntToStr(lbMensagem.Canvas.TextHeight(lbMensagem.Caption)) +
//              'W ' + IntToStr(lbMensagem.Canvas.TextWidth(lbMensagem.Caption)) );
end;

procedure TFrmConfirmacao.SpeedButton1Click(Sender: TObject);
begin
  if Pos(' lore ipsum', lbMensagem.Caption) > 0 then
    lbMensagem.Caption := Copy(lbMensagem.Caption, 1, Pos(' lore ipsum', lbMensagem.Caption) - 1);
end;

procedure TFrmConfirmacao.SpeedButton2Click(Sender: TObject);
begin
  lbMensagem.Caption := lbMensagem.Caption + ' lore ipsum';
end;

procedure TFrmConfirmacao.SpeedButton3Click(Sender: TObject);
begin                                 
  ShowCustomDlg.Info(lbMensagem.Caption);
  ShowConfirmacao(lbMensagem.Caption);
end;

{ ShowCustomDlg }

class function ShowCustomDlg.Info(const Text: string): Integer;
begin
  Result := ShowCustomDlg.Msg(Text, mdtInfo, [brOk]).Show().ResultDlg;
end;

class function ShowCustomDlg.Error(const Text: string): Integer;
begin
  Result := ShowCustomDlg.Msg(Text, mdtError, [brOk]).Show().ResultDlg;
end;

class function ShowCustomDlg.Question(const Text: string;
  defBtn: CustomBtnsResult): Integer;
begin
  Result := ShowCustomDlg.Msg(Text, mdtQuestion, [brYes, brNo])
    .SetDefaultBtn(defBtn)
    .Show().ResultDlg;
end;

class function ShowCustomDlg.Question(const Text: string;
  const Args: array of const; defBtn: CustomBtnsResult): Integer;
begin
  Result := ShowCustomDlg.Question(Format(Text, Args), defBtn);
end;

class function ShowCustomDlg.Error(const Text: string;
  const Args: array of const): Integer;
begin
  Result := ShowCustomDlg.Error(Format(Text, Args));
end;

class function ShowCustomDlg.Info(const Text: string;
  const Args: array of const): Integer;
begin
  Result := ShowCustomDlg.Info(Format(Text, Args));
end;

class function ShowCustomDlg.Msg(Text: string;
  dlgType: CustomDialodType;
  btns: CustomBtns): ICustomizedDialog;
const
  Captions: array[CustomDialodType] of string = ('Mensagem', 'Informação', 'Erro', 'Confirmação', 'Atenção');
  DefaultBtn: array[CustomDialodType] of CustomBtnsResult = (brOk, brOk, brOk, brYes, brOk);
begin
	Result               := TCustomizedDialog.Create;
  Result.Props.Caption := Captions[dlgType];
  Result.Props.IconDlg := dlgType;
  Result.Props.Msg     := Text;
  Result.Props.Btns    := btns;
  Result.Props.DefBtn  := DefaultBtn[dlgType];
end;

{ TCustomizedDialog }

constructor TCustomizedDialog.Create;
begin
  FProps := TCustomDialogProps.Create;
end;

destructor TCustomizedDialog.Destroy;
begin
  FProps.Free;
  inherited;
end;

function TCustomizedDialog.DontAskKeyRegistry: string;
begin
  Result := '';
  if Trim(FProps.DontAnsk.Key) = '' then
    Result := OnlyNumberAndLetters(FProps.Msg, '');

  Result := Result + FProps.DontAnsk.KeyHandled;  
end;

function TCustomizedDialog.GetProps: TCustomDialogProps;
begin
  Result := FProps;
end;

function TCustomizedDialog.SetBtns(btns: CustomBtns): ICustomizedDialog;
begin
  Result := Self;

  FProps.Btns := btns;
end;

function TCustomizedDialog.SetDefaultBtn(
  btn: CustomBtnsResult): ICustomizedDialog;
begin
  Result := Self;
  FProps.DefBtn := btn;
end;

function TCustomizedDialog.SetDontAnskAgain(const Text: string;
  const UntilWhen: CustomDontAskUntil;
  const Key: string): ICustomizedDialog;
var
  dontAsk: TCustomDialogDontAsk;
begin
  if UntilWhen = dauNextRun then
    raise Exception.Create('Ainda não implementado. Fazer a logica no TCustomizedDialog.Show');

  Result            := Self;

  dontAsk.Text      := Text;
  dontAsk.Key       := Key;
  dontAsk.UntilWhen := UntilWhen;

  FProps.DontAnsk   := dontAsk;
end;

procedure TCustomizedDialog.SetProps(const Value: TCustomDialogProps);
begin
  FProps := Value;
end;

function TCustomizedDialog.Show: CustomDialogResponse;
var
  formDlg: TFrmConfirmacao;
  datReg, datNow: TDateTime;
begin
  if Self.Props.DontAnsk.IsActive and
    (Self.Props.DontAnsk.UntilWhen <> dauDontStore) then
  begin
    if TryStrToDateTime(RegistroWin.Read(Self.ClassName, Self.DontAskKeyRegistry, ''), datReg) then
    begin
      datNow := Now;
      if Self.Props.DontAnsk.UntilWhen in [dauNextDay, dauNextWeek, dauNextMonth, dauNextYear] then
      begin
        datReg := DateOf(datReg);
        datNow := DateOf(datNow);
      end;

      if datReg > datNow then
        Exit;
    end;
  end;

  Application.CreateForm(TFrmConfirmacao, formDlg);
  try
    formDlg.CustomDlg := Self;

    Result.ResultDlg := formDlg.ShowModal;
    Result.ResultDontAsk := formDlg.ckNaoExibirMensagem.Checked;

    // Result := formDlg.ResultCustomDlg;

  finally
    formDlg.Free;

    if Self.Props.DontAnsk.IsActive and Result.ResultDontAsk and
      (Self.Props.DontAnsk.UntilWhen <> dauDontStore) and
      (IsPositiveResult(Result.ResultDlg) or IsNegativeResult(Result.ResultDlg)) then
    begin
      if Self.Props.DontAnsk.UntilWhen in [dauNextHour] then
        datReg := IncHour(Now, 1)
      else if Self.Props.DontAnsk.UntilWhen in [dauNextDay] then
        datReg := IncDay(Date, 1)
      else if Self.Props.DontAnsk.UntilWhen in [dauNextWeek] then
        datReg := StartOfTheWeek(IncWeek(Date, 1))
      else if Self.Props.DontAnsk.UntilWhen in [dauNextMonth] then
        datReg := StartOfTheMonth(IncMonth(Date, 1))
      else if Self.Props.DontAnsk.UntilWhen in [dauNextYear] then
        datReg := StartOfTheYear(IncYear(Date, 1));

      RegistroWin.Write(Self.ClassName, Self.DontAskKeyRegistry, DateTimeToStr(datReg));
    end;
  end;
end;

{ TCustomDialogDontAsk }

function TCustomDialogDontAsk.IsActive: Boolean;
begin
  Result := Trim(FText) <> '';
end;

function TCustomDialogDontAsk.KeyHandled: string;
begin
  if Trim(FKey) <> '' then
    Result := Trim(FKey)
  else
    Result := OnlyNumberAndLetters(FText, '');
end;

{ CustomDialogResponse }

function CustomDialogResponse.GetResultBtn: CustomBtnsResult;
begin
  Result := CustomBtnsResult(ResultDlg);
end;

end.
