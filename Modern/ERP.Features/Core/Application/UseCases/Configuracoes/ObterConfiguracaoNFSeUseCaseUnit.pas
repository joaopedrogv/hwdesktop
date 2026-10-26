unit ObterConfiguracaoNFSeUseCaseUnit;

interface

uses
  IConfiguracaoNFSeServiceUnit,
  ConfiguracaoNFSeModelUnit;

type
  IObterConfiguracaoNFSeUseCase = interface
    ['{D0B55EA7-C96C-4FCB-AE44-DB2AEF2D8878}']
    function Executar( EmpresaId: Integer ): ConfiguracaoNFSeModel;
  end;

  ObterConfiguracaoNFSeUseCase = class(TInterfacedObject, IObterConfiguracaoNFSeUseCase)
  private
    FConfigService: IConfiguracaoNFSeService;
  public
    constructor Create(ConfigService: IConfiguracaoNFSeService);

    function Executar( EmpresaId: Integer ): ConfiguracaoNFSeModel;
  end;

implementation

{ ObterConfiguracaoNFSeUseCase }

constructor ObterConfiguracaoNFSeUseCase.Create(ConfigService: IConfiguracaoNFSeService);
begin
  FConfigService := ConfigService;
end;

function ObterConfiguracaoNFSeUseCase.Executar(EmpresaId: Integer): ConfiguracaoNFSeModel;
begin
  Result := FConfigService.Executar(EmpresaId);
end;

end.
