unit NummusResponseModels;

interface

uses
  System.Classes,
  System.Generics.Collections;

type
  Tdiscount_ticket = class
  private
    Fvalue: Double;
    Fvalue_min_purchase: Double;
  published
    property value: Double read Fvalue write Fvalue;
    property value_min_purchase: Double read Fvalue_min_purchase write Fvalue_min_purchase;
  end;

  TGetSaldoClienteResponse = class(TPersistent)
  private
    Fcustomer_id: string;
    Famount: Double;
    Funlimited_ransom: Boolean;
    Fvalue_min_ransom: Double;
    Fvalue_max_ransom: Double;
    Fbalance_available: Double;
    Fallowed_redemption_amount: Double;
    Ftype_ransom: string;
    Fpercent_rescue_by_purchase: Double;
    Fdiscount_ticket: Tdiscount_ticket;

    Fmessage: string;
    Fstatus: Integer;
  public
    destructor Destroy; override;
  published
    property customer_id: string read Fcustomer_id write Fcustomer_id;
    property amount: Double read Famount write Famount;
    property unlimited_ransom: Boolean  read Funlimited_ransom write Funlimited_ransom;
    property value_min_ransom: Double read Fvalue_min_ransom write Fvalue_min_ransom;
    property value_max_ransom: Double read Fvalue_max_ransom write Fvalue_max_ransom;
    property balance_available: Double read Fbalance_available write Fbalance_available;
    property allowed_redemption_amount: Double read Fallowed_redemption_amount  write Fallowed_redemption_amount;
    property type_ransom: string read Ftype_ransom write Ftype_ransom;
    property percent_rescue_by_purchase: Double read Fpercent_rescue_by_purchase write Fpercent_rescue_by_purchase;
    property discount_ticket: Tdiscount_ticket read Fdiscount_ticket write Fdiscount_ticket;

    property message: string read Fmessage write Fmessage;
    property status: Integer read Fstatus write Fstatus;
  end;

  TPostSimularResgateResponse = class(TPersistent)
  private
    Famount: Double;
    Frescue_available: Double;
  published
    property amount: Double read Famount write Famount;
    property rescue_available: Double read Frescue_available write Frescue_available;
  end;


implementation

uses
  System.SysUtils,
  System.StrUtils,
  HW.Json,
  System.JSON,
  REST.Json;

{ TGetSaldoClienteResponse }

destructor TGetSaldoClienteResponse.Destroy;
begin
  if Assigned(Fdiscount_ticket) then
    Fdiscount_ticket.Free;
  inherited;
end;

end.
