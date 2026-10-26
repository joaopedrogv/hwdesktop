unit uCadMensMobile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DB, DBCtrls, QRCtrls, QuickRpt;

type
  TfrmCadMensMob = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    DataSource1: TDataSource;
    TabSheet4: TTabSheet;
    qrpMensMobile: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    lbEmpresa: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    pnMensagemNaoLidas: TPanel;
    BitBtn7: TBitBtn;
    CheckBox2: TCheckBox;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    GroupBoxAvancado: TGroupBox;
    groupAdicional: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    pnCodigo: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    pnMensagem: TPanel;
    pnMobileUsuario: TPanel;
    Panel6: TPanel;
    Label7: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    PageControl2: TPageControl;
    TabSheetMobile: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheetSenhas: TTabSheet;
    DBGrid3: TDBGrid;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Panel5: TPanel;
    Label10: TLabel;
    Panel7: TPanel;
    DBMemo1: TDBMemo;
    GroupBox5: TGroupBox;
    ckMobile: TCheckBox;
    ckEcommerce: TCheckBox;
    ckFinanceiro: TCheckBox;
    ckPagOnline: TCheckBox;
    ckAplicativo: TCheckBox;
    GroupBox6: TGroupBox;
    ckStatusNO: TCheckBox;
    ckStatusEP: TCheckBox;
    ckStatusAC: TCheckBox;
    ckStatusER: TCheckBox;
    ckStatusPP: TCheckBox;
    TabSheet5: TTabSheet;
    pnDadosAPI: TPanel;
    Panel10: TPanel;
    btnDadosAPI: TBitBtn;
    PageControl4: TPageControl;
    TabSheet_Cad_Mensageria: TTabSheet;
    TabSheet_Ler_Mensageria: TTabSheet;
    TabSheet_Update_Mensageria: TTabSheet;
    DBGridMensageriaPost: TDBGrid;
    DBMemoMensageriaPost: TDBMemo;
    DBGridMensageriaGet: TDBGrid;
    DBMemoMensageriaGet: TDBMemo;
    DBGridMensageriaUpdate: TDBGrid;
    DBMemoMensageriaUpdate: TDBMemo;
    SplitterMensageriaPost: TSplitter;
    SplitterMensageriaGet: TSplitter;
    SplitterMensageriaUpdate: TSplitter;
    GroupBox7: TGroupBox;
    ckOrigemErp: TCheckBox;
    ckOrigemBot: TCheckBox;
    ckDestinoErp: TCheckBox;
    ckDestinoBot: TCheckBox;
    Label8: TLabel;
    Label12: TLabel;
    procedure SplitterMensageriaUpdateMoved(Sender: TObject);
    procedure SplitterMensageriaGetMoved(Sender: TObject);
    procedure SplitterMensageriaPostMoved(Sender: TObject);
    procedure PageControl4Change(Sender: TObject);
    procedure btnDadosAPIClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure ComboBox12Enter(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure qrpMensMobilePreview(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid3ColEnter(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn7Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2ColEnter(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GroupBox4Enter(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMensMob: TfrmCadMensMob;
  vCampoAdcional: string;
  vCondAdcional: string;
	vSqlAdcional: string;
  cod_mobile, cod_usuario_env: Integer;

implementation

uses
  UClassesMobile, uDtmAtivo, UDtmMobile, uDadosIni;

function _markdownToHtml(Markdown: WideString): WideString; stdcall; external 'MD5XE3.dll';  

{$R *.dfm}

procedure TfrmCadMensMob.BitBtn1Click(Sender: TObject);
var
	vOrigMens: string;
  vStatusEnv: string;
  vOrigem: string;
  vDestino: string;
  vTemp: string;
  I: Integer;
begin
	try
    if not vDadosIni.PesqPros('MOB012', 'CONSULTA', '', 'MENSAGEM_MOB', '',
      CadMensMobile.buscas, true) then
      Exit;
    inherited;

    SpeedButton5.Visible := False;
    SpeedButton1.Visible := True;

    vOrigMens  := '';
    vStatusEnv := '';
    vOrigem    := '';
    vDestino   := '';
    if CheckBox3.Checked then
    begin
    	if ckAplicativo.Checked then
        vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('A');
      if ckMobile.Checked then
        vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('M');
      if ckEcommerce.Checked then
        vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('E');
      if ckFinanceiro.Checked then
        vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('F');
      if ckPagOnline.Checked then
        vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('P');

      if ckStatusNO.Checked then
         vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('NO');
       if ckStatusEP.Checked then
         vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('EP');
       if ckStatusAC.Checked then
         vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('AC');
       if ckStatusER.Checked then
         vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('ER');
       if ckStatusPP.Checked then
         vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('PP');

       if ckOrigemErp.Checked then
         vOrigem := vDadosIni.IfThen(trim(vOrigem) = '', '', trim(vOrigem) + ',') + QuotedStr('erp');
       if ckOrigemBot.Checked then
         vOrigem := vDadosIni.IfThen(trim(vOrigem) = '', '', trim(vOrigem) + ',') + QuotedStr('bot');

       if ckDestinoErp.Checked then
         vDestino := vDadosIni.IfThen(trim(vDestino) = '', '', trim(vDestino) + ',') + QuotedStr('erp');
       if ckDestinoBot.Checked then
         vDestino := vDadosIni.IfThen(trim(vDestino) = '', '', trim(vDestino) + ',') + QuotedStr('bot');
    end;

    if MaskEdit2.Visible then
      vTemp := '*D*A*T*A*'
    else
      vTemp := MaskEdit3.Text;

    Screen.Cursor := crHourGlass;
    if CadMensMobile._pesquisa(ComboBox1.Text, ComboBox3.Text, vTemp, MaskEdit1.Text, MaskEdit2.Text, CheckBox2.checked, vOrigMens, vStatusEnv, vOrigem, vDestino,
      CheckBox1.Checked, ComboBox11.Text, ComboBox12.Text, MaskEdit7.Text, MaskEdit9.Text, MaskEdit8.Text, MaskEdit9.Visible) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        DBGrid1.SetFocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      ComboBox1.SetFocus;

    if CadMensMobile.dataSet.Active then
       for I := 0 to DBGrid1.Columns.Count - 1 do
         if (DBGrid1.Columns[i].FieldName = 'HTML') or (DBGrid1.Columns[i].FieldName = 'OBS_ENV') then
           DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
  finally
    gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMensMob.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not CadMensMobile.Insert then
      exit;

    inherited;

    pnMobileUsuario.Visible := True;
    
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    TabSheetMobile.TabVisible := True;
    TabSheetSenhas.TabVisible := True;

    BitBtn4.Enabled := true;

    DBMemo1.Enabled := true;
    
    if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
      DBMemo1.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadMensMob.BitBtn4Click(Sender: TObject);
begin
  _GravaConfiguracoesInteger('PageControl2', PageControl2.TabIndex);
  if not CadMensMobile.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadMensMobile.vNomeCampoErro, CadMensMobile.vMensagemErro);
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
      if CadMensMobile.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
        	DBMemo1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadMensMob.BitBtn5Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;

  CadMensMobile.Cancel;
  CadMensMobile.RollBackTransacao;
end;

procedure TfrmCadMensMob.BitBtn7Click(Sender: TObject);
var
 vMob: Boolean;
begin
  vMob := CadMensMobile.dataSet.FieldByName('IDMOBILE').AsInteger > 0;

  if not CadMensMobile.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadMensMobile.vNomeCampoErro);
  end;

  CadMensMobile.Cancel;

  if not CadMensMobile.Insert then
    exit;

  if CadMensMobile.dataSet.State = dsInsert then
  begin
    if vMob then
    begin
     PageControl2.TabIndex := 0;
     TabSheetSenhas.TabVisible := False;
    end
    else
    begin
     PageControl2.TabIndex := 1;
     TabSheetMobile.TabVisible := False;
    end;
    GroupBox4.Caption := 'Enviando Mensagem';
    Label11.Left := 102;
    Label11.Caption := 'Usuário/Envio:';
    DBEdit7.DataField := 'US_ENVIO';
    DBEdit2.DataField := 'DATA_ENVIO';
    DBEdit4.DataField := 'HORA_ENVIO';
    DBLookupComboBox2.DataField := 'US_ENVIO';
    DBMemo1.Enabled := true;
    DBGrid2.Enabled := true;
    BitBtn7.Visible := false;

    if vMob then
      CadMensMobile.vMobile._marcarMobile(cod_mobile)
    else
      CadMensMobile.vSenhas._marcarUsuario(cod_usuario_env);

    if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
      DBMemo1.SetFocus;
  end
end;

procedure TfrmCadMensMob.btnDadosAPIClick(Sender: TObject);
begin
  TForm(pnDadosAPI.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadMensMob.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if PageControl2.ActivePage = TabSheetMobile then
    begin
    	if not DBGrid2.Enabled then
		    Exit;

      CadMensMobile.vMobile._marcarTodos;
    end
    else
    begin
    	if not DBGrid3.Enabled then
		    Exit;

      CadMensMobile.vSenhas._marcarTodos;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMensMob.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if PageControl2.ActivePage = TabSheetMobile then
    begin
    	if not DBGrid2.Enabled then
    		Exit;

      CadMensMobile.vMobile._desmarcarTodos;
    end
    else
    begin
    	if not DBGrid3.Enabled then
		    Exit;
        
      CadMensMobile.vSenhas._desmarcarTodos;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadMensMob.CheckBox1Click(Sender: TObject);
begin
  inherited;
   if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 195
  else
    GroupBox3.Height := 90;

  groupAdicional.Visible := CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;

  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    ComboBox11.SetFocus;
end;

procedure TfrmCadMensMob.CheckBox3Click(Sender: TObject);
begin
  inherited;
	if CheckBox3.Checked then
  	GroupBox3.Height := 195
  else
  	GroupBox3.Height := 90;

  GroupBoxAvancado.Visible := CheckBox3.Checked;

	if (Self.Enabled) and (Self.Visible) and (GroupBoxAvancado.CanFocus) then
    GroupBoxAvancado.SetFocus;
end;

procedure TfrmCadMensMob.ComboBox11Exit(Sender: TObject);
var
  I: Integer;
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
        vCampoAdcional := DBGrid1.DataSource.dataSet.Fields.Fields[i].FieldName;

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
    if (Self.Enabled) and (Self.Visible) and (MaskEdit9.CanFocus) then
      MaskEdit9.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
      MaskEdit7.SetFocus;
end;

procedure TfrmCadMensMob.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	CadMensMobile._marcaDesmarcaLinha;
end;

procedure TfrmCadMensMob.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
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

  if (trim(CadMensMobile.dataSet.FieldByName('ORIG_MENS').AsString) = 'A') then
  	//
  else if (CadMensMobile.dataSet.FieldByName('IDSEQM').AsInteger > 0) then
  begin
    if ((CadMensMobile.dataSet.FieldByName('DATA_RECEPCAO').IsNull)
    	and (CadMensMobile.dataSet.FieldByName('HORA_RECEPCAO').IsNull)) then
    begin
     if (gdFocused in State) then
     begin
       TDBGrid(sender).canvas.brush.color := clWindow;
       TDBGrid(sender).canvas.Font.color := clWindowText;
     end
     else
     begin
       TDBGrid(sender).canvas.brush.color := pnMensagemNaoLidas.Color;
       TDBGrid(sender).canvas.Font.color := clWindowText;
     end;
    end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;

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
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadMensMob.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    CadMensMobile._marcaDesmarcaLinha;
end;

procedure TfrmCadMensMob.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    CadMensMobile.vMobile._marcaDesmarcaLinha;
end;

procedure TfrmCadMensMob.DBGrid2ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid2.SelectedField.FieldName = 'SEL' then
    DBGrid2.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
      dgConfirmDelete, dgCancelOnExit];
end;

procedure TfrmCadMensMob.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
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

procedure TfrmCadMensMob.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if not CadMensMobile.vMobile.dataSet.IsEmpty then
      CadMensMobile.vMobile._marcaDesmarcaLinha;
end;

procedure TfrmCadMensMob.DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    CadMensMobile.vMobile._marcaDesmarcaLinha;
end;

procedure TfrmCadMensMob.DBGrid3CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    CadMensMobile.vSenhas._marcaDesmarcaLinha;
end;

procedure TfrmCadMensMob.DBGrid3ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid3.SelectedField.FieldName = 'SEL' then
    DBGrid3.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
      dgConfirmDelete, dgCancelOnExit];
end;

procedure TfrmCadMensMob.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
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

procedure TfrmCadMensMob.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if not CadMensMobile.vSenhas.dataSet.IsEmpty then
      CadMensMobile.vSenhas._marcaDesmarcaLinha;
end;

procedure TfrmCadMensMob.DBGrid3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Classes.ssCtrl in Shift then
    CadMensMobile.vSenhas._marcaDesmarcaLinha;
end;

procedure TfrmCadMensMob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;

  if (CadMensMobile <> nil) then
    CadMensMobile.Cancel;

  BitBtn4.Enabled := true;

  CadMensMobile.Free;
  CadMensMobile := nil;

  Action := caFree;
  frmCadMensMob := nil;
end;

procedure TfrmCadMensMob.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'VERMENSAGEM' then
  begin
  	if dtmMobile = nil then
      dtmMobile := TdtmMobile.Create(dtmMobile);
    vDadosIni.vTipoForm := 2;
    vDadosIni.vModalOuChild := 'M';
  end;

  CadMensMobile := TMensMobile.create;
  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadMensMob.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (CadMensMobile.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;

  if key =  VK_F9 then
  begin
   if CheckBox2.Checked then
   CheckBox2.Checked := not CheckBox2.Checked
   else
   CheckBox2.Checked := not CheckBox2.Checked;
  end;

end;

procedure TfrmCadMensMob.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'VERMENSAGEM' then
  begin
    if dtmMobile = nil then
      dtmMobile := TdtmMobile.Create(dtmMobile);
    vDadosIni.vTipoForm := 2;
    vDadosIni.vModalOuChild := 'M';
  end;

  TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmMobile.dsMensMobile;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [MOB015]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadMensMobile._lixeiraCheia);
  end;

  SpeedButton5.Visible := False;

  try
    PageControl2.TabIndex := _LerConfiguracoesRegistroInteger('PageControl2');
  finally
    PageControl2.TabIndex := 0;
  end;

  leConfiguracoesFormRegistro;

  SpeedButton8.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'STATUS ENVIO' + #13+
    'NO: Quando a mensagem é cadastrada para envio' + #13 +
    'EP: A mensageria já iniciou o processamento da mensagem (Em processamento)' + #13 +
    'AC: A mensagem está sendo enviada (Mensagem Aceito para envio)' + #13 +
    'ER: A mensagem teve algum retono de erro e não pode ser enviada' + #13 +
    'PP: A mensagem foi processada (Enviada normalmente)';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadMensMob.gravaConfiguracoesFormRegistro;
begin
	if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
    _GravaConfiguracoesBoolean(ckAplicativo.Name, ckAplicativo.Checked);
    _GravaConfiguracoesBoolean(ckMobile.Name, ckMobile.Checked);
    _GravaConfiguracoesBoolean(ckEcommerce.Name, ckEcommerce.Checked);
    _GravaConfiguracoesBoolean(ckFinanceiro.Name, ckFinanceiro.Checked);
    _GravaConfiguracoesBoolean(ckPagOnline.Name, ckPagOnline.Checked);

    _GravaConfiguracoesBoolean(ckStatusNO.Name, ckStatusNO.Checked);
    _GravaConfiguracoesBoolean(ckStatusEP.Name, ckStatusEP.Checked);
    _GravaConfiguracoesBoolean(ckStatusAC.Name, ckStatusAC.Checked);
    _GravaConfiguracoesBoolean(ckStatusER.Name, ckStatusER.Checked);
    _GravaConfiguracoesBoolean(ckStatusPP.Name, ckStatusPP.Checked);

    _GravaConfiguracoesBoolean(ckOrigemErp.Name, ckOrigemErp.Checked);
    _GravaConfiguracoesBoolean(ckOrigemBot.Name, ckOrigemBot.Checked);

    _GravaConfiguracoesBoolean(ckDestinoErp.Name, ckDestinoErp.Checked);
    _GravaConfiguracoesBoolean(ckDestinoBot.Name, ckDestinoBot.Checked);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
  end;
end;

procedure TfrmCadMensMob.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  if CadMensMobile.dataSet.State = dsInsert then
  begin
    GroupBox4.Caption := 'Enviando Mensagem';
    Label11.Left := 102;
    Label9.Left := 89;
    Label11.Caption := 'Usuário/Envio:';
    Label9.Caption := 'Data/Hora Envio:';
    DBEdit7.DataField := 'US_ENVIO';
    DBEdit2.DataField := 'DATA_ENVIO';
    DBEdit4.DataField := 'HORA_ENVIO';
    DBLookupComboBox2.DataField := 'US_ENVIO';
    DBMemo1.Enabled := true;
    DBGrid2.Enabled := true;
    DBGrid3.Enabled := true;
    btSelectAll.Enabled := true;
    btUnSelectAll.Enabled := true;
    BitBtn7.Visible := false;
  end
  else
  begin
    DBMemo1.Enabled := false;
    DBGrid2.Enabled := false;
    DBGrid3.Enabled := false;
    btSelectAll.Enabled := false;
    btUnSelectAll.Enabled := false;
    BitBtn7.Visible := true;
  end;
//    GroupBox4.Caption := 'Lendo Mensagem';
//    Label11.Left := 84;
//    Label9.Left := 70;
//    Label11.Caption := 'Usuário/Receptor:';
//    Label9.Caption := 'Data/Hora Recepção:';
//    DBEdit7.DataField := 'COD_US_LEU';
//    DBEdit2.DataField := 'DATA_RECEPCAO';
//    DBEdit4.DataField := 'HORA_RECEPCAO';
//    DBLookupComboBox2.DataField := 'COD_US_LEU';
//    DBMemo1.Enabled := false;
//    DBGrid2.Enabled := false;
//    BitBtn7.Visible := true;
//  end;
end;

procedure TfrmCadMensMob.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
    ckAplicativo.Checked := _LerConfiguracoesRegistroBoolean(ckAplicativo.Name);
    ckMobile.Checked := _LerConfiguracoesRegistroBoolean(ckMobile.Name);
    ckEcommerce.Checked := _LerConfiguracoesRegistroBoolean(ckEcommerce.Name);
    ckFinanceiro.Checked := _LerConfiguracoesRegistroBoolean(ckFinanceiro.Name);
    ckPagOnline.Checked := _LerConfiguracoesRegistroBoolean(ckPagOnline.Name);

    ckStatusNO.Checked := _LerConfiguracoesRegistroBoolean(ckStatusNO.Name);
    ckStatusEP.Checked := _LerConfiguracoesRegistroBoolean(ckStatusEP.Name);
    ckStatusAC.Checked := _LerConfiguracoesRegistroBoolean(ckStatusAC.Name);
    ckStatusER.Checked := _LerConfiguracoesRegistroBoolean(ckStatusER.Name);
    ckStatusPP.Checked := _LerConfiguracoesRegistroBoolean(ckStatusPP.Name);

    ckOrigemErp.Checked := _LerConfiguracoesRegistroBoolean(ckOrigemErp.Name);
    ckOrigemBot.Checked := _LerConfiguracoesRegistroBoolean(ckOrigemBot.Name);

    ckDestinoErp.Checked := _LerConfiguracoesRegistroBoolean(ckDestinoErp.Name);
    ckDestinoBot.Checked := _LerConfiguracoesRegistroBoolean(ckDestinoBot.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
 	  CheckBox1Click(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name)) <> '' then
    	ComboBox11.Text   := _LerConfiguracoesRegistroString(ComboBox11.Name);
    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
 			if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
      	ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    ComboBox11Exit(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name)) <> '' then
    	ComboBox12.Text       := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text        := _LerConfiguracoesRegistroString(MaskEdit7.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text        := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text        := _LerConfiguracoesRegistroString(MaskEdit9.Name);
  end;
end;

procedure TfrmCadMensMob.PageControl4Change(Sender: TObject);
begin
  if PageControl4.ActivePage = TabSheet_Cad_Mensageria then
  	CadMensMobile.vDoc.abreDocEletronicoMensMobile(
    	CadMensMobile.dataSet.FieldByName('IDSEQM').AsInteger,
    	'HWC_MENS_P_')
  else if PageControl4.ActivePage = TabSheet_Ler_Mensageria then
  	CadMensMobile.vDoc.abreDocEletronicoMensMobile(
    	CadMensMobile.dataSet.FieldByName('IDSEQM').AsInteger,
    	'HWC_MENS_G_')
  else if PageControl4.ActivePage = TabSheet_Update_Mensageria then
  	CadMensMobile.vDoc.abreDocEletronicoMensMobile(
    	CadMensMobile.dataSet.FieldByName('IDSEQM').AsInteger,
    	'HWC_MENS_U_');
end;

procedure TfrmCadMensMob.qrpMensMobilePreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Cadastro de Mensagem Mobile');
end;

procedure TfrmCadMensMob.SpeedButton10Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CadMensMobile._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMensMob.SpeedButton1Click(Sender: TObject);
var
	vAssunto, vHtml: string;
begin
  try
    if CadMensMobile.dataSet.IsEmpty then
      Exit;

    if CadMensMobile.dataSet.FieldByName('ORIG_MENS').AsString = 'A' then
    begin
      vHtml := CadMensMobile.dataset.FieldByName('HTML').AsString;
//      vHtml := vDadosIni._converterTagsImage(vHtml, CadMensMobile.buscas, true);
      vAssunto := CadMensMobile.dataset.FieldByName('ASSUNTO').AsString;
//      vAssunto := vDadosIni._converterTagsImage(vAssunto, CadMensMobile.buscas, true);
      if (CadMensMobile.dataset.FieldByName('APLICATIVO').AsString = 'WHATSAPP') or (CadMensMobile.dataset.FieldByName('APLICATIVO').AsString = 'TELEGRAM') then
         vHtml := _markdownToHtml(vHtml);
      vDadosIni.abreFormVisualizarHtml(vHtml, vAssunto);

      if vDadosIni.GetIni('MD', 'MHTT', 'N') <> 'S' then
      begin
        if (trim(CadMensMobile.dataset.FieldByName('PLATAFORMA').AsString) <> '')
          and (trim(CadMensMobile.dataset.FieldByName('UUID').AsString) <> '')
          and (trim(CadMensMobile.dataset.FieldByName('STATUS_ENV').AsString) <> 'PP') then
            vDadosIni.ConsultarMensagemMensageria(
              CadMensMobile.dataset.FieldByName('IDSEQM').AsInteger,
              CadMensMobile.dataset.FieldByName('PLATAFORMA').AsString,
              CadMensMobile.dataset.FieldByName('UUID').AsString
            );
      end;
    end
    else
    begin
      if not CadMensMobile.Edit then
        Exit;
      inherited;

      pnMobileUsuario.Visible := CadMensMobile.dataSet.FieldByName('ORIG_MENS').AsString <> 'A';

      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := tsCadastro;
      TabSheetMobile.TabVisible := True;
      TabSheetSenhas.TabVisible := True;

      cod_mobile := CadMensMobile.dataSet.FieldByName('IDMOBILE').AsInteger;
      cod_usuario_env := CadMensMobile.dataSet.FieldByName('US_ENVIO').AsInteger;

      if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
        DBMemo1.SetFocus;
    end;
    
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadMensMobile.Cancel;
      CadMensMobile.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMensMob.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('MOB019', 'ABRIR A LIXEIRA', '', 'MENSAGEM_MOB',
    '', CadMensMobile.buscas, true) then
    Exit;

  inherited;

  if not CadMensMobile._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [MOB015]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [MOB016]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadMensMob.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    CadMensMobile.Delete;
    lixeiraVazia(not CadMensMobile._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadMensMobile.Cancel;
      CadMensMobile.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMensMob.SpeedButton3Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('MOB020', 'IMPRIMIR', '', 'MENSAGEM_MOB',
    CadMensMobile.dataSet.FieldByName('IDSEQM').AsString, CadMensMobile.buscas, true) then
    exit;

  qrpMensMobile.Preview;
end;

procedure TfrmCadMensMob.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('MOB017', 'RESTAURAR', '', 'MENSAGEM_MOB', '', CadMensMobile.buscas, false) then
    if CadMensMobile._restauraLixeira then
      lixeiraVazia(not CadMensMobile._lixeiraCheia);
end;

procedure TfrmCadMensMob.SpeedButton6Click(Sender: TObject);
begin
  try
    if CadMensMobile.dataSet.IsEmpty then
      Exit;

    if not CadMensMobile.LerMensagem then
      Exit;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadMensMobile.Cancel;
      CadMensMobile.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMensMob.SpeedButton8Click(Sender: TObject);
begin
  if CadMensMobile.dataSet.IsEmpty then
  	Exit;

  DBGridMensageriaPost.Width   := _LerConfiguracoesRegistroInteger(DBGridMensageriaPost.Name,   vDadosIni.IfThen(DBGridMensageriaPost.Width    < 120, 120, DBGridMensageriaPost.Width));
  DBGridMensageriaGet.Width    := _LerConfiguracoesRegistroInteger(DBGridMensageriaGet.Name,    vDadosIni.IfThen(DBGridMensageriaGet.Width     < 120, 120, DBGridMensageriaGet.Width));
  DBGridMensageriaUpdate.Width := _LerConfiguracoesRegistroInteger(DBGridMensageriaUpdate.Name, vDadosIni.IfThen(DBGridMensageriaUpdate.Height < 120, 120, DBGridMensageriaUpdate.Height));

  CadMensMobile.lerDadosApiMensagem;
end;

procedure TfrmCadMensMob.SpeedButton9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CadMensMobile._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadMensMob.SplitterMensageriaGetMoved(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesInteger(DBGridMensageriaGet.Name, vDadosIni.IfThen(DBGridMensageriaGet.Width < 120, 120, DBGridMensageriaGet.Width));
end;

procedure TfrmCadMensMob.SplitterMensageriaPostMoved(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesInteger(DBGridMensageriaPost.Name, vDadosIni.IfThen(DBGridMensageriaPost.Width < 120, 120, DBGridMensageriaPost.Width));
end;

procedure TfrmCadMensMob.SplitterMensageriaUpdateMoved(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesInteger(DBGridMensageriaUpdate.Name, vDadosIni.IfThen(DBGridMensageriaUpdate.Width < 120, 120, DBGridMensageriaUpdate.Width));
end;

procedure TfrmCadMensMob.ComboBox12Enter(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        exit;
      end;
    end;
  end;
end;

procedure TfrmCadMensMob.ComboBox12Exit(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        break;
      end;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

end.

