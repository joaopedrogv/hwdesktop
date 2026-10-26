unit uCadFlwPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uEditHw, DB, Series, TeEngine, TeeProcs, Chart,
  DbChart, ImgList, DBClient, DBCtrls, Spin;

type
  TfrmCadFlwPesquisa = class(TfrmCadPadraoM)
    tsConsulta: TTabSheet;
    pnConsulta: TPanel;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    Panel6: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    BitBtn7: TBitBtn;
    EditHw1: TEditHw;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    DBGrid3: TDBGrid;
    dsImpPesq: TDataSource;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    EditHw2: TEditHw;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    btSelectAll: TSpeedButton;
    tsGraficos: TTabSheet;
    ImageList1: TImageList;
    Panel7: TPanel;
    dsTendencias: TDataSource;
    cdsMensal: TClientDataSet;
    cdsMensalCodigo: TIntegerField;
    cdsMensalMes: TStringField;
    cdsMensalPorcentagem: TFloatField;
    cdsMensalQuantidade: TIntegerField;
    cdsAnual: TClientDataSet;
    cdsAnualCodigo: TIntegerField;
    cdsAnualAlternativa: TStringField;
    cdsAnualQTDE: TIntegerField;
    dsAnual: TDataSource;
    SaveDialog1: TSaveDialog;
    dsPerfil: TDataSource;
    Panel15: TPanel;
    GroupBox7: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox8: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    SpeedButton17: TSpeedButton;
    dsCliente: TDataSource;
    SpeedButton18: TSpeedButton;
    GroupBox9: TGroupBox;
    DBLookupComboBox3: TDBLookupComboBox;
    dsColab: TDataSource;
    dbGridPerf: TDBGrid;
    dbGridCliente: TDBGrid;
    dbGridColab: TDBGrid;
    Panel16: TPanel;
    PageControl2: TPageControl;
    tsTendencias: TTabSheet;
    Panel10: TPanel;
    Button1: TButton;
    Panel9: TPanel;
    DBChart1: TDBChart;
    Series1: TLineSeries;
    tsReacoesNegativas: TTabSheet;
    Panel11: TPanel;
    Button2: TButton;
    Panel12: TPanel;
    PageControl4: TPageControl;
    TabSheet7: TTabSheet;
    DBChart2: TDBChart;
    LineSeries1: TBarSeries;
    TabSheet8: TTabSheet;
    DBChart3: TDBChart;
    LineSeries2: TPieSeries;
    tsIndices: TTabSheet;
    Panel13: TPanel;
    Button3: TButton;
    Panel14: TPanel;
    DBChart4: TDBChart;
    PieSeries1: TPieSeries;
    CheckBox5: TCheckBox;
    GroupBox6: TGroupBox;
    DateTimePicker2: TDateTimePicker;
    Panel8: TPanel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    BitBtn11: TBitBtn;
    PopupMenu3: TPopupMenu;
    Filtrar1: TMenuItem;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    EditHw3: TEditHw;
    CheckBox8: TCheckBox;
    Label9: TLabel;
    Label10: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    procedure EditHw3Change(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid2ColExit(Sender: TObject);
    procedure DBGrid2ColEnter(Sender: TObject);
    procedure DBGrid2EditButtonClick(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure Filtrar1Click(Sender: TObject);
    procedure dbGridColabExit(Sender: TObject);
    procedure DBLookupComboBox3Enter(Sender: TObject);
    procedure dbGridClienteExit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure dbGridPerfExit(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure dsColabDataChange(Sender: TObject; Field: TField);
    procedure Panel15Resize(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton17Click(Sender: TObject);
    procedure dsClienteDataChange(Sender: TObject; Field: TField);
    procedure dsPerfilDataChange(Sender: TObject; Field: TField);
    procedure tsIndicesShow(Sender: TObject);
    procedure tsReacoesNegativasShow(Sender: TObject);
    procedure tsTendenciasShow(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure TabSheet8Enter(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure dsImpPesqDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure _organizaControles;
    procedure _criaDataSetsGrafico;
  public
    { Public declarations }
  end;

var
  frmCadFlwPesquisa: TfrmCadFlwPesquisa;

implementation

uses uDtmFollowUpPosAtendimento, uClassesFollowUpPosAtendimento, uDtmAtivo
, uDataSet_OOP, uDadosIni;

{$R *.dfm}

procedure TfrmCadFlwPesquisa.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if TelaCadastro=1 then
    BitBtn2.Click
  else PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadFlwPesquisa.BitBtn1Click(Sender: TObject);
var
  vTemp: string;
  I: Integer;
begin
  if not vDadosIni.PesqPros('CRM068', 'CONSULTA', '', 'FLW_PESQUISA', '',
    flwPesquisa.buscas, true) then
    Exit;

  inherited;

  if MaskEdit2.Visible then
    vTemp := '*D*A*T*A*'
  else
    vTemp := MaskEdit3.Text;
  if flwPesquisa._pesquisa(ComboBox1.Text, ComboBox3.Text,vTemp, MaskEdit1.Text, MaskEdit2.Text) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	  DBGrid1.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
    ComboBox1.SetFocus;

  if (not flwPesquisa.dataSet.IsEmpty) then
    for I := 0 to DBGrid1.Columns.Count - 1 do
      if DBGrid1.Columns[i].FieldName = 'DADOS' then
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  SpeedButton6.Visible := True;
  SpeedButton7.Visible := True;
//  SpeedButton8.Visible := True;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM072]';

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadFlwPesquisa.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    // pesquisar OS ou Atendimento
//    if not flwPesquisa.Insert then
//      exit;
//
//    DBEdit6.Enabled := False;
//    DBLookupComboBox1.Enabled := False;

//    inherited;
//
//    PageControl1.ActivePage := TabSheet1;
//    PageControl3.ActivePage := tsCadastro;

//    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
//      DBEdit2.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwPesquisa.BitBtn7Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  flwPesquisa.vImpPesq.vCons.vOS := CheckBox4.Checked;
  flwPesquisa.vImpPesq.vCons.vReq := CheckBox8.Checked;
  flwPesquisa.vImpPesq.vCons.vAtd := CheckBox2.Checked;
  flwPesquisa.vImpPesq.vCons.vHW := CheckBox7.Checked;
  flwPesquisa.vImpPesq.vCons.vDataIni := MaskEdit4.Text;
  flwPesquisa.vImpPesq.vCons.vDataFim := MaskEdit5.Text;
  flwPesquisa.vImpPesq.vCons.vCodColab := EditHw1.AsInteger;
  flwPesquisa.vImpPesq.vCons.vTipoReq := DBLookupComboBox5.KeyValue;
  flwPesquisa.vImpPesq.vCons.vTipoOS := DBLookupComboBox4.KeyValue;

  flwPesquisa.vImpPesq._pesquisa;

  if flwPesquisa.vImpPesq.dataSet.Active then
    for I := 0 to DBGrid2.Columns.Count - 1 do
      if DBGrid2.Columns[i].FieldName = 'OBS' then
        DBGrid2.Columns[i].ButtonStyle := cbsEllipsis;

  _GravaConfiguracoesBoolean(CheckBox2.Name, CheckBox2.Checked);
  _GravaConfiguracoesBoolean(CheckBox4.Name, CheckBox4.Checked);
  _GravaConfiguracoesBoolean(CheckBox7.Name, CheckBox7.Checked);
  _GravaConfiguracoesString(MaskEdit4.Name, MaskEdit4.Text);
  _GravaConfiguracoesString(MaskEdit5.Name, MaskEdit5.Text);
  _GravaConfiguracoesInteger(EditHw1.Name, EditHw1.AsInteger);
  _GravaConfiguracoesString(DBLookupComboBox4.Name, DBLookupComboBox4.KeyValue);
  _GravaConfiguracoesString(DBLookupComboBox5.Name, DBLookupComboBox5.KeyValue);

end;

procedure TfrmCadFlwPesquisa.BitBtn8Click(Sender: TObject);
var
  vRandom: array of Integer;
  I, vInc: Integer;
  vListaCodCliente, vListaCodClienteSel: TStringList;

  function _selecionaRegistro(pIndice: Integer): boolean;
  var
    vIntTmp: Integer;
  begin
    vIntTmp := vListaCodClienteSel.Count;
    flwPesquisa.vImpPesq.dataSet.RecNo := pIndice + 1;
    vListaCodClienteSel.Add(IntToStr(flwPesquisa.vImpPesq.dataSet.FieldByName('COD_CLIENTE').AsInteger));
    Result := vListaCodClienteSel.Count > vIntTmp;
  end;

begin
  inherited;

  try

    dsImpPesq.OnDataChange := nil;

    try
      DBGrid2.Visible := False;
      vListaCodCliente := TStringList.Create;
      vListaCodCliente.Clear;
      vListaCodCliente.Sorted := True;
      vListaCodCliente.Duplicates := dupIgnore;

      vListaCodClienteSel := TStringList.Create;
      vListaCodClienteSel.Clear;
      vListaCodClienteSel.Sorted := True;
      vListaCodClienteSel.Duplicates := dupIgnore;

      flwPesquisa.vImpPesq.dataSet.First;
      while not flwPesquisa.vImpPesq.dataSet.Eof do
      begin
        vListaCodCliente.Add(IntToStr(flwPesquisa.vImpPesq.dataSet.FieldByName('COD_CLIENTE').AsInteger));
        flwPesquisa.vImpPesq.dataSet.Next;
      end;
    finally
      DBGrid2.Visible := True;
    end;

    flwPesquisa.vImpPesq._desmarcarTodos;

    if CheckBox6.Checked then
      if vListaCodCliente.Count < EditHw2.AsInteger then
        CheckBox6.Checked := False;

    if (flwPesquisa.vImpPesq.dataSet.RecordCount <= EditHw2.AsInteger) then
    begin
      flwPesquisa.vImpPesq._marcarTodos;
      Exit;
    end;

    SetLength(vRandom, flwPesquisa.vImpPesq.dataSet.RecordCount);

    for I := 0 to flwPesquisa.vImpPesq.dataSet.RecordCount - 1 do vRandom[I] := 0;

    Randomize;
    for I := 0 to EditHw2.AsInteger - 1 do
    begin
      vInc := Random(flwPesquisa.vImpPesq.dataSet.RecordCount);
      while True do
      begin
        if (_selecionaRegistro(vInc)) and (CheckBox6.Checked) then
        begin
          if (vRandom[vInc] = 0) then
            Break;
        end
        else if ( not CheckBox6.Checked) and (vRandom[vInc] = 0) then
          Break;

        vInc := Random(flwPesquisa.vImpPesq.dataSet.RecordCount);
      end;

//      while (vRandom[vInc] <> 0) and (not _selecionaRegistro(vInc)) do
//        vInc := Random(flwPesquisa.vImpPesq.dataSet.RecordCount);

      vRandom[vInc] := 1;
    end;

    vInc := 0;
    flwPesquisa.vImpPesq.dataSet.First;
    while not flwPesquisa.vImpPesq.dataSet.Eof do
    begin
      if vRandom[vInc] = 1 then
        flwPesquisa.vImpPesq._marcaLinha;

      flwPesquisa.vImpPesq.dataSet.Next;
      Inc(vInc);
    end;

    _GravaConfiguracoesBoolean(CheckBox6.Name, CheckBox6.Checked);
    _GravaConfiguracoesInteger(EditHw2.Name, EditHw2.AsInteger);

  finally
    dsImpPesq.OnDataChange := dsImpPesqDataChange;
  end;
end;

procedure TfrmCadFlwPesquisa.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if flwPesquisa._importarRegistrosSelecionados then
  begin
    Application.MessageBox('Registros importados com sucesso', 'Atenção', 64);
    BitBtn7.Click;
    Exit;
  end;
end;

procedure TfrmCadFlwPesquisa.btSelectAllClick(Sender: TObject);
begin
  inherited;
  flwPesquisa.vImpPesq._marcarTodos;
end;

procedure TfrmCadFlwPesquisa.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  flwPesquisa.vImpPesq._desmarcarTodos;
end;

procedure TfrmCadFlwPesquisa.Button1Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    DBChart1.SaveToBitmapFile(SaveDialog1.FileName);
end;

procedure TfrmCadFlwPesquisa.Button2Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    if PageControl4.ActivePage = TabSheet7 then
      DBChart2.SaveToBitmapFile(SaveDialog1.FileName)
    else
      DBChart3.SaveToBitmapFile(SaveDialog1.FileName);
  end;
end;

procedure TfrmCadFlwPesquisa.Button3Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    DBChart4.SaveToBitmapFile(SaveDialog1.FileName);
end;

procedure TfrmCadFlwPesquisa.CheckBox5Click(Sender: TObject);
begin
  inherited;
  DBChart1.View3D := CheckBox5.Checked;
  DBChart2.View3D := CheckBox5.Checked;
  DBChart3.View3D := CheckBox5.Checked;
end;

procedure TfrmCadFlwPesquisa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadFlwPesquisa.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    flwPesquisa.vImpPesq._marcaDesmarcaLinha;
end;

procedure TfrmCadFlwPesquisa.DBGrid2ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid2.SelectedField.FieldName = 'OBS' then
    DBGrid2.Options := DBGrid2.Options + [dgEditing];
end;

procedure TfrmCadFlwPesquisa.DBGrid2ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid2.SelectedField.FieldName = 'OBS' then
    DBGrid2.Options := DBGrid2.Options - [dgEditing];
end;

procedure TfrmCadFlwPesquisa.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TfrmCadFlwPesquisa.DBGrid2EditButtonClick(Sender: TObject);
var
  formMemo: TForm;
  I: Integer;
begin
  inherited;
  for I := 0 to DBGrid2.Columns.Count - 1 do
    if DBGrid2.Columns[I].FieldName = DBGrid2.SelectedField.FieldName then
      try
        formMemo := TForm.Create(Application);
        formMemo.Position := poScreenCenter;
        formMemo.Caption := DBGrid2.Columns[I].Title.Caption;
        pnMemo.Parent := formMemo;
        formMemo.AutoSize := True;
        formMemo.AutoScroll := False;
        formMemo.KeyPreview := True;
        formMemo.BorderIcons:=[biSystemMenu];

        listGrid.Clear;
        listGrid.Items.Text := DBGrid2.SelectedField.AsString;

        formMemo.ShowModal;

      finally
        pnMemo.Parent := tsMEmo;
        formMemo.Free;
        formMemo := nil;
      end;
end;

procedure TfrmCadFlwPesquisa.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if not flwPesquisa.vImpPesq.dataSet.IsEmpty then
      flwPesquisa.vImpPesq._marcaDesmarcaLinha;
end;

procedure TfrmCadFlwPesquisa.DBGrid2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
if Classes.ssCtrl in Shift then
    flwPesquisa.vImpPesq._marcaDesmarcaLinha;
end;

procedure TfrmCadFlwPesquisa.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmCadFlwPesquisa.dbGridColabExit(Sender: TObject);
begin
  inherited;    
  DBLookupComboBox3.Visible:= True;
  dbGridColab.Visible := False;
  Panel15.Height := Panel15.Tag;
end;

procedure TfrmCadFlwPesquisa.dbGridClienteExit(Sender: TObject);
begin
  inherited;                       
  DBLookupComboBox2.Visible:= True;
  dbGridCliente.Visible := False;
  Panel15.Height := Panel15.Tag;
end;

procedure TfrmCadFlwPesquisa.dbGridPerfExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox1.Visible:= True;
  dbGridPerf.Visible := False;
  Panel15.Height := Panel15.Tag;
end;

procedure TfrmCadFlwPesquisa.DBLookupComboBox1Enter(Sender: TObject);
begin
  inherited;
  dbGridPerf.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (dbGridPerf.CanFocus) then
  	dbGridPerf.SetFocus;
  DBLookupComboBox1.Visible := False;
  Panel15.Tag := Panel15.Height;
  Panel15.Height := 165;
end;

procedure TfrmCadFlwPesquisa.DBLookupComboBox2Enter(Sender: TObject);
begin
  inherited;
  dbGridCliente.Visible := True;
  dbGridCliente.Align := alClient;
  if (Self.Enabled) and (Self.Visible) and (dbGridCliente.CanFocus) then
  	dbGridCliente.SetFocus;
  DBLookupComboBox2.Visible := False;
  Panel15.Tag := Panel15.Height;
  Panel15.Height := 165;
end;

procedure TfrmCadFlwPesquisa.DBLookupComboBox2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    SpeedButton18.Click;
//  begin
//    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
//    if Trim(vDadosIni.vPesquisa) <> '' then
//      flwGraficos.vCliente._selecionaCliente(StrToInt(Trim(vDadosIni.vPesquisa)));
//  end;
end;

procedure TfrmCadFlwPesquisa.DBLookupComboBox3Enter(Sender: TObject);
begin
  inherited;   
  dbGridColab.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (dbGridColab.CanFocus) then
  	dbGridColab.SetFocus;
  DBLookupComboBox3.Visible := False;
  Panel15.Tag := Panel15.Height;
  Panel15.Height := 165;
end;

procedure TfrmCadFlwPesquisa.dsClienteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if PageControl2.ActivePage = tsTendencias then
    tsTendenciasShow(tsTendencias)
  else if PageControl2.ActivePage = tsReacoesNegativas then
    tsReacoesNegativasShow(tsReacoesNegativas)
  else if PageControl2.ActivePage = tsIndices then
    tsIndicesShow(tsIndices);
  DBLookupComboBox2.KeyValue := flwGraficos.vCliente.dataSet.FieldByName('cod_cliente').AsInteger;
end;

procedure TfrmCadFlwPesquisa.dsColabDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if PageControl2.ActivePage = tsTendencias then
    tsTendenciasShow(tsTendencias)
  else if PageControl2.ActivePage = tsReacoesNegativas then
    tsReacoesNegativasShow(tsReacoesNegativas)
  else if PageControl2.ActivePage = tsIndices then
    tsIndicesShow(tsIndices);
  DBLookupComboBox3.KeyValue := flwGraficos.vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
end;

procedure TfrmCadFlwPesquisa.dsImpPesqDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  try
    if (Trim(flwPesquisa.vImpPesq.dataSet.FieldByName('tipo').AsString) = 'OS') or
      (Trim(flwPesquisa.vImpPesq.dataSet.FieldByName('tipo').AsString) = 'REQ') then
      GroupBox5.Visible := True
    else
      GroupBox5.Visible := False;
  except
  end;
end;

procedure TfrmCadFlwPesquisa.dsPerfilDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if PageControl2.ActivePage = tsTendencias then
    tsTendenciasShow(tsTendencias)
  else if PageControl2.ActivePage = tsReacoesNegativas then
    tsReacoesNegativasShow(tsReacoesNegativas)
  else if PageControl2.ActivePage = tsIndices then
    tsIndicesShow(tsIndices);
  DBLookupComboBox1.KeyValue := flwGraficos.vPerfil.dataSet.FieldByName('codperfil').AsInteger;
  if not flwGraficos.vCliente.dataSet.Active then
    flwGraficos.vCliente._selecionaClienteGrafico(0);
end;

procedure TfrmCadFlwPesquisa.EditHw3Change(Sender: TObject);
begin
  inherited;
  SpeedButton13.Click;
end;

procedure TfrmCadFlwPesquisa.Filtrar1Click(Sender: TObject);
begin
  inherited;
  flwPesquisa.vImpPesq.dataSet.Filter := DBGrid1.SelectedField.DisplayName + ' = ' + DBGrid1.SelectedField.Value;
end;

procedure TfrmCadFlwPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  flwPesquisa.Free;
  flwPesquisa := nil;

  Action := caFree;
  frmCadFlwPesquisa := nil;
end;

procedure TfrmCadFlwPesquisa.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  flwPesquisa := TFlw_Pesquisa.create;

  if flwPesquisaE = nil then
    flwPesquisaE:= TFlw_Pesquisa.create;
  flwPesquisaE.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPesquisa);

//  tsCadastro.TabVisible := false;
  tsConsulta.TabVisible := false;
  tsGraficos.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadFlwPesquisa.FormShow(Sender: TObject);
var
  vDia, vMes, vAno: Word;
begin

  DecodeDate(Date, vAno, vMes, vDia);
  EditHw3.OnChange := nil;
  EditHw3.AsValue := vAno;// FormatDateTime('YYYY', Date);

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmFollowUpPosAtendimento.dsPesquisaCons;

    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM072]';
  end;

  lixeiraVazia(flwPesquisa._lixeiraVazia);

  imgInformation.Hint := imgInformation.Hint + #13 +
    'Abrir este formulário - [CRM067]';

  tsTendencias.OnShow := tsTendenciasShow;
  tsReacoesNegativas.OnShow := tsReacoesNegativasShow;
  tsIndices.OnShow := tsIndicesShow;
  EditHw3.OnChange := EditHw3Change;

  vDadosIni.fechaStatusProcessamento;
  if TelaCadastro=1 then
  begin
    flwPesquisa.vColab._abreTodos(True);
    flwPesquisa.vPerfil._abreTodos;
    flwPesquisa.vCliente._selecionaClienteGrafico(strtoint(vDadosIni.vPesquisa));
    DBLookupComboBox1.KeyValue := flwPesquisa.vPerfil.dataSet.FieldByName('CODPERFIL').AsInteger;
    DBLookupComboBox3.KeyValue := flwPesquisa.vColab.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
    dsColab.OnDataChange := dsColabDataChange;
    dsPerfil.OnDataChange := dsPerfilDataChange;
    dsCliente.OnDataChange := dsClienteDataChange;
    PageControl1.ActivePage := tsGraficos;
    PageControl2.ActivePage := tsTendencias;
  end;
end;

procedure TfrmCadFlwPesquisa.GroupBox4Enter(Sender: TObject);
begin
  inherited;

  CheckBox2.Checked := _LerConfiguracoesRegistroBoolean(CheckBox2.Name);
  CheckBox4.Checked := _LerConfiguracoesRegistroBoolean(CheckBox4.Name);
  CheckBox7.Checked := _LerConfiguracoesRegistroBoolean(CheckBox7.Name);
  MaskEdit4.Text := _LerConfiguracoesRegistroString(MaskEdit4.Name);
  MaskEdit5.Text := _LerConfiguracoesRegistroString(MaskEdit5.Name);
  EditHw1.AsValue := _LerConfiguracoesRegistroInteger(EditHw1.Name);
  CheckBox6.Checked := _LerConfiguracoesRegistroBoolean(CheckBox6.Name);
  EditHw2.AsValue := _LerConfiguracoesRegistroInteger(EditHw2.Name);
  try
    DBLookupComboBox4.KeyValue := _LerConfiguracoesRegistroString(DBLookupComboBox4.Name);
  except
    DBLookupComboBox4.KeyValue := '***';
  end;
  try
    DBLookupComboBox5.KeyValue := _LerConfiguracoesRegistroString(DBLookupComboBox5.Name);
  except
    DBLookupComboBox5.KeyValue := '***';
  end;

//  CheckBox7.Visible :=  vDadosIni.vEmp.vCNPJ = '03530705000109';
  if not CheckBox7.Visible then
    CheckBox7.Checked := False;
end;

procedure TfrmCadFlwPesquisa.Panel15Resize(Sender: TObject);
begin
  inherited;
  GroupBox7.Width := Trunc(Panel5.Width / 3) - 2;
  GroupBox9.Width := Trunc(Panel5.Width / 3) - 2;
  dbGridPerf.Columns[0].Width := dbGridPerf.Width - 15;
  dbGridCliente.Columns[0].Width := dbGridCliente.Width - 15;
  dbGridColab.Columns[0].Width := dbGridColab.Width - 15;
end;

procedure TfrmCadFlwPesquisa.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  MaskEdit5.Clear;
end;

procedure TfrmCadFlwPesquisa.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM079', 'EXPORTAR', '', 'FLW_PESQUISA', '', flwPesquisa.buscas, True) then
    exit;
  try
    Screen.Cursor := crHourGlass;
    flwPesquisa._exportarParaExcel;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwPesquisa.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  flwGraficos.vUtilDataSet.First;
  _organizaControles;
end;

procedure TfrmCadFlwPesquisa.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  flwGraficos.vUtilDataSet.Prior;
  _organizaControles;
end;

procedure TfrmCadFlwPesquisa.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  flwGraficos.vUtilDataSet.Next;
  _organizaControles;
end;

procedure TfrmCadFlwPesquisa.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  flwGraficos.vUtilDataSet.Last;
  _organizaControles;
end;

procedure TfrmCadFlwPesquisa.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  flwGraficos.vCliente._selecionaCliente(-1);
end;

procedure TfrmCadFlwPesquisa.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    DBLookupComboBox2.KeyValue := StrToInt(Trim(vDadosIni.vPesquisa));
    flwGraficos.vCliente._selecionaClienteGrafico(StrToInt(Trim(vDadosIni.vPesquisa)));
  end;
end;

procedure TfrmCadFlwPesquisa.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
//    if not flwPesquisa.Edit then
//      exit;

//    DBEdit6.Enabled := False;
//    DBLookupComboBox1.Enabled := False;
    flwPesquisaE._abrirPesquisa(flwPesquisa.dataSet.FieldByName('nped').AsInteger,
      flwPesquisa.dataSet.FieldByName('tipo_ped').AsString);

    BitBtn1.Click;

//    inherited;
    
//    PageControl1.ActivePage := TabSheet1;
//    PageControl3.ActivePage := tsCadastro;

//    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
//      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwPesquisa.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not flwPesquisa._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM072]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    SpeedButton6.Visible := True;
    SpeedButton7.Visible := True;
//    SpeedButton8.Visible := True;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [CRM073]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
    SpeedButton6.Visible := False;
    SpeedButton7.Visible := False;
//    SpeedButton8.Visible := False;
  end;
end;

procedure TfrmCadFlwPesquisa.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    flwPesquisa.Delete;
    lixeiraVazia( flwPesquisa._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwPesquisa.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if flwPesquisa._restaurarRegistroDaLixeira then
    lixeiraVazia(flwPesquisa._lixeiraVazia);
end;

procedure TfrmCadFlwPesquisa.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM077', 'IMPORTAR', '', 'FLW_PESQUISA', '', flwPesquisa.buscas, True) then
    exit;
  flwPesquisa.vImpPesq.vTVReq._abreTodos;
  flwPesquisa.vImpPesq.vTVOs._abreTodos;
  PageControl1.ActivePage := tsConsulta;
  if (Self.Enabled) and (Self.Visible) and (MaskEdit4.CanFocus) then
  	MaskEdit4.SetFocus;
end;

procedure TfrmCadFlwPesquisa.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM078', 'VISUALIZAR', '', 'FLW_PESQUISA', '', flwPesquisa.buscas, True) then
    exit;
  flwPesquisa.vColab._abreTodos(True);
  flwPesquisa.vPerfil._abreTodos;
  flwPesquisa.vCliente._selecionaClienteGrafico(0);
  DBLookupComboBox1.KeyValue := flwPesquisa.vPerfil.dataSet.FieldByName('CODPERFIL').AsInteger;
  DBLookupComboBox3.KeyValue := flwPesquisa.vColab.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
  dsColab.OnDataChange := dsColabDataChange;
  dsPerfil.OnDataChange := dsPerfilDataChange;
  dsCliente.OnDataChange := dsClienteDataChange;

  PageControl1.ActivePage := tsGraficos;
  PageControl2.ActivePage := tsTendencias;
end;

procedure TfrmCadFlwPesquisa.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  MaskEdit4.Clear;
end;

procedure TfrmCadFlwPesquisa.tsTendenciasShow(Sender: TObject);
begin
  inherited;
  _criaDataSetsGrafico;
  while not cdsMensal.IsEmpty do
    cdsMensal.Delete;
  while not cdsAnual.IsEmpty do
    cdsAnual.Delete;
  if flwGraficos = nil then
    flwGraficos := TFlw_Tendencias.create
  else
  begin
    flwGraficos.Free;
    flwGraficos := nil;
    flwGraficos := TFlw_Tendencias.create
  end;

  flwGraficos._selecionaGrupoPerguntas(flwGraficos.vUtilDataSet, StrToDate('01/01/' + Trim(EditHw3.Text)));
  if flwGraficos.vUtilDataSet.IsEmpty then
  begin
    SpeedButton13.Enabled := false;
    SpeedButton14.Enabled := false;
    SpeedButton15.Enabled := false;
    SpeedButton16.Enabled := false;
    SpeedButton13Click(Sender);
  end
  else
    SpeedButton13Click(Sender);
end;

procedure TfrmCadFlwPesquisa.tsReacoesNegativasShow(Sender: TObject);
begin
  inherited;
  _criaDataSetsGrafico;
  while not cdsMensal.IsEmpty do
    cdsMensal.Delete;
  while not cdsAnual.IsEmpty do
    cdsAnual.Delete;
  if flwGraficos = nil then
    flwGraficos := TFlw_ReacoesNegativas.create
  else
  begin
    flwGraficos.Free;
    flwGraficos := nil;
    flwGraficos := TFlw_ReacoesNegativas.create;
  end;
  flwGraficos._selecionaGrupoPerguntas(flwGraficos.vUtilDataSet, StrToDate('01/01/' + Trim(EditHw3.Text)));
  if flwGraficos.vUtilDataSet.IsEmpty then
  begin
    SpeedButton13.Enabled := false;
    SpeedButton14.Enabled := false;
    SpeedButton15.Enabled := false;
    SpeedButton16.Enabled := false;
    SpeedButton13Click(Sender);
  end
  else
    SpeedButton13Click(Sender);
end;

procedure TfrmCadFlwPesquisa.tsIndicesShow(Sender: TObject);
begin
  inherited;
  _criaDataSetsGrafico;
  while not cdsMensal.IsEmpty do
    cdsMensal.Delete;
  while not cdsAnual.IsEmpty do
    cdsAnual.Delete;
  if flwGraficos = nil then
    flwGraficos := TFlw_Indices.create
  else
  begin
    flwGraficos.Free;
    flwGraficos := nil;
    flwGraficos := TFlw_Indices.create;
  end;
  flwGraficos._selecionaGrupoPerguntas(flwGraficos.vUtilDataSet, StrToDate('01/01/' + Trim(EditHw3.Text)));
  if flwGraficos.vUtilDataSet.IsEmpty then
  begin
    SpeedButton13.Enabled := false;
    SpeedButton14.Enabled := false;
    SpeedButton15.Enabled := false;
    SpeedButton16.Enabled := false;
    SpeedButton13Click(Sender);
  end
  else
    SpeedButton13Click(Sender);
end;

procedure TfrmCadFlwPesquisa.TabSheet8Enter(Sender: TObject);
begin
  inherited;
  SpeedButton13Click(Sender);
end;

procedure TfrmCadFlwPesquisa._criaDataSetsGrafico;
begin
  if cdsMensal.Tag <> 22 then
    try
      cdsMensal.CreateDataSet;
      cdsMensal.Tag := 22;
    except
    end;
  if cdsAnual.Tag <> 22 then
    try
      cdsAnual.CreateDataSet;
      cdsAnual.Tag := 22;
    except
    end;
end;

procedure TfrmCadFlwPesquisa._organizaControles;
var
  i: integer;
begin
  _criaDataSetsGrafico;
  while not cdsMensal.IsEmpty do
    cdsMensal.Delete;
  while not cdsAnual.IsEmpty do
    cdsAnual.Delete;
  if flwGraficos is TFlw_Tendencias then
  begin
    DBChart1.Title.Text.Clear;
    DBChart1.Title.Text.Add(flwGraficos.vUtilDataSet.FieldByName('DESCRICAO').AsString);
    DBChart1.Title.Text.Add(flwGraficos.vUtilDataSet.FieldByName('PERGUNTA').AsString);
    flwGraficos._montaTabelaMensal(StrToDate('01/01/' + Trim(EditHw3.Text)), cdsMensal, flwGraficos.vUtilDataSet.FieldByName('codgrupo').AsInteger,
      flwGraficos.vUtilDataSet.FieldByName('CODPERGUNTA').AsInteger);
  end
  else if flwGraficos is TFlw_ReacoesNegativas then
  begin
    if PageControl4.ActivePage = TabSheet7 then
    begin
      DBChart2.Title.Text.Clear;
      DBChart2.Title.Text.Add(flwGraficos.vUtilDataSet.FieldByName('DESCRICAO').AsString);
      DBChart2.Title.Text.Add(flwGraficos.vUtilDataSet.FieldByName('PERGUNTA').AsString);
      flwGraficos._montaTabelaMensal(StrToDate('01/01/' + Trim(EditHw3.Text)), cdsMensal, flwGraficos.vUtilDataSet.FieldByName('codgrupo').AsInteger,
        flwGraficos.vUtilDataSet.FieldByName('CODPERGUNTA').AsInteger);
    end
    else if PageControl4.ActivePage = TabSheet8 then
    begin
      cdsAnual.Open;
      DBChart3.Title.Text.Clear;
      DBChart3.Title.Text.Add(flwGraficos.vUtilDataSet.FieldByName('DESCRICAO').AsString);
      DBChart3.Title.Text.Add(flwGraficos.vUtilDataSet.FieldByName('PERGUNTA').AsString);
      DBChart3.Title.Text.Add(flwGraficos.vUtilDataSet.FieldByName('complemento').AsString);
      if not flwGraficos._montaTabelaAnual(StrToDate('01/01/' + Trim(EditHw3.Text)), cdsAnual, flwGraficos.vUtilDataSet.FieldByName('codgrupo').AsInteger,
        flwGraficos.vUtilDataSet.FieldByName('CODPERGUNTA').AsInteger) then
        cdsAnual.Close;
    end;
  end
  else if flwGraficos is TFlw_Indices then
  begin
    cdsAnual.Open;
    DBChart4.Title.Text.Clear;
    DBChart4.Title.Text.Add(flwGraficos.vUtilDataSet.FieldByName('DESCRICAO').AsString);
    DBChart4.Title.Text.Add(flwGraficos.vUtilDataSet.FieldByName('PERGUNTA').AsString);
    if not flwGraficos._montaTabelaAnual(StrToDate('01/01/' + Trim(EditHw3.Text)), cdsAnual, flwGraficos.vUtilDataSet.FieldByName('codgrupo').AsInteger,
      flwGraficos.vUtilDataSet.FieldByName('CODPERGUNTA').AsInteger) then
      cdsAnual.Close;
  end;
  if flwGraficos.vUtilDataSet.Bof then
  begin
    SpeedButton13.Enabled := false;
    SpeedButton14.Enabled := false;
    SpeedButton15.Enabled := true;
    SpeedButton16.Enabled := true;
  end
  else if flwGraficos.vUtilDataSet.Eof then
  begin
    SpeedButton13.Enabled := true;
    SpeedButton14.Enabled := true;
    SpeedButton15.Enabled := false;
    SpeedButton16.Enabled := false;
  end
  else
  begin
    SpeedButton13.Enabled := true;
    SpeedButton14.Enabled := true;
    SpeedButton15.Enabled := true;
    SpeedButton16.Enabled := true;
  end;
end;

end.
