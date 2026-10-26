unit CalculoTotaisNFSeServiceUnit;

interface

uses
  SysUtils, Classes,
  ICalculoTotaisNFSeServiceUnit, NFSeModelUnit, CalculoTotaisNFSeTypes;

type
  CalculoTotaisNFSeService = class(TInterfacedObject, ICalculoTotaisNFSeService)
  public
    function Executar(Input: CalculoTotaisNFSeInput): CalculoTotaisNFSeResult; overload;
    function Executar(Input: NFSeModel): CalculoTotaisNFSeResult; overload;
  end;

implementation

uses
  CurrencyNullableUnit, NFSeTypesUnit, NFSeEtdUnit, TributoDFeIbsCbsEtdUnit, TributoDFeGrupoIbsCbsEtdUnit,
  TributoDFeMonofasiaIbsCbsEtdUnit, TributoDFeContextEtdUnit, TributoDFeImpostoSeletivoEtdUnit, DoubleNullableUnit;

{ CalculoTotaisNFSeService }  

function CalculoTotaisNFSeService.Executar(Input: CalculoTotaisNFSeInput): CalculoTotaisNFSeResult;
var
  TotalRetencoes, ValorLiquido, ValorTotalNF: Currency;
begin
  TotalRetencoes := Input.IrrfRetido
    + Input.CsllRetido
    + Input.CPRetido
    + Input.IssRetido
    + Input.PisRetido
    + Input.CofinsRetido;

  ValorLiquido := Input.ValorServico
    - Input.Descontos
    - TotalRetencoes;

  if Date() >= EncodeDate(2027,01,01) then
    ValorTotalNF := ValorLiquido
      + Input.Ibs
      + Input.Cbs
      + Input.IbsMono
      + Input.CbsMono
      + Input.ImpSeletivo
  else
    ValorTotalNF := ValorLiquido;

  Result := CalculoTotaisNFSeResult.Create(
    ValorLiquido, ValorTotalNF, TotalRetencoes
  );
end;

function CalculoTotaisNFSeService.Executar(Input: NFSeModel): CalculoTotaisNFSeResult;
var
  IssRetido: Currency;
  Ibs, Cbs, IbsMono, CbsMono, ImpSeletivo: Currency;
  NFSe: NFSeEtd;
begin
  NFSe := Input.NFSe;
  IssRetido := 0;

  if NFSe.TpRetIssQn = trRetidoPeloTomador then
    IssRetido := NFSe.VIss.Value;

  Ibs := 0;
  Cbs := 0;
  IbsMono := 0;
  CbsMono := 0;
  ImpSeletivo := 0;

  if Assigned(Input.Tributo) then
  begin
    if Assigned(Input.Tributo.IbsCbs) then
      if Assigned(Input.Tributo.IbsCbs.GIbsCbs) then
      begin
        Ibs := Input.Tributo.IbsCbs.GIbsCbs.VIbs;
        Cbs := Input.Tributo.IbsCbs.GIbsCbs.VCbs;
      end
      else if Assigned(Input.Tributo.IbsCbs.Monofasia) then
      begin
        IbsMono := Input.Tributo.IbsCbs.Monofasia.Vtotibsmonoitem;
        CbsMono := Input.Tributo.IbsCbs.Monofasia.Vtotcbsmonoitem;
      end;

    if Assigned(Input.Tributo.ImpostoSeletivo) then
      ImpSeletivo := Input.Tributo.ImpostoSeletivo.Vis.Value;
  end;

  Result := Self.Executar( CalculoTotaisNFSeInput.Create(
    NFSe.VServ.Value,
    NFSe.VDescIncond.Value,
    NFSe.VRetIrrf.Value,
    NFSe.VRetCsll.Value,
    NFSe.VRetCP.Value,
    NFSe.VRetPis.Value,
    NFSe.VRetCofins.Value,
    IssRetido,
    Ibs,
    Cbs,
    IbsMono,
    CbsMono,
    ImpSeletivo
  ));
end;

end.
