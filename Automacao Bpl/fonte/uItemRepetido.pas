unit uItemRepetido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmItemRepetido = class(TForm)
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    BitBtn18: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn19: TBitBtn;
    Label195: TLabel;
    Label197: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label196: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
  private
    function _LerConfiguracoesRegistroString(NomeVariavel : string) : string;
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItemRepetido: TfrmItemRepetido;

implementation

uses uDtmAtivo, uDadosIni, Registry;

{$R *.dfm}

procedure TfrmItemRepetido.BitBtn18Click(Sender: TObject);
begin
   try
      vDadosIni.vPesquisa := 'ITEMREPETIDOALTERAR|OK';
      ModalResult := IDOK;
   finally
      _GravaConfiguracoesString('btAterarAdicionar', 'btAterar');
   end;
end;

procedure TfrmItemRepetido.BitBtn19Click(Sender: TObject);
begin
   vDadosIni.vPesquisa := '';
   ModalResult := IDCANCEL;
end;

procedure TfrmItemRepetido.BitBtn1Click(Sender: TObject);
begin
   try
      vDadosIni.vPesquisa := 'ITEMREPETIDOADICIONAR|OK';
      ModalResult := IDOK;
   finally
      _GravaConfiguracoesString('btAterarAdicionar', 'btAdicionar');
   end;
end;

procedure TfrmItemRepetido.FormShow(Sender: TObject);
begin
  if trim(_LerConfiguracoesRegistroString('btAterarAdicionar')) = 'btAdicionar' then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    	BitBtn1.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (BitBtn18.CanFocus) then
    BitBtn18.SetFocus;
end;

procedure TfrmItemRepetido._GravaConfiguracoesString(NomeVariavel, Valor: string);
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

function TfrmItemRepetido._LerConfiguracoesRegistroString(NomeVariavel: string): string;
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

end.
