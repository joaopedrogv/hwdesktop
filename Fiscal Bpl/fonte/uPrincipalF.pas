unit uPrincipalF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
  Dialogs, uPadrao, StdCtrls, jpeg, Menus, Buttons, AppEvnts,
  DB, IBDatabase, uEditMoeda, uDadosIniFiscal, Uimpressoras,
  uCadastrosF, uHwF, uCupom, EnterantHw, ComCtrls, ExtCtrls, Controls,
  uImpressoraF, FileCtrl, uClasseSincF, uClasseBalanca,
  unFuncoesTEF, uEditHw, IBQuery, uthreadSincronizacao, uClassesMigRegistros;

type
  Treestrutura_verificar_hwauto = procedure(VersaoBPL: PChar);
  Treestrutura_verificar_fiscal = procedure(VersaoBPL: PChar);
  Treestrutura_verificar_hwf = procedure(VersaoBPL: PChar);

  threadSincronizacao2 = class(threadSincronizacao)
  end;
  TVerificaVendasSemDadosCupom2 = class(TVerificaVendasSemDadosCupom)
  end;

  TfrmPrincipalFiscal = class(TfrmPadrao)
    lMsg: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel12: TPanel;
    imgLogo: TImage;
    imgHw: TImage;
    MainMenu1: TMainMenu;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    ApplicationEvents1: TApplicationEvents;
    Sair1: TMenuItem;
    Utilitrios1: TMenuItem;
    PesquisaClientes1: TMenuItem;
    PesquisaProdutos1: TMenuItem;
    PesquisaServios1: TMenuItem;
    N2: TMenuItem;
    SangriaSuprimentos1: TMenuItem;
    N3: TMenuItem;
    AtivarHorriodeVero1: TMenuItem;
    DesativarHorriodeVero1: TMenuItem;
    N4: TMenuItem;
    ReduoZ1: TMenuItem;
    N5: TMenuItem;
    AbrirGaveta1: TMenuItem;
    N6: TMenuItem;
    CancelarCupomAtual1: TMenuItem;
    CancelarltimoCupom1: TMenuItem;
    CancelarItensemqualquerposio1: TMenuItem;
    TimerIni: TTimer;
    N7: TMenuItem;
    Consulta1: TMenuItem;
    AlternarentrenotadeServioeProduto1: TMenuItem;
    timerConsulta: TTimer;
    DescontonoItem1: TMenuItem;
    Memo1: TMemo;
    N8: TMenuItem;
    ConfirmarVenda1: TMenuItem;
    AcrscimonoItem1: TMenuItem;
    rocadeOperador1: TMenuItem;
    NaoSair1: TMenuItem;
    LerVendaRetaguarda1: TMenuItem;
    FileListBox1: TFileListBox;
    ResumodeVendas1: TMenuItem;
    MenuFiscal1: TMenuItem;
    EspelhoMFD: TMenuItem;
    N9: TMenuItem;
    DesligarMicro1: TMenuItem;
    AlterarPortadeComunicao1: TMenuItem;
    ManutenoHW1: TMenuItem;
    RecebimentodePrestao1: TMenuItem;
    daoosemitidos1: TMenuItem;
    OperaesTEF1: TMenuItem;
    N1: TMenuItem;
    Sintegra1: TMenuItem;
    AtualizaodoEstoque1: TMenuItem;
    RegistrosdeOrdemSerieeSubSerie1: TMenuItem;
    N10: TMenuItem;
    Ajuda1: TMenuItem;
    N11: TMenuItem;
    AtualizarcacheSistema1: TMenuItem;
    N12: TMenuItem;
    LeituraBalana1: TMenuItem;
    ConfigurarBalana1: TMenuItem;
    GT1: TMenuItem;
    CancelarDocumentoNoFiscal1: TMenuItem;
    SuporteRemoto1: TMenuItem;
    CorrigirdadosReduoZ1: TMenuItem;
    StatusBar1: TStatusBar;
    LerPrVendaRetaguarda1: TMenuItem;
    N13: TMenuItem;
    ContadeClientesAbertas1: TMenuItem;
    ConferenciadeContadeCliente1: TMenuItem;
    ContadeClientesAbertas2: TMenuItem;
    ConferenciadeContaCliente1: TMenuItem;
    ProgressBar1: TProgressBar;
    Timer4: TTimer;
    VerificarbancodeBackup1: TMenuItem;
    ArquivoLFDDF: TMenuItem;
    NotaFiscal1: TMenuItem;
    TrayIcon1: TTrayIcon;
    Panel13: TPanel;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    ldescricao: TPanel;
    Panel14: TPanel;
    eSubTotal: TEditMoeda;
    Panel15: TPanel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Panel16: TPanel;
    eVlUnit: TEditMoeda;
    Panel17: TPanel;
    Edit1: TEditFiscal;
    MovimentodoOperador1: TMenuItem;
    SelecionarTabeladePreo1: TMenuItem;
    InformarVendedor1: TMenuItem;
    UsarOrcamento1: TMenuItem;
    InformeCancelamentodeCupomFiscal1: TMenuItem;
    procedure InformeCancelamentodeCupomFiscal1Click(Sender: TObject);
    procedure UsarOrcamento1Click(Sender: TObject);
    procedure InformarVendedor1Click(Sender: TObject);
    procedure SelecionarTabeladePreo1Click(Sender: TObject);
    procedure MovimentodoOperador1Click(Sender: TObject);
    procedure MenuFiscal1Click(Sender: TObject);
    procedure NotaFiscal1Click(Sender: TObject);
    procedure ArquivoLFDDFClick(Sender: TObject);
    procedure VerificarbancodeBackup1Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure ConferenciadeContadeCliente1Click(Sender: TObject);
    procedure ContadeClientesAbertas1Click(Sender: TObject);
    procedure CorrigirdadosReduoZ1Click(Sender: TObject);
    procedure SuporteRemoto1Click(Sender: TObject);
    procedure CancelarDocumentoNoFiscal1Click(Sender: TObject);
    procedure GT1Click(Sender: TObject);
    procedure ConfigurarBalana1Click(Sender: TObject);
    procedure LeituraBalana1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure AtualizarcacheSistema1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure RegistrosdeOrdemSerieeSubSerie1Click(Sender: TObject);
    procedure AtualizaodoEstoque1Click(Sender: TObject);
    procedure Sintegra1Click(Sender: TObject);
    procedure NaoSair1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OperaesTEF1Click(Sender: TObject);
    procedure EspelhoMFDClick(Sender: TObject);
    procedure daoosemitidos1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RecebimentodePrestao1Click(Sender: TObject);
    procedure ManutenoHW1Click(Sender: TObject);
    procedure AlterarPortadeComunicao1Click(Sender: TObject);
    procedure DesligarMicro1Click(Sender: TObject);
    procedure ResumodeVendas1Click(Sender: TObject);
    procedure LerVendaRetaguarda1Click(Sender: TObject);
		procedure rocadeOperador1Click(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lBarraLeCodigo(Sender: TObject);
    procedure AcrscimonoItem1Click(Sender: TObject);
    procedure ConfirmarVenda1Click(Sender: TObject);
    procedure CancelarItensemqualquerposio1Click(Sender: TObject);
    procedure eSubTotalEnter(Sender: TObject);
    procedure eVlUnitEnter(Sender: TObject);
    procedure CancelarCupomAtual1Click(Sender: TObject);
    procedure DescontonoItem1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure timerConsultaTimer(Sender: TObject);
    procedure AlternarentrenotadeServioeProduto1Click(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure CancelarltimoCupom1Click(Sender: TObject);
    procedure AbrirGaveta1Click(Sender: TObject);
		procedure ReduoZ1Click(Sender: TObject);
    procedure DesativarHorriodeVero1Click(Sender: TObject);
    procedure AtivarHorriodeVero1Click(Sender: TObject);
    procedure SangriaSuprimentos1Click(Sender: TObject);
    procedure PesquisaServios1Click(Sender: TObject);
    procedure PesquisaProdutos1Click(Sender: TObject);
    procedure PesquisaClientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Timer2Timer(Sender: TObject);
    function iniciaFiscalSegundoPlano: boolean;
    function receberVendaDoRetaguarda(nped: integer; tipoVenda: string): boolean;
    function receberPrestacaoDoRetaguarda(pCred: integer): boolean;
    procedure LerPrVendaRetaguarda1Click(Sender: TObject);
    procedure ContadeClientesAbertas2Click(Sender: TObject);
    procedure ConferenciadeContaCliente1Click(Sender: TObject);
  private
    { Private declarations }
    //Enderecos de memoria para os pacores
    criado: integer;
    hdConfigF, hdTEF, hdlFormPag, hdAtivo, hdDavF, hdArqDig,
      hdArqDig1, hdTerminalF, hdNfSD: THandle;
    secao: integer;
    vtpVnd: Integer; // 1 = Verdadeiro; 2 = Falso
    nItens: word;
    nBarra: string;
    enter, vVendaCupomUsandoDav: Boolean;
    vConsulta, vProdServ, vPrecoAVista: string;
    altF4: boolean;
    function ConsultaItem(codigo: string): boolean;
    procedure desabilitaControles;
    procedure habilitaControles;
    function WindowsExit(RebootParam: Longword): Boolean;
    procedure manipulaMenus(visivel: boolean);
    procedure MostraAjuda(AjudaHtml: string); overload;
		procedure ShowForm;
		procedure ShowFormModoJ;
    procedure ShowFormModoS;
    procedure processaMensagem(var Msg: TMsg; var handled: boolean);
    function verificaCupomFiscalAbertoParaRemontagem: boolean;
    function enviaItemVenda(codBarra, descricaoItem: string; valorItem: Currency; pCodCliente, pCodVendedor: Integer; AItemOrcamento: TReg_PedVendaProd = nil): boolean;
    procedure iniciaFechamento(pMensagem: Boolean = True);
    function setDescontoAcrescimo(desconto, acrescimo: Currency): boolean;
    function formaPagamento(valor: Currency; codCliente: string): boolean;
    function cancelarVendasAnteriores(pNumVenda: Integer; pTipoVenda: string; pQuery: TIBQuery): Boolean;
    function emitirCupomPelaVenda(pNumVenda: Integer; pTipoVenda: string; pCancelarCupom: Boolean = False; pConfirmarExclusao: Boolean = True; pAntesDoZ: Boolean = False): Boolean;
  public
    { Public declarations }
  end;
  //pkFiscal TFrmPrincipalFiscal ºC24 ºZ24
var
  frmPrincipalFiscal: TfrmPrincipalFiscal;
  enterTela: TEnterHw;
  CImpressoraF: TImpressoraF;
  obCupom: TCupom;
  obResumoD: TResumoD;
  obCliente: TClienteF;
  obProd: TProdutoF;
  obServ: TServicoF;
  obSangSup: TSangSup;
  obComandos: TComandosImp;
  obFpg: TFormPG;
  obDocNF: TDoc_Nao_Fiscais;
  obIdentF: TIdentFiscal;
  obTermImp: TTerminal_Impressoras;

  obConfImp: TConfImp;
  obFinalizador: TFinalizador;
  obTotalizador: TTotalizadorNaoFiscal;
  obRecPrest: TRecebimentoPrestacao;
  obProcesso: TProcesso;
  obTecla: TTeclado;
  obTmpOp: TTempoOp;

  obTef: TTEF;
  hd: THandle;
  obEmpresa: TempresaF;
  hdEntrada, hdReestrutura: THandle;
  obCtrl: TControleF;
  obBalanca: TBalanca;
  thVerVndSemCupom : TVerificaVendasSemDadosCupom2;
  vDiretorioPadraoImg: string;

  //Objeto do Tipo Impressora

implementation

uses uConfiguracoes, funcoesF, IB, uPesqClientesF,
  uPesqProdutosF, uPesqServicosF, uComandosPDV, uSangSup,
  uDadosIni, uDtmFiscalHwF, uDtmFiscal, uEscTpPrec, uDescItem, uCancelarItens,
  udtmTef, uFechamento, uDtmConfigF, uDtmAtivo, uLerDavRet, uDtmDavF,
  uClasseDAVF, urelPeriodo, uManutencaoHw, uPrestacoesF, uDtmSincF,
  UDtmArqsDig, UAnexoVI, UClasseAdig, UAnexoV, UAnexoIVEst,
  uAlteraPrecoDescricao, UdtmTerminalF, UClassesFinalizadores, Mask,
  ShellAPI, uDeclaracaoSweda, uValor, uFileList, DateUtils,
  uLerPreVendaRet, uClassesRetaguarda, uDtmEntrada,
  uMovimentoOperador, uDataSet_OOP, uTabelaDePreco, StrUtils, Math, hw_utils;

function sistemaRegistrado(vcnpj, vSistema: string): LongBool; stdcall; external 'cons40.dll';

procedure closeallAuditoria ;stdcall; external 'auditoria.dll';

function validaChaveEmpresa(tipo, vBanco, vcodEmpresa: string): boolean; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TfrmPrincipalFiscal.AbrirGaveta1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit;

     if not vDadosIniF.PesqPros('FIS014', 'ABRIR','','','') then
      Exit;

    if Application.MessageBox('Atenção !!!' + #13 + 'Deseja Abrir Gaveta', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = IDNO then
      Exit;
      
    vDadosIniF.abreGaveta;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.AcrscimonoItem1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS017', 'ACRESCIMO','','CUPOM2',obCupom.dataSet.FieldByName('cupom').AsString) then
      exit;

    if not vDadosIniF.existeComando('2', True) then
      Exit;
    if ActiveControl = Edit1 then
    begin
      Application.CreateForm(TfrmDescItem, frmDescItem);
      frmDescItem.Caption := 'Acréscimo no Item';
      frmDescItem.Label1.Caption := 'Percentual de Acréscimo (%):';
      frmDescItem.Label2.Caption := 'Valor do Acréscimo (R$):';
      if frmDescItem.ShowModal = mrOk then
      begin
        obCupom.setAcrescimoPercenentual(frmDescItem.EditMoeda1.Valor);
        obCupom.setAcrescimoValor(frmDescItem.EditMoeda2.Valor);
        vDadosIniF.GravaAuditoria('FIS017','ACRESCIMO','','CUPOM2',obCupom.dataSet.FieldByName('cupom').AsString);
      end;
      frmDescItem.Free;
      frmDescItem := nil;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.Ajuda1Click(Sender: TObject);
begin
  inherited;
  MostraAjuda('index');
end;

procedure TfrmPrincipalFiscal.AlterarPortadeComunicao1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.alteraPortaCom;
end;

procedure TfrmPrincipalFiscal.AlternarentrenotadeServioeProduto1Click(
  Sender: TObject);
begin
  inherited;
  if vProdServ = 'P' then
  begin
    GroupBox1.Caption := 'Código do Serviço';
		vProdServ := 'S';
		obCupom.setDescontoPercenentual(0);
		obCupom.setAcrescimoPercenentual(0);
	end
	else
	begin
		GroupBox1.Caption := 'Código de Barras';
    vProdServ := 'P';
    obCupom.setDescontoPercenentual(0);
    obCupom.setAcrescimoPercenentual(0);
  end;
end;

procedure TfrmPrincipalFiscal.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  inherited;
  if E is EIBInterBaseError then
  begin
    if (vDadosIniF.vSistema = 'Fiscal') and
      (pos('Unable to complete network request to host', e.Message) > 0) then
    begin
      Application.MessageBox(pchar('Rede inacessivel.' + #13 +
        'Sistema será redirecionado para uso local'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      if not vDadosIniF.conectaBanco(dtmAtivo.bancoHw, vDadosIniF.vBancoHwF, True) then
      begin
        Application.MessageBox(pchar('Foi impossível conectar a base local. Contacte o suporte'),
          'Atenção', MB_ICONEXCLAMATION + MB_OK);
        Halt(0);
      end;
    end;
  end;
end;

procedure TfrmPrincipalFiscal.ArquivoLFDDFClick(Sender: TObject);
begin
  inherited;
  vDadosIniF.arquivoLFD;
end;

procedure TfrmPrincipalFiscal.AtivarHorriodeVero1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit;

    vDadosIniF.ativarHorarioVerao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.AtualizaodoEstoque1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    Application.CreateForm(TfrmRelPeriodo, frmRelPeriodo);
    frmRelPeriodo.MaskEdit1.Text := DateToStr(date);
    frmRelPeriodo.MaskEdit2.Text := DateToStr(date);
    if frmRelPeriodo.ShowModal = IDOK then
    begin
      if obVenda = nil then
        obVenda := TDAVF.create;
      if (vDadosIniF.bancoConectado <> 'local') then
      try
        if obTermImp = nil then
          obTermImp:= TTerminal_Impressoras.create;
//        obVenda.sincronizaCupomNoRetaguarda(StrToInt(vDadosIniF.vCodTerminal),
//          StrToInt(vDadosIniF.codEmpresa), frmRelPeriodo.MaskEdit1.Text,
//          frmRelPeriodo.MaskEdit2.Text, vDadosIniF.MensagemFiscal('Aguarde! Atualizando estoque.',
//          true));
        vHwSinc.ParamDataIni := frmRelPeriodo.MaskEdit1.Text;
        vHwSinc.ParamDataFim := frmRelPeriodo.MaskEdit2.Text;
        if vDadosIniF.vSincronizacaoEmSegundoPlano = 'S' then
          vHwSinc.Acao := 'estoque'
        else
        begin
          try
            vDadosIniF.abreStatusProcessamento('Sincronização', 'Atualizando Estoque');
            vHwSinc._atualizarEstoque;
          finally
            vDadosIniF.fechaStatusProcessamento;
          end;
        end;

        obTermImp.atualizaVariaveisEstoque(obVenda.buscas);
      finally
        obTermImp.Free;
        obTermImp:= nil;
        vDadosIniF.limpaMensagem;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.AtualizarcacheSistema1Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIniF.MensagemFiscal('Atualizando. Aguarde.');
    obCliente.CommitaTransacao;
    obCliente.Refresh;
    vDadosIniF.MensagemFiscal('Atualizando. Aguarde..');
    obProd.Refresh;
    vDadosIniF.MensagemFiscal('Atualizando. Aguarde..');
    obServ.Refresh;
    if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
      try
        vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
        vHwSinc._sincronizarDados;
      finally
        vDadosIniF.fechaStatusProcessamento;
      end;
  finally
    vDadosIniF.limpaMensagem;
  end;
end;

procedure TfrmPrincipalFiscal.CancelarCupomAtual1Click(Sender: TObject);
var
  vflagc: integer;
  vSubTotal: integer;
  cNumeroCupom: string;
  vSemCP: Boolean;
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;

		if obCupom.cancelarCupom <> 'S' then
    begin
      if not vDadosIniF.PesqPros('FIS004', 'CANCELAR','','CUPOM','')then
       exit;

      if vDadosIniF.semComunicacaoComECF('S') then
        Exit
      else if vDadosIniF.diferencaNoGrandeTotal('S') then
        Exit
      else if vDadosIniF.diferencaNoNumeroSerie('S') then
        Exit
      else if vDadosIniF.caixaFiscalFechado('S') then
        Exit;
    end;

    vSemCP := False;
    if Trim(obCupom.getNCupom) = '' then
    begin
			if not CImpressoraF.cupomAberto then
      begin
        Application.MessageBox('Não existe cupom fiscal aberto, tente utilizar o cancelamento do último cupom fiscal',
          'Atenção', 0 + 64);
        Exit;
      end;

			if obCupom.cancelarCupom <> 'S' then
			begin
				if Application.MessageBox('Sistema não tem dados do cupom. Continuar mesmo assim?',
					'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
					Exit;
				if not vDadosIniF.PesqPros('FIS048', 'CANCELAR','SEM DADOS DO CUPOM','CUPOM','')then
					Exit;
			end;
      vSemCP := True;
    end
    else
    begin
      if FloatToStr(StrToInt64(trim(CImpressoraF.NumeroCupom))) <>
        FloatToStr(StrToInt64(trim(obCupom.getNCupom))) then
        Exit;
    end;

    if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('teclado_PDV').AsString) <> 'S' then
      Application.MessageBox(pchar('Atenção !!!' + #13 + 'será Cancelado o Cupom Atual'),
        'Atenção', MB_ICONINFORMATION + MB_OK);
    vflagc := 0;
    vSubTotal := 0;
    if obCupom.emSubTotal then
      vSubTotal := 1;
    cNumeroCupom := CImpressoraF.NumeroCupom;

    if not CImpressoraF.CancelaCupom(vSubTotal) then
    begin
      exit;
    end
    else
    begin
      CImpressoraF.FechaPortaSerial;
      if not vSemCP then
      begin
        if obCupom.cupomExiste(StrToIntDef( Trim(cNumeroCupom), 0)) then
          obCupom.cancelarCupomFiscal;
        if FileExists(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe ') then
          WinExec(Pchar(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe' + cNumeroCupom), SW_SHOWNOACTIVATE);
      end;
      lMsg.Caption := '<<<< CAIXA LIVRE >>>>';
      Memo1.Clear;
      Edit1.Text := '';
      eVlUnit.Valor := 0;
      eSubTotal.Valor := 0;
//      Sair1.Enabled := true;
      //MenuFiscal1.Enabled := true;
      if vSemCP then
        vDadosIniF.GravaAuditoria('FIS004','CANCELAR',' SEM DADOS DO CUPOM ','CUPOM', cNumeroCupom)
      else
        vDadosIniF.GravaAuditoria('FIS004','CANCELAR','','CUPOM',obCupom.dataSet.FieldByName('cupom').AsString);

      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        try
          vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
          vHwSinc._sincronizarDados;
        finally
          vDadosIniF.fechaStatusProcessamento;
        end;
      if vDadosIniF.vVerificarHwfAutomatico <> 'N' then
        vConfImp.verificaHwF('');
    end;
    obProd.CommitaTransacao;
    obProd.IniciaTransacao;
    if obprod.dataSet.Active then
      obProd.dataSet.Refresh;

    if vDadosInif.vUsaTef = 'S' then
    begin
			try
        Edit1.Enabled := false;
        obTef.verificaOperacaoPendente(CImpressoraF);
      finally
        Edit1.Enabled := true;
      end;
    end;
    if Application.Tag = 999 then
      if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
      begin
        imgLogo.Proportional := false;
  	     imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
      end;
  finally
    if trim(Memo1.Lines.Text) = '' then
    begin
      //MenuFiscal1.Enabled := true;
      //Sair1.Enabled := true;
    end;
    obTef.forcaFocoNoSistema(Application.Handle);
    if Edit1.Enabled then
      Edit1.SetFocus;
    Timer1.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.CancelarDocumentoNoFiscal1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS036', 'CANCELAR','','CUPOM2',obCupom.dataSet.FieldByName('cupom').AsString) then
      exit;
      
    vDadosIniF.cancelaUltimoDocumentoNaoFiscal;
    AtualizarcacheSistema1.Click;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.CancelarItensemqualquerposio1Click(
  Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS003', 'CANCELAR','','CUPOM',obCupom.dataSet.FieldByName('cupom').AsString) then
      Exit;

    if vDadosIniF.cancelarItemDoCupom then
    begin
      Memo1.Lines.Add(vDadosIniF.PadR('CANC. ITEM:' +
        vDadosIniF.StrZeroDec(trunc(obCupom.vItem.getNItem), 3, 0), 30, ' ') + ' ' +
        vDadosIniF.PadL(FormatFloat('###,###,##0.000',
        (obCupom.vItem.dataSet.FieldByName('total').AsFloat)), 12, ' '));
      eSubTotal.Valor := obCupom.getSubTotal;
       vDadosIniF.GravaAuditoria('FIS003','CANCELAR','','CUPOM',obCupom.dataSet.FieldByName('cupom').AsString);
      if Application.Tag = 999 then
        if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
        begin
          imgLogo.Proportional := false;
   	    imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
        end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.CancelarltimoCupom1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS007', 'CANCELAR','','CUPOM','') then
      Exit;

    if obCupom.getSubTotal > 0 then
    begin
      CancelarCupomAtual1Click(sender);
      exit;
    end;
    if Application.MessageBox('Tem certeza que deseja cancelar o ultimo cupom?', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNO then
      exit;
    if vDadosIniF.cancelaUltimoCupomEmitido then
    begin
      CImpressoraF.FechaPortaSerial;
      //    obCupom.cancelarCupomFiscal;
      lMsg.Caption := '<<<< CAIXA LIVRE >>>>';
      Memo1.Clear;
      Edit1.Text := '';
      eVlUnit.Valor := 0;
      eSubTotal.Valor := 0;
//      Sair1.Enabled := true;
      //MenuFiscal1.Enabled := true;
      obCupom.dataSet.Last;
      vDadosIniF.GravaAuditoria('FIS007','CANCELAR','','CUPOM',obCupom.dataSet.FieldByName('cupom').AsString);

      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        try
          vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
          vHwSinc._sincronizarDados;
        finally
          vDadosIniF.fechaStatusProcessamento;
        end;
      if vDadosIniF.vVerificarHwfAutomatico <> 'N' then
        vConfImp.verificaHwF('');
      if Application.Tag = 999 then
        if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
        begin
          imgLogo.Proportional := false;
  	       imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
        end;
    end;
  finally
    Timer1.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

function TfrmPrincipalFiscal.cancelarVendasAnteriores(pNumVenda: Integer;
  pTipoVenda: string; pQuery: TIBQuery): Boolean;
var
  vLista: TStringList;
  I: Integer;
begin

  Result := true;

  pQuery.Close;
  pQuery.SQL.Text := 'with recursive' +
                     '  RECURSIVO1 as (' +
                     '    select pv1.nped,' +
                     '           pv1.tipo,' +
                     '           pv1.nped_originado nped_or,' +
                     '           pv1.tipo_originado tipo_or,' +
                     '           pv1.cod_empresa,' +
                     '           count(pv1.nped) as vCont' +
                     '    from pedvenda pv1' +
                     '    where pv1.cod_empresa = ' + vDadosIniF.codEmpresa + ' and pv1.nped_originado > 0 and pv1.status_ped = ''CANCELADO'' and coalesce(pv1.paf_status_prevenda, '''') = ''''' +
                     '    group by pv1.nped,  pv1.tipo, pv1.cod_empresa, pv1.nped_originado,  pv1.tipo_originado' +
                     '  ),' +
                     '  recursivo2 as (' +
                     '    select pv2.nped,' +
                     '           pv2.tipo,' +
                     '           pv2.cod_empresa' +
                     '    from pedvenda pv2' +
                     '    where pv2.nped = ' + IntToStr(pNumVenda) + ' and pv2.tipo = ' + QuotedStr(Trim(pTipoVenda))+ ' and pv2.cod_empresa = ' + vDadosIniF.codEmpresa +
                     '    union all' +
                     '    select pv3.nped,' +
                     '           pv3.tipo,' +
                     '           pv3.cod_empresa' +
                     '    from pedvenda pv3' +
                     '         join recursivo2 r2 on r2.nped = pv3.nped_originado and' +
                     '         r2.tipo = pv3.tipo_originado and r2.cod_empresa = pv3.cod_empresa' +
                     '  )' +
                     ' select v.nped,' +
                     '       v.tipo,' +
                     '       v.cod_empresa,' +
                     '       v2.nped_or,' +
                     '       v2.tipo_or,' +
                     '       v2.cod_empresa cod_empresa_or' +
                     ' from recursivo2 v' +
                     '     left join recursivo1 v2' +
                     '       on v2.nped  = v.nped and v2.tipo = v.tipo and v2.cod_empresa = v.cod_empresa' +
                     '       where not v2.nped_or is null';
  pQuery.Open;

  vLista:= TStringList.Create;
  vLista.Clear;

  pQuery.First;
  while not pQuery.Eof do
  begin
    vLista.Add(IntToStr(pQuery.FieldByName('nped').AsInteger) + '|' + Trim(pQuery.FieldByName('tipo').AsString) + '|');
    pQuery.Next;
  end;

  for I := 0 to vLista.Count - 1 do
    result := emitirCupomPelaVenda(StrToInt(vDadosIniF.getCampoPipe(vLista[I], 1)), vDadosIniF.getCampoPipe(vLista[I], 2), True, False);
end;

procedure TfrmPrincipalFiscal.ConferenciadeContaCliente1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.conferenciaContaCliente(0,0);
end;

procedure TfrmPrincipalFiscal.ConferenciadeContadeCliente1Click(
  Sender: TObject);
begin
  inherited;
  vDadosIniF.conferenciaContaCliente(0,0);
end;

procedure TfrmPrincipalFiscal.ConfigurarBalana1Click(Sender: TObject);
begin
  inherited;
  obBalanca.abreConfiguracaoBal;
end;

procedure TfrmPrincipalFiscal.ConfirmarVenda1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    obCupom.cancelarCupom := '';
    Edit1.Enabled := False;

    if obCupom.getSubTotal <= 0 then
    begin
      Application.MessageBox(pchar('Nenhum valor para fechar'), 'Informação', MB_ICONINFORMATION +
        MB_OK);
      exit;
    end;

    lMsg.Caption := 'Selecione o Cliente';
    if ((not obCliente.Active) or (obCliente.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
    begin
      try
        vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Clientes..');
        obCliente.getTodos;
      finally
        vDadosIniF.limpaMensagem;
      end;
    end;
    Application.CreateForm(TfrmFechamento, frmFechamento);
    obFinalizador.getTodosFiscal;
    obFinalizador.First;
    obCupom.setMemo(Memo1);
    frmFechamento.ShowModal;
    if frmFechamento.ModalResult = mrok then
    begin
      Memo1.Lines.Clear;
      eVlUnit.Valor := 0;
      lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
      if frmFechamento.mTroco.Valor > 0 then
        ldescricao.Caption := 'Troco: ' + frmFechamento.mTroco.Text
      else
        ldescricao.Caption := 'Obrigado! Volte Sempre!';
      Edit1.Text := '';
      eSubTotal.Valor := obCupom.getSubTotal;
      //MenuFiscal1.Enabled := true;
      //Sair1.Enabled := true;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        try
          vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
          vHwSinc._sincronizarDados;
        finally
          vDadosIniF.fechaStatusProcessamento;
        end;
      if vDadosIniF.vVerificarHwfAutomatico <> 'N' then
        vConfImp.verificaHwF('');
    end
    else if frmFechamento.ModalResult = mrAbort then
    begin
      CancelarCupomAtual1Click(Sender);
      lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
      ldescricao.Caption := '';
      Edit1.Text := '';
      eSubTotal.Valor := obCupom.getSubTotal;
    end;
    frmFechamento.Free;
    frmFechamento := nil;
    if Application.Tag = 999 then
      if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
      begin
        imgLogo.Proportional := false;
  	     imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
      end;
  finally
    obCupom.cancelarCupom := '';
    obProd.CommitaTransacao;
    obProd.IniciaTransacao;
    Edit1.Enabled := true;
    obTef.forcaFocoNoSistema(Application.Handle);
    Edit1.SetFocus;
    Screen.Cursor := crDefault;
    Timer1.Enabled := true;
  end;
end;

procedure TfrmPrincipalFiscal.Consulta1Click(Sender: TObject);
begin
  inherited;
  vConsulta := 'S';
  lMsg.Caption := 'Consulta de Itens';
end;

function TfrmPrincipalFiscal.ConsultaItem(codigo: string): Boolean;
begin
  Result := false;
	if (vProdServ = 'S') or (vProdServ = 'T') then
  begin
    if obServ.buscarServico(codigo) then
    begin
      if (obServ.alteraValorDescricaoServico) and (vDadosIniF.vSistema = 'Fiscal')
				and (vDadosIniF.vModoSistema <> 'S') and (vDadosIniF.vModoSistema <> 'J') and
        (vDadosIniF.vDescontoISS = 'S') then
      begin
        try
          Application.CreateForm(tfrmAltPreco, frmAltPreco);
          frmAltPreco.Label1.Caption := 'Valor do Serviço:';
          frmAltPreco.Label2.Caption := 'Descrição do Serviço:';
          frmAltPreco.EditMoeda1.Valor := obServ.getValorVendaItem;
          frmAltPreco.MaskEdit1.Text := obServ.getDescricao;
          if frmAltPreco.ShowModal = mrOk then
          begin
            if frmAltPreco.EditMoeda1.Valor > obServ.getValorVendaItem then
            begin
              obCupom.setAcrescimoPercenentual(0);
              obCupom.setAcrescimoValor((frmAltPreco.EditMoeda1.Valor -
                obServ.getValorVendaItem) * obServ.getQuantidade);
            end
            else if frmAltPreco.EditMoeda1.Valor < obServ.getValorVendaItem then
            begin
              obCupom.setDescontoPercenentual(0);
              obCupom.setDescontoValor((obServ.getValorVendaItem -
                frmAltPreco.EditMoeda1.Valor) * obServ.getQuantidade);
            end
            else
            begin
              obCupom.setDescontoPercenentual(0);
              obCupom.setDescontoValor(0);
            end;

            //            if not obServ.setValorItemAlterado(frmAltPreco.EditMoeda1.Valor) then
            //              exit;
            if not obServ.setValorDescricaoAlterado(frmAltPreco.MaskEdit1.Text) then
              exit;
          end;
        finally
          frmAltPreco.Free;
          frmAltPreco := nil;
        end;
      end;
      if (vDadosIniF.vDescontoISS = 'N') then
      begin
        obCupom.setDescontoPercenentual(0);
        obCupom.setDescontoValor(0);
      end;

      if (trim(obServ.getDescricao) = '') or (Length(trim(obServ.getDescricao)) = 1) then
      begin
        Application.MessageBox(pchar('Serviçco sem descrição'), 'Atenção', MB_ICONEXCLAMATION +
          MB_OK);
        Exit;
      end;
      if obServ.getValorVendaItem <= 0 then
      begin
        Application.MessageBox(pchar('Serviço sem valor de venda'), 'Atenção', MB_ICONEXCLAMATION
          +
          MB_OK);
        Exit;
      end;
      if obServ.getQuantidade <= 0 then
      begin
        Application.MessageBox(pchar('Serviço sem quantidade informada'), 'Atenção',
          MB_ICONEXCLAMATION + MB_OK);
        Exit;
      end;

      Result := true;
      eVlUnit.Valor := obServ.getValorVendaItem;
      ldescricao.Caption := obServ.getDescricao;
    end;
  end
  else
  begin
    if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('uspolprec').AsString) = 'S' then
    begin
      Application.CreateForm(TfrmEscPolPreco, frmEscPolPreco);
      if frmEscPolPreco.ShowModal = mrOK then
        if frmEscPolPreco.ComboBox1.ItemIndex = 1 then
          vPrecoAVista := 'N';
      FrmEscPolPreco.free;
    end;
    if obProd.buscarProduto(codigo, vPrecoAVista = 'S', vConsulta = 'S',
      vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('leitura_sup').AsString) = 'S',
      vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('MODELO_BALANCA').AsString) <> 'Nenhuma',
      (obCupom.vNumDAV > 0) or (obCupom.vNumPVenda > 0))  then
    begin
      try
        Application.CreateForm(tfrmAltPreco, frmAltPreco);
        if (obProd.alteraValorDescricaoProduto) and (vDadosIniF.vSistema = 'Fiscal')
          and (vDadosIniF.vModoSistema <> 'S') and (vDadosIniF.vModoSistema <> 'J') and
          (obCupom.vNumDAV = 0) and (obCupom.vNumPVenda = 0) and (not obProd.emPromocao) then
        begin
          frmAltPreco.EditMoeda1.Enabled := obProd.alteraValorProduto;
          frmAltPreco.MaskEdit1.Enabled := obProd.alteraDescricaoProduto;
          frmAltPreco.EditMoeda1.Valor := obProd.getValorVendaItem;
          frmAltPreco.MaskEdit1.Text := obProd.getDescricao;
          if frmAltPreco.ShowModal = mrOk then
          begin
            if (frmAltPreco.EditMoeda1.Valor > obProd.getValorVendaItem) and (obProd.alteraValorProduto) then
            begin
              obCupom.setAcrescimoPercenentual(0);
              obCupom.setAcrescimoValor( (frmAltPreco.EditMoeda1.Valor -
                obProd.getValorVendaItem ) * obProd.getQuantidade);
            end
            else if (frmAltPreco.EditMoeda1.Valor < obProd.getValorVendaItem) and (obProd.alteraValorProduto) then
            begin
              obCupom.setDescontoPercenentual(0);
              obCupom.setDescontoValor((obProd.getValorVendaItem -
                frmAltPreco.EditMoeda1.Valor) * obProd.getQuantidade);
            end
            else if obProd.alteraValorProduto then
            begin
              obCupom.setDescontoPercenentual(0);
              obCupom.setDescontoValor(0);
            end;
            //            if not obProd.setValorItemAlterado(frmAltPreco.EditMoeda1.Valor) then
            //              exit;
            if not obProd.setValorDescricaoAlterado(frmAltPreco.MaskEdit1.Text) then
              exit;
          end;
        end;
      finally
        frmAltPreco.Free;
        frmAltPreco := nil;
      end;

      if (trim(obProd.getDescricao) = '') or (Length(trim(obProd.getDescricao)) = 1) then
      begin
        Application.MessageBox(pchar('Produto sem descrição'), 'Atenção', MB_ICONEXCLAMATION +
          MB_OK);
        Exit;
      end;
      if obProd.getValorVendaItem <= 0 then
      begin
        Application.MessageBox(pchar('Produto sem valor de venda'), 'Atenção', MB_ICONEXCLAMATION
          +
          MB_OK);
        Exit;
      end;
      if obProd.getQuantidade <= 0 then
      begin
        Application.MessageBox(pchar('Produto sem quantidade informada'), 'Atenção',
          MB_ICONEXCLAMATION + MB_OK);
        Exit;
      end;

      Result := true;
      eVlUnit.Valor := obProd.getValorVendaItem;
      ldescricao.Caption := obProd.getNBarra + ' ' + obProd.getDescricao + ' ' + obProd.getUnidade;
      CImpressoraF.vFqtdDig := StrToInt(obProd.getCasasDecimaisVlUnit);
    end;
  end;
end;

procedure TfrmPrincipalFiscal.ContadeClientesAbertas1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.contasCLientesAbertas;
end;

procedure TfrmPrincipalFiscal.ContadeClientesAbertas2Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.contasCLientesAbertas;
end;

procedure TfrmPrincipalFiscal.CorrigirdadosReduoZ1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS038', 'ALT/INCL','','','')then
      exit;
    Application.CreateForm(TFrmRelPeriodo, frmRelPeriodo);
    frmRelPeriodo.Caption := 'Período para correção';
    if frmRelPeriodo.showmodal = mrOK then
    begin
      if (frmRelPeriodo.MaskEdit1.Text = '  /  /    ') or
        (frmRelPeriodo.MaskEdit2.Text = '  /  /    ') then
      begin
        application.messagebox(pchar('Período informado inválido'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK);
        exit;
      end;
      try
        StrToDate(frmRelPeriodo.MaskEdit1.Text);
        StrToDate(frmRelPeriodo.MaskEdit2.Text);
      except
        application.messagebox(pchar('Período informado inválido'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK);
        exit;
      end;
      if (YearOf(StrToDate(frmRelPeriodo.MaskEdit1.Text)) <>
        YearOf(StrToDate(frmRelPeriodo.MaskEdit2.Text)) ) and
        (MonthOf(StrToDate(frmRelPeriodo.MaskEdit1.Text)) <>
        MonthOf(StrToDate(frmRelPeriodo.MaskEdit2.Text)) ) then
      begin
        application.messagebox(pchar('Período informado inválido'+#13+
          'As datas devem estar dentro de um mês'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK);
        exit;
      end;
      
      if application.messagebox(pchar('Este processo pode ser demorado'+#13+
        'Deseja continuar?'), 'Atenção', MB_ICONQUESTION + MB_YESNO) = ID_NO then
        Exit;

      obResumoD.verificarDadosSintegraSPED(frmRelPeriodo.MaskEdit1.Text,
        frmRelPeriodo.MaskEdit2.Text);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.daoosemitidos1Click(Sender: TObject);
var
  ms: string;
begin
  inherited;
  try
    ms := lMsg.Caption;
    if obVenda = nil then
      obVenda := TDAVF.create;
    obVenda.selecionaVendasDAVEmitidos(date, date);
    lMsg.Caption := 'Aguarde! Imprimindo Relatório...';
    lMsg.Refresh;
    if not obVenda.dataSet.IsEmpty then
      vDadosIniF.ImpDAVOSEmitidos
    else
      exit;
  finally
    lMsg.Caption := ms;
  end;
end;

procedure TfrmPrincipalFiscal.desabilitaControles;
var
  I: Integer;
begin
//  for I := 0 to MainMenu1.Items.Count - 1 do
//  begin
//    MainMenu1.Items[i].Enabled := false;
//  end;
end;

procedure TfrmPrincipalFiscal.DesativarHorriodeVero1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit;

    if not vDadosIniF.desativarHorarioVerao then
      Application.MessageBox('Não foi possível desativar o Horário de Verão','Atenção',MB_OK+MB_ICONERROR);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.DescontonoItem1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS008', 'DESCONTO','','CUPOM2',obCupom.dataSet.FieldByName('cupom').AsString) then
      exit;
    
    if not vDadosIniF.existeComando('1', true) then
      Exit;
    if ActiveControl = Edit1 then
    begin
      Application.CreateForm(TfrmDescItem, frmDescItem);
      if (vProdServ = 'P') or ((vProdServ = 'S') and (vDadosIniF.vDescontoISS = 'S')) then
      begin
				if frmDescItem.ShowModal = mrOk then
				begin
					if frmDescItem.EditMoeda1.Valor >= 0 then
						obCupom.setDescontoPercenentual(frmDescItem.EditMoeda1.Valor);
					if frmDescItem.EditMoeda2.Valor >= 0 then
						obCupom.setDescontoValor(frmDescItem.EditMoeda2.Valor);
           vDadosIniF.GravaAuditoria('FIS008','DESCONTO','','CUPOM2',obCupom.dataSet.FieldByName('cupom').AsString);
        end;
        frmDescItem.Free;
        frmDescItem := nil;
      end
      else
        Application.MessageBox(pchar('Desconto em serviços não permitido para este ECF!'),
          'Informação', MB_ICONINFORMATION + mb_OK);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.DesligarMicro1Click(Sender: TObject);
begin
  inherited;
  WindowsExit(EWX_SHUTDOWN or EWX_FORCE);
end;

procedure TfrmPrincipalFiscal.Edit1Exit(Sender: TObject);
var
  v1: string;
  nQuant: Real;
  j: Integer;
  i: Integer;
  vrCusProd: Currency;
  fListImg: TStrings;
  vtemp: string;
  AItensNoOrcamento: TReg_PedVendaProdList;
  AQtdeSobra, AQtdeOrig, ARescueDescAcresP, ARescueDescAcresV: Double;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not enter then
    begin
      if Edit1.Enabled then
        Edit1.SetFocus;
      exit;
    end;
    if (trim(Edit1.Text) = '') or (copy(trim(Edit1.Text), 1, 1) = ' ') then
      exit;
    vPrecoAVista := 'S';
    if obBalanca.balancaAtiva then
    begin
      Timer3.Enabled := false;
      Timer3.Tag := 0;
      lMsg.Caption := '<<<< CAIXA ABERTO >>>>';
      if obBalanca.statusBalanca = 2 then
      begin
        Edit1.Text := ldescricao.Caption + '*' + trim(Edit1.Text);
        obBalanca.finalizaLeituraBalanca;
        ldescricao.Caption := '';
      end
      else
      begin
        ldescricao.Caption := '';
        if obBalanca.statusBalanca = 0 then
          lMsg.Caption := 'Falha ao comunicar com a balança'
        else if obBalanca.statusBalanca = 1 then
        begin
          lMsg.Caption := 'Peso oscilando! Espere estabilizar';
          Timer3.Enabled := true;
          Timer3.Tag := 1;
        end
        else if obBalanca.statusBalanca = 3 then
        begin
          lMsg.Caption := 'Sobrecarga de Peso ou Alivio de Plataforma.';
          Timer3.Enabled := true;
          Timer3.Tag := 1;
        end
        else if obBalanca.statusBalanca = 4 then
          lMsg.Caption := 'Erro lendo licensa do Software.';
        exit;
      end;
    end;
    nBarra := trim(Edit1.Text);
    if vConsulta = 'S' then
    begin
      ConsultaItem(nBarra);

      vConsulta := 'N';
      Application.MessageBox(pchar('Aperte OK para voltar'), 'Informação', MB_ICONINFORMATION +
        MB_OK);
      eVlUnit.Valor := 0;
			ldescricao.Caption := '';
			if CImpressoraF.SemDireitoDeUso then
				lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
			else if CImpressoraF.SemArquivoAux then
				lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
			else if vDadosIniF.statusCaixa = 0 then
				lMsg.Caption := '<<<< CAIXA ABERTO >>>>'
      else
        lMsg.Caption := '<<<< CAIXA FECHADO >>>>';
      Edit1.SetFocus;
      Exit;
    end;

    if not ConsultaItem(nBarra) then
    begin
      vDadosIniF.PesqPros('FIS001', 'PESQUISAR','','PRODUTOS','', nil, false);
      exit;
    end;

    if trim(obProd.dataSet.FieldByName('LISTA_IMAGENS').AsString) <> '' then
    begin
       try    
         fListImg := TStringList.Create;
         fListImg.Text := obProd.dataSet.FieldByName('LISTA_IMAGENS').AsString;
         if fListImg.Count > 0 then
         begin
           if trim(vDiretorioPadraoImg) = '' then
              vtemp := fListImg[0]
           else if vDadosIni.strIn(Copy(fListImg[0], 2, 1), ['\', ':']) then
              vtemp := fListImg[0]
           else
              vtemp := vDiretorioPadraoImg + fListImg[0];

           if FileExists(vtemp) then
           begin
             imgLogo.Proportional := true;
             imgLogo.Picture.LoadFromFile(vtemp);
             Application.Tag := 999;
           end;
         end;
       finally
         FreeAndNil(fListImg);
       end;
    end
    else if Application.Tag = 999 then
      if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
      begin
        imgLogo.Proportional := false;
     	  imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
      end;

    obCupom.vItem.vCodVendedor := obCupom.CodVendedor;

   //Verifica estoque disponivel.
    if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('conferir_estoque').AsString) = 'S') and
      (vProdServ = 'P') and (vDadosIniF.vTipoConexao <> 'off') then
      if not obProd.validaQuantidadeEmEstoque(obProd.getQuantidade + obCupom.vItem.GetQtdeItem(obProd.dataSet.FieldByName('grupo_prod').AsInteger, obProd.dataSet.FieldByName('cod_prod').AsString),
        vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('conferir_estoque').AsString) = 'S')
        then
      begin
        Edit1.SetFocus;
        exit;
      end;

    if Assigned(obCupom.Orcamento) then
      if vProdServ = 'P' then
      begin
        AQtdeOrig := obProd.getQuantidade;
        AItensNoOrcamento := obCupom.Orcamento_itensNoOrcamento(obProd, AQtdeSobra);
        if AItensNoOrcamento.Count > 0 then
        begin
          ARescueDescAcresP := obCupom.getDescontoAcrescimoPercenentual;
          ARescueDescAcresV := obCupom.getDescontoAcrescimoValor;

          //aqui zera o desconto e acrescimo tanto em valor e percentual, deixar estas duas linhas, são necessarias
          obCupom.setDescontoPercenentual(0);
          obCupom.setDescontoValor(0);

          for I := 0 to AItensNoOrcamento.Count - 1 do
            if AItensNoOrcamento.Items[I].aux_cp_orc.Qtde_ParaUsar > 0 then
            begin

              enviaItemVenda( FloatToStr(AItensNoOrcamento.Items[I].aux_cp_orc.Qtde_ParaUsar) + '*' +
                             'GRUPO|CODIGO|' + IntToStr(AItensNoOrcamento.Items[I].grupo_prod) + '|' +
                             Trim(AItensNoOrcamento.Items[I].cod_prod) + '|',
                             AItensNoOrcamento.Items[I].descr_prod_ped,
                             AItensNoOrcamento.Items[I].vlun_ped_item,
                             obCupom.Orcamento.cod_cliente,
                             AItensNoOrcamento.Items[I].cod_vendedor,
                             AItensNoOrcamento.Items[I]);
            end;

          //aqui zera o desconto e acrescimo tanto em valor e percentual, deixar estas duas linhas, são necessarias
          obCupom.setDescontoPercenentual(0);
          obCupom.setDescontoValor(0);
          ARescueDescAcresV := IfThen(ARescueDescAcresV <> 0, RoundTo(ARescueDescAcresV / AQtdeOrig, -2));

          if AQtdeSobra <= 0 then
            Exit
          else
          begin
            obProd.buscarProduto(FloatToStr(AQtdeSobra) + '*' +
                           'GRUPO|CODIGO|' + IntToStr(obProd.dataSet.FieldByName('grupo_prod').AsInteger) + '|' +
                           Trim(obProd.dataSet.FieldByName('cod_prod').AsString) + '|',
                           vPrecoAVista = 'S', vConsulta = 'S',
                           vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('leitura_sup').AsString) = 'S',
                           vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('MODELO_BALANCA').AsString) <> 'Nenhuma',
                           (obCupom.vNumDAV > 0) or (obCupom.vNumPVenda > 0));

            if ARescueDescAcresP > 0 then
              obCupom.setDescontoPercenentual(ARescueDescAcresP)
            else if ARescueDescAcresP < 0 then
              obCupom.setAcrescimoPercenentual(Abs(ARescueDescAcresP));

            if ARescueDescAcresV > 0 then
              obCupom.setDescontoValor(ARescueDescAcresV * AQtdeSobra)
            else if ARescueDescAcresV < 0 then
              obCupom.setAcrescimoValor(Abs(ARescueDescAcresV * AQtdeSobra));
          end;
        end;
      end;

    if vProdServ = 'P' then
    begin
      if not obCupom.validaDesconto(obConfImp.dataSet.FieldByName('max_desc_item').AsFloat,
        obProd.getValorVendaItem, obProd.getValorCustoProd, obProd.getMargemMinimaProduto) then
      begin
        Edit1.SetFocus;
        exit;
      end
    end
    else
    begin
      if not obCupom.validaDesconto(obConfImp.dataSet.FieldByName('max_desc_item').AsFloat,
        obServ.getValorVendaItem, 0, 0) then
      begin
        Edit1.SetFocus;
        exit;
      end
    end;

    if not CImpressoraF.cupomAberto then
    begin
      if not vDadosIniF.EnvCmdsCupom(3) then
				exit;

			if not obCupom.abreCupom(vDadosIniF.vCodUsuario, CImpressoraF.vFHoraEcf) then
			begin
				try
					obCupom.cancelarCupom := 'S';
					CancelarCupomAtual1.Click;
					Memo1.Lines.Clear;
					eVlUnit.Valor := 0;
					lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
					ldescricao.Caption := 'Obrigado! Volte Sempre!';
					Edit1.Text := '';
					eSubTotal.Valor := obCupom.getSubTotal;
				finally
					obCupom.cancelarCupom := '';
				end;
				Exit;
			end;
    end;
    // Definindo máscara da quantidade de acordo com a impressora...
    if vProdServ = 'P' then
      obProd.setCQuant(CImpressoraF.cMascQuant(obProd.getQuantidade)) //vDadosIniF.EnvCmdsCupom(4);
    else
      obServ.setCQuant(CImpressoraF.cMascQuant(obServ.getQuantidade)); //vDadosIniF.EnvCmdsCupom(4);

    //
    {ncodBarra := StrToCurr(nBarra);
    cBarra := cps.strzero(nCodbarra, 13, 0);
    cTotal := cps.strzero((nquant * npreco), 10, 2);
    delete(cTotal, 8, 1);       }

    //verificando o numero de serie da impressora
    if not vDadosIniF.EnvCmdsCupom(6) then
    begin
      //obCupom.somaTotal((-1) * (obCupom.getUltimoValor));
      {nTotal := nTotal - vultvl;
      Ltotal.Caption := FormatFloat('###,###,##0.00', nTotal);}
      exit;
    end;
    //envia venda do item para impressora
    if vProdServ = 'P' then
      if vDadosIniF.enviaVendaItemImpressora(obProd.getNBarra,
        CImpressoraF.MontaDescricao(obProd.getDescricao, obProd.getUnidade),
        obProd.getSitTributaria,
        obProd.getCQuant, StrToInt(obProd.getCasasDecimaisVlUnit), obProd.getValorVendaItem,
        obCupom.getDescontoAcrescimoPercenentual, obCupom.getDescontoAcrescimoValor,
        obProd.getQuantidade) then
      begin
				obCupom.vItem.vTipo_item := obProd.dataSet.FieldByName('tipo_item').AsString;

				if not obCupom.vendeItem(obProd.dataSet.FieldByName('grupo_prod').AsInteger,
					obProd.dataSet.FieldByName('cod_prod').AsString, obProd.getNBarra,
					obProd.getSitTributaria, CImpressoraF.MontaDescricao(obProd.getDescricao,
					obProd.getUnidade), obProd.getQuantidade,
					obProd.getValorVendaItem, obProd.getCasasDecimaisQtde, obProd.getCasasDecimaisVlUnit,
					obProd.getDescAliq, 'P') then
				begin
					try
						obCupom.cancelarCupom := 'S';
						CancelarCupomAtual1.Click;
						Memo1.Lines.Clear;
						eVlUnit.Valor := 0;
						lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
						ldescricao.Caption := 'Obrigado! Volte Sempre!';
						Edit1.Text := '';
						eSubTotal.Valor := obCupom.getSubTotal;
					finally
						obCupom.cancelarCupom := '';
					end;
					Exit;
				end;
				
        eSubTotal.Valor := obCupom.getSubTotal;
        Memo1.Lines.Add(lDescricao.caption);
        Memo1.Lines.Add(format('%6.3f', [obProd.getQuantidade]) + ' X ' + Format(' %10.3f',
          [obProd.getValorVendaItem]) + Format(' %10.2f', [CImpressoraF.getValorTotalComCasasDecimais(obProd.getValorVendaItem *
          obProd.getQuantidade)]));
        if (obCupom.getDescontoAcrescimoPercenentual > 0) or (obCupom.getDescontoAcrescimoValor > 0)
          then
          Memo1.Lines.Add('desconto ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obProd.getValorVendaItem *
            obProd.getQuantidade)]) + '    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]))
        else if (obCupom.getDescontoAcrescimoPercenentual < 0) or (obCupom.getDescontoAcrescimoValor
          < 0) then
          Memo1.Lines.Add('acréscimo ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obProd.getValorVendaItem *
            obProd.getQuantidade)]) + '    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]));

      end;
    if vProdServ = 'S' then
      if vDadosIniF.enviaVendaItemImpressora(obServ.getCodigo, obServ.getDescricao,
        obServ.getSitTributaria,
				obServ.getCQuant, StrToInt(obServ.getCasasDecimaisVlUnit), obServ.getValorVendaItem,
				obCupom.getDescontoAcrescimoPercenentual, obCupom.getDescontoAcrescimoValor,
				obServ.getQuantidade) then
			begin
				obCupom.vItem.vTipo_item := '09';
				obCupom.vItem.vUnidade := 'UN';

				if not obCupom.vendeItem(obServ.dataSet.FieldByName('cod_servico').AsInteger,
					obServ.dataSet.FieldByName('cod_servico').AsString, obServ.getCodigo,
					obServ.getSitTributaria, obServ.getDescricao, obServ.getQuantidade,
					obServ.getValorVendaItem, obServ.getCasasDecimaisQtde, obServ.getCasasDecimaisVlUnit,
					obServ.getDescAliq, 'S') then
				begin
					try
						obCupom.cancelarCupom := 'S';
						CancelarCupomAtual1.Click;
						Memo1.Lines.Clear;
						eVlUnit.Valor := 0;
						lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
						ldescricao.Caption := 'Obrigado! Volte Sempre!';
						Edit1.Text := '';
						eSubTotal.Valor := obCupom.getSubTotal;
					finally
						obCupom.cancelarCupom := '';
					end;
					Exit;
				end;

        eSubTotal.Valor := obCupom.getSubTotal;
        Memo1.Lines.Add(lDescricao.caption);
        Memo1.Lines.Add(format('%6.3f', [obServ.getQuantidade]) + ' X ' + Format(' %10.3f',
          [obServ.getValorVendaItem]) + Format(' %10.2f', [CImpressoraF.getValorTotalComCasasDecimais(obServ.getValorVendaItem *
          obServ.getQuantidade)]));
        if (obCupom.getDescontoAcrescimoPercenentual > 0) or (obCupom.getDescontoAcrescimoValor > 0)
          then
          Memo1.Lines.Add('desconto ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obServ.getValorVendaItem *
            obServ.getQuantidade)]) + '    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]))
        else if (obCupom.getDescontoAcrescimoPercenentual < 0) or (obCupom.getDescontoAcrescimoValor
          < 0) then
          Memo1.Lines.Add('acréscimo ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obServ.getValorVendaItem *
            obServ.getQuantidade)]) + '    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]));
      end;
  finally
    enter := false;
    eSubTotal.Refresh;
    eVlUnit.Refresh;
    ldescricao.Refresh;
    lMsg.Refresh;
    if Memo1.Lines.Text = '' then
    begin
      //Sair1.Enabled := false;
      //MenuFiscal1.Enabled := false;
    end;
    Screen.Cursor := crDefault;
    if Edit1.Enabled then
    begin
      Edit1.SetFocus;
      Edit1.SelectAll;
    end;
  end;
end;

procedure TfrmPrincipalFiscal.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  hdlFormPag: THandle;
  codCliente: integer;
begin
  inherited;
  enter := false;
	if Key = VK_RETURN then
	begin
		if CImpressoraF.SemDireitoDeUso then
			lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
		else if CImpressoraF.SemArquivoAux then
			lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
		else if (vDadosIniF.statusCaixa = 0) then
    begin
      try
        if vDadosIniF.semComunicacaoComECF('S') then
          Exit
        else if vDadosIniF.diferencaNoGrandeTotal('S') then
          Exit
        else if vDadosIniF.diferencaNoNumeroSerie('S') then
          Exit
        else if vDadosIniF.caixaFiscalFechado('S') then
          Exit;
        {if not vDadosIniF.verificaGrandeTotal then
        begin
          CImpressoraF.vPermitirVenda := false;
          Application.MessageBox(pchar('Operação Indisponível no momento!' + #13 +
            'Impressora não responde ou' + #13 +
            'Diferença no Grande Total acumulado'), 'Informação', MB_ICONINFORMATION + mb_OK);
          exit;
        end
        else if (vDadosIniF.EnvCmdsCupom(6)) and (CImpressoraF.vPermitirVenda) then}
          enter := true;
        if not vVendaCupomUsandoDav then
        begin
          Application.MessageBox('Emissão de cupom fiscal avulso não permitida quando o DAV ou Pré-Venda estão ativados! - [FIS049]', 'Atenção', 0 + 64);
          enter := False;
        end;
        Edit1Exit(Sender);
      finally
        if trim(Memo1.Lines.Text) = '' then
        begin
          //MenuFiscal1.Enabled := true;
          //Sair1.Enabled := true;
        end;
      end;
    end
    else
    begin
			lMsg.Caption := '<<<< CAIXA FECHADO >>>>';
    end;
  end;
end;

procedure TfrmPrincipalFiscal.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    if ((key >= #96) and (Key <= #105)) or
      ((Key >= #48) and (Key <= #57)) or
      (Key = #88) or (Key = #106) or
      (Key = #188) or (Key = #110) or
      (Key = #8) or (Key = #46) then
    else
      Key := #0;
  end;
end;

procedure TfrmPrincipalFiscal.eSubTotalEnter(Sender: TObject);
begin
  inherited;
  if Edit1.Enabled then
    Edit1.SetFocus;
end;

procedure TfrmPrincipalFiscal.eVlUnitEnter(Sender: TObject);
begin
  inherited;
  if Edit1.Enabled then
    Edit1.SetFocus;
end;

procedure TfrmPrincipalFiscal.FormActivate(Sender: TObject);
begin
  inherited;
  if Edit1.Enabled then
    Edit1.SetFocus;
end;

procedure TfrmPrincipalFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
	if (vDadosIniF.vRespModoSistema = '1') and (vDadosIniF.vModoSistema = 'J') then
  begin
    vDadosIniF.vFiscalAtivo := '';
    Action := caFree;
    frmPrincipalFiscal := nil;
    EXIT;
  end;
  if altF4 then
  begin
    altF4 := false;
    Action := caNone;
    Exit;
  end;
  if obCupom.cupomAberto then
		CancelarCupomAtual1Click(Sender);

  if Application.MessageBox(pchar('Deseja mesmo sair do sistema?'), 'Confirmação', MB_ICONQUESTION
    + MB_YESNO) = mrYes then
	begin
		_GravaConfiguracoesString('ClientHeight', IntToStr(ClientHeight));
		_GravaConfiguracoesString('ClientWidth', IntToStr(ClientWidth));
//		_GravaConfiguracoesString('WindowState', vDadosIniF.retornoPorCondicao( WindowState = wsMaximized, 'wsMaximized', 'wsNormal'));
		if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not vDadosIniF.strEstaContidoEm(vDadosIniF.vModoSistema, ['S', 'J'])) then
		else
			obTmpOp.registraSaidaOperador(vDadosIniF.vCodUsuario);
    if (vDadosIniF.vModoSistema <> 'S') and (vDadosIniF.vModoSistema <> 'J') then
    begin
      if vDadosIniF.vSincronizacaoEmSegundoPlano = 'S' then
        thSincronizacao.Terminate;
      closeallAuditoria;
      Application.Terminate;
      //    close;
      Abort;
    end;
  end
  else
  begin
    Action := caNone;
    Exit;
  end;
  //  lBarra.Desativar;
end;

procedure TfrmPrincipalFiscal.FormCreate(Sender: TObject);
var
  ProgressBarStyle: integer;
begin
  criado := 0;
  Application.Title := 'PAF-ECF';

  StatusBar1.Panels[2].Style := psOwnerDraw;
  ProgressBar1.Parent := StatusBar1;
  ProgressBarStyle := GetWindowLong(ProgressBar1.Handle, GWL_EXSTYLE);
  ProgressBarStyle := ProgressBarStyle - WS_EX_STATICEDGE;
  SetWindowLong(ProgressBar1.Handle, GWL_EXSTYLE, ProgressBarStyle);
  ProgressBar1.Visible := True;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := 0;
  ProgressBar1.Position := 0;
end;

procedure TfrmPrincipalFiscal.FormDestroy(Sender: TObject);
begin
  inherited;
  try
    CImpressoraF.FechaPortaSerial;
  except
  end;
  CImpressoraF.Free;
  CImpressoraF := nil;
end;

procedure TfrmPrincipalFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    if Key = VK_F1 then
      MostraAjuda('index')
    else if key = VK_F2 then
      PesquisaClientes1Click(Sender)
    else if (Key = VK_F3) and (vProdServ = 'P') then
      PesquisaProdutos1Click(Sender)
    else if (Key = VK_F4) and (vProdServ = 'S') then
      PesquisaServios1Click(Sender)
    else if Key = VK_F5 then
    begin
     {if Utilitrios1.Visible then
      begin
        if Memo1.Lines.Text <> '' then
        begin
          MenuFiscal1.Enabled := False;
          Sair1.Enabled := False;
        end;
      end
      else
      begin
        MenuFiscal1.Enabled := True;
        Sair1.Enabled := True;
        if Memo1.Lines.Text <> '' then
        begin
          MenuFiscal1.Enabled := False;
          Sair1.Enabled := False;
        end;
      end;}
    end
    else if key = VK_F6 then
      CancelarItensemqualquerposio1Click(Sender)
    else if key = VK_F7 then
      CancelarCupomAtual1Click(Sender)
    else if key = VK_F8 then
      CancelarltimoCupom1Click(Sender)
    else if key = VK_F9 then
      Sair1Click(Sender)
    else if ( (ssShift in Shift) and (Key = VK_F10)) then
      UsarOrcamento1.Click
    else if (Key = VK_F10) and (InformarVendedor1.Visible) then
      InformarVendedor1.Click
    else if (key = VK_F10) or (key = VK_F11) then
      ConfirmarVenda1Click(sender)
    else if (key = VK_F12) and (vProdServ = 'P') then
      DescontonoItem1Click(Sender);
  finally
    //    Edit1.SetFocus;
    //    ShowMessage(ActiveControl.Name);
  end;
end;

procedure TfrmPrincipalFiscal.FormShow(Sender: TObject);
var
  a: integer;
  vDtAtEst: string;
begin
	Application.Title := 'PAF-ECF';
  try
    inherited;
    if vDadosIniF = nil then
      ShowForm
		else if vDadosIniF.vModoSistema = 'J' then
		begin
      vDadosIniF.vSincronizacaoEmSegundoPlano := 'N';
      vDadosIniF.vTipoConexao := 'on';
			if criado = 0 then
				ShowFormModoJ;
    end
    else if vDadosIniF.vModoSistema = 'S' then
    begin
      if criado = 0 then
        ShowFormModoS;
      vDadosIniF.vSincronizacaoEmSegundoPlano := 'N';
    end;
    if criado = 0 then
      vDadosIni.hw_registra_estatistica(Self.Name);
    criado := 1;
    vVendaCupomUsandoDav := True;
    if vDadosIniF.vEmp.vUsarDAV = 'S' then
      try
        vDadosIniF.vInibeMensPesqPros := 'S';
        vVendaCupomUsandoDav := vDadosIniF.PesqPros('FIS049', 'HABILITAR', '', '', '', nil, False);
      finally
        vDadosIniF.vInibeMensPesqPros := 'N';
      end;

    try
      vDadosIniF.MensagemFiscal('Ativando sincronização');
      vHwSinc._setEnviadoRetA;
      if vDadosIniF.vSincronizacaoEmSegundoPlano = 'S' then
      begin
        thSincronizacao := threadSincronizacao2.Create(True);
        vHwSinc.Acao := 'estoqueI';
      end;
      thVerVndSemCupom := TVerificaVendasSemDadosCupom2.Create(True);
      try
        vDtAtEst := Trim(vDadosIniF._LerConfiguracoesRegistroString('DataAtEstoque'));
        if vDtAtEst <> '' then
        begin
          try
            vDtAtEst := DateToStr(StrToDate(vDtAtEst));
          except
            vDtAtEst := DateToStr(Date - 1);
          end;
        end
        else if DayOfWeek(Date) = 3 then
          vDtAtEst := DateToStr(Date - 3)
        else
          vDtAtEst := DateToStr(Date - 1);
        vHwSinc.ParamDataIni := vDtAtEst;
        vHwSinc.ParamDataFim := DateToStr(Date);
        if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        begin
          vDadosIniF.MensagemFiscal('Sincronizando. Aguarde');
          vHwSinc._sincronizarDados;
          vHwSinc._atualizarEstoque(True);
        end;
      except
      end;
    finally
      vDadosIniF.limpaMensagem;
    end;
    vDiretorioPadraoImg := IncludeTrailingPathDelimiter(vDadosIniF.getConfSisStr('prod_cad_diretorio_padrao_imagens', dtmAtivo.qrAudit));

    StatusBar1.Visible := True;
    StatusBar1.Panels[0].Text := ' Arquivo Anexo III COTEPE/ICMS 09/13: '+
    ExtractFilePath(Application.ExeName)+'MD5.txt - MD-5:'+
      UpperCase(vDadosIniF.md5Arquivo(ExtractFilePath(Application.ExeName)+'MD5.txt') );
		StatusBar1.Panels[0].Width := 800;

    ArquivoLFDDF.Visible := vDadosIniF.vEmp.vSiglaUF = 'DF';
		ArquivoLFDDF.Enabled := vDadosIniF.vEmp.vSiglaUF = 'DF';
		MovimentodoOperador1.Visible := (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not vDadosIniF.strEstaContidoEm(vDadosIniF.vModoSistema, ['S', 'J']));

    Panel9.Caption := '(F10) Desconto / Acréscimo';
    if vDadosIniF.vTipoConexao = 'on' then
      if vDadosIni.getConfSisBool('paf_ecf_alterar_vendedor', dtmAtivo.qrAudit) then
      begin
        Panel9.Caption := '(F10) Informar Vendedor';
        InformarVendedor1.Visible := True;
      end;

//		if _LerConfiguracoesRegistroString('WindowState') <> 'wsMaximized' then
//		begin
//			WindowState := wsNormal;
//			if StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600) < 600 then
//				ClientHeight := 600
//			else
//				ClientHeight := StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600);
//			if StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800) < 800 then
//				ClientWidth := 800
//			else
//				ClientWidth := StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800);
//		end;
  finally
		vDadosIniF.fechaStatusProcessamento;
    if vDadosIniF.vSincronizacaoEmSegundoPlano = 'S' then
      if thSincronizacao <> nil then
        if thSincronizacao.Suspended then
          thSincronizacao.Resume;
    if thVerVndSemCupom <> nil then
      if thVerVndSemCupom.Suspended then
        thVerVndSemCupom.Resume;
  end;
end;

procedure TfrmPrincipalFiscal.GT1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.acumulaGrandeTotal(0);
end;

procedure TfrmPrincipalFiscal.habilitaControles;
var
  I: Integer;
begin
//  for I := 0 to MainMenu1.Items.Count - 1 do
//  begin
//    MainMenu1.Items[i].Enabled := True;
//  end;
end;

procedure TfrmPrincipalFiscal.InformarVendedor1Click(Sender: TObject);
var
  ATextOut: string;
begin
  inherited;
  if Assigned(obCupom.Orcamento) then
  begin
    vDadosIniF.ShowAtencao('Orçamento selecionado, vendedor não pode ser alterado');
    Exit;
  end;
  if Memo1.Lines.Count = 1 then
    Memo1.Lines.Clear;
  obCupom.setCodVendedor(0, ATextOut);
  if ATextOut <> '' then
    Memo1.Lines.Add(ATextOut);
end;

procedure TfrmPrincipalFiscal.InformeCancelamentodeCupomFiscal1Click(
  Sender: TObject);
var
  Texto: string;
  Numero: Integer;
begin
  inherited;

  if not vDadosIniF.PesqPros('FIS057', 'CANCELAR','','CUPOM','') then
    Exit;

  Texto := '0';

  ShowAtencao('Atenção! A ECF somente permite cancelar o último cupom fiscal' + sLineBreak + sLineBreak +
              'Esse cancelamento é feito apenas no banco de dados' + sLineBreak +
              'Deve ser utilizado nos casos em que a ECF não retornou o cancelamento para o sistema');

  if not InputQuery('Numero do cupom fiscal COO', 'Informe o número do cupom que deseja cancelar', Texto) then
    Exit;

  if not TryStrToInt(Texto, Numero) then
  begin
    ShowAtencao('Número inválido');
    Exit;
  end;

  obCupom.InformeCancelamentoCupomFiscal(Numero);

end;

procedure TfrmPrincipalFiscal.lBarraLeCodigo(Sender: TObject);
begin
	inherited;
	if vDadosIniF.vUsaLeitorSerial = 'S' then
		if CImpressoraF.SemDireitoDeUso then
			lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
		else if CImpressoraF.SemArquivoAux then
			lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
		else if vDadosIniF.statusCaixa = 0 then
		begin
			//      Edit1.Text := lBarra.UltimoCodigo;
			enter := true;
			Edit1Exit(Sender);
		end
		else
		begin
			lMsg.Caption := '<<<< CAIXA FECHADO >>>>';
    end;
end;

procedure TfrmPrincipalFiscal.LeituraBalana1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if obBalanca.InteracaoDLL then
    begin
      Edit1.Text := obBalanca.getLeituraInteracaoDll;
      enter := True;
      Edit1Exit(Edit1);
      Exit;
    end;

    if Timer3.Tag = 0 then
    begin
      Timer3.Enabled := obBalanca.iniciaLeituraBalanca;
      if Timer3.Enabled then
        Timer3.tag := 1;
      lMsg.Caption := 'Lendo peso na balança';
    end
    else
    begin
      obBalanca.finalizaLeituraBalanca;
      Timer3.Enabled := false;
			Timer3.tag := 0;
			if CImpressoraF.SemDireitoDeUso then
				lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
			else if CImpressoraF.SemArquivoAux then
				lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
			else if vDadosIniF.statusCaixa = 0 then
				lMsg.Caption := '<<<< CAIXA ABERTO >>>>'
			else
				lMsg.Caption := '<<<< CAIXA FECHADO >>>>';
      ldescricao.Caption := '';
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.LerPrVendaRetaguarda1Click(Sender: TObject);
var
  somaForma, somaVenda: Currency;
  temDinheiro, temCartao: boolean;
  nCupom, quantidade: string;
  vValorItens: Currency;
  codBarra: string;
  vTemProd, vTemServ: Boolean;
  vSubTotal: Integer;
  vShowModal: Integer;

  vNumVenda: Integer;
  vTipoVenda: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

  finally
    Screen.Cursor := crDefault;
  end;

  if vDadosIniF.bancoConectado = 'local' then
  begin
    Application.MessageBox('Sem conexão com o servidor','Atenção',0+64);
    Exit;
  end;
  Application.CreateForm(TfrmLerPreVendaRet, frmLerPreVendaRet);
  if obPreVenda = nil then
    obPreVenda := TPreVendaRetaguarda.create;
  if obCtrl = nil then
    obCtrl := TControleF.create;
  obPreVenda.desmarcaVendaParaCupom;
  temDinheiro := false;
  temCartao := false;
  somaForma := 0;
  somaVenda := 0;
  try
    Screen.Cursor := crHourGlass;
    desabilitaControles;
    obPreVenda.selecionaVendasParaCupomDiaAtual(0,0);

    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
    vShowModal := frmLerPreVendaRet.ShowModal;
    vNumVenda := obPreVenda.dataSet.FieldByName('NPED').AsInteger;
    vTipoVenda := Trim(obPreVenda.dataSet.FieldByName('TIPO').AsString);
    if vShowModal = mrAbort then
    begin
      if cancelarVendasAnteriores(vNumVenda, vTipoVenda, obPreVenda.getQueryRetaguarda) then
        emitirCupomPelaVenda(vNumVenda, vTipoVenda, True)
    end
    else if vShowModal = mrOk then
    begin
      if cancelarVendasAnteriores(vNumVenda, vTipoVenda, obPreVenda.getQueryRetaguarda) then
        emitirCupomPelaVenda(vNumVenda, vTipoVenda, False, False);
    end;

    if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
      try
        vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
        vHwSinc._sincronizarDados;
      finally
        vDadosIniF.fechaStatusProcessamento;
      end;
    if vDadosIniF.vVerificarHwfAutomatico <> 'N' then
      vConfImp.verificaHwF('');



    exit;





      if Application.MessageBox('Deseja mesmo Cancelar a Pré-Venda', 'Confirmação', MB_ICONQUESTION +
        MB_YESNO) <> IDYES then
        vShowModal := mrCancel;
    if (vShowModal = mrOK) or (vShowModal = mrAbort) then
    begin
      obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
      obPreVenda.selecionaVendasParaCupom(obPreVenda.dataSet.FieldByName('NPED').AsInteger,
        obPreVenda.dataSet.FieldByName('tipo').AsString);
      if obPreVenda.dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Venda não encontrada ou ja emitido cupom fiscal'),
          'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      obPreVenda.vItem.selecionaItensDaVenda(obPreVenda.dataSet.FieldByName('nped').AsInteger,
        obPreVenda.dataSet.FieldByName('tipo').Asstring);
      obPreVenda.vItem.dataSet.First;
      if obPreVenda.dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Venda sem itens'),'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      vTemProd := False; vTemServ := False;
      while not obPreVenda.dataSet.Eof do
      begin
        if not vTemServ then
          if obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S' then
            vTemServ := True;

        if not vTemProd then
          if obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P' then
            vTemProd := True;
        if vTemProd then
        begin
          obPreVenda.vItem.dataSet.First;
          Break;
        end;
        obPreVenda.dataSet.Next;
      end;
      if (not vTemProd) and (vTemServ) then
        if (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString <> 'S') then
        begin
          Application.MessageBox(pchar('Venda possui apenas serviços. Sistema não configurado para emitir cupom de serviço'),'Atenção',
            MB_OK + MB_ICONWARNING);
          Exit;
        end;

      if (obPreVenda.dataSet.FieldByName('tipv').AsString <> 'V') then
        if not vDadosIniF.PesqPros('FIS050', 'VALIDAR',
          Trim(obPreVenda.dataSet.FieldByName('TIPO').AsString) + ' ' +
          Trim(obPreVenda.dataSet.FieldByName('NPED').AsString) + ' TIPV ' +
          Trim(obPreVenda.dataSet.FieldByName('TIPV').AsString), 'PEDVENDA',
          obPreVenda.dataSet.FieldByName('NPED').AsString) then
        begin
          Application.MessageBox(pchar('Tipo de Venda diferente de "V - Varejo" dever ser permitida pelo processo "FIS050"'),'Atenção',
            MB_OK + MB_ICONWARNING);
          Exit;
        end;

      if not obPreVenda.marcarVendaParaCupom then
      begin
        Application.MessageBox(pchar('Venda travada por outro usuário'), 'Atenção',
          MB_ICONEXCLAMATION + MB_OK);
        Exit;
      end;
      obFinalizador.getTodos;
      obFinalizador.IndexFieldNames := 'cod_finalizador';
      obPreVenda.vFrmPg.selecionaFormaPagamento(trim(obPreVenda.dataSet.FieldByName('tipo').AsString),
        obPreVenda.dataSet.FieldByName('nped').AsInteger);

      obPreVenda.vFrmPg.First;
      somaForma := 0;
      if (vShowModal = mrOK) then
        while not obPreVenda.vFrmPg.Eof do
        begin
          somaForma := somaForma + obPreVenda.vFrmPg.dataSet.FieldByName('valordoc').AsCurrency;
          obCtrl.selecionaControle(obPreVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger);
          obFinalizador.FindNearest([obCtrl.dataSet.FieldByName('cod_finalizador').AsString]);
          if (obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
            obFinalizador.dataSet.FieldByName('cod_finalizador').AsString) and
            (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger = 0) then
            temDinheiro := true
          else if (obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
            obFinalizador.dataSet.FieldByName('cod_finalizador').AsString) and
            (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger > 0) then
            temCartao := true;
          obPreVenda.vFrmPg.Next;
        end;

      obPreVenda.vItem.selecionaItensDaVenda(obPreVenda.dataSet.FieldByName('nped').AsInteger,
        obPreVenda.dataSet.FieldByName('tipo').asstring);
      obPreVenda.vItem.First;
      while not obPreVenda.vItem.dataset.Eof do
      begin
        if Trim(obPreVenda.vItem.dataSet.FieldByName('status').AsString) <> 'CANCELADO' then
        if (
          ((obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S'))
          or
          ((obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'T') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S')
          )
          ) or
          (obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') then
          somaVenda := somaVenda + (obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
            obPreVenda.vItem.dataSet.FieldByName('QTDE').AsFloat) +
            obPreVenda.vItem.dataSet.FieldByName('rateio_acresc').AsCurrency -
            obPreVenda.vItem.dataSet.FieldByName('rateio_desc').AsCurrency;
        obPreVenda.vItem.dataSet.Next;
      end;

      if (temDinheiro) and (temCartao) and (somaForma > somaVenda) then
      begin
        Application.MessageBox(pchar('Forma de pagamento excede o valor do cupom. ' + #13 +
          'Dinheiro e Cartão foram informados'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        obPreVenda.desmarcaVendaParaCupom;
        Exit;
      end
      else if (temCartao) and (somaForma > somaVenda) then
      begin
        Application.MessageBox(pchar('Forma de pagamento excede o valor do cupom. ' + #13 +
          'Cartão foi informado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        obPreVenda.desmarcaVendaParaCupom;
        Exit;
      end;
      if (vDadosIniF.vDescontoISS = 'N') and
        (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') then
      begin
        if obPreVenda.verificaDescontoMaiorQueSomaDosItens then
        begin
          Application.MessageBox(pchar('Impressora configurada para não aceitar desconto de ISS'
            + #13 +
            'Valor do desconto maior que a soma de produtos'), 'Atenção', MB_ICONEXCLAMATION +
            MB_OK);
          obPreVenda.desmarcaVendaParaCupom;
          Exit;
        end;
        obPreVenda.vItem.First;
        while not obPreVenda.vItem.dataSet.Eof do
        begin
          if (obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S') then
          begin
            if obPreVenda.vItem.dataSet.FieldByName('rateio_desc').AsFloat > 0 then
            begin
              Application.MessageBox(pchar('Existem serviços com desconto. Impressora configurada para não aceitar desconto de ISS'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
              obPreVenda.desmarcaVendaParaCupom;
              Exit;
            end;
          end;
          obPreVenda.vItem.Next;
        end;
      end;

      obCupom.setNPreVND(obPreVenda.dataSet.FieldByName('paf_num_prevenda').AsInteger,
        obPreVenda.dataSet.FieldByName('nped').AsInteger,
        obPreVenda.dataSet.FieldByName('data_fech').AsDateTime,
        obPreVenda.dataSet.FieldByName('valor_total').AsCurrency);
      vValorItens := 0;
      obPreVenda.vItem.First;
      while not obPreVenda.vItem.Eof do
      begin
        vProdServ := obPreVenda.vItem.dataSet.FieldByName('tipo').AsString;
        quantidade := obPreVenda.vItem.dataSet.FieldByName('qtde').AsString;
        obProd.CustoMedio := obPreVenda.vItem.dataSet.FieldByName('PCUST_MC').AsFloat;
        if (obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') then
          codBarra := 'GRUPO|CODIGO|' + IntToStr(obPreVenda.vItem.dataSet.FieldByName('GRUPOOUSERV').AsInteger) + '|' +
            Trim(obPreVenda.vItem.dataSet.FieldByName('cod_prod').AsString) + '|'
        else
          codBarra := trim(obPreVenda.vItem.dataSet.FieldByName('num_fab_prod').AsString);
        if ((
          ((obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obPreVenda.OSPermiteCupom))
          or
          ((obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'T') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obPreVenda.OSPermiteCupom))
          ) or
          (obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P')) and
          (obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency > 0) then
        begin
          Edit1.Text := quantidade + '*' + codBarra;
          eVlUnit.Valor := obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency;
          if not enviaItemVenda(quantidade + '*' + codBarra,
            trim(obPreVenda.vItem.dataSet.FieldByName('DESCR').AsString),
            (obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency),
            obPreVenda.dataSet.FieldByName('cod_cliente').AsInteger,
              vDadosIniF.retornoPorCondicao(obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'T',
                obPreVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger,
                obPreVenda.vItem.dataSet.FieldByName('COD_VENDEDOR').AsInteger)
            ) then
          begin
            if obCupom.getSubTotal > 0 then
              CancelarCupomAtual1Click(sender);
            obPreVenda.desmarcaVendaParaCupom;
            exit;
          end;
          nCupom := obCupom.getNCupom;
          if Trim(obPreVenda.vItem.dataSet.FieldByName('status').AsString) = 'CANCELADO' then
          begin
            if vDadosIniF.EnvCmdsCupom(17) then
              if obCupom.cancelaItem then
              begin
                Memo1.Lines.Add(vDadosIniF.PadR('CANC. ITEM:' +
                  vDadosIniF.StrZeroDec(trunc(obCupom.vItem.getNItem), 3, 0), 30, ' ') + ' ' +
                  vDadosIniF.PadL(FormatFloat('###,###,##0.000',
                  (obCupom.vItem.dataSet.FieldByName('total').AsFloat)), 12, ' '));
                eSubTotal.Valor := obCupom.getSubTotal;
                 vDadosIniF.GravaAuditoria('FIS003','CANCELAR','','CUPOM',obCupom.dataSet.FieldByName('cupom').AsString);
              end;
          end
          else
            vValorItens := vValorItens + obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
              obPreVenda.vItem.dataSet.FieldByName('qtde').AsFloat;
        end;
        obPreVenda.vItem.Next;
      end;
      obCupom.tipoVenda := obPreVenda.dataSet.FieldByName('tipo').AsString;
      iniciaFechamento;
      obPreVenda.BuscarDadosCliente;
      obCupom.setDadosAvulso(obPreVenda.DadosCliente.NomeClienteImp,
                             obPreVenda.DadosCliente.Endereco,
                             obPreVenda.DadosCliente.Bairro,
                             obPreVenda.DadosCliente.Cidade,
                             obPreVenda.DadosCliente.Estado,
                             obPreVenda.DadosCliente.CpfCnpj, '','',
                             obPreVenda.DadosCliente.NomeClienteGravar);
      obCliente.selecionaCliente(obPreVenda.dataSet.FieldByName('cod_cliente').AsInteger);
      {obCupom.setDadosAvulso(obPreVenda.dataSet.FieldByName('cod_cliente').AsString + ' '+
      obCliente.dataSet.FieldByName('nome_cliente').AsString,
        Trim(obCliente.dataSet.FieldByName('endereco').AsString) + ', ' +
        obCliente.dataSet.FieldByName('num_end_cliente').AsString,
        obCliente.dataSet.FieldByName('bairro').AsString,
        obCliente.dataSet.FieldByName('cidade').AsString,
        obCliente.dataSet.FieldByName('sigla_uf').AsString,
        obCliente.dataSet.FieldByName('cpfcgc').AsString, '', '',
        obCliente.dataSet.FieldByName('nome_cliente').AsString);}

      if vValorItens > somaVenda then
        setDescontoAcrescimo(vValorItens - somaVenda, 0)
      else//Quando existir acrescimo o valor do acrescimo ja foir somado no valor do item, entao nao vai ter no subtotal o valor do acreescimo
          //Foi definido na tabela sinccopativelhw que o rateio_acresc nao sera enviado para o pedvenda_prod
        setDescontoAcrescimo(0, somaVenda - vValorItens);//setDescontoAcrescimo(0, 0);//setDescontoAcrescimo(0, somaVenda - vValorItens);
      //      setDescontoAcrescimo(obPreVenda.dataSet.FieldByName('desconto').AsCurrency,
      //        obPreVenda.dataSet.FieldByName('acrescimo').AsCurrency);
      if (vShowModal = mrAbort) then
      begin
        if formaPagamento(obCupom.getSubTotal, obPreVenda.dataSet.FieldByName('cod_cliente').AsString) then
        begin

          vSubTotal := 0;
          if obCupom.emSubTotal then
            vSubTotal := 1;

          if not CImpressoraF.CancelaCupom(vSubTotal) then
            exit
          else
          begin
            CImpressoraF.FechaPortaSerial;
            obCupom.cancelarCupomFiscal;
          end;
          obProd.CommitaTransacao;
          obProd.IniciaTransacao;
          if obprod.dataSet.Active then
            obProd.dataSet.Refresh;

          obPreVenda.cancelarPreVenda;
          obPreVenda.desmarcaVendaParaCupom;
          lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
          ldescricao.Caption := '';
          Edit1.Text := '';
          Memo1.Clear;
          eSubTotal.Valor := obCupom.getSubTotal;
          eVlUnit.Valor := 0;
        end;
        exit;
      end
      else
      begin
        if (not temCartao) or ((vDadosIniF.vUsaTef <> 'E') and (vDadosIniF.vUsaTef <> 'I')) then
        begin
        obPreVenda.vFrmPg.First;
        while not obPreVenda.vFrmPg.Eof do
        begin
          obCtrl.selecionaControle(obPreVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger);
          if (not obCtrl.dataSet.IsEmpty) and (obCtrl.dataSet.FieldByName('cod_finalizador').AsInteger
            <> 0) then
          begin
            obFinalizador.FindNearest([obCtrl.dataSet.FieldByName('cod_finalizador').AsString]);
            if obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
              obFinalizador.dataSet.FieldByName('cod_finalizador').AsString then
              if not formaPagamento(obPreVenda.vFrmPg.dataSet.FieldByName('valordoc').AsCurrency,
                obPreVenda.dataSet.FieldByName('cod_cliente').AsString) then
              begin
                CancelarCupomAtual1Click(self);
                obPreVenda.desmarcaVendaParaCupom;
                lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
                ldescricao.Caption := '';
                Edit1.Text := '';
                eSubTotal.Valor := obCupom.getSubTotal;
                exit;
              end;
          end;
          obPreVenda.vFrmPg.Next;
        end;
        end;
      end;
      if (obCupom.getValorRestante > 0) and (vShowModal = mrOK) then
      begin
        Application.CreateForm(TfrmFechamento, frmFechamento);
        frmFechamento.Edit1.Text := obPreVenda.dataSet.FieldByName('cod_cliente').AsString;
        obFinalizador.getTodos;
        obFinalizador.First;
        obCupom.setMemo(Memo1);
        frmFechamento.ShowModal;
        if frmFechamento.ModalResult = mrok then
        begin
          Memo1.Lines.Clear;
          eVlUnit.Valor := 0;
          lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
          ldescricao.Caption := 'Obrigado! Volte Sempre!';
          Edit1.Text := '';
          eSubTotal.Valor := obCupom.getSubTotal;
          try
            obPreVenda.nCCF := obCupom.dataSet.FieldByName('ccf').AsInteger; //StrToInt(Trim(CImpressoraF.numeroCCF));
          except
            obPreVenda.nCCF := 0;
          end;
          if not obPreVenda.confirmaEmissaoCupomVenda(StrToInt(trim(nCupom)),
            obCupom.dataSet.FieldByName('prevenda').AsInteger) then
          begin
            Application.MessageBox(pchar('Atenção! Venda não foi atualizada no retaguarda.'),
              'Atenção', MB_ICONEXCLAMATION + MB_OK);
            Exit;
          end;
        end
        else if frmFechamento.ModalResult = mrAbort then
        begin
          CancelarCupomAtual1Click(Sender);
          obPreVenda.desmarcaVendaParaCupom;
          lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
          ldescricao.Caption := '';
          Edit1.Text := '';
          eSubTotal.Valor := obCupom.getSubTotal;
          exit;
        end;
        frmFechamento.Free;
        frmFechamento := nil;
      end
      else
      begin
        Memo1.Lines.Clear;
        eVlUnit.Valor := 0;
        lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
        ldescricao.Caption := 'Obrigado! Volte Sempre!';
        Edit1.Text := '';
        eSubTotal.Valor := obCupom.getSubTotal;
          try
            obPreVenda.nCCF := obCupom.dataSet.FieldByName('ccf').AsInteger; //StrToInt(Trim(CImpressoraF.numeroCCF));
          except
            obPreVenda.nCCF := 0;
          end;
        if not obPreVenda.confirmaEmissaoCupomVenda(StrToInt(trim(nCupom)),
          obCupom.dataSet.FieldByName('prevenda').AsInteger) then
        begin
          Application.MessageBox(pchar('Atenção! Venda não foi atualizada no retaguarda.'),
            'Atenção', MB_ICONEXCLAMATION + MB_OK);
          Exit;
        end;
      end;
    end;
  finally
    if (vProdServ = 'S') or (vProdServ = 'T') then
      AlternarentrenotadeServioeProduto1Click(Self);
    habilitaControles;
    obPreVenda.Close;
    obPreVenda.CommitaTransacao;
    frmLerPreVendaRet.free;
    frmLerPreVendaRet := nil;
    Edit1.Clear;
    AtualizarcacheSistema1.Click;
//    vDadosIniF.limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.LerVendaRetaguarda1Click(Sender: TObject);
var
  somaForma, somaVenda: Currency;
  temDinheiro, temCartao: boolean;
  nCupom, quantidade: string;
  vValorItens: Currency;
  codBarra: string;
  vTemProd, vTemServ, vTemItem: Boolean;
  vSubTotal: Integer;
  strControlesDigitadosConf, subStrComparacao: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

  finally
    Screen.Cursor := crDefault;
  end;

  if vDadosIniF.bancoConectado = 'local' then
  begin
    Application.MessageBox('Sem conexão com o servidor','Atenção',0+64);
    Exit;
  end;
  Application.CreateForm(TfrmLerDavRet, frmLerDavRet);
  if obVenda = nil then
    obVenda := TDAVF.create;
  if obCtrl = nil then
    obCtrl := TControleF.create;
  obVenda.desmarcaVendaParaCupom;
  temDinheiro := false;
  temCartao := false;
  somaForma := 0;
  somaVenda := 0;
  vTemItem := False;
  try
    Screen.Cursor := crHourGlass;
    desabilitaControles;
    obVenda.selecionaVendasParaCupomDiaAtual(0,0);
    //    Memo1.Lines.Add(obVenda.dataSet.CommandText);

    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
    if frmLerDavRet.ShowModal = mrOK then
    begin
      obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
      //      ShowMessage(obEmpresa.dataSet.FieldByName('NOME_EMP').AsString);
      //      ShowMessage(obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString);
            //Testando se as formas de pagamento irao fechar com o valor do cupom
      obVenda.selecionaVendasParaCupom(obVenda.dataSet.FieldByName('NPED').AsInteger,
        obVenda.dataSet.FieldByName('tipo').AsString);
      if (not obVenda.OSPermiteCupom) then
      begin
        Application.MessageBox(pchar('Ordem de Serviço não permite emitir cupom fiscal!'),'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      if obVenda.dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Venda não encontrada ou ja emitido cupom fiscal'),
          'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger,
        obVenda.dataSet.FieldByName('tipo').Asstring);
      obVenda.vItem.dataSet.First;
      if obVenda.dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Venda sem itens'),'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      vTemProd := False; vTemServ := False;
      while not obVenda.dataSet.Eof do
      begin
        if not vTemServ then
          if obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S' then
            vTemServ := True;

        if not vTemProd then
          if obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P' then
            vTemProd := True;
        if vTemProd then
        begin
          obVenda.vItem.dataSet.First;
          Break;
        end;
        obVenda.dataSet.Next;
      end;
      if (not vTemProd) and (vTemServ) then
        if (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString <> 'S') then
        begin
          Application.MessageBox(pchar('Venda possui apenas serviços. Sistema não configurado para emitir cupom de serviço'),'Atenção',
            MB_OK + MB_ICONWARNING);
          Exit;
        end;
      if (not vTemProd) and (vTemServ) and (not obVenda.OSPermiteCupom) then
        begin
          Application.MessageBox(pchar('Venda possui apenas serviços. Tipo ou SubTipo da OS configurado para não emitir cupom de serviço'),'Atenção',
            MB_OK + MB_ICONWARNING);
          Exit;
        end;

      if (obVenda.dataSet.FieldByName('tipv').AsString <> 'V') then
        if not vDadosIniF.PesqPros('FIS050', 'VALIDAR',
          Trim(obVenda.dataSet.FieldByName('TIPO').AsString) + ' ' +
          Trim(obVenda.dataSet.FieldByName('NPED').AsString) + ' TIPV ' +
          Trim(obVenda.dataSet.FieldByName('TIPV').AsString), 'PEDVENDA',
          obVenda.dataSet.FieldByName('NPED').AsString) then
        begin
          Application.MessageBox(pchar('Tipo de Venda diferente de "V - Varejo" dever ser permitida pelo processo "FIS050"'),'Atenção',
            MB_OK + MB_ICONWARNING);
          Exit;
        end;

      if not obVenda.marcarVendaParaCupom then
      begin
        Application.MessageBox(pchar('Venda travada por outro usuário'), 'Atenção',
          MB_ICONEXCLAMATION + MB_OK);
        Exit;
      end;
      obFinalizador.getTodos;
      obFinalizador.IndexFieldNames := 'cod_finalizador';
      obVenda.vFrmPg.selecionaFormaPagamento(trim(obVenda.dataSet.FieldByName('tipo').AsString),
        obVenda.dataSet.FieldByName('nped').AsInteger);

      obVenda.vFrmPg.First;
      somaForma := 0;
      while not obVenda.vFrmPg.Eof do
      begin
        somaForma := somaForma + obVenda.vFrmPg.dataSet.FieldByName('valordoc').AsCurrency;
        obCtrl.selecionaControle(obVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger);
        obFinalizador.FindNearest([obCtrl.dataSet.FieldByName('cod_finalizador').AsString]);
        if (obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
          obFinalizador.dataSet.FieldByName('cod_finalizador').AsString) and
          (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger = 0) then
          temDinheiro := true
        else if (obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
          obFinalizador.dataSet.FieldByName('cod_finalizador').AsString) and
          (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger > 0) then
          temCartao := true;
        obVenda.vFrmPg.Next;
      end;

      obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger,
        obVenda.dataSet.FieldByName('tipo').asstring);
      obVenda.vItem.First;
      while not obVenda.vItem.dataset.Eof do
      begin
        vTemItem := True;
        if Trim(obVenda.vItem.dataSet.FieldByName('status').AsString) <> 'CANCELADO' then
        if (
          ((obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obVenda.OSPermiteCupom))
          or
          ((obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'T') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obVenda.OSPermiteCupom))
          ) or
          (obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') then
          somaVenda := somaVenda + (obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
            obVenda.vItem.dataSet.FieldByName('QTDE').AsFloat) +
            obVenda.vItem.dataSet.FieldByName('rateio_acresc').AsCurrency -
            obVenda.vItem.dataSet.FieldByName('rateio_desc').AsCurrency;
        obVenda.vItem.dataSet.Next;
      end;
      //      somaVenda := somaVenda + obVenda.dataSet.FieldByName('acrescimo').AsCurrency +
      //        obVenda.dataSet.FieldByName('desconto').AsCurrency;

			if (temDinheiro) and (temCartao) and (vDadosIniF.StrToFloatFormat(somaForma,2) > vDadosIniF.StrToFloatFormat(somaVenda,2)) and
        (vDadosIniF.strEstaContidoEm(vDadosIniF.vUsaTef, ['E', 'I']) and (vDadosIniF.GetIni('TEF', 'POSVirtual', 'N') <> 'S'))
      then
      begin
        Application.MessageBox(pchar('Forma de pagamento excede o valor do cupom. ' + #13 +
          'Dinheiro e Cartão foram informados'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        obVenda.desmarcaVendaParaCupom;
        Exit;
      end
      else if (temCartao) and (vDadosIniF.StrToFloatFormat(somaForma,2) > vDadosIniF.StrToFloatFormat(somaVenda,2)) and
        (vDadosIniF.strEstaContidoEm(vDadosIniF.vUsaTef, ['E', 'I']) and (vDadosIniF.GetIni('TEF', 'POSVirtual', 'N') <> 'S'))
       then
      begin
        Application.MessageBox(pchar('Forma de pagamento excede o valor do cupom. ' + #13 +
          'Cartão foi informado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        obVenda.desmarcaVendaParaCupom;
        Exit;
      end;
      if (vDadosIniF.vDescontoISS = 'N') and 
        (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') then
      begin
        if obVenda.verificaDescontoMaiorQueSomaDosItens then
        begin
          Application.MessageBox(pchar('Impressora configurada para não aceitar desconto de ISS'
            + #13 +
            'Valor do desconto maior que a soma de produtos'), 'Atenção', MB_ICONEXCLAMATION +
            MB_OK);
          obVenda.desmarcaVendaParaCupom;
          Exit;
        end;
        obVenda.vItem.First;
        while not obVenda.vItem.dataSet.Eof do
        begin
          if (obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S') and (Trim(obVenda.vItem.dataSet.FieldByName('status').AsString) <> 'CANCELADO') then
          begin
            if obVenda.vItem.dataSet.FieldByName('rateio_desc').AsFloat > 0 then
            begin
              Application.MessageBox(pchar('Existem serviços com desconto. Impressora configurada para não aceitar desconto de ISS'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
              obVenda.desmarcaVendaParaCupom;
              Exit;
            end;
          end;
          obVenda.vItem.Next;
        end;
      end;

      obCupom.setNDAV(obVenda.dataSet.FieldByName('nprevenda').AsInteger,
        obVenda.dataSet.FieldByName('nped').AsInteger,
        obVenda.dataSet.FieldByName('data_fech').AsDateTime,
        obVenda.dataSet.FieldByName('valor_total').AsCurrency);
      obCupom.setNContaCliente(obVenda.dataSet.FieldByName('coo_conta_cliente').AsInteger,
        obVenda.dataSet.FieldByName('cer_conta_cliente').AsInteger);
      vValorItens := 0;
      obVenda.vItem.First;
      while not obVenda.vItem.Eof do
      begin
        vProdServ := obVenda.vItem.dataSet.FieldByName('tipo').AsString;
        quantidade := obVenda.vItem.dataSet.FieldByName('qtde').AsString;
        obProd.CustoMedio := obVenda.vItem.dataSet.FieldByName('PCUST_MC').AsFloat;
        if (obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') then
          codBarra := 'GRUPO|CODIGO|' + IntToStr(obVenda.vItem.dataSet.FieldByName('GRUPOOUSERV').AsInteger) + '|' +
            Trim(obVenda.vItem.dataSet.FieldByName('cod_prod').AsString) + '|'
        else
          codBarra := trim(obVenda.vItem.dataSet.FieldByName('num_fab_prod').AsString);
        if ((
          ((obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obVenda.OSPermiteCupom))
          or
          ((obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'T') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obVenda.OSPermiteCupom))
          ) or
          (obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P')) and
          (obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency > 0) then
        begin
          Edit1.Text := quantidade + '*' + codBarra;
          eVlUnit.Valor := obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency;
          if not enviaItemVenda(quantidade + '*' + codBarra,
            trim(obVenda.vItem.dataSet.FieldByName('DESCR').AsString),
            (obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency),
            obVenda.dataSet.FieldByName('cod_cliente').AsInteger,
              vDadosIniF.retornoPorCondicao(obvENDA.vItem.dataSet.FieldByName('tipo').AsString = 'T',
                obvENDA.dataSet.FieldByName('COD_VENDEDOR').AsInteger,
                obvENDA.vItem.dataSet.FieldByName('COD_VENDEDOR').AsInteger)) then
          begin
            if obCupom.getSubTotal > 0 then
              CancelarCupomAtual1Click(sender);
            obVenda.desmarcaVendaParaCupom;
            exit;
          end;
          nCupom := obCupom.getNCupom;
          if Trim(obVenda.vItem.dataSet.FieldByName('status').AsString) = 'CANCELADO' then
          begin
            if vDadosIniF.EnvCmdsCupom(17) then
              if obCupom.cancelaItem then
              begin
                Memo1.Lines.Add(vDadosIniF.PadR('CANC. ITEM:' +
                  vDadosIniF.StrZeroDec(trunc(obCupom.vItem.getNItem), 3, 0), 30, ' ') + ' ' +
                  vDadosIniF.PadL(FormatFloat('###,###,##0.000',
                  (obCupom.vItem.dataSet.FieldByName('total').AsFloat)), 12, ' '));
                eSubTotal.Valor := obCupom.getSubTotal;
                 vDadosIniF.GravaAuditoria('FIS003','CANCELAR','','CUPOM',obCupom.dataSet.FieldByName('cupom').AsString);
              end;
          end
          else
            vValorItens := vValorItens + obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
              obVenda.vItem.dataSet.FieldByName('qtde').AsFloat;
        end;
        obVenda.vItem.Next;
      end;
      obCupom.tipoVenda := obVenda.dataSet.FieldByName('tipo').AsString;
      iniciaFechamento( not((somaVenda = 0) and (vTemItem))  );
      obVenda.BuscarDadosCliente;
      obCupom.setDadosAvulso(obVenda.DadosCliente.NomeClienteImp,
                             obVenda.DadosCliente.Endereco,
                             obVenda.DadosCliente.Bairro,
                             obVenda.DadosCliente.Cidade,
                             obVenda.DadosCliente.Estado,
                             obVenda.DadosCliente.CpfCnpj, '','',
                             obVenda.DadosCliente.NomeClienteGravar);
      obCliente.selecionaCliente(obVenda.dataSet.FieldByName('cod_cliente').AsInteger);
      {obCupom.setDadosAvulso(obVenda.dataSet.FieldByName('cod_cliente').AsString + ' '+
      obCliente.dataSet.FieldByName('nome_cliente').AsString,
        Trim(obCliente.dataSet.FieldByName('endereco').AsString) + ', ' +
        obCliente.dataSet.FieldByName('num_end_cliente').AsString,
        obCliente.dataSet.FieldByName('bairro').AsString,
        obCliente.dataSet.FieldByName('cidade').AsString,
        obCliente.dataSet.FieldByName('sigla_uf').AsString,
        obCliente.dataSet.FieldByName('cpfcgc').AsString, '', '',
        obCliente.dataSet.FieldByName('nome_cliente').AsString);}

      if vValorItens > somaVenda then
        setDescontoAcrescimo(vValorItens - somaVenda, 0)
      else//Quando existir acrescimo o valor do acrescimo ja foir somado no valor do item, entao nao vai ter no subtotal o valor do acreescimo
          //Foi definido na tabela sinccopativelhw que o rateio_acresc nao sera enviado para o pedvenda_prod
        setDescontoAcrescimo(0, somaVenda - vValorItens);//setDescontoAcrescimo(0, 0);//setDescontoAcrescimo(0, somaVenda - vValorItens);
      //      setDescontoAcrescimo(obVenda.dataSet.FieldByName('desconto').AsCurrency,
      //        obVenda.dataSet.FieldByName('acrescimo').AsCurrency);
      obVenda.vFrmPg.First;

      if (somaVenda = 0) and (vTemItem) then
      begin
        obCupom.setSubTotal(True);
//        if formaPagamento(0, obVenda.dataSet.FieldByName('cod_cliente').AsString) then
        begin

          vSubTotal := 0;
          if obCupom.emSubTotal then
            vSubTotal := 1;

          if not CImpressoraF.CancelaCupom(vSubTotal) then
            exit
          else
          begin
            CImpressoraF.FechaPortaSerial;
            obCupom.cancelarCupomFiscal;
          end;
          obProd.CommitaTransacao;
          obProd.IniciaTransacao;
          if obprod.dataSet.Active then
            obProd.dataSet.Refresh;

          obVenda.cancelarPreVenda;
          obVenda.desmarcaVendaParaCupom;
          lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
          ldescricao.Caption := '';
          Edit1.Text := '';
          Memo1.Clear;
          eSubTotal.Valor := obCupom.getSubTotal;
          eVlUnit.Valor := 0;
        end;
        exit;
      end
      else
      begin
        if (temCartao) and (vDadosIniF.strEstaContidoEm(vDadosIniF.vUsaTef, ['E', 'I'])) and
         (vDadosIniF.GetIni('TEF', 'POSVirtual', 'N') <> 'S') then
        else
        begin
          strControlesDigitadosConf := ',' +
            StringReplace(vDadosIniF.getConfSisStr('paf_ecf_form_pag_digitada_controles', obVenda.buscas), ' ', '', [rfReplaceAll]) + ',';
          obVenda.vFrmPg.First;
          while not obVenda.vFrmPg.Eof do
          begin
            subStrComparacao := ',' + IntToStr(obVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger) + ',';
            obCtrl.selecionaControle(obVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger);
            if (not obCtrl.dataSet.IsEmpty) and (obCtrl.dataSet.FieldByName('cod_finalizador').AsInteger <> 0) and
              (Pos(subStrComparacao, strControlesDigitadosConf) = 0) then
            begin
              obFinalizador.FindNearest([obCtrl.dataSet.FieldByName('cod_finalizador').AsString]);
              if obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
                obFinalizador.dataSet.FieldByName('cod_finalizador').AsString then
                if not formaPagamento(obVenda.vFrmPg.dataSet.FieldByName('valordoc').AsCurrency,
                  obVenda.dataSet.FieldByName('cod_cliente').AsString) then
                begin
                  CancelarCupomAtual1Click(self);
                  obVenda.desmarcaVendaParaCupom;
                  lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
                  ldescricao.Caption := '';
                  Edit1.Text := '';
                  eSubTotal.Valor := obCupom.getSubTotal;
                  exit;
                end;
            end;
            obVenda.vFrmPg.Next;
          end;
        end;
      end;
      if obCupom.getValorRestante > 0 then
      begin
        Application.CreateForm(TfrmFechamento, frmFechamento);
        frmFechamento.Edit1.Text := obVenda.dataSet.FieldByName('cod_cliente').AsString;
        obFinalizador.getTodos;
        obFinalizador.First;
        obCupom.setMemo(Memo1);
        frmFechamento.ShowModal;
        if frmFechamento.ModalResult = mrok then
        begin
          Memo1.Lines.Clear;
          eVlUnit.Valor := 0;
          lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
          ldescricao.Caption := 'Obrigado! Volte Sempre!';
          Edit1.Text := '';
          eSubTotal.Valor := obCupom.getSubTotal;
          try
            obVenda.nCCF := obCupom.dataSet.FieldByName('ccf').AsInteger; //StrToInt(Trim(CImpressoraF.numeroCCF));
          except
            obVenda.nCCF := 0;
          end;
          if not obVenda.confirmaEmissaoCupomVenda(StrToInt(trim(nCupom)),
            obCupom.dataSet.FieldByName('prevenda').AsInteger) then
          begin
            Application.MessageBox(pchar('Atenção! Venda não foi atualizada no retaguarda.'),
              'Atenção', MB_ICONEXCLAMATION + MB_OK);
          end;
          if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
            try
              vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
              vHwSinc._sincronizarDados;
            finally
              vDadosIniF.fechaStatusProcessamento;
            end;
          if vDadosIniF.vVerificarHwfAutomatico <> 'N' then
            vConfImp.verificaHwF('');
        end
        else if frmFechamento.ModalResult = mrAbort then
        begin
          CancelarCupomAtual1Click(Sender);
          obVenda.desmarcaVendaParaCupom;
          lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
          ldescricao.Caption := '';
          Edit1.Text := '';
          eSubTotal.Valor := obCupom.getSubTotal;
          if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
            try
              vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
              vHwSinc._sincronizarDados;
            finally
              vDadosIniF.fechaStatusProcessamento;
            end;
          if vDadosIniF.vVerificarHwfAutomatico <> 'N' then
            vConfImp.verificaHwF('');
        end;
        frmFechamento.Free;
        frmFechamento := nil;
      end
      else
      begin
        Memo1.Lines.Clear;
        eVlUnit.Valor := 0;
        lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
        ldescricao.Caption := 'Obrigado! Volte Sempre!';
        Edit1.Text := '';
        eSubTotal.Valor := obCupom.getSubTotal;
          try
            obVenda.nCCF := obCupom.dataSet.FieldByName('ccf').AsInteger; //StrToInt(Trim(CImpressoraF.numeroCCF));
          except
            obVenda.nCCF := 0;
          end;
        if not obVenda.confirmaEmissaoCupomVenda(StrToInt(trim(nCupom)),
          obCupom.dataSet.FieldByName('prevenda').AsInteger) then
        begin
          Application.MessageBox(pchar('Atenção! Venda não foi atualizada no retaguarda.'),
            'Atenção', MB_ICONEXCLAMATION + MB_OK);
        end;
        if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
          try
            vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
            vHwSinc._sincronizarDados;
          finally
            vDadosIniF.fechaStatusProcessamento;
          end;
        if vDadosIniF.vVerificarHwfAutomatico <> 'N' then
          vConfImp.verificaHwF('');
      end;
    end
    else
    begin
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        try
          vDadosIniF.abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
          vHwSinc._sincronizarDados;
        finally
          vDadosIniF.fechaStatusProcessamento;
        end;
      if vDadosIniF.vVerificarHwfAutomatico <> 'N' then
        vConfImp.verificaHwF('');
    end;
  finally
    if (vProdServ = 'S') or (vProdServ = 'T') then
      AlternarentrenotadeServioeProduto1Click(Self);
    habilitaControles;
    obVenda.Close;
    obVenda.CommitaTransacao;
    frmLerDavRet.free;
    frmLerDavRet := nil;
    Edit1.Clear;
    AtualizarcacheSistema1.Click;
//    vDadosIniF.limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.manipulaMenus(visivel: boolean);
begin
  if Memo1.Lines.Text = '' then
  begin
    //MenuFiscal1.Enabled := true;
    //Sair1.Enabled := true;
  end;
end;

procedure TfrmPrincipalFiscal.ManutenoHW1Click(Sender: TObject);
begin
  inherited;
//  Application.CreateForm(TfrmManutencaoHw, frmManutencaoHw);
//  frmManutencaoHw.ShowModal;
end;

procedure TfrmPrincipalFiscal.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.MenuFiscal;
end;

procedure TfrmPrincipalFiscal.MostraAjuda(AjudaHtml: string);
var
  Parametro, NomeArquivo: string;
  handle: THandle;
begin
  NomeArquivo := ExtractFilePath(Application.ExeName) + 'HelpFiscal.chm';
  if not FileExists(NomeArquivo) then
    raise Exception.CreateFmt('Arquivo de ajuda "%s" não encontrado.', [NomeArquivo]);

  if (AjudaHtml <> '') then
  begin
    Parametro := Format('%s::%s', [NomeArquivo, AjudaHtml + '.htm']);
    if ShellExecute(handle, 'open', 'HH.exe', PChar(Parametro), nil, SW_SHOWDEFAULT) <= 32 then
      raise Exception.Create('Não foi possível abrir arquivo');
  end;
end;

procedure TfrmPrincipalFiscal.MovimentodoOperador1Click(Sender: TObject);
var
	vRel: TStringList;
	I: Integer;
begin
	inherited;
	if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not vDadosIniF.strEstaContidoEm(vDadosIniF.vModoSistema, ['S', 'J'])) then
	begin

		Application.CreateForm(TfrmMovimentoOperador, frmMovimentoOperador);
		obMovOP.abreTodos;
		frmMovimentoOperador.DataSource1.DataSet := obMovOP.buscas;
		frmMovimentoOperador.ShowModal;

		Exit;

		vRel := TStringList.Create;

		if obMovOP.relatorioDeMovimento(vRel, False) then
		begin
      CImpressoraF.abrerelatorioGer;
			for I:= 0 to vRel.Count - 1 do
				CImpressoraF.RelatorioGerencial(vRel[I]);
			CImpressoraF.FechaRelatorioGerencial;
		end;
	end;
end;

procedure TfrmPrincipalFiscal.NaoSair1Click(Sender: TObject);
begin
  inherited;
  altF4 := true;
end;

procedure TfrmPrincipalFiscal.NotaFiscal1Click(Sender: TObject);
var
  hdTemp: THandle;
  formulario: TForm;
begin
  inherited;
  try
    Screen.Cursor := crDefault;


//    if (vDadosIniF.semComunicacaoComECF('N')) or
//      (vDadosIniF.diferencaNoGrandeTotal('N'))or
//      (vDadosIniF.diferencaNoNumeroSerie('N')) or
//      (vDadosIniF.caixaFiscalFechado('N')) then
    begin

      try
        Screen.Cursor := crHourGlass;

//        vDadosIniF.executaMetodo('pkNF.bpl', 'TChamadaNFPAF', 'abreFormNF');


//        vDadosIniF.vNomeForm := 'TfrmShowNF';
//        vDadosIniF.vModalOuChild := 'M';
        Application.MainForm.Visible := False;
        Application.ProcessMessages;
//        ShowWindow(Application.Handle, SW_HIDE);
        TrayIcon1.Visible := True;
        TrayIcon1.Hint := 'PAF-ECF';
        TrayIcon1.BalloonTitle := 'PAF-ECF';
        TrayIcon1.BalloonHint := 'PAF-ECF aguardando';
        TrayIcon1.BalloonTimeout := 5000;
        TrayIcon1.BalloonFlags := bfInfo;
        TrayIcon1.ShowBalloonHint;
        vDadosIniF.CreateProcessSimple(Application.ExeName + ' pkIntegracao TfrmIntegracao ' +
          vDadosIniF.codifica('-u' + vDadosIniF.vNomeUsuario) + ' ' +
          vDadosIniF.codifica('-s') + vDadosIniF.vSenhaUsuario + ' ' +
          vDadosIniF.codifica('-e' + vDadosIniF.codEmpresa) + ' ' +
          vDadosIniF.codifica('-pFiscal') + ' ' +
          '-aNOTAFISCALPAF' + ' MD5PAF' + vDadosIniF.vMD5Fiscal, True);
//        ShowWindow(Application.Handle, SW_RESTORE);
        TrayIcon1.Visible := False;
        Application.MainForm.Visible := True;
//        vDadosIniF.vPesquisa := '#PAF#|';
//        formulario := AbreForm('pkNF', 'TfrmShowNF', hdTemp);
//        try
//          formulario.Show;
//        finally
//          formulario.Free;
//          unLoadPackage(hdTemp);
//        end;
      finally
        Screen.Cursor := crDefault;
      end;

    end
    ;
//    else
//      application.messagebox(pchar('Utilize a emissão de cupom Fiscal'), 'Atenção',
//        MB_ICONEXCLAMATION + mb_OK);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.OperaesTEF1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS041', 'ACRESCIMO','','CUPOM2',obCupom.dataSet.FieldByName('cupom').AsString) then
      exit;

    Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
    frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.TabSheet3;
    frmComandosPDV.RadioGroup2.ItemIndex := 0;
    frmComandosPDV.PageControl1.Tag := 3;
    //frmComandosPDV.Edit1.SetFocus;
    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.PesquisaClientes1Click(Sender: TObject);
begin
  inherited;
  if ((not obCliente.Active) or (obCliente.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
  begin
    try
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Clientes..');
      obCliente.getTodos;
    finally
      vDadosIniF.limpaMensagem;
    end;
  end;
  //  if obCliente.Active then
  frmPesqClientes.ShowModal;
end;

procedure TfrmPrincipalFiscal.PesquisaProdutos1Click(Sender: TObject);
begin
  inherited;
  if ((not obProd.Active) or (obProd.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
  begin
    try
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Itens..');
      obProd.getTodos;
    finally
      vDadosIniF.limpaMensagem;
    end;
  end;
  if frmPesqProdutos.ShowModal = mrOK then
  begin
    if vDadosIniF.vUsaCodigoBarras = 'S' then
      Edit1.Text := trim(obProd.dataSet.FieldByName('num_fab_prod').AsString)
    else
      Edit1.Text := trim(obProd.dataSet.FieldByName('grupo_prod').AsString+
        obProd.dataSet.FieldByName('cod_prod').AsString);
  end;
end;

procedure TfrmPrincipalFiscal.PesquisaServios1Click(Sender: TObject);
begin
  inherited;
  if ((not obServ.Active) or (obServ.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
  begin
    try
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Serviços..');
      obServ.getTodos;
    finally
      vDadosIniF.limpaMensagem;
    end;
  end;
  if frmPesqServicos.ShowModal = mrOK then
    Edit1.Text := trim(obServ.dataSet.FieldByName('cod_servico').AsString);
end;

procedure TfrmPrincipalFiscal.processaMensagem(var Msg: TMsg;
  var handled: boolean);
begin
  if Msg.message = WM_KEYDOWN then
  begin
    if ((Msg.wParam >= 96) and (Msg.wParam <= 105)) or
      ((Msg.wParam >= 48) and (Msg.wParam <= 57)) or
      (Msg.wParam = 88) or (Msg.wParam = 106) or
      (Msg.wParam = 188) or (Msg.wParam = 110) or
      (Application.ActiveFormHandle <> Handle) then
      exit;
    try
      Application.OnMessage := nil;
      case Msg.wParam of
        65: //F1 Help
          begin
            Ajuda1Click(Self);
          end;
        66:
          begin //Menu
            vDadosIniF.PostKeyEx32(18, [ssShift], false);
          end;
        67:
          begin //Menu Fiscal
            vDadosIniF.MenuFiscal;
          end;
        68: //Cancelar Item
          begin
            CancelarItensemqualquerposio1Click(Self);
          end;
        69: //Cancelar Cupom Atual
          begin
            CancelarCupomAtual1Click(Self);
          end;
        70: //Cancelar Ultimo Cupom Emitido
          begin
            CancelarltimoCupom1Click(Self);
          end;
        71: //Sair do Sistema
          begin
            Sair1Click(Self);
          end;
        72: //Confirmar venda
          begin
            ConfirmarVenda1Click(Self);
          end;
        73: //Subtotaliza o Cupom Fiscal
          begin
            obCupom.setSubTotal;
            ConfirmarVenda1Click(Self);
          end;
        74: //Desconto no Valor do Cupom
          begin
            Application.CreateForm(TfrmValor, frmValor);
            if frmValor.ShowModal = mrOk then
            begin
              if obCupom.setDescontoFechamento(frmValor.EditMoeda1.Valor) then
              begin
                obCupom.setSubTotal;
                ConfirmarVenda1Click(Self);
              end;
            end;
            frmValor.Free;
            frmValor := nil;
          end;
        75: //Acrescimo no Valor do Cupom
          begin
            Application.CreateForm(TfrmValor, frmValor);
            if frmValor.ShowModal = mrOk then
            begin
              if obCupom.setDescontoFechamento(frmValor.EditMoeda1.Valor) then
              begin
                obCupom.setSubTotal;
                ConfirmarVenda1Click(Self);
              end;
            end;
            frmValor.Free;
            frmValor := nil;
          end;
        76: //Desconto no Item
          begin
            DescontonoItem1Click(Self);
          end;
        77: //Acrescimo no Item
          begin
            AcrscimonoItem1Click(Self);
          end;
        78: //Pesquisa de Clientes
          begin
            PesquisaClientes1Click(Self);
          end;
        79: //Pesquisa de Produtos
          begin
            PesquisaProdutos1Click(Self);
          end;
        80: //Pesquisa de Serviços
          begin
            PesquisaServios1Click(Self);
          end;
        81: //Sangria / Suprimentos
          begin
            SangriaSuprimentos1Click(Self);
          end;
        82: //Recebimento de Prestações
          begin
            RecebimentodePrestao1Click(Self);
          end;
        83: //Ativar horário de Verão
          begin
            AtivarHorriodeVero1Click(Self);
          end;
        84: //Desativar horário de Verão
          begin
            DesativarHorriodeVero1Click(Self);
          end;
        85: //Redução Z
          begin
            ReduoZ1Click(Self);
          end;
        86: //Sintegra
          begin
            Sintegra1Click(Self);
          end;
        87: //Abrir gaveta
          begin
            AbrirGaveta1Click(Self);
          end;
        89: //Consulta
          begin
            Consulta1Click(Self);
          end;
        90: //Alternar entre produtos e serviços
          begin
            AlternarentrenotadeServioeProduto1Click(Self);
          end;
        112: //Operações Tef
          begin
            OperaesTEF1Click(Self);
          end;
        113: //Ler venda do Retaguarda
          begin
            LerVendaRetaguarda1Click(Self);
          end;
        114: //Atualizar Estoque
          begin
            AtualizaodoEstoque1Click(Self);
          end;
        115: //Nota Fiscal Serie D
          begin
            RegistrosdeOrdemSerieeSubSerie1Click(Self);
          end;
        116: //Troca de Operado
          begin
            rocadeOperador1Click(Self);
          end;
        117: //Resumo de vendas
          begin
            ResumodeVendas1Click(Self);
          end;
        118: //Alterar Porta de Comunicação
          begin
            AlterarPortadeComunicao1Click(Self);
          end;
        119: //Desligar Micro
          begin
            DesligarMicro1Click(Self);
          end;
        120: //Menu Fiscal
          begin
            MenuFiscal1.Click;
          end;
        123: //Cartao
          begin
            ConfirmarVenda1Click(Self);
          end;
        16: //Dinheiro
          begin
            ConfirmarVenda1Click(Self);
          end;
      end;
    finally
      Application.OnMessage := processaMensagem;
    end;
  end;
end;

function TfrmPrincipalFiscal.receberPrestacaoDoRetaguarda(
  pCred: integer): boolean;
begin
  Result := vDadosIniF.abreFormRecebimentoNaoFiscal(pCred);
end;

function TfrmPrincipalFiscal.receberVendaDoRetaguarda(nped: integer;
  tipoVenda: string): boolean;
var
  somaForma, somaVenda: Currency;
  temDinheiro, temCartao: boolean;
  nCupom, quantidade: string;
  vValorItens: Currency;
  codBarra: string;
  vTemProd, vTemServ: Boolean;
  strControlesDigitadosConf, subStrComparacao: string;
begin
  inherited;
  try
    Result := false;
    obTef.forcaFocoNoSistema(Application.Handle);
    frmPrincipalFiscal.Refresh;
    Refresh;
    if obVenda = nil then
      obVenda := TDAVF.create;
    if obCtrl = nil then
      obCtrl := TControleF.create;
    obVenda.desmarcaVendaParaCupom;

    temDinheiro := false;
    temCartao := false;
    somaForma := 0;
    somaVenda := 0;
    try
      //    frmPrincipalFiscal.Visible := true;
      obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
      desabilitaControles;
      obVenda.selecionaVendasParaCupom(nped, tipoVenda);
      if obVenda.dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Venda não encontrada ou ja emitido cupom fiscal'),
          'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      if (not obVenda.OSPermiteCupom) then
      begin
        Application.MessageBox(pchar('Ordem de Serviço não permite emitir cupom fiscal!'),'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger,
        obVenda.dataSet.FieldByName('tipo').Asstring);
      obVenda.vItem.dataSet.First;
      if obVenda.dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Venda sem itens'),'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      vTemProd := False; vTemServ := False;
      while not obVenda.dataSet.Eof do
      begin
        if not vTemServ then
          if obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S' then
            vTemServ := True;

        if not vTemProd then
          if obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P' then
            vTemProd := True;
        if vTemProd then
        begin
          obVenda.vItem.dataSet.First;
          Break;
        end;
        obVenda.dataSet.Next;
      end;
      if (not vTemProd) and (vTemServ) then
        if (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString <> 'S') then
        begin
          Application.MessageBox(pchar('Venda possui apenas serviços. Sistema não configurado para emitir cupom de serviço'),'Atenção',
            MB_OK + MB_ICONWARNING);
          Exit;
        end;   
      if (not vTemProd) and (vTemServ) and (not obVenda.OSPermiteCupom) then
        begin
          Application.MessageBox(pchar('Venda possui apenas serviços. Tipo ou SubTipo da OS configurado para não emitir cupom de serviço'),'Atenção',
            MB_OK + MB_ICONWARNING);
          Exit;
        end;

      if (obVenda.dataSet.FieldByName('tipv').AsString <> 'V') then
        if not vDadosIniF.PesqPros('FIS050', 'VALIDAR',
          Trim(obVenda.dataSet.FieldByName('TIPO').AsString) + ' ' +
          Trim(obVenda.dataSet.FieldByName('NPED').AsString) + ' TIPV ' +
          Trim(obVenda.dataSet.FieldByName('TIPV').AsString), 'PEDVENDA',
          obVenda.dataSet.FieldByName('NPED').AsString) then
        begin
          Application.MessageBox(pchar('Tipo de Venda diferente de "V - Varejo" dever ser permitida pelo processo "FIS050"'),'Atenção',
            MB_OK + MB_ICONWARNING);
          Exit;
        end;

      //    Memo1.Lines.Add(obVenda.dataSet.CommandText);
        //Testando se as formas de pagamento irao fechar com o valor do cupom
      if not obVenda.marcarVendaParaCupom(nped) then
      begin
        Application.MessageBox(pchar('Venda travada por outro usuário'), 'Atenção',
          MB_OK + MB_ICONWARNING);
        Exit;
      end;
      obFinalizador.getTodos;
      obFinalizador.IndexFieldNames := 'cod_finalizador';
      obVenda.vFrmPg.selecionaFormaPagamento(trim(obVenda.dataSet.FieldByName('tipo').AsString),
        obVenda.dataSet.FieldByName('nped').AsInteger);

      obVenda.vFrmPg.First;
      somaForma := 0;
      while not obVenda.vFrmPg.Eof do
      begin
        somaForma := somaForma + obVenda.vFrmPg.dataSet.FieldByName('valordoc').AsCurrency;
        obCtrl.selecionaControle(obVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger);
        obFinalizador.FindNearest([obCtrl.dataSet.FieldByName('cod_finalizador').AsString]);
        if (obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
          obFinalizador.dataSet.FieldByName('cod_finalizador').AsString) and
          (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger = 0) then
          temDinheiro := true
        else if (obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
          obFinalizador.dataSet.FieldByName('cod_finalizador').AsString) and
          (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger > 0) then
          temCartao := true;
        obVenda.vFrmPg.Next;
      end;

      obVenda.vItem.selecionaItensDaVenda(obVenda.dataSet.FieldByName('nped').AsInteger,
        obVenda.dataSet.FieldByName('tipo').Asstring);
      obVenda.vItem.First;
      while not obVenda.vItem.Eof do
      begin
        if Trim(obVenda.vItem.dataSet.FieldByName('status').AsString) <> 'CANCELADO' then
        if (
          ((obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obVenda.OSPermiteCupom))
          or
          ((obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'T') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obVenda.OSPermiteCupom))
          ) or
          (obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') then
          somaVenda := somaVenda + (obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
            obVenda.vItem.dataSet.FieldByName('qtde').AsCurrency) +
            obVenda.vItem.dataSet.FieldByName('rateio_acresc').AsCurrency -
            obVenda.vItem.dataSet.FieldByName('rateio_desc').AsCurrency;
        obVenda.vItem.Next;
      end;
      //      somaVenda := somaVenda + obVenda.dataSet.FieldByName('acrescimo').AsCurrency +
      //        obVenda.dataSet.FieldByName('desconto').AsCurrency;

      {if (temDinheiro) and (temCartao) and (somaForma > somaVenda) then
      begin
        Application.MessageBox(pchar('Forma de pagamento excede o valor do cupom. ' + #13 +
          'Dinheiro e Cartão foram informados'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        obVenda.desmarcaVendaParaCupom;
        Exit;
      end
      else if (temCartao) and (somaForma > somaVenda) then
      begin
        Application.MessageBox(pchar('Forma de pagamento excede o valor do cupom. ' + #13 +
          'Cartão foi informado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        obVenda.desmarcaVendaParaCupom;
        Exit;
      end;}

      if (vDadosIniF.vDescontoISS = 'N') and
        (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') then
      begin
        if obVenda.verificaDescontoMaiorQueSomaDosItens then
        begin
          Application.MessageBox(pchar('Impressora configurada para não aceitar desconto de ISS' +
            #13 +
            'Valor do desconto maior que a soma de produtos'), 'Atenção', MB_ICONEXCLAMATION +
            MB_OK);
          obVenda.desmarcaVendaParaCupom;
          Exit;
        end;
        obVenda.vItem.First;
        while not obVenda.vItem.dataSet.Eof do
        begin
          if (obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S') then
          begin
            if obVenda.vItem.dataSet.FieldByName('rateio_desc').AsFloat > 0 then
            begin
              Application.MessageBox(pchar('Existem serviços com desconto. Impressora configurada para não aceitar desconto de ISS'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
              obVenda.desmarcaVendaParaCupom;
              Exit;
            end;
          end;
          obVenda.vItem.Next;
        end;
      end;

      obCupom.setNDAV(obVenda.dataSet.FieldByName('nprevenda').AsInteger,
        obVenda.dataSet.FieldByName('nped').AsInteger,
        obVenda.dataSet.FieldByName('data_fech').AsDateTime,
        obVenda.dataSet.FieldByName('valor_total').AsCurrency);
      obCupom.setNContaCliente(obVenda.dataSet.FieldByName('coo_conta_cliente').AsInteger,
        obVenda.dataSet.FieldByName('cer_conta_cliente').AsInteger);
      vValorItens := 0;
      obVenda.vItem.First;
      while not obVenda.vItem.Eof do
      begin
        vProdServ := obVenda.vItem.dataSet.FieldByName('tipo').AsString;
        quantidade := obVenda.vItem.dataSet.FieldByName('qtde').AsString;
        obProd.CustoMedio := obVenda.vItem.dataSet.FieldByName('PCUST_MC').AsFloat;
        if (obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') then
          codBarra := 'GRUPO|CODIGO|' + IntToStr(obVenda.vItem.dataSet.FieldByName('GRUPOOUSERV').AsInteger) + '|' +
            Trim(obVenda.vItem.dataSet.FieldByName('cod_prod').AsString) + '|'
        else
          codBarra := trim(obVenda.vItem.dataSet.FieldByName('num_fab_prod').AsString);
        if ((
          ((obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'S') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obVenda.OSPermiteCupom))
          or
          ((obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'T') and
          (obEmpresa.dataSet.FieldByName('AUT_SERV_CUPOM').AsString = 'S') and
          (obVenda.OSPermiteCupom))
          ) or
          (obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P')) and
          (obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency > 0) then
        begin
          Edit1.Text := quantidade + '*' + codBarra;
          eVlUnit.Valor := obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency;
          obProd.setValorItemAlterado(obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency);
          obProd.setVendaDoRet(true);
          if not enviaItemVenda(quantidade + '*' + codBarra,
            trim(obVenda.vItem.dataSet.FieldByName('descr').AsString),
            (obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency),
            obVenda.dataSet.FieldByName('cod_cliente').AsInteger,
              vDadosIniF.retornoPorCondicao(obVenda.vItem.dataSet.FieldByName('tipo').AsString = 'T',
                obVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger,
                obVenda.vItem.dataSet.FieldByName('COD_VENDEDOR').AsInteger)) then
          begin
            if obCupom.getSubTotal > 0 then
              CancelarCupomAtual1Click(Self);
            obVenda.desmarcaVendaParaCupom;
            exit;
          end;
          nCupom := obCupom.getNCupom;
          if Trim(obVenda.vItem.dataSet.FieldByName('status').AsString) = 'CANCELADO' then
          begin
            if vDadosIniF.EnvCmdsCupom(17) then
              if obCupom.cancelaItem then
              begin
                Memo1.Lines.Add(vDadosIniF.PadR('CANC. ITEM:' +
                  vDadosIniF.StrZeroDec(trunc(obCupom.vItem.getNItem), 3, 0), 30, ' ') + ' ' +
                  vDadosIniF.PadL(FormatFloat('###,###,##0.000',
                  (obCupom.vItem.dataSet.FieldByName('total').AsFloat)), 12, ' '));
                eSubTotal.Valor := obCupom.getSubTotal;
                 vDadosIniF.GravaAuditoria('FIS003','CANCELAR','','CUPOM',obCupom.dataSet.FieldByName('cupom').AsString);
              end;
          end
          else
            vValorItens := vValorItens + obVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
            obVenda.vItem.dataSet.FieldByName('qtde').AsFloat;
        end;
        obVenda.vItem.Next;
      end;
      try
        result := true;
        obCupom.tipoVenda := obVenda.dataSet.FieldByName('tipo').AsString;
        iniciaFechamento;
        obVenda.BuscarDadosCliente;
        obCupom.setDadosAvulso(obVenda.DadosCliente.NomeClienteImp,
                               obVenda.DadosCliente.Endereco,
                               obVenda.DadosCliente.Bairro,
                               obVenda.DadosCliente.Cidade,
                               obVenda.DadosCliente.Estado,
                               obVenda.DadosCliente.CpfCnpj, '','',
                               obVenda.DadosCliente.NomeClienteGravar);
        obCliente.selecionaCliente(obVenda.dataSet.FieldByName('cod_cliente').AsInteger);
        {obCupom.setDadosAvulso(obVenda.dataSet.FieldByName('cod_cliente').AsString + ' '+
        obCliente.dataSet.FieldByName('nome_cliente').AsString,
          Trim(obCliente.dataSet.FieldByName('endereco').AsString) + ', ' +
          obCliente.dataSet.FieldByName('num_end_cliente').AsString,
          obCliente.dataSet.FieldByName('bairro').AsString,
          obCliente.dataSet.FieldByName('cidade').AsString,
          obCliente.dataSet.FieldByName('sigla_uf').AsString,
          obCliente.dataSet.FieldByName('cpfcgc').AsString, '', '',
          obCliente.dataSet.FieldByName('nome_cliente').AsString);}

        if vValorItens > somaVenda then
          setDescontoAcrescimo(vValorItens - somaVenda, 0)
        else
          setDescontoAcrescimo(0, somaVenda - vValorItens);

        //        setDescontoAcrescimo(obVenda.dataSet.FieldByName('desconto').AsCurrency,
        //          obVenda.dataSet.FieldByName('acrescimo').AsCurrency);
        if (temCartao) and (vDadosIniF.strEstaContidoEm(vDadosIniF.vUsaTef, ['E', 'I'])) and
          (vDadosIniF.GetIni('TEF', 'POSVirtual', 'N') <> 'S') then
        else
//        if (not temCartao) or (not vDadosIniF.strEstaContidoEm(vDadosIniF.vUsaTef, ['E', 'I']) ) or
//          (vDadosIniF.GetIni('TEF', 'POSVirtual', 'N') <> 'S') then
        begin
          strControlesDigitadosConf := ',' +
            StringReplace(vDadosIniF.getConfSisStr('paf_ecf_form_pag_digitada_controles', obVenda.buscas), ' ', '', [rfReplaceAll]) + ',';
          obVenda.vFrmPg.First;
          while not obVenda.vFrmPg.Eof do
          begin
            subStrComparacao := ',' + IntToStr(obVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger) + ',';
            obCtrl.selecionaControle(obVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger);
            if (not obCtrl.dataSet.IsEmpty) and (obCtrl.dataSet.FieldByName('cod_finalizador').AsInteger <> 0) and
              (Pos(subStrComparacao, strControlesDigitadosConf) = 0) then
            begin
              obFinalizador.FindNearest([obCtrl.dataSet.FieldByName('cod_finalizador').AsString]);
              if obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
                obFinalizador.dataSet.FieldByName('cod_finalizador').AsString then
                if not formaPagamento(obVenda.vFrmPg.dataSet.FieldByName('valordoc').AsCurrency,
                  obVenda.dataSet.FieldByName('cod_cliente').AsString) then
                begin
                  CancelarCupomAtual1Click(self);
                  obVenda.desmarcaVendaParaCupom;
                  lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
                  ldescricao.Caption := '';
                  Edit1.Text := '';
                  eSubTotal.Valor := obCupom.getSubTotal;
                  Result := false;
                  exit;
                end;
            end;
            obVenda.vFrmPg.Next;
          end;
        end;
        if obCupom.getValorRestante > 0 then
        begin
          Application.CreateForm(TfrmFechamento, frmFechamento);
          frmFechamento.Edit1.Text := obVenda.dataSet.FieldByName('cod_cliente').AsString;
          obFinalizador.getTodos;
          obFinalizador.First;
          obCupom.setMemo(Memo1);
          frmFechamento.gridFina.DataSource := DtmConfigF.dsFinaliz;

          frmFechamento.ShowModal;
          if frmFechamento.ModalResult = mrok then
          begin
            Memo1.Lines.Clear;
            eVlUnit.Valor := 0;
            lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
            ldescricao.Caption := 'Obrigado! Volte Sempre!';
            Edit1.Text := '';
            eSubTotal.Valor := obCupom.getSubTotal;
            Result := true;
          end
          else if frmFechamento.ModalResult = mrAbort then
          begin
            CancelarCupomAtual1Click(Self);
            lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
            ldescricao.Caption := '';
            Edit1.Text := '';
            eSubTotal.Valor := obCupom.getSubTotal;
            Result := false;
            exit;
          end
          else if frmFechamento.ModalResult <> mrOk then
          begin
            CancelarCupomAtual1Click(Self);
            lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
            ldescricao.Caption := '';
            Edit1.Text := '';
            eSubTotal.Valor := obCupom.getSubTotal;
            Result := false;
            exit;
          end;
          frmFechamento.Free;
          frmFechamento := nil;
        end
        else
        begin
          Memo1.Lines.Clear;
          eVlUnit.Valor := 0;
          lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
          ldescricao.Caption := 'Obrigado! Volte Sempre!';
          Edit1.Text := '';
          Result := true;
          eSubTotal.Valor := obCupom.getSubTotal;
        end;
      finally
        if Result then
        begin            
          try
            obVenda.nCCF := obCupom.dataSet.FieldByName('ccf').AsInteger; //StrToInt(Trim(CImpressoraF.numeroCCF));
          except
            obVenda.nCCF := 0;
          end;
          if not obVenda.confirmaEmissaoCupomVenda(StrToInt(trim(nCupom)),
            obCupom.dataSet.FieldByName('prevenda').AsInteger) then
          begin
            Application.MessageBox(pchar('Atenção! Venda não foi atualizada no retaguarda.'),
              'Atenção', MB_ICONEXCLAMATION + MB_OK);
            obVenda.desmarcaVendaParaCupom;
          end;
        end
        else obVenda.desmarcaVendaParaCupom;
      end;
    finally
      habilitaControles;
    end;
  finally
    Edit1.Clear;
    obVenda.Close;
    obVenda.CommitaTransacao;
    AtualizarcacheSistema1.Click;
//    vDadosIniF.limpaMensagem;
    if vDadosIniF.vFiscalAtivo = 'S' then
    begin
      frmPrincipalFiscal.Visible := false;
      frmPrincipalFiscal.Refresh;
    end;
  end;
end;

procedure TfrmPrincipalFiscal.RecebimentodePrestao1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS009', 'PRESTAÇÃO','','','') then
      Exit;

    Application.CreateForm(TfrmPrestacoesF, frmPrestacoesF);
    obRecPrest := TRecebimentoPrestacao.Create;
    frmPrestacoesF.ShowModal;
    obRecPrest.Free;
    obRecPrest := nil;
    AtualizarcacheSistema1.Click;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.ReduoZ1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit          
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    vDadosIniF.MensagemFiscal('Redução Z! Aguarde...');
    try
      Edit1.ReadOnly := True;
      vDadosIniF.reducaoZ;
    finally
      CImpressoraF.FechaPortaSerial;
      Edit1.ReadOnly := False;
    end;

		if CImpressoraF.SemDireitoDeUso then
			lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
		else if CImpressoraF.SemArquivoAux then
			lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
		else if vDadosIniF.caixaFiscalFechado('N') then
			lMsg.Caption := '<<<< CAIXA FECHADO >>>>'
    else
      lMsg.Caption := '<<<< CAIXA ABERTO >>>>';

    Edit1.SetFocus;
    ldescricao.Caption := '';
  finally
    vDadosIniF.limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.RegistrosdeOrdemSerieeSubSerie1Click(
  Sender: TObject);
//var
//  obNfSerieD: TNfSerieD;
begin
  inherited;
//  try
//    Screen.Cursor := crDefault;
//
//
//    if (vDadosIniF.semComunicacaoComECF('N')) or
//      (vDadosIniF.diferencaNoGrandeTotal('N'))or
//      (vDadosIniF.diferencaNoNumeroSerie('N')) or
//      (vDadosIniF.caixaFiscalFechado('N')) then
//    begin
//
//
//        obNfSerieD := TNfSerieD.Create;
//        obNfSerieD.CadNfSerieD;
//        try
//
//        finally
//          vDadosIniF.limpaMensagem;
//        end;
//    end
//    else
//      application.messagebox(pchar('Utilize a emissão de cupom Fiscal'), 'Atenção',
//        MB_ICONEXCLAMATION + mb_OK);
//  finally
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TfrmPrincipalFiscal.ResumodeVendas1Click(Sender: TObject);
var
  ms: string;
begin
  inherited;
  try

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS024', 'RELATÓRIO','','','', nil, False)then
      exit;

    ms := lMsg.Caption;
    Application.CreateForm(TFrmRelPeriodo, frmRelPeriodo);
    if frmRelPeriodo.showmodal = mrOK then
    begin
      if (frmRelPeriodo.MaskEdit1.Text = '  /  /    ') or
        (frmRelPeriodo.MaskEdit2.Text = '  /  /    ') then
      begin
        application.messagebox(pchar('Período informado inválido'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK);
        exit;
      end;
      TRY
        StrToDate(frmRelPeriodo.MaskEdit1.Text);
        StrToDate(frmRelPeriodo.MaskEdit2.Text);
      except
        application.messagebox(pchar('Período informado inválido'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK);
        exit;
      end;
      obCupom.vTotalVenda.selecionaPeriodo(StrToDate(frmRelPeriodo.MaskEdit1.Text),
        StrToDate(frmRelPeriodo.MaskEdit2.Text));
      lMsg.Caption := 'Aguarde! Imprimindo Relatório...';
      lMsg.Refresh;
      if not obCupom.vTotalVenda.dataSet.IsEmpty then
      begin
        vDadosIniF.ImpResumoVnd;
        vDadosIniF.GravaAuditoria('FIS024', 'RELATÓRIO','','','');
        application.messagebox(pchar('Relatório concluído'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK);
        exit;
      end
      else
      begin
        application.messagebox(pchar('Nenhuma venda encontrada no período informado'), 'Atenção',
          MB_ICONEXCLAMATION + mb_OK);
        exit;
      end;
    end;
  finally
    lMsg.Caption := ms;
    frmRelPeriodo.free;
    frmRelPeriodo := nil;
  end;
end;

procedure TfrmPrincipalFiscal.rocadeOperador1Click(Sender: TObject);
var
  codigoAntigo: integer;
begin
	inherited;
	try
		Screen.Cursor := crHourGlass;
		if CImpressoraF.SemDireitoDeUso then
			lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
		else if CImpressoraF.SemArquivoAux then
			lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
		else if vDadosIniF.statusCaixa <> 0 then
			Exit;

    if Application.MessageBox(pchar('Deseja fazer a Troca/Fechamento do Operador?'), 'Confirmação',
			MB_ICONQUESTION + MB_YESNO) = mrYES then
		begin
			codigoAntigo := vDadosIniF.vCodUsuario;

			if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not vDadosIniF.strEstaContidoEm(vDadosIniF.vModoSistema, ['S', 'J'])) then
				obMovOP.fecharMovimento(vDadosIniF.vCodUsuario)
			else
			begin
				if not obTmpOp.efetuarFechamentoDeOperador(vDadosIniF.vCodUsuario, True) then
					Exit
				else
					obTmpOp.registraSaidaOperador(vDadosIniF.vCodUsuario);
			end;

			lmsg.Caption := '<<<< TROCA DE OPERADOR >>>>';
      ldescricao.caption := '<< TROCA DE OPERADOR >>';

			if (vDadosIniF.semComunicacaoComECF('N')) or
        (vDadosIniF.diferencaNoGrandeTotal('N')) or
        (vDadosIniF.diferencaNoNumeroSerie('N')) then
      else
      begin
				vDadosIniF.FecharOp;
			end;
			if not dtmEnt.verificaEntrada then
			begin
				Exit;
				Abort;
			end;

			if CImpressoraF.SemDireitoDeUso then
				lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
			else if CImpressoraF.SemArquivoAux then
				lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
			else if vDadosIniF.statusCaixa = 0 then
			begin
				lmsg.Caption := '<<<< CAIXA ABERTO >>>>';
				ldescricao.caption := '';

				if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not vDadosIniF.strEstaContidoEm(vDadosIniF.vModoSistema, ['S', 'J'])) then
					obMovOP.abrirMovimento(vDadosIniF.vCodUsuario)
				else
				if not obTmpOp.registraEntradaOperador(vDadosIniF.vCodUsuario) then
					if not vDadosIniF.caixaFiscalFechado('N') then
						Halt(0);
			end;
    end;
  finally
    vDadosIniF.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.Sair1Click(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vModoSistema = 'S' then
  begin
    frmPrincipalFiscal.Visible := false;
    frmPrincipalFiscal.Refresh;
  end
  else
    Close;
end;

procedure TfrmPrincipalFiscal.SangriaSuprimentos1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;

    if not vDadosIniF.PesqPros('FIS010', 'SANGRIA/SUPRIMENTO','','','', dtmEnt.qrBuscas,True) then
      Exit;

    Application.CreateForm(TfrmSangSup, frmSangSup);
    obSangSup := tSangSup.Create;
    frmSangSup.ShowModal;
    obSangSup.Free;
    obSangSup := nil;
    AtualizarcacheSistema1.Click;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.SelecionarTabeladePreo1Click(Sender: TObject);
var
  vListaTabPreco: TStringList;
begin
  inherited;
  if vDadosIniF.impressaoEmAndamento('S') then
    Exit;

  vListaTabPreco := TStringList.Create;
  vListaTabPreco.Text := vDadosIniF.vStringTabelaPrecoADPAF;
  if vListaTabPreco.Count = 0 then
  begin
    Application.MessageBox('Nenhuma tabela de preço adicional configurada', 'Atenção', 0 + 64);
    Exit;
  end;
  vListaTabPreco.Add('A Vista');
  vListaTabPreco.Sort;

  Application.CreateForm(TfrmTabelaDePreco, frmTabelaDePreco);
  frmTabelaDePreco.ListBox1.Items.Text := vListaTabPreco.Text;
  frmTabelaDePreco.ListBox1.ItemIndex := 0;
  if frmTabelaDePreco.ShowModal = mrOk then
  begin
    obProd.setSqlProdutos(frmTabelaDePreco.ListBox1.Items[frmTabelaDePreco.ListBox1.ItemIndex]);
    obProd.Close;
  end;
  frmTabelaDePreco.Free;
  frmTabelaDePreco := nil
end;

function TfrmPrincipalFiscal.setDescontoAcrescimo(desconto,
  acrescimo: Currency): boolean;
begin
  if desconto > 0 then
  begin
    obCupom.setDescontoFechamento(desconto);
    obCupom.setSubTotal;
    obCupom.addMensagemMemo('Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]));
    obCupom.addMensagemMemo('Desconto  R$   ' + Format(' %10.2f', [desconto]));

    lMsg.Caption := 'Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]);
  end
  else if acrescimo > 0 then
  begin
    obCupom.setAcrescimoFechamento(acrescimo);
    obCupom.setSubTotal;
    obCupom.addMensagemMemo('Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]));
    obCupom.addMensagemMemo('Acrescimo  R$   ' + Format(' %10.2f', [acrescimo]));

    lMsg.Caption := 'Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]);
  end;
end;

procedure TfrmPrincipalFiscal.ShowForm;
var
  temp, FileName: string;
  reestrutura_verificar_hwauto: Treestrutura_verificar_hwauto;
  reestrutura_verificar_hwf   : Treestrutura_verificar_hwf;
  reestrutura_verificar_fiscal: Treestrutura_verificar_fiscal;
begin
  try
    altF4 := False;
    //MenuFiscal1.Enabled := False;
    //Sair1.Enabled := False;

    if FindWindow('TfrmPrincipalFiscal', 'Sistema ECF - Teclado PDV') > 0 then
    begin
      SetForegroundWindow(FindWindow('TfrmPrincipalFiscal', 'Sistema ECF - Teclado PDV'));
      Halt(0);
    end
    else if FindWindow('TfrmPrincipalFiscal', 'Sistema ECF - Teclado Padrão') > 0 then
    begin
      SetForegroundWindow(FindWindow('TfrmPrincipalFiscal', 'Sistema ECF - Teclado Padrão'));
      Halt(0);
    end;

    //Instanciando vDadosIniF do Fiscal
    TSingleton(vDadosIniF) := TIni.GetInstance;
    if vDadosIniF.vSistema = '' then
      vDadosIniF.vSistema := 'Fiscal';
    if vDadosIniF.vSistema = 'Fiscal' then
      Application.Title := 'PAF-ECF';
    
    //Instanciando o pacote Ativo
    CarregaPacote('pkAtivosF', hdAtivo);
    dtmAtivo := TdtmAtivo.Create(dtmAtivo);

    //Instanciando DTM usados no Fiscal
  //  dtmFiscalHw := TdtmFiscalHw.Create(dtmFiscalHw);
    DtmFiscal := TDtmFiscal.Create(DtmFiscal);
    DtmFiscalHwF := TDtmFiscalHwF.Create(DtmFiscalHwF);
    DtmFiscalHwF.verificarConexao;
    dtmSincF := TdtmSincF.Create(dtmSincF);

    // Carregando pacote de configuraçoes e inicializando conceccoes
    CarregaPacote('pkConfigF', hdConfigF);
    DtmConfigF := TDtmConfigF.Create(DtmConfigF);

    // Carregando pacote de TEF e inicializando concecções
    CarregaPacote('pkTEF', hdTEF);
    dtmTef := TdtmTef.Create(dtmTef);


//    if vDadosIniF.vUsaTef = 'E' then
//       obtef := TTEFDedicado.create
//    else
//       obtef := TTEFDiscado.create;

    CarregaPacote('pkDAVf', hdDavF);
    dtmDavF := TdtmDavF.Create(dtmDavF);

//    CarregaPacote('pkNfSerieD', hdNfSD);

//    CarregaPacote('PkTerminaisFF', hdTerminalF);
    dtmTerminaisF := TdtmTerminaisF.Create(dtmTerminaisF);

    CarregaPacote('PkArquivosDig', hdArqDig1);
    dtmArqsDig := TDtmArqsDig.Create(DtmArqsDig);
    //DtmArqsDig.criaDtm;

    //Conectando aos bancos
    if not vDadosIniF.conectaBancos then
    begin
      if vDadosIniF.vSistema = 'Fiscal' then
      begin
        vDadosIniF.vRespModoSistema := '1';
        Halt(0);
      end;
    end;

    //Verificando entrada usuario e senha
    if vDadosIniF.vSistema = 'Fiscal' then
    begin
      if not FileExists(ExtractFilePath(ParamStr(0)) + 'pkEntradaF.bpl') then
      begin
        Application.MessageBox(pchar('Pacote ' + ExtractFilePath(ParamStr(0)) +
          'pkEntradaF.bpl não existe.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        Halt(0);
      end;
      hdEntrada := LoadPackage('pkEntradaF.bpl');
      if hdEntrada = 0 then
      begin
        Application.MessageBox(pchar('Pacote não carregado '), 'Atenção', MB_ICONEXCLAMATION +
          MB_OK);
        Halt(0);
      end;
      dtmEnt := TdtmEnt.Create(dtmEnt);
      vDadosIniF.vSistema := 'Fiscal';

      dtmEnt.verificaEstruturaBancoDeDados;

      //Nova reestruturação
      hdReestrutura := 0;
      CarregaPacote('pkReestrutura', hdReestrutura);
      if hdReestrutura = 0 then
        Application.MessageBox('Pacote de reestruturação não carregado', 'Anteção', 0 + 64)
      else
      begin
        try
          if vDadosIniF.vTipoConexao <> 'off' then
          begin
            @reestrutura_verificar_hwauto := GetProcAddress(hdReestrutura, 'reestrutura_verificar_hwauto');
            if Assigned(reestrutura_verificar_hwauto) then
              reestrutura_verificar_hwauto(PChar(vDadosIniF.vVersaoBpl));
          end;
          @reestrutura_verificar_hwf := GetProcAddress(hdReestrutura, 'reestrutura_verificar_hwf');
          if Assigned(reestrutura_verificar_hwf) then
            reestrutura_verificar_hwf(PChar(vDadosIniF.vVersaoBpl));
          @reestrutura_verificar_fiscal := GetProcAddress(hdReestrutura, 'reestrutura_verificar_fiscal');
          if Assigned(reestrutura_verificar_fiscal) then
            reestrutura_verificar_fiscal(PChar(vDadosIniF.vVersaoBpl));
        except
          Application.MessageBox('Pacote de reestruturação não executado', 'Anteção', 0 + 64)
        end;
      end;

      if not dtmEnt.verificaEntrada then
      begin
        Halt(0);
      end;
      Left := 0;
			Top := 0;
			if StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600) < 600 then
				ClientHeight := 600
			else
				ClientHeight := StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600);
			if StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800) < 800 then
				ClientWidth := 800
			else
				ClientWidth := StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800);
      try
        imgLogo.Proportional := false;
        imgLogo.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
        imgHw.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);

        FileName := vDadosIniF._LerConfiguracoesRegistroString('PAF-Logo1', '');
        if not FileExists(FileName) then
        begin
          FileName := ExtractFilePath(Application.ExeName) + 'logo.jpg';
          if FileExists(FileName) then
            RenameFile(FileName, ExtractFilePath(Application.ExeName) + 'logo_old.jpg');
          vDadosIniF.saveResourceToFile('logomin', 'jpg', FileName);
          vDadosIniF._GravaConfiguracoesString('PAF-Logo1', FileName);
        end;
        if FileExists(FileName) then
          imgLogo.Picture.LoadFromFile(FileName);

        FileName := vDadosIniF._LerConfiguracoesRegistroString('PAF-Logo2', '');
        if not FileExists(FileName) then
        begin
          FileName := ExtractFilePath(Application.ExeName) + 'hw.jpg';
          if FileExists(FileName) then
            RenameFile(FileName, ExtractFilePath(Application.ExeName) + 'hw_old.jpg');
          vDadosIniF.saveResourceToFile('hwmin', 'jpg', FileName);
          vDadosIniF._GravaConfiguracoesString('PAF-Logo2', FileName);
        end;
        if FileExists(FileName) then
          imgHw.Picture.LoadFromFile(FileName);
      except
      end;

      if not vDadosIniF.inicializaFiscal then
      begin
        Halt(0);
        Application.Terminate;
        Abort;
        exit;
      end;
      temp:='';
      temp:= CImpressoraF.obterCNPJUsuario;
      if temp <> '' then
        vDadosIniF.vEmp.vCNPJ := temp;
      if not sistemaRegistrado(vDadosIniF.vEmp.vCNPJ,'PAF-ECF') then
      begin
        Halt(0);
        Application.Terminate;
        Exit;
        Abort;
			end;

			CImpressoraF.SemDireitoDeUso :=
				not validaChaveEmpresa('HW' + vDadosIniF.vVersaoBpl, vDadosIniF.GetBaseDados('Banco', 'HW'), vDadosIniF.CodEmpresa);

			Utilitrios1.Enabled := not CImpressoraF.SemDireitoDeUso;

      try
        vDadosIniF.MensagemFiscal('Aguarde... Iniciando variáveis');
        Application.CreateForm(TfrmPesqClientes, frmPesqClientes);
        Application.CreateForm(TfrmPesqProdutos, frmPesqProdutos);
        Application.CreateForm(TfrmPesqServicos, frmPesqServicos);
        vDadosIniF.vCodTerminal := IntToStr(StrToIntDef(obConfImp.dataSet.FieldByName('cod_terminal').AsString, 1));
        vDadosIniF.vNumSerieEcf := vDadosIniF.getNumSerieEcfDescriptografado;
        //          vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
				vDadosIniF.vUsaCodigoBarras :=
          vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('usar_codbarra').AsString);
        Caption := 'Sistema ECF';
				if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString) = 'S' then
          caption := caption + ' - Teclado PDV'
        else
					caption := caption + ' - Teclado Padrão';
				vProdServ := 'P';
				if CImpressoraF.SemDireitoDeUso then
					lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
				else if CImpressoraF.SemArquivoAux then
					lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
				else if vDadosIniF.statusCaixa = 0 then
					lMsg.Caption := '<<<< CAIXA ABERTO >>>>'
				else
          lMsg.Caption := '<<<< CAIXA FECHADO >>>>';
        ldescricao.Caption := '';

        Application.Title := 'PAF-ECF';

				enterTela := TEnterHw.Create(Self);
        enterTela.ClassList.Clear;
        enterTela.classList.Add('TMaskEdit');
        enterTela.classList.Add('TEdit');
        enterTela.classList.Add('TDBEdit');
        enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
        enterTela.classList.Add('TEditHw'); { Componente de Moeda e Inteiros HwSistemas}
        enterTela.classList.Add('TCheckBox');
        enterTela.classList.Add('TDBCheckBox');
        enterTela.classList.Add('TComboBox');
        enterTela.classList.Add('TDBComboBox');
        enterTela.classList.Add('TListBox');
        enterTela.classList.Add('TDBListBox');
        enterTela.classList.Add('TDBLookupListBox');
        enterTela.classList.Add('TDBLookupComboBox');
        enterTela.classList.Add('TSpinEdit');
        enterTela.classList.Add('TDateTimePicker');
        enterTela.classList.Add('TRadioGroup');
        enterTela.classList.Add('TDBRadioGroup');
        enterTela.classList.Add('TRadioButton');
        enterTela.classList.Add('TDBRadioButton');

        if vDadosIniF.vUsaLeitorSerial = 'S' then
        begin
          //          lBarra.Desativar;
          //          lBarra.Porta := 'COM' + IntToStr(obConfImp.dataSet.FieldByName('PORTA_LEITOR').AsInteger);
          //          if trim(vDadosIniF.vSufixoLCB) <> '' then
          //            lBarra.Sufixo := trim(vDadosIniF.vSufixoLCB);
          //          try
          //            lBarra.Ativar;
          //          except
          //            vDadosIniF.vUsaLeitorSerial := 'N';
          //            MessageBeep(1);
          //            Application.MessageBox(pchar('Leitor Serial não pode ser ativado. Problemas de comunicação!'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          //          end;
        end;

        if ((not obProd.Active) or (obProd.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
        begin
          try
            vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Itens..');
            obProd.getTodos;
          finally
            vDadosIniF.limpaMensagem;
          end;
				end;

				if CImpressoraF.SemDireitoDeUso then
				else if CImpressoraF.SemArquivoAux then
				else if vDadosIniF.statusCaixa = 0 then
				begin
					if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not vDadosIniF.strEstaContidoEm(vDadosIniF.vModoSistema, ['S', 'J'])) then
					begin
						obMovOP.abrirMovimento(vDadosIniF.vCodUsuario);
						if obMovOP.operador <> vDadosIniF.vCodUsuario then
						begin
							Application.MessageBox(PChar('Movimento ' + vDadosIniF.StrZero(obMovOP.numMovimento, 4) +
								' do dia ' + FormatDateTime('dd/mm/yyyy', obMovOP.diaAberto) +
								' Aberto para o usuário: ' + vDadosIniF.StrZero(obMovOP.operador, 4)), 'Atenção', 0 + 64);
							Halt(0);
						end;
					end
					else
					begin
						if not obTmpOp.registraEntradaOperador(vDadosIniF.vCodUsuario) then
							if not vDadosIniF.caixaFiscalFechado('N') then
								Halt(0);
					end;
				end;

        /// Aqui o sistema irá verificar se existe cupom fiscal aberto para efetuar o fechamento ou cancelamento do mesmo
        if vDadosIniF.vCancelarCupomOuMontarCupom <> 'C' then
          verificaCupomFiscalAbertoParaRemontagem;

        LerPrVendaRetaguarda1.Visible := vDadosIniF.vEmp.vUsarPreVenda = 'S';
        LerPrVendaRetaguarda1.Enabled := LerPrVendaRetaguarda1.Visible;

      finally
				vDadosIniF.limpaMensagem;
      end;
    end;
  finally
    if vDadosIniF.vUsaTecladoPDV = 'S' then
    begin
      Application.OnMessage := processaMensagem;
      OnKeyDown := nil;
    end;
//    MenuFiscal1.Enabled := true;
//    Sair1.Enabled := true;
  end;
end;

procedure TfrmPrincipalFiscal.ShowFormModoJ;
var
  temp: string;
begin
	try
    vDadosIniF.vRespModoSistema := '1';
    vDadosIniF.vFiscalAtivo := 'S';
    //Instanciando vDadosIniF do Fiscal
    TSingleton(vDadosIniF) := TIni.GetInstance;
    if vDadosIniF.vSistema = 'Fiscal' then
      Application.Title := 'PAF-ECF';
    //Instanciando o pacote Ativo
//jp    CarregaPacote('pkAtivosF', hdAtivo);
    if dtmAtivo = nil then
      dtmAtivo := TdtmAtivo.Create(dtmAtivo);

    //Instanciando DTM usados no Fiscal
  //  dtmFiscalHw := TdtmFiscalHw.Create(dtmFiscalHw);
    if DtmFiscal = nil then
      DtmFiscal := TDtmFiscal.Create(DtmFiscal);
    if DtmFiscalHwF = nil then
      DtmFiscalHwF := TDtmFiscalHwF.Create(DtmFiscalHwF);
    DtmFiscalHwF.verificarConexao;

    // Carregando pacote de configuraçoes e inicializando conceccoes
//jp    CarregaPacote('pkConfigF', hdConfigF);
    if DtmConfigF = nil then
      DtmConfigF := TDtmConfigF.Create(DtmConfigF);

    // Carregando pacote de TEF e inicializando concecções
//jp    CarregaPacote('pkTEF', hdTEF);
    if dtmTef = nil then
      dtmTef := TdtmTef.Create(dtmTef);

//jp    CarregaPacote('PkArquivosDig', hdArqDig1);
    dtmArqsDig := TDtmArqsDig.Create(DtmArqsDig);
    //DtmArqsDig.criaDtm;

//    if vDadosIniF.vUsaTef = 'E' then
//       obtef := TTEFDedicado.create
//    else
//       obtef := TTEFDiscado.create;

    // Carregando pacote de formas de pagamento e inicializando conecções

//jp    CarregaPacote('pkDAVf', hdDavF);
    if dtmDAVF = nil then
      dtmDavF := TdtmDavF.Create(dtmDavF);

//jp    CarregaPacote('pkNfSerieDF', hdNfSD);

    //Conectando aos bancos
    if not vDadosIniF.conectaBancos then
    begin
      vDadosIniF.vFiscalAtivo := 'N';
      vDadosIniF.vRespModoSistema := '1';
      exit;
    end;

    //Verificando usuario
    Left := 0;
    Top := 0;
		if StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600) < 600 then
			ClientHeight := 600
		else
			ClientHeight := StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600);
		if StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800) < 800 then
			ClientWidth := 800
		else
			ClientWidth := StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800);
    try
      imgLogo.Proportional := false;
      imgLogo.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
      imgHw.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
      imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
      imgHw.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'hw.jpg');
    except
    end;
    if not vDadosIniF.inicializaFiscal then
    begin
      vDadosIniF.vFiscalAtivo := 'N';
      vDadosIniF.vRespModoSistema := '1';
      Timer2.Enabled := true;
      exit;
    end;
    temp:='';
    temp:= CImpressoraF.obterCNPJUsuario;
    if temp <> '' then
      vDadosIniF.vEmp.vCNPJ := temp;
    if not sistemaRegistrado(vDadosIniF.vEmp.vCNPJ,'PAF-ECF') then
    begin
      vDadosIniF.vFiscalAtivo := 'N';
      vDadosIniF.vRespModoSistema := '1';
      Exit;
      Abort;
    end;
    try
      vDadosIniF.MensagemFiscal('Aguarde... Iniciando variáveis');
      Application.CreateForm(TfrmPesqClientes, frmPesqClientes);
      Application.CreateForm(TfrmPesqProdutos, frmPesqProdutos);
			Application.CreateForm(TfrmPesqServicos, frmPesqServicos);
			vDadosIniF.vCodTerminal := IntToStr(StrToIntDef(obConfImp.dataSet.FieldByName('cod_terminal').AsString, 1));
      vDadosIniF.vNumSerieEcf := vDadosIniF.getNumSerieEcfDescriptografado;
      //        vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
      vDadosIniF.vUsaCodigoBarras :=
        vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('usar_codbarra').AsString);
      Caption := 'Sistema ECF.';
      if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString) = 'S' then
        caption := caption + ' - Teclado PDV'
      else
        caption := caption + ' - Teclado Padrão';
			vProdServ := 'P';
			if CImpressoraF.SemDireitoDeUso then
				lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
			else if CImpressoraF.SemArquivoAux then
				lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
			else if vDadosIniF.statusCaixa = 0 then
        lMsg.Caption := '<<<< CAIXA ABERTO >>>>'
      else
        lMsg.Caption := '<<<< CAIXA FECHADO >>>>';
      ldescricao.Caption := '';

      if vDadosIniF.vUsaLeitorSerial = 'S' then
      begin
        //        lBarra.Desativar;
        //        lBarra.Porta := 'COM' + IntToStr(obConfImp.dataSet.FieldByName('PORTA_LEITOR').AsInteger);
        //        if trim(vDadosIniF.vSufixoLCB) <> '' then
        //          lBarra.Sufixo := trim(vDadosIniF.vSufixoLCB);
        //        try
        //          lBarra.Ativar;
        //        except
        //          vDadosIniF.vUsaLeitorSerial := 'N';
        //          MessageBeep(1);
        //          Application.MessageBox(pchar('Leitor Serial não pode ser ativado. Problemas de comunicação!'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        //        end;
      end;

      if ((not obProd.Active) or (obProd.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
      begin
        try
          vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Itens..');
          obProd.getTodos;
        finally
          vDadosIniF.limpaMensagem;
        end;
      end;
			if not obTmpOp.registraEntradaOperador(vDadosIniF.vCodUsuario) then
				if not vDadosIniF.caixaFiscalFechado('N') then
          Halt(0);
        
      vDadosIniF.vRespModoSistema := '0';
    finally
      vDadosIniF.limpaMensagem;
    end;
  finally
    enterTela := TEnterHw.Create(Self);
    enterTela.ClassList.Clear;
    enterTela.classList.Add('TMaskEdit');
    //    enterTela.classList.Add('TEdit');
    enterTela.classList.Add('TDBEdit');
    enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
    enterTela.classList.Add('TCheckBox');
    enterTela.classList.Add('TDBCheckBox');
    enterTela.classList.Add('TComboBox');
    enterTela.classList.Add('TDBComboBox');
    enterTela.classList.Add('TListBox');
    enterTela.classList.Add('TDBListBox');
    enterTela.classList.Add('TDBLookupListBox');
    enterTela.classList.Add('TDBLookupComboBox');
    enterTela.classList.Add('TSpinEdit');
    enterTela.classList.Add('TDateTimePicker');
    enterTela.classList.Add('TRadioGroup');
    enterTela.classList.Add('TDBRadioGroup');
    enterTela.classList.Add('TRadioButton');
    enterTela.classList.Add('TDBRadioButton');
    if vDadosIniF.vRespModoSistema = '1' then
    begin
      vDadosIniF.vFiscalAtivo := 'N';
      DtmFiscal.Free;
      DtmFiscalHwF.Free;
      dtmTef.Free;
      dtmDAVF.Free;
      DtmFiscal := nil;
      DtmFiscalHwF := nil;
      dtmTef := nil;
      dtmDAVF := nil;
//      UnloadPackage(hdTEF);
//      UnloadPackage(hdDavF);
//      UnloadPackage(hdNfSD);
    end;
    vDadosIniF.limpaMensagem;
  end;
end;

procedure TfrmPrincipalFiscal.ShowFormModoS;
var
  temp: string;
  reestrutura_verificar_hwauto: Treestrutura_verificar_hwauto;
  reestrutura_verificar_hwf   : Treestrutura_verificar_hwf;
  reestrutura_verificar_fiscal: Treestrutura_verificar_fiscal;
begin
	try
    altF4 := False;
//    MenuFiscal1.Enabled := False;
//    Sair1.Enabled := False;

    //Instanciando vDadosIniF do Fiscal
    TSingleton(vDadosIniF) := TIni.GetInstance;
    if vDadosIniF.vSistema = '' then
      vDadosIniF.vSistema := 'Fiscal';
    if vDadosIniF.vSistema = 'Fiscal' then
      Application.Title := 'PAF-ECF';

    //Instanciando DTM usados no Fiscal
  //  dtmFiscalHw := TdtmFiscalHw.Create(dtmFiscalHw);
    DtmFiscal := TDtmFiscal.Create(DtmFiscal);
    DtmFiscalHwF := TDtmFiscalHwF.Create(DtmFiscalHwF);
    DtmFiscalHwF.verificarConexao;
    dtmSincF := TdtmSincF.Create(dtmSincF);

    // Carregando pacote de configuraçoes e inicializando conceccoes
    CarregaPacote('pkConfigF', hdConfigF);
    DtmConfigF := TDtmConfigF.Create(DtmConfigF);

    // Carregando pacote de TEF e inicializando concecções
    CarregaPacote('pkTEF', hdTEF);
    dtmTef := TdtmTef.Create(dtmTef);

//    if vDadosIniF.vUsaTef = 'E' then
//       obtef := TTEFDedicado.create
//    else
//       obtef := TTEFDiscado.create;

    CarregaPacote('pkDAVf', hdDavF);
    dtmDavF := TdtmDavF.Create(dtmDavF);

//    CarregaPacote('pkNfSerieD', hdNfSD);

//    CarregaPacote('PkTerminaisFF', hdTerminalF);
    dtmTerminaisF := TdtmTerminaisF.Create(dtmTerminaisF);

    CarregaPacote('PkArquivosDig', hdArqDig1);
    dtmArqsDig := TDtmArqsDig.Create(DtmArqsDig);
    //DtmArqsDig.criaDtm;

    //Conectando aos bancos
    if not vDadosIniF.conectaBancos then
    begin
      if vDadosIniF.vSistema = 'Fiscal' then
      begin
        vDadosIniF.vRespModoSistema := '1';
        exit;
      end;
    end;

    //Verificando entrada usuario e senha
    if vDadosIniF.vSistema = 'Fiscal' then
    begin
      if not FileExists(ExtractFilePath(ParamStr(0)) + 'pkEntradaF.bpl') then
      begin
        Application.MessageBox(pchar('Pacote ' + ExtractFilePath(ParamStr(0)) +
          'pkEntradaF.bpl não existe.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
        vDadosIniF.vRespModoSistema := '1';
        Exit;
      end;
      hdEntrada := LoadPackage('pkEntradaF.bpl');
      if hdEntrada = 0 then
      begin
        Application.MessageBox(pchar('Pacote não carregado '), 'Atenção', MB_ICONEXCLAMATION +
          MB_OK);
        vDadosIniF.vRespModoSistema := '1';
        Exit;
      end;
      dtmEnt := TdtmEnt.Create(dtmEnt);
      vDadosIniF.vSistema := 'Fiscal';

      dtmEnt.verificaEstruturaBancoDeDados;

      //Nova reestruturação
      hdReestrutura := 0;
      CarregaPacote('pkReestrutura', hdReestrutura);
      if hdReestrutura = 0 then
        Application.MessageBox('Pacote de reestruturação não carregado', 'Anteção', 0 + 64)
      else
      begin
        try
          if vDadosIni.vTipoConexao <> 'off' then
          begin
            @reestrutura_verificar_hwauto := GetProcAddress(hdReestrutura, 'reestrutura_verificar_hwauto');
            if Assigned(reestrutura_verificar_hwauto) then
              reestrutura_verificar_hwauto(PChar(vDadosIni.vVersaoBpl));
          end;
          @reestrutura_verificar_hwf := GetProcAddress(hdReestrutura, 'reestrutura_verificar_hwf');
          if Assigned(reestrutura_verificar_hwf) then
            reestrutura_verificar_hwf(PChar(vDadosIni.vVersaoBpl));
          @reestrutura_verificar_fiscal := GetProcAddress(hdReestrutura, 'reestrutura_verificar_fiscal');
          if Assigned(reestrutura_verificar_fiscal) then
            reestrutura_verificar_fiscal(PChar(vDadosIni.vVersaoBpl));
        except
          Application.MessageBox('Pacote de reestruturação não executado', 'Anteção', 0 + 64)
        end;
      end;

      if not dtmEnt.verificaEntrada then
      begin
        vDadosIniF.vRespModoSistema := '1';
        Exit;
      end;

      Left := 0;
      Top := 0;
			if StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600) < 600 then
				ClientHeight := 600
			else
				ClientHeight := StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600);
			if StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800) < 800 then
				ClientWidth := 800
			else
				ClientWidth := StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800);
      try
        imgLogo.Proportional := false;
        imgLogo.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
        imgHw.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
        imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
        imgHw.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'hw.jpg');
      except
      end;
      if not vDadosIniF.inicializaFiscal then
      begin
        vDadosIniF.vRespModoSistema := '1';
        exit;
      end;
      temp:='';
      temp:= CImpressoraF.obterCNPJUsuario;
      if temp <> '' then
        vDadosIniF.vEmp.vCNPJ := temp;
      if not sistemaRegistrado(vDadosIniF.vEmp.vCNPJ,'PAF-ECF') then
      begin
        Application.Terminate;
        Exit;
        Abort;
      end;
      try
        vDadosIniF.MensagemFiscal('Aguarde... Iniciando variáveis');
        Application.CreateForm(TfrmPesqClientes, frmPesqClientes);
        Application.CreateForm(TfrmPesqProdutos, frmPesqProdutos);
        Application.CreateForm(TfrmPesqServicos, frmPesqServicos);
        vDadosIniF.vCodTerminal := IntToStr(StrToIntDef(obConfImp.dataSet.FieldByName('cod_terminal').AsString, 1));
        vDadosIniF.vNumSerieEcf := vDadosIniF.getNumSerieEcfDescriptografado;
        //          vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
        vDadosIniF.vUsaCodigoBarras :=
          vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('usar_codbarra').AsString);
        Caption := 'Sistema ECF - Segundo Plano';
        if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString) = 'S' then
          caption := caption + ' - Teclado PDV'
        else
          caption := caption + ' - Teclado Padrão';
				vProdServ := 'P';
				if CImpressoraF.SemDireitoDeUso then
					lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
				else if CImpressoraF.SemArquivoAux then
					lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
				else if vDadosIniF.statusCaixa = 0 then
					lMsg.Caption := '<<<< CAIXA ABERTO >>>>'
				else
					lMsg.Caption := '<<<< CAIXA FECHADO >>>>';
        ldescricao.Caption := '';

        Application.Title := 'Fiscal 4.0';

        enterTela := TEnterHw.Create(Self);
        enterTela.ClassList.Clear;
        enterTela.classList.Add('TMaskEdit');
        //    enterTela.classList.Add('TEdit');
        enterTela.classList.Add('TDBEdit');
        enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
        enterTela.classList.Add('TCheckBox');
        enterTela.classList.Add('TDBCheckBox');
        enterTela.classList.Add('TComboBox');
        enterTela.classList.Add('TDBComboBox');
        enterTela.classList.Add('TListBox');
        enterTela.classList.Add('TDBListBox');
        enterTela.classList.Add('TDBLookupListBox');
        enterTela.classList.Add('TDBLookupComboBox');
        enterTela.classList.Add('TSpinEdit');
        enterTela.classList.Add('TDateTimePicker');
        enterTela.classList.Add('TRadioGroup');
        enterTela.classList.Add('TDBRadioGroup');
        enterTela.classList.Add('TRadioButton');
        enterTela.classList.Add('TDBRadioButton');

        if vDadosIniF.vUsaLeitorSerial = 'S' then
        begin
          //          lBarra.Desativar;
          //          lBarra.Porta := 'COM' + IntToStr(obConfImp.dataSet.FieldByName('PORTA_LEITOR').AsInteger);
          //          if trim(vDadosIniF.vSufixoLCB) <> '' then
          //            lBarra.Sufixo := trim(vDadosIniF.vSufixoLCB);
          //          try
          //            lBarra.Ativar;
          //          except
          //            vDadosIniF.vUsaLeitorSerial := 'N';
          //            MessageBeep(1);
          //            Application.MessageBox(pchar('Leitor Serial não pode ser ativado. Problemas de comunicação!'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          //          end;
        end;

        if ((not obProd.Active) or (obProd.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
        begin
          try
            vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Itens..');
            obProd.getTodos;
          finally
            vDadosIniF.limpaMensagem;
          end;
        end;
        
				if not obTmpOp.registraEntradaOperador(vDadosIniF.vCodUsuario) then
					if not vDadosIniF.caixaFiscalFechado('N') then
						Halt(0);

			finally
				vDadosIniF.limpaMensagem;
			end;
		end;
	finally
//    MenuFiscal1.Enabled := true;
//    Sair1.Enabled := true;
	end;
end;

procedure TfrmPrincipalFiscal.Sintegra1Click(Sender: TObject);
var
  vTerminais: TTerminaisF;
  label3: TLabel;
begin
  inherited;
  {if not vDadosIniF.verificaGrandeTotal then
  begin
    CImpressoraF.vPermitirVenda := false;
    Application.MessageBox(pchar('Operação Indisponível no momento!' + #13 +
      'Impressora não responde ou' + #13 +
      'Diferença no Grande Total acumulado'), 'Informação', MB_ICONINFORMATION + mb_OK);
    exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    vTerminais := TTerminaisF.create;
    vTerminais.abreTerminais;
    label3 := TLabel.Create(Self);

    Application.CreateForm(TfrmRelPeriodo, frmRelPeriodo);
    frmRelPeriodo.Caption := 'Período da Sincronização';
    frmRelPeriodo.Label3.Visible := true;
    frmRelPeriodo.ShowModal;
    if frmRelPeriodo.ModalResult = IDOK then
    begin
      try
        vterminais.vdtini := StrToDate(frmRelPeriodo.MaskEdit1.text);
        vterminais.vdtfim := StrToDate(frmRelPeriodo.MaskEdit2.text);
      except
        application.messagebox('Datas inválidas ou não preenchidas', 'Informação',
          MB_ICONINFORMATION
          + MB_OK);
        exit;
      end;
      //    if vDadosIniF.conectaBanco(dtmAtivo.bancoFiscal,
      //      vterminais.dataSet.FieldByName('END_TERMINAL').AsString, true) then
      try
        vTerminais.First;
        while not vTerminais.dataSet.Eof do
        begin
          if vDadosIniF.conectaBanco(dtmAtivo.bancoFiscal,
            vTerminais.dataSet.FieldByName('END_TERMINAL').AsString, true) then
            vterminais.sincterminal(2,
              vDadosIniF.MensagemFiscal('Sincronizando Terminal com Retaguarda', true), label3, '');
          break;
          vTerminais.Next;
        end;
      finally
        vDadosIniF.limpaMensagem;
      end;

      sintegra2009('N', pchar(vDadosIniF.vBancoHW), StrToInt(vDadosIniF.codEmpresa),
        pchar(vDadosIniF.vVersaoFiscal), pchar(frmRelPeriodo.MaskEdit1.Text),
        pchar(frmRelPeriodo.MaskEdit2.Text));
    end;
  finally
    frmRelPeriodo.Free;
    frmRelPeriodo := nil;
    vDadosIniF.conectaBanco(dtmAtivo.bancoFiscal, vDadosIniF.vBancoFiscal, true);
    Screen.Cursor := crDefault;
  end;  }
end;

procedure TfrmPrincipalFiscal.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  inherited;
  if Panel = StatusBar.Panels[2] then
		with ProgressBar1 do
    begin
      Top := Rect.Top;
      Left := Rect.Left;
      Width := Rect.Right - Rect.Left - 15;
      Height := Rect.Bottom - Rect.Top;
    end;
end;

procedure TfrmPrincipalFiscal.SuporteRemoto1Click(Sender: TObject);
begin
  inherited;
  vDadosIniF.CreateProcessSimple('HwSuporte.exe');
end;

procedure TfrmPrincipalFiscal.Timer1Timer(Sender: TObject);
begin
  inherited;
  if Timer1.Enabled then
  begin
    try
      obTef.forcaFocoNoSistema(Application.Handle);
      if (Edit1.Enabled) and ((vDadosIniF.vModoSistema = '') or (vDadosIniF.vModoSistema = 'N'))
        then
        Edit1.SetFocus;
    finally
      Timer1.Enabled := false;
    end;
  end;
end;

procedure TfrmPrincipalFiscal.Timer2Timer(Sender: TObject);
begin
  inherited;
  Timer2.Enabled := false;
  close;
  //  Application.BringToFront;
   // frmMensagem.BringToFront;
  //  frmMensagem.Repaint;
  //  frmMensagem.SetFocus;
  //  Timer2.Enabled:=false;
end;

procedure TfrmPrincipalFiscal.Timer3Timer(Sender: TObject);
var
  mascara: string;
  status: integer;
begin
  inherited;
  Timer3.Enabled := false;
  try
    mascara := '';
    status := obBalanca.getStatusbalanca;
    case status of
      0: lMsg.Caption := 'Falha comuncando-se com a balança.';
      1: lMsg.Caption := 'Peso Oscilando.';
      2: lMsg.Caption := 'Peso Estável.';
      3: lMsg.Caption := 'Sobrecarga de Peso ou Alivio de Plataforma.';
      4: lMsg.Caption := 'Erro lendo licensa do Software.';
    end;

    if (status = 1) or (status = 2) then
    begin
      mascara := '0.000';
      ldescricao.Caption := FormatFloat(mascara, (obBalanca.getInformacao(1) / vDadosIniF.vDividirValorBalancaPor ));
    end;
  finally
    Timer3.Enabled := true;
  end;
end;

procedure TfrmPrincipalFiscal.Timer4Timer(Sender: TObject);
begin
  inherited;
  if vHwSinc = nil then
    Exit;

  if Trim(vHwSinc.Texto) = '' then
  begin
    ProgressBar1.Visible := False;
    StatusBar1.Panels[0].Width := 1200;
    Exit;
  end;

  StatusBar1.Panels[0].Width := 600;
  StatusBar1.Panels[1].Text := vHwSinc.Texto;
  ProgressBar1.Min := 0;
  ProgressBar1.Max := vHwSinc.Max;
  ProgressBar1.Position := vHwSinc.Pos;
  ProgressBar1.Visible := True;
  Application.ProcessMessages;
end;

procedure TfrmPrincipalFiscal.timerConsultaTimer(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipalFiscal.UsarOrcamento1Click(Sender: TObject);
var
  Astr: string;
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;

    if vDadosIniF.semComunicacaoComECF('S') then
      Exit
    else if vDadosIniF.diferencaNoGrandeTotal('S') then
      Exit
    else if vDadosIniF.diferencaNoNumeroSerie('S') then
      Exit
    else if Assigned(obCupom.Orcamento) then
    begin
      if Memo1.Lines.Count = 1 then
        Memo1.Lines.Clear;
      obCupom.Orcamento_getOrcamento(IfThen(obCupom.getSubTotal > 0, obCupom.Orcamento.nped), Astr);
      if Astr <> '' then
        Memo1.Lines.Add(Astr);
      Exit;
    end
    else if vDadosIniF.impressaoEmAndamento('S') then
      Exit
    else if vDadosIniF.caixaFiscalFechado('S') then
      Exit;


    if not vDadosIniF.PesqPros('FIS056', 'HABILITAR','','CUPOM','') then
      Exit;

    Memo1.Lines.Clear;
    obCupom.Orcamento_getOrcamento(0 , Astr);
    if Astr <> '' then
      Memo1.Lines.Add(Astr);

  finally
    Timer1.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

function TfrmPrincipalFiscal.verificaCupomFiscalAbertoParaRemontagem: boolean;
var
  cNumeroCupom, ultimoCupom, vNSUTef: string;
  vTempInteger, vFinalizadorTEF: Integer;
  vrTroco, vValorTEF, vSaqueTEF, vDescTEF: Currency;
  vYes: Boolean;
  gerencial: Boolean;
  i: Integer;
  vNaoConfOper: Integer;
begin
  Result := true;
  if not vDadosIniF.EnvCmdsCupom(2) then
    Exit;
  cNumeroCupom := vDadosIniF.StrZero(Trim(CImpressoraF.NumeroCupom),6);
  ultimoCupom := vDadosIniF.StrZero(Trim(obCupom.ultimoCupomEmitidoNaoFechado),6);

  if (ultimoCupom <> '000000') and (trim(cNumeroCupom) <> '000000') then
  begin
    if (ultimoCupom = cNumeroCupom) and (CImpressoraF.cupomAberto) then
    begin
      Application.MessageBox(pchar('O sistema não fechou o último cupom fiscal. Os dados serão recuperados'), 'Atenção', 0 + 64);
      vTempInteger := CImpressoraF.estadoDeEmissaoDoCupomFiscal;
      obCupom.vItem.selecionaItens(obCupom.dataSet.FieldByName('cupom').AsInteger,
        obCupom.dataSet.FieldByName('registro').AsInteger);
      /// Montando o memo dos itens vendidos

      Memo1.Clear;
      obCupom.vItem.dataSet.First;
      while not obCupom.vItem.dataSet.Eof do
      begin
        Memo1.Lines.Add(
          Trim(obCupom.vItem.dataSet.FieldByName('codbarra').AsString) + ' ' +
          Trim(obCupom.vItem.dataSet.FieldByName('descr_it').AsString) + ' ' +
          Trim(obCupom.vItem.dataSet.FieldByName('unidade').AsString));
        Memo1.Lines.Add(format('%6.3f', [obCupom.vItem.dataSet.FieldByName('quantidade').AsFloat]) + ' X ' +
          Format(' %10.3f', [obCupom.vItem.dataSet.FieldByName('preco').AsFloat]) +
          Format(' %10.2f', [CImpressoraF.getValorTotalComCasasDecimais(
            obCupom.vItem.dataSet.FieldByName('total').AsFloat)]));
        obCupom.vItem.dataSet.Next;

        if obCupom.vItem.dataSet.FieldByName('perc_desc').AsFloat > 0 then
          Memo1.Lines.Add('desconto R$' + Format('%5.2f',
            [obCupom.vItem.dataSet.FieldByName('perc_desc').AsFloat]) + '    '
            + Format(' %10.2f', [obCupom.vItem.dataSet.FieldByName('total').AsFloat -
              obCupom.vItem.dataSet.FieldByName('perc_desc').AsFloat]))
        else if obCupom.vItem.dataSet.FieldByName('perc_acresc').AsFloat > 0 then
          Memo1.Lines.Add('acrescimo R$' + Format('%5.2f',
            [obCupom.vItem.dataSet.FieldByName('perc_acresc').AsFloat]) + '    '
            + Format(' %10.2f', [obCupom.vItem.dataSet.FieldByName('total').AsFloat +
              obCupom.vItem.dataSet.FieldByName('perc_acresc').AsFloat]));
      end;

      obCupom.setDadosRemontagemCupom(False);

      /// Verificando se o cupom ja foi totalizado
      if Trim(obCupom.dataSet.FieldByName('horasubtotal').AsString) <> '' then
      begin
        Memo1.Lines.Add('Sub Total R$   ' + Format(' %10.2f', [
          obCupom.dataSet.FieldByName('total').AsFloat]));
        if obCupom.dataSet.FieldByName('valor_desc').AsFloat > 0 then
        begin
          Memo1.Lines.Add('Desconto  R$   ' + Format(' %10.2f', [
            obCupom.dataSet.FieldByName('valor_desc').AsFloat]));
          obCupom.setDadosRemontagemCupom(True);
        end
        else if obCupom.dataSet.FieldByName('valor_acres').AsFloat > 0 then
        begin
          Memo1.Lines.Add('Acréscimo R$   ' + Format(' %10.2f', [
            obCupom.dataSet.FieldByName('valor_acres').AsFloat]));
          obCupom.setDadosRemontagemCupom(True);
        end;
        obCupom.vFinCupom.selecionaFinCupom(obCupom.dataSet.FieldByName('cupom').AsInteger,
          obCupom.dataSet.FieldByName('registro').AsInteger,
          vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) ;

        if not obCupom.vFinCupom.dataSet.IsEmpty then
        begin
          obCupom.setDadosRemontagemCupom(True);
          obFinalizador.getTodos;
          obFinalizador.IndexFieldNames := 'COD_FINALIZADOR';
          obCupom.vFinCupom.dataSet.First;
          while not obCupom.vFinCupom.dataSet.Eof do
          begin
            obFinalizador.FindNearest([
              obCupom.vFinCupom.dataSet.FieldByName('FINALIZADOR').AsString]);
            Memo1.Lines.Add(obFinalizador.getNomeFinalizador + ' R$ ' + Format(' %10.2f', [
              obCupom.vFinCupom.dataSet.FieldByName('VALOR').AsFloat]));
            obCupom.vFinCupom.dataSet.Next;
          end;

        end;

      end;

      eSubTotal.Valor := obCupom.getSubTotal;
      if vTempInteger >= 1 then
        obCupom.setDadosRemontagemCupom(True);

      if vTempInteger = 1 then
      begin
        /// Abrir aqui a forma de pagamento para finalizar os recebimentos

       /// Verifica se a ultima transacao no TEF foi confirmada e nao foi armazenada no sistema
        if vDadosIniF.vUsaTef = 'E' then
        begin
          vNSUTef := '';
          if obTef.existeDadosArquivoBkpFormPagamento(
            obCupom.dataSet.FieldByName('cupom').AsInteger,vValorTEF, vSaqueTEF, vNSUTef,
            vFinalizadorTEF, vDescTEF) then
          begin
            if Trim(vNSUTef) > '' then
            begin
              obCupom.vFinCupom.vValorSaque := vSaqueTEF;
              obCupom.vFinCupom.vValorDescPremia := vDescTEF;
              obCupom.vFinCupom.insereFimCupom(
                obCupom.dataSet.FieldByName('registro').AsInteger,
                obCupom.dataSet.FieldByName('cupom').AsInteger, vFinalizadorTEF, 0, 0,
                obCupom.dataSet.FieldByName('ccf').AsInteger,
                vValorTEF, vValorTEF, 'CUP');
              if vDadosIniF.vUsaTef = 'E' then
                obTef.gravaDadosArquivoBkpFormPagamento(0,0,0, 0,'', 0);
              obFinalizador.FindNearest([vFinalizadorTEF]);
              Memo1.Lines.Add(obFinalizador.getNomeFinalizador + ' R$ ' + Format(' %10.2f', [
                obCupom.vFinCupom.dataSet.FieldByName('VALOR').AsFloat]));
              obCupom.vFinCupom.dataSet.Next;
            end;
          end;
        end;
        if obCupom.getValorRestante <= 0 then
          vTempInteger := 2;
        if vTempInteger <> 2 then        
          try
            if (vDadosIniF.vUsaTef = 'E') then
              obTef.existetransacaoTefPendente;
            Application.CreateForm(TfrmFechamento, frmFechamento);
            obFinalizador.getTodosFiscal;
            obFinalizador.First;
            obCupom.setMemo(Memo1);
            obTef.limpaVariaveisNovoCartao;
            frmFechamento.ShowModal;
            if frmFechamento.ModalResult = mrok then
            begin
              Memo1.Lines.Clear;
              eVlUnit.Valor := 0;
              lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
              ldescricao.Caption := 'Obrigado! Volte Sempre!';
              Edit1.Text := '';
              eSubTotal.Valor := obCupom.getSubTotal;
//              MenuFiscal1.Enabled := true;
//              Sair1.Enabled := true;
              Memo1.Lines.Clear;
            end
            else if frmFechamento.ModalResult = mrAbort then
            begin
              CancelarCupomAtual1.Click;
              lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
              ldescricao.Caption := '';
              Edit1.Text := '';
              eSubTotal.Valor := obCupom.getSubTotal;
              Memo1.Lines.Clear;
            end;
            frmFechamento.Free;
            frmFechamento := nil;
          finally
            obCupom.cancelarCupom := '';
            obProd.CommitaTransacao;
            obProd.IniciaTransacao;
            Edit1.Enabled := true;
            obTef.forcaFocoNoSistema(Application.Handle);
            Edit1.SetFocus;
            Screen.Cursor := crDefault;
            Timer1.Enabled := true;
            Memo1.Lines.Clear;
          end;
      end;

      if vTempInteger = 2 then
      begin
        if (vDadosIniF.vUsaTef = 'E') and (obTef.existetransacaoTefPendente) then
        begin
          //cielo
//          vYes := Application.MessageBox(
//            'Existe transação TEF pendente, deseja imprimir novamente?',
//            'Confirmação',MB_ICONQUESTION + MB_YESNO) = IDYES;
          Application.MessageBox(
              'Cupom fiscal não foi fechado. Será cancelado',
              'Atenção', 0 + 64);
            vYes := True;

        end
        else
        begin
          //cielo
//          vYes := Application.MessageBox(
//            'Cupom fiscal não foi fechado. Deseja fechar o cupom?',
//            'Confirmação',MB_ICONQUESTION + MB_YESNO) = IDYES;
//          if not vYes then
//            vYes := Application.MessageBox(
//              'Se continuar o cupom fiscal será cancelado. Deseja continuar com o cancelamento?',
//              'Confirmação',MB_ICONQUESTION + MB_YESNO) = IDYES;

            Application.MessageBox(
              'Cupom fiscal não foi fechado. Será cancelado',
              'Atenção', 0 + 64);
            vYes := True;

        end;

        /// Se usar tef, verificar as transacoes e questinar a decisao do usuario
        ///  Se optar por Sim, fechar o cupom fiscal e imprimir o tef, se nao cancelar tudo
        ///  Se nao usar tef Fecha o cupom fiscal
        obCliente.selecionaCliente(obCupom.dataSet.FieldByName('cliente').AsInteger);
        if not obCliente.dataSet.IsEmpty then
          obCupom.setDadosAvulso(
            obCliente.dataSet.FieldByName('cod_cliente').AsString + ' - '+
            obCliente.dataSet.FieldByName('nome_cliente').AsString,
            obCliente.dataSet.FieldByName('endereco').AsString + ', ' +
            obCliente.dataSet.FieldByName('num_end_cliente').AsString,
            obCliente.dataSet.FieldByName('bairro').AsString,
            obCliente.dataSet.FieldByName('cidade').AsString,
            obCliente.dataSet.FieldByName('sigla_uf').AsString,
            obCliente.dataSet.FieldByName('cpfcgc').AsString, '', '',
            obCliente.dataSet.FieldByName('nome_cliente').AsString);
        vrTroco:= StrToFloat(CImpressoraF.ValorPagoCupomAtual);
        if vrTroco > 0 then
          vrTroco := vrTroco - StrToFloat(CImpressoraF.ValorPagoCupomAtual);

        if not vYes then
        begin
          if obCupom.fechaCupomFiscal(obCupom.dataSet.FieldByName('cliente').AsString) then
          begin
            obCupom.cancelarCupom := '';
            obProd.CommitaTransacao;
            obProd.IniciaTransacao;
            Edit1.Enabled := true;
            obTef.forcaFocoNoSistema(Application.Handle);
            Edit1.SetFocus;
            Screen.Cursor := crDefault;
            Timer1.Enabled := true;
            Memo1.Lines.Clear;

            /// Gerenciamento da impressao do cupom tef

            if (obTef.existetransacaoTefPendente) and ( vDadosIniF.vUsaTef = 'E')  then
            begin
              Application.CreateForm(TfrmFileList, frmFileList);
              Application.CreateForm(tfrmFileList, frmFileList);
              frmFileList.FileListBox1.Mask := '*.Imp';
              frmFileList.FileListBox1.Directory := 'C:\KoneKTEF\';
              frmFileList.FileListBox1.Refresh;
              gerencial := false;
              i := 0;
              vNaoConfOper := 0;

              while i <= frmFileList.FileListBox1.Items.Count - 1 do
              begin
                obTef.setContadorImpressao(i + 1);
                try
                  vDadosIniF.limpaMensagem;
                  //                vDadosIniF.MensagemFiscal('Aguarde! Imprimindo...');
                  if not obTef.gerenciamentoImpressaoTEF(CImpressoraF, gerencial, 'C:\KoneKTEF\' +
                    frmFileList.FileListBox1.Items.Strings[i]) then
                  begin
                    obTef.cancelaOperacoesAnteriores(CImpressoraF);
                    vNaoConfOper := 1;
                    Break;
                  end;
                finally
                  vDadosIniF.limpaMensagem;
                end;
                if obTef.voltarParaPrimeiroArquivo then
                begin
                  I := -1;
                  gerencial := true;
                end;
                inc(i);
              end;

              if obTef.reimpressao = 'S' then
                CImpressoraF.FechaRelatorioGerencialTEF;

              obTef.VerificaGerenciadorAtivo;

              if vNaoConfOper = 0 then
                obTef.finalizaOperacao(CImpressoraF);

              obTef.limpaVariaveisNovoCartao;
            end;

            // Fim da impressao do cupom tef

            if obCupom.existePrazo(obFinalizador.getFinalizadorPrazo) then
              if obCupom.verificaPrazo( obCupom.dataSet.FieldByName('cupom').AsString ,
                obCupom.dataSet.FieldByName('registro').AsString) then
              begin
                try
                  vDadosIniF.MensagemFiscal('Aguarde. Imprimindo Prazo');
                  CImpressoraF.vFvvalpr :=FloatToStr(obCupom.getValorPrazo); //valorCp;
                  CImpressoraF.vFvnc := StrToInt(obCupom.dataSet.FieldByName('cupom').AsString);
                  CImpressoraF.PrazoECF;
                finally
                  vDadosIniF.limpaMensagem;
                end;
              end;      
            if vrTroco > 0 then
            begin
              ldescricao.Caption := 'Troco: ' + format('%0.2f',[vrTroco]);
              Application.MessageBox(pchar(ldescricao.Caption), 'Atenção', MB_ICONINFORMATION +MB_OK);
            end;
          end
          else
          begin
            obCupom.cancelarCupom := 'S';
            Application.MessageBox('O cupom fiscal vai ser cancelado', 'Atenção', MB_OK + MB_ICONWARNING);
            if vDadosIniF.vUsaTef = 'E' then
            begin
              Screen.Cursor := crHourGlass;
              obTef.cancelaOperacoesAnteriores(CImpressoraF);
            end;
            CancelarCupomAtual1.Click;
          end;
        end
        else
        begin
          obCupom.cancelarCupom := 'S';
          if vDadosIniF.vUsaTef = 'E' then
          begin
            Screen.Cursor := crHourGlass;
            obTef.cancelaOperacoesAnteriores(CImpressoraF);
          end;
          CancelarCupomAtual1.Click;
        end;
      end;

      if obCupom.getValorRestante < 0 then
      begin
        /// Aqui fazer o tratamento do TEF
      end;
    end; // cupom = cupom and cupomaberto
  end;
end;

procedure TfrmPrincipalFiscal.VerificarbancodeBackup1Click(Sender: TObject);
begin
  inherited;
  vConfImp.verificaHwF('');
end;

function TfrmPrincipalFiscal.WindowsExit(RebootParam: Longword): Boolean;
var
  TTokenHd: THandle;
  TTokenPvg: TTokenPrivileges;
  cbtpPrevious: DWORD;
  rTTokenPvg: TTokenPrivileges;
  pcbtpPreviousRequired: DWORD;
  tpResult: Boolean;
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    tpResult := OpenProcessToken(GetCurrentProcess(),
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
      TTokenHd);
    if tpResult then
    begin
      tpResult := LookupPrivilegeValue(nil,
        SE_SHUTDOWN_NAME,
        TTokenPvg.Privileges[0].Luid);
      TTokenPvg.PrivilegeCount := 1;
      TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      cbtpPrevious := SizeOf(rTTokenPvg);
      pcbtpPreviousRequired := 0;
      if tpResult then
        Windows.AdjustTokenPrivileges(TTokenHd,
          False,
          TTokenPvg,
          cbtpPrevious,
          rTTokenPvg,
          pcbtpPreviousRequired);
    end;
  end;
  Result := ExitWindowsEx(RebootParam, 0);
end;

function TfrmPrincipalFiscal.emitirCupomPelaVenda(pNumVenda: Integer;
  pTipoVenda: string;
  pCancelarCupom: Boolean = False;
  pConfirmarExclusao: Boolean = True;
  pAntesDoZ: Boolean = False): Boolean;
var
  temDinheiro, temCartao, vVoltarEstoque: Boolean;
  somaForma, somaVenda, vValorItens: Extended;
  vProdServ, quantidade, codBarra: string;
  nCupom: string;
  vSubTotal: Integer;
begin

  temDinheiro := false;
  temCartao := false;
  somaForma := 0;
  somaVenda := 0;

  Result:= False;

  try
    Screen.Cursor := crHourGlass;

    if obPreVenda = nil then
      obPreVenda := TPreVendaRetaguarda.create;
//    obPreVenda.selecionaVendasParaCupomDiaAtual(0,0);

    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);

    if pConfirmarExclusao then
      if Application.MessageBox('Deseja mesmo Cancelar a Pré-Venda', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

    obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
    obPreVenda.selecionaVendasParaCupom(pNumVenda, pTipoVenda, pCancelarCupom);

    vVoltarEstoque := obPreVenda.voltarEstoque;

    if obPreVenda.dataSet.IsEmpty then
    begin
      Application.MessageBox(pchar('Venda não encontrada ou ja emitido cupom fiscal'), 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;
    obPreVenda.vItem.selecionaItensDaVenda(pNumVenda, pTipoVenda);
    obPreVenda.vItem.dataSet.First;
    if obPreVenda.dataSet.IsEmpty then
    begin
      if not pCancelarCupom then
        Application.MessageBox(pchar('Venda sem itens'),'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if (obPreVenda.dataSet.FieldByName('tipv').AsString <> 'V') then
        if not vDadosIniF.PesqPros('FIS050', 'VALIDAR',
          Trim(obPreVenda.dataSet.FieldByName('TIPO').AsString) + ' ' +
          Trim(obPreVenda.dataSet.FieldByName('NPED').AsString) + ' TIPV ' +
          Trim(obPreVenda.dataSet.FieldByName('TIPV').AsString), 'PEDVENDA',
          obPreVenda.dataSet.FieldByName('NPED').AsString) then
        begin
          Application.MessageBox(pchar('Tipo de Venda diferente de "V - Varejo" dever ser permitida pelo processo "FIS050"'),'Atenção',
            MB_OK + MB_ICONWARNING);
          Exit;
        end;

    if not obPreVenda.marcarVendaParaCupom then
    begin
      Application.MessageBox(pchar('Venda travada por outro usuário'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      Exit;
    end;

    somaForma := 0;
    if not pCancelarCupom then
    begin
      obFinalizador.getTodos;
      obFinalizador.IndexFieldNames := 'cod_finalizador';
      obPreVenda.vFrmPg.selecionaFormaPagamento(Trim(pTipoVenda), pNumVenda);

      obPreVenda.vFrmPg.First;
      while not obPreVenda.vFrmPg.Eof do
      begin
        somaForma := somaForma + obPreVenda.vFrmPg.dataSet.FieldByName('valordoc').AsCurrency;
        obCtrl.selecionaControle(obPreVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger);
        obFinalizador.FindNearest([obCtrl.dataSet.FieldByName('cod_finalizador').AsString]);
        if (obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
          obFinalizador.dataSet.FieldByName('cod_finalizador').AsString) and
          (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger = 0) then
          temDinheiro := true
        else if (obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
          obFinalizador.dataSet.FieldByName('cod_finalizador').AsString) and
          (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger > 0) then
          temCartao := true;
        obPreVenda.vFrmPg.Next;
      end;
    end;

    obPreVenda.vItem.First;
    while not obPreVenda.vItem.dataset.Eof do
    begin
      if (Trim(obPreVenda.vItem.dataSet.FieldByName('status').AsString) <> 'CANCELADO') or (pCancelarCupom) then
        somaVenda := somaVenda + (obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
          obPreVenda.vItem.dataSet.FieldByName('QTDE').AsFloat) +
          obPreVenda.vItem.dataSet.FieldByName('rateio_acresc').AsCurrency -
          obPreVenda.vItem.dataSet.FieldByName('rateio_desc').AsCurrency;
      obPreVenda.vItem.dataSet.Next;
    end;

    if (temDinheiro) and (temCartao) and (somaForma > somaVenda) then
    begin
      Application.MessageBox(pchar('Forma de pagamento excede o valor do cupom. ' + #13 +
        'Dinheiro e Cartão foram informados'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      obPreVenda.desmarcaVendaParaCupom;
      Exit;
    end
    else if (temCartao) and (somaForma > somaVenda) then
    begin
      Application.MessageBox(pchar('Forma de pagamento excede o valor do cupom. ' + #13 +
        'Cartão foi informado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      obPreVenda.desmarcaVendaParaCupom;
      Exit;
    end;

    obCupom.setNPreVND(obPreVenda.dataSet.FieldByName('paf_num_prevenda').AsInteger,
      obPreVenda.dataSet.FieldByName('nped').AsInteger,
      obPreVenda.dataSet.FieldByName('data_fech').AsDateTime,
      obPreVenda.dataSet.FieldByName('valor_total').AsCurrency);
    vValorItens := 0;
    obPreVenda.vItem.First;
    while not obPreVenda.vItem.Eof do
    begin
      vProdServ := obPreVenda.vItem.dataSet.FieldByName('tipo').AsString;
      quantidade := obPreVenda.vItem.dataSet.FieldByName('qtde').AsString;
      obProd.CustoMedio := obPreVenda.vItem.dataSet.FieldByName('PCUST_MC').AsFloat;
      if (obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') then
        codBarra := 'GRUPO|CODIGO|' + IntToStr(obPreVenda.vItem.dataSet.FieldByName('GRUPOOUSERV').AsInteger) + '|' +
          Trim(obPreVenda.vItem.dataSet.FieldByName('cod_prod').AsString) + '|'
      else
        codBarra := trim(obPreVenda.vItem.dataSet.FieldByName('num_fab_prod').AsString);
      if (obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') and
        (obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency > 0) then
      begin
        if not pAntesDoZ then
        begin
          Edit1.Text := quantidade + '*' + codBarra;
          eVlUnit.Valor := obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency;
        end;
        try
          if not enviaItemVenda(quantidade + '*' + codBarra,
            trim(obPreVenda.vItem.dataSet.FieldByName('DESCR').AsString),
            (obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency),
            obPreVenda.dataSet.FieldByName('cod_cliente').AsInteger,
              vDadosIniF.retornoPorCondicao(obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'T',
                obPreVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger,
                obPreVenda.vItem.dataSet.FieldByName('COD_VENDEDOR').AsInteger)) then
          begin
            if obCupom.getSubTotal > 0 then
              CancelarCupomAtual1Click(CancelarCupomAtual1);
            obPreVenda.desmarcaVendaParaCupom;
            exit;
          end;
        finally

        end;
        nCupom := obCupom.getNCupom;
        if (Trim(obPreVenda.vItem.dataSet.FieldByName('status').AsString) = 'CANCELADO') and (not pCancelarCupom) then
        begin
          if vDadosIniF.EnvCmdsCupom(17) then
            if obCupom.cancelaItem then
            begin
              if not pAntesDoZ then
              begin
                Memo1.Lines.Add(vDadosIniF.PadR('CANC. ITEM:' +
                  vDadosIniF.StrZeroDec(trunc(obCupom.vItem.getNItem), 3, 0), 30, ' ') + ' ' +
                  vDadosIniF.PadL(FormatFloat('###,###,##0.000',
                  (obCupom.vItem.dataSet.FieldByName('total').AsFloat)), 12, ' '));
                eSubTotal.Valor := obCupom.getSubTotal;
                 vDadosIniF.GravaAuditoria('FIS003','CANCELAR','','CUPOM',obCupom.dataSet.FieldByName('cupom').AsString);
              end;
            end;
        end
        else
          vValorItens := vValorItens + obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
            obPreVenda.vItem.dataSet.FieldByName('qtde').AsFloat;
      end;
      obPreVenda.vItem.Next;
    end;
    obCupom.tipoVenda := obPreVenda.dataSet.FieldByName('tipo').AsString;
    iniciaFechamento;
    obPreVenda.BuscarDadosCliente;
    obCupom.setDadosAvulso(obPreVenda.DadosCliente.NomeClienteImp,
                           obPreVenda.DadosCliente.Endereco,
                           obPreVenda.DadosCliente.Bairro,
                           obPreVenda.DadosCliente.Cidade,
                           obPreVenda.DadosCliente.Estado,
                           obPreVenda.DadosCliente.CpfCnpj, '','',
                           obPreVenda.DadosCliente.NomeClienteGravar);
    obCliente.selecionaCliente(obPreVenda.dataSet.FieldByName('cod_cliente').AsInteger);
    {obCupom.setDadosAvulso(obPreVenda.dataSet.FieldByName('cod_cliente').AsString + ' '+
    obCliente.dataSet.FieldByName('nome_cliente').AsString,
      Trim(obCliente.dataSet.FieldByName('endereco').AsString) + ', ' +
      obCliente.dataSet.FieldByName('num_end_cliente').AsString,
      obCliente.dataSet.FieldByName('bairro').AsString,
      obCliente.dataSet.FieldByName('cidade').AsString,
      obCliente.dataSet.FieldByName('sigla_uf').AsString,
      obCliente.dataSet.FieldByName('cpfcgc').AsString, '', '',
      obCliente.dataSet.FieldByName('nome_cliente').AsString);}

    if vValorItens > somaVenda then
      setDescontoAcrescimo(vValorItens - somaVenda, 0)
    else
      setDescontoAcrescimo(0, somaVenda - vValorItens);//setDescontoAcrescimo(0, 0);//setDescontoAcrescimo(0, somaVenda - vValorItens);
    if pCancelarCupom then
    begin
      if formaPagamento(obCupom.getSubTotal, obPreVenda.dataSet.FieldByName('cod_cliente').AsString) then
      begin
        vSubTotal := 0;
        if obCupom.emSubTotal then
          vSubTotal := 1;

        if not CImpressoraF.CancelaCupom(vSubTotal) then
          exit
        else
        begin
          CImpressoraF.FechaPortaSerial;
          obCupom.cancelarCupomFiscal;
        end;
        obProd.CommitaTransacao;
        obProd.IniciaTransacao;
        if obprod.dataSet.Active then
          obProd.dataSet.Refresh;

        obPreVenda.cancelarPreVenda(vVoltarEstoque);
        obPreVenda.desmarcaVendaParaCupom;
        if not pAntesDoZ then
        begin
          lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
          ldescricao.Caption := '';
          Edit1.Text := '';
          Memo1.Clear;
          eSubTotal.Valor := obCupom.getSubTotal;
        end;
        Result:= True;
      end;
      exit;
    end
    else
    begin
      if (not temCartao) or ((vDadosIniF.vUsaTef <> 'E') and (vDadosIniF.vUsaTef <> 'I')) then
      begin
      obPreVenda.vFrmPg.First;
      while not obPreVenda.vFrmPg.Eof do
      begin
        obCtrl.selecionaControle(obPreVenda.vFrmPg.dataSet.FieldByName('cod_controle').AsInteger);
        if (not obCtrl.dataSet.IsEmpty) and (obCtrl.dataSet.FieldByName('cod_finalizador').AsInteger
          <> 0) then
        begin
          obFinalizador.FindNearest([obCtrl.dataSet.FieldByName('cod_finalizador').AsString]);
          if obCtrl.dataSet.FieldByName('cod_finalizador').AsString =
            obFinalizador.dataSet.FieldByName('cod_finalizador').AsString then
            if not formaPagamento(obPreVenda.vFrmPg.dataSet.FieldByName('valordoc').AsCurrency,
              obPreVenda.dataSet.FieldByName('cod_cliente').AsString) then
            begin
              CancelarCupomAtual1Click(self);
              obPreVenda.desmarcaVendaParaCupom;
              lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
              ldescricao.Caption := '';
              Edit1.Text := '';
              eSubTotal.Valor := obCupom.getSubTotal;
              exit;
            end;
        end;
        obPreVenda.vFrmPg.Next;
      end;
      end;
    end;
    if (obCupom.getValorRestante > 0) then
    begin
      Application.CreateForm(TfrmFechamento, frmFechamento);
      frmFechamento.Edit1.Text := obPreVenda.dataSet.FieldByName('cod_cliente').AsString;
      obFinalizador.getTodos;
      obFinalizador.First;
      obCupom.setMemo(Memo1);
      frmFechamento.ShowModal;
      if frmFechamento.ModalResult = mrok then
      begin
        Memo1.Lines.Clear;
        eVlUnit.Valor := 0;
        lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
        ldescricao.Caption := 'Obrigado! Volte Sempre!';
        Edit1.Text := '';
        eSubTotal.Valor := obCupom.getSubTotal;
        try
          obPreVenda.nCCF := obCupom.dataSet.FieldByName('ccf').AsInteger; //StrToInt(Trim(CImpressoraF.numeroCCF));
        except
          obPreVenda.nCCF := 0;
        end;
        if not obPreVenda.confirmaEmissaoCupomVenda(StrToInt(trim(nCupom)),
          obCupom.dataSet.FieldByName('prevenda').AsInteger) then
        begin
          Application.MessageBox(pchar('Atenção! Venda não foi atualizada no retaguarda.'),
            'Atenção', MB_ICONEXCLAMATION + MB_OK);
          Exit;
        end;
      end
      else if frmFechamento.ModalResult = mrAbort then
      begin
        CancelarCupomAtual1Click(CancelarCupomAtual1);
        obPreVenda.desmarcaVendaParaCupom;
        lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
        ldescricao.Caption := '';
        Edit1.Text := '';
        eSubTotal.Valor := obCupom.getSubTotal;
        exit;
      end;
      frmFechamento.Free;
      frmFechamento := nil;
    end
    else
    begin
      Memo1.Lines.Clear;
      eVlUnit.Valor := 0;
      lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
      ldescricao.Caption := 'Obrigado! Volte Sempre!';
      Edit1.Text := '';
      eSubTotal.Valor := obCupom.getSubTotal;
        try
          obPreVenda.nCCF := obCupom.dataSet.FieldByName('ccf').AsInteger; //StrToInt(Trim(CImpressoraF.numeroCCF));
        except
          obPreVenda.nCCF := 0;
        end;
      if not obPreVenda.confirmaEmissaoCupomVenda(StrToInt(trim(nCupom)),
        obCupom.dataSet.FieldByName('prevenda').AsInteger) then
      begin
        Application.MessageBox(pchar('Atenção! Venda não foi atualizada no retaguarda.'),
          'Atenção', MB_ICONEXCLAMATION + MB_OK);
        Exit;
      end;
    end;
    Result:= True;
  finally
    if (vProdServ = 'S') or (vProdServ = 'T') then
      AlternarentrenotadeServioeProduto1Click(Self);
    habilitaControles;
    obPreVenda.Close;
    obPreVenda.CommitaTransacao;
//    frmLerPreVendaRet.free;
//    frmLerPreVendaRet := nil;
    Edit1.Clear;
    AtualizarcacheSistema1.Click;
    Screen.Cursor := crDefault;
  end;
end;

function TfrmPrincipalFiscal.enviaItemVenda(codBarra, descricaoItem: string;
  valorItem: Currency; pCodCliente, pCodVendedor: Integer;
  AItemOrcamento: TReg_PedVendaProd): boolean;
var
  Astr: string;
  nQuant: Real;
  j: Integer;
  i: Integer;
begin
  inherited;
  try
    Result := False;
    Screen.Cursor := crHourGlass;

    if (trim(codBarra) = '') or (copy(trim(codBarra), 1, 1) = ' ') then
      exit;
    vPrecoAVista := 'S';
    nBarra := trim(codBarra);
    if vConsulta = 'S' then
    begin
      ConsultaItem(nBarra);
      vConsulta := 'N';
      Application.MessageBox(pchar('Aperte OK para voltar'), 'Informação', MB_ICONINFORMATION +
				MB_OK);
			if CImpressoraF.SemDireitoDeUso then
				lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
			else if CImpressoraF.SemArquivoAux then
				lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
			else if vDadosIniF.statusCaixa = 1 then
				lMsg.Caption := '<<<< CAIXA ABERTO >>>>'
			else
				lMsg.Caption := '<<<< CAIXA FECHADO >>>>';
      if Edit1.Enabled then
        Edit1.SetFocus;
      Exit;
    end;

    if not ConsultaItem(codbarra) then
      exit;

    obCupom.vItem.vCodVendedor := pCodVendedor;
    if pCodVendedor > 0 then
      obCupom.setCodVendedor(pCodVendedor, Astr);

    if (Assigned(AItemOrcamento)) and (vProdServ = 'P') then
    begin
      obProd.CustoMedio := AItemOrcamento.pcust_mc;
      obProd.setValorItemAlterado(AItemOrcamento.vlun_ped_item);
      obProd.setValorDescricaoAlterado(AItemOrcamento.descr_prod_ped);
      if AItemOrcamento.aux_cp_orc.Acres_Usar > 0 then
        obCupom.setAcrescimoValor(AItemOrcamento.aux_cp_orc.Acres_Usar)
      else
        obCupom.setDescontoValor(AItemOrcamento.aux_cp_orc.Desc_Usar);
      obCupom.validaDesconto(0, obProd.getValorVendaItem, 0, 0, True);
    end
    else
    begin

      if (vProdServ = 'S') or (vProdServ = 'T') then
      begin
        obServ.setValorItemAlterado(valorItem);
        obServ.setValorDescricaoAlterado(descricaoItem);
      end
      else if vProdServ = 'P' then
      begin
        obProd.setValorItemAlterado(valorItem);
        obProd.setValorDescricaoAlterado(descricaoItem);
      end;

      if (vProdServ = 'S') or (vProdServ = 'T') then
      begin
        if (obServ.getValorVendaItem - valorItem) = 0 then
          obCupom.setDescontoValor(0)
        else if (obServ.getValorVendaItem - valorItem) > 0 then
          obCupom.setDescontoValor(obServ.getValorVendaItem - valorItem)
        else if (obServ.getValorVendaItem - valorItem) < 0 then
          obCupom.setAcrescimoValor(valorItem - obServ.getValorVendaItem);
      end
      else if vProdServ = 'P' then
      begin
        if (obProd.getValorVendaItem - valorItem) = 0 then
          obCupom.setDescontoValor(0)
        else if (obProd.getValorVendaItem - valorItem) > 0 then
          obCupom.setDescontoValor(obProd.getValorVendaItem - valorItem)
        else if (obProd.getValorVendaItem - valorItem) < 0 then
          obCupom.setAcrescimoValor(valorItem - obProd.getValorVendaItem);
      end;

      if vProdServ = 'P' then
        obCupom.validaDesconto(0, obProd.getValorVendaItem, obProd.getValorCustoProd, obProd.getMargemMinimaProduto, True)
      else
        obCupom.validaDesconto(0, obServ.getValorVendaItem, 0, 0, True);
    end;

    if not CImpressoraF.cupomAberto then
    begin
      if not vDadosIniF.EnvCmdsCupom(3) then
        exit;

			if not obCupom.abreCupom(vDadosIniF.vCodUsuario, CImpressoraF.vFHoraEcf, pCodCliente) then
			begin
				try
					obCupom.cancelarCupom := 'S';
					CancelarCupomAtual1.Click;
					Memo1.Lines.Clear;
					eVlUnit.Valor := 0;
					lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
					ldescricao.Caption := 'Obrigado! Volte Sempre!';
					Edit1.Text := '';
					eSubTotal.Valor := obCupom.getSubTotal;
				finally
					obCupom.cancelarCupom := '';
				end;
				Exit;
			end;
    end;
    // Definindo máscara da quantidade de acordo com a impressora...
    if vProdServ = 'P' then
      obProd.setCQuant(CImpressoraF.cMascQuant(obProd.getQuantidade)) //vDadosIniF.EnvCmdsCupom(4);
    else
      obServ.setCQuant(CImpressoraF.cMascQuant(obServ.getQuantidade)); //vDadosIniF.EnvCmdsCupom(4);

    //verificando o numero de serie da impressora
    if not vDadosIniF.EnvCmdsCupom(6) then
    begin
      if Edit1.Enabled then
        Edit1.SetFocus;
      exit;
    end;
    //envia venda do item para impressora
    if vProdServ = 'P' then
      if vDadosIniF.enviaVendaItemImpressora(obProd.getNBarra,
        CImpressoraF.MontaDescricao(obProd.getDescricao, obProd.getUnidade),
        obProd.getSitTributaria,
        obProd.getCQuant, StrToInt(obProd.getCasasDecimaisVlUnit), obProd.getValorVendaItem,
        obCupom.getDescontoAcrescimoPercenentual, obCupom.getDescontoAcrescimoValor,
        obProd.getQuantidade) then
      begin
        obCupom.vItem.vTipo_item := obProd.dataSet.FieldByName('tipo_item').AsString;
        obCupom.vItem.vUnidade := obProd.dataSet.FieldByName('UNIDADE').AsString;
				obCupom.vItem.vUnidade := obProd.dataSet.FieldByName('UNIDADE').AsString;

				if not obCupom.vendeItem(obProd.dataSet.FieldByName('grupo_prod').AsInteger,
					obProd.dataSet.FieldByName('cod_prod').AsString, obProd.getNBarra,
					obProd.getSitTributaria, CImpressoraF.MontaDescricao(obProd.getDescricao,
					obProd.getUnidade), obProd.getQuantidade,
					obProd.getValorVendaItem, obProd.getCasasDecimaisQtde, obProd.getCasasDecimaisVlUnit,
					obProd.getDescAliq, 'P', AItemOrcamento) then
				begin
					try
						obCupom.cancelarCupom := 'S';
						CancelarCupomAtual1.Click;
						Memo1.Lines.Clear;
						eVlUnit.Valor := 0;
						lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
						ldescricao.Caption := 'Obrigado! Volte Sempre!';
						Edit1.Text := '';
						eSubTotal.Valor := obCupom.getSubTotal;
					finally
						obCupom.cancelarCupom := '';
					end;
					Exit;
				end;

        eSubTotal.Valor := obCupom.getSubTotal;
        Memo1.Lines.Add( IfThen(Assigned(AItemOrcamento), '*') + lDescricao.caption);
        Memo1.Lines.Add(format('%6.3f', [obProd.getQuantidade]) + ' X ' + Format(' %10.3f',
          [obProd.getValorVendaItem]) + Format(' %10.2f', [obProd.getValorVendaItem *
          obProd.getQuantidade]));
        if (obCupom.getDescontoAcrescimoPercenentual > 0) or (obCupom.getDescontoAcrescimoValor > 0)
          then
          Memo1.Lines.Add('desconto ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obProd.getValorVendaItem)]) + '    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]))
        else if (obCupom.getDescontoAcrescimoPercenentual < 0) or (obCupom.getDescontoAcrescimoValor
          < 0) then
          Memo1.Lines.Add('acréscimo ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obProd.getValorVendaItem)]) + '    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]));
        Result := true;
      end;
    if (vProdServ = 'S') or (vProdServ = 'T') then
      if vDadosIniF.enviaVendaItemImpressora(obServ.getCodigo, obServ.getDescricao,
        obServ.getSitTributaria,
        obServ.getCQuant, StrToInt(obServ.getCasasDecimaisVlUnit), obServ.getValorVendaItem,
        obCupom.getDescontoAcrescimoPercenentual, obCupom.getDescontoAcrescimoValor,
        obServ.getQuantidade) then
      begin
        obCupom.vItem.vTipo_item := '09';
				obCupom.vItem.vUnidade := 'UN';

				if not obCupom.vendeItem(obServ.dataSet.FieldByName('cod_servico').AsInteger,
					obServ.dataSet.FieldByName('cod_servico').AsString, obServ.getCodigo,
					obServ.getSitTributaria, obServ.getDescricao, obServ.getQuantidade,
					obServ.getValorVendaItem, obServ.getCasasDecimaisQtde, obServ.getCasasDecimaisVlUnit,
					obServ.getDescAliq, 'S') then
				begin
					try
						obCupom.cancelarCupom := 'S';
						CancelarCupomAtual1.Click;
						Memo1.Lines.Clear;
						eVlUnit.Valor := 0;
						lMsg.Caption := '<<<<CAIXA LIVRE>>>>';
						ldescricao.Caption := 'Obrigado! Volte Sempre!';
						Edit1.Text := '';
						eSubTotal.Valor := obCupom.getSubTotal;
					finally
						obCupom.cancelarCupom := '';
					end;
					Exit;
				end;

				eSubTotal.Valor := obCupom.getSubTotal;
				Memo1.Lines.Add(lDescricao.caption);
        Memo1.Lines.Add(format('%6.3f', [obServ.getQuantidade]) + ' X ' + Format(' %10.3f',
          [obServ.getValorVendaItem]) + Format(' %10.2f', [obServ.getValorVendaItem *
          obServ.getQuantidade]));
        if (obCupom.getDescontoAcrescimoPercenentual > 0) or (obCupom.getDescontoAcrescimoValor > 0)
          then
          Memo1.Lines.Add('desconto ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obServ.getValorVendaItem)]) + '    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]))
        else if (obCupom.getDescontoAcrescimoPercenentual < 0) or (obCupom.getDescontoAcrescimoValor
          < 0) then
          Memo1.Lines.Add('acréscimo ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obProd.getValorVendaItem)]) + '    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]));
        Result := true;
      end;
    if Edit1.Enabled then
      Edit1.SetFocus;
    Edit1.SelectAll;
  finally
    enter := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmPrincipalFiscal.EspelhoMFDClick(Sender: TObject);
begin
  inherited;
  vDadosIniF.espelhoMfdMF;
end;

procedure TfrmPrincipalFiscal.iniciaFechamento(pMensagem: Boolean = True);
begin
  if not vDadosIniF.EnvCmdsCupom(6) then
    exit;
  if obCupom.getSubTotal <= 0 then
  begin
    if pMensagem then
    Application.MessageBox(pchar('Nenhum valor para fechar'), 'Informação', MB_ICONINFORMATION +
      MB_OK);
    exit;
  end;

  //  lMsg.Caption := 'Selecione o Cliente';
  if ((not obCliente.Active) or (obCliente.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
  begin
    try
      vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Clientes..');
      obCliente.getTodos;
    finally
      vDadosIniF.limpaMensagem;
    end;
  end;
  //  Application.CreateForm(TfrmFechamento, frmFechamento);
  obFinalizador.getTodos;
  obFinalizador.First;
  obCupom.setMemo(Memo1);
  //  frmFechamento.ShowModal;
end;

function TfrmPrincipalFiscal.iniciaFiscalSegundoPlano: boolean;
begin
	try
    Result := false;
    //Instanciando vDadosIniF do Fiscal
    TSingleton(vDadosIniF) := TIni.GetInstance;
    if vDadosIniF.vSistema = 'Fiscal' then
      Application.Title := 'PAF-ECF'
    else if vDadosIniF.vSistema <> 'Fiscal' then
    begin
      //Instanciando o pacote Ativo
      CarregaPacote('pkAtivosF', hdAtivo);
      if dtmAtivo = nil then
        dtmAtivo := TdtmAtivo.Create(dtmAtivo);

      //Instanciando DTM usados no Fiscal
    //  dtmFiscalHw := TdtmFiscalHw.Create(dtmFiscalHw);
      if DtmFiscal = nil then
        DtmFiscal := TDtmFiscal.Create(DtmFiscal);
      if DtmFiscalHwF = nil then
        DtmFiscalHwF := TDtmFiscalHwF.Create(DtmFiscalHwF);
      DtmFiscalHwF.verificarConexao;

      // Carregando pacote de configuraçoes e inicializando conceccoes
      CarregaPacote('pkConfigF', hdConfigF);
      if DtmConfigF = nil then
        DtmConfigF := TDtmConfigF.Create(DtmConfigF);

      // Carregando pacote de TEF e inicializando concecções
      CarregaPacote('pkTEF', hdTEF);
      if dtmTef = nil then
        dtmTef := TdtmTef.Create(dtmTef);

//      if vDadosIniF.vUsaTef = 'E' then
//         obtef := TTEFDedicado.create
//      else
//         obtef := TTEFDiscado.create;

      CarregaPacote('pkDAVf', hdDavF);
      if dtmDAVF = nil then
        dtmDavF := TdtmDavF.Create(dtmDavF);

//      CarregaPacote('pkNfSerieD', hdNfSD);

      //Conectando aos bancos
      if not vDadosIniF.conectaBancos then
      begin
        vDadosIniF.vFiscalAtivo := 'N';
        Result := false;
        exit;
      end;

      //Verificando usuario
      Left := 0;
			Top := 0;
			if StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600) < 600 then
				ClientHeight := 600
			else
				ClientHeight := StrToIntDef( _LerConfiguracoesRegistroString('ClientHeight'), 600);
			if StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800) < 800 then
				ClientWidth := 800
			else
				ClientWidth := StrToIntDef( _LerConfiguracoesRegistroString('ClientWidth'), 800);
      try
        imgLogo.Proportional := false;
        imgLogo.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
        imgHw.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
        imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
        imgHw.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'hw.jpg');
      except
      end;
      if not vDadosIniF.inicializaFiscal then
      begin
        vDadosIniF.vFiscalAtivo := 'N';
        Result := false;
        exit;
      end;
      try
        vDadosIniF.MensagemFiscal('Aguarde... Iniciando variáveis');
        Application.CreateForm(TfrmPesqClientes, frmPesqClientes);
        Application.CreateForm(TfrmPesqProdutos, frmPesqProdutos);
				Application.CreateForm(TfrmPesqServicos, frmPesqServicos);
				vDadosIniF.vCodTerminal := IntToStr(StrToIntDef(obConfImp.dataSet.FieldByName('cod_terminal').AsString, 1));
        vDadosIniF.vNumSerieEcf := vDadosIniF.getNumSerieEcfDescriptografado;
        //          vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
        vDadosIniF.vUsaCodigoBarras :=
          vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('usar_codbarra').AsString);
        Caption := 'Sistema ECF';
        if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString) = 'S' then
          caption := caption + ' - Teclado PDV'
        else
          caption := caption + ' - Teclado Padrão';
				vProdServ := 'P';
				if CImpressoraF.SemDireitoDeUso then
					lMsg.Caption := '<< Contate seu Fornecedor de Software >>'
				else if CImpressoraF.SemArquivoAux then
					lMsg.Caption := '<<<< Sem Arquivo Auxiliar >>>>'
				else if vDadosIniF.statusCaixa = 0 then
					lMsg.Caption := '<<<< CAIXA ABERTO >>>>'
				else
					lMsg.Caption := '<<<< CAIXA FECHADO >>>>';
				ldescricao.Caption := '';

        if vDadosIniF.vUsaLeitorSerial = 'S' then
        begin
          //          lBarra.Desativar;
          //          lBarra.Porta := 'COM' + IntToStr(obConfImp.dataSet.FieldByName('PORTA_LEITOR').AsInteger);
          //          if trim(vDadosIniF.vSufixoLCB) <> '' then
          //            lBarra.Sufixo := trim(vDadosIniF.vSufixoLCB);
          //          try
          //            lBarra.Ativar;
          //          except
          //            vDadosIniF.vUsaLeitorSerial := 'N';
          //            MessageBeep(1);
          //            Application.MessageBox(pchar('Leitor Serial não pode ser ativado. Problemas de comunicação!'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
          //          end;
        end;

        if ((not obProd.Active) or (obProd.IsEmpty)) and (vDadosIniF.vModoConsulta = 'A') then
        begin
          try
            vDadosIniF.MensagemFiscal('Aguarde.. Obtendo Itens..');
            obProd.getTodos;
          finally
            vDadosIniF.limpaMensagem;
          end;
        end;

				if not obTmpOp.registraEntradaOperador(vDadosIniF.vCodUsuario) then
					if not vDadosIniF.caixaFiscalFechado('N') then
						Halt(0);

				Result := true;
			finally
				vDadosIniF.limpaMensagem;
			end;
		end;
	finally
		enterTela := TEnterHw.Create(Self);
		enterTela.ClassList.Clear;
		enterTela.classList.Add('TMaskEdit');
		//    enterTela.classList.Add('TEdit');
		enterTela.classList.Add('TDBEdit');
		enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
		enterTela.classList.Add('TCheckBox');
		enterTela.classList.Add('TDBCheckBox');
		enterTela.classList.Add('TComboBox');
		enterTela.classList.Add('TDBComboBox');
		enterTela.classList.Add('TListBox');
		enterTela.classList.Add('TDBListBox');
		enterTela.classList.Add('TDBLookupListBox');
		enterTela.classList.Add('TDBLookupComboBox');
		enterTela.classList.Add('TSpinEdit');
		enterTela.classList.Add('TDateTimePicker');
		enterTela.classList.Add('TRadioGroup');
		enterTela.classList.Add('TDBRadioGroup');
    enterTela.classList.Add('TRadioButton');
    enterTela.classList.Add('TDBRadioButton');
    if not Result then
    begin
      vDadosIniF.vFiscalAtivo := 'N';
      DtmFiscal.Free;
      DtmFiscalHwF.Free;
      dtmTef.Free;
      dtmDAVF.Free;
      DtmFiscal := nil;
      DtmFiscalHwF := nil;
      dtmTef := nil;
      dtmDAVF := nil;
      UnloadPackage(hdTEF);
      UnloadPackage(hdDavF);
      UnloadPackage(hdNfSD);
    end;
    vDadosIniF.limpaMensagem;
  end;
end;

function TfrmPrincipalFiscal.formaPagamento(valor: Currency; codCliente: string): boolean;
var
  gerencial: boolean;
  I, vNaoConfOper: Integer;
  valorCp, nCP, nReg: string;
  valorInformado, valorRestante, valorTroco: Currency;
begin

  //Realizando recebimento no TEF
  if vDadosIniF.vUsaTef = 'S' then
  begin
    if (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1) then
    begin
      valorInformado := Valor;
      valorRestante := obCupom.getValorRestante;

      if (valorInformado > valorRestante) then
      begin
        lMsg.Caption := 'Valor informado deve ser menor ou igual ao valor restante!';
        Result := false;
        exit;
      end;

      lMsg.Caption := 'Aguardando comunicação com o TEF!';
      if not obTef.venda(obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger,
        StrToInt(trim(obCupom.getNCupom)),
        0, trim(obFinalizador.dataSet.FieldByName('verificar_credito').AsString),
        CImpressoraF.defAtribTef, valor) then
      begin
        lMsg.Caption := 'Operação não realizada pelo TEF';
        Result := false;
        exit;
      end;
    end;
  end;
  // Fim realizando venda no tef

  //Enviando venda para tabelas do fiscal
  if not obCupom.recebeFormaPag(obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
    obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger, Valor)
    then
  begin
    Result := false;
    exit;
  end;
  //Fim enviando vendas para tabela do fiscal

  //Fim forma de pagamento
  valorRestante := obCupom.getValorRestante;

  if obCupom.getValorRestante < 0 then
  begin
    obCupom.addMensagemMemo('Troco    R$ ' + Format(' %10.2f', [(-1) *
      (obCupom.getValorRestante)]));
    lMsg.Caption := 'Troco: R$ ' + Format(' %10.2f', [(-1) * (obCupom.getValorRestante)]);
    obCupom.addMensagemMemo('Valor Pago: ' + Format('%10.2f', [obcupom.getSubTotal -
      obCupom.getValorRestante]));
    valorTroco := (-1) * (obCupom.getValorRestante);
    try                               
      obCupom.vFinCupom.insereFimCupom(obCupom.dataSet.FieldByName('registro').AsInteger,
        obCupom.dataSet.FieldByName('cupom').AsInteger, 1, 0, 0,
        StrToInt(Trim(CImpressoraF.numeroCCF)), (-1) * Abs(obCupom.getValorRestante),
        (-1)* Abs(obCupom.getValorRestante), 'CUP');
    except
    end;
  end
  else
  begin
    //    mPago.Valor := obCupom.getSubTotal - obCupom.getValorRestante;
    //    mRestante.Valor := obCupom.getValorRestante;
    //    lMensagem.Caption := 'Resta: R$ ' + Format(' %10.2f', [obCupom.getValorRestante]);
  end;

  if valorRestante <= 0 then
  begin
    valorCp := trim(FloatToStr(obCupom.getSubTotal));
    nCP := trim(obCupom.getNCupom);
    nReg := Trim(obCupom.getNRegistro);
    if not obCupom.fechaCupomFiscal(codCliente) then
    begin
      //EditMoeda1.Visible := False;
      //BitBtn2Click(Sender);
      Result := false;
      exit;
    end;
    if (obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger >= 1) and
      (vDadosIniF.vUsaTef = 'S') then
    begin
      lMsg.Caption := 'Aguarde! Imprimindo comprovante ...';
      FileListBox1.Mask := '*.Imp';
      FileListBox1.Directory := 'C:\KoneKTEF\';
      FileListBox1.Refresh;
      gerencial := false;
      i := 0;
      vNaoConfOper := 0;
      while i <= FileListBox1.Items.Count - 1 do
      begin
        obTef.setContadorImpressao(i + 1);
        if not obTef.gerenciamentoImpressaoTEF(CImpressoraF, gerencial, 'C:\KoneKTEF\' +
          FileListBox1.Items.Strings[i]) then
        begin
          obTef.cancelaOperacoesAnteriores(CImpressoraF);
          vNaoConfOper := 1;
          Break;
        end;
        if obTef.voltarParaPrimeiroArquivo then
        begin
          I := -1;
          gerencial := true;
        end;
        inc(i);
      end;
      if vNaoConfOper = 0 then
        obTef.finalizaOperacao(CImpressoraF);
    end;

    if obCupom.existePrazo(obFinalizador.getFinalizadorPrazo) then
      if obCupom.verificaPrazo(nCP, nReg) then
      begin
        try
          vDadosIniF.MensagemFiscal('Aguarde. Imprimindo Prazo');
          CImpressoraF.vFvvalpr := valorCp;
          CImpressoraF.vFvnc := StrToInt(nCP);
          CImpressoraF.PrazoECF;
        finally
          vDadosIniF.limpaMensagem;
        end;
      end;
    if valorTroco > 0 then
      Application.MessageBox(pchar('Troco: ' + format('%10.2f', [valorTroco])), 'Atenção',
        MB_ICONINFORMATION + MB_OK);
    Result := true;
  end;
  Result := true;
end;

initialization
  RegisterClass(TfrmPrincipalFiscal);
finalization
  UnRegisterClass(TfrmPrincipalFiscal);

end.

