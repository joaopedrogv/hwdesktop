unit DpsEmitirIbsCbsNacionalModelUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  EntityBaseUnit,
  StringNullableUnit,
  NFSeTypesUnit,
  DFeTypesUnit,
  CurrencyNullableUnit,
  TipoRegraTributoDFeEnumUnit,
  TipoComunsUnit;

type
  DpsEmitirIbsCbsNacionalModel = class
  private
    FTipoRegra: TipoRegraTributoDFeEnum;
    FRegraFiscalId: StringNullable;
    FCST: string;
    FCClassTrib: string;
    FCCredPres: StringNullable;
    FCSTReg: StringNullable;
    FCClassRribReg: StringNullable;
    FPDifUF: CurrencyNullable;
    FPDifMun: CurrencyNullable;
    FPDifCBS: CurrencyNullable;
  public
    constructor Create(); overload;
    constructor Create(
      ATipoRegra: TipoRegraTributoDFeEnum;
      const ARegraFiscalId: StringNullable;
      const ACST: string;
      const ACclasstrib: string;
      const ACcredpres: StringNullable;
      const ACSTReg: StringNullable;
      const ACclasstribreg: StringNullable;
      const APdifuf: CurrencyNullable;
      const APdifmun: CurrencyNullable;
      const APdifcbs: CurrencyNullable
    ); overload;

    function Clone(): DpsEmitirIbsCbsNacionalModel;

    property TipoRegra: TipoRegraTributoDFeEnum read FTipoRegra write FTipoRegra;
    property RegraFiscalId: StringNullable read FRegraFiscalId write FRegraFiscalId;
    property CST: string read FCST write FCST;
    property CClassTrib: string read FCClassTrib write FCClassTrib;
    property CCredPres: StringNullable read FCCredPres write FCCredPres;
    property CSTReg: StringNullable read FCSTReg write FCSTReg;
    property CClassRribReg: StringNullable read FCClassRribReg write FCClassRribReg;
    property PDifUF: CurrencyNullable read FPDifUF write FPDifUF;
    property PDifMun: CurrencyNullable read FPDifMun write FPDifMun;
    property PDifCBS: CurrencyNullable read FPDifCBS write FPDifCBS;
  end;

implementation

{ DpsEmitirIbsCbsNacionalModel }

constructor DpsEmitirIbsCbsNacionalModel.Create();
begin
  inherited Create;
end;

constructor DpsEmitirIbsCbsNacionalModel.Create(
  ATipoRegra: TipoRegraTributoDFeEnum;
  const ARegraFiscalId: StringNullable;
  const ACST: string;
  const ACclasstrib: string;
  const ACcredpres: StringNullable;
  const ACSTReg: StringNullable;
  const ACclasstribreg: StringNullable;
  const APdifuf: CurrencyNullable;
  const APdifmun: CurrencyNullable;
  const APdifcbs: CurrencyNullable
);
begin
  Create();
  FTipoRegra := ATipoRegra;
  FRegraFiscalId := ARegraFiscalId;
  FCST := ACST;
  FCClassTrib := ACclasstrib;
  FCCredPres := ACcredpres;
  FCSTReg := ACSTReg;
  FCClassRribReg := ACclasstribreg;
  FPDifUF := APdifuf;
  FPDifMun := APdifmun;
  FPDifCBS := APdifcbs;
end;

function DpsEmitirIbsCbsNacionalModel.Clone(): DpsEmitirIbsCbsNacionalModel;
begin
  if Self = nil then
    Result := nil
  else
    Result := DpsEmitirIbsCbsNacionalModel.Create(
      FTipoRegra,
      FRegraFiscalId,
      FCST,
      FCClassTrib,
      FCCredPres,
      FCSTReg,
      FCClassRribReg,
      FPDifUF,
      FPDifMun,
      FPDifCBS
    );
end;

end.
