unit uCadNF_AlterarDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, ComCtrls,
  ExtCtrls, uClassesNotasFiscais, uDataSet_OOP;

type
  TAlterarDadosSituacao = (adTerceiros, adEmissaoPropria, adEmisPropComCC, adContingRej);

  TfrmCadNfAlterarDados = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    page_princ: TPageControl;
    ts_nota_completa: TTabSheet;
    ts_item: TTabSheet;
    ts_item_alt: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    pn_nota: TPanel;
    Label441: TLabel;
    Label442: TLabel;
    Label443: TLabel;
    Label444: TLabel;
    Label448: TLabel;
    Label449: TLabel;
    Label450: TLabel;
    Label451: TLabel;
    Label452: TLabel;
    Label453: TLabel;
    Label454: TLabel;
    Label455: TLabel;
    Label458: TLabel;
    Label459: TLabel;
    Label460: TLabel;
    Label461: TLabel;
    Label445: TLabel;
    Label446: TLabel;
    Label544: TLabel;
    Label545: TLabel;
    Label626: TLabel;
    Label698: TLabel;
    DBEdit237: TDBEdit;
    DBEdit238: TDBEdit;
    DBEdit239: TDBEdit;
    DBEdit240: TDBEdit;
    DBEdit241: TDBEdit;
    DBEdit245: TDBEdit;
    DBEdit246: TDBEdit;
    DBEdit247: TDBEdit;
    DBEdit248: TDBEdit;
    DBEdit249: TDBEdit;
    DBEdit250: TDBEdit;
    DBEdit251: TDBEdit;
    DBEdit252: TDBEdit;
    DBEdit253: TDBEdit;
    DBEdit254: TDBEdit;
    DBEdit255: TDBEdit;
    DBEdit256: TDBEdit;
    DBEdit257: TDBEdit;
    DBEdit242: TDBEdit;
    DBEdit243: TDBEdit;
    DBEdit277: TDBEdit;
    DBEdit278: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit267: TDBEdit;
    DBEdit315: TDBEdit;
    DBEdit321: TDBEdit;
    DBEdit322: TDBEdit;
    ed_altent_data_lanc: TDBEdit;
    Panel6: TPanel;
    DBGrid13: TDBGrid;
    bt_nota_save: TBitBtn;
    bt_nota_cancel: TBitBtn;
    ts_dados_consumo: TTabSheet;
    Panel8: TPanel;
    page_det: TPageControl;
    ts_det_item: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Panel9: TPanel;
    Panel7: TPanel;
    bt_item_alterar: TBitBtn;
    bt_item_save: TBitBtn;
    bt_item_cancel: TBitBtn;
    pn_det_item: TPanel;
    pn_det_ipi: TPanel;
    Panel14: TPanel;
    pn_det_pc: TPanel;
    pn_det_icm: TPanel;
    GroupBox76: TGroupBox;
    Label504: TLabel;
    Label505: TLabel;
    Label508: TLabel;
    Label8: TLabel;
    DBEdit300: TDBEdit;
    DBEdit301: TDBEdit;
    DBEdit304: TDBEdit;
    DBEdit8: TDBEdit;
    GroupBox71: TGroupBox;
    Label487: TLabel;
    Label488: TLabel;
    Label489: TLabel;
    Label582: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit283: TDBEdit;
    DBEdit284: TDBEdit;
    DBEdit285: TDBEdit;
    DBEdit303: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Panel16: TPanel;
    Label503: TLabel;
    DBEdit299: TDBEdit;
    ed_alt_sped_csosn: TDBEdit;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label17: TLabel;
    GroupBox2: TGroupBox;
    Label706: TLabel;
    lkDesoneracao: TDBLookupComboBox;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    pn_piscofins_tributos: TPanel;
    pn_det_pc_pis: TPanel;
    gb_pis_aliq: TGroupBox;
    Label711: TLabel;
    Label713: TLabel;
    GroupBox111: TGroupBox;
    Label723: TLabel;
    gb_pis_qtde: TGroupBox;
    Label721: TLabel;
    Label722: TLabel;
    pn_det_pc_cofins: TPanel;
    gb_cofins_aliq: TGroupBox;
    Label724: TLabel;
    Label725: TLabel;
    GroupBox113: TGroupBox;
    Label726: TLabel;
    gb_cofins_qtde: TGroupBox;
    Label727: TLabel;
    Label728: TLabel;
    GroupBox115: TGroupBox;
    Label730: TLabel;
    Label729: TLabel;
    Label731: TLabel;
    ed_piscofins_motivo_deson: TDBLookupComboBox;
    pn_det_pc_cod: TGroupBox;
    lb_cst_pis: TLabel;
    lb_pc_nat_rec: TLabel;
    ed_pc_cst: TDBEdit;
    ed_pc_nat_rec: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    Label447: TLabel;
    Label485: TLabel;
    Label579: TLabel;
    DBEdit244: TDBEdit;
    DBEdit281: TDBEdit;
    DBEdit296: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    ts_outras: TTabSheet;
    pn_det_outros: TPanel;
    GroupBox3: TGroupBox;
    Label22: TLabel;
    DBEdit36: TDBEdit;
    Label23: TLabel;
    DBEdit37: TDBEdit;
    Label24: TLabel;
    DBEdit38: TDBEdit;
    Label19: TLabel;
    DBEdit33: TDBEdit;
    Label20: TLabel;
    DBEdit34: TDBEdit;
    Label21: TLabel;
    DBEdit35: TDBEdit;
    Label433: TLabel;
    Label434: TLabel;
    Label435: TLabel;
    Label436: TLabel;
    dbComboConsumo: TDBComboBox;
    dbComboAgua: TDBComboBox;
    DBEdit229: TDBEdit;
    DBEdit230: TDBEdit;
    DBEdit236: TDBEdit;
    SpeedButton29: TSpeedButton;
    Label732: TLabel;
    ed_tipoCalcPC: TDBLookupComboBox;
    imgInformation: TImage;
    ts_nota_cc: TTabSheet;
    Label25: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label26: TLabel;
    DBEdit39: TDBEdit;
    Label27: TLabel;
    DBEdit40: TDBEdit;
    DBEdit42: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    Label30: TLabel;
    DBEdit45: TDBEdit;
    Label31: TLabel;
    DBMemo1: TDBMemo;
    Label32: TLabel;
    DBMemo2: TDBMemo;
    Label33: TLabel;
    ts_item_alt_cc: TTabSheet;
    Label34: TLabel;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    Label35: TLabel;
    DBEdit48: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    Label38: TLabel;
    DBEdit51: TDBEdit;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ts_nota_liberado: TTabSheet;
    Panel10: TPanel;
    Label39: TLabel;
    ts_nf_cont_rej: TTabSheet;
    Panel11: TPanel;
    DBEdit52: TDBEdit;
    ts_it_cont_rej: TTabSheet;
    Panel12: TPanel;
    Label40: TLabel;
    DBEdit53: TDBEdit;
    Panel13: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure SpeedButton29Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_nota_saveClick(Sender: TObject);
    procedure bt_item_saveClick(Sender: TObject);
    procedure bt_item_cancelClick(Sender: TObject);
    procedure bt_item_alterarClick(Sender: TObject);
    procedure DBEdit277Exit(Sender: TObject);
    procedure ed_altent_data_lancExit(Sender: TObject);
  private
    FNota: TNFCab;
    FlkMotivoDesoneracao: TDadosLookUp_OOP;
    lkCalc: TDadosLookUp_OOP;
    AlteracaoSituacao: TAlterarDadosSituacao;

    procedure buildCadastro;
  public
    { Public declarations }
    property Nota: TNFCab read FNota write FNota;
  end;

var
  frmCadNfAlterarDados: TfrmCadNfAlterarDados;

implementation

uses uDtmNF, udtmAtivo, uClassesNotasFiscais_nfe, SituacaoNFeEnumUnit, DB;

{$R *.dfm}

{ TfrmCadNfAlterarDados }

procedure TfrmCadNfAlterarDados.bt_nota_saveClick(Sender: TObject);
begin
  inherited;  
  if not vDadosIni.PesqPros('NF0072', 'EDITAR', 'NUM NF '+ Nota.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    Nota.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  ModalResult := IDOK;
end;

procedure TfrmCadNfAlterarDados.bt_item_saveClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0074', 'EDITAR', 'NUM NF '+ Nota.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    Nota.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if Nota.vItem.salvaItemAlteracaoSintegra(Nota) then
    bt_item_cancel.Click;
end;

procedure TfrmCadNfAlterarDados.bt_item_cancelClick(Sender: TObject);
begin
  inherited;
  Nota.vItem.Cancel;
  bt_nota_save.Enabled         := True;
  bt_nota_cancel.Enabled       := True;
  bt_nota_cancel.Enabled       := True;

  ts_nota_liberado.TabVisible  := not pn_nota.Enabled;
  ts_nota_completa.TabVisible  := AlteracaoSituacao = adTerceiros;
  ts_nota_cc.TabVisible        := AlteracaoSituacao = adEmisPropComCC;
  ts_nf_cont_rej.TabVisible    := AlteracaoSituacao = adContingRej;

  ts_item.TabVisible           := True;
  ts_dados_consumo.TabVisible  := Nota.fstrin('modelo_nf', ['6', '06', '21', '22', '28', '29']);
  page_princ.ActivePage        := ts_item;
end;

procedure TfrmCadNfAlterarDados.bt_item_alterarClick(
  Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0073', 'EDITAR', 'NUM NF '+ Nota.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    Nota.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if Nota.vItem.Edit then
  begin
    pn_det_item.Enabled          := Nota.fequals('emissao_propria', 'N');
    pn_det_item.Enabled          := Nota.fequals('emissao_propria', 'N') or Nota.fstrin('modelo_nf', ['1', '01', '001', '1A', '1-A']);
    pn_det_icm.Enabled           := pn_det_item.Enabled;
    pn_det_ipi.Enabled           := pn_det_item.Enabled;
    ed_pc_cst.Enabled            := (Nota.vItem.ffloat('vpisdeson') = 0) and (Nota.vItem.ffloat('vcofinsdeson') = 0);
    pn_det_pc_pis.Enabled        := ed_pc_cst.Enabled;
    pn_det_pc_cofins.Enabled     := ed_pc_cst.Enabled;
    ed_tipoCalcPC.Enabled        := ed_pc_cst.Enabled;
    ed_pc_nat_rec.Enabled        := ed_pc_cst.Enabled or (Nota.vItem.ffloat('vpisdeson') > 0) or (Nota.vItem.ffloat('vcofinsdeson') > 0);
    pn_det_outros.Enabled        := True;
    bt_nota_save.Enabled         := False;
    bt_nota_cancel.Enabled       := False;

    ts_nota_completa.TabVisible := False;
    ts_nota_cc.TabVisible       := False;
    ts_nf_cont_rej.TabVisible   := False;


    ts_item.TabVisible           := False;
    ts_dados_consumo.TabVisible  := False;
    ts_nota_liberado.TabVisible  := False;
               
    if pn_det_item.Enabled then
    begin
      pn_det_item.ParentFont := True;
      pn_det_icm.ParentFont  := True;
      pn_det_ipi.ParentFont  := True;
    end
    else
    begin
      pn_det_item.Font.Color := clGray;
      pn_det_icm.Font.Color  := clGray;
      pn_det_ipi.Font.Color  := clGray;
    end;

    if ed_pc_cst.Enabled then
    begin
      pn_det_pc_cod.ParentFont    := True;
      pn_det_pc_pis.ParentFont    := True;
      pn_det_pc_cofins.ParentFont := True;
    end
    else
    begin
      pn_det_pc_cod.Font.Color    := clGray;
      pn_det_pc_pis.Font.Color    := clGray;
      pn_det_pc_cofins.Font.Color := clGray;
    end;

    if ed_pc_nat_rec.Enabled then
    begin
      lb_pc_nat_rec.Font.Color := clWindowText;
      ed_pc_nat_rec.Font.Color := clWindowText;
    end
    else
    begin
      lb_pc_nat_rec.ParentFont := True;
      ed_pc_nat_rec.ParentFont := True;
    end;

    case AlteracaoSituacao of
      adTerceiros, adEmissaoPropria:
        page_princ.ActivePage := ts_item_alt;

      adEmisPropComCC:
        page_princ.ActivePage := ts_item_alt_cc;

      adContingRej:
        page_princ.ActivePage := ts_it_cont_rej;
    end;

    page_det.ActivePage   := ts_det_item;
  end;
end;

procedure TfrmCadNfAlterarDados.buildCadastro;
var
  I: Integer;
begin
  ed_alt_sped_csosn.Enabled   := vDadosIni.vEmp.vRegime = 'SIMPLES';
  ts_item_alt.TabVisible      := False;
  ts_item_alt_cc.TabVisible   := False;
  ts_it_cont_rej.TabVisible   := False;
  ts_dados_consumo.TabVisible := Nota.fstrin('modelo_nf', ['6', '06', '21', '22', '28', '29']);
  pn_nota.Enabled             := Nota.fequals('emissao_propria', 'N') or Nota.fstrin('modelo_nf', ['1', '01', '001', '1A', '1-A']);
  ts_nota_liberado.TabVisible := not pn_nota.Enabled;
  dbComboAgua.Visible         := False;
  dbComboConsumo.Visible      := False;
  DBEdit229.Enabled           := False;
  dbComboAgua.Enabled         := Nota.fstrin('modelo_nf', ['6', '06', '28', '29']);;
  dbComboConsumo.Enabled      := Nota.fstrin('modelo_nf', ['6', '06', '28', '29']);;
  dbComboAgua.Visible         := Nota.fequals('modelo_nf', '29');
  dbComboConsumo.Visible      := not dbComboAgua.Visible;
  DBEdit229.Enabled           := not Nota.fstrin('modelo_nf', ['21', '22']);

  if not Assigned(FlkMotivoDesoneracao) then
  begin
    FlkMotivoDesoneracao := TDadosLookUp_OOP.create;
    FlkMotivoDesoneracao.setDadosDataSet(['0', '1', '3', '4', '5', '6', '7', '8', '9', '10', '11'],
                                         ['0 - Sem desoneração',
                                          '1 - Taxi',
                                          '3 - Produtor Agropecuário',
                                          '4 - Frotista/Locadora',
                                          '5 - Diplomático/Consular',
                                          '6 - Utilitários e Motocicletas da Amazônia Ocidental e Áreas de Livre Comércio (Resolução 714/88 e 790/94 – CONTRAN e suas alterações)',
                                          '7 - SUFRAMA',
                                          '8 - Venda a Órgão Público',
                                          '9 - Outros. (NT 2011/004)',
                                          '10 - Deficiente Condutor (Convênio ICMS 38/12)',
                                          '11 - Deficiente Não Condutor (Convênio ICMS 38/12)'],
                                          lkDesoneracao);
    FlkMotivoDesoneracao.setDBLookupComboBox(ed_piscofins_motivo_deson);
  end;

  if not Assigned(lkCalc) then
  begin
    lkCalc := TDadosLookUp_OOP.create;
    lkCalc.setDadosDataSet(['0', '2'], ['Completo', 'Nenhum'], ed_tipoCalcPC);
  end;

  if pn_nota.Enabled then
    pn_nota.ParentFont := True
  else
    pn_nota.Font.Color := clGray;

  Nota.vCC_e.selecionaCC_e(Nota.fint('cod_nf'));

  if Nota.fequals('emissao_propria', 'S') and Nota.fequals('situacao_nfe', SituacaoNFeEnumStr[stEmContingenciaRejeitada]) then
    AlteracaoSituacao := adContingRej
  else if Nota.fequals('emissao_propria', 'S') and not Nota.vCC_e.dataSet.IsEmpty then
    AlteracaoSituacao := adEmisPropComCC
  else if Nota.fequals('emissao_propria', 'S')  then
    AlteracaoSituacao := adEmissaoPropria
  else
    AlteracaoSituacao := adTerceiros;

  Nota.vCC_e.Close;

  ts_nota_completa.TabVisible := bt_nota_save.Enabled and (AlteracaoSituacao = adTerceiros);
  ts_nota_cc.TabVisible       := bt_nota_save.Enabled and (AlteracaoSituacao = adEmisPropComCC);
  ts_nf_cont_rej.TabVisible   := bt_nota_save.Enabled and (AlteracaoSituacao = adContingRej);

  case AlteracaoSituacao of
    adEmisPropComCC:
      page_princ.ActivePage := ts_nota_cc;

    adContingRej:
      begin
        ts_nf_cont_rej.Caption := 'Nota Fiscal';
        ts_it_cont_rej.Caption := 'Itens da nota';
        page_princ.ActivePage := ts_nf_cont_rej;
      end

    else
      page_princ.ActivePage := ts_nota_completa;
  end;

  imgInformation.Hint := 'Tipo de cálculo do PISCOFINS' + sLineBreak +
                         'Quando informar Nenhum, os valores que forem digitados irão prevalecer' + sLineBreak +
                         'Se Completo, na proxima geração do arquivo EFD Contribuições o sistema vai calculor o PISCOFINS com base no cadastro'; 

//  for I := 0 to page_princ.PageCount - 1 do
//    page_princ.Pages[I].Enabled := Nota.fequals('emissao_propria', 'N');
end;

procedure TfrmCadNfAlterarDados.DBEdit277Exit(Sender: TObject);
begin
  inherited;
  if Nota.campo_emissao_propria = 'N' then
    if not Nota.validarChaveNFe(pchar(Trim(Nota.dataSet.FieldByName('chave_nfe').AsString))) then
      raise Exception.Create('Chave da NF-e inválida. Verifique a chave informada');
end;

procedure TfrmCadNfAlterarDados.ed_altent_data_lancExit(Sender: TObject);
begin
  inherited;

  ed_altent_data_lanc.Enabled := false;
  vDadosIni.GravaAuditoria('NF0218', 'HABILITAR', 'NUM NF '+ Nota.fstr('NUM_NF') + ' NOVA: ' + Nota.fstr('DATA_LANC'),
    'NOTAFISCAL', Nota.fstr('COD_NF'), Nota.buscas);
end;

procedure TfrmCadNfAlterarDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Assigned(FlkMotivoDesoneracao) then
    FreeAndNil(FlkMotivoDesoneracao);
  if Assigned(lkCalc) then
    FreeAndNil(lkCalc);

  Action := caFree;
  frmCadNfAlterarDados := nil;
end;

procedure TfrmCadNfAlterarDados.FormShow(Sender: TObject);
begin
  inherited;
  buildCadastro;

  Nota.dataSet.Edit;
  Nota.vItem.selecionaItens(Nota.dataSet.FieldByName('cod_nf').AsInteger);
  Nota.vClFor.selecionaClFor;
end;

procedure TfrmCadNfAlterarDados.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0218', 'HABILITAR', 'NUM NF '+ Nota.fstr('NUM_NF') + ' DT LANC: ' + Nota.fstr('DATA_LANC'),
    'NOTAFISCAL', Nota.fstr('COD_NF'), Nota.buscas) then
    Exit;
  ed_altent_data_lanc.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (ed_altent_data_lanc.CanFocus) then
  	ed_altent_data_lanc.SetFocus;
end;

end.
