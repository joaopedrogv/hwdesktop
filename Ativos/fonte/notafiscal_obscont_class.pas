unit notafiscal_obscont_class;

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
  TNotafiscal_obscont_class = class(TBaseFb_class)
  private
    Fcod_nf     : Integer;
    Fcod_empresa: Integer;
    Fseqid      : Integer;
    Fxcampo     : string;
    Fxtexto     : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_nf     : Integer read Fcod_nf      write Fcod_nf;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property seqid      : Integer read Fseqid       write Fseqid;
    property xcampo     : string  read Fxcampo      write Fxcampo;
    property xtexto     : string  read Fxtexto      write Fxtexto;
  end;

  TNotafiscal_obsconts_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TNotafiscal_obscont_class;
    procedure SetItem(Index: Integer; const Value: TNotafiscal_obscont_class);
  public
    function New: TNotafiscal_obscont_class;

    property Items[Index: Integer]: TNotafiscal_obscont_class read GetItem write SetItem;
  end;

implementation

{ TNotafiscal_obscont_class }

procedure TNotafiscal_obscont_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('NOTAFISCAL_OBSCONT');
  with FTable.Fields do
  begin
    AddField('COD_NF'     , fkInteger, 0 , False, True, True);
    AddField('COD_EMPRESA', fkInteger, 0 , False, True, True);
    AddField('SEQID'      , fkInteger, 0 , False, True      );
    AddField('XCAMPO'     , fkString , 20                   );
    AddField('XTEXTO'     , fkString , 20                   );
  end;
end;

constructor TNotafiscal_obscont_class.Create;
begin
  InitializeObjects;
end;

{ TNotafiscal_obsconts_class }

function TNotafiscal_obsconts_class.GetItem(Index: Integer): TNotafiscal_obscont_class;
begin
  Result := TNotafiscal_obscont_class(inherited Items[Index]);
end;

function TNotafiscal_obsconts_class.New: TNotafiscal_obscont_class;
begin
  Result := TNotafiscal_obscont_class.Create;
  Add(Result);
end;

procedure TNotafiscal_obsconts_class.SetItem(Index: Integer; const Value: TNotafiscal_obscont_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TNotafiscal_obscont_class);
finalization
  UnRegisterClass(TNotafiscal_obscont_class);

end.
