unit hw.image.export.dx;

interface

implementation

uses
  Vcl.Forms,
  hw.image.utils.dx,
  hw.image.form.dx;

function hw_image_resize_proportional(Source: WideString; Destination: WideString; MinWidth: Integer; MinHeight: Integer): LongBool; stdcall;
begin

  Result := ResizeProportional(Source, Destination, MinWidth, MinHeight);

end;

procedure hw_image_view(Source: WideString); stdcall;
begin
  Application.CreateForm(TFormImageView, FormImageView);
  FormImageView.FileName := Source;
  FormImageView.ShowModal;
end;

exports
  hw_image_resize_proportional,
  hw_image_view;

end.
