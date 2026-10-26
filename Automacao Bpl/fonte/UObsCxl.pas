unit UObsCxl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, uEditMoeda, Buttons, Mask, DBCtrls, ExtCtrls, DB;

type
  TFrmobsCxl = class(TfrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    EditMoeda1: TEditMoeda;
    DataSource1: TDataSource;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vlent: double;
    vcodigoctrl: Integer;
  end;

var
  FrmobsCxl: TFrmobsCxl;

implementation

uses uDtmPedVenda;

{$R *.dfm}

procedure TFrmobsCxl.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if EditMoeda1.Valor <> 0 then
   vlent:=EditMoeda1.valor
  else
   vlent:=0;
  if DBLookupComboBox1.Text <> '' then
   vcodigoctrl:= DBLookupComboBox1.KeyValue
  else
   vcodigoctrl:=0;
end;

procedure TFrmobsCxl.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	Self.fechar := True; 
  inherited;
end;

procedure TFrmobsCxl.FormShow(Sender: TObject);
begin
  InibirEstatisticas := True;
  inherited;
end;

end.
