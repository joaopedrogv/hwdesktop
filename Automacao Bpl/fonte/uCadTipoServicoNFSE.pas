unit uCadTipoServicoNFSE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, UDtmProdutos, UClassesProdutos, uDadosIni,
  AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TFrmCadTipoServicoNFSE = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    Label35: TLabel;
    DBEdit2: TDBEdit;
    Label36: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    Label47: TLabel;
    Label15: TLabel;
    procedure Label15Click(Sender: TObject);
    procedure Label47Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    function _mdiAberto(pNomeFormMDI: string): Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTipoServicoNFSE: TFrmCadTipoServicoNFSE;
  TipoServicoNFSE: TTipoServicoNFSE;

implementation

uses
  uDtmAtivo, DB, DBClient, uDataSet_OOP;

procedure AtualizaImposto(Bancohw, codEmpresa: Pchar); external 'Compacta.dll';

{$R *.dfm}

procedure TFrmCadTipoServicoNFSE.BitBtn1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS331', 'PESQUISAR', '', 'TIPOSERVICONFSE', '', TipoServicoNFSE.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not TipoServicoNFSE.ConsultaCampos('TIPOSERVICONFSE', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
        ' TIPOSERVICONFSE.*, NBS.DESCRICAO_NBS', ' LEFT JOIN NBS ON TIPOSERVICONFSE.COD_NBS = NBS.COD_NBS', 'TIPOSERVICONFSE.COD_TPSERVICO IS NOT NULL') then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not TipoServicoNFSE.ConsultaCampos('TIPOSERVICONFSE', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa,
       ' TIPOSERVICONFSE.*, NBS.DESCRICAO_NBS', ' LEFT JOIN NBS ON TIPOSERVICONFSE.COD_NBS = NBS.COD_NBS', 'TIPOSERVICONFSE.COD_TPSERVICO IS NOT NULL') then
       	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadTipoServicoNFSE.BitBtn3Click(Sender: TObject);
begin
  try
    if not TipoServicoNFSE.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBEdit1.Enabled := true;

    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      TipoServicoNFSE.Cancel;
      TipoServicoNFSE.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadTipoServicoNFSE.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not TipoServicoNFSE.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(TipoServicoNFSE.vNomeCampoErro, TipoServicoNFSE.vMensagemErro);
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
      if TipoServicoNFSE.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadTipoServicoNFSE.BitBtn5Click(Sender: TObject);
begin
  inherited;
  TipoServicoNFSE.Cancel;
  TipoServicoNFSE.RollBackTransacao;
end;

procedure TFrmCadTipoServicoNFSE.DBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if not (Key in['0'..'9','.',Chr(8)]) then Key:= #0;
end;

procedure TFrmCadTipoServicoNFSE.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if (trim(TipoServicoNFSE.dataSet.FieldByName('COD_NBS').AsString) <> '')
    and (trim(TipoServicoNFSE.dataSet.FieldByName('COD_NBS').AsString) <> '0') then
    if not TipoServicoNFSE.vNBS._buscarNBS(trim(TipoServicoNFSE.dataSet.FieldByName('COD_NBS').AsString)) then
    begin
      Application.MessageBox('Código NBS não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        DBEdit3.SetFocus;
    end
    else
    begin
     TipoServicoNFSE.dataSet.FieldByName('ALIQNAC').AsFloat := TipoServicoNFSE.vNBS.buscas.FieldByName('ALIQNAC').AsFloat;
     TipoServicoNFSE.dataSet.FieldByName('ALIQIMP').AsFloat := TipoServicoNFSE.vNBS.buscas.FieldByName('ALIQIMP').AsFloat;
    end;
end;

procedure TFrmCadTipoServicoNFSE.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      TipoServicoNFSE.dataSet.FieldByName('COD_NBS').AsString := vDadosIni.pesquisaRapida('NBS');
    finally
      Screen.Cursor := crDefault;
      TipoServicoNFSE.vNBS._abreTodosNBS;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TFrmCadNBS') then
      exit;
    TipoServicoNFSE.AbrirNBS;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        TipoServicoNFSE.dataSet.FieldByName('COD_NBS').AsString := vDadosIni.vPesquisa;
        TipoServicoNFSE.vNBS._abreTodosNBS;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TFrmCadTipoServicoNFSE.DBEdit3KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;

procedure TFrmCadTipoServicoNFSE.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCadTipoServicoNFSE.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if (TipoServicoNFSE <> nil) then
  TipoServicoNFSE.Cancel;

  TipoServicoNFSE.free;
  TipoServicoNFSE := nil;

  Action := caFree;
  if (FrmCadTipoServicoNFSE <> nil) then
    FrmCadTipoServicoNFSE := nil;
end;

procedure TFrmCadTipoServicoNFSE.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  TipoServicoNFSE := TTipoServicoNFSE.create;
  TabSheet3.TabVisible := false;
  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadTipoServicoNFSE.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (TipoServicoNFSE.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TFrmCadTipoServicoNFSE.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsTipoServicoNFSE;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS334]';
  end;
  TipoServicoNFSE._abreTipoServicoNFSE;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(not TipoServicoNFSE._lixeiraCheia);
  end;

  vDadosIni.fechaStatusProcessamento;
  SpeedButton5.Visible := False;
end;

procedure TFrmCadTipoServicoNFSE.Label15Click(Sender: TObject);
var
	AliquotaPercentual, teto: Currency;
  ValorCentavos: Extended;
	CentavosInt: Int64;
begin        
	if DBEdit7.CanFocus then
		DBEdit7.SetFocus;

	AliquotaPercentual := TipoServicoNFSE.ffloat('ALIQ_PIS_RET')
		+ TipoServicoNFSE.ffloat('ALIQ_COFINS_RET')
		+ TipoServicoNFSE.ffloat('ALIQ_CSSL_RET');

	if AliquotaPercentual <= 0 then
	begin
		TipoServicoNFSE.dataSet.FieldByName('ALIQ_PIS_RET').AsFloat := 0;
		TipoServicoNFSE.dataSet.FieldByName('ALIQ_COFINS_RET').AsFloat := 0;
		TipoServicoNFSE.dataSet.FieldByName('ALIQ_CSSL_RET').AsFloat := 0;
		TipoServicoNFSE.dataSet.FieldByName('VL_TETO_CONTRIB').AsFloat := 0;
		Exit;
	end;

  // Calcula o teto mínimo: 1000.5 / aliquota
  ValorCentavos := (1000.5 / AliquotaPercentual) * 100; // em centavos

	// Arredondar para cima (ceil)
  CentavosInt := Trunc(ValorCentavos);
  if ValorCentavos > CentavosInt then
    CentavosInt := CentavosInt + 1;

	TipoServicoNFSE.dataSet.FieldByName('VL_TETO_CONTRIB').AsCurrency := CentavosInt / 100.0;
end;

procedure TFrmCadTipoServicoNFSE.Label47Click(Sender: TObject);
var
	AliquotaPercentual, teto: Currency;
  ValorCentavos: Extended;
	CentavosInt: Int64;
begin
	if DBEdit5.CanFocus then
		DBEdit5.SetFocus;

	AliquotaPercentual := TipoServicoNFSE.ffloat('IRRF_SERVICO');

	if AliquotaPercentual <= 0 then
	begin
		TipoServicoNFSE.dataSet.FieldByName('IRRF_SERVICO').AsFloat := 0;
		TipoServicoNFSE.dataSet.FieldByName('VL_TETO_IRRF').AsFloat := 0;
		Exit;
	end;

  // Calcula o teto mínimo: 1000.5 / aliquota
  ValorCentavos := (1000.5 / AliquotaPercentual) * 100; // em centavos

  // Arredondar para cima (ceil)
  CentavosInt := Trunc(ValorCentavos);
  if ValorCentavos > CentavosInt then
    CentavosInt := CentavosInt + 1;

	TipoServicoNFSE.dataSet.FieldByName('VL_TETO_IRRF').AsCurrency := CentavosInt / 100.0;
end;

procedure TFrmCadTipoServicoNFSE.SpeedButton1Click(Sender: TObject);
begin
  try
    if TipoServicoNFSE.dataSet.IsEmpty then
      Exit;

    if not TipoServicoNFSE.Edit then
      Exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBEdit1.Enabled := false;

    if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
      DBMemo1.SetFocus;

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      TipoServicoNFSE.Cancel;
      TipoServicoNFSE.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadTipoServicoNFSE.SpeedButton25Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS338', 'ABRIR A LIXEIRA', '', 'TIPOSERVICONFSE',
    '', TipoServicoNFSE.buscas, true) then
    Exit;

  inherited;

  if not TipoServicoNFSE._abrelixeira then
  begin
    SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS334]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS335]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TFrmCadTipoServicoNFSE.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    if not TipoServicoNFSE.Delete then
    exit;

    lixeiraVazia(not TipoServicoNFSE._lixeiraCheia);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      TipoServicoNFSE.Cancel;
      TipoServicoNFSE.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadTipoServicoNFSE.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS336', '', '', 'TIPOSERVICONFSE', '', TipoServicoNFSE.buscas, false) then
    if TipoServicoNFSE._restauraLixeira then
      lixeiraVazia(not TipoServicoNFSE._lixeiraCheia);
end;

procedure TFrmCadTipoServicoNFSE.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO265', 'ALTERAR', '', 'NBM', '', TipoServicoNFSE.buscas, True) then
    AtualizaImposto(pchar(vDadosIni.vBancoHW), pchar(vDadosIni.codEmpresa));
end;

function TFrmCadTipoServicoNFSE._mdiAberto(pNomeFormMDI: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

end.
