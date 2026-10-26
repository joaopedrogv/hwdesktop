unit inv_tipo74_posse_class;

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
  TInv_tipo74_posse_class = class(TBaseFb_class)
  private
    Finv_id     : Integer;
    Fid         : Integer;
    Fcod_empresa: Integer;
    Find_prop   : Variant;
    Fcod_cliente: Variant;
    Fqtde       : Variant;
    Fvalor      : Variant;
    Fativo      : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property inv_id     : Integer read Finv_id      write Finv_id;
    property id         : Integer read Fid          write Fid;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property ind_prop   : Variant read Find_prop    write Find_prop;
    property cod_cliente: Variant read Fcod_cliente write Fcod_cliente;
    property qtde       : Variant read Fqtde        write Fqtde;
    property valor      : Variant read Fvalor       write Fvalor;
    property ativo      : Variant read Fativo       write Fativo;
  end;

  TInv_tipo74_posses_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TInv_tipo74_posse_class;
    procedure SetItem(Index: Integer; const Value: TInv_tipo74_posse_class);
  public
    function New: TInv_tipo74_posse_class;

    property Items[Index: Integer]: TInv_tipo74_posse_class read GetItem write SetItem;
  end;

implementation

{ TInv_tipo74_posse_class }

procedure TInv_tipo74_posse_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('INV_TIPO74_POSSE');
  with FTable.Fields do
  begin
    AddField('INV_ID'     , fkInteger, 0, False             );
    AddField('ID'         , fkInteger, 0, False, True       );
    AddField('COD_EMPRESA', fkInteger, 0, False, True , True);
    AddField('IND_PROP'   , fkInteger                       );
    AddField('COD_CLIENTE', fkInteger, 0, True , False, True);
    AddField('QTDE'       , fkFloat                         );
    AddField('VALOR'      , fkFloat                         );
    AddField('ATIVO'      , fkInteger                       );
  end;
end;

constructor TInv_tipo74_posse_class.Create;
begin
  InitializeObjects;
end;

{ TInv_tipo74_posses_class }

function TInv_tipo74_posses_class.GetItem(Index: Integer): TInv_tipo74_posse_class;
begin
  Result := TInv_tipo74_posse_class(inherited Items[Index]);
end;

function TInv_tipo74_posses_class.New: TInv_tipo74_posse_class;
begin
  Result := TInv_tipo74_posse_class.Create;
  Add(Result);
end;

procedure TInv_tipo74_posses_class.SetItem(Index: Integer; const Value: TInv_tipo74_posse_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TInv_tipo74_posse_class);
finalization
  UnRegisterClass(TInv_tipo74_posse_class);

end.
