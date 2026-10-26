unit hw.image.form.dx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Imaging.JConsts, Vcl.Imaging.jpeg, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin;

type
  TFormImageView = class(TForm)
    OpenPictureDialog1: TOpenPictureDialog;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    bt_load: TBitBtn;
    bt_resize: TBitBtn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    procedure bt_loadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_resizeClick(Sender: TObject);
    procedure ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    FFileName: string;
    MaxW, MaxH: Integer;

    procedure CentralizarImagem;
    procedure LoadImagem;
  public
    { Public declarations }

    property FileName: string read FFileName write FFilename;
  end;

var
  FormImageView: TFormImageView;

implementation

uses
  ShellApi,
  hw_utils,
  hw.image.utils.dx;

{$R *.dfm}

procedure TFormImageView.bt_loadClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
  begin
    FileName := OpenPictureDialog1.FileName;
    LoadImagem;
  end;
end;

procedure TFormImageView.bt_resizeClick(Sender: TObject);
var
  Destination: string;
begin
//  if not SavePictureDialog1.Execute then
//     Exit;
//
//  Destination := SavePictureDialog1.FileName;
//
//  if ResizeProportional(FileName, Destination, 227, 296) then
//    Image1.Picture.LoadFromFile(Destination);
end;

procedure TFormImageView.CentralizarImagem;
begin
  if (Image1.Height < ScrollBox1.Height) then
    Image1.Top := Trunc((ScrollBox1.Height - Image1.Height) / 2)
  else if Image1.Top  <> 0 then
    Image1.Top := 0;

  if (Image1.Width < ScrollBox1.Width) then
    Image1.Left := Trunc((ScrollBox1.Width - Image1.Width) / 2)
  else if Image1.Left <> 0 then
    Image1.Left := 0;
end;

procedure TFormImageView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FormImageView := nil;
end;

procedure TFormImageView.FormResize(Sender: TObject);
begin
  CentralizarImagem;
end;

procedure TFormImageView.FormShow(Sender: TObject);
begin
//  TPicture.RegisterFileFormat('jpe', sJPEGImageFile, TJPEGImage);
//  TPicture.RegisterFileFormat('jif', sJPEGImageFile, TJPEGImage);
//  TPicture.RegisterFileFormat('jfif', sJPEGImageFile, TJPEGImage);
//  TPicture.RegisterFileFormat('jfi', sJPEGImageFile, TJPEGImage);

  Image1.Left := -1;
  Image1.Top := -1;
  if not FFileName.Trim.IsEmpty then
  begin
    bt_load.Visible := False;
    if FileExists(FFileName) then
      LoadImagem;
  end;
end;

procedure TFormImageView.LoadImagem;
var
  propSize: Double;
begin
  if not FileExists(FFileName) then
    Exit;

  try

    Image1.Picture.LoadFromFile(FFileName);

    Image1.Width := Image1.Picture.Width;
    Image1.Height := Image1.Picture.Height;

    MaxW := Image1.Picture.Width;
    MaxH := Image1.Picture.Height;

    Image1.Stretch := True;
    Image1.Proportional := True;

    if (Image1.Width > ScrollBox1.ClientWidth) or
       (Image1.Height > ScrollBox1.ClientHeight) then
    begin
      propSize := ScrollBox1.ClientWidth / Image1.Width;
      if (ScrollBox1.ClientHeight / Image1.Height) < propSize then
        propSize := ScrollBox1.ClientHeight / Image1.Height;

      Image1.Width  := Trunc(Image1.Width * propSize) - 2;
      Image1.Height := Trunc(Image1.Height * propSize) - 2;
    end;

    CentralizarImagem;

  except on E: Exception do
    begin

      try
        ShowWarning('Visualização indisponível. Tentando pelo Windows');
        ShellExecute(Application.Handle, nil, PChar(FFileName), nil, nil, SW_SHOWNORMAL);

      except on E: Exception do
        begin
          ShowWarning('Visualização indisponível. Falha ao tentar pelo Windows');
        end;
      end;

    end;
  end;
end;

procedure TFormImageView.ScrollBox1MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var
  newWi, newHe: Integer;
begin
  newWi := Trunc(Image1.Width * 0.95);
  newHe := Trunc(Image1.Height * 0.95);

  if newWi <= (MaxW * 0.05)  then
    Exit;

  Image1.Height := newHe;
  Image1.Width := newWi;

  CentralizarImagem;
end;

procedure TFormImageView.ScrollBox1MouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Image1.Width := Trunc(Image1.Width * 1.1);
  Image1.Height := Trunc(Image1.Height * 1.1);

  CentralizarImagem;
end;

procedure TFormImageView.ToolButton1Click(Sender: TObject);
begin
  Image1.Width := Trunc(Image1.Width * 1.1);
  Image1.Height := Trunc(Image1.Height * 1.1);

  CentralizarImagem;
end;

procedure TFormImageView.ToolButton2Click(Sender: TObject);
var
  newWi, newHe: Integer;
begin
  newWi := Trunc(Image1.Width * 0.95);
  newHe := Trunc(Image1.Height * 0.95);

  if newWi <= (MaxW * 0.05)  then
    Exit;

  Image1.Height := newHe;
  Image1.Width := newWi;

  CentralizarImagem;
end;

end.
