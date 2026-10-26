unit AlertasDFeUtils;

interface

type
  AlertasDFeUtil = class
  public
    class function TryObterAlertasFormatado(const ChaveDFe: string; out Mensagem: string): Boolean; static;
  end;

implementation

uses
  SysUtils, StrUtils,
  ContainerUnit, DFeAlertaEdtUnit, ErpFeaturesFactoryUnit, ListarDFeAlertasUseCaseUnit, TipoComunsUnit,
  StringServiceUnit;

{ AlertasDFeUtil }

class function AlertasDFeUtil.TryObterAlertasFormatado(const ChaveDFe: string; out Mensagem: string): Boolean;
var
  alertas: DFeAlertaEdtList;
  linhas: TArrayString;
  I: Integer;
begin
  try
    alertas := Container.GetInstance().ErpFeaturesFactory.CreateListarDFeAlertasUseCase().Executar(ChaveDFe);

    if alertas.Count = 0 then
    begin
      Result := False;
      Exit;
    end;

    SetLength(linhas, alertas.Count);

    for I := 0 to alertas.Count - 1 do
      linhas[I] := IfThen(alertas.Items[I].Cmsg.HasValue, alertas.Items[I].Cmsg.ToText() + ' - ')
        + alertas.Items[I].Xmsg;

    Mensagem := StringService.Join(sLineBreak + '-' + sLineBreak, linhas);

    Result := True;

  finally
    alertas.Free();
  end;
end;

end.
