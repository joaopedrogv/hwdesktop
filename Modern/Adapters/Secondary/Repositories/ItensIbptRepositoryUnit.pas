unit ItensIbptRepositoryUnit;

interface

uses
  IItensIbptRepositoryUnit,
  CacheableRepositoryUnit,
  ItemIbptEtdUnit,
  QueryResultUnit,
  TipoComunsUnit;

type
  ItensIbptRepository = class(IItensIbptRepository)
  private
    function CreateItemFromQuery(Q: QueryResult): ItemIbptEtd;
  public
    function ObterItemIbpt(const Codigo, UF: string; Data: TDate; Excecao: Smallint = 0): ItemIbptEtd; override;
    procedure SalvarItens(Input: ItemIbptEtdList); override;
  end;

implementation

{ ItensIbptRepository }

uses
  SysUtils,
  TypInfo,
  ParameterValueUnit, Contnrs, EnumServiceUnit,
  StringServiceUnit;

function ItensIbptRepository.CreateItemFromQuery(Q: QueryResult): ItemIbptEtd;
begin
  Result := ItemIbptEtd.Create(
    Q.FieldAsInteger('ID'),
    Q.FieldAsString('CODIGO'),
    Q.FieldAsString('UF'),
    Q.FieldAsInteger('EX'),   
    Q.FieldAsString('TIPO'),
    Q.FieldAsString('DESCRICAO'),
    Q.FieldAsCurrency('NACIONAL'),
    Q.FieldAsCurrency('ESTADUAL'),
    Q.FieldAsCurrency('IMPORTADO'),
    Q.FieldAsCurrency('MUNICIPAL'),
    Q.FieldAsDateTime('VIGENCIAFIM'),
    Q.FieldAsDateTimeNullable('VIGENCIAFIM'),
    Q.FieldAsStringNullable('CHAVE'),
    Q.FieldAsStringNullable('VERSAO')
  );
end;

function ItensIbptRepository.ObterItemIbpt(const Codigo, UF: string; Data: TDate; Excecao: Smallint): ItemIbptEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := Format('%s_%s', [ Codigo, DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery(
    'SELECT FIRST 1' +
    'I.ID, I.CODIGO, I.UF, I.EX, I.TIPO, I.DESCRICAO, I.NACIONAL, I.ESTADUAL, I.IMPORTADO, I.MUNICIPAL, ' +
    'I.VIGENCIAINICIO, I.VIGENCIAFIM, I.CHAVE, I.VERSAO ' +
    'FROM IBPT_V2 I ' +
    'WHERE CODIGO = :CODIGO AND UF = :UF AND EX = :EX ' +
    'AND :DATA >= VIGENCIAINICIO ' +
    'ORDER BY VIGENCIAFIM DESC ',
//    'AND :DATA BETWEEN VIGENCIAINICIO AND COALESCE(VIGENCIAFIM, :DATA) ',
    ParametersBuilder.Create(4)
      .ByName('CODIGO', Codigo)
      .ByName('UF', UF)
      .ByName('EX', Excecao)
      .ByName('DATA', Data)
      .Build()
  );
  try
    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q );

    FCacheObjs.Add(CacheKey, Result);

  finally
    Q.Free();
  end;
end;

procedure ItensIbptRepository.SalvarItens(Input: ItemIbptEtdList);
var
  CacheKey: string;
  Q: QueryResult;
begin
//  CacheKey := Format('recente_%s', [ ItemIbpt ]);
//
//  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
//    Exit;
//
//  Q := FConnection.CreateQuery(
//    'SELECT FIRST 1 ID, CODIGO, DESCRICAO, DATA_INICIO, DATA_FIM, NUMERO_ATO_INI, '+
//    '       NUMERO_ATO_FIM, ANO_ATO_INI, ANO_ATO_FIM, STATE '+
//    'FROM ItemIbpt ' +
//    'WHERE CODIGO = :CODIGO ' +
//    'ORDER BY DATA_INICIO DESC',
//    ParametersBuilder.Create(2)
//      .ByName('CODIGO', ItemIbpt)
//      .Build()
//  );
//  try
//    if Q.IsEmpty then
//      Result := nil
//
//    else
//      Result := CreateItemFromQuery( Q );
//
//    FCacheObjs.Add(CacheKey, Result);
//
//  finally
//    Q.Free();
//  end;
end;

end.
