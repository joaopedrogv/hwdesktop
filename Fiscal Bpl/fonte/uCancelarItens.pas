unit uCancelarItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus;

type
  TfrmCancelarItens = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    MenuFiscal1: TMenuItem;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelarItens: TfrmCancelarItens;

implementation

uses uDtmFiscal, uPrincipalF, uDadosIniFiscal;

{$R *.dfm}

procedure TfrmCancelarItens.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmCancelarItens.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmCancelarItens.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('Status_it').AsString = 'CANCELADO' then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TfrmCancelarItens.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    ModalResult := mrOk
  else if Key = VK_TAB then
    BitBtn1.SetFocus;
end;

procedure TfrmCancelarItens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_F3) or (key = VK_RETURN) then
    BitBtn1Click(sender)
  else if key = VK_ESCAPE then
    BitBtn2Click(sender);
end;

procedure TfrmCancelarItens.FormShow(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    BitBtn1.Caption := 'OK (Enter)';
  end;
  DBGrid1.SetFocus;
end;

procedure TfrmCancelarItens.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.MenuFiscal;
end;

end.

