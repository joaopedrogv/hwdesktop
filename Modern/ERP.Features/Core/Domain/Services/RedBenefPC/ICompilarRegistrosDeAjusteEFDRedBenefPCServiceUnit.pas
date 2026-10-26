unit ICompilarRegistrosDeAjusteEFDRedBenefPCServiceUnit;

interface

uses
  RegistroAjusteEFDPCVOUnit, PeriodoMultiEmpresaVOUnit;

type
  CompilarRegistrosDeAjusteEFDRedBenefPCServiceResult = class
  private
    FRegistrosM220: RegistroAjusteEFDPCVOList;
    FRegistrosM620: RegistroAjusteEFDPCVOList;
  public
    constructor Create(ARegistrosM220, ARegistrosM620: RegistroAjusteEFDPCVOList);
    destructor Destroy; override;

    property RegistrosM220: RegistroAjusteEFDPCVOList read FRegistrosM220;
    property RegistrosM620: RegistroAjusteEFDPCVOList read FRegistrosM620;
  end;

  ICompilarRegistrosDeAjusteEFDRedBenefPCService = interface
    ['{A9F8DF57-CC88-460D-BDC6-7C9658BE1629}']
    function Executar(Input: PeriodoMultiEmpresaVO): CompilarRegistrosDeAjusteEFDRedBenefPCServiceResult;
  end;

implementation

uses
  SysUtils;

{ CompilarRegistrosDeAjusteEFDRedBenefPCServiceResult }

constructor CompilarRegistrosDeAjusteEFDRedBenefPCServiceResult.Create(
  ARegistrosM220: RegistroAjusteEFDPCVOList; ARegistrosM620: RegistroAjusteEFDPCVOList
);
begin
  FRegistrosM220 := ARegistrosM220;
  FRegistrosM620 := ARegistrosM620;
end;

destructor CompilarRegistrosDeAjusteEFDRedBenefPCServiceResult.Destroy;
begin
  FRegistrosM220.Free();
  FRegistrosM620.Free();
  inherited;
end;
end.
