unit efd_ajustes_conf_class;

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
  TEfd_ajustes_conf_class = class(TBaseFb_class)
  private
    Fid              : string;
    Fseq             : Integer;
    Fcod_empresa     : Integer;
    Fdescricao       : string;
    Fativo           : Variant;
    Fdata_cadastro   : Variant;
    Fdata_modificacao: Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id              : string  read Fid               write Fid;
    property seq             : Integer read Fseq              write Fseq;
    property cod_empresa     : Integer read Fcod_empresa      write Fcod_empresa;
    property descricao       : string  read Fdescricao        write Fdescricao;
    property ativo           : Variant read Fativo            write Fativo;
    property data_cadastro   : Variant read Fdata_cadastro    write Fdata_cadastro;
    property data_modificacao: Variant read Fdata_modificacao write Fdata_modificacao;
  end;

  TEfd_ajustes_confs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TEfd_ajustes_conf_class;
    procedure SetItem(Index: Integer; const Value: TEfd_ajustes_conf_class);
  public
    function New: TEfd_ajustes_conf_class;

    property Items[Index: Integer]: TEfd_ajustes_conf_class read GetItem write SetItem;
  end;

implementation

{ TEfd_ajustes_conf_class }

procedure TEfd_ajustes_conf_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('EFD_AJUSTES_CONF');
  with FTable.Fields do
  begin
    AddField('ID'              , fkString  , 36, False, True              );
    AddField('SEQ'             , fkInteger , 0 , False                    );
    AddField('COD_EMPRESA'     , fkInteger , 0 , False, True              );
    AddField('DESCRICAO'       , fkString  , 60, False                    );
    AddField('ATIVO'           , fkInteger , 0 , True , False, False, True);
    AddField('DATA_CADASTRO'   , fkDateTime                               );
    AddField('DATA_MODIFICACAO', fkDateTime                               );
  end;
end;

constructor TEfd_ajustes_conf_class.Create;
begin
  InitializeObjects;
end;

{ TEfd_ajustes_confs_class }

function TEfd_ajustes_confs_class.GetItem(Index: Integer): TEfd_ajustes_conf_class;
begin
  Result := TEfd_ajustes_conf_class(inherited Items[Index]);
end;

function TEfd_ajustes_confs_class.New: TEfd_ajustes_conf_class;
begin
  Result := TEfd_ajustes_conf_class.Create;
  Add(Result);
end;

procedure TEfd_ajustes_confs_class.SetItem(Index: Integer; const Value: TEfd_ajustes_conf_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TEfd_ajustes_conf_class);
finalization
  UnRegisterClass(TEfd_ajustes_conf_class);

end.
