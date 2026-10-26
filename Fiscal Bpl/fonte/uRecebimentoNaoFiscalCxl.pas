unit uRecebimentoNaoFiscalCxl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmRecebNaoFiscalCxl = class(TfrmPadrao)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox4: TGroupBox;
    DBGrid3: TDBGrid;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecebNaoFiscalCxl: TfrmRecebNaoFiscalCxl;

implementation

uses uDtmFiscal, uDtmConfigF;

{$R *.dfm}

procedure TfrmRecebNaoFiscalCxl.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

procedure TfrmRecebNaoFiscalCxl.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmRecebNaoFiscalCxl.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) or (key = VK_TAB) then
    DBGrid3.setfocus
  else if key = VK_ESCAPE then
    BitBtn2Click(Sender);
end;

procedure TfrmRecebNaoFiscalCxl.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) or (key = VK_TAB) then
    Perform(WM_NEXTDLGCTL,0,0)
  else if key = VK_ESCAPE then
    BitBtn2Click(Sender);
end;

end.
