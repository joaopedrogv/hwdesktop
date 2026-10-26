unit Hw.Tray.Api.PaymentOptionDetail;

interface

type

  TPaymentOptionDetail = class
  private
    Ftype: string;
    Fvalue: string;
    Fdisplay_name: string;
    Fplots: string;
    Ftax: string;
  published
    property display_name: string read Fdisplay_name write Fdisplay_name;
    property type_: string read Ftype write Ftype;
    property plots: string read Fplots write Fplots;
    property value: string read Fvalue write Fvalue;
    property tax: string read Ftax write Ftax;
  end;

implementation

end.
