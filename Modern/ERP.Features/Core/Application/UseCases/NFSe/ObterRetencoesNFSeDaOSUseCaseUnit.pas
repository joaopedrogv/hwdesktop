unit ObterRetencoesNFSeDaOSUseCaseUnit;

interface

uses
  SysUtils,
  RetencoesNFSeDaOSOutputUnit, INFSeRepositoryUnit;

type
  IObterRetencoesNFSeDaOSUseCase = interface
    ['{8432A87E-3867-4658-A7D9-DA5DF35EAD4B}']
    function Executar(NumeroOS: Integer): RetencoesNFSeDaOSOutput;
  end;

  ObterRetencoesNFSeDaOSUseCase = class(TInterfacedObject, IObterRetencoesNFSeDaOSUseCase)
  private
    FNFSeRepo: INFSeRepository;
  public
    constructor Create(NFSeRepo: INFSeRepository);
    function Executar(NumeroOS: Integer): RetencoesNFSeDaOSOutput;
  end;

implementation

uses
  NFSeOSEtdUnit;

{ ObterRetencoesNFSeDaOSUseCase }

constructor ObterRetencoesNFSeDaOSUseCase.Create(NFSeRepo: INFSeRepository);
begin
  FNFSeRepo := NFSeRepo;
end;

function ObterRetencoesNFSeDaOSUseCase.Executar(NumeroOS: Integer): RetencoesNFSeDaOSOutput;
var
  NfOSs: NFSeOSEtdList;

  VRetIRRF, VRetCP, VRetPIS, VRetCOFINS, VRetCSLL, VRetISS: Currency;
  I: Integer;
begin
  NfOSs := FNFSeRepo.ListarRelacionamento(NumeroOS);

  VRetIRRF := 0;
  VRetCP := 0;
  VRetPIS := 0;
  VRetCOFINS := 0;
  VRetCSLL := 0;
  VRetISS := 0;

  for I := 0 to NfOSs.Count - 1 do
  begin
    VRetIRRF   := VRetIRRF   + NfOSs.Items[I].VRetIrrf;
    VRetCP     := VRetCP     + NfOSs.Items[I].VRetCP;
    VRetPIS    := VRetPIS    + NfOSs.Items[I].VRetPis;
    VRetCOFINS := VRetCOFINS + NfOSs.Items[I].VRetCofins;
    VRetCSLL   := VRetCSLL   + NfOSs.Items[I].VRetCsll;
    VRetISS    := VRetISS    + NfOSs.Items[I].VRetIss;
  end;

  Result := RetencoesNFSeDaOSOutput.Create(
    NumeroOS, VRetIRRF, VRetCP, VRetPIS, VRetCOFINS, VRetCSLL, VRetISS
  );
end;

end.
