unit uSituacaoCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, 
  UClassesClientes, ExtCtrls, uDadosIni, DBCtrls;

type
  TFrmSituacaoCx = class(TfrmPadrao)
    GroupBox32: TGroupBox;
    BitBtn17: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    ScrollBox1: TScrollBox;
    GroupBox27: TGroupBox;
    DBGrid5: TDBGrid;
    GroupBox29: TGroupBox;
    DBGrid6: TDBGrid;
    GroupBox31: TGroupBox;
    DBGrid7: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    GroupBox28: TGroupBox;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label1: TLabel;
    LbDev: TLabel;
    Label2: TLabel;
    LbLiquido: TLabel;
    BitBtn18: TBitBtn;
    GroupBox30: TGroupBox;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label3: TLabel;
    lbDevChq: TLabel;
    Label4: TLabel;
    LbLiqChq: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    SpeedButton59: TSpeedButton;
    Label11: TLabel;
    LbVencCred: TLabel;
    Label13: TLabel;
    LbVencChq: TLabel;
    GbFiltrarCH: TGroupBox;
    ckNaoQuitadoCH: TCheckBox;
    ckQuitadoCH: TCheckBox;
    Label12: TLabel;
    DblControleCH: TDBLookupComboBox;
    GbFiltrarCC: TGroupBox;
    ckNaoQuitadoCC: TCheckBox;
    ckQuitadoCC: TCheckBox;
    Label14: TLabel;
    DblControleCC: TDBLookupComboBox;
    procedure DblControleCHClick(Sender: TObject);
    procedure DblControleCCClick(Sender: TObject);
    procedure DblControleCHExit(Sender: TObject);
    procedure DblControleCCExit(Sender: TObject);
    procedure ckQuitadoCHClick(Sender: TObject);
    procedure ckNaoQuitadoCHClick(Sender: TObject);
    procedure ckQuitadoCCClick(Sender: TObject);
    procedure ckNaoQuitadoCCClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn18Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vCliente: TCadClientes;
  end;

var
  FrmSituacaoCx: TFrmSituacaoCx;
  vNaoQuitadoCC, vQuitadoCC, vControleCC: Boolean;
  vNaoQuitadoCH, vQuitadoCH, vControleCH: Boolean;

implementation

uses
  uDtmAtivo, UDtmClientes;

{$R *.dfm}

procedure TFrmSituacaoCx.BitBtn18Click(Sender: TObject);
begin
  inherited;
  vCliente.DetalhesRecebimentoPrestacao;
end;

procedure TFrmSituacaoCx.ckNaoQuitadoCCClick(Sender: TObject);
begin
  inherited;
  try
    vNaoQuitadoCC          := ckNaoQuitadoCC.Enabled;
    vQuitadoCC             := ckQuitadoCC.Enabled;
    vControleCC            := DblControleCC.Enabled;

    vNaoQuitadoCH          := ckNaoQuitadoCH.Enabled;
    vQuitadoCH             := ckQuitadoCH.Enabled;
    vControleCH            := DblControleCH.Enabled;

  	ckNaoQuitadoCC.Enabled := False;
    ckQuitadoCC.Enabled    := False;
    DblControleCC.Enabled  := False;

    ckNaoQuitadoCH.Enabled := False;
    ckQuitadoCH.Enabled    := False;
    DblControleCH.Enabled  := False;

		vCliente.AtualizarSituacaoCaixa(True, False);
  finally
  	ckNaoQuitadoCC.Enabled := vNaoQuitadoCC;
    ckQuitadoCC.Enabled    := vQuitadoCC;
    DblControleCC.Enabled  := vControleCC;

    ckNaoQuitadoCH.Enabled := vNaoQuitadoCH;
    ckQuitadoCH.Enabled    := vQuitadoCH;
    DblControleCH.Enabled  := vControleCH;
  end;
end;

procedure TFrmSituacaoCx.ckNaoQuitadoCHClick(Sender: TObject);
begin
  inherited;
	try
    vNaoQuitadoCC          := ckNaoQuitadoCC.Enabled;
    vQuitadoCC             := ckQuitadoCC.Enabled;
    vControleCC            := DblControleCC.Enabled;

    vNaoQuitadoCH          := ckNaoQuitadoCH.Enabled;
    vQuitadoCH             := ckQuitadoCH.Enabled;
    vControleCH            := DblControleCH.Enabled;

  	ckNaoQuitadoCC.Enabled := False;
    ckQuitadoCC.Enabled    := False;
    DblControleCC.Enabled  := False;

    ckNaoQuitadoCH.Enabled := False;
    ckQuitadoCH.Enabled    := False;
    DblControleCH.Enabled  := False;

		vCliente.AtualizarSituacaoCaixa(True, False);
  finally
  	ckNaoQuitadoCC.Enabled := vNaoQuitadoCC;
    ckQuitadoCC.Enabled    := vQuitadoCC;
    DblControleCC.Enabled  := vControleCC;

    ckNaoQuitadoCH.Enabled := vNaoQuitadoCH;
    ckQuitadoCH.Enabled    := vQuitadoCH;
    DblControleCH.Enabled  := vControleCH;
  end;
end;

procedure TFrmSituacaoCx.ckQuitadoCCClick(Sender: TObject);
begin
  inherited;
  try
    vNaoQuitadoCC          := ckNaoQuitadoCC.Enabled;
    vQuitadoCC             := ckQuitadoCC.Enabled;
    vControleCC            := DblControleCC.Enabled;

    vNaoQuitadoCH          := ckNaoQuitadoCH.Enabled;
    vQuitadoCH             := ckQuitadoCH.Enabled;
    vControleCH            := DblControleCH.Enabled;

  	ckNaoQuitadoCC.Enabled := False;
    ckQuitadoCC.Enabled    := False;
    DblControleCC.Enabled  := False;

    ckNaoQuitadoCH.Enabled := False;
    ckQuitadoCH.Enabled    := False;
    DblControleCH.Enabled  := False;
    
		vCliente.AtualizarSituacaoCaixa(True, False);
  finally
  	ckNaoQuitadoCC.Enabled := vNaoQuitadoCC;
    ckQuitadoCC.Enabled    := vQuitadoCC;
    DblControleCC.Enabled  := vControleCC;

    ckNaoQuitadoCH.Enabled := vNaoQuitadoCH;
    ckQuitadoCH.Enabled    := vQuitadoCH;
    DblControleCH.Enabled  := vControleCH;
  end;
end;

procedure TFrmSituacaoCx.ckQuitadoCHClick(Sender: TObject);
begin
  inherited;
  try
    vNaoQuitadoCC          := ckNaoQuitadoCC.Enabled;
    vQuitadoCC             := ckQuitadoCC.Enabled;
    vControleCC            := DblControleCC.Enabled;

    vNaoQuitadoCH          := ckNaoQuitadoCH.Enabled;
    vQuitadoCH             := ckQuitadoCH.Enabled;
    vControleCH            := DblControleCH.Enabled;

  	ckNaoQuitadoCC.Enabled := False;
    ckQuitadoCC.Enabled    := False;
    DblControleCC.Enabled  := False;

    ckNaoQuitadoCH.Enabled := False;
    ckQuitadoCH.Enabled    := False;
    DblControleCH.Enabled  := False;

		vCliente.AtualizarSituacaoCaixa(True, False);
  finally
  	ckNaoQuitadoCC.Enabled := vNaoQuitadoCC;
    ckQuitadoCC.Enabled    := vQuitadoCC;
    DblControleCC.Enabled  := vControleCC;

    ckNaoQuitadoCH.Enabled := vNaoQuitadoCH;
    ckQuitadoCH.Enabled    := vQuitadoCH;
    DblControleCH.Enabled  := vControleCH;
  end;
end;

procedure TFrmSituacaoCx.DBGrid1CellClick(Column: TColumn);
begin
	if UpperCase(Column.FieldName) = 'SEL' then
  begin
  	try
    	Screen.Cursor := crHourGlass;
	  	vCliente._marcarDesmarcarSituacaoDeCaixa;
    finally
    	Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmSituacaoCx.DBGrid1DblClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
	  vCliente._marcarDesmarcarSituacaoDeCaixa;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSituacaoCx.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
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

procedure TFrmSituacaoCx.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_SPACE then
  begin
  	try
	  	Screen.Cursor := crHourGlass;
  	  vCliente._marcarDesmarcarSituacaoDeCaixa;
    finally
    	Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmSituacaoCx.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((Column.FieldName = 'DATA_VENC_C')
  	and (vCliente.Creditos.buscas.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros < vCliente.vdataat)
    and (vCliente.Creditos.buscas.FieldByName('DATQ_C').IsNull)
    and (not vCliente.Creditos.buscas.FieldByName('COD_CRED').IsNull)) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
  end;
//  else
//  begin
//    TDBGrid(sender).Canvas.Brush.Color := clBlue;
//    TDBGrid(sender).Canvas.FillRect(Rect);
//  end;
  TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TFrmSituacaoCx.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((Column.FieldName = 'DATA_VENC')
  	and (vCliente.Cheques.buscas.FieldByName('DATA_VENC').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros < vCliente.vdataat)
    and (vCliente.Cheques.buscas.FieldByName('DATQ_CH').IsNull)
    and (not vCliente.Cheques.buscas.FieldByName('CODIGO_CH').IsNull)) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
  end;
//  else
//  begin
//    TDBGrid(sender).Canvas.Brush.Color := clBlue;
//    TDBGrid(sender).Canvas.FillRect(Rect);
//  end;
  TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
end;


procedure TFrmSituacaoCx.DBGrid7DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((Column.FieldName = 'STATUS_REC') 
  	and (not vCliente.Recibos.buscas.FieldByName('STATUS_REC').IsNull)
    and (not vCliente.Recibos.buscas.FieldByName('NRECIBO').isnull))then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clBlue;
    TDBGrid(sender).Canvas.FillRect(Rect);
  end;
//  else
//  begin
//    TDBGrid(sender).Canvas.Brush.Color := clBlue;
//    TDBGrid(sender).Canvas.FillRect(Rect);
//  end;
  TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
end;

procedure TFrmSituacaoCx.DblControleCCClick(Sender: TObject);
begin
  inherited;
	vCliente.AtualizarSituacaoCaixa(True, False);
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFrmSituacaoCx.DblControleCCExit(Sender: TObject);
begin
  inherited;
	try
    vNaoQuitadoCC          := ckNaoQuitadoCC.Enabled;
    vQuitadoCC             := ckQuitadoCC.Enabled;
    vControleCC            := DblControleCC.Enabled;

    vNaoQuitadoCH          := ckNaoQuitadoCH.Enabled;
    vQuitadoCH             := ckQuitadoCH.Enabled;
    vControleCH            := DblControleCH.Enabled;

  	ckNaoQuitadoCC.Enabled := False;
    ckQuitadoCC.Enabled    := False;
    DblControleCC.Enabled  := False;

    ckNaoQuitadoCH.Enabled := False;
    ckQuitadoCH.Enabled    := False;
    DblControleCH.Enabled  := False;

		vCliente.AtualizarSituacaoCaixa(True, False);
  finally
  	ckNaoQuitadoCC.Enabled := vNaoQuitadoCC;
    ckQuitadoCC.Enabled    := vQuitadoCC;
    DblControleCC.Enabled  := vControleCC;

    ckNaoQuitadoCH.Enabled := vNaoQuitadoCH;
    ckQuitadoCH.Enabled    := vQuitadoCH;
    DblControleCH.Enabled  := vControleCH;
  end;
end;

procedure TFrmSituacaoCx.DblControleCHClick(Sender: TObject);
begin
  inherited;
  vCliente.AtualizarSituacaoCaixa(True, False);
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFrmSituacaoCx.DblControleCHExit(Sender: TObject);
begin
  inherited;
  try
    vNaoQuitadoCC          := ckNaoQuitadoCC.Enabled;
    vQuitadoCC             := ckQuitadoCC.Enabled;
    vControleCC            := DblControleCC.Enabled;

    vNaoQuitadoCH          := ckNaoQuitadoCH.Enabled;
    vQuitadoCH             := ckQuitadoCH.Enabled;
    vControleCH            := DblControleCH.Enabled;

  	ckNaoQuitadoCC.Enabled := False;
    ckQuitadoCC.Enabled    := False;
    DblControleCC.Enabled  := False;

    ckNaoQuitadoCH.Enabled := False;
    ckQuitadoCH.Enabled    := False;
    DblControleCH.Enabled  := False;

		vCliente.AtualizarSituacaoCaixa(True, False);
  finally
  	ckNaoQuitadoCC.Enabled := vNaoQuitadoCC;
    ckQuitadoCC.Enabled    := vQuitadoCC;
    DblControleCC.Enabled  := vControleCC;

    ckNaoQuitadoCH.Enabled := vNaoQuitadoCH;
    ckQuitadoCH.Enabled    := vQuitadoCH;
    DblControleCH.Enabled  := vControleCH;
  end;
end;

procedure TFrmSituacaoCx.FormResize(Sender: TObject);
begin
  inherited;
	if (FrmSituacaoCx.Height >= 642) and (FrmSituacaoCx.Width >= 799) then
  begin
  	GroupBox2.Align := alTop;

    GroupBox27.Align := alClient;

    GroupBox31.Align := alBottom;

    GroupBox29.Align := alBottom;
  end
  else
  begin
    GroupBox2.Align := alTop;

    GroupBox27.Align := alTop;
    GroupBox27.Height := 149;

    GroupBox29.Align := alTop;
    GroupBox29.Height := 149;

    GroupBox31.Align := alTop;
    GroupBox31.Height := 149;
  end;
end;

procedure TFrmSituacaoCx.FormShow(Sender: TObject);
begin
  InibirEstatisticas := True;
  inherited;
end;

procedure TFrmSituacaoCx.SpeedButton10Click(Sender: TObject);
begin
  try
		Screen.Cursor := crHourGlass;
		vCliente._desmarcarTodosSituacaoDeCaixa;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSituacaoCx.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('cl_ficha_exib_somente_cred_cheq_venc', vCliente.buscas);
end;

procedure TFrmSituacaoCx.SpeedButton9Click(Sender: TObject);
begin
  try
		Screen.Cursor := crHourGlass;
		vCliente._marcarTodosSituacaoDeCaixa;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
