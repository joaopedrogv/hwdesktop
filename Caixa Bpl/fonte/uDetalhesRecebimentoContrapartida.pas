unit uDetalhesRecebimentoContrapartida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, ComCtrls, 
  uClassesLancamentos;

type
  TfrmDetalhesRecebimentoContrapartida = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnLanc: TPanel;
    Panel3: TPanel;
    gridLancamento: TDBGrid;
    Panel5: TPanel;
    Panel8: TPanel;
    BitBtn1: TBitBtn;
    BitBtn13: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    pnCh: TPanel;
    Panel7: TPanel;
    gridCheques: TDBGrid;
    Panel6: TPanel;
    pnCred: TPanel;
    gridCreditos: TDBGrid;
    Panel9: TPanel;
    pnCTP: TPanel;
    gridContasAPagar: TDBGrid;
    Panel10: TPanel;
    pnContrapartida: TPanel;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDetalhesRecebimentoContrapartida: TfrmDetalhesRecebimentoContrapartida;
  Contrapartida: TContrapartida;

implementation

uses uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TfrmDetalhesRecebimentoContrapartida.BitBtn13Click(Sender: TObject);
begin
  try
     if Application.MessageBox(pchar('Deseja mesmo efetuar o estorno da contrapartida?'),
     	'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

     Screen.Cursor := crHourGlass;
     // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(Contrapartida.Buscas) then
    begin
       Close;
       Exit;
    end;
     if not Contrapartida._estornarRecebimento(frmDetalhesRecebimentoContrapartida.Tag) then
       exit;
     Close;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmDetalhesRecebimentoContrapartida.BitBtn2Click(Sender: TObject);
begin
  if ((gridLancamento.DataSource.DataSet.IsEmpty) and (gridCheques.DataSource.DataSet.IsEmpty)
  	and (gridCreditos.DataSource.DataSet.IsEmpty) and (gridContasAPagar.DataSource.DataSet.IsEmpty)) then
     exit;
     
  Contrapartida.imprimirLancamento(frmDetalhesRecebimentoContrapartida.Tag);
end;

procedure TfrmDetalhesRecebimentoContrapartida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (Contrapartida <> nil) then
    Contrapartida.Cancel;
  Contrapartida.free;

  Action := caFree;
  if (frmDetalhesRecebimentoContrapartida <> nil) then
    frmDetalhesRecebimentoContrapartida := nil;
end;

procedure TfrmDetalhesRecebimentoContrapartida.FormCreate(Sender: TObject);
begin
  Contrapartida := TContrapartida.create;
end;

end.
