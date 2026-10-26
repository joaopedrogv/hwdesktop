unit UIFormValidatorFactoryUnit;

interface

uses
  Classes,
  IUIFormValidatorUnit,
  ValidationEntityOutputUnit,
  EntityMetadataUnit,
  Controls;

type
  UIFormValidatorFactory = class
  public
    class function Builder(DefaultComponentHints: TWinControl = nil): IUIFormValidatorBuilder; overload; static;
    class function Builder(const Metadata: EntityMetadata; DefaultComponentHints: TWinControl = nil): IUIFormValidatorBuilder; overload; static;
  end;

implementation

uses
  SysUtils,
  StrUtils,
  Graphics,
  StdCtrls,
  Math,
  Mask,
  Windows,
  Messages,
  CommCtrl,
  ComCtrls,
  RTLConsts,
  ExtCtrls,
  TipoComunsUnit,
  Forms,
  MessageTransferType,
  SimpleStringDictionaryUnit;

type
  TWinControlhack = class(TWinControl);

  UIEntityComponent = class(TInterfacedObject, IUIFormValidatorBuilder, IUIFormValidator, IUIFormComunicator)
  private
    FIndexDefault: Integer;
    FGroup: TStrings;
    FCaptions: TStrings;
    Timer: TTimer;
    FHandlesBalloons: TArrayInteger;
    FMetadata: EntityMetadata;
    procedure ResetBalloon();
    procedure DoTimer(Sender: TObject);
    function GetCaption(const FieldName: string): string;
    function ComponentIsShowing(AComponent: TWinControl): Boolean;
  public
    destructor Destroy; override;
    constructor Create(DefaultComponentHints: TWinControl = nil); overload;
    constructor Create(const Metadata: EntityMetadata; DefaultComponentHints: TWinControl = nil); overload;

    function Bind(Component: TWinControl; const FieldCaption: string = ''): IUIFormValidatorBuilder; overload;
    function Bind(Component: TLabel): IUIFormValidatorBuilder; overload;
    function Bind(const Field: EntityFieldMetadata; Component: TLabel): IUIFormValidatorBuilder; overload;
    function Bind(const Field: EntityFieldMetadata; Component: TWinControl): IUIFormValidatorBuilder; overload;
    function Bind(const FieldName: string; Component: TLabel): IUIFormValidatorBuilder; overload;
    function Bind(const FieldName: string; Component: TWinControl): IUIFormValidatorBuilder; overload;
    function Bind(const FieldName, FieldCaption: string; Component: TWinControl): IUIFormValidatorBuilder; overload;

    function Validator(): IUIFormValidator;
    function Comunicator(): IUIFormComunicator;
    function FormatValidations(const Input: ValidationEntityOutput): string;
    procedure Validate(const Input: ValidationEntityOutput);
    procedure Reset();
    procedure SendHint(const AMessage: MessageTransfer); overload;
    procedure SendHint(AControl: TWinControl; const AMessage: MessageTransfer); overload;
  end;

	TTOOLINFO = packed record
    cbSize: Integer;
    uFlags: Integer;
    hwnd: THandle;
    uId: Integer;
    rect: TRect;
    hinst: THandle;
    lpszText: PWideChar;
    lParam: Integer;
  end;

  BalloonTipFixedLocation = ( btflTopLeft, btflTopRight, btflBottomRight, btflBottomLeft );

  BalloonTipFixed = class
  private
    class function ShowBalloonTipFixed(AControl: TWinControl; AText: WideString; var AHandleMensagem: THandle): THandle;
  public
    class function ShowByCoord(coord: TPoint; const AMessage: MessageTransfer; var AHandleMensagem: THandle): THandle;
    class function ShowByWinComponent(AControl: TWinControl; AText: WideString; var AHandleMensagem: THandle; Location:BalloonTipFixedLocation = btflBottomRight; Caption: string = ''): THandle;
  end;

{ BalloonTipFixed }

class function BalloonTipFixed.ShowBalloonTipFixed(AControl: TWinControl;
  AText: WideString; var AHandleMensagem: THandle): THandle;
const
  ATitle = 'Validação';
  ECM_FIRST = $1500;
	TOOLTIPS_CLASS = 'tooltips_class32';
  TTS_ALWAYSTIP = $01;
  //TTS_NOPREFIX = $02;
  TTS_BALLOON = $40;
  TTS_CLOSE = $80;
  TTF_SUBCLASS = $0010;
  TTF_TRACK = $0020;
  TTF_TRANSPARENT = $0100;
  TTM_ADDTOOL = $0400 + 50;
  TTM_SETTITLE = (WM_USER + 32);
var
  lToolInfo: TTOOLINFO;
  lParentHandle: THandle;
  lParameters: Cardinal;
  coord: TPoint;
begin
  coord.X := AControl.Width - 20;
  coord.Y := AControl.Height - 10;
  coord := AControl.ClientToScreen(coord);

  lParentHandle := AControl.Handle;
  lParameters := WS_POPUP or TTS_NOPREFIX or TTS_BALLOON or TTS_ALWAYSTIP;
  lParameters := lParameters or TTS_CLOSE;
  Result := CreateWindow(
  	TOOLTIPS_CLASS,
    nil,
    lParameters,
    0,
    0,
    0,
    0,
    lParentHandle,
    0,
    HInstance,
    nil);

  AHandleMensagem := Result;

  if Result <> 0 then
  begin
    SetWindowPos(
    	Result,
    	HWND_TOPMOST,
      0,
      0,
      0,
      0,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

    lToolInfo.cbSize := SizeOf(lToolInfo);
		lToolInfo.uFlags := TTF_TRANSPARENT or TTF_SUBCLASS or TTF_TRACK;

    lToolInfo.hwnd := lParentHandle;
    lToolInfo.lpszText := PWideChar(AText);
    Windows.GetClientRect(lParentHandle, lToolInfo.rect);
    SendMessage(Result, TTM_ADDTOOL, 1, Integer(@lToolInfo));
    SendMessage(Result, TTM_SETTITLE, TTI_ERROR mod 4, Integer(PChar(ATitle)));

  	SendMessage(Result, TTM_TRACKPOSITION, 0, MakeLong(coord.X, coord.Y));

    SendMessage(Result, TTM_TRACKACTIVATE, Ord(True), Integer(@lToolInfo));
  end;
end;

class function BalloonTipFixed.ShowByCoord(coord: TPoint;
  const AMessage: MessageTransfer;
  var AHandleMensagem: THandle): THandle;
const
  //ATitle = 'Validação';
  ECM_FIRST = $1500;
  //TTI_ERROR = 3;
	TOOLTIPS_CLASS = 'tooltips_class32';
  TTS_ALWAYSTIP = $01;
  TTS_NOPREFIX = $02;
  TTS_BALLOON = $40;
  TTS_CLOSE = $80;
  TTF_SUBCLASS = $0010;
  TTF_TRACK = $0020;
  TTF_TRANSPARENT = $0100;
  TTM_ADDTOOL = $0400 + 50;
  TTM_SETTITLE = (WM_USER + 32);
var
  lToolInfo: TTOOLINFO;
  lParameters: Cardinal;
  lParentHandle: Cardinal;
  ATitle: string;
  TTI_OPTION: Cardinal;
begin
  if AMessage.Caption <> '' then
    ATitle := AMessage.Caption

  else
    case AMessage.TypeTTI of
      mtInfo: ATitle := 'Informação';
      mtWarnig: ATitle := 'Atenção';
      mtError: ATitle := 'Erro';
      mtValidation: ATitle := 'Validação';
    end;

  TTI_OPTION := Min(Ord(AMessage.TypeTTI) + 1, 3);

  lParentHandle := AMessage.ParentHandle;
  lParameters := WS_POPUP or TTS_NOPREFIX or TTS_BALLOON or TTS_ALWAYSTIP;
  lParameters := lParameters or TTS_CLOSE;
  Result := CreateWindow(
  	TOOLTIPS_CLASS,
    nil,
    lParameters,
    0,
    0,
    0,
    0,
    lParentHandle,
    0,
    HInstance,
    nil);

  AHandleMensagem := Result;

  if Result <> 0 then
  begin
    SetWindowPos(
    	Result,
    	HWND_TOPMOST,
      0,
      0,
      0,
      0,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

    lToolInfo.cbSize := SizeOf(lToolInfo);
		lToolInfo.uFlags := TTF_TRANSPARENT or TTF_SUBCLASS or TTF_TRACK;

    lToolInfo.hwnd := lParentHandle;
    lToolInfo.lpszText := PWideChar(AMessage.Text);
    Windows.GetClientRect(lParentHandle, lToolInfo.rect);
    SendMessage(Result, TTM_ADDTOOL, 1, Integer(@lToolInfo));
    SendMessage(Result, TTM_SETTITLE, TTI_OPTION mod 4, Integer(PChar(ATitle)));

  	SendMessage(Result, TTM_TRACKPOSITION, 0, MakeLong(coord.X, coord.Y));

    SendMessage(Result, TTM_TRACKACTIVATE, Ord(True), Integer(@lToolInfo));
  end;
end;

class function BalloonTipFixed.ShowByWinComponent(AControl: TWinControl;
  AText: WideString;
  var AHandleMensagem: THandle;
  Location:BalloonTipFixedLocation;
  Caption: string
): THandle;
var
  coord: TPoint;
begin
  coord.X := AControl.Width - 20;
  coord.Y := AControl.Height - 10;
  
  case Location of
    btflTopLeft    , btflTopRight  : coord.Y := AControl.Top   ;
    btflBottomRight, btflBottomLeft: coord.Y := AControl.Height - 10;
  end;

  case Location of
    btflTopLeft , btflBottomLeft : coord.X := AControl.Left ;
    btflTopRight, btflBottomRight: coord.X := AControl.Width - 20;
  end;

  coord := AControl.ClientToScreen(coord);

  Result := BalloonTipFixed.ShowByCoord(
    coord,
    MessageTransfer.Create(AText, mtValidation, AControl.Handle, Caption),
    AHandleMensagem
  );
end;

{ UIEntityComponent }

function UIEntityComponent.Bind(Component: TLabel): IUIFormValidatorBuilder;
begin
  if Component.FocusControl = nil then
    raise Exception.CreateFmt('UIEntityComponent.Bind %s FocusControl = nil ', [Component.Name]);

  Result := Self.Bind(Component.FocusControl, Component.Caption );
end;

function UIEntityComponent.Bind(const FieldName: string; Component: TLabel): IUIFormValidatorBuilder;
begin
  if Component.FocusControl = nil then
    raise Exception.CreateFmt('UIEntityComponent.Bind %s / %s FocusControl = nil ', [Component.Name, FieldName]);

  Result := Self.Bind( FieldName, Component.Caption, Component.FocusControl );
end;

function UIEntityComponent.ComponentIsShowing(AComponent: TWinControl): Boolean;
var
  WinCpnt: TWinControl;
begin
  WinCpnt := AComponent;

  while WinCpnt.Parent <> nil do
  begin
    if not WinCpnt.Parent.Visible then                           
     begin
       Result := False;
       Exit;
     end;

    if WinCpnt is TTabSheet then
       if TPageControl(WinCpnt.Parent).ActivePage <> WinCpnt then
       begin
         Result := False;
         Exit;
       end;

    WinCpnt := WinCpnt.Parent;
  end;

  Result := True;
end;

function UIEntityComponent.Comunicator: IUIFormComunicator;
begin
  Result := Self;
end;

constructor UIEntityComponent.Create(const Metadata: EntityMetadata; DefaultComponentHints: TWinControl);
begin
  if Metadata.IsNull then
    raise Exception.Create('UIEntityComponent Create Metadata IsNull');

  Self.Create( DefaultComponentHints );

  FMetadata := Metadata;
end;

constructor UIEntityComponent.Create(DefaultComponentHints: TWinControl);
begin
  FGroup := TStringList.Create();
  FCaptions := TStringList.Create();
  Timer := TTimer.Create(nil);
  Timer.Enabled := False;
  Timer.OnTimer := DoTimer;
  Timer.Interval := 1000 * 5;

  FMetadata := EntityMetadata.Create('');

  if DefaultComponentHints <> nil then
  begin
    Bind(DefaultComponentHints.Name, DefaultComponentHints);
    FIndexDefault := FGroup.Count - 1;
  end
  else
    FIndexDefault := -1;  

  //FHandleBalloon := 0;
end;

destructor UIEntityComponent.Destroy();
begin
  ResetBalloon();
  FGroup.Free();
  FCaptions.Free();
  Timer.Free();  
  inherited;
end;

procedure UIEntityComponent.DoTimer(Sender: TObject);
begin
  Timer.Enabled := False;
  ResetBalloon();
end;

function UIEntityComponent.FormatValidations(const Input: ValidationEntityOutput): string;
var
  I, Idx: Integer;
  dict: SimpleStringDictionary;
  S, C: string;
begin
  Result := '';

  dict := SimpleStringDictionary.Create;
  try
    for I := Low(Input.Validations) to High(Input.Validations) do
    begin
      Idx := FGroup.IndexOf(Input.Validations[I].FieldName);

      if Idx = -1 then
        Idx := FIndexDefault;

      if Idx >= 0 then
      begin
        S := IfThen( dict.TryGetValue(Input.Validations[I].FieldName, S), S + sLineBreak) +
            Input.Validations[I].GetMessage();
        dict[FGroup[Idx]] := S;
      end;
    end;

    for I := 0 to FGroup.Count - 1 do
      if dict.TryGetValue(FGroup[I], S) then
      begin
        C := GetCaption(FGroup[I]);
        if Result <> '' then
          Result := Result + sLineBreak + '-' + sLineBreak;

        Result := Result + IfThen(C <> '', '[' + C + ']' + sLineBreak) + S;
      end;
  finally
    dict.Free;
  end;
end;

function UIEntityComponent.GetCaption(const FieldName: string): string;
begin
  Result := Trim(FCaptions.Values[FieldName]);

  if Result = '' then
    FMetadata.TryGetDisplayAttribute(FieldName, Result);
end;

procedure UIEntityComponent.Reset;
var
  I, Idx: Integer;
  component: TWinControl;
begin
  ResetBalloon();
  for I := 0 to FGroup.Count - 1 do
  begin
    component := TWinControl(FGroup.Objects[I]);

    if (component <> nil) and (component is TWinControl) then
      if component is TEdit then
        (component as TEdit).Color := clWhite

      else if component is TMemo then
        (component as TMemo).Color := clWhite

      else if component is TMaskEdit then
        (component as TMaskEdit).Color := clWhite

      else if component is TComboBox then
        (component as TComboBox).Color := clWhite;
  end;
end;

procedure UIEntityComponent.ResetBalloon;
var
  I: Integer;
  cHandle: Cardinal;
begin
  for I := Low(FHandlesBalloons) to High(FHandlesBalloons) do
    if FHandlesBalloons[I] <> 0 then
    begin
      cHandle := FHandlesBalloons[I];
      ShowWindow(cHandle, 0);
    end;
  SetLength(FHandlesBalloons, 0);
end;

procedure UIEntityComponent.SendHint(AControl: TWinControl;
  const AMessage: MessageTransfer);
var
  lCursorPos: TPoint;
  cHandle: {$IFNDEF VER180}NativeUInt{$ELSE}Cardinal{$ENDIF};
  coord: TPoint;
begin
  lCursorPos.X := AControl.Width - 20;
  lCursorPos.Y := AControl.Height - 10;
  lCursorPos  := AControl.ClientToScreen(lCursorPos);

  SetLength(FHandlesBalloons, Length(FHandlesBalloons) + 1);

  BalloonTipFixed.ShowByCoord(lCursorPos, AMessage, cHandle );
  FHandlesBalloons[High(FHandlesBalloons)] := cHandle;
  Timer.Enabled := True;
end;

procedure UIEntityComponent.SendHint(const AMessage: MessageTransfer);
var
  lCursorPos: TPoint;
  cHandle: {$IFNDEF VER180}NativeUInt{$ELSE}Cardinal{$ENDIF};
begin
  GetCursorPos(lCursorPos);

  SetLength(FHandlesBalloons, Length(FHandlesBalloons) + 1);

  BalloonTipFixed.ShowByCoord(lCursorPos, AMessage, cHandle );
  FHandlesBalloons[High(FHandlesBalloons)] := cHandle;
  Timer.Enabled := True;
end;

function UIEntityComponent.Validator: IUIFormValidator;
begin
  Result := Self;
end;

function UIEntityComponent.Bind(const FieldName: string; Component: TWinControl): IUIFormValidatorBuilder;
begin
  Result := Self.Bind( FieldName, '', Component );
end;

function UIEntityComponent.Bind(const FieldName, FieldCaption: string; Component: TWinControl): IUIFormValidatorBuilder;
begin
  FGroup.AddObject(FieldName, Component);

  if FieldCaption <> '' then
    FCaptions.Values[FieldName] := FieldCaption;

  Result := Self;
end;

function UIEntityComponent.Bind(const Field: EntityFieldMetadata; Component: TLabel): IUIFormValidatorBuilder;
begin
  if Component.FocusControl = nil then
    raise Exception.CreateFmt('UIEntityComponent.Bind %s / %s FocusControl = nil ', [Component.Name, Field.AttributeName]);

  Result := Self.Bind( Field.AttributeName, Field.DisplayName, Component.FocusControl );
end;

function UIEntityComponent.Bind(const Field: EntityFieldMetadata; Component: TWinControl): IUIFormValidatorBuilder;
begin
  Result := Self.Bind( Field.AttributeName, Field.DisplayName, Component );
end;

function UIEntityComponent.Bind(Component: TWinControl; const FieldCaption: string): IUIFormValidatorBuilder;
var
  I: Integer;
  S: string;
begin
  I := 1;
  if StartsText('ed_', Component.Name) or StartsText('ck_', Component.Name) then
    I := 4
  else if StartsText('ed', Component.Name) or StartsText('ck', Component.Name) then
    I := 3;

  S := Copy(Component.Name, I, Length(Component.Name));

  FGroup.AddObject(S, Component);

  //if DefaultHints then
    //FIndexDefault := FGroup.Count - 1;

  if FieldCaption <> '' then
    FCaptions.Values[S] := FieldCaption;

  Result := Self;
end;  

procedure UIEntityComponent.Validate(const Input: ValidationEntityOutput);
const
  COR_DESTAQUE = $00D5D5FF;
var
  I, Idx: Integer;
  firstCanFocus, winCtrl: TWinControl;
  corDestaque: TColor;
  cHandle: {$IFNDEF VER180}NativeUInt{$ELSE}Cardinal{$ENDIF};
  dict: SimpleStringDictionary;
  S: string;
begin
  Reset();
  SetLength(FHandlesBalloons, FGroup.Count);

  dict := SimpleStringDictionary.Create;
  try
    firstCanFocus := nil;
    for I := Low(Input.Validations) to High(Input.Validations) do
    begin
      Idx := FGroup.IndexOf(Input.Validations[I].FieldName);

      if Idx = -1 then
        Idx := FIndexDefault;

      if Idx >= 0 then
      begin
        winCtrl := TWinControl(FGroup.Objects[Idx]);

        if not ComponentIsShowing(winCtrl) //not winCtrl.Showing
          and (FIndexDefault > -1) then // Se o compoente ficou visivel 1 vez smepre o Showing retorna true, pode ser um  bug do Delphi
        begin
          winCtrl := TWinControl(FGroup.Objects[FIndexDefault]);
          Idx := FIndexDefault;
        end;

        if winCtrl is TEdit then
          (winCtrl as TEdit).Color := COR_DESTAQUE

        else if winCtrl is TMemo then
          (winCtrl as TMemo).Color := COR_DESTAQUE

        else if winCtrl is TMaskEdit then
          (winCtrl as TMaskEdit).Color := COR_DESTAQUE

        else if winCtrl is TComboBox then
          (winCtrl as TComboBox).Color := COR_DESTAQUE;

        if winCtrl is TWinControl then
        begin
          S := dict.GetValue(FGroup[Idx]); //
          if S <> '' then
            S := S + sLineBreak;

          if (Idx = FIndexDefault) or not ComponentIsShowing(winCtrl) then
            S := S + Format('%s: %s', [ Input.Validations[I].Display, Input.Validations[I].GetMessage() ])

          else
            S := S + Input.Validations[I].GetMessage();

          dict[FGroup[Idx]] := S;
        end;

        if (firstCanFocus = nil) and
          winCtrl.CanFocus and
          winCtrl.Enabled and
          winCtrl.Visible then
        begin
          try
            winCtrl.SetFocus;
            firstCanFocus := winCtrl;
          except
          end;
        end;
      end;
    end;

    for I := 0 to FGroup.Count - 1 do
      if dict.TryGetValue(FGroup[I], S) then
      begin
        winCtrl := TWinControl(FGroup.Objects[I]);

        if not ComponentIsShowing(winCtrl) and (FIndexDefault > -1) then
          winCtrl := TWinControl(FGroup.Objects[FIndexDefault]);

        if not winCtrl.CanFocus then
          S := '*' + S;

        BalloonTipFixed.ShowByWinComponent( winCtrl, S, cHandle, btflBottomRight, GetCaption(FGroup[I]));
        FHandlesBalloons[I] := cHandle;
        Timer.Enabled := True;
      end;

  finally
    dict.Free;
  end;
end;

{ UIFormValidatorFactory }

class function UIFormValidatorFactory.Builder(DefaultComponentHints: TWinControl): IUIFormValidatorBuilder;
begin
  Result := UIEntityComponent.Create(DefaultComponentHints);
end;

class function UIFormValidatorFactory.Builder(
  const Metadata: EntityMetadata; DefaultComponentHints: TWinControl
): IUIFormValidatorBuilder;
begin
  Result := UIEntityComponent.Create(Metadata, DefaultComponentHints);
end;

end.
