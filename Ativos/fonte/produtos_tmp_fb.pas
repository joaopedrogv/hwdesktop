unit produtos_tmp_fb;

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
  TProdutos_tmp_class = class(TBaseFb_class)
  private
    Fid_tmp     : string;
    Fseqid      : Integer;
    Fcod_empresa: Integer;
    Fgrupo_prod : Variant;
    Fcod_prod   : string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
  published
    property id_tmp     : string  read Fid_tmp      write Fid_tmp;
    property seqid      : Integer read Fseqid       write Fseqid;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property grupo_prod : Variant read Fgrupo_prod  write Fgrupo_prod;
    property cod_prod   : string  read Fcod_prod    write Fcod_prod;
  end;

  TProdutos_tmps_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TProdutos_tmp_class;
    procedure SetItem(Index: Integer; const Value: TProdutos_tmp_class);
  public
    function New: TProdutos_tmp_class;

    property Items[Index: Integer]: TProdutos_tmp_class read GetItem write SetItem;
  end;

implementation

{ TProdutos_tmp_class }

procedure TProdutos_tmp_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('PRODUTOS_TMP');
  with FTable.Fields do
  begin
    AddField('ID_TMP'     , fkString , 60, False, True);
    AddField('SEQID'      , fkInteger, 0 , False, True);
    AddField('COD_EMPRESA', fkInteger, 0 , False, True);
    AddField('GRUPO_PROD' , fkInteger                 );
    AddField('COD_PROD'   , fkString , 6              );
  end;
end;

constructor TProdutos_tmp_class.Create;
begin
  InitializeObjects;
end;

{ TProdutos_tmps_class }

function TProdutos_tmps_class.GetItem(Index: Integer): TProdutos_tmp_class;
begin
  Result := TProdutos_tmp_class(inherited Items[Index]);
end;

function TProdutos_tmps_class.New: TProdutos_tmp_class;
begin
  Result := TProdutos_tmp_class.Create;
  Add(Result);
end;

procedure TProdutos_tmps_class.SetItem(Index: Integer; const Value: TProdutos_tmp_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TProdutos_tmp_class);
finalization
  UnRegisterClass(TProdutos_tmp_class);

end.
