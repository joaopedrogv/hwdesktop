unit uCadFlwPergunta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadFlwPergunta = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    DBEdit5: TDBEdit;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFlwPergunta: TfrmCadFlwPergunta;

implementation

uses uDtmFollowUpPosAtendimento, uClassesFollowUpPosAtendimento, uDtmAtivo, DB,
  uDadosIni;

{$R *.dfm}

procedure TfrmCadFlwPergunta.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CRM036', 'CONSULTA', '', 'FLW_PERGUNTA', '',
    flwPergunta.buscas, true) then
    Exit;

  inherited;

  if MaskEdit2.Visible then
  begin
    if not flwPergunta.ConsultaCampos('FLW_PERGUNTA', ComboBox1.Text,
      'FLW_PERGUNTA.CODPERGUNTA', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1, 'FLW_PERGUNTA.*, G.DESCRICAO, G.CATEGORIA',
      ' INNER JOIN FLW_GRUPO G ON G.CODGRUPO = FLW_PERGUNTA.CODGRUPO AND G.COD_EMPRESA = FLW_PERGUNTA.COD_EMPRESA', '') then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		combobox1.setfocus
  end
  else
    if flwPergunta.ConsultaCampos('FLW_PERGUNTA', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, 'FLW_PERGUNTA.CODPERGUNTA', true, vDadosIni.codEmpresa, 'FLW_PERGUNTA.*, G.DESCRICAO, G.CATEGORIA',
      ' INNER JOIN FLW_GRUPO G ON G.CODGRUPO = FLW_PERGUNTA.CODGRUPO AND G.COD_EMPRESA = FLW_PERGUNTA.COD_EMPRESA', '') then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
     		  ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;
  SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM040]';

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadFlwPergunta.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not flwPergunta.Insert then
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

procedure TfrmCadFlwPergunta.BitBtn4Click(Sender: TObject);
begin
  if not flwPergunta.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(flwPergunta.vNomeCampoErro);
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
      if flwPergunta.Insert then
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

procedure TfrmCadFlwPergunta.BitBtn5Click(Sender: TObject);
begin
  flwPergunta.Cancel;
  inherited;      
end;

procedure TfrmCadFlwPergunta.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = BitBtn5 then
    Exit;
    
  if not flwPergunta.dataSet.FieldByName('codgrupo').IsNull then
    if not flwPergunta.vGrupo._existeGrupo(flwPergunta.dataSet.FieldByName('codgrupo').AsInteger, True) then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus;
end;

procedure TfrmCadFlwPergunta.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vFlwGr: TFlw_Grupos;
begin
  inherited;
  if Key = VK_F4 then
  begin
    vDadosIni.vPesquisa := '';
    vFlwGr._cadFlwGrupos(1);
    if vDadosIni.vPesquisa <> '' then
    begin
      flwPergunta.vGrupo._abreTodos;
      flwPergunta.dataSet.FieldByName('codgrupo').AsString := vDadosIni.vPesquisa;
    end;
  end;
end;

procedure TfrmCadFlwPergunta.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadFlwPergunta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  flwPergunta.Free;
  flwPergunta := nil;

  Action := caFree;
  frmCadFlwPergunta := nil;
end;

procedure TfrmCadFlwPergunta.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  flwPergunta := TFlw_Pergunta.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadFlwPergunta.FormKeyDown(Sender: TObject; var Key: Word;
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
    if (flwPergunta.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadFlwPergunta.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmFollowUpPosAtendimento.dsPergunta;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM040]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(flwPergunta._lixeiraVazia);
  end;

  imgInformation.Hint := imgInformation.Hint + #13 +
    'Abrir este formulário - [CRM035]';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadFlwPergunta.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  flwPergunta.vComplemento._inserePerguntaComplemento(flwPergunta.dataSet.FieldByName('codpergunta').AsInteger, Edit1.Text);
  Edit1.Clear;
end;

procedure TfrmCadFlwPergunta.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  flwPergunta.vComplemento.Delete;
end;

procedure TfrmCadFlwPergunta.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  if not flwPergunta.vComplemento.IsEmpty then
  begin
    flwPergunta.vComplemento._alteraPerguntaComplemento(Edit1.Text);
    Edit1.Clear;
  end;
end;

procedure TfrmCadFlwPergunta.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not flwPergunta.Edit then
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

procedure TfrmCadFlwPergunta.SpeedButton25Click(Sender: TObject);
begin
  if not flwPergunta._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [CRM040]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [CRM041]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadFlwPergunta.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    flwPergunta.Delete;
    lixeiraVazia( flwPergunta._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFlwPergunta.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if flwPergunta._restaurarRegistroDaLixeira then
    lixeiraVazia(flwPergunta._lixeiraVazia);
end;

end.
