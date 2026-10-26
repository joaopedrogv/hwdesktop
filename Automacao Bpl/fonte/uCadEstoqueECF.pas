unit uCadEstoqueECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, QuickRpt, uClassesEstoqueECF, QRCtrls, AppEvnts;

type
  TfrmCadEstoqueECF = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit13: TDBEdit;
    tsIntervencao: TTabSheet;
    pnIntevencao: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    DBEdit15: TDBEdit;
    Label21: TLabel;
    DBEdit16: TDBEdit;
    Label22: TLabel;
    DBEdit17: TDBEdit;
    tsImpressao: TTabSheet;
    QuickRep1: TQuickRep;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    tsModificarStatusECF: TTabSheet;
    pnAlterarStatusECF: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Label27: TLabel;
    DBComboBox1: TDBComboBox;
    BitBtn11: TBitBtn;
    tsArquivoEletronico: TTabSheet;
    pnMontarArquivoEletronico: TPanel;
    Panel10: TPanel;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    Panel9: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ProgressBar1: TProgressBar;
    Label30: TLabel;
    MaskEdit4: TMaskEdit;
    tsDadosProduto: TTabSheet;
    pnModificarProduto: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Label31: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label32: TLabel;
    Edit3: TEdit;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    tsInicializacao: TTabSheet;
    pnInicializacao: TPanel;
    Panel13: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Panel14: TPanel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Edit4: TEdit;
    Label35: TLabel;
    Edit5: TEdit;
    SpeedButton9: TSpeedButton;
    Label36: TLabel;
    Edit6: TEdit;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    DBRadioGroup4: TDBRadioGroup;
    Label38: TLabel;
    DBEdit24: TDBEdit;
    Label40: TLabel;
    DBEdit25: TDBEdit;
    Label41: TLabel;
    DBEdit26: TDBEdit;
    Label42: TLabel;
    Label43: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    SpeedButton59: TSpeedButton;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuickRep1Preview(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure pnIntevencaoEnter(Sender: TObject);
    procedure DBRadioGroup4Exit(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBEdit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit22Exit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEstoqueECF: TfrmCadEstoqueECF;
  obEstEcf: TEstoqueECF;

implementation

uses uDtmEstoqueECF, uDtmAtivo, uDadosIni, DB, uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadEstoqueECF.BitBtn10Click(Sender: TObject);
begin
  inherited;
  TForm(pnIntevencao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadEstoqueECF.BitBtn11Click(Sender: TObject);
begin
  inherited;
  obEstEcf.abreFormMontarArquivoEletronico;
end;

procedure TfrmCadEstoqueECF.BitBtn12Click(Sender: TObject);
begin
  inherited;
  obEstEcf.vMesAnoRef := MaskEdit4.Text;
  obEstEcf.vInformante := Copy(ComboBox4.Text, 1, 1);
  obEstEcf.vIdentEstrutura := Copy(ComboBox5.Text, 1, 1);
  obEstEcf.vNomeArquivoAnexoI := Edit3.Text;
  obEstEcf.vNomeArquivoAnexoV := Edit6.Text;
  obEstEcf.vProgresso := TProgressBar(ProgressBar1);
  if checkbox2.Checked then
  begin
    obEstEcf.montarArquivoEletronicoAnexoI;
    TForm(pnMontarArquivoEletronico.Parent).ModalResult := IDOK;
  end;
  if checkbox4.Checked then
  begin
    obEstEcf.montarArquivoEletronicoAnexoV;
    TForm(pnMontarArquivoEletronico.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmCadEstoqueECF.BitBtn13Click(Sender: TObject);
begin
  inherited;
  TForm(pnMontarArquivoEletronico.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadEstoqueECF.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if obEstEcf.setDadosProduto(Edit1.Text) then
    TForm(pnModificarProduto.Parent).ModalResult := IDOK;
end;

procedure TfrmCadEstoqueECF.BitBtn15Click(Sender: TObject);
begin
  inherited;
  TForm(pnModificarProduto.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadEstoqueECF.BitBtn16Click(Sender: TObject);
begin
  inherited;
  TForm(pnInicializacao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadEstoqueECF.BitBtn17Click(Sender: TObject);
begin
  inherited;
    TForm(pnInicializacao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadEstoqueECF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('ECF001', 'CONSULTA', '', 'ECF', '', obEstEcf.buscas, False) then
    Exit;
  if MaskEdit2.Visible then
  begin
    if not obEstEcf.ConsultaCampos('ECF', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else
    if obEstEcf.ConsultaCampos('ECF', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadEstoqueECF.BitBtn3Click(Sender: TObject);
begin
  ActiveControl := BitBtn3;
  if not obEstEcf.Insert then
    exit;
  inherited;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  DBRadioGroup4.ReadOnly := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadEstoqueECF.BitBtn4Click(Sender: TObject);
begin
  if not obEstEcf.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(obEstEcf.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if obEstEcf.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadEstoqueECF.BitBtn5Click(Sender: TObject);
begin
  obEstEcf.Cancel;
  if TelaCadastro = 2 then
  begin
    PageControl1.ActivePage := TabSheet2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    exit;
  end;
  inherited;
end;

procedure TfrmCadEstoqueECF.BitBtn7Click(Sender: TObject);
begin
  inherited;
  TForm(pnAlterarStatusECF.Parent).ModalResult := IDOK;
end;

procedure TfrmCadEstoqueECF.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnAlterarStatusECF.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadEstoqueECF.BitBtn9Click(Sender: TObject);
begin
  inherited;
  TForm(pnIntevencao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadEstoqueECF.DBEdit22Exit(Sender: TObject);
begin
  inherited;
  obEstEcf.getDadosUsuarioECF(obEstEcf.dataSet.FieldByName('cod_cliente_inicializacao').AsInteger);
  Edit4.Text := obEstEcf.vNomeUsuarioECF;
  Edit5.Text := obEstEcf.vCpfCnpjUsuarioECF;
end;

procedure TfrmCadEstoqueECF.DBEdit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if obEstEcf.dataSet.State IN [dsInsert, dsEdit] then
      try
        obEstEcf.dataSet.FieldByName('cod_cliente_inicializacao').AsInteger :=
          StrToInt(Trim(vDadosIni.vPesquisa));
        DBEdit22Exit(DBEdit22);
      except
        obEstEcf.dataSet.FieldByName('cod_cliente_inicializacao').AsInteger := 0;
      end;
  end;
end;

procedure TfrmCadEstoqueECF.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
  	DBLookupComboBox1.SetFocus;
end;

procedure TfrmCadEstoqueECF.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_RETURN then
    SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
  	SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
  	BitBtn3Click(Sender);
end;

procedure TfrmCadEstoqueECF.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  obEstEcf.setDadosCNIEE;
end;

procedure TfrmCadEstoqueECF.DBRadioGroup4Exit(Sender: TObject);
begin
  inherited;
  Label7.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit2.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBLookupComboBox1.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label11.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit6.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label12.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit7.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label13.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label14.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label15.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label16.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit8.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit9.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit10.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit11.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
end;

procedure TfrmCadEstoqueECF.Edit1Exit(Sender: TObject);
begin
  inherited;
  Edit2.Text := obEstEcf.getDescricaoProduto(Edit1.Text);
end;

procedure TfrmCadEstoqueECF.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if Trim(vDadosIni.vPesquisa) <> '' then
      Edit1.Text := Trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEstoqueECF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obEstEcf.Free;
  obEstEcf := nil;
  Action := caFree;
  frmCadEstoqueECF := nil;
end;

procedure TfrmCadEstoqueECF.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  TelaCadastro := vDadosIni.vTipoForm;
  obEstEcf := TEstoqueECF.Create;
end;

procedure TfrmCadEstoqueECF.FormShow(Sender: TObject);
begin
  TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;
  TabSheet3.TabVisible := False;
  tsIntervencao.TabVisible := False;
  tsImpressao.TabVisible := False;
  tsModificarStatusECF.TabVisible := False;
  tsArquivoEletronico.TabVisible := False;
  tsDadosProduto.TabVisible := False;
  tsInicializacao.TabVisible := False;
  DBGrid1.DataSource := dtmEstoqueECF.dsEstECF;
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
end;

procedure TfrmCadEstoqueECF.MaskEdit4Exit(Sender: TObject);
begin
  inherited;
  Edit3.Text := ExtractFilePath(Application.ExeName)+'ECFANEXOI'+StringReplace(MaskEdit4.Text,'/','',[rfReplaceAll])+'.txt';
  Edit6.Text := ExtractFilePath(Application.ExeName)+'ECFANEXOV'+StringReplace(MaskEdit4.Text,'/','',[rfReplaceAll])+'.txt';
end;

procedure TfrmCadEstoqueECF.pnIntevencaoEnter(Sender: TObject);
begin
  inherited;
  DBRadioGroup1.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBRadioGroup3.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label19.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit14.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label20.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit15.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label23.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label24.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label25.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  Label26.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit18.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit19.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit20.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
  DBEdit21.Enabled := obEstEcf.dataSet.FieldByName('tipo').AsString = 'E';
end;

procedure TfrmCadEstoqueECF.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Estoque de Equipamento com Nº Série');
end;

procedure TfrmCadEstoqueECF.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if obEstEcf.dataSet.FieldByName('tipo').AsString <> 'E' then
  begin
    Application.MessageBox('Equipamento selecionado não é um ECF', 'Atenção', 0 + 64);
    Exit;
  end;
  obEstEcf.abreFormInicializacaoECF;
end;

procedure TfrmCadEstoqueECF.SpeedButton1Click(Sender: TObject);
begin
  if not obEstEcf.Edit then
    exit;
  inherited;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := TabSheet3;
  DBRadioGroup4.ReadOnly := (obEstEcf.dataSet.FieldByName('grupo_prod').AsInteger > 0) and
      (Trim(obEstEcf.dataSet.FieldByName('cod_prod').AsString) <> '');
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadEstoqueECF.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  obEstEcf.Delete;
end;

procedure TfrmCadEstoqueECF.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  QuickRep1.Preview;
end;

procedure TfrmCadEstoqueECF.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('ctnserie_%', obEstEcf.buscas);
end;

procedure TfrmCadEstoqueECF.SpeedButton6Click(Sender: TObject);
begin
  inherited;
//  if obEstEcf.dataSet.FieldByName('tipo').AsString <> 'E' then
//  begin
//    Application.MessageBox('Equipamento selecionado não é um ECF', 'Atenção', 0 + 64);
//    Exit;
//  end;
  obEstEcf.abreFormSaidaIntervencao;
end;

procedure TfrmCadEstoqueECF.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  obEstEcf.abreFormEscolhaProduto;
end;

procedure TfrmCadEstoqueECF.SpeedButton8Click(Sender: TObject);
var
  List: TStrings;
  I: Integer;
begin
  inherited;

  List := TStringList.Create;
  List := vDadosIni.getConfSisBlob('ctnserie_lista_status_adicional', obEstEcf.buscas);
  DBComboBox1.Clear;
  DBComboBox1.Items.Add('Estoque');
  DBComboBox1.Items.Add('Vendido');
  DBComboBox1.Items.Add('Demostração');
  for I := 0 to List.Count - 1 do
    if Trim(List[i]) <> '' then
      DBComboBox1.Items.Add(Trim(List[i]));
  DBComboBox1.Items.Add('Outros');
  obEstEcf.abreFormModificarStatusECF;
end;

procedure TfrmCadEstoqueECF.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if obEstEcf.dataSet.State IN [dsInsert, dsEdit] then
    try
      obEstEcf.dataSet.FieldByName('data_inicializacao').Value := Null;
    except
      obEstEcf.dataSet.FieldByName('data_inicializacao').AsString := '';
    end;
end;

end.

