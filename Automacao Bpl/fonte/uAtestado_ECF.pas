unit uAtestado_ECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, DBCtrls, StdCtrls, Grids, Mask, ComCtrls,
  uClassesInterventor_ECF, Buttons;

type
  TfrmAtestado_ECF = class(TfrmPadrao)
    PageControl2: TPageControl;
    tsIndenEquip: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    tsAcumulado: TTabSheet;
    GroupBox48: TGroupBox;
    tsIntervAutalAnterior: TTabSheet;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    tsMotivo: TTabSheet;
    DBRadioGroup4: TDBRadioGroup;
    GroupBox51: TGroupBox;
    ListBox1: TListBox;
    GroupBox52: TGroupBox;
    Panel44: TPanel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label12: TLabel;
    MaskEdit1: TMaskEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label20: TLabel;
    GroupBox47: TGroupBox;
    StringGrid3: TStringGrid;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBRadioGroup5: TDBRadioGroup;
    BitBtn49: TBitBtn;
    BitBtn68: TBitBtn;
    BitBtn1: TBitBtn;
    ListBox2: TListBox;
    edTot1: TMaskEdit;
    edTot2: TMaskEdit;
    edTot3: TMaskEdit;
    edTot4: TMaskEdit;
    edTot5: TMaskEdit;
    edTot6: TMaskEdit;
    edTot7: TMaskEdit;
    edTot8: TMaskEdit;
    edTot9: TMaskEdit;
    edTot10: TMaskEdit;
    DBRadioGroup6: TDBRadioGroup;
    procedure DBRadioGroup6Exit(Sender: TObject);
    procedure DBRadioGroup6Click(Sender: TObject);
    procedure ListBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1DblClick(Sender: TObject);
    procedure BitBtn68Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MaskEdit1Enter(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtestado_ECF: TfrmAtestado_ECF;
  obAtestado: TAtestado_ECF;

implementation

uses uDtmInterventor, DB;

{$R *.dfm}

procedure TfrmAtestado_ECF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  obAtestado.limpar;
end;

procedure TfrmAtestado_ECF.BitBtn49Click(Sender: TObject);
begin
  inherited;
  if obAtestado.Post then
  begin
    Application.MessageBox('Dados do atestado salvos com sucesso!', 'Atenção', MB_OK +
      MB_ICONINFORMATION);
    ModalResult := mrOk;
  end;
end;

procedure TfrmAtestado_ECF.BitBtn68Click(Sender: TObject);
begin
  inherited;
  obAtestado.Cancel;
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmAtestado_ECF.DBRadioGroup6Click(Sender: TObject);
begin
  inherited;
  GroupBox1.Enabled := DBRadioGroup6.ItemIndex = 0;
  GroupBox2.Enabled := DBRadioGroup6.ItemIndex = 0;
  GroupBox3.Enabled := DBRadioGroup6.ItemIndex = 0;
end;

procedure TfrmAtestado_ECF.DBRadioGroup6Exit(Sender: TObject);
begin
  inherited;
  GroupBox1.Enabled := DBRadioGroup6.ItemIndex = 0;
  GroupBox2.Enabled := DBRadioGroup6.ItemIndex = 0;
  GroupBox3.Enabled := DBRadioGroup6.ItemIndex = 0;
end;

procedure TfrmAtestado_ECF.FormCreate(Sender: TObject);
begin
  inherited;
  obAtestado := TAtestado_ECF.create;
end;

procedure TfrmAtestado_ECF.FormShow(Sender: TObject);
begin
  inherited;
  PageControl2.ActivePage := tsIndenEquip;
end;

procedure TfrmAtestado_ECF.ListBox1DblClick(Sender: TObject);
begin
  inherited;
  if obAtestado.dataSet.State in [dsInsert, dsEdit] then
    ListBox2.Items.Add(ListBox1.Items[ListBox1.itemindex]);
end;

procedure TfrmAtestado_ECF.ListBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    ListBox2.DeleteSelected;
end;

procedure TfrmAtestado_ECF.MaskEdit1Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
  	DBEdit6.SetFocus;
end;

end.

