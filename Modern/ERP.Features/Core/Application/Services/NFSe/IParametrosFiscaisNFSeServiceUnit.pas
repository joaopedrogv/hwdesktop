unit IParametrosFiscaisNFSeServiceUnit;

interface

uses NFSeTypesUnit, ParametrosFiscaisNFSeCommandUnit, TipoRetencaoFederalPJEnumUnit;

type
  ParametrosFiscaisNFSeResult = record
  private
    FAliqPis: Currency;
    FAliqCofins: Currency;
    FAliqRetPis: Currency;
    FAliqRetCofins: Currency;
    FAliqRetIrrf: Currency;
    FAliqRetCsll: Currency;
    FAliqRetCP: Currency;
    FAliqCheiaSN: Currency;
    FAliqIssSN: Currency;
    FAliqIssServico: Currency;
    FIsSimplesNacional: Boolean;
    FUsarAliqIssSN: Boolean;
    FNBS: string;
    FLC116: string;
    FCSTPC: string;
    FTipoTribIss: TributacaoISSQNEnum;
    FTipoRetIss: TipoRetencaoISSQNEnum;
    FTipoRetPC: TipoRetencaoPisCofinsEnum;
    FRetsFedCliente: TipoRetencaoFederalPJEnumSet;
    function GetAliqIssTratada(): Currency;
  public
    class function Create(
      AAliqPis: Currency;
      AAliqCofins: Currency;
      AAliqRetPis: Currency;
      AAliqRetCofins: Currency;
      AAliqRetIrrf: Currency;
      AAliqRetCsll: Currency;
      AAliqRetCP: Currency;
      AAliqCheiaSN: Currency;
      AAliqIssSN: Currency;
      AAliqIssServico: Currency;
      AIsSimplesNacional: Boolean;
      AUsarAliqIssSN: Boolean;
      const ANBS: string;
      const ALC116: string;
      const ACSTPC: string;
      ATipoTribIss: TributacaoISSQNEnum;
      ATipoRetIss: TipoRetencaoISSQNEnum;
      ATipoRetPC: TipoRetencaoPisCofinsEnum;
      ARetsFedCliente: TipoRetencaoFederalPJEnumSet
    ): ParametrosFiscaisNFSeResult; static;

    property AliqPis: Currency read FAliqPis;
    property AliqCofins: Currency read FAliqCofins;
    property AliqRetPis: Currency read FAliqRetPis;
    property AliqRetCofins: Currency read FAliqRetCofins;
    property AliqRetIrrf: Currency read FAliqRetIrrf;
    property AliqRetCsll: Currency read FAliqRetCsll;
    property AliqRetCP: Currency read FAliqRetCP;
    property AliqCheiaSN: Currency read FAliqCheiaSN;
    property AliqIssSN: Currency read FAliqIssSN;
    property AliqIssServico: Currency read FAliqIssServico;
    property AliqIssTratada: Currency read GetAliqIssTratada;
    property IsSimplesNacional: Boolean read FIsSimplesNacional;
    property UsarAliqIssSN: Boolean read FUsarAliqIssSN;
    property NBS: string read FNBS;
    property LC116: string read FLC116;
    property CSTPC: string read FCSTPC;
    property TipoTribIss: TributacaoISSQNEnum read FTipoTribIss;
    property TipoRetIss: TipoRetencaoISSQNEnum read FTipoRetIss;
    //property TipoRetPC: TipoRetencaoPisCofinsEnum read FTipoRetPC;
    property RetsFedCliente: TipoRetencaoFederalPJEnumSet read FRetsFedCliente;
  end;
//  ParametrosFiscaisNFSeResult = record
//    AliqPis, AliqCofins, AliqRetPis, AliqRetCofins, AliqRetIrrf, AliqRetCsll, AliqRetCP: Currency;
//    AliqCheiaSN, AliqIssSN, AliqIssServico: Currency;
//    IsSimplesNacional, UsarAliqIssSN: Boolean;
//    NBS, LC116, CSTPC: string;
//    TipoTribIss: TributacaoISSQNEnum;
//    TipoRetIss: TipoRetencaoISSQNEnum;
//    TipoRetPC: TipoRetencaoPisCofinsEnum;
//  end;

  IParametrosFiscaisNFSeService = interface
    ['{E2296E5B-E752-42B8-94B3-71233292D793}']
    function Executar(const Input: ParametrosFiscaisNFSeCommand): ParametrosFiscaisNFSeResult;
  end;

implementation

{ ParametrosFiscaisNFSeResult }

class function ParametrosFiscaisNFSeResult.Create(
  AAliqPis: Currency;
  AAliqCofins: Currency;
  AAliqRetPis: Currency;
  AAliqRetCofins: Currency;
  AAliqRetIrrf: Currency;
  AAliqRetCsll: Currency;
  AAliqRetCP: Currency;
  AAliqCheiaSN: Currency;
  AAliqIssSN: Currency;
  AAliqIssServico: Currency;
  AIsSimplesNacional: Boolean;
  AUsarAliqIssSN: Boolean;
  const ANBS: string;
  const ALC116: string;
  const ACSTPC: string;
  ATipoTribIss: TributacaoISSQNEnum;
  ATipoRetIss: TipoRetencaoISSQNEnum;
  ATipoRetPC: TipoRetencaoPisCofinsEnum;
  ARetsFedCliente: TipoRetencaoFederalPJEnumSet
): ParametrosFiscaisNFSeResult;
begin
  Result.FAliqPis := AAliqPis;
  Result.FAliqCofins := AAliqCofins;
  Result.FAliqRetPis := AAliqRetPis;
  Result.FAliqRetCofins := AAliqRetCofins;
  Result.FAliqRetIrrf := AAliqRetIrrf;
  Result.FAliqRetCsll := AAliqRetCsll;
  Result.FAliqRetCP := AAliqRetCP;
  Result.FAliqCheiaSN := AAliqCheiaSN;
  Result.FAliqIssSN := AAliqIssSN;
  Result.FAliqIssServico := AAliqIssServico;
  Result.FIsSimplesNacional := AIsSimplesNacional;
  Result.FUsarAliqIssSN := AUsarAliqIssSN;
  Result.FNBS := ANBS;
  Result.FLC116 := ALC116;
  Result.FCSTPC := ACSTPC;
  Result.FTipoTribIss := ATipoTribIss;
  Result.FTipoRetIss := ATipoRetIss;
  Result.FTipoRetPC := ATipoRetPC;
  Result.FRetsFedCliente := ARetsFedCliente;
end;

function ParametrosFiscaisNFSeResult.GetAliqIssTratada: Currency;
begin
  if FUsarAliqIssSN then
    Result := FAliqIssSN
  else
    Result := FAliqIssServico;
end;

end.
