unit uReestrutura_Aplicar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmReestrutura_Aplicar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    CountScript: Integer;
    procedure AtualizarProgress(var Count: Integer);
  public
    { Public declarations }
  end;

var
  frmReestrutura_Aplicar: TfrmReestrutura_Aplicar;

implementation

uses
  uReestrutura_Classes, uReestrutura_Aplicar_View;

{$R *.dfm}

procedure TfrmReestrutura_Aplicar.AtualizarProgress(var Count: Integer);
begin
  ProgressBar1.Position := Count;
  Label2.Caption := 'Executando...  ' + IntToStr(Count) + ' de ' + IntToStr(CountScript);
end;

procedure TfrmReestrutura_Aplicar.BitBtn1Click(Sender: TObject);
begin
  CountScript := reestrutura.GetCountScripts;
  ProgressBar1.Min := 0;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := CountScript;
  reestrutura.OnWorkEvent := AtualizarProgress;
  reestrutura.Reestruturar;
end;

procedure TfrmReestrutura_Aplicar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(reestrutura.OnWorkEvent) then
    reestrutura.OnWorkEvent := nil;  
  frmReestrutura_Aplicar := nil;
end;

procedure TfrmReestrutura_Aplicar.FormShow(Sender: TObject);
begin
  Label1.Caption := reestrutura.EnderecoBanco;
end;

procedure TfrmReestrutura_Aplicar.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmReestrutura_Aplicar_View, frmReestrutura_Aplicar_View);
  frmReestrutura_Aplicar_View.ShowModal;
end;

procedure TfrmReestrutura_Aplicar.SpeedButton2Click(Sender: TObject);
begin
  reestrutura.ShowDataBaseInfo;
end;

end.
