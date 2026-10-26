unit UGridPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids,DB;

type
  TfrmGridPesquisa = class(TfrmPadrao)
    GroupBox37: TGroupBox;
    Label171: TLabel;
    Label172: TLabel;
    BitBtn8: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox36: TGroupBox;
    DBGrid12: TDBGrid;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGridPesquisa: TfrmGridPesquisa;
  dsPesquisa, dsPesquisa2 : TDataSource;

implementation

{$R *.dfm}

procedure TfrmGridPesquisa.BitBtn8Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmGridPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmGridPesquisa := nil
end;

procedure TfrmGridPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  dsPesquisa := TDataSource.Create(dsPesquisa);
  DBGrid12.DataSource := dsPesquisa;

  dsPesquisa2 := TDataSource.Create(dsPesquisa);
  DBGrid1.DataSource := dsPesquisa2;
end;

end.
