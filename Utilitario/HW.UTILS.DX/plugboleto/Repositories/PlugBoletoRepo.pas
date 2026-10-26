unit PlugBoletoRepo;

interface

uses
  Data.DB,
  uClasseConexao,
  HW.Servicos,
  Vcl.Dialogs,
  BaseSingleton,
  ConfigApiModel,
  BoletoResponseModels,
  BoletoModel,
  Classes, PlugBoletoModels;

const
  PLUGBOLETO_URL_API_PROD = 'https://plugboleto.com.br/api/v1';
  PLUGBOLETO_URL_API_HOM  = 'https://homologacao.plugboleto.com.br/api/v1';
  CNPJ_SH = '03530705000109';
  CONF_API = 'BOLETO_API';

  STS_SUCESSO = 'sucesso';

  SIT_SALVO = 'SALVO';
  SIT_EMITIDO = 'EMITIDO';
  SIT_FALHA = 'FALHA';
  SIT_REJEITADO = 'REJEITADO';
  SIT_REGISTRADO = 'REGISTRADO';
  SIT_LIQUIDADO = 'LIQUIDADO';
  SIT_BAIXADO	= 'BAIXADO';
  SIT_PENDENTE_RETENTATIVA = 'PENDENTE_RETENTATIVA';

type
  ConfigAPI = record
    qtde_tentativas: Integer;
    tempo_entre_tentativas: Integer;
    tempo_aguarda_cada_tentativas: Integer;
    qtde_tentativas_download_boleto: Integer;
    timeout_download_boleto: Integer;
  end;
//  private
//    Fqtde_tentativas: Integer;
//    Ftempo_entre_tentativas: Integer;
//    Ftempo_aguarda_cada_tentativas: Integer;
//    Fqtde_tentativas_download_boleto: Integer;
//    Ftimeout_download_boleto: Integer;
//  public
//    property qtde_tentativas: Integer read Fqtde_tentativas write Fqtde_tentativas;
//    property tempo_entre_tentativas: Integer read Ftempo_entre_tentativas write Ftempo_entre_tentativas;
//    property tempo_aguarda_cada_tentativas: Integer read Ftempo_aguarda_cada_tentativas write Ftempo_aguarda_cada_tentativas;
//    property qtde_tentativas_download_boleto: Integer read Fqtde_tentativas_download_boleto write Fqtde_tentativas_download_boleto;
//    property timeout_download_boleto: Integer read Ftimeout_download_boleto write Ftimeout_download_boleto;
//  end;

  TPlugBoletoRepo = class;

  TPlugBoletoRepo = class(THwServicos)
  strict private
    function ConvetDateToFdb(value: string): string;
  private
    inicializado: Boolean;
    dataSetCedente: TConexao_OOP;
    dataSetConvenio: TConexao_OOP;
    dataSetBoleto: TConexao_OOP;
    dataSetArqRetorno: TConexao_OOP;
  public
    function GetConfigApi(apiName: string): TConfigApiModel;
    function GetBoletos(id: Integer): TConexao_OOP; overload;
    function GetBoletos(ids: array of Integer): TConexao_OOP; overload;
    function GetBoletosRemessa(ids: array of Integer): TConexao_OOP;
    function GetBoletosDescartar(ids: array of Integer): TConexao_OOP;
    function GetEmpresa(pCpfCnpj: string): TConexao_OOP;
    function retornaOutrosConf(pCodConvenio: Integer): string;
    function GetConvenio(pCodConvenio: Integer): TConexao_OOP;
    function GetRetorno(pCodConvenio: Integer; pDiretorioArquivo: string): TConexao_OOP;
    function PostBoletos(payload: TPostBoletoResponseSucesso): Boolean; overload;
    function PostBoletos(payload: TGetBoletoResponse; idintegracaoret: string = ''): Boolean; overload;
    function PostBoletos(payload: TArray<TBoletoPdfBase64Model>): Boolean; overload;
    function PostConta(pCodConvenio: Integer; pIdIntegracao: string): Boolean;
    function PostConvenio(pCodConvenio: Integer; pIdIntegracao: string): Boolean;
    function PostRemessa(payload: TPostRemessaResponseSucesso; cobrebem: Integer; diretorio: string): Boolean; overload;
    function PostDescartar(payload: TPostDescartarResponseSucesso): Boolean; overload;
    function PostRetorno(payload: TPostUploadRetornoResponseSucesso; pNomeArq: string; pDadosRet: string; pCodConvenio: Integer): Boolean; overload;
    function retornaConfAPI(): ConfigAPI;
    function LimparDadosBoletosSemIntegracao(ids: array of Integer): boolean;
    function InserirAtualizarTitulosNaoConc(pTitulosNaoConc: TArray<TTitulosNaoConciliados>; pCodConvenio: Integer; pApiProtocolo: string): boolean;
    function AtualizarNumeroArquivoRet(pNumeroArquivoRet: string; pCodConvenio: Integer; pApiProtocolo: string): boolean;
  var
    vConfigAPI: ConfigAPI;
  end;

  TPlugBoletoRepoSingleton = TSingleton<TPlugBoletoRepo>;

  Conexao_OOP = TConexao_OOP;

var
  repo: TPlugBoletoRepo;

implementation

{ TPlugBoletoRepo }

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  hw_win_utils,
  Query_OOP,
  EncdDecd,
  config_sistema_class;

function TPlugBoletoRepo.AtualizarNumeroArquivoRet(
  pNumeroArquivoRet: string; pCodConvenio: Integer; pApiProtocolo: string): boolean;
begin
  try
    Result := False;

    if trim(pNumeroArquivoRet) = '' then
    begin
      Result := True;
      exit;
    end;

    QrAux.Close;
    QrAux.SQL.Text := ' update arq_boleto set numeroarquivo = :numeroarquivo ' +
      ' where cod_empresa = :cod_empresa ' +
      ' and cod_cobrebem = :cod_cobrebem ' +
      ' and tipo = :tipo ' +
      ' and api_protocolo = :api_protocolo '  +
      ' and numeroarquivo is null; ';
    QrAux.ParamByName('numeroarquivo').AsString := pNumeroArquivoRet;
    QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
    QrAux.ParamByName('cod_cobrebem').AsInteger := pCodConvenio;
    QrAux.ParamByName('tipo').AsString := 'RETORNO';
    QrAux.ParamByName('api_protocolo').AsString := pApiProtocolo;
    QrAux.ExecSQL;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;

   except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TPlugBoletoRepo.AtualizarNumeroArquivoRet - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TPlugBoletoRepo.ConvetDateToFdb(value: string): string;
var
  data: TDateTime;
  f: TFormatSettings;
begin
  f.ShortDateFormat := 'dd/MM/yyyy hh:mm:ss';

  data := StrToDateTime(value, f);

  Result := datet_fb(data);
end;

function TPlugBoletoRepo.GetBoletos(ids: array of Integer): TConexao_OOP;
var
  I: Integer;
begin
  if not Assigned(dataSetBoleto) then
    dataSetBoleto := NewClientOOP('');//TConexao_OOP.Create(Self);

  Result := dataSetBoleto;

  var sqlIn := '';

  for I := Low(ids) to High(ids) do
    sqlIn := sqlIn + IfThen(I > Low(ids), ',') + ids[I].ToString();

  Result.Open(' select b.*,' +
              ' c.cod_cobrebem, c.banco, c.numerocontacorrente, c.codigoconvenio, c.qrcode_pix, ' +
              ' c.tipodocumentocobranca, c.multas, c.tx_juros, c.permite_protesto, c.diasprotesto, ' +
              ' c.identificacaocedente, ' +
              ' c.identificacaocedente1, ' +
              ' c.obs_bol as obs_bol_cobrebem, ' +
              ' c.local_pag as local_pag_cobrebem, ' +
              ' c.mensagem_bol as mensagem_bol_cobrebem, ' +
              ' c.mensagem_adc as mensagem_adc_cobrebem, ' +
              ' c.mensagem_desc as mensagem_desc_cobrebem, ' +
              ' c.permite_protesto as permite_protesto_cobrebem, ' +
              ' c.permite_desconto as permite_desconto_cobrebem, ' +
              ' c.qtd_dias_lim_desc as qtd_dias_lim_desc_cobrebem, ' +
              ' c.perc_desc as perc_desc_cobrebem, ' +
              ' c.titulocodigojuros, ' +
              ' c.titulocodigomulta, ' +
              ' c.titulocodigoprotesto, ' +
              ' c.outrodadoconfiguracao1, ' +
              ' c.outrodadoconfiguracao2, ' +
              ' cl.nome_cliente, cl.razao, cl.cpfcgc, cl.end_cobranca, cl.bairro_cobranca, cl.cida_cobranca, cl.cep_cobranca, ' +
              ' cl.email, cl.email, cl.fone_cliente, cl.fone_celular, e.sigla_uf, p.nome_pais ' +
              ' from boletas b ' +
              ' inner join cobrebem c on c.cod_cobrebem = b.cod_cobrebem and c.cod_empresa = b.cod_empresa and c.tipo_api = b.tipo_api ' +
              ' inner join clientes cl on cl.cod_cliente = b.cod_cliente and cl.cod_empresa = b.cod_empresa ' +
              ' inner join estados e on e.codigo_uf = cl.est_codigo_uf ' +
              ' left join paises p on p.cod_pais = cl.cod_pais ' +
              ' where b.cod_empresa = %d ' +
              ' and b.n_seq_bol in (%s) ' +
              ' and b.tipo_api = ''S'' ' +
              ' order by b.n_seq_bol ',
              [CodEmpresa,
               sqlIn]);
end;

function TPlugBoletoRepo.GetBoletos(id: Integer): TConexao_OOP;
var
  I: Integer;
begin
  if not Assigned(dataSetBoleto) then
    dataSetBoleto := NewClientOOP('');

  Result := dataSetBoleto;

  var sqlIn := id.ToString();

  Result.Open(' select b.*,' +
              ' c.cod_cobrebem, c.banco, c.numerocontacorrente, c.codigoconvenio, c.qrcode_pix, ' +
              ' c.tipodocumentocobranca, c.multas, c.tx_juros, c.permite_protesto, c.diasprotesto, ' +
              ' c.identificacaocedente, ' +
              ' c.identificacaocedente1, ' +
              ' c.obs_bol as obs_bol_cobrebem, ' +
              ' c.local_pag as local_pag_cobrebem, ' +
              ' c.mensagem_bol as mensagem_bol_cobrebem, ' +
              ' c.mensagem_adc as mensagem_adc_cobrebem, ' +
              ' c.mensagem_desc as mensagem_desc_cobrebem, ' +
              ' c.permite_protesto as permite_protesto_cobrebem, ' +
              ' c.permite_desconto as permite_desconto_cobrebem, ' +
              ' c.qtd_dias_lim_desc as qtd_dias_lim_desc_cobrebem, ' +
              ' c.perc_desc as perc_desc_cobrebem, ' +
              ' c.titulocodigojuros, ' +
              ' c.titulocodigomulta, ' +
              ' c.titulocodigoprotesto, ' +
              ' c.outrodadoconfiguracao1, ' +
              ' c.outrodadoconfiguracao2, ' +
              ' cl.nome_cliente, cl.razao, cl.cpfcgc, cl.end_cobranca, cl.bairro_cobranca, cl.cida_cobranca, cl.cep_cobranca, ' +
              ' cl.email, cl.email, cl.fone_cliente, cl.fone_celular, e.sigla_uf, p.nome_pais ' +
              ' from boletas b ' +
              ' left join cobrebem c on c.cod_cobrebem = b.cod_cobrebem and c.cod_empresa = b.cod_empresa and c.tipo_api = b.tipo_api ' +
              ' inner join clientes cl on cl.cod_cliente = b.cod_cliente and cl.cod_empresa = b.cod_empresa ' +
              ' inner join estados e on e.codigo_uf = cl.est_codigo_uf ' +
              ' left join paises p on p.cod_pais = cl.cod_pais ' +
              ' where b.cod_empresa = %d ' +
              ' and b.n_seq_bol in (%s) ' +
              ' and b.tipo_api = ''S'' ' +
              ' order by b.n_seq_bol ',
              [CodEmpresa,
               sqlIn]);
end;

function TPlugBoletoRepo.GetBoletosDescartar(
  ids: array of Integer): TConexao_OOP;
var
  I: Integer;
begin
  if not Assigned(dataSetBoleto) then
    dataSetBoleto := NewClientOOP('');

  Result := dataSetBoleto;

  var sqlIn := '';

  for I := Low(ids) to High(ids) do
    sqlIn := sqlIn + IfThen(I > Low(ids), ',') + ids[I].ToString();

  Result.Open(' select b.*,' +
              ' c.cod_cobrebem, c.banco, c.numerocontacorrente, c.codigoconvenio, c.qrcode_pix, ' +
              ' c.tipodocumentocobranca, c.multas, c.tx_juros, c.permite_protesto, c.diasprotesto, ' +
              ' c.identificacaocedente, ' +
              ' c.identificacaocedente1, ' +
              ' c.obs_bol as obs_bol_cobrebem, ' +
              ' c.local_pag as local_pag_cobrebem, ' +
              ' c.mensagem_bol as mensagem_bol_cobrebem, ' +
              ' c.mensagem_adc as mensagem_adc_cobrebem, ' +
              ' c.mensagem_desc as mensagem_desc_cobrebem, ' +
              ' c.permite_protesto as permite_protesto_cobrebem, ' +
              ' c.permite_desconto as permite_desconto_cobrebem, ' +
              ' c.qtd_dias_lim_desc as qtd_dias_lim_desc_cobrebem, ' +
              ' c.perc_desc as perc_desc_cobrebem, ' +
              ' c.titulocodigojuros, ' +
              ' c.titulocodigomulta, ' +
              ' c.titulocodigoprotesto, ' +
              ' c.outrodadoconfiguracao1, ' +
              ' c.outrodadoconfiguracao2, ' +
              ' cl.nome_cliente, cl.razao, cl.cpfcgc, cl.end_cobranca, cl.bairro_cobranca, cl.cida_cobranca, cl.cep_cobranca, ' +
              ' cl.email, cl.email, cl.fone_cliente, cl.fone_celular, e.sigla_uf, p.nome_pais ' +
              ' from boletas b ' +
              ' left join cobrebem c on c.cod_cobrebem = b.cod_cobrebem and c.cod_empresa = b.cod_empresa and c.tipo_api = b.tipo_api ' +
              ' inner join clientes cl on cl.cod_cliente = b.cod_cliente and cl.cod_empresa = b.cod_empresa ' +
              ' inner join estados e on e.codigo_uf = cl.est_codigo_uf ' +
              ' left join paises p on p.cod_pais = cl.cod_pais ' +
              ' where b.cod_empresa = %d ' +
              ' and b.n_seq_bol in (%s) ' +
//              ' and b.nosso_numero_banco is not null ' +
              ' and b.tipo_api = ''S'' ' +
              ' order by b.n_seq_bol ',
              [CodEmpresa,
               sqlIn]);
end;

function TPlugBoletoRepo.GetBoletosRemessa(ids: array of Integer): TConexao_OOP;
var
  I: Integer;
begin
  if not Assigned(dataSetBoleto) then
    dataSetBoleto := NewClientOOP('');

  Result := dataSetBoleto;

  var sqlIn := '';

  for I := Low(ids) to High(ids) do
    sqlIn := sqlIn + IfThen(I > Low(ids), ',') + ids[I].ToString();

  Result.Open(' select b.*,' +
              ' c.cod_cobrebem, c.banco, c.numerocontacorrente, c.codigoconvenio, c.qrcode_pix, ' +
              ' c.tipodocumentocobranca, c.multas, c.tx_juros, c.permite_protesto, c.diasprotesto, ' +
              ' c.identificacaocedente, ' +
              ' c.identificacaocedente1, ' +
              ' c.obs_bol as obs_bol_cobrebem, ' +
              ' c.local_pag as local_pag_cobrebem, ' +
              ' c.mensagem_bol as mensagem_bol_cobrebem, ' +
              ' c.mensagem_adc as mensagem_adc_cobrebem, ' +
              ' c.mensagem_desc as mensagem_desc_cobrebem, ' +
              ' c.permite_protesto as permite_protesto_cobrebem, ' +
              ' c.permite_desconto as permite_desconto_cobrebem, ' +
              ' c.qtd_dias_lim_desc as qtd_dias_lim_desc_cobrebem, ' +
              ' c.perc_desc as perc_desc_cobrebem, ' +
              ' c.titulocodigojuros, ' +
              ' c.titulocodigomulta, ' +
              ' c.titulocodigoprotesto, ' +
              ' c.outrodadoconfiguracao1, ' +
              ' c.outrodadoconfiguracao2, ' +
              ' cl.nome_cliente, cl.razao, cl.cpfcgc, cl.end_cobranca, cl.bairro_cobranca, cl.cida_cobranca, cl.cep_cobranca, ' +
              ' cl.email, cl.email, cl.fone_cliente, cl.fone_celular, e.sigla_uf, p.nome_pais ' +
              ' from boletas b ' +
              ' inner join cobrebem c on c.cod_cobrebem = b.cod_cobrebem and c.cod_empresa = b.cod_empresa and c.tipo_api = b.tipo_api ' +
              ' inner join clientes cl on cl.cod_cliente = b.cod_cliente and cl.cod_empresa = b.cod_empresa ' +
              ' inner join estados e on e.codigo_uf = cl.est_codigo_uf ' +
              ' left join paises p on p.cod_pais = cl.cod_pais ' +
              ' where b.cod_empresa = %d ' +
              ' and b.n_seq_bol in (%s) ' +
              ' and b.nosso_numero_banco is not null ' +
              ' and b.tipo_api = ''S'' ' +
              ' order by b.n_seq_bol ',
              [CodEmpresa,
               sqlIn]);
end;

function TPlugBoletoRepo.GetConfigApi(apiName: string): TConfigApiModel;
begin
  Result := TConfigApiModel.Create;
  var query := QueryHelper.CreateObj(QrAux)
    .Open(' select cod_empresa, api, url_api, token_api, chave_assign, user_id, ' +
          ' iif(user_id = hash(rdb$get_context(''SYSTEM'', ''DB_NAME'')), ''P'', ''H'') p_h' +
          ' from config_api' +
          ' where cod_empresa = %d ' +
          ' and api = %s',
          [CodEmpresa,
           apiName.QuotedString()]);

  Result.empresaId := query.fint('cod_empresa');
  Result.api := query.fstr('api');
  Result.URL := query.fstr('url_api');
  Result.token := query.fstr('token_api');
  Result.chave := query.fstr('chave_assign');
  Result.producao := (query.fequals('p_h', 'P'));

end;

function TPlugBoletoRepo.GetConvenio(pCodConvenio: Integer): TConexao_OOP;
begin
  if not Assigned(dataSetConvenio) then
    dataSetConvenio := NewClientOOP('');

  Result := dataSetConvenio;

  Result.Open(' select cobrebem.cod_cobrebem, cobrebem.cod_empresa, cobrebem.descricao, cobrebem.qrcode_pix, ' +
              ' cobrebem.banco, cobrebem.codigoagencia, cobrebem.numerocontacorrente, ' +
              ' cobrebem.codigocedente, cobrebem.codigoconvenio, cobrebem.tipo_conta, cobrebem.sequencia_remessa, ' +
              ' cobrebem.outrodadoconfiguracao1, cobrebem.outrodadoconfiguracao2, cobrebem.layoutarquivoremessa, ' +
              ' cobrebem.api_idconta, cobrebem.api_idconvenio, ' +
              ' bancos.mascara_codigoagencia from cobrebem ' +
              ' inner join bancos_homologados bancos on bancos.codbanco = banco ' +
              ' where cobrebem.cod_cobrebem = %d ' +
              ' and cobrebem.cod_empresa = %d ' +
              ' and cobrebem.ativo = 1 ',
              [pCodConvenio,
               CodEmpresa]);
end;

function TPlugBoletoRepo.GetEmpresa(pCpfCnpj: string): TConexao_OOP;
begin
  if not Assigned(dataSetCedente) then
    dataSetCedente := NewClientOOP('');

  Result := dataSetCedente;

  Result.Open(' select empresa.cod_empresa, empresa.cgc_emp, empresa.nome_emp, empresa.fantasia_emp, ' +
              ' empresa.endreco_emp, empresa.numero_end, empresa.complemento_emp, empresa.cep_emp, ' +
              ' empresa.bairro_emp, empresa.cidade_emp, cidades.ibge_cod_cidade, estados.sigla_uf, estados.ibge_codigo_uf, ' +
              ' empresa.telefone_emp, empresa.email_emp from empresa ' +
              ' left join cidades on trim(cidades.nome_cidade) = (empresa.cidade_emp) ' +
              ' inner join estados on estados.codigo_uf = empresa.uf_emp ' +
              ' where empresa.cod_empresa = %d ' +
              ' and trim(empresa.cgc_emp) = %s ' +
              ' and empresa.ativo = 1 ' +
              ' order by empresa.cod_empresa ',
              [CodEmpresa,
               pCpfCnpj.QuotedString]);
end;

function TPlugBoletoRepo.GetRetorno(pCodConvenio: Integer; pDiretorioArquivo: string): TConexao_OOP;
begin
  if not Assigned(dataSetConvenio) then
    dataSetArqRetorno := NewClientOOP('');

  Result := dataSetArqRetorno;

  Result.Open(' select first 1 arq.seqid, arq.cod_empresa, arq.cod_cobrebem, ' +
              ' arq.tipo, arq.descricao_arq, arq.api_protocolo from arq_boleto arq ' +
              ' where arq.cod_empresa = %d ' +
              ' and arq.tipo = %s ' +
              ' and arq.descricao_arq = %s ' +
              ' and arq.cod_cobrebem = %d ' +
              ' and arq.data_hora >= current_date - 30 ' +
              ' order by arq.seqid desc ',
              [CodEmpresa,
              'RETORNO'.QuotedString,
              ExtractFileName(pDiretorioArquivo).QuotedString,
              pCodConvenio]);
end;

function TPlugBoletoRepo.InserirAtualizarTitulosNaoConc(
  pTitulosNaoConc: TArray<TTitulosNaoConciliados>; pCodConvenio: Integer; pApiProtocolo: string): boolean;
var
  strOcorr: string;
begin
  try
    Result := False;

    if Length(pTitulosNaoConc) <= 0 then
      exit;

    if not SqlOpen(' select seqid, cod_empresa from titulos_nao_conciliados ' +
                   ' where cod_cobrebem = %d ' +
                   ' and api_protocolo = %s ' +
                   ' and cod_empresa = %d ',
                   [pCodConvenio,
                    pApiProtocolo.QuotedString,
                    CodEmpresa]).IsEmpty then
    begin
      Result := True;
      exit;
    end
    else
    begin
      if Length(pTitulosNaoConc) > 0 then
      begin
        for var titulosnaoconc in pTitulosNaoConc  do
        begin
          strOcorr := '';
          if Length(titulosnaoconc.Ocorrencias) > 0 then
            strOcorr := titulosnaoconc.TituloOcorrenciasToStr;

          QrAux.Close;
          QrAux.SQL.Text := ' insert into titulos_nao_conciliados ' +
            ' (seqid, cod_empresa, codigomovimento, descricao_movimento, ' +
            '  titulonossonumero, titulonossonumerooriginal, titulodatavencimento, ' +
            '  pagamentovalorpago, pagamentovalorcredito, pagamentovalortaxacobranca, pagamentovaloracrescimos, ' +
            '  pagamentodata, pagamentodatacredito, pagamentorealizado, pagamentovaloroutroscreditos, ' +
            '  titulonumerodocumento, tituloidentificacaoempresa, ocorrenciabancaria, cod_cobrebem, api_protocolo) ' +
            ' values ((select cod from incrementa_codigo(:cod_empresa, ''TITULOS_NAO_CONCILIADOS'')), ' +
            '  :cod_empresa, :codigomovimento, :descricao_movimento, ' +
            '  :titulonossonumero, :titulonossonumerooriginal, :titulodatavencimento, ' +
            '  :pagamentovalorpago, :pagamentovalorcredito, :pagamentovalortaxacobranca, :pagamentovaloracrescimos, ' +
            '  :pagamentodata, :pagamentodatacredito, :pagamentorealizado, :pagamentovaloroutroscreditos, ' +
            '  :titulonumerodocumento, :tituloidentificacaoempresa, :ocorrenciabancaria, :cod_cobrebem, :api_protocolo); ' ;
          QrAux.ParamByName('cod_empresa').AsInteger := CodEmpresa;
          QrAux.ParamByName('codigomovimento').AsString := titulosnaoconc.CodigoMovimento;
          if Length(titulosnaoconc.Ocorrencias) > 0 then
            QrAux.ParamByName('descricao_movimento').AsString := Copy(titulosnaoconc.Ocorrencias[Length(titulosnaoconc.Ocorrencias) - 1], 1, 50);
          QrAux.ParamByName('titulonossonumero').AsString := titulosnaoconc.TituloNossoNumero;
          QrAux.ParamByName('titulonossonumerooriginal').AsString := titulosnaoconc.TituloNossoNumeroOriginal;
          QrAux.ParamByName('titulodatavencimento').AsString := titulosnaoconc.TituloDataVencimento;

          if titulosnaoconc.PagamentoValorPago.Trim = '' then
            QrAux.ParamByName('pagamentovalorpago').AsFloat := 0
          else
            QrAux.ParamByName('pagamentovalorpago').AsFloat := StrToFloat(titulosnaoconc.PagamentoValorPago);

          if titulosnaoconc.PagamentoValorCredito.Trim = '' then
            QrAux.ParamByName('pagamentovalorcredito').AsFloat := 0
          else
            QrAux.ParamByName('pagamentovalorcredito').AsFloat := StrToFloat(titulosnaoconc.PagamentoValorCredito);

          if titulosnaoconc.PagamentoValorTaxaCobranca.Trim = '' then
            QrAux.ParamByName('pagamentovalortaxacobranca').AsFloat := 0
          else
            QrAux.ParamByName('pagamentovalortaxacobranca').AsFloat := StrToFloat(titulosnaoconc.PagamentoValorTaxaCobranca);

          if titulosnaoconc.PagamentoValorAcrescimos.Trim = '' then
            QrAux.ParamByName('pagamentovaloracrescimos').AsFloat := 0
          else
            QrAux.ParamByName('pagamentovaloracrescimos').AsFloat := StrToFloat(titulosnaoconc.PagamentoValorAcrescimos);

          if titulosnaoconc.PagamentoData.Trim <> '' then
            QrAux.ParamByName('pagamentodata').AsString := titulosnaoconc.PagamentoData;

          if titulosnaoconc.PagamentoDataCredito.Trim <> '' then
            QrAux.ParamByName('pagamentodatacredito').AsString := titulosnaoconc.PagamentoDataCredito;

          QrAux.ParamByName('pagamentorealizado').AsString := IfThen(titulosnaoconc.PagamentoRealizado, 'S', 'N');

          if titulosnaoconc.PagamentoValorOutrosCreditos.Trim = '' then
            QrAux.ParamByName('pagamentovaloroutroscreditos').AsFloat := 0
          else
            QrAux.ParamByName('pagamentovaloroutroscreditos').AsFloat := StrToFloat(titulosnaoconc.PagamentoValorOutrosCreditos);

          QrAux.ParamByName('titulonumerodocumento').AsString := titulosnaoconc.TituloNumeroDocumento;
          QrAux.ParamByName('tituloidentificacaoempresa').AsString := titulosnaoconc.TituloIdentificacaoEmpresa;
          QrAux.ParamByName('ocorrenciabancaria').AsString := strOcorr;
          QrAux.ParamByName('cod_cobrebem').AsInteger := pCodConvenio;
          QrAux.ParamByName('api_protocolo').AsString := pApiProtocolo;
          QrAux.ExecSQL;
        end;

        if Transacao.InTransaction then
          Transacao.Commit;
      end;

      Result := True;
    end;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TPlugBoletoRepo.InserirAtualizarTitulosNaoConc - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TPlugBoletoRepo.LimparDadosBoletosSemIntegracao(
  ids: array of Integer): boolean;
var
  I: Integer;
begin
  try
    Result := False;

    if Length(ids) > 0 then
    begin
      for I := Low(ids) to High(ids) do
      begin
       SqlExec(' update boletas set ' +
                ' tipo_api = null, ' +
                ' permite_protesto = null, ' +
                ' dias_protesto = null, ' +
                ' permite_desconto = null, ' +
                ' data_lim_desc = null, ' +
                ' mensagem_bol = null, ' +
                ' mensagem_adc = null, ' +
                ' mensagem_desc = null, ' +
                ' qtd_dias_lim_desc = null, ' +
                ' api_nossonumero = null, ' +
                ' api_pgt_data = null, ' +
                ' api_pgt_datacredito = null, ' +
                ' api_pgt_realizado = null, ' +
                ' api_pgt_valorcredito = null, ' +
                ' api_pgt_valorpago = null, ' +
                ' api_pgt_valortaxacobranca = null, ' +
                ' api_pgt_valoracrescimos = null, ' +
                ' api_pgt_valordesconto = null, ' +
                ' api_pgt_valorabatimento = null, ' +
                ' api_pgt_datataxabancaria = null, ' +
                ' api_pgt_valoroutroscreditos = null, ' +
                ' api_pgt_valoroutrasdespesas = null, ' +
                ' api_urlboleto = null, ' +
                ' api_urlpix = null, ' +
                ' api_situacao = null, ' +
                ' api_idintegracao = null, ' +
                ' api_idremintegracao = null,' +
                ' remessa_enviada = ''N'' ' +
                ' where n_seq_bol = %d ' +
                ' and cod_empresa = %d' +
  //              ' and api_idintegracao is null ' +
                ' and tipo_api = ''S'' ',
                [ids[I],
                 CodEmpresa]);
      end;
      
      if Transacao.InTransaction then
        Transacao.Commit;
    end;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TPlugBoletoRepo.LimparDadosBoletosSemIntegracao - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TPlugBoletoRepo.PostBoletos(payload: TGetBoletoResponse; idintegracaoret: string = ''): Boolean;
type
  EnumFieldType = (ftString, ftInteger, ftFloat, ftDateTime);

  function HandleField(fieldName, value: string; fieldType: EnumFieldType; size: SmallInt = 0;  addCharEnds: string = ','; ignoreEmptys: Boolean = True): string;
  begin
    if value.Trim.IsEmpty and ignoreEmptys then
      Exit('');

    Result := '';

    case fieldType of
      ftString:
        Result := value.Substring(0, size).QuotedString();
      ftInteger:
        Result := IntToStr(IfThen(value.IsEmpty, 0, StrToInt(value.Replace('.', ''))));
      ftFloat:
        Result := float_fb(StrToFloat(IfThen(value.IsEmpty, '0', value.Replace('.', '')), Self.fmtSettings));
      ftDateTime:
        Result := datet_fb(StrToDateTime(value, Self.fmtSettings));
    end;

    Result := Format('%s = %s%s', [fieldName, Result, addCharEnds]);
  end;

var
  seqBol: string;
  empBol: string;
  strOcorr: string;
  strCodMov: string;
  strDescrMov: string;
  params: array of string;
begin
  Result := False;

  try
    if Length(payload._dados) > 0 then
    begin
      for var itemOk in payload._dados do
      begin
        if MatchText(itemOk.situacao, [SIT_FALHA, SIT_REJEITADO, SIT_PENDENTE_RETENTATIVA]) then
        begin
          //raise Exception
          //.Create(itemOk.motivo + sLineBreak + sLineBreak +
//            'Num Doc: ' + itemOk.TituloNumeroDocumento + sLineBreak +
//            'Valor Doc: ' + itemOk.TituloValor + sLineBreak +
//            'Cliente: ' + itemOk.SacadoNome + sLineBreak+ sLineBreak +
//            'Favor verificar antes de continuar.');
          ShowMessage(
            itemOk.motivo + sLineBreak + sLineBreak +
            'Num Doc: ' + itemOk.TituloNumeroDocumento + sLineBreak +
            'Valor Doc: ' + itemOk.TituloValor + sLineBreak +
            'Cliente: ' + itemOk.SacadoNome);
        end
        else if MatchText(itemOk.situacao, [SIT_SALVO, SIT_EMITIDO, SIT_REGISTRADO, SIT_LIQUIDADO, SIT_BAIXADO]) then
        begin
          seqBol := itemOk.TituloCodigoReferencia.Substring(0, itemOk.TituloCodigoReferencia.IndexOf('-'));
          empBol := itemOk.TituloCodigoReferencia.Substring(itemOk.TituloCodigoReferencia.IndexOf('-') + 1, Length(itemOk.TituloCodigoReferencia));

          if empBol.Trim.Equals(CodEmpresa.ToString()) then
          begin
            strOcorr := '';
            if Length(itemOk.TituloOcorrencias) > 0 then
              strOcorr := itemOk.TituloOcorrenciasToStr;
  //          if Length(itemOk.TituloMovimentos) > 0 then
  //            strOcorr := strOcorr + IfThen(not strOcorr.IsEmpty, sLineBreak + '--' + sLineBreak) + itemOk.TituloOcorrenciasToStr;

            if not strOcorr.IsEmpty then
              params := [strOcorr]
            else
              params := [];

            strCodMov := '';
            strDescrMov := '';
            if Length(itemOk.TituloOcorrencias) > 0 then
            begin
              strCodMov := itemOk.CodigoUltOcorrenciasToStr;
              strDescrMov := itemOk.DescrUltOcorrenciasToStr;
            end;

            SqlExecP(' update boletas set ' +
                     IfThen(not strOcorr.IsEmpty              , 'ocorrenciabancaria = :ocorrenciabancaria,') +
                     HandleField('nosso_numero_banco'         , itemOk.TituloNossoNumeroImpressao  , ftString, 20) +
                     HandleField('via_ws'                     , IfThen(itemOk.via_ws, 'S', 'N')    , ftString, 1) +
                     HandleField('linhadigitavel'             , itemOk.TituloLinhaDigitavel        , ftString, 80) +
                     HandleField('codigobarras'               , itemOk.TituloCodigoBarras          , ftString, 80) +
                     HandleField('api_pgt_data'               , itemOk.PagamentoData               , ftDateTime) +
                     HandleField('api_pgt_datacredito'        , itemOk.PagamentoDataCredito        , ftDateTime) +
                     HandleField('api_pgt_realizado'          , IfThen(itemOk.PagamentoRealizado   , '1', '0'), ftInteger) +
                     HandleField('api_pgt_valorcredito'       , itemOk.PagamentoValorCredito       , ftFloat) +
                     HandleField('api_pgt_valorpago'          , itemOk.PagamentoValorPago          , ftFloat) +
                     HandleField('api_pgt_valortaxacobranca'  , itemOk.PagamentoValorTaxaCobranca  , ftFloat) +
                     HandleField('api_pgt_valoracrescimos'    , itemOk.PagamentoValorAcrescimos    , ftFloat) +
                     HandleField('api_pgt_valordesconto'      , itemOk.PagamentoValorDesconto      , ftFloat) +
                     HandleField('api_pgt_valorabatimento'    , itemOk.PagamentoValorAbatimento    , ftFloat) +
                     HandleField('api_pgt_datataxabancaria'   , itemOk.PagamentoDataTaxaBancaria   , ftDateTime) +
                     HandleField('api_pgt_valoroutrasdespesas', itemOk.PagamentoValorOutrasDespesas, ftFloat) +
                     HandleField('api_pgt_valoroutroscreditos', itemOk.PagamentoValorOutrosCreditos, ftFloat) +
                     HandleField('api_pgt_valor_iof'          , itemOk.PagamentoValorIOF           , ftFloat) +
                     HandleField('api_urlboleto'              , itemOk.UrlBoleto                   , ftString, 256) +
                     HandleField('api_urlpix'                 , itemOk.UrlPix                      , ftString, 265) +
                     HandleField('api_situacao'               , itemOk.situacao                    , ftString, 16) +
                     HandleField('api_codigo_movimento'       , strCodMov                          , ftString, 2) +
                     HandleField('api_descr_movimento'        , strDescrMov                        , ftString, 50) +
                     HandleField('api_idintegracao'           , itemOk.idintegracao                , ftString, 16, '') +
                     IfThen((idintegracaoret.Trim <> ''),// and (MatchText(itemOk.situacao, [SIT_LIQUIDADO])),
                      HandleField(', api_idretintegracao'       , idintegracaoret                   , ftString, 16, ''), '') +
                     ' where api_idintegracao = %s ' +
                     ' and cod_empresa = %d ',
                     [itemOk.idintegracao.QuotedString(), CodEmpresa],
                     params);
          end;
        end;
      end;

      if Transacao.InTransaction then
        Transacao.Commit;
    end;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TPlugBoletoRepo.PostBoletos(TGetBoletoResponse) - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TPlugBoletoRepo.PostBoletos(
  payload: TArray<TBoletoPdfBase64Model>): Boolean;
begin
  Result := False;

  try
    if Length(payload) > 0 then
    begin
      for var bol in payload do
      begin
        SqlExecP(' update boletas set' +
                 ' htmlboleto = :htmlboleto' +
                 ' where n_seq_bol = %d ' +
                 ' and cod_empresa = %d ' +
                 ' and api_idintegracao = ''%s'' ' +
                 ' and tipo_api = ''S'' ',
                 [bol.nSeqBol,
                  CodEmpresa,
                  bol.idIntegracao],
                 [bol.idIntegracao + '|' + bol.pdfBase64]);
      end;

      if Transacao.InTransaction then
        Transacao.Commit;
    end;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TPlugBoletoRepo.PostBoletos(TArray<TBoletoPdfBase64Model>) - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TPlugBoletoRepo.PostConta(pCodConvenio: Integer;
  pIdIntegracao: string): Boolean;
begin
  Result := False;

  SqlExec(' update cobrebem set' +
          ' api_idconta = %s ' +
          ' where cod_cobrebem = %d ' +
          ' and cod_empresa = %d ',
          [pIdIntegracao.QuotedString,
           pCodConvenio,
           CodEmpresa]);

   if Transacao.InTransaction then
      Transacao.Commit;

  Result := True;
end;

function TPlugBoletoRepo.PostConvenio(pCodConvenio: Integer;
  pIdIntegracao: string): Boolean;
begin
  Result := False;

  SqlExec(' update cobrebem set' +
          ' api_idconvenio = %s ' +
          ' where cod_cobrebem = %d ' +
          ' and cod_empresa = %d ',
          [pIdIntegracao.QuotedString,
           pCodConvenio,
           CodEmpresa]);

   if Transacao.InTransaction then
      Transacao.Commit;

  Result := True;
end;

function TPlugBoletoRepo.PostDescartar(
  payload: TPostDescartarResponseSucesso): Boolean;
var
  seqBol: string;
  empBol: string;
begin
  Result := False;

  try
    if Length(payload._dados._sucesso) > 0 then
    begin
      for var itemOk in payload._dados._sucesso do
      begin
        SqlExec(' update boletas set ' +
                ' tipo_api = null, ' +
                ' api_nossonumero = null, ' +
                ' api_pgt_data = null, ' +
                ' api_pgt_datacredito = null, ' +
                ' api_pgt_realizado = null, ' +
                ' api_pgt_valorcredito = null, ' +
                ' api_pgt_valorpago = null, ' +
                ' api_pgt_valortaxacobranca = null, ' +
                ' api_pgt_valoracrescimos = null, ' +
                ' api_pgt_valordesconto = null, ' +
                ' api_pgt_valorabatimento = null, ' +
                ' api_pgt_datataxabancaria = null, ' +
                ' api_pgt_valoroutroscreditos = null, ' +
                ' api_pgt_valoroutrasdespesas = null, ' +
                ' api_urlboleto = null, ' +
                ' api_urlpix = null, ' +
                ' api_situacao = null, ' +
                ' api_idintegracao = null, ' +
                ' api_idremintegracao = null,' +
                ' linhadigitavel = null, ' +
                ' codigobarras = null, ' +
                ' remessa_enviada = ''N'' ' +
                ' where api_idintegracao = %s' +
                ' and cod_empresa = %d' +
                ' and tipo_api = ''S'' ',
                [itemOk.Idintegracao.QuotedString(),
                 CodEmpresa]);
      end;

      if Transacao.InTransaction then
        Transacao.Commit;
    end;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TPlugBoletoRepo.PostRemessa - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TPlugBoletoRepo.PostRetorno(
  payload: TPostUploadRetornoResponseSucesso; pNomeArq: string; pDadosRet: string; pCodConvenio: Integer): Boolean;
begin
  Result := False;

  try

    if SqlOpen(' select seqid, cod_empresa from arq_boleto ' +
            ' where api_protocolo = %s ' +
            ' and tipo = %s ' +
            ' and cod_empresa = %d ',
            [QuotedStr(payload._dados.protocolo),
             QuotedStr('RETORNO'),
             CodEmpresa]).IsEmpty then
    begin
      queryCons.SQL(Format(' insert into arq_boleto ' +
              ' (seqid, cod_empresa, cod_cobrebem, tipo, descricao_arq, doc, data_hora, api_protocolo) ' +
              ' values ((select cod from incrementa_codigo(%d, ''ARQ_BOLETO_RET'')), ' +
              ' %d, ' +
              ' %d, ' +
              ' %s, ' +
              ' %s, ' +
              ' :doc, ' +
              'current_timestamp, ' +
              ' %s);',
              [CodEmpresa,
               CodEmpresa,
               pCodConvenio,
               QuotedStr('RETORNO'),
               QuotedStr(pNomeArq),
               QuotedStr(trim(payload._dados.protocolo))]))
        .ParamValue('doc', pDadosRet).query.ExecSQL;;

      if Transacao.InTransaction then
        Transacao.Commit;
    end;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TPlugBoletoRepo.PostRetorno - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TPlugBoletoRepo.retornaConfAPI(): ConfigAPI;
var
  Conf: TConfig_sistema_class;
begin
  Conf := TConfig_sistema_class.getConf('plug_boletos_api_conf', dataSetBoleto.QueryOOP, CodEmpresa);

  try
    if trim(Conf.ReadString('CONFIGURACOES', 'TempoEntreTentativas')) = '' then
      Result.tempo_entre_tentativas          := 50
    else
      Result.tempo_entre_tentativas          := StrToInt(Conf.ReadString('CONFIGURACOES', 'TempoEntreTentativas'));

    if (Result.tempo_entre_tentativas <= 0) then
      Result.tempo_entre_tentativas          := 50;
  except
    Result.tempo_entre_tentativas            := 50;
  end;

  try
    if trim(Conf.ReadString('CONFIGURACOES', 'TempoAguardarCadaTentativa')) = '' then
      Result.tempo_aguarda_cada_tentativas   := 50
    else
      Result.tempo_aguarda_cada_tentativas   := StrToInt(Conf.ReadString('CONFIGURACOES', 'TempoAguardarCadaTentativa'));

      if (Result.tempo_aguarda_cada_tentativas <= 0) then
        Result.tempo_aguarda_cada_tentativas := 50;
  except
    Result.tempo_aguarda_cada_tentativas     := 50;
  end;

  try
    if trim(Conf.ReadString('CONFIGURACOES', 'QuantidadeTentativas')) = '' then
      Result.qtde_tentativas                 := 5
    else
      Result.qtde_tentativas                 := StrToInt(Conf.ReadString('CONFIGURACOES', 'QuantidadeTentativas'));

    if (Result.qtde_tentativas <= 0) then
      Result.qtde_tentativas                 := 5;
  except
    Result.qtde_tentativas                   := 5;
  end;

  try
    if trim(Conf.ReadString('CONFIGURACOES', 'QuantidadeTentativasDownload')) = '' then
      Result.qtde_tentativas_download_boleto := 5
    else
      Result.qtde_tentativas_download_boleto := StrToInt(Conf.ReadString('CONFIGURACOES', 'QuantidadeTentativasDownload'));

    if (Result.qtde_tentativas_download_boleto <= 0) then
      Result.qtde_tentativas_download_boleto := 5;
  except
    Result.qtde_tentativas_download_boleto   := 5;
  end;

  try
    if trim(Conf.ReadString('CONFIGURACOES', 'TimeoutDownload')) = '' then
      Result.timeout_download_boleto       := 5000
    else
      Result.timeout_download_boleto       := StrToInt(Conf.ReadString('CONFIGURACOES', 'TimeoutDownload'));

    if (Result.timeout_download_boleto <= 0) then
      Result.timeout_download_boleto := 1000;
  except
    Result.timeout_download_boleto         := 5000;
  end;
end;

function TPlugBoletoRepo.retornaOutrosConf(pCodConvenio: Integer): string;
begin
  Result := '';

  var query := QueryHelper.CreateObj(QrAux)
    .Open(' select outras_config_bol from cobrebem ' +
          ' where cod_cobrebem = %d ' +
          ' and cod_empresa = %d ',
          [pCodConvenio, CodEmpresa]);

  Result := query.fstr('outras_config_bol');
end;

function TPlugBoletoRepo.PostRemessa(
  payload: TPostRemessaResponseSucesso; cobrebem: Integer; diretorio: string): Boolean;
var
  seqBol: string;
  empBol: string;
  vStringListRemessa: TStringList;

  function retornaSeqRemessa(pNomeArquivo: string): Integer;
  begin
    var vNomeArquivo := pNomeArquivo.Trim();
    Result := 0;
    while (Pos('_', vNomeArquivo) > 0) do
    begin
      vNomeArquivo := Copy(vNomeArquivo, Pos('_', vNomeArquivo) + 1, Length(vNomeArquivo) - Pos('_', vNomeArquivo));
    end;

    if vNomeArquivo.Trim() <> '' then
      vNomeArquivo := Copy(vNomeArquivo, 1, Pos('.', vNomeArquivo) - 1);

    try
      Result := StrToInt(vNomeArquivo);
    except
      Result := 0;
    end;
  end;

begin
  Result := False;

  try
    try
      vStringListRemessa := TStringList.Create;
      if Length(payload._dados._sucesso) > 0 then
      begin
        for var itemOk in payload._dados._sucesso do
        begin
          var vSequenciaRem := itemOk.Numero; //retornaSeqRemessa(itemOk.Arquivo);

          SqlExec(' update cobrebem set ' +
                  ' sequencia_remessa = %d ' +
                  ' where cod_cobrebem = %d ' +
                  ' and cod_empresa = %d ',
                  [vSequenciaRem,
                   cobrebem,
                   CodEmpresa]);

          if itemOk.TransmissaoAutomatica then
          begin
            SqlExec(' insert into arq_boleto ' +
                    ' (seqid, cod_empresa, cod_cobrebem, tipo, descricao_arq, doc, data_hora) ' +
                    ' values ((select cod from incrementa_codigo(%d, ''ARQ_BOLETO_REM'')), ' +
                    ' %d, ' +
                    ' %d, ' +
                    ' %s, ' +
                    ' %s, ' +
                    ' %s, ' +
                    'current_timestamp);',
                    [CodEmpresa,
                     CodEmpresa,
                     Cobrebem,
                     QuotedStr('REMESSA'),
                     QuotedStr(UpperCase(itemOk.Arquivo)),
                     QuotedStr('Arquivo de remessa enviado ao banco')]);
          end
          else
          begin
            var vDadosRem := DecodeString(itemOk.Remessa);

            queryCons.SQL(Format(' insert into arq_boleto ' +
                    ' (seqid, cod_empresa, cod_cobrebem, tipo, descricao_arq, doc, data_hora) ' +
                    ' values ((select cod from incrementa_codigo(%d, ''ARQ_BOLETO_REM'')), ' +
                    ' %d, ' +
                    ' %d, ' +
                    ' %s, ' +
                    ' %s, ' +
                    ' :doc, ' +
                    'current_timestamp);',
                    [CodEmpresa,
                     CodEmpresa,
                     Cobrebem,
                     QuotedStr('REMESSA'),
                     QuotedStr(UpperCase(itemOk.Arquivo))]))
              .ParamValue('doc', vDadosRem).query.ExecSQL;

            if trim(diretorio) <> '' then
            begin
              vStringListRemessa.Text := vDadosRem;
              vStringListRemessa.SaveToFile(diretorio + '\' + UpperCase(itemOk.Arquivo));
            end;
          end;

          for var tituloOK in itemOk.Titulos do
          begin
            SqlExec(' update boletas set' +
                    ' api_idremintegracao = %s,' +
                    ' remessa_enviada = %s, ' +
                    ' data_remessa = current_date, ' +
                    ' cod_seq_remessa = %d, ' +
                    ' transmissao_automatica = %s ' +
                    ' where api_idintegracao = %s' +
                    ' and cod_empresa = %d' +
                    ' and tipo_api = %s ',
                    [QuotedStr(itemOk.UniqueId),
                     QuotedStr('S'),
                     vSequenciaRem,
                     QuotedStr(IfThen(itemOk.TransmissaoAutomatica, 'S', 'N')),
                     QuotedStr(tituloOK.idintegracao),
                     CodEmpresa,
                     QuotedStr('S')]);
          end;
        end;

        if Transacao.InTransaction then
          Transacao.Commit;
      end;

      Result := True;

    finally
      vStringListRemessa.Free;
    end

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TPlugBoletoRepo.PostRemessa - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TPlugBoletoRepo.PostBoletos(
  payload: TPostBoletoResponseSucesso): Boolean;
var
  seqBol: string;
  empBol: string;
begin
  Result := False;

  try
    if Length(payload._dados._sucesso) > 0 then
    begin
      for var itemOk in payload._dados._sucesso do
      begin
        seqBol := itemOk.TituloCodigoReferencia.Substring(0, itemOk.TituloCodigoReferencia.IndexOf('-'));
        empBol := itemOk.TituloCodigoReferencia.Substring(itemOk.TituloCodigoReferencia.IndexOf('-') + 1, Length(itemOk.TituloCodigoReferencia));

        if empBol.Trim.Equals(CodEmpresa.ToString()) then
        begin
          SqlExec(' update boletas set' +
                  ' api_situacao = %s,' +
                  ' api_idintegracao = %s' +
                  ' where n_seq_bol = %s ' +
                  ' and cod_empresa = %d ' +
  //                ' and api_idintegracao is null ' +
                  ' and tipo_api = ''S'' ',
                  [itemOk.situacao.QuotedString(),
                   itemOk.idintegracao.QuotedString(),
                   seqBol,
                   CodEmpresa]);
        end;
      end;

      if Transacao.InTransaction then
        Transacao.Commit;
    end;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TPlugBoletoRepo.PostBoletos(TPostBoletoResponseSucesso) - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

end.
