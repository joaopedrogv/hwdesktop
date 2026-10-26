unit uBoletosProtesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, uClassesBoleto, uDtmBoleto,
  Menus;

type
  TfrmBoletosProtesto = class(TfrmPadrao)
    pnFundo: TPanel;
    gbBoletos: TGroupBox;
    pnBotoes: TPanel;
    btnOk: TBitBtn;
    DBGridBoletosProtesto: TDBGrid;
    btnDevolver: TBitBtn;
    cbNaoExibirNovamente: TCheckBox;
    btnExportarExcel: TBitBtn;
    PopupMenu1: TPopupMenu;
    Copiarparareadetransferncia1: TMenuItem;
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDevolverClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBoletosProtesto: TfrmBoletosProtesto;

implementation

uses
  uDtmAtivo, Clipbrd;

{$R *.dfm}

procedure TfrmBoletosProtesto.btnDevolverClick(Sender: TObject);
begin
  vCadBoletosProtesto.devolverBoleto;
end;

procedure TfrmBoletosProtesto.btnExportarExcelClick(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridBoletosProtesto, 'Lista de Boletos Protesto');
end;

procedure TfrmBoletosProtesto.btnOkClick(Sender: TObject);
begin
	if cbNaoExibirNovamente.Checked then
		_GravaConfiguracoesString('abreBoletosProtesto', DateToStr(vDadosIni.getDataBanco(vCadBoletosProtesto.buscas)));
end;

procedure TfrmBoletosProtesto.Copiarparareadetransferncia1Click(
  Sender: TObject);
begin
  Clipboard.AsText := DBGridBoletosProtesto.DataSource.DataSet.FieldByName(DBGridBoletosProtesto.Columns[DBGridBoletosProtesto.SelectedIndex].FieldName).AsString;
end;

procedure TfrmBoletosProtesto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 	vCadBoletosProtesto.Free;
  vCadBoletosProtesto := nil;

  Action := caFree;
  frmBoletosProtesto := nil;
end;

procedure TfrmBoletosProtesto.FormCreate(Sender: TObject);
begin
	if vCadBoletosProtesto = nil then
  	vCadBoletosProtesto := TBoletosProtesto.create;
	if (StrToDateDef(_LerConfiguracoesRegistroString('abreBoletosProtesto'), 40814.221528) = vDadosIni.getDataBanco(vCadBoletosProtesto.buscas)) then
  	vDadosIni.vPesquisa := 'BOLETOSPROTESTO|NAOABRIR';
  if not vCadBoletosProtesto.existeBoletosProtesto then
  	vDadosIni.vPesquisa := 'BOLETOSPROTESTO|NAOABRIR';
end;

procedure TfrmBoletosProtesto.FormShow(Sender: TObject);
begin
	vCadBoletosProtesto.abreBoletosProtesto;
end;

initialization
  RegisterClass(TfrmBoletosProtesto);
finalization
  UnRegisterClass(TfrmBoletosProtesto);

end.
