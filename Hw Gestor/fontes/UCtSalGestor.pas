unit UCtSalGestor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DB, StdCtrls, Buttons, Grids, DBGrids;

type
  TFrmContasSalario = class(TfrmPadrao)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DtMapaFin: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContasSalario: TFrmContasSalario;

implementation

uses UdtmGestorHw;

{$R *.dfm}

end.
