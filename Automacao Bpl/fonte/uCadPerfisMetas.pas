unit uCadPerfisMetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, uEditHw, QRCtrls, QuickRpt;

type
  TfrmCadMetasPerfis = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    tsCadastro: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    qrpMetasVendas: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    lbEmpresa: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText1: TQRDBText;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrpMetasVendasPreview(Sender: TObject);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure EditHw1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadMetasPerfis: TfrmCadMetasPerfis;

implementation

uses uDtmAtivo, UClassesCadastrosBasicos, UDtmCadastrosBasicos;

{$R *.dfm}

procedure TfrmCadMetasPerfis.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS279]';
  if vDadosIni.PesqPros('BAS276', 'PESQUISAR', '',
    'PERFIL_METAS', '', CadPerfilMetas.buscas, true) then
  begin
    inherited;

    if MaskEdit2.Visible then
    begin
      if not CadPerfilMetas.ConsultaCampos('PERFIL_METAS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        ' PERFIL_METAS.*, PERFIL_COMISSAO.NOME_PERFIL, METAS_VENDAS.DESCRICAO_META',
        ' INNER JOIN PERFIL_COMISSAO ON PERFIL_METAS.CODIGO_PERFIL = PERFIL_COMISSAO.CODIGO_PERFIL' +
        ' INNER JOIN METAS_VENDAS ON PERFIL_METAS.CODIGO_META = METAS_VENDAS.CODIGO_META AND PERFIL_METAS.COD_EMPRESA = METAS_VENDAS.COD_EMPRESA','') then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus
    end
    else
      if not CadPerfilMetas.ConsultaCampos('PERFIL_METAS', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
        ' PERFIL_METAS.*, PERFIL_COMISSAO.NOME_PERFIL, METAS_VENDAS.DESCRICAO_META',
        ' INNER JOIN PERFIL_COMISSAO ON PERFIL_METAS.CODIGO_PERFIL = PERFIL_COMISSAO.CODIGO_PERFIL' +
        ' INNER JOIN METAS_VENDAS ON PERFIL_METAS.CODIGO_META = METAS_VENDAS.CODIGO_META AND PERFIL_METAS.COD_EMPRESA = METAS_VENDAS.COD_EMPRESA','') then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    CadPerfilMetas.IndexFieldNames := 'CODIGO_META';
    SpeedButton5.Visible := false;
    SpeedButton1.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadMetasPerfis.BitBtn3Click(Sender: TObject);
begin
try
    if not CadPerfilMetas.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    EditHw1.AsValue := 0;
    EditHw2.AsValue := 0;
    if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
      EditHw1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadPerfilMetas.Cancel;
      CadPerfilMetas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMetasPerfis.BitBtn4Click(Sender: TObject);
begin
  if not CadPerfilMetas.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadPerfilMetas.vNomeCampoErro, CadPerfilMetas.vMensagemErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if CadPerfilMetas.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
        	EditHw1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadMetasPerfis.BitBtn5Click(Sender: TObject);
begin
  inherited;
  CadPerfilMetas.Cancel;
  CadPerfilMetas.RollBackTransacao;
end;

procedure TfrmCadMetasPerfis.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadMetasPerfis.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox1.KeyValue <> null then
	  EditHw1.AsValue := DBLookupComboBox1.KeyValue
  else
  	EditHw1.AsValue := 0;  
end;

procedure TfrmCadMetasPerfis.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox2.KeyValue <> null then
	  EditHw2.AsValue := DBLookupComboBox2.KeyValue
  else
  	EditHw2.AsValue := 0;
end;

procedure TfrmCadMetasPerfis.EditHw1Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox1.KeyValue := EditHw1.AsInteger;
  CadPerfilMetas.dataSet.FieldByName('CODIGO_META').AsInteger := EditHw1.AsInteger;

  if not CadPerfilMetas._buscarMetas(CadPerfilMetas.dataSet.FieldByName('CODIGO_META').AsInteger) then
  begin
  	Application.MessageBox(pchar('Meta não encontrada'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
    	EditHw1.SetFocus;
  end;
end;

procedure TfrmCadMetasPerfis.EditHw2Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox2.KeyValue := EditHw2.AsInteger;
  CadPerfilMetas.dataSet.FieldByName('CODIGO_PERFIL').AsInteger := EditHw2.AsInteger;

  if not CadPerfilMetas._buscarPerfil(CadPerfilMetas.dataSet.FieldByName('CODIGO_PERFIL').AsInteger) then
  begin
  	Application.MessageBox(pchar('Perfil não encontrada'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
    	EditHw2.SetFocus;
  end;
end;

procedure TfrmCadMetasPerfis.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CadPerfilMetas.Cancel;
  CadPerfilMetas.RollBackTransacao;

  Action := caFree;
  frmCadMetasPerfis := nil;
end;

procedure TfrmCadMetasPerfis.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadMetasPerfis.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsMetasPerfis;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS269]';
  end;

  inherited;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadPerfilMetas._lixeiraCheia);
  end;
  SpeedButton5.Visible :=false;
  SpeedButton1.Visible := false;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadMetasPerfis.lbEmpresaPrint(sender: TObject; var Value: string);
begin
  inherited;
 Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadMetasPerfis.qrpMetasVendasPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Cadastro de Perfis de Comissão');
end;

procedure TfrmCadMetasPerfis.SpeedButton1Click(Sender: TObject);
begin
  try
    if CadPerfilMetas.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('BAS278', 'ALTERAR', '', 'PERFIL_METAS',
      CadPerfilMetas.dataSet.FieldByName('CODIGO_META').AsString +' - '+  CadPerfilMetas.dataSet.FieldByName('CODIGO_PERFIL').AsString, CadPerfilMetas.buscas,
      true) then
      exit;

    if not CadPerfilMetas.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    EditHw1.AsValue := DBLookupComboBox1.KeyValue;
    EditHw2.AsValue := DBLookupComboBox2.KeyValue;

    if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
      EditHw1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadPerfilMetas.Cancel;
      CadPerfilMetas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMetasPerfis.SpeedButton25Click(Sender: TObject);
begin
  inherited;
if not vDadosIni.PesqPros('BAS283', 'ABRIR A LIXEIRA', '', 'PERFIL_METAS',
    '', CadPerfilMetas.buscas, true) then
    Exit;

  inherited;

  if not CadPerfilMetas._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS279]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS280]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadMetasPerfis.SpeedButton2Click(Sender: TObject);
begin
  inherited;
 try
    if not vDadosIni.PesqPros('BAS279', 'EXCLUIR', '', 'PERFIL_METAS',
      CadPerfilMetas.dataSet.FieldByName('CODIGO_META').AsString +' - '+  CadPerfilMetas.dataSet.FieldByName('CODIGO_PERFIL').AsString, CadPerfilMetas.buscas,
      false) then
      Exit;

    CadPerfilMetas.Delete;
    lixeiraVazia(not CadPerfilMetas._lixeiraCheia);
    SpeedButton1.Visible := false;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadPerfilMetas.Cancel;
      CadPerfilMetas.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMetasPerfis.SpeedButton3Click(Sender: TObject);
begin
  inherited;
if not vDadosIni.PesqPros('BAS284', 'IMPRIMIR', '', 'PERFIL_METAS',
    CadPerfilMetas.dataSet.FieldByName('CODIGO_META').AsString +' - '+  CadPerfilMetas.dataSet.FieldByName('CODIGO_PERFIL').AsString, CadPerfilMetas.buscas, true)
    then
    exit;

  qrpMetasVendas.Preview;
end;

procedure TfrmCadMetasPerfis.SpeedButton5Click(Sender: TObject);
begin
  inherited;
 if vDadosIni.PesqPros('BAS283', '', '', 'PERFIL_METAS', '', CadPerfilMetas.buscas, false) then
    if CadPerfilMetas._restauraLixeira then
      lixeiraVazia(not CadPerfilMetas._lixeiraCheia);

 SpeedButton1.Visible := false;
end;

end.
