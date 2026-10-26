unit ConfiguracaoNFSeServiceUnit;

interface

uses
  IConfiguracaoNFSeServiceUnit,
  ConfiguracaoNFSeModelUnit,
  IConfiguracoesRepositoryUnit, ITokenDecryptorUnit;

type
  ConfiguracaoNFSeService = class(TInterfacedObject, IConfiguracaoNFSeService)
  private
    FConfigsRepo: IConfiguracoesRepository;
    FTokenDecryptor: ITokenDecryptor;
    function Executar(EmpresaId: Integer): ConfiguracaoNFSeModel;
  public
    constructor Create(ConfigsRepo: IConfiguracoesRepository; TokenDecryptor: ITokenDecryptor);

    function ObterSerieDPS( EmpresaId: Integer ): string;
  end;

implementation


uses
  SysUtils, Classes, StrUtils, Math,
  ConfiguracaoEtdUnit,
  ConfigLegacyTypes, StringServiceUnit, ConfigFactoryUnit, StringNullableUnit, NFSeTypesUnit, CurrencyNullableUnit,
  CertificadoDigitalConfigUnit, WebServiceDFeModelUnit, ScalarResultUnit, IEntityValidatorUnit,
  EntityValidatorFactoryUnit, IntegerNullableUnit, DoubleNullableUnit,
  DateAndTimeNullableUnit, TipoComunsUnit, StatusRegistroEnumUnit;

{ ConfiguracaoNFSeService }

constructor ConfiguracaoNFSeService.Create(ConfigsRepo: IConfiguracoesRepository; TokenDecryptor: ITokenDecryptor);
begin
  FConfigsRepo := ConfigsRepo;
  FTokenDecryptor := TokenDecryptor;
end;

function ConfiguracaoNFSeService.Executar( EmpresaId: Integer ): ConfiguracaoNFSeModel;
var
  Configs: ConfiguracaoEtdList;
  Config: ConfiguracaoEtd;
  ConfLeg: ConfigLegacyData;
  Serie, Versao, WSChaveAcesso, sAgruparPorCTribNac, sLineBreakerNFSe, Prefeitura: string;
  InibirValTrib, EnviarInscricaoMunicipal, ConvenioSistemaNacionalAtivo, IncentivoCultural, AgruparPorCTribNac: Boolean;
  DiscriminacaoSimples: Boolean;
  PreferirAliqSNaoIbpt: Boolean;
  Clocemi, RegApTribSN, RegEsTrib: Integer;
  PadraoNacional, AderiuIBSCBS, layoutVazio, UsarMensageriaAI, ApiPropria: Boolean;
  //DataInicioIBSCBS: TDate;
  OpInternaId: StringNullable;
  OpSimpNac: OptanteSNEnum;
  PTotTribSN: CurrencyNullable;
  DataDesativacaoLegado: DateTimeNullable;
  LayoutNFSe: LayoutNFSeEnum;
  ImpressaoLayoutNacional, DCompetIgualDataAtual: Boolean;
  ConsultaRetornoTentativas, SegundosAguardarConsulta, SeguntosIntervaloConulta, SegundosTimeOut: Cardinal;
begin

  ConfLeg := FConfigsRepo.GetLegacy(
    [
      ceCMun, ceSerieNFSe, ceNFSeRegEspTrib, ceNFSeOpetanteSN, ceRegimeFederal, ceAliqIssSN, ceCertDigCaminho,
      ceCertDigSenha, ceCertDigNumSerie, ceWSFraseSercreta, ceWSSenha, ceWSArquivos, ceWSAmbiente, ceNFSeIncntvCult,
      ceNFSeSemQuebraLinha, ceDFeGravarLog
    ]
  );

  Clocemi := ConfLeg.GetInt(ceCMun);
  Serie := IntToStr(ConfLeg.GetInt(ceSerieNFSe));
  RegEsTrib := ConfLeg.GetInt(ceNFSeRegEspTrib);
  IncentivoCultural := ConfLeg.GetInt(ceNFSeIncntvCult) = 1;
  sLineBreakerNFSe := IfThen( UpperCase(Copy(ConfLeg.GetString(ceNFSeSemQuebraLinha), 1,1)) = 'S', ';', sLineBreak );
  DCompetIgualDataAtual := False;

  Prefeitura := FConfigsRepo.GetLegacyPrefeituraNFSe();

  Configs := FConfigsRepo.GetByKey(
    StringService.Split(
      [','], 'nfse_config,rtc_config,nfc_op_internad_default,dps_op_interna_default,hw_cloud_ia_conf'
    ),
    EmpresaId
  );

  try
    if Configs.TryGet('nfse_config', Config) then
    begin
      with ConfigFactory.IniReader(Config.ValorStrings) do
      begin
        WSChaveAcesso := ReadString(IntToStr(Clocemi), 'WSChaveAcesso');

        if WSChaveAcesso <> '' then
          try
            WSChaveAcesso := FTokenDecryptor.Decrypt(WSChaveAcesso);
          except
            WSChaveAcesso := 'DECRYPT_TOKEN_ERROR';
          end;

        InibirValTrib := UpperCase(Copy(Trim(ReadString(IntToStr(Clocemi),
          'InibirValorEstimadoTributos' )), 1, 1
        )) = 'S';
        PreferirAliqSNaoIbpt := UpperCase(Copy(Trim(ReadString(IntToStr(Clocemi),
          'PreferirAliquoDoSimplesAsAliquotasDoIBPT' )), 1, 1
        )) = 'S';
        RegApTribSN := ReadInteger(IntToStr(Clocemi), 'RegimeApuracaoTriutariaSimplesNacional' );
        EnviarInscricaoMunicipal := UpperCase(Copy(Trim(ReadString(IntToStr(Clocemi),
          'EnviarInscricaoMunicipal' )), 1, 1
        )) = 'S';
        ConvenioSistemaNacionalAtivo := UpperCase(Copy(Trim(ReadString(IntToStr(Clocemi),
          'ConvenioSistemaNacionalAtivo' )), 1, 1
        )) <> 'N';
        sAgruparPorCTribNac := UpperCase(Copy(Trim(ReadString(IntToStr(Clocemi),
          'AgruparPorCTribNac')), 1, 1
        ));
        ApiPropria                := ReadBool(   IntToStr(Clocemi), 'UsarApiPadraoNacionalDoProvedor', False);
        ConsultaRetornoTentativas := ReadInteger(IntToStr(Clocemi), 'ConsultaRetornoTentativas');
        SegundosAguardarConsulta  := ReadInteger(IntToStr(Clocemi), 'ConsultaRetornoAguardarEmSegundos');
        SeguntosIntervaloConulta  := ReadInteger(IntToStr(Clocemi), 'ConsultaRetornoIntervaloEmSegundos');
        SegundosTimeOut           := ReadInteger(IntToStr(Clocemi), 'TimeOutWebServiceEmSegundos');

        DiscriminacaoSimples := UpperCase(Copy(Trim(ReadString('Impressao',
          'DiscriminacaoSimples')), 1, 1
        )) = 'S';
        ImpressaoLayoutNacional := ReadBool('Impressao', 'DANFSeNacional', True);
        DCompetIgualDataAtual   := ReadBool('OrdemServico', 'DataCompetenciaIgualDataAtual', False);

        layoutVazio := ReadString( IntToStr(Clocemi), 'Layout', '' ) = '';
        if layoutVazio then
        begin
          case Trunc(Config.ValorDouble.Value) of
            1: LayoutNFSe := lytNacionalSemIbsCbs;
            else
              LayoutNFSe := lytPrefeitura;
          end;
        end
        else
        begin
          case ReadInteger( IntToStr(Clocemi), 'Layout', -1 ) of
            0,1,2: LayoutNFSe := LayoutNFSeEnum(ReadInteger( IntToStr(Clocemi), 'Layout', -1 ))
            else
              LayoutNFSe := lytPrefeitura;
          end;
        end;

        OpInternaId := StringNullable.CreateOrNull( ReadString( IntToStr(Clocemi), 'OpInternaId' ));

        case RegApTribSN of
          0,1,2,3: ; //OK, valores válidos para o enum
          else
            RegApTribSN := 0;
        end;

//        PadraoNacional := LayoutNFSe <> lytPrefeitura; //Trunc(Config.ValorDouble.Value) = 1; // PadraoNacional = S
      end;

      DataDesativacaoLegado := DateTimeNullable.Create(Config.ValorDateTime.Value, Config.ValorDateTime.IsNull);
    end;

    if Configs.TryGet('rtc_config', Config) then
      with ConfigFactory.IniReader(Config.ValorStrings) do
      begin
        if (EncodeDate(2027, 1, 1) <= Now())                                 // Em vigor pre estabelecido
          or not ContainsText(ConfLeg.GetString(ceRegimeFederal), 'SIMPLES') // Regime Regula já ta valendo
          or (UpperCase(Copy(Trim(ReadString('Config', 'SimplesNacionalOptanteRegimeRegular')), 1, 1)) = 'S') // Aderiu
        then
          AderiuIBSCBS := True

        else
          AderiuIBSCBS := False;

        //else Nao olha mais essa data, era somente pro ano de 2025
          //DataInicioIBSCBS := StrToDateDef(ReadString('Config', 'ExigirNovosCamposAPartirDe'), Now + 30);
      end;

    if OpInternaId.IsNullOrWhiteSpace then
      if Configs.TryGet('nfc_op_internad_default', Config)
        and not Config.ValorString.IsNullOrWhiteSpace()
      then
        OpInternaId := Config.ValorString
      else
        OpInternaId := StringNullable.NullInstance();

    if Configs.TryGet('hw_cloud_ia_conf', Config) then
      with ConfigFactory.IniReader(Config.ValorStrings) do
      begin
        UsarMensageriaAI := ReadBool('Configuracao', 'UsarServicoMensageria', False);
      end;

  finally
    Configs.Free();
  end;

  if layoutVazio and ( LayoutNFSe = lytNacionalSemIbsCbs) and AderiuIBSCBS then
    LayoutNFSe := lytNacionalComIbsCbs;

  case ConfLeg.GetInt(ceNFSeOpetanteSN) of
    1{1-SIM ME/EPP}: OpSimpNac := osnOptanteMEEPP;
    3{3-SIM MEI}   : OpSimpNac := osnOptanteMEI;
    else {0 ou 2-NAO}  OpSimpNac := osnNaoOptante;
  end;
  if (OpSimpNac = osnOptanteMEI) or not PreferirAliqSNaoIbpt then
    PTotTribSN := CurrencyNullable.Create( ConfLeg.GetDouble(ceAliqIssSN) )
  else
    PTotTribSN := CurrencyNullable.NullInstance();

  if LayoutNFSe in [lytNacionalSemIbsCbs, lytNacionalComIbsCbs] then
    AgruparPorCTribNac := True
  else
    AgruparPorCTribNac := sAgruparPorCTribNac = 'S';

  Result := ConfiguracaoNFSeModel.Create(
    Serie,
    InibirValTrib,
    EnviarInscricaoMunicipal,
    ConvenioSistemaNacionalAtivo,
    PreferirAliqSNaoIbpt,
    IncentivoCultural,
    AgruparPorCTribNac,
    Clocemi,
    RegimeApuracaoSNEnum(RegApTribSN),
    RegEsTrib,
    OpInternaId,
    OpSimpNac,
    PTotTribSN,
    LayoutNFSe,
    CertificadoDigitalConfig.Create(
      ConfLeg.GetString(ceCertDigCaminho),
      ConfLeg.GetString(ceCertDigNumSerie),
      ConfLeg.GetString(ceCertDigSenha),
      ''
    ),
    WebServiceDFeModel.Create(
      ConfLeg.GetString(ceWSAmbiente) = 'Produção',
      Clocemi,
      ConfLeg.GetString(ceWSArquivos),
      ConfLeg.GetString(ceWSFraseSercreta),
      WSChaveAcesso,
      ConfLeg.GetString(ceWSSenha),
      Copy(UpperCase(Trim(ConfLeg.GetString(ceDFeGravarLog))), 1, 1) = 'S',
      ApiPropria,
      SegundosAguardarConsulta,
      SeguntosIntervaloConulta,
      ConsultaRetornoTentativas,
      SegundosTimeOut
    ),
    OpcoesDiscriminacaoModel.Create(
      DiscriminacaoSimples,
      DCompetIgualDataAtual,
      sLineBreakerNFSe
    ),
    OpcoesImpressaoModel.Create( ImpressaoLayoutNacional, Prefeitura ),
    DataDesativacaoLegado,
    UsarMensageriaAI
  );
end;

function ConfiguracaoNFSeService.ObterSerieDPS(EmpresaId: Integer): string;
var
  confs: ConfiguracaoNFSeModel;
begin
  confs := Executar( EmpresaId );

  Result := confs.Serie;
end;

end.

