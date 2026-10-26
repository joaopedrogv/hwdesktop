unit NFSExecutorCoordinatorUnit;

interface

uses
  INFSExecutorUnit, IConfiguracoesRepositoryUnit, TipoComunsUnit, IPedVendaRepositoryUnit, ArrayServiceUnit;

type

  INFSExecutorCoordinator = interface
    ['{B06148C9-152C-46E1-B6E8-814928D7992F}']
    function EmitirNFSe(NumeroOS: Integer; SemUI: Boolean ): INFSExecutorResult;
    function CriarAnexosEmail(NumeroOS: Integer): TArrayString;
  end;

  NFSExecutorCoordinator = class(TInterfacedObject, INFSExecutorCoordinator)
  private
    FConfigRepo: IConfiguracoesRepository;
    FOrdemServRepo: IPedVendaRepository;
    FExecutores: array[0..1] of INFSExecutor;

    function SelecionarExecutor(const Context: NFSExecutorContext): INFSExecutor;
    function GetNovaEmissaoAtiva(): Boolean;
    function CriarContexto(NumeroOS: Integer; NovaEmissaoAtiva: Boolean): NFSExecutorContext;
  public
    constructor Create(
      ConfiguracaoRepo: IConfiguracoesRepository;
      OrdemServRepo: IPedVendaRepository;
      ExecutorLegado: INFSExecutor;
      ExecutorNovo: INFSExecutor
    );
    destructor Destroy; override;

    function EmitirNFSe(NumeroOS: Integer; SemUI: Boolean): INFSExecutorResult;
    function CriarAnexosEmail(NumeroOS: Integer): TArrayString;
  end;

implementation

uses
  SysUtils, StrUtils,
  ConfiguracaoEtdUnit, ConfigFactoryUnit, DateTimeServiceUnit, OSItemFiscalEtdUnit;

constructor NFSExecutorCoordinator.Create(
  ConfiguracaoRepo: IConfiguracoesRepository;
  OrdemServRepo: IPedVendaRepository;
  ExecutorLegado: INFSExecutor;
  ExecutorNovo: INFSExecutor
);
begin
  FConfigRepo := ConfiguracaoRepo;
  FOrdemServRepo := OrdemServRepo;
  FExecutores[0] := ExecutorLegado; //  Tenta no primeiro
  FExecutores[1] := ExecutorNovo;
end;

function NFSExecutorCoordinator.SelecionarExecutor(
  const Context: NFSExecutorContext): INFSExecutor;
var
  Executor: INFSExecutor;
begin
  for Executor in FExecutores do
  begin
    if Executor.PodeExecutar(Context) then
    begin
      Result := Executor;
      Exit;
    end;
  end;

  // 3. Nenhum executor disponível
  raise Exception.Create('Nenhum executor disponível para esta OS');
end;

function NFSExecutorCoordinator.CriarContexto(NumeroOS: Integer; NovaEmissaoAtiva: Boolean): NFSExecutorContext;
var
  OSItens: OSItemFiscalEtdlList;
  iNF, iRPS, nRps: Integer;
  I: Integer;
  sNFS: string;
begin
  Result.NumeroOS := NumeroOS;
  Result.EmissaLegadaDesativada := NovaEmissaoAtiva;

  iRPS := 0;
  iNF := 0;

  OSItens := FOrdemServRepo.ListarItensFiscaisOS( ArrayService.MakeArrayInt(NumeroOS) );
  SetLength(Result.NumerosRPS, OSItens.Count);
  SetLength(Result.NFSeIDs, OSItens.Count);
  try

    for I := 0 to OSItens.Count - 1 do
    begin
      nRps := OSItens.Items[I].NumRPSLegado.Value;
      sNFS := OSItens.Items[I].NFSeId.Value;
      if nRps > 0 then
        if not ArrayService.Contains(Result.NumerosRPS, nRps) then
        begin
          Result.NumerosRPS[iRPS] := nRps;
          Inc(iRPS);
        end;
      if sNFS <> '' then
        if not MatchText(sNFS, Result.NFSeIDs ) then
        begin
          Result.NFSeIDs[iNF] := sNFS;
          Inc(iNF);
        end;
    end;
  finally
    OSItens.Free();
  end;

  SetLength(Result.NumerosRPS, iRPS);
  SetLength(Result.NFSeIDs, iNF);
end;

destructor NFSExecutorCoordinator.Destroy;
begin
  FExecutores[1] := nil;
  FExecutores[0] := nil;

  inherited;
end;

function NFSExecutorCoordinator.EmitirNFSe(NumeroOS: Integer; SemUI: Boolean): INFSExecutorResult;
var
  Context: NFSExecutorContext;
  Executor: INFSExecutor;
begin
  // Prepara contexto
  Context := CriarContexto( NumeroOS, GetNovaEmissaoAtiva() );
  Context.SendSilent := SemUI;

  // Seleciona executor
  Executor := SelecionarExecutor(Context);

  // Executa
  Result := Executor.Emitir(Context);

  // Log
  //FLogger.Info(Format('Emissão NFSe OS %d executada por %s',
   // [NumeroOS, GetEnumName(TypeInfo(TNFSExecutorTipo), Ord(Executor.GetTipo))]));
end;

function NFSExecutorCoordinator.CriarAnexosEmail(NumeroOS: Integer): TArrayString;
var
  Context: NFSExecutorContext;
  Executor: INFSExecutor;
begin
  // Prepara contexto
  Context := CriarContexto( NumeroOS, GetNovaEmissaoAtiva() );
  Context.SendSilent := True;

  // Seleciona executor
  Executor := SelecionarExecutor(Context);

  // Executa
  Result := Executor.CriarAnexosEmail(Context);
end;

function NFSExecutorCoordinator.GetNovaEmissaoAtiva: Boolean;
var
  config: ConfiguracaoEtd;
begin
  config := FConfigRepo.GetByKey('nfse_config');

  try
    Result := (config = nil) or config.ValorDateTime.HasValue; // Se tem data será a data programada da desativação
  finally
    config.Free();
  end;
end;

end.
