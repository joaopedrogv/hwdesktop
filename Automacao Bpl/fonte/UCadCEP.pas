unit UCadCEP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, uclassescadastrosbasicos, xmldom, XMLIntf,
  msxmldom, XMLDoc, uCadPadrao;

type
  TfrmCadCEP = class(TfrmCadPadraoM)
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label11: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    DBEdit10: TDBEdit;
    Label10: TLabel;
    DBEdit_Descricao: TDBEdit;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    procedure DBLookupComboBox1DropDown(Sender: TObject);
    procedure DBLookupComboBox7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox7Exit(Sender: TObject);
    procedure DBEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBLookupComboBox6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox6Exit(Sender: TObject);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCEP: TfrmCadCEP;
  CEPs: TCEP;

implementation
uses
  udtmCadastrosBasicos, udtmativo, DB;

{$R *.dfm}

procedure TfrmCadCEP.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS156]';

  if vDadosIni.PesqPros('BAS152', 'PESQUISAR', '', 'CEP', '',
    CEPs.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not CEPs.ConsultaCampos('CEP', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not CEPs.ConsultaCampos('CEP', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
          
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if CEPs._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadCEP.BitBtn3Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS153', 'INSERIR', '', 'CEP',
      '', CEPs.buscas, true) then
    begin
      if CEPs.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar CEP';
        TabSheet3.TabVisible := true;
        TabSheet3.Show;

        CEPs._AbreEstados;
        CEPS._AbreCidades;
        CEPs._AbreBairros;
        DBEdit5.Text := '';

        if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
        	DBEdit_Descricao.SetFocus;
      end;
    end;
  except
    Application.MessageBox('Erro ao incluir registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.show;
    CEPs.RollBackTransacao;
    CEPs.Cancel;
    Exit;
  end;
end;

procedure TfrmCadCEP.BitBtn4Click(Sender: TObject);
begin
 if not CEPs.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(CEPs.vNomeCampoErro);
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
      if CEPs.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
        	DBLookupComboBox1.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadCEP.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS160', 'CANCELAR', '', 'CEP',
//    CEPs.dataSet.FieldByName('COD_CEP').AsString, CEPs.buscas, true) then
//  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    CEPs.RollBackTransacao;
    CEPs.Cancel;
    inherited;
//  end;
end;

procedure TfrmCadCEP.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      CEPs._AbreBairros;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
      if vDadosIni.vPesquisa <> '' then
        CEPs.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
      	DBLookupComboBox7.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
  	DBLookupComboBox7.SetFocus;
end;

procedure TfrmCadCEP.DBEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vBairro: TBairros;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CEPs._AbreBairros;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
      if vDadosIni.vPesquisa <> '' then
        CEPs.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);

      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
      	DBLookupComboBox7.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vBairro.CadBairro(1);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadCEP.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      CEPs._AbreCidades;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
      if vDadosIni.vPesquisa <> '' then
        CEPs.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
      	DBLookupComboBox6.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
  	DBLookupComboBox6.SetFocus;
end;

procedure TfrmCadCEP.DBEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCidade: TCidades;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CEPs._AbreCidades;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
      if vDadosIni.vPesquisa <> '' then
        CEPs.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);

      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
      	DBLookupComboBox6.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vCidade.CadCidade(1);
    finally
      Screen.Cursor := crDefault;
      DtmCadBasicos.qrAbreCidades.Active := false;
      DtmCadBasicos.qrAbreCidades.Active := true;
    end;
  end;
end;

procedure TfrmCadCEP.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadCEP.DBLookupComboBox1DropDown(Sender: TObject);
begin
  inherited;
  DtmCadBasicos.qrAbreEstados.Active := false;
  DtmCadBasicos.qrAbreEstados.Active := true;
end;

procedure TfrmCadCEP.DBLookupComboBox1Exit(Sender: TObject);
begin
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if CEPs.dataSet.FieldByName('COD_ESTADO').IsNull then
    begin
      Application.MessageBox('UF não informado.' + chr(13) + 'Campo Requerido.',
        'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
      	DBLookupComboBox1.SetFocus;
    end
    else
    begin
      CEPs.dataSet.FieldByName('ESTADO').AsString := CEPs.retornaValor('SELECT NOME_UF AS VALOR FROM ESTADOS WHERE CODIGO_UF = ' + CEPs.dataSet.FieldByName('COD_ESTADO').AsString);
      CEPs.dataSet.FieldByName('SIGLA_ESTADO').AsString := CEPs.retornaValor('SELECT SIGLA_UF AS VALOR FROM ESTADOS WHERE CODIGO_UF = ' + CEPs.dataSet.FieldByName('COD_ESTADO').AsString);
    end;
end;

procedure TfrmCadCEP.DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vEstado: TEstados;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CEPs._AbreEstados;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('ESTADOS');
      if vDadosIni.vPesquisa <> '' then
        CEPs.dataSet.FieldByName('COD_ESTADO').asinteger := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vEstado.CadEstado(1);
    finally
      Screen.Cursor := crDefault;
    end;
  end;

end;

procedure TfrmCadCEP.DBLookupComboBox6Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not CEPs._SetNomeCidade then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) then
      	DBEdit11.SetFocus;
end;

procedure TfrmCadCEP.DBLookupComboBox6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCidade: TCidades;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CEPs._abreCidades;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
      if vDadosIni.vPesquisa <> '' then
        CEPs.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
      	DBLookupComboBox6.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vCidade.CadCidade(1);
    finally
      Screen.Cursor := crDefault;
    end;
  end;

end;

procedure TfrmCadCEP.DBLookupComboBox7Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not CEPs._SetNomeBairro then
     	if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
      	DBEdit10.SetFocus;

  if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
  	DBEdit9.SetFocus;
end;

procedure TfrmCadCEP.DBLookupComboBox7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vBairro: TBairros;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CEPs._AbreBairros;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
      if vDadosIni.vPesquisa <> '' then
        CEPs.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);

      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
      	DBLookupComboBox7.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vBairro.CadBairro(1);
    finally
      DtmCadBasicos.qrAbreBairros.Active := false;
      DtmCadBasicos.qrAbreBairros.Active := true;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadCEP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CEPs.Cancel;
  CEPs.RollBackTransacao;
  CEPs.free;
  Action := caFree;
  frmCadCEP := nil;

end;

procedure TfrmCadCEP.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  CEPs := TCEP.create;
  DBGrid1.DataSource := DtmCadBasicos.dsCEPs;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadCEP.FormKeyDown(Sender: TObject; var Key: Word;
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
    if PageControl3.ActivePage = TabSheet3 then
      BitBtn5Click(Sender);
  end;

end;

procedure TfrmCadCEP.FormShow(Sender: TObject);
begin
  inherited;


  if vShow <> 1 then
  begin
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    DBGrid1.DataSource := DtmCadBasicos.dsCEPs;

  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  CheckBox3.Visible := false;
  CheckBox1.Visible := false;
  SpeedButton3.Visible := false;

end;

procedure TfrmCadCEP.SpeedButton1Click(Sender: TObject);
begin
  try
    if CEPs.dataSet.IsEmpty then
      exit;
    if CEPs.Edit then
    begin
      inherited;
      PageControl1.ActivePage := TabSheet1;
      TabSheet1.Show;
      TabSheet3.Caption := 'Alterar CEP';
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;

      CEPs._AbreEstados;
      CEPS._AbreCidades;
      CEPs._AbreBairros;
    end
    else
    begin
      Application.MessageBox('Erro ao editar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      TabSheet2.show;
      CEPs.RollBackTransacao;
      CEPs.Cancel;
      Exit;
    end;
  except
    Application.MessageBox('Erro ao editar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.show;
    CEPs.RollBackTransacao;
    CEPs.Cancel;
    Exit;
  end;
end;

procedure TfrmCadCEP.SpeedButton25Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS158', 'ABRIR A LIXEIRA', '', 'CEP',
      '', CEPs.buscas, true) then
    begin
      inherited;
      if not CEPs._AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS156]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS155]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;
  except
    Application.MessageBox('Erro ao abrir lixeira. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.show;
    CEPs.RollBackTransacao;
    CEPs.Cancel;
    Exit;
  end;
end;

procedure TfrmCadCEP.SpeedButton2Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS156', '', '', 'CEP', '', CEPs.buscas, false) then
    begin
      inherited;
      CEPs.Delete;
      if CEPs._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
  except
    Application.MessageBox('Erro ao editar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.show;
    CEPs.RollBackTransacao;
    CEPs.Cancel;
    Exit;
  end;
end;

procedure TfrmCadCEP.SpeedButton5Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS157', '', '', 'CEP', '', CEPs.buscas, false) then
    begin
      inherited;
      CEPs._RestaurarLixeira;
      if CEPs._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
  except
    Application.MessageBox('Erro ao restaurar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.show;
    CEPs.RollBackTransacao;
    CEPs.Cancel;
    Exit;
  end;
end;

end.

