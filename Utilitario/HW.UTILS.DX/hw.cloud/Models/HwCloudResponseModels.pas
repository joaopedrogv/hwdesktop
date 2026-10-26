unit HwCloudResponseModels;

interface

uses
  System.Classes,
  System.Generics.Collections;

type
  TResponse = class(TPersistent)
  private
    Fresposta: string;
    Fstatus: string;
  published
    property resposta: string read Fresposta write Fresposta;
    property status: string read Fstatus write Fstatus;
  end;

  TMensageriaResponse = class(TPersistent)
  private
    Fresposta: string;
    Fstatus: string;
    Fuuid: string;
  published
    property resposta: string read Fresposta write Fresposta;
    property status: string read Fstatus write Fstatus;
    property uuid: string read Fuuid write Fuuid;
  end;

  TGrupoUsuario = class(TPersistent)
  private
    Fgrupos: TList<string>;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property grupos: TList<string> read Fgrupos write Fgrupos;
  end;

  TUsuario = class(TPersistent)
  private
    Fcdpessoa: string;
    Fgrupo_usuario: TGrupoUsuario;
    Fopt_in_whatscloud: Integer;
    Ftipo_pessoa: string;
    Fuser_id: string;
  published
    property cdpessoa: string read Fcdpessoa write Fcdpessoa;
    property grupo_usuario: TGrupoUsuario read Fgrupo_usuario write Fgrupo_usuario;
    property opt_in_whatscloud: Integer read Fopt_in_whatscloud write Fopt_in_whatscloud;
    property tipo_pessoa: string read Ftipo_pessoa write Ftipo_pessoa;
    property user_id: string read Fuser_id write Fuser_id;
  end;

  TRespostaLerMensageria = class(TPersistent)
  private
    Fassunto_mensagem: string;
    Fcampo_link: string;
    Fcnpjempresa: string;
    Fcod_user_plataforma: string;
    Fdados: string;
    Fdata_ult_agendamento: string;
    Fdestino: string;
    Fdoc_link: string;
    Fdthr_cadastro: TDateTime;
    Fdthr_entrega_plat: string;
    Fdthr_ultima_alteracao: TDateTime;
    Fgestemp_id: Integer;
    Fident_bot: string;
    Fmensagem: string;
    Fobs_envio: string;
    Forigem: string;
    Fplataforma_emp_id: string;
    Fstatus: string;
    Ftemplate: string;
    Ftipo_tarefa: string;
    Fusuario: TUsuario;
    Fuuid: string;
    Fvariaveis_template: TDictionary<string, string>;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property assunto_mensagem: string read Fassunto_mensagem write Fassunto_mensagem;
    property campo_link: string read Fcampo_link write Fcampo_link;
    property cnpjempresa: string read Fcnpjempresa write Fcnpjempresa;
    property cod_user_plataforma: string read Fcod_user_plataforma write Fcod_user_plataforma;
    property dados: string read Fdados write Fdados;
    property data_ult_agendamento: string read Fdata_ult_agendamento write Fdata_ult_agendamento;
    property destino: string read Fdestino write Fdestino;
    property doc_link: string read Fdoc_link write Fdoc_link;
    property dthr_cadastro: TDateTime read Fdthr_cadastro write Fdthr_cadastro;
    property dthr_entrega_plat: string read Fdthr_entrega_plat write Fdthr_entrega_plat;
    property dthr_ultima_alteracao: TDateTime read Fdthr_ultima_alteracao write Fdthr_ultima_alteracao;
    property gestemp_id: Integer read Fgestemp_id write Fgestemp_id;
    property ident_bot: string read Fident_bot write Fident_bot;
    property mensagem: string read Fmensagem write Fmensagem;
    property obs_envio: string read Fobs_envio write Fobs_envio;
    property origem: string read Forigem write Forigem;
    property plataforma_emp_id: string read Fplataforma_emp_id write Fplataforma_emp_id;
    property status: string read Fstatus write Fstatus;
    property template: string read Ftemplate write Ftemplate;
    property tipo_tarefa: string read Ftipo_tarefa write Ftipo_tarefa;
    property usuario: TUsuario read Fusuario write Fusuario;
    property uuid: string read Fuuid write Fuuid;
    property variaveis_template: TDictionary<string, string> read Fvariaveis_template write Fvariaveis_template;
  end;

  TLerMensageriaResponse = class(TPersistent)
  private
    Fresposta: TArray<TRespostaLerMensageria>;
    Fstatus: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property resposta: TArray<TRespostaLerMensageria> read Fresposta write Fresposta;
    property status: string read Fstatus write Fstatus;
  end;

  TTipoTemplatesMeta = class(TPersistent)
  private
    Fcategoria: string;
    Fvalor_aprox: Double;
  published
    property categoria: string read Fcategoria write Fcategoria;
    property valor_aprox: Double read Fvalor_aprox write Fvalor_aprox;
  end;

  TBodyTextNamedParams = class(TPersistent)
  private
    Fexample: string;
    Fparam_name: string;
  published
    property example: string read Fexample write Fexample;
    property param_name: string read Fparam_name write Fparam_name;
  end;

  TExampleTemplate = class(TPersistent)
  private
    Fbody_text_named_params: TArray<TBodyTextNamedParams>;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property body_text_named_params: TArray<TBodyTextNamedParams> read Fbody_text_named_params write Fbody_text_named_params;
  end;

  TComponentsTemplate = class(TPersistent)
  private
    Fexample: TExampleTemplate;
    Fformat: string;
    Ftext: string;
    Ftype: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property example: TExampleTemplate read Fexample;
    property format: string read Fformat write Fformat;
    property text: string read Ftext write Ftext;
    property &type: string read Ftype write Ftype;
  end;

  TConteudoTemplate = class(TPersistent)
  private
    Fcategory: string;
    Fcomponents: TArray<TComponentsTemplate>;
    Fdisable_ios_autofill: Boolean;
    Fid: string;
    Fis_primary_device_delivery_only: Boolean;
    Flanguage: string;
    Fname: string;
    Fparameter_format: string;
    Fstatus: string;
    Fsub_category: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property category: string read Fcategory write Fcategory;
    property components: TArray<TComponentsTemplate> read Fcomponents write Fcomponents;
    property disable_ios_autofill: Boolean read Fdisable_ios_autofill write Fdisable_ios_autofill;
    property id: string read Fid write Fid;
    property is_primary_device_delivery_only: Boolean read Fis_primary_device_delivery_only write Fis_primary_device_delivery_only;
    property language: string read Flanguage write Flanguage;
    property name: string read Fname write Fname;
    property parameter_format: string read Fparameter_format write Fparameter_format;
    property status: string read Fstatus write Fstatus;
    property sub_category: string read Fsub_category write Fsub_category;
  end;

  TTemplatesMeta = class(TPersistent)
  private
    Fcategoria: string;
    Fconteudo_template: TConteudoTemplate;
    Fdthr_cadastro: TDateTime;
    Fdthr_ultima_alteracao: TDateTime;
    Fnod_resposta: string;
    Fnome_template: string;
    Fparceiroid: Integer;
    Ftexto_template: string;
    Ftipo_parametro: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property categoria: string read Fcategoria write Fcategoria;
    property conteudo_template: TConteudoTemplate read Fconteudo_template write Fconteudo_template;
    property dthr_cadastro: TDateTime read Fdthr_cadastro write Fdthr_cadastro;
    property dthr_ultima_alteracao: TDateTime read Fdthr_ultima_alteracao write Fdthr_ultima_alteracao;
    property nod_resposta: string read Fnod_resposta write Fnod_resposta;
    property nome_template: string read Fnome_template write Fnome_template;
    property parceiroid: Integer read Fparceiroid write Fparceiroid;
    property texto_template: string read Ftexto_template write Ftexto_template;
    property tipo_parametro: string read Ftipo_parametro write Ftipo_parametro;
  end;

  TPlataformas = class(TPersistent)
  private
    Fcod_plataforma_parc: string;
    Fendpoint_query_user: string;
    Fenvia_notificacao: Integer;
    Fmodelo_body_query_user: string;
    Fparceiroid: Integer;
    Fplat_padrao: Boolean;
    Fplataforma_parc_id: string;
    Fpmax_segundos_conv: Integer;
    Ftoken_acesso: string;
    Ftoken_renovacao: string;
    Furl_plataforma: string;
    Fwaba_meta: string;
  published
    property cod_plataforma_parc: string read Fcod_plataforma_parc write Fcod_plataforma_parc;
    property endpoint_query_user: string read Fendpoint_query_user write Fendpoint_query_user;
    property envia_notificacao: Integer read Fenvia_notificacao write Fenvia_notificacao;
    property modelo_body_query_user: string read Fmodelo_body_query_user write Fmodelo_body_query_user;
    property parceiroid: Integer read Fparceiroid write Fparceiroid;
    property plat_padrao: Boolean read Fplat_padrao write Fplat_padrao;
    property plataforma_parc_id: string read Fplataforma_parc_id write Fplataforma_parc_id;
    property pmax_segundos_conv: Integer read Fpmax_segundos_conv write Fpmax_segundos_conv;
    property token_acesso: string read Ftoken_acesso write Ftoken_acesso;
    property token_renovacao: string read Ftoken_renovacao write Ftoken_renovacao;
    property url_plataforma: string read Furl_plataforma write Furl_plataforma;
    property waba_meta: string read Fwaba_meta write Fwaba_meta;
  end;

  TRespostaConfig = class(TPersistent)
  private
    Fplataformas: TArray<TPlataformas>;
    Ftemplates_meta: TArray<TTemplatesMeta>;
    Ftipo_templates_meta: TArray<TTipoTemplatesMeta>;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property plataformas: TArray<TPlataformas> read Fplataformas write Fplataformas;
    property templates_meta: TArray<TTemplatesMeta> read Ftemplates_meta write Ftemplates_meta;
    property tipo_templates_meta: TArray<TTipoTemplatesMeta> read Ftipo_templates_meta write Ftipo_templates_meta;
  end;

  TConfigResponse = class(TPersistent)
  private
    Fresposta: TRespostaConfig;
    Fstatus: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property resposta: TRespostaConfig read Fresposta write Fresposta;
    property status: string read Fstatus write Fstatus;
  end;

  TConsumo = class(TPersistent)
  private
    Fcategoria_ret_template: string;
    Fcod_user_plataforma: string;
    Fdthr_entrega_plat: TDateTime;
    Fplataforma_parc_id: string;
    Ftemplate_meta: string;
    Fuser_id: string;
    Fvalor_aprox: Double;
  published
    property categoria_ret_template: string read Fcategoria_ret_template write Fcategoria_ret_template;
    property cod_user_plataforma: string read Fcod_user_plataforma write Fcod_user_plataforma;
    property dthr_entrega_plat: TDateTime read Fdthr_entrega_plat write Fdthr_entrega_plat;
    property plataforma_parc_id: string read Fplataforma_parc_id write Fplataforma_parc_id;
    property template_meta: string read Ftemplate_meta write Ftemplate_meta;
    property user_id: string read Fuser_id write Fuser_id;
    property valor_aprox: Double read Fvalor_aprox write Fvalor_aprox;
  end;

  TMetaCusto = class(TPersistent)
  private
    Fconsumo: TArray<TConsumo>;
    Fcusto_total: Double;
    Fdiames_ini_fatmeta: Integer;
    Flimite_gastos_meta: Double;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property consumo: TArray<TConsumo> read Fconsumo write Fconsumo;
    property custo_total: Double read Fcusto_total write Fcusto_total;
    property diames_ini_fatmeta: Integer read Fdiames_ini_fatmeta write Fdiames_ini_fatmeta;
    property limite_gastos_meta: Double read Flimite_gastos_meta write Flimite_gastos_meta;
  end;

  TLlmCusto = class(TPersistent)
  private
    Fcusto_entrada: Double;
    Fcusto_saida: Double;
    Fdiames_inicial_fatura: Double;
    Flimite_gastos: Double;
    Fnome_parceiro: string;
    Ftoken_entrada: Double;
    Ftoken_saida: Double;
  published
    property custo_entrada: Double read Fcusto_entrada write Fcusto_entrada;
    property custo_saida: Double read Fcusto_saida write Fcusto_saida;
    property diames_inicial_fatura: Double read Fdiames_inicial_fatura write Fdiames_inicial_fatura;
    property limite_gastos: Double read Flimite_gastos write Flimite_gastos;
    property nome_parceiro: string read Fnome_parceiro write Fnome_parceiro;
    property token_entrada: Double read Ftoken_entrada write Ftoken_entrada;
    property token_saida: Double read Ftoken_saida write Ftoken_saida;
  end;

  TRespostaCusto = class(TPersistent)
  private
    Fllm: TArray<TLlmCusto>;
    Fmeta: TMetaCusto;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property llm: TArray<TLlmCusto> read Fllm write Fllm;
    property meta: TMetaCusto read Fmeta write Fmeta;
  end;

  TCustoResponse = class(TPersistent)
  private
    Fresposta: TRespostaCusto;
    Fstatus: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property resposta: TRespostaCusto read FResposta write Fresposta;
    property status: string read Fstatus write Fstatus;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  hw_utils,
  hw_win_utils,
  HW.Json,
  System.JSON,
  REST.Json;

{ TRespostaLerMensageria }

constructor TRespostaLerMensageria.Create;
begin
  Fvariaveis_template := TDictionary<string, string>.Create();
end;

destructor TRespostaLerMensageria.Destroy;
begin
  Fvariaveis_template.Free();

  inherited;
end;

{ TGrupoUsuario }

constructor TGrupoUsuario.Create;
begin
  Fgrupos := TList<string>.Create;
end;

destructor TGrupoUsuario.Destroy;
begin
  Fgrupos.Free;
  inherited;
end;

{ TLerMensageriaResponse }

constructor TLerMensageriaResponse.Create;
begin
  SetLength(Fresposta, 0);
end;

destructor TLerMensageriaResponse.Destroy;
begin
  Fresposta := nil;
  inherited;
end;

{ TExampleTemplate }

constructor TExampleTemplate.Create;
begin
  SetLength(Fbody_text_named_params, 0);
end;

destructor TExampleTemplate.Destroy;
begin
  Fbody_text_named_params := nil;
  inherited;
end;

{ TConteudoTemplate }

constructor TConteudoTemplate.Create;
begin
  SetLength(Fcomponents, 0);
end;

destructor TConteudoTemplate.Destroy;
begin
  Fcomponents := nil;
  inherited;
end;

{ TRespostaConfig }

constructor TRespostaConfig.Create;
begin
  SetLength(Fplataformas, 0);
  SetLength(Ftemplates_meta, 0);
  SetLength(Ftipo_templates_meta, 0);
end;

destructor TRespostaConfig.Destroy;
begin
  Fplataformas := nil;
  Ftemplates_meta := nil;
  Ftipo_templates_meta := nil;
  inherited;
end;

{ TConfigResponse }

constructor TConfigResponse.Create;
begin
  Fresposta := TRespostaConfig.Create;
end;

destructor TConfigResponse.Destroy;
begin
  Fresposta.Free;
  Fresposta := nil;
  inherited;
end;

{ TTemplatesMeta }

constructor TTemplatesMeta.Create;
begin
  Fconteudo_template := TConteudoTemplate.Create;
end;

destructor TTemplatesMeta.Destroy;
begin
  Fconteudo_template.Free;
  Fconteudo_template := nil;
  inherited;
end;

{ TComponentsTemplate }

constructor TComponentsTemplate.Create;
begin
  Fexample := TExampleTemplate.Create;
end;

destructor TComponentsTemplate.Destroy;
begin
  Fexample.Free;
  Fexample := nil;
  inherited;
end;

{ TMetaCusto }

constructor TMetaCusto.Create;
begin
  SetLength(Fconsumo, 0);
end;

destructor TMetaCusto.Destroy;
begin
  Fconsumo := nil;
  inherited;
end;

{ TRespostaCusto }

constructor TRespostaCusto.Create;
begin
  Fmeta := TMetaCusto.Create;
  SetLength(Fllm, 0);
end;

destructor TRespostaCusto.Destroy;
begin
  Fmeta.Free;
  Fmeta := nil;

  Fllm := nil;
  inherited;
end;

{ TCustoResponse }

constructor TCustoResponse.Create;
begin
  Fresposta := TRespostaCusto.Create;
end;

destructor TCustoResponse.Destroy;
begin
  Fresposta.Free;
  Fresposta := nil;
  inherited;
end;

end.
