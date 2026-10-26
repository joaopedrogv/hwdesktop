unit uServSugeridos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, Db, IBQuery, UClassesCadastrosBasicos, uClassesPedvenda;

type
  TfrmServSugeridos = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label211: TLabel;
    Label212: TLabel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure _marcaDesmarcaLinha(pDataset: TDataSet);
    procedure _marcaLinha(pDataset: TDataSet);
    procedure _DesmarcaLinha(pDataset: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServSugeridos: TfrmServSugeridos;
  Buscas: TIBQuery;
  vVenda: boolean;

implementation

uses uDtmPedVenda, UDtmCadastrosBasicos, uDtmAtivo;

{$R *.dfm}

procedure TfrmServSugeridos.BitBtn4Click(Sender: TObject);
begin
	vDadosIni.vPesquisa := 'SERVSUGERIDOSOK|';
  ModalResult := mrOk;
end;

procedure TfrmServSugeridos.BitBtn5Click(Sender: TObject);
begin
  vDadosIni.vPesquisa := 'SERVSUGERIDOSCANCEL|';
  ModalResult := mrCancel;
end;


procedure TfrmServSugeridos.ComboBox1Exit(Sender: TObject);
begin
//   if vVenda then
//    vDadosIni.recalcularData(
//    	buscas,
//    	DtmPedVenda.SpIncCodigo,
//      'FIN',
//    	vDadosIni.vDtSetTmp.FieldByName('COD_VENDEDOR').AsInteger, vDadosIni.vDtSetTmp.FieldByName('COD_CLIENTE').AsInteger,
//	    vDadosIni.vDtSetTmp.FieldByName('COD_EQUIP').AsInteger, vDadosIni.vDtSetTmp.FieldByName('COD_VEIC').AsInteger,
//      vDadosIni.vDtSetTmp.FieldByName('CHASSI').AsString, vDadosIni.vDtSetTmp.FieldByName('PLACA').AsString,
//      0,  vDadosIni.vDtSetTmp.FieldByName('KM').AsInteger,
//      (Pos('PRIMEIRA', ComboBox1.Text) > 0), (Pos('SEGUNDA', ComboBox1.Text) > 0))
//   else
//   	 vDadosIni.recalcularData(
//     	buscas,
//      DtmCadBasicos.SpIncCodigo,
//      'FIN',
//    	vDadosIni.vDtSetTmp.FieldByName('COD_VENDEDOR').AsInteger, vDadosIni.vDtSetTmp.FieldByName('COD_CLIENTE').AsInteger,
//	    vDadosIni.vDtSetTmp.FieldByName('COD_EQUIP').AsInteger, vDadosIni.vDtSetTmp.FieldByName('COD_VEIC').AsInteger,
//      vDadosIni.vDtSetTmp.FieldByName('CHASSI').AsString, vDadosIni.vDtSetTmp.FieldByName('PLACA').AsString,
//      0,  vDadosIni.vDtSetTmp.FieldByName('KM').AsInteger,
//      (Pos('PRIMEIRA', ComboBox1.Text) > 0), (Pos('SEGUNDA', ComboBox1.Text) > 0));

	 vDadosIni.recalcularData(
    	buscas,
   	  vDadosIni.vSpIncCodigoTmp,
      'FIN',
    	vDadosIni.vDtSetTmp.FieldByName('COD_VENDEDOR').AsInteger, vDadosIni.vDtSetTmp.FieldByName('COD_CLIENTE').AsInteger,
	    vDadosIni.vDtSetTmp.FieldByName('COD_EQUIP').AsInteger, vDadosIni.vDtSetTmp.FieldByName('COD_VEIC').AsInteger,
      vDadosIni.vDtSetTmp.FieldByName('CHASSI').AsString, vDadosIni.vDtSetTmp.FieldByName('PLACA').AsString,
      0,  vDadosIni.vDtSetTmp.FieldByName('KM').AsInteger,
      (Pos('PRIMEIRA', ComboBox1.Text) > 0), (Pos('SEGUNDA', ComboBox1.Text) > 0));
end;

procedure TfrmServSugeridos.DBGrid1DblClick(Sender: TObject);
begin
 if not	vDadosIni.vDtSetTmp.IsEmpty then
   	_marcaDesmarcaLinha(vDadosIni.vDtSetTmp);
end;

procedure TfrmServSugeridos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_SPACE then
		_marcaDesmarcaLinha(vDadosIni.vDtSetTmp)
  else if Key = VK_F2 then
  	_marcaLinha(vDadosIni.vDtSetTmp)
  else if Key = VK_F3 then
  	_DesmarcaLinha(vDadosIni.vDtSetTmp)
  else if Key = VK_RETURN then
  	BitBtn4Click(Sender)
  else if Key = VK_ESCAPE then
  	BitBtn5Click(Sender);  
end;

procedure TfrmServSugeridos.FormCreate(Sender: TObject);
begin
	vVenda := Pos('VENDA', vDadosIni.vPesquisa) > 0;
  if DtmPedVenda = nil then
    DtmPedVenda := TDtmPedVenda.Create(DtmPedVenda);
  Buscas := TIBQuery(DtmPedVenda.qrBuscas);
end;

procedure TfrmServSugeridos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_ESCAPE then
  	BitBtn5Click(Sender);
end;

procedure TfrmServSugeridos.FormShow(Sender: TObject);
begin
  Label2.Visible := vDadosIni.vEmp.vUsarAparelho <> 'S';
  ComboBox1.Visible := vDadosIni.vEmp.vUsarAparelho <> 'S';
  if pos('PRIMEIRA', trim(vDadosIni.vTipoRev)) > 0 then
    ComboBox1.ItemIndex := 0
  else if pos('SEGUNDA', trim(vDadosIni.vTipoRev)) > 0 then
    ComboBox1.ItemIndex := 1
  else if pos('INTERVALO', trim(vDadosIni.vTipoRev)) > 0 then
    ComboBox1.ItemIndex := 2;
  DBGrid1.DataSource := vDadosIni.vDtSourceTmp;
end;

procedure TfrmServSugeridos._DesmarcaLinha(pDataset: TDataSet);
begin
 if pDataset.IsEmpty then
  	exit;

  pDataset.Edit;
  pDataset.FieldByName('SEL').AsString := '';
  pDataset.Post;
end;

procedure TfrmServSugeridos._marcaDesmarcaLinha(pDataset: TDataSet);
begin
  if pDataset.IsEmpty then
  	exit;

  pDataset.Edit;
  if pDataset.FieldByName('SEL').AsString = 'S' then
    pDataset.FieldByName('SEL').AsString := ''
  else
    pDataset.FieldByName('SEL').AsString := 'S';
  pDataset.Post;
end;

procedure TfrmServSugeridos._marcaLinha(pDataset: TDataSet);
begin
  if pDataset.IsEmpty then
  	exit;

  pDataset.Edit;
  pDataset.FieldByName('SEL').AsString := 'S';
  pDataset.Post;
end;

initialization
  RegisterClass(TfrmServSugeridos);
finalization
  UnRegisterClass(TfrmServSugeridos);


end.
