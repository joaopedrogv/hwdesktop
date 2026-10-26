unit HW.Utils.Classes.Registros.Cliente_DX;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.Cidade_DX,
  HW.Utils.Classes.Registros.Estado_DX;

type
  TCliente = class(THwClassRegistros)
  private
    Fibge_cod_cidade: Integer;
    Fcnpjintegra: String;
    Fcod_empresa: Integer;
    Fdias_vencch: Integer;
    Fcod_ambiente: Integer;
    Fexibir_parceiro: String;
    Fcnpj: String;
    Fccidade: TCidade;
    Fgrupo_parceria: Integer;
    Femail: String;
    Fbairro: String;
    Ffax: String;
    Fcestado: TEstado;
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
    Fpermissoes_atend: String;
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
  published
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property nome: String read Fnome write Fnome;
    property razao: String read Frazao write Frazao;
    property cnpj: String read Fcnpj write Fcnpj;
    property cep: String read Fcep write Fcep;
    property endereco: String read Fendereco write Fendereco;
    property bairro: String read Fbairro write Fbairro;
    property ccidade: TCidade read Fccidade write Fccidade;// class
    property cestado: TEstado read Fcestado write Fcestado;// class
    property cidade: String read Fcidade write Fcidade;
    property cod_cidade: Integer read Fcod_cidade write Fcod_cidade;
    property data_cadastro: string read Fdata_cadastro write Fdata_cadastro;
    property data_mod: string read Fdata_mod write Fdata_mod;
    property email: String read Femail write Femail;
    property qtde_copias: Integer read Fqtde_copias write Fqtde_copias;
    property ativo: Integer read Fativo write Fativo;
    property codigo_uf: Integer read Fcodigo_uf write Fcodigo_uf;
    property fone_cliente: String read Ffone_cliente write Ffone_cliente;
    property url_cliente: String read Furl_cliente write Furl_cliente;
    property diretorio_img: String read Fdiretorio_img write Fdiretorio_img;
    property exibir_parceiro: String read Fexibir_parceiro write Fexibir_parceiro;
    property grupo_parceria: Integer read Fgrupo_parceria write Fgrupo_parceria;
    property cod_faturamento: Integer read Fcod_faturamento write Fcod_faturamento;
    property tipo_cl: String read Ftipo_cl write Ftipo_cl;
    property cod_cl_parc: Integer read Fcod_cl_parc write Fcod_cl_parc;
    property cod_cl_integra: Integer read Fcod_cl_integra write Fcod_cl_integra;
    property cod_ambiente: Integer read Fcod_ambiente write Fcod_ambiente;
    property cod_us_cad: Integer read Fcod_us_cad write Fcod_us_cad;
    property codigo_swhw: Integer read Fcodigo_swhw write Fcodigo_swhw;
    property num_end_cliente: String read Fnum_end_cliente write Fnum_end_cliente;
    property insc_est: String read Finsc_est write Finsc_est;
    property dias_vencch: Integer read Fdias_vencch write Fdias_vencch;
    property cnpjintegra: String read Fcnpjintegra write Fcnpjintegra;
    property cod_us_mod: Integer read Fcod_us_mod write Fcod_us_mod;
    property seqmod: Integer read Fseqmod write Fseqmod;
    property ibge_cod_cidade: Integer read Fibge_cod_cidade write Fibge_cod_cidade;
    property ibge_codigo_uf: Integer read Fibge_codigo_uf write Fibge_codigo_uf;
    property permissoes_atend: String read Fpermissoes_atend write Fpermissoes_atend;
    property fax: String read Ffax write Ffax;
    property release_disponivel: String read Frelease_disponivel write Frelease_disponivel;
    property contrato_ativo: String read Fcontrato_ativo write Fcontrato_ativo;
    property acao_webhistped_atv: String read Facao_webhistped_atv write Facao_webhistped_atv;
  end;

implementation

end.
