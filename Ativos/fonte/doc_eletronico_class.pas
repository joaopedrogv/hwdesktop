unit doc_eletronico_class;

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
  TDoc_eletronico_class = class(TBaseFb_class)
  private
    Fseqid      : Int64;
    Fcod_empresa: Integer;
    Fid_doc     : string;
    Fdoc        : TStrings;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property seqid      : Int64    read Fseqid       write Fseqid;
    property cod_empresa: Integer  read Fcod_empresa write Fcod_empresa;
    property id_doc     : string   read Fid_doc      write Fid_doc;
    property doc        : TStrings read Fdoc         write Fdoc;
  end;

  TDoc_eletronicos_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TDoc_eletronico_class;
    procedure SetItem(Index: Integer; const Value: TDoc_eletronico_class);
  public
    function New: TDoc_eletronico_class;

    property Items[Index: Integer]: TDoc_eletronico_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TDoc_eletronico_class }

procedure TDoc_eletronico_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('DOC_ELETRONICO');
  with FTable.Fields do
  begin
    AddField('SEQID'      , fkInteger , 0 , False, True);
    AddField('COD_EMPRESA', fkInteger , 0 , False, True);
    AddField('ID_DOC'     , fkString  , 32             );
    AddField('DOC'        , fkTStrings                 );
  end;
  Fdoc := TStringList.Create;
end;

constructor TDoc_eletronico_class.Create;
begin
  InitializeObjects;
end;

destructor TDoc_eletronico_class.Destroy;
begin
  if Assigned(Fdoc) then
    FreeAndNil(Fdoc);
  inherited;
end;

{ TDoc_eletronicos_class }

function TDoc_eletronicos_class.GetItem(Index: Integer): TDoc_eletronico_class;
begin
  Result := TDoc_eletronico_class(inherited Items[Index]);
end;

function TDoc_eletronicos_class.New: TDoc_eletronico_class;
begin
  Result := TDoc_eletronico_class.Create;
  Add(Result);
end;

procedure TDoc_eletronicos_class.SetItem(Index: Integer; const Value: TDoc_eletronico_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TDoc_eletronico_class);
finalization
  UnRegisterClass(TDoc_eletronico_class);

end.
