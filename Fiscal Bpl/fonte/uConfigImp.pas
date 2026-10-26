unit uConfigImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Spin, ExtCtrls, Buttons, Mask, DBCtrls;

type
  TfrmConfigImp = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ckAbrirGaveta: TCheckBox;
    ckUsarCodBarra: TCheckBox;
    edObs: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edECF: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ckVerifPapel: TCheckBox;
    edModDocFiscal: TEdit;
    Label7: TLabel;
    spPorta: TSpinEdit;
    Label8: TLabel;
    spQtdeViasCPnaoF: TSpinEdit;
    ckConfEst: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    ck3DigVrUnit: TCheckBox;
    ckTecladoPDV: TCheckBox;
    ckSupermercado: TCheckBox;
    cbBalanca: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    spPortaLeitor: TSpinEdit;
    spQtdeDigDAV: TSpinEdit;
    Label14: TLabel;
    ckLeitorSerial: TCheckBox;
    RadioGroup1: TRadioGroup;
    cbImp: TComboBox;
    edCodTerminal: TDBEdit;
    edAliqISS: TDBEdit;
    edContReinicio: TDBEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    edNumEquip: TEdit;
    ckMovOperador: TCheckBox;
    edPercMaxDescItem: TDBEdit;
    ckPoPreco: TCheckBox;
    Button1: TButton;
    edEnderecoHwF: TEdit;
    Label15: TLabel;
    SpeedButton1: TSpeedButton;
    SaveDialog1: TSaveDialog;
    ComboBox1: TComboBox;
    Label16: TLabel;
    Label50: TLabel;
    edImpDavECF: TEdit;
    SpeedButton2: TSpeedButton;
    Panel8: TPanel;
    pnPrecoAdicional: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton12: TSpeedButton;
    ListBox3: TListBox;
    ListBox4: TListBox;
    BitBtn3: TBitBtn;
    Panel9: TPanel;
    Label51: TLabel;
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edImpDavECFChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function getBooleano(ckBox: TCheckBox): string;
    function setBooleano(valor: string): boolean;
  public
    { Public declarations }
  end;

var
  frmConfigImp: TfrmConfigImp;

implementation

uses uCadastrosF, uDtmAtivo, uDtmConfigF, uConfiguracoes, uClasseBalanca;

{$R *.dfm}

procedure TfrmConfigImp.BitBtn1Click(Sender: TObject);
var
  arred_trunc, tec_pdv, us_pdv, leit_sup, vr_unit_3d, movOperador,
    abrir_gav, us_codbarra, conf_est, leit_ser, ver_papel,polprec: string;
begin
  inherited;
  arred_trunc := '';
  tec_pdv := 'N';
	if RadioGroup1.ItemIndex = 0 then
    arred_trunc := 'T'
  else if RadioGroup1.ItemIndex = 1 then
    arred_trunc := 'A';
  tec_pdv := getBooleano(ckTecladoPDV);
	us_pdv := Copy (ComboBox1.Text,1,1) ;
  leit_sup := getBooleano(ckSupermercado);
  vr_unit_3d := getBooleano(ck3DigVrUnit);
	movOperador := getBooleano(ckMovOperador);
  abrir_gav := getBooleano(ckAbrirGaveta);
  us_codbarra := getBooleano(ckUsarCodBarra);
  conf_est := getBooleano(ckConfEst);
  leit_ser := getBooleano(ckLeitorSerial);
  ver_papel := getBooleano(ckVerifPapel);
  polprec := getBooleano(ckPoPreco);
  obConf.vListaTabPreco.Text := ListBox4.Items.Text;
	if obConf.gravaConfImp(edECF.Text, cbImp.Text, edNumEquip.Text, edObs.Text, cbBalanca.Text,
		edModDocFiscal.Text, arred_trunc, tec_pdv, us_pdv, leit_sup, vr_unit_3d, movOperador, abrir_gav,
		us_codbarra, conf_est, leit_ser, ver_papel, polprec,edEnderecoHwF.Text,Trim(edImpDavECF.Text),spPorta.Value, spPortaLeitor.Value,
    spQtdeDigDAV.Value, spQtdeViasCPnaoF.Value) then
  begin
    vDadosIni.vNumSerieEcf := Trim(edECF.Text);
    MessageDlg('Configurações salvas com sucesso!', mtInformation, [mbOK], 0);
    close;
  end;
end;

procedure TfrmConfigImp.BitBtn2Click(Sender: TObject);
begin
  inherited;
  obConf.Cancel;
  Close;
end;

procedure TfrmConfigImp.Button1Click(Sender: TObject);
var
  vBal:TBalanca;
begin
  inherited;
  try
    vDadosIni.vModeloBal:=cbBalanca.text;

    if Pos('generico hw', LowerCase(cbBalanca.Text)) > 0 then
      vBal := TBalanca_hw_generic.create(cbBalanca.Text)
    else
      vBal := TBalanca_PCScale.create(cbBalanca.Text);
    vBal.abreConfiguracaoBal;
  finally
    vBal.free;
    vBal:=nil;
  end;
end;

procedure TfrmConfigImp.edImpDavECFChange(Sender: TObject);
begin
  inherited;
	if (Trim(edImpDavECF.Text) <> 'S') and (Trim(edImpDavECF.Text) <> 'N') then
		edImpDavECF.Text := '';
end;

procedure TfrmConfigImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmConfigImp := nil;
end;

procedure TfrmConfigImp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    BitBtn1Click(sender)
  else if Key = VK_F3 then
    BitBtn2Click(sender);
end;

procedure TfrmConfigImp.FormShow(Sender: TObject);
var
  arred_trunc, tec_pdv, us_pdv, leit_sup, vr_unit_3d, leit_mf, abrir_gav, us_codbarra, conf_est,
		leit_ser, ver_papel, polprec,vEcf, modImp, numEquip, obs, balanca, modDoc, arredTrunc,endHwF, impECF: string;
	porta, portaleitor, qtDigDav, qtViasCpNaoF: Integer;
begin
	inherited;
	obConf.alterarConfImp(vEcf, modImp, numEquip, obs, balanca, modDoc, arred_trunc, tec_pdv,
		us_pdv, leit_sup, vr_unit_3d, leit_mf, abrir_gav, us_codbarra, conf_est, leit_ser, ver_papel,
		polprec,endHwF, impECF, porta, portaleitor, qtDigDav, qtViasCpNaoF);
	cbImp.Text := modImp;
	edECF.Text := vEcf;
	edObs.Text := obs;
	edNumEquip.Text := numEquip;
	cbBalanca.Text := balanca;
	edModDocFiscal.Text := modDoc;
	edImpDavECF.Text := impECF;
	spPorta.Value := porta;
	spPortaLeitor.Value := portaleitor;
	spQtdeDigDAV.Value := qtDigDav;
	spQtdeViasCPnaoF.Value := qtViasCpNaoF;
  edEnderecoHwF.Text := endHwF;

	if arred_trunc = 'T' then
		RadioGroup1.ItemIndex := 0
  else if arred_trunc = 'A' then
    RadioGroup1.ItemIndex := 1;
  ckTecladoPDV.Checked := setBooleano(tec_pdv);
  ComboBox1.Text := us_pdv ;
  ckSupermercado.Checked := setBooleano(leit_sup);
  ck3DigVrUnit.Checked := setBooleano(vr_unit_3d);
  ckMovOperador.Checked := setBooleano(leit_mf);
  ckAbrirGaveta.Checked := setBooleano(abrir_gav);
  ckUsarCodBarra.Checked := setBooleano(us_codbarra);
  ckConfEst.Checked := setBooleano(conf_est);
  ckLeitorSerial.Checked := setBooleano(leit_ser);
  ckVerifPapel.Checked := setBooleano(ver_papel);
  ckPopreco.Checked := setBooleano(polprec);
  ListBox4.Items.Text := obConf.vListaTabPreco.Text;
  if cbBalanca.Items.IndexOf('Generico Hw via DLL') < 0 then cbBalanca.Items.Add('Generico Hw via DLL');
end;

function TfrmConfigImp.getBooleano(ckBox: TCheckBox): string;
begin
  if ckBox.Checked then
    Result := 'S'
  else
    Result := 'N';
end;

function TfrmConfigImp.setBooleano(valor: string): boolean;
begin
  if valor = 'S' then
    Result := true
  else
    Result := false;
end;

procedure TfrmConfigImp.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if ListBox4.ItemIndex > -1 then
    ListBox4.DeleteSelected;

  obConf.vListaTabPreco.Text := ListBox4.Items.Text;
end;

procedure TfrmConfigImp.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    edEnderecoHwF.Text := SaveDialog1.FileName;
end;

procedure TfrmConfigImp.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if ListBox3.ItemIndex > -1 then  
    ListBox3.ItemIndex := 0;
  vDadosIni.abreForm('Tabelas de preço adicional', pnPrecoAdicional, []);
end;

procedure TfrmConfigImp.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if ListBox3.ItemIndex > -1 then
    obConf.vListaTabPreco.Add(ListBox3.Items[ListBox3.ItemIndex]);

  ListBox4.Items.Text := obConf.vListaTabPreco.Text;
end;

end.

