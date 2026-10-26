unit uManutArqCript;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, uEditHw, StdCtrls, Buttons;

type
  TfrmManutencaoArqAuxCript = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    EditHw1: TEditHw;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Label7: TLabel;
    Edit5: TEdit;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    Label10: TLabel;
    Edit8: TEdit;
    Label6: TLabel;
    Edit9: TEdit;
    Label11: TLabel;
    Edit10: TEdit;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    sWinDir: AnsiString;
    function codifica(wtexto: string): string;
  public
    { Public declarations }
  end;

var
  frmManutencaoArqAuxCript: TfrmManutencaoArqAuxCript;

implementation

uses IniFiles;

function _getMd5(Value: WideString): WideString; stdcall; external 'MD5XE3.dll';

{$R *.dfm}

procedure TfrmManutencaoArqAuxCript.BitBtn1Click(Sender: TObject);
var
  arquivo: TIniFile;
  ArqIni: string;
begin
  try
    StrToInt(Edit1.Text);
  except
    Application.MessageBox('Erro de conversão, numero do caixa inválido', 'Atenção', 0 + 64);
    exit;
  end;

  if RadioButton1.Checked then
    ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw'
  else
    ArqIni := sWinDir + '\nserie.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    arquivo.WriteString(Trim(Edit1.Text), 'N', codifica(Trim(Edit2.Text)));
    arquivo.WriteString('T', 'A', codifica(Trim(Edit1.Text)));
  finally
    arquivo.free;
  end;
end;

procedure TfrmManutencaoArqAuxCript.BitBtn2Click(Sender: TObject);
var
  arquivo: TIniFile;
  ArqIni: string;
  vtemp: string;
begin
  try
    StrToInt(Edit3.Text);
  except
    Application.MessageBox('Erro de conversão, numero do caixa inválido', 'Atenção', 0 + 64);
    exit;
  end;

  if RadioButton1.Checked then
    ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw'
  else
    ArqIni := sWinDir + '\nserie.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    vtemp := trim(format('%0.2f', [EditHw1.AsValue]));
      vtemp := StringReplace(vtemp, ',', '', [rfReplaceAll, rfIgnoreCase]);
      vtemp := StringReplace(vtemp, '.', '', [rfReplaceAll, rfIgnoreCase]);
    arquivo.WriteString(Trim(Edit3.Text), 'G', codifica(vtemp) );
  finally
    arquivo.free;
  end;
end;

procedure TfrmManutencaoArqAuxCript.BitBtn3Click(Sender: TObject);
var
  arquivo: TIniFile;
  ArqIni: string;
begin
  if RadioButton1.Checked then
    ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw'
  else
    ArqIni := sWinDir + '\nserie.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    arquivo.WriteString('Empresa Desenvolvedora', 'CNPJ', codifica(Trim(Edit4.Text)));
    arquivo.WriteString('Empresa Desenvolvedora', 'IE', codifica(Trim(Edit5.Text)));
    arquivo.WriteString('Empresa Desenvolvedora', 'IM', codifica(Trim(Edit6.Text)));
    arquivo.WriteString('Empresa Desenvolvedora', 'NOMEEMPRESA', codifica(Trim(Edit7.Text)));
    arquivo.WriteString('Empresa Desenvolvedora', 'NOMEPAF', codifica(Trim(Edit8.Text)));
    arquivo.WriteString('Empresa Desenvolvedora', 'VERSAO', codifica(Trim(Edit9.Text)));
    arquivo.WriteString('Empresa Desenvolvedora', 'MD5LISTA', codifica(Trim(Edit10.Text)));
    arquivo.WriteString('Empresa Desenvolvedora', 'MD5DADOS', codifica(
      UpperCase(_getMd5(
      Trim(Edit4.Text) + '|' +
      Trim(Edit5.Text) + '|' +
      Trim(Edit6.Text) + '|' +
      Trim(Edit7.Text) + '|' +
      Trim(Edit8.Text) + '|' +
      Trim(Edit9.Text) + '|' +
      Trim(Edit10.Text) + '|')))
    );
  finally
    arquivo.free;
  end;
end;

procedure TfrmManutencaoArqAuxCript.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

function TfrmManutencaoArqAuxCript.codifica(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));
  wnormal := '  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*:\/.';
  wcripto := 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºusabcd';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  codifica := wresultado;
end;

procedure TfrmManutencaoArqAuxCript.FormShow(Sender: TObject);
var
  nTam: Integer;
begin
  nTam := MAX_PATH;
  SetLength(sWinDir, nTam);
  GetSystemDirectory(pchar(sWinDir), nTam);
  nTam := 1;
  while nTam <= Length(sWinDir) do
  begin
    if sWinDir[nTam] = #0 then
    begin
      Delete(sWinDir, nTam, Length(sWinDir) - nTam + 1 );
      Break;
    end;
    Inc(nTam);
  end;
end;

end.

