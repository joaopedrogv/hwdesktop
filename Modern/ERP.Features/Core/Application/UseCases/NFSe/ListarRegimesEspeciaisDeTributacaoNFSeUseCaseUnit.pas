unit ListarRegimesEspeciaisDeTributacaoNFSeUseCaseUnit;

interface

uses
  IConfiguracaoNFSeServiceUnit, IACBrNFSeAdapterUnit, IErrorLoggerUnit, IEmpresasRepositoryUnit;

type
  IListarRegimesEspeciaisDeTributacaoNFSeUseCase = interface
    ['{7FD25629-A836-4846-B073-79F4F880A7BC}']
    function Executar(EmpresaId: Integer): string;
  end;

  ListarRegimesEspeciaisDeTributacaoNFSeUseCase = class(TInterfacedObject, IListarRegimesEspeciaisDeTributacaoNFSeUseCase)
  private
    FLogError: IErrorLogger;
    FConfFactoryNFSe: IConfiguracaoNFSeService;
    FACBr: IACBrNFSeAdapter;
    FEmpresasRepo: IEmpresasRepository;
  public
    constructor Create(
      LogError: IErrorLogger;
      ConfNFSe: IConfiguracaoNFSeService;
      ACBr: IACBrNFSeAdapter;
      EmpresasRepo: IEmpresasRepository
    );
    function Executar(EmpresaId: Integer): string;
  end;


implementation

uses
  SysUtils,
  ConfiguracaoNFSeModelUnit, EmpresaEtdUnit;

{ ListarRegimesEspeciaisDeTributacaoNFSeUseCase }

constructor ListarRegimesEspeciaisDeTributacaoNFSeUseCase.Create(
  LogError: IErrorLogger;
  ConfNFSe: IConfiguracaoNFSeService;
  ACBr: IACBrNFSeAdapter;
  EmpresasRepo: IEmpresasRepository
);
begin
  FConfFactoryNFSe := ConfNFSe;
  FLogError := LogError;
  FACBr     := ACBr;
  FEmpresasRepo := EmpresasRepo;
end;

function ListarRegimesEspeciaisDeTributacaoNFSeUseCase.Executar(EmpresaId: Integer): string;
var
  confNFSe: ConfiguracaoNFSeModel;
  empresa: EmpresaEtd;
begin

  try try
    confNFSe := FConfFactoryNFSe.Executar( EmpresaId );
    empresa := FEmpresasRepo.GetByKey( EmpresaId );

    if empresa = nil then
      raise Exception.Create('Empresa = nil');

    FACBr.Configurar( confNFSe, empresa );

    Result := FACBr.ListaRegimesEspecialTributacao();

  except on E: Exception do
    begin
      Result := 'ERROR = ' + E.Message;
      FLogError.LogError( 'ListarRegimesEspeciaisDeTributacaoNFSeUseCase.Executar - Empresa: %d - Erro: %s', [ EmpresaId, E.Message ]);
    end;
  end;
  finally
    empresa.Free();
  end;
end;

end.

