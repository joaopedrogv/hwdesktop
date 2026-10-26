unit uPrecoPorQtde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DBCtrls;

type
  TfrmPrecoPorQtde = class(TForm)
    Panel63: TPanel;
    BitBtn128: TBitBtn;
    BitBtn129: TBitBtn;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DBText38: TDBText;
    Label69: TLabel;
    DBText39: TDBText;
    Label327: TLabel;
    DBText40: TDBText;
    Label333: TLabel;
    DBText41: TDBText;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn129Click(Sender: TObject);
    procedure BitBtn128Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrecoPorQtde: TfrmPrecoPorQtde;

implementation

uses uDtmPedVenda, uDtmAtivo, UClassesPedVenda;

{$R *.dfm}

procedure TfrmPrecoPorQtde.BitBtn128Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmPrecoPorQtde.BitBtn129Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPrecoPorQtde.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_ESCAPE then
	 	BitBtn129Click(Sender);
end;

procedure TfrmPrecoPorQtde.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
 	BitBtn129Click(Sender);
end;

procedure TfrmPrecoPorQtde.FormShow(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

end.
