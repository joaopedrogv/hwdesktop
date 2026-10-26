unit opf_icms_class;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type
  TOpf_icms_class = class(TBaseFb_class)
  private
    Fid         : Integer;
    Fopf_id     : Integer;
    Fcod_empresa: Integer;
    Ftributacao : Integer;
    Fmotdesicm  : Variant;
    Fconf_calc  : TStrings;
    Fativo      : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id         : Integer  read Fid          write Fid;
    property opf_id     : Integer  read Fopf_id      write Fopf_id;
    property cod_empresa: Integer  read Fcod_empresa write Fcod_empresa;
    property tributacao : Integer  read Ftributacao  write Ftributacao;
    property motdesicm  : Variant  read Fmotdesicm   write Fmotdesicm;
    property conf_calc  : TStrings read Fconf_calc   write Fconf_calc;
    property ativo      : Variant  read Fativo       write Fativo;
  end;

  TOpf_icmss_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TOpf_icms_class;
    procedure SetItem(Index: Integer; const Value: TOpf_icms_class);
  public
    function New: TOpf_icms_class;

    property Items[Index: Integer]: TOpf_icms_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TOpf_icms_class }

procedure TOpf_icms_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('OPF_ICMS');
  with FTable.Fields do
  begin
    AddField('ID'         , fkInteger , 0, False, True              );
    AddField('OPF_ID'     , fkInteger , 0, False, False, True       );
    AddField('COD_EMPRESA', fkInteger , 0, False, True , True       );
    AddField('TRIBUTACAO' , fkInteger , 0, False                    );
    AddField('MOTDESICM'  , fkInteger                               );
    AddField('CONF_CALC'  , fkTStrings                              );
    AddField('ATIVO'      , fkInteger , 0, True , False, False, True);
  end;
  Fconf_calc := TStringList.Create;
end;

constructor TOpf_icms_class.Create;
begin
  InitializeObjects;
end;

destructor TOpf_icms_class.Destroy;
begin
  if Assigned(Fconf_calc) then
    FreeAndNil(Fconf_calc);
  inherited;
end;

{ TOpf_icmss_class }

function TOpf_icmss_class.GetItem(Index: Integer): TOpf_icms_class;
begin
  Result := TOpf_icms_class(inherited Items[Index]);
end;

function TOpf_icmss_class.New: TOpf_icms_class;
begin
  Result := TOpf_icms_class.Create;
  Add(Result);
end;

procedure TOpf_icmss_class.SetItem(Index: Integer; const Value: TOpf_icms_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TOpf_icms_class);
finalization
  UnRegisterClass(TOpf_icms_class);

end.
