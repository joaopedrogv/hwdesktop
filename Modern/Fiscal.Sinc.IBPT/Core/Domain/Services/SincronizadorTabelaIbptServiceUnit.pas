unit SincronizadorTabelaIbptServiceUnit;

interface

uses
  SysUtils, Classes,
  ISincronizadorTabelaIbptServiceUnit,
  IIbptReaderUnit,
  IIbptWriterUnit,
  IProgressObserverUnit;

type
  SincronizadorTabelaIbptService = class(TInterfacedObject, ISincronizadorTabelaIbptService)
  private
    FWriter: IIbptWriter;
    FReader: IIbptReader;
    FObserver: IProgressObserver;
    procedure DoLog(const Value: string);
  public
    constructor Create(
      const Reader: IIbptReader;
      const Writer: IIbptWriter;
      const Observer: IProgressObserver
    );
    function Executar(const Input: SincronizadorTabelaIbptInput): Boolean;
  end;

implementation

{ SincronizadorTabelaIbptService }

uses
  DateUtils, ItemIbptEtdUnit;

constructor SincronizadorTabelaIbptService.Create(
  const Reader: IIbptReader;
  const Writer: IIbptWriter;
  const Observer: IProgressObserver);
begin
  FWriter := Writer;
  FReader := Reader;
  FObserver := Observer;
end;

procedure SincronizadorTabelaIbptService.DoLog(const Value: string);
begin
  if Assigned(FObserver) then
    FObserver.OnMessage(Value);
end;

function SincronizadorTabelaIbptService.Executar(
  const Input: SincronizadorTabelaIbptInput): Boolean;
var
  ibpts: ItemIbptEtdList;
  item: ItemIbptEtd;
  erros: string;
begin
  Result := False;
  try
    DoLog('');
    DoLog('>>> ATUALIZACAO TABELA IBPT');

    erros := '';

    if not FileExists(Input.FileName) then
      erros :=  sLineBreak + sLineBreak + 'Arquivos da tabela IBPT nao existe: ' + Input.FileName;

    if Trim(Input.UF) = '' then
      erros :=  sLineBreak + sLineBreak + 'UF dorquivos da tabela IBPT nao informada';

    if erros <> '' then
      raise Exception.Create(erros);

    DoLog('Excluindo registros obsoletos');

    ibpts := FReader.ObterItens( IbptReaderInput.Create( Input.FileName, Input.UF ));
    try

      if ibpts.Count = 0 then
      begin
        DoLog('Arquivo não contém nenhum registro');
        Exit;
      end;

      item := ibpts.Items[0] as ItemIbptEtd;

      FWriter.ExcluirItensIBPT(
        item.Uf
        //IncDay(item.VigenciaInicio, -1), item.Chave.Value, item.Versao.Value
      );

      DoLog(Format('Carregados %d registros dos arquivos', [ ibpts.Count ]));

      DoLog('Registrando no banco de dados. Aguarde pois esse processo pode demorar um pouco');

      FWriter.SalvarItensIBPT( ibpts );

      Result := True;

    finally
      ibpts.Free();
    end;

    DoLog('Processo finalizado com sucesso');

  except
    on E: Exception do
    begin
      if Assigned(FObserver) then
        FObserver.OnError(Format('Erro ao processar arquivos da Tabela IBPT: %s', [ E.Message ]));
    end;
  end;
end;

end.
