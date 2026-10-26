unit Hw.Tray.Api.ProductKit;

interface

type
  TProductKit = class
  private
    FAvailabilityDays: string;
    FBrand: string;
    FDiscountType: string;
    FDiscountValue: string;
    FId: string;
    FPrice: string;
    FPriceRule: string;
    FProductId: string;
    FProductParentId: string;
    FQuantity: string;
    FWarranty: string;
  published
    property AvailabilityDays: string read FAvailabilityDays write FAvailabilityDays;
    property Brand: string read FBrand write FBrand;
    property DiscountType: string read FDiscountType write FDiscountType;
    property DiscountValue: string read FDiscountValue write FDiscountValue;
    property Id: string read FId write FId;
    property Price: string read FPrice write FPrice;
    property PriceRule: string read FPriceRule write FPriceRule;
    property ProductId: string read FProductId write FProductId;
    property ProductParentId: string read FProductParentId write FProductParentId;
    property Quantity: string read FQuantity write FQuantity;
    property Warranty: string read FWarranty write FWarranty;
  end;

implementation

end.
