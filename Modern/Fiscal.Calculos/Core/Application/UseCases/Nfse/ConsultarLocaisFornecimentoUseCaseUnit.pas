unit ConsultarLocaisFornecimentoUseCaseUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/service/nfse/NfseService.java#consultarLocaisFornecimento
// Java: source/src/main/java/br/gov/serpro/rtc/api/model/output/nfse/NfseCodigoDescricaoOutput.java

interface

uses
  SysUtils,
  IntegerNullableUnit,
  LocalFornecimentoEnumUnit;

type
  /// <summary>
  ///   Saida de codigo + descricao de um valor de enumeracao (espelho de
  ///   NfseCodigoDescricaoOutput.java, v0042). E compartilhada com
  ///   ConsultarLocaisIncidenciaUseCaseUnit, por isso reside nesta unit.
  /// </summary>
  NfseCodigoDescricaoOutput = record
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    class function Create(Codigo: Integer; const Descricao: string): NfseCodigoDescricaoOutput; static;

    property Codigo: Integer read FCodigo;
    property Descricao: string read FDescricao;
  end;

  NfseCodigosDescricoesOutput = array of NfseCodigoDescricaoOutput;

  /// <summary>
  ///   Erro de campo invalido, espelho de CampoInvalidoException.java no contexto
  ///   de codigo de enumeracao fora do dominio. Compartilhada com
  ///   ConsultarLocaisIncidenciaUseCaseUnit.
  /// </summary>
  ECampoInvalido = class(Exception);

  IConsultarLocaisFornecimentoUseCase = interface
    ['{7C1F0A54-2B8E-4D31-9A6C-5E0D3B7F1A92}']
    /// <param name="Codigo">
    ///   Codigo informado; nulo equivale ao parametro ausente (null) do Java.
    /// </param>
    function Executar(const Codigo: IntegerNullable): NfseCodigosDescricoesOutput;
  end;

  ConsultarLocaisFornecimentoUseCase = class(TInterfacedObject, IConsultarLocaisFornecimentoUseCase)
  public
    function Executar(const Codigo: IntegerNullable): NfseCodigosDescricoesOutput;
  end;

implementation

{ NfseCodigoDescricaoOutput }

class function NfseCodigoDescricaoOutput.Create(
  Codigo: Integer; const Descricao: string
): NfseCodigoDescricaoOutput;
begin
  Result.FCodigo := Codigo;
  Result.FDescricao := Descricao;
end;

{ ConsultarLocaisFornecimentoUseCase }

function ConsultarLocaisFornecimentoUseCase.Executar(
  const Codigo: IntegerNullable
): NfseCodigosDescricoesOutput;
var
  tipo: LocalFornecimentoEnumUnit.LocalFornecimento;
  i: Integer;
begin
  // Espelho do Java: com codigo informado devolve apenas o valor
  // correspondente e converte codigo invalido em CampoInvalidoException; sem
  // codigo (null no Java) devolve todos os 28 valores, na ordem do enum
  // (lfLocal1..lfLocal28, sem lfUnassigned).
  if Codigo.HasValue then
  begin
    try
      tipo := LocalFornecimentoEnumUnit.LocalFornecimentoFromCodigo(Codigo.Value);
    except
      on E: Exception do
        raise ECampoInvalido.Create(E.Message);
    end;

    SetLength(Result, 1);
    Result[0] := NfseCodigoDescricaoOutput.Create(
      LocalFornecimentoEnumUnit.LocalFornecimentoCodigo(tipo),
      LocalFornecimentoEnumUnit.LocalFornecimentoDescricao(tipo));
  end
  else
  begin
    SetLength(Result, 28);
    i := 0;
    for tipo := LocalFornecimentoEnumUnit.lfLocal1 to LocalFornecimentoEnumUnit.lfLocal28 do
    begin
      Result[i] := NfseCodigoDescricaoOutput.Create(
        LocalFornecimentoEnumUnit.LocalFornecimentoCodigo(tipo),
        LocalFornecimentoEnumUnit.LocalFornecimentoDescricao(tipo));
      Inc(i);
    end;
  end;
end;

end.
