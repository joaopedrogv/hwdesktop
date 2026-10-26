unit UVisualizavinculosDpto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, DB;

type
  TFrmVisualDpto = class(TfrmPadrao)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DtBuscas: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVisualDpto: TFrmVisualDpto;

implementation

uses UdtmGestorHw;

{$R *.dfm}

end.
