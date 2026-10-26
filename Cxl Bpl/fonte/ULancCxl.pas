unit ULancCxl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, Grids, DBGrids, uclassespend, StdCtrls,
  Menus, DBClient, IBDatabase;

type
  TfrmLancCXL = class(TfrmPadrao)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    imgInformation: TImage;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    PopupMenu1: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    hrPesquisa, HrFormpag: THandle;
  public
    { Public declarations }
  end;

var
  frmLancCXL: TfrmLancCXL;
  cadlanccxl: TLancCXL;

  PrimeiraPesquisa: Boolean;
  TemColunasComPosicaoAlteradas: Boolean;
  vConfigColuna : boolean;
  campoPesquisa: string;
  cdsColunas: TClientDataSet;

  cdsGrid: TClientDataSet;
  GridCfg: TDBGrid;
  ListGridsAndDataSets: TStrings;
  ListPositions: TStrings;

  trans: TIBTransaction;
  vTabela, vCampoPadrao: string;
  fReset, vCtrlClick, vShiftClick: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt,vAlterarNomeDtSet, usuario: string;
  vCamposPadraoRegistro: Boolean;

implementation

uses UIncLancAv, funcoes, uDtmFormPag, UdtmBalcao,UClasseFP,uDtmAtivo, Clipbrd;

{$R *.dfm}

procedure TfrmLancCXL.Configurarcolunas1Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas, DBGrid1, GridCfg, cdsGrid, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
end;

procedure TfrmLancCXL.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TfrmLancCXL.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg, cdsGrid,
    cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  TemColunasComPosicaoAlteradas := True;
end;

procedure TfrmLancCXL.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
 vDadosIni.DBGridOnTitleClick(DBGrid1,Column);
end;

procedure TfrmLancCXL.FormActivate(Sender: TObject);
begin
  inherited;
cadlanccxl.AbreLancCXL;
end;

procedure TfrmLancCXL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if not Assigned(DBGrid1.DataSource) then
    Exit;
  if not Assigned(DBGrid1.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg, cdsGrid,
      cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);

  if TemColunasComPosicaoAlteradas then
  	vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid1, GridCfg, true, ListPositions, cdsGrid);

//  UnloadPackage(HrFormpag);
//  UnloadPackage(hrPesquisa);
//  dtmFP:= nil;
  Action := caFree;
  frmLancCXL := nil;
  cadlanccxl.Free;
end;

procedure TfrmLancCXL.FormCreate(Sender: TObject);
begin
  inherited;
  cadlanccxl := TLancCXL.create;
  TemColunasComPosicaoAlteradas := False;
//  CadPendReq.Open;
//  cadlanccxl.Open;
//  CarregaPacote('pkFormPag', HrFormpag);
//   CarregaPacote('pkativos',hrpesquisa);
//  if dtmFP = nil then
//  begin
//   dtmFP := TdtmFP.Create(Self);
//   dtmFP.criaDtm;
//  end;
end;

procedure TfrmLancCXL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   vDadosIni.vShiftClick := Key = VK_SHIFT;
end;

procedure TfrmLancCXL.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TfrmLancCXL.FormShow(Sender: TObject);
begin
//  DBGrid1.DataSource := DtmBalcao.DtLancCxl;
  vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
    vAlterarNomeDtSet, GridCfg, DBGrid1, cdsGrid, cdsColunas, trans, ListGridsAndDataSets,
    ListPositions, nomeDTSEt, PrimeiraPesquisa, vCamposPadraoRegistro, usuario);
  inherited;
  cadlanccxl.AbreLancCXL;
  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
                    'Click no nome da coluna para Ordernar'+ #13 +
                    'Shift + Click no nome da coluna para Ordernar por mais de uma coluna';
  if PrimeiraPesquisa then
  begin
    PrimeiraPesquisa := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid1, GridCfg, cdsGrid, cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  end;
end;

procedure TfrmLancCXL.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid1);
end;

procedure TfrmLancCXL.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid1, GridCfg, cdsColunas, cdsGrid, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets, false, ListPositions);
end;

procedure TfrmLancCXL.SalvardadosnoExcel1Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid1, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TfrmLancCXL.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmLancCXL.Somarvaloresdacoluna1Click(Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid1, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TfrmLancCXL.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if cadlanccxl.ultdiaCXL then
    Exit;
  if vDadosIni.PesqPros('CXL044','INCLUIR',cadlanccxl.dataSet.fieldbyname('COD_LANCXL').AsString,
  'LANCCXL',cadlanccxl.dataSet.fieldbyname('COD_LANCXL').AsString,cadlanccxl.Buscas,True) then
//  if not vDadosIni.PesqPros('CXL044',cadlanccxl.dataSet.fieldbyname('COD_LANCXL').AsString,cadlanccxl.buscas, true) then
  begin
   Application.CreateForm(TFrmincLancAv, FrmincLancAv);
   FrmincLancAv.showmodal;
   cadlanccxl.CommitaTransacao;
   cadlanccxl.Close;
   cadlanccxl.Open;
   cadlanccxl.Refresh;
  end;
end;

procedure TfrmLancCXL.SpeedButton2Click(Sender: TObject);
var
 cadformpg: TFormPag2;
begin
  inherited;
  if cadlanccxl.ultdiaCXL then
    Exit;
  if vDadosIni.PesqPros('CXL045','INCLUIR',cadlanccxl.dataSet.fieldbyname('COD_LANCXL').AsString,'LANCCXL',
  cadlanccxl.dataSet.fieldbyname('COD_LANCXL').AsString,cadlanccxl.Buscas,True) then
//  if not vDadosIni.PesqPros('CXL045',cadlanccxl.dataSet.fieldbyname('COD_LANCXL').AsString,cadlanccxl.buscas, true) then
  begin
    if Application.MessageBox('Deseja realmente Cancelar este lançamento?', 'Confirmação', MB_YESNO + MB_DEFBUTTON2) = mrYES then
    begin
      if cadlanccxl.dataSet.FieldByName('TR').AsString <> 'S' then
      begin
       cadformpg:=TFormPag2.create;
    //    messagedlg('teste '+cadlanccxl.dataset.FieldByName('COD_LANCXL').AsString,mtinformation,[mbOK],0);
       cadformpg.cancelarLancamento(cadlanccxl.dataset.FieldByName('COD_LANCXL').AsInteger);
       cadlanccxl.CommitaTransacao;
       cadlanccxl.Close;
       cadlanccxl.Open;
       cadlanccxl.Refresh;
      end
      else
       Application.MessageBox(pchar('Troco de um Documento Não Permitido Apagar'),'Atenção',MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

procedure TfrmLancCXL.SpeedButton3Click(Sender: TObject);
var
  vsme, vsms: currency;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if cadlanccxl.ultdiaCXL then
      Exit;
    vsme := 0.00;
    vsms := 0.00;
    cadlanccxl.first;
    while not cadlanccxl.Eof do
    begin
      if cadlanccxl.dataSet.FieldByName('TIPO_LANC_CXL').asstring = 'E' then
       vsme:= vsme + cadlanccxl.dataSet.FieldByName('VALOR_CXL').value
      else
       vsms:= vsms+ cadlanccxl.dataSet.FieldByName('VALOR_CXL').value;
      cadlanccxl.next;
    end;
    messagedlg('Valores Entrada....: ' + format('%n', [vsme]) + #13 +
      'Valores Saída: ' + format('%n', [vsms]), mtinformation, [mbOK], 0);
    cadlanccxl.First;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLancCXL.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

