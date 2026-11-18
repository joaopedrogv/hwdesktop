unit NextBaseForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Forms, Vcl.Controls,
  ViewFeedback;

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
    procedure InitializeNextView(const AIdentifier: string; AInstanceNumber: Integer; ACloseTarget: HWND;
      ACloseDiscardsEdits: Boolean);
    function HasPendingChanges: Boolean; virtual;
    function ConfirmClose: Boolean;
    procedure RequestClose;
    // A base nao tem estado de consulta; cada descendente descarta o que mantem.
    procedure ResetForSessionChange; virtual;
    procedure FocusView; virtual;
    procedure ShowInformation(const AMessage: string);
    procedure ShowWarning(const AMessage: string);
    procedure ShowError(const AMessage: string);
    function ShowDangerQuestion(const AMessage: string): Boolean;
    function ShowQuestion(const AMessage: string): Boolean;
    property ViewIdentifier: string read FViewIdentifier;
    property InstanceNumber: Integer read FInstanceNumber;
  end;

implementation

uses
  NextDialogs;

procedure TfrmNextBase.DoInitializeView;
begin
end;

procedure TfrmNextBase.ShowInformation(const AMessage: string);
begin
  TNextDialogs.ShowInformation(AMessage);
end;

procedure TfrmNextBase.ShowWarning(const AMessage: string);
begin
  TNextDialogs.ShowWarning(AMessage);
end;

procedure TfrmNextBase.ShowError(const AMessage: string);
begin
  TNextDialogs.ShowError(AMessage);
end;

function TfrmNextBase.ShowDangerQuestion(const AMessage: string): boolean;
begin
  Result := TNextDialogs.ShowDangerQuestion(AMessage);
end;

function TfrmNextBase.ShowQuestion(const AMessage: string): boolean;
begin
  Result := TNextDialogs.ShowQuestion(AMessage);
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

procedure TfrmNextBase.InitializeNextView(const AIdentifier: string; AInstanceNumber: Integer; ACloseTarget: HWND;
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
  // O fechamento pertence ao host Delphi 2006; a view Rio apenas o solicita.
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
