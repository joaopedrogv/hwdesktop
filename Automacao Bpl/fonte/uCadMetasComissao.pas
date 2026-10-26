unit uCadMetasComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DB, DBCtrls, QRCtrls, QuickRpt;

type
  TfrmCadMetasComissao = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    tsCadastro: TTabSheet;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox5: TDBComboBox;
    Label16: TLabel;
    DBMemo2: TDBMemo;
    DBComboBox2: TDBComboBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox4: TDBComboBox;
    qrpPerfisComissao: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    DBLookupComboBox2: TDBLookupComboBox;
    lbEmpresa: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    DBEdit4: TDBEdit;
    Label17: TLabel;
    grid_conteudo: TDBGrid;
    grid_tipovendas: TDBGrid;
    Label18: TLabel;
    btConteudoSelectAll: TSpeedButton;
    btConteudoUnSelectAll: TSpeedButton;
    btTabelasSelectAll: TSpeedButton;
    btTabelasUnSelectAll: TSpeedButton;
    Memo1: TMemo;
    TabSheet5: TTabSheet;
    Memo2: TMemo;
    SpeedButton9: TSpeedButton;
    Panel4: TPanel;
    BitBtn11: TBitBtn;
    procedure DBComboBox5Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure btTabelasSelectAllClick(Sender: TObject);
    procedure btConteudoSelectAllClick(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure grid_tipovendasDblClick(Sender: TObject);
    procedure grid_conteudoDblClick(Sender: TObject);
    procedure grid_conteudoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure qrpPerfisComissaoPreview(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBComboBox4Exit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure QRLabel11Print(sender: TObject; var Value: string);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBComboBox3Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AtualizarTipo(pAtualizar: boolean = false);
    procedure AtualizarSelecao(pAtualizar: boolean = false);
    procedure AtualizarAgrupar(pAtualizar: boolean = false);
  private
    { Private declarations }
    procedure ChangeAgrupadoPor(Sender: TField);
  public
    { Public declarations }
  end;

var
  frmCadMetasComissao: TfrmCadMetasComissao;

implementation

uses uDtmAtivo, UClassesCadastrosBasicos, UDtmCadastrosBasicos, uDadosIni,
  uDataSet_OOP, StrUtils;

{$R *.dfm}

procedure TfrmCadMetasComissao.AtualizarAgrupar(pAtualizar: boolean);
begin
  if not pAtualizar then
    if UpperCase(trim(DBComboBox4.Text)) = UpperCase(trim(CadPerfilComissao.vagrupar)) then
      exit;

  if ((UpperCase(trim(DBComboBox4.Text)) = 'PRESTAçãO RECEBIDA') and (not pAtualizar))
  or ((UpperCase(trim(CadPerfilComissao.vagrupar)) = 'PRESTAçãO RECEBIDA') and (pAtualizar)) then
  begin
    DBComboBox2.Enabled := False;
    if DBComboBox3.Items.Count = 4 then
    begin
      DBComboBox3.Items.Clear;
      DBComboBox3.Items.Add('Controle Caixa');
    end;
    if DBComboBox5.Items.Count = 2 then
    begin
      DBComboBox5.Items.Clear;
      DBComboBox5.Items.Add('Valor Geral');
    end;
    DBLookupComboBox2.Enabled := False;
    DBMemo2.Enabled := False;
    BitBtn7.Enabled := False;
    BitBtn8.Enabled := False;
    grid_tipovendas.Enabled := False;
    with CadPerfilComissao do
    begin
      fdata('TIPO_SERV_PROD').SetNull;
      fdata('EM_CIMA_PERFIL').Put('Valor Geral');
      fdata('FLAG_SERV_PROD').Put('Controle Caixa');
    end;
    CadPerfilComissao.Conteudos.Conteudo(CadPerfilComissao.fstr('flag_serv_prod'));
  end
  else
  begin
    DBComboBox2.Enabled := True;
    if DBComboBox3.Items.Count = 1 then
    begin
      DBComboBox3.Items.Clear;
      DBComboBox3.Items.Add('Controle Caixa');
      DBComboBox3.Items.Add('Tipo Serviço');
      DBComboBox3.Items.Add('Tipo de Segmentação');
      DBComboBox3.Items.Add('Grupo Produto');
    end;
    if DBComboBox5.Items.Count = 1 then
    begin
      DBComboBox5.Items.clear;
      DBComboBox5.Items.Add('Valor Geral');
      DBComboBox5.Items.Add('Lucro Bruto');
    end;
    DBLookupComboBox2.Enabled := True;
    DBMemo2.Enabled := True;
    BitBtn7.Enabled := True;
    BitBtn8.Enabled := True;
    grid_conteudo.Enabled := True;
    grid_tipovendas.Enabled := True;
    CadPerfilComissao.Conteudos.Close;
  end;
  grid_tipovendas.Repaint;
  if pAtualizar then
    DBComboBox4.ItemIndex := DBComboBox4.Items.IndexOf(CadPerfilComissao.vagrupar)
    //DBComboBox4.Text := trim(CadPerfilComissao.vagrupar)
  else
	  CadPerfilComissao.vagrupar := trim(DBComboBox4.Text);
end;

procedure TfrmCadMetasComissao.AtualizarSelecao(pAtualizar: boolean);
begin
  if not pAtualizar then
    if UpperCase(trim(DBComboBox3.text)) = UpperCase(trim(CadPerfilComissao.vselecao)) then
      exit;

  CadPerfilComissao.Conteudos.Conteudo(CadPerfilComissao.fstr('flag_serv_prod'));
//  Exit;

  DBLookupComboBox1.Font.Color := clGrayText;
  DBLookupComboBox1.ListField := '';
  DBLookupComboBox1.KeyField := '';
  if  ((UpperCase(trim(DBComboBox3.text)) = 'TIPO SERVIçO') and (not pAtualizar))
   or ((UpperCase(trim(CadPerfilComissao.vselecao)) = 'TIPO SERVIçO') and (pAtualizar)) then
  begin
    CadPerfilComissao._abreTipoServico;
    DBLookupComboBox1.Font.Color := clMenuText;
    DBLookupComboBox1.ListField := 'COD_SERVICO;DESC_SERVICO';
    DBLookupComboBox1.KeyField := 'COD_SERVICO';
  end
  else if ((UpperCase(trim(DBComboBox3.text)) = 'TIPO DE SEGMENTAçãO') and (not pAtualizar))
  	 	 or ((UpperCase(trim(CadPerfilComissao.vselecao)) = 'TIPO DE SEGMENTAçãO') and (pAtualizar)) then
  begin
    CadPerfilComissao._abreSegm;
    DBLookupComboBox1.Font.Color := clMenuText;
    DBLookupComboBox1.ListField := 'COD_SERVICO;DESC_SERVICO';
    DBLookupComboBox1.KeyField := 'COD_SERVICO';
  end
  else if ((UpperCase(trim(DBComboBox3.text)) = 'GRUPO PRODUTO') and (not pAtualizar))
  	 	 or ((UpperCase(trim(CadPerfilComissao.vselecao)) = 'GRUPO PRODUTO') and (pAtualizar)) then
  begin
    CadPerfilComissao._abreGrupos;
    DBLookupComboBox1.Font.Color := clMenuText;
    DBLookupComboBox1.ListField := 'CODIGO_GRUP;DESCRICAO';
    DBLookupComboBox1.KeyField := 'CODIGO_GRUP';
  end
  else if ((UpperCase(trim(DBComboBox3.text)) = 'CONTROLE CAIXA') and (not pAtualizar))
  		 or	((UpperCase(trim(CadPerfilComissao.vselecao)) = 'CONTROLE CAIXA') and (pAtualizar)) then
  begin
    CadPerfilComissao._abreCtrl;
    DBLookupComboBox1.Font.Color := clMenuText;
    DBLookupComboBox1.ListField := 'CODIGO_CTRL;NOME_CTRL';
    DBLookupComboBox1.KeyField := 'CODIGO_CTRL';
  end;
  if trim(DBLookupComboBox1.ListField) = '' then
  begin
		Label14.Caption := 'Tipo Seleção:';
    DBLookupComboBox1.Enabled := false;
  end
  else
  begin
  	if pAtualizar then
      Label14.Caption := trim(CadPerfilComissao.vselecao) + ':'
    else
		  Label14.Caption := DBComboBox3.text + ':';
    DBLookupComboBox1.Enabled := true;
  end;
  if pAtualizar then
    //DBComboBox3.text := trim(CadPerfilComissao.vselecao)
    DBComboBox3.ItemIndex := DBComboBox3.Items.IndexOf(CadPerfilComissao.vselecao)
  else
	  CadPerfilComissao.vselecao := trim(DBComboBox3.text);
end;

procedure TfrmCadMetasComissao.AtualizarTipo(pAtualizar: boolean);
begin
  if not pAtualizar then
    if UpperCase(Trim(DBComboBox2.Text)) = UpperCase(Trim(CadPerfilComissao.vtipo)) then
      exit;

  if ((UpperCase(Trim(DBComboBox2.Text)) = 'SERVICO') and (not pAtualizar))
  or ((UpperCase(Trim(CadPerfilComissao.vtipo)) = 'SERVICO') and (pAtualizar)) then
  begin
    DBComboBox3.Items.Clear;
    DBComboBox3.Items.Add('Tipo Serviço');
    DBComboBox3.Items.Add('Tipo de Segmentação');
    DBComboBox5.Items.Clear;
    DBComboBox5.Items.Add('Valor Geral');
    DBComboBox5.Items.Add('Lucro Bruto');
    DBLookupComboBox2.enabled := True;
    DBMemo2.Enabled := True;
    BitBtn7.enabled := True;
    BitBtn8.enabled := True;
  end
  else if ((UpperCase(Trim(DBComboBox2.Text)) <> 'SERVICO') and (not pAtualizar))
  		 or ((UpperCase(Trim(CadPerfilComissao.vtipo)) <> 'SERVICO') and (pAtualizar)) then
  begin
    DBComboBox2.Enabled := True;
    DBComboBox3.Items.Clear;
    DBComboBox3.Items.Add('Controle Caixa');
    DBComboBox3.Items.Add('Tipo Serviço');
    DBComboBox3.Items.Add('Tipo de Segmentação');
    DBComboBox3.Items.Add('Grupo Produto');
    DBComboBox5.Items.Clear;
    DBComboBox5.Items.Add('Valor Geral');
    DBComboBox5.Items.Add('Lucro Bruto');
    DBLookupComboBox2.enabled := True;
    DBMemo2.Enabled := True;
    BitBtn7.enabled := True;
    BitBtn8.enabled := True;
  end;
  if pAtualizar then
    DBComboBox2.ItemIndex := DBComboBox2.Items.IndexOf(CadPerfilComissao.vtipo)
	  //DBComboBox2.Text := Trim(CadPerfilComissao.vtipo)
  else
	  CadPerfilComissao.vtipo := Trim(DBComboBox2.Text);
end;

procedure TfrmCadMetasComissao.BitBtn10Click(Sender: TObject);
begin
  inherited;
  DBMemo1.Lines.Delete(DBMemo1.Lines.Count - 1);
end;

procedure TfrmCadMetasComissao.BitBtn11Click(Sender: TObject);
begin
  inherited;
  PageControl3.ActivePage := tsCadastro;
end;

procedure TfrmCadMetasComissao.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS259]';
  if vDadosIni.PesqPros('BAS256', 'PESQUISAR', '',
    'PERFIL_COMISSAO', '', CadPerfilComissao.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not CadPerfilComissao.ConsultaCampos('PERFIL_COMISSAO', ComboBox1.Text,
        CadPerfilComissao.dataSet.FieldByName('CODIGO_PERFIL').DisplayLabel,
        maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if CadPerfilComissao.ConsultaCampos('PERFIL_COMISSAO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, CadPerfilComissao.dataSet.FieldByName('CODIGO_PERFIL').DisplayLabel,
      true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;

    if CadPerfilComissao.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if (DBGrid1.Columns[i].FieldName = 'CONTEUDO_FLAG') or (DBGrid1.Columns[i].FieldName = 'TABELAS_PERFIL') then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
  end;
end;

procedure TfrmCadMetasComissao.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  try
    if not CadPerfilComissao.Insert then
      exit;

    inherited;

    Label14.Caption := 'Controles:';

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    //AtualizarSelecao;

    if vDadosIni.vPedVnd.AcrescCondPagComissaoVend then
    begin
    	CadPerfilComissao.dataSet.FieldByName('TIPO_PERFIL').AsString := 'Venda Geral';
      CadPerfilComissao.dataSet.FieldByName('ABRANG_PERFIL').AsString := 'INDIVIDUAL';
      CadPerfilComissao.dataSet.FieldByName('TIPO_SERV_PROD').AsString := 'Produto';
      CadPerfilComissao.dataSet.FieldByName('EM_CIMA_PERFIL').AsString := 'Valor Geral';
      CadPerfilComissao.dataSet.FieldByName('FLAG_SERV_PROD').AsString := 'Grupo Produto';
    end;

    CadPerfilComissao.OnChangeField_Tipo := ChangeAgrupadoPor;
    ChangeAgrupadoPor(nil);
    Label15.Caption := IfThen(CadPerfilComissao.fequals('ABRANG_PERFIL', 'PESO'), '% Peso',  '% Comissão');

    if vDadosIni.vPedVnd.AcrescCondPagComissaoVend then
    	CadPerfilComissao.TipoVendas.CheckUnCheckAllRows(true);

    DBComboBox4.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBComboBox1.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBEdit4.Enabled              := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBComboBox2.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBComboBox5.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBComboBox3.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    btTabelasSelectAll.Enabled   := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    btTabelasUnSelectAll.Enabled := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    grid_tipovendas.Enabled      := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadPerfilComissao.Cancel;
      CadPerfilComissao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMetasComissao.BitBtn4Click(Sender: TObject);
begin
  if not CadPerfilComissao.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(CadPerfilComissao.vNomeCampoErro, CadPerfilComissao.vMensagemErro);
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
      if CadPerfilComissao.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadMetasComissao.BitBtn5Click(Sender: TObject);
begin
  inherited;
  CadPerfilComissao.Cancel;
  CadPerfilComissao.RollBackTransacao;
end;

procedure TfrmCadMetasComissao.BitBtn7Click(Sender: TObject);
var
  vflg, i: integer;
begin
  vflg := 0;
  for i := 0 to DBMemo2.Lines.Count - 1 do
  begin
    if DBMemo2.Lines[i] = DBLookupComboBox2.Text then
      vflg := 1;
  end;
  if vflg = 0 then
  begin
    if trim(DBLookupComboBox2.Text) <> '' then
    begin
      DbMemo2.Lines.Add(DBLookupComboBox2.Text);
      CadPerfilComissao.dataSet.FieldByName('TABELAS_PERFIL').AsString := DbMemo2.Text;
    end;
  end
  else
    messagedlg('Já existe', mtinformation, [mbOK], 0);
end;

procedure TfrmCadMetasComissao.BitBtn8Click(Sender: TObject);
begin
  inherited;
  DbMemo2.Lines.Delete(DbMemo2.Lines.Count - 1);
end;

procedure TfrmCadMetasComissao.BitBtn9Click(Sender: TObject);
var
  vflg, i: integer;
begin
  vflg := 0;
  for i := 0 to DBMemo1.Lines.Count - 1 do
  begin
    if DBMemo1.Lines[i] = DBLookupComboBox1.KeyValue then
      vflg := 1;
  end;
  if vflg = 0 then
  begin
    if DBLookupComboBox1.KeyValue > 0 then
      DbMemo1.Lines.Add(DBLookupComboBox1.KeyValue);
  end
  else
    messagedlg('Já existe', mtinformation, [mbOK], 0);

end;

procedure TfrmCadMetasComissao.btConteudoSelectAllClick(Sender: TObject);
begin
  inherited;
  if grid_conteudo.Enabled then  
    CadPerfilComissao.Conteudos.CheckUnCheckAllRows(Sender = btConteudoSelectAll);
end;

procedure TfrmCadMetasComissao.btTabelasSelectAllClick(Sender: TObject);
begin
  inherited;
  if grid_tipovendas.Enabled then
    CadPerfilComissao.TipoVendas.CheckUnCheckAllRows(Sender = btTabelasSelectAll);
end;

procedure TfrmCadMetasComissao.ChangeAgrupadoPor(Sender: TField);
begin
  DBComboBox2.Enabled :=     CadPerfilComissao.fmatchText('TIPO_PERFIL', ['Venda Geral']);
  DBComboBox5.Enabled :=     CadPerfilComissao.fmatchText('TIPO_PERFIL', ['Venda Geral']);
  DBComboBox1.Enabled :=     CadPerfilComissao.fmatchText('TIPO_PERFIL', ['Venda Geral']);
  DBEdit9.Enabled     := not CadPerfilComissao.fmatchText('TIPO_PERFIL', ['Produto']);

  if CadPerfilComissao.fmatchText('TIPO_PERFIL', ['Prestação Recebida', 'Mod.Recebimento']) then
  begin
    CadPerfilComissao.fdata('FLAG_SERV_PROD').Put('Controle Caixa');
    CadPerfilComissao.fdata('ABRANG_PERFIL').Put('INDIVIDUAL');
    CadPerfilComissao.fdata('EM_CIMA_PERFIL').Put('Valor Geral');
    CadPerfilComissao.OnChangeField_Tipo := nil;
    CadPerfilComissao.fdata('TIPO_SERV_PROD').SetNull;
    CadPerfilComissao.OnChangeField_Tipo := ChangeAgrupadoPor;
  end
  else if CadPerfilComissao.fequals('TIPO_PERFIL', 'Produto') then
  begin
    CadPerfilComissao.fdata('ABRANG_PERFIL').Put('INDIVIDUAL');
    CadPerfilComissao.fdata('EM_CIMA_PERFIL').Put('Valor Geral');
    CadPerfilComissao.OnChangeField_Tipo := nil;
    CadPerfilComissao.fdata('TIPO_SERV_PROD').SetNull;
    CadPerfilComissao.OnChangeField_Tipo := ChangeAgrupadoPor;
    Label15.Caption := '% Comissão';
  end
  else if CadPerfilComissao.fequals('TIPO_PERFIL', 'Venda Geral') then
    if CadPerfilComissao.fempty('ABRANG_PERFIL') then
      CadPerfilComissao.fdata('ABRANG_PERFIL').Put('INDIVIDUAL');

  DBComboBox3.Items.Clear;
  if CadPerfilComissao.fmatchText('TIPO_PERFIL', ['Prestação Recebida', 'Mod.Recebimento']) then
    DBComboBox3.Items.Add('Controle Caixa')
  else if CadPerfilComissao.fequals('TIPO_PERFIL', 'Produto') then
  begin
    DBComboBox3.Items.Add('Tipo de Segmentação');
    DBComboBox3.Items.Add('Grupo Produto');
  end
  else if CadPerfilComissao.fequals('TIPO_PERFIL', 'Venda Geral') then
  begin
    if (CadPerfilComissao.fmatchText('TIPO_SERV_PROD', ['Servico', 'Ambos'])) then
      DBComboBox3.Items.Add('Tipo Serviço');
    DBComboBox3.Items.Add('Tipo de Segmentação');
    if (CadPerfilComissao.fdif('TIPO_SERV_PROD', 'Servico')) then
      DBComboBox3.Items.Add('Grupo Produto');
  end;
  if DBComboBox3.Items.Count > 0 then
    if DBComboBox3.Items.IndexOf(CadPerfilComissao.fstr('FLAG_SERV_PROD')) > -1 then
      DBComboBox3.ItemIndex := DBComboBox3.Items.IndexOf(CadPerfilComissao.fstr('FLAG_SERV_PROD'));

  if DBComboBox3.ItemIndex = -1 then
    CadPerfilComissao.Conteudos.Conteudo('Nenhum')
  else if CadPerfilComissao.fdif('FLAG_SERV_PROD', CadPerfilComissao.Conteudos.Selecionado) then
    CadPerfilComissao.Conteudos.Conteudo(CadPerfilComissao.fstr('FLAG_SERV_PROD'));

  grid_tipovendas.Enabled := not CadPerfilComissao.fmatchText('TIPO_PERFIL', ['Prestação Recebida', 'Mod.Recebimento']);
  grid_tipovendas.Repaint;

  exit;
  //else if (CadPerfilComissao.fequals('TIPO_SERV_PROD', 'Produto')) then// or
     //(CadPerfilComissao.fequals('TIPO_PERFIL', 'Prestação Recebida')) then
//  begin
//    if (CadPerfilComissao.fequals('TIPO_PERFIL', 'Prestação Recebida')) then
//    begin
//      if (DBComboBox3.Items.Count <> 1) then
//        DBComboBox3.Items.Clear;
//      if (DBComboBox5.Items.Count <> 1) then
//        DBComboBox5.Items.Clear;
//    end
//    else
//    begin
//      if (DBComboBox3.Items.Count <> 4) then
//        DBComboBox3.Items.Clear;
//      if (DBComboBox5.Items.Count <> 2) then
//        DBComboBox5.Items.Clear;
//    end;
//  end
  //else
   //if (CadPerfilComissao.fequals('TIPO_SERV_PROD', 'Servico')) then
  begin
    if (CadPerfilComissao.fequals('TIPO_SERV_PROD', 'Servico')) then
    begin
      if (DBComboBox3.Items.Count <> 2) then
        DBComboBox3.Items.Clear;
    end
    else if (DBComboBox3.Items.Count <> 4) then
      DBComboBox3.Items.Clear;

    if (DBComboBox5.Items.Count <> 2) then
      DBComboBox5.Items.Clear;
  end;

  if (DBComboBox3.Items.Count = 0) then
  begin
    if CadPerfilComissao.fmatchText('TIPO_PERFIL', ['Prestação Recebida', 'Mod.Recebimento']) then
      DBComboBox3.Items.Add('Controle Caixa')
    else if (CadPerfilComissao.fequals('TIPO_SERV_PROD', 'Servico')) then
    begin
      DBComboBox3.Items.Add('Tipo Serviço');
      DBComboBox3.Items.Add('Tipo de Segmentação');
    end
    else if (CadPerfilComissao.fmatchText('TIPO_SERV_PROD', ['Produto', 'Produto e Servico'])) then
          if (not CadPerfilComissao.fempty('TIPO_PERFIL')) then
            begin
              DBComboBox3.Items.Add('Controle Caixa');
              DBComboBox3.Items.Add('Tipo Serviço');
              DBComboBox3.Items.Add('Tipo de Segmentação');
              DBComboBox3.Items.Add('Grupo Produto');
            end;

    if DBComboBox3.Items.Count > 0 then
      if DBComboBox3.Items.IndexOf(CadPerfilComissao.fstr('FLAG_SERV_PROD')) >= -1 then
        DBComboBox3.ItemIndex := DBComboBox3.Items.IndexOf(CadPerfilComissao.fstr('FLAG_SERV_PROD'));
  end;

  if (DBComboBox5.Items.Count = 0) then
  begin
    if CadPerfilComissao.fmatchText('TIPO_PERFIL', ['Prestação Recebida', 'Mod.Recebimento']) then
    begin
      DBComboBox5.Items.Add('Valor Geral');
      with CadPerfilComissao do
      begin
        CadPerfilComissao.OnChangeField_Tipo := nil;
        fdata('TIPO_SERV_PROD').SetNull;
        CadPerfilComissao.OnChangeField_Tipo := ChangeAgrupadoPor;
        fdata('EM_CIMA_PERFIL').Put('Valor Geral');
        fdata('FLAG_SERV_PROD').Put('Controle Caixa');
      end;
    end
    else if (not CadPerfilComissao.fempty('TIPO_PERFIL')) then
    begin
      DBComboBox5.Items.Add('Valor Geral');
      DBComboBox5.Items.Add('Lucro Bruto');
    end;
    if DBComboBox5.Items.Count > 0 then
      if DBComboBox5.Items.IndexOf(CadPerfilComissao.fstr('EM_CIMA_PERFIL')) >= -1 then
        DBComboBox5.ItemIndex := DBComboBox5.Items.IndexOf(CadPerfilComissao.fstr('EM_CIMA_PERFIL'));
  end;

  if DBComboBox3.Items.Count > 0 then
  begin
    if DBComboBox3.Items.IndexOf(CadPerfilComissao.fstr('FLAG_SERV_PROD')) >= -1 then
      DBComboBox3.ItemIndex := DBComboBox3.Items.IndexOf(CadPerfilComissao.fstr('FLAG_SERV_PROD'));
    if (CadPerfilComissao.Conteudos.Selecionado <> CadPerfilComissao.fstr('FLAG_SERV_PROD')) or
       ((DBComboBox3.ItemIndex >= 0) and (not CadPerfilComissao.Conteudos.Active)) then
        CadPerfilComissao.Conteudos.Conteudo(CadPerfilComissao.fstr('FLAG_SERV_PROD'));
  end;
  if DBComboBox3.ItemIndex = -1 then
    CadPerfilComissao.Conteudos.Conteudo('Nenhum');

  grid_tipovendas.Enabled := CadPerfilComissao.fdif('TIPO_PERFIL', 'Prestação Recebida');
  grid_tipovendas.Repaint;
  //DBComboBox2.Enabled     := CadPerfilComissao.fdif('TIPO_PERFIL', 'Prestação Recebida');
end;

procedure TfrmCadMetasComissao.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  Label15.Caption := IfThen(CadPerfilComissao.fequals('ABRANG_PERFIL', 'PESO'), '% Peso',  '% Comissão');
end;

procedure TfrmCadMetasComissao.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
//  if DBComboBox2.ItemIndex >= 0 then
//    AtualizarTipo;
end;

procedure TfrmCadMetasComissao.DBComboBox3Change(Sender: TObject);
begin
  inherited;
//  AtualizarSelecao;
end;

procedure TfrmCadMetasComissao.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  if DBComboBox3.ItemIndex >= 0 then
    CadPerfilComissao.Conteudos.Conteudo(CadPerfilComissao.fstr('flag_serv_prod'));
//  if DBComboBox3.ItemIndex >= 0 then
//    CadPerfilComissao.Conteudos.Conteudo(CadPerfilComissao.fstr('flag_serv_prod'));
//                                       IfThen(CadPerfilComissao.vselecao = Trim(DBComboBox3.text), CadPerfilComissao.fstr('conteudo_flag')));
  //if UpperCase(trim(DBComboBox3.text)) = '' then
//    AtualizarSelecao;

//  CadPerfilComissao.Conteudos.Conteudo(CadPerfilComissao.fstr('flag_serv_prod'),
//                                       IfThen(CadPerfilComissao.vselecao = Trim(DBComboBox3.text), CadPerfilComissao.fstr('conteudo_flag')));
end;

procedure TfrmCadMetasComissao.DBComboBox4Exit(Sender: TObject);
begin
  inherited;
//  if DBComboBox4.ItemIndex >= 0  then
//    AtualizarAgrupar;
end;

procedure TfrmCadMetasComissao.DBComboBox5Exit(Sender: TObject);
begin
  inherited;
	//
end;

procedure TfrmCadMetasComissao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadMetasComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DBLookupComboBox1.ListField := '';
  DBLookupComboBox1.KeyField := '';
  if (CadPerfilComissao <> nil) then
    CadPerfilComissao.Cancel;

  if (CadMetasVendas <> nil) then
    CadMetasVendas.Cancel;

  if (CadPerfilMetas <> nil) then
    CadPerfilMetas.Cancel;

  CadPerfilComissao.free;
  CadPerfilComissao := nil;

  CadMetasVendas.free;
  CadMetasVendas := nil;

  CadPerfilMetas.free;
  CadPerfilMetas := nil;

  Action := caFree;
  if (frmCadMetasComissao <> nil) then
    frmCadMetasComissao := nil;

end;

procedure TfrmCadMetasComissao.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadPerfilComissao := TPerfilComissao.create;
  CadMetasVendas := TMetasVendas.create;
  CadPerfilMetas := TPerfisMetas.create;
  tsCadastro.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadMetasComissao.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmCadBasicos.dsPerfilComissao;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS259]';
    grid_conteudo.DataSource := CadPerfilComissao.Conteudos._dataSourceOOP;
    grid_tipovendas.DataSource := CadPerfilComissao.TipoVendas._dataSourceOOP;
  end;

 inherited;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not CadPerfilComissao._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadMetasComissao.grid_conteudoDblClick(Sender: TObject);
begin
  inherited;
//  if not vDadosIni.PesqPros('CLI207', 'ALTERAR', '', 'CLIENTES',
//    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas) then
//    Exit;

  CadPerfilComissao.Conteudos.CheckUnCheckRow();
end;

procedure TfrmCadMetasComissao.grid_conteudoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if not Assigned(TDBGrid(Sender).DataSource) then
    Exit;

  if Trim(TDBGrid(Sender).DataSource.DataSet.FieldByName('sel').AsString) <> 'Z' then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCadMetasComissao.grid_tipovendasDblClick(Sender: TObject);
begin
  inherited;
  CadPerfilComissao.TipoVendas.CheckUnCheckRow();
end;

procedure TfrmCadMetasComissao.lbEmpresaPrint(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadMetasComissao.QRLabel11Print(sender: TObject;
  var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadMetasComissao.qrpPerfisComissaoPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Cadastro de Perfis de Comissão');
end;

procedure TfrmCadMetasComissao.SpeedButton1Click(Sender: TObject);
begin
  try
    if CadPerfilComissao.dataSet.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('BAS258', 'ALTERAR', '', 'PERFIL_COMISSAO',
      CadPerfilComissao.dataSet.FieldByName('CODIGO_PERFIL').AsString, CadPerfilComissao.buscas,
      true) then
      exit;

    if not CadPerfilComissao.Edit then
      Exit;
    inherited;

    Label14.Caption := vDadosIni.IfThen(Trim(DBComboBox3.Text) <> '',
    	Trim(DBComboBox3.Text) + ':', 'Tipo seleção:');

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBLookupComboBox2.KeyValue := 0;
    DBLookupComboBox1.KeyValue := 0;

//    AtualizarAgrupar(true);
//    AtualizarTipo(true);
//    AtualizarSelecao(true);
    //DBComboBox5.Text := trim(CadPerfilComissao.vemcima);
    DBComboBox5.ItemIndex := DBComboBox5.Items.IndexOf(CadPerfilComissao.vemcima);
    CadPerfilComissao.OnChangeField_Tipo := ChangeAgrupadoPor;
    ChangeAgrupadoPor(nil);

    if vDadosIni.vPedVnd.AcrescCondPagComissaoVend then
    	CadPerfilComissao.TipoVendas.CheckUnCheckAllRows(true);

    DBComboBox4.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBComboBox1.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBEdit4.Enabled              := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBComboBox2.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBComboBox5.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBComboBox3.Enabled          := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    btTabelasSelectAll.Enabled   := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    btTabelasUnSelectAll.Enabled := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    grid_tipovendas.Enabled      := not vDadosIni.vPedVnd.AcrescCondPagComissaoVend;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      CadPerfilComissao.Cancel;
      CadPerfilComissao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMetasComissao.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS263', 'ABRIR A LIXEIRA', '', 'PERFIL_COMISSAO',
    '', CadPerfilComissao.buscas, true) then
    Exit;

  inherited;

  if not CadPerfilComissao._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS259]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS260]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadMetasComissao.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('BAS259', 'EXCLUIR', '', 'PERFIL_COMISSAO',
      CadPerfilComissao.dataSet.FieldByName('CODIGO_PERFIL').AsString, CadPerfilComissao.buscas,
      false) then
      Exit;

    CadPerfilComissao.Delete;
    lixeiraVazia(not CadPerfilComissao._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadPerfilComissao.Cancel;
      CadPerfilComissao.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadMetasComissao.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS264', 'IMPRIMIR', '', 'PERFIL_COMISSAO',
    CadPerfilComissao.dataSet.FieldByName('CODIGO_PERFIL').AsString, CadPerfilComissao.buscas, true)
    then
    exit;

  qrpPerfisComissao.Preview;
end;

procedure TfrmCadMetasComissao.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('BAS263', '', '', 'PERFIL_COMISSAO', '', CadPerfilComissao.buscas, false)
    then
    if CadPerfilComissao._restauraLixeira then
      lixeiraVazia(not CadPerfilComissao._lixeiraCheia);
end;

procedure TfrmCadMetasComissao.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS265', 'ALTERAR', '', 'METAS_VENDAS',
    CadMetasVendas.dataSet.FieldByName('CODIGO_META').AsString, CadMetasVendas.buscas,
    true) then
    exit;

  CadMetasVendas._cadMetasVendas(0);

end;

procedure TfrmCadMetasComissao.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS275', 'ALTERAR', '', 'PERFIL_METAS',
    CadPerfilMetas.dataSet.FieldByName('CODIGO_META').AsString + ' - ' +
    CadPerfilMetas.dataSet.FieldByName('CODIGO_META').AsString, CadMetasVendas.buscas,
    true) then
    exit;

  CadPerfilMetas._cadPerfisVendas(0);
end;

procedure TfrmCadMetasComissao.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  PageControl3.ActivePage := TabSheet5;
end;

procedure TfrmCadMetasComissao.TabSheet2Enter(Sender: TObject);
begin
  inherited;
  if Assigned(CadPerfilComissao) and Assigned(CadPerfilComissao.OnChangeField_Tipo) then
    CadPerfilComissao.OnChangeField_Tipo := nil;
end;

end.

