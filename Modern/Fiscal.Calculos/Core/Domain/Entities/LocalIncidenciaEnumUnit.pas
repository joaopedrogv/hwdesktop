unit LocalIncidenciaEnumUnit;

interface

type
  /// <summary>
  ///   Locais de incidencia do IBS/CBS aceitos na API.
  ///   Equivale a LocalIncidencia.java (1 Endereco do Destinatario, 2 Endereco do
  ///   Tomador/Adquirente, 3 Estabelecimento do Prestador/Fornecedor, 4 Local da
  ///   Prestacao, 5 Local do Evento, 6 Localidade do Imovel, 7 Localizacao do
  ///   Trecho). liUnassigned (0) representa o codigo de local de incidencia
  ///   opcional nao informado e nao existe no Java, sendo mantido no padrao dos
  ///   enums irmaos do dominio.
  /// </summary>
  LocalIncidencia = (
    liUnassigned = 0,
    liEnderecoDestinatario = 1,
    liEnderecoTomadorAdquirente = 2,
    liEstabelecimentoPrestadorFornecedor = 3,
    liLocalPrestacao = 4,
    liLocalEvento = 5,
    liLocalidadeImovel = 6,
    liLocalizacaoTrecho = 7
  );

  /// <summary>
  ///   Converte o codigo numerico (1..7) no enum correspondente.
  ///   Lanca excecao quando o codigo nao esta mapeado (espelho de fromCodigo,
  ///   equivalente ao IllegalArgumentException do Java).
  /// </summary>
  function LocalIncidenciaFromCodigo(Codigo: Integer): LocalIncidencia;

  /// <summary>
  ///   Retorna a descricao oficial do local de incidencia (espelho de getDescricao).
  ///   Para liUnassigned, ausente no Java, retorna string vazia.
  /// </summary>
  function LocalIncidenciaDescricao(Tipo: LocalIncidencia): string;

implementation

uses
  SysUtils;

{ LocalIncidencia }

function LocalIncidenciaFromCodigo(Codigo: Integer): LocalIncidencia;
begin
  case Codigo of
    1: Result := liEnderecoDestinatario;
    2: Result := liEnderecoTomadorAdquirente;
    3: Result := liEstabelecimentoPrestadorFornecedor;
    4: Result := liLocalPrestacao;
    5: Result := liLocalEvento;
    6: Result := liLocalidadeImovel;
    7: Result := liLocalizacaoTrecho;
  else
    raise Exception.CreateFmt('Código inválido: %d', [Codigo]);
  end;
end;

function LocalIncidenciaDescricao(Tipo: LocalIncidencia): string;
begin
  case Tipo of
    liEnderecoDestinatario: Result := 'Endereço do Destinatário';
    liEnderecoTomadorAdquirente: Result := 'Endereço do Tomador/Adquirente';
    liEstabelecimentoPrestadorFornecedor: Result := 'Estabelecimento do Prestador/Fornecedor';
    liLocalPrestacao: Result := 'Local da Prestação';
    liLocalEvento: Result := 'Local do Evento';
    liLocalidadeImovel: Result := 'Localidade do Imóvel';
    liLocalizacaoTrecho: Result := 'Localização do Trecho';
  else
    Result := '';
  end;
end;

end.
