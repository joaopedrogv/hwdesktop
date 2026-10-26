unit opf_class;

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
  TOpf_class = class(TBaseFb_class)
  private
    Fid              : Integer;
    Fcod_empresa     : Integer;
    Fdescricao       : string;
    Fativo           : Variant;
    Fdata_cadastro   : Variant;
    Fdata_modificacao: Variant;
    Fcod_inf         : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id              : Integer read Fid               write Fid;
    property cod_empresa     : Integer read Fcod_empresa      write Fcod_empresa;
    property descricao       : string  read Fdescricao        write Fdescricao;
    property ativo           : Variant read Fativo            write Fativo;
    property data_cadastro   : Variant read Fdata_cadastro    write Fdata_cadastro;
    property data_modificacao: Variant read Fdata_modificacao write Fdata_modificacao;
    property cod_inf         : Variant read Fcod_inf          write Fcod_inf;
  end;

  TOpfs_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TOpf_class;
    procedure SetItem(Index: Integer; const Value: TOpf_class);
  public
    function New: TOpf_class;

    property Items[Index: Integer]: TOpf_class read GetItem write SetItem;
  end;

implementation

{ TOpf_class }

procedure TOpf_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('OPF');
  with FTable.Fields do
  begin
    AddField('ID'              , fkInteger , 0 , False, True              );
    AddField('COD_EMPRESA'     , fkInteger , 0 , False, True , True       );
    AddField('DESCRICAO'       , fkString  , 64                           );
    AddField('ATIVO'           , fkInteger , 0 , True , False, False, True);
    AddField('DATA_CADASTRO'   , fkDateTime                               );
    AddField('DATA_MODIFICACAO', fkDateTime                               );
    AddField('COD_INF'         , fkInteger , 0 , True , False, True       );
  end;
end;

constructor TOpf_class.Create;
begin
  InitializeObjects;
end;

{ TOpfs_class }

function TOpfs_class.GetItem(Index: Integer): TOpf_class;
begin
  Result := TOpf_class(inherited Items[Index]);
end;

function TOpfs_class.New: TOpf_class;
begin
  Result := TOpf_class.Create;
  Add(Result);
end;

procedure TOpfs_class.SetItem(Index: Integer; const Value: TOpf_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TOpf_class);
finalization
  UnRegisterClass(TOpf_class);

end.
