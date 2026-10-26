unit HwCloudModels;

interface

uses
  System.Classes, System.Generics.Collections, System.JSON;

type
  TIndicadorGiroPadrao = class(TPersistent)
  private
    FBaixo: TList<Double>;
    FMedio: TList<Double>;
    FAlto: TList<Double>;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property Baixo: TList<Double> read FBaixo write FBaixo;
    property Medio: TList<Double> read FMedio write FMedio;
    property Alto: TList<Double> read FAlto write FAlto;
  end;

  TPesosEmp = class(TPersistent)
  private
    FDemanda: Integer;
    FFrequencia: Integer;
    FNIVEL_GIRO_MEDIO: Integer;
    FPopularidade: Integer;
    FPreço: Integer;
  published
    property Demanda: Integer read FDemanda write FDemanda;
    property Frequencia: Integer read FFrequencia write FFrequencia;
    property NIVEL_GIRO_MEDIO: Integer read FNIVEL_GIRO_MEDIO write FNIVEL_GIRO_MEDIO;
    property Popularidade: Integer read FPopularidade write FPopularidade;
    property Preço: Integer read FPreço write FPreço;
  end;

  TDadosEmpresa = class(TPersistent)
  private
    Fativo: Integer;
    Fclasse_busca_usuario: string;
    Fdias_vnd_recomenda: Integer;
    Fhora_inicio_seg_sex: string;
    Fhora_fim_seg_sex: string;
    Fhora_inicio_sab: string;
    Fhora_fim_sab: string;
    Ftimeout_saga: Integer;
    Findicador_giro_padrao: TIndicadorGiroPadrao;
    Finfo_contato: string;
    Finterv_treino_recomenda: Integer;
    Fmodelo_padrao: Integer;
    Fdiames_ini_fatmeta: Integer;
    Flimite_gastos_meta: Double;
    Fnome_bot: string;
    Fnome_empresa: string;
    Fpesos_emp: TPesosEmp;
    Frag_padrao: string;
    Futil_recomendacao: string;
    Futiliza_apicog: Integer;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property ativo: Integer read Fativo write Fativo;
    property classe_busca_usuario: string read Fclasse_busca_usuario write Fclasse_busca_usuario;
    property dias_vnd_recomenda: Integer read Fdias_vnd_recomenda write Fdias_vnd_recomenda;
    property hora_inicio_seg_sex: string read Fhora_inicio_seg_sex write Fhora_inicio_seg_sex;
    property hora_fim_seg_sex: string read Fhora_fim_seg_sex write Fhora_fim_seg_sex;
    property hora_inicio_sab: string read Fhora_inicio_sab write Fhora_inicio_sab;
    property hora_fim_sab: string read Fhora_fim_sab write Fhora_fim_sab;
    property timeout_saga: Integer read Ftimeout_saga write Ftimeout_saga;
    property indicador_giro_padrao: TIndicadorGiroPadrao read Findicador_giro_padrao write Findicador_giro_padrao;
    property info_contato: string read Finfo_contato write Finfo_contato;
    property interv_treino_recomenda: Integer read Finterv_treino_recomenda write Finterv_treino_recomenda;
    property modelo_padrao: Integer read Fmodelo_padrao write Fmodelo_padrao;
    property diames_ini_fatmeta: Integer read Fdiames_ini_fatmeta write Fdiames_ini_fatmeta;
    property limite_gastos_meta: Double read Flimite_gastos_meta write Flimite_gastos_meta;
    property nome_bot: string read Fnome_bot write Fnome_bot;
    property nome_empresa: string read Fnome_empresa write Fnome_empresa;
    property pesos_emp: TPesosEmp read Fpesos_emp write Fpesos_emp;
    property rag_padrao: string read Frag_padrao write Frag_padrao;
    property util_recomendacao: string read Futil_recomendacao write Futil_recomendacao;
    property utiliza_apicog: Integer read Futiliza_apicog write Futiliza_apicog;
  end;

  TCadEmpresa = class(TPersistent)
  private
    Faction: string;
    Fcnpj: string;
    Fdados: TDadosEmpresa;
    Fambiente_id: string;
    Ftpdados: string;
    Ftpop: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property action: string read Faction write Faction;
    property cnpj: string read Fcnpj write Fcnpj;
    property dados: TDadosEmpresa read FDados write FDados;
    property ambiente_id: string read Fambiente_id write Fambiente_id;
    property tpdados: string read Ftpdados write Ftpdados;
    property tpop: string read Ftpop write Ftpop;
  end;

  TDadosUsuarioSenha = class(TPersistent)
  private
    Fusuario: string;
    Fsenha: string;
    Fcdpessoa: string;
    Ftipo_pessoa: string;
    Fcontato: string;
  public
    property usuario: string read Fusuario write Fusuario;
    property senha: string read Fsenha write Fsenha;
    property cdpessoa: string read Fcdpessoa write Fcdpessoa;
    property tipo_pessoa: string read Ftipo_pessoa write Ftipo_pessoa;
    property contato: string read Fcontato write Fcontato;
  end;

  TCadUsuarioSenha = class(TPersistent)
  private
    Faction: string;
    Fcnpj: string;
    Fdados: TArray<TDadosUsuarioSenha>;
    Ftpdados: string;
    Ftpop: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property action: string read Faction write Faction;
    property cnpj: string read Fcnpj write Fcnpj;
    property dados: TArray<TDadosUsuarioSenha> read Fdados write Fdados;
    property tpdados: string read Ftpdados write Ftpdados;
    property tpop: string read Ftpop write Ftpop;
  end;

  TDadosPessoa = class(TPersistent)
  private
    Fativo: Integer;
    Fcdpessoa: string;
    Fcpfcnpj: string;
    Fnmcliente: string;
    Frazao_social: string;
    Frg: string;
    Ftipo_pessoa: string;

    Fobservacao: string;
    Ffone_cliente: string;
    Festado_civil: string;
    Fnaturalidade: string;
    Fsexo: string;

    Fdata_nasc: TDate;
  published
    property ativo: Integer read Fativo write Fativo;
    property cdpessoa: string read Fcdpessoa write Fcdpessoa;
    property cpfcnpj: string read Fcpfcnpj write Fcpfcnpj;
    property nmcliente: string read Fnmcliente write Fnmcliente;
    property razao_social: string read Frazao_social write Frazao_social;
    property rg: string read Frg write Frg;
    property tipo_pessoa: string read Ftipo_pessoa write Ftipo_pessoa;

    property observacao: string read Fobservacao write Fobservacao;
    property fone_cliente: string read Ffone_cliente write Ffone_cliente;
    property estado_civil: string read Festado_civil write Festado_civil;
    property naturalidade: string read Fnaturalidade write Fnaturalidade;
    property sexo: string read Fsexo write Fsexo;

    property data_nasc: TDate read Fdata_nasc write Fdata_nasc;
  end;

  TDadosPessoaCE = class(TDadosPessoa)
  private
    Fconjuge: string;
    Fpai: string;
    Fmae: string;
  published
    property conjuge: string read Fconjuge write Fconjuge;
    property pai: string read Fpai write Fpai;
    property mae: string read Fmae write Fmae;
  end;

  TDadosPessoaCI = class(TDadosPessoa)
  private
    Ftipo_pessoa: string;
    Fhora_inicio_padrao: string;
    Fhora_fim_padrao: string;
    Fdias_folga_semanais: string;
    Fis_vendedor: Boolean;
  published
    property hora_inicio_padrao: string read Fhora_inicio_padrao write Fhora_inicio_padrao;
    property hora_fim_padrao: string read Fhora_fim_padrao write Fhora_fim_padrao;
    property dias_folga_semanais: string read Fdias_folga_semanais write Fdias_folga_semanais;
    property is_vendedor: Boolean read Fis_vendedor write Fis_vendedor;
  end;

  TCadPessoa = class(TPersistent)
  private
    Faction: string;
    Fcnpj: string;
    Fdados: TArray<TDadosPessoaCE>;
    Ftpdados: string;
    Ftpop: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property action: string read Faction write Faction;
    property cnpj: string read Fcnpj write Fcnpj;
    property tpdados: string read Ftpdados write Ftpdados;
    property tpop: string read Ftpop write Ftpop;
  end;

  TCadPessoaCI = class(TCadPessoa)
  private
    Fdados: TArray<TDadosPessoaCI>;
  published
    property dados: TArray<TDadosPessoaCI> read Fdados write Fdados;
  end;

  TCadPessoaCE = class(TCadPessoa)
  private
    Fdados: TArray<TDadosPessoaCE>;
  published
    property dados: TArray<TDadosPessoaCE> read Fdados write Fdados;
  end;

  TGrupoUsuario = class(TPersistent)
  private
    Fgrupos: TArray<string>;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property grupos: TArray<string> read Fgrupos write Fgrupos;
  end;

  TDadosContato = class(TPersistent)
  private
    Fcdpessoa: string;
    Fcod_user_plataforma: string;
    Fenvia_notificacao: Integer;
    Fativo: Integer;
    Fgrupo_usuario: TGrupoUsuario;
    Fopt_in_whatscloud: Integer;
    Fplataforma_emp_id: string;
    Ftipo_pessoa: string;
    Fuser_id: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property cdpessoa: string read Fcdpessoa write Fcdpessoa;
    property cod_user_plataforma: string read Fcod_user_plataforma write Fcod_user_plataforma;
    property envia_notificacao: Integer read Fenvia_notificacao write Fenvia_notificacao;
    property ativo: Integer read Fativo write Fativo;
    property grupo_usuario: TGrupoUsuario read Fgrupo_usuario write Fgrupo_usuario;
    property opt_in_whatscloud: Integer read Fopt_in_whatscloud write Fopt_in_whatscloud;
    property plataforma_emp_id: string read Fplataforma_emp_id write Fplataforma_emp_id;
    property tipo_pessoa: string read Ftipo_pessoa write Ftipo_pessoa;
    property user_id: string read Fuser_id write Fuser_id;
  end;

  TCadContato = class(TPersistent)
  private
    Faction: string;
    Fcnpj: string;
    Fdados: TArray<TDadosContato>;
    Ftpdados: string;
    Ftpop: string;
    Fusa_hook: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property action: string read Faction write Faction;
    property cnpj: string read Fcnpj write Fcnpj;
    property dados: TArray<TDadosContato> read Fdados write Fdados;
    property tpdados: string read Ftpdados write Ftpdados;
    property tpop: string read Ftpop write Ftpop;
    property usa_hook: string read Fusa_hook write Fusa_hook;
  end;

  TLerMensageria = class(TPersistent)
  private
    Fplataforma_emp_id: string;
    Fresumido: Boolean;
    Fcnpjempresa: string;
    Fdestino: string;
    Fuuid: string;
  published
    property plataforma_emp_id: string read Fplataforma_emp_id write Fplataforma_emp_id;
    property resumido: Boolean read Fresumido write Fresumido;
    property cnpjempresa: string read Fcnpjempresa write Fcnpjempresa;
    property destino: string read Fdestino write Fdestino;
    property uuid: string read Fuuid write Fuuid;
  end;

  TItensSemAnexo = class(TPersistent)
  end;

  TItensComAnexo = class(TPersistent)
  private
    Fconteudo_base64: string;
    Fdata_documento: string;
    Fdata_vencimento: string;
    Fmime_conteudo: string;
    Fnome_arquivo: string;
    Fnum_doc: string;
    Ftipo_documento: string;
    Fvalor_doc: Double;
  published
    property conteudo_base64: string read Fconteudo_base64 write Fconteudo_base64;
    property data_documento: string read Fdata_documento write Fdata_documento;
    property data_vencimento: string read Fdata_vencimento write Fdata_vencimento;
    property mime_conteudo: string read Fmime_conteudo write Fmime_conteudo;
    property nome_arquivo: string read Fnome_arquivo write Fnome_arquivo;
    property num_doc: string read Fnum_doc write Fnum_doc;
    property tipo_documento: string read Ftipo_documento write Ftipo_documento;
    property valor_doc: Double read Fvalor_doc write Fvalor_doc;
  end;

  TCadMensageriaSemTemplateSemAnexo = class(TPersistent)
  private
    Fcnpj: string;
    Forigem: string;
    Fdestino: string;
    Ftipo_tarefa: string;
    Fmensagem: string;
    Fplataforma_emp_id: string;
    Fident_bot: string;
    Fcod_user_plataforma: string;
    Fassunto_mensagem: string;
    Fitens: TArray<TItensSemAnexo>;
    Fperfil_pessoa: string;
    Ftipo_envio: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property cnpj: string read Fcnpj write Fcnpj;
    property origem: string read Forigem write Forigem;
    property destino: string read Fdestino write Fdestino;
    property tipo_tarefa: string read Ftipo_tarefa write Ftipo_tarefa;
    property mensagem: string read Fmensagem write Fmensagem;
    property plataforma_emp_id: string read Fplataforma_emp_id write Fplataforma_emp_id;
    property ident_bot: string read Fident_bot write Fident_bot;
    property cod_user_plataforma: string read Fcod_user_plataforma write Fcod_user_plataforma;
    property assunto_mensagem: string read Fassunto_mensagem write Fassunto_mensagem;
    property itens: TArray<TItensSemAnexo> read FItens write FItens;
    property perfil_pessoa: string read Fperfil_pessoa write Fperfil_pessoa;
    property tipo_envio: string read Ftipo_envio write Ftipo_envio;
  end;

  TCadMensageriaSemTemplateComAnexo = class(TPersistent)
  private
    Fcnpj: string;
    Forigem: string;
    Fdestino: string;
    Ftipo_tarefa: string;
    Fmensagem: string;
    Fplataforma_emp_id: string;
    Fident_bot: string;
    Fcod_user_plataforma: string;
    Fassunto_mensagem: string;
    Fitens: TArray<TItensComAnexo>;
    Fperfil_pessoa: string;
    Ftipo_envio: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property cnpj: string read Fcnpj write Fcnpj;
    property origem: string read Forigem write Forigem;
    property destino: string read Fdestino write Fdestino;
    property tipo_tarefa: string read Ftipo_tarefa write Ftipo_tarefa;
    property mensagem: string read Fmensagem write Fmensagem;
    property plataforma_emp_id: string read Fplataforma_emp_id write Fplataforma_emp_id;
    property ident_bot: string read Fident_bot write Fident_bot;
    property cod_user_plataforma: string read Fcod_user_plataforma write Fcod_user_plataforma;
    property assunto_mensagem: string read Fassunto_mensagem write Fassunto_mensagem;
    property itens: TArray<TItensComAnexo> read FItens write FItens;
    property perfil_pessoa: string read Fperfil_pessoa write Fperfil_pessoa;
    property tipo_envio: string read Ftipo_envio write Ftipo_envio;
  end;

  TCadMensageriaComTemplateSemAnexo = class(TPersistent)
  private
    Fcnpj: string;
    Forigem: string;
    Fdestino: string;
    Ftipo_tarefa: string;
    Fmensagem: string;
    Fplataforma_emp_id: string;
    Fcod_user_plataforma: string;
    Fident_bot: string;
    Fassunto_mensagem: string;
    Fitens: TArray<TItensSemAnexo>;
    Fperfil_pessoa: string;
    Ftemplate_platenvio: string;
    Fvariaveis_template: TDictionary<string, string>;
    Ftipo_envio: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property cnpj: string read Fcnpj write Fcnpj;
    property origem: string read Forigem write Forigem;
    property destino: string read Fdestino write Fdestino;
    property tipo_tarefa: string read Ftipo_tarefa write Ftipo_tarefa;
    property mensagem: string read Fmensagem write Fmensagem;
    property plataforma_emp_id: string read Fplataforma_emp_id write Fplataforma_emp_id;
    property cod_user_plataforma: string read Fcod_user_plataforma write Fcod_user_plataforma;
    property ident_bot: string read Fident_bot write Fident_bot;
    property assunto_mensagem: string read Fassunto_mensagem write Fassunto_mensagem;
    property itens: TArray<TItensSemAnexo> read FItens write FItens;
    property perfil_pessoa: string read Fperfil_pessoa write Fperfil_pessoa;
    property template_platenvio: string read Ftemplate_platenvio write Ftemplate_platenvio;
    property variaveis_template: TDictionary<string, string> read Fvariaveis_template write Fvariaveis_template;
    property tipo_envio: string read Ftipo_envio write Ftipo_envio;
  end;


  TCadMensageriaComTemplateComAnexo = class(TPersistent)
  private
    Fcnpj: string;
    Forigem: string;
    Fdestino: string;
    Ftipo_tarefa: string;
    Fmensagem: string;
    Fplataforma_emp_id: string;
    Fcod_user_plataforma: string;
    Fident_bot: string;
    Fassunto_mensagem: string;
    Fitens: TArray<TItensComAnexo>;
    Fperfil_pessoa: string;
    Ftemplate_platenvio: string;
    Fvariaveis_template: TDictionary<string, string>;
    Ftipo_envio: string;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property cnpj: string read Fcnpj write Fcnpj;
    property origem: string read Forigem write Forigem;
    property destino: string read Fdestino write Fdestino;
    property tipo_tarefa: string read Ftipo_tarefa write Ftipo_tarefa;
    property mensagem: string read Fmensagem write Fmensagem;
    property plataforma_emp_id: string read Fplataforma_emp_id write Fplataforma_emp_id;
    property cod_user_plataforma: string read Fcod_user_plataforma write Fcod_user_plataforma;
    property ident_bot: string read Fident_bot write Fident_bot;
    property assunto_mensagem: string read Fassunto_mensagem write Fassunto_mensagem;
    property itens: TArray<TItensComAnexo> read FItens write FItens;
    property perfil_pessoa: string read Fperfil_pessoa write Fperfil_pessoa;
    property template_platenvio: string read Ftemplate_platenvio write Ftemplate_platenvio;
    property variaveis_template: TDictionary<string, string> read Fvariaveis_template write Fvariaveis_template;
    property tipo_envio: string read Ftipo_envio write Ftipo_envio;
  end;

  TUpdateMensageria = class(TPersistent)
  private
    Fcnpj: string;
    Forigem: string;
    Fstatus: string;
    Fuuid: string;
  published
    property cnpj: string read Fcnpj write Fcnpj;
    property origem: string read Forigem write Forigem;
    property status: string read Fstatus write Fstatus;
    property uuid: string read Fuuid write Fuuid;
  end;

  TBuscarConfig = class(TPersistent)
  private
    Fcnpj: string;
  published
    property cnpj: string read Fcnpj write Fcnpj;
  end;

  TBuscarCusto = class(TPersistent)
  private
    Fcnpj: string;
    Fdata_inicial: string;
    Fdata_final: string;
  published
    property cnpj: string read Fcnpj write Fcnpj;
    property data_inicial: string read Fdata_inicial write Fdata_inicial;
    property data_final: string read Fdata_final write Fdata_final;
  end;

implementation

{ TCadMensageriaComTemplateSemAnexo }

constructor TCadMensageriaComTemplateSemAnexo.Create;
begin
  SetLength(Fitens, 0);
  Fvariaveis_template := TDictionary<string, string>.Create();
end;

destructor TCadMensageriaComTemplateSemAnexo.Destroy;
begin
  Fitens := nil;
  Fvariaveis_template.Free();

  inherited;
end;

{ TCadMensageriaComTemplateComAnexo }

constructor TCadMensageriaComTemplateComAnexo.Create;
begin
  SetLength(Fitens, 0);
  Fvariaveis_template := TDictionary<string, string>.Create();
end;

destructor TCadMensageriaComTemplateComAnexo.Destroy;
begin
  Fitens := nil;
  Fvariaveis_template.Free();

  inherited;
end;

{ TCadMensageriaSemTemplateComAnexo }

constructor TCadMensageriaSemTemplateComAnexo.Create;
begin
  SetLength(Fitens, 0);
end;

destructor TCadMensageriaSemTemplateComAnexo.Destroy;
begin
  Fitens := nil;
  inherited;
end;

{ TCadMensageriaSemTemplateSemAnexo }

constructor TCadMensageriaSemTemplateSemAnexo.Create;
begin
  SetLength(Fitens, 0);
end;

destructor TCadMensageriaSemTemplateSemAnexo.Destroy;
begin
  Fitens := nil;
  inherited;
end;

{ TCadContato }

constructor TCadContato.Create;
begin
  SetLength(Fdados, 0);
end;

destructor TCadContato.Destroy;
begin
  Fdados := nil;
  inherited;
end;

{ TGrupoUsuario }

constructor TGrupoUsuario.Create;
begin
  SetLength(Fgrupos, 0);
end;

destructor TGrupoUsuario.Destroy;
begin
  Fgrupos := nil;
  inherited;
end;

{ TIndicadorGiroPadrao }

constructor TIndicadorGiroPadrao.Create;
begin
  FBaixo := TList<Double>.Create;
  FMedio := TList<Double>.Create;
  FAlto  := TList<Double>.Create;
end;

destructor TIndicadorGiroPadrao.Destroy;
begin
  FBaixo.Free;
  FMedio.Free;
  FAlto.Free;
  inherited;
end;

{ TCadEmpresa }

constructor TCadEmpresa.Create;
begin
  Fdados := TDadosEmpresa.Create;
end;

destructor TCadEmpresa.Destroy;
begin
  Fdados.Free;
  Fdados := nil;
  inherited;
end;

{ TDadosEmpresa }

constructor TDadosEmpresa.Create;
begin
  Findicador_giro_padrao := TIndicadorGiroPadrao.Create;
  Fpesos_emp := TPesosEmp.Create;
end;

destructor TDadosEmpresa.Destroy;
begin
  Findicador_giro_padrao.Free;
  Findicador_giro_padrao := nil;

  Fpesos_emp.Free;
  Fpesos_emp := nil;
  inherited;
end;

{ TDadosContato }

constructor TDadosContato.Create;
begin
  Fgrupo_usuario := TGrupoUsuario.Create;
end;

destructor TDadosContato.Destroy;
begin
  Fgrupo_usuario.Free;
  Fgrupo_usuario := nil;
  inherited;
end;

{ TCadPessoa }

constructor TCadPessoa.Create;
begin
  SetLength(Fdados, 0);
end;

destructor TCadPessoa.Destroy;
begin
  Fdados := nil;
  inherited;
end;

{ TCadUsuarioSenha }

constructor TCadUsuarioSenha.Create;
begin
  SetLength(Fdados, 0);
end;

destructor TCadUsuarioSenha.Destroy;
begin
  Fdados := nil;
  inherited;
end;

end.
