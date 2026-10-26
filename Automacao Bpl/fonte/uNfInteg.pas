unit uNfInteg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uClassesNotasFiscais;

type
  TfrmNfInteg = class(TfrmCadPadraoM)
    SpeedButton9: TSpeedButton;
    SpeedButton40: TSpeedButton;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    pnPendente: TPanel;
    ckPendente: TCheckBox;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    vDataUltVer: string;
  end;

var
  frmNfInteg: TfrmNfInteg;
  NFInteg: TNFInteg;

implementation

uses uDtmNF, uDtmAtivo;

{$R *.dfm}

procedure renave_zero_estoque_renave(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';

procedure TfrmNfInteg.BitBtn1Click(Sender: TObject);
var
	I: Integer;
  vWhere: string;
begin
  if not vDadosIni.PesqPros('NF0259', 'CONSULTA', '', 'VW_NOTAFISCAL_INTEG', '',
    NFInteg.buscas, true) then
    Exit;

  vWhere := ' VW_NOTAFISCAL_INTEG.COD_MARCA IN ' + vDadosIni.vSuzuki.vCodMarcas;
  if ckPendente.Checked then
  	vWhere := vWhere + ' AND COALESCE(VW_NOTAFISCAL_INTEG.ID_PROTOCOLO, 0) = 0 ';

  inherited;
  if MaskEdit2.Visible then
  begin
    if not NFInteg.ConsultaCampos('VW_NOTAFISCAL_INTEG', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
      ' VW_NOTAFISCAL_INTEG.* ', '',
    	vWhere) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not NFInteg.ConsultaCampos('VW_NOTAFISCAL_INTEG', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
    ' VW_NOTAFISCAL_INTEG.* ', '',
    vWhere) then
    	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
    		ComboBox1.SetFocus;

  if NFInteg.dataSet.Active then
    for I := 0 to DBGrid1.Columns.Count - 1 do
      if DBGrid1.Columns[i].FieldName = 'XML' then
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmNfInteg.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    NFInteg._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmNfInteg.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    NFInteg._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmNfInteg.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    NFInteg._marcaDesmarcaLinha;
end;

procedure TfrmNfInteg.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if (TDBGrid(sender).DataSource.dataSet.FieldByName('ID_PROTOCOLO').AsInteger <= 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnPendente.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

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
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmNfInteg.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_SPACE) then
    NFInteg._marcaDesmarcaLinha;
end;

procedure TfrmNfInteg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

	if (NFInteg <> nil) then
    NFInteg.Cancel;

  NFInteg.free;
  NFInteg := nil;

  Action := caFree;
  if (frmNfInteg <> nil) then
    frmNfInteg := nil;
end;

procedure TfrmNfInteg.FormCreate(Sender: TObject);
begin
	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'VER_NF_SUZUKI' then
  begin
    vDataUltVer := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
    if dtmNF = nil then
      dtmNF := TdtmNF.Create(dtmNF);
    vDadosIni.vTipoForm := 2;
    vDadosIni.vModalOuChild := 'M';
    vDadosIni.vPesquisa := '';
    frmNfInteg := TfrmNfInteg(self);
  end;

  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  NFInteg := TNFInteg.create;

  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmNfInteg.FormShow(Sender: TObject);
begin
	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'VER_NF_SUZUKI' then
  begin
  	vDataUltVer := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
    if dtmNF = nil then
  		dtmNF := TdtmNF.Create(Self);
    vDadosIni.vTipoForm := 2;
    vDadosIni.vModalOuChild := 'M';
  end;

  TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmNF.dsNfInteg;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 2 then
  begin
  	MaskEdit1.Visible  := True;
    MaskEdit2.Visible  := True;
    MaskEdit3.Visible  := False;
  	MaskEdit1.Text     := vDataUltVer;
    MaskEdit2.Text     := FormatDateTime('dd/mm/yyyy', vDadosIni.getDataBanco(NFInteg.buscas));
    ComboBox1.Text     := NFInteg.dataSet.FieldByName('DATA_LANC').DisplayLabel;
    ComboBox3.Text     := 'Igual';
    ckPendente.Checked := True;
    BitBtn1Click(Sender);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmNfInteg.SpeedButton40Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('vei_codmarca', NFInteg.buscas);
end;

procedure TfrmNfInteg.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if not NFInteg.enviar then
    Exit;
end;

end.
