unit UDetalheRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Grids, DBGrids, UDtmClientes, uDtmAtivo,
  Buttons, UClassesClientes;

type
  TFrmDetalheRec = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Cli: TCadClientes;
    { Public declarations }
  end;

var
  FrmDetalheRec: TFrmDetalheRec;

implementation

{$R *.dfm}

procedure TFrmDetalheRec.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Cli.ImprimirReciboCredito;
end;

procedure TFrmDetalheRec.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Cli.DetalhesRecebimentoModalidade;
end;

end.

