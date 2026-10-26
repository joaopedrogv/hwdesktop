unit uCadRegrasSugestao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadRegrasSugestao = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBComboBox2: TDBComboBox;
    GroupBox5: TGroupBox;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    DBGrid2: TDBGrid;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    SelecionartodosMod: TMenuItem;
    DesmarcarTodosMod: TMenuItem;
    SelecionarTodosEq: TMenuItem;
    DesmarcarTodosEq: TMenuItem;
    DBGrid3: TDBGrid;
    SpeedButton55: TSpeedButton;
    Label211: TLabel;
    Label212: TLabel;
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton55Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DesmarcarTodosEqClick(Sender: TObject);
    procedure SelecionarTodosEqClick(Sender: TObject);
    procedure DesmarcarTodosModClick(Sender: TObject);
    procedure SelecionartodosModClick(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRegrasSugestao: TfrmCadRegrasSugestao;

implementation

uses
	uDtmAtivo, UClassesCadastrosBasicos, uDadosIni, UDtmCadastrosBasicos, DB;

{$R *.dfm}

procedure TfrmCadRegrasSugestao.BitBtn1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS364', 'PESQUISAR', '', 'REGRAS_SUG', '', CadRegrasSug.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not CadRegrasSug.ConsultaCampos('REGRAS_SUG', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            combobox1.setfocus;
    end
    else if not CadRegrasSug.ConsultaCampos('REGRAS_SUG', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadRegrasSugestao.BitBtn3Click(Sender: TObject);
begin
  try
    if not CadRegrasSug.Insert then
      exit;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBComboBox2Exit(Sender);

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadRegrasSug.Cancel;
      CadRegrasSug.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadRegrasSugestao.BitBtn4Click(Sender: TObject);
begin
  try
    BitBtn4.Enabled := false;
    BitBtn5.Enabled := false;
    BitBtn6.Enabled := false;
    if not CadRegrasSug.post then
    begin
      PageControl3.ActivePage := tsCadastro;
      setFocusCampoErro(CadRegrasSug.vNomeCampoErro, CadRegrasSug.vMensagemErro);
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
        if CadRegrasSug.Insert then
        begin
          PageControl3.ActivePage := tsCadastro;
          if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
        end;
      end
      else
        inherited;
    end;
  finally
    BitBtn4.Enabled := true;
    BitBtn5.Enabled := true;
    BitBtn6.Enabled := true;
  end;
end;

procedure TfrmCadRegrasSugestao.BitBtn5Click(Sender: TObject);
begin
  inherited;
  CadRegrasSug.Cancel;
  CadRegrasSug.RollBackTransacao;
end;

procedure TfrmCadRegrasSugestao.DBComboBox2Exit(Sender: TObject);
begin
  DBComboBox2.ItemIndex := vDadosIni.IfThen(CadRegrasSug.dataSet.FieldByName('TIPO').AsString = 'E', 1, 0);
  if DBComboBox2.ItemIndex = 0 then
  begin
    PageControl2.ActivePage := TabSheet4;
    TabSheet4.Visible := True;

    Label9.Visible := true;
    DBEdit3.Visible := true;
    Label10.Visible := true;
    DBEdit4.Visible := true;
    Label11.Visible := true;
    DBEdit6.Visible := true;
    Label12.Visible := true;
    DBEdit7.Visible := true;
    Label13.Visible := true;
    DBEdit5.Visible := true;
  end
  else if DBComboBox2.ItemIndex = 1 then
  begin
    PageControl2.ActivePage := TabSheet5;
    TabSheet5.Visible := True;

    Label9.Visible := false;
    DBEdit3.Visible := false;
    Label10.Visible := false;
    DBEdit4.Visible := false;
    Label11.Visible := false;
    DBEdit6.Visible := false;
    Label12.Visible := false;
    DBEdit7.Visible := false;
    Label13.Visible := false;
    DBEdit5.Visible := false;
  end;
end;

procedure TfrmCadRegrasSugestao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if (Key = VK_F5) then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadRegrasSug.Refresh;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadRegrasSugestao.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	if not CadRegrasSug.vRegrasSugServItens.vModVeiculosServ.dataSet.IsEmpty then
	    CadRegrasSug.vRegrasSugServItens.vModVeiculosServ._marcaDesmarcaLinha(CadRegrasSug.dataset);
end;

procedure TfrmCadRegrasSugestao.DBGrid2DblClick(Sender: TObject);
begin
  if not CadRegrasSug.vRegrasSugServItens.vModVeiculosServ.dataSet.IsEmpty then
    CadRegrasSug.vRegrasSugServItens.vModVeiculosServ._marcaDesmarcaLinha(CadRegrasSug.dataset);
end;

procedure TfrmCadRegrasSugestao.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
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

procedure TfrmCadRegrasSugestao.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
  	CadRegrasSug.vRegrasSugServItens.vModVeiculosServ._marcaDesmarcaLinha(CadRegrasSug.dataset)
  else if Key = VK_F2 then
  	CadRegrasSug.vRegrasSugServItens.vModVeiculosServ._marcaDesmarcaLinha(CadRegrasSug.dataset, 'M')
  else if Key = VK_F3 then
   	CadRegrasSug.vRegrasSugServItens.vModVeiculosServ._marcaDesmarcaLinha(CadRegrasSug.dataset, 'D');
end;

procedure TfrmCadRegrasSugestao.DBGrid3CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	if not CadRegrasSug.vRegrasSugServItens.vEquipamentosServ.dataSet.IsEmpty then
	   CadRegrasSug.vRegrasSugServItens.vEquipamentosServ._marcaDesmarcaLinha(CadRegrasSug.dataset);
end;

procedure TfrmCadRegrasSugestao.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
 if not CadRegrasSug.vRegrasSugServItens.vEquipamentosServ.dataSet.IsEmpty then
   CadRegrasSug.vRegrasSugServItens.vEquipamentosServ._marcaDesmarcaLinha(CadRegrasSug.dataset);
end;

procedure TfrmCadRegrasSugestao.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
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

procedure TfrmCadRegrasSugestao.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
  	CadRegrasSug.vRegrasSugServItens.vEquipamentosServ._marcaDesmarcaLinha(CadRegrasSug.dataset)
  else if Key = VK_F2 then
  	CadRegrasSug.vRegrasSugServItens.vEquipamentosServ._marcaDesmarcaLinha(CadRegrasSug.dataset, 'M')
  else if Key = VK_F3 then
  	CadRegrasSug.vRegrasSugServItens.vEquipamentosServ._marcaDesmarcaLinha(CadRegrasSug.dataset, 'D');
end;

procedure TfrmCadRegrasSugestao.DesmarcarTodosEqClick(Sender: TObject);
begin
  CadRegrasSug.vRegrasSugServItens.vEquipamentosServ._desmarcarTodos(CadRegrasSug.dataset);
end;

procedure TfrmCadRegrasSugestao.DesmarcarTodosModClick(Sender: TObject);
begin
  CadRegrasSug.vRegrasSugServItens.vModVeiculosServ._desmarcarTodos(CadRegrasSug.dataset);
end;

procedure TfrmCadRegrasSugestao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (CadBox <> nil) then
    CadRegrasSug.Cancel;

  CadRegrasSug.free;
  CadRegrasSug := nil;

  Action := caFree;
  if (frmCadRegrasSugestao <> nil) then
    frmCadRegrasSugestao := nil;
end;

procedure TfrmCadRegrasSugestao.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadRegrasSug := TRegrasSugServ.create;
  tsCadastro.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
  begin
    PageControl2.ActivePage := TabSheet4;
    TabSheet4.Visible := True;
  end
  else
  begin
    PageControl2.ActivePage := TabSheet5;
    TabSheet5.Visible := True;
  end;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadRegrasSugestao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (key = VK_RETURN) then
  	SpeedButton1Click(Sender)
end;

procedure TfrmCadRegrasSugestao.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsRegrasSugServ;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS367]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadRegrasSug._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadRegrasSugestao.SelecionarTodosEqClick(Sender: TObject);
begin
  CadRegrasSug.vRegrasSugServItens.vEquipamentosServ._marcarTodos(CadRegrasSug.dataset);
end;

procedure TfrmCadRegrasSugestao.SelecionartodosModClick(Sender: TObject);
begin
  CadRegrasSug.vRegrasSugServItens.vModVeiculosServ._marcarTodos(CadRegrasSug.dataset);
end;

procedure TfrmCadRegrasSugestao.SpeedButton1Click(Sender: TObject);
begin
  try
    if CadRegrasSug.dataSet.IsEmpty then
      Exit;

    if not CadRegrasSug.Edit then
      Exit;

    inherited;
    DBComboBox2Exit(Sender);
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadRegrasSug.Cancel;
      CadRegrasSug.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadRegrasSugestao.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS371', 'ABRIR A LIXEIRA', '', 'REGRAS_SUG',
    '', CadRegrasSug.buscas, true) then
    Exit;

  inherited;

  if not CadRegrasSug._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira - [BAS367]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente - [BAS368]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;

end;

procedure TfrmCadRegrasSugestao.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('BAS367', 'EXCLUIR', '', 'REGRAS_SUG',
      CadRegrasSug.dataSet.FieldByName('CODIGO').AsString, CadRegrasSug.buscas, false) then
      Exit;

    CadRegrasSug.Delete;
    lixeiraVazia(not CadRegrasSug._lixeiraCheia);
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadRegrasSug.Cancel;
      CadRegrasSug.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadRegrasSugestao.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('sug_serv_%', CadRegrasSug.buscas);
end;

procedure TfrmCadRegrasSugestao.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS369', 'RESTAURAR', '', 'REGRAS_SUG',
  	CadRegrasSug.dataSet.FieldByName('CODIGO').AsString, CadRegrasSug.buscas, false) then
    if CadRegrasSug._restauraLixeira then
      lixeiraVazia(not CadRegrasSug._lixeiraCheia);
end;

end.
