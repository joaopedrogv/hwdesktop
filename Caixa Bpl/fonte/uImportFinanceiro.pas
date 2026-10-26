unit uImportFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls,
  uEditHw, ComCtrls, DB, uClassesImportacaoFinanceiro;

type
  TfrmImportacaoFinanceiro = class(TfrmPadrao)
    PageControl2: TPageControl;
    tsCadastro: TTabSheet;
    tsInicial: TTabSheet;
    pnCadastroLancamento: TPanel;
    Panel4: TPanel;
    PageControl1: TPageControl;
    tsCheque: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label35: TLabel;
    spbContasBancarias: TSpeedButton;
    Panel9: TPanel;
    Panel10: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    EditHw7: TEditHw;
    EditHw8: TEditHw;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    EditHw9: TEditHw;
    EditHw10: TEditHw;
    EditHw11: TEditHw;
    MaskEdit3: TMaskEdit;
    Edit9: TEdit;
    EditHw12: TEditHw;
    EditHw15: TEditHw;
    Edit14: TEdit;
    tsOutros: TTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    label66: TLabel;
    Label24: TLabel;
    Label22: TLabel;
    Label28: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    GroupBox9: TGroupBox;
    ListBox1: TListBox;
    Panel5: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit3: TEdit;
    MaskEdit2: TMaskEdit;
    EditHw5: TEditHw;
    Panel6: TPanel;
    BitBtn29: TBitBtn;
    BitBtn34: TBitBtn;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    EditHw3: TEditHw;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    EditHw4: TEditHw;
    Panel7: TPanel;
    Panel8: TPanel;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    EditHw6: TEditHw;
    Edit10: TEdit;
    EditHw13: TEditHw;
    Edit11: TEdit;
    EditHw14: TEditHw;
    btGerar: TBitBtn;
    tsDinheiro: TTabSheet;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Panel1: TPanel;
    Panel11: TPanel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    EditHw17: TEditHw;
    Edit12: TEdit;
    EditHw18: TEditHw;
    EditHw19: TEditHw;
    EditHw20: TEditHw;
    Edit13: TEdit;
    GroupBox7: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn9: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox6: TGroupBox;
    DBGrid3: TDBGrid;
    CheckBox1: TCheckBox;
    BitBtn8: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label36: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    BitBtn1: TBitBtn;
    MaskEdit1: TMaskEdit;
    EditHw16: TEditHw;
    BitBtn5: TBitBtn;
    BitBtn18: TBitBtn;
    tsLancamentos: TTabSheet;
    pnLancamentos: TPanel;
    GroupBox4: TGroupBox;
    Label30: TLabel;
    DBGrid4: TDBGrid;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    tsControles: TTabSheet;
    pnControlesPrazo: TPanel;
    BitBtn21: TBitBtn;
    Panel14: TPanel;
    Label45: TLabel;
    DBGrid6: TDBGrid;
    tsRelatorio: TTabSheet;
    pnRelatorio: TPanel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBGrid5: TDBGrid;
    MaskEdit4: TMaskEdit;
    EditHw21: TEditHw;
    Panel13: TPanel;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    tsContasBacarias: TTabSheet;
    pnConsultaContasBancarias: TPanel;
    Panel23: TPanel;
    DBGrid7: TDBGrid;
    Panel24: TPanel;
    SpeedButton32: TSpeedButton;
    SpeedButton34: TSpeedButton;
    Label46: TLabel;
    Edit15: TEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label47: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spbContasBancariasClick(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure Edit14Exit(Sender: TObject);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure EditHw19Exit(Sender: TObject);
    procedure EditHw17Exit(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure GroupBox9Exit(Sender: TObject);
    procedure EditHw14Exit(Sender: TObject);
    procedure EditHw6Exit(Sender: TObject);
    procedure EditHw15Exit(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure EditHw11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw11Exit(Sender: TObject);
    procedure EditHw9Exit(Sender: TObject);
    procedure EditHw9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw12Exit(Sender: TObject);
    procedure EditHw12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw7Exit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure _limparCampos;
  public
    { Public declarations }
  end;

var
  frmImportacaoFinanceiro: TfrmImportacaoFinanceiro;
  _importFina: TFechamentoPDV;

implementation

uses uDtmImportPDVFinan, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TfrmImportacaoFinanceiro.BitBtn10Click(Sender: TObject);
begin
  inherited;
  GroupBox7.Enabled := False;
  PageControl1.Enabled := True;
  _importFina.vCtrl.dataSet.IndexFieldNames := 'CODIGO_CTRL';
  _importFina.vCtrl.FindNearest([DBLookupComboBox1.KeyValue]);
  
  _limparCampos;
  _importFina._novoLancamento;

  if Trim(_importFina.vCtrl.dataSet.FieldByName('docs').AsString) = 'N'  then
  begin
    PageControl1.ActivePage := tsDinheiro;
    EditHw19.AsValue := _importFina.vCampos.Finalizador;
    if (Self.Enabled) and (Self.Visible) and (EditHw17.CanFocus) then
      EditHw17.SetFocus;
  end
  else if Trim(_importFina.vCtrl.dataSet.FieldByName('docs').AsString) = 'S1'  then
  begin
    PageControl1.ActivePage := tsCheque;
    EditHw15.AsValue := _importFina.vCampos.Finalizador;
    if (Self.Enabled) and (Self.Visible) and (EditHw7.CanFocus) then
      EditHw7.SetFocus;
  end
  else if Trim(_importFina.vCtrl.dataSet.FieldByName('docs').AsString) = 'S2'  then
  begin
    PageControl1.ActivePage := tsOutros;
    EditHw14.AsValue := _importFina.vCampos.Finalizador;
    _importFina.vTermCartao._abreTerminais;
    ComboBox1.ItemIndex := 0;
    if (Self.Enabled) and (Self.Visible) and (EditHw6.CanFocus) then
      EditHw6.SetFocus;
  end;
end;

procedure TfrmImportacaoFinanceiro.BitBtn11Click(Sender: TObject);
begin
  inherited;
  TForm(pnCadastroLancamento.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmImportacaoFinanceiro.BitBtn12Click(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Cupom := EditHw6.AsInteger;
  
  if not vDadosIni.PesqPros('IMPFIN011','SALVAR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV)+'  CP '+ IntToStr(_importFina.vCampos.Cupom),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, True) then
    Exit;

  _importFina.vCampos.Finalizador := EditHw14.AsInteger;
  _importFina.vCampos.CodCliente := EditHw13.AsInteger;
  _importFina.vCampos.NomeCliente := Edit10.Text;

  _importFina.vCampos.Parcelas := EditHw2.AsInteger;
  _importFina.vCampos.DiaVencimento := EditHw3.AsInteger;
  _importFina.vCampos.NomeCliente := Edit10.Text;
  _importFina.vCampos.OutrasFormas := Trim(ComboBox1.Text);
  _importFina.vCampos.Valor := EditHw1.AsValue;
  _importFina.vCampos.NumAutCartao := Edit11.Text;
  _importFina.vCampos.NSUTransacao := Edit15.Text;
  _importFina.vCampos.Historico := Edit1.Text;
  _importFina.vCampos.CodTerceiro := EditHw4.AsInteger;
  _importFina.vCampos.NomeTerceiro := Edit2.Text;
  try
    if DBLookupComboBox2.KeyValue <> null then    
      _importFina.vCampos.CodTerminalCartao := DBLookupComboBox2.KeyValue;
  except
  end;
  if _importFina._salvarCreditos then
    BitBtn15.Click
  else if not setFocusCampoErro(_importFina.vNomeCampoErro) then
  	if (Self.Enabled) and (Self.Visible) and (EditHw6.CanFocus) then
    	EditHw6.SetFocus;
end;

procedure TfrmImportacaoFinanceiro.BitBtn14Click(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Cupom := EditHw7.AsInteger;
         
  if not vDadosIni.PesqPros('IMPFIN010','SALVAR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV)+'  CP '+ IntToStr(_importFina.vCampos.Cupom),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, True) then
    Exit;

  _importFina.vCampos.Finalizador := EditHw15.AsInteger;
  _importFina.vCampos.CodCliente := EditHw12.AsInteger;
  _importFina.vCampos.NomeCliente := Edit9.Text;
  _importFina.vCampos.NumeroCheque := EditHw8.AsInteger;
  _importFina.vCampos.Agencia := Edit4.Text;
  _importFina.vCampos.Conta := Edit5.Text;
  _importFina.vCampos.Banco := Edit14.Text;
  _importFina.vCampos.NomeBanco := Edit6.Text;
  _importFina.vCampos.Valor := EditHw10.AsValue;
  _importFina.vCampos.Vencimento := StrToDate(MaskEdit3.Text);
  _importFina.vCampos.Cupom := EditHw7.AsInteger;
  _importFina.vCampos.Historico := Edit7.Text;
  _importFina.vCampos.CodTerceiro := EditHw11.AsInteger;
  _importFina.vCampos.NomeTerceiro := Edit8.Text;
  if _importFina._salvarCheque then
    BitBtn15.Click
  else if not setFocusCampoErro(_importFina.vNomeCampoErro) then
  	if (Self.Enabled) and (Self.Visible) and (EditHw7.CanFocus) then
    	EditHw7.SetFocus;
end;

procedure TfrmImportacaoFinanceiro.BitBtn15Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := nil;
  GroupBox7.Enabled := true;
  PageControl1.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
  	DBLookupComboBox1.SetFocus;
end;

procedure TfrmImportacaoFinanceiro.BitBtn16Click(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Cupom := EditHw17.AsInteger;
  
  if not vDadosIni.PesqPros('IMPFIN012','SALVAR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV)+'  CP '+ IntToStr(_importFina.vCampos.Cupom),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, True) then
    Exit;

  _importFina.vCampos.Finalizador := EditHw19.AsInteger;
  _importFina.vCampos.CodCliente := EditHw18.AsInteger;
  _importFina.vCampos.NomeCliente := Edit12.Text;

  _importFina.vCampos.Valor := EditHw20.AsValue;
  _importFina.vCampos.Historico := Edit13.Text;
  if _importFina._salvarDinheiro then
    BitBtn15.Click
  else if not setFocusCampoErro(_importFina.vNomeCampoErro) then
  	if (Self.Enabled) and (Self.Visible) and (EditHw17.CanFocus) then
    	EditHw17.SetFocus;
end;

procedure TfrmImportacaoFinanceiro.BitBtn18Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('IMPFIN007','CONSULTA',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, True) then
    Exit;
  _importFina._abreFormRelatorio;
end;

procedure TfrmImportacaoFinanceiro.BitBtn19Click(Sender: TObject);
begin
  inherited;
  TForm(pnRelatorio.Parent).ModalResult := IDOK;
end;

procedure TfrmImportacaoFinanceiro.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('IMPFIN002','SOMAR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    _importFina.vPdv.dataSet.FieldByName('COD_TERMINAL').AsString,
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, False) then
    Exit;

  _importFina.vDataMovimento := StrToDate(MaskEdit1.Text);
  _importFina.vOperador := EditHw16.AsInteger;

  if _importFina._setAtributos then
    BitBtn2.Enabled := _importFina.vMeioPg._somaMeiosPagamento;
  BitBtn5.Enabled := BitBtn2.Enabled;
end;

procedure TfrmImportacaoFinanceiro.BitBtn20Click(Sender: TObject);
begin
  inherited;
  TForm(pnRelatorio.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmImportacaoFinanceiro.BitBtn21Click(Sender: TObject);
begin
  inherited;
  TForm(pnControlesPrazo.Parent).ModalResult := IDOK;
end;

procedure TfrmImportacaoFinanceiro.BitBtn29Click(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Documentos[ListBox1.ItemIndex] := Edit3.Text;
  _importFina.vCampos.Datas[ListBox1.ItemIndex] := MaskEdit2.Text;
  _importFina.vCampos.Valores[ListBox1.ItemIndex] := EditHw5.AsValue;
  ListBox1.Items[ListBox1.ItemIndex] :=
    _importFina.vCampos.Documentos[ListBox1.ItemIndex] + '    ' +
    _importFina.vCampos.Datas[ListBox1.ItemIndex] + '           ' +
    Format('%m', [_importFina.vCampos.Valores[ListBox1.ItemIndex]]);

  Panel5.Visible := False;
  ListBox1.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (ListBox1.CanFocus) then
    ListBox1.SetFocus;
end;

procedure TfrmImportacaoFinanceiro.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', _importFina.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'I', _importFina.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'I', _importFina.buscas) then
    Exit;
  MaskEdit1.Text := DateToStr(_importFina.vDataMovimento);
  EditHw16.AsValue := _importFina.vOperador;
                              
  if not vDadosIni.PesqPros('IMPFIN004','INICIAR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, False) then
    Exit;
  
  if _importFina._existeMovimentoFechado then
    exit;

  if not _importFina._iniciarRecebimento then
    Exit;

  DBGrid1.Enabled := False;
  MaskEdit1.Enabled := False;
  EditHw16.Enabled := False;
  BitBtn1.Enabled := False;
  BitBtn2.Enabled := False;
  BitBtn18.Enabled := False;

  BitBtn3.Enabled:= True;
  BitBtn8.Enabled:= True;
  GroupBox6.Enabled:= True;

end;

procedure TfrmImportacaoFinanceiro.BitBtn34Click(Sender: TObject);
begin
  inherited;
  Panel5.Visible := False;
  ListBox1.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (ListBox1.CanFocus) then
    ListBox1.SetFocus;
end;

procedure TfrmImportacaoFinanceiro.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('IMPFIN005','ABRIR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, False) then
    Exit;
  _importFina._abreFormManutencaoLancamento;
end;

procedure TfrmImportacaoFinanceiro.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('IMPFIN008','INCLUIR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, True) then
    Exit;
  PageControl1.ActivePage := nil;
  _importFina.vCtrl._abrirControles;
  _importFina._abreFormManutencaoLancamentoCadastro;
  Exit;

  _importFina._novoLancamento;
end;

procedure TfrmImportacaoFinanceiro.BitBtn5Click(Sender: TObject);
begin
  inherited;
  _importFina.vDataMovimento := StrToDate(MaskEdit1.Text);
  _importFina.vOperador := EditHw16.AsInteger;
  _importFina.vPdv.dataSet.First;
  while not _importFina.vPdv.dataSet.Eof do
  begin
    if _importFina.vPdv.dataSet.FieldByName('cod_terminal').AsInteger = _importFina.vNumeroPDV then
      Break;
    _importFina.vPdv.dataSet.Next;;
  end;

  if not vDadosIni.PesqPros('IMPFIN003','EXCLUIR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, True) then
    Exit;

  _importFina._liberarMovimentoPDV;
end;

procedure TfrmImportacaoFinanceiro.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('IMPFIN009','EXCLUIR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, True) then
    Exit;
  _importFina._removerLancamento;
end;

procedure TfrmImportacaoFinanceiro.BitBtn7Click(Sender: TObject);
begin
  inherited;
  TForm(pnLancamentos.Parent).ModalResult := IDCANCEL
end;

procedure TfrmImportacaoFinanceiro.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('IMPFIN006','CONFIRMAR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas, True) then
    Exit;
  _importFina.vAgruparDinheiro := CheckBox1.Checked;
  if _importFina._confirmarConsolidacao then
  begin
    vDadosIni.GravaAuditoria('IMPFIN006','CONFIRMAR',
    'DIA '+MaskEdit1.Text + ' OP '+EditHw16.AsString + ' PDV '+
    IntToStr(_importFina.vNumeroPDV),
    'MOVIMENTO_PDV_FINAN','',_importFina.buscas);
    DBGrid1.Enabled := True;
    MaskEdit1.Enabled := True;
    EditHw16.Enabled := True;
    BitBtn1.Enabled := True;
    BitBtn2.Enabled := True;
    BitBtn18.Enabled := True;

    BitBtn3.Enabled:= False;
    BitBtn8.Enabled:= False;
    GroupBox6.Enabled:= False;
    BitBtn1.Click;
  end;
end;

procedure TfrmImportacaoFinanceiro.BitBtn9Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmImportacaoFinanceiro.btGerarClick(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Cupom := EditHw6.AsInteger;
  _importFina.vCampos.Finalizador := EditHw14.AsInteger;
  _importFina.vCampos.CodCliente := EditHw13.AsInteger;
  _importFina.vCampos.NomeCliente := Edit10.Text;

  _importFina.vCampos.Parcelas := EditHw2.AsInteger;
  _importFina.vCampos.DiaVencimento := EditHw3.AsInteger;
  _importFina.vCampos.NomeCliente := Edit10.Text;
  _importFina.vCampos.OutrasFormas := Trim(ComboBox1.Text);
  _importFina.vCampos.Valor := EditHw1.AsValue;
  _importFina.vCampos.NumAutCartao := Edit11.Text;
  _importFina.vCampos.NSUTransacao := Edit15.Text;
  _importFina.vCampos.Historico := Edit1.Text;
  _importFina.vCampos.CodTerceiro := EditHw4.AsInteger;
  _importFina.vCampos.NomeTerceiro := Edit2.Text;
  if not _importFina._gerarParcelas then
    setFocusCampoErro(_importFina.vNomeCampoErro)
  else
  begin
    if ListBox1.Count > 0 then
      ListBox1.ItemIndex := 0;
    if (Self.Enabled) and (Self.Visible) and (ListBox1.CanFocus) then
      ListBox1.SetFocus;
  end;
end;

procedure TfrmImportacaoFinanceiro.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key =  VK_TAB) OR (Key =  VK_RETURN) then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmImportacaoFinanceiro.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Column.FieldName = 'VALOR') or (Column.FieldName = 'VALOR_INFORMADO') then
  begin
    DBGrid2.Canvas.Brush.Color := 13424004;
  end;
  DBGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmImportacaoFinanceiro.DBGrid4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vCampoPesq:string;
begin
  inherited;
  vCampoPesq := '';
  if Key = VK_ESCAPE then
    BitBtn7.Click
  else if Key = VK_F2 then
    BitBtn4.Click
//  else if Key = VK_F3 then
//    BitBtn5.Click
  else if Key = VK_F4 then
    BitBtn6.Click
  else if key = VK_F5 then
    _importFina._irParaRegistro('NREQUISICAO')
  else if key = VK_F6 then
    _importFina._irParaRegistro('NDOC')
  else if key = VK_F7 then             
    _importFina._irParaRegistro('COD_CLIENTE')
  else if key = VK_F8 then             
    _importFina._irParaRegistro('CLIENTE');
end;

procedure TfrmImportacaoFinanceiro.DBGrid6KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key =  VK_TAB) OR (Key =  VK_RETURN) then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn21.CanFocus) then
    	BitBtn21.SetFocus;
end;

procedure TfrmImportacaoFinanceiro.DBGrid7KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    SpeedButton34.Click
  else if Key = VK_RETURN then
    SpeedButton32.Click;
end;

procedure TfrmImportacaoFinanceiro.Edit14Exit(Sender: TObject);
begin
  inherited;
  Edit14.Text := vDadosIni.StrZero(Trim(Edit14.Text), 3);
  if Trim(Edit14.Text) = '001' then
    Edit6.Text := 'BANCO DO BRASIL'
  else if Trim(Edit14.Text) = '003' then
    Edit6.Text := 'BANCO DA AMAZONIA'
  else if Trim(Edit14.Text) = '004' then
    Edit6.Text := 'BANCO DO NORDESTE DO BRASIL'
  else if Trim(Edit14.Text) = '021' then
    Edit6.Text := 'BANCO DO ESTADO DO ESPIRITO SANTO'
  else if Trim(Edit14.Text) = '024' then
    Edit6.Text := 'BANCO DO ESTADO DE PERNAMBUCO'
  else if Trim(Edit14.Text) = '025' then
    Edit6.Text := 'BANCO ALFA S/A'
  else if Trim(Edit14.Text) = '027' then
    Edit6.Text := 'BANCO DO ESTADO DE SANTA CATARINA'
  else if Trim(Edit14.Text) = '033' then
    Edit6.Text := 'BANCO SANTANDER (BRASIL)'
  else if Trim(Edit14.Text) = '041' then
    Edit6.Text := 'BANCO DO ESTADO DO RIO GRANDE DO SUL'
  else if Trim(Edit14.Text) = '044' then
    Edit6.Text := 'BANCO BVA'
  else if Trim(Edit14.Text) = '047' then
    Edit6.Text := 'BANCO DO ESTADO DE SERGIPE'
  else if Trim(Edit14.Text) = '069' then
    Edit6.Text := 'BPN BRASIL BANCO MÚTIPLO'
  else if Trim(Edit14.Text) = '070' then
    Edit6.Text := 'BANCO DE BRASILIA'
  else if Trim(Edit14.Text) = '074' then
    Edit6.Text := 'BANCO J. SAFRA'
  else if Trim(Edit14.Text) = '104' then
    Edit6.Text := 'CAIXA ECONOMICA FEDERAL'
  else if Trim(Edit14.Text) = '107' then
    Edit6.Text := 'BANCO BBM'
  else if Trim(Edit14.Text) = '151' then
    Edit6.Text := 'NOSSA CAIXA - NOSSO BANCO'
  else if Trim(Edit14.Text) = '224' then
    Edit6.Text := 'BANCO FIBRA'
  else if Trim(Edit14.Text) = '237' then
    Edit6.Text := 'BANCO BRADESCO'
  else if Trim(Edit14.Text) = '246' then
    Edit6.Text := 'BANCO ABC BRASIL'
  else if Trim(Edit14.Text) = '263' then
    Edit6.Text := 'BANCO CACIQUE'
  else if Trim(Edit14.Text) = '266' then
    Edit6.Text := 'BANCO CEDULA'
  else if Trim(Edit14.Text) = '320' then
    Edit6.Text := 'BANCO INDL E COML S/A - BICBANCO'
  else if Trim(Edit14.Text) = '341' then
    Edit6.Text := 'BANCO ITAU'
  else if Trim(Edit14.Text) = '346' then
    Edit6.Text := 'BFB'
  else if Trim(Edit14.Text) = '347' then
    Edit6.Text := 'BANCO SUDAMERIS BRASIL'
  else if Trim(Edit14.Text) = '353' then
    Edit6.Text := 'BANCO SANTANDER BRASIL'
  else if Trim(Edit14.Text) = '356' then
    Edit6.Text := 'BANCO ABN AMRO'
  else if Trim(Edit14.Text) = '389' then
    Edit6.Text := 'BANCO MERCANTIL DO BRASIL'
  else if Trim(Edit14.Text) = '394' then
    Edit6.Text := 'BANCO BMC'
  else if Trim(Edit14.Text) = '399' then
    Edit6.Text := 'HSBC BANK BRASIL'
  else if Trim(Edit14.Text) = '409' then
    Edit6.Text := 'BANCO UNIBANCO'
  else if Trim(Edit14.Text) = '422' then
    Edit6.Text := 'BANCO SAFRA'
  else if Trim(Edit14.Text) = '453' then
    Edit6.Text := 'BANCO RURAL'
  else if Trim(Edit14.Text) = '479' then
    Edit6.Text := 'BANKBOSTON BCO MULTIPLO'
  else if Trim(Edit14.Text) = '600' then
    Edit6.Text := 'BANCO LUSO BRASILEIRO'
  else if Trim(Edit14.Text) = '604' then
    Edit6.Text := 'BANCO INDUSTRIAL DO BRASIL'
  else if Trim(Edit14.Text) = '611' then
    Edit6.Text := 'BANCO PAULISTA'
  else if Trim(Edit14.Text) = '623' then
    Edit6.Text := 'BANCO PANAMERICANO'
  else if Trim(Edit14.Text) = '630' then
    Edit6.Text := 'BANCO INTERCAP'
  else if Trim(Edit14.Text) = '633' then
    Edit6.Text := 'BANCO RENDIMENTO'
  else if Trim(Edit14.Text) = '634' then
    Edit6.Text := 'BANCO TRIBANCO'
  else if Trim(Edit14.Text) = '637' then
    Edit6.Text := 'BANCO SOFISA'
  else if Trim(Edit14.Text) = '643' then
    Edit6.Text := 'BANCO PINE'
  else if Trim(Edit14.Text) = '653' then
    Edit6.Text := 'BANCO INDUSVAL'
  else if Trim(Edit14.Text) = '655' then
    Edit6.Text := 'BANCO VOTORANTIM'
  else if Trim(Edit14.Text) = '707' then
    Edit6.Text := 'BANCO DAYCOVAL'
  else if Trim(Edit14.Text) = '719' then
    Edit6.Text := 'BANCO BANIF PRIMUS'
  else if Trim(Edit14.Text) = '721' then
    Edit6.Text := 'BANCO CREDIBEL'
  else if Trim(Edit14.Text) = '734' then
    Edit6.Text := 'BANCO GERDAU'
  else if Trim(Edit14.Text) = '738' then
    Edit6.Text := 'BANCO MORADA'
  else if Trim(Edit14.Text) = '739' then
    Edit6.Text := 'BANCO GALVAO DE NEGOCIOS'
  else if Trim(Edit14.Text) = '741' then
    Edit6.Text := 'BANCO RIBEIRAO PRETO'
  else if Trim(Edit14.Text) = '745' then
    Edit6.Text := 'BANCO CITIBANK'
  else if Trim(Edit14.Text) = '748' then
    Edit6.Text := 'BANCO COOPERATIVO SICREDI'
  else if Trim(Edit14.Text) = '749' then
    Edit6.Text := 'BR BANCO MERCANTIL'
  else if Trim(Edit14.Text) = '753' then
    Edit6.Text := 'NBC BANK BRASIL - BANCO MULTIPLO'
  else if Trim(Edit14.Text) = '756' then
    Edit6.Text := 'BANCO COOPERATIVO DO BRASIL';
end;

procedure TfrmImportacaoFinanceiro.EditHw11Exit(Sender: TObject);
var
  vTempString: string;
begin
  inherited;
  vTempString:=Edit8.Text;
  if _importFina._existeCliente(EditHw11.AsInteger, vTempString) then
    Edit8.Text := vTempString;
end;

procedure TfrmImportacaoFinanceiro.EditHw11KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if Trim(vDadosIni.vPesquisa) <> '' then
      EditHw11.Text := Trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmImportacaoFinanceiro.EditHw12Exit(Sender: TObject);
var
  vTempString: string;
begin
  inherited;
  vTempString:=Edit9.Text;
  if _importFina._existeCliente(EditHw12.AsInteger, vTempString) then
  begin
    Edit9.Text := vTempString;
    if _importFina._existeDadosBancarios(EditHw12.AsInteger) then
    begin
      Edit4.Text := _importFina.vCampos.Agencia;
      Edit5.Text := _importFina.vCampos.Conta;
      Edit14.Text := _importFina.vCampos.Banco;
      Edit6.Text := _importFina.vCampos.NomeBanco;
    end;
  end;
end;

procedure TfrmImportacaoFinanceiro.EditHw12KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if Trim(vDadosIni.vPesquisa) <> '' then
      EditHw12.Text := Trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmImportacaoFinanceiro.EditHw14Exit(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Finalizador := EditHw14.AsInteger;
  if (EditHw1.AsValue = 0) and (_importFina._existeFinCupom) then
    EditHw1.AsValue := _importFina.vCampos.Valor;
end;

procedure TfrmImportacaoFinanceiro.EditHw15Exit(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Finalizador := EditHw15.AsInteger;
  if (EditHw10.AsValue = 0) and (_importFina._existeFinCupom) then
      EditHw10.AsValue := _importFina.vCampos.Valor;
end;

procedure TfrmImportacaoFinanceiro.EditHw17Exit(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Cupom := EditHw17.AsInteger;
  _importFina.vCampos.Finalizador := EditHw19.AsInteger;
  if _importFina._existeCupom then
  begin
    EditHw18.AsValue := _importFina.vCampos.CodCliente;
    Edit12.Text := _importFina.vCampos.NomeCliente;
    if (_importFina._existeFinCupom) then
      EditHw20.AsValue := _importFina.vCampos.Valor;
    Edit13.Text := _importFina.vCampos.Historico;
  end;
end;

procedure TfrmImportacaoFinanceiro.EditHw19Exit(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Finalizador := EditHw19.AsInteger;
  if (EditHw20.AsValue = 0) and (_importFina._existeFinCupom) then
    EditHw20.AsValue := _importFina.vCampos.Valor;
end;

procedure TfrmImportacaoFinanceiro.EditHw6Exit(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Cupom := EditHw6.AsInteger;
  _importFina.vCampos.Finalizador := EditHw14.AsInteger;
  if _importFina._existeCupom then
  begin
    EditHw13.AsValue := _importFina.vCampos.CodCliente;
    Edit10.Text := _importFina.vCampos.NomeCliente;
    if (_importFina._existeFinCupom) then
      EditHw1.AsValue := _importFina.vCampos.Valor;
    Edit1.Text := _importFina.vCampos.Historico;
  end;
end;

procedure TfrmImportacaoFinanceiro.EditHw7Exit(Sender: TObject);
begin
  inherited;
  _importFina.vCampos.Cupom := EditHw7.AsInteger;
  _importFina.vCampos.Finalizador := EditHw15.AsInteger;
  if _importFina._existeCupom then
  begin
    EditHw12.AsValue := _importFina.vCampos.CodCliente;
    Edit9.Text := _importFina.vCampos.NomeCliente;
    if (_importFina._existeFinCupom) then
      EditHw10.AsValue := _importFina.vCampos.Valor;
    Edit7.Text := _importFina.vCampos.Historico;
  end;
end;

procedure TfrmImportacaoFinanceiro.EditHw9Exit(Sender: TObject);
var
  vTempString: string;
begin
  inherited;
  vTempString:=Edit9.Text;
//  if _importFina._existeBanco(EditHw9.AsInteger, vTempString) then
//    Edit6.Text := vTempString;
end;

procedure TfrmImportacaoFinanceiro.EditHw9KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CODIGO_BANCO');
    if Trim(vDadosIni.vPesquisa) <> '' then
      EditHw9.Text := Trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmImportacaoFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _importFina.Free;
  _importFina := nil;
  Action := caFree;
  frmImportacaoFinanceiro := nil;
end;

procedure TfrmImportacaoFinanceiro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	Self.fechar := True;
  inherited;
end;

procedure TfrmImportacaoFinanceiro.FormCreate(Sender: TObject);
begin
  inherited;
  _importFina := TFechamentoPDV.create;
end;

procedure TfrmImportacaoFinanceiro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    if pnCadastroLancamento.Parent <>  frmImportacaoFinanceiro then
      if PageControl1.ActivePage = nil then
        TForm(pnCadastroLancamento.Parent).ModalResult := IDCANCEL
      else
        BitBtn15.Click;
  end;
end;

procedure TfrmImportacaoFinanceiro.FormShow(Sender: TObject);
begin
  inherited;
  pnLancamentos.Visible := False;
  pnCadastroLancamento.Visible := False;
  tsCheque.TabVisible := False;
  tsOutros.TabVisible := False;
  tsDinheiro.TabVisible := False;
  AutoSize := True;
  Panel5.Align := alClient;

  tsInicial.TabVisible := False;
  tsCadastro.TabVisible := False;
  tsLancamentos.TabVisible := False;
  tsControles.TabVisible := False;
  tsRelatorio.TabVisible := False;
  tsContasBacarias.TabVisible := False;
  PageControl2.ActivePage := tsInicial;

  MaskEdit1.Text := DateToStr(Date);

  _importFina.vPdv._abrirPDVs;
  _importFina.vLisBox := TListBox(ListBox1);
  _importFina.vLabelSomaMeiosPag := TLabel(Label13);
  _importFina._montaCondPag(ComboBox1);
end;

procedure TfrmImportacaoFinanceiro.GroupBox9Exit(Sender: TObject);
begin
  inherited;
  Panel5.Visible := False;
  ListBox1.Visible := True;
end;

procedure TfrmImportacaoFinanceiro.ListBox1DblClick(Sender: TObject);
begin
  inherited;
  ListBox1.Visible := False;
  Panel5.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
    Edit3.SetFocus;
  Edit3.Text := _importFina.vCampos.Documentos[ListBox1.ItemIndex];
  MaskEdit2.Text := _importFina.vCampos.Datas[ListBox1.ItemIndex];
  EditHw5.AsValue := _importFina.vCampos.Valores[ListBox1.ItemIndex];
end;

procedure TfrmImportacaoFinanceiro.spbContasBancariasClick(Sender: TObject);
begin
  inherited;
  _importFina.vContabanc._selecionaContasBancarias(EditHw12.AsInteger);
  if _importFina._abreFormContasBancarias then
  begin
    Edit14.Text := _importFina.vContabanc.dataSet.FieldByName('codbanco').AsString;
    Edit6.Text := _importFina.vContabanc.dataSet.FieldByName('banco').AsString;
    Edit5.Text := _importFina.vContabanc.dataSet.FieldByName('conta').AsString;
    Edit4.Text := _importFina.vContabanc.dataSet.FieldByName('agencia').AsString;
  end;
end;

procedure TfrmImportacaoFinanceiro.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  if not _importFina.vContabanc.dataSet.IsEmpty then
    TForm(pnConsultaContasBancarias.Parent).ModalResult := IDOK;
end;

procedure TfrmImportacaoFinanceiro.SpeedButton34Click(Sender: TObject);
begin
  inherited;
  TForm(pnConsultaContasBancarias.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmImportacaoFinanceiro._limparCampos;
begin
  //Tab cheque
  EditHw7.AsValue := 0;
  EditHw15.AsValue := 0;
  EditHw12.AsValue := 0;
  Edit9.Text := '';
  EditHw8.AsValue := 0;
//  EditHw9.AsValue := 0;
  EditHw10.AsValue := 0;
  EditHw11.AsValue := 0;

  Edit4.Text := '';
  Edit5.Text := '';
  Edit6.Text := '';
  Edit7.Text := '';
  Edit8.Text := '';
  Edit14.Text := '';
  MaskEdit3.Text := '';

  //Tab outros
  EditHw6.AsValue := 0;
  EditHw13.AsValue := 0;
  EditHw14.AsValue := 0;
  EditHw1.AsValue := 0;
  EditHw2.AsValue := 0;
  EditHw3.AsValue := 0;
  EditHw4.AsValue := 0;

  Edit10.Text := '';
  Edit11.Text := '';
  Edit15.Text := '';
  Edit2.Text := '';

  //Tab Dinheiro
  EditHw17.AsValue := 0;
  EditHw18.AsValue := 0;
  EditHw19.AsValue := 0;
  EditHw20.AsValue := 0;

  Edit12.Text := '';
  Edit13.Text := '';

  ListBox1.Clear;  

end;

end.
