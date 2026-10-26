unit uAssistenteDeConfiguracaoFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, ComCtrls, Buttons, Mask, DBCtrls, Spin,
  DB, uClassesAssistenConfig, uEditMoeda, CheckLst;

type
  TfrmAssistemConfigFiscal = class(TfrmPadrao)
    Panel1: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btVoltar: TButton;
    btAvancar: TButton;
    btCancelar: TButton;
    PageControl1: TPageControl;
    tsBemVindo: TTabSheet;
    Panel5: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Panel6: TPanel;
    Image2: TImage;
    tsTerminal: TTabSheet;
    Label6: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    RadioGroup1: TRadioGroup;
    Edit7: TEdit;
    Edit6: TEdit;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    RadioGroup2: TRadioGroup;
    Edit13: TEdit;
    Edit14: TEdit;
    tsRetaguarda: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    tsConfig: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    tsECF: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    SpeedButton9: TSpeedButton;
    Label33: TLabel;
    cbImp: TComboBox;
    edECF: TEdit;
    cbBalanca: TComboBox;
    spPorta: TSpinEdit;
    edModDocFiscal: TEdit;
    spQtdeDigDAV: TSpinEdit;
    edNumEquip: TEdit;
    spQtdeViasCPnaoF: TSpinEdit;
    edObs: TEdit;
    edEnderecoHwF: TEdit;
    Panel7: TPanel;
    ckAbrirGaveta: TCheckBox;
    ckUsarCodBarra: TCheckBox;
    ckVerifPapel: TCheckBox;
    ckConfEst: TCheckBox;
    ck3DigVrUnit: TCheckBox;
    ckTecladoPDV: TCheckBox;
    ckSupermercado: TCheckBox;
    ckMovimentoOperador: TCheckBox;
    ckPoPreco: TCheckBox;
    ckLeitorSerial: TCheckBox;
    rbArred: TRadioButton;
    rbTrnc: TRadioButton;
    spPortaLeitor: TSpinEdit;
    tsFinal: TTabSheet;
    scFinal: TScrollBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit33: TEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Edit43: TEdit;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    tsTerminais: TTabSheet;
    Label39: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit15: TEdit;
    ckDescISSQN: TCheckBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    tsComandos: TTabSheet;
    GroupBox3: TGroupBox;
    ck1: TCheckBox;
    ck2: TCheckBox;
    ck3: TCheckBox;
    ck4: TCheckBox;
    ck5: TCheckBox;
    ck6: TCheckBox;
    ck7: TCheckBox;
    ck8: TCheckBox;
    ck9: TCheckBox;
    ck10: TCheckBox;
    tsSicronizar: TTabSheet;
    spCodTerminal: TSpinEdit;
    spContRei: TSpinEdit;
    edDescItem: TEditMoeda;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Memo1: TMemo;
    CheckListBox1: TCheckListBox;
    edDataMovimento: TMaskEdit;
    edDataReducao: TMaskEdit;
    Label23: TLabel;
    Label28: TLabel;
    Label43: TLabel;
    Edit16: TEdit;
    tsTotalizadores: TTabSheet;
    scTotalizadores: TScrollBox;
    Label44: TLabel;
    Label45: TLabel;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    Label46: TLabel;
    tsGrandeTotal: TTabSheet;
    GroupBox6: TGroupBox;
    edGrandeTotal: TEditMoeda;
    OpenDialog1: TOpenDialog;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    ListBox2: TListBox;
    ckSegundoPlano: TCheckBox;
    cbTEF: TComboBox;
    Label47: TLabel;
    DBCheckBox3: TDBCheckBox;
    ComboBox1: TComboBox;
    Label48: TLabel;
    ComboBox2: TComboBox;
    Label49: TLabel;
    Label50: TLabel;
    edImpDavECF: TEdit;
    SpeedButton2: TSpeedButton;
    Panel8: TPanel;
    pnPrecoAdicional: TPanel;
    ListBox3: TListBox;
    ListBox4: TListBox;
    SpeedButton3: TSpeedButton;
    SpeedButton12: TSpeedButton;
    BitBtn2: TBitBtn;
    Panel9: TPanel;
    Label51: TLabel;
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edImpDavECFChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit14Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ListBox1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
    vCheck: TCheckBox;
    vEdit: TEdit;
    vLocal: string;
    function selecionarDiretorio(diretorioInicial: string): string;
    procedure bemVindoAvancarClick(Sender: TObject);
    procedure terminalAvancarClick(Sender: TObject);
    procedure retaguardaAvancarClick(Sender: TObject);
    procedure configAvancarClick(Sender: TObject);
    procedure ecfAvancarClick(Sender: TObject);
    procedure finalizadoresAvancarClick(Sender: TObject);
    procedure totalizadoresAvancarClick(Sender: TObject);
    procedure terminaisAvancarClick(Sender: TObject);
    procedure comandosAvancarClick(Sender: TObject);
    procedure grandeTotalAvancarClick(Sender: TObject);
    procedure concluirClick(Sender: TObject);

    procedure terminalVoltarClick(Sender: TObject);
    procedure retaguardaVoltarClick(Sender: TObject);
    procedure configVoltarClick(Sender: TObject);
    procedure ecfVoltarClick(Sender: TObject);
    procedure finalizadoresVoltarClick(Sender: TObject);
    procedure totalizadoresVoltarClick(Sender: TObject);
    procedure terminaisVoltarClick(Sender: TObject);
    procedure comandosVoltarClick(Sender: TObject);
    procedure grandeTotalVoltarClick(Sender: TObject);
    procedure sincronizarVoltarClick(Sender: TObject);

    procedure criaComponente(tipo, nome, caption, valor: string; indice, pLeft, pWidth: integer);
    procedure setDadosFormulario;
    function setDadosClasse: boolean;

  public
    { Public declarations }

  end;

var
  frmAssistemConfigFiscal: TfrmAssistemConfigFiscal;
  vAssistente: TECF_Assistente;

implementation

uses FileCtrl, uDtmAssistente, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TfrmAssistemConfigFiscal.bemVindoAvancarClick(Sender: TObject);
begin
  Label1.Caption := 'Configuração do Terminal';
  Label2.Caption := 'Localização do Terminal e endereços do banco de dados';
  btVoltar.Enabled := True;
  btVoltar.OnClick := terminalVoltarClick;
  PageControl1.ActivePage := tsTerminal;
  btAvancar.OnClick := terminalAvancarClick;
  Panel2.Visible := false;
  Panel4.Visible := false;
  RadioButton2Click(RadioButton2);
end;

procedure TfrmAssistemConfigFiscal.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 1 to 99 do
  begin
    if FindComponent('edCodF' + IntToStr(i)) = nil then
    begin
      criaComponente('EF', 'edCodF' + IntToStr(i), '', '', i, 32, 33);
      criaComponente('EF', 'edFinal' + IntToStr(i), '', '', i, 70, 121);
      criaComponente('EF', 'edTecla' + IntToStr(i), '', '', i, 197, 33);
      criaComponente('EF', 'edTipo' + IntToStr(i), '', '', i, 236, 33);
      criaComponente('CF', 'ckDeb' + IntToStr(i), 'Verificar Débito', '', i, 274, 97);
      criaComponente('CF', 'ckCred' + IntToStr(i), 'Verificar Crédito', '', i, 372, 97);
      criaComponente('CF', 'ckParc' + IntToStr(i), 'Parcelar', '', i, 472, 58);
      Break;
    end;
  end;
end;

procedure TfrmAssistemConfigFiscal.BitBtn3Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 1 to 99 do
  begin
    if FindComponent('edCodT' + IntToStr(i)) = nil then
    begin
      criaComponente('ET', 'edCodT' + IntToStr(i), '', '', i, 32, 41);
      criaComponente('ET', 'edTot' + IntToStr(i), '', '', i, 79, 121);
      Break;
    end;
  end;
end;

procedure TfrmAssistemConfigFiscal.btCancelarClick(Sender: TObject);
begin
  inherited;
  
    Close;
end;

procedure TfrmAssistemConfigFiscal.comandosAvancarClick(Sender: TObject);
begin
  if not setDadosClasse then
    Exit;
  Label1.Caption := 'Valor do Grande Total';
  Label2.Caption := 'Informar o valor acumulado do ECF';
  btVoltar.OnClick := grandeTotalVoltarClick;
  PageControl1.ActivePage := tsGrandeTotal;
  btAvancar.OnClick := grandeTotalAvancarClick;
  vAssistente.getGrandeTotal;
  setDadosFormulario;
end;

procedure TfrmAssistemConfigFiscal.comandosVoltarClick(Sender: TObject);
begin
  Label1.Caption := 'Dados do Terminal';
  Label2.Caption := 'Configurações adicionais usadas nos Arquivos Fiscais.';
  btVoltar.OnClick := terminaisVoltarClick;
  PageControl1.ActivePage := tsTerminais;
  btAvancar.OnClick := terminaisAvancarClick;
end;

procedure TfrmAssistemConfigFiscal.concluirClick(Sender: TObject);
begin
  try
    btVoltar.Enabled := False;
    btAvancar.Enabled := False;
    btCancelar.Enabled := False;
    Label46.Caption := '';
    Label46.Visible := True;
    ProgressBar1.Visible := True;
    ListBox2.Top := 3;
    ListBox2.Left := 20;
    ListBox2.Visible := True;
    if not setDadosClasse then
      Exit;
    if vAssistente.concluirAssistente(ProgressBar1, Label46,ListBox2) then
      ModalResult := mrOk;
  finally
    Label46.Caption := '';
    Label46.Visible := false;
    ProgressBar1.Visible := false;
    ListBox2.Visible := false;  
    btVoltar.Enabled := True;
    btAvancar.Enabled := True;
    btCancelar.Enabled := True;
  end;
end;

procedure TfrmAssistemConfigFiscal.configAvancarClick(Sender: TObject);
begin
  vLocal := 'config';
  if not setDadosClasse then
    Exit;
  Label1.Caption := 'Configuração do ECF';
  Label2.Caption := 'Configurações para comunicação com o ECF';
  btVoltar.OnClick := ecfVoltarClick;
  PageControl1.ActivePage := tsECF;
  btAvancar.OnClick := ecfAvancarClick;
  vAssistente.getDadosECF;
  setDadosFormulario;
end;

procedure TfrmAssistemConfigFiscal.configVoltarClick(Sender: TObject);
begin
  Label1.Caption := 'Configuração dos Sistemas de Retaguarda';
  Label2.Caption := 'Localização dos Sistemas de Retaguarda para configuração do Terminal';
  btVoltar.OnClick := retaguardaVoltarClick;
  PageControl1.ActivePage := tsRetaguarda;
  btAvancar.OnClick := retaguardaAvancarClick;
end;

procedure TfrmAssistemConfigFiscal.criaComponente(tipo, nome, caption, valor: string; indice, pLeft,
  pWidth: integer);
begin
  if pos('C', tipo) > 0 then
  begin
    vCheck := TCheckBox.create(Self);
    vCheck.Alignment := taRightJustify;
    if pos('F', tipo) > 0 then
      vCheck.Parent := scFinal
    else
      vCheck.Parent := scTotalizadores;
    vCheck.Name := nome;
    vCheck.Caption := caption;
    vCheck.Tag := indice;
    vCheck.Left := pLeft;
    vCheck.Width := pWidth;
    if indice = 1 then
      vCheck.Top := 22
    else vCheck.Top := 22 + (27 * (indice - 1));
    vCheck.Visible := true;
    vCheck.Checked := valor = 'S';
  end
  else
  begin
    vEdit := TEdit.create(Self);
    if pos('F', tipo) > 0 then
      vEdit.Parent := scFinal
    else
      vEdit.Parent := scTotalizadores;
    vEdit.Name := nome;
    vEdit.Text := caption;
    vEdit.Tag := indice;
    vEdit.Left := pLeft;
    vEdit.Width := pWidth;
    if indice = 1 then
      vEdit.Top := 20
    else vEdit.Top := 20 + (27 * (indice - 1));
    vEdit.Visible := true;
    vEdit.Text := valor;
  end;
end;

procedure TfrmAssistemConfigFiscal.ecfAvancarClick(Sender: TObject);
begin
  try
    StrToDate(edDataMovimento.Text);
  except
    Application.MessageBox('Data de movimento inválida','Atenção',0+64);
    exit;
  end;
  try
    StrToDate(edDataReducao.Text);
  except
    Application.MessageBox('Data da última Redução Z inválida','Atenção',0+64);
    exit;
  end;

  vLocal := 'ecf';

  if not setDadosClasse then
    Exit;
  Label1.Caption := 'Finalizadores de Cupom Fiscal';
  Label2.Caption :=
    'Configurar os finalizadores do equipamento ECF. Exemplo: Dinheiro, Cartão, etc.';
  btVoltar.OnClick := finalizadoresVoltarClick;
  PageControl1.ActivePage := tsFinal;
  btAvancar.OnClick := finalizadoresAvancarClick;
  vAssistente.getDadosFinalizadores;
  setDadosFormulario;
end;

procedure TfrmAssistemConfigFiscal.ecfVoltarClick(Sender: TObject);
begin
  Label1.Caption := 'Configuração dos Terminais para Relatórios e Sincronização';
  Label2.Caption := 'Configurações de Sincronização das vendas do Terminal para o Retaguarda';
  btVoltar.OnClick := configVoltarClick;
  PageControl1.ActivePage := tsConfig;
  btAvancar.OnClick := configAvancarClick;

//  Label1.Caption := 'Configuração dos Terminais para Relatórios e Sincronização';
//  Label2.Caption := 'Configurações de Sincronização das vendas do Terminal para o Retaguarda';
//  btVoltar.OnClick := retaguardaVoltarClick;
//  PageControl1.ActivePage := tsRetaguarda;
//  btAvancar.OnClick := retaguardaAvancarClick;
end;

procedure TfrmAssistemConfigFiscal.edImpDavECFChange(Sender: TObject);
begin
	inherited;
	if (Trim(edImpDavECF.Text) <> 'S') and (Trim(edImpDavECF.Text) <> 'N') then
		edImpDavECF.Text := '';
end;

procedure TfrmAssistemConfigFiscal.Edit14Enter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmAssistemConfigFiscal.finalizadoresAvancarClick(Sender: TObject);
begin
  if not setDadosClasse then
    Exit;
  Label1.Caption := 'Dados dos Totalizadores Não Fiscais';
  Label2.Caption := 'Configurações para os totalizadores não fiscais.';
  btVoltar.OnClick := totalizadoresVoltarClick;
  PageControl1.ActivePage := tsTotalizadores;
  btAvancar.OnClick := totalizadoresAvancarClick;
  vAssistente.getDadosTotalizadores;
  setDadosFormulario;
end;

procedure TfrmAssistemConfigFiscal.finalizadoresVoltarClick(Sender: TObject);
begin
  Label1.Caption := 'Configuração do ECF';
  Label2.Caption := 'Configurações para comunicação com o ECF';
  btVoltar.OnClick := ecfVoltarClick;
  PageControl1.ActivePage := tsECF;
  btAvancar.OnClick := ecfAvancarClick;
end;

procedure TfrmAssistemConfigFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vAssistente.Free;
  vAssistente := nil;

  Action := caFree;
  frmAssistemConfigFiscal := nil;
end;

procedure TfrmAssistemConfigFiscal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	inherited;
  if ModalResult <> mrOk then
    CanClose :=  Application.MessageBox('Deseja mesmo sair do assistente. As configurações serão perdidas',
    'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES ;
end;

procedure TfrmAssistemConfigFiscal.FormCreate(Sender: TObject);
begin
  inherited;
  vAssistente := TECF_Assistente.create;
end;

procedure TfrmAssistemConfigFiscal.FormShow(Sender: TObject);
begin
  inherited;
  Label46.Caption := '';
  tsBemVindo.TabVisible := False;
  tsTerminal.TabVisible := False;
  tsRetaguarda.TabVisible := False;
  tsConfig.TabVisible := False;
  tsECF.TabVisible := False;
  tsFinal.TabVisible := False;
  tsTotalizadores.TabVisible := False;
  tsTerminais.TabVisible := False;
  tsComandos.TabVisible := False;
  tsSicronizar.TabVisible := False;
  tsGrandeTotal.TabVisible := False;
  btAvancar.OnClick := bemVindoAvancarClick;
  PageControl1.ActivePage := tsBemVindo;
  Label1.Caption := 'Assistente de Configuração PAF-ECF';
  Label2.Caption := '';

  vAssistente.getDadosCadastrado;
  ckSegundoPlano.Checked := vAssistente.vTerminal.terminalFiscal = 'S';	
  RadioButton1.Checked := False;
  RadioButton2.Checked := not RadioButton1.Checked;

  Edit4.Text := vAssistente.vTerminal.bancoFiscal;
  Edit5.Text := vAssistente.vTerminal.bancoHWF;
  if DirectoryExists(copy(vAssistente.vTerminal.bancoHw, 1, 3)) then
    RadioGroup1.ItemIndex := 0
  else if Pos('127.0.0.1', vAssistente.vTerminal.bancoHw) > 0 then
    RadioGroup1.ItemIndex := 0
  else if Pos(UpperCase('localhost'), UpperCase(vAssistente.vTerminal.bancoHw)) > 0 then
    RadioGroup1.ItemIndex := 0
  else
    RadioGroup1.ItemIndex := 1;
  if RadioGroup1.ItemIndex = 0 then
  begin
    if Pos(':', vAssistente.vTerminal.bancoHw) = 2 then
    begin
      Edit7.Text := '127.0.0.1';
      Edit6.Text := vAssistente.vTerminal.bancoHw;
    end
    else
    begin
      Edit7.Text := Copy(vAssistente.vTerminal.bancoHw, 1, pos(':', vAssistente.vTerminal.bancoHw) -
        1);
      Edit6.Text := Copy(vAssistente.vTerminal.bancoHw, pos(':', vAssistente.vTerminal.bancoHw) + 1,
        length(vAssistente.vTerminal.bancoHw));
    end;
  end
  else
  begin
    Edit7.Text := Copy(vAssistente.vTerminal.bancoHw, 1, pos(':', vAssistente.vTerminal.bancoHw) -
      1);
    Edit6.Text := Copy(vAssistente.vTerminal.bancoHw, pos(':', vAssistente.vTerminal.bancoHw) + 1,
      length(vAssistente.vTerminal.bancoHw));
  end;
  if Pos(':', vAssistente.vTerminal.bancoFiscal) = 2 then
  begin
    Edit13.Text := '127.0.0.1';
    Edit14.Text := vAssistente.vTerminal.bancoFiscal;
  end
  else
  begin
    Edit13.Text := Copy(vAssistente.vTerminal.bancoFiscal, 1, pos(':',
      vAssistente.vTerminal.bancoFiscal) -
      1);
    Edit14.Text := Copy(vAssistente.vTerminal.bancoFiscal, pos(':',
      vAssistente.vTerminal.bancoFiscal) + 1,
      length(vAssistente.vTerminal.bancoFiscal));
  end;
  Edit8.Text := vAssistente.vRetaguarda.pathAutomacao;
  Edit9.Text := vAssistente.vRetaguarda.pathCxl;
  Edit10.Text := vAssistente.vRetaguarda.pathCaixa;

//  Edit1.Text := vAssistente.vConfig.clientePadrao;agora no banco
  Edit1.Text := 'Parametros do Sistema - Global';
  Edit1.Enabled := False;
  Edit1.Width := 300;
  Edit2.Text := vAssistente.vConfig.vendedorPadrao;
  Edit3.Text := vAssistente.vConfig.pastaRelatorios;
  if vAssistente.vConfig.vtipoConexao = 'off' then
    ComboBox1.ItemIndex := 1
  else
    ComboBox1.ItemIndex := 0;
  if vAssistente.vConfig.vSegundoPlano = 'S' then
    ComboBox2.ItemIndex := 0
  else
    ComboBox2.ItemIndex := 1;
  if cbBalanca.Items.IndexOf('Generico Hw via DLL') < 0 then cbBalanca.Items.Add('Generico Hw via DLL');
  //if cbBalanca.Items.IndexOf('Generico Hw') < then cbBalanca.Items.Add('Generico Hw');  
end;

procedure TfrmAssistemConfigFiscal.grandeTotalAvancarClick(Sender: TObject);
begin
  if not setDadosClasse then
    Exit;
  Label1.Caption := 'Finalizando Configuração';
  Label2.Caption := 'Sincronizar com o Terminais as novas informações';
  btAvancar.Caption := 'Concluir';
  btVoltar.OnClick := sincronizarVoltarClick;
  PageControl1.ActivePage := tsSicronizar;
  btAvancar.OnClick := concluirClick;
  vAssistente.getNumSerieRepetidos;
  setDadosFormulario;
end;

procedure TfrmAssistemConfigFiscal.grandeTotalVoltarClick(Sender: TObject);
begin
  Label1.Caption := 'Comandos do ECF';
  Label2.Caption := 'Configuração dos comandos compativeis com o modelo de ECF informado.';
  btVoltar.OnClick := comandosVoltarClick;
  PageControl1.ActivePage := tsComandos;
  btAvancar.OnClick := comandosAvancarClick;
  vAssistente.getDadosComandos;
//  setDadosFormulario;

//  Label1.Caption := 'Valor do Grande Total';
//  Label2.Caption := 'Informar o valor acumulado do ECF';
//  btVoltar.OnClick := grandeTotalVoltarClick;
//  PageControl1.ActivePage := tsGrandeTotal;
//  btAvancar.OnClick := grandeTotalAvancarClick;
end;

procedure TfrmAssistemConfigFiscal.ListBox1Enter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmAssistemConfigFiscal.Memo1Enter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmAssistemConfigFiscal.RadioButton2Click(Sender: TObject);
begin
  inherited;
  Panel2.Visible := RadioButton1.Checked;
  Panel4.Visible := RadioButton2.Checked;
  Panel4.Top := 56;
  Panel2.Top := 56;
  Panel4.Left := 24;
  Panel2.Left := 24;
end;

procedure TfrmAssistemConfigFiscal.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  Label9.Enabled := RadioGroup1.ItemIndex = 1;
  Edit7.Enabled := RadioGroup1.ItemIndex = 1;
end;

procedure TfrmAssistemConfigFiscal.retaguardaAvancarClick(Sender: TObject);
begin
  Label1.Caption := 'Configuração dos Terminais para Relatórios e Sincronização';
  Label2.Caption := 'Configurações de Sincronização das vendas do Terminal para o Retaguarda';
  btVoltar.OnClick := configVoltarClick;
  PageControl1.ActivePage := tsConfig;
  btAvancar.OnClick := configAvancarClick;
end;

procedure TfrmAssistemConfigFiscal.retaguardaVoltarClick(Sender: TObject);
begin
  Label1.Caption := 'Configuração do Terminal';
  Label2.Caption := 'Localização do Terminal e endereços do banco de dados';
  btVoltar.Enabled := True;
  btVoltar.OnClick := terminalVoltarClick;
  PageControl1.ActivePage := tsTerminal;
  btAvancar.OnClick := terminalAvancarClick;
end;

function TfrmAssistemConfigFiscal.selecionarDiretorio(diretorioInicial: string): string;
var
  S: string;
begin
  SelectDirectory('Selecionar Pasta', '', S);
  if Trim(S) = '' then
    Result := diretorioInicial
  else
    Result := S;
end;

function TfrmAssistemConfigFiscal.setDadosClasse: Boolean;
var
  I: Integer;
begin
  Result := true;
  vAssistente.vRetaguarda.pathAutomacao := Edit8.Text;
  vAssistente.vRetaguarda.pathCxl := Edit9.Text;
  vAssistente.vRetaguarda.pathCaixa := Edit10.Text;

//  vAssistente.vConfig.clientePadrao := Edit1.Text;agora no banco
  vAssistente.vConfig.vendedorPadrao := Edit2.Text;
  vAssistente.vConfig.vtipoConexao := ComboBox1.Text;
  vAssistente.vConfig.vSegundoPlano := ComboBox2.Text;

  if vLocal = 'config' then
  begin
    vAssistente.buscas.Close;
    vAssistente.buscas.Database := dtmAssistente.bdHw;
    vAssistente.buscas.Transaction := dtmAssistente.transHw;
    vAssistente.buscas.SQL.Text := 'select cod_vendedor from colaborador where' +
      ' cod_vendedor = ' + vAssistente.vConfig.vendedorPadrao +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    try
      vAssistente.buscas.Open;
    except
    end;
    if vAssistente.buscas.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('Vendedor padrão não encontrado', 'Atenção', 0 + 64);
      Exit;
    end;

    vAssistente.buscas.Close;
    vAssistente.buscas.Database := dtmAssistente.bdHw;
    vAssistente.buscas.Transaction := dtmAssistente.transHw;
    vAssistente.buscas.SQL.Text := 'select cod_cliente from clientes where' +
      ' cod_cliente = ' + vAssistente.vConfig.clientePadrao +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    try
      vAssistente.buscas.Open;
    except
    end;
    if vAssistente.buscas.IsEmpty then
    begin
      Result := False;
      Application.MessageBox('Cliente padrão não encontrado', 'Atenção', 0 + 64);
      Exit;
    end;
  end;

  vAssistente.vConfig.pastaRelatorios := Edit3.Text;

  if RadioButton1.Checked then
  begin
    if ckSegundoPlano.Checked then
      vAssistente.vTerminal.terminalFiscal := 'S'
    else
      vAssistente.vTerminal.terminalFiscal := 'N';
    vAssistente.vTerminal.bancoFiscal := Edit4.Text;
    vAssistente.vTerminal.bancoHWF := Edit5.Text;
    vAssistente.vTerminal.bancoHw := Edit7.Text + ':' + Edit6.Text;
  end
  else
  begin
    vAssistente.vTerminal.terminalFiscal := 'N';
    vAssistente.vTerminal.bancoFiscal := Edit13.Text + ':' + Edit14.Text;
  end;

  vAssistente.vECF.modeloImpressora := cbImp.Text;
  vAssistente.vECF.numSerie := edECF.Text;
  vAssistente.vECF.numEquipamento := edNumEquip.Text;
  vAssistente.vECF.contadorReinicio := spContRei.Value;
  vAssistente.vECF.porta := spPorta.Value;
	vAssistente.vECF.modeloDocFiscal := edModDocFiscal.Text;
	vAssistente.vECF.impDavECF := Trim(edImpDavECF.Text);
  vAssistente.vECF.codTerminal := spCodTerminal.Value;
  vAssistente.vECF.qtdeDigDAV := spQtdeDigDAV.Value;
  vAssistente.vECF.maxDescItem := edDescItem.Valor;
  vAssistente.vECF.qtdeViasCPNF := spQtdeViasCPnaoF.Value;
  vAssistente.vECF.modelOBalanca := cbBalanca.Text;
  vAssistente.vECF.obsCupom := edObs.Text;
  vAssistente.vECF.EnderecoHwf := edEnderecoHwF.Text;
  vAssistente.vECF.portaLeitor := spPortaLeitor.Value;

  vAssistente.vECF.diaAberto := edDataMovimento.Text;
  vAssistente.vECF.diaFechado := edDataReducao.Text;

  vAssistente.vECF.vListaTabPreco.Text := ListBox4.Items.Text;

  if vLocal = 'ecf' then
  begin
    try
      StrToDate(vAssistente.vECF.diaAberto);
    except
      Result := False;
      Application.MessageBox('Dia aberto deve ser preenchido', 'Atenção', 0 + 64);
      Exit;
    end;

    try
      StrToDate(vAssistente.vECF.diaFechado);
    except
      Result := False;
      Application.MessageBox('Dia fechado deve ser preenchido', 'Atenção', 0 + 64);
      Exit;
    end;
  end;

  vAssistente.vECF.valorGrandeTotal := trim(Format('%18.2f', [ edGrandeTotal.Valor]));
  if ckAbrirGaveta.Checked then
    vAssistente.vECF.abrirGaveta := 'S'
  else vAssistente.vECF.abrirGaveta := 'N';
  if ckPoPreco.Checked then
    vAssistente.vECF.politicaPreco := 'S'
  else vAssistente.vECF.politicaPreco := 'N';
  vAssistente.vECF.vUsarTEF := copy(cbTEF.Text,1,1);
  if ckUsarCodBarra.Checked then
    vAssistente.vECF.UsarCodBarra := 'S'
  else vAssistente.vECF.UsarCodBarra := 'N';
  if ck3DigVrUnit.Checked then
    vAssistente.vECF.TresDigVlUnit := 'S'
	else vAssistente.vECF.TresDigVlUnit := 'N';
	if ckMovimentoOperador.Checked then
		vAssistente.vECF.MovOperador := 'S'
  else vAssistente.vECF.MovOperador := 'N';
  if ckVerifPapel.Checked then
    vAssistente.vECF.verificarPapel := 'S'
  else vAssistente.vECF.verificarPapel := 'N';
  if ckTecladoPDV.Checked then
    vAssistente.vECF.tecladoPDV := 'S'
  else vAssistente.vECF.tecladoPDV := 'N';
  if ckSupermercado.Checked then
    vAssistente.vECF.supermercado := 'S'
  else vAssistente.vECF.supermercado := 'N';
  if ckConfEst.Checked then
    vAssistente.vECF.COnferirEstoque := 'S'
  else vAssistente.vECF.COnferirEstoque := 'N';
  if ckLeitorSerial.Checked then
    vAssistente.vECF.usarLeitor := 'S'
  else vAssistente.vECF.usarLeitor := 'N';
  if rbArred.Checked then
    vAssistente.vECF.arredondarTruncar := 'A';
  if rbTrnc.Checked then
    vAssistente.vECF.arredondarTruncar := 'T';

  for I := 1 to 99 do
  begin
    vAssistente.vFinalizador.codigo[i] := 0;
    vAssistente.vFinalizador.descricao[i] := '';
    vAssistente.vFinalizador.tecla[i] := 0;
    vAssistente.vFinalizador.tipo[i] := 0;
    vAssistente.vFinalizador.verificarDeb[i] := '';
    vAssistente.vFinalizador.verificarCred[i] := '';

    if FindComponent('edCodF' + IntToStr(i)) <> nil then
    begin
      if (Trim(TEdit(FindComponent('edCodF' + IntToStr(i))).Text) <> '') and
        (Trim(TEdit(FindComponent('edFinal' + IntToStr(i))).Text) <> '') then
      begin
        vAssistente.vFinalizador.descricao[i] := TEdit(FindComponent('edFinal' + IntToStr(i))).Text;
        try
          vAssistente.vFinalizador.codigo[i] := StrToInt(TEdit(FindComponent('edCodF' +
            IntToStr(i))).Text);
          if Trim(TEdit(FindComponent('edTecla' + IntToStr(i))).Text) = '' then
            vAssistente.vFinalizador.tecla[i] := 0
          else
            vAssistente.vFinalizador.tecla[i] := StrToInt(TEdit(FindComponent('edTecla' +
              IntToStr(i))).Text);
          if Trim(TEdit(FindComponent('edTipo' + IntToStr(i))).Text) = '' then

            vAssistente.vFinalizador.tipo[i] := 0
          else
            vAssistente.vFinalizador.tipo[i] := StrToInt(TEdit(FindComponent('edTipo' +
              IntToStr(i))).Text);
        except
          Result := false;
          Application.MessageBox('Erro de Conversão. Campo numérico.', 'Atenção', MB_OK +
            MB_ICONEXCLAMATION);
          Exit;
        end;
        if TCheckBox(FindComponent('ckDeb' + IntToStr(i))).Checked then
          vAssistente.vFinalizador.verificarDeb[i] := 'S'
        else vAssistente.vFinalizador.verificarDeb[i] := 'N';
        if TCheckBox(FindComponent('ckCred' + IntToStr(i))).Checked then
          vAssistente.vFinalizador.verificarCred[i] := 'S'
        else vAssistente.vFinalizador.verificarCred[i] := 'N';
        if TCheckBox(FindComponent('ckParc' + IntToStr(i))).Checked then
          vAssistente.vFinalizador.parcelar[i] := 'S'
        else vAssistente.vFinalizador.parcelar[i] := 'N';
      end;
    end;
  end;

  for I := 1 to 99 do
  begin
    vAssistente.vTotalizador.codigo[i] := 0;
    vAssistente.vTotalizador.descricao[i] := '';

    if FindComponent('edCodT' + IntToStr(i)) <> nil then
    begin
      if (Trim(TEdit(FindComponent('edCodT' + IntToStr(i))).Text) <> '') and
        (Trim(TEdit(FindComponent('edTot' + IntToStr(i))).Text) <> '') then
      begin
        try
          vAssistente.vTotalizador.codigo[i] := StrToInt(TEdit(FindComponent('edCodT' +
            IntToStr(i))).Text);
        except
          Result := false;
          Application.MessageBox('Erro de Conversão. Campo numérico.', 'Atenção', MB_OK +
            MB_ICONEXCLAMATION);
          Exit;
        end;
        vAssistente.vTotalizador.descricao[i] := TEdit(FindComponent('edTot' + IntToStr(i))).Text;
      end;
    end;
  end;
  if DBLookupComboBox1.KeyValue <> null then
    vAssistente.vTerminais.CNIEE := DBLookupComboBox1.KeyValue;
  vAssistente.vTerminais.mfAdicional := Edit15.Text;
  vAssistente.vTerminais.dataSB := MaskEdit1.Text;
  vAssistente.vTerminais.horaSB := MaskEdit2.Text;
  vAssistente.vTerminais.codigoProprietario := Edit16.Text;
  if ckDescISSQN.Checked then
    vAssistente.vTerminais.descontoISSQN := 'S'
  else vAssistente.vTerminais.descontoISSQN := 'N';

  for I := 1 to 10 do
    if TCheckBox(FindComponent('ck' + IntToStr(i))).Checked then
      vAssistente.vComandos.vComando[i] := 'S'
    else
      vAssistente.vComandos.vComando[i] := 'N';
  for I := 0 to High(vAssistente.vNumSerieRepetidos) do
    if CheckListBox1.Checked[I] then
      vAssistente.vApagarDadosRepetidos[i] := 'S'
    else
      vAssistente.vApagarDadosRepetidos[i] := 'N';
  vLocal := '';
end;

procedure TfrmAssistemConfigFiscal.setDadosFormulario;
var
  I: Integer;
begin
  Edit8.Text := vAssistente.vRetaguarda.pathAutomacao;
  Edit9.Text := vAssistente.vRetaguarda.pathCxl;
  Edit10.Text := vAssistente.vRetaguarda.pathCaixa;

//  Edit1.Text := vAssistente.vConfig.clientePadrao;agora no banco
  Edit1.Text := 'Parametros do Sistema - Global';
  Edit1.Enabled := False;
  Edit1.Width := 300;
  Edit2.Text := vAssistente.vConfig.vendedorPadrao;
  Edit3.Text := vAssistente.vConfig.pastaRelatorios;

  cbImp.Text := vAssistente.vECF.modeloImpressora;
  edECF.Text := vAssistente.vECF.numSerie;
  edNumEquip.Text := vAssistente.vECF.numEquipamento;
  spContRei.Value := vAssistente.vECF.contadorReinicio;
  spPorta.Value := vAssistente.vECF.porta;
	edModDocFiscal.Text := vAssistente.vECF.modeloDocFiscal;
	edImpDavECF.Text := Trim(vAssistente.vECF.impDavECF);
  spCodTerminal.Value := vAssistente.vECF.codTerminal;
  spQtdeDigDAV.Value := vAssistente.vECF.qtdeDigDAV;
  edDescItem.Valor := vAssistente.vECF.maxDescItem;
  spQtdeViasCPnaoF.Value := vAssistente.vECF.qtdeViasCPNF;
  cbBalanca.Text := vAssistente.vECF.modelOBalanca;
  edObs.Text := vAssistente.vECF.obsCupom;
  edEnderecoHwF.Text := vAssistente.vECF.EnderecoHwf;
  spPortaLeitor.Value := vAssistente.vECF.portaLeitor;
  edDataMovimento.Text := vAssistente.vECF.diaAberto;
  edDataReducao.Text := vAssistente.vECF.diaFechado;
  ckAbrirGaveta.Checked := vAssistente.vECF.abrirGaveta = 'S';
  ckPoPreco.Checked := vAssistente.vECF.politicaPreco = 'S';
  cbTEF.Text := vAssistente.vECF.vUsarTEF;
  ckUsarCodBarra.Checked := vAssistente.vECF.UsarCodBarra = 'S';
  ck3DigVrUnit.Checked := vAssistente.vECF.TresDigVlUnit = 'S';
	ckMovimentoOperador.Checked := vAssistente.vECF.MovOperador = 'S';
  ckVerifPapel.Checked := vAssistente.vECF.verificarPapel = 'S';
  ckTecladoPDV.Checked := vAssistente.vECF.tecladoPDV = 'S';
  ckSupermercado.Checked := vAssistente.vECF.supermercado = 'S';
  ckConfEst.Checked := vAssistente.vECF.COnferirEstoque = 'S';
  ckLeitorSerial.Checked := vAssistente.vECF.usarLeitor = 'S';
  rbArred.Checked := vAssistente.vECF.arredondarTruncar = 'A';
  rbTrnc.Checked := vAssistente.vECF.arredondarTruncar = 'T';
  edDataMovimento.Text := vAssistente.vECF.diaAberto;
  edDataReducao.Text := vAssistente.vECF.diaFechado;
  edGrandeTotal.Valor := StrToFloat(vAssistente.vECF.valorGrandeTotal);
  ListBox4.Items.Text := vAssistente.vECF.vListaTabPreco.Text;

  for I := 1 to 99 do
  begin

    if vAssistente.vFinalizador.codigo[i] <> 0 then
    begin
      if FindComponent('edCodF' + IntToStr(i)) = nil then
      begin
        criaComponente('EF', 'edCodF' + IntToStr(i), '',
          IntToStr(vAssistente.vFinalizador.codigo[i]), i, 32, 33);
        criaComponente('EF', 'edFinal' + IntToStr(i), '', vAssistente.vFinalizador.descricao[i], i,
          70, 121);
        criaComponente('EF', 'edTecla' + IntToStr(i), '',
          IntToStr(vAssistente.vFinalizador.tecla[i]), i, 197, 33);
        criaComponente('EF', 'edTipo' + IntToStr(i), '', IntToStr(vAssistente.vFinalizador.tipo[i]),
          i, 236, 33);
        criaComponente('CF', 'ckDeb' + IntToStr(i), 'Verificar Débito',
          vAssistente.vFinalizador.verificarDeb[i], i, 274, 97);
        criaComponente('CF', 'ckCred' + IntToStr(i), 'Verificar Crédito',
          vAssistente.vFinalizador.verificarCred[i], i, 372, 97);
        criaComponente('CF', 'ckParc' + IntToStr(i), 'Parcelar',
          vAssistente.vFinalizador.parcelar[i], i, 472, 58);
      end
      else
      begin
        TEdit(FindComponent('edCodF' + IntToStr(i))).Text :=
          IntToStr(vAssistente.vFinalizador.codigo[i]);
        TEdit(FindComponent('edFinal' + IntToStr(i))).Text := vAssistente.vFinalizador.descricao[i];
        TEdit(FindComponent('edTecla' + IntToStr(i))).Text :=
          IntToStr(vAssistente.vFinalizador.tecla[i]);
        TEdit(FindComponent('edTipo' + IntToStr(i))).Text :=
          IntToStr(vAssistente.vFinalizador.tipo[i]);
        TCheckBox(FindComponent('ckDeb' + IntToStr(i))).Checked :=
          vAssistente.vFinalizador.verificarDeb[i] = 'S';
        TCheckBox(FindComponent('ckCred' + IntToStr(i))).Checked :=
          vAssistente.vFinalizador.verificarCred[i] = 'S';
        TCheckBox(FindComponent('ckParc' + IntToStr(i))).Checked :=
          vAssistente.vFinalizador.parcelar[i] = 'S';
      end;

    end
    else
    begin
      if FindComponent('edCodF' + IntToStr(i)) <> nil then
      begin
        TEdit(FindComponent('edCodF' + IntToStr(i))).Clear;
        TEdit(FindComponent('edFinal' + IntToStr(i))).Clear;
        TEdit(FindComponent('edTecla' + IntToStr(i))).Clear;
        TEdit(FindComponent('edTipo' + IntToStr(i))).Clear;
        TCheckBox(FindComponent('ckDeb' + IntToStr(i))).Checked := False;
        TCheckBox(FindComponent('ckCred' + IntToStr(i))).Checked := False;
        TCheckBox(FindComponent('ckParc' + IntToStr(i))).Checked := False;
      end;
    end;
  end;

  for I := 1 to 99 do
  begin
    if vAssistente.vTotalizador.codigo[i] <> 0 then
    begin
      if FindComponent('edCodT' + IntToStr(i)) = nil then
      begin
        criaComponente('ET', 'edCodT' + IntToStr(i), '',
          IntToStr(vAssistente.vTotalizador.codigo[i]), i, 32, 41);
        criaComponente('ET', 'edTot' + IntToStr(i), '', vAssistente.vTotalizador.descricao[i], i,
          79, 121);
      end
      else
      begin
        TEdit(FindComponent('edCodT' + IntToStr(i))).Text :=
          IntToStr(vAssistente.vTotalizador.codigo[i]);
        TEdit(FindComponent('edTot' + IntToStr(i))).Text := vAssistente.vTotalizador.descricao[i];
      end;
    end
    else
    begin
      if FindComponent('edCodT' + IntToStr(i)) <> nil then
      begin
        TEdit(FindComponent('edCodT' + IntToStr(i))).Text := '';
        TEdit(FindComponent('edTot' + IntToStr(i))).Text := '';
      end;
    end;
  end;
  DBLookupComboBox1.KeyValue := vAssistente.vTerminais.CNIEE;
  Edit15.Text := vAssistente.vTerminais.mfAdicional;
  MaskEdit1.Text := vAssistente.vTerminais.dataSB;
  MaskEdit2.Text := vAssistente.vTerminais.horaSB;
  Edit16.Text := vAssistente.vTerminais.codigoProprietario;
  ckDescISSQN.Checked := vAssistente.vTerminais.descontoISSQN = 'S';


  for I := 1 to 10 do
    TCheckBox(FindComponent('ck' + IntToStr(i))).Checked := vAssistente.vComandos.vComando[i] = 'S';

  CheckListBox1.Clear;
  for I := 0 to High(vAssistente.vNumSerieRepetidos) do
    CheckListBox1.Items.Add(
      vDadosIni.StrZero(vAssistente.vCodTerminalRepetidos[I], 3) + ' ' +
      vAssistente.vNumSerieRepetidos[I] + ' ' + vAssistente.vLocalRepetidos[I]);

end;

procedure TfrmAssistemConfigFiscal.sincronizarVoltarClick(Sender: TObject);
begin
  Label1.Caption := 'Comandos do ECF';
  Label2.Caption := 'Configuração dos comandos compativeis com o modelo de ECF informado.';
  btVoltar.OnClick := comandosVoltarClick;
  PageControl1.ActivePage := tsComandos;
  btAvancar.OnClick := comandosAvancarClick;
  btAvancar.Caption := 'Avançar >>';
end;

procedure TfrmAssistemConfigFiscal.SpeedButton10Click(Sender: TObject);
//var
//  vImpCNIEE: TImpressoras_CNIEE;
begin
  inherited;
  //vImpCNIEE.CadImpressoras(1);
end;

procedure TfrmAssistemConfigFiscal.SpeedButton11Click(Sender: TObject);
begin
  inherited;
//  DBLookupComboBox1.ListSource.DataSet.Refresh;//  vAssistente.vImpCNIEE.Refresh;
vAssistente.vImpCNIEE.Close;
//  vAssistente.vImpCNIEE.SQL.Text := 'select * from IMPRESSORAS_CNIEE';
  vAssistente.vImpCNIEE.Open;
end;

procedure TfrmAssistemConfigFiscal.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if ListBox4.ItemIndex > -1 then
    ListBox4.DeleteSelected;

  vAssistente.vECF.vListaTabPreco.Text := ListBox4.Items.Text;
end;

procedure TfrmAssistemConfigFiscal.SpeedButton1Click(Sender: TObject);
begin
  inherited;
Edit3.Text := selecionarDiretorio(Edit3.Text);
end;

procedure TfrmAssistemConfigFiscal.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if ListBox3.ItemIndex > -1 then
    ListBox3.ItemIndex := 0;
  vDadosIni.abreForm('Tabelas de preço adicional', pnPrecoAdicional, []);
end;

procedure TfrmAssistemConfigFiscal.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if ListBox3.ItemIndex > -1 then
    vAssistente.vECF.vListaTabPreco.Add(ListBox3.Items[ListBox3.ItemIndex]);

  ListBox4.Items.Text := vAssistente.vECF.vListaTabPreco.Text;
end;

procedure TfrmAssistemConfigFiscal.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Edit4.Text := selecionarDiretorio(Edit4.Text);
end;

procedure TfrmAssistemConfigFiscal.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  Edit5.Text := selecionarDiretorio(Edit5.Text);
end;

procedure TfrmAssistemConfigFiscal.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  Edit8.Text := selecionarDiretorio(Edit8.Text);
end;

procedure TfrmAssistemConfigFiscal.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  Edit9.Text := selecionarDiretorio(Edit9.Text);
end;

procedure TfrmAssistemConfigFiscal.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  Edit10.Text := selecionarDiretorio(Edit10.Text);
end;

procedure TfrmAssistemConfigFiscal.terminaisAvancarClick(Sender: TObject);
begin
  if not setDadosClasse then
    Exit;
  Label1.Caption := 'Comandos do ECF';
  Label2.Caption := 'Configuração dos comandos compativeis com o modelo de ECF informado.';
  btVoltar.OnClick := comandosVoltarClick;
  PageControl1.ActivePage := tsComandos;
  btAvancar.OnClick := comandosAvancarClick;
  vAssistente.getDadosComandos;
  setDadosFormulario;
end;

procedure TfrmAssistemConfigFiscal.terminaisVoltarClick(Sender: TObject);
begin
  Label1.Caption := 'Dados dos Totalizadores Não Fiscais';
  Label2.Caption := 'Configurações para os totalizadores não fiscais.';
  btVoltar.OnClick := totalizadoresVoltarClick;
  PageControl1.ActivePage := tsTotalizadores;
  btAvancar.OnClick := totalizadoresAvancarClick;
end;

procedure TfrmAssistemConfigFiscal.terminalAvancarClick(Sender: TObject);
begin
  if not setDadosClasse  then
    Exit;
  
  if not vAssistente.validaBancos then
    exit;

  Label1.Caption := 'Configuração dos Sistemas de Retaguarda';
  Label2.Caption := 'Localização dos Sistemas de Retaguarda para configuração do Terminal';
  btVoltar.OnClick := retaguardaVoltarClick;
  PageControl1.ActivePage := tsRetaguarda;
  btAvancar.OnClick := retaguardaAvancarClick;
end;

procedure TfrmAssistemConfigFiscal.terminalVoltarClick(Sender: TObject);
begin
  btVoltar.Enabled := false;
  PageControl1.ActivePage := tsBemVindo;
  btAvancar.OnClick := bemVindoAvancarClick;
  Label1.Caption := 'Assistente de Configuração PAF-ECF';
  Label2.Caption := '';
end;

procedure TfrmAssistemConfigFiscal.totalizadoresAvancarClick(Sender: TObject);
begin
  if not setDadosClasse then
    Exit;
  Label1.Caption := 'Dados do Terminal';
  Label2.Caption := 'Configurações adicionais usadas nos Arquivos Fiscais.';
  btVoltar.OnClick := terminaisVoltarClick;
  PageControl1.ActivePage := tsTerminais;
  btAvancar.OnClick := terminaisAvancarClick;
  vAssistente.getDadosTerminais;
  setDadosFormulario;
end;

procedure TfrmAssistemConfigFiscal.totalizadoresVoltarClick(Sender: TObject);
begin
  Label1.Caption := 'Finalizadores de Cupom Fiscal';
  Label2.Caption :=
    'Configurar os finalizadores do equipamento ECF. Exemplo: Dinheiro, Cartão, etc.';
  btVoltar.OnClick := finalizadoresVoltarClick;
  PageControl1.ActivePage := tsFinal;
  btAvancar.OnClick := finalizadoresAvancarClick;
end;

end.

