unit GruposFiscaisRepositoryUnit;

interface      

uses
  IGruposFiscaisRepositoryUnit,
  BaseRepositoryUnit,
  QueryResultUnit,
  TipoComunsUnit,
  GrupoFiscalEtdUnit;

type                                                                      
  {$IFDEF INTF_ON}
  GruposFiscaisRepository = class(BaseRepository, IGruposFiscaisRepository)
  {$ELSE}
  GruposFiscaisRepository = class(IGruposFiscaisRepository)
  {$ENDIF}
  private
    function CreateItemFromQuery(Q: QueryResult; const E: TArrayInteger): GrupoFiscalEtd;
    function CreateListFromQuery(Q: QueryResult): GruposFiscaisEtd;
  public
    function Post(Input: GrupoFiscalEtd): GrupoFiscalEtd; override;
    function Put(Input: GrupoFiscalEtd): GrupoFiscalEtd; override;
    function GetById(const Id: string): GrupoFiscalEtd; override;
    function ListCurrentAndActives(const CurrentId: string): GruposFiscaisEtd; override;
    function ListarComAnexoVinculado(): GruposFiscaisEtd; override;
  end;

implementation

uses
  SysUtils,
  Math,
  TipoTributoFiscalEnumUnit,
  StatusRegistroEnumUnit,
  ParameterValueUnit, ITransactionUnit,
  IDataBaseConnectionUnit, ArrayServiceUnit, StringServiceUnit;

function GruposFiscaisRepository.CreateItemFromQuery(Q: QueryResult; const E: TArrayInteger): GrupoFiscalEtd;
begin
  Result := GrupoFiscalEtd.Create(
    Q.FieldAsString('id'),
    Q.FieldAsInteger('seqid'),
    Q.FieldAsString('descricao'),
    TipoTributoFiscalEnum(Q.FieldAsInteger('tipo_tributo')),
    Q.FieldAsDateTime('data_cadastro'),
    Q.FieldAsDateTime('data_alteracao'),
    StatusRegistroEnum(Q.FieldAsInteger('ativo')),
    Q.FieldAreEquals('gerido_sistema', 1),
    Q.FieldAsStringNullable('anexo'),
    E
  );
end;

{ GruposFiscaisRepository }

function GruposFiscaisRepository.GetById(const Id: string): GrupoFiscalEtd;
var
  EmpresasId: TArrayInteger;
  query: QueryResult;
begin
  query := FConnection.CreateQuery(
    'select g.id, g.seqid, g.descricao, g.tipo_tributo, g.data_cadastro, g.data_alteracao, g.ativo, ' +
    'g.gerido_sistema, g.anexo, ' +
    'e.cod_empresa ' +
    'from GRUPOS_FISCAIS g ' +
    'left join GRUPOS_FISCAIS_EMP e on e.GRUPO_FISCAL_ID = g.ID ' +
    'where g.id = ''%s'' ', [ Id ]
  );
  try
    EmpresasId := query.GetArrayIntFrom('COD_EMPRESA');

    if query.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( query, EmpresasId );

  finally
    query.Free();
  end;
end;

function GruposFiscaisRepository.ListarComAnexoVinculado: GruposFiscaisEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'select g.id, g.seqid, g.descricao, g.tipo_tributo, g.data_cadastro, g.data_alteracao, g.ativo, ' +
    'g.gerido_sistema, g.anexo, ' +
    'e.cod_empresa ' +
    'from GRUPOS_FISCAIS g ' +
    'left join GRUPOS_FISCAIS_EMP e on e.GRUPO_FISCAL_ID = g.ID ' +
    'where g.gerido_sistema = 1 and g.anexo is not null ' +
    'order by g.anexo, g.id, e.cod_empresa '
  );
  try
    Result := CreateListFromQuery( Q )
  finally
    Q.Free();
  end;
end;

function GruposFiscaisRepository.CreateListFromQuery(Q: QueryResult): GruposFiscaisEtd;

var
  EmpresasId, EVazio: TArrayInteger;
  registro: GrupoFiscalEtd;
  registroId: string;
  count: Integer;

  {$REGION 'AddEmpresa'}
  procedure AddEmpresa(QLocal: QueryResult);
  begin
    if not QLocal.FieldIsNull('COD_EMPRESA') then
    begin
      if count >= Length(EmpresasId) then
        SetLength(EmpresasId, Length(EmpresasId) * 2);

      EmpresasId[count] := QLocal.FieldAsInteger('COD_EMPRESA');
      Inc(count);
    end;
  end;
  {$ENDREGION}

begin
  Result := GruposFiscaisEtd.Create;
  SetLength(EVazio, 0);

  if Q.IsEmpty then
    Exit;

  SetLength(EmpresasId, 10);
  count := 0;
  registro := CreateItemFromQuery( Q, EVazio ); // monta o primeiro registro

  try
    while not Q.DataSet.Eof do
    begin
      if Q.FieldAreEquals('ID', registro.Id) then
        AddEmpresa( Q )              // Adiciona empresa ao array
      else
      begin
        // mudou de registro, tem de ajustar empresas e adicionar a lista
        SetLength(EmpresasId, count);                          // ajusta o array para o tamanho real
        registro.EmpresasId := EmpresasId;                     // seta empresas no registro
        Result.Add( registro );                                // adiciona a lista
        registro := nil;
        count := 0;                                            // reset
        AddEmpresa( Q );                               // Add empresa já do novo registro
        registro := CreateItemFromQuery( Q, EVazio );  // criar o novo registro
      end;
        
      Q.DataSet.Next();
    end;

    // ultimo registro
    SetLength(EmpresasId, count);
    registro.EmpresasId := EmpresasId;
    Result.Add( registro );                 
      
  except on E: Exception do
    begin
      registro.Free();
      Result.Free();
      raise;
    end;
  end;      
end;

function GruposFiscaisRepository.ListCurrentAndActives(
  const CurrentId: string): GruposFiscaisEtd;
var
  EmpresasId, EVazio: TArrayInteger;
  registro: GrupoFiscalEtd;
  registroId: string;
  qryResult: QueryResult;
  count: Integer;
  
  {$REGION 'AddEmpresa'}
  procedure AddEmpresa(Q: QueryResult);
  begin
    if not Q.FieldIsNull('COD_EMPRESA') then
    begin
      if count >= Length(EmpresasId) then
        SetLength(EmpresasId, Length(EmpresasId) * 2);

      EmpresasId[count] := Q.FieldAsInteger('COD_EMPRESA');
      Inc(count);
    end;
  end;
  {$ENDREGION}

begin
  Result := GruposFiscaisEtd.Create;
  SetLength(EVazio, 0);

  qryResult := FConnection.CreateQuery(
    'select g.id, g.seqid, g.descricao, g.tipo_tributo, g.data_cadastro, g.data_alteracao, g.ativo, ' +   
    'g.gerido_sistema, g.anexo, ' +
    'e.cod_empresa ' +
    'from GRUPOS_FISCAIS g ' +
    'left join GRUPOS_FISCAIS_EMP e on e.GRUPO_FISCAL_ID = g.ID ' +
    'where g.id = ''%s'' or g.ATIVO = 1 ' +
    'order by g.descricao, g.id, e.cod_empresa ', [ CurrentId ]
  );
  try
    if qryResult.IsEmpty then
      Exit;

    SetLength(EmpresasId, 10);
    count := 0;
    registro := CreateItemFromQuery( qryResult, EVazio ); // monta o primeiro registro

    try
      while not qryResult.DataSet.Eof do
      begin
        if qryResult.FieldAreEquals('ID', registro.Id) then
          AddEmpresa( qryResult )              // Adiciona empresa ao array
        else
        begin
          // mudou de registro, tem de ajustar empresas e adicionar a lista
          SetLength(EmpresasId, count);                          // ajusta o array para o tamanho real
          registro.EmpresasId := EmpresasId;                     // seta empresas no registro
          Result.Add( registro );                                // adiciona a lista
          registro := nil;
          count := 0;                                            // reset
          AddEmpresa( qryResult );                               // Add empresa já do novo registro
          registro := CreateItemFromQuery( qryResult, EVazio );  // criar o novo registro
        end;
        
        qryResult.DataSet.Next();
      end;

      // ultimo registro
      SetLength(EmpresasId, count);
      registro.EmpresasId := EmpresasId;
      Result.Add( registro );                 
      
    except on E: Exception do
      begin
        registro.Free();
        Result.Free();
        raise;
      end;
    end;

  finally
    qryResult.Free();
  end;
end;

function GruposFiscaisRepository.Post(Input: GrupoFiscalEtd): GrupoFiscalEtd;
var
  Params: ParametersValues;
  transacao: ITransaction;
begin
  Params := ParametersBuilder.Create(5)
      .Add( GenerateNewUUID()     )
      .Add( Input.Descricao       )
      .Add( Ord(Input.TipoTributo))
      .Add( IfThen(Input.GeridoPeloSistema, 1) )
      .Add( Input.Anexo )
      .Build();

  transacao := FConnection.BeginTransaction();
  try
    FConnection.ExecuteCommand(
      'INSERT INTO GRUPOS_FISCAIS ' +
      '(ID, SEQID, DESCRICAO, TIPO_TRIBUTO, GERIDO_SISTEMA, ANEXO)' +
      ' VALUES' +
      ' (:P_0, (coalesce((SELECT MAX(SEQID) FROM GRUPOS_FISCAIS), 0) + 1), :P_1, :P_2, :P_3, :P_4)',
      Params
    );

    if Length(Input.EmpresasId) > 0 then
      FConnection.ExecuteCommand(
        Format(
          'INSERT INTO GRUPOS_FISCAIS_EMP ' +
          '  (GRUPO_FISCAL_ID, COD_EMPRESA) ' +
          'SELECT CAST(:P_0 AS CHAR(36)), E.COD_EMPRESA FROM EMPRESA E ' +
          'WHERE E.COD_EMPRESA IN (%s) ', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
        ),
        ParametersBuilder.Create(1).Add( Params[0].AsString ).Build()
      );

    transacao.Commit();
    {$IFNDEF INTF_ON} transacao.Free(); {$ENDIF}

  except on E: Exception do
    begin
      transacao.Rollback();
      {$IFNDEF INTF_ON} transacao.Free(); {$ENDIF}
      raise;
    end;
  end;

  Result := GetById( Params[0].AsString );

end;

function GruposFiscaisRepository.Put(Input: GrupoFiscalEtd): GrupoFiscalEtd;
var
  Params: ParametersValues;
  transacao: ITransaction;
begin
  Params := ParametersBuilder.Create(3)
      .ByName('DESCRICAO', Input.Descricao )
      .ByName('ATIVO', Ord( Input.Ativo ))
      .ByName('ID', Input.Id )
      .Build();

  transacao := FConnection.BeginTransaction();

  try
    FConnection.ExecuteCommand(
      'UPDATE GRUPOS_FISCAIS ' +
      'SET DESCRICAO = :DESCRICAO, ATIVO = :ATIVO, DATA_ALTERACAO = CURRENT_TIMESTAMP ' +
      'WHERE ID = :ID',
      Params
    );

    if Length(Input.EmpresasId) = 0 then
      FConnection.ExecuteCommand(
        'DELETE FROM GRUPOS_FISCAIS_EMP ' +
        'WHERE GRUPO_FISCAL_ID = :ID ',
        ParametersBuilder.Create(1).Add( Input.Id ).Build()
      )
    else
    begin
      FConnection.ExecuteCommand(
        Format(
          'DELETE FROM GRUPOS_FISCAIS_EMP ' +
          'WHERE GRUPO_FISCAL_ID = :ID ' +
          'AND COD_EMPRESA NOT IN (%s)', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
        ),
        ParametersBuilder.Create(1).Add( Input.Id ).Build()
      );

      FConnection.ExecuteCommand(
        Format(
          'INSERT INTO GRUPOS_FISCAIS_EMP ' +
          '  (GRUPO_FISCAL_ID, COD_EMPRESA) ' +
          'SELECT CAST(:ID AS CHAR(36)), E.COD_EMPRESA FROM EMPRESA E ' +
          '  LEFT JOIN GRUPOS_FISCAIS_EMP G ON ' +
          '    G.COD_EMPRESA = E.COD_EMPRESA AND' +
          '    G.GRUPO_FISCAL_ID = :ID '+
          'WHERE E.COD_EMPRESA IN (%s) ' +
          'AND G.GRUPO_FISCAL_ID IS NULL ', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
        ),
        ParametersBuilder.Create(1).ByName('ID', Input.Id ).Build()
      );
    end;

    transacao.Commit();
    {$IFNDEF INTF_ON} transacao.Free(); {$ENDIF}

  except on E: Exception do
    begin
      transacao.Rollback();
      {$IFNDEF INTF_ON} transacao.Free(); {$ENDIF}
      raise;
    end;
  end;

  Result := GetById( Input.Id );

end;

end.
