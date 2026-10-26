unit uEscolhaHistoricoPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, ExtCtrls;

type
  TfrmEscolhaHistoricoPadrao = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolhaHistoricoPadrao: TfrmEscolhaHistoricoPadrao;

implementation

{$R *.dfm}

procedure TfrmEscolhaHistoricoPadrao.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

procedure TfrmEscolhaHistoricoPadrao.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    ModalResult := IDOK
  else if Key = VK_ESCAPE then
    ModalResult := IDCANCEL;
end;

procedure TfrmEscolhaHistoricoPadrao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmEscolhaHistoricoPadrao := nil;
end;

end.
