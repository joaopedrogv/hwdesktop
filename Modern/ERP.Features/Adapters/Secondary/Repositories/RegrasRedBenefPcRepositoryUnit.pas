unit RegrasRedBenefPcRepositoryUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  IRegrasRedBenefPcRepositoryUnit, CacheableRepositoryUnit, RegraRedBenefPcEtdUnit, IDataBaseConnectionUnit,
  QueryResultUnit, ArrayServiceUnit, StringServiceUnit, StatusRegistroEnumUnit, DateAndTimeNullableUnit, TipoComunsUnit;

type
  RegrasRedBenefPcRepository = class(IRegrasRedBenefPcRepository)
  private
    function CreateRegraFromQuery(Q: QueryResult): RegraRedBenefPcEtd;
  public
    function Incluir(Input: RegraRedBenefPcEtd): RegraRedBenefPcEtd; override;
    function Alterar(Input: RegraRedBenefPcEtd): RegraRedBenefPcEtd; override;
    function GetById(const Id: string): RegraRedBenefPcEtd; override;
    function ListarRegrasVigentes(EmpresaId: Integer; Data: TDate): RegraRedBenefPcEtdList; override;
    function ListarRegrasVigentesEAtual(const RegraId: string; Data: TDate): RegraRedBenefPcEtdList; override;
  end;

implementation

uses
  ParameterValueUnit;

{ RegrasRedBenefPcRepository }

function RegrasRedBenefPcRepository.CreateRegraFromQuery(Q: QueryResult): RegraRedBenefPcEtd;
begin
  Result := RegraRedBenefPcEtd.Create(
    Q.FieldAsString('ID'),
    Q.FieldAsInteger('SEQID'),
    Q.FieldAsString('CST'),
    Q.FieldAsString('DESCRICAO'),
    Q.FieldAsCurrency('PRED'),
    Q.FieldAsInteger('IND_AJ'),
    Q.FieldAsInteger('COD_AJ'),
    Q.FieldAsString('DESCR_AJ'),
    Q.FieldAsString('INF_COMPL_AJ'),
    Q.FieldAsString('COD_CTA'),
    Q.FieldAsDate('DATA_INI_VIGENCIA'),
    Q.FieldAsDateNullable('DATA_FIM_VIGENCIA'),
    StatusRegistroEnum(Q.FieldAsInteger('ATIVO')),
    Q.FieldAsStringToArrayInt('COD_EMPRESA', ','),
    Q.FieldAsStringToArrayString('NAT_REC', ','),
    Q.FieldAsStringToArrayString('NCM', ',')
  );
end;

function RegrasRedBenefPcRepository.GetById(const Id: string): RegraRedBenefPcEtd;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    'SELECT r.ID, r.SEQID, r.CST, r.DESCRICAO, r.PRED, r.IND_AJ, r.COD_AJ, r.DESCR_AJ, r.INF_COMPL_AJ, r.COD_CTA, ' +
    ' r.DATA_INI_VIGENCIA, r.DATA_FIM_VIGENCIA, r.ATIVO, ' +
    ' (select list(e.COD_EMPRESA, '','') from REGRAS_REDBENEF_PC_EMP e where e.REGRA_ID = r.ID) COD_EMPRESA, ' +
    ' (select list(n.NAT_REC, '','') from REGRAS_REDBENEF_PC_NAT_REC n where n.REGRA_ID = r.ID) NAT_REC, ' +
    ' (select list(ne.NCM, '','') from REGRAS_REDBENEF_PC_NCM_EXC ne where ne.REGRA_ID = r.ID) NCM ' +
    'FROM REGRAS_REDBENEF_PC r ' +
    'WHERE r.ID = :ID',
    ParametersBuilder.Create(1)
      .ByName('ID', Id)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil
    else
      Result := CreateRegraFromQuery(Q);
  finally
    Q.Free();
  end;
end;

function RegrasRedBenefPcRepository.Incluir(Input: RegraRedBenefPcEtd): RegraRedBenefPcEtd;
var
  Params: ParametersValues;
  RegistroId: string;
  I: Integer;
begin
  RegistroId := GenerateNewUUID();

  Params := ParametersBuilder.Create(12)
    .ByName('ID', RegistroId)
    .ByName('CST', Input.Cst)
    .ByName('DESCRICAO', Input.Descricao)
    .ByNameC('PRED', Input.PercReducao)
    .ByName('IND_AJ', Input.IndAjusteEFD)
    .ByName('COD_AJ', Input.CodAjusteEFD)
    .ByName('DESCR_AJ', Input.DescricaoAjusteEFD)
    .ByName('INF_COMPL_AJ', Input.InfComplementarAjusteEFD)
    .ByName('COD_CTA', Input.CodContaContabil)
    .ByName('DATA_INI_VIGENCIA', Input.InicioVigencia)
    .ByName('DATA_FIM_VIGENCIA', Input.FimVigencia)
    .ByName('ATIVO', Ord(Input.Ativo))
    .Build();

  // Inserir a regra principal
  FConnection.ExecuteCommand(
    'INSERT INTO REGRAS_REDBENEF_PC ' +
    '(ID, SEQID, CST, DESCRICAO, PRED, IND_AJ, COD_AJ, DESCR_AJ, INF_COMPL_AJ, COD_CTA, DATA_INI_VIGENCIA, ' +
    'DATA_FIM_VIGENCIA, ATIVO) ' +
    'VALUES ' +
    '(:ID, ' +
    '(COALESCE((SELECT MAX(SEQID) FROM REGRAS_REDBENEF_PC WHERE ID = :ID), 0) + 1), ' +
    ':CST, :DESCRICAO, :PRED, :IND_AJ, :COD_AJ, :DESCR_AJ, :INF_COMPL_AJ, :COD_CTA, :DATA_INI_VIGENCIA, ' +
    '  :DATA_FIM_VIGENCIA, :ATIVO)',
    Params
  );

  // Inserir empresas vinculadas
  if Length(Input.EmpresasId) > 0 then
  begin
    for I := 0 to High(Input.EmpresasId) do
    begin
      FConnection.ExecuteCommand(
        'INSERT INTO REGRAS_REDBENEF_PC_EMP (REGRA_ID, COD_EMPRESA) VALUES (:REGRA_ID, :COD_EMPRESA)',
        ParametersBuilder.Create(2)
          .ByName('REGRA_ID', RegistroId)
          .ByName('COD_EMPRESA', Input.EmpresasId[I])
          .Build()
      );
    end;
  end;

  // Inserir naturezas de receita
  if Length(Input.NaturezasReceita) > 0 then
  begin
    for I := 0 to High(Input.NaturezasReceita) do
    begin
      FConnection.ExecuteCommand(
        'INSERT INTO REGRAS_REDBENEF_PC_NAT_REC (REGRA_ID, NAT_REC) VALUES (:REGRA_ID, :NAT_REC)',
        ParametersBuilder.Create(2)
          .ByName('REGRA_ID', RegistroId)
          .ByName('NAT_REC', Input.NaturezasReceita[I])
          .Build()
      );
    end;
  end;

  // Inserir restrições de NCM
  if Length(Input.RestricoesNcm) > 0 then
  begin
    for I := 0 to High(Input.RestricoesNcm) do
    begin
      FConnection.ExecuteCommand(
        'INSERT INTO REGRAS_REDBENEF_PC_NCM_EXC (REGRA_ID, NCM) VALUES (:REGRA_ID, :NCM)',
        ParametersBuilder.Create(2)
          .ByName('REGRA_ID', RegistroId)
          .ByName('NCM', Input.RestricoesNcm[I])
          .Build()
      );
    end;
  end;

  Result := GetById(RegistroId);

  FCacheObjs.Invalidate();
end;

function RegrasRedBenefPcRepository.ListarRegrasVigentes(EmpresaId: Integer; Data: TDate): RegraRedBenefPcEtdList;
var
  Q: QueryResult;
  CacheKey: string;
begin
  CacheKey := Format('%d_%s', [ EmpresaId, DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'SELECT r.ID, r.SEQID, r.CST, r.DESCRICAO, r.PRED, r.IND_AJ, r.COD_AJ, r.DESCR_AJ, r.INF_COMPL_AJ, r.COD_CTA, ' +
    ' r.DATA_INI_VIGENCIA, r.DATA_FIM_VIGENCIA, r.ATIVO, ' +
    ' (select list(e.COD_EMPRESA, '','') from REGRAS_REDBENEF_PC_EMP e where e.REGRA_ID = r.ID) COD_EMPRESA, ' +
    ' (select list(n.NAT_REC, '','') from REGRAS_REDBENEF_PC_NAT_REC n where n.REGRA_ID = r.ID) NAT_REC, ' +
    ' (select list(ne.NCM, '','') from REGRAS_REDBENEF_PC_NCM_EXC ne where ne.REGRA_ID = r.ID) NCM ' +
    'FROM REGRAS_REDBENEF_PC r ' +
    '  inner join REGRAS_REDBENEF_PC_EMP e on e.REGRA_ID = r.ID and e.COD_EMPRESA = :COD_EMPRESA ' +
    'where :DATA BETWEEN r.DATA_INI_VIGENCIA and COALESCE(r.DATA_FIM_VIGENCIA, :DATA) and r.ATIVO = 1 ',
    ParametersBuilder.Create(2)
      .ByName('COD_EMPRESA', EmpresaId)
      .ByName('DATA', Data)
      .Build()
  );
  try
    Result := RegraRedBenefPcEtdList.Create();

    while not Q.Eof do
    begin
      Result.Add(CreateRegraFromQuery(Q));
      Q.Next();
    end;

    FCacheObjs.Add( CacheKey, Result, 2 );
  finally
    Q.Free();
  end;
end;

function RegrasRedBenefPcRepository.ListarRegrasVigentesEAtual(const RegraId: string;
  Data: TDate): RegraRedBenefPcEtdList;
var
  Q: QueryResult;
  CacheKey: string;
  SqlVigente, SqlPorId, SQL: string;
begin
  CacheKey := Format('%s_%d_%s', [ RegraId, FSession.EmpresaId, DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  SQL := 'SELECT r.ID, r.SEQID, r.CST, r.DESCRICAO, r.PRED, r.IND_AJ, r.COD_AJ, r.DESCR_AJ, r.INF_COMPL_AJ, r.COD_CTA, ' +
    ' r.DATA_INI_VIGENCIA, r.DATA_FIM_VIGENCIA, r.ATIVO, ' +
    ' (select list(e.COD_EMPRESA, '','') from REGRAS_REDBENEF_PC_EMP e where e.REGRA_ID = r.ID) COD_EMPRESA, ' +
    ' (select list(n.NAT_REC, '','') from REGRAS_REDBENEF_PC_NAT_REC n where n.REGRA_ID = r.ID) NAT_REC, ' +
    ' (select list(ne.NCM, '','') from REGRAS_REDBENEF_PC_NCM_EXC ne where ne.REGRA_ID = r.ID) NCM ' +
    'FROM REGRAS_REDBENEF_PC r ';

  SqlVigente := SQL +
    '  inner join REGRAS_REDBENEF_PC_EMP e on e.REGRA_ID = r.ID and e.COD_EMPRESA = :COD_EMPRESA ' +
    'where :DATA BETWEEN r.DATA_INI_VIGENCIA and COALESCE(r.DATA_FIM_VIGENCIA, :DATA) and r.ATIVO = 1 ';

  SqlPorId := Format( SQL + 'where r.ID = ''%s'' ', [ RegraId ]);

  if RegraId = '' then
    SQL := SqlVigente

  else
    SQL := Format( 'select * from (%s union distinct %s) as c order by c.descricao ', [ SqlVigente, SqlPorId ]);

  Q := FConnection.CreateQuery( SQL,
    ParametersBuilder.Create(2)
      .ByName('COD_EMPRESA', FSession.EmpresaId)
      .ByName('DATA', Data)
      .Build()
  );
  try
    Result := RegraRedBenefPcEtdList.Create();

    while not Q.Eof do
    begin
      Result.Add(CreateRegraFromQuery(Q));
      Q.Next();
    end;

    FCacheObjs.Add( CacheKey, Result, 2 );
  finally
    Q.Free();
  end;
end;

function RegrasRedBenefPcRepository.Alterar(Input: RegraRedBenefPcEtd): RegraRedBenefPcEtd;
var
  Params: ParametersValues;
  I: Integer;
begin
  Params := ParametersBuilder.Create(12)
    .ByName('ID', Input.Id)
    .ByName('CST', Input.Cst)
    .ByName('DESCRICAO', Input.Descricao)
    .ByNameC('PRED', Input.PercReducao)
    .ByName('IND_AJ', Input.IndAjusteEFD)
    .ByName('COD_AJ', Input.CodAjusteEFD)
    .ByName('DESCR_AJ', Input.DescricaoAjusteEFD)
    .ByName('INF_COMPL_AJ', Input.InfComplementarAjusteEFD)
    .ByName('COD_CTA', Input.CodContaContabil)
    .ByName('DATA_INI_VIGENCIA', Input.InicioVigencia)
    .ByName('DATA_FIM_VIGENCIA', Input.FimVigencia)
    .ByName('ATIVO', Ord(Input.Ativo))
    .Build();

  // Atualizar a regra principal
  FConnection.ExecuteCommand(
    'UPDATE REGRAS_REDBENEF_PC ' +
    'SET CST = :CST, DESCRICAO = :DESCRICAO, PRED = :PRED, IND_AJ = :IND_AJ, COD_AJ = :COD_AJ, DESCR_AJ = :DESCR_AJ, ' +
    ' INF_COMPL_AJ = :INF_COMPL_AJ, COD_CTA = :COD_CTA, DATA_INI_VIGENCIA = :DATA_INI_VIGENCIA, ' +
    ' DATA_FIM_VIGENCIA = :DATA_FIM_VIGENCIA, ' +
    ' ATIVO = :ATIVO ' +
    'WHERE ID = :ID',
    Params
  );

  // Remover empresas existentes
  FConnection.ExecuteCommand(
    'DELETE FROM REGRAS_REDBENEF_PC_EMP WHERE REGRA_ID = :REGRA_ID',
    ParametersBuilder.Create(1)
      .ByName('REGRA_ID', Input.Id)
      .Build()
  );

  // Inserir empresas vinculadas
  if Length(Input.EmpresasId) > 0 then
  begin
    for I := 0 to High(Input.EmpresasId) do
    begin
      FConnection.ExecuteCommand(
        'INSERT INTO REGRAS_REDBENEF_PC_EMP (REGRA_ID, COD_EMPRESA) VALUES (:REGRA_ID, :COD_EMPRESA)',
        ParametersBuilder.Create(2)
          .ByName('REGRA_ID', Input.Id)
          .ByName('COD_EMPRESA', Input.EmpresasId[I])
          .Build()
      );
    end;
  end;

  // Remover naturezas de receita existentes
  FConnection.ExecuteCommand(
    'DELETE FROM REGRAS_REDBENEF_PC_NAT_REC WHERE REGRA_ID = :REGRA_ID',
    ParametersBuilder.Create(1)
      .ByName('REGRA_ID', Input.Id)
      .Build()
  );

  // Inserir naturezas de receita
  if Length(Input.NaturezasReceita) > 0 then
  begin
    for I := 0 to High(Input.NaturezasReceita) do
    begin
      FConnection.ExecuteCommand(
        'INSERT INTO REGRAS_REDBENEF_PC_NAT_REC (REGRA_ID, NAT_REC) VALUES (:REGRA_ID, :NAT_REC)',
        ParametersBuilder.Create(2)
          .ByName('REGRA_ID', Input.Id)
          .ByName('NAT_REC', Input.NaturezasReceita[I])
          .Build()
      );
    end;
  end;

  // Remover restrições de NCM existentes
  FConnection.ExecuteCommand(
    'DELETE FROM REGRAS_REDBENEF_PC_NCM_EXC WHERE REGRA_ID = :REGRA_ID',
    ParametersBuilder.Create(1)
      .ByName('REGRA_ID', Input.Id)
      .Build()
  );

  // Inserir restrições de NCM
  if Length(Input.RestricoesNcm) > 0 then
  begin
    for I := 0 to High(Input.RestricoesNcm) do
    begin
      FConnection.ExecuteCommand(
        'INSERT INTO REGRAS_REDBENEF_PC_NCM_EXC (REGRA_ID, NCM) VALUES (:REGRA_ID, :NCM)',
        ParametersBuilder.Create(2)
          .ByName('REGRA_ID', Input.Id)
          .ByName('NCM', Input.RestricoesNcm[I])
          .Build()
      );
    end;
  end;

  Result := GetById(Input.Id);

  FCacheObjs.Invalidate();
end;

end.
