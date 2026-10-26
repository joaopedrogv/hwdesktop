unit pedvenda_prod_cond_dev_class;

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
  TPedvenda_prod_cond_dev_class = class(TBaseFb_class)
  private
    Fid         : Integer;
    Fnped       : Integer;
    Ftipo       : string;
    Fgrupo_prod : Integer;
    Fcod_prod   : string;
    Fcod_empresa: Integer;
    Fcod_grade  : Integer;
    Fdata       : Variant;
    Fquantidade : Double;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id         : Integer read Fid          write Fid;
    property nped       : Integer read Fnped        write Fnped;
    property tipo       : string  read Ftipo        write Ftipo;
    property grupo_prod : Integer read Fgrupo_prod  write Fgrupo_prod;
    property cod_prod   : string  read Fcod_prod    write Fcod_prod;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_grade  : Integer read Fcod_grade   write Fcod_grade;
    property data       : Variant read Fdata        write Fdata;
    property quantidade : Double  read Fquantidade  write Fquantidade;
  end;

  TPedvenda_prod_cond_devs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TPedvenda_prod_cond_dev_class;
    procedure SetItem(Index: Integer; const Value: TPedvenda_prod_cond_dev_class);
  public
    function New: TPedvenda_prod_cond_dev_class;

    property Items[Index: Integer]: TPedvenda_prod_cond_dev_class read GetItem write SetItem;
  end;

implementation

{ TPedvenda_prod_cond_dev_class }

procedure TPedvenda_prod_cond_dev_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('PEDVENDA_PROD_COND_DEV');
  with FTable.Fields do
  begin
    AddField('ID'         , fkInteger , 0, False, True              );
    AddField('NPED'       , fkInteger , 0, False, False, True       );
    AddField('TIPO'       , fkString  , 3, False, False, True       );
    AddField('GRUPO_PROD' , fkInteger , 0, False, False, True       );
    AddField('COD_PROD'   , fkString  , 6, False, False, True       );
    AddField('COD_EMPRESA', fkInteger , 0, False, True , True       );
    AddField('COD_GRADE'  , fkInteger , 0, False                    );
    AddField('DATA'       , fkDateTime, 0, True , False, False, True);
    AddField('QUANTIDADE' , fkFloat   , 0, False, False, False, True);
  end;
end;

constructor TPedvenda_prod_cond_dev_class.Create;
begin
  InitializeObjects;
end;

{ TPedvenda_prod_cond_devs_class }

function TPedvenda_prod_cond_devs_class.GetItem(Index: Integer): TPedvenda_prod_cond_dev_class;
begin
  Result := TPedvenda_prod_cond_dev_class(inherited Items[Index]);
end;

function TPedvenda_prod_cond_devs_class.New: TPedvenda_prod_cond_dev_class;
begin
  Result := TPedvenda_prod_cond_dev_class.Create;
  Add(Result);
end;

procedure TPedvenda_prod_cond_devs_class.SetItem(Index: Integer; const Value: TPedvenda_prod_cond_dev_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TPedvenda_prod_cond_dev_class);
finalization
  UnRegisterClass(TPedvenda_prod_cond_dev_class);

end.
