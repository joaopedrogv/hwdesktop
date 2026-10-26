unit tabela_processos_class;

interface

uses
  Contnrs,
  DB;

type
  TTabela_processos_class = class(TObject)
  private
    Fcod_processo    : string;
    Fcod_empresa     : Integer;
    Fnome_processo   : string;
    Fnivel_processo  : Integer;
    Fsenha_gerente   : string;
    Fform            : string;
    Fativo           : Integer;
    Fgravar_auditoria: string;
    Fdata_mod_cad    : TDateTime;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TTabela_processos_class; virtual;

    property cod_processo    : string    read Fcod_processo     write Fcod_processo;
    property cod_empresa     : Integer   read Fcod_empresa      write Fcod_empresa;
    property nome_processo   : string    read Fnome_processo    write Fnome_processo;
    property nivel_processo  : Integer   read Fnivel_processo   write Fnivel_processo;
    property senha_gerente   : string    read Fsenha_gerente    write Fsenha_gerente;
    property form            : string    read Fform             write Fform;
    property ativo           : Integer   read Fativo            write Fativo;
    property gravar_auditoria: string    read Fgravar_auditoria write Fgravar_auditoria;
    property data_mod_cad    : TDateTime read Fdata_mod_cad     write Fdata_mod_cad;
  end;

  TTabela_processos_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TTabela_processos_class;
    procedure SetItem(Index: Integer; const Value: TTabela_processos_class);
  public
    function New: TTabela_processos_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TTabela_processos_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TTabela_processos_class }

constructor TTabela_processos_class.Create;
begin
  Fativo := 1;
end;

destructor TTabela_processos_class.Destroy;
begin
  inherited;
end;

function TTabela_processos_class.Clone: TTabela_processos_class;
begin
  Result                  := TTabela_processos_class.Create;
  Result.cod_processo     := Self.cod_processo;
  Result.cod_empresa      := Self.cod_empresa;
  Result.nome_processo    := Self.nome_processo;
  Result.nivel_processo   := Self.nivel_processo;
  Result.senha_gerente    := Self.senha_gerente;
  Result.form             := Self.form;
  Result.ativo            := Self.ativo;
  Result.gravar_auditoria := Self.gravar_auditoria;
  Result.data_mod_cad     := Self.data_mod_cad;
end;

class function TTabela_processos_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_processo, @cod_empresa, @nome_processo, @nivel_processo, @senha_gerente, @form, @ativo,' +
            ' @gravar_auditoria, @data_mod_cad';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TTabela_processos_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_processo     := Trim(ADataSet.FieldByName('COD_PROCESSO').AsString);
    Fcod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fnome_processo    := Trim(ADataSet.FieldByName('NOME_PROCESSO').AsString);
    Fnivel_processo   := ADataSet.FieldByName('NIVEL_PROCESSO').AsInteger;
    Fsenha_gerente    := Trim(ADataSet.FieldByName('SENHA_GERENTE').AsString);
    Fform             := Trim(ADataSet.FieldByName('FORM').AsString);
    Fativo            := ADataSet.FieldByName('ATIVO').AsInteger;
    Fgravar_auditoria := Trim(ADataSet.FieldByName('GRAVAR_AUDITORIA').AsString);
    Fdata_mod_cad     := ADataSet.FieldByName('DATA_MOD_CAD').AsDateTime;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_PROCESSO'    )) then Fcod_processo     := Trim(ADataSet.FieldByName('COD_PROCESSO').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA'     )) then Fcod_empresa      := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('NOME_PROCESSO'   )) then Fnome_processo    := Trim(ADataSet.FieldByName('NOME_PROCESSO').AsString);
    if Assigned(ADataSet.FindField('NIVEL_PROCESSO'  )) then Fnivel_processo   := ADataSet.FieldByName('NIVEL_PROCESSO').AsInteger;
    if Assigned(ADataSet.FindField('SENHA_GERENTE'   )) then Fsenha_gerente    := Trim(ADataSet.FieldByName('SENHA_GERENTE').AsString);
    if Assigned(ADataSet.FindField('FORM'            )) then Fform             := Trim(ADataSet.FieldByName('FORM').AsString);
    if Assigned(ADataSet.FindField('ATIVO'           )) then Fativo            := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('GRAVAR_AUDITORIA')) then Fgravar_auditoria := Trim(ADataSet.FieldByName('GRAVAR_AUDITORIA').AsString);
    if Assigned(ADataSet.FindField('DATA_MOD_CAD'    )) then Fdata_mod_cad     := ADataSet.FieldByName('DATA_MOD_CAD').AsDateTime;
  end;
end;

{ TTabela_processos_classList }

function TTabela_processos_classList.GetItem(Index: Integer): TTabela_processos_class;
begin
  Result := TTabela_processos_class(inherited Items[Index]);
end;

function TTabela_processos_classList.New: TTabela_processos_class;
begin
  Result := TTabela_processos_class.Create;
  Add(Result);
end;

procedure TTabela_processos_classList.SetItem(Index: Integer; const Value: TTabela_processos_class);
begin
  Put(Index, Value);
end;

procedure TTabela_processos_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
