unit ProdutosConversao_Model;

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
  TProdutosConversao_Model = class(TBaseFb_class)
  private
    Fgrupo_prod      : Integer;
    Fcod_prod        : string;
    Fcod_empresa     : Integer;
    Fcodigo_ean      : string;
    Funidade         : string;
    Fquantidade      : Double;
    Ftipo            : string;
    Foperacao        : string;
    Fdisponivel_venda: string;
    Fpadrao_venda    : string;
    Funid_vnd        : string;
    Funid_princ      : string;
    Funid_pref       : string;
    Fqtde_vnd        : Double;
    Fqtde_princ      : Double;
    Fparidade        : string;
    Ffator           : Double;
    Ffator_sped      : Double;
    Fativo           : Integer;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property grupo_prod      : Integer read Fgrupo_prod       write Fgrupo_prod;
    property cod_prod        : string  read Fcod_prod         write Fcod_prod;
    property cod_empresa     : Integer read Fcod_empresa      write Fcod_empresa;
    property codigo_ean      : string  read Fcodigo_ean       write Fcodigo_ean;
    property unidade         : string  read Funidade          write Funidade;
    property quantidade      : Double  read Fquantidade       write Fquantidade;
    property tipo            : string  read Ftipo             write Ftipo;
    property operacao        : string  read Foperacao         write Foperacao;
    property disponivel_venda: string  read Fdisponivel_venda write Fdisponivel_venda;
    property padrao_venda    : string  read Fpadrao_venda     write Fpadrao_venda;
    property unid_vnd        : string  read Funid_vnd         write Funid_vnd;
    property unid_princ      : string  read Funid_princ       write Funid_princ;
    property unid_pref       : string  read Funid_pref        write Funid_pref;
    property qtde_vnd        : Double  read Fqtde_vnd         write Fqtde_vnd;
    property qtde_princ      : Double  read Fqtde_princ       write Fqtde_princ;
    property paridade        : string  read Fparidade         write Fparidade;
    property fator           : Double  read Ffator            write Ffator;
    property fator_sped      : Double  read Ffator_sped       write Ffator_sped;
    property ativo           : Integer read Fativo            write Fativo;
  end;

  TProdutosConversaos_Model = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TProdutosConversao_Model;
    procedure SetItem(Index: Integer; const Value: TProdutosConversao_Model);
  public
    function New: TProdutosConversao_Model;

    property Items[Index: Integer]: TProdutosConversao_Model read GetItem write SetItem;
  end;

implementation

{ TProdutosConversao_Model }

procedure TProdutosConversao_Model.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
end;

constructor TProdutosConversao_Model.Create;
begin
  InitializeObjects;
end;

{ TProdutosConversaos_Model }

function TProdutosConversaos_Model.GetItem(Index: Integer): TProdutosConversao_Model;
begin
  Result := TProdutosConversao_Model(inherited Items[Index]);
end;

function TProdutosConversaos_Model.New: TProdutosConversao_Model;
begin
  Result := TProdutosConversao_Model.Create;
  Add(Result);
end;

procedure TProdutosConversaos_Model.SetItem(Index: Integer; const Value: TProdutosConversao_Model);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TProdutosConversao_Model);
finalization
  UnRegisterClass(TProdutosConversao_Model);

end.
