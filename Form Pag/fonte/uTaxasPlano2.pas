unit uTaxasPlano2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, uClasseFP;

type
  TfrmTaxasPlano2 = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vTabelaJuros: TJurosPlano_2;
  public
    { Public declarations }
  end;

var
  frmTaxasPlano2: TfrmTaxasPlano2;

implementation

uses
  DB, uDtmAtivo;

{$R *.DFM}

procedure TfrmTaxasPlano2.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmTaxasPlano2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  vTabelaJuros.CommitaTransacao;
  Action := caFree;
  frmTaxasPlano2 := nil;
end;

procedure TfrmTaxasPlano2.DBGrid1Exit(Sender: TObject);
begin
  vTabelaJuros.Apply;
  vTabelaJuros.CommitaTransacao;
end;

procedure TfrmTaxasPlano2.FormShow(Sender: TObject);
begin
  if vTabelaJuros = nil then
    vTabelaJuros := TJurosPlano_2.create;
  vTabelaJuros.abreTodas;
//  vTabelaJuros.selecionaJuros()

//  DTM05.qrJurosPl2.Close;
//  DTM05.qrJurosPl2.Sql.Text:='select * from tabjuros_plano'+
//  ' where cod_empresa = '+FRMprincipal.CodEmpresa+' order by NUMERO_PRESTACOES';
//  DTM05.qrJurosPl2.Open;
end;

end.

