unit NcmAplicavelEtdUnit;

interface

uses
  EntityBaseUnit,
  ExcecaoNcmAplicavelEtdUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  IntegerNullableUnit,
  Contnrs;

type
  NcmAplicavelEtd = class(EntityBase)
  private
    FId: Integer;
    FNcm: string;
    FClassificacaoTributariaId: Integer;
    FAnexoId: IntegerNullable;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
    FExcecoes: ExcecoesNcmAplicavelEtd;
  public
    constructor Create(
      Id: Integer;
      const Ncm: string;
      ClassificacaoTributariaId: Integer;
      const AnexoId: IntegerNullable;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ); overload;

    constructor Create(
      Id: Integer;
      const Ncm: string;
      ClassificacaoTributariaId: Integer;
      const AnexoId: IntegerNullable;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable;
      Excecoes: ExcecoesNcmAplicavelEtd
    ); overload;

    function Clone(): EntityBase; override;

    function PossuiExcecao(const ANcm: string; Data: TDate): Boolean;
    function NaoPossuiExcecao(Data: TDate): Boolean;

    property Id: Integer read FId;
    property Ncm: string read FNcm;
    property ClassificacaoTributariaId: Integer read FClassificacaoTributariaId;
    property AnexoId: IntegerNullable read FAnexoId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
    property Excecoes: ExcecoesNcmAplicavelEtd read FExcecoes;
  end;

  NcmsAplicaveisEtd = class(TObjectList);

implementation


{ NcmAplicavelEtd }

function NcmAplicavelEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NcmAplicavelEtd.Create(
      FId, FNcm, FClassificacaoTributariaId, FAnexoId, FInicioVigencia, FFimVigencia, FExcecoes
    );
end;

constructor NcmAplicavelEtd.Create(
  Id: Integer;
  const Ncm: string;
  ClassificacaoTributariaId: Integer;
  const AnexoId: IntegerNullable;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable;
  Excecoes: ExcecoesNcmAplicavelEtd
);
begin
  Create( Id, Ncm, ClassificacaoTributariaId, AnexoId, InicioVigencia, FimVigencia);
  FExcecoes := Excecoes;
end;

constructor NcmAplicavelEtd.Create(
  Id: Integer;
  const Ncm: string;
  ClassificacaoTributariaId: Integer;
  const AnexoId: IntegerNullable;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
);
begin
  FId := Id;
  FNcm := Ncm;
  FClassificacaoTributariaId := ClassificacaoTributariaId;
  FAnexoId := AnexoId;
  FInicioVigencia := InicioVigencia;
  FFimVigencia := FimVigencia;
end;

function NcmAplicavelEtd.NaoPossuiExcecao(Data: TDate): Boolean;
var
  excecao: ExcecaoNcmAplicavelEtd;
begin
  Result := True;

  for excecao in FExcecoes do
    if (Data >= excecao.InicioVigencia) and
       ((Data <= excecao.FimVigencia.Value) or (excecao.FimVigencia.IsNull)) then
    begin
      Result := False;
      Break;
    end;
end;

function NcmAplicavelEtd.PossuiExcecao(const ANcm: string; Data: TDate): Boolean;
var
  excecao: ExcecaoNcmAplicavelEtd;
begin
  Result := False;

  for excecao in FExcecoes do
    if (Data >= excecao.InicioVigencia) and
       ((Data <= excecao.FimVigencia.Value) or (excecao.FimVigencia.IsNull)) and
       (excecao.Ncm = Copy(ANcm, 1, Length(excecao.Ncm))) then
    begin
      Result := True;
      Break;
    end;
end;

end.
