unit uCadNF_icmsst_rest_compl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, uDataSet_OOP, ComCtrls, //sped_lancamento_fiscal_assistente,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, uEditHw, faturamento_hw_class,
  //tipo88_icmsst_periodo_class,
  uClasseConexao, notafiscal_item_class, hw_erro_class,
  config_sistema_class, efd_icmsst_cr_apuracao_class, Contnrs, CheckLst,
  hw_rest_compl_utils, sped_lancamento_fiscal_class;

const
  strComplemento = 'Complemento';
  strRestituicao = 'Restituição';

type
  TipoRestCompl = (tpComplemento, tpRestituicao);

  THack_Hw_notafiscal_class = class(THw_notafiscal_class);

  TNF_Rest_Compl = class(TConexao)
  private
    Fperiodo: TDataSet_OOP;
    FNotasEmitidas: TDataSet_OOP;
    //Flanc_assist: TLanc_Fiscal_Assistente;
    Ffat: THw_faturamento;
    //Ftipo88: TTipo88_icmsst_periodo_class;
    FNotasMake: TNotifyEvent;
    Fconf: TConfig_sistema_class;
    //Flanc_aj: THW_C195List;
    Fapuracao: TEfd_icmsst_cr_apuracao_class;
    //Flanc_f: TLanc_Fiscal_Assistente;
  public

    constructor Create;
    destructor Destroy; override;

    function obterPeriodos(Aano: string): TDataSet_OOP;
    function NotasEmitidas(): TDataSet_OOP;
    //function notasfiscais_gerar(Acfop: Integer; Anat_op: string; Atipo: TipoRestCompl; Asalvar: Boolean = False): Boolean;
    function notasfiscais_gerar(ModeloEmiss: TModeloEmissao; Asalvar: Boolean = False): Boolean;

    property periodo: TDataSet_OOP read Fperiodo write Fperiodo;
    property fat: THw_faturamento read Ffat write Ffat;
    //property tipo88: TTipo88_icmsst_periodo_class read Ftipo88 write Ftipo88;
    property apuracao: TEfd_icmsst_cr_apuracao_class read Fapuracao write Fapuracao; 
    //property lanc_f: TLanc_Fiscal_Assistente read Flanc_f write Flanc_f;
    //property lanc_aj: THW_C195List read Flanc_aj write Flanc_aj;

//    property pad_cfop: Integer read Fpad_cfop write Fpad_cfop;
//    property pad_nat: string read Fpad_nat write Fpad_nat;
    property onNotasMake: TNotifyEvent read FNotasMake write FNotasMake;
  end;

  TfrmCadNF_icmsst_rest_compl = class(TfrmPadrao)
    PageControl1: TPageControl;
    ts_periodos: TTabSheet;
    ts_nf: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    Panel5: TPanel;
    grid_tipo88: TDBGrid;
    Panel6: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    pn_nf: TPanel;
    pn_nf_bottom: TPanel;
    bt_nf_voltar: TBitBtn;
    pn_nf_top: TPanel;
    lb_cfop: TLabel;
    lb_cst_icms: TLabel;
    lb_information: TLabel;
    ed_cfop: TEditHw;
    bt_nf_atualizar: TBitBtn;
    bt_nf_criar: TBitBtn;
    ed_nat_op: TEdit;
    Panel4: TPanel;
    BitBtn3: TBitBtn;
    lbTipo: TLabel;
    ts_apuracao: TTabSheet;
    Panel7: TPanel;
    GroupBox1: TGroupBox;
    Panel8: TPanel;
    bt_search: TSpeedButton;
    bt_notasemitidas: TSpeedButton;
    SpeedButton3: TSpeedButton;
    bt_close: TSpeedButton;
    Panel11: TPanel;
    grid_apuracao: TDBGrid;
    group_notas: TGroupBox;
    Panel9: TPanel;
    Splitter1: TSplitter;
    grid_notas: TDBGrid;
    ts_nota: TTabSheet;
    Panel10: TPanel;
    Panel12: TPanel;
    PageControl2: TPageControl;
    ts_lanc_c195: TTabSheet;
    ts_modelosemiss: TTabSheet;
    ts_prev: TTabSheet;
    Panel14: TPanel;
    Panel15: TPanel;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Label6: TLabel;
    Panel16: TPanel;
    SpeedButton14: TSpeedButton;
    bt_undo_to_apuracao: TSpeedButton;
    SpeedButton17: TSpeedButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel13: TPanel;
    lbxC195: TListBox;
    Panel17: TPanel;
    GroupBox5: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ed_codobs: TMaskEdit;
    ed_txtcompl: TMaskEdit;
    Panel20: TPanel;
    GroupBox6: TGroupBox;
    Panel21: TPanel;
    Panel22: TPanel;
    SpeedButton21: TSpeedButton;
    SpeedButton23: TSpeedButton;
    ts_lanc_c197: TTabSheet;
    Panel23: TPanel;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    GroupBox7: TGroupBox;
    Panel24: TPanel;
    lbxC197: TListBox;
    Panel25: TPanel;
    GroupBox8: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    Panel26: TPanel;
    ed_codaj: TMaskEdit;
    ed_descaj: TMaskEdit;
    cklb_valor: TCheckListBox;
    ed_ajvalor: TEditHw;
    GroupBox4: TGroupBox;
    Panel18: TPanel;
    Panel19: TPanel;
    SpeedButton19: TSpeedButton;
    tv_modelosemitir: TTreeView;
    SpeedButton20: TSpeedButton;
    SpeedButton26: TSpeedButton;
    bt_go_preview: TSpeedButton;
    bt_go_preview_lanc: TSpeedButton;
    GroupBox9: TGroupBox;
    lbx_ajsel: TListBox;
    SpeedButton33: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton18: TSpeedButton;
    Panel29: TPanel;
    Panel30: TPanel;
    Label4: TLabel;
    ed_modnatop: TMaskEdit;
    Label5: TLabel;
    ed_itemst: TMaskEdit;
    Label7: TLabel;
    ed_itemfcp: TMaskEdit;
    Label8: TLabel;
    ed_itemicms: TMaskEdit;
    Label15: TLabel;
    ed_dadosad: TMaskEdit;
    Label16: TLabel;
    ed_dadosadper: TMaskEdit;
    ed_modcfop: TEditHw;
    SpeedButton15: TSpeedButton;
    SpeedButton28: TSpeedButton;
    Panel27: TPanel;
    SpeedButton31: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton34: TSpeedButton;
    tv_prev: TTreeView;
    tv_nf: TTreeView;
    ck_emissaopropria: TCheckBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure bt_undo_to_apuracaoClick(Sender: TObject);
    procedure ed_modcfopExit(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure cklb_valorClickCheck(Sender: TObject);
    procedure lbxC197Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure lbxC195Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure tv_modelosemitirClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure bt_go_previewClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure bt_notasemitidasClick(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure bt_searchClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bt_nf_criarClick(Sender: TObject);
    procedure bt_nf_voltarClick(Sender: TObject);
    procedure bt_nf_atualizarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    Fnf: TNF_Rest_Compl;
    FModelosEmiss: TModelosEmissao;
    FModeloSel: TModeloEmissao;
    IndexLancC195: Integer;
    FModelosC197: TModelosC197;
    FModelosC195: TModelosC195;
    { Private declarations }
    procedure complemento_restituicao_notas_make(Sender: TObject);

    procedure modelo_emiss_show();

    procedure new_lancC195();
    procedure new_lancC197();

    procedure make_tv_modelos;
    procedure make_tv_lanc_prev;//tela preview da nota
    procedure make_lbx_modelosC195;
    procedure make_lbx_modelosC197;
    procedure make_lbx_ajustesSel;

  public
    { Public declarations }
    property nf: TNF_Rest_Compl read Fnf write Fnf;
    property ModelosEmiss: TModelosEmissao read FModelosEmiss write FModelosEmiss;
    property ModelosC195: TModelosC195 read FModelosC195 write FModelosC195;
    property ModelosC197: TModelosC197 read FModelosC197 write FModelosC197;
    property ModeloSel: TModeloEmissao read FModeloSel write FModeloSel; 
  end;

var
  frmCadNF_icmsst_rest_compl: TfrmCadNF_icmsst_rest_compl;

implementation

uses uDtmAtivo, StrUtils, DateUtils, notafiscal_class, uDadosIni, DB, Math,
  notafiscal_sped_c195_c197_class, hw_utils;

{$R *.dfm}

procedure icmsst_complemento_restituicao(Amodal: Boolean);
begin
  Screen.Cursor := crHourGlass;
  try
    if Amodal and Assigned(frmCadNF_icmsst_rest_compl) then
      if frmCadNF_icmsst_rest_compl.FormStyle = fsMDIChild then
      begin
        FreeAndNil(frmCadNF_icmsst_rest_compl);
      end;

    vDadosIni.vModalOuChild :=  IfThen(Amodal, 'M', 'C');

    if not Assigned(frmCadNF_icmsst_rest_compl) then
      Application.CreateForm(TfrmCadNF_icmsst_rest_compl, frmCadNF_icmsst_rest_compl);

    if not vDadosIni.PesqPros('NF0212', 'VISUALIZAR', '',
      'TIPO88_ICMSST_PERIODO', '', frmCadNF_icmsst_rest_compl.nf.QrAux) then
    begin
      FreeAndNil(frmCadNF_icmsst_rest_compl);
      Exit;
    end;
    with frmCadNF_icmsst_rest_compl do
      grid_tipo88.Visible := nf.obterPeriodos(MaskEdit1.Text).dataSet.RecordCount > 0;

    if Amodal then
      frmCadNF_icmsst_rest_compl.ShowModal
    else
      frmCadNF_icmsst_rest_compl.Show;

  finally
    Screen.Cursor := crDefault;
  end;
end;

exports
  icmsst_complemento_restituicao;

{ TNF_Rest_Compl }

constructor TNF_Rest_Compl.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  Fperiodo := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  FNotasEmitidas := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  //Flanc_assist := TLanc_Fiscal_Assistente.Create(dtmAtivo.bancoHw);
  Ffat := THw_faturamento.Create;
  //Ftipo88 := TTipo88_icmsst_periodo_class.Create;
  Fapuracao := TEfd_icmsst_cr_apuracao_class.Create;
  //Flanc_assist := TLanc_Fiscal_Assistente.Create(dtmAtivo.bancoHw);
  //Flanc_aj := THW_C195List.Create;
end;

destructor TNF_Rest_Compl.Destroy;
begin
  FreeAndNil(Fperiodo);
  FreeAndNil(FNotasEmitidas);
//  FreeAndNil(Flanc_assist);
  FreeAndNil(Ffat);
  //FreeAndNil(Ftipo88);
  if Assigned(Fconf) then
    FreeAndNil(Fconf);
//  FreeAndNil(Flanc_assist);
  //FreeAndNil(Flanc_aj);
  Fapuracao.Free;
  inherited;
end;

function TNF_Rest_Compl.NotasEmitidas: TDataSet_OOP;
begin
  Result := FNotasEmitidas;
  FNotasEmitidas.ClientOpen('select nf.natureza_nf E_S, nf.num_nf, nf.serie, nf.data_lanc data_nota, nf.data_contabil data_emissao,' +
                            ' nf.status, nf.situacao_nfe, nf.codigo_nop CFOP, nf.desc_natop Natureza_Operacao' +
                            ' from notafiscal nf' +
                            ' where nf.efdrestcomplicms_id = %d and nf.cod_empresa = %d' +
                            ' order by nf.cod_nf desc', [Fperiodo.fint('id'), vDadosIni.cod_empresa]);

end;

//function TNF_Rest_Compl.notasfiscais_gerar(Acfop: Integer; Anat_op: string;
//  Atipo: TipoRestCompl; Asalvar: Boolean): Boolean;
function TNF_Rest_Compl.notasfiscais_gerar(
  ModeloEmiss: TModeloEmissao; Asalvar: Boolean = False): Boolean;
var
  Aid_tmp, AstrTipo, str: string;
  Acod_cliente: Integer;
  Anota: THw_notafiscal_class;
  Aquant, Aloop: Integer;
  I, J: Integer;
  AsaveComErros: Boolean;
  //Aprod: TLF_Prod;
  //AlancAssist: TLanc_Fiscal_Assistente;
  //Atipos: Tipo_Ajuste_NF_Rest_Compls;
  //novos
  apur: TEfd_icmsst_cr_apuracao_class;
  sped_lancf: TSped_lancamento_fiscal_class;
begin

  {$REGION 'Codigo Antigo'}{
  Result := False;
  Flanc_aj.Clear;

  Ftipo88.SetValuesFrom(Fperiodo.dataSet, True);

  if Ftipo88.tipo_icm = '' then
  begin
    vDadosIni.ShowErro('Nenhum registro selecionado');
    Exit;
  end;

  AstrTipo := IfThen(Atipo = tpComplemento, strComplemento, strRestituicao);

  Ffat.notas.Clear;
  Ffat.erros.Clear;

  if Atipo = tpComplemento then
  begin
    if Ftipo88.cod_nf_comp > 0 then
    begin
      //aqui poderia usar a chave da classe para consultar, tipo o motorsql
      Anota := THw_notafiscal_class.Create(Ffat);
      Anota.SetValuesFrom(SqlOpen('select cod_nf, status, situacao_nfe from notafiscal where cod_nf = %d and cod_empresa = %d', [Ftipo88.cod_nf_comp, Ftipo88.cod_empresa]), True);

      if vDadosIni.strIn(Anota.situacao_nfe, [nf_sitCancelada, nf_sitDenegada, nf_sitInutilizada, nf_sitAInutilizar]) then
      begin
        SqlExec('update TIPO88_ICMSST_PERIODO set cod_nf_comp = null' +
                ' where periodo = %s and cod_empresa = %s and ' +
                ' cod_nf_comp = %d', [QuotedStr(Ftipo88.periodo), vDadosIni.codEmpresa, Ftipo88.cod_nf_comp]);
        if Transacao.InTransaction then
          Transacao.Commit;
      end
      else
      begin
        vDadosIni.ShowAtencao('Nota Fiscal de Complemento já se encontra no cadastro ' + sLineBreak + 'Status: %s' + sLineBreak + 'Situação: %s', [Anota.status, Anota.situacao_nfe]);
        Exit;
      end;
    end;

    if (Ftipo88.vl_comp_icm + Ftipo88.vl_comp_fcp) <= 0 then
    begin
      vDadosIni.ShowAtencao('Sem valores de Complemento para gerar a Nota Fiscal');
      Exit;
    end;
  end;

  if Atipo = tpRestituicao then
  begin
    if Ftipo88.cod_nf_rest > 0 then
    begin
      //aqui poderia usar a chave da classe para consultar, tipo o motorsql
      Anota := THw_notafiscal_class.Create(Ffat);
      Anota.SetValuesFrom(SqlOpen('select cod_nf, status, situacao_nfe from notafiscal where cod_nf = %d and cod_empresa = %d', [Ftipo88.cod_nf_rest, Ftipo88.cod_empresa]), True);

      if vDadosIni.strIn(Anota.situacao_nfe, [nf_sitCancelada, nf_sitDenegada, nf_sitInutilizada, nf_sitAInutilizar]) then
      begin
        SqlExec('update TIPO88_ICMSST_PERIODO set cod_nf_rest = null' +
                ' where periodo = %s and cod_empresa = %s and ' +
                ' cod_nf_rest = %d', [QuotedStr(Ftipo88.periodo), vDadosIni.codEmpresa, Ftipo88.cod_nf_rest]);
        if Transacao.InTransaction then
          Transacao.Commit;
      end
      else
      begin
        vDadosIni.ShowAtencao('Nota Fiscal de Restituição já se encontra no cadastro ' + sLineBreak + 'Status: %s' + sLineBreak + 'Situação: %s', [Anota.status, Anota.situacao_nfe]);
        Exit;
      end;
    end;

    if (Ftipo88.vl_rest_icm + Ftipo88.vl_rest_fcp) <= 0 then
    begin
      vDadosIni.ShowAtencao('Sem valores de Restituição para gerar a Nota Fiscal');
      Exit;
    end;
  end;

  Aid_tmp := Format('%s-%s', [AstrTipo, Ftipo88.periodo]);

  Acod_cliente := SqlOpen('select first 1 cod_cliente from clientes' +
                          ' where cpfcgc = %s and cod_empresa = %s and ativo = 1' +
                          ' order by cod_cliente',
                          [QuotedStr(vDadosIni.vEmp.vCNPJ), vDadosIni.codEmpresa]).FieldByName('cod_cliente').AsInteger;

  if Acod_cliente = 0 then
  begin
    vDadosIni.ShowErro('Empresa não encontrada no cadastro de clientes/fornecedores com o cnpj: %s',
                       [vDadosIni.vEmp.vCNPJ]);
    Exit;
  end;

  if not Assigned(Fconf) then
    Fconf := vDadosIni.getConfSisObject('nf_icms_st_rest_comp', QrAux);

  Anota := Ffat.notas.New;
  with Anota do
  begin
    THack_Hw_notafiscal_class(Anota).build_nf_campos;
    natureza_nf     := IfThen(Atipo = tpComplemento, 'S', 'E');
    cod_cliente     := Acod_cliente;
    num_gerado      := 'S';
    emissao_propria := 'S';
    data_contabil   := vDadosIni.getDataBanco(QrAux);
    data_lanc       := DateOf(EndOfTheMonth(EncodeDate(StrToInt(Copy(Ftipo88.periodo, 1, 4)), StrToInt(Copy(Ftipo88.periodo, 5, 2)),1)));
    devolucao       := 'SIM';
    try
      obs.Text      := Format(Fconf.ReadString(AstrTipo, 'TextoInfAdicional', ''),
                              [FormatDateTime('DD/MM/YYYY', StartOfTheMonth(data_lanc)),
                               FormatDateTime('DD/MM/YYYY', data_lanc)]);
    except
      obs.Text      := Format('%s do ICMS ST refêrente ao período de %s a %s',
                              [AstrTipo,
                               FormatDateTime('DD/MM/YYYY', StartOfTheMonth(data_lanc)),
                               FormatDateTime('DD/MM/YYYY', data_lanc)]);
    end;
  end;

  with Anota.itens.New do
  begin
    codigo_nop     := Acfop;
    desc_natop     := Anat_op;
    tipo_item      := 'O';
    num_fab_prod   := 'ICMSST';
    ncm            := '00000000';
    quantidade     := 0;
    valor_unitario := 0;
    referencia     := 'UN';
    cst            := Fconf.ReadString(AstrTipo, 'CST'  , '090');
    csosn          := Fconf.ReadString(AstrTipo, 'CSOSN', '900');
    descricao_item_outras.Clear;

    if Atipo = tpComplemento then
    begin
      if Ftipo88.vl_comp_icm > 0 then
        try
          descricao_item_outras.Add(Format(Fconf.ReadString(AstrTipo, 'TextoItemICMSST', ''), [Ftipo88.vl_comp_icm]));
        except
          descricao_item_outras.Add('Valor do Complemento de ICMS ST '+ Format('%0.2n', [Ftipo88.vl_comp_icm]));
        end;

      if Ftipo88.vl_comp_fcp > 0 then
        try
          descricao_item_outras.Add(';' + Format(Fconf.ReadString(AstrTipo, 'TextoItemFCPST', ''), [Ftipo88.vl_comp_fcp]));
        except
          descricao_item_outras.Add(';Valor do Complemento de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM '+ Format('%0.2n', [Ftipo88.vl_comp_fcp]));
        end;
    end
    else
    begin
      if Ftipo88.vl_rest_icm > 0 then
        try
          descricao_item_outras.Add(Format(Fconf.ReadString(AstrTipo, 'TextoItemICMSST', ''), [Ftipo88.vl_rest_icm]));
        except
          descricao_item_outras.Add('Valor da Restituição de ICMS ST '+ Format('%0.2n', [Ftipo88.vl_rest_icm]));
        end;

      if Ftipo88.vl_rest_fcp > 0 then
        try
          descricao_item_outras.Add(';' + Format(Fconf.ReadString(AstrTipo, 'TextoItemFCPST', ''), [Ftipo88.vl_rest_fcp]));
        except
          descricao_item_outras.Add(';Valor da Restituição de adicional de alíquota devido ao Fundo de Erradicação da Miséria - FEM '+ Format('%0.2n', [Ftipo88.vl_rest_fcp]));
        end;
    end;

  end;

  Anota.complemento_restituicao_montar(Aid_tmp);

  if not Asalvar then
    if Assigned(FNotasMake) then
      FNotasMake(Anota);

  if ((Atipo = tpComplemento) and ((Ftipo88.vl_comp_icm > 0) or (Ftipo88.vl_comp_fcp > 0))) or
     ((Atipo = tpRestituicao) and ((Ftipo88.vl_rest_icm > 0) or (Ftipo88.vl_rest_fcp > 0))) then
  begin
    Aprod              := TLF_Prod.Create;
    Aprod.valor_st     := IfThen(Atipo = tpComplemento, Ftipo88.vl_comp_icm, Ftipo88.vl_rest_icm);
    Aprod.valor_fcp_st := IfThen(Atipo = tpComplemento, Ftipo88.vl_comp_fcp, Ftipo88.vl_rest_fcp);
    Aprod.cod_empresa  := Ftipo88.cod_empresa;
    try

      if Atipo = tpComplemento then
      begin
        if Ftipo88.vl_comp_icm > 0 then
          if DateOf(StartOfTheMonth(Anota.data_lanc)) < DateOf(StartOfTheMonth(Anota.data_contabil)) then
            Atipos := Atipos + [ta_compl_st_ext]
          else
            Atipos := Atipos + [ta_compl_st];

        if Ftipo88.vl_comp_fcp > 0 then
          if DateOf(StartOfTheMonth(Anota.data_lanc)) < DateOf(StartOfTheMonth(Anota.data_contabil)) then
            Atipos := Atipos + [ta_compl_fcpst_ext]
          else
            Atipos := Atipos + [ta_compl_st];// aqui vem novamente pois é necessario para o ajuste
      end
      else if Atipo = tpRestituicao then
      begin
        if (Ftipo88.vl_rest_icm > 0) then
          Atipos := Atipos + [ta_rest_st]
        else if (Ftipo88.vl_rest_fcp > 0) then
          Atipos := Atipos + [ta_rest_fcpst];
      end;

      AlancAssist := TLanc_Fiscal_Assistente.Create(Banco, Aprod);
      Flanc_aj    := AlancAssist.Obter_LancamentosNF(Atipos);

      for I := 0 to Flanc_aj.Count - 1 do with Flanc_aj.Items[I] do
      begin
        if tp_txt_compl = txt_mmaaaa then
          txt_compl := Format('Referente ao período de %s a %s',
                              [FormatDateTime('DD/MM/YYYY', StartOfTheMonth(Anota.data_lanc)),
                               FormatDateTime('DD/MM/YYYY', EndOfTheMonth(Anota.data_lanc))]); //vDadosIni.StrZero(MonthOf(Anota.data_lanc), 2) + vDadosIni.StrZero(YearOf(Anota.data_lanc), 4);
        for J := 0 to c197.Count - 1 do with c197.Items[J] do
        begin
          txt_compl_c195 := txt_compl;
          Anota.lanc_aj.Add(Clone);
        end;
      end;

      if not Asalvar then
        if Assigned(FNotasMake) then
          FNotasMake(Flanc_aj);

    finally
      if Assigned(AlancAssist) then FreeAndNil(AlancAssist);          
    end;
  end;

  if Asalvar then
  begin
    if Anota.erros.Count > 0 then
      if vDadosIni.ShowConfirmacao('Existem erros que podem impedir a autorização das notas fiscais. Deseja continuar mesmo assim?') <> IDYES then
        Exit;

    with Anota do
    begin
      salvar(False);
      try
        Ffat.SqlExec('update TIPO88_ICMSST_PERIODO set %s = %d' +
                     ' where periodo = %s and cod_empresa = %s and ' +
                     ' %s is null',
                     [IfThen(Atipo = tpComplemento, 'cod_nf_comp', 'cod_nf_rest'),
                      cod_nf, QuotedStr(Ftipo88.periodo), vDadosIni.codEmpresa,
                      IfThen(Atipo = tpComplemento, 'cod_nf_comp', 'cod_nf_rest')]);
        if Ffat.SqlOpen('select count(periodo) contador from TIPO88_ICMSST_PERIODO' +
                        ' where periodo = %s and %s = %d and cod_empresa = %s',
                        [QuotedStr(Ftipo88.periodo), IfThen(Atipo = tpComplemento, 'cod_nf_comp', 'cod_nf_rest'),
                         cod_nf, vDadosIni.codempresa]).FieldByName('contador').AsInteger <> 1 then
          erros.New('Nota fiscal não foi vinculada ao período %s', [IfThen(Atipo = tpComplemento, 'do Complemento', 'da Restituição')]).
            detalhe := 'Repita o processo novamente. Se persistir o problema contacte o suporte técnico'
        else
        begin
          Ffat.Transacao.Commit;

          Fperiodo.Refresh;

          vDadosIni.GravaAuditoria('NF0214', 'SALVAR', Format('SUCESSO - %s - %s: NF:%d COD:%d',
           [AstrTipo, Ftipo88.periodo, num_nf, cod_nf]), 'TIPO88_ICMSST_PERIODO', Ftipo88.periodo, QrAux);
        end;
      finally
        if Ffat.Transacao.InTransaction then
          Ffat.Transacao.Rollback;
      end;

      if Assigned(FNotasMake) then
        FNotasMake(Anota);

      if Assigned(FNotasMake) then
        FNotasMake(Flanc_aj);
    end;
  end;

  if not Asalvar then
    vDadosIni.GravaAuditoria('NF0213', 'PREVER', Format('%s - %s',
      [AstrTipo, Ftipo88.periodo]), 'TIPO88_ICMSST_PERIODO', Ftipo88.periodo, QrAux);  

  if Ffat.erros.Count > 0 then
    vDadosIni.ShowAtencao('Processo concluído com erros', [MB_ICONEXCLAMATION])
  else
    vDadosIni.ShowAtencao('Processo concluído');

  Result := True;
  }
  {$ENDREGION}

  Result := False;

  if Fperiodo.dataSet.IsEmpty then
    Exit;

  Fperiodo.Auditor.Tabela := 'EFD_ICMSST_CR_APURACAO';

  //Flanc_aj.Clear;

  apur := TEfd_icmsst_cr_apuracao_class.Create;
  apur.CopyFrom(Fperiodo.dataSet);

  //AstrTipo := IfThen(Atipo = tpComplemento, strComplemento, strRestituicao);
  AstrTipo := ModeloEmiss.NaturezaOp;

  Ffat.notas.Clear;
  Ffat.erros.Clear;

  if not Client.ClientOpen('select cod_nf, num_nf, status, situacao_nfe, natureza_nf, emissao_propria from notafiscal' +
                           ' where efdrestcomplicms_id = %d and cod_empresa = %d',
                           [apur.id, vDadosIni.cod_empresa])
    .IsEmpty then
    if not MatchText(Client.fstr('situacao_nfe'), ['Cancelada', 'Denegada', 'Inutilizada', 'AInutilizar']) then
    begin
      str := Format('Já existe Nota Fiscal para este registro de apuração' + sLineBreak +
                    'Codigo: %d' + sLineBreak +
                    'Número: %d' + sLineBreak +
                    'Status: %s' + sLineBreak +
                    'Situação: %s' + sLineBreak +
                    'E/S: %s' + sLineBreak +
                    'Emissao Propria: %s' + sLineBreak + sLineBreak +
                    IfThen(Asalvar, 'Deseja continuar mesmo assim?'),
                    [Client.fint('cod_nf'), Client.fint('num_nf'), Client.fstr('status'), Client.fstr('situacao_nfe'),
                     Client.fstr('natureza_nf'), Client.fstr('emissao_propria')]);

      if not Asalvar then
        ShowAtencao(str)
      else if ShowConfirmacao(str) <> ID_YES then
        Exit;

      if Asalvar then      
        if not Fperiodo.Auditor.Processo('NF0222').Alterar
               .Msg('Ano %d Mes %d[ICMS %f ST %f FCP %f]', [apur.ano, apur.mes, VarToFloat(apur.icmsop), VarToFloat(apur.icmsst), VarToFloat(apur.fcpst)])
               .Key('%d%s-%d', [apur.ano, PadL(apur.mes, 2), apur.id])
               .Permitido then
          Exit;
    end;

  Aid_tmp := Format('rest-compl-%d', [apur.id]);

  Acod_cliente := SqlOpen('select first 1 cod_cliente from clientes' +
                          ' where cpfcgc = %s and cod_empresa = %s and ativo = 1' +
                          ' order by cod_cliente',
                          [QuotedStr(vDadosIni.vEmp.vCNPJ), vDadosIni.codEmpresa]).FieldByName('cod_cliente').AsInteger;

  if Acod_cliente = 0 then
  begin
    ShowErro('Empresa não encontrada no cadastro de clientes/fornecedores com o cnpj: %s', [vDadosIni.vEmp.vCNPJ]);
    Exit;
  end;

  if not Assigned(Fconf) then
    Fconf := vDadosIni.getConfSisObject('nf_icms_st_rest_comp', QrAux);

  if not ffat.notas.conf_nf.inicializado then
    ffat.notas.conf_nf.ExecutarLeitura;

  Anota := Ffat.notas.New;
  Anota.conf_nf := ffat.notas.conf_nf;
  with Anota do
  begin
    THack_Hw_notafiscal_class(Anota).build_nf_campos;
    natureza_nf     := IfThen(ModeloEmiss.CFOP >= 5000, 'S', 'E');
    cod_cliente     := Acod_cliente;
    emissao_propria := IfThen(ModeloEmiss.EmissaoPropria, 'S', 'N');
    data_contabil   := vDadosIni.getDataBanco(QrAux);
    data_lanc       := DateOf(EndOfTheMonth(EncodeDate(Fperiodo.fint('ano'), Fperiodo.fint('mes'), 1)));
    devolucao       := 'SIM';
    obs.Text        := ModeloEmiss.DadosAdExpressao + IfThen(ModeloEmiss.DadosAdPeriodo <> '', ';' + ModeloEmiss.DadosAdPeriodo);
    efdrestcomplicms_id := apur.id;
  end;

  with Anota.itens.New do
  begin
    codigo_nop     := ModeloEmiss.CFOP;
    desc_natop     := ModeloEmiss.NaturezaOp;
    tipo_item      := 'O';
    num_fab_prod   := 'ICMSST';
    ncm            := '00000000';
    quantidade     := 0;
    valor_unitario := 0;
    referencia     := 'UN';
    cst            := Fconf.ReadString(AstrTipo, 'CST'  , '090');
    csosn          := Fconf.ReadString(AstrTipo, 'CSOSN', '900');
    descricao_item_outras.Clear;
    if Trim(ModeloEmiss.LinhaProdST) <> '' then
      descricao_item_outras.Add(Trim(ModeloEmiss.LinhaProdST));
    if Trim(ModeloEmiss.LinhaProdFCP) <> '' then
      descricao_item_outras.Add(Trim(ModeloEmiss.LinhaProdFCP));
    if Trim(ModeloEmiss.LinhaProdICMS) <> '' then
      descricao_item_outras.Add(Trim(ModeloEmiss.LinhaProdICMS));
  end;

  Anota.complemento_restituicao_montar(Aid_tmp);

  if not Asalvar then
    if Assigned(FNotasMake) then
      FNotasMake(Anota);

  sped_lancf := TSped_lancamento_fiscal_class.Create;
  try
    for I := 0 to ModeloEmiss.LancC195.Count - 1 do
    begin
      if Asalvar then
      begin
        sped_lancf.CopyFrom(SqlOpen('select * from sped_lancamento_fiscal where txt = %s and cod_empresa = %d',
                                    [QuotedStr(Copy(ModeloEmiss.LancC195.Items[I].Obs,1,255)), vDadosIni.cod_empresa]));


        if sped_lancf.cod_obs = 0 then
        begin
          sped_lancf.txt := ModeloEmiss.LancC195.Items[I].Obs;                                   
          sped_lancf.cod_empresa := vDadosIni.cod_empresa;
          sped_lancf.cod_obs := Ffat.SqlInsertID(sped_lancf.SQLMotor('cod_obs').SQLInsertAutoInc, 'cod_obs');
        end;
      end;

      for J := 0 to ModeloEmiss.LancC195.Items[I].LancC197.Count - 1 do
        with Anota.lanc_aj.New do
        begin
          cod_obs := sped_lancf.cod_obs;
          cod_empresa := vDadosIni.cod_empresa;
          nitem := 0;
          txt_compl_c195 := ModeloEmiss.LancC195.Items[I].TxtCompl;
          cod_aj := ModeloEmiss.LancC195.Items[I].LancC197.Items[J].cod_aj;
          descr_compl_aj := ModeloEmiss.LancC195.Items[I].LancC197.Items[J].descr_compl_aj;
          vl_bc_icms := ModeloEmiss.LancC195.Items[I].LancC197.Items[J].Base;
          aliq_icms := ModeloEmiss.LancC195.Items[I].LancC197.Items[J].Aliquota;
          vl_icms := ModeloEmiss.LancC195.Items[I].LancC197.Items[J].Valor;
          vl_outros := 0;
        end;
    end;    

    if not Asalvar then
      if Assigned(FNotasMake) then
        FNotasMake(ModeloEmiss);
  finally
    sped_lancf.Free;
  end;

  {$REGION 'Lancamentos antigos'}
  {
  if ((Atipo = tpComplemento) and ((Ftipo88.vl_comp_icm > 0) or (Ftipo88.vl_comp_fcp > 0))) or
     ((Atipo = tpRestituicao) and ((Ftipo88.vl_rest_icm > 0) or (Ftipo88.vl_rest_fcp > 0))) then
  begin
    Aprod              := TLF_Prod.Create;
    Aprod.valor_st     := IfThen(Atipo = tpComplemento, Ftipo88.vl_comp_icm, Ftipo88.vl_rest_icm);
    Aprod.valor_fcp_st := IfThen(Atipo = tpComplemento, Ftipo88.vl_comp_fcp, Ftipo88.vl_rest_fcp);
    Aprod.cod_empresa  := Ftipo88.cod_empresa;
    try

      if Atipo = tpComplemento then
      begin
        if Ftipo88.vl_comp_icm > 0 then
          if DateOf(StartOfTheMonth(Anota.data_lanc)) < DateOf(StartOfTheMonth(Anota.data_contabil)) then
            Atipos := Atipos + [ta_compl_st_ext]
          else
            Atipos := Atipos + [ta_compl_st];

        if Ftipo88.vl_comp_fcp > 0 then
          if DateOf(StartOfTheMonth(Anota.data_lanc)) < DateOf(StartOfTheMonth(Anota.data_contabil)) then
            Atipos := Atipos + [ta_compl_fcpst_ext]
          else
            Atipos := Atipos + [ta_compl_st];// aqui vem novamente pois é necessario para o ajuste
      end
      else if Atipo = tpRestituicao then
      begin
        if (Ftipo88.vl_rest_icm > 0) then
          Atipos := Atipos + [ta_rest_st]
        else if (Ftipo88.vl_rest_fcp > 0) then
          Atipos := Atipos + [ta_rest_fcpst];
      end;

      AlancAssist := TLanc_Fiscal_Assistente.Create(Banco, Aprod);
      Flanc_aj    := AlancAssist.Obter_LancamentosNF(Atipos);

      for I := 0 to Flanc_aj.Count - 1 do with Flanc_aj.Items[I] do
      begin
        if tp_txt_compl = txt_mmaaaa then
          txt_compl := Format('Referente ao período de %s a %s',
                              [FormatDateTime('DD/MM/YYYY', StartOfTheMonth(Anota.data_lanc)),
                               FormatDateTime('DD/MM/YYYY', EndOfTheMonth(Anota.data_lanc))]); //vDadosIni.StrZero(MonthOf(Anota.data_lanc), 2) + vDadosIni.StrZero(YearOf(Anota.data_lanc), 4);
        for J := 0 to c197.Count - 1 do with c197.Items[J] do
        begin
          txt_compl_c195 := txt_compl;
          Anota.lanc_aj.Add(Clone);
        end;
      end;

      if not Asalvar then
        if Assigned(FNotasMake) then
          FNotasMake(Flanc_aj);

    finally
      if Assigned(AlancAssist) then FreeAndNil(AlancAssist);
    end;
  end;
  }
  {$ENDREGION}

  if Asalvar then
  begin
    if Anota.erros.Count > 0 then
      if vDadosIni.ShowConfirmacao('Existem erros que podem impedir a autorização das notas fiscais. Deseja continuar mesmo assim?') <> IDYES then
        Exit;

    with Anota do
    begin
      salvar(False);
      try
      {
        Ffat.SqlExec('update TIPO88_ICMSST_PERIODO set %s = %d' +
                     ' where periodo = %s and cod_empresa = %s and ' +
                     ' %s is null',
                     [IfThen(Atipo = tpComplemento, 'cod_nf_comp', 'cod_nf_rest'),
                      cod_nf, QuotedStr(Ftipo88.periodo), vDadosIni.codEmpresa,
                      IfThen(Atipo = tpComplemento, 'cod_nf_comp', 'cod_nf_rest')]);

        if Ffat.SqlOpen('select count(periodo) contador from TIPO88_ICMSST_PERIODO' +
                        ' where periodo = %s and %s = %d and cod_empresa = %s',
                        [QuotedStr(Ftipo88.periodo), IfThen(Atipo = tpComplemento, 'cod_nf_comp', 'cod_nf_rest'),
                         cod_nf, vDadosIni.codempresa]).FieldByName('contador').AsInteger <> 1 then
          erros.New('Nota fiscal não foi vinculada ao período %s', [IfThen(Atipo = tpComplemento, 'do Complemento', 'da Restituição')]).
            detalhe := 'Repita o processo novamente. Se persistir o problema contacte o suporte técnico'
        else    }
        begin
          Ffat.Transacao.Commit;

          Fperiodo.Refresh;

          vDadosIni.GravaAuditoria('NF0214', 'SALVAR', Format('SUCESSO - %s - %s: NF:%d COD:%d',
                                   [AstrTipo, Fperiodo.fstr('ano') + Fperiodo.fstr('mes'), num_nf, cod_nf]),
                                   'EFD_ICMSST_CR_APURACAO', Fperiodo.fstr('ano') + Fperiodo.fstr('mes') + '-' + Fperiodo.fstr('id'), QrAux);

//          vDadosIni.GravaAuditoria('NF0214', 'SALVAR', Format('SUCESSO - %s - %s: NF:%d COD:%d',
//           [AstrTipo, Ftipo88.periodo, num_nf, cod_nf]), 'TIPO88_ICMSST_PERIODO', Ftipo88.periodo, QrAux);
        end;
      finally
        if Ffat.Transacao.InTransaction then
          Ffat.Transacao.Rollback;
      end;

      if Assigned(FNotasMake) then
        FNotasMake(Anota);

      if Assigned(FNotasMake) then
        FNotasMake(ModeloEmiss);

//      if Assigned(FNotasMake) then
//        FNotasMake(Flanc_aj);
    end;
  end;

  if not Asalvar then
    vDadosIni.GravaAuditoria('NF0213', 'PREVER', Format('%s - %s',
                                   [AstrTipo, Fperiodo.fstr('ano') + Fperiodo.fstr('mes')]),
                                    'EFD_ICMSST_CR_APURACAO', Fperiodo.fstr('ano') + Fperiodo.fstr('mes') + '-' + Fperiodo.fstr('id'), QrAux);

  if Ffat.erros.Count > 0 then
    vDadosIni.ShowAtencao('Processo concluído com erros', [MB_ICONEXCLAMATION])
  else
    vDadosIni.ShowAtencao('Processo concluído');

  Result := True;
end;

function TNF_Rest_Compl.obterPeriodos(Aano: string): TDataSet_OOP;
begin
  Result := Fperiodo;
  Fperiodo.ClientOpen('select p.ano, p.mes, p.id, p.tipo, ' +
                      ' iif(p.tipo = 1, ''Restituição [Saída inferior a BC Presumida]'',' +
                      '                 iif(p.tipo = 2, ''Restituição [Fato presumido não realizado]'',' +
                      '                                 ''Complementação [Saída superior a BC Presumida]'')) Motivo,' +
                      ' p.icmsop, p.icmsst, p.fcpst' +
                      ' from efd_icmsst_cr_apuracao p' +
                      ' where p.ano = %s and p.cod_empresa = %s' +
                      ' order by p.ano desc, p.mes',
                       [Aano, vDadosIni.codEmpresa]);
  Fperiodo.ffDisplayFormat('icmsop').ffDisplayFormat('icmsst').ffDisplayFormat('fcpst')
          .ffDisplayLabel('icmsop', 'ICMS Op')
          .ffDisplayLabel('icmsst', 'ICMS ST')
          .ffDisplayLabel('fcpst', 'FCP ST');
  Exit;

  Fperiodo.montaSelect('select t8.periodo,' +
                       ' t8.tipo_icm, t8.vl_comp_icm, t8.vl_rest_icm, nfc.num_nf num_nf_comp, nfc.data_lanc nf_data_comp, nfc.data_contabil nf_emissao_comp,' +
                       ' nfc.status nf_status_comp, nfc.situacao_nfe nf_sit_nfe_comp, t8.cod_nf_comp,' +
                       ' t8.tipo_fcp, t8.vl_comp_fcp, t8.vl_rest_fcp, nfr.num_nf num_nf_rest, nfr.data_lanc nf_data_rest, nfr.data_contabil nf_emissao_rest,' +
                       ' nfr.status nf_status_comp, nfr.situacao_nfe nf_sit_nfe_comp, t8.cod_nf_rest,' +
                       ' t8.cod_empresa' +
                       ' from tipo88_icmsst_periodo t8' +
                       ' left join notafiscal nfc on nfc.cod_nf = t8.cod_nf_comp and nfc.cod_empresa = t8.cod_empresa' +
                       ' left join notafiscal nfr on nfr.cod_nf = t8.cod_nf_rest and nfr.cod_empresa = t8.cod_empresa' +
                       ' where t8.periodo like %s and t8.cod_empresa = %s' +
                       ' order by periodo',
                       [QuotedStr(Aano + '%'), vDadosIni.codEmpresa]);
end;

procedure TfrmCadNF_icmsst_rest_compl.BitBtn1Click(Sender: TObject);
begin
  inherited;
  tv_nf.Items.Clear();
  ed_cfop.AsValue := _LerConfiguracoesRegistroInteger(strRestituicao + '_CFOP', 1603);
  ed_nat_op.Text  := _LerConfiguracoesRegistroString( strRestituicao + '_NAT' , strRestituicao + ' de ICMS ST - Aspecto quantitativo');
  lbTipo.Caption  := strRestituicao;
//  if Fnf.notasfiscais_gerar(ed_cfop.AsInteger, ed_nat_op.Text, tpRestituicao, False) then
//    PageControl1.ActivePage := ts_nf;
end;

procedure TfrmCadNF_icmsst_rest_compl.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadNF_icmsst_rest_compl.BitBtn3Click(Sender: TObject);
begin
  inherited;
  tv_nf.Items.Clear();
  ed_cfop.AsValue := _LerConfiguracoesRegistroInteger(strComplemento + '_CFOP', 5949);
  ed_nat_op.Text  := _LerConfiguracoesRegistroString( strComplemento + '_NAT' , 'Complemento de ICMS ST - Aspecto quantitativo');
  lbTipo.Caption  := strComplemento;
//  if Fnf.notasfiscais_gerar(ed_cfop.AsInteger, ed_nat_op.Text, tpComplemento, False) then
//    PageControl1.ActivePage := ts_nf;
end;

procedure TfrmCadNF_icmsst_rest_compl.bt_nf_atualizarClick(Sender: TObject);
var
  Atipo: TipoRestCompl;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0213', 'PREVER', Format('%s: %s', [lbTipo.Caption, Fnf.periodo.fstr('periodo')]),
    'TIPO88_ICMSST_PERIODO', Fnf.periodo.fstr('periodo'), Fnf.QrAux) then
    Exit;

  tv_nf.Items.Clear();
  if lbTipo.Caption = strComplemento then
    Atipo := tpComplemento
  else
    Atipo := tpRestituicao;

//  if Fnf.notasfiscais_gerar(ed_cfop.AsInteger, ed_nat_op.Text, Atipo) then
//  begin
//    _GravaConfiguracoesInteger(lbTipo.Caption + '_CFOP', ed_cfop.AsInteger);
//    _GravaConfiguracoesString( lbTipo.Caption + '_NAT' , ed_nat_op.Text);
//  end;
end;

procedure TfrmCadNF_icmsst_rest_compl.bt_nf_criarClick(Sender: TObject);
var
  Atipo: TipoRestCompl;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0214', 'PREVER', Format('%s: %s', [lbTipo.Caption, Fnf.periodo.fstr('periodo')]),
    'TIPO88_ICMSST_PERIODO', Fnf.periodo.fstr('periodo'), Fnf.QrAux) then
    Exit;

  tv_nf.Items.Clear();
  if lbTipo.Caption = strComplemento then
    Atipo := tpComplemento
  else
    Atipo := tpRestituicao;

//  if Fnf.notasfiscais_gerar(ed_cfop.AsInteger, ed_nat_op.Text, Atipo, True) then
//  begin
//    _GravaConfiguracoesInteger(lbTipo.Caption + '_CFOP', ed_cfop.AsInteger);
//    _GravaConfiguracoesString( lbTipo.Caption + '_NAT' , ed_nat_op.Text);
//  end;
end;

procedure TfrmCadNF_icmsst_rest_compl.bt_nf_voltarClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := ts_periodos;
end;

procedure TfrmCadNF_icmsst_rest_compl.cklb_valorClickCheck(Sender: TObject);
begin
  inherited;
  ed_ajvalor.AsValue := IfThen(cklb_valor.Checked[0], Fnf.periodo.ffloat('icmsst')) +
                        IfThen(cklb_valor.Checked[1], Fnf.periodo.ffloat('fcpst')) +
                        IfThen(cklb_valor.Checked[2], Fnf.periodo.ffloat('icmsop'));
end;

procedure TfrmCadNF_icmsst_rest_compl.complemento_restituicao_notas_make(
  Sender: TObject);
var
  Anf: THw_notafiscal_class;
  Ait: THw_notafiscal_item_class;
  Aerros: THw_erro_classList;
  Alevel0, Alevel1, Alevel2: TTreeNode;
  I, J: Integer;
  Alist: TStrings;
begin
  if not Assigned(Sender) then
  begin
    tv_nf.Items.AddChild(nil, 'Sem dados para apresentar. Contacte o suporte técnico');
  end
  else if Sender is THw_notafiscal_class then
  begin
    Anf := THw_notafiscal_class(Sender);
    Alevel0 := tv_nf.Items.AddChild(nil, Format('Nota fiscal %s de %s  - %s(Erros: %d)',
                                                [IfThen(Anf.num_nf > 0, IntToStr(Anf.num_nf)),
                                                 IfThen(Anf.natureza_nf = 'S', 'Saída', 'Entrada'),
                                                 Anf.nome_cliente, Anf.erros.Count]));
    if Anf.erros.Count > 0 then
    begin
      Aerros := Anf.erros;
      Alevel1 := tv_nf.Items.AddChild(Alevel0, 'Erros no processamento');
      for I := 0 to Pred(Aerros.Count) do
      begin
        Alevel2 := tv_nf.Items.AddChild(Alevel1, Aerros.Items[I].erro);
        if Aerros.Items[I].detalhe <> '' then
          tv_nf.Items.AddChild(Alevel2, Aerros.Items[I].detalhe);
      end;
    end;
    Alevel1 := tv_nf.Items.AddChild(Alevel0, Format('Total.....: %n', [Anf.valor_total]));
    tv_nf.Items.AddChild(Alevel1, Format('Natureza da Operação: %d - %s', [Trunc(Anf.codigo_nop), Anf.desc_natop]));
    tv_nf.Items.AddChild(Alevel1, Format('Status e Situação...: %s - %s', [Anf.status, Anf.situacao_nfe]));
    tv_nf.Items.AddChild(Alevel1, Format('BC ICMS.............: %n', [Anf.base_icm]));
    tv_nf.Items.AddChild(Alevel1, Format('ICMS................: %n', [Anf.valor_icm]));
    tv_nf.Items.AddChild(Alevel1, Format('BC ICMS ST..........: %n', [Anf.base_icmsub]));
    tv_nf.Items.AddChild(Alevel1, Format('*ICMS ST............: %n', [Anf.valor_icmsub]));
    tv_nf.Items.AddChild(Alevel1, Format('*Produtos...........: %n', [Anf.valor_prod]));
    tv_nf.Items.AddChild(Alevel1, Format('*Descontos..........: %n', [Anf.valor_desc]));
    tv_nf.Items.AddChild(Alevel1, Format('*IPI................: %n', [Anf.valor_ipi]));
    tv_nf.Items.AddChild(Alevel1, Format('*Frete..............: %n', [Anf.valor_frete]));
    tv_nf.Items.AddChild(Alevel1, Format('*Seguro.............: %n', [Anf.valor_seguro]));
    tv_nf.Items.AddChild(Alevel1, Format('*Outros.............: %n', [Anf.valor_out_desp]));
    tv_nf.Items.AddChild(Alevel1, Format('*Imposto Importação.: %n', [Anf.valor_ii]));
    tv_nf.Items.AddChild(Alevel1, Format('Val Aprox tributos..: %n', [Anf.vtottrib]));
    tv_nf.Items.AddChild(Alevel1, Format('ICMS Inter Dest.....: %n', [Anf.vicmsufdest]));
    tv_nf.Items.AddChild(Alevel1, Format('ICMS Inter Rem......: %n', [Anf.vicmsufremet]));
    tv_nf.Items.AddChild(Alevel1, Format('FCP Inter Dest......: %n', [Anf.vfcpufdest]));
    tv_nf.Items.AddChild(Alevel1, Format('FCP.................: %n', [Anf.fcp_vfcp]));
    tv_nf.Items.AddChild(Alevel1, Format('*FCP ST.............: %n', [Anf.fcp_vfcpst]));
    tv_nf.Items.AddChild(Alevel1, Format('FCP ST Ant..........: %n', [Anf.fcp_vfcpstret]));
    tv_nf.Items.AddChild(Alevel1, Format('Frete por conta.....: %s', [IfThen(Anf.freteconta_tr = '0', 'Terceiros')    +
                                                                      IfThen(Anf.freteconta_tr = '1', 'Emitente')     +
                                                                      IfThen(Anf.freteconta_tr = '2', 'Destinatário') +
                                                                      IfThen(IndexText(Anf.freteconta_tr, ['0', '1', '2']) = -1, 'Sem frete')]));
    tv_nf.Items.AddChild(Alevel1, Format('Consumidor Final....: %s', [IfThen(Anf.consumidor_final = 'S', 'Sim', 'Não')]));
    tv_nf.Items.AddChild(Alevel1, Format('Indicador de IE.....: %d', [Anf.nfe_indiedest]));

    Alevel1 := tv_nf.Items.AddChild(Alevel0, Format('Itens da nota - Qtde %d', [Anf.itens.Count]));
    for I := 0 to Pred(Anf.itens.Count) do
    begin
      Ait := Anf.itens.Items[I];
      for J := 0 to Ait.descricao_item_outras.Count - 1 do
        Alevel2 := tv_nf.Items.AddChild(Alevel1, Format('%s - %s', [IfThen( J = 0, IntToStr(Ait.nitem), ' '), Ait.descricao_item_outras[J]]));

      tv_nf.Items.AddChild(Alevel2, Format('CFOP................: %4.0f', [Ait.codigo_nop]));
      tv_nf.Items.AddChild(Alevel2, Format('CST ICMS............: %s'   , [Ait.cst]));
      tv_nf.Items.AddChild(Alevel2, Format('Valor Unitário......: %0.6n', [Ait.valor_unitario]));
      tv_nf.Items.AddChild(Alevel2, Format('Quantidade..........: %0.6n', [Ait.quantidade]));
      tv_nf.Items.AddChild(Alevel2, Format('Valor Total.........: %0.2n', [Ait.valor_total]));
    end;
  end
  else if Sender is THw_erro_classList then
  begin
    Aerros := THw_erro_classList(Sender);

    for I := 0 to Pred(Aerros.Count) do with Aerros.Items[I] do
    begin
      Alevel0 := tv_nf.Items.AddChild(nil, erro);
      if detalhe <> '' then
        if Pos(sLineBreak, detalhe) = 0 then
          tv_nf.Items.AddChild(Alevel0, detalhe)
        else
        begin
          Alist := TStringList.Create;
          try
            Alist.Text := detalhe;
            for J := 0 to Pred(Alist.Count) do
              tv_nf.Items.AddChild(Alevel0, Alist[J]);
          finally
            FreeAndNil(Alist);
          end;
        end;
    end;
  end
  else if Sender is THw_erro_class then
  begin
    with THw_erro_class(Sender) do
    begin
      Alevel0 := tv_nf.Items.AddChild(nil, erro);
      if detalhe <> '' then
        if Pos(sLineBreak, detalhe) = 0 then
          tv_nf.Items.AddChild(Alevel0, detalhe)
        else
        begin
          Alist := TStringList.Create;
          try
            Alist.Text := detalhe;
            for J := 0 to Pred(Alist.Count) do
              tv_nf.Items.AddChild(Alevel0, Alist[J]);
          finally
            FreeAndNil(Alist);
          end;
        end;
    end;
  end
//  else if Sender is THW_C195List then
//  begin
//    for I := 0 to THW_C195List(Sender).Count - 1 do with THW_C195List(Sender).Items[I] do
//    begin
//      Alevel0 := tv_nf.Items.AddChild(nil, Format('Obs - ID %d: %s', [cod_obs, txt]));
//      if txt_compl <> '' then
//        tv_nf.Items.AddChild(Alevel0, Format('Commplento: %s', [txt_compl]));
//      for J := 0 to Pred(c197.Count) do with c197.Items[J] do
//      begin
//        Alevel1 := tv_nf.Items.AddChild(Alevel0, Format('Ajuste: %s', [cod_aj]));;
//        //tv_nf.Items.AddChild(Alevel1, Format('Codigo ajuste.........: %s', [cod_aj]));
//        tv_nf.Items.AddChild(Alevel1, Format('Descrição complementar: %s', [descr_compl_aj]));
//        tv_nf.Items.AddChild(Alevel1, Format('Base ICMS.............: %n', [vl_bc_icms]));
//        tv_nf.Items.AddChild(Alevel1, Format('Aliq ICMS.............: %n', [aliq_icms]));
//        tv_nf.Items.AddChild(Alevel1, Format('Valor ICMS............: %n', [vl_icms]));
//      end;
//    end;
//  end
  else if Sender is TModeloEmissao then
  begin
    for I := 0 to TModeloEmissao(Sender).LancC195.Count - 1 do with TModeloEmissao(Sender).LancC195.Items[I] do
    begin
      Alevel0 := tv_nf.Items.AddChild(nil, Format('Obs - %s', [Obs]));
      if TxtCompl <> '' then
        tv_nf.Items.AddChild(Alevel0, Format('Commplento: %s', [TxtCompl]));
      for J := 0 to Pred(LancC197.Count) do with LancC197.Items[J] do
      begin
        Alevel1 := tv_nf.Items.AddChild(Alevel0, Format('Ajuste: %s', [cod_aj]));;
        //tv_nf.Items.AddChild(Alevel1, Format('Codigo ajuste.........: %s', [cod_aj]));
        tv_nf.Items.AddChild(Alevel1, Format('Descrição complementar: %s', [descr_compl_aj]));
//        tv_nf.Items.AddChild(Alevel1, Format('Base ICMS.............: %n', [vl_bc_icms]));
//        tv_nf.Items.AddChild(Alevel1, Format('Aliq ICMS.............: %n', [aliq_icms]));
        tv_nf.Items.AddChild(Alevel1, Format('Valor..................: %n', [Valor]));
      end;
    end;

  end;

end;

procedure TfrmCadNF_icmsst_rest_compl.ed_modcfopExit(Sender: TObject);
begin
  inherited;
  if ed_modcfop.AsInteger >= 5000 then
    ck_emissaopropria.Checked := True;
  ck_emissaopropria.Enabled := not ( ed_modcfop.AsInteger >= 5000);
end;

procedure TfrmCadNF_icmsst_rest_compl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(Fnf);
  FModelosEmiss.Free;
  FModelosC195.Free;
  FModelosC197.Free;
  FModeloSel.Free;

  Action := caFree;
  frmCadNF_icmsst_rest_compl := nil;
end;

procedure TfrmCadNF_icmsst_rest_compl.FormCreate(Sender: TObject);
begin       
  Fnf := TNF_Rest_Compl.Create;
  Fnf.onNotasMake := complemento_restituicao_notas_make;
  FModelosEmiss := TModelosEmissao.Create;
  FModelosC195 := TModelosC195.Create;
  FModelosC197 := TModelosC197.Create;
  FModelosEmiss := TModelosEmissao.Create;
  FModeloSel := TModeloEmissao.Create;

  inherited;
  ts_periodos.TabVisible := False;
  ts_nota.TabVisible := False;
  ts_nf.TabVisible := False;
  ts_apuracao.TabVisible := False;
  ts_modelosemiss.TabVisible := False;
  ts_lanc_c195.TabVisible := False;
  ts_lanc_c197.TabVisible := False;
  ts_prev.TabVisible := False;

  grid_tipo88.DataSource := Fnf.periodo._dataSourceOOP;
  grid_apuracao.DataSource := Fnf.periodo._dataSourceOOP;
  MaskEdit1.Text := FormatDateTime('YYYY', Date);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadNF_icmsst_rest_compl.FormShow(Sender: TObject);
begin
  inherited;
  grid_tipo88.Visible := False;
//  PageControl1.ActivePage := ts_periodos;
  PageControl1.ActivePage := ts_apuracao;
  PageControl2.TabPosition := tpTop;
  PageControl2.Style := tsFlatButtons;

  grid_apuracao.Visible := Fnf.obterPeriodos(IntToStr(YearOf(Date))).dataSet.RecordCount > 0;
  group_notas.Visible := False;
  Panel11.Caption := IfThen(not grid_apuracao.Visible, 'Sem registros para o ano ' + IntToStr(YearOf(Date)));
end;

procedure TfrmCadNF_icmsst_rest_compl.lbxC195Click(Sender: TObject);
begin
  inherited;
  if lbxC195.ItemIndex > -1 then  
    with FModelosC195.Items[lbxC195.ItemIndex] do
    begin
      ed_codobs.Text := Obs;
      if TxtCompl <> '' then
        ed_txtcompl.Text := Format(TxtCompl, [FormatDateTime('DD/MM/YYYY', StartOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1))),
                                              FormatDateTime('DD/MM/YYYY', EndOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1)))])
      else
        ed_txtcompl.Clear;
    end;
end;

procedure TfrmCadNF_icmsst_rest_compl.lbxC197Click(Sender: TObject);
begin
  inherited;
  if lbxC197.ItemIndex > -1 then
    with FModelosC197.Items[lbxC197.ItemIndex] do
    begin
      ed_codaj.Text := cod_aj;
      ed_descaj.Text := descr_compl_aj;

      cklb_valor.Checked[0] := fields_valor and field_valor_icm_st = field_valor_icm_st;
      cklb_valor.Checked[1] := fields_valor and field_valor_fcp_st = field_valor_fcp_st;
      cklb_valor.Checked[2] := fields_valor and field_valor_icm = field_valor_icm;

      ed_ajvalor.AsValue := IfThen(fields_valor and field_valor_icm_st   = field_valor_icm_st , Fnf.periodo.ffloat('icmsst')) +
                            IfThen(fields_valor and field_valor_fcp_st   = field_valor_fcp_st , Fnf.periodo.ffloat('fcpst')) +
                            IfThen(fields_valor and field_valor_icm      = field_valor_icm    , Fnf.periodo.ffloat('icmsop'));

    end;
end;

procedure TfrmCadNF_icmsst_rest_compl.make_lbx_ajustesSel;
var
  I: Integer;
  Txt: string;
begin
  lbx_ajsel.Items.Clear;
  for I := 0 to ModeloSel.LancC195.Items[IndexLancC195].LancC197.Count - 1 do
  with ModeloSel.LancC195.Items[IndexLancC195].LancC197.Items[I] do
    begin
      Txt := cod_aj + IfThen(descr_compl_aj <> '', ' - ' + descr_compl_aj);

      if Valor > 0 then
        Txt := Txt + ' - ' + Format('%n', [Valor]);
      lbx_ajsel.Items.Add(Txt);
    end;
end;

procedure TfrmCadNF_icmsst_rest_compl.make_lbx_modelosC195;
var
  I: Integer;
  Txt: string;
begin
  lbxC195.Items.Clear;
  for I := 0 to FModelosC195.Count - 1 do
   with FModelosC195.Items[I] do
    begin
      Txt := Obs;
      if TxtCompl <> '' then
        Txt := Txt + ' - ' + Format(TxtCompl, [FormatDateTime('DD/MM/YYYY', StartOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1))),
                                               FormatDateTime('DD/MM/YYYY', EndOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1)))]);
      lbxC195.Items.Add(Txt);
    end;
  lbxC195.ItemIndex := IfThen(FModelosC195.Count > 0, 0, -1);
end;

procedure TfrmCadNF_icmsst_rest_compl.make_lbx_modelosC197;
var
  I: Integer;
  Txt: string;
begin
  lbxC197.Items.Clear;
  for I := 0 to FModelosC197.Count - 1do
    with FModelosC197.Items[I] do
    begin

      Txt := cod_aj + IfThen(descr_compl_aj <> '', ' - ' + descr_compl_aj);

      if fields_valor > 0 then
        Txt := Txt + ' -' + IfThen(fields_valor and field_valor_icm    = field_valor_icm   , ' ICMS OP') +
                           IfThen(fields_valor and field_valor_icm_st = field_valor_icm_st, ' ICMS ST') +
                           IfThen(fields_valor and field_valor_fcp    = field_valor_fcp   , ' FCP') +
                           IfThen(fields_valor and field_valor_fcp_st = field_valor_fcp_st, ' FCPST');
      lbxC197.Items.Add(Txt);
    end;
  lbxC197.ItemIndex := IfThen(FModelosC197.Count > 0, 0, -1);
end;

procedure TfrmCadNF_icmsst_rest_compl.make_tv_lanc_prev;
var
  Alevel0, Alevel1, Alevel2: TTreeNode;
  I, J: Integer;
  Txt: string;
begin
  tv_prev.Items.Clear;
  for I := 0 to ModeloSel.LancC195.Count - 1 do with ModeloSel.LancC195.Items[I] do
  begin
    Txt := Obs;
    if TxtCompl <> '' then
      Txt := Txt + ' - ' + TxtCompl;

    Alevel0 := tv_prev.Items.AddChild(nil, Txt);

    for J := 0 to LancC197.Count - 1 do with LancC197.Items[J] do
    begin
      Txt := cod_aj + IfThen(descr_compl_aj <> '', ' - ' + descr_compl_aj);
      Alevel1 := tv_prev.Items.AddChild(Alevel0, Txt);
      if Valor > 0 then
        tv_prev.Items.AddChild(Alevel1, Format('%n', [Valor]));
    end;
  end;
  if tv_prev.Items.Count > 0 then
    tv_prev.Items[0].Selected := True;
end;

procedure TfrmCadNF_icmsst_rest_compl.make_tv_modelos;
var
  Alevel0, Alevel1, Alevel2: TTreeNode;
  I, J: Integer;
begin
  tv_modelosemitir.Items.Clear;
  for I := 0 to ModelosEmiss.Count - 1 do with ModelosEmiss.Items[I] do
  begin
    Alevel0 := tv_modelosemitir.Items.AddChild(nil, Format('%d - %s', [CFOP, NaturezaOp]));

    tv_modelosemitir.Items.AddChild(Alevel0, Format('Texto ICMS ST: %s', [IfThen(LinhaProdST   <> '', Format(LinhaProdST , [Fnf.periodo.ffloat('icmsst') ]))]));
    tv_modelosemitir.Items.AddChild(Alevel0, Format('Texto FCP ST: %s' , [IfThen(LinhaProdFCP  <> '', Format(LinhaProdFCP , [Fnf.periodo.ffloat('fcpst') ]))]));
    tv_modelosemitir.Items.AddChild(Alevel0, Format('Texto ICMS OP: %s', [IfThen(LinhaProdICMS <> '', Format(LinhaProdICMS, [Fnf.periodo.ffloat('icmsop')]))]));
    tv_modelosemitir.Items.AddChild(Alevel0, Format('Dados Adicionais: %s', [DadosAdExpressao]));
    tv_modelosemitir.Items.AddChild(Alevel0, Format('Período: %s', [IfThen(DadosAdPeriodo <> '',
                                                                    Format(DadosAdPeriodo, [FormatDateTime('DD/MM/YYYY', StartOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1))),
                                                                                            FormatDateTime('DD/MM/YYYY', EndOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1)))]))]));

//    if ed_itemicms.Text <> '' then
//        ed_itemicms.Text := Format(ed_itemicms.Text, [Fnf.periodo.ffloat('icmsop')]);
//
//      if ed_itemst.Text <> '' then
//        ed_itemst.Text := Format(ed_itemst.Text, [Fnf.periodo.ffloat('icmsst')]);
//
//      if ed_itemfcp.Text <> '' then
//        ed_itemfcp.Text := Format(ed_itemfcp.Text, [Fnf.periodo.ffloat('fcpst')]);
//
//      if ed_dadosadper.Text <> '' then
//        ed_dadosadper.Text := Format(ed_dadosadper.Text,
//                                    [FormatDateTime('DD/MM/YYYY', StartOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1))),
//                                     FormatDateTime('DD/MM/YYYY', EndOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1)))]);

  end;
  if tv_modelosemitir.Items.Count > 0 then
    tv_modelosemitir.Items[0].Selected := True;
end;

procedure TfrmCadNF_icmsst_rest_compl.MaskEdit1Exit(Sender: TObject);
begin
  inherited;
  grid_tipo88.Visible := Fnf.obterPeriodos(MaskEdit1.Text).dataSet.RecordCount > 0;
end;

procedure TfrmCadNF_icmsst_rest_compl.modelo_emiss_show;
begin
  bt_go_preview.Enabled := ModeloSel.CFOP > 0;
  ModelosEmiss.Modelos(Fnf.periodo.fint('tipo'));
  make_tv_modelos;
  tv_modelosemitirClick(tv_modelosemitir);
  PageControl1.ActivePage := ts_nota;
  PageControl2.ActivePage := ts_modelosemiss;
end;

procedure TfrmCadNF_icmsst_rest_compl.new_lancC195();
begin
  IndexLancC195 := -1;

  FModelosC195.Free;
  FModelosC195 := TModelosC195.Modelos(ModeloSel.Tipo);

  make_lbx_modelosC195;
  lbxC195Click(lbxC195);

  bt_go_preview_lanc.Enabled := ModeloSel.LancC195.Count > 0;
  PageControl2.ActivePage := ts_lanc_c195;
end;

procedure TfrmCadNF_icmsst_rest_compl.new_lancC197;
begin
  FModelosC197.Free;
  FModelosC197 := TModelosC197.Modelos(ModeloSel.LancC195.Items[IndexLancC195].Tipo);

  make_lbx_modelosC197;
  lbxC197Click(lbxC195);
  make_lbx_ajustesSel;
  PageControl2.ActivePage := ts_lanc_c197;
end;

procedure TfrmCadNF_icmsst_rest_compl.bt_closeClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton12Click(Sender: TObject);
begin
  inherited;
//
//  ModelosEmiss.Items[tv_modelosemitir.Selected.Index].LancC195.Items[lbxC195.ItemIndex].LancC197.Free;
//  ModelosEmiss.Items[tv_modelosemitir.Selected.Index].LancC195.Items[lbxC195.ItemIndex].LancC197 := TModelosC197.Modelos(ModelosEmiss.Items[tv_modelosemitir.Selected.Index].LancC195.Items[lbxC195.ItemIndex].Tipo);
//
//  make_lbx_modelosC197;
//  lbxC197Click(lbxC195);
//  make_lbx_ajustesSel;
//
//  PageControl2.ActivePage := ts_lanc_c197;
//  with ModeloSel.LancC195.New do
//  begin
//    Obs := ed_codobs.Text;
//    TxtCompl := ed_txtcompl.Text;
//  end;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton14Click(Sender: TObject);
var
  Atipo: TipoRestCompl;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0214', 'PREVER', Format('%s: %s', [lbTipo.Caption, Fnf.periodo.fstr('ano') + Fnf.periodo.fstr('mes')]),
    'EFD_ICMSST_CR_APURACAO', Fnf.periodo.fstr('ano') + Fnf.periodo.fstr('mes') + '-' + Fnf.periodo.fstr('id'), Fnf.QrAux) then
    Exit;

  tv_nf.Items.Clear();
  if lbTipo.Caption = strComplemento then
    Atipo := tpComplemento
  else
    Atipo := tpRestituicao;

  Fnf.notasfiscais_gerar(ModeloSel, True);
//  begin
//    _GravaConfiguracoesInteger(lbTipo.Caption + '_CFOP', ed_cfop.AsInteger);
//    _GravaConfiguracoesString( lbTipo.Caption + '_NAT' , ed_nat_op.Text);
//  end;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton15Click(Sender: TObject);
begin
  inherited;

  if not Assigned(tv_modelosemitir.Selected) then
  begin
    ShowErro('Selecione um modelo para continuar');
    Exit;
  end;

  with ModelosEmiss.Items[tv_modelosemitir.Selected.Index] do
  begin
    ModeloSel.Tipo := Tipo;
    ModeloSel.CFOP := ed_modcfop.AsInteger;
    ModeloSel.NaturezaOp := ed_modnatop.Text;
    ModeloSel.LinhaProdICMS := ed_itemicms.Text;
    ModeloSel.LinhaProdST := ed_itemst.Text;
    ModeloSel.LinhaProdFCP := ed_itemfcp.Text;
    ModeloSel.DadosAdExpressao := ed_dadosad.Text;
    ModeloSel.DadosAdPeriodo := ed_dadosadper.Text;
    ModeloSel.EmissaoPropria := ck_emissaopropria.Checked or (ModeloSel.CFOP >= 5000);
  end;

  if ModeloSel.LancC195.Count = 0 then
    new_lancC195()
  else
  begin
    make_tv_lanc_prev;
    PageControl2.ActivePage := ts_prev;
  end;
end;

procedure TfrmCadNF_icmsst_rest_compl.bt_undo_to_apuracaoClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := ts_apuracao;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton17Click(Sender: TObject);
var
  Atipo: TipoRestCompl;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0213', 'PREVER', Format('%s: %s', [lbTipo.Caption, Fnf.periodo.fstr('ano') + Fnf.periodo.fstr('mes')]),
    'EFD_ICMSST_CR_APURACAO', Fnf.periodo.fstr('ano') + Fnf.periodo.fstr('mes') + '-' + Fnf.periodo.fstr('id'), Fnf.QrAux) then
    Exit;

  tv_nf.Items.Clear();
  if lbTipo.Caption = strComplemento then
    Atipo := tpComplemento
  else
    Atipo := tpRestituicao;

  Fnf.notasfiscais_gerar(ModeloSel);
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  ModelosEmiss.Modelos(9);
  make_tv_modelos;
end;

procedure TfrmCadNF_icmsst_rest_compl.bt_searchClick(Sender: TObject);
var
  str: string;
  ano: Integer;
begin
  inherited;

  if not InputQuery('Informe o ano', 'Ano da pesquisa', str) then
    Exit;

  if not TryStrToInt(Trim(str), ano) then
  begin
    ShowErro('Ano informado inválido');
    Exit;
  end;

  grid_apuracao.Visible := Fnf.obterPeriodos(IntToStr(ano)).dataSet.RecordCount > 0;
  group_notas.Visible := False;
  Panel11.Caption := IfThen(not grid_apuracao.Visible, 'Sem registros para o ano ' + str);
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  FModelosC195.Free;
  FModelosC195 := TModelosC195.Modelos(99);

  make_lbx_modelosC195;
  lbxC195Click(lbxC195);
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton21Click(Sender: TObject);
var
  node: TTreeNode;
begin
  inherited;
  if not Assigned(tv_prev.Selected) then
    Exit;

  if tv_prev.Items.Count = 0 then
    Exit;


  node := tv_prev.Selected;
  while node.Level > 0 do
  begin
    if not Assigned(node.Parent) then
      Exit;

    node := node.Parent;
  end;

  if (node.Level >= 0) and (node.Level < ModeloSel.LancC195.Count) then
  begin
    ModeloSel.LancC195.Items[node.Level].LancC197.Clear;
    ModeloSel.LancC195.Delete(node.Level);
    make_tv_lanc_prev;
  end;
end;

procedure TfrmCadNF_icmsst_rest_compl.bt_go_previewClick(Sender: TObject);
begin
  inherited;
  make_tv_lanc_prev;
  PageControl2.ActivePage := ts_prev;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  new_lancC195;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  FModelosC197.Free;
  FModelosC197 := TModelosC197.Modelos(99);

  make_lbx_modelosC197;
  lbxC197Click(lbxC195);
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton28Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if lbxC195.ItemIndex = -1 then
  begin
    ShowAtencao('Selecione um lançamento para continuar');
    Exit;
  end;

  if IndexLancC195 = -1 then
  begin
    for I := 0 to ModeloSel.LancC195.Count - 1 do
      if (ModeloSel.LancC195.Items[I].Obs = Trim(ed_codobs.Text) ) and
         (ModeloSel.LancC195.Items[I].TxtCompl = Trim(ed_txtcompl.Text))  then
      begin
        ShowAtencao('Já existe um lançamento com mesma Observação e TxtComplementar');
        Exit;
      end;

    ModeloSel.LancC195.New;
    IndexLancC195 := ModeloSel.LancC195.Count - 1;
    ModeloSel.LancC195.Items[IndexLancC195].Tipo := FModelosC195.Items[lbxC195.ItemIndex].Tipo;
  end;

  with ModeloSel.LancC195.Items[IndexLancC195] do
  begin
    Obs := Trim(ed_codobs.Text);
    TxtCompl := Trim(ed_txtcompl.Text);
  end;

  if ModeloSel.LancC195.Items[IndexLancC195].LancC197.Count = 0 then
    new_lancC197
  else
  begin
    make_tv_lanc_prev;
    PageControl2.ActivePage := ts_prev;
  end;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton29Click(Sender: TObject);
var
  node: TTreeNode;
begin
  inherited;
  if not Assigned(tv_prev.Selected) then
    Exit;

  if tv_prev.Items.Count = 0 then
    Exit;


  node := tv_prev.Selected;
  while node.Level > 0 do
  begin
    if not Assigned(node.Parent) then
      Exit;

    node := node.Parent;
  end;

  if (node.Level >= 0) and (node.Level < ModeloSel.LancC195.Count) then
  begin
    IndexLancC195 := node.Level;
    new_lancC197;
  end;
end;

procedure TfrmCadNF_icmsst_rest_compl.bt_notasemitidasClick(Sender: TObject);
begin
  inherited;
  with Fnf.NotasEmitidas do
  begin
    grid_notas.DataSource := _dataSourceOOP;
    group_notas.Visible := dataSet.RecordCount > 0;
  end;
  Splitter1.Top := -999;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton31Click(Sender: TObject);
begin
  inherited;
  if lbx_ajsel.ItemIndex <= -1 then
    Exit;

  if lbx_ajsel.ItemIndex > ModeloSel.LancC195.Items[IndexLancC195].LancC197.Count then
    Exit;
  ModeloSel.LancC195.Items[IndexLancC195].LancC197.Delete(lbx_ajsel.ItemIndex);
  lbx_ajsel.Items.Delete(lbx_ajsel.ItemIndex);
  
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton32Click(Sender: TObject);
var
  Txt: string;
begin
  inherited;

  if lbxC197.ItemIndex = -1 then
  begin
    ShowErro('Selecione um ajuste para continuar');
    Exit;
  end;

  Txt := Trim(ed_codaj.Text) + IfThen(Trim(ed_descaj.Text) <> '', ' - ' + Trim(ed_descaj.Text));
  if ed_ajvalor.AsValue > 0 then
    Txt := Txt + ' - ' + Format('%n', [ed_ajvalor.AsValue]);

  if lbx_ajsel.Items.IndexOf(Txt) > -1 then
  begin
    ShowAtencao('Ajuste já existe');
    Exit;
  end;     

  with ModeloSel.LancC195.Items[IndexLancC195].LancC197.New do
  begin
    cod_aj := Trim(ed_codaj.Text);
    descr_compl_aj := Trim(ed_descaj.Text);
    Valor := ed_ajvalor.AsValue;

    lbx_ajsel.Items.Add(Txt);
  end;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton34Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  modelo_emiss_show;
  
  for I := 0 to tv_modelosemitir.Items.Count - 1 do
    if tv_modelosemitir.Items[I].Level = 0 then
      if ModelosEmiss.Items[tv_modelosemitir.Items[I].Index].Tipo = ModeloSel.Tipo then
      begin
        tv_modelosemitir.Items[I].Selected := True;
        Break;
      end;    

  ed_modcfop.AsValue := ModeloSel.CFOP;
  ed_modnatop.Text := ModeloSel.NaturezaOp;
  ed_itemicms.Text := ModeloSel.LinhaProdICMS;
  ed_itemst.Text := ModeloSel.LinhaProdST;
  ed_itemfcp.Text := ModeloSel.LinhaProdFCP;
  ed_dadosad.Text := ModeloSel.DadosAdExpressao;
  ed_dadosadper.Text := ModeloSel.DadosAdPeriodo;
end;

procedure TfrmCadNF_icmsst_rest_compl.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  ModeloSel.Free;
  ModeloSel := TModeloEmissao.Create;

  modelo_emiss_show;
end;

procedure TfrmCadNF_icmsst_rest_compl.tv_modelosemitirClick(Sender: TObject);
var
  node: TTreeNode;
begin
  inherited;
  if Sender is TTreeView then
  begin
    node := TTreeView(Sender).Selected;

    if (Assigned(node)) and (node.Level = 0) and (node.Index >= 0) and (node.Index <= ModelosEmiss.Count -1) then
    begin
      ed_modcfop.AsValue := ModelosEmiss.Items[node.Index].CFOP;
      ed_modnatop.Text := ModelosEmiss.Items[node.Index].NaturezaOp;
      ed_itemicms.Text := IfThen(Fnf.periodo.ffloat('icmsop') > 0, ModelosEmiss.Items[node.Index].LinhaProdICMS);
      ed_itemst.Text := IfThen(Fnf.periodo.ffloat('icmsst') > 0, ModelosEmiss.Items[node.Index].LinhaProdST);
      ed_itemfcp.Text := IfThen(Fnf.periodo.ffloat('fcpst') > 0, ModelosEmiss.Items[node.Index].LinhaProdFCP);
      ed_dadosad.Text := ModelosEmiss.Items[node.Index].DadosAdExpressao;
      ed_dadosadper.Text := ModelosEmiss.Items[node.Index].DadosAdPeriodo;
      ck_emissaopropria.Checked := True;
      ck_emissaopropria.Enabled := not ( ModelosEmiss.Items[node.Index].CFOP >= 5000);

      if ed_itemicms.Text <> '' then
        ed_itemicms.Text := Format(ed_itemicms.Text, [Fnf.periodo.ffloat('icmsop')]);

      if ed_itemst.Text <> '' then
        ed_itemst.Text := Format(ed_itemst.Text, [Fnf.periodo.ffloat('icmsst')]);

      if ed_itemfcp.Text <> '' then
        ed_itemfcp.Text := Format(ed_itemfcp.Text, [Fnf.periodo.ffloat('fcpst')]);

      if ed_dadosadper.Text <> '' then
        ed_dadosadper.Text := Format(ed_dadosadper.Text,
                                    [FormatDateTime('DD/MM/YYYY', StartOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1))),
                                     FormatDateTime('DD/MM/YYYY', EndOfTheMonth(EncodeDate(Fnf.periodo.fint('ano'), Fnf.periodo.fint('mes'), 1)))]);
    end;
  end;
end;

end.

-- Criar campo na tabela da nota com o ID da EFD_ICMSST_CR_APURACAO quando for emitida com essa origem
-- Ao selecionar o registro EFD_ICMSST_CR_APURACAO, ja vem definido se é ST ou ICMS,e se é restituicao ou complemento (tipo)
-- Na tela para montar a nota
--    Trazer o Combobox com os cfops 1603, 1949, 5603, 6603, 5949, quando selecionar trazer as descriçções adicionais
--    Depois do cfop ou na mesma tela, trazer os lancamentos de ajustes possíveis para o usuário selecionar
-- Logo antes de criar a nota salvar o id da apuracao na tabela da nota fiscal
-- Na tela de lancamento fiscal, colocar uma forma dele configurar os dados do assistente de lançamento
