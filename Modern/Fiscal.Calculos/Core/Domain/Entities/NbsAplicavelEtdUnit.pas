unit NbsAplicavelEtdUnit;

interface

uses
  EntityBaseUnit,
  ExcecaoNbsAplicavelEtdUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  IntegerNullableUnit,
  Contnrs;

type
  NbsAplicavelEtd = class(EntityBase)
  private
    FId: Integer;
    FNbs: string;
    FClassificacaoTributariaId: Integer;
    FAnexoId: IntegerNullable;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FExcecoes: ExcecoesNbsAplicavelEtd;
  public
    constructor Create(
      Id: Integer;
      const Nbs: string;
      ClassificacaoTributariaId: Integer;
      const AnexoId: IntegerNullable;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ); overload;

    constructor Create(
      Id: Integer;
      const Nbs: string;
      ClassificacaoTributariaId: Integer;
      const AnexoId: IntegerNullable;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      Excecoes: ExcecoesNbsAplicavelEtd
    ); overload;

    function Clone(): EntityBase; override;

    function PossuiExcecao(const ANbs: string; Data: TDate): Boolean;
    function NaoPossuiExcecao(Data: TDate): Boolean;

    property Id: Integer read FId;
    property Nbs: string read FNbs;
    property ClassificacaoTributariaId: Integer read FClassificacaoTributariaId;
    property AnexoId: IntegerNullable read FAnexoId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property Excecoes: ExcecoesNbsAplicavelEtd read FExcecoes;
  end;

  NbssAplicaveisEtd = class(TObjectList);

implementation

{ NbsAplicavelEtd }

function NbsAplicavelEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NbsAplicavelEtd.Create(
      FId, FNbs, FClassificacaoTributariaId, FAnexoId, FInicioVigencia, FFimVigencia, FExcecoes
    );
end;

constructor NbsAplicavelEtd.Create(
  Id: Integer;
  const Nbs: string;
  ClassificacaoTributariaId: Integer;
  const AnexoId: IntegerNullable;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  Excecoes: ExcecoesNbsAplicavelEtd
);
begin
  Create( Id, Nbs, ClassificacaoTributariaId, AnexoId, InicioVigencia, FimVigencia);
  FExcecoes := Excecoes;
end;

constructor NbsAplicavelEtd.Create(
  Id: Integer;
  const Nbs: string;
  ClassificacaoTributariaId: Integer;
  const AnexoId: IntegerNullable;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
);
begin
  FId := Id;
  FNbs := Nbs;
  FClassificacaoTributariaId := ClassificacaoTributariaId;
  FAnexoId := AnexoId;
  FInicioVigencia := InicioVigencia;
  FFimVigencia := FimVigencia;
end;

function NbsAplicavelEtd.NaoPossuiExcecao(Data: TDate): Boolean;
var
  excecao: ExcecaoNbsAplicavelEtd;
begin
  Result := True;

  for excecao in FExcecoes do
    if (Data >= excecao.InicioVigencia) and
       ((Data <= excecao.FimVigencia.Value) or ( excecao.FimVigencia.IsNull )) then
    begin
      Result := False;
      Break;
    end;
end;

function NbsAplicavelEtd.PossuiExcecao(const ANbs: string; Data: TDate): Boolean;
var
  excecao: ExcecaoNbsAplicavelEtd;
begin
  Result := False;

  for excecao in FExcecoes do
    if (Data >= excecao.InicioVigencia) and
       ((Data <= excecao.FimVigencia.Value) or (excecao.FimVigencia.IsNull)) and
       (excecao.Nbs = Copy(ANbs, 1, Length(excecao.Nbs))) then
    begin
      Result := True;
      Break;
    end;
end;

end.
