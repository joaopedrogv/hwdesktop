unit uCadNFCe_VendasSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmCadNFCe_VendasSelect = class(TfrmPadrao)
    pn_vnd_sem_emit: TPanel;
    Label155: TLabel;
    grid_vnd: TDBGrid;
    Panel122: TPanel;
    Label157: TLabel;
    sp_vnd_sem_emit_diatual: TSpeedButton;
    sp_vnd_sem_emit_novodia: TSpeedButton;
    sp_vnd_sem_emit_selecionar: TSpeedButton;
    sp_vnd_sem_emit_voltar: TSpeedButton;
    lb_vnd_data: TLabel;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    ed_vnd_loc: TEdit;
    procedure sp_vnd_sem_emit_selecionarClick(Sender: TObject);
    procedure ed_vnd_locChange(Sender: TObject);
    procedure grid_vndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_vndDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ed_vnd_locKeyPress(Sender: TObject; var Key: Char);
    procedure ed_vnd_locKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure sp_vnd_sem_emit_novodiaClick(Sender: TObject);
    procedure sp_vnd_sem_emit_diatualClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure vendadiaria_data_change(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmCadNFCe_VendasSelect: TfrmCadNFCe_VendasSelect;

implementation

uses
  DB,
  StrUtils,
  hw_utils,
  hw_win_utils,
  uDtmAtivo,
  uClassesNFConsumidor;

{$R *.dfm}

procedure TfrmCadNFCe_VendasSelect.ed_vnd_locChange(Sender: TObject);
var
  Numero: Integer;
begin
  inherited;
  if ed_vnd_loc.Text = '' then
  begin
    grid_vnd.Repaint;
    Exit;
  end;

  if not TryStrToInt(ed_vnd_loc.Text, Numero) then
  begin
    ShowErro('Número digitado inválido');
    Exit;
  end;

  VendaDiaria.dataSet.Locate('NUMERO', Numero, [loPartialKey]);
  grid_vnd.Repaint;
end;

procedure TfrmCadNFCe_VendasSelect.ed_vnd_locKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F4     : if (Self.Enabled) and (Self.Visible) and (grid_vnd.CanFocus) then grid_vnd.SetFocus;
    VK_F5     : if (Self.Enabled) and (Self.Visible) and (ed_vnd_loc.CanFocus) then ed_vnd_loc.SetFocus;
    VK_F8     : sp_vnd_sem_emit_diatual.Click;
    VK_F9     : sp_vnd_sem_emit_novodia.Click;
    VK_F11    : sp_vnd_sem_emit_selecionar.Click;
    VK_ESCAPE : sp_vnd_sem_emit_voltar.Click;
    VK_RETURN : if (ActiveControl = ed_vnd_loc) and (Trim(ed_vnd_loc.Text) = VendaDiaria.fstr('numero')) then sp_vnd_sem_emit_selecionar.Click;
  end;                                    
end;

procedure TfrmCadNFCe_VendasSelect.ed_vnd_locKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not ContainsText('0123456789', Key)) and (Key <> #8) then
    Key := #0;
end;

procedure TfrmCadNFCe_VendasSelect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vDadosIni.enterTela.DeleteExclusion(ed_vnd_loc);
  grid_vnd.DataSource     := nil;
  VendaDiaria.OnDiaChange := nil;

  Action := caFree;
  frmCadNFCe_VendasSelect := nil;
end;

procedure TfrmCadNFCe_VendasSelect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F4 then
  begin
    if (Self.Enabled) and (Self.Visible) and (grid_vnd.CanFocus) then
      grid_vnd.SetFocus;
  end
  else if Key = VK_F5 then
  begin
    if (Self.Enabled) and (Self.Visible) and (ed_vnd_loc.CanFocus) then
      ed_vnd_loc.SetFocus;
  end;
end;

procedure TfrmCadNFCe_VendasSelect.FormShow(Sender: TObject);
var
  NovoDia: TDateTime;
begin
  inherited;

  ed_vnd_loc.Clear;
  vDadosIni.enterTela.AddExclusion(ed_vnd_loc);
  grid_vnd.DataSource     := VendaDiaria._dataSourceOOP;
  VendaDiaria.OnDiaChange := vendadiaria_data_change;

  if RegistroWin.Read(Self.Name, 'vendadiaria_last_click', 'DiaAtual') = 'NovoDia' then
    if TryStrToDate(RegistroWin.Read(Self.Name, 'vendadiaria_last_click.data', ''), NovoDia) then
      VendaDiaria.Dia := NovoDia;

  VendaDiaria.ShowDay();

end;

procedure TfrmCadNFCe_VendasSelect.grid_vndDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Agrid: TDBGrid;
begin
  inherited;

  if Column.FieldName <> 'NUMERO' then
    Exit;

  Agrid := TDBGrid(Sender);

  if ContainsText(Agrid.DataSource.DataSet.FieldByName('NUMERO').AsString, Trim(ed_vnd_loc.Text)) then
    if (gdFocused in State) then
    begin
      Agrid.Canvas.Brush.Color := clWindow;
      Agrid.Canvas.Font.Color  := clWindowText;
    end
    else
    begin
      Agrid.Canvas.Brush.Color := clHighlight;
      Agrid.Canvas.Font.Color  := clWhite;
    end;
  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCadNFCe_VendasSelect.grid_vndKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F4     : if (Self.Enabled) and (Self.Visible) and (grid_vnd.CanFocus) then grid_vnd.SetFocus;
    VK_F5     : if (Self.Enabled) and (Self.Visible) and (ed_vnd_loc.CanFocus) then ed_vnd_loc.SetFocus;
    VK_F8     : sp_vnd_sem_emit_diatual.Click;
    VK_F9     : sp_vnd_sem_emit_novodia.Click;
    VK_F11    : sp_vnd_sem_emit_selecionar.Click;
    VK_ESCAPE : sp_vnd_sem_emit_voltar.Click;
    VK_RETURN :
      if (ActiveControl = ed_vnd_loc) and (Trim(ed_vnd_loc.Text) = VendaDiaria.fstr('numero')) then
        sp_vnd_sem_emit_selecionar.Click
      else if (ActiveControl = grid_vnd) then
        ModalResult := mrOk;
  end;
end;

procedure TfrmCadNFCe_VendasSelect.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  VendaDiaria.ShowDay(-1);
end;

procedure TfrmCadNFCe_VendasSelect.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  VendaDiaria.ShowDay(1);
end;

procedure TfrmCadNFCe_VendasSelect.sp_vnd_sem_emit_diatualClick(
  Sender: TObject);
begin
  inherited;
  VendaDiaria.Dia    := Date;
  VendaDiaria.ShowDay();

  RegistroWin.Write(Self.Name, 'vendadiaria_last_click', 'DiaAtual');
end;

procedure TfrmCadNFCe_VendasSelect.sp_vnd_sem_emit_novodiaClick(
  Sender: TObject);
var
  NovoDia: string;
  NewDay: TDateTime;
begin
  inherited;
  NovoDia := FormatDateTime('dd/M/yyyy', VendaDiaria.Dia);
  if not InputQuery('Novo dia', 'Informe o novo dia no formato "DD/MM/AAAA"', NovoDia) then
    Exit;

  if not TryStrToDate(NovoDia, NewDay) then
  begin
    ShowErro('Data informada inválida');
    Exit;
  end;

  VendaDiaria.Dia    := NewDay;
  VendaDiaria.ShowDay();

  RegistroWin.Write(Self.Name, 'vendadiaria_last_click'     , 'NovoDia');
  RegistroWin.Write(Self.Name, 'vendadiaria_last_click.data', NovoDia);
end;

procedure TfrmCadNFCe_VendasSelect.sp_vnd_sem_emit_selecionarClick(
  Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmCadNFCe_VendasSelect.vendadiaria_data_change(Sender: TObject);
begin
  lb_vnd_data.Caption := FormatDateTime('dd/MM/yyyy', VendaDiaria.Dia);
  sp_vnd_sem_emit_diatual.Font.Style := [];

  if FormatDateTime('dd/MM/yyyy', Date) = lb_vnd_data.Caption then
    sp_vnd_sem_emit_diatual.Font.Style := [fsBold];
end;

end.
