unit uIntegracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EnterantHw, ExtCtrls, ComCtrls, StdCtrls, Mask, uEditMoeda,
  UClassesProdutos, Buttons, uEditHw;

type
  TfrmIntegracao = class(TForm)
    PageControl1: TPageControl;
    tsGiro: TTabSheet;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    EditMoeda1: TEditMoeda;
    EditMoeda2: TEditMoeda;
    EditMoeda3: TEditMoeda;
    EditMoeda4: TEditMoeda;
    EditMoeda5: TEditMoeda;
    EditMoeda6: TEditMoeda;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tsClasseProduto: TTabSheet;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ProgressBar2: TProgressBar;
    Label9: TLabel;
    tsTestes: TTabSheet;
    Button1: TButton;
    EditHw1: TEditHw;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Edit1: TEdit;
    procedure tsTestesEnter(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    hdAtivo, hdEntrada, hdExemplo, HdTerminaisF, HdFormularios, hdClientes, hdFiscal, hdProdutos,
      hdPedVenda, hdFormpag, hdNFSerieD, hdConfig, hdVeiculos, hdCadBasicos, hdEquipamentos,
      hdSugestaoCompra, hdNotasFiscais,
      hdMva, hdGestorChilds, hdSPED, hdEstoqueECF,
      hdImportFinan, hdMargem, hdIntegraFab: THandle;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIntegracao: TfrmIntegracao;
  enterTela: TEnterHw;
  obProd: TProdutos;

implementation

uses
  Funcoes, uDtmAtivo, uDtmEntrada, uDadosIni, UClassesCadastrosBasicos,
  UdtmTerminalF, UTerminalF, uClasseMargemProduto, UClassesMvaAjusatada,
  UcadDNAEmpresa, UdtmGestorHw, UCotacaoCompraVenda, Ufinanceiros,
  uClassesNotasFiscais, UcadEmpresa, uClasseFP, uClassesCIAP, 
  uClassesEstoqueECF, uClassesImportacaoFinanceiro, UClassesPedVenda, 
  UClasseSugestaoCompras, UClassesBoleto, UClassesVeiculos,
  uClassesNotasFiscais_ServTransporte, uDtmPedVenda;

function validaChaveEmpresa(tipo, vBanco, vcodEmpresa: string): boolean; stdcall; external 'cons40.dll';

procedure closeallAuditoria ;stdcall; external 'auditoria.dll';

{$R *.dfm}

procedure TfrmIntegracao.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    obProd.CalculaGiroEstoque(Label1, ProgressBar1, MaskEdit1.Text, trunc(EditMoeda1.Valor),
      trunc(EditMoeda2.Valor), trunc(EditMoeda3.Valor), trunc(EditMoeda4.Valor),
      trunc(EditMoeda5.Valor),
      trunc(EditMoeda6.Valor));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmIntegracao.BitBtn2Click(Sender: TObject);
begin
  obProd.Parar := 1;
  Label9.Visible := false;
end;

procedure TfrmIntegracao.BitBtn3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmIntegracao.BitBtn5Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    Label9.Visible := True;
    if obProd.DefinirClassesProdutos(ProgressBar2, Panel1) then
      obProd.CommitaTransacao
    else
      obProd.RollBackTransacao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmIntegracao.BitBtn6Click(Sender: TObject);
var
  vStrNumDoc, vTxtUs : string;
  vVal: Extended;
begin
  vStrNumDoc := '';
  if not InputQuery('Atenção', 'Informe o numero do documento', vStrNumDoc) then
    Exit;
  if Trim(vStrNumDoc) <> '' then
    vTxtUs := 'Recebimento em cartão para a NF: ' + vStrNumDoc
  else
    vTxtUs := 'Informe o valor e clique em Confirmar para iniciar a transação TEF';
  vVal := EditHw1.AsValue;

//  vDadosIni.operacaoPosVirtual(posCRT, vTxtUs, vStrNumDoc, vVal, );
end;

procedure TfrmIntegracao.BitBtn7Click(Sender: TObject);
begin
//  vDadosIni.operacaoPosVirtual(posADM, 'Operação Administrativo', '0', 0);
end;

procedure TfrmIntegracao.Button1Click(Sender: TObject);
var
  vNumVenda: string;
  vSerieVenda: string;
  vTipoVenda: string;
  tipoParamentro: string;
  vFp2: TComunicacaoFormaPagamento;
  obFormPag2: TFormPag2;
begin
  if Application.MessageBox('Sistema Cxl?', 'COnfirmação', MB_ICONQUESTION + MB_YESNO) = IDYES
    then
  begin
    vDadosIni.vSistema := 'Cxl';
    vDadosIni.vCodOpCxl := vDadosIni.vCodUsuario;
  end;
  vSerieVenda := '';
  vTipoVenda := InputBox('Tipo de Venda', 'Informe o tipo de Venda', 'REQ');
  vNumVenda := InputBox('Numero de Venda', 'Informe o numero da Venda', '');
  if vTipoVenda = 'NF' then
    vSerieVenda := InputBox('Série de NF', 'Informe a Serie da NF', '');
  tipoParamentro := InputBox('Ação de teste',
    'G: Gerar Forma; D: Detalhe da Forma de Pag; C: Cancelar Forma; P ou P2: Plano;', 'G');
  if tipoParamentro = 'G' then
  begin
    try
      CarregaPacote('pkFormPag', hdFormPag);
      vFp2 := TComunicacaoFormaPagamento.Create;
      vFp2.iniciaFormaPagamentoIntegracao(StrToInt(Trim(vNumVenda)),
        Trim(vSerieVenda),
        Trim(vTipoVenda));
    finally
      UnloadPackage(hdFormPag);
    end;
  end
  else if tipoParamentro = 'D' then
  begin
    try
      CarregaPacote('pkFormPag', hdFormPag);
      obFormPag2 := TFormPag2.Create;
      obFormPag2.detalhamentoVenda(StrToInt(Trim(vNumVenda)),
        Trim(vSerieVenda),
        Trim(vTipoVenda));
    finally
      UnloadPackage(hdFormPag);
    end;
  end
  else if tipoParamentro = 'C' then
  begin
    try
      CarregaPacote('pkFormPag', hdFormPag);
      vFp2 := TComunicacaoFormaPagamento.Create;
      vFp2.cancelaFormaPagamentoIntegracao(StrToInt(Trim(vNumVenda)),
        Trim(vSerieVenda),
        Trim(vTipoVenda));
    finally
      UnloadPackage(hdFormPag);
    end;
  end
  else if tipoParamentro = 'P' then
  begin
    try
      CarregaPacote('pkFormPag', hdFormPag);
      vFp2 := TComunicacaoFormaPagamento.Create;
      vFp2.iniciaPlanoPagamentoIntegracao(StrToInt(Trim(vNumVenda)),
        Trim(vSerieVenda),
        Trim(vTipoVenda));
    finally
      UnloadPackage(hdFormPag);
    end
  end
  else if tipoParamentro = 'P2' then
  begin
    try
      CarregaPacote('pkFormPag', hdFormPag);
      vFp2 := TComunicacaoFormaPagamento.Create;
      vFp2.iniciaPlanoDePagamento;
    finally
      UnloadPackage(hdFormPag);
    end;
  end;

end;

procedure TfrmIntegracao.FormShow(Sender: TObject);
var
  senha: TSenha;
  I: Integer;
  temp, temp1, temp2, tipoParamentro, vParametro: string;
  vMargemProd: TMargemProduto;
  vMva: TMvaAjustada;
  vNf: TNfCab;
  obBasicosForm: TBasicosFormularios;
  vNumPedVenda: Integer;
  obEmpresa: TEmpresa;
  vFp2: TComunicacaoFormaPagamento;
  obFormPag2: TFormPag2;
  vCiap: TCIAP;
  obContador: TContador;
  vTipoServ: TTipoServ;
  vFrete:TServTransporte;
  vEstEcf: TEstoqueEcf;
  vImportPdv: TFechamentoPDV;
  obNatOp: TNaturezaOperacao;
  vVenda: TPedVenda;
  vPedidoCompra: TPedidoCompra;
  vSugestao: TSugestao;
  VRetorno: tRetorno;
  vBoleto: TBoleto;
  vCobreBem: TCobreBem;
  vVeiculo: UClassesVeiculos.TVeiculos;
  vModVeiculo: TModVeiculo;
  vImpAuto: TImportacaoAutomacao;
  vBalanco : TBalancoProduto;
  formulario: TForm;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Iniciando integração');

    if DtmPedVenda = nil then
  	  DtmPedVenda := TDtmPedVenda.create(DtmPedVenda);

    tsGiro.TabVisible := false;
    tsClasseProduto.TabVisible := false;
    tsTestes.TabVisible := false;
    CarregaPacote('pkAtivos', hdAtivo);
    CarregaPacote('pkEntrada', hdEntrada);
    CarregaPacote('pkFormularios', HdFormularios);
    //  CarregaPacote('pkFiscal', hdFiscal);
    //  CarregaPacote('pkProdutos',hdProdutos );
    CarregaPacote('pkClientes', hdClientes);
    CarregaPacote('pkPedidoVenda', hdPedVenda);
    //CarregaPacote('pkNfSerieD', hdNFSerieD);
    CarregaPacote('pkConfig', hdConfig);
    CarregaPacote('pkSugestaoCompras', hdSugestaoCompra);
    CarregaPacote('pkCadastrosBasicos', hdCadBasicos);
    //CarregaPacote('pkMargem', hdMargem);
    {CarregaPacote('pkAtivos', hdAtivo);
    CarregaPacote('pkEntrada', hdEntrada);
    ///  CarregaPacote('pkExemplo', hdExemplo);
    CarregaPacote('pkFormularios', HdFormularios);
    CarregaPacote('pkFiscal', hdFiscal);
    //  CarregaPacote('pkProdutos',hdProdutos );
    CarregaPacote('pkClientes', hdClientes);
    CarregaPacote('pkPedidoVenda', hdPedVenda);
    CarregaPacote('pkNfSerieD', hdNFSerieD);
    CarregaPacote('pkConfig', hdConfig);
    CarregaPacote('pkSugestaoCompras', hdSugestaoCompra);
    CarregaPacote('pkCadastrosBasicos', hdCadBasicos);}
    dtmAtivo := TdtmAtivo.Create(dtmAtivo);
    dtmEnt := TdtmEnt.Create(dtmEnt);
    vDadosIni := TSingleton.GetInstance;
    vDadosIni.vSistema := 'Automacao';
    for I := 0 to ParamCount do
      if 'SIS_CXL' = ParamStr(I) then
        vDadosIni.vSistema := 'Cxl';
    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True) then
    begin
      Abort;
      exit;
      Abort;
    end;
    if not dtmEnt.verificaEntrada then
    begin
      Exit;
      Abort;
    end;

    if not validaChaveEmpresa('HW' + vDadosIni.vVersaoBpl, vDadosIni.vBancoHW, vDadosIni.CodEmpresa) then
    begin
      Application.Terminate;
      Exit;
      Abort;
      Exit;
    end;
  
    Caption := 'Hw Sac 4.0 - Hw Sistemas e Computadores';
    if vDadosIni.vSistema = 'Automacao' then
      Application.Title := 'Hw Sac 4.0';
    enterTela := TEnterHw.Create(Self);
    enterTela.ClassList.Clear;
    enterTela.classList.Add('TMaskEdit');
    enterTela.classList.Add('TEdit');
    enterTela.classList.Add('TDBEdit');
    enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
    enterTela.classList.Add('TEditHw');
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

    //abrindo senhas
    for I := 0 to ParamCount do
    begin
      temp := ParamStr(i);
      if copy(temp, 1, 2) = '-a' then
      begin
        temp := Copy(temp, 3, length(temp));
        Break;
      end;
    end;
    if ParamCount = 0 then
      if not InputQuery('Chamada', 'Informe a chamada do método',temp) then
        Exit;

    if UpperCase(temp) = 'SENHA' then
      senha.CadSenha(10)
    else if UpperCase(temp) = 'FRENTE' then
    begin
      if HdTerminaisF = 0 then
        CarregaPacote('pkterminaisF', HdTerminaisF);
      if dtmTerminaisF = nil then
        dtmTerminaisF := TdtmTerminaisF.Create(dtmTerminaisF);
      if FrmTerminalF = nil then
      begin
        Application.CreateForm(TFrmTerminalF, FrmTerminalF);
        FrmTerminalF.FormStyle := fsNormal;
        FrmTerminalF.Visible := false;
        FrmTerminalF.Refresh;
        FrmTerminalF.Position := poScreenCenter;
      end;
      FrmTerminalF.ShowModal;
    end
    else if (UpperCase(temp) = 'GIRO') or (UpperCase(temp) = 'CLASSESPRODUTO') then
    begin
      AlphaBlend := false;
      WindowState := wsNormal;
      Caption := 'Produtos';

      obProd := TProdutos.create;
      obProd.CurvaABCVariaveis;

      if UpperCase(temp) = 'GIRO' then
      begin

        MaskEdit1.Text := DateToStr(vDadosIni.getDataBanco(obProd.buscas));
        EditMoeda1.Valor := obProd.EstSeguracaPadrao;
        EditMoeda2.Valor := obProd.TpProcessamento;
        EditMoeda3.Valor := obProd.TpEntrega;
        EditMoeda4.Valor := obProd.TpAlocacao;
        EditMoeda5.Valor := obProd.FreqPedido;
        EditMoeda6.Valor := obProd.QtdMesEmpresa;
        PageControl1.ActivePage := tsGiro;
        Label1.Caption := '';
      end
      else
      begin
        PageControl1.ActivePage := tsClasseProduto;
        Label9.Visible := false;

      end;
      Exit;
    end
    else if UpperCase(temp) = 'MARGEM' then
    begin
      vMargemProd.cadMargemProduto;
    end
    else if UpperCase(temp) = 'MVA_AJUSTADA' then
    begin
      if hdMva = 0 then
        CarregaPacote('pkMvaAjustada', hdMva);
      vMva.CadMvaAjustada(10);
    end
    else if UpperCase(temp) = 'DNA' then
    begin
      if FindWindow('TFrmcadDNAEmpresa', 'Cadastro do DNA da empresa') > 0 then
        SetForegroundWindow(FindWindow('TFrmcadDNAEmpresa', 'Cadastro do DNA da empresa'))
      else
      begin
        try
          //      if hdGestorChilds = 0 then
          //        CarregaPacote('PkGestorChilds', hdGestorChilds);
          //      if DtmGestorHw = nil then
          //        DtmGestorHw := TDtmGestorHw.Create(Self);
          if hdCadBasicos = 0 then
            CarregaPacote('pkCadastrosBasicos', hdCadBasicos);
          obBasicosForm.cadDNDEmpresa;
          //      if FrmcadDNAEmpresa = nil then
          //        Application.CreateForm(TFrmcadDNAEmpresa, FrmcadDNAEmpresa);
          //      FrmcadDNAEmpresa.ShowModal;
        finally
          obBasicosForm.Destroy;
        end;
      end;
    end
    else if UpperCase(temp) = 'COTACAO' then
    begin
      if FindWindow('TFrmSugestCompraVenda', 'Compra/Venda Cotação/Sugestão') > 0 then
        SetForegroundWindow(FindWindow('TFrmSugestCompraVenda', 'Compra/Venda Cotação/Sugestão'))
      else
      begin
        if hdGestorChilds = 0 then
          CarregaPacote('PkGestorChilds', hdGestorChilds);
        if DtmGestorHw = nil then
          DtmGestorHw := TDtmGestorHw.Create(Self);
        if FrmSugestCompraVenda = nil then
        begin
          Application.CreateForm(TFrmSugestCompraVenda, FrmSugestCompraVenda);
          FrmSugestCompraVenda.FormStyle := fsNormal;
          FrmSugestCompraVenda.Visible := false;
          FrmSugestCompraVenda.Refresh;
          FrmSugestCompraVenda.Position := poScreenCenter;
        end;
        FrmSugestCompraVenda.ShowModal;
      end;
    end
    else if UpperCase(temp) = 'FLUXOCAIXA' then
    begin
      if FindWindow('TFrmFinanceiros', 'Análises Financeiras e Gerenciais') > 0 then
        SetForegroundWindow(FindWindow('TFrmFinanceiros', 'Análises Financeiras e Gerenciais'))
      else
      begin
        if hdGestorChilds = 0 then
          CarregaPacote('PkGestorChilds', hdGestorChilds);
        if DtmGestorHw = nil then
          DtmGestorHw := TDtmGestorHw.Create(Self);
        if FrmFinanceiros = nil then
        begin
          Application.CreateForm(TFrmFinanceiros, FrmFinanceiros);
          FrmFinanceiros.FormStyle := fsNormal;
          FrmFinanceiros.Visible := false;
          FrmFinanceiros.Refresh;
          FrmFinanceiros.Position := poScreenCenter;
          FrmFinanceiros.Tag := 1;
        end;
        FrmFinanceiros.cklbEmpresas.Clear;
        FrmFinanceiros.ShowModal;
      end;
    end
    else if UpperCase(temp) = 'PROMOCAOPROD' then
    begin
      try
        if hdProdutos = 0 then
          CarregaPacote('pkProdutos', hdProdutos);
        if obProd = nil then
          obProd := TProdutos.create;
        if not vDadosIni.PesqPros('PRO154', 'ALTERAR', '', 'PRODUTOS', '', obProd.buscas, true) then
          exit;
        obProd.manterPromocaoProd;
        obProd.Refresh;
      finally
        obProd.Destroy;
      end;
    end
    else if (UpperCase(temp) = 'NOTAFISCAL') or (UpperCase(temp) = 'NOTAFISCALPAF') then
    begin
      try
        if (UpperCase(temp) = 'NOTAFISCALPAF') then
        begin
          Application.Title := 'PAF-ECF';
          for I := 0 to ParamCount do
            if pos('MD5PAF', ParamStr(I)) > 0 then
              vDadosIni.vMD5Fiscal := Copy(ParamStr(I), 7, length(ParamStr(I)));
        end;
        temp := '';
        tipoParamentro := '';
        for I := 0 to ParamCount do
          if pos('NF_N_COMANDO', ParamStr(I)) > 0 then
          begin
            tipoParamentro := 'COMANDO';
            temp := Copy(ParamStr(I), 13, length(ParamStr(I)));
            try
              StrToInt(Trim(temp));
              Break;
            except
              Application.MessageBox(pchar('Numero do Comando Inválido: ' + temp), 'Atenção', MB_OK
                + MB_ICONERROR);
              exit;
            end;
          end
          else if pos('NF_PEDVENDA', ParamStr(I)) > 0 then
          begin
            tipoParamentro := 'PEDVENDA';
            temp := Copy(ParamStr(I), 12, 7);
            try
              StrToInt(Trim(temp));
              vNumPedVenda := StrToInt(Trim(temp));
            except

            end;
            temp := Copy(ParamStr(I), 19, length(ParamStr(I)));
            if (Trim(temp) <> 'REQ') and (Trim(temp) <> 'OS') then
            begin
              Application.MessageBox(pchar('Tipo de venda inválido. Informar REQ ou OS: ' + temp),
                'Atenção', MB_OK
                + MB_ICONERROR);
              exit;
            end;
            Break;

          end
          else if pos('NF_MONTANF', ParamStr(I)) > 0 then
          begin
            tipoParamentro := 'MONTANF';
            Break;
          end;
        if tipoParamentro = 'COMANDO' then
        begin
          if temp = '' then
          begin
            Application.MessageBox(pchar('Numero do Comando não encontrado'), 'Atenção', MB_OK +
              MB_ICONINFORMATION);
            exit;
          end;
          if hdNotasFiscais = 0 then
            carregaPacote('pkNF', hdNotasFiscais);
          vNf := TNFCab.create;
          vNf.cadNfpeloComandoAbreTela(StrToInt(Trim(temp)), '');
          vNf.Free;
        end
        else if tipoParamentro = 'PEDVENDA' then
        begin
          if temp = '' then
          begin
            Application.MessageBox(pchar('Informações sobre a venda não fora informadas'),
              'Atenção', MB_OK +
              MB_ICONINFORMATION);
            exit;
          end;
          if hdNotasFiscais = 0 then
            carregaPacote('pkNF', hdNotasFiscais);
          vNf := TNFCab.create;
          vNf.cadNfpeloPedVenda(vNumPedVenda, Trim(temp), True);
          vNf.Free;
        end
        else if tipoParamentro = 'MONTANF' then
        begin
          if hdNotasFiscais = 0 then
            carregaPacote('pkNF', hdNotasFiscais);
          vNf := TNFCab.create;
          vNf.cadNfMontaNf;
          vNf.Free;
        end
        else
        begin
          if hdNotasFiscais = 0 then
            carregaPacote('pkNF', hdNotasFiscais);
          vNf := TNFCab.create;
          vNf.cadNfIntegracao;
          vNf.Free;
        end;
      except
        on e: exception do
        begin
          if tipoParamentro = 'COMANDO' then
            Application.MessageBox(pchar('Erro na Integração com a NF / Comando. Erro: ' +
              e.Message),
              'Atenção', MB_OK + MB_ICONINFORMATION)
          else if tipoParamentro = 'PEDVENDA' then
            Application.MessageBox(pchar('Erro na Integração com a NF / Venda. Erro: ' + e.Message),
              'Atenção', MB_OK + MB_ICONINFORMATION)
          else if tipoParamentro = 'MONTANF' then
            Application.MessageBox(pchar('Erro na Integração com a NF / Montar Nf. Erro: ' +
              e.Message),
              'Atenção', MB_OK + MB_ICONINFORMATION);
        end;
      end;
    end
    else if UpperCase(temp) = 'FORMPAGAMENTO' then
    begin
      try
        temp := '';
        temp1 := '';
        temp2 := '';
        tipoParamentro := '';
        for I := 0 to ParamCount do
        begin
          if 'SIS_CXL' = ParamStr(I) then
          begin
            vDadosIni.vSistema := 'Cxl';
            vDadosIni.vCodOpCxl := vDadosIni.vCodUsuario;
          end;

          if pos('_FORMPAGAMENTO', ParamStr(I)) > 0 then
          begin
            vParametro := ParamStr(I);
            if pos('DETALHE_FORMPAGAMENTO', ParamStr(I)) > 0 then
              tipoParamentro := 'DETALHE_FORMPAGAMENTO'
            else if pos('GERAR_FORMPAGAMENTO', ParamStr(I)) > 0 then
              tipoParamentro := 'GERAR_FORMPAGAMENTO'
            else if pos('CANCELAR_FORMPAGAMENTO', ParamStr(I)) > 0 then
              tipoParamentro := 'CANCELAR_FORMPAGAMENTO';
            temp := Copy(ParamStr(I), length(tipoParamentro) + 1, 7);
            try
              StrToInt(Trim(temp));
            except
              Application.MessageBox(pchar('Numero da Venda Inválido: ' + temp), 'Atenção', MB_OK
                + MB_ICONERROR);
              exit;
            end;
            temp1 := Copy(ParamStr(I), length(tipoParamentro) + 1 + 7, 3);
            try
              StrToInt(Trim(temp1));
            except
              Application.MessageBox(pchar('Série da Nota Fiscal Inválida: ' + temp1), 'Atenção',
                MB_OK
                + MB_ICONERROR);
              exit;
            end;
            temp2 := Copy(ParamStr(I), length(tipoParamentro) + 1 + 7 + 3, length(ParamStr(I)));
            if Trim(temp2) = '' then
            begin
              Application.MessageBox(pchar('Tipo de Documento não informado'), 'Atenção', MB_OK
                + MB_ICONERROR);
              exit;
            end;
          end;
        end;
        if tipoParamentro = 'GERAR_FORMPAGAMENTO' then
        begin
          try
            CarregaPacote('pkFormPag', hdFormPag);
            vFp2 := TComunicacaoFormaPagamento.Create;
            vFp2.iniciaFormaPagamentoIntegracao(StrToInt(Trim(temp)),
              Trim(temp1),
              Trim(temp2));
          finally
            UnloadPackage(hdFormPag);
          end;
        end
        else if tipoParamentro = 'DETALHE_FORMPAGAMENTO' then
        begin
          try
            CarregaPacote('pkFormPag', hdFormPag);
            obFormPag2 := TFormPag2.Create;
            obFormPag2.detalhamentoVenda(StrToInt(Trim(temp)),
              Trim(temp1),
              Trim(temp2));
          finally
            UnloadPackage(hdFormPag);
          end;
        end
        else if tipoParamentro = 'CANCELAR_FORMPAGAMENTO' then
        begin
          try
            CarregaPacote('pkFormPag', hdFormPag);
            vFp2 := TComunicacaoFormaPagamento.Create;
            vFp2.cancelaFormaPagamentoIntegracao(StrToInt(Trim(temp)),
              Trim(temp1),
              Trim(temp2));
          finally
            UnloadPackage(hdFormPag);
          end;
        end;
      except
        on e: exception do
        begin
          if tipoParamentro = 'FORMPAGAMENTO' then
            Application.MessageBox(pchar('Erro na Forma de Pagamento. Erro: ' + e.Message),
              'Atenção', MB_OK + MB_ICONINFORMATION)
          else
            Application.MessageBox(pchar('Erro ao obter Detalhes da Forma de Pagamento. Erro: ' +
              e.Message),
              'Atenção', MB_OK + MB_ICONINFORMATION);
        end;
      end;

    end
    else if UpperCase(temp) = 'CADEMPRESA' then
    begin
      try
        if hdCadBasicos = 0 then
          CarregaPacote('pkCadastrosBasicos', hdCadBasicos);
        if obEmpresa = nil then
          obEmpresa := TEmpresa.create;
        obEmpresa.CadEmpresa(10);
        obEmpresa.Refresh;
      finally
        obEmpresa.Destroy;
      end;
    end
    else if UpperCase(temp) = 'CIAP' then
    begin
      try
        if FindWindow('TfrmCIAP',
          'CIAP - Controle de Crédito de ICMS do Ativo Permanente / Créditos Fiscais') > 0 then
          SetForegroundWindow(FindWindow('TfrmCIAP',
            'CIAP - Controle de Crédito de ICMS do Ativo Permanente / Créditos Fiscais'))
        else
        begin
          if hdSPED = 0 then
            CarregaPacote('pkSPED', hdSPED);
          vCiap.CadCiap(0);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'CONTADOR' then
    begin
      try
        if hdCadBasicos = 0 then
          CarregaPacote('pkCadastrosBasicos', hdCadBasicos);
        obContador.CadContador(10);
      finally
      end;
    end
    else if UpperCase(temp) = 'SERVICOS_CADASTRO' then
    begin
      try
        if FindWindow('TFrmCadTipoServ', 'Manutenção de Tipo de Serviços') > 0 then
          SetForegroundWindow(FindWindow('TFrmCadTipoServ', 'Manutenção de Tipo de Serviços'))
        else
        begin
          if hdProdutos = 0 then
            CarregaPacote('pkProdutos', hdProdutos);
          vTipoServ.CadTipoServ(1);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'SERVICOS_CONSULTA' then
    begin
      try
        if FindWindow('TFrmCadTipoServ', 'Manutenção de Tipo de Serviços') > 0 then
          SetForegroundWindow(FindWindow('TFrmCadTipoServ', 'Manutenção de Tipo de Serviços'))
        else
        begin
          if hdProdutos = 0 then
            CarregaPacote('pkProdutos', hdProdutos);
          vTipoServ.CadTipoServ(2);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'SERVICO_TRANSPORTE' then
    begin
      try
        if FindWindow('TfrmCadServicoTransporte', 'Cadastro de Serviços de Transporte') > 0 then
          SetForegroundWindow(FindWindow('TfrmCadServicoTransporte', 'Cadastro de Serviços de Transporte'))
        else
        begin
          if hdNotasFiscais = 0 then
            carregaPacote('pkNF', hdNotasFiscais);
          vFrete := TServTransporte.create;
          vFrete.CadServTransporte(3);
          vFrete.Free;
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'ESTOQUE_ECF' then
    begin
      try
        if FindWindow('TfrmCadEstoqueECF', 'Cadastro de Estoque ECF') > 0 then
          SetForegroundWindow(FindWindow('TfrmCadEstoqueECF', 'Cadastro de Estoque ECF'))
        else
        begin
          if hdEstoqueECF = 0 then
            carregaPacote('pkEstoqueECF', hdEstoqueECF);
          vEstEcf.CadEstoqueECF(True);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'SOMARPDV' then
    begin
      try
        if FindWindow('TfrmImportacaoFinanceiro', 'Fechamento de PDV''s') > 0 then
          SetForegroundWindow(FindWindow('TfrmImportacaoFinanceiro', 'Fechamento de PDV''s'))
        else
        begin
          if hdImportFinan = 0 then
            CarregaPacote('pkImportFinanceiro', hdImportFinan);
          vImportPdv._abreTelaInicial;
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'IMPAUTO' then
    begin
      try
        if FindWindow('TfrmImpAuto', 'Processamento de pagamentos para o Financeiro') > 0 then
          SetForegroundWindow(FindWindow('TfrmImpAuto', 'Processamento de pagamentos para o Financeiro'))
        else
        begin
          if hdImportFinan = 0 then
            CarregaPacote('pkImportFinanceiro', hdImportFinan);
          vImpAuto.abreImpAuto;
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'IMPOTACAO_RETORNO' then
    begin
      try
        if FindWindow('TfrmImportRetorno', 'Processar arquivo de retorno') > 0 then
          SetForegroundWindow(FindWindow('TfrmImportRetorno', 'Processar arquivo de retorno'))
        else
        begin
          if hdImportFinan = 0 then
            CarregaPacote('pkImportFinanceiro', hdImportFinan);
          VRetorno._AbreFormRetorno;
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'NAT_OP' then
    begin
      try
        if FindWindow('TfrmCadNaturezaOperacao', 'Cadastro de Natureza de Operação') > 0 then
          SetForegroundWindow(FindWindow('TfrmCadNaturezaOperacao', 'Cadastro de Natureza de Operação'))
        else
          obNatOp.cadNatOperacao(2);
      finally
      end;
    end
    else if UpperCase(temp) = 'NCM' then
    begin
      try
        if FindWindow('TFrmCadNBM', 'Cadastro de NCM / SH') > 0 then
          SetForegroundWindow(FindWindow('TFrmCadNBM', 'Cadastro de NCM / SH'))
        else
        begin
          if hdProdutos = 0 then
            CarregaPacote('pkProdutos', hdProdutos);
          obProd.CadNbm(2);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'VENDA_RAPIDA' then
    begin
      try
        if FindWindow('TfrmCadPedVenda', 'Cadastro de Requisições') > 0 then
          SetForegroundWindow(FindWindow('TfrmCadPedVenda', 'Cadastro de Requisições'))
        else
        begin
          if hdPedVenda = 0 then
            CarregaPacote('pkPedidoVenda', hdPedVenda);
          vDadosIni.vtpVenda := 'OS';
          if vVenda = nil then
            vVenda := TPedVenda.create(DtmPedVenda);
          vVenda.verificaFiscalAtivo;
          vVenda.abreVendaDireto(True);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'VENDA_NORMAL' then
    begin
      try
        if FindWindow('TfrmCadPedVenda', 'Cadastro de Requisições') > 0 then
          SetForegroundWindow(FindWindow('TfrmCadPedVenda', 'Cadastro de Requisições'))
        else
        begin
          if hdPedVenda = 0 then
            CarregaPacote('pkPedidoVenda', hdPedVenda);
          vDadosIni.vtpVenda := 'OS';
          if vVenda = nil then
            vVenda := TPedVenda.create(DtmPedVenda);
          vVenda.verificaFiscalAtivo;
          vVenda.abreVendaDireto(False);
        end;
      finally
      end;
    end
      else if UpperCase(temp) = 'BALANCO' then
    begin
      try
        if FindWindow('TfrmBalanco', 'Balanço...') > 0 then
          SetForegroundWindow(FindWindow('TfrmBalanco', 'Balanço...'))
        else
        begin
          if hdProdutos = 0 then
            CarregaPacote('pkProdutos', hdProdutos);
           vBalanco._CadBalanco;
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'PEDIDO' then
    begin
      try
        if FindWindow('TfrmCadPedidoCompra', 'Manutenção de Pedido Compras') > 0 then
          SetForegroundWindow(FindWindow('TfrmCadPedidoCompra', 'Manutenção de Pedido Compras'))
        else
        begin
          vPedidoCompra.CadPedidoCompra(2);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'SUGESTAO' then
    begin
      try
        if FindWindow('TFrmSugestaoCompra', 'Sugestão de Compras') > 0 then
          SetForegroundWindow(FindWindow('TFrmSugestaoCompra', 'Sugestão de Compras'))
        else
        begin
          vSugestao.CadSugestao(2);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'BOLETO' then
    begin
      try
        if FindWindow('TfrmCadBoletos', 'Cadastro de Boletos') > 0 then
          SetForegroundWindow(FindWindow('TfrmCadBoletos', 'Cadastro de Boletos'))
        else
        begin
          vBoleto.cadBoleto(2);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'COBREBEM' then
    begin
      try
        if FindWindow('TfrmCadCobreBem', 'Cadastro CobreBem') > 0 then
          SetForegroundWindow(FindWindow('TfrmCadCobreBem', 'Cadastro CobreBem'))
        else
        begin
          vCobreBem.cadCobreBem(2);
        end;
      finally
      end;
    end
    else if UpperCase(temp) = 'VEICULOS' then
    begin
      try
        if FindWindow('TFrmCadVeiculos', 'Manutenção de Veículos') > 0 then
          SetForegroundWindow(FindWindow('TFrmCadVeiculos', 'Manutenção de Veículos'))
        else
        begin
          vVeiculo.CadVeiculos(2);
        end;
      finally
      end;
    end
    else if Pos('MODELOVEICULOS', UpperCase(temp)) > 0 then
    begin
      try
        if FindWindow('TFrmCadModVeiculos', 'Manutenção de Modelos de Veículos') > 0 then
          SetForegroundWindow(FindWindow('TFrmCadModVeiculos', 'Manutenção de Modelos de Veículos'))
        else
        begin
          if UpperCase(temp) = 'MODELOVEICULOS_VISUALIZAR' then
            vModVeiculo.CadModVeiculos(2)
          else
            vModVeiculo.CadModVeiculos(1);
        end;
      finally
      end;
    end
    else if Pos('ENV_ASSOHONDA', UpperCase(temp)) > 0 then
    begin
      if FindWindow('TFrmEnvAssoHonda', '') > 0 then
        SetForegroundWindow(FindWindow('TFrmEnvAssoHonda', ''))
      else
      begin
//        CarregaPacote('pkFabrica', hdIntegraFab);
        vDadosIni.vModalOuChild := 'M';
        formulario := Funcoes.AbreForm('pkFabrica', 'TFrmEnvAssoHonda', hdIntegraFab);
        try
          formulario.Showmodal;
        finally
          formulario.Free;
          unLoadPackage(hdIntegraFab);
        end;
      end;
    end;
    if UpperCase(temp) = 'TESTE' then
    begin
      AlphaBlend := false;
      WindowState := wsNormal;
      Caption := 'Testes';
      PageControl1.ActivePage := tsTestes;
    end
    else
      Application.Terminate;
    //
  finally
    closeallAuditoria;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmIntegracao.tsTestesEnter(Sender: TObject);
begin
  Randomize;
  EditHw1.AsValue := Random(100);
end;

initialization
  RegisterClass(TfrmIntegracao);
finalization
  UnRegisterClass(TfrmIntegracao);

end.

