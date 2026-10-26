# Transformation Example

## Input

```delphi
unit ConfiguracaoNFSeModelUnit;

interface

uses
  TipoComunsUnit,
  StringNullableUnit,
  DPSTypesUnit,
  CurrencyNullableUnit;

type
  ConfiguracaoNFSeModel = record
    Serie, Versao: string;
    PadraoNacional: Boolean;
    CMunEmitente: Integer;
    DataInicioIBSCBS: TDate;
    OpSimpNac: OptanteSNEnum;
    PTotTribSN: CurrencyNullable;
  end;

implementation

end.
```

## Output

```delphi
unit ConfiguracaoNFSeModelUnit;

interface

uses
  TipoComunsUnit,
  DPSTypesUnit,
  CurrencyNullableUnit;

type
  ConfiguracaoNFSeModel = record
  private
    FSerie: string;
    FVersao: string;
    FPadraoNacional: Boolean;
    FCMunEmitente: Integer;
    FDataInicioIBSCBS: TDate;
    FOpSimpNac: OptanteSNEnum;
    FPTotTribSN: CurrencyNullable;
  public
    class function Create(
      const ASerie: string;
      const AVersao: string;
      APadraoNacional: Boolean;
      ACMunEmitente: Integer;
      ADataInicioIBSCBS: TDate;
      AOpSimpNac: OptanteSNEnum;
      const APTotTribSN: CurrencyNullable
    ): ConfiguracaoNFSeModel; static;

    property Serie: string read FSerie;
    property Versao: string read FVersao;
    property PadraoNacional: Boolean read FPadraoNacional;
    property CMunEmitente: Integer read FCMunEmitente;
    property DataInicioIBSCBS: TDate read FDataInicioIBSCBS;
    property OpSimpNac: OptanteSNEnum read FOpSimpNac;
    property PTotTribSN: CurrencyNullable read FPTotTribSN;
  end;

implementation

{ ConfiguracaoNFSeModel }

class function ConfiguracaoNFSeModel.Create(
  const ASerie: string;
  const AVersao: string;
  APadraoNacional: Boolean;
  ACMunEmitente: Integer;
  ADataInicioIBSCBS: TDate;
  AOpSimpNac: OptanteSNEnum;
  const APTotTribSN: CurrencyNullable
): ConfiguracaoNFSeModel;
begin
  Result.FSerie := ASerie;
  Result.FVersao := AVersao;
  Result.FPadraoNacional := APadraoNacional;
  Result.FCMunEmitente := ACMunEmitente;
  Result.FDataInicioIBSCBS := ADataInicioIBSCBS;
  Result.FOpSimpNac := AOpSimpNac;
  Result.FPTotTribSN := APTotTribSN;
end;

end.
```
