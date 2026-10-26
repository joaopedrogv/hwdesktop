unit TipoEnteGovernamentalEnumUnit;

interface

type
  /// <summary>
  ///   Tipos de ente governamental aceitos nas operacoes de compra governamental.
  ///   Equivale a TipoEnteGovernamental.java (1 Uniao, 2 Estado, 3 Distrito Federal,
  ///   4 Municipio, 5 Consorcio Publico, 6 Comite Gestor do IBS).
  /// </summary>
  TipoEnteGovernamental = (
    tegUnassigned = 0,
    tegUniao = 1,
    tegEstado = 2,
    tegDistritoFederal = 3,
    tegMunicipio = 4,
    tegConsorcioPublico = 5,
    tegComiteGestorIbs = 6
  );

  /// <summary>
  ///   Converte o codigo numerico (1..6) no enum correspondente.
  ///   Lanca excecao quando o codigo nao esta mapeado (espelho de fromCodigo).
  /// </summary>
  function TipoEnteGovernamentalFromCodigo(Codigo: Integer): TipoEnteGovernamental;

  /// <summary>
  ///   Retorna o tipo de ente governamental equivalente para fins de calculo do IBS
  ///   e da CBS (espelho de tipoEnteEquivalente): Uniao->Uniao, Estado->Estado,
  ///   Distrito Federal->Estado, Municipio->Municipio, Consorcio Publico->Municipio
  ///   e Comite Gestor do IBS->Municipio. Para tegUnassigned, ausente no Java,
  ///   devolve o proprio valor (neutro), sem lancar excecao.
  /// </summary>
  function TipoEnteGovernamentalEquivalente(Tipo: TipoEnteGovernamental): TipoEnteGovernamental;

  /// <summary>
  ///   Indica se o tipo pertence a esfera equivalente da Uniao (espelho de isUniao).
  /// </summary>
  function TipoEnteGovernamentalIsUniao(Tipo: TipoEnteGovernamental): Boolean;

  /// <summary>
  ///   Indica se o tipo pertence a esfera equivalente de Estado (espelho de isEstado).
  ///   O Distrito Federal satisfaz este predicado.
  /// </summary>
  function TipoEnteGovernamentalIsEstado(Tipo: TipoEnteGovernamental): Boolean;

  /// <summary>
  ///   Indica se o tipo pertence a esfera equivalente de Municipio (espelho de isMunicipio).
  ///   Consorcio Publico e Comite Gestor do IBS satisfazem este predicado.
  /// </summary>
  function TipoEnteGovernamentalIsMunicipio(Tipo: TipoEnteGovernamental): Boolean;

implementation

uses
  SysUtils;

{ TipoEnteGovernamental }

function TipoEnteGovernamentalFromCodigo(Codigo: Integer): TipoEnteGovernamental;
begin
  case Codigo of
    1: Result := tegUniao;
    2: Result := tegEstado;
    3: Result := tegDistritoFederal;
    4: Result := tegMunicipio;
    5: Result := tegConsorcioPublico;
    6: Result := tegComiteGestorIbs;
  else
    raise Exception.Create('Tipo de ente governamental não mapeado');
  end;
end;

function TipoEnteGovernamentalEquivalente(Tipo: TipoEnteGovernamental): TipoEnteGovernamental;
begin
  case Tipo of
    tegUniao: Result := tegUniao;
    tegEstado: Result := tegEstado;
    tegDistritoFederal: Result := tegEstado;
    tegMunicipio: Result := tegMunicipio;
    tegConsorcioPublico: Result := tegMunicipio;
    tegComiteGestorIbs: Result := tegMunicipio;
  else
    // tegUnassigned nao tem equivalente no Java oficial; devolve o proprio
    // valor (neutro) para manter os predicados falsos, sem lancar excecao.
    Result := Tipo;
  end;
end;

function TipoEnteGovernamentalIsUniao(Tipo: TipoEnteGovernamental): Boolean;
begin
  Result := TipoEnteGovernamentalEquivalente(Tipo) = tegUniao;
end;

function TipoEnteGovernamentalIsEstado(Tipo: TipoEnteGovernamental): Boolean;
begin
  Result := TipoEnteGovernamentalEquivalente(Tipo) = tegEstado;
end;

function TipoEnteGovernamentalIsMunicipio(Tipo: TipoEnteGovernamental): Boolean;
begin
  Result := TipoEnteGovernamentalEquivalente(Tipo) = tegMunicipio;
end;

end.
