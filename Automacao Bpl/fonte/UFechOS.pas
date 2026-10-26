unit UFechOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TfrmFechOs = class(TfrmPadrao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit3: TDBEdit;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label76: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechOs: TfrmFechOs;

implementation

uses uDtmPedVenda, DB;

{$R *.dfm}

procedure TfrmFechOs.BitBtn3Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmFechOs.BitBtn4Click(Sender: TObject);
begin
  inherited;
	ModalResult := mrCancel;
end;

procedure TfrmFechOs.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if not (DBEdit2.DataSource.DataSet.State in [dsinsert, dsedit]) then
  	Exit;

  if trim(DBEdit2.Field.AsString) = '' then
    DBEdit2.Field.AsString := DBLookupComboBox1.Text;
end;

procedure TfrmFechOs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  if (frmFechOs <> nil) then
  	frmFechOs := nil;
end;

procedure TfrmFechOs.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	Self.fechar := True;
  inherited;
end;

procedure TfrmFechOs.FormShow(Sender: TObject);
begin
  inherited;
  if not (DBEdit2.DataSource.DataSet.State in [dsinsert, dsedit]) then
  	Exit;
    
  if trim(DBEdit2.Field.AsString) = '' then
    DBEdit2.Field.AsString := DBLookupComboBox1.Text;
end;

end.
