unit UCadKitsOpcionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, Buttons, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, UClassesCadastrosBasicos;

type
  TfrmCadKitsOpcionais = class(TfrmCadPadraoM)
    Label_Codigo: TLabel;
    Label7: TLabel;
    DBEdit_Codigo: TDBEdit;
    DBEdit_Descricao: TDBEdit;
    BitBtn_Adicionar: TBitBtn;
    DBMemo_Opcionais: TDBMemo;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn_AdicionarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadKitsOpcionais: TfrmCadKitsOpcionais;
  _ObKits : TKitsVeiculos;

implementation
uses
     UListar,uDtmAtivo,UDtmCadastrosBasicos;
{$R *.dfm}

procedure TfrmCadKitsOpcionais.BitBtn1Click(Sender: TObject);
begin
	SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS198]';

  if vDadosIni.PesqPros('BAS194', 'PESQUISAR', '', 'KITS_VEICULOS', '', _ObKits.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not _ObKits.ConsultaCampos('KITS_VEICULOS', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if _ObKits.ConsultaCampos('KITS_VEICULOS', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if _ObKits._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
      
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadKitsOpcionais.BitBtn3Click(Sender: TObject);
begin
  try
      if vDadosIni.PesqPros('BAS195', 'INSERINDO NOVO REGISTRO', '', 'KITS_VEICULOS',
   '', _ObKits.buscas, true) then
  begin
    if _ObKits.Insert then
    begin
      inherited;
      TabSheet3.Caption := 'Cadastrar kit';
      TabSheet3.TabVisible := true;
      TabSheet3.Show;
      if (Self.Enabled) and (Self.Visible) and (DBEdit_Descricao.CanFocus) then
      	DBEdit_Descricao.SetFocus;
      DBEdit_Codigo.Visible := false;
      Label_Codigo.Visible := False;
      DBMemo_Opcionais.Lines.Clear;
    end;
  end;

except
Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    _ObKits.Cancel;
    _ObKits.RollBackTransacao;
end;
end;

procedure TfrmCadKitsOpcionais.BitBtn_AdicionarClick(Sender: TObject);
begin
   inherited;
      Application.CreateForm(TfrmListar, FrmListar);
      frmListar._Tabela_ := 'OPCIONAIS';
      FrmListar.ShowModal;
      if FrmListar._Registro <> '' then
      begin
        DBMemo_Opcionais.Lines.Add(FrmListar._Registro);
      end;
      if frmListar._CampoChave <> '' then
        _ObKits._vKitsOpcionais.dataSet.FieldByName('COD_OPCIONAIS').AsString := frmListar._CampoChave;

end;

procedure TfrmCadKitsOpcionais.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadKitsOpcionais.SpeedButton1Click(Sender: TObject);
begin
try
  if not _ObKits.dataSet.IsEmpty then
    if vDadosIni.PesqPros('BAS196', 'EDITANDO REGISTRO', '', 'KITS_VEICULOS',
    _ObKits.dataSet.FieldByName('COD_KITS').AsString, _ObKits.buscas, true) then
    begin
      if _ObKits.dataSet.FieldByName('ATIVO').AsInteger = 1 then
        if _ObKits.Edit then
        begin
          inherited;
          PageControl1.ActivePage := TabSheet1;
          TabSheet1.Show;
          TabSheet3.Caption := 'Alterar kits';
          TabSheet3.TabVisible := true;
          PageControl3.ActivePage := TabSheet3;

          Label_Codigo.Visible := true;
          DBEdit_Codigo.Visible := true;
        end;
    end;
except
   Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    _ObKits.Cancel;
    _ObKits.RollBackTransacao;
end;
end;

procedure TfrmCadKitsOpcionais.SpeedButton25Click(Sender: TObject);
begin
try
       if vDadosIni.PesqPros('BAS198', 'ABRIR A LIXEIRA', '', 'KITS_VEICULOS',
        '', _ObKits.buscas, true) then
  begin
    inherited;
    if not _ObKits._AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS198]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS197]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
 except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    _ObKits.Cancel;
    _ObKits.RollBackTransacao;
end;

end;

procedure TfrmCadKitsOpcionais.SpeedButton2Click(Sender: TObject);
begin
try
    if vDadosIni.PesqPros('BAS197', '', '', 'KITS_VEICULOS', '', _ObKits.buscas, false) then
  begin
    inherited;
    _ObKits.Delete;
    if _ObKits._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
except
Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    _ObKits.Cancel;
    _ObKits.RollBackTransacao;
end;

end;

procedure TfrmCadKitsOpcionais.SpeedButton5Click(Sender: TObject);
begin
try
     if vDadosIni.PesqPros('BAS199', '', '', 'KITS_VEICULOS', '', _ObKits.buscas, false) then
  begin
    inherited;
    _ObKits._RestaurarLixeira;
    if _ObKits._StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
except
Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    _ObKits.Cancel;
    _ObKits.RollBackTransacao;

end;

end;

end.
