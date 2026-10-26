unit hw.utilis.migracao.registro.Solicitacao;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.Usuario_DX,
  REST.Json.Types;

type
  TClienteSolicitacaoSC = class(THwClassRegistros)
  private
    Fcod_empresa: Integer;
    //Fcod_us_solic: Integer;
    Fdata_criacao: string;
    Fcod_us_cad: Integer;
    Fcod_solicitacao: Integer;
    Fcod_cl_solic: Integer;
  published
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_solicitacao: Integer read Fcod_solicitacao write Fcod_solicitacao;
    property cod_cl_solic: Integer read Fcod_cl_solic write Fcod_cl_solic;
    //property cod_us_solic: Integer read Fcod_us_solic write Fcod_us_solic;
    property data_criacao: string read Fdata_criacao write Fdata_criacao;
    property cod_us_cad: Integer read Fcod_us_cad write Fcod_us_cad;
    //property cliente_solic: TCliente read Fcliente_solic write Fcliente_solic;
    //property solicitacao: TSolicitacaoSC read Fsolicitacao write Fsolicitacao;
    //property criado_por: TUsuario read Fcriado_por write Fcriado_por;
    //property usuario_solic: TUsuario read Fusuario_solic write Fusuario_solic;
  end;

  TModulo = class(THwClassRegistros)
  private
    Fcod_empresa: Integer;
    Fativo: Integer;
    Fdescricao: String;
    Fcod_modulo: Integer;
    Fdata_cad: string;
    Fcod_us_cad: Integer;
  published
    property cod_modulo: Integer read Fcod_modulo write Fcod_modulo;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property ativo: Integer read Fativo write Fativo;
    property descricao: String read Fdescricao write Fdescricao;
    property cod_us_cad: Integer read Fcod_us_cad write Fcod_us_cad;
    property data_cad: string read Fdata_cad write Fdata_cad;
  end;

  TAssunto = class(THwClassRegistros)
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
  published
    property cod_tp_assunto: Integer read Fcod_tp_assunto write Fcod_tp_assunto;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property descricao: String read Fdescricao write Fdescricao;
    property ativo: Integer read Fativo write Fativo;
    property data_cadastro: string read Fdata_cadastro write Fdata_cadastro;
    property cod_us_cad: Integer read Fcod_us_cad write Fcod_us_cad;
    property curva: String read Fcurva write Fcurva;
    property data_curva: string read Fdata_curva write Fdata_curva;
    property seqmod: Integer read Fseqmod write Fseqmod;
  end;

  TSolicitacaoSC = class(THwClassRegistros)
  private
    Fprioridade: Integer;
    Fcod_empresa: Integer;
    Fclientes: TArray<TClienteSolicitacaoSC>;
    Fpeso: Integer;
    Ftitulo: String;
    Fcriado_por: TUsuario;
    Fpeso_contrato: Integer;
    Frelease: String;
    Fativo: Boolean;
    Fcod_assunto: Integer;
    Fpeso_tempo_reg: Integer;
    Fdescricao: String;
    Fcod_modulo: Integer;
    Fcod_estagio: Integer;
    Fdata_status_mod: string;
    Fstatus: Integer;
    Fpeso_tipo: Integer;
    Finfo_comp: String;
    Fdata_criacao: string;
    Fcod_us_cad: Integer;
    Fcod_solicitacao: Integer;
    Fpeso_prioridade: Integer;
    Fcod_cliente: Integer;
    Fult_hist_estg_resp: String;
    Fpeso_curva: Integer;
    Fmensagem: String;
    Fassunto: TAssunto;
    Ftipo: Integer;
    Fmodulo: TModulo;
    [JSONMarshalledAttribute(False)]
    FAdvertencia_Assunto: Boolean;
    [JSONMarshalledAttribute(False)]
    FAdvertencia_Modulo: Boolean;
    [JSONMarshalledAttribute(False)]
    FNomeCliente: string;
  published
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property cod_solicitacao: Integer read Fcod_solicitacao write Fcod_solicitacao;
    property data_criacao: string read Fdata_criacao write Fdata_criacao;
    property tipo: Integer read Ftipo write Ftipo;
    property status: Integer read Fstatus write Fstatus;
    property titulo: String read Ftitulo write Ftitulo;
    property descricao: String read Fdescricao write Fdescricao;
    property prioridade: Integer read Fprioridade write Fprioridade;
    property ativo: Boolean read Fativo write Fativo;
    property mensagem: String read Fmensagem write Fmensagem;
    property data_status_mod: string read Fdata_status_mod write Fdata_status_mod;
    property release: String read Frelease write Frelease;
    property info_comp: String read Finfo_comp write Finfo_comp;
    property cod_estagio: Integer read Fcod_estagio write Fcod_estagio;
    property cod_us_cad: Integer read Fcod_us_cad write Fcod_us_cad;
    property cod_modulo: Integer read Fcod_modulo write Fcod_modulo;
    property cod_assunto: Integer read Fcod_assunto write Fcod_assunto;
    property peso_tipo: Integer read Fpeso_tipo write Fpeso_tipo;
    property peso_prioridade: Integer read Fpeso_prioridade write Fpeso_prioridade;
    property peso_contrato: Integer read Fpeso_contrato write Fpeso_contrato;
    property peso_curva: Integer read Fpeso_curva write Fpeso_curva;
    property peso_tempo_reg: Integer read Fpeso_tempo_reg write Fpeso_tempo_reg;
    property peso: Integer read Fpeso write Fpeso;
    property modulo: TModulo read Fmodulo write Fmodulo;// class
    property assunto: TAssunto read Fassunto write Fassunto;// class
    property criado_por: TUsuario read Fcriado_por write Fcriado_por;// class
    property clientes: TArray<TClienteSolicitacaoSC> read Fclientes write Fclientes;// Collection
    //property anexos: TArray<TAnexo> read Fanexos write Fanexos;// Collection
    //property historico_status: TArray<THistoricoStatu> read Fhistorico_status write Fhistorico_status;// Collection
    //property historico_estagio: TArray<THistoricoEstagio> read Fhistorico_estagio write Fhistorico_estagio;// Collection
    //property estagio As read F write F;// class
    //property ult_hist_estg: TUltHistEstg read Fult_hist_estg write Fult_hist_estg;// class
    property ult_hist_estg_resp: String read Fult_hist_estg_resp write Fult_hist_estg_resp;
    property Advertencia_Assunto: Boolean read FAdvertencia_Assunto write FAdvertencia_Assunto;
    property Advertencia_Modulo: Boolean read FAdvertencia_Modulo write FAdvertencia_Modulo;
    property NomeCliente: string read FNomeCliente write FNomeCliente;
  end;


implementation



end.
