unit SincronizadorNCMsSICOMEXServiceUnit;

interface

uses
  ISincronizadorNCMsSICOMEXServiceUnit,
  IProgressObserverUnit,
  INcmReaderUnit,
  INcmWriterUnit,
  ArquivosSICOMEXInputUnit;

type
  SincronizadorNCMsSICOMEXService = class(TInterfacedObject, ISincronizadorNCMsSICOMEXService)
  private
    FObserver: IProgressObserver;
    FReader: INcmReader;
    FWriter: INcmWriter;
    procedure DoLog(const Value: string);
  public
    constructor Create(
      const Observer: IProgressObserver;
      const Reader: INcmReader;
      const Writer: INcmWriter
    );
    function Executar(const Input: ArquivosSICOMEXInput): Boolean;
  end;

implementation

uses
  SysUtils, NcmEtdUnit, IDataBaseConnectionUnit;

{ SincronizadorNCMsSICOMEXService }

constructor SincronizadorNCMsSICOMEXService.Create(
  const Observer: IProgressObserver;
  const Reader: INcmReader;
  const Writer: INcmWriter
);
begin
  FObserver := Observer;
  FReader := Reader;
  FWriter := Writer;
end;

procedure SincronizadorNCMsSICOMEXService.DoLog(const Value: string);
begin
  if Assigned(FObserver) then
    FObserver.OnMessage(Value);
end;

function SincronizadorNCMsSICOMEXService.Executar(const Input: ArquivosSICOMEXInput): Boolean;
var
  ncms: NcmsEtd;
  erros: string;
begin
  Result := False;
  try
    DoLog('');
    DoLog('>>> ATUALIZACAO TABELA NCM via arquivos SICOMEX');
    DoLog('>> Arquivos (Histórico, Futuro e Vigente)');

    erros := '';

    if (Trim(Input.Historico) <> '') and not FileExists(Input.Historico) then
      erros :=  sLineBreak + sLineBreak + 'Arquivos informado de NCMs históricos não existe: ' + Input.Historico;

    if (Trim(Input.Futuro) <> '') and not FileExists(Input.Futuro) then
      erros :=  erros + sLineBreak + sLineBreak + 'Arquivos informado de NCMs futuros não existe: ' + Input.Futuro;

    if (Trim(Input.Vigente) <> '') and not FileExists(Input.Vigente) then
      erros :=  erros + sLineBreak + sLineBreak + 'Arquivos informado de NCMs vigentes não existe: ' + Input.Vigente;

    if erros <> '' then
      raise Exception.Create(erros);

    DoLog('Excluindo registros obsoletos');

    FWriter.ExcluirNCMs();

    ncms := FReader.ObterNCMs( Input );

    try
      DoLog(Format('Carregados %d registros dos arquivos', [ ncms.Count ]));

      DoLog('Registrando no banco de dados. Aguarde pois esse processo pode demorar um pouco');

      FWriter.SalvarNcms( ncms );

      Result := True;

    finally
      ncms.Free();
    end;

    DoLog('Processo finalizado com sucesso');

  except
    on E: Exception do
    begin
      if Assigned(FObserver) then
        FObserver.OnError(Format('Erro ao processar arquivos Json SICOMEX: %s', [ E.Message ]));
    end;
  end;
end;

end.

