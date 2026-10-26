unit uCadFinalidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmCadFinalidade = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    pn_cadastro: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    procedure pn_cadastroEnter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFinalidade: TfrmCadFinalidade;

implementation

uses
  uDtmAtivo,
  finalidade_class,
  uClassesFinalidade, uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadFinalidade.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CLI245', 'CONSULTA', '', finalidade.TableName, '', finalidade.buscas, False) then
      Exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not finalidade.ConsultaCampos(finalidade.TableName, ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if finalidade.ConsultaCampos(finalidade.TableName, MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		ComboBox1.SetFocus;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFinalidade.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;

    if not finalidade.Insert then
      Exit;

    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFinalidade.BitBtn4Click(Sender: TObject);
begin
  if not finalidade.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(finalidade.vNomeCampoErro);
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
      if finalidade.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadFinalidade.BitBtn5Click(Sender: TObject);
begin
  inherited;
  finalidade.Cancel;
end;

procedure TfrmCadFinalidade.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadFinalidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCadFinalidade := nil;

  if Assigned(finalidade) then
    FreeAndNil(finalidade);
end;

procedure TfrmCadFinalidade.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  if not Assigned(finalidade) then
  begin
    finalidade := TFinalidade.Create;
    DBGrid1.DataSource := finalidade._dataSourceOOP;
  end;

  tsCadastro.TabVisible := False;
  TabSheet1.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadFinalidade.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := finalidade._dataSourceOOP;
    finalidade.montaSelect('select %s from %s where id = 0 and cod_empresa = 0', [TFinalidade_class.GetFieldsSql(), finalidade.TableName]);
    finalidade.dataSet.FieldByName('cod_empresa').Tag := 1;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  imgInformation.Hint := imgInformation.Hint + sLineBreak + sLineBreak +
   'CLI245 - BT PESQUISAR FINALIDADE' + sLineBreak +
   'CLI246 - BT INSERIR FINALIDADE' + sLineBreak +
   'CLI247 - BT ALTERAR FINALIDADE' + sLineBreak +
   'CLI248 - BT EXCLUIR FINALIDADE' + sLineBreak +
   'CLI249 - BT SALVAR FINALIDADE' ;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadFinalidade.pn_cadastroEnter(Sender: TObject);
begin
  inherited;
  if not Assigned(DBEdit1.DataSource) then
  begin
    DBEdit1.DataSource := finalidade._dataSourceOOP;
    DBEdit2.DataSource := finalidade._dataSourceOOP;
  end;
end;

procedure TfrmCadFinalidade.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not finalidade.Edit then
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

procedure TfrmCadFinalidade.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if finalidade.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if vDadosIni.ShowConfirmacao('Deseja mesmo excluir o registro') = IDYES then
      finalidade.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
