unit uCadNF_AntecipacaoST_Itens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, uClassesNotasFiscais, StdCtrls, Mask, DBCtrls, Grids,
  DBGrids, Buttons, ExtCtrls, ComCtrls, uClassesNotasFiscais_itens_detalhes, DB,
  uEditHw, Menus;

type
  TfrmCadNF_AntecipacaoST_Itens = class(TfrmPadrao)
    PageControl1: TPageControl;
    ts_principal: TTabSheet;
    Panel1: TPanel;
    pn_princ_btns: TPanel;
    Panel3: TPanel;
    GroupBoxItens: TGroupBox;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    pn_itens_ant: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    lb_tot_antst: TLabel;
    bt_analise: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ts_analise: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    bt_aceita_todos: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Panel9: TPanel;
    groupAnalise: TGroupBox;
    Panel10: TPanel;
    DBGrid2: TDBGrid;
    pn_dados_ant: TPanel;
    dsItens: TDataSource;
    bt_analise2: TSpeedButton;
    ck_usar_aliq: TCheckBox;
    pn_itens_botoes: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton20: TSpeedButton;
    pageAnt: TPageControl;
    ts_mva: TTabSheet;
    ts_aliq: TTabSheet;
    Label14: TLabel;
    ed_bcst2: TEditHw;
    ed_aliq2: TEditHw;
    Label17: TLabel;
    ed_st2: TEditHw;
    Label18: TLabel;
    Label29: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    ed_inter: TEditHw;
    ed_intra: TEditHw;
    ed_mva: TEditHw;
    ed_bcicm: TEditHw;
    ed_bcst: TEditHw;
    Label39: TLabel;
    ed_st: TEditHw;
    Label40: TLabel;
    ed_aliq: TEditHw;
    Panel5: TPanel;
    btDadosAnt_Aceitar: TBitBtn;
    btDadosAnt_Cancela: TBitBtn;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    PopupMenu1: TPopupMenu;
    SalvarAliquota1: TMenuItem;
    SalvarMVA1: TMenuItem;
    Panel2: TPanel;
    Panel11: TPanel;
    btDadosAnt_NaoAceitar: TBitBtn;
    bt_naoaceita_todos: TSpeedButton;
    ts_espelho: TTabSheet;
    pn_espelho_calc: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    BitBtn2: TBitBtn;
    ed_espelho: TMemo;
    PopupMenu2: TPopupMenu;
    Verespelho1: TMenuItem;
    ts_tribsefaz: TTabSheet;
    pageTrib: TPageControl;
    tsTribGrid: TTabSheet;
    tsTribCad: TTabSheet;
    GroupBox1: TGroupBox;
    Panel12: TPanel;
    Panel15: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox3: TGroupBox;
    Panel16: TPanel;
    Panel17: TPanel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Label2: TLabel;
    ed_tribSefaz: TComboBox;
    Panel18: TPanel;
    gridTrib: TDBGrid;
    Label3: TLabel;
    edTribSefId: TDBEdit;
    ckUpdateAliq: TCheckBox;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    edTribSefTitulo: TDBEdit;
    edTribSefCompoCusto: TDBCheckBox;
    Label5: TLabel;
    edTribSefCodAj: TDBEdit;
    Label6: TLabel;
    lb_tot_aj: TLabel;
    dsSpedLanc: TDataSource;
    edTribSefCodObs: TDBLookupComboBox;
    procedure SpeedButton3Click(Sender: TObject);
    procedure ed_aliq2Change(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure gridTribDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn6Click(Sender: TObject);
    procedure pageAntChange(Sender: TObject);
    procedure Verespelho1Click(Sender: TObject);
    procedure bt_naoaceita_todosClick(Sender: TObject);
    procedure btDadosAnt_NaoAceitarClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ed_interExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bt_aceita_todosClick(Sender: TObject);
    procedure ed_aliq2Exit(Sender: TObject);
    procedure ed_st2Exit(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SalvarMVA1Click(Sender: TObject);
    procedure SalvarAliquota1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ed_bcst2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btDadosAnt_CancelaClick(Sender: TObject);
    procedure btDadosAnt_AceitarClick(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_analise2Click(Sender: TObject);
    procedure bt_analiseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    controlsDisabled: Boolean;
    Fnota: TNFCab;
    FAntST: TNFItem_AntecipacaoST;
    procedure SelecionaItemAntecipacao(Sender: TObject);
    procedure Calcular(updateAliq: Boolean);
    procedure SomaAnt;

    procedure buildTribSefazId;
  public
    { Public declarations }
    property nota: TNFCab read Fnota write Fnota;
    property AntST: TNFItem_AntecipacaoST read FAntST write FAntST;
  end;

var
  frmCadNF_AntecipacaoST_Itens: TfrmCadNF_AntecipacaoST_Itens;

implementation

uses
  Math,
  StrUtils,
  uDataSet_OOP,
  uDtmAtivo,
  uDadosIni,
  hw_utils,
  hw_win_utils,
  notafiscal_item_class,
  opfiscal_model, uClassesNotasFiscais_infoadfisco;

{$R *.dfm}

procedure TfrmCadNF_AntecipacaoST_Itens.btDadosAnt_CancelaClick(Sender: TObject);
begin
  inherited;
  //if pn_dados_ant.Parent = pn_itens_ant then
  begin
    DBGrid1.Enabled := True;
    pn_itens_ant.Visible := False;
    pn_itens_botoes.Visible := True;
    pn_princ_btns.Enabled := True;
    pn_princ_btns.ParentFont := True;
    pn_dados_ant.Parent := groupAnalise;
    SomaAnt;             
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.btDadosAnt_NaoAceitarClick(
  Sender: TObject);
begin
  inherited;

  btDadosAnt_NaoAceitar.Enabled := False;
  Screen.Cursor := crHourGlass;
  try
    AntST.NaoAceitarAntecipacao;

    if AntST.dataSet.RecordCount = 0 then
    begin
      if PageControl1.ActivePage = ts_analise then
        PageControl1.ActivePage := ts_principal;
      btDadosAnt_CancelaClick(btDadosAnt_Cancela);
    end;

  finally
    btDadosAnt_NaoAceitar.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Calcular(True);
end;

procedure TfrmCadNF_AntecipacaoST_Itens.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if not AntST.tribSefaz.Insert then
    Exit;

  edTribSefId.Enabled := True;
  pageTrib.ActivePage := tsTribCad;
  if (Self.Enabled) and (Self.Visible) and (edTribSefId.CanFocus) then
    edTribSefId.SetFocus;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.BitBtn4Click(Sender: TObject);
begin
  inherited;

  if not AntST.tribSefaz.Edit then
    Exit;

  edTribSefId.Enabled := False;
  pageTrib.ActivePage := tsTribCad;
  if (Self.Enabled) and (Self.Visible) and (edTribSefTitulo.CanFocus) then
    edTribSefTitulo.SetFocus;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.BitBtn5Click(Sender: TObject);
begin
  inherited;

  if AntST.tribSefaz.dataSet.RecordCount = 0 then
    Exit;

  if ShowConfirmacao('Deseja mesmo excluir o registro selecionado?') <> IDYES then
    Exit;

  AntST.tribSefaz.Delete;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.BitBtn6Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := ts_principal;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.BitBtn8Click(Sender: TObject);
begin
  inherited;

  if not AntST.tribSefaz.Post then
    Exit;

  pageTrib.ActivePage := tsTribGrid;
  if (Self.Enabled) and (Self.Visible) and (gridTrib.CanFocus) then
    gridTrib.SetFocus;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.BitBtn9Click(Sender: TObject);
begin
  inherited;
  AntST.tribSefaz.dataSet.Cancel;
  pageTrib.ActivePage := tsTribGrid;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.btDadosAnt_AceitarClick(
  Sender: TObject);
var
  payload: RItemSefazTributo;
  I: Integer;
begin
  inherited;

  btDadosAnt_Aceitar.Enabled := False;
  Screen.Cursor := crHourGlass;
  try
    {
    if pageAnt.ActivePage = ts_mva then
      AntST.SalvarAntecipacao(ed_mva.AsValue, ed_bcst.AsValue, ed_st.AsValue, ed_espelho.Lines.Text)
    else
      AntST.SalvarAntecipacao(0, ed_bcst2.AsValue, ed_st2.AsValue, '');
    }
    
    if pageAnt.ActivePage = ts_mva then
    begin
      payload.mva := ed_mva.AsValue;
      payload.espelho := ed_espelho.Lines.Text;  
      payload.baseST := ed_bcst.AsValue;
      payload.valorSt := ed_st.AsValue;
    end
    else
    begin
      payload.mva := 0;
      payload.espelho := '';
      payload.compoeCusto := (ed_tribSefaz.Items.Objects[ed_tribSefaz.ItemIndex] as TTributacaoSefazModel).compoeCusto;

      if ckUpdateAliq.Visible and ckUpdateAliq.Checked and (ed_tribSefaz.ItemIndex >= 0) then
        AntST.SalvarAliq(ed_aliq2.AsValue, (ed_tribSefaz.Items.Objects[ed_tribSefaz.ItemIndex] as TTributacaoSefazModel).id);
      payload.baseST := ed_bcst2.AsValue;
      payload.valorSt := ed_st2.AsValue;
    end;

    payload.compoeCusto := '';
    payload.tribSefazId := '';

    if ed_tribSefaz.ItemIndex >= 0 then
    begin
      payload.compoeCusto := (ed_tribSefaz.Items.Objects[ed_tribSefaz.ItemIndex] as TTributacaoSefazModel).compoeCusto;
      payload.tribSefazId := (ed_tribSefaz.Items.Objects[ed_tribSefaz.ItemIndex] as TTributacaoSefazModel).id;
    end;

    AntST.SalvarAntecipacao(payload);

    //if pn_dados_ant.Parent = pn_itens_ant then
    if AntST.dataSet.RecordCount = 0 then
    begin
      if PageControl1.ActivePage = ts_analise then
        PageControl1.ActivePage := ts_principal;
      btDadosAnt_CancelaClick(btDadosAnt_Cancela);
    end;
  //  else if AntST.dataSet.IsEmpty then

  finally
    btDadosAnt_Aceitar.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.Calcular(updateAliq: Boolean);
var
  itensDB: TNFItem;
  itemOb: TNotafiscal_item_dados;
  trib: TItemTributo_ICMS;
  itemFiscal: TItemFiscal;
  valorLiq, aliquota: Double;
begin
  if AntST = nil then
    Exit;

  if AntST.dataSet.IsEmpty then
    Exit;

  if pageAnt.ActivePage = ts_mva then
  begin
//    if AntST.fint('nitem') <> nota.vItem.fint('nitem') then
      if not nota.vItem.dataSet.Locate('NITEM', AntST.fint('nitem'), []) then
      begin
        ShowAtencao('Não foi possivel selecionar o item da nota para continuar');
        Exit;
      end;

    nota.vItem.cancelar;
    nota.vItem.alterar;
    itemOb := nota.vItem.vrDadosItem;

    trib     := TItemTributo_ICMS.Create;

    itemOb.aliq_icm          := ed_inter.AsValue;
    itemOb.aliq_icmsub       := ed_intra.AsValue;
    itemOb.mva               := ed_mva.AsValue;
    itemOb.base_icm          := IfThen(ed_bcicm.Enabled, ed_bcicm.AsValue);
    itemOb.base_icmsub       := IfThen(ed_bcst.Enabled, ed_bcst.AsValue);
    itemOb.perc_red_prod     := 0;
    itemOb.perc_red_prod_sub := 0;
    itemOb.calcIcmsActive    := True;
    itemOb.cst               := Copy(itemOb.cst, 1, 1) + '90';
    itemOb.tipo_calc         := Ord(tcParcial);
    itemOb.modbcst           := 4;
    itemOb.antec_trib        := 'S';

    nota.calc_fat.calculo_faturamento_individual_executar(True);
    ed_espelho.Lines.Text := itemOb.espelho_calc.Text;

    itemFiscal := itemOb.get_itemFiscal;
    itemFiscal.vicmsdeson := itemOb.vicmdeson;
    itemFiscal.vpisdeson := itemOb.vpisdeson;
    itemFiscal.vcofinsdeson := itemOb.vcofinsdeson;

    valorLiq := trib.conf_icm.getBC(ttICMSST, itemFiscal, 0);
    aliquota := itemOb.valor_icmsub / valorLiq * 100;

    if itemOb.base_icm > 0 then
      ed_bcicm.AsValue := itemOb.base_icm;

    ed_bcst.AsValue := itemOb.base_icmsub;
    ed_st.AsValue   := itemOb.valor_icmsub;
    ed_aliq.AsValue := aliquota;

    if updateAliq then
    begin
      ed_bcst2.AsValue := valorLiq;
      ed_aliq2.AsValue := aliquota;
      ed_st2.AsValue   := itemOb.valor_icmsub;
    end;
    nota.vItem.cancelar;
  end
  else
    ed_st2.AsValue := ed_bcst2.AsValue * ed_aliq2.AsValue / 100;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if// (Column.FieldName = 'ANTEC_TRIB') and 
    (not nota.vItem.fempty('antec_trib')) then
  begin                                                                             
    DBGrid1.Canvas.Font.Color := clWindowText;
    if nota.vItem.fequals('antec_trib', 'S') then
      DBGrid1.Canvas.Brush.Color := $00D9FFD9
    else if not nota.vItem.fempty('trib_sefaz_id') then
      DBGrid1.Canvas.Brush.Color := $00FFE6CC
    else
      DBGrid1.Canvas.Brush.Color := $00D2DBFF;

    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  
  end;
//  else if nota.vItem.fdif('antec_trib', 'S') and (nota.vItem.ffloat('valor_icmsub') > 0) then
//  else if nota.vItem.fdif('antec_trib', 'S') and (nota.vItem.ffloat('valor_icmsub') > 0) then
//  begin
//    DBGrid1.Canvas.Font.Color := clWindowText;
//    DBGrid1.Canvas.Brush.Color := $00D2DBFF;
//    DBGrid1.Canvas.FillRect(Rect);
//    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
//  end
//  else if nota.vItem.fequals('antec_trib', 'S') then
//  begin
//    DBGrid1.Canvas.Font.Color := clWindowText;
//    DBGrid1.Canvas.Brush.Color := $00D9FFD9;
//    DBGrid1.Canvas.FillRect(Rect);
//    DBGrid1.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
//  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.gridTribDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
// if// (Column.FieldName = 'ANTEC_TRIB') and
//    (not nota.vItem.fempty('antec_trib')) then
  begin
//    gridTrib.Canvas.Font.Color := clWindowText;
//    if AntST..vItem.fequals('antec_trib', 'S') then
//      gridTrib.Canvas.Brush.Color := $00D9FFD9
//    else if not nota.vItem.fempty('tib_sefaz_id') then
//      gridTrib.Canvas.Brush.Color := $00FFE6CC
//    else
//      gridTrib.Canvas.Brush.Color := $00D2DBFF;
//
//    gridTrib.Canvas.FillRect(Rect);
//    gridTrib.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão

  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.ed_aliq2Change(Sender: TObject);
begin
  inherited;
  if AntST = nil then
    Exit;

  ckUpdateAliq.Visible := RoundTo(ed_aliq2.AsValue, -6) <> AntST.ffloat('aliquota', -6);
end;

procedure TfrmCadNF_AntecipacaoST_Itens.ed_aliq2Exit(Sender: TObject);
begin
  inherited;
  if ed_bcst2.AsValue > 0 then
    ed_st2.AsValue := ed_bcst2.AsValue * ed_aliq2.AsValue / 100;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.ed_bcst2Exit(Sender: TObject);
begin
  inherited;
  if ed_bcst2.AsValue > 0 then
    ed_st2.AsValue := ed_bcst2.AsValue * ed_aliq2.AsValue / 100;
  //Calcular;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.ed_interExit(Sender: TObject);
begin
  inherited;
  Calcular(False);
end;

procedure TfrmCadNF_AntecipacaoST_Itens.ed_st2Exit(Sender: TObject);
var
  aliqCalc, aliq, st, valor, bc: Double;
begin
  inherited;
  bc := ed_bcst2.AsValue;
  st := ed_st2.AsValue;
  aliq := ed_aliq2.AsValue;
  if st <=  0 then
  begin
    ed_aliq2.AsValue := 0;
    ed_bcst2.AsValue := 0;
  end
  else if bc > 0 then
  begin
    aliqCalc := st / bc * 100;

    valor := bc * aliq / 100;

    if RoundTo(valor, -2) <> RoundTo(st, -2) then
      ed_aliq2.AsValue := aliqCalc;
  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if controlsDisabled then
    nota.vItem.dataSet.DisableControls;
  nota.vItem.cancelar;
  Action := caFree;
  frmCadNF_AntecipacaoST_Itens := nil;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.FormCreate(Sender: TObject);
begin
  inherited;
  ts_principal.TabVisible := False;
  ts_analise.TabVisible := False;
  ts_espelho.TabVisible := False;
  ts_tribsefaz.TabVisible := False;
  tsTribGrid.TabVisible := False;
  tsTribCad.TabVisible := False;
  pn_itens_botoes.Visible := True;
  pn_itens_ant.Visible := False;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.FormShow(Sender: TObject);
begin
  inherited;
  AntST.OnSelectItem := SelecionaItemAntecipacao;

  buildTribSefazId;
  
  if AntST.dataSet.RecordCount > 0 then
  begin
    PageControl1.ActivePage := ts_analise;
    SelecionaItemAntecipacao(AntST);
  end
  else
  begin
    PageControl1.ActivePage := ts_principal;
    SomaAnt;
  end;
  controlsDisabled := nota.vItem.dataSet.ControlsDisabled;
  nota.vItem.dataSet.EnableControls;
  dsItens.DataSet := nota.vItem.dataSet;
  DBGrid2.DataSource := AntST._dataSourceOOP;
  gridTrib.DataSource := AntST.tribSefaz._dataSourceOOP;
  edTribSefId.DataSource := AntST.tribSefaz._dataSourceOOP;
  edTribSefTitulo.DataSource := AntST.tribSefaz._dataSourceOOP;
  edTribSefCompoCusto.DataSource := AntST.tribSefaz._dataSourceOOP;
  edTribSefCodObs.DataSource := AntST.tribSefaz._dataSourceOOP;
  dsSpedLanc.DataSet := nota.vSped.vC195_C197.vLancFiscal.dataSet;
  if not nota.vSped.vC195_C197.vLancFiscal.dataSet.Active then
    nota.vSped.vC195_C197.vLancFiscal.abreLancamentosFiscais;

  btDadosAnt_Cancela.Enabled := False;
  ck_usar_aliq.Checked := nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('Conf', 'PreferirAliquotaAoMVA') = 'S';

  if not ck_usar_aliq.Checked then
    pageAnt.ActivePage := ts_mva
  else
    pageAnt.ActivePage := ts_aliq;

//quando vem cst 60 e ANT = N, acho que não deveria ter atecipação, conferir como era antes
end;

procedure TfrmCadNF_AntecipacaoST_Itens.pageAntChange(Sender: TObject);
begin
  inherited;
  Calcular(False);
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SalvarAliquota1Click(Sender: TObject);
begin
  inherited;
  if pageAnt.ActivePage = ts_mva then
    AntST.SalvarAliq(ed_aliq.AsValue, '')
  else if ed_tribSefaz.ItemIndex >= 0 then
    AntST.SalvarAliq(ed_aliq2.AsValue, (ed_tribSefaz.Items.Objects[ed_tribSefaz.ItemIndex] as TTributacaoSefazModel).id)
  else
    ShowErro('Selecione a Tributação SEFAZ antes de salvar');
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SalvarMVA1Click(Sender: TObject);
begin
  inherited;
  if pageAnt.ActivePage = ts_mva then
    AntST.SalvarMva(ed_mva.AsValue);
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SelecionaItemAntecipacao(
  Sender: TObject);
var
  I: Integer;
begin
  ed_inter.AsValue := AntST.ffloat('aliq_inter');
  ed_intra.AsValue := AntST.ffloat('aliq_intra');
  ed_mva.AsValue := AntST.ffloat('mva');
  ed_bcicm.AsValue := AntST.ffloat('base_icm');
  ed_bcst.AsValue := AntST.ffloat('base_st');
  ed_bcst2.AsValue := AntST.ffloat('valor_liq');
  ed_st.AsValue := AntST.ffloat('valor_st');
  ed_st2.AsValue := AntST.ffloat('valor_st');
  ed_aliq.AsValue := AntST.ffloat('aliquota');
  ed_aliq2.AsValue := AntST.ffloat('aliquota');
  ed_espelho.Lines.Text := AntST.fstr('espelho_calc');
  ed_bcicm.Enabled := False;
  ed_bcst.Enabled := False;
  ckUpdateAliq.Checked := True;

  if not ck_usar_aliq.Checked then
    pageAnt.ActivePage := ts_mva
  else
    pageAnt.ActivePage := ts_aliq;

  ed_tribSefaz.ItemIndex := -1; // ou 0 se criar um nenhum
  for I := 0 to ed_tribSefaz.Items.Count - 1 do
    if AntST.fequals('trib_sefaz_id', (ed_tribSefaz.Items.Objects[I] as TTributacaoSefazModel).id) then
    begin
      ed_tribSefaz.ItemIndex := I;
      Break;
    end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SomaAnt;
begin
  nota.vItem.prepare_loop('antec_trib = ''S''');
  try
    lb_tot_antst.Caption := Format('%n', [nota.vItem.fsum('valor_icmsub')]);

    nota.vItem.filterStr('antec_trib <> ''S'' and trib_sefaz_id <> ''''');

    lb_tot_aj.Caption := Format('%n', [nota.vItem.fsum('vajuste')]);

  finally
    nota.vItem.prepare_loop_done;
  end;  
end;

procedure TfrmCadNF_AntecipacaoST_Itens.bt_analise2Click(Sender: TObject);
begin
  inherited;
//  AntST.dataSet.EmptyDataSet;
//  
//  if AntST.AnalisarItens(ck_usar_aliq.Checked) > 0 then
//  begin
//    PageControl1.ActivePage := ts_analise;
//    btDadosAnt_Cancela.Enabled := False;
//
//    if not ck_usar_aliq.Checked then
//      pageAnt.ActivePage := ts_mva
//    else
//      pageAnt.ActivePage := ts_aliq;
//    
//    SelecionaItemAntecipacao(AntST);    
//  end
//  else
//    ShowAtencao('O sistema não localizou nenhum item com dados de ICMS ST para continuar. Favor utilize o botão selecionar mais itens preencha os campos necessários');
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ed_bcicm.Enabled := not ed_bcicm.Enabled;
  if (Self.Enabled) and (Self.Visible) and (ed_bcicm.CanFocus) then
    ed_bcicm.SetFocus
  else
    Calcular(False);
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SpeedButton20Click(Sender: TObject);
begin
  inherited;

  if nota.notaFechada then
    Exit;

  if nota.vItem.dataSet.IsEmpty then
    Exit;

  if nota.vItem.fempty('antec_trib') then  
    Exit;
    
  nota.vItem.dataSet.Edit;
  nota.vItem.dataSet.FieldByName('antec_trib').AsString := '';
  nota.vItem.dataSet.FieldByName('trib_sefaz_id').Value := Null;
  nota.vItem.dataSet.FieldByName('bcajuste').AsFloat := 0;
  nota.vItem.dataSet.FieldByName('vajuste').AsFloat := 0;
  nota.vItem.dataSet.FieldByName('pajuste').AsFloat := 0;

  if nota.vItem.fequals('antec_trib', 'S') then
  begin  
    nota.vItem.dataSet.FieldByName('base_icmsub_ant').AsFloat  := 0;
    nota.vItem.dataSet.FieldByName('valor_icmsub_ant').AsFloat := 0;
  end;
                                                                  
  if ShowConfirmacao('Remover também os valores de ICMS ST') = IDYES then
  begin
    nota.vItem.dataSet.FieldByName('base_icmsub').AsFloat  := 0;
    nota.vItem.dataSet.FieldByName('valor_icmsub').AsFloat := 0;
    nota.vItem.dataSet.FieldByName('aliq_icmsub').AsFloat := 0;
    nota.vItem.dataSet.FieldByName('perc_red_prod_sub').AsFloat := 0;
    nota.vItem.dataSet.FieldByName('mva').AsFloat := 0;
  end;

  if (not nota.vItem.fempty('icm_cst')) or (not nota.vItem.fempty('icm_csosn')) then
  begin
    if nota.vItem.fempty('icm_csosn') then
      nota.vItem.dataSet.FieldByName('cst').AsString   := nota.vItem.fstr('cst', 1, 1) + nota.vItem.fstr('icm_cst')
    else
    begin
      nota.vItem.dataSet.FieldByName('cst').AsString   := nota.getCSTPorCSOSN(nota.vItem.fstr('cst'), nota.vItem.fstr('icm_csosn'));
      nota.vItem.dataSet.FieldByName('csosn').AsString := nota.getCSOSNPorCST(nota.vItem.fstr('cst'), nota.vItem.fstr('icm_csosn'), False);
    end;

    nota.vItem.dataSet.FieldByName('base_icm').AsFloat := nota.vItem.ffloat('icm_vbc');
    nota.vItem.dataSet.FieldByName('aliq_icm').AsFloat := nota.vItem.ffloat('icm_picm');
    nota.vItem.dataSet.FieldByName('valor_icm').AsFloat := nota.vItem.ffloat('icm_vicm');
    nota.vItem.dataSet.FieldByName('perc_red_prod').AsFloat := nota.vItem.ffloat('icm_pred');
    nota.vItem.dataSet.FieldByName('fcp_pfcp').AsFloat := nota.vItem.ffloat('icm_pfcp');
    nota.vItem.dataSet.FieldByName('fcp_vfcp').AsFloat := nota.vItem.ffloat('icm_vfcp');
    nota.vItem.dataSet.FieldByName('fcp_vbcfcp').AsFloat := nota.vItem.ffloat('icm_vbcfcp');
  end;

  nota.vItem.dataSet.Post;
  SomaAnt;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  pageTrib.ActivePage := tsTribGrid;
  PageControl1.ActivePage := ts_tribsefaz;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.bt_analiseClick(Sender: TObject);
begin
  inherited;
  if nota.notaFechada then
    Exit;

  if nota.vItem.dataSet.IsEmpty then
    Exit;

  AntST.dataSet.EmptyDataSet;

  bt_analise.Enabled := False;
  bt_analise2.Enabled := False;
  Screen.Cursor := crHourGlass;
  try
    
    if AntST.AnalisarItens(ck_usar_aliq.Checked) > 0 then
    begin
      PageControl1.ActivePage := ts_analise;
      btDadosAnt_Cancela.Enabled := False;

      if not ck_usar_aliq.Checked then
        pageAnt.ActivePage := ts_mva
      else
        pageAnt.ActivePage := ts_aliq;
    
      SelecionaItemAntecipacao(AntST);    
    end
    else
      ShowAtencao('O sistema não localizou nenhum item com dados de ICMS ST para continuar. Favor utilize o botão selecionar mais itens preencha os campos necessários');
  finally
    bt_analise.Enabled := True;
    bt_analise2.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.bt_naoaceita_todosClick(
  Sender: TObject);
begin
  inherited;
  
  bt_naoaceita_todos.Enabled := False;
  Screen.Cursor := crHourGlass;
  try
  
    AntST.dataSet.First;
    while not AntST.dataSet.IsEmpty do
      btDadosAnt_NaoAceitar.Click;
      
  finally    
    bt_naoaceita_todos.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.buildTribSefazId;
var
  item: TTributacaoSefazModel;
begin
  ed_tribSefaz.Items.Clear;


  item := TTributacaoSefazModel.Create;
  item.id := '';
  item.titulo := '-';
  item.compoeCusto := '';

  ed_tribSefaz.AddItem('-', item);

  AntST.tribSefaz.Open;
  AntST.tribSefaz.prepare_loop();
  try
    while not AntST.tribSefaz.dataSet.Eof do
    begin
      item := TTributacaoSefazModel.Create;
      item.id := AntST.tribSefaz.fstr('id');
      item.titulo := AntST.tribSefaz.fstr('titulo');
      item.compoeCusto := AntST.tribSefaz.fstr('compoecusto');

      ed_tribSefaz.AddItem(Format('%s - %s', [item.id, item.titulo]), item);

      AntST.tribSefaz.dataSet.Next;
    end;    

  finally
    AntST.tribSefaz.prepare_loop_done();
  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  AntST.RemoverAtencipacaoTodos;
  SomaAnt;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if nota.vItem.fempty('antec_trib') and (nota.vItem.ffloat('valor_icmsub') > 0) then
    if ShowConfirmacao('Item com valor de ICMS ST já destacada na nota fiscal. Deseja mesmo alterar') <> IDYES then
      Exit;

  AntST.dataSet.EmptyDataSet;

  if nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('Conf', 'PreferirAliquotaAoMVA') = 'S' then  
    pageAnt.ActivePage := ts_aliq
  else
    pageAnt.ActivePage := ts_mva;
  AntST.AnalisarItem(True, nota.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('Conf', 'PreferirAliquotaAoMVA') = 'S');
  SelecionaItemAntecipacao(AntST);
  Calcular(False);

  btDadosAnt_Cancela.Enabled := True;
  pn_dados_ant.Parent := pn_itens_ant;
  pn_itens_ant.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (ed_inter.CanFocus) then
    ed_inter.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (ed_bcst2.CanFocus) then
    ed_bcst2.SetFocus;
  pn_itens_botoes.Visible := False;
  DBGrid1.Enabled := False;
  pn_princ_btns.Enabled := False;
  pn_princ_btns.Font.Color := clGray;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  ed_bcst.Enabled := not ed_bcst.Enabled;
  if (Self.Enabled) and (Self.Visible) and (ed_bcst.CanFocus) then
    ed_bcst.SetFocus
  else
    Calcular(False);
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  SalvarMVA1.Enabled := pageAnt.ActivePage = ts_mva;
  SalvarAliquota1.Enabled := pageAnt.ActivePage = ts_aliq;
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadNF_AntecipacaoST_Itens.bt_aceita_todosClick(Sender: TObject);
begin
  inherited;
  
  bt_aceita_todos.Enabled := False;
  Screen.Cursor := crHourGlass;
  try

    AntST.dataSet.First;
    while not AntST.dataSet.IsEmpty do
      btDadosAnt_Aceitar.Click;
      
  finally    
    bt_aceita_todos.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF_AntecipacaoST_Itens.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  SomaAnt;
  PageControl1.ActivePage := ts_principal; 
end;

procedure TfrmCadNF_AntecipacaoST_Itens.Verespelho1Click(Sender: TObject);
begin
  inherited;
  ed_espelho.Lines.Text := nota.vItem.fstr('espelho_calc');
  vDadosIni.abreForm('Espelho de cálculo do ICMS', pn_espelho_calc, opFormsDefCadEsc);
end;

end.
