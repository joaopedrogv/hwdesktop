unit ProcessosProviderUnit;

interface

uses
  IProcessosProviderUnit,
  ProcessoAtualizacaoModelUnit;

type
  TProcessosProvider = class(TInterfacedObject, IProcessosProvider)
  private
    // Controla a versao durante a construcao do array de retorno
    FVersaoMaisRecente: Integer;
    // Marca a versao atual
    FVersaoAtual: Integer;
    // Contém os processos durante a constucao
    FLoteProcessos: ProcessoModelArray;
    procedure ConstruirProcessos();
    procedure AdicionarLote(const ALoteProcessos: ProcessoModelArray);
    function VersaoAtualMenor(ANovaVersao: Integer): Boolean;
  public
    function ObterPendentes(AVersaoAtual: Integer): AtualizacaoProcessosModel;
  end;

implementation

uses
  SysUtils;

// Retorna o porcesso validado
function Add(
  const ACodigo, ADescricao: string; ANivel: Integer; AExigeGerente: Boolean = False; AGravaAuditoria: Boolean = True
): ProcessoModel;
begin
  Result.Codigo := Trim(ACodigo);
  Result.Descricao := Trim(ADescricao);

  if Result.Codigo = '' then
    raise Exception.Create('Processo sem código na atualização de processos Next.');

  if Length(Result.Codigo) > 10 then
    raise Exception.Create(
      Format('O código do processo %s deve ter até 10 caracteres.', [Result.Codigo]));

  if Result.Descricao = '' then
    raise Exception.Create(
      Format('O processo %s está sem descrição.', [Result.Codigo]));

  if Length(Result.Descricao) > 50 then
    raise Exception.Create(
      Format('A descrição do processo %s deve ter até 50 caracteres.', [Result.Codigo]));

  if ANivel < 0 then
    raise Exception.Create(
      Format('O nível do processo %s não pode ser negativo.', [Result.Codigo]));

  Result.Nivel := ANivel;
  Result.ExigeGerente := AExigeGerente;
  Result.GravaAuditoria := AGravaAuditoria;
end;

function TProcessosProvider.VersaoAtualMenor(ANovaVersao: Integer): Boolean;
begin
  if ANovaVersao < FVersaoMaisRecente then
    raise Exception.Create('Nova versão inferior ao último lote de processo atribuido.');

  Result := FVersaoAtual < ANovaVersao;
  if Result then
    FVersaoMaisRecente := ANovaVersao;
end;

procedure TProcessosProvider.AdicionarLote(const ALoteProcessos: ProcessoModelArray);
var
  Indice, I: Integer;
begin
  if Length(ALoteProcessos) = 0 then
    Exit;

  Indice := Length(FLoteProcessos);
  SetLength(FLoteProcessos, Indice + Length(ALoteProcessos));

  for I := 0 to High(ALoteProcessos) do
    FLoteProcessos[Indice + I] := ALoteProcessos[I];
end;

function TProcessosProvider.ObterPendentes(
  AVersaoAtual: Integer): AtualizacaoProcessosModel;
begin
  FVersaoAtual := AVersaoAtual;
  FVersaoMaisRecente := 0;
  SetLength(FLoteProcessos, 0);

  ConstruirProcessos();

  Result.UltimaVersao := FVersaoMaisRecente;
  Result.Processos := FLoteProcessos;
end;

procedure TProcessosProvider.ConstruirProcessos();
begin
  // IA , Abaixo exemplos de implementacao, seguir o mesmo padrao.
  // Antes da entrega o desenvolvedor se encarrega de remover os exemplos
  // e permanecer somente com os processos reais, Exemplo 1 e 2 serão removidos por ele.

  // Exemplo 1
  if VersaoAtualMenor(1) then
    AdicionarLote([
      Add('NEXT001', 'PESQUISAR OPERACAO INTERNA', 5),
      Add('NEXT002', 'NOVA OPERACAO INTERNA', 5),
      Add('NEXT003', 'ALTERAR OPERACAO INTERNA', 5),
      Add('NEXT004', 'SALVAR OPERACAO INTERNA', 5),
      Add('NEXT005', 'EXCLUIR  OPERACAO INTERNA', 10, True),
      Add('NEXT006', 'HABILITAR CONTROLE QUALQUER', 5, False, False)
    ]);

  // Exemplo 2
  if VersaoAtualMenor(2) then
    AdicionarLote([
      Add('NEXT007', 'PESQUISAR ANEXOS', 5),
      Add('NEXT008', 'NOVO ANEXO', 5)
    ]);
end;

end.
