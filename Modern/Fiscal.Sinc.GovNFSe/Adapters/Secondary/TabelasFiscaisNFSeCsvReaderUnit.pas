unit TabelasFiscaisNFSeCsvReaderUnit;

interface

uses
  SysUtils, Classes,
  ITabelasFiscaisNFSeReaderUnit,
  CodigoTributacaoNacionalNFSeEtdUnit,
  CodigoIndicadorOperacaoNFSeEtdUnit,
  CorrelacaoFiscalNFSeEtdUnit,
  ICSVReaderUnit,
  DateTimeServiceUnit;

type
  TabelasFiscaisNFSeCsvReader = class(TInterfacedObject, ITabelasFiscaisNFSeReader)
  private
    FCsvReader: ICSVReader;
  public
    constructor Create(ACSVReader: ICSVReader);

    function ObterCodigosTributacaoNacional(const FileName: string): CodigoTributacaoNacionalNFSeEtdList;
    function ObterCodigosIndicadorOperacao(const FileName: string): CodigoIndicadorOperacaoNFSeEtdList;
    function ObterCorrelacoesFiscais(const FileName: string): CorrelacaoFiscalNFSeEtdList;
  end;

implementation

{ ICorrelacaoFiscalNFSeCsvReader }

uses DateAndTimeNullableUnit, StringNullableUnit, StringServiceUnit;

constructor TabelasFiscaisNFSeCsvReader.Create(ACSVReader: ICSVReader);
begin
  FCsvReader := ACSVReader;
end;

function TabelasFiscaisNFSeCsvReader.ObterCodigosIndicadorOperacao(
  const FileName: string): CodigoIndicadorOperacaoNFSeEtdList;
var
  Row: ICsvRow;
  Config: CSVConfig;
begin

  // Configuração padrão
  Config := CSVConfig.Default;
  Config.Separator := ';';
  Config.Encoding := ceANSI;

  FCsvReader.Open(FileName, Config);
  Result := CodigoIndicadorOperacaoNFSeEtdList.Create();
  try try
    while FCsvReader.HasNext do
    begin
      Row := FCsvReader.Next;

      if not String.IsNullOrWhiteSpace( Row.Fields[0] ) then
        Result.Add( CodigoIndicadorOperacaoNFSeEtd.Create(
          StringService.PadLeft( StringService.OnlyNumber( Row.Fields[0] ), 6, '0' ), Row.Fields[1]
        ));
    end;

  except on E: Exception do
    begin
      Result.Free();
      raise;
    end;
  end;
  finally
    FCsvReader.Close;
  end;
end;

function TabelasFiscaisNFSeCsvReader.ObterCodigosTributacaoNacional(
  const FileName: string): CodigoTributacaoNacionalNFSeEtdList;
var
  Row: ICsvRow;
  Config: CSVConfig;
begin

  // Configuração padrão
  Config := CSVConfig.Default;
  Config.Separator := ';';
  Config.Encoding := ceANSI;

  FCsvReader.Open(FileName, Config);
  Result := CodigoTributacaoNacionalNFSeEtdList.Create();
  try try
    while FCsvReader.HasNext do
    begin
      Row := FCsvReader.Next;

      if not String.IsNullOrWhiteSpace( Row.Fields[0] ) then
        Result.Add( CodigoTributacaoNacionalNFSeEtd.Create(
          StringService.PadLeft( StringService.OnlyNumber( Row.Fields[0] ), 6, '0' ), Row.Fields[4]
        ));
    end;

  except on E: Exception do
    begin
      Result.Free();
      raise;
    end;
  end;
  finally
    FCsvReader.Close;
  end;
end;

function TabelasFiscaisNFSeCsvReader.ObterCorrelacoesFiscais(
  const FileName: string): CorrelacaoFiscalNFSeEtdList;
const
  FS: TFormatSettings = ( DecimalSeparator: '.' );
var
  Row: ICsvRow;
  CurrentLine: Integer;
  Config: CSVConfig;
  cLC116, cNBS, cIndOp, cClassTrib: string;
begin
  CurrentLine := 0;

  // Configuração padrão
  Config := CSVConfig.Default;
  Config.Separator := ';';
  Config.Encoding := ceANSI;

  FCsvReader.Open(FileName, Config);
  Result := CorrelacaoFiscalNFSeEtdList.Create();
  try try
    while FCsvReader.HasNext do
    begin
      Row := FCsvReader.Next;
      Inc(CurrentLine);

      if not String.IsNullOrWhiteSpace( Row.Fields[0] ) then
        cLC116 := StringService.PadLeft( Row.Fields[0], 5, '0' );

      if not String.IsNullOrWhiteSpace( StringService.OnlyNumber(Row.Fields[2]) ) then
        cNBS := StringService.OnlyNumber( Row.Fields[2] );

      if not String.IsNullOrWhiteSpace( StringService.OnlyNumber(Row.Fields[6]) ) then
        cIndOp := StringService.PadLeft( StringService.OnlyNumber(Row.Fields[6]), 6, '0');

      if not String.IsNullOrWhiteSpace( Row.Fields[8] ) then
        cClassTrib := StringService.PadLeft( StringService.OnlyNumber(Row.Fields[8]), 6, '0');

      Result.Add( CorrelacaoFiscalNFSeEtd.Create(
        CurrentLine, cLC116, cNBS, cIndOp, cClassTrib
      ));
    end;

  except on E: Exception do
    begin
      Result.Free();
      raise;
    end;
  end;
  finally
    FCsvReader.Close;
  end;
end;

end.
