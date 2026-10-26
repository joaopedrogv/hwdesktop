unit uCadConfigWS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, UDtmConfig,
  uDtmAtivo, DB, CheckLst, Registry, IBDatabase;
                                    
type
  TfrmCadConfigWS = class(TfrmCadPadraoM)
    lbToken: TLabel;
    pmPermitidas: TPopupMenu;
    RemoverItem: TMenuItem;
    pmBloqueadas: TPopupMenu;
    MenuItem1: TMenuItem;
    pmSelecionarTudo: TPopupMenu;
    SelecionarTodos: TMenuItem;
    DesmarcarTodos: TMenuItem;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label6: TLabel;
    Panel11: TPanel;
    Label83: TLabel;
    TabSheet5: TTabSheet;
    pnTabela: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBComboBox2: TDBComboBox;
    Label9: TLabel;
    DBComboBox3: TDBComboBox;
    Label10: TLabel;
    DBComboBox4: TDBComboBox;
    Label11: TLabel;
    DBComboBox5: TDBComboBox;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit3: TDBEdit;
    DBComboBox6: TDBComboBox;
    Panel15: TPanel;
    BitBtn67: TBitBtn;
    BitBtn77: TBitBtn;
    gbCampos: TGroupBox;
    Panel6: TPanel;
    Panel9: TPanel;
    btSelectAllCampos: TSpeedButton;
    btUnSelectAllCampos: TSpeedButton;
    TabSheet12: TTabSheet;
    pnTabelasNaoReplicadas: TPanel;
    Label15: TLabel;
    GroupBox4: TGroupBox;
    DBGrid5: TDBGrid;
    Panel13: TPanel;
    ComboBox4: TComboBox;
    BitBtn17: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn119: TBitBtn;
    pnCadastrosBasicos: TPanel;
    Label16: TLabel;
    GroupBox5: TGroupBox;
    DBGrid6: TDBGrid;
    Panel14: TPanel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    ComboBox7: TComboBox;
    pnDependencia: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    GroupBox6: TGroupBox;
    DBGrid7: TDBGrid;
    Panel16: TPanel;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    ComboBox13: TComboBox;
    Label25: TLabel;
    label27: TLabel;
    Bevel1: TBevel;
    Label26: TLabel;
    TabSheet4: TTabSheet;
    pnListaTabelas: TPanel;
    Panel7: TPanel;
    btSelectAllTab: TSpeedButton;
    DBGrid3: TDBGrid;
    Panel18: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SpeedButton13: TSpeedButton;
    Label211: TLabel;
    Edit3: TEdit;
    Panel5: TPanel;
    Label29: TLabel;
    Panel17: TPanel;
    Label30: TLabel;
    Edit1: TEdit;
    DBEdit4: TDBEdit;
    Label28: TLabel;
    DBGrid4: TDBGrid;
    Panel8: TPanel;
    Label14: TLabel;
    Label31: TLabel;
    pmEmpresas: TPopupMenu;
    copiarConf: TMenuItem;
    colarConf: TMenuItem;
    CopiarSchema1: TMenuItem;
    ColarSchema1: TMenuItem;
    ClonarSchema1: TMenuItem;
    ckEmpresasTab: TCheckBox;
    ckEmpresasCampos: TCheckBox;
    DBEdit5: TDBEdit;
    Label32: TLabel;
    gbEmpresas: TGroupBox;
    Splitter4: TSplitter;
    Panel4: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBGrid2: TDBGrid;
    Label33: TLabel;
    DBEdit6: TDBEdit;
    SpeedButton14: TSpeedButton;
    btSelectUnSelectAllCampos: TSpeedButton;
    Label34: TLabel;
    Label35: TLabel;
    DBComboBox7: TDBComboBox;
    TabSheet6: TTabSheet;
    pnReplicacoes: TPanel;
    PopupMenu3: TPopupMenu;
    Marcarcomoconcludo1: TMenuItem;
    Panel10: TPanel;
    BitBtn99: TBitBtn;
    BitBtn13: TBitBtn;
    Label41: TLabel;
    DBGrid8: TDBGrid;
    Panel19: TPanel;
    Demarcacomoconcludo1: TMenuItem;
    Panel12: TPanel;
    Panel24: TPanel;
    Panel20: TPanel;
    Label36: TLabel;
    Label38: TLabel;
    Label37: TLabel;
    TabSheet7: TTabSheet;
    Panel27: TPanel;
    Label46: TLabel;
    pnScript: TPanel;
    TabSheet9: TTabSheet;
    Panel23: TPanel;
    PageControl2: TPageControl;
    pnScriptM: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    Panel21: TPanel;
    ComboBox14: TComboBox;
    ComboBox15: TComboBox;
    Memo1: TMemo;
    Memo2: TMemo;
    BitBtn25: TBitBtn;
    Label43: TLabel;
    DBComboBox8: TDBComboBox;
    SpeedButton15: TSpeedButton;
    procedure DBGrid3CellClick(Column: TColumn);
    procedure SpeedButton15Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBComboBox8Exit(Sender: TObject);
    procedure ckEmpresasTabClick(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn_F5_ScriptClick(Sender: TObject);
    procedure DBGrid9DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn24Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure Demarcacomoconcludo1Click(Sender: TObject);
    procedure DBGrid8DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid8TitleClick(Column: TColumn);
    procedure BitBtn99Click(Sender: TObject);
    procedure Marcarcomoconcludo1Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure btSelectUnSelectAllCamposClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure ClonarSchema1Click(Sender: TObject);
    procedure ColarSchema1Click(Sender: TObject);
    procedure CopiarSchema1Click(Sender: TObject);
    procedure colarConfClick(Sender: TObject);
    procedure copiarConfClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure DBGrid7TitleClick(Column: TColumn);
    procedure DBGrid6TitleClick(Column: TColumn);
    procedure ComboBox11Exit(Sender: TObject);
    procedure ComboBox8Exit(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure BitBtn119Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure btUnSelectAllCamposClick(Sender: TObject);
    procedure btSelectAllCamposClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn13Click(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure BitBtn77Click(Sender: TObject);
    procedure BitBtn67Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure btSelectAllTabClick(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure atribuirValorCamposTabela;
    procedure marcarDesmarcaTabela;
    procedure KeyDownTabela(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KeyDownCampos(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KeyDownReplicacao(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KeyDownNaoReplicar(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KeyDownCadastros(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KeyDownDependencia(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KeyDownScript(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure marcarDesmarcaCampos;
    procedure marcarDesmarcaEmpresa;
    procedure voltaTelaConsulta(Sender: TObject);
    procedure salvarDados;
    procedure atualizarDados;
    procedure salvarDadosScript(vStatus, vErro: string);
    procedure botaoConsultar(Sender: TObject);
    procedure botaoExecutar(Sender: TObject);
    procedure onGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure onDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
    	DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure onDblClick(Sender: TObject);
    procedure onDBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    vSql, vIndex: string;
    vRecNo: Integer;
    vComponentesCriados: Boolean;
  end;

var
  frmCadConfigWS: TfrmCadConfigWS;

implementation

uses uClassesConfigWS, uDataSet_OOP, uDadosIni, DBClient, IBQuery;

{$R *.dfm}

procedure TfrmCadConfigWS.atribuirValorCamposTabela;
begin
    if not (vConfigWS.vEmpresa.vTabelas.dataSet.State in [dsInsert, dsEdit]) then
	    vConfigWS.vEmpresa.vTabelas.dataSet.Edit;
    if (vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('RECEBER').AsString = 'S') then
    	DBComboBox2.ItemIndex := 0
    else
      DBComboBox2.ItemIndex := 1;

    if (vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('ENVIAR').AsString = 'S') then
    	DBComboBox3.ItemIndex := 0
    else
      DBComboBox3.ItemIndex := 1;

    if (vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('INSERIR').AsString = 'S') then
    	DBComboBox4.ItemIndex := 0
    else
      DBComboBox4.ItemIndex := 1;

    if (vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('ALTERAR').AsString = 'S') then
    	DBComboBox5.ItemIndex := 0
    else
      DBComboBox5.ItemIndex := 1;

    if (vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('DELETAR').AsString = 'S') then
    	DBComboBox6.ItemIndex := 0
    else
      DBComboBox6.ItemIndex := 1;

    if (vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('S_EMP_FIS').AsString = 'S') then
    	DBComboBox7.ItemIndex := 0
    else
      DBComboBox7.ItemIndex := 1;
end;

procedure TfrmCadConfigWS.atualizarDados;
var
	I, J: Integer;
  vNomeSchema: string;
begin
  try
    vNomeSchema := '';
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TTabSheet) then
      begin
        if (PageControl2.ActivePage = TTabSheet(Components[I])) then
        begin
          vNomeSchema := StringReplace(TTabSheet(Components[I]).Name, 'Tabsheet', '', []);
          Break;
        end;
      end;
    end;

    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TClientDataSet) then
      begin
      	if (TClientDataSet(Components[I]).Name = 'fTempScript' + vNomeSchema) then
        begin
        	vSchemaScript.buscas.Close;
          vSchemaScript.buscas.SQL.Text := ' SELECT * FROM WSR_SCRIPTS ' +
            ' WHERE TIPO = ''S'' and TOKEN = ' + QuotedStr(vNomeSchema) +
            ' ORDER BY COD_SCRIPT ASC ';
          vSchemaScript.buscas.Open;
          vSchemaScript.buscas.FetchAll;

          TClientDataSet(Components[I]).EmptyDataSet;
          vSchemaScript.buscas.First;
          while not vSchemaScript.buscas.Eof do
          begin
            TClientDataSet(Components[I]).Insert;
            TClientDataSet(Components[I]).FieldByName('SQL').AsString := vSchemaScript.buscas.FieldByName('SQL').AsString;
            TClientDataSet(Components[I]).FieldByName('USER_BANCO').AsString := vSchemaScript.buscas.FieldByName('USER_BANCO').AsString;
            TClientDataSet(Components[I]).FieldByName('ERRO').AsString := vSchemaScript.buscas.FieldByName('ERRO').AsString;
            TClientDataSet(Components[I]).FieldByName('STATUS').AsString := vSchemaScript.buscas.FieldByName('STATUS').AsString;
            TClientDataSet(Components[I]).Post;

            vSchemaScript.buscas.Next;
          end;
          vSchemaScript.buscas.First;
          TClientDataSet(Components[I]).First;
          break;
        end;
      end;
    end;

    for I := 0 to ComponentCount - 1 do
   	begin
     	 if (Components[I] is TDBGrid) then
      		if (TDBGrid(Components[I]).Name = 'DBGridScript' + vNomeSchema) then
          begin
              for J := 0 to TDBGrid(Components[I]).Columns.Count - 1 do
              begin
                if TDBGrid(Components[I]).Columns[J].FieldName = 'SQL' then
	                TDBGrid(Components[I]).Columns[J].ButtonStyle := cbsEllipsis
                else if TDBGrid(Components[I]).Columns[J].FieldName = 'ERRO' then
                	TDBGrid(Components[I]).Columns[J].ButtonStyle := cbsEllipsis;
              end;
              Break;
          end;
    end;
  except on e: exception do
    begin
       Application.MessageBox(PChar(vNomeSchema + ' Erro ao atualizar: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
       vDadosIni.registraErro(vNomeSchema + ' Erro ao atualizar: ' + e.Message);
       exit;
    end;
  end;
end;

procedure TfrmCadConfigWS.BitBtn10Click(Sender: TObject);
begin
 	Screen.Cursor := crHourGlass;
  try
    BitBtn10.Enabled := false;
    try
      BitBtn9.Enabled := false;
      BitBtn10.Enabled := false;
      BitBtn12.Enabled := false;
      SpeedButton13.Enabled := false;
      btSelectAllTab.Enabled := false;
      vDadosIni.abreStatusProcessamento('', 'Aguarde...');
      vConfigWS.vEmpresa.vTabelas.Cancel;
      if vConfigWS.vEmpresa.vTabelas.transacao.InTransaction then
	      vConfigWS.vEmpresa.vTabelas.RollBackTransacao;
      vConfigWS.vEmpresa.vTabelas.dataSet.DisableControls;
      vConfigWS.vEmpresa.vTabelas.abreTabelas(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger,
        vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger,
        vConfigWS.dataSet.FieldByName('SCHEMA_REPLICACAO').AsString);
    finally
      vDadosIni.fechaStatusProcessamento;
      BitBtn9.Enabled := True;
      BitBtn10.Enabled := True;
      BitBtn12.Enabled := True;
      SpeedButton13.Enabled := True;
      btSelectAllTab.Enabled := True;
      vConfigWS.vEmpresa.vTabelas.dataSet.EnableConstraints;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn119Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    vConfigWS.atualizarTabela('S');
    TForm(pnTabelasNaoReplicadas.Parent).ModalResult := IDCANCEL;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn11Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    TForm(pnTabela.Parent).ModalResult := IDCANCEL;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn12Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    TForm(pnListaTabelas.Parent).ModalResult := IDCANCEL;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn13Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    TForm(pnReplicacoes.Parent).ModalResult := IDCANCEL;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn14Click(Sender: TObject);
var
 vRecNo: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CWS030', 'SALVAR', '', 'WSR_CAMPOS', '', vConfigWS.buscas, true) then
      Exit;
    vRecNo := vConfigWS.vEmpresa.vTabelas.vCampos.dataSet.RecNo;
    BitBtn67.Enabled := False;
    BitBtn77.Enabled := False;
    btSelectAllCampos.Enabled := False;
    btUnSelectAllCampos.Enabled := False;
    BitBtn14.Enabled := False;
    BitBtn11.Enabled := False;
    vDadosIni.abreStatusProcessamento('', 'Aguarde...');
    if not vConfigWS.vEmpresa.vTabelas.vCampos.atualizarCampos(vConfigWS.vEmpresa.dataSet,
      vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger,
      vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('NOME_TAB').AsString) then
      exit;
    if trim(vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('NOME_TAB').AsString) <> '' then
      vConfigWS.vEmpresa.vTabelas.vCampos.abreCampos(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger,
      vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger,
      vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('NOME_TAB').AsString);
    TForm(pnTabela.Parent).ModalResult := IDOK;  
  finally
      vConfigWS.vEmpresa.vTabelas.vCampos.dataSet.RecNo := vRecNo;
      vDadosIni.fechaStatusProcessamento;
      BitBtn67.Enabled := True;
      BitBtn77.Enabled := True;
      btSelectAllCampos.Enabled := True;
      btUnSelectAllCampos.Enabled := True;
      BitBtn14.Enabled := True;
      BitBtn15.Enabled := false;
      BitBtn11.Enabled := True;
      Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn15Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
//    vConfigWS.vEmpresa.vTabelas.vCampos.Cancel;
    if trim(vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('NOME_TAB').AsString) <> '' then
    begin
      try
        BitBtn67.Enabled := false;
        BitBtn77.Enabled := false;
        btSelectAllCampos.Enabled := false;
        btUnSelectAllCampos.Enabled := false;
        BitBtn14.Enabled := false;
        BitBtn11.Enabled := false;
        vDadosIni.abreStatusProcessamento('', 'Aguarde...');
        vConfigWS.vEmpresa.vTabelas.vCampos.dataSet.DisableControls;
        vConfigWS.vEmpresa.vTabelas.vCampos.abreCampos(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger,
        vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger,
        vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('NOME_TAB').AsString);
      finally
        BitBtn67.Enabled := True;
        BitBtn77.Enabled := True;
        btSelectAllCampos.Enabled := True;
        btUnSelectAllCampos.Enabled := True;
        BitBtn14.Enabled := True;
        BitBtn15.Enabled := false;
        BitBtn11.Enabled := True;
        vDadosIni.fechaStatusProcessamento;
        vConfigWS.vEmpresa.vTabelas.vCampos.dataSet.EnableConstraints;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn16Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CWS011', 'INCLUIR', '', 'WSR_TABELAS', '', vConfigWS.buscas, true) then
      Exit;

    if not vTabelasBD.incluirTabela(ComboBox4.Text) then
    begin
	    setFocusCampoErro(vTabelasBD.vNomeCampoErro, vTabelasBD.vMensagemErro);
       Exit;
    end;
    if (Self.Enabled) and (Self.Visible) and (ComboBox4.CanFocus) then
      ComboBox4.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira - [CWS007]';
  if not vDadosIni.PesqPros('CWS006', 'CONSULTA', '', 'WSR_SCHEMAS', '', vConfigWS.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not vConfigWS.ConsultaCampos('WSR_SCHEMAS', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
          combobox1.setfocus;
  end
  else if not vConfigWS.ConsultaCampos('WSR_SCHEMAS', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  SpeedButton6.Visible := true;
  SpeedButton8.Visible := true;
  SpeedButton7.Visible := true;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadConfigWS.BitBtn20Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    vConfigWS.atualizarTabela('S');
    TForm(pnCadastrosBasicos.Parent).ModalResult := IDCANCEL;
  finally
      Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn21Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CWS018', 'REMOVER', '', 'WSR_DEPENDENCIAS', '', vConfigWS.buscas, true) then
      Exit;

    if not vDependenciaWs.excluirTabela then
     exit;

    if (Self.Enabled) and (Self.Visible) and (DBGrid7.CanFocus) then
     DBGrid7.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn22Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CWS017', 'INCLUIR', '', 'WSR_DEPENDENCIAS', '', vConfigWS.buscas, true) then
      Exit;

    if not vDependenciaWs.incluirTabela(ComboBox8.Text, ComboBox11.Text, ComboBox9.Text, ComboBox12.Text, ComboBox10.Text, ComboBox13.Text) then
    begin
      setFocusCampoErro(vDependenciaWs.vNomeCampoErro, vDependenciaWs.vMensagemErro);
      Exit;
    end;
    if (Self.Enabled) and (Self.Visible) and (ComboBox8.CanFocus) then
      ComboBox8.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn23Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
   vConfigWS.atualizarTabela('S');
   TForm(pnDependencia.Parent).ModalResult := IDCANCEL;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn24Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    TForm(pnScript.Parent).ModalResult := IDCANCEL;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn25Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    TForm(pnScriptM.Parent).ModalResult := IDCANCEL;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn_F5_ScriptClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     vScript.abreScript;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn3Click(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
	try
    if not vConfigWS.Insert then
      Exit;

    inherited;
    gbEmpresas.Visible := false;
    DBComboBox8.Enabled := false;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;

    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      DBEdit4.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn4Click(Sender: TObject);
begin
  try
   Screen.Cursor := crHourGlass;
   if not vDadosIni.PesqPros('CWS005', 'SALVAR', '', 'WSR_SCHEMAS', '', vConfigWS.buscas, true) then
      Exit;

   if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
   	 BitBtn4.SetFocus;
   if not vConfigWS.post then
   begin
      PageControl3.ActivePage := TabSheet3;
      setFocusCampoErro(vConfigWS.vNomeCampoErro, vConfigWS.vMensagemErro);
   end
   else
   begin
      if vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger > 0 then
      begin
	      vConfigWS.vCodSchema := vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger;
        vConfigWS.colarConf('S', 'S', 'N');
        vConfigWS.CommitaTransacao;
      end
      else
      begin
         if vConfigWS.buscarSchemaVinculados(vConfigWS.buscasEmpV) then
         begin
            vConfigWS.vCodSchema := vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger;
            vConfigWS.buscasEmpV.First;
            while not vConfigWS.buscasEmpV.Eof do
            begin
                vConfigWS.abreConfigWs(vConfigWS.buscasEmpV.FieldByName('COD_SCHEMA').AsInteger);
				        vConfigWS.colarConf('S', 'S', 'N');

              vConfigWS.buscasEmpV.Next;
            end;
            if not vConfigWS.buscasEmpV.IsEmpty then
	            vConfigWS.CommitaTransacao;
            vConfigWS.montaSelect(vSql);
            vConfigWS._retornarIndice(vIndex);
            vConfigWS.dataSet.RecNo := vRecNo;  
         end;
      end;
      vConfigWS.atualizarTabela;
      vConfigWS.Refresh;

      if TelaCadastro = 1 then
      begin
        BitBtn6.Click;
        Exit;
      end;
      inherited;
   end;
  finally
    Screen.Cursor := crDefault;  
  end;
end;

procedure TfrmCadConfigWS.BitBtn5Click(Sender: TObject);
begin
  vConfigWS.Cancel;
  inherited;
end;


procedure TfrmCadConfigWS.BitBtn67Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if trim(DBComboBox2.Text) = '' then
    begin
      Application.MessageBox('Campo receber não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      	DBComboBox2.SetFocus;
      exit;
    end
    else if trim(DBComboBox3.Text) = '' then
    begin
      Application.MessageBox('Campo enviar não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
      	DBComboBox3.SetFocus;
      exit;
    end
    else if trim(DBComboBox4.Text) = '' then
    begin
      Application.MessageBox('Campo inserir não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox4.CanFocus) then
      	DBComboBox4.SetFocus;
      exit;
    end
    else if trim(DBComboBox5.Text) = '' then
    begin
      Application.MessageBox('Campo alterar não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox5.CanFocus) then
      	DBComboBox5.SetFocus;
      exit;
    end
    else if trim(DBComboBox6.Text) = '' then
    begin
      Application.MessageBox('Campo deletar não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox6.CanFocus) then
      	DBComboBox6.SetFocus;
      exit;
    end
    else if trim(DBComboBox7.Text) = '' then
    begin
      Application.MessageBox('Campo empresa física não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox7.CanFocus) then
      	DBComboBox7.SetFocus;
      exit;
    end;

  	vConfigWS.vEmpresa.vTabelas.dataSet.Post;
  finally
    atribuirValorCamposTabela;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn77Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
  	vConfigWS.vEmpresa.vTabelas.dataSet.Cancel;
    atribuirValorCamposTabela;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn7Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if not vDadosIni.PesqPros('CWS022', 'SALVAR', '', 'WSR_EMPRESAS', '', vConfigWS.buscas, true) then
      Exit;

    BitBtn8.Enabled := false;  
    vConfigWS.vEmpresa.atualizarEmpresa(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger);
    vConfigWS.vEmpresa.abreEmpresas(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn8Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    vConfigWS.vEmpresa.Cancel;
    BitBtn8.Enabled := false;
    vConfigWS.vEmpresa.abreEmpresas(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn99Click(Sender: TObject);
begin
	try
     Screen.Cursor := crHourGlass;
     vReplicacoes.abreReplicacoes;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn9Click(Sender: TObject);
var
 vRecNo: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CWS026', 'SALVAR', '', 'WSR_TABELAS', '', vConfigWS.buscas, true) then
      Exit;
    vRecNo := vConfigWS.vEmpresa.vTabelas.dataSet.RecNo;
    BitBtn9.Enabled := false;
    BitBtn12.Enabled := false;
    SpeedButton13.Enabled := false;
    btSelectAllTab.Enabled := false;
    vDadosIni.abreStatusProcessamento('', 'Aguarde...');
    vConfigWS.vEmpresa.vTabelas.atualizarTabelas(vConfigWS.vEmpresa.dataSet, vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger);
    if vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger > 0 then
      vConfigWS.vEmpresa.vTabelas.abreTabelas(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger,
      vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger,
      vConfigWS.dataSet.FieldByName('SCHEMA_REPLICACAO').AsString);
    TForm(pnListaTabelas.Parent).ModalResult := IDOK;  
  finally
    vConfigWS.vEmpresa.vTabelas.dataSet.RecNo := vRecNo;
    vDadosIni.fechaStatusProcessamento;
    BitBtn9.Enabled := True;
    BitBtn10.Enabled := False;
    BitBtn12.Enabled := True;
    SpeedButton13.Enabled := True;
    btSelectAllTab.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn17Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CWS012', 'REMOVER', '', 'WSR_TABELAS', '', vConfigWS.buscas, true) then
      Exit;

    if not vTabelasBD.excluirTabela then
     exit;

    if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
     DBGrid5.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn18Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CWS015', 'REMOVER', '', 'WSR_CADASTROSBASICOS', '', vConfigWS.buscas, true) then
      Exit;

    if not vCadastrosBasWs.excluirTabela then
     exit;

    if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
     DBGrid6.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.BitBtn19Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CWS014', 'INCLUIR', '', 'WSR_CADASTROSBASICOS', '', vConfigWS.buscas, true) then
      Exit;

    if not vCadastrosBasWs.incluirTabela(ComboBox5.Text, ComboBox6.Text, ComboBox7.Text) then
    begin
      setFocusCampoErro(vCadastrosBasWs.vNomeCampoErro, vCadastrosBasWs.vMensagemErro);
      Exit;
    end;
    if (Self.Enabled) and (Self.Visible) and (ComboBox5.CanFocus) then
      ComboBox5.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.botaoConsultar(Sender: TObject);
var
	I: Integer;
  vNomeSchema, vEndBanco, vSql: string;
begin
  try
    vNomeSchema := '';
    vEndBanco := '';
    vSql:= '';

    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('CWS039', 'CONSULTA', '', 'WSR_SCHEMAS', '', vSchemaScript.buscas, true) then
    	Exit;

    vDadosIni.abreStatusProcessamento('', 'Consultando');
    salvarDados;
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TTabSheet) then
      begin
      	if (PageControl2.ActivePage = TTabSheet(Components[I])) then
					vNomeSchema := StringReplace(TTabSheet(Components[I]).Name, 'Tabsheet', '', []);
      end
      else if (Components[I] is TMemo) then
      begin
        if (TMemo(Components[I]).Name = 'MemoEndBanco' + vNomeSchema) then
        begin
        	vEndBanco := TMemo(Components[I]).Text;
          if trim(vEndBanco) = '' then
          begin
            Application.MessageBox('Endereço do banco não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (TMemo(Components[I]).CanFocus) then
              TMemo(Components[I]).SetFocus;
            exit;
          end;
        end
        else if (TMemo(Components[I]).Name = 'Memo' + vNomeSchema) then
        begin
        	vSql := TMemo(Components[I]).Text;
          if trim(vSql) = '' then
          begin
            Application.MessageBox('Consulta não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (TMemo(Components[I]).CanFocus) then
              TMemo(Components[I]).SetFocus;
            exit;
          end;
        end;
      end;
    end;

    for I := 0 to ComponentCount - 1 do
    begin
	    if (Components[I] is TIBDatabase) then
      	if (TIBDatabase(Components[I]).Name = 'ibDatabase' + vNomeSchema) then
        begin
            if ((TIBDatabase(Components[I]).DatabaseName <> vEndBanco)
            	or (not TIBDatabase(Components[I]).Connected)) then
            begin
             	TIBDatabase(Components[I]).ForceClose;
              TIBDatabase(Components[I]).Connected := false;
              TIBDatabase(Components[I]).DatabaseName := vEndBanco;
              try
                TIBDatabase(Components[I]).Connected := true;
              except on e: exception do
                begin
                   vDadosIni.GravaAuditoria('CWS039', 'CONSULTA', 'FALHA - ' + vSql, 'WSR_SCHEMAS', '', vSchemaScript.buscas);
                   Application.MessageBox(PChar(vNomeSchema + ' Erro ao conectar no banco: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
                   vDadosIni.registraErro(vNomeSchema + ' Erro ao conectar no banco: ' + e.Message);
                   exit;
                end;
              end;
            end;
          break;
        end;
    end;

    for I := 0 to ComponentCount - 1 do
    begin
	    if (Components[I] is TIBTransaction) then
      	if (TIBTransaction(Components[I]).Name = 'ibTransaction' + vNomeSchema) then
        begin
        	try
        		TIBTransaction(Components[I]).Active := true;
          	break;
          except on e: exception do
            begin
               vDadosIni.GravaAuditoria('CWS039', 'CONSULTA', 'FALHA - ' + vSql, 'WSR_SCHEMAS', '', vSchemaScript.buscas);
               salvarDadosScript('FALHA', e.Message);
               Application.MessageBox(PChar(vNomeSchema + ' SYSDBA -  Erro ao ativar transaction: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
               vDadosIni.registraErro(vNomeSchema + ' SYSDBA - Erro ao ativar transaction: ' + e.Message);
               exit;
            end;
          end;
          Break;
        end;
    end;


    for I := 0 to ComponentCount - 1 do
    begin
	    if (Components[I] is TIBQuery) then
      	if (TIBQuery(Components[I]).Name = 'ibQuery' + vNomeSchema) then
        begin
          TIBQuery(Components[I]).Close;
        	TIBQuery(Components[I]).SQL.Text := vSql;
          try
            TIBQuery(Components[I]).Open;
            TIBQuery(Components[I]).FetchAll;
          except on e: exception do
            begin
               vDadosIni.GravaAuditoria('CWS039', 'CONSULTA', 'FALHA - ' + vSql, 'WSR_SCHEMAS', '', vSchemaScript.buscas);
               Application.MessageBox(PChar(vNomeSchema + ' Erro ao executar consulta: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
               vDadosIni.registraErro(vNomeSchema + ' Erro ao excutar consulta: ' + e.Message);
               exit;
            end;
          end;
          Break;
        end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.botaoExecutar(Sender: TObject);
  var
	I: Integer;
  vNomeSchema, vEndBanco, vScript, vUser, vExecutar: string;
begin
	try
    vNomeSchema := '';
    vEndBanco := '';
    vScript := '';
    vUser := '';
    vExecutar := '';

	  Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('CWS040', 'EXECUTAR', '', 'WSR_SCHEMAS', '', vSchemaScript.buscas, true) then
    	Exit;
      
    vDadosIni.abreStatusProcessamento('', 'Executando');
    salvarDados;
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TTabSheet) then
      begin
      	if (PageControl2.ActivePage = TTabSheet(Components[I])) then
					vNomeSchema := StringReplace(TTabSheet(Components[I]).Name, 'Tabsheet', '', []);
      end
      else if (Components[I] is TComboBox) then
      begin
				if (TComboBox(Components[I]).Name = 'ComboxUser' + vNomeSchema) then
        begin
          vUser := TComboBox(Components[I]).Text;
          if trim(vUser) = '' then
          begin
            Application.MessageBox('Usuário do banco não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (TComboBox(Components[I]).CanFocus) then
              TComboBox(Components[I]).SetFocus;
            exit;
          end;
        end;
              
      end
      else if (Components[I] is TMemo) then
      begin
        if (TMemo(Components[I]).Name = 'MemoEndBanco' + vNomeSchema) then
        begin
        	vEndBanco := TMemo(Components[I]).Text;
          if trim(vEndBanco) = '' then
          begin
            Application.MessageBox('Endereço do banco não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (TMemo(Components[I]).CanFocus) then
              TMemo(Components[I]).SetFocus;
            exit;
          end;
        end
        else if (TMemo(Components[I]).Name = 'MemoScript' + vNomeSchema) then
        begin
        	vScript := TMemo(Components[I]).Text;
          if trim(vScript) = '' then
          begin
            Application.MessageBox('Script não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (TMemo(Components[I]).CanFocus) then
              TMemo(Components[I]).SetFocus;
            exit;
          end;
        end
      end
      else if (Components[I] is TRadioGroup) then
      begin
      	if (TRadioGroup(Components[I]).Name = 'radioGroup' + vNomeSchema) then
        begin
          if (TRadioGroup(Components[I]).ItemIndex = 0) then
            vExecutar := 'Sistema'
          else
            vExecutar := 'Servico';
        end;
      end
    end;
    salvarDadosScript('', '');
    if (vExecutar = 'Sistema') then
    begin
      for I := 0 to ComponentCount - 1 do
      begin
        if (Components[I] is TIBDatabase) then
        begin
          if (trim(vUser) = 'SYSDBA') and (TIBDatabase(Components[I]).Name = 'ibDatabaseSydba' + vNomeSchema) then
          begin
              if ((TIBDatabase(Components[I]).DatabaseName <> vEndBanco)
                or (not TIBDatabase(Components[I]).Connected)) then
              begin
                TIBDatabase(Components[I]).ForceClose;
                TIBDatabase(Components[I]).Connected := false;
                TIBDatabase(Components[I]).DatabaseName := vEndBanco;
                try
                  TIBDatabase(Components[I]).Connected := true;
                except on e: exception do
                  begin
                     vDadosIni.GravaAuditoria('CWS040', 'EXECUTAR', 'FALHA - ' + vScript, 'WSR_SCHEMAS', IntToStr(vSchemaScript.vCodScript), vSchemaScript.buscas);
                  	 salvarDadosScript('FALHA', e.Message);
                     Application.MessageBox(PChar(vNomeSchema + ' SYSDBA - Erro ao conectar no banco: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
                     vDadosIni.registraErro(vNomeSchema + ' SYSDBA - Erro ao conectar no banco: ' + e.Message);
                     exit;
                  end;
                end;
              end;
              break;
          end
          else if (trim(vUser) = 'REPL') and (TIBDatabase(Components[I]).Name = 'ibDatabaseRepl' + vNomeSchema) then
          begin
            if ((TIBDatabase(Components[I]).DatabaseName <> vEndBanco)
                or (not TIBDatabase(Components[I]).Connected)) then
              begin
                TIBDatabase(Components[I]).ForceClose;
                TIBDatabase(Components[I]).Connected := false;
                TIBDatabase(Components[I]).DatabaseName := vEndBanco;
                try
                  TIBDatabase(Components[I]).Connected := true;
                except on e: exception do
                  begin
                     vDadosIni.GravaAuditoria('CWS040', 'EXECUTAR', 'FALHA - ' + vScript, 'WSR_SCHEMAS', IntToStr(vSchemaScript.vCodScript), vSchemaScript.buscas);
                     salvarDadosScript('FALHA', e.Message);
                     Application.MessageBox(PChar(vNomeSchema + ' REPL -  Erro ao conectar no banco: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
                     vDadosIni.registraErro(vNomeSchema + ' REPL - Erro ao conectar no banco: ' + e.Message);
                     exit;
                  end;
                end;
              end;
              break;
          end;
        end;
      end;

      for I := 0 to ComponentCount - 1 do
      begin
        if (Components[I] is TIBTransaction) then
        begin
          if (trim(vUser) = 'SYSDBA') and (TIBTransaction(Components[I]).Name = 'ibTransactionSysdba' + vNomeSchema) then
          begin
            try
            	TIBTransaction(Components[I]).Active := true;
	            break;
            except on e: exception do
              begin
              	 vDadosIni.GravaAuditoria('CWS040', 'EXECUTAR', 'FALHA - ' + vScript, 'WSR_SCHEMAS', IntToStr(vSchemaScript.vCodScript), vSchemaScript.buscas);
                 salvarDadosScript('FALHA', e.Message);
                 Application.MessageBox(PChar(vNomeSchema + ' SYSDBA -  Erro ao ativar transaction: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
                 vDadosIni.registraErro(vNomeSchema + ' SYSDBA - Erro ao ativar transaction: ' + e.Message);
                 exit;
              end;
            end;
          end
          else if (trim(vUser) = 'REPL') and (TIBTransaction(Components[I]).Name = 'ibTransactionRepl' + vNomeSchema) then
          begin
          	try
            	TIBTransaction(Components[I]).Active := true;
            	break;
            except on e: exception do
              begin
                 vDadosIni.GravaAuditoria('CWS040', 'EXECUTAR', 'FALHA - ' + vScript, 'WSR_SCHEMAS', IntToStr(vSchemaScript.vCodScript), vSchemaScript.buscas);
                 salvarDadosScript('FALHA', e.Message);
                 Application.MessageBox(PChar(vNomeSchema + ' REPL -  Erro ao ativar transaction: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
                 vDadosIni.registraErro(vNomeSchema + ' REPL - Erro ao ativar transaction: ' + e.Message);
                 exit;
              end;
            end;
          end;
        end;
      end;


      for I := 0 to ComponentCount - 1 do
      begin
        if (Components[I] is TIBQuery) then
        begin
          if (trim(vUser) = 'SYSDBA') and (TIBQuery(Components[I]).Name = 'ibQuerySysDba' + vNomeSchema) then
          begin
            TIBQuery(Components[I]).Close;
            TIBQuery(Components[I]).SQL.Text := vScript;
            try
              TIBQuery(Components[I]).ExecSQL;
              TIBQuery(Components[I]).Transaction.Commit;
              salvarDadosScript('CONCLUIDO', '');
            except on e: exception do
              begin
              	 vDadosIni.GravaAuditoria('CWS040', 'EXECUTAR', 'FALHA - ' + vScript, 'WSR_SCHEMAS', IntToStr(vSchemaScript.vCodScript), vSchemaScript.buscas);
              	 salvarDadosScript('FALHA', e.Message);
                 Application.MessageBox(PChar(vNomeSchema + ' SYSDBA - Erro ao executar comando: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
                 vDadosIni.registraErro(vNomeSchema + ' SYSDBA - Erro ao excutar comando: ' + e.Message);
                 exit;
              end;
            end;
            break;
          end
          else if (trim(vUser) = 'REPL') and (TIBQuery(Components[I]).Name = 'ibQueryRepl' + vNomeSchema) then
          begin
            TIBQuery(Components[I]).Close;
            TIBQuery(Components[I]).SQL.Text := vScript;
            try
              TIBQuery(Components[I]).ExecSQL;
              TIBQuery(Components[I]).Transaction.Commit;
              salvarDadosScript('CONCLUIDO', '');
            except on e: exception do
              begin
                 vDadosIni.GravaAuditoria('CWS040', 'EXECUTAR', 'FALHA - ' + vScript, 'WSR_SCHEMAS', IntToStr(vSchemaScript.vCodScript), vSchemaScript.buscas);
                 salvarDadosScript('FALHA', e.Message);
                 Application.MessageBox(PChar(vNomeSchema + ' REPL - Erro ao executar comando: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
                 vDadosIni.registraErro(vNomeSchema + ' REPL - Erro ao excutar comando: ' + e.Message);
                 exit;
              end;
            end;
            break;
          end;
        end;
      end;
    end;

  finally
    atualizarDados;
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.btSelectAllCamposClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    BitBtn15.Enabled := true;
    vConfigWS.vEmpresa.vTabelas.vCampos._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.btSelectAllTabClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vConfigWS.vEmpresa.vTabelas._marcaDesmarcaLinha;
    BitBtn10.Enabled := true;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.btSelectUnSelectAllCamposClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    BitBtn15.Enabled := true;
    vConfigWS.vEmpresa.vTabelas.vCampos._marcaDesmarcaLinha;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.btUnSelectAllCamposClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    BitBtn15.Enabled := true;
    vConfigWS.vEmpresa.vTabelas.vCampos._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.ckEmpresasTabClick(Sender: TObject);
begin
  inherited;
  ckEmpresasCampos.Checked := ckEmpresasTab.Checked;
end;

procedure TfrmCadConfigWS.ClonarSchema1Click(Sender: TObject);
var
	vOK: boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    vOK := true;

    if  (vConfigWS.dataSet.IsEmpty) then
  	vOK := false;

    if not vOK then
      if  (vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger = 0) then
        vOK := false;

    if not vOK then
    begin
      Application.MessageBox('Favor selecionar um schema para clonar os dados.', 'Atenção', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      colarConf.Enabled := false;
      exit;
    end;

    vConfigWS.vCodSchema := vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger;
	  vConfigWS.vCodEmpresa := vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger;

    if Application.MessageBox(PChar('Deseja clonar dados de um schema existente?'),
      'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON2) <> mrYES then
      exit;

    if not vDadosIni.PesqPros('CWS027', 'CLONAR', '', 'WSR_SCHEMAS', '', vConfigWS.buscas, true) then
      Exit;  

    if not vConfigWS.clonarSchema then
    	exit;

    if vConfigWS.abreConfigWs(vConfigWS.vCodSchema) then
    	SpeedButton1Click(Sender);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.colarConfClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if Application.MessageBox(PChar('Deseja colar dados de uma empresa existente?'),
       'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON2) <> mrYES then
       exit;

    if not vDadosIni.PesqPros('CWS019', 'COLAR', '', 'WSR_SCHEMAS', '', vConfigWS.buscas, true) then
      Exit;

    if not vConfigWS.colarConf then
      exit;

    vConfigWS.vEmpresa.abreEmpresas(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger);
    Application.MessageBox('Copia realizada com sucesso!', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
  finally
    colarConf.Enabled := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.ColarSchema1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if Application.MessageBox(PChar('Deseja colar dados de um schema existente?'),
       'Confirmação', MB_YESNO + MB_ICONQUESTION +  MB_DEFBUTTON2) <> mrYES then
       exit;

    if not vDadosIni.PesqPros('CWS023', 'COLAR', '', 'WSR_SCHEMAS', '', vConfigWS.buscas, true) then
      Exit;

    if not vConfigWS.colarConf('S') then
      exit;
    Application.MessageBox('Copia realizada com sucesso!', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);  
  finally
    ColarSchema1.Enabled := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.ComboBox11Exit(Sender: TObject);
begin
  inherited;
  ComboBox12.Clear;
  ComboBox13.Clear;
  if (trim(ComboBox11.Text) <> '') then
  begin
    vCadastrosBasWs.abreCamposBD(ComboBox11.Text, ComboBox12);
    vCadastrosBasWs.abreCamposBD(ComboBox11.Text, ComboBox13);
  end;
end;

procedure TfrmCadConfigWS.ComboBox5Exit(Sender: TObject);
begin
  inherited;
  ComboBox6.Clear;
  ComboBox7.Clear;
  if (trim(ComboBox5.Text) <> '') then
  begin
    vCadastrosBasWs.abreCamposBD(ComboBox5.Text, ComboBox6);
    vCadastrosBasWs.abreCamposBD(ComboBox5.Text, ComboBox7);
  end;
end;

procedure TfrmCadConfigWS.ComboBox8Exit(Sender: TObject);
begin
  inherited;
  ComboBox9.Clear;
  ComboBox10.Clear;
  if (trim(ComboBox8.Text) <> '') then
  begin
    vCadastrosBasWs.abreCamposBD(ComboBox8.Text, ComboBox9);
    vCadastrosBasWs.abreCamposBD(ComboBox8.Text, ComboBox10);
  end;
end;

procedure TfrmCadConfigWS.DBComboBox1Exit(Sender: TObject);
begin
  if (vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
    vConfigWS.vEmpresa.vTabelas.abreTabelas(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger,
  	vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger,
    vConfigWS.dataSet.FieldByName('SCHEMA_REPLICACAO').AsString);
end;

procedure TfrmCadConfigWS.DBComboBox8Exit(Sender: TObject);
begin
  if (vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
    vConfigWS.vEmpresa.vTabelas.abreTabelas(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger,
  	vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger,
    vConfigWS.dataSet.FieldByName('SCHEMA_REPLICACAO').AsString);
end;

procedure TfrmCadConfigWS.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadConfigWS.DBGrid2DblClick(Sender: TObject);
begin
  if not vConfigWS.vEmpresa.dataSet.IsEmpty then
  begin
     if vConfigWS.vEmpresa.dataSet.FieldByName('SEL').AsString <> 'S' then
     begin
      Application.MessageBox(PChar('Favor adicionar a empresa antes de visualizar as tabelas'), PChar('Atenção'), MB_ICONERROR + MB_OK);
      exit;
     end
     else if vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger > 0 then
     begin
       Application.MessageBox(PChar('Não é possível visualizar tabelas, favor visualizar as informações no schema definido como base!'),
          'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        exit;
     end;
     BitBtn10.Enabled := false;
     vConfigWS.vEmpresa.vTabelas._abreFormListaTabela(vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger,
     vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger,
     vConfigWS.dataSet.FieldByName('SCHEMA_REPLICACAO').AsString);
  end;
end;

procedure TfrmCadConfigWS.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
  begin
     if (vConfigWS.vEmpresa.dataSet.FieldByName('SEL').AsString = 'S') then
     begin
      	TDBGrid(sender).canvas.brush.color := Panel11.Color;
	      TDBGrid(sender).canvas.Font.color := clWindowText;
     end
     else
     begin
       TDBGrid(sender).canvas.brush.color := clWindow;
       TDBGrid(sender).canvas.Font.color := clWindowText;
     end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TfrmCadConfigWS.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    marcarDesmarcaEmpresa;
end;

procedure TfrmCadConfigWS.DBGrid2TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmCadConfigWS.DBGrid3CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	marcarDesmarcaTabela;
end;

procedure TfrmCadConfigWS.DBGrid3DblClick(Sender: TObject);
begin
  if not vConfigWS.vEmpresa.vTabelas.dataSet.IsEmpty then
  begin
    if vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('SEL').AsString <> 'S' then
    begin
      Application.MessageBox(PChar('Favor adicionar a tabela antes de visualizar os campos'), PChar('Atenção'), MB_ICONERROR + MB_OK);
      exit;
    end
    else if vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('RESTRICAO').AsString <> 'S' then
    begin
      BitBtn15.Enabled := false;
      vConfigWS.vEmpresa.vTabelas._abreFormTabela;
    end;
  end;
end;

procedure TfrmCadConfigWS.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (trim(vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('NOME_TAB').AsString) <> '') then
  begin
    if (vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('RESTRICAO').AsString = 'S') then
    begin
      TDBGrid(sender).canvas.brush.color := Panel17.Color;
	    TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else if ((trim(Edit3.Text) <> '') and (gdSelected in State)) then
    begin
      TDBGrid(sender).canvas.brush.color := clBtnText;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else if (vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('SEL').AsString = 'S') then
    begin
      TDBGrid(sender).canvas.brush.color := Panel5.Color;
	    TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;

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

procedure TfrmCadConfigWS.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if not vConfigWS.vEmpresa.vTabelas.dataSet.IsEmpty then
    begin
      if vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('SEL').AsString <> 'S' then
      begin
        Application.MessageBox(PChar('Favor adicionar a tabela antes de visualizar os campos'), PChar('Atenção'), MB_ICONERROR + MB_OK);
        exit;
      end
      else if vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('RESTRICAO').AsString <> 'S' then
      begin
        vConfigWS.vEmpresa.vTabelas._abreFormTabela;
        BitBtn15.Enabled := false;
      end;
    end;
  end
  else if Key = VK_SPACE then
    marcarDesmarcaTabela;
end;

procedure TfrmCadConfigWS.DBGrid3TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid3, Column);
  if ((trim(vConfigWS.vEmpresa.vTabelas.IndexFieldNames) = '') and (trim(Column.FieldName) = 'SEL')) then
	  vConfigWS.vEmpresa.vTabelas.IndexFieldNames := Column.DisplayName;
end;

procedure TfrmCadConfigWS.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (vConfigWS.vEmpresa.vTabelas.vCampos.dataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
  begin
    if ((trim(Edit1.Text) <> '') and (gdSelected in State)) then
    begin
      TDBGrid(sender).canvas.brush.color := clBtnText;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else if (vConfigWS.vEmpresa.vTabelas.vCampos.dataSet.FieldByName('SEL').AsString = 'S') then
    begin
    	TDBGrid(sender).canvas.brush.color := Panel8.Color;
	    TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TfrmCadConfigWS.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
  	marcarDesmarcaCampos;
end;

procedure TfrmCadConfigWS.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
  if ((trim(vConfigWS.vEmpresa.vTabelas.vCampos.IndexFieldNames) = '') and (trim(Column.FieldName) = 'SEL')) then
	  vConfigWS.vEmpresa.vTabelas.vCampos.IndexFieldNames := Column.DisplayName;
end;

procedure TfrmCadConfigWS.DBGrid5TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid5, Column);
end;

procedure TfrmCadConfigWS.DBGrid6TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid6, Column);
end;

procedure TfrmCadConfigWS.DBGrid7TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid7, Column);
end;

procedure TfrmCadConfigWS.DBGrid8DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TDBGrid(sender).DataSource.DataSet.FieldByName('SINC').AsString = 'N') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := Panel27.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS').AsString) = 'FALHA') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := Panel20.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS').AsString) = 'CONCLUIDO') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := Panel24.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := Panel19.Color;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadConfigWS.DBGrid8TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid8, Column);
end;

procedure TfrmCadConfigWS.DBGrid9DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS').AsString) = 'FALHA') then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
         TDBGrid(sender).canvas.brush.color := clRed;
         TDBGrid(sender).canvas.Font.color := clWhite;
       end;
    end
    else if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS').AsString) = 'PENDENTE') then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
         TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
         TDBGrid(sender).canvas.Font.color := clWhite;
       end;
    end;

    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadConfigWS.onDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
    if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS').AsString) = 'FALHA') then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
         TDBGrid(sender).canvas.brush.color := TColor($00A4A4FF);
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end;
    end
    else if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS').AsString) = 'PENDENTE') then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
         TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end;
    end;

    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadConfigWS.onDBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
	I: Integer;
  vNomeSchema: string;
begin
	try
  	vNomeSchema := '';
  	Screen.Cursor := crHourGlass;
    if (Key = VK_RETURN) then
    begin
      for I := 0 to ComponentCount - 1 do
      begin
        if (Components[I] is TTabSheet) then
        begin
          if (PageControl2.ActivePage = TTabSheet(Components[I])) then
            vNomeSchema := StringReplace(TTabSheet(Components[I]).Name, 'Tabsheet', '', []);
        end
        else if (Components[I] is TDBGrid) then
        begin
          if (TDBGrid(Components[I]).Name = 'DBGridScript' + vNomeSchema) then
          begin
            if TDBGrid(Components[I]).DataSource.DataSet.IsEmpty then
              exit;

            vSchemaScript._abreFormScripts(vNomeSchema,
              TDBGrid(Components[I]).DataSource.DataSet.FieldByName('USER_BANCO').AsString,
              TDBGrid(Components[I]).DataSource.DataSet.FieldByName('SQL').AsString,
              TDBGrid(Components[I]).DataSource.DataSet.FieldByName('ERRO').AsString);
            Break;
          end;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.onDblClick(Sender: TObject);
var
	vNomeSchema: string;
  I: Integer;
begin
  try
  	vNomeSchema := '';
  	Screen.Cursor := crHourGlass;
    for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TTabSheet) then
      begin
      	if (PageControl2.ActivePage = TTabSheet(Components[I])) then
					vNomeSchema := StringReplace(TTabSheet(Components[I]).Name, 'Tabsheet', '', []);
      end
      else if (Components[I] is TDBGrid) then
      begin
        if (TDBGrid(Components[I]).Name = 'DBGridScript' + vNomeSchema) then
        begin
        	if TDBGrid(Components[I]).DataSource.DataSet.IsEmpty then
            exit;

          vSchemaScript._abreFormScripts(vNomeSchema,
            TDBGrid(Components[I]).DataSource.DataSet.FieldByName('USER_BANCO').AsString,
            TDBGrid(Components[I]).DataSource.DataSet.FieldByName('SQL').AsString,
            TDBGrid(Components[I]).DataSource.DataSet.FieldByName('ERRO').AsString);
          Break;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.Demarcacomoconcludo1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if not vReplicacoes._demarcarReplicacao then
    	exit;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.Edit1Change(Sender: TObject);
begin
  if (trim(Edit1.Text) <> '') then
  begin
    vConfigWS.vEmpresa.vTabelas.vCampos.IndexFieldNames := 'CAMPO';
    vConfigWS.vEmpresa.vTabelas.vCampos.FindNearest([Edit1.Text]);
  end
  else
  begin
    begin
      vConfigWS.vEmpresa.vTabelas.vCampos.IndexFieldNames := 'CAMPO';
      vConfigWS.vEmpresa.vTabelas.vCampos.FindNearest(['A']);
    end;
  end;
end;

procedure TfrmCadConfigWS.Edit3Change(Sender: TObject);
begin
  if (trim(Edit3.Text) <> '') then
  begin
    vConfigWS.vEmpresa.vTabelas.IndexFieldNames := 'NOME_TAB';
    vConfigWS.vEmpresa.vTabelas.FindNearest([Edit3.Text]);
  end
  else
  begin
    begin
      vConfigWS.vEmpresa.vTabelas.IndexFieldNames := 'NOME_TAB';
      vConfigWS.vEmpresa.vTabelas.FindNearest(['A']);
    end;
  end;
end;

procedure TfrmCadConfigWS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 	vConfigWS.Free;
  vConfigWS := nil;

  vTabelasBD.Free;
  vTabelasBD := nil;

  vCadastrosBasWs.Free;
  vCadastrosBasWs := nil;

  vDependenciaWs.Free;
  vDependenciaWs := nil;

  vReplicacoes.Free;
  vReplicacoes := nil;

  vScript.Free;
  vScript := nil;

  vSchemaScript.Free;
  vSchemaScript := nil;

  Action := caFree;
  frmCadConfigWS := nil;
end;

procedure TfrmCadConfigWS.FormCreate(Sender: TObject);
begin
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  vConfigWS := TConfigWS.create;
  vTabelasBD := TTabelasBD.create;
  vCadastrosBasWs := TCadastrosBasWs.create;
  vDependenciaWs := TDependenciaWs.create;
  vReplicacoes := TReplicacoesWS.create;
  vScript := TScriptWS.create;
  vSchemaScript := TSchemasScript.create;

  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet7.TabVisible := false;
  TabSheet9.TabVisible := false;
  TabSheet12.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadConfigWS.FormKeyDown(Sender: TObject; var Key: Word;
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
    if PageControl1.ActivePage = TabSheet1 then
    begin
      if (vConfigWS.dataSet.State in [dsEdit, dsInsert]) then
      begin
        ActiveControl := BitBtn5;
        BitBtn5Click(Sender);
      end;
    end
    else if PageControl1.ActivePage = TabSheet7 then
    begin
      try
        Screen.Cursor := crHourGlass;
        salvarDados;
      finally
        vSchemaScript.CommitaTransacao;
        Screen.Cursor := crDefault;
        frmCadConfigWS.Caption := 'Configurar wsReplicação';
        PageControl1.ActivePage := TabSheet2;
        TabSheet2.Show;
      end;
    end;
  end;
end;

procedure TfrmCadConfigWS.FormShow(Sender: TObject);
begin
  vComponentesCriados := false;
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dswsSchema;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    CheckBox1.Visible := False;
    CheckBox3.Visible := False;
  end;

  ColarSchema1.Enabled := false;

   if vConfigWS.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "CWS020" ADICIONAR EMPRESA AO SCHEMA DE REPLICACAO' +#13+
    'Processo "CWS021" REMOVER EMPRESA DO SCHEMA DE REPLICACAO' + #13 +
    'Processo "CWS024" ADICIONAR TABELA AO SCHEMA DE REPLICACAO' + #13 +
    'Processo "CWS025" REMOVER TABELA DO SCHEMA DE REPLICACAO' + #13 +
    'Processo "CWS028" ADICIONAR CAMPO AO SCHEMA DE REPLICACAO' + #13 +
    'Processo "CWS029" REMOVER CAMPO DO SCHEMA DE REPLICACAO';
end;

procedure TfrmCadConfigWS.KeyDownCadastros(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  	BitBtn20Click(Sender);
end;

procedure TfrmCadConfigWS.KeyDownCampos(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
  	marcarDesmarcaCampos
  else if Key = VK_ESCAPE then
  	BitBtn11Click(Sender);
end;

procedure TfrmCadConfigWS.KeyDownDependencia(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  	BitBtn23Click(Sender);
end;

procedure TfrmCadConfigWS.KeyDownNaoReplicar(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  	BitBtn119Click(Sender);
end;

procedure TfrmCadConfigWS.KeyDownReplicacao(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  	BitBtn13Click(Sender)
  else if Key = VK_F5 then
	  BitBtn99Click(Sender);
end;

procedure TfrmCadConfigWS.KeyDownScript(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  	BitBtn25Click(Sender);
end;

procedure TfrmCadConfigWS.KeyDownTabela(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
  	marcarDesmarcaTabela
  else if Key = VK_ESCAPE then
  	BitBtn12Click(Sender);
end;

procedure TfrmCadConfigWS.Marcarcomoconcludo1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if not vReplicacoes._concluirReplicacao then
    	exit;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.marcarDesmarcaCampos;
begin
 if not vConfigWS.vEmpresa.vTabelas.vCampos.dataSet.IsEmpty then
  begin
    vConfigWS.vEmpresa.vTabelas.vCampos._marcaDesmarcaLinha;
    BitBtn15.Enabled := true;
  end;
end;

procedure TfrmCadConfigWS.marcarDesmarcaEmpresa;
begin
  if not vConfigWS.vEmpresa.dataSet.IsEmpty then
  begin
    if vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger > 0 then
    begin
      Application.MessageBox(PChar('Não é possível adicionar ou remover empresas, favor visualizar as informações no schema definido como base!'),
        'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;
    if vConfigWS.vEmpresa._marcaDesmarcaLinha then
	    BitBtn8.Enabled := true;
  end;
end;

procedure TfrmCadConfigWS.marcarDesmarcaTabela;
begin
  if vConfigWS.vEmpresa.vTabelas.dataSet.FieldByName('RESTRICAO').AsString <> 'S' then
    if not vConfigWS.vEmpresa.vTabelas.dataSet.IsEmpty then
    begin
      vConfigWS.vEmpresa.vTabelas._marcaDesmarcaLinha;
      BitBtn10.Enabled := true;
    end;
end;

procedure TfrmCadConfigWS.onGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Sender.IsNull then
    Text := Copy(Sender.AsString, 1, 100) + '...';
end;

procedure TfrmCadConfigWS.PageControl2Change(Sender: TObject);
begin
  atualizarDados;
end;

procedure TfrmCadConfigWS.salvarDados;
var
	I: Integer;
  vEndBanco, vSql, vScript, vUser: string;
begin
   vEndBanco := '';
    vSql:= '';
    vScript := '';
    vUser := '';

    vSchemaScript.abreSchema;
    vSchemaScript.dataSet.First;
    while not vSchemaScript.dataSet.Eof do
    begin
      for I := 0 to ComponentCount - 1 do
      begin
        if (Components[I] is TMemo) then
        begin
          if (TMemo(Components[I]).Name = 'MemoEndBanco' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString) then
            vEndBanco := TMemo(Components[I]).Text
          else if (TMemo(Components[I]).Name = 'Memo' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString) then
            vSql := TMemo(Components[I]).Text
          else if (TMemo(Components[I]).Name =  'MemoScript' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString) then
            vScript := TMemo(Components[I]).Text;
        end
        else if (Components[I] is TComboBox) then
        begin
          if (TComboBox(Components[I]).Name = 'ComboxUser' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString) then
            vUser := TComboBox(Components[I]).Text;
        end;
      end;
      vSchemaScript.dataSet.Edit;
      vSchemaScript.dataSet.FieldByName('END_BANCO').AsString := vEndBanco;
      vSchemaScript.dataSet.FieldByName('CONSULTA').AsString := vSql;
      vSchemaScript.dataSet.FieldByName('SCRIPT').AsString := vScript;
      vSchemaScript.dataSet.FieldByName('USER_BANCO').AsString := vUser;
      vSchemaScript.dataSet.Post;
      vSchemaScript.Apply;

      vSchemaScript.dataSet.Next;
    end;
end;

procedure TfrmCadConfigWS.salvarDadosScript(vStatus, vErro: string);
var
	I: Integer;
  vNomeSchema, vScript, vUser: string;
begin
	vNomeSchema := '';
  vScript :='';
  vUser := '';

  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TTabSheet) then
    begin
      if (PageControl2.ActivePage = TTabSheet(Components[I])) then
        vNomeSchema := StringReplace(TTabSheet(Components[I]).Name, 'Tabsheet', '', []);
    end
    else if (Components[I] is TMemo) then
    begin
    	if (TMemo(Components[I]).Name = 'Memo' + vNomeSchema) then
     		vSql := TMemo(Components[I]).Text
    	else if (TMemo(Components[I]).Name = 'MemoScript' + vNomeSchema) then
      	vScript := TMemo(Components[I]).Text;
    end
    else if (Components[I] is TComboBox) then
    begin
      if (TComboBox(Components[I]).Name = 'ComboxUser' + vNomeSchema) then
        vUser := TComboBox(Components[I]).Text;
    end;
  end;

  vSchemaScript.salvarDadosScript(vNomeSchema, vUser, vScript, vStatus, vErro);
end;

procedure TfrmCadConfigWS.copiarConfClick(Sender: TObject);
var
	vOK: boolean;
begin
  vOK := true;

  if  (vConfigWS.vEmpresa.dataSet.IsEmpty) then
  	vOK := false;

  if not vOK then
    if  ((vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger = 0) or (vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger = 0)) then
      vOK := false;

  if not vOK then  
  begin
    Application.MessageBox('Favor selecionar uma empresa para copiar os dados.', 'Atenção', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
    colarConf.Enabled := false;
    exit;
  end;

  colarConf.Enabled := True;
  vConfigWS.vCodSchema := vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger;
  vConfigWS.vCodEmpresa := vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger;
  vConfigWS.vAtivo := vDadosIni.IfThen(vConfigWS.vEmpresa.dataSet.FieldByName('SEL').AsString = 'S', 1, 0);
end;

procedure TfrmCadConfigWS.CopiarSchema1Click(Sender: TObject);
var
	vOK: boolean;
begin
  vOK := true;

  if  (vConfigWS.dataSet.IsEmpty) then
  	vOK := false;

  if not vOK then
    if  (vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger = 0) then
      vOK := false;

  if not vOK then
  begin
    Application.MessageBox('Favor selecionar um schema para copiar os dados.', 'Atenção', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
    colarConf.Enabled := false;
    exit;
  end;

  ColarSchema1.Enabled := true;
  vConfigWS.vCodSchema := vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger;
  vConfigWS.vCodEmpresa := vConfigWS.vEmpresa.dataSet.FieldByName('COD_EMPRESA').AsInteger;
end;

procedure TfrmCadConfigWS.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  DBGrid2DblClick(Sender);
end;

procedure TfrmCadConfigWS.SpeedButton11Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CWS035', 'ABRIR', '', 'WSR_SCRIPTS', '', vConfigWS.buscas, true) then
    Exit;

  if not vReplicacoes._abreFormReplicacaPendentes then
    exit;
end;

procedure TfrmCadConfigWS.SpeedButton12Click(Sender: TObject);
var
  Tab: TTabSheet;
  PanelPendente, PanelFalha, PanelConsScrip, PanelUser, PanelScript, Panel, Panel2: TPanel;
  ComboxUser: TComboBox;
  LabelPendente, LabelFalha, LabelUser: TLabel;
  MemoEndBanco,Memo, MemoScript: TMemo;
  ibDatabase, ibDatabaseSydba, ibDatabaseRepl: TIBDataBase;
  ibQuery, ibQuerySysDba, ibQueryRepl: TIBQuery;
  ibDataSource: TDataSource;
  ibTransaction, ibTransactionSysdba, ibTransactionRepl: TIBTransaction; 
  GroupBoxEndBanco, GroupBox, GroupBoxScript, GroupBoxScripts: TGroupBox;
  BitBtn, BitBtnScript, BitBtnSair: TBitBtn;
  DBGrid, DBGridScript: TDBGrid;
  radioGroup: TRadioGroup;
  vNomeTab: string;
  fTempScript: TClientDataSet;
  fTempScriptDataSource: TDataSource;
  I: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('CWS038', 'ABRIR', '', 'WSR_SCRIPTS', '', vConfigWS.buscas, true) then
    Exit;

  frmCadConfigWS.Caption := 'Consultas / Scripts';
  vSchemaScript.verificarSchema;
  if vSchemaScript.abreSchema then
  begin
    if vComponentesCriados then
    begin
      PageControl1.ActivePage := TabSheet2;
      TabSheet7.Show;
    end
    else
    begin
      vSchemaScript.dataSet.First;
      while not vSchemaScript.dataSet.Eof do
      begin
        fTempScript := TClientDataSet.Create(Self);
        fTempScript.Name := 'fTempScript' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        fTempScript.Close;
        fTempScript.FieldDefs.Clear;
        fTempScript.FieldDefs.Add('SQL', ftMemo, 8, false);
        fTempScript.FieldDefs.Add('STATUS', ftString, 10, false);
        fTempScript.FieldDefs.Add('USER_BANCO', ftString, 8, false);
        fTempScript.FieldDefs.Add('ERRO', ftMemo, 8, false);

        if fTempScript.Tag = 0 then
        begin
          try
            fTempScript.CreateDataSet;
            fTempScript.Tag := 1;
            fTempScript.FieldByName('SQL').DisplayLabel := 'Script';
            fTempScript.FieldByName('SQL').OnGetText := onGetText;
					  fTempScript.FieldByName('USER_BANCO').DisplayLabel := 'Usuario';
				    fTempScript.FieldByName('ERRO').DisplayLabel := 'Erro';
            fTempScript.FieldByName('ERRO').OnGetText := onGetText;
            fTempScript.FieldByName('STATUS').Visible := false;
          except
          end;
        end;

        fTempScriptDataSource := TDataSource.Create(Self);
        fTempScriptDataSource.Name := 'fTempScriptDataSource' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
	      fTempScriptDataSource.DataSet := fTempScript;

        ibDatabaseSydba := TIBDatabase.Create(Self);
        ibDatabaseRepl := TIBDatabase.Create(Self);
        ibDatabase := TIBDatabase.Create(Self);

        ibTransactionSysdba := TIBTransaction.Create(Self);
        ibTransactionSysdba.AllowAutoStart := true;
        ibTransactionSysdba.AutoStopAction := saNone;
        ibTransactionSysdba.DefaultAction := TACommit;
        ibTransactionSysdba.DefaultDatabase := ibDatabaseSydba;
        ibTransactionSysdba.IdleTimer := 0;
        ibTransactionSysdba.Name := 'ibTransactionSysdba' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibTransactionSysdba.Params.Clear;
        ibTransactionSysdba.Params.Add('read_committed');
        ibTransactionSysdba.Params.Add('rec_version');
        ibTransactionSysdba.Params.Add('nowait');
        ibTransactionSysdba.Tag := 0;

        ibTransactionRepl := TIBTransaction.Create(Self);
        ibTransactionRepl.AllowAutoStart := true;
        ibTransactionRepl.AutoStopAction := saNone;
        ibTransactionRepl.DefaultAction := TACommit;
        ibTransactionRepl.DefaultDatabase := ibDatabaseRepl;
        ibTransactionRepl.IdleTimer := 0;
        ibTransactionRepl.Name := 'ibTransactionRepl' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibTransactionRepl.Params.Clear;
        ibTransactionRepl.Params.Add('read_committed');
        ibTransactionRepl.Params.Add('rec_version');
        ibTransactionRepl.Params.Add('nowait');
        ibTransactionRepl.Tag := 0;

        ibTransaction := TIBTransaction.Create(Self);
        ibTransaction.AllowAutoStart := true;
        ibTransaction.AutoStopAction := saNone;
        ibTransaction.DefaultAction := TACommit;
        ibTransaction.DefaultDatabase := ibDatabase;
        ibTransaction.IdleTimer := 0;
        ibTransaction.Name := 'ibTransaction' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibTransaction.Params.Clear;
        ibTransaction.Params.Add('read_committed');
        ibTransaction.Params.Add('rec_version');
        ibTransaction.Params.Add('nowait');
        ibTransaction.Tag := 0;

        ibDatabaseSydba.ForceClose;
        ibDatabaseSydba.Connected := false;
        ibDatabaseSydba.LoginPrompt := false;
        ibDatabaseSydba.DatabaseName := vSchemaScript.dataSet.FieldByName('END_BANCO').AsString;
        ibDatabaseSydba.Name := 'ibDatabaseSydba' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibDatabaseSydba.Params.Clear;
        ibDatabaseSydba.Params.Add('user_name=sysdba');
        ibDatabaseSydba.Params.Add('password=masterkey');
        ibDatabaseSydba.DefaultTransaction := ibTransactionSysdba;

        ibDatabaseRepl.ForceClose;
        ibDatabaseRepl.Connected := false;
        ibDatabaseRepl.LoginPrompt := false;
        ibDatabaseRepl.DatabaseName := vSchemaScript.dataSet.FieldByName('END_BANCO').AsString;
        ibDatabaseRepl.Name := 'ibDatabaseRepl' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibDatabaseRepl.Params.Clear;
        ibDatabaseRepl.Params.Add('user_name=repl');
        ibDatabaseRepl.Params.Add('password=masterkey');
        ibDatabaseRepl.DefaultTransaction := ibTransactionRepl;

        ibDatabase.ForceClose;
        ibDatabase.Connected := false;
        ibDatabase.LoginPrompt := false;
        ibDatabase.DatabaseName := vSchemaScript.dataSet.FieldByName('END_BANCO').AsString;
        ibDatabase.Name := 'ibDatabase' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibDatabase.Params.Clear;
        ibDatabase.Params.Add('user_name=sysdba');
        ibDatabase.Params.Add('password=masterkey');
        ibDatabase.DefaultTransaction := ibTransaction;

        ibQuerySysDba := TIBQuery.Create(Self);
        ibQuerySysDba.Active := false;
        ibQuerySysDba.AutoCalcFields := true;
        ibQuerySysDba.BufferChunks := 500;
        ibQuerySysDba.Database := ibDatabaseSydba;
        ibQuerySysDba.Filtered := false;
        ibQuerySysDba.Name := 'ibQuerySysDba' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibQuerySysDba.SQL.Text := vSchemaScript.dataSet.FieldByName('CONSULTA').AsString;
        ibQuerySysDba.Transaction := ibTransactionSysdba;
        
        ibQueryRepl := TIBQuery.Create(Self);
        ibQueryRepl.Active := false;
        ibQueryRepl.AutoCalcFields := true;
        ibQueryRepl.BufferChunks := 500;
        ibQueryRepl.Database := ibDatabaseRepl;
        ibQueryRepl.Filtered := false;
        ibQueryRepl.Name := 'ibQueryRepl' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibQueryRepl.SQL.Text := vSchemaScript.dataSet.FieldByName('CONSULTA').AsString;
        ibQueryRepl.Transaction := ibTransactionRepl;

        ibQuery := TIBQuery.Create(Self);
        ibQuery.Active := false;
        ibQuery.AutoCalcFields := true;
        ibQuery.BufferChunks := 500;
        ibQuery.Database := ibDatabase;
        ibQuery.Filtered := false;
        ibQuery.Name := 'ibQuery' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibQuery.SQL.Text := vSchemaScript.dataSet.FieldByName('CONSULTA').AsString;
        ibQuery.Transaction := ibTransaction;

        ibDataSource := TDataSource.Create(Self);
        ibDataSource.DataSet := ibQuery;
        ibDataSource.Enabled := true;
        ibDataSource.AutoEdit := true;
        ibDataSource.Name := 'ibDataSource' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ibDataSource.Tag := 0;

        Tab := TTabSheet.create(Self);
        Tab.parent := PageControl2;
        Tab.Align := alClient;
        Tab.name := 'Tabsheet' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        if trim(vNomeTab) = '' then
        	vNomeTab := Tab.Name;
        Tab.Caption := vSchemaScript.dataSet.FieldByName('IDENTIFICACAO').AsString;
        Tab.PageControl := PageControl2;
        Tab.TabVisible := True;
        Tab.Visible := True;
        Tab.show;

        GroupBoxScript := TGroupBox.Create(Self);
        GroupBoxScript.Parent := Tab;
        GroupBoxScript.Align := alTop;
        GroupBoxScript.Height := 160;
        GroupBoxScript.TabOrder := 2;
        GroupBoxScript.Name := 'GroupBoxScript' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        GroupBoxScript.Caption := 'Script';
        GroupBoxScript.Visible := true;
        GroupBoxScript.Enabled := true;

        MemoScript := TMemo.Create(Self);
        MemoScript.Parent := GroupBoxScript;
        MemoScript.Align := alClient;
        MemoScript.TabOrder := 0;
        MemoScript.Name := 'MemoScript' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        MemoScript.Clear;
        MemoScript.Text := vSchemaScript.dataSet.FieldByName('SCRIPT').AsString;
        MemoScript.TabOrder := 0;
        MemoScript.ScrollBars := ssVertical;

        PanelUser := TPanel.Create(Self);
        PanelUser.Parent := GroupBoxScript;
        PanelUser.Align := alBottom;
        PanelUser.Height := 40;
        PanelUser.TabOrder := 1;
        PanelUser.BevelOuter := bvNone;
        PanelUser.Name := 'PanelUser' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        PanelUser.Caption := '';

        LabelUser := TLabel.Create(Self);
        LabelUser.Parent := PanelUser;
        LabelUser.Name := 'LabelUser' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        LabelUser.Caption := 'Usuário:';
        LabelUser.Left := 2;
        LabelUser.Top := 11;

        ComboxUser := TComboBox.Create(Self);
        ComboxUser.Parent := PanelUser;
        ComboxUser.TabOrder := 0;
        ComboxUser.Name := 'ComboxUser' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        ComboxUser.Items.Clear();
        ComboxUser.TabOrder := 0;
        ComboxUser.Items.Add('REPL');
        ComboxUser.Items.Add('SYSDBA');
        if trim(vSchemaScript.dataSet.FieldByName('USER_BANCO').AsString) = 'SYSDBA' then
        	ComboxUser.ItemIndex := 1
        else
        	ComboxUser.ItemIndex := 0;
        ComboxUser.Height := 21;
        ComboxUser.ItemHeight := 13;
        ComboxUser.Style := csDropDownList;
        ComboxUser.Top := 8;
        ComboxUser.Left := 60;
        ComboxUser.Text := '';

        PanelPendente := TPanel.Create(Self);
        PanelPendente.Parent := PanelUser;
        PanelPendente.Align := alNone;
        PanelPendente.Caption := '';
        PanelPendente.BevelInner := bvNone;
        PanelPendente.BevelKind := bkNone;
        PanelPendente.BorderStyle := bsNone;
        PanelPendente.Name := 'PanelPendente' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        PanelPendente.Color := $00009BDD;
        PanelPendente.Font.Charset := DEFAULT_CHARSET;
        PanelPendente.Font.Color := $00009BDD;
        PanelPendente.Font.Height := -11;
        PanelPendente.Font.Name := 'Tahoma';
        PanelPendente.Font.Orientation := 0;
        PanelPendente.Font.Pitch := fpDefault;
        PanelPendente.Font.Size := 8;
        PanelPendente.Height := 13;
        PanelPendente.Width := 40;
        PanelPendente.Top := 12;
        PanelPendente.Left := 534;
        PanelPendente.ParentBackground := false;
        PanelPendente.ParentFont := false;
        PanelPendente.VerticalAlignment := taVerticalCenter;


        LabelPendente := TLabel.Create(Self);
        LabelPendente.Parent := PanelUser;
        LabelPendente.Align := alNone;
        LabelPendente.Caption := 'Pendente';
        LabelPendente.Name := 'LabelPendente' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        LabelPendente.Height := 13;
        LabelPendente.Top := 11;
        LabelPendente.Left := 580;
        LabelPendente.Width := 46;

        PanelFalha := TPanel.Create(Self);
        PanelFalha.Parent := PanelUser;
        PanelFalha.Align := alNone;
        PanelFalha.Caption := '';
        PanelFalha.BevelInner := bvNone;
        PanelFalha.BevelKind := bkNone;
        PanelFalha.BorderStyle := bsNone;
        PanelFalha.Name := 'PanelFalha' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        PanelFalha.Color := TColor($00A4A4FF);
        PanelFalha.Font.Charset := DEFAULT_CHARSET;
        PanelFalha.Font.Color := TColor($00A4A4FF);
        PanelFalha.Font.Height := -11;
        PanelFalha.Font.Name := 'Tahoma';
        PanelFalha.Font.Orientation := 0;
        PanelFalha.Font.Pitch := fpDefault;
        PanelFalha.Font.Size := 8;
        PanelFalha.Height := 13;
        PanelFalha.Width := 40;
        PanelFalha.Top := 12;
        PanelFalha.Left := 633;
        PanelFalha.ParentBackground := false;
        PanelFalha.ParentFont := false;
        PanelFalha.VerticalAlignment := taVerticalCenter;

        LabelFalha := TLabel.Create(Self);
        LabelFalha.Parent := PanelUser;
        LabelFalha.Align := alNone;
        LabelFalha.Caption := 'Falha';
        LabelFalha.Name := 'LabelFalha' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        LabelFalha.Height := 13;
        LabelFalha.Top := 11;
        LabelFalha.Left := 679;
        LabelFalha.Width := 26;        

        radioGroup := TRadioGroup.Create(Self);
        radioGroup.Columns := 2;
        radioGroup.Parent := PanelUser;
        radioGroup.Height := 33;
        radioGroup.Width := 185;
        radioGroup.TabOrder := 1;
        radioGroup.Items.Clear;
        radioGroup.Items.Add('Sistema');
        radioGroup.Items.Add('Replicador');
        radioGroup.ItemIndex := 0;
        radioGroup.Name := 'radioGroup' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        radioGroup.Left := 250;
        radioGroup.Caption := 'Executar';
        if trim(vSchemaScript.dataSet.FieldByName('TOKEN').AsString) = 'WEBSERVICE' then
        	radioGroup.Enabled := false;

        BitBtnScript := TBitBtn.Create(Self);
        BitBtnScript.Parent := PanelUser;
        BitBtnScript.Name := 'BitBtnScript' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        BitBtnScript.Caption := 'Executar';
        BitBtnScript.Hint := 'Executar script';
        BitBtnScript.TabOrder := 5;
        BitBtnScript.OnClick := botaoExecutar;
        BitBtnScript.Height := 25;
        BitBtnScript.Width := 75;
        BitBtnScript.Left := 450;
        BitBtnScript.Top := 8;
        BitBtnScript.Enabled := true;

        GroupBox := TGroupBox.Create(Self);
        GroupBox.Parent := Tab;
        GroupBox.Align := alTop;
        GroupBox.Height := 160;
        GroupBox.TabOrder := 1;
        GroupBox.Name := 'GroupBox' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        GroupBox.Caption := 'Consulta';
        GroupBox.Visible := true;
        GroupBox.Enabled := true;

        Panel := TPanel.Create(Self);
        Panel.Parent := GroupBox;
        Panel.TabOrder := 0;
        Panel.Align := alTop;
        Panel.BevelOuter := bvNone;
        Panel.Name := 'Panel' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        Panel.Caption := '';

        Memo := TMemo.Create(Self);
        Memo.Parent := Panel;
        Memo.TabOrder := 0;
        Memo.Name := 'Memo' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        Memo.Clear;
        Memo.Text := vSchemaScript.dataSet.FieldByName('CONSULTA').AsString;
        Memo.Align := alClient;
        Memo.ReadOnly := false;
        Memo.ScrollBars := ssVertical;

        BitBtn := TBitBtn.Create(Self);
        BitBtn.Parent := Panel;
        BitBtn.TabOrder := 1;
        BitBtn.Name := 'BitBtn' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        BitBtn.Caption := 'Consultar';
        BitBtn.Hint := 'Realizar consulta';
        BitBtn.OnClick := botaoConsultar;
        BitBtn.Align := alRight;
        BitBtn.Enabled := true;

        Panel2 := TPanel.Create(Self);
        Panel2.Parent := GroupBox;
        Panel2.TabOrder := 1;
        Panel2.Align := alClient;
        Panel2.BevelOuter := bvNone;
        Panel2.Name := 'Panel2' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        Panel2.Caption := '';

        DBGrid := TDBGrid.Create(Self);
        DBGrid.Parent := Panel2;
        DBGrid.TabOrder := 0;
        DBGrid.DataSource := ibDataSource;
        DBGrid.Height := 200;
        DBGrid.Name := 'DBGrid' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        DBGrid.Align := alClient;
        DBGrid.Enabled := true;
        DBGrid.Options := DBGrid.Options - [dgEditing];
        
    	  GroupBoxEndBanco := TGroupBox.Create(Self);
        GroupBoxEndBanco.Parent := Tab;
        GroupBoxEndBanco.Align := alTop;
        GroupBoxEndBanco.Height := 40;
        GroupBoxEndBanco.TabOrder := 0;
        GroupBoxEndBanco.Name := 'GroupBoxEndBanco' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        GroupBoxEndBanco.Caption := 'Endereço Banco';
        GroupBoxEndBanco.Visible := true;
        GroupBoxEndBanco.Enabled := true;

        MemoEndBanco := TMemo.Create(Self);
        MemoEndBanco.Parent := GroupBoxEndBanco;
        MemoEndBanco.TabOrder := 0;
        MemoEndBanco.Name := 'MemoEndBanco' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        MemoEndBanco.Clear;
        MemoEndBanco.Text := vSchemaScript.dataSet.FieldByName('END_BANCO').AsString;
        MemoEndBanco.Align := alClient;
        MemoEndBanco.ReadOnly := false;
        MemoEndBanco.ScrollBars := ssVertical;

        GroupBoxScripts := TGroupBox.Create(Self);
        GroupBoxScripts.Parent := Tab;
        GroupBoxScripts.Align := alClient;
        GroupBoxScripts.Height := 50;
        GroupBoxScripts.TabOrder := 3;
        GroupBoxScripts.Name := 'GroupBoxScripts' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        GroupBoxScripts.Caption := 'Scripts';
        GroupBoxScripts.Visible := true;
        GroupBoxScripts.Enabled := true;

        DBGridScript := TDBGrid.Create(Self);
        DBGridScript.Parent := GroupBoxScripts;
        DBGridScript.TabOrder := 2;
        DBGridScript.Height := 200;
        DBGridScript.Name := 'DBGridScript' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        DBGridScript.Align := alClient;
        DBGridScript.DataSource := fTempScriptDataSource;
        DBGridScript.Enabled := true;
        DBGridScript.Options := DBGridScript.Options - [dgEditing];
        DBGridScript.Columns.Clear;
        DBGridScript.Columns.Add;
        DBGridScript.Columns[0].FieldName := 'SQL';
        DBGridScript.Columns[0].Title.Caption := 'Script';
        DBGridScript.Columns[0].Width := 400;
        DBGridScript.Columns.Add;
        DBGridScript.Columns[1].FieldName := 'USER_BANCO';
        DBGridScript.Columns[1].Title.Caption := 'User';
        DBGridScript.Columns[1].Width := 40;
        DBGridScript.Columns.Add;
        DBGridScript.Columns[2].FieldName := 'ERRO';
        DBGridScript.Columns[2].Title.Caption := 'Erro';
        DBGridScript.Columns[2].Width := 300;
        DBGridScript.Columns.Add;
        DBGridScript.Columns[3].FieldName := 'STATUS';
        DBGridScript.Columns[3].Title.Caption := 'Status';
        DBGridScript.Columns[3].Width := 20;
        DBGridScript.Columns[3].Visible := false;
        DBGridScript.OnDrawColumnCell := onDBGridDrawColumnCell;
        DBGridScript.OnDblClick := onDblClick;
        DBGridScript.OnKeyDown := onDBGridKeyDown;
        DBGridScript.Hint := 'Duplo clique para visualizar script';

        BitBtnSair := TBitBtn.Create(Self);
        BitBtnSair.Parent := Tab;
        BitBtnSair.Name := 'BitBtnSair' + vSchemaScript.dataSet.FieldByName('TOKEN').AsString;
        BitBtnSair.Caption := 'Sair (ESC)';
        BitBtnSair.Hint := 'Sair';
        BitBtnSair.Align := alBottom;
        BitBtnSair.Width := 75;
        BitBtnSair.Enabled := true;
        BitBtnSair.OnClick := voltaTelaConsulta;

        GroupBoxEndBanco.TabOrder := 0;
        GroupBox.TabOrder := 1;
        GroupBoxScript.TabOrder := 2;
        GroupBoxScripts.TabOrder := 3;

        vSchemaScript.dataSet.Next;
      end;
      vSchemaScript.dataSet.First;
      vComponentesCriados := true;
      for I := 0 to ComponentCount - 1 do
        if (Components[I] is TTabSheet) then
          if TTabSheet(Components[I]).Name = vNomeTab then
          begin
            TTabSheet(Components[I]).Show;
            atualizarDados;
            Break;
          end;
      end;
    end;
end;

procedure TfrmCadConfigWS.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  DBGrid3DblClick(Sender);
end;

procedure TfrmCadConfigWS.SpeedButton14Click(Sender: TObject);
var
 vCod, vCodOld: string;
begin
   try
     if not vDadosIni.PesqPros('CWS034', 'ALTERAR', '', 'WSR_SCHEMAS',
       vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsString, vConfigWS.buscas, true) then
       exit;
       
     vCodOld := IntToStr(vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger);
     vCod := IntToStr(vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger);

     if InputQuery('Informe um Valor', 'Informe o código do shema base', vCod) then
     begin
        try
          StrToInt(vCod)
        except
          Application.MessageBox('Código do schema base inválido', 'Atenção', 0 + 64);
          Exit;
        end;

        if StrToFloat(vCod) < 0 then
        begin
          Application.MessageBox('Código do schema base não informado', 'Atenção', 0 + 64);
          Exit;
        end;
     end
     else
     begin
       Application.MessageBox('Código do schema base não informado', 'Atenção', 0 + 64);
       Exit;
     end;

     if vConfigWS.dataSet.State in [dsInsert, dsEdit] then
       vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger := StrToInt(vCod);

     if vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger > 0 then
     begin
        if not (vConfigWS.existeSchema) then
        begin
          vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger := 0;
          Application.MessageBox(PChar('Código do schema base ' + vCod +
          	' não encontrado ou se encontra na lixeira!'), 'Erro', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          exit;
        end;
        if not (vConfigWS.existeSchemaEspelhado) then
        begin
          vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger := 0;
          Application.MessageBox(PChar('Schema utlizado para configurar outros schemas,' +
          	' não é possível informar o código do schema base!'), 'Erro', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          exit;
        end;
        if vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger = vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsInteger then
        begin
          vConfigWS.dataSet.FieldByName('COD_SCHEMA_ESP').AsInteger := 0;
          Application.MessageBox(PChar('Código do schema deve ser diferente do código do schema base!'),
          	'Erro', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          exit;
        end;

     end;

     vDadosIni.GravaAuditoria('CWS034', 'ALTERAR', 'ANT: ' + vCodOld + ' NOVA: ' + vCod,
       'WSR_SCHEMAS', vConfigWS.dataSet.FieldByName('COD_SCHEMA').AsString, vConfigWS.buscas);
   finally

   end;
end;

procedure TfrmCadConfigWS.SpeedButton15Click(Sender: TObject);
begin
  DBComboBox8.Enabled := true;
end;

procedure TfrmCadConfigWS.SpeedButton1Click(Sender: TObject);
begin
	 Screen.Cursor := crHourGlass;
	 try
    vSql := vConfigWS.dataSet.CommandText;
    vRecNo := vConfigWS.dataSet.RecNo;
    vIndex := TClientDataSet(DBGrid1.DataSource.DataSet).IndexName;
    vSchemaScript.verificarSchema;
    if not vConfigWS.Edit then
      exit;
      
    inherited;
    colarConf.Enabled := false;
    DBComboBox8.Enabled := false;
    gbEmpresas.Visible := True;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;
    BitBtn8.Enabled := false;

    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      DBEdit4.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('CWS008', 'ABRIR A LIXEIRA', '', 'WSR_SCHEMAS',
    '', vConfigWS.buscas, true) then
  begin
    if not vConfigWS.abrelixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [CWS007]';
      SpeedButton1.Visible := True;
      SpeedButton5.Visible := False;
      SpeedButton6.Visible := True;
      SpeedButton8.Visible := True;
      SpeedButton7.Visible := True;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [CWS002]';
      SpeedButton1.Visible := False;
      SpeedButton5.Visible := True;
      SpeedButton6.Visible := False;
      SpeedButton8.Visible := False;
      SpeedButton7.Visible := False;
    end;
  end;
end;

procedure TfrmCadConfigWS.SpeedButton2Click(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
 try
  if vConfigWS.Delete then
  begin
    if vConfigWS.StatusLixeira then
    begin
      lixeiraVazia(false);
    end
    else
    begin
      lixeiraVazia(true);
      vConfigWS.abreConfigWs;
    end;
  end;
 finally
    Screen.Cursor := crDefault;
 end;
end;

procedure TfrmCadConfigWS.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('CWS009', '', '', 'WSR_SCHEMAS', '', vConfigWS.buscas, false) then
  begin
    if vConfigWS.restauraLixeira then
    begin
      if vConfigWS.StatusLixeira then
        lixeiraVazia(false)
      else
      begin
        lixeiraVazia(true);
        vConfigWS.abreConfigWs;
      end;
    end;
  end;

end;

procedure TfrmCadConfigWS.SpeedButton6Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CWS010', 'ABRIR', '', 'WSR_TABELAS', '', vConfigWS.buscas, true) then
    Exit;

  if not vTabelasBD._abreFormTabelaNaoReplicadas then
    exit;
end;

procedure TfrmCadConfigWS.SpeedButton7Click(Sender: TObject);
begin
   if not vDadosIni.PesqPros('CWS016', 'ABRIR', '', 'WSR_DEPENDENCIAS', '', vConfigWS.buscas, true) then
    Exit;

  if not vDependenciaWs._abreFormDependencia then
    exit;
end;

procedure TfrmCadConfigWS.SpeedButton8Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CWS013', 'ABRIR', '', 'WSR_CADASTROSBASICOS', '', vConfigWS.buscas, true) then
    Exit;

  if not vCadastrosBasWs._abreFormCadastrosBasicos then
    exit;
end;

procedure TfrmCadConfigWS.SpeedButton9Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    marcarDesmarcaEmpresa;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigWS.voltaTelaConsulta(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    salvarDados;
  finally
  	vSchemaScript.CommitaTransacao;
    Screen.Cursor := crDefault;
    frmCadConfigWS.Caption := 'Configurar wsReplicação';
		PageControl1.ActivePage := TabSheet2;
	  TabSheet2.Show;
  end;
end;

end.
