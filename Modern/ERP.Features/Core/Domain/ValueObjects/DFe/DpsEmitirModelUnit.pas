unit DpsEmitirModelUnit;

interface

uses
  NFSeModelUnit, StringNullableUnit, NFSeTypesUnit, TipoComunsUnit, TributoDFeContextEtdUnit;

type
  DpsEmitirModel = class
  private
    FDPS: NFSeModel;
    FTpemit: EmitenteDPSEnum;
    FPrestCpfCnpj: string;
    FPrestIm: StringNullable;
    FPrestRazao: string;
    FCLocEmi: Integer;
    FOpSimpNac: OptanteSNEnum;
    FRegApTribSN: RegimeApuracaoSNEnum;
    FRegEspTrib: Integer;
    FIncentivoCultural: Boolean;
    FConvenioAtivo: Boolean;
    FPreferirAliqSNaoIbpt: Boolean;
    FProviderUsaApiPropria: Boolean;
  public
    constructor Create(
      ADPS: NFSeModel;
      ATpemit: EmitenteDPSEnum;
      const APrestCpfCnpj: string;
      const APrestIm: StringNullable;
      const APrestRazao: string;
      ACLocEmi: Integer;
      AOpSimpNac: OptanteSNEnum;
      ARegApTribSN: RegimeApuracaoSNEnum;
      ARegEspTrib: Integer;
      AIncentivoCultural, AConvenioAtivo, APreferirAliqSNaoIbpt, AProviderUsaApiPropria: Boolean
    );
    destructor Destroy; override;

    property DPS: NFSeModel read FDPS;
    property TpEmit: EmitenteDPSEnum read FTpemit;
    property PrestCpfCnpj: string read FPrestCpfCnpj;
    property PrestIm: StringNullable read FPrestIm;   // Tem configuracao pra preencher ou nao
    property PrestRazao: string read FPrestRazao;
    property CLocEmi: Integer read FCLocEmi;
    property OpSimpNac: OptanteSNEnum read FOpSimpNac;
    property RegApTribSN: RegimeApuracaoSNEnum read FRegApTribSN;
    property RegEspTrib: Integer read FRegEspTrib;
    property IncentivoCultural: Boolean read FIncentivoCultural;
    property ConvenioAtivo: Boolean read FConvenioAtivo;
    property PreferirAliqSNaoIbpt: Boolean read FPreferirAliqSNaoIbpt;
    property ProviderUsaApiPropria: Boolean read FProviderUsaApiPropria;
  end;

implementation

{ DpsEmitirModel }

constructor DpsEmitirModel.Create(
  ADPS: NFSeModel;
  ATpemit: EmitenteDPSEnum;
  const APrestCpfCnpj: string;
  const APrestIm: StringNullable;
  const APrestRazao: string;
  ACLocEmi: Integer;
  AOpSimpNac: OptanteSNEnum;
  ARegApTribSN: RegimeApuracaoSNEnum;
  ARegEspTrib: Integer;
  AIncentivoCultural, AConvenioAtivo, APreferirAliqSNaoIbpt, AProviderUsaApiPropria: Boolean
);
begin
  FDPS := ADPS;
  FTpemit := ATpemit;
  FPrestCpfCnpj := APrestCpfCnpj;
  FPrestIm := APrestIm;
  FPrestRazao := APrestRazao;
  FCLocEmi := ACLocEmi;
  FOpSimpNac := AOpSimpNac;
  FRegApTribSN := ARegApTribSN;
  FRegEspTrib := ARegEspTrib;
  FIncentivoCultural := AIncentivoCultural;
  FConvenioAtivo := AConvenioAtivo;
  FPreferirAliqSNaoIbpt := APreferirAliqSNaoIbpt;
  FProviderUsaApiPropria := AProviderUsaApiPropria;
end;

destructor DpsEmitirModel.Destroy;
begin
  FDPS.Free();

  inherited;
end;

end.
