unit ACBrNFSeAdapterUnit;

interface

uses
  SysUtils, Classes,
  IACBrNFSeAdapterUnit,
  IProgressObserverUnit,
  ConfiguracaoNFSeModelUnit,
  ACBrNFSeX,
  ACBrNFSeXNotasFiscais,
  ACBrNFSeXConversao,
  ACBrNFSeXDANFSeRLClass,
  ACBrNFSeXWebservicesResponse,
  ACBrNFSeAdapterTypes,
  IConfigReaderAndWriterUnit,
  ISimpleLoggerUnit,
  EmpresaEtdUnit,
  WebServiceResponseTypesUnit,
  NFSeResponseTypesUnit, TipoComunsUnit, ISessionContextUnit;

type
  ACBrNFSeAdapter = class(TInterfacedObject, IACBrNFSeAdapter)
  private
    procedure ResolverParticularidadesProvedor();
    function ResolverProcessamentoProvedor(const Default: WSResposta): WSResposta;
    procedure ConfigurarImpressao();
    procedure ACBrOnGerarLog(const AText: string; var Tratado: Boolean);
    procedure ACBrOnStatusChange(Sender: TObject); virtual;
    function GerarResposta(Metodo: TMetodo): WSResposta;

    function CriarCancelamento(
      WSResponse: TNFSeWebserviceResponse; DataCanc: TDateTime
      ): NFSeResponseCancelamentoModel;

    function ExisteErroDeEmissao(var ErrosWS: WSErros): Boolean;
    procedure ResolverDadosAntesImpressao(const Nota: TNotaFiscal);
    function ResolverLayoutACBr(): TLayoutNFSe;
  private
    FSession: ISessionContext;
    FLoggerNFSe: ISimpleLogger;
    FACBr: TACBrNFSeX;
    FDANFSe: TACBrNFSeXDANFSeRL;
    FConfigReader: IConfigReader;
    FObserver: IProgressObserver;
    FConfig: ConfiguracaoNFSeModel;
    FEmpresa: EmpresaEtd;
    FAutorizacaoResponse: NFSeResponseAutorizacaoModel;
    FCancelamentoResponse: NFSeResponseCancelamentoModel;
    FSubstituicaoResponse: NFSeResponseSubstituicaoModel;
    FCancPorSubstResponse: NFSeResponseCancelamentoModel;

    // Retorno de objetos Response
    function GetAutorizacaoResponse(): NFSeResponseAutorizacaoModel;
    function GetCancelamentoResponse(): NFSeResponseCancelamentoModel;
    function GetSubstituicaoResponse(): NFSeResponseSubstituicaoModel;
    function GetCancPorSubstResponse(): NFSeResponseCancelamentoModel;

    function CriarAutorizacaoResponse(const AProtocolo: string): NFSeResponseAutorizacaoModel;
    function CriarCancelamentoResponse(): NFSeResponseCancelamentoModel;
    function CriarSubstituicaoResponse(const AProtocolo: string): NFSeResponseSubstituicaoModel;

    procedure SetAutorizacaoResponse(const Value: NFSeResponseAutorizacaoModel);
    procedure SetCancelamentoResponse(const Value: NFSeResponseCancelamentoModel);
    procedure SetSubstituicaoResponse(const Value: NFSeResponseSubstituicaoModel);
    procedure SetCancPorSubstResponse(const Value: NFSeResponseCancelamentoModel);
  public
    constructor Create(
      Session: ISessionContext;
      ConfigReader: IConfigReader;
      LoggerNFSe: ISimpleLogger;
      Observer: IProgressObserver
    );
    destructor Destroy; override;

    procedure Configurar(const Config: ConfiguracaoNFSeModel; const Empresa: EmpresaEtd);
    function GetNotaFiscalRequest(): TNotaFiscal;
    function GetNotaFiscalResponse(): TNotaFiscal;
    function ObterXmlDPS(): string;
    function ObterXmlPedidoCanc(): string;
    function ListaRegimesEspecialTributacao(): string;

    // Consumo WebService
    function Emitir(const NumeroLote: string): WSResposta;          // Fluxo. Configurar, GetNotaFiscalRequest, Emitir
    function Consutar(const Input: ACBrConsultarInput): WSResposta; // Fluxo. Configurar, Consutar
    function Cancelar(const Input: ACBrCancelarInput): WSResposta;  // Fluxo. Configurar, Cancelar
    function Substituir(                                            // Fluxo. Configurar, GetNotaFiscalRequest, Substituir
      const NumeroLote: string; const Input: ACBrSubstituirInput
    ): WSResposta;
    // Impressao/PDF
    procedure Imprimir(const XMLNFSe: string; Cancelada, Producao: Boolean); overload;
    procedure Imprimir(const XMLsNFSe: TArrayString; Canceladas: TArrayBoolean); overload;
    function SalvarPDF(const XMLNFSe: string; Cancelada, Producao: Boolean; out PdfFile: string): WSResposta;
    function GerarPdfAtual(): string;
  end;

implementation

uses
  StrUtils, Math,
  ACBrDFeSSL, ACBrNFSeXClass, ACBrDFe.Conversao, ACBrNFSeXConsts, ACBrNFSeXWebserviceBase, StringServiceUnit,
  NFSeTypesUnit, VersaoAplicacaoUnit, IntegerNullableUnit, CurrencyNullableUnit, StringNullableUnit;

{ ACBrNFSeAdapter }

procedure PrencherEmitente(const Emit: TDadosPessoa; const Empresa: EmpresaEtd);
begin
  Emit.RazaoSocial                      := StringService.Default(emit.RazaoSocial, Empresa.Razao);
  Emit.NomeFantasia                     := StringService.Default(Emit.NomeFantasia, Empresa.Fantasia);
  Emit.Identificacao.InscricaoMunicipal := StringService.Default(Emit.Identificacao.InscricaoMunicipal, Empresa.InscMunicipal);
  Emit.Identificacao.InscricaoEstadual  := StringService.Default(Emit.Identificacao.InscricaoEstadual, Empresa.InscEstadual);
  Emit.Identificacao.Cnpj               := StringService.Default(Emit.Identificacao.Cnpj, Empresa.CNPJ);
  Emit.Endereco.Endereco                := StringService.Default(Emit.Endereco.Endereco, Empresa.Endereco);
  Emit.Endereco.Numero                  := StringService.Default(Emit.Endereco.Numero, Empresa.NumeroEnd);
  Emit.Endereco.Complemento             := StringService.Default(Emit.Endereco.Complemento, Empresa.Complemento);
  Emit.Endereco.CodigoMunicipio         := StringService.Default(Emit.Endereco.CodigoMunicipio, Empresa.CMunIbge.ToString());
  Emit.Endereco.xMunicipio              := StringService.Default(Emit.Endereco.xMunicipio, Empresa.NomeCidade);
  Emit.Endereco.UF                      := StringService.Default(Emit.Endereco.UF, Empresa.UF);
  Emit.Endereco.CEP                     := StringService.Default(Emit.Endereco.CEP, Empresa.CEP);
  Emit.Contato.Telefone                 := StringService.Default(Emit.Contato.Telefone, Empresa.Telefone);
  Emit.Contato.EMail                    := StringService.Default(Emit.Contato.EMail, Empresa.Email);
end;

function CalculaTpRetPisCofing(VRetPis, VRetCofins, VRetCsll: Currency): TtpRetPisCofins;
begin
  if (VRetPis = 0) and (VRetCofins = 0) and (VRetCsll = 0) then
    Result := TtpRetPisCofins.trpiscofinscsllNaoRetido

  else if (VRetPis > 0) and (VRetCofins > 0) and (VRetCsll > 0) then
    Result := TtpRetPisCofins.trpiscofinscsllRetido

  else if (VRetPis > 0) and (VRetCofins > 0) and (VRetCsll <= 0) then
    Result := TtpRetPisCofins.trpiscofinsRetidocsllNaoRetido

  else if (VRetPis > 0) and (VRetCofins <= 0) and (VRetCsll <= 0) then
    Result := TtpRetPisCofins.trPisRetidoCofinsCsllNaoRetido

  else if (VRetPis <= 0) and (VRetCofins > 0) and (VRetCsll <= 0) then
    Result := TtpRetPisCofins.trCofinsRetidoPisCsllNaoRetido

  else if (VRetPis <= 0) and (VRetCofins > 0) and (VRetCsll > 0) then
    Result := TtpRetPisCofins.trCofinsCsllRetidoPisNaoRetido

  else if (VRetPis <= 0) and (VRetCofins <= 0) and (VRetCsll > 0) then
    Result := TtpRetPisCofins.trCsllRetidoPisCofinsNaoRetido

  else if (VRetPis > 0) and (VRetCofins <= 0) and (VRetCsll > 0) then
    Result := TtpRetPisCofins.trPisCsllRetidoCofinsNaoRetido

  else
    Result := TtpRetPisCofins.trpiscofinscsllNaoRetido;
end;

procedure ACBrNFSeAdapter.ResolverDadosAntesImpressao(const Nota: TNotaFiscal);
begin
  if Nota.NFSe.Servico.Valores.tribFed.tpRetPisCofins = TtpRetPisCofins.trpiscofinscsllNaoRetido then
    Nota.NFSe.Servico.Valores.tribFed.tpRetPisCofins := TtpRetPisCofins.trpcNaoRetido;

  // Layout Nacional
  if not String.IsNullOrWhiteSpace(Nota.NFSe.infNFSe.nDFSe) then
  begin
  end
  // Layout Proprio
  else       
  begin
    if FConfig.OpcoesImpressao.LayoutNacional then
    begin
      Nota.NFSe.Servico.Valores.tribFed.vRetIRRF := Nota.NFSe.Servico.Valores.ValorIr;
      Nota.NFSe.Servico.Valores.tribFed.vRetCP := Nota.NFSe.Servico.Valores.ValorInss;
      Nota.NFSe.Servico.Valores.tribFed.vRetCSLL := Nota.NFSe.Servico.Valores.ValorCsll
        + Nota.NFSe.Servico.Valores.ValorPis
        + Nota.NFSe.Servico.Valores.ValorCofins;

      Nota.NFSe.Servico.Valores.tribFed.tpRetPisCofins := CalculaTpRetPisCofing(
        Nota.NFSe.Servico.Valores.ValorPis,
        Nota.NFSe.Servico.Valores.ValorCofins,
        Nota.NFSe.Servico.Valores.ValorCsll
      );

      Nota.NFSe.infNFSe.valores.ValorLiquidoNfse := Nota.NFSe.ValoresNfse.ValorLiquidoNfse;
      Nota.NFSe.infNFSe.valores.BaseCalculo := Nota.NFSe.ValoresNfse.BaseCalculo;
      Nota.NFSe.infNFSe.valores.Aliquota := Nota.NFSe.ValoresNfse.Aliquota;
      Nota.NFSe.infNFSe.valores.ValorIss := Nota.NFSe.ValoresNfse.ValorIss;
      Nota.NFSe.Servico.Valores.tribMun.pAliq := Nota.NFSe.ValoresNfse.Aliquota;

      if Nota.NFSe.Servico.Valores.IssRetido = stRetencao then
        Nota.NFSe.Servico.Valores.tribMun.tpRetISSQN := TtpRetISSQN.trRetidoPeloTomador;

      if Nota.NFSe.OptanteSimplesNacional = TnfseSimNao.snNao then
        Nota.NFSe.OptanteSN := TOptanteSN.osnNaoOptante
      else
      begin
        if FConfig.OpSimpNac = OptanteSNEnum.osnOptanteMEI then
          Nota.NFSe.OptanteSN := TOptanteSN.osnOptanteMEI
        else
          Nota.NFSe.OptanteSN := TOptanteSN.osnOptanteMEEPP;
        Nota.NFSe.RegimeApuracaoSN := TRegimeApuracaoSN.raFederaisSN;
      end;

      Nota.NFSe.infNFSe.cLocIncid := Nota.NFSe.Servico.MunicipioIncidencia;
      Nota.NFSe.infNFSe.xLocIncid := Nota.NFSe.Servico.MunicipioPrestacaoServico;
    end;
  end;
end;

procedure ACBrNFSeAdapter.ACBrOnGerarLog(const AText: string; var Tratado: Boolean);
begin
  try
    FLoggerNFSe.Log( AText );
  except
  end;
end;

procedure ACBrNFSeAdapter.ACBrOnStatusChange(Sender: TObject);
begin
  if not Assigned(FObserver) then
    Exit;

  case FACBr.Status of
    stNFSeIdle            : FObserver.OnMessage('Pronto');
    stNFSeRecepcao        : FObserver.OnMessage('Enviando RPS...');
    stNFSeConsultaSituacao: FObserver.OnMessage('Consultando a Situação...');
    stNFSeConsulta        : FObserver.OnMessage('Consultando...');
    stNFSeCancelamento    : FObserver.OnMessage('Cancelando NFSe...');
    stNFSeSubstituicao    : FObserver.OnMessage('Substituindo NFSe...');
    stNFSeEmail           : FObserver.OnMessage('Enviando Email...');
    stNFSeAguardaProcesso : FObserver.OnMessage('Aguardando o Processo...');
    stNFSeEnvioWebService : FObserver.OnMessage('Enviando para o WebService...');
  end;
end;

constructor ACBrNFSeAdapter.Create(
  Session: ISessionContext;
  ConfigReader: IConfigReader;
  LoggerNFSe: ISimpleLogger;
  Observer: IProgressObserver
);
begin
  FEmpresa      := nil;
  FSession      := Session;
  FConfigReader := ConfigReader;
  FLoggerNFSe   := LoggerNFSe;
  FObserver     := Observer;

  FACBr := TACBrNFSeX.Create(nil);
  if Assigned(FLoggerNFSe) then
    FACBr.OnGerarLog := ACBrOnGerarLog;

  if Assigned(FObserver) then
    FACBr.OnStatusChange := ACBrOnStatusChange;
end;

destructor ACBrNFSeAdapter.Destroy;
begin
  FDANFSe.Free();

  if Assigned(FAutorizacaoResponse) then
    FreeAndNil(FAutorizacaoResponse);

  if Assigned(FCancelamentoResponse) then
    FreeAndNil(FCancelamentoResponse);

  if Assigned(FSubstituicaoResponse) then
    FreeAndNil(FSubstituicaoResponse);

  if Assigned(FCancPorSubstResponse) then
    FreeAndNil(FCancPorSubstResponse);

  if Assigned(FEmpresa) then
    FreeAndNil(FEmpresa);

  FACBr.OnGerarLog := nil;
  FACBr.Free();
  inherited;
end;

function ACBrNFSeAdapter.Cancelar(const Input: ACBrCancelarInput): WSResposta;
var
  infCanc: TInfCancelamento;
  InfEven: TInfEvento;
begin
  try
    FACBr.NotasFiscais.Clear();
    FACBr.NotasFiscais.LoadFromString( Input.XMLNFSe, True );

    case ResolverLayoutACBr() of
      lnfsProvedor:
        begin
          infCanc := TInfCancelamento.Create;
          try
            infCanc.CodCancelamento := Input.CCancelamento;
            infCanc.MotCancelamento := Input.XMotivo;

            infCanc.NumeroNFSe      := FACBr.NotasFiscais.Items[0].NFSe.Numero;
            infCanc.SerieNFSe       := FACBr.NotasFiscais.Items[0].NFSe.SeriePrestacao;
            infCanc.ChaveNFSe       := FACBr.NotasFiscais.Items[0].NFSe.ChaveAcesso;
            infCanc.NumeroLote      := FACBr.NotasFiscais.Items[0].NFSe.NumeroLote;
            infCanc.NumeroRps       := StrToInt(FACBr.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero);
            infCanc.SerieRps        := FACBr.NotasFiscais.Items[0].NFSe.IdentificacaoRps.Serie;
            infCanc.ValorNFSe       := FACBr.NotasFiscais.Items[0].NFSe.ValoresNfse.ValorLiquidoNfse;
            infCanc.CodVerificacao  := FACBr.NotasFiscais.Items[0].NFSe.CodigoVerificacao;
            infCanc.email           := FACBr.NotasFiscais.Items[0].NFSe.Tomador.Contato.Email;
            infCanc.DataEmissaoNFSe := FACBr.NotasFiscais.Items[0].NFSe.DataEmissao;
            infCanc.CodServ         := FACBr.NotasFiscais.Items[0].NFSe.Servico.ItemListaServico;
            //infCanc.CodMunicipio    := FACBr.NotasFiscais.Items[0].NFSe.?;
            infCanc.CNPJCPFTomador  := FACBr.NotasFiscais.Items[0].NFSe.Tomador.IdentificacaoTomador.CpfCnpj;

            FACBr.CancelarNFSe( infCanc );

            Result := GerarResposta( tmCancelarNFSe );

          finally
            infCanc.Free();
          end;

        end;

      lnfsPadraoNacionalv1,
      lnfsPadraoNacionalv101:
        begin
          // Consulta o evento de cancelamento por substiticao
          FACBr.ConsultarEvento(
            FACBr.NotasFiscais.Items[0].NFSe.infNFSe.ID,
            ACBrNFSeXConversao.teCancelamentoSubstituicao,
            1
          );
          // Para assegurar o funcionamento correto em GerarResposta
          FACBr.WebService.ConsultarEvento.tpEvento := teCancelamentoSubstituicao;
          Result := GerarResposta( tmConsultarEvento );

          if Result.Resultado = wsSucesso then
            Exit;

          // Consulta o evento de cancelamento caso tenha sido concluido
          FACBr.ConsultarEvento(
            FACBr.NotasFiscais.Items[0].NFSe.infNFSe.ID,
            ACBrNFSeXConversao.teCancelamento,
            1
          );
          Result := GerarResposta( tmConsultarEvento );

          if Result.Resultado = wsSucesso then
            Exit;

          // Envio do cancelamento
          InfEven := TInfEvento.Create;
          try
            InfEven.pedRegEvento.cMotivo       := StrToIntDef(Input.CCancelamento, 1);
            InfEven.pedRegEvento.xMotivo       := Input.XMotivo;
            InfEven.pedRegEvento.dhEvento      := Input.DataEvento;
            InfEven.pedRegEvento.verAplic      := Input.VersaoApp;
            InfEven.pedRegEvento.nPedRegEvento := 1;
            InfEven.pedRegEvento.tpEvento      := ACBrNFSeXConversao.teCancelamento;

            InfEven.pedRegEvento.tpAmb         := FACBr.Configuracoes.WebServices.AmbienteCodigo;
            InfEven.pedRegEvento.chNFSe        := FACBr.NotasFiscais.Items[0].NFSe.infNFSe.ID;
            //InfEven.pedRegEvento.chSubstituta  := ?;

            FACBr.EnviarEvento(InfEven);

            Result := GerarResposta( tmEnviarEvento );

          finally
            InfEven.Free;
          end;
        end;
    end;
  except on E: Exception do
    Result := WSResposta.Create( wsFalhaImplementacao, [ WSErro.Create('HW003', E.Message, '' )], '' );
  end;
end;

procedure ACBrNFSeAdapter.Configurar(
  const Config: ConfiguracaoNFSeModel;
  const Empresa: EmpresaEtd
);
var
  section, sectionCidade: string;
  libDFe: Integer;
begin
  FConfig := Config;

  FEmpresa := EmpresaEtd(Empresa.Clone());

  {$REGION 'Configurando Certificado e Lib'}

  section := 'NFSe_SSLib';

  if FConfigReader.ReadString(section, 'Ativo') <> 'S' then
    section := 'SSLib';

  libDFe := FConfigReader.ReadInteger(
    IfThen( section = 'SSLib', 'Sistema', section), 'libNFe', libDFe
  );

  libDFe := IfThen( TSSLLib(libDFe) in [TSSLLib.libOpenSSL, TSSLLib.libCapicom, TSSLLib.libWinCrypt] , libDFe, Ord(libOpenSSL));

  FACBr.SSL.DescarregarCertificado;

  FACBr.Configuracoes.Certificados.NumeroSerie := '';
  FACBr.Configuracoes.Certificados.ArquivoPFX  := '';
  FACBr.Configuracoes.Certificados.Senha       := '';
  FACBr.Configuracoes.Certificados.NumeroSerie := IfThen(TSSLLib(libDFe) <> libOpenSSL, Config.Certificado.NumeroDeSerie);
  FACBr.Configuracoes.Certificados.ArquivoPFX  := IfThen(TSSLLib(libDFe) <> libCapicom, Config.Certificado.CaminhoArquivo);
  //FACBr.Configuracoes.Certificados.DadosPFX    := AnsiString(certData.Base64PFX);
  FACBr.Configuracoes.Certificados.Senha       := AnsiString(Config.Certificado.Senha);
  FACBr.Configuracoes.Geral.SSLLib             := TSSLLib(libDFe);

  if FConfigReader.ReadInteger(section, 'SSLCryptLib', -1) >= 0 then
    FACBr.Configuracoes.Geral.SSLCryptLib   := TSSLCryptLib(FConfigReader.ReadInteger(section, 'SSLCryptLib'));

  if FConfigReader.ReadInteger(section, 'SSLHttpLib', -1) >= 0 then
    FACBr.Configuracoes.Geral.SSLHttpLib    := TSSLHttpLib(FConfigReader.ReadInteger(section, 'SSLHttpLib'));

  if FConfigReader.ReadInteger(section, 'SSLXmlSignLib', -1) >= 0 then
    FACBr.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(FConfigReader.ReadInteger(section, 'SSLXmlSignLib'));

  //if FConfigReader.ReadInteger(section, 'SSLType', sslTypeDefault) >= 0 then
    //FACBr.SSL.SSLType := TSSLType(FConfigReader.ReadInteger(section, 'SSLType', sslTypeDefault));

  {$ENDREGION}

  if FConfig.WebService.ApiPropria then
    FACBr.Configuracoes.Geral.LayoutNFSe := TLayoutNFSe.lnfsProvedor
  else
    case FConfig.LayoutNFSe of
      lytPrefeitura       : FACBr.Configuracoes.Geral.LayoutNFSe := TLayoutNFSe.lnfsProvedor;
      lytNacionalSemIbsCbs: FACBr.Configuracoes.Geral.LayoutNFSe := TLayoutNFSe.lnfsPadraoNacionalv1;
      lytNacionalComIbsCbs: FACBr.Configuracoes.Geral.LayoutNFSe := TLayoutNFSe.lnfsPadraoNacionalv101;
    end;

  FACBr.Configuracoes.Geral.ExibirErroSchema := True;
  FACBr.Configuracoes.Geral.MontarPathSchema := False;

  FACBr.Configuracoes.Geral.Emitente.CNPJ           := Empresa.CNPJ;
  FACBr.Configuracoes.Geral.Emitente.InscMun        := Empresa.InscMunicipal;
  FACBr.Configuracoes.Geral.Emitente.RazSocial      := Empresa.Razao;

  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.NomeFantasia      := Empresa.Fantasia;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.InscricaoEstadual := Empresa.InscEstadual;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.Endereco          := Empresa.Endereco;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.Numero            := Empresa.NumeroEnd;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.CEP               := Empresa.CEP;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.Bairro            := Empresa.Bairro;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.Complemento       := Empresa.Complemento;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.Municipio         := Empresa.NomeCidade;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.UF                := Empresa.UF;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.CodigoMunicipio   := IntToStr(Empresa.CMunIbge);
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.Telefone          := Empresa.Telefone;
  FACBr.Configuracoes.Geral.Emitente.DadosEmitente.Email             := Empresa.Email;

  FACBr.Configuracoes.Geral.Emitente.WSFraseSecr                     := Config.WebService.WSFraseSecreta;
  FACBr.Configuracoes.Geral.Emitente.WSSenha                         := Config.WebService.WSSenha;
  FACBr.Configuracoes.Geral.Emitente.WSChaveAcesso                   := Config.WebService.WSChaveAcesso;
  { Se pedirem pega da config Legacy e manda pro NFSeConfigModel
  if FACBr.Configuracoes.Geral.Provedor = proISSDigital then //if IniConf.FileReadStr('Cidades', cadempresa.fstr('ibge_cod_cidade'), 'Provedor').ToLower.Trim.Equals('issdigital') then
  begin
    FACBr.Configuracoes.Geral.Emitente.WSFraseSecr := cadempresa.fstr('nfs_cert');
    FACBr.Configuracoes.Geral.Emitente.WSSenha     := decodifica(cadempresa.fstr('licencanfse'));
  end;
  }

  if Config.WebService.EnvioEmProducao then
    FACBr.Configuracoes.WebServices.Ambiente := taProducao
  else
    FACBr.Configuracoes.WebServices.Ambiente := taHomologacao;

  FACBr.Configuracoes.WebServices.Visualizar := False;//cadempresa.fequals('webserv_visualizar', 'SIM');
  FACBr.Configuracoes.WebServices.Salvar     := True;
  FACBr.Configuracoes.WebServices.UF         := Empresa.UF;

  if FConfig.WebService.ConsultaRetornoTentativas > 0 then
    FACBr.Configuracoes.WebServices.Tentativas := FConfig.WebService.ConsultaRetornoTentativas;
  if FConfig.WebService.ConsultaRetornoAguardarEmSegundos > 0 then
    FACBr.Configuracoes.WebServices.AguardarConsultaRet := FConfig.WebService.ConsultaRetornoAguardarEmSegundos * 1000;
  if FConfig.WebService.ConsultaRetornoIntervaloEmSegundos > 0 then
    FACBr.Configuracoes.WebServices.IntervaloTentativas := FConfig.WebService.ConsultaRetornoIntervaloEmSegundos * 1000;
  if FConfig.WebService.TimeOutEmSegundos > 0 then
    FACBr.Configuracoes.WebServices.TimeOut := FConfig.WebService.TimeOutEmSegundos * 1000;

  sectionCidade := Format('NFSe_%d', [ Empresa.CMunIbge ]);

    // Usar o retorno do tempo medio de resposta do lote e ajusta para aguardar conforme
  FACBr.Configuracoes.WebServices.AjustaAguardaConsultaRet := False;
  if (FConfig.WebService.ConsultaRetornoAguardarEmSegundos = 0)
    and (FConfigReader.ReadInteger(sectionCidade, 'AguardarConsultaRet', 0) > 0) then
    FACBr.Configuracoes.WebServices.AguardarConsultaRet := FConfigReader.ReadInteger(sectionCidade, 'AguardarConsultaRet', 0);
  if (FConfig.WebService.ConsultaRetornoTentativas = 0)
    and (FConfigReader.ReadInteger(sectionCidade, 'Tentativas', 0) > 0) then
    FACBr.Configuracoes.WebServices.Tentativas := FConfigReader.ReadInteger(sectionCidade, 'Tentativas', 0);
  if (FConfig.WebService.ConsultaRetornoIntervaloEmSegundos = 0)
    and (FConfigReader.ReadInteger(sectionCidade, 'IntervaloTentativas', 0) > 0) then
    FACBr.Configuracoes.WebServices.IntervaloTentativas := FConfigReader.ReadInteger(sectionCidade, 'IntervaloTentativas', 0);
  if (FConfig.WebService.TimeOutEmSegundos = 0)
    and (FConfigReader.ReadInteger(sectionCidade, 'TimeOut', 0) > 0) then
    FACBr.Configuracoes.WebServices.TimeOut    := FConfigReader.ReadInteger(sectionCidade, 'TimeOut', 5) * 1000;

  //ProxyHost := ?.Text;
  //ProxyPort := ?.Text;
  //ProxyUser := ?.Text;
  //ProxyPass := ?.Text;

  with FACBr.Configuracoes.Arquivos do
  begin
    NomeLongoNFSe    := False;
    Salvar           := True;
    SepararPorMes    := False;
    AdicionarLiteral := True;
    EmissaoPathNFSe  := True;
    SepararPorCNPJ   := False;
    //PathGer          := ;
    //PathMensal       := ;
    //PathCan          := ;
    PathSalvar       := IncludeTrailingPathDelimiter(Config.WebService.Arquivos) + 'NFSe\DadosNFSe';
    PathRPS          := IncludeTrailingPathDelimiter(Config.WebService.Arquivos) + 'NFSe\DadosNFSe\RPS';
    PathNFSe         := IncludeTrailingPathDelimiter(Config.WebService.Arquivos) + 'NFSe\DadosNFSe\NFSe';

    PathSchemas  := StringService.Default(
      FConfigReader.ReadString(sectionCidade, 'PathSchemas'),
      ExtractFilePath(ParamStr(0)) + 'schemasNFSe'
    );
  end;

  if FConfigReader.ReadString('MD', 'PathXmlPorCNPJ') <> '' then
  begin
    FACBr.Configuracoes.Arquivos.PathSalvar := IncludeTrailingPathDelimiter(FConfigReader.ReadString('MD', 'PathXmlPorCNPJ')) + 'DadosNFSe\';
    FACBr.Configuracoes.Arquivos.PathRPS    := FACBr.Configuracoes.Arquivos.PathSalvar + 'RPS\';
    FACBr.Configuracoes.Arquivos.PathNFSe   := FACBr.Configuracoes.Arquivos.PathSalvar + 'Autorizadas\';
    FACBr.Configuracoes.Arquivos.PathCan    := FACBr.Configuracoes.Arquivos.PathSalvar + 'Canceladas\';
    FACBr.Configuracoes.Arquivos.SepararPorCNPJ := True;
    FACBr.Configuracoes.Arquivos.SepararPorModelo := True;
  end;

  // Vai procurar o nome do provedor na pasta schemas definida
  FACBr.Configuracoes.Geral.MontarPathSchema := True;// FConfigReader.ReadString('MD', 'MontarPathSchema') = 'S';

  {
  if FACBr.DANFSe <> nil then
  begin
    // TTipoDANFSE = ( tpPadrao, tpIssDSF, tpFiorilli );
    FACBr.DANFSe.TipoDANFSE := tpPadrao;
    FACBr.DANFSe.Logo       := cadempresa.fstr('nfe_logpath') + '\NFSe\logocid.jpg';
    FACBr.DANFSe.Prefeitura := StrConcat(['PREFEITURA MUNICIPAL DE ', cadempresa.fstr('CIDADE_EMP'), sLineBreak,
                                              cadempresa.fstr('endereco_pref'), ' - ',
                                              cadempresa.fstr('bairro_pref'), sLineBreak,
                                              cadempresa.fstr('cidade_emp'), ' - ',
                                              FACBr.Configuracoes.WebServices.UF, ' - ',
                                              cadempresa.fstr('cep_pref')]);

    FACBr.DANFSe.PathPDF    := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\PDFNFSe';

    FACBr.DANFSe.Prestador.Logo := cadempresa.fstr('NFE_LOGPATH') + '\NFSe\logoemp.jpg';

    FACBr.DANFSe.MargemDireita  := 5;
    FACBr.DANFSe.MargemEsquerda := 5;
    FACBr.DANFSe.MargemSuperior := 5;
    FACBr.DANFSe.MargemInferior := 5;
    FACBr.DANFSe.Sistema := 'HW SISTEMAS';
  end;
  }

  // A propriedade CodigoMunicipio tem que ser a ultima a receber o seu valor
  // Pois ela se utiliza das demais configurações
  FACBr.LerCidades;
  { Isso é coisa antiga
  if MatchText(idibge.ToString(), ['3168606']) then //TO
  begin
    var IniParams := TMemIniFile.Create('');
    try
      IniParams.SetStrings(FACBr.Configuracoes.WebServices.Params);
      IniParams.WriteString(idibge.ToString(), 'Params', 'NaoDividir100:');
      IniParams.GetStrings(FACBr.Configuracoes.WebServices.Params);
    finally
      IniParams.Free;
    end;
  end;
  }
  FACBr.Configuracoes.Geral.CodigoMunicipio := Empresa.CMunIbge;
end;

procedure ACBrNFSeAdapter.ConfigurarImpressao;
var
  PathsLogos: array[0..1] of string;
  sFilePath: string;

  {$REGION 'Testa arquivos nos paths, Software e Arquivos\NFSe'}

  function TryFileExists(const FileName: string; var FilePath: string): Boolean;
  var
    I: Integer;
  begin
    Result := True;
    for I := 0 to 1 do
    begin
      FilePath := PathsLogos[I] + FileName;
      if FileExists(FilePath) then
        Exit;
    end;
    Result := False;
  end;

  {$ENDREGION}
begin
  if FDANFSe <> nil then
    Exit;

  FDANFSe := TACBrNFSeXDANFSeRL.Create(nil);

  FDANFSe.MargemDireita  := 5;
  FDANFSe.MargemEsquerda := 5;
  FDANFSe.MargemSuperior := 5;
  FDANFSe.MargemInferior := 5;
  FDANFSe.Sistema := 'HW SISTEMAS';

  PathsLogos[0] := ExtractFilePath(ParamStr(0));
  PathsLogos[1] := IncludeTrailingPathDelimiter(FConfig.WebService.Arquivos)+ 'NFSe\';

  if FConfig.OpcoesImpressao.LayoutNacional then
  begin
    FDANFSe.MargemDireita  := 2;
    FDANFSe.MargemEsquerda := 2;
    FDANFSe.MargemSuperior := 2;
    FDANFSe.MargemInferior := 2;
    FDANFSe.TipoDANFSE := tpPadraoNacional;

    if TryFileExists('nfse-empresa.jpg', sFilePath) or TryFileExists('nfse-nacional.jpg', sFilePath ) then
      FDANFSe.LogoNFSe := sFilePath;
  end
  else
    FDANFSe.TipoDANFSE := tpGeral;

  FDANFSe.MostraStatus   := False;
  FDANFSe.Prefeitura     := FConfig.OpcoesImpressao.Prefeitura;
  FDANFSe.PathPDF        := IncludeTrailingPathDelimiter(FSession.TemporaryFolder); //IncludeTrailingPathDelimiter(FConfig.WebService.Arquivos)+ 'NFSe\PDFNFSe';

  if TryFileExists('logocid.jpg', sFilePath) then
    FDANFSe.Logo := sFilePath;

  if TryFileExists('logoemp.jpg', sFilePath) then
    FDANFSe.Prestador.Logo := sFilePath;

  FACBr.DANFSE := FDANFSe;
end;

function ACBrNFSeAdapter.Consutar(const Input: ACBrConsultarInput): WSResposta;
var
  ChaveConsulta: string;
begin
  try
    FACBr.NotasFiscais.Clear();
    FACBr.NotasFiscais.LoadFromString( Input.XmlDps, True );

    case ResolverLayoutACBr() of
      lnfsProvedor:
        begin

          if FACBr.Provider.ConfigGeral.ConsultaLote
            and not Input.Protocolo.IsEmpty() then
          begin
            FACBr.ConsultarLoteRps( Input.Protocolo, Input.NumLote );

            Result := GerarResposta( TMetodo.tmConsultarLote );
          end

          else if FACBr.Provider.ConfigGeral.ConsultaSitLote
            and not Input.Protocolo.IsEmpty() then
          begin
            FACBr.ConsultarSituacao( Input.Protocolo, Input.NumLote );

            Result := GerarResposta( TMetodo.tmConsultarSituacao );
          end

          else if FACBr.Provider.ConfigGeral.ConsultaNFSe
            and not Input.NumRPS.IsEmpty() then
          begin
            FACBr.ConsultarNFSePorRps(
              Input.NumRPS, Input.Serie, Input.Tipo {, ACodVerificacao} {, ACNPJTomador} {, ANumLote}
            );

            Result := GerarResposta( TMetodo.tmConsultarNFSePorRps );
          end

          else
            raise Exception.Create('ACBrNFSeAdapter.Consutar Semp parametros suficientes para Consultar');
        end;

      lnfsPadraoNacionalv1,
      lnfsPadraoNacionalv101:
        begin
          ChaveConsulta := FACBr.NotasFiscais.Items[0].NFSe.infNFSe.ID.Trim();
          // Se nao tem a chave da nfse consulta pela chave do DPS
          if ChaveConsulta.IsEmpty() then
          begin
            ChaveConsulta := StringService.OnlyNumber( FACBr.NotasFiscais.Items[0].NFSe.InfID.ID );
            FACBr.ConsultarDPSPorChave( ChaveConsulta );
            ChaveConsulta := '';

            if FACBr.WebService.ConsultaNFSeporRps.Sucesso then
              ChaveConsulta := FACBr.WebService.ConsultaNFSeporRps.idNota.Trim();
          end;

          if not ChaveConsulta.IsEmpty() then
          begin
            FACBr.ConsultarNFSePorChave( ChaveConsulta ); // Consulta pela chave

            Result := GerarResposta( TMetodo.tmConsultarNFSePorChave ); // retorno, nota existe

            FACBr.ConsultarEvento( ChaveConsulta, ACBrNFSeXConversao.teCancelamentoSubstituicao, 1 ); // substituicao
            // Para assegurar o funcionamento correto em GerarResposta
            FACBr.WebService.ConsultarEvento.tpEvento := teCancelamentoSubstituicao; // ACBr precisa corrigir em PadraoNacional.Provider, falta 'e' + pra converer o enum > Response.tpEvento := StrTotpEvento(Ok, Copy(IDEvento, 51, 6));

            GerarResposta( tmConsultarEvento ); // nao usa o retorno desse metodo

            FACBr.ConsultarEvento( ChaveConsulta, ACBrNFSeXConversao.teCancelamento, 1 ); // consulta canc
            GerarResposta( tmConsultarEvento ); // nao usa o retorno desse metodo
          end
          else
            Result := GerarResposta( TMetodo.tmConsultarNFSePorRps );
        end;
    end;
  except on E: Exception do
    Result := WSResposta.Create( wsFalhaImplementacao, [ WSErro.Create('HW002', E.Message, '' )], '' );
  end;
end;

procedure ExtrairErros(ResponseErrors: TNFSeEventoCollection; var Erros: WSErros; var erroConexao: Boolean);
var
  I, J, K, Count: Integer;
  Repetido: Boolean;
begin
  if ResponseErrors.Count = 0 then
    Exit;

  I := Length(Erros);
  Count := I;

  SetLength(Erros, I + ResponseErrors.Count);

  for J := 0 to ResponseErrors.Count - 1 do
  begin
    Repetido := False;

    for K := Low(Erros) to High(Erros) do
      if (Erros[K].Codigo = ResponseErrors.Items[J].Codigo)
        and (Erros[K].Mensagem = ResponseErrors.Items[J].Descricao)
        and (Erros[K].Correcao = ResponseErrors.Items[J].Correcao)
      then
      begin
        Repetido := True;
        Break;
      end;

    if not Repetido then
    begin
      Erros[Count] := WSErro.Create(
        ResponseErrors.Items[J].Codigo,
        ResponseErrors.Items[J].Descricao,
        ResponseErrors.Items[J].Correcao
      );
      erroConexao := erroConexao or (Erros[Count].Codigo = Cod999);
      Inc(Count);
    end;
  end;

  SetLength(Erros, Count);
end;

function ACBrNFSeAdapter.GerarPdfAtual: string;
var
  ChaveNFSe: string;
begin
  ConfigurarImpressao();

  PrencherEmitente( FACBr.NotasFiscais.Items[0].NFSe.infNFSe.emit, FEmpresa);
  ResolverDadosAntesImpressao( FACBr.NotasFiscais.Items[0] );

  if FConfig.WebService.EnvioEmProducao then
    FACBr.DANFSE.Producao := TnfseSimNao.snSim
  else
    FACBr.DANFSE.Producao := TnfseSimNao.snNao;

  FACBr.NotasFiscais.ImprimirPDF;

  Result := FACBr.DANFSE.ArquivoPDF;
end;

function ACBrNFSeAdapter.GerarResposta(Metodo: TMetodo): WSResposta;
var
  errosWS: WSErros;
  resultWS: WSResultado;
  erroConexaoWS: Boolean;
  erroImplementacaoWS: Boolean;
  metodoSucessoWS: Boolean;
  sProtocolo: string;
  I: Integer;

  procedure HandleSubstituicaoResponse();
  begin
    if metodoSucessoWS then
      if not FACBr.NotasFiscais.Items[0].NFSe.subst.chSubstda.IsEmpty()
        or not FACBr.NotasFiscais.Items[0].NFSe.NfseSubstituida.IsEmpty()
        or not FACBr.NotasFiscais.Items[0].NFSe.RpsSubstituido.Numero.IsEmpty()
      then
        SetSubstituicaoResponse( CriarSubstituicaoResponse( sProtocolo ));
  end;
begin
  resultWS := wsFalhaComunicacao;
  erroConexaoWS := False;
  metodoSucessoWS := False;
  erroImplementacaoWS := False; // Falta descobrir o padrao do ACBr pra tratar como erro de implementacao
  SetLength(errosWS, 0);
  sProtocolo := '';

  // Todos os metodos sao padronizados, tem lista de erros e uma propriedade Successo
  case Metodo of

    // Emissao
    tmRecepcionarSincrono,
    tmGerar:
      with FACBr.WebService do
      begin

        {$REGION 'Extracao de Erros'}

        ExtrairErros( Emite.Erros, errosWS, erroConexaoWS );

        if FACBr.Configuracoes.Geral.ConsultaLoteAposEnvio
          and (Emite.ModoEnvio = meLoteAssincrono)
          and ((Emite.Protocolo <> '') or (Emite.NumeroLote <> ''))
        then
        begin
          if FACBr.Provider.ConfigGeral.ConsultaSitLote then
            ExtrairErros( ConsultaSituacao.Erros, errosWS, erroConexaoWS );

          if FACBr.Provider.ConfigGeral.ConsultaLote then
            ExtrairErros( ConsultaLoteRps.Erros, errosWS, erroConexaoWS );
        end;

        {$ENDREGION}

        // Protocolo
        sProtocolo := StringService.Default(
          Emite.Protocolo, StringService.Default( ConsultaSituacao.Protocolo, ConsultaLoteRps.Protocolo )
        );

        metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0)
          and Emite.Sucesso
          and not FACBr.NotasFiscais.Items[0].NFSe.Numero.Trim().IsEmpty;

        if metodoSucessoWS then
        begin
          SetAutorizacaoResponse( CriarAutorizacaoResponse( sProtocolo ));

          HandleSubstituicaoResponse();
        end;
      end;

    // Substituição NFSe
    tmSubstituirNFSe:
      begin
        ExtrairErros( FACBr.WebService.ConsultaLoteRps.Erros, errosWS, erroConexaoWS );

        metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0)
          and FACBr.WebService.SubstituiNFSe.Sucesso
          and not FACBr.NotasFiscais.Items[0].NFSe.Numero.Trim().IsEmpty;

        if metodoSucessoWS then
        begin
          SetAutorizacaoResponse( CriarAutorizacaoResponse( sProtocolo ));

          HandleSubstituicaoResponse();
        end;

      end;

    // Consulta Lote
    tmConsultarLote:
      begin
        ExtrairErros( FACBr.WebService.ConsultaLoteRps.Erros, errosWS, erroConexaoWS );

        metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0)
          and FACBr.WebService.ConsultaLoteRps.Sucesso
          and not FACBr.NotasFiscais.Items[0].NFSe.Numero.Trim().IsEmpty;

        if metodoSucessoWS then
        begin
          SetAutorizacaoResponse( CriarAutorizacaoResponse( sProtocolo ));

          HandleSubstituicaoResponse();
        end;
      end;

    // Consulta Lote
    tmConsultarSituacao:
      begin
        ExtrairErros( FACBr.WebService.ConsultaSituacao.Erros, errosWS, erroConexaoWS );

        metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0)
          and FACBr.WebService.ConsultaSituacao.Sucesso
          and not FACBr.NotasFiscais.Items[0].NFSe.Numero.Trim().IsEmpty;
      end;

    // Consulta Lote
    tmConsultarNFSePorRps:
      begin
        ExtrairErros( FACBr.WebService.ConsultaNFSeporRps.Erros, errosWS, erroConexaoWS );

        metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0)
          and FACBr.WebService.ConsultaNFSeporRps.Sucesso
          and not FACBr.NotasFiscais.Items[0].NFSe.Numero.Trim().IsEmpty;

        if metodoSucessoWS then
        begin
          SetAutorizacaoResponse( CriarAutorizacaoResponse( sProtocolo ));

          HandleSubstituicaoResponse();
        end;
      end;

    // Consulta por Chave NFSe
    tmConsultarNFSePorChave:
      with FACBr.WebService.ConsultaNFSe do
      begin
        ExtrairErros( Erros, errosWS, erroConexaoWS );

        metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0) and Sucesso
          and not FACBr.NotasFiscais.Items[0].NFSe.Numero.Trim().IsEmpty;

        if metodoSucessoWS then
        begin
          SetAutorizacaoResponse( CriarAutorizacaoResponse( Protocolo ) );

          HandleSubstituicaoResponse();
        end;
      end;

    // Cancelamento prefeitura
    tmCancelarNFSe:
      begin
        ExtrairErros( FACBr.WebService.CancelaNFSe.Erros, errosWS, erroConexaoWS );

        if FACBr.Configuracoes.Geral.ConsultaAposCancelar
          and FACBr.Provider.ConfigGeral.ConsultaNFSe then
        begin

          ExtrairErros( FACBr.WebService.ConsultaNFSe.Erros, errosWS, erroConexaoWS );

          metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0)
            and FACBr.WebService.ConsultaNFSe.SucessoCanc{?};
        end
        else
          metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0)
            and not String.IsNullOrWhiteSpace(
              FACBr.WebService.CancelaNFSe.RetCancelamento.Pedido.IdentificacaoNfse.Numero
            );

        if metodoSucessoWS then
        begin
          FCancelamentoResponse.Free();
          FCancelamentoResponse := CriarCancelamentoResponse();
        end;
      end;

    // Consulta de Eventos
    tmConsultarEvento:
      with FACBr.WebService.ConsultarEvento do
      begin
        ExtrairErros( Erros, errosWS, erroConexaoWS );

        metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0) and Sucesso
          and (idNota = FACBr.NotasFiscais.Items[0].NFSe.infNFSe.ID);

        if metodoSucessoWS then
          case tpEvento of
            TtpEvento.teCancelamento:
              SetCancelamentoResponse( CriarCancelamento( FACBr.WebService.ConsultarEvento, Data ));
            TtpEvento.teCancelamentoSubstituicao:
              SetCancPorSubstResponse( CriarCancelamento( FACBr.WebService.ConsultarEvento, Data ));
          end;
      end;

    // Envio de eventos
    tmEnviarEvento:
      with FACBr.WebService.EnviarEvento do
      begin
        ExtrairErros( Erros, errosWS, erroConexaoWS );

        metodoSucessoWS := not erroConexaoWS and (Length(errosWS) = 0) and Sucesso
          and (idNota = FACBr.NotasFiscais.Items[0].NFSe.infNFSe.ID);

        if metodoSucessoWS then
          case tpEvento of
            TtpEvento.teCancelamento:
              SetCancelamentoResponse( CriarCancelamento( FACBr.WebService.EnviarEvento, Data ));
            TtpEvento.teCancelamentoSubstituicao:
              SetCancPorSubstResponse( CriarCancelamento( FACBr.WebService.EnviarEvento, Data ));//? ta certo isso, tem de testar
          end;
      end;

    else
      raise Exception.Create('ACBrNFSeAdapter.GerarResposta Metodo Unknow');

  end;

  if erroConexaoWS then
    resultWS := wsFalhaComunicacao

  else if erroImplementacaoWS then
    resultWS := wsFalhaImplementacao

  else if ExisteErroDeEmissao(errosWS) then
    resultWS := wsRejeicao

  else if metodoSucessoWS then
    resultWS :=  wsSucesso

  else
    resultWS := wsEmProcessamento;

  Result := WSResposta.Create( resultWS, errosWS, sProtocolo );
end;

function ACBrNFSeAdapter.ResolverLayoutACBr: TLayoutNFSe;
begin
  /// ACBr com ApiPropria quer dizer que o Provedor tem o Padrao Nacional em seus servidores,
  /// Mesmo assim o ACBr precisa ser configurado com lnfsProvedor,
  /// Esse metodo encapsula a configuração do ACBr quando está usando a ApiPropria, mantém o layout gerenciavel
  ///  que foi configurado no sistema.

  if not FConfig.WebService.ApiPropria then
    Result := FACBr.Configuracoes.Geral.LayoutNFSe
  else
  begin
    case FConfig.LayoutNFSe of
      lytPrefeitura       : Result := TLayoutNFSe.lnfsProvedor;
      lytNacionalSemIbsCbs: Result := TLayoutNFSe.lnfsPadraoNacionalv1;
      lytNacionalComIbsCbs: Result := TLayoutNFSe.lnfsPadraoNacionalv101;
    end;
  end;
end;

function ACBrNFSeAdapter.GetAutorizacaoResponse: NFSeResponseAutorizacaoModel;
begin
  Result := FAutorizacaoResponse;
end;

function ACBrNFSeAdapter.GetCancelamentoResponse: NFSeResponseCancelamentoModel;
begin
  Result := FCancelamentoResponse;
end;

function ACBrNFSeAdapter.GetCancPorSubstResponse: NFSeResponseCancelamentoModel;
begin
  Result := FCancPorSubstResponse;
end;

function ACBrNFSeAdapter.GetNotaFiscalRequest(): TNotaFiscal;
var
  ok: Boolean;
begin
  FACBr.NotasFiscais.Clear();

  Result := FACBr.NotasFiscais.New;

  Result.NFSe.RegimeEspecialTributacao := FACBr.Provider.StrToRegimeEspecialTributacao(
    ok,
    Ord(FConfig.RegEsTrib).ToString()
  );
  //NFSe.RegimeEspecialTributacao := Provider.StrToRegimeEspecialTributacao(ok, DPS.RegEspTrib.ToString());
end;

function ACBrNFSeAdapter.GetNotaFiscalResponse: TNotaFiscal;
begin
  Result := FACBr.NotasFiscais.Items[0];
end;

function ACBrNFSeAdapter.GetSubstituicaoResponse: NFSeResponseSubstituicaoModel;
begin
  Result := FSubstituicaoResponse;
end;

procedure ACBrNFSeAdapter.Imprimir(const XMLsNFSe: TArrayString; Canceladas: TArrayBoolean);
var
  I: Integer;
begin
  ConfigurarImpressao();

  FACBr.NotasFiscais.Clear();

  for I := 0 to High(XMLsNFSe) do
  begin
    FACBr.NotasFiscais.LoadFromString( XMLsNFSe[I], True );

    PrencherEmitente( FACBr.NotasFiscais.Items[I].NFSe.infNFSe.emit, FEmpresa);
    ResolverDadosAntesImpressao( FACBr.NotasFiscais.Items[I] );

    if Canceladas[I] then
      FACBr.NotasFiscais.Items[0].NFSe.SituacaoNfse := TStatusNFSe.snCancelado;
  end;

  if FACBr.NotasFiscais.Count = 0 then
    raise Exception.Create('ACBrNFSeAdapter.Imprimir Lote NotasFiscais.Count = 0');

  if FConfig.WebService.EnvioEmProducao then
    FACBr.DANFSE.Producao := TnfseSimNao.snSim
  else
    FACBr.DANFSE.Producao := TnfseSimNao.snNao;

  FACBr.DANFSE.ImprimeCanhoto := True;

  FACBr.NotasFiscais.Imprimir();
end;

procedure ACBrNFSeAdapter.Imprimir(const XMLNFSe: string; Cancelada, Producao: Boolean);
begin
  ConfigurarImpressao();

  // ACBr está resolvendo o problema dos caracteres

  FACBr.NotasFiscais.Clear();
  FACBr.NotasFiscais.LoadFromString( XMLNFSe, True );

  if FACBr.NotasFiscais.Count = 0 then
    raise Exception.Create('ACBrNFSeAdapter.Imprimir NotasFiscais.Count = 0');

  PrencherEmitente( FACBr.NotasFiscais.Items[0].NFSe.infNFSe.emit, FEmpresa);
  ResolverDadosAntesImpressao( FACBr.NotasFiscais.Items[0] );

  if Cancelada then
    FACBr.NotasFiscais.Items[0].NFSe.SituacaoNfse := TStatusNFSe.snCancelado;

  if Producao then
    FACBr.DANFSE.Producao := TnfseSimNao.snSim
  else
    FACBr.DANFSE.Producao := TnfseSimNao.snNao;

  FACBr.DANFSE.ImprimeCanhoto := True;

  FACBr.NotasFiscais.Imprimir();
end;

function ACBrNFSeAdapter.ListaRegimesEspecialTributacao: string;
var
  bOK: Boolean;
  iReg: Integer;
  sReg: string;
  eReg: TnfseRegimeEspecialTributacao;
begin

  Result := '';

  try
    bOK := False;
    for iReg := Ord(Low(TnfseRegimeEspecialTributacao)) to Ord(High(TnfseRegimeEspecialTributacao)) do
    begin
      eReg := FACBr.Provider.StrToRegimeEspecialTributacao(bOK, iReg.ToString());
      if bOK then
      begin
        sReg := FACBr.Provider.RegimeEspecialTributacaoDescricao(eReg);

        if not sReg.IsEmpty() then
          Result := Result + IfThen(not Result.IsEmpty(), sLineBreak) + sReg;
      end;
    end;

  except on E: Exception do
    begin
      Result := '';
      Exit();
    end;
  end;
end;

function ACBrNFSeAdapter.Emitir(const NumeroLote: string): WSResposta;
begin
  try
    //if FACBr.Configuracoes.WebServices.Ambiente = taProducao then
      //raise Exception.Create('FACBr.Configuracoes.WebServices.Ambiente == taProducao');

    FACBr.NotasFiscais.NumeroLote := NumeroLote;
    FACBr.NotasFiscais.Transacao := True;

    ResolverParticularidadesProvedor();

    FACBr.Emitir( NumeroLote, meAutomatico, False);

    Result := GerarResposta( TMetodo.tmGerar );
                                                      
    if (Result.Resultado = wsEmProcessamento) and FConfig.WebService.ApiPropria then
      Result := ResolverProcessamentoProvedor(Result);
    
  except on E: Exception do
    Result := WSResposta.Create( wsFalhaImplementacao, [ WSErro.Create('HW001', E.Message, '' )], '' );
  end;
end;

function ACBrNFSeAdapter.ExisteErroDeEmissao(var ErrosWS: WSErros): Boolean;
begin
  if Length(ErrosWS) = 1  then
  begin
    case FACBr.Configuracoes.Geral.Provedor of
      proISSIntel:
        if (ErrosWS[0].Codigo = 'S50') and (ErrosWS[0].Mensagem = 'Lote ainda não processado') then
          SetLength(ErrosWS, 0);
    end;
  end;

  Result := Length(ErrosWS) > 0;
end;

function ACBrNFSeAdapter.CriarAutorizacaoResponse(const AProtocolo: string): NFSeResponseAutorizacaoModel;
var
  Nota: TNotaFiscal;
  ChaveNFSe: string;
  DataProcessamento: TDateTime;
  NumeroNFSe: Int64;
  ValorTotalRetencoes, ValorLiquido, BaseCalculoISS, AliquotaISS, ValorISS: Currency;
  bSetIssNull: Boolean;
begin
  Nota := FACBr.NotasFiscais.Items[0];

  ChaveNFSe := Nota.NFSe.infNFSe.ID;
  if (ChaveNFSe.Length = 53) and ChaveNFSe.StartsWith('NFS', True)
    and StringService.OnlyNumber(ChaveNFSe).Equals(ChaveNFSe.Substring(3)) then
    ChaveNFSe := ChaveNFSe.Substring(3);

  if ResolverLayoutACBr() = TLayoutNFSe.lnfsProvedor then
  begin
    ChaveNFSe := '';
    DataProcessamento := Nota.NFSe.DataEmissao;
    NumeroNFSe := StrToInt64(Nota.NFSe.Numero);
    ValorTotalRetencoes := Nota.NFSe.ValoresNfse.vTotalRet;//?
    ValorLiquido := Nota.NFSe.ValoresNfse.ValorLiquidoNfse;
    BaseCalculoISS := Nota.NFSe.ValoresNfse.BaseCalculo;
    AliquotaISS := Nota.NFSe.ValoresNfse.Aliquota;
    ValorISS := Nota.NFSe.ValoresNfse.ValorIss;
  end
  else
  begin
    ChaveNFSe := StringService.OnlyNumber( Nota.NFSe.infNFSe.ID );
    DataProcessamento := Nota.NFSe.infNFSe.dhProc;
    NumeroNFSe := StrToInt64(Nota.NFSe.infNFSe.nNFSe);
    ValorTotalRetencoes := Nota.NFSe.infNFSe.valores.vTotalRet;
    ValorLiquido := Nota.NFSe.infNFSe.valores.ValorLiquidoNfse;
    BaseCalculoISS := Nota.NFSe.infNFSe.valores.BaseCalculo;
    AliquotaISS := Nota.NFSe.infNFSe.valores.Aliquota;
    ValorISS := Nota.NFSe.infNFSe.valores.ValorIss;
  end;

  bSetIssNull := (BaseCalculoISS <= 0) and (AliquotaISS <= 0) and (ValorISS <= 0);

  Result := NFSeResponseAutorizacaoModel.Create(
    ChaveNFSe,
    // Caso CodigoVerificacao = ChaveNFSe entao grava null no campo
    {CodigoVerificacao} StringNullable.CreateOrNull( Nota.NFSe.CodigoVerificacao, ChaveNFSe ),
    {cStat} Nota.NFSe.infNFSe.cStat.ToString().Substring(0,4),
    DataProcessamento,
    NumeroNFSe,
    {NumeroDFSe} Int64Nullable.CreateOrNull(StrToInt64Def(Nota.NFSe.infNFSe.nDFSe, 0)),
      {Valores} NFSeResponseAutorizacaoValoresModel.Create(
      ValorLiquido,
      {ValotTotalNF} Nota.NFSe.infNFSe.IBSCBS.totCIBS.vTotNF,
      ValorTotalRetencoes,
      {BaseCalculoISS} CurrencyNullable.Create( BaseCalculoISS, bSetIssNull ),
      {AliquotaISS} CurrencyNullable.Create( AliquotaISS, bSetIssNull ),
      {ValorISS} CurrencyNullable.Create( ValorISS, bSetIssNull )
    ),
    {PercentualRedutor} CurrencyNullable.CreateOrNull( Nota.NFSe.infNFSe.IBSCBS.pRedutor ),
    {Protocolo} StringNullable.CreateOrNull( AProtocolo ),
    {ChaveNFSeSubstituida} Nota.NFSe.subst.chSubstda,
    {XmlAutorizacao} StringNullable.CreateOrNull( Nota.XmlNfse )
  );
end;

function ACBrNFSeAdapter.CriarCancelamento(
  WSResponse: TNFSeWebserviceResponse; DataCanc: TDateTime
): NFSeResponseCancelamentoModel;
begin
  Result := NFSeResponseCancelamentoModel.Create(
    DataCanc,
    IntegerNullable.CreateOrNull( WSResponse.nSeqEvento ),
    StringNullable.CreateOrNull( WSResponse.XmlRetorno ),
    ocnWebService
  );
end;

function ACBrNFSeAdapter.CriarCancelamentoResponse: NFSeResponseCancelamentoModel;
begin
  case ResolverLayoutACBr() of
    lnfsProvedor:
      begin
        if FACBr.Configuracoes.Geral.ConsultaAposCancelar
          and FACBr.Provider.ConfigGeral.ConsultaNFSe then
        begin
          Result := NFSeResponseCancelamentoModel.Create(
            FACBr.WebService.ConsultaNFSe.DataCanc, //? FACBr.WebService.ConsultaNFSe.InfConsultaNFSe.DataRecibo,
            IntegerNullable.CreateOrNull( FACBr.WebService.ConsultaNFSe.nSeqEvento ),
            StringNullable.CreateOrNull( FACBr.WebService.ConsultaNFSe.XmlRetorno ),
            ocnWebService
          );
        end
        else
          Result := NFSeResponseCancelamentoModel.Create(
            FACBr.WebService.CancelaNFSe.RetCancelamento.DataHora,
            IntegerNullable.CreateOrNull( FACBr.WebService.CancelaNFSe.nSeqEvento ),
            StringNullable.CreateOrNull( FACBr.WebService.CancelaNFSe.XmlRetorno ),
            ocnWebService
          );
      end;

    lnfsPadraoNacionalv1,
    lnfsPadraoNacionalv101:
      begin
        Result := NFSeResponseCancelamentoModel.Create(
          FACBr.WebService.EnviarEvento.Data,
          IntegerNullable.CreateOrNull( FACBr.WebService.EnviarEvento.nSeqEvento ),
          StringNullable.CreateOrNull( FACBr.WebService.EnviarEvento.XmlRetorno ),
          ocnWebService
        );
      end;
  end;
end;

function ACBrNFSeAdapter.CriarSubstituicaoResponse(const AProtocolo: string): NFSeResponseSubstituicaoModel;
var
  dhCanc: TDateTime;
begin
  if FACBr.WebService.SubstituiNFSe.RetCancelamento.DataHora > 0 then
    dhCanc := FACBr.WebService.SubstituiNFSe.RetCancelamento.DataHora
  else if FACBr.NotasFiscais.Items[0].NFSe.infNFSe.dhProc > 0 then
    dhCanc := FACBr.NotasFiscais.Items[0].NFSe.infNFSe.dhProc
  else
    dhCanc := FACBr.NotasFiscais.Items[0].NFSe.DataEmissao;

  Result := NFSeResponseSubstituicaoModel.Create(
    Self.CriarAutorizacaoResponse( AProtocolo ),
    NFSeResponseCancelamentoModel.Create(
      dhCanc,
      IntegerNullable.CreateOrNull( FACBr.WebService.SubstituiNFSe.nSeqEvento ),
      StringNullable.CreateOrNull( FACBr.WebService.SubstituiNFSe.XmlRetorno ),
      ocnWebService
    )
  );
end;

function ACBrNFSeAdapter.ObterXmlPedidoCanc: string;
begin
  case ResolverLayoutACBr() of
    lnfsProvedor:
      Result := FACBr.WebService.CancelaNFSe.XmlRetorno;

    lnfsPadraoNacionalv1,
    lnfsPadraoNacionalv101:
      Result := FACBr.WebService.EnviarEvento.XmlEnvio;
  end;
end;

procedure ACBrNFSeAdapter.ResolverParticularidadesProvedor;
var
  I: Integer;
  cIntContrib: string;
begin
  case FACBr.Configuracoes.Geral.Provedor of
    proEL:
      begin
        for I := 0 to FACBr.NotasFiscais.Count - 1 do
        begin
          cIntContrib := FACBr.NotasFiscais.Items[0].NFSe.Servico.ItemListaServico.Substring(0,4);
          if cIntContrib.StartsWith('0') then
            cIntContrib := cIntContrib.Substring(1);
          
          FACBr.NotasFiscais.Items[0].NFSe.Servico.CodigoInterContr := cIntContrib;
        end;
      end;
  end;
end;

function ACBrNFSeAdapter.ResolverProcessamentoProvedor(const Default: WSResposta): WSResposta;
var
  ChaveConsulta: string;
  i, qTentativas, Intervalo: Integer;
begin
  Result := Default;
  
  case FACBr.Configuracoes.Geral.Provedor of
    proEL:      
      begin        
        ChaveConsulta := StringService.OnlyNumber(FACBr.NotasFiscais.Items[0].NFSe.InfID.ID);
        qTentativas := 0;
        
        with FACBr.Configuracoes.WebServices do
        begin                       
          Sleep(AguardarConsultaRet);
          
          Intervalo := max(IntervaloTentativas, 1000);

          while True do
          begin
            FACBr.ConsultarDPSPorChave(ChaveConsulta);

            Result := GerarResposta(TMetodo.tmConsultarNFSePorRps);

            Inc(qTentativas);

            if (Result.Resultado = wsEmProcessamento) and (qTentativas < Tentativas) then
              Sleep(Intervalo)
            else
              Break;
          end;
        end;
      end;
  end;
end;

function ACBrNFSeAdapter.ObterXmlDPS: string;
begin
  if FACBr.NotasFiscais.Count = 0 then
    raise Exception.Create('ACBrNFSeAdapter.ObterXmlDPS NotasFiscais.Count = 0');

  Result := FACBr.NotasFiscais.Items[0].GerarXML();//FACBr.NotasFiscais.Items[0].XmlRps;
end;

function ACBrNFSeAdapter.SalvarPDF(const XMLNFSe: string; Cancelada, Producao: Boolean; out PdfFile: string): WSResposta;
var
  ChaveNFSe: string;
begin
  ConfigurarImpressao();

  FACBr.NotasFiscais.Clear();
  FACBr.NotasFiscais.LoadFromString( XMLNFSe, True );

  PrencherEmitente( FACBr.NotasFiscais.Items[0].NFSe.infNFSe.emit, FEmpresa);
  ResolverDadosAntesImpressao( FACBr.NotasFiscais.Items[0] );

  if Cancelada then
    FACBr.NotasFiscais.Items[0].NFSe.SituacaoNfse := TStatusNFSe.snCancelado;

  if Producao then
    FACBr.DANFSE.Producao := TnfseSimNao.snSim
  else
    FACBr.DANFSE.Producao := TnfseSimNao.snNao;

  FACBr.NotasFiscais.ImprimirPDF;
//  FACBr.NotasFiscais.Items[0].ImprimirPDF();

  PdfFile := FACBr.DANFSE.ArquivoPDF; //FACBr.NotasFiscais.Items[0].NomeArq + '.pdf';
end;

procedure ACBrNFSeAdapter.SetAutorizacaoResponse(const Value: NFSeResponseAutorizacaoModel);
begin
  if FAutorizacaoResponse <> Value then
  begin
    FAutorizacaoResponse.Free;
    FAutorizacaoResponse := Value;
  end;
end;

procedure ACBrNFSeAdapter.SetCancelamentoResponse(const Value: NFSeResponseCancelamentoModel);
begin
  if FCancelamentoResponse <> Value then
  begin
    FCancelamentoResponse.Free;
    FCancelamentoResponse := Value;
  end;
end;

procedure ACBrNFSeAdapter.SetCancPorSubstResponse(const Value: NFSeResponseCancelamentoModel);
begin
  if FCancPorSubstResponse <> Value then
  begin
    FCancPorSubstResponse.Free;
    FCancPorSubstResponse := Value;
  end;
end;

procedure ACBrNFSeAdapter.SetSubstituicaoResponse(const Value: NFSeResponseSubstituicaoModel);
begin
  if FSubstituicaoResponse <> Value then
  begin
    FSubstituicaoResponse.Free;
    FSubstituicaoResponse := Value;
  end;
end;

function ACBrNFSeAdapter.Substituir(const NumeroLote: string; const Input: ACBrSubstituirInput): WSResposta;
var
  infCanc: TInfCancelamento;
begin
  try
    // LAYOUT ABRASF 1.0 NAO TESTADO
    // PARECE QUE A SUBSTITUICAO É DIRETO NA EMISSAO, SE FOR O CASO AQUI PODE CHAMAR O EMITIR DIRETO,
    // POIS O CONVERTER JÁ VAI TER FEITO O PREENCHIMENTO DO OBJETO CORRETAMENTE      
    // A QUESTAO É COMO IDENTIFICAR QUE É O LAYOUT ABRASF 1.0 ?????

    FACBr.NotasFiscais.NumeroLote := NumeroLote;
    FACBr.NotasFiscais.Transacao := True;

    case FACBr.Configuracoes.Geral.Provedor of
      proEL:
        Result := Self.Emitir( NumeroLote );

      proAssessorPublico, proBauhaus, proElotech, proFiorilli, proGoverna, proiiBrasil, proISSLencois, proSiat, 
      proSigep:
        begin
          infCanc := TInfCancelamento.Create;

          try
            infCanc.NumeroNFSe      := Input.NumeroNFSe;
            infCanc.SerieNFSe       := Input.Serie;
            infCanc.CodCancelamento := Input.CodigoMotivo;
            infCanc.MotCancelamento := Input.Justificativa;
            infCanc.NumeroLote      := Input.NumeroLote;
            infCanc.CodVerificacao  := Input.CodigoVerificacao;
            //infCanc.CodMunicipio    := StrToIntDef(sCodMun, 0);

            ResolverParticularidadesProvedor();

            FACBr.SubstituirNFSe(infCanc);
          finally
            infCanc.Free;
          end;

          Result := GerarResposta( TMetodo.tmSubstituirNFSe );
        end;
        
      else
      begin
        ResolverParticularidadesProvedor();
        
        FACBr.SubstituirNFSe(
          Input.NumeroNFSe,
          Input.Serie,
          Input.CodigoMotivo,
          Input.Justificativa,
          Input.NumeroLote,
          Input.CodigoVerificacao,
          ''
        );

        Result := GerarResposta( TMetodo.tmSubstituirNFSe );
      end;
    end;

  except on E: Exception do
    Result := WSResposta.Create( wsFalhaImplementacao, [ WSErro.Create('HW004', E.Message, '' )], '' );
  end;
end;

end.
