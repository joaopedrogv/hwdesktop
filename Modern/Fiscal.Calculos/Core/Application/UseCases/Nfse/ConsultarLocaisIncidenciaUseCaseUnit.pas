unit ConsultarLocaisIncidenciaUseCaseUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/service/nfse/NfseService.java#consultarLocaisIncidencia
// DTO e erro compartilhados: ConsultarLocaisFornecimentoUseCaseUnit
// (NfseCodigoDescricaoOutput, NfseCodigosDescricoesOutput, ECampoInvalido).

interface

uses
  IntegerNullableUnit,
  LocalIncidenciaEnumUnit,
  ConsultarLocaisFornecimentoUseCaseUnit;

type
  IConsultarLocaisIncidenciaUseCase = interface
    ['{9D2E4B71-6C3A-4F58-8B10-72A5E9C4D3F6}']
    /// <param name="Codigo">
    ///   Codigo informado; nulo equivale ao parametro ausente (null) do Java.
    /// </param>
    function Executar(const Codigo: IntegerNullable): NfseCodigosDescricoesOutput;
  end;

  ConsultarLocaisIncidenciaUseCase = class(TInterfacedObject, IConsultarLocaisIncidenciaUseCase)
  public
    function Executar(const Codigo: IntegerNullable): NfseCodigosDescricoesOutput;
  end;

implementation

uses
  SysUtils;

{ ConsultarLocaisIncidenciaUseCase }

function ConsultarLocaisIncidenciaUseCase.Executar(
  const Codigo: IntegerNullable
): NfseCodigosDescricoesOutput;
var
  tipo: LocalIncidenciaEnumUnit.LocalIncidencia;
  i: Integer;
begin
  // Espelho do Java: com codigo informado devolve apenas o valor
  // correspondente e converte codigo invalido em CampoInvalidoException; sem
  // codigo (null no Java) devolve todos os 7 valores, na ordem do enum
  // (liEnderecoDestinatario..liLocalizacaoTrecho, sem liUnassigned).
  if Codigo.HasValue then
  begin
    try
      tipo := LocalIncidenciaEnumUnit.LocalIncidenciaFromCodigo(Codigo.Value);
    except
      on E: Exception do
        raise ECampoInvalido.Create(E.Message);
    end;

    SetLength(Result, 1);
    // Ord(tipo) equivale ao getCodigo()/@JsonValue do Java: o enum local tem
    // valores explicitos e contiguos em 1..7.
    Result[0] := NfseCodigoDescricaoOutput.Create(
      Ord(tipo), LocalIncidenciaEnumUnit.LocalIncidenciaDescricao(tipo));
  end
  else
  begin
    SetLength(Result, 7);
    i := 0;
    for tipo := LocalIncidenciaEnumUnit.liEnderecoDestinatario to LocalIncidenciaEnumUnit.liLocalizacaoTrecho do
    begin
      Result[i] := NfseCodigoDescricaoOutput.Create(
        Ord(tipo), LocalIncidenciaEnumUnit.LocalIncidenciaDescricao(tipo));
      Inc(i);
    end;
  end;
end;

end.
