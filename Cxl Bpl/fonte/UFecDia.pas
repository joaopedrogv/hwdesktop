unit UFecDia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Buttons, ExtCtrls, Grids, DBGrids,UClassespend,UdtmBalcao,
  RDprint, StdCtrls, Menus, DBClient, IBDatabase;

type
  TFrmFecDia = class(TfrmPadrao)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton8: TSpeedButton;
    RdResumo: TRDprint;
    SpeedButton5: TSpeedButton;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    PopupMenu1: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    SpeedButton6: TSpeedButton;
    procedure SpeedButton6Click(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFecDia: TFrmFecDia;
  cadFecd: TFecdCXL;

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

uses UResumoCXL,udtmativo, uDadosIni, Clipbrd;

{$R *.dfm}

procedure TFrmFecDia.Configurarcolunas1Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas, DBGrid1, GridCfg, cdsGrid, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
end;

procedure TFrmFecDia.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TFrmFecDia.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg, cdsGrid,
    cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  TemColunasComPosicaoAlteradas := True;
end;

procedure TFrmFecDia.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton1Click(Sender);
end;

procedure TFrmFecDia.FormClose(Sender: TObject; var Action: TCloseAction);
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
  
  Action := caFree;
  FrmFecDia:= nil;
  cadFecd.free;
end;

procedure TFrmFecDia.FormCreate(Sender: TObject);
begin
  inherited;
	cadFecd:=TFecdCXL.create;
  TemColunasComPosicaoAlteradas := False;
end;

procedure TFrmFecDia.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//    if key = VK_F12 then
//    begin
//      if Classes.ssAlt in Shift then
//        SpeedButton15.Click;
//    end;
end;

procedure TFrmFecDia.FormShow(Sender: TObject);
begin
//  DBGrid1.DataSource := DtmBalcao.DtFecDia;
  vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet, GridCfg, DBGrid1, cdsGrid, cdsColunas, trans, ListGridsAndDataSets,
      ListPositions, nomeDTSEt, PrimeiraPesquisa, vCamposPadraoRegistro, usuario);

  inherited;
  cadFecd.DiaAberto;
  cadFecd.abreFecDia;
  cadFecd.Last;

  SpeedButton6.Visible := vDadosIni.getConfSisBool('cxl_hab_rel2_res_fechamento', cadFecd.Buscas);
  if not SpeedButton6.Visible then
  	SpeedButton3.Caption := '&Relatório do Dia';

  if PrimeiraPesquisa then
  begin
    PrimeiraPesquisa := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid1, GridCfg, cdsGrid, cdsColunas, usuario, ListGridsAndDataSets, vDadosIni.transacaoCol);
  end;
end;

procedure TFrmFecDia.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid1);
end;

procedure TFrmFecDia.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid1, GridCfg, cdsColunas, cdsGrid, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets, false, ListPositions);
end;

procedure TFrmFecDia.SalvardadosnoExcel1Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid1, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmFecDia.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TFrmFecDia.Somarvaloresdacoluna1Click(Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid1, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmFecDia.SpeedButton15Click(Sender: TObject);
begin
  inherited;
(*  try
   if vDadosIni.PesqPros('CXL035','INICIAR',DateToStr(vDadosIni.diaFCxl),'','',cadFecd.Buscas,True) then
//   if vDadosIni.PesqPros('CXL035', CadPendReq.dataSet.fieldbyname('TIPO').AsString,CadPendReq.Buscas, True) then
   begin
    Screen.Cursor := crHourGlass;
    cadFecd.
    CadPendReq.Refresh;
   end;
  finally
    Screen.Cursor := crDefault;
  end;
  *)
end;

procedure TFrmFecDia.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if cadFecd.ultdiaCXL then
    exit;
  if not cadFecd._validaDiaFech then
    exit;
  if vDadosIni.PesqPros('CXL040','INICIAR',DateToStr(vDadosIni.diaFCxl),'','',cadFecd.Buscas,True) then
  begin
   Application.CreateForm(TFrmResumoCXL,FrmResumoCXL);
   FrmResumoCXL.vcadFecd:=cadFecd;
   FrmResumoCXL.showmodal;
  end;
end;

procedure TFrmFecDia.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if cadFecd.ultdiaCXL then
    exit;
  if vDadosIni.PesqPros('CXL041','EMITIR',DateToStr(vDadosIni.diaFCxl),'','',cadFecd.Buscas,True) then
  begin
    if Application.MessageBox('Sim - Para Resumo e Não para Outros Relatórios', 'Confirmação',
    MB_YESNO + MB_DEFBUTTON2) = mrYES then
    begin
     RdResumo.FonteTamanhoPadrao:=S12cpp;
     RdResumo.TamanhoQteColunas:=80;
     cadFecd.maparesumo(1, RdResumo)
    end
    else
    begin
     RdResumo.FonteTamanhoPadrao:=S17cpp;
     RdResumo.TamanhoQteColunas:=132;
     cadFecd.reldetResumo(RdResumo);
    end;
  end;
end;

procedure TFrmFecDia.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if cadFecd.ultdiaCXL then
    exit;
  if vDadosIni.PesqPros('CXL042','EMITIR',DateToStr(vDadosIni.diaFCxl),'','',cadFecd.Buscas,True) then
  begin
   RdResumo.FonteTamanhoPadrao:=S17cpp;
   RdResumo.TamanhoQteColunas:=132;
   cadFecd.relrecibosrec(RdResumo);
  end;
end;

procedure TFrmFecDia.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if cadFecd.ultdiaCXL then
    exit;
  if vDadosIni.PesqPros('CXL054','EXECUTAR',DateToStr(vDadosIni.diaFCxl),'','',cadFecd.Buscas,True) then
  begin
   if cadFecd.reabredia then
   begin
    cadFecd.DiaAberto;
    cadFecd.Close;
    cadFecd.Open;
    cadFecd.ultdiaCXL;
    cadFecd.last;
   end;
  end;
end;

procedure TFrmFecDia.SpeedButton6Click(Sender: TObject);
begin
  inherited;
	if cadFecd.ultdiaCXL then
    exit;
  if vDadosIni.PesqPros('CXL041','EMITIR',DateToStr(vDadosIni.diaFCxl),'','',cadFecd.Buscas,True) then
  begin
    if Application.MessageBox('Sim - Para Resumo e Não para Outros Relatórios', 'Confirmação',
    MB_YESNO + MB_DEFBUTTON2) = mrYES then
    begin
     RdResumo.FonteTamanhoPadrao:=S12cpp;
     RdResumo.TamanhoQteColunas:=80;
     cadFecd.maparesumo(2, RdResumo)
    end
    else
    begin
     RdResumo.FonteTamanhoPadrao:=S17cpp;
     RdResumo.TamanhoQteColunas:=132;
     cadFecd.reldetResumo(RdResumo);
    end;
  end;
end;

procedure TFrmFecDia.SpeedButton8Click(Sender: TObject);
begin
  inherited;
 close;
end;

end.
