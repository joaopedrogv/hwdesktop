unit ProgressWithLogFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ComCtrls, Gauges, ExtCtrls;

type
  TProgressWithLogFrameEvent = procedure() of object;
  TProgressWithLogFrame = class(TFrame)
    pnCentral: TPanel;
    Gauge1: TGauge;
    edLog: TMemo;
    ProgressBar1: TProgressBar;
    pnBotoes: TPanel;
    btSair: TBitBtn;
    btCancel: TBitBtn;
    btCopy: TBitBtn;
    pnTitle: TPanel;
    lbCaption: TLabel;
    procedure btSairClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    FOnLeaveEvent: TProgressWithLogFrameEvent;
    FOnCancelEvent: TProgressWithLogFrameEvent;
  public
    procedure Setup(OnLeaveEvent, OnCancelEvent: TProgressWithLogFrameEvent);
    procedure OnMessage(const Message: string);
    procedure OnWarning(const Warning: string);
    procedure OnError(const Error: string);

    procedure OnProgress(Progress: Integer);
    procedure OnCounter(Current, Total: Integer);

    procedure Start;
    procedure OnComplete;
    procedure OnCancel;
  end;

implementation

uses
  ClipBrd;

{$R *.dfm}

{ TProgressWithLogFrame }

procedure TProgressWithLogFrame.btCancelClick(Sender: TObject);
begin
  if Assigned(FOnCancelEvent) then
    FOnCancelEvent();
end;

procedure TProgressWithLogFrame.btCopyClick(Sender: TObject);
begin
  Clipboard.AsText := edLog.Lines.Text;
end;

procedure TProgressWithLogFrame.btSairClick(Sender: TObject);
begin
  if Assigned(FOnLeaveEvent) then
    FOnLeaveEvent();
end;

procedure TProgressWithLogFrame.OnCancel;
begin
  btSair.Visible := True;
  btCopy.Visible := True;
  btSair.Left := -1;
  btCancel.Visible := False;
  ProgressBar1.Visible := False;
  Gauge1.Visible := False;
end;

procedure TProgressWithLogFrame.OnComplete;
begin
  btSair.Visible := True;
  btCopy.Visible := True;
  btCancel.Visible := False;
  ProgressBar1.Visible := False;
  Gauge1.Visible := False;  
end;

procedure TProgressWithLogFrame.OnCounter(Current, Total: Integer);
begin
  if ProgressBar1.Max <> Total then
    ProgressBar1.Max := Total;

  if not ProgressBar1.Visible then
    ProgressBar1.Visible := True;

  ProgressBar1.Position := Current;
  Application.ProcessMessages();
end;

procedure TProgressWithLogFrame.OnError(const Error: string);
begin
  if (edLog.Lines.Count > 0) and (edLog.Lines[edLog.Lines.Count - 1] <> '-') then
    edLog.Lines.Add( '-' );

  edLog.Lines.Add( '>>> ERRO <<<' );
  edLog.Lines.Add( '>>> ' + Error );
  edLog.Lines.Add( '-' );
end;

procedure TProgressWithLogFrame.OnMessage(const Message: string);
begin
  edLog.Lines.Add( Message );
end;

procedure TProgressWithLogFrame.OnProgress(Progress: Integer);
begin
  if not Gauge1.Visible then
    Gauge1.Visible := True;

  Gauge1.Progress := Progress;
  Application.ProcessMessages();
end;

procedure TProgressWithLogFrame.Setup(
  OnLeaveEvent, OnCancelEvent: TProgressWithLogFrameEvent
);
begin
  FOnLeaveEvent := OnLeaveEvent;
  FOnCancelEvent := OnCancelEvent;
end;

procedure TProgressWithLogFrame.Start;
begin
  btSair.Visible := False;
  btCopy.Visible := False;
  btCancel.Visible := Assigned(FOnCancelEvent);
  ProgressBar1.Visible := False;
  Gauge1.Visible := False;
  edLog.Lines.Clear();
end;

procedure TProgressWithLogFrame.OnWarning(const Warning: string);
begin
  if (edLog.Lines.Count > 0) and (edLog.Lines[edLog.Lines.Count - 1] <> '-') then
    edLog.Lines.Add( '-' );

  edLog.Lines.Add( 'Atenção' );
  edLog.Lines.Add( Warning );
  edLog.Lines.Add( '-' );
end;

end.
