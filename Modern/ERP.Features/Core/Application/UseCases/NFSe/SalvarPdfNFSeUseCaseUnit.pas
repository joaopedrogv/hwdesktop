(*
  Arquivo exclusivo Delphi com ACBR
*)
unit SalvarPdfNFSeUseCaseUnit;

interface

uses
  NFSeComACBrUseCaseBaseUnit, ResultadoOperacaoDFeUnit;

type
  ISalvarPdfNFSeUseCase = interface
    ['{F0260557-5A77-47B5-A260-427B8704C90B}']
    function Executar(const NFSeId: string; EmpresaId: Integer; const PdfFileName: string): ResultadoOperacaoDFe;
  end;

  SalvarPdfNFSeUseCase = class(NFSeComACBrUseCaseBase, ISalvarPdfNFSeUseCase)
  public
    function Executar(const NFSeId: string; EmpresaId: Integer; const PdfFileName: string): ResultadoOperacaoDFe;
  end;

implementation

uses
  SysUtils, IOUtils, Math,
  ConfiguracaoNFSeModelUnit, NFSeTypesUnit, EmpresaEtdUnit, WebServiceResponseTypesUnit, NFSeEtdUnit,
  StringNullableUnit, DateAndTimeNullableUnit, NFSeDocModelUnit, NFSeResumoModelUnit, ITransactionUnit, DFeTypesUnit;

{ SalvarPdfNFSeUseCase }

function SalvarPdfNFSeUseCase.Executar(
  const NFSeId: string;
  EmpresaId: Integer;
  const PdfFileName: string
): ResultadoOperacaoDFe;
var
  confNFSe: ConfiguracaoNFSeModel;
  empresa: EmpresaEtd;
  resumoNFSe: NFSeResumoModel;
  resposta: WSResposta;
  transaction: ITransaction;
  pdfOut: string;
  tpAmb: TipoAmbienteEnum;
begin
  FObserver.OnStart();
  transaction := FConnection.BeginTransaction();
  try try
    FObserver.OnMessage('Preparando DPS/NFSe');

    resumoNFSe := FNFSeRepo.GetResumoNFSe( NFSeId, [ tdocXmlAutorizacao ]);

    if resumoNFSe.Id.IsEmpty() then
    begin
      Result := RetornarFalhaSalva( NFSeId, EmpresaId, HIST_DOC_NAO_ENCONTRADO );
      Exit;
    end;

    if not ( resumoNFSe.Situacao in [ SituacaoNFSeEnum.sdpsAutorizada, SituacaoNFSeEnum.sdpsCancelada  ]) then
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

    FACBr.Configurar( confNFSe, empresa );

    FObserver.OnMessage('Preparando impressão');

    case resumoNFSe.TpAmb of
      tpaProducao, tpaHomologacao:
        tpAmb := resumoNFSe.TpAmb;

      else
        tpAmb := TipoAmbienteEnum(IfThen(confNFSe.WebService.EnvioEmProducao, Ord(tpaProducao), Ord(tpaHomologacao)));
    end;

    FACBr.SalvarPDF(
      resumoNFSe.Documento[tdocXmlAutorizacao].Value,
      resumoNFSe.Situacao in [ sdpsCancelada, sdpsSubstituida ],
      tpAmb = tpaProducao,
      pdfOut
    );

    if not String.IsNullOrWhiteSpace(pdfOut)
      and TFile.Exists(pdfOut) then
      TFile.Move( pdfOut, PdfFileName );

    Result := rodOK;

    FObserver.OnComplete();

  except on E: Exception do
    begin
      Result := rodFalhaNaoTratada;
      FLogError.LogError( 'SalvarPdfNFSeUseCase.Executar - DpsId: %s - Empresa: %d - Erro: %s', [ NFSeId, EmpresaId, E.Message ]);
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
