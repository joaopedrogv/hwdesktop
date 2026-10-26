unit IUIFormValidatorUnit;

interface

uses
  {$IFNDEF VER180}
  Vcl.Controls,
  {$ELSE}
  Controls,
  {$ENDIF}
   {Classes, }
   StdCtrls,
   ValidationEntityOutputUnit,
   MessageTransferType,
   TipoComunsUnit,
   EntityMetadataUnit;

type
  IUIFormValidator = interface
    ['{418BA671-5235-4F72-A213-934D8A17EA4C}']
    procedure Validate(const Input: ValidationEntityOutput);
    procedure Reset();
    function FormatValidations(const Input: ValidationEntityOutput): string;
  end;

  IUIFormComunicator = interface
    ['{A0FE942C-A596-466D-B991-75541CAAAD20}']
    procedure SendHint(const AMessage: MessageTransfer); overload;
    procedure SendHint(AControl: TWinControl; const AMessage: MessageTransfer); overload;
  end;

  IUIFormValidatorBuilder = interface
    ['{01704390-BA2F-434B-8635-F5EE4461814B}']
    function Bind(Component: TWinControl; const FieldCaption: string = ''): IUIFormValidatorBuilder; overload;
    function Bind(Component: TLabel): IUIFormValidatorBuilder; overload;
    function Bind(const Field: EntityFieldMetadata; Component: TLabel): IUIFormValidatorBuilder; overload;
    function Bind(const Field: EntityFieldMetadata; Component: TWinControl): IUIFormValidatorBuilder; overload;
    function Bind(const FieldName: string; Component: TLabel): IUIFormValidatorBuilder; overload;
    function Bind(const FieldName: string; Component: TWinControl): IUIFormValidatorBuilder; overload;
    function Bind(const FieldName, FieldCaption: string; Component: TWinControl): IUIFormValidatorBuilder; overload;
    function Validator(): IUIFormValidator;
    function Comunicator(): IUIFormComunicator;
  end;

implementation

end.
