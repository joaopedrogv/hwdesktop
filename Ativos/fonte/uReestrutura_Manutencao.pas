unit uReestrutura_Manutencao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls, Menus;

type
  TfrmReestrutura_Manutencao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edVersaoSistema: TEdit;
    edVersaoScript: TEdit;
    Label3: TLabel;
    edExecucao: TComboBox;
    Label4: TLabel;
    edParteScript: TEdit;
    Label5: TLabel;
    edParteErro: TEdit;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    edScript: TDBMemo;
    GroupBox3: TGroupBox;
    edErro: TDBMemo;
    Splitter2: TSplitter;
    BitBtn3: TBitBtn;
    rbHwauto: TRadioButton;
    rbFiscal: TRadioButton;
    rbHWF: TRadioButton;
    PopupMenu1: TPopupMenu;
    SelecionarTodos1: TMenuItem;
    RemoverSelecionarTodos1: TMenuItem;
    Inverterseleo1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure edErroDblClick(Sender: TObject);
    procedure edScriptDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Inverterseleo1Click(Sender: TObject);
    procedure RemoverSelecionarTodos1Click(Sender: TObject);
    procedure SelecionarTodos1Click(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rbHwautoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReestrutura_Manutencao: TfrmReestrutura_Manutencao;

implementation

uses
  uReestrutura_Classes;

{$R *.dfm}

procedure TfrmReestrutura_Manutencao.BitBtn1Click(Sender: TObject);
begin
  reestrutura.PesquisarScripts(edVersaoSistema.Text, edVersaoScript.Text, edExecucao.Text, edParteScript.Text, edParteErro.Text);
end;

procedure TfrmReestrutura_Manutencao.BitBtn2Click(Sender: TObject);
begin
  reestrutura.AddScriptParaExecutar;
  if reestrutura.GetCountScripts > 0 then
    GroupBox1.Caption := 'Scripts - Selecionados: ' + IntToStr(reestrutura.GetCountScripts)
  else
    GroupBox1.Caption := 'Scripts';
end;

procedure TfrmReestrutura_Manutencao.BitBtn3Click(Sender: TObject);
begin
  reestrutura.MarcarScriptComoManual;
end;

procedure TfrmReestrutura_Manutencao.BitBtn4Click(Sender: TObject);
begin
  reestrutura.ClearScriptParaExecutar;
  GroupBox1.Caption := 'Scripts';
end;

procedure TfrmReestrutura_Manutencao.BitBtn5Click(Sender: TObject);
begin
  reestrutura.ExecutarScriptsAdicionados;
end;

procedure TfrmReestrutura_Manutencao.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    reestrutura.MarcarDesmarcar(reestrutura.DadosIni.IfThen(reestrutura.DataSource_Manutencao.DataSet.FieldByName('sel').AsString = 'S', osUnSel, osSel));
end;

procedure TfrmReestrutura_Manutencao.DBGrid1DblClick(Sender: TObject);
begin
  reestrutura.MarcarDesmarcar(reestrutura.DadosIni.IfThen(reestrutura.DataSource_Manutencao.DataSet.FieldByName('sel').AsString = 'S', osUnSel, osSel));
end;

procedure TfrmReestrutura_Manutencao.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if reestrutura.DataSource_Manutencao.dataSet.FieldByName('sel').AsString = 'S' then
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

    TDBGrid(sender).Canvas.FillRect(Rect);
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmReestrutura_Manutencao.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    reestrutura.MarcarDesmarcar(reestrutura.DadosIni.IfThen(reestrutura.DataSource_Manutencao.DataSet.FieldByName('sel').AsString = 'S', osUnSel, osSel));
end;

procedure TfrmReestrutura_Manutencao.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Classes.ssShift in Shift then
    reestrutura.MarcarDesmarcar(reestrutura.DadosIni.IfThen(reestrutura.DataSource_Manutencao.DataSet.FieldByName('sel').AsString = 'S', osUnSel, osSel));
end;

procedure TfrmReestrutura_Manutencao.DBGrid1TitleClick(Column: TColumn);
begin
  reestrutura.DadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TfrmReestrutura_Manutencao.edErroDblClick(Sender: TObject);
begin
  edErro.WordWrap := not edErro.WordWrap;
  if edErro.WordWrap then edErro.ScrollBars := ssNone else edErro.ScrollBars := ssBoth;
end;

procedure TfrmReestrutura_Manutencao.edScriptDblClick(Sender: TObject);
begin
  edScript.WordWrap := not edScript.WordWrap;
  if edScript.WordWrap then edScript.ScrollBars := ssNone else edScript.ScrollBars := ssBoth;
end;

procedure TfrmReestrutura_Manutencao.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Sistema: string;
begin
  reestrutura.DadosIni._GravaConfiguracoesString('Reestrutura\' + edVersaoSistema.Name, edVersaoSistema.Text);
  reestrutura.DadosIni._GravaConfiguracoesString('Reestrutura\' + edVersaoScript.Name , edVersaoScript.Text );
  reestrutura.DadosIni._GravaConfiguracoesString('Reestrutura\' + edParteScript.Name  , edParteScript.Text  );
  reestrutura.DadosIni._GravaConfiguracoesString('Reestrutura\' + edParteErro.Name    , edParteErro.Text    );
  reestrutura.DadosIni._GravaConfiguracoesString('Reestrutura\' + edExecucao.Name     , edExecucao.Text     );
  if rbFiscal.Checked then
     Sistema := 'Fiscal'
  else if rbHWF.Checked then
    Sistema := 'HWF'
  else
    Sistema := 'Hwauto';
  reestrutura.DadosIni._GravaConfiguracoesString('Reestrutura\edSistema', Sistema);

  Action := caFree;
  frmReestrutura_Manutencao := nil;
end;

procedure TfrmReestrutura_Manutencao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  reestrutura.DadosIni.vShiftClick := Key = VK_SHIFT;
end;

procedure TfrmReestrutura_Manutencao.FormShow(Sender: TObject);
var
  Sistema: string;
begin
  edVersaoSistema.Text := reestrutura.DadosIni._LerConfiguracoesRegistroString('Reestrutura\' + edVersaoSistema.Name, '');
  edVersaoScript.Text  := reestrutura.DadosIni._LerConfiguracoesRegistroString('Reestrutura\' + edVersaoScript.Name , '');
  edParteScript.Text   := reestrutura.DadosIni._LerConfiguracoesRegistroString('Reestrutura\' + edParteScript.Name  , '');
  edParteErro.Text     := reestrutura.DadosIni._LerConfiguracoesRegistroString('Reestrutura\' + edParteErro.Name    , '');
  edExecucao.ItemIndex := edExecucao.Items.IndexOf(reestrutura.DadosIni._LerConfiguracoesRegistroString('Reestrutura\' + edExecucao.Name, 'Todos'));
  Sistema              := reestrutura.DadosIni._LerConfiguracoesRegistroString('Reestrutura\edSistema', 'Hwauto');
  if Sistema = 'Fiscal' then
    rbFiscal.Checked := True
  else if Sistema = 'HWF' then
    rbHWF.Checked := True
  else
    rbHwauto.Checked := True;

  DBGrid1.DataSource := reestrutura.DataSource_Manutencao;
  edScript.DataSource := reestrutura.DataSource_Manutencao;
  edErro.DataSource := reestrutura.DataSource_Manutencao;
  edScript.DataField := 'sqltext';
  edErro.DataField := 'logerro';
end;

procedure TfrmReestrutura_Manutencao.Inverterseleo1Click(Sender: TObject);
begin
  reestrutura.MarcarDesmarcar(osInvert);
end;

procedure TfrmReestrutura_Manutencao.rbHwautoClick(Sender: TObject);
var
  Sistema: string;
begin
  if rbFiscal.Checked then
    Sistema := 'Fiscal'
  else if rbHWF.Checked then
    Sistema := 'HWF'
  else
    Sistema := 'Hwauto';

  if Sistema <> reestrutura.Sistema then
  begin
    reestrutura.Sistema := Sistema;
    reestrutura.Manutencao.Close;
    reestrutura.ClearScriptParaExecutar;
    GroupBox1.Caption := 'Scripts';
  end;
end;

procedure TfrmReestrutura_Manutencao.RemoverSelecionarTodos1Click(
  Sender: TObject);
begin
  reestrutura.MarcarDesmarcar(osUnSelAll);
end;

procedure TfrmReestrutura_Manutencao.SelecionarTodos1Click(Sender: TObject);
begin
  reestrutura.MarcarDesmarcar(osSelAll);
end;

procedure TfrmReestrutura_Manutencao.SpeedButton1Click(Sender: TObject);
begin
  reestrutura.ShowDataBaseInfo;
end;

procedure TfrmReestrutura_Manutencao.SpeedButton2Click(Sender: TObject);
var
  Astr: string;
  startv, endv: Integer;
begin
  if not InputQuery('Versão do Script', 'Informe a versão do script. Ex: (1) (20-21)', Astr) then
    Exit;

  if Pos('-', Astr) > 0 then
  begin
    startv := StrToIntDef(Copy(Astr, 1, Pos('-', Astr) - 1), 0);
    endv := StrToIntDef(Copy(Astr, Pos('-', Astr) + 1, Length(Astr)), 0);
  end
  else if StrToIntDef(Astr, 0) = 0 then
    Exit
  else
  begin
    startv := StrToIntDef(Astr, 0);
    endv := StrToIntDef(Astr, 0);
  end;

  Screen.Cursor := crHourGlass;
  try
    reestrutura.Verificar_Versao(startv, endv);
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
