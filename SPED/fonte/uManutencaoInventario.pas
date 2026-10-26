unit uManutencaoInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, uEditHw, Grids, DBGrids, Mask, Buttons,
  Menus, DBCtrls;

type
  TfrmManutencaoInventario = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    Label1: TLabel;
    edDataInventario: TMaskEdit;
    Panel4: TPanel;
    edListaNCM: TMemo;
    Panel5: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edDescricaoProduto: TEdit;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Splitter2: TSplitter;
    DBGrid1: TDBGrid;
    ckTp88: TCheckBox;
    ckTp02: TCheckBox;
    ckTp03: TCheckBox;
    ckTp04: TCheckBox;
    ckTp05: TCheckBox;
    Label4: TLabel;
    edCST: TEdit;
    edBaseICMS: TEditHw;
    edValorICMS: TEditHw;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    ExportarparaoExcel1: TMenuItem;
    Panel6: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    BitBtn4: TBitBtn;
    DBText1: TDBText;
    Bevel1: TBevel;
    ckCustoComoBase: TCheckBox;
    Label8: TLabel;
    edAliqICMS: TEditHw;
    Label7: TLabel;
    ckF02: TCheckBox;
    ckF03: TCheckBox;
    ckF04: TCheckBox;
    ckF05: TCheckBox;
    ckF88: TCheckBox;
    Label9: TLabel;
    edFCST: TEdit;
    ckFCondicional: TCheckBox;
    ckFatorConversao: TCheckBox;
    edFatorConversao: TEditHw;
    ckMVAConversao: TCheckBox;
    ckUsarAliquotaInternaProd: TCheckBox;
    ckUsarCSTDoCadastro: TCheckBox;
    procedure ckMVAConversaoClick(Sender: TObject);
    procedure ckFatorConversaoClick(Sender: TObject);
    procedure edFCSTChange(Sender: TObject);
    procedure ckF02Click(Sender: TObject);
    procedure edAliqICMSExit(Sender: TObject);
    procedure ckCustoComoBaseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ExportarparaoExcel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure aplicarFiltro;
  public
    { Public declarations }
  end;

var
  frmManutencaoInventario: TfrmManutencaoInventario;

implementation

uses uDtmAtivo, uClassesSpedFBlocoH, uDtmSPED;

{$R *.dfm}

procedure TfrmManutencaoInventario.aplicarFiltro;
var
  vOp: HwOpInventario;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vOp := [];
    if ckF88.Checked then
      vOp := vOp + [oi88];
    if ckF02.Checked then
      vOp := vOp + [oi02];
    if ckF03.Checked then
      vOp := vOp + [oi03];
    if ckF04.Checked then
      vOp := vOp + [oi04];
    if ckF05.Checked then
      vOp := vOp + [oi05];

    ManutInv.aplicarFiltro(vOp, vDadosIni.IfThen( (Length(Trim(edFCST.Text)) = 3) or (Length(Trim(edFCST.Text)) = 0),
      Trim(edFCST.Text), ''), ckFCondicional.Checked);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventario.BitBtn1Click(Sender: TObject);
var
  vOp: HwOpInventario;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vOp := [];
    if ckTp88.Checked then
      vOp := vOp + [oi88];
    if ckTp02.Checked then
      vOp := vOp + [oi02];
    if ckTp03.Checked then
      vOp := vOp + [oi03];
    if ckTp04.Checked then
      vOp := vOp + [oi04];
    if ckTp05.Checked then
      vOp := vOp + [oi05];

    ManutInv.alterarRegistros(vOp);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventario.BitBtn2Click(Sender: TObject);
var
  vOp: HwOpcaoCalculoICMSInventario;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vOp := [];
    if ckUsarCSTDoCadastro.Checked then
      vOp := vOp + [ocUsarCSTProd];
    if ckCustoComoBase.Checked then
      vOp := vOp + [ocCustoComoBase];
    if ckFatorConversao.Checked then
      vOp := vOp + [ocFatorConversao];
    if ckMVAConversao.Checked then
      vOp := vOp + [ocMVAConversao];
    if ckUsarAliquotaInternaProd.Checked then
      vOp := vOp + [ocUsarAliqInternaProd];
    ManutInv.alterarRegistros(edCST.Text, edBaseICMS.AsValue, edValorICMS.AsValue, edAliqICMS.AsValue, edFatorConversao.AsValue, vOp);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventario.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmManutencaoInventario.BitBtn4Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ManutInv.selecionarRegistros(edDataInventario.Text, edDescricaoProduto.Text,edListaNCM.Lines);
    aplicarFiltro;

    edFCST.Clear;
    ckF02.Checked := False;
    ckF03.Checked := False;
    ckF04.Checked := False;
    ckF05.Checked := False;
    ckF88.Checked := False;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventario.ckCustoComoBaseClick(Sender: TObject);
begin
  inherited;
  edBaseICMS.Enabled := not ckCustoComoBase.Checked;
  edValorICMS.Enabled := not ckCustoComoBase.Checked;
  ckFatorConversao.Enabled := ckCustoComoBase.Checked;
  ckMVAConversao.Enabled := ckCustoComoBase.Checked;
  ckUsarAliquotaInternaProd.Enabled := ckCustoComoBase.Checked;
end;

procedure TfrmManutencaoInventario.ckF02Click(Sender: TObject);
begin
  inherited;
  aplicarFiltro;
end;

procedure TfrmManutencaoInventario.ckFatorConversaoClick(Sender: TObject);
begin
  inherited;
  ckMVAConversao.Checked := not ckFatorConversao.Checked;
  edFatorConversao.Enabled := ckFatorConversao.Checked;
end;

procedure TfrmManutencaoInventario.ckMVAConversaoClick(Sender: TObject);
begin
  inherited;
  ckFatorConversao.Checked := not ckMVAConversao.Checked;
end;

procedure TfrmManutencaoInventario.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then  
    ManutInv.marcarDesmarcar(vDadosIni.IfThen(ManutInv.dataSet.FieldByName('sel').AsString = 'S', osUnSel, osSel));
end;

procedure TfrmManutencaoInventario.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  ManutInv.marcarDesmarcar(vDadosIni.IfThen(ManutInv.dataSet.FieldByName('sel').AsString = 'S', osUnSel, osSel));
end;

procedure TfrmManutencaoInventario.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if ManutInv.dataSet.FieldByName('sel').AsString = 'S' then
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

procedure TfrmManutencaoInventario.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    ManutInv.marcarDesmarcar(vDadosIni.IfThen(ManutInv.dataSet.FieldByName('sel').AsString = 'S', osUnSel, osSel));
end;

procedure TfrmManutencaoInventario.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssShift in Shift then
    ManutInv.marcarDesmarcar(vDadosIni.IfThen(ManutInv.dataSet.FieldByName('sel').AsString = 'S', osUnSel, osSel));
end;

procedure TfrmManutencaoInventario.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TfrmManutencaoInventario.edAliqICMSExit(Sender: TObject);
begin
  inherited;
  if not ckCustoComoBase.Checked then
    if edBaseICMS.AsValue > 0 then
      if edAliqICMS.AsValue > 0 then
        edValorICMS.AsValue := edBaseICMS.AsValue * edAliqICMS.AsValue / 100;
end;

procedure TfrmManutencaoInventario.edFCSTChange(Sender: TObject);
begin
  inherited;
  if (Length(Trim(edFCST.Text)) = 3) or (Length(Trim(edFCST.Text)) = 0) then
    ckF02Click(ckF02);
end;

procedure TfrmManutencaoInventario.ExportarparaoExcel1Click(Sender: TObject);
var
  RecNo: Int64;
begin
  inherited;
  try
    RecNo := ManutInv.dataSet.RecNo;
    Screen.Cursor := crHourGlass;
    ManutInv.dataSet.DisableControls;
    ManutInv.dataSet.Last;
    vDadosIni.montarExcel(DBGrid1, 'Manutenção de Inventário');
  finally
    ManutInv.dataSet.RecNo := RecNo;
    ManutInv.dataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  _GravaConfiguracoesString(edDataInventario.Name, edDataInventario.Text);
  _GravaConfiguracoesString(edDescricaoProduto.Name, edDescricaoProduto.Text);
  _GravaConfiguracoesString(edListaNCM.Name, edListaNCM.Lines.Text);

  _GravaConfiguracoesBoolean(ckTp02.Name, ckTp02.Checked);
  _GravaConfiguracoesBoolean(ckTp03.Name, ckTp03.Checked);
  _GravaConfiguracoesBoolean(ckTp04.Name, ckTp04.Checked);
  _GravaConfiguracoesBoolean(ckTp05.Name, ckTp05.Checked);
  _GravaConfiguracoesBoolean(ckTp88.Name, ckTp88.Checked);

  _GravaConfiguracoesString(edCST.Name, edCST.Text);
  _GravaConfiguracoesDouble(edBaseICMS.Name, edBaseICMS.AsValue);
  _GravaConfiguracoesDouble(edValorICMS.Name, edValorICMS.AsValue);
  _GravaConfiguracoesDouble(edAliqICMS.Name, edAliqICMS.AsValue);
  _GravaConfiguracoesDouble(edFatorConversao.Name, edFatorConversao.AsValue);
  
  _GravaConfiguracoesBoolean(ckUsarCSTDoCadastro.Name      , ckUsarCSTDoCadastro.Checked);
  _GravaConfiguracoesBoolean(ckCustoComoBase.Name          , ckCustoComoBase.Checked);
  _GravaConfiguracoesBoolean(ckFatorConversao.Name         , ckFatorConversao.Checked);
  _GravaConfiguracoesBoolean(ckMVAConversao.Name           , ckMVAConversao.Checked);
  _GravaConfiguracoesBoolean(ckUsarAliquotaInternaProd.Name, ckUsarAliquotaInternaProd.Checked);

  _GravaConfiguracoesBoolean(ckFCondicional.Name, ckFCondicional.Checked);

  Action := caFree;
  frmManutencaoInventario := nil;
end;

procedure TfrmManutencaoInventario.FormCreate(Sender: TObject);
begin
  inherited;
  FormStyle := fsMDIChild;
end;

procedure TfrmManutencaoInventario.FormShow(Sender: TObject);
begin
  inherited;

  ManutInv := TManutencaoInventarioBlocoH.Create;
  ManutInv.EventFiltro := aplicarFiltro;

  edDataInventario.Text   := _LerConfiguracoesRegistroString(edDataInventario.Name);
  edDescricaoProduto.Text := _LerConfiguracoesRegistroString(edDescricaoProduto.Name);
  edListaNCM.Lines.Text   := _LerConfiguracoesRegistroString(edListaNCM.Name);

  ckTp88.Checked := _LerConfiguracoesRegistroBoolean(ckTp88.Name);
  ckTp02.Checked := _LerConfiguracoesRegistroBoolean(ckTp02.Name);
  ckTp03.Checked := _LerConfiguracoesRegistroBoolean(ckTp03.Name);
  ckTp04.Checked := _LerConfiguracoesRegistroBoolean(ckTp04.Name);
  ckTp05.Checked := _LerConfiguracoesRegistroBoolean(ckTp05.Name);

  edCST.Text               := _LerConfiguracoesRegistroString(edCST.Name);
  edBaseICMS.AsValue       := _LerConfiguracoesRegistroDouble(edBaseICMS.Name);
  edValorICMS.AsValue      := _LerConfiguracoesRegistroDouble(edValorICMS.Name);
  edAliqICMS.AsValue       := _LerConfiguracoesRegistroDouble(edAliqICMS.Name);
  edFatorConversao.AsValue := _LerConfiguracoesRegistroDouble(edFatorConversao.Name);

  
  ckUsarCSTDoCadastro.Checked       := _LerConfiguracoesRegistroBoolean(ckUsarCSTDoCadastro.Name);
  ckCustoComoBase.Checked           := _LerConfiguracoesRegistroBoolean(ckCustoComoBase.Name);
  ckFatorConversao.Checked          := _LerConfiguracoesRegistroBoolean(ckFatorConversao.Name);
  ckMVAConversao.Checked            := _LerConfiguracoesRegistroBoolean(ckMVAConversao.Name);
  ckUsarAliquotaInternaProd.Checked := _LerConfiguracoesRegistroBoolean(ckUsarAliquotaInternaProd.Name);

  ckFCondicional.Checked := _LerConfiguracoesRegistroBoolean(ckFCondicional.Name);

  edBaseICMS.Enabled := not ckCustoComoBase.Checked;
  edValorICMS.Enabled := not ckCustoComoBase.Checked;
  ckFatorConversao.Enabled := ckCustoComoBase.Checked;
  ckMVAConversao.Enabled := ckCustoComoBase.Checked;
  ckUsarAliquotaInternaProd.Enabled := ckCustoComoBase.Checked;

  edFCST.Clear;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmManutencaoInventario.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ManutInv.marcarDesmarcar(osSel);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventario.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ManutInv.marcarDesmarcar(osUnSel);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventario.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ManutInv.marcarDesmarcar(osSelAll);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmManutencaoInventario.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ManutInv.marcarDesmarcar(osUnSelAll);
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
