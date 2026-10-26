unit UCadContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, uclassescadastrosbasicos;

type
  TfrmCadContrato = class(TfrmCadPadraoM)
    BitBtn_Editor: TBitBtn;
    Label6: TLabel;
    Label_Codigo: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    DBEdit_Descricao: TDBEdit;
    DBEdit_Codigo: TDBEdit;
    DBComboBox_Tabela: TDBComboBox;
    DBComboBox_Campo: TDBComboBox;
    DBRichEdit_Texto: TDBRichEdit;
    Label7: TLabel;
    GroupBox6: TGroupBox;
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn_EditorClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure _ApresentarEditor(Sender : TObject);
  public
    { Public declarations }
     Contratos : TContratos;
     _AbrirnoEditor_ : boolean;
     _Acao_ : string;
     _Codigo_ : integer;
     _Texto_ : TMemo;
     _Descricao_ : string;
     _Form_ : TfrmCadContrato;
  end;

var
  frmCadContrato: TfrmCadContrato;


implementation
uses
    ueditor,uDtmAtivo,udtmCadastrosBasicos, DB, uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadContrato.BitBtn1Click(Sender: TObject);
begin
SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS180]';

  if vDadosIni.PesqPros('BAS176', 'PESQUISAR', '', 'CONTRATO', '',
Contratos.buscas, true) then
  begin
   if (_AbrirnoEditor_) then
   begin
   ComboBox1.Text := '';
   ComboBox1.Text := 'Todos';
   end;
    inherited;
    if MaskEdit2.Visible then
    begin
      if not Contratos.ConsultaCampos('CONTRATO', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if Contratos.ConsultaCampos('CONTRATO', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
      		ComboBox1.SetFocus;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if Contratos._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadContrato.BitBtn3Click(Sender: TObject);
begin
  try
    if vDadosIni.PesqPros('BAS177', 'INSERINDO NOVO REGISTRO', '', 'CONTRATO',
     '', Contratos.buscas, true) then
    begin
      {Quando ele é aberto pelo editor tem vezes que ele já está no modo de inserção,
      para entrar assim mesmo foi feito a validação State = dsInsert}
      if (Contratos.Insert) or (Contratos.dataSet.State = dsInsert) then
      begin
        inherited;
        TabSheet3.Caption := 'Cadastrar Contrato';
        TabSheet3.TabVisible := true;
        {Estão sendo zerados os valores por que quando o formulário é salvo
        no editor da erro nas configurações do IDX do formulário padrão}
        Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger := 0;
        Contratos.dataSet.FieldByName('CODIGO').AsInteger := 0;
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
    Contratos.Cancel;
    Contratos.RollBackTransacao;
  end;

end;

procedure TfrmCadContrato.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
		BitBtn4.SetFocus;

  if not Contratos.Post then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
    	DBEdit_Descricao.SetFocus;
  end
  else
  begin
    if CheckCadSeq.Checked then
    begin
      if Contratos.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
        	DBEdit_Descricao.SetFocus;
      MudaCor;
    end
    else
    begin
      if(_AbrirnoEditor_) then
        Close;
      inherited;
    end;
  end;
end;

procedure TfrmCadContrato.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS184','CANCELAR', '','CONTRATO',
    Contratos.dataSet.FieldByName('COD_CONTRATO').AsString, Contratos.buscas, true) then
  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    Contratos.Cancel;
    Contratos.RollBackTransacao;

    if(_AbrirnoEditor_) then
    close;

    inherited;
  end;

end;

procedure TfrmCadContrato.BitBtn_EditorClick(Sender: TObject);
begin
  try
    if not vDadosIni.PesqPros('BAS203', 'ACESSAR EDITOR DE TEXTO', '', 'CONTRATO',
     '', Contratos.buscas, true) then
      exit;

    Application.CreateForm(TfrmEditor, FrmEditor);
    frmEditor._TipodeRegistro := 'V';
    FrmEditor.ShowModal;
    {Dependendo do que for feito no formulário ele inativa o dataset e bloqueia
    algumas funções, o código abaixo é para colocar o dataset em dsbrowser novamente}
    if Contratos.dataSet.State = dsInactive then
      BitBtn1Click(Sender);
  except
  	Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    frmEditor.Close;
    frmEditor.Free;
  end;
end;

procedure TfrmCadContrato.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   if not(_AbrirnoEditor_) then
   begin
  Contratos.Cancel;
  Contratos.RollBackTransacao;
  Contratos.free;
  Action := caFree;
  frmCadContrato := nil;
   end;

end;

procedure TfrmCadContrato.FormCreate(Sender: TObject);
begin
  inherited;
 TelaCadastro := vDadosIni.vTipoForm;
  Contratos := TContratos.create;
  DBGrid1.DataSource := DtmCadBasicos.dsContratos;
  //Configuração de colunas
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);

end;

procedure TfrmCadContrato.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadContrato.FormShow(Sender: TObject);
begin
  inherited;
	if (vShow <> 1) then
  begin
    inherited;
    DBGrid1.DataSource := DtmCadBasicos.dsContratos;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

    CheckBox3.Visible := false;
    CheckBox1.Visible := false;
    SpeedButton3.Visible := false;


    {Função para quando for gravar informações enquanto o Editor estiver sendo
    manipulado}
    _ApresentarEditor(Sender);

end;

procedure TfrmCadContrato.SpeedButton1Click(Sender: TObject);
begin
  try
    if not Contratos.dataSet.IsEmpty then
      if vDadosIni.PesqPros('BAS178', 'EDITANDO REGISTRO', '', 'CONTRATO',
      	Contratos.dataSet.FieldByName('COD_CONTRATO').AsString, Contratos.buscas, true) then
      begin
        if Contratos.dataSet.FieldByName('ATIVO').AsInteger = 1 then
          if Contratos.Edit then
          begin
            inherited;
            PageControl1.ActivePage := TabSheet1;
            TabSheet1.Show;
            TabSheet3.Caption := 'Alterar Contrato';
            TabSheet3.TabVisible := true;
            PageControl3.ActivePage := TabSheet3;

           Label_Codigo.Visible := true;
           DBEdit_Codigo.Visible := true;
           Contratos._PreencheCampos;
          end;
      end;

  except
  	Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Contratos.Cancel;
    Contratos.RollBackTransacao;
  end;
end;

procedure TfrmCadContrato.SpeedButton25Click(Sender: TObject);
begin
try
  if vDadosIni.PesqPros('BAS182', 'ABRIR A LIXEIRA', '', 'CONTRATO',
        '', Contratos.buscas, true) then
  begin
    inherited;
    if not Contratos._AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS180]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS179]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
except
Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Contratos.Cancel;
    Contratos.RollBackTransacao;
end;

end;

procedure TfrmCadContrato.SpeedButton2Click(Sender: TObject);
begin
try
  if vDadosIni.PesqPros('BAS180', '', '', 'CONTRATO', '', Contratos.buscas, false) then
  begin
    inherited;
    Contratos.Delete;
    if Contratos._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;

except
Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Contratos.Cancel;
    Contratos.RollBackTransacao;
end;

end;

procedure TfrmCadContrato.SpeedButton5Click(Sender: TObject);
begin
try
  if vDadosIni.PesqPros('BAS181', '', '', 'CONTRATO', '', Contratos.buscas, false) then
  begin
    inherited;
    Contratos._RestaurarLixeira;
    if Contratos._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
except
Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Contratos.Cancel;
    Contratos.RollBackTransacao;
end;

end;

procedure TfrmCadContrato.SpeedButton6Click(Sender: TObject);
var
codigo : string;
descricao : string;
texto : string;
begin
try

if not vDadosIni.PesqPros('BAS203', 'ACESSAR EDITOR DE TEXTO', '', 'CONTRATO',
   '', Contratos.buscas, true) then
  begin
    exit;
  end;

  if (Contratos.dataset.FieldByName('ATIVO').AsInteger = 0) then
  begin
  ShowMessage('Na lixeira, não podem ser realizadas manutenções pelo editor');
  exit;
  end;

  inherited;
  if(Contratos.dataset.FieldByName('CODIGO').Text <> '') then
  begin
  codigo := Contratos.dataset.FieldByName('CODIGO').Text;
  descricao := Contratos.dataSet.FieldByName('DESCRICAO').AsString;
  texto := Contratos.dataSet.FieldByName('TEXTO').AsString;
  Application.CreateForm(TfrmEditor, FrmEditor);

  frmEditor.FCodContrato := StrToInt(codigo);
  frmEditor.FNomeArquivo := descricao;
  frmEditor.FTexto := texto;
  frmEditor._TipodeRegistro := 'V';
  FrmEditor.ShowModal;
  {Dependendo do que for feito no formulário ele inativa o dataset e bloqueia
  algumas funções, o código abaixo é para colocar o dataset em dsbrowser novamente}
  if Contratos.dataSet.State = dsInactive then
  BitBtn1Click(Sender);
  end
  else
  begin
    ShowMessage('Selecione um item para realizar a manutenção no editor.');
  end;
except
Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    Contratos.Cancel;
    Contratos.RollBackTransacao;
end;
end;

procedure TfrmCadContrato._ApresentarEditor(Sender: TObject);
begin
         if(_AbrirnoEditor_) then
  begin
      if(_Acao_ = 'NOVO')then
      begin
         BitBtn3Click(Sender);
         DBRichEdit_Texto.Lines.LoadFromFile(ExtractFileDir(Application.ExeName) + '\temp~' +
  FormatDateTime('ddmmyyyy', Now) + '.rtf');
        DBRichEdit_Texto.Enabled := false;
      end
      else
      if (_Acao_= 'EDITAR') then
      begin
          BitBtn1Click(Sender);
          Contratos.dataSet.IndexFieldNames  := 'CODIGO';
          Contratos.dataSet.FindNearest([_Codigo_]);
          SpeedButton1Click(Sender);
          DBRichEdit_Texto.Lines.LoadFromFile(ExtractFileDir(Application.ExeName) + '\temp~' +
  FormatDateTime('ddmmyyyy', Now) + '.rtf');
          DBRichEdit_Texto.Enabled := false;
      end;
  end;
end;

end.
