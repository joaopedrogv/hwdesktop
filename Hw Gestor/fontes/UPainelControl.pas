unit UPainelControl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, DBCtrls, ExtCtrls;

type
  TFrmPainelControl = class(TfrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    TreeView1: TTreeView;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPainelControl: TFrmPainelControl;

implementation

{$R *.dfm}

procedure TFrmPainelControl.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmPainelControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action:=cafree;
  FrmPainelControl:=nil;
end;

end.
