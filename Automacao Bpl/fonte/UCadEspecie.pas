unit UCadEspecie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, uClassesCadastrosBasicos;

type
  TfrmCadEspecie = class(TfrmCadPadraoM)
    Label_Codigo: TLabel;
    Label9: TLabel;
    DBEdit_Codigo: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBMemo_Observacao: TDBMemo;
    DBEdit_Descricao: TDBEdit;
    procedure DBEdit_DescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_DescricaoEnter(Sender: TObject);
    procedure DBMemo_ObservacaoEnter(Sender: TObject);
    procedure DBMemo_Observacao1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadEspecie: TfrmCadEspecie;
  Especies: TEspecie;
implementation
uses uDtmAtivo, UDtmCadastrosBasicos, DB;
{$R *.dfm}

procedure TfrmCadEspecie.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS138]';

  if vDadosIni.PesqPros('BAS134', 'PESQUISAR', '', 'ESPECIE_VEICULO', '', Especies.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Especies.ConsultaCampos('ESPECIE_VEICULO', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if not Especies.ConsultaCampos('ESPECIE_VEICULO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;
          
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if Especies._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
   // Cores.ultimasql := Cidade.dataset.CommandText;
   if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadEspecie.BitBtn3Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS135', 'INSERIR', '', 'ESPECIE_VEICULO',
      '', Especies.buscas, true) then
    begin
      if Especies.Insert then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar espécie';
        TabSheet3.TabVisible := true;
        TabSheet3.Show;
        if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
          DBEdit_Descricao.SetFocus;
        DBEdit_Codigo.Visible := false;
        Label_Codigo.Visible := False;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Especies.Cancel;
    Especies.RollBackTransacao;
  end;
end;

procedure TfrmCadEspecie.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not Especies.post then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Especies.vNomeCampoErro, Especies.vMensagemErro);
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
      if Especies.Insert then
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

procedure TfrmCadEspecie.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS142', 'CANCELAR', '', 'ESPECIE_VEICULO',
    Especies.dataSet.FieldByName('CODIGO_ESP').AsString, Especies.buscas, true) then
  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    Especies.Cancel;
    Especies.RollBackTransacao;
    inherited;
  end;

end;

procedure TfrmCadEspecie.DBEdit_DescricaoEnter(Sender: TObject);
begin
  inherited;
  DBEdit_Descricao.SelectAll;
end;

procedure TfrmCadEspecie.DBEdit_DescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  Especies.dataSet.FieldByName('DESCRICAO_ESP').Text := DBEdit_Descricao.Text;

end;

procedure TfrmCadEspecie.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadEspecie.DBMemo_ObservacaoEnter(Sender: TObject);
begin
  inherited;
  DBMemo_Observacao.SelectAll;
end;

procedure TfrmCadEspecie.DBMemo_Observacao1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //Caracteres maíusculos
  Key := AnsiUpperCase(Key)[Length(Key)];
end;

procedure TfrmCadEspecie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Especies.Cancel;
  Especies.RollBackTransacao;
  Especies.free;
  Action := caFree;
  frmCadEspecie := nil;

end;

procedure TfrmCadEspecie.FormCreate(Sender: TObject);
begin
  inherited;
  TelaCadastro := vDadosIni.vTipoForm;
  Especies := TEspecie.create;
  DBGrid1.DataSource := DtmCadBasicos.dsEspecies;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);
    
 if vDadosIni.vModalOuChild <> 'M' then
   FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadEspecie.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadEspecie.FormShow(Sender: TObject);
begin
  inherited;
  if vShow <> 1 then
  begin
    inherited;
    DBGrid1.DataSource := DtmCadBasicos.dsEspecies;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  CheckBox3.Visible := false;
  CheckBox1.Visible := false;
  SpeedButton3.Visible := false;
  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadEspecie.SpeedButton1Click(Sender: TObject);
begin
  try
    if Especies.dataSet.IsEmpty then
     exit;
     if Especies.Edit then
     begin
       inherited;
       PageControl1.ActivePage := TabSheet1;
       TabSheet1.Show;
       TabSheet3.Caption := 'Alterar espécie';
       TabSheet3.TabVisible := true;
       PageControl3.ActivePage := TabSheet3;
       Label_Codigo.Visible := true;
       DBEdit_Codigo.Visible := true;
       if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
         DBEdit_Descricao.SetFocus;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Especies.Cancel;
    Especies.RollBackTransacao;
  end;
end;

procedure TfrmCadEspecie.SpeedButton25Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS140', 'ABRIR A LIXEIRA', '', 'ESPECIE_VEICULO',
      '', Especies.buscas, true) then
    begin
      inherited;
      if not Especies._AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS138]';
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS137]';
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
      end;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Especies.Cancel;
    Especies.RollBackTransacao;
  end;
end;

procedure TfrmCadEspecie.SpeedButton2Click(Sender: TObject);
begin
  try
   inherited;
   if not Especies.Delete then
     exit;
   if Especies._StatusLixeira then
     SpeedButton25.Visible := true
   else
     SpeedButton25.Visible := false;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Especies.Cancel;
    Especies.RollBackTransacao;
  end;
end;

procedure TfrmCadEspecie.SpeedButton5Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS139', '', '', 'ESPECIE_VEICULO', '', Especies.buscas, false)

    then
    begin
      inherited;
      Especies._RestaurarLixeira;
      if Especies._StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Especies.Cancel;
    Especies.RollBackTransacao;
  end;
end;

initialization
  RegisterClass(TfrmCadEspecie);
finalization
  UnRegisterClass(TfrmCadEspecie);

end.

