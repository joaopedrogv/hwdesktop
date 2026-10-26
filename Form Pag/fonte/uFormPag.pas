unit uFormPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons,
  Spin, ComCtrls, uEditMoeda, Mask, DBCtrls, Menus;

type
  TfrmFormPag = class(TfrmPadrao)
    Panel1: TPanel;
    grupoControle: TGroupBox;
    gridControle: TDBGrid;
    Panel2: TPanel;
    grupoValor: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    tabDinheiro: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    edDinHist: TEdit;
    tabCheque: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edAgencia: TEdit;
    edConta: TEdit;
    edHistCh: TEdit;
    edNomeTerceiroCh: TEdit;
    tabCreditos: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    label66: TLabel;
    btGerar: TSpeedButton;
    edParcelas: TSpinEdit;
    GroupBox3: TGroupBox;
    cbCondPag: TComboBox;
    edCrNomeTerc: TEdit;
    edCrHistorico: TEdit;
    GroupBox4: TGroupBox;
    ListBox1: TListBox;
    tabRecibos: TTabSheet;
    GroupBox1: TGroupBox;
    gridRecibos: TDBGrid;
    Panel5: TPanel;
    btQuitar: TSpeedButton;
    btSomar: TSpeedButton;
    btValeCredito: TSpeedButton;
    tabInicial: TTabSheet;
    Panel4: TPanel;
    tabLancamentos: TTabSheet;
    gridLancamentos: TDBGrid;
    btApagar: TBitBtn;
    btAlterar: TBitBtn;
    grupoDisti: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    pnBotoes: TPanel;
    btRecibo: TSpeedButton;
    mValorDoc: TEditMoeda;
    mPago: TEditMoeda;
    mRestante: TEditMoeda;
    mTroco: TEditMoeda;
    mDinheiro: TEditMoeda;
    mCheque: TEditMoeda;
    mCredito: TEditMoeda;
    mRecibo: TEditMoeda;
    mValorDin: TEditMoeda;
    edNumeroCh: TEditMoeda;
    mValorCh: TEditMoeda;
    edVencimentoCh: TMaskEdit;
    mValorCr: TEditMoeda;
    edJuros: TEditMoeda;
    Panel3: TPanel;
    edNumBanco: TEditMoeda;
    Label27: TLabel;
    ckNF: TCheckBox;
    edCodTerceiroCh: TEditMoeda;
    edCrCodTer: TEditMoeda;
    DBLookupComboBox1: TDBLookupComboBox;
    edNumRecibo: TEditMoeda;
    CheckBox1: TCheckBox;
    Panel7: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    btSalvar: TBitBtn;
    btCancela: TBitBtn;
    tabDadosRecibos: TTabSheet;
    EditMoeda1: TEditMoeda;
    BitBtn1: TBitBtn;
    procedure btCancelaClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure gridControleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridControleDblClick(Sender: TObject);
    procedure edDinHistKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCrCodTerExit(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure edCodTerceiroChExit(Sender: TObject);
    procedure btReciboClick(Sender: TObject);
    procedure edNumBancoExit(Sender: TObject);
    procedure btValeCreditoClick(Sender: TObject);
    procedure btSomarClick(Sender: TObject);
    procedure btQuitarClick(Sender: TObject);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure btGerarClick(Sender: TObject);
    procedure gridControleKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Exit(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure grupoControleEnter(Sender: TObject);
    procedure grupoControleExit(Sender: TObject);
  private
    { Private declarations }
    alterandoRecebimento, fecha: boolean;
    procedure alteraRecebimento(codigoControle: integer);
  public
    { Public declarations }
  end;

var
  frmFormPag: TfrmFormPag;

implementation

uses uDtmFormPag, uClasseFP, uParcela, uDtmAtivo;

{$R *.dfm}

procedure TfrmFormPag.alteraRecebimento(codigoControle: integer);
begin
  if obFormPag.DataSet.FieldByName('recibo').AsString = 'S' then
  begin
    MessageDlg('Recebimento feito através de Recibo Antecipado. Apage o recebimento e o refaça',
      mtInformation, [mbOK], 0);
    exit;
  end;
  obFormPag.vControle.FindNearest([codigoControle]);
  if trim(obFormPag.DataSet.FieldByName('tipdoc').AsString) = 'N' then
  begin
    mValorDin.Valor := obFormPag.DataSet.FieldByName('valordoc').AsFloat;
    edDinHist.Text := obFormPag.DataSet.FieldByName('historico').AsString;
    alterandoRecebimento := true;
    PageControl1.ActivePage := tabDinheiro;
    mValorDin.SetFocus;
  end
  else if obFormPag.DataSet.FieldByName('tipdoc').AsString = 'S1' then
  begin
    edNumeroCh.Valor := StrToInt(obFormPag.DataSet.FieldByName('ndoc').AsString);
    mValorCh.Valor := obFormPag.DataSet.FieldByName('valorDoc').AsFloat;
    edVencimentoCh.Text := DateToStr(obFormPag.DataSet.FieldByName('data_venc').AsDateTime);
    edNumBanco.Valor := obFormPag.DataSet.FieldByName('cod_banco').AsInteger;
    edCodTerceiroCh.Valor := obFormPag.DataSet.FieldByName('cod_cli_terc').AsInteger;
    edAgencia.Text := obFormPag.DataSet.FieldByName('agencia').AsString;
    edConta.Text := obFormPag.DataSet.FieldByName('conta').AsString;
    edHistCh.Text := obFormPag.DataSet.FieldByName('historico').AsString;
    DBLookupComboBox1.KeyValue := trunc(edNumBanco.Valor);
    edCodTerceiroChExit(Self);
    alterandoRecebimento := true;
    PageControl1.ActivePage := tabCheque;
    mValorCh.SetFocus;
  end
  else if obFormPag.DataSet.FieldByName('tipdoc').AsString = 'S2' then
  begin
    ListBox1.Clear;
    mValorCr.Valor := 0;
    edParcelas.Value := 0;
    cbCondPag.Text := 'NENHUMA';
    Application.CreateForm(TfrmParcela, frmParcela);
    frmParcela.edCrDoc.Text := obFormPag.DataSet.FieldByName('ndoc').AsString;
    frmParcela.edCrVenc.Text := DateToStr(obFormPag.DataSet.FieldByName('data_venc').AsDateTime);
    frmParcela.mValorParcelaCr.Valor := obFormPag.DataSet.FieldByName('valorDoc').AsFloat;
    if frmParcela.ShowModal = mrOk then
    begin
      if obFormPag.receberCredito(trunc(edCrCodTer.Valor), edCrNomeTerc.Text, edCrHistorico.Text,
        frmParcela.edCrVenc.Text, frmParcela.edCrDoc.Text, ckNF.Checked,
        frmParcela.mValorParcelaCr.Valor) then
      begin
        mPago.Valor := obFormPag.getValorPago;
        mRestante.Valor := obFormPag.getValorRestante;
        mTroco.Valor := obFormPag.getValorTroco;
        mCredito.Valor := obFormPag.getTotalCredito;
        alterandoRecebimento := false;
      end;
    end;
  end;
end;

procedure TfrmFormPag.btSalvarClick(Sender: TObject);
begin
  inherited;
  try
  if PageControl1.ActivePage = tabDinheiro then
  begin
    gridControle.SetFocus;
    mValorDin.SetFocus;
    if obFormPag.receberDinheiro(mValorDin.Valor, edDinHist.Text, ckNF.Checked, alterandoRecebimento)
      then
    begin
      mPago.Valor := obFormPag.getValorPago;
      mRestante.Valor := obFormPag.getValorRestante;
      mTroco.Valor := obFormPag.getValorTroco;
      mDinheiro.Valor := obFormPag.getTotalDinheiro;
      PageControl1.ActivePage := tabLancamentos;
      gridControle.SetFocus;
      alterandoRecebimento := false;
    end;
  end
  else if PageControl1.ActivePage = tabCheque then
  begin
    gridControle.SetFocus;
    mValorCh.SetFocus;
    if obFormPag.receberCheque(mValorCh.Valor, StrToDate(edVencimentoCh.Text),
      trunc(edNumeroCh.Valor), trunc(edNumBanco.Valor), trunc(edCodTerceiroCh.Valor),
      edAgencia.Text, edConta.Text, edNomeTerceiroCh.Text, edHistCh.Text, ckNF.Checked,
      alterandoRecebimento) then
    begin
      mPago.Valor := obFormPag.getValorPago;
      mRestante.Valor := obFormPag.getValorRestante;
      mTroco.Valor := obFormPag.getValorTroco;
      mCheque.Valor := obFormPag.getTotalCheque;
      PageControl1.ActivePage := tabLancamentos;
      gridControle.SetFocus;
      alterandoRecebimento := false;
    end;
  end
  else if PageControl1.ActivePage = tabCreditos then
  begin
    gridControle.SetFocus;
    mValorCr.SetFocus;
    if obFormPag.receberCredito(trunc(edCrCodTer.Valor), edCrNomeTerc.Text, edCrHistorico.Text,
      ckNF.Checked) then
    begin
      mPago.Valor := obFormPag.getValorPago;
      mRestante.Valor := obFormPag.getValorRestante;
      mTroco.Valor := obFormPag.getValorTroco;
      mCredito.Valor := obFormPag.getTotalCredito;
      PageControl1.ActivePage := tabLancamentos;
      gridControle.SetFocus;
      alterandoRecebimento := false;
    end;
  end;
  finally
    gridControle.SetFocus;
  end;
end;

procedure TfrmFormPag.btCancelaClick(Sender: TObject);
begin
  inherited;
  if PageControl1.ActivePage = tabRecibos then
  begin
    obFormPag.vRecibo.First;
    while not obFormPag.vRecibo.Eof do
    begin
      obFormPag.vRecibo.desmarcaRecibo;
      obFormPag.vRecibo.Next;
    end;
    PageControl1.ActivePage := tabLancamentos;
  end
  else if PageControl1.ActivePage = tabDinheiro then
  begin
    mValorDin.Valor := 0;
    edDinHist.Text := '';
    PageControl1.ActivePage := tabLancamentos;
  end
  else if PageControl1.ActivePage = tabCheque then
  begin
    mValorCh.Valor := 0;
    edHistCh.Clear;
    edNumeroCh.Valor := 0;
    edVencimentoCh.Clear;
    edNumBanco.Valor := 0;
    DBLookupComboBox1.KeyValue := trunc(edNumBanco.Valor);
    edAgencia.Clear;
    edConta.Clear;
    edCodTerceiroCh.valor := 0;
    edNomeTerceiroCh.Clear;
    PageControl1.ActivePage := tabLancamentos;
  end
  else if PageControl1.ActivePage = tabCreditos then
  begin
    obFormPag.limpaParcelamento;
    mValorCr.Valor := 0;
    edParcelas.Value := 0;
    cbCondPag.Text := '';
    edCrCodTer.Valor := 0;
    edCrNomeTerc.Clear;
    edJuros.Valor := 0;
    edCrHistorico.Clear;
    CheckBox1.Checked := false;
    ListBox1.Clear;
    PageControl1.ActivePage := tabLancamentos;
  end;
  alterandoRecebimento := false;
end;

procedure TfrmFormPag.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if obFormPag.confirmaFormaPagamento then
  begin
    fecha := true;
    ModalResult := mrOk;
  end;
end;

procedure TfrmFormPag.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ModalResult:=mrCancel;
end;

procedure TfrmFormPag.btAlterarClick(Sender: TObject);
begin
  inherited;
  alteraRecebimento(obFormPag.DataSet.FieldByName('cod_controle').AsInteger);
end;

procedure TfrmFormPag.btApagarClick(Sender: TObject);
var
  recibo: string;
begin
  inherited;
  recibo := obFormPag.DataSet.FieldByName('recibo').AsString;
  if obFormPag.apagarFormaPagamento then
  begin
    mPago.Valor := obFormPag.getValorPago;
    mRestante.Valor := obFormPag.getValorRestante;
    mTroco.Valor := obFormPag.getValorTroco;
    mDinheiro.Valor := obFormPag.getTotalDinheiro;
    mCheque.Valor := obFormPag.getTotalCheque;
    mCredito.Valor := obFormPag.getTotalCredito;
    mRecibo.Valor := obFormPag.getTotalRecibo;
    gridControle.SetFocus;
    alterandoRecebimento := false;
    if recibo = 'S' then
      btQuitar.Enabled := true;
  end;
end;

procedure TfrmFormPag.btGerarClick(Sender: TObject);
begin
  inherited;
  if (PageControl1.ActivePage = tabCreditos) and btGerar.Enabled then
  begin
    if obFormPag.montaParcelamento(ListBox1, edParcelas.Value, cbCondPag.Text, mValorCr.Valor,
      edJuros.Valor) then
      edCrCodTer.SetFocus;
  end;
end;

procedure TfrmFormPag.btQuitarClick(Sender: TObject);
begin
  inherited;
  if btQuitar.Enabled then
  begin
    if obFormPag.receberRecibo then
    begin
      mPago.Valor := obFormPag.getValorPago;
      mRestante.Valor := obFormPag.getValorRestante;
      mTroco.Valor := obFormPag.getValorTroco;
      mRecibo.Valor := obFormPag.getTotalRecibo;
      PageControl1.ActivePage := tabLancamentos;
      btQuitar.Enabled := false;
    end;
  end;
end;

procedure TfrmFormPag.btReciboClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tabRecibos;
end;

procedure TfrmFormPag.btSomarClick(Sender: TObject);
begin
  inherited;
  Label27.Caption := Format('%m', [obFormPag.vRecibo.somatorioRecibos]);
end;

procedure TfrmFormPag.btValeCreditoClick(Sender: TObject);
begin
  inherited;
  obFormPag.montarValeCredito;
end;

procedure TfrmFormPag.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox1.KeyValue > 0 then
    edNumBanco.Valor := DBLookupComboBox1.KeyValue;
end;

procedure TfrmFormPag.edCodTerceiroChExit(Sender: TObject);
begin
  inherited;
  if edCodTerceiroCh.Valor <> 0 then
  begin
    if vDadosIni.vSistema = 'Fiscal' then
      obFormPag.setBuscas(dtmFP.qrBuscasHwF);
    edNomeTerceiroCh.Text :=
      obFormPag.retornaValor('select nome_cliente as valor from clientes where cod_cliente = ' +
      IntToStr(trunc(edCodTerceiroCh.Valor)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
    if edNomeTerceiroCh.Text = '' then
    begin
      MessageDlg('Terceiro não encontrado', mtInformation, [mbOK], 0);
      edCodTerceiroCh.Valor := 0;
    end;
  end;
end;

procedure TfrmFormPag.edCrCodTerExit(Sender: TObject);
begin
  inherited;
  if edCrCodTer.Valor <> 0 then
  begin
    if vDadosIni.vSistema = 'Fiscal' then
      obFormPag.setBuscas(dtmFP.qrBuscasHwF);
    edCrNomeTerc.Text :=
      obFormPag.retornaValor('select nome_cliente as valor from clientes where cod_cliente = ' +
      IntToStr(trunc(edCrCodTer.Valor)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
    if edCrNomeTerc.Text = '' then
    begin
      MessageDlg('Terceiro não encontrado', mtInformation, [mbOK], 0);
      edCrCodTer.Valor := 0;
    end;
  end;
end;

procedure TfrmFormPag.edDinHistKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btSalvar.SetFocus;
end;

procedure TfrmFormPag.edNumBancoExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox1.KeyValue := trunc(edNumBanco.Valor);
end;

procedure TfrmFormPag.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (not fecha) and (vDadosIni.vSistema = 'Fiscal') then
    Action := caNone
  else
    Action := caFree;
end;

procedure TfrmFormPag.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  chave: Char;
begin
  chave := #13;
  inherited;
  if key = VK_F2 then
  begin
    gridControle.SetFocus;
  end
  else if key = VK_F3 then
  begin
    btSalvarClick(Sender);
  end
  else if key = VK_F4 then
  begin
    btCancelaClick(Sender);
  end
  else if key = VK_F5 then
  begin
    if btRecibo.Visible then
      btReciboClick(Sender);
  end
  else if key = VK_F6 then
  begin
    if PageControl1.ActivePage = tabCreditos then
    begin
      btGerarClick(Sender);
    end
    else if PageControl1.ActivePage = tabRecibos then
    begin
      btQuitarClick(Sender);
    end
    else if PageControl1.ActivePage = tabLancamentos then
    begin
      btAlterarClick(Sender);
    end;
  end
  else if key = VK_F7 then
  begin
    if PageControl1.ActivePage = tabCreditos then
    begin
      CheckBox1.Checked := not CheckBox1.Checked;
    end
    else if PageControl1.ActivePage = tabRecibos then
    begin
      btSomarClick(Sender);
    end;
  end
  else if key = VK_F8 then
  begin
    if PageControl1.ActivePage = tabCreditos then
    begin
      if ListBox1.Count > 0 then
        ListBox1KeyPress(Sender, chave);
    end
    else if PageControl1.ActivePage = tabRecibos then
    begin
      btValeCreditoClick(Sender);
    end;
  end
  else if key = VK_F9 then
  begin
    if PageControl1.ActivePage = tabRecibos then
    begin
      obFormPag.vRecibo.marcaRecibo;
    end;
  end
  else if key = VK_F10 then
  begin
    if PageControl1.ActivePage = tabRecibos then
    begin
      if ActiveControl = edNumRecibo then
        gridRecibos.SetFocus
      else
        edNumRecibo.SetFocus;
    end
    else
    begin
      if obFormPag.receberDinheiro(obFormPag.getValorRestante, obFormPag.getHistorico, ckNF.Checked,
        alterandoRecebimento) then
      begin
        if obFormPag.confirmaFormaPagamento then
          ModalResult := mrOk;
      end;
    end;
  end
  else if key = VK_F11 then
  begin
    BitBtn4Click(Sender);
  end
  else if key = VK_F12 then
  begin
    ckNF.Checked := not ckNF.Checked;
  end
  ELSE if Key = VK_ESCAPE then
  begin
    if (ActiveControl = gridControle) or
    (ActiveControl = gridLancamentos) or
    (ActiveControl = gridRecibos) or
    (ActiveControl = btApagar) or
    (ActiveControl = btAlterar) or
    (ActiveControl = ckNF) or
    (ActiveControl = pnBotoes)  then
    begin
    obFormPag.CancelUpdates;
    close;
    end
    else
    begin
      tabLancamentos.Show;
      gridControle.SetFocus;
    end;
  end;
end;

procedure TfrmFormPag.FormShow(Sender: TObject);
begin
  inherited;
  if (vDadosIni.vCodOpCxl = 0) or (vDadosIni.vSistema = 'Fiscal') then
  begin
    btRecibo.Visible := false;
    btSalvar.Left := 224;
    btCancela.Left := 325;
  end
  else
  begin
    btSalvar.Left := 174;
    btCancela.Left := 275;
  end;
  alterandoRecebimento := false;
  fecha := false;
  if obFormPag = nil then
    obFormPag := TFormPag.create;
//  gridControle.DataSource := dtmFP.dsControle;
//  gridRecibos.DataSource := dtmFP.dsRecibo;
//  gridLancamentos.DataSource := dtmFP.dsFormPag;
end;

procedure TfrmFormPag.gridControleDblClick(Sender: TObject);
begin
  inherited;
  if trim(obFormPag.vControle.DataSet.FieldByName('docs').AsString) = 'N' then
    begin
      PageControl1.ActivePage := tabDinheiro;
      mValorDin.Valor := obFormPag.getValorRestante;
      edDinHist.Text := obFormPag.getHistorico;
      mValorDin.SetFocus;
    end
    else if trim(obFormPag.vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
    begin
      PageControl1.ActivePage := tabCheque;
      mValorCh.Valor := obFormPag.getValorRestante;
      edHistCh.Text := obFormPag.getHistorico;
      edNumeroCh.SetFocus;
    end
    else if trim(obFormPag.vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
    begin
      PageControl1.ActivePage := tabCreditos;
      mValorCr.Valor := obFormPag.getValorRestante;
      edCrHistorico.Text := obFormPag.getHistorico;
      mValorCr.SetFocus;
    end;
end;

procedure TfrmFormPag.gridControleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    gridControleDblClick(Sender);
end;

procedure TfrmFormPag.gridControleKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
//  if Key = #13 then
//  begin
//    if trim(obFormPag.vControle.DataSet.FieldByName('docs').AsString) = 'N' then
//    begin
//      PageControl1.ActivePage := tabDinheiro;
//      mValorDin.Valor := obFormPag.getValorRestante;
//      edDinHist.Text := obFormPag.getHistorico;
//      mValorDin.SetFocus;
//    end
//    else if trim(obFormPag.vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
//    begin
//      PageControl1.ActivePage := tabCheque;
//      mValorCh.Valor := obFormPag.getValorRestante;
//      edHistCh.Text := obFormPag.getHistorico;
//      edNumeroCh.SetFocus;
//    end
//    else if trim(obFormPag.vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
//    begin
//      PageControl1.ActivePage := tabCreditos;
//      mValorCr.Valor := obFormPag.getValorRestante;
//      edCrHistorico.Text := obFormPag.getHistorico;
//      mValorCr.SetFocus;
//    end;
//  end;
end;

procedure TfrmFormPag.grupoControleEnter(Sender: TObject);
begin
  inherited;
  grupoControle.Font.Color := clNavy;
end;

procedure TfrmFormPag.grupoControleExit(Sender: TObject);
begin
  inherited;
  grupoControle.Font.Color := clWindowText;
end;

procedure TfrmFormPag.ListBox1DblClick(Sender: TObject);
var
  chave: Char;
begin
  inherited;
  chave := #13;
  ListBox1KeyPress(Sender, chave);
end;

procedure TfrmFormPag.ListBox1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    if ListBox1.Items.Count > 0 then
    begin
      Application.CreateForm(TfrmParcela, frmParcela);
      frmParcela.edCrDoc.Text := obFormPag.getDocParcela(ListBox1.ItemIndex);
      frmParcela.edCrVenc.Text := obFormPag.getVencimentoParcela(ListBox1.ItemIndex);
      frmParcela.mValorParcelaCr.Valor := obFormPag.getValorParcela(ListBox1.ItemIndex);
      if frmParcela.ShowModal = mrOk then
      begin
        obFormPag.setValorParcela(ListBox1.ItemIndex, frmParcela.mValorParcelaCr.Valor);
        obFormPag.setDocParcela(ListBox1.ItemIndex, frmParcela.edCrDoc.Text);
        obFormPag.setVencimentoParcela(ListBox1.ItemIndex, frmParcela.edCrVenc.Text);
        ListBox1.Items[ListBox1.ItemIndex] := frmParcela.edCrDoc.Text + '    ' +
          frmParcela.edCrVenc.Text + '           ' + Format('%m',
          [frmParcela.mValorParcelaCr.Valor]);
      end;
    end;
  end;
end;

procedure TfrmFormPag.PageControl1Enter(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage.Font.Color := clNavy;
  if PageControl1.ActivePage = tabLancamentos then
  begin
    gridLancamentos.SetFocus;
  end
  else if PageControl1.ActivePage = tabDinheiro then
  begin
    mValorDin.SetFocus;
  end
  else if PageControl1.ActivePage = tabCheque then
  begin
    edNumeroCh.SetFocus;
  end
  else if PageControl1.ActivePage = tabCreditos then
  begin
    mValorCr.SetFocus;
  end
  else if PageControl1.ActivePage = tabRecibos then
  begin
    gridRecibos.SetFocus;
  end;
end;

procedure TfrmFormPag.PageControl1Exit(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage.Font.Color := clWindowText;
//  gridControle.SetFocus;
end;

end.

