unit uDetalhesRecebimentoModalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TfrmDetalhesRecebimentoModalidade = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    BitBtn1: TBitBtn;
    pnLanc: TPanel;
    pnCh: TPanel;
    pnCred: TPanel;
    gridLancamento: TDBGrid;
    gridCheques: TDBGrid;
    gridCreditos: TDBGrid;
    procedure gridLancamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetalhesRecebimentoModalidade: TfrmDetalhesRecebimentoModalidade;

implementation

{$R *.dfm}

procedure TfrmDetalhesRecebimentoModalidade.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

procedure TfrmDetalhesRecebimentoModalidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  gridLancamento.DataSource := nil;
  gridCheques.DataSource := nil;
  gridCreditos.DataSource := nil;

  Action := caFree;
  frmDetalhesRecebimentoModalidade := nil;
  
end;

procedure TfrmDetalhesRecebimentoModalidade.gridLancamentoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    ModalResult := IDCANCEL
  else if (Key = VK_TAB) or (Key = VK_RETURN) then
    Perform(WM_NEXTDLGCTL, 0, 0);       
end;

end.
