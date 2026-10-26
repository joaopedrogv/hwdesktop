unit hw_logprogress;

interface

uses
  Contnrs,
  Classes;

type
  THw_LogProgress_Types = (ltStart, ltTitle, ltMessage, ltAllProgress, ltProgress);

  THw_LogProgress = class
  private
    FProgress   : TNotifyEvent;
  public
    Min, Max, Position: Integer;
    Title, Msg: string;
    Tipo: Set of THw_LogProgress_Types;

    procedure DoProgress(Title, Msg: string; Progress, Max, Min: Integer); overload;
    procedure DoProgress(Title, Msg: string); overload;
    procedure DoProgress(Msg: string); overload;
    procedure DoProgress(Progress, Max, Min: Integer); overload;
    procedure DoProgress(Progress: Integer); overload;

    property OnProgress: TNotifyEvent read FProgress write FProgress;
  end;

implementation

{ THw_LogProgress }

procedure THw_LogProgress.DoProgress(Progress, Max, Min: Integer);
begin
  Self.Position := Progress;
  Self.Tipo     := [ltAllProgress];
  Self.Max      := Max;
  Self.Min      := Min;
  if Assigned(FProgress) then FProgress(Self);
end;

procedure THw_LogProgress.DoProgress(Title, Msg: string; Progress, Max, Min: Integer);
begin
  Self.Title    := Title;
  Self.Msg      := Msg;
  Self.Position := Progress;
  Self.Max      := Max;
  Self.Min      := Min;
  Self.Tipo     := [ltStart];
  if Assigned(FProgress) then FProgress(Self);
end;

procedure THw_LogProgress.DoProgress(Msg: string);
begin
  Self.Msg    := Msg;
    Self.Tipo := [ltMessage];
  if Assigned(FProgress) then FProgress(Self);
end;

procedure THw_LogProgress.DoProgress(Title, Msg: string);
begin
  Self.Title := Title;
  Self.Msg   := Msg;
  Self.Tipo  := [ltTitle, ltMessage]; 
  if Assigned(FProgress) then FProgress(Self);
end;

procedure THw_LogProgress.DoProgress(Progress: Integer);
begin
  Self.Position := Progress;
  Self.Tipo     := [ltProgress];
  if Assigned(FProgress) then FProgress(Self);
end;

end.
