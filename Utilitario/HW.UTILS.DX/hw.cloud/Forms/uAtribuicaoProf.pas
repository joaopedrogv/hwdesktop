unit uAtribuicaoProf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmAtribuirProf = class(TForm)
    Panel41: TPanel;
    bt_sair: TBitBtn;
    bt_atribuir_prof: TBitBtn;
    DBGrid1: TDBGrid;
    procedure bt_sairClick(Sender: TObject);
    procedure bt_atribuir_profClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtribuirProf: TfrmAtribuirProf;

implementation

{$R *.dfm}

procedure TfrmAtribuirProf.bt_atribuir_profClick(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
    Exit;

  Self.ModalResult := mrOk;
end;

procedure TfrmAtribuirProf.bt_sairClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

end.
