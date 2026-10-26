unit uCadConferenciaCega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, DB, uEditHw;

type
	TBotoes = (Alterar, Salvar, Cancelar, Sair);
  TfrmCadConferenciaCega = class(TfrmCadPadraoM)
    tsPanels: TTabSheet;
    pnEntrada: TPanel;
    pcEntrada: TPageControl;
    tsPrincipal: TTabSheet;
    BitBtnVolta: TBitBtn;
    tsPedido: TTabSheet;
    Label6: TLabel;
    edtPedido: TEdit;
    BitBtnOkPedido: TBitBtn;
    BitBtnVoltaPedido: TBitBtn;
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    gbCabecalho: TGroupBox;
    gbItens: TGroupBox;
    pnItensConferencia: TPanel;
    pnDbgrid: TPanel;
    GroupBox7: TGroupBox;
    BitBtnApartirNF: TBitBtn;
    GroupBox8: TGroupBox;
    BitBtnApartirPedido: TBitBtn;
    tsCarga: TTabSheet;
    lbEntrada: TLabel;
    edtCargaPedido: TEdit;
    BitBtnOkCargaPedido: TBitBtn;
    BitBtnVoltaCargaPedido: TBitBtn;
    pnCarga: TPanel;
    gbPedidosCarga: TGroupBox;
    pnDbGridPedidos: TPanel;
    pnPedidoBotoes: TPanel;
    BitBtnOK: TBitBtn;
    dbgridPedidos: TDBGrid;
    gbConferencia: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    DBGridItens: TDBGrid;
    pnNavegacao: TPanel;
    sbFirst: TSpeedButton;
    sbPrevious: TSpeedButton;
    sbNext: TSpeedButton;
    sbLast: TSpeedButton;
    rgEntrada: TRadioGroup;
    sbSelAll: TSpeedButton;
    sbDesSelAll: TSpeedButton;
    lbCodigo: TLabel;
    dbedtCodigo: TDBEdit;
    lbCodCliente: TLabel;
    dbedtCodCliente: TDBEdit;
    lbTipoConf: TLabel;
    dbedtTipoConf: TDBEdit;
    lbStatus: TLabel;
    dbedtStatus: TDBEdit;
    lbNumDoc: TLabel;
    dbedtNumDoc: TDBEdit;
    lbDataDoc: TLabel;
    dbedtDataDoc: TDBEdit;
    dbedtNomeCliente: TDBEdit;
    DBEdtDescricao: TDBEdit;
    dsConfCegaItens: TDataSource;
    sbConfirmaItem: TSpeedButton;
    BitBtn13: TBitBtn;
    edtQuantContada: TEditFiscal;
    Label8: TLabel;
    dbedtContagem: TDBEdit;
    edtCodBarra: TEditFiscal;
    pnImpressao: TPanel;
    rgTipo: TRadioGroup;
    Panel23: TPanel;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    rgOrdenar: TRadioGroup;
    pnConfirma: TPanel;
    gbConfirma: TGroupBox;
    btnImprimeRelatorio: TBitBtn;
    btnRecontarDivergentes: TBitBtn;
    btnRecontarTodos: TBitBtn;
    btnTerceiraContagemDivergentes: TBitBtn;
    btnFecharComDivergencias: TBitBtn;
    btnTerceiraContagemTodos: TBitBtn;
    tsObservacao: TTabSheet;
    pnObservacao: TPanel;
    GroupBox61: TGroupBox;
    DBMemo4: TDBMemo;
    Panel74: TPanel;
    BitBtn63: TBitBtn;
    OpenDialogXML: TOpenDialog;
    tsItensNF: TTabSheet;
    pnItensNF: TPanel;
    pnItensNFCampos: TPanel;
    dsItensNF: TDataSource;
    pnItensNFBotoes: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    DBEdtDescricaoItemNF: TDBEdit;
    DBEdtNumFabFornecedor: TDBEdit;
    Label246: TLabel;
    btnAlterar: TBitBtn;
    pnItensNFNavegacao: TPanel;
    sbFirstItensNF: TSpeedButton;
    sbPriorItensNF: TSpeedButton;
    sbNextItensNF: TSpeedButton;
    sbLastItensNF: TSpeedButton;
    btnFechar: TBitBtn;
    tsEscolhaProduto: TTabSheet;
    pnEscolhaProdutos: TPanel;
    GroupBox4: TGroupBox;
    DBGridItensBusca: TDBGrid;
    Panel7: TPanel;
    BitBtn15: TBitBtn;
    BitBtn18: TBitBtn;
    edtCodigo: TEditFiscal;
    gbItensNF: TGroupBox;
    DBGrdItensNF: TDBGrid;
    cbCodigoFornecedor: TCheckBox;
    BitBtnApartirPedC: TBitBtn;
    GroupBox5: TGroupBox;
    cbNFE: TCheckBox;
    cbCARGA: TCheckBox;
    cbPEDC: TCheckBox;
    cbPEDV: TCheckBox;
    pnIdentificacao: TPanel;
    GroupBox6: TGroupBox;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    DBEditIdentificacao: TDBEdit;
    Removerstatusconferindo: TMenuItem;
    tsNotasFiscais: TTabSheet;
    pnNotasFiscais: TPanel;
    gbNotasFiscais: TGroupBox;
    pnBotoes: TPanel;
    btnSair: TBitBtn;
    btnApartirXML: TBitBtn;
    btnNFExistente: TBitBtn;
    DBGridNotasFiscais: TDBGrid;
    btnMontarConferencia: TBitBtn;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNFExistenteClick(Sender: TObject);
    procedure NoExibirPropaganda1Click(Sender: TObject);
    procedure btnMontarConferenciaClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure btnApartirXMLClick(Sender: TObject);
    procedure RemoverstatusconferindoClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure pnEntradaEnter(Sender: TObject);
    procedure BitBtnVoltaPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnVoltaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox3Click(Sender: TObject);
    procedure BitBtnApartirPedCClick(Sender: TObject);
    procedure DBGridItensBuscaTitleClick(Column: TColumn);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn15Click(Sender: TObject);
    procedure sbLastItensNFClick(Sender: TObject);
    procedure sbNextItensNFClick(Sender: TObject);
    procedure sbPriorItensNFClick(Sender: TObject);
    procedure sbFirstItensNFClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure DBEdtNumFabItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrdItensNFDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtnApartirXMLClick(Sender: TObject);
    procedure DBGridItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure btnImprimeRelatorioClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btnFecharComDivergenciasClick(Sender: TObject);
    procedure btnTerceiraContagemTodosClick(Sender: TObject);
    procedure btnTerceiraContagemDivergentesClick(Sender: TObject);
    procedure btnRecontarTodosClick(Sender: TObject);
    procedure btnRecontarDivergentesClick(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure edtCodBarraKeyPress(Sender: TObject; var Key: Char);
    procedure edtQuantContadaKeyPress(Sender: TObject; var Key: Char);
    procedure sbConfirmaItemClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure sbLastClick(Sender: TObject);
    procedure sbNextClick(Sender: TObject);
    procedure sbPreviousClick(Sender: TObject);
    procedure sbFirstClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbgridPedidosDblClick(Sender: TObject);
    procedure dbgridPedidosKeyPress(Sender: TObject; var Key: Char);
    procedure sbSelAllClick(Sender: TObject);
    procedure sbDesSelAllClick(Sender: TObject);
    procedure rgEntradaClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtnOkCargaPedidoClick(Sender: TObject);
    procedure BitBtnVoltaPedidoClick(Sender: TObject);
    procedure BitBtnOkPedidoClick(Sender: TObject);
    procedure BitBtnApartirNFClick(Sender: TObject);
    procedure BitBtnApartirPedidoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure mostraColunas;
    procedure mudaNomeCampos(pTipoConferencia: string);
    procedure ocultaCampos(pFlag: string);
    function validaValor(pTexto: string): boolean;
    procedure desabilitaBotoes; overload;
    procedure desabilitaBotoes(pBotao: TBotoes); overload;
  public
    { Public declarations }
  end;

var
  frmCadConferenciaCega: TfrmCadConferenciaCega;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;

implementation

uses uClasseConferenciaCega, uDtmConferenciaCega, uDtmAtivo, uDadosIni,
  uDataSet_OOP, uImportXmlNf, uCadNF;

{$R *.dfm}

procedure TfrmCadConferenciaCega.BitBtnOkCargaPedidoClick(Sender: TObject);
var
	vCodigo: integer;
begin
	try
    Screen.Cursor := crHourGlass;

    vCadConferenciaCega.CodCarga := StrToIntDef(edtCargaPedido.Text, 0);
    //CARGA
    if rgEntrada.ItemIndex = 0 then
    begin
    	if edtCargaPedido.Text = '' then
      	Exit;

      if vCadConferenciaCega.existeConferencia(edtCargaPedido.Text, 'CARGA', vDadosIni.codEmpresa, vCodigo) then
      begin
        Application.MessageBox(pchar('Conferência Cega já existe, Código: ' + IntToStr(vCodigo)), 'Informação', MB_ICONINFORMATION + MB_OK);
        Exit;
      end;

      if not vCadConferenciaCega.exiteCarga(edtCargaPedido.Text, vDadosIni.codEmpresa) then
      begin
        Application.MessageBox(pchar('Carga não exite ou não está Fechada!'), 'Informação', MB_ICONINFORMATION + MB_OK);
        Exit;
      end;

      if not vCadConferenciaCega.inserirCabecalho(vDadosIni.codEmpresa, 'CARGA', edtCargaPedido.Text) then
        Exit;
      mostraColunas;
      ocultaCampos('');
      mudaNomeCampos(vCadConferenciaCega.dataSet.FieldByName('TIPO_CONFERENCIA').AsString);
      gbConferencia.Visible := False;
      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := tsCadastro;
    end
    //PEDIDO
    else if rgEntrada.ItemIndex = 2 then
    begin
      if vCadConferenciaCega.existeConferencia(edtCargaPedido.Text, 'PEDV', vDadosIni.codEmpresa, vCodigo) then
      begin
        Application.MessageBox(pchar('Conferência Cega já existe, Código: ' + IntToStr(vCodigo)), 'Informação', MB_ICONINFORMATION + MB_OK);
        Exit;
      end;

      if not vCadConferenciaCega.existeVenda(edtCargaPedido.Text) then
      begin
        Application.MessageBox(pchar('Venda não exite ou não está Aberta!'), 'Informação', MB_ICONINFORMATION + MB_OK);
        Exit;
      end;

      if not vCadConferenciaCega.gerenteAutorizou(StrToIntDef(edtCargaPedido.Text, 0)) then
      begin
        Application.MessageBox(pchar('Venda não está autorizada pelo gerente!'), 'Informação', MB_ICONINFORMATION + MB_OK);
        Exit;
      end;

      if not vCadConferenciaCega.financeiroAutorizou(StrToIntDef(edtCargaPedido.Text, 0)) then
      begin
        Application.MessageBox(pchar('Venda não está autorizada pelo financeiro!'), 'Informação', MB_ICONINFORMATION + MB_OK);
        Exit;
      end;

      if not vCadConferenciaCega.inserirCabecalho(vDadosIni.codEmpresa, 'PEDV', edtCargaPedido.Text) then
        Exit;
        
      vCadConferenciaCega.vItensConfCega.configuraTags('');
      mostraColunas;
      ocultaCampos('');
      mudaNomeCampos(vCadConferenciaCega.dataSet.FieldByName('TIPO_CONFERENCIA').AsString);
      gbConferencia.Visible := False;
      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := tsCadastro;
    end
    //PEDIDO EM LOTE
    else if rgEntrada.ItemIndex = 1 then
    begin
    	if edtCargaPedido.Text = '' then
      	Exit;

      if not vCadConferenciaCega.exiteCarga(edtCargaPedido.Text, vDadosIni.codEmpresa) then
      begin
        Application.MessageBox(pchar('Carga não existe ou não está Fechada!'), 'Informação', MB_ICONINFORMATION + MB_OK);
        Exit;
      end;

      vCadConferenciaCega.abreCargaVenda(vCadConferenciaCega.CodCarga);
      vCadConferenciaCega.abreForm('Selecione as vendas', pnCarga, tsPanels);
    end
    //QUANDO UTILIZA SEPARACAO
    else if rgEntrada.ItemIndex = 3 then
    begin
      if not(vCadConferenciaCega.abreVendasSeparacao(vCadConferenciaCega.Tipo)) then
      begin
				Application.MessageBox(Pchar('Atualmente não existem pedidos abertos com Separação/Conferência = "SEPARADO"'), 'Informação', 0 + 64);
        Exit;
      end;
      vCadConferenciaCega.abreForm('Selecione as vendas', pnCarga, tsPanels);
    end;
    TForm(pnEntrada.Parent).ModalResult := mrOk;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.BitBtnOKClick(Sender: TObject);
begin
  try
  	BitBtnOK.Enabled := False;
    gbPedidosCarga.Cursor := crHourGlass;
    
  	vCadConferenciaCega.inserirEmLote;
    
  	if vCadConferenciaCega.QuantNaoInserido > 0 then
			Application.MessageBox(pchar(IntToStr(vCadConferenciaCega.QuantNaoInserido) + ' Conferências(s) cega(s) não foram criadas pois já existem!'), 'Informação', MB_ICONINFORMATION + MB_OK);
  	if vCadConferenciaCega.QuantInserido > 0 then
			Application.MessageBox(pchar(IntToStr(vCadConferenciaCega.QuantInserido) + ' Conferência(s) cega(s) criada(s)!'), 'Informação', MB_ICONINFORMATION + MB_OK);
 		PageControl1.ActivePage := TabSheet2;
  	ocultaCampos('');
  	mostraColunas;
  finally
  	BitBtnOK.Enabled := True;
    gbPedidosCarga.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.BitBtn13Click(Sender: TObject);
begin
	if vCadConferenciaCega.vItensConfCega.contarItem(0, True) then
  	Application.MessageBox(pchar('Conferência salva com sucesso!'), 'Informação', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmCadConferenciaCega.BitBtn15Click(Sender: TObject);
begin
	try
    vCadConferenciaCega.vItensNF.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
      vCadConferenciaCega.vConsultaProdutos.dataSet.FieldByName('NUM_FAB_PROD').AsString;
    vCadConferenciaCega.vItensNF.dataSet.FieldByName('GRUPO_PROD').AsString :=
      vCadConferenciaCega.vConsultaProdutos.dataSet.FieldByName('GRUPO_PROD').AsString;
    vCadConferenciaCega.vItensNF.dataSet.FieldByName('COD_PROD').AsString :=
      vCadConferenciaCega.vConsultaProdutos.dataSet.FieldByName('COD_PROD').AsString;
    vCadConferenciaCega.vConsultaProdutos.vCodigoFornecedor.buscaCodCliente(vCadConferenciaCega.vItensNF.dataSet.FieldByName('COD_NF').AsInteger);      
  finally
  	edtCodigo.Clear;
  end;
end;

procedure TfrmCadConferenciaCega.BitBtn1Click(Sender: TObject);
var
  vTemp: string;
  i: integer;
begin
  if not vDadosIni.PesqPros('RM006', 'CONSULTA', '', 'CONFERENCIA_CEGA', '',
    vCadConferenciaCega.buscas, true) then
    Exit;

  inherited;

  SetLength(vCadConferenciaCega.vTipo, 0);

  if cbNFE.Checked then
  begin
    SetLength(vCadConferenciaCega.vTipo, Length(vCadConferenciaCega.vTipo) + 1);
    vCadConferenciaCega.vTipo[Length(vCadConferenciaCega.vTipo) - 1] := cNFENT;
  end;

  if cbPEDC.Checked then
  begin
    SetLength(vCadConferenciaCega.vTipo, Length(vCadConferenciaCega.vTipo) + 1);
    vCadConferenciaCega.vTipo[Length(vCadConferenciaCega.vTipo) - 1] := cPEDC;
  end;

  if cbCARGA.Checked then
  begin
    SetLength(vCadConferenciaCega.vTipo, Length(vCadConferenciaCega.vTipo) + 1);
    vCadConferenciaCega.vTipo[Length(vCadConferenciaCega.vTipo) - 1] := cCARGA;
  end;

  if cbPEDV.Checked then
  begin
    SetLength(vCadConferenciaCega.vTipo, Length(vCadConferenciaCega.vTipo) + 1);
    vCadConferenciaCega.vTipo[Length(vCadConferenciaCega.vTipo) - 1] := cPEDV;
  end;


  if MaskEdit2.Visible then
    vTemp := '*D*A*T*A*'
  else
    vTemp := MaskEdit3.Text;
  if vCadConferenciaCega.pesquisa(ComboBox1.Text, ComboBox3.Text,vTemp, MaskEdit1.Text, MaskEdit2.Text ) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
    ComboBox1.SetFocus;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;

  if vCadConferenciaCega.dataSet.Active then
 	  for I := 0 to DBGrid1.Columns.Count - 1 do
  	  if DBGrid1.Columns[i].FieldName = 'OBSERVACAO' then
    	  DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
end;

procedure TfrmCadConferenciaCega.BitBtn29Click(Sender: TObject);
begin
	if rgOrdenar.ItemIndex = 0 then
		vCadConferenciaCega.pOrdenacao := cNitem
  else if rgOrdenar.ItemIndex = 1 then
		vCadConferenciaCega.pOrdenacao := cGrupo
  else if rgOrdenar.ItemIndex = 2 then
		vCadConferenciaCega.pOrdenacao := cDescricao;
  if rgTipo.ItemIndex = 0 then
    vCadConferenciaCega.imprimirRelatorio(cGuiaCega)
  else if rgTipo.ItemIndex = 1 then
  begin
    if vCadConferenciaCega.contagemAtualFechada(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) then
      vCadConferenciaCega.imprimirRelatorio(cDivergencias)
    else
			Application.MessageBox(pchar('Contagem atual não está Fechada! '+#13+'Confirme a Contagem antes de continuar!'), 'Informação', MB_ICONINFORMATION + MB_OK);
  end;
end;

procedure TfrmCadConferenciaCega.BitBtn2Click(Sender: TObject);
begin
	vCadConferenciaCega.vItensConfCega.contarItem(0, False, True);
  inherited;
end;

procedure TfrmCadConferenciaCega.BitBtn3Click(Sender: TObject);
begin
  pcEntrada.ActivePage := tsPrincipal;
	vCadConferenciaCega.abreForm('Nova Ordem de Conferência', pnEntrada, tsPanels);
end;

procedure TfrmCadConferenciaCega.BitBtn4Click(Sender: TObject);
begin
	desabilitaBotoes;
	if vCadConferenciaCega.contagemAtualFechada(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) then
    vCadConferenciaCega.abreForm('Confirmar Contagem', pnConfirma, tsPanels)
  else if Application.MessageBox(pchar('A Confirmação Fechará a Contagem Atual, deseja continuar?'), 'Informação', MB_ICONINFORMATION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
  begin
    if vCadConferenciaCega.alteraStatusContagemAtual(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) then
    	vCadConferenciaCega.abreForm('Confirmar Contagem', pnConfirma, tsPanels)
  end;
end;

procedure TfrmCadConferenciaCega.BitBtn5Click(Sender: TObject);
begin
	vCadConferenciaCega.vItensConfCega.contarItem(0, False, True);
  inherited;
end;

procedure TfrmCadConferenciaCega.BitBtn7Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (DBEditIdentificacao.CanFocus) then
  	DBEditIdentificacao.SetFocus;
end;

procedure TfrmCadConferenciaCega.btnSalvarClick(Sender: TObject);
begin
  inherited;
 if vCadConferenciaCega.vItensNF.post then
 begin
 	if cbCodigoFornecedor.Checked then
    vCadConferenciaCega.vConsultaProdutos.vCodigoFornecedor.cadastrarCodigoFornecedor(
    vCadConferenciaCega.vConsultaProdutos.vCodigoFornecedor.CodCliente,
    vCadConferenciaCega.vItensNF.dataSet.FieldByName('GRUPO_PROD').AsInteger,
  	vCadConferenciaCega.vItensNF.dataSet.FieldByName('COD_PROD').AsString,
    vCadConferenciaCega.vItensNF.dataSet.FieldByName('NUM_FAB_FORNECEDOR').AsString
    );
  	vCadConferenciaCega.vItensNF.Next;
    desabilitaBotoes(Salvar);
    if (Self.Enabled) and (Self.Visible) and (btnAlterar.CanFocus) then
			btnAlterar.SetFocus;
 end;
end;

procedure TfrmCadConferenciaCega.btnAlterarClick(Sender: TObject);
begin
  if vCadConferenciaCega.vItensNF.edit then
  begin
  	desabilitaBotoes(Alterar);
  	if (Self.Enabled) and (Self.Visible) and (edtCodigo.CanFocus) then
  		edtCodigo.SetFocus;
  end;
end;

procedure TfrmCadConferenciaCega.btnApartirXMLClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    vCadConferenciaCega.inserirPreNota(vCadConferenciaCega.dataSet.FieldByName('NUM_DOC').AsInteger);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.btnCancelarClick(Sender: TObject);
begin
  vCadConferenciaCega.vItensNF.cancel;
  desabilitaBotoes(Cancelar);
end;

procedure TfrmCadConferenciaCega.BitBtn9Click(Sender: TObject);
begin
  inherited;
  vCadConferenciaCega.vItensNF.cancel;
end;

procedure TfrmCadConferenciaCega.btnTerceiraContagemTodosClick(Sender: TObject);
begin
	vCadConferenciaCega.vItensConfCega.recontar(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger, vCadConferenciaCega, '', 'S');
end;

procedure TfrmCadConferenciaCega.CheckBox3Click(Sender: TObject);
begin
  inherited;
  GroupBox5.Visible := CheckBox3.Checked;
end;

procedure TfrmCadConferenciaCega.DBEdtNumFabItemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	try
    if ((key = VK_F3) or (key = VK_F4))  then
      vDadosIni.vPesquisa	:= vDadosIni.pesquisaRapida('PRODUTOS');
    if Trim(vDadosIni.vPesquisa) <> '' then
      vCadConferenciaCega.vItensNF.dataSet.FieldByName('NUM_FAB_PROD').AsString := Trim(vDadosIni.vPesquisa);
    if Trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
      vCadConferenciaCega.vItensNF.dataSet.FieldByName('GRUPO_PROD').AsString := Trim(vDadosIni.vPesquisaGrupo_prod);
    if Trim(vDadosIni.vPesquisaCod_prod) <> '' then
      vCadConferenciaCega.vItensNF.dataSet.FieldByName('COD_PROD').AsString := Trim(vDadosIni.vPesquisaCod_prod);
  finally
  	vDadosIni.vPesquisa := '';
    vDadosIni.vPesquisaGrupo_prod := '';
    vDadosIni.vPesquisaCod_prod := '';
  end;
end;

procedure TfrmCadConferenciaCega.DBGrdItensNFDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Trim(vCadConferenciaCega.vItensNF.dataSet.FieldByName('COD_PROD').AsString) = '') and
    (Trim(vCadConferenciaCega.vItensNF.dataSet.FieldByName('TIPO_ITEM').AsString) = 'P') then
  begin
    DBGrdItensNF.Canvas.Brush.Color := clRed; // define uma cor de fundo //$00FFD9B3
    DBGrdItensNF.Canvas.FillRect(Rect); // pinta a célula
    DBGrdItensNF.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end;
//  if vCadConferenciaCega.vItensNF.dataSet.State in [dsEdit, dsInsert] then
//  begin
//    gbItensNF.Enabled := False;
//    pnItensNFNavegacao.Enabled := False;
//    pnItensNFCampos.Enabled := True;
//    btnAlterar.Enabled := False;
//    btnSalvar.Enabled := True;
//    btnCancelar.Enabled := True;
//  end
//  else
//  begin
//		gbItensNF.Enabled := True;
//    pnItensNFNavegacao.Enabled := True;    
//    pnItensNFCampos.Enabled := False;
//    btnAlterar.Enabled := True;
//    btnSalvar.Enabled := False;
//    btnCancelar.Enabled := False;
//  end;
end;

procedure TfrmCadConferenciaCega.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
	if key = #13 then
    SpeedButton1.Click;
end;

procedure TfrmCadConferenciaCega.DBGridItensBuscaTitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGridItensBusca, Column);
end;

procedure TfrmCadConferenciaCega.DBGridItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
	if DBGridItens.DataSource.DataSet.State in [dsEdit, dsInsert, dsBrowse] then //Cor da linha selecionada
   if Rect.Top = TStringGrid(DBGridItens).CellRect(0,TStringGrid(DBGridItens).Row).Top then begin
      DBGridItens.Canvas.FillRect(Rect);
      DBGridItens.Canvas.Brush.Color := TColor($F0CAA6);
      DBGridItens.DefaultDrawDataCell(Rect,Column.Field,State)
   end;
	if gdSelected in State then begin //Cor da célula selecionada
   DBGridItens.Canvas.Brush.Color := TColor($F0CAA6);
   DBGridItens.Canvas.FillRect(Rect);
   DBGridItens.DefaultDrawDataCell(Rect,Column.Field,State)
end
end;

procedure TfrmCadConferenciaCega.BitBtnApartirNFClick(Sender: TObject);
var
	vCodigo: integer;
begin
	try
  	Screen.Cursor := crHourGlass;
  	if not vDadosIni.PesqPros('RM012', 'CONSULTA', '', 'CONFERENCIA_CEGA', '', dtmConferenciaCega.qrBuscas, False) then
      Exit;
  	vDadosIni.vPesquisa	:= vDadosIni.pesquisaRapida('NOTAFISCAL', ' and natureza_nf = ''E'' and (upper(trim(status)) = ''FECHADA'' and tipo_nf = ''P'')', 'Consulta NF Entrada');
		if vCadConferenciaCega.existeNF(Trim(vDadosIni.vPesquisa)) then
    	if not vCadConferenciaCega.existeConferencia(Trim(vDadosIni.vPesquisa), 'NFENT', vDadosIni.codEmpresa, vCodigo) then
      begin
    		if not vCadConferenciaCega.inserirCabecalho(vDadosIni.codEmpresa, 'NFENT', vDadosIni.vPesquisa) then
        	Exit;
        mostraColunas;
        ocultaCampos('');
        mudaNomeCampos(vCadConferenciaCega.dataSet.FieldByName('TIPO_CONFERENCIA').AsString);
        gbConferencia.Visible := False;
        PageControl1.ActivePage := TabSheet1;
        PageControl3.ActivePage := tsCadastro;
  			TForm(pnEntrada.Parent).ModalResult := mrOk;        
      end
      else
    		Application.MessageBox(pchar('Conferência Cega já existe, Código: ' + IntToStr(vCodigo)), 'Informação', MB_ICONINFORMATION + MB_OK);
  finally
  	vDadosIni.vPesquisa := '';
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.BitBtnOkPedidoClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    gbConferencia.Visible := False;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    mudaNomeCampos(vCadConferenciaCega.dataSet.FieldByName('TIPO_CONFERENCIA').AsString);
    vCadConferenciaCega.abreConfCega;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.BitBtnVoltaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_ESCAPE then
    BitBtnVolta.Click;
end;

procedure TfrmCadConferenciaCega.BitBtnVoltaPedidoClick(Sender: TObject);
begin
	pcEntrada.ActivePage := tsPrincipal;
end;

procedure TfrmCadConferenciaCega.BitBtnVoltaPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_ESCAPE then
  	pcEntrada.ActivePage := tsPrincipal;
end;

procedure TfrmCadConferenciaCega.btnFecharClick(Sender: TObject);
begin
	vCadConferenciaCega.vItensNF.cancel;
  desabilitaBotoes(Sair);
end;

procedure TfrmCadConferenciaCega.btnFecharComDivergenciasClick(Sender: TObject);
begin
	if Application.MessageBox(pchar('Deseja realmente fechar esta Conferência Cega?'), 'Informação', MB_ICONINFORMATION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
  begin
		vCadConferenciaCega.fecharConferenciaCega(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger);
  	PageControl1.ActivePage := TabSheet2;
  	//PageControl3.ActivePage := tsCadastro;
  end;
end;

procedure TfrmCadConferenciaCega.btnImprimeRelatorioClick(Sender: TObject);
begin
	rgTipo.ItemIndex := 1;
	vCadConferenciaCega.abreForm('Relatórios', pnImpressao, tsPanels);
end;

procedure TfrmCadConferenciaCega.btnMontarConferenciaClick(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
  	vCadConferenciaCega.montarConferenciaCega(vCadConferenciaCega.dataSet.FieldByName('NUM_DOC').AsInteger);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.btnNFExistenteClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    vCadConferenciaCega.adicionarNotaFiscalExistente;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.btnRecontarDivergentesClick(Sender: TObject);
begin
	vCadConferenciaCega.vItensConfCega.recontar(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger, vCadConferenciaCega, 'Divergentes', 'N');
end;

procedure TfrmCadConferenciaCega.btnRecontarTodosClick(Sender: TObject);
begin
	vCadConferenciaCega.vItensConfCega.recontar(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger, vCadConferenciaCega, '', '');
end;

procedure TfrmCadConferenciaCega.btnTerceiraContagemDivergentesClick(Sender: TObject);
begin
	vCadConferenciaCega.vItensConfCega.recontar(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger, vCadConferenciaCega, 'Divergentes', 'S');
end;

procedure TfrmCadConferenciaCega.BitBtnApartirPedCClick(Sender: TObject);
var
	vCodigo: integer;
begin
	if not vDadosIni.PesqPros('RM014', 'CONSULTA', '', 'CONFERENCIA_CEGA', '', dtmConferenciaCega.qrBuscas, False) then
  	Exit;
  try
		vDadosIni.vPesquisa	:= vDadosIni.pesquisaRapida('PEDIDO', ' and (upper(trim(status_ped)) = ''EFETIVADO'')', 'Consulta de Pedido de Compra');
		if vCadConferenciaCega.existePedidoDeCompra(Trim(vDadosIni.vPesquisa)) then
    	if not vCadConferenciaCega.existeConferencia(Trim(vDadosIni.vPesquisa), 'PEDC', vDadosIni.codEmpresa, vCodigo) then
      begin
    		if not vCadConferenciaCega.inserirCabecalho(vDadosIni.codEmpresa, 'PEDC', vDadosIni.vPesquisa) then
        	Exit;
        mostraColunas;
        ocultaCampos('');
        mudaNomeCampos(vCadConferenciaCega.dataSet.FieldByName('TIPO_CONFERENCIA').AsString);
        gbConferencia.Visible := False;
        PageControl1.ActivePage := TabSheet1;
        PageControl3.ActivePage := tsCadastro;
  			TForm(pnEntrada.Parent).ModalResult := mrOk;        
      end
      else
    		Application.MessageBox(pchar('Conferência Cega já existe, Código: ' + IntToStr(vCodigo)), 'Informação', MB_ICONINFORMATION + MB_OK);
  finally
  	vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmCadConferenciaCega.BitBtnApartirPedidoClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('RM015', 'CONSULTA', '', 'CONFERENCIA_CEGA', '', dtmConferenciaCega.qrBuscas, False) then
    Exit;
	pcEntrada.ActivePage := tsCarga;
  if (Self.Enabled) and (Self.Visible) and (edtCargaPedido.CanFocus) then
  	edtCargaPedido.SetFocus;
	if vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S1' then
		rgEntrada.ItemIndex := 0
  else if vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S2' then
  begin
  	if UpperCase(vDadosIni.vEmp.vUSAR_SEPARACAO_PED) = 'S' then
  		rgEntrada.ItemIndex := 3
    else
  		rgEntrada.ItemIndex := 2;
  end
  else if vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S3' then
  	rgEntrada.ItemIndex := 1
  else
  	rgEntrada.ItemIndex := -1;  	
end;

procedure TfrmCadConferenciaCega.BitBtnApartirXMLClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
  	if not vCadConferenciaCega.inserirCabecalhoNFENT then
    	Exit;

    TForm(pnEntrada.Parent).ModalResult := mrOk;
    vCadConferenciaCega.abreFormLoteNF(vCadConferenciaCega.dataSet.FieldByName('NUM_DOC').AsInteger);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.dbgridPedidosDblClick(Sender: TObject);
begin
	vCadConferenciaCega.selMarcadoCargaVenda(vCadConferenciaCega.vCargaVenda.RecNo);
end;

procedure TfrmCadConferenciaCega.dbgridPedidosKeyPress(Sender: TObject;
  var Key: Char);
begin
	if Key = #32 then
  	vCadConferenciaCega.selMarcadoCargaVenda(vCadConferenciaCega.vCargaVenda.RecNo);
end;

procedure TfrmCadConferenciaCega.DBMemo1KeyPress(Sender: TObject;
  var Key: Char);
begin
	Key := AnsiUpperCase( Key )[1];
end;

procedure TfrmCadConferenciaCega.desabilitaBotoes(pBotao: TBotoes);
begin
  case pBotao of
    Alterar:
    begin
    	btnAlterar.Enabled := False;
      btnSalvar.Enabled := True;
      btnCancelar.Enabled := True;
      pnItensNFCampos.Enabled := True;
    end;
    Salvar:
    begin
    	btnCancelar.Enabled := False;
      btnSalvar.Enabled := False;
      btnAlterar.Enabled := True;
      pnItensNFCampos.Enabled := False;
    end;
    Cancelar:
    begin
    	btnCancelar.Enabled := False;
      btnSalvar.Enabled := False;
      btnAlterar.Enabled := True;
      pnItensNFCampos.Enabled := False;
    end;
    Sair:
    begin
      btnSalvar.Enabled := False;
      btnAlterar.Enabled := True;
      btnCancelar.Enabled := False;
      pnItensNFCampos.Enabled := False;      
    end;
  end;
end;

procedure TfrmCadConferenciaCega.desabilitaBotoes;
begin
  if vCadConferenciaCega.vItensConfCega.existeDivergencia(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) then
  begin
  	btnImprimeRelatorio.Enabled := False;
    btnRecontarDivergentes.Enabled := False;
    btnRecontarTodos.Enabled := False;
    btnTerceiraContagemDivergentes.Enabled := False;
    btnTerceiraContagemTodos.Enabled := False;
  end
 	else if vCadConferenciaCega.vItensConfCega.verificaContagemCabecalho(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'PRIMEIRA' then
  begin
  	btnImprimeRelatorio.Enabled := True;
    btnRecontarDivergentes.Enabled := True;
    btnRecontarTodos.Enabled := True;
    btnTerceiraContagemDivergentes.Enabled := False;
    btnTerceiraContagemTodos.Enabled := False;
  end
  else if vCadConferenciaCega.vItensConfCega.verificaContagemCabecalho(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'SEGUNDA' then
  begin
  	btnImprimeRelatorio.Enabled := True;  
  	btnRecontarDivergentes.Enabled := False;
    btnRecontarTodos.Enabled := False;
    btnTerceiraContagemDivergentes.Enabled := True;
    btnTerceiraContagemTodos.Enabled := True;
  end
  else if vCadConferenciaCega.vItensConfCega.verificaContagemCabecalho(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = 'TERCEIRA' then
  begin
  	btnImprimeRelatorio.Enabled := True;
  	btnRecontarDivergentes.Enabled := False;
    btnRecontarTodos.Enabled := False;
    btnTerceiraContagemDivergentes.Enabled := False;
    btnTerceiraContagemTodos.Enabled := False;
  end;
end;

procedure TfrmCadConferenciaCega.edtCodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	try
  	if (key = VK_RETURN) then
    begin
    	if not vCadConferenciaCega.vConsultaProdutos.buscaProduto(edtCodigo.Text, True) then
      	Exit
      else
      begin
      	if (Self.Enabled) and (Self.Visible) and (btnSalvar.CanFocus) then
        	btnSalvar.SetFocus;
      end;
      if not vCadConferenciaCega.vConsultaProdutos.AbrirTelaEscolha then
      begin
        vCadConferenciaCega.vItensNF.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
          vCadConferenciaCega.vConsultaProdutos.dataSet.FieldByName('NUM_FAB_PROD').AsString;
        vCadConferenciaCega.vItensNF.dataSet.FieldByName('GRUPO_PROD').AsString :=
          vCadConferenciaCega.vConsultaProdutos.dataSet.FieldByName('GRUPO_PROD').AsString;
        vCadConferenciaCega.vItensNF.dataSet.FieldByName('COD_PROD').AsString :=
          vCadConferenciaCega.vConsultaProdutos.dataSet.FieldByName('COD_PROD').AsString;
        vCadConferenciaCega.vConsultaProdutos.vCodigoFornecedor.buscaCodCliente(vCadConferenciaCega.vItensNF.dataSet.FieldByName('COD_NF').AsInteger);
        edtCodigo.Clear;
        if (Self.Enabled) and (Self.Visible) and (btnSalvar.CanFocus) then
        	btnSalvar.SetFocus;
      end;
    end;
    if (key = VK_F3)  then
    begin
        vDadosIni.vPesquisa	:= vDadosIni.pesquisaRapida('PRODUTOS');
      if Trim(vDadosIni.vPesquisa) <> '' then
        vCadConferenciaCega.vItensNF.dataSet.FieldByName('NUM_FAB_PROD').AsString := Trim(vDadosIni.vPesquisa);
      if Trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
        vCadConferenciaCega.vItensNF.dataSet.FieldByName('GRUPO_PROD').AsString := Trim(vDadosIni.vPesquisaGrupo_prod);
      if Trim(vDadosIni.vPesquisaCod_prod) <> '' then
        vCadConferenciaCega.vItensNF.dataSet.FieldByName('COD_PROD').AsString := Trim(vDadosIni.vPesquisaCod_prod);
      vCadConferenciaCega.vConsultaProdutos.vCodigoFornecedor.buscaCodCliente(vCadConferenciaCega.vItensNF.dataSet.FieldByName('COD_NF').AsInteger);
      edtCodigo.Clear;
    end;
  finally
  	vDadosIni.vPesquisa := '';
    vDadosIni.vPesquisaGrupo_prod := '';
    vDadosIni.vPesquisaCod_prod := '';
  end;
end;

procedure TfrmCadConferenciaCega.edtCodBarraKeyPress(Sender: TObject;
  var Key: Char);
begin
	if Key = #13 then
  begin
  	vCadConferenciaCega.vItensConfCega.contarItemCodBarra(edtCodBarra.Text);
  	edtCodBarra.SelectAll;
  end
end;

procedure TfrmCadConferenciaCega.edtQuantContadaKeyPress(Sender: TObject;
  var Key: Char);
begin
	if not (Key in ['0'..'9',#8,#13, ',']) then 
  	key := #0;
        
	if Key = #13 then
  begin
    sbConfirmaItem.Click;
  end;
end;

procedure TfrmCadConferenciaCega.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
	vCadConferenciaCega.vItensConfCega.contarItem(0, False, True);
 	vCadConferenciaCega.Free;
  vCadConferenciaCega := nil;

  Action := caFree;
  frmCadConferenciaCega := nil;
end;

procedure TfrmCadConferenciaCega.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  vCadConferenciaCega := TConferenciaCega.create;

  TabSheet3.TabVisible := false;
  tsPanels.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadConferenciaCega.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (vCadConferenciaCega.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadConferenciaCega.FormShow(Sender: TObject);
begin
	if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConferenciaCega.dsConfCegaCabecalho;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    CheckBox1.Visible := False;
    CheckBox3.Visible := False;
  end;

  if TelaCadastro = 1 then
    BitBtn3.Click;
//  else if TelaCadastro = 2 then
//    BitBtn7.Click
  
  vDadosIni.fechaStatusProcessamento;
  tsPrincipal.TabVisible := False;
  tsPedido.TabVisible := False;
  tsCadastro.TabVisible := False;
  tsCarga.TabVisible := False;
  tsObservacao.TabVisible := False;
  tsItensNF.TabVisible := False;
  tsEscolhaProduto.TabVisible := False;
  tsNotasFiscais.TabVisible := False;  

	imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "RM011" FECHAR CONTAGEM ATUAL CONFERENCIA CEGA' + #13 +
    'Processo "RM016" PERMITE BUSCA POR NUMERO DO DOCUMENTO';
	CheckBox3.Visible := True;
end;

procedure TfrmCadConferenciaCega.mostraColunas;
var
	i: integer;
begin
  if DBGridItens.DataSource.DataSet = nil then
    Exit;
    for I := 0 to DBGridItens.DataSource.DataSet.FieldCount - 1 do
    begin
  		if (DBGridItens.DataSource.DataSet.Fields[i].Tag = 0) or (DBGridItens.DataSource.DataSet.Fields[i].Tag = 2) then
    		DBGridItens.DataSource.DataSet.Fields[i].Visible := True
  		else if DBGridItens.DataSource.DataSet.Fields[i].Tag = 1 then
    		DBGridItens.DataSource.DataSet.Fields[i].Visible := False;
    end;
end;

procedure TfrmCadConferenciaCega.mudaNomeCampos(pTipoConferencia: string);
begin
	if Trim(pTipoConferencia) = 'NFENT' then
  begin
    lbCodCliente.Caption := 'Cod. Fornec.';
    lbNumDoc.Caption := 'Lote Conf.';
    lbDataDoc.Caption := 'Data Cad.';
  end
  else if Trim(pTipoConferencia) = 'PEDV' then
	begin
    lbCodCliente.Caption := 'Cod. Cliente';
    lbNumDoc.Caption := 'Num Doc';
    lbDataDoc.Caption := 'Data Doc';
  end
  else if Trim(pTipoConferencia) = 'CARGA' then
  begin
    lbCodCliente.Caption := 'Cod. Cliente';  
    lbNumDoc.Caption := 'Num Doc';
    lbDataDoc.Caption := 'Data Doc';
  end;
end;

procedure TfrmCadConferenciaCega.NoExibirPropaganda1Click(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    vCadConferenciaCega.removerNotaFiscal;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.ocultaCampos(pFlag: string);
begin
  if pFlag = 'Conferente' then
  begin
  	  gbConferencia.Visible := True;
      lbNumDoc.Visible := False;
    	dbedtNumDoc.Visible := False;
      lbDataDoc.Visible := False;
      dbedtDataDoc.Visible := False;
    	lbCodCliente.Visible := False;
      dbedtCodCliente.Visible := False;
      dbedtNomeCliente.Visible := False;
      gbCabecalho.Height := 65;
      BitBtn13.Enabled := True;
      BitBtn4.Enabled := True;
  end
  else
  begin
  	  gbConferencia.Visible := False;
      lbNumDoc.Visible := True;
    	dbedtNumDoc.Visible := True;
      lbDataDoc.Visible := True;
      dbedtDataDoc.Visible := True;
    	lbCodCliente.Visible := True;
      dbedtCodCliente.Visible := True;
      dbedtNomeCliente.Visible := True;
      gbCabecalho.Height := 97;
      BitBtn13.Enabled := False;
      BitBtn4.Enabled := False;                 
  end;
end;

procedure TfrmCadConferenciaCega.pnEntradaEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtnApartirPedido.CanFocus) then
    BitBtnApartirPedido.SetFocus;
end;

procedure TfrmCadConferenciaCega.RemoverstatusconferindoClick(Sender: TObject);
begin
  inherited;
  vCadConferenciaCega.removerStatusConferindo;
end;

procedure TfrmCadConferenciaCega.rgEntradaClick(Sender: TObject);
begin
  if rgEntrada.ItemIndex = 3 then
  begin
    lbEntrada.Visible := False;
    edtCargaPedido.Visible := False;
  end
  else
  begin
    lbEntrada.Visible := True;
    edtCargaPedido.Visible := True;
  end;
	lbEntrada.Caption := 'Numero ' + rgEntrada.Items.Strings[rgEntrada.ItemIndex];
end;

procedure TfrmCadConferenciaCega.sbLastClick(Sender: TObject);
begin
	with vCadConferenciaCega.vItensConfCega do
  begin
		if dataSet <> nil then
      dataSet.Last;
  end;
end;

procedure TfrmCadConferenciaCega.sbFirstClick(Sender: TObject);
begin
	with vCadConferenciaCega.vItensConfCega do
  begin
		if dataSet <> nil then
      dataSet.First;
  end;
end;

procedure TfrmCadConferenciaCega.sbFirstItensNFClick(Sender: TObject);
begin
	with vCadConferenciaCega.vItensNF do
  begin
		if dataSet <> nil then
      dataSet.First;
  end;
end;

procedure TfrmCadConferenciaCega.sbPreviousClick(Sender: TObject);
begin
	with vCadConferenciaCega.vItensConfCega do
  begin
		if dataSet <> nil then
      dataSet.Prior;
  end;
end;

procedure TfrmCadConferenciaCega.sbSelAllClick(Sender: TObject);
begin
	vCadConferenciaCega.selTodasCargaVenda;
end;

procedure TfrmCadConferenciaCega.sbDesSelAllClick(Sender: TObject);
begin
	vCadConferenciaCega.desSelTodasCargaVenda;
end;

procedure TfrmCadConferenciaCega.sbConfirmaItemClick(Sender: TObject);
begin
  if vCadConferenciaCega.contagemAtualFechada(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) = True then
  begin
  	Application.MessageBox(pchar('Contagem atual Fechada!!'), 'Informação', MB_ICONINFORMATION + MB_OK);
    desabilitaBotoes;
    vCadConferenciaCega.abreForm('Confirmar Contagem', pnConfirma, tsPanels);
    Exit;
  end;
  
	if not validaValor(edtQuantContada.Text) then
  begin
  	Application.MessageBox(pchar('Digite um valor válido!'), 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

	if vCadConferenciaCega.vItensConfCega.contarItem(vDadosIni.StrToFloatFormat(StrToFloat(edtQuantContada.Text), 4)) then
  begin
    vCadConferenciaCega.vItensConfCega.dataSet.Next;
    edtQuantContada.Clear;
  end;
  
  if vCadConferenciaCega.vItensConfCega.dataSet.Eof then
  begin
  	if Application.MessageBox('Você chegou ao ultimo item, deseja salvar a sua contagem?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes then
    	vCadConferenciaCega.vItensConfCega.contarItem(0, True);
  end;
end;

procedure TfrmCadConferenciaCega.sbPriorItensNFClick(Sender: TObject);
begin
	with vCadConferenciaCega.vItensNF do
  begin
		if dataSet <> nil then
      dataSet.Prior;
  end;
end;

procedure TfrmCadConferenciaCega.sbNextItensNFClick(Sender: TObject);
begin
	with vCadConferenciaCega.vItensNF do
  begin
		if dataSet <> nil then
      dataSet.Next;
  end;
end;

procedure TfrmCadConferenciaCega.sbLastItensNFClick(Sender: TObject);
begin
	with vCadConferenciaCega.vItensNF do
  begin
		if dataSet <> nil then
      dataSet.Last;
  end;
end;

procedure TfrmCadConferenciaCega.SpeedButton1Click(Sender: TObject);
begin
  if not vCadConferenciaCega.abreConfCega(0, 'RM003') then
  	Exit;
  inherited;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tsCadastro;
  ocultaCampos('');
  mudaNomeCampos(vCadConferenciaCega.dataSet.FieldByName('TIPO_CONFERENCIA').AsString);        
  vCadConferenciaCega.vItensConfCega.configuraTags('');
  mostraColunas;
end;

procedure TfrmCadConferenciaCega.SpeedButton25Click(Sender: TObject);
var
	vNomeUsuario: string;
begin
	try
  	Screen.Cursor := crHourGlass;

    if not vCadConferenciaCega.jaPossuiItens then
    	raise Exception.Create('Conferência cega não possui itens!');

    if vCadConferenciaCega.conferenciaFechada(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) then
    begin
  		Application.MessageBox(pchar('Conferência Cega Fechada!'), 'Informação', MB_ICONINFORMATION + MB_OK);
      Exit;
    end;

		if not vCadConferenciaCega.abreConfCega(0, 'RM009') then
    	Exit;    

    if vCadConferenciaCega.vItensConfCega.emConferencia(vNomeUsuario) then
    begin
    	Application.MessageBox(PChar('Conferência já está sendo contada pelo Colaborador: ' + vNomeUsuario), 'Informação', MB_ICONINFORMATION + MB_OK);
			Exit;      
    end;
      
    vCadConferenciaCega.vItensConfCega.configuraTags('Conferente');
    mostraColunas;
		ocultaCampos('Conferente');
    mudaNomeCampos(vCadConferenciaCega.dataSet.FieldByName('TIPO_CONFERENCIA').AsString);
 		PageControl1.ActivePage := TabSheet1;
		PageControl3.ActivePage := tsCadastro;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.SpeedButton2Click(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    vCadConferenciaCega.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  rgTipo.ItemIndex := 0;
	vCadConferenciaCega.abreForm('Relatórios', pnImpressao, tsPanels);
end;

procedure TfrmCadConferenciaCega.SpeedButton5Click(Sender: TObject);
begin
	if Application.MessageBox(pchar('Deseja realmente fechar esta Conferência Cega?'), 'Informação', MB_ICONINFORMATION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
		vCadConferenciaCega.fecharConferenciaCega(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger);
end;

procedure TfrmCadConferenciaCega.SpeedButton6Click(Sender: TObject);
begin
	if vCadConferenciaCega.conferenciaFechada(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger) then
  begin
		if Application.MessageBox(pchar('Deseja realmente reabrir esta Conferência Cega?'), 'Informação', MB_ICONINFORMATION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
			vCadConferenciaCega.reabrirConferenciaCega(vCadConferenciaCega.dataSet.FieldByName('COD_CONFERENCIA').AsInteger);
  end
  else
  	Application.MessageBox(pchar('Conferência Cega não está fechada!'), 'Informação', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmCadConferenciaCega.SpeedButton8Click(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
  	vCadConferenciaCega.abreFormLoteNF(vCadConferenciaCega.dataSet.FieldByName('NUM_DOC').AsInteger);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConferenciaCega.sbNextClick(Sender: TObject);
begin
	with vCadConferenciaCega.vItensConfCega do
  begin
		if dataSet <> nil then
      dataSet.Next;
  end;
end;

function TfrmCadConferenciaCega.validaValor(pTexto: string): boolean;
begin
	try
  	Result := True;
    StrToFloat(edtQuantContada.Text);
  except on E: Exception do
  	Result := False;
  end;
end;

end.
