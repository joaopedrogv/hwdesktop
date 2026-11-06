unit QueryStandardForm;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Vcl.Controls, Vcl.ExtCtrls,
  Vcl.Forms, Vcl.StdCtrls, NextBaseForm, DataGridFrame;

type
  TfrmQueryStandard = class(TfrmNextBase)
    pnFiltros: TPanel;
    btnPesquisar: TButton;
    fraGrid: TfrmDataGridFrame;
    dsConsulta: TDataSource;
  protected
    procedure DoInitializeView; override;
  end;

implementation

{$R *.dfm}

procedure TfrmQueryStandard.DoInitializeView;
begin
  Caption := Format('Consulta - Next %d', [InstanceNumber]);
  fraGrid.DataSource := dsConsulta;
end;

end.
