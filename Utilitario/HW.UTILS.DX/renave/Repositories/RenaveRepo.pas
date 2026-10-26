unit RenaveRepo;

interface


uses
  Data.DB,
  uClasseConexao,
  HW.Servicos,
  BaseSingleton,
  CertificadoModel,
  VeiculoEstoqueModel,
  VeiculoDadosHodometroModel,
  SolicitacaoSaidaEstoqueZeroModel,
  SolicitacaoDevolucaoMontadoraZeroKmModel,
  MunicipioRenaveModel,
  rnv_municipio_class,
  rnv_estoque_class,
  rnv_estoque_entrada_class,
  rnv_estoque_canc_class,
  rnv_estoque_saida_class,
  rnv_estoque_saida_cmp_class,
  rnv_estoque_saida_canc_class,
  rnv_estoque_restr_class;

const
  RENAVE_CONF_KEY = 'renave_conf_api';

type

  TRenaveRepo = class;

//  TEstoque_OOP = class(TConexao_OOP)
//  private
////    FAfterScroll: TDataSetNotifyEvent;
//    procedure datasetAfterScroll(DataSet: TDataSet);
//  public
//    constructor Create(owner: TRenaveRepo);
//  published
////    property AfterScroll: TDataSetNotifyEvent read FAfterScroll write FAfterScroll;
//  end;


  TRenaveRepo = class(THwServicos)
  private
    inicializado: Boolean;
    dataSetEstoque: TConexao_OOP;
    dataSetRenave: TConexao_OOP;
    FcpfResponsavel: string;
    FemailEstabelecimento: string;
  public

//    procedure Inicializar(params: string);
//    procedure InitRepo(params: string);

    function PostCertificate(payload: TCertificadoModel): Boolean;
    function GetCertificate(): TCertificadoModel;

    function GetDataSetVeiculosEmEstoque(nfId: Integer): TConexao_OOP; overload;
    function GetDataSetVeiculosEmEstoque(chassis: TArray<string>): TConexao_OOP; overload;
    function GetDataSetVeiculosRenave(chassi: string): TConexao_OOP;
    function PostEstoqueVeiculo(payload: TArray<TVeiculoEstoqueModel>): Boolean;
    function PostDadosHodometro(payload: TArray<TVeiculoDadosHodometroModel>): Boolean;
    function GetSolicitacaoSaida(chassi: string; nfId:Integer): TSolicitacaoSaidaEstoqueZeroModel;
    function GetSolicitacaoDevolucaoMontadora(chassi: string; nfId:Integer): TSolicitacaoDevolucaoMontadoraZeroKmModel;
    function PostMunicipiosRenave(payload: TArray<TMunicipioRenaveModel>): Boolean;
    function PostMunicipioRenave(payload: TRnv_municipio_class): Boolean;
    function GetMunicipiosRenave(uf: string): TArray<TRnv_municipio_class>;
    function GetLastEstoqueZeroRenave(chassi: string): TVeiculoEstoqueModel;

    //account
//    function GetAccount(): TConfigurationModel;
//    function PostAccount(payload: TIntegrationModel): Boolean;

    //Revision
//    function SetRevisionId(id: string; participante: TParticipanteRevisao): Boolean;
//    function GetRevisionTagList(revision: TRevisionModel): TArray<TAo_revisions_tags_class>;
//    function PostRevision(payload: TRevisionHwModel): Boolean;

    //Pessoas
    //talvez um metodo que junte todos os cpfs pelo id do cliente/colaborador, e das demais empresas

    //Docs
    //    function GetDocuments()

    property cpfResponsavel: string read FcpfResponsavel write FcpfResponsavel;
    property emailEstabelecimento: string read FemailEstabelecimento write FemailEstabelecimento;

  end;

  TRenaveRepoSingleton = TSingleton<TRenaveRepo>;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  Hw.Convert,
  Query_OOP,
  hw_utils,
  hw_win_utils;

{ TRenaveRepo }

function TRenaveRepo.GetCertificate: TCertificadoModel;
begin

  Result := TCertificadoModel.Create;

  var conf := GetConfig(RENAVE_CONF_KEY, CodEmpresa);

  Result.certificateId := conf.ReadString('Certificado', 'Id');
  Result.name := conf.ReadString('Certificado', 'Name');
  Result.vencimento := StrToDateTimeDef(conf.ReadString('Certificado', 'Expires'), 0);
end;

function TRenaveRepo.GetDataSetVeiculosEmEstoque(
  chassis: TArray<string>): TConexao_OOP;
begin
  if not Assigned(dataSetEstoque) then
    dataSetEstoque := NewClientOOP('');//TConexao_OOP.Create(Self);

  Result := dataSetEstoque;

  var strChassi := '';
  if Length(chassis) > 0 then
    for var chassi in chassis do
      strChassi := strChassi + IfThen(not strChassi.IsEmpty, ',') + chassi.Trim.QuotedString;

  strChassi := IfThen(not strChassi.IsEmpty,
                      Format(' and e.chassi_c in (%s) ', [strChassi]),
                      ' and e.posicao = ''VIVO'' ');

  dataSetEstoque.ClientOpen('select ''N'' sel, ''                '' status_renave, cast('''' as BLOB SUB_TYPE 1 SEGMENT SIZE 80) mensagem,' +
                            ' e.chassi_c chassi, e.marcaest, e.descricao_versaoest, e.ano_fabest, e.ano_modest, e.corest,' +
                            ' e.combustivelest,  e.motorest, nf.num_nf, nf.serie, nfi.valor_total valor_compra,' +
                            ' nf.chave_nfe chave_nfe_compra, nf.situacao_nfe, nf.emissao_propria, nf.data_ent_saida data_entrada,' +
                            ' nf.cod_nf, e.posicao, e.kmhodometro, e.datahoramedicaohodometro, e.codigo ' +
                            ' from est_moto e' +
                            ' left join notafiscal nf on nf.cod_nf = e.cod_nf and nf.cod_empresa = e.cod_empresa' +
                            ' left join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
                            '   and nfi.chassi = e.chassi_c' +
                            ' where e.cod_empresa = %d and e.status_uso = ''N''' +
                            ' %s ' +
                            ' order by e.data_cad desc', [CodEmpresa, strChassi]);

//  dataSetEstoque.Field['mensagem'].Visible := False;
end;

function TRenaveRepo.GetDataSetVeiculosRenave(
  chassi: string): TConexao_OOP;
begin
  if not Assigned(dataSetRenave) then
    dataSetRenave := NewClientOOP('');

  Result := dataSetRenave;

  dataSetRenave.ClientOpen('select re.id, re.estado, re.chassi, re.placa, ree.datahora "Data(entrada)",' +
                           ' res.datahora "Data(saída)", iif(resca.id is null, ''Nao'', ''Sim'') "Saída cancelada?",' +
                           ' iif(rec.id is null, ''Nao'', ''Sim'') "Entrada cancelada?", res.motivo "Motivo(saída)",' +
                           ' rec.motivocancelamentoestoque "Motivo cancelamento(entrada)",' +
                           ' rec.datahoracancelamentoestoque "Data cancelamento(entrada)",' +
                           ' resc.nome "Comprador", resc.tipodocumento "Tipo Doc(comprador)",' +
                           ' resc.numerodocumento "Num doc(comprador)",' +
                           ' resc.logradouro "Logradouro(comprador)", resc.numero "Num endereço(comprador)",' +
                           ' resc.complemento "Complemento(comprador)", resc.bairro "Bairro(comprador)",' +
                           ' resc.mun_nome "Cidade(comprador)", resc.mun_uf "UF(comprador)", resc.cep "CEP(comprador)",' +
                           ' resca.dhcancsaidaestoque "Data cancelamento(saída)",' +
                           ' re.codigosegurancacrv "Cod segur CRV", re.quilometragemhodometro "KMs hodômetro",' +
                           ' re.datahoramedicaohodometro "Data medição hodômetro", re.tipocrv "Tipo CRV", re.numerocrv "Numero CRV",' +
                           ' ree.chavenotafiscalentrada "Chave NFe(entrada)", ree.datahoraenvionotafiscalentrada "Data Envio(NFe entrada)",' +
                           ' ree.cpfoperadorresponsavel "CPF resp(entrada)", ree.numerotermoentradaestoque "Num termo(entrada)",' +
                           ' ree.vend_tipodocumento "Tipo Doc(Vendedor)", ree.vend_numerodocumento "Num Doc(Vendedor",' +
                           ' res.chavenotafiscalsaida "ChaveNFe (saída)", res.datahoraenvionotafiscalsaida "Data Envio(NFe saída)",' +
                           ' res.cpfoperadorresponsavel "CPF resp(saída)", res.numerotermosaidaestoque "Num termo(saída)",' +
                           ' re.renavam, re.idestoqueorigemporcanc "Id estoque orig canc",' +
                           ' resca.idestoquegeradocancelamento "Id Estoque canc(saída)"' +
                           ' from rnv_estoque re' +
                           ' left join rnv_estoque_entrada ree on ree.id = re.id and ree.cod_empresa = re.cod_empresa' +
                           ' left join rnv_estoque_canc rec on rec.id = re.id and rec.cod_empresa = re.cod_empresa' +
                           ' left join rnv_estoque_saida res on res.id = re.id and res.cod_empresa = re.cod_empresa' +
                           ' left join rnv_estoque_saida_cmp resc on resc.id = re.id and resc.cod_empresa = re.cod_empresa' +
                           ' left join rnv_estoque_saida_canc resca on resca.id = re.id and resca.cod_empresa = re.cod_empresa' +
                           ' where re.chassi = ''%s'' and re.cod_empresa = %d' +
                           ' order by re.id desc', [chassi, CodEmpresa]);
end;

function TRenaveRepo.GetLastEstoqueZeroRenave(
  chassi: string): TVeiculoEstoqueModel;
begin

  try

    var estoque := TVeiculoEstoqueModel.Create;
    var dbEstoque := TRnv_estoque_class.Create;
    dbEstoque.CopyFrom(SqlOpen('select first 1 * from rnv_estoque where chassi = ''%s'' and cod_empresa = %d order by id desc', [chassi, CodEmpresa]));

    if dbEstoque.id = 0 then
      Exit;

    ConverterAll.MesclarObjetos(TObject(estoque), dbEstoque, True);

    var dbEntrada := TRnv_estoque_entrada_class.Create;
    dbEntrada.CopyFrom(SqlOpen('select first 1 * from rnv_estoque_entrada' +
                               ' where id = %d and cod_empresa = %d',
                               [dbEstoque.id, CodEmpresa]));
    if dbEntrada.id > 0 then
    begin
      var entradaEstoque := TEntradaEstoqueModel.Create;
      ConverterAll.MesclarObjetos(TObject(entradaEstoque), dbEntrada, True);
      estoque.entradaEstoque := entradaEstoque;
    end;

    var dbCanEntrada := TRnv_estoque_canc_class.Create;
    dbCanEntrada.CopyFrom(SqlOpen('select first 1 * from rnv_estoque_canc' +
                               ' where id = %d and cod_empresa = %d',
                               [dbEstoque.id, CodEmpresa]));
    if dbCanEntrada.id > 0 then
    begin
      var cancelamentoEstoque := TCancelamentoEstoqueModel.Create;
      ConverterAll.MesclarObjetos(TObject(cancelamentoEstoque), dbCanEntrada, True);
      estoque.cancelamentoEstoque := cancelamentoEstoque;
    end;

    var dbSaida := TRnv_estoque_saida_class.Create;
    dbSaida.CopyFrom(SqlOpen('select first 1 * from rnv_estoque_canc' +
                               ' where id = %d and cod_empresa = %d',
                               [dbEstoque.id, CodEmpresa]));
    if dbSaida.id > 0 then
    begin
      var saidaEstoque := TSaidaEstoqueModel.Create;
      ConverterAll.MesclarObjetos(TObject(saidaEstoque), dbSaida, True);
      estoque.saidaEstoque := saidaEstoque;

      var dbSaidaCanc := TRnv_estoque_saida_canc_class.Create;
      dbSaidaCanc.CopyFrom(SqlOpen('select first 1 * from rnv_estoque_canc' +
                                 ' where id = %d and cod_empresa = %d',
                                 [dbEstoque.id, CodEmpresa]));
      if dbSaidaCanc.id > 0 then
      begin
        var cancSaida := TCancelamentoSaidaEstoqueModel.Create;
        ConverterAll.MesclarObjetos(TObject(cancSaida), dbSaidaCanc, True);
        estoque.saidaEstoque.cancelamentoSaidaEstoque := cancSaida;
      end;

      //falta dados do comprador, se for necessario add aqui
    end;

    Result := estoque;

  except on E: Exception do
    begin
      LogApp.Error('TRenaveRepo.GetLastEstoqueZeroRenave - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TRenaveRepo.GetMunicipiosRenave(
  uf: string): TArray<TRnv_municipio_class>;
begin

  try
    Result := [];

    var query := TQuery_OOP.Create(QrAux).Open('select * from rnv_municipio where uf = ''%s'' order by nome', [uf]);
    while not query.Eof do
    begin
      Result := Result + [TRnv_municipio_class.Create().CopyFrom(query.query) as TRnv_municipio_class];

      query.Next;
    end;

  except on E: Exception do
    begin
      LogApp.Error('TRenaveRepo.GetMunicipiosRenave - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TRenaveRepo.GetSolicitacaoDevolucaoMontadora(chassi: string;
  nfId: Integer): TSolicitacaoDevolucaoMontadoraZeroKmModel;
begin

  try

    var idEstoque := SqlScalar('select first 1 id from rnv_estoque' +
                               ' where chassi = ''%s'' and cod_empresa = %d' +
                               ' order by id desc', [chassi, CodEmpresa]).AsInteger;

    var query := TQuery_OOP.Create(QrAux).Open('select nf.chave_nfe, nf.data_contabil' +
                                               ' from notafiscal nf' +
                                               ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
                                               ' where nf.cod_nf = %d and nf.cod_empresa = %d and nfi.chassi = ''%s''',
                                               [nfId, CodEmpresa, chassi]);

    if query.query.IsEmpty then
      Exit(nil);

    Result := TSolicitacaoDevolucaoMontadoraZeroKmModel.Create;

    Result.chaveNotaFiscal        := query.fstr('chave_nfe');
    Result.cpfOperadorResponsavel := Self.cpfResponsavel;
    Result.dataDevolucao          := query.fdatet('data_contabil');
    Result.idEstoque              := idEstoque;


  except on E: Exception do
    begin
      LogApp.Error('TRenaveRepo.GetSolicitacaoDevolucaoMontadora - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TRenaveRepo.GetSolicitacaoSaida(chassi: string;
  nfId: Integer): TSolicitacaoSaidaEstoqueZeroModel;
begin

  try

    var idEstoque := SqlScalar('select first 1 id from rnv_estoque' +
                               ' where chassi = ''%s'' and cod_empresa = %d' +
                               ' order by id desc', [chassi, CodEmpresa]).AsInteger;

    var query := TQuery_OOP.Create(QrAux).Open('select nf.chave_nfe, nf.data_contabil, nf.valor_total, nf.dest_email,' +
                                               ' nf.nome_cliente, nf.cpfcgc,  nf.dest_xbairro, nf.dest_cep, nf.dest_xcpl, nf.dest_xlgr,' +
                                               ' nf.dest_nro, m.id codigoMunicipio, nf.dest_xmun, nf.dest_cmun, nf.dest_uf, cl.email' +
                                               ' from notafiscal nf' +
                                               ' inner join empresa e on e.cod_empresa = nf.cod_empresa' +
                                               ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
                                               ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
                                               ' left join rnv_municipio m on m.ibgeid = nf.dest_cmun' +
                                               ' where nf.cod_nf = %d and nf.cod_empresa = %d and nfi.chassi = ''%s'' and nf.natureza_nf = ''S''',
                                               [nfId, CodEmpresa, chassi]);

    if query.query.IsEmpty then
      Exit(nil);

    Result := TSolicitacaoSaidaEstoqueZeroModel.Create;
    Result.comprador := TCompradorSaidaEstoqueModel.Create;
    Result.comprador.endereco := TEnderecoCompradorSaidaEstoqueModel.Create;

    Result.chaveNotaFiscal        := query.fstr('chave_nfe');
    Result.cpfOperadorResponsavel := Self.cpfResponsavel;
    Result.dataVenda              := query.fdatet('data_contabil');
    Result.emailEstabelecimento   := Self.emailEstabelecimento;
    Result.idEstoque              := idEstoque;
    Result.valorVenda             := query.ffloat('valor_total');

    Result.comprador.email           := StrDefault(query.fstr('dest_email'), query.fstr('email'));
    Result.comprador.nome            := query.fcopy('nome_cliente', 40);
    Result.comprador.numeroDocumento := query.fstr('cpfcgc');
    Result.comprador.tipoDocumento   := IfThen(Result.comprador.numeroDocumento.Length = 11, 'CPF', 'CNPJ');

    Result.comprador.endereco.bairro          := query.fcopy('dest_xbairro', 20);
    Result.comprador.endereco.cep             := query.fstr('dest_cep');
    Result.comprador.endereco.codigoMunicipio := query.fint('codigoMunicipio');
    Result.comprador.endereco.complemento     := query.fcopy('dest_xcpl', 20);
    Result.comprador.endereco.logradouro      := query.fcopy('dest_xlgr', 30);
    Result.comprador.endereco.numero          := query.fcopy('dest_nro', 5);

    //if Result.comprador.endereco.codigoMunicipio = 0 then
    begin
      Result.helperCidade := TAuxiliarCidade.Create;
      Result.helperCidade.cidade := query.fstr('dest_xmun');
      Result.helperCidade.ibge := query.fint('dest_cmun');
      Result.helperCidade.uf := query.fstr('dest_uf');
    end;

  except on E: Exception do
    begin
      LogApp.Error('TRenaveRepo.GetSolicitacaoSaida - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TRenaveRepo.GetDataSetVeiculosEmEstoque(nfId: Integer
  ): TConexao_OOP;
begin
  if not Assigned(dataSetEstoque) then
    dataSetEstoque := NewClientOOP('');//TConexao_OOP.Create(Self);

  Result := dataSetEstoque;

  if SqlScalar('select natureza_nf from notafiscal where cod_nf = %d and cod_empresa = %d', [nfId, CodEmpresa])
    .AsString.Equals('E') then
    dataSetEstoque.ClientOpen('select ''N'' sel,' +
                              ' (select first 1 re.estado from rnv_estoque re where re.chassi = e.chassi_c and re.cod_empresa = e.cod_empresa order by re.id desc) estoque_renave,' +
                              ' e.chassi_c chassi, e.corest cor, e.descricao_versaoest descricao, e.ano_fabest ano_fab, e.ano_modest ano_mod,' +
                              ' e.marcaest marca, e.combustivelest comb, e.motorest motor, e.kmhodometro, e.datahoramedicaohodometro,' +
                              ' nf.num_nf nf_compra, nf.chave_nfe chave_nfe_compra, nf.situacao_nfe sit_nfe_compra, nf.emissao_propria,' +
                              ' nf.data_ent_saida data_entrada, nfi.valor_total valor_compra, nf.cod_nf nf_id, e.status_uso novo_usado,' +
                              ' e.posicao, e.codigo, nf.natureza_nf e_s, trim(nf.tipo_emissao) finalidade ' +
                              ' from notafiscal nf' +
                              ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
                              ' inner join notafiscal_item_veiculo nfv on nfv.cod_nf = nfi.cod_nf and nfv.cod_empresa = nfi.cod_empresa' +
                              '   and nfv.nitem = nfi.nitem and nfv.tipo_venda = ''N''' +
                              ' inner join est_moto e on nf.cod_nf = e.cod_nf and nf.cod_empresa = e.cod_empresa and nfv.chassi = e.chassi_c' +
                              ' where nf.cod_nf = %d and nf.cod_empresa = %d' +
                              ' order by nfv.nitem', [nfId, CodEmpresa])
  else
    dataSetEstoque.ClientOpen('select ''N'' sel,' +
                              ' (select first 1 re.estado from rnv_estoque re where re.chassi = e.chassi_c and re.cod_empresa = e.cod_empresa order by re.id desc) estoque_renave,' +
                              ' e.chassi_c chassi, e.corest cor, e.descricao_versaoest descricao, e.ano_fabest ano_fab, e.ano_modest ano_mod,' +
                              ' e.marcaest marca, e.combustivelest comb, e.motorest motor, e.kmhodometro, e.datahoramedicaohodometro,' +
                              ' nf.num_nf nf_saida, nf.chave_nfe chave_nfe_saida, nf.situacao_nfe sit_nfe_saida, nf.emissao_propria,' +
                              ' coalesce(nf.data_ent_saida, nf.data_lanc) data_saida, nf.valor_total valor_nf, nf.cod_nf nf_id, e.status_uso novo_usado,' +
                              ' e.posicao, e.codigo, nf.natureza_nf e_s, trim(nf.tipo_emissao) finalidade ' +
                              ' from notafiscal nf' +
                              ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
                              ' inner join notafiscal_item_veiculo nfv on nfv.cod_nf = nfi.cod_nf and nfv.cod_empresa = nfi.cod_empresa' +
                              '   and nfv.nitem = nfi.nitem and nfv.tipo_venda = ''N''' +
                              ' inner join est_moto e on nf.cod_nf = e.cod_nfv and nf.cod_empresa = e.cod_empresa and nfv.chassi = e.chassi_c' +
                              ' where nf.cod_nf = %d and nf.cod_empresa = %d' +
                              ' order by nfv.nitem', [nfId, CodEmpresa]);


//  dataSetEstoque.Field['mensagem'].Visible := False;
end;

function TRenaveRepo.PostCertificate(payload: TCertificadoModel): Boolean;
begin

  var conf := GetConfig(RENAVE_CONF_KEY, CodEmpresa);
  if conf.display_.IsEmpty then
  begin
    conf.display_ := 'Configuração da API Renave';
    conf.ativo := 1;
    conf.tag := ';renave;0km;zerokm;';
    conf.chave := RENAVE_CONF_KEY;
    conf.type1_ := 'string';
    conf.cod_empresa := CodEmpresa;

  end;

  conf.WriteString('Certificado', 'Id', payload.certificateId);
  conf.WriteString('Certificado', 'Name', payload.name);
  conf.WriteString('Certificado', 'Expires', FormatDateTime('dd/MM/yyyy hh:mm:ss', payload.vencimento));
  conf.WriteString('Responsavel', 'CPF', cpfResponsavel);
  conf.WriteString('Responsavel', 'EmailEstabelecimento', conf.ReadString('Responsavel', 'EmailEstabelecimento'));

  conf.SaveConfDB(QrAux).Transaction.Commit;

  Result := True;

end;

function TRenaveRepo.PostDadosHodometro(
  payload: TArray<TVeiculoDadosHodometroModel>): Boolean;
begin

  try

    for var veiculo in payload do
      SqlExec('update est_moto set KMHODOMETRO = %d, DATAHORAMEDICAOHODOMETRO = %s' +
              ' where chassi_c = ''%s'' and cod_empresa = %d and codigo = %d',
              [veiculo.valorHodometro, date_fb(veiculo.dataMedicao), veiculo.chassi, CodEmpresa, veiculo.veiculoId]);

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TRenaveRepo.PostDadosHodometro - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TRenaveRepo.PostEstoqueVeiculo(
  payload: TArray<TVeiculoEstoqueModel>): Boolean;
var
  estoque: TRnv_estoque_class;
  entrada: TRnv_estoque_entrada_class;
  cancEst: TRnv_estoque_canc_class;
  saida: TRnv_estoque_saida_class;
  comprador: TRnv_estoque_saida_cmp_class;
  cancSai: TRnv_estoque_saida_canc_class;
  restric: TRnv_estoque_restr_class;
begin

  try

    for var item in payLoad do
    begin

      estoque := TRnv_estoque_class.Create;

      if item.origemPorCancelamentoEstoque <> nil then
        ConverterAll.MesclarObjetos(TObject(estoque), item.origemPorCancelamentoEstoque, True);

      ConverterAll.MesclarObjetos(TObject(estoque), item, True);
      estoque.cod_empresa := CodEmpresa;

      SqlExec(estoque.SQLMotor().SQLUpdateOrInsert);

      if item.entradaEstoque <> nil then
      begin
        entrada := TRnv_estoque_entrada_class.Create;
        ConverterAll.MesclarObjetos(TObject(entrada), item.entradaEstoque, True);
        entrada.id := item.id;
        entrada.cod_empresa := CodEmpresa;
        if item.entradaEstoque.vendedor <> nil then
          ConverterAll.MesclarObjetos(TObject(entrada), item.entradaEstoque.vendedor, True);
//        begin
//          entrada.vend_numerodocumento := item.entradaEstoque.vendedor.numeroDocumento;
//          entrada.vend_tipodocumento := item.entradaEstoque.vendedor.tipoDocumento;
//        end;

        SqlExec(entrada.SQLMotor().SQLUpdateOrInsert);
      end;

      if item.cancelamentoEstoque <> nil then
      begin
        cancEst := TRnv_estoque_canc_class.Create;
        ConverterAll.MesclarObjetos(TObject(cancEst), item.cancelamentoEstoque, True);
        cancEst.id := item.id;
        cancEst.cod_empresa := CodEmpresa;

        SqlExec(cancEst.SQLMotor().SQLUpdateOrInsert);
      end;

      if item.saidaEstoque <> nil then
      begin
        saida := TRnv_estoque_saida_class.Create;
        ConverterAll.MesclarObjetos(TObject(saida), item.saidaEstoque, True);
        saida.id := item.id;
        saida.cod_empresa := CodEmpresa;

        SqlExec(saida.SQLMotor().SQLUpdateOrInsert);

        if item.saidaEstoque.comprador <> nil then
        begin
          comprador := TRnv_estoque_saida_cmp_class.Create;
          if item.saidaEstoque.comprador.endereco <> nil then
          begin
            ConverterAll.MesclarObjetos(TObject(comprador), item.saidaEstoque.comprador.endereco, True);
            if item.saidaEstoque.comprador.endereco.municipio <> nil then
              ConverterAll.MesclarObjetos(TObject(comprador), item.saidaEstoque.comprador.endereco.municipio, True);
//            begin
//              comprador.mun_id := item.saidaEstoque.comprador.endereco.municipio.id;
//              comprador.mun_nome := item.saidaEstoque.comprador.endereco.municipio.nome;
//              comprador.mun_uf := item.saidaEstoque.comprador.endereco.municipio.uf;
//            end;
          end;
          ConverterAll.MesclarObjetos(TObject(comprador), item.saidaEstoque.comprador, True);
          comprador.id := item.id;
          comprador.cod_empresa := CodEmpresa;

          SqlExec(comprador.SQLMotor().SQLUpdateOrInsert);
        end;

        if item.saidaEstoque.cancelamentoSaidaEstoque <> nil then
        begin
          cancSai := TRnv_estoque_saida_canc_class.Create;
          ConverterAll.MesclarObjetos(TObject(cancSai), item.saidaEstoque.cancelamentoSaidaEstoque, True);
          cancSai.id := item.id;
          cancSai.cod_empresa := CodEmpresa;

          SqlExec(cancSai.SQLMotor().SQLUpdateOrInsert);
        end;
      end;   

      SqlExec('delete from RNV_ESTOQUE_RESTR where id = %d and cod_empresa = %d', [item.id, CodEmpresa]);
      for var I := Low(item.restricoesVeiculo) to High(item.restricoesVeiculo) do
      begin
        restric := TRnv_estoque_restr_class.Create;
        ConverterAll.MesclarObjetos(TObject(restric), item.restricoesVeiculo[I], True);
        restric.id := item.id;
        restric.cod_empresa := CodEmpresa;
        restric.idx := I;

        SqlExec(restric.SQLMotor().SQLUpdateOrInsert);
      end;

    end;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TRenaveRepo.PostEstoqueVeiculo - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;

end;

function TRenaveRepo.PostMunicipioRenave(
  payload: TRnv_municipio_class): Boolean;
var
  cid : TRnv_municipio_class;
begin

  try

    cid := TRnv_municipio_class.Create;
    cid.CopyFrom(SqlOpen('select * from rnv_municipio where id = %d', [payload.id]));

    cid.id := payload.id;
    cid.nome := payload.nome;
    cid.uf := payload.uf;
    cid.ibgeid := payload.ibgeid;

    if cid.FoundChanges then
      SqlExec(cid.SQLMotor().SQLUpdateOrInsert);

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TRenaveRepo.PostMunicipioRenave - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TRenaveRepo.PostMunicipiosRenave(
  payload: TArray<TMunicipioRenaveModel>): Boolean;
var
  cid : TRnv_municipio_class;
begin

  try

    for var cidade in payload do if (StrToIntDef(cidade.id, 0) > 0) then
    begin
      cid := TRnv_municipio_class.Create;
      cid.CopyFrom(SqlOpen('select * from rnv_municipio where id = %s', [cidade.id]));

      if (cid.id = 0) then
      begin
        cid.id := StrToIntDef(cidade.id, 0);
        cid.nome := cidade.nome;
        cid.uf := cidade.uf;

        var ibge := SqlScalar('select c.codigo_mun_ibge from cidades_ibge c' +
                              ' inner join estados e on e.ibge_codigo_uf = c.codigo_uf_ibge' +
                              ' where c.nome_municipio = ''%s'' and e.sigla_uf = ''%s''',
                              [cidade.nome.Replace('''', '''''').Trim.ToUpper, cidade.uf.Trim.ToUpper]).AsInteger;

        if ibge > 0 then
          cid.ibgeid := ibge;

        SqlExec(cid.SQLMotor().SQLUpdateOrInsert);
      end;

    end;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TRenaveRepo.PostMunicipiosRenave - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

end.
