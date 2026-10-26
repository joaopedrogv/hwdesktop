unit BaseUseCaseUnit;

interface
           
uses
  IDataBaseConnectionUnit,
  BaseClassUnit;

type
  BaseUseCase = class(BaseClass) 
  protected
    FConnection: IDataBaseConnection;
    constructor Create(Connection: IDataBaseConnection);
  end;

  TInterfacedBaseUseCase = class(TInterfacedObject)
  protected
    FConnection: IDataBaseConnection;
    constructor Create(Connection: IDataBaseConnection);
  end;

implementation


{ BaseUseCase }

constructor BaseUseCase.Create(Connection: IDataBaseConnection);
begin
  FConnection := Connection;
end;

{ TInterfacedBaseUseCase }

constructor TInterfacedBaseUseCase.Create(Connection: IDataBaseConnection);
begin                       
  FConnection := Connection;
end;

end.
