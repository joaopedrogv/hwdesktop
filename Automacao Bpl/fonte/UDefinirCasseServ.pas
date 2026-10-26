unit UDefinirCasseServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ComCtrls, UClasseSugestaoCompras,
  CheckLst;

type
  TFrmDefinirClasseServ = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    ProgressBar: TProgressBar;
    lb: TLabel;
    BitBtn59: TBitBtn;
    BitBtn60: TBitBtn;
    BitBtn1: TBitBtn;
    CheckListBox1: TCheckListBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn59Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn60Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDefinirClasseServ: TFrmDefinirClasseServ;
  Def: TDefinicaoClasses;

implementation

{$R *.dfm}

procedure TFrmDefinirClasseServ.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmDefinirClasseServ.BitBtn59Click(Sender: TObject);
begin
  inherited;
  BitBtn59.Visible := false;
  BitBtn1.Visible := false;
  BitBtn60.Visible := true;

  if Def.DefinirClassesServico then
  begin
    BitBtn59.Visible := false;
    BitBtn1.Visible := true;
    BitBtn60.Visible := false;
    CheckListBox1.Enabled := false;
  end
  else
  begin
    BitBtn59.Visible := true;
    BitBtn1.Visible := true;
    BitBtn60.Visible := false;
    CheckListBox1.Enabled := true;
  end;
end;

procedure TFrmDefinirClasseServ.BitBtn60Click(Sender: TObject);
begin
  inherited;
  Def.Parar := true;
end;

procedure TFrmDefinirClasseServ.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmDefinirClasseServ := nil;
end;

procedure TFrmDefinirClasseServ.FormCreate(Sender: TObject);
begin
  inherited;
  def := TDefinicaoClasses.create;
  FrmDefinirClasseServ.CheckListBox1.Checked[0] := true;
  FrmDefinirClasseServ.lb.Caption := '';
end;


procedure TFrmDefinirClasseServ.FormShow(Sender: TObject);
begin
  inherited;
  def.DefTipoVendas;

  CheckListBox1.Items.Text :='';
  CheckListBox1.Items.Text := Def.TipoVendas;
end;

end.

