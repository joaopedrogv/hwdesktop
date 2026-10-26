unit LocalFornecimentoEnumUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/model/enumeration/LocalFornecimento.java

interface

type
  /// <summary>
  ///   Codigos legais de local de fornecimento usados nas regras de incidencia
  ///   do IBS/CBS. Espelha LocalFornecimento.java v0042: LOCAL_1..LOCAL_28
  ///   associam cada codigo numerico a respectiva descricao normativa, e
  ///   getCodigo() e o @JsonValue serializado.
  ///   lfUnassigned (0) representa codigo ausente (SQL NULL / null do Java),
  ///   valor neutro que nao existe no enum Java e e mantido na convencao dos
  ///   enums irmaos do dominio. Nunca e produzido por
  ///   LocalFornecimentoFromCodigo nem serializado como 0: a ausencia fica nula
  ///   na fronteira (IntegerNullable) e sem descricao.
  /// </summary>
  LocalFornecimento = (
    lfUnassigned = 0,
    lfLocal1 = 1,
    lfLocal2 = 2,
    lfLocal3 = 3,
    lfLocal4 = 4,
    lfLocal5 = 5,
    lfLocal6 = 6,
    lfLocal7 = 7,
    lfLocal8 = 8,
    lfLocal9 = 9,
    lfLocal10 = 10,
    lfLocal11 = 11,
    lfLocal12 = 12,
    lfLocal13 = 13,
    lfLocal14 = 14,
    lfLocal15 = 15,
    lfLocal16 = 16,
    lfLocal17 = 17,
    lfLocal18 = 18,
    lfLocal19 = 19,
    lfLocal20 = 20,
    lfLocal21 = 21,
    lfLocal22 = 22,
    lfLocal23 = 23,
    lfLocal24 = 24,
    lfLocal25 = 25,
    lfLocal26 = 26,
    lfLocal27 = 27,
    lfLocal28 = 28
  );

  /// <summary>
  ///   Converte o codigo numerico (1..28) no enum correspondente. Espelha
  ///   LocalFornecimento.fromCodigo e lanca excecao fora do dominio, equivalente
  ///   ao IllegalArgumentException("Codigo invalido: n") do Java. lfUnassigned
  ///   nao e aceito como entrada, da mesma forma que o Java nao possui codigo 0.
  /// </summary>
  function LocalFornecimentoFromCodigo(Codigo: Integer): LocalFornecimento;

  /// <summary>
  ///   Retorna a descricao oficial do local de fornecimento (espelho de
  ///   getDescricao). Para lfUnassigned, ausente no Java, retorna string vazia.
  /// </summary>
  function LocalFornecimentoDescricao(Tipo: LocalFornecimento): string;

  /// <summary>
  ///   Retorna o codigo numerico do enum (espelho de getCodigo, isto e, o
  ///   @JsonValue serializado). Ord e suficiente porque os valores foram
  ///   atribuidos explicitamente de 1 a 28, sem lacunas.
  /// </summary>
  function LocalFornecimentoCodigo(Tipo: LocalFornecimento): Integer;

  /// <summary>
  ///   Descricao a partir do codigo numerico, equivalendo a
  ///   fromCodigo(codigo).getDescricao() do Java: lanca excecao quando o codigo
  ///   nao pertence a 1..28.
  /// </summary>
  function LocalFornecimentoDescricaoPorCodigo(Codigo: Integer): string;

implementation

uses
  SysUtils;

{ LocalFornecimento }

function LocalFornecimentoFromCodigo(Codigo: Integer): LocalFornecimento;
begin
  case Codigo of
    1: Result := lfLocal1;
    2: Result := lfLocal2;
    3: Result := lfLocal3;
    4: Result := lfLocal4;
    5: Result := lfLocal5;
    6: Result := lfLocal6;
    7: Result := lfLocal7;
    8: Result := lfLocal8;
    9: Result := lfLocal9;
    10: Result := lfLocal10;
    11: Result := lfLocal11;
    12: Result := lfLocal12;
    13: Result := lfLocal13;
    14: Result := lfLocal14;
    15: Result := lfLocal15;
    16: Result := lfLocal16;
    17: Result := lfLocal17;
    18: Result := lfLocal18;
    19: Result := lfLocal19;
    20: Result := lfLocal20;
    21: Result := lfLocal21;
    22: Result := lfLocal22;
    23: Result := lfLocal23;
    24: Result := lfLocal24;
    25: Result := lfLocal25;
    26: Result := lfLocal26;
    27: Result := lfLocal27;
    28: Result := lfLocal28;
  else
    raise Exception.CreateFmt('Código inválido: %d', [Codigo]);
  end;
end;

function LocalFornecimentoDescricao(Tipo: LocalFornecimento): string;
begin
  case Tipo of
    lfLocal1: Result := 'Endereço diverso do fornecedor, adquirente ou destinatário';
    lfLocal2: Result := 'Local da prestação do serviço diverso do estabelecimento do fornecedor';
    lfLocal3: Result := 'Endereço do destinatário';
    lfLocal4: Result := 'Endereço fornecido para entrega do bem';
    lfLocal5: Result := 'Estabelecimento do fornecedor como local da prestação';
    lfLocal6: Result := 'Local do porto como local da prestação';
    lfLocal7: Result := 'Local da prestação correspondente à extensão da via explorada, proporcionalmente ao território dos entes tributantes';
    lfLocal8: Result := 'Local da retirada do bem';
    lfLocal9: Result := 'Local de início do transporte';
    lfLocal10: Result := 'Local do domicílio principal do destinatário residente ou domiciliado no País, caso o adquirente não seja residente ou domiciliado no País';
    lfLocal11: Result := 'Local do domicílio principal do adquirente residente ou domiciliado no País. Nas aquisições indicadas no art. 11, §4º, II, considera-se domicílio principal do adquirente o estabelecimentro matriz';
    lfLocal12: Result := 'local do domicílio principal do destinatário residente ou domiciliado no País';
    lfLocal13: Result := 'Local do evento a que se refere o serviço';
    lfLocal14: Result := 'Localidade do imóvel';
    lfLocal15: Result := 'Estabelecimento do fornecedor como o local da entrega ou disponibilização do bem ao destinatário';
    lfLocal16: Result := 'Local da realização da operação e sua retirada';
    lfLocal17: Result := 'Endereço do destinatário fornecido para entrega ou disponibilização (assim considerado o o destino final indicado pelo adquirente)';
    lfLocal18: Result := 'Local onde se encontra o bem móvel material';
    lfLocal19: Result := 'Local onde se encontra o bem móvel material (Local da retirada)';
    lfLocal20: Result := 'Local do domicílio principal do adquirente (estabelecimento matriz)';
    lfLocal21: Result := 'Domicílio principal do destinatário';
    lfLocal22: Result := 'Local de instalação do terminal';
    lfLocal23: Result := 'Local do domicílio principal do adquirente (assim considerada a matriz), nas aquisições realizadas de forma centralizada por contribuinte sujeito ao regime regular do IBS e da CBS que possui mais de um estabelecimento e que não estejam sujeitas a ' +
                         'vedação à apropriação de créditos';
    lfLocal24: Result := 'Local da entrega ou disponibilização';
    lfLocal25: Result := 'Local do estabelecimento principal do adquirente (assim considerada a matriz), conforme §4º do art. 11';
    lfLocal26: Result := 'Local do estabelecimento do agente ou de seus representados que figurem na posição devedora da liquidação financeira apurada pela Câmara de Comercialização de Energia Elétrica';
    lfLocal27: Result := 'Local do estabelecimento principal do fornecedor';
    lfLocal28: Result := 'Local do estabelecimento principal do adquirente';
  else
    Result := '';
  end;
end;

function LocalFornecimentoCodigo(Tipo: LocalFornecimento): Integer;
begin
  Result := Ord(Tipo);
end;

function LocalFornecimentoDescricaoPorCodigo(Codigo: Integer): string;
begin
  Result := LocalFornecimentoDescricao(LocalFornecimentoFromCodigo(Codigo));
end;

end.
