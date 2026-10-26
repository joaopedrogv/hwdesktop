unit tabela_processos_usuarios_class;

interface

uses
  Contnrs,
  DB;

type
  TTabela_processos_usuarios_class = class(TObject)
  private
    Fcod_processo     : string;
    Fcod_empresa      : Integer;
    Fusuario          : string;
    Fusuario_autorizou: string;
    Fdata_autorizacao : TDateTime;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TTabela_processos_usuarios_class; virtual;

    property cod_processo     : string    read Fcod_processo      write Fcod_processo;
    property cod_empresa      : Integer   read Fcod_empresa       write Fcod_empresa;
    property usuario          : string    read Fusuario           write Fusuario;
    property usuario_autorizou: string    read Fusuario_autorizou write Fusuario_autorizou;
    property data_autorizacao : TDateTime read Fdata_autorizacao  write Fdata_autorizacao;
  end;

  TTabela_processos_usuarios_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TTabela_processos_usuarios_class;
    procedure SetItem(Index: Integer; const Value: TTabela_processos_usuarios_class);
  public
    function New: TTabela_processos_usuarios_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TTabela_processos_usuarios_class read GetItem write SetItem;
  end;

implementation

uses
  SysUtils;

{ TTabela_processos_usuarios_class }

function TTabela_processos_usuarios_class.Clone: TTabela_processos_usuarios_class;
begin
  Result                   := TTabela_processos_usuarios_class.Create;
  Result.cod_processo      := Self.cod_processo;
  Result.cod_empresa       := Self.cod_empresa;
  Result.usuario           := Self.usuario;
  Result.usuario_autorizou := Self.usuario_autorizou;
  Result.data_autorizacao  := Self.data_autorizacao;
end;

class function TTabela_processos_usuarios_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_processo, @cod_empresa, @usuario, @usuario_autorizou, @data_autorizacao';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TTabela_processos_usuarios_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_processo      := Trim(ADataSet.FieldByName('COD_PROCESSO').AsString);
    Fcod_empresa       := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fusuario           := Trim(ADataSet.FieldByName('USUARIO').AsString);
    Fusuario_autorizou := Trim(ADataSet.FieldByName('USUARIO_AUTORIZOU').AsString);
    Fdata_autorizacao  := ADataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_PROCESSO'     )) then Fcod_processo      := Trim(ADataSet.FieldByName('COD_PROCESSO').AsString);
    if Assigned(ADataSet.FindField('COD_EMPRESA'      )) then Fcod_empresa       := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('USUARIO'          )) then Fusuario           := Trim(ADataSet.FieldByName('USUARIO').AsString);
    if Assigned(ADataSet.FindField('USUARIO_AUTORIZOU')) then Fusuario_autorizou := Trim(ADataSet.FieldByName('USUARIO_AUTORIZOU').AsString);
    if Assigned(ADataSet.FindField('DATA_AUTORIZACAO' )) then Fdata_autorizacao  := ADataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime;
  end;
end;

{ TTabela_processos_usuarios_classList }

function TTabela_processos_usuarios_classList.GetItem(Index: Integer): TTabela_processos_usuarios_class;
begin
  Result := TTabela_processos_usuarios_class(inherited Items[Index]);
end;

function TTabela_processos_usuarios_classList.New: TTabela_processos_usuarios_class;
begin
  Result := TTabela_processos_usuarios_class.Create;
  Add(Result);
end;

procedure TTabela_processos_usuarios_classList.SetItem(Index: Integer; const Value: TTabela_processos_usuarios_class);
begin
  Put(Index, Value);
end;

procedure TTabela_processos_usuarios_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
