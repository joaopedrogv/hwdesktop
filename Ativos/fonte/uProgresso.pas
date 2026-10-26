unit uProgresso;

interface

uses
  Forms, uPadrao, Controls, StdCtrls, Classes, Buttons;

type
  TfrmProgresso = class(TfrmPadrao)
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgresso: TfrmProgresso;

implementation

uses
  Windows, uDtmAtivo;

{$R *.dfm}

procedure TfrmProgresso.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja realmente parar o processamento','Confirmação',MB_YESNO+MB_ICONQUESTION) = IDYES then
    vDadosIni.vParar:=1;
end;

end.
