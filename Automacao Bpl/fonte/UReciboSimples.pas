unit UReciboSimples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, DBCtrls, ExtCtrls, UclassesRecibo, uEditMoeda,
  Buttons, qrpctrls, QRCtrls, grimgctrl, QuickRpt;

type
  TfrmReciboSimples = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Shape1: TShape;
    Shape3: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    Label6: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBLookupComboBox2: TDBLookupComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    EditMoeda1: TEditMoeda;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel1: TPanel;
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRShape2: TQRShape;
    QRHRule1: TQRHRule;
    QRPLabel3: TQRPLabel;
    QRPLabel5: TQRPLabel;
    QRPLabel6: TQRPLabel;
    QRPLabel7: TQRPLabel;
    QRPLabel8: TQRPLabel;
    QRHRule2: TQRHRule;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRPShape1: TQRPShape;
    QRLabel10: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape1: TQRShape;
    QRHRule3: TQRHRule;
    QRPLabel1: TQRPLabel;
    QRPLabel2: TQRPLabel;
    QRPLabel4: TQRPLabel;
    QRPLabel9: TQRPLabel;
    QRPLabel10: TQRPLabel;
    QRHRule4: TQRHRule;
    qrlCPF2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlCidade2: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRPShape2: TQRPShape;
    QRLabel21: TQRLabel;
    qrlEndereco2: TQRLabel;
    QRShape3: TQRShape;
    qrlCliente1: TQRLabel;
    qrlCPF1: TQRLabel;
    qrlEndereco1: TQRLabel;
    qrlcidade1: TQRLabel;
    qrlCliente2: TQRLabel;
    CheckBox1: TCheckBox;
    procedure QuickRep1Preview(Sender: TObject);
    procedure Edit9Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit10KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure EditMoeda1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReciboSimples: TfrmReciboSimples;
  obReciboSimples: TReciboSimples;

implementation

uses UdtmRecibo, uDtmAtivo;

{$R *.dfm}

procedure TfrmReciboSimples.BitBtn6Click(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TfrmReciboSimples.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if Edit3.Text = '' then
    raise Exception.Create('Não foi informado a pessoa que esta realizando o pagamento.');

  if EditMoeda1.Text = '' then
    raise Exception.Create('O valor do recibo não foi informado.');

  if Edit5.Text = '' then
    raise Exception.Create('Campo referente não informado.');

  if DBLookupComboBox2.Text = '' then
    raise Exception.Create('Campo Beneficiário não informado.');

//  if Application.MessageBox('Deseja imprimir 2 cópias na mesma página?', 'Atenção.',
//    MB_ICONQUESTION + MB_YESNO) = IDNO then
  if not CheckBox1.Checked then
  
    QRShape3.Left := 0
  else
    QRShape3.Left := 800;

  qrlCliente1.Caption := DBText1.Caption;
  qrlCliente2.Caption := DBText1.Caption;
  qrlCPF1.Caption := DBText2.Caption;
  qrlCPF2.Caption := DBText2.Caption;
  qrlEndereco1.Caption := DBText3.Caption;
  qrlEndereco2.Caption := DBText3.Caption;
  qrlcidade1.Caption := DBText4.Caption;
  qrlCidade2.Caption := DBText4.Caption;

  QRLabel5.Caption := trim(Edit3.Text);
  QRLabel16.Caption := QRLabel5.Caption;
  QRLabel3.Caption := trim(obReciboSimples.vBenef.dataSet.FieldByName('CIDADE').AsString) +
    ', ' + vDadosIni.DataPorExtenso(now);
  QRLabel14.Caption := QRLabel3.Caption;
  QRLabel6.Caption := trim(Edit5.Text);
  QRLabel17.Caption := QRLabel6.Caption;
  QRLabel7.Caption := trim(Edit6.Text);
  QRLabel18.Caption := QRLabel7.Caption;
  QRLabel8.Caption := trim(Edit7.Text);
  QRLabel19.Caption := QRLabel9.Caption;
  QRLabel9.Caption := trim(Edit8.Text);
  QRLabel20.Caption := QRLabel9.Caption;
//  QRLabel11.Caption := trim(obReciboSimples.vClientes.buscas.FieldByName('ENDERECO').AsString) +
//    ' - ' + trim(obReciboSimples.vClientes.buscas.FieldByName('BAIRRO').AsString);
//  QRLabel22.Caption := QRLabel11.Caption;
  QRLabel2.Caption := FormatFloat('###,##0.00', EditMoeda1.Valor) + ' ' + Label10.Caption;
  QRLabel13.Caption := QRLabel2.Caption;
//  QRLabel4.Caption := trim(obReciboSimples.vClientes.buscas.FieldByName('CEP').AsString) +
//    '  -  ' + trim(obReciboSimples.vClientes.buscas.FieldByName('CIDADE').AsString) + '/' +
//    trim(obReciboSimples.vClientes.buscas.FieldByName('SIGLA_UF').AsString);
//  QRLabel15.Caption := QRDBText7.Caption;

  QuickRep1.Preview;
end;

procedure TfrmReciboSimples.BitBtn8Click(Sender: TObject);
var
  i: Integer;
begin
  inherited;
    for i := 0 to self.ComponentCount - 1 do
  begin
    if Components[i] is TEdit then
      TEdit(Components[i]).Clear;
  end;
  EditMoeda1.Valor :=0;
  label10.Caption := '';
end;

procedure TfrmReciboSimples.Edit10Exit(Sender: TObject);
begin
  inherited;
  if trim(Edit10.Text) <> '' then
  begin
    obReciboSimples.vBenef.BuscaPeloCodigo(StrToInt(Edit10.Text), StrToInt(vDadosIni.codEmpresa));
    DBLookupComboBox2.KeyValue := Edit10.Text;
    Edit9.Text := trim(obReciboSimples.vBenef.dataSet.FieldByName('CIDADE').AsString) + ', ' +
      vDadosIni.DataPorExtenso(now);
  end;
end;

procedure TfrmReciboSimples.Edit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    Edit10.Text := vdadosIni.pesquisaRapida('CLIENTES');
end;

procedure TfrmReciboSimples.Edit2Exit(Sender: TObject);
begin
  inherited;
  if trim(Edit2.Text) <> '' then
    Edit3.Text := obReciboSimples.vBenef.retornaNomeCliente(StrToInt(Edit2.Text));
end;

procedure TfrmReciboSimples.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    Edit2.Text := vdadosIni.pesquisaRapida('CLIENTES');
end;

procedure TfrmReciboSimples.Edit9Enter(Sender: TObject);
begin
  inherited;
if edit9.text = '' then
begin
 edit9.text:=trim(vDadosIni.vEmp.vCidade) + ', ' +
      vDadosIni.DataPorExtenso(vDadosIni.getDataBanco(obReciboSimples.buscas));
end;
end;

procedure TfrmReciboSimples.EditMoeda1Exit(Sender: TObject);
begin
  inherited;
  if EditMoeda1.Valor <> 0 then
    Label10.Caption := vDadosIni.Extenso(EditMoeda1.Valor);
end;

procedure TfrmReciboSimples.FormCreate(Sender: TObject);
begin
  inherited;
  obReciboSimples := TReciboSimples.create;
end;

procedure TfrmReciboSimples.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    CheckBox1.Checked := not CheckBox1.Checked ;
end;

procedure TfrmReciboSimples.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Recibo');
end;

end.

