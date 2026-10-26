unit uSelectControle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TfrmSelectControle = class(TForm)
    Panel1: TPanel;
    pnValorTransacao: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    gridControle: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridControleDblClick(Sender: TObject);
    procedure gridControleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectControle: TfrmSelectControle;

implementation

uses
  uDtmFormPag;

{$R *.dfm}

procedure TfrmSelectControle.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmSelectControle := nil;
end;

procedure TfrmSelectControle.gridControleDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmSelectControle.gridControleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ModalResult := mrOk
  else if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

end.
