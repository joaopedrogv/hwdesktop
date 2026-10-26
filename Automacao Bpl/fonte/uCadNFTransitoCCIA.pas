unit uCadNFTransitoCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UClassesVeiculosCCIA;

type
  TfrmCadNFTransitoCCIA = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    PnEstoque: TPanel;
    Panel34: TPanel;
    BitBtn19: TBitBtn;
    BitBtn35: TBitBtn;
    DBGrid2: TDBGrid;
    Panel48: TPanel;
    Label90: TLabel;
    Panel46: TPanel;
    Label86: TLabel;
    ckNRecebidas: TCheckBox;
    ckRecebidas: TCheckBox;
    ckCanceladas: TCheckBox;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    { Public declarations }
  end;

var
  frmCadNFTransitoCCIA: TfrmCadNFTransitoCCIA;
  NFTransito: TNFTransito;

implementation

uses uDtmAtivo, DBClient, ConsultasU, UDtmVeiculosCCIA;

{$R *.dfm}

procedure TfrmCadNFTransitoCCIA.BitBtn1Click(Sender: TObject);
var
  vSqlAdc: string;
begin
 try
  if not vDadosIni.PesqPros('VEI106', 'CONSULTA', '', 'NF_TRANSITO', '',
    NFTransito.buscas, true) then
    Exit;

  vSqlAdc := '';
  if (not ckNRecebidas.Checked) and (not ckRecebidas.Checked) and (not ckCanceladas.Checked) then
   ckNRecebidas.Checked := true;

  if (not ckNRecebidas.Checked) and (ckRecebidas.Checked) and (ckCanceladas.Checked) then
    vSqlAdc := ' (TRIM(NF_TRANSITO.STATUST) IN (''RECEBIDA'', ''CANCELADA'')) '
  else if (ckNRecebidas.Checked) and (ckRecebidas.Checked) and (not ckCanceladas.Checked) then
    vSqlAdc := ' (TRIM(COALESCE(NF_TRANSITO.STATUST, '''')) IN ('''', ''RECEBIDA'')) '
  else if (ckNRecebidas.Checked) and (not ckRecebidas.Checked) and (ckCanceladas.Checked) then
    vSqlAdc := ' (TRIM(COALESCE(NF_TRANSITO.STATUST, '''')) IN ('''', ''CANCELADA'')) '
  else if (ckNRecebidas.Checked) and (not ckRecebidas.Checked) and (not ckCanceladas.Checked) then
    vSqlAdc := ' (TRIM(COALESCE(NF_TRANSITO.STATUST, '''')) IN ('''')) '
  else if (not ckNRecebidas.Checked) and (ckRecebidas.Checked) and (not ckCanceladas.Checked) then
    vSqlAdc := ' (TRIM(NF_TRANSITO.STATUST) IN (''RECEBIDA'')) '
  else if (not ckNRecebidas.Checked) and (not ckRecebidas.Checked) and (ckCanceladas.Checked) then
    vSqlAdc := ' (TRIM(NF_TRANSITO.STATUST) IN (''CANCELADA'')) ';

  inherited;
  if MaskEdit2.Visible then
  begin
    if not NFTransito.ConsultaCampos('NF_TRANSITO', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1, 'NF_TRANSITO.*', '', vSqlAdc) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not NFTransito.ConsultaCampos('NF_TRANSITO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa, 'NF_TRANSITO.*', '', vSqlAdc) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
 finally
  _GravaConfiguracoesBoolean('ckNRecebidas', ckNRecebidas.Checked);
  _GravaConfiguracoesBoolean('ckRecebidas', ckRecebidas.Checked);
  _GravaConfiguracoesBoolean('ckCanceladas', ckCanceladas.Checked);
 end;
end;

procedure TfrmCadNFTransitoCCIA.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUST').AsString) = 'CANCELADA') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUST').AsString) = '')
  and (TDBGrid(sender).DataSource.DataSet.FieldByName('NUM_NOTAT').AsInteger > 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clMenuHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadNFTransitoCCIA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) and (PageControl1.ActivePage = TabSheet2) then
    SpeedButton8Click(Sender)
end;

procedure TfrmCadNFTransitoCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (NFTransito <> nil) then
    NFTransito.Cancel;

  NFTransito.free;
  NFTransito := nil;

  Action := caFree;
  if (frmCadNFTransitoCCIA <> nil) then
    frmCadNFTransitoCCIA := nil;
end;

procedure TfrmCadNFTransitoCCIA.FormCreate(Sender: TObject);
var
 I: Integer;
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  NFTransito := TNFTransito.create;
  NFTransito.abreNFTransito;

  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;

  for I := 0 to PageControl3.PageCount - 1 do
    PageControl3.Pages[i].TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmCadNFTransitoCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_f10 then
  begin
    if (ckNRecebidas.visible) and (PageControl1.ActivePage = TabSheet2) then
      ckNRecebidas.Checked := not ckNRecebidas.Checked;
  end
  else if Key = vk_f11 then
  begin
    if (ckRecebidas.visible) and (PageControl1.ActivePage = TabSheet2) then
      ckRecebidas.Checked := not ckRecebidas.Checked;
  end
  else if Key = vk_f12 then
  begin
    if (ckCanceladas.visible) and (PageControl1.ActivePage = TabSheet2) then
      ckCanceladas.Checked := not ckCanceladas.Checked;
  end;
end;

procedure TfrmCadNFTransitoCCIA.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmVeiculosCCIA.dsNFTransito;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  ckNRecebidas.Checked := _LerConfiguracoesRegistroBoolean('ckNRecebidas');
  ckRecebidas.Checked := _LerConfiguracoesRegistroBoolean('ckRecebidas');
  ckCanceladas.Checked := _LerConfiguracoesRegistroBoolean('ckCanceladas');
  inherited;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadNFTransitoCCIA.SpeedButton1Click(Sender: TObject);
begin
  try
    if NFTransito.dataSet.IsEmpty then
      Exit;

    NFTransito.LimparNFT;
    Screen.Cursor := crHourGlass;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFTransitoCCIA.SpeedButton2Click(Sender: TObject);
begin
  try
    if NFTransito.dataSet.IsEmpty then
      Exit;

    NFTransito.CancelarNFT;
    Screen.Cursor := crHourGlass;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFTransitoCCIA.SpeedButton6Click(Sender: TObject);
begin
  try
    if NFTransito.dataSet.IsEmpty then
      Exit;

    NFTransito.ReceberNFT;
    Screen.Cursor := crHourGlass;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNFTransitoCCIA.SpeedButton8Click(Sender: TObject);
var
 vEstMotoTransito: TEstMotoTransitoCCIA;
begin
  try
    Screen.Cursor := crHourGlass;

    if NFTransito.dataSet.IsEmpty then
     exit;

    if _mdiAberto('FrmTransitoVeiculosCCIA', 'O modulo de Nota Fiscal em Transito se encontra aberto!') then
    begin
      vEstMotoTransito := TEstMotoTransitoCCIA.create;
      vEstMotoTransito.CadEstMotoTransito(1, NFTransito.dataSet.FieldByName('NUM_NOTAT').AsInteger);
    end;
  finally
     vEstMotoTransito.Free;
     vDadosIni.fechaStatusProcessamento;
     Screen.Cursor := crDefault;
  end;
end;

function TfrmCadNFTransitoCCIA._mdiAberto(pNomeFormMDI,
  pMensagem: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> ''  then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;

end;

initialization
  RegisterClass(TfrmCadNFTransitoCCIA);
finalization
  UnRegisterClass(TfrmCadNFTransitoCCIA);

end.
