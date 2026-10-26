unit AjustesRedBenefPcRepositoryUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  CacheableRepositoryUnit, IAjustesRedBenefPcRepositoryUnit, AjusteRedBenefPcEtdUnit, AjusteRedBenefPcModelUnit,
  IDataBaseConnectionUnit, ISessionContextUnit, QueryResultUnit, StringServiceUnit, StatusRegistroEnumUnit,
  DateAndTimeNullableUnit, PeriodoMultiEmpresaVOUnit, TipoComunsUnit;

type
  AjustesRedBenefPcRepository = class(IAjustesRedBenefPcRepository)
  private
    function GetSQLBase(const WhereSQL: string): string;

    function CreateAjusteModelFromQuery(Q: QueryResult): AjusteRedBenefPcModel;
  public
    function Incluir(Input: AjusteRedBenefPcModel): AjusteRedBenefPcModel; overload; override;
    procedure Incluir(Input: AjusteRedBenefPcModelList) overload; override;
    function Alterar(Input: AjusteRedBenefPcModel): AjusteRedBenefPcModel; overload; override;
    procedure Alterar(Input: AjusteRedBenefPcModelList) overload; override;
    procedure Excluir(const Id: string; EmpresaId: Integer); overload; override;
    procedure Excluir(const Ids: TArrayString; EmpresaId: Integer); overload; override;
    function GetById(const Id: string): AjusteRedBenefPcModel; override;
    function ListarPorDFe(const ChaveDFe: string; EmpresaId: Integer): AjusteRedBenefPcModelList; override;
    function ListarPorPeriodo(const Input: PeriodoMultiEmpresaVO): AjusteRedBenefPcModelList; override;
  end;

implementation

uses
  StrUtils,
  ParameterValueUnit, ArrayServiceUnit;

{ AjustesRedBenefPcRepository }

procedure AjustesRedBenefPcRepository.Alterar(Input: AjusteRedBenefPcModelList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Item: AjusteRedBenefPcModel;
begin
  SetLength(ParamsList, Input.Count);

  for I := 0 to Input.Count - 1 do
  begin
    Item := Input.Items[I];

    if Item.Id = '' then
      Item.Id := GenerateNewUUID();

    ParamsList[I] := ParametersBuilder.Create(13)
      .ByName('ID', Item.Id)
      .ByName('CHAVE_DFE', Item.ChaveDfe)
      .ByName('COD_EMPRESA', Item.CodEmpresa)
      .ByName('REGRA_ID', Item.RegraId)
      .ByName('IND_AJ', Item.IndAj)
      .ByName('COD_AJ', Item.CodAj)
      .ByName('DATA_REF', Item.DataRef)
      .ByName('CST', Item.Cst)
      .ByNameC('VBC', Item.Vbc)
      .ByNameC('PPIS_AJ', Item.PPisAj)
      .ByNameC('VPIS_AJ', Item.VPisAj)
      .ByNameC('PCOFINS_AJ', Item.PCofinsAj)
      .ByNameC('VCOFINS_AJ', Item.VCofinsAj)    
      .ByNameC('AUTOMATICO', Ord(Item.Automatico))
      .Build();
  end;

  // Alterar o ajuste
  FConnection.ExecuteBatch(
    'UPDATE AJ_REDBENEF ' +
    'SET CHAVE_DFE = :CHAVE_DFE, COD_EMPRESA = :COD_EMPRESA, REGRA_ID = :REGRA_ID, IND_AJ = :IND_AJ, ' +
    'COD_AJ = :COD_AJ, DATA_REF = :DATA_REF, CST = :CST, VBC = :VBC, PPIS_AJ = :PPIS_AJ, VPIS_AJ = :VPIS_AJ, ' +
    'PCOFINS_AJ = :PCOFINS_AJ, VCOFINS_AJ = :VCOFINS_AJ, AUTOMATICO = :AUTOMATICO ' +
    'WHERE ID = :ID',
    ParamsList
  );
end;

function AjustesRedBenefPcRepository.CreateAjusteModelFromQuery(Q: QueryResult): AjusteRedBenefPcModel;
const
  NFeNFCe: array[0..1] of string = ('55', '65');
var
  doc: DocFiscalReferenciado;
  S: TArrayString;
begin
  if MatchStr(Q.FieldAsString('MODELO'), NFeNFCe)
    and not Q.FieldIsNull('DOC_DFE') then
  begin
    S := StringService.Split(['/'], Q.FieldAsString('DOC_DFE'));
    if Length(S) >= 3 then
      doc := DocFiscalReferenciado.Create(
        {Id} S[0],
        {Regular} (S[1] = 'Fechada') and (S[2] = 'Autorizada')
      )
    else
      doc := nil
  end
  else
    doc := nil;

  Result := AjusteRedBenefPcModel.Create(
    Q.FieldAsString('ID'),
    Q.FieldAsString('CHAVE_DFE'),
    Q.FieldAsInteger('COD_EMPRESA'),
    Q.FieldAsString('REGRA_ID'),
    Q.FieldAsInteger('IND_AJ'),
    Q.FieldAsInteger('COD_AJ'),
    Q.FieldAsDateTime('DATA_REF'),
    Q.FieldAsString('CST'),
    Q.FieldAsCurrency('VBC'),
    Q.FieldAsCurrency('PPIS_AJ'),
    Q.FieldAsCurrency('VPIS_AJ'),
    Q.FieldAsCurrency('PCOFINS_AJ'),
    Q.FieldAsCurrency('VCOFINS_AJ'),
    Q.FieldAreEquals('AUTOMATICO', 1),
    Q.FieldAsString('DESCR_AJ'),
    Q.FieldAsString('INF_COMPL_AJ'),
    Q.FieldAsString('COD_CTA'),
    doc
  );
end;

procedure AjustesRedBenefPcRepository.Excluir(const Ids: TArrayString; EmpresaId: Integer);
var
  I: Integer;
  ParamsList: array of ParametersValues;
begin
  SetLength(ParamsList, Length(Ids));

  for I := 0 to High(Ids) do
    ParamsList[I] := ParametersBuilder.Create(2)
      .ByName('ID', Ids[I])
      .ByName('COD_EMPRESA', EmpresaId)
      .Build();

  FConnection.ExecuteBatch(
    'DELETE FROM AJ_REDBENEF ' +
    'WHERE ID = :ID ' +
    'AND COD_EMPRESA = :COD_EMPRESA',
    ParamsList
  );
end;

procedure AjustesRedBenefPcRepository.Excluir(const Id: string; EmpresaId: Integer);
begin
  FConnection.ExecuteCommand(
    'DELETE FROM AJ_REDBENEF ' +
    'WHERE ID = :ID ' +
    'AND COD_EMPRESA = :COD_EMPRESA',
    ParametersBuilder.Create(2)
      .ByName('ID', Id)
      .ByName('COD_EMPRESA', EmpresaId)
      .Build()
  );
end;

function AjustesRedBenefPcRepository.GetById(const Id: string): AjusteRedBenefPcModel;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    GetSQLBase('WHERE A.ID = :ID'),
    ParametersBuilder.Create(1)
      .ByName('ID', Id)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil
    else
      Result := CreateAjusteModelFromQuery(Q);
  finally
    Q.Free();
  end;
end;

function AjustesRedBenefPcRepository.GetSQLBase(const WhereSQL: string): string;
begin
  Result := Format(
    'select C.ID, C.CHAVE_DFE, C.COD_EMPRESA, C.REGRA_ID, C.IND_AJ, C.COD_AJ, C.DATA_REF, C.CST, C.VBC, ' +
    '    C.PPIS_AJ, C.VPIS_AJ, C.PCOFINS_AJ, C.VCOFINS_AJ, C.AUTOMATICO, ' +
    '    C.DESCR_AJ, C.INF_COMPL_AJ, C.COD_CTA, C.MODELO, ' +
    '    case ' +
    '      when C.MODELO = ''55'' then ' +
    '        ( SELECT FIRST 1 ' +
    '            COALESCE(N.COD_NF, '''') || ''/'' || COALESCE(N.STATUS, '''') || ''/'' || COALESCE(N.SITUACAO_NFE, '''') ' +
    '          FROM NOTAFISCAL N ' +
    '          WHERE N.CHAVE_NFE = C.CHAVE_DFE AND N.COD_EMPRESA = C.COD_EMPRESA ' +
    '          AND N.NATUREZA_NF = ''S'' AND N.EMISSAO_PROPRIA = ''S'' AND COALESCE(N.DA, '''') <> ''S'' ' +
    '        ) ' +
    '      when C.MODELO = ''65'' then ' +
    '        ( SELECT FIRST 1 coalesce(N.COD_NFCE, '''') || ''/'' || coalesce(N.STATUS, '''') || ''/'' || coalesce(N.SITUACAO_NFCE, '''') ' +
    '          FROM NFCE N ' +
    '          WHERE N.CHAVE_NFCE = C.CHAVE_DFE AND N.COD_EMPRESA = C.COD_EMPRESA ' +
    '        ) ' +
    '       else ' +
    '         null ' +
    '    end DOC_DFE ' +
    'from ( ' +
    '  SELECT ' +
    '    A.ID, A.CHAVE_DFE, A.COD_EMPRESA, A.REGRA_ID, A.IND_AJ, A.COD_AJ, A.DATA_REF, A.CST, A.VBC, ' +
    '    A.PPIS_AJ, A.VPIS_AJ, A.PCOFINS_AJ, A.VCOFINS_AJ, A.AUTOMATICO, ' +
    '    R.DESCR_AJ, R.INF_COMPL_AJ, R.COD_CTA, substring(A.CHAVE_DFE from 21 for 2) MODELO ' +
    '  FROM AJ_REDBENEF A ' +
    '   INNER JOIN REGRAS_REDBENEF_PC R ON R.ID = A.REGRA_ID ' +
    '  %s ' +
    ') as C ', [WhereSQL]);
end;

procedure AjustesRedBenefPcRepository.Incluir(Input: AjusteRedBenefPcModelList);
var
  I: Integer;
  ParamsList: array of ParametersValues;
  Item: AjusteRedBenefPcModel;
begin
  SetLength(ParamsList, Input.Count);

  for I := 0 to Input.Count - 1 do
  begin
    Item := Input.Items[I];

    if Item.Id = '' then
      Item.Id := GenerateNewUUID();

    ParamsList[I] := ParametersBuilder.Create(13)
      .ByName('ID', Item.Id)
      .ByName('CHAVE_DFE', Item.ChaveDfe)
      .ByName('COD_EMPRESA', Item.CodEmpresa)
      .ByName('REGRA_ID', Item.RegraId)
      .ByName('IND_AJ', Item.IndAj)
      .ByName('COD_AJ', Item.CodAj)
      .ByName('DATA_REF', Item.DataRef)
      .ByName('CST', Item.Cst)
      .ByNameC('VBC', Item.Vbc)
      .ByNameC('PPIS_AJ', Item.PPisAj)
      .ByNameC('VPIS_AJ', Item.VPisAj)
      .ByNameC('PCOFINS_AJ', Item.PCofinsAj)
      .ByNameC('VCOFINS_AJ', Item.VCofinsAj)
      .ByNameC('AUTOMATICO', Ord(Item.Automatico))
      .Build();
  end;

  // Inserir o ajuste
  FConnection.ExecuteBatch(
    'INSERT INTO AJ_REDBENEF ' +
    '(ID, CHAVE_DFE, COD_EMPRESA, REGRA_ID, IND_AJ, COD_AJ, DATA_REF, CST, VBC, PPIS_AJ, VPIS_AJ, ' +
    '  PCOFINS_AJ, VCOFINS_AJ, AUTOMATICO) ' +
    'VALUES ' +
    '(:ID, :CHAVE_DFE, :COD_EMPRESA, :REGRA_ID, :IND_AJ, :COD_AJ, :DATA_REF, :CST, :VBC, ' +
    '  :PPIS_AJ, :VPIS_AJ, :PCOFINS_AJ, :VCOFINS_AJ, :AUTOMATICO)',
    ParamsList
  );
end;

function AjustesRedBenefPcRepository.Incluir(Input: AjusteRedBenefPcModel): AjusteRedBenefPcModel;
var
  List: AjusteRedBenefPcModelList;
//  Params: ParametersValues;
//  RegistroId: string;
begin
  {RegistroId := GenerateNewUUID();

  Params := ParametersBuilder.Create(12)
    .ByName('ID', RegistroId)
    .ByName('CHAVE_DFE', Input.ChaveDfe)
    .ByName('COD_EMPRESA', Input.CodEmpresa)
    .ByName('REGRA_ID', Input.RegraId)
    .ByName('IND_AJ', Input.IndAj)
    .ByName('COD_AJ', Input.CodAj)
    .ByName('DATA_REF', Input.DataRef)
    .ByName('CST', Input.Cst)
    .ByNameC('VBC', Input.Vbc)
    .ByNameC('PPIS_AJ', Input.PPisAj)
    .ByNameC('VPIS_AJ', Input.VPisAj)
    .ByNameC('PCOFINS_AJ', Input.PCofinsAj)
    .ByNameC('VCOFINS_AJ', Input.VCofinsAj)
    .Build();

  // Inserir o ajuste
  FConnection.ExecuteCommand(
    'INSERT INTO AJ_REDBENEF ' +
    '(ID, CHAVE_DFE, COD_EMPRESA, REGRA_ID, IND_AJ, COD_AJ, DATA_REF, CST, VBC, PPIS_AJ, VPIS_AJ, ' +
    '  PCOFINS_AJ, VCOFINS_AJ) ' +
    'VALUES ' +
    '(:ID, :CHAVE_DFE, :COD_EMPRESA, :REGRA_ID, :IND_AJ, :COD_AJ, :DATA_REF, :CST, :VBC, ' +
    '  :PPIS_AJ, :VPIS_AJ, :PCOFINS_AJ, :VCOFINS_AJ)',
    Params
  );
  }

  List := AjusteRedBenefPcModelList.Create(False);
  try
    List.Add(Input);

    Incluir(List);

    Result := GetById(Input.Id);
  finally
    List.Free();
  end;
end;

function AjustesRedBenefPcRepository.ListarPorDFe(const ChaveDFe: string; EmpresaId: Integer): AjusteRedBenefPcModelList;
var
  Q: QueryResult;
begin
  Q := FConnection.CreateQuery(
    GetSQLBase('WHERE A.CHAVE_DFE = :CHAVE_DFE AND A.COD_EMPRESA = :COD_EMPRESA '),
    ParametersBuilder.Create(2)
      .ByName('CHAVE_DFE', ChaveDFe)
      .ByName('COD_EMPRESA', EmpresaId)
      .Build()
  );
  try
    Result := AjusteRedBenefPcModelList.Create();

    while not Q.Eof do
    begin
      Result.Add(CreateAjusteModelFromQuery(Q));
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function AjustesRedBenefPcRepository.ListarPorPeriodo(const Input: PeriodoMultiEmpresaVO): AjusteRedBenefPcModelList;
var
  Q: QueryResult;
  S: string;
begin
  S := StringService.Join(',', ArrayService.IntArrayToStringArray(Input.EmpresasId));

  Q := FConnection.CreateQuery(
    GetSQLBase(Format('WHERE A.DATA_REF BETWEEN :DATAINI AND :DATAFIM AND A.COD_EMPRESA IN (%s) ', [S]))
     + ' ORDER BY CHAVE_DFE ',
    ParametersBuilder.Create(2)
      .ByName('DATAINI', Input.DataInicial)
      .ByName('DATAFIM', Input.DataFinal)
      .Build()
  );
  try
    Result := AjusteRedBenefPcModelList.Create();

    while not Q.Eof do
    begin
      Result.Add(CreateAjusteModelFromQuery(Q));
      Q.Next();
    end;

  finally
    Q.Free();
  end;
end;

function AjustesRedBenefPcRepository.Alterar(Input: AjusteRedBenefPcModel): AjusteRedBenefPcModel;
var
  List: AjusteRedBenefPcModelList;
begin
  List := AjusteRedBenefPcModelList.Create(False);
  try
    List.Add(Input);

    Alterar(List);

    Result := GetById(Input.Id);
  finally
    List.Free();
  end;
  {
  Params := ParametersBuilder.Create(13)
    .ByName('ID', Input.Id)
    .ByName('CHAVE_DFE', Input.ChaveDfe)
    .ByName('COD_EMPRESA', Input.CodEmpresa)
    .ByName('REGRA_ID', Input.RegraId)
    .ByName('IND_AJ', Input.IndAj)
    .ByName('COD_AJ', Input.CodAj)
    .ByName('DATA_REF', Input.DataRef)
    .ByName('CST', Input.Cst)
    .ByNameC('VBC', Input.Vbc)
    .ByNameC('PPIS_AJ', Input.PPisAj)
    .ByNameC('VPIS_AJ', Input.VPisAj)
    .ByNameC('PCOFINS_AJ', Input.PCofinsAj)
    .ByNameC('VCOFINS_AJ', Input.VCofinsAj)
    .Build();

  // Atualizar o ajuste
  FConnection.ExecuteCommand(
    'UPDATE AJ_REDBENEF ' +
    'SET CHAVE_DFE = :CHAVE_DFE, COD_EMPRESA = :COD_EMPRESA, REGRA_ID = :REGRA_ID, IND_AJ = :IND_AJ, ' +
    'COD_AJ = :COD_AJ, DATA_REF = :DATA_REF, CST = :CST, VBC = :VBC, PPIS_AJ = :PPIS_AJ, VPIS_AJ = :VPIS_AJ, ' +
    'PCOFINS_AJ = :PCOFINS_AJ, VCOFINS_AJ = :VCOFINS_AJ ' +
    'WHERE ID = :ID',
    Params
  );

  Result := GetById(Input.Id, Input.CodEmpresa);
  }
end;

end.
