unit TributosDFeInMemoryHandler;

interface

uses
  Classes,
  BaseClassUnit,
  ITransactionUnit,
  IBDatabase,
  TributoDFeContextEtdUnit,
  TributoDFeOrigemEnumUnit;

type         
  {$IFDEF INTF_ON}
  ITributosHandler = interface
    ['{E5BAC7CA-92E8-48E2-BFA1-0195D6EFDB6E}']
    procedure Load(NotaFiscalId, EmpresaId: Integer); overload;
    procedure Load(NotaFiscalId, EmpresaId, NItem: Integer); overload;
    function GetItem(const Id: string): TributoDFeContextEtd;
    procedure SetItem(const Id: string; Item: TributoDFeContextEtd);
    procedure Delete(const Id: string);
    procedure Clear();
    procedure Apply();
  {$ELSE}
  ITributosHandler = class(BaseClass)
  public
    procedure Load(NotaFiscalId, EmpresaId: Integer); overload; virtual; abstract;
    procedure Load(NotaFiscalId, EmpresaId, NItem: Integer); overload; virtual; abstract;
    function GetItem(const Id: string): TributoDFeContextEtd; virtual; abstract;
    procedure SetItem(const Id: string; Item: TributoDFeContextEtd); virtual; abstract;
    procedure Delete(const Id: string); virtual; abstract;
    procedure Clear(); virtual; abstract;
    procedure Apply(); virtual; abstract;
  {$ENDIF}
  end;
           
  {$IFDEF INTF_ON}                                            
  TributosHandler = class(TInterfacedObject, ITributosHandler)
  {$ELSE}                                                     
  TributosHandler = class(ITributosHandler)
  {$ENDIF}
  private
    FIBTransaction: TIBTransaction;
    FCache: TStrings;
    FDbIds: TStrings;
    FOrigem: TributoDFeOrigemEnum;

    function GetTransaction(): TIBTransaction;
  public
    //constructor Create(AOwner: TDataSet_OOP);
    constructor Create(ATransaction: TIBTransaction; AOrigem: TributoDFeOrigemEnum);
    destructor Destroy; override;

  {$IFDEF INTF_ON}
    procedure Load(NotaFiscalId, EmpresaId: Integer); overload;
    procedure Load(NotaFiscalId, EmpresaId, NItem: Integer); overload;
    function GetItem(const Id: string): TributoDFeContextEtd;
    procedure SetItem(const Id: string; Item: TributoDFeContextEtd);
    procedure Delete(const Id: string);
    procedure Clear();
    procedure Apply();
  {$ELSE}
    procedure Load(NotaFiscalId, EmpresaId: Integer); overload; override;
    procedure Load(NotaFiscalId, EmpresaId, NItem: Integer); overload; override;
    function GetItem(const Id: string): TributoDFeContextEtd; override;
    procedure SetItem(const Id: string; Item: TributoDFeContextEtd); override;
    procedure Delete(const Id: string); override;
    procedure Clear(); override;
    procedure Apply(); override;
  {$ENDIF}
  end;

implementation

uses
  SysUtils,
  SetupUnit,
  ContainerUnit,
  TipoComunsUnit,
  CreateEntityUseCaseOutputUnit,
  StringServiceUnit,
  ValidacaoItemOutputUnit,
  IBXTransactionLegacyUnit, ErpFeaturesFactoryUnit;

{ TributosHandler }

procedure TributosHandler.Apply;
var
  I: Integer;
  useCaseResult: CreateEntityUseCaseOutput;
  item: TributoDFeContextEtd;
  idsDel: TArrayString;
  countDel, countErr: Integer;
  erros: TArrayString;
  iErros: Integer;
  Transaction: ITransaction;
begin
  SetLength(idsDel, FCache.Count);
  SetLength(erros, 0);
  countDel := 0;
  countErr := 0;

  Transaction := IBXTransactionLegacy.Create();
  IBXTransactionLegacy(Transaction).OnNeedTransaction := GetTransaction;

  AppSetup.DatabaseConnection.UseTransaction( Transaction );
  try


    for I := 0 to FCache.Count - 1 do
    begin

      item := TributoDFeContextEtd(FCache.Objects[I]);

      if item = nil then // Quer dizer que o usuario removeu
      begin
        idsDel[countDel] := FCache[I];
        Inc(countDel);
      end
      else
      begin
        with Container.GetInstance().ErpFeaturesFactory.CreateSalvarTributoDFeUseCase() do
        try
          useCaseResult := Executar( item );
        finally
          FreeSafe();
        end;
        try
          if useCaseResult.Validation.IsValid then
          begin
            item.Free();
            FCache.Objects[I] := useCaseResult.ExtractOutputObj();
          end
          else
            for iErros := Low(useCaseResult.Validation.Validations) to High(useCaseResult.Validation.Validations) do
            begin
              if countErr >= Length(erros) then
                SetLength(erros, Length(erros) + 8);

              erros[countErr] := Format( '[Campo %s] - %s ', [ useCaseResult.Validation.Validations[iErros].FieldName, useCaseResult.Validation.Validations[iErros].Detail ]);
              Inc(countErr);
            end;

        finally
          useCaseResult.Free();
        end;
      end;
    end;

    if countDel > 0 then
    begin
      SetLength(idsDel, countDel);
      try
        Container.GetInstance().ErpFeaturesFactory.CreateRemoverTributoDFeUseCase()
          .Executar( idsDel, FOrigem );

      except on E: Exception do
        begin
          if countErr >= Length(erros) then
            SetLength(erros, Length(erros) + 8);

          erros[countErr] := E.Message;
          Inc(countErr);
        end;
      end;
    end;
  finally
    AppSetup.DatabaseConnection.ReleaseTransaction( Transaction.GetId() );
  end;

  if countErr > 0 then
  begin
    SetLength(erros, countErr);
    raise Exception.Create(
      StringService.Join( sLineBreak + '-' + sLineBreak, erros )
    );
  end;
end;

procedure TributosHandler.Clear;
begin
  while FCache.Count > 0 do
  begin
    if FCache.Objects[0] <> nil then
      try FCache.Objects[0].Free(); except end;

    FCache.Delete(0);
  end;
  FDbIds.Clear; 
end;

constructor TributosHandler.Create(
  ATransaction: TIBTransaction;
  AOrigem: TributoDFeOrigemEnum
);
begin
  FCache := TStringList.Create();
  FDbIds := TStringList.Create();

  FIBTransaction := ATransaction;
  FOrigem := AOrigem;
end;

procedure TributosHandler.Delete(const Id: string);
var
  Idx: Integer;
begin
  if Trim(Id) = '' then
    Exit;

  Idx := FCache.IndexOf(Id);

  if Idx = -1 then
    Exit;

  if FCache.Objects[Idx] <> nil then
  begin
    FCache.Objects[Idx].Free;
    FCache.Objects[Idx] := nil;
  end;

  if FDbIds.IndexOf(Id) = -1 then // Nao veio do banco de dados, pode remover
    FCache.Delete( Idx );

  // Caso veio do banco a chave permanece no cache com objeto = nill, assim o apply vai chamar um delete pra esse caso
end;

destructor TributosHandler.Destroy;
begin
  Clear();
  FCache.Free();
  FDbIds.Clear();

  //FTransaction := nil;

  inherited;
end;

function TributosHandler.GetItem(const Id: string): TributoDFeContextEtd;
var
  Idx: Integer;
begin
  if Trim(Id) = '' then
  begin
    Result := nil;
    Exit;
  end;

  Idx := FCache.IndexOf(Id);

  if Idx = -1 then
  begin
    Result := nil;
    Exit;
  end;

  Result := TributoDFeContextEtd(FCache.Objects[Idx]).Clone();
end;

function TributosHandler.GetTransaction: TIBTransaction;
begin
  Result := FIBTransaction;
end;

procedure TributosHandler.Load(NotaFiscalId, EmpresaId, NItem: Integer);
var
  List: TributoDFeContextEtdList;
  Item: TributoDFeContextEtd;
  Transaction: ITransaction;
begin
  Transaction := IBXTransactionLegacy.Create();
  IBXTransactionLegacy(Transaction).OnNeedTransaction := GetTransaction;
  AppSetup.DatabaseConnection.UseTransaction( Transaction );
  try
    with Container.GetInstance().ErpFeaturesFactory.CreateListarTributosNFePorItemUseCase() do
    try
      List := Executar( NotaFiscalId, EmpresaId, NItem );
    finally
      FreeSafe();
    end;
    try

      Clear();

      while List.Count > 0 do
      begin
        Item := TributoDFeContextEtd(List.Extract(List[0]));

        FCache.AddObject( Item.Id, Item );
        FDbIds.Add( Item.Id );
      end;
    finally
      List.Free();
    end;

  finally
    AppSetup.DatabaseConnection.ReleaseTransaction( Transaction.GetId() );
  end;
end;

procedure TributosHandler.Load(NotaFiscalId, EmpresaId: Integer);
var
  List: TributoDFeContextEtdList;
  Item: TributoDFeContextEtd;
  Transaction: ITransaction;
begin
  Transaction := IBXTransactionLegacy.Create();
  IBXTransactionLegacy(Transaction).OnNeedTransaction := GetTransaction;
  AppSetup.DatabaseConnection.UseTransaction( Transaction );
  try
    with Container.GetInstance().ErpFeaturesFactory.CreateListarTributosNFePorIdUseCase() do
    try
      List := Executar( NotaFiscalId, EmpresaId );
    finally
      FreeSafe();
    end;
    try

      Clear();

      while List.Count > 0 do
      begin
        Item := TributoDFeContextEtd(List.Extract(List[0]));

        FCache.AddObject( Item.Id, Item );
        FDbIds.Add( Item.Id );
      end;
    finally
      List.Free();
    end;

  finally
    AppSetup.DatabaseConnection.ReleaseTransaction( Transaction.GetId() );
  end;
end;

procedure TributosHandler.SetItem(const Id: string; Item: TributoDFeContextEtd);
var
  Idx: Integer;
begin
  if Trim(Id) = '' then
    Exit;

  Idx := FCache.IndexOf(Id);

  if Idx = -1 then
    FCache.AddObject( Id, Item.Clone() )

  else
  begin
    if FDbIds.IndexOf(Id) >= 0 then // Veio do banco de dados
    begin
    end;

    if FCache.Objects[Idx] <> nil then
      FCache.Objects[Idx].Free;

    FCache.Objects[Idx] := Item.Clone();
  end;
end;

end.
