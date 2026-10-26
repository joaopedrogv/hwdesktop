unit NbsRepositoryUnit;

interface

uses
  INbsRepositoryUnit,
  CacheableRepositoryUnit,
  NbsEtdUnit,
  TipoComunsUnit;

type                         
  {$IFDEF INTF_ON}
  NbsRepository = class(CacheableRepository, INbsRepository)
  {$ELSE}
  NbsRepository = class(INbsRepository)
  {$ENDIF}
  public
    function ObterNbs(const Nbs: string; Data: TDate): NbsEtd; override;
    function ListarNbs(Data: TDate): NbssEtd; override;
  end;

implementation

{ NbsRepository }

uses
  SysUtils,
  ParameterValueUnit;

function NbsRepository.ObterNbs(const Nbs: string; Data: TDate): NbsEtd;
var
  CacheKey: string;
begin
  CacheKey := Format('%s_%s', [ Nbs, DateToStr(Data)]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  with FConnection.CreateQuery(
    'SELECT COD_NBS, DESCRICAO_NBS, ALIQNAC, ALIQIMP, VERSAO, LC_116, DATA_INICIO, DATA_FIM ' +
    'FROM NBS ' +
    'WHERE COD_NBS = :COD_NBS ' +
    'AND :DATA BETWEEN DATA_INICIO AND COALESCE(DATA_FIM, :DATA) ',
    ParametersBuilder.Create(2)
      .ByName('COD_NBS', Nbs)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    if IsEmpty then
      Result := nil

    else
    begin
      Result := NbsEtd.Create(
        FieldAsString('COD_NBS'),
        FieldAsString('DESCRICAO_NBS'),
        FieldAsStringNullable('LC_116'),
        FieldAsDate('DATA_INICIO'),
        FieldAsDateNullable('DATA_FIM')
      );
    end;

    FCacheObjs.Add(CacheKey, Result);

  finally
    FreeQueryResult();
  end;
end;

function NbsRepository.ListarNbs(Data: TDate): NbssEtd;
var
  CacheKey: string;
begin
  // Espelho de NbsRepository.listarNbs: NBS vigentes na data, ordenadas por codigo.
  CacheKey := Format('listar_%s', [ DateToStr(Data) ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Result := NbssEtd.Create;

  with FConnection.CreateQuery(
    'SELECT COD_NBS, DESCRICAO_NBS, LC_116, DATA_INICIO, DATA_FIM ' +
    'FROM NBS ' +
    'WHERE :DATA BETWEEN DATA_INICIO AND COALESCE(DATA_FIM, :DATA) ' +
    'AND CHAR_LENGTH(COD_NBS) = 9 ' +
    'ORDER BY COD_NBS ',
    ParametersBuilder.Create(1)
      .ByName('DATA', Data)
      .Build()
  ) do
  try
    while not DataSet.Eof do
    begin
      Result.Add( NbsEtd.Create(
        FieldAsString('COD_NBS'),
        FieldAsString('DESCRICAO_NBS'),
        FieldAsStringNullable('LC_116'),
        FieldAsDate('DATA_INICIO'),
        FieldAsDateNullable('DATA_FIM')
      ));

      DataSet.Next();
    end;

  finally
    FreeQueryResult();
  end;

  FCacheObjs.Add(CacheKey, Result);
end;

end.
