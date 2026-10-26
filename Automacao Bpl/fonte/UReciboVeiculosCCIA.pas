unit UReciboVeiculosCCIA;
(************************ Hw Sistemas e Computadores ***************************
IMPRESSÃO - Campos que precisa para impressão
Contrato e Controle Iterno
-> Recebemos de: , Veículo, Vendedor , Valor
Comum
-> Vendedor, Recebemos de:, Valor
Antecipado
->Recebemos de:,Valor
*******************************************************************************)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, uClassesVeiculosCCIA, DB, AppEvnts;

type
  TfrmReciboVeiculosCCIA = class(TfrmCadPadraoM)
    GroupBox25: TGroupBox;
    Label80: TLabel;
    DBLookupComboBox15: TDBLookupComboBox;
    GroupBox16: TGroupBox;
    CheckBox4: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox18: TGroupBox;
    Label29: TLabel;
    Label14: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    GroupBox4: TGroupBox;
    GroupBox13: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    GroupBox14: TGroupBox;
    Label22: TLabel;
    GroupBox11: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    GroupBox12: TGroupBox;
    Label19: TLabel;
    GroupBox10: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    GroupBox8: TGroupBox;
    Label13: TLabel;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox7: TGroupBox;
    Label12: TLabel;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox9: TGroupBox;
    Label8: TLabel;
    GroupBox15: TGroupBox;
    Label24: TLabel;
    DBEdit14: TDBEdit;
    CheckBox6: TCheckBox;
    GroupBox19: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    GroupBox20: TGroupBox;
    Label28: TLabel;
    Label30: TLabel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit13: TDBEdit;
    Memo8: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Memo6: TMemo;
    Memo7: TMemo;
    Memo3: TMemo;
    CheckBox7: TCheckBox;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    BitBtn8: TBitBtn;
    Edit1: TEdit;
    GroupBox17: TGroupBox;
    Label34: TLabel;
    DBEdit19: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    CheckBox8: TCheckBox;
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReciboVeiculosCCIA: TfrmReciboVeiculosCCIA;
  Veiculo: TVeiculosCCIA;
implementation
                uses
                uDtmAtivo, uImprimirReciboVeiculosCCIA, uConfirmarReciboVeiculosCCIA;
{$R *.dfm}

procedure TfrmReciboVeiculosCCIA.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if MaskEdit2.Visible then
  begin
    if not Veiculo.ConsultaCampos('VEICULOS', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if Veiculo.ConsultaCampos('VEICULOS', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmReciboVeiculosCCIA.BitBtn3Click(Sender: TObject);
begin
  inherited;

      PageControl3.ActivePage := TabSheet3;
      TabSheet3.Show;
end;

procedure TfrmReciboVeiculosCCIA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
if Veiculo.dataSet.State = dsEdit then
  begin
    Veiculo.Post;
    if Veiculo.confirmaAlteracao then
    begin
      if Veiculo.Apply then
        Veiculo.CommitaTransacao;
    end
    else if Veiculo.emTransacao then
    begin
      Veiculo.Cancel;
      Veiculo.RollBackTransacao;
    end;
  end
  else
  begin
    Veiculo.Cancel;
    Veiculo.RollBackTransacao;
  end;
  Veiculo.Destroy;
  Action := caFree;
  frmReciboVeiculosCCIA := nil;
end;

procedure TfrmReciboVeiculosCCIA.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Veiculo := TVeiculosCCIA.create;
  Veiculo.abreVeiculos('');
end;

procedure TfrmReciboVeiculosCCIA.FormShow(Sender: TObject);
begin
     MaskEdit1.Visible := false;
     MaskEdit2.Visible := false;
     CheckBox3.Visible := false;
     CheckBox1.Visible := false;

  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
end;

procedure TfrmReciboVeiculosCCIA.SpeedButton3Click(Sender: TObject);
var
 ImprimirReciboVeiculos : TfrmImprimirReciboVeiculosCCIA;
begin
  inherited;
    ImprimirReciboVeiculos := TfrmImprimirReciboVeiculosCCIA.Create(frmImprimirReciboVeiculosCCIA);
    ImprimirReciboVeiculos.ShowModal;
end;

procedure TfrmReciboVeiculosCCIA.SpeedButton6Click(Sender: TObject);
var
   ConfirmarReciboVeiculos : TfrmConfirmarReciboVeiculosCCIA;
begin
  inherited;
   ConfirmarReciboVeiculos := TfrmConfirmarReciboVeiculosCCIA.Create(frmConfirmarReciboVeiculosCCIA);
   ConfirmarReciboVeiculos.ShowModal;
end;

end.
