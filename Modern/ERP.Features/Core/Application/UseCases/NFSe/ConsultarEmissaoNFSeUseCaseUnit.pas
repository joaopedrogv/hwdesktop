unit ConsultarEmissaoNFSeUseCaseUnit;

interface

uses
  EmitirNFSeInputUnit, ResultadoNFSeOutputUnit, IEmitirNFSeServiceUnit, IDataBaseConnectionUnit,
  IPrepararNFSeParaEmissaoServiceUnit, EmissaoLoteNFSeOutputUnit, INFSeRepositoryUnit, ITributosDFeRepositoryUnit,
  IClientesRepositoryUnit, IConfiguracaoNFSeServiceUnit, ValidacaoOutputUnit, NFSeEtdUnit, ConfiguracaoNFSeModelUnit,
  EValidacaoNegocioUnit;

type
  IConsultarEmissaoNFSeUseCase = interface
    ['{A12D4BC8-2C76-48DF-9CDC-204CD879BFC6}']
    function Executar(const Input: EmitirNFSeInput): ResultadoNFSeOutput; overload;
  end;

  ConsultarEmissaoNFSeUseCase = class(TInterfacedObject, IConsultarEmissaoNFSeUseCase)
  private
    FNFSeRepo: INFSeRepository;
    FTributosDFeRepo: ITributosDFeRepository;
    FEmitirNFSe: IEmitirNFSeService;
  public
    constructor Create(
      NFSeRepo: INFSeRepository;
      TributosDFeRepo: ITributosDFeRepository;
      EmitirNFSe: IEmitirNFSeService
    );
    function Executar(const Input: EmitirNFSeInput): ResultadoNFSeOutput; overload; 
  end;

implementation

uses
  SysUtils, StrUtils, DateUtils,
  ITransactionUnit, IEntityValidatorUnit, NFSeModelUnit, TributoDFeContextEtdUnit, ClienteEtdUnit, TipoComunsUnit,
  ResultadoOperacaoDFeUIMessagesUnit, ResultadoOperacaoDFeUnit, NFSeTypesUnit, EntityValidatorFactoryUnit,
  ValidationEntityOutputUnit, ValidacaoNFSeFactoryUnit, NFSeAtualizarSituacaoTypesUnit, EmitirNFSeCommandUnit,
  TributoDFeOrigemEnumUnit, StringServiceUnit, EmitirLoteNFSeCommandUnit, NFSeResumoModelUnit;

{ ConsultarEmissaoNFSeUseCase }

constructor ConsultarEmissaoNFSeUseCase.Create(
  NFSeRepo: INFSeRepository;
  TributosDFeRepo: ITributosDFeRepository;
  EmitirNFSe: IEmitirNFSeService
);
begin
  FNFSeRepo := NFSeRepo;
  FTributosDFeRepo := TributosDFeRepo;
  FEmitirNFSe := EmitirNFSe;
end;

function ConsultarEmissaoNFSeUseCase.Executar(const Input: EmitirNFSeInput): ResultadoNFSeOutput;
var
  validacoes: ValidationEntityOutput;
  NFSe: NFSeEtd;
  NFSeOut: NFSeModel;
  emitResponseCode: ResultadoOperacaoDFe;
  EmailTomador: string;
begin
  Validacoes := ValidationEntityOutput.Create();
  try
    NFSe := FNFSeRepo.GetNFSe( Input.Id, Input.EmpresaId );

    if NFSe.Id = '' then
    begin
      Validacoes.Add('Id', 'Nenhuma NFSe encontrada com ID informado');
      Result := ResultadoNFSeOutput.Create( Validacoes );
      Exit;
    end;

    // Casos que não precisam de validação (já autorizada ou em processo de emissao)
    if not (NFSe.Situacao in [sdpsEmissao, sdpsEmProcessamento, sdpsAutorizada]) then
    begin
      Validacoes.Add('Situacao', 'NFSe não possúi uma situação que possa ser consultada');
      Result := ResultadoNFSeOutput.Create( Validacoes );
      Exit;
    end;

    EmailTomador := '';
    // Nao envia email se ja estava autorizada antes
    if (NFSe.Situacao <> sdpsAutorizada) and NFSe.CodCliente.HasValue then
      EmailTomador := StringService.Join(',', NFSe.ParticipantePrincipal.ListaEmails );

    emitResponseCode := FEmitirNFSe.Consultar(EmitirNFSeCommand.Create(
      Input.Id,
      Input.EmpresaId,
      Input.Silent,
      EmailTomador
    ));

    NFSeOut := nil;
    case emitResponseCode of
      rodOK:
        NFSeOut := NFSeModel.Create(
          FNFSeRepo.GetNFSe(Input.Id, Input.EmpresaId),
          FTributosDFeRepo.GetById(Input.Id, tdfoNFSe)
        );

      rodFalhaRegistrada, rodFalhaNaoTratada:
          validacoes.Add( 'Id', ResultadoOperacaoDFeMessage[emitResponseCode]);

      else
        raise Exception.Create('ConsultarEmissaoNFSeUseCase.Executar Retorno não tratado');
    end;

    Result := ResultadoNFSeOutput.Create( validacoes, NFSeOut );

  finally
    NFSe.Free();
  end;
end;

end.
