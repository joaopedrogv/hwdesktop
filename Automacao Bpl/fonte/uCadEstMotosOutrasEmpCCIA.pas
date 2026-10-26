unit uCadEstMotosOutrasEmpCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, UClassesVeiculosCCIA, UClassesClientes, 
  DB, uEditMoeda;

type
  TfrmEstMotosOutrasEmpCCIA = class(TfrmCadPadraoM)
    TabSheet_Dados: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    GroupBox23: TGroupBox;
    Label11: TLabel;
    DBText1: TDBText;
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
    GroupBox16: TGroupBox;
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
    Label63: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label8: TLabel;
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
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    Label27: TLabel;
    DBComboBox7: TDBComboBox;
    groupAvancadas: TGroupBox;
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
    GroupBox19: TGroupBox;
    btPosicao: TSpeedButton;
    ckTransito: TCheckBox;
    ckVivo: TCheckBox;
    ckMorto: TCheckBox;
    ckEstacionamento: TCheckBox;
    GroupBox28: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    btStatus: TSpeedButton;
    cbReserva: TComboBox;
    cbDemonstracao: TComboBox;
    cbCancelado: TComboBox;
    cbUsadoTroca: TComboBox;
    ckNovo: TCheckBox;
    ckUsado: TCheckBox;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel31: TPanel;
    Panel30: TPanel;
    GroupBox21: TGroupBox;
    Panel41: TPanel;
    btSituacaoTpOP: TSpeedButton;
    ckEstReal: TCheckBox;
    ckCons: TCheckBox;
    ckInter: TCheckBox;
    Panel43: TPanel;
    btSituacaoEst: TSpeedButton;
    Bevel2: TBevel;
    ckComEstoque: TCheckBox;
    ckSemEstoque: TCheckBox;
    imgInformationTipoOP: TImage;
    ckDeposito: TCheckBox;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox12Exit(Sender: TObject);
    procedure ComboBox12Enter(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure ckVivoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSituacaoTpOPClick(Sender: TObject);
    procedure btSituacaoEstClick(Sender: TObject);
    procedure btStatusClick(Sender: TObject);
    procedure btPosicaoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
  end;

var
  frmEstMotosOutrasEmpCCIA: TfrmEstMotosOutrasEmpCCIA;
  EstMotoOutrasEmp: TEstMotoOutrasEmpCCIA;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;

implementation

uses
  uDtmAtivo, UDtmVeiculosCCIA, DBClient, ConsultasU, UClassesCadastrosBasicos, uClassesNotasFiscais,
  uCadEstMotosCCIA;

{$R *.dfm}

procedure TfrmEstMotosOutrasEmpCCIA.BitBtn1Click(Sender: TObject);
var
 I: Integer;
begin
  try
    if not vDadosIni.PesqPros('VEI058', 'CONSULTA', '', 'EST_MOTO', '',
      EstMotoOutrasEmp.buscas, true) then
      Exit;
    EstMotoOutrasEmp.vCons.campo := ComboBox1.Text;
    EstMotoOutrasEmp.vCons.ordem := ComboBox2.Text;
    EstMotoOutrasEmp.vCons.condicao := ComboBox3.Text;
    EstMotoOutrasEmp.vCons.valor := MaskEdit3.Text;
    EstMotoOutrasEmp.vCons.dataIni := MaskEdit1.Text;
    EstMotoOutrasEmp.vCons.dataFim := MaskEdit2.Text;
    EstMotoOutrasEmp.vCons.porData := MaskEdit1.Visible;

    EstMotoOutrasEmp.vCons.avancada := CheckBox3.Checked;
    EstMotoOutrasEmp.vCons.adicional := CheckBox1.Checked;
    if (not ckNovo.Checked) and (not ckUsado.Checked) and (not ckDeposito.Checked) then
      ckNovo.Checked := True;
    if (not ckVivo.Checked) and (not ckTransito.Checked) and (not ckEstacionamento.Checked) and (not ckMorto.Checked) then
      ckVivo.Checked := True;
    if ckNovo.Enabled then
      EstMotoOutrasEmp.vCons.novo := ckNovo.Checked
    else
      EstMotoOutrasEmp.vCons.novo := False;
    if ckUsado.Enabled then
      EstMotoOutrasEmp.vCons.usado := ckUsado.Checked
    else
      EstMotoOutrasEmp.vCons.usado := False;
    if ckComEstoque.Enabled then
      EstMotoOutrasEmp.vCons.comEstoque := ckComEstoque.Checked
    else
      EstMotoOutrasEmp.vCons.comEstoque := False;
    if ckSemEstoque.Enabled then
      EstMotoOutrasEmp.vCons.semEstoque := ckSemEstoque.Checked
    else
      EstMotoOutrasEmp.vCons.semEstoque := False;
    if ckEstReal.Enabled then
      EstMotoOutrasEmp.vCons.EstoqueReal := ckEstReal.Checked
    else
      EstMotoOutrasEmp.vCons.EstoqueReal := False;
    if ckCons.Enabled then
      EstMotoOutrasEmp.vCons.Consignado := ckCons.Checked
    else
      EstMotoOutrasEmp.vCons.Consignado := False;
    if ckInter.Enabled then
      EstMotoOutrasEmp.vCons.Intermediacao := ckInter.Checked
    else
      EstMotoOutrasEmp.vCons.Intermediacao := False;
    EstMotoOutrasEmp.vCons.transfdeposito := ckDeposito.Checked;
    if cbDemonstracao.Enabled then
      EstMotoOutrasEmp.vCons.demonstracao := cbDemonstracao.Text
    else
      EstMotoOutrasEmp.vCons.demonstracao := '';
    if cbReserva.Enabled then
      EstMotoOutrasEmp.vCons.reserva := cbReserva.Text
    else
      EstMotoOutrasEmp.vCons.reserva := '';
    if cbUsadoTroca.Enabled then
      EstMotoOutrasEmp.vCons.usadotroca := cbUsadoTroca.Text
    else
      EstMotoOutrasEmp.vCons.usadotroca := '';
    if cbCancelado.Enabled then
      EstMotoOutrasEmp.vCons.canc := cbCancelado.Text
    else
      EstMotoOutrasEmp.vCons.canc := '';
    EstMotoOutrasEmp.vCons.campoAd := ComboBox11.Text;
    EstMotoOutrasEmp.vCons.valorAd := MaskEdit7.Text;
    EstMotoOutrasEmp.vCons.dataIniAd := MaskEdit9.Text;
    EstMotoOutrasEmp.vCons.dataFimAd := MaskEdit8.Text;
    EstMotoOutrasEmp.vCons.condicaoAd := ComboBox12.Text;
    EstMotoOutrasEmp.vCons.porDataAd := MaskEdit9.Visible;
    if ckVivo.Enabled then
      EstMotoOutrasEmp.vCons.vivo := ckVivo.Checked
    else
      EstMotoOutrasEmp.vCons.vivo := False;
    if ckMorto.Enabled then
      EstMotoOutrasEmp.vCons.morto := ckMorto.Checked
    else
      EstMotoOutrasEmp.vCons.morto := False;
    if ckEstacionamento.Enabled then    
      EstMotoOutrasEmp.vCons.estacionamento := ckEstacionamento.Checked
    else
      EstMotoOutrasEmp.vCons.estacionamento := False;
    if ckTransito.Enabled then
      EstMotoOutrasEmp.vCons.transito := ckTransito.Checked
    else
      EstMotoOutrasEmp.vCons.transito := False;
    EstMotoOutrasEmp.vCons.posicaoAND_OU := btPosicao.Caption;
    EstMotoOutrasEmp.vCons.statusAND_OU := btStatus.Caption;
    EstMotoOutrasEmp.vCons.situacaoEstAND_OU := btSituacaoEst.Caption;
    EstMotoOutrasEmp.vCons.situacaoTPOPAND_OU := btSituacaoTpOP.Caption;

    Screen.Cursor := crHourGlass;
    if CheckBox3.Checked then
      if (not ckVivo.Checked) and (not ckTransito.Checked) and (not ckEstacionamento.Checked) and (not ckMorto.Checked) then
      begin
        Application.MessageBox(Pchar('Favor informar a posição para realizar a consulta!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
        Screen.Cursor := crDefault;
        if (Self.Enabled) and (Self.Visible) and (GroupBox19.CanFocus) then
          GroupBox19.SetFocus;
        exit;
      end;
    inherited;
    EstMotoOutrasEmp.consulta;
    if EstMotoOutrasEmp.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[i].FieldName = 'OBS_RES' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosOutrasEmpCCIA.BitBtn3Click(Sender: TObject);
begin
  try
    if EstMotoOutrasEmp.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhuma Veículo selecionado para fazer a reserva, favor selecionar o veículo desejado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    if not vDadosIni.PesqPros('VEI062', 'CONSULTA', '', 'EST_MOTO', '',
      EstMotoOutrasEmp.buscas, true) then
      Exit;

    Screen.Cursor := crHourGlass;

    if not EstMotoOutrasEmp.vReserva.abreFormReserva(
    	1,
    	EstMotoOutrasEmp.dataSet.FieldByName('CODIGO').AsInteger,
      EstMotoOutrasEmp.dataSet.FieldByName('COD_EMPRESA').AsInteger,
      EstMotoOutrasEmp.dataSet.FieldByName('CHASSI_C').AsString) then
        exit;

    EstMotoOutrasEmp.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosOutrasEmpCCIA.btPosicaoClick(Sender: TObject);
begin
  if trim(btPosicao.Caption) = 'E' then
    btPosicao.Caption := 'OU'
  else
    btPosicao.Caption := 'E';
end;

procedure TfrmEstMotosOutrasEmpCCIA.btSituacaoEstClick(Sender: TObject);
begin
  if trim(btSituacaoEst.Caption) = 'E' then
    btSituacaoEst.Caption := 'OU'
  else
    btSituacaoEst.Caption := 'E';
end;

procedure TfrmEstMotosOutrasEmpCCIA.btSituacaoTpOPClick(Sender: TObject);
begin
  if trim(btSituacaoTpOP.Caption) = 'E' then
    btSituacaoTpOP.Caption := 'OU'
  else
    btSituacaoTpOP.Caption := 'E';
end;

procedure TfrmEstMotosOutrasEmpCCIA.btStatusClick(Sender: TObject);
begin
  if trim(btStatus.Caption) = 'E' then
    btStatus.Caption := 'OU'
  else
    btStatus.Caption := 'E';
end;

procedure TfrmEstMotosOutrasEmpCCIA.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 264
  else
    GroupBox3.Height := 90;
  groupAdicional.Visible := CheckBox1.Checked;


  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;

  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    ComboBox11.SetFocus;
end;

procedure TfrmEstMotosOutrasEmpCCIA.CheckBox3Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 264
  else
    GroupBox3.Height := 90;
  groupAvancadas.Visible := CheckBox3.Checked;
end;

procedure TfrmEstMotosOutrasEmpCCIA.ckVivoClick(Sender: TObject);
begin
  cbDemonstracao.Enabled := (ckVivo.Checked and ckMorto.Checked)
    or (not ckVivo.Checked and not ckMorto.Checked);
  cbCancelado.Enabled := (ckVivo.Checked and ckMorto.Checked)
    or (not ckVivo.Checked and not ckMorto.Checked);
  ckComEstoque.Enabled := (ckVivo.Checked and ckMorto.Checked)
    or (not ckVivo.Checked and not ckMorto.Checked);

  if (ckVivo.Checked <> ckMorto.Checked) then
  begin
    cbCancelado.Enabled := not ckVivo.Checked;
    cbDemonstracao.Enabled :=  not ckMorto.Checked;
    ckComEstoque.Enabled := not ckMorto.Checked;
  end;
  if ((not ckVivo.Checked) and (not ckMorto.Checked)) and (ckTransito.Checked) then
  begin
    cbCancelado.Enabled := false;
    cbDemonstracao.Enabled := false;
    ckComEstoque.Enabled := false;
  end;
end;

procedure TfrmEstMotosOutrasEmpCCIA.ComboBox11Exit(Sender: TObject);
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
    if (Self.Enabled) and (Self.Visible) and (MaskEdit9.CanFocus) then
      MaskEdit9.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
      MaskEdit7.SetFocus;
end;

procedure TfrmEstMotosOutrasEmpCCIA.ComboBox12Enter(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        exit;
      end;
    end;
  end;
end;

procedure TfrmEstMotosOutrasEmpCCIA.ComboBox12Exit(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        break;
      end;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmEstMotosOutrasEmpCCIA.Configurarcolunas1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('VEI114', 'CONFIGURAR', '', 'EST_MOTO', '', EstMotoOutrasEmp.buscas, true) then
   inherited;
end;

procedure TfrmEstMotosOutrasEmpCCIA.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
    if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($008C9A9A);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_TRANSDEP').AsString)) = 'S')
    and (Column.Field.Dataset.FieldbyName('DATA_TRANS_RET').IsNull) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0000B22D);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_RES').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($008F7C3B);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('POSICAO').AsString)) = 'TRANSITO')
  or (UpperCase(Trim(Column.Field.Dataset.FieldbyName('MODELO_NF').AsString)) = 'TRA') then 
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00A3A573);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmEstMotosOutrasEmpCCIA.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    SpeedButton1Click(Sender);
end;

procedure TfrmEstMotosOutrasEmpCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;

  if (EstMotoOutrasEmp <> nil) then
    EstMotoOutrasEmp.Cancel;

  EstMotoOutrasEmp.free;
  EstMotoOutrasEmp := nil;

  Action := caFree;
  if (frmEstMotosOutrasEmpCCIA <> nil) then
    frmEstMotosOutrasEmpCCIA := nil;
end;

procedure TfrmEstMotosOutrasEmpCCIA.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  EstMotoOutrasEmp := TEstMotoOutrasEmpCCIA.create;
  EstMotoOutrasEmp.AbreEstMoto;

  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;

  for I := 0 to PageControl3.PageCount - 1 do
    PageControl3.Pages[i].TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmEstMotosOutrasEmpCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if PageControl1.ActivePage = TabSheet2  then
    if Key = VK_F11 then
      ckNovo.Checked := not ckNovo.Checked
    else if Key = VK_F12 then
      ckUsado.Checked := not ckUsado.Checked
    else if Key = VK_F7 then
      ckDeposito.Checked := not ckDeposito.Checked

end;

procedure TfrmEstMotosOutrasEmpCCIA.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
  	Exit;

  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmVeiculosCCIA.dsEstMotosOutrasEmp;
    if vCriou = 0 then
    begin
      inherited;
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    end;
  end;

  //Campos do formulário
  Label29.Visible := false;
  DBEdit15.Visible := false;
  DBComboBox5.Visible := false;
  Label30.Visible := false;
  DBComboBox5.Visible := false;
  Label25.Visible := false;
  DBEdit10.Visible := false;
  Label28.Visible := false;
  DBEdit13.Visible := false;
//   end;

  leConfiguracoesFormRegistro;

  imgInformationTipoOP.Hint := 'TIPO OP (ENTRADA/SAÍDA)' + #13 + #13 +
    'A - ATIVO IMOBILIZADO' + #13 +
    'C - CONSIGNAÇÃO' + #13 +
    'D - DEMONSTRAÇÃO DE MERCADORIAS' + #13 +
    'E - DEVOLUÇÃO' + #13 +
    'I - INTERMEDIAÇÃO' + #13 +
    'O - OUTRAS OPERAÇÕES' + #13 +
    'R - RETORNO DE DEMONSTRAÇÃO' + #13 +
    'T - TRANSFERÊNCIA' + #13 +
    'V - MERCADORIA ADQUIRIDA';
  
  if vCriou = 0 then
  	DBGrid1.Refresh;

  if vCriou = 0 then
  	vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmEstMotosOutrasEmpCCIA.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
  	_GravaConfiguracoesBoolean(ckNovo.Name, ckNovo.Checked);
    _GravaConfiguracoesBoolean(ckUsado.Name, ckUsado.Checked);
    _GravaConfiguracoesBoolean(ckDeposito.Name, ckDeposito.Checked);
  end;

  if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
  	_GravaConfiguracoesString(btPosicao.Name, btPosicao.Caption);
    _GravaConfiguracoesBoolean(ckVivo.Name, ckVivo.Checked);
    _GravaConfiguracoesBoolean(ckTransito.Name, ckTransito.Checked);
    _GravaConfiguracoesBoolean(ckEstacionamento.Name, ckEstacionamento.Checked);
    _GravaConfiguracoesBoolean(ckMorto.Name, ckMorto.Checked);

    _GravaConfiguracoesString(btStatus.Name, btStatus.Caption);
    _GravaConfiguracoesInteger(cbReserva.Name, cbReserva.ItemIndex);
    _GravaConfiguracoesInteger(cbDemonstracao.Name, cbDemonstracao.ItemIndex);
    _GravaConfiguracoesInteger(cbUsadoTroca.Name, cbUsadoTroca.ItemIndex);
    _GravaConfiguracoesInteger(cbCancelado.Name, cbCancelado.ItemIndex);

    _GravaConfiguracoesString(btSituacaoEst.Name, btSituacaoEst.Caption);
    _GravaConfiguracoesBoolean(ckComEstoque.Name, ckComEstoque.Checked);
    _GravaConfiguracoesBoolean(ckSemEstoque.Name, ckSemEstoque.Checked);

    _GravaConfiguracoesString(btSituacaoTpOP.Name, btSituacaoTpOP.Caption);
    _GravaConfiguracoesBoolean(ckEstReal.Name, ckEstReal.Checked);
    _GravaConfiguracoesBoolean(ckCons.Name, ckCons.Checked);
    _GravaConfiguracoesBoolean(ckInter.Name, ckInter.Checked);
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

procedure TfrmEstMotosOutrasEmpCCIA.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
    ckNovo.Checked := _LerConfiguracoesRegistroBoolean(ckNovo.Name);
    ckUsado.Checked := _LerConfiguracoesRegistroBoolean(ckUsado.Name);
    ckDeposito.Checked := _LerConfiguracoesRegistroBoolean(ckDeposito.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
  	btPosicao.Caption := _LerConfiguracoesRegistroString(btPosicao.Name, 'E');
    ckVivo.Checked := _LerConfiguracoesRegistroBoolean(ckVivo.Name);
    ckTransito.Checked := _LerConfiguracoesRegistroBoolean(ckTransito.Name);
    ckEstacionamento.Checked := _LerConfiguracoesRegistroBoolean(ckEstacionamento.Name);
    ckMorto.Checked := _LerConfiguracoesRegistroBoolean(ckMorto.Name);

    btStatus.Caption := _LerConfiguracoesRegistroString(btStatus.Name, 'E');
    cbReserva.ItemIndex := _LerConfiguracoesRegistroInteger(cbReserva.Name);
    cbDemonstracao.ItemIndex := _LerConfiguracoesRegistroInteger(cbDemonstracao.Name);
    cbUsadoTroca.ItemIndex := _LerConfiguracoesRegistroInteger(cbUsadoTroca.Name);
    cbCancelado.ItemIndex := _LerConfiguracoesRegistroInteger(cbCancelado.Name);

    btSituacaoEst.Caption := _LerConfiguracoesRegistroString(btSituacaoEst.Name, 'E');
    ckComEstoque.Checked := _LerConfiguracoesRegistroBoolean(ckComEstoque.Name);
    ckSemEstoque.Checked := _LerConfiguracoesRegistroBoolean(ckSemEstoque.Name);

    btSituacaoTpOP.Caption := _LerConfiguracoesRegistroString(btSituacaoTpOP.Name, 'E');
    ckEstReal.Checked := _LerConfiguracoesRegistroBoolean(ckEstReal.Name);
    ckCons.Checked := _LerConfiguracoesRegistroBoolean(ckCons.Name);
    ckInter.Checked := _LerConfiguracoesRegistroBoolean(ckInter.Name);
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

function TfrmEstMotosOutrasEmpCCIA._mdiAberto(pNomeFormMDI,
  pMensagem: string): Boolean;
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
        if trim(pMensagem) <> ''  then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

initialization
  RegisterClass(TfrmEstMotosOutrasEmpCCIA);
finalization
  UnRegisterClass(TfrmEstMotosOutrasEmpCCIA);

end.

