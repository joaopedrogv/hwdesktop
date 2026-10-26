unit EmitirNFSeServiceUnit;

interface

uses
  IEmitirNFSeServiceUnit,
  ISessionContextUnit,
  INFSeRepositoryUnit,
  EmitirNFSeCommandUnit,
  EmissaoLoteNFSeOutputUnit,
  EmitirLoteNFSeCommandUnit,
  ValidacaoOutputUnit,
  ResultadoOperacaoDFeUnit;

type
  EmitirNFSeService = class(TInterfacedObject, IEmitirNFSeService)
  private
    FSession: ISessionContext;
    FNFSeRepo: INFSeRepository;
    FValidacoes: ValidacaoOutput;

    function MontarResposta(
      const Input: EmitirLoteNFSeCommand; const ResultadosDFe: ResultadoOperacaoDFeArray
    ): EmissaoLoteNFSeOutput;
  public
    constructor Create(
      Session: ISessionContext;
      NFSeRepo: INFSeRepository
    );
    function Consultar(const Input: EmitirNFSeCommand): ResultadoOperacaoDFe;
    function Emitir(const Input: EmitirNFSeCommand): ResultadoOperacaoDFe; overload;
    function Emitir(const Input: EmitirLoteNFSeCommand): EmissaoLoteNFSeOutput; overload;
  end;

implementation

uses
  SysUtils, StrUtils,
  DFeDLLAdapterUnit, TipoComunsUnit, StringServiceUnit, NFSeResumoModelUnit, ValidacaoItemOutputUnit,
  CodigosErroValidacao, NFSeTypesUnit, DFeDLLHeader;

{ EmitirNFSeService }

function EmitirNFSeService.Consultar(const Input: EmitirNFSeCommand): ResultadoOperacaoDFe;
var
  emissaoResult: ResultadoOperacaoDFe;
  calls: DFeDLLFeatureSet;
begin
  calls := [ dftConsultar ];

  if not Input.Silent then
    calls := calls + [ dftImprimir ];

  if Input.Email <> '' then
    calls := calls + [ dftEmail ];

  emissaoResult := DFeDLLAdapter.CallFeaturesNFSe( DFeDLLAdapter.InputNFSe(
    Input.Id,
    Input.EmpresaId,
    Input.Silent,
    calls,
    '',
    Input.Email
  ));


  Result := emissaoResult;
end;

constructor EmitirNFSeService.Create(
  Session: ISessionContext;
  NFSeRepo: INFSeRepository
);
begin
  FSession := Session;
  FNFSeRepo := NFSeRepo;
end;

function EmitirNFSeService.Emitir(const Input: EmitirNFSeCommand): ResultadoOperacaoDFe;
var
  emissaoResult: ResultadoOperacaoDFeArray;
begin
  emissaoResult := DFeDLLAdapter.CallEmitirLoteNFSe( DFeDLLAdapter.InputLoteNFSe(
    Input.Id,
    Input.EmpresaId,
    Input.Silent,
    Input.Email
  ));

  if Length(emissaoResult) = 0 then
    Result := rodFalhaNaoTratada
  else
    Result := emissaoResult[0];
end;

function EmitirNFSeService.Emitir(const Input: EmitirLoteNFSeCommand): EmissaoLoteNFSeOutput;
var
  emissaoResult: ResultadoOperacaoDFeArray;
  emails: TArrayString;
  I: Integer;
begin
  FValidacoes := ValidacaoOutput.Create();

  I := Length(Input.Emails);
  SetLength(emails, I );
  if I > 0 then
    emails := Copy(Input.Emails, 0, I);

  for I := 0 to High(emails) do
    emails[I] := StringReplace(emails[I], ';', ',', [rfReplaceAll]);

  emissaoResult := DFeDLLAdapter.CallEmitirLoteNFSe( DFeDLLAdapter.InputLoteNFSe(
    StringService.Join( ';', Input.NFSeIDs ),
    Input.EmpresaId,
    Input.Silent,
    StringService.Join( ';', emails )
  ));

  Result := MontarResposta( Input, emissaoResult );
end;

function EmitirNFSeService.MontarResposta(
  const Input: EmitirLoteNFSeCommand; const ResultadosDFe: ResultadoOperacaoDFeArray
): EmissaoLoteNFSeOutput;
var
  TotalNotasCriadas, TotalNotasAutorizadas, TotalEmEmissao, TotalNotasRejeitadas, TotalFalhaRegistradas,
  TotalFalhasNaoTratadas: Integer;
  I, CountPDF: Integer;
  ArquivosPDF, NFSeIDSAutorizadas: TArrayString;
  SitNFSes: NFSeSitacaoModelArray;
  sFileName: string;
begin
  SitNFSes := FNFSeRepo.ListarSituacaoNFSes( Input.NFSeIds, Input.EmpresaId );

  TotalNotasCriadas := Length(Input.NFSeIDs);
  TotalNotasAutorizadas := 0;
  TotalEmEmissao := 0;
  TotalNotasRejeitadas := 0;
  TotalFalhaRegistradas := 0;
  TotalFalhasNaoTratadas := 0;
  CountPDF := 0;

  if Length(ResultadosDFe) = 0 then
  begin
    FValidacoes.Add( ValidacaoItemOutput.CreateFmt(
      ECOD_VALIDACAO_GENERICA,
      'Total de Notas criadas: %d. ' + sLineBreak +
      'Você terá mais detalhes acessando individualmente cada nota criada. ' + sLineBreak + sLineBreak +
      'Erro de execução no processamento em lote. Todos os erros foram registrados no log. ' + sLineBreak +
      'Por favor contacte o suporte ténico se essa mensagem persistir.',
      [Length(Input.NFSeIDs)]
    ));

    EmissaoLoteNFSeOutput.Create( Input.NFSeIDs, FValidacoes, Length(Input.NFSeIDs) );
  end;

  SetLength(NFSeIDSAutorizadas, TotalNotasCriadas);

  for I := 0 to High(SitNFSes) do
    if SitNFSes[I].Situacao = sdpsAutorizada then
    begin
      NFSeIDSAutorizadas[TotalNotasAutorizadas] := SitNFSes[I].Id;
      Inc(TotalNotasAutorizadas);
    end
    else if SitNFSes[I].Situacao in [ sdpsEmissao, sdpsEmProcessamento ] then
      Inc(TotalEmEmissao)
    else if SitNFSes[I].Situacao = sdpsRejeicao then
      Inc(TotalNotasRejeitadas);

  for I := 0 to High(ResultadosDFe) do
    if ResultadosDFe[I] = rodFalhaRegistrada then
      Inc(TotalFalhaRegistradas)
    else if ResultadosDFe[I] = rodFalhaNaoTratada then
      Inc(TotalFalhasNaoTratadas);

  for I := 0 to High(Input.NFSeIDs) do
  begin
    sFileName := Format('%s%s.pdf', [ FSession.TemporaryFolder, Input.NFSeIDs[I] ]);
    if FileExists( sFileName ) then
    begin
      if CountPDF >= Length(ArquivosPDF) then
        SetLength(ArquivosPDF, Length(ArquivosPDF) + 10);

      ArquivosPDF[CountPDF] := sFileName;
      Inc(CountPDF);
    end;
  end;

  SetLength(ArquivosPDF, CountPDF);
  SetLength(NFSeIDSAutorizadas, TotalNotasAutorizadas);

  Result := EmissaoLoteNFSeOutput.Create(
    Input.NFSeIDs,
    FValidacoes,
    TotalNotasCriadas,
    TotalNotasAutorizadas,
    TotalEmEmissao,
    TotalNotasRejeitadas,
    TotalFalhaRegistradas,
    TotalFalhasNaoTratadas,
    ArquivosPDF,
    NFSeIDSAutorizadas
  );
end;

end.
