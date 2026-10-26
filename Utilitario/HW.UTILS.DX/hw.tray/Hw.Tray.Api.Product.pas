unit Hw.Tray.Api.Product;

interface

uses
  Hw.Tray.Api.AdditionalInfo,
  HW.Tray.Api.Image,
  Hw.Tray.Api.PaymentOptionDetail,
  Hw.Tray.Api.Property_,
  HW.Tray.Api.Url,
  Hw.Tray.Api.Variant;

type
  TMetatag = class
  private
    Ftype: string;
    Fcontent: string;
  published
    property type_: string read Ftype write Ftype;
    property content: string read Fcontent write Fcontent;
  end;

  TProduct = class
  private
    Fpayment_option: string;
    Flength: string;
    Fstock: string;
    Fname: string;
    Fmodified: string;
    Fhot: string;
    Fhas_variation: string;
    Fhas_image: string;
    FAdditionalInfos: TArray<TAdditionalInfo>;
    Fslug: string;
    FVariant: TArray<TVariant>;
    Frelease: string;
    Fprice: string;
    Fwidth: string;
    Fmodel: string;
    Fstart_promotion: string;
    Fminimum_stock: string;
    Frelated_categories: TArray<string>;
    Fcount_rating: string;
    Fdollar_cost_price: string;
    Fdeactivation_date: string;
    Fis_kit: string;
    Fmetatag: TArray<TMetatag>;
    Fid_campaign: string;
    Favailable_for_purchase: string;
    Fcreated: string;
    Frating: string;
    Fpromotional_price: string;
    Fid: string;
    FProductImage: TArray<TImageTray>;
    Ffree_shipping: string;
    Fminimum_stock_alert: string;
    Fncm: string;
    Fupon_request: string;
    Factivation_date: string;
    Fall_categories: TArray<string>;
    Fshortcut: string;
    Fpayment_option_details: TArray<TPaymentOptionDetail>;
    Fquantity_sold: string;
    Fadditional_button: string;
    Fvirtual_product: string;
    Fweight: string;
    Fend_promotion: string;
    FProperties: TArray<TProperty>;
    Fkit_has_variation: string;
    Fbrand: string;
    Fcategory_id: string;
    Furl: TUrl;
    Favailable: string;
    Fheight: string;
    Fbrand_id: string;
    Fean: string;
    Fvideo: string;
    Freference: string;
    Fpayment_option_html: string;
    Fcost_price: string;
    Frelease_date: string;
    Favailability: string;
    Fdescription: string;
    Ftipoec: string;
    Ftipoec1: string;
  published
    property modified: string read Fmodified write Fmodified;
    property ean: string read Fean write Fean;
    property is_kit: string read Fis_kit write Fis_kit;
    property slug: string read Fslug write Fslug;
    property ncm: string read Fncm write Fncm;
    property activation_date: string read Factivation_date write Factivation_date;
    property deactivation_date: string read Fdeactivation_date write Fdeactivation_date;
    property id: string read Fid write Fid;
    property name: string read Fname write Fname;
    property description: string read Fdescription write Fdescription;
    property price: string read Fprice write Fprice;
    property cost_price: string read Fcost_price write Fcost_price;
    property dollar_cost_price: string read Fdollar_cost_price write Fdollar_cost_price;
    property promotional_price: string read Fpromotional_price write Fpromotional_price;
    property start_promotion: string read Fstart_promotion write Fstart_promotion;
    property end_promotion: string read Fend_promotion write Fend_promotion;
    property brand: string read Fbrand write Fbrand;
    property brand_id: string read Fbrand_id write Fbrand_id;
    property model: string read Fmodel write Fmodel;
    property weight: string read Fweight write Fweight;
    property length: string read Flength write Flength;
    property width: string read Fwidth write Fwidth;
    property height: string read Fheight write Fheight;
    property stock: string read Fstock write Fstock;
    property category_id: string read Fcategory_id write Fcategory_id;
    property available: string read Favailable write Favailable;
    property availability: string read Favailability write Favailability;
    property reference: string read Freference write Freference;
    property hot: string read Fhot write Fhot;
    property release: string read Frelease write Frelease;
    property additional_button: string read Fadditional_button write Fadditional_button;
    property has_variation: string read Fhas_variation write Fhas_variation;
    property has_image: string read Fhas_image write Fhas_image;
    property rating: string read Frating write Frating;
    property count_rating: string read Fcount_rating write Fcount_rating;
    property quantity_sold: string read Fquantity_sold write Fquantity_sold;
    property url: TUrl read Furl write Furl;// class
    property created: string read Fcreated write Fcreated;
    property Properties: TArray<TProperty> read FProperties write FProperties;// Collection
    property payment_option: string read Fpayment_option write Fpayment_option;
    property payment_option_details: TArray<TPaymentOptionDetail> read Fpayment_option_details write Fpayment_option_details;// Collection
    property related_categories: TArray<string> read Frelated_categories write Frelated_categories;// Collection
    property release_date: string read Frelease_date write Frelease_date;
    property shortcut: string read Fshortcut write Fshortcut;
    property virtual_product: string read Fvirtual_product write Fvirtual_product;
    property minimum_stock: string read Fminimum_stock write Fminimum_stock;
    property minimum_stock_alert: string read Fminimum_stock_alert write Fminimum_stock_alert;
    property free_shipping: string read Ffree_shipping write Ffree_shipping;
    property video: string read Fvideo write Fvideo;
    property metatag: TArray<TMetatag> read Fmetatag write Fmetatag;// Collection
    property payment_option_html: string read Fpayment_option_html write Fpayment_option_html;
    property upon_request: string read Fupon_request write Fupon_request;
    property available_for_purchase: string read Favailable_for_purchase write Favailable_for_purchase;
    property all_categories: TArray<string> read Fall_categories write Fall_categories;// Collection
    property AdditionalInfos: TArray<TAdditionalInfo> read FAdditionalInfos write FAdditionalInfos;// Collection
    property ProductImage: TArray<TImageTray> read FProductImage write FProductImage;// Collection
    property id_campaign: string read Fid_campaign write Fid_campaign;
    property kit_has_variation: string read Fkit_has_variation write Fkit_has_variation;
    property Variant: TArray<TVariant> read FVariant write FVariant;// Collection
    property tipoec: string read Ftipoec write Ftipoec;
    property tipoec1: string read Ftipoec1 write Ftipoec1;
  end;

  TProductHw = class(TProduct)
  private
    Fsel: string;
    Fgrupo_prod: Integer;
    Fcod_prod: string;
    Fnum_fab_prod: string;
    Fdescr_prod: string;
    Fcodigo_kit: Integer;
    Fdescricao_kit: string;
    Ftipo_ec: string;
    Ftipo_ec1: string;
    Faltura_prod: Double;
    Fcomprimento_prod: Double;
    Flargura_prod: Double;
    Fpeso_brut_prod: Double;
    Fpeso_liq_prod: Double;
    Fid_commerce: Integer;
    Fcod_categoria: Integer;
    Ftem_grade: Integer;
    Fcategory_name: string;
    Fhw_image_url: TArray<TUrl>;
    Fhw_image_local: TArray<TUrl>;
    Fhw_image: string;
  published
    property sel: string read Fsel write Fsel;
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: string read Fcod_prod write Fcod_prod;
    property num_fab_prod: string read Fnum_fab_prod write Fnum_fab_prod;
    property descr_prod: string read Fdescr_prod write Fdescr_prod;

    property codigo_kit: Integer read Fcodigo_kit write Fcodigo_kit;
    property descricao_kit: string read Fdescricao_kit write Fdescricao_kit;

    property tipo_ec: string read Ftipo_ec write Ftipo_ec;
    property tipo_ec1: string read Ftipo_ec1 write Ftipo_ec1;

    property altura_prod: Double read Faltura_prod write Faltura_prod;
    property comprimento_prod: Double read Fcomprimento_prod write Fcomprimento_prod;
    property largura_prod: Double read Flargura_prod write Flargura_prod;
    property peso_brut_prod: Double read Fpeso_brut_prod write Fpeso_brut_prod;
    property peso_liq_prod: Double read Fpeso_liq_prod write Fpeso_liq_prod;

    property id_commerce: Integer read Fid_commerce write Fid_commerce;
    property cod_categoria: Integer read Fcod_categoria write Fcod_categoria;
    property tem_grade: Integer read Ftem_grade write Ftem_grade;
    property category_name: string read Fcategory_name write Fcategory_name;
    property hw_image: string read Fhw_image write Fhw_image;
    property hw_image_local: TArray<TUrl> read Fhw_image_local write Fhw_image_local;
    property hw_image_url: TArray<TUrl> read Fhw_image_url write Fhw_image_url;
  end;

  TKitsProdHw = class(TProduct)
  private
    Fsel: string;
    Fcodigo_kit: Integer;
    Fdescricao_kit: string;
    Fid_commerce: Integer;
    Fcod_categoria: Integer;
    Fcategory_name: string;
    Fhw_image_url: TArray<TUrl>;
    Fhw_image_local: TArray<TUrl>;
    Fhw_image: string;
  published
    property sel: string read Fsel write Fsel;
    property codigo_kit: Integer read Fcodigo_kit write Fcodigo_kit;
    property descricao_kit: string read Fdescricao_kit write Fdescricao_kit;
    property id_commerce: Integer read Fid_commerce write Fid_commerce;
    property cod_categoria: Integer read Fcod_categoria write Fcod_categoria;
    property category_name: string read Fcategory_name write Fcategory_name;
    property hw_image: string read Fhw_image write Fhw_image;
    property hw_image_local: TArray<TUrl> read Fhw_image_local write Fhw_image_local;
    property hw_image_url: TArray<TUrl> read Fhw_image_url write Fhw_image_url;
  end;

implementation

end.
