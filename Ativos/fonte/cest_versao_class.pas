unit cest_versao_class;

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
  TCest_versao_class = class(TBaseFb_class)
  private
    Fid           : Integer;
    Fcod_empresa  : Integer;
    Fversao       : string;
    Fdata_versao  : Variant;
    Fdata_cadastro: Variant;
    Ftipo_cadastro: Variant;
    Fativo        : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id           : Integer read Fid            write Fid;
    property cod_empresa  : Integer read Fcod_empresa   write Fcod_empresa;
    property versao       : string  read Fversao        write Fversao;
    property data_versao  : Variant read Fdata_versao   write Fdata_versao;
    property data_cadastro: Variant read Fdata_cadastro write Fdata_cadastro;
    property tipo_cadastro: Variant read Ftipo_cadastro write Ftipo_cadastro;
    property ativo        : Variant read Fativo         write Fativo;
  end;

  TCest_versoes_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCest_versao_class;
    procedure SetItem(Index: Integer; const Value: TCest_versao_class);
  public
    function New: TCest_versao_class;

    property Items[Index: Integer]: TCest_versao_class read GetItem write SetItem;
  end;

implementation

{ TCest_versao_class }

procedure TCest_versao_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CEST_VERSAO');
  with FTable.Fields do
  begin
    AddField('ID'           , fkInteger , 0 , False, True              );
    AddField('COD_EMPRESA'  , fkInteger , 0 , False, True              );
    AddField('VERSAO'       , fkString  , 16, False                    );
    AddField('DATA_VERSAO'  , fkDateTime                               );
    AddField('DATA_CADASTRO', fkDateTime, 0 , True , False, False, True);
    AddField('TIPO_CADASTRO', fkInteger , 0 , True , False, False, True);
    AddField('ATIVO'        , fkInteger , 0 , True , False, False, True);
  end;
end;

constructor TCest_versao_class.Create;
begin
  InitializeObjects;
end;

{ TCest_versoes_class }

function TCest_versoes_class.GetItem(Index: Integer): TCest_versao_class;
begin
  Result := TCest_versao_class(inherited Items[Index]);
end;

function TCest_versoes_class.New: TCest_versao_class;
begin
  Result := TCest_versao_class.Create;
  Add(Result);
end;

procedure TCest_versoes_class.SetItem(Index: Integer; const Value: TCest_versao_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCest_versao_class);
finalization
  UnRegisterClass(TCest_versao_class);

end.
