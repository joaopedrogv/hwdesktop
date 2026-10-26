unit produtos_frete_peso_class;

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
  TProdutos_frete_peso_class = class(TBaseFb_class)
  private
    Fid         : Integer;
    Fgrupo_prod : Integer;
    Fcod_prod   : string;
    Fcod_empresa: Integer;
    Fcod_cliente: Variant;
    Funidade    : string;
    Fpeso       : Variant;
    Fvalor      : Variant;
    Fativo      : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id         : Integer read Fid          write Fid;
    property grupo_prod : Integer read Fgrupo_prod  write Fgrupo_prod;
    property cod_prod   : string  read Fcod_prod    write Fcod_prod;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Variant read Fcod_cliente write Fcod_cliente;
    property unidade    : string  read Funidade     write Funidade;
    property peso       : Variant read Fpeso        write Fpeso;
    property valor      : Variant read Fvalor       write Fvalor;
    property ativo      : Variant read Fativo       write Fativo;
  end;

  TProdutos_frete_pesos_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TProdutos_frete_peso_class;
    procedure SetItem(Index: Integer; const Value: TProdutos_frete_peso_class);
  public
    function New: TProdutos_frete_peso_class;

    property Items[Index: Integer]: TProdutos_frete_peso_class read GetItem write SetItem;
  end;

implementation

{ TProdutos_frete_peso_class }

procedure TProdutos_frete_peso_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('PRODUTOS_FRETE_PESO');
  with FTable.Fields do
  begin
    AddField('ID'         , fkInteger, 0, False, True              );
    AddField('GRUPO_PROD' , fkInteger, 0, False, False, True       );
    AddField('COD_PROD'   , fkString , 6, False, False, True       );
    AddField('COD_EMPRESA', fkInteger, 0, False, True , True       );
    AddField('COD_CLIENTE', fkInteger, 0, True , False, True       );
    AddField('UNIDADE'    , fkString , 6                           );
    AddField('PESO'       , fkFloat  , 0, True , False, False, True);
    AddField('VALOR'      , fkFloat  , 0, True , False, False, True);
    AddField('ATIVO'      , fkInteger, 0, True , False, False, True);
  end;
end;

constructor TProdutos_frete_peso_class.Create;
begin
  InitializeObjects;
end;

{ TProdutos_frete_pesos_class }

function TProdutos_frete_pesos_class.GetItem(Index: Integer): TProdutos_frete_peso_class;
begin
  Result := TProdutos_frete_peso_class(inherited Items[Index]);
end;

function TProdutos_frete_pesos_class.New: TProdutos_frete_peso_class;
begin
  Result := TProdutos_frete_peso_class.Create;
  Add(Result);
end;

procedure TProdutos_frete_pesos_class.SetItem(Index: Integer; const Value: TProdutos_frete_peso_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TProdutos_frete_peso_class);
finalization
  UnRegisterClass(TProdutos_frete_peso_class);

end.
