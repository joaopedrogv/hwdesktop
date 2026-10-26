unit Hw.Tray.Api.Kit;

interface

uses
  HW.Tray.Api.Image,
  HW.Tray.Api.Url,
  Hw.Tray.Api.PaymentOptionDetail;
  //REST.Json.Types;
//  ver se vai ser necessario isso acima o att name

type

  TProductVariantKit = class
  private
    Fvariant_id: string;
    Fproduct_kit_id: string;
    Fprice: string;
  public
    property variant_id: string read Fvariant_id write Fvariant_id;
    property product_kit_id: string read Fproduct_kit_id write Fproduct_kit_id;
    property price: string read Fprice write Fprice;
  end;

  TProductKit = class
  private
    Fid: string;
    Fproduct_parent_id: string;
    Fproduct_id: string;
    Fproduct_name: string;
    Fproduct_has_variation: string;
    Fquantity: string;
    Fprice: string;
    Fprice_rule: string;
    Fdiscount_type: string;
    Fdiscount_value: string;
    Fbrand: string;
    Fwarranty: string;
    Favailability_days: string;
    FProductVariantKit: TArray<TProductVariantKit>;
  public
    property id: string read Fid write Fid;
    property product_parent_id: string read Fproduct_parent_id write Fproduct_parent_id;
    property product_id: string read Fproduct_id write Fproduct_id;
    property product_name: string read Fproduct_name write Fproduct_name;
    property product_has_variation: string read Fproduct_has_variation write Fproduct_has_variation;
    property quantity: string read Fquantity write Fquantity;
    property price: string read Fprice write Fprice;
    property price_rule: string read Fprice_rule write Fprice_rule;
    property discount_type: string read Fdiscount_type write Fdiscount_type;
    property discount_value: string read Fdiscount_value write Fdiscount_value;
    property brand: string read Fbrand write Fbrand;
    property warranty: string read Fwarranty write Fwarranty;
    property availability_days: string read Favailability_days write Favailability_days;
    property ProductVariantKit: TArray<TProductVariantKit> read FProductVariantKit write FProductVariantKit;// Collection
  end;

  TProductKitHw = class(TProductKit)
  private
    Fsel: string;
    Fcodigo_kit: Integer;
    Fgrupo_prod: Integer;
    Fcod_prod: string;
    Fdescr_prod: string;
    Fnum_fab_prod: string;
    Fdescr_prod_kit: string;
    Fquant_prod_kit: Double;
    Ftem_grade: Integer;
    Fid_commerce: Integer;
    Fid_commerce_prod: Integer;
  public
    property sel: string read Fsel write Fsel;
    property codigo_kit: Integer read Fcodigo_kit write Fcodigo_kit;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: string read Fcod_prod write Fcod_prod;
    property num_fab_prod: string read Fnum_fab_prod write Fnum_fab_prod;
    property descr_prod: string read Fdescr_prod write Fdescr_prod;
    property descr_prod_kit: string read Fdescr_prod_kit write Fdescr_prod_kit;
    property quant_prod_kit: Double read Fquant_prod_kit write Fquant_prod_kit;
    property tem_grade: Integer read Ftem_grade write Ftem_grade;
    property id_commerce: Integer read Fid_commerce write Fid_commerce;
    property id_commerce_prod: Integer read Fid_commerce_prod write Fid_commerce_prod;
  end;

implementation

end.
