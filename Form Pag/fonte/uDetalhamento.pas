unit uDetalhamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, QRCtrls,
  QuickRpt, ComCtrls, IBQuery, qrpctrls, grimgctrl;

type
  TfrmDetalhamento = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    ScrollBox1: TScrollBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    tsboletas: TTabSheet;
    ScrollBox2: TScrollBox;
    tsCarne: TTabSheet;
    ScrollBox3: TScrollBox;
    QuickRep2: TQuickRep;
    QRBand1: TQRBand;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel50: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel31: TQRLabel;
    imgInformation: TImage;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    tsRecibo1: TTabSheet;
    QuickRep3: TQuickRep;
    TitleBand3: TQRBand;
    QRShape19: TQRShape;
    QRPShape1: TQRPShape;
    QRHRule1: TQRHRule;
    qrlRecibo: TQRPLabel;
    qrlRecebi: TQRPLabel;
    qrImportancia: TQRPLabel;
    qrlReferente: TQRPLabel;
    qrlParaClareza: TQRPLabel;
    QRPLabel8: TQRPLabel;
    QRHRule2: TQRHRule;
    qrl_valor: TQRLabel;
    qrl_cidade_datarec: TQRLabel;
    qrl_tiporec: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape20: TQRShape;
    QRPShape2: TQRPShape;
    QRHRule3: TQRHRule;
    qrlRecebi2: TQRPLabel;
    qrImportancia2: TQRPLabel;
    qrlReferente2: TQRPLabel;
    qrlParaClareza2: TQRPLabel;
    QRHRule4: TQRHRule;
    qrl_cidade_datarec2: TQRLabel;
    qrl_valor2: TQRLabel;
    QRShape21: TQRShape;
    qrl_nome_cliente: TQRLabel;
    qrl_cpfcgc: TQRLabel;
    qrl_endereco: TQRLabel;
    qrl_cep_cidade_uf: TQRLabel;
    qrl_nome_dev: TQRLabel;
    qrl_referencia1: TQRLabel;
    qrl_referencia2: TQRLabel;
    qrl_referencia3: TQRLabel;
    qrl_referencia4: TQRLabel;
    qrl_nrecibo: TQRPLabel;
    qrl_nome_cliente2: TQRLabel;
    qrl_cpfcgc2: TQRLabel;
    qrl_endereco2: TQRLabel;
    qrl_cep_cidade_uf2: TQRLabel;
    qrl_nome_dev2: TQRLabel;
    qrl_referencia1_2: TQRLabel;
    qrl_referencia2_2: TQRLabel;
    qrl_referencia3_2: TQRLabel;
    qrl_referencia4_2: TQRLabel;
    qrl_tiporec2: TQRLabel;
    qrlRecibo2: TQRPLabel;
    qrl_nrecibo2: TQRPLabel;
    tsRecibo2: TTabSheet;
    QuickRep4: TQuickRep;
    TitleBand4: TQRBand;
    QRSchape3: TQRShape;
    QRPShape3: TQRPShape;
    QRHRule5: TQRHRule;
    qrlRecibo3: TQRPLabel;
    qrlRecebemos3: TQRPLabel;
    qrlQuantia3: TQRPLabel;
    qrlReferente3: TQRPLabel;
    qrlParaServVerdade3: TQRPLabel;
    QRPLabel18: TQRPLabel;
    QRHRule6: TQRHRule;
    qrl_valor3: TQRLabel;
    qrl_cidade_datarec3: TQRLabel;
    qrl_tiporec3: TQRLabel;
    qrlResponsavel3: TQRPLabel;
    qrlAtraves3: TQRPLabel;
    qrlObservacao3: TQRPLabel;
    SummaryBand2: TQRBand;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRPShape4: TQRPShape;
    QRHRule7: TQRHRule;
    qrlRecibo4: TQRPLabel;
    qrlRecebemos: TQRPLabel;
    qrlQuantia4: TQRPLabel;
    qrlReferente4: TQRPLabel;
    qrlParaServVerdade4: TQRPLabel;
    QRPLabel24: TQRPLabel;
    QRHRule8: TQRHRule;
    qrl_valor4: TQRLabel;
    qrl_cidade_datarec4: TQRLabel;
    qrl_tiporec4: TQRLabel;
    qrlResponsavel4: TQRPLabel;
    qrlAtraves4: TQRPLabel;
    qrlObservacao4: TQRPLabel;
    QRShape24: TQRShape;
    qrl_nome_cliente3: TQRPLabel;
    qrl_cpfcgc3: TQRPLabel;
    qrl_fone_cliente3: TQRPLabel;
    qrl_endereco3: TQRPLabel;
    qrl_cep_cidade_uf3: TQRPLabel;
    qrl_nrecibo3: TQRPLabel;
    qrl_nome_vendedor3: TQRPLabel;
    qrl_nome_dev3: TQRPLabel;
    qrl_atraves1_3: TQRLabel;
    qrl_atraves2_3: TQRLabel;
    qrl_atraves3_3: TQRLabel;
    qrl_observacao1_3: TQRDBText;
    qrl_observacao2_3: TQRDBText;
    qrl_observacao3_3: TQRDBText;
    qrl_nome_cliente4: TQRPLabel;
    qrl_cpfcgc4: TQRPLabel;
    qrl_fone_cliente4: TQRPLabel;
    qrl_nrecibo4: TQRPLabel;
    qrl_nome_vendedor4: TQRPLabel;
    qrl_nome_dev4: TQRPLabel;
    qrl_atraves1_4: TQRLabel;
    qrl_atraves2_4: TQRLabel;
    qrl_atraves3_4: TQRLabel;
    qrl_referencia1_4: TQRLabel;
    qrl_referencia1_3: TQRLabel;
    qrl_referencia2_3: TQRLabel;
    qrl_referencia3_3: TQRLabel;
    qrl_referencia4_3: TQRLabel;
    qrl_referencia2_4: TQRLabel;
    qrl_referencia3_4: TQRLabel;
    qrl_referencia4_4: TQRLabel;
    qrl_observacao1_4: TQRLabel;
    qrl_observacao2_4: TQRLabel;
    qrl_observacao3_4: TQRLabel;
    qrl_endereco4: TQRPLabel;
    qrl_cep_cidade_uf4: TQRPLabel;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QuickRep2Preview(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    numeroVenda: integer;
    serieNf, tipVenda: string;
    vCodCondPag, vCodCliente, vCodVendedor: integer;
    vValorTotal: Currency;
  end;

var
  frmDetalhamento: TfrmDetalhamento;

implementation

uses uDtmFormPag, uClasseFP, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmDetalhamento.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmDetalhamento.BitBtn3Click(Sender: TObject);
var
  vFp2 : TComunicacaoFormaPagamento;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('FORMA_PAGAMENTO', 'I', dtmFP.qrBuscas) then
    Exit;
  if not vDadosIni.PesqPros('FPG018', 'INSERIR', '', 'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
    Exit;

  vFp2 := TComunicacaoFormaPagamento.Create;
  vFp2.iniciaFormaPagamento(numeroVenda, vCodCondPag, StrToInt(serieNf),
    vCodCliente, vCodVendedor, tipVenda, vValorTotal);
  Close;
end;

procedure TfrmDetalhamento.BitBtn5Click(Sender: TObject);
var
  obFp: TFormPag2;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('FORMA_PAGAMENTO', 'E', dtmFP.qrBuscas) then
    Exit;

  if not vDadosIni.PesqPros('FPG023', 'CANCELAR', '', 'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
    Exit;

  obFp := TFormPag2.create;
  try
    Screen.Cursor := crHourGlass;

    obFp.cancelaVenda(numeroVenda, tipVenda, serieNf);

    Close;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmDetalhamento.BitBtn6Click(Sender: TObject);
var
  vFp2 : TComunicacaoFormaPagamento;
begin
	if DBGrid1.DataSource.DataSet.IsEmpty then
   	Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('FORMA_PAGAMENTO', 'I', dtmFP.qrBuscas) then
    Exit;

  vFp2 := TComunicacaoFormaPagamento.Create;
  vFp2.visualizarComprovanteCartao(numeroVenda, tipVenda,
  	DBGrid1.DataSource.DataSet.FieldByName('SEQFORM').AsInteger);
end;

procedure TfrmDetalhamento.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) or (key =  VK_RETURN) then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmDetalhamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
  frmDetalhamento := nil;
end;

procedure TfrmDetalhamento.FormCreate(Sender: TObject);
var
  vFp2 : TFormPag2;
  vCodTemp: Integer;
begin
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa,1) = 'OS' then
  begin
    try
      vCodTemp := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
    except
      close;
      Exit;
    end;
    vDadosIni.vPesquisa := '';
    vFp2 := TFormPag2.Create;
    vFp2.detalhamentoVenda( vCodTemp, '', 'OS');
    Close;
  end;

end;

procedure TfrmDetalhamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    ModalResult := IDCANCEL;
end;

procedure TfrmDetalhamento.FormShow(Sender: TObject);
var
 buscas: TIBQuery;
 I: Integer;
 vHab: boolean;
begin
  inherited;
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmAtivo.bancoHw;
  buscas.Transaction := dtmAtivo.IbBuscas.Transaction;

  for I := 0 to DBGrid1.FieldCount - 1 do
  begin
    if not vDadosIni.vRecibo.HabRecPorDepart then
    begin
    	if (DBGrid1.Columns[I].FieldName = 'NUM_REC_DEP') or (DBGrid1.Columns[I].FieldName = 'NUM_REC_PARC') then
        DBGrid1.Columns[I].Visible := false;
    end
    else
    begin
      if trim(DBGrid1.DataSource.dataSet.FieldByName('NUM_REC_DEP').AsString) <> '' then
      begin
         if (DBGrid1.Columns[I].FieldName = 'NREQUISICAO') or (DBGrid1.Columns[I].FieldName = 'NDOC') then
          DBGrid1.Columns[I].Visible := false;
      end
      else
      begin
        if (DBGrid1.Columns[I].FieldName = 'NUM_REC_DEP') or (DBGrid1.Columns[I].FieldName = 'NUM_REC_PARC') then
          DBGrid1.Columns[I].Visible := false;
      end;
    end;
	end;

  if (vDadosIni.vEmp.vModoFaturamento = 'S') and (vDadosIni.vSistema <> 'Cxl')
    and (vDadosIni.vPedVnd.ReceberPeloFinanceiro) and (trim(tipVenda) = 'REQ') then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    vHab := vDadosIni.PesqPros('VND254', 'HABILITAR',
     '"REQ" ' + IntToStr(numeroVenda), 'PEDVENDA', IntToStr(numeroVenda), dtmFP.qrBuscas, false);

    if vHab then
    	vHab := vDadosIni.ReceberPeloFinanceiro(numeroVenda, trim(tipVenda), dtmFP.qrBuscas) = 'S';

    if (DBGrid1.DataSource.DataSet.IsEmpty) then
    begin
      BitBtn3.Visible := vHab;
      BitBtn5.Visible := not DBGrid1.DataSource.DataSet.IsEmpty;
      BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
      	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
    end
    else
    begin
      BitBtn5.Visible := vHab;
      BitBtn6.Visible := (vHab)
      	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
    end;
  end
  else if (vDadosIni.vPedVnd.ReceberPeloFinanceiro) and (trim(tipVenda) = 'REQ') then
  begin
    BitBtn5.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty) and (vDadosIni.vSistema <> 'Cxl');
    BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
    	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
  end
  else if (vDadosIni.vEmp.vModoFaturamento = 'S') and (vDadosIni.vSistema <> 'Cxl')
    and (vDadosIni.vPedVnd.ReceberPeloFinanceiro) and (trim(tipVenda) = 'OS') then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    vHab := vDadosIni.PesqPros('VND255', 'HABILITAR',
     '"OS" ' + IntToStr(numeroVenda), 'PEDVENDA', IntToStr(numeroVenda), dtmFP.qrBuscas, false);

    if vHab then
    	vHab := vDadosIni.ReceberPeloFinanceiro(numeroVenda, trim(tipVenda), dtmFP.qrBuscas) = 'S';
      
    if (DBGrid1.DataSource.DataSet.IsEmpty) then
    begin
      BitBtn3.Visible := vHab;
      BitBtn5.Visible := not DBGrid1.DataSource.DataSet.IsEmpty;
      BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
      	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
    end
    else
    begin
      BitBtn5.Visible := vHab;
      BitBtn6.Visible := (vHab)
      	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
    end;
  end
  else if (vDadosIni.vPedVnd.ReceberPeloFinanceiro) and (trim(tipVenda) = 'OS') then
  begin
    BitBtn5.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty) and (vDadosIni.vSistema <> 'Cxl');
    BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
    	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
  end
  else if (vDadosIni.vEmp.vModoFaturamento = 'S') and (vDadosIni.vSistema <> 'Cxl')
    and (vDadosIni.vVeic.ReceberPeloFinanceiro) and (trim(tipVenda) = 'MOT') then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    vHab := vDadosIni.PesqPros('VEI168', 'HABILITAR',
     '"MOT" ' + IntToStr(numeroVenda), 'COM_FAT', IntToStr(numeroVenda), dtmFP.qrBuscas, false);

    if vHab then
    	vHab := vDadosIni.ReceberPeloFinanceiro(numeroVenda, trim(tipVenda), dtmFP.qrBuscas) = 'S';
      
    if (DBGrid1.DataSource.DataSet.IsEmpty) then
    begin
      BitBtn3.Visible := vHab;
      BitBtn5.Visible := not DBGrid1.DataSource.DataSet.IsEmpty;
      BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
      	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
    end
    else
    begin
      BitBtn5.Visible := vHab;
      BitBtn6.Visible := (vHab)
      	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
    end;
  end
  else if (vDadosIni.vVeic.ReceberPeloFinanceiro) and (trim(tipVenda) = 'MOT') then
  begin
    BitBtn5.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty) and (vDadosIni.vSistema <> 'Cxl');
    BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
    	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
  end
  else if (vDadosIni.vEmp.vModoFaturamento = 'S') and (vDadosIni.vSistema <> 'Cxl')
    and (vDadosIni.vRecibo.ReceberPeloFinanceiro) and (trim(tipVenda) = 'REC') then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    vHab := vDadosIni.PesqPros('REC024', 'HABILITAR',
     '"REC" ' + IntToStr(numeroVenda), 'RECIBOS', IntToStr(numeroVenda), dtmFP.qrBuscas, false);
    if (DBGrid1.DataSource.DataSet.IsEmpty) then
    begin
      BitBtn3.Visible := vHab;
      BitBtn5.Visible := not DBGrid1.DataSource.DataSet.IsEmpty;
      BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
      	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
    end
    else
    begin
      BitBtn5.Visible := vHab;
      BitBtn6.Visible := (vHab)
      	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
    end;
  end
  else if (vDadosIni.vRecibo.ReceberPeloFinanceiro) and (trim(tipVenda) = 'REC') then
  begin
    BitBtn5.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty) and (vDadosIni.vSistema <> 'Cxl');
    BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
    	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
  end
  else if vDadosIni.vEmp.vModoFaturamento = 'S' then
  begin
    BitBtn5.Visible := False;
    BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
    	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas))
  end
  else
  begin
    if (frmDetalhamento.Tag = 99) then
    begin
      BitBtn3.Visible := false;
      BitBtn5.Visible := false;
      BitBtn6.Visible := false;
    end
    else
    begin
    	BitBtn5.Visible := not DBGrid1.DataSource.DataSet.IsEmpty;
      BitBtn6.Visible := (not DBGrid1.DataSource.DataSet.IsEmpty)
      	and (vDadosIni.existeReciboPagamento(numeroVenda, trim(tipVenda), StrToInt(vDadosIni.codEmpresa), dtmFP.qrBuscas));
    end;
	end;

  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
  	'Processo "FPG050" PERMITIR RECEBER VENDA CANCELADA NO E-COMMERCE' + #13 +
    'Processo "REC024" HABILITAR RECEBIMENTO DE RECIBOS PELO FINANCEIRO' + #13 +
    'Processo "VND254" HABILITAR RECEBIMENTO DE REQUISICOES PELO FINANCEIRO' + #13 +
    'Processo "VND255" HABILITAR RECEBIMENTO DE ORDENS DE SERVICO PELO FINANCEIRO' + #13 +
    'Processo "VEI168" HABILITAR RECEBIMENTO DAS SAÍDAS DE VEÍCULOS PELO FINANCEIRO';
end;

procedure TfrmDetalhamento.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Promissórias');
end;

procedure TfrmDetalhamento.QuickRep2Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Carne');
end;

initialization
  RegisterClass(TfrmDetalhamento);
finalization
  UnRegisterClass(TfrmDetalhamento);

end.
