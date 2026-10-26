unit TransferenciaCBSServiceUnit;

interface

uses
  TipoComunsUnit,
  ITransferenciaCBSRepositoryUnit,
  IVersaoBaseDadosRepositoryUnit;

type
  ITransferenciaCBSService = interface
    ['{38D11F42-0DB8-446C-92FB-D355C27BD5F2}']
    function GetPercentualTransferencia(Data: TDate): Currency;
  end;

  TransferenciaCBSService = class(TInterfacedObject, ITransferenciaCBSService)
  private
     FTransferenciaCBSRepo: ITransferenciaCBSRepository;
     FVersaoBaseDadosRepo: IVersaoBaseDadosRepository;
  public
    constructor Create(
      TransferenciaCBSRepo: ITransferenciaCBSRepository; VersaoBaseDadosRepo: IVersaoBaseDadosRepository
    );

    function GetPercentualTransferencia(Data: TDate): Currency;
  end;

implementation

uses
  SysUtils, CurrencyNullableUnit, EValidacaoRTCUnit, VersaoSerproEtdUnit;

{TransferenciaCBSService}

constructor TransferenciaCBSService.Create(
  TransferenciaCBSRepo: ITransferenciaCBSRepository; VersaoBaseDadosRepo: IVersaoBaseDadosRepository
);
begin
  FTransferenciaCBSRepo := TransferenciaCBSRepo;
  FVersaoBaseDadosRepo := VersaoBaseDadosRepo;
end;

function TransferenciaCBSService.GetPercentualTransferencia(Data: TDate): Currency;
var
  percent: CurrencyNullable;
  versao: VersaoSerproEtd;
begin
  percent := FTransferenciaCBSRepo.ObterPercentualTransferencia(Data);

  if percent.IsNull then
  begin
    // O teste abaixo é necessário para manter compatibilidade com os clientes que ainda não tem sua base de dados atualizada.
    versao := FVersaoBaseDadosRepo.GetUltimaVersao();
    if not versao.IsNull() and (versao.Id > 0029) then
      raise EValidacaoRTC.Create('Percentual de transferência de CBS para ente federativo não encontrada.');
  end;

  Result := percent.Value;
end;

end.