unit ObterSituacaoEmissaoNFSeDeOrdemServUseCaseUnit;

interface

uses
  IPedVendaRepositoryUnit;

type
  SituacaoEmissaoNFSeDeOrdemServOutput = record
  private
    FComNotaEmitida: Boolean;
    FComNotaEdicao: Boolean;
  public
    class function Create( ComNotaEmitida, ComNotaEdicao: Boolean): SituacaoEmissaoNFSeDeOrdemServOutput; static;
    property ComNotaEmitida: Boolean read FComNotaEmitida;
    property ComNotaEdicao: Boolean read FComNotaEdicao;
  end;

  IObterSituacaoEmissaoNFSeDeOrdemServUseCase = interface
    ['{9786B7A7-02CE-4ABC-A455-B7B57FAA777E}']
    function Executar(NumeroOS: Integer): SituacaoEmissaoNFSeDeOrdemServOutput;
  end;

  ObterSituacaoEmissaoNFSeDeOrdemServUseCase = class(TInterfacedObject, IObterSituacaoEmissaoNFSeDeOrdemServUseCase)
  private
    FPedVendaRepo: IPedVendaRepository;
  public
    constructor Create(PedVendaRepo: IPedVendaRepository);
    function Executar(NumeroOS: Integer): SituacaoEmissaoNFSeDeOrdemServOutput;
  end;

implementation

uses
  OSItemFiscalEtdUnit, ArrayServiceUnit;

{ ObterSituacaoEmissaoNFSeDeOrdemServUseCase }

constructor ObterSituacaoEmissaoNFSeDeOrdemServUseCase.Create(PedVendaRepo: IPedVendaRepository);
begin
  FPedVendaRepo := PedVendaRepo;
end;

function ObterSituacaoEmissaoNFSeDeOrdemServUseCase.Executar(NumeroOS: Integer): SituacaoEmissaoNFSeDeOrdemServOutput;
var
  OSItens: OSItemFiscalEtdlList;
  I: Integer;
  comNota, comVinculoNota: Boolean;
begin
  OSItens := FPedVendaRepo.ListarItensFiscaisOS(ArrayService.MakeArrayInt(NumeroOS));
  try
    comNota := False;
    comVinculoNota := False;

    for I := 0 to OSItens.Count - 1 do
    begin
      // O teste tem de ser assim, se o servico tem nota emitida o vinculo pouco importa
      // O vinculo somente é importante quando nao tem nota, aí o usuario tem de resolver o vinculo
      // antes de reabrir a nota
      if OSItens[I].NumNF.Value > 0 then
        comNota := True

      else if not OSItens[I].NFSeId.IsNullOrWhiteSpace() then
        comVinculoNota := True;

      if comNota and comVinculoNota then
        Break;
    end;

    Result := SituacaoEmissaoNFSeDeOrdemServOutput.Create( comNota, comVinculoNota );

  finally
    OSItens.Free;
  end;
end;

{ SituacaoEmissaoNFSeDeOrdemServOutput }

class function SituacaoEmissaoNFSeDeOrdemServOutput.Create(ComNotaEmitida,
  ComNotaEdicao: Boolean): SituacaoEmissaoNFSeDeOrdemServOutput;
begin
  Result.FComNotaEmitida := ComNotaEmitida;
  Result.FComNotaEdicao := ComNotaEdicao;
end;

end.
