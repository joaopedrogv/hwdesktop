unit cabecalho_etiqueta_class;

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
  TCabecalho_etiqueta_class = class(TBaseFb_class)
  private
    Fcod_etiqueta      : Integer;
    Fcod_empresa       : Integer;
    Ftamanho_p         : string;
    Fdescricao         : string;
    Ftabela            : string;
    Fcolunas           : Integer;
    Fcomprimento_p     : Double;
    Flargura_p         : Double;
    Fdistancia_entrecol: Double;
    Ftamanho_eti_v     : Double;
    Fmargem_superior   : Double;
    Fmargem_inferior   : Double;
    Fmargem_esquerda   : Double;
    Fmargem_direita    : Double;
    Forientacao        : Integer;
    Fativo             : Variant;
    Fporta             : string;
    Fagente_id         : string;
    Fquant_impressao   : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_etiqueta      : Integer read Fcod_etiqueta       write Fcod_etiqueta;
    property cod_empresa       : Integer read Fcod_empresa        write Fcod_empresa;
    property tamanho_p         : string  read Ftamanho_p          write Ftamanho_p;
    property descricao         : string  read Fdescricao          write Fdescricao;
    property tabela            : string  read Ftabela             write Ftabela;
    property colunas           : Integer read Fcolunas            write Fcolunas;
    property comprimento_p     : Double  read Fcomprimento_p      write Fcomprimento_p;
    property largura_p         : Double  read Flargura_p          write Flargura_p;
    property distancia_entrecol: Double  read Fdistancia_entrecol write Fdistancia_entrecol;
    property tamanho_eti_v     : Double  read Ftamanho_eti_v      write Ftamanho_eti_v;
    property margem_superior   : Double  read Fmargem_superior    write Fmargem_superior;
    property margem_inferior   : Double  read Fmargem_inferior    write Fmargem_inferior;
    property margem_esquerda   : Double  read Fmargem_esquerda    write Fmargem_esquerda;
    property margem_direita    : Double  read Fmargem_direita     write Fmargem_direita;
    property orientacao        : Integer read Forientacao         write Forientacao;
    property ativo             : Variant read Fativo              write Fativo;
    property porta             : string  read Fporta              write Fporta;
    property agente_id         : string  read Fagente_id          write Fagente_id;
    property quant_impressao   : Variant read Fquant_impressao    write Fquant_impressao;
  end;

  TCabecalho_etiquetas_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCabecalho_etiqueta_class;
    procedure SetItem(Index: Integer; const Value: TCabecalho_etiqueta_class);
  public
    function New: TCabecalho_etiqueta_class;

    property Items[Index: Integer]: TCabecalho_etiqueta_class read GetItem write SetItem;
  end;

implementation

{ TCabecalho_etiqueta_class }

procedure TCabecalho_etiqueta_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CABECALHO_ETIQUETA');
  with FTable.Fields do
  begin
    AddField('COD_ETIQUETA'      , fkInteger, 0 , False, True              );
    AddField('COD_EMPRESA'       , fkInteger, 0 , False, True              );
    AddField('TAMANHO_P'         , fkString , 32                           );
    AddField('DESCRICAO'         , fkString , 32                           );
    AddField('TABELA'            , fkString , 32, False                    );
    AddField('COLUNAS'           , fkInteger, 0 , False, False, False, True);
    AddField('COMPRIMENTO_P'     , fkFloat  , 0 , False, False, False, True);
    AddField('LARGURA_P'         , fkFloat  , 0 , False, False, False, True);
    AddField('DISTANCIA_ENTRECOL', fkFloat  , 0 , False, False, False, True);
    AddField('TAMANHO_ETI_V'     , fkFloat  , 0 , False, False, False, True);
    AddField('MARGEM_SUPERIOR'   , fkFloat  , 0 , False, False, False, True);
    AddField('MARGEM_INFERIOR'   , fkFloat  , 0 , False, False, False, True);
    AddField('MARGEM_ESQUERDA'   , fkFloat  , 0 , False, False, False, True);
    AddField('MARGEM_DIREITA'    , fkFloat  , 0 , False, False, False, True);
    AddField('ORIENTACAO'        , fkInteger, 0 , False, False, False, True);
    AddField('ATIVO'             , fkInteger, 0 , True , False, False, True);
    AddField('PORTA'             , fkString , 50                           );
    AddField('AGENTE_ID'         , fkString , 20                           );
    AddField('QUANT_IMPRESSAO'   , fkInteger                               );
  end;
end;

constructor TCabecalho_etiqueta_class.Create;
begin
  InitializeObjects;
end;

{ TCabecalho_etiquetas_class }

function TCabecalho_etiquetas_class.GetItem(Index: Integer): TCabecalho_etiqueta_class;
begin
  Result := TCabecalho_etiqueta_class(inherited Items[Index]);
end;

function TCabecalho_etiquetas_class.New: TCabecalho_etiqueta_class;
begin
  Result := TCabecalho_etiqueta_class.Create;
  Add(Result);
end;

procedure TCabecalho_etiquetas_class.SetItem(Index: Integer; const Value: TCabecalho_etiqueta_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCabecalho_etiqueta_class);
finalization
  UnRegisterClass(TCabecalho_etiqueta_class);

end.
