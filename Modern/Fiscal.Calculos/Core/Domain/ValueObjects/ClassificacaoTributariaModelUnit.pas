unit ClassificacaoTributariaModelUnit;

interface

uses
  TipoComunsUnit;

type
  ClassificacaoTributariaModel = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FCodigo: string;
    FNomeclatura: string;
    FCST: string;
  public
    class function NullInstance(): ClassificacaoTributariaModel; static;

    class function Create(
      AId: Integer;
      const ACodigo, ANomeclatura, ACST: string
    ): ClassificacaoTributariaModel; static;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property Codigo: string read FCodigo;
    property Nomeclatura: string read FNomeclatura;
    property CST: string read FCST;
  end;

implementation

{ ClassificacaoTributariaModel }

class function ClassificacaoTributariaModel.Create(
  AId: Integer;
  const ACodigo, ANomeclatura, ACST: string
): ClassificacaoTributariaModel;
begin
  Result.FInstance := riNotNull;
  Result.FId := AId;
  Result.FCodigo := ACodigo;
  Result.FNomeclatura := ANomeclatura;
  Result.FCST := ACST;
end;

function ClassificacaoTributariaModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function ClassificacaoTributariaModel.NullInstance: ClassificacaoTributariaModel;
begin
  Result.FInstance := riNull;
end;

end.
{
unit ClassificacaoTributariaModelUnit;

interface

uses
  SituacaoTributariaEtdUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  BooleanNullableUnit,
  IntegerNullableUnit,
  StringNullableUnit, ClassificacaoTributariaEtdUnit;

type
  ClassificacaoTributariaModel = record
  private
    FInstance: RecordInstance;
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
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FSituacaoTributaria: SituacaoTributariaEtd;
  public
    class function NullInstance(): ClassificacaoTributariaModel; static;

    class function Create(
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
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      const SituacaoTributaria: SituacaoTributariaEtd
    ): ClassificacaoTributariaModel; static;

    class function CreateEtd(
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
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): ClassificacaoTributariaModel; static;

    class function CreateFromObj(
      const Entity: ClassificacaoTributariaEtd
    ): ClassificacaoTributariaModel; static;

    function IsNull(): Boolean;

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
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property SituacaoTributaria: SituacaoTributariaEtd read FSituacaoTributaria;
  end;

  ClassificacoesTributariasEtd = array of ClassificacaoTributariaModel;

implementation

class function ClassificacaoTributariaModel.Create(
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
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  const SituacaoTributaria: SituacaoTributariaEtd
): ClassificacaoTributariaModel;
begin
  Result := ClassificacaoTributariaModel.CreateEtd(
    Id, Codigo, Descricao, MemoriaCalculo, InApropriacaoCreditosAdquirentesCBS,
    InApropriacaoCreditosAdquirentesIBS, InCreditoPresumidoFornecedor, InCreditoPresumidoAdquirente,
    SituacaoTributariaId, TomadorEspecificoId, TipoAliquota, CreditoOperacaoAntecedente, Nomenclatura, InicioVigencia,
    FimVigencia
  );
  Result.FSituacaoTributaria := SituacaoTributaria;
end;

class function ClassificacaoTributariaModel.CreateEtd(
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
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): ClassificacaoTributariaModel;
begin
  Result.FId := Id;
  Result.FCodigo := Codigo;
  Result.FDescricao := Descricao;
  Result.FMemoriaCalculo := MemoriaCalculo;
  Result.FInApropriacaoCreditosAdquirentesCBS := InApropriacaoCreditosAdquirentesCBS;
  Result.FInApropriacaoCreditosAdquirentesIBS := InApropriacaoCreditosAdquirentesIBS;
  Result.FInCreditoPresumidoFornecedor := InCreditoPresumidoFornecedor;
  Result.FInCreditoPresumidoAdquirente := InCreditoPresumidoAdquirente;
  Result.FSituacaoTributariaId := SituacaoTributariaId;
  Result.FTomadorEspecificoId := TomadorEspecificoId;
  Result.FTipoAliquota := TipoAliquota;
  Result.FCreditoOperacaoAntecedente := CreditoOperacaoAntecedente;
  Result.FNomenclatura := Nomenclatura;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FInstance := riNotNull;
end;

class function ClassificacaoTributariaModel.CreateFromObj(
  const Entity: ClassificacaoTributariaEtd): ClassificacaoTributariaModel;
begin
  Result := ClassificacaoTributariaModel.Create(
    Entity.Id, Entity.Codigo, Entity.Descricao, Entity.MemoriaCalculo, Entity.InApropriacaoCreditosAdquirentesCBS,
    Entity.InApropriacaoCreditosAdquirentesIBS, Entity.InCreditoPresumidoFornecedor, Entity.InCreditoPresumidoAdquirente,
    Entity.SituacaoTributariaId, Entity.TomadorEspecificoId, Entity.TipoAliquota, Entity.CreditoOperacaoAntecedente,
    Entity.Nomenclatura, Entity.InicioVigencia, Entity.FimVigencia,
    Entity.SituacaoTributaria.Clone()
  );
end;

function ClassificacaoTributariaModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function ClassificacaoTributariaModel.NullInstance: ClassificacaoTributariaModel;
begin
  Result.FInstance := riNull;
end;

end.
}
