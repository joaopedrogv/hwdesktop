unit IbptCsvReaderUnit;

interface

uses
  SysUtils,
  Classes,
  IIbptReaderUnit,
  ItemIbptEtdUnit,
  ICSVReaderUnit,
  DateTimeServiceUnit;

type
  IbptCsvReader = class(TInterfacedObject, IIbptReader)
  private
    FCsvReader: ICSVReader;
    FOnProgress: TProc<Integer, Integer>;
    procedure SetOnProgress(const Value: TProc<Integer, Integer>);
  public
    constructor Create(ACSVReader: ICSVReader);

    function ObterItens(const Input: IbptReaderInput): ItemIbptEtdList;

    property OnProgress: TProc<Integer, Integer> read FOnProgress write SetOnProgress;
  end;

implementation

{ IbptCsvReader }

uses DateAndTimeNullableUnit, StringNullableUnit;

constructor IbptCsvReader.Create(ACSVReader: ICSVReader);
begin
  FCsvReader := ACSVReader;
end;

function IbptCsvReader.ObterItens(
  const Input: IbptReaderInput): ItemIbptEtdList;
const
  FS: TFormatSettings = ( DecimalSeparator: '.' );
var
  Row: ICsvRow;
  TotalLines: Integer;
  CurrentLine: Integer;
  Config: CSVConfig;
  //itemIbpt: ItemIbptEtd;
begin
  TotalLines := 0;
  CurrentLine := 0;

  // Configuração padrão
  Config := CSVConfig.Default;
  Config.Separator := ';';
  Config.Encoding := ceANSI;

  FCsvReader.Open(Input.FileName, Config);
  Result := ItemIbptEtdList.Create();
  try try
    // Conta total de linhas para progresso (opcional)
    // TotalLines := FCsvReader.GetTotalLines; // Poderia ser implementado

    while FCsvReader.HasNext do
    begin
      Row := FCsvReader.Next;
      Inc(CurrentLine);

      Result.Add( ItemIbptEtd.Create(
        CurrentLine,
        Row.FieldByName['codigo'],
        Input.UF.Substring(0, 2),
        StrToIntDef(Row.FieldByName['ex'], 0),
        Row.FieldByName['tipo'].Substring(0, 50),
        Row.FieldByName['descricao'].Substring(0, 150),
        StrToCurr( Row.FieldByName['nacionalfederal'], FS ),
        StrToCurr( Row.FieldByName['estadual'], FS ),
        StrToCurr( Row.FieldByName['importadosfederal'], FS ),
        StrToCurr( Row.FieldByName['municipal'], FS ),
        DateTimeService.FromLocalToDateTime( Row.FieldByName['vigenciainicio'] ),
        DateTimeNullable.CreateOrNull( DateTimeService.FromLocalToDateTime( Row.FieldByName['vigenciafim'] )),
        StringNullable.CreateOrNull( Row.FieldByName['chave'] ),
        StringNullable.CreateOrNull( Row.FieldByName['versao'] )
      ));
      //itemIbpt := nil; // Uma vez adicionado a lista, a lista fica responsavel pelo destroy

      if Assigned(FOnProgress) then
        FOnProgress(CurrentLine, TotalLines);
    end;

  except on E: Exception do
    begin
      Result.Free();
      //itemIbpt.Free();
      raise;
    end;
  end;
  finally
    FCsvReader.Close;
  end;
end;

procedure IbptCsvReader.SetOnProgress(const Value: TProc<Integer, Integer>);
begin
  FOnProgress := Value;
end;

end.
