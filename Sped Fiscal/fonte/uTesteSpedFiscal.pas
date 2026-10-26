unit uTesteSpedFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn3: TBitBtn;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
function gerarSpedFiscal(pCodEmpresa, pEnderecoBanco, pUsuario, pNivel: PChar): longbool; stdcall; external 'SpedFiscal.dll';
function gerarSpedFiscalPAFECF(pCodEmpresa, pEnderecoBanco, vDataIni, vDataFim, pNomeArquivo, pUsuario, pNivel: PChar): string; stdcall; external 'SpedFiscal.dll';

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  gerarSpedFiscal(pchar(Edit1.Text),pchar(Edit2.Text), 'HW', '10')
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Edit2.Text := gerarSpedFiscalPAFECF(pchar(Edit1.Text),pchar(Edit3.Text),
    pchar(MaskEdit1.Text),pchar(MaskEdit2.Text),pchar('c:\hw.txt'), 'HW', '10')
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  gerarSpedFiscal(pchar(Edit4.Text),pchar(Edit5.Text), 'HW', '10')
end;

end.
