unit Teste_ArquiteturaArredondamento;

interface

uses
  DUnitX.TestFramework;

type
  TPermissaoSitio = record
    Arquivo: string;
    Trecho: string;
    Dono: string;
  end;

  [TestFixture]
  TTest_ArquiteturaArredondamento = class
  public
    [Test] procedure teste_SitiosMigradosNaoUsamPoliticaAntigaNemDoubleNoMiolo;
  end;

implementation

uses
  SysUtils,
  Classes,
  System.IOUtils;

const
  ARQ_BASE = 'CalculoBaseCalculoServiceUnit.pas';
  ARQ_IMPOSTO_SELETIVO = 'CalculoImpostoSeletivoServiceUnit.pas';
  ARQ_CBS_IBS = 'CalculoCbsIbsServiceUnit.pas';
  ARQ_COMPRA_GOV = 'TributacaoCompraGovernamentalModelUnit.pas';
  ARQ_DECIMAL = 'DecimalCalculoUnit.pas';
  ARQ_ARREDONDAMENTO = 'ArredondamentoCalculoUnit.pas';
  ARQ_AVALIADOR = 'AvaliadorExpressaoAritmeticaServiceUnit.pas';
  ARQ_CBS_MODEL = 'CBSModelUnit.pas';
  ARQ_IBSUF_MODEL = 'IBSUFModelUnit.pas';
  ARQ_IBSMUN_MODEL = 'IBSMunModelUnit.pas';
  ARQ_GRUPO_IBSCBS = 'GrupoIBSCBSModelUnit.pas';
  ARQ_RESULTADO_CBS_IBS = 'ResultadoCbsIbsUnit.pas';

// Sitios ainda nao migrados e seus donos: I03 (CBS/IBS), I09 (diferimento/
// monofasia), I10 (compra governamental) e I15 (servico de IS). Os residuos dos
// arquivos abaixo ficam explicitos nesta allowlist; qualquer ocorrencia nova
// fora dela reprova o teste.
function Permissao(const AArquivo, ATrecho, ADono: string): TPermissaoSitio;
begin
  Result.Arquivo := AArquivo;
  Result.Trecho := ATrecho;
  Result.Dono := ADono;
end;

function Ocorrencias(const ATexto, ATrecho: string): Integer;
var
  Restante: string;
  P: Integer;
begin
  Result := 0;
  Restante := ATexto;
  P := Pos(ATrecho, Restante);
  while P > 0 do
  begin
    Inc(Result);
    Restante := Copy(Restante, P + Length(ATrecho), MaxInt);
    P := Pos(ATrecho, Restante);
  end;
end;

function RaizFiscalCalculos: string;
var
  Dir: string;
  I: Integer;
begin
  Result := '';
  Dir := ExtractFilePath(ParamStr(0));
  for I := 1 to 8 do
  begin
    Dir := TPath.GetFullPath(TPath.Combine(Dir, '..'));
    if TDirectory.Exists(TPath.Combine(Dir, 'Fiscal.Calculos\Core\Domain')) then
    begin
      Result := TPath.Combine(Dir, 'Fiscal.Calculos\Core\Domain');
      Exit;
    end;
  end;
end;

function LocalizarArquivo(const ARaiz, ANome: string): string;
var
  Arquivo: string;
begin
  Result := '';
  for Arquivo in TDirectory.GetFiles(ARaiz, ANome, TSearchOption.soAllDirectories) do
  begin
    Result := Arquivo;
    Break;
  end;
end;

function TextoSemComentarios(const ATexto: string): string;
var
  I, N, J: Integer;
  C: Char;
  EmTexto, EmChave, EmParentese: Boolean;
begin
  N := Length(ATexto);
  SetLength(Result, N);
  J := 0;
  I := 1;
  EmTexto := False;
  EmChave := False;
  EmParentese := False;
  while I <= N do
  begin
    C := ATexto[I];
    if EmChave then
    begin
      if C = '}' then
        EmChave := False;
      Inc(I);
    end
    else if EmParentese then
    begin
      if (C = '*') and (I < N) and (ATexto[I + 1] = ')') then
      begin
        EmParentese := False;
        Inc(I, 2);
      end
      else
        Inc(I);
    end
    else if EmTexto then
    begin
      Inc(J);
      Result[J] := C;
      if C = '''' then
      begin
        if (I < N) and (ATexto[I + 1] = '''') then
        begin
          Inc(J);
          Result[J] := ATexto[I + 1];
          Inc(I, 2);
        end
        else
        begin
          EmTexto := False;
          Inc(I);
        end;
      end
      else
        Inc(I);
    end
    else if C = '''' then
    begin
      EmTexto := True;
      Inc(J);
      Result[J] := C;
      Inc(I);
    end
    else if (C = '/') and (I < N) and (ATexto[I + 1] = '/') then
    begin
      while (I <= N) and not (ATexto[I] in [#10, #13]) do
        Inc(I);
    end
    else if C = '{' then
    begin
      EmChave := True;
      Inc(I);
    end
    else if (C = '(') and (I < N) and (ATexto[I + 1] = '*') then
    begin
      EmParentese := True;
      Inc(I, 2);
    end
    else
    begin
      Inc(J);
      Result[J] := C;
      Inc(I);
    end;
  end;
  SetLength(Result, J);
end;

procedure VerificarRegra(const ARaiz, AArquivo: string;
  const ATokens: array of string; const APermissoes: array of TPermissaoSitio;
  AFalhas: TStringList);
var
  Caminho, Texto, Token: string;
  I, J, Total, Permitidas: Integer;
begin
  Caminho := LocalizarArquivo(ARaiz, AArquivo);
  if Caminho = '' then
  begin
    AFalhas.Add(Format('%s: arquivo ausente em %s', [AArquivo, ARaiz]));
    Exit;
  end;
  Texto := TextoSemComentarios(TFile.ReadAllText(Caminho));
  for I := 0 to High(ATokens) do
  begin
    Token := ATokens[I];
    Total := Ocorrencias(Texto, Token);
    Permitidas := 0;
    for J := 0 to High(APermissoes) do
      if SameText(APermissoes[J].Arquivo, AArquivo) and
        (Pos(Token, APermissoes[J].Trecho) > 0) then
        Inc(Permitidas, Ocorrencias(Texto, APermissoes[J].Trecho));
    if Total <> Permitidas then
      AFalhas.Add(Format(
        '%s: %s encontrado %d vez(es); allowlist cobre %d',
        [AArquivo, Token, Total, Permitidas]));
  end;
  for J := 0 to High(APermissoes) do
    if SameText(APermissoes[J].Arquivo, AArquivo) and
      (Ocorrencias(Texto, APermissoes[J].Trecho) = 0) then
      AFalhas.Add(Format('%s: allowlist obsoleta (%s, dono %s)',
        [AArquivo, APermissoes[J].Trecho, APermissoes[J].Dono]));
end;

{ TTest_ArquiteturaArredondamento }

procedure TTest_ArquiteturaArredondamento.teste_SitiosMigradosNaoUsamPoliticaAntigaNemDoubleNoMiolo;
var
  Raiz: string;
  Falhas: TStringList;
begin
  Raiz := RaizFiscalCalculos;
  Assert.IsTrue(Raiz <> '', 'Fiscal.Calculos/Core/Domain nao encontrado a partir do executavel');

  Falhas := TStringList.Create;
  try
    // CalculoBaseCalculoServiceUnit: a base migrada nao pode voltar a Double.
    VerificarRegra(Raiz, ARQ_BASE,
      ['Double', 'ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4'],
      [], Falhas);

    // CalculoImpostoSeletivoServiceUnit: aliquota convertida por Currency no I01.
    VerificarRegra(Raiz, ARQ_IMPOSTO_SELETIVO,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4', 'DeDouble', 'ParaDouble'],
      [Permissao(ARQ_IMPOSTO_SELETIVO,
        'percentualAdValorem.ParaDouble', 'I15')],
      Falhas);

    VerificarRegra(Raiz, ARQ_CBS_IBS,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4', 'DeDouble', 'ParaDouble',
       'marHalfUp'],
      [Permissao(ARQ_CBS_IBS,
        'NumberService.RoundHalfUpTo4( NumberService.MovePointRightCurr(PercentualDiferimento.Value, 2))', 'I09'),
       Permissao(ARQ_CBS_IBS,
        'NumberService.RoundHalfUpTo2(ValorDiferimento.Value)', 'I09'),
       Permissao(ARQ_CBS_IBS,
        'NumberService.RoundHalfUpTo2(ValorImpostoSeletivoCalculado)', 'I09'),
       Permissao(ARQ_CBS_IBS, 'Result := fator.ParaDouble;', 'I09'),
       Permissao(ARQ_CBS_IBS, 'Result := aliquotaDecimal.ParaDouble;',
        'fronteira de tipo (setter legado Double)'),
       Permissao(ARQ_CBS_IBS,
        'valorPercentualReducao.SetValue( fatorPercentual.ParaDouble )', 'I03'),
       Permissao(ARQ_CBS_IBS, 'pBio.SetValue( fatorPercentual.ParaDouble )', 'I09'),
       Permissao(ARQ_CBS_IBS, 'pDif.SetValue( fatorPercentual.ParaDouble )', 'I09'),
       Permissao(ARQ_CBS_IBS,
        'resultadoPercentualDiferimento.SetValue( resultadoPercentualDiferimentoDecimal.ParaDouble)', 'I09'),
       Permissao(ARQ_CBS_IBS,
        'resultadoValorDiferimento.SetValue( resultadoValorDiferimentoDecimal.ParaDouble)', 'I09')],
      Falhas);

    VerificarRegra(Raiz, ARQ_COMPRA_GOV,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4', 'DeDouble', 'ParaDouble'],
      [Permissao(ARQ_COMPRA_GOV,
        'NumberService.RoundHalfUpTo4(FPAliqIBSUF)', 'I10'),
       Permissao(ARQ_COMPRA_GOV,
        'NumberService.RoundHalfUpTo2(FVTribIBSUF)', 'I10'),
       Permissao(ARQ_COMPRA_GOV,
        'NumberService.RoundHalfUpTo4(FPAliqIBSMun)', 'I10'),
       Permissao(ARQ_COMPRA_GOV,
        'NumberService.RoundHalfUpTo2(FVTribIBSMun)', 'I10'),
       Permissao(ARQ_COMPRA_GOV,
        'NumberService.RoundHalfUpTo4(FPAliqCBS)', 'I10'),
       Permissao(ARQ_COMPRA_GOV,
        'NumberService.RoundHalfUpTo2(FVTribCBS)', 'I10'),
       Permissao(ARQ_COMPRA_GOV,
        'fracaoTransferencia.ParaDouble', 'I10')],
      Falhas);

    VerificarRegra(Raiz, ARQ_DECIMAL,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4'], [], Falhas);
    VerificarRegra(Raiz, ARQ_ARREDONDAMENTO,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4'], [], Falhas);

    // Avaliador: sem arredondamento interno; os residuos de Double pertencem a D2.
    VerificarRegra(Raiz, ARQ_AVALIADOR,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4'], [], Falhas);

    // VOs de CBS/IBS migrados no I03: publicacao por ValorFiscal/AliquotaPublicada.
    VerificarRegra(Raiz, ARQ_CBS_MODEL,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4'], [], Falhas);
    VerificarRegra(Raiz, ARQ_IBSUF_MODEL,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4'], [], Falhas);
    VerificarRegra(Raiz, ARQ_IBSMUN_MODEL,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4'], [], Falhas);
    VerificarRegra(Raiz, ARQ_GRUPO_IBSCBS,
      ['ArredondarInterno', 'RoundHalfUpTo2', 'RoundHalfUpTo4'], [], Falhas);

    // ResultadoCbsIbs publica somente Currency/CurrencyNullable (DEC-05).
    VerificarRegra(Raiz, ARQ_RESULTADO_CBS_IBS, ['Double'], [], Falhas);

    Assert.IsTrue(Falhas.Count = 0,
      'Arredondamento fora dos pontos aprovados. Use os helpers de ' +
      'ArredondamentoCalculo/DecimalCalculo e mantenha a allowlist com o dono ' +
      'de cada sitio pendente.' + sLineBreak + Falhas.Text);
  finally
    Falhas.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTest_ArquiteturaArredondamento);

end.
