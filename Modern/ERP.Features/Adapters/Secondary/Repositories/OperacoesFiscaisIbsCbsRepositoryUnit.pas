unit OperacoesFiscaisIbsCbsRepositoryUnit;

interface

uses
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  BaseRepositoryUnit,
  TipoComunsUnit,
  OperacaoFiscalIbsCbsEtdUnit;

type                                                             
  {$IFDEF INTF_ON}
  OperacoesFiscaisIbsCbsRepository = class(BaseRepository, IOperacoesFiscaisIbsCbsRepository)
  {$ELSE}
  OperacoesFiscaisIbsCbsRepository = class(IOperacoesFiscaisIbsCbsRepository)
  {$ENDIF}
  public
    function Post(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd; override;
    function Put(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd; override;
    function GetById(const Id: string): OperacaoFiscalIbsCbsEtd; override;
    function GetByOpInternaGrupoFiscal(
      const OpInternaId, GrupoFiscalId: string;
      EmpresaId: Integer;
      Data: TDate
    ): OperacaoFiscalIbsCbsEtdList; override;
  end;

implementation

uses
  SysUtils,
  StatusRegistroEnumUnit,
  ParameterValueUnit, QueryResultUnit, ITransactionUnit,
  IDataBaseConnectionUnit,
  StringServiceUnit,
  Classes, Contnrs, ArrayServiceUnit;

function CreateItemFromQuery(Q: QueryResult; const E: TArrayInteger): OperacaoFiscalIbsCbsEtd;
begin
  Result := OperacaoFiscalIbsCbsEtd.Create(
    Q.FieldAsString('ID'),
    Q.FieldAsString('OP_INTERNA_ID'),
    Q.FieldAsString('REGRA_FISCAL_ID'),
    Q.FieldAsStringNullable('GRUPO_FISCAL_ID'),
    Q.FieldAsDate('DATA_INI_VIGENCIA'),
    Q.FieldAsDateNullable('DATA_FIM_VIGENCIA'),
    Q.FieldAsDateTime('DATA_CADASTRO'),
    Q.FieldAsDateTime('DATA_ALTERACAO'),
    StatusRegistroEnum( Q.FieldAsInteger('ATIVO') ),
    E
  );
end;

{ OperacoesFiscaisIbsCbsRepository }

function OperacoesFiscaisIbsCbsRepository.GetById(const Id: string): OperacaoFiscalIbsCbsEtd;
var
  EmpresasId: TArrayInteger;
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT o.ID, o.OP_INTERNA_ID, o.REGRA_FISCAL_ID, o.GRUPO_FISCAL_ID, ' +
    ' o.DATA_INI_VIGENCIA, o.DATA_FIM_VIGENCIA, o.DATA_CADASTRO, o.DATA_ALTERACAO, o.ATIVO, ' +
    ' e.COD_EMPRESA ' +
    ' FROM OP_FISCAIS_IBSCBS o ' +
    ' LEFT JOIN OP_FISCAIS_IBSCBS_EMP e on E.OP_FISCAIS_ID = o.ID ' +
    ' where o.ID = ''%s'' ', [ Id ]
  );
  try

    EmpresasId := Q.GetArrayIntFrom('COD_EMPRESA');

    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q, EmpresasId );

  finally
    Q.Free();
  end;
end;

function OperacoesFiscaisIbsCbsRepository.GetByOpInternaGrupoFiscal(
  const OpInternaId, GrupoFiscalId: string; EmpresaId: Integer;
  Data: TDate): OperacaoFiscalIbsCbsEtdList;
var
  Q: QueryResult;
begin

  // aqui ainda precisa implementar a ordem
  // precisa implementar tambem obter o array das condicoes

  Result := OperacaoFiscalIbsCbsEtdList.Create();

  if Trim(OpInternaId) = '' then
    Exit;

  Q := FConnection.CreateQuery( Format(
    'SELECT o.ID, o.OP_INTERNA_ID, o.REGRA_FISCAL_ID, o.GRUPO_FISCAL_ID, ' +
    ' o.DATA_INI_VIGENCIA, o.DATA_FIM_VIGENCIA, o.DATA_CADASTRO, o.DATA_ALTERACAO, o.ATIVO, ' +
    ' e.COD_EMPRESA ' +
    ' FROM OP_FISCAIS_IBSCBS o ' +
    ' INNER JOIN OP_FISCAIS_IBSCBS_EMP e on E.OP_FISCAIS_ID = o.ID ' +
    ' where o.OP_INTERNA_ID = %s ' +
    ' and (o.GRUPO_FISCAL_ID = :GRUPO_FISCAL_ID or o.GRUPO_FISCAL_ID is null) ' +
    ' and e.COD_EMPRESA = %d ' +
    ' and :DATA BETWEEN o.DATA_INI_VIGENCIA and COALESCE(o.DATA_FIM_VIGENCIA, :DATA)' +
    ' order by o.GRUPO_FISCAL_ID desc ',
    [ QuotedStr(OpInternaId), EmpresaId ]),
    ParametersBuilder.Create(2)
      .ByName('DATA', Data)
      .ByName('GRUPO_FISCAL_ID', Trim(GrupoFiscalId))
      .Build()
  );
  try
    if Q.IsEmpty then
      Exit;

    while not Q.Eof do
    begin
      Result.Add( CreateItemFromQuery( Q, ArrayService.MakeArrayInt(EmpresaId)));

      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function OperacoesFiscaisIbsCbsRepository.Post(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
var
  Params: ParametersValues;
  transacao: ITransaction;
  registroId: string;
begin
  registroId := GenerateNewUUID();

  Params := ParametersBuilder.Create(13)
      .ByName('ID', registroId )
      .ByName('OP_INTERNA_ID', Input.OperacaoInternaId )
      .ByName('REGRA_FISCAL_ID', Input.RegraFiscalId )
      .ByName('GRUPO_FISCAL_ID', Input.GrupoFiscalId )
      .ByName('DATA_INI_VIGENCIA', Input.InicioVigencia )
      .ByName('DATA_FIM_VIGENCIA', Input.FimVigencia )
      .Build();

  transacao := FConnection.BeginTransaction();
  try
    FConnection.ExecuteCommand(
      'INSERT INTO OP_FISCAIS_IBSCBS ' +
      ' (ID, OP_INTERNA_ID, REGRA_FISCAL_ID, GRUPO_FISCAL_ID, ' +
      '    DATA_INI_VIGENCIA, DATA_FIM_VIGENCIA) ' +
      ' VALUES ' +
      '(:ID, :OP_INTERNA_ID, :REGRA_FISCAL_ID, :GRUPO_FISCAL_ID, ' +
      '    :DATA_INI_VIGENCIA, :DATA_FIM_VIGENCIA)',
      Params
    );

    if Length(Input.EmpresasId) > 0 then
      FConnection.ExecuteCommand(
        Format(
          'INSERT INTO OP_FISCAIS_IBSCBS_EMP ' +
          '  (OP_FISCAIS_ID, COD_EMPRESA) ' +
          'SELECT CAST(:P_0 AS CHAR(36)), E.COD_EMPRESA FROM EMPRESA E ' +
          'WHERE E.COD_EMPRESA IN (%s) ', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
        ),
        ParametersBuilder.Create(1).Add( registroId ).Build()
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

  Result := GetById( registroId );

end;

function OperacoesFiscaisIbsCbsRepository.Put(Input: OperacaoFiscalIbsCbsEtd): OperacaoFiscalIbsCbsEtd;
var
  Params: ParametersValues;
  transacao: ITransaction;
begin
  Params := ParametersBuilder.Create(13)
      .ByName('ID', Input.Id )
      .ByName('OP_INTERNA_ID', Input.OperacaoInternaId )
      .ByName('REGRA_FISCAL_ID', Input.RegraFiscalId )
      .ByName('GRUPO_FISCAL_ID', Input.GrupoFiscalId )
      .ByName('DATA_INI_VIGENCIA', Input.InicioVigencia )
      .ByName('DATA_FIM_VIGENCIA', Input.FimVigencia )
      .ByName('ATIVO', Ord(Input.Ativo) )
      .Build();

  transacao := FConnection.BeginTransaction();

  try
    FConnection.ExecuteCommand(
      'UPDATE OP_FISCAIS_IBSCBS ' +
      ' SET OP_INTERNA_ID = :OP_INTERNA_ID, REGRA_FISCAL_ID = :REGRA_FISCAL_ID, ' +
      ' GRUPO_FISCAL_ID = :GRUPO_FISCAL_ID, ' +
      ' DATA_INI_VIGENCIA = :DATA_INI_VIGENCIA, DATA_FIM_VIGENCIA = :DATA_FIM_VIGENCIA, ' +
      ' ATIVO = :ATIVO, DATA_ALTERACAO = CURRENT_TIMESTAMP ' +
      'WHERE ID = :ID',
      Params
    );

    if Length(Input.EmpresasId) = 0 then
      FConnection.ExecuteCommand(
        'DELETE FROM OP_FISCAIS_IBSCBS_EMP ' +
        'WHERE OP_FISCAIS_ID = :ID ',
        ParametersBuilder.Create(1).Add( Input.Id ).Build()
      )
    else
    begin
      FConnection.ExecuteCommand(
        Format(
          'DELETE FROM OP_FISCAIS_IBSCBS_EMP ' +
          'WHERE OP_FISCAIS_ID = :ID ' +
          'AND COD_EMPRESA NOT IN (%s)', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
        ),
        ParametersBuilder.Create(1).Add( Input.Id ).Build()
      );
      FConnection.ExecuteCommand(
        Format(
          'INSERT INTO OP_FISCAIS_IBSCBS_EMP ' +
          '  (OP_FISCAIS_ID, COD_EMPRESA) ' +
          'SELECT CAST(:ID AS CHAR(36)), E.COD_EMPRESA FROM EMPRESA E ' +
          '  LEFT JOIN OP_FISCAIS_IBSCBS_EMP R ON ' +
          '    R.COD_EMPRESA = E.COD_EMPRESA AND' +
          '    R.OP_FISCAIS_ID = :ID ' +
          'WHERE E.COD_EMPRESA IN (%s) ' +
          'AND R.OP_FISCAIS_ID IS NULL ', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
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
