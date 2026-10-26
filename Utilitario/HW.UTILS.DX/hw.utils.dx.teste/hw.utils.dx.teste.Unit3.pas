unit hw.utils.dx.teste.Unit3;

interface

uses
  System.Generics.Collections,
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Rtti,
//  REST.JsonReflect,
  DBXJSON,
  DBXJSONReflect;

type

  [THwDBTableName('CPESSOA')]
  TCPessoa = class(THwClassRegistros)
  private
    Ffone: string;
    Fsalario: Double;
    Fdatcad: TDateTime;
    Fcod: integer;
    Fnome: string;
    [JSONMarshalled(False)]
    FCampoNaoPresente: string;
    procedure Setcod(const Value: integer);
    procedure Setdatcad(const Value: TDateTime);
    procedure Setfone(const Value: string);
    procedure Setnome(const Value: string);
    procedure Setsalario(const Value: Double);
  public

    function GetJSONMarshallString: string;

    [THwDBField('CODIGO', 'Código', True, 0, '000')]
    property cod: integer read Fcod write Setcod;
    [THwDBField('NOME', 'Nome do Teste', false, 50)]
    property nome: string read Fnome write Setnome;
    [THwDBField('DATACADASTRO', 'Data Cadastro', False, 0, '!99/99/0000;1;_')]
    property datcad: TDateTime read Fdatcad write Setdatcad;
    [THwDBField('TELEFONE', 'Telefone', False, 14, '(99) 9999-9999;0;_')]
    property fone: string read Ffone write Setfone;
    [THwDBField('SALARIO', 'Salário', False, 0, '##0.00')]
    property salario: Double read Fsalario write Setsalario;
//    [THwDBFieldNotIn]
    //property CampoNaoPresente: string read FCampoNaoPresente write FCampoNaoPresente;
  end;

  TCcidade = class
  private
    Fibge_cod_cidade: Integer;
    Fativo: Integer;
    Fdata_mod: string;
    Fcod_cidade: Integer;
    Fdata_cadastro: string;
    Fnome_cidade: String;
    Fibge_cod_uf: Integer;
    procedure Setativo(const Value: Integer);
    procedure Setcod_cidade(const Value: Integer);
    procedure Setdata_cadastro(const Value: string);
    procedure Setdata_mod(const Value: string);
    procedure Setibge_cod_cidade(const Value: Integer);
    procedure Setibge_cod_uf(const Value: Integer);
    procedure Setnome_cidade(const Value: String);
  published
    property cod_cidade: Integer read Fcod_cidade write Setcod_cidade;
    property nome_cidade: String read Fnome_cidade write Setnome_cidade;
    property ibge_cod_cidade: Integer read Fibge_cod_cidade write Setibge_cod_cidade;
    property data_cadastro: string read Fdata_cadastro write Setdata_cadastro;
    property data_mod: string read Fdata_mod write Setdata_mod;
    property ibge_cod_uf: Integer read Fibge_cod_uf write Setibge_cod_uf;
    property ativo: Integer read Fativo write Setativo;
  end;

  TCestado = class
  private
    Fativo: Integer;
    Fcodigo_uf: Integer;
    Fdata_mod: string;
    Fdata_cadastro: string;
    Fsigla_uf: String;
    Fnome_uf: String;
    Fibge_codigo_uf: Integer;
    procedure Setativo(const Value: Integer);
    procedure Setcodigo_uf(const Value: Integer);
    procedure Setdata_cadastro(const Value: string);
    procedure Setdata_mod(const Value: string);
    procedure Setibge_codigo_uf(const Value: Integer);
    procedure Setnome_uf(const Value: String);
    procedure Setsigla_uf(const Value: String);
  published
    property codigo_uf: Integer read Fcodigo_uf write Setcodigo_uf;
    property sigla_uf: String read Fsigla_uf write Setsigla_uf;
    property nome_uf: String read Fnome_uf write Setnome_uf;
    property ibge_codigo_uf: Integer read Fibge_codigo_uf write Setibge_codigo_uf;
    property data_cadastro: string read Fdata_cadastro write Setdata_cadastro;
    property data_mod: string read Fdata_mod write Setdata_mod;
    property ativo: Integer read Fativo write Setativo;
  end;

  TCliente = class
  private
    Fibge_cod_cidade: Integer;
    Fcnpjintegra: String;
    Fcod_empresa: Integer;
    Fdias_vencch: Integer;
    Fcod_ambiente: Integer;
    Fexibir_parceiro: String;
    Fcnpj: String;
    Fccidade: TCcidade;
    Fgrupo_parceria: Integer;
    Femail: String;
    Fbairro: String;
    Ffax: String;
    Fcestado: TCestado;
    Facao_webhistped_atv: String;
    Fcodigo_uf: Integer;
    Fativo: Integer;
    Fdata_mod: string;
    Fcod_cidade: Integer;
    Fcontrato_ativo: String;
    Fcod_cl_integra: Integer;
    Fdata_cadastro: string;
    Fcod_us_mod: Integer;
    Fqtde_copias: Integer;
    Fcep: String;
    Fcodigo_swhw: Integer;
    Fcod_cl_parc: Integer;
    Frelease_disponivel: String;
    Fcod_us_cad: Integer;
    Fcod_faturamento: Integer;
    Fseqmod: Integer;
    Fnum_end_cliente: String;
    Fcod_cliente: Integer;
    Furl_cliente: String;
    Fdiretorio_img: String;
    Fnome: String;
    Finsc_est: String;
    Fcidade: String;
    Ftipo_cl: String;
    Fendereco: String;
    Frazao: String;
    Fibge_codigo_uf: Integer;
    Ffone_cliente: String;
    procedure Setacao_webhistped_atv(const Value: String);
    procedure Setativo(const Value: Integer);
    procedure Setbairro(const Value: String);
    procedure Setccidade(const Value: TCcidade);
    procedure Setcep(const Value: String);
    procedure Setcestado(const Value: TCestado);
    procedure Setcidade(const Value: String);
    procedure Setcnpj(const Value: String);
    procedure Setcnpjintegra(const Value: String);
    procedure Setcod_ambiente(const Value: Integer);
    procedure Setcod_cidade(const Value: Integer);
    procedure Setcod_cl_integra(const Value: Integer);
    procedure Setcod_cl_parc(const Value: Integer);
    procedure Setcod_cliente(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_faturamento(const Value: Integer);
    procedure Setcod_us_cad(const Value: Integer);
    procedure Setcod_us_mod(const Value: Integer);
    procedure Setcodigo_swhw(const Value: Integer);
    procedure Setcodigo_uf(const Value: Integer);
    procedure Setcontrato_ativo(const Value: String);
    procedure Setdata_cadastro(const Value: string);
    procedure Setdata_mod(const Value: string);
    procedure Setdias_vencch(const Value: Integer);
    procedure Setdiretorio_img(const Value: String);
    procedure Setemail(const Value: String);
    procedure Setendereco(const Value: String);
    procedure Setexibir_parceiro(const Value: String);
    procedure Setfax(const Value: String);
    procedure Setfone_cliente(const Value: String);
    procedure Setgrupo_parceria(const Value: Integer);
    procedure Setibge_cod_cidade(const Value: Integer);
    procedure Setibge_codigo_uf(const Value: Integer);
    procedure Setinsc_est(const Value: String);
    procedure Setnome(const Value: String);
    procedure Setnum_end_cliente(const Value: String);
    procedure Setqtde_copias(const Value: Integer);
    procedure Setrazao(const Value: String);
    procedure Setrelease_disponivel(const Value: String);
    procedure Setseqmod(const Value: Integer);
    procedure Settipo_cl(const Value: String);
    procedure Seturl_cliente(const Value: String);
  public
    destructor Destroy; override;
    constructor Create;
  published
    property cod_cliente: Integer read Fcod_cliente write Setcod_cliente;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property nome: String read Fnome write Setnome;
    property razao: String read Frazao write Setrazao;
    property cnpj: String read Fcnpj write Setcnpj;
    property cep: String read Fcep write Setcep;
    property endereco: String read Fendereco write Setendereco;
    property bairro: String read Fbairro write Setbairro;
    property ccidade: TCcidade read Fccidade write Setccidade;// class
    property cestado: TCestado read Fcestado write Setcestado;// class
    property cidade: String read Fcidade write Setcidade;
    property cod_cidade: Integer read Fcod_cidade write Setcod_cidade;
    property data_cadastro: string read Fdata_cadastro write Setdata_cadastro;
    property data_mod: string read Fdata_mod write Setdata_mod;
    property email: String read Femail write Setemail;
    property qtde_copias: Integer read Fqtde_copias write Setqtde_copias;
    property ativo: Integer read Fativo write Setativo;
    property codigo_uf: Integer read Fcodigo_uf write Setcodigo_uf;
    property fone_cliente: String read Ffone_cliente write Setfone_cliente;
    property url_cliente: String read Furl_cliente write Seturl_cliente;
    property diretorio_img: String read Fdiretorio_img write Setdiretorio_img;
    property exibir_parceiro: String read Fexibir_parceiro write Setexibir_parceiro;
    property grupo_parceria: Integer read Fgrupo_parceria write Setgrupo_parceria;
    property cod_faturamento: Integer read Fcod_faturamento write Setcod_faturamento;
    property tipo_cl: String read Ftipo_cl write Settipo_cl;
    property cod_cl_parc: Integer read Fcod_cl_parc write Setcod_cl_parc;
    property cod_cl_integra: Integer read Fcod_cl_integra write Setcod_cl_integra;
    property cod_ambiente: Integer read Fcod_ambiente write Setcod_ambiente;
    property cod_us_cad: Integer read Fcod_us_cad write Setcod_us_cad;
    property codigo_swhw: Integer read Fcodigo_swhw write Setcodigo_swhw;
    property num_end_cliente: String read Fnum_end_cliente write Setnum_end_cliente;
    property insc_est: String read Finsc_est write Setinsc_est;
    property dias_vencch: Integer read Fdias_vencch write Setdias_vencch;
    property cnpjintegra: String read Fcnpjintegra write Setcnpjintegra;
    property cod_us_mod: Integer read Fcod_us_mod write Setcod_us_mod;
    property seqmod: Integer read Fseqmod write Setseqmod;
    property ibge_cod_cidade: Integer read Fibge_cod_cidade write Setibge_cod_cidade;
    property ibge_codigo_uf: Integer read Fibge_codigo_uf write Setibge_codigo_uf;
    property fax: String read Ffax write Setfax;
    property release_disponivel: String read Frelease_disponivel write Setrelease_disponivel;
    property contrato_ativo: String read Fcontrato_ativo write Setcontrato_ativo;
    property acao_webhistped_atv: String read Facao_webhistped_atv write Setacao_webhistped_atv;
  end;

  TTipoassunto = class
  private
    Fcod_empresa: Integer;
    Fcurva: String;
    Fativo: Integer;
    Fdescricao: String;
    Fdata_cadastro: string;
    Fcod_tp_assunto: Integer;
    Fdata_curva: string;
    Fcod_us_cad: Integer;
    Fseqmod: Integer;
    procedure Setativo(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_tp_assunto(const Value: Integer);
    procedure Setcod_us_cad(const Value: Integer);
    procedure Setcurva(const Value: String);
    procedure Setdata_cadastro(const Value: string);
    procedure Setdata_curva(const Value: string);
    procedure Setdescricao(const Value: String);
    procedure Setseqmod(const Value: Integer);
  published
    property cod_tp_assunto: Integer read Fcod_tp_assunto write Setcod_tp_assunto;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property descricao: String read Fdescricao write Setdescricao;
    property ativo: Integer read Fativo write Setativo;
    property data_cadastro: string read Fdata_cadastro write Setdata_cadastro;
    property cod_us_cad: Integer read Fcod_us_cad write Setcod_us_cad;
    property curva: String read Fcurva write Setcurva;
    property data_curva: string read Fdata_curva write Setdata_curva;
    property seqmod: Integer read Fseqmod write Setseqmod;
  end;

  TModulo = class
  private
    Fcod_empresa: Integer;
    Fativo: Integer;
    Fdescricao: String;
    Fcod_modulo: Integer;
    Fdata_cad: string;
    Fcod_us_cad: Integer;
    procedure Setativo(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_modulo(const Value: Integer);
    procedure Setcod_us_cad(const Value: Integer);
    procedure Setdata_cad(const Value: string);
    procedure Setdescricao(const Value: String);
  published
    property cod_modulo: Integer read Fcod_modulo write Setcod_modulo;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property ativo: Integer read Fativo write Setativo;
    property descricao: String read Fdescricao write Setdescricao;
    property cod_us_cad: Integer read Fcod_us_cad write Setcod_us_cad;
    property data_cad: string read Fdata_cad write Setdata_cad;
  end;

  TTipoProblema = class
  private
    Fcod_empresa: Integer;
    Fativo: Integer;
    Fdescricao: String;
    Fdata_cad: string;
    Fcod_tp_problema: Integer;
    Fcod_us_cad: Integer;
    procedure Setativo(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_tp_problema(const Value: Integer);
    procedure Setcod_us_cad(const Value: Integer);
    procedure Setdata_cad(const Value: string);
    procedure Setdescricao(const Value: String);
  published
    property cod_tp_problema: Integer read Fcod_tp_problema write Setcod_tp_problema;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property ativo: Integer read Fativo write Setativo;
    property descricao: String read Fdescricao write Setdescricao;
    property cod_us_cad: Integer read Fcod_us_cad write Setcod_us_cad;
    property data_cad: string read Fdata_cad write Setdata_cad;
  end;

  TBancosolucoes = class
  private
    Fcod_empresa: Integer;
    Fcod_solucao: Integer;
    Fdescr_problema: String;
    Fativo: Integer;
    Fcod_modulo: Integer;
    Ftipo_problema: TTipoProblema;
    Fdata_cad: string;
    Fcod_tp_problema: Integer;
    Fcod_us_cad: Integer;
    Fdescr_solucao: String;
    Fmodulo: TModulo;
    Fobservacoes: String;
    procedure Setativo(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_modulo(const Value: Integer);
    procedure Setcod_solucao(const Value: Integer);
    procedure Setcod_tp_problema(const Value: Integer);
    procedure Setcod_us_cad(const Value: Integer);
    procedure Setdata_cad(const Value: string);
    procedure Setdescr_problema(const Value: String);
    procedure Setdescr_solucao(const Value: String);
    procedure Setmodulo(const Value: TModulo);
    procedure Setobservacoes(const Value: String);
    procedure Settipo_problema(const Value: TTipoProblema);
  public
    destructor Destroy; override;
    constructor Create;
  published
    property cod_solucao: Integer read Fcod_solucao write Setcod_solucao;
    property ativo: Integer read Fativo write Setativo;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property cod_tp_problema: Integer read Fcod_tp_problema write Setcod_tp_problema;
    property modulo: TModulo read Fmodulo write Setmodulo;// class
    property tipo_problema: TTipoProblema read Ftipo_problema write Settipo_problema;// class
    property cod_modulo: Integer read Fcod_modulo write Setcod_modulo;
    property descr_problema: String read Fdescr_problema write Setdescr_problema;
    property descr_solucao: String read Fdescr_solucao write Setdescr_solucao;
    property observacoes: String read Fobservacoes write Setobservacoes;
    property cod_us_cad: Integer read Fcod_us_cad write Setcod_us_cad;
    property data_cad: string read Fdata_cad write Setdata_cad;
  end;

  THistoricoSolucoes = class
  private
    Fcod_empresa: Integer;
    Fcod_solucao: Integer;
    Fativo: Integer;
    Fcodigo: Integer;
    Fcod_atendimento: Integer;
    Fbancosolucoes: TBancosolucoes;
    procedure Setativo(const Value: Integer);
    procedure Setbancosolucoes(const Value: TBancosolucoes);
    procedure Setcod_atendimento(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_solucao(const Value: Integer);
    procedure Setcodigo(const Value: Integer);
  public
    destructor Destroy; override;
    constructor Create;
  published
    property codigo: Integer read Fcodigo write Setcodigo;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property ativo: Integer read Fativo write Setativo;
    property bancosolucoes: TBancosolucoes read Fbancosolucoes write Setbancosolucoes;// class
    property cod_atendimento: Integer read Fcod_atendimento write Setcod_atendimento;
    property cod_solucao: Integer read Fcod_solucao write Setcod_solucao;
  end;

  TArrayHistoricoSolucoes = array of THistoricoSolucoes;

  TAtendimento = class
  private
    Fcod_chamado: Integer;
    Fcod_empresa: Integer;
    Fcod_usuario: Integer;
    Fativo: Integer;
    Fdescricao: String;
    Fdata_cadastro: string;
    Fcod_atendimento: Integer;
    Ftp_contr: String;
    Fcolaborador: String;
    Fhora_inicio: string;
    Fstatus: String;
    Fcod_tp_assunto: Integer;
    Fcod_tp_problema: Integer;
    Fseqmod: Integer;
    Fcontato: String;
    Ftipoassunto: TTipoassunto;
    Fhora_final: string;
    Ftipoproblema: TTipoproblema;
    Fref_cadastro: String;
    Fcod_solucoes: String;
    Fhistorico_solucoes: TArrayHistoricoSolucoes;
    procedure Setativo(const Value: Integer);
    procedure Setcod_atendimento(const Value: Integer);
    procedure Setcod_chamado(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_solucoes(const Value: String);
    procedure Setcod_tp_assunto(const Value: Integer);
    procedure Setcod_tp_problema(const Value: Integer);
    procedure Setcod_usuario(const Value: Integer);
    procedure Setcolaborador(const Value: String);
    procedure Setcontato(const Value: String);
    procedure Setdata_cadastro(const Value: string);
    procedure Setdescricao(const Value: String);
    procedure Sethora_final(const Value: string);
    procedure Sethora_inicio(const Value: string);
    procedure Setref_cadastro(const Value: String);
    procedure Setseqmod(const Value: Integer);
    procedure Setstatus(const Value: String);
    procedure Settipoassunto(const Value: TTipoassunto);
    procedure Settipoproblema(const Value: TTipoproblema);
    procedure Settp_contr(const Value: String);
    procedure Sethistorico_solucoes(const Value: TArrayHistoricoSolucoes);
  public
    destructor Destroy; override;
    constructor Create;
  published
    property cod_atendimento: Integer read Fcod_atendimento write Setcod_atendimento;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property cod_chamado: Integer read Fcod_chamado write Setcod_chamado;
    property descricao: String read Fdescricao write Setdescricao;
    property cod_tp_problema: Integer read Fcod_tp_problema write Setcod_tp_problema;
    property ativo: Integer read Fativo write Setativo;
    property tipoassunto: TTipoassunto read Ftipoassunto write Settipoassunto;// class
    property tipoproblema: TTipoproblema read Ftipoproblema write Settipoproblema;// class
    property data_cadastro: string read Fdata_cadastro write Setdata_cadastro;
    property hora_inicio: string read Fhora_inicio write Sethora_inicio;
    property hora_final: string read Fhora_final write Sethora_final;
    property cod_tp_assunto: Integer read Fcod_tp_assunto write Setcod_tp_assunto;
    property cod_usuario: Integer read Fcod_usuario write Setcod_usuario;
    property cod_solucoes: String read Fcod_solucoes write Setcod_solucoes;
    property status: String read Fstatus write Setstatus;
    property contato: String read Fcontato write Setcontato;
    property historico_solucoes: TArrayHistoricoSolucoes read Fhistorico_solucoes write Sethistorico_solucoes;// Collection
    property colaborador: String read Fcolaborador write Setcolaborador;
    property tp_contr: String read Ftp_contr write Settp_contr;
    property seqmod: Integer read Fseqmod write Setseqmod;
    property ref_cadastro: String read Fref_cadastro write Setref_cadastro;
  end;

  TArrayAtendimento = array of TAtendimento;

  TChamado = class
  private
    Fdiretorio_arquivo: String;
    Fcod_empresa: Integer;
    Fcod_chamado: Integer;
    Fdata_temporaria: string;
    Femail: String;
    Fdata_agendamento: string;
    Fativo: Integer;
    Fordem_cadastro: Integer;
    Fdata_cadastro: string;
    Fcliente: TCliente;
    Fordem_prioridade: Integer;
    Fdata_atendimento: string;
    Fstatus: String;
    Fcod_us_cad: Integer;
    Fatendimentos: TArrayAtendimento;
    Fcod_cliente: Integer;
    Fmensagem: String;
    Fnome: String;
    Fassunto: String;
    Ftipo: String;
    Furgente: Integer;
    Fref_cadastro: String;
    Ftelefone: String;
    procedure Setassunto(const Value: String);
    procedure Setatendimentos(const Value: TArrayAtendimento);
    procedure Setativo(const Value: Integer);
    procedure Setcliente(const Value: TCliente);
    procedure Setcod_chamado(const Value: Integer);
    procedure Setcod_cliente(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_us_cad(const Value: Integer);
    procedure Setdata_agendamento(const Value: string);
    procedure Setdata_atendimento(const Value: string);
    procedure Setdata_cadastro(const Value: string);
    procedure Setdata_temporaria(const Value: string);
    procedure Setdiretorio_arquivo(const Value: String);
    procedure Setemail(const Value: String);
    procedure Setmensagem(const Value: String);
    procedure Setnome(const Value: String);
    procedure Setordem_cadastro(const Value: Integer);
    procedure Setordem_prioridade(const Value: Integer);
    procedure Setref_cadastro(const Value: String);
    procedure Setstatus(const Value: String);
    procedure Settelefone(const Value: String);
    procedure Settipo(const Value: String);
    procedure Seturgente(const Value: Integer);
  public
    destructor Destroy; override;
    constructor Create;
  published
    property cod_chamado: Integer read Fcod_chamado write Setcod_chamado;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Setcod_cliente;
    property ativo: Integer read Fativo write Setativo;
    property cliente: TCliente read Fcliente write Setcliente;// class
    property tipo: String read Ftipo write Settipo;
    property nome: String read Fnome write Setnome;
    property mensagem: String read Fmensagem write Setmensagem;
    property email: String read Femail write Setemail;
    property assunto: String read Fassunto write Setassunto;
    property diretorio_arquivo: String read Fdiretorio_arquivo write Setdiretorio_arquivo;
    property data_cadastro: string read Fdata_cadastro write Setdata_cadastro;
    property telefone: String read Ftelefone write Settelefone;
    property data_agendamento: string read Fdata_agendamento write Setdata_agendamento;
    property data_atendimento: string read Fdata_atendimento write Setdata_atendimento;
    property data_temporaria: string read Fdata_temporaria write Setdata_temporaria;
    property status: String read Fstatus write Setstatus;
    property ref_cadastro: String read Fref_cadastro write Setref_cadastro;
    property cod_us_cad: Integer read Fcod_us_cad write Setcod_us_cad;
    property urgente: Integer read Furgente write Seturgente;
    property ordem_cadastro: Integer read Fordem_cadastro write Setordem_cadastro;
    property ordem_prioridade: Integer read Fordem_prioridade write Setordem_prioridade;
    property atendimentos: TArrayAtendimento read Fatendimentos write Setatendimentos;// Collection
  end;

  TResponseInformation = class
  private
    Ferrocomb: String;
    Fvalid: String;
    procedure Seterrocomb(const Value: String);
    procedure Setvalid(const Value: String);
  published
    property valid: String read Fvalid write Setvalid;
    property errocomb: String read Ferrocomb write Seterrocomb;
  end;

implementation

uses
  System.SysUtils;


{ TCcidade }

procedure TCcidade.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure TCcidade.Setcod_cidade(const Value: Integer);
begin
  Fcod_cidade := Value;
end;

procedure TCcidade.Setdata_cadastro(const Value: string);
begin
  Fdata_cadastro := Value;
end;

procedure TCcidade.Setdata_mod(const Value: string);
begin
  Fdata_mod := Value;
end;

procedure TCcidade.Setibge_cod_cidade(const Value: Integer);
begin
  Fibge_cod_cidade := Value;
end;

procedure TCcidade.Setibge_cod_uf(const Value: Integer);
begin
  Fibge_cod_uf := Value;
end;

procedure TCcidade.Setnome_cidade(const Value: String);
begin
  Fnome_cidade := Value;
end;

{ TCestado }

procedure TCestado.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure TCestado.Setcodigo_uf(const Value: Integer);
begin
  Fcodigo_uf := Value;
end;

procedure TCestado.Setdata_cadastro(const Value: string);
begin
  Fdata_cadastro := Value;
end;

procedure TCestado.Setdata_mod(const Value: string);
begin
  Fdata_mod := Value;
end;

procedure TCestado.Setibge_codigo_uf(const Value: Integer);
begin
  Fibge_codigo_uf := Value;
end;

procedure TCestado.Setnome_uf(const Value: String);
begin
  Fnome_uf := Value;
end;

procedure TCestado.Setsigla_uf(const Value: String);
begin
  Fsigla_uf := Value;
end;

{ TCliente }

constructor TCliente.Create;
begin
  Fccidade := TCcidade.Create;
  Fcestado := TCestado.Create;
end;

destructor TCliente.Destroy;
begin
  FreeAndNil(Fccidade);
  FreeAndNil(Fcestado);
  inherited;
end;

procedure TCliente.Setacao_webhistped_atv(const Value: String);
begin
  Facao_webhistped_atv := Value;
end;

procedure TCliente.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure TCliente.Setbairro(const Value: String);
begin
  Fbairro := Value;
end;

procedure TCliente.Setccidade(const Value: TCcidade);
begin
  Fccidade := Value;
end;

procedure TCliente.Setcep(const Value: String);
begin
  Fcep := Value;
end;

procedure TCliente.Setcestado(const Value: TCestado);
begin
  Fcestado := Value;
end;

procedure TCliente.Setcidade(const Value: String);
begin
  Fcidade := Value;
end;

procedure TCliente.Setcnpj(const Value: String);
begin
  Fcnpj := Value;
end;

procedure TCliente.Setcnpjintegra(const Value: String);
begin
  Fcnpjintegra := Value;
end;

procedure TCliente.Setcodigo_swhw(const Value: Integer);
begin
  Fcodigo_swhw := Value;
end;

procedure TCliente.Setcodigo_uf(const Value: Integer);
begin
  Fcodigo_uf := Value;
end;

procedure TCliente.Setcod_ambiente(const Value: Integer);
begin
  Fcod_ambiente := Value;
end;

procedure TCliente.Setcod_cidade(const Value: Integer);
begin
  Fcod_cidade := Value;
end;

procedure TCliente.Setcod_cliente(const Value: Integer);
begin
  Fcod_cliente := Value;
end;

procedure TCliente.Setcod_cl_integra(const Value: Integer);
begin
  Fcod_cl_integra := Value;
end;

procedure TCliente.Setcod_cl_parc(const Value: Integer);
begin
  Fcod_cl_parc := Value;
end;

procedure TCliente.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
end;

procedure TCliente.Setcod_faturamento(const Value: Integer);
begin
  Fcod_faturamento := Value;
end;

procedure TCliente.Setcod_us_cad(const Value: Integer);
begin
  Fcod_us_cad := Value;
end;

procedure TCliente.Setcod_us_mod(const Value: Integer);
begin
  Fcod_us_mod := Value;
end;

procedure TCliente.Setcontrato_ativo(const Value: String);
begin
  Fcontrato_ativo := Value;
end;

procedure TCliente.Setdata_cadastro(const Value: string);
begin
  Fdata_cadastro := Value;
end;

procedure TCliente.Setdata_mod(const Value: string);
begin
  Fdata_mod := Value;
end;

procedure TCliente.Setdias_vencch(const Value: Integer);
begin
  Fdias_vencch := Value;
end;

procedure TCliente.Setdiretorio_img(const Value: String);
begin
  Fdiretorio_img := Value;
end;

procedure TCliente.Setemail(const Value: String);
begin
  Femail := Value;
end;

procedure TCliente.Setendereco(const Value: String);
begin
  Fendereco := Value;
end;

procedure TCliente.Setexibir_parceiro(const Value: String);
begin
  Fexibir_parceiro := Value;
end;

procedure TCliente.Setfax(const Value: String);
begin
  Ffax := Value;
end;

procedure TCliente.Setfone_cliente(const Value: String);
begin
  Ffone_cliente := Value;
end;

procedure TCliente.Setgrupo_parceria(const Value: Integer);
begin
  Fgrupo_parceria := Value;
end;

procedure TCliente.Setibge_codigo_uf(const Value: Integer);
begin
  Fibge_codigo_uf := Value;
end;

procedure TCliente.Setibge_cod_cidade(const Value: Integer);
begin
  Fibge_cod_cidade := Value;
end;

procedure TCliente.Setinsc_est(const Value: String);
begin
  Finsc_est := Value;
end;

procedure TCliente.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TCliente.Setnum_end_cliente(const Value: String);
begin
  Fnum_end_cliente := Value;
end;

procedure TCliente.Setqtde_copias(const Value: Integer);
begin
  Fqtde_copias := Value;
end;

procedure TCliente.Setrazao(const Value: String);
begin
  Frazao := Value;
end;

procedure TCliente.Setrelease_disponivel(const Value: String);
begin
  Frelease_disponivel := Value;
end;

procedure TCliente.Setseqmod(const Value: Integer);
begin
  Fseqmod := Value;
end;

procedure TCliente.Settipo_cl(const Value: String);
begin
  Ftipo_cl := Value;
end;

procedure TCliente.Seturl_cliente(const Value: String);
begin
  Furl_cliente := Value;
end;

{ TTipoassunto }

procedure TTipoassunto.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure TTipoassunto.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
end;

procedure TTipoassunto.Setcod_tp_assunto(const Value: Integer);
begin
  Fcod_tp_assunto := Value;
end;

procedure TTipoassunto.Setcod_us_cad(const Value: Integer);
begin
  Fcod_us_cad := Value;
end;

procedure TTipoassunto.Setcurva(const Value: String);
begin
  Fcurva := Value;
end;

procedure TTipoassunto.Setdata_cadastro(const Value: string);
begin
  Fdata_cadastro := Value;
end;

procedure TTipoassunto.Setdata_curva(const Value: string);
begin
  Fdata_curva := Value;
end;

procedure TTipoassunto.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TTipoassunto.Setseqmod(const Value: Integer);
begin
  Fseqmod := Value;
end;

{ TTipoProblema }

procedure TTipoProblema.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure TTipoProblema.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
end;

procedure TTipoProblema.Setcod_tp_problema(const Value: Integer);
begin
  Fcod_tp_problema := Value;
end;

procedure TTipoProblema.Setcod_us_cad(const Value: Integer);
begin
  Fcod_us_cad := Value;
end;

procedure TTipoProblema.Setdata_cad(const Value: string);
begin
  Fdata_cad := Value;
end;

procedure TTipoProblema.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

{ TBancosolucoes }

constructor TBancosolucoes.Create;
begin
  Fmodulo := TModulo.Create;
  Ftipo_problema := TTipoProblema.Create;
end;

destructor TBancosolucoes.Destroy;
begin
  FreeAndNil(Fmodulo);
  FreeAndNil(Ftipo_problema);
  inherited;
end;

procedure TBancosolucoes.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure TBancosolucoes.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
end;

procedure TBancosolucoes.Setcod_modulo(const Value: Integer);
begin
  Fcod_modulo := Value;
end;

procedure TBancosolucoes.Setcod_solucao(const Value: Integer);
begin
  Fcod_solucao := Value;
end;

procedure TBancosolucoes.Setcod_tp_problema(const Value: Integer);
begin
  Fcod_tp_problema := Value;
end;

procedure TBancosolucoes.Setcod_us_cad(const Value: Integer);
begin
  Fcod_us_cad := Value;
end;

procedure TBancosolucoes.Setdata_cad(const Value: string);
begin
  Fdata_cad := Value;
end;

procedure TBancosolucoes.Setdescr_problema(const Value: String);
begin
  Fdescr_problema := Value;
end;

procedure TBancosolucoes.Setdescr_solucao(const Value: String);
begin
  Fdescr_solucao := Value;
end;

procedure TBancosolucoes.Setmodulo(const Value: TModulo);
begin
  Fmodulo := Value;
end;

procedure TBancosolucoes.Setobservacoes(const Value: String);
begin
  Fobservacoes := Value;
end;

procedure TBancosolucoes.Settipo_problema(const Value: TTipoProblema);
begin
  Ftipo_problema := Value;
end;

{ THistoricoSolucoes }

constructor THistoricoSolucoes.Create;
begin
  Fbancosolucoes := TBancosolucoes.Create;
end;

destructor THistoricoSolucoes.Destroy;
begin
  FreeAndNil(Fbancosolucoes);
  inherited;
end;

procedure THistoricoSolucoes.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure THistoricoSolucoes.Setbancosolucoes(const Value: TBancosolucoes);
begin
  Fbancosolucoes := Value;
end;

procedure THistoricoSolucoes.Setcodigo(const Value: Integer);
begin
  Fcodigo := Value;
end;

procedure THistoricoSolucoes.Setcod_atendimento(const Value: Integer);
begin
  Fcod_atendimento := Value;
end;

procedure THistoricoSolucoes.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
end;

procedure THistoricoSolucoes.Setcod_solucao(const Value: Integer);
begin
  Fcod_solucao := Value;
end;

{ TChamado }

constructor TChamado.Create;
begin
  Fcliente := TCliente.Create;
end;

destructor TChamado.Destroy;
begin
  FreeAndNil(Fcliente);
  FreeAndNil(Fatendimentos);
  inherited;
end;

procedure TChamado.Setassunto(const Value: String);
begin
  Fassunto := Value;
end;

procedure TChamado.Setatendimentos(const Value: TArrayAtendimento);
begin
  Fatendimentos := Value;
end;

procedure TChamado.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure TChamado.Setcliente(const Value: TCliente);
begin
  Fcliente := Value;
end;

procedure TChamado.Setcod_chamado(const Value: Integer);
begin
  Fcod_chamado := Value;
end;

procedure TChamado.Setcod_cliente(const Value: Integer);
begin
  Fcod_cliente := Value;
end;

procedure TChamado.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
end;

procedure TChamado.Setcod_us_cad(const Value: Integer);
begin
  Fcod_us_cad := Value;
end;

procedure TChamado.Setdata_agendamento(const Value: string);
begin
  Fdata_agendamento := Value;
end;

procedure TChamado.Setdata_atendimento(const Value: string);
begin
  Fdata_atendimento := Value;
end;

procedure TChamado.Setdata_cadastro(const Value: string);
begin
  Fdata_cadastro := Value;
end;

procedure TChamado.Setdata_temporaria(const Value: string);
begin
  Fdata_temporaria := Value;
end;

procedure TChamado.Setdiretorio_arquivo(const Value: String);
begin
  Fdiretorio_arquivo := Value;
end;

procedure TChamado.Setemail(const Value: String);
begin
  Femail := Value;
end;

procedure TChamado.Setmensagem(const Value: String);
begin
  Fmensagem := Value;
end;

procedure TChamado.Setnome(const Value: String);
begin
  Fnome := Value;
end;

procedure TChamado.Setordem_cadastro(const Value: Integer);
begin
  Fordem_cadastro := Value;
end;

procedure TChamado.Setordem_prioridade(const Value: Integer);
begin
  Fordem_prioridade := Value;
end;

procedure TChamado.Setref_cadastro(const Value: String);
begin
  Fref_cadastro := Value;
end;

procedure TChamado.Setstatus(const Value: String);
begin
  Fstatus := Value;
end;

procedure TChamado.Settelefone(const Value: String);
begin
  Ftelefone := Value;
end;

procedure TChamado.Settipo(const Value: String);
begin
  Ftipo := Value;
end;

procedure TChamado.Seturgente(const Value: Integer);
begin
  Furgente := Value;
end;

{ TAtendimento }

constructor TAtendimento.Create;
begin
  Ftipoassunto := TTipoassunto.Create;
  Ftipoproblema := TTipoProblema.Create;
//  Fhistorico_solucoes := TObjectList<THistoricoSolucoes>.Create;
end;

destructor TAtendimento.Destroy;
begin
  FreeAndNil(Ftipoassunto);
  FreeAndNil(Ftipoproblema);
  FreeAndNil(Fhistorico_solucoes);
  inherited;
end;

procedure TAtendimento.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure TAtendimento.Setcod_atendimento(const Value: Integer);
begin
  Fcod_atendimento := Value;
end;

procedure TAtendimento.Setcod_chamado(const Value: Integer);
begin
  Fcod_chamado := Value;
end;

procedure TAtendimento.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
end;

procedure TAtendimento.Setcod_solucoes(const Value: String);
begin
  Fcod_solucoes := Value;
end;

procedure TAtendimento.Setcod_tp_assunto(const Value: Integer);
begin
  Fcod_tp_assunto := Value;
end;

procedure TAtendimento.Setcod_tp_problema(const Value: Integer);
begin
  Fcod_tp_problema := Value;
end;

procedure TAtendimento.Setcod_usuario(const Value: Integer);
begin
  Fcod_usuario := Value;
end;

procedure TAtendimento.Setcolaborador(const Value: String);
begin
  Fcolaborador := Value;
end;

procedure TAtendimento.Setcontato(const Value: String);
begin
  Fcontato := Value;
end;

procedure TAtendimento.Setdata_cadastro(const Value: string);
begin
  Fdata_cadastro := Value;
end;

procedure TAtendimento.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

procedure TAtendimento.Sethistorico_solucoes(const Value: TArrayHistoricoSolucoes);
begin
  Fhistorico_solucoes := Value;
end;

procedure TAtendimento.Sethora_final(const Value: string);
begin
  Fhora_final := Value;
end;

procedure TAtendimento.Sethora_inicio(const Value: string);
begin
  Fhora_inicio := Value;
end;

procedure TAtendimento.Setref_cadastro(const Value: String);
begin
  Fref_cadastro := Value;
end;

procedure TAtendimento.Setseqmod(const Value: Integer);
begin
  Fseqmod := Value;
end;

procedure TAtendimento.Setstatus(const Value: String);
begin
  Fstatus := Value;
end;

procedure TAtendimento.Settipoassunto(const Value: TTipoassunto);
begin
  Ftipoassunto := Value;
end;

procedure TAtendimento.Settipoproblema(const Value: TTipoproblema);
begin
  Ftipoproblema := Value;
end;

procedure TAtendimento.Settp_contr(const Value: String);
begin
  Ftp_contr := Value;
end;

{ TModulo }

procedure TModulo.Setativo(const Value: Integer);
begin
  Fativo := Value;
end;

procedure TModulo.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
end;

procedure TModulo.Setcod_modulo(const Value: Integer);
begin
  Fcod_modulo := Value;
end;

procedure TModulo.Setcod_us_cad(const Value: Integer);
begin
  Fcod_us_cad := Value;
end;

procedure TModulo.Setdata_cad(const Value: string);
begin
  Fdata_cad := Value;
end;

procedure TModulo.Setdescricao(const Value: String);
begin
  Fdescricao := Value;
end;

{ TResponseInformation }

procedure TResponseInformation.Seterrocomb(const Value: String);
begin
  Ferrocomb := Value;
end;

procedure TResponseInformation.Setvalid(const Value: String);
begin
  Fvalid := Value;
end;

{ TCPessoa }

function TCPessoa.GetJSONMarshallString: string;
var
  JSONUnMarshal: TJSONUnMarshal;
  JSONMarshal: TJSONMarshal;
begin
  //metodo usando as units Data.DBXJSON

  JSONMarshal := TJSONMarshal.Create(TJSONConverter.Create);
  try
    Result := JSONMarshal.Marshal(Self).ToString;
  finally
    JSONMarshal.Free;
  end;
end;

procedure TCPessoa.Setcod(const Value: integer);
begin
  Fcod := Value;
end;

procedure TCPessoa.Setdatcad(const Value: TDateTime);
begin
  Fdatcad := Value;
end;

procedure TCPessoa.Setfone(const Value: string);
begin
  Ffone := Value;
end;

procedure TCPessoa.Setnome(const Value: string);
begin
  Fnome := Value;
end;

procedure TCPessoa.Setsalario(const Value: Double);
begin
  Fsalario := Value;
end;

end.
