unit UPesqCXL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask,consultasUCXL, DBClient;

type
  TFrmPesqCxl = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1Change(Sender: TObject);
  private
    { Private declarations }
    FConsulta: TConsultaCXL;
    procedure gravaConfiguracoesRegistro;
    procedure leConfiguracoesRegistro;
  public
    property Consulta: TConsultaCXL read FConsulta write FConsulta;
    { Public declarations }
    { Public declarations }
  end;

var
  FrmPesqCxl: TFrmPesqCxl;

implementation

uses
  Registry;

{$R *.dfm}

procedure TFrmPesqCxl.BitBtn1Click(Sender: TObject);
var
 i:integer;
begin
	if (trim(ComboBox1.Text) = '') then
  begin
  	Application.MessageBox(PChar('Campo de pesquisa não informado.'), 'Informação', MB_OK+MB_ICONINFORMATION);
    if ComboBox1.CanFocus then
    	ComboBox1.SetFocus;
    exit;
  end;

//  if (trim(MaskEdit1.text) = '') then
//  begin
//    Application.MessageBox(PChar('Contéudo não informado.'), 'Informação', MB_OK+MB_ICONINFORMATION);
//    if MaskEdit1.CanFocus then
//    	MaskEdit1.SetFocus;
//    exit;
//  end;

  if radiobutton2.Checked then
  begin
    for I := 0 to FConsulta.CdsPesq.FieldCount - 1 do
    begin
      if FConsulta.CdsPesq.Fields[I].DisplayLabel = ComboBox1.Text then
        FConsulta.vCampoPesq := FConsulta.CdsPesq.Fields[I].FieldName;
    end;
    FConsulta.vFimSql := '';
    if FConsulta.vCampoPesq <> 'TODOS' then
    begin
    	if (trim(FConsulta.vCampoPesq) <> '') and (trim(maskedit1.text) <> '') then
      begin
        if CheckBox1.Checked then
          FConsulta.vFimSql := FConsulta.vFimSql + ' and ' + FConsulta.vCampoPesq + ' = ' + quotedstr(trim(maskedit1.text))
        else
          FConsulta.vFimSql := FConsulta.vFimSql + ' and ' + FConsulta.vCampoPesq + ' like ' + quotedstr(trim(maskedit1.text) + '%');
      end;
      FConsulta.vFimSql := FConsulta.vFimSql + ' order by n_doc_c,nome_c ';
    end;
    if FConsulta.vCampoPesq<>'' then
       FConsulta.Pesquisar(FConsulta.vCampoPesq, '', maskedit1.Text, FConsulta.CdsPesq);
  end;
  gravaConfiguracoesRegistro;
end;

procedure TFrmPesqCxl.ComboBox1Enter(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        exit;
      end;
    end;
  end;
end;

procedure TFrmPesqCxl.ComboBox1Exit(Sender: TObject);
begin
  if uppercase(ComboBox1.Text) <> 'TODOS' then
    ComboBox1.Text := ComboBox1.Items[ComboBox1.ItemIndex]
  else
    ComboBox1.Text := 'Todos';
end;

procedure TFrmPesqCxl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 action:=caFree;
end;

procedure TFrmPesqCxl.FormShow(Sender: TObject);
begin
 FConsulta.RetornaAtributos(ComboBox1);
 ComboBox1.Items.Delete(ComboBox1.Items.IndexOf('DIF'));
 leConfiguracoesRegistro;
end;

procedure TFrmPesqCxl.gravaConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName + '\' + Consulta.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(ComboBox1.Name, ComboBox1.Text);
      Registro.WriteString(MaskEdit1.Name, MaskEdit1.Text);
      Registro.WriteString(MaskEdit2.Name, MaskEdit2.Text);
      Registro.WriteBool(CheckBox1.Name, CheckBox1.Checked);

      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmPesqCxl.leConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName+'\'+Consulta.ClassName, True);
      // Grava as informações do form
      vTemp := Registro.ReadString(ComboBox1.Name);
      if (vTemp <> '') then
        ComboBox1.Text := vTemp;
      vTemp := Registro.ReadString(MaskEdit1.Name);
      if vTemp <> '' then
        MaskEdit1.Text := vTemp;
      vTemp := Registro.ReadString(MaskEdit2.Name);
      if vTemp <> '' then
        MaskEdit2.Text := vTemp;
      if CheckBox1.Enabled then
        CheckBox1.Checked := Registro.ReadBool(CheckBox1.Name);

      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmPesqCxl.MaskEdit1Change(Sender: TObject);
begin
   if (radiobutton1.Checked) AND (Trim(MaskEdit1.Text) <> '')  then
    FConsulta.Pesquisar(ComboBox1.Text,'',maskedit1.Text,FConsulta.CdsPesq);
end;

end.
