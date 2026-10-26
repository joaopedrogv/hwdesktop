unit ConverterNFeParaContingenciaUseCaseUnit;

interface

uses
  SysUtils, Classes,
  INotasFiscaisRepositoryUnit, IConfiguracoesRepositoryUnit;

type
  IConverterNFeParaContingenciaUseCase = interface
    ['{65481A50-B846-45B7-89C4-C5EB3E8CF14E}']
    procedure Executar(CodigoNF, EmpresaId: Integer);
  end;

  ConverterNFeParaContingenciaUseCase = class(TInterfacedObject, IConverterNFeParaContingenciaUseCase)
  private
    FNotasRepo: INotasFiscaisRepository;
    FConfigRepo: IConfiguracoesRepository;
  public
    constructor Create(
      NotasRepo: INotasFiscaisRepository;
      ConfigRepo: IConfiguracoesRepository
    );

    procedure Executar(CodigoNF, EmpresaId: Integer);
  end;

implementation

uses
  StrUtils, DateUtils,
  NotaFiscalResumoModelUnit, SituacaoNFeEnumUnit, TipoEmissaoNFeEnumUnit,
  FormatoImpressaoDANFeEnumUnit, NotaFiscalPendenciaSefEtdUnit, StatusResolucaoNFeSefEnumUnit,
  UpdateNotaFiscalConverterParaContingenciaCommandUnit, EValidacaoNegocioUnit, ConfigLegacyTypes, StringServiceUnit,
  ScalarResultUnit, DocumentoEletronicoEtdUnit, StringNullableUnit, TributoDFeContextEtdUnit,
  ConverterParaContingenciaResultUnit;

{ ConverterNFeParaContingenciaUseCase }

constructor ConverterNFeParaContingenciaUseCase.Create(
  NotasRepo: INotasFiscaisRepository;
  ConfigRepo: IConfiguracoesRepository
);begin  FNotasRepo := NotasRepo;  FConfigRepo := ConfigRepo;
end;

procedure ConverterNFeParaContingenciaUseCase.Executar(CodigoNF, EmpresaId: Integer);
var
  NotaFiscalResumo: NotaFiscalResumoModel;
  PendenciaSefaz: NotaFiscalPendenciaSefEtd;
  UpdateNota: UpdateNotaFiscalConverterParaContingenciaCommand;
  ConverterResult: ConverterParaContingenciaResult;
  DocEletronico: DocumentoEletronicoEtd;
  Tributos: TributoDFeContextEtdList;
  Config: ConfigLegacyData;
  ConfLegSet: ConfigLegacySet;
  ConfLegValues: ConfigLegacyArray;
  SC: ScalarResult;
  DhCont: TDateTime;
  XJustConst: string;
begin
  // !!! IMPORTANTE !!!!
  // A transacao deve ser controlada pelo chamador nesse caso de uso

  PendenciaSefaz := nil;
  DocEletronico := nil;
  NotaFiscalResumo := FNotasRepo.ObterNotaFiscalResumo(CodigoNF, EmpresaId);
  try

    if (NotaFiscalResumo.NfeTpemis = tenContingencia)
      or (NotaFiscalResumo.Tpimp <> fidSimplificadoTipo2)
      or (NotaFiscalResumo.SituacaoNfe <> stEnviando)
      or not ContainsText(NotaFiscalResumo.Descricaoerro.Value, 'ERRO HTTP:') then
      raise EValidacaoNegocio.Create('Requisitos para transformar NFe em contingência não atendidos');

    PendenciaSefaz := FNotasRepo.ObterNotaFiscalPendenciaSef(CodigoNF, EmpresaId);

    if PendenciaSefaz <> nil then
      raise Exception.Create('Já existe uma pendência para essa NFe');

    Config := FConfigRepo.GetLegacy([ceNFeDhEntCont,  ceNFeXJustCont]);

    SC := Config.GetScalar(ceNFeDhEntCont);
    DhCont := SC.AsDateTime;
    XJustConst := Config.GetString(ceNFeXJustCont);

    // Esse bloco deveria ser um servico talvez
    if (DhCont < NotaFiscalResumo.DhEmis.Value) and (DaysBetween(NotaFiscalResumo.DhEmis.Value, DhCont) > 30) then
    begin
      DhCont := IncMinute(Now,-1);
      XJustConst := StringService.Default(XJustConst, 'FALHA NA COMUNICACAO COM A SEFAZ');

      ConfLegValues[ceNFeDhEntCont] :=ScalarResult.FromDateTime(DhCont);
      ConfLegValues[ceNFeXJustCont] := ScalarResult.FromString(XJustConst);

      FConfigRepo.SaveLegacy(
        ConfigLegacyData.Create( [ceNFeDhEntCont,  ceNFeXJustCont], ConfLegValues)
      );
    end;
    
    UpdateNota := UpdateNotaFiscalConverterParaContingenciaCommand.Create(
      NotaFiscalResumo.CodNf,
      NotaFiscalResumo.CodEmpresa,
      NotaFiscalResumo.TpAmb,
      DhCont,
      XJustConst
    );

    ConverterResult := FNotasRepo.ConverterParaContingencia(UpdateNota);

    PendenciaSefaz := NotaFiscalPendenciaSefEtd.Create(
      NotaFiscalResumo.CodNf,
      NotaFiscalResumo.CodEmpresa,
      Now(),
      srsPendente,
      ConverterResult.NotaFiscalIdAInvalidar
    );

    FNotasRepo.InserirPendenciaSEFAZ(PendenciaSefaz);

  finally
    NotaFiscalResumo.Free();
    DocEletronico.Free();
    PendenciaSefaz.Free();
  end;
end;

end.
