unit uExemplo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,
  ComCtrls, uDadosIni, uCadPadrao;

type
  TfrmExemplo = class(TfrmCadPadrao)
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExemplo: TfrmExemplo;

implementation

uses uDtmExemplo, uDtmAtivo;

{$R *.dfm}

procedure TfrmExemplo.BitBtn1Click(Sender: TObject);
begin
  inherited;
  dtmExemplo.cdsFornec.Open;
end;

procedure TfrmExemplo.BitBtn3Click(Sender: TObject);
begin
  inherited;
PageControl3.ActivePage := TabSheet3;
GroupBox1.Caption := 'Incluindo Alguma coisa';
end;

procedure TfrmExemplo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dtmExemplo.cdsFornec.Close;
  dtmExemplo.cdsColunas.Close;
  Action := caFree;
  frmExemplo := nil;
end;

procedure TfrmExemplo.FormShow(Sender: TObject);
begin
  inherited;
  setTClientDataSet(dtmExemplo.cdsColunas, vDadosIni.vNomeUsuario, dtmExemplo.IBTransaction2);
end;

initialization
  RegisterClass(TfrmExemplo);
finalization
  UnRegisterClass(TfrmExemplo);

end.

