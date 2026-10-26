unit uSistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons;

type
  TfrmPrincipal111 = class(TfrmPadrao)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    formFiscal, formCxl, formCaixa, formSupervisor, formHwSac: TForm;
    hdFiscal, hdCxl, hdCaixa, hdSupervisor, hdHwSac: THandle;
  public
    { Public declarations }
  end;

var
  frmPrincipal111: TfrmPrincipal111;

implementation

uses uDtmEntrada, USenha, uClasseEntrada, USplash, funcoes;

{$R *.dfm}

procedure TfrmPrincipal111.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if hdFiscal = 0 then
  begin
    formFiscal := Funcoes.AbreForm('pkFiscal', 'TfrmPrincipal', hdFiscal);
    try
      formFiscal.ShowModal;
    finally
      formFiscal.Free;
      unLoadPackage(hdFiscal);
    end;
  end;
end;

procedure TfrmPrincipal111.FormCreate(Sender: TObject);
begin
  inherited;
  dtmEnt := TdtmEnt.Create(dtmEnt);
end;

procedure TfrmPrincipal111.FormShow(Sender: TObject);
begin
  inherited;
  obUser := TUsuario.Create;
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TFrmEntrada, FrmEntrada);
  FrmEntrada.ShowModal;
  if FrmEntrada.ModalResult <> mrOK then
  begin
    Application.Terminate;
    Abort;
  end;

end;

initialization
  RegisterClass(TfrmPrincipal111);
finalization
  UnRegisterClass(TfrmPrincipal111);

end.

