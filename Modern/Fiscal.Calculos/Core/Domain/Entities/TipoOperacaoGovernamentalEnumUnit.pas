unit TipoOperacaoGovernamentalEnumUnit;

interface

type
  /// <summary>
  ///   Tipos de operacao com ente governamental aceitos na API.
  ///   Equivale a TipoOperacaoGovernamental.java (1 Fornecimento com pagamento
  ///   posterior, 2 Recebimento do pagamento com fornecimento ja realizado,
  ///   3 Fornecimento com pagamento ja realizado, 4 Recebimento do pagamento com
  ///   fornecimento posterior, 5 Fornecimento e recebimento do pagamento
  ///   concomitantes).
  /// </summary>
  TipoOperacaoGovernamental = (
    togUnassigned = 0,
    togFornecimento = 1,
    togRecebimentoPagamento = 2,
    togFornecimentoPagamentoRealizado = 3,
    togRecebimentoPagamentoFornecimentoPosterior = 4,
    togFornecimentoRecebimentoConcomitantes = 5
  );

  /// <summary>
  ///   Converte o codigo numerico (1..5) no enum correspondente.
  ///   Lanca excecao quando o codigo nao esta mapeado (espelho de fromCodigo).
  /// </summary>
  function TipoOperacaoGovernamentalFromCodigo(Codigo: Integer): TipoOperacaoGovernamental;

implementation

uses
  SysUtils;

{ TipoOperacaoGovernamental }

function TipoOperacaoGovernamentalFromCodigo(Codigo: Integer): TipoOperacaoGovernamental;
begin
  case Codigo of
    1: Result := togFornecimento;
    2: Result := togRecebimentoPagamento;
    3: Result := togFornecimentoPagamentoRealizado;
    4: Result := togRecebimentoPagamentoFornecimentoPosterior;
    5: Result := togFornecimentoRecebimentoConcomitantes;
  else
    raise Exception.Create('Tipo de operação com ente governamental não mapeado');
  end;
end;

end.
