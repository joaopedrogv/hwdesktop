unit HwNextValidationSecondFormUnit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls,
  HwNextBaseFormUnit;

type
  TfrmHwNextValidationSecond = class(TfrmHwNextBase)
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
    FInitialNome: string;
    FInitialObservacoes: string;
    FInitialEstado: Boolean;
    procedure UpdateStateLabel;
  protected
    procedure DoInitializeView; override;
  public
    function HasPendingChanges: Boolean; override;
    procedure FocusView; override;
  end;

implementation

{$R *.dfm}

procedure TfrmHwNextValidationSecond.DoInitializeView;
begin
  // Called once by InitializeNextView when the host creates a new instance.
  // Re-presenting a retained-hidden view reuses this instance and does not
  // re-run this method.
  Caption := Format('Eventos DFe - Next - Second %d', [InstanceNumber]);
  edtNome.Clear;
  memObservacoes.Clear;
  chkEstado.Checked := False;
  FInitialNome := edtNome.Text;
  FInitialObservacoes := memObservacoes.Text;
  FInitialEstado := chkEstado.Checked;
  UpdateStateLabel;
end;

procedure TfrmHwNextValidationSecond.UpdateStateLabel;
const
  StateText: array[Boolean] of string = ('desmarcado', 'marcado');
begin
  lblInstancia.Caption := Format('Instância %d: %s',
    [InstanceNumber, StateText[chkEstado.Checked]]);
end;

procedure TfrmHwNextValidationSecond.edtNomeChange(Sender: TObject);
begin
  UpdateStateLabel;
end;

procedure TfrmHwNextValidationSecond.memObservacoesChange(Sender: TObject);
begin
  UpdateStateLabel;
end;

procedure TfrmHwNextValidationSecond.chkEstadoClick(Sender: TObject);
begin
  UpdateStateLabel;
end;

procedure TfrmHwNextValidationSecond.btnFecharClick(Sender: TObject);
begin
  // Closing belongs to the Delphi 2006 host; the Rio view never vetoes.
  RequestClose;
end;

procedure TfrmHwNextValidationSecond.FocusView;
begin
  if (ActiveControl <> nil) and ActiveControl.CanFocus then
    ActiveControl.SetFocus
  else
    edtNome.SetFocus;
end;

function TfrmHwNextValidationSecond.HasPendingChanges: Boolean;
begin
  Result := (edtNome.Text <> FInitialNome) or
    (memObservacoes.Text <> FInitialObservacoes) or
    (chkEstado.Checked <> FInitialEstado);
end;

end.
