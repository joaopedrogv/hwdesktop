unit IOperacaoPassivelDeRedBenefPcUseCaseUnit;

interface

uses
  InfComplementarDFeEtdUnit, TipoComunsUnit;

type
  ItemFiscalPC = record
  private
    FCST: string;
    FNatRec: string;
    FNCM: string;
  public
    class function Create(const ACST, ANatRec, ANCM: string): ItemFiscalPC; static;

    property CST: string read FCST;
    property NatRec: string read FNatRec;
    property NCM: string read FNCM;
  end;

  ItemFiscalPCArray = array of ItemFiscalPC;

  OperacaoPassivelDeRedBenefPcUseCaseInput = record
  private
    FItens: ItemFiscalPCArray;
    FData: TDate;
  public
    class function Create(AData: TDate): OperacaoPassivelDeRedBenefPcUseCaseInput; static;

    procedure Add(const ACST, ANatRec, ANCM: string);

    property Data: TDate read FData;
    property Itens: ItemFiscalPCArray read FItens;
  end;

  IOperacaoPassivelDeRedBenefPcUseCase = interface
    ['{95CCFCF5-B259-44BC-B990-0D63568042AE}']
    function Executar(const Input: OperacaoPassivelDeRedBenefPcUseCaseInput): Boolean;
  end;

implementation

{ OperacaoPassivelDeRedBenefPcUseCaseInput }

procedure OperacaoPassivelDeRedBenefPcUseCaseInput.Add(const ACST, ANatRec, ANCM: string);
var
  I: Integer;
begin
  for I := 0 to High(FItens) do
    if (FItens[I].CST = ACST)
      and (FItens[I].NatRec = ANatRec)
      and (FItens[I].NCM = ANCM) then
    Exit;

  SetLength(FItens, Length(FItens) + 1);

  FItens[High(FItens)] := ItemFiscalPC.Create(ACST, ANatRec, ANCM);
end;

class function OperacaoPassivelDeRedBenefPcUseCaseInput.Create(AData: TDate): OperacaoPassivelDeRedBenefPcUseCaseInput;
begin
  Result.FData := AData;
  SetLength( Result.FItens, 0);
end;

{ ItemFiscalPC }

class function ItemFiscalPC.Create(const ACST, ANatRec, ANCM: string): ItemFiscalPC;
begin
  Result.FCST := ACST;
  Result.FNatRec:= ANatRec;
  Result.FNCM:= ANCM;
end;

end.