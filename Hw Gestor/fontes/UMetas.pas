unit UMetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, ExtCtrls, StdCtrls, Buttons, DBCtrls;

type
  TFrmMetas = class(TfrmPadrao)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    TabSheet5: TTabSheet;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMetas: TFrmMetas;

implementation

{$R *.dfm}

procedure TFrmMetas.BitBtn2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmMetas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FrmMetas:=nil;
  action:=cafree;
end;

procedure TFrmMetas.FormShow(Sender: TObject);
begin
  inherited;
TabSheet1.TabVisible:=false;
pagecontrol1.ActivePage:=TabSheet1;
end;

end.
