unit UCadProdSimilares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo, DBCtrls, DB,
  QRCtrls, QuickRpt, AppEvnts, DBClient, IBDatabase, uEditMoeda;

type
  TFrmCadProdSimilares = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    qrpProdSimilar: TQuickRep;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    groupAdicional: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    RadioGroup3: TRadioGroup;
    DBGrid2: TDBGrid;
    PopupMenu3: TPopupMenu;
    Configurarcolunas2: TMenuItem;
    ResetarConfiguraesdecolunas2: TMenuItem;
    SalvardadosnoExcel2: TMenuItem;
    ReajustarLarguradascolunas2: TMenuItem;
    Copiarparareadetransferncia2: TMenuItem;
    TabSheet5: TTabSheet;
    qrpGrupoProdSimilar: TQuickRep;
    QRBand4: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRBand5: TQRBand;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRBand6: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData4: TQRSysData;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    tsCadastroG: TTabSheet;
    ScrollBoxG: TScrollBox;
    tsCadastroP: TTabSheet;
    ScrollBoxP: TScrollBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label221: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    lbNumFab: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Edit1: TEdit;
    EditNumFab: TEdit;
    Label12: TLabel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    lbNumFabSim: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    EditNumFabSim: TEdit;
    GroupBox6: TGroupBox;
    Panel4: TPanel;
    lbCodigo: TLabel;
    lbDescricao: TLabel;
    DBEditCodigo: TDBEdit;
    DBEditDescricao: TDBEdit;
    PanelProduto: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEditGrupoProd: TDBEdit;
    DBGrid3: TDBGrid;
    DBEditCodigoProd: TDBEdit;
    EditNumFabGrupo: TEdit;
    EditDescrProdGrupo: TEdit;
    pnOpcaoGrupo: TPanel;
    BitBtn_Novo_Produto: TBitBtn;
    BitBtn_Salvar_Produto: TBitBtn;
    BitBtn_Cancelar_Produto: TBitBtn;
    BitBtn_Excluir_Produto: TBitBtn;
    SpeedButton59: TSpeedButton;
    pnCorPrinc: TPanel;
    PopupMenuGrupoSim: TPopupMenu;
    AlterarProdPrincipal: TMenuItem;
    lbTextoBotaoDireito: TLabel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    MarcarTodosProdSimilaresClick: TMenuItem;
    DesmarcarTodosProdSimilaresClick: TMenuItem;
    MarcarTodosGrupoSimilaresClick: TMenuItem;
    DesmarcarTodosGrupoSimilaresClick: TMenuItem;
    procedure DesmarcarTodosGrupoSimilaresClickClick(Sender: TObject);
    procedure MarcarTodosGrupoSimilaresClickClick(Sender: TObject);
    procedure DesmarcarTodosProdSimilaresClickClick(Sender: TObject);
    procedure MarcarTodosProdSimilaresClickClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure AlterarProdPrincipalClick(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton59Click(Sender: TObject);
    procedure BitBtn_Excluir_ProdutoClick(Sender: TObject);
    procedure EditNumFabGrupoExit(Sender: TObject);
    procedure EditNumFabGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn_Cancelar_ProdutoClick(Sender: TObject);
    procedure BitBtn_Salvar_ProdutoClick(Sender: TObject);
    procedure BitBtn_Novo_ProdutoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2EditButtonClick(Sender: TObject);
    procedure qrpGrupoProdSimilarPreview(Sender: TObject);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure Copiarparareadetransferncia2Click(Sender: TObject);
    procedure ReajustarLarguradascolunas2Click(Sender: TObject);
    procedure SalvardadosnoExcel2Click(Sender: TObject);
    procedure Configurarcolunas2Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas2Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid2ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure RadioGroup3Click(Sender: TObject);
    procedure groupAdicionalExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure EditNumFabSimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNumFabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNumFabSimExit(Sender: TObject);
    procedure EditNumFabExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure qrpProdSimilarPreview(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gravaConfiguracoesRegistro2(pTipo: string);
    procedure leConfiguracoesRegistro2(pTipo: string);
    procedure configuraShow2(pDBGrid: TDBGrid);
    procedure configuraVisual2(nomeCampo: string);
    procedure fDataseAfterClose(DataSet: TDataSet);
    procedure habilitarCamposProduto(vHab: boolean = false);
  private
    { Private declarations }
    PrimeiraPesquisa2: Boolean;
    cdsColunas2: TClientDataSet;
    trans2: TIBTransaction;
    vTabela2, vCampoPadrao2: string;
    fReset2: boolean;

    cdsGrid2: TClientDataSet;
  	GridCfg2: TDBGrid;
  	ListGridsAndDataSets2: TStrings;
	  ListPositions2: TStrings;

    nomeDTSEt2, vAlterarNomeDtSet2, usuario2: string;
    vCamposPadraoRegistro2: Boolean;
    vCtrlClick, vShiftClick: Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadProdSimilares: TFrmCadProdSimilares;
  ProdSimilar: TProdSimilares;
  GrupoProdSimilares: TGrupoProdSimilares;

implementation

uses Registry, uDataSet_OOP;

{$R *.dfm}

procedure TFrmCadProdSimilares.AlterarProdPrincipalClick(Sender: TObject);
begin
  if not GrupoProdSimilares.vProdGrupo.AlterarProdPrincipal(GrupoProdSimilares) then
	  exit;
end;

procedure TFrmCadProdSimilares.BitBtn1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'PRO138', 'PRO344'),
  	'PESQUISAR', '', vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'PROD_SIMILARES', 'PROD_SIMILARES_GRUPOS'),
    '', ProdSimilar.buscas, true) then
//  if vDadosIni.PesqPros('PRO138', '', ProdSimilar.buscas, true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      inherited;

      if RadioGroup3.ItemIndex = 0 then
    		SpeedButton2.Hint := 'Enviar para Lixeira - [PRO142]'
      else
      	SpeedButton2.Hint := 'Enviar para Lixeira - [PRO349]';

      if RadioGroup3.ItemIndex = 0 then
      begin
      	ProdSimilar.rProdSim.vCampo := ComboBox1.Text;
        ProdSimilar.rProdSim.vCondicao := ComboBox3.Text;
        ProdSimilar.rProdSim.vValor := trim(MaskEdit3.Text);
        ProdSimilar.rProdSim.vCampoAd := ComboBox11.Text;
        ProdSimilar.rProdSim.vValorAd := trim(MaskEdit7.Text);
        ProdSimilar.rProdSim.vDataIni := MaskEdit1.Text;
        ProdSimilar.rProdSim.vDataFim := MaskEdit2.Text;
        ProdSimilar.rProdSim.vDataIniAd := MaskEdit9.Text;
        ProdSimilar.rProdSim.vDataFimAd := MaskEdit8.Text;
        ProdSimilar.rProdSim.vCondicaoAd := ComboBox12.Text;
        ProdSimilar.rProdSim.vPorDataAd := MaskEdit9.Visible;
        ProdSimilar.rProdSim.vAdicional := CheckBox1.Checked;
        ProdSimilar._defineSqlAdicional;

        if MaskEdit2.Visible then
        begin
           if not ProdSimilar.ConsultaCampos('PROD_SIMILARES', ComboBox1.Text,
	           	'PRODUTOS.NUM_FAB_PROD', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
              'PROD_SIMILARES.*, PRODUTOS.NUM_FAB_PROD, PRODUTOS.DESCR_PROD, PR.NUM_FAB_PROD AS NUM_FAB_PROD_SIM ',
              'LEFT JOIN PRODUTOS ON PROD_SIMILARES.GRUPO_PROD = PRODUTOS.GRUPO_PROD ' +
              '	AND PROD_SIMILARES.COD_PROD = PRODUTOS.COD_PROD ' +
              ' AND PROD_SIMILARES.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
              'LEFT JOIN PRODUTOS PR ON PROD_SIMILARES.GRUPO_PS = PR.GRUPO_PROD ' +
              '	AND PROD_SIMILARES.COD_PS = PR.COD_PROD ' +
              ' AND PROD_SIMILARES.COD_EMPRESA = PR.COD_EMPRESA ',
              ProdSimilar.rProdSim.vSqlAdicional) then
              	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            			combobox1.setfocus
        end
        else
        begin
          if not ProdSimilar.ConsultaCampos('PROD_SIMILARES',
            	ProdSimilar.rProdSim.vValor, ComboBox1.Text, combobox3.Text, 'PRODUTOS.NUM_FAB_PROD',
            	true, vDadosIni.codEmpresa,
              'PROD_SIMILARES.*, PRODUTOS.NUM_FAB_PROD, PRODUTOS.DESCR_PROD, PR.NUM_FAB_PROD AS NUM_FAB_PROD_SIM ',
              'LEFT JOIN PRODUTOS ON PROD_SIMILARES.GRUPO_PROD = PRODUTOS.GRUPO_PROD ' +
              '	AND PROD_SIMILARES.COD_PROD = PRODUTOS.COD_PROD ' +
              ' AND PROD_SIMILARES.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
              'LEFT JOIN PRODUTOS PR ON PROD_SIMILARES.GRUPO_PS = PR.GRUPO_PROD ' +
              '	AND PROD_SIMILARES.COD_PS = PR.COD_PROD ' +
              ' AND PROD_SIMILARES.COD_EMPRESA = PR.COD_EMPRESA ',
            ProdSimilar.rProdSim.vSqlAdicional) then
            	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            		ComboBox1.SetFocus
        end;
        ProdSimilar.ultimasql := ProdSimilar.dataSet.CommandText;
        if ProdSimilar.StatusLixeira then
          SpeedButton25.Visible := true
        else
          SpeedButton25.Visible := false;
      end
      else
      begin
        if MaskEdit2.Visible then
        begin
           if not GrupoProdSimilares.ConsultaCampos('PROD_SIMILARES_GRUPOS',
            ComboBox1.Text, 'PROD_SIMILARES_GRUPOS.COD_GRUPO_SIM', maskedit1.text, maskedit2.text,
            vDadosIni.codEmpresa, 1, 'PROD_SIMILARES_GRUPOS.*', '', '') then
            	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            		ComboBox1.SetFocus
        end
        else
        begin
          if not GrupoProdSimilares.ConsultaCampos(
            'PROD_SIMILARES_GRUPOS', MaskEdit3.Text, ComboBox1.Text, combobox3.Text,
            'PROD_SIMILARES_GRUPOS.COD_GRUPO_SIM', true, vDadosIni.codEmpresa,
            'PROD_SIMILARES_GRUPOS.*', '', '') then
            	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          			ComboBox1.SetFocus
        end;
        GrupoProdSimilares.ultimasql := GrupoProdSimilares.dataSet.CommandText;
        if GrupoProdSimilares.StatusLixeira then
          SpeedButton25.Visible := true
        else
          SpeedButton25.Visible := false;
      end;
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      Screen.Cursor := crDefault;

      if CheckBox1.Checked then
      	CheckBox1.Checked := false;

      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	      DBGrid1.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
	      DBGrid2.SetFocus
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadProdSimilares.BitBtn3Click(Sender: TObject);
begin
	pnCorPrinc.Visible := not vDadosIni.vProdSimilar.vSimilaresEntreSi;
  lbTextoBotaoDireito.Visible := not vDadosIni.vProdSimilar.vSimilaresEntreSi;
  if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
	  DBGrid3.PopupMenu := PopupMenuGrupoSim
  else
  	DBGrid3.PopupMenu := nil;
  if RadioGroup3.ItemIndex = 0 then
  begin
    if ProdSimilar.Insert then
    begin
      inherited;
//      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := tsCadastroP;
      tsCadastroP.Show;
      Edit1.Text := '';
      EditNumFab.Text := '';
      EditNumFabSim.Text := '';
      ProdSimilar.PreencheCampos;
      TabSheet3.Caption := 'Cadastrando um novo produto similar';
      if (Self.Enabled) and (Self.Visible) and (EditNumFab.CanFocus) then
        EditNumFab.SetFocus;
    end;
  end
  else
  begin
    if GrupoProdSimilares.Insert then
    begin
      inherited;
//      tsCadastroG.TabVisible := true;
      PageControl3.ActivePage := tsCadastroG;
      tsCadastroG.Show;
      tsCadastroG.Caption := 'Cadastrando um novo grupo de produto similar';
      habilitarCamposProduto;
      if (Self.Enabled) and (Self.Visible) and (DBEditDescricao.CanFocus) then
        DBEditDescricao.SetFocus;
    end;
  end;
end;

procedure TFrmCadProdSimilares.BitBtn4Click(Sender: TObject);
begin
  activecontrol := BitBtn4;
  if RadioGroup3.ItemIndex = 0 then
  begin
    if not ProdSimilar.post then
      setFocusCampoErro(ProdSimilar.vNomeCampoErro, ProdSimilar.vMensagemErro)
    else
    begin
      if CheckCadSeq.Checked then
      begin
        if ProdSimilar.Insert then
        begin
          ProdSimilar.PreencheCampos;
          Edit1.Clear;
          EditNumFab.Clear;
          EditNumFabSim.Clear;
          if (Self.Enabled) and (Self.Visible) and (EditNumFab.CanFocus) then
            EditNumFab.SetFocus;
        end;
        MudaCor;
      end
      else
        inherited;
    end;
  end
  else
  begin
    if not GrupoProdSimilares.post then
      setFocusCampoErro(GrupoProdSimilares.vNomeCampoErro, GrupoProdSimilares.vMensagemErro)
    else
    begin
      if CheckCadSeq.Checked then
      begin
        if GrupoProdSimilares.Insert then
        begin
          if (Self.Enabled) and (Self.Visible) and (DBEditDescricao.CanFocus) then
            DBEditDescricao.SetFocus;
        end;
        MudaCor;
      end
      else
        inherited;
    end;
  end;
end;

procedure TFrmCadProdSimilares.BitBtn5Click(Sender: TObject);
begin
  ActiveControl := BitBtn5;
  if RadioGroup3.ItemIndex = 0 then
  begin
    if vDadosIni.PesqPros('PRO146', 'CANCELAR', '','PROD_SIMILARES',ProdSimilar.dataSet.FieldByName('GRUPO_PS').asstring + '-' + ProdSimilar.dataSet.FieldByName('COD_PS').asstring, ProdSimilar.buscas, true) then
  //  if vDadosIni.PesqPros('PRO146', ProdSimilar.dataSet.FieldByName('GRUPO_PS').asstring + '-' + ProdSimilar.dataSet.FieldByName('COD_PS').asstring, ProdSimilar.buscas, true) then
    begin
      inherited;
      TabSheet2.Show;
      ProdSimilar.Cancel;
      ProdSimilar.RollBackTransacao;
    end;
  end
  else
  begin
    inherited;
    TabSheet2.Show;
    GrupoProdSimilares.Cancel;
    GrupoProdSimilares.RollBackTransacao;
  end;
end;

procedure TFrmCadProdSimilares.BitBtn_Cancelar_ProdutoClick(Sender: TObject);
begin
  inherited;
  GrupoProdSimilares.vProdGrupo.Cancel;
  GrupoProdSimilares.vProdGrupo.RollBackTransacao;

  habilitarCamposProduto;
end;

procedure TFrmCadProdSimilares.BitBtn_Excluir_ProdutoClick(Sender: TObject);
begin
	if not GrupoProdSimilares.vProdGrupo.Delete(GrupoProdSimilares) then
  	exit;
end;

procedure TFrmCadProdSimilares.BitBtn_Novo_ProdutoClick(Sender: TObject);
begin
  inherited;
//  if (GrupoProdSimilares.dataSet.State in [dsInsert]) then
//  begin
//  	if not GrupoProdSimilares.post(false) then
//    begin
//    	setFocusCampoErro(GrupoProdSimilares.vNomeCampoErro, GrupoProdSimilares.vMensagemErro);
//  		exit;
//    end;
//
//  	habilitarCamposProduto;
//    GrupoProdSimilares.vProdGrupo.abreGrupoProdSimilaresItens(
//    	GrupoProdSimilares.dataSet.FieldByName('COD_GRUPO_SIM').AsInteger);
//  end;

  EditNumFabGrupo.Text := '';
  EditDescrProdGrupo.Text := '';
  if not GrupoProdSimilares.vProdGrupo.Insert(GrupoProdSimilares) then
  	exit;

  habilitarCamposProduto(true);
  if (Self.Enabled) and (Self.Visible) and (EditNumFabGrupo.CanFocus) then
  	EditNumFabGrupo.SetFocus;  
end;

procedure TFrmCadProdSimilares.BitBtn_Salvar_ProdutoClick(Sender: TObject);
begin
  if (GrupoProdSimilares.dataSet.State in [dsInsert]) then
  	if trim(GrupoProdSimilares.dataSet.FieldByName('DESCR_GRUPO').AsString) = '' then
      GrupoProdSimilares.dataSet.FieldByName('DESCR_GRUPO').AsString :=
      	trim(GrupoProdSimilares.vProdGrupo.dataSet.FieldByName('DESCR_PROD').AsString);

  if not GrupoProdSimilares.vProdGrupo.Post(GrupoProdSimilares) then
  begin
  	setFocusCampoErro(GrupoProdSimilares.vProdGrupo.vNomeCampoErro, GrupoProdSimilares.vProdGrupo.vMensagemErro);
  	exit;
  end;

  habilitarCamposProduto;
  if (Self.Enabled) and (Self.Visible) and (BitBtn_Novo_Produto.CanFocus) then
  	BitBtn_Novo_Produto.SetFocus;
end;

procedure TFrmCadProdSimilares.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    if RadioGroup3.ItemIndex = 0 then
      ProdSimilar._marcarTodos
    else
    	GrupoProdSimilares._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadProdSimilares.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    if RadioGroup3.ItemIndex = 0 then
      ProdSimilar._desmarcarTodos
    else
    	GrupoProdSimilares._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadProdSimilares.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
    groupAdicional.Visible := CheckBox1.Checked
  else
    groupAdicional.Visible := not CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;

  if (Self.Enabled) and (Self.Visible) and (combobox11.CanFocus) then
  	ComboBox11.SetFocus;
end;

procedure TFrmCadProdSimilares.Configurarcolunas2Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas2, DBGrid2, GridCfg2, cdsGrid2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmCadProdSimilares.configuraShow2(pDBGrid: TDBGrid);
var
  I: Integer;
  naoOrdenar: boolean;
  vAlterarNomeDtSet: string;
  nomeDTSEt: string;
  vTabela: string;
  vCamposPadraoRegistro: boolean;
  vCampoPadrao: string;
  vCtrlClick: boolean;
{$IFDEF VER300}
  ShortDateFormat: string;
{$ENDIF}
begin
{$IFDEF VER300}
  ShortDateFormat := FormatSettings.ShortDateFormat;
{$ENDIF}
  PageControl1.Height := ClientHeight;
  PageControl1.Width := Width;
  Splitter2.Left := Width;
//  PanelLeft.Width := Width;
//  PanelFlash.left := Width;

  if vShow <> 1 then
    top := 0;

  vShow := 1;

  CheckCadSeq.Font.Color := clTeal;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  GroupBox3.Height := 73;
  naoOrdenar := true;

  naoOrdenar := false;

  ComboBox1.Clear;
  ComboBox2.Clear;
  if pDBGrid.DataSource <> nil then
  begin
    for I := 0 to TClientDataSet(pDBGrid.DataSource.DataSet).FieldCount - 1 do
    begin
      if (TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].Visible) and
        (TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].FieldKind = fkData) then
        ComboBox1.Items.Add(TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].DisplayName);
//      if vTabela = 'PRODUTOS' then
//      begin
//        if (TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao) then
//          ComboBox1.Text := TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].DisplayName;
//      end
//      else if vTabela = 'CLIENTES' then
//      begin
//        if (TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao) then
//          ComboBox1.Text := TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].DisplayName;
//      end
//      else if vTabela = 'VEICULOS' then
//      begin
//        if (TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao) then
//          ComboBox1.Text := TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].DisplayName;
//      end
//      else
        ComboBox1.Text := 'Todos';
    end;
  end;
  ComboBox1.Sorted := True;
  ComboBox2.Items := ComboBox1.Items;
  ComboBox1.Items.Add('Todos');
  ComboBox2.Text := ComboBox2.Items[0];
  if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
  	ComboBox1.SetFocus;
  if pDBGrid.DataSource <> nil then
  begin
    leConfiguracoesRegistro2(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'P', 'G'));
    nomeDTSEt := TClientDataSet(pDBGrid.DataSource.DataSet).Name+vAlterarNomeDtSet;
    if (vTabela <> '') and (not vCamposPadraoRegistro) then
    begin
      for I := 0 to TClientDataSet(pDBGrid.DataSource.DataSet).FieldCount - 1 do
        if TClientDataSet(pDBGrid.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao then
        begin
          try
            vCtrlClick := True;
            if RadioGroup3.ItemIndex = 0 then
	            DBGrid1TitleClick(pDBGrid.Columns[i])
            else
            	DBGrid2TitleClick(pDBGrid.Columns[i]);
          finally
            vCtrlClick := False;
          end;
          break;
        end;
    end
    else
    begin
    	for I := 0 to pDBGrid.FieldCount - 1 do   //      DBGrid1TitleClick(pDBGrid.Columns[0]);
        if pDBGrid.Fields[i].DisplayName = ComboBox1.Text then
        begin
           try
            vCtrlClick := True;
            if RadioGroup3.ItemIndex = 0 then
	            DBGrid1TitleClick(pDBGrid.Columns[i])
            else
            	DBGrid2TitleClick(pDBGrid.Columns[i]);
          finally
            vCtrlClick := False;
          end;
           break;
        end;
    end;
  end;
  if not Self.KeyPreview then
    Self.KeyPreview := true;

  if uppercase(ShortDateFormat[1]) <> 'D' then
    ShortDateFormat := 'dd/mm/yyyy';
  for i := 0 to ComponentCount - 1 do //Testando aqui se o form tem algum campo MaskEdit.
  begin
    if (Components[i] is TMaskEdit) then
      if (pos('  /  /    ', TMaskEdit(Components[i]).Text) <> 0) or
        (pos('  -  -    ', TMaskEdit(Components[i]).Text) <> 0) or
        (pos('  .  .    ', TMaskEdit(Components[i]).Text) <> 0) then
      begin
        if (length(ShortDateFormat) <= 8) and (pos('yyyy', ShortDateFormat) = 0) then
        begin
          TMaskEdit(Components[i]).EditMask := '!99/99/00;1;_';
          TMaskEdit(Components[i]).Text := datetostr(date);
        end
        else
        begin
          TMaskEdit(Components[i]).EditMask := '!99/99/0000;1;_';
          TMaskEdit(Components[i]).Text := datetostr(date);
        end;
      end;
  end;
end;

procedure TFrmCadProdSimilares.configuraVisual2(nomeCampo: string);
var
  i: integer;
  vNomeCampo: string;
  vDisplay: Boolean;
  CampoEncontrado: Boolean;
{$IFDEF VER300}
  ShortDateFormat: string;
{$ENDIF}
begin
  if DBGrid2.DataSource = nil then
    Exit;

{$IFDEF VER300}
  ShortDateFormat := FormatSettings.ShortDateFormat;
{$ENDIF}
  vNomeCampo := nomeCampo;
  vDisplay := Pos('*', vNomeCampo) > 0;
  if vDisplay then
    vNomeCampo := Copy(vNomeCampo, 2,length(vNomeCampo));

  CampoEncontrado := False;

    for I := 0 to TClientDataSet(DBGrid2.DataSource.DataSet).FieldCount - 1 do
    begin
      if ((TClientDataSet(DBGrid2.DataSource.DataSet).Fields[i].FieldName = vNomeCampo) and (not vDisplay)) or
      ((TClientDataSet(DBGrid2.DataSource.DataSet).Fields[i].DisplayLabel = vNomeCampo) and (vDisplay)) then
      begin
        CampoEncontrado := True;
        if TClientDataSet(DBGrid2.DataSource.DataSet).Fields[i] is TDateTimeField then
        begin
          MaskEdit3.Visible := false;
          MaskEdit1.Visible := true;
          MaskEdit2.Visible := true;
          Label4.Visible := true;
          if (uppercase(ShortDateFormat[1]) <> 'D') or (length(ShortDateFormat) > 10) then
            if pos('.', ShortDateFormat) <> 0 then
              ShortDateFormat := 'dd.mm.yyyy'
            else
              ShortDateFormat := 'dd/mm/yyyy';
          if (length(ShortDateFormat) <= 8) and (pos('yyyy', ShortDateFormat) = 0) then
          begin
            MaskEdit1.EditMask := '!99/99/00;1;_';
            MaskEdit2.EditMask := '!99/99/00;1;_';
            if MaskEdit1.Text = '  /  /  ' then
              MaskEdit1.Text := DateToStr(Date);
            if MaskEdit2.Text = '  /  /  ' then
              MaskEdit2.Text := DateToStr(Date);
          end
          else
          begin
            MaskEdit1.EditMask := '!99/99/0000;1;_';
            MaskEdit2.EditMask := '!99/99/0000;1;_';
            if MaskEdit1.Text = '  /  /    ' then
              MaskEdit1.Text := DateToStr(Date);
            if MaskEdit2.Text = '  /  /    ' then
              MaskEdit2.Text := DateToStr(Date);
          end;
          ComboBox1.Text := TClientDataSet(DBGrid2.DataSource.DataSet).Fields[i].DisplayLabel;
          ComboBox2.Text := TClientDataSet(DBGrid2.DataSource.DataSet).Fields[i].DisplayLabel;
          Break;
        end
        else
        begin
          MaskEdit3.Visible := true;
          MaskEdit1.Visible := false;
          MaskEdit2.Visible := false;
          Label4.Visible := true;
          MaskEdit3.EditMask := TClientDataSet(DBGrid2.DataSource.DataSet).Fields[i].EditMask;
          ComboBox1.Text := TClientDataSet(DBGrid2.DataSource.DataSet).Fields[i].DisplayLabel;
          ComboBox2.Text := TClientDataSet(DBGrid2.DataSource.DataSet).Fields[i].DisplayLabel;
          Break;
        end;
      end;
    end;
  if not CampoEncontrado then
  begin
    MaskEdit3.Visible := True;
    MaskEdit1.Visible := False;
    MaskEdit2.Visible := False;
    Label4.Visible := True;
    MaskEdit3.EditMask := '';
  end;
  if (ActiveControl <> BitBtn1) and (ActiveControl <> BitBtn3) then
    if (Self.Enabled) and (Self.Visible) and (MaskEdit1.canfocus) then
       MaskEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit3.canfocus) then
      MaskEdit3.SetFocus;
end;

procedure TFrmCadProdSimilares.Copiarparareadetransferncia2Click(
  Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGrid2);
end;

procedure TFrmCadProdSimilares.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    ProdSimilar._marcaDesmarcaLinha;
end;

procedure TFrmCadProdSimilares.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
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
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdSimilares.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not ProdSimilar.dataSet.IsEmpty then
      ProdSimilar._marcaDesmarcaLinha;
end;

procedure TFrmCadProdSimilares.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    GrupoProdSimilares._marcaDesmarcaLinha;
end;

procedure TFrmCadProdSimilares.DBGrid2ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
		cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmCadProdSimilares.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
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
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdSimilares.DBGrid2EditButtonClick(Sender: TObject);
var
  I: Integer;
  formMemo: TForm;
begin
  for I := 0 to DBGrid2.Columns.Count - 1 do
    if DBGrid2.Columns[I].FieldName = DBGrid2.SelectedField.FieldName then
    begin
      try
        formMemo := TForm.Create(Application);
        formMemo.Position := poScreenCenter;
        formMemo.Caption := DBGrid2.Columns[I].Title.Caption;
        pnMemo.Parent := formMemo;
        formMemo.AutoSize := True;
        formMemo.AutoScroll := False;
        formMemo.KeyPreview := True;
        formMemo.BorderIcons:=[biSystemMenu];

        listGrid.Clear;
        listGrid.Items.Text := DBGrid2.SelectedField.AsString;

        formMemo.ShowModal;

      finally
        pnMemo.Parent := tsMEmo;
        formMemo.Free;
        formMemo := nil;
      end;
    end;
end;

procedure TFrmCadProdSimilares.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  vCtrlClick := Key = VK_CONTROL;
  vShiftClick := Key = VK_SHIFT;
  vDadosIni.vShiftClick := Key = VK_SHIFT;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not GrupoProdSimilares.dataSet.IsEmpty then
      GrupoProdSimilares._marcaDesmarcaLinha;
end;

procedure TFrmCadProdSimilares.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  if TClientDataSet(DBGrid2.DataSource.DataSet) <> nil then
    TClientDataSet(DBGrid2.DataSource.DataSet).AfterClose := fDataseAfterClose;

  if (Column.Field<>nil) and (Column.Field.FieldKind = fkInternalCalc) then
    exit;
  if DBGrid2.DataSource = nil then
    exit;
  if vCtrlClick then
  begin
    configuraVisual2(Column.FieldName);
    vCtrlClick:=false;
    exit;
  end;

	vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TFrmCadProdSimilares.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
    if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('PRINCIPAL').AsString)) = 'S') then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnCorPrinc.Color;
        TDBGrid(sender).canvas.Font.color := clWhite;
      end;
    end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadProdSimilares.DesmarcarTodosGrupoSimilaresClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    if RadioGroup3.ItemIndex = 0 then
      ProdSimilar._desmarcarTodos
    else
    	GrupoProdSimilares._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadProdSimilares.DesmarcarTodosProdSimilaresClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    if RadioGroup3.ItemIndex = 0 then
      ProdSimilar._desmarcarTodos
    else
    	GrupoProdSimilares._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadProdSimilares.EditNumFabExit(Sender: TObject);
begin
	try
    inherited;
    if not (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (activecontrol <> BitBtn4) then
      exit;

    if trim(ProdSimilar.vCodBarra) <> trim(EditNumFab.Text) then
    begin
      ProdSimilar.dataSet.FieldByName('GRUPO_PROD').AsInteger := 0;
      ProdSimilar.dataSet.FieldByName('COD_PROD').AsString := '';
    end;

    if trim(TEdit(Sender).Text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
        begin
        	EditNumFab.Text := trim(vDadosIni.vPesquisa);
          if ProdSimilar.LocProduto(vDadosIni.vPesquisa, false,
          	ProdSimilar.dataSet.FieldByName('GRUPO_PROD').AsInteger,
            ProdSimilar.dataSet.FieldByName('COD_PROD').AsString) then
          begin
            Edit1.Text := trim(ProdSimilar.DescrProd);
            EditNumFab.Text := trim(ProdSimilar.NumFabrProd);
          end
          else
          begin
            Edit1.Text := trim(ProdSimilar.DescrProd);
            EditNumFab.Text := trim(ProdSimilar.NumFabrProd);
            if (Self.Enabled) and (Self.Visible) and (EditNumFab.CanFocus) then
             EditNumFab.SetFocus;
          end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else
    begin
      if ProdSimilar.LocProduto(EditNumFab.Text, false,
      	ProdSimilar.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      	ProdSimilar.dataSet.FieldByName('COD_PROD').AsString) then
      begin
        Edit1.Text := trim(ProdSimilar.DescrProd);
        EditNumFab.Text := trim(ProdSimilar.NumFabrProd);
      end
      else
      begin
        Edit1.Text := trim(ProdSimilar.DescrProd);
        EditNumFab.Text := trim(ProdSimilar.NumFabrProd);
        if (Self.Enabled) and (Self.Visible) and (EditNumFab.CanFocus) then
         EditNumFab.SetFocus;
      end;
    end;
  finally
    ProdSimilar.vCodBarra := trim(EditNumFab.Text); 
  end;
end;

procedure TFrmCadProdSimilares.EditNumFabGrupoExit(Sender: TObject);
var
  vgrupoprod: Integer;
  vcodprod: string;
begin
	try
    inherited;
    if (activecontrol = BitBtn5) or (activecontrol = BitBtn6) or (activecontrol = BitBtn_Cancelar_Produto) then
      exit;

    if trim(GrupoProdSimilares.vCodBarra) <> trim(EditNumFabGrupo.Text) then
    begin
      GrupoProdSimilares.vProdGrupo.dataSet.FieldByName('GRUPO_PROD').AsInteger := 0;
      GrupoProdSimilares.vProdGrupo.dataSet.FieldByName('COD_PROD').AsString := '';
    end;

    if trim(TEdit(Sender).Text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        vgrupoprod := 0;
        vcodprod := '';
        if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
          vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
          vcodprod := vDadosIni.vPesquisaCod_prod;
        EditNumFabGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.NumFabr);
        if vDadosIni.vPesquisa <> '' then
        begin
          if GrupoProdSimilares.vProdGrupo.LocProduto(vDadosIni.vPesquisa, vgrupoprod, vcodprod) then
          begin
            EditDescrProdGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.DescrProd);
          end
          else
          begin
            EditDescrProdGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.DescrProd);
            if (Self.Enabled) and (Self.Visible) and (EditNumFabGrupo.CanFocus) then
              EditNumFabGrupo.SetFocus;
          end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else
    begin
      if GrupoProdSimilares.vProdGrupo.LocProduto(TEdit(Sender).Text,
        GrupoProdSimilares.vProdGrupo.dataSet.FieldByName('GRUPO_PROD').AsInteger,
        GrupoProdSimilares.vProdGrupo.dataSet.FieldByName('COD_PROD').AsString) then
      begin
        EditNumFabGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.NumFabr);
        EditDescrProdGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.DescrProd);
      end
      else
      begin
        EditNumFabGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.NumFabr);
        EditDescrProdGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.DescrProd);
        if (Self.Enabled) and (Self.Visible) and (EditNumFabGrupo.CanFocus) then
          EditNumFabGrupo.SetFocus;
      end;
    end;
  finally
    GrupoProdSimilares.vCodBarra := trim(EditNumFabGrupo.Text);
  end;
end;

procedure TFrmCadProdSimilares.EditNumFabGrupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vProduto: TProdutos;
  vgrupoprod: Integer;
  vcodprod: string;
begin
	vgrupoprod := 0;
  vcodprod := '';

  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if vDadosIni.vPesquisa <> '' then
      begin
      	if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        	vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        	vcodprod := vDadosIni.vPesquisaCod_prod;
        EditNumFabGrupo.Text := trim(vDadosIni.vPesquisa);// trim(GrupoProdSimilares.vProdGrupo.NumFabr);
        if GrupoProdSimilares.vProdGrupo.LocProduto(vDadosIni.vPesquisa, vgrupoprod, vcodprod) then
        begin
          EditDescrProdGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.DescrProd);
          GrupoProdSimilares.vCodBarra := trim(EditNumFabGrupo.Text);
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if key = VK_F4 then
  begin
    vProduto := TProdutos.create;
    vProduto.CadProdutos(1);
    if (vDadosIni.vPesquisa <> '') then
    begin
    	if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
      if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        vcodprod := vDadosIni.vPesquisaCod_prod;

      if GrupoProdSimilares.vProdGrupo.LocProduto(vDadosIni.vPesquisa, vgrupoprod, vcodprod) then
      begin
      	EditNumFabGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.NumFabr);
      	EditDescrProdGrupo.Text := trim(GrupoProdSimilares.vProdGrupo.DescrProd);
        GrupoProdSimilares.vCodBarra := trim(EditNumFabGrupo.Text);
      end;
    end;
  end;
end;

procedure TFrmCadProdSimilares.EditNumFabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vProduto: TProdutos;
  vgrupoprod: Integer;
  vcodprod: string;
begin
	vgrupoprod := 0;
  vcodprod := '';
  
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if vDadosIni.vPesquisa <> '' then
      begin
      	if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        	vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        	vcodprod := vDadosIni.vPesquisaCod_prod;

        if ProdSimilar.LocProduto(vDadosIni.vPesquisa, false, vgrupoprod, vcodprod) then
        begin
          Edit1.Text := trim(ProdSimilar.DescrProd);
          EditNumFab.Text := trim(ProdSimilar.NumFabrProd);
          ProdSimilar.vCodBarra := EditNumFab.Text;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if key = VK_F4 then
  begin
    vProduto := TProdutos.create;
    vProduto.CadProdutos(1);
    if (vDadosIni.vPesquisa <> '') then
    begin
    	if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
      if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        vcodprod := vDadosIni.vPesquisaCod_prod;

      if ProdSimilar.LocProduto(vDadosIni.vPesquisa, false, vgrupoprod, vcodprod) then
      begin
        Edit1.Text := trim(ProdSimilar.DescrProd);
        EditNumFab.Text := trim(ProdSimilar.NumFabrProd);
        ProdSimilar.vCodBarra := EditNumFab.Text;
      end;
    end;
  end;
end;

procedure TFrmCadProdSimilares.EditNumFabSimExit(Sender: TObject);
begin
	try
    inherited;
    if not (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (activecontrol <> BitBtn4) then
      exit;

    if trim(ProdSimilar.vCodSimBarra) <> trim(EditNumFabSim.Text) then
    begin
      ProdSimilar.dataSet.FieldByName('GRUPO_PS').AsInteger := 0;
      ProdSimilar.dataSet.FieldByName('COD_PS').AsString := '';
    end;

    if trim(TEdit(Sender).Text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
        EditNumFabSim.Text := trim(vDadosIni.vPesquisa);
        if vDadosIni.vPesquisa <> '' then
        begin
          if ProdSimilar.LocProduto(vDadosIni.vPesquisa, true,
            ProdSimilar.dataSet.FieldByName('GRUPO_PS').AsInteger,
            ProdSimilar.dataSet.FieldByName('COD_PS').AsString) then
          begin
            EditNumFabSim.Text := trim(ProdSimilar.NumFabrProdSim);
          end
          else
          begin
            EditNumFabSim.Text := trim(ProdSimilar.NumFabrProdSim);
            if (Self.Enabled) and (Self.Visible) and (EditNumFabSim.CanFocus) then
              EditNumFabSim.SetFocus;
          end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else
    begin
      if ProdSimilar.LocProduto(TEdit(Sender).Text, true,
        ProdSimilar.dataSet.FieldByName('GRUPO_PS').AsInteger,
        ProdSimilar.dataSet.FieldByName('COD_PS').AsString) then
      begin
        EditNumFabSim.Text := trim(ProdSimilar.NumFabrProdSim);
      end
      else
      begin
        EditNumFabSim.Text := trim(ProdSimilar.NumFabrProdSim);
        if (Self.Enabled) and (Self.Visible) and (EditNumFabSim.CanFocus) then
          EditNumFabSim.SetFocus;
      end;
    end;
  finally
    ProdSimilar.vCodSimBarra := trim(EditNumFabSim.Text);
  end;
end;

procedure TFrmCadProdSimilares.EditNumFabSimKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vProduto: TProdutos;
  vgrupoprod: Integer;
  vcodprod: string;
begin
	vgrupoprod := 0;
  vcodprod := '';
  
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if vDadosIni.vPesquisa <> '' then
      begin
      	if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        	vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
        if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        	vcodprod := vDadosIni.vPesquisaCod_prod;

        if ProdSimilar.LocProduto(vDadosIni.vPesquisa, true, vgrupoprod, vcodprod) then
        begin
          EditNumFabSim.Text := trim(ProdSimilar.NumFabrProdSim);
          ProdSimilar.vCodSimBarra := EditNumFabSim.Text;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if key = VK_F4 then
  begin
    vProduto := TProdutos.create;
    vProduto.CadProdutos(1);
    if (vDadosIni.vPesquisa <> '') then
    begin
    	if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        vgrupoprod := StrToInt(vDadosIni.vPesquisaGrupo_prod);
      if trim(vDadosIni.vPesquisaCod_prod) <> '' then
        vcodprod := vDadosIni.vPesquisaCod_prod;

      if ProdSimilar.LocProduto(vDadosIni.vPesquisa, true, vgrupoprod, vcodprod) then
      begin
        EditNumFabSim.Text := trim(ProdSimilar.NumFabrProdSim);
        ProdSimilar.vCodSimBarra := EditNumFabSim.Text;
      end;
    end;
  end;
end;

procedure TFrmCadProdSimilares.fDataseAfterClose(DataSet: TDataSet);
begin
  TClientDataSet(DataSet).IndexName := '';
end;

procedure TFrmCadProdSimilares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  gravaConfiguracoesRegistro2(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'P', 'G'));
  if Assigned(DBGrid2.DataSource) and Assigned(DBGrid2.DataSource.DataSet) then
  begin
//    if not PrimeiraPesquisa2 then
      vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
        cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);

    vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid2, GridCfg2, true, ListPositions2, cdsGrid2);
  end;

  ProdSimilar.Cancel;
  ProdSimilar.RollBackTransacao;
  ProdSimilar.free;

  GrupoProdSimilares.Cancel;
  GrupoProdSimilares.RollBackTransacao;
  GrupoProdSimilares.free;
  Action := caFree;
  FrmCadProdSimilares := nil;
end;

procedure TFrmCadProdSimilares.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  ProdSimilar := TProdSimilares.Create;
  GrupoProdSimilares := TGrupoProdSimilares.Create;
  tsCadastroG.TabVisible := false;
  tsCadastroP.TabVisible := false;
  ProdSimilar.abreProdSimilares(true);
  GrupoProdSimilares.abreGrupoProdSimilares(true);
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  vDadosIni.vShiftClick := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadProdSimilares.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (ProdSimilar.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TFrmCadProdSimilares.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_CONTROL then
    vDadosIni.vCtrlClick := False;
  if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TFrmCadProdSimilares.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsProdSimiliar;
    DBGrid2.DataSource := dtmProdutos.dsGrupoProdSimilares;
    DBGrid2.Align := alClient;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet2, GridCfg2, DBGrid2, cdsGrid2, cdsColunas2, trans2, ListGridsAndDataSets2,
      ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario2);
    PageControl3.ActivePage := TabSheet3;
    inherited;
    leConfiguracoesRegistro2(vDadosIni.IfThen(RadioGroup3.ItemIndex = 0, 'P', 'G'));
    vDadosIni.configurarGridPeloConfigColunas(DBGrid2, GridCfg2, cdsGrid2, cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
    DBGrid1.Visible := RadioGroup3.ItemIndex = 0;
    groupAdicional.Visible := RadioGroup3.ItemIndex = 0;
    CheckBox1.Visible := RadioGroup3.ItemIndex = 0;
    DBGrid2.Visible := RadioGroup3.ItemIndex = 1;
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  RadioGroup3.ItemIndex := vDadosIni.IfThen(vDadosIni.vProdSimilar.vAgruparSimilar, 1, 0);

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "PRO358" PERMITIR INCLUIR PRODUTO SIMILAR EM OUTRO GRUPO DE SIMILARES';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadProdSimilares.gravaConfiguracoesRegistro2(pTipo: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Self.ClassName, True);
      Registro.WriteString('Campo'+pTipo, ComboBox1.Text);
      Registro.WriteString('Condicao'+pTipo, ComboBox3.Text);
      Registro.WriteString('DataIni'+pTipo, MaskEdit1.Text);
      Registro.WriteString('DataFim'+pTipo, MaskEdit2.Text);
      Registro.WriteString('PalavraChave'+pTipo, MaskEdit3.Text);
      Registro.WriteBool('MaskEdit1'+pTipo,MaskEdit1.Visible);
      Registro.WriteBool('MaskEdit2'+pTipo,MaskEdit2.Visible);
      Registro.WriteBool('MaskEdit3'+pTipo,MaskEdit3.Visible);
      Registro.WriteString('MaskEdit1Valor'+pTipo,MaskEdit1.Text);
      Registro.WriteString('MaskEdit2Valor'+pTipo,MaskEdit2.Text);
      Registro.WriteString('MaskEdit3Valor'+pTipo,MaskEdit3.Text);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmCadProdSimilares.groupAdicionalExit(Sender: TObject);
begin
   if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TFrmCadProdSimilares.habilitarCamposProduto(vHab: boolean);
begin
	PanelProduto.Visible := vHab;
	EditNumFabGrupo.Enabled := vHab;
//  DBEditGrupoProd.Enabled := vHab;
//  DBEditCodigoProd.Enabled := vHab;
//  DBEditDescricaoProd.Enabled := vHab;

  BitBtn_Novo_Produto.Enabled := not vHab;
  BitBtn_Salvar_Produto.Enabled := vHab;
  BitBtn_Cancelar_Produto.Enabled := vHab;
  BitBtn_Excluir_Produto.Enabled := not vHab;
end;

procedure TFrmCadProdSimilares.leConfiguracoesRegistro2(pTipo: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
  vCampoPadrao: string;
  vCamposPadraoRegistro: boolean;
begin
  try
    // Chama o construtor do objeto
    vCamposPadraoRegistro := (vDadosIni.GetIni('Sistema', 'CamposPadraoPesquisaNoRegistro', 'N') = 'S');
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      vTemp := Registro.ReadString('Campo'+pTipo);
      if ((vCampoPadrao = '') or (vCamposPadraoRegistro)) and (vTemp <> '') then
        ComboBox1.Text := vTemp;
      vTemp := Registro.ReadString('Condicao'+pTipo);
      if vTemp <> '' then
        ComboBox3.Text := vTemp;
      vTemp := Registro.ReadString('DataIni'+pTipo);
      if vTemp <> '' then
        MaskEdit1.Text := vTemp;
      vTemp := Registro.ReadString('DataFim'+pTipo);
      if vTemp <> '' then
        MaskEdit2.Text := vTemp;
      vTemp := Registro.ReadString('PalavraChave'+pTipo);
      if vTemp <> '' then
        MaskEdit3.Text := vTemp;
      try
        MaskEdit1.Visible := Registro.ReadBool('MaskEdit1'+pTipo);
        MaskEdit2.Visible := Registro.ReadBool('MaskEdit2'+pTipo);
        MaskEdit3.Visible := Registro.ReadBool('MaskEdit3'+pTipo);
      except
        MaskEdit1.Visible := false;
        MaskEdit2.Visible := false;
        MaskEdit3.Visible := true;
        MaskEdit3.EditMask:='';
      end;
     	MaskEdit1.Text := Registro.ReadString('MaskEdit1Valor'+pTipo);
    	MaskEdit2.Text := Registro.ReadString('MaskEdit2Valor'+pTipo);
			MaskEdit3.Text := Registro.ReadString('MaskEdit3Valor'+pTipo);

      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmCadProdSimilares.MarcarTodosGrupoSimilaresClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    if RadioGroup3.ItemIndex = 0 then
      ProdSimilar._marcarTodos
    else
    	GrupoProdSimilares._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadProdSimilares.MarcarTodosProdSimilaresClickClick(
  Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    if RadioGroup3.ItemIndex = 0 then
      ProdSimilar._marcarTodos
    else
    	GrupoProdSimilares._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadProdSimilares.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel31.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TFrmCadProdSimilares.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel18.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TFrmCadProdSimilares.qrpGrupoProdSimilarPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Grupos Similares');
end;

procedure TFrmCadProdSimilares.qrpProdSimilarPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Produtos Similares');
end;

procedure TFrmCadProdSimilares.RadioGroup3Click(Sender: TObject);
begin
  gravaConfiguracoesRegistro2(vDadosIni.IfThen(RadioGroup3.ItemIndex <> 0, 'P', 'G'));
  inherited;
  DBGrid1.Visible := RadioGroup3.ItemIndex = 0;
  groupAdicional.Visible := RadioGroup3.ItemIndex = 0;
  CheckBox1.Visible := RadioGroup3.ItemIndex = 0;
	DBGrid2.Visible := RadioGroup3.ItemIndex = 1;
  if RadioGroup3.ItemIndex = 0 then
	  configuraShow2(DBGrid1)
  else
  	configuraShow2(DBGrid2);

  if RadioGroup3.ItemIndex = 0 then
  begin
    BitBtn1.Hint := 'Clique para pesquisar - [PRO138]';
    BitBtn3.Hint := 'Novo cadastro - [PRO139]';
    SpeedButton1.Hint := 'Editar Registro - [PRO140]';
    SpeedButton2.Hint := 'Apagar Registro - [PRO141]';
    SpeedButton3.Hint := 'Imprimir - [PRO147]';
    SpeedButton25.Hint := 'Ver registros da lixeira - [PRO143]';
    SpeedButton5.Hint := 'Recuperar registro - [PRO144]';
    BitBtn4.Hint := 'Confirmar Registro - [PRO145]';
    BitBtn5.Hint := 'Cancelar Registro -[PRO146]';
  end
  else
  begin
    BitBtn1.Hint := 'Clique para pesquisar - [PRO345]';
    BitBtn3.Hint := 'Novo cadastro - [PRO346]';
    SpeedButton1.Hint := 'Editar Registro - [PRO347]';
    SpeedButton2.Hint := 'Apagar Registro - [PRO348]';
    SpeedButton3.Hint := 'Imprimir - [PRO354]';
    SpeedButton25.Hint := 'Ver registros da lixeira - [PRO350]';
    SpeedButton5.Hint := 'Recuperar registro - [PRO351]';
    BitBtn4.Hint := 'Confirmar Registro - [PRO352]';
    BitBtn5.Hint := 'Cancelar Registro';
  end;
end;

procedure TFrmCadProdSimilares.ReajustarLarguradascolunas2Click(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid2);
end;

procedure TFrmCadProdSimilares.ResetarConfiguraesdecolunas2Click(
  Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid2, GridCfg2, cdsColunas2, cdsGrid2, usuario2,
     vDadosIni.transacaoCol, fReset2, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TFrmCadProdSimilares.SalvardadosnoExcel2Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid2, usuario2, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmCadProdSimilares.SpeedButton10Click(Sender: TObject);
begin
//  inherited;
//  try
//    Screen.Cursor := crHourGlass;
//    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
//    if vDadosIni.vPesquisa <> '' then
//    begin
//      if ProdSimilar.LocProduto(vDadosIni.vPesquisa, true) then
//      begin
//      	if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
//	        DBEdit5.SetFocus
//      end
//      else
//      begin
//      	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
//	        DBEdit3.SetFocus;
//      end;
//    end
//    else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
//      DBEdit3.SetFocus;
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TFrmCadProdSimilares.SpeedButton1Click(Sender: TObject);
begin
	pnCorPrinc.Visible := not vDadosIni.vProdSimilar.vSimilaresEntreSi;
  lbTextoBotaoDireito.Visible := not vDadosIni.vProdSimilar.vSimilaresEntreSi;
  if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
	  DBGrid3.PopupMenu := PopupMenuGrupoSim
  else
  	DBGrid3.PopupMenu := nil;

	if RadioGroup3.ItemIndex = 0 then
  begin
    if not ProdSimilar.dataSet.IsEmpty then
    begin
      if ProdSimilar.dataSet.FieldByName('ATIVO').AsInteger = 1 then
      begin
        if not ProdSimilar.Edit then
          exit;
        inherited;
        PageControl1.ActivePage := TabSheet1;
        TabSheet1.Show;
//        tsCadastroP.TabVisible := true;
        PageControl3.ActivePage := tsCadastroP;
        tsCadastroP.Caption := 'Alterando produto similar';
  //        Label11.Visible := false;
        Edit1.Text := '';
        EditNumFab.Text := '';
        EditNumFabSim.Text := '';
  //        Edit1.Visible := false;

        if ProdSimilar.LocProduto(ProdSimilar.dataSet.FieldByName('GRUPO_PROD').AsInteger, ProdSimilar.dataSet.FieldByName('COD_PROD').asstring, false) then
        begin
           Edit1.Text := trim(ProdSimilar.DescrProd);
           EditNumFab.Text := trim(ProdSimilar.NumFabrProd);
        end;
        if ProdSimilar.LocProduto(ProdSimilar.dataSet.FieldByName('GRUPO_PS').AsInteger, ProdSimilar.dataSet.FieldByName('COD_PS').asstring, true) then
        begin
           EditNumFabSim.Text := trim(ProdSimilar.NumFabrProdSim);
        end;

        if (Self.Enabled) and (Self.Visible) and (EditNumFab.CanFocus) then
          EditNumFab.SetFocus
      end
      else
        Application.MessageBox('Este registro está na lixeira.' + chr(13) +
          'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION +
          MB_DEFBUTTON1);
    end
    else
      Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK +
	      MB_ICONINFORMATION + MB_DEFBUTTON1);
  end
  else
  begin
    if not GrupoProdSimilares.dataSet.IsEmpty then
    begin
      if GrupoProdSimilares.dataSet.FieldByName('ATIVO').AsInteger = 1 then
      begin
        if not GrupoProdSimilares.Edit then
          exit;
        inherited;
        PageControl1.ActivePage := TabSheet1;
        TabSheet1.Show;
//        tsCadastroG.TabVisible := true;
        PageControl3.ActivePage := tsCadastroG;
        tsCadastroG.Caption := 'Alterando grupo de produto similar';
        habilitarCamposProduto;
        
        if (Self.Enabled) and (Self.Visible) and (DBEditDescricao.CanFocus) then
          DBEditDescricao.SetFocus
      end
      else
        Application.MessageBox('Este registro está na lixeira.' + chr(13) +
          'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION +
          MB_DEFBUTTON1);
    end
    else
      Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

procedure TFrmCadProdSimilares.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if RadioGroup3.ItemIndex = 0 then
  begin
    if vDadosIni.PesqPros('PRO143', 'ACESSAR LIXEIRA', '','PROD_SIMILARES','', ProdSimilar.buscas, true) then
    begin
      if not ProdSimilar.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira - [PRO142]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO141]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;
  end
  else
  begin
    if vDadosIni.PesqPros('PRO350', 'ACESSAR LIXEIRA', '','PROD_SIMILARES_GRUPOS','', GrupoProdSimilares.buscas, true) then
    begin
      if not GrupoProdSimilares.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira - [PRO349]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO348]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;
  end;
end;

procedure TFrmCadProdSimilares.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  inherited;
  if RadioGroup3.ItemIndex = 0 then
  begin
    if not ProdSimilar.Delete then
    	Exit;

    vStatusLixeira := ProdSimilar._lixeiraCheia;
    lixeiraVazia(not vStatusLixeira)
  end
  else
  begin
  	if not GrupoProdSimilares.Delete then
    	Exit;

    vStatusLixeira := GrupoProdSimilares._lixeiraCheia;
    lixeiraVazia(not vStatusLixeira);
  end;
end;

procedure TFrmCadProdSimilares.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if RadioGroup3.ItemIndex = 0 then
  begin
   	if vDadosIni.PesqPros('PRO147', 'EMITIR', '', 'PROD_SIMILARES', '', ProdSimilar.buscas, true) then
	    ProdSimilar.RelProdSimilar;
  end
  else
  begin
    if vDadosIni.PesqPros('PRO354', 'EMITIR', '', 'PROD_SIMILARES_GRUPOS', '', GrupoProdSimilares.buscas, true) then
	    GrupoProdSimilares.RelGrupoProdSimilar;
  end;
end;

procedure TFrmCadProdSimilares.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('prodsimilar_%', ProdSimilar.buscas);
  RadioGroup3.ItemIndex := vDadosIni.IfThen(vDadosIni.vProdSimilar.vAgruparSimilar, 1, 0);
  ProdSimilar.abreProdSimilares(true);
  GrupoProdSimilares.abreGrupoProdSimilares(true);
end;

procedure TFrmCadProdSimilares.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if RadioGroup3.ItemIndex = 0 then
  begin
    if not ProdSimilar.RestaurarRegistro then
    	Exit;

    if ProdSimilar.StatusLixeira then
      lixeiraVazia(false)
    else
    	lixeiraVazia(true);
  end
  else
  begin
    if not GrupoProdSimilares.RestaurarRegistro then
    	Exit;

    if GrupoProdSimilares.StatusLixeira then
      lixeiraVazia(false)
    else
    	lixeiraVazia(true);
  end;
end;

procedure TFrmCadProdSimilares.SpeedButton9Click(Sender: TObject);
begin
//  inherited;
//  try
//    Screen.Cursor := crHourGlass;
//    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
//    if vDadosIni.vPesquisa <> '' then
//    begin
//      if ProdSimilar.LocProduto(vDadosIni.vPesquisa, false) then
//      begin
//				if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
//        	DBEdit3.SetFocus;
//        Label11.Visible := true;
//        Edit1.Text := ProdSimilar.DescrProd;
//        Edit1.Visible := true;
//      end
//      else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
//        DBEdit1.SetFocus;
//    end
//    else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
//      DBEdit1.SetFocus;
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

end.

