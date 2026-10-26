unit uTesteTeclas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TfrmTesteTeclas = class(TfrmPadrao)
    Timer1: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure processaMsg(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  frmTesteTeclas: TfrmTesteTeclas;

implementation

uses uDtmConfigF, uConfiguracoes;

{$R *.dfm}

procedure TfrmTesteTeclas.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmTesteTeclas.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
    Application.OnMessage := processaMsg
  else
    Application.OnMessage := nil;
end;

procedure TfrmTesteTeclas.processaMsg(var Msg: TMsg; var Handled: Boolean);
var
  temp: string;
begin
  if Msg.message = WM_KEYDOWN then
  begin
    temp :=
      obTec.retornaValor('select t.tecla||' + QuotedStr('-') + '||t.processo||' + QuotedStr('-') +
      '||t.descricao as valor from  teclado t where t.tecla = ' + IntToStr(msg.Wparam));
    if temp <> '' then
    begin
      Timer1.Enabled := false;
      Label4.Visible := false;
      Edit1.Text := copy(temp, 1, Pos('-', temp) - 1);
      temp := copy(temp, Pos('-', temp) + 1, length(temp));

      Edit2.Text := copy(temp, 1, Pos('-', temp) - 1);
      temp := copy(temp, Pos('-', temp) + 1, length(temp));

      Edit3.Text := copy(temp, 1, length(temp));

    end
    else
    begin
      Timer1.Enabled := True;
      Label4.Visible := true;
      Edit1.Clear;
      Edit2.Clear;
      Edit3.Clear;
    end;
  end;
end;

procedure TfrmTesteTeclas.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := false;
  Label4.Visible := false;
end;

end.

