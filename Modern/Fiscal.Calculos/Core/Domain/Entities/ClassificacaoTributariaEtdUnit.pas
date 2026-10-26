unit ClassificacaoTributariaEtdUnit;

interface

uses
  EntityBaseUnit,
  SituacaoTributariaEtdUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  BooleanNullableUnit,
  IntegerNullableUnit,
  StringNullableUnit,
  Contnrs;

type
  ClassificacaoTributariaEtd = class(EntityBase)
  private
    FId: Integer;
    FCodigo: string;
    FDescricao: string;
    FMemoriaCalculo: string;
    FInApropriacaoCreditosAdquirentesCBS: BooleanNullable;
    FInApropriacaoCreditosAdquirentesIBS: BooleanNullable;
    FInCreditoPresumidoFornecedor: BooleanNullable;
    FInCreditoPresumidoAdquirente: BooleanNullable;
    FSituacaoTributariaId: Integer;
    FTomadorEspecificoId: IntegerNullable;
    FTipoAliquota: string;
    FCreditoOperacaoAntecedente: StringNullable;
    FNomenclatura: string;
    FInGrupoCredPresOper: Boolean;
    FInGrupoMonofasiaPadrao: Boolean;
    FInGrupoMonofasiaReten: Boolean;
    FInGrupoMonofasiaRet: Boolean;
    FInGrupoMonofasiaDiferimento: Boolean;
    FInGrupoEstornoCredito: Boolean;
    FAnexo: StringNullable;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FSituacaoTributaria: SituacaoTributariaEtd;
    FDataAtualizacao: DateNullable;
  public

    constructor Create(
      Id: Integer;
      const Codigo: string;
      const Descricao: string;
      const MemoriaCalculo: string;
      const InApropriacaoCreditosAdquirentesCBS: BooleanNullable;
      const InApropriacaoCreditosAdquirentesIBS: BooleanNullable;
      const InCreditoPresumidoFornecedor: BooleanNullable;
      const InCreditoPresumidoAdquirente: BooleanNullable;
      SituacaoTributariaId: Integer;
      const TomadorEspecificoId: IntegerNullable;
      const TipoAliquota: string;
      const CreditoOperacaoAntecedente: StringNullable;
      const Nomenclatura: string;
      AInGrupoCredPresOper: Boolean;
      AInGrupoMonofasiaPadrao: Boolean;
      AInGrupoMonofasiaReten: Boolean;
      AInGrupoMonofasiaRet: Boolean;
      AInGrupoMonofasiaDiferimento: Boolean;
      AInGrupoEstornoCredito: Boolean;
      const AAnexo: StringNullable;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      const DataAtualizacao: DateNullable
    ); overload;

    constructor Create(
      Id: Integer;
      const Codigo: string;
      const Descricao: string;
      const MemoriaCalculo: string;
      const InApropriacaoCreditosAdquirentesCBS: BooleanNullable;
      const InApropriacaoCreditosAdquirentesIBS: BooleanNullable;
      const InCreditoPresumidoFornecedor: BooleanNullable;
      const InCreditoPresumidoAdquirente: BooleanNullable;
      SituacaoTributariaId: Integer;
      const TomadorEspecificoId: IntegerNullable;
      const TipoAliquota: string;
      const CreditoOperacaoAntecedente: StringNullable;
      const Nomenclatura: string;
      AInGrupoCredPresOper: Boolean;
      AInGrupoMonofasiaPadrao: Boolean;
      AInGrupoMonofasiaReten: Boolean;
      AInGrupoMonofasiaRet: Boolean;
      AInGrupoMonofasiaDiferimento: Boolean;
      AInGrupoEstornoCredito: Boolean;
      const AAnexo: StringNullable;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      const DataAtualizacao: DateNullable;
      const SituacaoTributaria: SituacaoTributariaEtd
    ); overload;

    function Clone(): EntityBase; override;

    property Id: Integer read FId;
    property Codigo: string read FCodigo;
    property Descricao: string read FDescricao;
    property MemoriaCalculo: string read FMemoriaCalculo;
    property InApropriacaoCreditosAdquirentesCBS: BooleanNullable read FInApropriacaoCreditosAdquirentesCBS;
    property InApropriacaoCreditosAdquirentesIBS: BooleanNullable read FInApropriacaoCreditosAdquirentesIBS;
    property InCreditoPresumidoFornecedor: BooleanNullable read FInCreditoPresumidoFornecedor;
    property InCreditoPresumidoAdquirente: BooleanNullable read FInCreditoPresumidoAdquirente;
    property SituacaoTributariaId: Integer read FSituacaoTributariaId;
    property TomadorEspecificoId: IntegerNullable read FTomadorEspecificoId;
    property TipoAliquota: string read FTipoAliquota;
    property CreditoOperacaoAntecedente: StringNullable read FCreditoOperacaoAntecedente;
    property Nomenclatura: string read FNomenclatura;
    property InGrupoCredPresOper: Boolean read FInGrupoCredPresOper;
    property InGrupoMonofasiaPadrao: Boolean read FInGrupoMonofasiaPadrao;
    property InGrupoMonofasiaReten: Boolean read FInGrupoMonofasiaReten;
    property InGrupoMonofasiaRet: Boolean read FInGrupoMonofasiaRet;
    property InGrupoMonofasiaDiferimento: Boolean read FInGrupoMonofasiaDiferimento;
    property InGrupoEstornoCredito: Boolean read FInGrupoEstornoCredito;
    property Anexo: StringNullable read FAnexo;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property SituacaoTributaria: SituacaoTributariaEtd read FSituacaoTributaria;
    property DataAtualizacao: DateNullable read FDataAtualizacao;
  end;

  ClassificacoesTributariasEtd = class(TObjectList);

implementation

{ ClassificacaoTributariaEtd }

function ClassificacaoTributariaEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := ClassificacaoTributariaEtd.Create(
      FId, FCodigo, FDescricao, FMemoriaCalculo, FInApropriacaoCreditosAdquirentesCBS,
      FInApropriacaoCreditosAdquirentesIBS, FInCreditoPresumidoFornecedor, FInCreditoPresumidoAdquirente,
      FSituacaoTributariaId, FTomadorEspecificoId, FTipoAliquota, FCreditoOperacaoAntecedente, FNomenclatura,
      FInGrupoCredPresOper, FInGrupoMonofasiaPadrao, FInGrupoMonofasiaReten, FInGrupoMonofasiaRet,
      FInGrupoMonofasiaDiferimento, FInGrupoEstornoCredito, FAnexo,
      FInicioVigencia, FFimVigencia, FDataAtualizacao, FSituacaoTributaria.Clone()
    );
end;

constructor ClassificacaoTributariaEtd.Create(
  Id: Integer;
  const Codigo: string;
  const Descricao: string;
  const MemoriaCalculo: string;
  const InApropriacaoCreditosAdquirentesCBS: BooleanNullable;
  const InApropriacaoCreditosAdquirentesIBS: BooleanNullable;
  const InCreditoPresumidoFornecedor: BooleanNullable;
  const InCreditoPresumidoAdquirente: BooleanNullable;
  SituacaoTributariaId: Integer;
  const TomadorEspecificoId: IntegerNullable;
  const TipoAliquota: string;
  const CreditoOperacaoAntecedente: StringNullable;
  const Nomenclatura: string;
  AInGrupoCredPresOper: Boolean;
  AInGrupoMonofasiaPadrao: Boolean;
  AInGrupoMonofasiaReten: Boolean;
  AInGrupoMonofasiaRet: Boolean;
  AInGrupoMonofasiaDiferimento: Boolean;
  AInGrupoEstornoCredito: Boolean;
  const AAnexo: StringNullable;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  const DataAtualizacao: DateNullable;
  const SituacaoTributaria: SituacaoTributariaEtd
);
begin
  Create(
    Id, Codigo, Descricao, MemoriaCalculo, InApropriacaoCreditosAdquirentesCBS,
    InApropriacaoCreditosAdquirentesIBS, InCreditoPresumidoFornecedor, InCreditoPresumidoAdquirente,
    SituacaoTributariaId, TomadorEspecificoId, TipoAliquota, CreditoOperacaoAntecedente, Nomenclatura,
    AInGrupoCredPresOper, AInGrupoMonofasiaPadrao, AInGrupoMonofasiaReten, AInGrupoMonofasiaRet,
    AInGrupoMonofasiaDiferimento, AInGrupoEstornoCredito, AAnexo, InicioVigencia, FimVigencia, DataAtualizacao
  );
  FSituacaoTributaria := SituacaoTributaria;
end;

constructor ClassificacaoTributariaEtd.Create(
  Id: Integer;
  const Codigo: string;
  const Descricao: string;
  const MemoriaCalculo: string;
  const InApropriacaoCreditosAdquirentesCBS: BooleanNullable;
  const InApropriacaoCreditosAdquirentesIBS: BooleanNullable;
  const InCreditoPresumidoFornecedor: BooleanNullable;
  const InCreditoPresumidoAdquirente: BooleanNullable;
  SituacaoTributariaId: Integer;
  const TomadorEspecificoId: IntegerNullable;
  const TipoAliquota: string;
  const CreditoOperacaoAntecedente: StringNullable;
  const Nomenclatura: string;
  AInGrupoCredPresOper: Boolean;
  AInGrupoMonofasiaPadrao: Boolean;
  AInGrupoMonofasiaReten: Boolean;
  AInGrupoMonofasiaRet: Boolean;
  AInGrupoMonofasiaDiferimento: Boolean;
  AInGrupoEstornoCredito: Boolean;
  const AAnexo: StringNullable;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  const DataAtualizacao: DateNullable
);
begin
  FId := Id;
  FCodigo := Codigo;
  FDescricao := Descricao;
  FMemoriaCalculo := MemoriaCalculo;
  FInApropriacaoCreditosAdquirentesCBS := InApropriacaoCreditosAdquirentesCBS;
  FInApropriacaoCreditosAdquirentesIBS := InApropriacaoCreditosAdquirentesIBS;
  FInCreditoPresumidoFornecedor := InCreditoPresumidoFornecedor;
  FInCreditoPresumidoAdquirente := InCreditoPresumidoAdquirente;
  FSituacaoTributariaId := SituacaoTributariaId;
  FTomadorEspecificoId := TomadorEspecificoId;
  FTipoAliquota := TipoAliquota;
  FCreditoOperacaoAntecedente := CreditoOperacaoAntecedente;
  FNomenclatura := Nomenclatura;
  FInGrupoCredPresOper := AInGrupoCredPresOper;
  FInGrupoMonofasiaPadrao := AInGrupoMonofasiaPadrao;
  FInGrupoMonofasiaReten := AInGrupoMonofasiaReten;
  FInGrupoMonofasiaRet := AInGrupoMonofasiaRet;
  FInGrupoMonofasiaDiferimento := AInGrupoMonofasiaDiferimento;
  FInGrupoEstornoCredito := AInGrupoEstornoCredito;
  FAnexo := AAnexo;
  FInicioVigencia := InicioVigencia;
  FFimVigencia := FimVigencia;
  FDataAtualizacao := DataAtualizacao;
end;

end.
