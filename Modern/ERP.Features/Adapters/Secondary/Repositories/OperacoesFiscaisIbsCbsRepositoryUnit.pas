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
  Classes, Contnrs, ArrayServiceUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit;

type
  CondicaoPersistida = record
    OpFiscaisId: string;
    Atributo: Integer;
    Valor: Integer;
  end;

  CondicaoPersistidaArray = array of CondicaoPersistida;

function MontarFiltroIn(const AIds: TArrayString;
  const AParams: IParametersBuilder): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to High(AIds) do
  begin
    if I > 0 then
      Result := Result + ', ';
    // Nome de parametro gerado pelo indice; os valores continuam parametrizados.
    Result := Result + ':P' + IntToStr(I);
    AParams.ByName('P' + IntToStr(I), AIds[I]);
  end;
end;

function LoadCondicoesPersistidas(
  const AConnection: IDataBaseConnection;
  const AIds: TArrayString
): CondicaoPersistidaArray;
var
  Q: QueryResult;
  Params: IParametersBuilder;
  Filtro: string;
  Count: Integer;
begin
  SetLength(Result, 0);

  if Length(AIds) = 0 then
    Exit;

  Params := ParametersBuilder.Create(Length(AIds));
  Filtro := MontarFiltroIn(AIds, Params);

  Q := AConnection.CreateQuery(
    'SELECT OP_FISCAIS_ID, ATRIBUTO, VALOR ' +
    ' FROM OP_FISCAIS_IBSCBS_COND ' +
    ' WHERE OP_FISCAIS_ID IN (' + Filtro + ') ' +
    ' ORDER BY OP_FISCAIS_ID, ATRIBUTO, VALOR',
    Params.Build()
  );
  try
    Count := 0;
    while not Q.Eof do
    begin
      SetLength(Result, Count + 1);
      Result[Count].OpFiscaisId := Q.FieldAsString('OP_FISCAIS_ID');
      Result[Count].Atributo := Q.FieldAsInteger('ATRIBUTO');
      // Valores fora do dominio sao preservados: o resolvedor deve sinalizar
      // configuracao invalida em vez de descartar silenciosamente.
      Result[Count].Valor := Q.FieldAsInteger('VALOR');
      Inc(Count);
      Q.Next();
    end;
  finally
    Q.Free();
  end;
end;

function CondicoesDoVinculo(
  const ARows: CondicaoPersistidaArray;
  const AOpFiscaisId: string
): OperacaoFiscalIbsCbsCondicaoEtdArray;
var
  I, Count, AtributoAtual: Integer;
  Valores: TArrayInteger;
  TemAtributo: Boolean;
begin
  SetLength(Result, 0);
  SetLength(Valores, 0);
  Count := 0;
  AtributoAtual := 0;
  TemAtributo := False;

  for I := 0 to High(ARows) do
  begin
    if ARows[I].OpFiscaisId <> AOpFiscaisId then
      Continue;

    if TemAtributo and (ARows[I].Atributo <> AtributoAtual) then
    begin
      SetLength(Result, Count + 1);
      // Codigo externo decodificado por funcao canonica; atributo nao
      // suportado vira ocaInvalida e e reportado na validacao.
      Result[Count] := OperacaoFiscalIbsCbsCondicaoEtd.Create(
        OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(AtributoAtual),
        Valores
      );
      Inc(Count);
      SetLength(Valores, 0);
    end;

    AtributoAtual := ARows[I].Atributo;
    TemAtributo := True;
    SetLength(Valores, Length(Valores) + 1);
    Valores[High(Valores)] := ARows[I].Valor;
  end;

  if TemAtributo then
  begin
    SetLength(Result, Count + 1);
    Result[Count] := OperacaoFiscalIbsCbsCondicaoEtd.Create(
      OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(AtributoAtual),
      Valores
    );
  end;
end;

procedure InserirCondicoes(
  const AConnection: IDataBaseConnection;
  const AOpFiscaisId: string;
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray
);
var
  I, J: Integer;
begin
  for I := 0 to High(ACondicoes) do
    for J := 0 to High(ACondicoes[I].Valores) do
      AConnection.ExecuteCommand(
        'INSERT INTO OP_FISCAIS_IBSCBS_COND (OP_FISCAIS_ID, ATRIBUTO, VALOR) ' +
        ' VALUES (:OP_FISCAIS_ID, :ATRIBUTO, :VALOR)',
        ParametersBuilder.Create(3)
          .ByName('OP_FISCAIS_ID', AOpFiscaisId)
          // Codigo externo canonico; ocaInvalida resulta em 0 e nao passa no
          // CHECK do banco (defesa em profundidade apos a validacao).
          .ByName('ATRIBUTO', OperacaoFiscalIbsCbsCondicoes.AtributoParaCodigo(
            ACondicoes[I].Atributo))
          .ByName('VALOR', ACondicoes[I].Valores[J])
          .Build()
      );
end;

procedure SubstituirCondicoes(
  const AConnection: IDataBaseConnection;
  const AOpFiscaisId: string;
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray
);
begin
  // O conjunto confirmado e a propria condicao; o replace e idempotente.
  AConnection.ExecuteCommand(
    'DELETE FROM OP_FISCAIS_IBSCBS_COND ' +
    ' WHERE OP_FISCAIS_ID = :OP_FISCAIS_ID',
    ParametersBuilder.Create(1).ByName('OP_FISCAIS_ID', AOpFiscaisId).Build()
  );

  InserirCondicoes(AConnection, AOpFiscaisId, ACondicoes);
end;

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
  Ids: TArrayString;
  Item: OperacaoFiscalIbsCbsEtd;
  ItemId: string;
begin
  Result := nil;
  Item := nil;
  ItemId := '';

  Q := FConnection.CreateQuery(
    'SELECT o.ID, o.OP_INTERNA_ID, o.REGRA_FISCAL_ID, o.GRUPO_FISCAL_ID, ' +
    ' o.DATA_INI_VIGENCIA, o.DATA_FIM_VIGENCIA, o.DATA_CADASTRO, o.DATA_ALTERACAO, o.ATIVO, ' +
    ' e.COD_EMPRESA ' +
    ' FROM OP_FISCAIS_IBSCBS o ' +
    ' LEFT JOIN OP_FISCAIS_IBSCBS_EMP e on E.OP_FISCAIS_ID = o.ID ' +
    ' where o.ID = :ID ',
    ParametersBuilder.Create(1).ByName('ID', Id).Build()
  );
  try

    EmpresasId := Q.GetArrayIntFrom('COD_EMPRESA');

    if not Q.IsEmpty then
    begin
      Item := CreateItemFromQuery( Q, EmpresasId );
      ItemId := Item.Id;
    end;

  finally
    Q.Free();
  end;

  if Item = nil then
    Exit;

  // O item permanece sob posse local ate o agregado completo (vinculo +
  // condicoes) carregar; falha na carga das condicoes libera o item e
  // repropaga, sem transferir objeto parcial ao chamador.
  try
    // Carga separada: a projecao principal nao multiplica linhas por valor.
    SetLength(Ids, 1);
    Ids[0] := ItemId;
    Item.Condicoes := CondicoesDoVinculo(
      LoadCondicoesPersistidas(FConnection, Ids), ItemId);
    Result := Item;
  except
    Item.Free;
    raise;
  end;
end;

function OperacoesFiscaisIbsCbsRepository.GetByOpInternaGrupoFiscal(
  const OpInternaId, GrupoFiscalId: string; EmpresaId: Integer;
  Data: TDate): OperacaoFiscalIbsCbsEtdList;
var
  Q: QueryResult;
  Ids: TArrayString;
  Lista: OperacaoFiscalIbsCbsEtdList;
  CondicoesPersistidas: CondicaoPersistidaArray;
  I: Integer;
begin
  Result := nil;
  Lista := OperacaoFiscalIbsCbsEtdList.Create();

  // A lista e seus itens permanecem sob posse local ate o agregado completo
  // carregar; qualquer falha libera a lista e repropaga, sem entregar ao
  // chamador uma colecao parcialmente carregada.
  try
    if Trim(OpInternaId) <> '' then
    begin
      // A precedencia grupo/default e calculada pelo resolvedor; a ordem
      // devolvida pela consulta nao tem significado.
      Q := FConnection.CreateQuery(
        'SELECT o.ID, o.OP_INTERNA_ID, o.REGRA_FISCAL_ID, o.GRUPO_FISCAL_ID, ' +
        ' o.DATA_INI_VIGENCIA, o.DATA_FIM_VIGENCIA, o.DATA_CADASTRO, o.DATA_ALTERACAO, o.ATIVO, ' +
        ' e.COD_EMPRESA ' +
        ' FROM OP_FISCAIS_IBSCBS o ' +
        ' INNER JOIN OP_FISCAIS_IBSCBS_EMP e on E.OP_FISCAIS_ID = o.ID ' +
        ' where o.OP_INTERNA_ID = :OP_INTERNA_ID ' +
        ' and (o.GRUPO_FISCAL_ID = :GRUPO_FISCAL_ID or o.GRUPO_FISCAL_ID is null) ' +
        ' and e.COD_EMPRESA = :COD_EMPRESA ' +
        ' and :DATA BETWEEN o.DATA_INI_VIGENCIA and COALESCE(o.DATA_FIM_VIGENCIA, :DATA)',
        ParametersBuilder.Create(4)
          .ByName('OP_INTERNA_ID', Trim(OpInternaId))
          .ByName('GRUPO_FISCAL_ID', Trim(GrupoFiscalId))
          .ByName('COD_EMPRESA', EmpresaId)
          .ByName('DATA', Data)
          .Build()
      );
      try
        if not Q.IsEmpty then
        begin
          SetLength(Ids, 0);

          while not Q.Eof do
          begin
            Lista.Add( CreateItemFromQuery( Q, ArrayService.MakeArrayInt(EmpresaId)));

            SetLength(Ids, Length(Ids) + 1);
            Ids[High(Ids)] := OperacaoFiscalIbsCbsEtd(Lista[Lista.Count - 1]).Id;

            Q.Next();
          end;

          CondicoesPersistidas := LoadCondicoesPersistidas(FConnection, Ids);

          for I := 0 to Lista.Count - 1 do
            OperacaoFiscalIbsCbsEtd(Lista[I]).Condicoes := CondicoesDoVinculo(
              CondicoesPersistidas, OperacaoFiscalIbsCbsEtd(Lista[I]).Id);
        end;

      finally
        Q.Free();
      end;
    end;

    Result := Lista;

  except
    Lista.Free;
    raise;
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

    InserirCondicoes(FConnection, registroId, Input.Condicoes);

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

    SubstituirCondicoes(FConnection, Input.Id, Input.Condicoes);

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
