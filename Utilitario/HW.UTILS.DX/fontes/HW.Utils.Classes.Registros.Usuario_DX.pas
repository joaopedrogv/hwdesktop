unit HW.Utils.Classes.Registros.Usuario_DX;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.Setor_DX,
  HW.Utils.Classes.Rtti;

type
  TUsuario = class(THwClassRegistros)
  private
    Fdata_ult_login: string;
    Fcod_empresa: Integer;
    Ffuncao: String;
    [THwJsonSerializer(True)]
    FSetores: TArray<TSetor>;
    Femail: String;
    Ftipo_us: String;
    Fexibir_site_inst: String;
    Fativo: Integer;
    Fcod_usuario: Integer;
    Fdata_mod: string;
    Fdata_login: string;
    Fcod_us_mod: Integer;
    Ftag_menus_excecoes: String;
    Fdata_cad: string;
    Ftoken: String;
    Fnivel: Integer;
    Fsenha: String;
    Fdir_imagem_us: String;
    Fseqmod: Integer;
    Ftag_perfil_menus: String;
    Fcod_cliente: Integer;
    Fcod_usuario_integra: Integer;
    Fchave_temp: String;
    Fnome_cliente: String;
    Fusuario: String;
  published
    property cod_usuario: Integer read Fcod_usuario write Fcod_usuario;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property nome_cliente: String read Fnome_cliente write Fnome_cliente;
    property usuario: String read Fusuario write Fusuario;
    property email: String read Femail write Femail;
    property senha: String read Fsenha write Fsenha;
    property nivel: Integer read Fnivel write Fnivel;
    property ativo: Integer read Fativo write Fativo;
    property data_cad: string read Fdata_cad write Fdata_cad;
    property data_mod: string read Fdata_mod write Fdata_mod;
    property tag_perfil_menus: String read Ftag_perfil_menus write Ftag_perfil_menus;
    property tag_menus_excecoes: String read Ftag_menus_excecoes write Ftag_menus_excecoes;
    property chave_temp: String read Fchave_temp write Fchave_temp;
    property tipo_us: String read Ftipo_us write Ftipo_us;
    property cod_usuario_integra: Integer read Fcod_usuario_integra write Fcod_usuario_integra;
    property token: String read Ftoken write Ftoken;
    property dir_imagem_us: String read Fdir_imagem_us write Fdir_imagem_us;
    property funcao: String read Ffuncao write Ffuncao;
    property exibir_site_inst: String read Fexibir_site_inst write Fexibir_site_inst;
    property cod_us_mod: Integer read Fcod_us_mod write Fcod_us_mod;
    property seqmod: Integer read Fseqmod write Fseqmod;
    property data_ult_login: string read Fdata_ult_login write Fdata_ult_login;
    property data_login: string read Fdata_login write Fdata_login;
    property Setores: TArray<TSetor> read FSetores write FSetores;// Collection
  end;

implementation

end.
