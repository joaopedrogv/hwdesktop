unit UcadNaturezaOperacao;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadraoModal, QRCtrls, grimgctrl, QuickRpt,
  DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids, Controls,
  StdCtrls, Mask, Forms, Classes, AppEvnts, Graphics;

type
  TfrmCadNaturezaOperacao = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    TitleBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData2: TQRSysData;
    tsRegrasCFOPCST: TTabSheet;
    pnRegrasCFOPCST: TPanel;
    DBGrid16: TDBGrid;
    Panel10: TPanel;
    BitBtn41: TBitBtn;
    BitBtn81: TBitBtn;
    BitBtn82: TBitBtn;
    BitBtn83: TBitBtn;
    Panel16: TPanel;
    Label174: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Label177: TLabel;
    DBEdit25: TDBEdit;
    DBComboBox17: TDBComboBox;
    DBComboBox18: TDBComboBox;
    Panel19: TPanel;
    BitBtn84: TBitBtn;
    BitBtn87: TBitBtn;
    Memo2: TMemo;
    DBComboBox7: TDBComboBox;
    tsDecricaoNatOp: TTabSheet;
    pnDescricaoNatOp: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Panel6: TPanel;
    Label16: TLabel;
    DBEdit4: TDBEdit;
    Panel7: TPanel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label17: TLabel;
    DBEdit5: TDBEdit;
    Image1: TImage;
    tsCadastro: TTabSheet;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ScrollBox4: TScrollBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    GroupBox7: TGroupBox;
    DBComboBox1: TDBComboBox;
    Label8: TLabel;
    Label9: TLabel;
    DBComboBox2: TDBComboBox;
    Label13: TLabel;
    DBComboBox6: TDBComboBox;
    Label10: TLabel;
    DBComboBox3: TDBComboBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Label26: TLabel;
    DBComboBox16: TDBComboBox;
    imgDevolucao: TImage;
    imgDevolucaoSPED: TImage;
    Label11: TLabel;
    DBComboBox4: TDBComboBox;
    Label14: TLabel;
    DBComboBox5: TDBComboBox;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label21: TLabel;
    DBComboBox12: TDBComboBox;
    Label24: TLabel;
    DBComboBox15: TDBComboBox;
    Label28: TLabel;
    DBEdit11: TDBEdit;
    Memo3: TMemo;
    DBComboBox13: TDBComboBox;
    Label22: TLabel;
    Label23: TLabel;
    DBComboBox14: TDBComboBox;
    groupVeiculos: TGroupBox;
    Label27: TLabel;
    DBComboBox19: TDBComboBox;
    Label25: TLabel;
    DBEdit6: TDBEdit;
    Label29: TLabel;
    DBComboBox20: TDBComboBox;
    Label18: TLabel;
    Label19: TLabel;
    DBComboBox9: TDBComboBox;
    DBComboBox10: TDBComboBox;
    DBComboBox11: TDBComboBox;
    Label20: TLabel;
    GroupBox4: TGroupBox;
    DBComboBox8: TDBComboBox;
    Label30: TLabel;
    edCodContaContabil: TEdit;
    Label31: TLabel;
    DBComboBox21: TDBComboBox;
    GroupBox10: TGroupBox;
    Label32: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label33: TLabel;
    procedure edCodContaContabilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodContaContabilExit(Sender: TObject);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit11Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn87Click(Sender: TObject);
    procedure BitBtn84Click(Sender: TObject);
    procedure BitBtn83Click(Sender: TObject);
    procedure BitBtn82Click(Sender: TObject);
    procedure BitBtn81Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure Panel19Enter(Sender: TObject);
    procedure DBComboBox18Enter(Sender: TObject);
    procedure DBComboBox17Enter(Sender: TObject);
    procedure DBComboBox7Enter(Sender: TObject);
    procedure DBEdit25Enter(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure montaTipoVendas;
  public
    { Public declarations }
  end;

  Texp_ExisteContaContabil = function (ACodContaContabil: string; AShowErro: Boolean): Boolean;

var
  frmCadNaturezaOperacao: TfrmCadNaturezaOperacao;
  obNatOperacao: TNaturezaOperacao;
  chaveCFOP_CST: string;

implementation

uses UDtmCadastrosBasicos, uDadosIni, uDtmAtivo, uDataSet_OOP, DBClient,
  SysUtils, DB;

{$R *.dfm}

procedure TfrmCadNaturezaOperacao.BitBtn10Click(Sender: TObject);
begin
  inherited;
  TForm(pnDescricaoNatOp.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNaturezaOperacao.BitBtn11Click(Sender: TObject);
begin
  inherited;
  obNatOperacao.vDescNatOp.Cancel;
  Panel5.Enabled := True;
  Panel6.Visible := False;
  DBGrid2.Visible := True;
end;

procedure TfrmCadNaturezaOperacao.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if obNatOperacao.vDescNatOp.Post then
    BitBtn11.Click
  else
    setFocusCampoErro(obNatOperacao.vDescNatOp.vNomeCampoErro);
end;

procedure TfrmCadNaturezaOperacao.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS066]';
  if vDadosIni.PesqPros('BAS062', 'PESQUISAR', '', 'NAT_OP', '', obNatOperacao.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not obNatOperacao.ConsultaCampos('NAT_OP', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not obNatOperacao.ConsultaCampos('NAT_OP', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if obNatOperacao.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    obNatOperacao.ultimasql := obNatOperacao.dataSet.CommandText;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadNaturezaOperacao.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.PesqPros('BAS063', 'INSERINDO NOVO REGISTRO', '', 'NAT_OP', '', obNatOperacao.buscas, true) then
    Exit;

  if not obNatOperacao.Insert then
    Exit;

  inherited;
  for I := 0 to ComponentCount - 1 do
   	if (Components[I] is TScrollBox) then
    	TScrollBox(Components[I]).VertScrollBar.Position := 0;

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tsCadastro;
  PageControl2.ActivePage := TabSheet5;
  obNatOperacao.vTextoInfComplementar.Clear;
  Memo3.Lines.Text := obNatOperacao.vTextoInfComplementar.Text;
  edCodContaContabil.Text := obNatOperacao.CodContaContabil;
  montaTipoVendas;
//      Label25.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';
//      DBEdit6.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';
//      Label27.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';
//      DBComboBox19.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    DBEdit1.SetFocus;
end;

procedure TfrmCadNaturezaOperacao.BitBtn41Click(Sender: TObject);
begin
  inherited;
  if not obNatOperacao.vRegCfopCST.Edit then
  	Exit;

  Panel10.Enabled := False;
  Panel16.Visible := True;
  DBGrid16.Visible := False;
  chaveCFOP_CST := obNatOperacao.vRegCfopCST.dataSet.FieldByName('CFOP').AsString + '|' +
  obNatOperacao.vRegCfopCST.dataSet.FieldByName('CST').AsString;
  if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
    DBEdit25.SetFocus;
end;

procedure TfrmCadNaturezaOperacao.BitBtn4Click(Sender: TObject);
begin
  if not obNatOperacao.Post then
    setFocusCampoErro(obNatOperacao.vNomeCampoErro, obNatOperacao.vMensagemErro)
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if obNatOperacao.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      MudaCor;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;

end;

procedure TfrmCadNaturezaOperacao.BitBtn5Click(Sender: TObject);
begin
	if TelaCadastro <> 2 then
  	inherited;

	obNatOperacao.Cancel;
  obNatOperacao.RollBackTransacao;
//  if vDadosIni.PesqPros('BAS070','CANCELAR', '','NAT_OP',obNatOperacao.dataSet.FieldByName('CODIGO_NOP').AsString, obNatOperacao.buscas, true) then
//  begin
//    ActiveControl := BitBtn5;
//    PageControl1.ActivePage := TabSheet2;
//  end;
end;

procedure TfrmCadNaturezaOperacao.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if not obNatOperacao.vDescNatOp.Edit then
  	Exit;

  Panel5.Enabled := False;
  Panel6.Visible := True;
  DBGrid2.Visible := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
    DBEdit5.SetFocus;
end;

procedure TfrmCadNaturezaOperacao.BitBtn81Click(Sender: TObject);
begin
  inherited;
  if not obNatOperacao.vRegCfopCST.Insert then
  	Exit;

  Panel10.Enabled := False;
  Panel16.Visible := True;
  DBGrid16.Visible := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
    DBEdit25.SetFocus;
end;

procedure TfrmCadNaturezaOperacao.BitBtn82Click(Sender: TObject);
begin
  inherited;
  obNatOperacao.vRegCfopCST.Delete;
end;

procedure TfrmCadNaturezaOperacao.BitBtn83Click(Sender: TObject);
begin
  inherited;
  TForm(pnRegrasCFOPCST.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNaturezaOperacao.BitBtn84Click(Sender: TObject);
begin
  inherited;
  obNatOperacao.vRegCfopCST.Cancel;
  Panel10.Enabled := True;
  Panel16.Visible := False;
  DBGrid16.Visible := True;
  chaveCFOP_CST := '';
end;

procedure TfrmCadNaturezaOperacao.BitBtn87Click(Sender: TObject);
begin
  inherited;
  if Trim(chaveCFOP_CST) <> Trim(obNatOperacao.vRegCfopCST.dataSet.FieldByName('CFOP').AsString + '|' +
  obNatOperacao.vRegCfopCST.dataSet.FieldByName('CST').AsString) then
    if obNatOperacao.vRegCfopCST.existeRegra(obNatOperacao.vRegCfopCST.dataSet.FieldByName('CFOP').AsString, obNatOperacao.vRegCfopCST.dataSet.FieldByName('CST').AsString)  then
    begin
      Application.MessageBox('Regra já existe!', 'Erro', MB_ICONERROR+MB_OK);
      Exit;
    end;
  if obNatOperacao.vRegCfopCST.Post then
  begin
    BitBtn84.Click;
    chaveCFOP_CST := '';
  end
  else
    setFocusCampoErro(obNatOperacao.vRegCfopCST.vNomeCampoErro);
end;

procedure TfrmCadNaturezaOperacao.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if not obNatOperacao.vDescNatOp.Insert then
  	Exit;

  Panel5.Enabled := False;
  Panel6.Visible := True;
  DBGrid2.Visible := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
    DBEdit5.SetFocus;
end;

procedure TfrmCadNaturezaOperacao.BitBtn9Click(Sender: TObject);
begin
  inherited;
  obNatOperacao.vDescNatOp.Delete;
end;

procedure TfrmCadNaturezaOperacao.DBComboBox17Enter(Sender: TObject);
begin
  inherited;
  Memo2.Lines.Text := 'Informar os seguintes valores:';
  Memo2.Lines.Add('Sim: Possui ICMS. Preenchimento obrigatório na nota fiscal');
  Memo2.Lines.Add('Não: Não Possui ICMS. Preenchimento com valor 0 (zero) na nota fiscal');
  Memo2.Lines.Add('Deixar em branco quando o preenchimento for facultativo');
end;

procedure TfrmCadNaturezaOperacao.DBComboBox18Enter(Sender: TObject);
begin
  inherited;
  Memo2.Lines.Text := 'Informar os seguintes valores:';
  Memo2.Lines.Add('Sim: Possui ICMS ST. Preenchimento obrigatório na nota fiscal');
  Memo2.Lines.Add('Não: Não Possui ICMS ST. Preenchimento com valor 0 (zero) na nota fiscal');
  Memo2.Lines.Add('Deixar em branco quando o preenchimento for facultativo');
end;

procedure TfrmCadNaturezaOperacao.DBComboBox7Enter(Sender: TObject);
begin
  inherited;
  Memo2.Lines.Text := 'Informar o CST para a regra';
end;

procedure TfrmCadNaturezaOperacao.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  obNatOperacao.existeInformacaoComplementar(obNatOperacao.dataSet.FieldByName('cod_inf').AsInteger);
  Memo3.Lines.Text := obNatOperacao.vTextoInfComplementar.Text;
end;

procedure TfrmCadNaturezaOperacao.DBEdit11KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('SPED_INFORMACAO_COMPLEMENTAR'));
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        StrToInt(vDadosIni.vPesquisa);
      except
        Exit;
      end;
      obNatOperacao.existeInformacaoComplementar(StrToInt(vDadosIni.vPesquisa));
      Memo3.Lines.Text := obNatOperacao.vTextoInfComplementar.Text;
    end;
  end;
end;

procedure TfrmCadNaturezaOperacao.DBEdit1Exit(Sender: TObject);
begin
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    inherited;
    if DBEdit1.Text = '' then
      exit;
    if obNatOperacao.verificaCodigo(trim(DBEdit1.Text)) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      	DBEdit1.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmCadNaturezaOperacao.DBEdit25Enter(Sender: TObject);
begin
  inherited;
  Memo2.Lines.Text := 'Informar o CFOP de entrada para a regra';
end;

procedure TfrmCadNaturezaOperacao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton1Click(sender)
  else if (key = VK_DELETE) then
    SpeedButton2Click(sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadNaturezaOperacao.edCodContaContabilExit(Sender: TObject);
var
  exp_ExisteContaContabil: Texp_ExisteContaContabil;
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not vDadosIni.LoadPackage('pkSPED', vDadosIni.vSped.AHandle) then
    Exit;

  @exp_ExisteContaContabil := GetProcAddress(vDadosIni.vSped.AHandle, PChar('exp_ExisteContaContabil'));
  if not Assigned(exp_ExisteContaContabil) then
    Exit;

  if exp_ExisteContaContabil(edCodContaContabil.Text, True) then
    obNatOperacao.CodContaContabil := edCodContaContabil.Text
  else if (Self.Enabled) and (Self.Visible) and (edCodContaContabil.CanFocus) then
    edCodContaContabil.SetFocus;
end;

procedure TfrmCadNaturezaOperacao.edCodContaContabilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    edCodContaContabil.Text := obNatOperacao.CodContaContabil
  else if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
    if vDadosIni.vPesquisa <> '' then
      edCodContaContabil.Text := vDadosIni.vPesquisa;
  end;
end;

procedure TfrmCadNaturezaOperacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obNatOperacao.Cancel;
  obNatOperacao.RollBackTransacao;
  obNatOperacao.free;
  Action := caFree;
  frmCadNaturezaOperacao := nil;
end;

procedure TfrmCadNaturezaOperacao.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;

  inherited;

  obNatOperacao := TNaturezaOperacao.create;

  TabSheet4.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  tsRegrasCFOPCST.TabVisible := False;
  tsDecricaoNatOp.TabVisible := False;
  tsCadastro.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
end;

procedure TfrmCadNaturezaOperacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end;

end;

procedure TfrmCadNaturezaOperacao.FormShow(Sender: TObject);
//var
//  I: Integer;
begin
  {  TabSheet4.TabVisible := False;
    DBGrid1.DataSource := DtmCadBasicos.dsNatOperacao;
    //  obNatOperacao.abreNaturezaOperacao;

    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    if TelaCadastro = 1 then
      BitBtn3Click(Sender);
    for I := 0 to Self.ComponentCount - 1 do
    begin
      if Components[I] is TDBEdit then
        TDBEdit(Components[I]).CharCase := ecUpperCase;
      if Components[I] is TDBComboBox then
        TDBComboBox(Components[I]).CharCase := ecUpperCase;
    end;

    if obNatOperacao.StatusLixeira then
      lixeiraVazia(false)
    else
      lixeiraVazia(true);
   }

//  obNatOperacao.montaSelect('select * from nat_op where CODIGO_NOP = 0');

  if vShow <> 1 then
  begin
  	DBGrid1.DataSource := DtmCadBasicos.dsNatOperacao;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
  imgDevolucaoSPED.Hint := 'CFOP de Devolução para SPED - EFD Contribuições' + #13 +  #13 +
    'Indica ao sistema que os itens nas notas fiscais com este CFOP serão escriturados no arquivo eletrônico da seguinte forma:' + #13 +
    'Para Lucro Presumido: As devoluções (entradas) de venda deverão ser excluídas da base de cálculo das notas de saída' + #13 +
    'Para Lucro Real: As devoluções (saídas) de compra a fornecedor deverão ser excluídas da base de cálculo das notas de entrada' + #13 +
    'Sendo assim este campo serve para identificar a operação de devolução, automaticamente o sistema vai pedir a referencia da nota fiscal,' +
    ' posteriormente na montagem do arquivo será feita da forma como citado acima';
  imgDevolucao.Hint := 'CFOP de Devolução NF - Controle Interno e Veículos' + #13 +  #13 +
    'Nota Fiscal de Mercadorias: Quando configurado faz com que o sistema crie o controle interno de Devolução nas operações de entrada' + #13 +
    'Nota Fiscal de Veículos: Quando configurado o sistema exige que o usuário referencie a nota fiscal que originou a operação, tanto entradas como saídas';


  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadNaturezaOperacao.montaTipoVendas;
begin
  DBComboBox13.Clear;
  if obNatOperacao.dataSet.State = dsEdit then
  begin
    if (vDadosIni.vRegistro.vSisVeiculos) then
    begin
      if obNatOperacao.dataSet.FieldByName('CODIGO_NOP').AsInteger  <= 3999 then
      begin
        DBComboBox13.Items.Add('A - ATIVO IMOBILIZADO');
        DBComboBox13.Items.Add('C - ENTRADA EM CONSIGNAÇÃO');
        DBComboBox13.Items.Add('D - ENTRADA EM DEMONSTRACAO');
        DBComboBox13.Items.Add('E - DEVOLUÇÃO DE MERCADORIA');
        DBComboBox13.Items.Add('O - OUTRAS ENTRADAS');
        DBComboBox13.Items.Add('R - RETORNO MERCADORIA EM DEMONSTRAÇÃO');
        DBComboBox13.Items.Add('T - ENTRADA TRANSFERÊNCIA DEPOSITO');
        DBComboBox13.Items.Add('V - COMPRA PARA COMERCIALIZAÇÃO');
        DBComboBox13.Items.Add('');
      end
      else if obNatOperacao.dataSet.FieldByName('CODIGO_NOP').AsInteger > 4999 then
      begin
        DBComboBox13.Items.Add('A - ATIVO IMOBILIZADO');
        DBComboBox13.Items.Add('C - SAÍDA EM CONSIGNAÇÃO');
        DBComboBox13.Items.Add('D - SAÍDA EM DEMONSTRAÇÃO');
        DBComboBox13.Items.Add('E - DEVOLUÇÃO DE MERCADORIA');
        DBComboBox13.Items.Add('O - OUTRAS SAÍDAS');
        DBComboBox13.Items.Add('R - RETORNO MERCADORIA EM DEMONSTRAÇÃO');
        DBComboBox13.Items.Add('T - SAIDA TRANSFERÊNCIA DEPOSITO');
        DBComboBox13.Items.Add('V - VENDA MERCADORIA ADQUIRIDA');
        DBComboBox13.Items.Add('');
      end;
    end
    else
    begin
      DBComboBox13.Items.Add('A - ATIVO IMOBILIZADO');
      DBComboBox13.Items.Add('');
    end;
    DBComboBox13.Text := obNatOperacao.dataSet.FieldByName('TIPV_VEICULO').AsString;
  end;

  obNatOperacao.buscas.Close;
  obNatOperacao.buscas.SQL.Text := 'select * from tipo_vendas' +
    ' where tipo = ''REQ'' order by ordemexibicao';
  obNatOperacao.buscas.Open;
  DBComboBox12.Items.Clear;
  obNatOperacao.buscas.First;
  while not obNatOperacao.buscas.Eof do
  begin
    if Pos('-', Trim(obNatOperacao.buscas.FieldByName('descricao').AsString)) = 3 then
      DBComboBox12.Items.Add(
        Trim(obNatOperacao.buscas.FieldByName('sigla').AsString) + ' - ' +
        Copy(Trim(obNatOperacao.buscas.FieldByName('descricao').AsString), 5, 20))
    else
      DBComboBox12.Items.Add(
        Trim(obNatOperacao.buscas.FieldByName('sigla').AsString) + ' - ' +
        Trim(obNatOperacao.buscas.FieldByName('descricao').AsString));
    obNatOperacao.buscas.Next;
  end;
end;

procedure TfrmCadNaturezaOperacao.Panel19Enter(Sender: TObject);
begin
  inherited;
  Memo2.Lines.Text := '';
end;

procedure TfrmCadNaturezaOperacao.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Natureza de Operação');
end;

procedure TfrmCadNaturezaOperacao.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  if obNatOperacao.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('BAS064', 'EDITANDO REGISTRO', '', 'NAT_OP', obNatOperacao.dataSet.FieldByName('CODIGO_NOP').AsString, obNatOperacao.buscas, true) then
    Exit;

  if obNatOperacao.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;

  if not obNatOperacao.Edit then
    Exit;

  inherited;
  for I := 0 to ComponentCount - 1 do
   	if (Components[I] is TScrollBox) then
    	TScrollBox(Components[I]).VertScrollBar.Position := 0;

  obNatOperacao.existeInformacaoComplementar(obNatOperacao.dataSet.FieldByName('cod_inf').AsInteger);
  Memo3.Lines.Text := obNatOperacao.vTextoInfComplementar.Text;
  edCodContaContabil.Text := obNatOperacao.CodContaContabil;
  montaTipoVendas;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tsCadastro;
  PageControl2.ActivePage := TabSheet5;
//        Label25.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';
//        DBEdit6.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';
//        Label27.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';
//        DBComboBox19.Visible := vDadosIni.vEmp.vVersaoVeiculos = '4';
  if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TfrmCadNaturezaOperacao.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS068', 'ABRIR A LIXEIRA', '', 'NAT_OP', '', obNatOperacao.buscas, true) then
  begin
    inherited;
    if not obNatOperacao.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS066]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS065]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TfrmCadNaturezaOperacao.SpeedButton2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS065', '', '', 'NAT_OP', '', obNatOperacao.buscas, false) then
  begin
    inherited;
    obNatOperacao.Delete;
    if obNatOperacao.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TfrmCadNaturezaOperacao.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS071', 'IMPRIMIR', '', 'NAT_OP', '', obNatOperacao.buscas, true) then
  begin
    inherited;
    QuickRep1.Preview;
  end;
end;

procedure TfrmCadNaturezaOperacao.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS067', '', '', 'NAT_OP', '', obNatOperacao.buscas, false) then
  begin
    inherited;
    obNatOperacao.restauraLixeira;
    if obNatOperacao.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TfrmCadNaturezaOperacao.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not obNatOperacao.dataSet.IsEmpty then
    obNatOperacao.vRegCfopCST.abreFormRegras(obNatOperacao.dataSet.FieldByName('codigo_nop').AsString);
end;

procedure TfrmCadNaturezaOperacao.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not obNatOperacao.dataSet.IsEmpty then
    obNatOperacao.vDescNatOp.abreFormDescricaoNATOP(obNatOperacao.dataSet.FieldByName('codigo_nop').AsString);
end;

end.

