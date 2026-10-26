unit UnidadeMedidaEtdUnit;

interface

uses
  TipoComunsUnit, DateAndTimeNullableUnit;

type
  UnidadeMedidaEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FSigla: string;
    FNome: string;
    FDescricao: string;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;

  public
    class function CreateEtd(
      Id: Integer;
      const Sigla: string;
      const Nome: string;
      const Descricao: string;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): UnidadeMedidaEtd; static;

    class function NullInstance(): UnidadeMedidaEtd; static;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property Sigla: string read FSigla;
    property Nome: string read FNome;
    property Descricao: string read FDescricao;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  UnidadesMedidasEtd = array of UnidadeMedidaEtd;

implementation

{ UnidadeMedidaEtd }

class function UnidadeMedidaEtd.CreateEtd(
  Id: Integer;
  const Sigla: string;
  const Nome: string;
  const Descricao: string;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): UnidadeMedidaEtd;
begin
  Result.FInstance := riNotNull;
  Result.FId := Id;
  Result.FSigla := Sigla;
  Result.FNome := Nome;
  Result.FDescricao := Descricao;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

function UnidadeMedidaEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function UnidadeMedidaEtd.NullInstance: UnidadeMedidaEtd;
begin
  Result := UnidadeMedidaEtd.CreateEtd(0, '', '', '', 0, DateNullable.NullInstance());
  Result.FInstance := riNull;
end;

end.
