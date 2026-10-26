unit SolicitacaoSaidaEstoqueZeroModel;

interface

uses
  System.Classes,
  REST.Json.Types;

type
  TCompradorSaidaEstoqueModel = class;
  TEnderecoCompradorSaidaEstoqueModel = class;

  TAuxiliarCidade = class
  private
    Fcidade: string;
    Fuf: string;
    Fibge: Integer;
  published
    property cidade: string read Fcidade write Fcidade;
    property uf: string read Fuf write Fuf;
    property ibge: Integer read Fibge write Fibge;
  end;

  TSolicitacaoSaidaEstoqueZeroModel = class(TPersistent)
  private
    FchaveNotaFiscal: string;
    FcpfOperadorResponsavel: string;
    FdataVenda: TDateTime;
    FemailEstabelecimento: string;
    FidEstoque: Int64;
    FvalorVenda: Double;
    Fcomprador: TCompradorSaidaEstoqueModel;

    [JSONMarshalledAttribute(False)]
    FhelperCidade: TAuxiliarCidade;
  published
    property chaveNotaFiscal: string read FchaveNotaFiscal write FchaveNotaFiscal;
    property cpfOperadorResponsavel: string read FcpfOperadorResponsavel write FcpfOperadorResponsavel;
    property dataVenda: TDateTime read FdataVenda write FdataVenda;
    property emailEstabelecimento: string read FemailEstabelecimento write FemailEstabelecimento;
    property idEstoque: Int64 read FidEstoque write FidEstoque;
    property valorVenda: Double read FvalorVenda write FvalorVenda;

    property comprador: TCompradorSaidaEstoqueModel read Fcomprador write Fcomprador;
    property helperCidade: TAuxiliarCidade read FhelperCidade write FhelperCidade;
  end;

  TCompradorSaidaEstoqueModel = class(TPersistent)
  private
    Femail: string;
    Fnome: string;
    FnumeroDocumento: string;
    FtipoDocumento: string;
    Fendereco: TEnderecoCompradorSaidaEstoqueModel;
  published
    property email: string read Femail write Femail;
    property nome: string read Fnome write Fnome;
    property numeroDocumento: string read FnumeroDocumento write FnumeroDocumento;
    property tipoDocumento: string read FtipoDocumento write FtipoDocumento;

    property endereco: TEnderecoCompradorSaidaEstoqueModel read Fendereco write Fendereco;
  end;

  TEnderecoCompradorSaidaEstoqueModel = class(TPersistent)
  private
    Fbairro: string;
    Fcep: string;
    FcodigoMunicipio: Integer;
    Fcomplemento: string;
    Flogradouro: string;
    Fnumero: string;
  published
    property bairro: string read Fbairro write Fbairro;
    property cep: string read Fcep write Fcep;
    property codigoMunicipio: Integer read FcodigoMunicipio write FcodigoMunicipio;
    property complemento: string read Fcomplemento write Fcomplemento;
    property logradouro: string read Flogradouro write Flogradouro;
    property numero: string read Fnumero write Fnumero;
  end;

implementation

end.
