unit NextDialogs;

interface

type
  TNextDialogs = class
  public
    class procedure ShowInformation(const AMessage: string); static;
    class procedure ShowWarning(const AMessage: string); static;
    class procedure ShowError(const AMessage: string); static;
    class function ShowDangerQuestion(const AMessage: string): Boolean; static;
    class function ShowQuestion(const AMessage: string): Boolean; static;
  end;

implementation

uses
  Winapi.Windows, Vcl.Forms;

class procedure TNextDialogs.ShowInformation(const AMessage: string);
begin
  Application.MessageBox(PChar(AMessage), 'Informação', MB_OK or MB_ICONINFORMATION);
end;

class procedure TNextDialogs.ShowWarning(const AMessage: string);
begin
  Application.MessageBox(PChar(AMessage), 'Atenção', MB_OK or MB_ICONWARNING);
end;

class procedure TNextDialogs.ShowError(const AMessage: string);
begin
  Application.MessageBox(PChar(AMessage), 'Erro', MB_OK or MB_ICONERROR);
end;

class function TNextDialogs.ShowDangerQuestion(const AMessage: string): Boolean;
begin
  Result := Application.MessageBox(PChar(AMessage), 'Confirmação',
    MB_YESNO or MB_ICONWARNING or MB_DEFBUTTON2) = ID_YES;
end;

class function TNextDialogs.ShowQuestion(const AMessage: string): Boolean;
begin
  Result := Application.MessageBox(PChar(AMessage), 'Confirmação', MB_YESNO or MB_ICONQUESTION) = ID_YES;
end;

end.