unit pedvenda_inv_posse_class;

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
  TPedvenda_inv_posse_class = class(TBaseFb_class)
  private
    Fnped       : Integer;
    Ftipo       : string;
    Fcod_empresa: Integer;
    Fnitem      : Integer;
    Fdata_inv   : TDateTime;
    Fposse_id   : Integer;
    Fqtde_aplic : Double;
    Fvalor_aplic: Double;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property nped       : Integer   read Fnped        write Fnped;
    property tipo       : string    read Ftipo        write Ftipo;
    property cod_empresa: Integer   read Fcod_empresa write Fcod_empresa;
    property nitem      : Integer   read Fnitem       write Fnitem;
    property data_inv   : TDateTime read Fdata_inv    write Fdata_inv;
    property posse_id   : Integer   read Fposse_id    write Fposse_id;
    property qtde_aplic : Double    read Fqtde_aplic  write Fqtde_aplic;
    property valor_aplic: Double    read Fvalor_aplic write Fvalor_aplic;
  end;

  TPedvenda_inv_posses_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TPedvenda_inv_posse_class;
    procedure SetItem(Index: Integer; const Value: TPedvenda_inv_posse_class);
  public
    function New: TPedvenda_inv_posse_class;

    property Items[Index: Integer]: TPedvenda_inv_posse_class read GetItem write SetItem;
  end;

implementation

{ TPedvenda_inv_posse_class }

procedure TPedvenda_inv_posse_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('PEDVENDA_INV_POSSE');
  with FTable.Fields do
  begin
    AddField('NPED'       , fkInteger , 0, False, True , True);
    AddField('TIPO'       , fkString  , 3, False, True , True);
    AddField('COD_EMPRESA', fkInteger , 0, False, True , True);
    AddField('NITEM'      , fkInteger , 0, False, True       );
    AddField('DATA_INV'   , fkDateTime, 0, False, True       );
    AddField('POSSE_ID'   , fkInteger , 0, False, False, True);
    AddField('QTDE_APLIC' , fkFloat   , 0, False             );
    AddField('VALOR_APLIC', fkFloat   , 0, False             );
  end;
end;

constructor TPedvenda_inv_posse_class.Create;
begin
  InitializeObjects;
end;

{ TPedvenda_inv_posses_class }

function TPedvenda_inv_posses_class.GetItem(Index: Integer): TPedvenda_inv_posse_class;
begin
  Result := TPedvenda_inv_posse_class(inherited Items[Index]);
end;

function TPedvenda_inv_posses_class.New: TPedvenda_inv_posse_class;
begin
  Result := TPedvenda_inv_posse_class.Create;
  Add(Result);
end;

procedure TPedvenda_inv_posses_class.SetItem(Index: Integer; const Value: TPedvenda_inv_posse_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TPedvenda_inv_posse_class);
finalization
  UnRegisterClass(TPedvenda_inv_posse_class);

end.
