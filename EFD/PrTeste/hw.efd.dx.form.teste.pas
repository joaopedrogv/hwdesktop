unit hw.efd.dx.form.teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    edBanco: TEdit;
    edEmpresa: TEdit;
    edUsuario: TEdit;
    edNivel: TEdit;
    edCNPJ: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  System.DateUtils;

function hw_gerarEFD_ICMSIPI(ACodEmpresa, AEnderecoBanco, AUsuario, ANivel: WideString): Boolean; stdcall; external 'hw.efd.dx.dll';
function hw_gerarEFD_ICMSIPI_PAFECF(ACodEmpresa, AEnderecoBanco, ADataIni, ADataFim, ANomeArquivo, AUsuario, ANivel: WideString): string; stdcall; external 'hw.efd.dx.dll';
function hw_gerarEFD_Contribuicoes(AEnderecoBanco, ACNPJ, AUsuario, ACodEmpresa, ANivel: WideString): Boolean; stdcall; external 'hw.efd.dx.dll';

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  hw_gerarEFD_ICMSIPI(edEmpresa.Text, edBanco.Text, edUsuario.Text, edNivel.Text);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  hw_gerarEFD_Contribuicoes(edBanco.Text, edCNPJ.Text, edUsuario.Text, edEmpresa.Text, edNivel.Text);
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
var
  ADataIni, ADataFim, AFileName: string;
  ADat: TDateTime;
begin
  ADat := StartOfTheMonth(Date);
  ADataIni := FormatDateTime('DD/MM/YYYY', ADat);
  if not InputQuery('Data Inicial', 'Data Inicial', ADataIni) then
    Exit;

  ADat := EndOfTheMonth(StrToDate(ADataIni));
  ADataFim := FormatDateTime('DD/MM/YYYY', ADat);
  if not InputQuery('Data Final', 'Data Final', ADataFim) then
    Exit;

  AFileName := ExtractFilePath(Application.ExeName) + 'SpedPAF.txt';

  hw_gerarEFD_ICMSIPI_PAFECF(edEmpresa.Text, edBanco.Text, ADataIni, ADataFim, AFileName, edUsuario.Text, edNivel.Text);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
//  edBanco.Text := '127.0.0.1:D:\Hw\bases\ang\HWAUTO.FDB';
//  edCNPJ.Text := '18330373000196';
end;

end.
