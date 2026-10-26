unit IniciarDpsVazioUseCaseUnit;

interface

uses
  SysUtils,
  InicializarDpsModelUnit,
  IInicializarDpsServiceUnit,
  NFSeModelUnit, ISessionContextUnit;

type
  IIniciarDpsVazioUseCase = interface
    ['{7AD40822-9434-4458-BAD7-F1EE97296ABF}']
    function Executar(const Input: InicializarDpsModel): NFSeModel;
  end;

  IniciarDpsVazioUseCase = class(TInterfacedObject, IIniciarDpsVazioUseCase)
  private
    FSession: ISessionContext;
    FInicializarDps: IInicializarDpsService;
  public
    constructor Create( Session: ISessionContext; InicializarDps: IInicializarDpsService );
    function Executar(const Input: InicializarDpsModel): NFSeModel;
  end;

implementation

{ IniciarDpsVazioUseCase }

constructor IniciarDpsVazioUseCase.Create( Session: ISessionContext; InicializarDps: IInicializarDpsService );
begin
  FSession := Session;
  FInicializarDps := InicializarDps;
end;

function IniciarDpsVazioUseCase.Executar(const Input: InicializarDpsModel): NFSeModel;
begin
  Result := FInicializarDps.Executar( InicializarDpsCommand.Create(
    FSession.EmpresaId, Input.DataCompetencia, Input.Natureza, Input.ClienteId, Input.ServicoId
  ));
end;

end.
