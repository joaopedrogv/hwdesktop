unit uDemostrativoCredRetPISCOFINS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons;

type
  TfrmDemostrativoCredRetPISCOFINS = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    btOK: TBitBtn;
    DataSource2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemostrativoCredRetPISCOFINS: TfrmDemostrativoCredRetPISCOFINS;

implementation

{$R *.dfm}

end.
