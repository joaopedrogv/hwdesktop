unit uMovimentoOperador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmMovimentoOperador = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    Panel4: TPanel;
    Panel3: TPanel;
    ListBox1: TListBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovimentoOperador: TfrmMovimentoOperador;

implementation

uses
  uCupom, uDadosIniFiscal, uPrincipalF;

{$R *.dfm}

procedure TfrmMovimentoOperador.BitBtn1Click(Sender: TObject);
var
	vLis: TStringList;
begin
	try
		vLis := TStringList.Create;
		
		DBGrid1.Visible := False;
		DataSource1.Tag := DataSource1.DataSet.RecNo;

		if obMovOP.relatorioDeMovimento(vLis, False, DataSource1.DataSet.FieldByName('n mov').AsInteger) then
		begin
			ListBox1.Items.Text := vLis.Text;
			vdadosinif.abreForm('Movimento do Operador', Panel3, Panel4);
		end;
	finally
		obMovOP.abreTodos;
		DataSource1.DataSet.RecNo := DataSource1.Tag;
		DBGrid1.Visible := True;
  end;
end;

procedure TfrmMovimentoOperador.BitBtn2Click(Sender: TObject);
begin
ModalResult := IDCANCEL;
end;

procedure TfrmMovimentoOperador.BitBtn4Click(Sender: TObject);
var
	vRel: TStringList;
	I: Integer;
begin
	vRel := TStringList.Create;
	vRel.Text := ListBox1.Items.Text;

  if not vDadosIniF.EnvCmdsCupom(2) then
    exit;
  try CImpressoraF.FechaRelatorioGerencial; finally end;
  CImpressoraF.abrerelatorioGer;
	for I:= 0 to vRel.Count - 1 do
		CImpressoraF.RelatorioGerencial(vRel[I]);
	CImpressoraF.FechaRelatorioGerencial;

end;

end.
