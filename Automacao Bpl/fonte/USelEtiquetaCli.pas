unit USelEtiquetaCli;

interface

uses
  Windows, uPadrao, DB, StdCtrls, Buttons, DBCtrls, Controls, Classes;

type
  TFrmSelEtiquetaCli = class(TfrmPadrao)
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelEtiquetaCli: TFrmSelEtiquetaCli;

implementation

{$R *.dfm}

end.
