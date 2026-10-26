unit hw_progress_utils;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, hw_const_types;

type
  IconProgressType = TMessageDlgType;

  ProgressOpt = class
  private
    FPercMax: Integer;
    FMsg: string;
    FTitle: string;
    FTimeOut: Integer;
    FStepMax: Integer;
    FWindowW: Integer;
    FOnCompleteTerminate: Boolean;
  public
    constructor Create(); overload;
    constructor Create(strMsg: string); overload;
    constructor Create(strTitle, strMsg: string); overload;

    function WithTimer(seconds: Integer): ProgressOpt;
    function WithSteps(steps: Integer): ProgressOpt;
    function WithPerc(counter: Integer): ProgressOpt;
    function Small(): ProgressOpt;
    function Large(): ProgressOpt;
    function Default(): ProgressOpt;

    property Title: string read FTitle write FTitle;
    property Msg: string read FMsg write FMsg;
    property StepMax: Integer read FStepMax write FStepMax;
    property PercMax: Integer read FPercMax write FPercMax;
    property TimeOut: Integer read FTimeOut write FTimeOut;
    property WindowW: Integer read FWindowW write FWindowW;
    property OnCompleteTerminate: Boolean read FOnCompleteTerminate write FOnCompleteTerminate; 
  end;

  ObjProgressUtil = class
  public
    destructor Destroy; override;
    function InitProgress(opt: ProgressOpt): ObjProgressUtil;
    function MaxSteps(counter: Integer; position: Integer = 0): ObjProgressUtil;
    function MaxProgress(counter: Integer; position: Integer = 0): ObjProgressUtil;
    function TimeOut(seconds: Integer): ObjProgressUtil;
    function DoMessage(strMsg: string; strTitle: string): ObjProgressUtil;
    function Msg(value: string): ObjProgressUtil;
    function Title(value: string): ObjProgressUtil;
    function DoProgress(value: Integer): ObjProgressUtil;
    function DoStep(value: Integer): ObjProgressUtil;
    function IncProgress(): ObjProgressUtil;
    function IncStep(): ObjProgressUtil;
    function TerminateOnComplete(value: Boolean = True): ObjProgressUtil;
  end;

  TFrmDoProgress = class(TForm)
    pnDoProgress: TPanel;
    pnMsg: TPanel;
    Panel1: TPanel;
    pnTitle: TPanel;
    pnPercent: TPanel;
    pnStep: TPanel;
    TimerTimeOut: TTimer;
    SpeedButton1: TSpeedButton;
    pnMessages: TPanel;
    Image1: TImage;
    procedure TimerTimeOutTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  strict private
    doCloseAt: TDateTime;
    procedure handleShow;
  private
    FStepPos: Integer;
    FStepMax: Integer;
    FPercMax: Integer;
    FPercPos: Integer;
    FSecondsTimeOut: Integer;
    FMsg: string;
    FTitle: string;
    FOnCompleteTerminate: Boolean;
    FIconType: IconProgressType;
    procedure SetIconType(const Value: IconProgressType);
    procedure SetMsg(const Value: string);
    procedure SetTitle(const Value: string);
    procedure SetPercMax(const Value: Integer);
    procedure SetPercPos(const Value: Integer);
    procedure SetStepMax(const Value: Integer);
    procedure SetStepPos(const Value: Integer);
    procedure SetSecondsTimeOut(const Value: Integer);
  public
    procedure InitForm(opt: ProgressOpt);

    property Title: string read FTitle write SetTitle;
    property Msg: string read FMsg write SetMsg;
    property StepMax: Integer read FStepMax write SetStepMax;
    property StepPos: Integer read FStepPos write SetStepPos;
    property PercMax: Integer read FPercMax write SetPercMax;
    property PercPos: Integer read FPercPos write SetPercPos;
    property IconType: IconProgressType read FIconType write SetIconType; 
    property SecondsTimeOut: Integer write SetSecondsTimeOut;
    property OnCompleteTerminate: Boolean read FOnCompleteTerminate write FOnCompleteTerminate;
  end;

  ProgressUtil = class
  public
    class function ObjInitProgress(opt: ProgressOpt): ObjProgressUtil;
    class procedure InitProgress(opt: ProgressOpt);

    class procedure MaxSteps(counter: Integer; position: Integer = 0);
    class procedure MaxProgress(counter: Integer; position: Integer = 0);

    class procedure TimeOut(const seconds: Integer; const value: string = '');

    class procedure DoMessage(strMsg: string; strTitle: string);

    class procedure Msg(const value: string);
    class procedure Title(value: string);
    class procedure Error(const value: string);

    class procedure DoProgress(value: Integer);
    class procedure DoStep(value: Integer);

    class procedure IncProgress();
    class procedure IncStep();

    class procedure TerminateOnComplete(value: Boolean = True);

    class procedure Terminate();
  end;

  StepsUtil = class(ProgressUtil);
  PercentsUtil = class(ProgressUtil);

var
  FrmDoProgress: TFrmDoProgress;

implementation

uses
  StrUtils, hw_utils, hw_graphics_utils, MyShellApi, DateUtils;

{$R *.dfm}   

{ ProgressUtilOptions }

constructor ProgressOpt.Create(strMsg: string);
begin
  Create('', strMsg);
end;

constructor ProgressOpt.Create(strTitle, strMsg: string);
begin
  FTitle   := IfThen(Trim(strTitle) = '', 'Status do processamento', strTitle);
  FMsg     := IfThen(Trim(strMsg  ) = '', 'Processando sua solicitação', strMsg);
  FPercMax := 0;
  FStepMax := 0;
  FTimeOut := 0;
  FOnCompleteTerminate := False;
  Default();
end;

function ProgressOpt.Default: ProgressOpt;
begin
  FWindowW := 500;
  Result   := Self;
end;

function ProgressOpt.Large: ProgressOpt;
begin
  FWindowW := 600;
  Result   := Self;
end;

function ProgressOpt.Small: ProgressOpt;
begin
  FWindowW := 400;
  Result   := Self;
end;

constructor ProgressOpt.Create;
begin
  Create('', '');
end;

function ProgressOpt.WithPerc(counter: Integer): ProgressOpt;
begin
  FPercMax := counter;
  Result := Self;
end;

function ProgressOpt.WithSteps(steps: Integer): ProgressOpt;
begin
  FStepMax := steps;  
  Result := Self;
end;

function ProgressOpt.WithTimer(seconds: Integer): ProgressOpt;
begin
  FTimeOut := seconds;
  Result := Self;
end;

{ ObjProgressUtil }

destructor ObjProgressUtil.Destroy;
begin
  if Assigned(FrmDoProgress) then
    FreeAndNil(FrmDoProgress);
  inherited;
end;

function ObjProgressUtil.DoMessage(strMsg, strTitle: string): ObjProgressUtil;
begin
  ProgressUtil.DoMessage(strMsg, strTitle);

  Result := Self;
end;

function ObjProgressUtil.DoProgress(value: Integer): ObjProgressUtil;
begin
  ProgressUtil.DoProgress(value);

  Result := Self;
end;

function ObjProgressUtil.DoStep(value: Integer): ObjProgressUtil;
begin
  ProgressUtil.DoStep(value);

  Result := Self;
end;

function ObjProgressUtil.IncProgress: ObjProgressUtil;
begin
  ProgressUtil.IncProgress;

  Result := Self;
end;

function ObjProgressUtil.IncStep: ObjProgressUtil;
begin
  ProgressUtil.IncStep;

  Result := Self;
end;

function ObjProgressUtil.InitProgress(opt: ProgressOpt): ObjProgressUtil;
begin
  ProgressUtil.InitProgress(opt);
  Result := Self;
end;

function ObjProgressUtil.MaxProgress(counter,
  position: Integer): ObjProgressUtil;
begin
  ProgressUtil.MaxProgress(counter, position);

  Result := Self;
end;

function ObjProgressUtil.MaxSteps(counter, position: Integer): ObjProgressUtil;
begin
  ProgressUtil.MaxSteps(counter, position);
  Result := Self;
end;

function ObjProgressUtil.Msg(value: string): ObjProgressUtil;
begin
  ProgressUtil.Msg(value); 

  Result := Self;
end;

function ObjProgressUtil.TerminateOnComplete(value: Boolean): ObjProgressUtil;
begin
  ProgressUtil.TerminateOnComplete(value);

  Result := Self;
end;

function ObjProgressUtil.TimeOut(seconds: Integer): ObjProgressUtil;
begin
  ProgressUtil.TimeOut(seconds);

  Result := Self;
end;

function ObjProgressUtil.Title(value: string): ObjProgressUtil;
begin
  ProgressUtil.Title(value); 

  Result := Self;
end;

{ TFrmDoProgress }

procedure TFrmDoProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerTimeOut.Enabled := False;
  Action := caFree;
  FrmDoProgress := nil;
end;

procedure TFrmDoProgress.handleShow;
begin
  case FIconType of
    mdtInfo:
      Image1.Picture.Icon.Handle := TStockIcon.GetIcon(SIID_INFO);

    mdtError:
      Image1.Picture.Icon.Handle := TStockIcon.GetIcon(SIID_ERROR);

    mdtQuestion:
      Image1.Picture.Icon.Handle := TStockIcon.GetIcon(SIID_HELP);

    mdtWarning:
      Image1.Picture.Icon.Handle := TStockIcon.GetIcon(SIID_WARNING);
  end;

  Image1.Visible := FIconType <> mdtNone;

  Self.Show;
  Application.ProcessMessages;

  if FOnCompleteTerminate then
    if (FStepMax > 0) and (FPercMax > 0) and (FStepPos >= FStepMax) and (FPercPos >= FPercMax)then
      SetSecondsTimeOut(1)
    else if (FStepMax = 0) and (FPercMax > 0) and (FPercPos >= FPercMax) then
      SetSecondsTimeOut(1);

  if FSecondsTimeOut > 0 then
    SecondsTimeOut := FSecondsTimeOut;
end;

procedure TFrmDoProgress.InitForm(opt: ProgressOpt);
begin
  pnDoProgress.Width := opt.WindowW;

  pnMsg.Caption := opt.Msg;
  pnTitle.Caption := opt.Title;

  FPercMax := opt.PercMax;
  FPercPos := 0;

  FStepMax := opt.StepMax;
  FStepPos := 0;

  OnCompleteTerminate := opt.OnCompleteTerminate;

  pnStep.Visible := (FStepMax > 0);
  pnPercent.Visible := (FPercMax > 0);

  if pnStep.Visible then
    pnStep.Caption := PadL(FStepPos, Length(IntToStr(FStepMax))) + ' de ' + IntToStr(FStepMax);

  if pnPercent.Visible then
    pnPercent.Caption := IntToStr(Trunc(FPercPos / FPercMax * 100)) + '%';

  if opt.TimeOut > 0 then
    SecondsTimeOut := opt.TimeOut;

  Self.Left := (Screen.Width - Self.Width)  div 2;
end;

procedure TFrmDoProgress.SetIconType(const Value: IconProgressType);
begin
  FIconType := Value;
  handleShow;
end;

procedure TFrmDoProgress.SetMsg(const Value: string);
begin
  FMsg := Value;
  pnMsg.Caption := FMsg;
  handleShow;
end;

procedure TFrmDoProgress.SetPercMax(const Value: Integer);
begin
  FPercMax := Value;
  pnPercent.Visible := (FPercMax > 0);
  pnStep.Left := 0;
  if pnPercent.Visible then
    PercPos := FPercPos;
end;

procedure TFrmDoProgress.SetPercPos(const Value: Integer);
begin
  FPercPos := Value;
  if pnPercent.Visible then
    pnPercent.Caption := IntToStr(Trunc(FPercPos / FPercMax * 100)) + '%';
  handleShow;
end;

procedure TFrmDoProgress.SetSecondsTimeOut(const Value: Integer);
begin
  if Self = nil then
    Exit;

  doCloseAt := IncSecond(Now, Value);

  if (Value > 0) and (not TimerTimeOut.Enabled) then
    TimerTimeOut.Enabled := True

  else if (Value <= 0) and (TimerTimeOut.Enabled) then
    TimerTimeOut.Enabled := False;
end;

procedure TFrmDoProgress.SetStepMax(const Value: Integer);
begin
  FStepMax := Value;
  pnStep.Visible := (FStepMax > 0);
  pnStep.Left := 0;
  if pnStep.Visible then
    StepPos := FStepPos;
end;

procedure TFrmDoProgress.SetStepPos(const Value: Integer);
begin
  FStepPos := Value;
  if pnStep.Visible then
    pnStep.Caption := PadL(FStepPos, Length(IntToStr(FStepMax))) + ' de ' + IntToStr(FStepMax);
  handleShow;
end;

procedure TFrmDoProgress.SetTitle(const Value: string);
begin
  FTitle := Value;
  pnTitle.Caption := FTitle;
  handleShow;
end;

procedure TFrmDoProgress.SpeedButton1Click(Sender: TObject);
begin
  Self.Hide;
end;

procedure TFrmDoProgress.TimerTimeOutTimer(Sender: TObject);
begin
  if not TimerTimeOut.Enabled then
    Exit;

  if doCloseAt = 0 then
  begin
    TimerTimeOut.Enabled := False;
    Exit;
  end
  else if doCloseAt < Now then
  begin
    TimerTimeOut.Enabled := False;
    Close;
  end;
end;

{ ProgressUtil }

class procedure ProgressUtil.DoMessage(strMsg, StrTitle: string);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create(strTitle, strMsg))
  else
  begin
    FrmDoProgress.Title := strTitle;
    FrmDoProgress.Msg := strMsg;
  end;
end;

class procedure ProgressUtil.DoProgress(value: Integer);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create());

  FrmDoProgress.PercPos := value;
end;

class procedure ProgressUtil.DoStep(value: Integer);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create());

  FrmDoProgress.StepPos := value;
end;

class procedure ProgressUtil.Error(const value: string);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create('', value))
  else
    FrmDoProgress.Msg := value;

  FrmDoProgress.IconType := mdtError;
end;

class procedure ProgressUtil.IncProgress;
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create());

  FrmDoProgress.PercPos := FrmDoProgress.PercPos + 1;
end;

class procedure ProgressUtil.IncStep;
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create());

  FrmDoProgress.StepPos := FrmDoProgress.StepPos + 1;
end;

class function ProgressUtil.ObjInitProgress(opt: ProgressOpt): ObjProgressUtil;
begin
  Result := ObjProgressUtil.Create;

  if opt <> nil then
    Result.InitProgress(opt);
end;

class procedure ProgressUtil.InitProgress(opt: ProgressOpt);
begin
  if not Assigned(FrmDoProgress) then
  begin
    Application.CreateForm(TFrmDoProgress, FrmDoProgress);
    FrmDoProgress.InitForm(opt);
    FrmDoProgress.Show;
  end
  else
  begin
    if opt.Title <> '' then
      FrmDoProgress.Title := opt.Title;
    if opt.Msg <> '' then
      FrmDoProgress.Msg := opt.Msg;
    MaxProgress(opt.PercMax);
    MaxSteps(opt.StepMax);
    TimeOut(opt.TimeOut);
  end;
end;

class procedure ProgressUtil.MaxProgress(counter, position: Integer);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create());

  FrmDoProgress.PercMax := counter;
  FrmDoProgress.PercPos := position;
end;

class procedure ProgressUtil.MaxSteps(counter, position: Integer);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create());

  FrmDoProgress.StepMax := counter;
  FrmDoProgress.StepPos := position;
end;

class procedure ProgressUtil.Msg(const value: string);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create('', value))
  else
    FrmDoProgress.Msg := value;
end;

class procedure ProgressUtil.Terminate;
begin
  if Assigned(FrmDoProgress) then
    FreeAndNil(FrmDoProgress);
end;

class procedure ProgressUtil.TerminateOnComplete(value: Boolean);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create());

  FrmDoProgress.OnCompleteTerminate := value;
end;

class procedure ProgressUtil.TimeOut(const seconds: Integer;
  const value: string);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create());

  if value <> '' then  
    FrmDoProgress.Msg := value;

  FrmDoProgress.SecondsTimeOut := seconds;
end;

class procedure ProgressUtil.Title(value: string);
begin
  if not Assigned(FrmDoProgress) then
    ProgressUtil.InitProgress(ProgressOpt.Create(value, ''))
  else
    FrmDoProgress.Title := value;
end;

end.
