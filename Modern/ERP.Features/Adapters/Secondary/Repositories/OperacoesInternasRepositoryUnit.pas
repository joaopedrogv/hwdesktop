unit OperacoesInternasRepositoryUnit;

interface

uses
  IOperacoesInternasRepositoryUnit,
  BaseRepositoryUnit,
  OperacaoInternaEtdUnit;

type                                                           
  {$IFDEF INTF_ON}
  OperacoesInternasRepository = class(BaseRepository, IOperacoesInternasRepository)
  {$ELSE}                                                                          
  OperacoesInternasRepository = class(IOperacoesInternasRepository)
  {$ENDIF}
  public
    function Post(Input: OperacaoInternaEtd): OperacaoInternaEtd; override;
    function Put(Input: OperacaoInternaEtd): OperacaoInternaEtd; override;
    function GetById(const Id: string): OperacaoInternaEtd; override;
    function ListCurrentAndActives(const CurrentId: string): OperacoesInternasEtd; override;
  end;

implementation

uses
  SysUtils,
  Classes,
  Contnrs,
  StatusRegistroEnumUnit,
  ParameterValueUnit, TipoComunsUnit, QueryResultUnit, ITransactionUnit,
  IDataBaseConnectionUnit, ArrayServiceUnit, StringServiceUnit;

function CreateItemFromQuery(Q: QueryResult; const E: TArrayInteger): OperacaoInternaEtd;
begin
  Result := OperacaoInternaEtd.Create(
    Q.FieldAsString('id'),
    Q.FieldAsInteger('seqid'),
    Q.FieldAsString('descricao'),
    Q.FieldAsDateTime('data_cadastro'),
    Q.FieldAsDateTime('data_alteracao'),
    StatusRegistroEnum(Q.FieldAsInteger('ativo')),
    E
  );
end;

{ OperacoesInternasRepository }

function OperacoesInternasRepository.ListCurrentAndActives(
  const CurrentId: string
): OperacoesInternasEtd;
  {$REGION 'CreateOpInterna'}

  {$ENDREGION}
var
  EmpresasId, EVazio: TArrayInteger;
  registro: OperacaoInternaEtd;
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
  Result := OperacoesInternasEtd.Create;
  SetLength(EVazio, 0);

  qryResult := FConnection.CreateQuery(
    'select o.id, o.seqid, o.descricao, o.data_cadastro, o.data_alteracao, o.ativo, ' +
    ' e.COD_EMPRESA '+
    'from OP_INTERNAS o ' +
    'left join OP_INTERNAS_EMP e on e.OP_INTERNA_ID = o.ID ' +
    'where o.id = ''%s'' or o.ATIVO = 1 ' +
    'order by o.descricao, o.id, e.cod_empresa ', [ CurrentId ]
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

function OperacoesInternasRepository.GetById(const Id: string): OperacaoInternaEtd;
var
  EmpresasId: TArrayInteger;
  query: QueryResult;
begin
  query := FConnection.CreateQuery(
    'select o.id, o.seqid, o.descricao, o.data_cadastro, o.data_alteracao, o.ativo, ' +
    ' e.COD_EMPRESA '+
    'from OP_INTERNAS o ' +
    'left join OP_INTERNAS_EMP e on e.OP_INTERNA_ID = o.ID ' +
    'where id = ''%s'' ', [ Id ]
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

function OperacoesInternasRepository.Post(Input: OperacaoInternaEtd): OperacaoInternaEtd;
var
  Params: ParametersValues;
  transacao: ITransaction;
begin
  Params := ParametersBuilder.Create(2)
      .Add( GenerateNewUUID()     )
      .Add( Input.Descricao       )
      .Build();

  transacao := FConnection.BeginTransaction();
  try
    FConnection.ExecuteCommand(
      'INSERT INTO OP_INTERNAS ' +
      '(ID, SEQID, DESCRICAO)' +
      ' VALUES' +
      ' (:P_0, (coalesce((SELECT MAX(SEQID) FROM OP_INTERNAS), 0) + 1), :P_1)',
      Params
    );

    if Length(Input.EmpresasId) > 0 then
      FConnection.ExecuteCommand(
        Format(
          'INSERT INTO OP_INTERNAS_EMP ' +
          '  (OP_INTERNA_ID, COD_EMPRESA) ' +
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

function OperacoesInternasRepository.Put(Input: OperacaoInternaEtd): OperacaoInternaEtd;
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
      'UPDATE OP_INTERNAS ' +
      'SET DESCRICAO = :DESCRICAO, ATIVO = :ATIVO, DATA_ALTERACAO = CURRENT_TIMESTAMP ' +
      'WHERE ID = :ID',
      Params
    );

    if Length(Input.EmpresasId) = 0 then
      FConnection.ExecuteCommand(
        'DELETE FROM OP_INTERNAS_EMP ' +
        'WHERE OP_INTERNA_ID = :ID ',
        ParametersBuilder.Create(1).Add( Input.Id ).Build()
      )
    else
    begin
      FConnection.ExecuteCommand(
        Format(
          'DELETE FROM OP_INTERNAS_EMP ' +
          'WHERE OP_INTERNA_ID = :ID ' +
          'AND COD_EMPRESA NOT IN (%s)', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
        ),
        ParametersBuilder.Create(1).Add( Input.Id ).Build()
      );

      FConnection.ExecuteCommand(
        Format(
          'INSERT INTO OP_INTERNAS_EMP ' +
          '  (OP_INTERNA_ID, COD_EMPRESA) ' +
          'SELECT CAST(:ID AS CHAR(36)), E.COD_EMPRESA FROM EMPRESA E ' +
          '  LEFT JOIN OP_INTERNAS_EMP O ON ' +
          '    O.COD_EMPRESA = E.COD_EMPRESA AND' +
          '    O.OP_INTERNA_ID = :ID ' +
          'WHERE E.COD_EMPRESA IN (%s) ' +
          'AND O.OP_INTERNA_ID IS NULL ', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
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
