unit SalvarConfiguracaoNFSeUseCaseUnit;

interface

uses
  BaseUseCaseUnit, SalvarConfigNFSeInputUnit, CreateEntityUseCaseOutputUnit,
  IConfiguracoesRepositoryUnit, IDataBaseConnectionUnit, ValidationEntityOutputUnit, ITokenEncryptorUnit;

type
  ISalvarConfiguracaoNFSeUseCase = interface
    ['{874062D6-82EF-47CD-946B-35D656849C3C}']
    function Executar( const Input: SalvarConfigNFSeInput ): ValidationEntityOutput;
  end;

  SalvarConfiguracaoNFSeUseCase = class(TInterfacedBaseUseCase,ISalvarConfiguracaoNFSeUseCase)
  private
    FConfigsRepo: IConfiguracoesRepository;
    FConnection: IDataBaseConnection;
    FTokenEncryptor: ITokenEncryptor;
  public
    constructor Create(
      Connection: IDataBaseConnection;
      ConfigsRepo: IConfiguracoesRepository;
      TokenEncryptor: ITokenEncryptor
    );

    function Executar( const Input: SalvarConfigNFSeInput ): ValidationEntityOutput;
  end;

implementation

uses
  SysUtils, Classes, StrUtils, Math, DateUtils,
  ConfiguracaoEtdUnit,
  ConfigLegacyTypes, StringServiceUnit, ConfigFactoryUnit, StringNullableUnit, NFSeTypesUnit, CurrencyNullableUnit,
  CertificadoDigitalConfigUnit, WebServiceDFeModelUnit, ScalarResultUnit, IEntityValidatorUnit,
  EntityValidatorFactoryUnit, IntegerNullableUnit, DoubleNullableUnit,
  DateAndTimeNullableUnit, TipoComunsUnit, StatusRegistroEnumUnit, ITransactionUnit, IConfigReaderAndWriterUnit;

{ SalvarConfiguracaoNFSeUseCase }

constructor SalvarConfiguracaoNFSeUseCase.Create(
  Connection: IDataBaseConnection;
  ConfigsRepo: IConfiguracoesRepository;
  TokenEncryptor: ITokenEncryptor
);
begin
  FConnection := Connection;
  FConfigsRepo := ConfigsRepo;
  FTokenEncryptor := TokenEncryptor;
end;

function SalvarConfiguracaoNFSeUseCase.Executar(
  const Input: SalvarConfigNFSeInput
): ValidationEntityOutput;
var
  ConfLeg: ConfigLegacyData;
  ConfLegSet: ConfigLegacySet;
  ConfLegValues: ConfigLegacyArray;
  Config: ConfiguracaoEtd;
  validator: IEntityValidator;
  OpSimpNac: Integer;
  transaction: ITransaction;
  doPost: Boolean;
  AgruparPorCTribNac, UsarApiPropria: Boolean;
  ConsultaRetAguardar, ConsultaRetIntervalo, ConsultaRetTentativas, TimeOutWebService, EncryptedChaveAcesso: string;

  procedure AddConfLeg( CL: ConfigLegacyEnum; const SC: ScalarResult );
  begin
    ConfLegSet := ConfLegSet + [ CL ];
    ConfLegValues[CL] := SC;
  end;
begin


  transaction := FConnection.BeginTransaction();
  try try
    validator := EntityValidatorFactory.Builder();

    validator.Field('Serie', Input.Serie).IsRequired();
    validator.Field('OpSimpNac', IntegerNullable.Create( Ord( Input.OpSimpNac )))
      .HasMinValue(Integer(Low(OptanteSNEnum)) + 1)
      .HasMaxValue(Integer(High(OptanteSNEnum)));
    if (Input.LayoutNFSe <> lytPrefeitura) and (Input.OpSimpNac in [ osnOptanteMEI, osnOptanteMEEPP ]) then
      validator.Field('RegApTribSN', IntegerNullable.Create( Ord( Input.RegApTribSN )))
        .HasMinValue(Integer(Low(RegimeApuracaoSNEnum)) + 1)
        .HasMaxValue(Integer(High(RegimeApuracaoSNEnum)));
    validator.Field('RegEsTrib', IntegerNullable.Create( Input.RegEsTrib ))
      .HasMinValue(0);

    case Input.OpSimpNac of
      osnNaoOptante:
        begin
          if Input.PreferirAliqSNaoIbpt then
            validator.Add( 'PreferirAliqSNaoIbpt',
              'Não optante pelo Simples Nacional não pode usar a opção Preferir Aliquota SN as Aliquotas IBPT'
            );
        end;

      osnOptanteMEI:
        begin
          if Input.PreferirAliqSNaoIbpt then
            validator.Add( 'PreferirAliqSNaoIbpt',
              'Optante pelo Simples Nacional MEI não pode usar a opção Preferir Aliquota SN as Aliquotas IBPT'
            );
        end;

      osnOptanteMEEPP:
        begin
          if (Input.InibirValTrib) then
            validator.Add( 'InibirValTrib',
              'Optante pelo Simples Nacional ME EPP não pode Inibir os valores aproximados de tributos'
            );
        end;
    end;

    ConfLeg := FConfigsRepo.GetLegacy([ceRegimeFederal]);
    if not ContainsText(ConfLeg.GetString(ceRegimeFederal), 'SIMPLES') and (Input.LayoutNFSe = lytNacionalSemIbsCbs) then
      validator.Add( 'LayoutNFSe', Format(
        'Regime Federal na Empresa = "%s". Selecione o Layout com IBS e CBS por favor',
        [ ConfLeg.GetString(ceRegimeFederal) ]
      ));

    if not validator.IsValid then
    begin
      Result := validator.Result;
      Exit;
    end;

    case Input.OpSimpNac of
      osnOptanteMEI  : OpSimpNac := 3{3-SIM MEI};
      osnOptanteMEEPP: OpSimpNac := 1{1-SIM ME/EPP};
      else
        OpSimpNac := 2{2-NAO};
    end;

    ConfLegSet := [];
    AddConfLeg(ceSerieNFSe      , ScalarResult.FromString( Input.Serie ));
    AddConfLeg(ceNFSeOpetanteSN , ScalarResult.FromInt( OpSimpNac ));
    AddConfLeg(ceNFSeRegEspTrib , ScalarResult.FromInt( Input.RegEsTrib ));
    AddConfLeg(ceNFSeIncntvCult , ScalarResult.FromInt( IfThen( Input.IncentivoCultural, 1, 2 )));
    AddConfLeg(ceWSSenha        , ScalarResult.FromString( Input.WSSenha ));
    AddConfLeg(ceWSFraseSercreta, ScalarResult.FromString( Input.WSFraseSecreta ));

    FConfigsRepo.SaveLegacy(
      ConfigLegacyData.Create( ConfLegSet, ConfLegValues )
    );

    Config := FConfigsRepo.GetByKey('nfse_config', Input.EmpresaId);

    doPost := False;
    if Config = nil then
    begin
      doPost := True;
      Config := ConfiguracaoEtd.Create(
        'nfse_config', Input.EmpresaId, 'Configurações diversas NFSe', ConfiguracaoEtdTipoEnumStr[tctBlob],
        StringNullable.NullInstance(),
        DoubleNullable.NullInstance(), TStringList.Create(), DateTimeNullable.NullInstance(), ';nfse;config;',
        saAtivo
      );
    end;

    if Input.LayoutNFSe in [ lytNacionalSemIbsCbs, lytNacionalComIbsCbs ] then
      AgruparPorCTribNac := True
    else
      AgruparPorCTribNac := Input.AgruparPorCTribNac;

    // Leitura apenas para registrar os valores default
    with ConfigFactory.IniReader(Config.ValorStrings) do
    begin
      ConsultaRetTentativas := ReadString(IntToStr(Input.CMunEmitente), 'ConsultaRetornoTentativas');
      ConsultaRetAguardar   := ReadString(IntToStr(Input.CMunEmitente), 'ConsultaRetornoAguardarEmSegundos');
      ConsultaRetIntervalo  := ReadString(IntToStr(Input.CMunEmitente), 'ConsultaRetornoIntervaloEmSegundos');
      TimeOutWebService     := ReadString(IntToStr(Input.CMunEmitente), 'TimeOutWebServiceEmSegundos');
    end;

    // O ACBr usa APIPropria somente quando o Layout nao é nacional, esse tratamento é necessário
    UsarApiPropria := (Input.ComunicacaoSistema = csProvedor) and (Input.LayoutNFSe <> lytPrefeitura);

    if Input.WSChaveAcesso <> '' then
      EncryptedChaveAcesso :=  FTokenEncryptor.Encrypt(Input.WSChaveAcesso)
    else
      EncryptedChaveAcesso := '';

    with ConfigFactory.IniWriter(Config.ValorStrings) do
    begin
      WriteString( IntToStr(Input.CMunEmitente), 'WSChaveAcesso', EncryptedChaveAcesso);
      WriteString( IntToStr(Input.CMunEmitente), 'InibirValorEstimadoTributos',
        IfThen( Input.InibirValTrib, 'S', 'N' )
      );
      WriteString( IntToStr(Input.CMunEmitente), 'PreferirAliquoDoSimplesAsAliquotasDoIBPT',
        IfThen( Input.PreferirAliqSNaoIbpt, 'S', 'N' )
      );
      WriteInteger(IntToStr(Input.CMunEmitente), 'RegimeApuracaoTriutariaSimplesNacional',
        Ord(Input.RegApTribSN)
      );
      WriteString( IntToStr(Input.CMunEmitente), 'EnviarInscricaoMunicipal',
        IfThen( Input.EnviarInscricaoMunicipal, 'S', 'N' )
      );
      WriteString( IntToStr(Input.CMunEmitente), 'ConvenioSistemaNacionalAtivo',
        IfThen( Input.ConvenioSistemaNacionalAtivo, 'S', 'N' )
      );
      WriteString( IntToStr(Input.CMunEmitente), 'AgruparPorCTribNac',
        IfThen( AgruparPorCTribNac, 'S', 'N' )
      );
      WriteInteger( IntToStr(Input.CMunEmitente), 'Layout', Ord(Input.LayoutNFSe) );
      WriteString( IntToStr(Input.CMunEmitente), 'OpInternaId', Input.OpInternaId.Value );
      WriteString(IntToStr(Input.CMunEmitente), 'ConsultaRetornoTentativas', ConsultaRetTentativas);
      WriteString(IntToStr(Input.CMunEmitente), 'ConsultaRetornoAguardarEmSegundos', ConsultaRetAguardar);
      WriteString(IntToStr(Input.CMunEmitente), 'ConsultaRetornoIntervaloEmSegundos', ConsultaRetIntervalo);
      WriteString(IntToStr(Input.CMunEmitente), 'TimeOutWebServiceEmSegundos', TimeOutWebService);
      WriteString(IntToStr(Input.CMunEmitente), 'UsarApiPadraoNacionalDoProvedor',IfThen(UsarApiPropria, 'S', 'N'));
      WriteString('Impressao', 'DiscriminacaoSimples', IfThen(Input.ImpressaoSimplificada, 'S', 'N'));
      WriteString('OrdemServico', 'DataCompetenciaIgualDataAtual', IfThen(Input.DComptIgualDataAtual, 'S', 'N'));

      Config.ValorStrings.Text := GetStrings;
    end;

    if Input.DesativacaoModuloLegado then
      if Config.ValorDateTime.IsNull or (Config.ValorDateTime.Value = 0) then
        Config.ValorDateTime.SetValue(IncDay(Date, 30));

    if doPost then
      FConfigsRepo.Post( Config )
    else
      FConfigsRepo.Put( Config );

    Result := validator.Result;

    transaction.Commit();

  except on E: Exception do
    begin
      transaction.Rollback();
      raise;
    end;
  end;
  finally
    Config.Free();
    transaction.Free();
  end;
end;

end.

