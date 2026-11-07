unit DataGridFrame;

interface

uses
  Data.DB, Vcl.DBGrids, Vcl.Forms;

type
  TfrmDataGridFrame = class(TFrame)
    dbgDados: TDBGrid;
  private
    function GetDataSource: TDataSource;
    procedure SetDataSource(const Value: TDataSource);
  public
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

implementation

{$R *.dfm}

function TfrmDataGridFrame.GetDataSource: TDataSource;
begin
  Result := dbgDados.DataSource;
end;

procedure TfrmDataGridFrame.SetDataSource(const Value: TDataSource);
begin
  dbgDados.DataSource := Value;
end;

end.
