unit UChamarDLL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  ArrayBi =array[0..4,0..2] of ShortString;
  TFrmChamarDLL = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmChamarDLL: TFrmChamarDLL;
  vteste: ArrayBi;

implementation

function PesquisaGeral(vtipo: Pchar;cod_empresa: Pchar;vendbanco: Pchar;vusu: Pchar;vcodus: Pchar): longbool; stdcall; external 'DLLConsGeral.dll';
function PesquisaParametros(vpar: ArrayBi;cod_empresa: Pchar;vendbanco: Pchar;vusu: Pchar;vcodus: Pchar;vcodcnt: integer;titulo: Pchar): longbool; stdcall; external 'DLLConsGeral.dll';


{$R *.dfm}

procedure TFrmChamarDLL.BitBtn1Click(Sender: TObject);
begin
//  PesquisaGeral('1','1',pchar('127.0.0.1:d:\clientes\exemplo\Hwauto.fdb'),'HW','1');
//  PesquisaGeral('1','1',pchar('linux:/bases/Hwauto.fdb'),'HW','1');
// PesquisaGeral('1','1',pchar('192.168.254.50:e:/bases/Hwauto.gdb'),'HW','1');
 PesquisaGeral('1','1',pchar('joaopedro-pc:D:\Hw\bases\producao\Hwauto.fdb'),'HW','1');

end;

procedure TFrmChamarDLL.BitBtn2Click(Sender: TObject);
begin
  vteste[0,0]:='DATA1';
  vteste[0,1]:='01/07/2017';
  vteste[0,2]:='!99/99/0000;1;_';
  vteste[1,0]:='DATA2';
  vteste[1,1]:='31/07/2017';
  vteste[1,2]:='!99/99/0000;1;_';
//  PesquisaParametros(vteste,'1',pchar('127.0.0.1:d:\clientes\exemplo\Hwauto.fdb'),'HW','1',2,pchar('TESTE DO TESTE'));
  PesquisaParametros(vteste,'1',pchar('joaopedro-pc:D:\Hw\bases\producao\Hwauto.fdb'),'HW','1',2,pchar('TESTE DO TESTE'));
end;

end.
