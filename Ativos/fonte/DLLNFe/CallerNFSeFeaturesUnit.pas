unit CallerNFSeFeaturesUnit;

interface

uses
  TipoComunsUnit;

type
  CallerNFSeFeatures = class
  public
    class function Emitir(NumeroOS: Integer; Silent: Boolean): Boolean;
    class function CriarAnexosEmail(NumeroOS: Integer; Silent: Boolean): TArrayString;
  end;

implementation

uses
  SysUtils, hw_boleto_utils, hw_win_utils, ContainerUnit, INFSExecutorUnit, EValidacaoNegocioUnit,
  UIUtilsUnit, ICriarAnexosEmailUseCaseUnit, NFSExecutorCoordinatorUnit;

class function CallerNFSeFeatures.Emitir(NumeroOS: Integer; Silent: Boolean): Boolean;
var
  I: Integer;
begin
  try
    with Container.GetInstance().ErpFeaturesFactory.CreateNFSExecutorCoordinator()
      .EmitirNFSe( NumeroOS, Silent )
    do
      if MensagemErro <> '' then
        raise EValidacaoNegocio.CreateFmt('Erro na Emissao de NFSe da O.S.: %d%s%s%s', [
          NumeroOS, sLineBreak, sLineBreak, MensagemErro
        ]);

  except on E: Exception do
    if Silent then
      LogApp.Error('HandlerEmissaoNFSe.Emitir. O.S: %d: %', [ NumeroOS, E.Message ])
    else
      UIUtils.HandleError(E);
  end;
end;

class function CallerNFSeFeatures.CriarAnexosEmail(NumeroOS: Integer; Silent: Boolean): TArrayString;
begin
  try

    Result := Container.GetInstance().ErpFeaturesFactory.CreateNFSExecutorCoordinator().CriarAnexosEmail( NumeroOS );

  except on E: Exception do
    if Silent then
      LogApp.Error('HandlerEmissaoNFSe.CriarAnexosEmail. O.S: %d: %', [ NumeroOS, E.Message ])
    else
      UIUtils.HandleError(E);
  end;
end;

end.
