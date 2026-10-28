unit HwCloudRepo;

interface

uses
  Data.DB,
  uClasseConexao,
  HW.Servicos,
  Vcl.Dialogs,
  BaseSingleton,
  ConfigApiModel,
  ClienteModel,
  EmpresaModel,
  UsuarioSenhaModel,
  ContatoPlataformaModel,
  System.Classes,
  HwCloudModels,
  HwCloudResponseModels,
  Neon.Core.Types,
  Neon.Core.Persistence,
  Neon.Core.Persistence.JSON;

const
  HWCLOUD_URL_API_AUTH_PROD = 'https://hwcloudia.hwsistemasti.com.br';

  CONF_API = 'HWCLOUD_IA';

type

  THwCloudRepo = class(THwServicos)
  strict private
  private
    dataSetNotas: TConexao_OOP;
  public
    function GetConfigApi(
      apiName: string): TConfigApiModel;
    function GetEmpresa: TEmpresaModel;
    function GetAplicativo(
      codaplicativo: Integer): string;
    function GetCliente(
      codcliente: Integer; tipocliente: string): TClienteModel;
    function GetContato(
      codcontato: Integer; tipocliente: string): TContatoPlataformaModel;
    function GetContatoColaboradoresApagar: TContatosPlataformaModel;
    function GetContatoClienteApagar(
      codcliente: Integer): TContatosPlataformaModel;
    function GetContatoClienteAvulso(
      ndoc: string;
      tipodoc: string;
      codaplicativo: Integer;
      identificacao: string;
      contato: string;
      origem: string;
      codtipocontato: Integer): TContatosPlataformaModel;
    function GetContatoClientePlataforma(
      codcliente: Integer;
      ndoc: string;
      tipodoc: string;
      codaplicativo: Integer;
      identificacao: string;
      contato: string;
      origem: string;
      somentecontatosaceitos: string): TContatosPlataformaModel;
    function GetTipoContato (
      codtipocontato: Integer): Boolean;
    function CadMensagem(
      codusuario: Integer;
      codcarta: Integer;
      codaplicativo: Integer;
      codplataforma: Integer;
      assunto: string;
      mensagem: string;
      mens: TCadMensageriaComTemplateComAnexo;
      res: TMensageriaResponse): Boolean; overload;
    function CadMensagem(
      codusuario: Integer;
      codcarta: Integer;
      codaplicativo: Integer;
      codplataforma: Integer;
      assunto: string;
      mensagem: string;
      mens: TCadMensageriaComTemplateSemAnexo;
      res: TMensageriaResponse): Boolean; overload;
    function CadMensagem(
      codusuario: Integer;
      codcarta: Integer;
      codaplicativo: Integer;
      codplataforma: Integer;
      assunto: string;
      mens: TCadMensageriaSemTemplateComAnexo;
      res: TMensageriaResponse): Boolean; overload;
    function CadMensagem(
      codusuario: Integer;
      codcarta: Integer;
      codaplicativo: Integer;
      codplataforma: Integer;
      assunto: string;
      mens: TCadMensageriaSemTemplateSemAnexo;
      res: TMensageriaResponse): Boolean; overload;
    function LerMensagem(
      codigo: Integer;
      mens: TLerMensageria;
      res: TLerMensageriaResponse): Boolean; overload;
    function GetMensagem(
      codigo: Integer;
      statusenv: string;
      obsenv: string;
      documento: string): Boolean;
    function InserirMensagem(
      codusuario: Integer;
      codcarta: Integer;
      codaplicativo: Integer;
      codplataforma: Integer;
      identificacao: string;
      assunto: string;
      mensagem: string;
      documento: string;
      origem: string;
      destino: string;
      uuid: string): Boolean;
    function UpdateMensagem(
      codigo: Integer;
      mens: TUpdateMensageria;
      res: TMensageriaResponse): Boolean; overload;
    function VerificarModeloNotificacao(
      codcarta: Integer;
      out assunto: string;
      out mensagem: string;
      out template: string): Boolean;
    function ApagarContato(
      id: Integer): Boolean;
    function BuscarConfig(
      configResponse: TConfigResponse): Boolean;
    function RetornaNomeAplicativo(
      pId: Integer): string;
    function SincHwCloudEmpresa: Boolean;
    function SincHwCloudPessoa(codcliente: Integer; tipocliente: string): Boolean;
    function SincHwCloudContato(id: Integer): Boolean;
  end;

  THwCloudRepoSingleton = TSingleton<THwCloudRepo>;

  Conexao_OOP = TConexao_OOP;

var
  repo: THwCloudRepo;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  hw_utils,
  hw_win_utils,
  hw_jsondx,
  Query_OOP,
  EncdDecd,
  config_sistema_class, System.TypInfo, System.JSON;

{ THwCloudRepo }

function THwCloudRepo.GetConfigApi(
  apiName: string): TConfigApiModel;
var
  Conf: TConfig_sistema_class;
begin
  try
    Result := TConfigApiModel.Create;
    var query := QueryHelper.CreateObj(QrAux)
      .Open(' select ' +
            ' config_api.cod_empresa, ' +
            ' config_api.api, ' +
            ' config_api.url_api, ' +
            ' config_api.token_api, ' +
            ' config_api.usar_api_cog, ' +
            ' config_api.ambiente_api, ' +
            ' config_api.nome_bot, ' +
            ' empresa.identificacao_emp, ' +
            ' empresa.cgc_emp, ' +
            ' config_api.info_contato, ' +
            ' config_api.util_recomendacao, ' +
            ' config_api.modelo_padrao, ' +
            ' config_api.dia_mes_ini_fat_meta, ' +
            ' config_api.limite_gastos_meta, ' +
            ' config_api.interv_treino_recomenda, ' +
            ' config_api.dias_vnd_recomenda, ' +
            ' config_api.horario_semana_ini, ' +
            ' config_api.horario_semana_fim, ' +
            ' config_api.horario_sabado_ini, ' +
            ' config_api.horario_sabado_fim, ' +
            ' config_api.peso_popularidade, ' +
            ' config_api.peso_nivel_giro_medio, ' +
            ' config_api.peso_demanda, ' +
            ' config_api.peso_frequencia, ' +
            ' config_api.peso_preco, ' +
            ' config_api.giro_padrao_baixo_ini,' +
            ' config_api.giro_padrao_baixo_fim, ' +
            ' config_api.giro_padrao_medio_ini, ' +
            ' config_api.giro_padrao_medio_fim, ' +
            ' config_api.giro_padrao_alto_ini, ' +
            ' config_api.giro_padrao_alto_fim ' +
            ' from config_api ' +
            ' inner join empresa on empresa.cod_empresa = config_api.cod_empresa ' +
            ' where config_api.cod_empresa = %d ' +
            ' and config_api.api = %s',
            [CodEmpresa,
             apiName.QuotedString()]);

    Result.empresaId := query.fint('cod_empresa');
    Result.cnpj := query.fstr('cgc_emp');
    Result.identificacao_emp := query.fstr('identificacao_emp');
    Result.api := query.fstr('api');
    Result.URL := query.fstr('url_api');
    Result.authorization := query.fstr('token_api');
    Result.info_contato := query.fstr('info_contato');


    Result.usar_api_cog := query.fstr('usar_api_cog');
    Result.modelo_padrao := query.fint('modelo_padrao');
    Result.ambiente_api := query.fstr('ambiente_api');
    Result.dia_mes_ini_fat_meta := query.fint('dia_mes_ini_fat_meta');
    Result.limite_gastos_meta := query.ffloat('limite_gastos_meta');

    Result.horario_semana_ini := query.fstr('horario_semana_ini');
    Result.horario_semana_fim := query.fstr('horario_semana_fim');
    Result.horario_sabado_ini := query.fstr('horario_sabado_ini');
    Result.horario_sabado_fim := query.fstr('horario_sabado_fim');

    Result.peso_popularidade := query.fint('peso_popularidade');
    Result.peso_nivel_giro_medio := query.fint('peso_nivel_giro_medio');
    Result.peso_demanda := query.fint('peso_demanda');
    Result.peso_frequencia := query.fint('peso_frequencia');
    Result.peso_preco := query.fint('peso_preco');

    Result.giro_padrao_baixo_ini := query.ffloat('giro_padrao_baixo_ini');
    Result.giro_padrao_baixo_fim := query.ffloat('giro_padrao_baixo_fim');
    Result.giro_padrao_medio_ini := query.ffloat('giro_padrao_medio_ini');
    Result.giro_padrao_medio_fim := query.ffloat('giro_padrao_medio_fim');
    Result.giro_padrao_alto_ini  := query.ffloat('giro_padrao_alto_ini');
    Result.giro_padrao_alto_fim  := query.ffloat('giro_padrao_alto_fim');

    Result.util_recomendacao := query.fstr('util_recomendacao');
    Result.interv_treino_recomenda := query.fint('interv_treino_recomenda');
    Result.dias_vnd_recomenda := query.fint('dias_vnd_recomenda');


    try
      Conf := TConfig_sistema_class.getConf('hw_cloud_ia_conf', QrAux, CodEmpresa);

      try
        Result.somente_contatos_aceitos := trim(Conf.ReadString('Configuracao', 'SomenteContatosAceitos'));

        if (UpperCase(trim(Result.somente_contatos_aceitos)) = 'S') or (UpperCase(trim(Result.somente_contatos_aceitos)) = 'SIM') then
          Result.somente_contatos_aceitos := 'S'
        else
          Result.somente_contatos_aceitos := 'N';
      except
        Result.somente_contatos_aceitos := 'N';
      end;

      if trim(Conf.ReadString('Configuracao', 'CodTipoContatoPadrao')) = '' then
        Result.cod_tipo_contato_padrao := 0
      else
      begin
        try

          Result.cod_tipo_contato_padrao := StrToInt(trim(Conf.ReadString('Configuracao', 'CodTipoContatoPadrao')));

          if (Result.cod_tipo_contato_padrao < 0) then
            Result.cod_tipo_contato_padrao := 0;
        except
          Result.cod_tipo_contato_padrao := 0;
        end;
      end;
    finally
      if Assigned(Conf) then
        FreeAndNil(Conf);
    end;
  except on E: Exception do
    begin
      LogApp.Error('THwCloudRepo.GetConfigApi - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetEmpresa: TEmpresaModel;
begin
  try
    Result := TEmpresaModel.Create;
    var query := QueryHelper.CreateObj(QrAux)
      .Open(' select ' +
            ' empresa.cod_empresa, ' +
            ' iif(empresa.ativo = 1, 1, 0) ativo, ' +
            ' empresa.sinc_hwcloud ' +
            ' from empresa ' +
            ' where empresa.cod_empresa = ' + IntToStr(CodEmpresa));

    Result.cod_empresa := query.fint('cod_empresa');

    Result.ativo := query.fint('ativo');
    Result.sinc_hwcloud := query.fstr('sinc_hwcloud');
  except on E: Exception do
    begin
      LogApp.Error('THwCloudRepo.GetEmpresa - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetAplicativo(codaplicativo: Integer): string;
begin
  try
    var query := QueryHelper.CreateObj(QrAux)
      .Open(' select msg_aplicativo.aplicativo from msg_aplicativo ' +
        ' where msg_aplicativo.id = ' + IntToStr(codaplicativo));
    Result := query.fstr('aplicativo');

  except on E: Exception do
    begin
      LogApp.Error('THwCloudRepo.GetAplicativo - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetCliente(
  codcliente: Integer;
  tipocliente: string): TClienteModel;
begin
  try
    Result := TClienteModel.Create;
    if tipocliente = 'CI' then
    begin
      var query := QueryHelper.CreateObj(QrAux)
        .Open(' select ' +
          ' colaborador.cod_vendedor, ' +
          ' colaborador.nome_vendedor, ' +
          ' colaborador.cpf_vendedor, ' +
          ' colaborador.rg_vendedor, ' +
          ' colaborador.obs_vendedor, ' +
          ' colaborador.fone_vendedor, ' +
          ' colaborador.dat_nasc_col, ' +
          ' null as horario_ini_padrao, ' +
          ' null as horario_fim_padrao, ' +
          ' null as dias_folga_semana, ' +
          ' iif(funcoes.desc_funcao like ''%VEND%'', 1, 0) is_vendedor, ' +
          ' iif(colaborador.ativo = 1, 1, 0) ativo, ' +
          ' colaborador.sinc_hwcloud ' +
          ' from colaborador ' +
          ' left join funcoes on funcoes.cod_funcao = colaborador.cod_funcao ' +
          ' where colaborador.cod_vendedor = ' + IntToStr(codcliente) +
          ' and colaborador.cod_empresa = ' + IntToStr(CodEmpresa));

      Result.cod_cliente := query.fint('cod_vendedor');
      Result.nome_cliente := query.fstr('nome_vendedor');
      Result.razao := query.fstr('nome_vendedor');
      Result.cpfcgc := query.fstr('cpf_vendedor');
      Result.rg := query.fstr('rg_vendedor');

      Result.horario_ini_padrao := query.fstr('horario_ini_padrao');
      Result.horario_fim_padrao := query.fstr('horario_fim_padrao');
      Result.dias_folga_semana := query.fstr('dias_folga_semana');
      Result.is_vendedor := query.fint('is_vendedor') = 1;

      Result.observacao := query.fstr('obs_vendedor');
      Result.fone_cliente := query.fstr('fone_vendedor');
      Result.data_cadastro := query.fdate('dat_nasc_col');

      Result.ativo := query.fint('ativo');
      Result.sinc_hwcloud := query.fstr('sinc_hwcloud');
    end
    else
    begin
      var query := QueryHelper.CreateObj(QrAux)
        .Open(' select ' +
          ' clientes.cod_cliente, ' +
          ' clientes.nome_cliente, ' +
          ' clientes.razao, ' +
          ' clientes.cpfcgc, ' +
          ' clientes.rg, ' +
          ' clientes.conjuge, ' +
          ' clientes.pai, ' +
          ' clientes.mae, ' +
          ' clientes.observacao, ' +
          ' clientes.fone_cliente, ' +
          ' clientes.estado_civil, ' +
          ' clientes.naturalid, ' +
          ' clientes.sexo, ' +
          ' clientes.num_end_cliente, ' +
          ' clientes.data_cadastro, ' +
          ' tipo_faturamento.desc_fat, ' +
          ' iif(clientes.ativo = 1, 1, 0) ativo, ' +
          ' clientes.sinc_hwcloud from clientes ' +
          ' left join tipo_faturamento on tipo_faturamento.codigo_faturamento = clientes.codigo_faturamento ' +
          ' where clientes.cod_cliente = ' + IntToStr(codcliente) +
          ' and clientes.cod_empresa = ' + IntToStr(CodEmpresa));

      Result.cod_cliente := query.fint('cod_cliente');
      Result.nome_cliente := query.fstr('nome_cliente');
      Result.razao := query.fstr('razao');
      Result.cpfcgc := query.fstr('cpfcgc');
      Result.rg := query.fstr('rg');

      Result.conjuge := query.fstr('conjuge');
      Result.pai := query.fstr('pai');
      Result.mae := query.fstr('mae');

      Result.observacao := query.fstr('observacao');
      Result.fone_cliente := query.fstr('fone_cliente');
      Result.estado_civil := query.fstr('estado_civil');
      Result.naturalid := query.fstr('naturalid');
      Result.sexo := query.fstr('sexo');

      Result.num_end_cliente := query.fstr('num_end_cliente');
      Result.data_cadastro := query.fdate('data_cadastro');

      Result.ativo := query.fint('ativo');
      Result.sinc_hwcloud := query.fstr('sinc_hwcloud');
    end;

  except on E: Exception do
    begin
      LogApp.Error('THwCloudRepo.GetCliente - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetContato(
  codcontato: Integer; tipocliente: string): TContatoPlataformaModel;
begin
  try
    Result := TContatoPlataformaModel.Create;
    var query := QueryHelper.CreateObj(QrAux)
      .Open(' select ' +
            ' msg_contato.id, ' +
            ' msg_contato.cod_cliente, ' +
            ' msg_contato.cod_vendedor, ' +
            ' msg_contato.cod_empresa, ' +
            ' msg_contato.sinc_hwcloud, ' +
            IfThen(tipocliente = 'CI',
              ' iif(colaborador.ativo = 1, iif(msg_contato.ativo = 1, 1, 0), 0) ',
              ' iif(clientes.ativo = 1, iif(msg_contato.ativo = 1, 1, 0), 0) ') +
            ' ativo ' +
            ' from msg_contato ' +
            IfThen(tipocliente = 'CI',
              ' inner join colaborador on colaborador.cod_vendedor = msg_contato.cod_vendedor and colaborador.cod_empresa = msg_contato.cod_empresa ',
              ' inner join clientes on clientes.cod_cliente = msg_contato.cod_cliente and clientes.cod_empresa = msg_contato.cod_empresa ') +
            ' where msg_contato.id = ' + IntToStr(codcontato) +
            ' and msg_contato.cod_empresa = ' + IntToStr(CodEmpresa));

    Result.id := query.fint('id');
    Result.cod_cliente := IfThen(query.fint('cod_vendedor') > 0, query.fint('cod_vendedor'), query.fint('cod_cliente'));
    Result.tipo_pessoa := IfThen(query.fint('cod_vendedor') > 0, 'CI', 'CE');

    Result.ativo := query.fint('ativo');
    Result.sinc_hwcloud := query.fstr('sinc_hwcloud');
  except on E: Exception do
    begin
      LogApp.Error('THwCloudRepo.GetContato - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetContatoClienteApagar(
  codcliente: Integer): TContatosPlataformaModel;
var
  vtemp: string;
begin
  try
    Result := TContatosPlataformaModel.Create;
    var query := QueryHelper.CreateObj(QrAux);

    vtemp :=
      ' select distinct ' +
      ' msg_contato.id, ' +
      ' msg_contato.cod_cliente, ' +
      ' clientes.ativo, ' +
      ' 0 id_msg_origem, ' +
      ' msg_contato.id_msg_aplicativo, ' +
      ' msg_aplicativo.aplicativo, ' +
      ' msg_tipo_contato_origem_plat.id_msg_plataforma, ' +
      ' msg_plataforma.plataforma, ' +
      ' msg_plataforma.identificador_bot, ' +
      ' ''S'' aceita, ' +
      ' iif(msg_contato.id_msg_aplicativo = 1, ''S'', ''N'') testar_email, ' +
      ' iif(msg_contato.id_msg_aplicativo = 2, ''S'', ''N'') testar_celular, ' +
      ' iif(msg_contato.id_msg_aplicativo = 2, ''S'', ''N'') usar_template, ' +
      ' msg_contato.contato, ' +
      ' msg_contato.identificador, ' +
      ' 0 cod_carta ' +
      ' from msg_contato ' +
      ' inner join clientes on clientes.cod_cliente = msg_contato.cod_cliente and clientes.cod_empresa = msg_contato.cod_empresa ' +
      ' inner join msg_contato_tipo on ' +
      '     msg_contato_tipo.id_msg_contato = msg_contato.id ' +
      '     and msg_contato_tipo.cod_empresa = msg_contato.cod_empresa ' +
      ' inner join tipo_contato on ' +
      '     tipo_contato.id = msg_contato_tipo.id_tipo_contato ' +
      '     and tipo_contato.cod_empresa = msg_contato_tipo.cod_empresa ' +
      ' inner join msg_tipo_contato_origem on ' +
      '     msg_tipo_contato_origem.id_tipo_contato = msg_contato_tipo.id_tipo_contato ' +
      '     and msg_tipo_contato_origem.cod_empresa = msg_contato_tipo.cod_empresa ' +
      ' inner join msg_tipo_contato_origem_plat on ' +
      '     msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = msg_tipo_contato_origem.id ' +
      '     and msg_tipo_contato_origem_plat.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
      ' inner join msg_plataforma on ' +
      '     msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
      '     and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
      ' inner join msg_aplicativo on ' +
      '     msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
      ' inner join msg_origem on ' +
      '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
      ' where msg_contato.id_msg_aplicativo = msg_plataforma.id_msg_aplicativo ' +
      ' and msg_contato.cod_cliente = ' + IntToStr(codcliente) +
      ' and msg_contato.cod_empresa = ' + IntToStr(CodEmpresa) +
      ' and msg_contato.ativo = ' + IntToStr(99);

    vtemp := vtemp +
      ' order by msg_plataforma.id ';

    query.Open(vtemp);

    query.First;
    while not query.Eof do
    begin
      var contatoPlataforma := TContatoPlataformaModel.Create;
      contatoPlataforma.id := query.fint('id');
      contatoPlataforma.cod_cliente := query.fint('cod_cliente');
      contatoPlataforma.tipo_pessoa := 'CE';
      contatoPlataforma.ativo := query.fint('ativo');
      contatoPlataforma.id_msg_origem := query.fint('id_msg_origem');
      contatoPlataforma.id_msg_aplicativo := query.fint('id_msg_aplicativo');
      contatoPlataforma.aplicativo := query.fstr('aplicativo');
      contatoPlataforma.id_msg_plataforma := query.fint('id_msg_plataforma');
      contatoPlataforma.plataforma := query.fstr('plataforma');
      contatoPlataforma.identificador_bot := query.fstr('identificador_bot');
      contatoPlataforma.aceita := query.fstr('aceita');
      contatoPlataforma.testar_email := query.fstr('testar_email');
      contatoPlataforma.testar_celular := query.fstr('testar_celular');
      contatoPlataforma.usar_template := query.fstr('usar_template');
      contatoPlataforma.contato := query.fstr('contato');
      contatoPlataforma.identificador := query.fstr('identificador');
      contatoPlataforma.cod_carta := query.fint('cod_carta');

      Result.Contatos.Add(contatoPlataforma);

      query.Next;
    end;

  except on E: Exception do
    begin
      LogApp.Error('THwCloudRepo.GetContatoApagar - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetContatoClienteAvulso(
  ndoc: string;
  tipodoc: string;
  codaplicativo: Integer;
  identificacao: string;
  contato: string;
  origem: string;
  codtipocontato: Integer): TContatosPlataformaModel;
var
  vtemp: string;
begin
  try
    Result := TContatosPlataformaModel.Create;
    var query := QueryHelper.CreateObj(QrAux);

    vtemp :=
      ' select distinct ' +
      ' 0 id, ' +
      ' 0 cod_cliente, ' +
      ' 1 ativo, ' +
      ' msg_tipo_contato_origem.id_msg_origem, ' +
      ' msg_plataforma.id_msg_aplicativo, ' +
      ' msg_aplicativo.aplicativo, ' +
      ' msg_tipo_contato_origem_plat.id_msg_plataforma, ' +
      ' msg_plataforma.plataforma, ' +
      ' msg_plataforma.identificador_bot, ' +
      ' ''S'' aceita, ' +
      ' iif(msg_aplicativo.id = 1, ''S'', ''N'') testar_email, ' +
      ' iif(msg_aplicativo.id = 2, ''S'', ''N'') testar_celular, ' +
      ' iif(msg_aplicativo.id = 2, ''S'', ''N'') usar_template, ' +
      QuotedStr(trim(contato)) + ' as contato, ' +
      QuotedStr(trim(identificacao)) + ' as identificador, ' +
      ' (coalesce((select first 1 msg_origem_modcartas.cod_carta from msg_origem_modcartas ' +
      '            inner join modcartas on ' +
      '                modcartas.cod_carta = msg_origem_modcartas.cod_carta ' +
      '                and modcartas.cod_empresa = msg_origem_modcartas.cod_empresa ' +
      '                and modcartas.id_msg_aplicativo = msg_aplicativo.id ' +
      '            where msg_origem_modcartas.id_msg_origem = msg_tipo_contato_origem.id_msg_origem ' +
      '            and msg_origem_modcartas.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
      '            and modcartas.doc in (''Q'', ' + QuotedStr(IfThen((trim(ndoc) <> '') and (trim(tipodoc) <> ''), 'U', 'D')) + ')' +
      '           ), 0) ' +
      ' ) cod_carta ' +
      ' from rdb$database ' +
      ' inner join tipo_contato on ' +
      '     tipo_contato.id = ' + IntToStr(codtipocontato) +
      '     and tipo_contato.cod_empresa = ' + IntToStr(CodEmpresa) +
      ' inner join msg_tipo_contato_origem on ' +
      '     msg_tipo_contato_origem.id_tipo_contato = tipo_contato.id ' +
      '     and msg_tipo_contato_origem.cod_empresa = ' + IntToStr(CodEmpresa) +
      ' inner join msg_tipo_contato_origem_plat on ' +
      '     msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = msg_tipo_contato_origem.id ' +
      '     and msg_tipo_contato_origem_plat.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
      ' inner join msg_plataforma on ' +
      '     msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
      '     and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
      ' inner join msg_aplicativo on ' +
      '     msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
      ' inner join msg_origem on ' +
      '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
      ' where msg_origem.descricao = ' + origem.QuotedString +
      ' and msg_plataforma.id_msg_aplicativo = ' + IntToStr(codaplicativo);

    vtemp := vtemp +
      ' order by msg_plataforma.id ';

    query.Open(vtemp);

    query.First;
    while not query.Eof do
    begin
      var contatoPlataforma := TContatoPlataformaModel.Create;
      contatoPlataforma.id := query.fint('id');
      contatoPlataforma.cod_cliente := query.fint('cod_cliente');
      contatoPlataforma.tipo_pessoa := 'CE';
      contatoPlataforma.ativo := query.fint('ativo');
      contatoPlataforma.id_msg_origem := query.fint('id_msg_origem');
      contatoPlataforma.id_msg_aplicativo := query.fint('id_msg_aplicativo');
      contatoPlataforma.aplicativo := query.fstr('aplicativo');
      contatoPlataforma.id_msg_plataforma := query.fint('id_msg_plataforma');
      contatoPlataforma.plataforma := query.fstr('plataforma');
      contatoPlataforma.identificador_bot := query.fstr('identificador_bot');
      contatoPlataforma.aceita := query.fstr('aceita');
      contatoPlataforma.testar_email := query.fstr('testar_email');
      contatoPlataforma.testar_celular := query.fstr('testar_celular');
      contatoPlataforma.usar_template := query.fstr('usar_template');
      contatoPlataforma.contato := query.fstr('contato');
      contatoPlataforma.identificador := query.fstr('identificador');
      contatoPlataforma.cod_carta := query.fint('cod_carta');

      Result.Contatos.Add(contatoPlataforma);

      query.Next;
    end;

  except on E: Exception do
    begin
      LogApp.Error('THwCloudRepo.GetContatoPlataforma - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetContatoClientePlataforma(
  codcliente: Integer;
  ndoc: string;
  tipodoc: string;
  codaplicativo: Integer;
  identificacao: string;
  contato: string;
  origem: string;
  somentecontatosaceitos: string): TContatosPlataformaModel;
var
  vtemp: string;
begin
  try
    Result := TContatosPlataformaModel.Create;
    var query := QueryHelper.CreateObj(QrAux);

    vtemp :=
      ' select distinct ' +
      ' msg_contato.id, ' +
      ' msg_contato.cod_cliente, ' +
      ' clientes.ativo, ' +
      ' msg_tipo_contato_origem.id_msg_origem, ' +
      ' msg_contato.id_msg_aplicativo, ' +
      ' msg_aplicativo.aplicativo, ' +
      ' msg_tipo_contato_origem_plat.id_msg_plataforma, ' +
      ' msg_plataforma.plataforma, ' +
      ' msg_plataforma.identificador_bot, ' +
      IfThen(somentecontatosaceitos = 'S',
        ' (select msg_contato_tipo_notif.aceita from msg_contato_tipo_notif ' +
        '  inner join msg_tipo_notif on msg_tipo_notif.id = msg_contato_tipo_notif.id_msg_tipo_notif ' +
        '  inner join msg_tipo_notif_origem on msg_tipo_notif_origem.id_msg_tipo_not = msg_tipo_notif.id ' +
        '  inner join msg_origem on msg_origem.id = msg_tipo_notif_origem.id_msg_origem ' +
        '  where msg_contato_tipo_notif.id_msg_contato = msg_contato.id ' +
        '  and msg_contato_tipo_notif.cod_empresa = msg_contato.cod_empresa ' +
        '  and msg_origem.descricao = ' + origem.QuotedString +  ')',
        ' ''S'' ') + ' aceita, ' +
      ' iif(msg_contato.id_msg_aplicativo = 1, ''S'', ''N'') testar_email, ' +
      ' iif(msg_contato.id_msg_aplicativo = 2, ''S'', ''N'') testar_celular, ' +
      ' iif(msg_contato.id_msg_aplicativo = 2, ''S'', ''N'') usar_template, ' +
      ' msg_contato.contato, ' +
      ' msg_contato.identificador, ' +
      ' (coalesce((select first 1 msg_origem_modcartas.cod_carta from msg_origem_modcartas ' +
      '            inner join modcartas on ' +
      '                modcartas.cod_carta = msg_origem_modcartas.cod_carta ' +
      '                and modcartas.cod_empresa = msg_origem_modcartas.cod_empresa ' +
      '                and modcartas.id_msg_aplicativo = msg_contato.id_msg_aplicativo ' +
      '            where msg_origem_modcartas.id_msg_origem = msg_tipo_contato_origem.id_msg_origem ' +
      '            and msg_origem_modcartas.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
      '            and modcartas.doc in (''Q'', ' + QuotedStr(IfThen((trim(ndoc) <> '') and (trim(tipodoc) <> ''), 'U', 'D')) + ')' +
      '           ), 0) ' +
      ' ) cod_carta ' +
      ' from msg_contato ' +
      ' inner join clientes on clientes.cod_cliente = msg_contato.cod_cliente and clientes.cod_empresa = msg_contato.cod_empresa ' +
      ' inner join msg_contato_tipo on ' +
      '     msg_contato_tipo.id_msg_contato = msg_contato.id ' +
      '     and msg_contato_tipo.cod_empresa = msg_contato.cod_empresa ' +
      ' inner join tipo_contato on ' +
      '     tipo_contato.id = msg_contato_tipo.id_tipo_contato ' +
      '     and tipo_contato.cod_empresa = msg_contato_tipo.cod_empresa ' +
      ' inner join msg_tipo_contato_origem on ' +
      '     msg_tipo_contato_origem.id_tipo_contato = msg_contato_tipo.id_tipo_contato ' +
      '     and msg_tipo_contato_origem.cod_empresa = msg_contato_tipo.cod_empresa ' +
      ' inner join msg_tipo_contato_origem_plat on ' +
      '     msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = msg_tipo_contato_origem.id ' +
      '     and msg_tipo_contato_origem_plat.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
      ' inner join msg_plataforma on ' +
      '     msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
      '     and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
      ' inner join msg_aplicativo on ' +
      '     msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
      ' inner join msg_origem on ' +
      '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
      ' where msg_contato.id_msg_aplicativo = msg_plataforma.id_msg_aplicativo ' +
      ' and msg_contato.cod_cliente = ' + IntToStr(codcliente) +
      ' and msg_contato.cod_empresa = ' + IntToStr(CodEmpresa) +
      ' and msg_origem.descricao = ' + origem.QuotedString;

    if codaplicativo > 0 then
      vtemp := vtemp +
        ' and msg_contato.id_msg_aplicativo = ' + IntToStr(codaplicativo);

    if trim(identificacao) <> '' then
      vtemp := vtemp +
        ' and msg_contato.identificador = ' + QuotedStr(trim(identificacao));

    if trim(contato) <> '' then
      vtemp := vtemp +
        ' and msg_contato.contato = ' + QuotedStr(trim(contato));

    vtemp := vtemp +
      ' order by msg_plataforma.id ';

    query.Open(vtemp);

    query.First;
    while not query.Eof do
    begin
      var contatoPlataforma := TContatoPlataformaModel.Create;
      contatoPlataforma.id := query.fint('id');
      contatoPlataforma.cod_cliente := query.fint('cod_cliente');
      contatoPlataforma.tipo_pessoa := 'CE';
      contatoPlataforma.ativo := query.fint('ativo');
      contatoPlataforma.id_msg_origem := query.fint('id_msg_origem');
      contatoPlataforma.id_msg_aplicativo := query.fint('id_msg_aplicativo');
      contatoPlataforma.aplicativo := query.fstr('aplicativo');
      contatoPlataforma.id_msg_plataforma := query.fint('id_msg_plataforma');
      contatoPlataforma.plataforma := query.fstr('plataforma');
      contatoPlataforma.identificador_bot := query.fstr('identificador_bot');
      contatoPlataforma.aceita := query.fstr('aceita');
      contatoPlataforma.testar_email := query.fstr('testar_email');
      contatoPlataforma.testar_celular := query.fstr('testar_celular');
      contatoPlataforma.usar_template := query.fstr('usar_template');
      contatoPlataforma.contato := query.fstr('contato');
      contatoPlataforma.identificador := query.fstr('identificador');
      contatoPlataforma.cod_carta := query.fint('cod_carta');

      Result.Contatos.Add(contatoPlataforma);

      query.Next;
    end;

  except on E: Exception do
    begin
      LogApp.Error('THwCloudRepo.GetContatoPlataforma - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetContatoColaboradoresApagar: TContatosPlataformaModel;
var
  vtemp: string;
begin
  try
    Result := TContatosPlataformaModel.Create;
    var query := QueryHelper.CreateObj(QrAux);

    vtemp :=
      ' select distinct ' +
      ' msg_contato.id, ' +
      ' msg_contato.cod_vendedor, ' +
      ' colaborador.ativo, ' +
      ' 0 id_msg_origem, ' +
      ' msg_contato.id_msg_aplicativo, ' +
      ' msg_aplicativo.aplicativo, ' +
      ' msg_tipo_contato_origem_plat.id_msg_plataforma, ' +
      ' msg_plataforma.plataforma, ' +
      ' msg_plataforma.identificador_bot, ' +
      ' ''S'' aceita, ' +
      ' iif(msg_contato.id_msg_aplicativo = 1, ''S'', ''N'') testar_email, ' +
      ' iif(msg_contato.id_msg_aplicativo = 2, ''S'', ''N'') testar_celular, ' +
      ' iif(msg_contato.id_msg_aplicativo = 2, ''S'', ''N'') usar_template, ' +
      ' msg_contato.contato, ' +
      ' msg_contato.identificador, ' +
      ' 0 cod_carta ' +
      ' from msg_contato ' +
      ' inner join colaborador on colaborador.cod_vendedor = msg_contato.cod_vendedor and colaborador.cod_empresa = msg_contato.cod_empresa ' +
      ' inner join msg_contato_tipo on ' +
      '     msg_contato_tipo.id_msg_contato = msg_contato.id ' +
      '     and msg_contato_tipo.cod_empresa = msg_contato.cod_empresa ' +
      ' inner join tipo_contato on ' +
      '     tipo_contato.id = msg_contato_tipo.id_tipo_contato ' +
      '     and tipo_contato.cod_empresa = msg_contato_tipo.cod_empresa ' +
      ' inner join msg_tipo_contato_origem on ' +
      '     msg_tipo_contato_origem.id_tipo_contato = msg_contato_tipo.id_tipo_contato ' +
      '     and msg_tipo_contato_origem.cod_empresa = msg_contato_tipo.cod_empresa ' +
      ' inner join msg_tipo_contato_origem_plat on ' +
      '     msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = msg_tipo_contato_origem.id ' +
      '     and msg_tipo_contato_origem_plat.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
      ' inner join msg_plataforma on ' +
      '     msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
      '     and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
      ' inner join msg_aplicativo on ' +
      '     msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
      ' inner join msg_origem on ' +
      '     msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
      ' where msg_contato.id_msg_aplicativo = msg_plataforma.id_msg_aplicativo ' +
      ' and msg_contato.cod_empresa = %d ' +
      ' and msg_contato.ativo = %d ' +
      ' and msg_contato.cod_vendedor > 0 ';

    vtemp := vtemp +
      ' order by msg_plataforma.id ';

    query.Open(vtemp,
      [CodEmpresa,
       99]);

    query.First;
    while not query.Eof do
    begin
      var contatoPlataforma := TContatoPlataformaModel.Create;
      contatoPlataforma.id := query.fint('id');
      contatoPlataforma.cod_cliente := query.fint('cod_vendedor');
      contatoPlataforma.tipo_pessoa := 'CI';
      contatoPlataforma.ativo := query.fint('ativo');
      contatoPlataforma.id_msg_origem := query.fint('id_msg_origem');
      contatoPlataforma.id_msg_aplicativo := query.fint('id_msg_aplicativo');
      contatoPlataforma.aplicativo := query.fstr('aplicativo');
      contatoPlataforma.id_msg_plataforma := query.fint('id_msg_plataforma');
      contatoPlataforma.plataforma := query.fstr('plataforma');
      contatoPlataforma.identificador_bot := query.fstr('identificador_bot');
      contatoPlataforma.aceita := query.fstr('aceita');
      contatoPlataforma.testar_email := query.fstr('testar_email');
      contatoPlataforma.testar_celular := query.fstr('testar_celular');
      contatoPlataforma.usar_template := query.fstr('usar_template');
      contatoPlataforma.contato := query.fstr('contato');
      contatoPlataforma.identificador := query.fstr('identificador');
      contatoPlataforma.cod_carta := query.fint('cod_carta');

      Result.Contatos.Add(contatoPlataforma);

      query.Next;
    end;

  except on E: Exception do
    begin
      LogApp.Error('THwCloudRepo.GetContatoApagar - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.CadMensagem(
  codusuario: Integer;
  codcarta: Integer;
  codaplicativo: Integer;
  codplataforma: Integer;
  assunto: string;
  mensagem: string;
  mens: TCadMensageriaComTemplateComAnexo;
  res: TMensageriaResponse): Boolean;
var
  vStringListMens: TStringList;
  vStringListBodyResp: TStringList;
  I: Integer;
begin
  Result := False;

  try
    try
      var vNomeAplicativo := RetornaNomeAplicativo(codaplicativo);

      vStringListMens := TStringList.Create;
      vStringListMens.Clear;
//      vStringListMens.Add(mens.assunto_mensagem);
//      vStringListMens.Add(mens.mensagem);
      vStringListMens.Add(mensagem);

      if Length(mens.itens) > 0 then
      begin
        vStringListMens.Add('');
        vStringListMens.Add('Anexos:');
      end;

      for I := 0 to Length(mens.itens) - 1 do
        if trim(mens.itens[I].nome_arquivo) <> '' then
        begin
          vStringListMens.Add('');
          vStringListMens.Add(trim(mens.itens[I].nome_arquivo));
        end;

      vStringListBodyResp := TStringList.Create;
      vStringListBodyResp.Clear;
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(mens));
      vStringListBodyResp.Add('------');
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(res));

      Result := InserirMensagem(
        codusuario,
        codcarta,
        codaplicativo,
        codplataforma,
        mens.cod_user_plataforma,
        assunto,
        vStringListMens.Text,
        vStringListBodyResp.Text,
        mens.origem,
        mens.destino,
        res.uuid);
    finally
      if Assigned(vStringListMens) then
        FreeAndNil(vStringListMens);
      if Assigned(vStringListBodyResp) then
        FreeAndNil(vStringListBodyResp);
    end;

  except on E: Exception do
    begin
      Result := False;
      LogApp.Error('THwCloudRepo.CadMensagem - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.CadMensagem(
  codusuario: Integer;
  codcarta: Integer;
  codaplicativo: Integer;
  codplataforma: Integer;
  assunto: string;
  mensagem: string;
  mens: TCadMensageriaComTemplateSemAnexo;
  res: TMensageriaResponse): Boolean;
var
  vStringListMens: TStringList;
  vStringListBodyResp: TStringList;
begin
  Result := False;

  try
    try
      vStringListMens := TStringList.Create;
      vStringListMens.Clear;
//      vStringListMens.Add(mens.assunto_mensagem);
//      vStringListMens.Add(mens.mensagem);
      vStringListMens.Add(mensagem);

      vStringListBodyResp := TStringList.Create;
      vStringListBodyResp.Clear;
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(mens));
      vStringListBodyResp.Add('------');
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(res));

      Result := InserirMensagem(
        codusuario,
        codcarta,
        codaplicativo,
        codplataforma,
        mens.cod_user_plataforma,
        assunto,
        vStringListMens.Text,
        vStringListBodyResp.Text,
        mens.origem,
        mens.destino,
        res.uuid);
    finally
      if Assigned(vStringListMens) then
        FreeAndNil(vStringListMens);
      if Assigned(vStringListBodyResp) then
        FreeAndNil(vStringListBodyResp);
    end;

  except on E: Exception do
    begin
      Result := False;
      LogApp.Error('THwCloudRepo.CadMensagem - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.CadMensagem(
  codusuario: Integer;
  codcarta: Integer;
  codaplicativo: Integer;
  codplataforma: Integer;
  assunto: string;
  mens: TCadMensageriaSemTemplateComAnexo;
  res: TMensageriaResponse): Boolean;
var
  vStringListMens: TStringList;
  vStringListBodyResp: TStringList;
  I: Integer;
begin
  Result := False;

  try
    try
      vStringListMens := TStringList.Create;
      vStringListMens.Clear;
//      vStringListMens.Add(mens.assunto_mensagem);
      vStringListMens.Add(mens.mensagem);

      if Length(mens.itens) > 0 then
      begin
        vStringListMens.Add('');
        vStringListMens.Add('Anexos:');
      end;

      for I := 0 to Length(mens.itens) - 1 do
        if trim(mens.itens[I].nome_arquivo) <> '' then
        begin
          vStringListMens.Add('');
          vStringListMens.Add(trim(mens.itens[I].nome_arquivo));
        end;

      vStringListBodyResp := TStringList.Create;
      vStringListBodyResp.Clear;
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(mens));
      vStringListBodyResp.Add('------');
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(res));

      Result := InserirMensagem(
        codusuario,
        codcarta,
        codaplicativo,
        codplataforma,
        mens.cod_user_plataforma,
        assunto,
        vStringListMens.Text,
        vStringListBodyResp.Text,
        mens.origem,
        mens.destino,
        res.uuid);
    finally
      if Assigned(vStringListMens) then
        FreeAndNil(vStringListMens);
      if Assigned(vStringListBodyResp) then
        FreeAndNil(vStringListBodyResp);
    end;

  except on E: Exception do
    begin
      Result := False;
      LogApp.Error('THwCloudRepo.CadMensagem - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.BuscarConfig(configResponse: TConfigResponse): Boolean;
var
  vIdTipo: Integer;
  I: Integer;
begin
  Result := False;

  if not Assigned(configResponse) then
    Exit;

  if not Assigned(configResponse.resposta) then
    Exit;

  try
    var query := QueryHelper.CreateObj(QrAux);

    for var plataforma in configResponse.resposta.plataformas do
    begin
      if trim(plataforma.plataforma_parc_id) <> '' then
      begin
        query.Close;
        query.SQL(' select id, cod_empresa from msg_plataforma ' +
          ' where plataforma = :plataforma ' +
          ' and identificador_bot = :identificador_bot ' +
          ' and cod_empresa = :cod_empresa ');
        query.ParamValue('plataforma', trim(plataforma.plataforma_parc_id));
        query.ParamValue('identificador_bot', trim(plataforma.cod_plataforma_parc));
        query.ParamValue('cod_empresa', CodEmpresa);
        query.Open;

        if query.IsEmpty then
        begin
          query.Close;
          query.SQL(' insert into msg_plataforma ' +
            ' (id, cod_empresa, id_msg_aplicativo, plataforma, identificador_bot, padrao) ' +
            ' values ' +
            ' ((select cod from incrementa_codigo (:cod_empresa, ''MSG_PLATAFORMA'')),  ' +
            ' :cod_empresa, :id_msg_aplicativo, :plataforma, :identificador_bot, :padrao) ');
          query.ParamValue('cod_empresa', CodEmpresa);
          if ContainsStr(LowerCase(trim(plataforma.plataforma_parc_id)), 'email') or ContainsStr(LowerCase(trim(plataforma.plataforma_parc_id)), 'e-mail') then
            query.ParamValue('id_msg_aplicativo', 1)
          else if ContainsStr(LowerCase(trim(plataforma.plataforma_parc_id)), 'whats') then
            query.ParamValue('id_msg_aplicativo', 2)
          else if ContainsStr(LowerCase(trim(plataforma.plataforma_parc_id)), 'telegram') then
            query.ParamValue('id_msg_aplicativo', 3)
          else
            query.ParamValue('id_msg_aplicativo', 0);

          query.ParamValue('plataforma', trim(plataforma.plataforma_parc_id));
          query.ParamValue('identificador_bot', trim(plataforma.cod_plataforma_parc));
          query.ParamValue('padrao', IfThen(plataforma.plat_padrao, 0, 1));
          query.ExecSQL;
        end
        else
        begin
          query.Close;
          query.SQL(' update msg_plataforma set padrao = :padrao ' +
            ' where plataforma = :plataforma ' +
            ' and identificador_bot = :identificador_bot ' +
            ' and cod_empresa = :cod_empresa ');
          query.ParamValue('plataforma', trim(plataforma.plataforma_parc_id));
          query.ParamValue('identificador_bot', trim(plataforma.cod_plataforma_parc));
          query.ParamValue('cod_empresa', CodEmpresa);
          query.ParamValue('padrao', IfThen(plataforma.plat_padrao, 0, 1));
          query.ExecSQL;
        end;
      end;
    end;

    for var tipo in configResponse.resposta.tipo_templates_meta do
    begin
      if trim(tipo.categoria) <> '' then
      begin
        query.Close;
        query.SQL(' select id from msg_tipo_template ' +
          ' where categoria = :categoria ');
        query.ParamValue('categoria', trim(tipo.categoria));
        query.Open;

        if query.IsEmpty then
        begin
          query.Close;
          query.SQL(' insert into msg_tipo_template ' +
            ' (id, categoria, valor_aprox) ' +
            ' values ' +
            ' ((select cod from incrementa_codigo (0, ''MSG_TIPO_TEMPLATE'')),  ' +
            ' :categoria, :valor_aprox) ');
          query.ParamValue('categoria', trim(tipo.categoria));
          query.ParamAsFloat('valor_aprox', tipo.valor_aprox);
          query.ExecSQL;
        end
        else
        begin
          query.Close;
          query.SQL(' update msg_tipo_template set ' +
            ' valor_aprox = :valor_aprox ' +
            ' where categoria = :categoria ');
          query.ParamValue('categoria', trim(tipo.categoria));
          query.ParamAsFloat('valor_aprox', tipo.valor_aprox);
          query.ExecSQL;
        end;
      end;
    end;

    for var template in configResponse.resposta.templates_meta do
    begin
      if trim(template.categoria) <> '' then
      begin
        query.Close;
        query.SQL(' select id from msg_tipo_template ' +
          ' where categoria = :categoria ');
        query.ParamValue('categoria', template.categoria);
        query.Open;

        if not query.IsEmpty then
        begin
          vIdTipo := query.fint('id');

          if trim(template.nome_template) <> '' then
          begin
            query.Close;
            query.SQL(' select id, cod_empresa from msg_template ' +
              ' where template = :template ' +
              ' and cod_empresa = :cod_empresa ');
            query.ParamValue('template', trim(template.nome_template));
            query.ParamValue('cod_empresa', CodEmpresa);
            query.Open;

            if query.IsEmpty then
            begin
              query.Close;
              query.SQL(' insert into msg_template ' +
                ' (id, cod_empresa, id_msg_tipo_template, template, status, texto) ' +
                ' values ' +
                ' ((select cod from incrementa_codigo (:cod_empresa, ''MSG_TEMPLATE'')),  ' +
                ' :cod_empresa, :id_msg_tipo_template, :template, :status, :texto) ');
              query.ParamValue('cod_empresa', CodEmpresa);
              query.ParamValue('id_msg_tipo_template', vIdTipo);
              query.ParamValue('template', trim(template.nome_template));
              query.ParamValue('status', trim(template.conteudo_template.status));
              query.ParamValue('texto',template.texto_template);
              query.ExecSQL;
            end
            else
            begin
              query.Close;
              query.SQL(' update msg_template set ' +
                ' id_msg_tipo_template = :id_msg_tipo_template, ' +
                ' status = :status, ' +
                ' texto = :texto ' +
                ' where template = :template ' +
                ' and cod_empresa = :cod_empresa ');
              query.ParamValue('cod_empresa', CodEmpresa);
              query.ParamValue('id_msg_tipo_template', vIdTipo);
              query.ParamValue('template', trim(template.nome_template));
              query.ParamValue('status', trim(template.conteudo_template.status));
              query.ParamValue('texto', template.texto_template);
              query.ExecSQL;
            end;
          end;
        end;
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
      LogApp.Error('THwCloudRepo.BuscarConfig - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.CadMensagem(
  codusuario: Integer;
  codcarta: Integer;
  codaplicativo: Integer;
  codplataforma: Integer;
  assunto: string;
  mens: TCadMensageriaSemTemplateSemAnexo;
  res: TMensageriaResponse): Boolean;
var
  vStringListMens: TStringList;
  vStringListBodyResp: TStringList;
begin
  Result := False;

  try
    try
      vStringListMens := TStringList.Create;
      vStringListMens.Clear;
//      vStringListMens.Add(mens.assunto_mensagem);
      vStringListMens.Add(mens.mensagem);

      vStringListBodyResp := TStringList.Create;
      vStringListBodyResp.Clear;
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(mens));
      vStringListBodyResp.Add('------');
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(res));

      Result := InserirMensagem(
        codusuario,
        codcarta,
        codaplicativo,
        codplataforma,
        mens.cod_user_plataforma,
        assunto,
        vStringListMens.Text,
        vStringListBodyResp.Text,
        mens.origem,
        mens.destino,
        res.uuid);
    finally
      if Assigned(vStringListMens) then
        FreeAndNil(vStringListMens);
      if Assigned(vStringListBodyResp) then
        FreeAndNil(vStringListBodyResp);
    end;

  except on E: Exception do
    begin
      Result := False;
      LogApp.Error('THwCloudRepo.CadMensagem - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.InserirMensagem(
  codusuario: Integer;
  codcarta: Integer;
  codaplicativo: Integer;
  codplataforma: Integer;
  identificacao: string;
  assunto: string;
  mensagem: string;
  documento: string;
  origem: string;
  destino: string;
  uuid: string): Boolean;
var
  codigo, codmens: Integer;
begin
  try
    Result := False;

    var query := QueryHelper.CreateObj(QrAux);

    query.Open(' select cod from incrementa_codigo(' + IntToStr(CodEmpresa) + ', ''MENSAGEM_MOB'') ');
    codigo := query.fint('cod');

    query.Open(' select first 1 mensagem_mob.idseqm from mensagem_mob ' +
      ' where mensagem_mob.cod_empresa = ' + IntToStr(CodEmpresa) +
      ' order by mensagem_mob.idseqm desc ');
    codmens := query.fint('idseqm') + 1;

    if (codmens > codigo) then
      codigo := codmens;

    query.Close;
    query.SQL(' insert into mensagem_mob ' +
      ' (idseqm, idmobile, cod_empresa, ' +
      ' tipo, natureza_mens, ' +
      ' data_envio, hora_envio, assunto, html, ' +
      ' ativo, cod_us_leu, us_envio, us_dest, orig_mens, ' +
      ' status_env, obs_env, origem, destino, uuid, ' +
      ' cod_carta, id_msg_aplicativo, id_msg_plataforma) ' +
      ' values (:idseqm, :idmobile, :cod_empresa, ' +
      ' :tipo, :natureza_mens, ' +
      ' current_date, substring(current_time from 1 for 5), :assunto, :html, ' +
      ' :ativo, :cod_us_leu, :us_envio, :us_dest, :orig_mens, ' +
      ' :status_env, :obs_env, :origem, :destino, :uuid, ' +
      ' :cod_carta, :id_msg_aplicativo, :id_msg_plataforma); ');
    query.ParamValue('idseqm', codigo);
    query.ParamValue('idmobile', 0);
    query.ParamValue('cod_empresa', CodEmpresa);
    query.ParamValue('tipo', 'E');
    query.ParamValue('natureza_mens', 'A');
    query.ParamValue('assunto', assunto);
    query.ParamValue('html', mensagem);
    query.ParamValue('ativo', 1);
    query.ParamValue('orig_mens', 'A');
    query.ParamValue('status_env', 'NO');

    if trim(origem) <> '' then
      query.ParamValue('origem', origem);

    if trim(destino) <> '' then
      query.ParamValue('destino', destino);

    query.ParamValue('uuid', uuid);
    query.ParamValue('cod_us_leu', codusuario);
    query.ParamValue('us_envio', codusuario);
    query.ParamValue('us_dest', Copy(trim(identificacao), 1, 60));
    query.ParamValue('cod_carta', codcarta);
    query.ParamValue('id_msg_aplicativo', codaplicativo);
    query.ParamValue('id_msg_plataforma', codplataforma);
    query.ExecSQL;

    query.Close;
    query.SQL(' insert into doc_eletronico ' +
      ' (cod_empresa, id_doc, doc, data) ' +
      ' values (:cod_empresa, :id_doc, :doc, current_date); ');
    query.ParamValue('cod_empresa', CodEmpresa);
    query.ParamValue('id_doc', 'HWC_MENS_P_' + IntToStr(codigo));
    query.ParamValue('doc', documento);
    query.ExecSQL;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('THwCloudRepo.InserirMensagem - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.LerMensagem(
  codigo: Integer;
  mens: TLerMensageria;
  res: TLerMensageriaResponse): Boolean;
var
  vStringListBodyResp: TStringList;
begin
  Result := False;

  try
    try
      vStringListBodyResp := TStringList.Create;
      vStringListBodyResp.Clear;
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(mens));
      vStringListBodyResp.Add('------');
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(res));

      Result := GetMensagem(codigo, res.resposta[0].status, res.resposta[0].obs_envio, vStringListBodyResp.Text);
    finally
      if Assigned(vStringListBodyResp) then
        FreeAndNil(vStringListBodyResp);
    end;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('THwCloudRepo.LerMensagem - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.RetornaNomeAplicativo(pId: Integer): string;
begin
  try
    var query := QueryHelper.CreateObj(QrAux);

    query.Close;
    query.SQL(' select aplicativo from msg_aplicativo ' +
      ' where id = ' + IntToStr(pId));
    query.Open;

    Result := query.fstr('aplicativo');
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := '';
      LogApp.Error('THwCloudRepo.RetornaNomeAplicativo - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.SincHwCloudEmpresa: Boolean;
begin
  try
    var query := QueryHelper.CreateObj(QrAux);

    query.Close;
    query.SQL(' update empresa set sinc_hwcloud = ''S'' ' +
      ' where cod_empresa = :cod_empresa ');
    query.ParamValue('cod_empresa', CodEmpresa);
    query.ExecSQL;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('THwCloudRepo.SincHwCloudEmpresa - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.SincHwCloudPessoa(codcliente: Integer; tipocliente: string): Boolean;
begin
  try
    var query := QueryHelper.CreateObj(QrAux);

    if trim(tipocliente) = 'CI' then
    begin
      query.Close;
      query.SQL(' update colaborador set sinc_hwcloud = ''S'' ' +
        ' where cod_vendedor = :cod_vendedor ' +
        ' and cod_empresa = :cod_empresa ');
      query.ParamValue('cod_vendedor', codcliente);
      query.ParamValue('cod_empresa', CodEmpresa);
      query.ExecSQL;
    end
    else
    begin
      query.Close;
      query.SQL(' update clientes set sinc_hwcloud = ''S'' ' +
        ' where cod_cliente = :cod_cliente ' +
        ' and cod_empresa = :cod_empresa ');
      query.ParamValue('cod_cliente', codcliente);
      query.ParamValue('cod_empresa', CodEmpresa);
      query.ExecSQL;
    end;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('THwCloudRepo.SincHwCloudPessoa - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.SincHwCloudContato(id: Integer): Boolean;
begin
  try
    var query := QueryHelper.CreateObj(QrAux);

    query.Close;
    query.SQL(' update msg_contato set sinc_hwcloud = ''S'' ' +
      ' where id = :id ' +
      ' and cod_empresa = :cod_empresa ');
    query.ParamValue('id', id);
    query.ParamValue('cod_empresa', CodEmpresa);
    query.ExecSQL;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('THwCloudRepo.SincHwCloudPessoa - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.UpdateMensagem(
  codigo: Integer;
  mens: TUpdateMensageria;
  res: TMensageriaResponse): Boolean;
var
  vStringListBodyResp: TStringList;
begin
  Result := False;

  try
    try
      vStringListBodyResp := TStringList.Create;
      vStringListBodyResp.Clear;
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(mens));
      vStringListBodyResp.Add('------');
      vStringListBodyResp.Add(TJsonUtilsDX.Serialize(res));

      var query := QueryHelper.CreateObj(QrAux);

      query.Close;
      query.SQL(' insert into doc_eletronico ' +
        ' (cod_empresa, id_doc, doc, data) ' +
        ' values (:cod_empresa, :id_doc, :doc, current_date); ');
      query.ParamValue('cod_empresa', CodEmpresa);
      query.ParamValue('id_doc', 'HWC_MENS_U_' + IntToStr(codigo));
      query.ParamValue('doc', vStringListBodyResp.Text);
      query.ExecSQL;

      if Transacao.InTransaction then
        Transacao.Commit;

      Result := True;
    finally
      if Assigned(vStringListBodyResp) then
        FreeAndNil(vStringListBodyResp);
    end;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('THwCloudRepo.UpdateMensagem - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.VerificarModeloNotificacao(
  codcarta: Integer;
  out assunto: string;
  out mensagem: string;
  out template: string): Boolean;
begin
  try
    Result := False;

    assunto := '';
    mensagem := '';
    template := '';

    var query := QueryHelper.CreateObj(QrAux);

    query.Close;
    query.SQL(' select * from modcartas ' +
      ' where cod_carta = :cod_carta ' +
      ' and cod_empresa = :cod_empresa ' +
      ' and ativo = 1 ');
    query.ParamValue('cod_carta', codcarta);
    query.ParamValue('cod_empresa', CodEmpresa);
    query.Open;

    if not query.IsEmpty then
    begin
      assunto := query.fstr('descricao').Trim();
      mensagem := query.fstr('dados_carta').Trim();
      template := query.fstr('template').Trim();
    end;

    Result := True;
  except on E: Exception do
    begin
      Result := False;
      LogApp.Error('THwCloudRepo.VerificarModeloNotificacao - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetMensagem(
  codigo: Integer;
  statusenv: string;
  obsenv: string;
  documento: string): Boolean;
begin
  try
    Result := False;

    var query := QueryHelper.CreateObj(QrAux);

    query.Close;
    query.SQL(' update mensagem_mob set ' +
      ' status_env = :status_env, obs_env = :obs_env ' +
      ' where idseqm = :idseqm and cod_empresa = :cod_empresa; ');
    query.ParamValue('idseqm', codigo);
    query.ParamValue('cod_empresa', CodEmpresa);
    query.ParamValue('status_env', statusenv);
    query.ParamValue('obs_env', obsenv);
    query.ExecSQL;

    query.Close;
    query.SQL(' insert into doc_eletronico ' +
      ' (cod_empresa, id_doc, doc, data) ' +
      ' values (:cod_empresa, :id_doc, :doc, current_date); ');
    query.ParamValue('cod_empresa', CodEmpresa);
    query.ParamValue('id_doc', 'HWC_MENS_G_' + IntToStr(codigo));
    query.ParamValue('doc', documento);
    query.ExecSQL;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('THwCloudRepo.UpdateMensagem - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.GetTipoContato(codtipocontato: Integer): Boolean;
begin
  try
    var query := QueryHelper.CreateObj(QrAux);

    query.Close;
    query.SQL(' select id from tipo_contato ' +
      ' where id = :id ' +
      ' and cod_empresa = :cod_empresa ');
    query.ParamValue('id', codtipocontato);
    query.ParamValue('cod_empresa', CodEmpresa);
    query.Open;

    Result := query.fint('id') > 0;

  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('THwCloudRepo.ApagarContato - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function THwCloudRepo.ApagarContato(
  id: Integer): Boolean;
begin
  Result := False;

  try
    var query := QueryHelper.CreateObj(QrAux);

    query.Close;
    query.SQL(' delete from msg_contato ' +
      ' where id = :id ' +
      ' and cod_empresa = :cod_empresa ');
    query.ParamValue('id', id);
    query.ParamValue('cod_empresa', CodEmpresa);
    query.ExecSQL;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('THwCloudRepo.ApagarContato - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

end.
