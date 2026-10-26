unit SincronizadorFiscalNFSeServiceUnit;

interface

uses
  SysUtils, Classes,
  ISincronizadorFiscalNFSeServiceUnit, ITabelasFiscaisNFSeReaderUnit, ITabelasFiscaisNFSeWriterUnit,
  IProgressObserverUnit;

type
  SincronizadorFiscalNFSeService = class(TInterfacedObject, ISincronizadorFiscalNFSeService)
  private
    FWriter: ITabelasFiscaisNFSeWriter;
    FReader: ITabelasFiscaisNFSeReader;
    FObserver: IProgressObserver;
    procedure DoLog(const Value: string);
    function ExecutarCodigoTributacaoNacional(const FileName: string): Boolean;
    function ExecutarCodigoOperacaoFornecimentoNFSe(const FileName: string): Boolean;
    function ExecutarCorrelacaoFiscal(const FileName: string): Boolean;
  public
    constructor Create(
      const Reader: ITabelasFiscaisNFSeReader;
      const Writer: ITabelasFiscaisNFSeWriter;
      const Observer: IProgressObserver
    );
    function Executar(const FileName: string): Boolean;
  end;

implementation

uses
  StrUtils,
  CorrelacaoFiscalNFSeEtdUnit, CodigoTributacaoNacionalNFSeEtdUnit, CodigoIndicadorOperacaoNFSeEtdUnit;

{ SincronizadorFiscalNFSeService }

constructor SincronizadorFiscalNFSeService.Create(const Reader: ITabelasFiscaisNFSeReader;
  const Writer: ITabelasFiscaisNFSeWriter; const Observer: IProgressObserver);
begin
  FWriter := Writer;
  FReader := Reader;
  FObserver := Observer;
end;

procedure SincronizadorFiscalNFSeService.DoLog(const Value: string);
begin
  if Assigned(FObserver) then
    FObserver.OnMessage(Value);
end;

function SincronizadorFiscalNFSeService.Executar(const FileName: string): Boolean;
var
  sName: string;
  idx: Integer;
  eFile: ArquivoFiscalNFSeEnum;
begin
  Result := False;

  sName := ExtractFileName(FileName);
  idx := IndexText(sName, ArquivoFiscalNFSeEnumName);
  if idx = -1 then
    Exit;

  eFile := ArquivoFiscalNFSeEnum(idx);

  case eFile of
    fecTribNac  : Result := ExecutarCodigoTributacaoNacional( FileName );
    fcIndOp     : Result := ExecutarCodigoOperacaoFornecimentoNFSe( FileName );
    fcCorrelacao: Result := ExecutarCorrelacaoFiscal( FileName );
  end;
end;

function SincronizadorFiscalNFSeService.ExecutarCodigoOperacaoFornecimentoNFSe(const FileName: string): Boolean;
var
  codigos: CodigoIndicadorOperacaoNFSeEtdList;
begin
  Result := False;
  try
    DoLog('');
    DoLog('>>> ATUALIZACAO TABELA CODIGO INDICADOR DA OPERACAO NFSE');

    if not FileExists(FileName) then
      raise Exception.Create('Arquivos da tabela cIndOp da NFSe não existe: ' + FileName);

    codigos := FReader.ObterCodigosIndicadorOperacao( FileName );
    try

      if codigos.Count = 0 then
      begin
        DoLog('Arquivo não contém nenhum registro');
        Exit;
      end;

      DoLog('Excluindo registros obsoletos');

      FWriter.ExcluirCodigosIndicadorOperacaoNFSe();

      DoLog(Format('Carregados %d registros dos arquivos', [ codigos.Count ]));

      DoLog('Registrando no banco de dados. Aguarde pois esse processo pode demorar um pouco');

      FWriter.SalvarCodigosIndicadorOperacaoNFSe( codigos );

      Result := True;

    finally
      codigos.Free();
    end;

    DoLog('Processo finalizado com sucesso');

  except
    on E: Exception do
    begin
      if Assigned(FObserver) then
        FObserver.OnError(Format('Erro ao processar arquivo da tabela cIndOp da NFSe: %s', [ E.Message ]));
    end;
  end;
end;

function SincronizadorFiscalNFSeService.ExecutarCodigoTributacaoNacional(const FileName: string): Boolean;
var
  codigos: CodigoTributacaoNacionalNFSeEtdList;
begin
  Result := False;
  try
    DoLog('');
    DoLog('>>> ATUALIZACAO TABELA CODIGO TRIBUTACAO NACIONAL');

    if not FileExists(FileName) then
      raise Exception.Create('Arquivos da tabela cTribNac da NFSe não existe: ' + FileName);

    codigos := FReader.ObterCodigosTributacaoNacional( FileName );
    try

      if codigos.Count = 0 then
      begin
        DoLog('Arquivo não contém nenhum registro');
        Exit;
      end;

      DoLog('Excluindo registros obsoletos');

      FWriter.ExcluirCodigosTributacaoNacionalNFSe();

      DoLog(Format('Carregados %d registros dos arquivos', [ codigos.Count ]));

      DoLog('Registrando no banco de dados. Aguarde pois esse processo pode demorar um pouco');

      FWriter.SalvarCodigosTributacaoNacionalNFSe( codigos );

      Result := True;

    finally
      codigos.Free();
    end;

    DoLog('Processo finalizado com sucesso');

  except
    on E: Exception do
    begin
      if Assigned(FObserver) then
        FObserver.OnError(Format('Erro ao processar arquivo da tabela cTribNac da NFSe: %s', [ E.Message ]));
    end;
  end;
end;

function SincronizadorFiscalNFSeService.ExecutarCorrelacaoFiscal(const FileName: string): Boolean;
var
  correlacoes: CorrelacaoFiscalNFSeEtdList;
begin
  Result := False;
  try
    DoLog('');
    DoLog('>>> ATUALIZACAO TABELA CORRELACAO LC 116 NBS INDOP E CCLASSTRIB');

    if not FileExists(FileName) then
      raise Exception.Create('Arquivos da tabela de Correlação de Codigos Fiscais NFSe não existe: ' + FileName);

    correlacoes := FReader.ObterCorrelacoesFiscais( FileName );
    try

      if correlacoes.Count = 0 then
      begin
        DoLog('Arquivo não contém nenhum registro');
        Exit;
      end;

      DoLog('Excluindo registros obsoletos');

      FWriter.ExcluirCorrelacaoFiscalNFSe();

      DoLog(Format('Carregados %d registros dos arquivos', [ correlacoes.Count ]));

      DoLog('Registrando no banco de dados. Aguarde pois esse processo pode demorar um pouco');

      FWriter.SalvarCorrelacaoFiscalNFSe( correlacoes );

      Result := True;

    finally
      correlacoes.Free();
    end;

    DoLog('Processo finalizado com sucesso');

  except
    on E: Exception do
    begin
      if Assigned(FObserver) then
        FObserver.OnError(Format('Erro ao processar arquivos de Correlação de Codigos Fiscais NFSe: %s', [ E.Message ]));
    end;
  end;
end;

end.
