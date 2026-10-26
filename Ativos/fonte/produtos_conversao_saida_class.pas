unit produtos_conversao_saida_class;

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
  TProdutos_conversao_saida_class = class(TBaseFb_class)
  private
    Fgrupo_prod      : Integer;
    Fcod_prod        : string;
    Fcod_empresa     : Integer;
    Funidade         : string;
    Fquantidade      : Double;
    Foperacao        : string;
    Fdisponivel_venda: string;
    Fpadrao_venda    : string;
    Funid_pref       : string;
    Fcodigo_ean      : string;
    Fativo           : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property grupo_prod      : Integer read Fgrupo_prod       write Fgrupo_prod;
    property cod_prod        : string  read Fcod_prod         write Fcod_prod;
    property cod_empresa     : Integer read Fcod_empresa      write Fcod_empresa;
    property unidade         : string  read Funidade          write Funidade;
    property quantidade      : Double  read Fquantidade       write Fquantidade;
    property operacao        : string  read Foperacao         write Foperacao;
    property disponivel_venda: string  read Fdisponivel_venda write Fdisponivel_venda;
    property padrao_venda    : string  read Fpadrao_venda     write Fpadrao_venda;
    property unid_pref       : string  read Funid_pref        write Funid_pref;
    property codigo_ean      : string  read Fcodigo_ean       write Fcodigo_ean;
    property ativo           : Variant read Fativo            write Fativo;
  end;

  TProdutos_conversao_saidas_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TProdutos_conversao_saida_class;
    procedure SetItem(Index: Integer; const Value: TProdutos_conversao_saida_class);
  public
    function New: TProdutos_conversao_saida_class;

    property Items[Index: Integer]: TProdutos_conversao_saida_class read GetItem write SetItem;
  end;

implementation

{ TProdutos_conversao_saida_class }

procedure TProdutos_conversao_saida_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('PRODUTOS_CONVERSAO_SAIDA');
  with FTable.Fields do
  begin
    AddField('GRUPO_PROD'      , fkInteger, 0 , False, True , True       );
    AddField('COD_PROD'        , fkString , 6 , False, True , True       );
    AddField('COD_EMPRESA'     , fkInteger, 0 , False, True , True       );
    AddField('UNIDADE'         , fkString , 6 , False, True              );
    AddField('QUANTIDADE'      , fkFloat  , 0 , False, False, False, True);
    AddField('OPERACAO'        , fkString , 1                            );
    AddField('DISPONIVEL_VENDA', fkString , 1                            );
    AddField('PADRAO_VENDA'    , fkString , 1                            );
    AddField('UNID_PREF'       , fkString , 6                            );
    AddField('CODIGO_EAN'      , fkString , 20                           );
    AddField('ATIVO'           , fkInteger, 0 , True , False, False, True);
  end;
end;

constructor TProdutos_conversao_saida_class.Create;
begin
  InitializeObjects;
end;

{ TProdutos_conversao_saidas_class }

function TProdutos_conversao_saidas_class.GetItem(Index: Integer): TProdutos_conversao_saida_class;
begin
  Result := TProdutos_conversao_saida_class(inherited Items[Index]);
end;

function TProdutos_conversao_saidas_class.New: TProdutos_conversao_saida_class;
begin
  Result := TProdutos_conversao_saida_class.Create;
  Add(Result);
end;

procedure TProdutos_conversao_saidas_class.SetItem(Index: Integer; const Value: TProdutos_conversao_saida_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TProdutos_conversao_saida_class);
finalization
  UnRegisterClass(TProdutos_conversao_saida_class);

end.
