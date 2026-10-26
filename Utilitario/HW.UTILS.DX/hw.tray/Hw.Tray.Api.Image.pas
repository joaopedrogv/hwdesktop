unit HW.Tray.Api.Image;

interface

uses
  REST.Json.Types,
  Hw.Tray.Api.Url;

type

  TThumbs = class
  private
    [JSONNameAttribute('30')]
    Fthumbs180: TUrl;
    [JSONNameAttribute('90')]
    Fthumbs90: TUrl;
    [JSONNameAttribute('180')]
    Fthumbs30: TUrl;
  published
    property thumbs30: TUrl read Fthumbs30 write Fthumbs30;// class
    property thumbs90: TUrl read Fthumbs90 write Fthumbs90;// class
    property thumbs180: TUrl read Fthumbs180 write Fthumbs180;// class
  end;

  TImageTray = class(TUrl)
  private
    Fthumbs: TThumbs;
  published
    property thumbs: TThumbs read Fthumbs write Fthumbs;// class
  end;

implementation

end.
