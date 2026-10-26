unit Hw.Tray.Api.Variant;

interface

uses
  HW.Tray.Api.Image,
  HW.Tray.Api.Url,
  Hw.Tray.Api.PaymentOptionDetail;
  //REST.Json.Types;
//  ver se vai ser necessario isso acima o att name

type

  TSku = class
  private
    //[JSONNameAttribute('TicketID')]
    Ftype: string;
    Fimage: string;
    Fimage_secure: string;
    Fvalue: string;
  published
    property type_: string read Ftype write Ftype;
    property value: string read Fvalue write Fvalue;
    property image: string read Fimage write Fimage;
    property image_secure: string read Fimage_secure write Fimage_secure;
  end;

  TVariant = class
  private
    Fpayment_option: string;
    Flength: string;
    Fcubic_weight: string;
    Fstock: string;
    Fproduct_id: string;
    Fillustrative_image: TUrl;
    Fprice: string;
    Fwidth: string;
    Fstart_promotion: string;
    Fminimum_stock: string;
    Fdollar_cost_price: string;
    Forder: string;
    Fpromotional_price: string;
    Fid: string;
    FVariantImage: TArray<TImageTray>;
    Fquantity_sold: string;
    Fpayment_option_details: TArray<TPaymentOptionDetail>;
    FSku: TArray<TSku>;
    Fend_promotion: string;
    Fweight: string;
    Fcolor_id_2: string;
    Favailable: string;
    Fheight: string;
    Fean: string;
    Freference: string;
    Fpayment_option_html: string;
    Fcolor_id_1: string;
    Fcost_price: string;
    Fcod_grade_temp: Integer;
  published
    property id: string read Fid write Fid;
    property ean: string read Fean write Fean;
    property order: string read Forder write Forder;
    property product_id: string read Fproduct_id write Fproduct_id;
    property price: string read Fprice write Fprice;
    property cost_price: string read Fcost_price write Fcost_price;
    property dollar_cost_price: string read Fdollar_cost_price write Fdollar_cost_price;
    property stock: string read Fstock write Fstock;
    property minimum_stock: string read Fminimum_stock write Fminimum_stock;
    property reference: string read Freference write Freference;
    property weight: string read Fweight write Fweight;
    property length: string read Flength write Flength;
    property width: string read Fwidth write Fwidth;
    property height: string read Fheight write Fheight;
    property start_promotion: string read Fstart_promotion write Fstart_promotion;
    property end_promotion: string read Fend_promotion write Fend_promotion;
    property promotional_price: string read Fpromotional_price write Fpromotional_price;
    property payment_option: string read Fpayment_option write Fpayment_option;
    property payment_option_details: TArray<TPaymentOptionDetail> read Fpayment_option_details write Fpayment_option_details;// Collection
    property available: string read Favailable write Favailable;
    property illustrative_image: TUrl read Fillustrative_image write Fillustrative_image;
    property quantity_sold: string read Fquantity_sold write Fquantity_sold;
    property color_id_1: string read Fcolor_id_1 write Fcolor_id_1;
    property color_id_2: string read Fcolor_id_2 write Fcolor_id_2;
    property payment_option_html: string read Fpayment_option_html write Fpayment_option_html;
    property cubic_weight: string read Fcubic_weight write Fcubic_weight;
    property Sku: TArray<TSku> read FSku write FSku;// Collection
    property VariantImage: TArray<TImageTray> read FVariantImage write FVariantImage;// Collection
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
