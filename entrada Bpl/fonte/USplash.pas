unit USplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TeeProcs, TeEngine, Chart, StdCtrls, Gauges, jpeg;

type
  TfrmSplash = class(TForm)
    Chart3: TChart;
    Label2: TLabel;
    Label3: TLabel;
    Gauge1: TGauge;
    Timer1: TTimer;
    Image1: TImage;
    Image3: TImage;
    Label6: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    labelMenor:string;
  public
    { Public declarations } 
    function getFrasePrimeiraLetraMaiuscula(frase:string):string;
  end;

var
  frmSplash: TfrmSplash;

implementation

uses
  ShellAPI, uDtmAtivo, uDadosIni;

{$R *.DFM}

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
  frmSplash := nil;
end;

procedure TfrmSplash.FormShow(Sender: TObject);
begin
  if vDadosIni.vExibirSplash = 'N' then
    exit;
  if (FileExists(ExtractFilePath(Application.ExeName) + 'logoSplash.wmf')) then
  begin
    Image1.Picture.RegisterFileFormat('wmf,*.wmf', 'WMF', TMetafile);
    Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logoSplash.wmf');
  end;
//  if vDadosIni.vStarColor <> '' then
//    Chart3.Gradient.StartColor := StrToInt64(vDadosIni.vStarColor);
//  if vDadosIni.vEndColor <> '' then
//    Chart3.Gradient.EndColor := StrToInt64(vDadosIni.vEndColor);
  if UpperCase(vDadosIni.vChaveEmpresa) <> 'HW'then
  begin
    Caption := getFrasePrimeiraLetraMaiuscula(vDadosIni.vEmpDesNomeEmp);
    Label3.Caption := labelMenor;
    Label4.Caption := 'Telefone: '+vDadosIni.vEmpDesFone;
    Label1.Caption := vDadosIni.vEmpDesSite;
    Label5.Visible := False;
  end;
end;

function TfrmSplash.getFrasePrimeiraLetraMaiuscula(frase: string): string;
var
  fraseMont:string;
  I,j: Integer;
  sigla:char;
begin
  fraseMont := trim(LowerCase(frase));
  if pos(' ',fraseMont) > 0 then
  begin
    fraseMont := UpperCase(Copy(fraseMont,1,1))+Copy(fraseMont,2,length(fraseMont));
    j:=0;
    for I := 1 to length(fraseMont) do
    begin
      if fraseMont[i] = ' ' then
      begin
        if j = 1 then
          labelMenor := trim(copy(fraseMont,1,i));       
        if fraseMont[i+2] <> ' ' then
          fraseMont[i+1] := upperCase(fraseMont[i+1])[1];
        inc(j);
      end;
    end;
    Result := fraseMont;
  end
  else
    Result:= UpperCase(Copy(fraseMont,1,1))+Copy(fraseMont,2,length(fraseMont));
end;

procedure TfrmSplash.Label1Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(Label1.Caption), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmSplash.Timer1Timer(Sender: TObject);
var
  i, j, Aloop: integer;
begin
  Aloop := 20000;//normal
//  Aloop := 90000;//teste
  Gauge1.MaxValue := Aloop;
  Timer1.Enabled := false;
  if vDadosIni.vExibirSplash = 'S' then
    for i := 0 to Aloop do
    begin
      for j := 0 to Aloop do
      begin
        if i = j then
        begin
          Gauge1.Progress := Gauge1.Progress + 1;
          if Gauge1.Progress >= Gauge1.MaxValue then
            Close;
        end;
      end;
    end;
  Close;
end;

end.

