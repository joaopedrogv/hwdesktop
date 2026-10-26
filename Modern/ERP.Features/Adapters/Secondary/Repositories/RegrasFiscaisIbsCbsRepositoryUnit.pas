unit RegrasFiscaisIbsCbsRepositoryUnit;

interface

uses
  IRegrasFiscaisIbsCbsRepositoryUnit,
  BaseRepositoryUnit,
  RegraFiscalIbsCbsEtdUnit;

type                                                                       
  {$IFDEF INTF_ON}
  RegrasFiscaisIbsCbsRepository = class(BaseRepository, IRegrasFiscaisIbsCbsRepository)
  {$ELSE}                                                                              
  RegrasFiscaisIbsCbsRepository = class(IRegrasFiscaisIbsCbsRepository)
  {$ENDIF}
  public
    function Post(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd; override;
    function Put(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd; override;
    function GetById(const Id: string): RegraFiscalIbsCbsEtd; override;
    function ListCurrentAndActives(const CurrentId: string): RegrasFiscaisIbsCbsEtd; override;
  end;

implementation

uses
  SysUtils,
  StatusRegistroEnumUnit,
  ParameterValueUnit, TipoComunsUnit, QueryResultUnit, ITransactionUnit,
  IDataBaseConnectionUnit, ArrayServiceUnit, StringServiceUnit,
  Classes, Contnrs;                       

function CreateItemFromQuery(Q: QueryResult; const E: TArrayInteger): RegraFiscalIbsCbsEtd;
begin
  Result := RegraFiscalIbsCbsEtd.Create(
    Q.FieldAsString('id'),
    Q.FieldAsString('descricao'),
    Q.FieldAsString('cClassTrib'),
    Q.FieldAsCurrencyNullable('pDifCbs'),
    Q.FieldAsCurrencyNullable('pDifIbsUf'),
    Q.FieldAsCurrencyNullable('pDifIbsMun'),
    Q.FieldAsIntNullable('tpOperGov'),
    Q.FieldAsDate('data_ini_vigencia'),
    Q.FieldAsDateNullable('data_fim_vigencia'),
    Q.FieldAsDateTime('data_cadastro'),
    Q.FieldAsDateTime('data_alteracao'),
    StatusRegistroEnum(Q.FieldAsInteger('ativo')),
    Q.FieldAsStringNullable('rf_trib_regular'),
    Q.FieldAsStringNullable('cclasstribregular'),
    E
  );
end;

{ RegrasFiscaisIbsCbsRepository }

function RegrasFiscaisIbsCbsRepository.GetById(const Id: string): RegraFiscalIbsCbsEtd;
var
  EmpresasId: TArrayInteger;
  query: QueryResult;
begin
  query := FConnection.CreateQuery(
    'select r.ID, r.DESCRICAO, r.CCLASSTRIB, ' +
    'r.PDIFCBS, r.PDIFIBSUF, r.PDIFIBSMUN, r.TPOPERGOV, r.DATA_INI_VIGENCIA, ' +
    'r.DATA_FIM_VIGENCIA, r.DATA_CADASTRO, r.DATA_ALTERACAO, r.ATIVO, r.RF_TRIB_REGULAR, ' +
    'rr.CCLASSTRIB CCLASSTRIBREGULAR, ' +
    'e.COD_EMPRESA '+
    //'e.ID EMP_ID, e.REGRA_FISCAL_ID EMP_REGRA_FISCAL_ID, e.COD_EMPRESA EMP_COD_EMPRESA, ' +
    //'e.DATA_INI_VIGENCIA EMP_DATA_INI_VIGENCIA, e.DATA_FIM_VIGENCIA EMP_DATA_FIM_VIGENCIA, ' +
    //'e.DATA_CADASTRO EMP_DATA_CADASTRO, e.DATA_ALTERACAO EMP_DATA_ALTERACAO ' +
    'from REGRAS_FISCAIS_IBSCBS r ' +
    'left join REGRAS_FISCAIS_IBSCBS rr on rr.ID = r.RF_TRIB_REGULAR ' +
    'left join REGRAS_FISCAIS_IBSCBS_EMP e on e.REGRA_FISCAL_ID = r.ID ' +
    'where r.id = ''%s'' ', [ Id ]
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

function RegrasFiscaisIbsCbsRepository.ListCurrentAndActives(
  const CurrentId: string): RegrasFiscaisIbsCbsEtd;
var
  EmpresasId, EVazio: TArrayInteger;
  registro: RegraFiscalIbsCbsEtd;
  query: QueryResult;
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
  Result := RegrasFiscaisIbsCbsEtd.Create;
  SetLength(EVazio, 0);

  query := FConnection.CreateQuery(
    'select r.ID, r.DESCRICAO, r.CCLASSTRIB, ' +
    'r.PDIFCBS, r.PDIFIBSUF, r.PDIFIBSMUN, r.TPOPERGOV, r.DATA_INI_VIGENCIA, ' +
    'r.DATA_FIM_VIGENCIA, r.DATA_CADASTRO, r.DATA_ALTERACAO, r.ATIVO, r.RF_TRIB_REGULAR, ' +   
    'rr.CCLASSTRIB CCLASSTRIBREGULAR, ' +
    'e.COD_EMPRESA ' +
    'from REGRAS_FISCAIS_IBSCBS r ' +                                   
    'left join REGRAS_FISCAIS_IBSCBS rr on rr.ID = r.RF_TRIB_REGULAR ' +
    'left join REGRAS_FISCAIS_IBSCBS_EMP e on e.REGRA_FISCAL_ID = r.ID ' +
    'where r.id = ''%s'' or r.ATIVO = 1 ' +
    'order by r.descricao, r.id, e.cod_empresa ', [ CurrentId ]
  );
  try
    if query.IsEmpty then
      Exit;

    SetLength(EmpresasId, 10);
    count := 0;
    registro := CreateItemFromQuery( query, EVazio ); // monta o primeiro registro

    try
      while not query.DataSet.Eof do
      begin
        if query.FieldAreEquals('ID', registro.Id) then
          AddEmpresa( query )              // Adiciona empresa ao array
        else
        begin
          // mudou de registro, tem de ajustar empresas e adicionar a lista
          SetLength(EmpresasId, count);                          // ajusta o array para o tamanho real
          registro.EmpresasId := EmpresasId;                     // seta empresas no registro
          Result.Add( registro );                                // adiciona a lista
          registro := nil;
          count := 0;                                            // reset
          AddEmpresa( query );                               // Add empresa já do novo registro
          registro := CreateItemFromQuery( query, EVazio );  // criar o novo registro
        end;
        
        query.DataSet.Next();
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
    query.Free();
  end;
end;

function RegrasFiscaisIbsCbsRepository.Post(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd;
var
  Params: ParametersValues;
  transacao: ITransaction;
  registroId: string;
begin
  registroId := GenerateNewUUID();

  Params := ParametersBuilder.Create(14)
      .ByName('ID', registroId )
      .ByName('DESCRICAO', Input.Descricao )
      .ByName('CCLASSTRIB', Input.CClassTrib )
      .ByName('PDIFCBS', Input.PDifCbs )
      .ByName('PDIFIBSUF', Input.PDifIbsUF )
      .ByName('PDIFIBSMUN', Input.PDifIbsMun )
      .ByName('TPOPERGOV', Input.TpOperGov )
      .ByName('DATA_INI_VIGENCIA', Input.InicioVigencia )
      .ByName('DATA_FIM_VIGENCIA', Input.FimVigencia )
      .ByName('ATIVO', Ord(Input.Ativo) )
      .ByName('RF_TRIB_REGULAR', Input.RegraFiscalTribRegularId )
      .Build();

  transacao := FConnection.BeginTransaction();
  try
    FConnection.ExecuteCommand(
      'INSERT INTO REGRAS_FISCAIS_IBSCBS ' +
      '(ID, DESCRICAO, CCLASSTRIB, PDIFCBS, ' +
      'PDIFIBSUF, PDIFIBSMUN, TPOPERGOV, DATA_INI_VIGENCIA, DATA_FIM_VIGENCIA, ATIVO, RF_TRIB_REGULAR)' +
      ' VALUES ' +
      '(:ID, :DESCRICAO, :CCLASSTRIB, :PDIFCBS, ' +
      ':PDIFIBSUF, :PDIFIBSMUN, :TPOPERGOV, :DATA_INI_VIGENCIA, :DATA_FIM_VIGENCIA, :ATIVO, :RF_TRIB_REGULAR)',
      Params
    );
    
    if Length(Input.EmpresasId) > 0 then
      FConnection.ExecuteCommand(
        Format(
          'INSERT INTO REGRAS_FISCAIS_IBSCBS_EMP ' +
          '  (REGRA_FISCAL_ID, COD_EMPRESA) ' +
          'SELECT CAST(:P_0 AS CHAR(36)), E.COD_EMPRESA FROM EMPRESA E ' +
          'WHERE E.COD_EMPRESA IN (%s) ', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
        ),
        ParametersBuilder.Create(1).Add( registroId ).Build()
      );

    {for I := 0 to Input.Empresas.Count - 1 do
    begin
      empresa := RegraFiscalIbsCbsEmpEtd(Input.Empresas.Items[I]);

      FConnection.ExecuteCommand(
        'INSERT INTO REGRAS_FISCAIS_IBSCBS_EMP ' +
        '(ID, REGRA_FISCAL_ID, COD_EMPRESA, DATA_INI_VIGENCIA, DATA_FIM_VIGENCIA) ' +
        'VALUES(:P_0, :P_1, :P_2, :P_3, :P_4) ',
        ParametersBuilder.Create(5)
          .Add( GenerateNewUUID() )
          .Add( regraId )
          .Add( empresa.EmpresaId )
          .Add( empresa.InicioVigencia )
          .Add( empresa.FimVigencia )
          .Build(  )
      );
    end;}

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

function RegrasFiscaisIbsCbsRepository.Put(Input: RegraFiscalIbsCbsEtd): RegraFiscalIbsCbsEtd;
var
  Params: ParametersValues;
  transacao: ITransaction;
begin
  Params := ParametersBuilder.Create(13)
      .ByName('ID', Input.Id )
      .ByName('DESCRICAO', Input.Descricao )
      .ByName('CCLASSTRIB', Input.CClassTrib )
      .ByName('PDIFCBS', Input.PDifCbs  )
      .ByName('PDIFIBSUF', Input.PDifIbsUF )
      .ByName('PDIFIBSMUN', Input.PDifIbsMun )
      .ByName('TPOPERGOV', Input.TpOperGov )
      .ByName('DATA_INI_VIGENCIA', Input.InicioVigencia )
      .ByName('DATA_FIM_VIGENCIA', Input.FimVigencia )
      .ByName('ATIVO', Ord(Input.Ativo) )             
      .ByName('RF_TRIB_REGULAR', Input.RegraFiscalTribRegularId )
      .Build();

  transacao := FConnection.BeginTransaction();

  try
    FConnection.ExecuteCommand(
      'UPDATE REGRAS_FISCAIS_IBSCBS ' +
      ' SET DESCRICAO = :DESCRICAO, CCLASSTRIB = :CCLASSTRIB, ' +
      ' PDIFCBS = :PDIFCBS, PDIFIBSUF = :PDIFIBSUF, PDIFIBSMUN = :PDIFIBSMUN, TPOPERGOV = :TPOPERGOV, ' +
      ' DATA_INI_VIGENCIA = :DATA_INI_VIGENCIA, DATA_FIM_VIGENCIA = :DATA_FIM_VIGENCIA, ' +
      ' ATIVO = :ATIVO, RF_TRIB_REGULAR = :RF_TRIB_REGULAR, DATA_ALTERACAO = CURRENT_TIMESTAMP ' +
      'WHERE ID = :ID',
      Params
    );

    if Length(Input.EmpresasId) = 0 then
      FConnection.ExecuteCommand(
        'DELETE FROM REGRAS_FISCAIS_IBSCBS_EMP ' +
        'WHERE REGRA_FISCAL_ID = :ID ',
        ParametersBuilder.Create(1).Add( Input.Id ).Build()
      )
    else
    begin
      {
      SetLength(EmpresasId, Input.Empresas.Count);
      for I := 0 to Input.Empresas.Count - 1 do
        EmpresasId[I] := RegraFiscalIbsCbsEmpEtd(Input.Empresas.Items[I]).EmpresaId;
      }

      FConnection.ExecuteCommand(
        Format(
          'DELETE FROM REGRAS_FISCAIS_IBSCBS_EMP ' +
          'WHERE REGRA_FISCAL_ID = :ID ' +
          'AND COD_EMPRESA NOT IN (%s)', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
        ),
        ParametersBuilder.Create(1).Add( Input.Id ).Build()
      );
      FConnection.ExecuteCommand(
        Format(
          'INSERT INTO REGRAS_FISCAIS_IBSCBS_EMP ' +
          '  (REGRA_FISCAL_ID, COD_EMPRESA) ' +
          'SELECT CAST(:ID AS CHAR(36)), E.COD_EMPRESA FROM EMPRESA E ' +
          '  LEFT JOIN REGRAS_FISCAIS_IBSCBS_EMP R ON ' +
          '    R.COD_EMPRESA = E.COD_EMPRESA AND' +
          '    R.REGRA_FISCAL_ID = :ID ' +
          'WHERE E.COD_EMPRESA IN (%s) ' +
          'AND R.REGRA_FISCAL_ID IS NULL ', [ StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId)) ]
        ),
        ParametersBuilder.Create(1).ByName('ID', Input.Id ).Build()
      );
      {
      for I := 0 to Input.Empresas.Count - 1 do
      begin
        empresa := RegraFiscalIbsCbsEmpEtd(Input.Empresas.Items[I]);

        FConnection.ExecuteCommand(
          'MERGE INTO REGRAS_FISCAIS_IBSCBS_EMP E ' + 
          'USING ( ' +
          '  SELECT COALESCE( S.REGRA_FISCAL_ID, :REGRA_FISCAL_ID) REGRA_FISCAL_ID, ' +
          '         COALESCE( S.COD_EMPRESA, :COD_EMPRESA) COD_EMPRESA ' +
          '  FROM RDB$DATABASE ' + 
          '  LEFT JOIN REGRAS_FISCAIS_IBSCBS_EMP S ON S.REGRA_FISCAL_ID = :REGRA_FISCAL_ID ' + 
          '  AND S.COD_EMPRESA = :COD_EMPRESA ' + 
          ') AS S ' + 
          'ON ( S.REGRA_FISCAL_ID = E.REGRA_FISCAL_ID AND S.COD_EMPRESA = E.COD_EMPRESA ) ' + 
          'WHEN MATCHED THEN ' + 
          '  UPDATE SET DATA_INI_VIGENCIA = :DATA_INI_VIGENCIA, ' + 
          '    DATA_FIM_VIGENCIA = :DATA_FIM_VIGENCIA, ' + 
          '    DATA_ALTERACAO = CURRENT_TIMESTAMP ' + 
          'WHEN NOT MATCHED THEN ' + 
          '  INSERT (ID, REGRA_FISCAL_ID, COD_EMPRESA, DATA_INI_VIGENCIA, DATA_FIM_VIGENCIA) ' +
          '  VALUES (:ID, :REGRA_FISCAL_ID, :COD_EMPRESA, :DATA_INI_VIGENCIA, :DATA_FIM_VIGENCIA) ',
          ParametersBuilder.Create(5)
            .ByName('ID', GenerateNewUUID() )
            .ByName('REGRA_FISCAL_ID', empresa.RegraFiscalId )
            .ByName('COD_EMPRESA', empresa.EmpresaId )
            .ByName('DATA_INI_VIGENCIA', empresa.InicioVigencia )
            .ByName('DATA_FIM_VIGENCIA', empresa.FimVigencia )
            .Build()
        );
      end;
      }
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
