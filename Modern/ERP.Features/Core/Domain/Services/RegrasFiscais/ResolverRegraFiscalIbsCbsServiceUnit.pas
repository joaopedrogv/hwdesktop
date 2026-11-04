unit ResolverRegraFiscalIbsCbsServiceUnit;

interface

uses
  IResolverRegraFiscalIbsCbsServiceUnit,
  ResolverRegraFiscalIbsCbsTypesUnit,
  OperacaoFiscalIbsCbsCondicaoEtdUnit,
  IOperacoesFiscaisIbsCbsRepositoryUnit,
  IRegrasFiscaisIbsCbsRepositoryUnit,
  OperacaoFiscalIbsCbsEtdUnit,
  RegraFiscalIbsCbsEtdUnit;

type
  ResolverRegraFiscalIbsCbsService = class(TInterfacedObject, IResolverRegraFiscalIbsCbsService)
  private
    FOperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
    FRegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository;
  public
    constructor Create(
      OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
      RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository
    );

    function Executar(const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsResult;
    function Analisar(const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsAnalise;
  end;

implementation

uses
  SysUtils,
  Classes,
  TipoComunsUnit,
  DFeTypesUnit,
  CurrencyNullableUnit,
  IntegerNullableUnit,
  StringNullableUnit;

const
  MASCARA_DOMINIO_TIPO_EMISSAO = 3;   // codigos 1 e 2
  MASCARA_DOMINIO_NATUREZA = 3;       // codigos 1 e 2
  MASCARA_DOMINIO_ORGAO = 127;        // codigos 0 a 6

type
  TFatosCondicao = record
    TipoEmissao: TipoEmissaoOcorrencia;
    NaturezaEmissao: NaturezaEmissaoOcorrencia;
    TipoOrgaoPublico: TipoEnteGovEnum;
  end;

  // Hipotese de aplicabilidade representada por mascaras de bits; a ordem dos
  // candidatos devolvidos pelo repositorio nao participa da decisao.
  THipotese = record
    MascaraTipoEmissao: Integer;
    MascaraNatureza: Integer;
    MascaraOrgao: Integer;
  end;

  TEstadoAvaliacao = (
    eacNaoAplicavel,
    eacAplicavel,
    eacPendente,
    eacConfiguracaoInvalida
  );

  TAvaliacaoCandidato = record
    Candidato: OperacaoFiscalIbsCbsEtd;
    Estado: TEstadoAvaliacao;
    Mensagem: string;
    Hipotese: THipotese;
  end;

  TAvaliacaoCandidatoArray = array of TAvaliacaoCandidato;

  TCandidatoAnalise = record
    Candidato: OperacaoFiscalIbsCbsEtd;
    Regra: RegraFiscalIbsCbsEtd;
    Hipotese: THipotese;
  end;

  TCandidatoAnaliseArray = array of TCandidatoAnalise;

  TResolucao = record
    Status: ResolverRegraFiscalIbsCbsResultado;
    Regra: RegraFiscalIbsCbsEtd;
    Mensagem: string;
    Redundante: Boolean;
    AssinaturaConflito: string;
    AtributosPendentes: OperacaoFiscalIbsCbsCondicaoAtributoArray;
  end;

function ResolucaoVazia: TResolucao;
begin
  Result.Status := rrNenhumaRegra;
  Result.Regra := nil;
  Result.Mensagem := '';
  Result.Redundante := False;
  Result.AssinaturaConflito := '';
  SetLength(Result.AtributosPendentes, 0);
end;

{ Mascaras e relacoes entre hipoteses }

function MascaraDoCodigo(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  Codigo: Integer): Integer;
begin
  Result := 0;
  if not OperacaoFiscalIbsCbsCondicoes.CodigoValido(Atributo, Codigo) then
    Exit;

  case Atributo of
    ocaTipoEmissao, ocaNaturezaEmissao:
      Result := 1 shl (Codigo - 1);
    ocaTipoOrgaoPublico:
      Result := 1 shl Codigo;
  end;
end;

function MascaraDaCondicao(const Condicao: OperacaoFiscalIbsCbsCondicaoEtd): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to High(Condicao.Valores) do
    Result := Result or MascaraDoCodigo(Condicao.Atributo, Condicao.Valores[i]);
end;

procedure MascarasDasCondicoes(const Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  out Hipotese: THipotese);
var
  i: Integer;
begin
  Hipotese.MascaraTipoEmissao := MASCARA_DOMINIO_TIPO_EMISSAO;
  Hipotese.MascaraNatureza := MASCARA_DOMINIO_NATUREZA;
  Hipotese.MascaraOrgao := MASCARA_DOMINIO_ORGAO;

  for i := 0 to High(Condicoes) do
    case Condicoes[i].Atributo of
      ocaTipoEmissao:
        Hipotese.MascaraTipoEmissao := MascaraDaCondicao(Condicoes[i]);
      ocaNaturezaEmissao:
        Hipotese.MascaraNatureza := MascaraDaCondicao(Condicoes[i]);
      ocaTipoOrgaoPublico:
        Hipotese.MascaraOrgao := MascaraDaCondicao(Condicoes[i]);
    end;
end;

function MascaraContida(AMascara, BMascara: Integer): Boolean;
begin
  Result := (AMascara and BMascara) = AMascara;
end;

function HipoteseContida(const A, B: THipotese): Boolean;
begin
  Result :=
    MascaraContida(A.MascaraTipoEmissao, B.MascaraTipoEmissao) and
    MascaraContida(A.MascaraNatureza, B.MascaraNatureza) and
    MascaraContida(A.MascaraOrgao, B.MascaraOrgao);
end;

function HipoteseEstritamenteMaisRestritiva(const A, B: THipotese): Boolean;
begin
  Result := HipoteseContida(A, B) and not HipoteseContida(B, A);
end;

function HipoteseIntersecaoNaoVazia(const A, B: THipotese): Boolean;
begin
  Result :=
    ((A.MascaraTipoEmissao and B.MascaraTipoEmissao) <> 0) and
    ((A.MascaraNatureza and B.MascaraNatureza) <> 0) and
    ((A.MascaraOrgao and B.MascaraOrgao) <> 0);
end;

function HipoteseMaiorQue(const A, B: THipotese): Boolean;
begin
  if A.MascaraTipoEmissao <> B.MascaraTipoEmissao then
    Result := A.MascaraTipoEmissao > B.MascaraTipoEmissao
  else if A.MascaraNatureza <> B.MascaraNatureza then
    Result := A.MascaraNatureza > B.MascaraNatureza
  else
    Result := A.MascaraOrgao > B.MascaraOrgao;
end;

{ Descricoes }

function IdentificacaoVinculo(const Candidato: OperacaoFiscalIbsCbsEtd): string;
var
  operacaoInterna: string;
  grupoFiscal: string;
  regraFiscal: string;
begin
  operacaoInterna := Candidato.OperacaoInternaDescricao;
  if Trim(operacaoInterna) = '' then
    operacaoInterna := 'Operação Interna não identificada';

  grupoFiscal := Candidato.GrupoFiscalDescricao;
  if Trim(grupoFiscal) = '' then
    grupoFiscal := 'Nenhum';

  regraFiscal := Candidato.RegraFiscalDescricao;
  if Trim(regraFiscal) = '' then
    regraFiscal := 'Regra Fiscal não identificada';

  Result := Format('%s / %s / %s / Vigência a partir de %s',
    [operacaoInterna, grupoFiscal, regraFiscal,
     FormatDateTime('dd/mm/yyyy', Candidato.InicioVigencia)]);

  // Um rascunho ainda nao persistido nao possui Id; o prefixo o distingue dos
  // vinculos carregados do repositorio.
  if Trim(Candidato.Id) = '' then
    Result := 'Nova configuração: ' + Result;
end;

function DescricaoAbrangencia(
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): string;
begin
  case Atributo of
    ocaTipoEmissao:
      Result := 'emissão própria e de terceiros';
    ocaNaturezaEmissao:
      Result := 'entrada e saída';
    ocaTipoOrgaoPublico:
      Result := 'todas as opções do catálogo';
  else
    Result := '';
  end;
end;

function DescricaoAbrangenciaFrase(
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): string;
begin
  case Atributo of
    ocaTipoEmissao:
      Result := 'tanto emissão própria quanto de terceiros';
    ocaNaturezaEmissao:
      Result := 'tanto entrada quanto saída';
    ocaTipoOrgaoPublico:
      Result := 'todas as opções do catálogo';
  else
    Result := '';
  end;
end;

function AtributoDeCondicaoConhecido(
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo): Boolean;
begin
  Result := (Atributo = ocaTipoEmissao) or (Atributo = ocaNaturezaEmissao) or
    (Atributo = ocaTipoOrgaoPublico);
end;

function DescricaoCondicaoInvalida(
  const Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray): string;
var
  atributosOcupados: array[1..3] of Boolean;
  i, j: Integer;
  atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  atributoAfetado: OperacaoFiscalIbsCbsCondicaoAtributo;
begin
  Result := 'de aplicabilidade';
  atributoAfetado := ocaInvalida;

  // Atributo sem suporte nao possui rotulo confiavel para o usuario; nesse
  // caso a mensagem permanece generica.
  for i := 0 to High(Condicoes) do
    if not AtributoDeCondicaoConhecido(Condicoes[i].Atributo) then
      Exit;

  for i := 1 to 3 do
    atributosOcupados[i] := False;

  for i := 0 to High(Condicoes) do
  begin
    atributo := Condicoes[i].Atributo;

    if atributosOcupados[Ord(atributo)] then
    begin
      if atributoAfetado = ocaInvalida then
        atributoAfetado := atributo;
      Continue;
    end;

    atributosOcupados[Ord(atributo)] := True;

    if Length(Condicoes[i].Valores) = 0 then
      if atributoAfetado = ocaInvalida then
        atributoAfetado := atributo;

    for j := 0 to High(Condicoes[i].Valores) do
      if not OperacaoFiscalIbsCbsCondicoes.CodigoValido(
        atributo, Condicoes[i].Valores[j]) then
        if atributoAfetado = ocaInvalida then
          atributoAfetado := atributo;
  end;

  if atributoAfetado <> ocaInvalida then
    Result := OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(atributoAfetado);
end;

function DescricaoValoresMascara(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  Mascara: Integer): string;
var
  dominio: TArrayInteger;
  i: Integer;
begin
  Result := '';
  dominio := OperacaoFiscalIbsCbsCondicoes.ValoresDoDominio(Atributo);

  for i := 0 to High(dominio) do
    if (Mascara and MascaraDoCodigo(Atributo, dominio[i])) <> 0 then
    begin
      if Result <> '' then
        Result := Result + ', ';
      Result := Result + OperacaoFiscalIbsCbsCondicoes.DescricaoValor(Atributo, dominio[i]);
    end;

  if Result = '' then
    Result := 'nenhum';
end;

function DescricaoAtributoMascara(const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  Mascara, MascaraCompleta: Integer): string;
begin
  if Mascara = MascaraCompleta then
    Result := OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(Atributo) + ': qualquer'
  else
    Result := OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(Atributo) + ': ' +
      DescricaoValoresMascara(Atributo, Mascara);
end;

function DescricaoHipotese(const Hipotese: THipotese): string;
begin
  Result := '[' +
    DescricaoAtributoMascara(ocaTipoEmissao, Hipotese.MascaraTipoEmissao,
      MASCARA_DOMINIO_TIPO_EMISSAO) + '; ' +
    DescricaoAtributoMascara(ocaNaturezaEmissao, Hipotese.MascaraNatureza,
      MASCARA_DOMINIO_NATUREZA) + '; ' +
    DescricaoAtributoMascara(ocaTipoOrgaoPublico, Hipotese.MascaraOrgao,
      MASCARA_DOMINIO_ORGAO) + ']';
end;

{ Resposta efetiva }

function RespostasEquivalentes(const A, B: RegraFiscalIbsCbsEtd): Boolean;
begin
  Result := False;
  if (A = nil) or (B = nil) then
    Exit;

  // Mesmo Id e o atalho de identidade.
  if A.Id = B.Id then
  begin
    Result := True;
    Exit;
  end;

  // Fora o Id, todos os complementos que alteram o resultado participam da
  // equivalencia; igualdade isolada de cClassTrib nao e suficiente.
  Result :=
    (A.CClassTrib = B.CClassTrib) and
    A.TpOperGov.IsEqualTo(B.TpOperGov) and
    A.PDifCbs.IsEqualTo(B.PDifCbs) and
    A.PDifIbsUF.IsEqualTo(B.PDifIbsUF) and
    A.PDifIbsMun.IsEqualTo(B.PDifIbsMun) and
    A.RegraFiscalTribRegularId.IsEqualTo(B.RegraFiscalTribRegularId) and
    A.CClassTribRegular.IsEqualTo(B.CClassTribRegular);
end;

{ Cache de regras }

function ObterRegra(const Id: string;
  const RegrasRepo: IRegrasFiscaisIbsCbsRepository;
  Cache: TStringList): RegraFiscalIbsCbsEtd;
var
  indice: Integer;
begin
  indice := Cache.IndexOf(Id);
  if indice >= 0 then
  begin
    Result := RegraFiscalIbsCbsEtd(Cache.Objects[indice]);
    Exit;
  end;

  Result := RegrasRepo.GetById(Id);
  Cache.AddObject(Id, Result);
end;

procedure LiberarRegras(Cache: TStringList);
var
  i: Integer;
begin
  for i := 0 to Cache.Count - 1 do
    if Cache.Objects[i] <> nil then
      RegraFiscalIbsCbsEtd(Cache.Objects[i]).Free;
end;

procedure TransferirRegra(Cache: TStringList; const Regra: RegraFiscalIbsCbsEtd);
var
  indice: Integer;
begin
  if Regra = nil then
    Exit;

  for indice := 0 to Cache.Count - 1 do
    if Cache.Objects[indice] = Regra then
    begin
      Cache.Objects[indice] := nil;
      Exit;
    end;
end;

procedure PreencherMensagemPadrao(var Resolucao: TResolucao);
begin
  if Resolucao.Mensagem <> '' then
    Exit;

  case Resolucao.Status of
    rrDeterminado:
      Resolucao.Mensagem := 'Regra fiscal determinada.';
    rrInformacaoPendente:
      Resolucao.Mensagem := 'Informacao indispensavel pendente para concluir a determinacao.';
    rrConflito:
      Resolucao.Mensagem := 'Conflito entre hipoteses aplicaveis com respostas efetivas distintas.';
    rrConfiguracaoInvalida:
      Resolucao.Mensagem := 'Configuracao invalida no contexto informado.';
    rrNenhumaRegra:
      Resolucao.Mensagem := 'Nenhuma regra fiscal aplicavel para o contexto informado.';
  end;
end;

{ Avaliacao de candidatos }

function AvaliarCandidato(const Candidato: OperacaoFiscalIbsCbsEtd;
  const Fatos: TFatosCondicao): TAvaliacaoCandidato;
var
  erros: TArrayString;
  i: Integer;
  possuiPendencia, possuiFalso: Boolean;
  codigoFato: Integer;
begin
  Result.Candidato := Candidato;
  Result.Estado := eacNaoAplicavel;
  Result.Mensagem := '';
  MascarasDasCondicoes(Candidato.Condicoes, Result.Hipotese);

  if not OperacaoFiscalIbsCbsCondicoes.Validar(Candidato.Condicoes, erros) then
  begin
    Result.Estado := eacConfiguracaoInvalida;
    if Length(erros) > 0 then
      Result.Mensagem := erros[0]
    else
      Result.Mensagem := 'Condicoes invalidas.';
    Exit;
  end;

  possuiPendencia := False;
  possuiFalso := False;

  for i := 0 to High(Candidato.Condicoes) do
    case Candidato.Condicoes[i].Atributo of
      ocaTipoEmissao:
        if not Fatos.TipoEmissao.IsConhecido then
          possuiPendencia := True
        else if not OperacaoFiscalIbsCbsCondicoes.Contem(
          Candidato.Condicoes[i],
          OperacaoFiscalIbsCbsCondicoes.TipoEmissaoParaCodigo(
            Fatos.TipoEmissao.Valor)) then
          possuiFalso := True;
      ocaNaturezaEmissao:
        if not Fatos.NaturezaEmissao.IsConhecido then
          possuiPendencia := True
        else if not OperacaoFiscalIbsCbsCondicoes.Contem(
          Candidato.Condicoes[i],
          OperacaoFiscalIbsCbsCondicoes.NaturezaParaCodigo(
            Fatos.NaturezaEmissao.Valor)) then
          possuiFalso := True;
      ocaTipoOrgaoPublico:
        begin
          codigoFato := OperacaoFiscalIbsCbsCondicoes.TipoEnteGovParaCodigo(
            Fatos.TipoOrgaoPublico);
          if not OperacaoFiscalIbsCbsCondicoes.Contem(Candidato.Condicoes[i], codigoFato) then
            possuiFalso := True;
        end;
    end;

  // Uma condicao comprovadamente falsa descarta o vinculo mesmo que outro
  // atributo esteja desconhecido.
  if possuiFalso then
    Result.Estado := eacNaoAplicavel
  else if possuiPendencia then
    Result.Estado := eacPendente
  else
    Result.Estado := eacAplicavel;
end;

function AvaliarLista(const Candidatos: TList;
  const Fatos: TFatosCondicao): TAvaliacaoCandidatoArray;
var
  i: Integer;
begin
  SetLength(Result, Candidatos.Count);
  for i := 0 to Candidatos.Count - 1 do
    Result[i] := AvaliarCandidato(OperacaoFiscalIbsCbsEtd(Candidatos[i]), Fatos);
end;

function TemConfiguracaoInvalida(const Avaliacoes: TAvaliacaoCandidatoArray): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(Avaliacoes) do
    if Avaliacoes[i].Estado = eacConfiguracaoInvalida then
    begin
      Result := True;
      Exit;
    end;
end;

function MensagemConfiguracaoInvalida(
  const Avaliacoes: TAvaliacaoCandidatoArray): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to High(Avaliacoes) do
    if Avaliacoes[i].Estado = eacConfiguracaoInvalida then
    begin
      Result := Format('Configuracao invalida no vinculo %s: %s',
        [IdentificacaoVinculo(Avaliacoes[i].Candidato), Avaliacoes[i].Mensagem]);
      Exit;
    end;
end;

function TemAplicavel(const Avaliacoes: TAvaliacaoCandidatoArray): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(Avaliacoes) do
    if Avaliacoes[i].Estado = eacAplicavel then
    begin
      Result := True;
      Exit;
    end;
end;

function TemPendente(const Avaliacoes: TAvaliacaoCandidatoArray): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to High(Avaliacoes) do
    if Avaliacoes[i].Estado = eacPendente then
    begin
      Result := True;
      Exit;
    end;
end;

function AtributosDesconhecidos(
  const Fatos: TFatosCondicao): OperacaoFiscalIbsCbsCondicaoAtributoArray;
var
  n: Integer;
begin
  SetLength(Result, 0);

  if not Fatos.TipoEmissao.IsConhecido then
  begin
    n := Length(Result);
    SetLength(Result, n + 1);
    Result[n] := ocaTipoEmissao;
  end;

  if not Fatos.NaturezaEmissao.IsConhecido then
  begin
    n := Length(Result);
    SetLength(Result, n + 1);
    Result[n] := ocaNaturezaEmissao;
  end;
end;

function MensagemAtributosPendentes(
  const Atributos: OperacaoFiscalIbsCbsCondicaoAtributoArray): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to High(Atributos) do
  begin
    if Result <> '' then
      Result := Result + ', ';
    Result := Result + OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(Atributos[i]);
  end;

  Result := 'Informacao indispensavel pendente para concluir a determinacao: ' + Result + '.';
end;

{ Hipoteses minimas }

function AssinaturaHipoteses(const Avaliacoes: TAvaliacaoCandidatoArray;
  const Minimas: array of Integer): string;
var
  ordem: array of Integer;
  i, j, atual: Integer;
begin
  SetLength(ordem, Length(Minimas));
  for i := 0 to High(Minimas) do
    ordem[i] := i;

  // Ordenacao canonica para comparar o conjunto de hipoteses entre
  // preenchimentos diferentes dos fatos desconhecidos.
  for i := 1 to High(ordem) do
  begin
    atual := ordem[i];
    j := i - 1;
    while (j >= 0) and HipoteseMaiorQue(
      Avaliacoes[Minimas[ordem[j]]].Hipotese,
      Avaliacoes[Minimas[atual]].Hipotese) do
    begin
      ordem[j + 1] := ordem[j];
      Dec(j);
    end;
    ordem[j + 1] := atual;
  end;

  Result := '';
  for i := 0 to High(ordem) do
    Result := Result + Format('%d,%d,%d;', [
      Avaliacoes[Minimas[ordem[i]]].Hipotese.MascaraTipoEmissao,
      Avaliacoes[Minimas[ordem[i]]].Hipotese.MascaraNatureza,
      Avaliacoes[Minimas[ordem[i]]].Hipotese.MascaraOrgao]);
end;

function MensagemConflito(const Avaliacoes: TAvaliacaoCandidatoArray;
  const Minimas: array of Integer;
  const Regras: array of RegraFiscalIbsCbsEtd): string;
var
  ordem: array of Integer;
  i, j, atual: Integer;
begin
  SetLength(ordem, Length(Minimas));
  for i := 0 to High(Minimas) do
    ordem[i] := i;

  for i := 1 to High(ordem) do
  begin
    atual := ordem[i];
    j := i - 1;
    while (j >= 0) and HipoteseMaiorQue(
      Avaliacoes[Minimas[ordem[j]]].Hipotese,
      Avaliacoes[Minimas[atual]].Hipotese) do
    begin
      ordem[j + 1] := ordem[j];
      Dec(j);
    end;
    ordem[j + 1] := atual;
  end;

  Result := 'Conflito entre hipoteses com respostas efetivas distintas: ';
  for i := 0 to High(ordem) do
  begin
    if i > 0 then
      Result := Result + '; ';
    Result := Result + DescricaoHipotese(Avaliacoes[Minimas[ordem[i]]].Hipotese) +
      ' regra ' + Regras[ordem[i]].Id;
  end;
  Result := Result + '.';
end;

function ResolverAplicaveis(const Avaliacoes: TAvaliacaoCandidatoArray;
  const RegrasRepo: IRegrasFiscaisIbsCbsRepository;
  Cache: TStringList): TResolucao;
var
  minimas: array of Integer;
  regras: array of RegraFiscalIbsCbsEtd;
  i, j: Integer;
  dominada: Boolean;
  indiceRegra: Integer;
begin
  Result := ResolucaoVazia;
  Result.Status := rrNenhumaRegra;

  // Minimas: nenhuma outra hipotese aplicavel e estritamente mais restritiva.
  SetLength(minimas, 0);
  for i := 0 to High(Avaliacoes) do
  begin
    if Avaliacoes[i].Estado <> eacAplicavel then
      Continue;

    dominada := False;
    for j := 0 to High(Avaliacoes) do
      if (i <> j) and (Avaliacoes[j].Estado = eacAplicavel) and
        HipoteseEstritamenteMaisRestritiva(Avaliacoes[j].Hipotese, Avaliacoes[i].Hipotese) then
      begin
        dominada := True;
        Break;
      end;

    if not dominada then
    begin
      SetLength(minimas, Length(minimas) + 1);
      minimas[High(minimas)] := i;
    end;
  end;

  if Length(minimas) = 0 then
    Exit;

  // A regra e carregada somente para as hipoteses que podem prevalecer.
  SetLength(regras, Length(minimas));
  for i := 0 to High(minimas) do
  begin
    indiceRegra := minimas[i];
    regras[i] := ObterRegra(Avaliacoes[indiceRegra].Candidato.RegraFiscalId,
      RegrasRepo, Cache);
    if regras[i] = nil then
    begin
      Result.Status := rrConfiguracaoInvalida;
      Result.Mensagem := Format(
        'Configuracao invalida no vinculo %s: regra fiscal %s nao encontrada.',
        [IdentificacaoVinculo(Avaliacoes[indiceRegra].Candidato),
         Avaliacoes[indiceRegra].Candidato.RegraFiscalId]);
      Exit;
    end;
  end;

  for i := 1 to High(regras) do
    if not RespostasEquivalentes(regras[0], regras[i]) then
    begin
      Result.Status := rrConflito;
      Result.Regra := nil;
      Result.Redundante := False;
      Result.AssinaturaConflito := AssinaturaHipoteses(Avaliacoes, minimas);
      Result.Mensagem := MensagemConflito(Avaliacoes, minimas, regras);
      Exit;
    end;

  Result.Status := rrDeterminado;
  Result.Regra := regras[0];
  Result.Redundante := Length(minimas) > 1;
  Result.Mensagem := 'Regra fiscal determinada: ' + regras[0].Id + '.';
  if Result.Redundante then
    Result.Mensagem := Result.Mensagem +
      ' Hipoteses redundantes com a mesma resposta efetiva.';
end;

function AvaliarEscopo(const Candidatos: TList;
  const Fatos: TFatosCondicao;
  const RegrasRepo: IRegrasFiscaisIbsCbsRepository;
  Cache: TStringList): TResolucao;
var
  avaliacoes: TAvaliacaoCandidatoArray;
begin
  Result := ResolucaoVazia;
  avaliacoes := AvaliarLista(Candidatos, Fatos);

  if TemConfiguracaoInvalida(avaliacoes) then
  begin
    Result.Status := rrConfiguracaoInvalida;
    Result.Mensagem := MensagemConfiguracaoInvalida(avaliacoes);
    Exit;
  end;

  if TemAplicavel(avaliacoes) then
  begin
    Result := ResolverAplicaveis(avaliacoes, RegrasRepo, Cache);
    Exit;
  end;

  if TemPendente(avaliacoes) then
  begin
    Result.Status := rrInformacaoPendente;
    Result.AtributosPendentes := AtributosDesconhecidos(Fatos);
    Result.Mensagem := MensagemAtributosPendentes(Result.AtributosPendentes);
  end;
end;

function AvaliarContexto(const Fatos: TFatosCondicao;
  Especificos, Padrao: TList;
  const RegrasRepo: IRegrasFiscaisIbsCbsRepository;
  Cache: TStringList): TResolucao;
begin
  // O escopo especifico sempre tem precedencia; o padrao so e alcancado
  // quando o especifico nao possui candidato aplicavel.
  Result := AvaliarEscopo(Especificos, Fatos, RegrasRepo, Cache);
  if Result.Status = rrNenhumaRegra then
    Result := AvaliarEscopo(Padrao, Fatos, RegrasRepo, Cache);
end;

function MesmosAtributos(const A, B: OperacaoFiscalIbsCbsCondicaoAtributoArray): Boolean;
var
  i: Integer;
begin
  Result := Length(A) = Length(B);
  if not Result then
    Exit;

  for i := 0 to High(A) do
    if A[i] <> B[i] then
    begin
      Result := False;
      Exit;
    end;
end;

function MesmoResultado(const A, B: TResolucao): Boolean;
begin
  Result := A.Status = B.Status;
  if not Result then
    Exit;

  case A.Status of
    rrDeterminado:
      Result := RespostasEquivalentes(A.Regra, B.Regra);
    rrConflito:
      Result := A.AssinaturaConflito = B.AssinaturaConflito;
    rrInformacaoPendente:
      Result := MesmosAtributos(A.AtributosPendentes, B.AtributosPendentes);
    rrConfiguracaoInvalida, rrNenhumaRegra:
      Result := True;
  end;
end;

function CriarResultado(const Resolucao: TResolucao;
  Cache: TStringList): ResolverRegraFiscalIbsCbsResult;
var
  interna: TResolucao;
  regra: RegraFiscalIbsCbsEtd;
begin
  interna := Resolucao;
  PreencherMensagemPadrao(interna);

  regra := nil;
  if interna.Status = rrDeterminado then
  begin
    regra := interna.Regra;
    TransferirRegra(Cache, regra);
  end;

  Result := ResolverRegraFiscalIbsCbsResult.Create(interna.Status, regra,
    interna.Mensagem, interna.AtributosPendentes, interna.Redundante);
end;

function AtributoRelevanteNaEmissao(const Resultados: array of TResolucao;
  const IndicesEmissao, IndicesNatureza: array of Integer): Boolean;
var
  i, j: Integer;
begin
  Result := False;
  for i := 0 to High(Resultados) do
    for j := 0 to High(Resultados) do
      if (i <> j) and (IndicesNatureza[i] = IndicesNatureza[j]) and
        (IndicesEmissao[i] <> IndicesEmissao[j]) and
        not MesmoResultado(Resultados[i], Resultados[j]) then
      begin
        Result := True;
        Exit;
      end;
end;

function AtributoRelevanteNaNatureza(const Resultados: array of TResolucao;
  const IndicesEmissao, IndicesNatureza: array of Integer): Boolean;
var
  i, j: Integer;
begin
  Result := False;
  for i := 0 to High(Resultados) do
    for j := 0 to High(Resultados) do
      if (i <> j) and (IndicesEmissao[i] = IndicesEmissao[j]) and
        (IndicesNatureza[i] <> IndicesNatureza[j]) and
        not MesmoResultado(Resultados[i], Resultados[j]) then
      begin
        Result := True;
        Exit;
      end;
end;

procedure AdicionarAtributoPendente(
  var Atributos: OperacaoFiscalIbsCbsCondicaoAtributoArray;
  const Atributo: OperacaoFiscalIbsCbsCondicaoAtributo);
var
  n: Integer;
begin
  n := Length(Atributos);
  SetLength(Atributos, n + 1);
  Atributos[n] := Atributo;
end;

function ResolverComFatos(const Input: ResolverRegraFiscalIbsCbsInput;
  Especificos, Padrao: TList;
  const RegrasRepo: IRegrasFiscaisIbsCbsRepository;
  Cache: TStringList): ResolverRegraFiscalIbsCbsResult;
var
  emissoes: array of TipoEmissaoOcorrencia;
  naturezas: array of NaturezaEmissaoOcorrencia;
  resultados: array of TResolucao;
  indicesEmissao: array of Integer;
  indicesNatureza: array of Integer;
  fatos: TFatosCondicao;
  pendentes: OperacaoFiscalIbsCbsCondicaoAtributoArray;
  i, j: Integer;
  todosEquivalentes: Boolean;
  resolucaoInterna: TResolucao;
begin
  if Input.TipoEmissao.IsConhecido then
  begin
    SetLength(emissoes, 1);
    emissoes[0] := Input.TipoEmissao;
  end
  else
  begin
    SetLength(emissoes, 2);
    emissoes[0] := TipoEmissaoOcorrencia.Conhecido(tecPropria);
    emissoes[1] := TipoEmissaoOcorrencia.Conhecido(tecTerceiros);
  end;

  if Input.NaturezaEmissao.IsConhecido then
  begin
    SetLength(naturezas, 1);
    naturezas[0] := Input.NaturezaEmissao;
  end
  else
  begin
    SetLength(naturezas, 2);
    naturezas[0] := NaturezaEmissaoOcorrencia.Conhecido(necEntrada);
    naturezas[1] := NaturezaEmissaoOcorrencia.Conhecido(necSaida);
  end;

  SetLength(resultados, 0);
  SetLength(indicesEmissao, 0);
  SetLength(indicesNatureza, 0);

  for i := 0 to High(emissoes) do
    for j := 0 to High(naturezas) do
    begin
      fatos.TipoEmissao := emissoes[i];
      fatos.NaturezaEmissao := naturezas[j];
      fatos.TipoOrgaoPublico := Input.TipoOrgaoPublico;

      SetLength(resultados, Length(resultados) + 1);
      resultados[High(resultados)] := AvaliarContexto(fatos, Especificos, Padrao,
        RegrasRepo, Cache);

      SetLength(indicesEmissao, Length(indicesEmissao) + 1);
      indicesEmissao[High(indicesEmissao)] := i;
      SetLength(indicesNatureza, Length(indicesNatureza) + 1);
      indicesNatureza[High(indicesNatureza)] := j;
    end;

  if Length(resultados) = 1 then
  begin
    Result := CriarResultado(resultados[0], Cache);
    Exit;
  end;

  // Uma configuracao invalida alcancada em qualquer preenchimento e relevante:
  // nao se coleta informacao para mascarar um defeito de configuracao.
  for i := 0 to High(resultados) do
    if resultados[i].Status = rrConfiguracaoInvalida then
    begin
      Result := CriarResultado(resultados[i], Cache);
      Exit;
    end;

  todosEquivalentes := True;
  for i := 1 to High(resultados) do
    if not MesmoResultado(resultados[0], resultados[i]) then
    begin
      todosEquivalentes := False;
      Break;
    end;

  if todosEquivalentes then
  begin
    resolucaoInterna := resultados[0];

    // A pendencia e irrelevante quando todos os preenchimentos levam a mesma
    // resposta efetiva; a redundancia e sinalizada quando escolhem instancias
    // equivalentes distintas.
    for i := 1 to High(resultados) do
    begin
      resolucaoInterna.Redundante := resolucaoInterna.Redundante or
        resultados[i].Redundante;

      if (resolucaoInterna.Status = rrDeterminado) and
        (resolucaoInterna.Regra <> nil) and (resultados[i].Regra <> nil) and
        (resolucaoInterna.Regra.Id <> resultados[i].Regra.Id) then
        resolucaoInterna.Redundante := True;
    end;

    Result := CriarResultado(resolucaoInterna, Cache);
    Exit;
  end;

  SetLength(pendentes, 0);

  if Length(emissoes) > 1 then
    if AtributoRelevanteNaEmissao(resultados, indicesEmissao, indicesNatureza) then
      AdicionarAtributoPendente(pendentes, ocaTipoEmissao);

  if Length(naturezas) > 1 then
    if AtributoRelevanteNaNatureza(resultados, indicesEmissao, indicesNatureza) then
      AdicionarAtributoPendente(pendentes, ocaNaturezaEmissao);

  if Length(pendentes) = 0 then
  begin
    if Length(emissoes) > 1 then
      AdicionarAtributoPendente(pendentes, ocaTipoEmissao);
    if Length(naturezas) > 1 then
      AdicionarAtributoPendente(pendentes, ocaNaturezaEmissao);
  end;

  resolucaoInterna := ResolucaoVazia;
  resolucaoInterna.Status := rrInformacaoPendente;
  resolucaoInterna.AtributosPendentes := pendentes;
  resolucaoInterna.Mensagem := MensagemAtributosPendentes(pendentes);
  Result := CriarResultado(resolucaoInterna, Cache);
end;

procedure SepararCandidatos(Candidatos: OperacaoFiscalIbsCbsEtdList;
  Especificos, Padrao: TList);
var
  i: Integer;
  candidato: OperacaoFiscalIbsCbsEtd;
begin
  if not Assigned(Candidatos) then
    Exit;

  for i := 0 to Candidatos.Count - 1 do
  begin
    candidato := OperacaoFiscalIbsCbsEtd(Candidatos[i]);

    // O escopo e derivado do dado, nunca da ordem devolvida.
    if candidato.GrupoFiscalId.IsNull or
      (Trim(candidato.GrupoFiscalId.ToText('')) = '') then
      Padrao.Add(candidato)
    else
      Especificos.Add(candidato);
  end;
end;

procedure AnalisarEscopo(const Candidatos: TList;
  const ARascunho: OperacaoFiscalIbsCbsEtd;
  Analise: ResolverRegraFiscalIbsCbsAnalise;
  const RegrasRepo: IRegrasFiscaisIbsCbsRepository;
  Cache: TStringList);
var
  validos: TCandidatoAnaliseArray;
  erros: TArrayString;
  i, j, k: Integer;
  candidato: OperacaoFiscalIbsCbsEtd;
  regra: RegraFiscalIbsCbsEtd;
begin
  SetLength(validos, 0);

  for i := 0 to Candidatos.Count - 1 do
  begin
    candidato := OperacaoFiscalIbsCbsEtd(Candidatos[i]);

    if not OperacaoFiscalIbsCbsCondicoes.Validar(candidato.Condicoes, erros) then
    begin
      // Um unico apontamento por configuracao invalida; os erros de validacao
      // permanecem internos e nao sao despejados ao usuario.
      if DescricaoCondicaoInvalida(candidato.Condicoes) = 'de aplicabilidade' then
        Analise.AdicionarApontamento(ratValorInvalido, Format(
          'A configuração "%s" contém uma condição com um valor que o sistema ' +
          'não reconhece. Abra esse cadastro e selecione uma das opções disponíveis.',
          [IdentificacaoVinculo(candidato)]))
      else
        Analise.AdicionarApontamento(ratValorInvalido, Format(
          'A condição "%s" da configuração "%s" contém um valor que o sistema ' +
          'não reconhece. Abra esse cadastro e selecione uma das opções disponíveis.',
          [DescricaoCondicaoInvalida(candidato.Condicoes),
           IdentificacaoVinculo(candidato)]));
      Continue;
    end;

    for k := 0 to High(candidato.Condicoes) do
      if OperacaoFiscalIbsCbsCondicoes.EhUniversal(candidato.Condicoes[k]) then
        if candidato = ARascunho then
          Analise.AdicionarApontamento(ratObservacaoOpcoes, Format(
            '%s permite %s.',
            [OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(
               candidato.Condicoes[k].Atributo),
             DescricaoAbrangenciaFrase(candidato.Condicoes[k].Atributo)]))
        else
          Analise.AdicionarApontamento(ratObservacaoOpcoes, Format(
            'A configuração "%s" aceita todas as opções de %s (%s).',
            [IdentificacaoVinculo(candidato),
             OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(
               candidato.Condicoes[k].Atributo),
             DescricaoAbrangencia(candidato.Condicoes[k].Atributo)]));

    regra := ObterRegra(candidato.RegraFiscalId, RegrasRepo, Cache);
    if regra = nil then
    begin
      Analise.AdicionarApontamento(ratRegraAusente, Format(
        'A configuração "%s" está associada a uma Regra Fiscal que não foi ' +
        'encontrada. Abra esse cadastro e selecione a regra correspondente.',
        [IdentificacaoVinculo(candidato)]));
      Continue;
    end;

    SetLength(validos, Length(validos) + 1);
    validos[High(validos)].Candidato := candidato;
    validos[High(validos)].Regra := regra;
    MascarasDasCondicoes(candidato.Condicoes, validos[High(validos)].Hipotese);
  end;

  for i := 0 to High(validos) do
    for j := i + 1 to High(validos) do
    begin
      if not HipoteseIntersecaoNaoVazia(validos[i].Hipotese, validos[j].Hipotese) then
        Continue;

      if RespostasEquivalentes(validos[i].Regra, validos[j].Regra) then
        Analise.AdicionarApontamento(ratDuplicidade, Format(
          'As configurações "%s" e "%s" podem atender à mesma operação e ' +
          'produzir o mesmo resultado tributário. Confira se ambas são necessárias.',
          [IdentificacaoVinculo(validos[i].Candidato),
           IdentificacaoVinculo(validos[j].Candidato)]))
      else if (not HipoteseContida(validos[i].Hipotese, validos[j].Hipotese)) and
        (not HipoteseContida(validos[j].Hipotese, validos[i].Hipotese)) then
        Analise.AdicionarApontamento(ratConflito, Format(
          'As configurações "%s" e "%s" podem atender à mesma operação, mas ' +
          'indicar resultados tributários diferentes. As regras de preferência ' +
          'podem não resolver essa combinação. Revise as condições e as regras ' +
          'fiscais envolvidas para definir o tratamento desejado.',
          [IdentificacaoVinculo(validos[i].Candidato),
           IdentificacaoVinculo(validos[j].Candidato)]));
    end;
end;

{ ResolverRegraFiscalIbsCbsService }

constructor ResolverRegraFiscalIbsCbsService.Create(
  OperacoesFiscaisIbsCbsRepo: IOperacoesFiscaisIbsCbsRepository;
  RegrasFiscaisIbsCbsRepo: IRegrasFiscaisIbsCbsRepository
);
begin
  FOperacoesFiscaisIbsCbsRepo := OperacoesFiscaisIbsCbsRepo;
  FRegrasFiscaisIbsCbsRepo := RegrasFiscaisIbsCbsRepo;
end;

function ResolverRegraFiscalIbsCbsService.Executar(
  const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsResult;
var
  candidatos: OperacaoFiscalIbsCbsEtdList;
  especificos, padrao: TList;
  cache: TStringList;
begin
  // Contrato de entrada: CreateParaAnalise produz apenas placeholders de fato
  // para a analise de configuracao. Consumi-la como determinacao trataria um
  // "desconhecido" de analise como fato real; a marcacao e rejeitada aqui,
  // antes de qualquer consulta ao repositorio.
  if Input.SomenteAnalise then
    raise Exception.Create(
      'ResolverRegraFiscalIbsCbsService.Executar: a entrada foi criada por ' +
      'CreateParaAnalise e e restrita a Analisar. A determinacao exige a ' +
      'entrada criada por ResolverRegraFiscalIbsCbsInput.Create com os tres ' +
      'fatos da ocorrencia.');

  candidatos := nil;
  especificos := TList.Create;
  padrao := TList.Create;
  cache := TStringList.Create;
  cache.CaseSensitive := True;

  try
    candidatos := FOperacoesFiscaisIbsCbsRepo.GetByOpInternaGrupoFiscal(
      Input.OperacaoInternaId,
      Input.GrupoFiscalId,
      Input.EmpresaId,
      Input.Data);

    SepararCandidatos(candidatos, especificos, padrao);
    Result := ResolverComFatos(Input, especificos, padrao,
      FRegrasFiscaisIbsCbsRepo, cache);

  finally
    LiberarRegras(cache);
    cache.Free;
    padrao.Free;
    especificos.Free;
    if Assigned(candidatos) then
      candidatos.Free;
  end;
end;

function ResolverRegraFiscalIbsCbsService.Analisar(
  const Input: ResolverRegraFiscalIbsCbsInput): ResolverRegraFiscalIbsCbsAnalise;
var
  candidatos: OperacaoFiscalIbsCbsEtdList;
  especificos, padrao: TList;
  cache: TStringList;
  analise: ResolverRegraFiscalIbsCbsAnalise;
  rascunho: OperacaoFiscalIbsCbsEtd;
  idRascunho: string;
  i: Integer;
begin
  candidatos := nil;
  especificos := TList.Create;
  padrao := TList.Create;
  cache := TStringList.Create;
  cache.CaseSensitive := True;

  try
    candidatos := FOperacoesFiscaisIbsCbsRepo.GetByOpInternaGrupoFiscal(
      Input.OperacaoInternaId,
      Input.GrupoFiscalId,
      Input.EmpresaId,
      Input.Data);

    // A analise reflete o estado corrente da tela: o rascunho substitui o
    // vinculo persistido de mesmo Id, sem que a lista passe a possuir o objeto.
    rascunho := Input.CandidatoRascunho;
    if Assigned(rascunho) then
    begin
      idRascunho := Trim(rascunho.Id);
      if (idRascunho <> '') and Assigned(candidatos) then
        for i := candidatos.Count - 1 downto 0 do
          if Trim(OperacaoFiscalIbsCbsEtd(candidatos[i]).Id) = idRascunho then
            // A lista possui seus itens; Delete libera o persistido substituido.
            candidatos.Delete(i);
    end;

    SepararCandidatos(candidatos, especificos, padrao);

    if Assigned(rascunho) then
    begin
      // O rascunho pertence ao chamador; as listas de escopo nao possuem itens.
      if rascunho.GrupoFiscalId.IsNull or
        (Trim(rascunho.GrupoFiscalId.ToText('')) = '') then
        padrao.Add(rascunho)
      else
        especificos.Add(rascunho);
    end;

    analise := ResolverRegraFiscalIbsCbsAnalise.Create;
    try
      AnalisarEscopo(especificos, Input.CandidatoRascunho, analise,
        FRegrasFiscaisIbsCbsRepo, cache);
      AnalisarEscopo(padrao, Input.CandidatoRascunho, analise,
        FRegrasFiscaisIbsCbsRepo, cache);
    except
      analise.Free;
      raise;
    end;

    Result := analise;

  finally
    LiberarRegras(cache);
    cache.Free;
    padrao.Free;
    especificos.Free;
    if Assigned(candidatos) then
      candidatos.Free;
  end;
end;

end.
