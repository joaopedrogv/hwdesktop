unit uConfigTRV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, StdCtrls, ExtCtrls, IniFiles;

type
  TfrmConfigTRV = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    vArqIniTRV: string;
    vArqConfigTRV: TIniFile;
  public
    { Public declarations }
    vSystemIni: string;
  end;

var
  frmConfigTRV: TfrmConfigTRV;

implementation

{$R *.dfm}

procedure TfrmConfigTRV.BitBtn1Click(Sender: TObject);
begin
  inherited;
  vArqIniTRV := vSystemIni;
  try
  vArqConfigTRV := TIniFile.Create(vArqIniTRV);
  vArqConfigTRV.WriteString('TRV', 'Origem', Edit1.Text);
  vArqConfigTRV.WriteString('TRV', 'Destino', Edit2.Text);
  finally
    vArqConfigTRV.Free;
  end;
  ModalResult := mrOk;
end;

procedure TfrmConfigTRV.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmConfigTRV.FormShow(Sender: TObject);
begin
  inherited;
  vArqIniTRV := vSystemIni;
  try
  vArqConfigTRV := TIniFile.Create(vArqIniTRV);
  Edit1.Text:= vArqConfigTRV.ReadString('TRV', 'Origem', '');
  Edit2.Text:= vArqConfigTRV.ReadString('TRV', 'Destino', '');
  finally
    vArqConfigTRV.Free;
  end;
end;

procedure TfrmConfigTRV.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.Title :='Seleciona banco de Origem';
  if OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.FileName;
end;

procedure TfrmConfigTRV.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.Title :='Seleciona banco de Destino';
  if OpenDialog1.Execute then
    Edit2.Text := OpenDialog1.FileName;
end;

end.
