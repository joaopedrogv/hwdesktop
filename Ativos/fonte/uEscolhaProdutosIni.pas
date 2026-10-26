unit uEscolhaProdutosIni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TFrmEscolhaProdutoIni = class(TForm)
    GroupBox13: TGroupBox;
    DBGrid1: TDBGrid;
    Panel14: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEscolhaProdutoIni: TFrmEscolhaProdutoIni;

implementation

{$R *.dfm}

procedure TFrmEscolhaProdutoIni.BitBtn1Click(Sender: TObject);
begin
	ModalResult:= mrOk;
end;

procedure TFrmEscolhaProdutoIni.BitBtn2Click(Sender: TObject);
begin
	ModalResult:= mrCancel;
end;

procedure TFrmEscolhaProdutoIni.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_RETURN then
    BitBtn1Click(Sender)
  else if Key = VK_ESCAPE then
  	BitBtn2Click(Sender);
end;

end.
