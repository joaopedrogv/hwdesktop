unit TratamentoClassificacaoModelUnit;

interface

uses
  TipoComunsUnit;

type
  TratamentoClassificacaoModel = record
  private
    FInstance: RecordInstance;
    FIdTratamentoTributario: Integer;
    FIdClassificacaoTributaria: Integer;
    FInIncompativelComSuspensao: Boolean;
    FInExigeGrupoDesoneracao: Boolean;
  public
    class function NullInstance(): TratamentoClassificacaoModel; static;

    class function Create(
      IdTratamentoTributario, IdClassificacaoTributaria: Integer;
      InIncompativelComSuspensao, InExigeGrupoDesoneracao: Boolean
    ): TratamentoClassificacaoModel; static;

    function IsNull(): Boolean;

    property IdTratamentoTributario: Integer read FIdTratamentoTributario;
    property IdClassificacaoTributaria: Integer read FIdClassificacaoTributaria;
    property InIncompativelComSuspensao: Boolean read FInIncompativelComSuspensao;
    property InExigeGrupoDesoneracao: Boolean read FInExigeGrupoDesoneracao;
  end;

implementation

{ TratamentoClassificacaoModel }

class function TratamentoClassificacaoModel.Create(IdTratamentoTributario, IdClassificacaoTributaria: Integer;
  InIncompativelComSuspensao, InExigeGrupoDesoneracao: Boolean): TratamentoClassificacaoModel;
begin
  Result.FInstance := riNotNull;
  Result.FIdTratamentoTributario := IdTratamentoTributario;
  Result.FIdClassificacaoTributaria := IdClassificacaoTributaria;
  Result.FInIncompativelComSuspensao := InIncompativelComSuspensao;
  Result.FInExigeGrupoDesoneracao := InExigeGrupoDesoneracao;
end;

function TratamentoClassificacaoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function TratamentoClassificacaoModel.NullInstance: TratamentoClassificacaoModel;
begin
  Result.FInstance := riNull;
end;

end.
{
unit TratamentoClassificacaoModelUnit;

interface

uses
  ClassificacaoTributariaModelUnit,
  TratamentoTributarioEtdUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit, TratamentoClassificacaoEtdUnit;

type
  TratamentoClassificacaoModel = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FClassificacaoTributariaId: Integer;
    FClassificacaoTributaria: ClassificacaoTributariaModel;
    FTratamentoTributarioId: Integer;
    FTratamentoTributario: TratamentoTributarioEtd;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function NullInstance(): TratamentoClassificacaoModel; static;

    class function CreateEtd(
      Id: Integer;
      ClassificacaoTributariaId: Integer;
      TratamentoTributarioId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): TratamentoClassificacaoModel; static;

    class function Create(
      Id: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      const ClassificacaoTributaria: ClassificacaoTributariaModel;
      const TratamentoTributario: TratamentoTributarioEtd
    ): TratamentoClassificacaoModel; static;

    class function CreateFromObj(
      const Entity: TratamentoClassificacaoEtd
    ): TratamentoClassificacaoModel; static;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property ClassificacaoTributariaId: Integer read FClassificacaoTributariaId;
    property ClassificacaoTributaria: ClassificacaoTributariaModel read FClassificacaoTributaria;
    property TratamentoTributarioId: Integer read FTratamentoTributarioId;
    property TratamentoTributario: TratamentoTributarioEtd read FTratamentoTributario;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  TratamentosClassificacoesModel = array of TratamentoClassificacaoModel;

implementation

class function TratamentoClassificacaoModel.Create(
  Id: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  const ClassificacaoTributaria: ClassificacaoTributariaModel;
  const TratamentoTributario: TratamentoTributarioEtd
): TratamentoClassificacaoModel;
begin
  Result := TratamentoClassificacaoModel.CreateEtd(
    Id, ClassificacaoTributaria.Id, TratamentoTributario.Id,
    InicioVigencia, FimVigencia
  );
  Result.FClassificacaoTributaria := ClassificacaoTributaria;
  Result.FTratamentoTributario := TratamentoTributario;
end;

class function TratamentoClassificacaoModel.CreateEtd(
  Id: Integer;
  ClassificacaoTributariaId: Integer;
  TratamentoTributarioId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): TratamentoClassificacaoModel;
begin
  Result.FId                        := Id;
  Result.FClassificacaoTributariaId := ClassificacaoTributariaId;
  Result.FTratamentoTributarioId    := TratamentoTributarioId;
  Result.FInicioVigencia            := InicioVigencia;
  Result.FFimVigencia               := FimVigencia;
  Result.FInstance                  := riNotNull;
end;

class function TratamentoClassificacaoModel.CreateFromObj(
  const Entity: TratamentoClassificacaoEtd): TratamentoClassificacaoModel;
begin
  if Entity = nil then
    Result := TratamentoClassificacaoModel.NullInstance()
  else
    Result := TratamentoClassificacaoModel.Create(
      Entity.Id, Entity.InicioVigencia, Entity.FimVigencia,
      ClassificacaoTributariaModel.CreateFromObj( Entity.ClassificacaoTributaria ),
      Entity.TratamentoTributario.Clone()
    );
end;

function TratamentoClassificacaoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function TratamentoClassificacaoModel.NullInstance: TratamentoClassificacaoModel;
begin
  Result.FInstance := riNull;
end;


end.
}
