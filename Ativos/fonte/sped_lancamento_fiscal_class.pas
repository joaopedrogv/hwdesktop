unit sped_lancamento_fiscal_class;

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
  TSped_lancamento_fiscal_class = class(TBaseFb_class)
  private
    Fcod_obs          : Integer;
    Fcod_empresa      : Integer;
    Ftxt              : string;
    Fcod_padrao_ajuste: string;
    Fconf_assistente  : TStrings;
    Ftipo_lanc        : Variant;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;
    destructor Destroy; override;

    function Clone: TSped_lancamento_fiscal_class; virtual;

  published
    property cod_obs          : Integer  read Fcod_obs           write Fcod_obs;
    property cod_empresa      : Integer  read Fcod_empresa       write Fcod_empresa;
    property txt              : string   read Ftxt               write Ftxt;
    property cod_padrao_ajuste: string   read Fcod_padrao_ajuste write Fcod_padrao_ajuste;
    property conf_assistente  : TStrings read Fconf_assistente   write Fconf_assistente;
    property tipo_lanc        : Variant  read Ftipo_lanc         write Ftipo_lanc;
  end;

  TSped_lancamento_fiscais_class = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TSped_lancamento_fiscal_class;
    procedure SetItem(Index: Integer; const Value: TSped_lancamento_fiscal_class);
  public
    function New: TSped_lancamento_fiscal_class;

    property Items[Index: Integer]: TSped_lancamento_fiscal_class read GetItem write SetItem;
  end;

implementation

uses
{$IFDEF VER180}
  SysUtils;
{$ELSE}
  System.SysUtils;
{$ENDIF}

{ TSped_lancamento_fiscal_class }

procedure TSped_lancamento_fiscal_class.InitializeObjects;
begin
  Ftable := TTableFb.Create('SPED_LANCAMENTO_FISCAL');
  with FTable.Fields do
  begin
    AddField('COD_OBS'          , fkInteger , 0  , False, True);
    AddField('COD_EMPRESA'      , fkInteger , 0  , False, True);
    AddField('TXT'              , fkString  , 255             );
    AddField('COD_PADRAO_AJUSTE', fkString  , 10              );
    AddField('CONF_ASSISTENTE'  , fkTStrings                  );
    AddField('TIPO_LANC'        , fkInteger                   );
  end;
  Fconf_assistente := TStringList.Create;
end;

constructor TSped_lancamento_fiscal_class.Create;
begin
  InitializeObjects;
end;

destructor TSped_lancamento_fiscal_class.Destroy;
begin
  if Assigned(Fconf_assistente) then
    FreeAndNil(Fconf_assistente);
  inherited;
end;

function TSped_lancamento_fiscal_class.Clone: TSped_lancamento_fiscal_class;
begin
  Result                      := TSped_lancamento_fiscal_class.Create;
  Result.cod_obs              := Self.cod_obs;
  Result.cod_empresa          := Self.cod_empresa;
  Result.txt                  := Self.txt;
  Result.cod_padrao_ajuste    := Self.cod_padrao_ajuste;
  Result.conf_assistente.Text := Self.conf_assistente.Text;
  Result.tipo_lanc            := Self.tipo_lanc;
end;

{ TSped_lancamento_fiscais_class }

function TSped_lancamento_fiscais_class.GetItem(Index: Integer): TSped_lancamento_fiscal_class;
begin
  Result := TSped_lancamento_fiscal_class(inherited Items[Index]);
end;

function TSped_lancamento_fiscais_class.New: TSped_lancamento_fiscal_class;
begin
  Result := TSped_lancamento_fiscal_class.Create;
  Add(Result);
end;

procedure TSped_lancamento_fiscais_class.SetItem(Index: Integer; const Value: TSped_lancamento_fiscal_class);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TSped_lancamento_fiscal_class);
finalization
  UnRegisterClass(TSped_lancamento_fiscal_class);

end.
