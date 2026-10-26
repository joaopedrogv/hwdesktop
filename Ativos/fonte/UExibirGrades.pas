unit UExibirGrades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, udtmconsultas,consultasu;

type
  TfrmExibirGrades = class(TfrmPadrao)
    GroupBox7: TGroupBox;
    DBGrid8: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
      CodigoEmpresa,NomeEmpresa : string;

  end;

var
  frmExibirGrades: TfrmExibirGrades;

  implementation




{$R *.dfm}

procedure TfrmExibirGrades.FormShow(Sender: TObject);
begin
  inherited;
  frmExibirGrades.Caption := 'Grades da empresa ' + NomeEmpresa + ' - Código : ' + CodigoEmpresa;
  DBGrid8.DataSource := dtmConsultas.dsGradeProdOutEmp;
end;

end.
