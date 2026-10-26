unit uCadMovVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, UClassesVeiculosCCIA, UClassesClientes;

type
  TfrmEstMotosCCIA = class(TfrmCadPadraoM)
    TabSheet_Dados: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Panel10: TPanel;
    Label33: TLabel;
    Label37: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label34: TLabel;
    Label75: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label92: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label70: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit31: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit43: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    DBComboBox3: TDBComboBox;
    Panel11: TPanel;
    TabSheet_Pendencias: TTabSheet;
    ScrollBox7: TScrollBox;
    GroupBox12: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    DBEdit_Data_Pendencia: TDBEdit;
    DBLookupComboBox_Assunto_Pendencia: TDBLookupComboBox;
    DBEdit_Descricao_Pendencia: TDBEdit;
    DBEdit_Assunto_Pendencia: TDBEdit;
    GroupBox13: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    DBEdit_DataPrevista_Pendencia: TDBEdit;
    DBLookupComboBox_Funcionario_Pendencia: TDBLookupComboBox;
    DBEdit_Valor_Pendencia: TDBEdit;
    DBComboBox_Status_Pendencia: TDBComboBox;
    GroupBox17: TGroupBox;
    Label61: TLabel;
    DBEdit_SomaTotalPendencia: TDBEdit;
    BitBtn_Novo_Pendencia: TBitBtn;
    BitBtn_Alterar_Pendencia: TBitBtn;
    BitBtn_Salvar_Pendencia: TBitBtn;
    BitBtn_Cancelar_Pendencia: TBitBtn;
    BitBtn_Excluir_Pendencia: TBitBtn;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    DBLookupComboBox_Usuario_Pendencia: TDBLookupComboBox;
    TabSheet_Despesas: TTabSheet;
    ScrollBox8: TScrollBox;
    GroupBox14: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label32: TLabel;
    DBEdit_Valor_Despesa: TDBEdit;
    DBEdit_DataVencimento_Despesa: TDBEdit;
    DBEdit_Controle_Despesa: TDBEdit;
    DBEdit_N_CH_Despesa: TDBEdit;
    DBMemo_Despesa_Despesa: TDBMemo;
    DBComboBox_Status_Despesa: TDBComboBox;
    GroupBox15: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    Label7: TLabel;
    DBEdit_Data_Despesa: TDBEdit;
    DBLookupComboBox_Fornecedor_Despesa: TDBLookupComboBox;
    DBLookupComboBox_Assunto_Despesa: TDBLookupComboBox;
    DBEdit_Assunto_Despesa: TDBEdit;
    DBEdit_Fornecedor_Despesa: TDBEdit;
    GroupBox18: TGroupBox;
    Label62: TLabel;
    BitBtn_Alterar_Despesa: TBitBtn;
    BitBtn_Cancelar_Despesa: TBitBtn;
    BitBtn_Excluir_Despesa: TBitBtn;
    BitBtn_Salvar_Despesa: TBitBtn;
    DBEdit_SomaTotalDespesa: TDBEdit;
    Panel6: TPanel;
    DBGrid4: TDBGrid;
    Panel9: TPanel;
    Label57: TLabel;
    DBLookupComboBox12: TDBLookupComboBox;
    TabSheet_Notas: TTabSheet;
    ScrollBox9: TScrollBox;
    GroupBox7: TGroupBox;
    BitBtn29: TBitBtn;
    GroupBox8: TGroupBox;
    DBGrid5: TDBGrid;
    GroupBox9: TGroupBox;
    DBGrid6: TDBGrid;
    TabSheet_Oficina: TTabSheet;
    ScrollBox10: TScrollBox;
    GroupBox6: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    groupAvancadas: TGroupBox;
    TabSheet_Contratos: TTabSheet;
    ScrollBox6: TScrollBox;
    GroupBox5: TGroupBox;
    DBGrid8: TDBGrid;
    BitBtn13: TBitBtn;
    BitBtn16: TBitBtn;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    GroupBox23: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn12: TBitBtn;
    Panel13: TPanel;
    DBGrid9: TDBGrid;
    TabSheet7: TTabSheet;
    GroupBox24: TGroupBox;
    Label71: TLabel;
    DBText2: TDBText;
    BitBtn11: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Panel12: TPanel;
    DBGrid7: TDBGrid;
    Label8: TLabel;
    Label63: TLabel;
    Label9: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    BitBtn_Novo_Despesa: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBComboBox1: TDBComboBox;
    Label12: TLabel;
    groupAdicional: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    GroupBox28: TGroupBox;
    ckTransfDep: TCheckBox;
    ckDemons: TCheckBox;
    ckTransito: TCheckBox;
    ckReserva: TCheckBox;
    GroupBox21: TGroupBox;
    ckNovo: TCheckBox;
    ckComEstoque: TCheckBox;
    ckSemEstoque: TCheckBox;
    ckUsado: TCheckBox;
    ckEstReal: TCheckBox;
    ckCons: TCheckBox;
    ckInter: TCheckBox;
    tsReserva: TTabSheet;
    pnReserva: TPanel;
    Memo1: TMemo;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    DBLookupComboBox10: TDBLookupComboBox;
    Label18: TLabel;
    Label20: TLabel;
    DBComboBox4: TDBComboBox;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    DBMemo1: TDBMemo;
    Label22: TLabel;
    BitBtn19: TBitBtn;
    DBEdit7: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit9: TDBEdit;
    BitBtn20: TBitBtn;
    Label25: TLabel;
    DBEdit10: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit12: TDBEdit;
    Label28: TLabel;
    DBEdit13: TDBEdit;
    ckUsadoTroca: TCheckBox;
    DBEdit15: TDBEdit;
    Label29: TLabel;
    Label30: TLabel;
    DBComboBox5: TDBComboBox;
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure groupAdicionalExit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit31KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit_Fornecedor_DespesaExit(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit31Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl3Change(Sender: TObject);
    procedure DBEdit_Assunto_DespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_Assunto_PendenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_Fornecedor_DespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn_Excluir_DespesaClick(Sender: TObject);
    procedure BitBtn_Cancelar_DespesaClick(Sender: TObject);
    procedure BitBtn_Salvar_DespesaClick(Sender: TObject);
    procedure BitBtn_Alterar_DespesaClick(Sender: TObject);
    procedure BitBtn_Novo_DespesaClick(Sender: TObject);
    procedure BitBtn_Excluir_PendenciaClick(Sender: TObject);
    procedure BitBtn_Cancelar_PendenciaClick(Sender: TObject);
    procedure BitBtn_Salvar_PendenciaClick(Sender: TObject);
    procedure BitBtn_Alterar_PendenciaClick(Sender: TObject);
    procedure BitBtn_Novo_PendenciaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function _mdiAberto(pNomeFormMDI: string): Boolean;
    function _atualizarCombobox: Boolean;
  private
    function _SomarValoresGridPendencia(): Double;
    function _SomarValoresGridDespesa(): Double;
    procedure _HabilitarCamposPendencia;
    procedure _HabilitarCamposDespesa;
    procedure _DesabilitarCamposPendencia;
    procedure _DesabilitarCamposDespesa;
    procedure _buscarInfModelo;
    procedure _DesabilitaCampos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstMotosCCIA: TfrmEstMotosCCIA;
  EstMoto: TEstMotoCCIA;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;

implementation

uses
  uDtmAtivo, UDtmVeiculosCCIA, DBClient, ConsultasU, DB, UClassesCadastrosBasicos;

{$R *.dfm}

procedure TfrmEstMotosCCIA.BitBtn17Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VEI063', 'CONFIRMAR RESERVA', '', 'EST_MOTO', '', EstMoto.buscas, true) then
    exit;

  if not EstMoto.SalvarReserva then
  begin
   setFocusCampoErro(EstMoto.vNomeCampoErro, EstMoto.vMensagemErro);
   exit;
  end;
  inherited;
  TForm(pnReserva.Parent).ModalResult := IDOK;
end;

procedure TfrmEstMotosCCIA.BitBtn18Click(Sender: TObject);
begin
  TForm(pnReserva.Parent).ModalResult := IDCANCEL;
  EstMoto.Cancel;
  EstMoto.RollBackTransacao;
end;

procedure TfrmEstMotosCCIA.BitBtn19Click(Sender: TObject);
begin
   inherited;
   if not vDadosIni.PesqPros('VEI064', 'RETIRAR RESERVA', '', 'EST_MOTO', '', EstMoto.buscas, true) then
    exit;

   if not EstMoto.RetirarReserva then
     exit;
   inherited;  
   TForm(pnReserva.Parent).ModalResult := IDOK;
end;

procedure TfrmEstMotosCCIA.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('VEI058', 'CONSULTA', '', 'EST_MOTO', '',
      EstMoto.buscas, true) then
      Exit;
    EstMoto.vCons.campo := ComboBox1.Text;
    EstMoto.vCons.ordem := ComboBox2.Text;
    EstMoto.vCons.condicao := ComboBox3.Text;
    EstMoto.vCons.valor := MaskEdit3.Text;
    EstMoto.vCons.dataIni := MaskEdit1.Text;
    EstMoto.vCons.dataFim := MaskEdit2.Text;
    EstMoto.vCons.porData := MaskEdit1.Visible;

    EstMoto.vCons.avancada := CheckBox3.Checked;
    EstMoto.vCons.adicional := CheckBox1.Checked;

    EstMoto.vCons.novo := ckNovo.Checked;
    EstMoto.vCons.usado := ckUsado.Checked;
    EstMoto.vCons.comEstoque := ckComEstoque.Checked;
    EstMoto.vCons.semEstoque := ckSemEstoque.Checked;
    EstMoto.vCons.EstoqueReal := ckEstReal.Checked;
    EstMoto.vCons.Consignado := ckCons.Checked;
    EstMoto.vCons.Intermediacao := ckInter.Checked;
    EstMoto.vCons.transfdeposito := ckTransfDep.Checked;
    EstMoto.vCons.demonstracao := ckDemons.Checked;
    EstMoto.vCons.reserva := ckReserva.Checked;
    EstMoto.vCons.usadotroca:= ckUsadoTroca.Checked;

    EstMoto.vCons.campoAd := ComboBox11.Text;
    EstMoto.vCons.valorAd := MaskEdit7.Text;
    EstMoto.vCons.dataIniAd := MaskEdit9.Text;
    EstMoto.vCons.dataFimAd := MaskEdit8.Text;
    EstMoto.vCons.condicaoAd := ComboBox12.Text;
    EstMoto.vCons.porDataAd := MaskEdit9.Visible;

    EstMoto.consulta;
    DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('VEI059', 'ALTERAR', '', 'VEICULOS', '', EstMoto.buscas, true) then
  begin
    if not EstMoto.Insert then
      exit;

    inherited;
    ComboBox4.Text := '';
    ComboBox5.Text := '';
    DBComboBox1.Field.AsString := '';
    TabSheet3.TabVisible := false;
    TabSheet_Dados.TabVisible := true;
    TabSheet_Contratos.TabVisible := true;
    TabSheet_Pendencias.TabVisible := true;
    TabSheet_Despesas.TabVisible := true;
    TabSheet_Notas.TabVisible := true;
    TabSheet_Oficina.TabVisible := true;
    PageControl3.ActivePage := TabSheet_Dados;
    TabSheet_Dados.Show;

    if DBComboBox3.CanFocus then
      DBComboBox3.SetFocus;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn4Click(Sender: TObject);
begin
  BitBtn4.SetFocus;
  if not vDadosIni.PesqPros('VEI061', 'CONFIRMAR INCLUSÃO', '', 'EST_MOTO', '', EstMoto.buscas, true) then
    exit;
  try
    Screen.Cursor := crHourGlass;

    if trim(DBComboBox1.Text) = 'COMANDO FATURAMENTO' then
      EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString := 'CFT'
    else if trim(DBComboBox1.Text) = 'CONTRATO VENDA' then
      EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString := 'CTRVND'
    else if trim(DBComboBox1.Text) = 'CONTRATO VENDA CONSIGNADO' then
      EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString := 'CTRVNDCONS'
    else if trim(DBComboBox1.Text) = 'CONTRATO RESERVA DOMINIO' then
      EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString := 'CTRRESDOM'
    else if trim(DBComboBox1.Text) = 'CONTRATO INTERMEDIACAO' then
      EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString := 'CTRINTERM';

    if not EstMoto.Post then
      setFocusCampoErro(EstMoto.vNomeCampoErro, EstMoto.vMensagemErro)
    else
    begin
      if TelaCadastro = 1 then
      begin
        BitBtn6.Click;
        Exit;
      end;
      if CheckCadSeq.Checked then
      begin
        if EstMoto.Insert then
          DBComboBox3.SetFocus;
        MudaCor;
      end
      else
        inherited;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn5Click(Sender: TObject);
begin
  EstMoto.Cancel;
  EstMoto.RollBackTransacao;
  inherited;
end;

procedure TfrmEstMotosCCIA.BitBtn_Alterar_DespesaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI028', 'EDITAR', '', 'VEICULOS',
    EstMoto.dataSet.FieldByName('CODIGO').AsString, EstMoto.buscas, true) then
    Exit;
  if EstMoto.vDespesaVeic.Edit then
  begin
    _HabilitarCamposDespesa;
    if DBEdit_Assunto_Despesa.CanFocus then
      DBEdit_Assunto_Despesa.SetFocus;
  end;

end;

procedure TfrmEstMotosCCIA.BitBtn_Alterar_PendenciaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI021', 'EDITAR', '', 'VEICULOS',
    EstMoto.dataSet.FieldByName('CODIGO').AsString, EstMoto.buscas, true) then
    Exit;
  if EstMoto.vPendenciaVeic.Edit then
  begin
    _HabilitarCamposPendencia;
    if DBEdit_Assunto_Pendencia.CanFocus then
      DBEdit_Assunto_Pendencia.SetFocus;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn_Cancelar_DespesaClick(Sender: TObject);
begin
  inherited;
  EstMoto.vDespesaVeic.Cancel;
  _DesabilitarCamposDespesa;
end;

procedure TfrmEstMotosCCIA.BitBtn_Cancelar_PendenciaClick(Sender: TObject);
begin
  inherited;
  EstMoto.vPendenciaVeic.Cancel;
  _DesabilitarCamposPendencia;
end;

procedure TfrmEstMotosCCIA.BitBtn_Excluir_DespesaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI030', 'APAGAR', '', 'DESPESAS_VEIC', '', EstMoto.buscas, true) then
    Exit;
  EstMoto.vDespesaVeic.Delete;
  //Soma os valores do Grid
  DBEdit_SomaTotalDespesa.Text := FloatToStrF(_SomarValoresGridDespesa, ffFixed, 4, 2);
end;

procedure TfrmEstMotosCCIA.BitBtn_Excluir_PendenciaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI023', 'APAGAR', '', 'PENDENCIAS_VEIC', '', EstMoto.buscas, true) then
    Exit;
  EstMoto.vPendenciaVeic.Delete;
  //Soma os valores do Grid
  DBEdit_SomaTotalPendencia.Text := FloatToStrF(_SomarValoresGridPendencia, ffFixed, 4, 2);
end;

procedure TfrmEstMotosCCIA.BitBtn_Novo_DespesaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI029', 'INCLUIR', '', 'DESPESAS_VEIC', '', EstMoto.buscas, true) then
    Exit;
  if EstMoto.vDespesaVeic.Insert(EstMoto) then
  begin
    _HabilitarCamposDespesa;
    if DBEdit_Assunto_Despesa.CanFocus then
      DBEdit_Assunto_Despesa.SetFocus;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn_Novo_PendenciaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI022', 'INCLUIR', '', 'PENDENCIAS_VEIC', '', EstMoto.buscas, true) then
    Exit;
  if EstMoto.vPendenciaVeic.Insert(EstMoto) then
  begin
    _HabilitarCamposPendencia;
    if DBEdit_Assunto_Pendencia.CanFocus then
      DBEdit_Assunto_Pendencia.SetFocus;
  end;

end;

procedure TfrmEstMotosCCIA.BitBtn_Salvar_DespesaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI027', 'GRAVAR', '', 'DESPESAS_VEIC', '', EstMoto.buscas, true) then
    Exit;
  if not EstMoto.vDespesaVeic.Post then
  begin
    PageControl3.ActivePage := TabSheet_Despesas;
    setFocusCampoErro(EstMoto.vDespesaVeic.vNomeCampoErro);
    exit;
  end;

  _DesabilitarCamposDespesa;
  //Soma os valores do Grid
  DBEdit_SomaTotalDespesa.Text := FloatToStrF(_SomarValoresGridDespesa, ffFixed, 4, 2);
end;

procedure TfrmEstMotosCCIA.BitBtn_Salvar_PendenciaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI020', 'GRAVAR', '', 'PENDENCIAS_VEIC', '', EstMoto.buscas, true) then
    Exit;
  if not EstMoto.vPendenciaVeic.Post then
  begin
    PageControl3.ActivePage := TabSheet_Pendencias;
    setFocusCampoErro(EstMoto.vPendenciaVeic.vNomeCampoErro);
    exit;
  end;

  _DesabilitarCamposPendencia;
  //Soma os valores do Grid
  DBEdit_SomaTotalPendencia.Text := FloatToStrF(_SomarValoresGridPendencia, ffFixed, 4, 2);
end;

procedure TfrmEstMotosCCIA.CheckBox1Click(Sender: TObject);
begin
  inherited;
  groupAdicional.Visible := CheckBox1.Checked;


  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;

  if ComboBox11.CanFocus then
    ComboBox11.SetFocus;
end;

procedure TfrmEstMotosCCIA.CheckBox3Click(Sender: TObject);
begin
  inherited;

  groupAvancadas.Visible := CheckBox3.Checked;
end;

procedure TfrmEstMotosCCIA.ComboBox11Exit(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
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

procedure TfrmEstMotosCCIA.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  if EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'N' then
  begin
     EstMoto.dataSet.FieldByName('PLACAEST').AsString := '';
     DBEdit26.Enabled := false;
  end
  else
     DBEdit26.Enabled := true;

end;

procedure TfrmEstMotosCCIA.DBEdit10Exit(Sender: TObject);
begin
  inherited;
 if (not EstMoto.dataSet.FieldByName('COM_ENT').IsNull) and (EstMoto.dataSet.FieldByName('COM_ENT').AsInteger <> 0) then
    EstMoto.dataSet.FieldByName('VL_REC_CAIXA').AsFloat := 0
  else
    EstMoto.dataSet.FieldByName('VL_REC_CAIXA').AsFloat := EstMoto.dataSet.FieldByName('VL_COMPRA').AsFloat;
end;

procedure TfrmEstMotosCCIA.DBEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vMarcaVeic: TMarcas;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD',
        ' AND TIPO_MARCA =''V''', 'Consulta de Marcas');
      if vDadosIni.vPesquisa <> '' then
        EstMoto.dataSet.FieldByName('COD_MARCA').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadMarcas') then
      exit;
    EstMoto.vModVeic.AbrirMarca;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_MARCA').asinteger := strtoint(vDadosIni.vPesquisa);
        EstMoto.vMarcaVeic._AbreMarca;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit18Exit(Sender: TObject);
begin
  inherited;
   if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if EstMoto.verificajacad(1) then
  begin
    if Application.MessageBox('Veiculo já cadastrado com este chassi com estoque, Deseja visualizar os dados?',
      'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      EstMoto.AbreEstMoto;
      if DBEdit26.CanFocus then
        DBEdit26.SetFocus;
    end
    else
    begin
      if DBEdit18.CanFocus then
        DBEdit18.SetFocus;
    end;
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCor: TCores;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_COR').AsString := vDadosIni.pesquisaRapida('CODIGO_CORFAB');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadCores') then
      exit;
    EstMoto.AbrirCores;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_COR').AsString := vDadosIni.vPesquisa;
        EstMoto.vCoresVeic._AbreCores;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if EstMoto.dataSet.FieldByName('COD_FORNECEDOR').AsInteger > 0 then
    if not EstMoto.vFornecedorVeic.abreClientes(EstMoto.dataSet.FieldByName('COD_FORNECEDOR').asinteger) then
    begin
      Application.MessageBox('Fornecedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if DBEdit2.CanFocus then
        DBEdit2.SetFocus;
    end;
end;

procedure TfrmEstMotosCCIA.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_FORNECEDOR').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes') then
      exit;
    EstMoto.AbrirCliente;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_FORNECEDOR').AsString := vDadosIni.vPesquisa;
        EstMoto.vClientesVeic.abreClientes;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit31Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  ComboBox4.Text := '';
  ComboBox5.Text := '';

  if EstMoto.dataSet.FieldByName('VERSAOEST').AsInteger > 0 then
  begin
    if not EstMoto.vModVeic.buscarModelo(EstMoto.dataSet.FieldByName('VERSAOEST').AsInteger) then
    begin
      Application.MessageBox('Modelo de veículo não encontrado', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if DBEdit31.CanFocus then
        DBEdit31.SetFocus;
      exit;
    end;
    EstMoto.dataSet.FieldByName('COD_MARCA').AsInteger := EstMoto.vModVeic.buscas.FieldByName('COD_MARCA').AsInteger;
    EstMoto.dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger := EstMoto.vModVeic.buscas.FieldByName('COD_COMBUSTIVEL').AsInteger;
    EstMoto.dataSet.FieldByName('LOTACAOEST').AsString := EstMoto.vModVeic.buscas.FieldByName('LOTACAO').AsString;
    EstMoto.dataSet.FieldByName('COD_ESPE_SEG').AsInteger := EstMoto.vModVeic.buscas.FieldByName('COD_TIPO_ESP').AsInteger;
    EstMoto.dataSet.FieldByName('ANO_FABEST').AsInteger := EstMoto.vModVeic.buscas.FieldByName('ANO1').AsInteger;
    EstMoto.dataSet.FieldByName('ANO_MODEST').AsInteger := EstMoto.vModVeic.buscas.FieldByName('MODELO1').AsInteger;
    EstMoto.dataSet.FieldByName('HPEST').AsFloat := EstMoto.vModVeic.buscas.FieldByName('MODELO1').AsFloat;
    EstMoto.dataSet.FieldByName('CILINDROSEST').AsFloat := EstMoto.vModVeic.buscas.FieldByName('CILINDROS').AsFloat;
    EstMoto.dataSet.FieldByName('CILINDRADAEST').AsFloat := EstMoto.vModVeic.buscas.FieldByName('CILINDRADA').AsFloat;
    EstMoto.dataSet.FieldByName('RENAVAMEST').AsString := EstMoto.vModVeic.buscas.FieldByName('RENAVAM').AsString;

    if EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '01' then
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'PASSAGEIRO'
    else if EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '02' then
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'CARGA'
    else if EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '03' then
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'MISTO'
    else
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString;

    if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '04' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTOCICLO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '03' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTONETA'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '02' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TRICICLO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '01' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + ' CICLOMOTO'
    else
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString;
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit31KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vModeloVeic: TModVeiculoCCIA;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vModeloVeic.dataSet.FieldByName('MODELO').AsString := vDadosIni.pesquisaRapida('TIPMODELO');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TFrmCadModVeiculosCCIA') then
      exit;
    EstMoto.AbrirModeloVeic;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('MODELO').AsString := vDadosIni.vPesquisa;
        EstMoto.vModVeic.abreModVeiculos;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit3Exit(Sender: TObject);
begin
  if EstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
  begin
    if not EstMoto.vClientesVeic.abreClientes(EstMoto.dataSet.FieldByName('COD_CLIENTE').asinteger) then
    begin
      Application.MessageBox('Cliente não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if DBEdit3.CanFocus then
        DBEdit3.SetFocus;
    end
    else
      EstMoto.dataSet.FieldByName('NOME_RES').AsString := EstMoto.vClientesVeic.dataSet.FieldByName('NOME_CLIENTE').AsString;
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes') then
      exit;
    EstMoto.AbrirCliente;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
        EstMoto.vClientesVeic.abreClientes;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit4Exit(Sender: TObject);
begin
  inherited;

   if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if EstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
    if not EstMoto.vClientesVeic.abreClientes(EstMoto.dataSet.FieldByName('COD_CLIENTE').asinteger) then
    begin
      Application.MessageBox('Cliente não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if DBEdit4.CanFocus then
        DBEdit4.SetFocus;
    end;
end;

procedure TfrmEstMotosCCIA.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes') then
      exit;
    EstMoto.AbrirCliente;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
        EstMoto.vClientesVeic.abreClientes;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCombustivel: TCombustivel;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_COMBUSTIVEL').AsString := vDadosIni.pesquisaRapida('TP_COMB_RENAVAM');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadCombustivel') then
      exit;
    EstMoto.vModVeic.AbrirCombustivel;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_COMBUSTIVEL').AsString := vDadosIni.vPesquisa;
        EstMoto.vCombustivelVeic.abreTipoCombustiveis;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit_Assunto_DespesaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vAssuntoDesp: TTipoDespesa;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.vDespesaVeic.dataSet.FieldByName('COD_TP_DESPESA').AsString := vDadosIni.pesquisaRapida('TIPO_DESPESA');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadTipoDespesa') then
      exit;
    EstMoto.vDespesaVeic.AbreTipoDesp;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.vDespesaVeic.dataSet.FieldByName('COD_TP_DESPESA').AsString := vDadosIni.vPesquisa;
        EstMoto.vTpdespesaVeic.abreLocTipoDespesa;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit_Assunto_PendenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vAssuntoPend: TTipoPendencia;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.vPendenciaVeic.dataSet.FieldByName('COD_TP_PENDENCIA').AsString := vDadosIni.pesquisaRapida('TIPO_PENDENCIA');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadTipoPendencia') then
      exit;
    EstMoto.vPendenciaVeic.AbreTipoPend;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.vPendenciaVeic.dataSet.FieldByName('COD_TP_PENDENCIA').AsString := vDadosIni.vPesquisa;
        EstMoto.vTppendenciaVeic.abreLocTipoPendencia;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit_Fornecedor_DespesaExit(Sender: TObject);
begin
  inherited;
  if EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
    if not EstMoto.vDespesaVeic.LocCliDespesa.abreClientes(EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
    begin
      Application.MessageBox('Fornecedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if DBEdit_Fornecedor_Despesa.CanFocus then
        DBEdit_Fornecedor_Despesa.SetFocus;
    end;
end;

procedure TfrmEstMotosCCIA.DBEdit_Fornecedor_DespesaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes') then
      exit;
    EstMoto.AbrirCliente;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
        EstMoto.vClientesVeic.abreClientes;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender);
end;

procedure TfrmEstMotosCCIA.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Status: char;
begin
  inherited;
  if not (EstMoto.vPendenciaVeic.dataSet.FieldByName('STATUS_PENDENCIA').IsNull) then
  begin
    Status := EstMoto.vPendenciaVeic.dataSet.FieldByName('STATUS_PENDENCIA').asstring[1];
    case Status of
      'P': DBComboBox_Status_Pendencia.ItemIndex := 0;
      'R': DBComboBox_Status_Pendencia.ItemIndex := 1;
    end;
  end;
end;

procedure TfrmEstMotosCCIA.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Status: char;
begin
  inherited;
  if not (EstMoto.vDespesaVeic.dataSet.FieldByName('STATUS_DESPESA').IsNull) then
  begin
    Status := EstMoto.vDespesaVeic.dataSet.FieldByName('STATUS_DESPESA').asstring[1];
    case Status of
      'P': DBComboBox_Status_Despesa.ItemIndex := 0;
      'R': DBComboBox_Status_Despesa.ItemIndex := 1;
    end;
  end;
end;

procedure TfrmEstMotosCCIA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (EstMoto <> nil) then
    EstMoto.Cancel;

  EstMoto.free;
  EstMoto := nil;

  Action := caFree;
  if (frmEstMotosCCIA <> nil) then
    frmEstMotosCCIA := nil;
end;

procedure TfrmEstMotosCCIA.FormCreate(Sender: TObject);
var
  I: Integer;
begin
//  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ESTMOTO' then
//  begin
//    if DtmVeiculosCCIA = nil then
//      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
//    vDadosIni.vTipoForm := 6;
//    vDadosIni.vModalOuChild := 'M';
//  end;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  EstMoto := TEstMotoCCIA.create;
  EstMoto.AbreEstMoto;

  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;

  for I := 0 to PageControl3.PageCount - 1 do
    PageControl3.Pages[i].TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmEstMotosCCIA.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmVeiculosCCIA.dsEstMotos;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

   inherited;

  //Campos do formulário

//   if (TelaCadastro = 6) then
//   begin
//    CheckCadSeq.Visible := true;
//    LabelSeq.Visible := true;
//    Label29.Visible := true;
//    DBEdit15.Visible := true;
//    DBComboBox5.Visible := true;
//    Label30.Visible := true;
//    DBComboBox5.Visible := true;
//    Label25.Visible := true;
//    DBEdit10.Visible := true;
//    Label27.Visible := true;
//    DBEdit12.Visible := true;
//    Label28.Visible := true;
//    DBEdit13.Visible := true;
//    Panel10.Height := 270;
//    BitBtn3.Click;
//    DBComboBox3.Clear;
//    DBComboBox3.Items.Add('U - USADO');
//    DBComboBox3.ItemIndex := 0;
//    EstMoto.dataSet.FieldByName('STATUS_USO').AsString := 'U';
//    EstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString := 'S';
//    EstMoto.dataSet.FieldByName('USADO_TROCA').AsString := 'S';
//    EstMoto.dataSet.FieldByName('COD_CONTRATOAQ').AsInteger := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
//   end
//   else
//   begin
//    DBComboBox3.Clear;
//    DBComboBox3.Items.Add('N - NOVO');
//    DBComboBox3.Items.Add('U - USADO');
    Label29.Visible := false;
    DBEdit15.Visible := false;
    DBComboBox5.Visible := false;
    Label30.Visible := false;
    DBComboBox5.Visible := false;
    Label25.Visible := false;
    DBEdit10.Visible := false;
    Label27.Visible := false;
    DBEdit12.Visible := false;
    Label28.Visible := false;
    DBEdit13.Visible := false;
    Panel10.Height := 220;
//   end;

  vDadosIni.fechaStatusProcessamento;
  DBGrid1.Refresh;
end;

procedure TfrmEstMotosCCIA.groupAdicionalExit(Sender: TObject);
begin
  inherited;
  if BitBtn1.CanFocus then
    BitBtn1.SetFocus;
end;

procedure TfrmEstMotosCCIA.PageControl3Change(Sender: TObject);
var
  i: integer;
begin
  inherited;
  //1- Se ele tive clicado em Novo na telacadastro tipo '5'
  // e clicar em abas diferentes
  // de Dados do Veículo e Dados Complementares para continuar
  // o cadastro verificar se foram preechidos todos os campos obrigatórios
  // e incluir veículo na tabela e utilizar código do veículo para os demais
  // cadastros.
  //2- Aba com Highlighted para mostrar que tem informações

  if ((EstMoto.dataSet.State = dsInsert) and (not (PageControl3.ActivePage = TabSheet_Dados))) then
  begin
    if Application.MessageBox('O Veículo será incluído. Deseja prosseguir?',
      'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      if not (EstMoto.Post) then
        PageControl3.ActivePage := TabSheet_Dados;
      DBEdit18.SetFocus;
    end
    else
    begin
      EstMoto.Edit;
    end;

  end;

  if PageControl3.ActivePage = TabSheet_Pendencias then
  begin
    EstMoto.vPendenciaVeic._AbrePendencia(EstMoto);
       //Soma os valores do Grid
    DBEdit_SomaTotalPendencia.Text := 'R$ ' + FloatToStr(vDadosIni.StrToFloatFormat(_SomarValoresGridPendencia, 2));
    //'R$ ' + FloatToStrF(_SomarValoresGridPendencia, ffCurrency, 4, 2);

    _DesabilitarCamposPendencia;

    if BitBtn_Novo_Pendencia.CanFocus then
      BitBtn_Novo_Pendencia.SetFocus;
  end
  else if PageControl3.ActivePage = TabSheet_Despesas then
  begin
    EstMoto.vDespesaVeic._AbreDespesa(EstMoto);
       //Soma os valores do Grid
    DBEdit_SomaTotalDespesa.Text := 'R$ ' + FloatToStr(vDadosIni.StrToFloatFormat(_SomarValoresGridDespesa, 2));
    // 'R$ ' + FloatToStrF(_SomarValoresGridDespesa, ffCurrency, 4, 2);

    _DesabilitarCamposDespesa;

    if BitBtn_Novo_Despesa.CanFocus then
      BitBtn_Novo_Despesa.SetFocus;
  end;
end;

procedure TfrmEstMotosCCIA.SpeedButton1Click(Sender: TObject);
begin
  if EstMoto.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('VEI060', 'ALTERAR', '', 'EST_MOTO', EstMoto.dataSet.FieldByName('CHASSI_C').AsString, EstMoto.buscas, true) then
    exit;

  try
    Screen.Cursor := crHourGlass;
    if not EstMoto.Edit then
      exit;
    inherited;
    ComboBox4.Text := '';
    ComboBox5.Text := '';

    TabSheet3.TabVisible := false;
    TabSheet_Dados.TabVisible := true;
    TabSheet_Contratos.TabVisible := true;
    TabSheet_Pendencias.TabVisible := true;
    TabSheet_Despesas.TabVisible := true;
    TabSheet_Notas.TabVisible := true;
    TabSheet_Oficina.TabVisible := true;
    PageControl3.ActivePage := TabSheet_Dados;
    TabSheet_Dados.Show;
    _DesabilitarCamposPendencia;
    _DesabilitarCamposDespesa;
    _DesabilitaCampos;
    _atualizarCombobox;
    _buscarInfModelo;

    if trim(EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString) = 'CFT' then
      DBComboBox1.Text := 'COMANDO FATURAMENTO'
    else if trim(EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString) = 'CTRVND' then
      DBComboBox1.Text := 'CONTRATO VENDA'
    else if trim(EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString) = 'CTRVNDCONS' then
      DBComboBox1.Text := 'CONTRATO VENDA CONSIGNADO'
    else if trim(EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString) = 'CTRRESDOM' then
      DBComboBox1.Text := 'CONTRATO RESERVA DOMINIO'
    else if trim(EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString) = 'CTRINTERM' then
      DBComboBox1.Text := 'CONTRATO INTERMEDIACAO';

    if DBComboBox3.CanFocus then
      DBComboBox3.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmEstMotosCCIA.SpeedButton2Click(Sender: TObject);
begin
  try
    inherited;
    if not EstMoto.Delete then
      exit;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    EstMoto.Cancel;
    EstMoto.RollBackTransacao;
  end;
end;

procedure TfrmEstMotosCCIA.SpeedButton8Click(Sender: TObject);
begin
  try
    if EstMoto.dataSet.IsEmpty then
      Exit;

    if (EstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString <> 'S') then
    begin
     Application.MessageBox(PChar('Veículo Chassi = '+QuotedStr(Trim(EstMoto.dataSet.FieldByName('CHASSI_C').AsString))+', não possui estoque!'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
     Exit;
    end;
    

    if not vDadosIni.PesqPros('VEI062', 'CONSULTA', '', 'EST_MOTO', '',
      EstMoto.buscas, true) then
      Exit;

    Screen.Cursor := crHourGlass;
    if not EstMoto.abreFormReserva then
     exit;

    EstMoto.dataSet.Edit;
    Memo1.Lines.Add('Chassi: ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString);
    Memo1.Lines.Add('Modelo: ' + EstMoto.dataSet.FieldByName('DESCRICAO_VERSAOEST').AsString);
    Memo1.Lines.Add('Fabr..: ' + EstMoto.dataSet.FieldByName('ANO_FABEST').AsString);
    Memo1.Lines.Add('Mod...: ' + EstMoto.dataSet.FieldByName('ANO_MODEST').AsString);
    Memo1.Lines.Add('Cor...: ' + EstMoto.dataSet.FieldByName('COREST').AsString);

    if DBEdit3.CanFocus then
      DBEdit3.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmEstMotosCCIA._atualizarCombobox: Boolean;
begin
  if not (EstMoto.dataSet.FieldByName('LOTACAOEST').IsNull) then
  begin
    if trim(EstMoto.dataSet.FieldByName('LOTACAOEST').AsString) = '01' then
       DBComboBox2.ItemIndex := 0
    else if trim(EstMoto.dataSet.FieldByName('LOTACAOEST').AsString) = '02' then
       DBComboBox2.ItemIndex := 1
    else if trim(EstMoto.dataSet.FieldByName('LOTACAOEST').AsString) = '03' then
       DBComboBox2.ItemIndex := 2
    else if trim(EstMoto.dataSet.FieldByName('LOTACAOEST').AsString) = '04' then
       DBComboBox2.ItemIndex := 3
    else if trim(EstMoto.dataSet.FieldByName('LOTACAOEST').AsString) = '05' then
       DBComboBox2.ItemIndex := 4;
  end;
end;

procedure TfrmEstMotosCCIA._buscarInfModelo;
begin
  if EstMoto.dataSet.FieldByName('VERSAOEST').AsInteger <= 0 then
    exit;

  if EstMoto.vModVeic.buscarModelo(EstMoto.dataSet.FieldByName('VERSAOEST').AsInteger) then
  begin
    if EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '01' then
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'PASSAGEIRO'
    else if EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '02' then
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'CARGA'
    else if EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '03' then
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'MISTO'
    else
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString;

    if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '04' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTOCICLO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '03' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTONETA'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '02' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TRICICLO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '01' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + ' CICLOMOTO'
    else
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString;
  end;
end;

procedure TfrmEstMotosCCIA._DesabilitaCampos;
var
  vAbilitar: Boolean;
begin
  if (trim(EstMoto.dataSet.FieldByName('STATUS_CONTRATO').AsString) = 'CTRINTERM') then
    vAbilitar := true
  else
    vAbilitar := false;


//  DBComboBox3.Enabled := vAbilitar;
//  DBEdit18.Enabled := vAbilitar;
//  DBEdit26.Enabled := vAbilitar;
//  DBEdit31.Enabled := vAbilitar;
//  DBLookupComboBox3.Enabled := vAbilitar;
//  DBEdit27.Enabled := vAbilitar;
//  DBLookupComboBox7.Enabled := vAbilitar;
//  DBEdit11.Enabled := vAbilitar;
//  DBEdit33.Enabled := vAbilitar;
//  DBEdit35.Enabled := vAbilitar;
//  DBEdit28.Enabled := vAbilitar;
//  DBEdit32.Enabled := vAbilitar;
//  DBEdit5.Enabled := vAbilitar;
//  DBEdit43.Enabled := vAbilitar;
//  DBEdit2.Enabled := vAbilitar;
//  DBLookupComboBox1.Enabled := vAbilitar;
//  DBComboBox2.Enabled := vAbilitar;
//
//  DBEdit1.Enabled := false;
//  DBEdit14.Enabled := false;
//  DBLookupComboBox8.Enabled := false;
//  DBEdit8.Enabled := false;
//  DBLookupComboBox9.Enabled := false;
//  ComboBox4.Enabled := false;
//  ComboBox5.Enabled := false;
//  DBLookupComboBox5.Enabled := false;
//  DBComboBox1.Enabled := false;
//  DBEdit4.Enabled := false;
//  DBLookupComboBox2.Enabled := false;

  BitBtn4.Enabled := vAbilitar;
end;

procedure TfrmEstMotosCCIA._DesabilitarCamposDespesa;
begin
  DBLookupComboBox_Assunto_Despesa.Enabled := false;
  DBLookupComboBox_Fornecedor_Despesa.Enabled := false;
  DBEdit_Controle_Despesa.Enabled := false;
  DBEdit_N_CH_Despesa.Enabled := false;
  DBComboBox_Status_Despesa.Enabled := false;
  DBComboBox_Status_Despesa.Enabled := false;
  DBEdit_DataVencimento_Despesa.Enabled := false;
  DBMemo_Despesa_Despesa.Enabled := false;
  DBEdit_Assunto_Despesa.Enabled := false;
  DBEdit_Data_Despesa.Enabled := false;
  DBEdit_Fornecedor_Despesa.Enabled := false;
  DBEdit_Valor_Despesa.Enabled := false;
  BitBtn_Salvar_Despesa.Enabled := false;
  BitBtn_Cancelar_Despesa.Enabled := false;

  if EstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString = 'S' then
  begin
    BitBtn_Novo_Despesa.Enabled := true;
    BitBtn_Alterar_Despesa.Enabled := true;
    BitBtn_Excluir_Despesa.Enabled := true;
    BitBtn_Salvar_Despesa.Enabled := false;
    BitBtn_Cancelar_Despesa.Enabled := false;
    TabSheet_Despesas.TabVisible := true;
  end
  else
  begin
    BitBtn_Novo_Despesa.Enabled := False;
    BitBtn_Alterar_Despesa.Enabled := False;
    BitBtn_Excluir_Despesa.Enabled := False;
    BitBtn_Salvar_Despesa.Enabled := False;
    BitBtn_Cancelar_Despesa.Enabled := False;
    TabSheet_Despesas.TabVisible := false;
    TabSheet_Despesas.TabVisible := false;
  end;
end;

procedure TfrmEstMotosCCIA._DesabilitarCamposPendencia;
begin
  DBLookupComboBox_Assunto_Pendencia.Enabled := false;
  DBEdit_Descricao_Pendencia.Enabled := false;
  DBLookupComboBox_Funcionario_Pendencia.Enabled := false;
  DBComboBox_Status_Pendencia.Enabled := false;
  DBEdit_Valor_Pendencia.Enabled := false;
  DBEdit_DataPrevista_Pendencia.Enabled := false;
  DBLookupComboBox_Usuario_Pendencia.Enabled := false;
  DBEdit_Assunto_Pendencia.Enabled := false;
  DBEdit_Data_Pendencia.Enabled := false;

  if EstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString = 'S' then
  begin
    BitBtn_Salvar_Pendencia.Enabled := false;
    BitBtn_Cancelar_Pendencia.Enabled := false;
    BitBtn_Novo_Pendencia.Enabled := true;
    BitBtn_Alterar_Pendencia.Enabled := true;
    BitBtn_Excluir_Pendencia.Enabled := true;
    TabSheet_Pendencias.TabVisible := true;
  end
  else
  begin
    BitBtn_Salvar_Pendencia.Enabled := false;
    BitBtn_Cancelar_Pendencia.Enabled := false;
    BitBtn_Novo_Pendencia.Enabled := false;
    BitBtn_Alterar_Pendencia.Enabled := false;
    BitBtn_Excluir_Pendencia.Enabled := false;
    TabSheet_Pendencias.TabVisible := false;
  end;
end;

procedure TfrmEstMotosCCIA._HabilitarCamposDespesa;
begin
  DBLookupComboBox_Assunto_Despesa.Enabled := true;
  DBLookupComboBox_Fornecedor_Despesa.Enabled := true;
  DBEdit_Controle_Despesa.Enabled := true;
  DBEdit_N_CH_Despesa.Enabled := true;
  DBComboBox_Status_Despesa.Enabled := true;
  DBComboBox_Status_Despesa.Enabled := true;
  DBEdit_DataVencimento_Despesa.Enabled := true;
  DBMemo_Despesa_Despesa.Enabled := true;
  DBEdit_Assunto_Despesa.Enabled := true;
  DBEdit_Data_Despesa.Enabled := false;
  DBEdit_Fornecedor_Despesa.Enabled := true;
  DBEdit_Valor_Despesa.Enabled := true;

  BitBtn_Salvar_Despesa.Enabled := true;
  BitBtn_Cancelar_Despesa.Enabled := true;
  BitBtn_Novo_Despesa.Enabled := false;
  BitBtn_Alterar_Despesa.Enabled := false;
  BitBtn_Excluir_Despesa.Enabled := false;
  TabSheet_Despesas.TabVisible := true;
end;

procedure TfrmEstMotosCCIA._HabilitarCamposPendencia;
begin
  DBLookupComboBox_Assunto_Pendencia.Enabled := true;
  DBEdit_Descricao_Pendencia.Enabled := true;
  DBLookupComboBox_Funcionario_Pendencia.Enabled := true;
  DBComboBox_Status_Pendencia.Enabled := true;
  DBEdit_Valor_Pendencia.Enabled := true;
  DBEdit_DataPrevista_Pendencia.Enabled := true;
  DBLookupComboBox_Usuario_Pendencia.Enabled := true;
  DBEdit_Assunto_Pendencia.Enabled := true;
  DBEdit_Data_Pendencia.Enabled := false;

  BitBtn_Salvar_Pendencia.Enabled := true;
  BitBtn_Cancelar_Pendencia.Enabled := true;
  BitBtn_Novo_Pendencia.Enabled := false;
  BitBtn_Alterar_Pendencia.Enabled := false;
  BitBtn_Excluir_Pendencia.Enabled := false;
  TabSheet_Pendencias.TabVisible := true;
end;

function TfrmEstMotosCCIA._mdiAberto(pNomeFormMDI: string): Boolean;
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

function TfrmEstMotosCCIA._SomarValoresGridDespesa: Double;
var
  Soma: double;
  Ponteiro: TBookMark;
begin
  Soma := 0;
  Ponteiro := EstMoto.vDespesaVeic.DataSet.GetBookMark; // Pega posicao atual do Dataset
  EstMoto.vDespesaVeic.DataSet.First;
  while not EstMoto.vDespesaVeic.DataSet.Eof do
  begin
    Soma := Soma + EstMoto.vDespesaVeic.DataSet.FieldByName('VALOR_DESPESA').AsFloat;
    EstMoto.vDespesaVeic.DataSet.Next;
  end;
  EstMoto.vDespesaVeic.DataSet.GotoBookMark(Ponteiro); // Retorna posicao original do Dataset
  Result := Soma;
end;

function TfrmEstMotosCCIA._SomarValoresGridPendencia: Double;
var
  Soma: double;
  Ponteiro: TBookMark;
begin
  Soma := 0;
  Ponteiro := EstMoto.vPendenciaVeic.DataSet.GetBookMark; // Pega posicao atual do Dataset
  EstMoto.vPendenciaVeic.DataSet.First;
  while not EstMoto.vPendenciaVeic.DataSet.Eof do
  begin
    Soma := Soma + EstMoto.vPendenciaVeic.DataSet.FieldByName('VALOR_PENDENCIA').AsFloat;
    EstMoto.vPendenciaVeic.DataSet.Next;
  end;
  EstMoto.vPendenciaVeic.DataSet.GotoBookMark(Ponteiro); // Retorna posicao original do Dataset
  Result := Soma;
end;


initialization
  RegisterClass(TFrmEstMotosCCIA);
finalization
  UnRegisterClass(TFrmEstMotosCCIA);

end.

