unit cest_mva_class;

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
  TCest_mva_class = class(TBaseFb_class)
  private
    Fid              : Integer;
    Fcod_empresa     : Integer;
    Fcest_id         : Integer;
    Fcest_variante_id: Variant;
    Fmva             : Variant;
    Fncm_excecao     : TStrings;
    Fversao          : string;
    Fdata_cadastro   : Variant;
    Fdata_modificacao: Variant;
    Ftipo_cadastro   : Variant;
    Fativo           : Variant;
    Fufs_aliq        : string;
    Forigem          : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property id              : Integer  read Fid               write Fid;
    property cod_empresa     : Integer  read Fcod_empresa      write Fcod_empresa;
    property cest_id         : Integer  read Fcest_id          write Fcest_id;
    property cest_variante_id: Variant  read Fcest_variante_id write Fcest_variante_id;
    property mva             : Variant  read Fmva              write Fmva;
    property ncm_excecao     : TStrings read Fncm_excecao      write Fncm_excecao;
    property versao          : string   read Fversao           write Fversao;
    property data_cadastro   : Variant  read Fdata_cadastro    write Fdata_cadastro;
    property data_modificacao: Variant  read Fdata_modificacao write Fdata_modificacao;
    property tipo_cadastro   : Variant  read Ftipo_cadastro    write Ftipo_cadastro;
    property ativo           : Variant  read Fativo            write Fativo;
    property ufs_aliq        : string   read Fufs_aliq         write Fufs_aliq;
    property origem          : Variant  read Forigem           write Forigem;
  end;

  TCest_mvas_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TCest_mva_class;
    procedure SetItem(Index: Integer; const Value: TCest_mva_class);
  public
    function New: TCest_mva_class;

    property Items[Index: Integer]: TCest_mva_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TCest_mva_class }

procedure TCest_mva_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('CEST_MVA');
  with FTable.Fields do
  begin
    AddField('ID'              , fkInteger , 0  , False, True              );
    AddField('COD_EMPRESA'     , fkInteger , 0  , False, True , True       );
    AddField('CEST_ID'         , fkInteger , 0  , False, False, True       );
    AddField('CEST_VARIANTE_ID', fkInteger , 0  , True , False, True       );
    AddField('MVA'             , fkFloat   , 0  , True , False, False, True);
    AddField('NCM_EXCECAO'     , fkTStrings                                );
    AddField('VERSAO'          , fkString  , 16                            );
    AddField('DATA_CADASTRO'   , fkDateTime, 0  , True , False, False, True);
    AddField('DATA_MODIFICACAO', fkDateTime, 0  , True , False, False, True);
    AddField('TIPO_CADASTRO'   , fkInteger                                 );
    AddField('ATIVO'           , fkInteger , 0  , True , False, False, True);
    AddField('UFS_ALIQ'        , fkString  , 128                           );
    AddField('ORIGEM'          , fkInteger                                 );
  end;
  Fncm_excecao := TStringList.Create;
end;

constructor TCest_mva_class.Create;
begin
  InitializeObjects;
end;

destructor TCest_mva_class.Destroy;
begin
  if Assigned(Fncm_excecao) then
    FreeAndNil(Fncm_excecao);
  inherited;
end;

{ TCest_mvas_class }

function TCest_mvas_class.GetItem(Index: Integer): TCest_mva_class;
begin
  Result := TCest_mva_class(inherited Items[Index]);
end;

function TCest_mvas_class.New: TCest_mva_class;
begin
  Result := TCest_mva_class.Create;
  Add(Result);
end;

procedure TCest_mvas_class.SetItem(Index: Integer; const Value: TCest_mva_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TCest_mva_class);
finalization
  UnRegisterClass(TCest_mva_class);

end.
