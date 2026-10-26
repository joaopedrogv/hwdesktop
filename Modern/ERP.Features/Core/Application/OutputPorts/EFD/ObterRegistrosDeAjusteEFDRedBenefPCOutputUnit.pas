unit ObterRegistrosDeAjusteEFDRedBenefPCOutputUnit;

interface

uses
  RegistroAjusteEFDPCVOUnit;

type
  ObterRegistrosDeAjusteEFDRedBenefPCOutput = class
  private
    FRegistrosM220: RegistroAjusteEFDPCVOList;
    FRegistrosM620: RegistroAjusteEFDPCVOList;
  public
    constructor Create(ARegistrosM220: RegistroAjusteEFDPCVOList; ARegistrosM620: RegistroAjusteEFDPCVOList);
    destructor Destroy; override;

    property RegistrosM220: RegistroAjusteEFDPCVOList read FRegistrosM220;
    property RegistrosM620: RegistroAjusteEFDPCVOList read FRegistrosM620;
  end;

implementation

uses
  SysUtils;

{ ObterRegistrosDeAjusteEFDRedBenefPCOutput }

constructor ObterRegistrosDeAjusteEFDRedBenefPCOutput.Create(
  ARegistrosM220: RegistroAjusteEFDPCVOList; ARegistrosM620: RegistroAjusteEFDPCVOList
);
begin
  FRegistrosM220 := ARegistrosM220;
  FRegistrosM620 := ARegistrosM620;
end;

destructor ObterRegistrosDeAjusteEFDRedBenefPCOutput.Destroy;
begin
  FRegistrosM220.Free();
  FRegistrosM620.Free();
  inherited;
end;

end.
