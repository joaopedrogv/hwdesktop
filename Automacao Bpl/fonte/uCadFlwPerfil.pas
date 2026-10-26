unit uCadFlwPerfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadFlwPerfil = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBComboBox1: TDBComboBox;
    tsPerguntasDoPerfil: TTabSheet;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Panel4: TPanel;
    GroupBox7: TGroupBox;
    Splitter3: TSplitter;
    GroupBox8: TGroupBox;
    Panel5: TPanel;
    DBGrid2: TDBGrid;
    Panel6: TPanel;
    SpeedButton10: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    Panel8: TPanel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Panel9: TPanel;
    SpeedButton9: TSpeedButton;
    Panel10: TPanel;
    BitBtn7: TBitBtn;
    BitBtn19: TBitBtn;
    Label9: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label10: TLabel;
    DBText3: TDBText;
    Label11: TLabel;
    Panel11: TPanel;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    BitBtn8: TBitBtn;
    procedure BitBtn19Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFlwPerfil: TfrmCadFlwPerfil;

implementation

uses uDtmFollowUpPosAtendimento, uClassesFollowUpPosAtendimento, uDtmAtivo, DB,
  uDadosIni;

{$R *.dfm}

procedure TfrmCadFlwPerfil.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if BitBtn19.Tag = 2 then
  begin
    flwPerfil.vPerfPerg.Cancel;
    flwPerfil.Cancel;
    BitBtn19.Tag := 0;
    PageControl1.ActivePage := TabSheet2;
  end
  else
  begin
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    BitBtn19.Tag := 0;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  end;
end;

procedure TfrmCadFlwPerfil.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CRM045', 'CONSULTA', '', 'FLW_PERFIL', '',
    flwPerfil.buscas, true) then
    Exit;

  inherited;

  if MaskEdit2.Visible then
  begin
    if not flwPerfil.ConsultaCampos('FLW_PERFIL', ComboBox1.Text,
      ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus;
  end
  else if not flwPerfil.ConsultaCampos('FLW_PERFIL', MaskEdit3.text, ComboBox1.Text,
    combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
    	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
    		ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  SpeedButton6.Visible := True;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM049]';

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadFlwPerfil.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not flwPerfil.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwPerfil.BitBtn4Click(Sender: TObject);
begin
  if not flwPerfil.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(flwPerfil.vNomeCampoErro);
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
      if flwPerfil.Insert then
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

procedure TfrmCadFlwPerfil.BitBtn5Click(Sender: TObject);
begin
  flwPerfil.vPerfPerg.Cancel;
  flwPerfil.Cancel;
  BitBtn19.Tag := 0;
  inherited;
end;

procedure TfrmCadFlwPerfil.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadFlwPerfil.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) or (Key = VK_RETURN) then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadFlwPerfil.Edit1Change(Sender: TObject);
begin
  inherited;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;

  if Trim(Edit1.Text) = '' then
    Exit;

  flwPerfil.vPerfPerg.vPergunta.dataSet.Filter := 'DESCRICAO LIKE ''%' + Trim(Edit1.Text) + '%''' ;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := True;
end;

procedure TfrmCadFlwPerfil.Edit1Enter(Sender: TObject);
begin
  inherited;
  Edit1.OnChange := Edit1Change;
end;

procedure TfrmCadFlwPerfil.Edit1Exit(Sender: TObject);
begin
  inherited;
  Edit1.OnChange := nil;
  if ActiveControl <> DBGrid2 then
    flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;
end;

procedure TfrmCadFlwPerfil.Edit2Change(Sender: TObject);
begin
  inherited;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;

  if Trim(Edit2.Text) = '' then
    Exit;

  flwPerfil.vPerfPerg.vPergunta.dataSet.Filter := 'CATEGORIA LIKE ''%' + Trim(Edit2.Text) + '%''' ;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := True;
end;

procedure TfrmCadFlwPerfil.Edit2Enter(Sender: TObject);
begin
  inherited;
  Edit2.OnChange := Edit2Change;
end;

procedure TfrmCadFlwPerfil.Edit2Exit(Sender: TObject);
begin
  inherited;
  Edit2.OnChange := nil;
  if ActiveControl <> DBGrid2 then
    flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;
end;

procedure TfrmCadFlwPerfil.Edit3Change(Sender: TObject);
begin
  inherited;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;

  if Trim(Edit3.Text) = '' then
    Exit;

  flwPerfil.vPerfPerg.vPergunta.dataSet.Filter := 'PERGUNTA LIKE ''%' + Trim(Edit3.Text) + '%''' ;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := True;
end;

procedure TfrmCadFlwPerfil.Edit3Enter(Sender: TObject);
begin
  inherited;
  Edit3.OnChange := Edit3Change;
end;

procedure TfrmCadFlwPerfil.Edit3Exit(Sender: TObject);
begin
  inherited;
  Edit3.OnChange := nil;
  if ActiveControl <> DBGrid2 then
    flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;
end;

procedure TfrmCadFlwPerfil.Edit4Change(Sender: TObject);
begin
  inherited;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;

  if Trim(Edit4.Text) = '' then
    Exit;

  flwPerfil.vPerfPerg.vPergunta.dataSet.Filter := 'COMPLEMENTO LIKE ''%' + Trim(Edit4.Text) + '%''' ;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := True;
end;

procedure TfrmCadFlwPerfil.Edit4Enter(Sender: TObject);
begin
  inherited;
  Edit4.OnChange := Edit4Change;
end;

procedure TfrmCadFlwPerfil.Edit4Exit(Sender: TObject);
begin
  inherited;
  Edit4.OnChange := nil;
  if ActiveControl <> DBGrid2 then
    flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;
end;

procedure TfrmCadFlwPerfil.Edit5Change(Sender: TObject);
begin
  inherited;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;

  if Trim(Edit5.Text) = '' then
    Exit;

  flwPerfil.vPerfPerg.vPergunta.dataSet.Filter := 'SIMNAONIVEL LIKE ''%' + Trim(Edit5.Text) + '%''' ;
  flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := True;
end;

procedure TfrmCadFlwPerfil.Edit5Enter(Sender: TObject);
begin
  inherited;
  Edit5.OnChange := Edit5Change;
end;

procedure TfrmCadFlwPerfil.Edit5Exit(Sender: TObject);
begin
  inherited;
  Edit5.OnChange := nil;
  if ActiveControl <> DBGrid2 then
    flwPerfil.vPerfPerg.vPergunta.dataSet.Filtered := False;
end;

procedure TfrmCadFlwPerfil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  flwPerfil.Free;
  flwPerfil := nil;

  Action := caFree;
  frmCadFlwPerfil := nil;
end;

procedure TfrmCadFlwPerfil.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  flwPerfil := TFlw_Perfil.create;

  tsCadastro.TabVisible := false;
  tsPerguntasDoPerfil.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadFlwPerfil.FormKeyDown(Sender: TObject; var Key: Word;
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
      if (flwPerfil.dataSet.State in [dsEdit, dsInsert]) then
      begin
        ActiveControl := BitBtn5;
        BitBtn5Click(Sender);
      end;
  end;
end;

procedure TfrmCadFlwPerfil.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmFollowUpPosAtendimento.dsFlwPerfil;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM049]';
  end;

  Edit1.OnChange := nil;
  Edit2.OnChange := nil;
  Edit3.OnChange := nil;
  Edit4.OnChange := nil;
  Edit5.OnChange := nil;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(flwPerfil._lixeiraVazia);
  end;

  imgInformation.Hint := imgInformation.Hint + #13 +
    'Abrir este formulário - [CRM044]';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadFlwPerfil.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  flwPerfil.vPerfPerg._inserePerfilPergunta(flwPerfil.dataSet.FieldByName('codperfil').AsInteger,
    flwPerfil.vPerfPerg.vPergunta.dataSet.FieldByName('codpergunta').AsInteger);
end;

procedure TfrmCadFlwPerfil.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not flwPerfil.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadFlwPerfil.SpeedButton25Click(Sender: TObject);
begin
  if not flwPerfil._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM049]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
    SpeedButton6.Visible := True;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [CRM050]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
    SpeedButton6.Visible := False;
  end;
end;

procedure TfrmCadFlwPerfil.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    flwPerfil.Delete;
    lixeiraVazia( flwPerfil._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwPerfil.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if flwPerfil._restaurarRegistroDaLixeira then
    lixeiraVazia(flwPerfil._lixeiraVazia);
end;

procedure TfrmCadFlwPerfil.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CRM055', 'CONSULTA', '', 'FLW_PERFIL', '',
    flwPerfil.buscas, true) then
    Exit;

  if (flwPerfil.dataSet.state in [dsInsert, dsEdit]) or (flwPerfil.Edit) then
  begin
    flwPerfil.vPerfPerg.vPergunta._abreTodos;
    if Sender.ClassName = 'TSpeedButton' then
      BitBtn19.Tag := 2
    else
      BitBtn19.Tag := 0;
    PageControl1.ActivePage := tsPerguntasDoPerfil;
  end;
end;

procedure TfrmCadFlwPerfil.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  flwPerfil.vPerfPerg.Delete;
end;

end.
