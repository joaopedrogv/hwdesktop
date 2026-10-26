unit uCadNF_Ajuste_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, ComCtrls, ExtCtrls, uEditHw, Grids, DBGrids,
  Buttons, uDataSet_OOP, DB, DBCtrls, DBClient, estoque_ajuste_class,
  faturamento_hw_class, config_sistema_class, IBQuery;

type
  RPesquisa_estini = record
    dataIni, dataFim, data_confirm: string;
  end;

  TEstoque_ini_OOP = class;
  TEstoque_ajuste  = class;

  THackWinControl = class(TWinControl);
  THack_Hw_notafiscal_class = class(THw_notafiscal_class);

  TEstoque_ajuste_item = class(TDataSet_OOP)
  private
    FOwner: TEstoque_ajuste;
    Fe_s: string;
    Ffator_med: Double;
    Fcusto_tot_aj: Double;
    Fcusto_tot: Double;
    FClient: TClientDataSet;
    FCalcChange: TNotifyEvent;
    Fnotas: THw_faturamento;
    FNotasMake: TNotifyEvent;
    FqConsulta: TIBQuery;
  public
    constructor Create(AOwner: TEstoque_ajuste; Ae_s: string);
    destructor Destroy; override;

    procedure somar;

    function Open: Boolean; override;
    function setAjuste(Afator: Double): Boolean;
    function setCustoItem(Acusto_tot_aj: Double): Boolean;
    function saveChanges: Boolean;
    function notasfiscais_visualizar(Anotas: THw_faturamento): Boolean;
    function notasfiscais_gerar(Anotas: THw_faturamento; Acfop: Integer; Acst_icms: string; Asalvar: Boolean = False): Boolean;

    property custo_tot: Double read Fcusto_tot write Fcusto_tot;
    property custo_tot_aj: Double read Fcusto_tot_aj write Fcusto_tot_aj;
    property fator_med: Double read Ffator_med write Ffator_med;
    property natureza : string read Fe_s;

    property onCalcChange: TNotifyEvent read FCalcChange write FCalcChange;
    property onNotasMake: TNotifyEvent read FNotasMake write FNotasMake;

  end;

  TEstoque_ajuste = class(TEstoque_ajuste_class)
  private
    FOwner: TEstoque_ini_OOP;
    Fitens_ent: TEstoque_ajuste_item;
    Ffator_ent: Double;
    Fitens_sai: TEstoque_ajuste_item;

  public
    constructor Create(AOwner: TEstoque_ini_OOP);
    destructor Destroy; override;
    function getAjuste(Adata_confirm: TDateTime): TEstoque_ajuste;
    function setData_apuracao(Adata: TDateTime): Boolean;

    property itens_ent: TEstoque_ajuste_item read Fitens_ent write Fitens_ent;
    property itens_sai: TEstoque_ajuste_item read Fitens_sai write Fitens_sai;
//    property acusto: RCusto_estini; read Fcusto write Fcusto;
    property fator_ent: Double read Ffator_ent write Ffator_ent;
    property estoqueIni: TEstoque_ini_OOP read FOwner write FOwner;

  end;

  TEstoque_ajuste_OOP = class(TDataSet_OOP)
  private
    FClient   : TClientDataSet;
    Fcusto_ent: Double;
    Fcusto_sai: Double;
  public
    constructor Create;
    destructor Destroy; override;

    procedure consultar;

    property custo_ent: Double read Fcusto_ent write Fcusto_ent;
    property custo_sai: Double read Fcusto_sai write Fcusto_sai;

  var
    pesquisa: RPesquisa_estini;
  end;

  TEstoque_ini_OOP = class(TDataSet_OOP)
  private
    FClient   : TClientDataSet;
    Fcusto_ent: Double;
    Fcusto_sai: Double;
  public
    constructor Create;
    destructor Destroy; override;

    procedure consultar;

    property custo_ent: Double read Fcusto_ent write Fcusto_ent;
    property custo_sai: Double read Fcusto_sai write Fcusto_sai;

  var
    pesquisa: RPesquisa_estini;
  end;

  TfrmCadNF_Ajuste_Estoque = class(TfrmPadrao)
    pn_principal: TPanel;
    pg_ajuste: TPageControl;
    ts_balanco: TTabSheet;
    ts_hist: TTabSheet;
    pn_balanco: TPanel;
    pn_balanco_pesquisa: TPanel;
    ed_data_ini: TMaskEdit;
    ed_data_fim: TMaskEdit;
    ed_bal_dtini: TLabel;
    ed_bal_dtfim: TLabel;
    bt_balanco_visualizar: TBitBtn;
    group_intes_pendentes: TGroupBox;
    pn_balanco_itens: TPanel;
    grid_balanco: TDBGrid;
    pn_balanco_bottom: TPanel;
    lb_title_custo_pos: TLabel;
    lb_custo_pos: TLabel;
    lb_title_custo_neg: TLabel;
    lb_custo_neg: TLabel;
    lbBalanco: TLabel;
    lkBalanco: TDBLookupComboBox;
    ts_ajuste: TTabSheet;
    pn_ajuste: TPanel;
    pn_ajuste_bottom: TPanel;
    bt_voltar: TBitBtn;
    pn_notas_group: TPanel;
    group_ajuste_entrada: TGroupBox;
    Splitter1: TSplitter;
    group_ajuste_saida: TGroupBox;
    group_ajuste_top: TGroupBox;
    lb_ajuste_dtbalanco: TLabel;
    lb_ajuste_dtapuracao: TLabel;
    ed_ajuste_data_confirm: TMaskEdit;
    ed_ajuste_data_apuracao: TMaskEdit;
    bt_ajuste_data_apuracao_save: TBitBtn;
    pn_ajuste_itens_entrada_top: TPanel;
    pn_ajuste_itens_entrada_bottom: TPanel;
    grid_ajuste_itens_entrada: TDBGrid;
    lb_ajuste_itens_entrada_fator: TLabel;
    ed_ajuste_itens_entrada_fator: TEditHw;
    bt_ajuste_itens_entrada_fator_save: TBitBtn;
    lb_ajuste_itens_entrada_custo: TLabel;
    lb_ajuste_itens_entrada_custo_val: TLabel;
    lb_ajuste_itens_entrada_total: TLabel;
    lb_ajuste_itens_entrada_ajuste_val: TLabel;
    lb_ajuste_itens_entrada_custo_fator_val: TLabel;
    ts_modais: TTabSheet;
    pn_alterar_custo: TPanel;
    ed_alterar_custo_tot_aj: TEditHw;
    lb_alterar_custo_tot_aj: TLabel;
    lb_alterar_custo_qtde: TLabel;
    dbt_alterar_custo_qtde: TDBText;
    ed_alterar_custo_fator: TEditHw;
    lb_alterar_custo_tot: TLabel;
    bt_alterar_custo_ok: TBitBtn;
    bt_alterar_custo_cancel: TBitBtn;
    bt_ajuste_itens_entrada_save: TBitBtn;
    dbt_alterar_custo_un: TDBText;
    lb_alterar_custo_un: TLabel;
    lb_alterar_custo_tot_val: TLabel;
    lb_alterar_custo_fator: TLabel;
    pn_ajuste_itens_saida_top: TPanel;
    lb_ajuste_itens_saida_fator: TLabel;
    ed_ajuste_itens_saida_fator: TEditHw;
    bt_ajuste_itens_saida_fator_save: TBitBtn;
    grid_ajuste_itens_saida: TDBGrid;
    pn_ajuste_itens_saida_bottom: TPanel;
    lb_ajuste_itens_saida_custo: TLabel;
    lb_ajuste_itens_saida_custo_val: TLabel;
    lb_ajuste_itens_saida_total: TLabel;
    lb_ajuste_itens_saida_ajuste_val: TLabel;
    lb_ajuste_itens_saida_custo_fator_val: TLabel;
    bt_ajuste_itens_saida_save: TBitBtn;
    bt_ajuste_manter: TBitBtn;
    pn_hist: TPanel;
    pn_hit_top: TPanel;
    lb_hist_dtini: TLabel;
    lb_hist_dtfim: TLabel;
    ed_hist_dtini: TMaskEdit;
    ed_hist_dtfim: TMaskEdit;
    bt_hist_visualizar: TBitBtn;
    group_hist: TGroupBox;
    pn_hist_grid: TPanel;
    grid_hist: TDBGrid;
    pn_hit_bottom: TPanel;
    lb_ajuste_itens_entrada_custo_fator: TLabel;
    lb_ajuste_itens_saida_custo_fator: TLabel;
    bt_ajuste_itens_entrada_notas: TBitBtn;
    bt_ajuste_itens_saida_notas: TBitBtn;
    ts_nf: TTabSheet;
    pn_nf: TPanel;
    pn_nf_bottom: TPanel;
    tv_nf: TTreeView;
    bt_nf_voltar: TBitBtn;
    pn_nf_top: TPanel;
    lb_cfop: TLabel;
    ed_cfop: TEditHw;
    lb_cst_icms: TLabel;
    ed_cst_icms: TEditHw;
    bt_nf_atualizar: TBitBtn;
    lb_information: TLabel;
    bt_nf_criar: TBitBtn;
    bt_hist_manter: TBitBtn;
    lb_information_entrada: TLabel;
    procedure ed_cst_icmsExit(Sender: TObject);
    procedure ed_cfopExit(Sender: TObject);
    procedure bt_ajuste_itens_entrada_notasClick(Sender: TObject);
    procedure ts_balancoEnter(Sender: TObject);
    procedure ts_histEnter(Sender: TObject);
    procedure bt_nf_voltarClick(Sender: TObject);
    procedure bt_nf_criarClick(Sender: TObject);
    procedure bt_nf_atualizarClick(Sender: TObject);
    procedure pn_nfEnter(Sender: TObject);
    procedure bt_ajuste_itens_saida_notasClick(Sender: TObject);
    procedure bt_voltarClick(Sender: TObject);
    procedure bt_hist_manterClick(Sender: TObject);
    procedure bt_hist_visualizarClick(Sender: TObject);
    procedure bt_ajuste_itens_saida_saveClick(Sender: TObject);
    procedure grid_ajuste_itens_saidaDblClick(Sender: TObject);
    procedure bt_ajuste_itens_saida_fator_saveClick(Sender: TObject);
    procedure pn_notas_groupResize(Sender: TObject);
    procedure bt_ajuste_itens_entrada_saveClick(Sender: TObject);
    procedure ed_alterar_custo_fatorExit(Sender: TObject);
    procedure ed_alterar_custo_tot_ajExit(Sender: TObject);
    procedure grid_ajuste_itens_entradaDblClick(Sender: TObject);
    procedure bt_ajuste_itens_entrada_fator_saveClick(Sender: TObject);
    procedure bt_ajuste_data_apuracao_saveClick(Sender: TObject);
    procedure bt_ajuste_manterClick(Sender: TObject);
    procedure ed_data_iniExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_balanco_visualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    Fbalanco: TEstoque_ini_OOP;
    FlkBalanco: TDadosLookUp_OOP;
    Fajuste: TEstoque_ajuste;
    Fhit_aj: TEstoque_ajuste_OOP;
    Ffatu: THw_faturamento;
    Fajuste_it: TEstoque_ajuste_item;
    Fconf: TConfig_sistema_class;

    procedure estoque_ajuste_itens_entrada_change(Sender: TObject);
    procedure estoque_ajuste_itens_saida_change(Sender: TObject);
    procedure estoque_ajuste_itens_notas_make(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    property balanco: TEstoque_ini_OOP read Fbalanco write Fbalanco;
    property ajuste: TEstoque_ajuste read Fajuste write Fajuste;
    property fatu: THw_faturamento read Ffatu write Ffatu;
  end;

var
  frmCadNF_Ajuste_Estoque: TfrmCadNF_Ajuste_Estoque;

implementation

uses
  udtmAtivo, DateUtils, StrUtils, Math, IBCustomDataSet, uDadosIni,
  hw_erro_class, Contnrs, produtos_tmp_class, notafiscal_class,
  estoque_ajuste_itens_class;

{$R *.dfm}

procedure ajuste_estoque_show(Amodal: Boolean);
begin
  Screen.Cursor := crHourGlass;
  try
    if Amodal and Assigned(frmCadNF_Ajuste_Estoque) then
      if frmCadNF_Ajuste_Estoque.FormStyle = fsMDIChild then
      begin
        FreeAndNil(frmCadNF_Ajuste_Estoque);
      end;

    vDadosIni.vModalOuChild :=  IfThen(Amodal, 'M', 'C');

    if not Assigned(frmCadNF_Ajuste_Estoque) then
      Application.CreateForm(TfrmCadNF_Ajuste_Estoque, frmCadNF_Ajuste_Estoque);

    if Amodal then
      frmCadNF_Ajuste_Estoque.ShowModal
    else
      frmCadNF_Ajuste_Estoque.Show;

  finally
    Screen.Cursor := crDefault;
  end;
end;

exports
  ajuste_estoque_show;


{ TEstoque_ajuste_item }

constructor TEstoque_ajuste_item.Create(AOwner: TEstoque_ajuste;
  Ae_s: string);
begin
  inherited Create;
  FClient:= TClientDataSet.Create(Application);
  dataSet := FClient;
  CreateDbComponents(dtmAtivo.bancoHw);
  FqConsulta := Create_new_fb_query(buscas.Transaction);
  FOwner := AOwner;
  Fe_s := Ae_s;
end;

destructor TEstoque_ajuste_item.Destroy;
begin
  FreeDbComponents;
  FreeAndNil(FClient);
  FreeAndNil(FqConsulta);
  inherited;
end;

function TEstoque_ajuste_item.notasfiscais_gerar(
  Anotas: THw_faturamento; Acfop: Integer; Acst_icms: string; Asalvar: Boolean): Boolean;
var
  Aitens_ajuste: TEstoque_ajuste_itens_classList;
  Aid_tmp: string;
  Acod_cliente: Integer;
  Anota: THw_notafiscal_class;
  Aquant, Aloop: Integer;
  I, J: Integer;
  AsaveComErros: Boolean;
begin
  Result := False;

  Fnotas := Anotas;
  Fnotas.notas.Clear;
  Fnotas.erros.Clear;

  Aid_tmp := Format('%s-%d', [Fe_s, FOwner.id_ajuste]);

  Aitens_ajuste := TEstoque_ajuste_itens_classList.Create;
  try
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

    Aquant := 990;
    Aloop := 0;

    while not
      SqlOpen('select first %d skip %d %s from estoque_ajuste_itens' +
              ' where id_ajuste = %d and cod_empresa = %d and quantidade %s 0 and cod_nf is null' +
              ' order by id_it',
              [Aquant, Trunc(Aquant * Aloop),
               TEstoque_ajuste_itens_class.GetFieldsSql(), FOwner.id_ajuste, FOwner.cod_empresa, IfThen(Fe_s = 'E', '>', '<')]).IsEmpty do
    begin
      Aloop := Aloop + 1;
      Aitens_ajuste.Clear;
      Aitens_ajuste.SetValuesFrom(buscas, True);
      SqlExec('ALTER SEQUENCE SEQ_PRODUTOS_TMP RESTART WITH 0');

      Anota := Fnotas.notas.New;
      with Anota do
      begin
        THack_Hw_notafiscal_class(Anota).build_nf_campos;
        id_ajuste       := FOwner.id_ajuste;
        natureza_nf     := Fe_s;
        codigo_nop      := Acfop;
        cod_cliente     := Acod_cliente;
        num_gerado      := 'S';
        emissao_propria := 'S';
        data_contabil   := FOwner.data_confirm;
      end;

      Anota.ajuste_estoque_montar(Aid_tmp, Acst_icms, Aitens_ajuste);

      if not Asalvar then
        if Assigned(FNotasMake) then
          FNotasMake(Anota);
    end;

    if Asalvar then
    begin
      if Fnotas.erros.Count > 0 then
        if vDadosIni.ShowConfirmacao('Existem erros que podem impedir a autorização das notas fiscais. Deseja continuar mesmo assim?') <> IDYES then
          Exit;

      for I := 0 to Pred(Fnotas.notas.Count) do with Fnotas.notas.Items[I] do
      begin
        salvar(False);
        try
          for J := 0 to Pred(itens.Count) do
            Fnotas.SqlExec('update ESTOQUE_AJUSTE_ITENS set cod_nf = %d, nitem = %d' +
                           ' where id_ajuste = %d and id_it = %s and cod_empresa = %d and ' +
                           ' cod_nf is null and nitem is null',
                           [cod_nf, itens.Items[J].nitem, FOwner.id_ajuste, itens.Items[J].id_origem, FOwner.cod_empresa]);
          if Fnotas.SqlOpen('select count(id_ajuste) contador from ESTOQUE_AJUSTE_ITENS' +
                            ' where id_ajuste = %d and cod_nf = %d and cod_empresa = %d',
                            [FOwner.id_ajuste, cod_nf, cod_empresa]).FieldByName('contador').AsInteger <> itens.Count then
            erros.New('Itens do ajuste não foram vinculados a nota fiscal por completo').
              detalhe := 'Repita o processo novamente. Se persistir o problema contacte o suporte técnico'
          else
          begin
            Fnotas.Transacao.Commit;

            vDadosIni.GravaAuditoria('NF0211', 'SALVAR', Format('SUCESSO - BALANCO %s: %s NF:%d COD:%d',
             [Fe_s, DateToStr(FOwner.data_confirm), num_nf, cod_nf]), 'ESTOQUE_AJUSTE', DateToStr(FOwner.data_confirm), buscas);
          end;
        finally
          if Fnotas.Transacao.InTransaction then
            Fnotas.Transacao.Rollback;
        end;

        if Assigned(FNotasMake) then
          FNotasMake(Fnotas.notas.Items[I]);
      end;
    end;

    if Fnotas.erros.Count > 0 then
      vDadosIni.ShowAtencao('Processo concluído com erros', [MB_ICONEXCLAMATION])
    else
      vDadosIni.ShowAtencao('Processo concluído');

    Result := True;

    if not Asalvar then
      vDadosIni.GravaAuditoria('NF0210', 'PREVER', Format('BALANCO %s: %s Total de notas: %d',
        [Fe_s, DateToStr(FOwner.data_confirm), Fnotas.notas.Count]), 'ESTOQUE_AJUSTE', DateToStr(FOwner.data_confirm), buscas);

    if Asalvar then
      if SqlOpen('select count(id_ajuste) contador from estoque_ajuste_itens' +
                 ' where id_ajuste = %d and cod_empresa = %d' +
                 ' and cod_nf is null', [FOwner.id_ajuste, FOwner.cod_empresa],
                  FqConsulta).FieldByName('contador').AsInteger = 0 then
      begin
        try
          if SqlExec('update estoque_ajuste set status = %s ' +
                     ' where id_ajuste = %d and cod_empresa = %d and status <> %s',
                     [QuotedStr('Concluido'), FOwner.id_ajuste, FOwner.cod_empresa, QuotedStr('Concluido')], buscas).Transaction.InTransaction then
            buscas.Transaction.Commit;
        except on E: Exception do
          begin
            buscas.Transaction.Rollback;
            registraErro('TEstoque_ajuste_item.notasfiscais_gerar. Erro ao alterar status ' + e.Message);
          end;
        end;
      end;

  finally
    FreeAndNil(Aitens_ajuste);
  end;
end;

function TEstoque_ajuste_item.notasfiscais_visualizar(
  Anotas: THw_faturamento): Boolean;
var
  Atmpprods: THw_produtos_tmp_classList;
  Anota: THw_notafiscal_class;
begin
  Fnotas := Anotas;
  Fnotas.notas.Clear;

  SqlOpen('select distinct ei.cod_nf from estoque_ajuste_itens ei' +
          ' where ei.id_ajuste = %d and ei.cod_empresa = %d and ei.quantidade %s 0' +
          ' and ei.cod_nf is not null' +
          ' order by ei.cod_nf',
          [FOwner.id_ajuste, FOwner.cod_empresa, IfThen(Fe_s = 'E', '>', '<')]).First;
  while not buscas.Eof do
  begin
    Anota := Fnotas.notas.New;
    with Anota do
    begin
      SetValuesFrom(Fnotas.SqlOpen('select %s from notafiscal where cod_nf = %d and cod_empresa = %s',
                                   [THw_notafiscal_class.GetFieldsSql(),
                                    buscas.FieldByName('cod_nf').AsInteger,
                                    vDadosIni.codEmpresa]));

      Fnotas.SqlOpen('select %s from notafiscal_item where cod_nf = %d and cod_empresa = %s order by nitem',
                     [THw_notafiscal_item_class.GetFieldsSql(), cod_nf, vDadosIni.codEmpresa], Fnotas.buscas).First;
      while not Fnotas.buscas.Eof do
      begin
        itens.New.SetValuesFrom(Fnotas.buscas);
        Fnotas.buscas.Next;
      end;
    end;

    if Assigned(FNotasMake) then
      FNotasMake(Anota);

    buscas.Next;
  end;

  Atmpprods := THw_produtos_tmp_classList.Create;
  try
    SqlOpen('select ei.grupo_prod, ei.cod_prod, ei.quantidade, ei.custo_un, ei.custo_tot_aj, ei.fator, pr.num_fab_prod, pr.descr_prod,' +
            ' ei.id_it, ei.cod_nf, ei.nitem, ei.id_ajuste, ei.cod_empresa, 0 mod' +
            ' from estoque_ajuste_itens ei' +
            ' inner join produtos pr on pr.grupo_prod = ei.grupo_prod and pr.cod_prod = ei.cod_prod and pr.cod_empresa = ei.cod_empresa' +
            ' where ei.id_ajuste = %d and ei.cod_empresa = %d and ei.quantidade %s 0 and ei.cod_nf is null' +
            ' order by ei.id_it',
            [FOwner.id_ajuste, FOwner.cod_empresa, IfThen(Fe_s = 'E', '>', '<')]).First;

    while not buscas.Eof do
    begin

      with Atmpprods.New do
      begin
        id_tmp := Format('Qtde: %6.4f Valor: %6.2f - %s', [buscas.FieldByName('quantidade').AsFloat,
                                                           buscas.FieldByName('custo_tot_aj').AsFloat,
                                                           Trim(buscas.FieldByName('descr_prod').AsString)]);
        cod_prod := Format('Codigo: %d-%s Num Fab: %s', [buscas.FieldByName('grupo_prod').AsInteger,
                                                         Trim(buscas.FieldByName('cod_prod').AsString),
                                                         Trim(buscas.FieldByName('num_fab_prod').AsString)]);
      end;
      buscas.Next;
    end;

    if Assigned(FNotasMake) then
      FNotasMake(Atmpprods);
  finally
    FreeAndNil(Atmpprods);
  end;
end;

function TEstoque_ajuste_item.Open: Boolean;
begin
  Result := montaSelect('select ei.grupo_prod, ei.cod_prod, ei.quantidade, ei.custo_un, ei.custo_tot_aj, ei.fator, pr.num_fab_prod, pr.descr_prod,' +
                        ' ei.id_it, ei.cod_nf, ei.nitem, ei.id_ajuste, ei.cod_empresa, 0 mod' +
                        ' from estoque_ajuste_itens ei' +
                        ' inner join produtos pr on pr.grupo_prod = ei.grupo_prod and pr.cod_prod = ei.cod_prod and pr.cod_empresa = ei.cod_empresa' +
                        ' where ei.id_ajuste = %d and ei.cod_empresa = %d and ei.quantidade %s 0' +
                        ' order by ei.id_it',
                        [FOwner.id_ajuste, FOwner.cod_empresa, IfThen(Fe_s = 'E', '>', '<')]);
  TFloatField(dataSet.FieldByName('quantidade')).DisplayFormat   := '#,##0.0000';
  TFloatField(dataSet.FieldByName('custo_un')).DisplayFormat     := '#,##0.0000';
  TFloatField(dataSet.FieldByName('custo_tot_aj')).DisplayFormat := '#,##0.00';
  TFloatField(dataSet.FieldByName('fator')).DisplayFormat        := '#,##0.000000';
end;

function TEstoque_ajuste_item.saveChanges: Boolean;
var
  AlistAudit: TStrings;
  I: Integer;
begin
  Result := False;
  AlistAudit := vDadosIni.NewStringList();
  try
    try
      buscas.Close;
      buscas.SQL.Text := Format('update estoque_ajuste_itens set' +
                                ' custo_tot_aj = :custo_tot_aj, fator = :fator' +
                                ' where id_ajuste = %d and cod_empresa = %d and id_it = :id_it' +
                                ' and cod_nf is null',
                                [FOwner.id_ajuste, FOwner.cod_empresa]);

      prepare_loop('mod = 1');
      try
        while not dataSet.Eof do
        begin
          if SqlOpen('select id_ajuste from estoque_ajuste_itens' +
                     ' where id_ajuste = %d and cod_empresa = %d and id_it = %d' +
                     ' and cod_nf is null',
                     [FOwner.id_ajuste, FOwner.cod_empresa, f_int('id_it')],
                      FqConsulta).FieldByName('id_ajuste').AsInteger = FOwner.id_ajuste then
          begin
            buscas.ParamByName('custo_tot_aj').AsFloat := f_float('custo_tot_aj');
            buscas.ParamByName('fator').AsFloat        := f_float('fator');
            buscas.ParamByName('id_it').AsInteger      := f_int('id_it');
            if not buscas.Prepared then
              buscas.Prepare;

            buscas.ExecSQL;

            AlistAudit.Add(Format('SUCESSO - BALANCO %s: %s PROD %d-%s TOT %0.2f',
                                  [Fe_s, DateToStr(FOwner.data_confirm), f_int('GRUPO_PROD'), f_str('COD_PROD'), f_float('CUSTO_TOT_AJ')]));
          end;

          dataSet.Next;
        end;
      finally
        prepare_loop_done;
      end;

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

      Open;

      somar;

      Result := True;

      for I := 0 to Pred(AlistAudit.Count) do
       vDadosIni.GravaAuditoria('NF0208', 'ALTERAR', AlistAudit[I], 'ESTOQUE_AJUSTE_ITENS', DateToStr(FOwner.data_confirm), buscas);

    except on E: Exception do
      begin
        if buscas.Transaction.InTransaction then
          buscas.Transaction.Rollback;
          
        registraErro('TEstoque_ajuste_item.saveChanges ' + e.Message);
        vDadosIni.ShowErro('Erro ao salvar alterações %s Item %d - %s - %s %s %s',
                         [Fe_s + sLineBreak, f_int('id_it'), f_str('num_fab_prod'), f_str('descr_prod'), sLineBreak, e.Message]);
      end;
    end;
  finally
    if Assigned(AlistAudit) then FreeAndNil(AlistAudit);    
  end;
end;

function TEstoque_ajuste_item.setAjuste(Afator: Double): Boolean;
var
  Amsg: string;
begin
  Result := False;
  try
    if FOwner.id_ajuste <= 0 then
      raise Exception.Create('Não encontrado ajuste para alterações. Por favor selecione um balanço para prosseguir');

    Afator := RoundTo(Afator, -6);


    with SqlExec('update estoque_ajuste_itens set fator = %s,' +
                 ' custo_tot_aj = round( %s * (abs(quantidade) * custo_un), 2)' +
                 ' where id_ajuste = %d and cod_empresa = %d and quantidade %s 0' +
                 ' and cod_nf is null',
                 [StringReplace(Format('%0.6f', [Afator]), ',', '.', []),
                  StringReplace(Format('%0.6f', [Afator]), ',', '.', []),
                  FOwner.id_ajuste, FOwner.cod_empresa,
                  IfThen(Fe_s = 'E', '>', '<')]) do
      if Transaction.InTransaction then
        Transaction.Commit;

    Open;

    somar;

    Result := True;

    Amsg := Format('SUCESSO - BALANCO %s: %s FATOR %0.6f', [Fe_s, DateToStr(FOwner.data_confirm), fator_med]);
    vDadosIni.GravaAuditoria('NF0208', 'ALTERAR', Amsg, 'ESTOQUE_AJUSTE_ITENS', DateToStr(FOwner.data_confirm), buscas);

  except on E: Exception do
    begin
      registraErro('TEstoque_ajuste_item.setAjuste ' + e.Message);
      vDadosIni.ShowErro('Erro ao alterar fator de ajuste %s: %s', [Fe_s, e.Message]);
    end;
  end;
end;

function TEstoque_ajuste_item.setCustoItem(Acusto_tot_aj: Double): Boolean;
begin
  Result := False;
  try
    if Acusto_tot_aj <= 0 then
      raise Exception.Create('Valor do custo inválido');

    dataSet.Edit;
    dataSet.FieldByName('custo_tot_aj').AsFloat := Acusto_tot_aj;
    dataSet.FieldByName('fator').AsFloat        := Abs(Acusto_tot_aj / (f_float('quantidade') * f_float('custo_un')));
    dataSet.FieldByName('mod').AsInteger        := 1;
    dataSet.Post;

    somar;

    Result := True;

  except on E: Exception do
    begin
      registraErro('TEstoque_ajuste_item.setCustoItem ' + e.Message);
      vDadosIni.ShowErro('Erro ao alterar o custo do item %s Item %d - %s - %s %s %s',
                         [Fe_s + sLineBreak, f_int('id_it'), f_str('num_fab_prod'), f_str('descr_prod'), sLineBreak, e.Message]);
    end;
  end;
end;

procedure TEstoque_ajuste_item.somar;
begin
  Fcusto_tot    := 0;
  Fcusto_tot_aj := 0;
  Ffator_med    := 0;
  try
    prepare_loop();
    while not dataSet.Eof do
    begin

      Fcusto_tot    := Fcusto_tot    + Abs(RoundTo(f_float('quantidade') * f_float('custo_un') , -2));
      Fcusto_tot_aj := Fcusto_tot_aj + f_float('custo_tot_aj');

      dataSet.Next;
    end;
    Ffator_med := RoundTo(Fcusto_tot_aj / Fcusto_tot, -6);
    if Assigned(FCalcChange) then
      FCalcChange(Self);
  finally
    prepare_loop_done;
  end;
end;

{ TEstoque_ajuste }

constructor TEstoque_ajuste.Create(AOwner: TEstoque_ini_OOP);
begin
  inherited Create;
  FOwner := AOwner;

  Fitens_ent := TEstoque_ajuste_item.Create(Self, 'E');
  Fitens_sai := TEstoque_ajuste_item.Create(Self, 'S');
end;

destructor TEstoque_ajuste.Destroy;
begin       
  FreeAndNil(Fitens_ent);
  FreeAndNil(Fitens_sai);  
  inherited;
end;

function TEstoque_ajuste.getAjuste(Adata_confirm: TDateTime): TEstoque_ajuste;
var
  Asql: string;
begin
  Result := Self;

  Asql := Format('select %s from estoque_ajuste where data_confirm = %s and cod_empresa = %s',
                 [TEstoque_ajuste_class.GetFieldsSql(),
                  QuotedStr(FormatDateTime('YYYY-MM-DD', Adata_confirm)), vDadosIni.codEmpresa]);
  if FOwner.SqlOpen(Asql).IsEmpty then
  begin

    if FOwner.SqlOpen('select count(*) contador from estoque_ini where data_confirm = %s and cod_empresa = %s and qtd_dif_bal <> 0',
                      [QuotedStr(FormatDateTime('YYYY-MM-DD', Adata_confirm)),
                       vDadosIni.codEmpresa]).FieldByName('contador').AsInteger = 0 then
    begin
      vDadosIni.ShowErro('Data não possui balanço ou balanço não tem registros com diferença de contagem');
      Exit;
    end;

    cod_empresa   := StrToInt(vDadosIni.codEmpresa);
    id_ajuste     := FOwner.SqlOpen(sql_gencod, [cod_empresa, QuotedStr('ESTOQUE_AJUSTE')]).FieldByName('cod').AsInteger;
    data_confirm  := Adata_confirm;
    data_apuracao := DateOf(EndOfTheMonth(data_confirm));
    status        := 'Aberto';
//    fator_pos     := 1;
//    fator_neg     := 1;

    FOwner.buscas.Close;
    FOwner.buscas.SQL.Text := Format('insert into estoque_ajuste(%s) values (%s)',
                                     [TEstoque_ajuste.GetFieldsSql(),
                                      StringReplace(TEstoque_ajuste.GetFieldsSql(':'), ':.', ':', [rfReplaceAll])]);
    Self.SetValuesInParams(FOwner.buscas, True).ExecSQL;

    FOwner.SqlExec('ALTER SEQUENCE SEQ_PRODUTOS_TMP RESTART WITH 0');

    FOwner.SqlExec('insert into estoque_ajuste_itens (id_ajuste, cod_empresa, id_it, grupo_prod, cod_prod, quantidade, custo_un, custo_tot_aj, fator)' +
                   ' select %d, %d, (gen_id(SEQ_PRODUTOS_TMP, 1)), ei.grupo_prod, ei.cod_prod, ei.qtd_dif_bal, ei.pcust_mc, round((abs(ei.qtd_dif_bal) * ei.pcust_mc), 2), 1' +
                   ' from estoque_ini ei' +
                   ' inner join produtos pr on pr.grupo_prod = ei.grupo_prod and pr.cod_prod = ei.cod_prod and pr.cod_empresa = ei.cod_empresa' +
                   ' where ei.data_confirm = %s and ei.cod_empresa = %d and ei.qtd_dif_bal <> 0',
                   [id_ajuste, cod_empresa, QuotedStr(FormatDateTime('YYYY-MM-DD', data_confirm)), cod_empresa]);
    if FOwner.buscas.Transaction.InTransaction then
      FOwner.buscas.Transaction.Commit;
  end
  else
    SetValuesFrom(FOwner.buscas);

  Fitens_ent.Open;
  Fitens_ent.somar;
  
  Fitens_sai.Open;
  Fitens_sai.somar;
end;

function TEstoque_ajuste.setData_apuracao(Adata: TDateTime): Boolean;
var
  Amsg: string;
begin
  Result := False;
  try
    if id_ajuste <= 0 then
      raise Exception.Create('Não encontrado ajuste para alterações. Por favor selecione um balanço para prosseguir');

    if (MonthOf(Adata) <> MonthOf(data_confirm)) or
      (YearOf(Adata) <> YearOf(data_confirm)) then
      if vDadosIni.ShowConfirmacao('Data informada fora do mês da confirmação do balanço. Deseja continuar mesmo assim?',
        MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> ID_YES then
        Exit;

    if FOwner.SqlExec('update estoque_ajuste set data_apuracao = %s' +
                      ' where id_ajuste = %d and cod_empresa = %d',
                      [QuotedStr(FormatDateTime('YYYY-MM-DD', Adata)),
                       id_ajuste, cod_empresa]).Transaction.InTransaction then
      FOwner.transacao.Commit;

    data_apuracao := Adata;

    Result := True;

    vDadosIni.GravaAuditoria('NF0207', 'SALVAR', 'SUCESSO - BALANCO: ' + DateToStr(data_confirm) +
      ' DT APUR: ' + DateToStr(data_apuracao), 'ESTOQUE_AJUSTE', DateToStr(data_confirm), FOwner.buscas);

    vDadosIni.ShowAtencao('Data salva com sucesso');

  except on E: Exception do
    begin
      FOwner.registraErro('TEstoque_ajuste.setDatas ' + e.Message);
      vDadosIni.ShowErro('Erro ao alterar data de apuração: %s', [e.Message]);
    end;
  end;
end;

{ TEstoque_ajuste_OOP }

procedure TEstoque_ajuste_OOP.consultar;
begin
  montaSelect('select ea.id_ajuste, ea.data_confirm, ea.data_apuracao, ea.status' +
              ' from estoque_ajuste ea' +
              ' where ea.data_confirm >= %s and ea.data_confirm <= %s and ea.cod_empresa = %s' +
              ' order by ea.data_confirm',
              [QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(pesquisa.dataIni))),
               QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(pesquisa.dataFim))),
               vDadosIni.codEmpresa]);
end;

constructor TEstoque_ajuste_OOP.Create;
begin
  inherited Create;
  FClient := TClientDataSet.Create(Application);
  dataSet := FClient;
  CreateDbComponents(dtmAtivo.bancoHw);
end;

destructor TEstoque_ajuste_OOP.Destroy;
begin
  inherited;
  FreeDbComponents;
  FreeAndNil(FClient);
end;

{ TEstoque_ini_OOP }

procedure TEstoque_ini_OOP.consultar;
begin
  try
    montaSelect('select ei.grupo_prod, ei.cod_prod, ei.num_fab_prod, pr.descr_prod descricao,' +
                ' ei.locacao_prod locacao_1, ei.locacao_prod_1 locacao_2, ei.tip_bal tipo, ei.qtd_dif_bal qtde,' +
                ' ei.pcust_mc custo_un, ei.data_confirm data, ei.cod_empresa' +
                ' from estoque_ini ei' +
                ' inner join produtos pr on pr.grupo_prod = ei.grupo_prod and pr.cod_prod = ei.cod_prod and pr.cod_empresa = ei.cod_empresa' +
                ' where ei.data_confirm = %s and ei.cod_empresa = %s and ei.qtd_dif_bal <> 0' +
                ' order by ei.data_confirm, pr.descr_prod',
                [QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(pesquisa.data_confirm))),
                 vDadosIni.codEmpresa]);

    Fcusto_ent := 0;
    Fcusto_sai := 0;

    prepare_loop();
    dataSet.First;
    while not dataSet.Eof do
    begin
      if f_float('qtde') > 0 then
        Fcusto_ent        := Fcusto_ent        +     RoundTo(          f_float('qtde') * f_float('custo_un') , -2)
      else
        Fcusto_sai        := Fcusto_sai        + Abs(RoundTo(          f_float('qtde') * f_float('custo_un') , -2));
      dataSet.Next;
    end;

    dataSet.First;
  finally
    prepare_loop_done;
  end;
end;

constructor TEstoque_ini_OOP.Create;
begin
  inherited Create;
  FClient := TClientDataSet.Create(Application);
  dataSet := FClient;
  CreateDbComponents(dtmAtivo.bancoHw);
end;

destructor TEstoque_ini_OOP.Destroy;
begin
  inherited;
  FreeDbComponents;
  FreeAndNil(FClient);
end;

{ TfrmCadNF_Ajuste_Estoque }

procedure TfrmCadNF_Ajuste_Estoque.bt_hist_manterClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0206', 'MANTER', 'BALANCO: ' + Fhit_aj.f_str('data_confirm'),
    'ESTOQUE_INI', Fhit_aj.f_str('data_confirm'), Fhit_aj.buscas) then
    Exit;

  if Fhit_aj.dataSet.IsEmpty then
  begin
    vDadosIni.ShowAtencao('Nenhum ajuste selecionado');
    Exit;
  end;

  Fajuste.getAjuste(Fhit_aj.f_date('data_confirm'));

  ed_ajuste_data_confirm.Text  := DateToStr(Fhit_aj.f_date('data_confirm'));
  ed_ajuste_data_apuracao.Text := DateToStr(Fhit_aj.f_date('data_apuracao'));
  bt_voltar.Tag                := 0;
  pg_ajuste.ActivePage         := ts_ajuste;
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_ajuste_itens_entrada_notasClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0209', 'MANTER', Format('BALANCO %s: %s', ['E', DateToStr(Fajuste.data_confirm)]),
    'ESTOQUE_AJUSTE', DateToStr(Fajuste.data_confirm), Fbalanco.buscas) then
    Exit;

  tv_nf.Items.Clear;

  Fajuste_it := Fajuste.itens_ent;
  lb_information_entrada.Visible := Fajuste_it.natureza = 'E';
  Fajuste_it.notasfiscais_visualizar(Ffatu);

  vDadosIni.abreForm('Manutenção de notas fiscais de ajuste de estoque', pn_nf, opFormsDefCad);
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_ajuste_itens_saida_notasClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0209', 'MANTER', Format('BALANCO %s: %s', ['S', DateToStr(Fajuste.data_confirm)]),
    'ESTOQUE_AJUSTE', DateToStr(Fajuste.data_confirm), Fbalanco.buscas) then
    Exit;

  tv_nf.Items.Clear;

  Fajuste_it := Fajuste.itens_sai;
  lb_information_entrada.Visible := Fajuste_it.natureza = 'E';
  Fajuste_it.notasfiscais_visualizar(Ffatu);

  vDadosIni.abreForm('Manutenção de notas fiscais de ajuste de estoque', pn_nf, opFormsDefCad);
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_nf_criarClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0211', 'CRIAR', Format('BALANCO %s: %s', [Fajuste_it.natureza, DateToStr(Fajuste.data_confirm)]),
    'ESTOQUE_AJUSTE', DateToStr(Fajuste.data_confirm), Fajuste_it.buscas) then
    Exit;

  tv_nf.Items.Clear;

  Fajuste_it.notasfiscais_gerar(Ffatu, ed_cfop.AsInteger, vDadosIni.StrZero(ed_cst_icms.AsInteger, 2), True);
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_ajuste_data_apuracao_saveClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0207', 'ALTERAR', 'BALANCO: ' + DateToStr(Fajuste.data_confirm) +
    ' DT APUR: ' + DateToStr(Fajuste.data_apuracao), 'ESTOQUE_AJUSTE', DateToStr(Fajuste.data_confirm), Fbalanco.buscas) then
    Exit;

  if not Fajuste.setData_apuracao(StrToDate(ed_ajuste_data_apuracao.Text)) then
    if (Self.Enabled) and (Self.Visible) and (ed_ajuste_data_apuracao.CanFocus) then
      ed_ajuste_data_apuracao.SetFocus;
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_ajuste_manterClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0206', 'MANTER', 'BALANCO: ' + FlkBalanco.dataSet.FieldByName('data_confirm').AsString,
    'ESTOQUE_INI', FlkBalanco.dataSet.FieldByName('data_confirm').AsString, Fbalanco.buscas) then
    Exit;

  if (lkBalanco.KeyValue = Null) or (FlkBalanco.dataSet.IsEmpty) then
  begin
    vDadosIni.ShowAtencao('Nenhum balanço selecionado');
    Exit;
  end;

  Fajuste.getAjuste(FlkBalanco.dataSet.FieldByName('data_confirm').AsDateTime);

  ed_ajuste_data_confirm.Text  := DateToStr(Fajuste.data_confirm);
  ed_ajuste_data_apuracao.Text := DateToStr(Fajuste.data_apuracao);
  bt_voltar.Tag                := 1;
  pg_ajuste.ActivePage         := ts_ajuste;
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_ajuste_itens_entrada_fator_saveClick(
  Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0208', 'ALTERAR',
    Format('BALANCO %s: %s FATOR MED %0.6f->%0.6f',
           ['E', DateToStr(Fajuste.data_confirm), Fajuste.itens_ent.fator_med, ed_ajuste_itens_entrada_fator.AsValue]),
    'ESTOQUE_AJUSTE_ITENS', DateToStr(Fajuste.data_confirm), Fbalanco.buscas) then
    Exit;

  bt_ajuste_itens_entrada_save.Enabled := not Fajuste.itens_ent.setAjuste(ed_ajuste_itens_entrada_fator.AsValue);
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_ajuste_itens_entrada_saveClick(
  Sender: TObject);
begin
  inherited;
  bt_ajuste_itens_entrada_save.Enabled := not Fajuste.itens_ent.saveChanges;
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_ajuste_itens_saida_fator_saveClick(
  Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0208', 'ALTERAR',
    Format('BALANCO %s: %s FATOR MED %0.6f->%0.6f',
           ['S', DateToStr(Fajuste.data_confirm), Fajuste.itens_sai.fator_med, ed_ajuste_itens_saida_fator.AsValue]),
    'ESTOQUE_AJUSTE_ITENS', DateToStr(Fajuste.data_confirm), Fbalanco.buscas) then
    Exit;
  bt_ajuste_itens_saida_save.Enabled := not Fajuste.itens_sai.setAjuste(ed_ajuste_itens_saida_fator.AsValue);
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_ajuste_itens_saida_saveClick(
  Sender: TObject);
begin
  inherited;
  bt_ajuste_itens_saida_save.Enabled := not Fajuste.itens_sai.saveChanges;
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_balanco_visualizarClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0205', 'VISUALIZAR', 'BALANCO: ' + FlkBalanco.dataSet.FieldByName('data_confirm').AsString,
    'ESTOQUE_INI', FlkBalanco.dataSet.FieldByName('data_confirm').AsString, Fbalanco.buscas) then
    Exit;

  if FlkBalanco.dataSet.IsEmpty then
  begin
    vDadosIni.ShowErro('Nenhum balanço informado');
    Exit;
  end;

  Fbalanco.pesquisa.dataIni  := ed_data_ini.Text;
  Fbalanco.pesquisa.dataFim  := ed_data_fim.Text;
  Fbalanco.pesquisa.data_confirm := DateToStr(FlkBalanco.dataSet.FieldByName('data_confirm').AsDateTime);

  Fbalanco.consultar;

  grid_balanco.Visible := Fbalanco.dataSet.RecordCount > 0;

  lb_custo_pos.Caption        := Format('%n', [Fbalanco.custo_ent]);
  lb_custo_neg.Caption        := Format('%n', [Fbalanco.custo_sai]);

  _GravaConfiguracoesString (ed_data_ini.Name      , ed_data_ini.Text);
  _GravaConfiguracoesString (ed_data_fim.Name      , ed_data_fim.Text);
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_hist_visualizarClick(Sender: TObject);
begin
  inherited;
  Fhit_aj.pesquisa.dataIni := ed_hist_dtini.Text;
  Fhit_aj.pesquisa.dataFim := ed_hist_dtfim.Text;

  Fhit_aj.consultar;

  grid_hist.Visible := Fhit_aj.dataSet.RecordCount > 0;

  _GravaConfiguracoesString(ed_hist_dtini.Name      , ed_hist_dtini.Text);
  _GravaConfiguracoesString(ed_hist_dtfim.Name      , ed_hist_dtfim.Text);
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_nf_atualizarClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0210', 'PREVER', Format('BALANCO %s: %s', [Fajuste_it.natureza, DateToStr(Fajuste.data_confirm)]),
    'ESTOQUE_AJUSTE', DateToStr(Fajuste.data_confirm), Fbalanco.buscas) then
    Exit;

  tv_nf.Items.Clear;

  Fajuste_it.notasfiscais_gerar(Ffatu, ed_cfop.AsInteger, vDadosIni.StrZero(ed_cst_icms.AsInteger, 2));
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_nf_voltarClick(Sender: TObject);
begin
  inherited;
  tv_nf.Items.Clear;

  Fconf.WriteString('Conf_' + Fajuste_it.natureza, 'CFOP', FloatToStr(ed_cfop.AsValue));
  Fconf.WriteString('Conf_' + Fajuste_it.natureza, 'CST_ICMS', vDadosIni.StrZero(ed_cst_icms.AsInteger, 2));

  Fbalanco.buscas.Close;
  Fbalanco.buscas.SQL.Text := 'update config_sistema set value1_b = :value1_b where chave = :chave and cod_empresa = :cod_empresa';
  try
    Fconf.SetValuesInParams(Fbalanco.buscas, True).ExecSQL;
    if Fbalanco.buscas.Transaction.InTransaction then
      Fbalanco.buscas.Transaction.Commit;

  except on E: Exception do
    begin
      if Fbalanco.buscas.Transaction.InTransaction then
        Fbalanco.buscas.Transaction.Rollback;

      vDadosIni.registraErro('TfrmCadNF_Ajuste_Estoque.bt_nf_voltarClick' + E.Message);
    end;
  end;
end;

procedure TfrmCadNF_Ajuste_Estoque.bt_voltarClick(Sender: TObject);
begin
  inherited;
  if bt_voltar.Tag = 1 then
    pg_ajuste.ActivePage := ts_balanco
  else                                
    pg_ajuste.ActivePage := ts_hist;
end;

procedure TfrmCadNF_Ajuste_Estoque.ed_alterar_custo_fatorExit(Sender: TObject);
begin
  inherited;
  if ed_alterar_custo_fator.AsValue <= 0 then
    ed_alterar_custo_fator.AsValue := dbt_alterar_custo_qtde.DataSource.DataSet.FieldByName('fator').AsFloat
  else
    ed_alterar_custo_tot_aj.AsValue := Abs(ed_alterar_custo_fator.AsValue *
                                           (dbt_alterar_custo_qtde.DataSource.DataSet.FieldByName('quantidade').AsFloat *
                                            dbt_alterar_custo_qtde.DataSource.DataSet.FieldByName('custo_un').AsFloat));
end;

procedure TfrmCadNF_Ajuste_Estoque.ed_alterar_custo_tot_ajExit(Sender: TObject);
var
  Acusto: Double;
begin
  inherited;
  if ed_alterar_custo_tot_aj.AsValue <= 0 then
    ed_alterar_custo_tot_aj.AsValue := dbt_alterar_custo_qtde.DataSource.DataSet.FieldByName('custo_tot_aj').AsFloat
  else
    ed_alterar_custo_fator.AsValue := Abs(ed_alterar_custo_tot_aj.AsValue /
                                          (dbt_alterar_custo_qtde.DataSource.DataSet.FieldByName('quantidade').AsFloat *
                                            dbt_alterar_custo_qtde.DataSource.DataSet.FieldByName('custo_un').AsFloat));
end;

procedure TfrmCadNF_Ajuste_Estoque.ed_cfopExit(Sender: TObject);
begin
  inherited;
  if Fajuste_it.natureza = 'S' then
    if (ed_cfop.AsInteger < 5000) or
       (ed_cfop.AsInteger > 5999) then
    begin
      vDadosIni.ShowAtencao('CFOP inválido informar entre 5000 e 5999');

      ed_cfop.Text := Fconf.ReadString('Conf_' + Fajuste_it.natureza, 'CFOP', IfThen(Fajuste_it.natureza = 'S', '5927', '1949'));
    end;

  if Fajuste_it.natureza = 'E' then
    if (ed_cfop.AsInteger < 1000) or
       (ed_cfop.AsInteger > 1999) then
    begin
      vDadosIni.ShowAtencao('CFOP inválido informar entre 1000 e 1999');

      ed_cfop.Text := Fconf.ReadString('Conf_' + Fajuste_it.natureza, 'CFOP', IfThen(Fajuste_it.natureza = 'S', '5927', '1949'));
    end;
end;

procedure TfrmCadNF_Ajuste_Estoque.ed_cst_icmsExit(Sender: TObject);
begin
  inherited;
  if (Fajuste_it.natureza = 'E') and (ed_cst_icms.AsInteger = 99) then
  else
    if not vDadosIni.TestarCst('0' + vDadosIni.StrZero(ed_cst_icms.AsInteger, 2)) then
    ed_cst_icms.Text := Fconf.ReadString('Conf_' + Fajuste_it.natureza, 'CST_ICMS', '41');
end;

procedure TfrmCadNF_Ajuste_Estoque.ed_data_iniExit(Sender: TObject);
var
  Adata: TDateTime;
  Acontrol: TMaskEdit;
  Aini, Arefresh: Boolean;
begin
  inherited;
  if not(Sender is TMaskEdit) then
    Exit;

  Acontrol := TMaskEdit(Sender);
  Aini     := Acontrol = ed_data_ini;
  Arefresh := True;

  if TryStrToDate(Acontrol.Text, Adata) then
  begin
    if Assigned(FlkBalanco.dataSet) then
      Arefresh := StrToDateTime(IfThen(Aini, Fbalanco.pesquisa.dataIni, Fbalanco.pesquisa.dataFim)) <> Adata;
    if Aini then
      Fbalanco.pesquisa.dataIni := Acontrol.Text
    else
      Fbalanco.pesquisa.dataFim := Acontrol.Text;

    if Arefresh then
    begin
      Fbalanco.SqlOpen('select distinct ei.data_confirm,' +
                      ' case when ei.tip_bal = ''D'' then ''Diário '' else ''Geral '' end||' +
                      ' (select result from strzero(extract(day from ei.data_confirm),2)) || ''/'' ||' +
                      ' (select result from strzero(extract(month from ei.data_confirm),2)) || ''/'' ||' +
                      ' (select result from strzero(extract(year from ei.data_confirm),2)) balanco' +
                      ' from estoque_ini ei' +
                      ' where ei.data_confirm >= %s and ei.data_confirm <= %s' +
                      ' and ei.cod_empresa = %s and ei.qtd_dif_bal <> 0' +
                      ' order by ei.data_confirm desc',
                      [QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Fbalanco.pesquisa.dataIni))),
                       QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Fbalanco.pesquisa.dataFim))),
                       vDadosIni.codEmpresa]);
      FlkBalanco.setDadosDataSet('DATA_CONFIRM', 'BALANCO', Fbalanco.buscas, lkBalanco);
      if not Fbalanco.IsEmpty then
      begin
        Fbalanco.buscas.First;
        lkBalanco.KeyValue := Fbalanco.buscas.FieldByName('DATA_CONFIRM').Value;
      end;
    end;
  end
  else if Aini then
    ed_data_ini.Text := Fbalanco.pesquisa.dataIni
  else
    ed_data_fim.Text := Fbalanco.pesquisa.dataFim;
end;

procedure TfrmCadNF_Ajuste_Estoque.estoque_ajuste_itens_entrada_change(
  Sender: TObject);
begin
  lb_ajuste_itens_entrada_custo_val.Caption       := Format('%n', [Fajuste.itens_ent.custo_tot]);
  lb_ajuste_itens_entrada_ajuste_val.Caption      := Format('%n', [Fajuste.itens_ent.custo_tot_aj]);
  lb_ajuste_itens_entrada_custo_fator_val.Caption := Format('%0.6f', [Fajuste.itens_ent.fator_med]);
  ed_ajuste_itens_entrada_fator.AsValue           := Fajuste.itens_ent.fator_med;
end;

procedure TfrmCadNF_Ajuste_Estoque.estoque_ajuste_itens_notas_make(
  Sender: TObject);
var
  Anf: THw_notafiscal_class;
  Ait: THw_notafiscal_item_class;
  Aerros: THw_erro_classList;
  Aprods: THw_produtos_tmp_classList;
  Aprod : Tprodutos_tmp_class;
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
    Alevel0 := tv_nf.Items.AddChild(nil, Format('Nota fiscal %s de %s no valor de %n com quantidade de %d (Erros: %d)',
                                                [IfThen(Anf.num_nf > 0, IntToStr(Anf.num_nf)),
                                                 IfThen(Anf.natureza_nf = 'S', 'Saída', 'Entrada'),
                                                 Anf.valor_total, Anf.itens.Count, Anf.erros.Count]));
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
      Alevel2 := tv_nf.Items.AddChild(Alevel1, Format('%d - %s', [Ait.nitem, Ait.descricao_item]));

      tv_nf.Items.AddChild(Alevel2, Format('CFOP................: %4.0f', [Ait.codigo_nop]));
      tv_nf.Items.AddChild(Alevel2, Format('CST ICMS............: %s'   , [Ait.cst]));
      tv_nf.Items.AddChild(Alevel2, Format('Valor Unitário......: %0.6n', [Ait.valor_unitario]));
      tv_nf.Items.AddChild(Alevel2, Format('Quantidade..........: %0.6n', [Ait.quantidade]));
      tv_nf.Items.AddChild(Alevel2, Format('Valor Total.........: %0.2n', [Ait.valor_total]));
      tv_nf.Items.AddChild(Alevel2, Format('BC ICMS.............: %n', [Ait.base_icm]));
      tv_nf.Items.AddChild(Alevel2, Format('Aliq ICMS...........: %n', [Ait.aliq_icm]));
      tv_nf.Items.AddChild(Alevel2, Format('ICMS................: %n', [Ait.valor_icm]));
      tv_nf.Items.AddChild(Alevel2, Format('MVA.................: %n', [Ait.mva]));
      tv_nf.Items.AddChild(Alevel2, Format('BC ICMS ST..........: %n', [Ait.base_icmsub]));
      tv_nf.Items.AddChild(Alevel2, Format('Aliq ICMS ST........: %n', [Ait.aliq_icmsub]));
      tv_nf.Items.AddChild(Alevel2, Format('*ICMS ST............: %n', [Ait.valor_icmsub]));
      tv_nf.Items.AddChild(Alevel2, Format('*Descontos..........: %n', [Ait.rateio_desconto]));
      tv_nf.Items.AddChild(Alevel2, Format('*IPI................: %n', [Ait.valor_ipi]));
      tv_nf.Items.AddChild(Alevel2, Format('*Frete..............: %n', [Ait.rateio_frete]));
      tv_nf.Items.AddChild(Alevel2, Format('*Seguro.............: %n', [Ait.rateio_seguro]));
      tv_nf.Items.AddChild(Alevel2, Format('*Outros.............: %n', [Ait.rateio_outdesp]));
      tv_nf.Items.AddChild(Alevel2, Format('*Imposto Importação.: %n', [Ait.valor_ii]));
      tv_nf.Items.AddChild(Alevel2, Format('Val Aprox tributos..: %n', [Ait.vtottrib]));
      tv_nf.Items.AddChild(Alevel2, Format('ICMS Inter Dest.....: %n', [Ait.vicmsufdest]));
      tv_nf.Items.AddChild(Alevel2, Format('ICMS Inter Rem......: %n', [Ait.vicmsufremet]));
      tv_nf.Items.AddChild(Alevel2, Format('FCP Inter Dest......: %n', [Ait.vfcpufdest]));
      tv_nf.Items.AddChild(Alevel2, Format('FCP.................: %n', [Ait.fcp_vfcp]));
      tv_nf.Items.AddChild(Alevel2, Format('*FCP ST.............: %n', [Ait.fcp_vfcpst]));
      tv_nf.Items.AddChild(Alevel2, Format('FCP ST Ant..........: %n', [Ait.fcp_vfcpstret]));
    end;
//    for I := 0 to Pred(tv_nf.Items.Count) do
//      if tv_nf.Items[I].Level = 0 then
//        tv_nf.Items[i].Expand(False)
//      else if (tv_nf.Items[I].Level = 1) and (Pos('Itens da nota - Qtde', tv_nf.Items[I].Text) = 1) then
//        tv_nf.Items[i].Expand(False);
//      else if (tv_nf.Items[I].Level = 2) then
//        tv_nf.Items[i].Expand(False);
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
  else if Sender is THw_produtos_tmp_classList then
  begin
    Aprods := THw_produtos_tmp_classList(Sender);
    Alevel0 := tv_nf.Items.AddChild(nil, Format('Produtos pendentes de emissão da nota fiscal (Quantidade: %d)', [Aprods.Count]));
    for I := 0 to Pred(Aprods.Count) do
    begin
      Alevel1 := tv_nf.Items.AddChild(Alevel0, Aprods.Items[i].id_tmp);
      tv_nf.Items.AddChild(Alevel1, Aprods.Items[i].cod_prod);
    end;
  end;
end;

procedure TfrmCadNF_Ajuste_Estoque.estoque_ajuste_itens_saida_change(
  Sender: TObject);
begin
  lb_ajuste_itens_saida_custo_val.Caption       := Format('%n', [Fajuste.itens_sai.custo_tot]);
  lb_ajuste_itens_saida_ajuste_val.Caption      := Format('%n', [Fajuste.itens_sai.custo_tot_aj]);
  lb_ajuste_itens_saida_custo_fator_val.Caption := Format('%0.6f', [Fajuste.itens_sai.fator_med]);
  ed_ajuste_itens_saida_fator.AsValue           := Fajuste.itens_sai.fator_med;
end;

procedure TfrmCadNF_Ajuste_Estoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(Fbalanco);
  FreeAndNil(FlkBalanco);
  FreeAndNil(Fajuste);
  FreeAndNil(Fhit_aj);
  FreeAndNil(Ffatu);
  FreeAndNil(Fconf);

  Action := caFree;
  frmCadNF_Ajuste_Estoque := nil;
end;

procedure TfrmCadNF_Ajuste_Estoque.FormCreate(Sender: TObject);
begin
  Fbalanco := TEstoque_ini_OOP.Create;
  FlkBalanco := TDadosLookUp_OOP.create;
  Fajuste := TEstoque_ajuste.Create(balanco);
  Fhit_aj := TEstoque_ajuste_OOP.Create;
  Ffatu := THw_faturamento.Create;
  Fconf := TConfig_sistema_class.Create;

  inherited;

  grid_balanco.DataSource := Fbalanco._dataSourceOOP;
  grid_hist.DataSource := Fhit_aj._dataSourceOOP;
  grid_ajuste_itens_entrada.DataSource := Fajuste.itens_ent._dataSourceOOP;
  grid_ajuste_itens_saida.DataSource := Fajuste.itens_sai._dataSourceOOP;
  Fajuste.itens_ent.onCalcChange := estoque_ajuste_itens_entrada_change;
  Fajuste.itens_sai.onCalcChange := estoque_ajuste_itens_saida_change;
  Fajuste.itens_ent.onNotasMake := estoque_ajuste_itens_notas_make;
  Fajuste.itens_sai.onNotasMake := estoque_ajuste_itens_notas_make;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadNF_Ajuste_Estoque.FormShow(Sender: TObject);
begin
  inherited;
  pg_ajuste.ActivePage        := ts_balanco;
  ts_ajuste.TabVisible        := False;
  ts_modais.TabVisible        := False;
  ts_nf.TabVisible            := False;

  ed_data_ini.Text            := _LerConfiguracoesRegistroString(ed_data_ini.Name, DateToStr(StartOfTheMonth(Date)));
  ed_data_fim.Text            := _LerConfiguracoesRegistroString(ed_data_fim.Name, DateToStr(EndOfTheMonth(Date)));
  ed_hist_dtini.Text          := _LerConfiguracoesRegistroString(ed_hist_dtini.Name, DateToStr(StartOfTheMonth(Date)));
  ed_hist_dtfim.Text          := _LerConfiguracoesRegistroString(ed_hist_dtfim.Name, DateToStr(EndOfTheMonth(Date)));
  lb_custo_pos.Caption        := Format('%n', [0.00]);
  lb_custo_neg.Caption        := Format('%n', [0.00]);
  THackWinControl(pg_ajuste.ActivePage).SelectFirst;

  Fbalanco.pesquisa.dataIni   := ed_data_ini.Text;
  Fbalanco.pesquisa.dataFim   := ed_data_fim.Text;
end;

procedure TfrmCadNF_Ajuste_Estoque.grid_ajuste_itens_entradaDblClick(
  Sender: TObject);
begin
  inherited;
  if Fajuste.itens_ent.dataSet.IsEmpty then
    Exit;

  if Fajuste.itens_ent.f_int('cod_nf') > 0 then
  begin
    vDadosIni.ShowErro('Item não pode ser modificado, já possui nota fiscal');
    Exit;
  end;

  if not vDadosIni.PesqPros('NF0208', 'ALTERAR',
    Format('BALANCO %s: %s PROD %d-%s TOT %0.2f',
           ['E', DateToStr(Fajuste.data_confirm), Fajuste.itens_ent.f_int('GRUPO_PROD'),
            Fajuste.itens_ent.f_str('COD_PROD'), Fajuste.itens_ent.f_float('CUSTO_TOT_AJ')]),
    'ESTOQUE_AJUSTE_ITENS', DateToStr(Fajuste.data_confirm), Fbalanco.buscas) then
    Exit;

  ed_alterar_custo_fator.AsValue    := Fajuste.itens_ent.f_float('fator');
  ed_alterar_custo_tot_aj.AsValue   := Abs(Fajuste.itens_ent.f_float('custo_tot_aj'));
  lb_alterar_custo_tot_val.Caption  := Format('%n', [Fajuste.itens_ent.f_float('custo_un') * Fajuste.itens_ent.f_float('quantidade')]);
  dbt_alterar_custo_qtde.DataSource := Fajuste.itens_ent._dataSourceOOP;
  dbt_alterar_custo_un.DataSource   := Fajuste.itens_ent._dataSourceOOP;

  if not vDadosIni.abreForm('Alteração de custo', pn_alterar_custo, opFormsDefCadEsc) then
    Exit;

  bt_ajuste_itens_entrada_save.Enabled := Fajuste.itens_ent.setCustoItem(ed_alterar_custo_tot_aj.AsValue);
end;

procedure TfrmCadNF_Ajuste_Estoque.grid_ajuste_itens_saidaDblClick(
  Sender: TObject);
begin
  inherited;
  if Fajuste.itens_sai.dataSet.IsEmpty then
    Exit;

  if Fajuste.itens_sai.f_int('cod_nf') > 0 then
  begin
    vDadosIni.ShowErro('Item não pode ser modificado, já possui nota fiscal');
    Exit;
  end;

  if not vDadosIni.PesqPros('NF0208', 'ALTERAR',
    Format('BALANCO %s: %s PROD %d-%s TOT %0.2f',
           ['S', DateToStr(Fajuste.data_confirm), Fajuste.itens_sai.f_int('GRUPO_PROD'),
            Fajuste.itens_sai.f_str('COD_PROD'), Fajuste.itens_sai.f_float('CUSTO_TOT_AJ')]),
    'ESTOQUE_AJUSTE_ITENS', DateToStr(Fajuste.data_confirm), Fbalanco.buscas) then
    Exit;

  ed_alterar_custo_fator.AsValue    := Fajuste.itens_sai.f_float('fator');
  ed_alterar_custo_tot_aj.AsValue   := Abs(Fajuste.itens_sai.f_float('custo_tot_aj'));
  lb_alterar_custo_tot_val.Caption  := Format('%n', [Fajuste.itens_sai.f_float('custo_un') * Fajuste.itens_sai.f_float('quantidade')]);
  dbt_alterar_custo_qtde.DataSource := Fajuste.itens_sai._dataSourceOOP;
  dbt_alterar_custo_un.DataSource   := Fajuste.itens_sai._dataSourceOOP;

  if not vDadosIni.abreForm('Alteração de custo', pn_alterar_custo, opFormsDefCadEsc) then
    Exit;

  bt_ajuste_itens_saida_save.Enabled := Fajuste.itens_sai.setCustoItem(ed_alterar_custo_tot_aj.AsValue);
end;

procedure TfrmCadNF_Ajuste_Estoque.pn_nfEnter(Sender: TObject);
var
  Acfop, Acst: string;
begin
  inherited;
  if Fconf.chave = '' then
    Fconf := vDadosIni.getConfSisObject('est_ajuste_conf', Fbalanco.buscas);

  Acfop := Fconf.ReadString('Conf_' + Fajuste_it.natureza, 'CFOP', IfThen(Fajuste_it.natureza = 'S', '5927', '1949'));
  Acst  := Fconf.ReadString('Conf_' + Fajuste_it.natureza, 'CST_ICMS', '41');

  ed_cfop.Text := Acfop;
  ed_cst_icms.Text := Acst;

//  ed_cfop.AsValue := StrToFloatDef(Acfop, IfThen(Fajuste_it.natureza = 'S', 5927, 1949));
//  ed_cst_icms.AsValue := StrToFloatDef(Acst, 41);
end;

procedure TfrmCadNF_Ajuste_Estoque.pn_notas_groupResize(Sender: TObject);
begin
  inherited;
  group_ajuste_entrada.Width := Trunc(pn_notas_group.Width / 2);
end;

procedure TfrmCadNF_Ajuste_Estoque.ts_balancoEnter(Sender: TObject);
begin
  inherited;
  ed_data_iniExit(ed_data_ini);  
end;

procedure TfrmCadNF_Ajuste_Estoque.ts_histEnter(Sender: TObject);
begin
  inherited;
  if not Fhit_aj.dataSet.Active then
    bt_hist_visualizar.Click;
end;

end.
