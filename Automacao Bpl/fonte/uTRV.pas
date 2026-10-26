unit uTRV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, uClassesTRV, uEditMoeda, EnterantHw, DBCtrls, AppEvnts;

type
  TfrmTRV = class(TfrmCadPadraoM)
    tsDetalhamento: TTabSheet;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    BitBtn7: TBitBtn;
    Panel5: TPanel;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox6: TGroupBox;
    DBGrid3: TDBGrid;
    GroupBox7: TGroupBox;
    DBGrid4: TDBGrid;
    GroupBox8: TGroupBox;
    DBGrid5: TDBGrid;
    ProgressBar1: TProgressBar;
    GroupBox9: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel6: TPanel;
    EditMoeda13: TEditMoeda;
    BitBtn10: TBitBtn;
    PopupMenu3: TPopupMenu;
    Alterarquantidadeautilizar1: TMenuItem;
    Label14: TLabel;
    Label18: TLabel;
    lbProdutos: TLabel;
    lbServicos: TLabel;
    lbTerceiro: TLabel;
    lbDesconto: TLabel;
    lbAcrescimo: TLabel;
    lbValorOS: TLabel;
    lbValorFinal: TLabel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    lbProd: TLabel;
    lbServ: TLabel;
    lbProdT: TLabel;
    lbServT: TLabel;
    lbDesc: TLabel;
    lbValOS: TLabel;
    Label19: TLabel;
    lbAcres: TLabel;
    GroupBox10: TGroupBox;
    edDescAplicado: TEditMoeda;
    ckDesc: TCheckBox;
    ckAcres: TCheckBox;
    edAcresAplicado: TEditMoeda;
    ckSel: TCheckBox;
    CheckBox2: TCheckBox;
    Voltarvendaparaprocessamento2: TMenuItem;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    BitBtn13: TBitBtn;
    RadioButton6: TRadioButton;
    procedure BitBtn13Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Voltarvendaparaprocessamento2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GroupBox4Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure edDescAplicadoExit(Sender: TObject);
    procedure ckAcresClick(Sender: TObject);
    procedure ckDescClick(Sender: TObject);
    procedure Panel6Exit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Alterarquantidadeautilizar1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    hdAtivo: THandle;
    hdEntrada: THandle;
    HdFormularios: THandle;
  public
    { Public declarations }
  end;

var
  frmTRV: TfrmTRV;
  obVenda: TPedVendaTRV;
  enterTela: TEnterHw;

implementation

uses
  uDtmAtivo, uDtmTRV, funcoes, uDtmEntrada, uDadosIni, USenha;

{$R *.dfm}

procedure TfrmTRV.Alterarquantidadeautilizar1Click(Sender: TObject);
begin
  inherited;
  Panel6.Visible := true;
  EditMoeda13.SetFocus;
end;

procedure TfrmTRV.BitBtn10Click(Sender: TObject);
begin
  inherited;
  DBGrid3.SetFocus;
end;

procedure TfrmTRV.BitBtn11Click(Sender: TObject);
var
  vrTemp: Currency;
begin
  inherited;
  if obVenda.somar(DBGrid3, DBGrid4, DBGrid5, ckSel.Checked) then
  begin
    lbProdutos.Caption := Format('%12.2n', [obVenda.valorProdutos]);
    lbServicos.Caption := Format('%12.2n', [obVenda.valorServicos]);
    lbTerceiro.Caption := Format('%12.2n', [obVenda.valorServTerc]);
    lbDesconto.Caption := Format('%12.2n', [obVenda.valorDesconto]);
    lbAcrescimo.Caption := Format('%12.2n', [obVenda.valorAcrescimo]);
    lbValorOS.Caption := Format('%12.2n', [obVenda.valorProdutos + obVenda.valorServicos +
      obVenda.valorServTerc + obVenda.valorAcrescimo - obVenda.valorDesconto]);
    if (ckDesc.Checked) or (ckAcres.Checked) then
    begin
      if not ckDesc.Checked then
        vrTemp := obVenda.valorProdutos + obVenda.valorServicos + obVenda.valorServTerc -
          obVenda.valorDesconto
      else if not ckDesc.Checked then
        vrTemp := obVenda.valorProdutos + obVenda.valorServicos + obVenda.valorServTerc +
          obVenda.valorDesconto
      else
        vrTemp := obVenda.valorProdutos + obVenda.valorServicos + obVenda.valorServTerc;
      if ckDesc.Checked then
        vrTemp := vrTemp - edDescAplicado.Valor;
      if ckAcres.Checked then
        vrTemp := vrTemp + edAcresAplicado.Valor;
      lbValorFinal.Caption := Format('%12.2n', [vrTemp]);
    end
    else
      lbValorFinal.Caption := lbValorOS.Caption;
  end;
end;

procedure TfrmTRV.BitBtn12Click(Sender: TObject);
begin
  inherited;
  DBGrid1.SetFocus;
end;

procedure TfrmTRV.BitBtn13Click(Sender: TObject);
begin
	if not obVenda.removerProcessamentoVenda then
  	exit;
end;

procedure TfrmTRV.BitBtn1Click(Sender: TObject);
var
  vTemp: Integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vTemp := 1;
    if RadioButton2.Checked then
      vTemp := 2
    else if RadioButton3.Checked then
      vTemp := 3
    else if RadioButton4.Checked then
    	vTemp := 3
    else if RadioButton5.Checked then
    	vTemp := 3
    else if RadioButton6.Checked then
    	vTemp := 3;

    if not obVenda.ConsultaAvancada('PEDVENDA', MaskEdit3.Text, ComboBox1.Text,
      ComboBox3.text, ComboBox2.text, TRUE, vDadosIni.codEmpresa, maskedit1.text, maskedit2.text,
      MaskEdit2.Visible, vTemp, CheckBox2.Checked) then
      combobox1.setfocus;
    DBGrid1.SetFocus;
    BitBtn7.Enabled := not CheckBox2.Checked;
    BitBtn7.Tag := 1;
    Voltarvendaparaprocessamento2.Enabled := CheckBox2.Checked;
  finally
    Screen.Cursor := crDefault;
  end;
  // Habilitar botões
  BitBtn3.Enabled := true;
  //  BitBtn7.Enabled := true;
end;

procedure TfrmTRV.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TfrmTRV.BitBtn3Click(Sender: TObject);
begin
  Panel4.Visible := true;
  BitBtn12.SetFocus;
  obVenda.somaTotais(False);
  lbProd.Caption := Format('%12.2n', [obVenda.valorProdutos]);
  lbServ.Caption := Format('%12.2n', [obVenda.valorServicos]);
  lbServT.Caption := Format('%12.2n', [obVenda.valorServTerc]);
  lbProdT.Caption := Format('%12.2n', [obVenda.valorProdTerc]);
  lbDesc.Caption := Format('%12.2n', [obVenda.valorDesconto]);
  lbAcres.Caption := Format('%12.2n', [obVenda.valorAcrescimo]);
  lbValOS.Caption := Format('%12.2n', [obVenda.valorProdutos + obVenda.valorServicos +
    obVenda.valorServTerc + obVenda.valorAcrescimo - obVenda.valorDesconto]);
end;

procedure TfrmTRV.BitBtn7Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if obVenda.vOrigem.IsEmpty then
      exit;
    DBGrid2 := TDBGrid(DBGrid1);
    if obVenda.detalharVenda then
    begin
      lbProdutos.Caption := Format('%12.2n', [obVenda.valorProdutos]);
      lbServicos.Caption := Format('%12.2n', [obVenda.valorServicos]);
      lbTerceiro.Caption := Format('%12.2n', [obVenda.valorServTerc]);
      lbDesconto.Caption := Format('%12.2n', [obVenda.valorDesconto]);
      lbAcrescimo.Caption := Format('%12.2n', [obVenda.valorAcrescimo]);
      lbValorOS.Caption := Format('%12.2n', [obVenda.valorProdutos + obVenda.valorServicos +
        obVenda.valorServTerc + obVenda.valorAcrescimo - obVenda.valorDesconto]);
      lbValorFinal.Caption := lbValorOS.Caption;
      //      edDescAplicadoExit(edDescAplicado);
      ckDesc.Checked := false;
      ckAcres.Checked := false;
      edAcresAplicado.Valor := 0;
      edDescAplicado.Valor := 0;
      edAcresAplicado.Enabled := false;
      edDescAplicado.Enabled := false;
      PageControl1.ActivePage := tsDetalhamento;
      BitBtn9.SetFocus;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmTRV.BitBtn8Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
  // Habilitar botões
  BitBtn3.Enabled := true;
  BitBtn7.Enabled := true;
end;

procedure TfrmTRV.BitBtn9Click(Sender: TObject);
var
  vTemp: Integer;
begin
  inherited;
  if obVenda.processarVenda(DBGrid3, DBGrid4, DBGrid5, ckDesc.Checked, ckAcres.Checked,
    ckSel.Checked, edDescAplicado.Valor, edAcresAplicado.Valor,
    RadioButton4.Checked, RadioButton5.Checked, RadioButton6.Checked) then
  begin
    BitBtn8Click(Sender);
  end
  else
   exit;

  try
    Screen.Cursor := crHourGlass;
    vTemp := 1;
    if RadioButton2.Checked then
      vTemp := 2
    else if RadioButton3.Checked then
      vTemp := 3
    else if RadioButton4.Checked then
      vTemp := 3
    else if RadioButton5.Checked then
      vTemp := 3
    else if RadioButton6.Checked then
    	vTemp := 3;
    if not obVenda.ConsultaAvancada('PEDVENDA', MaskEdit3.Text, ComboBox1.Text,
      ComboBox3.text, ComboBox2.text, TRUE, vDadosIni.codEmpresa, maskedit1.text, maskedit2.text,
      MaskEdit2.Visible, vTemp, CheckBox2.Checked) then
      combobox1.setfocus;
    DBGrid1.SetFocus;
    BitBtn7.Enabled := not CheckBox2.Checked;
    Voltarvendaparaprocessamento2.Enabled := CheckBox2.Checked;
  finally
    Screen.Cursor := crDefault;
  end;
  // Habilitar botões
  BitBtn3.Enabled := true;
  BitBtn7.Enabled := true;
end;

procedure TfrmTRV.CheckBox2Click(Sender: TObject);
begin
  inherited;
  BitBtn13.Enabled := CheckBox2.Checked;
  //  if BitBtn7.Tag = 1 then
  //    BitBtn7.Enabled := not CheckBox2.Checked;
end;

procedure TfrmTRV.ckDescClick(Sender: TObject);
begin
  inherited;
  edDescAplicado.Enabled := ckDesc.Checked;
end;

procedure TfrmTRV.ckAcresClick(Sender: TObject);
begin
  inherited;
  edAcresAplicado.Enabled := ckAcres.Checked;
end;

procedure TfrmTRV.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  //  inherited;

end;

procedure TfrmTRV.DBGrid1EditButtonClick(Sender: TObject);
begin
  //  inherited;

end;

procedure TfrmTRV.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (not (gdSelected in State))
  	and (obVenda.vOrigem.vPedVendaProd.FieldByName('disponivel').AsFloat <= 0) then // se a célula não está selecionada
  begin

    DBGrid3.Canvas.Brush.Color := clRed; // define uma cor de fundo
    DBGrid3.Canvas.FillRect(Rect); // pinta a célula
    DBGrid3.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end;
end;

procedure TfrmTRV.edDescAplicadoExit(Sender: TObject);
begin
  inherited;
  BitBtn11Click(Sender);
end;

procedure TfrmTRV.FormCreate(Sender: TObject);
begin
  // CarregaPacote('pkAtivos', hdAtivo);
  // CarregaPacote('pkEntrada', hdEntrada);
  // CarregaPacote('pkFormularios', HdFormularios);
 {  dtmAtivo := TdtmAtivo.Create(dtmAtivo);
   dtmEnt := TdtmEnt.Create(dtmEnt);
   vDadosIni := TSingleton.GetInstance;
   vDadosIni.vSistema := 'TRV'; }
  vDadosIni := TSingleton.GetInstance;
  Application.Title := 'TRV';
  obVenda := Tpedvendatrv.create;
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  //  obVenda := Tpedvendatrv.create;
  //  obVenda.abreVeiculos('');

  if ((dtmTRV.bancoOrigem.Connected) and (dtmTRV.bancoDestino.Connected)) then
  begin
    FrmEntrada := TFrmEntrada.create(FrmEntrada);
    if (trim(obVenda.vCodEmpresaOrigem) <> '') and (trim(obVenda.vCodEmpresaDestino) <> '') then
    begin
    	FrmEntrada.DBLookupComboBox1.Enabled := false;
	    FrmEntrada.DBLookupComboBox1.KeyValue := StrToInt(obVenda.vCodEmpresaOrigem);
    end;
    FrmEntrada.ShowModal;
  end;
end;

procedure TfrmTRV.FormShow(Sender: TObject);
begin
  if dtmTRV = nil then
    dtmTRV := TdtmTRV.create(dtmTRV);
  DBGrid1.DataSource := dtmTRV.dsPedVenda;
  CheckBox3.Enabled := false;
  CheckBox1.Enabled := false;
  tsDetalhamento.TabVisible := false;
  if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True) then
  begin
    Abort;
    exit;
    Abort;
  end;
  {  if not dtmEnt.verificaEntrada then
    begin
      Exit;
      Abort;
    end;}
  enterTela := TEnterHw.Create(Self);
  enterTela.ClassList.Clear;
  enterTela.classList.Add('TMaskEdit');
  enterTela.classList.Add('TEdit');
  enterTela.classList.Add('TDBEdit');
  enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
  enterTela.classList.Add('TCheckBox');
  enterTela.classList.Add('TDBCheckBox');
  enterTela.classList.Add('TComboBox');
  enterTela.classList.Add('TDBComboBox');
  enterTela.classList.Add('TListBox');
  enterTela.classList.Add('TDBListBox');
  enterTela.classList.Add('TDBLookupListBox');
  enterTela.classList.Add('TDBLookupComboBox');
  enterTela.classList.Add('TSpinEdit');
  enterTela.classList.Add('TDateTimePicker');
  enterTela.classList.Add('TRadioGroup');
  enterTela.classList.Add('TDBRadioGroup');
  enterTela.classList.Add('TRadioButton');
  enterTela.classList.Add('TDBRadioButton');
  inherited;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  obVenda := TPedVendaTRV.create;

  PanelFlash.Tag := 1;
  PanelFlash.Visible := false;
  NoExibirPropaganda1.Visible := false;
  PanelLeft.Width := PanelFundo.Width - 5;
end;

procedure TfrmTRV.GroupBox4Exit(Sender: TObject);
begin
  inherited;
  Panel4.Visible := false;
end;

procedure TfrmTRV.Panel6Exit(Sender: TObject);
begin
  inherited;
  Panel6.Visible := false;
end;

procedure TfrmTRV.TabSheet2Enter(Sender: TObject);
begin
  inherited;
  GroupBox3.Height := 97;
end;

procedure TfrmTRV.Voltarvendaparaprocessamento2Click(Sender: TObject);
begin
  inherited;
  if obVenda.voltarVendaParaProcessar then
    BitBtn1Click(sender);
end;

initialization
  RegisterClass(TfrmTRV);
finalization
  UnRegisterClass(TfrmTRV);

end.

