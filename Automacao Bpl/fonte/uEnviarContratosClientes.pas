unit uEnviarContratosClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UClassesClientes, config_sistema_class,
  CheckLst;

type
	TcadAbrirNfIntegracao                        = procedure(pCodigo: Integer);
  TcadAbrirNfIntegracaoCanc                    = procedure(pCodigo: Integer);

  TfrmEnviarContratosClientes = class(TfrmCadPadraoM)
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    groupAdicional: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    TabSheet4: TTabSheet;
    pnOpcoesEnviarNFSeBoleto: TPanel;
    Panel5: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Panel6: TPanel;
    TabSheet5: TTabSheet;
    pnLimparDados: TPanel;
    GroupBox7: TGroupBox;
    CheckBox_NossoNumero: TCheckBox;
    CheckBox_RemessaEnviada: TCheckBox;
    CheckBox_RetirarCredito: TCheckBox;
    ckCarne: TCheckBox;
    CheckBox_OutrosDados: TCheckBox;
    SpeedButton55: TSpeedButton;
    SpeedButton9: TSpeedButton;
    imgInformation2: TImage;
    ckExibirDadosCtr: TCheckBox;
    ckExibirDadosBol: TCheckBox;
    Panel4: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    GroupBoxAcoes: TGroupBox;
    ckImprimir: TCheckBox;
    ckEnviar: TCheckBox;
    GroupBoxTipoDocumento: TGroupBox;
    ckNFS: TCheckBox;
    ckNF: TCheckBox;
    ckRecibo: TCheckBox;
    ckBoleto: TCheckBox;
    SpeedButton14: TSpeedButton;
    pnCadIncompleto: TPanel;
    pnVindi: TPanel;
    GroupBoxAvancado: TGroupBox;
    RadioGroup1: TRadioGroup;
    pnPendente: TPanel;
    GroupBoxAplicativo: TGroupBox;
    CheckListBoxAplicativo: TCheckListBox;
    ckGerarArqZipado: TCheckBox;
    GroupBoxArquivoZip: TGroupBox;
    SpeedButton15: TSpeedButton;
    EdArquivoZip: TEdit;
    procedure SpeedButton15Click(Sender: TObject);
    procedure ckGerarArqZipadoClick(Sender: TObject);
    procedure ckBoletoClick(Sender: TObject);
    procedure ckReciboClick(Sender: TObject);
    procedure ckNFClick(Sender: TObject);
    procedure ckNFSClick(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ckEnviarClick(Sender: TObject);
    procedure ckImprimirClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure ckExibirDadosBolClick(Sender: TObject);
    procedure ckExibirDadosCtrClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton23Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure CheckBox_RetirarCreditoClick(Sender: TObject);
    procedure CheckBox_NossoNumeroClick(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure groupAdicionalExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure desabilitarHabilitarCamposCtr;
    procedure desabilitarHabilitarCamposBol;
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;
    function selecionarDiretorio(diretorioInicial: string): string;
  private
    { Private declarations }
  public
    { Public declarations }
    vCodGerador: Integer;
    ConfigEnvContr: TConfig_sistema_class;
  end;

var
  frmEnviarContratosClientes: TfrmEnviarContratosClientes;
  EnviarContratosClientes: TEnviarContratosClientes;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;

implementation

uses UDtmClientes, uDtmAtivo, uDataSet_OOP, uDadosIni, DB, funcoes, LegacyDFeDLLAdapterUnit, 
  FileCtrl;

{$R *.dfm}

procedure TfrmEnviarContratosClientes.BitBtn10Click(Sender: TObject);
begin
  inherited;
  try
  	BitBtn9.Enabled  := False;
    BitBtn10.Enabled := False;

  	TForm(pnOpcoesEnviarNFSeBoleto.Parent).ModalResult := IDCANCEL;
  finally
  	BitBtn9.Enabled  := True;
    BitBtn10.Enabled := True;
  end;
end;

procedure TfrmEnviarContratosClientes.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
    try
    if not vDadosIni.PesqPros('CLI216', 'PESQUISAR', '', 'PEDVENDA', '', EnviarContratosClientes.buscas, true) then
    	exit;

    inherited;
    Screen.Cursor := crHourGlass;
    SpeedButton1.Visible := false;

    desabilitarHabilitarCamposCtr;
    desabilitarHabilitarCamposBol;
    EnviarContratosClientes.REnviarContratos.vCampo := ComboBox1.Text;
    EnviarContratosClientes.REnviarContratos.vCondicao := ComboBox3.Text;
    EnviarContratosClientes.REnviarContratos.vValor := trim(MaskEdit3.Text);
    EnviarContratosClientes.REnviarContratos.vCampoAd := ComboBox11.Text;
    EnviarContratosClientes.REnviarContratos.vValorAd := trim(MaskEdit7.Text);
    EnviarContratosClientes.REnviarContratos.vDataIniAd := MaskEdit9.Text;
    EnviarContratosClientes.REnviarContratos.vDataFimAd := MaskEdit8.Text;
    EnviarContratosClientes.REnviarContratos.vCondicaoAd := ComboBox12.Text;
    EnviarContratosClientes.REnviarContratos.vPorDataAd := MaskEdit9.Visible;
    EnviarContratosClientes.REnviarContratos.vAdicional := CheckBox1.Checked;
    EnviarContratosClientes.REnviarContratos.avancada := CheckBox3.Checked;
    EnviarContratosClientes.REnviarContratos.vPendNFS := RadioGroup1.ItemIndex = 0;
    EnviarContratosClientes.REnviarContratos.vPendNF := RadioGroup1.ItemIndex = 1;
    EnviarContratosClientes.REnviarContratos.vPendRecLoc := RadioGroup1.ItemIndex = 2;
    EnviarContratosClientes.REnviarContratos.vPendBoleto := RadioGroup1.ItemIndex = 3;
    EnviarContratosClientes._defineSqlAdicional(frmEnviarContratosClientes.Tag);

    if MaskEdit2.Visible then
    begin
      if not EnviarContratosClientes.ConsultaCampos('VW_CONTRATOS_CL', ComboBox1.Text,
        ' VW_CONTRATOS_CL.NPED', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        ' DISTINCT VW_CONTRATOS_CL.COD_GERADOR, VW_CONTRATOS_CL.COD_EMPRESA, ' +
        ' VW_CONTRATOS_CL.NPED, VW_CONTRATOS_CL.TIPO, ' +
        ' VW_CONTRATOS_CL.DATA_PED, VW_CONTRATOS_CL.DATA_FECH, VW_CONTRATOS_CL.DATVENC, ' +
        ' VW_CONTRATOS_CL.VALOR_TOTAL, VW_CONTRATOS_CL.TOT_ACRESCIMO, VW_CONTRATOS_CL.TOT_DESCONTO, ' +
        ' VW_CONTRATOS_CL.TOT_PROD, VW_CONTRATOS_CL.TOT_SERV, ' +
        ' VW_CONTRATOS_CL.TOT_PROD_TERC, VW_CONTRATOS_CL.TOT_SERV_TERC, ' +
        ' VW_CONTRATOS_CL.TOT_FORMPAG, VW_CONTRATOS_CL.TOT_BOLETAS, ' +
		  ' VW_CONTRATOS_CL.STATUS_PED, VW_CONTRATOS_CL.TIPO_OS, ' +
        ' COALESCE(VW_CONTRATOS_CL.GERAR_NFS, ''S'') GERAR_NFS, ' +
        ' COALESCE(VW_CONTRATOS_CL.GERAR_NF, ''S'') GERAR_NF, ' +
        ' COALESCE(VW_CONTRATOS_CL.GERAR_REC_LOC, ''S'') GERAR_REC_LOC, ' +
        ' COALESCE(VW_CONTRATOS_CL.GERAR_BOLETO, ''S'') GERAR_BOLETO, ' +
        ' VW_CONTRATOS_CL.COD_RPS, VW_CONTRATOS_CL.NUM_NFS, VW_CONTRATOS_CL.SERIE_NFS, ' +
        ' VW_CONTRATOS_CL.DATA_NFS, VW_CONTRATOS_CL.SITUACAO_NFS, VW_CONTRATOS_CL.DESCRICAOERRO_NFS, ' +
        ' VW_CONTRATOS_CL.DATA_EMAIL_NFS, VW_CONTRATOS_CL.DATA_WHATSAPP_NFS, ' +
        ' VW_CONTRATOS_CL.COD_NF, VW_CONTRATOS_CL.NUM_NF, VW_CONTRATOS_CL.SERIE_NF, ' +
        ' VW_CONTRATOS_CL.DATA_NF, VW_CONTRATOS_CL.SITUACAO_NF, VW_CONTRATOS_CL.DESCRICAOERRO_NF, ' +
        ' VW_CONTRATOS_CL.DATA_EMAIL_NF, VW_CONTRATOS_CL.DATA_WHATSAPP_NF, ' +
        vDadosIni.IfThen(ckExibirDadosCtr.Checked,
        ' VW_CONTRATOS_CL.COD_CONTRATO, VW_CONTRATOS_CL.DESCR_CONTRATO, ',
        ' CAST(NULL AS INTEGER) COD_CONTRATO, CAST(NULL AS VARCHAR(75)) DESCR_CONTRATO, ') +
        ' VW_CONTRATOS_CL.COD_CLIENTE, VW_CONTRATOS_CL.NOME_CLIENTE, VW_CONTRATOS_CL.RAZAO, ' +
        ' VW_CONTRATOS_CL.CPFCGC, VW_CONTRATOS_CL.FONE_CLIENTE, VW_CONTRATOS_CL.FONE_CELULAR, VW_CONTRATOS_CL.EMAIL, ' +
        ' VW_CONTRATOS_CL.CODIGO_UF, VW_CONTRATOS_CL.SIGLA_UF, ' +
        ' VW_CONTRATOS_CL.COD_CIDADE, VW_CONTRATOS_CL.NOME_CIDADE, ' +
        ' VW_CONTRATOS_CL.COD_BAIRRO, VW_CONTRATOS_CL.NOME_BAIRRO, ' +
    	  ' VW_CONTRATOS_CL.CEP, VW_CONTRATOS_CL.ENDERECO, VW_CONTRATOS_CL.NUM_END_CLIENTE, ' +
        ' VW_CONTRATOS_CL.N_SEQ_BOL, VW_CONTRATOS_CL.NOSSO_NUMERO_BANCO, ' +
        ' VW_CONTRATOS_CL.DATA_REMESSA, VW_CONTRATOS_CL.COD_COBREBEM, ' +
        ' VW_CONTRATOS_CL.COD_CONTROLE_CX, ' +
        ' VW_CONTRATOS_CL.DATA_EMAIL_BOL, VW_CONTRATOS_CL.DATA_WHATSAPP_BOL, ' +
        ' VW_CONTRATOS_CL.DATA_EMAIL_REC, VW_CONTRATOS_CL.DATA_WHATSAPP_REC, ' +
        ' VW_CONTRATOS_CL.LOCACAO, VW_CONTRATOS_CL.FATURA_VINDI_ID, ' +
        ' COALESCE(VW_CONTRATOS_CL.PEND_NFS, ''N'') PEND_NFS, ' +
        ' COALESCE(VW_CONTRATOS_CL.PEND_NF, ''N'') PEND_NF, ' +
        ' COALESCE(VW_CONTRATOS_CL.PEND_REC_LOC, ''N'') PEND_REC_LOC, ' +
        ' COALESCE(VW_CONTRATOS_CL.PEND_BOLETO, ''N'') PEND_BOLETO ',
        '',
        EnviarContratosClientes.rEnviarContratos.vSqlAdicional) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not EnviarContratosClientes.ConsultaCampos('VW_CONTRATOS_CL', EnviarContratosClientes.rEnviarContratos.vValor, ComboBox1.Text,
      combobox3.Text, 'VW_CONTRATOS_CL.NPED', true, vDadosIni.codEmpresa,
        ' DISTINCT VW_CONTRATOS_CL.COD_GERADOR, VW_CONTRATOS_CL.COD_EMPRESA, ' +
        ' VW_CONTRATOS_CL.NPED, VW_CONTRATOS_CL.TIPO, ' +
        ' VW_CONTRATOS_CL.DATA_PED, VW_CONTRATOS_CL.DATA_FECH, VW_CONTRATOS_CL.DATVENC, ' +
        ' VW_CONTRATOS_CL.VALOR_TOTAL, VW_CONTRATOS_CL.TOT_ACRESCIMO, VW_CONTRATOS_CL.TOT_DESCONTO, ' +
        ' VW_CONTRATOS_CL.TOT_PROD, VW_CONTRATOS_CL.TOT_SERV, ' +
        ' VW_CONTRATOS_CL.TOT_PROD_TERC, VW_CONTRATOS_CL.TOT_SERV_TERC, ' +
        ' VW_CONTRATOS_CL.TOT_FORMPAG, VW_CONTRATOS_CL.TOT_BOLETAS, ' +
        ' VW_CONTRATOS_CL.STATUS_PED, VW_CONTRATOS_CL.TIPO_OS, ' +
        ' COALESCE(VW_CONTRATOS_CL.GERAR_NFS, ''S'') GERAR_NFS, ' +
        ' COALESCE(VW_CONTRATOS_CL.GERAR_NF, ''S'') GERAR_NF, ' +
        ' COALESCE(VW_CONTRATOS_CL.GERAR_REC_LOC, ''S'') GERAR_REC_LOC, ' +
        ' COALESCE(VW_CONTRATOS_CL.GERAR_BOLETO, ''S'') GERAR_BOLETO, ' +
        ' VW_CONTRATOS_CL.COD_RPS, VW_CONTRATOS_CL.NUM_NFS, VW_CONTRATOS_CL.SERIE_NFS, ' +
        ' VW_CONTRATOS_CL.DATA_NFS, VW_CONTRATOS_CL.SITUACAO_NFS, VW_CONTRATOS_CL.DESCRICAOERRO_NFS, ' +
        ' VW_CONTRATOS_CL.DATA_EMAIL_NFS, VW_CONTRATOS_CL.DATA_WHATSAPP_NFS, ' +
        ' VW_CONTRATOS_CL.COD_NF, VW_CONTRATOS_CL.NUM_NF, VW_CONTRATOS_CL.SERIE_NF, ' +
        ' VW_CONTRATOS_CL.DATA_NF, VW_CONTRATOS_CL.SITUACAO_NF, VW_CONTRATOS_CL.DESCRICAOERRO_NF, ' +
        ' VW_CONTRATOS_CL.DATA_EMAIL_NF, VW_CONTRATOS_CL.DATA_WHATSAPP_NF, ' +
        vDadosIni.IfThen(ckExibirDadosCtr.Checked,
        ' VW_CONTRATOS_CL.COD_CONTRATO, VW_CONTRATOS_CL.DESCR_CONTRATO, ',
        ' CAST(NULL AS INTEGER) COD_CONTRATO, CAST(NULL AS VARCHAR(75)) DESCR_CONTRATO, ') +
        ' VW_CONTRATOS_CL.COD_CLIENTE, VW_CONTRATOS_CL.NOME_CLIENTE, VW_CONTRATOS_CL.RAZAO, ' +
        ' VW_CONTRATOS_CL.CPFCGC, VW_CONTRATOS_CL.FONE_CLIENTE, VW_CONTRATOS_CL.FONE_CELULAR, VW_CONTRATOS_CL.EMAIL, ' +
        ' VW_CONTRATOS_CL.CODIGO_UF, VW_CONTRATOS_CL.SIGLA_UF, ' +
        ' VW_CONTRATOS_CL.COD_CIDADE, VW_CONTRATOS_CL.NOME_CIDADE, ' +
        ' VW_CONTRATOS_CL.COD_BAIRRO, VW_CONTRATOS_CL.NOME_BAIRRO, ' +
    	  ' VW_CONTRATOS_CL.CEP, VW_CONTRATOS_CL.ENDERECO, VW_CONTRATOS_CL.NUM_END_CLIENTE, ' +
        ' VW_CONTRATOS_CL.N_SEQ_BOL, VW_CONTRATOS_CL.NOSSO_NUMERO_BANCO, ' +
        ' VW_CONTRATOS_CL.DATA_REMESSA, VW_CONTRATOS_CL.COD_COBREBEM, ' +
        ' VW_CONTRATOS_CL.COD_CONTROLE_CX, ' +
        ' VW_CONTRATOS_CL.DATA_EMAIL_BOL, VW_CONTRATOS_CL.DATA_WHATSAPP_BOL, ' +
        ' VW_CONTRATOS_CL.DATA_EMAIL_REC, VW_CONTRATOS_CL.DATA_WHATSAPP_REC, ' +
        ' VW_CONTRATOS_CL.LOCACAO, VW_CONTRATOS_CL.FATURA_VINDI_ID, ' +
        ' COALESCE(VW_CONTRATOS_CL.PEND_NFS, ''N'') PEND_NFS, ' +
        ' COALESCE(VW_CONTRATOS_CL.PEND_NF, ''N'') PEND_NF, ' +
        ' COALESCE(VW_CONTRATOS_CL.PEND_REC_LOC, ''N'') PEND_REC_LOC, ' +
        ' COALESCE(VW_CONTRATOS_CL.PEND_BOLETO, ''N'') PEND_BOLETO ',
        '',
      EnviarContratosClientes.rEnviarContratos.vSqlAdicional) THEN
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;

    if EnviarContratosClientes.dataSet.Active then
       for I := 0 to DBGrid1.Columns.Count - 1 do
         if DBGrid1.Columns[i].FieldName = 'HTML' then
           DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
  finally
    gravaConfiguracoesFormRegistro;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEnviarContratosClientes.BitBtn7Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('Retirar dados da impressão',
      'Processando informações...');
    try

      BitBtn7.Enabled := false;
      BitBtn8.Enabled := false;
      if not EnviarContratosClientes.limparDadosBoleto(
        CheckBox_NossoNumero.Checked,
        CheckBox_RemessaEnviada.Checked, CheckBox_RetirarCredito.Checked, ckCarne.Checked, CheckBox_OutrosDados.Checked) then
         exit;
    except
      Application.MessageBox('Erro ao gravar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    end;

  finally
    BitBtn7.Enabled := True;
    BitBtn8.Enabled := True;
    vDadosIni.fechaStatusProcessamento;
    TForm(pnLimparDados.Parent).ModalResult := IDOK;
  end; 
end;

procedure TfrmEnviarContratosClientes.BitBtn8Click(Sender: TObject);
begin
  inherited;
  BitBtn8.Enabled := True;
  TForm(pnLimparDados.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmEnviarContratosClientes.BitBtn9Click(Sender: TObject);
var
	vSel: Boolean;
  vArrayOrigem: arrayorigem;
  I: Integer;
begin
  try
    inherited;
    Screen.Cursor := crHourGlass;
    BitBtn9.Enabled       := False;
    BitBtn10.Enabled      := False;
    SpeedButton10.Enabled := False;
    SpeedButton13.Enabled := False;
    SpeedButton9.Enabled  := False;

    if EnviarContratosClientes.dataSet.IsEmpty then
       exit;

    vSel := False;
    if (not ckNFS.Checked)
    	and (not ckNF.Checked)
      and (not ckRecibo.Checked)
      and (not ckBoleto.Checked) then
    begin
      Application.MessageBox('Tipo de documento (NFS/NF/Recibo Locacação/Boleto) não informado.', 'Atenção',
        MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Exit;
    end;

    if (not ckImprimir.Checked) and (not ckEnviar.Checked) and (not ckGerarArqZipado.Checked) then
    begin
      Application.MessageBox('Ação (IMPRIMIR/ENVIAR/GERAR ARQUIVO ZIPADO) não informada.', 'Atenção',
        MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Exit;
    end;

    for I := 0 to CheckListBoxAplicativo.Items.Count - 1 do
    	if CheckListBoxAplicativo.Checked[I] then
      begin
        vSel := True;
        Break;
      end;

    if ckEnviar.Checked then
    begin
      if not vSel then
      begin
        Application.MessageBox(PChar('Formas de Envio (' + vDadosIni.retornaNomesAplicativo(CheckListBoxAplicativo) + ') não informada.'), 'Atenção',
          MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        Exit;
      end;
    end;

    if ckGerarArqZipado.Checked then
    begin
      if trim(EdArquivoZip.Text) = '' then
      begin
        Application.MessageBox(PChar('Diretório do arquivo zip não informado.'), 'Atenção',
          MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        Exit;
      end;

      if not DirectoryExists(EdArquivoZip.Text) then
      begin
        Application.MessageBox(PChar('Diretório do arquivo zip não encontrado.'), 'Atenção',
          MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        Exit;
      end;
    end;

    vArrayOrigem := [];
    if ckNFS.Checked then
      vArrayOrigem := vArrayOrigem + [cNfse];
    if ckNF.Checked then
    	vArrayOrigem := vArrayOrigem + [cNfe];
    if ckRecibo.Checked then
    	vArrayOrigem := vArrayOrigem + [cReciboLoc];
    if ckBoleto.Checked then
    	vArrayOrigem := vArrayOrigem + [cBoleto];

    if not EnviarContratosClientes.enviarNFSeBoleto(
      ckImprimir.Checked,
      ckEnviar.Checked,
      ckGerarArqZipado.Checked,
      vDadosIni.retornaArrayAplicativo(CheckListBoxAplicativo, True),
      vArrayOrigem,
      vCodGerador,
      EdArquivoZip.Text) then
      	exit;

    TForm(pnOpcoesEnviarNFSeBoleto.Parent).ModalResult := IDOK;
  finally
  	 BitBtn9.Enabled       := True;
    BitBtn10.Enabled      := True;
    SpeedButton10.Enabled := True;
    SpeedButton13.Enabled := True;
    SpeedButton9.Enabled  := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEnviarContratosClientes.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    TabSheet2.Enabled := false;
    EnviarContratosClientes._marcarTodos;
  finally
    TabSheet2.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEnviarContratosClientes.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    TabSheet2.Enabled := false;
    EnviarContratosClientes._desmarcarTodos;
  finally
    TabSheet2.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEnviarContratosClientes.CheckBox1Click(Sender: TObject);
begin
  inherited;
  groupAdicional.Visible := CheckBox1.Checked;
  GroupBoxAvancado.Visible := CheckBox3.Checked;

  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 195;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    ComboBox11.SetFocus;
end;

procedure TfrmEnviarContratosClientes.CheckBox3Click(Sender: TObject);
begin
  inherited;
  groupAdicional.Visible := CheckBox1.Checked;
  GroupBoxAvancado.Visible := CheckBox3.Checked;

	if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 195;
    
	if (Self.Enabled) and (Self.Visible) and (RadioGroup1.CanFocus) then
    RadioGroup1.SetFocus;
end;

procedure TfrmEnviarContratosClientes.CheckBox_NossoNumeroClick(
  Sender: TObject);
begin
  inherited;
  if CheckBox_NossoNumero.Checked then
  begin
    CheckBox_OutrosDados.Visible := true;
    CheckBox_OutrosDados.Checked := true;
  end
  else
  begin
    CheckBox_OutrosDados.Visible := false;
    CheckBox_OutrosDados.Checked := false;
  end;
end;

procedure TfrmEnviarContratosClientes.CheckBox_RetirarCreditoClick(
  Sender: TObject);
begin
  inherited;
  if not (vDadosIni.PesqPros('BOL022', 'RETIRAR NOSSO NUMERO CREDITO', '', 'BOLETAS',
    '', EnviarContratosClientes.buscas, true)) then
    CheckBox_RetirarCredito.Checked := false;
end;

procedure TfrmEnviarContratosClientes.ckNFSClick(Sender: TObject);
begin
//  if (ckNFS.Visible) and (ckNF.Visible) and (ckRecibo.Visible) and (ckBoleto.Visible) then
//    if (not ckNF.Checked) and (not ckRecibo.Checked) and (not ckBoleto.Checked) then
//      ckNFS.Checked := true;
end;

procedure TfrmEnviarContratosClientes.ckNFClick(Sender: TObject);
begin
//  if (ckNFS.Visible) and (ckNF.Visible) and (ckRecibo.Visible) and (ckBoleto.Visible) then
//    if (not ckNFS.Checked) and (not ckRecibo.Checked) and (not ckBoleto.Checked) then
//      ckNF.Checked := true;
end;

procedure TfrmEnviarContratosClientes.ckReciboClick(Sender: TObject);
begin
//  if (ckNFS.Visible) and (ckNF.Visible) and (ckRecibo.Visible) and (ckBoleto.Visible) then
//    if (not ckNFS.Checked) and (not ckNF.Checked) and (not ckBoleto.Checked) then
//      ckRecibo.Checked := true;
end;

procedure TfrmEnviarContratosClientes.ckBoletoClick(Sender: TObject);
begin
//  if (ckNFS.Visible) and (ckNF.Visible) and (ckRecibo.Visible) and (ckBoleto.Visible) then
//    if (not ckNFS.Checked) and (not ckNF.Checked) and (not ckRecibo.Checked) then
//      ckBoleto.Checked := true;
end;

procedure TfrmEnviarContratosClientes.ckImprimirClick(Sender: TObject);
begin
//  if (ckImprimir.Visible) and (ckEnviar.Visible) and (ckGerarArqZipado.Visible) then
//    if (not ckEnviar.Checked) and (not ckGerarArqZipado.Checked) then
////      ckImprimir.Checked := true;
//
//  ckImprimir.Enabled := not ckGerarArqZipado.Checked;
//  ckEnviar.Enabled   := not ckGerarArqZipado.Checked;
//
//  if ckGerarArqZipado.Checked then
//  begin
//    ckImprimir.Checked := False;
//    ckEnviar.Checked   := False;
//  end;
end;

procedure TfrmEnviarContratosClientes.ckEnviarClick(Sender: TObject);
begin
//  if (ckImprimir.Visible) and (ckEnviar.Visible) and (ckGerarArqZipado.Visible) then
//    if (not ckImprimir.Checked) and (not ckGerarArqZipado.Checked) then
////      ckEnviar.Checked := true;
//
//  ckImprimir.Enabled := not ckGerarArqZipado.Checked;
//  ckEnviar.Enabled   := not ckGerarArqZipado.Checked;
//
//  if ckGerarArqZipado.Checked then
//  begin
//    ckImprimir.Checked := False;
//    ckEnviar.Checked   := False;
//  end;

  GroupBoxAplicativo.Visible := (ckEnviar.Visible) and (ckEnviar.Checked);
  CheckListBoxAplicativo.Visible := GroupBoxAplicativo.Visible;

  if (GroupBoxAplicativo.Visible) and (GroupBoxArquivoZip.Visible) then
    pnOpcoesEnviarNFSeBoleto.Height := 295
  else if GroupBoxAplicativo.Visible then
    pnOpcoesEnviarNFSeBoleto.Height := 254
  else if GroupBoxArquivoZip.Visible then
    pnOpcoesEnviarNFSeBoleto.Height := 193
  else
    pnOpcoesEnviarNFSeBoleto.Height := 152;

  TForm(pnOpcoesEnviarNFSeBoleto.Parent).Height := pnOpcoesEnviarNFSeBoleto.Height;
end;

procedure TfrmEnviarContratosClientes.ckGerarArqZipadoClick(Sender: TObject);
begin
//  if (ckImprimir.Visible) and (ckEnviar.Visible) and (ckGerarArqZipado.Visible) then
//    if (not ckImprimir.Checked) and (not ckEnviar.Checked) then
//    	ckGerarArqZipado.Checked := true;
//
//  ckImprimir.Enabled := not ckGerarArqZipado.Checked;
//  ckEnviar.Enabled   := not ckGerarArqZipado.Checked;
//
//  if ckGerarArqZipado.Checked then
//  begin
//    ckImprimir.Checked := False;
//    ckEnviar.Checked   := False;
//  end;
   GroupBoxArquivoZip.Visible := (ckGerarArqZipado.Visible) and (ckGerarArqZipado.Checked);

   if (GroupBoxAplicativo.Visible) and (GroupBoxArquivoZip.Visible) then
     pnOpcoesEnviarNFSeBoleto.Height := 295
   else if GroupBoxAplicativo.Visible then
     pnOpcoesEnviarNFSeBoleto.Height := 254
   else if GroupBoxArquivoZip.Visible then
     pnOpcoesEnviarNFSeBoleto.Height := 193
   else
     pnOpcoesEnviarNFSeBoleto.Height := 152;

  TForm(pnOpcoesEnviarNFSeBoleto.Parent).Height := pnOpcoesEnviarNFSeBoleto.Height;
end;

procedure TfrmEnviarContratosClientes.ckExibirDadosBolClick(Sender: TObject);
begin
	exit;
  if not ckExibirDadosCtr.Checked then
    exit;

	desabilitarHabilitarCamposBol;
  BitBtn1Click(Sender);
end;

procedure TfrmEnviarContratosClientes.ckExibirDadosCtrClick(Sender: TObject);
begin
	_GravaConfiguracoesBoolean(ckExibirDadosCtr.Name, ckExibirDadosCtr.Checked);
  exit;
	if not ckExibirDadosBol.Checked then
    exit;

	desabilitarHabilitarCamposCtr;
  BitBtn1Click(Sender);
end;

procedure TfrmEnviarContratosClientes.ComboBox11Exit(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
  	if ComboBox11.ItemIndex<0 then
      ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        vCampoAdcional := DBGrid1.DataSource.dataSet.Fields.Fields[i].FieldName;

        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TfrmEnviarContratosClientes.ComboBox12Exit(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
  	if (Self.Enabled) and (Self.Visible) and (Combobox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        vCampoAdcional := DBGrid1.DataSource.dataSet.Fields.Fields[i].FieldName;

        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TfrmEnviarContratosClientes.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if not EnviarContratosClientes.dataSet.IsEmpty then
    	EnviarContratosClientes._marcarDesmarca;
end;

procedure TfrmEnviarContratosClientes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
  begin
    if (ConfigEnvContr.value1_f = 1)
    	and (trim(Column.Field.dataSet.FieldByName('STATUS_PED').AsString) = 'FECHADA')
      and (Column.Field.dataSet.FieldByName('LOCACAO').AsString = 'S')
      and ((trim(Column.Field.Dataset.FieldbyName('PEND_NF').AsString) = 'S')
      	or (Column.Field.Dataset.FieldbyName('PEND_REC_LOC').AsString = 'S')
      	or (Column.Field.Dataset.FieldbyName('PEND_BOLETO').AsString = 'S')) then
    begin
    	if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnPendente.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;
    end
    else if (ConfigEnvContr.value1_f = 1)
      and (trim(Column.Field.dataSet.FieldByName('STATUS_PED').AsString) = 'FECHADA')
    	and (Column.Field.dataSet.FieldByName('LOCACAO').AsString <> 'S')
      and ((trim(Column.Field.Dataset.FieldbyName('PEND_NFS').AsString) = 'S')
      	or (Column.Field.Dataset.FieldbyName('PEND_REC_LOC').AsString = 'S')
      	or (Column.Field.Dataset.FieldbyName('PEND_BOLETO').AsString = 'S')) then
    begin
    	if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnPendente.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;
    end
    else if (ConfigEnvContr.value1_f <> 1)
    	and (trim(Column.Field.dataSet.FieldByName('STATUS_PED').AsString) = 'FECHADA')
    	and ((trim(Column.Field.Dataset.FieldbyName('PEND_NFS').AsString) = 'S')
    			or (trim(Column.Field.Dataset.FieldbyName('PEND_NF').AsString) = 'S')
    			or (Column.Field.Dataset.FieldbyName('PEND_REC_LOC').AsString = 'S')
      		or (Column.Field.Dataset.FieldbyName('PEND_BOLETO').AsString = 'S')) then
    begin
    	if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnPendente.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;
    end;
  end;

	if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
    if ((trim(Column.Field.Dataset.FieldbyName('CPFCGC').AsString) = '')
    	or (trim(Column.Field.Dataset.FieldbyName('CEP').AsString) = '')
    	or (Column.Field.Dataset.FieldbyName('COD_BAIRRO').AsInteger <= 0)
      or (Column.Field.Dataset.FieldbyName('COD_CIDADE').AsInteger <= 0)
      or (Column.Field.Dataset.FieldbyName('CODIGO_UF').AsInteger <= 0)) then
    begin
    	if (Column.FieldName = 'NOME_CLIENTE') or (Column.FieldName = 'RAZAO') then
      begin
        if (gdFocused in State) then
        begin
          TDBGrid(sender).canvas.brush.color := clWindow;
          TDBGrid(sender).canvas.Font.color := clWindowText;
        end
        else
        begin
          TDBGrid(sender).canvas.brush.color := pnCadIncompleto.Color;
          TDBGrid(sender).canvas.Font.color := clWindowText;
        end;
      end;
    end;

  if (TDBGrid(sender).DataSource.DataSet.FieldByName('FATURA_VINDI_ID').AsInteger > 0)
  	and (Column.FieldName = 'NPED') then
  begin
  	TDBGrid(sender).canvas.brush.color := pnVindi.Color;
    TDBGrid(sender).canvas.Font.color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmEnviarContratosClientes.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if not EnviarContratosClientes.dataSet.IsEmpty then
      EnviarContratosClientes._marcarDesmarca;
end;

procedure TfrmEnviarContratosClientes.desabilitarHabilitarCamposBol;
var
	I: Integer;
begin
	exit;
  for I := 0 to DBGrid1.Columns.Count - 1 do
  	if (UpperCase(trim(DBGrid1.Columns[I].FieldName)) = 'N_SEQ_BOL') then
    begin
    	if DBGrid1.Columns[I].Visible <> ckExibirDadosBol.Checked then
    		DBGrid1.Columns[I].Visible := vDadosIni.IfThen(ckExibirDadosBol.Checked, True, False);
      Break;
    end;

  for I := 0 to DBGrid1.Columns.Count - 1 do
  	if (UpperCase(trim(DBGrid1.Columns[I].FieldName)) = 'NOSSO_NUMERO_BANCO') then
    begin
    	if DBGrid1.Columns[I].Visible <> ckExibirDadosBol.Checked then
    		DBGrid1.Columns[I].Visible := vDadosIni.IfThen(ckExibirDadosBol.Checked, True, False);
      Break;
    end;

  for I := 0 to DBGrid1.Columns.Count - 1 do
  	if (UpperCase(trim(DBGrid1.Columns[I].FieldName)) = 'DATA_REMESSA') then
    begin
    	if DBGrid1.Columns[I].Visible <> ckExibirDadosBol.Checked then
    		DBGrid1.Columns[I].Visible := vDadosIni.IfThen(ckExibirDadosBol.Checked, True, False);
      Break;
    end;

  for I := 0 to DBGrid1.Columns.Count - 1 do
  	if (UpperCase(trim(DBGrid1.Columns[I].FieldName)) = 'COD_COBREBEM') then
    begin
    	if DBGrid1.Columns[I].Visible <> ckExibirDadosBol.Checked then
    		DBGrid1.Columns[I].Visible := vDadosIni.IfThen(ckExibirDadosBol.Checked, True, False);
      Break;
    end;

  for I := 0 to DBGrid1.Columns.Count - 1 do
  	if (UpperCase(trim(DBGrid1.Columns[I].FieldName)) = 'COD_CONTROLE_CX') then
    begin
    	if DBGrid1.Columns[I].Visible <> ckExibirDadosBol.Checked then
    		DBGrid1.Columns[I].Visible := vDadosIni.IfThen(ckExibirDadosBol.Checked, True, False);
      Break;
    end;

  for I := 0 to DBGrid1.Columns.Count - 1 do
  	if (UpperCase(trim(DBGrid1.Columns[I].FieldName)) = 'DATA_EMAIL_BOL') then
    begin
    	if DBGrid1.Columns[I].Visible <> ckExibirDadosBol.Checked then
    		DBGrid1.Columns[I].Visible := vDadosIni.IfThen(ckExibirDadosBol.Checked, True, False);
      Break;
    end;

  for I := 0 to DBGrid1.Columns.Count - 1 do
  	if (UpperCase(trim(DBGrid1.Columns[I].FieldName)) = 'DATA_WHATSAPP_BOL') then
    begin
    	if DBGrid1.Columns[I].Visible <> ckExibirDadosBol.Checked then
    		DBGrid1.Columns[I].Visible := vDadosIni.IfThen(ckExibirDadosBol.Checked, True, False);
      Break;
    end;
end;

procedure TfrmEnviarContratosClientes.desabilitarHabilitarCamposCtr;
var
	I: Integer;
begin
  exit;
	for I := 0 to DBGrid1.Columns.Count - 1 do
  	if (UpperCase(trim(DBGrid1.Columns[I].FieldName)) = 'COD_CONTRATO') then
    begin
    	if DBGrid1.Columns[I].Visible <> ckExibirDadosCtr.Checked then
      	DBGrid1.Columns[I].Visible := vDadosIni.IfThen(ckExibirDadosCtr.Checked, True, False);
      Break;
    end;


  for I := 0 to DBGrid1.Columns.Count - 1 do
  	if (UpperCase(trim(DBGrid1.Columns[I].FieldName)) = 'DESCR_CONTRATO') then
    begin
    	if DBGrid1.Columns[I].Visible <> ckExibirDadosCtr.Checked then
      	DBGrid1.Columns[I].Visible := vDadosIni.IfThen(ckExibirDadosCtr.Checked, True, False);
      Break;
    end;
end;

procedure TfrmEnviarContratosClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;

  if EnviarContratosClientes <> nil then
  begin
	 EnviarContratosClientes.Cancel;
  	 EnviarContratosClientes.RollBackTransacao;
  end;

  EnviarContratosClientes.Free;
  EnviarContratosClientes := nil;

  if Assigned(ConfigEnvContr) then
  	FreeAndNil(ConfigEnvContr);

  Action := caFree;
  if (frmEnviarContratosClientes <> nil) then
    frmEnviarContratosClientes := nil;
end;

procedure TfrmEnviarContratosClientes.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  EnviarContratosClientes := TEnviarContratosClientes.create;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmEnviarContratosClientes.FormShow(Sender: TObject);
var
	I: Integer;
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmClientes.dsEnviarContratosClientes;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  leConfiguracoesFormRegistro;

  EnviarContratosClientes.abreEnviarContratosClientes(0);

  imgInformation2.Hint := 'PROCESSOS' + #13 + #13 +
  	'Processo "BOL010" BT IMPRIMIR BOLETO' +#13+
    'Processo "BOL038" ENVIAR EMAIL/WHATSAPP BOLETO' + #13 +
    'Processo "VND268" EMITIR NFS OS' + #13 +
    'Processo "VND269" ENVIAR EMAIL/WHATSAPP NFS OS' + #13 +
    'Processo "VND272" ENVIAR EMAIL/WHATSAPP NF OS' + #13 +
    'Processo "VND273" EMITIR NF OS' + #13 + #13 +
    'Processo "VND274" IMPRIMIR RECIBO LOCACAO OS' + #13 +
    'Processo "VND275" ENVIAR EMAIL/WHATSAPP OS' + #13 +
    'INFORMAÇÕES ADICIONAIS' + #13 + #13 +
    'Na engrenagem "ped_vnd_os_ctrl_iss_retido_nfse" CONTROLE PARA REGISTRO DE DESPESA ISS RETIDO DA NFSe' + #13 +
    'Na engrenagem "nf_s_retencoes_federais" CONTROLE PARA REGISTRO DE DESPESA DAS RETENCOES FEDERAIS DA NFe';

  ConfigEnvContr := TConfig_sistema_class.getConf('contratos_clientes_env_ctr_rec_loc_nfs', EnviarContratosClientes.buscas, vDadosIni.cod_empresa);

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmEnviarContratosClientes.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(ckExibirDadosBol.Name, ckExibirDadosBol.Checked);
    _GravaConfiguracoesBoolean(ckExibirDadosCtr.Name, ckExibirDadosCtr.Checked);
  end;

  if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked)  and (CheckBox3.Checked) then
  begin
    _GravaConfiguracoesInteger(RadioGroup1.Name, RadioGroup1.ItemIndex);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
  end;
end;

procedure TfrmEnviarContratosClientes.groupAdicionalExit(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus; 
end;

procedure TfrmEnviarContratosClientes.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
    ckExibirDadosCtr.Checked := _LerConfiguracoesRegistroBoolean(ckExibirDadosCtr.Name);
  	ckExibirDadosBol.Checked := _LerConfiguracoesRegistroBoolean(ckExibirDadosBol.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
    RadioGroup1.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup1.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
    CheckBox1Click(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name)) <> '' then
    	ComboBox11.Text   := _LerConfiguracoesRegistroString(ComboBox11.Name);
    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
      if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
        ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    ComboBox11Exit(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name)) <> '' then
    	ComboBox12.Text     := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text      := _LerConfiguracoesRegistroString(MaskEdit9.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text      := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text      := _LerConfiguracoesRegistroString(MaskEdit7.Name);
  end;
end;

function TfrmEnviarContratosClientes.selecionarDiretorio(
  diretorioInicial: string): string;
var
  S: string;
begin
  SelectDirectory('Selecionar Pasta', '', S);
  if Trim(S) = '' then
    Result := diretorioInicial
  else
  begin
    if (Length(S) > 128) then
    begin
      ShowMessage('Este caminho está muito longo, selecione outro caminho.');
      Result := '';
    end
    else
    begin
      Result := S + '\';
    end;
  end;
end;

procedure TfrmEnviarContratosClientes.SpeedButton10Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('ped_vnd_os_ctrl_iss_retido_nfse', EnviarContratosClientes.buscas);
end;

procedure TfrmEnviarContratosClientes.SpeedButton11Click(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    EnviarContratosClientes.visualizarNF;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEnviarContratosClientes.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    EnviarContratosClientes.visualizarPed;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEnviarContratosClientes.SpeedButton13Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('nf_s_retencoes_federais', EnviarContratosClientes.buscas);
end;

procedure TfrmEnviarContratosClientes.SpeedButton14Click(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    EnviarContratosClientes.moduloPed;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEnviarContratosClientes.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  EdArquivoZip.Text := selecionarDiretorio(EdArquivoZip.Text);
end;

procedure TfrmEnviarContratosClientes.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', EnviarContratosClientes.buscas) then
    Exit;

  if not vDadosIni.PesqPros('BOL014', 'LIMPAR', '', 'BOLETAS', '', EnviarContratosClientes.buscas, true) then
    Exit;

  EnviarContratosClientes._abreFormLimparDadosBoleto;
end;

procedure TfrmEnviarContratosClientes.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    EnviarContratosClientes.moduloNF;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEnviarContratosClientes.SpeedButton26Click(Sender: TObject);
begin
  inherited;
	vDadosIni.retornaCheckListAplicativo(CheckListBoxAplicativo);

  EnviarContratosClientes._abreFormOpcoesEnvioNFSeBoleto(vCodGerador);
end;

procedure TfrmEnviarContratosClientes.SpeedButton3Click(Sender: TObject);
begin
//  inherited;
  if not vDadosIni.PesqPros('NF0108', 'CONSULTA', '', 'NOTAFISCAL',
    '', EnviarContratosClientes.buscas, True) then
    Exit;

  LegacyDFeDLLAdapter.ShowModuloNFSe(vDadosIni.vBancoHW, vDadosIni.Cod_Empresa, vDadosIni.vNomeUsuario);
end;

procedure TfrmEnviarContratosClientes.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('contratos_clientes_%', EnviarContratosClientes.buscas);
end;

procedure TfrmEnviarContratosClientes.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    EnviarContratosClientes.visualizarFP;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEnviarContratosClientes.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    EnviarContratosClientes.visualizarBOL;
  finally
    Screen.Cursor := crDefault;
  end;                                   
end;

procedure TfrmEnviarContratosClientes.SpeedButton9Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('contratos_clientes_env_ctr%', EnviarContratosClientes.buscas);
end;

end.
