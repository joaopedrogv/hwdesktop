unit UIncLancAv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEditMoeda, Mask, Buttons, ExtCtrls, UClassesPend;

type
  TFrmincLancAv = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    EditMoeda1: TEditMoeda;
    ComboBox2: TComboBox;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox3: TComboBox;
    Label48: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmincLancAv: TFrmincLancAv;
  cadcontrole: TContrCXL;

implementation

uses uClasseFP, UDtmBalcao, uDtmFormPag, uDtmAtivo;

{$R *.dfm}

procedure TFrmincLancAv.BitBtn1Click(Sender: TObject);
var
  FPGeral: TFormPag2;
  vNumConta: Double;
  vMensagem: string;
begin
  if ComboBox1.text = '' then
  begin
    Application.MessageBox('Informe o Tipo de Lançamento!', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      ComboBox1.SetFocus;
    Exit;
  end;
  if trim(Edit1.text) = '' then
  begin
    Application.MessageBox('Informe o N. Documento!', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
      Edit1.SetFocus;
    Exit;
  end;
  if trim(Edit2.text) = '' then
  begin
    Application.MessageBox('Informe o Histórico!', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
      Edit2.SetFocus;
    Exit;
  end;
  if EditMoeda1.Valor <= 0 THEN
  begin
    Application.MessageBox('Informe o Valor do Lançamento!', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (EditMoeda1.CanFocus) then
      EditMoeda1.SetFocus;
    Exit;
  end;
  if ComboBox2.text = '' then
  begin
    Application.MessageBox('Informe o N. Conta do lançamento!', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (ComboBox2.CanFocus) then
      ComboBox2.SetFocus;
    Exit;
  end;
  if ComboBox3.text = '' then
  begin
    Application.MessageBox('Informe o Controle do lançamento!', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (ComboBox3.CanFocus) then
      ComboBox3.SetFocus;
    Exit;
  end;
  vNumConta := cadcontrole.procconta(string(ComboBox2.Text));
  if not cadcontrole.testarNumConta(ComboBox1.Text, vNumConta, vMensagem) then
  begin
	  Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
    if not vDadosIni.PesqPros('LANC038', 'PERMITIR', 'LANC CONTA ' + FloatToStr(vNumConta),
      'LANCCXL', '', cadcontrole.buscas, True) then
    begin
       if (Self.Enabled) and (Self.Visible) and (ComboBox2.CanFocus) then
         ComboBox2.SetFocus;
       exit;
    end;
  end;
  FPGeral := TFormPag2.create;
  try
    strtoint(edit1.text);
    if not FPGeral.incluirLancamentoAvulso(EditMoeda1.Valor,
      Cadcontrole.procControle(string(ComboBox3.Text)),
      cadcontrole.procconta(string(ComboBox2.Text)), 'LCS', 'N', string(Edit2.Text),
      string(combobox1.text), string(combobox1.text), 'N', strtoint(edit1.text)) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      	ComboBox1.SetFocus;
    end
    else
      Close;

  except
    messagedlg('Problemas na conversão do numero do documento(somente Número)',mtinformation,[mbOK],0);
  end;
end;

procedure TFrmincLancAv.ComboBox1Exit(Sender: TObject);
begin
  cadcontrole.retornaContas(ComboBox2, ComboBox1.Text);
end;

procedure TFrmincLancAv.ComboBox2Exit(Sender: TObject);
var
  vNumConta: Double;
  vMensagem: string;
begin
  if (ActiveControl = BitBtn2)then
    Exit;

  if ComboBox1.Text = '' then
  	exit;

  vNumConta := cadcontrole.procconta(string(ComboBox2.Text));

  cadcontrole._dadosNContaPlcValidos(ComboBox1.Text, vNumConta);
  Label21.Caption := cadcontrole.rConta.vDescricaoGR;
  Label22.Caption := cadcontrole.rConta.vDescricaoDEP;
  Label48.Caption := cadcontrole.rConta.vTipoConta;

  if not cadcontrole.testarNumConta(ComboBox1.Text, vNumConta, vMensagem) then
  begin
	  Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
    exit;
  end;
end;

procedure TFrmincLancAv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  UnloadPackage(HrFormpag);
  Action := caFree;
end;

procedure TFrmincLancAv.FormShow(Sender: TObject);
begin
  cadcontrole := TContrCXL.create;
  cadcontrole.retornaCtrl(ComboBox3);
  cadcontrole.retornaContas(ComboBox2, ComboBox1.Text);
  MaskEdit1.Text := datetostr(vDadosIni.diaFCxl);
  vDadosIni.hw_registra_estatistica(Self.Name);
  cadcontrole.vpermitir := false;
//  cadcontrole.free;
end;

end.

