unit ClientesRepositoryUnit;

interface

uses
  SysUtils,
  IClientesRepositoryUnit,
  ClienteEtdUnit,
  QueryResultUnit;

type
  ClientesRepository = class(IClientesRepository)
  private
    function GetSQLBase(): string;
    function CreateItemFromQuery(Q: QueryResult): ClienteEtd;
  public
    function GetById(Codigo, EmpresaId: Integer): ClienteEtd; override;
  end;

implementation

uses
  StatusRegistroEnumUnit,
  MunicipioEtduNIT, EstadoEtdUnit, DFeTypesUnit, NumberServiceUnit, TipoRetencaoFederalPJEnumUnit;

{ ClientesRepository }

function ClientesRepository.CreateItemFromQuery(Q: QueryResult): ClienteEtd;
var
  Ativo: StatusRegistroEnum;
  iValue: Smallint;
  AMunicipio: MunicipioEtd;
  TipoEnteGov: TipoEnteGovEnum;
begin
  iValue := Q.FieldAsInteger('ATIVO');
  case iValue of
    0,2: Ativo := StatusRegistroEnum(iValue);
    99 : Ativo := saExclusaoLogica;
  else
    Ativo := saAtivo;
  end;

  iValue := NumberService.RangeOrDefault(
    Ord(Low(TipoEnteGovEnum)),
    Ord(High(TipoEnteGovEnum)),
    Q.FieldAsInteger('TIPO_ENTE_GOV'),
    Ord(tgvNenhum)
  );
  TipoEnteGov := TipoEnteGovEnum(iValue);

  case iValue of
    0,2: Ativo := StatusRegistroEnum(iValue);
    99 : Ativo := saExclusaoLogica;
  else
    Ativo := saAtivo;
  end;
  
  if Q.FieldIsNull('CODIGO_MUN_IBGE') then
    AMunicipio := nil
  else
    AMunicipio := MunicipioEtd.Create(
      Q.FieldAsInteger('codigo_mun_ibge'),
      Q.FieldAsString('nome_municipio'),
      EstadoEtd.Create(
        Q.FieldAsInteger('codigo_uf_ibge'),
        Q.FieldAsString('sigla_uf'),
        Q.FieldAsString('nome_uf')
      )      
    );

  Result := ClienteEtd.Create(
    Q.FieldAsInteger('COD_CLIENTE'),
    Q.FieldAsInteger('COD_EMPRESA'),
    Q.FieldAsString('NOME_CLIENTE'),
    Q.FieldAsString('RAZAO'),
    Q.FieldAsString('CEP'),
    Q.FieldAsString('ENDERECO'),
    Q.FieldAsStringNullable('NUM_END_CLIENTE'),
    Q.FieldAsStringNullable('COMPLEMENTO'),
    Q.FieldAsString('BAIRRO'),
    Q.FieldAsString('CIDADE'),
    Q.FieldAsIntNullable('COD_BAIRRO'),
    Q.FieldAsIntNullable('COD_CIDADE'),
    Q.FieldAsInteger('CODIGO_UF'),
    Q.FieldAsIntNullable('COD_PAIS'),
    Q.FieldAsStringNullable('FONE_CLIENTE'),
    Q.FieldAsStringNullable('FONE_CELULAR'),
    Q.FieldAsStringNullable('EMAIL'),
    Q.FieldAsStringNullable('CPFCGC'),
    Q.FieldAsStringNullable('INSC_EST'),
    Q.FieldAsStringNullable('INSC_MUNICIPAL'),
    Q.FieldAsStringNullable('ISUF'),
    Q.FieldAsStringNullable('REGIME'),
    Q.FieldAsIntNullable('ISS_RETIDO'),
    Q.FieldAsIntNullable('NFE_INDIEDEST'),
    Q.FieldAsStringNullable('NFE_IDESTRANGEIRO'),
    Q.FieldAsStringNullable('CONSUMIDOR_FINAL'),
    Q.FieldAsIntNullable('RET_FED'),
    TipoCombinacaoRetencaoFederalPJEnum(Q.FieldAsInteger('RET_FED_NFS')),
    Q.FieldAsIntNullable('TIPO_OBRA_NFSE'),
    TipoEnteGov,
    Q.FieldAsIntNullable('FINALIDADEID'),
    Q.FieldAsIntNullable('COD_CLI_FAT'),
    Q.FieldAsStringNullable('TIPO'),
    Q.FieldAsIntNullable('COD_VENDEDOR'),
    Q.FieldAsIntNullable('RET_FED_NFS_SET'),
    Ativo,
    AMunicipio
  );
end;

function ClientesRepository.GetById(Codigo, EmpresaId: Integer): ClienteEtd;
var
  CacheKey: string;
  Q: QueryResult;
begin
  CacheKey := Format('cod_%d', [ Codigo ]);

  if FCacheObjs.TryGetValue(CacheKey, TObject(Result)) then
    Exit;

  Q := FConnection.CreateQuery( GetSQLBase() +
    ' where c.cod_cliente = %d and c.cod_empresa = %d', [ Codigo, EmpresaId ]
  );
  try

    if Q.IsEmpty then
      Result := nil

    else
      Result := CreateItemFromQuery( Q );

    FCacheObjs.Add(CacheKey, Result, 2);

  finally
    Q.Free();
  end;
end;

function ClientesRepository.GetSQLBase: string;
begin
  Result :=
    'select ' +
    'c.cod_cliente, c.cod_empresa, c.nome_cliente, c.razao, c.cep, c.endereco, c.num_end_cliente, c.complemento, ' +
    'c.bairro, c.cidade, c.cod_bairro, c.cod_cidade, c.codigo_uf, c.cod_pais, c.fone_cliente, c.fone_celular, ' +
    'c.email, c.cpfcgc, c.insc_est, c.insc_municipal, c.isuf, c.regime, c.iss_retido, c.nfe_indiedest, ' +
    'c.nfe_idestrangeiro, c.consumidor_final, c.ret_fed, c.ret_fed_nfs, c.ret_fed_nfs_set, c.tipo_obra_nfse, ' +
    'c.tipo_ente_gov, c.finalidadeid, c.cod_cli_fat, c.tipo, c.cod_vendedor, c.ativo, cd.codigo_uf_ibge, cd.nome_uf, ' +
    'cd.codigo_mun_ibge, cd.nome_municipio, e.sigla_uf ' +
    'from clientes c ' +
    'left join cidades c1 on c1.cod_cidade = c.cod_cidade ' +
    'left join cidades_ibge cd on cd.codigo_mun_ibge = c1.ibge_cod_cidade ' +
    'left join estados e on e.ibge_codigo_uf = cd.codigo_uf_ibge ';
end;

end.
