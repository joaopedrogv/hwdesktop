unit UFormPadrao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Menus, Controls, Mask,Registry;

type
  TfrmInc = class(TForm)
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    SpeedButton2: TSpeedButton;
    MainMenu1: TMainMenu;
    Produtos1: TMenuItem;
    Clientes1: TMenuItem;
    Margem1: TMenuItem;
    BitBtn6: TBitBtn;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function setFocusCampoErro(pNomeCampoErro:string):boolean;  
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure MostraAjuda(AjudaHtml: string); overload;
    procedure MostraAjuda; overload;
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    procedure _GravaConfiguracoesDouble(NomeVariavel : string; Valor : Double);
    procedure _GravaConfiguracoesBoolean(NomeVariavel : string; Valor : Boolean);
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);
    function _LerConfiguracoesRegistroString(NomeVariavel : string) : string;
    function _LerConfiguracoesRegistroDouble(NomeVariavel : string) : Double;
    //Se de erro ao retornar do regitro ele retorna falso
    function _LerConfiguracoesRegistroBoolean(NomeVariavel : string) : Boolean;
    function _LerConfiguracoesRegistroInteger(NomeVariavel : string) : Integer;
  end;

var
  frmInc: TfrmInc;

implementation

uses ShellAPI;

{$R *.DFM}

procedure TfrmInc.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmInc.CheckBox1Click(Sender: TObject);
begin
  with CheckBox1.Font do
  begin
    if CheckBox1.Checked then
      Color := clRed
    else if not CheckBox1.Checked then
      Color := clBlue;
  end;
end;

procedure TfrmInc.CheckBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := #0;
  end;
end;

procedure TfrmInc.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmInc._GravaConfiguracoesBoolean(NomeVariavel: string;
  Valor: Boolean);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteBool(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmInc._GravaConfiguracoesDouble(NomeVariavel: string;
  Valor: Double);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteFloat(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmInc._GravaConfiguracoesInteger(NomeVariavel: string;
  Valor: Integer);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteInteger(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmInc._GravaConfiguracoesString(NomeVariavel,
  Valor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TfrmInc._LerConfiguracoesRegistroBoolean(
  NomeVariavel: string): Boolean;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Boolean;
begin
  try
    vTemp := False;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadBool(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function TfrmInc._LerConfiguracoesRegistroDouble(
  NomeVariavel: string): Double;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: double;
begin
  try
    vTemp := 0;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadFloat(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function TfrmInc._LerConfiguracoesRegistroInteger(
  NomeVariavel: string): Integer;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Integer;
begin
  try
    vTemp := 0;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadInteger(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function TfrmInc._LerConfiguracoesRegistroString(NomeVariavel : string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    vTemp := '';
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informação da variavel
      vTemp := Registro.ReadString(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmInc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
  frmInc := nil;
end;

procedure TfrmInc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    if CheckBox1.Checked then
      CheckBox1.Checked := False
    else
      CheckBox1.Checked := True;
end;

procedure TfrmInc.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if Key = VK_F1 then
    MostraAjuda;
end;

procedure TfrmInc.FormShow(Sender: TObject);
var
  i: integer;
{$IFDEF VER300}
  ShortDateFormat: string;
{$ENDIF}
begin
{$IFDEF VER300}
  ShortDateFormat := FormatSettings.ShortDateFormat;
{$ENDIF}
  if uppercase(ShortDateFormat[1]) <> 'D' then
    ShortDateFormat := 'dd/mm/yyyy';
  for i := 0 to ComponentCount - 1 do //Testando aqui se o form tem algum campo MaskEdit.
  begin
    if (Components[i] is TMaskEdit) then
      if (pos('  /  /    ', TMaskEdit(Components[i]).Text) <> 0) or
        (pos('  -  -    ', TMaskEdit(Components[i]).Text) <> 0) or
        (pos('  .  .    ', TMaskEdit(Components[i]).Text) <> 0) then
      begin
        if (length(ShortDateFormat) <= 8) and (pos('yyyy', ShortDateFormat) = 0) then
        begin
          TMaskEdit(Components[i]).EditMask := '!99/99/00;1;_';
          TMaskEdit(Components[i]).Text:=datetostr(date);
        end
        else
        begin
          TMaskEdit(Components[i]).EditMask := '!99/99/0000;1;_';
          TMaskEdit(Components[i]).Text:=datetostr(date);
        end;
      end;
  end;
end;

procedure TfrmInc.MostraAjuda;
var
  Parametro, NomeArquivo: string;
  handle: THandle;
  AjudaHtml: string;
begin
  NomeArquivo := ExtractFilePath(ParamStr(0)) + 'Help.chm';
  AjudaHtml := Self.Name;
  if not FileExists(NomeArquivo) then
    raise Exception.CreateFmt('Arquivo de ajuda "%s" não encontrado.', [NomeArquivo]);

  if (AjudaHtml <> '') then
  begin
    Parametro := Format('%s::%s', [NomeArquivo, AjudaHtml + '.html']);
    if ShellExecute(handle, 'open', 'HH.exe', PChar(Parametro), nil, SW_SHOWDEFAULT) <= 32 then
      raise Exception.Create('Não foi possível abrir arquivo');
  end;
end;

procedure TfrmInc.MostraAjuda(AjudaHtml: string);
var
  Parametro, NomeArquivo: string;
  handle: THandle;
begin
  NomeArquivo := ParamStr(2);
  if not FileExists(NomeArquivo) then
    raise Exception.CreateFmt('Arquivo de ajuda "%s" não encontrado.', [NomeArquivo]);

  if (AjudaHtml <> '') then
  begin
    Parametro := Format('%s::%s', [NomeArquivo, AjudaHtml + '.html']);
    if ShellExecute(handle, 'open', 'HH.exe', PChar(Parametro), nil, SW_SHOWDEFAULT) <= 32 then
      raise Exception.Create('Não foi possível abrir arquivo');
  end;
end;

function TfrmInc.setFocusCampoErro(pNomeCampoErro: string): boolean;
begin
  try
    Result := False;
    if FindComponent(pNomeCampoErro) <> nil then
      if TWinControl(FindComponent(pNomeCampoErro)).CanFocus then
      begin
        TWinControl(FindComponent(pNomeCampoErro)).SetFocus;
        Result := True;
      end;
  except
  end;
end;

end.

