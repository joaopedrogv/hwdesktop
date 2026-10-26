unit uGTNSerieECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, iniFiles;

type
  TfrmGtNSerieECF = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function setNumeroSerieCriptografadoEmArquivoAuxiliar(valorDescriptogra:string):boolean;
    function codifica(wtexto: string): string;
    function SetGrandeTotalCriptografadoEmArquivoAuxiliar(valorCriptografado:string):boolean;
  public
    { Public declarations }
  end;

var
  frmGtNSerieECF: TfrmGtNSerieECF;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmGtNSerieECF.Button1Click(Sender: TObject);
begin
  setNumeroSerieCriptografadoEmArquivoAuxiliar(Edit1.Text);
end;

procedure TfrmGtNSerieECF.Button2Click(Sender: TObject);
begin
  SetGrandeTotalCriptografadoEmArquivoAuxiliar(Edit2.Text);
end;

function TfrmGtNSerieECF.codifica(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));
  wnormal := '  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*';
  wcripto := 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºus';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  codifica := wresultado;
end;

function TfrmGtNSerieECF.SetGrandeTotalCriptografadoEmArquivoAuxiliar(
  valorCriptografado: string): boolean;
var
  arquivo:tiNIfILE;
  ArqIni: string;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  arquivo := TIniFile.Create(ArqIni);
  arquivo.WriteString('1', 'G', codifica(valorCriptografado));
  arquivo.free;
  Result := true;
   {
  if not FileExists(ExtractFilePath(Application.ExeName)+'nserie.hw') then
  begin
    AssignFile(arquivo,ExtractFilePath(Application.ExeName)+'nserie.hw');
    Rewrite(arquivo);
    Append(arquivo);
    Writeln(arquivo,codifica(valorCriptografado));
    CloseFile(arquivo);
//    FileSetAttr(ExtractFilePath(Application.ExeName)+'gt.hw',7);
    Result := true;
  end
  else
  begin
    FileSetAttr(ExtractFilePath(Application.ExeName)+'nserie.hw',0);
    AssignFile(arquivo,ExtractFilePath(Application.ExeName)+'nserie.hw');
    Rewrite(arquivo);
    Writeln(arquivo,codifica(valorCriptografado));
    CloseFile(arquivo);
//    FileSetAttr(ExtractFilePath(Application.ExeName)+'gt.hw',7);
    Result := true;
  end;           }
end;

function TfrmGtNSerieECF.setNumeroSerieCriptografadoEmArquivoAuxiliar(
  valorDescriptogra: string): boolean;
var
  arquivo:tiNIfILE;
  ArqIni: string;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  arquivo := TIniFile.Create(ArqIni);
  arquivo.WriteString('1','N',codifica(valorDescriptogra));
  arquivo.free;
  Result := true;
{  Result := false;
  if not FileExists(ExtractFilePath(Application.ExeName)+'nserie.hw') then
  begin
    AssignFile(arquivo,ExtractFilePath(Application.ExeName)+'nserie.hw');
    Rewrite(arquivo);
    Append(arquivo);
    Writeln(arquivo,codifica(valorDescriptogra));
    CloseFile(arquivo);
//    FileSetAttr(ExtractFilePath(Application.ExeName)+'nserie.hw',7);
    Result := true;
  end
  else
  begin
    FileSetAttr(ExtractFilePath(Application.ExeName)+'nserie.hw',0);
    AssignFile(arquivo,ExtractFilePath(Application.ExeName)+'nserie.hw');
    Rewrite(arquivo);
    Writeln(arquivo,codifica(valorDescriptogra));
    CloseFile(arquivo);
//    FileSetAttr(ExtractFilePath(Application.ExeName)+'nserie.hw',7);
    Result := true;
  end;           }
end;

end.
