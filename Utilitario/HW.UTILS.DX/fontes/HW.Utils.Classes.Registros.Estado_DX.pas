unit HW.Utils.Classes.Registros.Estado_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type
  TEstado = class(THwClassRegistros)
  private
    Fativo: Integer;
    Fcodigo_uf: Integer;
    Fdata_mod: string;
    Fdata_cadastro: string;
    Fsigla_uf: String;
    Fnome_uf: String;
    Fibge_codigo_uf: Integer;
  published
    property codigo_uf: Integer read Fcodigo_uf write Fcodigo_uf;
    property sigla_uf: String read Fsigla_uf write Fsigla_uf;
    property nome_uf: String read Fnome_uf write Fnome_uf;
    property ibge_codigo_uf: Integer read Fibge_codigo_uf write Fibge_codigo_uf;
    property data_cadastro: string read Fdata_cadastro write Fdata_cadastro;
    property data_mod: string read Fdata_mod write Fdata_mod;
    property ativo: Integer read Fativo write Fativo;
  end;

implementation

end.
