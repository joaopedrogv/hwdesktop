unit UseCaseBase_45;

interface

uses
  System.SysUtils,
  System.Classes,
  ApiCloud_45;

type

  TUseCaseBase_45 = class
  private
    FLastError: string;
  protected
//    silent   : Boolean;
    api      : TApiCloud_45;
    paramsUC : TStrings;

//    function InitUseCase(checkAllPrivileges: Boolean = True): Boolean;
  public
    constructor Create(params: string);
    destructor Destroy; override;

    property LastError: string read FLastError write FLastError;
  end;

implementation

{ TUseCaseBase_45 }

uses
//  System.StrUtils,
  hw_utils;

constructor TUseCaseBase_45.Create(params: string);
begin
  paramsUC  := NewStringList(params, ';');
//  silent    := StrToBoolDef(paramsUC.Values['silent'], False);//.ToLower.Equals('true');
  api       := TApiCloud_45.Create(params);
end;

destructor TUseCaseBase_45.Destroy;
begin
  api.Free;
  inherited;
end;

end.
