unit Hw.Tray.Api.Brand;

interface

type

  TBrand = class
  private
    Fslug: string;
    Fid: string;
    Fbrand: string;
  published
    property id: string read Fid write Fid;
    property slug: string read Fslug write Fslug;
    property brand: string read Fbrand write Fbrand;
  end;

  TBrandHw = class(TBrand)
  private
    Fsel: string;
    Fcod_marca: Integer;
    Fdescricao_marca: string;
    Fid_commerce: Integer;
  published
    property sel: string read Fsel write Fsel;
    property cod_marca: Integer read Fcod_marca write Fcod_marca;
    property descricao_marca: string read Fdescricao_marca write Fdescricao_marca;
    property id_commerce: Integer read Fid_commerce write Fid_commerce;
  end;

implementation

end.
