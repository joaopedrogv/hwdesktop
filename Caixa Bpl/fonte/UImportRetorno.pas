unit UImportRetorno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Gauges, ComCtrls, Buttons,
  DBCtrls, ExtCtrls, uclassesimportacaofinanceiro, ComObj, grimgctrl, QRCtrls,
  qrpctrls, QuickRpt, DB, Menus;

type
  TfrmImportRetorno = class(TfrmPadrao)
    Panel_Principal: TPanel;
    GroupBox_Dados: TGroupBox;
    Panel1: TPanel;
    Gauge_HistoricoRetorno: TGauge;
    QRLabel22: TQRLabel;
    PageControl_Retorno: TPageControl;
    tsCreditos: TTabSheet;
    DBGrid_Retorno: TDBGrid;
    tsHistorico: TTabSheet;
    Memo_Retorno: TMemo;
    Panel2: TPanel;
    TabSheet_Relatorio: TTabSheet;
    ScrollBox_Relatorio: TScrollBox;
    QuickRep_Retorno: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText1: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRPLabel1: TQRPLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    lbEmpresa: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel31: TQRLabel;
    QRLabel_Valor: TQRLabel;
    QRLabel_ValorJuros: TQRLabel;
    QRShape6: TQRShape;
    QRLabel_n_doc_c: TQRLabel;
    QRLabel3: TQRLabel;
    TabSheet_Relatorio1: TTabSheet;
    ScrollBox1: TScrollBox;
    QuickRep_Retorno1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel_n_doc: TQRLabel;
    QRBand2: TQRBand;
    QRPLabel2: TQRPLabel;
    QRSysData3: TQRSysData;
    QRLabel19: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel25: TQRLabel;
    lbEmpresa1: TQRLabel;
    QRLabel30: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRBand3: TQRBand;
    QRLabel45: TQRLabel;
    QRLabel_vl: TQRLabel;
    QRLabel_vlcorr: TQRLabel;
    QRShape1: TQRShape;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRDBText21: TQRDBText;
    QRLabel26: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRHRule3: TQRHRule;
    QRHRule4: TQRHRule;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel42: TQRLabel;
    QRDBText22: TQRDBText;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit_Soma: TEdit;
    Edit_SomaMenosJuros: TEdit;
    BitBtn_SomarSelecionados: TBitBtn;
    Panel4: TPanel;
    BitBtn_QuitarCreditos: TBitBtn;
    pnEmpresaUnificada: TPanel;
    pnOutrosDados: TPanel;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    Label7: TLabel;
    BitBtn_ProcessarArquivo: TBitBtn;
    DBLookupComboBox_ControleBancario: TDBLookupComboBox;
    DBLookupComboBox_Cobrebem: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    Label33: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btUnSelectAll: TSpeedButton;
    btSelectAll: TSpeedButton;
    Edit_TotalOcorrenciaParaQuitar: TEdit;
    Edit_TotalOcorrenciaQuitadas: TEdit;
    Edit_TotalBaixa: TEdit;
    GroupBox2: TGroupBox;
    BitBtn_Imprimir: TBitBtn;
    GroupBox5: TGroupBox;
    Label5: TLabel;
    Edit_TotalOcorrencias: TEdit;
    Panel8: TPanel;
    CheckBox_LancarTaxa: TCheckBox;
    Edit_TarifaBancaria: TEdit;
    Panel9: TPanel;
    CheckBox_LancarJuros: TCheckBox;
    Edit_JurosBol: TEdit;
    Panel10: TPanel;
    CheckBox_LancarDesconto: TCheckBox;
    Edit_DescontoBol: TEdit;
    imgInformation: TImage;
    Label6: TLabel;
    DBLookupComboBox_EmpresaUnificada: TDBLookupComboBox;
    Panel5: TPanel;
    Edit_NomeArquivoRetorno: TEdit;
    BitBtn_AbrirArquivo: TBitBtn;
    Panel6: TPanel;
    Label8: TLabel;
    CheckBoxControlesConf: TCheckBox;
    OpenDialog_Retorno: TOpenDialog;
    tsTitulosNaoConciliados: TTabSheet;
    DBGrid_TitulosNaoConciliados: TDBGrid;
    Panel7: TPanel;
    BitBtnVincTitNaoEnc: TBitBtn;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Edit_SomaTitNaoEnc: TEdit;
    Edit_SomaMenosJurosTitNaoEnc: TEdit;
    BitBtn_SomarSelecionadosTitNaoEnc: TBitBtn;
    btSelectAllCred: TSpeedButton;
    btUnSelectAllCred: TSpeedButton;
    btSelectAllTitNaoEnc: TSpeedButton;
    btUnSelectAllTitNaoEnc: TSpeedButton;
    PopupMenu_Retorno: TPopupMenu;
    Copiarparareadetransferncia1: TMenuItem;
    PopupMenu_TitulosNaoConciliados: TPopupMenu;
    Copiarparareadetransferncia2: TMenuItem;
    TabSheet_CreditosVinc: TTabSheet;
    pnCreditosVinc: TPanel;
    DBGridCreditosVinc: TDBGrid;
    Panel12: TPanel;
    btCreditosVincOK: TBitBtn;
    btCreditosVincCanc: TBitBtn;
    pnQuitado: TPanel;
    procedure DBGridCreditosVincDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btCreditosVincCancClick(Sender: TObject);
    procedure btCreditosVincOKClick(Sender: TObject);
    procedure Copiarparareadetransferncia2Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure BitBtnVincTitNaoEncClick(Sender: TObject);
    procedure btUnSelectAllTitNaoEncClick(Sender: TObject);
    procedure btSelectAllTitNaoEncClick(Sender: TObject);
    procedure btUnSelectAllCredClick(Sender: TObject);
    procedure btSelectAllCredClick(Sender: TObject);
    procedure BitBtn_SomarSelecionadosTitNaoEncClick(Sender: TObject);
    procedure DBGrid_TitulosNaoConciliadosDblClick(Sender: TObject);
    procedure DBGrid_TitulosNaoConciliadosCellClick(Column: TColumn);
    procedure DBGrid_TitulosNaoConciliadosKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DBGrid_TitulosNaoConciliadosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_RetornoCellClick(Column: TColumn);
    procedure DBLookupComboBox_CobrebemExit(Sender: TObject);
    procedure CheckBoxControlesConfClick(Sender: TObject);
    procedure DBLookupComboBox_EmpresaUnificadaExit(Sender: TObject);
    procedure DBGrid_RetornoDblClick(Sender: TObject);
    procedure DBGrid_RetornoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid_RetornoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox_LancarDescontoClick(Sender: TObject);
    procedure CheckBox_LancarJurosClick(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure QuickRep_RelRetornoPreview(Sender: TObject);
    procedure GroupBox_DadosEnter(Sender: TObject);
    procedure DBLookupComboBox_CobrebemDropDown(Sender: TObject);
    procedure PageFooterBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CheckBox_LancarTaxaClick(Sender: TObject);
    procedure BitBtn_SomarSelecionadosClick(Sender: TObject);
    procedure QuickRep_RetornoPreview(Sender: TObject);
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure DBLookupComboBox_ControleBancarioExit(Sender: TObject);
    procedure BitBtn_AbrirArquivoClick(Sender: TObject);
    procedure BitBtn_TrocarAbaLogArquivoClick(Sender: TObject);
    procedure BitBtn_TrocarAbaProcessamentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn_QuitarCreditosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn_ProcessarArquivoClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
    procedure _PreencheMemoCobrebem(i: integer);
    procedure _PreencheMemoConvenio(pDatasetCobrebem: TDataset; pDatasetCobrancaBancaria: TDataset);
  public
    { Public declarations }
  end;

var
  frmImportRetorno: TfrmImportRetorno;
  Retorno: TRetorno;
  Valor, ValorJuros: Currency; //Variavel para imprimir relatório
  vCodEmpresa, vCodigoCtrl, vCodigoCobrebem: Integer;
  vAgenciaCedente, vContaCorrenteCedente, vCNPJCedente: string;

//  NomeDoLog: string;
//	nomearqcopia: string;
//  Arquivo: TextFile;

implementation

{$R *.dfm}
uses
  udtmImportPDVFinan, uDadosIni, uDtmAtivo, uDataSet_OOP, udatasrelatorioimportacao, config_sistema_class, 
  Clipbrd;

procedure plugboleto_uploadretorno(paramsList: WideString; diretorioarquivo: WideString; idconvenio: integer); stdcall; external 'hw.utils.dx.dll';

procedure TfrmImportRetorno.BitBtnVincTitNaoEncClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BOL021', 'VINCULAR CREDITO', '', 'CONTROLE_CREDITOS', '', Retorno.buscas, true) then
  	exit;

  if not Retorno.VincularTituloNaoEncontrado(
  	Retorno._TitulosNaoEncontrados.FieldByName('TITULONUMERODOCUMENTO').AsString,
    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').AsFloat,
    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat,
    Retorno._TitulosNaoEncontrados.FieldByName('DATA_EM_BOL').AsDateTime,
    Retorno._TitulosNaoEncontrados.FieldByName('DATA_VEN_BOL').AsDateTime,
    Retorno._TitulosNaoEncontrados.FieldByName('TITULONOSSONUMERO').AsString,
    Retorno.vCodCobrebem,
    Retorno._TitulosNaoEncontrados.FieldByName('COD_EMPRESA').AsInteger) then
    	exit;

  Retorno._TitulosNaoEncontrados.Delete;
end;

procedure TfrmImportRetorno.BitBtn_AbrirArquivoClick(Sender: TObject);
var
  i, j: integer;
  mensagemErro, vCodAgenciaR, vContaCorrenteR, vCodAgencia, vContaCorrente, vCNPJ, vItens: string;
  Aconf: TConfig_sistema_class;
  vAtivarConfImportRet: string;
  vNaoVerificarAgenciaContaCorrente: string;
begin
  try
    inherited;

    if vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue) <= 0 then
    begin
      Application.MessageBox(pchar('Empresa não foi selecionada.'), 'Atenção', MB_OK + MB_ICONWARNING);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_EmpresaUnificada.CanFocus) then
      	DBLookupComboBox_EmpresaUnificada.SetFocus;
      exit;
    end;

    if vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue) <= 0 then
    begin
      Application.MessageBox(pchar('Controle bancário não foi selecionado.'), 'Atenção', MB_OK + MB_ICONWARNING);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_ControleBancario.KeyValue.CanFocus) then
        DBLookupComboBox_ControleBancario.SetFocus;
      exit;
    end;

    if vDadosIni.IfThen(DBLookupComboBox_Cobrebem.KeyValue = null, 0, DBLookupComboBox_Cobrebem.KeyValue) <= 0 then
    begin
    	Application.MessageBox(pchar('Convênio não foi selecionado.'), 'Atenção', MB_OK + MB_ICONWARNING);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_Cobrebem.CanFocus) then
      	DBLookupComboBox_Cobrebem.SetFocus;
      exit;
    end;

    BitBtn_ProcessarArquivo.Enabled := true;

    if not OpenDialog_Retorno.Execute then
    	exit;

    if (Length(OpenDialog_Retorno.FileName) > 128) then
    begin
    	Application.MessageBox(pchar('Este caminho está muito longo, selecione outro caminho.'), 'Atenção', MB_OK + MB_ICONWARNING);
      OpenDialog_Retorno.FileName := '';
      exit;
    end;

    for i := 0 to length(OpenDialog_Retorno.FileName) do
      if OpenDialog_Retorno.FileName[i] = '\' then
        j := i;
        
    Retorno._NomeArquivoRetorno := copy(OpenDialog_Retorno.FileName, j + 1,
      length(OpenDialog_Retorno.FileName));
    Retorno._DiretorioRetorno := copy(OpenDialog_Retorno.FileName, 0, j);
    Edit_NomeArquivoRetorno.Text := OpenDialog_Retorno.FileName;


    if (Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString = 'S') then
    begin
    	try
        Screen.Cursor := crHourGlass;
        
        if (DBLookupComboBox_ControleBancario.Text = '') then
        begin
        	Application.MessageBox(pchar('Selecione o campo do Controle Bancário.'), 'Erro', MB_OK + MB_ICONERROR);
          BitBtn_Imprimir.Enabled := true;
          BitBtn_QuitarCreditos.Enabled := true;
          BitBtn_SomarSelecionados.Enabled := true;
          exit;
        end
        else if (DBLookupComboBox_Cobrebem.Text = '') then
        begin
        	Application.MessageBox(pchar('Selecione o campo do Cobrebem.'), 'Erro', MB_OK + MB_ICONERROR);
          BitBtn_Imprimir.Enabled := true;
          BitBtn_QuitarCreditos.Enabled := true;
          BitBtn_SomarSelecionados.Enabled := true;
          exit;
        end
        else if (Trim(Edit_NomeArquivoRetorno.Text) = '') then
        begin
          Application.MessageBox(pchar('Selecione o arquivo de retorno.'), 'Erro', MB_OK + MB_ICONERROR);
          BitBtn_Imprimir.Enabled := true;
          BitBtn_QuitarCreditos.Enabled := true;
          BitBtn_SomarSelecionados.Enabled := true;
          exit;
        end;

        vDadosIni.abreStatusProcessamento('Adicionando arquivo de retorno', 'Processando informações...');

        Retorno.vCodCobrebem := Retorno._Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger;
        if not vDadosIni.vEmp.vFinanceiroUnificado then
          Retorno.vCodEmpresa := StrToInt(vDadosIni.codEmpresa)
        else
          Retorno.vCodEmpresa := DBLookupComboBox_EmpresaUnificada.KeyValue;

        plugboleto_uploadretorno(
          Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                 [vDadosIni.vBancoHW, intToStr(Retorno.vCodEmpresa)]), Edit_NomeArquivoRetorno.Text, Retorno._Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger);

        Retorno.vProcoloRet := Retorno.RetornaProtocoloRet(
        	Retorno._Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger,
          Retorno.vCodEmpresa,
       		Edit_NomeArquivoRetorno.Text);

        if trim(Retorno.vProcoloRet) <> '' then
        begin
          Retorno.RetornaDadosArqRet;
          Edit_TotalOcorrencias.Text := IntToStr(Retorno.vQtdecorrenciasCobranca);

          if trim(retorno.vSequenciaArqRet) = '' then
          begin
            if Retorno._CBX.dataset.Tag <> 1 then
            begin
              Retorno._CBX.dataset.CreateDataSet;
              Retorno._CBX.dataset.Tag := 1;
            end;
            Retorno._CBX.dataset.EmptyDataSet;

            Edit_TarifaBancaria.Text := '0,00';
            Edit_JurosBol.Text := '0,00';
            Edit_DescontoBol.Text := '0,00';

            Edit_TarifaBancaria.Enabled := false;
            Edit_JurosBol.Enabled := false;
            Edit_DescontoBol.Enabled := false;

            CheckBox_LancarTaxa.Enabled := false;
            CheckBox_LancarJuros.Enabled := false;
            CheckBox_LancarDesconto.Enabled := false;
          end
          else if not (Retorno.ExecutaComandosSql(
            ' select cod_ocorrencia from lancamentos ' +
            ' where cod_ocorrencia = ' + retorno.vSequenciaArqRet +
            ' and data_ocorrencia = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', retorno.vDataGravacaoArqRet)) +
            ' and codigo_emp = ' + vDadosIni.codEmpresa)) then
          begin
            if Retorno._CBX.dataset.Tag <> 1 then
            begin
              Retorno._CBX.dataset.CreateDataSet;
              Retorno._CBX.dataset.Tag := 1;
            end;
            Retorno._CBX.dataset.EmptyDataSet;

            Edit_TarifaBancaria.Text := '0,00';
            Edit_JurosBol.Text := '0,00';
            Edit_DescontoBol.Text := '0,00';

            Edit_TarifaBancaria.Enabled := false;
            Edit_JurosBol.Enabled := false;
            Edit_DescontoBol.Enabled := false;

            CheckBox_LancarTaxa.Enabled := false;
            CheckBox_LancarJuros.Enabled := false;
            CheckBox_LancarDesconto.Enabled := false;
          end
          else
          begin
            CheckBox_LancarTaxa.Enabled := false;
            CheckBox_LancarJuros.Enabled := false;
            CheckBox_LancarDesconto.Enabled := false;

            CheckBox_LancarTaxa.Checked := false;
            CheckBox_LancarJuros.Checked := false;
            CheckBox_LancarDesconto.Checked := false;
          end;
        end;
      finally
      	vDadosIni.fechaStatusProcessamento;
        Screen.Cursor := crDefault;
      end;
    end
    else if (trim(Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString) = '') then
    begin
      Retorno._CobrebemX_RecebeDados;

      vCNPJ := retorno.CobreBemX.CnpjCpfCedente;

      // Verificar se CNPJ retorno pertence a empresa desejada
      if (trim(Retorno._Cobrebem.dataSet.FieldByName('LICENCA_GENERICA').AsString) <> 'S')
      	and (vDadosIni.vEmp.vNaoVerificarEmpArqRetorno <> 'S')
      	and (vDadosIni.vEmp.vCNPJ <> vCNPJ) then
      begin
      	vCNPJCedente := retorno.CobreBemX.CnpjCpfCedente;
        Application.MessageBox(pchar('CNPJ Empresa=' + vDadosIni.vEmp.vCNPJ + #13 +
        	'CNPJ Retorno=' + vCNPJCedente + ', não pertence a está empresa!'),  'Erro', MB_OK + MB_ICONERROR);
        BitBtn_ProcessarArquivo.Enabled := false;
        exit;
      end;

      // Verificar se arquivo de retorno contém dados de boletos
      if retorno.CobreBemX.OcorrenciasCobranca.Count <= 0 then
      begin
        Edit_TotalOcorrencias.Text := '0';
        Edit_TarifaBancaria.Text := '0,00';
        Application.MessageBox(pchar('Nenhuma ocorrência encontrada!'), 'Erro', MB_OK + MB_ICONERROR);
        BitBtn_ProcessarArquivo.Enabled := false;
        exit;
      end;

      Aconf := TConfig_sistema_class.Create;
      Aconf.value1_b.Text := Retorno._Cobrebem.dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString;

      if Assigned(Aconf) then
      begin
        vAtivarConfImportRet := Aconf.ReadString('ConfImportacaoRetorno', 'Ativar configuracoes importacao retorno (S ou N)', '');
        vNaoVerificarAgenciaContaCorrente := Aconf.ReadString('ConfImportacaoRetorno', 'Nao Verificar Agencia e Conta Corrente (S ou N)', '');
      end
      else
      begin
        vAtivarConfImportRet := 'N';
        vNaoVerificarAgenciaContaCorrente := 'N';
      end;

      if trim(vAtivarConfImportRet) <> 'S' then
        vNaoVerificarAgenciaContaCorrente := 'N';

      if trim(vNaoVerificarAgenciaContaCorrente) <> 'S' then
      begin
        vContaCorrenteR := retorno.CobreBemX.OcorrenciasCobranca[0].ContaCorrente;
        vCodAgenciaR := retorno.CobreBemX.OcorrenciasCobranca[0].Agencia;

        if Pos('-', Retorno._Cobrebem.dataSet.FieldByName('CODIGOAGENCIA').AsString) > 0 then
          vCodAgencia := Copy(Retorno._Cobrebem.dataSet.FieldByName('CODIGOAGENCIA').AsString, 0,
            Length(Retorno._Cobrebem.dataSet.FieldByName('CODIGOAGENCIA').AsString) - 2)
        else
          vCodAgencia :=
            StringReplace(Retorno._Cobrebem.dataSet.FieldByName('CODIGOAGENCIA').AsString, '-', '',
            [rfReplaceAll, rfIgnoreCase]);

        if Pos('-', Retorno._Cobrebem.dataSet.FieldByName('NUMEROCONTACORRENTE').AsString) > 0
          then
          vContaCorrente :=
            Copy(Retorno._Cobrebem.dataSet.FieldByName('NUMEROCONTACORRENTE').AsString, 0,
            Length(Retorno._Cobrebem.dataSet.FieldByName('NUMEROCONTACORRENTE').AsString) - 2)
        else
          vContaCorrente :=
            StringReplace(Retorno._Cobrebem.dataSet.FieldByName('NUMEROCONTACORRENTE').AsString, '-',
            '', [rfReplaceAll, rfIgnoreCase]);

        if not (((Pos(vCodAgencia, vCodAgenciaR) > 0) or (Pos(vCodAgenciaR, vCodAgencia) > 0))
          and ((Pos(vContaCorrente, vContaCorrenteR) > 0) or (Pos(vContaCorrenteR, vContaCorrente)
            > 0))) then
          if (vDadosIni.StrZero('', Length(vCodAgenciaR)) <>
            vDadosIni.StrZero(string(vCodAgenciaR), Length(vCodAgenciaR))) or
            (vDadosIni.StrZero('', Length(vContaCorrenteR)) <>
              vDadosIni.StrZero(string(vContaCorrenteR),
            Length(vContaCorrenteR))) then
          begin
          	vAgenciaCedente := retorno.CobreBemX.OcorrenciasCobranca[0].Agencia;
            vContaCorrenteCedente := retorno.CobreBemX.OcorrenciasCobranca[0].ContaCorrente;

            Application.MessageBox(pchar(' Agência Empresa= ' +
              StringReplace(Retorno._Cobrebem.dataSet.FieldByName('CODIGOAGENCIA').AsString, '-', '',
              [rfReplaceAll, rfIgnoreCase]) + ', Conta Corrente Empresa= ' +
              StringReplace(Retorno._Cobrebem.dataSet.FieldByName('NUMEROCONTACORRENTE').AsString,
              '-', '', [rfReplaceAll, rfIgnoreCase]) + #13 +
              ' Agência Retorno= ' + vAgenciaCedente + ', Conta Corrente Retorno= ' + vContaCorrenteCedente + #13 +
              ' Dados do Cedente não pertence a está empresa!'), 'Erro', MB_OK + MB_ICONERROR);
            BitBtn_ProcessarArquivo.Enabled := false;
            exit;
          end;
      end;

      if not (Retorno.ExecutaComandosSql(
        ' select cod_ocorrencia from lancamentos ' +
        ' where cod_ocorrencia = ' + inttostr(retorno.CobreBemX.ArquivoRetorno.Sequencia) +
        ' and data_ocorrencia = ' + QuotedStr(StringReplace(retorno.CobreBemX.ArquivoRetorno.DataGravacao, '/', '.', [rfReplaceAll])) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa)) then
      begin

        if Retorno._CBX.dataset.Tag <> 1 then
        begin
          Retorno._CBX.dataset.CreateDataSet;
          Retorno._CBX.dataset.Tag := 1;
        end;
        Retorno._CBX.dataset.EmptyDataSet;

        Edit_TarifaBancaria.Text := '0,00';
        Edit_JurosBol.Text := '0,00';
        Edit_DescontoBol.Text := '0,00';

        Edit_TarifaBancaria.Enabled := false;
        Edit_JurosBol.Enabled := false;
        Edit_DescontoBol.Enabled := false;

        CheckBox_LancarTaxa.Enabled := false;
        CheckBox_LancarJuros.Enabled := false;
        CheckBox_LancarDesconto.Enabled := false;
      end
      else
      begin
        CheckBox_LancarTaxa.Enabled := false;
        CheckBox_LancarJuros.Enabled := false;
        CheckBox_LancarDesconto.Enabled := false;

        CheckBox_LancarTaxa.Checked := false;
        CheckBox_LancarJuros.Checked := false;
        CheckBox_LancarDesconto.Checked := false;
      end;

      Edit_TotalOcorrencias.Text := retorno.CobreBemX.OcorrenciasCobranca.Count;
    end;
  except
    on E: Exception do
    begin
      mensagemErro := '';
      vDadosIni.registraErro(e.Message);

      if (trim(Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString) = '') then
	      if (Retorno.CobreBemX.UltimaMensagemErro <> '') then
  	      mensagemErro := Retorno.CobreBemX.UltimaMensagemErro + ' | ';

      mensagemErro := mensagemErro + e.Message;
      Application.MessageBox(pchar('Verifique se a configuração do convênio está correta: ' +
        mensagemErro), 'Erro', MB_OK + MB_ICONERROR);
      Edit_TotalOcorrenciaParaQuitar.Text := '0';
      Edit_TotalOcorrenciaQuitadas.Text := '0';
      Edit_TotalBaixa.Text := '0';
      Edit_TotalOcorrencias.Text := '0';
      Edit_TarifaBancaria.Text := '0,00';
      vDadosIni.registraErro(mensagemErro);
    end;
  end;
  Edit_TotalOcorrenciaParaQuitar.Text := '0';
  Edit_TotalOcorrenciaQuitadas.Text := '0';
  Edit_TotalBaixa.Text := '0';

end;

procedure TfrmImportRetorno.BitBtn_ImprimirClick(Sender: TObject);
var
  frmdtrelatimport: tFrmDatasRelatorioImportacao;
begin
  if not vdadosini.PesqPros('IFI003' {'HW1159' - Processo utilizado no antigo}, 'RELATORIO',
    'IMP CRED QUIT DO ARQ DE RETORNO', '', '', Retorno.buscas, true)
    then
  begin
    exit;
  end;
  inherited;
  frmdtrelatimport := tFrmDatasRelatorioImportacao.Create(frmdtrelatimport);
  //frmdtrelatimport.vquitacaocredito := Retorno._vquitacaocredito;
  frmdtrelatimport.vrelquitacaocredito := Retorno._vrelquitacaocredito;
  //Retorno._vQuitacaoCredito._ValidarDatas := false;
  Retorno._vRelQuitacaoCredito._ValidarDatas := false;
  frmdtrelatimport.ShowModal;
  //if (Retorno._vQuitacaoCredito._ValidarDatas) then
  if (Retorno._vRelQuitacaoCredito._ValidarDatas) then
  begin
    //Retorno._vQuitacaoCredito._AbrirQuitCredito;
    Retorno._vRelQuitacaoCredito._AbrirRelQuitCredito;
    lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
    lbEmpresa1.Caption := vDadosIni.vEmp.vnomeEmpresa;
    Valor := 0;
    ValorJuros := 0;
    //QuickRep_Retorno.Preview;
    QuickRep_Retorno1.Preview;
  end;

end;

procedure TfrmImportRetorno.BitBtn_ProcessarArquivoClick(Sender: TObject);
{
1 - A DLL CobrebemX recebe os dados da tabela COBREBEM
2 - Preeche tabela temporária(exibe para o usuário) com dados do CONTROLE_CREDITOS.
3 - Preenche o Memo com dados da DLL CobrebemX

Obs.: Erro...  Se for colocado um arquivo de licença diferente do arquivo de retorno da empresa que é processada
 o processamento de arquivos ao buscar algumas informações depois se processar novamente
  vai buscar informações diferentes, assim sucessivamente.
}
var
  i, j, cont, gcont, TotalBaixa, TotalQuitados, TotalparaQuitar: integer;
  ValorMultaJurosAcrescimo_doArquivo, ValorDesconto_doArquivo: double;
  mensagemErro, strLinha: string;
  vCodBaixas, vCadRecusa: integer;
  SomaTarifa: Double;
  SomaValorCreditos: Double;
  SomaValorPago: Double;

begin
  inherited;
  try
    if not vdadosini.PesqPros('IFI002', 'PROCESSAR',
      'Processamento de arquivo de retorno', '', '', Retorno.buscas, true) then
      exit;

    Retorno._TitulosNaoEncontrados.EmptyDataSet;
    if (Self.Enabled) and (Self.Visible) and (BitBtn_ProcessarArquivo.CanFocus) then
    	BitBtn_ProcessarArquivo.SetFocus;
    CheckBox_LancarTaxa.Tag := 0;
    CheckBox_LancarJuros.Tag := 0;
    CheckBox_LancarDesconto.Tag := 0;

    BitBtn_Imprimir.Enabled := false;
    BitBtn_QuitarCreditos.Enabled := false;
    BitBtn_SomarSelecionados.Enabled := false;
    Retorno.vTeste := 0;

    if (DBLookupComboBox_ControleBancario.Text = '') then
    begin
    	Application.MessageBox(pchar('Selecione o campo do Controle Bancário.'), 'Erro', MB_OK + MB_ICONERROR);
      BitBtn_Imprimir.Enabled := true;
      BitBtn_QuitarCreditos.Enabled := true;
      BitBtn_SomarSelecionados.Enabled := true;
      exit;
    end
    else if (DBLookupComboBox_Cobrebem.Text = '') then
    begin
    	Application.MessageBox(pchar('Selecione o campo do Cobrebem.'), 'Erro', MB_OK + MB_ICONERROR);
      BitBtn_Imprimir.Enabled := true;
      BitBtn_QuitarCreditos.Enabled := true;
      BitBtn_SomarSelecionados.Enabled := true;
      exit;
    end
    else if (Edit_NomeArquivoRetorno.Text = '') then
    begin
      Application.MessageBox(pchar('Selecione o arquivo de retorno.'), 'Erro', MB_OK + MB_ICONERROR);
      BitBtn_Imprimir.Enabled := true;
      BitBtn_QuitarCreditos.Enabled := false;
      BitBtn_SomarSelecionados.Enabled := false;
      exit;
    end;

    Retorno.vCodCobrebem := Retorno._Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger;
    if not vDadosIni.vEmp.vFinanceiroUnificado then
	  	Retorno.vCodEmpresa := StrToInt(vDadosIni.codEmpresa)
    else
    	Retorno.vCodEmpresa := DBLookupComboBox_EmpresaUnificada.KeyValue;


    Memo_Retorno.ScrollBars := ssVertical;

    if Retorno._CBX.dataset.Tag <> 1 then
    begin
      Retorno._CBX.dataset.CreateDataSet;
      Retorno._CBX.dataset.Tag := 1;
    end;
    Retorno._CBX.dataset.EmptyDataSet;

    Retorno._Lancamentos._AbreLancamentos;

    Retorno.vCreditosNaoEncontrados := false;

    if Retorno._ContaLigacao.dataset.Tag <> 1 then
    begin
      Retorno._ContaLigacao.dataset.CreateDataSet;
      Retorno._ContaLigacao.dataset.Tag := 1;
    end;

    if not Retorno._ContaLigacao.dataSet.Active then
      Retorno._ContaLigacao._AbrirContadeLigacao;
    Retorno._ContaLigacao.dataset.EmptyDataSet;

    Memo_Retorno.Clear;
    Gauge_HistoricoRetorno.Visible := true;
    Retorno._lotecriado := false;

    gcont := 0;
    TotalQuitados := 0;
    TotalparaQuitar := 0;
    TotalBaixa := 0;
    SomaTarifa := 0;

    Edit_Soma.Text := '0,00';
    Edit_SomaMenosJuros.Text := '0,00';
    Edit_TarifaBancaria.Text := '0,00';
    Edit_JurosBol.Text := '0,00';
    Edit_DescontoBol.Text := '0,00';
    Edit_SomaTitNaoEnc.Text := '0,00';
    Edit_SomaMenosJurosTitNaoEnc.Text := '0,00';
    CheckBox_LancarTaxa.Enabled := false;
    CheckBox_LancarJuros.Enabled := false;
    CheckBox_LancarDesconto.Enabled := false;

    if (Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString = 'S') and (trim(Retorno.vProcoloRet) <> '') then
    begin
      if (Retorno.vQtdecorrenciasCobranca <> 0) then
        cont := Trunc(100 / Retorno.vQtdecorrenciasCobranca)
      else
        cont := 0;

      PageControl_Retorno.ActivePage := tsHistorico;

      Memo_Retorno.Lines.Add(' ------------------ ');
      Memo_Retorno.Lines.Add('Arquivo:' + Edit_NomeArquivoRetorno.Text);
      Memo_Retorno.Lines.Add('DataGravacao  : ' + FormatDateTime('dd/mm/yyyy', retorno.vDataGravacaoArqRet));
      Memo_Retorno.Lines.Add('Sequencia : ' + retorno.vSequenciaArqRet);
      Memo_Retorno.Lines.Add('Data da Operação : ' + DateToStr(Now));
      Memo_Retorno.Lines.Add('Hora da Operação : ' + TimeToStr(Now));
      Memo_Retorno.Lines.Add(' ------------------ ');
      Memo_Retorno.Lines.Add(' ');

      Retorno._OcorrenciaBancaria._AbrirOcorrenciaBancaria(Retorno.vCodCobrebem, Retorno.vCodEmpresa, Retorno.vProcoloRet);

      Retorno._OcorrenciaBancaria.dataSet.First;
      while not Retorno._OcorrenciaBancaria.dataSet.Eof do
      begin
        Retorno.vstatusitem := '';

        if ((Retorno._OcorrenciaBancaria.dataSet.FieldByName('SEQTIPO').AsInteger = 1)
        		and (trim(Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_SITUACAO').AsString) = 'LIQUIDADO'))
        	or (Retorno._OcorrenciaBancaria.dataSet.FieldByName('SEQTIPO').AsInteger <> 1) then
        begin
          Retorno._AbrirRetorno(
            Retorno._OcorrenciaBancaria.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
            Retorno.vCodCobrebem,
            Retorno.vCodEmpresa);

          Retorno._InserirOcorrenciaBancariaBoletosCreditosConvenio(Retorno._OcorrenciaBancaria.dataSet,
            Retorno._OcorrenciaBancaria.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
            Retorno.vCodCobrebem,
            Retorno.vCodEmpresa);

          if Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_REALIZADO').AsInteger > 0 then
          begin
            inc(TotalBaixa);
            ValorMultaJurosAcrescimo_doArquivo := Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORACRESCIMOS').AsFloat;

            ValorDesconto_doArquivo            := Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORDESCONTO').AsFloat;

            Retorno._BaixaBoletosContCreditos(Retorno._OcorrenciaBancaria.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
              Retorno.vDataGravacaoArqRet,
              Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORPAGO').AsFloat,
              Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORCREDITO').AsFloat,
              ValorMultaJurosAcrescimo_doArquivo,
              ValorDesconto_doArquivo,

              Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORTAXACOBRANCA').AsFloat +
              Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALOROUTRASDESPESAS').AsFloat +
              Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALOR_IOF').AsFloat -
              Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORDESCONTO').AsFloat -
              Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORABATIMENTO').AsFloat,

              TotalparaQuitar,
              TotalQuitados
              );
          end;
        end;

        _PreencheMemoConvenio(Retorno._Cobrebem.dataSet, Retorno._OcorrenciaBancaria.dataSet);

        Memo_Retorno.Lines.Add('');
        gcont := trunc(cont + gcont);
        Gauge_HistoricoRetorno.Progress := (gcont);

        Retorno._OcorrenciaBancaria.dataSet.Next;
      end;

      Gauge_HistoricoRetorno.Progress := (100);

      Edit_TotalBaixa.Text := IntToStr(TotalBaixa);
      Edit_TotalOcorrencias.Text := IntToStr(Retorno._OcorrenciaBancaria.dataSet.RecordCount);
      Edit_TotalOcorrenciaParaQuitar.Text := IntToStr(TotalparaQuitar);
      Edit_TotalOcorrenciaQuitadas.Text := inttostr(TotalQuitados);
      frmImportRetorno.Refresh;

      Gauge_HistoricoRetorno.Visible := false;

      PageControl_Retorno.ActivePage := tsHistorico;
      tsHistorico.show;
    end
    else if (trim(Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString) = '') then
    begin
      if (retorno.CobreBemX.OcorrenciasCobranca.Count <> 0) then
        cont := 100 / retorno.CobreBemX.OcorrenciasCobranca.Count
      else
        cont := 0;

      PageControl_Retorno.ActivePage := tsHistorico;

      Memo_Retorno.Lines.Add(' ------------------ ');
      Memo_Retorno.Lines.Add('Arquivo:' + Edit_NomeArquivoRetorno.Text);
      Memo_Retorno.Lines.Add('DataGravacao  : ' + retorno.CobreBemX.ArquivoRetorno.DataGravacao);
      Memo_Retorno.Lines.Add('Sequencia : ' + inttostr(retorno.CobreBemX.ArquivoRetorno.Sequencia));
      Memo_Retorno.Lines.Add('Data da Operação : ' + DateToStr(Now));
      Memo_Retorno.Lines.Add('Hora da Operação : ' + TimeToStr(Now));
      Memo_Retorno.Lines.Add(' ------------------ ');
      Memo_Retorno.Lines.Add(' ');

      for i := 0 to retorno.CobreBemX.OcorrenciasCobranca.Count - 1 do
      begin
        Retorno.vstatusitem := '';

        Retorno._AbrirRetorno(
          Trim(retorno.CobreBemX.OcorrenciasCobranca[i].NossoNumero),
          Retorno.vCodCobrebem,
          Retorno.vCodEmpresa);

        Retorno._InserirOcorrenciaBancariaBoletosCreditosCobrebem(i,
          trim(retorno.CobreBemX.OcorrenciasCobranca[i].NossoNumero),
          Retorno.vCodCobrebem,
          Retorno.vCodEmpresa);

        try
          vCodBaixas := strtoint(Trim(retorno.CobreBemX.OcorrenciasCobranca[i].CodigoOcorrencia));
        except
          vCodBaixas := 0;
        end;
        Retorno.vVerificaControle := '';
        if Pos(vDadosIni.StrZero(vCodBaixas, 2),
          Trim(Retorno._Cobrebem.dataSet.FieldByName('CODIGO_BAIXA').AsString)) > 0 then
        begin
          inc(TotalBaixa);
          ValorMultaJurosAcrescimo_doArquivo :=
            retorno.CobreBemX.OcorrenciasCobranca[i].ValorMultaPaga +
            retorno.CobreBemX.OcorrenciasCobranca[i].ValorJurosPago +
            retorno.CobreBemX.OcorrenciasCobranca[i].ValorOutrosAcrescimos;

          ValorDesconto_doArquivo := retorno.CobreBemX.OcorrenciasCobranca[i].ValorDesconto;
          
          Retorno._BaixaBoletosContCreditos(retorno.CobreBemX.OcorrenciasCobranca[i].NossoNumero,
            StrToDate(retorno.CobreBemX.OcorrenciasCobranca[i].DataOcorrencia),
            retorno.CobreBemX.OcorrenciasCobranca[i].ValorPago,
            retorno.CobreBemX.OcorrenciasCobranca[i].ValorCredito,
            ValorMultaJurosAcrescimo_doArquivo,
            ValorDesconto_doArquivo,

            retorno.CobreBemX.OcorrenciasCobranca[i].ValorTaxaCobranca +
            retorno.CobreBemX.OcorrenciasCobranca[i].ValorOutrasDespesas +
            retorno.CobreBemX.OcorrenciasCobranca[i].ValorIOF -
            retorno.CobreBemX.OcorrenciasCobranca[i].ValorDesconto -
            retorno.CobreBemX.OcorrenciasCobranca[i].ValorAbatimento, 

            TotalparaQuitar,
            TotalQuitados
            );
        end;

        _PreencheMemoCobrebem(i);

        Memo_Retorno.Lines.Add('');
        gcont := trunc(cont + gcont);
        Gauge_HistoricoRetorno.Progress := (gcont);
      end;

      Gauge_HistoricoRetorno.Progress := (100);

      Edit_TotalBaixa.Text := IntToStr(TotalBaixa);
      Edit_TotalOcorrencias.Text := IntToStr(Retorno.CobreBemX.OcorrenciasCobranca.Count);
      Edit_TotalOcorrenciaParaQuitar.Text := IntToStr(TotalparaQuitar);
      Edit_TotalOcorrenciaQuitadas.Text := inttostr(TotalQuitados);
      frmImportRetorno.Refresh;

      Gauge_HistoricoRetorno.Visible := false;

      PageControl_Retorno.ActivePage := tsHistorico;
      tsHistorico.show;
    end;

    SomaTarifa := 0;
    SomaValorCreditos := 0;
    SomaValorPago := 0;
    Edit_TarifaBancaria.Text := '0,00';
    Edit_Soma.Text := '0,00';
    Edit_SomaMenosJuros.Text := '0,00';
    Edit_SomaTitNaoEnc.Text := '0,00';
    Edit_SomaMenosJurosTitNaoEnc.Text := '0,00';

    if (Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString = 'S') and (trim(Retorno.vProcoloRet) <> '')  then
    begin
    	Retorno._OcorrenciaBancaria.dataSet.First;
      while not Retorno._OcorrenciaBancaria.dataSet.Eof do
      begin
        SomaTarifa := SomaTarifa +
          Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORTAXACOBRANCA').AsFloat +
          Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALOROUTRASDESPESAS').AsFloat +
          Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALOR_IOF').AsFloat -
          Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORDESCONTO').AsFloat -
          Retorno._OcorrenciaBancaria.dataSet.FieldByName('API_PGT_VALORABATIMENTO').AsFloat;

      	Retorno._OcorrenciaBancaria.dataSet.Next;
      end;
      Retorno._OcorrenciaBancaria.dataSet.First;
    end
    else if (trim(Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString) = '') then
    begin
      for i := 0 to retorno.CobreBemX.OcorrenciasCobranca.Count - 1 do
      begin
        SomaTarifa := SomaTarifa +
          retorno.CobreBemX.OcorrenciasCobranca[i].ValorTaxaCobranca +
          retorno.CobreBemX.OcorrenciasCobranca[i].ValorOutrasDespesas +
          retorno.CobreBemX.OcorrenciasCobranca[i].ValorIOF -
          retorno.CobreBemX.OcorrenciasCobranca[i].ValorDesconto -
          retorno.CobreBemX.OcorrenciasCobranca[i].ValorAbatimento;
      end;
    end;

    Retorno._TitulosNaoEncontrados.First;
    while not Retorno._TitulosNaoEncontrados.Eof do
    begin
      Edit_SomaMenosJurosTitNaoEnc.Text := FormatFloat(',0.00', (strtofloat(StringReplace(Edit_SomaMenosJurosTitNaoEnc.Text, '.', '', [])) +
        (Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat - Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').Asfloat)));
      Edit_SomaTitNaoEnc.Text := FormatFloat(',0.00', (strtofloat(StringReplace(Edit_SomaTitNaoEnc.Text, '.', '', [])) +
        (Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat)));

      Retorno._TitulosNaoEncontrados.Next;
    end;
    Retorno._TitulosNaoEncontrados.First;

    try
    	Retorno._CBX.dataSet.DisableControls;
      Retorno._CBX.dataSet.First;
      while not Retorno._CBX.dataSet.Eof do
      begin
        SomaValorCreditos := SomaValorCreditos +
          Retorno._CBX.dataSet.FieldByName('VALOR_C').AsCurrency;

        SomaValorPago := SomaValorPago +
          Retorno._CBX.dataSet.FieldByName('VALOR_PAGO').AsCurrency;

        Retorno._CBX.dataSet.Edit;
        Retorno._CBX.dataSet.FieldByName('SEL').AsString := 'S';
        Retorno._CBX.dataSet.Post;
        Edit_SomaMenosJuros.Text := FormatFloat(',0.00', (strtofloat(StringReplace(Edit_SomaMenosJuros.Text, '.', '', [])) +
          (Retorno._CBX.dataSet.FieldByName('VALOR_PAGO').AsFloat - Retorno._CBX.dataSet.FieldByName('VALOR_JUROS').Asfloat)));
        Edit_Soma.Text := FormatFloat(',0.00', (strtofloat(StringReplace(Edit_Soma.Text, '.', '', [])) +
          (Retorno._CBX.dataSet.FieldByName('VALOR_PAGO').AsFloat)));

        Retorno._CBX.dataSet.Next;
      end;
    finally
      Retorno._CBX.dataSet.First;
      Retorno._CBX.dataSet.EnableControls;
    end;

    if (SomaTarifa > 0) then
    begin
      CheckBox_LancarTaxa.Enabled := true;
      Edit_TarifaBancaria.Text := FormatFloat(',0.00', (SomaTarifa));
      Edit_TarifaBancaria.Enabled := true;
      try
        if (_LerConfiguracoesRegistroBoolean('LANCARTARIFABANCARIA', true)) then
          CheckBox_LancarTaxa.Checked := true
        else
          CheckBox_LancarTaxa.Checked := False;
      finally
      end;
    end;

    if (SomaValorPago > SomaValorCreditos) then
    begin
      CheckBox_LancarJuros.Enabled := true;
      Edit_JurosBol.Text := FormatFloat(',0.00', (SomaValorPago - SomaValorCreditos));
      Edit_JurosBol.Enabled := true;
      try
        if (_LerConfiguracoesRegistroBoolean('LANCARJUROS', true)) then
          CheckBox_LancarJuros.Checked := true
        else
          CheckBox_LancarJuros.Checked := False;
      finally
      end;
    end;


    if (SomaValorCreditos > SomaValorPago) then
    begin
      CheckBox_LancarDesconto.Enabled := true;
      Edit_DescontoBol.Text := FormatFloat(',0.00', (SomaValorCreditos - SomaValorPago));
      Edit_DescontoBol.Enabled := true;
      try
        if (_LerConfiguracoesRegistroBoolean('LANCARDESCONTO', true)) then
          CheckBox_LancarDesconto.Checked := true
        else
          CheckBox_LancarDesconto.Checked := False;
      finally
      end;
    end;

    BitBtn_Imprimir.Enabled := true;
    BitBtn_QuitarCreditos.Enabled := true;
    BitBtn_SomarSelecionados.Enabled := true;
    vDadosIni.GravaAuditoria('IFI002', 'PROCESSAR', 'SUCESSO', 'BOLETO', '', Retorno.buscas);

    if Retorno.vCreditosNaoEncontrados then
    	Application.MessageBox(pchar('Alguns boletos do arquivo de retorno não foram encontrados nos créditos'), 'Atenção', MB_OK + MB_ICONWARNING);

  except
    on E: Exception do
    begin
      mensagemErro := '';
      vDadosIni.registraErro(e.Message);
      
      if (trim(Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString) = '') then
  	    if (Retorno.CobreBemX.UltimaMensagemErro <> '') then
	        mensagemErro := Retorno.CobreBemX.UltimaMensagemErro + ' | ';

      mensagemErro := mensagemErro + e.Message;
      Application.MessageBox(pchar('Os boletos não foram baixados no sistema: ' + mensagemErro),
        'Erro', MB_OK + MB_ICONERROR);
      frmImportRetorno.Refresh;
      Gauge_HistoricoRetorno.Progress := (0);
      BitBtn_Imprimir.Enabled := true;
      BitBtn_QuitarCreditos.Enabled := true;
      BitBtn_SomarSelecionados.Enabled := true;
      vDadosIni.GravaAuditoria('IFI002', 'PROCESSAR', 'FALHA', 'BOLETO', '', Retorno.buscas);
      Memo_Retorno.Lines.Clear;
      vDadosIni.registraErro(mensagemErro);
      exit;
    end;
  end;
end;

procedure TfrmImportRetorno.BitBtn_QuitarCreditosClick(Sender: TObject);
{
 1 - Quita o lote inserindo na tabela LOTE_QUIT
 2 - Quita o boleto alterando na tabela BOLETAS
 3 - Quita o contole de crédito alterando na tabela CONTROLE_CREDITOS
 4 - Inclusão da baixa total ou paracial do crédito na tabela BAIXA_CREDITOS, assume
     o valor do crédito de acordo com que ele é baixado.(obs:. Equanto é reduzido o
     valor do controle de crédito na tabela CONTROLE_CREDITOS é acrescentado o
     lançamento do crédito PARCIAL ou TOTAL na tabela BAIXA_CREDITOS)
 5 - Inclusão do lançamento de saída na tabela de LANCAMENTOS
 6 - Inclução do lançamento de entrada na tabela de LANCAMENTOS
 7 - Se ouver juros, pergunta ao usuário se deseja incluir o lançamento da ENTRADA e SAÍDA
     dos juros na tabela de LANCAMENTOS.
}

var
  cont, gcont: Real;
  vcodempmult: string;
  _CodControle, ContarBoletos: integer;
  _NossoNumeroControleCredito: string;
  i: integer;
  vTarifaLancada: boolean;
  vCreditoEnc: boolean;
  vListaClBarrarDesbarrar: TStringList;
begin
  try
  	vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    if not vdadosini.PesqPros('IFI001', 'QUITAR', 'QUITAR BOLETOS DO ARQUIVO DE RETORNO', '', '',
      Retorno.buscas, true)
      then
    begin
      exit;
    end;

    if (Self.Enabled) and (Self.Visible) and (BitBtn_QuitarCreditos.CanFocus) then
      BitBtn_QuitarCreditos.SetFocus;

    if not vDadosIni.testarContasLigacao(Retorno.buscas, 'RET_BOL') then
      Exit;

    if Retorno.vCreditosNaoEncontrados then
    begin
      if (Application.MessageBox(PChar('Alguns boletos do arquivo de retorno não foram encontrados nos créditos,' +
        ' deseja realizar a quitação assim mesmo?'), 'Atenção',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes) then
          exit;

      if not vdadosini.PesqPros('IFI005', 'PERMITIR', Copy(
        trim(ExtractFileName(Edit_NomeArquivoRetorno.Text)) +
        ' | ' + trim(DBLookupComboBox_ControleBancario.Text) +
        ' | ' + trim(DBLookupComboBox_Cobrebem.Text), 1, 128),
        '', '',  Retorno.buscas, true) then
        exit;
    end;

    try

      BitBtn_Imprimir.Enabled := false;
      BitBtn_QuitarCreditos.Enabled := false;
      BitBtn_SomarSelecionados.Enabled := false;

      CheckBox_LancarTaxa.Tag := 99;
      CheckBox_LancarJuros.Tag := 99;
      CheckBox_LancarDesconto.Tag := 99;

      ContarBoletos := 0;
      vTarifaLancada := false;
      vCreditoEnc := false;

      Retorno.codigoUnificada := 0;
      Retorno.stringlistEmpUnif := TStringList.create;
      Retorno.stringlistEmpUnif.Sorted := true;
      Retorno.stringlistEmpUnif.Duplicates := dupIgnore;
      Retorno.stringlistEmpUnif.Clear;

      Retorno._CBX.dataSet.First;
      while not Retorno._CBX.dataSet.Eof do
      begin
        Retorno.stringlistEmpUnif.Add(IntToStr(Retorno._CBX.dataSet.FieldByName('cod_emp_mult').AsInteger));
        if Retorno._CBX.dataSet.FieldByName('sel').AsString = 'S' then
        begin
          ContarBoletos := 1;
        end;
        Retorno._CBX.dataSet.Next;
      end;

      if (ContarBoletos = 0) then
      begin
        Application.MessageBox(pchar('Selecione um item para quitar o crédito'), 'Erro', MB_OK + MB_ICONERROR);
        BitBtn_Imprimir.Enabled := true;
        BitBtn_QuitarCreditos.Enabled := true;
        BitBtn_SomarSelecionados.Enabled := true;
        Exit;
      end;

      // Financeiro sendo fechado
      if vDadosIni.financeiroFechando(Retorno.buscas) then
      begin
        BitBtn_Imprimir.Enabled := true;
        BitBtn_QuitarCreditos.Enabled := true;
        BitBtn_SomarSelecionados.Enabled := true;
        Exit;
      end;

      Retorno._ContaLigacao._AbrirContadeLigacao;

      if (trim(Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString) = '') then
        Retorno._CobrebemX_RecebeDados;

      if Retorno._CBX.dataSet.Tag <> 1 then
      begin
        Retorno._CBX.dataSet.CreateDataSet;
        Retorno._CBX.dataSet.Tag := 1;
      end;
      Retorno._Lancamentos._AbreLancamentos;
      //  if Retorno._Lancamentos.dataset.Tag <> 1 then
     //   begin
     //     Retorno._Lancamentos.dataset.CreateDataSet;
      //    Retorno._Lancamentos.dataset.Tag := 1;
     //   end;
     //   Retorno._Lancamentos.dataset.EmptyDataSet;

      if Retorno._BaixaCredito.dataset.Tag <> 1 then
      begin
        Retorno._BaixaCredito.dataset.CreateDataSet;
        Retorno._BaixaCredito.dataset.Tag := 1;
      end;
      Retorno._BaixaCredito.dataset.EmptyDataSet;

      if Retorno._ContaLigacao.dataset.Tag <> 1 then
      begin
        Retorno._ContaLigacao.dataset.CreateDataSet;
        Retorno._ContaLigacao.dataset.Tag := 1;
      end;
      Retorno._ContaLigacao.dataset.EmptyDataSet;

      Retorno.transacao.Active := false;
      if not Retorno.IniciaTransacao then
        raise Exception.Create('Erro ao iniciar a transação');
      Retorno._FechCaixa._AbrirFechCaixa;
      if Retorno.stringlistEmpUnif.Count > 1 then
        Retorno._CBX.dataSet.IndexFieldNames := 'COD_EMP_MULT';
      Retorno._CBX.dataSet.First;
  //    AssignFile(Arquivo, NomeDoLog);
      try
  //      if FileExists(NomeDoLog) then
  //        Append(arquivo) { se existir, apenas adiciona linhas }
  //      else
  //        ReWrite(arquivo); { cria um novo se não existir }
  //
  //      for i := 0 to Memo_Retorno.Lines.Count - 1 do
  //      begin
  //        WriteLn(arquivo, Memo_Retorno.lines[i]);
  //      end;
  //      WriteLn(arquivo, '----- PROCESSADOS -----' + TimeToStr(Now));

        if (Retorno._CBX.dataSet.RecordCount <> 0) then
          cont := 100 / Retorno._CBX.dataSet.RecordCount
        else
          cont := 0;

        gcont := 0;

        for I := 0 to Retorno.stringlistEmpUnif.Count - 1 do
        begin
          Retorno._ValorJuros := 0;
          Retorno._TotalValorPago := 0;
          Retorno._TotalValorCredito := 0;
          Retorno._TotalTarifasBancarias := 0;
          Retorno._LoteCriado := false;

          try
            Retorno.codigoUnificada := StrToInt(Retorno.stringlistEmpUnif[i]);

            Retorno._CBX.dataSet.DisableControls;
            if Retorno.stringlistEmpUnif.Count > 1 then
            begin
              Retorno._CBX.dataSet.Filter := 'COD_EMP_MULT = ' + IntToStr(Retorno.codigoUnificada);
              Retorno._CBX.dataSet.Filtered := True;
            end;

            Retorno._CBX.dataSet.First;
            while not Retorno._CBX.dataSet.Eof do
            begin
              if Retorno._CBX.dataSet.FieldByName('sel').AsString = 'S' then
              begin
                Retorno.montaSelect(
                  '   select first 1 * from controle_creditos ' +
                  '   where COD_CRED = ' + Retorno._CBX.dataSet.FieldByName('COD_CRED').AsString +
                  '   and COD_COBREBEM = ' + IntToStr(Retorno.vCodCobrebem) +
                  '   and (PRCSS is null or PRCSS <> ''S'') ' +
                  '   and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
                  vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                    ' and COD_EMP_MULT = ' + IntToStr(Retorno.codigoUnificada),
                    ' and CODIGO_EMP = ' + vDadosIni.codEmpresa) +
                  '   union ' +
                  '   select first 1 * from controle_creditos ' +
                  '   where COD_CRED = ' + Retorno._CBX.dataSet.FieldByName('COD_CRED').AsString +
                  '   and (PRCSS is null or PRCSS <> ''S'') ' +
                  '   and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
                  vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                    ' and COD_EMP_MULT = ' + IntToStr(Retorno.codigoUnificada),
                    ' and CODIGO_EMP = ' + vDadosIni.codEmpresa) +
                  '   and (select count(*) from controle_creditos ' +
                  ' 	  	 where COD_CRED = ' + Retorno._CBX.dataSet.FieldByName('COD_CRED').AsString +
                  ' 	   	 and COD_COBREBEM = ' + IntToStr(Retorno.vCodCobrebem) +
                  ' 	   	 and (PRCSS is null or PRCSS <> ''S'') ' +
                  ' 	  	 and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
                  vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                    '   	 and COD_EMP_MULT = ' + IntToStr(Retorno.codigoUnificada),
                    '   	 and CODIGO_EMP = ' + vDadosIni.codEmpresa) + ') = 0 ');

                if Trim(Retorno.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO' then
                begin
                	if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
                      and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
                    or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
                      and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
                  begin
                    if (Retorno.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
                    begin
                      if (vDadosIni.vEmp.vFinanceiroUnificado)
                        and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
                      begin
                        if trim(Retorno.dataSet.FieldByName('CPFCGC').AsString) <> '' then
                          vListaClBarrarDesbarrar.Add(trim(Retorno.dataSet.FieldByName('CPFCGC').AsString));
                      end
                      else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
                        vListaClBarrarDesbarrar.Add(IntToStr(Retorno.dataSet.FieldByName('COD_CLIENTE').AsInteger));
                    end;
                  end;

                  if (not Retorno.dataset.IsEmpty) and (not Retorno._LoteCriado) then
                  begin
                    Retorno._LoteQuit._CriarLote;
                  end;

                  if not Retorno.dataSet.IsEmpty then
                  begin
                    Retorno._Boletos._BaixarBoleto(
                      Retorno.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
                      Retorno.dataSet.FieldByName('COD_CLIENTE').AsInteger,
                      Retorno.vCodCobrebem,
                      Retorno.codigoUnificada);

                    _CodControle := Retorno.dataSet.FieldByName('CODIGO_CTRL').Value;
                    retorno._QuitarContoroleCredito;

                    Retorno._RegBaixaCredito(
                      Retorno._CBX.dataSet.FieldByName('VALOR_PAGO').AsCurrency,
                      Retorno._CBX.dataSet.FieldByName('VALOR_PAGO').AsCurrency, 'T');

                    retorno._ValorJuros := retorno._ValorJuros +
                      Retorno._BaixaCredito.dataSet.FieldByName('JUROS_COB').value;

                    retorno._TotalValorCredito := retorno._TotalValorCredito +
                      Retorno.dataSet.FieldByName('VALOR_C').value;
                    retorno._TotalValorPago := retorno._TotalValorPago +
                      Retorno._CBX.dataSet.FieldByName('VALOR_PAGO').ascurrency;

  //                  Retorno._LogArqRetorno('processadosArqRetorno.log', ' Documento ' +
  //                    Retorno._CBX.dataSet.FieldByName('N_DOC_C').AsString + ' processado. Cliente: '
  //                    + Retorno.dataSet.FieldByName('NOME_C').AsString
  //                    + '                                    Valor Pago: R$ '
  //                    + FloatToStr(Retorno._CBX.dataSet.FieldByName('VALOR_PAGO').AsCurrency)
  //                    + ' - Data Pag: ' +
  //                    DateToStr(Retorno._CBX.dataSet.FieldByName('DATA_PAGAMENTO').asdatetime)
  //                    + ' - Nosso Numero: ' + Retorno._CBX.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString
  //                    + '.');
                  end
                  else
  //                  Retorno._LogArqRetorno('errosArqRetorno.log', ' Documento ' +
  //                    Retorno._CBX.dataSet.FieldByName('N_DOC_C').AsString
  //                    + ' não encontrado no sistema! Nosso numero: ' +
  //                    Retorno._CBX.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString);
                end;
              end;
              Retorno._CBX.Next;
              gcont := trunc(cont + gcont);
              Gauge_HistoricoRetorno.Progress := trunc(gcont);
            end;

            if vDadosIni.vEmp.vFinanceiroUnificado then
            begin
              if not Retorno.finalizarProcessamento(Retorno.codigoUnificada,
                CheckBox_LancarTaxa.Checked, CheckBox_LancarJuros.Checked, CheckBox_LancarDesconto.Checked,
                StrToFloat(StringReplace(Edit_TarifaBancaria.text, '.', '', [])), vTarifaLancada, vCreditoEnc) then
                  raise Exception.Create('Erro ao Finalizar Processamento');

              if vCreditoEnc then
                vTarifaLancada := true;
            end
            else
            begin
              Gauge_HistoricoRetorno.Progress := (100);
              Retorno._ContaLigacao._AbrirContadeLigacao;
              Retorno._FazLancamentosSaida(retorno._TotalValorCredito, _CodControle, );
              Gauge_HistoricoRetorno.Progress := (50);
              Retorno._fazlancamentosentrada(retorno._TotalValorPago,
                DBLookupComboBox_ControleBancario.KeyValue);
              Gauge_HistoricoRetorno.Progress := (100);

              if not vTarifaLancada then
                if ((StrToFloat(StringReplace(Edit_TarifaBancaria.Text, '.', '', [])) > 0) and (CheckBox_LancarTaxa.Checked)) then
                begin
                  if Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString = 'S' then
                  begin
                    Retorno._FazLancamentoTarifaBancariaRetorno(
                      StrToFloat(StringReplace(Edit_TarifaBancaria.text, '.', '', [])),
                      Retorno._Controle.dataSet.FieldByName('CODIGO_CTRL').AsInteger,
                      StrToInt(Retorno.vSequenciaArqRet),
                      FormatDateTime('dd/mm/yyyy', Retorno.vDataGravacaoArqRet));
                  end
                  else
                  begin
                    Retorno._FazLancamentoTarifaBancariaRetorno(
                      StrToFloat(StringReplace(Edit_TarifaBancaria.text, '.', '', [])),
                      Retorno._Controle.dataSet.FieldByName('CODIGO_CTRL').AsInteger,
                      retorno.CobreBemX.ArquivoRetorno.Sequencia,
                      retorno.CobreBemX.ArquivoRetorno.DataGravacao);
                  end;
                  vTarifaLancada := true;
                end;

              if (retorno._TotalValorPago > retorno._TotalValorCredito) and (CheckBox_LancarJuros.Checked) then
                Retorno._LancaJuros(retorno._ValorJuros);

              if (retorno._TotalValorCredito > retorno._TotalValorPago) and (CheckBox_LancarDesconto.Checked) then
                Retorno._LancaDesconto(retorno._TotalValorCredito - retorno._TotalValorPago);

              if not Retorno.CommitaTransacao then
                raise Exception.Create('Erro ao concluir transação.');
            end;
          finally
            if Retorno.stringlistEmpUnif.Count > 1 then
            begin
              Retorno._CBX.dataSet.Filtered := False;
              Retorno._CBX.dataSet.Filter := '';
            end;
            Retorno._CBX.dataSet.EnableControls;
          end;
        end;
      finally
  //      CloseFile(arquivo);
      end;

      Edit_TarifaBancaria.Text := '0,00';
      CheckBox_LancarTaxa.Checked := false;
      CheckBox_LancarTaxa.Enabled := false;
      Edit_TarifaBancaria.Enabled := false;

      Edit_JurosBol.Text := '0,00';
      CheckBox_LancarJuros.Checked := false;
      CheckBox_LancarJuros.Enabled := false;
      Edit_JurosBol.Enabled := false;

      Edit_DescontoBol.Text := '0,00';
      CheckBox_LancarDesconto.Checked := false;
      CheckBox_LancarDesconto.Enabled := false;
      Edit_DescontoBol.Enabled := false;

      Edit_SomaMenosJuros.Text := '0,00';
      Edit_Soma.Text := '0,00';
      Edit_SomaMenosJurosTitNaoEnc.Text := '0,00';
      Edit_SomaTitNaoEnc.Text := '0,00';

      if trim(Retorno._Cobrebem.dataSet.FieldByName('TIPO_API').AsString) = '' then
        Retorno.SalvarDadosRetorno(Edit_NomeArquivoRetorno.Text);

      frmImportRetorno.Refresh;

      Gauge_HistoricoRetorno.Visible := False;
      Application.MessageBox(pchar('Baixa de boletos concluída'), 'Concluído', 0);
      Edit_TotalOcorrencias.Text := '0';
      Edit_TotalOcorrenciaParaQuitar.Text := '0';
      Edit_TotalOcorrenciaQuitadas.Text := '0';
      Edit_TotalBaixa.Text := '0';
      Retorno._CBX.dataSet.EmptyDataSet;
      Retorno.vCreditosNaoEncontrados := false;

    except
      on E: Exception do
      begin
        Retorno.RollBackTransacao;
        Application.MessageBox(pchar('Ocorreu um erro. Os boletos não foram baixados no sistema. Erro:' + E.Message),
          'Erro', MB_OK + MB_ICONERROR);
        //      retorno.CobreBemX := Unassigned;
        vDadosIni.registraErro(e.Message);
        Gauge_HistoricoRetorno.Visible := false;
        BitBtn_Imprimir.Enabled := true;
        BitBtn_QuitarCreditos.Enabled := true;
        BitBtn_SomarSelecionados.Enabled := true;
        vDadosIni.GravaAuditoria('IFI001', 'QUITAR', 'FALHA', 'BOLETO', '', Retorno.buscas);
        exit;
      end;
    end;
    BitBtn_Imprimir.Enabled := true;
    BitBtn_QuitarCreditos.Enabled := true;
    BitBtn_SomarSelecionados.Enabled := true;

    vDadosIni.GravaAuditoria('IFI001', 'QUITAR', 'SUCESSO', 'BOLETO', '', Retorno.buscas);

    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_ControleBancario.CanFocus) then
      DBLookupComboBox_ControleBancario.SetFocus;
    DBLookupComboBox_ControleBancarioExit(Sender);
    DBLookupComboBox_Cobrebem.KeyValue := Retorno.vCodCobrebem;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

procedure TfrmImportRetorno.BitBtn_SomarSelecionadosClick(Sender: TObject);
begin
  inherited;
  Edit_Soma.Text := '0,00';
  Edit_SomaMenosJuros.Text := '0,00';

  try
  	Retorno._CBX.dataSet.DisableControls;
    Retorno._CBX.dataSet.First;
    while not Retorno._CBX.dataSet.Eof do
    begin
      if Retorno._CBX.dataSet.FieldByName('sel').AsString = 'S' then
      begin
        Edit_SomaMenosJuros.Text := FormatFloat(',0.00', (StrToFloat(StringReplace(Edit_SomaMenosJuros.Text, '.', '', [])) +
          (Retorno._CBX.dataSet.FieldByName('VALOR_PAGO').AsFloat -
          Retorno._CBX.dataSet.FieldByName('VALOR_JUROS').Asfloat)));
        Edit_Soma.Text := FormatFloat(',0.00', (StrToFloat(StringReplace(Edit_Soma.Text, '.', '', [])) +
          (Retorno._CBX.dataSet.FieldByName('VALOR_PAGO').AsFloat)));
      end;
      Retorno._CBX.dataSet.Next;
    end;
  finally
    Retorno._CBX.dataSet.First;
    Retorno._CBX.dataSet.EnableControls;
  end;
end;

procedure TfrmImportRetorno.BitBtn_SomarSelecionadosTitNaoEncClick(
  Sender: TObject);
begin
  inherited;
	Edit_SomaTitNaoEnc.Text := '0,00';
  Edit_SomaMenosJurosTitNaoEnc.Text := '0,00';

  try
  	Retorno._TitulosNaoEncontrados.First;
    while not Retorno._TitulosNaoEncontrados.Eof do
    begin
    	if Retorno._TitulosNaoEncontrados.FieldByName('SEL').AsString = 'S' then
      begin
        Edit_SomaMenosJurosTitNaoEnc.Text := FormatFloat(',0.00', (strtofloat(StringReplace(Edit_SomaMenosJurosTitNaoEnc.Text, '.', '', [])) +
          (Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat - Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').Asfloat)));
        Edit_SomaTitNaoEnc.Text := FormatFloat(',0.00', (strtofloat(StringReplace(Edit_SomaTitNaoEnc.Text, '.', '', [])) +
          (Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat)));
      end;

      Retorno._TitulosNaoEncontrados.Next;
    end;
  finally
    Retorno._TitulosNaoEncontrados.First;
  end;
end;

procedure TfrmImportRetorno.BitBtn_TrocarAbaLogArquivoClick(Sender: TObject);
begin
  inherited;
  PageControl_Retorno.TabIndex := 1;
end;

procedure TfrmImportRetorno.BitBtn_TrocarAbaProcessamentoClick(Sender: TObject);
begin
  inherited;
  PageControl_Retorno.TabIndex := 0;
end;

procedure TfrmImportRetorno.btCreditosVincCancClick(Sender: TObject);
begin
  inherited;
	TForm(pnCreditosVinc.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmImportRetorno.btCreditosVincOKClick(Sender: TObject);
begin
  inherited;
  if Retorno._CreditosVincular.IsEmpty then
  begin
  	Application.MessageBox(pchar('Nenhum crédito encontrado para vincular.'), 'Erro', MB_OK + MB_ICONERROR);
  	exit;
  end;

	TForm(pnCreditosVinc.Parent).ModalResult := IDOK;
end;

procedure TfrmImportRetorno.btSelectAllClick(Sender: TObject);
begin
  inherited;
  PageControl_Retorno.ActivePage := tsCreditos;
  Retorno._CBX._marcarTodos;
//  Retorno._CBX.dataSet.First;
//  while not Retorno._CBX.dataSet.Eof do
//  begin
//    DBGrid_Retorno.SelectedRows.CurrentRowSelected := true;
//    Retorno._CBX.dataSet.Next;
//  end;
end;

procedure TfrmImportRetorno.btSelectAllCredClick(Sender: TObject);
begin
  inherited;
	Retorno._CBX._marcarTodos;
end;

procedure TfrmImportRetorno.btSelectAllTitNaoEncClick(Sender: TObject);
begin
  inherited;
  Retorno._marcarTodosTemp(Retorno._TitulosNaoEncontrados);
end;

procedure TfrmImportRetorno.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  PageControl_Retorno.ActivePage := tsCreditos;
  Retorno._CBX._desmarcarTodos;
//  Retorno._CBX.dataSet.First;
//  while not Retorno._CBX.dataSet.Eof do
//  begin
//    DBGrid_Retorno.SelectedRows.CurrentRowSelected := false;
//    Retorno._CBX.dataSet.Next;
//  end;
end;

procedure TfrmImportRetorno.btUnSelectAllCredClick(Sender: TObject);
begin
  inherited;
	Retorno._CBX._desmarcarTodos;
end;

procedure TfrmImportRetorno.btUnSelectAllTitNaoEncClick(Sender: TObject);
begin
  inherited;
	Retorno._desmarcarTodosTemp(Retorno._TitulosNaoEncontrados);
end;

procedure TfrmImportRetorno.CheckBoxControlesConfClick(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesBoolean(CheckBoxControlesConf.Name, CheckBoxControlesConf.Checked);
  if (DBLookupComboBox_EmpresaUnificada.Text <> '') then
  begin
  	if CheckBoxControlesConf.Checked then
      Retorno._Controle._AbrirControleCobrebem(DBLookupComboBox_EmpresaUnificada.KeyValue)
    else
      Retorno._Controle._AbrirControle(DBLookupComboBox_EmpresaUnificada.KeyValue);
  end
  else
  begin
    if CheckBoxControlesConf.Checked then
      Retorno._Controle._AbrirControleCobrebem
    else
      Retorno._Controle._AbrirControle;
  end;
end;

procedure TfrmImportRetorno.CheckBox_LancarDescontoClick(Sender: TObject);
begin
  inherited;
  if CheckBox_LancarDesconto.Tag <> 0 then
  	exit;

  if (CheckBox_LancarDesconto.Checked) then
    _GravaConfiguracoesBoolean('LANCARDESCONTO', true)
  else
    _GravaConfiguracoesBoolean('LANCARDESCONTO', false);
end;

procedure TfrmImportRetorno.CheckBox_LancarJurosClick(Sender: TObject);
begin
  inherited;
  if CheckBox_LancarJuros.Tag <> 0 then
  	exit;

  if (CheckBox_LancarJuros.Checked) then
    _GravaConfiguracoesBoolean('LANCARJUROS', true)
  else
    _GravaConfiguracoesBoolean('LANCARJUROS', false);
end;

procedure TfrmImportRetorno.CheckBox_LancarTaxaClick(Sender: TObject);
begin
  inherited;
  if CheckBox_LancarTaxa.Tag <> 0 then
  	exit;
    
  if not vdadosini.PesqPros('IFI004', 'INCLUIR', 'LANCAR TARIFA BANCARIA', '', '', Retorno.buscas,
    true)
    then
  begin
    CheckBox_LancarTaxa.Checked := False;
    exit;
  end;

  if (CheckBox_LancarTaxa.Checked) then
    _GravaConfiguracoesBoolean('LANCARTARIFABANCARIA', true)
  else
    _GravaConfiguracoesBoolean('LANCARTARIFABANCARIA', false);
end;

procedure TfrmImportRetorno.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid_Retorno.DataSource.DataSet.FieldByName(DBGrid_Retorno.Columns[DBGrid_Retorno.SelectedIndex].FieldName).AsString;
end;

procedure TfrmImportRetorno.Copiarparareadetransferncia2Click(Sender: TObject);
begin
	Clipboard.AsText := DBGrid_TitulosNaoConciliados.DataSource.DataSet.FieldByName(DBGrid_TitulosNaoConciliados.Columns[DBGrid_TitulosNaoConciliados.SelectedIndex].FieldName).AsString;
end;

procedure TfrmImportRetorno.DBGridCreditosVincDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (TDBGrid(sender).DataSource.DataSet.FieldByName('CODIGO_EMP').AsInteger > 0) then
    if (trim(Column.Field.Dataset.FieldbyName('STATUS_C').AsString) = 'QUITADO') then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnQuitado.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;
    end;

	TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmImportRetorno.DBGrid_RetornoCellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	Retorno._CBX.checkUnCheckRow('SEL');
end;

procedure TfrmImportRetorno.DBGrid_RetornoDblClick(Sender: TObject);
begin
  inherited;
  Retorno._CBX.checkUnCheckRow('SEL');
end;

procedure TfrmImportRetorno.DBGrid_RetornoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(Sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
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
      Column.Width := 18;

    TDBGrid(Sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmImportRetorno.DBGrid_RetornoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if not Retorno._CBX.dataSet.IsEmpty then
      Retorno._CBX._marcaDesmarcaLinha;
end;

procedure TfrmImportRetorno.DBGrid_TitulosNaoConciliadosCellClick(
  Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	if not Retorno._TitulosNaoEncontrados.IsEmpty then
       Retorno._marcaDesmarcaLinhaTemp(Retorno._TitulosNaoEncontrados);
end;

procedure TfrmImportRetorno.DBGrid_TitulosNaoConciliadosDblClick(
  Sender: TObject);
begin
  inherited;
	if not Retorno._TitulosNaoEncontrados.IsEmpty then
    Retorno._marcaDesmarcaLinhaTemp(Retorno._TitulosNaoEncontrados);
end;

procedure TfrmImportRetorno.DBGrid_TitulosNaoConciliadosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(Sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
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
      Column.Width := 18;

    TDBGrid(Sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmImportRetorno.DBGrid_TitulosNaoConciliadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	 if Key = VK_SPACE then
     if not Retorno._TitulosNaoEncontrados.IsEmpty then
       Retorno._marcaDesmarcaLinhaTemp(Retorno._TitulosNaoEncontrados);
end;

procedure TfrmImportRetorno.DBLookupComboBox_CobrebemDropDown(Sender: TObject);
begin
  inherited;
  if (DBLookupComboBox_ControleBancario.Text = '') then
  begin
    Application.MessageBox('Selecione primeiramente o controle bancário',
      'Cobrebem', 0);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_ControleBancario.CanFocus) then
    	DBLookupComboBox_ControleBancario.SetFocus;
  end;
end;

procedure TfrmImportRetorno.DBLookupComboBox_CobrebemExit(Sender: TObject);
begin
  inherited;
  if (vCodigoCobrebem <> vDadosIni.IfThen(DBLookupComboBox_Cobrebem.KeyValue = null, 0, DBLookupComboBox_Cobrebem.KeyValue)) then
  begin
     Edit_NomeArquivoRetorno.Text := '';
     Retorno._TitulosNaoEncontrados.EmptyDataSet;
  end;

	if vDadosIni.IfThen(DBLookupComboBox_Cobrebem.KeyValue = null, 0, DBLookupComboBox_Cobrebem.KeyValue) > 0 then
  	vCodigoCobrebem := DBLookupComboBox_Cobrebem.KeyValue
  else
  	vCodigoCobrebem := 0;
end;

procedure TfrmImportRetorno.DBLookupComboBox_ControleBancarioExit(
  Sender: TObject);
begin
  inherited;
  if vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue) > 0 then
  begin
    if Retorno._Empresas.dataSet.RecordCount > 1 then
    	Retorno._Cobrebem._PesquisaCobrebem(
      	DBLookupComboBox_ControleBancario.KeyValue,
        vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null,
        	0,
	        DBLookupComboBox_EmpresaUnificada.KeyValue))
    else
	    Retorno._Cobrebem._PesquisaCobrebem(DBLookupComboBox_ControleBancario.KeyValue);

    if (Retorno._Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger = 0) then
    begin
      Application.MessageBox(pchar('Cobrebem inválido, no cadastro do convênio selecione o controle de entrada.'), 'Erro', MB_OK + MB_ICONERROR);
      DBLookupComboBox_ControleBancario.KeyValue := Null;
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_ControleBancario.CanFocus) then
      	DBLookupComboBox_ControleBancario.SetFocus;
    end
    else
    begin
      if (Retorno._Cobrebem.dataSet.RecordCount < 2) then
        DBLookupComboBox_Cobrebem.KeyValue :=
          Retorno._Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsString;
    end;
  end;

  if vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue) > 0 then
    vCodigoCtrl := DBLookupComboBox_ControleBancario.KeyValue
  else
  	vCodigoCtrl := 0;

  if vDadosIni.IfThen(DBLookupComboBox_Cobrebem.KeyValue = null, 0, DBLookupComboBox_Cobrebem.KeyValue) > 0 then
  	vCodigoCobrebem := DBLookupComboBox_Cobrebem.KeyValue
  else
  	vCodigoCobrebem := 0;
end;

procedure TfrmImportRetorno.DBLookupComboBox_EmpresaUnificadaExit(
  Sender: TObject);
begin
  inherited;
  if (vCodEmpresa > 0)
  	and (vCodEmpresa <> vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue)) then
  begin
  	if CheckBoxControlesConf.Checked then
      Retorno._Controle._AbrirControleCobrebem(
      	vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue))
    else
      Retorno._Controle._AbrirControle(
      	vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue));

    if Retorno._Controle.dataSet.RecordCount = 1 then
    	DBLookupComboBox_ControleBancario.KeyValue := Retorno._Controle.dataSet.FieldByName('CODIGO_CTRL').AsInteger
    else
    	DBLookupComboBox_ControleBancario.KeyValue := 0;

    if vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue) <= 0 then
      Retorno._Cobrebem._AbrirCobrebem(0)
    else if Retorno._Empresas.dataSet.RecordCount > 1 then
      Retorno._Cobrebem._PesquisaCobrebem(
        vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue),
        vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue))
    else
      Retorno._Cobrebem._PesquisaCobrebem(
        vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue));

    if (Retorno._Controle.dataSet.RecordCount = 1) and (Retorno._Cobrebem.dataSet.RecordCount = 1) then
      DBLookupComboBox_Cobrebem.KeyValue := Retorno._Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger
    else
    	DBLookupComboBox_Cobrebem.KeyValue := 0;

    Edit_NomeArquivoRetorno.Text := '';
  end
	else if vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue) > 0 then
  begin
  	if CheckBoxControlesConf.Checked then
      Retorno._Controle._AbrirControleCobrebem(
      	vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue))
    else
      Retorno._Controle._AbrirControle(
      	vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue));

    if Retorno._Controle.dataSet.RecordCount = 1 then
    	DBLookupComboBox_ControleBancario.KeyValue := Retorno._Controle.dataSet.FieldByName('CODIGO_CTRL').AsInteger;

    if vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue) <= 0 then
      Retorno._Cobrebem._AbrirCobrebem(0)
    else if Retorno._Empresas.dataSet.RecordCount > 1 then
      Retorno._Cobrebem._PesquisaCobrebem(
        vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue),
        vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue))
    else
      Retorno._Cobrebem._PesquisaCobrebem(
        vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue));

    if (Retorno._Controle.dataSet.RecordCount = 1) and (Retorno._Cobrebem.dataSet.RecordCount = 1) then
      DBLookupComboBox_Cobrebem.KeyValue := Retorno._Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger;
  end;

  if vDadosIni.IfThen(DBLookupComboBox_EmpresaUnificada.KeyValue = null, 0, DBLookupComboBox_EmpresaUnificada.KeyValue) > 0 then
  	vCodEmpresa := DBLookupComboBox_EmpresaUnificada.KeyValue
  else
  	vCodEmpresa := 0;

  if vDadosIni.IfThen(DBLookupComboBox_ControleBancario.KeyValue = null, 0, DBLookupComboBox_ControleBancario.KeyValue) > 0 then
	  vCodigoCtrl := DBLookupComboBox_ControleBancario.KeyValue
  else
  	vCodigoCtrl := 0;

  if vDadosIni.IfThen(DBLookupComboBox_Cobrebem.KeyValue = null, 0, DBLookupComboBox_Cobrebem.KeyValue) > 0 then
  	vCodigoCobrebem := DBLookupComboBox_Cobrebem.KeyValue
  else
  	vCodigoCobrebem := 0;
end;

procedure TfrmImportRetorno.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  //  QRLabel_n_doc_c.Caption := trim(Retorno._vQuitacaoCredito.dataSet.FieldByName('N_DOC_C').AsString);
  QRLabel_n_doc.Caption :=
    trim(Retorno._vRelQuitacaoCredito.dataSet.FieldByName('N_DOC_C').AsString);
  //
  //  Valor :=   Valor  +
  //   Retorno._vQuitacaoCredito.dataSet.FieldByName('VALOR_C').AsFloat;
  //
  //   ValorJuros := ValorJuros +
  //   Retorno._vQuitacaoCredito.dataSet.FieldByName('VALOR_CORR').AsFloat;
  //
  //  QRLabel_Valor.Caption := Format('%m', [Valor]);
  //
  //   QRLabel_ValorJuros.Caption := Format('%m',[ValorJuros]);

  Valor := Valor +
    //Retorno._vQuitacaoCredito.dataSet.FieldByName('VALOR_C').AsFloat;
  Retorno._vRelQuitacaoCredito.dataSet.FieldByName('VALOR_C').AsFloat;

  ValorJuros := ValorJuros +
    //   Retorno._vQuitacaoCredito.dataSet.FieldByName('VALOR_CORR').AsFloat;
  Retorno._vRelQuitacaoCredito.dataSet.FieldByName('VALOR_CORR').AsFloat;

  //  QRLabel_Valor.Caption := Format('%m', [Valor]);
  QRLabel_vl.Caption := Format('%m', [Valor]);

  //   QRLabel_ValorJuros.Caption := Format('%m',[ValorJuros]);
  QRLabel_vlcorr.Caption := Format('%m', [ValorJuros]);
end;

procedure TfrmImportRetorno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Retorno._CBX.dataset.Tag = 1 then
    Retorno._CBX.dataSet.EmptyDataSet;

  if Retorno._Lancamentos.dataSet.Tag = 1 then
    Retorno._Lancamentos.dataSet.EmptyDataSet;
  Retorno._Lancamentos.dataSet.Tag := 0;
  Retorno._Lancamentos.Cancel;
  Retorno._Lancamentos.RollBackTransacao;
  Retorno._Lancamentos.Free;

  Retorno.Cancel;
  Retorno.RollBackTransacao;
  Retorno.CobreBemX := Unassigned;
  Retorno.free;
  Action := caFree;
  frmImportRetorno := nil;
end;

procedure TfrmImportRetorno.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	Self.fechar := True;
  inherited;
end;

procedure TfrmImportRetorno.FormCreate(Sender: TObject);
begin
  inherited;
  Retorno := TRetorno.create;
  DBGrid_Retorno.DataSource := Retorno._CBX._dtsource;
  DBGrid_TitulosNaoConciliados.DataSource := Retorno._TitulosNaoEncontradosDtSource;
  DBGridCreditosVinc.DataSource := Retorno._CreditosVincularDtSource;
end;

procedure TfrmImportRetorno.FormShow(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoEmpresasUnificadas(Retorno.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    frmImportRetorno.fechar := True;
    PostMessage(frmImportRetorno.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  vCodEmpresa := 0;
  vCodigoCtrl := 0;
  vCodigoCobrebem := 0;

  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
                	  'Processo "BOL041" VINCULAR TITULO NAO ENCONTRADO A CREDITO COM VALOR DIFERENTE' + #13 +
                    'Processo "BOL042" VINCULAR TITULO NAO ENCONTRADO A CREDITO COM DATA DE VENCIMENTO DIFERENTE' + #13 +
                    'Processo "IFI005" PERMITIR QUITAR ARQUIVO DE RETORNO COM CREDITOS NÃO ENCONTRADOS';

	Retorno._Empresas._AbrirEmpresaUnif;

  Retorno._Cobrebem._AbrirCobrebem;

  CheckBoxControlesConf.Checked := _LerConfiguracoesRegistroBoolean(CheckBoxControlesConf.Name);

  if CheckBoxControlesConf.Checked then
  	Retorno._Controle._AbrirControleCobrebem
	else
	  Retorno._Controle._AbrirControle;

  Retorno.CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
//  NomeDoLog := ExtractFilePath(Application.ExeName) + 'Bol.log';
	DBLookupComboBox_EmpresaUnificada.KeyValue := StrToInt(vDadosIni.codEmpresa);
	pnEmpresaUnificada.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  DBLookupComboBox_EmpresaUnificadaExit(Sender);

  TabSheet_Relatorio.TabVisible := false;
  TabSheet_Relatorio1.TabVisible := false;
  TabSheet_CreditosVinc.TabVisible := false;

  PageControl_Retorno.ActivePage := tsCreditos;
  tsCreditos.Show;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_EmpresaUnificada.CanFocus) then
  	DBLookupComboBox_EmpresaUnificada.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox_ControleBancario.CanFocus) then
  	DBLookupComboBox_ControleBancario.SetFocus;
end;

procedure TfrmImportRetorno.GroupBox_DadosEnter(Sender: TObject);
begin
  inherited;
  BitBtn_Imprimir.Caption := 'Imprimir - [IFI003]';
end;

procedure TfrmImportRetorno.PageFooterBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  Valor := 0;
  ValorJuros := 0;
end;

procedure TfrmImportRetorno.QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLabel42.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  QRDBText22.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
end;

procedure TfrmImportRetorno.QuickRep_RelRetornoPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Condições de Pagamento');
end;

procedure TfrmImportRetorno.QuickRep_RetornoPreview(Sender: TObject);
begin
  inherited;

  // QRLabel_n_doc_c.Caption := trim(Retorno._vQuitacaoCredito.dataSet.FieldByName('N_DOC_C').AsString);

  vDadosIni.VisualizaRelQrp(Sender, 'Condições de Pagamento');
end;

procedure TfrmImportRetorno.SpeedButton5Click(Sender: TObject);
var
  i, j: integer;
begin

  with dtmImportPDVFinan do
  begin
    if OpenDialog_Retorno.Execute then
    begin
      for i := 0 to length(OpenDialog_Retorno.FileName) do
        if OpenDialog_Retorno.FileName[i] = '\' then
          j := i;
      Retorno._NomeArquivoRetorno := copy(OpenDialog_Retorno.FileName, j + 1,
        length(OpenDialog_Retorno.FileName));
      Retorno._DiretorioRetorno := copy(OpenDialog_Retorno.FileName, 0, j);
      Edit_NomeArquivoRetorno.Text := OpenDialog_Retorno.FileName;
    end;

  end;
end;

procedure TfrmImportRetorno._PreencheMemoCobrebem(i: integer);
var
  j: integer;
  vdataOcorrencia: string;
  vdataCredito: string;
  vtemp: string;
begin
  Memo_Retorno.Lines.Add(vDadosIni.StrZero(i + 1, 2) + ' - NossoNumero = ' +
    Retorno.CobreBemX.OcorrenciasCobranca[i].NossoNumero);
  Memo_Retorno.Lines.Add('CodigoOcorrencia = ' +
    Retorno.CobreBemX.OcorrenciasCobranca[i].CodigoOcorrencia);

  vdataOcorrencia := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].DataOcorrencia);
  Memo_Retorno.Lines.Add('DataOcorrencia = ' +
    vdataOcorrencia);

  vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].Pagamento);
  Memo_Retorno.Lines.Add('PagamentoRealizado = ' + vDadosIni.IfThen(UpperCase(vtemp) = 'TRUE', 'Sim', 'Não'));

  vdataCredito := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].DataCredito);
  Memo_Retorno.Lines.Add('DataCredito = ' +
    vDadosIni.IfThen(vtemp = '', '', vdataCredito));

  if (Retorno.CobreBemX.OcorrenciasCobranca[i].ValorCredito > Retorno.CobreBemX.OcorrenciasCobranca[i].ValorPago) then
  begin
  	vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].ValorCredito);
    Memo_Retorno.Lines.Add('ValorPago = R$ ' +
    	FormatFloat('0.00', StrToFloat(vDadosIni.IfThen(vtemp = '', '0,00', vtemp))));
  end
  else
  begin
  	vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].ValorPago);
		Memo_Retorno.Lines.Add('ValorPago = R$ ' +
    	FormatFloat('0.00', StrToFloat(vDadosIni.IfThen(vtemp = '', '0,00', vtemp))));
  end;

  vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].ValorMultaPaga);
  Memo_Retorno.Lines.Add('ValorMultaPaga = R$ ' +
    FormatFloat('0.00', StrToFloat(vDadosIni.IfThen(vtemp = '', '0,00', vtemp))));

  vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].ValorJurosPago);
  Memo_Retorno.Lines.Add('ValorJurosPago = R$ ' +
    FormatFloat('0.00', StrToFloat(vDadosIni.IfThen(vtemp = '', '0,00', vtemp))));

  vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].ValorTaxaCobranca);
  Memo_Retorno.Lines.Add('ValorTaxaCobranca = R$ ' +
    FormatFloat('0.00', StrToFloat(vDadosIni.IfThen(vtemp = '', '0,00', vtemp))));

  if (Retorno.CobreBemX.OcorrenciasCobranca[i].ValorCredito > Retorno.CobreBemX.OcorrenciasCobranca[i].ValorPago) then
  begin
  	vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].ValorPago);
    Memo_Retorno.Lines.Add('ValorCredito = R$ ' +
  	  FormatFloat('0.00', StrToFloat(vDadosIni.IfThen(vtemp = '',	'0,00', vtemp))));
  end
  else
  begin
  	vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].ValorCredito);
	  Memo_Retorno.Lines.Add('ValorCredito = R$ ' +
  	  FormatFloat('0.00', StrToFloat(vDadosIni.IfThen(vtemp = '', '0,00', vtemp))));
  end;
  Memo_Retorno.Lines.Add('NumeroDocumento = ' +
    Retorno.CobreBemX.OcorrenciasCobranca[i].NumeroDocumento);

  vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].ValorDesconto);
  Memo_Retorno.Lines.Add('ValorDesconto = R$ ' +
    FormatFloat('0.00', StrToFloat(vDadosIni.IfThen(vtemp = '', '0,00', vtemp))));

  Memo_Retorno.Lines.Add('Banco = ' + Retorno.CobreBemX.OcorrenciasCobranca[i].Banco);
  Memo_Retorno.Lines.Add('Carteira = ' + Retorno.CobreBemX.OcorrenciasCobranca[i].Carteira);
  Memo_Retorno.Lines.Add('Agencia = ' + Retorno.CobreBemX.OcorrenciasCobranca[i].Agencia);
  Memo_Retorno.Lines.Add('ContaCorrente = ' +
    Retorno.CobreBemX.OcorrenciasCobranca[i].ContaCorrente);
  Memo_Retorno.Lines.Add('CodigoCedente = ' +
    Retorno.CobreBemX.OcorrenciasCobranca[i].CodigoCedente);
  Memo_Retorno.Lines.Add('NumeroControle = ' +
    Retorno.CobreBemX.OcorrenciasCobranca[i].NumeroControle);

  vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].ValorOutrosAcrescimos);
  Memo_Retorno.Lines.Add('ValorOutrosAcrescimos = R$ ' +
    FormatFloat('0.00', StrToFloat(vDadosIni.IfThen(vtemp = '', '0,00', vtemp))));

  for j := 0 to Retorno.CobreBemX.OcorrenciasCobranca[i].MotivosOcorrencia.Count - 1 do
  begin
    Memo_Retorno.Lines.Add('Motivo ' + IntToStr(j) + ' = ' +
      Retorno.CobreBemX.OcorrenciasCobranca[i].MotivosOcorrencia[j].Codigo + ' -> ' +
      Retorno.CobreBemX.OcorrenciasCobranca[i].MotivosOcorrencia[j].Descricao + '(' +
        Retorno.vstatusitem + ')');
  end;
  if Trim(Retorno.vVerificaControle) <> '' then
    Memo_Retorno.Lines.Add('Atenção: ' + Retorno.vVerificaControle + '');
  Memo_Retorno.Lines.Add('');

  if (trim(Retorno.vstatusitem) = 'NÃO ENCONTRADO NO CONTROLE DE CREDITOS') then
  begin
    Retorno._TitulosNaoEncontrados.Insert;
    Retorno._TitulosNaoEncontrados.FieldByName('SEL').AsString := 'S';
    Retorno._TitulosNaoEncontrados.FieldByName('COD_EMPRESA').AsInteger := Retorno.vCodEmpresa;

    vtemp := trim(Retorno.CobreBemX.OcorrenciasCobranca[i].DataOcorrencia);
    Retorno._TitulosNaoEncontrados.FieldByName('DATA_EM_BOL').AsString :=
    	vDadosIni.IfThen((trim(vdataCredito) = '') or (trim(vdataCredito) = '00/00/0000'), trim(vdataOcorrencia), trim(vdataCredito));
    Retorno._TitulosNaoEncontrados.FieldByName('DATA_VEN_BOL').Value := Null;

    if (trim(vdataCredito) <> '') and (trim(vdataCredito) <> '00/00/0000') then
	    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTODATA').AsString := vdataCredito
    else if (trim(vdataOcorrencia) <> '') and (trim(vdataOcorrencia) <> '00/00/0000') then
    	Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTODATA').AsString := vdataOcorrencia;

    Retorno._TitulosNaoEncontrados.FieldByName('TITULONOSSONUMERO').AsString :=
    	Retorno.CobreBemX.OcorrenciasCobranca[i].NossoNumero;
    Retorno._TitulosNaoEncontrados.FieldByName('TITULONUMERODOCUMENTO').AsString :=
    	Retorno.CobreBemX.OcorrenciasCobranca[i].NumeroDocumento;
    Retorno._TitulosNaoEncontrados.FieldByName('TITULODATAVENCIMENTO').Value := Null;

    if (Retorno.CobreBemX.OcorrenciasCobranca[i].ValorCredito > Retorno.CobreBemX.OcorrenciasCobranca[i].ValorPago) then
    begin
    	Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat :=
        Retorno.CobreBemX.OcorrenciasCobranca[i].ValorCredito;
      Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').AsFloat :=
	    	Retorno.CobreBemX.OcorrenciasCobranca[i].ValorPago;
    end
    else
    begin
      Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat :=
        Retorno.CobreBemX.OcorrenciasCobranca[i].ValorPago;
      Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').AsFloat :=
      	Retorno.CobreBemX.OcorrenciasCobranca[i].ValorCredito;
    end;

    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORTAXACOBRANCA').AsFloat :=
      Retorno.CobreBemX.OcorrenciasCobranca[i].ValorTaxaCobranca +
      Retorno.CobreBemX.OcorrenciasCobranca[i].ValorOutrasDespesas +
      Retorno.CobreBemX.OcorrenciasCobranca[i].ValorIOF -
      Retorno.CobreBemX.OcorrenciasCobranca[i].ValorDesconto -
      Retorno.CobreBemX.OcorrenciasCobranca[i].ValorAbatimento;

    if (Retorno.CobreBemX.OcorrenciasCobranca[i].ValorMultaPaga +
	      Retorno.CobreBemX.OcorrenciasCobranca[i].ValorOutrosAcrescimos > 0) then
    begin
      Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORACRESCIMOS').AsFloat :=
        Retorno.CobreBemX.OcorrenciasCobranca[i].ValorMultaPaga +
        Retorno.CobreBemX.OcorrenciasCobranca[i].ValorOutrosAcrescimos;
    end
    else if (Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat > Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').AsFloat) then
    begin
      Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORACRESCIMOS').AsFloat :=
      	Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat -
        Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').AsFloat;
    end
    else
    begin
      Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORACRESCIMOS').AsFloat := 0;
    end;

    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALOROUTROSCREDITOS').AsFloat :=
    	0;
    Retorno._TitulosNaoEncontrados.FieldByName('CODIGOMOVIMENTO').AsString :=
    	Retorno.CobreBemX.OcorrenciasCobranca[i].MotivosOcorrencia[Retorno.CobreBemX.OcorrenciasCobranca[i].MotivosOcorrencia.Count - 1].Codigo;
    Retorno._TitulosNaoEncontrados.FieldByName('DESCRICAO_MOVIMENTO').AsString :=
    	Retorno.CobreBemX.OcorrenciasCobranca[i].MotivosOcorrencia[Retorno.CobreBemX.OcorrenciasCobranca[i].MotivosOcorrencia.Count - 1].Descricao;
  	Retorno._TitulosNaoEncontrados.Post;
  end;
end;

procedure TfrmImportRetorno._PreencheMemoConvenio(pDatasetCobrebem: TDataset; pDatasetCobrancaBancaria: TDataset);
begin
  Memo_Retorno.Lines.Add(vDadosIni.StrZero(pDatasetCobrancaBancaria.RecNo, 2) + ' - NossoNumero = ' +
    pDatasetCobrancaBancaria.FieldByName('NOSSO_NUMERO_BANCO').AsString);
  Memo_Retorno.Lines.Add('CodigoOcorrencia = ' +
    pDatasetCobrancaBancaria.FieldByName('API_CODIGO_MOVIMENTO').AsString);
  Memo_Retorno.Lines.Add('DataOcorrencia = ' +
    FormatDateTime('dd/mm/yyyy', pDatasetCobrancaBancaria.FieldByName('API_PGT_DATA').AsDateTime));
    
  Memo_Retorno.Lines.Add('PagamentoRealizado = ' +
    vDadosIni.IfThen(pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORPAGO').AsFloat > 0, 'Sim', 'Não'));
    
  Memo_Retorno.Lines.Add('DataCredito = ' + vDadosIni.IfThen(pDatasetCobrancaBancaria.FieldByName('API_PGT_DATACREDITO').IsNull,
    '', FormatDateTime('dd/mm/yyyy', pDatasetCobrancaBancaria.FieldByName('API_PGT_DATACREDITO').AsDateTime)));
    
  Memo_Retorno.Lines.Add('ValorPago = R$ ' +
    FormatFloat('0.00', pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORPAGO').AsFloat));
  Memo_Retorno.Lines.Add('ValorMultaPaga = R$ ' +
    FormatFloat('0.00', 0));
  Memo_Retorno.Lines.Add('ValorJurosPago = R$ ' +
    FormatFloat('0.00', 0));
  Memo_Retorno.Lines.Add('ValorTaxaCobranca = R$ ' +
    FormatFloat('0.00', pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORTAXACOBRANCA').AsFloat));
  Memo_Retorno.Lines.Add('ValorCredito = R$ ' +
    FormatFloat('0.00', pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORCREDITO').AsFloat));
  Memo_Retorno.Lines.Add('NumeroDocumento = ' +
    pDatasetCobrancaBancaria.FieldByName('NOSSO_NUMERO_BANCO').AsString);
  Memo_Retorno.Lines.Add('ValorAcrescimos = R$ ' +
    FormatFloat('0.00', pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORACRESCIMOS').AsFloat));
  Memo_Retorno.Lines.Add('ValorDesconto = R$ ' +
    FormatFloat('0.00', pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORDESCONTO').AsFloat));
  Memo_Retorno.Lines.Add('ValorAbatimento = R$ ' +
    FormatFloat('0.00', pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORABATIMENTO').AsFloat));
  Memo_Retorno.Lines.Add('ValorIOF = R$ ' +
    FormatFloat('0.00', pDatasetCobrancaBancaria.FieldByName('API_PGT_VALOR_IOF').AsFloat));
  Memo_Retorno.Lines.Add('ValorOutrasDespesas = R$ ' +
    FormatFloat('0.00', pDatasetCobrancaBancaria.FieldByName('API_PGT_VALOROUTRASDESPESAS').AsFloat));
  Memo_Retorno.Lines.Add('ValorOutrasCreditos = R$ ' +
    FormatFloat('0.00', pDatasetCobrancaBancaria.FieldByName('API_PGT_VALOROUTROSCREDITOS').AsFloat));

  Memo_Retorno.Lines.Add('Banco = ' + pDatasetCobrebem.FieldByName('BANCO').AsString);
  Memo_Retorno.Lines.Add('Carteira = ' + pDatasetCobrebem.FieldByName('OUTRODADOCONFIGURACAO1').AsString);
  Memo_Retorno.Lines.Add('Agencia = ' + pDatasetCobrebem.FieldByName('CODIGOAGENCIA').AsString);
  Memo_Retorno.Lines.Add('ContaCorrente = ' + pDatasetCobrebem.FieldByName('NUMEROCONTACORRENTE').AsString);
  Memo_Retorno.Lines.Add('CodigoCedente = ' + pDatasetCobrebem.FieldByName('CODIGOCEDENTE').AsString);

  Memo_Retorno.Lines.Add('Motivo ' + IntToStr(0) + ' = ' +
    pDatasetCobrancaBancaria.FieldByName('API_CODIGO_MOVIMENTO').AsString + ' -> ' +
    pDatasetCobrancaBancaria.FieldByName('API_DESCR_MOVIMENTO').AsString + '(' +
      Retorno.vstatusitem + ')');

  if Trim(Retorno.vVerificaControle) <> '' then
    Memo_Retorno.Lines.Add('Atenção: ' + Retorno.vVerificaControle + '');
  Memo_Retorno.Lines.Add('');

  if (trim(Retorno.vstatusitem) = 'NÃO ENCONTRADO NO CONTROLE DE CREDITOS') then
  begin
    Retorno._TitulosNaoEncontrados.Insert;
    Retorno._TitulosNaoEncontrados.FieldByName('SEL').AsString := 'S';
    Retorno._TitulosNaoEncontrados.FieldByName('COD_EMPRESA').AsInteger := Retorno.vCodEmpresa;

    Retorno._TitulosNaoEncontrados.FieldByName('DATA_EM_BOL').AsDateTime :=
    	pDatasetCobrancaBancaria.FieldByName('DATA_EM_BOL').AsDateTime;
    Retorno._TitulosNaoEncontrados.FieldByName('DATA_VEN_BOL').AsDateTime :=
    	pDatasetCobrancaBancaria.FieldByName('DATA_VEN_BOL').AsDateTime;
    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTODATA').AsDateTime :=
    	pDatasetCobrancaBancaria.FieldByName('API_PGT_DATA').AsDateTime;

    Retorno._TitulosNaoEncontrados.FieldByName('TITULONOSSONUMERO').AsString :=
    	pDatasetCobrancaBancaria.FieldByName('NOSSO_NUMERO_BANCO').AsString;
    Retorno._TitulosNaoEncontrados.FieldByName('TITULONUMERODOCUMENTO').AsString :=
    	pDatasetCobrancaBancaria.FieldByName('TITULONUMERODOCUMENTO').AsString;
    Retorno._TitulosNaoEncontrados.FieldByName('TITULODATAVENCIMENTO').AsDateTime :=
    	pDatasetCobrancaBancaria.FieldByName('TITULODATAVENCIMENTO').AsDateTime;
    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat :=
    	pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORPAGO').AsFloat;
    if pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORCREDITO').AsFloat > 0 then
    begin
	    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').AsFloat :=
  	  	pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORCREDITO').AsFloat;
    end
    else
    begin
    	Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').AsFloat :=
      	pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORPAGO').AsFloat -
        pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORACRESCIMOS').AsFloat +
        pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORDESCONTO').AsFloat;
    end;
    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORTAXACOBRANCA').AsFloat :=
    	pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORTAXACOBRANCA').AsFloat +
      pDatasetCobrancaBancaria.FieldByName('API_PGT_VALOROUTRASDESPESAS').AsFloat +
      pDatasetCobrancaBancaria.FieldByName('API_PGT_VALOR_IOF').AsFloat -
      pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORDESCONTO').AsFloat -
      pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORABATIMENTO').AsFloat;

  	if pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORACRESCIMOS').AsFloat > 0 then
    begin
	    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORACRESCIMOS').AsFloat :=
  	  	pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORACRESCIMOS').AsFloat;
    end
    else if (Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat > Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').AsFloat) then
    begin
      Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORACRESCIMOS').AsFloat :=
      	Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').AsFloat -
        Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').AsFloat;
    end
    else
    begin
      Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORACRESCIMOS').AsFloat := 0;
    end;

    Retorno._TitulosNaoEncontrados.FieldByName('PAGAMENTOVALOROUTROSCREDITOS').AsFloat :=
    	pDatasetCobrancaBancaria.FieldByName('API_PGT_VALOROUTROSCREDITOS').AsFloat;
    Retorno._TitulosNaoEncontrados.FieldByName('CODIGOMOVIMENTO').AsString :=
    	pDatasetCobrancaBancaria.FieldByName('API_CODIGO_MOVIMENTO').AsString;
    Retorno._TitulosNaoEncontrados.FieldByName('DESCRICAO_MOVIMENTO').AsString :=
    	pDatasetCobrancaBancaria.FieldByName('API_DESCR_MOVIMENTO').AsString;
  	Retorno._TitulosNaoEncontrados.Post;
  end;
end;

end.

