unit SuzukiRepo;

interface

uses
  Data.DB,
  uClasseConexao,
  HW.Servicos,
  Vcl.Dialogs,
  BaseSingleton,
  ConfigApiModel,
  Classes;

const
  SUZUKI_URL_API_AUTH_PROD = 'https://conexao.jtoledo.com.br/Portalv3.Auth';
  SUZUKI_URL_API_AUTH_HOM  = 'https://auth.hml.autoware.com.br';

  SUZUKI_URL_API_PROD = 'https://conexao.jtoledo.com.br/Portalv3.Api';
  SUZUKI_URL_API_HOM  = 'https://portalv3.jtoledo.hml.autoware.com.br/Portalv3.Api';

  CLIENTE = 'JTOLEDO';
  CONF_API = 'SUZUKI';

type

  TSuzukiRepo = class;

  TSuzukiRepo = class(THwServicos)
  strict private
  private
    dataSetNotas: TConexao_OOP;
  public
    function GetConfigApi(apiName: string): TConfigApiModel;
    function AtualizarAcessToken(pAcessToken: string): Boolean;
    function AtualizarProtocoloNF(pCodNF: Integer; pSituacaoNF: string; pIdProcesso: Integer; pIdProtocolo: Integer): Boolean;
    function GetNotasFiscais(cod_nfs: array of Integer; codmarcas: string): TConexao_OOP; overload;
  end;

  TSuzukiRepoSingleton = TSingleton<TSuzukiRepo>;

  Conexao_OOP = TConexao_OOP;

var
  repo: TSuzukiRepo;

implementation

{ TSuzukiRepo }

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  hw_utils,
  hw_win_utils,
  Query_OOP,
  EncdDecd,
  config_sistema_class;

function TSuzukiRepo.AtualizarAcessToken(pAcessToken: string): Boolean;
begin
  try
    Result := False;

    SqlExec(' update config_api set' +
            ' acess_token = %s' +
            ' where cod_empresa = %d ' +
            ' and api = %s ',
            [pAcessToken.QuotedString(),
             CodEmpresa,
             'SUZUKI'.QuotedString]);

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TSuzukiRepo.AtualizarAcessToken - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TSuzukiRepo.AtualizarProtocoloNF(
  pCodNF: Integer;
  pSituacaoNF: string;
  pIdProcesso: Integer;
  pIdProtocolo: Integer): Boolean;
begin
  try
    Result := False;

    if (pIdProcesso > 0) and (pIdProtocolo > 0) then
    begin
      SqlExec(' update or insert into notafiscal_protocolo ' +
              ' (cod_nf, cod_empresa, situacao_nfe, id_protocolo, id_processo) ' +
              ' values (%d, %d, %s, %d, %d) ' +
              ' matching (cod_nf, cod_empresa) ',
              [pCodNF,
               CodEmpresa,
               pSituacaoNF.QuotedString,
               pIdProtocolo,
               pIdProcesso]);
    end
    else
    begin
      SqlExec(' update or insert into notafiscal_protocolo ' +
              ' (cod_nf, cod_empresa, situacao_nfe, id_protocolo) ' +
              ' values (%d, %d, %s, %d) ' +
              ' matching (cod_nf, cod_empresa) ',
              [pCodNF,
               CodEmpresa,
               pSituacaoNF.QuotedString,
               pIdProtocolo]);
    end;

    if Transacao.InTransaction then
      Transacao.Commit;

    Result := True;
  except on E: Exception do
    begin
      if Transacao.InTransaction then
        Transacao.Rollback;
      Result := False;
      LogApp.Error('TSuzukiRepo.AtualizarAcessToken - %s', [E.Message]);
      raise Exception.Create(e.Message);
    end;
  end;
end;

function TSuzukiRepo.GetConfigApi(apiName: string): TConfigApiModel;
begin
  Result := TConfigApiModel.Create;
  var query := QueryHelper.CreateObj(QrAux)
    .Open(' select cod_empresa, api, url_api, token_api, senha, acess_token, user_id, ' +
          ' iif(user_id = hash(rdb$get_context(''SYSTEM'', ''DB_NAME'')), ''P'', ''H'') p_h' +
          ' from config_api' +
          ' where cod_empresa = %d ' +
          ' and api = %s',
          [CodEmpresa,
           apiName.QuotedString()]);

  Result.empresaId := query.fint('cod_empresa');
  Result.api := query.fstr('api');
  Result.URL := query.fstr('url_api');
  Result.usuario := query.fstr('token_api');
  Result.senha := Decodifica(query.fstr('senha'));
  Result.acess_token := query.fstr('acess_token');
  Result.producao := (query.fequals('p_h', 'P'));
end;

function TSuzukiRepo.GetNotasFiscais(cod_nfs: array of Integer; codmarcas: string): TConexao_OOP;
var
  I: Integer;
begin
  if not Assigned(dataSetNotas) then
    dataSetNotas := NewClientOOP('');//TConexao_OOP.Create(Self);

  Result := dataSetNotas;

  var codnfIn := '';
  for I := Low(cod_nfs) to High(cod_nfs) do
    codnfIn := codnfIn + IfThen(I > Low(cod_nfs), ',') + cod_nfs[I].ToString();

  Result.Open(' select nf.cod_nf, nf.cod_empresa, nf.data_lanc, nf.num_nf, nf.serie, nf.modelo_nf, ' +
              ' nf.tipo_nf, nf.natureza_nf, nf.status, nf.situacao_nfe, ' +
              ' nfi.chassi, nf.xml_nfe, nfp.id_protocolo, nfp.id_processo from notafiscal nf ' +
              ' inner join notafiscal_item nfi on ' +
              '     nfi.cod_nf = nf.cod_nf ' +
              '     and nfi.cod_empresa = nf.cod_empresa ' +
              ' inner join notafiscal_item_veiculo nfv on ' +
              '     nfv.cod_nf = nfi.cod_nf ' +
              '     and nfv.cod_empresa = nfi.cod_empresa ' +
              '     and nfv.chassi = nfi.chassi ' +
              ' left join notafiscal_protocolo nfp on ' +
              '     nfp.cod_nf = nf.cod_nf ' +
              '     and nfp.cod_empresa = nf.cod_empresa ' +
              '     and nfp.situacao_nfe = nf.situacao_nfe ' +
              ' where nf.cod_empresa = %d ' +
              ' and nf.cod_nf in (%s) ' +
              ' and nf.tipo_nf = ''V''  ' +
              ' and nf.emissao_propria = ''S'' ' +
              ' and nf.situacao_nfe = ''Autorizada'' ' +
              ' and nfv.cod_marca in (%s) ' +
              ' union all ' +
              ' select nf.cod_nf, nf.cod_empresa, nf.data_lanc, nf.num_nf, nf.serie, nf.modelo_nf, ' +
              ' nf.tipo_nf, nf.natureza_nf, nf.status, nf.situacao_nfe, ' +
              ' nfi.chassi, car.xml_evento, nfp.id_protocolo, nfp.id_processo from notafiscal nf ' +
              ' inner join notafiscal_carta_correcao car on ' +
              '     car.cod_nf = nf.cod_nf ' +
              '     and car.cod_empresa = nf.cod_empresa ' +
              '     and car.tipo_evento = ''CAN'' ' +
              ' inner join notafiscal_item nfi on ' +
              '     nfi.cod_nf = nf.cod_nf ' +
              '     and nfi.cod_empresa = nf.cod_empresa ' +
              ' inner join notafiscal_item_veiculo nfv on ' +
              '     nfv.cod_nf = nfi.cod_nf ' +
              '     and nfv.cod_empresa = nfi.cod_empresa ' +
              '     and nfv.chassi = nfi.chassi ' +
              ' left join notafiscal_protocolo nfp on ' +
              '     nfp.cod_nf = nf.cod_nf ' +
              '     and nfp.cod_empresa = nf.cod_empresa ' +
              '     and nfp.situacao_nfe = nf.situacao_nfe ' +
              ' where nf.cod_empresa = %d ' +
              ' and nf.cod_nf in (%s) ' +
              ' and nf.tipo_nf = ''V''  ' +
              ' and nf.emissao_propria = ''S'' ' +
              ' and nf.situacao_nfe = ''Cancelada'' ' +
              ' and nfv.cod_marca in (%s) ',
              [CodEmpresa,
               codnfIn,
               codmarcas,
               CodEmpresa,
               codnfIn,
               codmarcas]);
end;

end.
