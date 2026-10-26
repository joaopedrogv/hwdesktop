unit hw.image.utils.dx;

interface

uses
  Vcl.Graphics,
  Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg;

function ResizeProportional(Source, Destination: WideString; MinWidth: Integer; MinHeight: Integer): Boolean;

implementation

uses
  hw_utils,
  System.StrUtils,
  System.SysUtils, System.Classes;

function ResizeProportional(Source, Destination: WideString; MinWidth: Integer; MinHeight: Integer): Boolean;
var
  png: TPNGImage;
  bmp: TBitmap;
  jpe: TJPEGImage;
  jpg: TJPEGImage;
  NewHeight, NewWidth: Integer;

  procedure DefineSize(Height, Width: Integer);
  begin
    if (Height <= MinHeight) and (Width <= MinHeight) then
    begin
      NewHeight := Height;
      NewWidth := Width;
    end
    else if (Height > Width) then
    begin
      NewHeight := MinHeight;
      NewWidth := Trunc(NewHeight * Width / Height);
    end
    else
    begin
      NewWidth := MinWidth;
      NewHeight := Trunc(NewWidth * Height / Width);
    end;
  end;

begin
  Result := False;
  try

    try
      bmp := TBitmap.Create;
      if ExtractFileExt(Source).ToLower.Equals('.png') then
      begin
        png := TPNGImage.Create;
        png.LoadFromFile(Source);

        DefineSize(png.Height, png.Width);

        bmp.Width := NewWidth;
        bmp.Height := NewHeight;
        png.Draw(bmp.Canvas, bmp.Canvas.ClipRect);

        FreeAndNil(png);
      end
      else if MatchText(ExtractFileExt(Source).ToLower, ['.jpg', '.jpeg', '.jpe', '.jif', '.jfi', '.jfif']) then
      begin
        jpg := TJPEGImage.Create;
        jpg.LoadFromFile(Source);

        DefineSize(jpg.Height, jpg.Width);

        bmp.SetSize(NewWidth, NewHeight);
        bmp.Canvas.StretchDraw(Rect(0, 0, NewWidth, NewHeight), jpg);

        FreeAndNil(jpe);
      end
      else if ExtractFileExt(Source).ToLower.Equals('.bmp') then
      begin
        bmp.LoadFromFile(Source);

        DefineSize(bmp.Height, bmp.Width);

        bmp.Canvas.StretchDraw(Rect(0, 0, NewWidth, NewHeight), bmp);
        bmp.SetSize(NewWidth, NewHeight);
      end;

      if ExtractFileExt(Destination).ToLower.Equals('.png') then
      begin
        png := TPngImage.Create;
        png.Assign(bmp);

        png.SaveToFile(Destination);

        Result := FileExists(Destination);
      end
      else if ExtractFileExt(Destination).ToLower.Equals('.bmp') then
      begin
        bmp.SaveToFile(Destination);

        Result := FileExists(Destination);
      end
      else if MatchText(ExtractFileExt(Destination).ToLower, ['.jpg', '.jpeg', '.jpe', '.jif', '.jfi', '.jfif']) then
      begin
        jpg := TJPEGImage.Create;
        jpg.Assign(bmp);

        jpg.SaveToFile(Destination);

        Result := FileExists(Destination);
      end

    finally
      if Assigned(jpg) then jpg.Free;
      if Assigned(png) then png.Free;
      if Assigned(bmp) then bmp.Free;
    end;

  except on E: Exception do
    ShowErro('Erro ao carregar visualização da imagem.%s Clique no botão de visualizar imagem caso o sistema não consiga apresentar corretamente%s' +
               'Use um editor de imagem e salve novamente',
               [sLineBreak, sLineBreak + sLineBreak]);
  end;
end;

end.
