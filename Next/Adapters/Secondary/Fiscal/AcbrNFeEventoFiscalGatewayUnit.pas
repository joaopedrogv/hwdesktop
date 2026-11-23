unit AcbrNFeEventoFiscalGatewayUnit;

interface

uses
  IConfiguracoesRepositoryUnit, IEventoDFeFiscalGatewayUnit,
  EventoDFeTransmissaoTypesUnit, TipoEventoDFeUnit, IConfigReaderAndWriterUnit;

type
  TAcbrNFeEventoFiscalGateway = class(TInterfacedObject, IEventoDFeFiscalGateway)
  private
    FConfiguracoes: IConfiguracoesRepository;
    FConfigReader: IConfigReader;
  public
    constructor Create(const AConfiguracoes: IConfiguracoesRepository; const AConfigReader: IConfigReader);
    function Preparar(const ARequisicao: TEventoDFeRequisicaoPreparo):
      TEventoDFePreparacao;
    function Transmitir(const APreparado: IEventoDFeEnvioPreparado):
      TEventoDFeResultadoTransmissao;
    function ConsultarSituacao(const AUf: string;
      const AChaveDocumento: string; const ATipoEvento: TipoEventoDFe;
      const ANSeqEvento: Integer): TEventoDFeResultadoConsulta;
  end;

implementation

uses
  System.SysUtils, System.StrUtils,
  ACBrDFe.Conversao, ACBrDFeConfiguracoes, ACBrNFe, ACBrNFeConfiguracoes, ACBrDFeSSL,
  ACBrNFe.EventoClass, ACBrNFe.EnvEvento, ACBrNFe.RetConsSit, ACBrNFe.RetEnvEvento,
  ACBrNFeWebServices, pcnConversaoNFe,
  ConfigLegacyTypes;

const
  VER_APLIC_EVENTO = '4.0.9.6.3.6';

type
  TConfiguracaoFiscalAcbr = record
    ArquivoPFX: string;
    Senha: string;
    NumeroSerie: string;
    PathSalvar: string;
    Ambiente: Integer;
    LibDFe: Integer;
    SSLCryptLib: Integer;
    SSLHttpLib: Integer;
    SSLXmlSignLib: Integer;
  end;

  TAcbrEnvioPreparado = class(TInterfacedObject, IEventoDFeEnvioPreparado)
  private
    FNFe: TACBrNFe;
    FXmlEnvio: string;
    FAmbiente: Integer;
    function GetXmlEnvio: string;
    function GetAmbiente: Integer;
  public
    constructor Create(const ARequisicao: TEventoDFeRequisicaoPreparo;
      const AConfiguracoes: IConfiguracoesRepository; const AConfigReader: IConfigReader);
    destructor Destroy; override;
    function Enviar: TEventoDFeResultadoTransmissao;
  end;

function PreparacaoVazia: TEventoDFePreparacao;
begin
  Result.Preparado := nil;
  Result.XmlEnvio := '';
  Result.Ambiente := 0;
  Result.ErroPreparacao := '';
end;

function ResultadoTransmissaoVazio: TEventoDFeResultadoTransmissao;
begin
  Result.Classe := crSemResposta;
  Result.OrigemResultado := orNenhuma;
  Result.CStatLote := 0;
  Result.CStatEvento := 0;
  Result.XMotivo := '';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlRetorno := '';
  Result.XmlProcEvento := '';
  Result.ErroTransporte := '';
end;

function ResultadoConsultaVazio: TEventoDFeResultadoConsulta;
begin
  Result.Respondeu := False;
  Result.CStatNFe := 0;
  Result.XMotivoNFe := '';
  Result.EventoEncontrado := False;
  Result.NSeqEventoEncontrado := 0;
  Result.CStatEvento := 0;
  Result.XMotivoEvento := '';
  Result.NProt := '';
  Result.DhRegEvento := 0;
  Result.XmlProcEvento := '';
  Result.ErroTransporte := '';
end;

function TipoEventoAcbr(const ATipoEvento: TipoEventoDFe): TACBrTipoEvento;
begin
  case ATipoEvento of
    teAtualizacaoPrevisaoEntrega: Result := teAtualizacaoDataPrevisaoEntrega;
    // teImobilizacaoItem existe também em TACBrTipoEvento; a qualificação evita a ambiguidade.
    TipoEventoDFe.teImobilizacaoItem: Result := teImobilizacaoItem;
  else
    raise Exception.CreateFmt(
      'Tipo de evento DF-e não suportado pelo gateway fiscal: %d',
      [TipoEventoDFeCodigo(ATipoEvento)]);
  end;
end;

function TipoAutorAcbr(const ATpAutor: Integer): TpcnTipoAutor;
begin
  case ATpAutor of
    1: Result := taEmpresaEmitente;
    2: Result := taEmpresaDestinataria;
  else
    raise Exception.CreateFmt('tpAutor do evento DF-e inválido: %d', [ATpAutor]);
  end;
end;

function AmbienteProducao(const AValor: string): Boolean;
var
  Indice: Integer;
  Normalizado: string;
begin
  Normalizado := '';
  for Indice := 1 to Length(AValor) do
    case AValor[Indice] of
      'á', 'à', 'â', 'ã', 'ä', 'Á', 'À', 'Â', 'Ã', 'Ä':
        Normalizado := Normalizado + 'a';
      'é', 'è', 'ê', 'ë', 'É', 'È', 'Ê', 'Ë':
        Normalizado := Normalizado + 'e';
      'í', 'ì', 'î', 'ï', 'Í', 'Ì', 'Î', 'Ï':
        Normalizado := Normalizado + 'i';
      'ó', 'ò', 'ô', 'õ', 'ö', 'Ó', 'Ò', 'Ô', 'Õ', 'Ö':
        Normalizado := Normalizado + 'o';
      'ú', 'ù', 'û', 'ü', 'Ú', 'Ù', 'Û', 'Ü':
        Normalizado := Normalizado + 'u';
      'ç', 'Ç':
        Normalizado := Normalizado + 'c';
    else
      Normalizado := Normalizado + AValor[Indice];
    end;

  // WEBSERV_AMBIENTE é comparado sem acento e sem caixa; qualquer outro valor cai em homologação (§3.2).
  Result := SameText(Trim(Normalizado), 'producao');
end;

function LerConfiguracaoFiscal(
  const AConfiguracoes: IConfiguracoesRepository; const AConfigReader: IConfigReader): TConfiguracaoFiscalAcbr;
var
  LDados: ConfigLegacyData;
  section: string;
begin
  LDados := AConfiguracoes.GetLegacy(
    [ceCertDigCaminho, ceCertDigSenha, ceCertDigNumSerie, ceWSAmbiente, ceWSArquivos]);
  if not LDados.HasValue(ceCertDigCaminho) then
    raise Exception.Create('A configuração fiscal da empresa não foi encontrada.');

  Result.ArquivoPFX := Trim(LDados.GetString(ceCertDigCaminho));
  if Result.ArquivoPFX = '' then
    raise Exception.Create('O certificado digital da empresa não está configurado.');

  Result.Senha := LDados.GetString(ceCertDigSenha);
  Result.NumeroSerie := Trim(LDados.GetString(ceCertDigNumSerie));
  Result.PathSalvar := Trim(LDados.GetString(ceWSArquivos));
  if AmbienteProducao(LDados.GetString(ceWSAmbiente)) then
    Result.Ambiente := 1
  else
    Result.Ambiente := 2;

  section := 'NFe_SSLib';
  if AConfigReader.ReadString(section, 'Ativo') <> 'S' then
    section := 'SSLib';

  Result.LibDFe := AConfigReader.ReadInteger(
    IfThen(section = 'SSLib', 'Sistema', section), 'libNFe', Ord(libCapicom));
  if not (TSSLLib(Result.LibDFe) in [libOpenSSL, libCapicom, libWinCrypt]) then
    Result.LibDFe := Ord(libOpenSSL);

  Result.SSLCryptLib := AConfigReader.ReadInteger(section, 'SSLCryptLib', -1);
  Result.SSLHttpLib := AConfigReader.ReadInteger(section, 'SSLHttpLib', -1);
  Result.SSLXmlSignLib := AConfigReader.ReadInteger(section, 'SSLXmlSignLib', -1);
end;

procedure AplicarConfiguracaoFiscal(const ANFe: TACBrNFe;
  const AConfiguracao: TConfiguracaoFiscalAcbr; const AUf: string);
var
  sslLib: TSSLLib;
begin
  sslLib := TSSLLib(AConfiguracao.LibDFe);

  ANFe.SSL.DescarregarCertificado;

  ANFe.Configuracoes.Certificados.NumeroSerie := '';
  ANFe.Configuracoes.Certificados.ArquivoPFX  := '';
  ANFe.Configuracoes.Certificados.Senha       := '';

  ANFe.Configuracoes.Certificados.ArquivoPFX  := IfThen(sslLib <> libCapicom, AConfiguracao.ArquivoPFX);
  ANFe.Configuracoes.Certificados.NumeroSerie := IfThen(sslLib <> libOpenSSL, AConfiguracao.NumeroSerie);
  ANFe.Configuracoes.Certificados.Senha       := AnsiString(AConfiguracao.Senha);

  ANFe.Configuracoes.Arquivos.PathSalvar := AConfiguracao.PathSalvar;
  ANFe.Configuracoes.WebServices.UF := AUf;
  if AConfiguracao.Ambiente = 1 then
    ANFe.Configuracoes.WebServices.Ambiente := taProducao
  else
    ANFe.Configuracoes.WebServices.Ambiente := taHomologacao;

  ANFe.Configuracoes.Geral.SSLLib := sslLib;

  // Valor ausente no INI (-1) preserva o padrão do ACBr.
  if AConfiguracao.SSLCryptLib >= 0 then
    ANFe.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(AConfiguracao.SSLCryptLib);

  if AConfiguracao.SSLHttpLib >= 0 then
    ANFe.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(AConfiguracao.SSLHttpLib);

  if AConfiguracao.SSLXmlSignLib >= 0 then
    ANFe.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(AConfiguracao.SSLXmlSignLib);
end;

procedure ValidarEnvelopeDoEvento(const ARequisicao: TEventoDFeRequisicaoPreparo);
begin
  if Trim(ARequisicao.ChaveDocumento) = '' then
    raise Exception.Create('A chave do documento do evento DF-e não foi informada.');

  if Trim(ARequisicao.Uf) = '' then
    raise Exception.Create('A UF do emitente do evento DF-e não foi informada.');

  if Trim(ARequisicao.Cnpj) = '' then
    raise Exception.Create('O CNPJ do emitente do evento DF-e não foi informado.');

  if ARequisicao.COrgao <= 0 then
    raise Exception.Create('O código IBGE da UF do emitente do evento DF-e não foi informado.');

  if ARequisicao.TpAutor <= 0 then
    raise Exception.Create('O tipo de autor do evento DF-e não foi informado.');

  if ARequisicao.COrgaoAutor <= 0 then
    raise Exception.Create(
      'O código IBGE do órgão autor do evento DF-e não foi informado.');

  if ARequisicao.IdLote <= 0 then
    raise Exception.Create('O lote do evento DF-e não foi informado.');

  if ARequisicao.NSeqEvento <= 0 then
    raise Exception.Create('A sequência do evento DF-e não foi alocada.');

  if ARequisicao.DhEvento <= 0 then
    raise Exception.Create('A data do evento DF-e não foi informada.');
end;

{ TAcbrEnvioPreparado }

constructor TAcbrEnvioPreparado.Create(
  const ARequisicao: TEventoDFeRequisicaoPreparo;
  const AConfiguracoes: IConfiguracoesRepository; const AConfigReader: IConfigReader);
var
  LConfiguracao: TConfiguracaoFiscalAcbr;
  LNFe: TACBrNFe;
  LEvento: TInfEventoCollectionItem;
  LImobilizacao: TgImobilizacaoCollectionItem;
  LIndice: Integer;
begin
  inherited Create;

  ValidarEnvelopeDoEvento(ARequisicao);
  LConfiguracao := LerConfiguracaoFiscal(AConfiguracoes, AConfigReader);
  FAmbiente := LConfiguracao.Ambiente;

  LNFe := nil;
  try
    LNFe := TACBrNFe.Create(nil);
    AplicarConfiguracaoFiscal(LNFe, LConfiguracao, ARequisicao.Uf);

    LNFe.EventoNFe.idLote := ARequisicao.IdLote;
    LNFe.EventoNFe.Versao := VersaoDFToStr(LNFe.Configuracoes.Geral.VersaoDF);
    LNFe.EventoNFe.Evento.Clear;
    LEvento := LNFe.EventoNFe.Evento.New;

    LEvento.InfEvento.cOrgao := ARequisicao.COrgao;
    LEvento.InfEvento.tpAmb := LNFe.Configuracoes.WebServices.Ambiente;
    LEvento.InfEvento.CNPJ := ARequisicao.Cnpj;
    LEvento.InfEvento.chNFe := ARequisicao.ChaveDocumento;
    LEvento.InfEvento.dhEvento := ARequisicao.DhEvento;
    LEvento.InfEvento.tpEvento := TipoEventoAcbr(ARequisicao.TipoEvento);
    LEvento.InfEvento.nSeqEvento := ARequisicao.NSeqEvento;

    LEvento.InfEvento.detEvento.cOrgaoAutor := ARequisicao.COrgaoAutor;
    LEvento.InfEvento.detEvento.tpAutor := TipoAutorAcbr(ARequisicao.TpAutor);
    LEvento.InfEvento.detEvento.verAplic := VER_APLIC_EVENTO;

    case ARequisicao.TipoEvento of
      teAtualizacaoPrevisaoEntrega:
        LEvento.InfEvento.detEvento.dPrevEntrega :=
          ARequisicao.Payload.DataPrevisaoEntrega;
      TipoEventoDFe.teImobilizacaoItem:
        for LIndice := 0 to High(ARequisicao.Payload.Itens) do
        begin
          LImobilizacao := LEvento.InfEvento.detEvento.gImobilizacao.New;
          LImobilizacao.nItem := ARequisicao.Payload.Itens[LIndice].NItem;
          LImobilizacao.vIBS := ARequisicao.Payload.Itens[LIndice].VIBS;
          LImobilizacao.vCBS := ARequisicao.Payload.Itens[LIndice].VCBS;
          LImobilizacao.gControleEstoque.qImobilizado :=
            ARequisicao.Payload.Itens[LIndice].QImobilizado;
          LImobilizacao.gControleEstoque.uImobilizado :=
            ARequisicao.Payload.Itens[LIndice].UImobilizado;
        end;
    end;

    if not LNFe.EventoNFe.GerarXml then
      raise Exception.Create('Não foi possível gerar o XML do evento fiscal.');

    FXmlEnvio := LNFe.EventoNFe.XmlEnvio;
    if Trim(FXmlEnvio) = '' then
      raise Exception.Create('O XML do evento fiscal não foi gerado.');

    FNFe := LNFe;
  except
    LNFe.Free;
    raise;
  end;
end;

destructor TAcbrEnvioPreparado.Destroy;
begin
  FreeAndNil(FNFe);
  inherited;
end;

function TAcbrEnvioPreparado.GetAmbiente: Integer;
begin
  Result := FAmbiente;
end;

function TAcbrEnvioPreparado.GetXmlEnvio: string;
begin
  Result := FXmlEnvio;
end;

function TAcbrEnvioPreparado.Enviar: TEventoDFeResultadoTransmissao;
var
  LRetorno: TRetEventoNFe;
  LItem: TRetInfEventoCollectionItem;
begin
  Result := ResultadoTransmissaoVazio;

  if FNFe.EventoNFe.Evento.Count <> 1 then
  begin
    Result.ErroTransporte := 'O evento preparado não está disponível para envio.';
    Exit;
  end;

  try
    FNFe.EnviarEvento(FNFe.EventoNFe.idLote);
  except
    on E: Exception do
    begin
      if Assigned(FNFe.WebServices) and Assigned(FNFe.WebServices.EnvEvento) then
        LRetorno := FNFe.WebServices.EnvEvento.EventoRetorno
      else
        LRetorno := nil;

      if Assigned(LRetorno) and (LRetorno.cStat > 0) then
      begin
        Result.CStatLote := LRetorno.cStat;
        Result.XMotivo := LRetorno.xMotivo;
        Result.XmlRetorno := LRetorno.XmlRetorno;
        // 108/109 indicam lote em processamento: sem conclusão, o evento permanece ENVIANDO.
        if not (LRetorno.cStat in [108, 109]) then
        begin
          Result.Classe := crRejeitado;
          Result.OrigemResultado := orFiscal;
        end;
        Exit;
      end;

      if E is EACBrNFeException then
      begin
        Result.Classe := crRejeitado;
        Result.OrigemResultado := orLocal;
        if Trim(E.Message) <> '' then
          Result.XMotivo := E.Message
        else
          Result.XMotivo := 'O evento fiscal foi recusado na validação local.';
        Exit;
      end;

      if Trim(E.Message) <> '' then
        Result.ErroTransporte := E.Message
      else
        Result.ErroTransporte := 'Não foi possível transmitir o evento fiscal.';
      Exit;
    end;
  end;

  LRetorno := FNFe.WebServices.EnvEvento.EventoRetorno;
  if not Assigned(LRetorno) then
  begin
    Result.ErroTransporte := 'O envio do evento fiscal não retornou resposta.';
    Exit;
  end;

  Result.CStatLote := LRetorno.cStat;
  Result.XMotivo := LRetorno.xMotivo;
  Result.XmlRetorno := LRetorno.XmlRetorno;

  if LRetorno.retEvento.Count = 0 then
  begin
    // Lote recusado na validação fiscal/esquema: nada foi registrado.
    if (LRetorno.cStat > 0) and not (LRetorno.cStat in [108, 109]) then
    begin
      Result.Classe := crRejeitado;
      Result.OrigemResultado := orFiscal;
    end;
    Exit;
  end;

  LItem := LRetorno.retEvento.Items[0];
  if (not Assigned(LItem)) or (not Assigned(LItem.RetInfEvento)) then
    Exit;

  Result.CStatEvento := LItem.RetInfEvento.cStat;
  Result.XMotivo := LItem.RetInfEvento.xMotivo;
  Result.NProt := LItem.RetInfEvento.nProt;
  Result.DhRegEvento := LItem.RetInfEvento.dhRegEvento;
  Result.XmlProcEvento := LItem.RetInfEvento.XML;

  case Result.CStatEvento of
    135, 136, 155: Result.Classe := crAutorizado;
    128, 0: Result.Classe := crSemResposta;
  else
    Result.Classe := crRejeitado;
  end;

  if Result.Classe <> crSemResposta then
    Result.OrigemResultado := orFiscal;

  if (Result.XMotivo = '') and (LRetorno.xMotivo <> '') then
    Result.XMotivo := LRetorno.xMotivo;
end;

{ TAcbrNFeEventoFiscalGateway }

constructor TAcbrNFeEventoFiscalGateway.Create(
  const AConfiguracoes: IConfiguracoesRepository;
  const AConfigReader: IConfigReader);
begin
  inherited Create;
  FConfiguracoes := AConfiguracoes;
  FConfigReader := AConfigReader;
end;

function TAcbrNFeEventoFiscalGateway.Preparar(
  const ARequisicao: TEventoDFeRequisicaoPreparo): TEventoDFePreparacao;
begin
  Result := PreparacaoVazia;
  try
    Result.Preparado := TAcbrEnvioPreparado.Create(ARequisicao, FConfiguracoes, FConfigReader);
    Result.XmlEnvio := Result.Preparado.XmlEnvio;
    Result.Ambiente := Result.Preparado.Ambiente;
  except
    on E: Exception do
    begin
      Result := PreparacaoVazia;
      if Trim(E.Message) <> '' then
        Result.ErroPreparacao := E.Message
      else
        Result.ErroPreparacao := 'Não foi possível preparar o evento fiscal.';
    end;
  end;
end;

function TAcbrNFeEventoFiscalGateway.Transmitir(
  const APreparado: IEventoDFeEnvioPreparado): TEventoDFeResultadoTransmissao;
begin
  Result := ResultadoTransmissaoVazio;
  try
    if not (APreparado is TAcbrEnvioPreparado) then
    begin
      Result.ErroTransporte := 'O evento preparado não pertence a este gateway fiscal.';
      Exit;
    end;
    Result := TAcbrEnvioPreparado(APreparado).Enviar;
  except
    on E: Exception do
    begin
      Result := ResultadoTransmissaoVazio;
      if Trim(E.Message) <> '' then
        Result.ErroTransporte := E.Message
      else
        Result.ErroTransporte := 'Não foi possível transmitir o evento fiscal.';
    end;
  end;
end;

function TAcbrNFeEventoFiscalGateway.ConsultarSituacao(const AUf: string;
  const AChaveDocumento: string; const ATipoEvento: TipoEventoDFe;
  const ANSeqEvento: Integer): TEventoDFeResultadoConsulta;
var
  LNFe: TACBrNFe;
  LConsulta: TNFeConsulta;
  LTipoEvento: TACBrTipoEvento;
  LProc: TRetEventoNFe;
  LRetInf: TRetInfEvento;
  LConfiguracao: TConfiguracaoFiscalAcbr;
  I: Integer;
  LMaiorSeq: Integer;
begin
  // ANSeqEvento não participa da correlação: a consulta devolve o evento de maior sequência.
  Result := ResultadoConsultaVazio;
  LNFe := nil;
  try
    try
      LTipoEvento := TipoEventoAcbr(ATipoEvento);
      LConfiguracao := LerConfiguracaoFiscal(FConfiguracoes, FConfigReader);

      LNFe := TACBrNFe.Create(nil);
      AplicarConfiguracaoFiscal(LNFe, LConfiguracao, AUf);
      LNFe.Consultar(AChaveDocumento, True);

      LConsulta := LNFe.WebServices.Consulta;
      if not Assigned(LConsulta) then
      begin
        Result.ErroTransporte := 'A consulta do evento fiscal não retornou resposta.';
        Exit;
      end;

      Result.CStatNFe := LConsulta.cStat;
      Result.XMotivoNFe := LConsulta.XMotivo;
      if LConsulta.cStat <= 0 then
      begin
        Result.ErroTransporte := 'A consulta do evento fiscal não retornou resposta.';
        Exit;
      end;

      Result.Respondeu := True;
      if not Assigned(LConsulta.procEventoNFe) then
        Exit;

      LMaiorSeq := 0;
      for I := 0 to LConsulta.procEventoNFe.Count - 1 do
      begin
        if not Assigned(LConsulta.procEventoNFe.Items[I]) then
          Continue;
        LProc := LConsulta.procEventoNFe.Items[I].RetEventoNFe;
        if (not Assigned(LProc)) or (not Assigned(LProc.InfEvento)) then
          Continue;
        if (LProc.InfEvento.chNFe <> AChaveDocumento) or
          (LProc.InfEvento.tpEvento <> LTipoEvento) or
          (LProc.InfEvento.nSeqEvento <= 0) or
          (LProc.InfEvento.nSeqEvento < LMaiorSeq) then
          Continue;

        LMaiorSeq := LProc.InfEvento.nSeqEvento;
        Result.EventoEncontrado := True;
        Result.NSeqEventoEncontrado := LMaiorSeq;
        Result.XmlProcEvento := LProc.XML;

        if Assigned(LProc.retEvento) and (LProc.retEvento.Count > 0) and
          Assigned(LProc.retEvento.Items[0]) then
        begin
          LRetInf := LProc.retEvento.Items[0].RetInfEvento;
          if Assigned(LRetInf) then
          begin
            Result.CStatEvento := LRetInf.cStat;
            Result.XMotivoEvento := LRetInf.xMotivo;
            Result.NProt := LRetInf.nProt;
            Result.DhRegEvento := LRetInf.dhRegEvento;
          end;
        end;
      end;
    except
      on E: Exception do
      begin
        Result := ResultadoConsultaVazio;
        if Trim(E.Message) <> '' then
          Result.ErroTransporte := E.Message
        else
          Result.ErroTransporte := 'Não foi possível consultar o evento fiscal.';
      end;
    end;
  finally
    LNFe.Free;
  end;
end;

end.
