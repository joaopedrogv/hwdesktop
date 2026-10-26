unit cep_class;

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
  TCep_class = class(TBaseFb_class)
  private
    Fcod_cep     : Integer;
    Fcod_correios: string;
    Fcod_estado  : Variant;
    Fcod_cidade  : Variant;
    Fcod_bairro  : Variant;
    Fativo       : Variant;
    Fcidade      : string;
    Festado      : string;
    Fbairro      : string;
    Fendereco    : string;
    Fsigla_estado: string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property cod_cep     : Integer read Fcod_cep      write Fcod_cep;
    property cod_correios: string  read Fcod_correios write Fcod_correios;
    property cod_estado  : Variant read Fcod_estado   write Fcod_estado;
    property cod_cidade  : Variant read Fcod_cidade   write Fcod_cidade;
    property cod_bairro  : Variant read Fcod_bairro   write Fcod_bairro;
    property ativo       : Variant read Fativo        write Fativo;
    property cidade      : string  read Fcidade       write Fcidade;
    property estado      : string  read Festado       write Festado;
    property bairro      : string  read Fbairro       write Fbairro;
    property endereco    : string  read Fendereco     write Fendereco;
    property sigla_estado: string  read Fsigla_estado write Fsigla_estado;
  end;

  TCeps_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCep_class;
    procedure SetItem(Index: Integer; const Value: TCep_class);
  public
    function New: TCep_class;

    property Items[Index: Integer]: TCep_class read GetItem write SetItem;
  end;

implementation

{ TCep_class }

procedure TCep_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CEP');
  with FTable.Fields do
  begin
    AddField('COD_CEP'     , fkInteger, 0 , False, True              );
    AddField('COD_CORREIOS', fkString , 9 , False, True              );
    AddField('COD_ESTADO'  , fkInteger                               );
    AddField('COD_CIDADE'  , fkInteger                               );
    AddField('COD_BAIRRO'  , fkInteger                               );
    AddField('ATIVO'       , fkInteger, 0 , True , False, False, True);
    AddField('CIDADE'      , fkString , 50                           );
    AddField('ESTADO'      , fkString , 50                           );
    AddField('BAIRRO'      , fkString , 50                           );
    AddField('ENDERECO'    , fkString , 50                           );
    AddField('SIGLA_ESTADO', fkString , 2                            );
  end;
end;

constructor TCep_class.Create;
begin
  InitializeObjects;
end;

{ TCeps_class }

function TCeps_class.GetItem(Index: Integer): TCep_class;
begin
  Result := TCep_class(inherited Items[Index]);
end;

function TCeps_class.New: TCep_class;
begin
  Result := TCep_class.Create;
  Add(Result);
end;

procedure TCeps_class.SetItem(Index: Integer; const Value: TCep_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCep_class);
finalization
  UnRegisterClass(TCep_class);

end.
