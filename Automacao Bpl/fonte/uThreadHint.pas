unit uThreadHint;

interface

uses
  Classes, Controls, ExtCtrls, dateUtils;

type
  ThreadHint = class(TThread)
  private
    { Private declarations }
    FFim:Boolean;
    vHint: THintWindow;
    vTimer:TTimer;
    vPausa:boolean;
    procedure vTimerTimer(Sender: TObject);
  protected
    procedure Execute; override;
    procedure showHint;
  public
    hintControle:string;
    vLeft, vTop, vIntervalo:integer;
    destructor Destroy; override;
    constructor Create; reintroduce;overload;
    constructor Create(phintControle:string;  pLeft, pTop, pIntervalo:integer);overload;
  end;

implementation

uses
  Types, Forms, Windows, SysUtils;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure ThreadHint.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ ThreadHint }

constructor ThreadHint.Create;
begin
  FFim := False;
//  hintControle := vHintControle;
  vHint := THintWindow.Create(Application);
  vTimer := TTimer.Create(Application);
  vTimer.Enabled := False;
  vTimer.OnTimer := vTimerTimer;
  vIntervalo := 1000;
  inherited Create(True);
end;

constructor ThreadHint.Create(phintControle: string; pLeft, pTop,
  pIntervalo: integer);
begin
  hintControle := phintControle;
  vLeft := pLeft;
  vTop := ptop;
  vIntervalo := pIntervalo;
  vTimer := TTimer.Create(Application);
  vTimer.Enabled := False;
  vTimer.OnTimer := vTimerTimer;
  vTimer.Interval:=vIntervalo;
  inherited Create(False);
end;

destructor ThreadHint.Destroy;
begin
  if vHint <> nil then
  begin
    vHint.Free;
    vHint := nil;
  end;
  inherited;
end;

procedure ThreadHint.Execute;
begin
  Synchronize(showHint);
  { Place thread code here }
end;

procedure ThreadHint.showHint;
var
  R: TRect;
  X: integer;
begin
  vPausa := False;
  Application.MainForm.Refresh;
  with THintWindow.Create(Application) do//vHint do
  try
    { Calcula o retângulo }
    R := CalcHintRect(Screen.Width, hintControle,nil);

    { Centraliza horizontalmente }
    X := R.Right - R.Left + 1;
    R.Left := vLeft;// (Screen.Width - X);// div 2;//R.Left := vLeft+8;// (Screen.Width - X) div 2;
    R.Right := R.Left + X;

    { Centraliza verticalmente }
    X := R.Bottom - R.Top + 1;
    R.Top :=  vTop;//(Screen.Height - X) ;//div 2;//R.Top := vTop +8;// (Screen.Height - X) div 2;
    R.Bottom := R.Top + X;

    { Mostra }
    ActivateHint(R, hintControle);
    Update;
    vPausa:= true;
//    vTimer.Interval := vIntervalo;
    vTimer.Enabled := true;
    while (vPausa)  do
      Application.ProcessMessages;
    { Aguarda }
  finally
    vTimer.Enabled := False;
    Free;
  end;
end;

procedure ThreadHint.vTimerTimer(Sender: TObject);
begin
  vTimer.Enabled := False;
  vPausa := False;
end;

end.

