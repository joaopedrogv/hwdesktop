unit Hw.Tray.Api.AdditionalInfo;

interface

type
  TAdditionalInfo = class
  private
    Fname: string;
    Fadd_total: Integer;
    Ftype: string;
    Fdisplay_value: Integer;
    Fid: string;
    Frequired: Integer;
    Fmax_length: Integer;
    Fvalue: string;
    Factive: Integer;
  published
    property id: string read Fid write Fid;
    property type_: string read Ftype write Ftype;
    property name: string read Fname write Fname;
    property display_value: Integer read Fdisplay_value write Fdisplay_value;
    property required: Integer read Frequired write Frequired;
    property add_total: Integer read Fadd_total write Fadd_total;
    property max_length: Integer read Fmax_length write Fmax_length;
    property value: string read Fvalue write Fvalue;
    property active: Integer read Factive write Factive;
  end;

implementation

end.
