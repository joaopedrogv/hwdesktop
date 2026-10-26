unit uCadNF_lote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, faturamento_hw_class, uDataSet_OOP, uDtmAtivo, DB, DBClient,
  ComCtrls, Grids, DBGrids, StdCtrls, Buttons, Menus, DBCtrls, ImgList, Mask,
  uEditHw, config_sistema_class, pedvenda_volumes_class, SituacaoNFeEnumUnit;

type
  TDataSet_OOP_ = class(TDataSet_OOP);

  TAux_transporta_class = class(TDataSet_OOP_)
  private
    Fmodalidade    : Integer;
    Fcodigo_tr     : Integer;
    Fplaca         : string;
    Fuf_placa      : string;
    Frntc          : string;
    Fconf          : TConfig_sistema_class;
    Fdados_transp  : string;
    Fmodalidade_str: string;
  public
    destructor Destroy; override;

    function Iniciar: Boolean;
    function Abrir(Acodigo_tr: Integer; ArestoreValues: Boolean = True): Boolean;
    function SalvarConfig: Boolean;
    function volumes_pedido_salvar(Avolume: TPedvenda_volumes_class): Boolean;
    function volumes_pedido_excluir(Avolume: TPedvenda_volumes_class): Boolean;


    function get_modalidade_str(Amodalidade: Integer): string;

    property modalidade    : Integer               read Fmodalidade   write Fmodalidade;
    property codigo_tr     : Integer               read Fcodigo_tr    write Fcodigo_tr;
    property placa         : string                read Fplaca        write Fplaca;
    property uf_placa      : string                read Fuf_placa     write Fuf_placa;
    property rntc          : string                read Frntc         write Frntc;
    property dados_transp  : string                read Fdados_transp write Fdados_transp;
    property modalidade_str: string                read Fmodalidade_str;
    property conf          : TConfig_sistema_class read Fconf         write Fconf;
  end;

  TAux_faturamento = class
  private
    Fdata_pedvenda: TClientDataSet;
    Fdata_notafiscal: TClientDataSet;
    Fds_ped, Fds_nota: TDataSource;
    Fnf_: TDataSet_OOP;
    Fped_: TDataSet_OOP;
    Ftransporta: TAux_transporta_class;
  public
    constructor Create;
    destructor Destroy; override;

    function dataset_edit_pedvenda(Aped: THw_pedvenda_class): TClientDataSet;

    function dataset_popular_pedvenda(Afatu: THw_faturamento; Asel: Boolean = False): TClientDataSet;
    function dataset_popular_notafiscal(Afatu: THw_faturamento): TClientDataSet;

    property transporta: TAux_transporta_class read Ftransporta write Ftransporta;
    property data_pedvenda: TClientDataSet read Fdata_pedvenda write Fdata_pedvenda;
    property data_notafiscal: TClientDataSet read Fdata_notafiscal write Fdata_notafiscal;
    property ds_ped: TDataSource read Fds_ped;
    property ds_nota: TDataSource read Fds_nota;

    property nf_: TDataSet_OOP read Fnf_;
    property ped_: TDataSet_OOP read Fped_;

  end;

  TfrmCadNF_lote = class(TfrmPadrao)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    pages: TPageControl;
    ts_pedidos: TTabSheet;
    ts_notas: TTabSheet;
    pn_grid_ped: TPanel;
    grid_ped: TDBGrid;
    pn_nf_prev: TPanel;
    BitBtn2: TBitBtn;
    ts_erros: TTabSheet;
    PopupMenu1: TPopupMenu;
    Selecionar1: TMenuItem;
    Removerseleo1: TMenuItem;
    odos1: TMenuItem;
    PedidosAbertos: TMenuItem;
    PedidosFechados: TMenuItem;
    btSelectAll: TSpeedButton;
    bt_pedidos_fechar: TBitBtn;
    pn_erros_scroll: TPanel;
    Splitter1: TSplitter;
    db_memo_erros: TDBMemo;
    N1: TMenuItem;
    Limpartela1: TMenuItem;
    pn_erros: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    memo_erros: TMemo;
    BitBtn1: TBitBtn;
    Panel8: TPanel;
    ImageList1: TImageList;
    bt_erros_show: TSpeedButton;
    lb_erros_titulo: TLabel;
    memo_erros_scroll: TMemo;
    N2: TMenuItem;
    Atualizar1: TMenuItem;
    BitBtn118: TBitBtn;
    pn_nf_prev_bottom: TPanel;
    bt_prev_nf_cancel: TBitBtn;
    pn_nf_prev_top: TPanel;
    pn_nf_prev_tv: TPanel;
    lb_dados_transporte: TLabel;
    dbt_dados_transp: TDBText;
    bt_change_trnasporta: TSpeedButton;
    lb_dadhora_saida: TLabel;
    ed_data_saida: TMaskEdit;
    ed_hora_saida: TMaskEdit;
    ts_modais: TTabSheet;
    bt_datahora_saida_clear: TSpeedButton;
    tv_nf: TTreeView;
    bt_pedidos_faturamento: TBitBtn;
    ck_usar_dados_transporte: TCheckBox;
    sc_modais: TScrollBox;
    pn_transporte: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label640: TLabel;
    Label680: TLabel;
    SpeedButton3: TSpeedButton;
    ed_codigo_tr: TDBEdit;
    ed_cnpj_tr: TDBEdit;
    ed_endereco_tr: TDBEdit;
    ed_municipio_tr: TDBEdit;
    ed_ie_tr: TDBEdit;
    ed_uf_placa: TDBEdit;
    ed_placa: TDBEdit;
    ed_uf_tr: TDBEdit;
    ed_nome_tr: TDBEdit;
    lkmodalidade: TDBLookupComboBox;
    ed_rntc: TDBEdit;
    pn_transporte_bottom: TPanel;
    bt_voltar_transporta: TBitBtn;
    pn_volumes: TPanel;
    pn_volumes_bottom: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    ed_qvol: TEditHw;
    ed_esp: TMaskEdit;
    ed_marca: TMaskEdit;
    ed_nvol: TMaskEdit;
    ed_pesob: TEditHw;
    ed_pesol: TEditHw;
    bt_volumes_save: TBitBtn;
    bt_volumes_cancel: TBitBtn;
    bt_volumes_delete: TBitBtn;
    bt_tv_refresh: TSpeedButton;
    bt_datahora_saida_set: TSpeedButton;
    bt_pedidos_faturar: TBitBtn;
    Configuraao1: TMenuItem;
    procedure Configuraao1Click(Sender: TObject);
    procedure bt_tv_refreshClick(Sender: TObject);
    procedure bt_prev_nf_cancelClick(Sender: TObject);
    procedure bt_datahora_saida_setClick(Sender: TObject);
    procedure ed_data_saidaExit(Sender: TObject);
    procedure pn_volumesEnter(Sender: TObject);
    procedure tv_nfCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure bt_volumes_saveClick(Sender: TObject);
    procedure bt_volumes_deleteClick(Sender: TObject);
    procedure tv_nfDblClick(Sender: TObject);
    procedure bt_datahora_saida_clearClick(Sender: TObject);
    procedure ck_usar_dados_transporteClick(Sender: TObject);
    procedure bt_pedidos_faturamentoClick(Sender: TObject);
    procedure ed_codigo_trExit(Sender: TObject);
    procedure ed_codigo_trKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure bt_change_trnasportaClick(Sender: TObject);
    procedure BitBtn118Click(Sender: TObject);
    procedure Atualizar1Click(Sender: TObject);
    procedure bt_erros_showClick(Sender: TObject);
    procedure grid_pedMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grid_pedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_pedCellClick(Column: TColumn);
    procedure bt_pedidos_faturarClick(Sender: TObject);
    procedure grid_pedDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Limpartela1Click(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure PedidosFechadosClick(Sender: TObject);
    procedure PedidosAbertosClick(Sender: TObject);
    procedure Removerseleo1Click(Sender: TObject);
    procedure odos1Click(Sender: TObject);
    procedure bt_pedidos_fecharClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure grid_pedDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    Ffatu: THw_faturamento;
    Faux: TAux_faturamento;
    Fvol_aux: TPedvenda_volumes_class;
    { Private declarations }
  public
    { Public declarations }
    procedure ped_AfterScroll(DataSet: TDataSet);
    procedure notafiscal_make_tv(Sender: TObject);
    procedure notafiscal_atualizar_dados_lote(AchangeTreeView: Boolean = True);

    property fatu: THw_faturamento read Ffatu write Ffatu;
    property aux: TAux_faturamento read Faux write Faux;
  end;

var
  frmCadNF_lote: TfrmCadNF_lote;

implementation

uses
  uDadosIni, pedvenda_class, clientes_class, notafiscal_class, hw_erro_class,
  hw_auditoria_class, StrUtils, DFeHwLibUnit, DateUtils, opfiscal_confs;

{$R *.dfm}

procedure faturamento_add_pedidos(Acod_pedidos: arrayInt; Amodal: Boolean);
var
  I, J: Integer;
  Adoit: Boolean;
begin
  //criar uma trigger q vai contar as alteracoes igual a nfce faz
  try
    vDadosIni.abreStatusProcessamento('Pedidos em lote', 'Iniciando', True);

    if Amodal and Assigned(frmCadNF_lote) then
      if frmCadNF_lote.FormStyle = fsMDIChild then
      begin
        FreeAndNil(frmCadNF_lote);
      end;

    vDadosIni.vModalOuChild :=  IfThen(Amodal, 'M', 'C');

    if not Assigned(frmCadNF_lote) then
      Application.CreateForm(TfrmCadNF_lote, frmCadNF_lote);

    with frmCadNF_lote do
    begin

      for I := Low(Acod_pedidos) to High(Acod_pedidos) do
      begin
        vDadosIni.statusProcessamento('Pedidos %d de %d', [I + 1, Length(Acod_pedidos)]);
        Adoit := True;
        for J := 0 to Pred(fatu.pedidos.Count) do with fatu.pedidos.Items[J] do
          if nped = Acod_pedidos[I] then
          begin
            Adoit := False;
            Break;
          end;

        if Adoit then
          fatu.pedidos.New.pedvenda_dados_obter(Acod_pedidos[I], 'REQ', False);
      end;

      grid_ped.Visible    := aux.dataset_popular_pedvenda(fatu, True).RecordCount > 0;
      grid_ped.DataSource := aux.ds_ped;
      db_memo_erros.DataSource := aux.ds_ped;

      ped_AfterScroll(aux.ped_.dataSet);
      aux.ped_.dataSet.AfterScroll := ped_AfterScroll;

      if Amodal then
        ShowModal
      else
        Show;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

exports
  faturamento_add_pedidos;

{ TAux_faturamento }

constructor TAux_faturamento.Create;
begin
  Fdata_pedvenda := TClientDataSet.Create(nil);
  Fds_ped := TDataSource.Create(nil);
  Fds_ped.AutoEdit := False;
//  Fdata_pedvenda.CreateDbComponents(dtmAtivo.bancoHw);

  Fdata_notafiscal := TClientDataSet.Create(nil);
  Fds_nota := TDataSource.Create(nil);
  Fds_nota.AutoEdit := False;
//  Fdata_notafiscal.CreateDbComponents(dtmAtivo.bancoHw);

  Fnf_ := TDataSet_OOP.Create;
  Fnf_.dataSet := Fdata_notafiscal;

  Fped_ := TDataSet_OOP.Create;
  Fped_.dataSet := Fdata_pedvenda;

  Ftransporta      := TAux_transporta_class.Create(dtmAtivo.bancoHw);
end;

function TAux_faturamento.dataset_edit_pedvenda(
  Aped: THw_pedvenda_class): TClientDataSet;
begin
  with Aped do with Fdata_pedvenda do
  begin
    Edit;
    FieldByName('nped').AsInteger        := nped;
    FieldByName('tipo').AsString         := tipo;
    FieldByName('data_ped').AsDateTime   := data_ped;
    FieldByName('status_ped').AsString   := status_ped;
    FieldByName('valor_total').AsFloat   := valor_total;
    FieldByName('nome_cliente').AsString := cliente.nome_cliente;
    FieldByName('razao').AsString        := cliente.razao;
    if data_fech > 0 then
      FieldByName('data_fech').AsDateTime := data_fech;
    if erros.Count > 0 then
      FieldByName('Sit').AsString := 'Erro'
    else if status_ped = pv_stsAberta  then
      FieldByName('Sit').AsString := 'Processando'
    else if (status_ped = pv_stsFechada) and (num_nf = 0) then
      FieldByName('Sit').AsString := 'A faturar'
    else if (status_ped = pv_stsFechada) and (num_nf >= 0) then
      FieldByName('Sit').AsString := 'Faturamento';
    FieldByName('erros').AsString := erros.formato_TStrings.Text;
    Post;
  end;
end;

function TAux_faturamento.dataset_popular_notafiscal(
  Afatu: THw_faturamento): TClientDataSet;
var
  ArecNo: Integer;
  I: Integer;
begin
  Result := Fdata_notafiscal;

  {$REGION 'definindo o dataset da nota fiscal'}
  if not Fdata_notafiscal.Active then
  begin
    Fdata_notafiscal.FieldDefs.Add('num_nf'       , ftInteger);
    Fdata_notafiscal.FieldDefs.Add('status'       , ftString, 10);
    Fdata_notafiscal.FieldDefs.Add('situacao_nfe' , ftString, 16);
    Fdata_notafiscal.FieldDefs.Add('valor_total'  , ftFloat);
    Fdata_notafiscal.FieldDefs.Add('codigo_nop'   , ftFloat);
    Fdata_notafiscal.FieldDefs.Add('data_lanc'    , ftDateTime);
    Fdata_notafiscal.FieldDefs.Add('nome_cliente' , ftString, 35);
    Fdata_notafiscal.FieldDefs.Add('razao'        , ftString, 60);
    Fdata_notafiscal.FieldDefs.Add('data_contabil', ftDateTime);
    Fdata_notafiscal.FieldDefs.Add('hora_emissao' , ftString, 8);
    Fdata_notafiscal.FieldDefs.Add('indice'       , ftInteger);
    Fdata_notafiscal.CreateDataSet;

    with Fdata_notafiscal do
    begin
      FieldByName('num_nf').DisplayLabel        := 'Numero';
      FieldByName('status').DisplayLabel        := 'Status';
      FieldByName('situacao_nfe').DisplayLabel  := 'Situacao NF-e';
      FieldByName('valor_total').DisplayLabel   := 'Valor Total';
      FieldByName('codigo_nop').DisplayLabel    := 'CFOP';
      FieldByName('data_lanc').DisplayLabel     := 'Data Lanc';
      FieldByName('nome_cliente').DisplayLabel  := 'Nome cliente';
      FieldByName('razao').DisplayLabel         := 'Razao social';
      FieldByName('data_contabil').DisplayLabel := 'Data Emiss';
      FieldByName('hora_emissao').DisplayLabel  := 'Hora Emiss';

      TFloatField(FieldByName('valor_total')).DisplayFormat := '#,##0.00';
      FieldByName('indice').Visible := False;
    end;
    Fds_nota.DataSet := Fdata_notafiscal;
  end;
  {$ENDREGION}

  ArecNo := Fdata_notafiscal.RecNo;
  try
    Fdata_notafiscal.DisableControls;
    Fdata_notafiscal.EmptyDataSet;

    for I := 0 to Pred(Afatu.notas.Count) do with Afatu.notas.Items[I] do with Fdata_notafiscal do
    begin
      Insert;
      FieldByName('num_nf').AsInteger         := num_nf;
      FieldByName('status').AsString          := status;
      FieldByName('situacao_nfe').AsString    := situacao_nfe;
      FieldByName('valor_total').AsFloat      := valor_total;
      FieldByName('codigo_nop').AsFloat       := codigo_nop;
      FieldByName('data_lanc').AsDateTime     := data_lanc;
      FieldByName('nome_cliente').AsString    := nome_cliente;
      FieldByName('razao').AsString           := razao;
      FieldByName('data_contabil').AsDateTime := data_contabil;
      FieldByName('hora_emissao').AsString    := hora_emissao;
      FieldByName('indice').AsInteger         := I;
      Post;
    end;

    if (ArecNo > 0) and (ArecNo <= Fdata_notafiscal.RecordCount) then
      Fdata_notafiscal.RecNo := ArecNo;

  finally
    Fdata_notafiscal.EnableControls;
  end;
end;

function TAux_faturamento.dataset_popular_pedvenda(
  Afatu: THw_faturamento; Asel: Boolean): TClientDataSet;
var
  ArecNo: Integer;
  I: Integer;
begin
  Result := Fdata_pedvenda;

  {$REGION 'definindo o dataset do pedvenda'}
  if not Fdata_pedvenda.Active then
  begin
    Fdata_pedvenda.FieldDefs.Add('SEL'         , ftString, 1);
    Fdata_pedvenda.FieldDefs.Add('Sit'         , ftString, 11);
    Fdata_pedvenda.FieldDefs.Add('nped'        , ftInteger);
    Fdata_pedvenda.FieldDefs.Add('tipo'        , ftString, 3);
    Fdata_pedvenda.FieldDefs.Add('data_ped'    , ftDateTime);
    Fdata_pedvenda.FieldDefs.Add('data_fech'   , ftDateTime);
    Fdata_pedvenda.FieldDefs.Add('status_ped'  , ftString, 10);
    Fdata_pedvenda.FieldDefs.Add('num_nf'      , ftInteger);
    Fdata_pedvenda.FieldDefs.Add('valor_total' , ftFloat);     
    Fdata_pedvenda.FieldDefs.Add('sit_nf'      , ftString, 12);
    Fdata_pedvenda.FieldDefs.Add('nome_cliente', ftString, 35);
    Fdata_pedvenda.FieldDefs.Add('razao'       , ftString, 60);
    Fdata_pedvenda.FieldDefs.Add('erros'       , ftMemo, 8);
    Fdata_pedvenda.FieldDefs.Add('indice'      , ftInteger);
    Fdata_pedvenda.CreateDataSet;

    with Fdata_pedvenda do
    begin
      FieldByName('sel').DisplayLabel          := '..';
      FieldByName('Sit').DisplayLabel          := 'Sit';
      FieldByName('nped').DisplayLabel         := 'Numero';
      FieldByName('tipo').DisplayLabel         := 'Tipo';
      FieldByName('data_ped').DisplayLabel     := 'Data ped';
      FieldByName('data_fech').DisplayLabel    := 'Data fech';
      FieldByName('status_ped').DisplayLabel   := 'Status';
      FieldByName('num_nf').DisplayLabel       := 'Numero NF';
      FieldByName('valor_total').DisplayLabel  := 'Valor total';
      FieldByName('nome_cliente').DisplayLabel := 'Nome cliente';
      FieldByName('sit_nf').DisplayLabel       := 'Sit NF';
      FieldByName('razao').DisplayLabel        := 'Razao social';
      FieldByName('erros').Visible             := False;
      FieldByName('indice').Visible            := False;
    end;
    TFloatField(Fdata_pedvenda.FieldByName('valor_total')).DisplayFormat := '#,##0.00';
    Fds_ped.DataSet := Fdata_pedvenda;
  end;
  {$ENDREGION}

  ArecNo := Fdata_pedvenda.RecNo;
  try
    Fdata_pedvenda.DisableControls;      
    Fdata_pedvenda.EmptyDataSet;

    for I := 0 to Pred(Afatu.pedidos.Count) do with Afatu.pedidos.Items[I] do with Fdata_pedvenda do
    begin
      Insert;
      FieldByName('nped').AsInteger        := nped;
      FieldByName('tipo').AsString         := tipo;
      FieldByName('data_ped').AsDateTime   := data_ped;
      FieldByName('status_ped').AsString   := status_ped;
      FieldByName('num_nf').AsInteger      := num_nf;
      FieldByName('valor_total').AsFloat   := valor_total;
      FieldByName('nome_cliente').AsString := cliente.nome_cliente;
      FieldByName('razao').AsString        := cliente.razao;
      FieldByName('erros').AsString        := erros.formato_TStrings.Text;
      FieldByName('sel').AsString          := IfThen(Asel, 'S');
      FieldByName('indice').AsInteger      := I;
      if data_fech > 0 then
        FieldByName('data_fech').AsDateTime := data_fech;
      if erros.Count > 0 then
        FieldByName('Sit').AsString := 'Erro'
      else if status_ped = pv_stsAberta  then
        FieldByName('Sit').AsString := 'Processando'
      else if (status_ped = pv_stsFechada) and (num_nf = 0) then
        FieldByName('Sit').AsString := 'A faturar'
      else if (status_ped = pv_stsFechada) and (num_nf >= 0) then
        FieldByName('Sit').AsString := 'Faturamento';
      if Assigned(nf_base) then
      begin
        FieldByName('sit_nf').AsString := IfThen(nf_base.situacao_nfe <> '', nf_base.situacao_nfe, nf_base.status);
        FieldByName('Sit').AsString := IfThen(nf_base.erros.Count > 0, '*') + FieldByName('Sit').AsString
      end
      else
        FieldByName('Sit').AsString := IfThen(erros.Count > 0, '*') + FieldByName('Sit').AsString;
      Post;
    end;

    if (ArecNo > 0) and (ArecNo <= Fdata_pedvenda.RecordCount) then
      Fdata_pedvenda.RecNo := ArecNo;

  finally
    Fdata_pedvenda.EnableControls;
  end;

end;

destructor TAux_faturamento.Destroy;
begin
  if Assigned(Fdata_pedvenda) then FreeAndNil(Fdata_pedvenda);
  if Assigned(Fdata_notafiscal) then FreeAndNil(Fdata_notafiscal);
  if Assigned(Fds_ped) then FreeAndNil(Fds_ped);
  if Assigned(Fds_nota) then FreeAndNil(Fds_nota);
  if Assigned(Fnf_) then FreeAndNil(Fnf_);
  if Assigned(Fped_) then FreeAndNil(Fped_);
  if Assigned(Ftransporta) then
  begin
    Ftransporta.FreeDbComponents(True);
    FreeAndNil(Ftransporta);
  end;
  inherited;
end;

{ TAux_transporta_class }

function TAux_transporta_class.Abrir(Acodigo_tr: Integer;
  ArestoreValues: Boolean): Boolean;
begin
  if ArestoreValues then
  begin
    Self.placa      := f_str('placa');
    Self.uf_placa   := f_str('uf_placa');
    Self.modalidade := f_int('modalidade');
    Self.rntc       := f_str('rntc');
  end;
  with Self do
  begin

    Result :=
    montaSelect('select %d modalidade, tr.codigo_tr, tr.nome_tr, %s placa, %s uf_placa,' +
                ' %s rntc, tr.cnpj_tr,  tr.ie_tr, tr.end_tr, tr.municipio_tr, tr.uf_tr, es.sigla_uf, %s dados_transp' +
                ' from transportador tr' +
                ' left join estados es on es.codigo_uf = tr.uf_tr' +
                ' where tr.codigo_tr = %d ' +
                ' and tr.cod_empresa = %s ' +
                ' and tr.ativo = 1',
                [modalidade, QuotedStr(IfThen(placa = '', vDadosIni.Space(7), placa)),
                 QuotedStr(IfThen(uf_placa = '', '  ', uf_placa)),
                 QuotedStr(IfThen(rntc = '', vDadosIni.Space(20), rntc)),
                 QuotedStr(vDadosIni.Space(256)), Acodigo_tr, vDadosIni.codEmpresa]);
    if dataSet.IsEmpty then
    begin
      dataSet.Insert;
      dataSet.FieldByName('modalidade').AsInteger := modalidade;
    end
    else
      dataSet.Edit;

    if ArestoreValues then
    begin
      dataSet.FieldByName('modalidade').AsInteger := modalidade;
      dataSet.FieldByName('placa').AsString       := placa;
      dataSet.FieldByName('uf_placa').AsString    := uf_placa;
      dataSet.FieldByName('rntc').AsString        := rntc;
    end;

    Fmodalidade_str := get_modalidade_str(f_int('modalidade'));

    dados_transp := 'Modalidade: ' + Fmodalidade_str;
    if f_int('codigo_tr') > 0 then
      dados_transp := Format('%s - TR: %d - %s - Veic:%s %s - CNPJ:%s - End:%s, %s - %s',
                             [dados_transp, f_int('codigo_tr'), f_str('nome_tr'), f_str('placa'), f_str('uf_placa'),
                             f_str('cnpj_tr'), f_str('end_tr'), f_str('municipio_tr'), f_str('uf_tr')]);
    dataSet.FieldByName('dados_transp').AsString := dados_transp;
  end;
end;

destructor TAux_transporta_class.Destroy;
begin
  if Assigned(Fconf) then FreeAndNil(Fconf);
  inherited;
end;

function TAux_transporta_class.get_modalidade_str(Amodalidade: Integer): string;
begin
  case Amodalidade of
    0 : Result := '0 - Terceiros';
    1 : Result := '1 - Emitente';
    2 : Result := '2 - Destinatário';
    3 : Result := '3 - Transporte próprio Remetente';
    4 : Result := '4 - Transporte próprio Destinatário'
    else
        Result := '9 - Sem frete';
  end;
end;

function TAux_transporta_class.Iniciar: Boolean;
begin
  Fconf := vDadosIni.getConfSisObject('lote_nf_transporta', buscas);
  with Fconf do
  begin
    Self.codigo_tr  := StrToIntDef(ReadString('Transportador', 'Codigo', '0'), 0);
    Self.modalidade := StrToIntDef(ReadString('Transportador', 'Modalidade', '9'), 9);
    Self.placa      := ReadString('Transportador', 'Placa', '');
    Self.uf_placa   := ReadString('Transportador', 'PlacaUF', '');
    Self.rntc       := ReadString('Transportador', 'RNTC', '');
  end;

  Result := Abrir(Self.codigo_tr, False);

  if Self.IsEmpty then
    Insert
  else
    Edit;
end;

function TAux_transporta_class.SalvarConfig: Boolean;
begin
  with Fconf do
  begin
    WriteString('Transportador', 'Codigo'    , IntToStr(f_int('codigo_tr')));
    WriteString('Transportador', 'Modalidade', IntToStr(f_int('modalidade')));
    WriteString('Transportador', 'Placa'     , f_str('placa'));
    WriteString('Transportador', 'PlacaUF'   , f_str('uf_placa'));
    WriteString('Transportador', 'RNTC'      , f_str('rntc'));
  end;
  buscas.Close;
  buscas.SQL.Text := Format('update config_sistema set value1_b = :value1_b where chave = %s and cod_empresa = %d',
                            [QuotedStr(Fconf.chave), Fconf.cod_empresa]);
  buscas.ParamByName('value1_b').AsString := Fconf.value1_b.Text;
  buscas.ExecSQL;
  if buscas.Transaction.InTransaction then
    buscas.Transaction.Commit;

  Result := Iniciar;
end;

function TAux_transporta_class.volumes_pedido_excluir(
  Avolume: TPedvenda_volumes_class): Boolean;
begin
  Result := False;
  try
    SqlExec('delete from pedvenda_volumes' +
            ' where nped = %d and tipo = %s and cod_empresa = %s',
            [Avolume.nped, QuotedStr(Avolume.tipo), vDadosIni.codEmpresa], buscas);
    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      vDadosIni.ShowErro('Erro ao excluir dados do volume. Erro %s', [e.Message]);
      registraErro('TAux_transporta_class.volumes_pedido_excluir ' + e.Message);
    end;
  end;    
end;

function TAux_transporta_class.volumes_pedido_salvar(
  Avolume: TPedvenda_volumes_class): Boolean;
begin
  Result := False;
  try
    buscas.Close;
    buscas.SQL.Text := Format('update or insert into pedvenda_volumes(%s) values (%s) matching (nped, tipo, cod_empresa)',
                              [TPedvenda_volumes_class.GetFieldsSql(),
                              StringReplace(TPedvenda_volumes_class.GetFieldsSql(':'), ':.', ':', [rfReplaceAll])]);
    Avolume.SetValuesInParams(buscas, True).ExecSQL;
    
    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      vDadosIni.ShowErro('Erro ao inserir dados do volume. Erro %s', [e.Message]);
      registraErro('TAux_transporta_class.volumes_pedido_salvar ' + e.Message);
    end;
  end;
end;

{ TfrmCadNF_lote }

procedure TfrmCadNF_lote.PedidosAbertosClick(Sender: TObject);
begin
  inherited;
  try
    Faux.ped_.dataSet.AfterScroll := nil;

    Faux.ped_.checkUnCheckAllRows(False);
    Faux.ped_.filterStr(Format('status_ped <> %s', [QuotedStr(pv_stsFechada)]));
    Faux.ped_.checkUnCheckAllRows(True);
  finally
    Faux.ped_.filterClear;
    Faux.ped_.dataSet.AfterScroll := ped_AfterScroll;
    ped_AfterScroll(Faux.ped_.dataSet);
  end;
end;

procedure TfrmCadNF_lote.PedidosFechadosClick(Sender: TObject);
begin
  inherited;
  try
    Faux.ped_.dataSet.AfterScroll := nil;

    Faux.ped_.checkUnCheckAllRows(False);
    Faux.ped_.filterStr(Format('status_ped = %s', [QuotedStr(pv_stsFechada)]));
    Faux.ped_.checkUnCheckAllRows(True);
  finally
    Faux.ped_.filterClear;
    Faux.ped_.dataSet.AfterScroll := ped_AfterScroll;
    ped_AfterScroll(Faux.ped_.dataSet);
  end;
end;

procedure TfrmCadNF_lote.ped_AfterScroll(DataSet: TDataSet);
var
  I: Integer;
begin
  I := Faux.ped_.f_int('indice');

  if (I < 0) or (I > Pred(Ffatu.pedidos.Count)) then
    Exit;

  if Assigned(Ffatu.pedidos.Items[I].nf_base) then
  begin
    lb_erros_titulo.Caption      := 'Erros do processamento da Nota Fiscal';
    pn_erros_scroll.Visible      := Ffatu.pedidos.Items[I].nf_base.erros.Count > 0;
    memo_erros_scroll.Lines.Text := Ffatu.pedidos.Items[I].nf_base.erros.formato_TStrings.Text;    
  end
  else
  begin
    lb_erros_titulo.Caption      := 'Erros do processamento do Pedido';
    pn_erros_scroll.Visible      := Ffatu.pedidos.Items[I].erros.Count > 0;
    memo_erros_scroll.Lines.Text := Ffatu.pedidos.Items[I].erros.formato_TStrings.Text;
  end;
end;

procedure TfrmCadNF_lote.pn_volumesEnter(Sender: TObject);
begin
  inherited;
  if Assigned(Fvol_aux) then
  begin
    ed_qvol.AsValue  := Fvol_aux.qvol;
    ed_esp.Text      := Fvol_aux.esp;
    ed_marca.Text    := Fvol_aux.marca;
    ed_nvol.Text     := Fvol_aux.nvol;
    ed_pesol.AsValue := Fvol_aux.pesol;
    ed_pesob.AsValue := Fvol_aux.pesob;
  end;
end;

procedure TfrmCadNF_lote.Atualizar1Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  Faux.ped_.dataSet.AfterScroll := nil;
  Faux.ped_.storeRecNo;
  try
    for I := 0 to Pred(Ffatu.pedidos.Count) do with Ffatu.pedidos.Items[I] do
    begin
      vDadosIni.abreStatusProcessamento('Atualizando lista de pedidos', Format('Atualizando pedido %d de %d', [Succ(I), Ffatu.pedidos.Count]), True);

      pedvenda_dados_obter(nped, tipo, False);
    end;
  finally
    Faux.ped_.filterClear;
    grid_ped.Visible := Faux.dataset_popular_pedvenda(Ffatu).RecordCount > 0;
    Faux.ped_.restoreRecNo;
    Faux.ped_.dataSet.AfterScroll := ped_AfterScroll;
    ped_AfterScroll(Faux.ped_.dataSet);
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadNF_lote.BitBtn118Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadNF_lote.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Ffatu.notas.Clear;
  Faux.dataset_popular_notafiscal(Ffatu);
end;

procedure TfrmCadNF_lote.bt_pedidos_faturamentoClick(Sender: TObject);
var
  I: Integer;
  ApedidosAbertos: Boolean;
  Aindexs: array of Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0204', 'VALIDAR', '', 'NOTAFISCAL', '', Ffatu.buscas) then
    Exit;

  tv_nf.Items.Clear;
  Ffatu.erros.Clear;
  Faux.ped_.dataSet.AfterScroll := nil;
  try
    vDadosIni.abreStatusProcessamento('Faturando pedidos..', 'Iniciando', True);

    {$REGION 'inicializando variaveis'}
    Ffatu.auditoria.Clear;
    Ffatu.notas.Clear;
    Ffatu.notas.conf_nf.reset;
    for I := 0 to Ffatu.pedidos.Count - 1 do Ffatu.pedidos.Items[I].nf_base := nil;

    SetLength(Aindexs, 0);
    ApedidosAbertos := False;
    {$ENDREGION}

    Faux.ped_.prepare_loop(Format('sel = %s', [QuotedStr('S')]));

    {$REGION 'selecionando e validando pedidos abertos'}
    Faux.ped_.dataSet.First;
    while not Faux.ped_.dataSet.Eof do
    begin
      for I := 0 to Ffatu.pedidos.Count - 1 do with Ffatu.pedidos.Items[I] do
        if (Faux.ped_.f_int('nped') = nped) and (IndexText(status_ped, [pv_stsAberta, pv_stsFechada]) >= 0) then
        begin
          SetLength(Aindexs, Length(Aindexs) + 1);
          Aindexs[High(Aindexs)] := I;
          if not ApedidosAbertos then ApedidosAbertos := status_ped = pv_stsAberta;
        end;
      Faux.ped_.dataSet.Next;
    end;

    if ApedidosAbertos then
    begin
      vDadosIni.ShowErro('Existem pedidos abertos. Favor confirmar os mesmos antes de faturar');
      Exit;
    end;
    {$ENDREGION}

    {$REGION 'obtendo dados dos pedidos e montando as notas fiscais'}
    for I := Low(Aindexs) to High(Aindexs) do with Ffatu.pedidos.Items[Aindexs[I]] do
    begin
      vDadosIni.abreStatusProcessamento('Faturando pedidos 1 de 6', Format('Obtendo dados dos pedidos %d de %d', [Succ(I), Length(Aindexs)]), True);

      pedvenda_dados_obter(nped, tipo, True);
    end;

    for I := Low(Aindexs) to High(Aindexs) do with Ffatu.pedidos.Items[Aindexs[I]] do
    begin
      vDadosIni.abreStatusProcessamento('Faturando pedidos 2 de 6', Format('Montando notas fiscais %d de %d', [Succ(I), Length(Aindexs)]), True);

      Ffatu.notafiscal_adicionar(Ffatu.pedidos.Items[Aindexs[I]]);
    end;

    Ffatu.volumes_pedido_recalcular;
    {$ENDREGION}

    vDadosIni.fechaStatusProcessamento;

    {$REGION 'abrindo tela para a manutencao'}
    Faux.transporta.Iniciar;
    ck_usar_dados_transporte.Checked := Faux.transporta.conf.value1_f = 1;
    dbt_dados_transp.DataSource      := Faux.transporta._dataSourceOOP;
    bt_change_trnasporta.Enabled     := ck_usar_dados_transporte.Checked;
    dbt_dados_transp.Enabled         := ck_usar_dados_transporte.Checked;
    tv_nf.Items.Clear;
    notafiscal_atualizar_dados_lote(True);

    for I := 0 to Pred(Self.ComponentCount) do
      if Self.Components[I] is TDBEdit then
        if TDBEdit(Self.Components[I]).Parent = pn_transporte then
          TDBEdit(Self.Components[I]).DataSource := Faux.transporta._dataSourceOOP;

    pn_nf_prev.Width  := 880;
    pn_nf_prev.Height := 660;
    bt_pedidos_faturar.Enabled := True;
    vDadosIni.abreForm('Dados para processamento', pn_nf_prev, [ofAlignAllClientWinCtrl, ofBIMinimizeOff, ofStoreMaximized]);
    tv_nf.Items.Clear;
    {$ENDREGION}

  finally
    Faux.ped_.prepare_loop_done;
    //grid_ped.Visible := Faux.dataset_popular_pedvenda(Ffatu).RecordCount > 0;
    Faux.ped_.dataSet.AfterScroll := ped_AfterScroll;
    ped_AfterScroll(Faux.ped_.dataSet);
    bt_erros_show.Visible := Ffatu.erros.Count > 0;
    vDadosIni.fechaStatusProcessamento;
  end;

end;

procedure TfrmCadNF_lote.bt_pedidos_fecharClick(Sender: TObject);
var
  I: Integer;
  AcomErros: Boolean;
  Alist: THw_auditoria_classList;
  Acomponent: TComponent;
begin
  inherited;
  if not vDadosIni.PesqPros('VND247', 'CONFIRMAR', '', 'PEDVENDA', '', Ffatu.buscas) then
    Exit;

  Ffatu.erros.Clear;
  aux.ped_.dataSet.AfterScroll := nil;
  try
    vDadosIni.abreStatusProcessamento('Fechando pedidos - Validando 1 de 3', 'Iniciando', True);

    Ffatu.processos.build_processos_todos;
    Ffatu.auditoria.Clear;

    Faux.ped_.storeRecNo;
    Faux.ped_.dataSet.DisableControls;
    Faux.ped_.filterStr('sel = %s and status_ped <> %s', [QuotedStr('S'),QuotedStr(pv_stsFechada)]);
    Faux.ped_.dataSet.First;
    while not Faux.ped_.dataSet.Eof do
    begin
      vDadosIni.statusProcessamento('Pedido %d de %d', [Faux.ped_.dataSet.RecNo, Faux.ped_.dataSet.RecordCount]);

      for I := 0 to Ffatu.pedidos.Count - 1 do with Ffatu.pedidos.Items[I] do
        if (Faux.ped_.f_int('nped') = nped) and (status_ped = '') then
        begin
          pedvenda_dados_obter(nped, tipo, True);
          if (status_ped = '') then
            if pedvenda_fechamento_validar.erros.Count > 0 then
              Faux.dataset_edit_pedvenda(Ffatu.pedidos.Items[I]);
        end;
      Faux.ped_.dataSet.Next;
    end;

    if Faux.ped_.dataSet.IsEmpty then
      Ffatu.erros.New('Nenhum registro selecionado');

    if Ffatu.auditoria.Count > 0 then
    begin
      Alist := Ffatu.auditoria;
      try
        if not vDadosIni.PesqPros(Alist, Ffatu.buscas) then
          Ffatu.erros.New('Erro na validação dos de permissões dos processos');

        AcomErros := False;
        for I := 0 to Ffatu.auditoria.Count - 1 do with Ffatu.auditoria.Items[I] do
          if status <> 'Liberado' then
          begin
            Ffatu.erros.New('Processo %s nao permitido para o usuario', [cod_processo]).
              detalhe := Format('Ação/Mensagem: %s - %s', [acao, mensagem]);
            AcomErros := True;
          end;
        if AcomErros then
        begin
          vDadosIni.ShowAtencao('Pedidos não podem ser fechados. Existem processos não autorizados' + sLineBreak +
                                Ffatu.erros.formato_string(10));
          Exit;
        end;
      finally
        Ffatu.auditoria := Alist;
      end;
    end;

    if Ffatu.erros.Count > 0 then
    begin
      if vDadosIni.ShowConfirmacao('Um ou mais pedidos não podem ser fechados. Continuar com os demais?' + sLineBreak +
                                   Ffatu.erros.formato_string(10)) <> ID_YES then
        Exit;
    end;

    vDadosIni.abreStatusProcessamento('Fechando pedidos - Salvando 2 de 3', '...', True);
    Faux.ped_.dataSet.First;
    while not Faux.ped_.dataSet.Eof do
    begin
      vDadosIni.statusProcessamento('Pedido %d de %d', [Faux.ped_.dataSet.RecNo, Faux.ped_.dataSet.RecordCount]);
      for I := 0 to Ffatu.pedidos.Count - 1 do with Ffatu.pedidos.Items[I] do
        if (Faux.ped_.f_int('nped') = nped) and (status_ped = '') then
          if pedvenda_fechamento_executar(True).erros.Count > 0 then
            Faux.dataset_edit_pedvenda(Ffatu.pedidos.Items[I]);

      Faux.ped_.dataSet.Next;
    end;

    vDadosIni.abreStatusProcessamento('Fechando pedidos - Atualizando 3 de 3', '...', True);
    for I := 0 to Ffatu.pedidos.Count - 1 do if Ffatu.pedidos.Items[I].erros.Count = 0 then
    begin
      vDadosIni.statusProcessamento('Atualizando tela, Pedido %d de %d', [Succ(I), Ffatu.pedidos.Count]);
      Ffatu.pedidos.Items[I].pedvenda_dados_obter(Ffatu.pedidos.Items[I].nped, Ffatu.pedidos.Items[I].tipo,  False);
    end;

    if Self.FormStyle = fsMDIChild then
      for I := 0 to Pred(Application.MainForm.MDIChildCount) do
        if Application.MainForm.MDIChildren[I].Name = 'FrmCadPedVenda' then
        begin
          Acomponent := Application.MainForm.MDIChildren[I].FindComponent('DBGrid1');
          if Assigned(Acomponent) then
            if Assigned(TDBGrid(Acomponent).DataSource) then with TDBGrid(Acomponent).DataSource do
              if Assigned(DataSet) then
                if DataSet.Active then
                  if DataSet.State = dsBrowse then
                  begin
                    if DataSet is TClientDataSet then
                      TClientDataSet(DataSet).CancelUpdates;
                    DataSet.Refresh;
                  end;
          Break;
        end;

  finally
    Faux.ped_.filterClear;
    grid_ped.Visible := Faux.dataset_popular_pedvenda(Ffatu, Ffatu.erros.Count = 0).RecordCount > 0;
    Faux.ped_.restoreRecNo;
    Faux.ped_.dataSet.AfterScroll := ped_AfterScroll;
    ped_AfterScroll(Faux.ped_.dataSet);
    Faux.ped_.dataSet.EnableControls;
    bt_erros_show.Visible := Ffatu.erros.Count > 0;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadNF_lote.bt_prev_nf_cancelClick(Sender: TObject);
begin
  inherited;
  tv_nf.Items.Clear;
end;

procedure TfrmCadNF_lote.bt_tv_refreshClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  tv_nf.Items.Clear;
  for I := 0 to Ffatu.notas.Count - 1 do
    notafiscal_make_tv(Ffatu.notas.Items[I]);
end;

procedure TfrmCadNF_lote.bt_volumes_deleteClick(Sender: TObject);
begin
  if Assigned(Fvol_aux) then
    if Fvol_aux.cod_empresa = StrToInt(vDadosIni.codEmpresa) then
      Fvol_aux.cod_empresa := -1;
  inherited;
end;

procedure TfrmCadNF_lote.bt_volumes_saveClick(Sender: TObject);
begin
  if Assigned(Fvol_aux) then
  begin
    if Fvol_aux.cod_empresa = 0 then
      Fvol_aux.cod_empresa := StrToInt(vDadosIni.codEmpresa);
    Fvol_aux.qvol  := ed_qvol.AsInteger;
    Fvol_aux.esp   := ed_esp.Text;
    Fvol_aux.marca := ed_marca.Text;
    Fvol_aux.nvol  := ed_nvol.Text;
    Fvol_aux.pesol := ed_pesol.AsValue;
    Fvol_aux.pesob := ed_pesob.AsValue;
  end;
  inherited;
end;

procedure TfrmCadNF_lote.ck_usar_dados_transporteClick(Sender: TObject);
begin
  inherited;
  bt_change_trnasporta.Enabled := ck_usar_dados_transporte.Checked;
  dbt_dados_transp.Enabled     := ck_usar_dados_transporte.Checked;
  tv_nf.Items.Clear;
  notafiscal_atualizar_dados_lote(True);
end;

procedure TfrmCadNF_lote.Configuraao1Click(Sender: TObject);
begin
  inherited;
  Ffatu.notas.conf_nf.ExecutarConferenciaVariaveis;
  vDadosIni.configurarSistema('nf_s_lote_%', Ffatu.buscas);
end;

procedure TfrmCadNF_lote.ed_codigo_trExit(Sender: TObject);
begin
  inherited;
  Faux.transporta.Abrir(Faux.transporta.f_int('codigo_tr'));
end;

procedure TfrmCadNF_lote.ed_codigo_trKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('TRANSPORTADOR');

    Faux.transporta.Abrir(StrToIntDef(vDadosIni.vPesquisa, 0));
  end;
end;

procedure TfrmCadNF_lote.ed_data_saidaExit(Sender: TObject);
var
  Adt, Ahr: TDateTime;
begin
  inherited;
  if TryStrToDate(ed_data_saida.Text, Adt) then
    if not TryStrToTime(ed_hora_saida.Text, Ahr) then
      ed_hora_saida.Text := FormatDateTime('hh:mm:ss', Time + EncodeTime(1, 0, 0, 0));
end;

procedure TfrmCadNF_lote.bt_pedidos_faturarClick(Sender: TObject);
var
  I: Integer;
  AcomErros, ApedidosAbertos, ArefreshPedidos: Boolean;
  Alist: THw_auditoria_classList;
  Aindexs: array of Integer;
  Anfs: array of Integer;
  Anfe_email: Tnfe_email;
  Anfe_imprimir: Tnfe_imprimir;
  AstrWide: WideString;
  AdthrE, AdthrS, Adt, Ahr: TDateTime;
  Acomponent: TComponent;
begin
  inherited;

  Adt := 0;
  Ahr := 0;
  TryStrToDate(ed_data_saida.Text, Adt);
  TryStrToTime(ed_hora_saida.Text, Ahr);

  if not vDadosIni.PesqPros('NF0204', 'INCLUIR', '', 'NOTAFISCAL', '', Ffatu.buscas) then
    Exit;

  ArefreshPedidos := False;

  Ffatu.erros.Clear;
  Faux.ped_.dataSet.AfterScroll := nil;
  try
    vDadosIni.abreStatusProcessamento('Faturando pedidos..', 'Iniciando', True);

    Ffatu.auditoria.Clear;
    Ffatu.notas.Clear;
    Ffatu.notas.conf_nf.reset;
    for I := 0 to Ffatu.pedidos.Count - 1 do Ffatu.pedidos.Items[I].nf_base := nil;

    SetLength(Aindexs, 0);
    ApedidosAbertos := False;

    Faux.ped_.storeRecNo;
    Faux.ped_.filterStr('sel = %s', [QuotedStr('S')]);

    {$REGION 'selecionando e validando pedidos abertos'}
    Faux.ped_.dataSet.First;
    while not Faux.ped_.dataSet.Eof do
    begin
      for I := 0 to Ffatu.pedidos.Count - 1 do with Ffatu.pedidos.Items[I] do
        if (Faux.ped_.f_int('nped') = nped) and (IndexText(status_ped, [pv_stsAberta, pv_stsFechada]) >= 0) then
        begin
          SetLength(Aindexs, Length(Aindexs) + 1);
          Aindexs[High(Aindexs)] := I;
          if not ApedidosAbertos then ApedidosAbertos := status_ped = pv_stsAberta;
        end;
      Faux.ped_.dataSet.Next;
    end;

    if ApedidosAbertos then
    begin
      vDadosIni.ShowErro('Existem pedidos abertos. Favor confirmar os mesmos antes de faturar');
      Exit;
    end;
    {$ENDREGION}

    {$REGION 'obtendo dados dos pedidos e montando as notas fiscais'}
    for I := Low(Aindexs) to High(Aindexs) do with Ffatu.pedidos.Items[Aindexs[I]] do
    begin
      vDadosIni.abreStatusProcessamento('Faturando pedidos 1 de 6', Format('Obtendo dados dos pedidos %d de %d', [Succ(I), Length(Aindexs)]), True);

      pedvenda_dados_obter(nped, tipo, True);
    end;

    Ffatu.gerar_lote_faturamento;
    for I := Low(Aindexs) to High(Aindexs) do with Ffatu.pedidos.Items[Aindexs[I]] do
    begin
      vDadosIni.abreStatusProcessamento('Faturando pedidos 2 de 6', Format('Montando notas fiscais %d de %d', [Succ(I), Length(Aindexs)]), True);

      Ffatu.notafiscal_adicionar(Ffatu.pedidos.Items[Aindexs[I]]);
    end;

    {$REGION 'usando dados de transporte e outros da tela do lote'}
    //if (vDadosIni.vEmp.vNfe.modeloNF = '55') then
      for I := 0 to Ffatu.notas.Count - 1 do with Ffatu.notas.Items[I] do
      begin
        data_ent_saida := 0;
        hora_ent_saida := 0;
        if (Adt > 0) and (Ahr > 0) then
        begin
          AdthrS := Adt + Ahr;
          AdthrE := data_contabil + StrToTime(hora_emissao);
          if AdthrS < AdthrE  then
            Ffatu.erros.New('Data de saída %s menor que a data da emissão %s',
                            [FormatDateTime('DD/MM/YYYY hh:nn:ss', AdthrS),
                             FormatDateTime('DD/MM/YYYY hh:nn:ss', AdthrE)])
          else
          begin
            data_ent_saida := DateOf(Adt);
            hora_ent_saida := TimeOf(Ahr);
          end;
        end
        else if (Adt > 0) or (Ahr > 0) then
          Ffatu.erros.New('Quando preencher o campo de data de saída preencher também a hora e vice versa');

        if (ck_usar_dados_transporte.Checked) then
        begin
          freteconta_tr := Faux.transporta.f_str('modalidade');
          codigo_tr     := Faux.transporta.f_int('codigo_tr');
          if nfe_iddest <> '2' then
          begin
            placa_tr      := Faux.transporta.f_str('placa');
            uf_placa_tr   := Faux.transporta.f_str('uf_placa');
          end;
        end;
      end;
    {$ENDREGION}

    if Ffatu.erros.Count > 0 then
    begin
      vDadosIni.ShowErro(Ffatu.erros.formato_string(10));
      Exit;
    end;

    if vDadosIni.vEmp.vNfe.modeloNF = '55' then
      for I := 0 to Ffatu.notas.Count - 1 do with Ffatu.notas.Items[I] do
      begin
        with Ffatu.auditoria.New do
        begin
          cod_processo := 'HW512';
          acao         := 'ENVIAR';
          mensagem     := Format('LOTE FAT %d PEDIDO %s %d', [Ffatu.loteprcs, tipo_ped, nped]);
          tabela       := 'NOTAFISCAL';
          codigo       := IntToStr(Ffatu.loteprcs);
          gravar       := True;
        end;
        with Ffatu.auditoria.New do
        begin
          cod_processo := 'HW520';
          acao         := 'ENVIAR';
          mensagem     := Format('LOTE FAT %d PEDIDO %s %d', [Ffatu.loteprcs, tipo_ped, nped]);
          tabela       := 'NOTAFISCAL';
          codigo       := IntToStr(Ffatu.loteprcs);
          gravar       := True;
        end;
        with Ffatu.auditoria.New do
        begin
          cod_processo := 'HW516';
          acao         := 'IMPRIMIR';
          mensagem     := Format('LOTE FAT %d PEDIDO %s %d', [Ffatu.loteprcs, tipo_ped, nped]);
          tabela       := 'NOTAFISCAL';
          codigo       := IntToStr(Ffatu.loteprcs);
          gravar       := True;
        end;
      end;
    {$ENDREGION}

    {$REGION 'auditoria'}
    if Ffatu.auditoria.Count > 0 then
    begin
      Alist := Ffatu.auditoria;
      try
        if not vDadosIni.PesqPros(Alist, Ffatu.buscas) then
          Ffatu.erros.New('Erro na validação dos de permissões dos processos');

        for I := 0 to Ffatu.auditoria.Count - 1 do with Ffatu.auditoria.Items[I] do
          if status <> 'Liberado' then
            Ffatu.erros.New('Processo %s nao permitido para o usuario', [cod_processo]).
              detalhe := Format('Ação/Mensagem: %s - %s', [acao, mensagem]);
      finally
        Ffatu.auditoria := Alist;
      end;
    end;

    if Ffatu.erros.Count > 0 then
    begin
      vDadosIni.ShowErro(Ffatu.erros.formato_string(10));
      Exit;
    end;
    {$ENDREGION}

    bt_pedidos_faturar.Enabled := False;
    ArefreshPedidos            := True;

    {$REGION 'gravando notas fiscais no banco de dados'}
    for I := 0 to Ffatu.notas.Count - 1 do with Ffatu.notas.Items[I] do
    begin
      vDadosIni.abreStatusProcessamento('Faturando pedidos 3 de 6', Format('Salvando notas fiscais %d de %d', [Succ(I), Ffatu.notas.Count]), True);

      if erros.Count = 0 then
        salvar(False)
      else
      begin

        if Ffatu.Transacao.InTransaction then
          Ffatu.Transacao.Rollback;

        vDadosIni.ShowErro(Ffatu.erros.formato_string(10));
        Exit;
      end;

    end;
    if Ffatu.erros.Count > 0 then
    begin
      vDadosIni.ShowErro(Ffatu.erros.formato_string(10));
      Exit;
    end;

    for I := Low(Aindexs) to High(Aindexs) do
    begin
      vDadosIni.abreStatusProcessamento('Faturando pedidos 4 de 6', Format('Salvando dados da nota fiscal nos pedidos %d de %d', [Succ(I), Length(Aindexs)]), True);;
      Ffatu.pedidos.Items[Aindexs[I]].pedvenda_dados_nf_salvar(False);
    end;

    if Ffatu.Transacao.InTransaction then
      Ffatu.Transacao.Commit;

    for I := 0 to Ffatu.notas.Count - 1 do with Ffatu.notas.Items[I] do
      if erros.Count = 0 then
      begin
        vDadosIni.GravaAuditoria('NF0031', 'SALVAR'   , Format('SALVA NUM NF %d LOTE FAT %d PEDIDO %s %d', [num_nf,lote_fat, tipo_ped, nped]), tb_nf, IntToStr(cod_nf), Ffatu.buscas);
        vDadosIni.GravaAuditoria('NF0033', 'CONFIRMAR', Format('CONFIRMADA NUM NF %d LOTE FAT %d PEDIDO %s %d', [num_nf,lote_fat, tipo_ped, nped]), tb_nf, IntToStr(cod_nf), Ffatu.buscas);
      end;
    {$ENDREGION}

    {$REGION 'envio NF-e'}
    if vDadosIni.vEmp.vNfe.modeloNF = '55' then
    begin
      if hdNFE = 0 then
        carregaDLLNfe;
      if hdNFE > 0 then
      begin
        vDadosIni.GravaAuditoria('HW512', 'ENVIAR', Format('LOTE FAT %d QTDE %d', [Ffatu.loteprcs, Length(Anfs)]), tb_nf, '', Ffatu.buscas);

        vDadosIni.abreStatusProcessamento('Faturando pedidos 5 de 6', 'Enviando NF-e', True);
        SetLength(Anfs, Ffatu.notas.Count);
        for I := 0 to Pred(Ffatu.notas.Count) do
          Anfs[I] := Ffatu.notas.Items[I].cod_nf;


        if not DFeHwLib.Autorizar(Anfs, AstrWide) then
          if Trim(AstrWide) <> '' then
            Ffatu.erros.New(AstrWide);

        Ffatu.SqlOpen('select cod_nf, situacao_nfe, nfe_cstat, descricaoerro from notafiscal' +
                      ' where lote_fat = %d and cod_empresa = %s',
                      [Ffatu.loteprcs, vDadosIni.codEmpresa], Ffatu.buscas).First;
        while not Ffatu.buscas.Eof do
        begin
          for I := 0 to Pred(Ffatu.notas.Count) do with Ffatu.notas.Items[I] do
            if Ffatu.buscas.FieldByName('cod_nf').AsInteger = cod_nf then
              SetValuesFrom(Ffatu.buscas, True);

          Ffatu.buscas.Next;
        end;

        SetLength(Anfs, 0);
        for I := 0 to Pred(Ffatu.notas.Count) do with Ffatu.notas.Items[I] do
          if situacao_nfe = sitAutorizada then
          begin
            SetLength(Anfs, Length(Anfs) + 1);;
            Anfs[High(Anfs)] := cod_nf;
          end
          else if nfe_cstat <> 0 then
            erros.New('Rejeição %d - %s', [nfe_cstat, descricaoerro]);

        if Length(Anfs) > 0 then
        begin
          Anfe_email := GetProcAddress(hdNFE, PChar('nfe_email'));
          if Assigned(@Anfe_email) then
            if not Anfe_email(Anfs, False, False, True, True, '', '', StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, vDadosIni.vNomeUsuario, AstrWide) then
              if Trim(AstrWide) <> '' then
                Ffatu.erros.New(AstrWide);

          Anfe_imprimir := GetProcAddress(hdNFE, PChar('nfe_imprimir'));
          if Assigned(@Anfe_imprimir) then
            if not Anfe_imprimir(Anfs, True, False, '', StrToInt(vDadosIni.codEmpresa), vDadosIni.vBancoHW, AstrWide) then
              if Trim(AstrWide) <> '' then
                Ffatu.erros.New(AstrWide);
        end;
      end
      else
        vDadosIni.ShowErro('%s. Porém o sistema não conseguiu prosseguir com o envio. Acesse o módulo da NF-e e prossiga', [IfThen(Ffatu.notas.Count > 1, 'Notas fiscais geradas', 'Nota fiscal gerada')]);
    end;
    {$ENDREGION}

    {$REGION 'atualizando registros em tela'}
    for I := Low(Aindexs) to High(Aindexs) do with Ffatu.pedidos.Items[Aindexs[I]] do
    begin
      vDadosIni.abreStatusProcessamento('Faturando pedidos 6 de 6', Format('Atualizando dados em tela %d de %d', [Succ(I), Length(Aindexs)]), True);

      pedvenda_dados_obter(nped, tipo, False);
    end;
    {$ENDREGION}

    if Self.FormStyle = fsMDIChild then
      for I := 0 to Pred(Application.MainForm.MDIChildCount) do
        if Application.MainForm.MDIChildren[I].Name = 'FrmCadPedVenda' then
        begin
          Acomponent := Application.MainForm.MDIChildren[I].FindComponent('DBGrid1');
          if Assigned(Acomponent) then
            if Assigned(TDBGrid(Acomponent).DataSource) then with TDBGrid(Acomponent).DataSource do
              if Assigned(DataSet) then
                if DataSet.Active then
                  if DataSet.State = dsBrowse then
                  begin
                    if DataSet is TClientDataSet then
                      TClientDataSet(DataSet).CancelUpdates;
                    DataSet.Refresh;
                  end;
          Break;
        end;

  finally
    {$REGION 'atualizando dados do treeview'}  
    tv_nf.Items.Clear;
    notafiscal_make_tv(Ffatu);
    for I := 0 to Ffatu.notas.Count - 1 do
      notafiscal_make_tv(Ffatu.notas.Items[I]);
    if Ffatu.erros.Count > 0 then
      notafiscal_make_tv(Ffatu.erros);    
    {$ENDREGION}
    Faux.ped_.filterClear;
    if ArefreshPedidos then
      grid_ped.Visible := Faux.dataset_popular_pedvenda(Ffatu).RecordCount > 0;
    Faux.ped_.restoreRecNo;
    Faux.ped_.dataSet.AfterScroll := ped_AfterScroll;
    ped_AfterScroll(Faux.ped_.dataSet);
    bt_erros_show.Visible := Ffatu.erros.Count > 0;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadNF_lote.btSelectAllClick(Sender: TObject);
begin
  inherited;
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadNF_lote.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if Assigned(Faux) then FreeAndNil(Faux);
  if Assigned(Ffatu) then FreeAndNil(Ffatu);

  Action := caFree;
  frmCadNF_lote := nil;
  inherited;
end;

procedure TfrmCadNF_lote.FormCreate(Sender: TObject);
begin
//  FormStyle := fsMDIChild;
  Faux := TAux_faturamento.Create;
  Ffatu := THw_faturamento.Create;
  ts_pedidos.TabVisible := False;
  ts_notas.TabVisible := False;
  ts_erros.TabVisible := False;
  ts_modais.TabVisible := False;
  pages.ActivePage := ts_pedidos;
  inherited;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadNF_lote.grid_pedCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if Assigned(Faux.ped_) then
      if Assigned(Faux.ped_.dataSet) then
        Faux.ped_.checkUnCheckRow();
end;

procedure TfrmCadNF_lote.grid_pedDblClick(Sender: TObject);
var
  I: Integer;
  J: Integer;
begin
  inherited;

  Faux.ped_.checkUnCheckRow();

end;

procedure TfrmCadNF_lote.grid_pedDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;
  if (Faux.ped_.f_str('sel') = 'S') and (not (gdFocused in State)) then
  begin
    Agrid := TDBGrid(Sender);
    Agrid.Canvas.Brush.Color := clHighlight;
    Agrid.Canvas.Font.Color  := clHighlightText;
    Agrid.DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    Agrid := TDBGrid(Sender);
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadNF_lote.grid_pedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key in [VK_RETURN, VK_SPACE] then
    if Assigned(Faux.ped_) then
      if Assigned(Faux.ped_.dataSet) then
        Faux.ped_.checkUnCheckRow();
end;

procedure TfrmCadNF_lote.grid_pedMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ssCtrl in Shift then
    if Assigned(Faux.ped_) then
      if Assigned(Faux.ped_.dataSet) then
        Faux.ped_.checkUnCheckRow();
end;

procedure TfrmCadNF_lote.Limpartela1Click(Sender: TObject);
begin
  inherited;

  Ffatu.pedidos.Clear;
  Ffatu.notas.Clear;
  Ffatu.erros.Clear;
  Faux.dataset_popular_pedvenda(Ffatu);

  bt_erros_show.Visible := False;
end;

procedure TfrmCadNF_lote.notafiscal_atualizar_dados_lote(AchangeTreeView: Boolean);
var
  AdthrE, AdthrS, Adt, Ahr: TDateTime;
  I: Integer;
begin
  TryStrToDate(ed_data_saida.Text, Adt);
  TryStrToTime(ed_hora_saida.Text, Ahr);

  //if (vDadosIni.vEmp.vNfe.modeloNF = '55') then
    for I := 0 to Ffatu.notas.Count - 1 do with Ffatu.notas.Items[I] do
    begin
      if (Adt > 0) and (Ahr > 0) then
      begin
        AdthrS := Adt + Ahr;
        AdthrE := data_contabil + StrToTime(hora_emissao);
        if AdthrS < AdthrE  then
        else
        begin
          data_ent_saida := DateOf(Adt);
          hora_ent_saida := TimeOf(Ahr);
        end;
      end
      else if (Adt > 0) or (Ahr > 0) then
      else
      begin
        data_ent_saida := 0;
        hora_ent_saida := 0;
      end;

      if (ck_usar_dados_transporte.Checked) then
      begin
        freteconta_tr := Faux.transporta.f_str('modalidade');
        codigo_tr     := Faux.transporta.f_int('codigo_tr');
        if nfe_iddest <> '2' then
        begin
          placa_tr      := Faux.transporta.f_str('placa');
          uf_placa_tr   := Faux.transporta.f_str('uf_placa');
        end;
      end
      else
      begin
        restore_frete_conta_tr;
        codigo_tr     := 0;
        placa_tr      := '';
        uf_placa_tr   := '';
      end;
    end;
  if AchangeTreeView then
    for I := 0 to Ffatu.notas.Count - 1 do
      notafiscal_make_tv(Ffatu.notas.Items[I]);
end;

procedure TfrmCadNF_lote.notafiscal_make_tv(Sender: TObject);
var
  Anf: THw_notafiscal_class;
  Ait: THw_notafiscal_item_class;
  Aerros: THw_erro_classList;
  Aprods: THw_produtos_tmp_classList;
  Alevel0, Alevel1, Alevel2: TTreeNode;
  I, J, Acount_Ger, Acount_Aut: Integer;
  Alist: TStrings;
  Abols: Boolean;
  strFinalidade: string;
begin
  if not Assigned(Sender) then
  begin
    tv_nf.Items.AddChild(nil, 'Sem dados para apresentar. Contacte o suporte técnico');
  end
  else if Sender = Ffatu then
  begin
    Acount_Ger := 0;
    Acount_Aut := 0;
    Abols := False;
    for I := 0 to Pred(Ffatu.notas.Count) do with Ffatu.notas.Items[I] do
    begin
      if cod_nf > 0 then
        Acount_Ger := Acount_Ger + 1;
      if situacao_nfe = sitAutorizada then
        Acount_Aut := Acount_Aut + 1;

      if not Abols then
        for J := 0 to Pred(dup.Count) do
          if Abols then
            Break
          else if dup.Items[J].n_seq_bol > 0 then
            Abols := True;
    end;
    Alevel0 := tv_nf.Items.AddChild(nil, Format('Final de processamento [Lote:%d]', [Ffatu.loteprcs ]));
    tv_nf.Items.AddChild(Alevel0, Format('Total de erros....: %d', [Ffatu.erros.Count]));
    tv_nf.Items.AddChild(Alevel0, Format('Notas Geradas.....: %d', [Acount_Ger]));
    tv_nf.Items.AddChild(Alevel0, Format('Notas Autorizadas.: %d', [Acount_Aut]));
    if Ffatu.erros.Count > 0 then
      tv_nf.Items.AddChild(Alevel0, '**** Consulte o final dessa lista para analisar os erros ocorridos ****');
    if Abols then
      tv_nf.Items.AddChild(Alevel0, '**** O sistema encontrou boletos durante o processamento. A impressão e envio do email deve ser feito pelo módulo de boletos ****');
    Alevel0.Expand(False);
  end
  else if Sender is THw_notafiscal_class then
  begin
    Anf := THw_notafiscal_class(Sender);

    if Anf.finalidadeid > 0 then
      strFinalidade := IntToStr(Anf.finalidadeid) + ' - ' +
        Ffatu.SqlScalar('select descricao from finalidade where id = %d and cod_empresa = %d', [Anf.finalidadeid, vDadosIni.cod_empresa]).AsString
    else
      strFinalidade := '';

    Alevel0 := tv_nf.Items.AddChild(nil, Format('NF ->' +
                                                IfThen(Anf.nped > 0, Format(' [%s:%d]',[Anf.tipo_ped, Anf.nped])) +
                                                IfThen(Anf.num_nf > 0, Format(' [Num: %d - %s]',[Anf.num_nf, Anf.situacao_nfe])) +
                                                ' [R$ %n] [Itens: %d] [%s]' +
                                                IfThen(Anf.qtde_volumes_tr > 0, Format(' [Volumes: %d-%s]',[Anf.qtde_volumes_tr, Anf.especie_tr])) +
                                                ' [Erros:%d]',
                                                [Anf.valor_total, Anf.itens.Count, Copy(Faux.transporta.get_modalidade_str(StrToIntDef(Anf.freteconta_tr, 9)), 1, 15),
                                                 Anf.erros.Count]));

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
    Alevel1 := tv_nf.Items.AddChild(Alevel0, Format('Total [%n]', [Anf.valor_total]));
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
    tv_nf.Items.AddChild(Alevel1, Format('*ICMS Desonerado....: %n', [Anf.vicmdeson]));
    tv_nf.Items.AddChild(Alevel1, Format('*PIS Desonerado.....: %n', [Anf.vpisdeson]));
    tv_nf.Items.AddChild(Alevel1, Format('*COFINS Desonerado..: %n', [Anf.vcofinsdeson]));
    tv_nf.Items.AddChild(Alevel1, Format('Val Aprox tributos..: %n', [Anf.vtottrib]));
    tv_nf.Items.AddChild(Alevel1, Format('ICMS Inter Dest.....: %n', [Anf.vicmsufdest]));
    tv_nf.Items.AddChild(Alevel1, Format('ICMS Inter Rem......: %n', [Anf.vicmsufremet]));
    tv_nf.Items.AddChild(Alevel1, Format('FCP Inter Dest......: %n', [Anf.vfcpufdest]));
    tv_nf.Items.AddChild(Alevel1, Format('FCP.................: %n', [Anf.fcp_vfcp]));
    tv_nf.Items.AddChild(Alevel1, Format('*FCP ST.............: %n', [Anf.fcp_vfcpst]));
    tv_nf.Items.AddChild(Alevel1, Format('FCP ST Ant..........: %n', [Anf.fcp_vfcpstret]));
    tv_nf.Items.AddChild(Alevel1, Format('Frete por conta.....: %s', [Faux.transporta.get_modalidade_str(StrToIntDef(Anf.freteconta_tr, 9))]));
    tv_nf.Items.AddChild(Alevel1, Format('Consumidor Final....: %s', [IfThen(Anf.consumidor_final = 'S', 'Sim', 'Não')]));
    tv_nf.Items.AddChild(Alevel1, Format('Indicador de IE.....: %d', [Anf.nfe_indiedest]));
    tv_nf.Items.AddChild(Alevel1, Format('Finalidade..........: %s', [strFinalidade]));
    if Anf.data_ent_saida > 0 then
      tv_nf.Items.AddChild(Alevel1, Format('Data e hora de saída: %s', [FormatDateTime('DD/MM/YYYY hh:nn:ss', Anf.data_ent_saida + Anf.hora_ent_saida)]));
    if Anf.obs.Text <> '' then
      tv_nf.Items.AddChild(Alevel1, Format('Observações.........: %s', [Anf.obs.Text]));
    if Anf.inf_compl.Count > 0 then
    begin
      Alevel2 := tv_nf.Items.AddChild(Alevel1, Format('Dados adicionais fisco', [Anf.dados_interesse_fisco.Text]));
      for I := 0 to Pred(Anf.inf_compl.Count) do
        tv_nf.Items.AddChild(Alevel2, Anf.inf_compl.Items[I].txt_compl);
    end;

    Alevel1 := tv_nf.Items.AddChild(Alevel0, Format('Itens da nota - [Qtde:%d]', [Anf.itens.Count]));
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
      tv_nf.Items.AddChild(Alevel2, Format('*ICMS Desonerado....: %n', [Ait.vicmdeson]));;
      tv_nf.Items.AddChild(Alevel2, Format('*PIS Desonerado.....: %n', [Ait.vpisdeson]));;
      tv_nf.Items.AddChild(Alevel2, Format('*COFINS Desonerado..: %n', [Ait.vcofinsdeson]));
      tv_nf.Items.AddChild(Alevel2, Format('Val Aprox tributos..: %n', [Ait.vtottrib]));
      tv_nf.Items.AddChild(Alevel2, Format('ICMS Inter Dest.....: %n', [Ait.vicmsufdest]));
      tv_nf.Items.AddChild(Alevel2, Format('ICMS Inter Rem......: %n', [Ait.vicmsufremet]));
      tv_nf.Items.AddChild(Alevel2, Format('FCP Inter Dest......: %n', [Ait.vfcpufdest]));
      tv_nf.Items.AddChild(Alevel2, Format('FCP.................: %n', [Ait.fcp_vfcp]));
      tv_nf.Items.AddChild(Alevel2, Format('*FCP ST.............: %n', [Ait.fcp_vfcpst]));
      tv_nf.Items.AddChild(Alevel2, Format('FCP ST Ant..........: %n', [Ait.fcp_vfcpstret]));
    end;
    Alevel1 := tv_nf.Items.AddChild(Alevel0, Format('Transporte - [Frete conta: %s]', [Faux.transporta.get_modalidade_str(StrToIntDef(Anf.freteconta_tr, 9))]));
    if ck_usar_dados_transporte.Checked then with Faux.transporta do
    begin
      tv_nf.Items.AddChild(Alevel1, Format('Transportador.......: %s', [f_str('nome_tr')]));
      tv_nf.Items.AddChild(Alevel1, Format('CNPJ/CPF............: %s', [f_str('cnpj_tr')]));
      tv_nf.Items.AddChild(Alevel1, Format('Veículo.............: %s - %s', [f_str('placa'), f_str('uf_placa')]));
      tv_nf.Items.AddChild(Alevel1, Format('Endereco............: %s', [f_str('end_tr')]));
      tv_nf.Items.AddChild(Alevel1, Format('Cidade/UF...........: %s - %s', [f_str('municipio_tr'), f_str('sigla_uf')]));
    end;

    Alevel1 := tv_nf.Items.AddChild(Alevel0, Format('Volumes da nota fiscal [Qt: %d - %s]', [Anf.qtde_volumes_tr, Anf.especie_tr]));
    tv_nf.Items.AddChild(Alevel1, Format('Quantidade............: %d', [Anf.qtde_volumes_tr]));
    tv_nf.Items.AddChild(Alevel1, Format('Espécie...............: %s', [Anf.especie_tr]));
    tv_nf.Items.AddChild(Alevel1, Format('Marca.................: %s', [Anf.marca_tr]));
    tv_nf.Items.AddChild(Alevel1, Format('Numeração.............: %s', [Anf.numero_tr]));
    tv_nf.Items.AddChild(Alevel1, Format('Peso Bruto............: %n', [Anf.peso_b]));
    tv_nf.Items.AddChild(Alevel1, Format('Peso Liquido..........: %n', [Anf.peso_l]));

    for I := 0 to Pred(Anf.volumes_ped.Count) do with Anf.volumes_ped.Items[I] do
    begin
      Alevel2 := tv_nf.Items.AddChild(Alevel1, Format('Volumes do pedido [%s:%d]', [tipo, nped]));
      tv_nf.Items.AddChild(Alevel2, Format('Quantidade............: %d', [qvol]));
      if I = 0 then
      begin
        tv_nf.Items.AddChild(Alevel2, Format('Espécie...............: %s', [esp]));
        tv_nf.Items.AddChild(Alevel2, Format('Marca.................: %s', [marca]));
        tv_nf.Items.AddChild(Alevel2, Format('Numeração.............: %s', [nvol]));
      end;
      tv_nf.Items.AddChild(Alevel2, Format('Peso Bruto............: %n', [pesob]));
      tv_nf.Items.AddChild(Alevel2, Format('Peso Liquido..........: %n', [pesol]));
      tv_nf.Items.AddChild(Alevel2, '***Duplo clique aqui para alterar***');
    end;
  end
  else if Sender is THw_erro_classList then
  begin
    Aerros := THw_erro_classList(Sender);

    Alevel0 := tv_nf.Items.AddChild(nil, 'Erros do lote');
    for I := 0 to Pred(Aerros.Count) do with Aerros.Items[I] do
    begin
      Alevel1 := tv_nf.Items.AddChild(Alevel0, erro);
      if detalhe <> '' then
        if Pos(sLineBreak, detalhe) = 0 then
          tv_nf.Items.AddChild(Alevel1, detalhe)
        else
        begin
          Alist := TStringList.Create;
          try
            Alist.Text := detalhe;
            for J := 0 to Pred(Alist.Count) do
              tv_nf.Items.AddChild(Alevel1, Alist[J]);
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
  end;
end;

procedure TfrmCadNF_lote.odos1Click(Sender: TObject);
begin
  inherited;
  try
    Faux.ped_.dataSet.AfterScroll := nil;

    Faux.ped_.checkUnCheckAllRows(True);
  finally
    Faux.ped_.dataSet.AfterScroll := ped_AfterScroll;
    ped_AfterScroll(Faux.ped_.dataSet);
  end;
end;

procedure TfrmCadNF_lote.Removerseleo1Click(Sender: TObject);
begin
  inherited;
  try
    Faux.ped_.dataSet.AfterScroll := nil;

    Faux.ped_.checkUnCheckAllRows(False);
  finally
    Faux.ped_.dataSet.AfterScroll := ped_AfterScroll;
    ped_AfterScroll(Faux.ped_.dataSet);
  end;
end;

procedure TfrmCadNF_lote.bt_change_trnasportaClick(Sender: TObject);
var
  Alkmodal: TDadosLookUp_OOP;
  I: Integer;
begin
  inherited;
  Alkmodal := TDadosLookUp_OOP.create;
  try
    Alkmodal.setDadosDataSet(['0', '1', '2', '3', '4', '9'],
                             ['0 - Terceiros', '1 - Emitente', '2 - Destinatário',
                              '3 - Transporte próprio Remetente', '4 - Transporte próprio Destinatário',
                              '9 - Sem frete'], lkmodalidade);
    lkmodalidade.DataSource := Faux.transporta._dataSourceOOP;
    for I := 0 to Pred(pn_transporte.ComponentCount) do
      if pn_transporte.Components[I] is TDBEdit then
          TDBEdit(pn_transporte.Components[I]).DataSource := Faux.transporta._dataSourceOOP;

    vDadosIni.abreForm('Dados do transporte', pn_transporte, opFormsDefCadEsc);

    for I := 0 to Ffatu.notas.Count - 1 do with Ffatu.notas.Items[I] do
      if (ck_usar_dados_transporte.Checked) then
      begin
        freteconta_tr := Faux.transporta.f_str('modalidade');
        codigo_tr     := Faux.transporta.f_int('codigo_tr');
        if nfe_iddest <> '2' then
        begin
          placa_tr      := Faux.transporta.f_str('placa');
          uf_placa_tr   := Faux.transporta.f_str('uf_placa');
        end;
      end
      else
      begin
        restore_frete_conta_tr;
        codigo_tr     := 0;
        placa_tr      := '';
        uf_placa_tr   := '';
      end;

    bt_tv_refresh.Click;

  finally
    FreeAndNil(Alkmodal);
  end;
end;

procedure TfrmCadNF_lote.bt_datahora_saida_clearClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  ed_data_saida.Clear;
  ed_hora_saida.Clear;
  if (vDadosIni.vEmp.vNfe.modeloNF = '55') then
  begin
    tv_nf.Items.Clear;
    for I := 0 to Ffatu.notas.Count - 1 do with Ffatu.notas.Items[I] do
    begin
      data_ent_saida := 0;
      hora_ent_saida := 0;
      notafiscal_make_tv(Ffatu.notas.Items[I]);
    end;
  end;
end;

procedure TfrmCadNF_lote.bt_datahora_saida_setClick(Sender: TObject);
var
  AdthrE, AdthrS, Adt, Ahr: TDateTime;
  I: Integer;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (ck_usar_dados_transporte.CanFocus) then
    ck_usar_dados_transporte.SetFocus;
  if (vDadosIni.vEmp.vNfe.modeloNF = '55') then
  begin
    Adt := 0;
    Ahr := 0;    
    TryStrToDate(ed_data_saida.Text, Adt);
    TryStrToTime(ed_hora_saida.Text, Ahr);

    for I := 0 to Ffatu.notas.Count - 1 do with Ffatu.notas.Items[I] do
      if erros.Count = 0 then
      begin
        if (Adt > 0) and (Ahr > 0) then
        begin
          AdthrS := Adt + Ahr;
          AdthrE := data_contabil + StrToTime(hora_emissao);
          if AdthrS < AdthrE  then
          begin
            vDadosIni.ShowErro('Data de saída %s menor que a data da emissão %s',
                               [FormatDateTime('DD/MM/YYYY hh:nn:ss', AdthrS),
                                FormatDateTime('DD/MM/YYYY hh:nn:ss', AdthrE)]);
            Adt := 0;
            Break;
          end;
        end
        else if (Adt > 0) or (Ahr > 0) then
        begin
          vDadosIni.ShowErro('Quando preencher o campo de data de saída preencher também a hora e vice versa');
          Adt := 0;
          Break;
        end
        else
          Adt := 0;
      end;

    tv_nf.Items.Clear;
    for I := 0 to Ffatu.notas.Count - 1 do with Ffatu.notas.Items[I] do
    begin
      if Adt > 0 then
      begin
        data_ent_saida := Adt;
        hora_ent_saida := Ahr;
      end
      else
      begin
        data_ent_saida := 0;
        hora_ent_saida := 0;
      end;
      notafiscal_make_tv(Ffatu.notas.Items[I]);
    end;
  end;
end;

procedure TfrmCadNF_lote.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if ActiveControl <> bt_voltar_transporta then
  	if (Self.Enabled) and (Self.Visible) and (bt_voltar_transporta.CanFocus) then
    	bt_voltar_transporta.SetFocus;
  //Perform(WM_NEXTDLGCTL, 0, 0);
  if Faux.transporta.SalvarConfig then
    vDadosIni.ShowAtencao('Configurações salvas');
end;

procedure TfrmCadNF_lote.tv_nfCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  inherited;
  if (Node.Text = '***Duplo clique aqui para alterar***') then
    Sender.Canvas.Font.Style := [fsBold]
  else if (Copy(Node.Text,1 ,1 ) = '*') then
    Sender.Canvas.Font.Style := [FSBOLD];
end;

procedure TfrmCadNF_lote.tv_nfDblClick(Sender: TObject);
var
  Anode: TTreeNode;
  Atipo, Atext: string;
  I, J, K, Anped, Astart, Aend, Amiddle: Integer;
  Acontinue: Boolean;
begin
  inherited;
  if not (Sender is TTreeView) then
    Exit;

  Anode := TTreeView(Anode).Selected;
  if Anode.Level = 3 then
    if (Assigned(Anode.Parent)) and (Anode.Text = '***Duplo clique aqui para alterar***') and (Pos('Volumes do pedido [', Anode.Parent.Text) > 0) then
    begin
      Atext   := Anode.Parent.Text;
      Astart  := Pos('[', Anode.Parent.Text);
      Aend    := Pos(']', Anode.Parent.Text);
      Amiddle := Pos(':', Anode.Parent.Text);
      if (Astart < Amiddle) and (Amiddle <  Aend) then
      begin
        Atipo := Copy(Anode.Parent.Text, Astart + 1, Amiddle - Astart - 1);
        Anped := StrToIntDef(Copy(Anode.Parent.Text, Amiddle + 1, Aend - Amiddle - 1), 0);

        for I := 0 to Pred(Ffatu.notas.Count) do
          for J := 0 to Pred(Ffatu.notas.Items[I].volumes_ped.Count) do with Ffatu.notas.Items[I].volumes_ped.Items[J] do
            if (Atipo = tipo) and (Anped = nped) then
            begin
              Fvol_aux := Clone;
              try
                while True do
                begin
                  Fvol_aux.cod_empresa := cod_empresa;
                  if vDadosIni.abreForm('Manutenção de volumes', pn_volumes, opFormsDefCadEsc) then
                  begin
                    if (Fvol_aux.cod_empresa = -1) then
                      Acontinue := Faux.transporta.volumes_pedido_excluir(Fvol_aux);

                    if (Fvol_aux.cod_empresa = StrToInt(vDadosIni.codEmpresa)) then
                    begin
                      if Fvol_aux.qvol <= 0 then
                        vDadosIni.ShowAtencao('Quantidade de volumes não informada')
                      else
                        Acontinue := Faux.transporta.volumes_pedido_salvar(Fvol_aux);
                    end
                    else if (Fvol_aux.cod_empresa = 0) then
                      Exit;

                    if Acontinue then
                    begin
                      Ffatu.volumes_pedido_recalcular;
                      tv_nf.Items.Clear;
                      for K := 0 to Pred(Ffatu.notas.Count) do notafiscal_make_tv(Ffatu.notas.Items[K]);
                      for K := 0 to Pred(tv_nf.Items.Count) do if tv_nf.Items.Item[K].Text = Atext then
                      begin
                        Anode := tv_nf.Items.Item[K];
                        Anode.Expand(False);
                        while Assigned(Anode.Parent) do
                        begin
                          Anode := Anode.Parent;
                          Anode.Expand(False);
                        end;
                        //tv_nf.Items.Item[K].Expand(True);
                        Break;
                      end;
                      Exit;
                    end;
                  end
                  else
                    Exit;
                end;
              finally
                if Assigned(Fvol_aux) then FreeAndNil(Fvol_aux);
              end;
            end;
      end;
    end;
end;

procedure TfrmCadNF_lote.bt_erros_showClick(Sender: TObject);
begin
  inherited;
  memo_erros.Lines.Text := Ffatu.erros.formato_TStrings.Text;
  vDadosIni.abreForm('Erros', pn_erros, opFormsDefault);
end;

end.
