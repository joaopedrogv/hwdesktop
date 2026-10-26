unit RegistradorAlertasDFeUtils;

interface

uses
  SysUtils,
  ACBrDFeComum.Proc;

type
  RegistradorAlertasDFeUtil = class
  public
    class procedure ResolverAlertas(const ProcNFe: TProcDFe); static;
  end;

implementation

uses
  ContainerDFeUnit, RegistrarDFeAlertasInputUnit;

{ RegistradorAlertasDFeUtil }

class procedure RegistradorAlertasDFeUtil.ResolverAlertas(const ProcNFe: TProcDFe);
var
  inputRegAlertas: RegistrarDFeAlertasInput;
begin
  // ACBr ainda nao trata cStat 120, e ainda nao tem a lista de mensagens
  if not ProcNFe.cStat in [100, 120] then // Alertas
    Exit;

  if ProcNFe.xMsg.Trim().IsEmpty() then // Provavelmente isso para defuncionar quando virar collection
    Exit;

  inputRegAlertas := RegistrarDFeAlertasInput.Create( ProcNFe.chDFe );
  try
    // Quando ACBR implementar provavelmente vai ficar assim
    //for J := 0 to Fnfe.NotasFiscais.Items[I].NFe.ProcNFe.Mensagens do
    if not ProcNFe.xMsg.Trim().IsEmpty() then
      inputRegAlertas.Add( ProcNFe.cMsg, ProcNFe.xMsg);

    ContainerDFe.GetInstance().DFeFeaturesFactory.CreateRegistrarDFeAlertasUseCase()
      .Executar(inputRegAlertas);
  finally
    inputRegAlertas.Free();
  end;
end;

end.
