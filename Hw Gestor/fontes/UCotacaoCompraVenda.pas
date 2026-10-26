unit UCotacaoCompraVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, DB,UdtmGestorHw,UClassesGestor, AppEvnts, uEditHw,
  uCadPadraoModal;

type
  TFrmSugestCompraVenda = class (TfrmCadPadraoM)
    Panel13: TPanel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn7: TBitBtn;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit11: TDBEdit;
    Label23: TLabel;
    DBEdit12: TDBEdit;
    Label24: TLabel;
    DBEdit13: TDBEdit;
    Label25: TLabel;
    DBEdit14: TDBEdit;
    Label27: TLabel;
    DBEdit15: TDBEdit;
    BitBtn15: TBitBtn;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label48: TLabel;
    DBEdit38: TDBEdit;
    Label49: TLabel;
    DBEdit39: TDBEdit;
    Label50: TLabel;
    DBEdit40: TDBEdit;
    Label51: TLabel;
    DBEdit41: TDBEdit;
    Label52: TLabel;
    DBEdit42: TDBEdit;
    Label53: TLabel;
    DBEdit43: TDBEdit;
    Label54: TLabel;
    DBEdit44: TDBEdit;
    BitBtn16: TBitBtn;
    Label55: TLabel;
    Edit6: TEdit;
    ComboBox4: TComboBox;
    DBComboBox2: TDBComboBox;
    Label13: TLabel;
    DBEdit45: TDBEdit;
    Label56: TLabel;
    BitBtn12: TBitBtn;
    TabSheet6: TTabSheet;
    GroupBox5: TGroupBox;
    DBGrid2: TDBGrid;
    Label62: TLabel;
    DBEdit46: TDBEdit;
    TabSheet7: TTabSheet;
    pnListaCotacao: TPanel;
    GroupBox12: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox13: TGroupBox;
    BitBtn18: TBitBtn;
    BitBtn13: TBitBtn;
    GroupBox6: TGroupBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    GroupBox7: TGroupBox;
    Label590: TLabel;
    MaskEditDataEntIni: TMaskEdit;
    MaskEditDataEntFim: TMaskEdit;
    Label63: TLabel;
    BitBtn23: TBitBtn;
    Label127: TLabel;
    EditDesricao: TEdit;
    Label64: TLabel;
    EditCodLista: TEditHw;
    DBLookupComboBox3: TDBLookupComboBox;
    Label65: TLabel;
    EditHw1: TEditHw;
    DBComboBox4: TDBComboBox;
    Label66: TLabel;
    BitBtn100: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Label8: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label26: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBComboBox3: TDBComboBox;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit32: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    Label33: TLabel;
    Label16: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label15: TLabel;
    Label36: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label40: TLabel;
    Label39: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    DBEdit21: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    dbedit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    BitBtn17: TBitBtn;
    SpeedButton13: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label67: TLabel;
    DBEdit47: TDBEdit;
    Label68: TLabel;
    DBEdit48: TDBEdit;
    Label69: TLabel;
    DBEdit49: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label70: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    EditHw2: TEditHw;
    Label71: TLabel;
    EditHw3: TEditHw;
    Label72: TLabel;
    EditHw4: TEditHw;
    TabSheet8: TTabSheet;
    pnCotacao: TPanel;
    GroupBox9: TGroupBox;
    DBGrid5: TDBGrid;
    GroupBox11: TGroupBox;
    BitBtn14: TBitBtn;
    BitBtn19: TBitBtn;
    GroupBox14: TGroupBox;
    DBGrid6: TDBGrid;
    BitBtn20: TBitBtn;
    GroupBox8: TGroupBox;
    btSelectAllCot: TSpeedButton;
    btUnSelectAllCot: TSpeedButton;
    TabSheet9: TTabSheet;
    pnListaCotacaoC: TPanel;
    GroupBox15: TGroupBox;
    DBGrid7: TDBGrid;
    GroupBox16: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Edit1: TEdit;
    Memo1: TMemo;
    GroupBox17: TGroupBox;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn24: TBitBtn;
    tsOrdenarRel: TTabSheet;
    pnOrdenarRel: TPanel;
    GroupBox18: TGroupBox;
    Label75: TLabel;
    cbOrdem: TComboBox;
    CheckBox2: TCheckBox;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    Panel6: TPanel;
    Label247: TLabel;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    Panel7: TPanel;
    DBGrid8: TDBGrid;
    mkTipo: TMaskEdit;
    Label199: TLabel;
    EditFiscal1: TEditFiscal;
    Label76: TLabel;
    BitBtn27: TBitBtn;
    Label77: TLabel;
    DBEdit50: TDBEdit;
    Label78: TLabel;
    DBEdit51: TDBEdit;
    Label79: TLabel;
    DBEdit52: TDBEdit;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    DBEdit53: TDBEdit;
    Label84: TLabel;
    BitBtn106: TBitBtn;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid7CellClick(Column: TColumn);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn106Click(Sender: TObject);
    procedure DBGrid7TitleClick(Column: TColumn);
    procedure DBGrid6TitleClick(Column: TColumn);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure BitBtn27Click(Sender: TObject);
    procedure EditFiscal1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid8DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EditFiscal1Change(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure DBGrid8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid8DblClick(Sender: TObject);
    procedure mkTipoChange(Sender: TObject);
    procedure cbOrdemExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure DBGrid7DblClick(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btUnSelectAllCotClick(Sender: TObject);
    procedure btSelectAllCotClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid6DblClick(Sender: TObject);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBEdit49Exit(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure DBLookupComboBox5Exit(Sender: TObject);
    procedure DBEdit32Exit(Sender: TObject);
    procedure DBEdit49KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton13Click(Sender: TObject);
    procedure BitBtn100Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure EditHw1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit32KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox4Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure EditHw1Exit(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit46Exit(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure MaskEditDataEntIniKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEditDataEntFimEnter(Sender: TObject);
    procedure MaskEditDataEntIniEnter(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit23Exit(Sender: TObject);
    procedure DBEdit22Exit(Sender: TObject);
    procedure DBEdit30Exit(Sender: TObject);
    procedure DBEdit42Exit(Sender: TObject);
    procedure DBEdit41Exit(Sender: TObject);
    procedure DBEdit43Exit(Sender: TObject);
    procedure DBEdit39Exit(Sender: TObject);
    procedure DBEdit38Exit(Sender: TObject);
    procedure DBEdit44Exit(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBEdit29Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit45Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure calculaperc;
    procedure ExibirCampos;
    function _mdiAberto(pNomeFormMDI: string): Boolean;
    procedure _HabilitarCampos(habilitar: boolean = true);
  private
    { Private declarations }
    vCriou: Smallint;
    hMargem: THandle;
  public
    { Public declarations }
    vCodFornecOld, vCodFornecNew: Integer;
  end;

var
  FrmSugestCompraVenda: TFrmSugestCompraVenda;
//  hmargem: THandle;
  obCompraVenda: Tcotacao;
  vdificm,vdificm1: currency;
  vitgeral: integer;

implementation

uses
  funcoes, uClasseMargemProduto, uDtmMargemProduto, uMargemProduto, uDadosIni,
  uDtmAtivo, uDataSet_OOP, DBClient, UvisualizadorOLAP;

{$R *.dfm}

procedure TFrmSugestCompraVenda.BitBtn100Click(Sender: TObject);
begin
  inherited;
 if obCompraVenda.cadCotacaoItens.dataSet.IsEmpty then
   exit;

 PageControl2.ActivePage:=TabSheet4;
 SpeedButton9.Visible := true;
 SpeedButton10.Visible := true;
 SpeedButton13.Visible := true;
 Panel4.Enabled := false;
 TabSheet5.Enabled := false;
 Panel13.Enabled := false;

 TabSheet4.TabVisible := true;
 TabSheet5.TabVisible := true;
 TabSheet6.TabVisible := false;
end;

procedure TFrmSugestCompraVenda.BitBtn106Click(Sender: TObject);
begin
  inherited;
  if not obCompraVenda.cadCotacaoItens.IsEmpty then  
    vDadosIni.abreFormImagensProduto(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('DESCR_PROD').AsString,
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('GRUPO').AsString, obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString,
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString,
      0, 0, obCompraVenda.buscas);
end;

procedure TFrmSugestCompraVenda.BitBtn10Click(Sender: TObject);
begin
 inherited;
 if not obCompraVenda.checarCamposObrigatorios then
 begin
 	 setFocusCampoErro(obCompraVenda.vNomeCampoErro, obCompraVenda.vMensagemErro);
 	 exit;
 end;

 if not vDadosIni.PesqPros('GES038','ALTERAR ITEM','ITEM N.: '+
 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsString,'','',obCompraVenda.buscas,True) then
   Exit;
 BitBtn10.Enabled:=false;
 TabSheet4.TabVisible := true;
 TabSheet5.TabVisible := true;
 TabSheet6.TabVisible := false;
 PageControl2.Enabled:=true;
 BitBtn8.Enabled:=false;
 BitBtn9.Enabled:=true;
 SpeedButton9.Visible := false;
 SpeedButton10.Visible := false;
 obCompraVenda.cadCotacaoItens.Edit;
 PageControl2.ActivePage:=TabSheet4;
 Panel4.Enabled:=true;
 TabSheet5.Enabled:=true;
 DBEdit46.Enabled := obCompraVenda.cadCotacaoItens.IsEmpty;
 BitBtn27.Enabled := (obCompraVenda.cadCotacaoItens.IsEmpty) or ((DBEdit46.Enabled = false) and (obCompraVenda.dataSet.FieldByName('COD_LISTA').AsInteger > 0));
 if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
   DBEdit32.setfocus
 else if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
   DBComboBox3.SetFocus;
end;

procedure TFrmSugestCompraVenda.BitBtn11Click(Sender: TObject);
begin
  inherited;
 if obCompraVenda.cadCotacaoItens.dataSet.State in [dsInsert, dsEdit] then
 begin
  obCompraVenda.cadCotacaoItens.Cancel;
  PageControl2.ActivePage:=TabSheet6;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.Show;
  BitBtn8.Enabled:=true;
  BitBtn10.Enabled:=true;
  BitBtn9.Enabled:=false;
  if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
  	BitBtn8.setfocus;
 end
 else
 begin
  if not vDadosIni.PesqPros('GES039','EXCLUIR ITEM',
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsString+' CODIGO: '+
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString,'','',obCompraVenda.buscas,True) then
   Exit;
  if Application.MessageBox('Deseja realmente apagar este item?',
   'Apagar item', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    obCompraVenda.cadCotacaoItens.Delete;
 end;
 DBEdit46.Enabled := obCompraVenda.cadCotacaoItens.IsEmpty;
 BitBtn27.Enabled := (obCompraVenda.cadCotacaoItens.IsEmpty) or ((DBEdit46.Enabled = false) and (obCompraVenda.dataSet.FieldByName('COD_LISTA').AsInteger > 0));
end;

procedure TFrmSugestCompraVenda.BitBtn12Click(Sender: TObject);
begin
  inherited;
 if not vDadosIni.PesqPros('BAS083', 'ABRIR', '', 'APURACAO_DEPTO', '', obCompraVenda.buscas, True)
    then
    Exit;
  inherited;

  obCompraVenda.cadDNDEmpresa;
end;

procedure TFrmSugestCompraVenda.BitBtn13Click(Sender: TObject);
begin
  inherited;
  TForm(pnListaCotacao.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestCompraVenda.BitBtn14Click(Sender: TObject);
var
 vSel: Boolean;
begin
  inherited;

  vSel := false;

  try
  	obCompraVenda.fTempCotacaoItens.DisableControls;
    obCompraVenda.fTempCotacaoItens.First;
    while not obCompraVenda.fTempCotacaoItens.Eof do
    begin
      if obCompraVenda.fTempCotacaoItens.FieldByName('SEL').AsString = 'S' then
        vSel := true;
      obCompraVenda.fTempCotacaoItens.Next;
    end;
  finally
  	obCompraVenda.fTempCotacaoItens.First;
    obCompraVenda.fTempCotacaoItens.EnableControls;
  end;

  if not vSel then
  begin
    Application.MessageBox('Nenhum registro selecionado|','Atenção',MB_OK+MB_ICONINFORMATION);
    exit;
  end;

  if _mdiAberto('TfrmCadPedidoCompra') then
    Exit;


  TForm(pnCotacao.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestCompraVenda.BitBtn16Click(Sender: TObject);
begin
  inherited;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
  	obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_SIM_FORN').AsFloat;
  // FRETE
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
  	obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat+
	  (obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat*
  	 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('FRETE_SIM').AsFloat / 100);
  // ACRESCENTA IPI
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
	  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat +
  	(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat*
	   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('IPI_SIM').AsFloat / 100);
  // ACRESCENTA OUTRAS DESPESAS
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
	  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat +
  	obCompraVenda.cadCotacaoItens.dataSet.FieldByName('OUTRAS_DESP_SIM').AsFloat;
  // FAZENDO A CONTA COM ICMS DE ENTRADA
  vdificm := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat -
  	(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat *
	   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('IPI_SIM').AsFloat / 100);
  vdificm := vdificm * obCompraVenda.cadCotacaoItens.dataSet.FieldByName('ICM_ENTRADA').AsFloat / 100;
  // COLOCANDO O MVA E ATUALIZANDO O VALOR DE SUBST.
  vdificm1 := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat +
  	(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat *
  	 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('MVA_SIM').AsFloat / 100);
  vdificm1 := vdificm1*obCompraVenda.cadCotacaoItens.dataSet.FieldByName('ICM_SAIDA').AsFloat / 100;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat +
	  (vdificm1-vdificm);
  PageControl2.ActivePage:=TabSheet4;
  if (Self.Enabled) and (Self.Visible) and (DBEdit30.CanFocus) then
  	DBEdit30.SetFocus;
end;

procedure TFrmSugestCompraVenda.BitBtn17Click(Sender: TObject);
var
 vdesc: currency;
begin
  inherited;
  vdesc:=0;
  if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_UN_VENDA_SIM').AsFloat <> 0 then
  begin
    vdesc:=(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_UN_VENDA_SIM').AsFloat*
      (obCompraVenda.cadCotacaoItens.dataSet.FieldByName('PERC_DESC').AsFloat / 100))+
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('DESCONTO_VALOR').AsFloat;

    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat :=
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat*
      (obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_UN_VENDA_SIM').AsFloat - vdesc);


    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CMV_PRODUTO').AsFloat:=
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat *
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat;
    //
    frmMargemProduto.edCustoAquisicao.Valor:=
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat;
    frmMargemProduto.edRecolhimentoICMSPercExit(sender);
    frmMargemProduto.edPrecoVenda.Valor:=ObCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_UN_VENDA_SIM').AsFloat;
    frmMargemProduto.edPercentualDescontoExit(Sender);
    frmMargemProduto.BitBtn1Click(sender);
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_EQUILIBRIO').AsFloat :=
      frmMargemProduto.edtQtdeVenda.Valor;
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_EQUILIBRIO').AsFloat :=
      frmMargemProduto.EdtPeProduto.Valor;
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_FIXO_PROP').AsFloat :=
      frmMargemProduto.edValorDespesasFixas.Valor*
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat;
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_VARIAVEL').AsFloat :=
      frmMargemProduto.EdtCustosVariaveis.Valor*
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat;
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('MARKUP_SIMULADO').AsFloat :=
      frmMargemProduto.edtMarkup.Valor;

    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('IRRF').AsFloat :=
      frmMargemProduto.edIRRF.Valor *
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat;
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('ADIRRF').AsFloat:=
      frmMargemProduto.edADIRRF.Valor *
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat;
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CSLL').AsFloat:=
      frmMargemProduto.edCSLL.Valor *
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat;

    //obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_FIXO_PROP').AsFloat:=
    //frmMargemProduto.edValorDespesasFixas.Valor*
    //obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat;
    //
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('LUCRO_APURADO').AsFloat :=
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat -
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CMV_PRODUTO').AsFloat -
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_FIXO_PROP').AsFloat -
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_VARIAVEL').AsFloat;

    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('LUCRORETIDO').AsFloat :=
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('LUCRO_APURADO').AsFloat -
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('IRRF').AsFloat -
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('ADIRRF').AsFloat -
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CSLL').AsFloat;

    calculaperc;
    if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('LUCRO_APURADO').AsFloat < 0 then
    begin
      DBEdit31.Font.Color:=clRed;
      label61.Font.Color:=clRed;
    end
    else
    begin
      DBEdit31.Font.Color:=clHotLight;
      label61.Font.Color:=clHotLight;
    end;
    if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('LUCRORETIDO').AsFloat < 0 then
    begin
      DBEdit52.Font.Color:=clRed;
      label82.Font.Color:=clRed;
    end
    else
    begin
      DBEdit52.Font.Color:=clHotLight;
      label82.Font.Color:=clHotLight;
    end;
  end;
end;

procedure TFrmSugestCompraVenda.BitBtn18Click(Sender: TObject);
var
 vdias: integer;
 vGrupoProd: Integer;
 vCodProd, vNumFabr, vTipV: string;
 vCodFornec: Integer;
 vPrazoEnt, vPrazoPag: double;
 vitgeral: Integer;
begin
  inherited;

   if (trim(DBLookupComboBox3.Text) = '') then
   begin
     Application.MessageBox('Fornecedor deve ser informado.','Atenção',MB_OK+MB_ICONINFORMATION);
     if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
       DBLookupComboBox3.SetFocus;
     exit;
   end;

   if (trim(DBLookupComboBox5.Text) = '') then
   begin
     Application.MessageBox('Condição de pagamento deve ser informada.','Atenção',MB_OK+MB_ICONINFORMATION);
     if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox5.CanFocus) then
       DBLookupComboBox5.SetFocus;
     exit;
   end;

   if (trim(DbComboBox4.Text) = '') then
   begin
     Application.MessageBox('Tipo de venda deve ser informado.','Atenção',MB_OK+MB_ICONINFORMATION);
     if (Self.Enabled) and (Self.Visible) and (DBComboBox4.CanFocus) then
     	 DbComboBox4.SetFocus;
     exit;
   end;

   if obCompraVenda.cadCotacaoItens.dataSet.RecordCount > 0 then
   begin
	   obCompraVenda.cadCotacaoItens.dataSet.Filtered := false;
  	 obCompraVenda.cadCotacaoItens.IndexFieldNames := 'CODSEQ_ITEM';
     obCompraVenda.cadCotacaoItens.dataSet.Last;
	   vitgeral := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsInteger;
   end
   else
   	vitgeral := 0;

   obCompraVenda.fTempListaCotacaoItens.Filtered := false;
   obCompraVenda.fTempListaCotacaoItens.Filter := 'sel = ''S''';
   obCompraVenda.fTempListaCotacaoItens.Filtered := true;

   if obCompraVenda.fTempListaCotacaoItens.RecordCount <= 0 then
   begin
     Application.MessageBox('Nenhum item na lista selecionado','Atenção',MB_OK+MB_ICONINFORMATION);
     obCompraVenda.fTempListaCotacaoItens.Filtered := false;
     exit;
   end;

   obCompraVenda.fTempListaCotacaoItens.Filtered := false;
   try
     Screen.Cursor := crHourGlass;

     if obCompraVenda.cadCotacaoItens.dataSet.RecordCount > 0 then
     begin
       obCompraVenda.cadCotacaoItens.dataSet.Filtered := false;
       obCompraVenda.cadCotacaoItens.IndexFieldNames := 'CODSEQ_ITEM';
       obCompraVenda.cadCotacaoItens.dataSet.Last;
       vitgeral := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsInteger;
     end
     else
       vitgeral := 0;
     vTipV := copy(trim(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPVENDA').AsString), 1, 1);
     vPrazoEnt := EditHw3.AsValue;
     vPrazoPag := EditHw4.AsValue;
     try
     	 obCompraVenda.fTempListaCotacaoItens.DisableControls;
       obCompraVenda.fTempListaCotacaoItens.First;
       while not obCompraVenda.fTempListaCotacaoItens.Eof do
       begin
         if obCompraVenda.fTempListaCotacaoItens.FieldByName('SEL').AsString = 'S' then
         begin
         	 vGrupoProd := obCompraVenda.fTempListaCotacaoItens.FieldByName('GRUPO_PROD').AsInteger;
           vCodProd := trim(obCompraVenda.fTempListaCotacaoItens.FieldByName('COD_PROD').AsString);
           vNumFabr := trim(obCompraVenda.fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').AsString);
           vCodFornec := DBLookupComboBox3.KeyValue;

           if (obCompraVenda.cadCotacaoItens.dataSet.State in [dsInsert, dsEdit]) then
             obCompraVenda.cadCotacaoItens.dataSet.Cancel;

           try
             obCompraVenda.cadCotacaoItens.dataSet.DisableControls;
             obCompraVenda.cadCotacaoItens.dataSet.Filtered := false;
             obCompraVenda.cadCotacaoItens.dataSet.Filter :=
                ' grupo = ' + IntToStr(vGrupoProd) +
                ' and cod_prod = ' + QuotedStr(trim(vCodProd)) +
                ' and cod_fornecedor = ' + IntToStr(vCodFornec);
             obCompraVenda.cadCotacaoItens.dataSet.Filtered := true;

             if (not obCompraVenda.cadCotacaoItens.IsEmpty) then
             begin
             	 Application.MessageBox(PChar('Produto já existente na lista de cotação para fornecedor = '+ IntToStr(vCodFornec) + ':' + #13 + #13 +
                 'Grupo Prod: ' + IntToStr(vGrupoProd) + #13 +
                 'Cod Prod: ' + Trim(vCodProd) + #13 +
                 'Numero Fabricante: ' + Trim(vNumFabr)), 'Confirmação', MB_OK);
               exit;
             end;
           finally
             obCompraVenda.cadCotacaoItens.dataSet.Filtered := false;
             obCompraVenda.cadCotacaoItens.IndexFieldNames := 'CODSEQ_ITEM';
             obCompraVenda.cadCotacaoItens.dataSet.Last;
             obCompraVenda.cadCotacaoItens.dataSet.EnableControls;
           end;

           obCompraVenda.cadCotacaoItens.Insert;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COTACAO').AsInteger:=
             obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_EMPRESA').AsString:=
             vDadosIni.codEmpresa;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsInteger :=
           	 vitgeral + 1;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPOOP').AsString:=
             obCompraVenda.dataSet.FieldByName('TIPOOP').AsString;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPODEP').AsString:=
             obCompraVenda.dataSet.FieldByName('TIPODEP').AsString;

           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('GRUPO').AsInteger :=
            obCompraVenda.fTempListaCotacaoItens.FieldByName('GRUPO_PROD').AsInteger;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString :=
            obCompraVenda.fTempListaCotacaoItens.FieldByName('COD_PROD').AsString;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
            obCompraVenda.fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').AsString;

           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPVENDA').AsString := vTipV;

           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('PRAZO_MEDIO_ENT').AsFloat := vPrazoEnt;

           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('PRAZO_MEDIO_PAG').AsFloat := vPrazoPag;

           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger :=
            DBLookupComboBox3.KeyValue;

           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COND_PAG').AsInteger :=
            DBLookupComboBox5.KeyValue;

           frmMargemProduto.vflgchamada:=1;
           frmMargemProduto.ComboBox1.Text:=DBComboBox2.Text;
           frmMargemProduto.edNumFabProd.Text:=obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString;

           if not obCompraVenda.cadCotacaoItens.cadprodutos.buscaProduto(
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString,
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('GRUPO').AsInteger,
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString) then
           begin
             obCompraVenda.cadCotacaoItens.Cancel;
             exit;
           end;

           if copy(DbComboBox4.Text,1,1) = 'V' then
           begin
            frmMargemProduto.rbVendaVarejoClick(Sender);
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_UN_VENDA_SIM').AsFloat :=
            obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('PREC_TAB_PROD').AsFloat;
           end
           else
           begin
            frmMargemProduto.rbVendaAtacadoClick(sender);
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_UN_VENDA_SIM').AsFloat:=
            obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('PREC_PUBLICO').AsFloat;
           end;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('GRUPO').AsInteger:=
           obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('GRUPO_PROD').asinteger;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_PROD').asstring:=
           obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('COD_PROD').AsString;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('DESCR_PROD').AsString:=
           obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('DESCR_PROD').asstring;
        //    obMargemProd.vProd.vdescprodserv;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('MVA_SIM').AsFloat:=
           obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('MVA_NCM').AsFloat;
           obCompraVenda.cadCotacaoItens.dataset.FieldByName('PME').asfloat:=
           obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('VALORPME').AsFloat;
           // posso utilizar aqui o dmd do produto multiplicando pelos dias_disponvíveis do mês
           if obCompraVenda.dataSet.FieldByName('QTDE_DIAS_DISP').AsInteger <> 0 then
            vdias:=obCompraVenda.dataSet.FieldByName('QTDE_DIAS_DISP').AsInteger
           else
            vdias:=obCompraVenda.vdiasmeses;

           if ((obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('VALORPME').AsFloat)*vdias) > 0 then
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_PMEMES').AsFloat:=
            (obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('EST_F').AsFloat/
            obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('VALORPME').AsFloat)*
            vdias;
           if copy(DbComboBox4.Text,1,1) = 'A' then
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_PMEMES').AsFloat:=
            (obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('PREC_PUBLICO').AsFloat*
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_PMEMES').AsFloat)
           else
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_PMEMES').AsFloat:=
            (obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('PREC_TAB_PROD').AsFloat*
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_PMEMES').AsFloat);

           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CLASS_FREQ').AsString:=
           obMargemProd.vProd.vclfreq;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CLASS_AT').AsString:=
           obMargemProd.vProd.vclatual;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CURVA').AsString:=
           obMargemProd.vProd.vcldemand;
           if obCompraVenda.dataSet.FieldByName('TIPOOP').AsString <> 'COMPRA' then
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat:=
            obMargemProd.vProd.vpreccusto;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_VENDIDA').AsFloat:=
           obMargemProd.vProd.vqtdeProd;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_MEDIO_VENDA').AsFloat:=
           obMargemProd.vProd.vvalprod;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('MARGEM_PRATICADA').AsFloat:=
           	 frmMargemProduto.edLucroLiquidoSobreFaturamentoPerc.Valor;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('MARKUP_PRATICADO').AsFloat:=
           	 frmMargemProduto.edtMarkup.Valor;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_EQUILIBRIO').AsFloat:=
             frmMargemProduto.edtQtdeVenda.Valor;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_EQUILIBRIO').AsFloat:=
             frmMargemProduto.EdtPeProduto.Valor;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_FIXO_PROP').AsFloat:=
             frmMargemProduto.edValorDespesasFixas.Valor;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_VARIAVEL').AsFloat:=
             frmMargemProduto.EdtCustosVariaveis.Valor;
           obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_SIMULADA').AsFloat:=
             obCompraVenda.fTempListaCotacaoItens.FieldByName('QUANT_PROD').AsFloat;

           DBEdit30Exit(Sender);

           if obCompraVenda.cadCotacaoItens.dataSet.State = dsinsert then
           begin
             obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsInteger:=vitgeral+1;
             vitgeral:=vitgeral+1;
           end;
           obCompraVenda.cadCotacaoItens.Post;
         end;

         obCompraVenda.fTempListaCotacaoItens.Next;
       end;
     finally
    	 obCompraVenda.fTempListaCotacaoItens.First;
       obCompraVenda.fTempListaCotacaoItens.EnableControls;
       obCompraVenda.cadCotacaoItens.IndexFieldNames := 'CODSEQ_ITEM';
       obCompraVenda.cadCotacaoItens.First;
     end;

    TForm(pnListaCotacao.Parent).ModalResult := IDOK;
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmSugestCompraVenda.BitBtn19Click(Sender: TObject);
begin
  inherited;
  TForm(pnCotacao.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestCompraVenda.BitBtn1Click(Sender: TObject);
var
  vSqlAdicional, Tipo: string;
begin
  inherited;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [GES032]';
  if not vDadosIni.PesqPros('GES029','PESQUISAR','COTACAO PARA COMPRA/VENDA DE PRODUTOS','','',obCompraVenda.buscas,True) then
   Exit;
  if MaskEdit2.Visible then
  begin
    if not obCompraVenda.ConsultaCampos('COTACAO', ComboBox1.Text,
      'COD_COTACAO', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if obCompraVenda.ConsultaCampos('COTACAO', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, 'COD_COTACAO', true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
    		ComboBox1.SetFocus;
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  SpeedButton6.Visible := true;
  SpeedButton8.Visible := true;
  SpeedButton7.Visible := true;
  SpeedButton11.Visible := true;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TFrmSugestCompraVenda.BitBtn20Click(Sender: TObject);
begin
  inherited;
if not vDadosIni.PesqPros('GES066','MONTAR PEDIDO',
  obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString,'','',obCompraVenda.buscas,True) then
  exit;

obCompraVenda.abrePedido;
end;

procedure TFrmSugestCompraVenda.BitBtn21Click(Sender: TObject);
var
 vSel: boolean;
begin
  inherited;
  vSel := false;

  if trim(Edit1.Text) = '' then
  begin
   Application.MessageBox('Descrição da lista de cotação deve ser informada', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
   if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
     Edit1.SetFocus;
   exit;
  end;

  try
  	obCompraVenda.fTempListaCotacaoItens2.DisableControls;
    obCompraVenda.fTempListaCotacaoItens2.First;
    while not obCompraVenda.fTempListaCotacaoItens2.Eof do
    begin
      if obCompraVenda.fTempListaCotacaoItens2.FieldByName('SEL').AsString = 'S' then
        vSel := true;
      obCompraVenda.fTempListaCotacaoItens2.Next;
    end;
  finally
    obCompraVenda.fTempListaCotacaoItens2.First;
    obCompraVenda.fTempListaCotacaoItens2.EnableControls;
  end;

  if not vSel then
  begin
    Application.MessageBox('Nenhum produto se encontra selecionado na lista de cotação.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;
  inherited;

  TForm(pnListaCotacaoC.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestCompraVenda.BitBtn22Click(Sender: TObject);
begin
  inherited;
 TForm(pnListaCotacaoC.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestCompraVenda.BitBtn23Click(Sender: TObject);
begin
  inherited;
 try
    Screen.Cursor := crHourGlass;

    obCompraVenda._descricao := EditDesricao.Text;
    obCompraVenda._dtIni := MaskEditDataEntIni.Text;
    obCompraVenda._dtFim := MaskEditDataEntFim.Text;
    obCompraVenda._codLista := EditCodLista.AsInteger;
    obCompraVenda.pesquisarListaCotacao;
    obCompraVenda.datasetAfterScrollListaCotacao(obCompraVenda.dataSet);
    if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
    	DBGrid3.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestCompraVenda.BitBtn24Click(Sender: TObject);
begin
  inherited;
if not vDadosIni.PesqPros('GES067','MONTAR PEDIDO',
  obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString,'','',obCompraVenda.buscas,True) then
  exit;

obCompraVenda.abreListaCotacaoC;
end;

procedure TFrmSugestCompraVenda.BitBtn25Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn25.CanFocus) then
  	BitBtn25.SetFocus;
  if DBGrid8.DataSource.DataSet.IsEmpty then
  begin
    mkTipo.text := '';
    exit;
  end;
  if (cbOrdem.Text = '') then
  begin
    Application.MessageBox('Ordem não definida, favor informar!', 'Confirmação', MB_OK);
    exit;
  end;
  if ((cbOrdem.Text = 'ATRIBUTOS') or (cbOrdem.Text = 'MEDIA DOS ATRIBUTOS')) then
  begin
    if trim(mkTipo.Text) = '' then
    begin
      Application.MessageBox('Nenhum atributo informado!', 'Confirmação', MB_OK);
      exit;
    end;
  end;
  _GravaConfiguracoesInteger('cbOrdem', cbOrdem.ItemIndex);
  _GravaConfiguracoesBoolean('CheckBox2', CheckBox2.Checked);
  _GravaConfiguracoesString('mkTipo', mkTipo.Text);
  TForm(pnOrdenarRel.Parent).ModalResult := IDOK;
end;

procedure TFrmSugestCompraVenda.BitBtn26Click(Sender: TObject);
begin
  inherited;
  TForm(pnOrdenarRel.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmSugestCompraVenda.BitBtn27Click(Sender: TObject);
begin
  inherited;
  if obCompraVenda.dataset.FieldByName('COD_LISTA').AsInteger > 0 then
    obCompraVenda.abreListaCotacao(2)
  else
    obCompraVenda.abreListaCotacao;
end;

procedure TFrmSugestCompraVenda.BitBtn3Click(Sender: TObject);
var
 vtpcotacao: string;
 I: Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('COTACAO', 'I', obCompraVenda.buscas) then
    Exit;
    
  if not vDadosIni.PesqPros('GES030','INCLUIR','COTACAO PARA COMPRA/VENDA DE PRODUTOS','','',obCompraVenda.buscas,True) then
   Exit;

  if Application.MessageBox('Deseja fazer inclusão de cotação de compra? Responda S '+
  ' para Compra e N para o Venda', 'Incluir Cotação COMPRA/VENDA', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
  begin
    vtpcotacao:='COMPRA';
    obCompraVenda.cadfornecedor.abrebase;
  end
  else
    vtpcotacao:='VENDA';

  if not obCompraVenda.Insert(vtpcotacao) then
  	exit;

  for I := 0 to DBComboBox2.Items.Count - 1 do
  	if (Copy(trim(obCompraVenda.dataSet.FieldByName('TIPODEP').AsString), 1, 1) = Copy(trim(DBComboBox2.Items[I]), 1, 1)) then
    begin
    	DBComboBox2.ItemIndex := I;
      break;
    end;    

  _HabilitarCampos(true);
  ExibirCampos;
  TabSheet3.TabVisible := true;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  SpeedButton9.Visible := false;
  SpeedButton10.Visible := false;
  SpeedButton13.Visible := false;
  PageControl3.ActivePage := TabSheet3;
  PageControl2.ActivePage := TabSheet6;
  Panel13.Enabled := true;
  DBComboBox2.Enabled:=true;
  BitBtn8.Enabled:=true;
  BitBtn9.Enabled:=false;
  BitBtn10.Enabled:=true;
  PageControl2.Enabled:=true;
  DBEdit46.Enabled := true;
  BitBtn27.Enabled := true;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
	  DBLookupComboBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
  	DBLookupComboBox1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
  	DBComboBox2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  	DBEdit4.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
  	DBEdit6.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
  	DBEdit9.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
  	DBEdit10.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit45.CanFocus) then
  	DBEdit45.SetFocus;
end;

procedure TFrmSugestCompraVenda.BitBtn4Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('GES041','CONFIRMAR CAD/ALT','COTACAO PARA COMPRA/VENDA DE PRODUTOS','','',obCompraVenda.buscas,True) then
   Exit;
   
  if Application.MessageBox('Deseja realmente confirmar esta cotação/Sugestão?',
     'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
  begin
    obCompraVenda.dataSet.FieldByName('DATA_ALT_COTACAO').AsDateTime:=Date;
    if not obCompraVenda.Post then
    begin
      setFocusCampoErro(obCompraVenda.vNomeCampoErro, obCompraVenda.vMensagemErro);
      exit;
    end
    else
      inherited;
  end
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
    DBLookupComboBox1.SetFocus;
end;

procedure TFrmSugestCompraVenda.BitBtn5Click(Sender: TObject);
begin
  if (obCompraVenda.dataSet.ChangeCount > 0) or (obCompraVenda.cadCotacaoItens.dataSet.ChangeCount > 0) then
  begin
   if Application.MessageBox('Deseja realmente cancelar alterações de cotação/Sugestão?',
   'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
   begin
     obCompraVenda.dataSet.Cancel;
     obCompraVenda.cadCotacaoItens.Close;
     obCompraVenda.cadcolaborador.Close;
     obCompraVenda.cadfornecedor.Close;
     inherited;
   end
   else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
     DBLookupComboBox1.SetFocus;
  end
  else
  begin
   obCompraVenda.dataSet.Cancel;
   obCompraVenda.cadCotacaoItens.Close;
   obCompraVenda.cadcolaborador.Close;
   obCompraVenda.cadfornecedor.Close;
   inherited;
  end;
end;

procedure TFrmSugestCompraVenda.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('GES040','ACESSAR MARGEM','COTACAO PARA COMPRA/VENDA DE PRODUTOS','','',obCompraVenda.buscas,True) then
   Exit;
  if frmMargemProduto = nil then
    frmMargemProduto:=TfrmMargemProduto.Create(frmMargemProduto);
  frmMargemProduto.ShowModal;
end;

procedure TFrmSugestCompraVenda.BitBtn8Click(Sender: TObject);
begin
 inherited;
 if not obCompraVenda.checarCamposObrigatorios then
 begin
 	 setFocusCampoErro(obCompraVenda.vNomeCampoErro, obCompraVenda.vMensagemErro);
 	 exit;
 end;

 if not vDadosIni.PesqPros('GES037','INCLUIR ITEM','COTACAO PARA COMPRA/VENDA DE PRODUTOS','','',obCompraVenda.buscas,True) then
  Exit;
 BitBtn10.Enabled:=false;
 PageControl2.Enabled:=true;
 BitBtn9.Enabled:=true;
 BitBtn8.Enabled:=false;
 TabSheet4.TabVisible := true;
 TabSheet5.TabVisible := true;
 TabSheet6.TabVisible := false;
 obCompraVenda.cadCotacaoItens.Insert;
 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COTACAO').AsInteger:=
 obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger;
 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_EMPRESA').AsString:=
 vDadosIni.codEmpresa;
 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPOOP').AsString:=
 obCompraVenda.dataSet.FieldByName('TIPOOP').AsString;
 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPODEP').AsString:=
 obCompraVenda.dataSet.FieldByName('TIPODEP').AsString;
 SpeedButton9.Visible := false;
 SpeedButton10.Visible := false;
 PageControl2.ActivePage:=TabSheet4;
 Panel4.Enabled:=true;
 TabSheet5.Enabled:=true;
 DBEdit46.Enabled := obCompraVenda.cadCotacaoItens.IsEmpty;
 BitBtn27.Enabled := (obCompraVenda.cadCotacaoItens.IsEmpty) or ((DBEdit46.Enabled = false) and (obCompraVenda.dataSet.FieldByName('COD_LISTA').AsInteger > 0));

 if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
   DBEdit32.setfocus
 else if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
   DBComboBox3.SetFocus;
end;

procedure TFrmSugestCompraVenda.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if not obCompraVenda.checarCamposObrigatorios then
  begin
  	setFocusCampoErro(obCompraVenda.vNomeCampoErro, obCompraVenda.vMensagemErro);
  	exit;
  end;
    
  if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger > 0 then
    if (trim(DBLookupComboBox2.Text) = '') then
    begin
      Application.MessageBox('Fornecedor deve ser informado','Atenção',MB_OK+MB_ICONINFORMATION);
      if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
        DBEdit32.SetFocus;
      exit;
    end;

  if obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA' then
  begin
    if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COND_PAG').AsInteger > 0 then
       if (DBLookupComboBox4.Text = '') then
       begin
         Application.MessageBox('Condição de pagamento deve ser informada','Atenção',MB_OK+MB_ICONINFORMATION);
         if (Self.Enabled) and (Self.Visible) and (DBEdit49.CanFocus) then
           DBEdit49.SetFocus;
         exit;
       end;
  end;

  if trim(DbComboBox3.Text) = '' then
  begin
    Application.MessageBox('Tipo de venda deve ser informado','Atenção',MB_OK+MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DbComboBox3.CanFocus) then
	    DbComboBox3.SetFocus;
    exit;
  end;

  if trim(DBEdit2.Text) = '' then
  begin
  	Application.MessageBox('Prod/Serv deve ser informado','Atenção',MB_OK+MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
	    DBEdit2.SetFocus;
    exit;
  end;

 if obCompraVenda.cadCotacaoItens.dataSet.State = dsinsert then
 begin
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CODSEQ_ITEM').AsInteger:=vitgeral+1;
   vitgeral:=vitgeral+1;
 end;
 obCompraVenda.cadCotacaoItens.Post;
 TabSheet4.TabVisible := false;
 TabSheet5.TabVisible := false;
 TabSheet6.TabVisible := false;
 PageControl2.ActivePage := TabSheet6;
 BitBtn8.Enabled:=true;
 BitBtn10.Enabled:=true;
 BitBtn9.Enabled:=false;
 DBEdit46.Enabled := obCompraVenda.cadCotacaoItens.IsEmpty;
 BitBtn27.Enabled := (obCompraVenda.cadCotacaoItens.IsEmpty) or ((DBEdit46.Enabled = false) and (obCompraVenda.dataSet.FieldByName('COD_LISTA').AsInteger > 0));
 if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
 	 BitBtn8.setfocus;
end;

procedure TFrmSugestCompraVenda.btSelectAllClick(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
	  obCompraVenda._marcarTodos(obCompraVenda.fTempListaCotacaoItens2);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestCompraVenda.btUnSelectAllClick(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
 	  obCompraVenda._desmarcarTodos(obCompraVenda.fTempListaCotacaoItens2);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestCompraVenda.btUnSelectAllCotClick(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
	  obCompraVenda._desmarcarTodos(obCompraVenda.fTempCotacaoItens);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestCompraVenda.btSelectAllCotClick(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
	  obCompraVenda._marcarTodos(obCompraVenda.fTempCotacaoItens);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestCompraVenda.calculaperc;
begin
if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat <> 0 then
begin
 Label58.Caption:=
 format('%5.2f', [(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CMV_PRODUTO').AsFloat / obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat) * 100])+'%';
 Label59.Caption:=
 format('%5.2f', [(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_FIXO_PROP').AsFloat / obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat) * 100])+'%';
 Label60.Caption:=
 format('%5.2f', [(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_VARIAVEL').AsFloat / obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat) * 100])+'%';
 Label61.Caption:=
 format('%5.2f', [(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('LUCRO_APURADO').AsFloat / obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat) * 100])+'%';
 Label80.Caption:=
 format('%5.2f', [(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('IRRF').AsFloat / obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat) * 100])+'%';
 Label81.Caption:=
 format('%5.2f', [(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('ADIRRF').AsFloat / obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat) * 100])+'%';
 Label84.Caption:=
 format('%5.2f', [(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CSLL').AsFloat / obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat) * 100])+'%';
 Label82.Caption:=
 format('%5.2f', [(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('LUCRORETIDO').AsFloat / obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_SIM').AsFloat) * 100])+'%';
end;
end;

procedure TFrmSugestCompraVenda.cbOrdemExit(Sender: TObject);
begin
  inherited;
  Label76.Visible := false;
  mkTipo.Visible := ((cbOrdem.Text = 'ATRIBUTOS') or (cbOrdem.Text = 'MEDIA DOS ATRIBUTOS'));
  Label247.Visible := ((cbOrdem.Text = 'ATRIBUTOS') or (cbOrdem.Text = 'MEDIA DOS ATRIBUTOS'));
  SpeedButton16.Visible := ((cbOrdem.Text = 'ATRIBUTOS') or (cbOrdem.Text = 'MEDIA DOS ATRIBUTOS'));
  SpeedButton17.Visible := ((cbOrdem.Text = 'ATRIBUTOS') or (cbOrdem.Text = 'MEDIA DOS ATRIBUTOS'));
  Panel6.Visible := ((cbOrdem.Text = 'ATRIBUTOS') or (cbOrdem.Text = 'MEDIA DOS ATRIBUTOS'));
  Panel7.Visible := ((cbOrdem.Text = 'ATRIBUTOS') or (cbOrdem.Text = 'MEDIA DOS ATRIBUTOS'));

  if cbOrdem.Text = 'ATRIBUTOS' then
  begin
    Label76.Caption := 'Ordem a ser seguida de acordo com a sequência dos atributos definidos na tabela abaixo!';
    Label76.Visible := true;
    mkTipo.Text := _LerConfiguracoesRegistroString('mkTipo');
  end
  else if cbOrdem.Text = 'MEDIA DOS ATRIBUTOS' then
  begin
    Label76.Caption := 'Ordem a ser seguida de acordo com a soma dos atributos definidos na tabela abaixo!';
    Label76.Visible := true;
    mkTipo.Text := _LerConfiguracoesRegistroString('mkTipo');
  end;

  if ((cbOrdem.Text = 'ATRIBUTOS') or (cbOrdem.Text = 'MEDIA DOS ATRIBUTOS')) then
  begin
    pnOrdenarRel.Width := 489;
    pnOrdenarRel.Height := 329;
    if (Self.Enabled) and (Self.Visible) and (DBGrid8.CanFocus) then
     DBGrid8.SetFocus;
  end
  else
  begin
    pnOrdenarRel.Width := 489;
    pnOrdenarRel.Height := 89;
  end;
end;

procedure TFrmSugestCompraVenda.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox1.Text = 'COMPRA' then
  begin
   TabSheet5.TabVisible:=true;
   DBEdit32.Enabled:=true;
   DBLookupComboBox2.Enabled:=True;
  end
  else
  begin
   TabSheet5.TabVisible:=false;
   DBEdit32.Enabled:=False;
   DBLookupComboBox2.Enabled:=False;
  end;
end;

procedure TFrmSugestCompraVenda.DBComboBox2Exit(Sender: TObject);
var
 vdep: string;
begin
  inherited;
 if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;
    
 if trim(DBComboBox2.Text) = '' then
 begin
 	 Application.MessageBox('Tipo do Departamento deve ser informado','Atenção',MB_OK+MB_ICONINFORMATION);
 	 if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
   	 DBComboBox2.SetFocus;
   exit;
 end;		
 if DbComboBox2.Text = 'PRODUTOS' then
  vdep:='CODDEPPRODUTOS'
 else
  if DbComboBox2.Text = 'SERVIÇOS' then
    vdep:='CODDEPOFICINA'
  else
   if DbComboBox2.Text = 'VEICULOS' then
    vdep:='CODDEPVEICULOS'
   else
    if dbComboBox2.Text = 'VEICULOS SEMI-NOVOS' then
     vdep:='CODDEPVEICULOSUS'
    else
     vdep:='99';

 if not obCompraVenda.verificarDNA(obCompraVenda.vercodigodep(vdep)) then
 begin
    Application.MessageBox('Não Encontrado a fórmula do DNA do DEPTO/EMPRESA','Atenção',MB_OK+MB_ICONINFORMATION);
    _HabilitarCampos(false);
    if (Self.Enabled) and (Self.Visible) and (BitBtn12.CanFocus) then
     BitBtn12.setfocus;
 end
 else
  obCompraVenda.Preenchcampos;
 DBComboBox1.Enabled:=false;
 DBComboBox2.Enabled:=false;
 obMargemProd.vmesap:=obCompraVenda.vmesap;
 obMargemProd.vanoap:=obCompraVenda.vanoap;
 obMargemProd.vProd.vmesap:=obCompraVenda.vmesap;
 obMargemProd.vProd.vanoap:=obCompraVenda.vanoap;
 obMargemProd.vProd.vfatapura:=obCompraVenda.vfatapura;
 obMargemProd.vProd.VCF:=obCompraVenda.VCF;
 obMargemProd.vProd.VPERCCF:=obCompraVenda.VPERCCF;
 obMargemProd.vProd.VCMV:=obCompraVenda.VCMV;
 obMargemProd.vProd.VOCV:=obCompraVenda.VOCV;
 obMargemProd.vProd.vDNA:=obCompraVenda.vDNA;
 obMargemProd.vProd.vMargemMin:=obCompraVenda.vMargemMin;
 obMargemProd.vProd.vMarkupmin:=obCompraVenda.vMarkupmin;
 obMargemProd.vProd.vPercBaseADIRRF:=obCompraVenda.vPercBaseADIRRF;
// obCompraVenda.cadCotacaoItens.abrecotacaoitens(obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger,ComboBox1.Text);
end;

procedure TFrmSugestCompraVenda.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
   if DbComboBox3.Text = '' then
   begin
     Application.MessageBox('Campo Obrigatório','Atenção',MB_OK+MB_ICONINFORMATION);
     if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
     	 DbComboBox3.SetFocus;
   end;
end;

procedure TFrmSugestCompraVenda.DBComboBox4Exit(Sender: TObject);
begin
  inherited;
 if ActiveControl = DbComboBox4 then
 begin
   if (DbComboBox4.Text = '') then
   begin
     Application.MessageBox('Campo Obrigatório','Atenção',MB_OK+MB_ICONINFORMATION);
      if (Self.Enabled) and (Self.Visible) and (DbComboBox4.CanFocus) then
       DbComboBox4.SetFocus;
     exit;
   end
 end
 else if ActiveControl = DBLookupComboBox3  then
 begin
   if (DBLookupComboBox3.Text = '') then
   begin
     Application.MessageBox('Campo Obrigatório','Atenção',MB_OK+MB_ICONINFORMATION);
     if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
       DBLookupComboBox3.SetFocus;
     exit;
   end;
 end;
end;

procedure TFrmSugestCompraVenda.DBEdit22Exit(Sender: TObject);
begin
  inherited;
	BitBtn17Click(Sender);
end;

procedure TFrmSugestCompraVenda.DBEdit23Exit(Sender: TObject);
begin
  inherited;
  BitBtn17Click(Sender);
  if (Self.Enabled) and (Self.Visible) and (BitBtn9.CanFocus) then
    BitBtn9.SetFocus;
end;

procedure TFrmSugestCompraVenda.DBEdit29Enter(Sender: TObject);
begin
  inherited;
  if obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA' then
  begin
    PageControl2.ActivePage:=TabSheet5;
    if (Self.Enabled) and (Self.Visible) and (DBEdit44.CanFocus) then
    	DBEdit44.SetFocus;
  end;
end;

procedure TFrmSugestCompraVenda.DBEdit2Exit(Sender: TObject);
var
 vdias, vCodFornec, vCondPag: integer;
 vGrupoProd: Integer;
 vCodProd, vNumFabr, vTipV, acao: string;

 procedure InserirItens;
 begin
  if acao = 'EDITAR' then
    obCompraVenda.cadCotacaoItens.Edit
  else
    obCompraVenda.cadCotacaoItens.Insert;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COTACAO').AsInteger:=
    obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_EMPRESA').AsString:=
    vDadosIni.codEmpresa;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPOOP').AsString:=
    obCompraVenda.dataSet.FieldByName('TIPOOP').AsString;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPODEP').AsString:=
    obCompraVenda.dataSet.FieldByName('TIPODEP').AsString;

  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger := vCodFornec;

  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPVENDA').AsString := vTipV;

  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString := vNumFabr;

  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COND_PAG').AsInteger := vCondPag;

  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_LISTA').AsInteger := obCompraVenda.dataSet.FieldByName('COD_LISTA').AsInteger;
 end;
begin
  inherited;
  if obCompraVenda.cadCotacaoItens.dataSet.State = dsEdit then
    acao := 'EDITAR'
  else
    acao := 'INSERIR';

 if (ActiveControl <> BitBtn11) and (ActiveControl <> BitBtn5) then
 begin
   if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString = '' then
   begin
      try
        Screen.Cursor := crHourGlass;
        if (obCompraVenda.dataSet.FieldByName('COD_LISTA').AsInteger > 0) and
          (obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA') then
        begin
           EditCodLista.Text := IntToStr(obCompraVenda.dataset.FieldByName('COD_LISTA').AsInteger);
           obCompraVenda.abreListaCotacao(1);
           obCompraVenda.cadCotacaoItens.dataset.FieldByName('NUM_FAB_PROD').AsString := obCompraVenda.fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').AsString;
        end
        else
        begin
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
          if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').dataSet.State in [dsInsert, dsEdit] then
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString :=  vDadosIni.vPesquisa;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
   end;

   if obCompraVenda.dataSet.FieldByName('COD_LISTA').AsInteger > 0 then
   begin
     if obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA' then
     begin
       if (DBLookupComboBox2.Text = '') then
       begin
         Application.MessageBox('Campo Obrigatório','Atenção',MB_OK+MB_ICONINFORMATION);
         if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
           DBLookupComboBox2.SetFocus;
         exit;
       end;

       if (DBLookupComboBox4.Text = '') then
       begin
         Application.MessageBox('Campo Obrigatório','Atenção',MB_OK+MB_ICONINFORMATION);
         if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
           DBLookupComboBox4.SetFocus;
         exit;
       end;

       if DbComboBox3.Text = '' then
       begin
         Application.MessageBox('Campo Obrigatório','Atenção',MB_OK+MB_ICONINFORMATION);
         if (Self.Enabled) and (Self.Visible) and (DbComboBox3.CanFocus) then
         	 DbComboBox3.SetFocus;
         exit;
       end;

       vGrupoProd := obCompraVenda.fTempListaCotacaoItens.FieldByName('GRUPO_PROD').AsInteger;
       vCodProd := trim(obCompraVenda.fTempListaCotacaoItens.FieldByName('COD_PROD').AsString);
       vNumFabr := trim(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString);
       vCodFornec := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger;
       vTipV := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('TIPVENDA').AsString;
       vCondPag := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COND_PAG').AsInteger;

       obCompraVenda.fTempListaCotacaoItens.Filtered := false;
       obCompraVenda.fTempListaCotacaoItens.Filter := 'num_fab_prod = ' + QuotedStr(trim(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString));
       obCompraVenda.fTempListaCotacaoItens.Filtered := true;

       if (vNumFabr <> trim(obCompraVenda.fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').AsString)) then
       begin
          obCompraVenda.fTempListaCotacaoItens.Filtered := false;
          Application.MessageBox('Produto não encontrado na lista de cotação!', 'Confirmação', MB_OK);
          if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          	DBEdit2.SetFocus;
          InserirItens;
          exit;
       end;

       obCompraVenda.fTempListaCotacaoItens.Filtered := false;
       obCompraVenda.cadCotacaoItens.Cancel;

       obCompraVenda.cadCotacaoItens.dataSet.Filtered := false;
       obCompraVenda.cadCotacaoItens.dataSet.Filter :=
       		' grupo = ' + IntToStr(vGrupoProd) +
          ' and cod_prod = ' + QuotedStr(trim(vCodProd)) +
       		' and cod_fornecedor = ' + IntToStr(vCodFornec);
       obCompraVenda.cadCotacaoItens.dataSet.Filtered := true;

       if not ((obCompraVenda.cadCotacaoItens.dataSet.FieldByName('GRUPO').OldValue = obCompraVenda.cadCotacaoItens.dataSet.FieldByName('GRUPO').NewValue)
	       and (Trim(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_PROD').OldValue) = Trim(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_PROD').NewValue))
         and (obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').OldValue = obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').NewValue)) then
         if (vNumFabr = trim(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString)) and
          (vCodFornec = obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger) then
         begin
            obCompraVenda.cadCotacaoItens.dataSet.Filtered := false;
            Application.MessageBox(PChar('Produto já existente na lista de cotação para fornecedor = ' + IntToStr(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger) + ':' + #13 + #13 +
            	'Grupo Prod: ' + IntToStr(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('GRUPO_PROD').AsInteger) + #13 +
              'Cod Prod: ' + Trim(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_PROD').AsString) + #13 +
              'Numero Fabricante: ' + Trim(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString)), 'Confirmação', MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
            	DBEdit2.SetFocus;
            InserirItens;
            exit;
         end;
       obCompraVenda.cadCotacaoItens.dataSet.Filtered := false;

       InserirItens;
     end;
   end;
   if not obCompraVenda.cadCotacaoItens.cadprodutos.buscaProduto(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString) then
   begin
     Application.MessageBox('Produto não encontrado!', 'Confirmação', MB_OK);
     if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
     	 DBEdit2.SetFocus;
     exit;
   end;

   frmMargemProduto.vflgchamada:=1;
   frmMargemProduto.ComboBox1.Text:=DBComboBox2.Text;
   if obCompraVenda.cadCotacaoItens.cadprodutos.vPequisaPorDescr then
   begin
     frmMargemProduto.edNumFabProd.Text:=
     	 obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('NUM_FAB_PROD').AsString;
     obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
     	 obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('NUM_FAB_PROD').AsString;
   end
   else
	   frmMargemProduto.edNumFabProd.Text:= obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString;
   // frmMargemProduto.edNumFabProdExit(sender);
   // frmMargemProduto.BitBtn1Click(sender);
   if copy(DBComboBox3.Text,1,1) = 'V' then
   begin
    frmMargemProduto.rbVendaVarejoClick(Sender);
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_UN_VENDA_SIM').AsFloat :=
    obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('PREC_TAB_PROD').AsFloat;
   end
   else
   begin
    frmMargemProduto.rbVendaAtacadoClick(sender);
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_UN_VENDA_SIM').AsFloat:=
    obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('PREC_PUBLICO').AsFloat;
   end;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('GRUPO').AsInteger:=
   obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('GRUPO_PROD').asinteger;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_PROD').asstring:=
   obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('COD_PROD').AsString;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('DESCR_PROD').AsString:=
   obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('DESCR_PROD').asstring;
//    obMargemProd.vProd.vdescprodserv;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('MVA_SIM').AsFloat:=
   obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('MVA_NCM').AsFloat;
   obCompraVenda.cadCotacaoItens.dataset.FieldByName('PME').asfloat:=
   obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('VALORPME').AsFloat;
   // posso utilizar aqui o dmd do produto multiplicando pelos dias_disponvíveis do mês
   if obCompraVenda.dataSet.FieldByName('QTDE_DIAS_DISP').AsInteger <> 0 then
    vdias := obCompraVenda.dataSet.FieldByName('QTDE_DIAS_DISP').AsInteger
   else
    vdias := obCompraVenda.vdiasmeses;

   if ((obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('VALORPME').AsFloat)*vdias) > 0 then
   begin
     obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_PMEMES').AsFloat :=
       (obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('EST_F').AsFloat/
        obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('VALORPME').AsFloat)*
       vdias;
   end;
   if copy(dbcombobox3.Text, 1, 1) = 'A' then
   begin
     obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_PMEMES').AsFloat :=
       (obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('PREC_PUBLICO').AsFloat*
        obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_PMEMES').AsFloat);
   end
   else
   begin
     obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_VENDA_PMEMES').AsFloat :=
       (obCompraVenda.cadCotacaoItens.cadprodutos.dataSet.FieldByName('PREC_TAB_PROD').AsFloat*
        obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_VENDA_PMEMES').AsFloat);
   end;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CLASS_FREQ').AsString:=
   obMargemProd.vProd.vclfreq;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CLASS_AT').AsString:=
   obMargemProd.vProd.vclatual;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CURVA').AsString:=
   obMargemProd.vProd.vcldemand;
   if obCompraVenda.dataSet.FieldByName('TIPOOP').AsString <> 'COMPRA' then
    obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat:=
    obMargemProd.vProd.vpreccusto;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_VENDIDA').AsFloat:=
   obMargemProd.vProd.vqtdeProd;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_MEDIO_VENDA').AsFloat:=
   obMargemProd.vProd.vvalprod;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('MARGEM_PRATICADA').AsFloat:=
   frmMargemProduto.edLucroLiquidoSobreFaturamentoPerc.Valor;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('MARKUP_PRATICADO').AsFloat:=
   frmMargemProduto.edtMarkup.Valor;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('QTDE_EQUILIBRIO').AsFloat:=
   frmMargemProduto.edtQtdeVenda.Valor;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_EQUILIBRIO').AsFloat:=
   frmMargemProduto.EdtPeProduto.Valor;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_FIXO_PROP').AsFloat:=
   frmMargemProduto.edValorDespesasFixas.Valor;
   obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_VARIAVEL').AsFloat:=
   frmMargemProduto.EdtCustosVariaveis.Valor;
 end;
end;

procedure TFrmSugestCompraVenda.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
        Screen.Cursor := crHourGlass;
        if (obCompraVenda.dataset.FieldByName('COD_LISTA').AsInteger > 0) and (obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA') then
        begin
          EditCodLista.Text := IntToStr(obCompraVenda.dataset.FieldByName('COD_LISTA').AsInteger);
          obCompraVenda.abreListaCotacao(1);
          obCompraVenda.cadCotacaoItens.dataset.FieldByName('NUM_FAB_PROD').AsString := obCompraVenda.fTempListaCotacaoItens.FieldByName('NUM_FAB_PROD').AsString;
          obCompraVenda.cadCotacaoItens.dataset.FieldByName('QTDE_SIMULADA').AsFloat := obCompraVenda.fTempListaCotacaoItens.FieldByName('QUANT_PROD').AsFloat;
        end
        else
        begin
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
          if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').dataSet.State in [dsInsert, dsEdit] then
            obCompraVenda.cadCotacaoItens.dataSet.FieldByName('NUM_FAB_PROD').AsString :=  vDadosIni.vPesquisa;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
  end;
end;

procedure TFrmSugestCompraVenda.DBEdit30Exit(Sender: TObject);
begin
  inherited;
BitBtn17Click(Sender);
end;


procedure TFrmSugestCompraVenda.DBEdit32Exit(Sender: TObject);
begin
  inherited;
   if not (obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA') then
     exit;

   if (ActiveControl = BitBtn11) or (ActiveControl = BitBtn5) then
     exit;

   vCodFornecNew := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger;
   if vCodFornecOld <= 0 then
     vCodFornecOld := vCodFornecNew;     

   if vCodFornecNew <> vCodFornecOld then
   begin
     obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COND_PAG').AsInteger :=
     obCompraVenda.cadfornecedor.dataSet.FieldByName('COD_COND_PAG').AsInteger;

     obCompraVenda.cadCotacaoItens.dataSet.FieldByName('PRAZO_MEDIO_ENT').AsFloat :=
     obCompraVenda.cadfornecedor.dataSet.FieldByName('PRAZO_MEDIO_ENT').AsFloat;

     obCompraVenda.cadCotacaoItens.dataSet.FieldByName('PRAZO_MEDIO_PAG').AsFloat :=
   obCompraVenda.cadfornecedor.dataSet.FieldByName('PRAZO_MEDIO_PAG').AsFloat;
   end;
   vCodFornecOld := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger;

   if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsInteger > 0 then
     if (DBLookupComboBox2.Text = '') then
     begin
       Application.MessageBox('Campo Obrigatório','Atenção',MB_OK+MB_ICONINFORMATION);
       obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COND_PAG').AsInteger := 0;
       obCompraVenda.cadCotacaoItens.dataSet.FieldByName('PRAZO_MEDIO_ENT').AsFloat := 0;
       obCompraVenda.cadCotacaoItens.dataSet.FieldByName('PRAZO_MEDIO_PAG').AsFloat := 0;
       if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
         DBEdit32.SetFocus;
       exit;
     end;
end;

procedure TFrmSugestCompraVenda.DBEdit32KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_FORNECEDOR').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmSugestCompraVenda.DBEdit38Exit(Sender: TObject);
begin
  inherited;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
  	obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat +
  	(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat *
  	 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('FRETE_SIM').AsFloat / 100);
end;

procedure TFrmSugestCompraVenda.DBEdit39Exit(Sender: TObject);
begin
  inherited;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
  	obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat +
  	(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat*
  	 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('IPI_SIM').AsFloat / 100);
end;

procedure TFrmSugestCompraVenda.DBEdit41Exit(Sender: TObject);
begin
  inherited;
  vdificm := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat -
  	(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat *
  	 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('IPI_SIM').AsFloat / 100);

  vdificm := vdificm*obCompraVenda.cadCotacaoItens.dataSet.FieldByName('ICM_ENTRADA').AsFloat / 100;
end;

procedure TFrmSugestCompraVenda.DBEdit42Exit(Sender: TObject);
begin
  inherited;
  vdificm1 := obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat +
  	(obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat *
  	 obCompraVenda.cadCotacaoItens.dataSet.FieldByName('MVA_SIM').AsFloat / 100);

  vdificm1 := vdificm1*obCompraVenda.cadCotacaoItens.dataSet.FieldByName('ICM_SAIDA').AsFloat / 100;
  
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
		obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat + (vdificm1-vdificm);
end;

procedure TFrmSugestCompraVenda.DBEdit43Exit(Sender: TObject);
begin
  inherited;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
  	obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat +
	  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('OUTRAS_DESP_SIM').AsFloat;
end;

procedure TFrmSugestCompraVenda.DBEdit44Exit(Sender: TObject);
begin
  inherited;
  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('CUSTO_UN_SIM').AsFloat :=
	  obCompraVenda.cadCotacaoItens.dataSet.FieldByName('VALOR_SIM_FORN').AsFloat;
end;

procedure TFrmSugestCompraVenda.DBEdit45Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit46.CanFocus) then
    DBEdit46.SetFocus;
end;

procedure TFrmSugestCompraVenda.DBEdit46Exit(Sender: TObject);
begin
  inherited;
 if obCompraVenda.dataset.FieldByName('COD_LISTA').AsInteger > 0 then
 begin
   EditCodLista.Text := IntToStr(obCompraVenda.dataset.FieldByName('COD_LISTA').AsInteger);
   EditDesricao.Text := '';
   MaskEditDataEntIni.Text := '';
   MaskEditDataEntFim.Text := '';

   if not obCompraVenda.ProdExisteNaListaCotacao(obCompraVenda.dataset.FieldByName('COD_LISTA').AsInteger) then
   begin
     if (Self.Enabled) and (Self.Visible) and (DBEdit46.CanFocus) then
       DBEdit46.SetFocus;
     exit;
   end;

   obCompraVenda.abreListaCotacao(1);
 end;
end;

procedure TFrmSugestCompraVenda.DBEdit49Exit(Sender: TObject);
begin
  inherited;
  if obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COND_PAG').AsInteger > 0 then
     if (DBLookupComboBox4.Text = '') then
     begin
       Application.MessageBox('Campo Obrigatório','Atenção',MB_OK+MB_ICONINFORMATION);
       if (Self.Enabled) and (Self.Visible) and (DBEdit49.CanFocus) then
         DBEdit49.SetFocus;
       exit;
     end;
end;

procedure TFrmSugestCompraVenda.DBEdit49KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      obCompraVenda.cadCotacaoItens.dataSet.FieldByName('COD_COND_PAG').AsString := vDadosIni.pesquisaRapida('COND_PAG');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmSugestCompraVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_RETURN then
  	SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if Key = VK_INSERT then
    BitBtn3Click(Sender);
end;

procedure TFrmSugestCompraVenda.DBGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = 38) or (key = 40) then
   calculaperc;
end;
procedure TFrmSugestCompraVenda.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_RETURN) or (Key = VK_TAB)) then
  	if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
  		EditHw1.SetFocus;
end;

procedure TFrmSugestCompraVenda.DBGrid3TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid3, Column);
end;

procedure TFrmSugestCompraVenda.DBGrid4CellClick(Column: TColumn);
begin
  if UpperCase(trim(Column.FieldName)) = 'SEL' then
  	if not obCompraVenda.fTempListaCotacaoItens.IsEmpty then
	    obCompraVenda.marcaDesmarcaLinha(obCompraVenda.fTempListaCotacaoItens);
end;

procedure TFrmSugestCompraVenda.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
  if not obCompraVenda.fTempListaCotacaoItens.IsEmpty then
    obCompraVenda.marcaDesmarcaLinha(obCompraVenda.fTempListaCotacaoItens);
end;

procedure TFrmSugestCompraVenda.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
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

procedure TFrmSugestCompraVenda.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if Key = VK_SPACE then
  begin
    if not obCompraVenda.fTempListaCotacaoItens.IsEmpty then
      obCompraVenda.marcaDesmarcaLinha(obCompraVenda.fTempListaCotacaoItens2);
  end
  else if ((Key = VK_RETURN) or (Key = VK_TAB)) then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn18.CanFocus) then
      BitBtn18.SetFocus;
  end;
end;

procedure TFrmSugestCompraVenda.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
  exit;
  vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
end;

procedure TFrmSugestCompraVenda.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_RETURN) or (Key = VK_TAB)) then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
    	DBGrid6.SetFocus;
end;

procedure TFrmSugestCompraVenda.DBGrid5TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid5, Column);
end;

procedure TFrmSugestCompraVenda.DBGrid6CellClick(Column: TColumn);
begin
	if UpperCase(Trim(Column.FieldName)) = 'SEL' then
    if not obCompraVenda.fTempCotacaoItens.IsEmpty then
      obCompraVenda.marcaDesmarcaLinha(obCompraVenda.fTempCotacaoItens);
end;

procedure TFrmSugestCompraVenda.DBGrid6DblClick(Sender: TObject);
begin
  inherited;
  if not obCompraVenda.fTempCotacaoItens.IsEmpty then
    obCompraVenda.marcaDesmarcaLinha(obCompraVenda.fTempCotacaoItens);
end;

procedure TFrmSugestCompraVenda.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
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

procedure TFrmSugestCompraVenda.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if not obCompraVenda.fTempCotacaoItens.IsEmpty then
      obCompraVenda.marcaDesmarcaLinha(obCompraVenda.fTempCotacaoItens);

  if ((Key = VK_RETURN) or (Key = VK_TAB)) then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn14.CanFocus) then
      BitBtn14.SetFocus;
end;

procedure TFrmSugestCompraVenda.DBGrid6TitleClick(Column: TColumn);
begin
  inherited;
  exit;
	vDadosIni.DBGridOnTitleClick(DBGrid6, Column);
end;

procedure TFrmSugestCompraVenda.DBGrid7CellClick(Column: TColumn);
begin
  inherited;
  if UpperCase(trim(Column.FieldName)) = 'SEL' then
    if not obCompraVenda.fTempListaCotacaoItens2.IsEmpty then
     obCompraVenda.marcaDesmarcaLinha(obCompraVenda.fTempListaCotacaoItens2);
end;

procedure TFrmSugestCompraVenda.DBGrid7DblClick(Sender: TObject);
begin
  inherited;
  if not obCompraVenda.fTempListaCotacaoItens2.IsEmpty then
   obCompraVenda.marcaDesmarcaLinha(obCompraVenda.fTempListaCotacaoItens2);
end;

procedure TFrmSugestCompraVenda.DBGrid7DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00FFECD9);
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

procedure TFrmSugestCompraVenda.DBGrid7TitleClick(Column: TColumn);
begin
  inherited;
  exit;
  vDadosIni.DBGridOnTitleClick(DBGrid7, Column);
end;

procedure TFrmSugestCompraVenda.DBGrid8DblClick(Sender: TObject);
begin
  inherited;
  if DBGrid8.DataSource.DataSet.IsEmpty then
  begin
    mkTipo.text := '';
    exit;
  end;

  if mkTipo.text <> '' then
  begin
    if (pos(copy(mkTipo.text, 1, 1), ',') <> 0) then
      mkTipo.text := StringReplace(mkTipo.text, ',', '(', [rfIgnoreCase]);
    if (pos(copy(mkTipo.text, 1, 1), '(') = 0) then
      mkTipo.text := '(' + mkTipo.text;
    if (pos(copy(mkTipo.text, length(mkTipo.text), 1), ')') = 0) then
      mkTipo.text := mkTipo.text + ')';
  end;
  if (pos(mkTipo.text, '(' + obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring + ')') <>
    0) then
  begin
    mkTipo.text := StringReplace(mkTipo.text, '(' +
      obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring + ')', '', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring + ')', mkTipo.text) <>
    0) then
  begin
    mkTipo.text := StringReplace(mkTipo.text, trim(',' +
      obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring + ')'), ')', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring + ',', mkTipo.text) <>
    0) then
  begin
    mkTipo.text := StringReplace(mkTipo.text, ',' +
      obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring + ',', ',', [rfIgnoreCase]);
    exit;
  end;
  if (pos('(' + obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring + ',', mkTipo.text) <>
    0) then
  begin
    mkTipo.text := StringReplace(mkTipo.text, '(' +
      obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring + ',', '(', [rfIgnoreCase]);
    exit;
  end;

  if mkTipo.text <> '' then
    mkTipo.text := copy(mkTipo.text, 1, pos(')', mkTipo.text) - 1)
      + ',' + obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring + ')'
  else
    mkTipo.text := mkTipo.text + '(' + obCompraVenda.fTempAtributos.FieldByName('COD_ATRIBUTO').asstring
      + ')';
end;

procedure TFrmSugestCompraVenda.DBGrid8DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
 if (EditFiscal1.Text <> '') then
  begin
    if gdSelected in State then
    begin
       TDBGrid(sender).canvas.brush.color := clGradientActiveCaption;
       TDBGrid(sender).canvas.Font.color := clBlack;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TFrmSugestCompraVenda.DBGrid8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
  begin
  	if (Self.Enabled) and (Self.Visible) and (BitBtn25.CanFocus) then
   		BitBtn25.SetFocus;
  end
  else if Key = VK_RETURN then
    DBGrid8DblClick(Sender);
end;

procedure TFrmSugestCompraVenda.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  try
  EditHw1.AsValue := DBLookupComboBox3.KeyValue;

  EditHw2.AsValue := obCompraVenda.cadfornecedor.dataSet.FieldByName('COD_COND_PAG').AsInteger;
  EditHw3.AsValue :=  obCompraVenda.cadfornecedor.dataSet.FieldByName('PRAZO_MEDIO_ENT').AsFloat;
  EditHw4.AsValue :=  obCompraVenda.cadfornecedor.dataSet.FieldByName('PRAZO_MEDIO_PAG').AsFloat;
  except
  end;
end;

procedure TFrmSugestCompraVenda.DBLookupComboBox5Exit(Sender: TObject);
begin
  inherited;
 try
  EditHw2.AsValue := DBLookupComboBox5.KeyValue;
 except
 end;
end;

procedure TFrmSugestCompraVenda._HabilitarCampos(habilitar: boolean = true);
begin
 DBEdit46.Enabled := habilitar;
 Panel13.Enabled := habilitar;
 BitBtn27.Enabled := habilitar;
 BitBtn15.Enabled := habilitar;
 PageControl2.Enabled := habilitar;
 BitBtn8.Enabled := habilitar;
 BitBtn10.Enabled := habilitar;
 BitBtn11.Enabled := habilitar;
 BitBtn7.Enabled := habilitar;
 BitBtn106.Enabled := habilitar;
 BitBtn100.Enabled := habilitar;
 BitBtn20.Enabled := habilitar;
 BitBtn24.Enabled := habilitar;
end;

procedure TFrmSugestCompraVenda.EditFiscal1Change(Sender: TObject);
begin
  inherited;
  if (EditFiscal1.Text <> '') then
   obCompraVenda.fTempAtributos.Locate('DESCRICAO_ATRIBUTO', trim(EditFiscal1.Text), [loCaseInsensitive, loPartialKey]);
end;

procedure TFrmSugestCompraVenda.EditFiscal1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) OR (Key = VK_RETURN)  then
    if (Self.Enabled) and (Self.Visible) and (DBGrid8.CanFocus) then
      DBGrid8.SetFocus
end;

procedure TFrmSugestCompraVenda.EditHw1Exit(Sender: TObject);
begin
  inherited;
  try
  DBLookupComboBox3.KeyValue := EditHw1.AsInteger;
  EditHw2.AsValue :=  obCompraVenda.cadfornecedor.dataSet.FieldByName('COD_COND_PAG').AsInteger;
  EditHw3.AsValue :=  obCompraVenda.cadfornecedor.dataSet.FieldByName('PRAZO_MEDIO_ENT').AsFloat;
  EditHw4.AsValue :=  obCompraVenda.cadfornecedor.dataSet.FieldByName('PRAZO_MEDIO_PAG').AsFloat;
  except
  end;
end;

procedure TFrmSugestCompraVenda.EditHw1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHw1.Text := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmSugestCompraVenda.EditHw2Exit(Sender: TObject);
begin
  inherited;
  try
   DBLookupComboBox5.KeyValue := EditHw2.AsInteger;
  except
  end;
end;

procedure TFrmSugestCompraVenda.ExibirCampos;
begin
  DBEdit46.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  BitBtn27.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  Label62.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  DBEdit49.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  DBLookupComboBox4.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  Label69.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  Label67.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  Label68.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  DBEdit47.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  DBEdit48.Visible := obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA';
  BitBtn20.Visible := ((obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA') and (obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger > 0));
  BitBtn24.Visible := ((obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA') and (obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger > 0));

  if obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA' then
  begin
   Label18.Top := 53;
   DBComboBox3.Top := 51;
   Label8.Top := 53;
   DBEdit2.Top := 51;
   Label12.Top := 80;
   DBEdit3.Top := 77;
   Label14.Top := 108;
   DBEdit5.Top := 103;
   Label41.Top := 135;
   DBEdit29.Top := 131;
   Label42.Top := 135;
   DBEdit30.Top := 131;
   Label34.Top := 163;
   DBEdit22.Top := 158;
   Label35.Top := 163;
   DBEdit23.Top := 158;
  end
  else
  begin
    Label18.Top := 28;
    DBComboBox3.Top := 26;
    Label8.Top := 28;
    DBEdit2.Top := 26;
    Label12.Top := 53;
    DBEdit3.Top := 51;
    Label14.Top := 82;
    DBEdit5.Top := 77;
    Label41.Top := 108;
    DBEdit29.Top := 103;
    Label42.Top := 108;
    DBEdit30.Top := 103;
    Label34.Top := 135;
    DBEdit22.Top := 131;
    Label35.Top := 135;
    DBEdit23.Top := 131;
  end;
end;

procedure TFrmSugestCompraVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
// frmMargemProduto.free;
 UnloadPackage(hMargem);
 obCompraVenda.Free;
 obCompraVenda := nil;

  Action := caFree;
  FrmSugestCompraVenda:=nil;
end;

procedure TFrmSugestCompraVenda.FormCreate(Sender: TObject);
begin
 vCriou := 0;
 TelaCadastro := vDadosIni.vTipoForm;
 inherited;
 CarregaPacote('pkmargem', hmargem);
 dtmMargemProd:= TdtmMargemProd.Create(dtmMargemProd);
 if frmMargemProduto = nil then
  frmMargemProduto:=TfrmMargemProduto.Create(frmMargemProduto);
 CheckBox3.Enabled := false;
 CheckBox1.Enabled := false;
 TabSheet3.Visible := true;
 TabSheet7.TabVisible := false;
 TabSheet8.TabVisible := false;
 TabSheet9.TabVisible := false;
 TabSheet6.TabVisible := false;
 tsOrdenarRel.TabVisible := false;

 if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
 inherited;
end;

procedure TFrmSugestCompraVenda.FormShow(Sender: TObject);
var
 i: integer;
begin
  if not Self.Enabled then
    Exit;

//  inherited;
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmGestorHw.DtCotacao;
    inherited;
    if vCriou = 0 then
	    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [GES032]';
  end;

  for I := 0 to self.ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).CharCase:= ecUpperCase;
  end;
  obCompraVenda:=Tcotacao.create;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not obCompraVenda._lixeiraCheia);
  end;

  vdificm:=0;
  vdificm1:=0;

  if vCriou = 0 then
    vCriou := 1;
end;

procedure TFrmSugestCompraVenda.MaskEditDataEntFimEnter(Sender: TObject);
begin
  inherited;
 mostrarHintEmBalao(MaskEditDataEntFim.Handle, PChar('Data final para pesquisar os registros salvos' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TFrmSugestCompraVenda.MaskEditDataEntIniEnter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(MaskEditDataEntIni.Handle, PChar('Data inicial para pesquisar os registros salvos' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TFrmSugestCompraVenda.MaskEditDataEntIniKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if Key = VK_ESCAPE then
  begin
    TMaskEdit(Sender).Text := '99/99/9999';
    TMaskEdit(Sender).Clear;
  end;
  inherited;
end;

procedure TFrmSugestCompraVenda.mkTipoChange(Sender: TObject);
begin
  inherited;
mkTipo.text := StringReplace(mkTipo.text, ' ', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFrmSugestCompraVenda.SpeedButton10Click(Sender: TObject);
begin
  inherited;
 obCompraVenda.cadCotacaoItens.dataSet.Next;
end;

procedure TFrmSugestCompraVenda.SpeedButton11Click(Sender: TObject);
begin
 if not vDadosIni.PesqPros('GES068', 'ACESSAR', '', 'ATRIBUTOS', '', obCompraVenda.buscas, true) then
  exit;
  try
    Screen.Cursor := crHourGlass;
    obCompraVenda.vAtributos._cadAtributos(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestCompraVenda.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  Panel4.Enabled := true;
  TabSheet5.Enabled := true;
  PageControl2.ActivePage:=TabSheet6;
  Panel4.Enabled:=true;
  Panel13.Enabled := true;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.Show;
  SpeedButton9.Visible := false;
  SpeedButton10.Visible := false;
  SpeedButton13.Visible := false;
end;

procedure TFrmSugestCompraVenda.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  mkTipo.Text := '';
  obCompraVenda.fTempAtributos.First;
  while not obCompraVenda.fTempAtributos.Eof do
  begin
   DBGrid8DblClick(Sender);
   obCompraVenda.fTempAtributos.Next;
  end;
  obCompraVenda.fTempAtributos.First;
end;

procedure TFrmSugestCompraVenda.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  obCompraVenda.fTempAtributos.First;
  mkTipo.Text := '';
end;

procedure TFrmSugestCompraVenda.SpeedButton1Click(Sender: TObject);
var
	I:Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('COTACAO', 'A', obCompraVenda.buscas) then
    Exit;

 if not vDadosIni.PesqPros('GES031','ALTERAR','COTACAO: '+obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString,'','',obCompraVenda.buscas,True) then
  Exit;

 if not obCompraVenda.Edit then
 	 exit;

 for I := 0 to DBComboBox2.Items.Count - 1 do
   if (Copy(trim(obCompraVenda.dataSet.FieldByName('TIPODEP').AsString), 1, 1) = Copy(trim(DBComboBox2.Items[I]), 1, 1)) then
   begin
     DBComboBox2.ItemIndex := I;
     break;
   end;

 DBComboBox2Exit(Sender);
 
 vitgeral:=obCompraVenda.cadCotacaoItens.vultimoitem;

 _HabilitarCampos(true);
 ExibirCampos;
 TabSheet3.TabVisible := true;
 TabSheet4.TabVisible := false;
 TabSheet5.TabVisible := false;
 SpeedButton9.Visible := false;
 SpeedButton10.Visible := false;
 SpeedButton13.Visible := false;
 Panel13.Enabled := true;
 DBComboBox2.Enabled:=False;
 BitBtn8.Enabled:=true;
 BitBtn9.Enabled:=false;
 BitBtn10.Enabled:=true;
 PageControl3.ActivePage := TabSheet3;
 PageControl2.ActivePage := TabSheet6;
 PageControl2.Enabled:=true;
 DBEdit46.Enabled := obCompraVenda.cadCotacaoItens.IsEmpty;
 BitBtn27.Enabled := (obCompraVenda.cadCotacaoItens.IsEmpty) or ((DBEdit46.Enabled = false) and (obCompraVenda.dataSet.FieldByName('COD_LISTA').AsInteger > 0));
 calculaperc;

 if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
   DBLookupComboBox1.SetFocus
 else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
 	 DBLookupComboBox1.SetFocus
 else if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
 	 DBComboBox2.SetFocus
 else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
 	 DBEdit4.SetFocus
 else if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
   DBEdit6.SetFocus
 else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
   DBEdit9.SetFocus
 else if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
   DBEdit10.SetFocus
 else if (Self.Enabled) and (Self.Visible) and (DBEdit45.CanFocus) then
   DBEdit45.SetFocus;
end;

procedure TFrmSugestCompraVenda.SpeedButton25Click(Sender: TObject);
begin
  inherited;
//  if vDadosIni.PesqPros('COT007', '', obCompraVenda.buscas, true) then
  if not vDadosIni.PesqPros('GES033','VER LIXEIRA','COTACAO PARA COMPRA/VENDA DE PRODUTOS','','',obCompraVenda.buscas,True) then
   Exit;
  begin
    inherited;
    //    Cliente.AbrirLixeira;
    //    if Cliente.dataSet.FieldByName('ATIVO').AsInteger = 1 then
    if not obCompraVenda.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [GES032]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      SpeedButton6.Visible := true;
      SpeedButton8.Visible := true;
      SpeedButton7.Visible := true;
      SpeedButton11.Visible := true;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [GES032]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
      SpeedButton6.Visible := false;
      SpeedButton8.Visible := false;
      SpeedButton7.Visible := false;
      SpeedButton11.Visible := false;
    end;
  end;
end;

procedure TFrmSugestCompraVenda.SpeedButton2Click(Sender: TObject);
var
	vCodCotacao: Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('COTACAO', 'E', obCompraVenda.buscas) then
    Exit;

  if not vDadosIni.PesqPros('GES032','EXCLUIR',
  	'COTACAO: '+ obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString,'','',obCompraVenda.buscas,True) then
	   Exit;

  if obCompraVenda.dataSet.IsEmpty then
  	exit;

  vCodCotacao := obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger;

  if obCompraVenda.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
//        if vDadosIni.PesqPros('COT001', Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, false) then
      begin
        if obCompraVenda.Delete then
        begin
           obCompraVenda.Apply;
          if not obCompraVenda.CommitaTransacao then
            vDadosIni.GravaAuditoria('GES032', 'EXCLUIR', IntToStr(vCodCotacao) + ' não excluído.', '', IntToStr(vCodCotacao), obCompraVenda.buscas);
//          else
//              vDadosIni.GravaAuditoria('COT005',  + ' excluído.', Cliente.buscas);
        end
        else
          vDadosIni.GravaAuditoria('GES032', 'EXCLUIR', IntToStr(vCodCotacao) + ' não excluído.', '', IntToStr(vCodCotacao), obCompraVenda.buscas);
      end;
  end
  else
  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
  begin
  //  if vDadosIni.PesqPros('COT005', obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString, obCompraVenda.buscas, false) then
      obCompraVenda.EnviarPraLixeira;
      obCompraVenda.Refresh;
  end;
end;

procedure TFrmSugestCompraVenda.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if obCompraVenda.IsEmpty then
  	exit;

  if not (obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA') then
    exit;

  if not vDadosIni.PesqPros('GES077','IMPRIMIR','COTACAO: '+obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString,'','',obCompraVenda.buscas,True) then
    exit;

  cbOrdem.ItemIndex := _LerConfiguracoesRegistroInteger('cbOrdem');
  CheckBox2.Checked := _LerConfiguracoesRegistroBoolean('CheckBox2');

  obCompraVenda.AbreFormRel;
end;

procedure TFrmSugestCompraVenda.SpeedButton5Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('COTACAO', 'A', obCompraVenda.buscas) then
    Exit;
//  if vDadosIni.PesqPros('COT008', obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString,obCompraVenda.buscas, true) then
  if not vDadosIni.PesqPros('GES034','RESTAURAR','COTACAO: '+obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString,'','',obCompraVenda.buscas,True) then
   Exit;
  begin
    inherited;
    if not obCompraVenda.dataSet.IsEmpty then
      if obCompraVenda.dataSet.FieldByName('ATIVO').asinteger = 0 then
      begin
        if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?', 'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
        begin
          if obCompraVenda.Edit then
          begin
            obCompraVenda.dataSet.FieldByName('ATIVO').asinteger := 1;
            if obCompraVenda.Post then
              if obCompraVenda.Apply then
                if obCompraVenda.emTransacao then
                  obCompraVenda.CommitaTransacao;
          end;
        end;
      end
      else
        Application.MessageBox('Registro já está ativo' + chr(13) + 'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    obCompraVenda.Refresh;
  end;
end;

procedure TFrmSugestCompraVenda.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('GES031','VERIFICAR','COTACAO: '+obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString,'','',obCompraVenda.buscas,True) then
   Exit;
  if obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'COMPRA' then
  begin
      Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
      obCompraVenda.cotacaoOLAP(obCompraVenda.dataSet.FieldByName('TIPOOP').AsString,obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger,FrmVisualizaOlap.HCubeGERAL);
      FrmVisualizaOlap.Label1.Caption:='Melhor Proposta de compra para a Cotação '+
      vdadosini.StrZero(obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger,5)+' DE: '+
      obCompraVenda.dataSet.FieldByName('DATA_COTACAO').AsString;
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.BeginUpdate;
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.AddSummary('MARKUP','("valor_venda"."Sum")/"valor_compra"."Sum"');
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.Items[0].FunctionSum.SubFunctions[0].FormatString:='##0.0000';
//      vsumario.SummarySettings.Items[0].FunctionSum.
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.EndUpdate;
      FrmVisualizaOlap.ShowModal;
  end
  else
    Application.MessageBox('Esta cotação não é de COMPRA','Atenção',MB_OK+MB_ICONINFORMATION);
end;

procedure TFrmSugestCompraVenda.SpeedButton7Click(Sender: TObject);
begin
 if not vDadosIni.PesqPros('GES051', 'ACESSAR', '', 'LISTA_COTACAO', '', obCompraVenda.buscas, true) then
  exit;
  try
    Screen.Cursor := crHourGlass;
    obCompraVenda.vListaCotacao._cadListaCotacao(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmSugestCompraVenda.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('GES036','OLAP','COTACAO: '+obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsString,'','',obCompraVenda.buscas,True) then
   Exit;
  if obCompraVenda.dataSet.FieldByName('TIPOOP').AsString = 'VENDA' then
  begin
      Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
      obCompraVenda.cotacaoOLAP(obCompraVenda.dataSet.FieldByName('TIPOOP').AsString,obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger,FrmVisualizaOlap.HCubeGERAL);
      FrmVisualizaOlap.Label1.Caption:='Venda sugerida N.: '+
      vdadosini.StrZero(obCompraVenda.dataSet.FieldByName('COD_COTACAO').AsInteger,5)+' DE: '+
      obCompraVenda.dataSet.FieldByName('DATA_COTACAO').AsString;
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.BeginUpdate;
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.AddSummary('MARKUP','("valor_venda"."Sum")/"cmv_produto"."Sum"');
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.Items[0].FunctionSum.SubFunctions[0].FormatString:='##0.0000';
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.AddSummary('%Lucro','(("lucroapurado"."Sum")/"valor_venda"."Sum")*100');
//      vsumario.SummarySettings.Items[0].FunctionSum.
      FrmVisualizaOlap.HierCubeGrid1.SummarySettings.EndUpdate;
      FrmVisualizaOlap.ShowModal;
  end
  else
    Application.MessageBox('Esta não é uma sugestão de VENDA','Atenção',MB_OK+MB_ICONINFORMATION);

end;

procedure TFrmSugestCompraVenda.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  
  obCompraVenda.cadCotacaoItens.dataSet.Prior;
end;

function TFrmSugestCompraVenda._mdiAberto(pNomeFormMDI: string): Boolean;
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
        Application.MessageBox('Pedido de Compra esta aberto, feche a janela do Pedido de Compra para utilizar esta funcionalidade', 'Atenção', 64);
        Exit;
      end;
end;

initialization
  RegisterClass(TFrmSugestCompraVenda);
finalization
  UnRegisterClass(TFrmSugestCompraVenda);

end.
