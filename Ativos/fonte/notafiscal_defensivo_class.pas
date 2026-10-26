unit notafiscal_defensivo_class;

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
  TNotafiscal_defensivo_class = class(TBaseFb_class)
  private
    Fid          : string;
    Fcod_nf      : Integer;
    Fcod_empresa : Integer;
    Fnreceituario: string;
    Fcpfresptec  : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id          : string  read Fid           write Fid;
    property cod_nf      : Integer read Fcod_nf       write Fcod_nf;
    property cod_empresa : Integer read Fcod_empresa  write Fcod_empresa;
    property nreceituario: string  read Fnreceituario write Fnreceituario;
    property cpfresptec  : string  read Fcpfresptec   write Fcpfresptec;
  end;

  TNotafiscal_defensivos_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TNotafiscal_defensivo_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_defensivo_class);
  public
    function New: TNotafiscal_defensivo_class;

    property Items[Index: Integer]: TNotafiscal_defensivo_class read GetItem write SetItem;
  end;

implementation

{ TNotafiscal_defensivo_class }

procedure TNotafiscal_defensivo_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('NOTAFISCAL_DEFENSIVO');
  with FTable.Fields do
  begin
    AddField('ID'          , fkString , 36, False, True       );
    AddField('COD_NF'      , fkInteger, 0 , False, False, True);
    AddField('COD_EMPRESA' , fkInteger, 0 , False, True , True);
    AddField('NRECEITUARIO', fkString , 30, False             );
    AddField('CPFRESPTEC'  , fkString , 11, False             );
  end;
end;

constructor TNotafiscal_defensivo_class.Create;
begin
  InitializeObjects;
end;

{ TNotafiscal_defensivos_class }

function TNotafiscal_defensivos_class.GetItem(Index: Integer): TNotafiscal_defensivo_class;
begin
  Result := TNotafiscal_defensivo_class(inherited Items[Index]);
end;

function TNotafiscal_defensivos_class.New: TNotafiscal_defensivo_class;
begin
  Result := TNotafiscal_defensivo_class.Create;
  Add(Result);
end;

procedure TNotafiscal_defensivos_class.SetItem(Index: Integer; const Value: TNotafiscal_defensivo_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TNotafiscal_defensivo_class);
finalization
  UnRegisterClass(TNotafiscal_defensivo_class);

end.
