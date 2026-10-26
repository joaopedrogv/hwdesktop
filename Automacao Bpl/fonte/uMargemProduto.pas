unit uMargemProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, StdCtrls, Buttons, uEditMoeda, DBCtrls, Mask, 
  uClasseMargemProduto, Grids, DBGrids, ComCtrls, xhGrid;

type
  TfrmMargemProduto = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    GroupBox1: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    edNumFabProd: TMaskEdit;
    edPrecoVenda: TEditMoeda;
    edPrecoVendaComDesconto: TEditMoeda;
    edPercentualDesconto: TEditMoeda;
    edDiasDeEstoque: TEditMoeda;
    BitBtn1: TBitBtn;
    rbVendaVarejo: TRadioButton;
    rbVendaAtacado: TRadioButton;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Label45: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label58: TLabel;
    Label42: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label64: TLabel;
    Label51: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label54: TLabel;
    edValorUltimaCompra: TEditMoeda;
    edCustoAquisicao: TEditMoeda;
    edCustoAquisicaoPerc: TEditMoeda;
    edtQtdeVenda: TEditMoeda;
    EdtMargemEsp: TEditMoeda;
    edValorDespesasFixas: TEditMoeda;
    edDespesasFixas: TEditMoeda;
    EdtCustosVariaveis: TEditMoeda;
    EdPercVariavel: TEditMoeda;
    edLucroLiquidoSobreFaturamento: TEditMoeda;
    edLucroLiquidoSobreFaturamentoPerc: TEditMoeda;
    Panel3: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    EdtPeProduto: TEditMoeda;
    EdtCustosTotais: TEditMoeda;
    EdtPercCustosTotais: TEditMoeda;
    EdtQtdeVendida: TEditMoeda;
    EdtValorCFProduto: TEditMoeda;
    edtMarkup: TEditMoeda;
    edtmarkupGrupo: TEditMoeda;
    BitBtn2: TBitBtn;
    EdValorVendaSug: TEditMoeda;
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    Label55: TLabel;
    ComboBox2: TComboBox;
    Label56: TLabel;
    Button1: TButton;
    HierCubeGrid1: THierCubeGrid;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label57: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    edIRRF: TEditMoeda;
    edIRRFPerc: TEditMoeda;
    edADIRRF: TEditMoeda;
    edADIRRFPerc: TEditMoeda;
    Label62: TLabel;
    Label63: TLabel;
    edLucroLiqRetidoEmpresa: TEditMoeda;
    edLucroLiqRetidoEmpresaPerc: TEditMoeda;
    Label65: TLabel;
    imgInformation: TImage;
    Label66: TLabel;
    Label67: TLabel;
    edCSLL: TEditMoeda;
    edCSLLPerc: TEditMoeda;
    procedure imgInformationClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure EdtCustosVariaveisExit(Sender: TObject);
    procedure edValorDespesasFixasExit(Sender: TObject);
    procedure edCustoAquisicaoExit(Sender: TObject);
    procedure EdtMargemEspExit(Sender: TObject);
    procedure edNumFabProdKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbVendaVarejoClick(Sender: TObject);
    procedure rbVendaAtacadoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edRecolhimentoICMSPercExit(Sender: TObject);
    procedure edPercentualDescontoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNumFabProdExit(Sender: TObject);
    function verificaDNA: boolean;
  private
    { Private declarations }
    HCadBasico: THandle;
  public
    { Public declarations }
    vflgchamada: integer;
  end;

var
  frmMargemProduto: TfrmMargemProduto;
  obMargemProd:TMargemProduto;

implementation

uses uDtmMargemProduto, uDtmAtivo,uClassescadastrosBasicos;

{$R *.dfm}

procedure TfrmMargemProduto.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if rbVendaVarejo.Checked then
    obMargemProd.vProd.vtipovenda:='VAREJO'
  else
   obMargemProd.vProd.vtipovenda:='ATACADO';
  if not obMargemProd.vProd.IsEmpty then
  begin
    obMargemProd.efetuarCalculo;
    if vflgchamada <> 1 then
    	if (Self.Enabled) and (Self.Visible) and (EdtMargemEsp.CanFocus) then
    		EdtMargemEsp.SetFocus;
  end
  else
    Application.MessageBox('Sem produto selecionado','Atenção',MB_OK+MB_ICONINFORMATION);

  imgInformation.Hint :=
    'Alíquota do Imposto de Renda: ' + Format('%n', [obMargemProd.AliqIRRF]) + #13 +
    'Alíquota do AdicionalImposto de Renda: ' + Format('%n', [obMargemProd.AliqIRRFAdicional]) + #13 + #13 +
    'A base de cálculo do valor do Adicional do Imposto de Renda pago no perído da apuração foi de ' +
      Format('%n', [obMargemProd.vProd.vPercBaseADIRRF]) + '% da base de cálculo do Imposto de Renda' + #13 +
    'Verifique no DNA da empresa com o registro do tipo "AIR" (Adicional do Imposto de Renda)';
end;

procedure TfrmMargemProduto.BitBtn2Click(Sender: TObject);
var
 vtipocond: string;
 vmargmin: real;
begin
  inherited;
  if rbVendaVarejo.Checked then
    vtipocond:='V'
  else
    vtipocond:='A';
  vmargmin:=0;
  vmargmin:=edDespesasFixas.Valor;
  vmargmin:=EdPercVariavel.Valor;
  vmargmin:=edLucroLiquidoSobreFaturamento.Valor;
  vmargmin:=edDespesasFixas.Valor+EdPercVariavel.Valor+edLucroLiquidoSobreFaturamentoPerc.Valor;
  if (ComboBox1.text = 'PRODUTOS') or (ComboBox1.Text = 'PRODUTOS - Grupos') then
  begin
   if Application.MessageBox('Tem certeza que deseja registrar o Markup calculado? Responda S '+
   ' para Grupo e N para o Produto?', 'Registrar Markup', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    obMargemProd.vProd.RegistrarMarkupprod(edtMarkup.Valor,1,vtipocond,edLucroLiquidoSobreFaturamentoPerc.Valor,vmargmin)
   else
   begin
    obMargemProd.vProd.RegistrarMarkupprod(edtMarkup.Valor,2,vtipocond,edLucroLiquidoSobreFaturamentoPerc.Valor,vmargmin);
   end;
  end
  else
  begin
   if Application.MessageBox('Tem certeza que deseja registrar o Markup calculado para este Sub grupo?',
   'Registrar Markup', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    obMargemProd.vProd.RegistrarMarkupprod(edtMarkup.Valor,3,vtipocond,edLucroLiquidoSobreFaturamentoPerc.Valor,vmargmin);
  end;
end;

procedure TfrmMargemProduto.BitBtn3Click(Sender: TObject);
begin
  inherited;
 obMargemProd.abrirvendaporGrupo(ComboBox1.Text);
 BitBtn4.Enabled:=true;
end;

procedure TfrmMargemProduto.BitBtn5Click(Sender: TObject);
begin
  inherited;
edPrecoVenda.Valor:=EdValorVendaSug.Valor;
edPercentualDescontoExit(sender);
BitBtn1Click(Sender);
end;

procedure TfrmMargemProduto.BitBtn6Click(Sender: TObject);
var
  dna: TBasicosFormularios;
begin
  if not vDadosIni.PesqPros('BAS083', 'ABRIR', '', 'APURACAO_DEPTO', '', obMargemProd.vProd.vEmp.buscas, True) then
    Exit;
  inherited;
  dna.cadDNDEmpresa;
end;

procedure TfrmMargemProduto.Button1Click(Sender: TObject);
begin
  inherited;
  obMargemProd.vProd.vendasgeralBI(strtoint(ComboBox2.text));
  HierCubeGrid1.SummarySettings.BeginUpdate;
  try
   HierCubeGrid1.SummarySettings.AddSummary('MARKUP','("BRUTO"."Sum"-"DESCONTO"."Sum")/"CUSTO"."Sum"');
   HierCubeGrid1.SummarySettings.Items[3].FunctionSum.SubFunctions[0].FormatString:='##0.0000';
  except

  end;
  HierCubeGrid1.SummarySettings.EndUpdate;
end;

procedure TfrmMargemProduto.ComboBox1Exit(Sender: TObject);
begin
  inherited;
 if not verificaDNA then
   if vflgchamada <> 1 then
     if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
       ComboBox1.SetFocus;
// if combobox1.Text = 'PRODUTOS' then
//  BitBtn2.Enabled:=true
// else
//  BitBtn2.Enabled:=False;
  // Verificar aqui, o fechamento da tabela de grupos/subgrupos
  edPercentualDesconto.Valor:=0;
  obMargemProd.fechaVendaporgrup;
  BitBtn4.Enabled := false;
end;

procedure TfrmMargemProduto.edCustoAquisicaoExit(Sender: TObject);
begin
  inherited;
edRecolhimentoICMSPercExit(sender);
end;

procedure TfrmMargemProduto.edNumFabProdExit(Sender: TObject);
var
  lucroLiq, lucroLiqPerc:Currency;
  vtpop: integer;
begin
  inherited;
  if ActiveControl = ComboBox1 then
    exit;
  if rbVendaVarejo.Checked then
    obMargemProd.vProd.vtipovenda:='VAREJO'
  else
   obMargemProd.vProd.vtipovenda:='ATACADO';
   vtpop:=ComboBox1.Items.IndexOf(ComboBox1.Text)+1;
  if vtpop = 0 then
    vtpop:=1;
  if trim(edNumFabProd.Text) = '' then
  begin
    if vtpop = 1 then
     edNumFabProd.Text := vDadosIni.pesquisaRapida('PRODUTOS');
    if vtpop = 2 then
     edNumFabProd.Text := vDadosIni.pesquisaRapida('GRUPOS');
    if vtpop = 3 then
     edNumFabProd.Text := vDadosIni.pesquisaRapida('SUB_GRUPO');
    if vtpop = 4 then
     edNumFabProd.Text := vDadosIni.pesquisaRapida('SERVICOS_EMP', ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa, 'Tipo de Serviço');
  end;
  if trim(edNumFabProd.Text) <> '' then
  begin
    if not obMargemProd.obterProduto(edNumFabProd.Text,rbVendaAtacado.Checked,lucroLiq,lucroLiqPerc,vtpop) then
    begin
      Application.MessageBox('Produto não encontrado','Atenção',MB_OK+MB_ICONINFORMATION);
      if vflgchamada <> 1 then
      	if (Self.Enabled) and (Self.Visible) and (edNumFabProd.CanFocus) then
        	edNumFabProd.SetFocus;
    end
    else
    begin
     Label40.Caption:=Format('%n',[obMargemProd.vProd.vprecvendavar]);
     Label43.Caption:=Format('%n',[obMargemProd.vProd.vprecvendaatac]);
     Label44.Caption:=obMargemProd.vProd.vdescprodserv;
     Label46.Caption:=obMargemProd.vProd.vcldemand;
     Label47.Caption:=obMargemProd.vProd.vclinvest;
     Label48.Caption:=obMargemProd.vProd.vclpreco;
     Label49.Caption:=obMargemProd.vProd.vclpop;
     Label50.Caption:=obMargemProd.vProd.vclqtde;
     Label52.Caption:=obMargemProd.vProd.vclfreq;
     Label53.Caption:=obMargemProd.vProd.vclatual;
     EdtPeProduto.Valor:=0;
     EdtCustosVariaveis.valor:=0;
     EdtValorCFProduto.valor:=0;
//     edValorDespesasFixas.Valor:=0;
     edLucroLiquidoSobreFaturamento.Valor :=0;
//    frmMargemProduto.edPercentualDesconto.Valor := FpercDesconto;
//     edDespesasFixas.Valor:=0;
//    frmMargemProduto.edValorJurosCompraPrazo.Valor := FvalorJurosCompraPrazo;
     edLucroLiquidoSobreFaturamentoPerc.Valor := 0;
//     edCustoAquisicao.Valor := 0;
//     edValorDespesasFixas.Valor := 0;
//     edDespesasFixas.Valor :=0;
     EdtCustosVariaveis.Valor:=0;
     EdPercVariavel.valor:=0;
     edtQtdeVenda.Valor:=0;
//     edDiasDeEstoque.Valor := 0;
//     edCustoAquisicaoPerc.Valor := FcustoAquisicaoPerc;
     EdtCustosTotais.Valor:=0;
     EdtPercCustosTotais.Valor:=0;
    end;
  end;
end;

procedure TfrmMargemProduto.edNumFabProdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    edNumFabProd.Text := vDadosIni.pesquisaRapida('PRODUTOS');
end;

procedure TfrmMargemProduto.edPercentualDescontoExit(Sender: TObject);
begin
  inherited;
  edPrecoVendaComDesconto.Valor := edPrecoVenda.Valor - (edPrecoVenda.Valor * edPercentualDesconto.Valor) / 100;
  obMargemProd.atualizaValores;
end;

procedure TfrmMargemProduto.edRecolhimentoICMSPercExit(Sender: TObject);
begin
  inherited;
  obMargemProd.atualizaValores;
  if not obMargemProd.vProd.IsEmpty then
    obMargemProd.efetuarCalculo;
end;

procedure TfrmMargemProduto.EdtCustosVariaveisExit(Sender: TObject);
begin
  inherited;
edRecolhimentoICMSPercExit(sender);
end;

procedure TfrmMargemProduto.EdtMargemEspExit(Sender: TObject);
begin
  inherited;
edRecolhimentoICMSPercExit(sender);
end;

procedure TfrmMargemProduto.edValorDespesasFixasExit(Sender: TObject);
begin
  inherited;
edRecolhimentoICMSPercExit(sender);
end;

procedure TfrmMargemProduto.FormCreate(Sender: TObject);
begin
  inherited;
if obMargemProd = nil  then
  obMargemProd := TMargemProduto.create;
vflgchamada:=0;
end;

procedure TfrmMargemProduto.FormDestroy(Sender: TObject);
begin
  inherited;
 if obMargemProd <> nil then
 begin
  obMargemProd.Free;
  obMargemProd:=nil;
 end;
end;

procedure TfrmMargemProduto.FormShow(Sender: TObject);
begin
  inherited;
  verificaDNA;
  if vflgchamada <> 1 then
    if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      ComboBox1.SetFocus;
end;

procedure TfrmMargemProduto.imgInformationClick(Sender: TObject);
begin
  inherited;
  Application.MessageBox(PChar(imgInformation.Hint), 'Atenção', 0 + 64);
end;

procedure TfrmMargemProduto.rbVendaAtacadoClick(Sender: TObject);
begin
  inherited;
  if rbVendaAtacado.Checked then
  begin
    edDespesasFixas.Valor := 0;
    edNumFabProdExit(Sender);
    edPercentualDescontoExit(Sender);
    obMargemProd.atualizaValores;
    BitBtn1Click(Sender);
  end;
end;

procedure TfrmMargemProduto.rbVendaVarejoClick(Sender: TObject);
begin
  inherited;
  if rbVendaVarejo.Checked then
  begin
    if obMargemProd = nil then
     obMargemProd := TMargemProduto.create;
    edNumFabProdExit(edNumFabProd);
    edPercentualDescontoExit(Sender);
    BitBtn1Click(Sender);
  end;
end;

function TfrmMargemProduto.verificaDNA: boolean;
var
 vdep: string;
begin
  Result:=true;
  if obMargemProd = nil then
   obMargemProd := TMargemProduto.create;
  obMargemProd.vProd.vEmp.abreEmpresa;
  if copy(ComboBox1.text,1,8) = 'PRODUTOS' then
    vdep:='CODDEPPRODUTOS';
  if ComboBox1.text = 'SERVIÇOS' then
    vdep:='CODDEPOFICINA';
  if ComboBox1.text = 'VEICULOS' then
    vdep:='CODDEPVEICULOS';
  if ComboBox1.text = 'VEICULOS SEMI-NOVOS' then
    vdep:='CODDEPVEICULOSUS';
  if not obMargemProd.vProd.verificarDNA(obMargemProd.vProd.vEmp.dataSet.FieldByName(vdep).AsInteger) then
  begin
    Application.MessageBox('Não Encontrado a fórmula do DNA do DEPTO/EMPRESA','Atenção',MB_OK+MB_ICONINFORMATION);
    result:=false;
  end
  else
  begin
    Edit1.text:=obMargemProd.vProd.vDNA;
    Edit2.Text:=obMargemProd.vProd.VDepto;
    edit3.Text:=vDadosIni.StrZero(obMargemProd.vProd.vmesap,2)+'/'+
    IntToStr(obMargemProd.vProd.vanoap);
    Edit4.Text:=format('%8.4f', [obMargemProd.vProd.vMargemMin]);
    Edit5.Text:=format('%8.4f', [obMargemProd.vProd.vMarkupmin]);
  end;
//  if obMargemProd.concessionaria = 'S' then
  begin
    rbVendaVarejo.Enabled := true;
    rbVendaAtacado.Enabled := true;
    rbVendaVarejo.Checked := true;
//  end
//  else
//  begin
//    rbVendaAtacado.Enabled := false;
//    rbVendaVarejo.Checked := true;
  end;
end;

initialization
  RegisterClass(TfrmMargemProduto);
finalization
  UnRegisterClass(TfrmMargemProduto);

end.
