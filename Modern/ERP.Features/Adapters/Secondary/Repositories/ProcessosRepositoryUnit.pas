unit ProcessosRepositoryUnit;

interface

uses
  IProcessosRepositoryUnit,
  ProcessoAtualizacaoModelUnit;

type
  ProcessosRepository = class(IProcessosRepository)
  public
    procedure InserirAusentes(const AProcessos: ProcessoModelArray; AEmpresaId: Integer); override;
  end;

implementation

uses
  ParameterValueUnit;

const
  SQL_INSERIR_PROCESSO_AUSENTE =
    'INSERT INTO TABELA_PROCESSOS ' +
    '(COD_PROCESSO, COD_EMPRESA, NOME_PROCESSO, NIVEL_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA, ATIVO) ' +
    'SELECT :COD_PROCESSO_VALOR, :COD_EMPRESA_VALOR, :NOME_PROCESSO_VALOR, :NIVEL_PROCESSO_VALOR, ' +
    ':SENHA_GERENTE_VALOR, :GRAVAR_AUDITORIA_VALOR, 1 ' +
    'FROM RDB$DATABASE ' +
    'WHERE NOT EXISTS (' +
    'SELECT 1 FROM TABELA_PROCESSOS T WHERE T.COD_PROCESSO = :COD_PROCESSO_FILTRO ' +
    'AND T.COD_EMPRESA = :COD_EMPRESA_FILTRO)';

{ ProcessosRepository }

procedure ProcessosRepository.InserirAusentes(
  const AProcessos: ProcessoModelArray; AEmpresaId: Integer);
var
  ParamsList: array of ParametersValues;
  I: Integer;

  function SimNao(AValor: Boolean): string;
  begin
    if AValor then
      Result := 'S'
    else
      Result := 'N';
  end;

begin
  SetLength(ParamsList, Length(AProcessos));

  for I := 0 to High(AProcessos) do
    ParamsList[I] := ParametersBuilder.Create(8)
      .ByName('COD_PROCESSO_VALOR', AProcessos[I].Codigo)
      .ByName('COD_EMPRESA_VALOR', AEmpresaId)
      .ByName('NOME_PROCESSO_VALOR', AProcessos[I].Descricao)
      .ByName('NIVEL_PROCESSO_VALOR', AProcessos[I].Nivel)
      .ByName('SENHA_GERENTE_VALOR', SimNao(AProcessos[I].ExigeGerente))
      .ByName('GRAVAR_AUDITORIA_VALOR', SimNao(AProcessos[I].GravaAuditoria))
      .ByName('COD_PROCESSO_FILTRO', AProcessos[I].Codigo)
      .ByName('COD_EMPRESA_FILTRO', AEmpresaId)
      .Build();

  FConnection.ExecuteBatch(SQL_INSERIR_PROCESSO_AUSENTE, ParamsList);
end;

end.
