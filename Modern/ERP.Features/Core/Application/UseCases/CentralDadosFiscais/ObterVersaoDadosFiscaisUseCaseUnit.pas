unit ObterVersaoDadosFiscaisUseCaseUnit;

interface

uses
  IConfiguracoesRepositoryUnit,
  VersaoDadosFiscaisOutputUnit;

type
  IObterVersaoDadosFiscaisUseCase = interface
    ['{17797A15-BB40-468A-83E9-F0685AB3BB7B}']
    function Executar(): VersaoDadosFiscaisOutput;
  end;

  ObterVersaoDadosFiscaisUseCase = class(TInterfacedObject, IObterVersaoDadosFiscaisUseCase)
  private
    const CONFIG_VERSAO_RTC = 'rtc_versao_calculadora';
  private
    FConfiguracoesRepo: IConfiguracoesRepository;
  public
    constructor Create(const ConfiguracoesRepo: IConfiguracoesRepository);

    function Executar(): VersaoDadosFiscaisOutput;
  end;

implementation

uses
  SysUtils,
  ConfiguracaoEtdUnit, DateAndTimeNullableUnit;

{ ObterVersaoDadosFiscaisUseCase }

constructor ObterVersaoDadosFiscaisUseCase.Create(const ConfiguracoesRepo: IConfiguracoesRepository);
begin
  FConfiguracoesRepo := ConfiguracoesRepo;
end;

function ObterVersaoDadosFiscaisUseCase.Executar(): VersaoDadosFiscaisOutput;
var
  C: ConfiguracaoEtd;
  D: TDateTime;
begin
  C := FConfiguracoesRepo.GetByKey(CONFIG_VERSAO_RTC, 0);

  if C = nil then
    Result := VersaoDadosFiscaisOutput.Create('', '', 0)

  else
  begin
    if C.ValorDateTime.IsNull or (C.ValorDateTime.Value = 0) then
      D := EncodeDate(2025, 11, 18)
    else
      D := C.ValorDateTime.Value;

    Result := VersaoDadosFiscaisOutput.Create( C.ValorString.Value, 'SERPRO', D );
  end;

end;

end.
