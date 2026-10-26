unit BoletoResponseModels;

interface

uses
  System.Classes,
  System.Generics.Collections,
  PlugBoletoModels;

type



  /// <summary>
  ///   Erro ao nível da requisição, status code 400 em diante
  /// </summary>
  TErrosResponseValidacao = class(TPersistent)
  private
    F_campo: string;
    F_erro: string;
  published
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
  end;

  TResponse401 = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TArray<TErrosResponseValidacao>;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TArray<TErrosResponseValidacao> read F_dados write F_dados;

    function ErrosToString: string;
  end;

  /// <summary>
  ///   Erro de aceitacao do boleto, a requisição foi bem sucedida 200, porém o boleto não foi acesso por algum motivo
  /// </summary>
  TErrosResponse = class(TPersistent)
  private
    Fboleto: string;
    FSacadoEmail: string;
    FTituloValor: string;
  published
    property boleto: string read Fboleto write Fboleto;
    property SacadoEmail: string read FSacadoEmail write FSacadoEmail;
    property TituloValor: string read FTituloValor write FTituloValor;
  end;

  TPostBoletoResponseDadosFalhaErro  = class(TPersistent)
  private
    FerroValidacao: Boolean;
    Ferros: TDictionary<string, string>;
  published
    property erroValidacao: Boolean read FerroValidacao write FerroValidacao;
    property erros: TDictionary<string, string> read Ferros write Ferros;
  end;

  TPostRemessaResponseDadosFalhaErro  = class(TPersistent)
  private
    FerroValidacao: Boolean;
    Ferros: TDictionary<string, string>;
  published
    property erroValidacao: Boolean read FerroValidacao write FerroValidacao;
    property erros: TDictionary<string, string> read Ferros write Ferros;
  end;

  TPostDescartarResponseDadosFalhaErro  = class(TPersistent)
  private
    FerroValidacao: Boolean;
    Ferros: TDictionary<string, string>;
  published
    property erroValidacao: Boolean read FerroValidacao write FerroValidacao;
    property erros: TDictionary<string, string> read Ferros write Ferros;
  end;

  TPostBoletoResponseDadosFalha = class(TPersistent)
  private
    F_status_http: Integer;
    F_erro: TPostBoletoResponseDadosFalhaErro;
    F_dados: TBoletoIntegrado;
  published
    property _status_http: Integer read F_status_http write F_status_http;
    property _erro: TPostBoletoResponseDadosFalhaErro read F_erro write F_erro;
    property _dados: TBoletoIntegrado read F_dados write F_dados;
  end;

  TPostRemessaResponseDadosFalha = class(TPersistent)
  private
    Fidintegracao: string;
    F_erro: string;
    F_status_http: Integer;
  published
    property idintegracao: string read Fidintegracao write Fidintegracao;
    property _erro: string read F_erro write F_erro;
    property _status_http: Integer read F_status_http write F_status_http;
  end;

  TPostDescartarResponseDadosFalha = class(TPersistent)
  private
    Fidintegracao: string;
    F_erro: string;
    F_status_http: Integer;
  published
    property idintegracao: string read Fidintegracao write Fidintegracao;
    property _erro: string read F_erro write F_erro;
    property _status_http: Integer read F_status_http write F_status_http;
  end;

  TPostBoletoResponseDados = class(TPersistent)
  private
    F_sucesso: TArray<TBoletoIntegrado>;
    F_falha: TArray<TPostBoletoResponseDadosFalha>;
  published
    property _sucesso: TArray<TBoletoIntegrado> read F_sucesso write F_sucesso;
    property _falha: TArray<TPostBoletoResponseDadosFalha> read F_falha write F_falha;

    function ErrosToString(): string;
  end;

  TPostRemessaResponseDados = class(TPersistent)
  private
    F_sucesso: TArray<TRemessaIntegrado>;
    F_falha: TArray<TPostRemessaResponseDadosFalha>;
  published
    property _sucesso: TArray<TRemessaIntegrado> read F_sucesso write F_sucesso;
    property _falha: TArray<TPostRemessaResponseDadosFalha> read F_falha write F_falha;

    function ErrosToString(): string;
  end;

  TPostDescartarResponseDados = class(TPersistent)
  private
    F_sucesso: TArray<TDescartarIntegrado>;
    F_falha: TArray<TPostDescartarResponseDadosFalha>;
  published
    property _sucesso: TArray<TDescartarIntegrado> read F_sucesso write F_sucesso;
    property _falha: TArray<TPostDescartarResponseDadosFalha> read F_falha write F_falha;

    function ErrosToString(): string;
  end;

  TPostUploadRetornoResponseDados = class(TPersistent)
  private
    Fsituacao: string;
    Fprotocolo: string;
    F_campo: string;
    F_erro: string;
  published
    property situacao: string read Fsituacao write Fsituacao;
    property protocolo: string read Fprotocolo write Fprotocolo;
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;

    function ErrosToString(): string;
  end;

  TCedenteResponseDados = class(TPersistent)
  private
    Fid: integer;
    Frazaosocial: string;
    Fnomefantasia: string;
    Fcpf_cnpj: string;
    Flogradouro: string;
    Fnumero: string;
    Fcomplemento: string;
    Fbairro: string;
    Fcep: string;
    Fid_cidade: Integer;
    Ftelefone: string;
    Femail: string;
    Fcriado: string;
    Fatualizado: string;
    Ftoken_cedente: string;
    Ftoken_esales: Integer;
    Fsituacao: string;
    Fid_software_house: Integer;
    Fdata_ativacao: string;
    Fuf: string;
    Fcidadeibge: Integer;
    Fcidade: string;
    Fprotocolo: string;
    F_campo: string;
    F_erro: string;
    F_mensagem: string;
  published
    property id: Integer read Fid write Fid;
    property razaosocial: string read Frazaosocial write Frazaosocial;
    property nomefantasia: string read Fnomefantasia write Fnomefantasia;
    property cpf_cnpj: string read Fcpf_cnpj write Fcpf_cnpj;
    property logradouro: string read Flogradouro write Flogradouro;
    property numero: string read Fnumero write Fnumero;
    property complemento: string read Fcomplemento write Fcomplemento;
    property bairro: string read Fbairro write Fbairro;
    property cep: string read Fcep write Fcep;
    property id_cidade: Integer read Fid_cidade write Fid_cidade;
    property telefone: string read Ftelefone write Ftelefone;
    property email: string read Femail write Femail;
    property criado: string read Fcriado write Fcriado;
    property atualizado: string read Fatualizado write Fatualizado;
    property token_cedente: string read Ftoken_cedente write Ftoken_cedente;
    property token_esales: Integer read Ftoken_esales write Ftoken_esales;
    property situacao: string read Fsituacao write Fsituacao;
    property id_software_house: Integer read Fid_software_house write Fid_software_house;
    property data_ativacao: string read Fdata_ativacao write Fdata_ativacao;
    property uf: string read Fuf write Fuf;
    property cidadeibge: Integer read Fcidadeibge write Fcidadeibge;
    property cidade: string read Fcidade write Fcidade;
    property protocolo: string read Fprotocolo write Fprotocolo;
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
    property _mensagem: string read F_mensagem write F_mensagem;
  end;

  TContaResponseDados = class(TPersistent)
  private
    Fid: Integer;
    Fcodigo_banco: string;
    Fagencia: Integer;
    Fagencia_dv: string;
    Fconta: string;
    Fconta_dv: string;
    Ftipo_conta: string;
    Fcod_beneficiario: string;
    Fid_cedente: Integer;
    Fcriado: string;
    Fatualizado: string;
    F_campo: string;
    F_erro: string;
    F_mensagem: string;
  published
    property id: Integer read Fid write Fid;
    property codigo_banco: string read Fcodigo_banco write Fcodigo_banco;
    property agencia: Integer read Fagencia write Fagencia;
    property agencia_dv: string read Fagencia_dv write Fagencia_dv;
    property conta: string read Fconta write Fconta;
    property conta_dv: string read Fconta_dv write Fconta_dv;
    property tipo_conta: string read Ftipo_conta write Ftipo_conta;
    property cod_beneficiario: string read Fcod_beneficiario write Fcod_beneficiario;
    property id_cedente: Integer read Fid_cedente write Fid_cedente;
    property criado: string read Fcriado write Fcriado;
    property atualizado: string read Fatualizado write Fatualizado;
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
    property _mensagem: string read F_mensagem write F_mensagem;
  end;

  TConvenioResponseDados = class(TPersistent)
  private
    Fid: Integer;
    Fnumero_convenio: string;
    Fdescricao_convenio: string;
    Fcarteira: string;
    Fespecie: string;
    Fid_conta: Integer;
    Fcriado: string;
    Fatualizado: string;
    FpadraoCNAB: string;
    Futiliza_van: boolean;
    Fnumero_remessa: Integer;
    F_campo: string;
    F_erro: string;
    F_mensagem: string;
  published
    property id: Integer read Fid write Fid;
    property numero_convenio: string read Fnumero_convenio write Fnumero_convenio;
    property descricao_convenio: string read Fdescricao_convenio write Fdescricao_convenio;
    property carteira: string read Fcarteira write Fcarteira;
    property especie: string read Fespecie write Fespecie;
    property id_conta: Integer read Fid_conta write Fid_conta;
    property criado: string read Fcriado write Fcriado;
    property atualizado: string read Fatualizado write Fatualizado;
    property padraoCNAB: string read FpadraoCNAB write FpadraoCNAB;
    property utiliza_van: boolean read Futiliza_van write Futiliza_van;
    property numero_remessa: Integer read Fnumero_remessa write Fnumero_remessa;
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
    property _mensagem: string read F_mensagem write F_mensagem;
  end;

  /// <summary>
  ///   Retorno quando requisição bem sucedida, status code 200
  /// </summary>
  TPostBoletoResponseSucesso = class(TPersistent)
  private
    F_status: string;
    F_dados: TPostBoletoResponseDados;
  published
    property _status: string read F_status write F_status;
    property _dados: TPostBoletoResponseDados read F_dados write F_dados;

    class function ToObject(json: string): TPostBoletoResponseSucesso;
  end;

  TPostRemessaResponseSucesso = class(TPersistent)
  private
    F_status: string;
    F_dados: TPostRemessaResponseDados;
  published
    property _status: string read F_status write F_status;
    property _dados: TPostRemessaResponseDados read F_dados write F_dados;

    class function ToObject(json: string): TPostRemessaResponseSucesso;
  end;

  TPostUploadRetornoResponseSucesso = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TPostUploadRetornoResponseDados;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TPostUploadRetornoResponseDados read F_dados write F_dados;

    class function ToObject(json: string): TPostUploadRetornoResponseSucesso;
  end;

  TCedenteResponseSucesso = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TCedenteResponseDados;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TCedenteResponseDados read F_dados write F_dados;

    class function ToObject(json: string): TCedenteResponseSucesso;
  end;

  TContaResponseSucesso = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TContaResponseDados;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TContaResponseDados read F_dados write F_dados;

    class function ToObject(json: string): TContaResponseSucesso;
  end;

  TConvenioResponseSucesso = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TConvenioResponseDados;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TConvenioResponseDados read F_dados write F_dados;

    class function ToObject(json: string): TConvenioResponseSucesso;
  end;

  TPostDescartarResponseSucesso = class(TPersistent)
  private
    F_status: string;
    F_dados: TPostDescartarResponseDados;
  published
    property _status: string read F_status write F_status;
    property _dados: TPostDescartarResponseDados read F_dados write F_dados;

    class function ToObject(json: string): TPostDescartarResponseSucesso;
  end;

  TPostBoletoResponseErroFalha = class(TBoletoResumo)
  private
    F_erros: TArray<TErrosResponseValidacao>;
  published
    property _erros: TArray<TErrosResponseValidacao> read F_erros write F_erros;
  end;

  TPostRemessaResponseErroFalha = class(TDescartarResumo)
  private
    F_erros: TArray<TErrosResponseValidacao>;
  published
    property _erros: TArray<TErrosResponseValidacao> read F_erros write F_erros;
  end;

  TPostDescartarResponseErroFalha = class(TRemessaResumo)
  private
    F_erros: TArray<TErrosResponseValidacao>;
  published
    property _erros: TArray<TErrosResponseValidacao> read F_erros write F_erros;
  end;

  TPostBoletoResponseErroDados = class(TPersistent)
  private
    F_falha: TArray<TPostBoletoResponseErroFalha>;
  published
    property _falha: TArray<TPostBoletoResponseErroFalha> read F_falha write F_falha;
  end;

  TPostRemessaResponseErroDados = class(TPersistent)
  private
    F_falha: TArray<TPostRemessaResponseErroFalha>;
  published
    property _falha: TArray<TPostRemessaResponseErroFalha> read F_falha write F_falha;
  end;

  TPostDescartarResponseErroDados = class(TPersistent)
  private
    F_falha: TArray<TPostDescartarResponseErroFalha>;
  published
    property _falha: TArray<TPostDescartarResponseErroFalha> read F_falha write F_falha;
  end;

  TCedenteResponseErroDados = class(TPersistent)
  private
    F_status: string;
    F_campo: string;
    F_erro: string;
    F_mensagem: string;
  published
    property _status: string read F_status write F_status;
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
    property _mensagem: string read F_mensagem write F_mensagem;
  end;

  TContaResponseErroDados = class(TPersistent)
  private
    F_status: string;
    F_campo: string;
    F_erro: string;
    F_mensagem: string;
  published
    property _status: string read F_status write F_status;
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
    property _mensagem: string read F_mensagem write F_mensagem;
  end;

  TPostUploadRetornoResponseErroDados = class(TPersistent)
  private
    F_status: string;
    F_campo: string;
    F_erro: string;
    F_mensagem: string;
  published
    property _status: string read F_status write F_status;
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
    property _mensagem: string read F_mensagem write F_mensagem;
  end;

  TConvenioResponseErroDados = class(TPersistent)
  private
    F_status: string;
    F_campo: string;
    F_erro: string;
    F_mensagem: string;
  published
    property _status: string read F_status write F_status;
    property _campo: string read F_campo write F_campo;
    property _erro: string read F_erro write F_erro;
    property _mensagem: string read F_mensagem write F_mensagem;
  end;

  /// <summary>
  ///   Retorno quando requisição falhou, status code 400...
  /// </summary>
  TPostBoletoResponseErro = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TPostBoletoResponseErroDados;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TPostBoletoResponseErroDados read F_dados write F_dados;

    function ErrosToString: string;
  end;

  TPostRemessaResponseErro = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TPostRemessaResponseErroDados;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TPostRemessaResponseErroDados read F_dados write F_dados;

    function ErrosToString: string;
  end;

  TPostDescartarResponseErro = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TPostDescartarResponseErroDados;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TPostDescartarResponseErroDados read F_dados write F_dados;

    function ErrosToString: string;
  end;

  TCedenteResponseErro = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TArray<TCedenteResponseErroDados>;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TArray<TCedenteResponseErroDados> read F_dados write F_dados;

    class function ToObject(json: string): TCedenteResponseErro;
  end;

  TContaResponseErro = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TArray<TContaResponseErroDados>;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TArray<TContaResponseErroDados> read F_dados write F_dados;

    class function ToObject(json: string): TContaResponseErro;
  end;

  TConvenioResponseErro = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TArray<TConvenioResponseErroDados>;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TArray<TConvenioResponseErroDados> read F_dados write F_dados;

    class function ToObject(json: string): TConvenioResponseErro;
  end;

  TPostBoletoResponse = class(TPersistent)
  private
    Fsucesso: TPostBoletoResponseSucesso;
    Ferro: TPostBoletoResponseErro;
  published
    property sucesso: TPostBoletoResponseSucesso read Fsucesso write Fsucesso;
    property erro: TPostBoletoResponseErro read Ferro write Ferro;
  end;

  TPostRemessaResponse = class(TPersistent)
  private
    Fsucesso: TPostRemessaResponseSucesso;
    Ferro: TPostRemessaResponseErro;
  published
    property sucesso: TPostRemessaResponseSucesso read Fsucesso write Fsucesso;
    property erro: TPostRemessaResponseErro read Ferro write Ferro;
  end;

  TPostDescartarResponse = class(TPersistent)
  private
    Fsucesso: TPostDescartarResponseSucesso;
    Ferro: TPostDescartarResponseErro;
  published
    property sucesso: TPostDescartarResponseSucesso read Fsucesso write Fsucesso;
    property erro: TPostDescartarResponseErro read Ferro write Ferro;
  end;

  TPostUploadRetornoResponseErro = class(TPersistent)
  private
    F_status: string;
    F_mensagem: string;
    F_dados: TArray<TPostUploadRetornoResponseErroDados>;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TArray<TPostUploadRetornoResponseErroDados> read F_dados write F_dados;

    class function ToObject(json: string): TPostUploadRetornoResponseErro;
  end;

  TPostUploadRetornoResponse = class(TPersistent)
  private
    Fsucesso: TPostUploadRetornoResponseSucesso;
    Ferro: TPostUploadRetornoResponseErro;
  published
    property sucesso: TPostUploadRetornoResponseSucesso read Fsucesso write Fsucesso;
    property erro: TPostUploadRetornoResponseErro read Ferro write Ferro;
  end;

  TCedenteResponse = class(TPersistent)
  private
    Fsucesso: TCedenteResponseSucesso;
    Ferro: TCedenteResponseErro;
  published
    property sucesso: TCedenteResponseSucesso read Fsucesso write Fsucesso;
    property erro: TCedenteResponseErro read Ferro write Ferro;
  end;

  TContaResponse = class(TPersistent)
  private
    Fsucesso: TContaResponseSucesso;
    Ferro: TContaResponseErro;
  published
    property sucesso: TContaResponseSucesso read Fsucesso write Fsucesso;
    property erro: TContaResponseErro read Ferro write Ferro;
  end;

  TConvenioResponse = class(TPersistent)
  private
    Fsucesso: TConvenioResponseSucesso;
    Ferro: TConvenioResponseErro;
  published
    property sucesso: TConvenioResponseSucesso read Fsucesso write Fsucesso;
    property erro: TConvenioResponseErro read Ferro write Ferro;
  end;

  TGetBoletoResponsePaginacao = class(TPersistent)
  private
    F_proximo: boolean;
    F_anterior: boolean;
  published
    property _proximo: boolean read F_proximo write F_proximo;
    property _anterior: boolean read F_anterior write F_anterior;
  end;

  TGetBoletoResponseMeta = class(TPersistent)
  private
    F_itens_por_pagina: Integer;
    F_paginacao: TGetBoletoResponsePaginacao;
    F_total: Integer;
  published
    property _itens_por_pagina: Integer read F_itens_por_pagina write F_itens_por_pagina;
    property _paginacao: TGetBoletoResponsePaginacao read F_paginacao write F_paginacao;
    property _total: Integer read F_total write F_total;
  end;

  TGetBoletoResponse = class(TPersistent)
  private
    F_status: string;
    F_dados: TArray<TBoletoIntegrado>;
    F_meta: TGetBoletoResponseMeta;
    F_mensagem: string;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TArray<TBoletoIntegrado> read F_dados write F_dados;
    property _meta: TGetBoletoResponseMeta read F_meta write F_meta;
  end;

  TGetRetornoResponse = class(TPersistent)
  private
    F_status: string;
    F_dados: TRetornoIntegrado;
    F_mensagem: string;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TRetornoIntegrado read F_dados write F_dados;
  end;

  TGetCedenteResponsePaginacao = class(TPersistent)
  private
    F_proximo: boolean;
    F_anterior: boolean;
  published
    property _proximo: boolean read F_proximo write F_proximo;
    property _anterior: boolean read F_anterior write F_anterior;
  end;

  TGetCedenteResponseMeta = class(TPersistent)
  private
    F_itens_por_pagina: Integer;
    F_paginacao: TGetCedenteResponsePaginacao;
    F_total: Integer;
  published
    property _itens_por_pagina: Integer read F_itens_por_pagina write F_itens_por_pagina;
    property _paginacao: TGetCedenteResponsePaginacao read F_paginacao write F_paginacao;
    property _total: Integer read F_total write F_total;
  end;

  TGetCedenteResponse = class(TPersistent)
  private
    F_status: string;
    F_dados: TArray<TCedenteIntegrado>;
    F_meta: TGetCedenteResponseMeta;
    F_mensagem: string;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TArray<TCedenteIntegrado> read F_dados write F_dados;
    property _meta: TGetCedenteResponseMeta read F_meta write F_meta;
  end;

  TGetContaResponsePaginacao = class(TPersistent)
  private
    F_proximo: boolean;
    F_anterior: boolean;
  published
    property _proximo: boolean read F_proximo write F_proximo;
    property _anterior: boolean read F_anterior write F_anterior;
  end;

  TGetContaResponseMeta = class(TPersistent)
  private
    F_itens_por_pagina: Integer;
    F_paginacao: TGetContaResponsePaginacao;
    F_total: Integer;
  published
    property _itens_por_pagina: Integer read F_itens_por_pagina write F_itens_por_pagina;
    property _paginacao: TGetContaResponsePaginacao read F_paginacao write F_paginacao;
    property _total: Integer read F_total write F_total;
  end;

  TGetConvenioResponsePaginacao = class(TPersistent)
  private
    F_proximo: boolean;
    F_anterior: boolean;
  published
    property _proximo: boolean read F_proximo write F_proximo;
    property _anterior: boolean read F_anterior write F_anterior;
  end;

  TGetConvenioResponseMeta = class(TPersistent)
  private
    F_itens_por_pagina: Integer;
    F_paginacao: TGetConvenioResponsePaginacao;
    F_total: Integer;
  published
    property _itens_por_pagina: Integer read F_itens_por_pagina write F_itens_por_pagina;
    property _paginacao: TGetConvenioResponsePaginacao read F_paginacao write F_paginacao;
    property _total: Integer read F_total write F_total;
  end;

  TGetContaResponse = class(TPersistent)
  private
    F_status: string;
    F_dados: TArray<TContaIntegrado>;
    F_meta: TGetContaResponseMeta;
    F_mensagem: string;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TArray<TContaIntegrado> read F_dados write F_dados;
    property _meta: TGetContaResponseMeta read F_meta write F_meta;
  end;

  TGetConvenioResponse = class(TPersistent)
  private
    F_status: string;
    F_dados: TArray<TConvenioIntegrado>;
    F_meta: TGetConvenioResponseMeta;
    F_mensagem: string;
  published
    property _status: string read F_status write F_status;
    property _mensagem: string read F_mensagem write F_mensagem;
    property _dados: TArray<TConvenioIntegrado> read F_dados write F_dados;
    property _meta: TGetConvenioResponseMeta read F_meta write F_meta;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  HW.Json,
  System.JSON,
  REST.Json;


{ TPostBoletoResponseErro }

function TPostBoletoResponseErro.ErrosToString: string;
begin
  Result := Self._mensagem + sLineBreak + sLineBreak;

  for var erro in Self._dados._falha do
  begin
    Result := Result + sLineBreak + '--' + sLineBreak + erro.SacadoNome + sLineBreak +
              IfThen(not erro.TituloValor.Trim.IsEmpty, Format('Valor: %s', [erro.TituloValor]) + sLineBreak) +
              IfThen(not erro.TituloNossoNumero.Trim.IsEmpty, Format('Pré nosso numero: %s', [erro.TituloNossoNumero]) + sLineBreak) +
              IfThen(not erro.TituloCodigoReferencia.Trim.IsEmpty, Format('Id referencia: %s', [erro.TituloCodigoReferencia]) + sLineBreak);

    for var menserro in erro._erros do
      Result := Result +
        IfThen(menserro._erro.Trim <> '',  menserro._campo + ' - ' + menserro._erro, '');

  end;
end;

{ TResponse401 }

function TResponse401.ErrosToString: string;
begin
  Result := Self._mensagem + sLineBreak + sLineBreak;

  for var erro in Self._dados do
    Result := Result + Format('> %s: %s', [erro._campo, erro._erro]) + sLineBreak;
end;

{ TDictionary<K, V> }

//constructor TDictionary<K, V>.Create;
//begin
//  inherited Create(0);
//end;

{ TPostBoletoResponseSucesso }

class function TPostBoletoResponseSucesso.ToObject(
  json: string): TPostBoletoResponseSucesso;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostBoletoResponseSucesso>(json);
  Result := TJsonHw.ToObject<TPostBoletoResponseSucesso>(json);

  lErros := TDictionary<string,string>.Create;

  try

    for var dados1 in jsonObj do
      if dados1.JsonString.Value.Equals('_dados')
        and (dados1.JsonValue is TJSONObject) then
      begin
        for var falhas in (dados1.JsonValue as TJSONObject) do
          if falhas.JsonString.Value.Equals('_falha')
            and (falhas.JsonValue is TJSONArray) then
          begin
            for var falha in (falhas.JsonValue as TJSONArray) do
              if falha is TJSONObject then
              begin
                lErros.Clear;

                for var erro in (falha as TJSONObject) do
                begin
                  if erro.JsonString.Value.Equals('_erro') then
                    for var erros in (erro.JsonValue as TJSONObject) do
                      if erros.JsonString.Value.Equals('erros') then
                      begin
                        for var items in (erros.JsonValue as TJSONObject) do
                          lErros.Add(items.JsonString.Value, items.JsonValue.Value);

                        //Break;
                      end;

                  if lErros.Count > 0 then
                    if erro.JsonString.Value.Equals('_dados') then
                      for var dados in (erro.JsonValue as TJSONObject) do
                        if dados.JsonString.Value.Equals('TituloCodigoReferencia') then
                        begin

                          for I := 0 to Length(Result._dados._falha) - 1 do
                            if Result._dados._falha[I]._dados.TituloCodigoReferencia.Equals(dados.JsonValue.Value) then
                            begin
                              Result._dados._falha[I]._erro.erros := TDictionary<string, string>.Create();

                              for var key in lErros do
                                Result._dados._falha[I]._erro.erros.Add(key.Key, key.Value);

                              Break;
                            end;

                          Break;
                        end;

                end;

                Break;
              end;
            Break;
          end;
        Break;
      end;

  finally
    lErros.Free;
  end;
end;

{ TPostBoletoResponseDados }

function TPostBoletoResponseDados.ErrosToString: string;
begin
  Result := '';
  for var falha in Self.F_falha do
  begin
    if Assigned(falha._dados) then
      Result := Result + IfThen(not Result.IsEmpty, sLineBreak + '--' + sLineBreak) +
                Format('Boleto %s - %s - %s - %s',
                       [falha._dados.TituloNumeroDocumento,
                        falha._dados.TituloDataVencimento,
                        falha._dados.TituloValor,
                        falha._dados.SacadoNome]);


    if Assigned(falha._erro) and (falha._erro.erros.Count > 0) then
    for var erro in falha._erro.erros do
    begin
      Result := Result + IfThen(not Result.IsEmpty, sLineBreak);
      Result := Result + Format('> %s : %s', [erro.Key, erro.Value]);
    end;
  end;
end;

{ TPostRemessaResponseDados }

function TPostRemessaResponseDados.ErrosToString: string;
begin
  Result := '';
  for var falha in Self.F_falha do
  begin
    Result := Result + IfThen(not Result.IsEmpty, sLineBreak + '--' + sLineBreak) +
              Format('Boleto %s - %s ',
                     [falha.idintegracao,
                      falha._erro]);
    Result := Result + IfThen(not Result.IsEmpty, sLineBreak);
  end;
end;

{ TPostRemessaResponseSucesso }

class function TPostRemessaResponseSucesso.ToObject(
  json: string): TPostRemessaResponseSucesso;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostRemessaResponseSucesso>(json);
  Result := TJsonHw.ToObject<TPostRemessaResponseSucesso>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_falha')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_falha') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;

              if lErros.Count > 0 then
                for var dados in (erro.JsonValue as TJSONObject) do
                  if dados.JsonString.Value.Equals('idintegracao') then
                  begin

                    for var _falha in (Result._dados._falha) do
                      if _falha.idintegracao.Equals(dados.JsonValue.Value) then
                      begin
                        for var key in lErros do
                          _falha._erro := trim(key.Key) + ': ' + trim(key.Value);

                        Break;
                      end;

                    Break;
                  end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

{ TPostRemessaResponseErro }

function TPostRemessaResponseErro.ErrosToString: string;
begin
  Result := Self._mensagem + sLineBreak + sLineBreak;

  for var erro in Self._dados._falha do
  begin
    Result := Result + sLineBreak + '--' + sLineBreak +
              IfThen(not erro.Idintegracao.Trim.IsEmpty, Format('Id Integracao: %s', [erro.Idintegracao]) + sLineBreak) +
              IfThen(not erro.erro.Trim.IsEmpty, Format('Erro: %s', [erro.erro]) + sLineBreak) +
              sLineBreak;

    for var detalhe in erro._erros do
      Result := Result + Format('> %s: %s', [detalhe._campo, detalhe._erro]) + sLineBreak;
  end;
end;

{ TPostDescartarResponseDados }

function TPostDescartarResponseDados.ErrosToString: string;
begin
  Result := '';
  for var falha in Self.F_falha do
  begin
    Result := Result + IfThen(not Result.IsEmpty, sLineBreak + '--' + sLineBreak) +
              Format('Boleto %s - %s ',
                     [falha.idintegracao,
                      falha._erro]);
    Result := Result + IfThen(not Result.IsEmpty, sLineBreak);
  end;
end;

{ TPostDescartarResponseSucesso }

class function TPostDescartarResponseSucesso.ToObject(
  json: string): TPostDescartarResponseSucesso;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostDescartarResponseSucesso>(json);
  Result := TJsonHw.ToObject<TPostDescartarResponseSucesso>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_falha')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_falha') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;

              if lErros.Count > 0 then
                for var dados in (erro.JsonValue as TJSONObject) do
                  if dados.JsonString.Value.Equals('idintegracao') then
                  begin

                    for var _falha in (Result._dados._falha) do
                      if _falha.idintegracao.Equals(dados.JsonValue.Value) then
                      begin
                        for var key in lErros do
                          _falha._erro := trim(key.Key) + ': ' + trim(key.Value);

                        Break;
                      end;

                    Break;
                  end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

{ TPostDescartarResponseErro }

function TPostDescartarResponseErro.ErrosToString: string;
begin
  Result := Self._mensagem + sLineBreak + sLineBreak;

  for var erro in Self._dados._falha do
  begin
    Result := Result + sLineBreak + '--' + sLineBreak +
              IfThen(not erro.Idintegracao.Trim.IsEmpty, Format('Id Integracao: %s', [erro.Idintegracao]) + sLineBreak) +
              IfThen(not erro.erro.Trim.IsEmpty, Format('Erro: %s', [erro.erro]) + sLineBreak) +
              sLineBreak;

    for var detalhe in erro._erros do
      Result := Result + Format('> %s: %s', [detalhe._campo, detalhe._erro]) + sLineBreak;
  end;
end;

{ TPostUploadRetornoResponseDados }

function TPostUploadRetornoResponseDados.ErrosToString: string;
begin
  Result := '';
  if F_erro.Trim <> '' then
    Result := F_campo + ' - ' + F_erro;
end;

{ TPostUploadRetornoResponseSucesso }

class function TPostUploadRetornoResponseSucesso.ToObject(
  json: string): TPostUploadRetornoResponseSucesso;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostUploadRetornoResponseSucesso>(json);
  Result := TJsonHw.ToObject<TPostUploadRetornoResponseSucesso>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_dados')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_dados') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

{ TCedenteResponseSucesso }

class function TCedenteResponseSucesso.ToObject(
  json: string): TCedenteResponseSucesso;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TCedenteResponseSucesso>(json);
  Result := TJsonHw.ToObject<TCedenteResponseSucesso>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_dados')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_dados') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

class function TCedenteResponseErro.ToObject(
  json: string): TCedenteResponseErro;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TCedenteResponseErro>(json);
  Result := TJsonHw.ToObject<TCedenteResponseErro>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_dados')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_dados') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

{ TContaResponseSucesso }

class function TContaResponseSucesso.ToObject(
  json: string): TContaResponseSucesso;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TContaResponseSucesso>(json);
  Result := TJsonHw.ToObject<TContaResponseSucesso>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_dados')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_dados') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

{ TContaResponseErro }

class function TContaResponseErro.ToObject(json: string): TContaResponseErro;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TContaResponseErro>(json);
  Result := TJsonHw.ToObject<TContaResponseErro>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_dados')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_dados') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

{ TConvenioResponseSucesso }

class function TConvenioResponseSucesso.ToObject(
  json: string): TConvenioResponseSucesso;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TConvenioResponseSucesso>(json);
  Result := TJsonHw.ToObject<TConvenioResponseSucesso>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_dados')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_dados') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

{ TConvenioResponseErro }

class function TConvenioResponseErro.ToObject(
  json: string): TConvenioResponseErro;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TConvenioResponseErro>(json);
  Result := TJsonHw.ToObject<TConvenioResponseErro>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_dados')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_dados') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

{ TPostUploadRetornoResponseErro }

class function TPostUploadRetornoResponseErro.ToObject(
  json: string): TPostUploadRetornoResponseErro;
var
  jsonObj: TJSONObject;
  lErros: TDictionary<string,string>;
  I: Integer;
begin
  jsonObj := TJsonHw.ObjectToJsonObject<TPostUploadRetornoResponseErro>(json);
  Result := TJsonHw.ToObject<TPostUploadRetornoResponseErro>(json);

  lErros := TDictionary<string,string>.Create;

  try
    for var falhas in (jsonObj) do
      if falhas.JsonString.Value.Equals('_dados')
        and (falhas.JsonValue is TJSONArray) then
      begin
        for var falha in (falhas.JsonValue as TJSONArray) do
          if falha is TJSONObject then
          begin
            lErros.Clear;

            for var erro in (falha as TJSONObject) do
            begin
              if erro.JsonString.Value.Equals('_dados') then
              begin
                for var items in (erro.JsonValue as TJSONObject) do
                  lErros.Add(items.JsonString.Value, items.JsonValue.Value);
              end;
            end;

            Break;
          end;
        Break;
    end;

  finally
    lErros.Free;
  end;
end;

end.
