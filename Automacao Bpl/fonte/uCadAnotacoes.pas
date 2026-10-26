unit uCadAnotacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, DB;

type
  TfrmCadAnotacoes = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBComboBox1: TDBComboBox;
    Label9: TLabel;
    DBComboBox2: TDBComboBox;
    Label10: TLabel;
    DBComboBox3: TDBComboBox;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    Label12: TLabel;
    DBEdit6: TDBEdit;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label19: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label20: TLabel;
    DBMemo1: TDBMemo;
    Label21: TLabel;
    DBComboBox4: TDBComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    SpeedButton9: TSpeedButton;
    GroupBox5: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    GroupBox6: TGroupBox;
    Panel4: TPanel;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Panel5: TPanel;
    GroupBox7: TGroupBox;
    ckAtend: TCheckBox;
    ckCurr: TCheckBox;
    ckRec: TCheckBox;
    ckRecl: TCheckBox;
    ckSaida: TCheckBox;
    ckSug: TCheckBox;
    ckVisSup: TCheckBox;
    ckVisVenda: TCheckBox;
    ckComContr: TCheckBox;
    ckSemContr: TCheckBox;
    ckTelef: TCheckBox;
    ckDireto: TCheckBox;
    tsClientes: TTabSheet;
    pnClientes: TPanel;
    GroupBox10: TGroupBox;
    DBGrid2: TDBGrid;
    Panel7: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DataSource1: TDataSource;
    ckRazao: TCheckBox;
    tsAssunto: TTabSheet;
    pnCadAssunto: TPanel;
    GroupBox11: TGroupBox;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    BitBtn10: TBitBtn;
    GroupBox12: TGroupBox;
    Edit1: TEdit;
    BitBtn11: TBitBtn;
    SpeedButton13: TSpeedButton;
    tsSoft: TTabSheet;
    pnSoft: TPanel;
    GroupBox13: TGroupBox;
    SpeedButton10: TSpeedButton;
    DBGrid4: TDBGrid;
    Panel9: TPanel;
    BitBtn9: TBitBtn;
    GroupBox14: TGroupBox;
    Edit2: TEdit;
    BitBtn12: TBitBtn;
    DBLookupComboBox4: TDBLookupComboBox;
    Label22: TLabel;
    SpeedButton14: TSpeedButton;
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GroupBox10Enter(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure DBEdit13Enter(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vCodCliente: Integer;
    vNomeCliente: string;
  public
    { Public declarations }
  end;

var
  frmCadAnotacoes: TfrmCadAnotacoes;

implementation

uses uDtmFollowUpPosAtendimento, uClassesFollowUpPosAtendimento, uDtmAtivo, uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadAnotacoes.BitBtn10Click(Sender: TObject);
begin
  inherited;
  TForm(pnCadAssunto.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadAnotacoes.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if Trim(Edit1.Text) <> '' then
  begin
    flwAnotacoes.vTipoAnot.DescricaoAssunto := Edit1.Text;
    if GroupBox12.Caption = 'Novo' then
      flwAnotacoes.vTipoAnot.incluirAssunto
    else if flwAnotacoes.vTipoAnot.alterarAssunto then
      GroupBox12.Caption := 'Novo';
  end;
end;

procedure TfrmCadAnotacoes.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if Trim(Edit2.Text) <> '' then
  begin
    flwAnotacoes.vSoft.NomeSoftware := Edit2.Text;
    if GroupBox14.Caption = 'Novo' then
      flwAnotacoes.vSoft.incluirSoftware
    else if flwAnotacoes.vSoft.alterarSoftware then
      GroupBox14.Caption := 'Novo';
  end;
end;

procedure TfrmCadAnotacoes.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('', 'Pesquisando Anotações');
    inherited;

    if not vDadosIni.PesqPros('CRM081', 'CONSULTAR', '', 'ANOTACOES', '', flwAnotacoes.buscas, False) then
      exit;

    flwAnotacoes.vCons.campo := ComboBox1.Text;
    flwAnotacoes.vCons.ordem := ComboBox2.Text;
    flwAnotacoes.vCons.condicao := ComboBox3.Text;
    flwAnotacoes.vCons.valor := MaskEdit3.Text;
    flwAnotacoes.vCons.dataIni := MaskEdit1.Text;
    flwAnotacoes.vCons.dataFim := MaskEdit2.Text;
    flwAnotacoes.vCons.porData := MaskEdit1.Visible;

    flwAnotacoes.vCons.campoAd := ComboBox11.Text;
    flwAnotacoes.vCons.valorAd := MaskEdit7.Text;
    flwAnotacoes.vCons.dataIniAd := MaskEdit9.Text;
    flwAnotacoes.vCons.dataFimAd := MaskEdit8.Text;
    flwAnotacoes.vCons.condicaoAd := ComboBox12.Text;
    flwAnotacoes.vCons.porDataAd := MaskEdit9.Visible;

    flwAnotacoes.vCons.adicional := CheckBox1.Checked;

    SetLength(flwAnotacoes.vCons.vTipo, 0);
    SetLength(flwAnotacoes.vCons.vComContrato, 0);
    SetLength(flwAnotacoes.vCons.vTipoContato, 0);

    if ckAtend.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipo, Length(flwAnotacoes.vCons.vTipo) + 1);
      flwAnotacoes.vCons.vTipo[Length(flwAnotacoes.vCons.vTipo) - 1] := ctAtendimento;
    end;
    if ckCurr.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipo, Length(flwAnotacoes.vCons.vTipo) + 1);
      flwAnotacoes.vCons.vTipo[Length(flwAnotacoes.vCons.vTipo) - 1] := ctCurriculum;
    end;
    if ckRec.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipo, Length(flwAnotacoes.vCons.vTipo) + 1);
      flwAnotacoes.vCons.vTipo[Length(flwAnotacoes.vCons.vTipo) - 1] := ctRecado;
    end;
    if ckRecl.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipo, Length(flwAnotacoes.vCons.vTipo) + 1);
      flwAnotacoes.vCons.vTipo[Length(flwAnotacoes.vCons.vTipo) - 1] := ctReclamacao;
    end;
    if ckSaida.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipo, Length(flwAnotacoes.vCons.vTipo) + 1);
      flwAnotacoes.vCons.vTipo[Length(flwAnotacoes.vCons.vTipo) - 1] := ctSaida;
    end;
    if ckSug.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipo, Length(flwAnotacoes.vCons.vTipo) + 1);
      flwAnotacoes.vCons.vTipo[Length(flwAnotacoes.vCons.vTipo) - 1] := ctSugestao;
    end;
    if ckVisSup.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipo, Length(flwAnotacoes.vCons.vTipo) + 1);
      flwAnotacoes.vCons.vTipo[Length(flwAnotacoes.vCons.vTipo) - 1] := ctVisitaSuporte;
    end;
    if ckVisVenda.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipo, Length(flwAnotacoes.vCons.vTipo) + 1);
      flwAnotacoes.vCons.vTipo[Length(flwAnotacoes.vCons.vTipo) - 1] := ctVisitaVenda;
    end;

    if ckComContr.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vComContrato, Length(flwAnotacoes.vCons.vComContrato) + 1);
      flwAnotacoes.vCons.vComContrato[Length(flwAnotacoes.vCons.vComContrato) - 1] := ccSim;
    end;
    if ckSemContr.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vComContrato, Length(flwAnotacoes.vCons.vComContrato) + 1);
      flwAnotacoes.vCons.vComContrato[Length(flwAnotacoes.vCons.vComContrato) - 1] := ccNao;
    end;

    if ckTelef.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipoContato, Length(flwAnotacoes.vCons.vTipoContato) + 1);
      flwAnotacoes.vCons.vTipoContato[Length(flwAnotacoes.vCons.vTipoContato) - 1] := tcTelefone;
    end;
    if ckDireto.Checked then
    begin
      SetLength(flwAnotacoes.vCons.vTipoContato, Length(flwAnotacoes.vCons.vTipoContato) + 1);
      flwAnotacoes.vCons.vTipoContato[Length(flwAnotacoes.vCons.vTipoContato) - 1] := tcDireto;
    end;

    flwAnotacoes._consulta;

    for I := 0 to DBGrid1.Columns.Count - 1 do
      if DBGrid1.Columns[i].FieldName = 'OBSERVACAO' then
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
    SpeedButton1.Visible := True;
    SpeedButton2.Visible := True;
//    vDtDia := vDadosIni.getDataBanco(flwAnotacoes.buscas);

  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAnotacoes.BitBtn2Click(Sender: TObject);
begin
  BitBtn5.Click;
  inherited;
end;

procedure TfrmCadAnotacoes.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not flwAnotacoes.Insert then
      exit;

    inherited;

    Label22.Visible := vDadosIni.vEmp.vCNPJ <> '03530705000109';
    DBLookupComboBox4.Visible := vDadosIni.vEmp.vCNPJ <> '03530705000109';
    SpeedButton14.Visible := vDadosIni.vEmp.vCNPJ <> '03530705000109';

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAnotacoes.BitBtn4Click(Sender: TObject);
begin
  if not flwAnotacoes.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(flwAnotacoes.vNomeCampoErro);
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
      if flwAnotacoes.Insert then
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

procedure TfrmCadAnotacoes.BitBtn5Click(Sender: TObject);
begin
  flwAnotacoes.Cancel;
  inherited;
end;

procedure TfrmCadAnotacoes.BitBtn7Click(Sender: TObject);
begin
  inherited;
  DataSource1.DataSet := nil;
  TForm(pnClientes.Parent).ModalResult := IDOK;
end;

procedure TfrmCadAnotacoes.BitBtn8Click(Sender: TObject);
begin
  inherited;
  DataSource1.DataSet := nil;
  TForm(pnClientes.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadAnotacoes.BitBtn9Click(Sender: TObject);
begin
  inherited;
  TForm(pnSoft.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadAnotacoes.CheckBox1Click(Sender: TObject);
begin
  inherited;
  GroupBox6.Visible := CheckBox3.Checked;
  GroupBox5.Visible := CheckBox1.Checked;
end;

procedure TfrmCadAnotacoes.CheckBox3Click(Sender: TObject);
begin
  inherited;
  GroupBox6.Visible := CheckBox3.Checked;
  GroupBox5.Visible := CheckBox1.Checked;
end;

procedure TfrmCadAnotacoes.ComboBox11Exit(Sender: TObject);
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

procedure TfrmCadAnotacoes.DBEdit13Enter(Sender: TObject);
begin
  inherited;
  vNomeCliente := flwAnotacoes.dataSet.FieldByName('nome_cl').AsString;
end;

procedure TfrmCadAnotacoes.DBEdit13Exit(Sender: TObject);
begin
  inherited;
  if Trim(vNomeCliente) = Trim(flwAnotacoes.dataSet.FieldByName('nome_cl').AsString) then
    Exit;

  if flwAnotacoes.dataSet.state in [dsEdit, dsInsert] then
  begin
    flwAnotacoes.RazaoSocial := ckRazao.Checked;
    if not flwAnotacoes._existeCliente(Trim(vNomeCliente) <> Trim(flwAnotacoes.dataSet.FieldByName('nome_cl').AsString), pcNome) then
      flwAnotacoes.dataSet.FieldByName('nome_cl').AsString := vNomeCliente
    else
      vNomeCliente := flwAnotacoes.dataSet.FieldByName('nome_cl').AsString;
  end;
end;

procedure TfrmCadAnotacoes.DBEdit2Enter(Sender: TObject);
begin
  inherited;
  vCodCliente := flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger;
end;

procedure TfrmCadAnotacoes.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if vCodCliente = flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger then
    Exit;
  if flwAnotacoes.dataSet.state in [dsEdit, dsInsert] then
  begin
    flwAnotacoes.RazaoSocial := ckRazao.Checked;
    if not flwAnotacoes._existeCliente(vCodCliente <> flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger, pcCodigo) then
      flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger := vCodCliente
    else
      vCodCliente := flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger;
  end;
end;

procedure TfrmCadAnotacoes.DBEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if flwAnotacoes.dataSet.state in [dsEdit, dsInsert] then
    begin
      flwAnotacoes.RazaoSocial := ckRazao.Checked;
      try
        flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger := StrToInt(vDadosIni.vPesquisa);
      except
        flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger := 0;
      end;
      if not flwAnotacoes._existeCliente(vCodCliente <> flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger, pcCodigo) then
        flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger := vCodCliente
      else
        vCodCliente := flwAnotacoes.dataSet.FieldByName('cod_cliente').AsInteger;
    end;
  end;
end;

procedure TfrmCadAnotacoes.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadAnotacoes.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn7.Click;
end;

procedure TfrmCadAnotacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  _GravaConfiguracoesBoolean(ckRazao.Name, ckRazao.Checked);

  flwAnotacoes.Free;
  flwAnotacoes := nil;

  Action := caFree;
  frmCadAnotacoes := nil;
end;

procedure TfrmCadAnotacoes.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  flwAnotacoes := TFlw_Anotacoes.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadAnotacoes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (flwAnotacoes.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadAnotacoes.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmFollowUpPosAtendimento.dsAnotacoes;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.Text := ComboBox1.Text;
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM085]';
  end;
  tsClientes.TabVisible := False;
  tsAssunto.TabVisible := False;
  tsSoft.TabVisible := False;
  ckRazao.Checked := _LerConfiguracoesRegistroBoolean(ckRazao.Name);
  PageControl1.ActivePage := TabSheet2;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(flwAnotacoes._lixeiraVazia);
  end;

  imgInformation.Hint := imgInformation.Hint + #13 +
    'Abrir este formulário - [CRM080]';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadAnotacoes.GroupBox10Enter(Sender: TObject);
begin
  inherited;
  if DataSource1.DataSet = nil then
    DataSource1.DataSet := flwAnotacoes.buscas;
end;

procedure TfrmCadAnotacoes.MaskEdit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F7 then
  begin
    MaskEdit3.CharCase := ecNormal;
    MaskEdit7.CharCase := ecNormal;
  end;
end;

procedure TfrmCadAnotacoes.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if (not flwAnotacoes.vSoft.dataSet.IsEmpty) then
  begin
    Edit2.Text := flwAnotacoes.vSoft.dataSet.FieldByName('NOME_SOFT').AsString;
    GroupBox14.Caption := 'Alterar';
    if (Self.Enabled) and (Self.Visible) and (Edit2.CanFocus) then
      Edit2.SetFocus;
  end;
end;

procedure TfrmCadAnotacoes.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if (not flwAnotacoes.vTipoAnot.dataSet.IsEmpty) then
  begin
    Edit1.Text := flwAnotacoes.vTipoAnot.dataSet.FieldByName('DESCRICAO_TIPOANOT').AsString;
    GroupBox12.Caption := 'Alterar';
    if (Self.Enabled) and (Self.Visible) and (Edit1.CanFocus) then
      Edit1.SetFocus;
  end;
end;

procedure TfrmCadAnotacoes.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  flwAnotacoes.vSoft.abreFormSoftware;
end;

procedure TfrmCadAnotacoes.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not flwAnotacoes.Edit then
      exit;
    inherited;
    Label22.Visible := vDadosIni.vEmp.vCNPJ <> '03530705000109';
    DBLookupComboBox4.Visible := vDadosIni.vEmp.vCNPJ <> '03530705000109';
    SpeedButton14.Visible := vDadosIni.vEmp.vCNPJ <> '03530705000109';
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAnotacoes.SpeedButton25Click(Sender: TObject);
begin
  if not flwAnotacoes._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM085]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton1.Visible := False;
    SpeedButton2.Visible := False;
  end;
end;

procedure TfrmCadAnotacoes.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    flwAnotacoes.Delete;
    lixeiraVazia( flwAnotacoes._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAnotacoes.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  flwAnotacoes.vTipoAnot.abreFormAssunto;
end;

end.
