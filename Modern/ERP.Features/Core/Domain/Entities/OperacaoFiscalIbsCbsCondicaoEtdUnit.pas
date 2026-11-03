unit OperacaoFiscalIbsCbsCondicaoEtdUnit;

interface

uses
  TipoComunsUnit,
  DFeTypesUnit;

type
  // Atributos persistidos. ocaInvalida e a representacao explicita de um codigo
  // externo sem atributo suportado: nunca e valida para validacao/persistencia,
  // mas preserva a linha carregada para reportar configuracao invalida em vez
  // de descarta-la silenciosamente.
  OperacaoFiscalIbsCbsCondicaoAtributo = (
    ocaInvalida = 0,
    ocaTipoEmissao = 1,
    ocaNaturezaEmissao = 2,
    ocaTipoOrgaoPublico = 3
  );

  TipoEmissaoCondicao = (tecPropria = 1, tecTerceiros = 2);
  NaturezaEmissaoCondicao = (necEntrada = 1, necSaida = 2);

  OperacaoFiscalIbsCbsCondicaoAtributoArray =
    array of OperacaoFiscalIbsCbsCondicaoAtributo;

  // Os fatos de emissao e natureza podem ser conhecidos ou desconhecidos; o
  // desconhecido abre pendencia somente quando puder alterar a determinacao.
  TipoEmissaoOcorrencia = record
  private
    FConhecido: Boolean;
    FValor: TipoEmissaoCondicao;
  public
    class function Conhecido(Value: TipoEmissaoCondicao): TipoEmissaoOcorrencia; static;
    class function Desconhecido: TipoEmissaoOcorrencia; static;
    property IsConhecido: Boolean read FConhecido;
    property Valor: TipoEmissaoCondicao read FValor;
  end;

  NaturezaEmissaoOcorrencia = record
  private
    FConhecido: Boolean;
    FValor: NaturezaEmissaoCondicao;
  public
    class function Conhecido(Value: NaturezaEmissaoCondicao): NaturezaEmissaoOcorrencia; static;
    class function Desconhecido: NaturezaEmissaoOcorrencia; static;
    property IsConhecido: Boolean read FConhecido;
    property Valor: NaturezaEmissaoCondicao read FValor;
  end;

  OperacaoFiscalIbsCbsCondicaoEtd = record
  private
    FAtributo: OperacaoFiscalIbsCbsCondicaoAtributo;
    // Codigos canonicos; o conjunto nao possui ordem semantica.
    FValores: TArrayInteger;
  public
    class function Create(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
      const Valores: TArrayInteger): OperacaoFiscalIbsCbsCondicaoEtd; static;
    property Atributo: OperacaoFiscalIbsCbsCondicaoAtributo read FAtributo;
    property Valores: TArrayInteger read FValores;
  end;

  OperacaoFiscalIbsCbsCondicaoEtdArray = array of OperacaoFiscalIbsCbsCondicaoEtd;

  OperacaoFiscalIbsCbsCondicoes = class
  public
    class function ValoresDoDominio(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): TArrayInteger; static;
    class function CodigoValido(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo; Codigo: Integer): Boolean; static;
    class function Normalizar(
      const Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray): OperacaoFiscalIbsCbsCondicaoEtdArray; static;
    class function Validar(const Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
      out Erros: TArrayString): Boolean; static;
    class function EhUniversal(const Condicao: OperacaoFiscalIbsCbsCondicaoEtd): Boolean; static;
    class function Contem(const Condicao: OperacaoFiscalIbsCbsCondicaoEtd; Codigo: Integer): Boolean; static;
    class function DescricaoAtributo(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): string; static;
    class function DescricaoValor(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
      Codigo: Integer): string; static;
    class function TipoEnteGovParaCodigo(Value: TipoEnteGovEnum): Integer; static;
    class function CodigoParaTipoEnteGov(Codigo: Integer): TipoEnteGovEnum; static;
    // Contrato de codigos externos (persistencia): conversao explicita, sem
    // depender do ordinal do enum. Codigo de atributo nao suportado decodifica
    // para ocaInvalida; ocaInvalida codifica para 0 (codigo invalido).
    class function AtributoParaCodigo(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): Integer; static;
    class function CodigoParaAtributo(Codigo: Integer): OperacaoFiscalIbsCbsCondicaoAtributo; static;
    class function TipoEmissaoParaCodigo(Value: TipoEmissaoCondicao): Integer; static;
    class function NaturezaParaCodigo(Value: NaturezaEmissaoCondicao): Integer; static;
    class function TipoEmissaoDePropria(Propria: Boolean): TipoEmissaoOcorrencia; static;
    class function NaturezaDeSaida(Saida: Boolean): NaturezaEmissaoOcorrencia; static;
    class function Iguais(const A, B: OperacaoFiscalIbsCbsCondicaoEtdArray): Boolean; static;
  end;

implementation

uses
  SysUtils;

const
  CODIGO_MINIMO_TIPO_EMISSAO = 1;
  CODIGO_MAXIMO_TIPO_EMISSAO = 2;
  CODIGO_MINIMO_NATUREZA = 1;
  CODIGO_MAXIMO_NATUREZA = 2;
  CODIGO_MINIMO_ORGAO = 0;
  CODIGO_MAXIMO_ORGAO = 6;

function AtributoValido(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): Boolean;
begin
  case Atributo of
    ocaTipoEmissao, ocaNaturezaEmissao, ocaTipoOrgaoPublico:
      Result := True;
  else
    Result := False;
  end;
end;

function ValoresNormalizados(const Valores: TArrayInteger): TArrayInteger;
var
  i, j, n, posicao: Integer;
  troca: Integer;
begin
  n := Length(Valores);
  SetLength(Result, n);
  for i := 0 to n - 1 do
    Result[i] := Valores[i];

  // Ordem canonica crescente; o conjunto nao depende da ordem recebida.
  for i := 0 to n - 2 do
    for j := i + 1 to n - 1 do
      if Result[j] < Result[i] then
      begin
        troca := Result[i];
        Result[i] := Result[j];
        Result[j] := troca;
      end;

  if n > 1 then
  begin
    posicao := 1;
    for i := 1 to n - 1 do
      if Result[i] <> Result[i - 1] then
      begin
        Result[posicao] := Result[i];
        Inc(posicao);
      end;
    SetLength(Result, posicao);
  end;
end;

function ContemCodigo(const Valores: TArrayInteger; Codigo: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(Valores) do
    if Valores[i] = Codigo then
    begin
      Result := True;
      Exit;
    end;
end;

procedure AdicionarErro(var Erros: TArrayString; const Mensagem: string);
var
  n: Integer;
begin
  n := Length(Erros);
  SetLength(Erros, n + 1);
  Erros[n] := Mensagem;
end;

{ TipoEmissaoOcorrencia }

class function TipoEmissaoOcorrencia.Conhecido(
  Value: TipoEmissaoCondicao): TipoEmissaoOcorrencia;
begin
  Result.FConhecido := True;
  Result.FValor := Value;
end;

class function TipoEmissaoOcorrencia.Desconhecido: TipoEmissaoOcorrencia;
begin
  Result.FConhecido := False;
  Result.FValor := tecPropria;
end;

{ NaturezaEmissaoOcorrencia }

class function NaturezaEmissaoOcorrencia.Conhecido(
  Value: NaturezaEmissaoCondicao): NaturezaEmissaoOcorrencia;
begin
  Result.FConhecido := True;
  Result.FValor := Value;
end;

class function NaturezaEmissaoOcorrencia.Desconhecido: NaturezaEmissaoOcorrencia;
begin
  Result.FConhecido := False;
  Result.FValor := necEntrada;
end;

{ OperacaoFiscalIbsCbsCondicaoEtd }

class function OperacaoFiscalIbsCbsCondicaoEtd.Create(
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  const Valores: TArrayInteger): OperacaoFiscalIbsCbsCondicaoEtd;
begin
  Result.FAtributo := Atributo;
  Result.FValores := Valores;
end;

{ OperacaoFiscalIbsCbsCondicoes }

class function OperacaoFiscalIbsCbsCondicoes.ValoresDoDominio(
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): TArrayInteger;
var
  i: Integer;
begin
  SetLength(Result, 0);
  case Atributo of
    ocaTipoEmissao:
      begin
        SetLength(Result, 2);
        Result[0] := CODIGO_MINIMO_TIPO_EMISSAO;
        Result[1] := CODIGO_MAXIMO_TIPO_EMISSAO;
      end;
    ocaNaturezaEmissao:
      begin
        SetLength(Result, 2);
        Result[0] := CODIGO_MINIMO_NATUREZA;
        Result[1] := CODIGO_MAXIMO_NATUREZA;
      end;
    ocaTipoOrgaoPublico:
      begin
        SetLength(Result, CODIGO_MAXIMO_ORGAO - CODIGO_MINIMO_ORGAO + 1);
        for i := CODIGO_MINIMO_ORGAO to CODIGO_MAXIMO_ORGAO do
          Result[i - CODIGO_MINIMO_ORGAO] := i;
      end;
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.CodigoValido(
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  Codigo: Integer): Boolean;
begin
  Result := False;
  case Atributo of
    ocaTipoEmissao:
      Result := (Codigo >= CODIGO_MINIMO_TIPO_EMISSAO) and
        (Codigo <= CODIGO_MAXIMO_TIPO_EMISSAO);
    ocaNaturezaEmissao:
      Result := (Codigo >= CODIGO_MINIMO_NATUREZA) and
        (Codigo <= CODIGO_MAXIMO_NATUREZA);
    ocaTipoOrgaoPublico:
      Result := (Codigo >= CODIGO_MINIMO_ORGAO) and
        (Codigo <= CODIGO_MAXIMO_ORGAO);
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.Normalizar(
  const Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray): OperacaoFiscalIbsCbsCondicaoEtdArray;
var
  i, j: Integer;
  atual: OperacaoFiscalIbsCbsCondicaoEtd;
begin
  Result := Copy(Condicoes, 0, Length(Condicoes));

  for i := 0 to High(Result) do
    Result[i] := OperacaoFiscalIbsCbsCondicaoEtd.Create(
      Result[i].Atributo,
      ValoresNormalizados(Result[i].Valores));

  // Ordem canonica por atributo; a ordem recebida nao e significativa.
  for i := 1 to High(Result) do
  begin
    atual := Result[i];
    j := i - 1;
    while (j >= 0) and (Ord(Result[j].Atributo) > Ord(atual.Atributo)) do
    begin
      Result[j + 1] := Result[j];
      Dec(j);
    end;
    Result[j + 1] := atual;
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.Validar(
  const Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  out Erros: TArrayString): Boolean;
var
  i, j: Integer;
  atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  atributoOcupado: array[1..3] of Boolean;
begin
  SetLength(Erros, 0);

  for i := 1 to 3 do
    atributoOcupado[i] := False;

  for i := 0 to High(Condicoes) do
  begin
    atributo := Condicoes[i].Atributo;

    if not AtributoValido(atributo) then
    begin
      AdicionarErro(Erros, 'Atributo de condicao invalido.');
      Continue;
    end;

    if atributoOcupado[Ord(atributo)] then
      AdicionarErro(Erros, 'Atributo ' + DescricaoAtributo(atributo) +
        ' possui mais de uma condicao no mesmo vinculo.')
    else
      atributoOcupado[Ord(atributo)] := True;

    if Length(Condicoes[i].Valores) = 0 then
      AdicionarErro(Erros, 'Condicao de ' + DescricaoAtributo(atributo) +
        ' sem valores.')
    else
      for j := 0 to High(Condicoes[i].Valores) do
        if not CodigoValido(atributo, Condicoes[i].Valores[j]) then
          AdicionarErro(Erros, 'Valor ' + IntToStr(Condicoes[i].Valores[j]) +
            ' invalido para ' + DescricaoAtributo(atributo) + '.');
  end;

  Result := Length(Erros) = 0;
end;

class function OperacaoFiscalIbsCbsCondicoes.EhUniversal(
  const Condicao: OperacaoFiscalIbsCbsCondicaoEtd): Boolean;
var
  dominio: TArrayInteger;
  i: Integer;
begin
  Result := False;
  dominio := ValoresDoDominio(Condicao.Atributo);
  if Length(dominio) = 0 then
    Exit;

  for i := 0 to High(dominio) do
    if not ContemCodigo(Condicao.Valores, dominio[i]) then
      Exit;

  Result := True;
end;

class function OperacaoFiscalIbsCbsCondicoes.Contem(
  const Condicao: OperacaoFiscalIbsCbsCondicaoEtd;
  Codigo: Integer): Boolean;
begin
  Result := ContemCodigo(Condicao.Valores, Codigo);
end;

class function OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): string;
begin
  case Atributo of
    ocaTipoEmissao: Result := 'Tipo de emissao';
    ocaNaturezaEmissao: Result := 'Natureza da emissao';
    ocaTipoOrgaoPublico: Result := 'Tipo de orgao publico';
  else
    Result := 'Atributo desconhecido';
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.DescricaoValor(
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  Codigo: Integer): string;
begin
  if not CodigoValido(Atributo, Codigo) then
  begin
    Result := 'Codigo ' + IntToStr(Codigo);
    Exit;
  end;

  case Atributo of
    ocaTipoEmissao:
      case Codigo of
        CODIGO_MINIMO_TIPO_EMISSAO: Result := 'Propria';
        CODIGO_MAXIMO_TIPO_EMISSAO: Result := 'Terceiros';
      end;
    ocaNaturezaEmissao:
      case Codigo of
        CODIGO_MINIMO_NATUREZA: Result := 'Entrada';
        CODIGO_MAXIMO_NATUREZA: Result := 'Saida';
      end;
    ocaTipoOrgaoPublico:
      Result := TipoEnteGovEnumStr[CodigoParaTipoEnteGov(Codigo)];
  else
    Result := 'Codigo ' + IntToStr(Codigo);
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.TipoEnteGovParaCodigo(
  Value: TipoEnteGovEnum): Integer;
begin
  case Value of
    tgvNenhum: Result := 0;
    tgvUniao: Result := 1;
    tgvEstados: Result := 2;
    tgvDistritoFederal: Result := 3;
    tgvMunicipios: Result := 4;
    tgvConsorcioPublico: Result := 5;
    tgvComiteGestorIbs: Result := 6;
  else
    Result := 0;
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(
  Codigo: Integer): TipoEnteGovEnum;
begin
  case Codigo of
    1: Result := tgvUniao;
    2: Result := tgvEstados;
    3: Result := tgvDistritoFederal;
    4: Result := tgvMunicipios;
    5: Result := tgvConsorcioPublico;
    6: Result := tgvComiteGestorIbs;
  else
    Result := tgvNenhum;
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.AtributoParaCodigo(
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): Integer;
begin
  case Atributo of
    ocaTipoEmissao: Result := 1;
    ocaNaturezaEmissao: Result := 2;
    ocaTipoOrgaoPublico: Result := 3;
  else
    // Codigo externo invalido; nao representa um atributo persistivel.
    Result := 0;
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(
  Codigo: Integer): OperacaoFiscalIbsCbsCondicaoAtributo;
begin
  case Codigo of
    1: Result := ocaTipoEmissao;
    2: Result := ocaNaturezaEmissao;
    3: Result := ocaTipoOrgaoPublico;
  else
    Result := ocaInvalida;
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.TipoEmissaoParaCodigo(
  Value: TipoEmissaoCondicao): Integer;
begin
  case Value of
    tecPropria: Result := 1;
    tecTerceiros: Result := 2;
  else
    Result := 0;
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.NaturezaParaCodigo(
  Value: NaturezaEmissaoCondicao): Integer;
begin
  case Value of
    necEntrada: Result := 1;
    necSaida: Result := 2;
  else
    Result := 0;
  end;
end;

class function OperacaoFiscalIbsCbsCondicoes.TipoEmissaoDePropria(
  Propria: Boolean): TipoEmissaoOcorrencia;
begin
  if Propria then
    Result := TipoEmissaoOcorrencia.Conhecido(tecPropria)
  else
    Result := TipoEmissaoOcorrencia.Conhecido(tecTerceiros);
end;

class function OperacaoFiscalIbsCbsCondicoes.NaturezaDeSaida(
  Saida: Boolean): NaturezaEmissaoOcorrencia;
begin
  if Saida then
    Result := NaturezaEmissaoOcorrencia.Conhecido(necSaida)
  else
    Result := NaturezaEmissaoOcorrencia.Conhecido(necEntrada);
end;

class function OperacaoFiscalIbsCbsCondicoes.Iguais(
  const A, B: OperacaoFiscalIbsCbsCondicaoEtdArray): Boolean;
var
  normalizadoA, normalizadoB: OperacaoFiscalIbsCbsCondicaoEtdArray;
  i, j: Integer;
begin
  Result := False;
  normalizadoA := Normalizar(A);
  normalizadoB := Normalizar(B);

  if Length(normalizadoA) <> Length(normalizadoB) then
    Exit;

  for i := 0 to High(normalizadoA) do
  begin
    if normalizadoA[i].Atributo <> normalizadoB[i].Atributo then
      Exit;
    if Length(normalizadoA[i].Valores) <> Length(normalizadoB[i].Valores) then
      Exit;
    for j := 0 to High(normalizadoA[i].Valores) do
      if normalizadoA[i].Valores[j] <> normalizadoB[i].Valores[j] then
        Exit;
  end;

  Result := True;
end;

end.
