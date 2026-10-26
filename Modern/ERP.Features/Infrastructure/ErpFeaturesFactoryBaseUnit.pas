unit ErpFeaturesFactoryBaseUnit;

interface

uses
  ISessionContextUnit;

type
  ErpFeaturesFactoryBase = class
  protected
    FSession: ISessionContext;
    function CreateSecretPorEmpresaNFSe(): string;
  protected
    const
      TWOFISH_SECRET_KEY = 'SECRET-TOKEN-C9KHMq2syh45KYtd2iUL'; // Nao sei onde colocar essa SecretKey
  end;

implementation

uses
  SysUtils;

{ ErpFeaturesFactoryBase }

function ErpFeaturesFactoryBase.CreateSecretPorEmpresaNFSe: string;
begin
  Result := Format('t0k3n-%s-8L1TBc0w', [FSession.EmpresaCNPJ]);
end;

end.
