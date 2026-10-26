unit Hw.Tray.Api.Property_;

interface

uses
  HW.Tray.Api.Url;

type
  TPropertyValue = class
  private
    Fname: string;
    Fproperty_id: string;
    Fimage: TUrl;
    Fid: string;
  published
    property id: string read Fid write Fid;
    property name: string read Fname write Fname;
    property property_id: string read Fproperty_id write Fproperty_id;
    property image: TUrl read Fimage write Fimage;// class
  end;

  TProperty = class
  private
    Fdisplay: string;
    Fname: string;
    FPropertyValues: TArray<TPropertyValue>;
    Factive_display: string;
    Fid: string;
    Fhas_product: string;
    Fposition: string;
  published
    property id: string read Fid write Fid;
    property active_display: string read Factive_display write Factive_display;
    property name: string read Fname write Fname;
    property position: string read Fposition write Fposition;
    property display: string read Fdisplay write Fdisplay;
    property has_product: string read Fhas_product write Fhas_product;
    property PropertyValues: TArray<TPropertyValue> read FPropertyValues write FPropertyValues;// Collection
  end;

  TPropertyWithValueHw = class(TProperty)
  private
    Fvalue_name: string;
    Fimage: TUrl;
    Fvalue_id: string;
    Fsel: string;
  published
    property sel: string read Fsel write Fsel;
    property value_id: string read Fvalue_id write Fvalue_id;
    property value_name: string read Fvalue_name write Fvalue_name;
    property image: TUrl read Fimage write Fimage;// class
  end;

  TGradeHw = class
  private
    Ftipo_ec1: string;
    Fdescricao1: string;
    Ftipo_ec: string;
    Fdescricao: string;
    Fdescricao_ec1: string;
    Fdescricao_ec: string;
    Fcod_grade: Integer;
  published
    property cod_grade: Integer read Fcod_grade write Fcod_grade;
    property descricao: string read Fdescricao write Fdescricao;
    property descricao1: string read Fdescricao1 write Fdescricao1;
    property tipo_ec: string read Ftipo_ec write Ftipo_ec;
    property descricao_ec: string read Fdescricao_ec write Fdescricao_ec;
    property tipo_ec1: string read Ftipo_ec1 write Ftipo_ec1;
    property descricao_ec1: string read Fdescricao_ec1 write Fdescricao_ec1;
  end;

implementation

end.
