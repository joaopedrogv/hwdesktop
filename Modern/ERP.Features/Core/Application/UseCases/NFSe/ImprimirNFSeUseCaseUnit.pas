(*
  Arquivo exclusivo Delphi com ACBR
*)
unit ImprimirNFSeUseCaseUnit;

interface

uses
  NFSeComACBrUseCaseBaseUnit, ResultadoOperacaoDFeUnit;

type

  IImprimirNFSeUseCase = interface
    ['{BA5F6261-C1B1-430B-886E-56CB7EC73339}']
    function Executar(const NFSeId: string; EmpresaId: Integer): ResultadoOperacaoDFe;
  end;

  ImprimirNFSeUseCase = class(NFSeComACBrUseCaseBase, IImprimirNFSeUseCase)
  private
  public
    function Executar(const NFSeId: string; EmpresaId: Integer): ResultadoOperacaoDFe;
  end;

implementation

uses
  SysUtils,
  ConfiguracaoNFSeModelUnit, NFSeTypesUnit, EmpresaEtdUnit, WebServiceResponseTypesUnit, NFSeEtdUnit,
  StringNullableUnit, DateAndTimeNullableUnit, NFSeResumoModelUnit, ITransactionUnit, DFeTypesUnit;

{ ImprimirNFSeUseCase }

function ImprimirNFSeUseCase.Executar(const NFSeId: string; EmpresaId: Integer): ResultadoOperacaoDFe;
var
  confNFSe: ConfiguracaoNFSeModel;
  empresa: EmpresaEtd;
  resumoNFSe: NFSeResumoModel;
  resposta: WSResposta;
  transaction: ITransaction;
  pdfFile: string;
begin
  FObserver.OnStart();
  transaction := FConnection.BeginTransaction();
  try try
    FObserver.OnMessage('Preparando DPS/NFSe para impressão');

    resumoNFSe := FNFSeRepo.GetResumoNFSe( NFSeId, [ tdocXmlAutorizacao ]);

    if resumoNFSe.Id.IsEmpty then
    begin
      Result := RetornarFalhaSalva( NFSeId, EmpresaId, HIST_DOC_NAO_ENCONTRADO );
      Exit;
    end;

    if not ( resumoNFSe.Situacao in [ sdpsAutorizada, sdpsCancelada, sdpsSubstituida ]) then
    begin
      Result := RetornarFalhaSalva( NFSeId, EmpresaId, HIST_SITUACAO_NAO_PERMITIDA );
      Exit;
    end;

    if resumoNFSe.Documento[tdocXmlAutorizacao].IsNullOrWhiteSpace() then
    begin
      Result := RetornarFalhaSalva( NFSeId, EmpresaId, HIST_XML_NAO_ENCONTRADO );
      Exit;
    end;

    confNFSe := FConfNFSe.Executar( EmpresaId ); // Pode usar o cache
    empresa := FEmpresasRepo.GetByKey( EmpresaId ); // Pode usar o cache

    if empresa = nil then
      raise Exception.Create('Empresa = nil');

    // Configuracao e alimentacao Adapter ACBr
    FACBr.Configurar( confNFSe, empresa );

    FObserver.OnMessage('Iniciando processo de impressão');

    FACBr.Imprimir(
      resumoNFSe.Documento[tdocXmlAutorizacao].Value ,
      resumoNFSe.Situacao in [ sdpsCancelada, sdpsSubstituida ],
      confNFSe.WebService.EnvioEmProducao
    );

    Result := rodOK;

    FObserver.OnComplete();

  except on E: Exception do
    begin
      Result := rodFalhaNaoTratada;
      FLogError.LogError( 'ImprimirNFSeUseCase.Executar - DpsId: %s - Empresa: %d - Erro: %s', [ NFSeId, EmpresaId, E.Message ]);
      FObserver.OnError( 'Falha no processo. Consulte o log para detalhes' );
    end;
  end;
  finally
    transaction.Commit();
    empresa.Free();
    transaction.Free();
  end;
end;

end.

