unit UControleAlmoxarifado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, ExtCtrls,
  ComCtrls, uEditMoeda, grimgctrl, QRCtrls, QuickRpt, uEditHw, DBClient,
  IBDatabase, Menus;

type
  TfrmControleAlmoxarifado = class(TfrmPadrao)
    PageControl1: TPageControl;
    tsControleVendedor: TTabSheet;
    tsControleAlmoxarifado: TTabSheet;
    pnControleAlmoxarifado: TPanel;
    GroupBox66: TGroupBox;
    Label198: TLabel;
    Label196: TLabel;
    GroupBox67: TGroupBox;
    Panel47: TPanel;
    Label199: TLabel;
    Panel48: TPanel;
    pnControleVendedor: TPanel;
    GroupBox8: TGroupBox;
    Label200: TLabel;
    GroupBox65: TGroupBox;
    Panel44: TPanel;
    Label7: TLabel;
    Label13: TLabel;
    DBLookupComboBox15: TDBLookupComboBox;
    Label12: TLabel;
    DBLookupComboBox16: TDBLookupComboBox;
    DBGrid2: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit1: TEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    ComboBox1: TComboBox;
    EditMoeda2: TEditMoeda;
    EditMoeda3: TEditMoeda;
    Panel2: TPanel;
    Label2: TLabel;
    tsOpcoesRel: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ComboBox2: TComboBox;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    GroupBox2: TGroupBox;
    DBGrid3: TDBGrid;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    tsRelMovProd: TTabSheet;
    qkRMovProd: TQuickRep;
    TitleBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrLperiodoMov: TQRLabel;
    QRHRule1: TQRHRule;
    ColumnHeaderBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel27: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    qrLEstAt: TQRLabel;
    QRLabel14: TQRLabel;
    PageFooterBand1: TQRBand;
    tsRelRelacAtend: TTabSheet;
    qkRRelacAtend: TQuickRep;
    TitleBand2: TQRBand;
    QRSysData3: TQRSysData;
    qrLPeriodoAtend: TQRLabel;
    QRHRule2: TQRHRule;
    ColumnHeaderBand2: TQRBand;
    QRSysData4: TQRSysData;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel28: TQRLabel;
    DetailBand2: TQRBand;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    PageFooterBand2: TQRBand;
    Panel27: TPanel;
    BitBtn16: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn17: TBitBtn;
    Panel1: TPanel;
    Label194: TLabel;
    Label21: TLabel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Label211: TLabel;
    Label195: TLabel;
    Panel22: TPanel;
    Edit2: TEdit;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    EditHw1: TEditHw;
    Panel5: TPanel;
    Label6: TLabel;
    Panel6: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Edit4: TEditFiscal;
    EditMoeda1: TEditMoeda;
    Label10: TLabel;
    Label11: TLabel;
    QRLabel29: TQRLabel;
    QRDBText31: TQRDBText;
    tsOrdenarRel: TTabSheet;
    pnAlmoxarifadoOrdenarRel: TPanel;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn31: TBitBtn;
    lbEmpresa: TQRLabel;
    lbendereco: TQRLabel;
    lbCep: TQRLabel;
    lbCNPJ: TQRLabel;
    lbCidade: TQRLabel;
    lbFone: TQRLabel;
    lbBairro: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    Edit3: TEdit;
    Label14: TLabel;
    BitBtn20: TBitBtn;
    imgInformation: TImage;
    imgInformation2: TImage;
    Label15: TLabel;
    ComboBox3: TComboBox;
    Label16: TLabel;
    EditHw2: TEditHw;
    GroupBox3: TGroupBox;
    ScrollBox2: TScrollBox;
    GroupBox4: TGroupBox;
    PopupMenu1: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    ScrollBox1: TScrollBox;
    ComboBox4: TComboBox;
    Label17: TLabel;
    tsReserva: TTabSheet;
    pnReserva: TPanel;
    Panel9: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    BitBtn22: TBitBtn;
    Panel11: TPanel;
    BitBtn24: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn23: TBitBtn;
    Panel12: TPanel;
    Panel13: TPanel;
    BitBtn32: TBitBtn;
    Splitter1: TSplitter;
    Panel14: TPanel;
    Label18: TLabel;
    Panel15: TPanel;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    btSelectAlmoxAll: TSpeedButton;
    btUnSelectAlmoxAll: TSpeedButton;
    btSelectResAll: TSpeedButton;
    btUnSelectResAll: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    tsEscolha: TTabSheet;
    pnEscolhaReserva: TPanel;
    Panel16: TPanel;
    pnEscolha: TPanel;
    BitBtn37: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn38: TBitBtn;
    pnReservasExistentes: TPanel;
    DBGrid8: TDBGrid;
    Panel19: TPanel;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    Label22: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    BitBtn43: TBitBtn;
    GroupBox5: TGroupBox;
    DBGrid6: TDBGrid;
    GroupBox6: TGroupBox;
    DBGrid5: TDBGrid;
    GroupBox9: TGroupBox;
    DBGrid7: TDBGrid;
    Panel20: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn106: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn13: TBitBtn;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel62: TPanel;
    Panel7: TPanel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn1: TBitBtn;
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EditHw1Enter(Sender: TObject);
    procedure BitBtn106Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure btUnSelectAlmoxAllClick(Sender: TObject);
    procedure btSelectAlmoxAllClick(Sender: TObject);
    procedure btUnSelectResAllClick(Sender: TObject);
    procedure btSelectResAllClick(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure DBGrid7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid7CellClick(Column: TColumn);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure DBGrid2ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure ScrollBox2Exit(Sender: TObject);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure ScrollBox1Exit(Sender: TObject);
    procedure ScrollBox1Enter(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure EditHw2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw2Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn20Click(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3Exit(Sender: TObject);
    procedure lbCidadePrint(sender: TObject; var Value: string);
    procedure lbBairroPrint(sender: TObject; var Value: string);
    procedure lbCNPJPrint(sender: TObject; var Value: string);
    procedure lbFonePrint(sender: TObject; var Value: string);
    procedure lbCepPrint(sender: TObject; var Value: string);
    procedure lbenderecoPrint(sender: TObject; var Value: string);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure EditMoeda1Exit(Sender: TObject);
    procedure DBLookupComboBox15Exit(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure EditHw1Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn58Click(Sender: TObject);
    procedure BitBtn57Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure EditMoeda3Exit(Sender: TObject);
    procedure DBLookupComboBox16Exit(Sender: TObject);
    procedure EditMoeda2Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function _mdiAberto(pNomeFormMDI: string): Boolean;
    procedure SetarValorProd(Sender: TObject);
    procedure gravaConfiguracaoUsuario(DBGrid: TDBGrid; trans: TIBTransaction; ScrollBox: TScrollBox); //metodo que grava as onfiguracoes do usuario
    function cripSettings(wtexto: string): string;
    procedure configuraChecks(pDtSetGrid: TClientDataSet; trans: TIBTransaction);
    procedure mostraColunas(DBGrid: TDBGrid; trans: TIBTransaction); //metodo que le as configuracoes e configura o grid
    procedure setTClientDataSet(dtSet: TClientDataSet; nomeUsuario: string; transacao:
      TIBTransaction;pAlterarNomeDtSet:string='');
    procedure criaChecksColunas(pDtSetGrid: TClientDataSet; ScrollBox: TScrollBox);
    procedure leConfiguracoesRegistro;
    procedure resetarConfiguracoesDeColunas(trans: TIBTransaction);
    procedure AjustaLaguraColunas(DBGrid: TDBGrid);
    procedure FormKeyDownReserva(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDownRelatorio(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDownEscolha(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDownReservasExistentes(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BotaoIncluir;
    procedure BotaoSalvarCancelar;
    function AbrirFormReserva: boolean;
    function CancelarPedido(pCancelar: boolean = false): boolean;
    function verificarDescontoTabDifPromPrecoQtde(pValorUn: Double; pPerguntar: boolean = true): boolean;
    procedure IniciarVenda;
  private
    cdsColunas: TClientDataSet;
    nomeDTSEt,vAlterarNomeDtSet, vUsuario: string;
    fReset, vConfigColuna: Boolean;
    vCheck: TCheckBox;
    vTabela, vCampoPadrao: string;
    trans: TIBTransaction;
    { Private declarations }
  public
    { Public declarations }
    Ascendente: boolean;
  var
   vRecNo: Integer;
   vIndex: string;
  end;

var
  frmControleAlmoxarifado: TfrmControleAlmoxarifado;

implementation

uses
  uClassesEstoqueFechado, uDtmAtivo, uDtmEstoqueFechado, uDataSet_OOP, DateUtils,
  uDadosIni, DB, UClassesProdutos, uCadPedVenda, UClassesPedVenda,
  uDtmPedVenda, UClassesClientes, IBDatabaseINI, IniFiles, Registry, Clipbrd;

{$R *.dfm}

function TfrmControleAlmoxarifado.AbrirFormReserva: boolean;
begin
  Result := true;
  if EstoqueFechado.Reserva._abreFormEscolhaReserva(Trunc(EditMoeda2.Valor), EstoqueFechado.dataSet) then
  begin
     if not CancelarPedido then
     begin
       Result := false;
       exit;
     end;
  end
  else
  begin
     if not CancelarPedido then
     begin
       Result := false;
       exit;
     end;
  end;
end;

procedure TfrmControleAlmoxarifado.AjustaLaguraColunas(DBGrid: TDBGrid);
var
  Tamanhos: array of Integer;
  I, Tam: Integer;
  //  DataSet: TDataSet;
begin
{  SetLength(Tamanhos, DBGrid.Columns.Count);
  for I := 0 to DBGrid.Columns.Count - 1 do
  begin
    if DBGrid.DataSource.DataSet.Fields[i] is TStringField then
    begin
      if DBGrid.DataSource.DataSet.Fields[i].Size>DBGrid.Canvas.TextWidth(DBGrid.Columns[I].Title.Caption)+10 then
        Tamanhos[I] := DBGrid.DataSource.DataSet.Fields[i].Size
      else Tamanhos[I] := DBGrid.Canvas.TextWidth(DBGrid.Columns[I].Title.Caption)+10;
    end
    else
      Tamanhos[I] := DBGrid.Canvas.TextWidth(DBGrid.Columns[I].Title.Caption)+10;
//    DBGrid.DataSource.DataSet.FieldByName(DBGrid.DataSource.DataSet.Fields[I].Name).
  end;
//  DataSet := DBGrid.DataSource.DataSet;
//  DBGrid.DataSource.DataSet.DisableControls;
//  try
//      for I := 0 to DBGrid.Columns.Count - 1 do
//      begin
//        Tam := DBGrid.Canvas.TextWidth(DataSet.Fields[I].Text);
//        Tam := DBGrid.Canvas.TextWidth(DBGrid.DataSource.DataSet.Fields[I].Text);
//        if Tam > Tamanhos[I] then
//          Tamanhos[I] := Tam;
//      end;
    for I := 0 to DBGrid.Columns.Count - 1 do
      DBGrid.Columns[I].Width := Tamanhos[I];// + 10;
//    DBGrid.Columns.RebuildColumns;
//  finally
//    DBGrid.DataSource.DataSet.EnableControls;
//    DataSet.EnableControls;
//  end;}

  for I := 0 to DBGrid.Columns.Count - 1 do
  begin
     //Irá redimensionar as colunas pelo tamanho do Caption -10
//    if DBGrid.DataSource.DataSet.FindField(DBGrid.Columns[I].Field.FieldName).FieldName = DBGrid.Columns[I].Field.FieldName then
//    begin
//      if DBGrid.DataSource.DataSet.FindField(DBGrid.Columns[I].Field.FieldName) is TStringField then
//      begin
//        if DBGrid.DataSource.DataSet.FindField(DBGrid.Columns[I].Field.FieldName).Size> DBGrid.Canvas.TextWidth(DBGrid.Columns[I].Title.Caption) then
//            DBGrid.Columns[I].Width := DBGrid.DataSource.DataSet.FindField(DBGrid.Columns[I].Field.FieldName).Size
//        else DBGrid.Columns[I].Width := DBGrid.Canvas.TextWidth(DBGrid.Columns[I].Title.Caption)-10;
//      end
//      else
        DBGrid.Columns[I].Width := DBGrid.Canvas.TextWidth(DBGrid.Columns[I].Title.Caption)+10;
//    end;
  end;

{// aqui tinha a idéia de ler as configuraçoes de tamanho de coluna do banco... mas não sei por quias cargas d'água só debugando funcionava aí abandonei a idéia.
    cdsColunas.IndexFieldNames := 'USUARIO;CAMPOS;FIELDNAME';
    if cdsColunas = nil then
      exit;
    if DBGrid.DataSource = nil then
      exit;
    if not cdsColunas.IsEmpty then
    begin
      for k := 0 to DBGrid.Columns.Count - 1 do
      for I := 0 to TClientDataSet(DBGrid.DataSource.DataSet).FieldCount - 1 do
      begin
        cdsColunas.FindNearest([usuario,
          cripSettings(TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Name),DBGrid.Columns[k].FieldName]);
        if (cdsColunas.FieldByName('campos').AsString =
          TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Name) and
          ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(usuario)) and
          (trim(cdsColunas.FieldByName('FIELDNAME').AsString) =
          DBGrid.Columns[k].FieldName) and (cdsColunas.FieldByName('TAMANHOCAMPO').AsInteger<>0) then
        begin
         DBGrid.Columns[k].Width := cdsColunas.FieldByName('TAMANHOCAMPO').AsInteger;
         break;
        end;
      end;
    end;
}
end;

procedure TfrmControleAlmoxarifado.BitBtn106Click(Sender: TObject);
begin
  inherited;
   if not EstoqueFechado.IsEmpty then
    vDadosIni.abreFormImagensProduto(EstoqueFechado.dataSet.FieldByName('DESCR_PROD').AsString,
      EstoqueFechado.dataSet.FieldByName('GRUPO_PROD').AsString, EstoqueFechado.dataSet.FieldByName('COD_PROD').AsString,
      EstoqueFechado.dataSet.FieldByName('NUM_FAB_PROD').AsString,
      0, 0, EstoqueFechado.buscas);
end;

procedure TfrmControleAlmoxarifado.BitBtn10Click(Sender: TObject);
begin
  inherited;
  Label4.Visible := False;
  EstoqueFechado.relatorio;
end;

procedure TfrmControleAlmoxarifado.BitBtn11Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VND153', 'IMPRIMIR SOLICITACAO', '', 'CONTROLE_ALMOXARIFADO', '', EstoqueFechado.buscas, true) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado._abreFormAlmoxarifadoOrdenarRel;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn12Click(Sender: TObject);
begin
   try
    Screen.Cursor := crHourGlass;
    EstoqueFechado.dataSet.Filtered := false;
    EstoqueFechado.Cancel;
    EstoqueFechado.RollBackTransacao;
    EstoqueFechado.Close;
    EstoqueFechado.Open;

    if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
      DBGrid2.SetFocus;
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmControleAlmoxarifado.BitBtn13Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmControleAlmoxarifado.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND153', 'IMPRIMIR SOLICITACAO', '', 'CONTROLE_ALMOXARIFADO', '', EstoqueFechado.buscas, true) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado._abreFormAlmoxarifadoOrdenarRel;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmControleAlmoxarifado.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if not EstoqueFechado.verPendenciaEstFech(StrToInt(EditMoeda2.Text), trim(TipoVenda.dataSet.FieldByName('SIGLA').AsString)) then
  begin
    EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp := 0;
    exit;
  end;

  if not vDadosIni.PesqPros('VND143', 'INCLUIR ITEM', '', 'CONTROLE_ALMOXARIFADO',
    '', EstoqueFechado.buscas, true) then
    Exit;

  BotaoIncluir;
end;

procedure TfrmControleAlmoxarifado.BitBtn17Click(Sender: TObject);
begin
  inherited;
  try
    if EstoqueFechado.dataSet.State <> dsInsert then
    begin
      Application.MessageBox('Produto deve ser informado', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
        Edit2.SetFocus;
      exit;
    end;

    if (vDadosIni.vEmp.vClienteAlmox <> 'S') then
      EstoqueFechado.dataSet.FieldByName('FILTRO').AsString := Edit1.Text;

    EstoqueFechado.dataSet.FieldByName('NUM_FAB_PROD').AsString := Edit2.Text;
    EstoqueFechado.dataSet.FieldByName('NDOC').AsInteger := EditHw2.AsInteger;
    if EstoqueFechado.dataSet.FieldByName('NDOC').AsInteger > 0 then
      EstoqueFechado.dataSet.FieldByName('TPDOC').AsString := trim(ComboBox3.Text)
    else
      EstoqueFechado.dataSet.FieldByName('NDOC').Value := Null;

    if not EstoqueFechado.Post then
    begin
      setFocusCampoErro(EstoqueFechado.vNomeCampoErro);
      exit;
    end;
    if EstoqueFechado.vPedvenda.vItProd.dataSet.State in [dsInsert, dsEdit] then
      EstoqueFechado.vPedvenda.vItProd.cancel;
    EstoqueFechado._abrecontroleVendedor(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger);
    BotaoSalvarCancelar;
  finally
    EstoqueFechado.vPedvenda.RollBackTransacao;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn19Click(Sender: TObject);
begin
  if (EstoqueFechado.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if EstoqueFechado.vPedvenda.vItProd.dataSet.State in [dsInsert, dsEdit] then
      EstoqueFechado.vPedvenda.vItProd.cancel;
    EstoqueFechado.RollBackTransacao;
    if not EstoqueFechado.Cancel then
      exit;
  end;

  BotaoSalvarCancelar;
end;

procedure TfrmControleAlmoxarifado.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmControleAlmoxarifado.BitBtn20Click(Sender: TObject);
begin
  inherited;
  EstoqueFechado.IndexFieldNames := 'NOME_CLIENTE';
  TForm(pnAlmoxarifadoOrdenarRel.Parent).ModalResult := IDOK;
  EstoqueFechado.imprimirSolOS(dtmEstoqueFechado.rdPedido);
end;

procedure TfrmControleAlmoxarifado.BitBtn21Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado.LiberarTravaVenda;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn22Click(Sender: TObject);
begin
  inherited;
   if not vDadosIni.PesqPros('VND204', 'VISUALIZAR', '', 'CONTROLE_ALMOXARIFADO', '', EstoqueFechado.buscas, true) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    EditMoeda2Exit(Sender);
    EstoqueFechado.Reserva._abreFormReserva(Trunc(EditMoeda2.Valor), EstoqueFechado.dataSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn23Click(Sender: TObject);
begin
  TForm(pnReserva.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmControleAlmoxarifado.BitBtn24Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if EstoqueFechado.Reserva.IsEmpty then
    begin
      Application.MessageBox('Nenhuma reserva selecionada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      exit;
    end;
    
    if not EstoqueFechado.Reserva.Delete then
      exit;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn25Click(Sender: TObject);
begin
  inherited;
//  EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text, 'SITUACAO');
//  EstoqueFechado.Refresh;
  EstoqueFechado.IndexFieldNames := 'SIT_ATD';
  TForm(pnAlmoxarifadoOrdenarRel.Parent).ModalResult := IDOK;
  EstoqueFechado.imprimirSolOS(dtmEstoqueFechado.rdPedido);
end;

procedure TfrmControleAlmoxarifado.BitBtn27Click(Sender: TObject);
begin
  inherited;
//  EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text, 'DESCRPROD');
//  EstoqueFechado.Refresh;
  EstoqueFechado.IndexFieldNames := 'DESCR_PROD';
  TForm(pnAlmoxarifadoOrdenarRel.Parent).ModalResult := IDOK;
  EstoqueFechado.imprimirSolOS(dtmEstoqueFechado.rdPedido);
end;

procedure TfrmControleAlmoxarifado.BitBtn28Click(Sender: TObject);
begin
  inherited;
//  EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text, 'LOCACAO1');
//  EstoqueFechado.Refresh;
  EstoqueFechado.IndexFieldNames := 'LOCACAO_PROD';
  TForm(pnAlmoxarifadoOrdenarRel.Parent).ModalResult := IDOK;
  EstoqueFechado.imprimirSolOS(dtmEstoqueFechado.rdPedido);
end;

procedure TfrmControleAlmoxarifado.BitBtn29Click(Sender: TObject);
begin
  inherited;
//  EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text, 'LOCACAO2');
//  EstoqueFechado.Refresh;
  EstoqueFechado.IndexFieldNames := 'LOCACAO_PROD_1';
  TForm(pnAlmoxarifadoOrdenarRel.Parent).ModalResult := IDOK;
  EstoqueFechado.imprimirSolOS(dtmEstoqueFechado.rdPedido);
end;

procedure TfrmControleAlmoxarifado.BitBtn2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not EstoqueFechado.RemoverItem then
      exit;

    if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
      BitBtn16.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn30Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vRecNo := EstoqueFechado.Reserva.dataSet.RecNo;
    if EstoqueFechado.Reserva.IsEmpty then
    begin
      Application.MessageBox('Nenhuma reserva selecionada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      exit;
    end;
    if not EstoqueFechado.Reserva.Edit then
      exit;
    EstoqueFechado.Reserva.Post;
  finally
    EstoqueFechado.Reserva.dataSet.RecNo := vRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn31Click(Sender: TObject);
begin
  inherited;
//  EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text, 'CODPEDIDO');
//  EstoqueFechado.Refresh;
  TForm(pnAlmoxarifadoOrdenarRel.Parent).ModalResult := IDOK;
  EstoqueFechado.imprimirSolOS(dtmEstoqueFechado.rdPedido);
end;

procedure TfrmControleAlmoxarifado.BitBtn32Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vRecNo := EstoqueFechado.Reserva.dataSet.RecordCount;
    if not EstoqueFechado.Reserva.Insert then
      exit;
    EstoqueFechado.Reserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger :=
      Trunc(EditMoeda2.Valor);
    EstoqueFechado.Reserva.Post;
  finally
    if EstoqueFechado.Reserva.dataSet.RecordCount <> vRecNo then    
      EstoqueFechado.Reserva.dataSet.RecNo := EstoqueFechado.Reserva.dataSet.RecordCount;
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmControleAlmoxarifado.BitBtn33Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vRecNo := EstoqueFechado.Reserva.dataSet.RecNo;

    if not EstoqueFechado.Reserva.ReservaItens.AddItemReserva(EstoqueFechado.Reserva) then
     exit;

    BitBtn35Click(Sender);
  finally
    EstoqueFechado.Reserva.dataSet.RecNo := vRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn34Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vRecNo := EstoqueFechado.Reserva.dataSet.RecNo;
    if not EstoqueFechado.Reserva.ReservaItens.RemoverItemReserva(EstoqueFechado.Reserva) then
     exit;

    BitBtn35Click(Sender); 
  finally
    EstoqueFechado.Reserva.dataSet.RecNo := vRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn35Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
//    EstoqueFechado.Cancel;
//    EstoqueFechado.RollBackTransacao;
//    EstoqueFechado.Close;
//    EstoqueFechado.Open;
    EstoqueFechado.Reserva.Cancel; 
    EstoqueFechado.Reserva.RollBackTransacao;
    EstoqueFechado.Reserva.Close;
    EstoqueFechado.Reserva.Open;

    EstoqueFechado.Reserva.ReservaItens.Cancel;
    EstoqueFechado.Reserva.ReservaItens.RollBackTransacao;
    EstoqueFechado.Reserva.ReservaItens.Close;
    EstoqueFechado.Reserva.ReservaItens.Open;

    EstoqueFechado.Reserva.ReservaItens._abreReservasItens(EstoqueFechado.Reserva.dataSet.FieldByName('CODIGO').AsInteger);

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn36Click(Sender: TObject);
begin
  if not EstoqueFechado.Reserva.Insert then
    exit;
  EstoqueFechado.Reserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger :=
    Trunc(EditMoeda2.Valor);
  EstoqueFechado.Reserva.ReservaItens.Insert(EstoqueFechado.Reserva);
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('GRUPO_PROD').AsInteger :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('GRUPO_PROD').AsInteger;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('COD_PROD').AsString :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_PROD').AsString;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('COD_GRADE').AsInteger :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_GRADE').AsInteger;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('DESCR_PROD').AsString :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('DESCR_PROD_PED').AsString;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('QUANT').AsFloat :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('TIPV').AsString :=
    EstoqueFechado.vPedvenda.dataSet.FieldByName('TIPV').AsString;
  EstoqueFechado.Reserva.ReservaItens.Post;  
  EstoqueFechado.Reserva.Post;
  TForm(pnEscolha.Parent).ModalResult := IDOK;
end;

procedure TfrmControleAlmoxarifado.BitBtn37Click(Sender: TObject);
begin
  EstoqueFechado.Reserva.Last;
  if EstoqueFechado.Reserva._abreFormReservaExistentes then
   TForm(pnEscolha.Parent).ModalResult := IDOK;
end;

procedure TfrmControleAlmoxarifado.BitBtn38Click(Sender: TObject);
begin
  TForm(pnEscolha.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmControleAlmoxarifado.BitBtn39Click(Sender: TObject);
begin
  TForm(pnReservasExistentes.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmControleAlmoxarifado.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not EstoqueFechado.DevolverItem then
      exit;

    EstoqueFechado._abrecontroleVendedor(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger);
    Edit2.Text := '';
    EditHw2.AsValue := 0;
    EditHw1.AsValue := 0;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn40Click(Sender: TObject);
begin          
  if EstoqueFechado.Reserva.IsEmpty then
  begin
    Application.MessageBox('Nenhuma reserva selecionada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    exit;
  end;
  if not EstoqueFechado.Reserva.ReservaItens.Insert(EstoqueFechado.Reserva) then
    exit;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('GRUPO_PROD').AsInteger :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('GRUPO_PROD').AsInteger;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('COD_PROD').AsString :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_PROD').AsString;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('COD_GRADE').AsInteger :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_GRADE').AsInteger;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('DESCR_PROD').AsString :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('DESCR_PROD_PED').AsString;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('QUANT').AsString :=
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsString;
  EstoqueFechado.Reserva.ReservaItens.dataSet.FieldByName('TIPV').AsString :=
    EstoqueFechado.vPedvenda.dataSet.FieldByName('TIPV').AsString;
  EstoqueFechado.Reserva.ReservaItens.Post;
  EstoqueFechado.Reserva.Post;
  TForm(pnReservasExistentes.Parent).ModalResult := IDOK;
end;

procedure TfrmControleAlmoxarifado.BitBtn41Click(Sender: TObject);
var
 acao: string;
 vQuant: double;
begin
  try
    Screen.Cursor := crHourGlass;
    vRecNo := EstoqueFechado.Reserva.dataSet.RecNo;
    acao := 'EDITAR';

    if not vDadosIni.PesqPros('VND210', acao, '', 'RESERVA_ALMOXARIFADO', '', EstoqueFechado.buscas, true) then
      Exit;

    EstoqueFechado.Reserva.ReservaItens.dtSet.Filter := ' SEL = ''S'' AND COD_PEDIDO = 0 ';
    EstoqueFechado.Reserva.ReservaItens.dtSet.Filtered := true;

    if EstoqueFechado.Reserva.ReservaItens.dtSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum item selecionado!', 'Atenção', MB_OK);
      exit;
    end;

    EstoqueFechado.Reserva.ReservaItens.dtSet.First;
    while not EstoqueFechado.Reserva.ReservaItens.dtSet.Eof do
    begin
      if EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('SEL').AsString = 'S' then
      begin
        if EstoqueFechado.Reserva.ReservaItens.verificarRegistrodtSet then
        begin
           vDadosIni.GravaAuditoria('VND210', acao, ' Cod Res: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsInteger) +
            ' Nº Item: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('NITEM').AsInteger) +
            ' Grupo Prod: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('GRUPO_PROD').AsInteger) +
            ' Cod Prod: ' + EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('COD_PROD').AsString, 'RESERVA_ALMOXARIFADO',
           EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsString, EstoqueFechado.buscas);

          if EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('COD_PEDIDO').AsInteger > 0 then
          begin
            Application.MessageBox(pchar('Produto ' + QuotedStr(trim(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('NUM_FAB_PROD').AsString)) + ' não se encontra pendente'), 'Atenção', MB_ICONERROR + MB_OK);
            exit;
          end;

          IniciarVenda;
          EstoqueFechado.vPedvenda.vItProd.insert;
          if not EstoqueFechado.vPedvenda.vItProd.buscaProduto(FloatToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('QUANT').AsFloat) + '*' +
            trim(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('NUM_FAB_PROD').AsString), 0, '', 0, true, false, false) then
           begin
              if EstoqueFechado.vPedvenda.vItProd.dataSet.State in [dsInsert, dsEdit] then
                EstoqueFechado.vPedvenda.vItProd.cancel;
              if EstoqueFechado.vPedvenda.vCondPag.dataSet.State in [dsInsert, dsEdit] then
                EstoqueFechado.vPedvenda.vCondPag.Cancel;
              if (Edit3.Enabled) and (vDadosIni.vEmp.vClienteAlmox = 'S') then
               EstoqueFechado.vPedvenda.vCliente.Cancel;
              if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
                Edit2.SetFocus;
              exit;
           end;

          if EstoqueFechado.vPedvenda.vItProd.vProduto.validaEstoque then
          begin
            EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp :=
             EstoqueFechado.Reserva.ReservaItens._getDisponibilidadeReserva(Trunc(EditMoeda2.Valor),
             EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
             EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
             EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
             EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp,
             EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat,
             EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('ORDEM').AsInteger);

            if EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp > 0 then
            begin
             try
                try
                  vQuant := EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp;
                  EstoqueFechado.vPedvenda.vItProd.vProduto.vChecarDisp := false;
                  BitBtn16Click(Sender);
                  Edit2.Text := FloatToStr(vQuant) + '*' +
                    trim(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('NUM_FAB_PROD').AsString);
                  Edit2Exit(Sender);
                  EstoqueFechado.dataSet.FieldByName('COD_RESERVA').AsInteger :=
                    EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsInteger;
                  if EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp > 0 then
                  begin
                    if EstoqueFechado.Reserva.ReservaItens.LocalizarProduto(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('QUANT').AsFloat,
                      EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp) then
                     begin
                       BitBtn17Click(Sender);
                       vDadosIni.GravaAuditoria('VND210', acao, 'SUCESSO -' +
                       ' Cod Res: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsInteger) +
                       ' Nº Item: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('NITEM').AsInteger) +
                       ' Grupo Prod: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('GRUPO_PROD').AsInteger) +
                       ' Cod Prod: ' + EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('COD_PROD').AsString, 'RESERVA_ALMOXARIFADO',
                        EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsString, EstoqueFechado.buscas);
                     end
                    else
                    begin
                      BitBtn19Click(Sender);
                      vDadosIni.GravaAuditoria('VND210', acao, 'FALHA  -' +
                       ' Cod Res: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsInteger) +
                       ' Nº Item: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('NITEM').AsInteger) +
                       ' Grupo Prod: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('GRUPO_PROD').AsInteger) +
                       ' Cod Prod: ' + EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('COD_PROD').AsString, 'RESERVA_ALMOXARIFADO',
                       EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsString, EstoqueFechado.buscas);
                    end;
                  end
                  else
                  begin
                    BitBtn19Click(Sender);
                    vDadosIni.GravaAuditoria('VND210', acao, 'FALHA  -' +
                     ' Cod Res: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsInteger) +
                     ' Nº Item: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('NITEM').AsInteger) +
                     ' Grupo Prod: ' + IntToStr(EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('GRUPO_PROD').AsInteger) +
                     ' Cod Prod: ' + EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('COD_PROD').AsString, 'RESERVA_ALMOXARIFADO',
                     EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsString, EstoqueFechado.buscas);
                  end;
                finally
                  EstoqueFechado.vPedvenda.vItProd.vProduto.vChecarDisp := true;
                end;
             except on E: Exception do
               begin
                vDadosIni.GravaAuditoria('VND211', acao, 'FALHA', 'RESERVA_ALMOXARIFADO', EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('CODIGO').AsString, EstoqueFechado.buscas);
                Application.MessageBox(pchar('Erro ao localizar produto: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
                EstoqueFechado.registraErro('Erro ao localizar produto: ' + e.Message);
               end;
              end;
            end;
          end;
        end;
      end;
      EstoqueFechado.Reserva.ReservaItens.dtSet.Next;
    end;
    EstoqueFechado.Reserva.ReservaItens.dtSet.First;
    while not EstoqueFechado.Reserva.ReservaItens.dtSet.Eof do
    begin
       if EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('SEL').AsString = 'S' then
         EstoqueFechado.Reserva.ReservaItens._verificarPendencias(
           EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('GRUPO_PROD').AsInteger,
           EstoqueFechado.Reserva.ReservaItens.dtSet.FieldByName('COD_PROD').AsString);
       EstoqueFechado.Reserva.ReservaItens.dtSet.Next;
    end;

    BitBtn35Click(Sender);
  finally
    EstoqueFechado.Reserva.ReservaItens.dtSet.Filtered := false;
    EstoqueFechado.Reserva.dataSet.RecNo := vRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn42Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vRecNo := EstoqueFechado.Reserva.dataSet.RecNo;

    if not EstoqueFechado.Reserva.ReservaItens._alterarItemReserva then
      exit;

    BitBtn35Click(Sender);
  finally
    EstoqueFechado.Reserva.dataSet.RecNo := vRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn43Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vRecNo := EstoqueFechado.Reserva.dataSet.RecNo;

    if not EstoqueFechado.Reserva.ReservaItens.LiberarTravaVenda then
      exit;
    BitBtn35Click(Sender);  
  finally
    EstoqueFechado.Reserva.dataSet.RecNo := vRecNo;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn4Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado._efetuarSoma;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn57Click(Sender: TObject);
begin
  inherited;
  if MaskEdit1.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data Inicial não informada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  if MaskEdit2.Text = '  /  /    ' then
  begin
    Application.MessageBox('Data Final não informada', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  Label4.Visible := true;
  BitBtn57.Tag := 1;
end;

procedure TfrmControleAlmoxarifado.BitBtn58Click(Sender: TObject);
begin
  inherited;
  BitBtn57.Tag := 2;
end;

procedure TfrmControleAlmoxarifado.BitBtn5Click(Sender: TObject);
begin
  try
    if (trim(EstoqueFechado.dataSet.IndexName) <> '') then
	     vIndex := EstoqueFechado.dataSet.IndexName;

    EstoqueFechado.dataSet.Filter := 'SEL = ''S'' AND SIT_ATD = ''AT''';
    EstoqueFechado.dataSet.Filtered := True;

		if EstoqueFechado.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum item selecionado com atendimento!', 'Atenção', MB_OK);
      exit;
    end;

    if not EstoqueFechado.verPendenciaEstFech(StrToInt(EditMoeda2.Text), trim(TipoVenda.dataSet.FieldByName('SIGLA').AsString)) then
    begin
      EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp := 0;
      exit;
    end;
    EstoqueFechado._obterCasasDecimais;
    vDadosIni.vEmp.vCasasDecimais := StrToInt(EstoqueFechado.vCasasDecimais);
    vDadosIni.vtpVenda := 'REQ';

    if not EstoqueFechado._verificaSelecao then
      exit;

    if not EstoqueFechado._existeDAV then
      exit;

//    if _mdiAberto('TFrmCadPedVenda') then
  	if not vDadosIni._mdiAberto('pkPedidoVenda', 'TFrmCadPedVendaEST', 'NAME') then
      Exit;

    if not vDadosIni.PesqPros('VND146', 'ABRIR VENDA', '',
      'CONTROLE_ALMOXARIFADO', '', EstoqueFechado.buscas, true) then
      exit;

    Screen.Cursor := crHourGlass;

    EstoqueFechado._selecionarItensControledePecas;
    EstoqueFechado._abrirVenda;
    EstoqueFechado._abrecontroleVendedor(DBLookupComboBox16.KeyValue);

  finally
    EstoqueFechado.dataSet.Filter := '';
    EstoqueFechado.dataSet.Filtered := False;
    if (EstoqueFechado.dataSet.IndexName = '') then
       EstoqueFechado.dataSet.IndexFieldNames := 'COD_PEDIDO'
    else
       EstoqueFechado.dataSet.IndexName := vIndex;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn6Click(Sender: TObject);
var
  vNPED, vNPEDant, vMecanico: string;
  vNITEM: Integer;
  vOS, vReq: Boolean;
  vRegistroCod, vRegistroNitem: Integer;
  I: Integer;
begin
  try
  	if (trim(EstoqueFechado.dataSet.IndexName) <> '') then
	     vIndex := EstoqueFechado.dataSet.IndexName;

    EstoqueFechado.dataSet.Filter := 'SEL = ''S'' AND SIT_ATD = ''AT''';
    EstoqueFechado.dataSet.Filtered := True;

    if EstoqueFechado.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum item selecionado com atendimento!', 'Atenção', MB_OK);
      exit;
    end;

    if not EstoqueFechado.verPendenciaEstFech(StrToInt(EditMoeda2.Text), trim(TipoVenda.dataSet.FieldByName('SIGLA').AsString)) then
    begin
      EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp := 0;
      exit;
    end;

    vNPED := '0';
    vNPEDant := '0';
    vOS := false;
    vReq := false;

    EstoqueFechado._obterCasasDecimais;
    vDadosIni.vEmp.vCasasDecimais := StrToInt(EstoqueFechado.vCasasDecimais);

    if not vDadosIni.PesqPros('VND147', 'TRANSFERIR PECA', '', 'CONTROLE_ALMOXARIFADO',
      EstoqueFechado.dataSet.FieldByName('COD_PEDIDO').AsString, EstoqueFechado.buscas, true) then
      Exit;

     vRegistroCod := EstoqueFechado.dataSet.FieldByName('COD_PEDIDO').AsInteger;
     vRegistroNitem := EstoqueFechado.dataSet.FieldByName('NITEM').AsInteger;

    if not EstoqueFechado._verificaSelecao then
      exit;

//    if _mdiAberto('TFrmCadPedVenda') then
  	if not vDadosIni._mdiAberto('pkPedidoVenda', 'TFrmCadPedVendaEST', 'NAME') then
      Exit;

//    if (not vOS) and (not vReq) then
    begin
      if Application.MessageBox('Deseja transferir para Ordem de Serviço?', 'Atenção', MB_YESNO) = mrYES then
      begin

        if Trim(EstoqueFechado.dataSet.FieldByName('TPDOC').AsString) = 'REQ' then
        begin
          if Application.MessageBox('Pedido selecionado está vinculo a uma Requisição de Venda, Deseja continuar assim mesmo?', 'Atenção', MB_YESNO) <> mrYES then
           exit;
        end;

        vOS := true;
      end;
    end;
    if (not vOS) then //if (not vOS) and (not vReq) then
    begin
      if Application.MessageBox('Deseja transferir para Requisição?', 'Atenção', MB_YESNO) = mrYES then
      begin

        if Trim(EstoqueFechado.dataSet.FieldByName('TPDOC').AsString) = 'OS' then
        begin
         if Application.MessageBox('Pedido selecionado está vinculo a uma Ordem de Serviço, Deseja continuar assim mesmo?', 'Atenção', MB_YESNO) <> mrYES then
          exit;
        end;

        vReq := true;
      end
      else
        exit;
    end;

    try
    // Ordem de Serviço

      if vOS then
      begin
        vDadosIni.vtpVenda := 'OS';
        EstoqueFechado.vPedvenda.create(DtmPedVenda);
        EstoqueFechado.vPedvenda.dataSet := TClientDataSet(DtmPedVenda.cdsPedVenda);
        EstoqueFechado.vPedvenda.transacao := TIBTransaction(DtmPedVenda.IBTransPedVenda);
        EstoqueFechado.vPedvenda.vItProd.dataSet := TClientDataSet(DtmPedVenda.cdsItemProd);
        EstoqueFechado.vPedvenda.vItProd.transacao := TIBTransaction(DtmPedVenda.IBTransPedVenda);
        EstoqueFechado.vPedvenda.vColab.dataSet := TClientDataSet(DtmPedVenda.cdsColaborador);
        EstoqueFechado.vPedvenda.vItProd.vProduto.dataSet := TClientDataSet(DtmPedVenda.cdsprod);

        if Trim(EstoqueFechado.dataSet.FieldByName('TPDOC').AsString) = 'OS' then
        	if vOS then
          begin
	          vNPED := EstoqueFechado.dataSet.FieldByName('NDOC').AsString;
            vNPEDant := vNPED;
          end;
          
        if not InputQuery('Atenção', 'Informe o Número da Ordem de Serviço:', vNPED) then
          exit;

        if ((StrToInt(vNPED) > 0) and (StrToInt(vNPEDant) >0)) and (StrToInt(vNPED) <> StrToInt(vNPEDant)) then
        begin
          if not vDadosIni.PesqPros('VND220', 'PERMITIR', 'NUM DOC: ' +  trim(vNPED) +
          ' -  NUM DOC ALT: ' + trim(vNPEDant) + ' - TIPO: ' + trim(Trim(EstoqueFechado.dataSet.FieldByName('TPDOC').AsString)),
           'CONTROLE_ALMOXARIFADO', '', EstoqueFechado.buscas, true) then
            Exit;
        end;

        EstoqueFechado.vPedvenda.abrePedVenda(StrToInt(vNPED), 'OS');
        EstoqueFechado.vPedvenda.vItProd.abrePedVendaProd(StrToInt(vNPED), 'OS');
        if (EstoqueFechado.vPedvenda.dataSet.FieldByName('STATUS_PED').AsString = 'FECHADA') then
        begin
          Application.MessageBox('Ordem de serviço já está FECHADA.', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end
        else if (EstoqueFechado.vPedvenda.dataSet.FieldByName('STATUS_PED').AsString = 'CANCELADO') then
        begin
          Application.MessageBox('Ordem de serviço está CANCELADA.', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end
        else if EstoqueFechado.vPedvenda.dataSet.IsEmpty then
        begin
          Application.MessageBox('Ordem de serviço não existe.', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end;

        if not EstoqueFechado.vPedvenda.dataSet.IsEmpty then
        begin
          if EstoqueFechado.vPedvenda.verificaFechamento(1) then
          begin
            Application.MessageBox('Ordem de serviço sendo Fechada neste momento.', 'Informação', MB_OK + MB_ICONINFORMATION);
            exit;
          end;
        end;

        if trim(EstoqueFechado.vCodClientePedidos) <> '' then
        begin
          for I := 1 to EstoqueFechado.vQuantClientePedidos do
          begin
            if (EstoqueFechado.vPedvenda.dataSet.FieldByName('COD_CLIENTE').AsString <> vDadosIni.getCampoPipe(EstoqueFechado.vCodClientePedidos,I)) then
            begin
              if Application.MessageBox('Produtos selecionados para transferência não pertencem ao Cliente REQ/OS, Deseja assim continuar mesmo?', 'Atenção', MB_YESNO) <> mrYES then
                exit;

               if not vDadosIni.PesqPros('VND166', 'PERMITIR', '', 'CONTROLE_ALMOXARIFADO',
                 '', EstoqueFechado.buscas, true) then
                    Exit;
              break;
            end;
          end;
        end;

        if vDadosIni.vEmp.vUsarAparelho = 'S' then
          InputQuery('Atenção', 'Informe o Código do Técnico:', vMecanico)
        else
          InputQuery('Atenção', 'Informe o Código do Mecânico:', vMecanico);

        if Trim(vMecanico) = '' then
        begin
          if vDadosIni.vEmp.vUsarAparelho = 'S' then
            Application.MessageBox('Técnico não informado.', 'Informação', MB_OK + MB_ICONINFORMATION)
          else
            Application.MessageBox('Mecânico não informado.', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end;

        if not Mecanico._abreMecanico(StrToInt(vMecanico)) then
        begin
          if vDadosIni.vEmp.vUsarAparelho = 'S' then
            Application.MessageBox('Usuário não é Técnico.', 'Informação', MB_OK + MB_ICONINFORMATION)
          else
            Application.MessageBox('Usuário não é Mecânico.', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end;
      end;

      // Requisição
      if vReq then
      begin
        vDadosIni.vtpVenda := 'REQ';
        EstoqueFechado.vPedvenda.create(DtmPedVenda);
        EstoqueFechado.vPedvenda.dataSet := TClientDataSet(DtmPedVenda.cdsPedVenda);
        EstoqueFechado.vPedvenda.transacao := TIBTransaction(DtmPedVenda.IBTransPedVenda);
        EstoqueFechado.vPedvenda.vItProd.dataSet := TClientDataSet(DtmPedVenda.cdsItemProd);
        EstoqueFechado.vPedvenda.vItProd.transacao := TIBTransaction(DtmPedVenda.IBTransPedVenda);
        EstoqueFechado.vPedvenda.vColab.dataSet := TClientDataSet(DtmPedVenda.cdsColaborador);
        EstoqueFechado.vPedvenda.vItProd.vProduto.dataSet := TClientDataSet(DtmPedVenda.cdsprod);

        if Trim(EstoqueFechado.dataSet.FieldByName('TPDOC').AsString) = 'REQ' then
        	if vReq then
          begin
	          vNPED := EstoqueFechado.dataSet.FieldByName('NDOC').AsString;
            vNPEDant := vNPED;
          end;
          
        if not InputQuery('Atenção', 'Informe o Número da Requisição:', vNPED) then
          exit;

        if ((StrToInt(vNPED) > 0) and (StrToInt(vNPEDant) >0)) and (StrToInt(vNPED) <> StrToInt(vNPEDant)) then
        begin
          if not vDadosIni.PesqPros('VND220', 'PERMITIR', 'NUM DOC: ' +  trim(vNPED) +
          ' -  NUM DOC ALT: ' + trim(vNPEDant) + ' - TIPO: ' + trim(Trim(EstoqueFechado.dataSet.FieldByName('TPDOC').AsString)),
           'CONTROLE_ALMOXARIFADO', '', EstoqueFechado.buscas, true) then
            Exit;
        end;

        EstoqueFechado.vPedvenda.abrePedVenda(StrToInt(vNPED), 'REQ');
        EstoqueFechado.vPedvenda.vItProd.abrePedVendaProd(StrToInt(vNPED), 'REQ');
        if (EstoqueFechado.vPedvenda.dataSet.FieldByName('STATUS_PED').AsString = 'FECHADA') then
        begin
          Application.MessageBox('Requisição já está FECHADA.', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end
        else if (EstoqueFechado.vPedvenda.dataSet.FieldByName('STATUS_PED').AsString = 'CANCELADO') then
        begin
          Application.MessageBox('Requisição está CANCELADA.', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end
        else if EstoqueFechado.vPedvenda.dataSet.IsEmpty then
        begin
          Application.MessageBox('Requisição não existe.', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end;

        if not EstoqueFechado.vPedvenda.dataSet.IsEmpty then
        begin
          if EstoqueFechado.vPedvenda.verificaFechamento(1) then
          begin
            Application.MessageBox('Requisição sendo Fechada neste momento.', 'Informação', MB_OK + MB_ICONINFORMATION);
            exit;
          end;
        end;

       if trim(EstoqueFechado.vCodClientePedidos) <> '' then
       begin
         for I := 1 to EstoqueFechado.vQuantClientePedidos do
         begin
           if (EstoqueFechado.vPedvenda.dataSet.FieldByName('COD_CLIENTE').AsString <> vDadosIni.getCampoPipe(EstoqueFechado.vCodClientePedidos,I)) then
           begin
             if Application.MessageBox('Produtos selecionados para transferência não pertencem ao Cliente REQ/OS, Deseja assim continuar mesmo?', 'Atenção', MB_YESNO) <> mrYES then
               exit;

              if not vDadosIni.PesqPros('VND166', 'PERMITIR', '', 'CONTROLE_ALMOXARIFADO',
                '', EstoqueFechado.buscas, true) then
                   Exit;
             break;
           end;
         end;
       end;
      end;
      EstoqueFechado.vPedvenda.IniciaTransacao;
      EstoqueFechado.vPedvenda.Edit;
      EstoqueFechado.dataSet.First;
      vNITEM := EstoqueFechado.vPedvenda.vItProd.dataSet.RecordCount;
      while not EstoqueFechado.dataSet.Eof do
      begin
        EstoqueFechado.buscas.Close;
        EstoqueFechado.buscas.SQL.Text := ' SELECT SIT_ATD FROM CONTROLE_ALMOXARIFADO ' +
         ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA';
        EstoqueFechado.buscas.ParamByName('COD_PEDIDO').AsInteger := EstoqueFechado.dataSet.FieldByName('COD_PEDIDO').AsInteger;
        EstoqueFechado.buscas.ParamByName('NITEM').AsInteger := EstoqueFechado.dataSet.FieldByName('NITEM').AsInteger;
        EstoqueFechado.buscas.ParamByName('COD_EMPRESA').AsInteger := EstoqueFechado.dataSet.FieldByName('COD_EMPRESA').AsInteger;
        EstoqueFechado.buscas.Open;

        if EstoqueFechado.buscas.FieldByName('SIT_ATD').AsString = 'AT' then
        begin
          vNITEM := vNITEM + 1;
          if EstoqueFechado.vPedvenda.verPendenciaVendaIt('P') then
          begin
            try
              EstoqueFechado.vPedvenda.vItProd.insert;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
              	EstoqueFechado.dataSet.FieldByName('num_fab_prod').AsString;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat :=
                EstoqueFechado.dataSet.FieldByName('quant').AsFloat;
              EstoqueFechado.vPedvenda.vItProd.buscaProduto(
                EstoqueFechado.dataSet.FieldByName('num_fab_prod').AsString,
                EstoqueFechado.dataSet.FieldByName('grupo_prod').AsInteger,
                EstoqueFechado.dataSet.FieldByName('cod_prod').AsString,
                EstoqueFechado.dataSet.FieldByName('cod_grade').AsInteger, false, false, false);
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_GRADE').AsInteger :=
                EstoqueFechado.dataSet.FieldByName('COD_GRADE').AsInteger;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat :=
                EstoqueFechado.dataSet.FieldByName('VLUN').AsFloat;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLTOT_PED_ITEM').AsFloat :=
                EstoqueFechado.dataSet.FieldByName('VLTOT').AsFloat;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_NF').AsFloat :=
                EstoqueFechado.dataSet.FieldByName('VLUN').AsFloat;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLTOT_PED_NF').AsFloat :=
                EstoqueFechado.dataSet.FieldByName('VLTOT').AsFloat;

              if EstoqueFechado.dataSet.FieldByName('DESC_ITEM').AsCurrency > 0 then
              begin
                EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('DESC_ITEM').AsCurrency :=
                  EstoqueFechado.dataSet.FieldByName('DESC_ITEM').AsCurrency;
                EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency :=
                  EstoqueFechado.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency;
                EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString := 'DESCONTO';
                EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString := 'VALOR';
              end;

              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_PEDIDO').AsInteger :=
                EstoqueFechado.dataSet.FieldByName('COD_PEDIDO').AsInteger;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('NITEM_PEDIDO').AsInteger :=
                EstoqueFechado.dataSet.FieldByName('NITEM').AsInteger;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('DATA_ATD').AsDateTime := EstoqueFechado.dataSet.FieldByName('DATA_ATD').AsDateTime;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('HORA_ATD').AsString := EstoqueFechado.dataSet.FieldByName('HORA_ATD').AsString;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('SIT_ATD').AsString := 'AT';
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('DATA_ATD').AsDateTime :=
                EstoqueFechado.dataSet.FieldByName('DATA_ATD').AsDateTime;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('HORA_ATD').AsString :=
                EstoqueFechado.dataSet.FieldByName('HORA_ATD').AsString;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_VENDEDOR').AsInteger :=
                EstoqueFechado.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('NOME_VEND1').AsString :=
                Copy(Mecanico.dataSet.FieldByName('NOME_VENDEDOR').AsString, 1, 35);
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_ALMOXARIFADO').AsInteger :=
                EstoqueFechado.dataSet.FieldByName('COD_VENDEDOR1').AsInteger;
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('NPED').AsInteger := StrToInt(vNPED);
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
              if vOS = true then
                EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COL_COD_VENDEDOR').AsInteger :=
                  Mecanico.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
              EstoqueFechado.vPedvenda.vItProd._setaVariaveisPromocao(EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_localidade').AsInteger,
              EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_cliente').AsInteger, EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
              EstoqueFechado.vPedvenda.dataSet.FieldByName('cod_cond_pag').AsInteger, EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_cidade').AsInteger, EstoqueFechado.vPedvenda.dataSet.FieldByName('TIPV').AsString);
              EstoqueFechado.vPedvenda.vItProd.post(false);

              vDadosIni.GravaAuditoria('VND147', 'TRANSFERIR PECA',
               'GRUPO ' + IntToStr(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
               ' - COD_PROD ' + trim(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_PROD').AsString) +
               vDadosIni.IfThen(vOS, ' - NUM OS ', ' - NUM REQ ') + vNPED + ' - TIPO ' + vDadosIni.IfThen(vOS, 'OS', 'REQ'),
               'CONTROLE_ALMOXARIFADO', EstoqueFechado.dataSet.FieldByName('COD_PEDIDO').AsString,
               EstoqueFechado.buscas);
            except
              vDadosIni.GravaAuditoria('VND147', 'TRANSFERIR PECA',
               'GRUPO ' + IntToStr(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
               ' - COD_PROD ' + trim(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('COD_PROD').AsString) +
               vDadosIni.IfThen(vOS, ' - NUM OS ', ' - NUM REQ ') + vNPED + ' - TIPO ' + vDadosIni.IfThen(vOS, 'OS', 'REQ'),
               'CONTROLE_ALMOXARIFADO', EstoqueFechado.dataSet.FieldByName('COD_PEDIDO').AsString,
               EstoqueFechado.buscas);
            end;
          end
          else
          begin
            EstoqueFechado.vPedvenda.RollBackTransacao;
            exit;
          end;
        end;
        EstoqueFechado.dataSet.Next;
      end;

      if not EstoqueFechado.vPedvenda.ChecaCamposObrigatorios then
      begin
        EstoqueFechado.vPedvenda.RollBackTransacao;
        exit;
      end;
      EstoqueFechado.vPedvenda.vCondPag.abreCondPag(EstoqueFechado.vPedvenda.dataSet.FieldByName('COD_COND_PAG').AsInteger);

      EstoqueFechado.vPedvenda.calculaDescontoAcrescimo;
      vDadosIni.vInibeMensPesqPros := 'S';
      if vDadosIni.PesqPros('VND180', 'PERMITIR', '', 'PEDVENDA', inttostr(vDadosIni.vCodUsuario) + ' ' + vDadosIni.vNomeUsuario, EstoqueFechado.buscas, true) then
        EstoqueFechado.vPedvenda.recalcularPrecoItensPelaCondicaoPagamento;
      EstoqueFechado.vPedvenda.Post(true);

      vDadosIni.GravaAuditoria('VND147', 'TRANSFERIR PECA','SUCESSO',
       'CONTROLE_ALMOXARIFADO', EstoqueFechado.dataSet.FieldByName('COD_PEDIDO').AsString,
       EstoqueFechado.buscas);
      EstoqueFechado._abrecontroleVendedor(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger);

    except
      vDadosIni.GravaAuditoria('VND147', 'TRANSFERIR PECA','FALHA',
       'CONTROLE_ALMOXARIFADO', EstoqueFechado.dataSet.FieldByName('COD_PEDIDO').AsString,
       EstoqueFechado.buscas);
      EstoqueFechado.vPedvenda.RollBackTransacao;
      Application.MessageBox('Erro ao transferir Peças!', 'Atenção', 0 + 64);
    end;
  finally
     EstoqueFechado.dataSet.Filter := '';
     EstoqueFechado.dataSet.Filtered := False;
     if (EstoqueFechado.dataSet.IndexName = '') then
      	EstoqueFechado.dataSet.IndexFieldNames := 'COD_PEDIDO'
     else
	      EstoqueFechado.dataSet.IndexName := vIndex;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn7Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado.dataSet.Filtered := false;
    EstoqueFechado.Cancel;
    EstoqueFechado.RollBackTransacao;
    EstoqueFechado.Close;
    EstoqueFechado.Open;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn8Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not EstoqueFechado.ConfAtendimento then
      exit;

//    if not EstoqueFechado.Post then
//    begin
//      setFocusCampoErro(EstoqueFechado.vNomeCampoErro);
//      Edit4.Text := '';
//    end;

    EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text);
    if (Self.Enabled) and (Self.Visible) and (Edit4.CanFocus) then
    begin
      Edit4.SetFocus;
      Edit4.SelectAll;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if not EstoqueFechado.ConfDevolucao then
   exit;

  if (Self.Enabled) and (Self.Visible) and (Edit4.CanFocus) then
  begin
    Edit4.SetFocus;
    Edit4.SelectAll;
  end;

end;

procedure TfrmControleAlmoxarifado.BotaoIncluir;
begin
  BitBtn16.Enabled := false;
  BitBtn17.Enabled := true;
  BitBtn19.Enabled := true;
  BitBtn22.Enabled := false;
  Edit2.Enabled := true;
  EditHw2.Enabled := true;
  ComboBox3.Enabled := true;
  EditHw1.Enabled := true;
  EditHw1.ReadOnly := false;	
  SpeedButton13.Enabled := true;
  GroupBox8.Enabled := false;
  Panel4.Enabled := false;
  btSelectAll.Enabled := false;
  btUnSelectAll.Enabled := false;
  Panel3.Enabled := false;
  EditHw1.AsValue := 0;

  if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
    Edit2.SetFocus;
end;

procedure TfrmControleAlmoxarifado.BotaoSalvarCancelar;
begin
  Edit2.Text := '';
  EditHw2.AsValue := 0;
  EditHw1.AsValue := 0;
  
  BitBtn16.Enabled := true;
  BitBtn17.Enabled := false;
  BitBtn22.Enabled := true;
  Edit2.Enabled := false;
  EditHw2.Enabled := false;
  ComboBox3.Enabled := false;
  EditHw1.Enabled := false;
  EditHw1.ReadOnly := false;
  SpeedButton13.Enabled := false;
  GroupBox8.Enabled := true;
  Panel4.Enabled := true;
  btSelectAll.Enabled := true;
  btUnSelectAll.Enabled := true;
  Panel3.Enabled := true;
  BitBtn19.Enabled := false;

  if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
    BitBtn16.SetFocus;
end;

procedure TfrmControleAlmoxarifado.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.btSelectAlmoxAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado.Reserva.ReservaItens._marcarTodos(EstoqueFechado.Reserva.ReservaItens.dtSetAlmox);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.btUnSelectAlmoxAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado.Reserva.ReservaItens._desmarcarTodos(EstoqueFechado.Reserva.ReservaItens.dtSetAlmox);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.btUnSelectResAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado.Reserva.ReservaItens._desmarcarTodos(EstoqueFechado.Reserva.ReservaItens.dtSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmControleAlmoxarifado.CancelarPedido(pCancelar: boolean = false): boolean;
begin
 Result := true;
 if (EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp <= 0) or (pCancelar) then
 begin
   Result := false;
   if EstoqueFechado.vPedvenda.vCondPag.dataSet.State in [dsInsert, dsEdit] then
     EstoqueFechado.vPedvenda.vCondPag.Cancel;
   if (Edit3.Enabled) and (vDadosIni.vEmp.vClienteAlmox = 'S') then
    if EstoqueFechado.vPedvenda.vCliente.dataSet.State in [dsInsert, dsEdit] then
      EstoqueFechado.vPedvenda.vCliente.Cancel;
   BitBtn19.Click;
   exit;
 end;
end;

procedure TfrmControleAlmoxarifado.ComboBox1Exit(Sender: TObject);
begin
  inherited;
  EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text);
end;

procedure TfrmControleAlmoxarifado.configuraChecks(pDtSetGrid: TClientDataSet; trans: TIBTransaction);
var
  i, j: integer;
begin
  for I := 0 to pDtSetGrid.FieldCount - 1 do
  begin
    for j := 0 to Self.ComponentCount - 1 do
      if (Components[j] is TCheckBox) and (Components[j].Name = pDtSetGrid.Fields[i].Name) then
      begin
        if (pDtSetGrid.Fields[I].Tag = 0) or (pDtSetGrid.Fields[I].Tag = 3) then
          TCheckBox(Components[j]).Checked := pDtSetGrid.Fields[i].Visible
        else if (pDtSetGrid.Fields[I].Tag = 1) then
          TCheckBox(Components[j]).Checked := false
        else if (pDtSetGrid.Fields[I].Tag = 2) then
          TCheckBox(Components[j]).Checked := true;
        Break;
      end;
  end;
end;

procedure TfrmControleAlmoxarifado.Configurarcolunas1Click(Sender: TObject);
begin
  if (PageControl1.ActivePage = tsControleVendedor) then
  begin
    if (cdsColunas = nil) or (not cdsColunas.Active) or (DBGrid1.DataSource = nil) then
      exit;
    configuraChecks(TClientDataSet(DBGrid1.DataSource.DataSet), trans);
    GroupBox3.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (ScrollBox2.CanFocus) then    
      ScrollBox2.SetFocus;
  end
  else
  begin
   if (cdsColunas = nil) or (not cdsColunas.Active) or (DBGrid2.DataSource = nil) then
      exit;
    configuraChecks(TClientDataSet(DBGrid2.DataSource.DataSet), trans);
    GroupBox4.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (ScrollBox1.CanFocus) then    
     ScrollBox1.SetFocus;
  end;
end;

procedure TfrmControleAlmoxarifado.Copiarparareadetransferncia1Click(
  Sender: TObject);
begin
  if (PageControl1.ActivePage = tsControleVendedor) then
    Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString
  else
    Clipboard.AsText := DBGrid2.DataSource.DataSet.FieldByName(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName).AsString;
end;

procedure TfrmControleAlmoxarifado.criaChecksColunas(pDtSetGrid: TClientDataSet; ScrollBox: TScrollBox);
var
  k, i, altura: integer;
  jaexiste: boolean;
begin
  jaexiste := false;
  jaexiste := false;
  cdsColunas.IndexFieldNames := 'campos';
  altura := 0;
  for I := 0 to pDtSetGrid.FieldCount - 1 do
  begin
    for k := 0 to ComponentCount - 1 do //Testando aqui o CheckBox já não existe.
    begin
      if (Components[k] is TCheckBox) then
        if pDtSetGrid.Fields[i].Name = TCheckBox(Components[k]).Name then
        begin
          jaexiste := true;
        end;
    end;
    if not jaexiste then
    begin
      altura := altura + 15;
      vCheck := TCheckBox.create(Self);
      vCheck.Alignment := taRightJustify;
      vCheck.Parent := ScrollBox;
      vCheck.Name := pDtSetGrid.Fields[i].Name;
      vCheck.Caption := pDtSetGrid.Fields[i].DisplayName;
      vCheck.Tag := pDtSetGrid.Fields[i].Index;
      vCheck.Left := 16;
      vCheck.Width := 225;
      vCheck.Top := altura;
      vCheck.Visible := true;
      vCheck.Checked := pDtSetGrid.Fields[I].Visible;
      if not((pDtSetGrid.Fields[I].Tag = 0) or (pDtSetGrid.Fields[I].Tag = 3))  then
        vCheck.Enabled := false;
    end;
  end;
end;

function TfrmControleAlmoxarifado.cripSettings(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin //caso seja criptografado
  {  wsembranco := wtexto;
    wresultado := '';
    wtam := length(trim(wsembranco));
    wnormal := ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_';
    wcripto := '9z8x7c5v6b4n1m2a3s0dfghjklçqpwoeirutyP.O+I-U*Y/T,R_E;W=Q°A~S^D´F`';
    for wi := 1 to wtam do
    begin
      wposicao := pos(copy(wsembranco, wi, 1), wnormal);
      wresultado := wresultado + copy(wcripto, wposicao, 1);
    end;
    result := wresultado;}Result := wtexto;

end;

procedure TfrmControleAlmoxarifado.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    EstoqueFechado._marcaDesmarcaLinha;
end;

procedure TfrmControleAlmoxarifado.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = 'SEL' then
    DBGrid1.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
      dgConfirmDelete, dgCancelOnExit];
end;

procedure TfrmControleAlmoxarifado.DBGrid1ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  DBGrid1.Columns[ToIndex].Title.Font.Style := [fsBold];
  gravaConfiguracaoUsuario(DBGrid1, trans, ScrollBox2);
end;

procedure TfrmControleAlmoxarifado.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (EstoqueFechado.dataSet.FieldByName('SIT_ATD').AsString = 'DV') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := $0093C9FF;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end
  else if (EstoqueFechado.dataSet.FieldByName('SIT_ATD').AsString = 'AT') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFB3B3);
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end;

  if (Column.Field.Dataset.FieldbyName('COD_PEDIDO').AsInteger > 0)
    and ((UpperCase(trim(Column.FieldName)) = 'VLUN')
      or (UpperCase(trim(Column.FieldName)) = 'VLTOT'))
    and ((UpperCase(Trim(Column.Field.dataSet.FieldByName('TABPRATICADA').AsString)) = '')
      or (UpperCase(Trim(Column.Field.dataSet.FieldByName('TABPRATICADA').AsString)) = 'N')) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clWhite;
    TDBGrid(sender).canvas.Font.color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (Column.Field.Dataset.FieldbyName('COD_PEDIDO').AsInteger > 0)
    and ((UpperCase(trim(Column.FieldName)) = 'VLUN')
      or (UpperCase(trim(Column.FieldName)) = 'VLTOT'))
    and (UpperCase(Trim(Column.Field.dataSet.FieldByName('TABPRATICADA').AsString)) = 'P') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clGreen;
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (Column.Field.Dataset.FieldbyName('COD_PEDIDO').AsInteger > 0)
    and ((UpperCase(trim(Column.FieldName)) = 'VLUN')
      or (UpperCase(trim(Column.FieldName)) = 'VLTOT'))
    and (UpperCase(Trim(Column.Field.dataSet.FieldByName('TABPRATICADA').AsString)) = 'T') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clGradientActiveCaption;
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (Column.Field.Dataset.FieldbyName('COD_PEDIDO').AsInteger > 0)
    and ((UpperCase(trim(Column.FieldName)) = 'VLUN')
      or (UpperCase(trim(Column.FieldName)) = 'VLTOT'))
    and (UpperCase(Trim(Column.Field.dataSet.FieldByName('TABPRATICADA').AsString)) = 'Q') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := TColor($00FFFFD2);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if (Edit1.Text <> '') then
  begin
    if gdSelected in State then
    begin
      TDBGrid(sender).canvas.brush.color := clBtnText;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmControleAlmoxarifado.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  vDadosIni.vShiftClick := Key = VK_SHIFT;

  if Key = VK_SPACE then
    if not EstoqueFechado.dataSet.IsEmpty then
      EstoqueFechado._marcaDesmarcaLinha;
end;

procedure TfrmControleAlmoxarifado.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TfrmControleAlmoxarifado.DBGrid2ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGrid2.Columns.Count - 1 do
    DBGrid2.Columns[i].Title.Font.Style := [];
  DBGrid2.Columns[ToIndex].Title.Font.Style := [fsBold];
  gravaConfiguracaoUsuario(DBGrid2, trans, ScrollBox1);
end;

procedure TfrmControleAlmoxarifado.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (EstoqueFechado.dataSet.FieldByName('SIT_ATD').AsString = 'NT') then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clGradientActiveCaption;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;

  if (EstoqueFechado.dataSet.FieldByName('SIT_ATD').AsString = 'DV') then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := $0093C9FF;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;

  if (Edit4.Text <> '') then
  begin
    if gdSelected in State then
    begin
      TDBGrid(sender).canvas.brush.color := clBtnText;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmControleAlmoxarifado.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmControleAlmoxarifado.DBGrid5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) or (Key = VK_RETURN) then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmControleAlmoxarifado.DBGrid6CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    EstoqueFechado.Reserva.ReservaItens._marcaDesmarcaLinha(EstoqueFechado.Reserva.ReservaItens.dtSet);
end;

procedure TfrmControleAlmoxarifado.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (TDBGrid(sender).DataSource.DataSet.FieldByName('CODIGO').AsInteger > 0) then
    if (TDBGrid(sender).DataSource.DataSet.FieldByName('DATA_VER').AsDateTime > 0) then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := clGradientActiveCaption;
        TDBGrid(sender).canvas.Font.color := clBlack;
      end;
    end
    else if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_PEDIDO').AsInteger <= 0) then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := $005151FF;
        TDBGrid(sender).canvas.Font.color := clBlack;
      end;
    end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmControleAlmoxarifado.DBGrid6KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) or (Key = VK_RETURN) then
    Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_SPACE then
    if not EstoqueFechado.Reserva.ReservaItens.dtSet.IsEmpty then
      EstoqueFechado.Reserva.ReservaItens._marcaDesmarcaLinha(EstoqueFechado.Reserva.ReservaItens.dtSet);
end;

procedure TfrmControleAlmoxarifado.DBGrid7CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    EstoqueFechado.Reserva.ReservaItens._marcaDesmarcaLinha(EstoqueFechado.Reserva.ReservaItens.dtSetAlmox);
end;

procedure TfrmControleAlmoxarifado.DBGrid7DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmControleAlmoxarifado.DBGrid7KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) or (Key = VK_RETURN) then
    Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_SPACE then
    if not EstoqueFechado.Reserva.ReservaItens.dtSetAlmox.IsEmpty then
      EstoqueFechado.Reserva.ReservaItens._marcaDesmarcaLinha(EstoqueFechado.Reserva.ReservaItens.dtSetAlmox);
end;

procedure TfrmControleAlmoxarifado.DBGrid8KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_Return then
    BitBtn40Click(Sender);
end;

procedure TfrmControleAlmoxarifado.DBLookupComboBox15Exit(Sender: TObject);
begin
  inherited;
  EditMoeda1.Text := IntToStr(DBLookupComboBox15.KeyValue);
end;

procedure TfrmControleAlmoxarifado.DBLookupComboBox16Exit(Sender: TObject);
begin
  inherited;
  EditMoeda2.Text := IntToStr(DBLookupComboBox16.KeyValue);
  EstoqueFechado._abrecontroleVendedor(StrToInt(EditMoeda2.Text));
end;

procedure TfrmControleAlmoxarifado.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  EditMoeda3.Text := IntToStr(DBLookupComboBox1.KeyValue);
  EstoqueFechado._abrecontroleAlmoxarifado(StrToInt(EditMoeda3.Text), ComboBox1.Text);
end;

procedure TfrmControleAlmoxarifado.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn13) then
   exit;
   
    if (Edit3.Enabled) and (vDadosIni.vEmp.vClienteAlmox = 'S') then
     if TRIM(TipoVenda.dataSet.FieldByName('SIGLA').AsString) <>
       TRIM(Cliente.dataSet.FieldByName('TIPVCLIENTE').AsString) then
     begin
       Application.MessageBox(PChar('Tipo de Venda ''' + TipoVenda.dataSet.FieldByName('SIGLA').asstring +
         ''' Incompativel com o tipo ''' + Cliente.dataSet.FieldByName('TIPVCLIENTE').AsString +
         ''' permitido ao Cliente'), 'Informação', MB_OK +
         MB_ICONINFORMATION + MB_DEFBUTTON1);
     end;
end;

procedure TfrmControleAlmoxarifado.Edit1Change(Sender: TObject);
var
  filtro: string;
begin
  inherited;
  if (Edit1.Text <> '') then
  begin
    EstoqueFechado.IndexFieldNames := 'FILTRO';
    EstoqueFechado.FindNearest([Edit1.Text]);
  end;
end;

procedure TfrmControleAlmoxarifado.Edit2Exit(Sender: TObject);
begin
  inherited;

  if ((ActiveControl = BitBtn19) or (ActiveControl = BitBtn13)) then
    Exit;

  if Trim(Edit2.Text) = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;

      Edit2.Text := vDadosIni.vPesquisa;

    finally
      Screen.Cursor := crDefault;
    end;
  end
  else
  begin
    if not EstoqueFechado.Produto._buscaProduto(Edit2.Text, True) then
    begin
      if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
        Edit2.SetFocus;
      exit;
    end;
  end;

  if trim(Edit2.Text) <> '' then
  begin
    IniciarVenda;
    EstoqueFechado.vPedvenda.vItProd.insert;
    if not EstoqueFechado.vPedvenda.vItProd.buscaProduto(Edit2.Text, 0, '', 0, true, false, false) then
    begin
      if EstoqueFechado.vPedvenda.vItProd.dataSet.State in [dsInsert, dsEdit] then
        EstoqueFechado.vPedvenda.vItProd.cancel;
      if EstoqueFechado.vPedvenda.vCondPag.dataSet.State in [dsInsert, dsEdit] then
        EstoqueFechado.vPedvenda.vCondPag.Cancel;
      if (Edit3.Enabled) and (vDadosIni.vEmp.vClienteAlmox = 'S') then
       EstoqueFechado.vPedvenda.vCliente.Cancel;
      if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
        Edit2.SetFocus;
      exit;
    end
    else
    begin
    	if (EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'T') then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        EditHw1.ReadOnly := not vDadosIni.PesqPros('VND297', 'HABILITAR', '', 'PEDVENDA', '', EstoqueFechado.buscas, False);
      end
      else if (EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'P') then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        EditHw1.ReadOnly := not vDadosIni.PesqPros('VND298', 'HABILITAR', '', 'PEDVENDA', '', EstoqueFechado.buscas, False);
      end
      else if (EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        EditHw1.ReadOnly := not vDadosIni.PesqPros('VND299', 'HABILITAR', '', 'PEDVENDA', '', EstoqueFechado.buscas, False);
      end
      else
        EditHw1.ReadOnly := False;
      
      if (EstoqueFechado.vPedvenda.vItProd.vProduto.vChecarDisp) then
        if not EstoqueFechado.vPedvenda.vItProd.vProduto.validaEstoque then
        begin
          try
            EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp :=
             EstoqueFechado.Reserva.ReservaItens._getDisponibilidadeReserva(Trunc(EditMoeda2.Valor),
             EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
             EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
             EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
             EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp,
             EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat);
            if EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp > 0 then
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat :=
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat - EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp;
            if not AbrirFormReserva then
              exit;
          finally
            if EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp > 0 then
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat := EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp;
          end;
        end
        else
        begin
          try
            EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp :=
              EstoqueFechado.Reserva.ReservaItens._getDisponibilidadeReserva(Trunc(EditMoeda2.Valor),
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
              EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp,
              EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat);

             if EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat > EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp then
             begin
               EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat :=
                 EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat - EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp;
               AbrirFormReserva;
             end;
          finally
            EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat := EstoqueFechado.vPedvenda.vItProd.vProduto.vestDisp;
          end;
          if not CancelarPedido then
            exit;
        end;

      if EstoqueFechado.dataSet.State <> dsInsert then
        EstoqueFechado.InserirPeca;

      if (Edit3.Enabled) and (vDadosIni.vEmp.vClienteAlmox = 'S') then
        EstoqueFechado.dataSet.FieldByName('cod_cliente').AsInteger := StrToInt(Edit3.Text);

      EstoqueFechado.dataSet.FieldByName('num_fab_prod').AsString := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString;
      EstoqueFechado.dataSet.FieldByName('grupo_prod').AsString := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('grupo_prod').AsString;
      EstoqueFechado.dataSet.FieldByName('cod_prod').AsString := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('cod_prod').AsString;
      EstoqueFechado.dataSet.FieldByName('cod_grade').AsInteger := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger;
      EstoqueFechado.dataSet.FieldByName('descr_prod').AsString := Copy(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('descr_prod_ped').AsString, 1, 75);
      EstoqueFechado.dataSet.FieldByName('quant').AsFloat := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat;
      EstoqueFechado.dataSet.FieldByName('codigo_nop').AsFloat := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('codigo_nop').AsFloat;
      EstoqueFechado.dataSet.FieldByName('valor_descacres').AsFloat := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('valor_descacres').AsFloat;
      EstoqueFechado.dataSet.FieldByName('tabpraticada').AsString := vDadosIni.IfThen(trim(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('tabpraticada').AsString) = '',
      	'N', trim(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('tabpraticada').AsString));
      EstoqueFechado.dataSet.FieldByName('precoporqtde').AsString := vDadosIni.IfThen(trim(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('precoporqtde').AsString) = '',
      	'N', trim(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('precoporqtde').AsString));
      if (vDadosIni.strIn(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('tabpraticada').AsString , ['P', 'T', 'Q'])) then
        EstoqueFechado.dataSet.FieldByName('desc_item').AsFloat := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('valor_descacres').AsFloat
      else
        EstoqueFechado.dataSet.FieldByName('desc_item').AsFloat := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('desc_item').AsFloat;

      Edit2.Text := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString;
      EditHw1.Text := FloatToStr(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('vlun_ped_item').AsFloat);
      SetarValorProd(Sender);
      if EstoqueFechado.vPedvenda.vCondPag.dataSet.State in [dsInsert, dsEdit] then
        EstoqueFechado.vPedvenda.vCondPag.Cancel;
      if (Edit3.Enabled) and (vDadosIni.vEmp.vClienteAlmox = 'S') then
        if EstoqueFechado.vPedvenda.vCliente.dataSet.State in [dsInsert, dsEdit] then
          EstoqueFechado.vPedvenda.vCliente.Cancel;
    end;
  end;
end;

procedure TfrmControleAlmoxarifado.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vProduto: TProdutos;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;

      Edit2.Text := vDadosIni.vPesquisa;

    finally
      Screen.Cursor := crDefault;
    end;
  end;
 // if (key = VK_ESCAPE) then
 //  BitBtn19.Click;
//  else if key = VK_F4 then
//  begin
//    vProduto := TProdutos.create;
//    vProduto.CadProdutos(1);
//    if (vDadosIni.vPesquisa <> '') then
//      Edit2.Text := vDadosIni.vPesquisa;
//
//  end;
end;

procedure TfrmControleAlmoxarifado.Edit3Exit(Sender: TObject);
var
 vSigla : string;
begin
  inherited;
  if (activecontrol = bitbtn13) then
   exit;

   try
     strtoint(Edit3.Text);
   except
     Application.MessageBox(pchar('Código inválido'), 'Informação',
       MB_ICONINFORMATION + MB_OK);
     if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
       Edit3.SetFocus;
     exit;
   end;

  if (StrToInt(Edit3.Text) < 0) then
  begin
    Application.MessageBox('Código Cliente não Encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
      Edit3.SetFocus;
    exit;
  end;

  if not Cliente._abreCliente(StrToInt(Edit3.Text)) then
  begin
    Application.MessageBox('Cliente não Encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
      Edit3.SetFocus;
    exit;
  end;

  Edit1.Text :=  trim(Cliente.dataset.FieldByName('NOME_CLIENTE').AsString);
  vSigla := Cliente.dataset.FieldByName('TIPVCLIENTE').AsString;

  EstoqueFechado.buscas.Close;
  EstoqueFechado.buscas.SQL.Text := 'select v.cod_tipo, v.sigla, v.descricao from tipo_vendas v where v.tipo =''REQ''' +
   ' and v.venda =''S'' and v.sigla = '+QuotedStr(vSigla)+'';
  EstoqueFechado.buscas.Prepare;
  EstoqueFechado.buscas.Open;

  if not EstoqueFechado.buscas.IsEmpty then
   DBLookupComboBox2.KeyValue := EstoqueFechado.buscas.FieldByName('COD_TIPO').AsInteger;
end;

procedure TfrmControleAlmoxarifado.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      Edit3.Text := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmControleAlmoxarifado.Edit3KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', #8]) then
    key := #0;
end;

procedure TfrmControleAlmoxarifado.Edit4Change(Sender: TObject);
begin
  inherited;
  if (Edit4.Text <> '') then
  begin
    if Pos('*', trim(Edit4.Text)) > 0 then
    begin
      if not EstoqueFechado.Produto._verificarSinal(trim(Edit4.Text)) then
        exit;

      EstoqueFechado.dataSet.Locate('NUM_FAB_PROD; QUANT', VarArrayOf([EstoqueFechado.Produto.pNumFab, EstoqueFechado.Produto.pQuant]), [loCaseInsensitive]);
    end
    else
      EstoqueFechado.dataSet.Locate('NUM_FAB_PROD', trim(Edit4.Text), [loCaseInsensitive]);

  end;
end;

procedure TfrmControleAlmoxarifado.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if Trim(Edit4.Text) <> '' then
    begin
      if Pos('*', trim(Edit4.Text)) > 0 then
      begin
        if not EstoqueFechado.Produto._verificarSinal(trim(Edit4.Text)) then
          exit;

        if EstoqueFechado.dataSet.Locate('NUM_FAB_PROD; QUANT', VarArrayOf([EstoqueFechado.Produto.pNumFab, EstoqueFechado.Produto.pQuant]), [loCaseInsensitive]) then
        begin
          if (trim(ComboBox1.Text) = 'NT') then
            BitBtn8.Click
          else
            BitBtn9.Click;

          if (Self.Enabled) and (Self.Visible) and (Edit4.CanFocus) then
            Edit4.SetFocus;
        end;
      end
      else
      begin
        if EstoqueFechado.dataSet.Locate('NUM_FAB_PROD', trim(Edit4.Text), [loCaseInsensitive]) then
        begin
          if (trim(ComboBox1.Text) = 'NT') then
            BitBtn8.Click
          else
            BitBtn9.Click;

          if (Self.Enabled) and (Self.Visible) and (Edit4.CanFocus) then
            Edit4.SetFocus;
        end;
      end;
      Edit4.SelectAll;
    end;
  end;
end;

procedure TfrmControleAlmoxarifado.Edit5KeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmControleAlmoxarifado.EditHw1Enter(Sender: TObject);
begin
  inherited;
	if EditHw1.ReadOnly then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    EditHw1.Enabled := False;
  end;
end;

procedure TfrmControleAlmoxarifado.EditHw1Exit(Sender: TObject);
begin
  inherited;
  SetarValorProd(Sender);
end;

procedure TfrmControleAlmoxarifado.EditHw2Exit(Sender: TObject);
begin
  if ActiveControl = BitBtn19 then
    exit;
  if EditHw2.AsInteger > 0 then
  begin
     try
       if (trim(ComboBox3.Text) = 'OS') then
         vDadosIni.vtpVenda := 'OS'
       else
         vDadosIni.vtpVenda := 'REQ';

       EstoqueFechado.vPedvenda.setTipoVendaAlmox;
       EstoqueFechado.vPedvenda.dataSet := TClientDataSet(DtmPedVenda.cdsPedVenda);
       EstoqueFechado.vPedvenda.transacao := TIBTransaction(DtmPedVenda.IBTransPedVenda);
       EstoqueFechado.vPedvenda.vItProd.dataSet := TClientDataSet(DtmPedVenda.cdsItemProd);
       EstoqueFechado.vPedvenda.vItProd.transacao := TIBTransaction(DtmPedVenda.IBTransPedVenda);
       EstoqueFechado.vPedvenda.vColab.dataSet := TClientDataSet(DtmPedVenda.cdsColaborador);
       EstoqueFechado.vPedvenda.vItProd.vProduto.dataSet := TClientDataSet(DtmPedVenda.cdsprod);

       EstoqueFechado.vPedvenda.abrePedVenda(EditHw2.AsInteger, vDadosIni.vtpVenda);
       EstoqueFechado.vPedvenda.vItProd.abrePedVendaProd(EditHw2.AsInteger, vDadosIni.vtpVenda);
       if (EstoqueFechado.vPedvenda.dataSet.FieldByName('STATUS_PED').AsString = 'FECHADA') then
       begin
         if trim(vDadosIni.vtpVenda) = 'OS' then
           Application.MessageBox('Ordem de serviço já está FECHADA.', 'Informação', MB_OK + MB_ICONINFORMATION)
         else
           Application.MessageBox('Requisição já está FECHADA.', 'Informação', MB_OK + MB_ICONINFORMATION);
         if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
           EditHw2.SetFocus;
         exit;
       end
       else if (EstoqueFechado.vPedvenda.dataSet.FieldByName('STATUS_PED').AsString = 'CANCELADO') then
       begin
         if trim(vDadosIni.vtpVenda) = 'OS' then
            Application.MessageBox('Ordem de serviço está CANCELADA.', 'Informação', MB_OK + MB_ICONINFORMATION)
         else
            Application.MessageBox('Requisição está CANCELADA.', 'Informação', MB_OK + MB_ICONINFORMATION);
         if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
           EditHw2.SetFocus;
         exit;
       end
       else if EstoqueFechado.vPedvenda.dataSet.IsEmpty then
       begin
         if trim(vDadosIni.vtpVenda) = 'OS' then
           Application.MessageBox('Ordem de serviço não existe.', 'Informação', MB_OK + MB_ICONINFORMATION)
         else
           Application.MessageBox('Requisição não existe.', 'Informação', MB_OK + MB_ICONINFORMATION);
         if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
           EditHw2.SetFocus;
         exit;
       end;

       if not EstoqueFechado.vPedvenda.dataSet.IsEmpty then
       begin
         if EstoqueFechado.vPedvenda.verificaFechamento(1) then
         begin
           if trim(vDadosIni.vtpVenda) = 'OS' then
             Application.MessageBox('Ordem de serviço sendo Fechada neste momento.', 'Informação', MB_OK + MB_ICONINFORMATION)
           else
             Application.MessageBox('Requisição sendo Fechada neste momento.', 'Informação', MB_OK + MB_ICONINFORMATION);
           if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
             EditHw2.SetFocus;
           exit;
         end;
       end;
     except
     end;
  end;
  if (Self.Enabled) and (Self.Visible) and (BitBtn17.CanFocus) then
    BitBtn17.SetFocus;
end;

procedure TfrmControleAlmoxarifado.EditHw2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      if (trim(ComboBox3.Text) = 'OS') then
      begin
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PEDVENDA', ' AND PEDVENDA.TIPO =''OS''', 'Consultar Ordem de Serviço');
        if trim(vDadosIni.vPesquisa) <> '' then
          EditHw2.AsValue := StrToInt(vDadosIni.vPesquisa);
      end
      else
      begin
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PEDVENDA', ' AND PEDVENDA.TIPO =''REQ''', 'Consultar Requisições');
        if vDadosIni.vPesquisa <> '' then
          EditHw2.AsValue := StrToInt(vDadosIni.vPesquisa);
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmControleAlmoxarifado.EditMoeda1Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox15.KeyValue := StrToInt(EditMoeda1.Text);
end;

procedure TfrmControleAlmoxarifado.EditMoeda2Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn13) then
   exit;

  if EditMoeda2.Valor <= 0 then
  begin
   Application.MessageBox('Vendedor não informado, favor informar um vendedor para continuar!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (TEditMoeda(Sender).CanFocus) then
      TEditMoeda(Sender).SetFocus;
     exit;
  end;

  DBLookupComboBox16.KeyValue := StrToInt(EditMoeda2.Text);
  EstoqueFechado._abrecontroleVendedor(DBLookupComboBox16.KeyValue);

  EstoqueFechado.buscas.Close;
  EstoqueFechado.buscas.SQL.Text := 'select c.cod_vendedor, c.nome_vendedor, f.desc_funcao from colaborador c ' +
    ' inner join funcoes f on f.cod_funcao = c.cod_funcao ' +
    ' where cod_vendedor = '+ EditMoeda2.Text +
    ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and c.ativo = 1 and f.desc_funcao like ''%VENDEDOR%''';
  EstoqueFechado.buscas.Prepare;
  EstoqueFechado.buscas.Open;

  if EstoqueFechado.buscas.IsEmpty then
  begin
    Application.MessageBox('Usuário informado não é vendedor, favor informar um vendedor para continuar!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    if (Self.Enabled) and (Self.Visible) and (TEditMoeda(Sender).CanFocus) then
      TEditMoeda(Sender).SetFocus;
  end;
end;

procedure TfrmControleAlmoxarifado.EditMoeda3Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox1.KeyValue := StrToInt(EditMoeda3.Text);
  EstoqueFechado._abrecontroleAlmoxarifado(DBLookupComboBox1.KeyValue, ComboBox1.Text);
end;

procedure TfrmControleAlmoxarifado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (PageControl1.ActivePage = tsControleVendedor) then
  begin
    if (cdsColunas <> nil) and (DBGrid1.DataSource <> nil) then
      configuraChecks(TClientDataSet(DBGrid1.DataSource.DataSet), trans);
  end
  else
  begin
    if (cdsColunas <> nil) and (DBGrid2.DataSource <> nil) then
      configuraChecks(TClientDataSet(DBGrid2.DataSource.DataSet), trans);
  end;
  EstoqueFechado.Cancel;
  EstoqueFechado.RollBackTransacao;
  EstoqueFechado.free;
  EstoqueFechado := nil;

  Action := caFree;
  if (frmControleAlmoxarifado <> nil) then
    frmControleAlmoxarifado := nil;
end;

procedure TfrmControleAlmoxarifado.FormCreate(Sender: TObject);
begin
  inherited;
	if DtmPedVenda = nil then
  	DtmPedVenda := TDtmPedVenda.Create(DtmPedVenda);

  vDadosIni.vShiftClick := False;
  vDadosIni.vtpVenda := 'REQ';
  EstoqueFechado := TEstoqueFechado.create;
end;

procedure TfrmControleAlmoxarifado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if ((PageControl1.ActivePage = tsControleVendedor) and (Key = VK_F6) and (vDadosIni.vEmp.vClienteAlmox = 'S')) then
   begin
     Label200.Enabled := not Label200.Enabled;
     Edit3.Enabled := not Edit3.Enabled;
     Edit1.Enabled := false;//not Edit1.Enabled;

     if Label200.Enabled then
     begin
       if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
         Edit3.SetFocus;
     end
     else
     begin
       if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
         BitBtn16.SetFocus;
     end;
   end;


  if ((PageControl1.ActivePage = tsControleVendedor) and (Key = VK_F5)) then
  begin
    BitBtn7.Click;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  end;

  if ((PageControl1.ActivePage = tsControleAlmoxarifado) and (Key = VK_F5)) then
  begin
    BitBtn12.Click;
    if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
      DBGrid2.SetFocus;
  end;


  if ((PageControl1.ActivePage = tsControleVendedor) and (Key = VK_F2)) then
    EstoqueFechado._marcaDesmarcaLinha;

  if ((PageControl1.ActivePage = tsControleAlmoxarifado) and (Key = VK_F2)) then
  begin
    if ComboBox1.Text = 'AT' then
    begin
      ComboBox1.Text := 'NT';
      EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text);
    end
    else
    begin
      ComboBox1.Text := 'AT';
      EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text);
    end;
  end;

  if ((PageControl1.ActivePage = tsControleAlmoxarifado) and (Key = VK_F3)) then
  begin
    if (Self.Enabled) and (Self.Visible) and (EditMoeda3.CanFocus) then
      EditMoeda3.SetFocus;
  end;

  if ((PageControl1.ActivePage = tsControleAlmoxarifado) and (Key = VK_F4)) then
  begin
    if (Self.Enabled) and (Self.Visible) and (Edit4.CanFocus) then
      Edit4.SetFocus;
  end;
end;

procedure TfrmControleAlmoxarifado.FormKeyDownEscolha(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
    BitBtn38Click(Sender);
end;

procedure TfrmControleAlmoxarifado.FormKeyDownRelatorio(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BitBtn26.Click;
end;

procedure TfrmControleAlmoxarifado.FormKeyDownReserva(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F2 then
    EstoqueFechado.Reserva.ReservaItens._marcaDesmarcaLinha(EstoqueFechado.Reserva.ReservaItens.dtSet)
  else if Key = VK_F3 then
    EstoqueFechado.Reserva.ReservaItens._marcaDesmarcaLinha(EstoqueFechado.Reserva.ReservaItens.dtSetAlmox)
  else if Key = VK_F5 then
    BitBtn35Click(Sender)
  else if Key = VK_ESCAPE then
    BitBtn23Click(Sender);
end;

procedure TfrmControleAlmoxarifado.FormKeyDownReservasExistentes(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BitBtn39Click(Sender);
end;

procedure TfrmControleAlmoxarifado.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_CONTROL then
    vDadosIni.vCtrlClick := False;
  if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TfrmControleAlmoxarifado.FormShow(Sender: TObject);
begin
  inherited;
  tsControleVendedor.TabVisible := false;
  tsControleAlmoxarifado.TabVisible := false;
  tsOpcoesRel.TabVisible := false;
  tsRelMovProd.TabVisible := false;
  tsRelRelacAtend.TabVisible := false;
  tsOrdenarRel.TabVisible := false;
  tsReserva.TabVisible := false;
  tsEscolha.TabVisible := false;
  vDadosIni.fechaStatusProcessamento;
  Ascendente := false;
  Usuario._abreTodosVendedor;
  CondPagamento._abreTodosCondPagamento;
  TipoVenda._abreTodosTipoVenda;
  Cliente._abreCliente(0);
  EstoqueFechado.vPedvenda.vItProd.vProduto.vChecarDisp := true;

  if vDadosIni.vPesquisa = 'VENDEDOR' then
  begin
    pnControleAlmoxarifado.Enabled := false;
    pnControleVendedor.Enabled := true;
    frmControleAlmoxarifado.Caption := 'Controle de Peças por Vendedor';
    tsControleVendedor.Show;

    Edit3.Visible := vDadosIni.vEmp.vClienteAlmox = 'S';
    Label14.Visible := vDadosIni.vEmp.vClienteAlmox = 'S';
    Edit3.Text := '0';
    Edit1.Text := '';

    if vDadosIni.vEmp.vClienteAlmox = 'S' then
    begin
      Label200.Caption := 'Cliente:';
      Edit1.Left := 222;
      Label200.Enabled := false;
      Edit3.Enabled := false;
      Edit1.Enabled := false;
    end
    else
    begin
      Label200.Caption := 'Filtro:';
      Edit1.Left := 144;
    end;

    if not EstoqueFechado._abrecontroleVendedor(vDadosIni.vCodUsuario) then
    begin
      DBLookupComboBox16.KeyValue := Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
      EstoqueFechado._abrecontroleVendedor(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger);
    end
    else
      DBLookupComboBox16.KeyValue := vDadosIni.vCodUsuario;

    EditMoeda2.Text := IntToStr(DBLookupComboBox16.KeyValue);
    DBLookupComboBox15.KeyValue := CondPagamento.dataSet.FieldByName('COD_COND_PAG').AsInteger;
    EditMoeda1.Text := IntToStr(DBLookupComboBox15.KeyValue);
    DBLookupComboBox2.KeyValue := TipoVenda.dataSet.FieldByName('COD_TIPO').AsInteger;
    Edit2.Text := '';
    EditHw2.AsValue := 0;
    EditHw1.AsValue := 0;

    imgInformation.Hint :=
    'Processo "VND099" ALTERAR VENDEDOR ESTOQUE FECHADO' + #13 +
    'Processo "VND141" ABRIR CONTROLE ESTOQUE FECHADO' + #13 +
    'Processo "VND165" ABRIR/TRANSF VENDA COM PRODUTOS DE CLIENTES DIF' + #13 +
    'Processo "VND166" PRODUTOS P/ TRANSF NÃO PERTENCE AO CLIENTE DA OS/REQ' + #13 +
    'Processo "VND180" REALIZAR CALCULO AO TRANSF ITENS PELO EST.FECHADO' + #13 +
    'Processo "VND216" CONSULTAR USUARIO QUANTO AO TRAVAR ESTOQUE FECHADO' + #13 +
    'Processo "VND213" ADICIONAR PRODUTO RESERVADO NAO DISPONIVEL AO VENDEDOR' + #13 +
    'Processo "VND219" LIBERAR MERCADORIA PENDENTE NO ESTOQUE FECHADO' + #13 +
    'Processo "VND220" ALTERAR NUMERO DE DOCUMENTO AO TRANFERIR PECA' + #13 +
    'Processo "VND221" ABRIR VENDA DE PEÇA VINCULADA A UM DOCUMENTO' + #13 +
    'Processo "VND226" PERMITIR ALTERAR PRODUTOS COM PRECO POR QUANTIDADE PARA PRECO NORMAL' + #13 +
    'Processo "PRO283" HABILITAR CONSULTA DE PRODUTOS PARA CONSUMO NA CONSULTA RAPIDA' + #13 +
    'Processo "VND285" PERMITIR ALTERAR PRODUTOS COM PRECO DIFERENCIADO PARA PRECO NORMAL' + #13 +
    'Processo "VND286" PERMITIR ALTERAR PRODUTOS COM PRECO PROMOCAO PARA PRECO NORMAL' + #13 +
    'Processo "VND297" HABILITAR CAMPO VALOR UNITARIO PRODUTOS COM PRECO DIFERENCIADO' + #13 +
    'Processo "VND298" HABILITAR CAMPO VALOR UNITARIO PRODUTOS COM PRECO PROMOCAO' + #13 +
    'Processo "VND299" HABILITAR CAMPO VALOR UNITARIO PRODUTOS COM PRECO POR QUANTIDADE';

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('VND099', 'PERMITIR', '', 'PEDVENDA', inttostr(vDadosIni.vCodUsuario) + ' ' + vDadosIni.vNomeUsuario, EstoqueFechado.buscas, true) then
    begin
      EditMoeda2.Enabled := false;
      dblookupcombobox16.Enabled := false;

    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
        DBLookupComboBox2.SetFocus;
    end
    else
    begin
      EditMoeda2.Enabled := true;
      dblookupcombobox16.Enabled := true;

      if (Self.Enabled) and (Self.Visible) and (EditMoeda2.CanFocus) then
        EditMoeda2.SetFocus;
    end;
    try
      Screen.Cursor := crHourGlass;
      EstoqueFechado.Reserva.ReservaItens._verificarPendencias;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if vDadosIni.vPesquisa = 'ALMOXARIFADO' then
  begin
    pnControleVendedor.Enabled := false;
    pnControleAlmoxarifado.Enabled := true;
    frmControleAlmoxarifado.Caption := 'Controle de Peças Almoxarifado';

    tsControleAlmoxarifado.Show;
    EstoqueFechado._abrecontroleAlmoxarifado(Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger, ComboBox1.Text);
    DBLookupComboBox1.KeyValue := Usuario.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
    EditMoeda3.Text := IntToStr(DBLookupComboBox1.KeyValue);
    Edit4.Text := '';

    imgInformation2.Hint := imgInformation2.Hint +
     'Processo "VND149" ABRIR CONTROLE ESTOQUE FECHADO - ALMOXARIFADO';

    if (Self.Enabled) and (Self.Visible) and (EditMoeda3.CanFocus) then
      EditMoeda3.SetFocus;
  end;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
end;

procedure TfrmControleAlmoxarifado.gravaConfiguracaoUsuario(DBGrid: TDBGrid;  trans: TIBTransaction; ScrollBox: TScrollBox);
var
  i, t: integer;
begin
  t := 0;
  //  trans.StartTransaction;
  if cdsColunas = nil then
    exit;
  cdsColunas.Close;
  cdsColunas.CommandText := 'select * from config_colunas where usuario = ' +
    QuotedStr(vUsuario)+' and componente = '+QuotedStr(nomeDTSEt);
  cdsColunas.Open;
  cdsColunas.IndexFieldNames := 'USUARIO;CAMPOS';

  if DBGrid.DataSource = nil then
    exit;
  with Self do
    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TCheckBox) then
        if (TCheckBox(Components[i]).Parent = ScrollBox) and (TCheckBox(Components[i]).Enabled) then
        begin
          cdsColunas.FindNearest([vUsuario, cripSettings(TCheckBox(Components[i]).Name)]);
          if (cdsColunas.FieldByName('campos').AsString =
            cripSettings(TCheckBox(Components[i]).Name)) and
            ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(vUsuario)) then
          begin
            cdsColunas.Edit;
            if TCheckBox(Components[i]).Checked then
              cdsColunas.FieldByName('visivel').AsInteger := 1
            else
              cdsColunas.FieldByName('visivel').AsInteger := 0;
            cdsColunas.Post;
          end
          else
          begin
            cdsColunas.Insert;
            if cdsColunas.State = dsInsert then
              inc(t);
            cdsColunas.FieldByName('usuario').AsString := vUsuario;
            cdsColunas.FieldByName('componente').AsString := nomeDTSEt;
            cdsColunas.FieldByName('campos').AsString := cripSettings(TCheckBox(Components[i]).Name);
            if TCheckBox(Components[i]).Checked then
              cdsColunas.FieldByName('visivel').AsInteger := 1
            else
              cdsColunas.FieldByName('visivel').AsInteger := 0;
            cdsColunas.FieldByName('ordem').AsInteger := 0;
            cdsColunas.Post;
            cdsColunas.ApplyUpdates(-1);
          end;
        end;
  for I := 0 to TClientDataSet(DBGrid.DataSource.DataSet).FieldCount - 1 do
  begin
    cdsColunas.FindNearest([vUsuario,
      cripSettings(TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].name)]);
    if (cdsColunas.FieldByName('campos').AsString =
      cripSettings(TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Name)) and
      ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(vUsuario)) then
    begin
      cdsColunas.Edit;
      if (cdsColunas.FieldByName('visivel').AsInteger = 1) then
        cdsColunas.FieldByName('ordem').AsInteger :=
          TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Index
      else
        cdsColunas.FieldByName('ordem').AsInteger := -1;
        {for k := 0 to DBGrid.Columns.Count-1 do   //Aqui estava tentanto utiliazar a gravação de configuração de tamanho de campo para ajustar as colunas
         if DBGrid.Columns[k].FieldName=TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].FieldName then
         begin
          cdsColunas.FieldByName('TAMANHOCAMPO').AsInteger:= DBGrid.Columns[k].Width;// DataSource.DataSet.FindField(TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].FieldName));
          cdsColunas.FieldByName('FIELDNAME').AsString:=DBGrid.Columns[k].FieldName;
          break;
         end;}
      cdsColunas.Post;
    end
    else
    begin
      cdsColunas.Insert;
      cdsColunas.FieldByName('usuario').AsString := vUsuario;
      cdsColunas.FieldByName('componente').AsString := nomeDTSEt;
      cdsColunas.FieldByName('campos').AsString := TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Name;
      cdsColunas.FieldByName('ordem').AsInteger :=
        TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Index;
      if TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Tag = 1 then
        cdsColunas.FieldByName('visivel').AsInteger := 0
      else
        cdsColunas.FieldByName('visivel').AsInteger := 1;
      cdsColunas.Post;
      cdsColunas.ApplyUpdates(-1);
    end;
  end;
  if cdsColunas.ChangeCount > 0 then
  begin
    cdsColunas.ApplyUpdates(-1);
    trans.Commit;
    trans.StartTransaction;
  end;
end;

procedure TfrmControleAlmoxarifado.IniciarVenda;
begin
  EstoqueFechado.vPedvenda.inserirVenda(false);
  EstoqueFechado.vPedvenda.dataSet.FieldByName('cod_cliente').Value := Null;
  EstoqueFechado.vPedvenda.dataSet.FieldByName('tipv').AsString := TipoVenda.dataSet.FieldByName('SIGLA').AsString;
  EstoqueFechado.vPedvenda.dataSet.FieldByName('cod_cond_pag').AsInteger := CondPagamento.dataSet.FieldByName('cod_cond_pag').AsInteger;

  EstoqueFechado.vPedvenda.vCondPag.Insert;
  EstoqueFechado.vPedvenda.vCondPag.dataSet.FieldByName('SEQPRECO').AsString := CondPagamento.dataSet.FieldByName('SEQPRECO').AsString;

  if (Edit3.Enabled) and (vDadosIni.vEmp.vClienteAlmox = 'S') then
  begin
    EstoqueFechado.vPedvenda.dataSet.FieldByName('cod_cliente').AsInteger := StrToInt(Edit3.Text);

    EstoqueFechado.vPedvenda.vCliente.abreClientes(StrToInt(Edit3.Text));

    EstoqueFechado.vPedvenda.vCliente.Insert;

    if not (EstoqueFechado.vPedvenda.vCliente.dataSet.State in [dsInsert, dsEdit]) then
     EstoqueFechado.vPedvenda.vCliente.dataSet.Insert;
    EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_cliente').AsInteger := StrToInt(Edit3.Text);
    EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_localidade').AsInteger := Cliente.dataSet.FieldByName('cod_localidade').AsInteger;
    EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_cidade').AsInteger := Cliente.dataSet.FieldByName('cod_cidade').AsInteger;
    EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger := Cliente.dataSet.FieldByName('cod_tab_preco').AsInteger;
    EstoqueFechado.vPedvenda.vItProd._setaVariaveisPromocao(EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_localidade').AsInteger,
    EstoqueFechado.vPedvenda.dataSet.FieldByName('cod_cliente').AsInteger, EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
    EstoqueFechado.vPedvenda.dataSet.FieldByName('cod_cond_pag').AsInteger, EstoqueFechado.vPedvenda.vCliente.dataSet.FieldByName('cod_cidade').AsInteger, EstoqueFechado.vPedvenda.dataSet.FieldByName('TIPV').AsString);
  end
  else
  begin
    EstoqueFechado.vPedvenda.vItProd._setaVariaveisPromocao(0, 0, 0, EstoqueFechado.vPedvenda.dataSet.FieldByName('cod_cond_pag').AsInteger, 0, EstoqueFechado.vPedvenda.dataSet.FieldByName('TIPV').AsString);
  end;
end;

procedure TfrmControleAlmoxarifado.lbBairroPrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vBairro;
end;

procedure TfrmControleAlmoxarifado.lbCepPrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vCEP;
end;

procedure TfrmControleAlmoxarifado.lbCidadePrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vCidade;
end;

procedure TfrmControleAlmoxarifado.lbCNPJPrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vCNPJ;
end;

procedure TfrmControleAlmoxarifado.lbEmpresaPrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmControleAlmoxarifado.lbenderecoPrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vEndereco;
end;

procedure TfrmControleAlmoxarifado.lbFonePrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vTelefone;
end;

procedure TfrmControleAlmoxarifado.leConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      vTemp := Registro.ReadString('Campo');
      if (vCampoPadrao = '') and (vTemp <> '') then
        ComboBox1.Text := vTemp;
      vTemp := Registro.ReadString('Condicao');
      if vTemp <> '' then
        ComboBox3.Text := vTemp;
      vTemp := Registro.ReadString('DataIni');
      if vTemp <> '' then
        MaskEdit1.Text := vTemp;
      vTemp := Registro.ReadString('DataFim');
      if vTemp <> '' then
        MaskEdit2.Text := vTemp;
      vTemp := Registro.ReadString('PalavraChave');
//      if vTemp <> '' then
//        MaskEdit3.Text := vTemp;
      try
//        MaskEdit1.Visible := Registro.ReadBool('MaskEdit1');
//        MaskEdit2.Visible := Registro.ReadBool('MaskEdit2');
//        MaskEdit3.Visible := Registro.ReadBool('MaskEdit3');
      except
//        MaskEdit1.Visible := false;
//        MaskEdit2.Visible := false;
//        MaskEdit3.Visible := true;
//        MaskEdit3.EditMask:='';
      end;
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;

end;

procedure TfrmControleAlmoxarifado.mostraColunas(DBGrid: TDBGrid; trans: TIBTransaction);
var
  Settings: TIniFile;
  i, idx, j, menor: integer;
  temp: string;
begin

  cdsColunas.IndexFieldNames := 'USUARIO;CAMPOS';
  try
    if cdsColunas = nil then
      exit;
    if DBGrid.DataSource = nil then
      exit;
    if not cdsColunas.IsEmpty then
    begin
      for I := 0 to TClientDataSet(DBGrid.DataSource.DataSet).FieldCount - 1 do
      begin
        cdsColunas.FindNearest([vUsuario,
          cripSettings(TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Name)]);
        if (cdsColunas.FieldByName('campos').AsString =
          cripSettings(TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Name)) and
          ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(vUsuario)) then
        begin
          if (TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Tag = 0) or (TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Tag = 3) then
            TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Visible :=
              (cdsColunas.FieldByName('visivel').AsInteger = 1)
          else if (TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Tag = 1) then
            TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Visible := false
          else if (TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Tag = 2) then
            TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Visible := true;
        end;
      end;
    end
    else
    begin
      for I := 0 to TClientDataSet(DBGrid.DataSource.DataSet).FieldCount - 1 do
      begin
        if (TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Tag = 0) then
          TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Visible := True
        else if (TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Tag = 1) then
          TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Visible := False
        else if (TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Tag = 2) then
          TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Visible := True
        else if (TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Tag = 3) then
          TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Visible := false;
      end;
    end;

    if not cdsColunas.IsEmpty then
    begin
      temp := cdsColunas.IndexFieldNames;
      cdsColunas.IndexFieldNames := 'USUARIO;COMPONENTE;ORDEM';
      cdsColunas.First;
      cdsColunas.FindNearest([trim(vUsuario), nomeDTSEt, cdsColunas.FieldByName('ordem').AsInteger]);
      while not cdsColunas.Eof do
      begin
        if cdsColunas.FieldByName('ordem').AsInteger > -1 then
          for I := TClientDataSet(DBGrid.DataSource.DataSet).FieldCount - 1 downto 0 do
            if (TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Name =
              cdsColunas.FieldByName('campos').AsString) and
              ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(vUsuario)) then
            begin
              TClientDataSet(DBGrid.DataSource.DataSet).Fields[i].Index :=
                cdsColunas.FieldByName('ordem').AsInteger;
              Break;
            end;
        cdsColunas.Next;
        if cdsColunas.FieldByName('componente').AsString <> nomeDTSEt then
          Break;
      end;
      cdsColunas.IndexFieldNames := temp;
    end;
  finally
  end;
end;

procedure TfrmControleAlmoxarifado.ReajustarLarguradascolunas1Click(
  Sender: TObject);
begin
  if (PageControl1.ActivePage = tsControleVendedor) then
    AjustaLaguraColunas(DBGrid1)
  else
    AjustaLaguraColunas(DBGrid2);
end;

procedure TfrmControleAlmoxarifado.resetarConfiguracoesDeColunas(trans: TIBTransaction);
begin
  if Application.MessageBox('Você deverá sair sistema para que as alterações tenham efeito. Deseja continuar?', 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  cdsColunas.Close;
  cdsColunas.CommandText := 'select * from config_colunas where usuario = ' +
    QuotedStr(vUsuario)+' and componente = '+QuotedStr(nomeDTSEt);
  cdsColunas.Open;

  while not cdsColunas.IsEmpty do
    cdsColunas.Delete;

  cdsColunas.ApplyUpdates(-1);

  trans.Commit;
  trans.StartTransaction;
  fReset := True;
end;

procedure TfrmControleAlmoxarifado.ResetarConfiguraesdecolunas1Click(
  Sender: TObject);
begin
  inherited;
  resetarConfiguracoesDeColunas(trans);
end;

procedure TfrmControleAlmoxarifado.SalvardadosnoExcel1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if (PageControl1.ActivePage = tsControleVendedor) then
      vDadosIni.montarExcel(DBGrid1, 'CARRINHO DE COMPRA VENDEDOR')
    else
      vDadosIni.montarExcel(DBGrid2, 'ALMOXARIFADO');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmControleAlmoxarifado.ScrollBox1Enter(Sender: TObject);
begin
  inherited;
  vConfigColuna := true;
end;

procedure TfrmControleAlmoxarifado.ScrollBox1Exit(Sender: TObject);
begin
  inherited;
   if (cdsColunas = nil) or (not cdsColunas.Active) or (not vConfigColuna) then
    exit;
  gravaConfiguracaoUsuario(DBGrid2, trans, ScrollBox1);
  GroupBox4.Visible := false;
  mostraColunas(DBGrid2, trans);
end;

procedure TfrmControleAlmoxarifado.ScrollBox2Enter(Sender: TObject);
begin
  inherited;
   vConfigColuna := true;
end;

procedure TfrmControleAlmoxarifado.ScrollBox2Exit(Sender: TObject);
begin
  if (cdsColunas = nil) or (not cdsColunas.Active) or (not vConfigColuna) then
    exit;
  gravaConfiguracaoUsuario(DBGrid1, trans, ScrollBox2);
  GroupBox3.Visible := false;
  mostraColunas(DBGrid1, trans);
end;

procedure TfrmControleAlmoxarifado.SetarValorProd(Sender: TObject);
var
	vTABPRATICADA: string;
begin
	vTABPRATICADA := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString;

  if not verificarDescontoTabDifPromPrecoQtde(EditHw1.AsValue) then
  begin
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(sender).CanFocus) then
      TDBEdit(sender).SetFocus;
    exit;
  end;

  if EditHw1.AsValue > 0 then
  begin
//    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat :=
//      EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat :=
      EditHw1.AsValue;
    EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLTOT_PED_ITEM').AsFloat :=
      EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat * EditHw1.AsValue;

    EstoqueFechado.dataSet.FieldByName('VLUN').AsFloat :=
      EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat;

    EstoqueFechado.dataSet.FieldByName('VLTOT').AsFloat :=
      EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLTOT_PED_ITEM').AsFloat;

    if not EstoqueFechado.vPedvenda.vItProd._validarAlteracaoPrecoUnitario(vTABPRATICADA) then
    begin
      if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
        EditHw1.SetFocus;
      EditHw1.AsValue := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
    end;
  end;
end;

procedure TfrmControleAlmoxarifado.setTClientDataSet(dtSet: TClientDataSet;
  nomeUsuario: string; transacao: TIBTransaction; pAlterarNomeDtSet: string);
begin
  //Chamar este método em cada formulário no evento onshow depois do datasourse do dbgrid já setado e antes do 'inherited'
  vAlterarNomeDtSet := pAlterarNomeDtSet;
  cdsColunas := TClientDataSet(dtSet);
  trans := TIBTransaction(transacao);

  if (PageControl1.ActivePage = tsControleVendedor) then
  begin
    DBGrid1.Columns.Clear;
    nomeDTSEt := 'Vendedor'+TClientDataSet(DBGrid1.DataSource.DataSet).Name+vAlterarNomeDtSet;
  end
  else
  begin
    DBGrid2.Columns.Clear;
    nomeDTSEt := 'Almox'+TClientDataSet(DBGrid2.DataSource.DataSet).Name+vAlterarNomeDtSet;
  end;
  vUsuario := nomeUsuario;
  cdsColunas.Close;
  cdsColunas.CommandText := 'select * from config_colunas where usuario = ' +
    QuotedStr(nomeUsuario)+' and componente = '+QuotedStr(nomeDTSEt);
  cdsColunas.Open;

  if (PageControl1.ActivePage = tsControleVendedor) then
  begin
    if DBGrid1.DataSource <> nil then
      criaChecksColunas(TClientDataSet(DBGrid1.DataSource.DataSet), ScrollBox2);
    mostraColunas(DBGrid1, transacao);
  end
  else
  begin
    if DBGrid2.DataSource <> nil then
      criaChecksColunas(TClientDataSet(DBGrid2.DataSource.DataSet), ScrollBox1);
    mostraColunas(DBGrid2, transacao);
  end;
end;

procedure TfrmControleAlmoxarifado.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
      exit;

    if EstoqueFechado.dataSet.State <> dsInsert then
      EstoqueFechado.InserirPeca;

    if EstoqueFechado.dataSet.State in [dsInsert, dsEdit] then
    begin
      Edit2.Text := vDadosIni.vPesquisa;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmControleAlmoxarifado.verificarDescontoTabDifPromPrecoQtde(pValorUn: Double;
  pPerguntar: boolean): boolean;
var
	vAlterar: Boolean;
  vExibirDesconto: string;
  vProcesso: string;
  vMensagem: string;
  vMensagem2: string;
  vAlterouPreco: boolean;
  vValorItem: Double;
begin
	Result := true;
  
  if (EstoqueFechado.dataSet.FieldByName('TABPRATICADA').AsString = 'N') then
  	Exit;

  if (EstoqueFechado.dataSet.FieldByName('TABPRATICADA').AsString <> 'T')
  	and (EstoqueFechado.dataSet.FieldByName('TABPRATICADA').AsString <> 'P')
    and (EstoqueFechado.dataSet.FieldByName('TABPRATICADA').AsString <> 'Q') then
    	Exit;

  if (EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'T') then
  begin
  	vExibirDesconto := vDadosIni.vPedVnd.ExibirDesconto.PrecoDiferenciado;
    vProcesso       := 'VND285';
    vMensagem       := 'Produto definido com preço diferenciado, ';
    vMensagem2      := 'produto possui preço diferenciado';
  end
  else if (EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'P') then
  begin
  	vExibirDesconto := vDadosIni.vPedVnd.ExibirDesconto.PrecoPromocao;
    vProcesso       := 'VND286';
    vMensagem       := 'Produto definido com preço de promoção, ';
    vMensagem2      := 'produto possui preço de promoção';
  end
  else if (EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') then
  begin
  	vExibirDesconto := vDadosIni.vPedVnd.ExibirDesconto.PrecoPromocao;
    vProcesso       := 'VND226';
    vMensagem       := 'Produto definido com preço por quantidade, ';
    vMensagem2      := 'produto possui preço por quantidade';
  end;

  if (vDadosIni.strIn(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString, ['P', 'T', 'Q'])) then // and  (vDescAcresc = 'DESCONTO') then
  begin
  	vValorItem := 0;
  	if EstoqueFechado.vPedVenda.dataSet.FieldByName('TIPV').AsString = 'A' then
      vValorItem := EstoqueFechado.vPedVenda.vItProd.vProduto.dataSet.FieldByName('PREC_PUBLICO').AsCurrency
    else if EstoqueFechado.vPedVenda.vCondPag.dataSet.FieldByName('SEQPRECO').AsString = '1' then
      vValorItem := EstoqueFechado.vPedVenda.vItProd.vProduto.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency
  	else if EstoqueFechado.vPedVenda.vCondPag.dataSet.FieldByName('SEQPRECO').AsString = '2' then
    	vValorItem := EstoqueFechado.vPedVenda.vItProd.vProduto.dataSet.FieldByName('PREC_30_PROD').AsCurrency
    else if EstoqueFechado.vPedVenda.vCondPag.dataSet.FieldByName('SEQPRECO').AsString = '3' then
    	vValorItem := EstoqueFechado.vPedVenda.vItProd.vProduto.dataSet.FieldByName('PREC_60_PROD').AsCurrency
  	else if EstoqueFechado.vPedVenda.vCondPag.dataSet.FieldByName('SEQPRECO').AsString = '4' then
    	vValorItem := EstoqueFechado.vPedVenda.vItProd.vProduto.dataSet.FieldByName('PREC_90_PROD').AsCurrency;

    if vValorItem = 0 then
      vValorItem := EstoqueFechado.vPedVenda.vItProd.vProduto.dataSet.FieldByName('PREC_TAB_PROD').AsCurrency;

  	vAlterouPreco := False;
	  if (vExibirDesconto = 'S')
    	and (not vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
      and (vDadosIni.StrToFloatFormat(vValorItem, 4) >= vDadosIni.StrToFloatFormat(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat, 4)) then
    begin
    	if vDadosIni.StrToFloatFormat(pValorUn, 4) <> vDadosIni.StrToFloatFormat(vValorItem, 4) then
      	vAlterouPreco := True;
    end
    else
    begin
  		if vDadosIni.StrToFloatFormat(pValorUn, 4) <> vDadosIni.StrToFloatFormat(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat, 4) then
      	vAlterouPreco := True;
    end;

    if vAlterouPreco then
    begin
      vDadosIni.vInibeMensPesqPros := 'S';
      if vDadosIni.PesqPros(vProcesso, 'HABILITAR', '', 'PEDVENDA', '', EstoqueFechado.vPedvenda.buscas, False) then
      begin
        if pPerguntar then
          vAlterar := (Application.MessageBox(PChar(vMensagem +
            'deseja alterar o valor do item para preço normal?'),
            'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes)
         else
          vAlterar := False;

        if not vAlterar then
        begin
        	if vDadosIni.StrToFloatFormat(pValorUn, 2) <> vDadosIni.StrToFloatFormat(EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat, 2) then
            EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat :=
              vDadosIni.IfThen(vExibirDesconto = 'S',
                vValorItem,
                EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat);

          EditHw1.AsValue := EstoqueFechado.vPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
          Application.MessageBox(PChar('Não é possível alterar valor do item, ' + vMensagem2 + chr(13) + 'Favor Verificar'),'Atenção', 0 + 64);
          Result := false;
          exit;
        end
        else
        begin
          EstoqueFechado.dataSet.FieldByName('TABPRATICADA').AsString := 'N';
          EstoqueFechado.dataSet.FieldByName('PRECOPORQTDE').AsString := 'N';
          EstoqueFechado.dataSet.FieldByName('VALOR_DESCACRES').AsFloat := 0;
          EstoqueFechado.dataSet.FieldByName('DESC_ITEM').AsFloat := 0;
        end;
      end;
//      else
//      begin
//        Application.MessageBox(PChar('Não é possível alterar valor do item, ' + vMensagem2 + chr(13) + 'Favor Verificar'),'Atenção', 0 + 64);
//        Result := false;
//        exit;
//      end;
    end;
  end;
end;

procedure TfrmControleAlmoxarifado.btSelectResAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    EstoqueFechado.Reserva.ReservaItens._marcarTodos(EstoqueFechado.Reserva.ReservaItens.dtSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmControleAlmoxarifado._mdiAberto(pNomeFormMDI: string): Boolean;
var
  x: Byte;
begin
  Result := False;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := True;
        Application.MessageBox('Venda ja esta aberta, feche a janela da venda para utilizar esta funcionalidade', 'Atenção', 64);
        Exit;
      end;

end;

end.

