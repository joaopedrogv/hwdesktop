unit UCadCores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, uClassesCadastrosBasicos, DBCtrls;

type
  TfrmCadCores = class(TfrmCadPadraoM)
    Label_Codigo: TLabel;
    DBEdit_Codigo: TDBEdit;
    Label8: TLabel;
    Label7: TLabel;
    DBEdit_CodigoDENATRAM: TDBEdit;
    Label9: TLabel;
    DBComboBox_TipoPintura: TDBComboBox;
    DBEdit_Descricao: TDBEdit;
    procedure Edit_DescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBComboBox_TipoPinturaDropDown(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    function _UpperCaseAcentuados(const S: string): string;
  public
    { Public declarations }
  end;

var
  frmCadCores: TfrmCadCores;
  Cores: TCores;

implementation
uses uDtmAtivo, UDtmCadastrosBasicos;
{$R *.dfm}


procedure TfrmCadCores.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS111]';

  if vDadosIni.PesqPros('BAS107', 'PESQUISAR', '', 'CODIGO_CORFAB', '', Cores.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Cores.ConsultaCampos('CODIGO_CORFAB', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not Cores.ConsultaCampos('CODIGO_CORFAB', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if Cores._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadCores.BitBtn3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS108', 'INSERIR', '', 'CODIGO_CORFAB',
    '', Cores.buscas, true) then
  begin
    try
      if Cores.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar Cor';
        TabSheet3.TabVisible := true;
        TabSheet3.Show;
        DBEdit_Codigo.Enabled := true;
        if (Self.Enabled) and (Self.Visible) and (DBEdit_Codigo.CanFocus) then
        	DBEdit_Codigo.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit_CodigoDENATRAM.CanFocus) then
	        DBEdit_CodigoDENATRAM.SetFocus;
//        DBEdit_Codigo.Visible := false;
//        Label_Codigo.Visible := False;
      end;
    except
      Application.MessageBox('Erro inseperado, se o erro persistir contacte o administrador da rede', 'Atenção', MB_ICONERROR + MB_OK);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.show;
      Cores.Cancel;
      Cores.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadCores.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not Cores.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Cores.vNomeCampoErro, Cores.vMensagemErro);
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
      if Cores.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
        	DBEdit_Descricao.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadCores.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS115', 'CANCELAR', '', 'CODIGO_CORFAB',
    Cores.dataSet.FieldByName('COD_COR').AsString, Cores.buscas, true) then
  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    Cores.Cancel;
    Cores.RollBackTransacao;
    inherited;
  end;

end;

procedure TfrmCadCores.ComboBox1Enter(Sender: TObject);
begin
  inherited;
  if ((ComboBox1.Items.Count > 1) and (ComboBox1.Items.IndexOf('ATIVO') <> -1)) then
  begin
    ComboBox1.Items.Delete(ComboBox1.Items.IndexOf('ATIVO'));
  end;
end;

procedure TfrmCadCores.DBComboBox_TipoPinturaDropDown(Sender: TObject);
begin
  inherited;
  case DBComboBox_TipoPintura.ItemIndex of
    0: Cores.dataSet.FieldByName('TIPO_PINTURA').AsString := 'M';
    1: Cores.dataSet.FieldByName('TIPO_PINTURA').AsString := 'S';
    2: Cores.dataSet.FieldByName('TIPO_PINTURA').AsString := 'P';
    3: Cores.dataSet.FieldByName('TIPO_PINTURA').AsString := 'F';
  end;

end;

procedure TfrmCadCores.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadCores.Edit_DescricaoKeyPress(Sender: TObject; var Key: Char);
var
  sKey: string;
begin
  sKey := key;

  if key in ['a'..'z'] then
    key := Uppercase(sKey)[1];

end;

procedure TfrmCadCores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Cores.Cancel;
  Cores.RollBackTransacao;
  Cores.free;
  Action := caFree;
  FrmCadCores := nil;
end;

procedure TfrmCadCores.FormCreate(Sender: TObject);
begin
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CORES' then
  begin
    if DtmCadBasicos = nil then
      DtmCadBasicos := TDtmCadBasicos.Create(DtmCadBasicos);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  Cores := TCores.create;
  DBGrid1.DataSource := DtmCadBasicos.dsCores;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadCores.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadCores.FormShow(Sender: TObject);
begin
  inherited;
  if vShow <> 1 then
  begin
    inherited;
    DBGrid1.DataSource := DtmCadBasicos.dsCores;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  if (TelaCadastro = 6) then
    BitBtn3.Click;

  CheckBox3.Visible := false;
  CheckBox1.Visible := false;
  SpeedButton3.Visible := false;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadCores.SpeedButton1Click(Sender: TObject);
var
  tipo_pintura: char;
begin
  try
    if Cores.dataSet.IsEmpty then
      exit;

    if Cores.Edit then
    begin
      inherited;
      PageControl1.ActivePage := TabSheet1;
      TabSheet1.Show;
      TabSheet3.Caption := 'Alterar Cor';
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      if not Cores.dataSet.FieldByName('TIPO_PINTURA').IsNull then
      begin
       if trim(Cores.dataSet.FieldByName('TIPO_PINTURA').AsString) = 'M' then
        DBComboBox_TipoPintura.ItemIndex := 0
       else if trim(Cores.dataSet.FieldByName('TIPO_PINTURA').AsString) = 'S' then
        DBComboBox_TipoPintura.ItemIndex := 1
       else if trim(Cores.dataSet.FieldByName('TIPO_PINTURA').AsString) = 'P' then
        DBComboBox_TipoPintura.ItemIndex := 2
       else if trim(Cores.dataSet.FieldByName('TIPO_PINTURA').AsString) = 'F' then
        DBComboBox_TipoPintura.ItemIndex := 3;
      end;
//      Label_Codigo.Visible := true;
//      DBEdit_Codigo.Visible := true;
      DBEdit_Codigo.Enabled := false;
      if (Self.Enabled) and (Self.Visible) and (DBEdit_Codigo.CanFocus) then
      	DBEdit_Codigo.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit_CodigoDENATRAM.CanFocus) then
        DBEdit_CodigoDENATRAM.SetFocus;
    end;
  except
    Application.MessageBox('Erro inseperado, se o erro persistir contacte o administrador da rede', 'Atenção', MB_ICONERROR + MB_OK);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.show;
    Cores.Cancel;
    Cores.RollBackTransacao;
  end;
end;

procedure TfrmCadCores.SpeedButton25Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS113', 'ABRIR A LIXEIRA', '', 'CODIGO_CORFAB', '', Cores.buscas, true) then
    begin
      inherited;
      if not Cores._AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS111]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS110]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;

  except
    Application.MessageBox('Erro inseperado, se o erro persistr contacte o administrador da rede', 'Atenção', MB_ICONERROR + MB_OK);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.show;
    Cores.Cancel;
    Cores.RollBackTransacao;
  end;
end;

procedure TfrmCadCores.SpeedButton2Click(Sender: TObject);
begin
  try
    inherited;
    if not Cores.Delete then
      exit;
    if Cores._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;

  except
    Application.MessageBox('Erro inseperado, se o erro persistr contacte o administrador da rede', 'Atenção', MB_ICONERROR + MB_OK);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.show;
    Cores.Cancel;
    Cores.RollBackTransacao;
  end;
end;

procedure TfrmCadCores.SpeedButton5Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS112', '', '', 'CODIGO_CORFAB', '', Cores.buscas, false) then
    begin
      inherited;
      Cores._RestaurarLixeira;
      if Cores._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
  except
    Application.MessageBox('Erro inseperado, se o erro persistr contacte o administrador da rede', 'Atenção', MB_ICONERROR + MB_OK);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.show;
    Cores.Cancel;
    Cores.RollBackTransacao;
  end;

end;

function TfrmCadCores._UpperCaseAcentuados(const S: string): string;
var

  Ch: Char;

  L: Integer;

  Source, Dest: PChar;

begin

  L := Length(S);

  SetLength(Result, L);

  Source := Pointer(S);

  Dest := Pointer(Result);

  while L <> 0 do

  begin

    Ch := Source^;

    if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);

    if (Ch >= 'á') and (Ch <= 'ú') then Dec(Ch, 32);

    if (Ch >= 'ã') and (Ch <= 'õ') then Dec(Ch, 32);

    if (Ch >= 'ä') and (Ch <= 'ü') then Dec(Ch, 32);

    if (Ch >= 'à') and (Ch <= 'ù') then Dec(Ch, 32);

    if (Ch >= 'â') and (Ch <= 'û') then Dec(Ch, 32);

    Dest^ := Ch;

    Inc(Source);

    Inc(Dest);

    Dec(L);

  end;
end;

initialization
  RegisterClass(TfrmCadCores);
finalization
  UnRegisterClass(TfrmCadCores);

end.

