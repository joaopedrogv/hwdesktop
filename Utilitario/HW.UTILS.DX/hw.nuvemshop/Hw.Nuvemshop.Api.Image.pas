unit Hw.Nuvemshop.Api.Image;

interface

uses
  REST.Json.Types,
  Hw.Tray.Api.Url;

type

  TImagesNuvemshop = class
  private
    FId: Integer;
    FPosition: Integer;
    FProductId: Integer;
    FSrc: string;
  published
    property Id: Integer read FId write FId;
    property Position: Integer read FPosition write FPosition;
    property ProductId: Integer read FProductId write FProductId;
    property Src: string read FSrc write FSrc;
  end;

implementation

end.
