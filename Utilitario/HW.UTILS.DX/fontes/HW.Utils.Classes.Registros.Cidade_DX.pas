unit HW.Utils.Classes.Registros.Cidade_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type
  TCidade = class(THwClassRegistros)
  private
    Fibge_cod_cidade: Integer;
    Fativo: Integer;
    Fdata_mod: string;
    Fcod_cidade: Integer;
    Fdata_cadastro: string;
    Fnome_cidade: String;
    Fibge_cod_uf: Integer;
  published
    property cod_cidade: Integer read Fcod_cidade write Fcod_cidade;
    property nome_cidade: String read Fnome_cidade write Fnome_cidade;
    property ibge_cod_cidade: Integer read Fibge_cod_cidade write Fibge_cod_cidade;
    property data_cadastro: string read Fdata_cadastro write Fdata_cadastro;
    property data_mod: string read Fdata_mod write Fdata_mod;
    property ibge_cod_uf: Integer read Fibge_cod_uf write Fibge_cod_uf;
    property ativo: Integer read Fativo write Fativo;
  end;

implementation

end.
