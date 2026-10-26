unit produtos_conversao_class;

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
  TProdutos_conversao_class = class(TBaseFb_class)
  private
    Fgrupo_prod : Integer;
    Fcod_prod   : string;
    Fcod_empresa: Integer;
    Fcodigo_ean : string;
    Funidade    : string;
    Fquantidade : Double;
    Fativo      : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property grupo_prod : Integer read Fgrupo_prod  write Fgrupo_prod;
    property cod_prod   : string  read Fcod_prod    write Fcod_prod;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property codigo_ean : string  read Fcodigo_ean  write Fcodigo_ean;
    property unidade    : string  read Funidade     write Funidade;
    property quantidade : Double  read Fquantidade  write Fquantidade;
    property ativo      : Variant read Fativo       write Fativo;
  end;

  TProdutos_conversoes_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TProdutos_conversao_class;
    procedure SetItem(Index: Integer; const Value: TProdutos_conversao_class);
  public
    function New: TProdutos_conversao_class;

    property Items[Index: Integer]: TProdutos_conversao_class read GetItem write SetItem;
  end;

implementation

{ TProdutos_conversao_class }

procedure TProdutos_conversao_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('PRODUTOS_CONVERSAO');
  with FTable.Fields do
  begin
    AddField('GRUPO_PROD' , fkInteger, 0 , False, True , True       );
    AddField('COD_PROD'   , fkString , 6 , False, True , True       );
    AddField('COD_EMPRESA', fkInteger, 0 , False, True , True       );
    AddField('CODIGO_EAN' , fkString , 20, False, True              );
    AddField('UNIDADE'    , fkString , 3 , False                    );
    AddField('QUANTIDADE' , fkFloat  , 0 , False, False, False, True);
    AddField('ATIVO'      , fkInteger, 0 , True , False, False, True);
  end;
end;

constructor TProdutos_conversao_class.Create;
begin
  InitializeObjects;
end;

{ TProdutos_conversoes_class }

function TProdutos_conversoes_class.GetItem(Index: Integer): TProdutos_conversao_class;
begin
  Result := TProdutos_conversao_class(inherited Items[Index]);
end;

function TProdutos_conversoes_class.New: TProdutos_conversao_class;
begin
  Result := TProdutos_conversao_class.Create;
  Add(Result);
end;

procedure TProdutos_conversoes_class.SetItem(Index: Integer; const Value: TProdutos_conversao_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TProdutos_conversao_class);
finalization
  UnRegisterClass(TProdutos_conversao_class);

end.
