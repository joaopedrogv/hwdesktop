unit uEscollhaDescCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TfrmEscolhaDescCFOP = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolhaDescCFOP: TfrmEscolhaDescCFOP;

implementation

uses uDtmNf;

{$R *.dfm}

procedure TfrmEscolhaDescCFOP.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmEscolhaDescCFOP.BitBtn4Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmEscolhaDescCFOP.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    ModalResult := mrOk;
end;

procedure TfrmEscolhaDescCFOP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TfrmEscolhaDescCFOP.FormShow(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

end.

