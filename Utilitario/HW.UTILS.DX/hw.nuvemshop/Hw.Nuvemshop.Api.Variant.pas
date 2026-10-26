unit Hw.Nuvemshop.Api.Variant;

interface

uses
  System.Contnrs, System.Generics.Collections;

type

  TValues = class
  private
    FPt: string;
    FEn: string;
  published
    property Pt: string read FPt write FPt;
    property En: string read FEn write FEn;
  end;

  TVariant = class
  private
    FId: Integer;
    FPrice: string;
    FProductId: Integer;
    FPromotionalPrice: string;
    FSku: string;
    FStock: Integer;
    FStockManagement: Boolean;
    FValuesArray: TArray<TValues>;
    FValues: TArray<TValues>;
    FHeight: string;
    FWeight: string;
    FWidth: string;
    FDepth: string;
    Fcod_grade_temp: Integer;
  published
    property Id: Integer read FId write FId;
    property Price: string read FPrice write FPrice;
    property ProductId: Integer read FProductId write FProductId;
    property PromotionalPrice: string read FPromotionalPrice write FPromotionalPrice;
    property Sku: string read FSku write FSku;
    property Stock: Integer read FStock write FStock;
    property StockManagement: Boolean read FStockManagement write FStockManagement;
    property Values: TArray<TValues> read FValues write FValues;
    property Weight: string read FWeight write FWeight;
    property Dept: string read FDepth write FDepth;
    property Width: string read FWidth write FWidth;
    property Height: string read FHeight write FHeight;
    property cod_grade_temp: Integer read Fcod_grade_temp write Fcod_grade_temp;
  end;

  TVariantHw = class(TVariant)
  private
    Fsel: string;
    Fgrupo_prod: Integer;
    Fcod_prod: string;
    Fcod_grade: Integer;
    Fdescricao: string;
    Fdescricao1: string;
    Ftipo_ec: string;
    Fdescricao_ec: string;
    Ftipo_ec1: string;
    Fdescricao_ec1: string;
    Fid_commerce: Integer;
  published
    property sel: string read Fsel write Fsel;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: string read Fcod_prod write Fcod_prod;
    property cod_grade: Integer read Fcod_grade write Fcod_grade;
    property descricao: string read Fdescricao write Fdescricao;
    property descricao1: string read Fdescricao1 write Fdescricao1;
    property tipo_ec: string read Ftipo_ec write Ftipo_ec;
    property descricao_ec: string read Fdescricao_ec write Fdescricao_ec;
    property tipo_ec1: string read Ftipo_ec1 write Ftipo_ec1;
    property descricao_ec1: string read Fdescricao_ec1 write Fdescricao_ec1;
    property id_commerce: Integer read Fid_commerce write Fid_commerce;
  end;

  TVariant2 = class(TVariant)
  private
    Ftipo_ec: string;
    Fdescricao_ec: string;
    Ftipo_ec1: string;
    Fdescricao_ec1: string;
  public
    property tipo_ec: string read Ftipo_ec write Ftipo_ec;
    property descricao_ec: string read Fdescricao_ec write Fdescricao_ec;
    property tipo_ec1: string read Ftipo_ec1 write Ftipo_ec1;
    property descricao_ec1: string read Fdescricao_ec1 write Fdescricao_ec1;
  end;

  TVariantHw2 = class(TVariant2)
  private
    Fsel: string;
    Fgrupo_prod: Integer;
    Fcod_prod: string;
    Fcod_grade: Integer;
    Fdescricao: string;
    Fdescricao1: string;
    Fid_commerce: Integer;
    Fgr_adicionadas: Integer;
  published
    property sel: string read Fsel write Fsel;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: string read Fcod_prod write Fcod_prod;
    property cod_grade: Integer read Fcod_grade write Fcod_grade;
    property descricao: string read Fdescricao write Fdescricao;
    property descricao1: string read Fdescricao1 write Fdescricao1;
    property id_commerce: Integer read Fid_commerce write Fid_commerce;
    property gr_adicionadas: Integer read Fgr_adicionadas write Fgr_adicionadas;
  end;

implementation

end.
