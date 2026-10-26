unit Hw.Nuvemshop.Api.Product;

interface

uses
  HW.Nuvemshop.Api.Url,
  HW.Nuvemshop.Api.Image,
  Hw.Nuvemshop.Api.Variant,
  Hw.Nuvemshop.Api.Category;

type
  {TSeoDescription = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  TSeoTitle = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  THandle = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;  }

  TAttributesNuvemshop = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  TDescription = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  TName = class
  private
    FPt: string;
  published
    property Pt: string read FPt write FPt;
  end;

  TProduct = class
  private
    FId: Integer;
    Fname_product: string;
    Ftipoec: string;
    Ftipoec1: string;
    FName: TName;
    FDescription: TDescription;
    FBrand: string;
    Fhas_variation: string;
    Fhas_image: string;
    FPublished: Boolean;
    FFreeShipping: Boolean;
    FRequiresShipping: Boolean;
    FCanonical_url: string;
    FVariants: TArray<TVariant>;
    FCategories: TArray<TCategory>;
    FImages: TArray<TImagesNuvemshop>;
    FAttributes: TArray<TAttributesNuvemshop>;
  published
    property Id: Integer read FId write FId;
    property name_product: string read Fname_product write Fname_product;
    property tipoec: string read Ftipoec write Ftipoec;
    property tipoec1: string read Ftipoec1 write Ftipoec1;
    property Name: TName read FName write FName;
    property Description: TDescription read FDescription write FDescription;
    property Brand: string read FBrand write FBrand;
    property has_variation: string read Fhas_variation write Fhas_variation;
    property has_image: string read Fhas_image write Fhas_image;
    property Published: Boolean read FPublished write FPublished;
    property FreeShipping: Boolean read FFreeShipping write FFreeShipping;
    property RequiresShipping: Boolean read FRequiresShipping write FRequiresShipping;
    property Canonical_url: string read FCanonical_url write FCanonical_url;
    property Variants: TArray<TVariant> read FVariants write FVariants;// Collection
    property Categories: TArray<TCategory> read FCategories write FCategories;// Collection
    property Images: TArray<TImagesNuvemshop> read FImages write FImages;// Collection
    property Attributes: TArray<TAttributesNuvemshop> read FAttributes write FAttributes;// Collection
  end;

  TProductHw = class(TProduct)
  private
    Fsel: string;
    Fgrupo_prod: Integer;
    Fcod_prod: string;
    Fnum_fab_prod: string;
    Fdescr_prod: string;
    Fdescr_prod_res: string;
    Ftipo_ec: string;
    Ftipo_ec1: string;
    Faltura_prod: Double;
    Fcomprimento_prod: Double;
    Flargura_prod: Double;
    Fpeso_brut_prod: Double;
    Fpeso_liq_prod: Double;
    Fid_commerce: Integer;
    Fname_commerce: string;
    Ftem_imagem: Integer;
    Ftem_grade: Integer;
    Fhw_image_url: TArray<TUrl>;
    Fhw_image_local: TArray<TUrl>;
    Fhw_image: string;
  published
    property sel: string read Fsel write Fsel;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: string read Fcod_prod write Fcod_prod;
    property num_fab_prod: string read Fnum_fab_prod write Fnum_fab_prod;
    property descr_prod: string read Fdescr_prod write Fdescr_prod;
    property tipo_ec: string read Ftipo_ec write Ftipo_ec;
    property tipo_ec1: string read Ftipo_ec1 write Ftipo_ec1;
    property altura_prod: Double read Faltura_prod write Faltura_prod;
    property comprimento_prod: Double read Fcomprimento_prod write Fcomprimento_prod;
    property largura_prod: Double read Flargura_prod write Flargura_prod;
    property peso_brut_prod: Double read Fpeso_brut_prod write Fpeso_brut_prod;
    property peso_liq_prod: Double read Fpeso_liq_prod write Fpeso_liq_prod;
    property id_commerce: Integer read Fid_commerce write Fid_commerce;
    property descr_prod_res: string read Fdescr_prod_res write Fdescr_prod_res;
    property name_commerce: string read Fname_commerce write Fname_commerce;
    property tem_imagem: Integer read Ftem_imagem write Ftem_imagem;
    property tem_grade: Integer read Ftem_grade write Ftem_grade;
    property hw_image: string read Fhw_image write Fhw_image;
    property hw_image_local: TArray<TUrl> read Fhw_image_local write Fhw_image_local;
    property hw_image_url: TArray<TUrl> read Fhw_image_url write Fhw_image_url;
  end;

  TProductMescladaHw = class(TProduct)
  private
    Fsel: string;
    Fgrupo_prod: Integer;
    Fcod_prod: string;
    Fnum_fab_prod: string;
    Fdescr_prod: string;
    Findex: Integer;
  published
    property sel: string read Fsel write Fsel;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: string read Fcod_prod write Fcod_prod;
    property num_fab_prod: string read Fnum_fab_prod write Fnum_fab_prod;
    property descr_prod: string read Fdescr_prod write Fdescr_prod;
    property index: Integer read Findex write Findex;
  end;

  TKitsProdHw = class(TProduct)
  private
    Fsel: string;
    Fcodigo_kit: Integer;
    Fdescricao_kit: string;
    Fid_commerce: Integer;
    Fcod_categoria: Integer;
    Fcategory_name: string;
    //Fhw_image_url: TArray<TUrl>;
    //Fhw_image_local: TArray<TUrl>;
    Fhw_image: string;
  published
    property sel: string read Fsel write Fsel;
    property codigo_kit: Integer read Fcodigo_kit write Fcodigo_kit;
    property descricao_kit: string read Fdescricao_kit write Fdescricao_kit;
    property id_commerce: Integer read Fid_commerce write Fid_commerce;
    property cod_categoria: Integer read Fcod_categoria write Fcod_categoria;
    property category_name: string read Fcategory_name write Fcategory_name;
    property hw_image: string read Fhw_image write Fhw_image;
    //property hw_image_local: TArray<TUrl> read Fhw_image_local write Fhw_image_local;
    //property hw_image_url: TArray<TUrl> read Fhw_image_url write Fhw_image_url;
  end;

implementation

uses
  System.Generics.Collections;

end.
