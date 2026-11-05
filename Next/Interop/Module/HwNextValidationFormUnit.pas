unit HwNextValidationFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls;

type
  TfrmHwNextValidation = class(TForm)
    lblNome: TLabel;
    edtNome: TEdit;
    lblObservacoes: TLabel;
    memObservacoes: TMemo;
    chkEstado: TCheckBox;
    lblInstancia: TLabel;
    btnFechar: TButton;
    procedure edtNomeChange(Sender: TObject);
    procedure memObservacoesChange(Sender: TObject);
    procedure chkEstadoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    FCloseTarget: HWND;
    FInstanceNumber: Integer;
    procedure UpdateStateLabel;
  public
    procedure InitializeView(ACloseTarget: HWND; AInstanceNumber: Integer);
    procedure FocusView;
  end;

implementation

{$R *.dfm}

procedure TfrmHwNextValidation.InitializeView(ACloseTarget: HWND;
  AInstanceNumber: Integer);
begin
  FCloseTarget := ACloseTarget;
  FInstanceNumber := AInstanceNumber;
  Caption := Format('Eventos DFe - Next %d', [FInstanceNumber]);
  edtNome.Clear;
  memObservacoes.Clear;
  chkEstado.Checked := False;
  UpdateStateLabel;
end;

procedure TfrmHwNextValidation.UpdateStateLabel;
const
  StateText: array[Boolean] of string = ('desmarcado', 'marcado');
begin
  lblInstancia.Caption := Format('Instância %d: %s',
    [FInstanceNumber, StateText[chkEstado.Checked]]);
end;

procedure TfrmHwNextValidation.edtNomeChange(Sender: TObject);
begin
  UpdateStateLabel;
end;

procedure TfrmHwNextValidation.memObservacoesChange(Sender: TObject);
begin
  UpdateStateLabel;
end;

procedure TfrmHwNextValidation.chkEstadoClick(Sender: TObject);
begin
  UpdateStateLabel;
end;

procedure TfrmHwNextValidation.btnFecharClick(Sender: TObject);
begin
  // Closing belongs to the Delphi 2006 MDI host; the Rio view never vetoes.
  PostMessage(FCloseTarget, WM_CLOSE, 0, 0);
end;

procedure TfrmHwNextValidation.FocusView;
begin
  if (ActiveControl <> nil) and ActiveControl.CanFocus then
    ActiveControl.SetFocus
  else
    edtNome.SetFocus;
end;

end.
