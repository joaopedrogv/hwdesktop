unit uCadFlwAtendimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, uEditHw;

type
  TfrmCadFlwAtendimentos = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    Label16: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    DBEdit6: TDBEdit;
    tsConsulta: TTabSheet;
    pnConsulta: TPanel;
    GroupBox5: TGroupBox;
    Panel4: TPanel;
    Panel6: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    btSelectAll: TSpeedButton;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    BitBtn7: TBitBtn;
    EditHw1: TEditHw;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    ComboBox4: TComboBox;
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBGrid2ColExit(Sender: TObject);
    procedure DBGrid2ColEnter(Sender: TObject);
    procedure DBGrid2EditButtonClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure _setCapsLock(pAtivo: Boolean);
  public
    { Public declarations }
  end;

var
  frmCadFlwAtendimentos: TfrmCadFlwAtendimentos;

implementation

uses uDtmFollowUpPosAtendimento, uClassesFollowUpPosAtendimento, uDtmAtivo, DB,
  uDataSet_OOP, uDadosIni;

{$R *.dfm}

procedure TfrmCadFlwAtendimentos.BitBtn10Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadFlwAtendimentos.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM057', 'CONSULTA', '', 'FLW_ATENDIMENTO', '',
    flwAtend.buscas, true) then
    Exit;

  inherited;

  if MaskEdit2.Visible then
  begin
    if not flwAtend.ConsultaCampos('FLW_ATENDIMENTO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1, 'FLW_ATENDIMENTO.*, C.NOME_VENDEDOR',
      ' INNER JOIN COLABORADOR C ON C.COD_VENDEDOR = FLW_ATENDIMENTO.COD_VENDEDOR AND C.COD_EMPRESA = FLW_ATENDIMENTO.COD_EMPRESA', '') then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus
  end
  else
    if flwAtend.ConsultaCampos('FLW_ATENDIMENTO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa, 'FLW_ATENDIMENTO.*, C.NOME_VENDEDOR',
      ' INNER JOIN COLABORADOR C ON C.COD_VENDEDOR = FLW_ATENDIMENTO.COD_VENDEDOR AND C.COD_EMPRESA = FLW_ATENDIMENTO.COD_EMPRESA', '') then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;    
  SpeedButton6.Visible := True;
  SpeedButton8.Visible := vDadosIni.vEmp.vCNPJ = '03530705000109';
  SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM061]';

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadFlwAtendimentos.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not flwAtend.Insert then
      exit;

    DBEdit6.Enabled := False;
    DBLookupComboBox1.Enabled := False;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwAtendimentos.BitBtn4Click(Sender: TObject);
begin
  if not flwAtend.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(flwAtend.vNomeCampoErro);
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
      if flwAtend.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadFlwAtendimentos.BitBtn5Click(Sender: TObject);
begin
  ActiveControl := BitBtn5;
  inherited;
  flwAtend.Cancel;
end;

procedure TfrmCadFlwAtendimentos.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if flwAtend.vAtendHw._pesquisa(ComboBox4.Text, MaskEdit4.Text, MaskEdit5.Text, EditHw1.AsInteger) then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
    	DBGrid2.SetFocus;
end;

procedure TfrmCadFlwAtendimentos.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if flwAtend._importarRegistrosSelecionados then
  begin
    Application.MessageBox('Registros importados com sucesso', 'Atenção', 64);
    BitBtn7.Click;
    Exit;
  end;
end;

procedure TfrmCadFlwAtendimentos.btSelectAllClick(Sender: TObject);
begin
  inherited;
  flwAtend.vAtendHw._marcarTodos;
end;

procedure TfrmCadFlwAtendimentos.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  flwAtend.vAtendHw._desmarcarTodos;
end;

procedure TfrmCadFlwAtendimentos.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = BitBtn5 then
    Exit;
    
  if flwAtend.dataSet.FieldByName('cod_cliente').IsNull then
  begin
    DBEdit3.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;
    Exit;
  end;
  
  DBEdit3.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
  	DBMemo1.SetFocus;

  if not flwAtend._existeCliente(True) then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
end;

procedure TfrmCadFlwAtendimentos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadFlwAtendimentos.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    flwAtend.vAtendHw._marcaDesmarcaLinha;
end;

procedure TfrmCadFlwAtendimentos.DBGrid2ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid2.SelectedField.FieldName = 'OBSERVACAO' then
    DBGrid2.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines,
      dgTabs, dgConfirmDelete, dgCancelOnExit];
end;

procedure TfrmCadFlwAtendimentos.DBGrid2ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid2.SelectedField.FieldName = 'OBSERVACAO' then
    DBGrid2.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines,
      dgTabs, dgConfirmDelete, dgCancelOnExit];
end;

procedure TfrmCadFlwAtendimentos.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TfrmCadFlwAtendimentos.DBGrid2EditButtonClick(Sender: TObject);
var
  I: Integer;
  formMemo: TForm;
begin
  if 'OBSERVACAO' = DBGrid2.SelectedField.FieldName then
  begin
    try
      formMemo := TForm.Create(Application);
      formMemo.Position := poScreenCenter;
      formMemo.Caption := 'Observção';
      pnMemo.Parent := formMemo;
      formMemo.AutoSize := True;
      formMemo.AutoScroll := False;
      formMemo.KeyPreview := True;
      formMemo.BorderIcons:=[biSystemMenu];

      listGrid.Clear;
      listGrid.Items.Text := flwAtend.vAtendHw.dataSet.FieldByName('observacao').AsString;

      formMemo.ShowModal;

    finally
      pnMemo.Parent := tsMEmo;
      formMemo.Free;
      formMemo := nil;
    end;

  end;
end;

procedure TfrmCadFlwAtendimentos.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if not flwAtend.vAtendHw.dataSet.IsEmpty then
      flwAtend.vAtendHw._marcaDesmarcaLinha;
end;

procedure TfrmCadFlwAtendimentos.DBGrid2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    flwAtend.vAtendHw._marcaDesmarcaLinha;
end;

procedure TfrmCadFlwAtendimentos.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  _setCapsLock(True);
end;

procedure TfrmCadFlwAtendimentos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  flwAtend.Free;
  flwAtend := nil;

  Action := caFree;
  frmCadFlwAtendimentos := nil;
end;

procedure TfrmCadFlwAtendimentos.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  flwAtend := TFlw_Atendimentos.create;

  tsCadastro.TabVisible := false;
  tsConsulta.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadFlwAtendimentos.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (flwAtend.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadFlwAtendimentos.FormShow(Sender: TObject);
begin
  if vDadosIni.vEmp.vCNPJ = '03530705000109' then
  begin
    flwAtend.dataSet.FieldByName('CODATENDIMENTOHWAUTO').Tag := 0;
  end
  else
  begin
    flwAtend.dataSet.FieldByName('CODATENDIMENTOHWAUTO').Tag := 1;
  end;
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmFollowUpPosAtendimento.dsAtend;

    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM061]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(flwAtend._lixeiraVazia);
  end;

  imgInformation.Hint := imgInformation.Hint + #13 +
    'Abrir este formulário - [CRM056]';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadFlwAtendimentos.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  DBEdit4.Enabled := False;
  DBEdit6.Enabled := False;
  DBLookupComboBox1.Enabled := False;
  if flwAtend.dataSet.FieldByName('cod_cliente').IsNull then
  begin
    DBEdit3.Enabled := True;
    Exit;
  end;
end;

procedure TfrmCadFlwAtendimentos.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM066', 'HABILITAR', 'COD ATENDIMENTO: ' + flwAtend.dataSet.FieldByName('codatendimento').AsString,
    'FLW_ATENDIMENTO', flwAtend.dataSet.FieldByName('codatendimento').AsString, flwAtend.Buscas, True) then
    Exit;
  flwAtend.vColab._abreTodos;
  DBEdit6.Enabled := True;
  DBLookupComboBox1.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
    DBEdit6.SetFocus;
end;

procedure TfrmCadFlwAtendimentos.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not flwAtend.Edit then
      exit;

    DBEdit6.Enabled := False;
    DBLookupComboBox1.Enabled := False;

    inherited;
    
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwAtendimentos.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if not flwAtend._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM061]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    SpeedButton6.Visible := True;
    SpeedButton8.Visible := vDadosIni.vEmp.vCNPJ = '03530705000109';
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [CRM062]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
    SpeedButton6.Visible := False;
    SpeedButton8.Visible := False;
  end;
end;

procedure TfrmCadFlwAtendimentos.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    flwAtend.Delete;
    lixeiraVazia( flwAtend._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwAtendimentos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if flwAtend._restaurarRegistroDaLixeira then
    lixeiraVazia(flwAtend._lixeiraVazia);
end;

procedure TfrmCadFlwAtendimentos.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if flwPesquisaE = nil then
    flwPesquisaE:= TFlw_Pesquisa.createPesquisa;

  flwPesquisaE._abrirPesquisa(flwAtend.dataSet.FieldByName('codatendimento').AsInteger,
    'ATD');
end;

procedure TfrmCadFlwAtendimentos.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tsConsulta;
  if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
  	ComboBox4.SetFocus;
end;

procedure TfrmCadFlwAtendimentos.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM065', 'HABILITAR', 'COD ATENDIMENTO: ' + flwAtend.dataSet.FieldByName('codatendimento').AsString,
    'FLW_ATENDIMENTO', flwAtend.dataSet.FieldByName('codatendimento').AsString, flwAtend.Buscas, True) then
    Exit;
  DBEdit4.Enabled := True;
end;

procedure TfrmCadFlwAtendimentos._setCapsLock(pAtivo: Boolean);
begin
  if (pAtivo and ((GetKeyState(VK_CAPITAL) and 1) = 0)) or
     ((not pAtivo) and ((GetKeyState(VK_CAPITAL) and 1) = 1)) then
  begin
    keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or 0, 0);
    keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;

end.
