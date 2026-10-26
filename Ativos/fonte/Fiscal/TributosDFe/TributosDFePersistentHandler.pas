unit TributosDFePersistentHandler;

interface

uses
  Classes,
  BaseClassUnit,
  ITransactionUnit,
  {$IFNDEF VER180}IBX.IBDatabase{$ELSE}IBDatabase{$ENDIF},
  TributoDFeContextEtdUnit,
  TributoDFeOrigemEnumUnit,
  ISalvarTributoDFeUseCaseUnit, IRemoverTributoDFeUseCaseUnit;

type 
  {$IFDEF INTF_ON}
  ITributosPersistentHandler = interface
    ['{8E2CBB1C-EA58-477A-BE3D-C37E4C95B4FB}']
    procedure SetItem(Item: TributoDFeContextEtd; Origem: TributoDFeOrigemEnum);
    procedure Delete(const Id: string; Origem: TributoDFeOrigemEnum);
  end;
  {$ELSE}
  ITributosPersistentHandler = class(BaseClass)
  public
    procedure SetItem(Item: TributoDFeContextEtd; Origem: TributoDFeOrigemEnum); virtual; abstract;
    procedure Delete(const Id: string; Origem: TributoDFeOrigemEnum); virtual; abstract;
  end;
  {$ENDIF}
      
  {$IFDEF INTF_ON}
  TributosPersistentHandler = class(TInterfacedObject, ITributosPersistentHandler)
  {$ELSE}
  TributosPersistentHandler = class(ITributosPersistentHandler)
  {$ENDIF}
  private
    FIBTransaction: TIBTransaction;
    FSalvarUseCase: ISalvarTributoDFeUseCase;
    FRemoverUseCase: IRemoverTributoDFeUseCase;

    function GetTransaction(): TIBTransaction;
  public
    constructor Create(
      ATransaction: TIBTransaction;
      const SalvarUseCase: ISalvarTributoDFeUseCase;
      const RemoverUseCase: IRemoverTributoDFeUseCase
    );
    destructor Destroy; override;
          
  {$IFDEF INTF_ON}
    // O parametro Origem é para certificar que está gravando para o tipo correto
    procedure SetItem(Item: TributoDFeContextEtd; Origem: TributoDFeOrigemEnum);
    procedure Delete(const Id: string; Origem: TributoDFeOrigemEnum);
  {$ELSE}
    // O parametro Origem é para certificar que está gravando para o tipo correto
    procedure SetItem(Item: TributoDFeContextEtd; Origem: TributoDFeOrigemEnum); override;
    procedure Delete(const Id: string; Origem: TributoDFeOrigemEnum); override;
  {$ENDIF}
  end;

implementation

uses
  SysUtils,
  SetupUnit,
  TipoComunsUnit,
  CreateEntityUseCaseOutputUnit,
  StringServiceUnit,
  ValidacaoItemOutputUnit,
  IBXTransactionLegacyUnit;

{ TributosPersistentHandler }

constructor TributosPersistentHandler.Create(
  ATransaction: TIBTransaction;
  const SalvarUseCase: ISalvarTributoDFeUseCase;
  const RemoverUseCase: IRemoverTributoDFeUseCase
);
begin
  FIBTransaction := ATransaction;
  FSalvarUseCase := SalvarUseCase;
  FRemoverUseCase := RemoverUseCase;
end;

procedure TributosPersistentHandler.Delete(const Id: string; Origem: TributoDFeOrigemEnum);
var
  idsDel: TArrayString;
  Transaction: ITransaction;
begin
  if not Assigned(FRemoverUseCase) then
    raise Exception.Create('FRemoverUseCase is not assigned');

  Transaction := IBXTransactionLegacy.Create();
  try
    IBXTransactionLegacy(Transaction).OnNeedTransaction := GetTransaction;

    AppSetup.DatabaseConnection.UseTransaction( Transaction );
    try
      SetLength(idsDel, 1);
      idsDel[0] := Id;

      FRemoverUseCase.Executar( idsDel, Origem );

    finally
      AppSetup.DatabaseConnection.ReleaseTransaction( Transaction.GetId() );
    end;
  finally
    Transaction.FreeTransaction();
  end;
end;

destructor TributosPersistentHandler.Destroy;
begin
  FSalvarUseCase.FreeSafe();
  FRemoverUseCase.FreeSafe();
  inherited;
end;

function TributosPersistentHandler.GetTransaction: TIBTransaction;
begin
  Result := FIBTransaction;
end;

procedure TributosPersistentHandler.SetItem(Item: TributoDFeContextEtd; Origem: TributoDFeOrigemEnum);
var
  useCaseResult: CreateEntityUseCaseOutput;
  countErr: Integer;
  erros: TArrayString;
  iErros: Integer;
  Transaction: ITransaction;
begin
  if not Assigned(FSalvarUseCase) then
    raise Exception.Create('FSalvarUseCase is not assigned');

  SetLength(erros, 0);
  countErr := 0;

  Transaction := IBXTransactionLegacy.Create();
  try
    IBXTransactionLegacy(Transaction).OnNeedTransaction := GetTransaction;

    AppSetup.DatabaseConnection.UseTransaction( Transaction );
    try
      Item.Origem := Origem;
      useCaseResult := FSalvarUseCase.Executar( item );
      try
        if not useCaseResult.Validation.IsValid then
        begin
          for iErros := Low(useCaseResult.Validation.Validations) to High(useCaseResult.Validation.Validations) do
          begin
            if countErr >= Length(erros) then
              SetLength(erros, Length(erros) + 8);

            erros[countErr] := Format( '[Campo %s] - %s ', [ useCaseResult.Validation.Validations[iErros].FieldName, useCaseResult.Validation.Validations[iErros].Detail ]);
            Inc(countErr);
          end;
          SetLength(erros, countErr);
        end;
      finally
        useCaseResult.Free();
      end;

    finally
      AppSetup.DatabaseConnection.ReleaseTransaction( Transaction.GetId() );
    end;
  finally
    Transaction.FreeTransaction();
  end;

  if countErr > 0 then
  begin
    SetLength(erros, countErr);
    raise Exception.Create(
      StringService.Join( sLineBreak + '-' + sLineBreak, erros )
    );
  end;
end;

end.
