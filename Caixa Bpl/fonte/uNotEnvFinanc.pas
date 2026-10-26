unit uNotEnvFinanc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmNotEnvFinanc = class(TfrmCadPadraoM)
    GroupBox4: TGroupBox;
    groupAdicional: TGroupBox;
    Label109: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    GroupBox5: TGroupBox;
    ckAvisoVenc: TCheckBox;
    ckCreditosAtraso: TCheckBox;
    ckAgradecimento: TCheckBox;
    GroupBox6: TGroupBox;
    ckStatusNO: TCheckBox;
    ckStatusEP: TCheckBox;
    ckStatusAC: TCheckBox;
    ckStatusER: TCheckBox;
    ckStatusPP: TCheckBox;
    TabSheet4: TTabSheet;
    pnDadosAPI: TPanel;
    Panel10: TPanel;
    btnDadosAPI: TBitBtn;
    PageControl4: TPageControl;
    TabSheet_Cad_Mensageria: TTabSheet;
    DBGridMensageriaPost: TDBGrid;
    SplitterMensageriaPost: TSplitter;
    DBMemoMensageriaPost: TDBMemo;
    TabSheet_Ler_Mensageria: TTabSheet;
    DBGridMensageriaGet: TDBGrid;
    SplitterMensageriaGet: TSplitter;
    DBMemoMensageriaGet: TDBMemo;
    TabSheet_Update_Mensageria: TTabSheet;
    DBGridMensageriaUpdate: TDBGrid;
    SplitterMensageriaUpdate: TSplitter;
    DBMemoMensageriaUpdate: TDBMemo;
    GroupBox7: TGroupBox;
    Label8: TLabel;
    Label12: TLabel;
    ckOrigemErp: TCheckBox;
    ckOrigemBot: TCheckBox;
    ckDestinoErp: TCheckBox;
    ckDestinoBot: TCheckBox;
    Label110: TLabel;
    procedure SplitterMensageriaUpdateMoved(Sender: TObject);
    procedure SplitterMensageriaGetMoved(Sender: TObject);
    procedure SplitterMensageriaPostMoved(Sender: TObject);
    procedure PageControl4Change(Sender: TObject);
    procedure btnDadosAPIClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure groupAdicionalExit(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;
  private
    { Private declarations }
    vDtDia: TDate;
  public
    { Public declarations }
  end;

var
  frmNotEnvFinanc: TfrmNotEnvFinanc;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;

implementation

uses
  uClassesContasAReceber, uDtmContasAReceber, uDtmAtivo, uDadosIni, DB;

function _markdownToHtml(Markdown: WideString): WideString; stdcall; external 'MD5XE3.dll'; 

{$R *.dfm}

procedure TfrmNotEnvFinanc.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  try
    if not vDadosIni.PesqPros('CAR103', 'CONSULTA', '', 'NOTIFICACAO_CREDITOS', '',
      vNotEnvFinanc.buscas, true) then
      Exit;
    inherited;
    
    vNotEnvFinanc.rNotEnv.vCampo := ComboBox1.Text;
    vNotEnvFinanc.rNotEnv.vCondicao := ComboBox3.Text;
    vNotEnvFinanc.rNotEnv.vValor := trim(MaskEdit3.Text);
    vNotEnvFinanc.rNotEnv.vDataIni := MaskEdit1.Text;
    vNotEnvFinanc.rNotEnv.vDataFim := MaskEdit2.Text;
    vNotEnvFinanc.rNotEnv.vPorData := MaskEdit1.Visible;
    vNotEnvFinanc.rNotEnv.vCampoAd := ComboBox11.Text;
    vNotEnvFinanc.rNotEnv.vValorAd := trim(MaskEdit7.Text);
    vNotEnvFinanc.rNotEnv.vDataIniAd := MaskEdit9.Text;
    vNotEnvFinanc.rNotEnv.vDataFimAd := MaskEdit8.Text;
    vNotEnvFinanc.rNotEnv.vCondicaoAd := ComboBox12.Text;
    vNotEnvFinanc.rNotEnv.vPorDataAd := MaskEdit9.Visible;
    vNotEnvFinanc.rNotEnv.vAdicional := CheckBox1.Checked;
    vNotEnvFinanc.rNotEnv.vAvancada := CheckBox3.Checked;
    vNotEnvFinanc.rNotEnv.vAvisoVenc := ckAvisoVenc.Checked;
    vNotEnvFinanc.rNotEnv.vCreditosAtraso := ckCreditosAtraso.Checked;
    vNotEnvFinanc.rNotEnv.vAgradecimento := ckAgradecimento.Checked;
    vNotEnvFinanc.rNotEnv.vStatusNO := ckStatusNO.Checked;
    vNotEnvFinanc.rNotEnv.vStatusEP := ckStatusEP.Checked;
    vNotEnvFinanc.rNotEnv.vStatusAC := ckStatusAC.Checked;
    vNotEnvFinanc.rNotEnv.vStatusER := ckStatusER.Checked;
    vNotEnvFinanc.rNotEnv.vStatusPP := ckStatusPP.Checked;
    vNotEnvFinanc.rNotEnv.vOrigemErp := ckOrigemErp.Checked;
    vNotEnvFinanc.rNotEnv.vOrigemBot := ckOrigemBot.Checked;
    vNotEnvFinanc.rNotEnv.vDestinoErp := ckDestinoErp.Checked;
    vNotEnvFinanc.rNotEnv.vDestinoBot := ckDestinoBot.Checked;
    vNotEnvFinanc._defineSqlAdicional;

    Screen.Cursor := crHourGlass;
    if not vNotEnvFinanc.ConsultaCampos('NOTIFICACAO_CREDITOS', vNotEnvFinanc.rNotEnv.vValor, ComboBox1.Text,
      combobox3.Text, 'NOTIFICACAO_CREDITOS.CODIGO', true, vDadosIni.codEmpresa,
      'NOTIFICACAO_CREDITOS.*, ' +
      '	CONTROLE_CREDITOS.N_DOC_C, CONTROLE_CREDITOS.DATA_REC_C, CONTROLE_CREDITOS.DATA_VENC_C, ' +
      ' CONTROLE_CREDITOS.VALOR_C, CONTROLE_CREDITOS.VALOR_CORR, CONTROLE_CREDITOS.STATUS_C,' +
      ' CONTROLE_CREDITOS.DATQ_C, CONTROLE_CREDITOS.TIPO_DOC_C, ' +
      ' CONTROLE_CREDITOS.CODIGO_CTRL, CONTROLES.NOME_CTRL, CONTROLE_CREDITOS.NOSSO_NUMERO_BANCO, ' +
      ' CONTROLE_CREDITOS.NPARCELA, CONTROLE_CREDITOS.QTDE_PARC, ' +
      ' MSG_APLICATIVO.APLICATIVO, MSG_PLATAFORMA.PLATAFORMA, ' +
      ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CPFCGC ',
      ' INNER JOIN MSG_APLICATIVO ON ' +
      '			MSG_APLICATIVO.ID = NOTIFICACAO_CREDITOS.ID_MSG_APLICATIVO ' +
      ' INNER JOIN MSG_PLATAFORMA ON '  +
      '			MSG_PLATAFORMA.ID = NOTIFICACAO_CREDITOS.ID_MSG_PLATAFORMA ' +
      '			AND MSG_PLATAFORMA.COD_EMPRESA = NOTIFICACAO_CREDITOS.COD_EMPRESA ' +
      ' INNER JOIN CONTROLE_CREDITOS ON ' +
      ' 		CONTROLE_CREDITOS.COD_CRED = NOTIFICACAO_CREDITOS.COD_CRED ' +
      ' 		AND CONTROLE_CREDITOS.CODIGO_EMP = NOTIFICACAO_CREDITOS.COD_EMPRESA ' +
      ' 		AND CONTROLE_CREDITOS.COD_EMP_MULT = NOTIFICACAO_CREDITOS.COD_EMP_MULT ' +
      ' LEFT JOIN EMPRESA ON EMPRESA.COD_EMPRESA = CONTROLE_CREDITOS.COD_EMP_MULT ' +
      ' INNER JOIN CLIENTES ON ' +
      '   	CLIENTES.COD_CLIENTE = NOTIFICACAO_CREDITOS.COD_CLIENTE ' +
      '   	AND CLIENTES.COD_EMPRESA = NOTIFICACAO_CREDITOS.COD_EMP_MULT ' +
      ' INNER JOIN CONTROLES ON ' +
      '     CONTROLES.CODIGO_CTRL = CONTROLE_CREDITOS.CODIGO_CTRL ' +
      '     AND CONTROLES.CODIGO_EMP = CONTROLE_CREDITOS.CODIGO_EMP ',
      vNotEnvFinanc.rNotEnv.vSqlAdicional,
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
        ' (CASE WHEN (EMPRESA.FINANCEIRO_UNIFICADO = ''S'') THEN ' +
        ' EMPRESA.CODIGO_UNIFICADORA ELSE CONTROLE_CREDITOS.CODIGO_EMP END) ',
        '')) then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          ComboBox1.SetFocus;

     if vNotEnvFinanc.dataSet.Active then
        for I := 0 to DBGrid1.Columns.Count - 1 do
          if (DBGrid1.Columns[i].FieldName = 'HTML') or (DBGrid1.Columns[i].FieldName = 'EMAIL') or (DBGrid1.Columns[i].FieldName = 'OBS_ENV') then
            DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
    vDtDia := vDadosIni.getDataBanco(vNotEnvFinanc.buscas);
  finally
    gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNotEnvFinanc.btnDadosAPIClick(Sender: TObject);
begin
  TForm(pnDadosAPI.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmNotEnvFinanc.CheckBox1Click(Sender: TObject);
begin
  inherited;
  GroupBox4.Visible := CheckBox3.Checked;
  groupAdicional.Visible := CheckBox1.Checked;
  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 203
  else
    GroupBox3.Height := 73;
  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    ComboBox11.SetFocus;
end;

procedure TfrmNotEnvFinanc.CheckBox3Click(Sender: TObject);
begin
	GroupBox4.Visible := CheckBox3.Checked;
  groupAdicional.Visible := CheckBox1.Checked;
	if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 203
  else
    GroupBox3.Height := 73;
end;

procedure TfrmNotEnvFinanc.ComboBox11Exit(Sender: TObject);
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

procedure TfrmNotEnvFinanc.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
	if ((Column.FieldName = 'DATA_VENC_C') and
    ((TDBGrid(Sender).DataSource.dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDtDia) and
    (Trim(TDBGrid(Sender).DataSource.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO')) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmNotEnvFinanc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;
  
  if (vNotEnvFinanc <> nil) then
    vNotEnvFinanc.Cancel;

  vNotEnvFinanc.free;
  vNotEnvFinanc := nil;

  Action := caFree;
  if (frmNotEnvFinanc <> nil) then
    frmNotEnvFinanc := nil;
end;

procedure TfrmNotEnvFinanc.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  vNotEnvFinanc := TNotEnvFinanc.create;
//  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmNotEnvFinanc.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

	vNotEnvFinanc.dataSet.FieldByName('COD_EMP_MULT').Tag :=
    	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);

	if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmContasAReceber.dsEnvNotFinanc;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if not vDadosIni.validarAcessoEmpresasUnificadas(vNotEnvFinanc.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    frmNotEnvFinanc.fechar := True;
    PostMessage(frmNotEnvFinanc.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    vNotEnvFinanc.abreNotEnvFinanc(0, 0);
  end;

  leConfiguracoesFormRegistro;
  
  SpeedButton8.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'STATUS ENVIO' + #13+
    'NO: Quando a mensagem é cadastrada para envio' + #13 +
    'EP: A mensageria já iniciou o processamento da mensagem (Em processamento)' + #13 +
    'AC: A mensagem está sendo enviada (Mensagem Aceito para envio)' + #13 +
    'ER: A mensagem teve algum retono de erro e não pode ser enviada' + #13 +
    'PP: A mensagem foi processada (Enviada normalmente)';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmNotEnvFinanc.gravaConfiguracoesFormRegistro;
begin
  if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
    _GravaConfiguracoesBoolean(ckAvisoVenc.Name, ckAvisoVenc.Checked);
    _GravaConfiguracoesBoolean(ckCreditosAtraso.Name, ckCreditosAtraso.Checked);
    _GravaConfiguracoesBoolean(ckAgradecimento.Name, ckAgradecimento.Checked);

    _GravaConfiguracoesBoolean(ckStatusNO.Name, ckStatusNO.Checked);
    _GravaConfiguracoesBoolean(ckStatusEP.Name, ckStatusEP.Checked);
    _GravaConfiguracoesBoolean(ckStatusAC.Name, ckStatusAC.Checked);
    _GravaConfiguracoesBoolean(ckStatusER.Name, ckStatusER.Checked);
    _GravaConfiguracoesBoolean(ckStatusPP.Name, ckStatusPP.Checked);

    _GravaConfiguracoesBoolean(ckOrigemErp.Name, ckOrigemErp.Checked);
    _GravaConfiguracoesBoolean(ckOrigemBot.Name, ckOrigemBot.Checked);

    _GravaConfiguracoesBoolean(ckDestinoErp.Name, ckDestinoErp.Checked);
    _GravaConfiguracoesBoolean(ckDestinoBot.Name, ckDestinoBot.Checked);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
  end;
end;

procedure TfrmNotEnvFinanc.groupAdicionalExit(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmNotEnvFinanc.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
    ckAvisoVenc.Checked := _LerConfiguracoesRegistroBoolean(ckAvisoVenc.Name);
    ckCreditosAtraso.Checked := _LerConfiguracoesRegistroBoolean(ckCreditosAtraso.Name);
    ckAgradecimento.Checked := _LerConfiguracoesRegistroBoolean(ckAgradecimento.Name);
    
    ckStatusNO.Checked := _LerConfiguracoesRegistroBoolean(ckStatusNO.Name);
    ckStatusEP.Checked := _LerConfiguracoesRegistroBoolean(ckStatusEP.Name);
    ckStatusAC.Checked := _LerConfiguracoesRegistroBoolean(ckStatusAC.Name);
    ckStatusER.Checked := _LerConfiguracoesRegistroBoolean(ckStatusER.Name);
    ckStatusPP.Checked := _LerConfiguracoesRegistroBoolean(ckStatusPP.Name);

    ckOrigemErp.Checked := _LerConfiguracoesRegistroBoolean(ckOrigemErp.Name);
    ckOrigemBot.Checked := _LerConfiguracoesRegistroBoolean(ckOrigemBot.Name);

    ckDestinoErp.Checked := _LerConfiguracoesRegistroBoolean(ckDestinoErp.Name);
    ckDestinoBot.Checked := _LerConfiguracoesRegistroBoolean(ckDestinoBot.Name);
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
    	ComboBox12.Text       := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text        := _LerConfiguracoesRegistroString(MaskEdit7.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text        := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text        := _LerConfiguracoesRegistroString(MaskEdit9.Name);
  end;
end;

procedure TfrmNotEnvFinanc.PageControl4Change(Sender: TObject);
begin            
  if PageControl4.ActivePage = TabSheet_Cad_Mensageria then
  	vNotEnvFinanc.vDoc.abreDocEletronicoMensMobile(
    	vNotEnvFinanc.dataSet.FieldByName('CODIGO').AsInteger,
    	'HWC_NOT_FIN_P_')
  else if PageControl4.ActivePage = TabSheet_Ler_Mensageria then
  	vNotEnvFinanc.vDoc.abreDocEletronicoMensMobile(
    	vNotEnvFinanc.dataSet.FieldByName('CODIGO').AsInteger,
    	'HWC_NOT_FIN_G_')
  else if PageControl4.ActivePage = TabSheet_Update_Mensageria then
  	vNotEnvFinanc.vDoc.abreDocEletronicoMensMobile(
    	vNotEnvFinanc.dataSet.FieldByName('CODIGO').AsInteger,
    	'HWC_NOT_FIN_U_');
end;

procedure TfrmNotEnvFinanc.SpeedButton6Click(Sender: TObject);
var
  vHtml, vAssunto: string;
begin
  inherited;
  if vNotEnvFinanc.dataSet.IsEmpty then
    Exit;

	if not vDadosIni.PesqPros('CAR104', 'CONSULTA', '', 'NOTIFICACAO_CREDITOS', '',
    vNotEnvFinanc.buscas, true) then
    Exit;

  vHtml := vNotEnvFinanc.dataset.FieldByName('HTML').AsString;
//  vHtml := vDadosIni._converterTagsImage(vHtml, vNotEnvFinanc.buscas, true);
  vAssunto := vNotEnvFinanc.dataset.FieldByName('TIPO_CONTRATO').AsString;
//  vAssunto := vDadosIni._converterTagsImage(vAssunto, vNotEnvFinanc.buscas, true);
	if (vNotEnvFinanc.dataset.FieldByName('APLICATIVO').AsString = 'WHATSAPP') or (vNotEnvFinanc.dataset.FieldByName('APLICATIVO').AsString = 'TELEGRAM') then
  	vHtml := _markdownToHtml(vHtml);
  vDadosIni.abreFormVisualizarHtml(vHtml, vAssunto);
end;

procedure TfrmNotEnvFinanc.SpeedButton8Click(Sender: TObject);
begin
  if vNotEnvFinanc.dataSet.IsEmpty then
    Exit;

  DBGridMensageriaPost.Width   := _LerConfiguracoesRegistroInteger(DBGridMensageriaPost.Name,   vDadosIni.IfThen(DBGridMensageriaPost.Width    < 120, 120, DBGridMensageriaPost.Width));
  DBGridMensageriaGet.Width    := _LerConfiguracoesRegistroInteger(DBGridMensageriaGet.Name,    vDadosIni.IfThen(DBGridMensageriaGet.Width     < 120, 120, DBGridMensageriaGet.Width));
  DBGridMensageriaUpdate.Width := _LerConfiguracoesRegistroInteger(DBGridMensageriaUpdate.Name, vDadosIni.IfThen(DBGridMensageriaUpdate.Height < 120, 120, DBGridMensageriaUpdate.Height));

  vNotEnvFinanc.lerDadosApiMensagem;
end;

procedure TfrmNotEnvFinanc.SplitterMensageriaPostMoved(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesInteger(DBGridMensageriaPost.Name, vDadosIni.IfThen(DBGridMensageriaPost.Width < 120, 120, DBGridMensageriaPost.Width));
end;

procedure TfrmNotEnvFinanc.SplitterMensageriaGetMoved(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesInteger(DBGridMensageriaGet.Name, vDadosIni.IfThen(DBGridMensageriaGet.Width < 120, 120, DBGridMensageriaGet.Width));
end;

procedure TfrmNotEnvFinanc.SplitterMensageriaUpdateMoved(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesInteger(DBGridMensageriaUpdate.Name, vDadosIni.IfThen(DBGridMensageriaUpdate.Width < 120, 120, DBGridMensageriaUpdate.Width));
end;

end.
