unit UFichaFinanceiraCli;

interface

uses
  Windows, UFormPadrao, Controls, StdCtrls, CheckLst, Mask, Menus, Buttons,
  Classes, ExtCtrls, Forms, UClassesClientes;

type
  TFrmFichaFinanceiraCli = class(TfrmInc)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    CheckBox2: TCheckBox;
    CheckListBox1: TCheckListBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFichaFinanceiraCli: TFrmFichaFinanceiraCli;
  Ficha: TCadClientes;

implementation

{$R *.dfm}

procedure TFrmFichaFinanceiraCli.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if CheckBox2.Checked then
  begin
    if Ficha.ControlesSelecionados(CheckListBox1) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Ficha.RelFichaFinanceiraCli(MaskEdit1.Text, MaskEdit2.Text);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
  else
  begin
    try
      Screen.Cursor := crHourGlass;
      Ficha.RelFichaCliente(MaskEdit1.Text, MaskEdit2.Text);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmFichaFinanceiraCli.BitBtn6Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmFichaFinanceiraCli.btSelectAllClick(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBox1.Items.Count - 1 do
  	CheckListBox1.Checked[I] := true;
end;

procedure TFrmFichaFinanceiraCli.btUnSelectAllClick(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to CheckListBox1.Items.Count - 1 do
  	CheckListBox1.Checked[I] := false;
end;

procedure TFrmFichaFinanceiraCli.CheckBox2Click(Sender: TObject);
begin
  inherited;
  CheckListBox1.Enabled := CheckBox2.Checked;
  btSelectAll.Enabled := CheckBox2.Checked;
  btUnSelectAll.Enabled := CheckBox2.Checked;
end;

procedure TFrmFichaFinanceiraCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  FrmFichaFinanceiraCli := nil;
end;

procedure TFrmFichaFinanceiraCli.FormCreate(Sender: TObject);
begin
  inherited;
  Ficha := TCadClientes.create;
  Ficha.ListaControlesFicha(CheckListBox1);
end;

procedure TFrmFichaFinanceiraCli.FormShow(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
  	MaskEdit1.SetFocus;
end;

end.

