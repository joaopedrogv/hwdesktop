unit CriarAnexosEmailUseCaseUnit;

interface

uses
  ICriarAnexosEmailUseCaseUnit, TipoComunsUnit, INFSeRepositoryUnit, ISessionContextUnit;

type
  CriarAnexosEmailUseCase = class(TInterfacedObject, ICriarAnexosEmailPorOSUseCase, ICriarAnexosEmailPorNFSeIDsUseCase)
  private
    FSession: ISessionContext;
    FNFSeRepo: INFSeRepository;
  public
    constructor Create(
      Session: ISessionContext;
      NFSeRepo: INFSeRepository
    );
    function Executar(NumeroOS: Integer): TArrayString; overload;
    function Executar(const NFSeIDs: TArrayString; ComPDF: Boolean): TArrayString; overload;
  end;

implementation

{ CriarAnexosEmailUseCase }

uses
  SysUtils, Classes,
  NFSeOSEtdUnit, EValidacaoNegocioUnit, NFSeResumoModelUnit, NFSeTypesUnit, ResultadoOperacaoDFeUnit, DFeDLLAdapterUnit,
  DFeDLLHeader, StringNullableUnit, StringServiceUnit;

procedure SalvarArquivo(const FileName, Conteudo: string);
var
  FS: TFileStream;
begin
  FS := TFileStream.Create(FileName, fmCreate);
  try
    FS.WriteBuffer(Conteudo[1], Length(Conteudo));
  finally
    FS.Free();
  end;
end;

constructor CriarAnexosEmailUseCase.Create(Session: ISessionContext; NFSeRepo: INFSeRepository);
begin
  FSession := Session;
  FNFSeRepo := NFSeRepo;
end;

function CriarAnexosEmailUseCase.Executar(NumeroOS: Integer): TArrayString;
var
  NFOSs: NFSeOSEtdList;
  NFResumo: NFSeResumoModel;
  I, iResult: Integer;
  NFSeId, FileName, Prefix: string;
  resultDLL: ResultadoOperacaoDFe;
  doc: StringNullable;
begin
  NFOSs := FNFSeRepo.ListarRelacionamento( NumeroOS );
  try
    if NFOSs.Count = 0 then
      raise EValidacaoNegocio.Create('Nenhum relacionamento encontrado com a O.S. informada');

    iResult := 0;
    SetLength(Result, NFOSs.Count * 3);
    for I := 0 to NFOSs.Count - 1 do
    begin
      NFSeId := NFSeOSEtd(NFOSs.Items[I]).NFSeId;

      NFResumo := FNFSeRepo.GetResumoNFSe( NFSeId, [ tdocXmlAutorizacao, tdocXmlCancAutorizacao ] );

      if not NFResumo.Chave.IsNullOrWhiteSpace then
        Prefix := NFResumo.Chave.Value
      else
        Prefix := IntToStr(NFResumo.NDps.Value);

      if NFResumo.Situacao in [ sdpsAutorizada, sdpsCancelada, sdpsSubstituida ] then
      begin
        doc := NFResumo.Documento[tdocXmlAutorizacao];
        if not doc.IsNullOrWhiteSpace then
        begin
          FileName := Format('%s%s-nfse.xml', [ FSession.TemporaryFolder, Prefix ]);
          SalvarArquivo( FileName, doc.Value );
          Result[iResult] := FileName;
          Inc(iResult);
        end;

        doc := NFResumo.Documento[tdocXmlCancAutorizacao];
        if not doc.IsNullOrWhiteSpace then
        begin
          FileName := Format('%s%s-canc-nfse.xml', [ FSession.TemporaryFolder, Prefix ]);
          SalvarArquivo( FileName, doc.Value );
          Result[iResult] := FileName;
          Inc(iResult);
        end;

        FileName := Format('%s%s-nfse.pdf', [ FSession.TemporaryFolder, Prefix ]);
        DFeDLLAdapter.CallFeaturesNFSe(
          DFeDLLAdapter.InputNFSe( NFSeId, FSession.EmpresaId, True, [ dftSalvarPDF ], FileName )
        );
        if FileExists(FileName) then
        begin
          Result[iResult] := FileName;
          Inc(iResult);
        end;
      end;
    end;

    SetLength(Result, iResult);

  finally
    NFOSs.Free();
  end;
end;

function CriarAnexosEmailUseCase.Executar(const NFSeIDs: TArrayString; ComPDF: Boolean): TArrayString;
begin
  Result := DFeDLLAdapter.CallCriarAnexos(
    DFeDLLAdapter.InputAnexosNFSe( StringService.Join(';', NFSeIDs), FSession.EmpresaId, ComPDF, True )
  );
end;

end.
