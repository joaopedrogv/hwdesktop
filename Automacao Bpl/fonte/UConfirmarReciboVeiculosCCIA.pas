unit UConfirmarReciboVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids;

type
  TfrmConfirmarReciboVeiculosCCIA = class(TfrmPadrao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBEdit3: TDBEdit;
    Label14: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label29: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBGrid3: TDBGrid;
    Panel6: TPanel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn6: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfirmarReciboVeiculosCCIA: TfrmConfirmarReciboVeiculosCCIA;

implementation

{$R *.dfm}

procedure TfrmConfirmarReciboVeiculosCCIA.BitBtn6Click(Sender: TObject);
begin
  inherited;
Close;
end;

end.
