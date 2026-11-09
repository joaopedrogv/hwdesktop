unit QueryPreviewReader;

interface

uses
  Data.DB, IDatabaseReaderUnit, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TQueryPreviewReader = class(TInterfacedObject, IDatabaseReader)
  private
    FDataSet: TFDMemTable;
    FCampoMarcacao: string;

    procedure CriarDataSet();
  public
    constructor Create(const ACampoMarcacao: string);
    destructor Destroy; override;

    procedure Pesquisar;
    procedure Limpar;
    function DataSet: TDataSet;
  end;

implementation

uses
  System.SysUtils;

const
  PreviewRows = 12;

{ TQueryPreviewReader }

constructor TQueryPreviewReader.Create(const ACampoMarcacao: string);
begin
  FDataSet := nil;
  FCampoMarcacao := ACampoMarcacao;
end;

procedure TQueryPreviewReader.CriarDataSet;
var
  MemTable: TFDMemTable;
  I: Integer;
  Selecao: Boolean;
  Documento: string;
  Descricao: string;
  Codigo: Integer;
  Valor: Currency;
  Data: TDateTime;
begin
  MemTable := TFDMemTable.Create(nil);
  try
    MemTable.FieldDefs.Add('sel', ftBoolean);
    MemTable.FieldDefs.Add('documento', ftString, 20);
    MemTable.FieldDefs.Add('descricao', ftString, 60);
    MemTable.FieldDefs.Add('codigo', ftInteger);
    MemTable.FieldDefs.Add('valor', ftCurrency);
    MemTable.FieldDefs.Add('data', ftDate);
    MemTable.CreateDataSet;

    for I := 1 to PreviewRows do
    begin
      if (I = 3) or (I = 7) then
      begin
        Selecao := True;
        Documento := 'DOC-0003';
        Descricao := 'Documento repetido';
        Codigo := 3;
        Valor := 30.00;
        Data := EncodeDate(2026, 11, 3);
      end
      else
      begin
        Selecao := False;
        Documento := Format('DOC-%.4d', [I]);
        Descricao := Format('Documento de exemplo %d', [I]);
        Codigo := I;
        Valor := I * 10.00;
        Data := EncodeDate(2026, 11, 1) + (I - 1);
      end;
      MemTable.AppendRecord([Selecao, Documento, Descricao, Codigo, Valor, Data]);
    end;

    FreeAndNil(FDataSet);

    FDataSet := MemTable;

    MemTable := nil;
  except
    MemTable.Free;
    raise;
  end;
end;

function TQueryPreviewReader.DataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TQueryPreviewReader.Destroy;
begin
  Limpar();
  inherited;
end;

procedure TQueryPreviewReader.Limpar;
begin
  FreeAndNil(FDataSet);
end;

procedure TQueryPreviewReader.Pesquisar;
begin
  CriarDataSet;
end;

end.