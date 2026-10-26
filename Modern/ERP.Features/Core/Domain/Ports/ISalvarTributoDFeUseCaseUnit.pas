unit ISalvarTributoDFeUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  TributoDFeContextEtdUnit,
  CreateEntityUseCaseOutPutUnit;

type       
  {$IFDEF INTF_ON}
  ISalvarTributoDFeUseCase = interface
    ['{0283B8C8-062B-4A6F-B389-35B64986D262}']
    function Executar(Input: TributoDFeContextEtd): CreateEntityUseCaseOutPut;
  end;}
  {$ELSE}
  ISalvarTributoDFeUseCase = class(BaseUseCase)
  public
    function Executar(Input: TributoDFeContextEtd): CreateEntityUseCaseOutPut; virtual; abstract;
  end;
  {$ENDIF}

implementation

end.
