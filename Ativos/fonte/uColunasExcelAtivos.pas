unit uColunasExcelAtivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uColunasExcel, Menus, DB, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmColunasExcelAtivos = class(TfrmColunasExcel)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmColunasExcelAtivos: TfrmColunasExcelAtivos;

implementation

{$R *.dfm}

procedure TfrmColunasExcelAtivos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmColunasExcelAtivos := nil;
end;

end.
