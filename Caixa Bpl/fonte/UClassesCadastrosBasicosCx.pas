unit UClassesCadastrosBasicosCx;

interface

uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls,
  {$IFDEF USAVARIANTS} Variants,{$ENDIF}
  ComObj, ComCtrls, ExtCtrls, RDprint, UDtmCadastrosBasicosCx, IBQuery, IBStoredProc,
  uCadPadrao, Graphics, IniFiles,  FileCtrl, IBDatabase, DBCtrls, StdCtrls, 
  CheckLst;

type
   TControle = class;
   TBalanco = class;
   TCtrlBalanco = class;
   TCobrebem_Controle = class;

   TPlanoContas = class;
   TFornecedorConta = class;
   TPContasMes = class;
   TGrupoPC = class;
   TSubGrupoPC = class;
   TDptoGrupoPC = class;
   TDadosDre = class;
   TRateioDpto = class;
   TDptoDestino = class;
   TEmpresaPConta = class;
   TRateioContas = class;
   THistPContas = class;
   TPContasBalanco = class;
   TAdministradoraCartao = class;
   TTerminalCartao = class;
   TOcorrenciaAdm = class;
   TEmpresaDefControle = class;

  TEmpresasUnificadasEcmmerce = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosEmpresas: Boolean;
    function _BuscarEmpresas(vCodEmp: Integer): Boolean;
  end;

   TControleTaxaEcommerce = class (TDataSet_OOP)
   private
   public
   	  destructor Destroy; override;
   	  constructor create;
      function insert(pCodControle: Integer; pCodEmpMult: Integer = 0; pConsRegraFrete: string = ''): boolean;
      function delete : boolean; override;
      function edit : boolean; override;
      function post : boolean; override;
      function abreControleEcommerce(pCodContole: Integer; pCodEmpMult: Integer = 0): boolean;
      function abreFormTaxaEcommerce(pCodControle: Integer): boolean;
      function abreFormTaxaEcommerceCad(pEditar: boolean = false): boolean;
      function atualizarCamposValores: boolean;
   var
    	vEmpresasUnificadas: TEmpresasUnificadasEcmmerce;
   end;

   InstituicaoPagSPEDEnum = (ipPagadora, ipTransacao);

   TControle = class (TDataSet_OOP)
   private
  	  FlkTipoPagamento: TDadosLookUp_OOP;
	    FlkBandeira: TDadosLookUp_OOP;
    	procedure SetlkBandeira(const Value: TDadosLookUp_OOP);
    	procedure SetlkTipoPagamento(const Value: TDadosLookUp_OOP);
      procedure ControlesAfterScroll(DataSet: TDataSet);
   public
      destructor Destroy; override;
      constructor create;
      function insert : boolean; override;
      function delete : boolean; override;
      function edit : boolean; override;
      function post : boolean; override;
      function cancel : boolean; override;
      function removerAtivarVinculoBalanco(pAtivar: boolean = false): boolean;
      function abreControle : boolean;
      function abrelixeira : boolean;
      function restauralixeira : boolean;
      function statuslixeira : boolean;
      procedure cadControle(TipoForm : Integer);
      function SelecionarDiretorio (diretorioInicial:string) : String;
      function verificarCodigoControle : Boolean;
      function abreFormIncluirControleClienteVenda: boolean;
      function adicionarRemoverControleClienteVenda(pRemover: boolean = False): boolean;

      function PesquisaControlesBalanco (Cod_balanco : string) : Boolean;
      function PesquisaControleCadastrado : Boolean;
      function IncluirControleBalanco : Boolean;
      function verificaControle_e_balanco : Boolean;
      function VerificarSaldoCtrl(vdataSource: TdataSource): boolean;
      function fechaSaldo(vdataSource: TdataSource): boolean;
      function modificaSaldoB(vdata: Tdate;vvalor: Currency;vop: integer): boolean;
      function abreFormCtrlBalanco: boolean;
      function verificarControleSemVinculo: boolean;
      function retornaIdentificacaoEmp(pCodEmpresa: Integer): string;
      procedure abreFpProgFid(vcomb: TDbCombobox; vlab: TLabel);
      function testarRegraFormaProgFid(pregra: string): boolean;
      function abreFormDefinirContolesPorEmpresa: boolean;
      function definirContolesPorEmpresa: boolean;
      function GetNomeClienteAdmCartao(inst: InstituicaoPagSPEDEnum): string;
      function _replicarControles: Boolean; 
      function atualizarEmpControle(pCommitar: Boolean = False): Boolean;
      procedure _marcarTodos;
  	  procedure _desmarcarTodos;
	    procedure _marcaDesmarcaLinha;

      property lkTipoPagamento: TDadosLookUp_OOP read FlkTipoPagamento write SetlkTipoPagamento;
      property lkBandeira: TDadosLookUp_OOP read FlkBandeira write SetlkBandeira;
   var
      vCodigoControle : string;
      vTipoPlano: string;
      vCartaoSped: Integer;
      vBalanco : TBalanco;
      vCtrlBalanco : TCtrlBalanco;
      vCobrebem_Controle : TCobrebem_controle;
      vEmpresaDefControle: TEmpresaDefControle;
      vControleTaxaEcommerce: TControleTaxaEcommerce;
   end;

   TEmpresaDefControle = class (TDataSet_OOP)
   private
   public
      Constructor Create;
      function abreEmpresaDefControle(pCodigoCtrl: Integer): boolean;
      procedure _marcarTodos;
      procedure _desmarcarTodos;
      procedure _marcaDesmarcaLinha;
   end;

   TBalanco = class (TDataSet_OOP)
   private
   public
      Constructor Create;
      function abreBalanco : boolean;
   end;

   TCtrlBalanco = class (TDataSet_OOP)
   private
   public
      Constructor Create;
      function abreCtrlBalanco (cod_controle : string): Boolean;
      function insert : Boolean; override;
      function post(cod_balanco: string) : Boolean;
      function delete : Boolean; override;
   var
     vComitar: boolean;
     vChangeCount: Integer;
   end;

   TCobrebem_controle = class(TDataSet_OOP)
   private
   public
      constructor create;
      function AbreCobrebemControle : boolean;
   end;

   TFornecedorConta = class(TDataSet_OOP)
   private
   public
      constructor create;
      function AbreFornecedor: boolean; overload;
      function AbreFornecedor(pCodCliente: Integer): boolean; overload;
      function AbreFornecedor(pCpfCnpj: string): boolean; overload;
   end;

   TPlanoContasClientes = class (TDataSet_OOP)
   private
   public
      Constructor Create;
      function abrePcontasClientes(n_conta_plc: Double): Boolean;
      function insert(n_conta_plc: Double): Boolean;
      function post: Boolean;
      function delete: Boolean;
   var
     vComitar: boolean;
     vChangeCount: Integer;
   end;

   TPlanoContasRel = class(TDataset_OOP)
   private

   public
     constructor create;
     function post: boolean; override;
     function Insert: boolean; override;
     function edit: boolean; override;
     function Delete: boolean; override;
     function _abrelixeira: boolean;
     function _restauralixeira: boolean;
     function _lixeiraCheia: boolean;
     procedure _cadPlanoContasRel(pTipoForm: Integer);
     function abrirPContas(pCheckListBox: TCheckListBox): boolean;
     function atualizarPContas(pCheckListBox: TCheckListBox): boolean;
   end;

   TPlanoContas = class (TDataSet_OOP)
   private
   	FSairDestroy: boolean;
   public
      Constructor create(pCriaTodos: boolean = True);
      destructor Destroy;
      function insert : boolean; override;
      function delete : boolean; override;
      function edit : boolean; override;
      function post : boolean; override;
      function cancel : boolean; override;
      function removerAtivarVinculoBalanco(pAtivar: boolean = false): boolean;
      function abrePlanoContas(pTipo: string = '') : boolean;
      function abrelixeira : boolean;
      function restauralixeira : boolean;
      function statuslixeira : boolean;
      procedure cadPlanoContas(TipoForm : Integer);

      function VerificaPlanoContas : Boolean;
      function existePlanoContas(pConta: string; pTipo: string = ''): Boolean;
      function VerificaGrupoPC (cod:string) :Boolean;
      function VerificaDpto (cod:string) : Boolean;
      function VerificaSubGrupoPC (cod:string) : Boolean;
      function VerificaPContasBalanco : Boolean;
      function verificarControleSemVinculo: boolean;

      Function Procura_e_Troca(Encontrar, Substituir: string; Vconteudo: string): string;

      function _replicarPContas: Boolean; 
   var
     vPlanoContasClientes: TPlanoContasClientes;
  	 vFornecedorConta: TFornecedorConta;
     vGrupoPC : TGrupoPC;
     vSubGrupoPC : TSubGrupoPC;
     vDptoGrupoPC : TDptoGrupoPC;
     vDadosDre : TDadosDre;
     vRateioDpto : TRateioDpto;
     vPcontasM : TPContasMes;
     vDptoDestino : TDptoDestino;
     vEmpresa : TEmpresaPConta;
     vRateioContas : TRateioContas;
     vHistPContas : THistPContas;
     vBalanco : TBalanco;
     vPContaBalanco : TPContasBalanco;
   end;

   TPContasMes = class (TDataSet_OOP)
   private
   public
      Constructor create;
      function insert : boolean; override;
      function post : boolean; override;
      function abrePContasM : Boolean;

   end;


   TGrupoPC = class(TDataSet_OOP)
   private
   public
      constructor create;
      function insert : boolean; override;
      function delete : boolean; override;
      function edit : boolean; override;
      function post : boolean; override;
      function cancel : boolean; override;
      function abreGrupoPC : Boolean;
      function abreGrupoPCRelatorio (cod_grp:string): Boolean;
   end;

   TSubGrupoPC = class(TDataSet_OOP)
   private
   public
      constructor create;
      function insert : boolean; override;
      function delete : boolean; override;
      function edit : boolean; override;
      function post : boolean; override;
      function cancel : boolean; override;
      function abreSubGrupoPC : Boolean;
   end;

   TDptoGrupoPC = class(TDataSet_OOP)
   private
   public
      constructor create;
      function insert : boolean; override;
      function delete : boolean; override;
      function edit : boolean; override;
      function post : boolean; override;
      function cancel : boolean; override;
      function abreDptoGrupoPC : Boolean;
      function abreDptoRelatorio (cod_dpto :string) : Boolean;
   end;

   TDadosDre = class(TDataSet_OOP)
   private
   public
      constructor create;
      function abreDadosDre : Boolean;
   end;

   TRateioDpto = class(TDataSet_OOP)
   private
   public
      constructor create;
      function insert : boolean; override;
      function delete : boolean; override;
      function edit : boolean; override;
      function post (cod_dep:string) : boolean;
      function cancel : boolean; override;
      function abreRateioDpto (cod:string) : Boolean;

      function VerificaRateioDpto (cod_dep,cod_destino : string) : Boolean;

   end;

   TDptoDestino = class (TDataSet_OOP)
   private
   public
      Constructor create;
      function abreDptoDestino : boolean;
   end;

   TEmpresaPConta = class (TDataSet_OOP)
   private
   public
      Constructor create;
      function abreEmpresa : boolean;
   end;

   TRateioContas = class(TDataSet_OOP)
   private
   public
      constructor create;
      function insert : boolean; override;
      function delete : boolean; override;
      function post : boolean; override;
      function cancel : boolean; override;
      function abreRateioContas(pNConta: string = '') : Boolean;
      function VerificaContasVinculadas : Boolean;
   var
      vPContaOrigem : string;
   end;

   THistPContas = class(TDataSet_OOP)
   private
   public
      constructor create;
      function insert : boolean; override;
      function delete : boolean; override;
      function post : boolean; override;
      function cancel : boolean; override;
      function abreHistPContas(pNConta: string = '') : Boolean;
      // joao pedro.
      function abreEscolhaHistoricoPadrao(pConta: Double): boolean;
   end;

   TPContasBalanco = class(TDataSet_OOP)
   private
   public
      constructor create;
      function insert : boolean; override;
      function delete : boolean; override;
      function post(cod_balanco :string) : boolean;
      function abrePContasBalanco : Boolean;
   var
     vComitar: boolean;
     vChangeCount: Integer;
   end;

  TListaCliente = class(TDataSet_OOP)
  	public
    	constructor create;
    	destructor destroy; override;
  end;

  TAdquirenteCartao = class(TDataSet_OOP)
  public
		constructor create;
    function _abreAdquirenteCartao: Boolean;
  end;

	TAdministradoraCartao = class(TDataSet_OOP)
  public
    constructor create;
    destructor Destroy;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    function _abreTodos: Boolean;
    procedure _cadAdmCartao(pTipoForm: integer);
    function _existeCliente(pCodCliente: string): boolean;
    function _abreClientes: boolean;
  var
  	vAdquirenteCartao: TAdquirenteCartao;
  	vTermCartao: TTerminalCartao;
    LClientes: TListaCliente;
  end;

  TTerminalCartao = class(TDataSet_OOP)
  private
  	FCodAdm: integer;
  public
		constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function abreFormTermCartao(pCodAdm: string): boolean;
    function abreOuAtualizaTerminalCartao(pCodAdm: string): boolean;
		function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    function abreTerminalCartao: boolean;
  end;

  TOcorrenciaAdm = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    function _abreTodos: Boolean;
    function _existeOcorrencia(pCodOcorr: Integer): Boolean;
    procedure _cadOcorrenciaAdm(pTipoForm: integer);
    function _pesquisa(pCampo, pCondicao, pValor, pData1, pData2: string): Boolean;
  var
    vPlContas: TPlanoContas;
    vPlContasSaida: TPlanoContas;
  end;

  TBandeiras_Cartao = class(TDataSet_OOP)
  private
    //procedure BuildFieldsDB;
    function enviarParaLixeira: Boolean;
    procedure DataSetAfterScroll(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create(ADataSet: TClientDataSet = nil);
    function post: Boolean; override;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete : boolean; override;
    function restaurar: Boolean;
    function abrirBandeiras(ADaLixeira: Boolean): Boolean;
  end;

  TTaxas_Bandeiras = class(TDataSet_OOP)
  private
    FlkAdministradora: TDadosLookUp_OOP;
    FlkBandeira: TDadosLookUp_OOP;
    FlkDebCred: TDadosLookUp_OOP;
    FlkConsAdm: TDadosLookUp_OOP;
    FlkConsBand: TDadosLookUp_OOP;

    procedure DataSetAfterScroll(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create(ADataSet: TClientDataSet = nil; ACodigoAdm: Integer = 0; ACodigoBandeira: Integer = 0);
    function post: Boolean; override;
    function edit: Boolean; override;
    function insert: Boolean; override;
    function delete: Boolean; override;
    function abrirTaxasCartao(ACodigoAdm, ACodigoBandeira: Integer): Boolean;
    procedure ConsultaAfterScroll(DataSet: TDataSet);

    property lkAdministradora: TDadosLookUp_OOP read FlkAdministradora write FlkAdministradora;
    property lkBandeira: TDadosLookUp_OOP read FlkBandeira write FlkBandeira;
    property lkDebCred: TDadosLookUp_OOP read FlkDebCred write FlkDebCred;

    property lkConsAdm: TDadosLookUp_OOP read FlkConsAdm write FlkConsAdm;
    property lkConsBand: TDadosLookUp_OOP read FlkConsBand write FlkConsBand;
  end;

  TRoteamentoRedesAdm = class(TDataSet_OOP)
  private
    FAdm: TDataSet_OOP;
    procedure dataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Abrir;
    function Salvar(rede, debcred: string; adm, bandeira: Integer; inserir: Boolean): Boolean;
    procedure Excluir;

    property Adm: TDataSet_OOP read FAdm write FAdm;
  end;

var
	cadAdm: TAdministradoraCartao;
  cadOcorrAdm: TOcorrenciaAdm;
  cadBandeira: TBandeiras_Cartao;
  cadTaxas: TTaxas_Bandeiras;

Implementation

uses
  uDadosIni, Dialogs, SysUtils, Classes, UCadControles, UCadPlanoContas,
  uEscolhaHistoricoPadrao, uCadAdmCartao, uPadrao, uCadOcorrenciaAdm, Variants,
  Math, StrUtils, hw_utils, uCadPlanoContasRel;

var
   CobreBemX: Variant;

{ TControle }  
function TControle.abreControle: boolean;
begin
  Result := montaSelect('select * from controles ' +
    ' where ativo = 1 ' +
    ' and codigo_emp = ' + vDadosIni.codEmpresa);

  vBalanco.abreBalanco;
//  vBalanco.dataSet.AfterScroll := ControlesAfterScroll;
  vCobrebem_Controle.AbreCobrebemControle;
end;

function TControle.abreFormCtrlBalanco: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.ShowHint := True;
    formulario.Caption :=
      'Teste';
    frmCadControles.Panel8.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    result := (formulario.ShowModal = IDOK);
  finally
    frmCadControles.Panel8.Parent := frmCadControles.TabSheet5;
    formulario.Free;
    formulario := nil;
  end;
end;

function TControle.abreFormDefinirContolesPorEmpresa: boolean;
begin
	Result := false;

	if not vDadosIni.PesqPros('CXG123', 'DEFINIR', '',
  	'CONTROLES', dataSet.FieldByName('codigo_ctrl').AsString, buscas, true) then
    	exit;

  if dataSet.State = dsInsert then
    frmCadControles.pnDefinirControlePorEmpresaTop.Caption := ''
  else
    frmCadControles.pnDefinirControlePorEmpresaTop.Caption := IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
      ' - ' + trim(dataSet.FieldByName('nome_ctrl').AsString);

  Result := vDadosIni.abreForm(
  	'Selecionar as empresas onde o controle será utilizado',
    frmCadControles.pnDefinirControlePorEmpresa,
    [ofEscapeExit, ofAlignAllClientWinCtrl]);
end;

function TControle.abreFormIncluirControleClienteVenda: boolean;
var
  formulario: TForm;
  hdTemp: THandle;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Adicionar/Remover controle para vendas em todos clientes';
    frmCadControles.pnControlesCliente.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    frmCadControles.RadioGroup1.ItemIndex := 0;
    result := (formulario.ShowModal = IDOK);
  finally
  	if Result then
    begin
      if frmCadControles.RadioGroup1.ItemIndex = 0 then
      	adicionarRemoverControleClienteVenda
      else if frmCadControles.RadioGroup1.ItemIndex = 1 then
      	adicionarRemoverControleClienteVenda(true);
    end;
    frmCadControles.pnControlesCliente.Parent := frmCadControles.tsControlesCliente;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TControle.abreFpProgFid(vcomb: TDbCombobox; vlab: TLabel);
var
 vtemp, vtemp2: string;
 I: Integer;
begin
  vlab.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
  vcomb.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
  if not vDadosIni.vProgFid.vHabilitarProgFid then
    exit;

  buscas.Close;
  buscas.SQL.Text := ' select 2 ordem, ' +
    ' case when position('' ('', crf.descricao_config) > 0 then ' +
    '      	  substring(crf.descricao_config from 1 for position('' ('', crf.descricao_config)) ' +
    '      else ' +
    '         crf.descricao_config ' +
    ' end valor, crf.valor_vc from regras_prog_fidelidade rf ' +
    ' inner join config_regras_prog_fidelidade crf on crf.cod_tp_regra = rf.cod_tp_regra and crf.cod_empresa = rf.cod_empresa ' +
    ' where rf.cod_empresa = :cod_empresa and rf.situacao = ''ATIVA'' ' +
    ' and rf.descricao_regra = ''FORMAS DE PAGAMENTO'' ' +
    ' and crf.valor_vc <> ''CRC'' and crf.valor_vc <> ''CRS'' and crf.valor_vc <> ''CRX'' ' +
    ' union ' +
    ' select first 1 2 ordem, ''CR - CREDIÁRIO'', ''CR'' from rdb$database ' +
    ' union ' +
    ' select first 1 1 ordem, ''NV - NÃO VINCULAR'', ''NV'' from rdb$database ' +
    ' union ' +
    ' select first 1 0 ordem,  '''', '''' from rdb$database ' +
    ' order by 1, 2, 3 ';
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;
  buscas.FetchAll;

  vcomb.Items.Clear;
  buscas.First;
  while not buscas.Eof do
  begin
    if (trim(buscas.FieldByName('valor_vc').AsString) = 'NV')
      or (trim(buscas.FieldByName('valor_vc').AsString) = '') then
    begin
       vcomb.Items.Add(buscas.FieldByName('valor').AsString);
    end
    else
    begin
       if trim(dataSet.FieldByName('DOCS').AsString) = 'N' then
       begin
         if (trim(buscas.FieldByName('valor_vc').AsString) = 'DIN') then
           vcomb.Items.Add(buscas.FieldByName('valor').AsString);
       end
       else if trim(dataSet.FieldByName('DOCS').AsString) = 'S1' then
       begin
         if (trim(buscas.FieldByName('valor_vc').AsString) = 'CA')
          or (trim(buscas.FieldByName('valor_vc').AsString) = 'CPD') then
           vcomb.Items.Add(buscas.FieldByName('valor').AsString);
       end
       else if trim(dataSet.FieldByName('DOCS').AsString) = 'S2' then
       begin
         if (trim(buscas.FieldByName('valor_vc').AsString) = 'CR')
          or (trim(buscas.FieldByName('valor_vc').AsString) = 'CD')
          or (trim(buscas.FieldByName('valor_vc').AsString) = 'CC') then
           vcomb.Items.Add(buscas.FieldByName('valor').AsString);
       end;
    end;

    buscas.Next;
  end;

  if Pos(' - ', dataset.FieldByName('FP_REGRA_FIDELIDADE').AsString) > 0 then
    vtemp := Copy(dataset.FieldByName('FP_REGRA_FIDELIDADE').AsString, 1, Pos(' - ', dataset.FieldByName('FP_REGRA_FIDELIDADE').AsString))
  else
    vtemp := dataset.FieldByName('FP_REGRA_FIDELIDADE').AsString;

  for i := 0 to vcomb.Items.Count - 1 do
  begin
    if Pos(' - ', trim(vcomb.Items[i])) > 0 then
    begin
      vtemp2 := Copy(trim(vcomb.Items[i]), 0, Pos(' - ', trim(vcomb.Items[i])));
      if trim(vtemp) = trim(vtemp2) then
      begin
        vcomb.ItemIndex := I;
        break;
      end;
    end;
  end;
end;

function TControle.abrelixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
    result := false;
  end
  else
    result := montaSelect('select * from controles ' +
    	' where ativo = 0 ' +
      ' and codigo_emp = ' + vDadosIni.codEmpresa);
end;

function TControle.adicionarRemoverControleClienteVenda(pRemover: boolean): boolean;
var
	temp: string;
  temp2: string;
	codigo: string;
  codprocesso: string;
begin
	try
    Result := False;

    codigo := IntToStr(dataset.FieldByName('CODIGO_CTRL').AsInteger);

    codprocesso := vDadosIni.IfThen(not pRemover, 'CXG132', 'CXG133');

    if not vDadosIni.PesqPros(codprocesso, 'SALVAR', '', 'CONTROLES',
      codigo, buscas, true) then
      Exit;

    temp := vDadosIni.IfThen(not pRemover, 'adicionar', 'remover');
    temp2 := vDadosIni.IfThen(not pRemover, 'adicionado', 'removido');
    
    if Application.MessageBox(PChar('Deseja ' + temp +
      ' o controle?' + #13 + #13 +
      'O controle será ' + temp2 + ' para vendas em todos clientes.'), 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
        exit;

    if not pRemover then
    begin
    	try
      	vDadosIni.abreStatusProcessamento('', 'Adicionando controle nos clientes...');

        buscas.Close;
        buscas.SQL.Text := ' update clientes set controles_fp = ''(' + codigo + ')'' ' +
          '	where cod_empresa = ' + vDadosIni.codEmpresa +
          ' and trim(coalesce(controles_fp, '''')) = '''' ' +
          '	and (char_length(trim(coalesce(controles_fp, ''''))) + char_length(' + codigo + ')) <= 256 ';
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.Text := ' update clientes set controles_fp = replace(controles_fp, '')'', '',' + codigo + ')'') ' +
          '	where cod_empresa = ' + vDadosIni.codEmpresa +
          ' and coalesce(controles_fp, '''') <> ''(' + codigo + ')'' ' +
          ' and coalesce(controles_fp, '''') not like ''(' + codigo + ',%'' ' +
          ' and coalesce(controles_fp, '''') not like ''%,' + codigo + ')'' ' +
          '	and (char_length(trim(coalesce(controles_fp, ''''))) + char_length(' + codigo + ')) <= 256 ';
        buscas.ExecSQL;
      finally
        vDadosIni.fechaStatusProcessamento;
      end;
    end
    else
    begin
    	try
        vDadosIni.abreStatusProcessamento('', 'Removendo controle nos clientes...');

        buscas.Close;
        buscas.SQL.Text := ' update clientes set controles_fp = null ' +
          '	where cod_empresa = ' + vDadosIni.codEmpresa +
          ' and coalesce(controles_fp, '''') = ''(' + codigo + ')'' ';
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.Text := ' update clientes set controles_fp = replace(controles_fp, ''(' + codigo + ','', ''('') ' +
          '	where cod_empresa = ' + vDadosIni.codEmpresa +
          ' and coalesce(controles_fp, '''') like ''(' + codigo + ',%'' ';
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.Text := ' update clientes set controles_fp = replace(controles_fp, '',' + codigo + ','', '','') ' +
          '	where cod_empresa = ' + vDadosIni.codEmpresa +
          ' and coalesce(controles_fp, '''') like ''%,' + codigo + ',%'' ';
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.Text := ' update clientes set controles_fp = replace(controles_fp, '',' + codigo + ')'', '')'') ' +
          '	where cod_empresa = ' + vDadosIni.codEmpresa +
          ' and coalesce(controles_fp, '''') like ''%,' + codigo + ')'' ';
        buscas.ExecSQL;
      finally
        vDadosIni.fechaStatusProcessamento;
      end;
    end;

    CommitaTransacao;

    vDadosIni.GravaAuditoria(codprocesso, 'SALVAR', 'SUCESSO', 'CONTROLES', codigo, buscas);

    Result := true;
  Except
     on e: Exception do
     begin
        Result := false;

        vDadosIni.GravaAuditoria(codprocesso, 'SALVAR', 'FALHA', 'CONTROLES', codigo, buscas);

        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;
end;

function TControle.atualizarEmpControle(pCommitar: Boolean = False): Boolean;
var
	vCodControle: Integer;
begin
	try
    Result := False;

    if (vDadosIni.vEmp.vFinanceiroUnificado)
       and (dataSet.FieldByName('CODIGO_EMP').AsInteger = StrToInt(vDadosIni.codEmpresa)) then
    begin
    	vCodControle := dataSet.FieldByName('codigo_ctrl').AsInteger;

      try
        vEmpresaDefControle.dataSet.DisableControls;
        vEmpresaDefControle.dataSet.First;
        while not vEmpresaDefControle.dataSet.Eof do
        begin
          buscas.Close;
          buscas.SQL.Text := 'UPDATE CONTROLES ' +
            ' SET CONTROLE_VISIVEL = ' + QuotedStr(vDadosIni.IfThen(vEmpresaDefControle.dataSet.FieldByName('sel').AsString = 'S', 'S', 'N')) +
            ' WHERE CODIGO_CTRL = ' + IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
            ' AND CODIGO_EMP = ' + IntToStr(vEmpresaDefControle.dataSet.FieldByName('cod_empresa').AsInteger);
          buscas.ExecSQL;

          vEmpresaDefControle.dataSet.Next;
        end;
      finally
        vEmpresaDefControle.dataSet.First;
        vEmpresaDefControle.dataSet.EnableControls;
      end;

      if pCommitar then
        if buscas.Transaction.InTransaction then
          buscas.Transaction.Commit;

      vEmpresaDefControle.abreEmpresaDefControle(vCodControle);
    end;

    Result := True;
  except
  	on e: Exception do
    begin
      Result := false;

      Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
      registraErro(e.Message);
    end;
  end;
end;

procedure TControle.cadControle(TipoForm: Integer);
begin
  vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro de Controles...');
  vDadosIni.vTipoForm := TipoForm;
  if dtmcadbasicoscx = nil then
    dtmcadbasicoscx := Tdtmcadbasicoscx.Create(dtmcadbasicoscx);

  if frmCadControles = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M'
    else
      vDadosIni.vModalOuChild := 'C';

     Application.CreateForm(TfrmCadControles, frmCadControles);
  end;

  if (TipoForm > 0) and (not frmCadControles.Visible) then
    frmCadControles.ShowModal
  else if (not frmCadControles.Visible) then
    frmCadControles.Show
  else if frmCadControles.FormStyle = fsMDIChild then
    frmCadControles.Show
  else
    frmCadControles.ShowModal;
end;

function TControle.cancel: boolean;
begin
   if (dataSet.State in [dsEdit, dsInsert] )then
   begin
      dataSet.Cancel;
      RollBackTransacao;
      result:= true;
   end;
end;

procedure TControle.ControlesAfterScroll(DataSet: TDataSet);
begin

   if not vBalanco.IsEmpty then
      PesquisaControlesBalanco(vBalanco.DataSet.FieldByName('codseq_balanco').AsString);

end;

constructor TControle.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsControles);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);

   vBalanco := TBalanco.Create;
   vCtrlBalanco := TCtrlBalanco.Create;
   vCobrebem_Controle := TCobrebem_Controle.create;
   vEmpresaDefControle := TEmpresaDefControle.create;
   vControleTaxaEcommerce := TControleTaxaEcommerce.create;

   FlkTipoPagamento := TDadosLookUp_OOP.create;
   FlkBandeira := TDadosLookUp_OOP.create;

end;

function TControle.definirContolesPorEmpresa: boolean;
var
	vCodControle: Integer;
	vControleSel: boolean;
  vTmp: string;
begin
	try
    Result := False;

    if vEmpresaDefControle.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhuma empresa selecionada.', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      exit;
    end;

    vControleSel := False;
    vCodControle := dataSet.FieldByName('CODIGO_CTRL').AsInteger;

    try
      vEmpresaDefControle.dataSet.DisableControls;
      vEmpresaDefControle.dataSet.First;
      while not vEmpresaDefControle.dataSet.Eof do
      begin
        if vEmpresaDefControle.dataSet.FieldByName('SEL').AsString = 'S' then
        begin
          vControleSel := True;
          vTmp := 'HABILITAR';
        end
        else
          vTmp := 'DESABILITAR';

        buscas.Close;
        buscas.SQL.Text := 'UPDATE CONTROLES ' +
          ' SET CONTROLE_VISIVEL = ' + QuotedStr(vDadosIni.IfThen(vEmpresaDefControle.dataSet.FieldByName('SEL').AsString = 'S', 'S', 'N')) +
          ' WHERE CODIGO_CTRL = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
          ' AND CODIGO_EMP = ' + IntToStr(vEmpresaDefControle.dataSet.FieldByName('COD_EMPRESA').AsInteger);
        buscas.ExecSQL;

        vDadosIni.GravaAuditoria(vDadosIni.IfThen(vEmpresaDefControle.dataSet.FieldByName('SEL').AsString = 'S', 'CXG124', 'CXG125'),
          vTmp,
          'Emp: ' + IntToStr(dataSet.FieldByName('CODIGO_EMP').AsInteger),
          'CONTROLES', IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger), buscas);

        vEmpresaDefControle.dataSet.Next;
      end;

      if (not vControleSel) then
      begin
        Application.MessageBox('Nenhuma empresa selecionada.', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
        Result := False;
        exit;
      end;

      if buscas.Transaction.InTransaction then
      begin
        buscas.Transaction.Commit;
        vDadosIni.GravaAuditoria(vDadosIni.IfThen(vControleSel, 'CXG124', 'CXG125'),
          vDadosIni.IfThen(vControleSel, 'HABILITAR', 'DESABILITAR'), 'SUCESSO',
          'CONTROLES', IntToStr(vCodControle), buscas);
      end
      else
      begin
        buscas.Transaction.Rollback;
        vDadosIni.GravaAuditoria(vDadosIni.IfThen(vControleSel, 'CXG124', 'CXG125'),
          vDadosIni.IfThen(vControleSel, 'HABILITAR', 'DESABILITAR'), 'FALHA',
          'CONTROLES', IntToStr(vCodControle), buscas);
      end;

      vEmpresaDefControle.abreEmpresaDefControle(vCodControle);

      Result := True;
    finally
      vEmpresaDefControle.dataSet.First;
      vEmpresaDefControle.dataSet.EnableControls;
    end;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox('Erro ao definir controle por empresa.',
        'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vControleSel, 'CXG124', 'CXG125'),
      	vDadosIni.IfThen(vControleSel, 'HABILITAR', 'DESABILITAR'),	'FALHA',
        'CONTROLES', '', buscas);
    end;
  end;
end;

function TControle.delete: boolean;
var
  vtemp: string;
	vApagar: boolean;
  vCod_Controle: string;
  vNome_Controle: string;
  I: Integer;
begin
  try
    Result := False;
    if dataSet.IsEmpty then
      exit;

    try
      vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
      vCod_Controle  := trim(dataSet.FieldByName('CODIGO_CTRL').AsString);
      vNome_Controle := trim(dataSet.FieldByName('NOME_CTRL').AsString);

      prepare_loop('SEL = ''S''');

      if not dataset.IsEmpty then
      begin
        vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
        vCod_Controle  := '';
        vNome_Controle := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
      if (trim(vCod_Controle) <> '') then
        prepare_loop('CODIGO_CTRL = ' + vCod_Controle)
      else
        prepare_loop('SEL = ''S''');

      if vApagar then
      begin
        vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
          'CONTROLE' + #13 +
          'Código: ' + vCod_Controle + #13 +
          'Nome: ' + vNome_Controle;

        if (trim(vCod_Controle) = '') then
          vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

        if not vDadosIni.PesqPros('CXG003', 'EXCLUIR', '', 'CONTROLES',
          vDadosIni.IfThen(trim(vCod_Controle) <> '', vCod_Controle, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end
      else
      begin
        vtemp := 'Tem certeza que deseja mover este registro para a lixeira?' + #13 + #13 +
          'CONTROLE' + #13 +
          'Código: ' + vCod_Controle + #13 +
          'Nome: ' + vNome_Controle;

        if (trim(vCod_Controle) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

        if not vDadosIni.PesqPros('CXG005', 'EXCLUIR', '', 'CONTROLES',
           vDadosIni.IfThen(trim(vCod_Controle) <> '', vCod_Controle, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end;

      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo controle(s) permanentemente')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo controle(s) para lixeira');

      dataset.First;
      while not dataset.Eof do
      begin
        if vApagar then
          vDadosIni.abreStatusProcessamento('', 'Excluíndo controle(s) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
        else
          vDadosIni.abreStatusProcessamento('', 'Movendo controle(s) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        if vApagar then
        begin
          SqlExec(' update controles set ativo = 99 ' +
            ' where codigo_ctrl = %d ' +
            ' and codigo_emp = %d ',
            [fint('codigo_ctrl'), fint('codigo_emp')], buscas);

           vDadosIni.AtualizarControles(buscas, tApagar, fint('codigo_ctrl'));

          if (trim(vCod_Controle) = '') then
            vDadosIni.GravaAuditoria('CXG003', 'EXCLUIR', '', 'CONTROLES',
              dataSet.FieldByName('CODIGO_CTRL').AsString, buscas);
        end
        else
        begin
          SqlExec(' update controles set ativo = 0 ' +
            ' where codigo_ctrl = %d ' +
            ' and codigo_emp = %d ',
            [fint('codigo_ctrl'), fint('codigo_emp')], buscas);

          vDadosIni.AtualizarControles(buscas, tMover, fint('codigo_ctrl'));

          if (trim(vCod_Controle) = '') then
            vDadosIni.GravaAuditoria('CXG005', 'EXCLUIR', '', 'CONTROLES',
              dataSet.FieldByName('CODIGO_CTRL').AsString, buscas);
        end;

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;

    Result := CommitaTransacao;
    if Result then
    begin
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'CXG003', 'CXG005'),
        'EXCLUIR', 'SUCESSO', 'CONTROLES',
        vDadosIni.IfThen(trim(vCod_Controle) <> '', vCod_Controle, ''), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'CXG003', 'CXG005'),
        'EXCLUIR', 'FALHA', 'CONTROLES',
        vDadosIni.IfThen(trim(vCod_Controle) <> '', vCod_Controle, ''), buscas);
    end;
    if Result then
     Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

destructor TControle.Destroy;
begin
  if FlkTipoPagamento <> nil then
    FreeAndNil(FlkTipoPagamento);
   if FlkBandeira <> nil then
     FreeAndNil(FlkBandeira);
   if vEmpresaDefControle <> nil then
   	 FreeAndNil(vEmpresaDefControle);
   if vControleTaxaEcommerce <> nil then
   	 FreeAndNil(vControleTaxaEcommerce);
  inherited;
end;

function TControle.edit: boolean;
begin
	Result := False;
  
  if not dataSet.Active then
    montaSelect('select * from controles ' +
      ' where 1 = 0 ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
    
  if inherited Edit then
  begin
  	if dataSet.FieldByName('EXIBIR_DOC').IsNull then
    	dataSet.FieldByName('EXIBIR_DOC').AsString := 'A'
  	else if trim(dataSet.FieldByName('EXIBIR_DOC').AsString) = '' then
    	dataSet.FieldByName('EXIBIR_DOC').AsString := 'A';

    if trim(dataSet.FieldByName('DOCS').AsString) = 'N' then
    	dataSet.FieldByName('BARRAMENTO_AUTOMATICO').Value := Null
    else if (trim(dataSet.FieldByName('DOCS').AsString) = 'S1') and (trim(dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString) = '') then
      dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString := 'S'
    else if (trim(dataSet.FieldByName('DOCS').AsString) = 'S2') and (trim(dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString) = '') then
    begin
      if trim(dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
      	dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString := 'N'
      else
      	dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString := 'S';
    end;

    dataSet.FieldByName('NOME_CTRL').AsString := trim(dataSet.FieldByName('NOME_CTRL').AsString);
    dataSet.FieldByName('NOME_CONTABIL').AsString := trim(dataSet.FieldByName('NOME_CONTABIL').AsString);
      
    vCtrlBalanco.vComitar := false;
    vCtrlBalanco.vChangeCount := 0;
    vCtrlBalanco.abreCtrlBalanco(dataSet.FieldByName('codigo_ctrl').AsString);

    vTipoPlano := dataSet.FieldByName('tp_plano').AsString;
    vCartaoSped := dataSet.FieldByName('cartao_sped').AsInteger;
    result := True;
  end;
end;

function TControle.fechaSaldo(vdataSource: TdataSource): boolean;
begin
  vdataSource.DataSet:=nil;
  buscas.Close;
end;

function TControle.GetNomeClienteAdmCartao(inst: InstituicaoPagSPEDEnum): string;
var
  idInst: integer;
begin
  idInst := IfThen(inst = ipPagadora, fint('CARTAO_SPED_PART'), fint('CARTAO_SPED_PART_IT'));

  Result := SqlScalar('select nome_cliente from clientes ' +
  	' where cod_cliente = %d ' +
    ' and cod_empresa = %d',
    [idInst, fint('CODIGO_EMP')]).AsString;
end;

function TControle.IncluirControleBalanco: Boolean;
begin
  if vCtrlBalanco.Insert then
  begin
    vCtrlBalanco.dataSet.FieldByName('codigo_ctrl').AsString := vDadosIni.IfThen(trim(dataSet.FieldByName('codigo_ctrl').AsString) = '', '0', dataSet.FieldByName('codigo_ctrl').AsString);
    vCtrlBalanco.dataSet.FieldByName('codseq_balanco').AsString := vBalanco.dataSet.FieldByName('codseq_balanco').AsString;
    vCtrlBalanco.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    vCtrlBalanco.Post(vBalanco.dataSet.FieldByName('codseq_balanco').AsString);
  end;
 end;

function TControle.insert: boolean;
begin
  Result := False;

  if not dataSet.Active then
    montaSelect('select * from controles ' +
    	' where 1 = 0 ' +
      ' and codigo_emp = ' + vDadosIni.codEmpresa);

  if inherited Insert then
  begin
    dataSet.FieldByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('EXIBIR_DOC').AsString := 'A';
    dataSet.FieldByName('TEF_TIPO').AsInteger := 0;

    vCtrlBalanco.vComitar := false;
    vCtrlBalanco.vChangeCount := 0;
    vCtrlBalanco.abreCtrlBalanco(obControle.dataSet.FieldByName('codigo_ctrl').AsString);

    vTipoPlano := '';
    vCartaoSped := 0;
    result := true;
  end;
end;

function TControle.modificaSaldoB(vdata: Tdate; vvalor: Currency;vop: integer): boolean;
begin
  if vop = 1 then
  begin
    buscas.close;
    buscas.sql.text := 'select * from sal_ctrl ' +
      ' where codigo_ctrl = ' + dataSet.FieldByName('CODIGO_CTRL').AsString +
      ' and data_sld = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vdata)) +
      ' and cod_emp = ' + vDadosIni.codEmpresa;
    buscas.open;

    if buscas.IsEmpty then
    begin
      Application.MessageBox('Data do Controle informado não encontrada, verifique!','Atenção', MB_ICONINFORMATION + MB_OK );
      Result:=false;
    end
    else
    begin
     IniciaTransacao;

     buscas.close;
     buscas.sql.text := 'update sal_ctrl set saldo_banco = ' + vDadosIni.trocaVirgulaPorPonto(CurrToStr(vvalor)) +
       ' where codigo_ctrl = ' + dataSet.FieldByName('CODIGO_CTRL').AsString +
       ' and data_sld = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vdata)) +
       ' and cod_emp = ' + vDadosIni.codEmpresa;
     buscas.Prepare;
     buscas.ExecSQL;

     CommitaTransacao;
     Application.MessageBox('Saldo Alterado com Sucesso!','Confirmaçãoo', MB_ICONINFORMATION + MB_OK );
    end;
  end
  else
  begin
   // Alteraçaão do Saldo contábil
  end;
end;

function TControle.PesquisaControleCadastrado: Boolean;
begin
   Result := ExecutaComandosSql('select * from controles_balanco ' +
     ' where codigo_ctrl = ' + dataSet.FieldByName('codigo_ctrl').AsString +
     ' and cod_empresa = ' + vDadosIni.codEmpresa +
     ' and codseq_balanco = ' + vBalanco.dataSet.FieldByName('codseq_balanco').AsString);
end;

function TControle.PesquisaControlesBalanco(Cod_balanco: string): Boolean;
begin
  Result := vCtrlBalanco.montaSelect('select * from Controles_balanco ' +
     ' where ativo = 1 ' +
     ' and codseq_balanco = ' + Cod_balanco +
     ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TControle.post: boolean;
var
   statusDataset : string;
   vApply, vApplyBalanco: boolean;
begin
  try
     if not (dataSet.state in [dsedit,dsinsert]) then
       exit;

     statusDataset := '';
     if dataSet.State = dsEdit then
        statusDataset := 'E'
     else
        statusDataset := 'I';

     if dataSet.FieldByName('codigo_emp').AsInteger = StrToInt(vDadosIni.codEmpresa) then
     begin
       if Trim (dataSet.FieldByName('CODIGO_CTRL').asString) = '' then
       begin
          frmCadControles.TabSheet3.Show;
          raiseExceptionCreate('Campo Código Controle não pode ser vazio.', 'DBEdit1');
       end
       else
       begin
          if verificarCodigoControle then
          begin
            frmCadControles.TabSheet3.Show;
            raiseExceptionCreate('Código de Controle já cadastrado.', 'DBEdit1');
          end;
       end;
       if Trim (dataSet.FieldByName('FLUXO_CTRL').asString) = '' then
       begin
          frmCadControles.TabSheet3.Show;
          raiseExceptionCreate('Campo Saldo Inicial para o Fluxo de Caixa não pode ser vazio.', 'DBComboBox1');
       end;
       if Trim (dataSet.FieldByName('CONTR_BANC').asString) = '' then
       begin
          frmCadControles.TabSheet3.Show;
          raiseExceptionCreate('Campo Controle Bancário não pode ser vazio.', 'DBComboBox2');
       end;
       if Trim (dataSet.FieldByName('NAT_CTRL').asString) = '' then
       begin
          frmCadControles.TabSheet3.Show;
          raiseExceptionCreate('Campo Natureza do Ctrl. não pode ser vazio.', 'DBComboBox4');
       end;
       if Trim (dataSet.FieldByName('NOME_CTRL').asString) = '' then
       begin
          frmCadControles.TabSheet3.Show;
          raiseExceptionCreate('Campo Nome do Ctrl. não pode ser vazio.', 'DBEdit5');
       end;
       if Trim (dataSet.FieldByName('CXENT').asString) = '' then
       begin
          frmCadControles.TabSheet3.Show;
          raiseExceptionCreate('Campo Entrar em condições não pode ser vazio.', 'DBComboBox7');
       end;
       if Trim (dataSet.FieldByName('DOCS').asString) = '' then
       begin
          frmCadControles.TabSheet3.Show;
          raiseExceptionCreate('Campo Controle de Documentos não pode ser vazio.', 'DBComboBox8');
       end;
       if Trim (dataSet.FieldByName('COMPSALDO').asString) = '' then
       begin
          frmCadControles.TabSheet3.Show;
          raiseExceptionCreate('Campo Composição de saldo de Caixa não pode ser vazio.', 'DBComboBox9');
       end;

       if fstrin('tef_tipo', ['', '0']) or fequals('docs', 'S2') then
       begin
         dataSet.FieldByName('tef_id_cartdig').Value := Null;
         dataSet.FieldByName('tef_id_psp').Value := Null;
       end
       else if fequals('docs', 'N') and fequals('tef_tipo', '1') and fempty('tef_id_cartdig') then
       begin
         frmCadControles.TabSheet4.Show;
         raiseExceptionCreate('Campo "Id Carteira Digital" deve ser preenchido quando "Transação eletrônica" = "Sim"', 'edTefIdCartDig');
       end
       else if fdif('tef_id_cartdig', '60110024') then //PIX, IP PSP apenas em PIX
         dataSet.FieldByName('tef_id_psp').Value := Null;

       if Trim (dataSet.FieldByName('NAO_GERA_FINAN').asString) = 'S' then
       begin
         Application.MessageBox('Controle configurado para não gerar financeiro', 'Atenção', 0 + 64);
         dataSet.FieldByName('DOCS').AsString := 'N';
         dataSet.FieldByName('CXENT').AsString := 'S';
         dataSet.FieldByName('BAIXA_AUTOMATICA').AsString := 'N';
       end
       else if Trim (dataSet.FieldByName('BAIXA_AUTOMATICA').asString) = 'S' then
       begin
         if dataSet.FieldByName('N_CONTA_BX_AUTO').AsFloat <= 0 then
         begin
          frmCadControles.TabSheet4.Show;
          raiseExceptionCreate('Num Conta Saída Plc Baixa Automática deve ser informado ' +
           'quando a Baixa Automática estiver configurada.', 'DBEdit25');
         end;

         buscas.Close;
         buscas.SQL.Text := 'Select N_Conta_Plc from P_Contas where N_Conta_Plc = :N_Conta_Plc and tipo_plc = ''S''' +
           ' and coalesce(sthab, ''S'') <> ''N''';
         buscas.ParamByName('N_CONTA_PLC').AsFloat := dataSet.FieldByName('N_CONTA_BX_AUTO').AsFloat;
         buscas.Open;

         if buscas.IsEmpty then
         begin
           frmCadControles.TabSheet4.Show;
           raiseExceptionCreate('Num Conta Saída Plc Baixa Automática não existe no cadastro', 'DBEdit25');
         end;

         Application.MessageBox('Controle configurado para Baixa Automática', 'Atenção', 0 + 64);
         dataSet.FieldByName('DOCS').AsString := 'N';
         dataSet.FieldByName('CXENT').AsString := 'S';
         dataSet.FieldByName('NAO_GERA_FINAN').AsString := 'N';
       end;
     end;

     if (dataSet.FieldByName('NFCE_TPAG').AsInteger = 0) and (not dataSet.FieldByName('NFCE_TPAG').IsNull) then
       dataSet.FieldByName('NFCE_TPAG').Value := Null;
     if (dataSet.FieldByName('NFCE_TBAND').AsInteger = 0) and (not dataSet.FieldByName('NFCE_TBAND').IsNull) then
       dataSet.FieldByName('NFCE_TBAND').Value := Null;

     if dataSet.FieldByName('codigo_emp').AsInteger = StrToInt(vDadosIni.codEmpresa) then
     begin
       if not (vDadosIni.strEstaContidoEm(Trim(dataSet.FieldByName('TIPO_PARCELAMENTO').AsString),
          ['T1', 'TN', 'I1', 'IN', 'N', ''] )) then // Valores validos contidos no cadastro do controle
       begin
          frmCadControles.TabSheet4.Show;
          raiseExceptionCreate('Campo Tipo de Parcelamento com preenchimento inválido. Valores válidos: "I1" "IN" "T1" "TN" "N"', 'DBComboBox20');
       end;

       if not (vDadosIni.strEstaContidoEm(Trim(dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString),
          ['D1', 'D2', 'D3', 'D4', 'D5', 'N', ''] )) then // Valores validos contidos no cadastro do controle
       begin
          frmCadControles.TabSheet4.Show;
          raiseExceptionCreate('Campo Dia base parcelas com preenchimento inválido. Valores válidos: "D1" "D2" "D3" "D4" "D5" "N"', 'DBComboBox21');
       end;
       {Cartão quando descontado precisa informar o dia de vencimento de 1 a 2 dias uteis, por isso comentado abaixo
       if Trim(dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
         if not (vDadosIni.strEstaContidoEm(Trim(dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString), ['D3', 'D5', ''] )) then // Valores validos contidos no cadastro do controle
         begin
            frmCadControles.TabSheet4.Show;
            raiseExceptionCreate('Campo Dia base parcelas com preenchimento inválido. Parta controle tipo Cartão valores válidos: "D3" "D5"', 'DBComboBox21');
         end;
       }
     end;

     if Trim(dataSet.FieldByName('TP_PLANO').AsString) <> 'C' then
       dataSet.FieldByName('TAXA_CARTAO').AsFloat := 0;

     if Trim(dataSet.FieldByName('EXIBIR_RESUMO_FINANCEIRO').AsString) = '' then
       dataSet.FieldByName('EXIBIR_RESUMO_FINANCEIRO').AsString := 'S';

     if IndexText(fstr('DOCS'), ['S1', 'S2']) < 0 then
       dataSet.FieldByName('RECEBER_CTP').AsString := 'N';

     if Trim(dataSet.FieldByName('DOCS').asString) = 'N' then
     	 dataSet.FieldByName('CONTRAPARTIDA').AsString := 'N';

     if not vDadosIni.vProgFid.vHabilitarProgFid then
       dataSet.FieldByName('FP_REGRA_FIDELIDADE').Value := Null
     else if trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) = '' then
       dataSet.FieldByName('FP_REGRA_FIDELIDADE').Value := Null
     else
       if Pos(' - ', dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) > 0 then
          dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString :=
            Copy(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString, 0, Pos(' - ', dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString));

     if dataSet.FieldByName('CODIGO_EMP').AsInteger = StrToInt(vDadosIni.codEmpresa) then
     begin
       if vDadosIni.vProgFid.vHabilitarProgFid then
         if testarRegraFormaProgFid('FORMAS DE PAGAMENTO') then
         begin
           if (trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) <> 'NV')
            and (trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) <> '') then
           begin
              if trim(dataSet.FieldByName('DOCS').AsString) = 'N' then
              begin
                 if (trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) <> 'DIN') then
                 begin
                   frmCadControles.TabSheet4.Show;
                   raiseExceptionCreate('Campo Classe Prog Fidelidade incompatível com tipo de controle de documentos "N - NÃO DINHEIRO"', 'DBComboBoxClasseProgFid');
                 end;
              end
              else if trim(dataSet.FieldByName('DOCS').AsString) = 'S1' then
              begin
                 if (trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) <> 'CA')
                  and (trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) <> 'CPD') then
                 begin
                   frmCadControles.TabSheet4.Show;
                   raiseExceptionCreate('Campo Classe Prog Fidelidade incompatível com tipo de controle de documentos "S1 -SIM CHEQUE"', 'DBComboBoxClasseProgFid');
                 end;
              end
              else if trim(dataSet.FieldByName('DOCS').AsString) = 'S2' then
              begin
                 if (trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) <> 'CR')
                  and (trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) <> 'CD')
                  and (trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) <> 'CC') then
                 begin
                   frmCadControles.TabSheet4.Show;
                   raiseExceptionCreate('Campo Classe Prog Fidelidade incompatível com tipo de controle de documentos "S2 - SIM CRÉDITOS"', 'DBComboBoxClasseProgFid');
                 end;
              end;
           end;
         end;
     end;

     if dataSet.FieldByName('CODIGO_EMP').AsInteger = StrToInt(vDadosIni.codEmpresa) then
     begin
       if vDadosIni.vProgFid.vHabilitarProgFid then
         if testarRegraFormaProgFid('FORMAS DE PAGAMENTO') then
           if trim(dataSet.FieldByName('FP_REGRA_FIDELIDADE').AsString) = '' then
           begin
             if not vDadosIni.PesqPros('CXG122', 'PERMITIR', '','CONTROLES', dataSet.FieldByName('CODIGO_CTRL').AsString, buscas , true) then
             begin
               frmCadControles.TabSheet4.Show;
               raiseExceptionCreate('Campo Classe Prog Fidelidade não informado', 'DBComboBoxClasseProgFid');
             end;
           end;
     end;

     if dataSet.FieldByName('CODIGO_EMP').AsInteger = StrToInt(vDadosIni.codEmpresa) then
     begin
       if dataSet.State = dsEdit then
         if Trim(SqlOpen('select docs from controles where codigo_ctrl = %d and codigo_emp = %d',
                         [fint('codigo_ctrl'), fint('codigo_emp')]).FieldByName('docs').AsString) <> fstr('docs') then
         begin
           if vDadosIni.vEmp.vFinanceiroUnificado then
           begin
             if SqlOpen('select count(fp.seqform) contador from formpagamento fp' +
                        ' inner join empresa emp on emp.cod_empresa = fp.cod_empresa' +
                        ' where fp.cod_controle = %d and fp.prcss is null and emp.codigo_unificadora = %d',
                        [fint('codigo_ctrl'),  fint('codigo_emp')]).FieldByName('contador').AsInteger > 0 then
               raiseExceptionCreate('Campo "Controle de Documentos" não pode ser alterado, pois existe(m) forma(s)' +
                                    ' de pagamento sem processamento pelo Financeiro');
           end
           else
             if SqlOpen('select count(fp.seqform) contador from formpagamento fp' +
                        ' where fp.cod_controle = %d and fp.prcss is null and fp.cod_empresa = %d',
                        [fint('codigo_ctrl'), fint('codigo_emp')]).FieldByName('contador').AsInteger > 0 then
               raiseExceptionCreate('Campo "Controle de Documentos" não pode ser alterado, pois existe(m) forma(s)' +
                                    ' de pagamento sem processamento pelo Financeiro');
         end;
     end;

     {if dataSet.State = dsInsert then
     begin
        dataSet.FieldByName('CODIGO_CTRL').asInteger := Gencodigo('Controles',
        dtmcadbasicoscx.SpIncCodigo, vDadosIni.codEmpresa);
     end;  }

     if dataSet.FieldByName('codigo_emp').AsInteger = StrToInt(vDadosIni.codEmpresa) then
     begin
       if not verificarControleSemVinculo then
       begin
          frmCadControles.PageControl3.ActivePage := frmCadControles.TabSheet5;
          raiseExceptionCreate('Controle sem vínculo com o balanço', 'DBLookupComboBox2');
       end;
     end;

     if trim(dataSet.FieldByName('DOCS').AsString) = 'N' then
    	 dataSet.FieldByName('BARRAMENTO_AUTOMATICO').Value := Null
     else if (trim(dataSet.FieldByName('DOCS').AsString) = 'S1') and (trim(dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString) = '') then
       dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString := 'S'
     else if (trim(dataSet.FieldByName('DOCS').AsString) = 'S2') and (trim(dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString) = '') then
     begin
       if trim(dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
         dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString := 'N'
       else
         dataSet.FieldByName('BARRAMENTO_AUTOMATICO').AsString := 'S';
      end;

     Result := inherited post;

     if dataSet.FieldByName('CODIGO_EMP').AsInteger = StrToInt(vDadosIni.codEmpresa) then
     begin
       vCtrlBalanco.dataSet.First;
       while not vCtrlBalanco.dataSet.Eof do
       begin
          vCtrlBalanco.dataSet.Edit;
          vCtrlBalanco.dataSet.FieldByName('CODIGO_CTRL').AsInteger := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
          vCtrlBalanco.dataSet.Post;

          vCtrlBalanco.dataSet.Next;
       end;
       vCtrlBalanco.dataSet.First;
     end;

     if ((dataSet.ChangeCount = 0)
     	and (vCtrlBalanco.dataSet.ChangeCount = 0)
      and (vCtrlBalanco.vChangeCount = 0)) then
     begin
       atualizarEmpControle(True);
     	 result := true;
       exit;
     end;

     vApply := Apply;
     vApplyBalanco := vCtrlBalanco.Apply;

     if (statusDataset = 'E') then
     	 if (trim(dataSet.FieldByName('docs').AsString) = 'S2') and (trim(dataSet.FieldByName('tp_plano').AsString) = 'C')
       	and ((dataSet.FieldByName('cartao_sped').AsInteger = 1) or (dataSet.FieldByName('cartao_sped').AsInteger = 2)) then
       begin
	     	 if (trim(vTipoPlano) <> trim(dataSet.FieldByName('tp_plano').AsString))
         	 or (vCartaoSped <> dataSet.FieldByName('cartao_sped').AsInteger) then
         begin
         	 try
             vDadosIni.abreStatusProcessamento('', 'Atualizando dados créditos em aberto...');

             buscas.Close;
             buscas.SQL.Text := ' update controle_creditos set ' +
              ' deb_cred = ' + QuotedStr(vDadosIni.IfThen(dataSet.FieldByName('cartao_sped').AsInteger = 1, 'D', 'C')) + ', ' +
              ' valor_liquido = null ' +
              ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
              ' and (status_c = '''' or status_c is null) ' +
              vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
                ' and codigo_emp = ' + vDadosIni.codEmpresa,
                ' and cod_emp_mult in ' + vDadosIni.vEmp.vCodigoUnificadas);
             buscas.ExecSQL;
           finally
             vDadosIni.fechaStatusProcessamento;
           end;
         end;
       end;

     if ((vApply)
     	 or (vApplyBalanco)
       or (vCtrlBalanco.vChangeCount <> 0)) then
     begin
      	if dataSet.FieldByName('CODIGO_EMP').AsInteger = StrToInt(vDadosIni.codEmpresa) then
        begin
	        vDadosIni.AtualizarControles(buscas, tInserir, dataSet.FieldByName('codigo_ctrl').AsInteger);
          atualizarEmpControle;
        end;

        if CommitaTransacao then
        begin
        	result := True;

          if statusDataset = 'E' then
            vDadosIni.GravaAuditoria('CXG009', 'ALTERAÇÃO CONFIRMADA', 'SUCESSO', 'CONTROLES',
             obControle.dataSet.FieldByName('codigo_ctrl').AsString, obControle.buscas)
          else
            vDadosIni.GravaAuditoria('CXG009', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'CONTROLES',
             obControle.dataSet.FieldByName('codigo_ctrl').AsString, obControle.buscas);
        end;
     end
     else
     begin
        Result := False;
//        Cancel;
        RollBackTransacao;

        if statusDataset = 'E' then
          vDadosIni.GravaAuditoria('CXG009', 'ALTERAÇÃO NÃO CONFIRMADA', 'FALHA', 'CONTROLES',
           obControle.dataSet.FieldByName('codigo_ctrl').AsString, obControle.buscas)
        else
          vDadosIni.GravaAuditoria('CXG009', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'CONTROLES',
           obControle.dataSet.FieldByName('codigo_ctrl').AsString, obControle.buscas);

     end;
     Refresh;
  Except
     on e: Exception do
     begin
        Result := false;
//        cancel;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;
end;

function TControle.removerAtivarVinculoBalanco(pAtivar: boolean): boolean;
var
  vComitar: boolean;
begin
   vComitar := false;
   if not (dataSet.state in [dsedit,dsinsert]) then
   begin
     vComitar := true;
     dataSet.Edit;
   end;
   if pAtivar then
     dataSet.FieldByName('DESAT_VINC_BALANCO').Value := null
   else
     dataSet.FieldByName('DESAT_VINC_BALANCO').AsString := 'S';
   if vComitar then
   begin
     dataSet.Post;
	  Apply;
     if CommitaTransacao then
     begin
        result := True;
        if not pAtivar then
          vDadosIni.GravaAuditoria('CXG118', 'DESATIVAR VINCULO COM O BALANCO', 'SUCESSO', 'CONTROLES',
          'Controle:' + dataSet.FieldByName('CODIGO_CTRL').AsString, buscas);
     end;
   end;
   vCtrlBalanco.Refresh;
end;

function TControle.restauralixeira: boolean;
var
	vCodControle: string;
	vNomeControle: string;
  vtemp: string;
begin
	try
  	result := false;
    if dataSet.IsEmpty then
      exit;

    if dataSet.FieldByName('ATIVO').asinteger <> 0 then
    begin
      Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
      vCodControle := trim(dataSet.FieldByName('CODIGO_CTRL').AsString);
      vNomeControle := trim(dataSet.FieldByName('NOME_CTRL').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vCodControle := '';
        vNomeControle := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(vCodControle) <> '') then
      	prepare_loop('CODIGO_CTRL = ' + vCodControle)
      else
		    prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        'CONTROLE' + #13 +
        'Código: ' + vCodControle + #13 +
        'Nome: ' + vNomeControle;

      if (trim(vNomeControle) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('CXG007', 'RESTAURAR', '', 'CONTROLES',
        vDadosIni.IfThen(trim(vCodControle) <> '', vCodControle, ''), buscas, true) then
          exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando controle(s)');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando controle(s) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update controles set ativo = 1 ' +
          ' where codigo_ctrl = %d ' +
          ' and codigo_emp = %d ',
          [fint('codigo_ctrl'), fint('codigo_emp')], buscas);

        vDadosIni.AtualizarControles(buscas, tRecuperar, fint('codigo_ctrl'));

        if (trim(vCodControle) = '') then
          vDadosIni.GravaAuditoria('CXG007', 'RESTAURAR', '', 'CONTROLES',
            dataSet.FieldByName('CODIGO_CTRL').AsString, buscas);

        dataset.Next;
      end;
    finally
    	vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    Result := CommitaTransacao;
    if Result then
    begin
    	vDadosIni.GravaAuditoria('CXG007', 'RESTAURAR', 'SUCESSO', 'CONTROLES',
        vDadosIni.IfThen(trim(vCodControle) <> '', vCodControle, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
    	vDadosIni.GravaAuditoria('CXG007', 'RESTAURAR', 'FALHA', 'CONTROLES',
        vDadosIni.IfThen(trim(vCodControle) <> '', vCodControle, ''), buscas);
    end;

    if Result then
      Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TControle.retornaIdentificacaoEmp(pCodEmpresa: Integer): string;
begin
	SqlOpen(' select (trim(coalesce(identificacao_emp, nome_emp)) ||'' - ''|| trim(coalesce(cgc_emp, ''''))) identificacao_emp ' +
  	' from empresa ' +
  	' where cod_empresa = ' + IntToStr(pCodEmpresa), buscas);

  Result := trim(buscas.FieldByName('identificacao_emp').AsString);
end;

function TControle.SelecionarDiretorio(diretorioInicial: string): String;
var
   S:String;
begin
   SelectDirectory('Selecione o caminho','', S);
   if Trim (S) = '' then
      result := diretorioInicial
   else
      Result := S;
end;

procedure TControle.SetlkBandeira(const Value: TDadosLookUp_OOP);
begin
  FlkBandeira := Value;
end;

procedure TControle.SetlkTipoPagamento(const Value: TDadosLookUp_OOP);
begin
  FlkTipoPagamento := Value;
end;

function TControle.statuslixeira: boolean;
begin
   Result := ExecutaComandosSql('select * from controles ' +
   	 ' where ativo = 0 ' +
     ' and codigo_emp = ' + vDadosIni.codEmpresa);
end;


function TControle.testarRegraFormaProgFid(pregra: string): boolean;
begin
  Result := false;

  SqlOpen(' select count(*) from regras_prog_fidelidade r ' +
    ' inner join config_regras_prog_fidelidade cp on cp.cod_tp_regra = r.cod_tp_regra and cp.cod_empresa = r.cod_empresa ' +
    ' where r.descricao_regra = ''' + pregra + ''' and r.situacao = ''ATIVA'' ' +
    ' and r.cod_empresa = ' + vDadosIni.codEmpresa);
  Result := buscas.FieldByName('count').AsInteger > 0;
end;

function TControle.verificaControle_e_balanco: Boolean;
begin
  Result := True;
  if dataSet.IsEmpty then
  begin
    result := False;
    Application.MessageBox('Não foi selecionado um Controle, verifique!','Atenção',MB_ICONWARNING + MB_OK);
    exit;
  end;

  if vBalanco.dataSet.IsEmpty then
  begin
    Result := False;
    Application.MessageBox('Não foi selecionado um Balanço, verifique!','Atenção',MB_ICONWARNING + MB_OK);
  end;
end;

function TControle.verificarCodigoControle: Boolean;
begin
  if (dataSet.State in [dsInsert,dsedit]) then
  begin
    if dataSet.FieldByName('CODIGO_CTRL').asString <> vCodigoControle then
    begin
      if ExecutaComandosSql('Select CODIGO_CTRL from Controles where CODIGO_CTRL = '+dataSet.FieldByName('CODIGO_CTRL').asString+' and codigo_emp ='+vdadosini.codEmpresa) then
        Result := True
      else
        Result := False;
    end
  	else
   		result := False;
  end;
end;

function TControle.verificarControleSemVinculo: boolean;
begin
  Result := true;
  	
  if ((vDadosIni.vRegistro.vSisGestor) and (dataSet.FieldByName('DESAT_VINC_BALANCO').AsString <> 'S')) then
    if vCtrlBalanco.dataSet.IsEmpty then
    begin
      if Application.MessageBox(PChar('Controle sem vínculo com o balanço' + #13 +
          'Deseja continuar mesmo assim'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      begin
        if not vDadosIni.PesqPros('CXG116', 'PERMITIR', '', 'CONTROLES',
        	dataSet.FieldByName('CODIGO_CTRL').AsString, buscas, True) then
         	Result := false;
      end
      else
        Result := false;
    end;
end;

function TControle.VerificarSaldoCtrl(vdataSource: TdataSource): boolean;
begin
  vdataSource.DataSet := DtmCadBasicosCx.qrBuscas;

  Buscas.close;
  buscas.sql.text := ' select data_sld "Data Saldo", val_sld, sobra_sld, ' +
    ' vl_crd_sld, saldo_banco, data_conc "Data Conciliação" from Sal_Ctrl ' +
    ' where codigo_ctrl = '+ dataSet.FieldByName('CODIGO_CTRL').AsString +
    ' and cod_emp = ' + vDadosIni.codEmpresa +
    ' order by data_sld ';
  buscas.Open;

  TFloatField(buscas.FieldByName('val_sld')).DisplayFormat:='#,##0.00';
  buscas.FieldByName('val_sld').DisplayLabel:='Saldo';
  TFloatField(buscas.FieldByName('SOBRA_SLD')).DisplayFormat:='#,##0.00';
  buscas.FieldByName('SOBRA_SLD').DisplayLabel:='Sobra Dia';
  TFloatField(buscas.FieldByName('VL_CRD_SLD')).DisplayFormat:='#,##0.00';
  buscas.FieldByName('VL_CRD_SLD').DisplayLabel:='Valor Somatório Credito';
  TFloatField(buscas.FieldByName('SALDO_BANCO')).DisplayFormat:='#,##0.00';
  buscas.FieldByName('SALDO_BANCO').DisplayLabel:='Saldo Bancário';
  buscas.Last;
  Result:=true;
end;


procedure TControle._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TControle._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TControle._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TControle._replicarControles: Boolean;
var
 buscas2: TIBQuery;
 J: Integer;
 vControle: Integer;
 vControleOrig, vProces, acao, vtemp: string;
begin
	Result := False;

  if dataSet.IsEmpty then
    Exit;

  if Application.MessageBox(pchar('Deseja copiar dados do conttrole' + #13 + #13 +
    dataSet.FieldByName('CODIGO_CTRL').AsString + ' - ' + dataSet.FieldByName('NOME_CTRL').AsString), 'Atenção',
    MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
     Exit;

  vProces := 'CXG147';
  acao := 'COPIAR';
  vtemp := dataSet.FieldByName('CODIGO_CTRL').AsString;

  try
    vControleOrig := dataSet.FieldByName('CODIGO_CTRL').AsString;
    if not vDadosIni.PesqPros(vProces, acao, '',
      'CONTROLES', vControleOrig, buscas, True) then
      Exit;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas.Close;
    buscas.SQL.Text := 'select * from CONTROLES ' +
      ' where CODIGO_CTRL = :CODIGO_CTRL ' +
      ' and CODIGO_EMP = :CODIGO_EMP ';
    buscas.ParamByName('CODIGO_CTRL').AsInteger := StrToInt(vControleOrig);
    buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.IsEmpty then
      raiseExceptionCreate('Não encontrado o controle', '');

    if not InputQuery('Controle', 'Informe o código do novo controle que deseja cadastrar', vtemp) then
      Exit;

    try
       StrToFloat(vtemp);
       if StrToFloat(vtemp) <= 0 then
         raiseExceptionCreate('Código do controle informado inválido', '');
    except
      Application.MessageBox('Código do controle informado inválido.', 'Atenção', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      exit;
    end;

    buscas2.Close;
    buscas2.SQL.Text := 'select CODIGO_CTRL from CONTROLES ' +
      ' where CODIGO_CTRL = :CODIGO_CTRL ' +
      ' and CODIGO_EMP = :CODIGO_EMP ';
    buscas2.ParamByName('CODIGO_CTRL').AsInteger := StrToInt(vtemp);
    buscas2.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.Open;

    if not buscas2.IsEmpty then
      raiseExceptionCreate('Código do controle informado já existe', '');

    vControle := StrToInt(vtemp);

    dataSet.Insert;
    for J := 0 to dataSet.FieldCount - 1 do
    begin
      if dataSet.Fields[J].FieldKind = fkData then
        if buscas.FindField(dataSet.Fields[J].FieldName) <> nil then
          if dataSet.Fields[J].FieldName = 'CODIGO_CTRL' then
            dataSet.FieldByName(dataSet.Fields[J].FieldName).AsInteger := vControle
          else if dataSet.Fields[J].FieldName = 'NOME_CTRL' then
          begin
          	if not buscas.FieldByName(dataSet.Fields[J].FieldName).IsNull then
            	dataSet.FieldByName(dataSet.Fields[J].FieldName).Value := trim(buscas.FieldByName(dataSet.Fields[J].FieldName).Value) + ' COPIA'
          end
          else if dataSet.Fields[J].FieldName = 'NOME_CONTABIL' then
          begin
          	if not buscas.FieldByName(dataSet.Fields[J].FieldName).IsNull then
            	dataSet.FieldByName(dataSet.Fields[J].FieldName).Value := trim(buscas.FieldByName(dataSet.Fields[J].FieldName).Value) + ' COPIA'
          end
          else if dataSet.Fields[J].FieldName = 'SALDO_ANT_CTRL' then
          	dataSet.FieldByName(dataSet.Fields[J].FieldName).Value := Null
          else if dataSet.Fields[J].FieldName = 'SALDO_AT_CTRL' then
          	dataSet.FieldByName(dataSet.Fields[J].FieldName).Value := Null
          else if dataSet.Fields[J].FieldName = 'SOBRA_CTRL' then
          	dataSet.FieldByName(dataSet.Fields[J].FieldName).Value := Null
          else
          begin
          	try
            	dataSet.FieldByName(dataSet.Fields[J].FieldName).Value := buscas.FieldByName(dataSet.Fields[J].FieldName).Value;
            except
              Application.MessageBox(PChar(dataSet.Fields[J].FieldName), 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
            end;
          end;
    end;
    dataSet.Post;

    Result := Apply;

    if not Result then
      raiseExceptionCreate('Operação será abortada', '');

    vCtrlBalanco.abreCtrlBalanco('-1');

    buscas.Close;
    buscas.SQL.Text := ' select * from CONTROLES_BALANCO ' +
    	' where CODIGO_CTRL = :CODIGO_CTRL ' +
      ' and COD_EMPRESA = :COD_EMPRESA ';
    buscas.ParamByName('CODIGO_CTRL').AsInteger := StrToInt(vControleOrig);
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.Eof do
    begin
       vCtrlBalanco.dataSet.Insert;
       vCtrlBalanco.dataSet.FieldByName('CODIGO_CTRL').AsInteger := vControle;
       vCtrlBalanco.dataSet.FieldByName('CODSEQ_BALANCO').AsInteger := buscas.FieldByName('CODSEQ_BALANCO').AsInteger;
       vCtrlBalanco.dataSet.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').AsInteger;
       vCtrlBalanco.dataSet.FieldByName('ATIVO').AsInteger := buscas.FieldByName('ATIVO').AsInteger;
       vCtrlBalanco.dataSet.Post;

       buscas.Next;
    end;

    if not buscas.IsEmpty then
      Result := vCtrlBalanco.Apply;

    if not Result then
      raiseExceptionCreate('Operação será abortada', '');

    vControleTaxaEcommerce.abreControleEcommerce(-1);

    buscas.Close;
    buscas.SQL.Text := ' select * from CONTROLES_TAXAS_ECOMMERCE ' +
    	' where CODIGO_CTRL = :CODIGO_CTRL ' +
      ' and COD_EMPRESA = :COD_EMPRESA ';
    buscas.ParamByName('CODIGO_CTRL').AsInteger := StrToInt(vControleOrig);
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.Eof do
    begin
       vControleTaxaEcommerce.dataSet.Insert;
       for J := 0 to buscas.FieldCount - 1 do
       	if vControleTaxaEcommerce.dataSet.Fields[J].FieldKind = fkData then
      	  if buscas.FindField(vControleTaxaEcommerce.dataSet.Fields[J].FieldName) <> nil then
       			if (vControleTaxaEcommerce.dataSet.Fields[J].FieldName <> 'CODIGO_CTRL') and (vControleTaxaEcommerce.dataSet.Fields[J].FieldName <> 'SEQID') then
            	vControleTaxaEcommerce.dataSet.FieldByName(vControleTaxaEcommerce.dataSet.Fields[J].FieldName).Value := buscas.FieldByName(vControleTaxaEcommerce.dataSet.Fields[J].FieldName).Value;
       vControleTaxaEcommerce.dataSet.FieldByName('CODIGO_CTRL').AsInteger := vControle;
       vControleTaxaEcommerce.dataSet.FieldByName('SEQID').AsInteger :=
        Gencodigo('CONTROLES_TAXAS_ECOMMERCE', DtmCadBasicosCx.SpIncCodigo, vDadosIni.codEmpresa);

       vControleTaxaEcommerce.dataSet.Post;

       buscas.Next;
    end;

    if not buscas.IsEmpty then
      Result := vControleTaxaEcommerce.Apply;

    if not Result then
      raiseExceptionCreate('Operação será abortada', '');

    dataSet.Close;
    dataSet.CommandText := 'select * from CONTROLES ' +
      ' where CODIGO_CTRL = :CODIGO_CTRL ' +
      ' and CODIGO_EMP = :CODIGO_EMP ';
    dataSet.Params.ParamByName('CODIGO_CTRL').AsInteger := vControle;
    dataSet.Params.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.Open;

    if Result then
      Result := CommitaTransacao
    else
    	RollBackTransacao;

    if Result then
      vDadosIni.GravaAuditoria(vProces, acao, 'SUCESSO', 'CONTROLES', vControleOrig, buscas)
    else
      vDadosIni.GravaAuditoria(vProces, acao, 'FALHA', 'CONTROLES', vControleOrig, buscas);

    Result := true;

  except
    on e: exception do
    begin
      vDadosIni.GravaAuditoria(vProces, acao, 'FALHA', 'CONTROLES', vControleOrig, buscas);
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControle._replicarControles. Erro: ' + e.Message);
    end;
  end;
end;

{ TBalanco }

function TBalanco.abreBalanco: boolean;
begin
   Result := montaSelect('select * from dados_balanco where Ativo = 1');
end;

constructor TBalanco.Create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsBalanco);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

{ TCtrlBalanco }

function TCtrlBalanco.abreCtrlBalanco(cod_controle : string): Boolean;
begin
   Result := montaSelect(' select c.*, d.tipo_balanco, d.codigo_int_bal, d.desc_balanco, ' +
     ' d.subtipo, d.sinal, d.prazoinicial, d.prazofinal, emp.identificacao_emp from controles_balanco c ' +
     ' inner join empresa emp on emp.cod_empresa = c.cod_empresa ' +
     ' inner join dados_balanco d on d.codseq_balanco = c.codseq_balanco ' +
     ' where c.codigo_ctrl = '+ vDadosIni.IfThen(trim(cod_controle) = '', '0', cod_controle) +
     ' and c.cod_empresa = '+ vDadosIni.codEmpresa + ' and c.ativo = 1 ' +
     ' order by c.codseq_balanco ');
end;

constructor TCtrlBalanco.Create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsCtrlBalanco);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;


function TCtrlBalanco.delete: Boolean;
var
  vCodControle, vCodSeqBal: string;
begin
  if dataSet.IsEmpty then
     exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
     'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
     vCodControle := dataSet.FieldByName('codigo_ctrl').AsString;
     vCodSeqBal := dataSet.FieldByName('codseq_balanco').AsString;
     dataSet.Delete;

     if vComitar then
     begin
       if Apply then
       begin
          CommitaTransacao;
          result := true;

          vDadosIni.GravaAuditoria('CXG013', 'EXCLUSAO CONFIRMADA', 'SUCESSO', 'CONTROLES',
            'COD.CONTROLE: ' +vCodControle + 'COD.BALANCO: '+ vCodSeqBal + '' , buscas);
       end;
     end;
   end;
   Refresh;
end;

function TCtrlBalanco.insert: Boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect(' select c.*, d.tipo_balanco, d.codigo_int_bal, d.desc_balanco, ' +
      	' d.subtipo, d.sinal, d.prazoinicial, d.prazofinal, emp.identificacao_emp from controles_balanco c ' +
         ' inner join empresa emp on emp.cod_empresa = c.cod_empresa ' +
         ' inner join dados_balanco d on d.codseq_balanco = c.codseq_balanco ' +
         ' where 1 = 0 and c.cod_empresa = '+vDadosIni.codEmpresa);
   if inherited Insert then
      result := true;

end;

function TCtrlBalanco.post(cod_balanco: string): Boolean;
begin
  Try
    if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

    if obControle.PesquisaControleCadastrado then
    begin
       Application.MessageBox('Sequência de balanco já existe para este controle, verifique!','Atenção', MB_ICONINFORMATION + MB_OK );
       Cancel;
       Exit;
    end;
     Result := inherited post;
     if dataSet.ChangeCount = 0 then
     begin
        result := true;
        exit;
     end;

     if not vComitar then
     begin
       vDadosIni.GravaAuditoria('CXG012', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'CONTROLES',
          'COD.CONTROLE: '+dataSet.FieldByName('codigo_ctrl').AsString + 'COD.BALANCO: '+ dataSet.FieldByName('codseq_balanco').AsString + '' , buscas);
       if obControle.dataSet.State = dsEdit then
       begin
         vChangeCount := 1;
         Apply;
       end;
       Result := true;
     end
     else
     begin
       if Apply then
       begin
          if CommitaTransacao then
          begin
            result := True;

            vDadosIni.GravaAuditoria('CXG012', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'CONTROLES',
              'COD.CONTROLE: '+dataSet.FieldByName('codigo_ctrl').AsString + 'COD.BALANCO: '+ dataSet.FieldByName('codseq_balanco').AsString + '' , buscas);
          end;
       end
       else
       begin
          Cancel;
          RollBackTransacao;
          Result := False;
       end;
     end;
     Refresh;

  Except
     on e: Exception do
     begin
        Result := false;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;
end;

{ TCobrebem_controle }
constructor TCobrebem_controle.create;
begin
  buscas := TIBQuery(DtmCadBasicosCx.qrCobreBem);
  dataSet := TClientDataSet(DtmCadBasicosCx.cdsCobrebem);
  transacao := TIBTransaction(DtmCadBasicosCx.IBTransBoletos);
end;

function TCobrebem_controle.abreCobrebemControle : boolean;
begin
 Result := montaSelect('select * from cobrebem as cbb' +
                      ' where cbb.cod_empresa = ' + vDadosIni.codEmpresa +
                      ' ORDER BY COD_COBREBEM');
end;


{ TPlanoContas }

function TPlanoContas.abrePlanoContas(pTipo: string = ''): boolean;
begin
  if pTipo = '' then
  begin
    Result := montaSelect('Select * from P_Contas where Ativo = 1 order by n_conta_plc' );
    vGrupoPC.abreGrupoPC;
    vSubGrupoPC.abreSubGrupoPC;
    vDptoGrupoPC.abreDptoGrupoPC;
    vDadosDre.abreDadosDre;
  //  vRateioDpto.abreRateioDpto;
    vPcontasM.abrePContasM;
    vDptoDestino.abreDptoDestino;
    vEmpresa.abreEmpresa;
  //  vRateioContas.abreRateioContas;
  //  vHistPContas.abreHistPContas;
    vBalanco.abreBalanco;
  //  vPContaBalanco.abrePContasBalanco;
	end
  else if pTipo = 'E' then
  	Result := montaSelect('Select * from P_Contas where Ativo = 1 and tipo_plc = ''E'' order by n_conta_plc' )
  else if pTipo = 'S' then
    Result := montaSelect('Select * from P_Contas where Ativo = 1 and tipo_plc = ''S'' order by n_conta_plc' );
end;

function TPlanoContas.abrelixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
    result := false;
  end
  else
    result := montaSelect('SELECT * FROM P_Contas where Ativo = 0');
end;

procedure TPlanoContas.cadPlanoContas(TipoForm: Integer);
begin
    vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro de Plano de Contas...');
    vDadosIni.vTipoForm := TipoForm;
    if dtmcadbasicoscx = nil then
       dtmcadbasicoscx := Tdtmcadbasicoscx.Create(dtmcadbasicoscx);

    if frmCadPlanoContas = nil then
       Application.CreateForm(TfrmCadPlanoContas, frmCadPlanoContas);
     frmCadPlanoContas.Show;

end;

function TPlanoContas.cancel: boolean;
begin
   if (dataSet.State in [dsEdit, dsInsert] )then
   begin
      dataSet.Cancel;
      RollBackTransacao;
      result:= true;
   end;
end;

constructor TPlanoContas.create(pCriaTodos: boolean = True);
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsPlanoContas);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
  if pCriaTodos then
  begin
  	vPlanoContasClientes := TPlanoContasClientes.create;
  	vFornecedorConta := TFornecedorConta.create;
    vGrupoPC := TGrupoPC.create;
    vSubGrupoPC := TSubGrupoPC.create;
    vDptoGrupoPC := TDptoGrupoPC.create;
    vDadosDre := TDadosDre.create;
    vRateioDpto := TRateioDpto.create;
    vPcontasM := TPContasMes.create;
    vDptoDestino := TDptoDestino.create;
    vEmpresa := TEmpresaPConta.create;
    vRateioContas := TRateioContas.create;
    vHistPContas := THistPContas.create;
    vBalanco := TBalanco.Create;
    vPContaBalanco := TPContasBalanco.create;
  end;
end;

function TPlanoContas.delete: boolean;
begin
  Result := false;
  
   if dataSet.IsEmpty then
      exit;

   if dataSet.FieldByName('Ativo').asInteger = 0 then
   begin
      if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
       begin
          Result := true;
          vPContaBalanco.abrePContasBalanco;
          if not vPContaBalanco.IsEmpty then
          begin
            while not vPContaBalanco.Eof do
              vPContaBalanco.dataSet.Delete;
            Result := vPContaBalanco.Apply;
          end;
          if Result then
          begin
            vHistPContas.abreHistPContas;
            if not vHistPContas.dataSet.IsEmpty then
            begin
              while not vHistPContas.Eof do
                vHistPContas.dataSet.Delete;
              Result := vHistPContas.Apply;;
            end;
          end;
          if Result then
          begin
            vRateioContas.abreRateioContas;
            if not vRateioContas.dataSet.IsEmpty then
            begin
              while not vRateioContas.Eof do
                vRateioContas.dataSet.Delete;
              Result := vRateioContas.Apply;;
            end;
          end;
          if Result then
          begin
            dataSet.Delete;
            Result := Apply;
          end;
          if Result then
            Result := CommitaTransacao
          else
            RollBackTransacao;  
          if Result then
            vDadosIni.GravaAuditoria('CXG017', 'EXCLUSAO DEFINITIVA', 'SUCESSO', 'P_CONTAS', '', buscas)
          else
            vDadosIni.GravaAuditoria('CXG017', 'EXCLUSAO DEFINITIVA', 'FALHA', 'P_CONTAS', '', buscas); 
       end;
   end
   else
   if Application.MessageBox('Tem certeza que deseja mover este arquivo para a Lixeira ?',
   'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
   begin
      if Edit then
      begin
         dataSet.FieldByName('sthab').asString := 'N';
         dataSet.FieldByName('Ativo').asString := '0';
         dataSet.Post;
         Result := Apply;
         if Result then
           Result := CommitaTransacao
         else
           RollBackTransacao;  

         if Result then          
           vDadosIni.GravaAuditoria('CXG017', 'ENVIAR PARA LIXEIRA', 'SUCESSO', 'P_CONTAS', '', buscas)
         else
           vDadosIni.GravaAuditoria('CXG017', 'ENVIAR PARA LIXEIRA', 'FALHA', 'P_CONTAS', '', buscas);
      end;
   end;
   Refresh;
end;

destructor TPlanoContas.Destroy;
begin
 	if FSairDestroy then
  	Exit;
  FreeAndNil(vPlanoContasClientes);
  FreeAndNil(vFornecedorConta);
  FreeAndNil(vGrupoPC);
  FreeAndNil(vSubGrupoPC);
  FreeAndNil(vDptoGrupoPC);
  FreeAndNil(vDadosDre);
  FreeAndNil(vRateioDpto);
  FreeAndNil(vPcontasM);
  FreeAndNil(vDptoDestino);
  FreeAndNil(vEmpresa);
  FreeAndNil(vRateioContas);
  FreeAndNil(vHistPContas);
  FreeAndNil(vBalanco);
  FreeAndNil(vPContaBalanco);
end;

function TPlanoContas.edit: boolean;
begin
   if not dataSet.Active then
      result := montaSelect('Select * from P_Contas where 1 = 0');
   if inherited Edit then
   begin
    	if Trim(dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString) = '' then
      	dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString := 'N';
      if Trim(dataSet.FieldByName('ESTORNAR_VALE').AsString) = '' then
      	dataSet.FieldByName('ESTORNAR_VALE').AsString := 'N';
    	if Trim(dataSet.FieldByName('RATEIO_EMPRESA').AsString) = '' then
      	dataSet.FieldByName('RATEIO_EMPRESA').AsString := 'N';
      dataSet.FieldByName('DESC_PLC').AsString := trim(dataSet.FieldByName('DESC_PLC').AsString);
      dataSet.FieldByName('DESC_PADR').AsString := trim(dataSet.FieldByName('DESC_PADR').AsString);
      vPContaBalanco.vComitar := false;
      vPContaBalanco.vChangeCount := 0;
      vPlanoContasClientes.abrePcontasClientes(dataSet.FieldByName('N_CONTA_PLC').AsFloat);
      vFornecedorConta.AbreFornecedor(dataSet.FieldByName('CPFCGC_FORNECEDOR').AsString);
      vPContaBalanco.abrePContasBalanco;
      result := True;
   end;
end;

function TPlanoContas.existePlanoContas(pConta: string; pTipo: string = ''): Boolean;
var
	vCod: string;
begin
  vCod := StringReplace(pConta , ',', '.', [rfReplaceAll]);

  if pTipo = '' then
  	Result := ExecutaComandosSql('Select * from P_Contas where N_Conta_Plc = '+ vCod +' ')
	else if pTipo = 'E' then
  	Result := ExecutaComandosSql('Select * from P_Contas where N_Conta_Plc = '+ vCod +' and tipo_plc = ''E''')
  else if pTipo = 'S' then
  	Result := ExecutaComandosSql('Select * from P_Contas where N_Conta_Plc = '+ vCod +' and tipo_plc = ''S''');
end;

function TPlanoContas.insert: boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect('Select * from P_Contas where 1 = 0');
   if inherited Insert then
   begin
    	if Trim(dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString) = '' then
      	dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString := 'N';
    	if Trim(dataSet.FieldByName('ESTORNAR_VALE').AsString) = '' then
      	dataSet.FieldByName('ESTORNAR_VALE').AsString := 'N';
    	if Trim(dataSet.FieldByName('RATEIO_EMPRESA').AsString) = '' then
      	dataSet.FieldByName('RATEIO_EMPRESA').AsString := 'N';
      vPContaBalanco.vComitar := false;
      vPContaBalanco.vChangeCount := 0;
      vPlanoContasClientes.abrePcontasClientes(0);
      vFornecedorConta.AbreFornecedor;
      vPContaBalanco.abrePContasBalanco;
      result := true;
   end;
end;

function TPlanoContas.post: boolean;
var
  statusDataset : string;
  vdia, vmes, vano: word;
  vCodEmpresaMatriz: string;
  vApply, vApplyBalanco: boolean;
begin

  Try
     if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

     DecodeDate(date, vano, vmes, vdia);

     statusDataset := '';
     if dataSet.State = dsEdit then
        statusDataset := 'E'
     else
        statusDataset := 'I';

//     if (vGrupoPC.dataSet.FieldByName('TIPO_GR').AsString = 'S') or (dataSet.FieldByName('TIPO_CTP').AsString = 'F') then
//    		dataSet.FieldByName('GERAR_CONTRAPARTIDA').AsString := 'N';

     if Trim (dataSet.FieldByName('N_Conta_Plc').asString) = '' then
     begin
        frmCadPlanoContas.PageControl3.ActivePage := frmCadPlanoContas.TabSheet3;
        raiseExceptionCreate('Campo Número da Conta do Plano de Contas não pode ser vazio.', 'DBEdit1');
     end;
     if Trim (dataSet.FieldByName('Desc_Plc').asString) = '' then
     begin
        frmCadPlanoContas.PageControl3.ActivePage := frmCadPlanoContas.TabSheet3;
        raiseExceptionCreate('Campo Descrição do Plano de Contas não pode ser vazio.', 'DBEdit3');
     end;
     if (( Trim (dataSet.FieldByName('Grup_Ct').asString) = '') or (dataSet.FieldByName('Grup_Ct').asString = '0')) then
     begin
        frmCadPlanoContas.PageControl3.ActivePage := frmCadPlanoContas.TabSheet3;
        raiseExceptionCreate('Campo Grupo de Contas não pode ser vazio ou igual a "0" ', 'DBLookupComboBox1');
     end;
     if (( Trim (dataSet.FieldByName('Cod_Sub_Ct').asString) = '') or (dataSet.FieldByName('Cod_Sub_Ct').asString = '0')) then
     begin
        frmCadPlanoContas.PageControl3.ActivePage := frmCadPlanoContas.TabSheet3;
        raiseExceptionCreate('Campo Código Sub Grupo não pode ser vazio ou igual a "0" ', 'DBLookupComboBox2');
     end;
     if Trim(dataSet.FieldByName('TIPO_PLC').asString) = '' then
     begin
        frmCadPlanoContas.PageControl3.ActivePage := frmCadPlanoContas.TabSheet3;
        raiseExceptionCreate('Campo Natureza da Conta (E/S) não informado.', 'DBComboBox1');
     end;

     if Trim(ObPConta.dataSet.FieldByName('COD_CTA_CONTABIL').AsString ) <> '' then
     begin
       buscas.Close;
       buscas.SQL.Text := 'select first 1 cod_empresa from empresa where sped_matriz_filial = ''M''';
       buscas.Open;
       vCodEmpresaMatriz:= vDadosIni.retornoPorCondicao(buscas.FieldByName('cod_empresa').AsInteger > 0,
         buscas.FieldByName('cod_empresa').AsString, vDadosIni.codEmpresa);

       buscas.Close;
       buscas.SQL.Text := 'select COD_CTA from p_contas_contabil' +
         ' where COD_CTA = ' + QuotedStr(dataSet.FieldByName('COD_CTA_CONTABIL').AsString) +
         ' and cod_empresa = ' + vCodEmpresaMatriz;
       buscas.Open;

       if Trim(buscas.FieldByName('COD_CTA').AsString) <> Trim(dataSet.FieldByName('COD_CTA_CONTABIL').AsString) then
       begin
         frmCadPlanoContas.PageControl3.ActivePage := frmCadPlanoContas.TabSheet3;
         if Application.MessageBox(PChar('Conta contabil informada não encontrada no cadastro da Matriz: ' + vDadosIni.StrZero(vCodEmpresaMatriz, 3) + #13 +
           'Deseja continuar mesmo assim'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
         begin
           Result := False;
           Exit;
         end;
       end;
     end;

     if not verificarControleSemVinculo then
     begin
        frmCadPlanoContas.PageControl3.ActivePage := frmCadPlanoContas.TabSheet23;
        raiseExceptionCreate('Plano de conta sem vínculo com o balanço', 'DBGrid9');
     end;

     Result := inherited post;

     vPContaBalanco.dataSet.First;
     while not vPContaBalanco.dataSet.Eof do
     begin
        vPContaBalanco.dataSet.Edit;
        vPContaBalanco.dataSet.FieldByName('N_CONTA_PLC').AsFloat := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
        vPContaBalanco.dataSet.Post;

        vPContaBalanco.dataSet.Next;
     end;
     vPContaBalanco.dataSet.First;

     if ((dataSet.ChangeCount = 0) and (vPContaBalanco.dataSet.ChangeCount = 0) and (vPContaBalanco.vChangeCount = 0)) then
     begin
        result := true;
        exit;
     end;

     if dataSet.State = dsInsert then
     begin
       vPcontasM.Insert;
       vPcontasM.dataSet.FieldByName('N_Conta_Plc').AsString := dataSet.FieldByName('N_Conta_Plc').AsString;
       vPcontasM.dataSet.FieldByName('Mes_Plc').Value := vmes;
       vPcontasM.dataSet.FieldByName('Ano_Plc').Value := vano;
       vPcontasM.dataSet.FieldByName('Codigo_Emp').AsString := vDadosIni.codEmpresa;
       vPcontasM.Post;
     end;

     vApply := Apply;
     vApplyBalanco := vPContaBalanco.Apply;

     if ((vApply) or (vApplyBalanco) or (vPContaBalanco.vChangeCount <> 0)) then
     begin
        if CommitaTransacao then
        begin
           result := True;

           if statusDataset = 'E' then
             vDadosIni.GravaAuditoria('CXG024', 'ALTERAÇÃO CONFIRMADA', 'SUCESSO', 'P_CONTAS',
              dataSet.FieldByName('N_Conta_plc').AsString, buscas)
           else
           begin
             vDadosIni.GravaAuditoria('CXG024', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'P_CONTAS',
              dataSet.FieldByName('N_Conta_plc').AsString, buscas);

             vDadosIni.GravaAuditoria('CXG053', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'P_CONTAS_M',
             'Conta:' + dataSet.FieldByName('N_Conta_Plc').AsString + ' - Mês:' + vPcontasM.dataSet.FieldByName('Mes_Plc').AsString, buscas);
           end;
        end;
     end
     else
     begin
        Result := False;
        Cancel;
        RollBackTransacao;

        if statusDataset = 'E' then
           vDadosIni.GravaAuditoria('CXG024', 'ALTERAÇÃO NÃO CONFIRMADA', 'FALHA', 'P_CONTAS',
            dataSet.FieldByName('N_Conta_plc').AsString, buscas)
        else
        begin
           vDadosIni.GravaAuditoria('CXG024', 'ALTERAÇÃO NÃO CONFIRMADA', 'FALHA', 'P_CONTAS',
            dataSet.FieldByName('N_Conta_plc').AsString, buscas);

             vDadosIni.GravaAuditoria('CXG053', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'P_CONTAS_M',
             'Conta:' + dataSet.FieldByName('N_Conta_Plc').AsString + ' - Mês:' + vPcontasM.dataSet.FieldByName('Mes_Plc').AsString, buscas);
        end;
     end;
     vPContaBalanco.vComitar := true; 
     Refresh;
  Except
     on e: Exception do
     begin
        Result := false;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;
end;

function TPlanoContas.Procura_e_Troca(Encontrar, Substituir: string; Vconteudo: string): string;
var I, Posicao: Integer;
begin

//  Posicao := Pos(Encontrar, vconteudo);
//  if Posicao > 0 then
//  begin
//    DELETE( Vconteudo, Posicao, LENGTH(Encontrar));
//    INSERT( Substituir, vconteudo, Posicao);
//  end;
//  Procura_e_Troca := vconteudo;

end;

function TPlanoContas.removerAtivarVinculoBalanco(pAtivar: boolean): boolean;
var
  vComitar: boolean;
begin
   vComitar := false;
   if not (dataSet.state in [dsedit,dsinsert]) then
   begin
     vComitar := true;
     dataSet.Edit;
   end;
   if pAtivar then
   	dataSet.FieldByName('DESAT_VINC_BALANCO').Value := Null
   else
   	dataSet.FieldByName('DESAT_VINC_BALANCO').AsString := 'S';
   if vComitar then
   begin
     dataSet.Post;
	  Apply;
     if CommitaTransacao then
     begin
        result := True;
        if not pAtivar then
          vDadosIni.GravaAuditoria('CXG117', 'DESATIVAR VINCULO COM O BALANCO', 'SUCESSO', 'P_CONTAS',
          'Conta:' + dataSet.FieldByName('N_Conta_Plc').AsString, buscas);
     end;
   end;
   vPContaBalanco.Refresh;
end;

function TPlanoContas.restauralixeira: boolean;
begin
   if not dataSet.IsEmpty then
      if dataSet.FieldByName('ATIVO').asinteger = 0 then
      begin
         if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
           'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
         begin
            if Edit then
            begin
              dataSet.FieldByName('sthab').Value := Null;
              dataSet.FieldByName('ATIVO').asinteger := 1;
              DataSet.Post;
              if Apply then
                CommitaTransacao;
            end;
         end;
      end
      else
         Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION +
          MB_DEFBUTTON1);
   Refresh;

end;

function TPlanoContas.statuslixeira: boolean;
begin
   Result := ExecutaComandosSql('Select * from P_Contas where Ativo = 0 ');
end;

function TPlanoContas.VerificaDpto (cod:string) : Boolean;
begin
  Result := ExecutaComandosSql('Select * from Depart_Ct where Cod_Dep = '+ cod +'');
end;

function TPlanoContas.VerificaGrupoPC (cod:string) : Boolean;
begin
  Result := ExecutaComandosSql('Select * from Grupos_ct where Grup_ct = '+ cod +'');
end;

function TPlanoContas.VerificaPContasBalanco : Boolean;
var
   CodPConta : string;
begin
  CodPConta := StringReplace( dataSet.FieldByName('N_Conta_Plc').AsString , ',', '.', [rfReplaceAll]);
  if trim(CodPConta) = '' then
    CodPConta := '0';
  Result := ExecutaComandosSql(' Select * from P_Contas_Balanco ' +
    ' where N_Conta_Plc = '+ CodPConta + ' and Cod_Empresa = '+ vDadosIni.codEmpresa +
    ' and Codseq_Balanco = '+ vBalanco.dataSet.FieldByName('Codseq_Balanco').AsString  );
end;

function TPlanoContas.VerificaPlanoContas: Boolean;
var
   cod : string;
begin
  cod := StringReplace( dataSet.FieldByName('N_Conta_Plc').AsString , ',', '.', [rfReplaceAll]);

  Result := ExecutaComandosSql('Select * from P_Contas where N_Conta_Plc = '+ cod +' ');
end;


function TPlanoContas.verificarControleSemVinculo: boolean;
begin
  Result := true;

  if ((vDadosIni.vRegistro.vSisGestor) and (dataSet.FieldByName('DESAT_VINC_BALANCO').AsString <> 'S')) then
    if vPContaBalanco.dataSet.IsEmpty then
    begin
      if Application.MessageBox(PChar('Plano de conta sem vínculo com o balanço' + #13 +
          'Deseja continuar mesmo assim'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      begin
        if not vDadosIni.PesqPros('CXG115', 'PERMITIR', '', 'P_CONTAS',
	        dataSet.FieldByName('N_CONTA_PLC').AsString, buscas, True) then
        	Result := false;
      end
      else
	      Result := false;
    end;
end;

function TPlanoContas.VerificaSubGrupoPC(cod: string): Boolean;
begin
  Result := ExecutaComandosSql('Select * from Sub_Grup_Ct where Cod_Sub_ct = '+ cod +'');
end;

function TPlanoContas._replicarPContas: Boolean;
var
 buscas2: TIBQuery;
 J: Integer;
 vNumConta: Double;
 vNumContaOrig, vProces, acao, vtemp: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if Application.MessageBox(pchar('Deseja copiar dados da conta?' + #13 + #13 +
    dataSet.FieldByName('N_CONTA_PLC').AsString + ' - ' + dataSet.FieldByName('DESC_PLC').AsString), 'Atenção',
    MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
     Exit;

  vProces := 'CXG121';
  acao := 'COPIAR';
  vtemp := dataSet.FieldByName('N_CONTA_PLC').AsString;

  try
    vNumContaOrig := dataSet.FieldByName('N_CONTA_PLC').AsString;
    if not vDadosIni.PesqPros(vProces, acao, '',
      'P_CONTAS', vNumContaOrig, buscas, True) then
      Exit;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas.Close;
    buscas.SQL.Text := 'select * from P_CONTAS ' +
      ' where N_CONTA_PLC = :N_CONTA_PLC ';
    buscas.ParamByName('N_CONTA_PLC').AsFloat := StrToFloat(vNumContaOrig);
    buscas.Open;

    if buscas.IsEmpty then
      raiseExceptionCreate('Não encontrado o plano de contas', '');

    if not InputQuery('Numero da conta', 'Informe o código do novo plano de conta que deseja cadastrar', vtemp) then
      Exit;

    try
       StrToFloat(vtemp);
       if StrToFloat(vtemp) <= 0 then
         raiseExceptionCreate('Código de plano de conta informado inválido', '');
    except
      Application.MessageBox('Código do plano de conta informado inválido.', 'Atenção', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      exit;
    end;

    buscas2.Close;
    buscas2.SQL.Text := 'select N_CONTA_PLC from P_CONTAS ' +
      ' where N_CONTA_PLC = :N_CONTA_PLC ';
    buscas2.ParamByName('N_CONTA_PLC').AsFloat := StrToFloat(vtemp);
    buscas2.Open;

    if not buscas2.IsEmpty then
      raiseExceptionCreate('Código de conta informado já existe', '');

    vNumConta := StrToFloat(vtemp);

    dataSet.Insert;
    for J := 0 to dataSet.FieldCount - 1 do
    begin
      if dataSet.Fields[J].FieldKind = fkData then
        if buscas.FindField(dataSet.Fields[J].FieldName) <> nil then
          if dataSet.Fields[J].FieldName = 'N_CONTA_PLC' then
            dataSet.FieldByName(dataSet.Fields[J].FieldName).AsFloat := vNumConta
          else if dataSet.Fields[J].FieldName = 'DESC_PLC' then
            dataSet.FieldByName(dataSet.Fields[J].FieldName).Value := trim(buscas.FieldByName(dataSet.Fields[J].FieldName).Value) + ' COPIA'
          else
            dataSet.FieldByName(dataSet.Fields[J].FieldName).Value := buscas.FieldByName(dataSet.Fields[J].FieldName).Value;
    end;
    dataSet.Post;

    Result := Apply;

    if not Result then
      raiseExceptionCreate('Operação será abortada', '');

    buscas.Close;
    buscas.SQL.Text := 'select * from P_CONTAS_BALANCO' +
      ' where N_CONTA_PLC = :N_CONTA_PLC ' +
      ' and COD_EMPRESA = :COD_EMPRESA ';
    buscas.ParamByName('N_CONTA_PLC').AsFloat := StrToFloat(vNumContaOrig);
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.Eof do
    begin
       vPContaBalanco.Insert;
       vPContaBalanco.dataSet.FieldByName('CODSEQ_BALANCO').AsString := buscas.FieldByName('CODSEQ_BALANCO').AsString;
       vPContaBalanco.dataSet.FieldByName('N_CONTA_PLC').AsFloat := vNumConta;
       vPContaBalanco.dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
       vPContaBalanco.dataSet.FieldByName('ATIVO').AsInteger := buscas.FieldByName('ATIVO').AsInteger;
       vPContaBalanco.dataSet.Post;

       buscas.Next;
    end;

    if not buscas.IsEmpty then
      Result := vPContaBalanco.Apply;

    if not Result then
      raiseExceptionCreate('Operação será abortada', '');

    buscas.Close;
    buscas.SQL.Text := ' select * from HISTORICO_P_CONTAS ' +
    	' where Numero_Conta = :N_CONTA_PLC';
    buscas.ParamByName('N_CONTA_PLC').AsFloat := StrToFloat(vNumContaOrig);
    buscas.Open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.Eof do
    begin
       vHistPContas.Insert;
       vHistPContas.dataSet.FieldByName('HISTORICO').AsString := buscas.FieldByName('HISTORICO').AsString;
       vHistPContas.dataSet.FieldByName('NUMERO_CONTA').AsFloat := vNumConta;
       vHistPContas.dataSet.FieldByName('ATIVO').AsInteger := buscas.FieldByName('ATIVO').AsInteger;
       vHistPContas.dataSet.Post;

       buscas.Next;
    end;

    if not buscas.IsEmpty then
      Result := vHistPContas.Apply;

    if not Result then
      raiseExceptionCreate('Operação será abortada', '');

    buscas.Close;
    buscas.SQL.Text := ' select * from CONTAS_REL_ORIGEM ' +
    	' where n_conta_plc_or = :N_CONTA_PLC ';
    buscas.ParamByName('N_CONTA_PLC').AsFloat := StrToFloat(vNumContaOrig);
    buscas.Open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.Eof do
    begin
       vRateioContas.Insert;
       vRateioContas.dataSet.FieldByName('N_CONTA_PLC_OR').AsFloat := vNumConta;
       vRateioContas.dataSet.FieldByName('N_CONTA_PLC_VAL').AsFloat := buscas.FieldByName('N_CONTA_PLC_VAL').AsFloat;
       vRateioContas.dataSet.FieldByName('N_CONTA_DEST').AsFloat := buscas.FieldByName('N_CONTA_DEST').AsFloat;
       vRateioContas.dataSet.FieldByName('MESES').AsInteger := buscas.FieldByName('MESES').AsInteger;
       vRateioContas.dataSet.Post;

       buscas.Next;
    end;

    if not buscas.IsEmpty then
      Result := vRateioContas.Apply;

    if not Result then
      raiseExceptionCreate('Operação será abortada', '');

    dataSet.Close;
    dataSet.CommandText := 'select * from P_CONTAS ' +
      ' where N_CONTA_PLC = :N_CONTA_PLC ';
    dataSet.Params.ParamByName('N_CONTA_PLC').AsFloat := vNumConta;
    dataSet.Open;
      
    if Result then
      Result := CommitaTransacao
    else
    	 RollBackTransacao;  

    if Result then  
      vDadosIni.GravaAuditoria(vProces, acao, 'SUCESSO', 'P_CONTAS', vNumContaOrig, buscas)
    else
      vDadosIni.GravaAuditoria(vProces, acao, 'FALHA', 'P_CONTAS', vNumContaOrig, buscas);

    Result := true;
  except
    on e: exception do
    begin
      vDadosIni.GravaAuditoria(vProces, acao, 'FALHA', 'P_CONTAS', vNumContaOrig, buscas);
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TPlanoContas._replicarPContas. Erro: ' + e.Message);
    end;
  end;
end;

{ TGrupoPC }

function TGrupoPC.abreGrupoPC: Boolean;
begin
   Result := montaSelect('select ct.*,dp.desc_dep from Grupos_Ct ct,depart_ct dp where ct.cod_dep = '+
   'dp.cod_dep');
end;

function TGrupoPC.abreGrupoPCRelatorio (cod_grp : string) : Boolean;
begin
   Result := montaSelect('select ct.*,dp.desc_dep from Grupos_Ct ct,depart_ct dp where ct.cod_dep = '+
   'dp.cod_dep and ct.Grup_ct = '+ cod_grp +'');
end;

function TGrupoPC.cancel: boolean;
begin
   if (dataSet.State in [dsEdit, dsInsert] )then
   begin
      dataSet.Cancel;
      RollBackTransacao;
      result:= true;
   end;
end;

constructor TGrupoPC.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsGrupoPC);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TGrupoPC.delete: boolean;
begin
   if dataSet.IsEmpty then
      exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
   'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
   begin
//      dataSet.Delete;
//      if Apply then
//         if CommitaTransacao then
//            result := true;
     buscas.close;
     buscas.sql.text:='delete from grupos_ct where grup_ct = '+dataSet.FieldByName('GRUP_CT').AsString;
     buscas.Prepare;
     buscas.ExecSQL;
     if CommitaTransacao then
      result := true;
   end;
   Refresh;
end;

function TGrupoPC.edit: boolean;
begin
   if not dataSet.Active then
      result := montaSelect('Select * from Grupos_ct where 1 = 0');
   if inherited Edit then
      result := True;
end;

function TGrupoPC.insert: boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect('Select * from Grupos_ct where 1 = 0');
   if inherited Insert then
      result := true;
end;

function TGrupoPC.post: boolean;
var
  statusDataset : string;
begin

  Try
     if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

     statusDataset := '';
     if dataSet.State = dsEdit then
        statusDataset := 'E'
     else
        statusDataset := 'I';

     if Trim (dataSet.FieldByName('Grup_ct').asString) = '' then
        raise Exception.Create('Campo Número do Grupo não pode ser vazio.');
     if Trim (dataSet.FieldByName('Desc_gr').asString) = '' then
        raise Exception.Create('Campo Descrição do Grupo não pode ser vazio.');

     Result := inherited post;
     if dataSet.ChangeCount = 0 then
     begin
        result := true;
        exit;
     end;

     if Apply then
     begin
        if CommitaTransacao then
        begin
           result := True;

           if statusDataset = 'E' then
             vDadosIni.GravaAuditoria('CXG031', 'ALTERAÇÃO CONFIRMADA', 'SUCESSO', 'GRUPOS_CT',
              dataSet.FieldByName('grup_ct').AsString, buscas)
           else
             vDadosIni.GravaAuditoria('CXG031', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'GRUPOS_CT',
              dataSet.FieldByName('grup_ct').AsString, buscas);
        end;
     end
     else
     begin
        Result := False;
        Cancel;
        RollBackTransacao;

        if statusDataset = 'E' then
           vDadosIni.GravaAuditoria('CXG031', 'ALTERAÇÃO NÃO CONFIRMADA', 'FALHA', 'GRUPOS_CT',
            dataSet.FieldByName('grup_ct').AsString, buscas)
        else
           vDadosIni.GravaAuditoria('CXG031', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'GRUPOS_CT',
            dataSet.FieldByName('grup_ct').AsString, buscas)

     end;
     Refresh;
     
  Except
     on e: Exception do
     begin
        Result := false;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;
end;

{ TSubGrupoPC }

function TSubGrupoPC.abreSubGrupoPC: Boolean;
begin
   Result := montaSelect('Select * from Sub_Grup_CT');
end;

function TSubGrupoPC.cancel: boolean;
begin
   if (dataSet.State in [dsEdit, dsInsert] )then
   begin
      dataSet.Cancel;
      RollBackTransacao;
      result:= true;
   end;

end;

constructor TSubGrupoPC.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsSubGrupoPC);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TSubGrupoPC.delete: boolean;
begin
   if dataSet.IsEmpty then
      exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
   'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
   begin
      dataSet.Delete;
      if Apply then
         if CommitaTransacao then
         result := true;
   end;

   Refresh;
end;

function TSubGrupoPC.edit: boolean;
begin
   if not dataSet.Active then
      result := montaSelect('Select * from Sub_grup_ct where 1 = 0');
   if inherited Edit then
      result := True;
end;

function TSubGrupoPC.insert: boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect('Select * from Sub_grup_ct where 1 = 0');
   if inherited Insert then
      result := true;
end;

function TSubGrupoPC.post: boolean;
var
  statusDataset : string;
begin

  Try
     if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

     statusDataset := '';
     if dataSet.State = dsEdit then
        statusDataset := 'E'
     else
        statusDataset := 'I';

     if Trim (dataSet.FieldByName('Cod_Sub_ct').asString) = '' then
        raise Exception.Create('Campo Número do Sub Grupo não pode ser vazio.');
     if Trim (dataSet.FieldByName('Desc_Sub_ct').asString) = '' then
        raise Exception.Create('Campo Descrição do Sub Grupo não pode ser vazio.');

     if dataSet.State = dsInsert then
     begin
        dataSet.FieldByName('Data_Cad_pc').Value := Date;
        dataSet.FieldByName('Data_Mod_pc').Value := Date;
     end
     else
        dataSet.FieldByName('Data_Mod_pc').Value := Date;

     Result := inherited post;
     if dataSet.ChangeCount = 0 then
     begin
        result := true;
        exit;
     end;

     if Apply then
     begin
        if CommitaTransacao then
        begin
           result := True;

           if statusDataset = 'E' then
             vDadosIni.GravaAuditoria('CXG037', 'ALTERAÇÃO CONFIRMADA', 'SUCESSO', 'SUB_GRUP_CT',
              dataSet.FieldByName('Cod_Sub_ct').AsString, buscas)
           else
             vDadosIni.GravaAuditoria('CXG037', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'SUB_GRUP_CT',
              dataSet.FieldByName('Cod_Sub_ct').AsString, buscas);
        end;
     end
     else
     begin
        Result := False;
        Cancel;
        RollBackTransacao;

        if statusDataset = 'E' then
           vDadosIni.GravaAuditoria('CXG037', 'ALTERAÇÃO NÃO CONFIRMADA', 'FALHA', 'SUB_GRUP_CT',
            dataSet.FieldByName('Cod_Sub_ct').AsString, buscas)
        else
           vDadosIni.GravaAuditoria('CXG037', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'SUB_GRUP_CT',
            dataSet.FieldByName('Cod_Sub_ct').AsString, buscas);
     end;
     Refresh;

  Except
     on e: Exception do
     begin
        Result := false;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;

end;

{ TDptoGrupoPC }

function TDptoGrupoPC.abreDptoGrupoPC: Boolean;
begin
   Result := montaSelect('Select * from Depart_Ct');
end;

function TDptoGrupoPC.abreDptoRelatorio(cod_dpto: string): Boolean;
begin
   Result := montaSelect('Select * from Depart_Ct where cod_dep = '+ cod_dpto +' ');
end;

function TDptoGrupoPC.cancel: boolean;
begin
   if (dataSet.State in [dsEdit, dsInsert] )then
   begin
      dataSet.Cancel;
      RollBackTransacao;
      result:= true;
   end;
end;

constructor TDptoGrupoPC.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsDptoGrupo);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TDptoGrupoPC.delete: boolean;
begin
   if dataSet.IsEmpty then
      exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
   'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      dataSet.Delete;
      if Apply then
         if CommitaTransacao then
         result := true;
    end;
   Refresh;
end;

function TDptoGrupoPC.edit: boolean;
begin
   if not dataSet.Active then
      result := montaSelect('Select * from Depart_ct where 1 = 0');
   if inherited Edit then
      result := True;
end;

function TDptoGrupoPC.insert: boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect('Select * from Depart_ct where 1 = 0');
   if inherited Insert then
      result := true;
end;

function TDptoGrupoPC.post: boolean;
var
 statusDataset : string;
begin
  Try
     if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

     statusDataset := '';
     if dataSet.State = dsEdit then
        statusDataset := 'E'
     else
        statusDataset := 'I';

     if Trim (dataSet.FieldByName('Cod_Dep').asString) = '' then
        raise Exception.Create('Campo Número do Departamento não pode ser vazio.');
     if Trim (dataSet.FieldByName('Desc_Dep').asString) = '' then
        raise Exception.Create('Campo Descrição do Departamento não pode ser vazio.');

     Result := inherited post;
     if dataSet.ChangeCount = 0 then
     begin
        result := true;
        exit;
     end;

     if Apply then
     begin
        if CommitaTransacao then
        begin
           result := True;

           if statusDataset = 'E' then
             vDadosIni.GravaAuditoria('CXG044', 'ALTERAÇÃO CONFIRMADA', 'SUCESSO', 'DEPART_CT',
              dataSet.FieldByName('COD_DEP').AsString, buscas)
           else
             vDadosIni.GravaAuditoria('CXG044', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'DEPART_CT',
              dataSet.FieldByName('COD_DEP').AsString, buscas);
        end;
     end
     else
     begin
        Result := False;
        Cancel;
        RollBackTransacao;

        if statusDataset = 'E' then
           vDadosIni.GravaAuditoria('CXG044', 'ALTERAÇÃO NÃO CONFIRMADA', 'FALHA', 'DEPART_CT',
            dataSet.FieldByName('COD_DEP').AsString, buscas)
        else
           vDadosIni.GravaAuditoria('CXG044', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'DEPART_CT',
            dataSet.FieldByName('COD_DEP').AsString, buscas);
     end;
     Refresh;

  Except
     on e: Exception do
     begin
        Result := false;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;

end;

{ TDadosDre }

function TDadosDre.abreDadosDre: Boolean;
begin
   Result := montaSelect('Select * from Dados_Dre where Ativo = 1');
end;

constructor TDadosDre.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsDadosDre);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

{ TRateioDpto }

function TRateioDpto.abreRateioDpto (cod:string): Boolean;
begin
   Result := montaSelect('Select * from Rel_Depto where cod_dep = '+ cod +'');
end;

function TRateioDpto.cancel: boolean;
begin
   if (dataSet.State in [dsEdit, dsInsert] )then
   begin
      dataSet.Cancel;
      RollBackTransacao;
      result:= true;
   end;
end;

constructor TRateioDpto.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsRateioDpto );
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TRateioDpto.delete: boolean;
begin
   if dataSet.IsEmpty then
      exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
   'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      dataSet.Delete;
      if Apply then
         if CommitaTransacao then
         result := true;
    end;
   Refresh;
end;

function TRateioDpto.edit: boolean;
begin
   if not dataSet.Active then
      result := montaSelect('Select * from Rel_Depto where 1 = 0');
   if inherited Edit then
      result := True;
end;

function TRateioDpto.insert: boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect('Select * from Rel_Depto where 1 = 0');
   if inherited Insert then
      result := true;
end;

function TRateioDpto.post(cod_dep : string) : boolean;
var
 statusDataset : string;
begin
  Try
     if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

     statusDataset := '';
     if dataSet.State = dsEdit then
        statusDataset := 'E'
     else
        statusDataset := 'I';

     if Trim (cod_dep) = '' then
        raise Exception.Create('Departamento de Origem não selecionado, verifique.')
     else
        dataSet.FieldByName('Cod_dep').AsString := cod_dep;

     if dataSet.State <> dsEdit then
     begin
        if VerificaRateioDpto(cod_dep , dataSet.FieldByName('COD_DEPRAT').AsString) then
           raise Exception.Create('Departamento de Destino já cadastrado para este Departamento.');

     end;

     if Trim (dataSet.FieldByName('Cod_Deprat').asString) = '' then
        raise Exception.Create('Campo Departamento Destino para Rateio não pode ser vazio.');
     if Trim (dataSet.FieldByName('Tprat').asString) = '' then
        raise Exception.Create('Campo Origem Tipo de Venda não pode ser vazio.');
     if Trim (dataSet.FieldByName('Ratem').asString) = '' then
        raise Exception.Create('Campo Tipos de Venda Destino do Rateio não pode ser vazio.');

     Result := inherited post;
     if dataSet.ChangeCount = 0 then
     begin
        result := true;
        exit;
     end;

     if Apply then
     begin
        if CommitaTransacao then
        begin
           result := True;

           if statusDataset = 'E' then
             vDadosIni.GravaAuditoria('CXG050', 'ALTERAÇÃO CONFIRMADA', 'SUCESSO', 'REL_DEPTO',
             'COD.ORIGEM:' + dataSet.FieldByName('COD_DEP').AsString + 'COD.DESTINO:' + dataSet.FieldByName('COD_DEPRAT').AsString , buscas)
           else
             vDadosIni.GravaAuditoria('CXG050', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'REL_DEPTO',
             'COD.ORIGEM:' + dataSet.FieldByName('COD_DEP').AsString + 'COD.DESTINO:' + dataSet.FieldByName('COD_DEPRAT').AsString , buscas)
        end;
     end
     else
     begin
        Result := False;
        Cancel;
        RollBackTransacao;

        if statusDataset = 'E' then
           vDadosIni.GravaAuditoria('CXG050', 'ALTERAÇÃO NÃO CONFIRMADA', 'FALHA', 'REL_DEPTO',
           'COD.ORIGEM:' + dataSet.FieldByName('COD_DEP').AsString + 'COD.DESTINO:' + dataSet.FieldByName('COD_DEPRAT').AsString , buscas)
        else
           vDadosIni.GravaAuditoria('CXG050', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'REL_DEPTO',
           'COD.ORIGEM:' + dataSet.FieldByName('COD_DEP').AsString + 'COD.DESTINO:' + dataSet.FieldByName('COD_DEPRAT').AsString , buscas)
     end;
     Refresh;

  Except
     on e: Exception do
     begin
        Result := false;
        Cancel;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;
end;

function TRateioDpto.VerificaRateioDpto (cod_dep,cod_destino : string) : Boolean;
begin
   Result := ExecutaComandosSql('Select * from Rel_Depto where Cod_Dep = '+ cod_dep +' and '+
                                'Cod_Deprat = '+ cod_destino +' ');
end;

{ TPContasMes }

function TPContasMes.abrePContasM: Boolean;
begin
  Result := montaSelect('Select * from P_Contas_M where codigo_emp = '+vDadosIni.codEmpresa+'');
end;

constructor TPContasMes.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsPContasM);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TPContasMes.insert: boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect('Select * from P_Contas_M where 1 = 0');
   if inherited Insert then
      result := true;
end;

function TPContasMes.post: boolean;
begin
  Try
     if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

     Result := inherited post;
     if dataSet.ChangeCount = 0 then
     begin
        result := true;
        exit;
     end;

     if Apply then
         result := True
     else
     begin
        Result := False;
        Cancel;
        RollBackTransacao;
     end;
     Refresh;

  Except
     on e: Exception do
     begin
        Result := false;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;

end;

{ TDptoDestino }

function TDptoDestino.abreDptoDestino: boolean;
begin
  Result := montaSelect('select * from depart_ct where tp_dep <> ''I'' ');
end;

constructor TDptoDestino.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsDptoDestino );
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

{ TEmpresa }

function TEmpresaPConta.abreEmpresa: boolean;
begin
  Result := montaSelect('Select * from Empresa where cod_empresa = '+vDadosIni.codEmpresa+'');
end;

constructor TEmpresaPConta.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsEmpresa );
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

{ TRateioContas }

function TRateioContas.abreRateioContas(pNConta: string) : Boolean;
var
  Cod : string;
begin
   vPContaOrigem := '';
   if trim(pNConta) <> '' then
     vPContaOrigem := pNConta
   else
     vPContaOrigem := ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString;

   if trim(pNConta) <> '' then
     Cod := StringReplace( pNConta, ',', '.', [rfReplaceAll])
   else
     Cod := StringReplace( ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString, ',', '.', [rfReplaceAll]);

   Result := montaSelect('Select * from Contas_Rel_Origem where n_conta_plc_or = '+ Cod + '' );
end;

function TRateioContas.cancel: boolean;
begin
   if (dataSet.State in [dsEdit, dsInsert] )then
   begin
      dataSet.Cancel;
      RollBackTransacao;
      result:= true;
   end;
end;

constructor TRateioContas.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsRateioContas );
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TRateioContas.delete: boolean;
begin
   if dataSet.IsEmpty then
      exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
   'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      dataSet.Delete;
      if Apply then
         if CommitaTransacao then
         result := true;
    end;
   Refresh;
end;

function TRateioContas.insert: boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect('Select * from Contas_Rel_Origem where 1 = 0');
   if inherited Insert then
      result := true;
end;

function TRateioContas.post: boolean;
begin
  Try
     if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

     if Trim (ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString) = '' then
        raise Exception.Create('Plano de Contas não selecionado , verifique.')
     else
        dataSet.FieldByName('N_Conta_Plc_Or').AsCurrency :=StrToCurr (vPContaOrigem);

     if Trim (dataSet.FieldByName('N_CONTA_PLC_VAL').asString) = '' then
        raise Exception.Create('Campo Nº. Conta Origem para Rateio não pode ser vazio.');
     if Trim (dataSet.FieldByName('N_CONTA_DEST').asString) = '' then
        raise Exception.Create('Campo Nº. Conta Destino para Rateio não pode ser vazio.');

     if VerificaContasVinculadas then
        raise Exception.Create('Conta de Valor já cadastrada para a conta selecionada.');


     Result := inherited post;
     if dataSet.ChangeCount = 0 then
     begin
        result := true;
        exit;
     end;       

     if Apply then
     begin
        if CommitaTransacao then
        begin
           result := True;
           vDadosIni.GravaAuditoria('CXG058', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'CONTAS_REL_ORIGEM',
           'PCONTA ORIGEM: '+dataSet.FieldByName('N_Conta_Plc_Or').AsString + ' - PCONTA ORIGEM RATEIO: '+dataSet.FieldByName('N_CONTA_PLC_VAL').asString , buscas);
        end;
     end
     else
     begin
        Result := False;
        Cancel;
        RollBackTransacao;
        vDadosIni.GravaAuditoria('CXG058', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'CONTAS_REL_ORIGEM',
        'PCONTA ORIGEM: '+dataSet.FieldByName('N_Conta_Plc_Or').AsString + ' - PCONTA ORIGEM RATEIO: '+dataSet.FieldByName('N_CONTA_PLC_VAL').asString , buscas);
     end;
     Refresh;
  Except
     on e: Exception do
     begin
        Result := false;
        Cancel;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;
end;

function TRateioContas.VerificaContasVinculadas: Boolean;
var
  cod : string;
begin

//  vPContaOrigem := StringReplace( vPContaOrigem , ',', '.', [rfReplaceAll]);
  cod := StringReplace( dataSet.FieldByName('N_CONTA_PLC_VAL').asString , ',', '.', [rfReplaceAll]);

  Result := ExecutaComandosSql('Select * from contas_rel_origem '+
                               'where n_conta_plc_or = cast('+vDadosIni.trocaVirgulaPorPonto(vPContaOrigem) +' as double precision)'+
                               ' and n_conta_plc_val = cast('+ cod +' as double precision)');
end;

{ THistPContas }

function THistPContas.abreEscolhaHistoricoPadrao(pConta: Double): boolean;
begin
  Result := false;
  
  buscas.Close;
  buscas.SQL.Text := 'select historico from historico_p_contas' +
                     ' where numero_conta = :numero_conta and ativo = 1';
  buscas.ParamByName('numero_conta').AsFloat := pConta;
  buscas.Open;

  if buscas.IsEmpty then
    exit;

  Application.CreateForm(TfrmEscolhaHistoricoPadrao, frmEscolhaHistoricoPadrao);

  frmEscolhaHistoricoPadrao.DBGrid1.DataSource := DtmCadBasicosCx.dsBuscas;
  frmEscolhaHistoricoPadrao.DBGrid1.Columns[0].FieldName := 'HISTORICO';
  frmEscolhaHistoricoPadrao.DBGrid1.Columns[0].Title.Caption := 'Histórico';
  
  if frmEscolhaHistoricoPadrao.showmodal = IDOK then
  begin
    vDadosIni.vPesquisa := Trim(buscas.FieldByName('historico').AsString);
    Result := Trim(vDadosIni.vPesquisa) <> '';
  end;

  buscas.Close;
end;

function THistPContas.abreHistPContas(pNConta: string): Boolean;
var
  cod :string;
begin
   if trim(pNConta) <> '' then
     cod := StringReplace( pNConta , ',', '.', [rfReplaceAll])
   else
     cod := StringReplace( ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString , ',', '.', [rfReplaceAll]);

   Result := montaSelect('Select * from Historico_P_Contas where Numero_Conta = cast('+ cod +' as double precision)');
end;

function THistPContas.cancel: boolean;
begin
   if (dataSet.State in [dsEdit, dsInsert] )then
   begin
      dataSet.Cancel;
      RollBackTransacao;
      result:= true;
   end;
end;

constructor THistPContas.create;
begin
  if DtmCadBasicosCx = nil then
    DtmCadBasicosCx := TDtmCadBasicosCx.Create(DtmCadBasicosCx);
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsHistPContas );
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function THistPContas.delete: boolean;
begin
   if dataSet.IsEmpty then
      exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
   'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      dataSet.Delete;
      if Apply then
         if CommitaTransacao then
         result := true;
    end;
   Refresh;
end;

function THistPContas.insert: boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect('Select * from Historico_P_Contas where 1 = 0');
   if inherited Insert then
      result := true;
end;

function THistPContas.post: boolean;
var
 statusDataset : string;
begin
  Try
     if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

     statusDataset := '';
     if dataSet.State = dsEdit then
        statusDataset := 'E'
     else
        statusDataset := 'I';

     if Trim (dataSet.FieldByName('Historico').asString) = '' then
        raise Exception.Create('Campo Histórico Padrão da Conta não pode ser vazio.');       

     Result := inherited post;
     if dataSet.ChangeCount = 0 then
     begin
        result := true;
        exit;
     end;

     if Apply then
     begin
        if CommitaTransacao then
        begin
           result := True;

           if statusDataset = 'E' then
             vDadosIni.GravaAuditoria('CXG065', 'ALTERAÇÃO CONFIRMADA', 'SUCESSO', 'HISTORICO_P_CONTAS',
             dataSet.FieldByName('Numero_Conta').AsString , buscas)
           else
             vDadosIni.GravaAuditoria('CXG065', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'HISTORICO_P_CONTAS',
             dataSet.FieldByName('Numero_Conta').AsString , buscas)
        end;
     end
     else
     begin
        Result := False;
        Cancel;
        RollBackTransacao;

        if statusDataset = 'E' then
           vDadosIni.GravaAuditoria('CXG065', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'HISTORICO_P_CONTAS',
           dataSet.FieldByName('Numero_Conta').AsString , buscas)
        else
           vDadosIni.GravaAuditoria('CXG065', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'HISTORICO_P_CONTAS',
           dataSet.FieldByName('Numero_Conta').AsString , buscas)
     end;
     Refresh;

  Except
     on e: Exception do
     begin

        Result := false;

        if statusDataset = 'E' then
           vDadosIni.GravaAuditoria('CXG065', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'HISTORICO_P_CONTAS',
           dataSet.FieldByName('Numero_Conta').AsString , buscas)
        else
           vDadosIni.GravaAuditoria('CXG065', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'HISTORICO_P_CONTAS',
           dataSet.FieldByName('Numero_Conta').AsString , buscas);

        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
        Application.MessageBox( 'Você está tentando alterar um registro para um valor de registro já existente ou tentando inserir um registro que já existe','Atenção',MB_ICONERROR + MB_OK);
     end;
  end;
end;

{ TPContasBalanco }

function TPContasBalanco.abrePContasBalanco: Boolean;
var
   cod : string;
begin
   cod := StringReplace( ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString , ',', '.', [rfReplaceAll]);
   if trim(cod) = '' then
   	cod := '0';

   Result := montaSelect(' select p.*, d.tipo_balanco, d.codigo_int_bal, d.desc_balanco,' +
      ' d.subtipo, d.sinal, d.prazoinicial, d.prazofinal, emp.identificacao_emp from p_contas_balanco p ' +
      ' inner join empresa emp on emp.cod_empresa = p.cod_empresa ' +
   	' inner join dados_balanco d on d.codseq_balanco = p.codseq_balanco ' +
      ' where p.n_conta_plc = cast('+ cod +' as double precision) ' +
      ' and p.cod_empresa = '+ vDadosIni.codEmpresa + ' and p.ativo = 1 ' +
      ' order by codseq_balanco ');
end;

constructor TPContasBalanco.create;
begin
   dataSet := TClientDataSet(dtmcadbasicoscx.cdsPContasBalanco);
   buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
   transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TPContasBalanco.delete: boolean;
var
  vNumConta, vCodSeqBal: string;	
begin
   if dataSet.IsEmpty then
      exit;

   if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
   'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      vNumConta := dataSet.FieldByName('n_conta_plc').AsString;
      vCodSeqBal := dataSet.FieldByName('codseq_balanco').AsString;
      dataSet.Delete;

      if vComitar then
      begin
        if Apply then
        begin
           if CommitaTransacao then
           result := true;

           vDadosIni.GravaAuditoria('CXG069', 'EXCLUSAO CONFIRMADA', 'SUCESSO', 'CONTROLES',
            'NUM.CONTA: ' + vNumConta + 'COD.BALANCO: '+ vCodSeqBal + '' , buscas);
        end;
      end;
    end;
   Refresh;
end;

function TPContasBalanco.insert: boolean;
begin
   result := false;
   if not dataSet.Active then
      result := montaSelect('select p.*, d.tipo_balanco, d.codigo_int_bal, d.desc_balanco,' +
      ' d.subtipo, d.sinal, d.prazoinicial, d.prazofinal, emp.identificacao_emp from p_contas_balanco p ' +
      ' inner join empresa emp on emp.cod_empresa = p.cod_empresa ' +
   	' inner join dados_balanco d on d.codseq_balanco = p.codseq_balanco ' +
      ' where 1 = 0 and p.cod_empresa = '+vDadosIni.codEmpresa);
   if inherited Insert then
      result := true;
end;

function TPContasBalanco.post(cod_balanco :string) : boolean;
begin
  Try
     if not (dataSet.state in [dsedit,dsinsert]) then
        exit;

     if ObPConta.VerificaPContasBalanco then
     begin
       Application.MessageBox('Sequência de Balanço já existe para esta Conta','Atenção', MB_ICONINFORMATION + MB_OK );
       Cancel;
       Exit;
     end;

     dataSet.FieldByName('N_CONTA_PLC').AsString := vDadosIni.IfThen(trim(ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString) = '', '0', ObPConta.dataSet.FieldByName('N_Conta_Plc').AsString);
     dataSet.FieldByName('CODSEQ_BALANCO').AsString := cod_balanco;
     dataSet.FieldByName('Cod_Empresa').AsString := vDadosIni.codEmpresa;
   
     Result := inherited post;

     if dataSet.ChangeCount = 0 then
     begin
        result := true;
        exit;
     end;

     if not vComitar then
     begin
       vDadosIni.GravaAuditoria('CXG070', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'P_CONTAS_BALANCO',
       dataSet.FieldByName('N_CONTA_PLC').AsString , buscas);
       if ObPConta.dataSet.State = dsEdit then
       begin
         vChangeCount := 1;
       	Apply;
       end;
       Result := true;
     end
     else
     begin
       if Apply then
       begin
          if CommitaTransacao then
          begin
             result := True;
             vDadosIni.GravaAuditoria('CXG070', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'P_CONTAS_BALANCO',
             dataSet.FieldByName('N_CONTA_PLC').AsString , buscas)
          end;
       end
       else
       begin
          Result := False;
          Cancel;
          RollBackTransacao;
          vDadosIni.GravaAuditoria('CXG070', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'P_CONTAS_BALANCO',
          dataSet.FieldByName('N_CONTA_PLC').AsString , buscas)
       end;
     end;

     Refresh;
  Except
     on e: Exception do
     begin
        Result := false;
        Cancel;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;
end;

{ TAdministradoraCartao }

constructor TAdministradoraCartao.create;
begin
	dataset := TClientDataSet(DtmCadBasicosCx.cdsAdmCartao);
  transacao := TIBTransaction(DtmCadBasicosCx.IBTransBoletos);
  buscas := TIBQuery(DtmCadBasicosCx.qrBuscas);

  vAdquirenteCartao := TAdquirenteCartao.create;
  vTermCartao := TTerminalCartao.create;
end;

function TAdministradoraCartao.delete: Boolean;
var
  codAdm: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codAdm := dataSet.FieldByName('COD_ADM').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('CXG078', 'EXCLUIR', 'COD ADM ' + dataSet.FieldByName('COD_ADM').AsString, 'ADM_CARTAO',
      dataSet.FieldByName('COD_ADM').AsString, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

		if ExecutaComandosSql('select first 1 cod_term_adm from terminal_cartao' +
      ' where cod_adm = ' + IntToStr(dataSet.FieldByName('COD_ADM').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('Administradora de Cartão não pode ser excluída pois possui 1 ou mais terminais de cartão vinculados a ela',
        'Atenção', 0 + 64);
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from adm_cartao where cod_adm = ' + IntToStr(dataSet.FieldByName('COD_ADM').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('CXG078', 'EXCLUIR', 'SUCESSO', 'ADM_CARTAO', codAdm, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CXG078', 'EXCLUIR', 'FALHA', 'ADM_CARTAO', codAdm, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CXG077', 'LIXEIRA', 'SUCESSO', 'ADM_CARTAO', codAdm, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CXG077', 'LIXEIRA', 'FALHA', 'ADM_CARTAO', codAdm, buscas);
  end;
  Result := true;
  Refresh;
end;

destructor TAdministradoraCartao.Destroy;
begin
	vAdquirenteCartao.Free;
  vAdquirenteCartao := nil;

	vTermCartao.Free;
  vTermCartao := nil;
end;

function TAdministradoraCartao.edit: Boolean;
begin
 Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('CXG076', 'ALTERAR', '', 'ADM_CARTAO', dataSet.FieldByName('COD_ADM').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
  	Result := True;
    if dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').IsNull then
	    dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString := 'C';
    if dataSet.FieldByName('CAMPO_NSU_OBRIG').IsNull then
	    dataSet.FieldByName('CAMPO_NSU_OBRIG').AsString := 'S';
    if dataSet.FieldByName('CAMPO_NUM_AUT_OBRIG').IsNull then
	    dataSet.FieldByName('CAMPO_NUM_AUT_OBRIG').AsString := 'S';

    vAdquirenteCartao._abreAdquirenteCartao;
  end;
end;

function TAdministradoraCartao.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('CXG075', 'INCLUIR', '', 'ADM_CARTAO', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select adm_cartao.* from adm_cartao' +
      ' where adm_cartao.cod_adm = 0 and adm_cartao.cod_empresa = 0');

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString := 'C';
    dataSet.FieldByName('CAMPO_NSU_OBRIG').AsString := 'S';
    dataSet.FieldByName('CAMPO_NUM_AUT_OBRIG').AsString := 'S';

    vAdquirenteCartao._abreAdquirenteCartao;
  end;
end;

function TAdministradoraCartao.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('CXG080', 'SALVAR', '', 'ADM_CARTAO', dataSet.FieldByName('COD_ADM').AsString, buscas, False) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('DESCRICAO_ADM').AsString) = '' then
      raiseExceptionCreate('Descrição não informada', 'DBEdit2');

//    if vDadosIni.vConcCartao.vHabilitarConcCartaoAPI then
//    begin
//      if dataSet.FieldByName('COD_ADQUIRENTE').AsString = '' then
//        raiseExceptionCreate('Código adquirente não informado', 'DBEdit11');
//    end
//    else
    if not vDadosIni.vConcCartao.vHabilitarConcCartaoAPI then
    begin
      if dataSet.FieldByName('NUM_ESTAB_ADM').AsString = '' then
        raiseExceptionCreate('Número estabelecimento não informado', 'DBEdit3');

      if dataSet.FieldByName('END_ARQUIVO_ADM').AsString = '' then
        raiseExceptionCreate('Endereço arquivo Administradora não informado', 'DBEdit4');
    end;

    if dataSet.FieldByName('COD_CLIENTE').AsString = '' then
       raiseExceptionCreate('Cliente não informado', 'DBEdit8');

		if dataSet.FieldByName('COD_CLIENTE').AsString <> '' then
			if not _existeCliente(dataSet.FieldByName('COD_CLIENTE').AsString) then
        raiseExceptionCreate('Cliente não encontrado no cadastro!', 'DBEdit8');

    if vDadosIni.vConcCartao.vHabilitarConcCartaoAPI then
    begin
    	dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString := 'B';
      dataSet.FieldByName('CAMPO_NSU_OBRIG').AsString := 'S';
      dataSet.FieldByName('CAMPO_NUM_AUT_OBRIG').AsString := 'S';
    end
    else
    begin
      if dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString = '' then
        raiseExceptionCreate('Campo "Definir taxa do cartão por" não informado!', 'DBComboBoxTaxaPorCtrlBandeira');

      if (dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString <> 'C')
        and (dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString <> 'B') then
          raiseExceptionCreate('Campo "Definir taxa do cartão por" informado incorretamente!', 'DBComboBoxTaxaPorCtrlBandeira');

      if (dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString = 'C') then
      begin
        dataSet.FieldByName('CAMPO_NSU_OBRIG').AsString := 'S';
	      dataSet.FieldByName('CAMPO_NUM_AUT_OBRIG').AsString := 'S';
      end;

      if (dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString <> 'C') then
      begin
        if trim(dataSet.FieldByName('CAMPO_NSU_OBRIG').AsString) = '' then
          raiseExceptionCreate('Campo "Num Doc/NSU/CV obrigatório" não informado!', 'DBComboBoxNSUobrig');

        if trim(dataSet.FieldByName('CAMPO_NUM_AUT_OBRIG').AsString) = '' then
          raiseExceptionCreate('Campo "Num Autorização obrigatório" não informado!', 'DBComboBoxNumAutObrig');
      end;
    end;

    if dataSet.State = dsInsert then
      dataSet.FieldByName('COD_ADM').AsInteger := Gencodigo('ADM_CARTAO', DtmCadBasicosCx.SpIncCodigo,vDadosIni.codEmpresa);

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CXG080', acao, 'SUCESSO', 'ADM_CARTAO', dataSet.FieldByName('COD_ADM').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CXG080', acao, 'FALHA', 'ADM_CARTAO', dataSet.FieldByName('COD_ADM').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TAdministradoraCartao._abreClientes: boolean;
begin
  if LClientes = nil then
    LClientes := TListaCliente.create;
  LClientes.buscas.Close;
  LClientes.buscas.SQL.Text :=
    'select * from clientes' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
  LClientes.buscas.Open;
end;

function TAdministradoraCartao._abreTodos: Boolean;
begin
  Result := montaSelect('select adm_cartao.* from adm_cartao' +
      ' where adm_cartao.cod_empresa = ' + vDadosIni.codEmpresa + ' and adm_cartao.ativo = 1');
end;

procedure TAdministradoraCartao._cadAdmCartao(pTipoForm: integer);
begin
	vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Administradora de cartão');
  if DtmCadBasicosCx = nil then
    DtmCadBasicosCx := TDtmCadBasicosCx.Create(DtmCadBasicosCx);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('OCR019', 'CONSULTA', '', 'VEICULOS_TRANSPORTE', '',
    DtmCadBasicosCx.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadAdmCartao = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadAdmCartao, frmCadAdmCartao );
  end;

  if (pTipoForm > 0) and (not frmCadAdmCartao.Visible) then
    frmCadAdmCartao.ShowModal
  else if (not frmCadAdmCartao.Visible) then
    frmCadAdmCartao.Show
  else if frmCadAdmCartao.FormStyle = fsMDIChild then
    frmCadAdmCartao.Show
  else
    frmCadAdmCartao.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

function TAdministradoraCartao._existeCliente(pCodCliente: string): boolean;
begin
	Result := ExecutaComandosSql('Select cod_cliente from clientes where ativo = 1 and cod_cliente = '+ pCodCliente +' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TAdministradoraCartao._lixeiraVazia: Boolean;
begin
 Result := not ExecutaComandosSql('Select first 1 cod_adm from adm_cartao' +
    ' where cod_adm > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TAdministradoraCartao._restaurarRegistroDaLixeira: Boolean;
begin
 if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('CXG079', 'RESTAURAR', 'COD ADM ' + dataSet.FieldByName('COD_ADM').AsString, 'ADM_CARTAO',
    dataSet.FieldByName('COD_ADM').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CXG079', 'RESTAURAR', 'SUCESSO', 'ADM_CARTAO', dataSet.FieldByName('COD_ADM').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CXG079', 'RESTAURAR', 'FALHA', 'ADM_CARTAO', dataSet.FieldByName('COD_ADM').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TAdministradoraCartao._verLixeira: Boolean;
begin
  Result := False;
	 if not vDadosIni.PesqPros('CXG081', 'VER LIXEIRA', '', 'ADM_CARTAO', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select adm_cartao.* from adm_cartao' +
    ' where adm_cartao.cod_empresa = ' + vDadosIni.codEmpresa + ' and adm_cartao.ativo = 0');
  Result := not dataSet.IsEmpty;
end;

{ TTerminalCartao }

function TTerminalCartao.abreFormTermCartao(pCodAdm: string): boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('CXG082', 'ABRIR', '', 'TERMINAL_CARTAO', '', buscas, true) then
    Exit;
  abreOuAtualizaTerminalCartao(pCodAdm);
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.ShowHint := True;
    formulario.Caption :=
      'Terminal Cartão';
    frmCadAdmCartao.pnTerminalCartao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    result := (formulario.ShowModal = IDOK);
  finally
    frmCadAdmCartao.pnTerminalCartao.Parent := frmCadAdmCartao.tsTerminalCartao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TTerminalCartao.abreOuAtualizaTerminalCartao(pCodAdm: string): boolean;
begin
	FCodAdm := 0;
  if pCodAdm = '0' then
    Result :=
      montaSelect('select * from TERMINAL_CARTAO where ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa)
  else
  begin
    Result :=
      montaSelect('select * from TERMINAL_CARTAO where ativo = 1' +
      ' and COD_ADM = ' + pCodAdm + ' and cod_empresa = ' + vDadosIni.codEmpresa);
    try
      FCodAdm := StrToInt(pCodAdm);
    except
    end;
  end;
end;

function TTerminalCartao.abreTerminalCartao: boolean;
begin
  Result := montaSelect('select tc.*, ac.descricao_adm from terminal_cartao tc' +
    ' inner join adm_cartao ac on ac.cod_adm = tc.cod_adm and ac.cod_empresa = tc.cod_empresa and ac.ativo = 1' +
    ' where tc.cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TTerminalCartao.create;
begin
	dataset := TClientDataSet(DtmCadBasicosCx.cdsTerminalCartao);
  transacao := TIBTransaction(DtmCadBasicosCx.IBTransBoletos);
  buscas := TIBQuery(DtmCadBasicosCx.qrBuscas);
end;

function TTerminalCartao.delete: Boolean;
var
  codTerm: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codTerm := dataSet.FieldByName('COD_TERM_ADM').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('CXG086', 'EXCLUIR', 'COD TERM ADM ' + codTerm, 'TERMINAL_CARTAO', codTerm, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'delete from terminal_cartao where cod_term_adm = ' + codTerm + ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('CXG086', 'EXCLUIR', 'SUCESSO', 'TERMINAL_CARTAO', codTerm, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CXG086', 'EXCLUIR', 'FALHA', 'TERMINAL_CARTAO', codTerm, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CXG085', 'LIXEIRA', 'SUCESSO', 'TERMINAL_CARTAO', codTerm, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CXG085', 'LIXEIRA', 'FALHA', 'TERMINAL_CARTAO', codTerm, buscas);
  end;
  Result := true;
  Refresh;
end;

function TTerminalCartao.edit: Boolean;
begin
	Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('CXG084', 'ALTERAR', '', 'TERMINAL_CARTAO', dataSet.FieldByName('COD_TERM_ADM').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    Result := True;
  end;
end;

function TTerminalCartao.insert: Boolean;
begin
	Result := False;
  if not vDadosIni.PesqPros('CXG083', 'INCLUIR', '', 'TERMINAL_CARTAO', '', buscas, False) then
    Exit;

  if not dataSet.Active then
//    montaSelect('select tc.* from terminal_cartao tc '+
//		'inner join adm_cartao a on a.cod_adm = tc.cod_adm and a.cod_empresa = tc.cod_empresa '+
//		'where tc.cod_adm = 0 and tc.cod_empresa = 0');
  	abreOuAtualizaTerminalCartao('0');

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
		dataSet.FieldByName('cod_adm').AsInteger := FCodAdm;    
  end;
end;

function TTerminalCartao.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('CXG088', 'SALVAR', '', 'TERMINAL_CARTAO', dataSet.FieldByName('COD_TERM_ADM').AsString, buscas, False) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('COD_TERM_ADM').AsString) = '' then
      raiseExceptionCreate('Código não informado', 'DBEdit5');

    if Trim(dataSet.FieldByName('DESC_TERM_ADM').AsString) = '' then
      raiseExceptionCreate('Descrição não informada', 'DBEdit6');

    if Trim(dataSet.FieldByName('tipo').AsString) <> '' then
      if not vDadosIni.strEstaContidoEm(Trim(dataSet.FieldByName('tipo').AsString), ['D', 'P']) then
        raiseExceptionCreate('Tipo inválido. Informe D ou P', 'DBComboBox1');

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CXG088', acao, 'SUCESSO', 'TERMINAL_CARTAO', dataSet.FieldByName('COD_TERM_ADM').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CXG088', acao, 'FALHA', 'TERMINAL_CARTAO', dataSet.FieldByName('COD_TERM_ADM').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TTerminalCartao._lixeiraVazia: Boolean;
begin
	Result := not ExecutaComandosSql('Select first 1 cod_term_adm from terminal_cartao' +
    ' where cod_term_adm > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TTerminalCartao._restaurarRegistroDaLixeira: Boolean;
begin
	if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('CXG087', 'RESTAURAR', 'COD TERM ADM ' + dataSet.FieldByName('COD_TERM_ADM').AsString, 'TERMINAL_CARTAO',
    dataSet.FieldByName('COD_TERM_ADM').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CXG087', 'RESTAURAR', 'SUCESSO', 'TERMINAL_CARTAO', dataSet.FieldByName('COD_TERM_ADM').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CXG087', 'RESTAURAR', 'FALHA', 'TERMINAL_CARTAO', dataSet.FieldByName('COD_TERM_ADM').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TTerminalCartao._verLixeira: Boolean;
begin
	Result := False;
	 if not vDadosIni.PesqPros('CXG089', 'VER LIXEIRA', '', 'TERMINAL_CARTAO', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select * from terminal_cartao' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 0 and cod_adm = ' + IntToStr(FCodAdm));
  Result := not dataSet.IsEmpty;
end;

{ TOcorrenciaAdm }

constructor TOcorrenciaAdm.create;
begin
  dataSet := TClientDataSet(DtmCadBasicosCx.cdsOcorrenciaAdm);
  transacao := TIBTransaction(DtmCadBasicosCx.IBTransBoletos);
  buscas := TIBQuery(DtmCadBasicosCx.qrBuscas);

  vPlContas := TPlanoContas.create(False);
  vPlContas.dataSet := TClientDataSet(DtmCadBasicosCx.cdsPlanoContasBusca);

  vPlContasSaida := TPlanoContas.create(False);
  vPlContasSaida.dataSet := TClientDataSet(DtmCadBasicosCx.cdsPlanoContasBuscaSaida);
end;

function TOcorrenciaAdm.delete: Boolean;
var
  codOcorr: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codOcorr := dataSet.FieldByName('ID_OCORR_ADM').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('CXG094', 'EXCLUIR', 'COD OCORR ' + codOcorr, 'OCORRENCIA_ADM',
      codOcorr, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'delete from ocorrencia_adm where ID_OCORR_ADM = ' + codOcorr;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('CXG094', 'EXCLUIR', 'SUCESSO', 'OCORRENCIA_ADM', codOcorr, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CXG094', 'EXCLUIR', 'FALHA', 'OCORRENCIA_ADM', codOcorr, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CXG093', 'LIXEIRA', 'SUCESSO', 'OCORRENCIA_ADM', codOcorr, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CXG093', 'LIXEIRA', 'FALHA', 'OCORRENCIA_ADM', codOcorr, buscas);
  end;
  Result := true;
  Refresh;
end;

destructor TOcorrenciaAdm.Destroy;
begin
	vPlContas.FSairDestroy := True;
  vPlContas.Free;
  vPlContas := nil;

  vPlContasSaida.FSairDestroy := True;
  vPlContasSaida.Free;
  vPlContasSaida := nil;
  inherited;
end;

function TOcorrenciaAdm.edit: Boolean;
begin
	Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('CXG092', 'ALTERAR', '', 'OCORRENCIA_ADM', dataSet.FieldByName('ID_OCORR_ADM').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    Result := True;
    vPlContas.abrePlanoContas('E');
    vPlContasSaida.abrePlanoContas('S');    
  end;
end;

function TOcorrenciaAdm.insert: Boolean;
begin
	Result := False;
  if not vDadosIni.PesqPros('CXG091', 'INCLUIR', '', 'OCORRENCIA_ADM', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select OCORRENCIA_ADM.*, pe.desc_plc as desc_plc_e, ps.desc_plc as desc_plc_s from ocorrencia_adm '+
		'left join p_contas pe on pe.n_conta_plc = OCORRENCIA_ADM.n_conta_plc_adm '+
		'left join p_contas ps on ps.n_conta_plc = OCORRENCIA_ADM.n_conta_plce_adm '+
		'where OCORRENCIA_ADM.id_ocorr_adm = 0');

  if inherited insert then
  begin
    Result := True;
    vPlContas.abrePlanoContas('E');
    vPlContasSaida.abrePlanoContas('S');    
  end;
end;

function TOcorrenciaAdm.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('CXG096', 'SALVAR', '', 'OCORRENCIA_ADM', dataSet.FieldByName('ID_OCORR_ADM').AsString, buscas, False) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('TIPO_TABELA_ADM').AsString) = '' then
      raiseExceptionCreate('Tipo Tabela não Informado', 'DBEdit2');

    if dataSet.FieldByName('IDTABELA_ADM').AsFloat <= 0 then
      raiseExceptionCreate('ID Tabela Adm não informado ou inválido', 'DBEdit3');

    if Trim(dataSet.FieldByName('DESC_OCORR_ADM').AsString) = '' then
      raiseExceptionCreate('Descrição não Informada', 'DBEdit4');

    if dataSet.FieldByName('N_CONTA_PLC_ADM').AsString <> '' then
      if not vPlContas.existePlanoContas(dataSet.FieldByName('N_CONTA_PLC_ADM').AsString, 'S') then
        raiseExceptionCreate('Conta de saida não encontrada no cadastro!', 'DBEdit5');

    if dataSet.FieldByName('N_CONTA_PLCE_ADM').AsString <> '' then
      if not vPlContas.existePlanoContas(dataSet.FieldByName('N_CONTA_PLCE_ADM').AsString, 'E') then
        raiseExceptionCreate('Conta de entrada não encontrada no cadastro!', 'DBEdit6');
        
    if dataSet.State = dsInsert then
      dataSet.FieldByName('ID_OCORR_ADM').AsInteger := Gencodigo('OCORRENCIA_ADM', DtmCadBasicosCx.SpIncCodigo,vDadosIni.codEmpresa);

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CXG096', acao, 'SUCESSO', 'OCORRENCIA_ADM', dataSet.FieldByName('ID_OCORR_ADM').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CXG096', acao, 'FALHA', 'OCORRENCIA_ADM', dataSet.FieldByName('ID_OCORR_ADM').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TOcorrenciaAdm._abreTodos: Boolean;
begin
  Result := montaSelect('select OCORRENCIA_ADM.*, pe.desc_plc as desc_plc_e, ps.desc_plc as desc_plc_s from ocorrencia_adm '+
		'left join p_contas pe on pe.n_conta_plc = OCORRENCIA_ADM.n_conta_plc_adm '+
		'left join p_contas ps on ps.n_conta_plc = OCORRENCIA_ADM.n_conta_plce_adm '+
    'where o.ativo = 1');
end;

procedure TOcorrenciaAdm._cadOcorrenciaAdm(pTipoForm: integer);
begin
	vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Ocorrencias Administradora');
  if DtmCadBasicosCx = nil then
    DtmCadBasicosCx := TDtmCadBasicosCx.Create(DtmCadBasicosCx);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('CXG090', 'CONSULTA', '', 'OCORRENCIA_ADM', '',
    DtmCadBasicosCx.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadOcorrenciaAdm = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadOcorrenciaAdm, frmCadOcorrenciaAdm);
  end;

  if (pTipoForm > 0) and (not frmCadOcorrenciaAdm.Visible) then
    frmCadOcorrenciaAdm.ShowModal
  else if (not frmCadOcorrenciaAdm.Visible) then
    frmCadOcorrenciaAdm.Show
  else if frmCadOcorrenciaAdm.FormStyle = fsMDIChild then
    frmCadOcorrenciaAdm.Show
  else
    frmCadOcorrenciaAdm.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

function TOcorrenciaAdm._existeOcorrencia(pCodOcorr: Integer): Boolean;
begin
	Result := ExecutaComandosSql('select ID_OCORR_ADM from ocorrencia_adm' +
    ' where ID_OCORR_ADM = ' + IntToStr(pCodOcorr) + ' and ativo = 1');
end;

function TOcorrenciaAdm._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 ID_OCORR_ADM from ocorrencia_adm' +
    ' where ID_OCORR_ADM > 0 and ativo = 0');
end;

function TOcorrenciaAdm._pesquisa(pCampo, pCondicao, pValor, pData1,
  pData2: string): Boolean;
var
  vSqlTemp, vOrdem: string;
begin
  vSqlTemp := '';

  if pCampo = 'Descrição Pl. Contas Saida' then
    vSqlTemp := 'ps.desc_plc '
  else if pCampo = 'Descrição Pl. Contas Entrada' then
    vSqlTemp := 'pe.desc_plc ';
  if vSqlTemp <> '' then
  begin
    if pCondicao = 'Igual' then
      pCondicao := '= '
    else if pCondicao = 'Maior' then
      pCondicao := '> '
    else if pCondicao = 'Maior ou Igual' then
      pCondicao := '>= '
    else if pCondicao = 'Menor' then
      pCondicao := '< '
    else if pCondicao = 'Menor ou Igual' then
      pCondicao := '<= '
    else if pCondicao = 'Diferente' then
      pCondicao := '<> '
    else if (pCondicao = 'Esta contido') then
      pCondicao := 'like'
    else if (pCondicao = 'Começa') then
      pCondicao := 'Começa'
    else
      pCondicao := '= ';

    if pCondicao = 'like' then
      vSqlTemp := vSqlTemp + pCondicao + QuotedStr('%' + pValor + '%')
    else if pCondicao = 'Começa' then
      vSqlTemp := vSqlTemp + 'like' + QuotedStr(pValor + '%')
    else
      vSqlTemp := vSqlTemp + pCondicao + QuotedStr(pValor);
    pValor := '';
  end;

  vOrdem := copy(dataSet.IndexName, 5, length(dataSet.IndexName));
  if Trim(vOrdem) = '' then
    vOrdem := 'ID_OCORR_ADM';

  if pValor <> '*D*A*T*A*' then
  begin
    Result := ConsultaCampos('OCORRENCIA_ADM', pValor, pCampo, pCondicao, vOrdem, True, vDadosIni.codEmpresa,
      'OCORRENCIA_ADM.*, PE.DESC_PLC DESC_PLC_E, PS.DESC_PLC DESC_PLC_S',
      ' LEFT JOIN P_CONTAS PE ON PE.N_CONTA_PLC = OCORRENCIA_ADM.N_CONTA_PLC_ADM'+
			' LEFT JOIN P_CONTAS PS ON PS.N_CONTA_PLC = OCORRENCIA_ADM.N_CONTA_PLCE_ADM', vSqlTemp);
  end
  else
    Result := ConsultaCampos('OCORRENCIA_ADM', pCampo, vOrdem, pData1, pData2, vDadosIni.codEmpresa, 1,
     'OCORRENCIA_ADM.*, PE.DESC_PLC DESC_PLC_E, PS.DESC_PLC DESC_PLC_S',
      ' LEFT JOIN P_CONTAS PE ON PE.N_CONTA_PLC = OCORRENCIA_ADM.N_CONTA_PLC_ADM'+
			' LEFT JOIN P_CONTAS PS ON PS.N_CONTA_PLC = OCORRENCIA_ADM.N_CONTA_PLCE_ADM', vSqlTemp);
end;

function TOcorrenciaAdm._restaurarRegistroDaLixeira: Boolean;
begin
 	if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('CXG095', 'RESTAURAR', 'COD OCORR ' + dataSet.FieldByName('ID_OCORR_ADM').AsString, 'OCORRENCIA_ADM',
    dataSet.FieldByName('ID_OCORR_ADM').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CXG095', 'RESTAURAR', 'SUCESSO', 'OCORRENCIA_ADM', dataSet.FieldByName('ID_OCORR_ADM').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CXG095', 'RESTAURAR', 'FALHA', 'OCORRENCIA_ADM', dataSet.FieldByName('ID_OCORR_ADM').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TOcorrenciaAdm._verLixeira: Boolean;
begin
	Result := False;
  if not vDadosIni.PesqPros('CXG097', 'VER LIXEIRA', '', 'OCORRENCIA_ADM', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select OCORRENCIA_ADM.*, pe.desc_plc as desc_plc_e, ps.desc_plc as desc_plc_s from ocorrencia_adm '+
		'left join p_contas pe on pe.n_conta_plc = OCORRENCIA_ADM.n_conta_plc_adm '+
		'left join p_contas ps on ps.n_conta_plc = OCORRENCIA_ADM.n_conta_plce_adm '+
		'where OCORRENCIA_ADM.ativo = 0');
  Result := not dataSet.IsEmpty;
end;

{ TListaCliente }

constructor TListaCliente.create;
begin
  transacao := TIBTransaction(DtmCadBasicosCx.IBTransBoletos);
  Buscas := TIBQuery(DtmCadBasicosCx.qrClientes);
end;

destructor TListaCliente.destroy;
begin
	Close;
  inherited;
end;

{ TBandeiras_Cartao }

function TBandeiras_Cartao.abrirBandeiras(ADaLixeira: Boolean): Boolean;
begin
  Result := montaSelect('select * from BANDEIRAS_CARTAO' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = ' + IntToStr(IfThen(not ADaLixeira, 1)));
end;

constructor TBandeiras_Cartao.create(ADataSet: TClientDataSet);
begin
  TableName := 'BANDEIRAS_CARTAO';
  if ADataSet <> nil then
    dataSet := ADataSet
  else
    dataSet := TClientDataSet(DtmCadBasicosCx.cdsbandCartao);

  if dataSet.Active then
    dataSet.Close;

  CreateDbComponents(dtmAtivo.bancoHw);
  dataSet.AfterScroll := DataSetAfterScroll;
end;

procedure TBandeiras_Cartao.DataSetAfterScroll(DataSet: TDataSet);
begin
  StrAuditoria := Self.dataSet.FieldByName('descricao').AsString;
  StrAuditoriaCod := Self.dataSet.FieldByName('cod_bandeira').AsString;
end;

function TBandeiras_Cartao.delete: boolean;
begin
  if dataSet.IsEmpty then
    raiseExceptionCreate('Nenhum registro encontrado', '');
  try
    if dataSet.FieldByName('ativo').AsInteger <> 0 then
    begin
      Result := enviarParaLixeira;
      Exit;
    end;

    if not vDadosIni.PesqPros('CXG104', 'EXCLUIR', StrAuditoria, TableName, StrAuditoriaCod, buscas) then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'select cod_bandeira from ADM_CARTAO_TAXAS_BANDEIRAS' +
      ' where cod_bandeira = ' + IntToStr(dataSet.FieldByName('cod_bandeira').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if (not buscas.IsEmpty) then
      raiseExceptionCreate('Bandeira selecionada não pode ser excluída. Já possui taxa(s) vinculada(s)', '');

    if vDadosIni.ShowConfirmacao('Deseja mesmo excluir o registro permanentemente?') <> IDYES then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'delete from BANDEIRAS_CARTAO' +
      ' where cod_bandeira = ' + IntToStr(dataSet.FieldByName('cod_bandeira').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('CXG104', 'SUCESSO', StrAuditoria, TableName, StrAuditoriaCod, buscas);

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TBandeiras_Cartao.delete ' + E.Message);
      vDadosIni.ShowErro('Erro ao excluir registro. Erro: ' + e.Message);
    end;
  end;
end;

destructor TBandeiras_Cartao.Destroy;
begin
  FreeDbComponents;
  inherited;
end;

function TBandeiras_Cartao.edit: Boolean;
begin
  if dataSet.IsEmpty then
    raiseExceptionCreate('Nenhum registro encontrado', '');

  if dataSet.FieldByName('ativo').AsInteger = 0 then
    vDadosIni.ShowAtencao('Registro está na lixeira', MB_ICONEXCLAMATION);

  if not vDadosIni.PesqPros('CXG102', 'ALTERAR', StrAuditoria, TableName, StrAuditoriaCod, buscas) then
    Exit;
  Result := inherited Edit;
end;

function TBandeiras_Cartao.enviarParaLixeira: Boolean;
begin
  try
    if dataSet.FieldByName('ativo').AsInteger = 0 then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'select cod_bandeira from ADM_CARTAO_TAXAS_BANDEIRAS' +
      ' where cod_bandeira = ' + IntToStr(dataSet.FieldByName('cod_bandeira').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if (not buscas.IsEmpty) then
      if vDadosIni.ShowConfirmacao('Bandeira selecionada já possui taxa vinculada. Continuar?') <> IDYES then
        Exit;

    if vDadosIni.ShowConfirmacao('Deseja mesmo enviar registro para lixeira?') <> IDYES then
      Exit;

    if not vDadosIni.PesqPros('CXG103', 'LIXEIRA', StrAuditoria, TableName, StrAuditoriaCod, buscas) then
      Exit;

    dataSet.Edit;
    dataSet.FieldByName('ativo').AsInteger := 0;
    dataSet.Post;

    if Apply then
    begin
      transacao.Commit;
      vDadosIni.PesqPros('CXG103', 'SUCESSO', StrAuditoria, TableName, StrAuditoriaCod, buscas)
    end
    else
    begin
      transacao.Rollback;
      vDadosIni.PesqPros('CXG103', 'FALHA', StrAuditoria, TableName, StrAuditoriaCod, buscas)
    end;


    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TBandeiras_Cartao.enviarParaLixeira ' + E.Message);
      vDadosIni.ShowErro('Erro ao enviar registro para lixeira. Erro: ' + e.Message);
    end;
  end;
end;

function TBandeiras_Cartao.insert: Boolean;
begin
  if not vDadosIni.PesqPros('CXG101', 'INCLUIR', '', TableName, '', buscas) then
    Exit;
  Result := inherited Insert;
end;

function TBandeiras_Cartao.post: Boolean;
begin
  try
    if (not (dataSet.state in [dsedit,dsinsert])) or (dataset.IsEmpty) then
      exit;

    if not vDadosIni.PesqPros('CXG105', 'SALVAR', StrAuditoria, TableName, StrAuditoriaCod, buscas) then
      Exit;

    checkFieldEmpty('DESCRICAO', 'Descrição da bandeira do cartão não informada', 'DBEdit10');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('cod_bandeira').AsInteger := Gencodigo('BANDEIRAS_CARTAO', buscas, vDadosIni.codEmpresa);
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    end;

    Result := inherited post;
    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
    begin
      CommitaTransacao;
      Result := True;

      vDadosIni.GravaAuditoria('CXG105', 'SALVAR', 'SUCESSO', TableName, StrAuditoriaCod, buscas);
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := False;

      vDadosIni.GravaAuditoria('CXG105', 'SALVAR', 'FALHA', TableName, '', buscas);
    end;
    Refresh;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TBandeiras_Cartao.post ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar registro. Erro: ' + e.Message);
    end;
  end;
end;

function TBandeiras_Cartao.restaurar: Boolean;
begin
  if dataSet.IsEmpty then
    raiseExceptionCreate('Nenhum registro encontrado', '');
  try
    if dataSet.FieldByName('ativo').AsInteger <> 0 then
      Exit;

    if vDadosIni.ShowConfirmacao('Deseja mesmo restaurar o registro?') <> IDYES then
      Exit;

    if not vDadosIni.PesqPros('CXG108', 'RESTAURAR', StrAuditoria, TableName, StrAuditoriaCod, buscas) then
      Exit;

    dataSet.Edit;
    dataSet.FieldByName('ativo').AsInteger := 1;
    dataSet.Post;

    if Apply then
    begin
      transacao.Commit;
      vDadosIni.GravaAuditoria('CXG104', 'SUCESSO', StrAuditoria, TableName, StrAuditoriaCod, buscas);
    end
    else
    begin
      transacao.Rollback;
      vDadosIni.GravaAuditoria('CXG104', 'FALHA', StrAuditoria, TableName, StrAuditoriaCod, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TBandeiras_Cartao.restaurar ' + E.Message);
      vDadosIni.ShowErro('Erro ao restaurar registro. Erro: ' + e.Message);
    end;
  end;
end;

{ TTaxas_Bandeiras }
{
constructor TTaxas_Bandeiras.create(ADataSet: TClientDataSet;
  AOwerAdm: TAdministradoraCartao; AOwerBandeira: TBandeiras_Cartao);
begin
  if ADataSet <> nil then
    dataSet := ADataSet
  else
    dataSet := TClientDataSet(DtmCadBasicosCx.cdsbandCartao);

  CreateDbComponents(dtmAtivo.bancoHw);

  if Assigned(AOwerAdm) then
    FOwerAdm := AOwerAdm;

  if Assigned(AOwerBandeira) then
    FOwerBandeira := AOwerBandeira;
end;
}
function TTaxas_Bandeiras.abrirTaxasCartao(ACodigoAdm,
  ACodigoBandeira: Integer): Boolean;
begin
  Result := montaSelect('select tx.*, ad.descricao_adm, bc.descricao descricao_band, bc.ativo ativob from ADM_CARTAO_TAXAS_BANDEIRAS tx' +
    ' left join ADM_CARTAO ad on ad.cod_adm = tx.cod_adm and ad.cod_empresa = tx.cod_empresa' +
    ' left join BANDEIRAS_CARTAO bc on bc.cod_bandeira = tx.cod_bandeira and bc.cod_empresa = tx.cod_empresa' +
    ' where tx.cod_empresa = ' + vDadosIni.codEmpresa +
    IfThen(ACodigoAdm > 0     , ' and tx.cod_adm = '      + IntToStr(ACodigoAdm)) +
    IfThen(ACodigoBandeira > 0, ' and tx.cod_bandeira = ' + IntToStr(ACodigoBandeira)) +
    ' order by ad.descricao_adm, bc.descricao, tx.debito_credito, tx.parcelas_de'
    );
end;

procedure TTaxas_Bandeiras.ConsultaAfterScroll(DataSet: TDataSet);
begin
  abrirTaxasCartao(
    FlkConsAdm.dataSet.FieldByName('cod_adm').AsInteger,
    FlkConsBand.dataSet.FieldByName('cod_bandeira').AsInteger);
end;

constructor TTaxas_Bandeiras.create(ADataSet: TClientDataSet; ACodigoAdm,
  ACodigoBandeira: Integer);
begin
  if ADataSet <> nil then
    dataSet := ADataSet
  else
    dataSet := TClientDataSet(DtmCadBasicosCx.cdsTxBandeiras);

  CreateDbComponents(dtmAtivo.bancoHw);
  dataSet.AfterScroll := DataSetAfterScroll;

  FlkAdministradora := TDadosLookUp_OOP.create;
  FlkBandeira       := TDadosLookUp_OOP.create;
  FlkDebCred        := TDadosLookUp_OOP.create;
  FlkConsAdm        := TDadosLookUp_OOP.create;
  FlkConsBand       := TDadosLookUp_OOP.create;
end;

procedure TTaxas_Bandeiras.DataSetAfterScroll(DataSet: TDataSet);
begin
  StrAuditoria := Trim(Self.dataSet.FieldByName('descricao_adm').AsString) + '-' +
                  Trim(Self.dataSet.FieldByName('descricao_band').AsString) + '-D/C:' +
                  Trim(Self.dataSet.FieldByName('debito_credito').AsString) + '-PARC:' +
                  Trim(Self.dataSet.FieldByName('parcelas_de').AsString) + '-ATE:' +
                  Trim(Self.dataSet.FieldByName('parcelas_ate').AsString);

  StrAuditoriaCod := Self.dataSet.FieldByName('cod_adm').AsString + '-' +
                     Self.dataSet.FieldByName('cod_bandeira').AsString + '-' +
                     Self.dataSet.FieldByName('seqid').AsString ;
end;

function TTaxas_Bandeiras.delete: Boolean;
begin
  if dataSet.IsEmpty then
    raiseExceptionCreate('Nenhum registro encontrado', '');
  try

    if not vDadosIni.PesqPros('CXG112', 'EXCLUIR', StrAuditoria, TableName, StrAuditoriaCod, buscas) then
      Exit;

    if vDadosIni.ShowConfirmacao('Deseja mesmo excluir o registro permanentemente?') <> IDYES then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'delete from ADM_CARTAO_TAXAS_BANDEIRAS' +
      ' where seqid = ' + IntToStr(dataSet.FieldByName('seqid').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('CXG112', 'SUCESSO', StrAuditoria, TableName, StrAuditoriaCod, buscas);

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TTaxas_Bandeiras.delete ' + E.Message);
      vDadosIni.ShowErro('Erro ao excluir registro. Erro: ' + e.Message);
    end;
  end;
end;

destructor TTaxas_Bandeiras.Destroy;
begin
  FreeDbComponents;
  FreeAndNil(FlkAdministradora);
  FreeAndNil(FlkBandeira);
  FreeAndNil(FlkDebCred);
  FreeAndNil(FlkConsAdm);
  FreeAndNil(FlkConsBand);
  inherited;
end;

function TTaxas_Bandeiras.edit: Boolean;
begin
  if dataSet.IsEmpty then
    raiseExceptionCreate('Nenhum registro encontrado', '');

  if not vDadosIni.PesqPros('CXG111', 'ALTERAR', StrAuditoria, TableName, StrAuditoriaCod, buscas) then
    Exit;
  Result := inherited Edit;
end;

function TTaxas_Bandeiras.insert: Boolean;
var
//  AEmpty: Boolean;
  ABandeira, AAdm, AParcDe: Integer;
  ACD: string;
begin
  if not vDadosIni.PesqPros('CXG110', 'INCLUIR', '', TableName, '', buscas) then
    Exit;

  if dataSet.IsEmpty then
  begin
    ABandeira := lkBandeira.dataSet.FieldByName('cod_bandeira').AsInteger;
    AAdm      := lkAdministradora.dataSet.FieldByName('cod_adm').AsInteger;
    ACD       := 'C';
    AParcDe   := 1; 
  end
  else
  begin
    ABandeira := dataSet.FieldByName('cod_bandeira').AsInteger;
    AAdm      := dataSet.FieldByName('cod_adm').AsInteger;
    ACD       := dataSet.FieldByName('debito_credito').AsString;

    buscas.Close;
    buscas.SQL.Text := 'select max(parcelas_ate) parcelas_ate from ADM_CARTAO_TAXAS_BANDEIRAS' +
      ' where cod_bandeira = ' + IntToStr(ABandeira) +
      ' and cod_adm = ' + IntToStr(AAdm) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and debito_credito = ' + QuotedStr(ACD);
    buscas.Open;

    AParcDe   := buscas.FieldByName('parcelas_ate').AsInteger + 1;
  end;

  Result := inherited Insert;
  if Result then
  begin
    dataSet.FieldByName('cod_bandeira').AsInteger  := ABandeira;
    dataSet.FieldByName('cod_adm').AsInteger       := AAdm;
    dataSet.FieldByName('debito_credito').AsString := ACD;
    dataSet.FieldByName('parcelas_de').AsInteger   := AParcDe;
  end;
end;

function TTaxas_Bandeiras.post: Boolean;
begin
  try
    if (not (dataSet.state in [dsedit,dsinsert])) or (dataset.IsEmpty) then
      exit;

    if not vDadosIni.PesqPros('CXG113', 'SALVAR', StrAuditoria, TableName, StrAuditoriaCod, buscas) then
      Exit;

    checkFieldEmpty('COD_BANDEIRA'  , 'Bandeira do cartão não informada', 'DBLookupComboBox1');
    checkFieldEmpty('COD_ADM'       , 'Administradora do cartão não informada', 'DBLookupComboBox2');
    checkFieldEmpty('DEBITO_CREDITO', 'Informe se a taxa é para operações de Débito ou Crédito', 'DBLookupComboBox3');
    if dataSet.FieldByName('DEBITO_CREDITO').AsString = 'C' then
	    checkFieldEmpty('PARCELAS_DE'   , 'Informe a partir de qual quantidade de parcelas a taxa será aplicada', 'DBEdit12');
    if dataSet.FieldByName('DEBITO_CREDITO').AsString = 'C' then
	    checkFieldEmpty('PARCELAS_ATE'  , 'Informe até qual quantidade de parcelas a taxa será aplicada', 'DBEdit13');
    checkFieldEmpty('TAXA'          , 'Informe a taxa a ser aplicada. Dever ser maior que zero', 'DBEdit14');

    if dataSet.FieldByName('DEBITO_CREDITO').AsString <> 'C' then
    begin
      dataSet.FieldByName('PARCELAS_DE').Value := null;
      dataSet.FieldByName('PARCELAS_ATE').Value := null;
    end;

    if dataSet.FieldByName('DEBITO_CREDITO').AsString = 'C' then
      if dataSet.FieldByName('PARCELAS_DE').AsInteger > dataSet.FieldByName('PARCELAS_ATE').AsInteger then
        raiseExceptionCreate('O intervalo de "Parcelas" está incorreto. O campo "De" não pode ser maior que o campo "Até"', 'DBEdit12');

    if dataSet.FieldByName('DEBITO_CREDITO').AsString = 'C' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select * from ADM_CARTAO_TAXAS_BANDEIRAS' +
        ' where cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_bandeira = ' + IntToStr(dataSet.FieldByName('cod_bandeira').AsInteger) +
        ' and cod_adm = ' + IntToStr(dataSet.FieldByName('cod_adm').AsInteger) +
        ' and debito_credito = ''C'' ' +
        ' and :parcelas >= parcelas_de' +
        ' and :parcelas <= parcelas_ate' +
        ' and seqid <> ' + IntToStr(dataSet.FieldByName('seqid').AsInteger);
      buscas.ParamByName('parcelas').AsInteger := dataSet.FieldByName('parcelas_de').AsInteger;
      buscas.Open;
      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe uma taxa cadastrada para esta Administradora e bandeira no intervalo informado', 'DBEdit12');

      buscas.Close;
      buscas.ParamByName('parcelas').AsInteger := dataSet.FieldByName('parcelas_ate').AsInteger;
      buscas.Open;
      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe uma taxa cadastrada para esta Administradora e bandeira no intervalo informado', 'DBEdit12');
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select * from ADM_CARTAO_TAXAS_BANDEIRAS' +
        ' where cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_bandeira = ' + IntToStr(dataSet.FieldByName('cod_bandeira').AsInteger) +
        ' and cod_adm = ' + IntToStr(dataSet.FieldByName('cod_adm').AsInteger) +
        ' and debito_credito = ''D'' ' +
        ' and seqid <> ' + IntToStr(dataSet.FieldByName('seqid').AsInteger);
      buscas.Open;
      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe uma taxa cadastrada para esta Administradora e bandeira', 'DBLookupComboBox3');
    end;

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      dataSet.FieldByName('seqid').AsInteger := Gencodigo('ADM_CARTAO_TAXAS_BANDEIRAS', buscas, vDadosIni.codEmpresa);
    end;

    Result := inherited post;
    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
    begin
      CommitaTransacao;
      Result := True;

      vDadosIni.PesqPros('CXG113', 'SUCESSO', StrAuditoria, TableName, StrAuditoriaCod, buscas);
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := False;

      vDadosIni.PesqPros('CXG113', 'FALHA', StrAuditoria, TableName, StrAuditoriaCod, buscas);
    end;
    Refresh;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TTaxas_Cartao.post ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar registro. Erro: ' + e.Message);
    end;
  end;
end;

{ TAdquirenteCartao }

constructor TAdquirenteCartao.create;
begin
	dataset := TClientDataSet(DtmCadBasicosCx.cdsConciliacaoAdquirente);
  transacao := TIBTransaction(DtmCadBasicosCx.IBTransBoletos);
  buscas := TIBQuery(DtmCadBasicosCx.qrBuscas);
end;

function TAdquirenteCartao._abreAdquirenteCartao: Boolean;
begin
	Result := montaSelect(' SELECT CONCILIACAO_ADQUIRENTE.* FROM CONCILIACAO_ADQUIRENTE ' +
      ' WHERE CONCILIACAO_ADQUIRENTE.ATIVO = 1 ');
end;

{ TRoteamentoRedesAdm }

procedure TRoteamentoRedesAdm.Abrir;
begin
  ClientOpen('select ar.rede, a.descricao_adm adm, ar.debcred, ar.cod_adm, ar.tband from adm_cartao_redes ar' +
             ' left join adm_cartao a on a.cod_adm = ar.cod_adm and a.cod_empresa = ar.cod_empresa' +
             ' where ar.cod_empresa = %d order by ar.rede', [vDadosIni.cod_empresa]);
  dataSet.FieldByName('tband').OnGetText := dataSetGetText;
  dataSet.FieldByName('tband').Alignment := taLeftJustify;
end;

constructor TRoteamentoRedesAdm.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  FAdm := TDataSet_OOP.Create(dtmAtivo.bancoHw, Self.transacao);
end;

procedure TRoteamentoRedesAdm.dataSetGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsString = '1' then
    Text := '01 - Visa'
  else if Sender.AsString = '2' then
    Text := '02 - Mastercard'
  else if Sender.AsString = '3' then
    Text := '03 - American Express'
  else if Sender.AsString = '4' then
    Text := '04 - Sorocred'
  else if Sender.AsString = '5' then
    Text := '05 - Diners Club'
  else if Sender.AsString = '6' then
    Text := '06 - Elo'
  else if Sender.AsString = '7' then
    Text := '07 - Hipercard'
  else if Sender.AsString = '8' then
    Text := '08 - Aura'
  else if Sender.AsString = '9' then
    Text := '09 - Cabal'
  else if Sender.AsString = '99' then
    Text := '99 - Outros';
end;

destructor TRoteamentoRedesAdm.Destroy;
begin
  FAdm.Free;
  inherited;
end;


procedure TRoteamentoRedesAdm.Excluir;
begin
  if dataSet.IsEmpty then
    Exit;

  try
    SqlExec('delete from ADM_CARTAO_REDES where rede = %s and cod_empresa = %d',
            [fstrq('rede'), vDadosIni.cod_empresa]).Transaction.Commit;
    dataSet.Refresh;

  except on E: Exception do
    begin
      registraErro('TRoteamentoRedesAdm.Excluir ' + e.Message);
      ShowErro('Erro ao excluir dos dados: ' + e.Message);
    end;
  end;
end;

function TRoteamentoRedesAdm.Salvar(rede, debcred: string; adm, bandeira: Integer; inserir: Boolean): Boolean;
begin
  rede := Trim(Copy(rede, 1, 16));

  if rede = '' then
  begin
    ShowErro('Informe a rede');
    exit;
  end;

  try
    if inserir then
      if not Self.prepare_loop('rede = ''' + rede + '''').IsEmpty then
      begin
        ShowErro('Rede já cadastrada');
        exit;
      end;
  finally
    Self.prepare_loop_done;
  end;

  try
    SqlExec('update or insert into ADM_CARTAO_REDES (rede, cod_empresa, cod_adm, tband, debcred)' +
            ' values (%s, %d, %s, %s, %s)' +
            ' matching (rede, cod_empresa)',
            [QuotedStr(rede), vDadosIni.cod_empresa,
             IfThen(adm > 0, IntToStr(adm), 'null'),
             IfThen(bandeira > 0, IntToStr(bandeira), 'null'),
             IfThen(debcred <> '', QuotedStr(debcred), 'null')]).Transaction.Commit;   

    Result := True;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TRoteamentoRedesAdm.Salvar ' + e.Message);
      ShowErro('Erro ao salvar dos dados: ' + e.Message);
    end;
  end;
end;

{ TEmpresaDefControle }

function TEmpresaDefControle.abreEmpresaDefControle(pCodigoCtrl: Integer): boolean;
begin
	Result := montaSelect(' select emp.cod_empresa, ' +
  	' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from empresa emp ' +
    ' where emp.financeiro_unificado = ''S'' ' +
    ' and emp.codigo_unificadora = ' + vDadosIni.CodEmpresa +
    ' order by emp.cod_empresa ');

  try
  	dataset.DisableControls;
    dataset.First;
    while not dataset.Eof do
    begin
    	if pCodigoCtrl > 0 then
      begin
      	buscas.Close;
        buscas.SQL.Text := 'select codigo_ctrl, codigo_emp, controle_visivel from controles ' +
        	' where codigo_ctrl = ' + IntToStr(pCodigoCtrl) +
          ' and codigo_emp = ' + IntToStr(dataset.FieldByName('cod_empresa').AsInteger);
        buscas.Open;

        if not buscas.IsEmpty then
        	if buscas.FieldByName('controle_visivel').AsString <> 'N' then
          begin
            dataset.Edit;
            dataset.FieldByName('sel').AsString := 'S';
            dataset.Post;
          end;
      end
      else if dataset.FieldByName('cod_empresa').AsInteger = StrToInt(vDadosIni.codEmpresa) then
      begin
      	dataset.Edit;
        dataset.FieldByName('sel').AsString := 'S';
        dataset.Post;
      end;

    	dataset.Next;
    end;
  finally
    dataset.First;
    dataset.EnableControls;
  end;
end;

constructor TEmpresaDefControle.Create;
begin
	dataSet := TClientDataSet(dtmcadbasicoscx.cdsEmpresaDefControle);
  buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
  transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

procedure TEmpresaDefControle._desmarcarTodos;
begin
 try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
  finally
  	dataSet.First;
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TEmpresaDefControle._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TEmpresaDefControle._marcarTodos;
begin
 	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
  finally
  	dataSet.First;
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TControleTaxaEcommerce }

function TControleTaxaEcommerce.abreControleEcommerce(pCodContole: Integer; pCodEmpMult: Integer): boolean;
begin
	Result := montaSelect(' select ec.*, ctrl.nome_ctrl from controles_taxas_ecommerce ec ' +
  	' inner join controles ctrl on ctrl.codigo_ctrl = ec.codigo_ctrl and ctrl.codigo_emp = ec.cod_empresa ' +
    ' where ec.cod_empresa = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
	  	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and ec.codigo_ctrl = ' + IntToStr(pCodContole) +
    ' and ec.ativo = 1 ' +
    ' order by ec.debito_credito, ec.valor_de, ec.valor_ate, ec.parcelas_de, ec.parcelas_ate ');
end;

function TControleTaxaEcommerce.abreFormTaxaEcommerce(pCodControle: Integer): boolean;
begin
	Result := false;

	if not vDadosIni.PesqPros('CXG126', 'TAXAS', '',
  	'CONTROLES', dataSet.FieldByName('codigo_ctrl').AsString, buscas, true) then
    exit;

  abreControleEcommerce(pCodControle);
  vEmpresasUnificadas._abreTodosEmpresas;

  Result := vDadosIni.abreForm('Taxas E-Commerce', frmCadControles.pnTaxasConsulta, [ofEscapeExit, ofAlignAllClientWinCtrl]);
end;

function TControleTaxaEcommerce.abreFormTaxaEcommerceCad(
  pEditar: boolean): boolean;
begin
  Result := false;

  if dataSet.IsEmpty then
    exit;

  frmCadControles.DBEditDe.Enabled := not pEditar;
  frmCadControles.DBEditAte.Enabled := not pEditar;

  atualizarCamposValores;

  Result := vDadosIni.abreForm('Taxas E-Commerce', frmCadControles.pnTaxasCadastro, [ofEscapeExit, ofAlignAllClientWinCtrl]);
end;

function TControleTaxaEcommerce.atualizarCamposValores: boolean;
var
	vValorTaxaProd: Double;
  vPercTaxaProd: Double;
  vValorTaxaFrete: Double;
  vPercTaxaFrete: Double;
  vValorPorPedido: Double;
  vValorPorItem: Double;
  vValorPorUnidade: Double;
  vConsValorFreteTaxa: Double;
  vTotTaxa: Double;
  vTotReceber: Double;
begin
	Result := False;

  if frmCadControles.EditHwVlProd.AsValue > 0 then
    vValorTaxaProd := vDadosIni.IfThen(dataSet.FieldByName('HAB_TAXA_PROD').AsString = 'S',
      (frmCadControles.EditHwVlProd.AsValue / 100) * dataSet.FieldByName('TAXA_PROD').AsFloat, 0)
  else
  	vValorTaxaProd := 0;

  vPercTaxaProd := dataSet.FieldByName('TAXA_PROD').AsFloat;

  if frmCadControles.EditHwVlFrete.AsValue > 0 then
    vValorTaxaFrete := vDadosIni.IfThen(dataSet.FieldByName('HAB_TAXA_FRETE').AsString = 'S',
      (frmCadControles.EditHwVlFrete.AsValue / 100) * dataSet.FieldByName('TAXA_FRETE').AsFloat, 0)
  else
  	vValorTaxaFrete := 0;

  vPercTaxaFrete := dataSet.FieldByName('TAXA_FRETE').AsFloat;

  vValorPorPedido := vDadosIni.IfThen(dataSet.FieldByName('HAB_TAXA_POR_PEDIDO').AsString = 'S',
  	dataSet.FieldByName('VL_TAXA_POR_PEDIDO').AsFloat, 0);

  if frmCadControles.EditHwQtdeItens.AsValue > 0 then
    vValorPorItem := vDadosIni.IfThen(dataSet.FieldByName('HAB_TAXA_POR_ITEM').AsString = 'S',
      frmCadControles.EditHwQtdeItens.AsValue * dataSet.FieldByName('VL_TAXA_POR_ITEM').AsFloat, 0)
  else
  	vValorPorItem := 0;

  if frmCadControles.EditHwQtdeUnidade.AsValue > 0 then
    vValorPorUnidade := vDadosIni.IfThen(dataSet.FieldByName('HAB_TAXA_POR_UNIDADE').AsString = 'S',
      frmCadControles.EditHwQtdeUnidade.AsValue * dataSet.FieldByName('VL_TAXA_POR_UNIDADE').AsFloat, 0)
  else
  	vValorPorUnidade := 0;

  if frmCadControles.EditHwVlFrete.AsValue > 0 then
    vConsValorFreteTaxa := vDadosIni.IfThen(dataSet.FieldByName('FRETE_CONTA_SMART_PLACE').AsString = 'S',
      frmCadControles.EditHwVlFrete.AsValue, 0)
  else
  	vConsValorFreteTaxa := 0;

  vTotTaxa := vValorTaxaProd + vValorTaxaFrete + vValorPorPedido + vValorPorItem + vValorPorUnidade + vConsValorFreteTaxa;

  vTotReceber := vDadosIni.IfThen((frmCadControles.EditHwVlProd.AsValue > 0) or (frmCadControles.EditHwVlFrete.AsValue > 0),
    	vDadosIni.IfThen(frmCadControles.EditHwVlProd.AsValue > 0, frmCadControles.EditHwVlProd.AsValue, 0) +
      vDadosIni.IfThen(frmCadControles.EditHwVlFrete.AsValue > 0, frmCadControles.EditHwVlFrete.AsValue, 0), 0) - vTotTaxa;

  frmCadControles.DBEditPercProd.Enabled := dataSet.FieldByName('HAB_TAXA_PROD').AsString = 'S';
  frmCadControles.DBEditPercFrete.Enabled := dataSet.FieldByName('HAB_TAXA_FRETE').AsString = 'S';
  frmCadControles.DBEditTaxaPorPedido.Enabled := dataSet.FieldByName('HAB_TAXA_POR_PEDIDO').AsString = 'S';
  frmCadControles.DBEditTaxaPorItem.Enabled := dataSet.FieldByName('HAB_TAXA_POR_ITEM').AsString = 'S';

  frmCadControles.pnExQtdeItens.Caption     := '      Qtde Itens:               ' + IntToStr(
		vDadosIni.IfThen(frmCadControles.EditHwQtdeItens.AsValue > 0, frmCadControles.EditHwQtdeItens.AsValue, 0));

  frmCadControles.pnExQtdeUnidades.Caption     := '      Qtde Unidades:        ' + IntToStr(
		vDadosIni.IfThen(frmCadControles.EditHwQtdeUnidade.AsValue > 0, frmCadControles.EditHwQtdeUnidade.AsValue, 0));

  frmCadControles.pnExProd.Caption          := '      Produtos:                 R$ ' + FormatFloat('0.00',
  	vDadosIni.IfThen(frmCadControles.EditHwVlProd.AsValue > 0, frmCadControles.EditHwVlProd.AsValue, 0));

  frmCadControles.pnExFrete.Caption         := '      Frete:                       R$ ' + FormatFloat('0.00',
  	vDadosIni.IfThen(frmCadControles.EditHwVlFrete.AsValue > 0, frmCadControles.EditHwVlFrete.AsValue, 0));

  frmCadControles.pnExPedido.Caption       := '      Total Pedido:            R$ ' + FormatFloat('0.00',
  	vDadosIni.IfThen((frmCadControles.EditHwVlProd.AsValue > 0) or (frmCadControles.EditHwVlFrete.AsValue > 0),
    	vDadosIni.IfThen(frmCadControles.EditHwVlProd.AsValue > 0, frmCadControles.EditHwVlProd.AsValue, 0) +
      vDadosIni.IfThen(frmCadControles.EditHwVlFrete.AsValue > 0, frmCadControles.EditHwVlFrete.AsValue, 0), 0));
    
  frmCadControles.pnExTaxaProd.Caption      := ' Comissão (Produtos):        R$ ' +
  	vDadosIni.IfThen(vValorTaxaProd < 10, ' ', '') + FormatFloat('0.00', vValorTaxaProd) + '  -  ' +
    	vDadosIni.IfThen(vPercTaxaProd < 10, ' ', '') + FormatFloat('0.00', vPercTaxaProd) + '%';

  frmCadControles.pnExTaxaFrete.Caption     := '       Comissão (Frete):       R$ ' +
  	vDadosIni.IfThen(vValorTaxaFrete < 10, ' ', '') +  FormatFloat('0.00', vValorTaxaFrete) + '  -  ' +
    	vDadosIni.IfThen(vPercTaxaFrete < 10, ' ', '') + FormatFloat('0.00', vPercTaxaFrete) + '%';

  frmCadControles.pnExTaxaAdPedido.Caption  := '      Taxa fixa (Pedido):       R$ ' +
  	vDadosIni.IfThen(vValorPorPedido < 10, ' ', '') +
  		FormatFloat('0.00', vValorPorPedido);

  frmCadControles.pnExTaxaAdItem.Caption    := '      Taxa fixa (Item):            R$ ' +
  	vDadosIni.IfThen(vValorPorItem < 10, ' ', '') +
  		FormatFloat('0.00', vValorPorItem);

  frmCadControles.pnExTaxaAdUnidade.Caption    := '      Taxa fixa (Unidade):     R$ ' +
  	vDadosIni.IfThen(vValorPorUnidade < 10, ' ', '') +
  		FormatFloat('0.00', vValorPorUnidade);

  frmCadControles.pnExConsFreteTaxa.Caption := '      Frete Marketplace:        R$ ' +
  	vDadosIni.IfThen(vConsValorFreteTaxa < 10, ' ', '') + FormatFloat('0.00', vConsValorFreteTaxa);

  frmCadControles.pnExTaxaAdTot.Caption     := '      Total:                             R$ ' +
  	vDadosIni.IfThen(vTotTaxa < 10, ' ', '') + FormatFloat('0.00', vTotTaxa);

  frmCadControles.pnExValorReceber.Caption  := '      Valor a receber:             R$ ' +
  	vDadosIni.IfThen(vTotReceber < 10, ' ', '') +	FormatFloat('0.00', vTotReceber);

  Result := True;
end;

constructor TControleTaxaEcommerce.create;
begin
	dataSet := TClientDataSet(dtmcadbasicoscx.cdsTaxaEcommerce);
  buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
  transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);

  vEmpresasUnificadas := TEmpresasUnificadasEcmmerce.Create;
end;

function TControleTaxaEcommerce.delete: boolean;
var
  vCodFormula: Integer;
begin
	try
     Result := False;

     if dataSet.IsEmpty then
        exit;

     vCodFormula := dataSet.FieldByName('seqid').AsInteger;

     if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
      exit;

     buscas.Close;
     buscas.SQL.Text := ' delete from controles_taxas_ecommerce ' +
       ' where seqid = ' + IntToStr(vCodFormula) +
       ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
     try
       buscas.ExecSQL;

       CommitaTransacao;
       vDadosIni.GravaAuditoria('CXG130', 'EXCLUIR', 'SUCESSO', 'CONTROLES_TAXAS_ECOMMERCE', IntToStr(vCodFormula), buscas);
     except
       RollBackTransacao;
       vDadosIni.GravaAuditoria('CXG130', 'EXCLUIR', 'FALHA', 'CONTROLES_TAXAS_ECOMMERCE', IntToStr(vCodFormula), buscas);
     end;
     result := true;
     Refresh;
     Exit;
  except on E: Exception do
    begin
      Result := False;
      registraErro('TControleTaxaEcommerce.delete ' + E.Message);
      vDadosIni.ShowErro('Erro ao excluir registro. Erro: ' + e.Message);
    end;
  end;
end;

destructor TControleTaxaEcommerce.Destroy;
begin
  if vEmpresasUnificadas <> nil then
    FreeAndNil(vEmpresasUnificadas);
  inherited;
end;

function TControleTaxaEcommerce.edit: boolean;
begin
	Result := False;

  if dataSet.IsEmpty then
  	exit;

	if inherited Edit then
  begin
  	if dataSet.FieldByName('cons_frete_regra').IsNull then
	  	dataSet.FieldByName('cons_frete_regra').AsString := 'N';
  	if dataSet.FieldByName('debito_credito').IsNull then
    	dataSet.FieldByName('debito_credito').AsString := 'C';
    if dataSet.FieldByName('ativo').AsInteger <> 1 then
	  	dataSet.FieldByName('ativo').AsFloat := 1;
    if dataSet.FieldByName('hab_taxa_prod').IsNull then
	    dataSet.FieldByName('hab_taxa_prod').AsString := 'N';
    if dataSet.FieldByName('taxa_prod').IsNull then
	    dataSet.FieldByName('taxa_prod').AsFloat := 0;
    if dataSet.FieldByName('hab_taxa_frete').IsNull then
    	dataSet.FieldByName('hab_taxa_frete').AsString := 'N';
    if dataSet.FieldByName('taxa_frete').IsNull then
	    dataSet.FieldByName('taxa_frete').AsFloat := 0;
    if dataSet.FieldByName('hab_taxa_por_pedido').IsNull then
    	dataSet.FieldByName('hab_taxa_por_pedido').AsString := 'N';
    if dataSet.FieldByName('vl_taxa_por_pedido').IsNull then
	    dataSet.FieldByName('vl_taxa_por_pedido').AsFloat := 0;
    if dataSet.FieldByName('hab_taxa_por_item').IsNull then
	    dataSet.FieldByName('hab_taxa_por_item').AsString := 'N';
    if dataSet.FieldByName('vl_taxa_por_item').IsNull then
	    dataSet.FieldByName('vl_taxa_por_item').AsFloat := 0;
    if dataSet.FieldByName('hab_taxa_por_unidade').IsNull then
	    dataSet.FieldByName('hab_taxa_por_unidade').AsString := 'N';
    if dataSet.FieldByName('vl_taxa_por_unidade').IsNull then
	    dataSet.FieldByName('vl_taxa_por_unidade').AsFloat := 0;
    if dataSet.FieldByName('frete_conta_smart_place').IsNull then
	    dataSet.FieldByName('frete_conta_smart_place').AsString := 'N';
  	Result := True;
  end;
end;

function TControleTaxaEcommerce.insert(pCodControle: Integer; pCodEmpMult: Integer; pConsRegraFrete: string): boolean;
begin
	Result := False;
  if inherited insert then
  begin
  	dataSet.FieldByName('cod_empresa').AsInteger :=
    	vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0), pCodEmpMult, StrToInt(vDadosIni.codEmpresa));
  	dataSet.FieldByName('codigo_ctrl').AsInteger := pCodControle;
    dataSet.FieldByName('cons_frete_regra').AsString := vDadosIni.IfThen(trim(pConsRegraFrete) <> '', pConsRegraFrete, 'N');
  	dataSet.FieldByName('debito_credito').AsString := 'C';
    dataSet.FieldByName('valor_de').AsFloat := 0;
    dataSet.FieldByName('valor_ate').AsFloat := 0;
    dataSet.FieldByName('parcelas_de').AsInteger := 0;
    dataSet.FieldByName('parcelas_ate').AsInteger := 0;
	  dataSet.FieldByName('ativo').AsFloat := 1;
    dataSet.FieldByName('hab_taxa_prod').AsString := 'N';
    dataSet.FieldByName('taxa_prod').AsFloat := 0;
    dataSet.FieldByName('hab_taxa_frete').AsString := 'N';
    dataSet.FieldByName('taxa_frete').AsFloat := 0;
    dataSet.FieldByName('hab_taxa_por_pedido').AsString := 'N';
    dataSet.FieldByName('vl_taxa_por_pedido').AsFloat := 0;
    dataSet.FieldByName('hab_taxa_por_item').AsString := 'N';
    dataSet.FieldByName('vl_taxa_por_item').AsFloat := 0;
    dataSet.FieldByName('hab_taxa_por_unidade').AsString := 'N';
    dataSet.FieldByName('vl_taxa_por_unidade').AsFloat := 0;
    dataSet.FieldByName('frete_conta_smart_place').AsString := 'N';
    Result := True;
  end;
end;

function TControleTaxaEcommerce.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('CXG130', 'SALVAR',
    	'CTRL: ' + dataSet.FieldByName('CODIGO_CTRL').AsString,
      'CONTROLES_TAXAS_ECOMMERCE', dataSet.FieldByName('SEQID').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    buscas.Close;
    buscas.SQL.Text := 'select * from CONTROLES' +
      ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
      ' and codigo_emp = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
    buscas.Open;
    if buscas.IsEmpty then
      raiseExceptionCreate('Controle não encontrado para empresa ' +
      	IntToStr(dataSet.FieldByName('cod_empresa').AsInteger) +
      	', favor verificar antes de continuar.', '');

    if dataSet.FieldByName('VALOR_DE').AsFloat <= 0 then
    	raiseExceptionCreate('Campo "Valor de" deve ser informado', 'DBEditValorDe');

    if dataSet.FieldByName('VALOR_ATE').AsFloat <= 0 then
    	raiseExceptionCreate('Campo "Valor até" deve ser informado', 'DBEditValorAte');

    if dataSet.FieldByName('PARCELAS_DE').AsFloat <= 0 then
    	raiseExceptionCreate('Campo "Parcela de" deve ser informado', 'DBEditDe');

    if dataSet.FieldByName('PARCELAS_ATE').AsFloat <= 0 then
    	raiseExceptionCreate('Campo "Parcela até" deve ser informado', 'DBEditAte');

    if (trim(dataSet.FieldByName('HAB_TAXA_PROD').AsString) = 'S') then
      if dataSet.FieldByName('TAXA_PROD').AsFloat <= 0 then
        raiseExceptionCreate('Taxa para produto deve ser informada', 'DBEditPercProd');

    if (trim(dataSet.FieldByName('HAB_TAXA_FRETE').AsString) = 'S') then
      if dataSet.FieldByName('TAXA_FRETE').AsFloat <= 0 then
        raiseExceptionCreate('Taxa para frete deve ser informada', 'DBEditPercFrete');

    if trim(dataSet.FieldByName('HAB_TAXA_POR_PEDIDO').AsString) = 'S' then
    	if dataSet.FieldByName('VL_TAXA_POR_PEDIDO').AsFloat <= 0 then
	      raiseExceptionCreate('Taxa fixa por pedido deve ser informada', 'DBEditTaxaPorPedido');

    if trim(dataSet.FieldByName('VL_TAXA_POR_ITEM').AsString) = 'S' then
    	if dataSet.FieldByName('VL_TAXA_POR_PEDIDO').AsFloat <= 0 then
	      raiseExceptionCreate('Taxa fixa por item do pedido deve ser informada', 'DBEditTaxaPorItem');

    if trim(dataSet.FieldByName('VL_TAXA_POR_UNIDADE').AsString) = 'S' then
    	if dataSet.FieldByName('VL_TAXA_POR_UNIDADE').AsFloat <= 0 then
	      raiseExceptionCreate('Taxa fixa por unidade do pedido deve ser informado', 'DBEditTaxaPorUnidade');

    if dataSet.FieldByName('DEBITO_CREDITO').AsString = 'C' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select * from CONTROLES_TAXAS_ECOMMERCE' +
        ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
        ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger) +
        ' and debito_credito = ''C'' ' +
        ' and :valores >= valor_de ' +
        ' and :valores <= valor_ate ' +
        ' and :parcelas >= parcelas_de ' +
        ' and :parcelas <= parcelas_ate ' +
        ' and seqid <> ' + IntToStr(dataSet.FieldByName('seqid').AsInteger);
      buscas.ParamByName('valores').AsFloat := dataSet.FieldByName('valor_de').AsFloat;
      buscas.ParamByName('parcelas').AsInteger := dataSet.FieldByName('parcelas_de').AsInteger;
      buscas.Open;
      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe uma taxa cadastrada para este Controle no intervalo informado', 'DBEditDe');

      buscas.Close;
      buscas.ParamByName('valores').AsFloat := dataSet.FieldByName('valor_ate').AsFloat;
      buscas.ParamByName('parcelas').AsInteger := dataSet.FieldByName('parcelas_de').AsInteger;
      buscas.Open;
      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe uma taxa cadastrada para este Controle no intervalo informado', 'DBEditDe');

      buscas.Close;
      buscas.ParamByName('valores').AsFloat := dataSet.FieldByName('valor_de').AsFloat;
      buscas.ParamByName('parcelas').AsInteger := dataSet.FieldByName('parcelas_ate').AsInteger;
      buscas.Open;
      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe uma taxa cadastrada para este Controle no intervalo informado', 'DBEditDe');
        
      buscas.Close;
      buscas.ParamByName('valores').AsFloat := dataSet.FieldByName('valor_ate').AsFloat;
      buscas.ParamByName('parcelas').AsInteger := dataSet.FieldByName('parcelas_ate').AsInteger;
      buscas.Open;
      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe uma taxa cadastrada para este Controle no intervalo informado', 'DBEditDe');
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select * from CONTROLES_TAXAS_ECOMMERCE' +
        ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
        ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger) +
        ' and debito_credito = ''D'' ' +
        ' and :valores >= valor_de ' +
        ' and :valores <= valor_ate ' +
        ' and seqid <> ' + IntToStr(dataSet.FieldByName('seqid').AsInteger);
      buscas.ParamByName('valores').AsFloat := dataSet.FieldByName('valor_de').AsInteger;
      buscas.Open;
      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe uma taxa cadastrada para este Controle no intervalo informado', '');

      buscas.Close;
      buscas.ParamByName('valores').AsFloat := dataSet.FieldByName('valor_ate').AsFloat;
      buscas.Open;
      if not buscas.IsEmpty then
        raiseExceptionCreate('Já existe uma taxa cadastrada para este Controle no intervalo informado', 'DBEditDe');
    end;

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('SEQID').AsInteger :=
        Gencodigo('CONTROLES_TAXAS_ECOMMERCE', DtmCadBasicosCx.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('CXG130', acao, 'SUCESSO', 'CONTROLES_TAXAS_ECOMMERCE',
        dataSet.FieldByName('SEQID').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('CXG130', acao, 'FALHA', 'CONTROLES_TAXAS_ECOMMERCE',
        dataSet.FieldByName('SEQID').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TEmpresasUnificadasEcmmerce }

constructor TEmpresasUnificadasEcmmerce.create;
begin
	dataSet := TClientDataSet(dtmcadbasicoscx.cdsEmpresasUnificadas);
  buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
  transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TEmpresasUnificadasEcmmerce._abreTodosEmpresas: Boolean;
begin
	Result := montaSelect(' select cod_empresa, (identificacao_emp ||'' - ''|| cgc_emp) identificacao_emp from empresa ' +
    ' where codigo_unificadora = ' + vDadosIni.codEmpresa +
    ' and financeiro_unificado = ''S'' ' +
    ' order by cod_empresa');
end;

function TEmpresasUnificadasEcmmerce._BuscarEmpresas(vCodEmp: Integer): Boolean;
begin
	Result := False;

  buscas.Close;
  buscas.SQL.Text := ' select cod_empresa from empresa ' +
    ' where codigo_unificadora = ' + vDadosIni.codEmpresa +
    ' and financeiro_unificado = ''S'' ';
  buscas.Open;
  buscas.FetchAll;


  buscas.First;
  while not buscas.Eof do
  begin
    if buscas.FieldByName('COD_EMPRESA').AsInteger = vCodEmp then
    begin
      Result := True;
      Break;
    end;
    buscas.Next;
  end;
  buscas.Close;
end;

{ TFornecedorConta }

function TFornecedorConta.AbreFornecedor: boolean;
begin
	Result := montaSelect(' select cod_cliente, cod_empresa, nome_cliente, razao, cpfcgc, tipo from clientes ' +
    ' where cod_cliente = 0 ' +
    ' and (tipo = ''F'' or tipo = ''A'') ' +
    ' and ativo = 1 ' +
    ' and cod_empresa = 0 ');
  Result := not dataSet.IsEmpty;
end;

function TFornecedorConta.AbreFornecedor(pCpfCnpj: string): boolean;
begin
	if trim(pCpfCnpj) = '' then
  	Result := montaSelect(' select cod_cliente, cod_empresa, nome_cliente, razao, cpfcgc, tipo from clientes ' +
      ' where cod_cliente = 0 ' +
      ' and (tipo = ''F'' or tipo = ''A'') ' +
	    ' and ativo = 1 ' +
      ' and cod_empresa = 0 ')
  else
    Result := montaSelect(' select first 1 cod_cliente, cod_empresa, nome_cliente, razao, cpfcgc, tipo from clientes ' +
      ' where cpfcgc = ' + QuotedStr(trim(pCpfCnpj)) +
      ' and (tipo = ''F'' or tipo = ''A'') ' +
      ' and ativo = 1 ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

function TFornecedorConta.AbreFornecedor(pCodCliente: Integer): boolean;
begin
	Result := montaSelect(' select cod_cliente, cod_empresa, nome_cliente, razao, cpfcgc, tipo from clientes ' +
    ' where cod_cliente = ' + IntToStr(pCodCliente) +
    ' and (tipo = ''F'' or tipo = ''A'') ' +
    ' and ativo = 1 ' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

constructor TFornecedorConta.create;
begin
	buscas := TIBQuery(DtmCadBasicosCx.qrFornecedorConta);
  dataSet := TClientDataSet(DtmCadBasicosCx.cdsFornecedorConta);
  transacao := TIBTransaction(DtmCadBasicosCx.IBTransBoletos);
end;

{ TPlanoContasClientes }

function TPlanoContasClientes.abrePcontasClientes(n_conta_plc: Double): Boolean;
begin
	Result := False;

  dataSet.Close;
	dataSet.CommandText := ' select * from p_contas_clientes pc ' +
  	' where pc.n_conta_plc = :n_conta_plc ';
  dataSet.Params.ParamByName('n_conta_plc').AsFloat := n_conta_plc;
  dataSet.Open;

  try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      SqlOpen(' select first 1 nome_cliente, razao from clientes ' +
      	' where cpfcgc = ' + QuotedStr(dataSet.FieldByName('CPFCGC').AsString) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);

      dataSet.Edit;
      dataSet.FieldByName('NOME_CLIENTE').AsString := buscas.FieldByName('NOME_CLIENTE').AsString;
      dataSet.FieldByName('RAZAO').AsString := buscas.FieldByName('RAZAO').AsString;
      dataSet.Post;

      dataSet.Next;
    end;
  finally
  	dataSet.First;
    dataSet.EnableControls;
  end;

  Result := not dataSet.IsEmpty;
end;

constructor TPlanoContasClientes.Create;
begin
	dataSet := TClientDataSet(dtmcadbasicoscx.cdsPlanoContasClientes);
  buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
  transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TPlanoContasClientes.delete: Boolean;
var
  vN_Conta_Plc, vCpf_Cnpj: string;
begin
	Result := False;
  
  if dataSet.IsEmpty then
    exit;

 	vN_Conta_Plc := dataSet.FieldByName('N_CONTA_PLC').AsString;
  vCpf_Cnpj := dataSet.FieldByName('CPFCGC').AsString;

 	if not vDadosIni.PesqPros('CXG136', 'SALVAR', 'N_CONTA: '+ vN_Conta_Plc + ' - CPF/CNPJ: ' + vCpf_Cnpj,
  	'P_CONTAS_CLIENTES', 'N_CONTA: '+ vN_Conta_Plc, buscas, true) then
    	exit;

  if Application.MessageBox('Tem certeza que deseja remover cliente?',
     'Excluir Registro',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
   vN_Conta_Plc := dataSet.FieldByName('N_CONTA_PLC').AsString;
   vCpf_Cnpj := dataSet.FieldByName('CPFCGC').AsString;

   result := inherited Delete;
   if Result then
     result := Apply;
   if result then
     result := CommitaTransacao;

   if Result then
   	 vDadosIni.GravaAuditoria('CXG136', 'EXCLUSAO', 'SUCESSO - N_CONTA: '+ vN_Conta_Plc + ' - CPF/CNPJ: ' + vCpf_Cnpj,
     	 'P_CONTAS_CLIENTES', 'N_CONTA: '+ vN_Conta_Plc, buscas)
   else
     vDadosIni.GravaAuditoria('CXG136', 'EXCLUSAO', 'FALHA - N_CONTA: '+ vN_Conta_Plc + ' - CPF/CNPJ: ' + vCpf_Cnpj,
     	 'P_CONTAS_CLIENTES', 'N_CONTA: '+ vN_Conta_Plc, buscas);
 end;
 abrePcontasClientes(StrToFloat(vN_Conta_Plc));
end;

function TPlanoContasClientes.insert(n_conta_plc: Double): Boolean;
begin
	Result := False;

  if not vDadosIni.PesqPros('CXG134', 'INSERIR', 'N_CONTA: ' + FloatToStr(n_conta_plc), 'P_CONTAS_CLIENTES',
    '', buscas, true) then
      exit;

  if not dataSet.Active then
  	abrePcontasClientes(0);
  if inherited Insert then
  begin
  	dataSet.FieldByName('N_CONTA_PLC').AsFloat := n_conta_plc;
    result := true;
  end;
end;

function TPlanoContasClientes.post: Boolean;
var
	acao: string;
  vN_Conta_Plc, vCpf_Cnpj: string;
begin
	try
  	Result := False;

  	vN_Conta_Plc := dataSet.FieldByName('N_CONTA_PLC').AsString;
    vCpf_Cnpj := dataSet.FieldByName('CPFCGC').AsString;

  	if not vDadosIni.PesqPros('CXG135', 'SALVAR', 'N_CONTA: ' + vN_Conta_Plc + ' - CPF/CNPJ: ' + vCpf_Cnpj,
    	'P_CONTAS_CLIENTES', 'N_CONTA: ' + vN_Conta_Plc, buscas, true) then
      exit;

    if not (dataSet.state in [dsedit,dsinsert]) then
      exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('N_CONTA_PLC').AsString) = '' then
    	raiseExceptionCreate('Cliente / Fornecedor não informado.', 'DBEdit25');

    buscas.Close;
    buscas.SQL.Text := ' select cod_cliente, cod_empresa from clientes ' +
    	' where cpfcgc = :cpfcgc ' +
      ' and cod_empresa = :cod_empresa ' +
      ' and ativo = 1 ';
    buscas.ParamByName('cpfcgc').AsString := vCpf_Cnpj;
    buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.cod_empresa;
    buscas.Open;

    if buscas.IsEmpty then
    	raiseExceptionCreate('Cliente / Fornecedor não encontrado.', 'DBEdit25');

    buscas.Close;
    buscas.SQL.Text := ' select * from p_contas_clientes ' +
    	' where n_conta_plc = :n_conta_plc ' +
      ' and cpfcgc = :cpfcgc ';
    buscas.ParamByName('n_conta_plc').AsFloat := StrToFloat(vN_Conta_Plc);
    buscas.ParamByName('cpfcgc').AsString := vCpf_Cnpj;
    buscas.Open;

    if not buscas.IsEmpty then
    	raiseExceptionCreate('Cliente / Fornecedor já vinculado ao Plano de Contas.', 'DBEdit25');

    Result := inherited post;
    if dataSet.ChangeCount = 0 then
    begin
      result := true;
      exit;
    end;

    if Apply then
    begin
      CommitaTransacao;
      result := True;
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := False;
    end;

    if Result then
      vDadosIni.GravaAuditoria('CXG135', acao, 'SUCESSO - N_CONTA: ' + vN_Conta_Plc + ' - CPF/CNPJ: ' + vCpf_Cnpj,
      	'P_CONTAS_CLIENTES', 'N_CONTA: ' + vN_Conta_Plc, buscas)
    else
      vDadosIni.GravaAuditoria('CXG135', acao, 'FALHA - N_CONTA: ' + vN_Conta_Plc + ' - CPF/CNPJ: ' + vCpf_Cnpj,
      	'P_CONTAS_CLIENTES', 'N_CONTA: ' + vN_Conta_Plc, buscas);

    abrePcontasClientes(StrToFloat(vN_Conta_Plc));
  except
     on e: Exception do
     begin
        Result := false;
        Application.MessageBox( pchar(e.Message) ,'Atenção' ,MB_ICONERROR + MB_OK );
        registraErro(e.Message);
     end;
  end;
end;

{ TPlanoContasRel }

function TPlanoContasRel.abrirPContas(pCheckListBox: TCheckListBox): boolean;
begin
  Result := False;

  pCheckListBox.Clear;

	buscas.Close;
  buscas.Sql.Text := ' select p_contas.n_conta_plc, p_contas.desc_plc, ' +
  	' p_contas.cod_conta_rel, p_contas_rel.descricao from p_contas ' +
    ' left join p_contas_rel on p_contas_rel.codigo = p_contas.cod_conta_rel ' +
  	' where p_contas.tipo_plc = ' + QuotedStr(dataSet.FieldByName('NATUREZA').AsString) +
    ' and p_contas.ativo <> 99 ' +
    ' order by p_contas.desc_plc ';
  buscas.Open;
  buscas.FetchAll;

  try
    vDadosIni.abreStatusProcessamento('', 'Carrendo Plano de Contas');

    buscas.First;
    while not buscas.Eof do
    begin
      vDadosIni.abreStatusProcessamento('', 'Carrendo Plano de Contas (' + IntToStr(buscas.RecNo) + '/' + IntToStr(buscas.RecordCount) + ')');

      pCheckListBox.Items.Add(
        vDadosIni.IfThen(buscas.FieldByName('n_conta_plc').AsFloat <= 9, '  ', vDadosIni.IfThen(buscas.FieldByName('n_conta_plc').AsFloat <= 99, ' ', '')) +
        FormatFloat('0.000', buscas.FieldByName('n_conta_plc').AsFloat) + '|' +
        trim(buscas.FieldByName('desc_plc').AsString) +
        vDadosIni.IfThen(trim(buscas.FieldByName('descricao').AsString) <> '',
        	' -> ' + trim(buscas.FieldByName('descricao').AsString), '')
      );

      pCheckListBox.Checked[buscas.RecNo - 1] := dataSet.FieldByName('CODIGO').AsInteger = buscas.FieldByName('COD_CONTA_REL').AsInteger;

      buscas.Next;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TPlanoContasRel.atualizarPContas(pCheckListBox: TCheckListBox): boolean;
var
	vTemp: string;
	I: Integer;
begin
	try
 		Result := False;

    if not vDadosIni.PesqPros('CXG158', 'DEFINIR', '', 'P_CONTAS',
      '', buscas, true) then
      Exit;


    try
      vDadosIni.abreStatusProcessamento('', 'Salvando Plano de Contas');

      for I := 0 to pCheckListBox.Items.Count - 1 do
      begin
        vDadosIni.abreStatusProcessamento('', 'Salvando Plano de Contas (' + IntToStr(I + 1) + '/' + IntToStr(pCheckListBox.Items.Count) + ')');

        vtemp := pCheckListBox.Items[I];
        vtemp := Copy(vtemp, 1, Pos('|', vtemp) - 1);
        vtemp := trim(vtemp);

        buscas.Close;
        buscas.SQL.Text := ' update p_contas set cod_conta_rel = ' +
          vDadosIni.IfThen(pCheckListBox.Checked[I], IntToStr(dataSet.FieldByName('CODIGO').AsInteger), ' null ') +
          ' where n_conta_plc = :n_conta_plc ' +
          vDadosIni.IfThen(not pCheckListBox.Checked[I], ' and cod_conta_rel = ' + IntToStr(dataSet.FieldByName('CODIGO').AsInteger), '');
        buscas.ParamByName('n_conta_plc').AsFloat := StrToFloat(vTemp);
        buscas.ExecSQL;

        vDadosIni.GravaAuditoria('CXG158', 'DEFINIR', '', 'P_CONTAS', vTemp, buscas);
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
    end;

    if CommitaTransacao then
      result := true;

    if Result then
      vDadosIni.GravaAuditoria('CXG158', 'DEFINIR', 'SUCESSO', 'P_CONTAS', '', buscas)
    else
      vDadosIni.GravaAuditoria('CXG158', 'DEFINIR', 'FALHA', 'P_CONTAS', '', buscas);
  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

constructor TPlanoContasRel.create;
begin
	dataSet := TClientDataSet(dtmcadbasicoscx.cdsPlanoContasRel);
  buscas := TIBQuery (dtmcadbasicoscx.qrBuscas);
  transacao := TIBTransaction (dtmcadbasicoscx.IBTransBoletos);
end;

function TPlanoContasRel.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('CODIGO').AsString;

  if dataSet.FieldByName('ATIVO').AsInteger = 1 then
  begin
    if not vDadosIni.PesqPros('CXG152', 'EXCLUIR', '', 'P_CONTAS_REL',
      dataSet.FieldByName('CODIGO').AsString, buscas, false) then
      Exit;

    if Application.MessageBox('Tem certeza que deseja enviar este registro para Lixeira?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      Exit;

    dataSet.Edit;
    dataSet.FieldByName('ATIVO').AsInteger := 0;
    dataSet.Post;

    result := Apply;
    if result then
      result := CommitaTransacao;
    if Result then
      vDadosIni.GravaAuditoria('CXG152', 'EXCLUIR', 'SUCESSO', 'P_CONTAS_REL', vCodFormula, buscas)
    else
      vDadosIni.GravaAuditoria('CXG152', 'EXCLUIR', 'FALHA', 'P_CONTAS_REL', vCodFormula, buscas);

    Result := true;
    Refresh;

    Exit;
  end;

  if not vDadosIni.PesqPros('CXG153', 'EXCLUIR', '', 'P_CONTAS_REL',
    dataSet.FieldByName('CODIGO').AsString, buscas, false) then
    Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  if dataSet.FieldByName('PADRAO').AsString = 'S' then
  begin
    Application.MessageBox('O tipo de conta padrão não pode ser excluída', 'Atenção', 0 + 64);
    Exit;
  end;

  if ExecutaComandosSql('select first 1 n_conta_plc from p_contas ' +
  	' where cod_conta_rel = ' + IntToStr(dataSet.FieldByName('CODIGO').AsInteger)) then
  begin
    Application.MessageBox('O tipo de conta não pode ser excluída pois está vinculado a um plano de contas', 'Atenção', 0 + 64);
    Exit;
  end;

  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('CXG153', 'EXCLUIR', 'SUCESSO', 'P_CONTAS_REL', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('CXG153', 'EXCLUIR', 'FALHA', 'P_CONTAS_REL', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

function TPlanoContasRel.edit: boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('CXG151', 'ALTERAR', '', 'P_CONTAS_REL',
    '', buscas, false) then
    Exit;

  if not dataSet.Active then
    result := montaSelect(' select * from p_contas_rel where 1 = 0');
  Result := inherited Edit;
end;

function TPlanoContasRel.Insert: boolean;
begin
	Result := False;
  if not vDadosIni.PesqPros('CXG150', 'INCLUIR', '', 'P_CONTAS_REL',
    '', buscas, True) then
    Exit;

	if not dataSet.Active then
    montaSelect(' select * from p_contas_rel where 1 = 0');

  Result := inherited Insert;
end;

function TPlanoContasRel.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('CXG155', 'SALVAR', '', 'P_CONTAS_REL',
      dataSet.FieldByName('CODIGO').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('DESCRICAO').AsString) = '' then
      raiseExceptionCreate('Descrição deve ser informado', 'DBEdit2');

    if trim(dataSet.FieldByName('NATUREZA').AsString) = '' then
      raiseExceptionCreate('Natureza deve ser informado', 'DBComboBox1');

    buscas.close;
    buscas.SQL.Text := 'select descricao from p_contas_rel ' +
    	' where descricao = :descricao ' +
      ' and codigo <> :codigo ';
    buscas.ParamByName('DESCRICAO').AsString := trim(dataSet.FieldByName('DESCRICAO').AsString);
    buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
    buscas.Open;

    if not buscas.IsEmpty then
    	raiseExceptionCreate('Já existe um tipo de conta com essa descrição', 'DBEdit2');

    if acao = 'INSERIR' then
    begin
    	buscas.close;
      buscas.SQL.Text := 'select GEN_ID(INC_TIPO_CONTA,1) from rdb$database';
      buscas.Open;
      dataSet.FieldByName('CODIGO').AsInteger := buscas.FieldByName('GEN_ID').asinteger;
			if ExecutaComandosSql('select CODIGO from P_CONTAS_REL ' +
      	' where CODIGO = ' + dataSet.FieldByName('CODIGO').AsString) then
        raise exception.create('Erro ao inserir');
      vDadosIni.vPesquisa := dataSet.FieldByName('CODIGO').asstring;
    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('CXG155', acao, 'SUCESSO', 'P_CONTAS_REL',
        dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('CXG155', acao, 'FALHA', 'P_CONTAS_REL',
        dataSet.FieldByName('CODIGO').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TPlanoContasRel._abrelixeira: boolean;
begin
	if not _lixeiraCheia then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
    result := false;
  end
  else
    result := montaSelect('SELECT * FROM P_CONTAS_REL where Ativo = 0');
end;

procedure TPlanoContasRel._cadPlanoContasRel(pTipoForm: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Tipo de Contas - Resumo Financeiro');
    if DtmCadBasicosCx = nil then
      DtmCadBasicosCx := TDtmCadBasicosCx.Create(DtmCadBasicosCx);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('CXG148', 'CONSULTA', '', 'P_CONTAS_REL', '',
      DtmCadBasicosCx.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadPlanoContasRel = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadPlanoContasRel, frmCadPlanoContasRel);
    end;

    if (pTipoForm > 0) and (not frmCadPlanoContasRel.Visible) then
      frmCadPlanoContasRel.ShowModal
    else if (not frmCadPlanoContasRel.Visible) then
      frmCadPlanoContasRel.Show
    else if frmCadPlanoContasRel.FormStyle = fsMDIChild then
      frmCadPlanoContasRel.Show
    else
      frmCadPlanoContasRel.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TPlanoContasRel._lixeiraCheia: boolean;
begin
	Result := ExecutaComandosSql(' SELECT FIRST 1 CODIGO FROM P_CONTAS_REL ' +
    ' WHERE ATIVO = 0 ');
end;

function TPlanoContasRel._restauralixeira: boolean;
begin
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        if (Edit) or (dataSet.State = dsEdit) then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          Result := Post;
          if Result then
            Result := CommitaTransacao;

          if Result then
            vDadosIni.GravaAuditoria('CXG154', 'RESTAURAR', 'SUCESSO',
              'P_CONTAS_REL', dataSet.FieldByName('CODIGO').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('CXG154', 'RESTAURAR', 'FALHA',
              'P_CONTAS_REL', dataSet.FieldByName('CODIGO').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação', 0 + 64);
  Refresh;
end;

end.
