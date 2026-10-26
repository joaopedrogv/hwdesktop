unit Uconcilia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, uEditMoeda,
  Mask, ComCtrls,uClassesLancamentos, uEditHw, config_sistema_class;

type
  TFrmConcilia = class(TfrmPadrao)
    pagecontrol1: TPageControl;
    tsConcilia: TTabSheet;
    TsSaldoCTrl: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Panel6: TPanel;
    TsSaldoBanco: TTabSheet;
    pnVisualizarSaldoCtrl: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    BitBtn9: TBitBtn;
    DBGrid3: TDBGrid;
    pnAlterarSaldoCtrlBancario: TPanel;
    Label31: TLabel;
    Label34: TLabel;
    MaskEdit4: TMaskEdit;
    pnDataRelaCompensacao: TPanel;
    Label9: TLabel;
    MaskEdit1: TMaskEdit;
    EdtValorBanco: TEditHw;
    Label10: TLabel;
    BitBtn7: TBitBtn;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    BitBtn8: TBitBtn;
    Panel7: TPanel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Panel10: TPanel;
    BitBtn6: TBitBtn;
    BitBtn12: TBitBtn;
    Panel11: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid2: TDBGrid;
    tsOpRel: TTabSheet;
    pnOpRel: TPanel;
    pnOpRel2: TPanel;
    btOPRelOK: TBitBtn;
    btOpRelCanc: TBitBtn;
    Panel12: TPanel;
    lbTipoRel: TLabel;
    lbAgruparUnificadas: TLabel;
    lbCodigoEmpUnificada: TLabel;
    cbTipoRel: TComboBox;
    edCodigoEmpUnificada: TEdit;
    cbAgruparUnificadas: TComboBox;
    lbDataFinanceiro: TLabel;
    mEdDataFinanceiro: TMaskEdit;
    Panel13: TPanel;
    SpeedButton55: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure edCodigoEmpUnificadaKeyPress(Sender: TObject; var Key: Char);
    procedure btOpRelCancClick(Sender: TObject);
    procedure btOPRelOKClick(Sender: TObject);
    procedure pnDataRelaCompensacaoEnter(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConcilia: TFrmConcilia;
  obConcilia: TConciliacaoBanc;
  vdata_inicio: TConfig_sistema_class;

implementation

uses
  uDtmLancamentos, uDtmAtivo, uDadosIni;
{$R *.dfm}

procedure TFrmConcilia.BitBtn10Click(Sender: TObject);
begin
  inherited;
  // Financeiro sendo fechado
  if vDadosIni.financeiroFechando(obConcilia.buscas) then
    TForm(pnAlterarSaldoCtrlBancario.Parent).ModalResult := IDCANCEL
  else
  	TForm(pnAlterarSaldoCtrlBancario.Parent).ModalResult := IDOK;
end;

procedure TFrmConcilia.BitBtn11Click(Sender: TObject);
begin
  inherited;
  TForm(pnAlterarSaldoCtrlBancario.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmConcilia.BitBtn12Click(Sender: TObject);
begin
  TForm(pnDataRelaCompensacao.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmConcilia.BitBtn1Click(Sender: TObject);
begin
  try
  	// Financeiro sendo fechado
    if vDadosIni.financeiroFechando(obConcilia.buscas) then
      Exit;
    obConcilia.storeRecNoAcompens;
    obConcilia.storeRecNoControle;
    obConcilia._ConfirmarSaldoConciliado;
  finally
    obConcilia.restoreRecNoAcompens;
    obConcilia.restoreRecNoControle;
  end;
end;

procedure TFrmConcilia.BitBtn2Click(Sender: TObject);
begin
  try
  	// Financeiro sendo fechado
    if vDadosIni.financeiroFechando(obConcilia.buscas) then
      Exit;
      
    obConcilia.storeRecNoAcompens;
    obConcilia.storeRecNoControle;
  	obConcilia._abreFormAlterarDataCompensacao(DBGrid2);
  finally
    obConcilia.restoreRecNoAcompens;
    obConcilia.restoreRecNoControle;
  end;
end;

procedure TFrmConcilia.BitBtn3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmConcilia.BitBtn4Click(Sender: TObject);
begin
  inherited;
  obConcilia._abreFormSaldoControle;
end;

procedure TFrmConcilia.BitBtn5Click(Sender: TObject);
begin
  inherited;
  obConcilia._abreFormAlterarSaldoCtrlBancario;
end;

procedure TFrmConcilia.BitBtn6Click(Sender: TObject);
begin
  inherited;
  // Financeiro sendo fechado
  if vDadosIni.financeiroFechando(obConcilia.buscas) then
    TForm(pnDataRelaCompensacao.Parent).ModalResult := IDCANCEL
  else
	  TForm(pnDataRelaCompensacao.Parent).ModalResult := IDOK;
end;

procedure TFrmConcilia.BitBtn7Click(Sender: TObject);
var
  vDiaFinanceiroFechado: TDate;
begin
  inherited;
  if not vDadosIni.PesqPros('LANC042', 'IMPRIMIR',	'', 'LANCAMENTOS', '',
    obConcilia.buscas, true) then
    exit;

  obConcilia.buscas.Close;
  obConcilia.buscas.SQL.Text := 'select max(fd.dia_fcd) dia_fcd from fech_Dia fd where fd.CODIGO_EMP = ' + vDadosIni.codEmpresa;
  obConcilia.buscas.Open;

  vDiaFinanceiroFechado := obConcilia.buscas.FieldByName('dia_fcd').AsDateTime + 1;

  lbCodigoEmpUnificada.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  edCodigoEmpUnificada.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  lbAgruparUnificadas.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  cbAgruparUnificadas.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  mEdDataFinanceiro.Text := DateToStr(vDiaFinanceiroFechado);
  cbTipoRel.ItemIndex := 0;
  edCodigoEmpUnificada.Text := '0';
  cbAgruparUnificadas.ItemIndex := 0;

  pnOpRel.Height := 108;
  if vDadosIni.vEmp.vFinanceiroUnificado then
    pnOpRel.Height := 174;

  if not vDadosIni.abreForm('Relatórios', FrmConcilia.pnOpRel, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
    exit;

  if trim(edCodigoEmpUnificada.Text) = '' then
  	edCodigoEmpUnificada.Text := '0';
  if StrToInt(trim(edCodigoEmpUnificada.Text)) <= 0 then
    edCodigoEmpUnificada.Text := '0';
  vDadosIni.ImprimirConcBancaria(obConcilia.buscas,
  	cbTipoRel.ItemIndex = 1, trim(cbAgruparUnificadas.Text), StrToInt(edCodigoEmpUnificada.Text), trim(obConcilia.vDataInicioConcBanc));
end;

procedure TFrmConcilia.BitBtn8Click(Sender: TObject);
begin
  try
  	// Financeiro sendo fechado
    if vDadosIni.financeiroFechando(obConcilia.buscas) then
      Exit;
    obConcilia.storeRecNoAcompens;
    obConcilia.storeRecNoControle;
    if not vDadosIni.PesqPros('LANC025', 'RETIRAR COMPENSACAO',	'', 'LANCAMENTOS', '',
      obConcilia.buscas, true) then
      exit;

    if not obConcilia._alterarDataCompensacao('', DBGrid2, true) then
     exit;
  finally
    obConcilia.restoreRecNoAcompens;
    obConcilia.restoreRecNoControle;
  end;
end;

procedure TFrmConcilia.BitBtn9Click(Sender: TObject);
begin
  inherited;
  TForm(pnVisualizarSaldoCtrl.Parent).ModalResult := IDOK;
end;

procedure TFrmConcilia.btOpRelCancClick(Sender: TObject);
begin
  inherited;
  TForm(pnOpRel.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmConcilia.btOPRelOKClick(Sender: TObject);
begin
  inherited;
  TForm(pnOpRel.Parent).ModalResult := IDOK;
end;

procedure TFrmConcilia.btSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    obConcilia.storeRecNoAcompens;
    obConcilia._marcarTodos(obConcilia.cdsAcompens);
  finally
  	obConcilia.restoreRecNoAcompens;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConcilia.btUnSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    obConcilia.storeRecNoAcompens;
    obConcilia._desmarcarTodos(obConcilia.cdsAcompens);
  finally
  	obConcilia.restoreRecNoAcompens;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConcilia.DBGrid2CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
  	if not obConcilia.cdsAcompens.IsEmpty then
      obConcilia._marcaDesmarcaLinha(obConcilia.cdsAcompens);
end;

procedure TFrmConcilia.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if obConcilia.cdsAcompens.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid2.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(DBGrid2.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmConcilia.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    if not obConcilia.cdsAcompens.IsEmpty then
      obConcilia._marcaDesmarcaLinha(obConcilia.cdsAcompens);
end;

procedure TFrmConcilia.edCodigoEmpUnificadaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure TFrmConcilia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  obConcilia.Free;
  obConcilia := nil;

  Action := caFree;
  FrmConcilia := nil;
end;

procedure TFrmConcilia.FormCreate(Sender: TObject);
begin
  inherited;
//  BorderIcons:=[];
  tsConcilia.TabVisible:=false;
  TsSaldoCTrl.TabVisible:=false;
  TsSaldoBanco.TabVisible:=false;
  tsOpRel.TabVisible:=false;
  obConcilia:=TConciliacaoBanc.create;
  DBGrid1.DataSource:=obConcilia.dsControles;
  DBGrid2.DataSource:=obConcilia.dsAcompens;
  DBGrid3.DataSource:=obConcilia.dsSaldoCtrl;
end;

procedure TFrmConcilia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F2 then
  	btSelectAllClick(btSelectAll)
  else if Key = VK_F4 then
  	btUnSelectAllClick(btUnSelectAll);
end;

procedure TFrmConcilia.FormShow(Sender: TObject);
var
 I: Integer;
begin
  inherited;
  tsConcilia.Show;

  if not vDadosIni.validarAcessoEmpresasUnificadas(obConcilia.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    FrmConcilia.fechar := True;
    PostMessage(FrmConcilia.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  if Assigned(vdata_inicio) then FreeAndNil(vdata_inicio);
  vdata_inicio := vDadosIni.getConfSisObject('conc_banc_sistema_data_inicio', obConcilia.buscas);
  if Assigned(vdata_inicio) then
  begin
	  if trim(vdata_inicio.chave) = '' then
    begin
      vdata_inicio.chave := 'conc_banc_sistema_data_inicio';
      vdata_inicio.cod_empresa := StrToInt(vDadosIni.codEmpresa);
      vdata_inicio.display_ := 'Data início da utilização da conciliação bancária - Formato dd/mm/aaaa' + #13 +
      	'Os lançamentos serão exibidos apartir da data infomada';
      vdata_inicio.type1_ := 'string';
      vdata_inicio.value1_vc := '01/01/2000';
      vdata_inicio.ativo := 1;
      vdata_inicio.SaveConfDB(obConcilia.buscas);
      if obConcilia.buscas.Transaction.InTransaction then
	      obConcilia.buscas.Transaction.Commit;
    end;

    if trim(vdata_inicio.chave) <> '' then
    begin
      try
        StrToDate(trim(vdata_inicio.value1_vc));
      except
        Application.MessageBox(PChar('Data início da conciliação bancária incorreta, favor verificar nas configurações!'), 'Atenção', 0 + 64);
      end;
    end;
  end;

  if (trim(vdata_inicio.value1_vc) = '') then
  	vdata_inicio.value1_vc := '01/01/2000';
  obConcilia.vDataInicioConcBanc := trim(vdata_inicio.value1_vc);
  obConcilia._abreControles;

  if not vDadosIni.vEmp.vFinanceiroUnificado then
    for I := 0 to DBGrid2.FieldCount - 1 do
    begin
      if (DBGrid2.Columns[I].FieldName = 'Cod Unificada') or (DBGrid2.Columns[I].FieldName = 'Unificada') then
        DBGrid2.Columns[I].Visible := false;
    end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmConcilia.pnDataRelaCompensacaoEnter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn6.CanFocus) then
    BitBtn6.SetFocus;
end;

procedure TFrmConcilia.SpeedButton55Click(Sender: TObject);
begin
  vDadosIni.configurarSistema('conc_banc%', obConcilia.BuscasGerais);
end;

end.
