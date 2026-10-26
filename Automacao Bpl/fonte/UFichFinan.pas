unit UFichFinan;

interface

uses
  Windows, uPadrao, StdCtrls, Buttons, Controls, Grids, DBGrids, Classes;

type
  TFrmFichaFin = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFichaFin: TFrmFichaFin;

implementation

{$R *.dfm}

procedure TFrmFichaFin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) or (Key = VK_RETURN) then
  begin
    if ActiveControl = DBGrid2 then
      DBGrid1.SetFocus
    else if ActiveControl = DBGrid1 then
      DBGrid3.SetFocus
    else if ActiveControl = DBGrid3 then
      BitBtn1.SetFocus
  end;
end;

procedure TFrmFichaFin.FormShow(Sender: TObject);
begin
  inherited;
  BitBtn1.SetFocus;
end;

end.

