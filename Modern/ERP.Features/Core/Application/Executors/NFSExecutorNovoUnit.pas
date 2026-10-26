unit NFSExecutorNovoUnit;

interface

uses
  INFSExecutorUnit, ISessionContextUnit, ICriarEmitirNFSeAgrupadasUseCaseUnit, ICriarAnexosEmailUseCaseUnit,
  TipoComunsUnit, INFSeRepositoryUnit;

type
  NFSExecutorNovo = class(TInterfacedObject, INFSExecutor)
  private
    FSession: ISessionContext;
    FNFSeRepo: INFSeRepository;
    FEmitirUseCase: ICriarEmitirNFSeAgrupadasUseCase;
    FCriardorAnexosUseCase: ICriarAnexosEmailPorOSUseCase;
  public
    constructor Create(
      Session: ISessionContext;
      NFSeRepo: INFSeRepository;
      EmitirUseCase: ICriarEmitirNFSeAgrupadasUseCase;
      CriadorAnexosUseCase: ICriarAnexosEmailPorOSUseCase
    );

    function PodeExecutar(const Context: NFSExecutorContext): Boolean;
    function Emitir(const Context: NFSExecutorContext): INFSExecutorResult;
    function CriarAnexosEmail(const Context: NFSExecutorContext): TArrayString;
  end;

implementation

uses
  SysUtils, CriarNFSeAgrupadasInputUnit, EmissaoLoteNFSeOutputUnit, NFSeHistoricoEtdUnit, NFSeTypesUnit,
  NFSeResumoModelUnit;

function NFSExecutorNovo.PodeExecutar(const Context: NFSExecutorContext): Boolean;
var
  existeRPS, existeNFSeId: Boolean;
  I: Integer;
begin
  existeRPS := False;
  for I := 0 to High(Context.NumerosRPS) do
    if Context.NumerosRPS[I] > 0 then
    begin
      existeRPS := True;
      Break;
    end;

  existeNFSeId := False;
  for I := 0 to High(Context.NFSeIDs) do
    if Trim(Context.NFSeIDs[I]) <> '' then
    begin
      existeNFSeId := True;
      Break;
    end;

  if existeRPS and not existeNFSeId then
    Result := False

  else if existeNFSeId then
    Result := True

  else
    Result := Context.EmissaLegadaDesativada;
end;

constructor NFSExecutorNovo.Create(
  Session: ISessionContext;
  NFSeRepo: INFSeRepository;
  EmitirUseCase: ICriarEmitirNFSeAgrupadasUseCase;
  CriadorAnexosUseCase: ICriarAnexosEmailPorOSUseCase
);
begin
  FSession := Session;
  FNFSeRepo := NFSeRepo;
  FEmitirUseCase := EmitirUseCase;
  FCriardorAnexosUseCase := CriadorAnexosUseCase;
end;

function NFSExecutorNovo.Emitir(const Context: NFSExecutorContext): INFSExecutorResult;
var
  OSNumeros: TArrayInteger;
  emitResult: EmissaoLoteNFSeOutput;
  rejeicao: NFSeHistoricoEtd;
  resumo: NFSeResumoModel;
  I: Integer;
begin
  SetLength(OSNumeros, 1);
  OSNumeros[0] := Context.NumeroOS;

  emitResult := nil;
  rejeicao := nil;
  Result.MensagemErro := '';
  try try
    emitResult := FEmitirUseCase.Executar(CriarNFSeAgrupadasInput.Create(
      OSNumeros,
      {Silent} Context.SendSilent,
      {Imprimir} not Context.SendSilent,
      {EnviarEmail} not Context.SendSilent,
      {CriarEmitir} True
    ));

    if emitResult = nil then
      raise Exception.Create('No response in FEmitirUseCase.Executar');

    for I := 0 to High(emitResult.NFSeIDs) do
    begin
      resumo := FNFSeRepo.GetResumoNFSe(emitResult.NFSeIDs[I]);

      if resumo.Situacao = sdpsRejeicao then
      begin
        rejeicao.Free();
        rejeicao := FNFSeRepo.GetLastHistorico(emitResult.NFSeIDs[I], thRejeicao);

        if (rejeicao <> nil) and not rejeicao.Descricao.IsNullOrWhiteSpace() then
          emitResult.Validacoes.Add('Número DPS %d - Rejeição: %s', [resumo.NDps.Value, rejeicao.Descricao.Value ]);
      end
      else if not (resumo.Situacao in [ sdpsAutorizada, sdpsCancelada, sdpsSubstituida ]) then
      begin
        rejeicao.Free();
        rejeicao := FNFSeRepo.GetLastHistorico(emitResult.NFSeIDs[I], thLogHistorico);

        if (rejeicao <> nil) and not rejeicao.Descricao.IsNullOrWhiteSpace() then
          emitResult.Validacoes.Add('Erro na tentativa de emissãO: ', [ rejeicao.Descricao.Value ])
        else
          emitResult.Validacoes.Add('Erro nao registrado na tentativa de emissão');
      end;
    end;

    if emitResult.Validacoes.IsValid then
      if (emitResult.TotalNotasRejeitadas > 0)
        or (emitResult.TotalFalhaRegistradas > 0)
        or (emitResult.TotalFalhasNaoTratadas > 0)
      then
        emitResult.Validacoes.Add('Houve falhas no processo e não conseguimos apresentar aqui. Por favor consulta a tela de NFSe e verifique o problema por lá');

    emitResult.Validacoes.RaiseIfNotIsValid();

  except on E: Exception do
    Result.MensagemErro := E.Message;
  end;
  finally
    emitResult.Free();
    rejeicao.Free();
  end;
end;

function NFSExecutorNovo.CriarAnexosEmail(const Context: NFSExecutorContext): TArrayString;
begin
  Result := FCriardorAnexosUseCase.Executar( Context.NumeroOS );
end;

end.
