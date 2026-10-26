unit UCadTipoFaturamento;

interface

uses
  Windows, uCadPadrao, DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, Controls, StdCtrls, Mask, Forms, Classes, UClassesClientes, AppEvnts,UCadPadraoModal,
  Graphics;

type
  TFrmCadTipoFaturamento = class(TfrmCadPadraoM)
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTipoFaturamento: TFrmCadTipoFaturamento;
  Faturamento: TFaturamento;

implementation

uses
  uDtmAtivo,UDtmClientes;

{$R *.dfm}

procedure TFrmCadTipoFaturamento.BitBtn1Click(Sender: TObject);
begin
SpeedButton2.Hint := 'Enviar para Lixeira -  [CLI104]';
  if vDadosIni.PesqPros('CLI100', 'PESQUISAR', '', 'TIPO_FATURAMENTO', '', Faturamento.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Faturamento.ConsultaCampos('TIPO_FATURAMENTO', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not Faturamento.ConsultaCampos('TIPO_FATURAMENTO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		  ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if Faturamento.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    Faturamento.ultimasql := Faturamento.dataset.CommandText;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadTipoFaturamento.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI101', 'INSERINDO NOVO REGISTRO', '', 'TIPO_FATURAMENTO', '', Faturamento.buscas, true) then
  begin
    inherited;
    if Faturamento.Insert then
    begin
    	Faturamento.PreencheCampos;
      TabSheet3.TabVisible := true;
      TabSheet3.Caption := 'Cadastrar Tipo de Faturamento';
      TabSheet3.Show;

      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus;
    end;
  end;
end;

procedure TFrmCadTipoFaturamento.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
  if not Faturamento.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if Faturamento.Insert then
      begin
        Faturamento.PreencheCampos;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadTipoFaturamento.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('CLI108','CANCELAR', '','TIPO_FATURAMENTO',Faturamento.dataSet.FieldByName('CODIGO_FATURAMENTO').AsString, Faturamento.buscas, true) then
//  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    Faturamento.Cancel;
    Faturamento.RollBackTransacao;
    inherited;
//  end;
end;

procedure TFrmCadTipoFaturamento.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Faturamento._marcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoFaturamento.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Faturamento._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadTipoFaturamento.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	Faturamento._marcaDesmarcaLinha;
end;

procedure TFrmCadTipoFaturamento.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Faturamento.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
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

procedure TFrmCadTipoFaturamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_SPACE) then
  	Faturamento._marcaDesmarcaLinha
  else if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TFrmCadTipoFaturamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Faturamento.Cancel;
  Faturamento.RollBackTransacao;
  Faturamento.free;
  Action := caFree;
  FrmCadTipoFaturamento := nil;
end;

procedure TFrmCadTipoFaturamento.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Faturamento := TFaturamento.Create;
//  Faturamento.abreTipoFaturamento('');
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadTipoFaturamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if BitBtn3.CanFocus then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if BitBtn5.CanFocus then
      BitBtn5Click(Sender);
  end
end;

procedure TFrmCadTipoFaturamento.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
  	DBGrid1.DataSource := DtmClientes.dsFaturamento;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadTipoFaturamento.SpeedButton1Click(Sender: TObject);
begin
  if not Faturamento.dataSet.IsEmpty then
    if vDadosIni.PesqPros('CLI102', 'EDITANDO REGISTRO', '', 'TIPO_FATURAMENTO', Faturamento.dataSet.FieldByName('CODIGO_FATURAMENTO').AsString, Faturamento.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        if Faturamento.dataSet.FieldByName('ATIVO').AsInteger = 1 then
          if Faturamento.Edit then
          begin
            inherited;
            Faturamento.PreencheCampos;
            PageControl1.ActivePage := TabSheet1;
            TabSheet3.TabVisible := true;
            TabSheet3.Caption := 'Editar Tipo de Faturamento';
            PageControl3.ActivePage := TabSheet3;
            if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
            	DBEdit2.SetFocus;
          end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
end;

procedure TFrmCadTipoFaturamento.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI106', 'ABRIR A LIXEIRA', '', 'TIPO_FATURAMENTO', '', Faturamento.buscas, true) then
  begin
    inherited;
    if not Faturamento.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [CLI104]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [CLI103]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TFrmCadTipoFaturamento.SpeedButton2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI104', '', '', 'TIPO_FATURAMENTO', '', Faturamento.buscas, false) then
  begin
    inherited;
    Faturamento.Delete;
    if Faturamento.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TFrmCadTipoFaturamento.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI105', '', '', 'TIPO_FATURAMENTO', '', Faturamento.buscas, false) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;
      Faturamento.restaurarRegistro;
      if Faturamento.StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

end.

