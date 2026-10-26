unit UDetalheRecMod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TFrmDetalheRecMod = class(TfrmPadrao)
    Panel1: TPanel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    DBGrid3: TDBGrid;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    vCred,vCheq,vLanc:Currency;
    { Public declarations }
  end;

var
  FrmDetalheRecMod: TFrmDetalheRecMod;

implementation
uses UDtmClientes, UClassesClientes;
{$R *.dfm}

procedure TFrmDetalheRecMod.FormShow(Sender: TObject);
begin
  inherited;
  Label1.caption := 'Total dos Lançamentos: R$' + Format('%n', [vCred]);
  Label2.caption := 'Total dos Cheques: R$' + Format('%n', [vCheq]);
  Label3.caption := 'Total dos Créditos: R$' + Format('%n', [vLanc]);
  DBGrid1.DataSource := DtmClientes.dsLancQuit;
  DBGrid2.DataSource := DtmClientes.dsCheqQuit;
  DBGrid3.DataSource := DtmClientes.dsCredQuit;
end;

end.

