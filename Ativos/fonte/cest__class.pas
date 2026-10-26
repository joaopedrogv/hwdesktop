unit cest__class;

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
  TCest__class = class(TBaseFb_class)
  private
    Fid              : Integer;
    Fcod_empresa     : Integer;
    Fcest            : string;
    Fambito          : Integer;
    Fdescricao       : TStrings;
    Fversao          : string;
    Fdata_cadastro   : Variant;
    Fdata_modificacao: Variant;
    Fativo           : Variant;
    Fufs_convenio    : string;
    Forigem          : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id              : Integer  read Fid               write Fid;
    property cod_empresa     : Integer  read Fcod_empresa      write Fcod_empresa;
    property cest            : string   read Fcest             write Fcest;
    property ambito          : Integer  read Fambito           write Fambito;
    property descricao       : TStrings read Fdescricao        write Fdescricao;
    property versao          : string   read Fversao           write Fversao;
    property data_cadastro   : Variant  read Fdata_cadastro    write Fdata_cadastro;
    property data_modificacao: Variant  read Fdata_modificacao write Fdata_modificacao;
    property ativo           : Variant  read Fativo            write Fativo;
    property ufs_convenio    : string   read Fufs_convenio     write Fufs_convenio;
    property origem          : Variant  read Forigem           write Forigem;
  end;

  TCest_s_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCest__class;
    procedure SetItem(Index: Integer; const Value: TCest__class);
  public
    function New: TCest__class;

    property Items[Index: Integer]: TCest__class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TCest__class }

procedure TCest__class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CEST_');
  with FTable.Fields do
  begin
    AddField('ID'              , fkInteger , 0  , False, True              );
    AddField('COD_EMPRESA'     , fkInteger , 0  , False, True              );
    AddField('CEST'            , fkString  , 7  , False                    );
    AddField('AMBITO'          , fkInteger , 0  , False                    );
    AddField('DESCRICAO'       , fkTStrings                                );
    AddField('VERSAO'          , fkString  , 16                            );
    AddField('DATA_CADASTRO'   , fkDateTime                                );
    AddField('DATA_MODIFICACAO', fkDateTime                                );
    AddField('ATIVO'           , fkInteger , 0  , True , False, False, True);
    AddField('UFS_CONVENIO'    , fkString  , 128                           );
    AddField('ORIGEM'          , fkInteger                                 );
  end;
  Fdescricao := TStringList.Create;
end;

constructor TCest__class.Create;
begin
  InitializeObjects;
end;

destructor TCest__class.Destroy;
begin
  if Assigned(Fdescricao) then
    FreeAndNil(Fdescricao);
  inherited;
end;

{ TCest_s_class }

function TCest_s_class.GetItem(Index: Integer): TCest__class;
begin
  Result := TCest__class(inherited Items[Index]);
end;

function TCest_s_class.New: TCest__class;
begin
  Result := TCest__class.Create;
  Add(Result);
end;

procedure TCest_s_class.SetItem(Index: Integer; const Value: TCest__class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCest__class);
finalization
  UnRegisterClass(TCest__class);

end.
