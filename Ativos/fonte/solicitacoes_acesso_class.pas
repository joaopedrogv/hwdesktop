unit solicitacoes_acesso_class;

interface

uses
{$IFNDEF VER180}
  System.Contnrs,
  Data.DB,
  IBX.IBQuery;
{$ELSE}
  Contnrs,
  DB,
  IBQuery;
{$ENDIF}

type
  TSolicitacoes_acesso_class = class(TObject)
  private
    Fcod_solicitacao    : Integer;
    Fcod_empresa        : Integer;
    Fusuario_solicitante: string;
    Fdata_solicitacao   : TDateTime;
    Fprocesso           : string;
    Fmensagem           : string;
    Fusuario_gerente    : string;
    Flote               : Integer;
    Fcont_alt           : Integer;
  public
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string;

    function Clone: TSolicitacoes_acesso_class; virtual;

    property cod_solicitacao    : Integer   read Fcod_solicitacao     write Fcod_solicitacao;
    property cod_empresa        : Integer   read Fcod_empresa         write Fcod_empresa;
    property usuario_solicitante: string    read Fusuario_solicitante write Fusuario_solicitante;
    property data_solicitacao   : TDateTime read Fdata_solicitacao    write Fdata_solicitacao;
    property processo           : string    read Fprocesso            write Fprocesso;
    property mensagem           : string    read Fmensagem            write Fmensagem;
    property usuario_gerente    : string    read Fusuario_gerente     write Fusuario_gerente;
    property lote               : Integer   read Flote                write Flote;
    property cont_alt           : Integer   read Fcont_alt            write Fcont_alt;
  end;

  TSolicitacoes_acesso_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TSolicitacoes_acesso_class;
    procedure SetItem(Index: Integer; const Value: TSolicitacoes_acesso_class);
  public
    function New: TSolicitacoes_acesso_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TSolicitacoes_acesso_class read GetItem write SetItem;
  end;

implementation

uses
{$IFNDEF VER180}
  System.SysUtils;
{$ELSE}
  SysUtils;
{$ENDIF}

{ TSolicitacoes_acesso_class }

function TSolicitacoes_acesso_class.Clone: TSolicitacoes_acesso_class;
begin
  Result                     := TSolicitacoes_acesso_class.Create;
  Result.cod_solicitacao     := Self.cod_solicitacao;
  Result.cod_empresa         := Self.cod_empresa;
  Result.usuario_solicitante := Self.usuario_solicitante;
  Result.data_solicitacao    := Self.data_solicitacao;
  Result.processo            := Self.processo;
  Result.mensagem            := Self.mensagem;
  Result.usuario_gerente     := Self.usuario_gerente;
  Result.lote                := Self.lote;
  Result.cont_alt            := Self.cont_alt;
end;

class function TSolicitacoes_acesso_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@cod_solicitacao, @cod_empresa, @usuario_solicitante, @data_solicitacao, @processo, @mensagem,' +
            ' @usuario_gerente, @lote, @cont_alt';
  if Trim(Aalias) <> '' then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TSolicitacoes_acesso_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fcod_solicitacao     := ADataSet.FieldByName('COD_SOLICITACAO').AsInteger;
    Fcod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fusuario_solicitante := Trim(ADataSet.FieldByName('USUARIO_SOLICITANTE').AsString);
    Fdata_solicitacao    := ADataSet.FieldByName('DATA_SOLICITACAO').AsDateTime;
    Fprocesso            := Trim(ADataSet.FieldByName('PROCESSO').AsString);
    Fmensagem            := Trim(ADataSet.FieldByName('MENSAGEM').AsString);
    Fusuario_gerente     := Trim(ADataSet.FieldByName('USUARIO_GERENTE').AsString);
    Flote                := ADataSet.FieldByName('LOTE').AsInteger;
    Fcont_alt            := ADataSet.FieldByName('CONT_ALT').AsInteger;
  end
  else
  begin
    if Assigned(ADataSet.FindField('COD_SOLICITACAO'    )) then Fcod_solicitacao     := ADataSet.FieldByName('COD_SOLICITACAO').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'        )) then Fcod_empresa         := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('USUARIO_SOLICITANTE')) then Fusuario_solicitante := Trim(ADataSet.FieldByName('USUARIO_SOLICITANTE').AsString);
    if Assigned(ADataSet.FindField('DATA_SOLICITACAO'   )) then Fdata_solicitacao    := ADataSet.FieldByName('DATA_SOLICITACAO').AsDateTime;
    if Assigned(ADataSet.FindField('PROCESSO'           )) then Fprocesso            := Trim(ADataSet.FieldByName('PROCESSO').AsString);
    if Assigned(ADataSet.FindField('MENSAGEM'           )) then Fmensagem            := Trim(ADataSet.FieldByName('MENSAGEM').AsString);
    if Assigned(ADataSet.FindField('USUARIO_GERENTE'    )) then Fusuario_gerente     := Trim(ADataSet.FieldByName('USUARIO_GERENTE').AsString);
    if Assigned(ADataSet.FindField('LOTE'               )) then Flote                := ADataSet.FieldByName('LOTE').AsInteger;
    if Assigned(ADataSet.FindField('CONT_ALT'           )) then Fcont_alt            := ADataSet.FieldByName('CONT_ALT').AsInteger;
  end;
end;

function TSolicitacoes_acesso_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('COD_SOLICITACAO').AsInteger    := Fcod_solicitacao;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger        := Fcod_empresa;
    ADataSet.ParamByName('USUARIO_SOLICITANTE').AsString := Copy(Fusuario_solicitante, 1, 20);
    ADataSet.ParamByName('DATA_SOLICITACAO').AsDateTime  := Fdata_solicitacao;
    ADataSet.ParamByName('PROCESSO').AsString            := Copy(Fprocesso           , 1, 10);
    ADataSet.ParamByName('MENSAGEM').AsString            := Copy(Fmensagem           , 1, 128);
    ADataSet.ParamByName('USUARIO_GERENTE').AsString     := Copy(Fusuario_gerente    , 1, 20);
    ADataSet.ParamByName('LOTE').AsInteger               := Flote;
    ADataSet.ParamByName('CONT_ALT').AsInteger           := Fcont_alt;
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('COD_SOLICITACAO'    )) then   ADataSet.ParamByName('COD_SOLICITACAO').AsInteger    := Fcod_solicitacao;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'        )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger        := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('USUARIO_SOLICITANTE')) then   ADataSet.ParamByName('USUARIO_SOLICITANTE').AsString := Copy(Fusuario_solicitante, 1, 20);
    if Assigned(ADataSet.Params.FindParam('DATA_SOLICITACAO'   )) then   ADataSet.ParamByName('DATA_SOLICITACAO').AsDateTime  := Fdata_solicitacao;
    if Assigned(ADataSet.Params.FindParam('PROCESSO'           )) then   ADataSet.ParamByName('PROCESSO').AsString            := Copy(Fprocesso           , 1, 10);
    if Assigned(ADataSet.Params.FindParam('MENSAGEM'           )) then   ADataSet.ParamByName('MENSAGEM').AsString            := Copy(Fmensagem           , 1, 128);
    if Assigned(ADataSet.Params.FindParam('USUARIO_GERENTE'    )) then   ADataSet.ParamByName('USUARIO_GERENTE').AsString     := Copy(Fusuario_gerente    , 1, 20);
    if Assigned(ADataSet.Params.FindParam('LOTE'               )) then   ADataSet.ParamByName('LOTE').AsInteger               := Flote;
    if Assigned(ADataSet.Params.FindParam('CONT_ALT'           )) then   ADataSet.ParamByName('CONT_ALT').AsInteger           := Fcont_alt;
  end;
end;

{ TSolicitacoes_acesso_classList }

function TSolicitacoes_acesso_classList.GetItem(Index: Integer): TSolicitacoes_acesso_class;
begin
  Result := TSolicitacoes_acesso_class(inherited Items[Index]);
end;

function TSolicitacoes_acesso_classList.New: TSolicitacoes_acesso_class;
begin
  Result := TSolicitacoes_acesso_class.Create;
  Add(Result);
end;

procedure TSolicitacoes_acesso_classList.SetItem(Index: Integer; const Value: TSolicitacoes_acesso_class);
begin
  Put(Index, Value);
end;

procedure TSolicitacoes_acesso_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

end.
