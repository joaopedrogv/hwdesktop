unit HwNextBaseFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, System.UITypes,
  Vcl.Forms, Vcl.Controls, Vcl.Dialogs;

type
  TfrmHwNextBase = class(TForm)
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
    procedure FocusView; virtual;
    property ViewIdentifier: string read FViewIdentifier;
    property InstanceNumber: Integer read FInstanceNumber;
  end;

implementation

procedure TfrmHwNextBase.DoInitializeView;
begin
end;

function TfrmHwNextBase.HasPendingChanges: Boolean;
begin
  Result := False;
end;

function TfrmHwNextBase.ConfirmClose: Boolean;
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

procedure TfrmHwNextBase.InitializeNextView(const AIdentifier: string;
  AInstanceNumber: Integer; ACloseTarget: HWND;
  ACloseDiscardsEdits: Boolean);
begin
  FViewIdentifier := AIdentifier;
  FInstanceNumber := AInstanceNumber;
  FCloseTarget := ACloseTarget;
  FCloseDiscardsEdits := ACloseDiscardsEdits;
  DoInitializeView;
end;

procedure TfrmHwNextBase.RequestClose;
begin
  // Closing belongs to the Delphi 2006 host; the Rio view only asks for it.
  if IsWindow(FCloseTarget) then
    PostMessage(FCloseTarget, WM_CLOSE, 0, 0);
end;

procedure TfrmHwNextBase.FocusView;
begin
  if (ActiveControl <> nil) and ActiveControl.CanFocus then
    ActiveControl.SetFocus
  else
    SetFocus;
end;

end.
