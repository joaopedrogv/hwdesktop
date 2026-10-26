unit UIUtilsUnit;

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  ValidationEntityOutputUnit;

type

  UIUtils = class
  public
    class procedure Populate(List: TStrings; const Values: array of string); overload;
    class procedure HandleError(E: Exception);
    class function SafeActiveControl(WinControl: TWinControl): TWinControl;
    class function ShowInfo(const Text: string): Integer;
    class function ShowError(const Error: string): Integer;
    class function ShowQuestion(const Text: string; DefaultNo: Boolean = False): Integer;
    class procedure HintInfo(const Text: string); overload;
    class procedure HintInfo(AControl: TWinControl; const Text: string); overload;
    class procedure CenterHorizontal(AControl: TWinControl);
  end;

implementation

uses
  EValidacaoNegocioUnit, SetupUnit, IUIFormValidatorUnit, UIFormValidatorFactoryUnit, MessageTransferType,
  Windows, Math;

var
  handlerHintValidator: IUIFormComunicator;

{ UIUtils }

class procedure UIUtils.CenterHorizontal(AControl: TWinControl);
begin
  if AControl.Parent is TWinControlClass then
    AControl.Left := (AControl.Parent.ClientWidth - AControl.Width) div 2;
end;

class procedure UIUtils.HandleError(E: Exception);
begin
  if E is EValidacaoNegocio then
    Application.MessageBox(PChar(E.Message), 'Atenção', 16)

  else
  begin
    AppSetup.ErrorLogger.LogError(E.Message);
    Application.MessageBox('Erro inesperado registrado no log. Contacte o suporte técnico para mais detalhes', 'Atenção', 16);
  end;
end;

class procedure UIUtils.HintInfo(const Text: string);
begin
  handlerHintValidator.SendHint( MessageTransfer.Create(Text, mtInfo, Application.ActiveFormHandle) );
end;

class procedure UIUtils.HintInfo(AControl: TWinControl; const Text: string);
begin
  handlerHintValidator.SendHint(  AControl, MessageTransfer.Create(Text, mtInfo, AControl.Handle) );
end;

class procedure UIUtils.Populate(List: TStrings;
  const Values: array of string);
var
  I: Integer;
begin
  List.Clear();
  for I := Low(Values) to High(Values) do
    List.Add(Values[I]);
end;

class function UIUtils.SafeActiveControl(WinControl: TWinControl): TWinControl;
var
  winCtl: TWinControl;
  I: Integer;
  list: TStrings;
begin
  winCtl := WinControl;
  while (winCtl <> nil) do
  begin
    if (winCtl is TForm) then
    begin
      Result := (winCtl as TForm).ActiveControl;
      Exit;
    end
    else
      winCtl := winCtl.Parent;
  end;

  Result := nil;
end;

class function UIUtils.ShowError(const Error: string): Integer;
begin
  Result := Application.MessageBox(PChar(Error), 'Atenção', 16);
end;

class function UIUtils.ShowInfo(const Text: string): Integer;
begin
  Result := Application.MessageBox(PChar(Text), 'Atenção', 64);
end;

class function UIUtils.ShowQuestion(const Text: string;
  DefaultNo: Boolean): Integer;
begin
  Result := Application.MessageBox(
    PChar(Text), 'Confirmação',
    MB_YESNO + IfThen(DefaultNo, MB_DEFBUTTON2) 
  );
end;

initialization
  handlerHintValidator := UIFormValidatorFactory.Builder().Comunicator();

finalization
  handlerHintValidator := nil;

end.
