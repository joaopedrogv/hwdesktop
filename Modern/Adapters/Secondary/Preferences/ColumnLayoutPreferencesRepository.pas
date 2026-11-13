// Next
unit ColumnLayoutPreferencesRepository;

interface

uses
  ColumnLayoutPreferences, IDataBaseConnectionUnit, ISessionContextUnit;

type
  // Adaptador de CONFIG_COLUNAS para preferencias visuais de colunas. Nao
  // possui a conexao nem a sessao: a composicao cede ambas e continua
  // responsavel pelo ciclo de vida delas. O login e lido da sessao a cada
  // operacao, portanto a troca de usuario vale sem recriar o repositorio.
  TColumnLayoutPreferencesRepository = class(TInterfacedObject,
    IColumnLayoutPreferences)
  private
    FConnection: IDataBaseConnection;
    FSession: ISessionContext;
    FComponent: string;
    function RequireLogin: string;
    procedure ValidateEntry(const AEntry: TColumnLayoutEntry);
  public
    constructor Create(const AConnection: IDataBaseConnection;
      const ASession: ISessionContext; const AComponent: string);
    function Load: TColumnLayoutEntries;
    procedure Save(const AEntries: TColumnLayoutEntries);
    procedure Reset;
  end;

implementation

uses
  SysUtils, ParameterValueUnit, ITransactionUnit, QueryResultUnit,
  EValidacaoNegocioUnit;

const
  MaxLoginLength = 20;
  MaxComponentLength = 64;
  MaxFieldNameLength = 64;

  LoadSql =
    'select CAMPOS, VISIVEL, ORDEM, LARGURA_EXIBICAO ' +
    'from CONFIG_COLUNAS ' +
    'where USUARIO = :USUARIO and COMPONENTE = :COMPONENTE ' +
    'and VISIVEL is not null ' +
    'order by CAMPOS';

  // A lista de colunas omite EXCEL_TITULO/EXCEL_FORMAT: a atualizacao preserva
  // os dados de exportacao da linha e a insercao os deixa nulos.
  UpsertWithWidthSql =
    'update or insert into CONFIG_COLUNAS ' +
    '(USUARIO, COMPONENTE, CAMPOS, VISIVEL, ORDEM, LARGURA_EXIBICAO) ' +
    'values (:USUARIO, :COMPONENTE, :CAMPOS, :VISIVEL, :ORDEM, ' +
    ':LARGURA_EXIBICAO) ' +
    'matching (USUARIO, COMPONENTE, CAMPOS)';

  UpsertWithoutWidthSql =
    'update or insert into CONFIG_COLUNAS ' +
    '(USUARIO, COMPONENTE, CAMPOS, VISIVEL, ORDEM) ' +
    'values (:USUARIO, :COMPONENTE, :CAMPOS, :VISIVEL, :ORDEM) ' +
    'matching (USUARIO, COMPONENTE, CAMPOS)';

  // Restauracao do padrao em duas instrucoes: a linha com dados de exportacao
  // permanece e perde apenas a preferencia visual; a linha puramente visual e
  // removida.
  ClearVisualPreferenceSql =
    'update CONFIG_COLUNAS ' +
    'set VISIVEL = null, ORDEM = null, LARGURA_EXIBICAO = null ' +
    'where USUARIO = :USUARIO and COMPONENTE = :COMPONENTE ' +
    'and (EXCEL_TITULO is not null or EXCEL_FORMAT is not null)';

  DeleteVisualOnlySql =
    'delete from CONFIG_COLUNAS ' +
    'where USUARIO = :USUARIO and COMPONENTE = :COMPONENTE ' +
    'and EXCEL_TITULO is null and EXCEL_FORMAT is null';

{ TColumnLayoutPreferencesRepository }

constructor TColumnLayoutPreferencesRepository.Create(
  const AConnection: IDataBaseConnection; const ASession: ISessionContext;
  const AComponent: string);
var
  Component: string;
begin
  inherited Create;

  if AConnection = nil then
    raise Exception.Create(
      'A conexao das preferencias de colunas nao foi informada.');
  if ASession = nil then
    raise Exception.Create(
      'A sessao das preferencias de colunas nao foi informada.');

  // O componente identifica a consulta e nao pode ocupar o espaco de nomes dos
  // modelos de exportacao, que usam '@' para separar a consulta do codigo.
  Component := Trim(AComponent);
  if Component = '' then
    raise EValidacaoNegocio.Create(
      'O componente das preferencias de colunas nao foi informado.');
  if Length(Component) > MaxComponentLength then
    raise EValidacaoNegocio.Create(
      'O componente das preferencias de colunas excede 64 caracteres.');
  if Pos('@', Component) > 0 then
    raise Exception.Create(
      'O componente das preferencias de colunas nao pode conter @.');

  FConnection := AConnection;
  FSession := ASession;
  FComponent := Component;
end;

function TColumnLayoutPreferencesRepository.RequireLogin: string;
begin
  Result := Trim(FSession.UsuarioLogin);
  if Result = '' then
    raise EValidacaoNegocio.Create('O login do usuario nao foi informado.');
  if Length(Result) > MaxLoginLength then
    raise EValidacaoNegocio.Create('O login do usuario excede 20 caracteres.');
end;

procedure TColumnLayoutPreferencesRepository.ValidateEntry(
  const AEntry: TColumnLayoutEntry);
var
  FieldName: string;
begin
  // Sem truncamento: um nome maior que a coluna CAMPOS seria gravado
  // incompleto e criaria uma preferencia que a consulta nao reconhece.
  FieldName := Trim(AEntry.FieldName);
  if FieldName = '' then
    raise EValidacaoNegocio.Create('O campo da preferencia de colunas nao foi informado.');
  if Length(FieldName) > MaxFieldNameLength then
    raise EValidacaoNegocio.Create('O campo da preferencia de colunas excede 64 caracteres.');
  if AEntry.Order < 0 then
    raise EValidacaoNegocio.Create('A ordem da preferencia de colunas nao pode ser negativa.');
end;

function TColumnLayoutPreferencesRepository.Load: TColumnLayoutEntries;
var
  Login: string;
  Query: QueryResult;
  Entry: TColumnLayoutEntry;
  Current: TColumnLayoutEntry;
  Count: Integer;
  I: Integer;
  J: Integer;
begin
  SetLength(Result, 0);

  // Leitura nao abre transacao propria: CreateQuery usa a transacao corrente da
  // conexao e a libera junto com a consulta.
  Login := RequireLogin;
  Query := FConnection.CreateQuery(LoadSql,
    ParametersBuilder.Create(2)
      .ByName('USUARIO', Login)
      .ByName('COMPONENTE', FComponent)
      .Build());
  try
    Count := 0;
    Query.DataSet.First;
    while not Query.Eof do
    begin
      Entry.FieldName := Query.FieldAsString('CAMPOS');
      if Entry.FieldName <> '' then
      begin
        Entry.Visible := Query.FieldAsInteger('VISIVEL') = 1;
        if Query.FieldIsNull('ORDEM') then
          Entry.Order := MaxInt
        else
          Entry.Order := Query.FieldAsInteger('ORDEM');
        if Query.FieldIsNull('LARGURA_EXIBICAO') then
          Entry.Width := 0
        else
          Entry.Width := Query.FieldAsInteger('LARGURA_EXIBICAO');

        if Count >= Length(Result) then
          SetLength(Result, Count + 8);
        Result[Count] := Entry;
        Inc(Count);
      end;
      Query.Next;
    end;
    SetLength(Result, Count);
  finally
    Query.Free;
  end;

  // Ordenacao em memoria porque o Firebird 2.5 nao possui NULLS LAST; ORDEM
  // nula chega como MaxInt e o nome do campo desempata.
  if Length(Result) > 1 then
    for I := 1 to High(Result) do
    begin
      Current := Result[I];
      J := I - 1;
      while (J >= 0) and
        ((Result[J].Order > Current.Order) or
         ((Result[J].Order = Current.Order) and
          (CompareStr(Result[J].FieldName, Current.FieldName) > 0))) do
      begin
        Result[J + 1] := Result[J];
        Dec(J);
      end;
      Result[J + 1] := Current;
    end;
end;

procedure TColumnLayoutPreferencesRepository.Save(
  const AEntries: TColumnLayoutEntries);
var
  Login: string;
  Transaction: ITransaction;
  Params: ParametersValues;
  I: Integer;
begin
  if Length(AEntries) = 0 then
    Exit;

  Login := RequireLogin;

  // A lista inteira e validada antes da transacao: uma entrada invalida impede
  // a gravacao parcial das demais.
  for I := 0 to High(AEntries) do
    ValidateEntry(AEntries[I]);

  // Transacao propria: a gravacao do layout e atomica e independente da
  // transacao da pesquisa. ITransaction e classe, por isso a liberacao e
  // explicita no finally.
  Transaction := FConnection.BeginTransaction;
  try
    try
      for I := 0 to High(AEntries) do
      begin
        // A largura so e gravada quando positiva; zero ou negativa significa
        // "sem largura" e preserva a largura original da definicao.
        if AEntries[I].Width > 0 then
        begin
          Params := ParametersBuilder.Create(6)
            .ByName('USUARIO', Login)
            .ByName('COMPONENTE', FComponent)
            .ByName('CAMPOS', Trim(AEntries[I].FieldName))
            .ByName('VISIVEL', Ord(AEntries[I].Visible))
            .ByName('ORDEM', AEntries[I].Order)
            .ByName('LARGURA_EXIBICAO', AEntries[I].Width)
            .Build();
          FConnection.ExecuteCommand(UpsertWithWidthSql, Params);
        end
        else
        begin
          Params := ParametersBuilder.Create(5)
            .ByName('USUARIO', Login)
            .ByName('COMPONENTE', FComponent)
            .ByName('CAMPOS', Trim(AEntries[I].FieldName))
            .ByName('VISIVEL', Ord(AEntries[I].Visible))
            .ByName('ORDEM', AEntries[I].Order)
            .Build();
          FConnection.ExecuteCommand(UpsertWithoutWidthSql, Params);
        end;
      end;

      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  finally
    Transaction.Free;
  end;
end;

procedure TColumnLayoutPreferencesRepository.Reset;
var
  Login: string;
  Transaction: ITransaction;
  Params: ParametersValues;
begin
  Login := RequireLogin;
  Params := ParametersBuilder.Create(2)
    .ByName('USUARIO', Login)
    .ByName('COMPONENTE', FComponent)
    .Build();

  Transaction := FConnection.BeginTransaction;
  try
    try
      FConnection.ExecuteCommand(ClearVisualPreferenceSql, Params);
      FConnection.ExecuteCommand(DeleteVisualOnlySql, Params);

      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  finally
    Transaction.Free;
  end;
end;

end.
