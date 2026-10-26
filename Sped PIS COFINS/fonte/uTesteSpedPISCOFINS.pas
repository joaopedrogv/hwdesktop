unit uTesteSpedPISCOFINS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uClassesSpedPISCOFINS, DateUtils;

function definirPISCOFINSCuponsPorPeriodo(pCodEmpresa, pEndereco, pDataIni, pDataFim: PChar): Boolean; stdcall;
  external 'SPEDPISCOFINS.dll';

function gerarSPEDPISCOFINS(pEnderecoBanco: PChar; pCNPJ: PChar; pUsuario: PChar; pCodEmpresa: PChar; pNivel: PChar): longbool; stdcall;
  external 'SPEDPISCOFINS.dll';

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  definirPISCOFINSCuponsPorPeriodo(PChar(MaskEdit1.Text), PChar(Edit1.Text), PChar(MaskEdit2.Text), PChar(MaskEdit3.Text));
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  gerarSPEDPISCOFINS(pchar(ComboBox1.Text), '7', 'HW', '1', '10');
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  gerarSPEDPISCOFINS('127.0.0.1:D:\Hw\Bases\producao\Hwauto.fdb', '7', 'HW', '1', '10');
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  gerarSPEDPISCOFINS('127.0.0.1:D:\Hw\Bases\producao\Hwauto.fdb', '7', 'HW', '1', '10');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  vTestes: TSpedPISCOFINS;
begin
  vTestes.abreFormSPEDPISCOFINS('127.0.0.1:C:\basesauto\motomol\hwauto.fdb');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  MaskEdit2.Text := DateToStr(StartOfTheMonth(date - (1 * 30) ));
  MaskEdit3.Text := DateToStr(endOfTheMonth(StrToDate(MaskEdit2.Text)));
end;

end.
