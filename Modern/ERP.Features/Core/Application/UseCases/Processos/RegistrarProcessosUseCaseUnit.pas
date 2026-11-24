unit RegistrarProcessosUseCaseUnit;

interface

uses
  IConfiguracoesRepositoryUnit,
  IDataBaseConnectionUnit,
  IProcessosProviderUnit,
  IProcessosRepositoryUnit,
  ProcessoAtualizacaoModelUnit;

type
  IRegistrarProcessosUseCase = interface
    ['{8687C99F-B4A1-4670-A526-18AF390A16EA}']
    procedure Executar(AEmpresaId: Integer);
  end;

  RegistrarProcessosUseCase = class(TInterfacedObject, IRegistrarProcessosUseCase)
  private
    FConnection: IDataBaseConnection;
    FProcessosRepo: IProcessosRepository;
    FConfiguracoesRepo: IConfiguracoesRepository;
    FProcessosProvider: IProcessosProvider;
    procedure ValidarRepetidos(const AProcessos: ProcessoModelArray);
  public
    constructor Create(AConnection: IDataBaseConnection; AProcessosRepo: IProcessosRepository;
      AConfiguracoesRepo: IConfiguracoesRepository;
      AProcessosProvider: IProcessosProvider);
    procedure Executar(AEmpresaId: Integer);
  end;

implementation

uses
  Classes, SysUtils,
  EValidacaoNegocioUnit, ITransactionUnit;

const
  CHAVE_VERSAO_PROCESSOS = 'next_processos_versao';

{ RegistrarProcessosUseCase }

constructor RegistrarProcessosUseCase.Create(AConnection: IDataBaseConnection;
  AProcessosRepo: IProcessosRepository; AConfiguracoesRepo: IConfiguracoesRepository;
  AProcessosProvider: IProcessosProvider);
begin
  FConnection := AConnection;
  FProcessosRepo := AProcessosRepo;
  FConfiguracoesRepo := AConfiguracoesRepo;
  FProcessosProvider := AProcessosProvider;
end;

procedure RegistrarProcessosUseCase.ValidarRepetidos(
  const AProcessos: ProcessoModelArray);
var
  CodigosProcessos: TStringList;
  Processo: ProcessoModel;
  I: Integer;
begin
  CodigosProcessos := TStringList.Create();
  try
    CodigosProcessos.CaseSensitive := False;
    CodigosProcessos.Sorted := True;

    for I := 0 to High(AProcessos) do
    begin
      Processo := AProcessos[I];

      if CodigosProcessos.IndexOf(Processo.Codigo) >= 0 then
        raise Exception.CreateFmt('O processo %s está repetido no catálogo de processos Next.', [Processo.Codigo]);
      CodigosProcessos.Add(Processo.Codigo);
    end;
  finally
    CodigosProcessos.Free();
  end;
end;

procedure RegistrarProcessosUseCase.Executar(AEmpresaId: Integer);
var
  Transacao: ITransaction;
  PendentesAtualizacoes: AtualizacaoProcessosModel;
  Pendentes: ProcessoModelArray;
  VersaoArmazenada, VersaoRelida, UltimaVersao: Integer;
begin
  if AEmpresaId <= 0 then
    raise EValidacaoNegocio.Create('Empresa não informada para o registro de processos Next.');

  VersaoArmazenada := Round(FConfiguracoesRepo.ObterValorNumerico(
    CHAVE_VERSAO_PROCESSOS, AEmpresaId));

  PendentesAtualizacoes := FProcessosProvider.ObterPendentes(VersaoArmazenada);
  if Length(PendentesAtualizacoes.Processos) = 0 then
    Exit;

  UltimaVersao := PendentesAtualizacoes.UltimaVersao;
  if UltimaVersao <= VersaoArmazenada then
    Exit;

  Pendentes := PendentesAtualizacoes.Processos;

  ValidarRepetidos(Pendentes);

  Transacao := FConnection.BeginTransaction();
  try
    try
      if not FConfiguracoesRepo.ReivindicarValorNumerico(CHAVE_VERSAO_PROCESSOS,
        AEmpresaId, VersaoArmazenada, UltimaVersao) then
      begin
        VersaoRelida := Round(FConfiguracoesRepo.ObterValorNumerico(
          CHAVE_VERSAO_PROCESSOS, AEmpresaId));

        if VersaoRelida < UltimaVersao then
          raise EValidacaoNegocio.Create(
            'A versão dos processos Next foi alterada por outra estação. Tente novamente.');

        Transacao.Commit();
        Exit;
      end;

      FProcessosRepo.InserirAusentes(Pendentes, AEmpresaId);
      Transacao.Commit();
    except
      Transacao.Rollback();
      raise;
    end;
  finally
    Transacao.FreeTransaction();
  end;
end;

end.
