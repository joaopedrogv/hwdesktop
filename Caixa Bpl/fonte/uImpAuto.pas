unit uImpAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, Buttons, DBCtrls, Grids, DBGrids, StdCtrls, Mask,
  ExtCtrls, uClassesImportacaoFinanceiro, uEditHw, QuickRpt, grimgctrl, QRCtrls;

type
  TfrmImpAuto = class(TfrmPadrao)
    Panel1: TPanel;
    pgcImpAuto: TPageControl;
    tsProcessamento: TTabSheet;
    tsBoletoSomatorio: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label15: TLabel;
    edDataIni: TMaskEdit;
    edDataFim: TMaskEdit;
    btOK: TBitBtn;
    btSair: TBitBtn;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    SpeedButton3: TSpeedButton;
    Panel7: TPanel;
    Panel8: TPanel;
    DBGrid3: TDBGrid;
    Panel9: TPanel;
    Panel10: TPanel;
    Label7: TLabel;
    lbTotalVendasPrest: TLabel;
    Panel11: TPanel;
    Label5: TLabel;
    lbTotalCreditos: TLabel;
    Label9: TLabel;
    lbTotalLancamentosAvulso: TLabel;
    Label11: TLabel;
    lbTotalDiferenca: TLabel;
    edOperador: TEditHw;
    pnDtBaixa: TPanel;
    BitBtn1: TBitBtn;
    Panel13: TPanel;
    edDtBaixa: TMaskEdit;
    Label6: TLabel;
    lbTotalRecibosUsados: TLabel;
    lbDif2: TLabel;
    dbCheck: TDBCheckBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    TabSheet1: TTabSheet;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    pnOpcoesImportacao: TPanel;
    Panel15: TPanel;
    BitBtn3: TBitBtn;
    Panel14: TPanel;
    ckAgruparDinheiro: TCheckBox;
    ckAguparBxAuto: TCheckBox;
    BitBtn4: TBitBtn;
    Label10: TLabel;
    edCodigoUnificada: TEditHw;
    Panel16: TPanel;
    imgInformation: TImage;
    Label4: TLabel;
    Label12: TLabel;
    lbTotalJuros: TLabel;
    Label14: TLabel;
    lbTotalLiquido: TLabel;
    Panel17: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label13: TLabel;
    Label17: TLabel;
    lbTotalLiquido2: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    lbTotalTaxaInterPagEC: TLabel;
    rbRadioGroupRecFinanc: TRadioGroup;
    pnButtonSomaFormas: TPanel;
    Panel18: TPanel;
    pnProcessarFormas: TPanel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    btProcessarSelecionados: TSpeedButton;
    progCreditos: TProgressBar;
    pnProcessarPrest: TPanel;
    Label16: TLabel;
    lbTotalPrestacoes: TLabel;
    btProcessarPrestacoes: TSpeedButton;
    progPrestacoes: TProgressBar;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure rbRadioGroupRecFinancClick(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn4Click(Sender: TObject);
    procedure pnOpcoesImportacaoEnter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSelectAllClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btProcessarPrestacoesClick(Sender: TObject);
    procedure btProcessarSelecionadosClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
    fComDifenca: Extended;
  public
    { Public declarations }
  end;

var
  frmImpAuto: TfrmImpAuto;
  impAuto: TImportacaoAutomacao;

implementation

uses
  uDtmAtivo, uDataSet_OOP, DB, uDtmImportPDVFinan, uDadosIni;

{$R *.dfm}

procedure TfrmImpAuto.BitBtn1Click(Sender: TObject);
begin
  inherited;
  TForm(pnDtBaixa.Parent).ModalResult := IDOK;
end;

procedure TfrmImpAuto.BitBtn2Click(Sender: TObject);
var
  vRetorno: TRetorno;
begin
  inherited;
  VRetorno._AbreFormRetorno;
end;

procedure TfrmImpAuto.BitBtn3Click(Sender: TObject);
begin
  inherited;

  _GravaConfiguracoesBoolean(ckAgruparDinheiro.Name, not ckAgruparDinheiro.Checked);
  _GravaConfiguracoesBoolean(ckAguparBxAuto.Name, ckAguparBxAuto.Checked);

  impAuto.AgruparValoresEmDinheiro := ckAgruparDinheiro.Checked;
  impAuto.AgruparValoresBaixaAutomatica := ckAguparBxAuto.Checked;

  TForm(pnOpcoesImportacao.Parent).ModalResult := IDOK;
end;

procedure TfrmImpAuto.BitBtn4Click(Sender: TObject);
begin
  inherited;

  _GravaConfiguracoesBoolean(ckAgruparDinheiro.Name, not ckAgruparDinheiro.Checked);
  _GravaConfiguracoesBoolean(ckAguparBxAuto.Name, ckAguparBxAuto.Checked);

  TForm(pnOpcoesImportacao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmImpAuto.btOKClick(Sender: TObject);
var
  I: Integer;
begin
	try
  	Screen.Cursor := crHourGlass;
    inherited;
    if not vDadosIni.PesqPros('IMPFIN014', 'CONSULTA', '', 'FORMPAGAMENTO', '', impAuto.buscas, False) then
      Exit;

    if (edDataIni.Text = '  /  /    ') or (edDataFim.Text = '  /  /    ') then
    begin
      Application.MessageBox('Período informado inválido', 'Atenção', 0 +64 );
      if (edDataIni.Text = '  /  /    ') then
      begin
      	if (Self.Enabled) and (Self.Visible) and (edDataIni.CanFocus) then
        	edDataIni.SetFocus;
      end
      else if (edDataFim.Text = '  /  /    ') then
      begin
      	if (Self.Enabled) and (Self.Visible) and (edDataFim.CanFocus) then
        	edDataFim.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (edDataIni.CanFocus) then
        edDataIni.SetFocus;
      Exit;
    end;

    if vDadosIni.vEmp.vFinanceiroUnificado then
      if not vDadosIni.empresaEstaUnificada(edCodigoUnificada.AsInteger) then
      begin
        pgcImpAuto.ActivePage := tsProcessamento;
        if (Self.Enabled) and (Self.Visible) and (edCodigoUnificada.CanFocus) then
          edCodigoUnificada.SetFocus;
        Application.MessageBox(PChar('Favor informar uma empresa Unificada válida, empresa Unificadas válidas: '+ vDadosIni.vEmp.vCodigoUnificadas), 'Atenção', 0 +64 );
        Exit;
      end;

    impAuto.DataInicial := edDataIni.Text;
    impAuto.DataFinal := edDataFim.Text;
    impAuto.CodigoOperadorCxl := 0;
    impAuto.CodigoUsuario := 0;
    impAuto.TipoDoc := rbRadioGroupRecFinanc.ItemIndex;

    if vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      impAuto.CodigoUnificada := edCodigoUnificada.AsInteger;
      Caption := 'Processamento de pagamentos para o Financeiro - Unificada: ' + vDadosIni.StrZero(edCodigoUnificada.AsInteger, 3);
    end;

    impAuto.ModoFaturamento := impAuto.retornaModFaturamentoMatrizFiliais;
    impAuto.ReceberPeloFinanceiroReqOs := impAuto.retornaReceberReqOsMatrizFiliais;
    impAuto.ReceberPeloFinanceiroComfat := impAuto.retornaReceberComfatMatrizFiliais;
    impAuto.ReceberPeloFinanceiroRecibo := impAuto.retornaReceberRecibosMatrizFiliais;

    if impAuto.ModoFaturamento = 'S' then
      impAuto.CodigoOperadorCxl := edOperador.AsInteger
    else
      impAuto.CodigoUsuario := edOperador.AsInteger;

    impAuto._abreFormaPagamento;

    for I := 0 to DBGrid1.FieldCount - 1 do
    begin
      if not vDadosIni.vRecibo.HabRecPorDepart then
      begin
        if (DBGrid1.Columns[I].FieldName = 'NUM_REC_DEP') OR (DBGrid1.Columns[I].FieldName = 'NUM_REC_PARC') then
          DBGrid1.Columns[I].Visible := false;
      end
      else
      begin
        if (DBGrid1.Columns[I].FieldName = 'NREQUISICAO') OR (DBGrid1.Columns[I].FieldName = 'NDOC') then
          DBGrid1.Columns[I].Visible := false;
      end;
    end;

    impAuto.vSomaFp.dataSet.Close;

    btProcessarSelecionados.Enabled := not impAuto.vFp.dataSet.IsEmpty;

    impAuto._abrePrestacoesRecebidas;

    btProcessarPrestacoes.Enabled := not impAuto.vPrest.dataSet.IsEmpty;

    lbTotalPrestacoes.Caption := Format('%n', [impAuto.ValorTotalPrestacoes]);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmImpAuto.btProcessarPrestacoesClick(Sender: TObject);
begin
  inherited;
  try
    progPrestacoes.Visible := True;
    pgcImpAuto.Enabled := False;
    Screen.Cursor := crHourGlass;

    if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', impAuto.buscas) then
      Exit;

    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'I', impAuto.buscas) then
      Exit;

    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', impAuto.buscas) then
      Exit;

    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'I', impAuto.buscas) then
      Exit;

    if not btProcessarPrestacoes.Enabled then
      Exit;

    if not vDadosIni.testarContasLigacao(impAuto.buscas, 'IMP_AUT') then
      Exit;

    if not vDadosIni.PesqPros('IMPFIN019', 'CONSULTA', 'PERIODO '+edDataIni.Text+' A '+edDataFim.Text+' OP: '+edOperador.AsString, 'FORMPAGAMENTO', '', impAuto.buscas, True) then
      Exit;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(impAuto.buscas) then
    	Exit;

    // Financeiro sendo importado
    if vDadosIni.financeiroImportando(impAuto.buscas) then
    	Exit;

//    if (impAuto.ValorTotalDiferenca + impAuto.ValorBaixaRecibos) <> 0 then
//    if fComDifenca <> 0 then
    if vDadosIni.StrToFloatFormat(impAuto.ValorTotalDiferenca, 2) <> 0 then
    begin
      Application.MessageBox('Houve diferenças entre vendas/recebimentos', 'Atenção', 0 +64 );
      if not vDadosIni.PesqPros('IMPFIN025', 'PROCESSAR', 'PERIODO '+edDataIni.Text+' A '+edDataFim.Text+' OP: '+edOperador.AsString, 'FORMPAGAMENTO', '', impAuto.buscas, True) then
      begin
       pgcImpAuto.ActivePage := tsBoletoSomatorio;
       Exit;
      end;
    end;

    impAuto.vProgresso := TProgressBar(progPrestacoes);

    impAuto._processarPrestacoes;

    impAuto._abrePrestacoesRecebidas;

    btProcessarPrestacoes.Enabled := not impAuto.vPrest.dataSet.IsEmpty;

  finally
    progPrestacoes.Visible := False;
    vDadosIni.fechaStatusProcessamento;
    pgcImpAuto.Enabled := True;
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmImpAuto.btProcessarSelecionadosClick(Sender: TObject);
begin
  inherited;
  try
  	pgcImpAuto.Enabled := False;
    Screen.Cursor := crHourGlass;
    progCreditos.Visible := True;
    
    if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', impAuto.buscas) then
      Exit;

    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'I', impAuto.buscas) then
      Exit;

    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'I', impAuto.buscas) then
      Exit;

    if not btProcessarSelecionados.Enabled then
      Exit;

    if not vDadosIni.testarContasLigacao(impAuto.buscas, 'IMP_AUT') then
      Exit;

    if not vDadosIni.PesqPros('IMPFIN018', 'PROCESSAR', 'PERIODO '+edDataIni.Text+' A '+edDataFim.Text+' OP: '+edOperador.AsString, 'FORMPAGAMENTO', '', impAuto.buscas, True) then
      Exit;

    impAuto.vProgresso := TProgressBar(progCreditos);

    if not impAuto.vSomaFp.dataSet.Active then
    begin
      Application.MessageBox('Favor Conferir Boleto de Somatório', 'Atenção', 0 +64 );
      pgcImpAuto.ActivePage := tsBoletoSomatorio;
      Exit;
    end;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(impAuto.buscas) then
    	Exit;

    // Financeiro sendo importado
    if vDadosIni.financeiroImportando(impAuto.buscas) then
    	Exit;

//    if (impAuto.ValorTotalDiferenca + impAuto.ValorBaixaRecibos) <> 0 then
//    if fComDifenca <> 0 then
    if vDadosIni.StrToFloatFormat(impAuto.ValorTotalDiferenca, 2) <> 0 then
    begin
      Application.MessageBox('Houve diferenças entre vendas/recebimentos', 'Atenção', 0 +64 );
      if not vDadosIni.PesqPros('IMPFIN024', 'PROCESSAR', 'PERIODO '+edDataIni.Text+' A '+edDataFim.Text+' OP: '+edOperador.AsString, 'FORMPAGAMENTO', '', impAuto.buscas, True) then
      begin
       pgcImpAuto.ActivePage := tsBoletoSomatorio;
       Exit;
      end;
    end;

    if vDadosIni.vEmp.vFinanceiroUnificado then
      if StrToInt(vDadosIni.codEmpresa) <> vDadosIni.vEmp.vCodigoUnificadora then
      begin
        Application.MessageBox(PChar('Financeiro Unificado está ativado!!!' + #13 +
          'O processamento dos documentos não é de responsabilidade desta empresa'), 'Atenção', 0 +64 );
        Exit;
      end;

    vDadosIni.abreStatusProcessamento('', 'Iniciando Processamento de Créditos');

    if impAuto._processarCreditosSelecionados then
      btOK.Click;

  finally
    progCreditos.Visible := False;
    vDadosIni.fechaStatusProcessamento;
    pgcImpAuto.Enabled := True;
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmImpAuto.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('IMPFIN017', 'CONSULTA', '', 'FORMPAGAMENTO', '', impAuto.buscas, False) then
    DBGrid1.DataSource.DataSet.Cancel;
  DBEdit1.Enabled := False;
end;

procedure TfrmImpAuto.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = dbCheck.DataField then
    dbCheck.Visible := False
end;

procedure TfrmImpAuto.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  impAuto._selecionarItem;
  impAuto.vFp.dataSet.Edit;
  DBEdit1.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	DBEdit1.SetFocus;
end;

procedure TfrmImpAuto.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  inherited;
   if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = dbCheck.DataField) then
    begin
     dbCheck.Left := Rect.Left + DBGrid1.Left + 5;
     dbCheck.Top := Rect.Top + DBGrid1.top + 2;
     dbCheck.Width := Rect.Right - Rect.Left;
     dbCheck.Height := Rect.Bottom - Rect.Top;

     dbCheck.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = dbCheck.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);
      DrawState := ISChecked[(Column.Field.value = 'S')];

      DBGrid1.Canvas.FillRect(Rect);
      DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TfrmImpAuto.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    impAuto._selecionarItem;
end;

procedure TfrmImpAuto.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if Trim(Column.Field.Dataset.FieldbyName('nao_gera_finan').AsString) = 'S' then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);

//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
//      TDBGrid(sender).canvas.brush.color := clHighlight;
//      TDBGrid(sender).canvas.Font.color := clWhite;
//    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmImpAuto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  impAuto.Free;
  impAuto := nil;

  Action := caFree;
  frmImpAuto := nil;
end;

procedure TfrmImpAuto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	Self.fechar := True;
  inherited;
end;

procedure TfrmImpAuto.FormCreate(Sender: TObject);
begin
  inherited;

  impAuto := TImportacaoAutomacao.create;

  AutoSize := true;

  Position := poScreenCenter;
end;

procedure TfrmImpAuto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    if pgcImpAuto.Enabled then
      btSelectAll.Click;
  end
  else 
  if Key = VK_F3 then
  begin
    if pgcImpAuto.Enabled then
      btUnSelectAll.Click;
  end;
end;

procedure TfrmImpAuto.FormShow(Sender: TObject);
begin
  inherited;
  pgcImpAuto.ActivePage := tsProcessamento;
  edDataIni.Text := DateToStr(Date);
  edDataFim.Text := DateToStr(Date);
  if (Self.Enabled) and (Self.Visible) and (edDataIni.CanFocus) then
    edDataIni.SetFocus;

  if vDadosIni.vEmp.vModoFaturamento = 'S' then
    Label15.Caption := 'Operador'
  else
    Label15.Caption := 'Vendedor';

  edOperador.Enabled := True;
  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('IMPFIN023', 'RELATORIO', '', 'FORMPAGAMENTO', '', impAuto.buscas, False) then
  begin
    edOperador.Enabled := False;
    if vDadosIni.vEmp.vModoFaturamento = 'S' then
      edOperador.AsValue := vDadosIni.vCodOpCxl
    else
      edOperador.AsValue := vDadosIni.vCodUsuario;
  end;
  edCodigoUnificada.AsValue := StrToInt(vDadosIni.codEmpresa);
  edCodigoUnificada.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  Label10.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  vDadosIni.verificarCTP_Pendentes_Unificacao(impAuto.buscas);

  impAuto.TipoDoc := rbRadioGroupRecFinanc.ItemIndex;

	if not ((vDadosIni.vEmp.vModoFaturamento = 'S')
  	and ((vDadosIni.vPedVnd.ReceberPeloFinanceiro)
    	or (vDadosIni.vVeic.ReceberPeloFinanceiro)
      or (vDadosIni.vRecibo.ReceberPeloFinanceiro))) then
    Panel2.Height := 34;

  rbRadioGroupRecFinanc.Visible := (vDadosIni.vEmp.vModoFaturamento = 'S')
  	and ((vDadosIni.vPedVnd.ReceberPeloFinanceiro)
    	or (vDadosIni.vVeic.ReceberPeloFinanceiro)
      or (vDadosIni.vRecibo.ReceberPeloFinanceiro));

  vDadosIni.verificarImpFaturaVindi;

  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
     'Processo "IMPFIN023" HABILITAR CAMPO OPERADOR/VENDEDOR PROCESSAMENTO DO FINANCEIRO' + #13 +
     'Processo "IMPFIN024" PERMITIR PROCESSAR RECEBIMENTOS VENDAS COM DIFERENÇA' + #13 +
     'Processo "IMPFIN025" PERMITIR PROCESSAR RECEBIMENTOS PRESTACOES COM DIFERENÇA' + #13 +
     'Processo "IMPFIN026" CONFIRMAR RECEBIMENTOS COM VALOR DIFERENTE' + #13 +
     'Processo "IMPFIN031" HABILITAR TESTE DE VENDAS SEM RECEBIMENTO' + #13 +
     'Processo "IMPFIN032" PROCESSAR VENDAS SEM RECEBIMENTO' + #13 +
     'Processo "IMPFIN033" PERMITIR PROCESSAR RECEBIMENTO VENDAS DIA CXL DIFERENTE DO FINANCEIRO' + #13 +
     'Processo "IMPFIN034" PERMITIR PROCESSAR RECEBIMENTO PRESTACAO DIA CXL DIFERENTE DO FINANCEIRO';
end;

procedure TfrmImpAuto.pnOpcoesImportacaoEnter(Sender: TObject);
begin
  inherited;
  ckAgruparDinheiro.Checked := not _LerConfiguracoesRegistroBoolean(ckAgruparDinheiro.Name);
  ckAguparBxAuto.Checked := _LerConfiguracoesRegistroBoolean(ckAguparBxAuto.Name);
end;

procedure TfrmImpAuto.rbRadioGroupRecFinancClick(Sender: TObject);
begin
  inherited;
  if (not vDadosIni.vPedVnd.ReceberPeloFinanceiro)
  	and (not vDadosIni.vVeic.ReceberPeloFinanceiro)
    and (not vDadosIni.vRecibo.ReceberPeloFinanceiro) then
  	exit;

//  if rbRadioGroupRecFinanc.ItemIndex = 1 then
//  begin
//    edOperador.AsValue := 0;
//    edOperador.Enabled := false;
//    btProcessarPrestacoes.Enabled := false;
//  end
//  else
//  begin
//  	edOperador.Enabled := true;
//    btProcessarPrestacoes.Enabled := not impAuto.vPrest.dataSet.IsEmpty;
//  end;

  if (impAuto.TipoDoc <> rbRadioGroupRecFinanc.ItemIndex) then
  begin
    if (not impAuto.vFp.dataSet.IsEmpty) or (not impAuto.vPrest.dataSet.IsEmpty) then
    begin
      if (not impAuto.vFp.dataSet.IsEmpty) then
      	impAuto.vFp.dataSet.EmptyDataSet;
      if (not impAuto.vPrest.dataSet.IsEmpty) then
         impAuto.vPrest.dataSet.EmptyDataSet;
      if not impAuto.vSomaFp.dataSet.IsEmpty then
	      impAuto.vSomaFp.dataSet.EmptyDataSet;

      lbTotalVendasPrest.Caption := Format('%n', [0.00]);

      lbTotalCreditos.Caption := Format('%n', [0.00]);

      lbTotalLiquido.Caption := Format('%n', [0.00]);

      lbTotalLiquido2.Caption := Format('%n', [0.00]);

      lbTotalLancamentosAvulso.Caption := Format('%n', [0.00]);

      lbTotalJuros.Caption := Format('%n', [0.00]);

    //  lbTotalDesconto.Caption := Format('%n', [0 - Abs(impAuto.ValorTotalDesconto)]);

      lbTotalDiferenca.Caption := Format('%n', [0.00]);

      lbTotalRecibosUsados.Caption := Format('%n', [0.00]);

      lbTotalTaxaInterPagEC.Caption := Format('%n', [0.00]);

      fComDifenca := 0.00;

      lbDif2.Caption := Format('%n', [fComDifenca]);

      btProcessarSelecionados.Enabled := False;
		  btProcessarPrestacoes.Enabled := False;
      Application.MessageBox(PChar('Tipo de documento alterado, favor realizar a consulta novamente'), 'Atenção', 0 +64 );
    end;
  end;

  impAuto.TipoDoc := rbRadioGroupRecFinanc.ItemIndex;
end;

procedure TfrmImpAuto.btSelectAllClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('IMPFIN015', 'CONSULTA', '', 'FORMPAGAMENTO', '', impAuto.buscas, False) then
    Exit;
  impAuto._selecionarTodos;
end;

procedure TfrmImpAuto.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('IMPFIN016', 'CONSULTA', '', 'FORMPAGAMENTO', '', impAuto.buscas, False) then
    Exit;
  impAuto._desfazerSelecaoTodos;
end;

procedure TfrmImpAuto.SpeedButton3Click(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    inherited;

    if not vDadosIni.PesqPros('IMPFIN020', 'CONSULTA', '', 'FORMPAGAMENTO', '', impAuto.buscas, False) then
      Exit;

    if (edDataIni.Text = '  /  /    ') or (edDataFim.Text = '  /  /    ') then
    begin
      Application.MessageBox('Período informado inválido', 'Atenção', 0 +64 );
      Exit;
    end;

    if vDadosIni.vEmp.vFinanceiroUnificado then
      if not vDadosIni.empresaEstaUnificada(edCodigoUnificada.AsInteger) then
      begin
        pgcImpAuto.ActivePage := tsProcessamento;
        if (Self.Enabled) and (Self.Visible) and (edCodigoUnificada.CanFocus) then
          edCodigoUnificada.SetFocus;
        Application.MessageBox(PChar('Favor informar uma empresa Unificada válida, empresa Unificadas válidas: '+ vDadosIni.vEmp.vCodigoUnificadas), 'Atenção', 0 +64 );
        Exit;
      end;

    impAuto.DataInicial := edDataIni.Text;
    impAuto.DataFinal := edDataFim.Text;
    impAuto.CodigoOperadorCxl := 0;
    impAuto.CodigoUsuario := 0;
    impAuto.TipoDoc := rbRadioGroupRecFinanc.ItemIndex;

    if vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      impAuto.CodigoUnificada := edCodigoUnificada.AsInteger;
      Caption := 'Processamento de pagamentos para o Financeiro - Unificada: ' + vDadosIni.StrZero(edCodigoUnificada.AsInteger, 3);
    end;

    impAuto.ModoFaturamento := impAuto.retornaModFaturamentoMatrizFiliais;
    impAuto.ReceberPeloFinanceiroReqOs := impAuto.retornaReceberReqOsMatrizFiliais;
    impAuto.ReceberPeloFinanceiroComfat := impAuto.retornaReceberComfatMatrizFiliais;
    impAuto.ReceberPeloFinanceiroRecibo := impAuto.retornaReceberRecibosMatrizFiliais;

    if impAuto.ModoFaturamento = 'S' then
      impAuto.CodigoOperadorCxl := edOperador.AsInteger
    else
      impAuto.CodigoUsuario := edOperador.AsInteger;

    impAuto._efetuarSomaConferencia;

    lbTotalVendasPrest.Caption := Format('%n', [impAuto.ValorTotalVendasPrest]);

    lbTotalCreditos.Caption := Format('%n', [impAuto.ValorTotalCreditos]);

    lbTotalLiquido.Caption := Format('%n', [impAuto.ValorTotalLiquido]);

    lbTotalLiquido2.Caption := Format('%n', [- impAuto.ValorTotalLiquido]);

    lbTotalLancamentosAvulso.Caption := Format('%n', [impAuto.ValorTotalLancamentosAvulso]);

    lbTotalJuros.Caption := Format('%n', [impAuto.ValorTotalJuros]);

  //  lbTotalDesconto.Caption := Format('%n', [0 - Abs(impAuto.ValorTotalDesconto)]);

    lbTotalDiferenca.Caption := Format('%n', [impAuto.ValorTotalDiferenca]);

    lbTotalRecibosUsados.Caption := Format('%n', [0- Abs(impAuto.ValorBaixaRecibos)]);

    lbTotalTaxaInterPagEC.Caption := Format('%n', [0- Abs(impAuto.ValorTaxaInterPagEC)]);

    if impAuto.ValorTotalDiferenca < 0 then
      fComDifenca := impAuto.ValorTotalDiferenca + impAuto.ValorBaixaRecibos + impAuto.ValorTaxaInterPagEC
    else
      fComDifenca := impAuto.ValorTotalDiferenca - impAuto.ValorBaixaRecibos - impAuto.ValorTaxaInterPagEC;

    lbDif2.Caption := Format('%n', [fComDifenca]);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmImpAuto.SpeedButton4Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('IMPFIN021', 'RELATORIO', '', 'FORMPAGAMENTO', '', impAuto.buscas, False) then
    Exit;
    
  if (edDataIni.Text = '  /  /    ') or (edDataFim.Text = '  /  /    ') then
  begin
    Application.MessageBox('Período informado inválido', 'Atenção', 0 +64 );
    Exit;
  end;

  if vDadosIni.vEmp.vFinanceiroUnificado then
    if not vDadosIni.empresaEstaUnificada(edCodigoUnificada.AsInteger) then
    begin
      pgcImpAuto.ActivePage := tsProcessamento;
      if (Self.Enabled) and (Self.Visible) and (edCodigoUnificada.CanFocus) then
        edCodigoUnificada.SetFocus;
      Application.MessageBox(PChar('Favor informar uma empresa Unificada válida, empresa Unificadas válidas: '+ vDadosIni.vEmp.vCodigoUnificadas), 'Atenção', 0 +64 );
      Exit;
    end;

  impAuto.DataInicial := edDataIni.Text;
  impAuto.DataFinal := edDataFim.Text;
  impAuto.CodigoOperadorCxl := 0;
  impAuto.CodigoUsuario := 0;
  impAuto.TipoDoc := rbRadioGroupRecFinanc.ItemIndex;

  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    impAuto.CodigoUnificada := edCodigoUnificada.AsInteger;
    Caption := 'Processamento de pagamentos para o Financeiro - Unificada: ' + vDadosIni.StrZero(edCodigoUnificada.AsInteger, 3);
  end;

  impAuto.ModoFaturamento := impAuto.retornaModFaturamentoMatrizFiliais;
  impAuto.ReceberPeloFinanceiroReqOs := impAuto.retornaReceberReqOsMatrizFiliais;
  impAuto.ReceberPeloFinanceiroComfat := impAuto.retornaReceberComfatMatrizFiliais;
  impAuto.ReceberPeloFinanceiroRecibo := impAuto.retornaReceberRecibosMatrizFiliais;

  if impAuto.ModoFaturamento = 'S' then
    impAuto.CodigoOperadorCxl := edOperador.AsInteger
  else
    impAuto.CodigoUsuario := edOperador.AsInteger;

  impAuto.RelTipo := 'R';

  impAuto._relatorioVendedor;

  btProcessarSelecionados.Enabled := False;
  btProcessarPrestacoes.Enabled := False;
end;

procedure TfrmImpAuto.SpeedButton5Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('IMPFIN022', 'RELATORIO', '', 'FORMPAGAMENTO', '', impAuto.buscas, False) then
    Exit;

  if (edDataIni.Text = '  /  /    ') or (edDataFim.Text = '  /  /    ') then
  begin
    Application.MessageBox('Período informado inválido', 'Atenção', 0 +64 );
    Exit;
  end;

  if vDadosIni.vEmp.vFinanceiroUnificado then
    if not vDadosIni.empresaEstaUnificada(edCodigoUnificada.AsInteger) then
    begin
      pgcImpAuto.ActivePage := tsProcessamento;
      if (Self.Enabled) and (Self.Visible) and (edCodigoUnificada.CanFocus) then
        edCodigoUnificada.SetFocus;
      Application.MessageBox(PChar('Favor informar uma empresa Unificada válida, empresa Unificadas válidas: '+ vDadosIni.vEmp.vCodigoUnificadas), 'Atenção', 0 +64 );
      Exit;
    end;

  impAuto.DataInicial := edDataIni.Text;
  impAuto.DataFinal := edDataFim.Text;
  impAuto.CodigoOperadorCxl := 0;
  impAuto.CodigoUsuario := 0;
  impAuto.TipoDoc := rbRadioGroupRecFinanc.ItemIndex;

  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    impAuto.CodigoUnificada := edCodigoUnificada.AsInteger;
    Caption := 'Processamento de pagamentos para o Financeiro - Unificada: ' + vDadosIni.StrZero(edCodigoUnificada.AsInteger, 3);
  end;

  impAuto.ModoFaturamento := impAuto.retornaModFaturamentoMatrizFiliais;
  impAuto.ReceberPeloFinanceiroReqOs := impAuto.retornaReceberReqOsMatrizFiliais;
  impAuto.ReceberPeloFinanceiroComfat := impAuto.retornaReceberComfatMatrizFiliais;
  impAuto.ReceberPeloFinanceiroRecibo := impAuto.retornaReceberRecibosMatrizFiliais;

  if impAuto.ModoFaturamento = 'S' then
    impAuto.CodigoOperadorCxl := edOperador.AsInteger
  else
    impAuto.CodigoUsuario := edOperador.AsInteger;

  impAuto.RelTipo := 'D';

  impAuto._relatorioVendedor;

  btProcessarSelecionados.Enabled := False;
  btProcessarPrestacoes.Enabled := False;
end;

end.
