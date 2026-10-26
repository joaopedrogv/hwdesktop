unit FormHelperDFe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  ACBrBase, ACBrDFe, ACBrNFe, Vcl.ExtCtrls;

type
  EnumDfeType = (tDefault, tNFe, {tNFCe, }tNFSe, tMDFe);

  TFrmHelperDFe = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lSSLLib: TLabel;
    lCryptLib: TLabel;
    lHttpLib: TLabel;
    lXmlSign: TLabel;
    lSSLLib1: TLabel;
    Label2: TLabel;
    cbDocDFe: TComboBox;
    cbSSLLib: TComboBox;
    cbCryptLib: TComboBox;
    cbHttpLib: TComboBox;
    cbXmlSignLib: TComboBox;
    cbSSLType: TComboBox;
    btnSalvarConfig: TBitBtn;
    cbYesNo: TComboBox;
    ACBrNFe1: TACBrNFe;
    procedure FormShow(Sender: TObject);
    procedure cbSSLLibChange(Sender: TObject);
    procedure cbCryptLibChange(Sender: TObject);
    procedure cbHttpLibChange(Sender: TObject);
    procedure cbXmlSignLibChange(Sender: TObject);
    procedure cbSSLTypeChange(Sender: TObject);
    procedure cbDocDFeChange(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadConfig(dfeType: EnumDfeType);
    procedure AtualizarSSLLibsCombo;
    procedure Save;
  end;

var
  FrmHelperDFe: TFrmHelperDFe;

implementation

{$R *.dfm}

uses
  ACBrDFeSSL,
  blcksock,
  System.TypInfo,
  System.Math,
  System.StrUtils,
  hw_win_utils;


{ TFrmHelperDFe }

procedure TFrmHelperDFe.AtualizarSSLLibsCombo;
begin
  cbSSLLib.ItemIndex     := Integer(ACBrNFe1.Configuracoes.Geral.SSLLib);
  cbCryptLib.ItemIndex   := Integer(ACBrNFe1.Configuracoes.Geral.SSLCryptLib);
  cbHttpLib.ItemIndex    := Integer(ACBrNFe1.Configuracoes.Geral.SSLHttpLib);
  cbXmlSignLib.ItemIndex := Integer(ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib);

  cbSSLType.Enabled      := (ACBrNFe1.Configuracoes.Geral.SSLHttpLib in [httpWinHttp, httpOpenSSL]);
end;

procedure TFrmHelperDFe.btnSalvarConfigClick(Sender: TObject);
begin
  Save;
end;

procedure TFrmHelperDFe.cbCryptLibChange(Sender: TObject);
begin
  try
    if cbCryptLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cbCryptLib.ItemIndex);
  finally
    AtualizarSSLLibsCombo;
  end;
end;

procedure TFrmHelperDFe.cbDocDFeChange(Sender: TObject);
begin

  cbSSLLib.ItemIndex     := -1;
  cbCryptLib.ItemIndex   := -1;
  cbHttpLib.ItemIndex    := -1;
  cbXmlSignLib.ItemIndex := -1;
  cbSSLType.ItemIndex    := -1;

  LoadConfig(EnumDfeType(cbDocDFe.ItemIndex));
end;

procedure TFrmHelperDFe.cbHttpLibChange(Sender: TObject);
begin
  try
    if cbHttpLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(cbHttpLib.ItemIndex);
  finally
    AtualizarSSLLibsCombo;
  end;
end;

procedure TFrmHelperDFe.cbSSLLibChange(Sender: TObject);
begin
  try
    if cbSSLLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(cbSSLLib.ItemIndex);
  finally
    AtualizarSSLLibsCombo;
  end;
end;

procedure TFrmHelperDFe.cbSSLTypeChange(Sender: TObject);
begin
  if cbSSLType.ItemIndex <> -1 then
     ACBrNFe1.SSL.SSLType := TSSLType(cbSSLType.ItemIndex);
end;

procedure TFrmHelperDFe.cbXmlSignLibChange(Sender: TObject);
begin
  try
    if cbXmlSignLib.ItemIndex <> -1 then
      ACBrNFe1.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(cbXmlSignLib.ItemIndex);
  finally
    AtualizarSSLLibsCombo;
  end;
end;

procedure TFrmHelperDFe.FormShow(Sender: TObject);
var
  T: TSSLLib;
  U: TSSLCryptLib;
  V: TSSLHttpLib;
  X: TSSLXmlSignLib;
  Y: TSSLType;
begin

  cbSSLLib.Items.Clear;
  for T := Low(TSSLLib) to High(TSSLLib) do
    cbSSLLib.Items.Add( GetEnumName(TypeInfo(TSSLLib), integer(T) ) );
  cbSSLLib.ItemIndex := 0;

  cbCryptLib.Items.Clear;
  for U := Low(TSSLCryptLib) to High(TSSLCryptLib) do
    cbCryptLib.Items.Add( GetEnumName(TypeInfo(TSSLCryptLib), Integer(U) ) );
  cbCryptLib.ItemIndex := 0;

  cbHttpLib.Items.Clear;
  for V := Low(TSSLHttpLib) to High(TSSLHttpLib) do
    cbHttpLib.Items.Add( GetEnumName(TypeInfo(TSSLHttpLib), Integer(V) ) );
  cbHttpLib.ItemIndex := 0;

  cbXmlSignLib.Items.Clear;
  for X := Low(TSSLXmlSignLib) to High(TSSLXmlSignLib) do
    cbXmlSignLib.Items.Add( GetEnumName(TypeInfo(TSSLXmlSignLib), Integer(X) ) );
  cbXmlSignLib.ItemIndex := 0;

  cbSSLType.Items.Clear;
  for Y := Low(TSSLType) to High(TSSLType) do
    cbSSLType.Items.Add( GetEnumName(TypeInfo(TSSLType), integer(Y) ) );
  cbSSLType.ItemIndex := 0;

  cbDocDFe.ItemIndex := 0;
  LoadConfig(EnumDfeType(cbDocDFe.ItemIndex));

end;

procedure TFrmHelperDFe.LoadConfig(dfeType: EnumDfeType);
var
  nfe: TACBrNFe;
  section: string;
  libNFSe: Integer;
begin

  case dfeType of
    tDefault:
      section := 'SSLib';
    tNFe:
      section := 'NFe_SSLib';
    {tNFCe:
      section := 'NFCe_SSLib';}
    tNFSe:
      section := 'NFSe_SSLib';
    tMDFe:
      section := 'MDFe_SSLib';
  end;

  cbYesNo.Enabled        := dfeType <> EnumDfeType.tDefault;
  if cbYesNo.Enabled then
    cbYesNo.ItemIndex    := IfThen(IniConf.ReadStr(section, 'Ativo').Equals('S'), 1)
  else
    cbYesNo.ItemIndex    := -1;

  if IniConf.ReadStr(section, 'Ativo') <> 'S' then
    libNFSe := IniConf.ReadInt('Sistema', 'libNFe', -1)
  else
    libNFSe := IniConf.ReadInt(section, 'libNFe', -1);

  cbSSLLib.ItemIndex := libNFSe;

  if IniConf.ReadInt(section, 'SSLCryptLib', -1) >= 0 then
    cbCryptLib.ItemIndex := IniConf.ReadInt(section, 'SSLCryptLib', -1);

  if IniConf.ReadInt(section, 'SSLHttpLib', -1) >= 0 then
    cbHttpLib.ItemIndex := IniConf.ReadInt(section, 'SSLHttpLib');

  if IniConf.ReadInt(section, 'SSLXmlSignLib', -1) >= 0 then
    cbXmlSignLib.ItemIndex := IniConf.ReadInt(section, 'SSLXmlSignLib');

  if IniConf.ReadInt(section, 'SSLType', -1) >= 0 then
    cbSSLType.ItemIndex := IniConf.ReadInt(section, 'SSLType');
end;

procedure TFrmHelperDFe.Save;
var
  dfeType: EnumDfeType;
  section: string;
begin

  dfeType := EnumDfeType(cbDocDFe.ItemIndex);

  case dfeType of
    tDefault:
      section := 'SSLib';
    tNFe:
      section := 'NFe_SSLib';
    {tNFCe:
      section := 'NFCe_SSLib';}
    tNFSe:
      section := 'NFSe_SSLib';
    tMDFe:
      section := 'MDFe_SSLib';
  end;

  if dfeType = EnumDfeType.tDefault then
    IniConf.Write('Sistema', 'libNFe', cbSSLLib.ItemIndex)
  else
  begin
    IniConf.Write(section, 'Ativo', IfThen(cbYesNo.ItemIndex = 1, 'S', 'N'));
    IniConf.Write(section, 'libNFe', cbSSLLib.ItemIndex);
  end;

  if cbCryptLib.ItemIndex >= 0 then
    IniConf.Write(section, 'SSLCryptLib', cbCryptLib.ItemIndex);

  if cbHttpLib.ItemIndex >= 0 then
    IniConf.Write(section, 'SSLHttpLib', cbHttpLib.ItemIndex);

  if cbXmlSignLib.ItemIndex >= 0 then
     IniConf.Write(section, 'SSLXmlSignLib', cbXmlSignLib.ItemIndex);

  if cbSSLType.ItemIndex >= 0 then
    IniConf.Write(section, 'SSLType', cbSSLType.ItemIndex);

end;

end.
