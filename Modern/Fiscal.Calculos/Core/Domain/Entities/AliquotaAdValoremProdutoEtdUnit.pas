unit AliquotaAdValoremProdutoEtdUnit;

interface

uses
  TipoComunsUnit,
  TipoTributoEnumUnit,
  DateAndTimeNullableUnit, AliquotaAdValoremEtdUnit;

type
  AliquotaAdValoremProdutoEtd = record
  private
    FInstance: RecordInstance;
    FId: Integer;
    FNcm: string;
    FAliquotaAdValoremId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function NullInstance(): AliquotaAdValoremProdutoEtd; static;

    class function CreateEtd(
      Id: Integer;
      const Ncm: string;
      AliquotaAdValoremId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): AliquotaAdValoremProdutoEtd; static;

    function IsNull(): Boolean;

    property Id: Integer read FId;
    property Ncm: string read FNcm write FNcm;
    property AliquotaAdValoremId: Integer read FAliquotaAdValoremId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  AliquotasAdValoremProdutosEtd = array of AliquotaAdValoremProdutoEtd;

implementation

{ AliquotaAdValoremProdutoEtd }

class function AliquotaAdValoremProdutoEtd.CreateEtd(
  Id: Integer;
  const Ncm: string;
  AliquotaAdValoremId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): AliquotaAdValoremProdutoEtd;
begin
  Result.FId := Id;
  Result.FNcm := Ncm;
  Result.FAliquotaAdValoremId := AliquotaAdValoremId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
  Result.FInstance := riNotNull;
end;

function AliquotaAdValoremProdutoEtd.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function AliquotaAdValoremProdutoEtd.NullInstance: AliquotaAdValoremProdutoEtd;
begin
  Result.FInstance := riNull;
end;

end.
