unit uDiferencaE310entreE316;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, ACBrEFDBloco_E, IBX.IBQuery;

type
  TfrmDifE310eE316 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbE310: TLabel;
    lbE316: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    MaskEdit1: TMaskEdit;
    Label11: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    Memo2: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    MaskEdit2: TMaskEdit;
    Label16: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edVLObrig: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure edVLObrigExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vQrAud: TIBQuery;
    vrObrigacoes: Double;
    vE316: TRegistroE316;
  end;

var
  frmDifE310eE316: TfrmDifE310eE316;

implementation

uses uSpedHw, ACBrEFDBlocos, ACBRSpedFiscalUtilHw, System.Math;

{$R *.dfm}

procedure TfrmDifE310eE316.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIniSPED.PesqPros('EFD015', 'VALIDAR', 'UF:' + Edit1.Text +
    ' E310:' + lbE310.Caption +
    ' E316:' + lbE316.Caption +
    ' VR INF:' + edVLObrig.Text , '',
    MaskEdit2.Text, vQrAud, True) then
    Exit;

  try
    if (Trim(Edit2.Text) <> '000') and
      (Trim(Edit2.Text) <> '003') and
      (Trim(Edit2.Text) <> '006') and
      (Trim(Edit2.Text) <> '090') then
      raise exception.Create('Codigo da obrigação inválido');

    if StrToFloatDef(edVLObrig.Text, -1) <= 0 then
      raise exception.Create('Valor da obrigação inválido');

    if RoundTo(StrToFloatDef(edVLObrig.Text, -1), -2) <> RoundTo(vrObrigacoes, -2) then
      raise exception.Create('Valor da obrigação inválido. Digite o valor: ' + Format('%0.2f', [vrObrigacoes]));

    if MaskEdit1.Text = '  /  /    ' then
      raise exception.Create('Data de vencimento da obrigação inválida, digite uma data valida');

    if Trim(Edit3.Text) = '' then
      raise exception.Create('Codigo da receita deve ser preenchido');

    if Trim(MaskEdit2.Text) = '' then
      raise exception.Create('Mes/Ano de refencia invalido');

    if vE316 = nil then
      vE316 := TRegistroE316.Create(nil);
    vE316.COD_OR := Edit2.Text;
    vE316.VL_OR := StrToFloatDef(edVLObrig.Text, -1);
    vE316.DT_VCTO := StrToDate(MaskEdit1.Text);
    vE316.COD_REC := Edit3.Text;
    vE316.NUM_PROC := Edit4.Text;
    if (ComboBox1.ItemIndex = 3) then
      vE316.IND_PROC := StrToOrigemProcesso('9')
    else
      vE316.IND_PROC := StrToOrigemProcesso(IntToStr(ComboBox1.ItemIndex));
    vE316.PROC := Memo1.Lines.Text;
    vE316.TXT_COMPL := Memo2.Lines.Text;
    vE316.MES_REF := MaskEdit2.Text;
    ModalResult := IDOK;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TfrmDifE310eE316.edVLObrigExit(Sender: TObject);
begin
  if StrToFloatDef(edVLObrig.Text, -1) <= -1 then
  begin
    Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
    edVLObrig.SetFocus
  end
  else
    edVLObrig.Text := Format('%0.2n', [StrToFloatDef(edVLObrig.Text, -1)]);
end;

procedure TfrmDifE310eE316.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if vE316 <> nil then
//    FreeAndNil(vE316);
end;

procedure TfrmDifE310eE316.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := VK_TAB;
    KeyDown(Key, Shift);
  end
end;

end.
