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
    procedure ShowInformation(const AMessage: string);
    procedure ShowWarning(const AMessage: string);
    procedure ShowError(const AMessage: string);
    function ShowDangerQuestion(const AMessage: string): Boolean;
    function ShowQuestion(const AMessage: string): Boolean;
    property ViewIdentifier: string read FViewIdentifier;
    property InstanceNumber: Integer read FInstanceNumber;
  end;

implementation

procedure TfrmNextBase.DoInitializeView;
begin
end;

procedure TfrmNextBase.ShowInformation(const AMessage: string);
begin
  Application.MessageBox(PChar(AMessage), 'Informação',
    MB_OK or MB_ICONINFORMATION);
end;

procedure TfrmNextBase.ShowWarning(const AMessage: string);
begin
  Application.MessageBox(PChar(AMessage), 'Atenção',
    MB_OK or MB_ICONWARNING);
end;

procedure TfrmNextBase.ShowError(const AMessage: string);
begin
  Application.MessageBox(PChar(AMessage), 'Erro',
    MB_OK or MB_ICONERROR);
end;

function TfrmNextBase.ShowDangerQuestion(const AMessage: string): boolean;
begin
  Result := Application.MessageBox(PChar(AMessage), 'Confirmação',
    MB_YESNO or MB_ICONWARNING or MB_DEFBUTTON2) = ID_YES;
end;

function TfrmNextBase.ShowQuestion(const AMessage: string): boolean;
begin
  Result := Application.MessageBox(PChar(AMessage), 'Confirmação',
    MB_YESNO or MB_ICONQUESTION) = ID_YES;
end;

function TfrmNextBase.HasPendingChanges: Boolean;
begin
  Result := False;
end;

procedure TfrmNextBase.ResetForSessionChange;
begin
end;

function TfrmNextBase.ConfirmClose: Boolean;
begin
  Result := True;
  if not HasPendingChanges then
    Exit;
  if FCloseDiscardsEdits then
    Result := ShowDangerQuestion('Há alteações pendentes. Fechar esta tela descartará a edição. Deseja fechar?')
  else
    Result := ShowQuestion('Há alteações pendentes. Deseja continuar?');
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
