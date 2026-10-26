unit UCartasCobranca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, CheckLst, DBCtrls, Spin, OleServer, WordXP, uEditHw;

type
  TfrmCartasCobranca = class(TfrmCadPadraoM)
    tsCobranca: TTabSheet;
    PageControl4: TPageControl;
    tsGerarCartas: TTabSheet;
    Panel16: TPanel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    SpinEdit1: TSpinEdit;
    BitBtn32: TBitBtn;
    DBLookupComboBoxModCarta: TDBLookupComboBox;
    CheckListBoxCartas: TCheckListBox;
    tsEnviarCarta: TTabSheet;
    pnEnviarCartaViaEmail: TPanel;
    Panel51: TPanel;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    Panel56: TPanel;
    odAnexos: TOpenDialog;
    GroupBox44: TGroupBox;
    DBGrid12: TDBGrid;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    BitBtn8: TBitBtn;
    tsSolucionar: TTabSheet;
    pnSolucinar: TPanel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    MaskEdit4: TMaskEdit;
    Label10: TLabel;
    BitBtn17: TBitBtn;
    SpinEdit2: TSpinEdit;
    Panel5: TPanel;
    DBGrid3: TDBGrid;
    GroupBox24: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    CheckListBoxControles: TCheckListBox;
    GroupBox4: TGroupBox;
    ProgressBar2: TProgressBar;
    lbContator: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    BitBtn33: TBitBtn;
    Label11: TLabel;
    edUnificada: TEditHw;
    lbUnificada: TLabel;
    Label12: TLabel;
    edUnificadaGerar: TEditHw;
    pnAllTopEmailCobranca: TPanel;
    Label108: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabelRemetente: TLabel;
    EditPara: TEdit;
    EditCC: TEdit;
    EditCCO: TEdit;
    EditAssunto: TEdit;
    MemoAnexos: TMemo;
    BitBtn7: TBitBtn;
    checkBoxConfirmaLeitura: TCheckBox;
    ComboBoxPrioridade: TComboBox;
    RichEditMsg: TRichEdit;
    procedure BitBtn33Click(Sender: TObject);
    procedure DBGrid12DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Exit(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckListBoxCartasExit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn32Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
  end;

var
  frmCartasCobranca: TfrmCartasCobranca;

implementation

uses uDtmContasAReceber, DB, uclassescontasareceber, uDtmAtivo, uDadosIni,
  uDataSet_OOP;

{$R *.dfm}

procedure TfrmCartasCobranca.BitBtn10Click(Sender: TObject);
begin
  inherited;
  obCarta._solucionar;
end;

procedure TfrmCartasCobranca.BitBtn17Click(Sender: TObject);
begin
  inherited;
  TForm(pnSolucinar.Parent).ModalResult := IDCANCEL;
  obCarta.Refresh;
  obCarta._listaCreditosCarta;
end;

procedure TfrmCartasCobranca.BitBtn1Click(Sender: TObject);
begin
  if vDadosIni.vEmp.vFinanceiroUnificado then
    if not vDadosIni.empresaEstaUnificada(edUnificada.AsInteger) then
      raise exception.create('Código informado para Unificada inválido, informe um dos seguintes valores: ' + vDadosIni.vEmp.vCodigoUnificadas);
  
  if vDadosIni.PesqPros('CAR070', 'PESQUISAR', '','ITENS_CARTA', '', obCarta.buscas, true) then
  begin
    inherited;
    obCarta.vRConsAd.campoAd := ComboBox11.Text;
    obCarta.vRConsAd.valorAd := MaskEdit7.Text;
    obCarta.vRConsAd.dataIniAd := MaskEdit9.Text;
    obCarta.vRConsAd.dataFimAd := MaskEdit8.Text;
    obCarta.vRConsAd.condicaoAd := ComboBox12.Text;
    obCarta.vRConsAd.porDataAd := MaskEdit9.Visible;
    obCarta.vRConsAd.adicional := CheckBox1.Checked;

    if not obCarta._definirWhereAdicional then
    begin
    	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
      	ComboBox11.SetFocus;
      exit;
    end;
    obCarta.vCondicaoWhereAd := obCarta.vCondicaoWhereAd +
      vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
      	vDadosIni.retornoPorCondicao(Trim(obCarta.vCondicaoWhereAd) <> '', ' AND ', '') + ' ITENS_CARTA.COD_EMP_MULT = ' + IntToStr(edUnificada.AsInteger),
        '');
    try
      Screen.Cursor := crHourGlass;
      if MaskEdit2.Visible then
      begin
        if not obCarta.ConsultaCampos('ITENS_CARTA', ComboBox1.Text,ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa,1,
          ' ITENS_CARTA.*,CLIENTES.EMAIL,CLIENTES.CIDADE ',
          ' INNER JOIN CLIENTES ON ITENS_CARTA.COD_CLIENTE = CLIENTES.COD_CLIENTE ' +
          ' AND ITENS_CARTA.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'COD_EMPRESA') +
          ' = CLIENTES.COD_EMPRESA ',obCarta.vCondicaoWhereAd) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
            ComboBox1.setfocus
        end
        else
        begin
        	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	          DBGrid1.SetFocus;
          panel5.Visible:=true;
        end;
      end
      else
      begin
        if (UpperCase(ComboBox1.text)= 'E-MAIL DO CLIENTE') or (UpperCase(ComboBox1.text)= 'CIDADE') then
        begin
          if not obCarta.ConsultaCampos('ITENS_CARTA','CLIENTES', MaskEdit3.text, ComboBox1.Text, combobox3.Text, ComboBox2.text,true, vDadosIni.codEmpresa,
            ' ITENS_CARTA.*, CLIENTES.EMAIL, CLIENTES.CIDADE ',
            ' INNER JOIN CLIENTES ON ITENS_CARTA.COD_CLIENTE = CLIENTES.COD_CLIENTE ' +
            ' AND ITENS_CARTA.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'COD_EMPRESA') +
            ' = CLIENTES.COD_EMPRESA ', obCarta.vCondicaoWhereAd,true) then
          begin
          	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
	            ComboBox1.SetFocus;
            obCarta._listaCreditosCarta;
          end
          else
          begin
          	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	            DBGrid1.SetFocus;
            panel5.Visible:=true;
          end;
        end
        else if not obCarta.ConsultaCampos('ITENS_CARTA','ITENS_CARTA', MaskEdit3.text, ComboBox1.Text, combobox3.Text, ComboBox2.text,true, vDadosIni.codEmpresa,
            ' ITENS_CARTA.*, CLIENTES.EMAIL, CLIENTES.CIDADE ',
            ' INNER JOIN CLIENTES ON ITENS_CARTA.COD_CLIENTE = CLIENTES.COD_CLIENTE ' +
            ' AND ITENS_CARTA.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'COD_EMPRESA') +
            ' = CLIENTES.COD_EMPRESA ',obCarta.vCondicaoWhereAd,true) then
          begin
          	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
	            ComboBox1.SetFocus;
            obCarta._listaCreditosCarta;
          end
          else
          begin
          	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	            DBGrid1.SetFocus;
            panel5.Visible:=true;
          end;
      end;
      if not vDadosIni.vEmp.vFinanceiroUnificado then
        obCarta.dataSet.FieldByName('cod_emp_mult').Visible := False;
    finally
      if obCarta.IsEmpty then
        obCarta._listaCreditosCarta;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCartasCobranca.BitBtn32Click(Sender: TObject);
begin
  inherited;

  if vDadosIni.vEmp.vFinanceiroUnificado then
    if not vDadosIni.empresaEstaUnificada(edUnificadaGerar.AsInteger) then
      raise exception.create('Código informado para Unificada inválido, informe um dos seguintes valores: ' + vDadosIni.vEmp.vCodigoUnificadas);

  BitBtn32.Enabled:=false;
  BitBtn33.Enabled:=false;
  BitBtn8.Enabled:=true;
  obCarta.datainicial := strtodate(MaskEdit12.Text);
  obCarta.datafinal := StrToDate(MaskEdit13.Text);
  obCarta.vDiasAtraso:= SpinEdit1.Value;
  obCarta.vDiasEntreCartas:= SpinEdit2.Value;
//  if DBLookupComboBoxControles.KeyValue = null then
//   obCarta.vCodControle:= -1
//  else obCarta.vCodControle:= DBLookupComboBoxControles.KeyValue;
  if DBLookupComboBoxModCarta.KeyValue = null then
    obCarta.vCodCarta:=-1
  else obCarta.vCodCarta:= DBLookupComboBoxModCarta.KeyValue;
//  obCarta._litaModelosCarta(CheckListBoxCartas,true);
  obCarta._litaControles(CheckListBoxControles,true);
  if not obCarta._gerarItensCarta(ProgressBar2,lbContator,edUnificadaGerar.AsInteger) then
  begin
    setFocusCampoErro(obCarta.vNomeCampoErro,obCarta.vMensagemErro);
  end;
  BitBtn32.Enabled:=true;
  BitBtn33.Enabled:=true;
  BitBtn8.Enabled:=false;
end;

procedure TfrmCartasCobranca.BitBtn33Click(Sender: TObject);
begin
  inherited;
  TabSheet2.Show;
  obCarta._listaCreditosCarta;
end;

procedure TfrmCartasCobranca.BitBtn41Click(Sender: TObject);
begin
  inherited;
  TForm(pnEnviarCartaViaEmail.Parent).ModalResult := IDOK;
end;

procedure TfrmCartasCobranca.BitBtn42Click(Sender: TObject);
begin
  inherited;
  TForm(pnEnviarCartaViaEmail.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCartasCobranca.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if odAnexos.Execute Then
    MemoAnexos.Lines.Add(odAnexos.FileName);
end;

procedure TfrmCartasCobranca.BitBtn8Click(Sender: TObject);
begin
  inherited;
  obCarta.vPararProcessamento:=true;
  BitBtn8.Enabled:=false;
end;

procedure TfrmCartasCobranca.BitBtn9Click(Sender: TObject);
begin
  inherited;
  obCarta._retirarSolucao;
end;

procedure TfrmCartasCobranca.btSelectAllClick(Sender: TObject);
begin
  inherited;
  obCarta._marcaTodasAsLinhas;
end;

procedure TfrmCartasCobranca.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  obCarta._desmarcaTodasAsLinhas;
end;

procedure TfrmCartasCobranca.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
  begin
    if ComboBox11.Items.Count = 0 then
    begin
      ComboBox11.Items := ComboBox1.Items;
      ComboBox11.ItemIndex := 0;
    end;

    if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
  end;
end;

procedure TfrmCartasCobranca.CheckBox1Exit(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
  begin
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
  	ComboBox1.SetFocus;
end;

procedure TfrmCartasCobranca.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if CheckBox2.Checked then
  begin
    obCarta.vGerarCartasPorCidade := true;
    if obCarta._LocalizarCidade then
      Edit1.Text := obCarta.vNomeCidade
    else begin
      CheckBox2.Checked := false;
      obCarta.vGerarCartasPorCidade := false;
      Edit1.Text := '';
    end;
  end else begin
    obCarta.vGerarCartasPorCidade := false;
    Edit1.Text := '';
  end;
end;

procedure TfrmCartasCobranca.CheckListBoxCartasExit(Sender: TObject);
var
  i : integer;
begin
  inherited;
  for I := 0 to CheckListBoxCartas.Items.Count - 1 do
    if CheckListBoxCartas.Checked[i] then
      if strtoint(trim(copy(CheckListBoxCartas.Items[i], 1, pos('|', CheckListBoxCartas.Items[i]) - 1)))= DBLookupComboBoxModCarta.KeyValue then
        CheckListBoxCartas.Checked[i] := false;
end;

procedure TfrmCartasCobranca.ComboBox11Exit(Sender: TObject);
var
  i:integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
  	if ComboBox11.ItemIndex<0 then
      ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TfrmCartasCobranca.ComboBox12Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmCartasCobranca.DBGrid12DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if not Column.Field.Dataset.FieldbyName('REPROCESSAMENTO').IsNull then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0084DAFF);
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);      
end;

procedure TfrmCartasCobranca.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    obCarta._marcaDesmarcaLinha;
end;

procedure TfrmCartasCobranca.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if not Column.Field.Dataset.FieldbyName('DT_SOLUCAO').IsNull then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($00ACC891);
  end else if not Column.Field.Dataset.FieldbyName('REPROCESSAMENTO').IsNull then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0084DAFF);


  if obCarta.dataSet.FieldByName('sel').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;
    DBGrid1.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCartasCobranca.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if Key = VK_SPACE then
     obCarta._marcaDesmarcaLinha;
end;

procedure TfrmCartasCobranca.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    obCarta._marcaDesmarcaLinha;
end;

procedure TfrmCartasCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
  _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);
  _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
  _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
  _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
  _GravaConfiguracoesBoolean('V'+MaskEdit7.Name, MaskEdit7.Visible);
  _GravaConfiguracoesBoolean('V'+MaskEdit8.Name, MaskEdit8.Visible);
  _GravaConfiguracoesBoolean('V'+MaskEdit9.Name, MaskEdit9.Visible);
  obCarta.Cancel;
  obCarta.RollBackTransacao;
  obCarta.Free;
  obCarta := nil;
  Action := caFree;
  frmCartasCobranca := nil;
end;

procedure TfrmCartasCobranca.FormCreate(Sender: TObject);
var
  i:integer;
begin
	vCriou := 0;
  inherited;
  obCarta := TCartasCobranca.Create;
  TelaCadastro := vDadosIni.vTipoForm;
  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;
  for I := 0 to PageControl3.PageCount - 1 do
    PageControl3.Pages[i].TabVisible := false;
  for I := 0 to PageControl4.PageCount - 1 do
   PageControl4.Pages[i].TabVisible:=false;

  PageControl1.ActivePage := TabSheet2;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCartasCobranca.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;
    
  DBGrid1.DataSource := dtmContasAReceber.dsItensCarta;

  if vCriou = 0 then
	begin
    obCarta.montaSelect('select ITENS_CARTA.*,clientes.email,clientes.cidade '+
      ' from  ITENS_CARTA '+
      ' left join clientes '+
      ' on ITENS_CARTA.cod_cliente=clientes.cod_cliente '+
      ' and ITENS_CARTA.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'COD_EMPRESA')+'=clientes.cod_empresa '+
      ' where ITENS_CARTA.codigo=-1 and ITENS_CARTA.cod_empresa=-1');

    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  inherited;
  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name)) <> '' then
    ComboBox11.Text := Trim(_LerConfiguracoesRegistroString(ComboBox11.Name))
  else
    ComboBox11.Text := 'Todos';
  if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name)) <> '' then
    ComboBox12.Text := Trim(_LerConfiguracoesRegistroString(ComboBox12.Name));
  if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    MaskEdit7.Text := Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name));
  MaskEdit7.Visible := _LerConfiguracoesRegistroBoolean('V'+MaskEdit7.Name);
  if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    MaskEdit8.Text := Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name));
  MaskEdit8.Visible := _LerConfiguracoesRegistroBoolean('V'+MaskEdit8.Name);
  if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    MaskEdit9.Text := Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name));
  MaskEdit9.Visible := _LerConfiguracoesRegistroBoolean('V'+MaskEdit9.Name);

  MaskEdit7.Visible := not MaskEdit9.Visible;
  if vDadosIni.vEmp.vDiasReprocessarCartaCobranca=0 then
    SpinEdit2.Value := 30
  else SpinEdit2.Value := vDadosIni.vEmp.vDiasReprocessarCartaCobranca;
  edUnificada.AsValue := StrToInt(vDadosIni.codEmpresa);
  lbUnificada.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  edUnificada.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  if vCriou = 0 then
    vCriou := 1;
end;

procedure TfrmCartasCobranca.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  obCarta._enviarCartas;
end;

procedure TfrmCartasCobranca.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  obCarta._enviarCartasViaEmail;
end;

procedure TfrmCartasCobranca.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if obCarta._ExibirItensEmDebito then
    Panel5.Visible:= true ;
//  else panel5.Visible:=false;
end;

procedure TfrmCartasCobranca.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  obCarta._excluirCarta;
end;

procedure TfrmCartasCobranca.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if obCarta.datainicial=0 then
    MaskEdit12.Text:= DateToStr(vDadosIni.getDataBanco(obCarta.buscas));
  MaskEdit13.Text:= DateToStr(vDadosIni.getDataBanco(obCarta.buscas));
  if obCarta=nil then
    obCarta:=TCartasCobranca.create;
//  DBLookupComboBoxControles.ListSource:=obCarta.dsControles;
//  DBLookupComboBoxControles.ListField:='NOME_CTRL;CODIGO_CTRL';
//  DBLookupComboBoxControles.KeyField:='CODIGO_CTRL';
  DBLookupComboBoxModCarta.ListSource:=obCarta.dsModeloCartas;
  DBLookupComboBoxModCarta.ListField:='DESCRICAO;COD_CARTA';
  DBLookupComboBoxModCarta.KeyField:='COD_CARTA';
//  obCarta._litaModelosCarta(CheckListBoxCartas,false);
  obCarta._litaControles(CheckListBoxControles,false);
  //abre o dataset vazio
  obCarta.montaSelect('select ITENS_CARTA.*,'+
        ' clientes.email,clientes.cidade from itens_carta '+
        ' left join clientes '+
        ' on ITENS_CARTA.cod_cliente=clientes.cod_cliente and ITENS_CARTA.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'COD_EMPRESA')+'=clientes.cod_empresa '+
        ' where ITENS_CARTA.cod_empresa = '+vDadosIni.codEmpresa +' and ITENS_CARTA.codigo=-1');
  obCarta._listaCreditosCarta;
  lbContator.Caption:='';
  tsCobranca.Show;
  tsGerarCartas.Show;
  obCarta.vGerarCartasPorCidade := false;
  CheckBox2.Checked := false;
  Edit1.Text := '';
  if (Self.Enabled) and (Self.Visible) and (MaskEdit12.CanFocus) then
    MaskEdit12.SetFocus;
end;

procedure TfrmCartasCobranca.SpeedButton7Click(Sender: TObject);
begin
  inherited;
//  obCarta._solucionarCartas;
  obCarta._abreformSolucao(obCarta.dataSet.FieldByName('CODIGO').AsInteger);
end;

procedure TfrmCartasCobranca.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  obCarta._visualuzarCartas;
end;

end.
