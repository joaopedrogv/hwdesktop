unit UDevolucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Grids, DBGrids, UclassesDevolucao, Mask,
  DBCtrls, ExtCtrls, QuickRpt, QRCtrls, Buttons, uEditHw, uEditMoeda;

type
  TfrmDevolucao = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    Edit7: TEdit;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    GroupBox6: TGroupBox;
    DBGrid3: TDBGrid;
    Label12: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Edit8: TEdit;
    TabSheet4: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSeq: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel9: TQRLabel;
    lbQuantTotal: TQRLabel;
    lbValorTotal: TQRLabel;
    GroupBox7: TGroupBox;
    Edit3: TEdit;
    Label15: TLabel;
    lbNomeCLiente: TLabel;
    TabSheet5: TTabSheet;
    GroupBox8: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit4: TEdit;
    lbNomeCLiente2: TLabel;
    GroupBox9: TGroupBox;
    DBGrid4: TDBGrid;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel12: TQRLabel;
    qrlCliente: TQRLabel;
    QRDBText2: TQRDBText;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    TabSheet6: TTabSheet;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit9: TEdit;
    Label22: TLabel;
    Edit10: TEdit;
    DBGrid5: TDBGrid;
    TabSheet7: TTabSheet;
    GroupBox16: TGroupBox;
    DBGrid7: TDBGrid;
    GroupBox17: TGroupBox;
    Label23: TLabel;
    lbcodigodavenda: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn3: TBitBtn;
    GroupBox18: TGroupBox;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    GroupBox19: TGroupBox;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    DBGrid6: TDBGrid;
    Label25: TLabel;
    ComboBox2: TComboBox;
    Label26: TLabel;
    QRDBText10: TQRDBText;
    tsAlterarValor: TTabSheet;
    pnAlterarValor: TPanel;
    GroupBox53: TGroupBox;
    Label161: TLabel;
    DBEdit102: TDBEdit;
    pnSelecionaGrade: TPanel;
    Label27: TLabel;
    ComboBox3: TComboBox;
    imgInformation: TImage;
    TabSheet8: TTabSheet;
    pnRecibosDev: TPanel;
    Panel67: TPanel;
    BitBtn113: TBitBtn;
    DBGrid28: TDBGrid;
    BitBtn112: TBitBtn;
    BitBtn23: TBitBtn;
    Label29: TLabel;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbNomeProduto: TLabel;
    lbNomeVendedor: TLabel;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    EditHw1: TEditHw;
    Panel1: TPanel;
    lbDescrValorDev: TLabel;
    lbValorDev: TLabel;
    Panel2: TPanel;
    BitBtn21: TBitBtn;
    DBGrid8: TDBGrid;
    Panel3: TPanel;
    BitBtn61: TBitBtn;
    BitBtn63: TBitBtn;
    Panel4: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Panel5: TPanel;
    Label8: TLabel;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    tsProdDoc: TTabSheet;
    pnProdDoc: TPanel;
    Panel6: TPanel;
    btProdDocOK: TBitBtn;
    GroupBox20: TGroupBox;
    lbGrupoProd: TLabel;
    lbGrupoProdVl: TLabel;
    lbCodProd: TLabel;
    lbCodProdVl: TLabel;
    lbDescProd: TLabel;
    lbDescrProdVl: TLabel;
    lbNumFab: TLabel;
    lbNumFabVl: TLabel;
    lbNItem: TLabel;
    lbNItemVl: TLabel;
    Panel7: TPanel;
    Label30: TLabel;
    EditHwQtdeDev: TEditHw;
    tbProdDocCancel: TBitBtn;
    Panel8: TPanel;
    Label24: TLabel;
    Label28: TLabel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    ComboBox4: TComboBox;
    Panel9: TPanel;
    BitBtn1: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn2: TBitBtn;
    Label31: TLabel;
    ComboBox5: TComboBox;
    lbUnidadeProd: TLabel;
    lbUnidadeProdVl: TLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    BitBtn24: TBitBtn;
    Panel10: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel62: TPanel;
    Panel56: TPanel;
    Panel118: TPanel;
    Panel119: TPanel;
    pnDevParcial: TPanel;
    pnDevTotal: TPanel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn24Click(Sender: TObject);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbProdDocCancelClick(Sender: TObject);
    procedure pnProdDocEnter(Sender: TObject);
    procedure btProdDocOKClick(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn112Click(Sender: TObject);
    procedure BitBtn113Click(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure DBGrid8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw1Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn61Click(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit8KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit10KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LimparDados(pLimpar: Boolean = False);
    procedure AtualizarValorDev;
    procedure BuscaPrencherPedido(ANped: Integer; ATipo: string; ADataFech: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDevolucao: TfrmDevolucao;
  obDevolucao: TDevolucao;

  //variáveis utilizdas na Impressão da Devolução.
  vValorTotal, vQuantTotal: Real;

implementation

uses
  Udtmdevolucao, uDtmAtivo, uDadosIni, DB, uDataSet_OOP, Math;

{$R *.dfm}

procedure TfrmDevolucao.AtualizarValorDev;
var
	vDev: Double;
begin
	try
    vDev := 0;
    obDevolucao.storeRecNo;
    obDevolucao.First;
    while not obDevolucao.Eof do
    begin
      vDev := vDev +
      	vDadosIni.IfThen(obDevolucao.dataSet.FieldByName('valor_tot').Asfloat > 0,
        	obDevolucao.dataSet.FieldByName('valor_tot').Asfloat,
	        obDevolucao.dataSet.FieldByName('quant').Asfloat * obDevolucao.dataSet.FieldByName('valor').Asfloat);
      obDevolucao.Next;
    end;

    lbValorDev.Caption := 'R$' + format('%n', [vDev]);
  finally
    obDevolucao.restoreRecNo;
  end;
end;

procedure TfrmDevolucao.BitBtn10Click(Sender: TObject);
var
  vInseriuitens: Boolean;
  vqtdedev, vqtdedevConv: double;
  Quantidade, QuantidadeConv: double;
begin
  inherited;
  if not vDadosIni.PesqPros('DEV008', 'BT SELECIONAR VENDA ATRAVEZ DA PESQUISA (F3).', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
    exit;
  vInseriuitens := False;

  if not obDevolucao.vPedvenda.dataSet.IsEmpty then
  begin
    if not obDevolucao.pesquisaCLiente(obDevolucao.vPedvenda.dataSet.FieldByName('cod_cliente').AsString) then
    begin
      Application.MessageBox('Cliente não encontrado! Pressione F3 para consulta.', 'Atenção', MB_ICONINFORMATION + MB_OK);
      Exit;
    end;

    try
    	obDevolucao.vPedVendaProd.dataSet.DisableControls;
      obDevolucao.vPedVendaProd.dataSet.first;
      while not obDevolucao.vPedVendaProd.dataSet.Eof do
      begin
//      	if (DBGrid6.SelectedRows.CurrentRowSelected) and (obDevolucao.vPedVendaProd.dataSet.FieldByName('SEL').AsString <> 'S') then
//        begin
//          obDevolucao.vPedVendaProd.dataSet.Edit;
//          obDevolucao.vPedVendaProd.dataSet.FieldByName('SEL').AsString := 'S';
//          obDevolucao.vPedVendaProd.dataSet.Post;
//        end
//        else if obDevolucao.vPedVendaProd.dataSet.FieldByName('sel').AsString = 'S' then
//        	DBGrid6.SelectedRows.CurrentRowSelected := obDevolucao.vPedVendaProd.dataSet.FieldByName('sel').AsString = 'S';

        if obDevolucao.vPedVendaProd.dataSet.FieldByName('SEL').AsString = 'S' then
        begin
          obDevolucao.vSequencia := 0;
          obDevolucao.vtipo := ComboBox4.Text;
  //        obDevolucao.vtipoVenda := ComboBox2.text;
          obDevolucao.vtipoVenda := trim(obDevolucao.vPedvenda.dataSet.FieldByName('TIPO').AsString);
          obDevolucao.vExisteVenda := True;
          while true do
          begin
            lbNItemVl.Caption := trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('nitem').AsString);
            lbGrupoProdVl.Caption := trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('grupo_prod').AsString);
            lbCodProdVl.Caption := trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('cod_prod').AsString);
            lbNumFabVl.Caption := trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('num_fab_prod').AsString);
            lbDescrProdVl.Caption := trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('descr_prod_ped').AsString);
            lbUnidadeProdVl.Caption := vDadosIni.IfThen(trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('unidade_conv').AsString) <> '',
            	trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('unidade_conv').AsString),
              trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('unidade').AsString));

            EditHwQtdeDev.AsValue := vDadosIni.IfThen(obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item_conv').AsFloat > 0,
            	obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item_conv').AsFloat -
              obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_dev_item_temp_conv').AsFloat,
              obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsFloat -
              obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_dev_item_temp').AsFloat);

            if not vDadosIni.abreForm('Informe a quantidade a devolver', pnProdDoc, [ofAutoSize]) then
            begin
              obDevolucao.dataSet.First;
              while not obDevolucao.dataSet.Eof do
                obDevolucao.dataSet.Delete;
              exit;
            end
            else
            begin
              try
              	vqtdedevConv := RoundTo(EditHwQtdeDev.AsValue, - 4);
                if not obDevolucao.SqlOpen(' SELECT SIGLA, DESCRICAO, FRACIONADO FROM UNIDADES ' +
                  ' WHERE SIGLA = ' + QuotedStr(trim(lbUnidadeProdVl.Caption)) +
                  ' AND COALESCE(FRACIONADO, 0) = 0 ', obDevolucao.buscas).IsEmpty then
                  	vqtdedevConv := RoundTo(vqtdedevConv, 0);

                if (trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('UNIDADE_CONV').AsString) = '')
                  or (trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('UNIDADE').AsString) = trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('UNIDADE_CONV').AsString)) then
                		vqtdedev := RoundTo(vqtdedevConv, - 4)
                else
                begin
                  if (obDevolucao.vPedVendaProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'M') and (obDevolucao.vPedVendaProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
                    vqtdedev := RoundTo(vqtdedevConv / obDevolucao.vPedVendaProd.dataSet.FieldByName('FATOR_CONV').AsFloat, - 4)
              		else if (obDevolucao.vPedVendaProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'D') and (obDevolucao.vPedVendaProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
                  	vqtdedev := RoundTo(vqtdedevConv * obDevolucao.vPedVendaProd.dataSet.FieldByName('FATOR_CONV').AsFloat, - 4)
                  else
                  	vqtdedev := RoundTo(vqtdedevConv, - 4)
                end;

                Quantidade     := RoundTo(vqtdedev, - 4);
                QuantidadeConv := RoundTo(vqtdedevConv, - 4);

                if vDadosIni.StrToFloatFormat(vqtdedev, 4) < 0.001 then
                  Application.MessageBox('Quantidade informada não informada. Favor informar novamente', 'Atenção', MB_ICONINFORMATION + MB_OK)
                else if vDadosIni.StrToFloatFormat(vqtdedevConv, 4) > vDadosIni.StrToFloatFormat(obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item_conv').AsFloat, 4) then
                  Application.MessageBox(PChar('Quantidade informada maior que a quantidade do item: ' + #13 + #13 +
                  'Quantidade informada: ' + FormatFloat('0.000', RoundTo(vqtdedevConv, - 4)) + #13 +
                  'Quantidade do item..: ' + FormatFloat('0.000', RoundTo(obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item_conv').AsFloat, - 4)) + #13 + #13 +
                  'Favor informar novamente.'),
                  'Atenção', MB_ICONINFORMATION + MB_OK)
                else if vDadosIni.StrToFloatFormat(vqtdedev, 4) > vDadosIni.StrToFloatFormat(obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsFloat, 4) then
                  Application.MessageBox(PChar('Quantidade informada maior que a quantidade do item: ' + #13 + #13 +
                  'Quantidade informada: ' + FormatFloat('0.000', RoundTo(vqtdedev, - 4)) + #13 +
                  'Quantidade do item..: ' + FormatFloat('0.000', RoundTo(obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsFloat, - 4)) + #13 + #13 +
                  'Favor informar novamente.'),
                  'Atenção', MB_ICONINFORMATION + MB_OK)
                else
                  break
              except
                Application.MessageBox('Valor informado não é numérico. Favor informar novamente', 'Atenção', MB_ICONINFORMATION + MB_OK);
              end;
            end;
          end;

          obDevolucao.vTipv := obDevolucao.vPedvenda.dataSet.FieldByName('TIPV').AsString;
          if obDevolucao.InserirDevolucaopelaVenda(Quantidade, QuantidadeConv) then
          begin
            obDevolucao.InserirDevolucaoGradepelaVenda;
            vInseriuitens := True;
          end;

        end;
        obDevolucao.vPedVendaProd.dataSet.Next;
      end;
    finally
      obDevolucao.vPedVendaProd.dataSet.EnableControls;
    end;

    PageControl1.ActivePage := TabSheet1;
    TabSheet1.Show;

    ComboBox2.Text := trim(obDevolucao.vPedvenda.dataSet.FieldByName('tipo').AsString);
    Edit8.Text := obDevolucao.vPedvenda.dataSet.FieldByName('nped').AsString;
    Edit3.Text := obDevolucao.vPedvenda.dataSet.FieldByName('cod_cliente').AsString;
    Edit3.Enabled := False;
    obDevolucao.vTipv := obDevolucao.vPedvenda.dataSet.FieldByName('TIPV').AsString;
    obDevolucao.vCodVenda := Edit8.text;
    obDevolucao.vtipoVenda := ComboBox2.text;
    AtualizarValorDev;
    Edit3.OnExit(Sender);

    if vInseriuitens = True then
    begin
      Edit8.Enabled := False;
      if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
	      Edit1.SetFocus;
      Exit;
    end;
    if (Self.Enabled) and (Self.Visible) and (Edit7.CanFocus) then
	    Edit7.SetFocus;
  end
  else
    Application.MessageBox('Nenhuma venda selecionada, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);

end;

procedure TfrmDevolucao.BitBtn112Click(Sender: TObject);
begin
  if Application.MessageBox('Deseja fazer recibo antecipado(VALECOMPRA) desta devolução?', 'Atenção', MB_YESNO + MB_ICONQUESTION+MB_DEFBUTTON1)= ID_NO then
    exit;

  if not vDadosIni.PesqPros('DEV021', 'GERAR', '', 'DEVOLUCAO',
    DBGrid4.DataSource.DataSet.FieldByName('sequencia').AsString, obDevolucao.buscas, true) then
   exit;

 TForm(pnRecibosDev.Parent).ModalResult := IDOK;  
end;

procedure TfrmDevolucao.BitBtn113Click(Sender: TObject);
begin
  inherited;
  TForm(pnRecibosDev.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmDevolucao.BitBtn11Click(Sender: TObject);
begin
  inherited;

  MaskEdit3.Text := '';
  MaskEdit4.Text := '';
  Edit9.Text := '';
  Edit10.Text := '';

  if Self.Tag = 999 then
  begin
  	Close;
    exit;
  end;

  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;

  obDevolucao.vPedvenda.dataSet.Close;
  obDevolucao.vPedVendaProd.dataSet.Close;

  if (Self.Enabled) and (Self.Visible) and (combobox2.CanFocus) then
    combobox2.SetFocus;
  Edit8.Enabled := true;
end;

procedure TfrmDevolucao.BitBtn12Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
  obDevolucao.vPedVendaProd.dataSet.Close;
  if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
    Edit1.SetFocus;
end;

procedure TfrmDevolucao.BitBtn13Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('DEV009', 'BT SELECIONAR INTEM DA VENDA (F4).', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
    exit;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
  if not obDevolucao.vPedVendaProd.dataSet.IsEmpty then
  begin
    Edit1.Text := obDevolucao.vPedVendaProd.dataSet.FieldByName('num_fab_prod').AsString;
    Edit5.Text := vDadosIni.IfThen(obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item_conv').AsFloat > 0,
    	obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item_conv').AsFloat,
      obDevolucao.vPedVendaProd.dataSet.FieldByName('quant_ped_item').AsFloat);

    obDevolucao.vCodBarra := obDevolucao.vPedVendaProd.dataSet.FieldByName('num_fab_prod').AsString;
    obDevolucao.vGrupoProdPesq := obDevolucao.vPedVendaProd.dataSet.FieldByName('grupo_prod').AsString;
    obDevolucao.vCodProdPesq := obDevolucao.vPedVendaProd.dataSet.FieldByName('cod_prod').AsString;
    obDevolucao.vUnidadePesq := vDadosIni.IfThen(trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('unidade_conv').AsString) <> '',
    	trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('unidade_conv').AsString),
      trim(obDevolucao.vPedVendaProd.dataSet.FieldByName('unidade').AsString));

    vDadosIni.montarDbComboboxUndConv(
      obDevolucao.buscas,
      ComboBox5,
      obDevolucao.vPedVendaProd.dataset.fieldbyname('GRUPO_PROD').AsInteger,
      obDevolucao.vPedVendaProd.dataset.fieldbyname('COD_PROD').AsString,
      obDevolucao.vPedVendaProd.dataset.fieldbyname('NUM_FAB_PROD').AsString,
      vDadosIni.IfThen(trim(obDevolucao.vPedVendaProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
      	trim(obDevolucao.vPedVendaProd.dataset.fieldbyname('UNIDADE_CONV').AsString),
        trim(obDevolucao.vPedVendaProd.dataset.fieldbyname('UNIDADE').AsString)));
  end;

  if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
    Edit1.SetFocus;
end;

procedure TfrmDevolucao.BitBtn14Click(Sender: TObject);
var
  vCodDevReq: Integer;
  vTpDevReq: string;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn14.CanFocus) then
    BitBtn14.SetFocus;
  if obDevolucao.IsEmpty then
    exit;
  if not vDadosIni.PesqPros('DEV003', 'PERMITIR','BT CONCLUIR DEVOLUCAO.', 'DEVOLUCAO',
      obDevolucao.dataSet.FieldByName('sequencia').AsString, obDevolucao.buscas, False) then
    EXIT;

  try
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    BitBtn22.Enabled := False;
    BitBtn14.Enabled := False;
    BitBtn15.Enabled := False;
    BitBtn16.Enabled := False;

    if obDevolucao.ConcluindoDevolucao(Edit8.text) = True then
    begin
      vCodDevReq := vDadosIni.IfThen(obDevolucao.dataSet.FieldByName('cod_venda').AsInteger > 0,
        obDevolucao.dataSet.FieldByName('cod_venda').AsInteger,
        obDevolucao.dataSet.FieldByName('sequencia').AsInteger);
      vTpDevReq := vDadosIni.IfThen(obDevolucao.dataSet.FieldByName('cod_venda').AsInteger > 0,
        trim(obDevolucao.dataSet.FieldByName('tipo_venda').AsString),
        'DEV');
      LimparDados;
      vDadosIni.ImprimirRecProgFid(obDevolucao.buscas, vCodDevReq, vTpDevReq, 'DÉBITO'); //Imprimir recibo programa de fidelidade
      LimparDados(True);
      Close;
    end
    else if not obDevolucao.vInserirEstoqueGrade then
    	if (Self.Enabled) and (Self.Visible) and (combobox2.CanFocus) then
        combobox2.SetFocus;
  finally
    BitBtn1.Enabled := True;
    BitBtn2.Enabled := True;
    BitBtn22.Enabled := True;
    BitBtn14.Enabled := True;
    BitBtn15.Enabled := True;
    BitBtn16.Enabled := True;
  end;
end;

procedure TfrmDevolucao.BitBtn15Click(Sender: TObject);
begin
  inherited;
  vDadosIni.PesqPros('DEV004', 'BT SAIR DA DEVOLUCAO (CANCELAR DEVOLUCAO).', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False);

  Close;

end;

procedure TfrmDevolucao.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('DEV005', 'BT VIZUALIZAR DEVOLUCOES LANCADAS.', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
    Exit;

  MaskEdit1.Text := DateToStr(Date);
  MaskEdit2.Text := DateToStr(Date);
  PageControl1.ActivePage := TabSheet5;
  TabSheet5.Show;
  if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
    MaskEdit1.SetFocus;
end;

procedure TfrmDevolucao.BitBtn17Click(Sender: TObject);
var
  vCodDevReq: Integer;
  vTpDevReq: string;
begin
  inherited;
  vCodDevReq := 0;
  vTpDevReq := '';
  if not DBGrid4.DataSource.DataSet.IsEmpty then
  begin
    vCodDevReq := vDadosIni.IfThen(DBGrid4.DataSource.DataSet.FieldByName('cod_venda').AsInteger > 0,
      DBGrid4.DataSource.DataSet.FieldByName('cod_venda').AsInteger,
      DBGrid4.DataSource.DataSet.FieldByName('sequencia').AsInteger);
    vTpDevReq := vDadosIni.IfThen(DBGrid4.DataSource.DataSet.FieldByName('cod_venda').AsInteger > 0,
    	trim(DBGrid4.DataSource.DataSet.FieldByName('tipo_venda').AsString),
      'DEV');
  end;

  if not vDadosIni.PesqPros('DEV006', 'BT EXCLUIR DEVOLUCAO.', '', 'DEVOLUCAO',
    DBGrid4.DataSource.DataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
    Exit;

  if obdevolucao.ApagarDevolucao = True then
    if not obDevolucao.pesquisadevolucao(true) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
        MaskEdit1.SetFocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
      DBGrid4.SetFocus;
  if vCodDevReq > 0 then
    vDadosIni.ImprimirRecProgFid(obDevolucao.buscas, vCodDevReq, vTpDevReq, 'CRÉDITO'); //Imprimir recibo programa de fidelidade
//    BitBtn8Click(Sender);
end;

procedure TfrmDevolucao.BitBtn18Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('DEV010', 'BT IMPRIMIR DEVOLUCAO MODELO GRAFICO.', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
    if not obDevolucao.ImprimirPesquisaDevolucaoGrafico then
    	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
	      MaskEdit1.SetFocus;
end;

procedure TfrmDevolucao.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('DEV011', 'BT IMPRIMIR DEVOLUCAO MODELO MATRICIAL.', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
    if not obDevolucao.ImprimirPesquisaDevolucaoMatricial(dtmDevolucao.Rdp1) then
    	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
	      MaskEdit1.SetFocus;
end;

procedure TfrmDevolucao.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('DEV001', 'BT INSERIR ITEM NA DEVOLUCAO.', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
    Exit;

  if trim(Edit5.Text) <> '' then
  begin
    try
      StrToCurr(Edit5.Text);
    except
      Application.MessageBox(PChar('Valor inválido.' + chr(13) + 'Verifique o campo Quantidade .'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
  end;

  if Edit5.text <> '' then
    obDevolucao.vQuant := vDadosIni.StrToFloatFormat(StrToFloat(Edit5.text),3)
  else
    obDevolucao.vQuant := 0;

  obDevolucao.vTipo := trim(ComboBox1.Items[ComboBox1.ItemIndex]);

  obDevolucao.vUnidade := trim(ComboBox5.Items[ComboBox5.ItemIndex]);

  if (Self.Enabled) and (Self.Visible) and (Bitbtn1.CanFocus) then
  	BitBtn1.SetFocus;
  if not obDevolucao.somentePost then
    setFocusCampoErro(obDevolucao.vNomeCampoErro) //Edit1.SetFocus
  else
  begin
    Edit1.Text := '';
    //    if not obDevolucao.vDevRapida then
    //    begin
    Edit5.Text := '';
    //      ComboBox1.ItemIndex := 0;
    //      EditHw1.AsValue := 0;
    lbNomeProduto.Caption := '';
    //      lbNomeVendedor.Caption := '';
    //    end;
    obDevolucao.vGrupoProdPesq := '';
    obDevolucao.vCodProdPesq := '';
    obDevolucao.vUnidadePesq := '';
    AtualizarValorDev;
    vDadosIni.carregarUnidades(
      obDevolucao.buscas,
      ComboBox5);
    if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
      Edit1.SetFocus;
  end;
end;

procedure TfrmDevolucao.BitBtn20Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
  Edit8.Enabled := obDevolucao.IsEmpty;
  Edit3.Enabled := obDevolucao.IsEmpty;
  if Edit8.Enabled then
  begin
  	if (Self.Enabled) and (Self.Visible) and (Edit8.CanFocus) then
      Edit8.SetFocus
  end
  else if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
    Edit1.SetFocus;
end;

procedure TfrmDevolucao.BitBtn21Click(Sender: TObject);
begin
  inherited;
  TForm(pnSelecionaGrade.Parent).ModalResult := IDOK;
end;

procedure TfrmDevolucao.BitBtn22Click(Sender: TObject);
begin
  inherited;
  if not obDevolucao._abreFormAlterarValorDev then
  	exit;
    
  AtualizarValorDev;
end;

procedure TfrmDevolucao.BitBtn23Click(Sender: TObject);
var
  vRecNo: Integer;
begin
  if not vDadosIni.PesqPros('DEV020', 'VISUALIZAR', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
      exit;

  if DBGrid4.DataSource.DataSet.IsEmpty then
  begin
    Application.MessageBox('Favor selecionar uma devolução!', 'Atenção', MB_ICONINFORMATION + MB_OK);
  	exit;
  end;
        
  vRecNo := DBGrid4.DataSource.DataSet.RecNo;
  if not obDevolucao.abreFormVisualizarDev(DBGrid4.DataSource.DataSet.FieldByName('sequencia').AsInteger,
    DBGrid4.DataSource.DataSet.FieldByName('valordev').AsFloat) then
    exit;
  try
    Screen.Cursor := crHourGlass;
    obDevolucao.pesquisadevolucao;
    DBGrid4.DataSource.DataSet.RecNo := vRecNo;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmDevolucao.BitBtn24Click(Sender: TObject);
begin
	if DBGrid28.DataSource.DataSet.IsEmpty then
    Exit;

  try
    vDadosIni.abreStatusProcessamento('Impressão de recibo', 'Processando informações...');
    if DBGrid28.DataSource.DataSet.FieldByName('NRECIBO').AsInteger > 0 then
    begin
      vDadosIni.vPesquisa := 'IMPRIMIRRECIBO|' +  IntToStr(DBGrid28.DataSource.DataSet.FieldByName('NRECIBO').AsInteger) + '|';
      if obDevolucao._mdiAberto('TFrmCadRecibo', 'O modulo do Recibo / Vale Compra  se encontra aberto') then
      	obDevolucao.abreFormRecibo;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmDevolucao.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if not obDevolucao.IsEmpty then
    if Application.MessageBox('Deseja cancelar o item selecionado?', 'Confirmação',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1)=ID_NO then
      exit;
  if not vDadosIni.PesqPros('DEV002', 'BT CANCELAR ITEM NA DEVOLUCAO.', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
    exit;

  LimparDados;
  vDadosIni.carregarUnidades(
    obDevolucao.buscas,
    ComboBox5);
end;

procedure TfrmDevolucao.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('DEV007', 'BT SELECIONAR GRADE DE ITEM (ITEM COM GRADE).', '', 'DEVOLUCAO',
    obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
  begin
    PageControl1.ActivePage := TabSheet1;
    TabSheet1.Show;
    if (Self.Enabled) and (Self.Visible) and (Edit5.CanFocus) then
      Edit5.SetFocus;
  end;
end;

procedure TfrmDevolucao.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if Edit2.Text <> '' then
  begin
    if not vDadosIni.PesqPros('DEV012', 'BT ADICIONAR ESTOQUE DA GRADE DO PRODUTO.', '', 'DEVOLUCAO',
      obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
      exit;
    obDevolucao.vQuant := 0;
    obDevolucao.vQuant := StrToCurr(Edit2.Text);
    obDevolucao.EditarEstoqueGradeProduto;
  end
  else
    Application.MessageBox('Quantidade não informada, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);

end;

procedure TfrmDevolucao.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if obDevolucao.desfazerEdicaoEstoqueGradeProduto then
  begin
    if not vDadosIni.PesqPros('DEV013', 'BT DESFAZER ULTIMA ADICAO DE ESTOQUE DA GRADE.', '', 'DEVOLUCAO',
      obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
      exit;
    Label14.Caption := '0';
    if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
      DBGrid3.SetFocus;
  end;
end;

procedure TfrmDevolucao.BitBtn61Click(Sender: TObject);
begin
  inherited;
  obDevolucao.dataSet.FieldByName('VALOR_TOT').AsFloat :=
   obDevolucao.dataSet.FieldByName('QUANT').AsFloat *
   	obDevolucao.dataSet.FieldByName('VALOR').AsFloat;

  TForm(pnAlterarValor.Parent).ModalResult := IDOK;
end;

procedure TfrmDevolucao.BitBtn63Click(Sender: TObject);
begin
  inherited;
  TForm(pnAlterarValor.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmDevolucao.BitBtn6Click(Sender: TObject);
begin
  inherited;
  if ActiveControl = DBGrid1 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
      Edit2.SetFocus;
  end
  else
  begin
    if obDevolucao.ValorAcrescimo(obDevolucao.vGrade.dataSet, 'QTDE', obDevolucao.dataSet.FieldByName('grupo_prod').AsInteger, obDevolucao.dataSet.FieldByName('cod_prod').AsString) <> obDevolucao.vquantreq then
    begin
      Application.MessageBox('A quantidade acrescentada não pode ser diferente da quantidade da nota.', 'Atenção', MB_ICONINFORMATION + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
        Edit2.SetFocus;
      exit;
    end
    else
    begin
      PageControl1.ActivePage := TabSheet1;
	    TabSheet1.Show;
    end;
    TabSheet3.TabVisible := False;
  end;

end;

procedure TfrmDevolucao.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if obDevolucao.CancelarEdicaoEstoqueGradeProduto = True then
  begin
    if not vDadosIni.PesqPros('DEV014', 'BT CANCELAR ADICAO DE ESTOQUE DA GRADE DO PRODUTO.', '', 'DEVOLUCAO',
      obDevolucao.dataSet.FieldByName('sequencia').AsString, dtmDevolucao.qrBuscas, False) then
      exit;
    Label14.Caption := '';
    if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
      DBGrid3.SetFocus;
  end;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
end;

procedure TfrmDevolucao.BitBtn8Click(Sender: TObject);
begin
  inherited;

  obDevolucao.vdataini := '';
  obDevolucao.vdatafin := '';
  obDevolucao.vcodcli := '';

  obDevolucao.vdataini := MaskEdit1.Text;
  obDevolucao.vdatafin := MaskEdit2.Text;
  obDevolucao.vcodcli := Edit4.Text;

  if not obDevolucao.pesquisadevolucao then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
	    MaskEdit1.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
    DBGrid4.SetFocus;
end;

procedure TfrmDevolucao.BitBtn9Click(Sender: TObject);
begin
  inherited;
  obDevolucao.vdataini := '';
  obDevolucao.vdatafin := '';
  obDevolucao.vcodcli := '';
  obDevolucao.vNped := '';

  obDevolucao.vdataini := MaskEdit3.Text;
  obDevolucao.vdatafin := MaskEdit4.Text;
  obDevolucao.vcodcli := Edit10.Text;
  obDevolucao.vNped := Edit9.Text;
  obDevolucao.vDAV := Edit6.Text;

  if not obDevolucao.PesquisadeVendas then
  begin
    if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
      MaskEdit3.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
    DBGrid5.SetFocus;
end;

procedure TfrmDevolucao.btProdDocOKClick(Sender: TObject);
begin
	TForm(pnProdDoc.Parent).ModalResult := IDOK;
end;

procedure TfrmDevolucao.btSelectAllClick(Sender: TObject);
begin
  obDevolucao.vPedVendaProd._marcarTodos;
end;

procedure TfrmDevolucao.btUnSelectAllClick(Sender: TObject);
begin
  obDevolucao.vPedVendaProd._desmarcarTodos;
end;

procedure TfrmDevolucao.BuscaPrencherPedido(ANped: Integer; ATipo: string; ADataFech: string);
var
	I: Integer;
begin
	MaskEdit3.Text := ADataFech;
  MaskEdit4.Text := ADataFech;

  for I := 0 to frmDevolucao.ComboBox3.Items.Count - 1 do
  	if trim(frmDevolucao.ComboBox3.Items[I]) = trim(ATipo) then
    begin
    	frmDevolucao.ComboBox3.ItemIndex := I;
      Break;
    end;

  Edit9.Text := IntToStr(ANped);

  PageControl1.ActivePage := TabSheet6;
  TabSheet6.Show;
  
  obDevolucao.vPedvenda.Close;
  obDevolucao.vPedVendaProd.Close;
end;

procedure TfrmDevolucao.CheckBox1Click(Sender: TObject);
begin
  inherited;
  obDevolucao.vDevRapida := CheckBox1.Checked;
  Edit5.Text := '';
  ComboBox1.ItemIndex := 0;
  //  Edit6.Text := '';
//  EditHw1.AsValue := 0;
//  lbNomeProduto.Caption := '';
//  lbNomeVendedor.Caption := '';
  if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
    Edit1.SetFocus;
end;

procedure TfrmDevolucao.ComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (trim(ComboBox2.Text) <> 'REQ') and (trim(ComboBox2.text) <> 'OS') then
  begin
    Application.MessageBox('Tipo de Venda não encontrado.', 'Atenção', MB_ICONINFORMATION + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (ComboBox2.CanFocus) then
      ComboBox2.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (Edit8.CanFocus) then
    Edit8.SetFocus;
end;

procedure TfrmDevolucao.ComboBox3Exit(Sender: TObject);
begin
  inherited;
  obDevolucao.vtipoVenda := ComboBox3.text;
end;

procedure TfrmDevolucao.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn3Click(Sender);
end;

procedure TfrmDevolucao.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if trim(Column.Field.Dataset.FieldbyName('dev').AsString) = 'P' then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0095FFFF);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;
    end;
  end
  else if trim(Column.Field.Dataset.FieldbyName('dev').AsString) = 'T' then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00C1FFC1);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmDevolucao.DBGrid6CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    obDevolucao.vPedVendaProd._marcaDesmarcaLinha;
end;

procedure TfrmDevolucao.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	//If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
	if Column.Field.Dataset.FieldbyName('STATUS').AsString <> 'CANCELADO' then
  begin
  	if (gdFocused in State) then
    begin
      TDBGrid(sender).Canvas.Font.Color := clWhite;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat > 0)
      and (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat >= Column.Field.Dataset.FieldbyName('QUANT_PED_ITEM').AsFloat) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00C1FFC1);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat > 0) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0095FFFF);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end;
  end;

  if ((Column.FieldName = 'VLUN_PED_ITEM')
  	or (Column.FieldName = 'VLUN_PED_ITEM_LIQ')
    or (Column.FieldName = 'VLUN_PED_ITEM_CONV')
    or (Column.FieldName = 'VLUN_PED_ITEM_CONV_LIQ')
    or (Column.FieldName = 'TABPRATICADA')) then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).Canvas.Font.Color := clBlack
    else if (Column.Field.dataSet.FieldByName('tabpraticada').AsString = 'P') then
      TDBGrid(sender).Canvas.Brush.Color := clGreen
    else if (Column.Field.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
      TDBGrid(sender).Canvas.Brush.Color := $00FFFFD2
    else if (Column.Field.dataSet.FieldByName('tabpraticada').AsString = 'T') then
      TDBGrid(sender).Canvas.Brush.Color := clGradientActiveCaption
    else
    	TDBGrid(sender).Canvas.Brush.Color := clWhite;

    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmDevolucao.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    obDevolucao.vPedVendaProd._marcaDesmarcaLinha;
end;

procedure TfrmDevolucao.DBGrid8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if (key = VK_RETURN) then
    BitBtn21Click(Sender)
end;

procedure TfrmDevolucao.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
	QRLabel14.Caption := '';
  if obDevolucao.vImpPesquisa = 1 then
  begin
  	QRLabel14.Caption := vDadosIni.IfThen(trim(obDevolucao.buscas.FieldByName('unidade_conv').AsString) <> '',
    	trim(obDevolucao.buscas.FieldByName('unidade_conv').AsString),
      trim(obDevolucao.buscas.FieldByName('unidade').AsString));

  	if obDevolucao.buscas.FieldByName('valor_tot').AsCurrency > 0 then
    	vValorTotal := vValorTotal + obDevolucao.buscas.FieldByName('valor_tot').AsCurrency
    else
	    vValorTotal := vValorTotal + (obDevolucao.buscas.FieldByName('quant').AsCurrency * obDevolucao.buscas.FieldByName('valor').AsCurrency);
      	
    vQuantTotal := vQuantTotal + vDadosIni.IfThen(obDevolucao.buscas.FieldByName('quant_conv').AsCurrency > 0,
    	obDevolucao.buscas.FieldByName('quant_conv').AsCurrency,
      obDevolucao.buscas.FieldByName('quant').AsCurrency);
  end;

  if obDevolucao.vImpPesquisa = 0 then
  begin
  	QRLabel14.Caption := vDadosIni.IfThen(trim(obDevolucao.dataSet.FieldByName('unidade_conv').AsString) <> '',
    	trim(obDevolucao.dataSet.FieldByName('unidade_conv').AsString),
      trim(obDevolucao.dataSet.FieldByName('unidade').AsString));

  	if obDevolucao.dataSet.FieldByName('valor_tot').AsCurrency > 0 then
    	vValorTotal := vValorTotal + obDevolucao.dataSet.FieldByName('valor_tot').AsCurrency
    else
	    vValorTotal := vValorTotal + (obDevolucao.dataSet.FieldByName('quant').AsCurrency * obDevolucao.dataSet.FieldByName('valor').AsCurrency);
      	
    vQuantTotal := vQuantTotal + vDadosIni.IfThen(obDevolucao.dataSet.FieldByName('quant_conv').AsCurrency > 0,
      obDevolucao.dataSet.FieldByName('quant_conv').AsCurrency,
      obDevolucao.dataSet.FieldByName('quant').AsCurrency);
  end;

  lbValorTotal.Caption := 'R$ ' + FormatFloat('0.00', vValorTotal);
  lbQuantTotal.Caption := FloatToStr(vQuantTotal);
end;

procedure TfrmDevolucao.Edit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    Edit10.Text := vDadosIni.pesquisaRapida('CLientes');

end;

procedure TfrmDevolucao.Edit1Exit(Sender: TObject);
var
  variavel: string;
  vunidadeTmp: string;
begin
	try
    inherited;

    if ((ActiveControl = ComboBox1) or (ActiveControl = EditHw1)) {and obDevolucao.vDevRapida} then
      exit;

    if trim(obDevolucao.vCodBarra) <> trim(Edit1.Text)  then
    begin
      obDevolucao.vGrupoProdPesq := '';
      obDevolucao.vCodProdPesq := '';
      obDevolucao.vUnidadePesq := '';
    end;

    // Limpar variáveis.
    obDevolucao.vCodVenda := '';
    obDevolucao.vPercDesconto := '';
    obDevolucao.vCodBarra := '';
    obDevolucao.vQuant := 0;
    if ActiveControl = CheckBox1 then
      exit;
    //  if not obDevolucao.vDevRapida then
    //  begin
    //    obDevolucao.vtipo := '';
    //    obDevolucao.vcodVendedor := 0;
    //  end;
    obDevolucao.vcodgrade := 0;

    variavel := ActiveControl.Name;

    if Edit1.Text = '' then
    begin
      if (activecontrol <> BitBtn16) and (activecontrol <> BitBtn2) and
        (activecontrol <> BitBtn14) and (activecontrol <> DBGrid1) and
        (activeControl <> BitBtn15) and (activeControl <> TabSheet1) and
        (activeControl <> DBGrid7) and (activeControl <> Edit8) then
      begin
        Edit1.Text := vDadosIni.pesquisaRapida('Produtos');
        if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
          obDevolucao.vGrupoProdPesq := vDadosIni.vPesquisaGrupo_prod;
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
          obDevolucao.vCodProdPesq := vDadosIni.vPesquisaCod_prod;
        obDevolucao.vUnidadePesq := '';
        if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
          Edit1.SetFocus;
        Exit;
      end
      else
        exit;
    end
    else
    begin
      if (activecontrol <> BitBtn16) and (activecontrol <> BitBtn2) and
        (activecontrol <> BitBtn14) and (activecontrol <> DBGrid1) and
        (activeControl <> BitBtn15) and (activeControl <> TabSheet1) and
        (activeControl <> DBGrid7) and (activeControl <> Edit8) then
      begin
      end
      else
        Exit;
      if ((ActiveControl = ComboBox1) or (ActiveControl = EditHw1) {(ActiveControl=Edit6)}) then
        exit;
    end;

    // Alimenta as variáveis.
    obDevolucao.vCodVenda := Edit8.Text;
    obDevolucao.vPercDesconto := Edit7.text;
    obDevolucao.vCodBarra := Edit1.Text;
    obDevolucao.vcodgrade := 0;

    // verifica se o produto existe
    if obDevolucao.pesquisaProduto then
    begin
      lbNomeProduto.Caption := obDevolucao.vProduto.dataSet.FieldByName('grupo_prod').AsString + ' ' +
        obDevolucao.vProduto.dataSet.FieldByName('cod_prod').AsString + ' | ' +
        obDevolucao.vProduto.dataSet.FieldByName('descr_prod').AsString;
      obDevolucao.vGrupoProdPesq := IntToStr(obDevolucao.vProduto.dataSet.FieldByName('grupo_prod').AsInteger);
	    obDevolucao.vCodProdPesq := obDevolucao.vProduto.dataSet.FieldByName('cod_prod').AsString;

      if trim(obDevolucao.vUnidadePesq) = '' then
      begin
        if not obDevolucao.SqlOpen(' select first 1 cs.grupo_prod, cs.cod_prod, cs.cod_empresa, cs.unidade from produtos_conversao_saida cs ' +
          ' where cs.grupo_prod = ' + obDevolucao.vGrupoProdPesq +
          ' and cs.cod_prod = ' + QuotedStr(obDevolucao.vCodProdPesq) +
          ' and cs.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and cs.padrao_venda = ''S'' ', obDevolucao.buscas).IsEmpty then
          	obDevolucao.vUnidadePesq := trim(obDevolucao.buscas.FieldByName('unidade').AsString);
      end;

      if (trim(obDevolucao.vUnidadePesq) <> '') then
        vunidadeTmp := trim(obDevolucao.vUnidadePesq)
      else if (trim(obDevolucao.vGrupoProdPesq) <> '') and (trim(obDevolucao.vCodProdPesq) <> '') then
      	vunidadeTmp := trim(ComboBox5.Items[ComboBox5.ItemIndex])
      else
      	vunidadeTmp := trim(obDevolucao.vProduto.dataset.fieldbyname('UNIDADE').AsString);

      vDadosIni.montarDbComboboxUndConv(
        obDevolucao.buscas,
      	ComboBox5,
        obDevolucao.vProduto.dataset.fieldbyname('GRUPO_PROD').AsInteger,
        obDevolucao.vProduto.dataset.fieldbyname('COD_PROD').AsString,
        obDevolucao.vProduto.dataset.fieldbyname('NUM_FAB_PROD').AsString,
        vunidadeTmp);

      if (trim(edit5.Text) = '') then
      	edit5.Text := FloatToStr(obDevolucao.vQuant)
      else if StrToFloat(trim(edit5.Text)) <= 0 then
      	edit5.Text := FloatToStr(obDevolucao.vQuant);

      Edit1.Text := obDevolucao.vProduto.vCodBarra;
      // verifica venda
      if Edit8.Text <> '' then
      begin
        if not Obdevolucao.selecionaVenda(2, ComboBox2.text) then
        begin
          lbNomeProduto.Caption := '';
          if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
            Edit1.SetFocus;
          Exit;
        end
        else
        begin
          EditHw1.AsValue := obDevolucao.vcodVendedor;
          if obDevolucao.pesquisaVendedor(obDevolucao.vcodVendedor) then
            lbNomeVendedor.Caption := obDevolucao.vVendedor.dataSet.FieldByName('nome_vendedor').AsString
          else
            lbNomeVendedor.Caption := '';
        end;
      end;

      //verifica se existe grade e mostra no grid;
       {if obDevolucao.vExisteVenda = True then
       begin
           if obDevolucao.vcodgrade = 0 then
           begin
             if not ((obDevolucao.vPedVendaProd.dataSet.FieldByName('cod_grade').asinteger = 0)
             or (obDevolucao.vPedVendaProd.dataSet.FieldByName('cod_grade').AsString = '') )then
             begin
               if obDevolucao.pesquisaGrade( obDevolucao.vProduto.dataSet.FieldByName('COD_PROD').AsString, obDevolucao.vProduto.dataSet.FieldByName('grupo_prod').AsString,0) then
               begin
                  TabSheet1.TabVisible := False;
                  TabSheet2.TabVisible := True;
                  PageControl1.ActivePage := TabSheet2;
                  if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
                  	DBGrid2.SetFocus;
               end;
             end;
           end;
       end
       else
       begin
        if obDevolucao.vcodgrade = 0 then
        begin
         if obDevolucao.pesquisaGrade( obDevolucao.vProduto.dataSet.FieldByName('COD_PROD').AsString, obDevolucao.vProduto.dataSet.FieldByName('grupo_prod').AsString,0) then
         begin
            TabSheet1.TabVisible := False;
            TabSheet2.TabVisible := True;
            PageControl1.ActivePage := TabSheet2;
            if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
            	DBGrid2.SetFocus;
         end;
        end;
       end;}

    end
    else
    begin
      Application.MessageBox('Produto/Grade não encontrado(s)! Pressione F3 para consulta.', 'Atenção', MB_ICONINFORMATION + MB_OK);
      lbNomeProduto.Caption := '';
      vDadosIni.carregarUnidades(
        obDevolucao.buscas,
        ComboBox5);
      if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
        Edit1.SetFocus;
    end;

    if obDevolucao.vDevRapida then
      BitBtn1Click(sender);
  finally
    obDevolucao.vCodBarra := trim(Edit1.Text);
    obDevolucao.vGrupoProdPesq := '';
    obDevolucao.vCodProdPesq :=  '';
    obDevolucao.vUnidadePesq := '';
  end;
end;

procedure TfrmDevolucao.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  variavel: TWinControl;
begin
  inherited;
  if key = VK_F3 then
  begin
  	obDevolucao.vGrupoProdPesq := '';
	  obDevolucao.vCodProdPesq := '';
    Edit1.Text := vDadosIni.pesquisaRapida('Produtos');
    if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
      obDevolucao.vGrupoProdPesq := vDadosIni.vPesquisaGrupo_prod;
    if trim(vDadosIni.vPesquisaCod_prod) <> '' then
      obDevolucao.vCodProdPesq := vDadosIni.vPesquisaCod_prod;
    obDevolucao.vCodBarra := trim(Edit1.Text);
  end;

  if key = VK_F4 then
  begin
    if trim(Edit8.Text) <> '' then
    begin
      if obDevolucao.PesquisaItensVenda(Edit8.Text) = True then
      begin
        lbcodigodavenda.Caption := Edit8.Text;
        PageControl1.ActivePage := TabSheet7;
        TabSheet7.Show;
        if (Self.Enabled) and (Self.Visible) and (DBGrid7.CanFocus) then
          DBGrid7.SetFocus;
      end
      else
        Application.MessageBox('Não existem itens para a venda informada ou esta venda não está fechada, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    end
    else
      Application.MessageBox('Não existem itens para a venda informada ou esta venda não está fechada, verifique!', 'Atenção', MB_ICONINFORMATION + MB_OK);
  end;
end;

procedure TfrmDevolucao.Edit3Exit(Sender: TObject);
begin
  inherited;

  if Edit3.Text = '' then
  begin
    if (activecontrol <> BitBtn16) and (activecontrol <> BitBtn2) and
      (activecontrol <> BitBtn14) and (activecontrol <> DBGrid1) and
      (activeControl <> BitBtn15) then
    begin
      Edit3.Text := vDadosIni.pesquisaRapida('Clientes');
      if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
        Edit3.SetFocus;
      Exit;
    end
    else
      exit;
  end
  else
  begin
    try
      StrToCurr(Edit3.text);
    except
      Application.MessageBox(PChar('Código de cliente inválido!'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
        Edit3.SetFocus;
      exit;
    end;
  end;

  obDevolucao.vCodCliente := Edit3.Text;
  if not obDevolucao.pesquisaCLiente(obDevolucao.vCodCliente) then
  begin
    Application.MessageBox('Cliente não encontrado! Pressione F3 para consulta.', 'Atenção', MB_ICONINFORMATION + MB_OK);
    lbNomeCLiente.Caption := '';
    if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
      Edit3.SetFocus;
  end
  else
    lbNomeCLiente.Caption := obDevolucao.vCliente.dataSet.FieldByName('nome_cliente').AsString;
  if vDadosIni.isnumeroint(trim(obDevolucao.vCodVenda)) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      ComboBox1.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
    EditHw1.SetFocus;
end;

procedure TfrmDevolucao.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    Edit3.Text := vDadosIni.pesquisaRapida('Clientes');

end;

procedure TfrmDevolucao.Edit4Exit(Sender: TObject);
begin
  inherited;
  if Edit4.Text <> '' then
  begin
    if not obDevolucao.pesquisaCLiente(Edit4.Text) then
    begin
      Application.MessageBox('Cliente não encontrado! Pressione F3 para consulta.', 'Atenção', MB_ICONINFORMATION + MB_OK);
      lbNomeCLiente2.Caption := '';
      if (Self.Enabled) and (Self.Visible) and (Edit4.CanFocus) then
        Edit4.SetFocus;
    end
    else
      lbNomeCLiente2.Caption := obDevolucao.vCliente.dataSet.FieldByName('nome_cliente').AsString;
  end;
end;

procedure TfrmDevolucao.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    Edit4.Text := vDadosIni.pesquisaRapida('Clientes');

end;

procedure TfrmDevolucao.Edit5Exit(Sender: TObject);
begin
  inherited;
  try
    StrToCurr(Edit5.text);
    Edit5.text := FloatToStr(vDadosIni.StrToFloatFormat(StrToFloat(Edit5.text),3));
  except
    Application.MessageBox(PChar('Quantidade Inválida! '), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    if (Self.Enabled) and (Self.Visible) and (Edit5.CanFocus) then
      Edit5.SetFocus;
    exit;
  end;
end;

procedure TfrmDevolucao.Edit7Exit(Sender: TObject);
begin
  inherited;
  if Edit7.Text <> '' then
  begin
    try
      StrToCurr(Edit7.text);
    except
      Application.MessageBox(PChar('Valor inválido.' + chr(13) + 'Verifique o campo Desconto Percentual.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (Edit7.CanFocus) then
        Edit7.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmDevolucao.Edit8Exit(Sender: TObject);
begin
  inherited;

  if Edit8.Text <> '' then
  begin
    try
      StrToInt(Edit8.text);
    except
      Application.MessageBox(PChar('Valor inválido.' + chr(13) + 'Verifique o campo Código da Venda.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (Edit8.CanFocus) then
        Edit8.SetFocus;
      exit;
    end;
    obDevolucao.vCodVenda := Edit8.text;
    obDevolucao.vtipoVenda := ComboBox2.text;
    if not Obdevolucao.selecionaVenda(1, ComboBox2.text) then
    begin
//      Application.MessageBox(PChar('Venda Não encontrada. Verifique o campo Código da Venda e o tipo de venda.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (Edit8.CanFocus) then
        Edit8.SetFocus;
      exit;
    end
    else
    begin
      Edit3.Text := obDevolucao.vCodCliente;
      edit3.ReadOnly := true;
    end;
  end
  else
    edit3.ReadOnly := false;
  if ActiveControl = ComboBox2 then
    edit8.Enabled := true
  else edit8.Enabled := false;
end;

procedure TfrmDevolucao.Edit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    MaskEdit3.Text := datetostr(vDadosIni.getDataBanco(obDevolucao.buscas));
    MaskEdit4.Text := datetostr(vDadosIni.getDataBanco(obDevolucao.buscas));
    PageControl1.ActivePage := TabSheet6;
    TabSheet6.Show;
    obDevolucao.vPedvenda.Close;
    obDevolucao.vPedVendaProd.Close;
  end;

end;

procedure TfrmDevolucao.EditHw1Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = BitBtn16) or (activecontrol = BitBtn15) or
      (activecontrol = BitBtn22) or (activecontrol = DBGrid1) or
      (activeControl = BitBtn2) or (activeControl = BitBtn14) then
    exit;
  obDevolucao.vcodVendedor := EditHw1.AsInteger;
  if not obDevolucao.pesquisaVendedor(obDevolucao.vcodVendedor) then
  begin
    Application.MessageBox('Vendedor não encontrado!', 'Atenção', MB_ICONINFORMATION + MB_OK);
    lbNomeVendedor.Caption := '';
    EditHw1.AsValue := obDevolucao.vcodVendedor;
    if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
      EditHw1.SetFocus;
  end
  else
    lbNomeVendedor.Caption := obDevolucao.vVendedor.dataSet.FieldByName('nome_vendedor').AsString;
end;

procedure TfrmDevolucao.EditHw1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  codvendTemp: string;
begin
  inherited;
  if key = VK_F3 then
  begin
    codvendTemp := vDadosIni.pesquisaRapida('Colaborador');
    if trim(codvendTemp) <> '' then
      EditHw1.AsValue := strtoint(codvendTemp);
  end;
end;

procedure TfrmDevolucao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  obDevolucao.CancelaOperacoes;
  Action := caFree;
  frmDevolucao := nil;

end;

procedure TfrmDevolucao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	Self.fechar := True; 
  inherited;
end;

procedure TfrmDevolucao.FormCreate(Sender: TObject);
begin
  inherited;
  obDevolucao := TDevolucao.create;
  //Limpar variáveis
  obDevolucao.vCodVenda := '';
  obDevolucao.vPercDesconto := '';
  obDevolucao.vCodCliente := '';
  obDevolucao.vCodBarra := '';
  obDevolucao.vQuant := 0;
  obDevolucao.vtipo := '';
  obDevolucao.vcodVendedor := 0;
  if (vDadosIni.vModalOuChild <> 'M') then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PageControl1.ActivePage = TabSheet6 then
  begin
    if key = VK_F2 then
    	btSelectAllClick(Sender)
    else if key = VK_F4 then
    	btUnSelectAllClick(Sender);
  end
  else if key = VK_F2 then
  begin
    CheckBox1.Checked := not (CheckBox1.Checked);
    obDevolucao.vDevRapida := CheckBox1.Checked;
    Edit5.Text := '';
    ComboBox1.ItemIndex := 0;
    //    EditHw1.AsValue := 0;
    lbNomeProduto.Caption := '';
    //    lbNomeVendedor.Caption := '';
//    if obDevolucao.vDevRapida and (not vDadosIni.isnumeroint(trim(obDevolucao.vCodVenda))) then
//      Application.MessageBox('Para devolução rápida, defina antes de devolver quaisquer item o "Tipo" e o "Vendedor"', 'Informação', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
      EditHw1.SetFocus;
  end;
end;

procedure TfrmDevolucao.FormShow(Sender: TObject);
begin
  inherited;
  if frmDevolucao = nil then
    frmDevolucao := TfrmDevolucao(Self);
  obDevolucao.abredevolucao;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet7.TabVisible := false;
  TabSheet8.TabVisible := false;
  tsAlterarValor.TabVisible := false;
  tsProdDoc.TabVisible := false;
  
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
  if (Self.Enabled) and (Self.Visible) and (ComboBox2.CanFocus) then
    ComboBox2.SetFocus;
  lbNomeProduto.Caption := '';
  lbNomeVendedor.Caption := '';
  if Pos('DEVOLUCAO_FICHAPRODUTO|', vDadosIni.vPesquisa) > 0 then
  begin
    obDevolucao.vSequencia := StrToIntDef(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2), 0);
    obDevolucao.buscas.Close;
    obDevolucao.buscas.SQL.Text := 'select sequencia from devolucao ' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa+
      ' AND SEQUENCIA = ' + IntToStr(obDevolucao.vSequencia) +
      ' and ativo = 1 ';
    obDevolucao.buscas.Open;

    if obDevolucao.buscas.IsEmpty then
    begin
      obDevolucao.buscas.Close;
      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
      Self.fechar := True;
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;
    obDevolucao.buscas.Close;
    obDevolucao.ImprimirDevolucao;
    Self.fechar := True;
    PostMessage(Self.Handle, WM_CLOSE, 0, 0);
  end
  else if Pos('DEVOLUCAO_VENDA|', vDadosIni.vPesquisa) > 0 then 
  begin
    BuscaPrencherPedido(
  		StrToInt(vDadosIni.vPesquisaNPed),
    	vDadosIni.vPesquisaTipo,
    	vDadosIni.vPesquisaData);

	  BitBtn9Click(Sender);

    if vDadosIni.vPesquisaDevTotal = 'S' then
      btSelectAllClick(Sender);
  end;

  vDadosIni.vPesquisa     := '';
  vDadosIni.vPesquisaNPed := '';
  vDadosIni.vPesquisaTipo := '';
  vDadosIni.vPesquisaData := '';

  imgInformation.Hint := 'Informações Adicionais';
  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "DEV017" HABILITAR ALTERAR VALOR DEVOLVIDO DE PRODUTOS VINCULADOS REQ/OS'+ #13 +
    'Processo "DEV018" ALTERAR VALOR DEVOLVIDO DE PRODUTOS VINCULADOS REQ/OS' + #13 +
    'Processo "DEV019" NAO GERAR VALE COMPRA' + #13 +
    'Processo "DEV022" REALIZAR DEVOLUCAO AVULSA - PROGRAMA DE FIDELIDADE';
end;

procedure TfrmDevolucao.LimparDados(pLimpar: Boolean);
begin
	if pLimpar then
  begin
  	Edit8.Enabled := True;
    Edit8.Text := '';
    Edit3.Enabled := True;
    Edit3.Text := '';
    EditHw1.AsValue := 0;
    lbNomeCLiente.Caption := '';
    obDevolucao.vCodCliente := '';
    edit1.text := '';
    lbNomeProduto.Caption := '';
    edit5.Text := '0';
  end
  else if obDevolucao.Delete then
  begin
    Edit8.Enabled := True;
    Edit8.Text := '';
    Edit3.Enabled := True;
    Edit3.Text := '';
    lbNomeCLiente.Caption := obDevolucao.dataSet.FieldByName('NOME_CLIENTE').AsString;
    obDevolucao.vCodCliente := obDevolucao.dataSet.FieldByName('COD_CLIENTE').AsString;
    edit1.text := '';
    lbNomeProduto.Caption := '';
    edit5.Text := '0';
    obDevolucao.pesquisaVendedor(obDevolucao.dataSet.FieldByName('COD_VENDEDOR').AsInteger);
    EditHw1.AsValue := obDevolucao.vVendedor.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
    obDevolucao.vcodVendedor := obDevolucao.vVendedor.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
    lbNomeVendedor.Caption := obDevolucao.vVendedor.dataSet.FieldByName('NOME_VENDEDOR').AsString;
    if (Self.Enabled) and (Self.Visible) and (ComboBox2.CanFocus) then
	    ComboBox2.SetFocus;
//    Edit8.SetFocus;
  end;
  AtualizarValorDev;
end;

procedure TfrmDevolucao.pnProdDocEnter(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (EditHwQtdeDev.CanFocus) then
  	EditHwQtdeDev.SetFocus;
end;

procedure TfrmDevolucao.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  vValorTotal := 0;
  vQuantTotal := 0;
end;

procedure TfrmDevolucao.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Devolução de Produtos');
end;

procedure TfrmDevolucao.TabSheet3Show(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
    DBGrid3.SetFocus;
end;

procedure TfrmDevolucao.tbProdDocCancelClick(Sender: TObject);
begin
  inherited;
	TForm(pnProdDoc.Parent).ModalResult := IDCANCEL;
end;

initialization
  RegisterClass(TfrmDevolucao);
finalization
  UnRegisterClass(TfrmDevolucao);

end.

