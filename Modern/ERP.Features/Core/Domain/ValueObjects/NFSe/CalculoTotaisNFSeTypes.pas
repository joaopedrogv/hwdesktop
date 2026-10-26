unit CalculoTotaisNFSeTypes;

interface

uses
  SysUtils,
  Classes;

type
  CalculoTotaisNFSeResult = record
  private
    FValorLiquido: Currency;
    FValorTotalNF: Currency;
    FTotalRetencoes: Currency;
  public
    class function Create(
      AValorLiquido: Currency;
      AValorTotalNF: Currency;
      ATotalRetencoes: Currency
    ): CalculoTotaisNFSeResult; static;

    property ValorLiquido: Currency read FValorLiquido;
    property ValorTotalNF: Currency read FValorTotalNF; // Total com IBS e CBS
    property TotalRetencoes: Currency read FTotalRetencoes;
  end;
  
  CalculoTotaisNFSeInput = record
  private
    FValorServico: Currency;
    FDescontos: Currency;
    FIrrfRetido: Currency;
    FCsllRetido: Currency;
    FCPRetido: Currency;
    FPisRetido: Currency;
    FCofinsRetido: Currency;
    FIssRetido: Currency;
    FIbs: Currency;
    FCbs: Currency;
    FIbsMono: Currency;
    FCbsMono: Currency;
    FImpSeletivo: Currency;
  public
    class function Create(
      AValorServico: Currency;
      ADescontos: Currency;
      AIrrfRetido: Currency;
      ACsllRetido: Currency;
      ACPRetido: Currency;
      APisRetido: Currency;
      ACofinsRetido: Currency;
      AIssRetido: Currency;
      AIbs: Currency;
      ACbs: Currency;
      AIbsMono: Currency;
      ACbsMono: Currency;
      AImpSeletivo: Currency
    ): CalculoTotaisNFSeInput; static;

    property ValorServico: Currency read FValorServico;
    property Descontos: Currency read FDescontos;
    property IrrfRetido: Currency read FIrrfRetido;
    property CsllRetido: Currency read FCsllRetido;
    property CPRetido: Currency read FCPRetido;
    property PisRetido: Currency read FPisRetido;
    property CofinsRetido: Currency read FCofinsRetido;
    property IssRetido: Currency read FIssRetido;
    property Ibs: Currency read FIbs;
    property Cbs: Currency read FCbs;
    property IbsMono: Currency read FIbsMono;
    property CbsMono: Currency read FCbsMono;
    property ImpSeletivo: Currency read FImpSeletivo;
  end;

implementation

{ CalculoTotaisNFSeResult }

class function CalculoTotaisNFSeResult.Create(
  AValorLiquido: Currency;
  AValorTotalNF: Currency;
  ATotalRetencoes: Currency
): CalculoTotaisNFSeResult;
begin
  Result.FValorLiquido := AValorLiquido;
  Result.FValorTotalNF := AValorTotalNF;
  Result.FTotalRetencoes := ATotalRetencoes;
end;

{ CalculoTotaisNFSeInput }

class function CalculoTotaisNFSeInput.Create(
  AValorServico: Currency;
  ADescontos: Currency;
  AIrrfRetido: Currency;
  ACsllRetido: Currency;
  ACPRetido: Currency;
  APisRetido: Currency;
  ACofinsRetido: Currency;
  AIssRetido: Currency;
  AIbs: Currency;
  ACbs: Currency;
  AIbsMono: Currency;
  ACbsMono: Currency;
  AImpSeletivo: Currency
): CalculoTotaisNFSeInput;
begin
  Result.FValorServico := AValorServico;
  Result.FDescontos := ADescontos;
  Result.FIrrfRetido := AIrrfRetido;
  Result.FCsllRetido := ACsllRetido;
  Result.FCPRetido := ACPRetido;
  Result.FPisRetido := APisRetido;
  Result.FCofinsRetido := ACofinsRetido;
  Result.FIssRetido := AIssRetido;
  Result.FIbs := AIbs;
  Result.FCbs := ACbs;
  Result.FIbsMono := AIbsMono;
  Result.FCbsMono := ACbsMono;
  Result.FImpSeletivo := AImpSeletivo;
end;

end.

