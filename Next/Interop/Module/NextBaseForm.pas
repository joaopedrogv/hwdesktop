unit NextBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, System.UITypes,
  Vcl.Forms, Vcl.Controls, Vcl.Dialogs, ViewFeedback;

type
  TfrmNextBase = class(TForm, IViewFeedback)
  private
    FViewIdentifier: string;
    FInstanceNumber: Integer;
    FCloseTarget: HWND;
    FCloseDiscardsEdits: Boolean;
  protected
    procedure DoInitializeView; virtual;
  public
    procedure InitializeNextView(const AIdentifier: string;
      AInstanceNumber: Integer; ACloseTarget: HWND;
      ACloseDiscardsEdits: Boolean);
    function HasPendingChanges: Boolean; virtual;
    function ConfirmClose: Boolean;
    procedure RequestClose;
    // Descartar resultados e selecoes que pertenciam a sessao anterior. A base
    // nao possui estado de consulta; cada descendente sobrescreve o necessario.
    procedure ResetForSessionChange; virtual;
    procedure FocusView; virtual;
    // Feedback visual comum das telas Next. O titulo e a mensagem vem do
    // chamador; os botoes seguem o idioma do Windows.
    procedure ShowInformation(const AMessage, ATitle: string);
    procedure ShowWarning(const AMessage, ATitle: string);
    procedure ShowError(const AMessage, ATitle: string);
    property ViewIdentifier: string read FViewIdentifier;
    property InstanceNumber: Integer read FInstanceNumber;
  end;

implementation

procedure TfrmNextBase.DoInitializeView;
begin
end;

procedure TfrmNextBase.ShowInformation(const AMessage, ATitle: string);
begin
  Application.MessageBox(PChar(AMessage), PChar(ATitle),
    MB_OK or MB_ICONINFORMATION);
end;

procedure TfrmNextBase.ShowWarning(const AMessage, ATitle: string);
begin
  Application.MessageBox(PChar(AMessage), PChar(ATitle),
    MB_OK or MB_ICONWARNING);
end;

procedure TfrmNextBase.ShowError(const AMessage, ATitle: string);
begin
  Application.MessageBox(PChar(AMessage), PChar(ATitle),
    MB_OK or MB_ICONERROR);
end;

function TfrmNextBase.HasPendingChanges: Boolean;
begin
  Result := False;
end;

procedure TfrmNextBase.ResetForSessionChange;
begin
end;

function TfrmNextBase.ConfirmClose: Boolean;
const
  DiscardMessage =
    'H'#225' altera'#231#245'es pendentes. Fechar esta tela descartar'#225' a ' +
    'edi'#231#227'o. Deseja fechar?';
  RetainMessage =
    'H'#225' altera'#231#245'es pendentes. A tela ser'#225' ocultada e a ' +
    'edi'#231#227'o ser'#225' mantida para retomada. Deseja continuar?';
begin
  Result := True;
  if not HasPendingChanges then
    Exit;
  if FCloseDiscardsEdits then
    Result := MessageDlg(DiscardMessage, mtWarning, [mbYes, mbNo], 0, mbNo) = mrYes
  else
    Result := MessageDlg(RetainMessage, mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrYes;
end;

procedure TfrmNextBase.InitializeNextView(const AIdentifier: string;
  AInstanceNumber: Integer; ACloseTarget: HWND;
  ACloseDiscardsEdits: Boolean);
begin
  FViewIdentifier := AIdentifier;
  FInstanceNumber := AInstanceNumber;
  FCloseTarget := ACloseTarget;
  FCloseDiscardsEdits := ACloseDiscardsEdits;
  DoInitializeView;
end;

procedure TfrmNextBase.RequestClose;
begin
  // Closing belongs to the Delphi 2006 host; the Rio view only asks for it.
  if IsWindow(FCloseTarget) then
    PostMessage(FCloseTarget, WM_CLOSE, 0, 0);
end;

procedure TfrmNextBase.FocusView;
begin
  if (ActiveControl <> nil) and ActiveControl.CanFocus then
    ActiveControl.SetFocus
  else
    SetFocus;
end;

end.
