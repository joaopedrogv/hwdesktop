unit PessoaJuridica;

interface

type
  TPessoaJuridica = class
  private
    Fuf: string;
    Fcep: string;
    Fcnpj: string;
    Fbairro: string;
    Fnumero: string;
    Fmunicipio: string;
    Flogradouro: string;
    Fcomplemento: string;
    Frazao_social: string;
    Fnome_fantasia: string;
    Fcodigo_municipio_ibge: Integer;
  public
    property uf: string read Fuf write Fuf;
    property cep: string read Fcep write Fcep;
    property cnpj: string read Fcnpj write Fcnpj;
    property bairro: string read Fbairro write Fbairro;
    property numero: string read Fnumero write Fnumero;
    property municipio: string read Fmunicipio write Fmunicipio;
    property logradouro: string read Flogradouro write Flogradouro;
    property complemento: string read Fcomplemento write Fcomplemento;
    property razao_social: string read Frazao_social write Frazao_social;
    property nome_fantasia: string read Fnome_fantasia write Fnome_fantasia;
    property codigo_municipio_ibge: Integer read Fcodigo_municipio_ibge write Fcodigo_municipio_ibge;
  end;

implementation

end.
