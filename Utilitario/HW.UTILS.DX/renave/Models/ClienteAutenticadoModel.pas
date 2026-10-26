unit ClienteAutenticadoModel;

interface

uses
  System.Classes;

type

  TEnderecoModel = class(TPersistent)
  private
    Fbairro: string;
    Fcep: string;
    Fcomplemento: string;
    Flogradouro: string;
    Fmunicipio: string;
    Fnumero: string;
  published
    property bairro: string read Fbairro write Fbairro;
    property cep: string read Fcep write Fcep;
    property complemento: string read Fcomplemento write Fcomplemento;
    property logradouro: string read Flogradouro write Flogradouro;
    property municipio: string read Fmunicipio write Fmunicipio;
    property numero: string read Fnumero write Fnumero;
  end;


  TClienteAutenticadoModel = class(TPersistent)
  private
    Fcnpj: string;
    Fendereco: TEnderecoModel;
    Fnome: string;
  published
    property nome: string read Fnome write Fnome;
    property cnpj: string read Fcnpj write Fcnpj;
    property endereco: TEnderecoModel read Fendereco write Fendereco;
  end;

implementation

end.
