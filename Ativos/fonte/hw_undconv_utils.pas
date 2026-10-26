unit hw_undconv_utils;

interface

uses
{$IFDEF VER180}
  IBDatabase, uEditHw,
{$ELSE}
  IBX.IBDatabase, hw_edits_dx,
{$ENDIF}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, UnidadeVenda_Model, Buttons, StdCtrls,
  DB, uClasseConexao, hw_audit_utils, Mask, unidades_class,
  Menus, ProdutosConversao_Model, Grids, DBGrids, produtos_conversao_class;

type
  TConvUnidadeInput = class
  private
    Fcod_empresa: Integer;
    Fusuario: string;
  public
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property usuario: string read Fusuario write Fusuario;
  end;

  TConvProdutoInput = class(TConvUnidadeInput)
  private
    Fcod_prod: string;
    Fgrupo_prod: Integer;
  public
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: string read Fcod_prod write Fcod_prod;
  end;

  TConvUnidadeCriarInput = class(TConvUnidadeInput)
  private
    Fuvnd: string;
    Fcod_prod: string;
    Fgrupo_prod: Integer;
    Fean: string;
  public
    property grupo_prod: Integer read Fgrupo_prod write Fgrupo_prod;
    property cod_prod: string read Fcod_prod write Fcod_prod;
    property uvnd: string read Fuvnd write Fuvnd;
    property ean: string read Fean write Fean;
  end;

  TConvUnidadeVincCriarInput = class(TConvUnidadeCriarInput)
  private
    FucomXml: string;
  public
    property ucomXml: string read FucomXml write FucomXml;
  end;

  TConvUnidadeSelecionarInput = class(TConvUnidadeInput)
  private
    FundSelect: string;
  published
    property undSelect: string read FundSelect write FundSelect;
  end;

  TConvUnidadePrefXmlInput = class(TUnidadeVenda_Model)
  private
    Fucom: string;
  public
    property ucom: string read Fucom write Fucom;
  end;

  {
  TConvUnidadeCriarSilentInput = class(TConvUnidadeInput)
  private
    Fpayload: TUnidadeVenda_Model;
  public
    destructor Destroy; override;
    constructor Create;

    property payload: TUnidadeVenda_Model read Fpayload write Fpayload;
  end;
  }

  TConvUnidadeCriarSilentInput = class (TUnidadeVenda_Model)
  private
    Fusuario: string;
  public
    property usuario: string read Fusuario write Fusuario;
  end;

  TSaveConvUnidadeInput = class(TConvUnidadeCriarInput)
  private
    FdispVenda: Boolean;
    FqtdePrinc: Double;
    FpadraoVenda: Boolean;
    Fean: string;
    FqtdeConv: Double;
    FundXmlPref: string;
  public
    property qtdePrinc: Double read FqtdePrinc write FqtdePrinc;
    property qtdeConv: Double read FqtdeConv write FqtdeConv;
    property dispVenda: Boolean read FdispVenda write FdispVenda;
    property padraoVenda: Boolean read FpadraoVenda write FpadraoVenda;
    property undXmlPref: string read FundXmlPref write FundXmlPref;
    property ean: string read Fean write Fean;
  end;

  TConversaUnidadeRepo = class(TConexao)
  private
    FAudit: TAudit_OOP;
    cod_empresa: Integer;
    FConversoesDataSet: TConexao_OOP;
    FUnidadesDataSet: TConexao_OOP;
    function GetAudit: TAudit_OOP;
  public
    constructor Create(AdataBase: TIBDatabase; input: TConvUnidadeInput);
    destructor Destroy; override;

    property Audit: TAudit_OOP read GetAudit write FAudit;

    function GetUndProd(grupo_prod: Integer; cod_prod: string): TUnidades_class;
    function GetUnidade(sigla: string): TUnidades_class;
    function GetUndCadastro(): TUnidadess_class;
    function GetProdutoConversao(grupo_prod: Integer; cod_prod, unidade: string): TUnidadeVenda_Model;
    function GetListConversao(grupo_prod: Integer; cod_prod: string): TUnidadeVendas_Model;
    function SaveConvUnidade(input: TSaveConvUnidadeInput): Boolean;
    function SaveUnidade(input: TUnidades_class): Boolean;
    function GetConversoesDataSet(grupo_prod: Integer; cod_prod: string): TConexao_OOP;
    function GetUnidadesDataSet(): TConexao_OOP;

    property ConversoesDataSet: TConexao_OOP read FConversoesDataSet;
    property UnidadesDataSet: TConexao_OOP read FUnidadesDataSet;
  end;

  TConversaoUnidadeUtils = class
  private
    initRepo: TConvUnidadeInput;
    repo: TConversaUnidadeRepo;
    Funidades: TUnidadess_class;
    function HandleUnidadeCadastroNFe(input: TConvProdutoInput): Integer;
    function CriarSilent(input: TConvUnidadeCriarSilentInput): Boolean;
  public
    constructor Create(banco: TIBDatabase; usuario: string; cod_empresa: Integer);
    destructor Destroy; override;

    function GetListConversao(grupoProd: Integer; codProd: string): TUnidadeVendas_Model;
    function SetPreferencial(input: TUnidadeVenda_Model): Boolean;
    function HandleCadastroEanEproduto(input: TConvProdutoInput): Integer;

    procedure LoadUnidades;
    function HandleUnidadeFracao(und: string; qtde: Double): Double;
  end;

  ConversaoUnidadeUtils = class
  public
    class function Criar(banco: TIBDatabase; input: TConvUnidadeCriarInput): Boolean;
    class function CriarSilent(banco: TIBDatabase; input: TConvUnidadeCriarSilentInput): Boolean;
    class function ShowConversoes(banco: TIBDatabase; input: TConvUnidadeVincCriarInput): Boolean;
    class function HandleCadastroEanEprodutoSilent(banco: TIBDatabase; input: TConvProdutoInput): Integer;
    class function SelecionarUnidade(banco: TIBDatabase; input: TConvUnidadeSelecionarInput): Boolean;
  end;

  FormChamada = (fcNenhum, fcCriarConversao, fcListarConversao, fcSelecinarUnidade);

  TfrmConversaUnidadeUtils = class(TForm)
    pageUnd: TPageControl;
    tsConversao: TTabSheet;
    tsUnidade: TTabSheet;
    Panel1: TPanel;
    edConvQtde: TEditHw;
    edConvUndConv: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edConvQtdePrincs: TEditHw;
    edConvUndPrinc: TComboBox;
    Label3: TLabel;
    edConvDispVenda: TComboBox;
    edConvPadraoVenda: TComboBox;
    Panel2: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel3: TPanel;
    bt_conv_ok: TBitBtn;
    bt_conv_cancel: TBitBtn;
    lbConvNovaUnidade: TLabel;
    Label10: TLabel;
    edUndFracionado: TComboBox;
    pn_btn_unds_conv: TPanel;
    bt_und_ok: TBitBtn;
    bt_und_cancel: TBitBtn;
    edUndSigla: TMaskEdit;
    edUndDescricao: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    edConvEan: TMaskEdit;
    popMenuQtdPrinc: TPopupMenu;
    Alterarcasasdecimais1: TMenuItem;
    popMenuQtdConv: TPopupMenu;
    Alterarcasasdecimais2: TMenuItem;
    Panel4: TPanel;
    tsSimulacao: TTabSheet;
    Panel5: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel9: TPanel;
    ListBox1: TListBox;
    GroupBox1: TGroupBox;
    UND12: TMaskEdit;
    Label11: TLabel;
    edSimXmlQtde: TMaskEdit;
    Label12: TLabel;
    edSimXmlVlUnd: TMaskEdit;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    tsGrid: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    bt_grid_novo: TBitBtn;
    BitBtn4: TBitBtn;
    Panel13: TPanel;
    gridConversao: TDBGrid;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Panel14: TPanel;
    tsGridUnidades: TTabSheet;
    Panel15: TPanel;
    Panel17: TPanel;
    bt_gridunid_novo: TBitBtn;
    BitBtn7: TBitBtn;
    Panel19: TPanel;
    gridUnidades: TDBGrid;
    bt_gridunid_select: TBitBtn;
    procedure Alterarcasasdecimais2Click(Sender: TObject);
    procedure Alterarcasasdecimais1Click(Sender: TObject);
    procedure edConvQtdePrincsExit(Sender: TObject);
    procedure edConvQtdeExit(Sender: TObject);
    procedure lbConvNovaUnidadeClick(Sender: TObject);
    procedure bt_conv_okClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_und_cancelClick(Sender: TObject);
    procedure bt_und_okClick(Sender: TObject);
    procedure bt_grid_novoClick(Sender: TObject);
    procedure gridConversaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_gridunid_novoClick(Sender: TObject);
    procedure bt_gridunid_selectClick(Sender: TObject);
  private
    createInput: TConvUnidadeCriarInput;
    vincInput: TConvUnidadeVincCriarInput;
    helper: TConversaoUnidadeUtils;
    undSelecao: TConvUnidadeSelecionarInput;
    chamadaForm: FormChamada;

    function SaveConvUnidadeInputValid(input: TSaveConvUnidadeInput): TStrings;

    function PreparaForm(input: TConvUnidadeCriarInput): Boolean;

  public
    function InitForm(banco: TIBDatabase; initParams: TConvUnidadeInput): Boolean;

  end;

var
  frmConversaUnidadeUtils: TfrmConversaUnidadeUtils;

implementation

uses
  StrUtils,
  Query_OOP,
  produtos_conversao_saida_class,
  ean_utils,
  hw_utils,
  hw_win_utils, Contnrs, Types_OOP, basefb_class, Math;

{$R *.dfm}

{ ConversaoUnidadeUtils }

class function ConversaoUnidadeUtils.Criar(
  banco: TIBDatabase;
  input: TConvUnidadeCriarInput): Boolean;
begin
  Application.CreateForm(TfrmConversaUnidadeUtils, frmConversaUnidadeUtils);
  frmConversaUnidadeUtils.Caption     := Format('Criar conversão da unidade de medida "%s"', [input.uvnd]);
  if frmConversaUnidadeUtils.InitForm(banco, input) then
    Result := frmConversaUnidadeUtils.ShowModal = mrOk
  else
    frmConversaUnidadeUtils.Free;
end;

class function ConversaoUnidadeUtils.CriarSilent(banco: TIBDatabase;
  input: TConvUnidadeCriarSilentInput): Boolean;
var
  helper: TConversaoUnidadeUtils;
begin
  helper := TConversaoUnidadeUtils.Create(banco, input.usuario, input.cod_empresa);
  try
    Result := helper.CriarSilent(input);
  finally
    helper.Free;
  end;
end;

class function ConversaoUnidadeUtils.HandleCadastroEanEprodutoSilent(
  banco: TIBDatabase; input: TConvProdutoInput): Integer;
var
  helper: TConversaoUnidadeUtils;
begin
  helper := TConversaoUnidadeUtils.Create(banco, input.usuario, input.cod_empresa);
  try

    try

      Result := helper.HandleCadastroEanEproduto(input);

    except on E: Exception do
    end;

  finally
    helper.Free;
  end;
end;

class function ConversaoUnidadeUtils.SelecionarUnidade(banco: TIBDatabase;
  input: TConvUnidadeSelecionarInput): Boolean;
begin
  Application.CreateForm(TfrmConversaUnidadeUtils, frmConversaUnidadeUtils);
  frmConversaUnidadeUtils.Caption     := 'Selecione a unidade de medida';
  if frmConversaUnidadeUtils.InitForm(banco, input) then
    Result := frmConversaUnidadeUtils.ShowModal = mrOk
  else
    frmConversaUnidadeUtils.Free;
end;

class function ConversaoUnidadeUtils.ShowConversoes(banco: TIBDatabase;
  input: TConvUnidadeVincCriarInput): Boolean;
begin
  Application.CreateForm(TfrmConversaUnidadeUtils, frmConversaUnidadeUtils);
  frmConversaUnidadeUtils.Caption     := 'Conversões de unidade de medida';
  if frmConversaUnidadeUtils.InitForm(banco, input) then
    Result := frmConversaUnidadeUtils.ShowModal = mrOk
  else
    frmConversaUnidadeUtils.Free;
end;

{ TfrmConversaUnidadeUtils }

procedure TfrmConversaUnidadeUtils.Alterarcasasdecimais1Click(Sender: TObject);
var
  text: string;
  iCas: Integer;
begin
  inherited;

  text := Copy(edConvQtdePrincs.FormatSize, 3, Length(edConvQtdePrincs.FormatSize));

  if InputQuery('Casas decimais', 'Informe as casas decimais', text) then
    if TryStrToInt(Trim(text), iCas) and (iCas >= 0) and (iCas <= 10) then
    begin
      edConvQtdePrincs.FormatSize := Format('0.%d', [iCas]);
      edConvQtdePrincs.AsValue := edConvQtdePrincs.AsValue;
    end
    else
      ShowErro('Número iválido. Informe de 0 a 10 casas decimais');
end;

procedure TfrmConversaUnidadeUtils.Alterarcasasdecimais2Click(Sender: TObject);
var
  text: string;
  iCas: Integer;
begin
  inherited;

  text := Copy(edConvQtde.FormatSize, 3, Length(edConvQtde.FormatSize));

  if InputQuery('Casas decimais', 'Informe as casas decimais', text) then
    if TryStrToInt(Trim(text), iCas) and (iCas >= 0) and (iCas <= 10) then
    begin
      edConvQtde.FormatSize := Format('0.%d', [iCas]);
      edConvQtde.AsValue := edConvQtde.AsValue;
    end
    else
      ShowErro('Número iválido. Informe de 0 a 10 casas decimais');
end;

procedure TfrmConversaUnidadeUtils.bt_conv_okClick(Sender: TObject);
var
  payload: TSaveConvUnidadeInput;
  erros: TStrings;
begin
  inherited;

  if not helper.repo.Audit.Processo('PRO251')
    .Salvar.Permitido then
    Exit;

  payload := TSaveConvUnidadeInput.Create;
  payload.grupo_prod := createInput.grupo_prod;
  payload.cod_prod := createInput.cod_prod;
  payload.cod_empresa := createInput.cod_empresa;
  payload.uvnd := createInput.uvnd;
  payload.qtdePrinc := edConvQtdePrincs.AsValue;
  payload.qtdeConv := edConvQtde.AsValue;
  payload.dispVenda := edConvDispVenda.ItemIndex = 1;
  payload.padraoVenda := edConvPadraoVenda.ItemIndex = 1;
  payload.ean := edConvEan.Text;

  erros := SaveConvUnidadeInputValid(payload);
  try
    if edConvUndConv.Text = '' then
      erros.Add('Unidade precisa ser criada antes da conversão. Clique no texto colorido abaixo para continuar por favor');

    if erros.Count > 0 then
    begin
      ShowAtencao(erros.Text);
      Exit;
    end;

  finally
    erros.Free;
  end;

  try

    if helper.repo.SaveConvUnidade(payload) then
      ModalResult := mrOk

  except on E: Exception do
    begin
      ShowErro(E.Message);
    end;
  end;
end;

procedure TfrmConversaUnidadeUtils.bt_gridunid_novoClick(Sender: TObject);
begin

  edUndSigla.Text := '';
  edUndSigla.Enabled := True;
  edUndDescricao.Text := '';
  edUndFracionado.ItemIndex := 1;

  pageUnd.ActivePage := tsUnidade;
end;

procedure TfrmConversaUnidadeUtils.bt_gridunid_selectClick(Sender: TObject);
begin
  undSelecao.undSelect := gridUnidades.DataSource.DataSet.FieldByName('sigla').AsString;
  ModalResult := IDOK;
end;

procedure TfrmConversaUnidadeUtils.bt_grid_novoClick(Sender: TObject);
begin
  if not helper.repo.Audit.Processo('PRO249')
    .Inserir.Permitido then
    Exit;

  createInput.uvnd := '';

  if PreparaForm(createInput) then
    pageUnd.ActivePage := tsConversao;
end;

procedure TfrmConversaUnidadeUtils.bt_und_cancelClick(Sender: TObject);
begin
  inherited;
  if chamadaForm = fcSelecinarUnidade then
    pageUnd.ActivePage := tsGridUnidades
  else
    pageUnd.ActivePage := tsConversao;
end;

procedure TfrmConversaUnidadeUtils.bt_und_okClick(Sender: TObject);
var
  payload: TUnidades_class;
begin
  inherited;

  payload := TUnidades_class.Create;
  payload.sigla := Trim(edUndSigla.Text);
  payload.descricao := Trim(edUndDescricao.Text);
  payload.fracionado := edUndFracionado.ItemIndex;

  try
    if (Length(payload.sigla) < 1)
      or (Length(payload.sigla) > 6) then
      raise Exception.Create('Sigla da unidade precisa conter entre 1 e 6 caracteres');

    if (Length(payload.descricao) < 1)
      or (Length(payload.sigla) > 50) then
      raise Exception.Create('Descrição da unidade precisa conter entre 1 e 50 caracteres');

    if helper.repo.SaveUnidade(payload) then
    begin
      edConvUndConv.Items.Clear;
      edConvUndConv.Items.AddObject(payload.sigla, payload);
      edConvUndConv.ItemIndex := 0;
      edConvUndConv.Enabled := False;

      lbConvNovaUnidade.Visible := False;

      if chamadaForm = fcSelecinarUnidade then
      begin
        helper.repo.UnidadesDataSet.Refresh;
        pageUnd.ActivePage := tsGridUnidades;
      end
      else
        pageUnd.ActivePage := tsConversao;
    end;

  except on E: Exception do
    begin
      ShowErro(E.Message);
    end;
  end;

end;

procedure TfrmConversaUnidadeUtils.edConvQtdeExit(Sender: TObject);
begin
  inherited;
  if edConvQtde.AsValue < 0 then
  begin
    ShowAtencao('A quantidade deve ser superior a 0');
    edConvQtde.AsValue := 1;
  end
  else if edConvQtde.AsValue <> 1 then
    edConvQtdePrincs.AsValue := 1;
end;

procedure TfrmConversaUnidadeUtils.edConvQtdePrincsExit(Sender: TObject);
begin
  inherited;
  if edConvQtdePrincs.AsInteger < 0 then
  begin
    ShowAtencao('A quantidade deve ser superior a 0');
    edConvQtdePrincs.AsValue := 1;
  end
  else if edConvQtdePrincs.AsInteger <> 1 then
    edConvQtde.AsValue := 1;
end;

procedure TfrmConversaUnidadeUtils.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  helper.Free;
  Action := caFree;
  frmConversaUnidadeUtils := nil;
end;

procedure TfrmConversaUnidadeUtils.gridConversaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (LowerCase(Column.FieldName) = 'unid_vnd')
    and (Trim(vincInput.ucomXml) <> '')
    and (gridConversao.DataSource.DataSet.FieldByName('unid_pref').AsString = vincInput.ucomXml) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clInfoBk;
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

function  TfrmConversaUnidadeUtils.InitForm(banco: TIBDatabase;
  initParams: TConvUnidadeInput): Boolean;
var
  und: TUnidades_class;
  conversao: TProdutosConversao_Model;
  repo: TConversaUnidadeRepo;
  I: Integer;
begin

  try

    tsConversao.TabVisible := False;
    tsUnidade.TabVisible := False;
    tsSimulacao.TabVisible := False;
    tsGrid.TabVisible := False;
    tsGridUnidades.TabVisible := False;
    pageUnd.Height := pageUnd.Height - 21;
    bt_gridunid_select.Visible := False;

    helper := TConversaoUnidadeUtils.Create(banco, initParams.usuario, initParams.cod_empresa);
    repo := helper.repo;


    if (initParams is TConvUnidadeSelecionarInput) then
    begin
      chamadaForm := fcSelecinarUnidade;

      undSelecao := (initParams as TConvUnidadeSelecionarInput);

      gridUnidades.DataSource := helper.repo.GetUnidadesDataSet().DataSourceOOP;
      gridUnidades.DataSource.AutoEdit := False;

      bt_gridunid_select.Visible := True;
      pageUnd.ActivePage := tsGridUnidades;
    end
    else
    if (initParams is TConvUnidadeVincCriarInput) then
    begin
      chamadaForm := fcListarConversao;
      createInput := (initParams as TConvUnidadeCriarInput);
      vincInput   := (initParams as TConvUnidadeVincCriarInput);

      gridConversao.DataSource := helper.repo.GetConversoesDataSet(createInput.grupo_prod, createInput.cod_prod).DataSourceOOP;
      gridConversao.DataSource.AutoEdit := False;

      pageUnd.ActivePage := tsGrid;
    end
    else
    if (initParams is TConvUnidadeCriarInput) then
    begin

      if not repo.Audit.Processo('PRO249')
        .Inserir.Permitido then
      begin
        Result := False;
        Exit;
      end;

      chamadaForm := fcCriarConversao;
      createInput := (initParams as TConvUnidadeCriarInput);

      PreparaForm(createInput);

      pageUnd.ActivePage := tsConversao;

    end;
      {
      conversao := repo.GetProdutoConversao(createInput.grupo_prod, createInput.cod_prod, createInput.uvnd);

      if conversao.cod_prod <> '' then
        raise Exception.Create('Já existe a conversão para a unidade informada. Se necessário acesse o cadastro de produto para mais opções');

      und := repo.GetUndProd(createInput.grupo_prod, createInput.cod_prod);

      if und.sigla = createInput.uvnd then
        raise Exception.Create('Unidade do estoque é a mesma da unidade informada. Não há necessidade de criar conversão');

      edConvUndPrinc.Items.Clear;
      edConvUndPrinc.Items.AddObject(und.sigla, und);
      edConvUndPrinc.ItemIndex := 0;
      edConvUndPrinc.Enabled := False;
      if und.fracionado > 0 then
      begin
        edConvQtdePrincs.FormatSize := '0.3';
        edConvQtdePrincs.AsValue := edConvQtdePrincs.AsValue;
        edConvQtdePrincs.PopupMenu := popMenuQtdPrinc;
      end
      else
        edConvQtde.PopupMenu := nil;

      und := repo.GetUnidade(createInput.uvnd);
      edConvUndConv.Items.Clear;
      edConvUndConv.Items.AddObject(und.sigla, und);
      edConvUndConv.ItemIndex := 0;
      edConvUndConv.Enabled := False;
      if und.fracionado > 0 then
      begin
        edConvQtde.FormatSize := '0.3';
        edConvQtde.AsValue := edConvQtde.AsValue;
        edConvQtde.PopupMenu := popMenuQtdConv;
      end
      else
        edConvQtde.PopupMenu := nil;
      lbConvNovaUnidade.Visible := edConvUndConv.Items.IndexOf(createInput.uvnd) = -1;

      edConvQtde.AsValue          := 1;
      edConvQtdePrincs.AsValue    := 1;
      edConvDispVenda.ItemIndex   := 0;
      edConvPadraoVenda.ItemIndex := 0;
      edConvEan.Text              := createInput.ean;

      pageUnd.ActivePage := tsConversao;
      pageUnd.Height := pageUnd.Height - 21;
    end;
      }

    Result := True;
    
  except on E: Exception do
    begin
      Result := False;
      ShowErro(e.Message);
    end;
  end;

end;

procedure TfrmConversaUnidadeUtils.lbConvNovaUnidadeClick(Sender: TObject);
begin
  inherited;
  edUndSigla.Text := createInput.uvnd;
  edUndSigla.Enabled := False;
  edUndDescricao.Text := createInput.uvnd;
  edUndFracionado.ItemIndex := 1;

  pageUnd.ActivePage := tsUnidade;
end;

function TfrmConversaUnidadeUtils.PreparaForm(input: TConvUnidadeCriarInput): Boolean;
var
  und: TUnidades_class;
  conversao: TProdutosConversao_Model;
  repo: TConversaUnidadeRepo;
  sUnd: string;
  I: Integer;
begin
  Result := False;

  repo := helper.repo;

  if input.uvnd = '' then
  begin
    sUnd := '?';

    if not InputQuery('Nova conversão', 'Informe a unidade para conversão', sUnd) then
      Exit;

    input.uvnd := sUnd;
  end;

  input.uvnd := AnsiUpperCase(Trim(input.uvnd));

  if (input.uvnd = '?')
    or (Length(input.uvnd) <= 0)
    or (Length(input.uvnd) > 6) then
  begin
    ShowAtencao('Unidade inválida. Informe de 1 a 6 caracteres');
    Exit;
  end;

  conversao := repo.GetProdutoConversao(input.grupo_prod, input.cod_prod, input.uvnd);

  if conversao.cod_prod <> '' then
    raise Exception.Create('Já existe a conversão para a unidade informada. Se necessário acesse o cadastro de produto para mais opções');

  und := repo.GetUndProd(input.grupo_prod, input.cod_prod);

  if und.sigla = input.uvnd then
    raise Exception.Create('Unidade do estoque é a mesma da unidade informada. Não há necessidade de criar conversão');

  edConvUndPrinc.Items.Clear;
  edConvUndPrinc.Items.AddObject(und.sigla, und);
  edConvUndPrinc.ItemIndex := 0;
  edConvUndPrinc.Enabled := False;
  if und.fracionado > 0 then
  begin
    edConvQtdePrincs.FormatSize := '0.3';
    edConvQtdePrincs.AsValue := edConvQtdePrincs.AsValue;
    edConvQtdePrincs.PopupMenu := popMenuQtdPrinc;
  end
  else
    edConvQtde.PopupMenu := nil;

  und := repo.GetUnidade(input.uvnd);
  edConvUndConv.Items.Clear;
  edConvUndConv.Items.AddObject(und.sigla, und);
  edConvUndConv.ItemIndex := 0;
  edConvUndConv.Enabled := False;
  if und.fracionado > 0 then
  begin
    edConvQtde.FormatSize := '0.3';
    edConvQtde.AsValue := edConvQtde.AsValue;
    edConvQtde.PopupMenu := popMenuQtdConv;
  end
  else
    edConvQtde.PopupMenu := nil;
  lbConvNovaUnidade.Visible := edConvUndConv.Items.IndexOf(input.uvnd) = -1;
  if lbConvNovaUnidade.Visible then
    lbConvNovaUnidade.Caption := Format('Nova unidade de medida( %s ) não existe no cadastro. Clique aqui para cadastrar antes de continuar com a conversão', [input.uvnd]);

  edConvQtde.AsValue          := 1;
  edConvQtdePrincs.AsValue    := 1;
  edConvDispVenda.ItemIndex   := 0;
  edConvPadraoVenda.ItemIndex := 0;
  edConvEan.Text              := StringReplace(input.ean, 'SEM GTIN', '', [rfIgnoreCase]);

  Result := True;
end;

function TfrmConversaUnidadeUtils.SaveConvUnidadeInputValid(
  input: TSaveConvUnidadeInput): TStrings;
begin
  Result := NewStringList();

  if (input.uvnd = '') then
    Result.Add('Nova unidade ainda não informada ou cadastrada');

  if (input.ean <> '') and (not EANUtils.IsValid(input.ean)) then
    Result.Add('EAN informado inválido');

  if (input.ean <> '') and (input.dispVenda or input.padraoVenda) then
    Result.Add('EAN informado, nesse caso preencher Disponível para venda e Padrão venda como Não');

  if ((not input.dispVenda) and input.padraoVenda) then
    Result.Add('Disponível para venda igual a Não e Padrão venda igual a Sim, favor preencher como Não');
end;

{ TConversaUnidadeRepo }

constructor TConversaUnidadeRepo.Create(AdataBase: TIBDatabase;
  input: TConvUnidadeInput);
begin
  inherited Create(AdataBase);

  FAudit := TAudit_OOP.Create(input.usuario, input.cod_empresa, AdataBase);
  cod_empresa := input.cod_empresa;
end;

destructor TConversaUnidadeRepo.Destroy;
begin
  if Assigned(FAudit) then
    FAudit.Free;

  inherited;
end;

function TConversaUnidadeRepo.GetAudit: TAudit_OOP;
begin
  if not Assigned(FAudit) then
    FAudit := TAudit_OOP.Create;

  FAudit.SetTabela('PRODUTOS_CONVERSAO_SAIDA');

  Result := FAudit;
end;

function TConversaUnidadeRepo.GetConversoesDataSet(
  grupo_prod: Integer; cod_prod: string): TConexao_OOP;
begin
  if not Assigned(FConversoesDataSet) then
    FConversoesDataSet := Self.NewClientOOP();

  Result := FConversoesDataSet;

  FConversoesDataSet.ClientOpen(queryCons
    .Table('vw_produtos_conversao', '*')
    .Equals('grupo_prod', grupo_prod)
    .Equals('cod_prod', cod_prod)
    .Equals('cod_empresa', cod_empresa)
    .OrderBy('unidade')
    .query.SQL.Text);
end;

function TConversaUnidadeRepo.GetListConversao(grupo_prod: Integer;
  cod_prod: string): TUnidadeVendas_Model;
var
  undProd: TUnidadeVenda_Model;
begin


  Result := TUnidadeVendas_Model.Create;

  try
    Result.CopyFrom( TUnidadeVenda_Model, queryCons
      .Table('produtos', 'grupo_prod, cod_prod, cod_empresa, unidade,' +
                         ' 1 quantidade, 1.0 fator, 1.0 fator_sped,' +
                         ' unidade unid_vnd, unidade unid_princ,' +
                         ' 1.0 qtde_princ, 1.0 qtde_vnd,'+
                         ' 1 ativo, ''M'' operacao, ''S'' disponivel_venda')
      .Equals('grupo_prod', grupo_prod)
      .Equals('cod_prod', cod_prod)
      .Equals('cod_empresa', cod_empresa)
      .Open().query);

    Result.CopyFrom(TUnidadeVenda_Model, queryCons
      .Table('vw_produtos_conversao', '*')
        .Equals('grupo_prod', grupo_prod)
        .Equals('cod_prod', cod_prod)
        .Equals('cod_empresa', cod_empresa)
        .Open().query, False);

  finally
    queryCons.Close;
  end;
end;

function TConversaUnidadeRepo.GetProdutoConversao(grupo_prod: Integer; cod_prod,
  unidade: string): TUnidadeVenda_Model;
var
  query: TQuery_OOP;
begin
  query := TQuery_OOP.Create(Self.QrAux);

  Result := TUnidadeVenda_Model.Create;

  try
    Result.CopyFrom(
      query.Table('vw_produtos_conversao', '*')
        .Equals('grupo_prod', grupo_prod)
        .Equals('cod_prod', cod_prod)
        .Equals('cod_empresa', cod_empresa)
        .Equals('unidade', unidade)
        .Open().query, false);

  finally
    query.Free;
  end;
end;

function TConversaUnidadeRepo.GetUndCadastro: TUnidadess_class;
var
  query: TQuery_OOP;
begin
  query := TQuery_OOP.Create(Self.QrAux);

  Result := TUnidadess_class.Create;

  try
      Result.CopyFrom(TUnidades_class,
         query.Table('unidades', '*').Open().query, False);

  finally
    query.Free;
  end;
end;

function TConversaUnidadeRepo.GetUndProd(grupo_prod: Integer;
  cod_prod: string): TUnidades_class;
var
  query: TQuery_OOP;
begin
  query := TQuery_OOP.Create(Self.QrAux);

  Result := TUnidades_class.Create;

  try
    Result.CopyFrom(
      query.Table('produtos p', 'u.*')
        .Join('unidades u', 'u.sigla = p.unidade')
        .Equals('p.grupo_prod', grupo_prod)
        .Equals('p.cod_prod', cod_prod)
        .Equals('p.cod_empresa', cod_empresa)
        .Open()
        .query, False);

  finally
    query.Free;
  end;
end;

function TConversaUnidadeRepo.GetUnidade(sigla: string): TUnidades_class;
var
  query: TQuery_OOP;
begin
  query := TQuery_OOP.Create(Self.QrAux);

  Result := TUnidades_class.Create;

  try
      Result.CopyFrom(
         query.Table('unidades', '*')
         .Equals('sigla', sigla)
         .Open().query, false);

  finally
    query.Free;
  end;
end;

function TConversaUnidadeRepo.GetUnidadesDataSet: TConexao_OOP;
begin
  if not Assigned(FUnidadesDataSet) then
    FUnidadesDataSet := Self.NewClientOOP();

  Result := FUnidadesDataSet;

  FUnidadesDataSet.ClientOpen(queryCons
    .Table('unidades', 'sigla, descricao, iif(fracionado = 0, ''Não'', ''Sim'') fracionado')
    .OrderBy('sigla')
    .query.SQL.Text);
end;

function TConversaUnidadeRepo.SaveConvUnidade(
  input: TSaveConvUnidadeInput): Boolean;
var
  createEan: TProdutos_conversao_class;
  createConv: TProdutos_conversao_saida_class;
begin
  try
    {
    if Trim(input.ean) <> '' then
    begin
      createEan := TProdutos_conversao_class.Create;
      createEan.grupo_prod := input.grupo_prod;
      createEan.cod_prod := input.cod_prod;
      createEan.cod_empresa := input.cod_empresa;
      createEan.codigo_ean := input.ean;
      createEan.unidade := input.uvnd;

      if input.qtdePrinc > input.qtdeConv  then
        createEan.quantidade := input.qtdePrinc
      else
        createEan.quantidade := input.qtdeConv;

      Self.SqlExec(createEan.SQLMotor().SQLUpdateOrInsert)
        .Transaction.Commit;
    end
    else
    }
    begin
      createConv := TProdutos_conversao_saida_class.Create;
      createConv.ativo := 1;
      createConv.grupo_prod := input.grupo_prod;
      createConv.cod_prod := input.cod_prod;
      createConv.cod_empresa := input.cod_empresa;
      createConv.unidade := Copy(Trim(AnsiUpperCase(input.uvnd)), 1, 6);
      createConv.codigo_ean := Copy(Trim(input.ean), 1, 20);
      createConv.unid_pref := Copy(Trim(AnsiUpperCase(input.undXmlPref)), 1, 6);

      if input.qtdePrinc <> 1 then
      begin
        createConv.quantidade := input.qtdePrinc;
        createConv.operacao := 'D';
      end
      else
      begin
        createConv.quantidade := input.qtdeConv;
        createConv.operacao := 'M';
      end;

      createConv.disponivel_venda := IfThen(input.dispVenda  , 'S', 'N');
      createConv.padrao_venda     := IfThen(input.padraoVenda, 'S', 'N');

      if input.padraoVenda then
        Self.queryCons.SQL('update PRODUTOS_CONVERSAO_SAIDA set padrao_venda = ''N''')
          .Equals('grupo_prod' , input.grupo_prod)
          .Equals('cod_prod'   , input.cod_prod)
          .Equals('cod_empresa', input.cod_empresa)
          .query.ExecSQL;

      if input.undXmlPref <> '' then
        Self.queryCons.SQL('update PRODUTOS_CONVERSAO_SAIDA set unid_pref = ''''')
          .Equals('grupo_prod' , input.grupo_prod)
          .Equals('cod_prod'   , input.cod_prod)
          .Equals('cod_empresa', input.cod_empresa)
          .Equals('unid_pref'  , input.undXmlPref)
          .query.ExecSQL;

        queryCons.SQL('update produtos set inf_unidade = ''S''')
          .Equals('grupo_prod', input.grupo_prod)
          .Equals('cod_prod', input.cod_prod)
          .Equals('cod_empresa', input.cod_empresa)
          .Conditional('inf_unidade', 'is', 'null', False)
          .query.ExecSQL();

      Self.SqlExec(createConv.SQLMotor().SQLUpdateOrInsert)
        .Transaction.Commit;
    end;

    Result := True;

  except on E: Exception do
    begin
      if Self.Transacao.InTransaction then
        Self.Transacao.Rollback;

      LogError('TConversaUnidadeRepo.SaveConvUnidade ' + E.Message);
      raise E;//xception.Create(e.Message);
    end;
  end;
end;

function TConversaUnidadeRepo.SaveUnidade(input: TUnidades_class): Boolean;
var
  createEan: TProdutos_conversao_class;
  createConv: TProdutos_conversao_saida_class;
begin
  try

    Self.SqlExec(input.SQLMotor().SQLUpdateOrInsert)
        .Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      if Self.Transacao.InTransaction then
        Self.Transacao.Rollback;

      LogError('TConversaUnidadeRepo.SaveUnidade ' + E.Message);
      raise E;//xception.Create(e.Message);
    end;
  end;
end;

{ TConversaoUnidadeUtils }

constructor TConversaoUnidadeUtils.Create(banco: TIBDatabase;
  usuario: string; cod_empresa: Integer);
begin
  initRepo             := TConvUnidadeInput.Create;
  initRepo.usuario     := usuario;
  initRepo.cod_empresa := cod_empresa;

  repo := TConversaUnidadeRepo.Create(banco, initRepo);
  Funidades := TUnidadess_class.Create;
end;

function TConversaoUnidadeUtils.CriarSilent(
  input: TConvUnidadeCriarSilentInput): Boolean;
var
  payload: TSaveConvUnidadeInput;
  und: TUnidades_class;
begin
  try
    und := repo.GetUnidade(input.unid_vnd);
    try
      if und.sigla = '' then
      begin
        und.sigla := input.unid_vnd;
        und.descricao := input.unid_vnd;
        und.fracionado := 1;

        try
          repo.SaveUnidade(und);

        except on E: Exception do
          begin
            repo.registraErro('ConversaoUnidadeUtils.CriarSilent SalvarUnidadeVnd ' + E.Message);
          end;
        end;
      end;
    finally
      und.Free;
    end;
      
    und := repo.GetUnidade(input.unid_princ);
    try
      if und.sigla = '' then
      begin
        und.sigla := input.unid_princ;
        und.descricao := input.unid_princ;
        und.fracionado := 1;

        try
          repo.SaveUnidade(und);

        except on E: Exception do
          begin
            repo.registraErro('ConversaoUnidadeUtils.CriarSilent SalvarUnidadePrinc ' + E.Message);
          end;
        end;
      end;
    finally
      und.Free;
    end;

    payload := TSaveConvUnidadeInput.Create;
    try
      payload.grupo_prod := input.grupo_prod;
      payload.cod_prod := input.cod_prod;
      payload.cod_empresa := input.cod_empresa;
      payload.uvnd := input.unid_vnd;
      payload.ean := input.codigo_ean;
      payload.padraoVenda := False;
      payload.qtdePrinc := 1;
      payload.qtdeConv := 1;

      if input.fator > 1 then
        payload.qtdePrinc := input.fator
      else if input.fator > 0 then
        payload.qtdeConv := 1 / input.fator;

      Result := repo.SaveConvUnidade(payload);

    finally
      payload.Free;
    end;

  except on E: Exception do
    begin
      Result := False;
      repo.registraErro('ConversaoUnidadeUtils.CriarSilent ' + E.Message);
    end
  end;
end;

destructor TConversaoUnidadeUtils.Destroy;
begin
  repo.Free;
  initRepo.Free;
  Funidades.Free;
  inherited;
end;

function TConversaoUnidadeUtils.GetListConversao(grupoProd: Integer;
  codProd: string): TUnidadeVendas_Model;
//var
//  convs: TUnidadeVendas_Model;
//  conv: TUnidadeVenda_Model;
//  I: Integer;
begin
  Result := repo.GetListConversao(grupoProd, codProd);
//  try

//    repo
//      .queryCons.SQL('select iif(pu.padrao_venda = :disponivel_venda, -1, 1) ind,' +
//                    ' pu.grupo_prod, pu.cod_prod, pu.cod_empresa, p.unidade unid_princ, pu.unidade unid_vnd, pu.undprefxml unid_pref,' +
//                    ' iif(substring(pu.operacao from 1 for 1) = ''D'', 1 /  pu.quantidade,pu.quantidade) fator' +
//                    ' from produtos p' +
//                    ' inner join vw_produtos_conversao pu on pu.grupo_prod = p.grupo_prod and pu.cod_prod = p.cod_prod and pu.cod_empresa = p.cod_empresa' +
//                    ' and pu.unidade <> p.unidade and pu.disponivel_venda in (@disponivel_venda@)' +
//                    ' where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and p.cod_empresa = :cod_empresa' +
//                    ' union distinct' +
//                    ' select 0 ind, p.grupo_prod, p.cod_prod, p.cod_empresa, p.unidade unid_princ, p.unidade unid_vnd, null unid_pref, 1 fator from produtos p' +
//                    ' where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and p.cod_empresa = :cod_empresa' +
//                    ' order by 1, 4')
//        .ParamValue('grupo_prod', grupoProd)
//        .ParamValue('cod_prod', codProd)
//        .ParamValue('cod_empresa', codvDadosIni.cod_empresa)
//        .ParamReplace('@disponivel_venda@', IfThen(FOwerNF.fequals('natureza_nf', 'S') and FOwerNF.fequals('tipo_emissao', '1'), '''S''', '''S'', ''N'''))
//        .Open();
//
//    convs := TUnidadeVendas_Model.Create;
//    convs.CopyFrom(TUnidadeVenda_Model, queryCons.query, False);
//
//    FUndVenda.Clear;
//
//    for I := 0 to convs.Count - 1 do
//      FUndVenda.AddObject(convs.Items[I].unid_vnd, convs.Items[I]);
//
//    Result := FUndVenda;
//
//  finally
//    repo.queryCons.Close;
//  end;
end;

function TConversaoUnidadeUtils.HandleCadastroEanEproduto(
  input: TConvProdutoInput): Integer;
var
  convs: TProdutos_conversao_saidas_class;
  eans: TProdutos_conversoes_class;
  I: Integer;
begin

  try
		Result := 0;

    if repo.queryCons
      .Table('produtos', 'inf_unidade')
      .Equals('grupo_prod', input.grupo_prod)
      .Equals('cod_prod', input.cod_prod)
      .Equals('cod_empresa', input.cod_empresa)
      .Open().Scalar.AsString = 'S' then
      Exit;

    convs := TProdutos_conversao_saidas_class.Create;
    eans := TProdutos_conversoes_class.Create;
    try
      convs.CopyFrom(TProdutos_conversao_saida_class, repo.queryCons
        .SQL('select pc.grupo_prod, pc.cod_prod, pc.cod_empresa, pc.unidade, pc.quantidade,' +
             ' iif(coalesce(pc.quantidade, 0) >= 1, ''D'', ''M'') operacao,' +
             ' ''N'' DISPONIVEL_VENDA, ''N'' PADRAO_VENDA, pc.codigo_ean, 1 ativo' +
             ' from produtos_conversao pc' +
             ' left join produtos_conversao_saida ps on (ps.grupo_prod = pc.grupo_prod)' +
             '   and (ps.cod_prod = pc.cod_prod) and (ps.cod_empresa = pc.cod_empresa) and (ps.unidade = pc.unidade)')
        .Equals('pc.grupo_prod', input.grupo_prod)
        .Equals('pc.cod_prod', input.cod_prod)
        .Equals('pc.cod_empresa', input.cod_empresa)
        .Equals('coalesce(pc.ativo, 1)',  1)
        .Conditional('ps.cod_prod', 'is', 'null', False)
        .Open().query);

      eans.CopyFrom(TProdutos_conversao_class, repo.queryCons.query);

      for I := 0 to convs.Count - 1 do
        with convs.Items[I].SQLMotor() do
        begin
          Options.UpdateFields := buAll;
          repo.SqlExec(SQLUpdateOrInsert);

          Result := Result + 1;
        end;

      for I := 0 to eans.Count - 1 do
      begin
        eans.Items[I].ativo := 0;
        repo.SqlExec(eans.Items[I].SQLMotor().SQLUpdate);
      end;

      convs.Clear;
      convs.CopyFrom(TProdutos_conversao_saida_class, repo.queryCons
        .SQL('select p.grupo_prod, p.cod_prod, p.cod_empresa,' +
             ' trim(substring(p.emb_prod from 1 for 6)) unidade,' +
             ' iif(p.qtdemb > 1, p.qtdemb, 1 / p.qtdemb) quantidade ,' +
             ' iif(coalesce(p.qtdemb, 0) >= 1, ''D'', ''M'') operacao,' +
             ' ''N'' DISPONIVEL_VENDA, ''N'' PADRAO_VENDA, '''' codigo_ean, 1 ativo' +
             ' from produtos p' +
             ' left join produtos_conversao_saida ps on (ps.grupo_prod = p.grupo_prod)' +
             '   and (ps.cod_prod = p.cod_prod) and (ps.cod_empresa = p.cod_empresa)' +
             '   and (ps.unidade = trim(substring(p.emb_prod from 1 for 6)))')
        .Equals('p.grupo_prod', input.grupo_prod)
        .Equals('p.cod_prod', input.cod_prod)
        .Equals('p.cod_empresa', input.cod_empresa)
        .Conditional('coalesce(p.emb_prod, ''A'')', '<>', '')
        .Conditional('p.qtdemb', '>', '0', False)
        .Conditional('ps.cod_prod', 'is', 'null', False)
        .Open().query);

      for I := 0 to convs.Count - 1 do
      begin
        with convs.Items[I].SQLMotor() do
        begin
          Options.UpdateFields := buAll;
          repo.SqlExec(SQLUpdateOrInsert);

          Result := Result + 1;
        end;
      end;

      Result := Result + HandleUnidadeCadastroNFe(input);

      if Result > 0 then
        repo.queryCons.SQL('update produtos set inf_unidade = ''S''')
          .Equals('grupo_prod', input.grupo_prod)
          .Equals('cod_prod', input.cod_prod)
          .Equals('cod_empresa', input.cod_empresa)
          .Conditional('inf_unidade', 'is', 'null', False)
          .query.ExecSQL();

      if repo.Transacao.InTransaction then
        repo.Transacao.Commit;

    finally
      eans.Free;
      convs.Free;
    end;

  except on E: Exception do
    begin
      Result := -1;

      if repo.Transacao.InTransaction then
        repo.Transacao.Rollback;

      repo.LogError('HandleCadastroEanEproduto ' + E.Message);
      raise E;
    end;
  end;
end;

function TConversaoUnidadeUtils.HandleUnidadeCadastroNFe(
  input: TConvProdutoInput): Integer;
var
  conv: TProdutos_conversao_saida_class;
  undsNf: TProdutosConversaos_Model;
  undsProd: TUnidadeVendas_Model;
  undEan: TUnidadeVenda_Model;
  substr, str, cean: string;
  I, idx: Integer;
  cadastrar: Boolean;
begin

  try
		Result := 0;

    undsNf := TProdutosConversaos_Model.Create;
    try
      // Distinct com as unidades da nf, procurando qualquer unidade para registrar a conversao
      undsNf.CopyFrom(TProdutos_conversao_class, repo.queryCons
        .Table('notafiscal_item ni', 'distinct ni.ucom unidade, ni.ean13 codigo_ean')
        .Join('produtos p', '(p.grupo_prod = ni.grupo_prod) and (p.cod_prod = ni.cod_prod) and (p.cod_empresa = ni.cod_empresa) and (p.unidade <> ni.ucom)')
        //.Join('produtos_conversao_saida ps', '(ps.grupo_prod = p.grupo_prod) and (ps.cod_prod = p.cod_prod) and (ps.cod_empresa = p.cod_empresa) and (ps.unidade = ni.ucom)', sqLeft)
        .Equals('ni.grupo_prod', input.grupo_prod)
        .Equals('ni.cod_prod', input.cod_prod)
        .Equals('ni.cod_empresa', input.cod_empresa)
        .Conditional('ni.ucom', 'is', 'not null', False)
        .Conditional('ni.ucom', '<>', '')
        .Conditional('ni.qcom', '>', '0', False)
        //.Conditional('ps.cod_prod', 'is', 'null', False)// se tivesse o ean correto poderia ficar assim
        .Open()
        .query
        );

      for I := 0 to undsNf.Count - 1 do
      begin

        if not repo.queryCons
          .Table('notafiscal_item ni', 'first 1 ni.ucom, ni.quantidade, ni.qcom, ni.qtdemb,ni.quantidade / ni.qcom, ni.nitem_xml, nf.xml_nfe')
          .Join('produtos p', '(p.grupo_prod = ni.grupo_prod) and (p.cod_prod = ni.cod_prod) and (p.cod_empresa = ni.cod_empresa) and (p.unidade <> ni.ucom)')
          .Join('notafiscal nf', 'nf.cod_nf = ni.cod_nf and nf.cod_empresa = ni.cod_empresa')
          .Equals('ni.grupo_prod', input.grupo_prod)
          .Equals('ni.cod_prod', input.cod_prod)
          .Equals('ni.cod_empresa', input.cod_empresa)
          .Equals('ni.ean13', undsNf.Items[I].codigo_ean)
          .Conditional('ni.ucom', 'is', 'not null', False)
          .Conditional('ni.ucom', '<>', '')
          .Conditional('ni.qcom', '>', '0', False)
          .Equals('ni.altera_estoque_cfop', 'S')
          .Equals('ni.altera_custo_cfop', 'S')
          .Equals('nf.emissao_propria', 'N')
          .Equals('nf.status', 'Fechada')
          .OrderBy('nf.data_lanc desc')
          .Open()
          .query.IsEmpty then
        begin
          conv := TProdutos_conversao_saida_class.Create();
          conv.grupo_prod       := input.grupo_prod;
          conv.cod_prod         := input.cod_prod;
          conv.cod_empresa      := input.cod_empresa;
          conv.unidade          := repo.queryCons.fstr('ucom');
          conv.quantidade       := Max(repo.queryCons.ffloat('quantidade'), repo.queryCons.ffloat('qcom')) / Min(repo.queryCons.ffloat('quantidade'), repo.queryCons.ffloat('qcom'));
          conv.operacao         := IfThen(repo.queryCons.ffloat('quantidade') > repo.queryCons.ffloat('qcom'), 'D', 'M');
          conv.disponivel_venda := 'N';
          conv.padrao_venda     := 'N';
          conv.ativo            := 1;

          str := repo.queryCons.fstr('xml_nfe');
          str := ExtractStr(str, Format('<det nItem="%d">', [repo.queryCons.fint('nitem_xml')]), '</prod>');
          conv.codigo_ean := Trim(ExtractStr(str, '<cEAN>', '</cEAN>'));
          conv.codigo_ean := StringReplace(conv.codigo_ean, 'SEM GTIN', '', [rfIgnoreCase]);
          conv.codigo_ean := EANUtils.GetValid(conv.codigo_ean, repo.QrAux);

          undsProd := repo.GetListConversao(input.grupo_prod, input.cod_prod);
          try
            if (undsProd.GetConversaoPorEan(conv.codigo_ean) = nil) and (conv.codigo_ean <> '' ) then
            begin
              if undsProd.GetConversao(conv.unidade, False) <> nil then
                conv.unidade := undsProd.GerarNovaUnidadeUnq(conv.unidade, conv.codigo_ean);

              cadastrar := conv.unidade <> '';
            end
            else
              cadastrar := (undsProd.GetConversao(conv.unidade, False) = nil);

            if cadastrar then
              with conv.SQLMotor() do
              begin
                Options.UpdateFields := buAll;
                repo.SqlExec(SQLUpdateOrInsert);

                Result := Result + 1;
              end;

          finally
            undsProd.Free;
            conv.Free;
          end;
        end;
      end;

    finally
      undsNf.Free;
    end;

  except on E: Exception do
    begin
      Result := 0;

      repo.LogError('HandleCadastroEanEproduto ' + E.Message);
      raise E;
    end;
  end;
end;

function TConversaoUnidadeUtils.HandleUnidadeFracao(und: string;
  qtde: Double): Double;
var
  I: Integer;
begin
  Result := qtde;
	  for I := 0 to Funidades.Count - 1 do
      if AnsiUpperCase(Trim(und)) = AnsiUpperCase(Funidades.Items[I].sigla) then
      begin
        if Funidades.Items[I].fracionado = 0 then
          Result := RoundTo(qtde, 0);
        Break;
      end;
end;

procedure TConversaoUnidadeUtils.LoadUnidades;
begin
  Funidades.CopyFrom( TUnidades_class,
     repo.queryCons.Table('unidades', '*')
     .Open().query, false);
end;

function TConversaoUnidadeUtils.SetPreferencial(
  input: TUnidadeVenda_Model): Boolean;
var
  payload: TSaveConvUnidadeInput;
  convDb: TUnidadeVenda_Model;
begin
  convDb := repo.GetProdutoConversao(input.grupo_prod, input.cod_prod, input.unid_vnd);
  payload := TSaveConvUnidadeInput.Create;
  try
    payload.grupo_prod := convDb.grupo_prod;
    payload.cod_prod := convDb.cod_prod;
    payload.cod_empresa := convDb.cod_empresa;
    payload.uvnd := convDb.unid_vnd;
    payload.qtdePrinc := convDb.qtde_princ;
    payload.qtdeConv := convDb.qtde_vnd;
    payload.dispVenda := convDb.disponivel_venda = 'S';
    payload.padraoVenda := convDb.padrao_venda = 'S';
    payload.ean := convDb.codigo_ean;

    payload.undXmlPref := input.unid_pref;

    try

      Result := repo.SaveConvUnidade(payload);

    except on E: Exception do
      ShowAtencao('Erro ao definir preferencia de conversão para entrada de XML' + sLineBreak + E.Message);
    end;

  finally
    convDb.Free;
    payload.Free;
  end;
end;

end.
