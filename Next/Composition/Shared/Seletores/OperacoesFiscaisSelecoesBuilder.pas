unit OperacoesFiscaisSelecoesBuilder;

interface

uses
  SelecaoEntidadeOption, RegraFiscalSelecaoOption,
  ListarOperacoesInternasUseCaseUnit, ListarGruposFiscaisUseCaseUnit,
  ListarRegrasFiscaisUseCaseUnit;

// Cria os carregadores dos seletores do cadastro de Operacoes Fiscais IBS/CBS.
// As dependencias sao capturadas uma unica vez e cada carga consulta o registro
// atual, para que um vinculo fora da lista vigente continue selecionavel. As
// listas de entidades pertencem ao carregador e sao liberadas ao final de cada
// carga; nenhuma entidade chega a tela. A falha devolve False sem opcoes
// parciais e a preparacao da aba e interrompida.
function CriarCarregadorOperacoesInternas(
  AListar: ListarOperacoesInternasUseCase): TCarregarSelecaoEntidade;
function CriarCarregadorGruposFiscais(
  AListar: IListarAtualeTodosGruposFiscaisUseCase): TCarregarSelecaoEntidade;
function CriarCarregadorRegrasFiscais(
  AListar: ListarRegrasFiscaisUseCase): TCarregarRegraFiscalSelecao;

implementation

uses
  System.SysUtils, System.MaskUtils, OperacaoInternaEtdUnit, GrupoFiscalEtdUnit,
  RegraFiscalIbsCbsEtdUnit, DateAndTimeNullableUnit;

const
  // Identificacao textual da regra fiscal, como no cadastro legado.
  ClassTribMask = '000-000;0;';
  RegraFiscalTextFormat = '%s : %s';

// Identifica a regra fiscal pela classificacao e pela descricao. A
// classificacao chega do cadastro e pode nao caber na mascara; nesse caso o
// texto gravado e usado, porque o titulo da opcao nao pode interromper a carga
// das demais regras.
function TextoRegraFiscal(const ARegra: RegraFiscalIbsCbsEtd): string;
var
  ClassTrib: string;
begin
  try
    ClassTrib := FormatMaskText(ClassTribMask, ARegra.CClassTrib);
  except
    ClassTrib := ARegra.CClassTrib;
  end;

  Result := Format(RegraFiscalTextFormat, [ClassTrib, ARegra.Descricao]);
end;

// Converte as operacoes internas recebidas em opcoes do seletor. O caso de uso
// ja devolve o registro corrente junto dos ativos, por isso AIdAtual e apenas
// repassado e nao existe opcao provisoria.
function MontarOpcoesOperacoesInternas(
  AListar: ListarOperacoesInternasUseCase; const AIdAtual: string;
  out AOpcoes: TSelecaoEntidadeOptions): Boolean;
var
  Lista: OperacoesInternasEtd;
  I: Integer;
  Operacao: OperacaoInternaEtd;
begin
  Result := False;
  SetLength(AOpcoes, 0);

  if AListar = nil then
    Exit;

  Lista := nil;
  try
    try
      Lista := AListar.Executar(AIdAtual);

      if Lista = nil then
        Exit;

      SetLength(AOpcoes, Lista.Count);
      for I := 0 to Lista.Count - 1 do
      begin
        Operacao := OperacaoInternaEtd(Lista.Items[I]);
        AOpcoes[I].Id := Operacao.Id;
        AOpcoes[I].Texto := Operacao.Descricao;
      end;

      Result := True;
    except
      SetLength(AOpcoes, 0);
    end;
  finally
    Lista.Free;
  end;
end;

// Converte os grupos fiscais recebidos em opcoes do seletor, com o mesmo
// criterio de AIdAtual das operacoes internas. A opcao vazia do campo anulavel
// pertence ao seletor e nao e criada aqui.
function MontarOpcoesGruposFiscais(
  AListar: IListarAtualeTodosGruposFiscaisUseCase; const AIdAtual: string;
  out AOpcoes: TSelecaoEntidadeOptions): Boolean;
var
  Lista: GruposFiscaisEtd;
  I: Integer;
  Grupo: GrupoFiscalEtd;
begin
  Result := False;
  SetLength(AOpcoes, 0);

  if AListar = nil then
    Exit;

  Lista := nil;
  try
    try
      Lista := AListar.Executar(AIdAtual);

      if Lista = nil then
        Exit;

      SetLength(AOpcoes, Lista.Count);
      for I := 0 to Lista.Count - 1 do
      begin
        Grupo := GrupoFiscalEtd(Lista.Items[I]);
        AOpcoes[I].Id := Grupo.Id;
        AOpcoes[I].Texto := Grupo.Descricao;
      end;

      Result := True;
    except
      SetLength(AOpcoes, 0);
    end;
  finally
    Lista.Free;
  end;
end;

// Converte as regras fiscais recebidas em opcoes do seletor. A classificacao
// formatada identifica a regra e a vigencia acompanha a opcao para o rotulo do
// seletor; sem fim de vigencia a data permanece zero e nao e apresentada.
function MontarOpcoesRegrasFiscais(AListar: ListarRegrasFiscaisUseCase;
  const AIdAtual: string; out AOpcoes: TRegraFiscalSelecaoOptions): Boolean;
var
  Lista: RegrasFiscaisIbsCbsEtd;
  I: Integer;
  Regra: RegraFiscalIbsCbsEtd;
  Opcao: TRegraFiscalSelecaoOption;
begin
  Result := False;
  SetLength(AOpcoes, 0);

  if AListar = nil then
    Exit;

  Lista := nil;
  try
    try
      Lista := AListar.Executar(AIdAtual);

      if Lista = nil then
        Exit;

      SetLength(AOpcoes, Lista.Count);
      for I := 0 to Lista.Count - 1 do
      begin
        Regra := RegraFiscalIbsCbsEtd(Lista.Items[I]);
        Opcao.Id := Regra.Id;
        Opcao.Texto := TextoRegraFiscal(Regra);
        Opcao.TemFimVigencia := not Regra.FimVigencia.IsNull;
        Opcao.InicioVigencia := Regra.InicioVigencia;
        if Opcao.TemFimVigencia then
          Opcao.FimVigencia := Regra.FimVigencia.Value
        else
          Opcao.FimVigencia := 0;

        AOpcoes[I] := Opcao;
      end;

      Result := True;
    except
      SetLength(AOpcoes, 0);
    end;
  finally
    Lista.Free;
  end;
end;

function CriarCarregadorOperacoesInternas(
  AListar: ListarOperacoesInternasUseCase): TCarregarSelecaoEntidade;
begin
  Result :=
    function(const AIdAtual: string;
      out AOpcoes: TSelecaoEntidadeOptions): Boolean
    begin
      Result := MontarOpcoesOperacoesInternas(AListar, AIdAtual, AOpcoes);
    end;
end;

function CriarCarregadorGruposFiscais(
  AListar: IListarAtualeTodosGruposFiscaisUseCase): TCarregarSelecaoEntidade;
begin
  Result :=
    function(const AIdAtual: string;
      out AOpcoes: TSelecaoEntidadeOptions): Boolean
    begin
      Result := MontarOpcoesGruposFiscais(AListar, AIdAtual, AOpcoes);
    end;
end;

function CriarCarregadorRegrasFiscais(
  AListar: ListarRegrasFiscaisUseCase): TCarregarRegraFiscalSelecao;
begin
  Result :=
    function(const AIdAtual: string;
      out AOpcoes: TRegraFiscalSelecaoOptions): Boolean
    begin
      Result := MontarOpcoesRegrasFiscais(AListar, AIdAtual, AOpcoes);
    end;
end;

end.
