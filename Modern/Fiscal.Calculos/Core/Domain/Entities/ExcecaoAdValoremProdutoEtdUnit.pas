unit ExcecaoAdValoremProdutoEtdUnit;

interface

uses
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  ExcecaoAdValoremProdutoEtd = record
  private
    FId: Integer;
    FNcm: string;
    FAliquotaAdValoremProdutoId: Integer;
    FInicioVigencia: TDate;
    FFimVigencia: DateNullable;
  public
    class function CreateEtd(
      Id: Integer;
      const Ncm: string;
      AliquotaAdValoremProdutoId: Integer;
      InicioVigencia: TDate;
      const FimVigencia: DateNullable
    ): ExcecaoAdValoremProdutoEtd; static;

    property Id: Integer read FId;
    property Ncm: string read FNcm;
    property AliquotaAdValoremProdutoId: Integer read FAliquotaAdValoremProdutoId;
    property InicioVigencia: TDate read FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia;
  end;

  ExcecoesAdValoremProdutosEtd = array of ExcecaoAdValoremProdutoEtd;

implementation

{ ExcecaoAdValoremProdutoEtd }

class function ExcecaoAdValoremProdutoEtd.CreateEtd(
  Id: Integer;
  const Ncm: string;
  AliquotaAdValoremProdutoId: Integer;
  InicioVigencia: TDate;
  const FimVigencia: DateNullable
): ExcecaoAdValoremProdutoEtd;
begin
  Result.FId := Id;
  Result.FNcm := Ncm;
  Result.FAliquotaAdValoremProdutoId := AliquotaAdValoremProdutoId;
  Result.FInicioVigencia := InicioVigencia;
  Result.FFimVigencia := FimVigencia;
end;

end.
