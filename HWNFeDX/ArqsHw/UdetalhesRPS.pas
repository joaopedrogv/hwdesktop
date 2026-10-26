unit UdetalhesRPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TFrmDetalhesRPS = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    DBGrid2: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDetalhesRPS: TFrmDetalhesRPS;

implementation

uses UDtmHwNFE;

{$R *.dfm}

end.
