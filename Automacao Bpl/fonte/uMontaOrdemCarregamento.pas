unit uMontaOrdemCarregamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, StdCtrls, uEditHw, Mask, Buttons, Grids, DBGrids,
  ComCtrls, DBCtrls;

type
  TfrmMontaOrdemCarregamento = class(TfrmPadrao)
    PageControl1: TPageControl;
    tsPasso1: TTabSheet;
    tsPasso2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox6: TGroupBox;
    Panel6: TPanel;
    BitBtn3: TBitBtn;
    Panel7: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel8: TPanel;
    DBGrid6: TDBGrid;
    Panel9: TPanel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox4: TGroupBox;
    DBGrid4: TDBGrid;
    tsPasso3: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    GroupBox5: TGroupBox;
    Panel13: TPanel;
    DBGrid5: TDBGrid;
    Panel14: TPanel;
    BitBtn7: TBitBtn;
    GroupBox7: TGroupBox;
    DBGrid7: TDBGrid;
    Panel15: TPanel;
    tsPasso4: TTabSheet;
    Panel12: TPanel;
    Panel16: TPanel;
    GroupBox8: TGroupBox;
    Panel17: TPanel;
    DBGrid8: TDBGrid;
    Panel19: TPanel;
    BitBtn4: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn13: TBitBtn;
    tsPasso5: TTabSheet;
    Panel18: TPanel;
    Panel20: TPanel;
    GroupBox9: TGroupBox;
    Panel22: TPanel;
    BitBtn14: TBitBtn;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Panel21: TPanel;
    BitBtn1: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    SpeedButton1: TSpeedButton;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox10: TDBLookupComboBox;
    Label14: TLabel;
    DBText1: TDBText;
    Label15: TLabel;
    BitBtn27: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn20: TBitBtn;
    procedure GroupBox9Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Panel18Enter(Sender: TObject);
    procedure DBGrid8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGrid7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid7CellClick(Column: TColumn);
    procedure DBGrid7DblClick(Sender: TObject);
    procedure DBGrid4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMontaOrdemCarregamento: TfrmMontaOrdemCarregamento;

implementation

uses uDtmOrdemCarregamento, uClassesOrdemCarregamento, DateUtils, DB, 
  uDtmAtivo;

{$R *.dfm}

procedure TfrmMontaOrdemCarregamento.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if cadOrdemC._concluirMontagemOrdemCarregamentoPeloAssistente(2) then
    ModalResult := IDOK;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if cadOrdemC._concluirMontagemOrdemCarregamentoPeloAssistente(3) then
    ModalResult := IDOK;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn13Click(Sender: TObject);
begin
  inherited;
  if cadOrdemC._concluirMontagemOrdemCarregamentoPeloAssistente(4) then
    ModalResult := IDOK;
end;
                                                
procedure TfrmMontaOrdemCarregamento.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if cadOrdemC._concluirMontagemOrdemCarregamentoPeloAssistente(5) then
    ModalResult := IDOK;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn16Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tsPasso1;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn17Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tsPasso2;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn18Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tsPasso3;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn19Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tsPasso4;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn1Click(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  vTemp := _LerConfiguracoesRegistroString('DBGrid3_Columns_1_FieldName');
  if vTemp <> '' then
  begin
    DBGrid3.Columns[1].FieldName := vTemp;
    DBGrid6.Columns[1].FieldName := vTemp;
    DBGrid4.Columns[2].FieldName := vTemp;
    DBGrid5.Columns[1].FieldName := vTemp;
  end;

  cadOrdemC.vSetor._abreTodos;
  cadOrdemC.vLocalidade._abreTodas;
  cadOrdemC.vCl._abreTodos;

  cadOrdemC.vCl.IndexFieldNames := DBGrid3.Columns[1].FieldName;
  cadOrdemC.vSetor.IndexFieldNames := 'SETOR';
  cadOrdemC.vLocalidade.IndexFieldNames := 'LOCALIDADE';

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    DBGrid1.SetFocus;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn27Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn2Click(Sender: TObject);
begin
  inherited;
  cadOrdemC.vCl._addCliente;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn3Click(Sender: TObject);
begin
  inherited;
  BitBtn4.Enabled := False;
  BitBtn11.Enabled := False;
  if cadOrdemC.vCl._avancarComClientesSelecionados then
    PageControl1.ActivePage := tsPasso2;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if cadOrdemC.vCl.vVendas._avancarComVendasSelecionadas then
    if cadOrdemC._adicionarMercadoriasVendasSelecionadas then
      PageControl1.ActivePage := tsPasso3;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn5Click(Sender: TObject);
begin
  inherited;
  cadOrdemC.vCl.vVendas.vDataIni := MaskEdit1.Text;
  cadOrdemC.vCl.vVendas.vDataFim := MaskEdit2.Text;
  cadOrdemC.vCl.vVendas.vNumIni := EditHw1.AsInteger;
  cadOrdemC.vCl.vVendas.vNumFinal := EditHw2.AsInteger;
  if cadOrdemC.vCl._pesquisaVendas then
  begin
    BitBtn4.Enabled := True;
    BitBtn11.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
      BitBtn4.SetFocus;
  end
  else
    setFocusCampoErro(cadOrdemC.vCl.vVendas.vNomeCampoErro);
end;

procedure TfrmMontaOrdemCarregamento.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if cadOrdemC._adicionarVendaParaCarregamento(0, 1, False) then
    cadOrdemC.vCl.vVendas._adicionaVenda(cadOrdemC.vCodigoVenda);
end;

procedure TfrmMontaOrdemCarregamento.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if cadOrdemC.vItem._avancarComItensSelecionados then
    PageControl1.ActivePage := tsPasso4;
end;

procedure TfrmMontaOrdemCarregamento.BitBtn9Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tsPasso5;
end;

procedure TfrmMontaOrdemCarregamento.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  DBText1.Visible := cadOrdemC.vVeic._existeVeiculo(cadOrdemC.dataSet.FieldByName('cod_veic').AsInteger);
  if DBText1.Visible then
    if cadOrdemC.vVeic.dataSet.FieldByName('peso_maximo').AsFloat > 0 then
      if cadOrdemC.dataSet.FieldByName('peso_max').AsFloat <>
        cadOrdemC.vVeic.dataSet.FieldByName('peso_maximo').AsFloat then
        if cadOrdemC.dataSet.State in [dsEdit, dsInsert] then
          if Application.MessageBox('Alterar peso Máximo da Ordem de Carregamento', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
            cadOrdemC.dataSet.FieldByName('peso_max').AsFloat := cadOrdemC.vVeic.dataSet.FieldByName('peso_maximo').AsFloat;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    DBGrid1DblClick(DBGrid1);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  cadOrdemC.vSetor._marcaDesmarcaLinha;
  cadOrdemC.vLocalidade._marcaDesmarcaLinha(cadOrdemC.vSetor.dataSet.FieldByName('cod_setor').AsInteger,
    cadOrdemC.vSetor.dataSet.FieldByName('sel').AsString = 'S');
end;

procedure TfrmMontaOrdemCarregamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

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

procedure TfrmMontaOrdemCarregamento.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    DBGrid1DblClick(DBGrid1)
  else if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
//  begin
//    cadOrdemC.vSetor._marcaDesmarcaLinha;
//    cadOrdemC.vLocalidade._marcaDesmarcaLinha(cadOrdemC.vSetor.dataSet.FieldByName('cod_setor').AsInteger,
//      cadOrdemC.vSetor.dataSet.FieldByName('sel').AsString = 'S');
//  end;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    DBGrid1DblClick(DBGrid1);
//  begin
//    cadOrdemC.vSetor._marcaDesmarcaLinha;
//    cadOrdemC.vLocalidade._marcaDesmarcaLinha(cadOrdemC.vSetor.dataSet.FieldByName('cod_setor').AsInteger,
//      cadOrdemC.vSetor.dataSet.FieldByName('sel').AsString = 'S');
//  end;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    DBGrid2DblClick(DBGrid2);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  cadOrdemC.vLocalidade._marcaDesmarcaLinha;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); 
var
  Check: Integer;
  R: TRect;
begin
  inherited;
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
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid2.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    DBGrid2DblClick(DBGrid2)
  else if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
//    cadOrdemC.vLocalidade._marcaDesmarcaLinha;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    DBGrid2DblClick(DBGrid2);
//    cadOrdemC.vLocalidade._marcaDesmarcaLinha;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid3CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    DBGrid3DblClick(DBGrid3);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
  cadOrdemC.vCl._marcaDesmarcaLinha;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.Field.AsString = 'S' then
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
      Column.Width := 18;

    DBGrid3.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid3.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    DBGrid3DblClick(DBGrid3)
  else if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
//    cadOrdemC.vCl._marcaDesmarcaLinha;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    DBGrid3DblClick(DBGrid3);
//    cadOrdemC.vCl._marcaDesmarcaLinha;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid4CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    DBGrid4DblClick(DBGrid4);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
  cadOrdemC.vCl.vVendas._marcaDesmarcaLinha;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid4.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid4.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    DBGrid4DblClick(DBGrid4)
  else if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    DBGrid4DblClick(DBGrid4);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid6KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid7CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    DBGrid7DblClick(DBGrid7);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid7DblClick(Sender: TObject);
begin
  inherited;
  cadOrdemC.vItem._marcaDesmarcaLinha;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid7DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid7.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid7.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmMontaOrdemCarregamento.DBGrid7KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    DBGrid7DblClick(DBGrid7)
  else if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid7MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    DBGrid7DblClick(DBGrid7);
end;

procedure TfrmMontaOrdemCarregamento.DBGrid8KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmMontaOrdemCarregamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if ModalResult <> IDOK then
  begin
    cadOrdemC.Cancel;
  end;
  Action := caFree;
  frmMontaOrdemCarregamento := nil;
end;

procedure TfrmMontaOrdemCarregamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	if ModalResult <> IDOK then
    CanClose := Application.MessageBox('Deseja mesmo sair desta tela?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
end;

procedure TfrmMontaOrdemCarregamento.FormCreate(Sender: TObject);
var
	vCargaTemp: TOrdemCarregamento;
  vTempCodVenda, vTempNumVenda: Integer;
begin
  inherited;

  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa,1) = 'CARGA' then
  begin
    vTempCodVenda := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
    vTempNumVenda := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,3));
    vDadosIni.vPesquisa := '';

    vCargaTemp := TOrdemCarregamento.create;
    vCargaTemp._adicionarMercadorias(vTempCodVenda, vTempNumVenda);
    Close;
  end;

end;

procedure TfrmMontaOrdemCarregamento.FormShow(Sender: TObject);
begin
  inherited;
  tsPasso1.TabVisible := False;
  tsPasso2.TabVisible := False;
  tsPasso3.TabVisible := False;
  tsPasso4.TabVisible := False;
  tsPasso5.TabVisible := False;
  PageControl1.ActivePage := tsPasso1;
  cadOrdemC.vSetor.Close;
  cadOrdemC.vLocalidade.Close;
  cadOrdemC.vCl.Close;
  if _LerConfiguracoesRegistroString('DBGrid3_Columns_1_FieldName') = 'RAZAO' then
    SpeedButton1.Caption := 'Mostrar Razao Social';
  MaskEdit1.Text := DateToStr(StartOfTheMonth(Date));
  MaskEdit2.Text := DateToStr(EndOfTheMonth(Date));
  EditHw1.AsValue := 1;
  EditHw2.AsValue := 9999999;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmMontaOrdemCarregamento.GroupBox9Enter(Sender: TObject);
begin
  inherited;
  DBText1.Visible := cadOrdemC.vVeic._existeVeiculo(cadOrdemC.dataSet.FieldByName('cod_veic').AsInteger);
end;

procedure TfrmMontaOrdemCarregamento.Panel18Enter(Sender: TObject);
begin
  inherited;
  vDadosIni.vInibeMensPesqPros := 'S';
  DBEdit6.Enabled := vDadosIni.PesqPros('OCR034', 'HABILITAR', '', 'CARGA', cadOrdemC.dataSet.FieldByName('cod_carga').AsString, cadOrdemC.buscas, True);
//  Label14.Visible := not DBEdit6.Enabled;
end;

procedure TfrmMontaOrdemCarregamento.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if SpeedButton1.Caption = 'Mostrar Nome Fantasia' then
  begin
    SpeedButton1.Caption := 'Mostrar Razao Social';
    cadOrdemC.vCl.IndexFieldNames := 'RAZAO';
    DBGrid3.Columns[1].FieldName := 'RAZAO';
    DBGrid6.Columns[1].FieldName := 'RAZAO';
    DBGrid4.Columns[2].FieldName := 'RAZAO';
    DBGrid5.Columns[1].FieldName := 'RAZAO';
    _GravaConfiguracoesString('DBGrid3_Columns_1_FieldName', 'RAZAO');
  end
  else
  begin
    SpeedButton1.Caption := 'Mostrar Nome Fantasia';
    cadOrdemC.vCl.IndexFieldNames := 'NOME_CLIENTE';
    DBGrid3.Columns[1].FieldName := 'NOME_CLIENTE';
    DBGrid6.Columns[1].FieldName := 'NOME_CLIENTE';
    DBGrid4.Columns[2].FieldName := 'NOME_CLIENTE';
    DBGrid5.Columns[1].FieldName := 'NOME_CLIENTE';
    _GravaConfiguracoesString('DBGrid3_Columns_1_FieldName', 'NOME_CLIENTE')
  end;
end;

initialization
  RegisterClass(TfrmMontaOrdemCarregamento);
finalization
  UnRegisterClass(TfrmMontaOrdemCarregamento);

end.
