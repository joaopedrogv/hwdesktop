unit Hw.Tray.Api.Url;

interface

type
  TUrl = class
  private
    Fhttps: string;
    Fhttp: string;
  published
    property http: string read Fhttp write Fhttp;
    property https: string read Fhttps write Fhttps;
  end;

implementation

end.
