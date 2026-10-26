unit ExcecaoAdRemProdutoEtdUnit;

interface

uses
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  ExcecaoAdRemProdutoEtd = record
  private
    FId: Integer;
    FNcm: string;
    FAliquotaAdRemProdutoId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function CreateEtd(
      Id: Integer;
      const Ncm: string;
      AliquotaAdRemProdutoId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): ExcecaoAdRemProdutoEtd; static;

    property Id: Integer read FId;
    property Ncm: string read FNcm;
    property AliquotaAdRemProdutoId: Integer read FAliquotaAdRemProdutoId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  ExcecoesAdRemProdutosEtd = array of ExcecaoAdRemProdutoEtd;

implementation

{ ExcecaoAdRemProdutoEtd }

class function ExcecaoAdRemProdutoEtd.CreateEtd(
  Id: Integer;
  const Ncm: string;
  AliquotaAdRemProdutoId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): ExcecaoAdRemProdutoEtd;
begin
  Result.FId := Id;
  Result.FNcm := Ncm;
  Result.FAliquotaAdRemProdutoId := AliquotaAdRemProdutoId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

end.
