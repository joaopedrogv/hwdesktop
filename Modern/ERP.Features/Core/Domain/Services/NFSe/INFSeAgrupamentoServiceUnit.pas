unit INFSeAgrupamentoServiceUnit;

interface

uses
  OSItemFiscalEtdUnit, TipoComunsUnit;

type
  NFSeRegistroOS = record
  private
    FNumeroOS: Integer;
    FServicosId: TArrayInteger;
    FValorDescontos: Currency;
    FValorServicos: Currency;
  public
    class function Create( ANumeroOS: Integer ): NFSeRegistroOS; static;
    procedure Acumular(AValorServicos, AValorDescontos: Currency);
    procedure AddServicoId(AServicoId: Integer);

    property NumeroOS: Integer read FNumeroOS;
    property ServicosId: TArrayInteger read FServicosId;
    property ValorServicos: Currency read FValorServicos;
    property ValorDescontos: Currency read FValorDescontos;
  end;

  NFSeRegistroOSArray = array of NFSeRegistroOS;

  NFSeAgrupamentoOS = record
  private
    FClienteId: Integer;
    FServicoId: Integer;
    FDataPrestacao: TDate;
    FValorServicos: Currency;
    FValorDescontos: Currency;
    FCodigoFiscal: string;
    FRegistrosOS: NFSeRegistroOSArray;
    function GetOSIDs: TArrayInteger;
  public
    class function Create(
      AClienteId: Integer;
      AServicoId: Integer;
      ADataPrestacao: TDate;
      AValorServicos: Currency;
      AValorDescontos: Currency;
      const ACodigoFiscal: string;
      const ARegistrosOS: NFSeRegistroOSArray
    ): NFSeAgrupamentoOS; static;

    property ClienteId: Integer read FClienteId;
    property ServicoId: Integer read FServicoId;
    property DataPrestacao: TDate read FDataPrestacao;
    property ValorServicos: Currency read FValorServicos;
    property ValorDescontos: Currency read FValorDescontos;
    property CodigoFiscal: string read FCodigoFiscal;
    property RegistrosOS: NFSeRegistroOSArray read FRegistrosOS;
    property OSIDs: TArrayInteger read GetOSIDs;
  end;

  NFSeAgrupamentosOS = array of NFSeAgrupamentoOS;

  INFSeAgrupamentoService = interface
    ['{19F280FE-3350-4151-B90F-94012D5A2FDE}']
    function AgruparItensParaNFSe(
      const Itens: OSItemFiscalEtdlList;
      AgruparPorCTribNac: Boolean
    ): NFSeAgrupamentosOS;
  end;

implementation

uses
  SysUtils, ArrayServiceUnit;

{ NFSeAgrupamentoOS }

class function NFSeAgrupamentoOS.Create(
  AClienteId: Integer;
  AServicoId: Integer;
  ADataPrestacao: TDate;
  AValorServicos: Currency;
  AValorDescontos: Currency;
  const ACodigoFiscal: string;
  const ARegistrosOS: NFSeRegistroOSArray
): NFSeAgrupamentoOS;
begin
  Result.FClienteId := AClienteId;
  Result.FServicoId := AServicoId;
  Result.FDataPrestacao := ADataPrestacao;
  Result.FValorServicos := AValorServicos;
  Result.FValorDescontos := AValorDescontos;
  Result.FCodigoFiscal := ACodigoFiscal;
  Result.FRegistrosOS := ARegistrosOS;
end;

{function NFSeAgrupamentoOS.GetOSIDs: TArrayInteger;
begin

end;

 NFSeRegistroOS }

procedure NFSeRegistroOS.Acumular(AValorServicos, AValorDescontos: Currency);
begin
  FValorServicos := FValorServicos + AValorServicos;
  FValorDescontos := FValorDescontos + AValorDescontos;
end;

procedure NFSeRegistroOS.AddServicoId(AServicoId: Integer);
begin
  if not ArrayService.Contains(FServicosId, AServicoId) then
  begin
    SetLength(FServicosId, Length(FServicosId) + 1);
    FServicosId[High(FServicosId)] := AServicoId;
  end;
end;

class function NFSeRegistroOS.Create(ANumeroOS: Integer): NFSeRegistroOS;
begin
  Result.FNumeroOS := ANumeroOS;
  //Result.FServicosId := AServicosId;
  Result.FValorServicos := 0;
  Result.FValorDescontos := 0;
  SetLength(Result.FServicosId, 0);
end;

function NFSeAgrupamentoOS.GetOSIDs: TArrayInteger;
var
  I: Integer;
begin
  SetLength(Result, Length(FRegistrosOS));
  for I := 0 to High(FRegistrosOS) do
    Result[I] := FRegistrosOS[I].NumeroOS;
end;

end.
