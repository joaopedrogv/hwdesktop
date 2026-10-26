unit AliquotaAdRemProdutoEtdUnit;

interface

uses
  TipoComunsUnit,
  TipoTributoEnumUnit,
  DateAndTimeNullableUnit;

type
  AliquotaAdRemProdutoEtd = record
  private
    FId: Integer;
    FNcm: string;
    FAliquotaAdRemId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public

    class function CreateEtd(
      Id: Integer;
      const Ncm: string;
      AliquotaAdRemId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): AliquotaAdRemProdutoEtd; static;

    property Id: Integer read FId;
    property Ncm: string read FNcm write FNcm;
    property AliquotaAdRemId: Integer read FAliquotaAdRemId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  AliquotasAdRemProdutosEtd = array of AliquotaAdRemProdutoEtd;

implementation

{ AliquotaAdRemProdutoEtd }

class function AliquotaAdRemProdutoEtd.CreateEtd(
  Id: Integer;
  const Ncm: string;
  AliquotaAdRemId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): AliquotaAdRemProdutoEtd;
begin
  Result.FId := Id;
  Result.FNcm := Ncm;
  Result.FAliquotaAdRemId := AliquotaAdRemId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;


end.
