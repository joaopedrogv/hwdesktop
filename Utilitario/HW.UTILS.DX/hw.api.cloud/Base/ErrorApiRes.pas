unit ErrorApiRes;

interface

uses
  System.SysUtils;

type
  TErrorDetail = class
  private
    Fmsg   : string;
    Fdetail: string;
    procedure SetMsg(const Value: string);
    procedure SetDetail(const Value: string);
  public
    procedure Clear;
    procedure RaiseErrorIfExists(err: string = '');
    property msg: string read Fmsg write SetMsg;
    property detail: string read Fdetail write SetDetail;
  end;

  ExceptionApp = class(Exception)
  private
    Fdetail: string;
  public
    constructor Create(const msg, det: string); overload;
    constructor Create(const msg: string; const Args: array of const; det: string); overload;
    constructor Create(const err: TErrorDetail); overload;
    property detail: string read Fdetail write Fdetail;
  end;

implementation


{ TErrorDetail }

procedure TErrorDetail.Clear;
begin
  Fdetail := '';
  Fmsg    := '';
end;

procedure TErrorDetail.RaiseErrorIfExists(err: string);
begin
  if not Self.msg.IsEmpty then
    raise ExceptionApp.Create(Self.msg, Self.detail)
  else if not err.IsEmpty then
    raise Exception.Create(err);
end;

procedure TErrorDetail.SetDetail(const Value: string);
begin
  Fdetail := Value.Trim;
end;

procedure TErrorDetail.SetMsg(const Value: string);
begin
  Fmsg := Value.Trim;
end;

{ ExceptionApp }

constructor ExceptionApp.Create(const msg, det: string);
begin
  Self.Message := msg;
  Self.detail := det;
end;

constructor ExceptionApp.Create(const err: TErrorDetail);
begin
  Self.Message := err.msg;
  Self.detail := err.detail;
end;


constructor ExceptionApp.Create(const msg: string;
  const Args: array of const; det: string);
begin
  Self.Message := Format(msg, Args);
  Self.detail := det;
end;

end.
