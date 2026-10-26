(*
  Arquivo exclusivo Delphi com ACBR
*)
unit NFSeComACBrUseCaseBaseUnit;

interface

uses
  BaseUseCaseUnit, ResultadoOperacaoDFeUnit, ResultadoExecucaoTransmissaoDFeOutputUnit,
  INFSeRepositoryUnit, ConfiguracaoNFSeServiceUnit, IErrorLoggerUnit, IACBrNFSeAdapterUnit, INFSeConverterUnit,
  IConfiguracaoNFSeServiceUnit, IEmpresasRepositoryUnit, IProgressObserverUnit, IDataBaseConnectionUnit,
  IAtualizarSituacaoNFSeServiceUnit, ITributosDFeRepositoryUnit;

type
  NFSeComACBrUseCaseClean = class(TInterfacedBaseUseCase)
  protected
    FNFSeRepo: INFSeRepository;
  protected
    function RetornarFalhaSalva(const NFSeId: string; EmpresaId: Integer; const Falha: string): ResultadoOperacaoDFe;

    function RetornarTransmissaoFalhaSalva(
      const NFSeId: string; EmpresaId: Integer; const Falha: string
    ): ResultadoExecucaoTransmissaoDFeOutput;

    function RetornarFalhaNaoTratada(): ResultadoExecucaoTransmissaoDFeOutput;
    function RetornarSucesso(SucessoAutorizacao: Boolean): ResultadoExecucaoTransmissaoDFeOutput;
  end;

  NFSeComACBrUseCaseBase = class(NFSeComACBrUseCaseClean)
  protected
    FTributosDFeRepo: ITributosDFeRepository;
    FEmpresasRepo: IEmpresasRepository;
    FConfNFSe: IConfiguracaoNFSeService;
    FAtualizarSituacaoService: IAtualizarSituacaoNFSeService;
    FACBr: IACBrNFSeAdapter;
    FNFSeConverter: INFSeConverter;
    FLogError: IErrorLogger;
    FObserver: IProgressObserver;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      EmpresasRepo: IEmpresasRepository;
      ConfNFSe: IConfiguracaoNFSeService;
      AtualizarSituacaoService: IAtualizarSituacaoNFSeService;
      ACBr: IACBrNFSeAdapter;
      NFSeConverter: INFSeConverter;
      LogError: IErrorLogger;
      Observer: IProgressObserver
    ); virtual;
  end;

implementation

{ NFSeComACBrUseCaseBase }

uses
  NFSeHistoricoTypesUnit;

constructor NFSeComACBrUseCaseBase.Create(
  Connection: IDataBaseConnection;
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  EmpresasRepo: IEmpresasRepository;
  ConfNFSe: IConfiguracaoNFSeService;
  AtualizarSituacaoService: IAtualizarSituacaoNFSeService;
  ACBr: IACBrNFSeAdapter;
  NFSeConverter: INFSeConverter;
  LogError: IErrorLogger;
  Observer: IProgressObserver
);
begin
  FConnection               := Connection;
  FNFSeRepo                 := NFSeRepo;
  FTributosDFeRepo          := TributosDFeRepo;
  FEmpresasRepo             := EmpresasRepo;
  FConfNFSe                 := ConfNFSe;
  FAtualizarSituacaoService := AtualizarSituacaoService;
  FACBr                     := ACBr;
  FNFSeConverter            := NFSeConverter;
  FLogError                 := LogError;
  FObserver                 := Observer;
end;

{ NFSeComACBrUseCaseClean }

function NFSeComACBrUseCaseClean.RetornarFalhaNaoTratada: ResultadoExecucaoTransmissaoDFeOutput;
begin
  Result := ResultadoExecucaoTransmissaoDFeOutput.Create( ResultadoOperacaoDFe.rodFalhaNaoTratada, False );
end;

function NFSeComACBrUseCaseClean.RetornarFalhaSalva(const NFSeId: string; EmpresaId: Integer;
  const Falha: string): ResultadoOperacaoDFe;
begin
  FNFSeRepo.PutNFSeHistorico( NFSeUltimoHistoricoModel.Create( NFSeId, EmpresaId, Falha ));
  Result := ResultadoOperacaoDFe.rodFalhaRegistrada;
end;

function NFSeComACBrUseCaseClean.RetornarTransmissaoFalhaSalva(const NFSeId: string; EmpresaId: Integer;
  const Falha: string): ResultadoExecucaoTransmissaoDFeOutput;
begin
  Result := ResultadoExecucaoTransmissaoDFeOutput.Create(
    Self.RetornarFalhaSalva(NFSeId, EmpresaId, Falha),
    False
  );
end;

function NFSeComACBrUseCaseClean.RetornarSucesso(SucessoAutorizacao: Boolean): ResultadoExecucaoTransmissaoDFeOutput;
begin
  Result := ResultadoExecucaoTransmissaoDFeOutput.Create( ResultadoOperacaoDFe.rodOK, SucessoAutorizacao );
end;

end.
