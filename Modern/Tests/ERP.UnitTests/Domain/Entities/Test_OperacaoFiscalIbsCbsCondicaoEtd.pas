unit Test_OperacaoFiscalIbsCbsCondicaoEtd;

interface

uses
  DUnitX.TestFramework,
  TipoComunsUnit,
  DFeTypesUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit;

type
  [TestFixture]
  TTestOperacaoFiscalIbsCbsCondicaoEtd = class
  public
    [Test]
    procedure DeveRetornarDominiosDosAtributos;

    [Test]
    procedure DeveValidarCodigosDoDominio;

    [Test]
    procedure DeveRejeitarConjuntoVazio;

    [Test]
    procedure DeveRejeitarValorForaDoDominio;

    [Test]
    procedure DeveRejeitarAtributoDuplicado;

    [Test]
    procedure DeveNormalizarDuplicatasEOrdem;

    [Test]
    procedure DeveIdentificarCondicaoUniversal;

    [Test]
    procedure DeveMapearCatalogoDeOrgaoParaCodigo;

    [Test]
    procedure DeveConverterCodigosExternosDeAtributo;

    [Test]
    procedure DeveConverterCodigosDeValorDeOcorrencia;

    [Test]
    procedure DeveRejeitarAtributoInvalido;

    [Test]
    procedure DeveMapearFatosDeEmissaoENatureza;

    [Test]
    procedure DeveCompararConjuntosSemOrdem;

    [Test]
    procedure DeveDescreverAtributoEValor;
  end;

implementation

uses
  SysUtils;

function Condicao(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  const Valores: array of Integer): OperacaoFiscalIbsCbsCondicaoEtd;
var
  lista: TArrayInteger;
  i: Integer;
begin
  SetLength(lista, Length(Valores));
  for i := 0 to High(Valores) do
    lista[i] := Valores[i];
  Result := OperacaoFiscalIbsCbsCondicaoEtd.Create(Atributo, lista);
end;

function Condicoes(const Itens: array of OperacaoFiscalIbsCbsCondicaoEtd):
  OperacaoFiscalIbsCbsCondicaoEtdArray;
var
  i: Integer;
begin
  SetLength(Result, Length(Itens));
  for i := 0 to High(Itens) do
    Result[i] := Itens[i];
end;

procedure AssertArrayInteiro(const Esperado: array of Integer;
  const Atual: TArrayInteger; const Mensagem: string);
var
  i: Integer;
begin
  Assert.AreEqual(Length(Esperado), Length(Atual), Mensagem + ' (tamanho)');
  for i := 0 to High(Esperado) do
    Assert.AreEqual(Esperado[i], Atual[i],
      Mensagem + ' (indice ' + IntToStr(i) + ')');
end;

{ TTestOperacaoFiscalIbsCbsCondicaoEtd }

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveRetornarDominiosDosAtributos;
begin
  AssertArrayInteiro([1, 2],
    OperacaoFiscalIbsCbsCondicoes.ValoresDoDominio(ocaTipoEmissao),
    'dominio de tipo de emissao');
  AssertArrayInteiro([1, 2],
    OperacaoFiscalIbsCbsCondicoes.ValoresDoDominio(ocaNaturezaEmissao),
    'dominio de natureza');
  AssertArrayInteiro([0, 1, 2, 3, 4, 5, 6],
    OperacaoFiscalIbsCbsCondicoes.ValoresDoDominio(ocaTipoOrgaoPublico),
    'dominio de orgao publico');
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveValidarCodigosDoDominio;
begin
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaTipoEmissao, 1));
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaTipoEmissao, 2));
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaTipoEmissao, 0));
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaTipoEmissao, 3));

  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaNaturezaEmissao, 1));
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaNaturezaEmissao, 2));
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaNaturezaEmissao, 0));

  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaTipoOrgaoPublico, 0));
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaTipoOrgaoPublico, 6));
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaTipoOrgaoPublico, 7));
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaTipoOrgaoPublico, -1));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveRejeitarConjuntoVazio;
var
  erros: TArrayString;
begin
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.Validar(
    Condicoes([Condicao(ocaTipoEmissao, [])]), erros));
  Assert.AreEqual(1, Length(erros));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveRejeitarValorForaDoDominio;
var
  erros: TArrayString;
begin
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.Validar(
    Condicoes([Condicao(ocaTipoEmissao, [0])]), erros));
  Assert.AreEqual(1, Length(erros));

  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.Validar(
    Condicoes([Condicao(ocaTipoOrgaoPublico, [7])]), erros));
  Assert.AreEqual(1, Length(erros));

  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.Validar(
    Condicoes([
      Condicao(ocaTipoEmissao, [1, 2]),
      Condicao(ocaNaturezaEmissao, [2]),
      Condicao(ocaTipoOrgaoPublico, [0, 6])]), erros));
  Assert.AreEqual(0, Length(erros));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveRejeitarAtributoDuplicado;
var
  erros: TArrayString;
begin
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.Validar(
    Condicoes([
      Condicao(ocaTipoEmissao, [1]),
      Condicao(ocaTipoEmissao, [2])]), erros));
  Assert.AreEqual(1, Length(erros));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveNormalizarDuplicatasEOrdem;
var
  normalizado: OperacaoFiscalIbsCbsCondicaoEtdArray;
begin
  normalizado := OperacaoFiscalIbsCbsCondicoes.Normalizar(
    Condicoes([
      Condicao(ocaTipoOrgaoPublico, [4, 1]),
      Condicao(ocaTipoEmissao, [2, 1, 1])]));

  Assert.AreEqual(2, Length(normalizado));
  Assert.IsTrue(normalizado[0].Atributo = ocaTipoEmissao,
    'condicoes devem ser ordenadas por atributo');
  AssertArrayInteiro([1, 2], normalizado[0].Valores,
    'duplicatas removidas e valores em ordem canonica');
  Assert.IsTrue(normalizado[1].Atributo = ocaTipoOrgaoPublico);

  AssertArrayInteiro([1, 4], normalizado[1].Valores,
    'valores de orgao em ordem canonica');
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveIdentificarCondicaoUniversal;
begin
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.EhUniversal(
    Condicao(ocaTipoEmissao, [1, 2])));
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.EhUniversal(
    Condicao(ocaTipoEmissao, [1])));
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.EhUniversal(
    Condicao(ocaTipoOrgaoPublico, [6, 5, 4, 3, 2, 1, 0])));
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.EhUniversal(
    Condicao(ocaTipoOrgaoPublico, [0, 1, 2, 3, 4, 5])));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveMapearCatalogoDeOrgaoParaCodigo;
begin
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(0) = tgvNenhum);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(1) = tgvUniao);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(2) = tgvEstados);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(3) = tgvDistritoFederal);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(4) = tgvMunicipios);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(5) = tgvConsorcioPublico);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(6) = tgvComiteGestorIbs);

  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(7) = tgvNenhum);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(99) = tgvNenhum);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaTipoEnteGov(-1) = tgvNenhum);

  Assert.AreEqual(0, OperacaoFiscalIbsCbsCondicoes.TipoEnteGovParaCodigo(tgvNenhum));
  Assert.AreEqual(1, OperacaoFiscalIbsCbsCondicoes.TipoEnteGovParaCodigo(tgvUniao));
  Assert.AreEqual(2, OperacaoFiscalIbsCbsCondicoes.TipoEnteGovParaCodigo(tgvEstados));
  Assert.AreEqual(3, OperacaoFiscalIbsCbsCondicoes.TipoEnteGovParaCodigo(tgvDistritoFederal));
  Assert.AreEqual(4, OperacaoFiscalIbsCbsCondicoes.TipoEnteGovParaCodigo(tgvMunicipios));
  Assert.AreEqual(5, OperacaoFiscalIbsCbsCondicoes.TipoEnteGovParaCodigo(tgvConsorcioPublico));
  Assert.AreEqual(6, OperacaoFiscalIbsCbsCondicoes.TipoEnteGovParaCodigo(tgvComiteGestorIbs));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveConverterCodigosExternosDeAtributo;
begin
  // Contrato de persistencia: conversao explicita, sem depender do ordinal.
  Assert.AreEqual(1, OperacaoFiscalIbsCbsCondicoes.AtributoParaCodigo(ocaTipoEmissao));
  Assert.AreEqual(2, OperacaoFiscalIbsCbsCondicoes.AtributoParaCodigo(ocaNaturezaEmissao));
  Assert.AreEqual(3, OperacaoFiscalIbsCbsCondicoes.AtributoParaCodigo(ocaTipoOrgaoPublico));

  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(1) = ocaTipoEmissao);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(2) = ocaNaturezaEmissao);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(3) = ocaTipoOrgaoPublico);

  // Codigo externo sem atributo suportado decodifica para a representacao
  // invalida explicita e nao para um ordinal arbitrario dentro do dominio.
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(0) = ocaInvalida);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(4) = ocaInvalida);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(99) = ocaInvalida);
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoParaAtributo(-1) = ocaInvalida);

  // A representacao invalida nao produz codigo persistivel.
  Assert.AreEqual(0, OperacaoFiscalIbsCbsCondicoes.AtributoParaCodigo(ocaInvalida));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveConverterCodigosDeValorDeOcorrencia;
begin
  Assert.AreEqual(1, OperacaoFiscalIbsCbsCondicoes.TipoEmissaoParaCodigo(tecPropria));
  Assert.AreEqual(2, OperacaoFiscalIbsCbsCondicoes.TipoEmissaoParaCodigo(tecTerceiros));

  Assert.AreEqual(1, OperacaoFiscalIbsCbsCondicoes.NaturezaParaCodigo(necEntrada));
  Assert.AreEqual(2, OperacaoFiscalIbsCbsCondicoes.NaturezaParaCodigo(necSaida));

  // Os mesmos codigos usados pelo dominio continuam validos para o atributo.
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaTipoEmissao,
    OperacaoFiscalIbsCbsCondicoes.TipoEmissaoParaCodigo(tecTerceiros)));
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.CodigoValido(ocaNaturezaEmissao,
    OperacaoFiscalIbsCbsCondicoes.NaturezaParaCodigo(necEntrada)));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveRejeitarAtributoInvalido;
var
  erros: TArrayString;
begin
  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.Validar(
    Condicoes([Condicao(ocaInvalida, [1])]), erros),
    'atributo sem codigo externo suportado deve ser rejeitado');
  Assert.AreEqual(1, Length(erros));
  Assert.IsTrue(Pos('Atributo', erros[0]) > 0);

  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.Validar(
    Condicoes([Condicao(ocaInvalida, [7])]), erros),
    'atributo invalido nao deve ser aceito mesmo com valor fora do dominio');
  Assert.AreEqual(1, Length(erros));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveMapearFatosDeEmissaoENatureza;
var
  emissao: TipoEmissaoOcorrencia;
  natureza: NaturezaEmissaoOcorrencia;
begin
  emissao := OperacaoFiscalIbsCbsCondicoes.TipoEmissaoDePropria(True);
  Assert.IsTrue(emissao.IsConhecido);
  Assert.IsTrue(emissao.Valor = tecPropria);

  emissao := OperacaoFiscalIbsCbsCondicoes.TipoEmissaoDePropria(False);
  Assert.IsTrue(emissao.IsConhecido);
  Assert.IsTrue(emissao.Valor = tecTerceiros);

  natureza := OperacaoFiscalIbsCbsCondicoes.NaturezaDeSaida(True);
  Assert.IsTrue(natureza.IsConhecido);
  Assert.IsTrue(natureza.Valor = necSaida);

  natureza := OperacaoFiscalIbsCbsCondicoes.NaturezaDeSaida(False);
  Assert.IsTrue(natureza.IsConhecido);
  Assert.IsTrue(natureza.Valor = necEntrada);

  emissao := TipoEmissaoOcorrencia.Desconhecido;
  Assert.IsFalse(emissao.IsConhecido);

  natureza := NaturezaEmissaoOcorrencia.Desconhecido;
  Assert.IsFalse(natureza.IsConhecido);
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveCompararConjuntosSemOrdem;
begin
  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.Iguais(
    Condicoes([Condicao(ocaTipoEmissao, [1, 2])]),
    Condicoes([Condicao(ocaTipoEmissao, [2, 1, 1])])));

  Assert.IsTrue(OperacaoFiscalIbsCbsCondicoes.Iguais(
    Condicoes([
      Condicao(ocaTipoOrgaoPublico, [4]),
      Condicao(ocaTipoEmissao, [2])]),
    Condicoes([
      Condicao(ocaTipoEmissao, [2]),
      Condicao(ocaTipoOrgaoPublico, [4])])));

  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.Iguais(
    Condicoes([Condicao(ocaTipoEmissao, [1, 2])]),
    Condicoes([Condicao(ocaTipoEmissao, [1])])));

  Assert.IsFalse(OperacaoFiscalIbsCbsCondicoes.Iguais(
    Condicoes([Condicao(ocaTipoEmissao, [1])]),
    Condicoes([Condicao(ocaNaturezaEmissao, [1])])));
end;

procedure TTestOperacaoFiscalIbsCbsCondicaoEtd.DeveDescreverAtributoEValor;
begin
  Assert.AreEqual('Tipo de emissão',
    OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(ocaTipoEmissao));
  Assert.AreEqual('Natureza',
    OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(ocaNaturezaEmissao));
  Assert.AreEqual('Tipo de órgão público',
    OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(ocaTipoOrgaoPublico));

  Assert.AreEqual('Propria',
    OperacaoFiscalIbsCbsCondicoes.DescricaoValor(ocaTipoEmissao, 1));
  Assert.AreEqual('Terceiros',
    OperacaoFiscalIbsCbsCondicoes.DescricaoValor(ocaTipoEmissao, 2));
  Assert.AreEqual('Entrada',
    OperacaoFiscalIbsCbsCondicoes.DescricaoValor(ocaNaturezaEmissao, 1));
  Assert.AreEqual('Saida',
    OperacaoFiscalIbsCbsCondicoes.DescricaoValor(ocaNaturezaEmissao, 2));

  Assert.AreEqual(TipoEnteGovEnumStr[tgvUniao],
    OperacaoFiscalIbsCbsCondicoes.DescricaoValor(ocaTipoOrgaoPublico, 1));
  Assert.AreEqual('Codigo 9',
    OperacaoFiscalIbsCbsCondicoes.DescricaoValor(ocaTipoOrgaoPublico, 9));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestOperacaoFiscalIbsCbsCondicaoEtd);

end.
