unit uCadPossiveisClientes;

interface

uses
  Windows, uCadPadraoModal, ComCtrls, DBCtrls, ExtCtrls, Menus, Buttons, Grids,
  DBGrids, Controls, StdCtrls, Mask, Forms, Classes, UClassesClientes, AppEvnts,
  Graphics, uCadPadrao;

type
  TInscricaoEstadual = function(const Insc, UF: string): Integer; stdcall;
  TFrmCadPossiveisCliente = class(TfrmCadPadraoM)
    Panel6: TPanel;
    GroupBox11: TGroupBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label32: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label7: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    Panel7: TPanel;
    ProgressBar1: TProgressBar;
    BitBtn8: TBitBtn;
    DBEdit3: TDBEdit;
    Label101: TLabel;
    Label102: TLabel;
    DBEdit69: TDBEdit;
    Label114: TLabel;
    DBEdit84: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    DBMemo1: TDBMemo;
    Label22: TLabel;
    TabSheet4: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    Label24: TLabel;
    DBMemo2: TDBMemo;
    CheckBoxObservacao: TCheckBox;
    Label28: TLabel;
    DBEdit16: TDBEdit;
    Label338: TLabel;
    DBEdit199: TDBEdit;
    Label339: TLabel;
    DBEdit200: TDBEdit;
    SpeedButton15: TSpeedButton;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton15Click(Sender: TObject);
    procedure CheckBoxObservacaoClick(Sender: TObject);
    procedure DBEdit84Exit(Sender: TObject);
    procedure DBEdit84KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure BitBtn6Exit(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit32Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBEdit26Exit(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure DBComboBox6Exit(Sender: TObject);
    procedure DBComboBox4Exit(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox6Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBLookupComboBox7Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mostrarAbaObservacao;
  private
        { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadPossiveisCliente: TFrmCadPossiveisCliente;
  PCliente: TPossivelCliente;
  TipoCliente: TTipoCliente;

implementation

uses uDataSet_OOP, UClassesCadastrosBasicos, UDtmClientes, uDtmAtivo, DB,
  SysUtils, Variants;

{$R *.dfm}

procedure TFrmCadPossiveisCliente.BitBtn1Click(Sender: TObject);
var
  vSqlAdicional: string;
begin
  if vDadosIni.PesqPros('CLI039', 'PESQUISAR', '', 'CLIENTES', '', PCliente.buscas, true) then
  begin
    inherited;
    Screen.Cursor := crHourGlass;
    if MaskEdit2.Visible then
    begin
      if not PCliente.ConsultaCampos('CLIENTES', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 2) then
      begin
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      	  combobox1.setfocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        DBGrid1.SetFocus;
    end
    else
    begin
      if not PCliente.ConsultaCampos('CLIENTES', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa, 2) then
      begin
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        	ComboBox1.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        DBGrid1.SetFocus;
    end;
    PCliente.ultimasql := PCliente.dataSet.CommandText;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPossiveisCliente.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'I', PCliente.buscas) then
    Exit;

  if not vDadosIni.PesqPros('CLI034', 'INCLUINDO P. CLIENTES', '', 'CLIENTES', '', PCliente.buscas, true) then
  	Exit;

  if not PCliente.Insert then
    Exit;

  inherited;

  TabSheet3.TabVisible := true;
  PageControl3.ActivePage := TabSheet3;

  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
    DBEdit6.SetFocus;
  
  CheckBoxObservacao.Checked := _LerConfiguracoesRegistroBoolean('CheckBoxObservacao');
  mostrarAbaObservacao;

  DBEdit5.DataField := 'NOME_UF';
  DBLookupComboBox1.KeyField := 'CODIGO_UF';
  DBLookupComboBox1.ListField := 'SIGLA_UF';
  DBLookupComboBox7.KeyField := 'COD_BAIRRO';
  DBLookupComboBox7.ListField := 'NOME_BAIRRO';
  DBLookupComboBox6.KeyField := 'COD_CIDADE';
  DBLookupComboBox6.ListField := 'NOME_CIDADE';
end;

procedure TFrmCadPossiveisCliente.BitBtn4Click(Sender: TObject);
var
  HandleIE: THandle;
  InscricaoEstadual: TInscricaoEstadual;
  resultadoIE: integer;
  campo: string;
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  PageControl3.ActivePage := TabSheet3;
  if not PCliente.TestaInscEstadual then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit13.CanFocus) then
    	DBEdit13.SetFocus;
    exit
  end
  else if not PCliente.ValidaInscEstadual then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit13.CanFocus) then
    	DBEdit13.SetFocus;
    exit;
  end;

  if not PCliente.DadosPessoaisObrigatorios  then
  begin
    setFocusCampoErro(PCliente.vNomeCampoErro, PCliente.vMensagemErro);
    exit;
  end;

  if not PCliente.Post then
 	  Exit;

  inherited;
  _GravaConfiguracoesBoolean('CheckBoxObservacao', CheckBoxObservacao.Checked);
end;

procedure TFrmCadPossiveisCliente.BitBtn5Click(Sender: TObject);
begin
  inherited;
  TabSheet2.Show;

  PCliente.Cancel;
	PCliente.RollBackTransacao;
end;

procedure TFrmCadPossiveisCliente.BitBtn6Exit(Sender: TObject);
begin
  inherited;
  if CheckCadSeq.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (CheckCadSeq.CanFocus) then
    	CheckCadSeq.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
end;

procedure TFrmCadPossiveisCliente.btSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    PCliente._marcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadPossiveisCliente.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    PCliente._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadPossiveisCliente.CheckBoxObservacaoClick(Sender: TObject);
begin
  inherited;
  mostrarAbaObservacao;
end;

procedure TFrmCadPossiveisCliente.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  if trim(PCliente.dataSet.FieldByName('CATEGORIA').AsString) <> '' then
  begin
    if not ((pos('CCJ', trim(PCliente.dataSet.FieldByName('CATEGORIA').AsString)) = 1) or
      (pos('CCF', trim(PCliente.dataSet.FieldByName('CATEGORIA').AsString)) = 1) or
      (pos('CNJ', trim(PCliente.dataSet.FieldByName('CATEGORIA').AsString)) = 1) or
      (pos('CNF', trim(PCliente.dataSet.FieldByName('CATEGORIA').AsString)) = 1)) then
    begin
      Application.MessageBox('Selecione ''CCJ'', ''CCF'', ''CNJ'' ou ''CNF''', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
      	DBComboBox3.SetFocus;
    end;
  end
  else
    PCliente.dataSet.FieldByName('CATEGORIA').AsVariant := null;
end;

procedure TFrmCadPossiveisCliente.DBComboBox4Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if (PCliente.dataSet.FieldByName('SEXO').AsString = '') and (PCliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') then
    begin
      Application.MessageBox('Sexo do Cliente não informado.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox4.CanFocus) then
      	DBComboBox4.SetFocus;
    end
end;

procedure TFrmCadPossiveisCliente.DBComboBox6Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not PCliente.ChecaTipVendaCliExiste then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBComboBox6.CanFocus) then
      	DBComboBox6.SetFocus;
      exit;
    end;
end;

procedure TFrmCadPossiveisCliente.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI010', 'PESQUISAR', '', 'CLIENTES', '', PCliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          PCliente.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
        	DBLookupComboBox7.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
  	DBLookupComboBox7.SetFocus;
end;

procedure TFrmCadPossiveisCliente.DBEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    vBairro:TBairros;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI010', 'PESQUISAR', '', 'CLIENTES', '', PCliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          PCliente.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);

        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
        	DBLookupComboBox7.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI011', 'CADASTRAR', '', 'CLIENTES', '', PCliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vBairro.CadBairro(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

end;

procedure TFrmCadPossiveisCliente.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'CLIENTES', '', PCliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          PCliente.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);

        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
       	  DBLookupComboBox6.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
  	DBLookupComboBox6.SetFocus;
end;

procedure TFrmCadPossiveisCliente.DBEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  vCidade:TCidades;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'CLIENTES', '', PCliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          PCliente.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);

        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
        	DBLookupComboBox6.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI013', 'INCLUIR', '', 'CLIENTES', '', PCliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vCidade.CadCidade(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if Pcliente.dataSet.FieldByName('CEP').IsNull then
    begin
      Application.MessageBox('CEP não informado' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
      	DBEdit12.SetFocus;
    end;
end;

procedure TFrmCadPossiveisCliente.DBEdit13Exit(Sender: TObject);
var
  HandleIE: THandle;
  InscricaoEstadual: TInscricaoEstadual;
  resultadoIE: integer;
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not PCliente.TestaInscEstadual then
    exit
  else
  begin
    resultadoIE := InscricaoEstadual(PChar(PCliente.dataSet.FieldByName('INSC_EST').AsString), PChar(PCliente.Cli.RetornaUF(PCliente.dataSet.FieldByName('CODIGO_UF').AsInteger)));
    if resultadoIE <> 0 then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit13.CanFocus) then
      	DBEdit13.setfocus;
    {
    HandleIE := 0;
    try
      HandleIE := LoadLibrary('DllInscE32.dll');
      if HandleIE <> 0 then
      begin
        @InscricaoEstadual := GetProcAddress(HandleIE, 'ConsisteInscricaoEstadual');
        resultadoIE := InscricaoEstadual(PChar(PCliente.dataSet.FieldByName('INSC_EST').AsString), PChar(PCliente.Cli.RetornaUF(PCliente.dataSet.FieldByName('CODIGO_UF').AsInteger)));
        if resultadoIE = 1 then
        begin
          Application.MessageBox(PChar('Inscricao Estadual do Cliente incorreta para o estado ' + PCliente.Cli.RetornaUF(PCliente.dataSet.FieldByName('CODIGO_UF').AsInteger)), 'Informação', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
          if (Self.Enabled) and (Self.Visible) and (dbedit13.CanFocus) then
          	dbedit13.setfocus;
        end
        else if resultadoIE <> 0 then
        begin
          Application.MessageBox(PChar('Inscrição Estadual informada com caracteres impróprios ou UF ''' + PCliente.Cli.RetornaUF(PCliente.dataSet.FieldByName('CODIGO_UF').AsInteger) + ''' do cliente inexistente.'), 'Informação', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
          if (Self.Enabled) and (Self.Visible) and (dbedit13.CanFocus) then
          	dbedit13.setfocus;
        end;
      end
      else
        Application.MessageBox(PChar('DLL para validação de Incdcrição Estadual não encontrada'), 'Informação', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    finally
      FreeLibrary(HandleIE);
    end;
    }
  end;
end;

procedure TFrmCadPossiveisCliente.DBEdit20Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if PCliente.dataSet.FieldByName('DATA_NASC').AsDateTime > date then
    begin
      Application.MessageBox('Data de Nascimento maior que data atual.' + chr(13) + 'Favor verificar.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
      	DBEdit20.SetFocus;
    end
    else if (PCliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') and (PCliente.dataSet.FieldByName('DATA_NASC').IsNull) then
    begin
      Application.MessageBox('Data de nascimento não informada.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
      	DBEdit20.SetFocus;
    end;
end;

procedure TFrmCadPossiveisCliente.DBEdit25Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if (PCliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') and (trim(PCliente.dataSet.FieldByName('PAI').asstring) = '') then
    begin
      Application.MessageBox('Filiação não informada.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
      	DBEdit25.SetFocus;
    end
end;

procedure TFrmCadPossiveisCliente.DBEdit26Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if (PCliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') and (trim(PCliente.dataSet.FieldByName('MAE').asstring) = '') then
    begin
      Application.MessageBox('Filiação não informada.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
      	DBEdit26.SetFocus;
    end
end;

procedure TFrmCadPossiveisCliente.DBEdit32Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if (PCliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') and (trim(PCliente.dataSet.FieldByName('RG').asstring) = '') then
    begin
      Application.MessageBox('RG não informado.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
      	DBEdit32.SetFocus;
    end
end;

procedure TFrmCadPossiveisCliente.DBEdit6Enter(Sender: TObject);
begin
  inherited;
  PCliente.dataSet.FieldByName('CPFCGC').EditMask := '';
end;

procedure TFrmCadPossiveisCliente.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  if trim(PCliente.dataSet.FieldByName('CPFCGC').AsString) = '' then
    exit;
//    if vDadosIni.vConfCPF = 'N' then
//      exit;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if not PCliente.TestaCPFCNPJ then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
      	DBEdit6.SetFocus;
    end
    else
    begin
      if vDadosIni.vCliente.vConfCPF then
        if PCliente.JaExisteCPFCNPJ then
        begin
        	if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
        	  DBEdit6.SetFocus;
          exit;
        end;
      PCliente._importarClienteOutraEmpresa;
      if PCliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;' then
      begin
        dbedit20.enabled := true;
        dbcombobox5.enabled := true;
        DBComboBox4.enabled := true;
        DBComboBox5.enabled := true;
        dbedit25.enabled := true;
        dbedit26.enabled := true;
        dbedit27.enabled := true;
        dbedit32.enabled := true;
        if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
        	DBComboBox3.SetFocus;
      end
      else
      begin
        dbedit20.enabled := false;
        DBComboBox4.enabled := false;
        DBComboBox5.enabled := false;
        dbedit25.enabled := false;
        dbedit26.enabled := false;
        dbedit27.enabled := false;
        dbedit32.enabled := false;
      end;
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if trim(PCliente.dataSet.FieldByName('NOME_CLIENTE').AsString) = '' then
    begin
      Application.MessageBox('Nome do Cliente não informado.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
      	DBEdit7.SetFocus;
    end;
  if (trim(PCliente.dataSet.FieldByName('RAZAO').AsString) = '') and (trim(PCliente.dataSet.FieldByName('NOME_CLIENTE').AsString) <> '') then
    PCliente.dataSet.FieldByName('RAZAO').AsString := trim(PCliente.dataSet.FieldByName('NOME_CLIENTE').AsString);
end;

procedure TFrmCadPossiveisCliente.DBEdit84Exit(Sender: TObject);
begin
  inherited;
  if not PCliente._LocalizaVendedor(DBLookupComboBox5) then
    if (Self.Enabled) and (Self.Visible) and (DBEdit84.CanFocus) then
    	DBEdit84.SetFocus;
end;

procedure TFrmCadPossiveisCliente.DBEdit84KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'COLABORADOR', '', PCliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR');
        if vDadosIni.vPesquisa <> '' then
          PCliente.dataSet.FieldByName('COD_VENDEDOR').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if trim(PCliente.dataSet.FieldByName('RAZAO').asstring) = '' then
    begin
      Application.MessageBox('Razao Social não Informada' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
      	DBEdit8.SetFocus;
    end
end;

procedure TFrmCadPossiveisCliente.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if trim(PCliente.dataSet.FieldByName('ENDERECO').AsString) = '' then
    begin
      Application.MessageBox('Endereço do Cliente não informado.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      	DBEdit9.SetFocus;
    end;
end;

procedure TFrmCadPossiveisCliente.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	PCliente._marcaDesmarcaLinha;
end;

procedure TFrmCadPossiveisCliente.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if PCliente.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadPossiveisCliente.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_SPACE) then
  	PCliente._marcaDesmarcaLinha
  else if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);  
end;

procedure TFrmCadPossiveisCliente.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if PCliente.dataSet.FieldByName('CODIGO_UF').IsNull then
    begin
      Application.MessageBox('UF não informado.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
      	DBLookupComboBox1.SetFocus;
    end
    else
    begin
    	PCliente.SetNomeEstado;
      if trim(PCliente.dataSet.FieldByName('ESTADOS_UF').AsString) = '' then
      begin
        Application.MessageBox('Estado do Cliente em branco.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
        	DBLookupComboBox7.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var
  vEstado:TEstados;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI014', 'PESQUISAR', '', 'CLIENTES', '', PCliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('ESTADOS');
        if vDadosIni.vPesquisa <> '' then
          PCliente.dataSet.FieldByName('CODIGO_UF').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI015', 'INCLUIR', '', 'CLIENTES', '', PCliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vEstado.CadEstado(1);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

end;

procedure TFrmCadPossiveisCliente.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if PCliente.dataSet.FieldByName('CODIGO_TIPO').IsNull then
    begin
      Application.MessageBox('Tipo Cliente não informado.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
      	DBLookupComboBox2.SetFocus;
    end
    else
    begin
      PCliente.SetNomeTipoCliente;
      if trim(PCliente.dataSet.FieldByName('DESC_TP_CLIENTE').AsString) = '' then
      begin
        Application.MessageBox('Tipo Cliente em branco.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
      	  DBLookupComboBox6.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.DBLookupComboBox6Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if PCliente.dataSet.FieldByName('COD_CIDADE').IsNull then
    begin
      Application.MessageBox('Cidade não informada.' + chr(13) + 'Campo Requerido.', 'Informação', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) then
      	DBEdit11.SetFocus;
    end
    else
    begin
      PCliente.SetNomeCidade;
      if trim(PCliente.dataSet.FieldByName('CIDADE').AsString) = '' then
      begin
        Application.MessageBox('Cidade do Cliente em branco.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
        	DBLookupComboBox6.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.DBLookupComboBox7Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
  begin
    if PCliente.dataSet.FieldByName('COD_BAIRRO').IsNull then
    begin
      Application.MessageBox('Bairro não informado.' + chr(13) + 'Campo Requerido.', 'Informação', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
      	DBEdit10.SetFocus;
    end
    else
    begin
      PCliente.SetNomeBairro;
      if trim(PCliente.dataSet.FieldByName('BAIRRO').AsString) = '' then
      begin
        Application.MessageBox('Bairro do Cliente em branco.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
      	  DBLookupComboBox7.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if PCliente.dataSet.State = dsInsert then
  begin
    if Application.MessageBox('Você estava cadastrando um novo cliente.' + chr(13) + 'Deseja cancelar o cadastro e sair?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes then
    begin
      PCliente.Cancel;
      PCliente.RollBackTransacao;
    end
    else
    begin
      TabSheet3.Show;
      if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
      	DBEdit6.SetFocus;
      abort;
    end
  end
  else
  begin
    PCliente.Post;
    if not PCliente.confirmaAlteracao then
    begin
      TabSheet3.Show;
      PCliente.dataSet.Edit;
      if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
      	DBEdit6.SetFocus;
      abort;
    end
    else if PCliente.emTransacao then
    begin
      PCliente.Cancel;
      PCliente.RollBackTransacao;
    end;
  end;
  PCliente.Destroy;
  Action := caFree;
  FrmCadPossiveisCliente := nil;
end;

procedure TFrmCadPossiveisCliente.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  setNomeTabela('CLIENTES', vDadosIni.vEmp.vCampoPadraoCli);
  PCliente := TPossivelCliente.create;
  TipoCliente := TTipoCliente.Create;
  PCliente.abrePossivelCliente;
  alturaForm := TabSheet3.ClientHeight;
  larguraForm := TabSheet3.ClientWidth;
  alturaDefault := panel6.Height;
  larguraDefault := panel6.Width;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadPossiveisCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_INSERT) and (TabSheet2.Visible) then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (PCliente.dataSet.State in [dsEdit, dsInsert]) and (TabSheet1.Visible) then
    begin
      if ActiveControl is Tdbedit then
      begin
        if TdataSet(TdbEdit(ActiveControl).DataSource.DataSet).FindField(TdbEdit(ActiveControl).DataField).EditMask = '' then
          if Application.MessageBox('Deseja sair desta tela de cadastro?.', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
          begin
            ActiveControl := BitBtn5;
            BitBtn5Click(Sender);
          end;
      end
      else
      begin
        ActiveControl := BitBtn5;
        BitBtn5Click(Sender);
      end;
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.FormResize(Sender: TObject);
begin
  inherited;
  if (ScrollBox3.Height >= alturaForm) and (ScrollBox3.Width >= larguraForm) then
  begin
    panel6.Align := alClient;
  end
  else
  begin
    if ScrollBox3.Height <= alturaForm then
    begin
      panel6.Align := alNone;
      panel6.Height := alturaDefault;
    end;
    if ScrollBox3.Width <= larguraForm then
    begin
      begin
        panel6.Align := alNone;
        panel6.Width := larguraDefault;
      end;
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmClientes.dsPossivelCli;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if vDadosIni.vEmp.vCNPJ = '03530705000109' then
  begin
    Label338.Visible := true;
    DBEdit199.Visible := true;
    Label339.Visible := true;
    DBEdit200.Visible := true;
  end
  else
  begin
    Label338.Visible := False;
    DBEdit199.Visible := False;
    Label339.Visible := False;
    DBEdit200.Visible := False;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
end;

procedure TFrmCadPossiveisCliente.mostrarAbaObservacao;
begin
 TabSheet4.TabVisible := CheckBoxObservacao.Checked;
 TabSheet4.Visible := CheckBoxObservacao.Checked;
 Label22.Visible := not CheckBoxObservacao.Checked;
 DBMemo1.Visible := not CheckBoxObservacao.Checked;
end;

procedure TFrmCadPossiveisCliente.SpeedButton15Click(Sender: TObject);
var
  CEPs: TCEP;
  ListaCep: TStringList;
  lBairros: TListaBairros1;
  lCidades: TListaCidades1;
  lEstado: TListaEtados1;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
  	DBEdit9.SetFocus;
  ListaCep := CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(
    PCliente.dataSet.FieldByName('CEP').AsString);
  //  if(CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(
  //  PCliente.dataSet.FieldByName('CEP').AsString)[0] = '') then
  if (ListaCep[0] = '') then
  begin
    if (CEPs._ConsultarWebService(PCliente.dataSet.FieldByName('CEP').AsString)) then
    begin
      ListaCep :=
        CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(PCliente.dataSet.FieldByName('CEP').AsString);
      if (ListaCep[0] <> '') then
      begin
        lBairros := TListaBairros1.create;
        lBairros.buscas.Close;
        lBairros.buscas.Open;
        lCidades := TListaCidades1.create;
        lCidades.buscas.Close;
        lCidades.buscas.Open;
        lEstado := TListaEtados1.create;
        lEstado.buscas.Close;
        lEstado.buscas.Open;

        PCliente.abreBairros;
//        PCliente.abreBairrosC;
        PCliente.abreCidades;
//        PCliente.abreCidadesC;

        PCliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
        PCliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
        PCliente.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
        PCliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];
        lBairros.Free;
        lBairros := nil;
        lCidades.Free;
        lCidades := nil;
        lEstado.Free;
        lEstado := nil;
      end;
    end;
  end else if ListaCep[0] <> '' then
  begin
    //    if PCliente.dataSet.FieldByName('COD_BAIRRO').IsNull then
    PCliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
    //    if PCliente.dataSet.FieldByName('COD_CIDADE').IsNull then
    PCliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
    //    if PCliente.dataSet.FieldByName('CODIGO_UF').IsNull then
    PCliente.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
    //    if PCliente.dataSet.FieldByName('ENDERECO').IsNull then
    PCliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
  	DBEdit12.SetFocus;
end;

procedure TFrmCadPossiveisCliente.SpeedButton1Click(Sender: TObject);
var
  i: integer;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'A', PCliente.buscas) then
    Exit;

  if not vDadosIni.PesqPros('CLI035', 'ALTERAR', '', 'CLIENTES', PCliente.dataSet.FieldByName('COD_CLIENTE').AsString, PCliente.buscas, true) then
  	Exit;

  if PCliente.dataSet.IsEmpty then
    Exit;

  if not PCliente.Edit then
    Exit;

  inherited;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
  PageControl3.ActivePage := TabSheet3;
  TabSheet3.TabVisible := true;

  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
    DBEdit6.SetFocus;

  CheckBoxObservacao.Checked := _LerConfiguracoesRegistroBoolean('CheckBoxObservacao');
  mostrarAbaObservacao;

  PCliente._LocalizaVendedor(DBLookupComboBox5);

  DBEdit5.DataField := 'NOME_UF';
  DBLookupComboBox1.KeyField := 'CODIGO_UF';
  DBLookupComboBox1.ListField := 'SIGLA_UF';
  DBLookupComboBox7.KeyField := 'COD_BAIRRO';
  DBLookupComboBox7.ListField := 'NOME_BAIRRO';
  DBLookupComboBox6.KeyField := 'COD_CIDADE';
  DBLookupComboBox6.ListField := 'NOME_CIDADE';
end;

procedure TFrmCadPossiveisCliente.SpeedButton2Click(Sender: TObject);
begin
	if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'E', PCliente.buscas) then
    Exit;
  PCliente.Delete;
end;

procedure TFrmCadPossiveisCliente.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('CLI037', 'GERAR ETIQUETA', '', 'CLIENTES', '', PCliente.buscas, true) then
    PCliente.ImprimirEtiquetasQRP('CLIENTES', 'Etiquetas de Possíveis Clientes', DBGrid1, false, false);
end;

procedure TFrmCadPossiveisCliente.SpeedButton8Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI038', 'TRANSFERIR P. CLIENTE P/ CLIENTE', PCliente.dataSet.FieldByName('COD_CLIENTE').AsString, 'CLIENTES', '', PCliente.buscas, true) then
  begin
    inherited;
    if not PCliente.IsEmpty then
    begin
      if PCliente.Edit then
      begin
        PCliente.dataSet.FieldByName('ATIVO').AsInteger := 1;
        PCliente.Post;
        PCliente.Apply;
      end;
      vDadosIni.vPesquisa := 'EDITAR_CLIENTE|' + PCliente.dataSet.FieldByName('COD_CLIENTE').AsString + '|';
      PCliente.dataSet.Refresh;
      PCliente.Cli.CadCliente(2);
    end;
  end;
end;

procedure TFrmCadPossiveisCliente.TabSheet2Show(Sender: TObject);
begin
  inherited;
  PCliente.dataSet.FieldByName('CPFCGC').EditMask := '';
  SpeedButton25.Visible := PCliente.Cli.StatusLixeira;
end;

initialization
  RegisterClass(TFrmCadPossiveisCliente);
finalization
  UnRegisterClass(TFrmCadPossiveisCliente);
end.

