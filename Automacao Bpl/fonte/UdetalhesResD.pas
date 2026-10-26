unit UdetalhesResD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TFrmDetalhesResD = class(TfrmPadrao)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDetalhesResD: TFrmDetalhesResD;

implementation

uses UdtmTerminalF;

{$R *.dfm}

procedure TFrmDetalhesResD.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmDetalhesResD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmDetalhesResD := nil;
end;

end.
