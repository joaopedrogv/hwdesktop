unit uCadPerfTributAdicional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls,
  uDataSet_OOP;

type
  TfrmCadPerfTribAd = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    ListBox1: TListBox;
    Label9: TLabel;
    Label10: TLabel;
    DBComboBox2: TDBComboBox;
    Label11: TLabel;
    DBComboBox18: TDBComboBox;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label15: TLabel;
    DBComboBox3: TDBComboBox;
    Label17: TLabel;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Label18: TLabel;
    DBEdit8: TDBEdit;
    Label19: TLabel;
    DBComboBox4: TDBComboBox;
    Label20: TLabel;
    DBEdit9: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label21: TLabel;
    Label22: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    ck_usarmvaanexoxv: TDBCheckBox;
    procedure ck_usarmvaanexoxvClick(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure ListBox1Enter(Sender: TObject);
    procedure ListBox1Exit(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  private
    { Private declarations }
    Flk_finalidade: TDadosLookUp_OOP;
    Flk_inddeson: TDadosLookUp_OOP;
    procedure montarComponentes;
  public
    { Public declarations }
  end;

var
  frmCadPerfTribAd: TfrmCadPerfTribAd;

implementation

uses UDtmProdutos, UClassesProdutos, uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmCadPerfTribAd.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO271', 'CONSULTA', '', 'PRODUTOS_TRIB_PF', '',
    vPerfTribAd.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
    begin
      if not vPerfTribAd.ConsultaCampos('PRODUTOS_TRIB_PF', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if vPerfTribAd.ConsultaCampos('PRODUTOS_TRIB_PF', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

  SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO274]';
  SpeedButton1.Visible := true;
  SpeedButton5.Visible := false;

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadPerfTribAd.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('TRIBUTACAO_ADICIONAL', 'I', vPerfTribAd.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    montarComponentes;
    if not vPerfTribAd.Insert then
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

procedure TfrmCadPerfTribAd.BitBtn4Click(Sender: TObject);
begin
  if not vPerfTribAd.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(vPerfTribAd.vNomeCampoErro, vPerfTribAd.vMensagemErro);
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
      if vPerfTribAd.Insert then
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

procedure TfrmCadPerfTribAd.BitBtn5Click(Sender: TObject);
begin
  vPerfTribAd.Cancel;
  inherited;
end;

procedure TfrmCadPerfTribAd.ck_usarmvaanexoxvClick(Sender: TObject);
begin
  inherited;
  DBEdit8.Enabled := vPerfTribAd.fequals('USAR_MVA_ANEXOXV', 'S');
end;

procedure TfrmCadPerfTribAd.DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadPerfTribAd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  vPerfTribAd.Free;
  vPerfTribAd := nil;

  if Assigned(Flk_finalidade) then
    FreeAndNil(Flk_finalidade);
    
  if Assigned(Flk_inddeson) then
    FreeAndNil(Flk_inddeson);

  Action := caFree;
  frmCadPerfTribAd := nil;
end;

procedure TfrmCadPerfTribAd.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  vPerfTribAd := TProdutosPerfilTribAdicional.create;
  Flk_finalidade := TDadosLookUp_OOP.create;
  Flk_inddeson   := TDadosLookUp_OOP.create;

  tsCadastro.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadPerfTribAd.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (vPerfTribAd.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadPerfTribAd.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmProdutos.dsPFTribAd;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO274]';
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else
  begin
    lixeiraVazia(vPerfTribAd._lixeiraVazia);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadPerfTribAd.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  if vPerfTribAd.dataSet.FieldByName('REDUCAO_CAD_PRODUTO').AsString <> 'S' then
  begin
    DBEdit6.Enabled := True;
    DBEdit6.DataField := 'PERC_RED_PROD';
  end
  else
  begin
    DBEdit6.Enabled := False;
    DBEdit6.DataField := '';
  end;
end;

procedure TfrmCadPerfTribAd.ListBox1DblClick(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if vPerfTribAd.dataSet.State in [dsEdit, dsInsert] then
  begin
    if ListBox1.ItemIndex > -1 then
      if Pos(ListBox1.Items[ListBox1.ItemIndex]+'|', vPerfTribAd.dataSet.FieldByName('SIGLA_UF').AsString) = 0 then
      begin
        vPerfTribAd.dataSet.FieldByName('SIGLA_UF').AsString :=
          vPerfTribAd.dataSet.FieldByName('SIGLA_UF').AsString + ListBox1.Items[ListBox1.ItemIndex]+'|';
      end
      else
      begin
        vTemp:= Trim(vPerfTribAd.dataSet.FieldByName('SIGLA_UF').AsString);
        Delete(vTemp,
          Pos(ListBox1.Items[ListBox1.ItemIndex]+'|', vPerfTribAd.dataSet.FieldByName('SIGLA_UF').AsString), 3);
        vPerfTribAd.dataSet.FieldByName('SIGLA_UF').AsString := vTemp;
      end;
  end;
end;

procedure TfrmCadPerfTribAd.ListBox1DrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;

   with (Control as TListBox).Canvas do
   begin

      if (pos(ListBox1.Items[Index] + '|', vPerfTribAd.dataSet.FieldByName('sigla_uf').AsString) > 0) then
//      if Index mod 2 = 0 then
      begin
         Brush.Color := clHotLight;
         Font.Color := clWhite;
      end;

      Brush.Style := bsSolid;
      FillRect(Rect);
      Brush.Style := bsClear;
      TextOut(Rect.Left, Rect.Top,(Control as TListBox).Items[Index]);
   end;


end;

procedure TfrmCadPerfTribAd.ListBox1Enter(Sender: TObject);
begin
  inherited;
  if ListBox1.Tag > 0 then
    ListBox1.Selected[ListBox1.Tag]:= True
  else if ListBox1.Tag = -1 then
    ListBox1.Selected[0]:= True;
end;

procedure TfrmCadPerfTribAd.ListBox1Exit(Sender: TObject);
begin
  inherited;
  ListBox1.Tag := ListBox1.ItemIndex;
  ListBox1.Selected[ListBox1.ItemIndex]:= False;
end;

procedure TfrmCadPerfTribAd.ListBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    ListBox1DblClick(ListBox1);
end;

procedure TfrmCadPerfTribAd.montarComponentes;
begin
  if not Assigned(Flk_finalidade) then
    Flk_finalidade := TDadosLookUp_OOP.create;

  Flk_finalidade.setDadosDataSet('ID', 'DESCRICAO', vPerfTribAd.SqlOpen('select ID, DESCRICAO from finalidade' +
                                                                        ' where cod_empresa = ' + vDadosIni.codEmpresa +
                                                                        ' union ' +
                                                                        ' select null id, '' Nenhuma finalidade específica'' descricao from rdb$database' +
                                                                        ' order by 2'), DBLookupComboBox1);

  if not Assigned(Flk_inddeson) then
    Flk_inddeson := TDadosLookUp_OOP.create;

  Flk_inddeson.setDadosDataSet(['0', '1', '3', '4', '5', '6', '7', '8', '9', '10', '11'],
                               ['0 - Sem desoneração',
                                '1 - Taxi',
                                '3 - Produtor Agropecuário',
                                '4 - Frotista/Locadora',
                                '5 - Diplomático/Consular',
                                '6 - Utilitários e Motocicletas da Amazônia Ocidental e Áreas de Livre Comércio (Resolução 714/88 e 790/94 – CONTRAN e suas alterações)',
                                '7 - SUFRAMA',
                                '8 - Venda a Órgão Público',
                                '9 - Outros. (NT 2011/004)',
                                '10 - Deficiente Condutor (Convênio ICMS 38/12)',
                                '11 - Deficiente Não Condutor (Convênio ICMS 38/12)'],
                                DBLookupComboBox2);
end;

procedure TfrmCadPerfTribAd.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('TRIBUTACAO_ADICIONAL', 'A', vPerfTribAd.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    montarComponentes;
    if not vPerfTribAd.Edit then
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

procedure TfrmCadPerfTribAd.SpeedButton25Click(Sender: TObject);
begin
  if not vPerfTribAd._verLixeira then
  begin
    inherited;
    SpeedButton2.Hint := 'Enviar para Lixeira -  [PRO274]';
    SpeedButton1.Visible := True;
    SpeedButton5.Visible := False;
  end
  else
  begin
    SpeedButton2.Hint := 'Excluir registro permanentemente -  [PRO275]';
    SpeedButton1.Visible := False;
    SpeedButton5.Visible := True;
  end;
end;

procedure TfrmCadPerfTribAd.SpeedButton2Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('TRIBUTACAO_ADICIONAL', 'E', vPerfTribAd.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    vPerfTribAd.Delete;
    lixeiraVazia( vPerfTribAd._lixeiraVazia);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPerfTribAd.SpeedButton5Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('TRIBUTACAO_ADICIONAL', 'A', vPerfTribAd.buscas) then
    Exit;
  if vPerfTribAd._restaurarRegistroDaLixeira then
    lixeiraVazia(vPerfTribAd._lixeiraVazia);
end;

end.
