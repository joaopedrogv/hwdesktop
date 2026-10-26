unit uEscolhaProdutoPedvenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus, DBCtrls, 
  DBClient, IBDatabase, ComCtrls;

type
	TEventConf = procedure (ADBGrid: TDBGrid) of object;
  TfrmEscolhaProdutoPedvenda = class(TfrmPadrao)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    ConfigurarColunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    PopupMenu2: TPopupMenu;
    ConfigurarColunas2: TMenuItem;
    ResetarConfiguraesdecolunas2: TMenuItem;
    SalvardadosnoExcel2: TMenuItem;
    ReajustarLarguradascolunas2: TMenuItem;
    Copiarparareadetransferncia2: TMenuItem;
    Somarvaloresdacoluna2: TMenuItem;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBoxProd: TGroupBox;
    Panel2: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    ScrollBox1: TScrollBox;
    TabSheet2: TTabSheet;
    GroupBoxServ: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    procedure DBGrid2ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure Somarvaloresdacoluna2Click(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure Copiarparareadetransferncia2Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas2Click(Sender: TObject);
    procedure SalvardadosnoExcel2Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas2Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure ConfigurarColunas2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2Exit(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ConfigurarColunas1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    FAbrirConfColunas: TEventConf;
    FSalvarConfColunas: TEventConf;
    procedure SetAbrirConfColunas(const Value: TEventConf);
    procedure SetSalvarConfColunas(const Value: TEventConf);
  public
    { Public declarations }
    vProdServ: string;
    property AbrirConfColunas: TEventConf read FAbrirConfColunas write SetAbrirConfColunas;
    property SalvarConfColunas: TEventConf read FSalvarConfColunas write SetSalvarConfColunas;
  end;

var
  frmEscolhaProdutoPedvenda: TfrmEscolhaProdutoPedvenda;
  cdsColunas1, cdsColunas2: TClientDataSet;
  cdsGrid1, cdsGrid2: TClientDataSet;
  GridCfg1, GridCfg2: TDBGrid;
  ListGridsAndDataSets1, ListGridsAndDataSets2: TStrings;
  ListPositions1, ListPositions2: TStrings;
  nomeDTSEt1, nomeDTSEt2: string;
  vAlterarNomeDtSet1, vAlterarNomeDtSet2: string;
  usuario: string;
  vCamposPadraoRegistro1, vCamposPadraoRegistro2: Boolean;
  PrimeiraPesquisa1, PrimeiraPesquisa2: Boolean;
  trans: TIBTransaction;
  fReset, vCtrlClick, vShiftClick: Boolean;

implementation

uses uDtmPedVenda, uDtmAtivo, Clipbrd;

{$R *.dfm}

procedure TfrmEscolhaProdutoPedvenda.BitBtn2Click(Sender: TObject);
begin
	ModalResult := mrOk;
end;

procedure TfrmEscolhaProdutoPedvenda.BitBtn4Click(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TfrmEscolhaProdutoPedvenda.ConfigurarColunas1Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas1, DBGrid1, GridCfg1, cdsGrid1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);
end;

procedure TfrmEscolhaProdutoPedvenda.ConfigurarColunas2Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas2, DBGrid2, GridCfg2, cdsGrid2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TfrmEscolhaProdutoPedvenda.Copiarparareadetransferncia1Click(
  Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TfrmEscolhaProdutoPedvenda.Copiarparareadetransferncia2Click(
  Sender: TObject);
begin
  Clipboard.AsText := DBGrid2.DataSource.DataSet.FieldByName(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName).AsString;
end;

procedure TfrmEscolhaProdutoPedvenda.DBGrid1ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg1, cdsGrid1,
    cdsColunas1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);
end;

procedure TfrmEscolhaProdutoPedvenda.DBGrid1Exit(Sender: TObject);
begin
	if Assigned(FSalvarConfColunas) then
    FSalvarConfColunas(DBGrid1);
end;

procedure TfrmEscolhaProdutoPedvenda.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_RETURN then
    ModalResult := mrOk;
end;

procedure TfrmEscolhaProdutoPedvenda.DBGrid1TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TfrmEscolhaProdutoPedvenda.DBGrid2ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
    cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TfrmEscolhaProdutoPedvenda.DBGrid2Exit(Sender: TObject);
begin
  if Assigned(FSalvarConfColunas) then
    FSalvarConfColunas(DBGrid2);
end;

procedure TfrmEscolhaProdutoPedvenda.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_RETURN then
    ModalResult := mrOk;
end;

procedure TfrmEscolhaProdutoPedvenda.DBGrid2TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmEscolhaProdutoPedvenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	if not Assigned(DBGrid1.DataSource) then
    Exit;
  if not Assigned(DBGrid1.DataSource.DataSet) then
    Exit;

  if not Assigned(DBGrid2.DataSource) then
    Exit;
  if not Assigned(DBGrid2.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa1 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg1, cdsGrid1,
      cdsColunas1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);

  if not PrimeiraPesquisa2 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
      cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid1, GridCfg1, true, ListPositions1, cdsGrid1);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid2, GridCfg2, true, ListPositions2, cdsGrid2);
end;

procedure TfrmEscolhaProdutoPedvenda.FormShow(Sender: TObject);
begin
	TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;

	vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
    vAlterarNomeDtSet1, GridCfg1, DBGrid1, cdsGrid1, cdsColunas1, trans, ListGridsAndDataSets1,
    ListPositions1, nomeDTSEt1, PrimeiraPesquisa1, vCamposPadraoRegistro1, usuario);

  vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
    vAlterarNomeDtSet2, GridCfg2, DBGrid2, cdsGrid2, cdsColunas2, trans, ListGridsAndDataSets2,
    ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario);

	if vProdServ = 'P' then
  begin
  	PageControl1.ActivePage := TabSheet1;
  	TabSheet1.Show;
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	    DBGrid1.SetFocus;
    Self.Caption:='Escolha o Produto';
    if Self.Tag > 0 then
	    Self.Caption := Self.Caption + ' - Item ' + vDadosIni.StrZero(Tag,3);
  end
  else if vProdServ = 'S' then
  begin
  	PageControl1.ActivePage := TabSheet2;
  	TabSheet2.Show;
  	if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
	    DBGrid2.SetFocus;
    Self.Caption:='Escolha o Serviço';
  end;

  if PrimeiraPesquisa1 then
  begin
    PrimeiraPesquisa1 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid1, GridCfg1, cdsGrid1, cdsColunas1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);
  end;

  if PrimeiraPesquisa2 then
  begin
    PrimeiraPesquisa2 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid2, GridCfg2, cdsGrid2, cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
  end;
end;

procedure TfrmEscolhaProdutoPedvenda.ReajustarLarguradascolunas1Click(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid1);
end;

procedure TfrmEscolhaProdutoPedvenda.ReajustarLarguradascolunas2Click(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid2);
end;

procedure TfrmEscolhaProdutoPedvenda.ResetarConfiguraesdecolunas1Click(
  Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid1, GridCfg1, cdsColunas1, cdsGrid1, usuario,
    vDadosIni.transacaoCol, fReset, ListGridsAndDataSets1, false, ListPositions1);
end;

procedure TfrmEscolhaProdutoPedvenda.ResetarConfiguraesdecolunas2Click(
  Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid2, GridCfg2, cdsColunas2, cdsGrid2, usuario,
    vDadosIni.transacaoCol, fReset, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TfrmEscolhaProdutoPedvenda.SalvardadosnoExcel1Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid1, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
    lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TfrmEscolhaProdutoPedvenda.SalvardadosnoExcel2Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid2, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
    lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TfrmEscolhaProdutoPedvenda.SetAbrirConfColunas(
  const Value: TEventConf);
begin
	FAbrirConfColunas := Value;
end;

procedure TfrmEscolhaProdutoPedvenda.SetSalvarConfColunas(
  const Value: TEventConf);
begin
  FSalvarConfColunas := Value;
end;

procedure TfrmEscolhaProdutoPedvenda.Somarvaloresdacoluna1Click(
  Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid1, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TfrmEscolhaProdutoPedvenda.Somarvaloresdacoluna2Click(
  Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid2, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

end.
