unit uCancelarNaoFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus;

type
  TfrmCancelamentoNaoFiscal = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuFiscal1: TMenuItem;
    procedure MenuFiscal1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancelamentoNaoFiscal: TfrmCancelamentoNaoFiscal;

implementation

uses uDtmFiscal, uPrincipalF,uDadosIniFiscal;

{$R *.dfm}

procedure TfrmCancelamentoNaoFiscal.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

procedure TfrmCancelamentoNaoFiscal.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmCancelamentoNaoFiscal.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn1.Click;  
end;

procedure TfrmCancelamentoNaoFiscal.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.MenuFiscal;
end;

end.
