unit NCMJsonReaderUnit;

interface

uses
  SysUtils,
  INcmReaderUnit, NcmEtdUnit, ArquivosSICOMEXInputUnit;

type
  /// <summary>
  ///   Implementa INcmReader do json obtido no link
  ///  <p>https://portalunico.siscomex.gov.br/classif/#/nomenclatura/tabela?perfil=publico</p>
  ///  <p>No link existe 3 arquivos, NCMs vigentes, futuros e historico com NCMs desativados</p>
  /// </summary>
  /// <summary>
  ///  Utilize o Setup passando o caminho dos 3 arquivos no formato da string abaixo
  ///   <p>ConfiPathHistorico=%s;PathFuturo=%s;PathVigente=%s</p>
  /// </summary>
  NCMJsonReader = class(TInterfacedObject, INcmReader)
  public
    function ObterNCMs(const Arquivos: ArquivosSICOMEXInput): NcmsEtd;
  end;

implementation

uses
  NcmSicomexModelUnit, REST.Json, System.IOUtils;

function BytesToJson(Bytes: TBytes): string;
begin
  // Detecta automaticamente UTF-8 (com ou sem BOM)
  if (Length(Bytes) >= 3) and
     (Bytes[0] = $EF) and (Bytes[1] = $BB) and (Bytes[2] = $BF) then
  begin
    // UTF-8 com BOM - pula os 3 primeiros bytes
    Result := TEncoding.UTF8.GetString(Bytes, 3, Length(Bytes) - 3);
  end
  else if (Length(Bytes) >= 2) and
          (Bytes[0] = $FF) and (Bytes[1] = $FE) then
  begin
    // UTF-16 LE
    Result := TEncoding.Unicode.GetString(Bytes);
  end
  else
  begin
    // Assume UTF-8 sem BOM (padrão JSON)
    Result := TEncoding.UTF8.GetString(Bytes);
  end;
end;

{ NCMJsonReader }

function NCMJsonReader.ObterNCMs(const Arquivos: ArquivosSICOMEXInput): NcmsEtd;
var
  I: Integer;
  ncmFile: RootNcmSicomexModel;
  ncm: NcmSicomexModel;
  files: array[NcmState] of string;
  sJson: string;
  ncmSt: NcmState;
begin
  Result := NcmsEtd.Create();

  files[nsHistoric] := Arquivos.Historico;
  files[nsFuture] := Arquivos.Futuro;
  files[nsPresent] := Arquivos.Vigente;

  for ncmSt := Low(NcmState) to High(NcmState) do
  begin
    sJson := BytesToJson( TFile.ReadAllBytes( files[ncmSt] ));
    ncmFile := TJson.JsonToObject<RootNcmSicomexModel>(sJson);
    try
      for ncm in ncmFile.Nomenclaturas do
      begin
        ncm.State := ncmSt;

        Result.Add( ncm.ToNcmEtd() );
      end;

    finally
      ncmFile.Free();
    end;
  end;
end;

end.
