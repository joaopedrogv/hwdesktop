unit ListaServicosLC116EtdUnit;

interface

uses
  Contnrs,
  TipoComunsUnit,
  DateAndTimeNullableUnit;

type
  ListaServicosLC116Etd = class
  private
    FCodigo: string;            // LSLC_CD              VARCHAR(5) NOT NULL (PK)
    FDescricao: string;         // LSLC_DESCRICAO       VARCHAR(512) NOT NULL
    FInicioVigencia: TDate;     // LSLC_INICIO_VIGENCIA TIMESTAMP NOT NULL (obrigatoria)
    FFimVigencia: DateNullable; // LSLC_FIM_VIGENCIA    TIMESTAMP (opcional)
  public
    constructor Create(); overload;
    constructor Create(
      const ACodigo, ADescricao: string;
      AInicioVigencia: TDate;
      const AFimVigencia: DateNullable
    ); overload;

    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property InicioVigencia: TDate read FInicioVigencia write FInicioVigencia;
    property FimVigencia: DateNullable read FFimVigencia write FFimVigencia;
  end;

  ListaServicosLC116EtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): ListaServicosLC116Etd;
    procedure SetItem(Index: Integer; const Value: ListaServicosLC116Etd);
  public
    property Items[Index: Integer]: ListaServicosLC116Etd read GetItem write SetItem; default;
  end;

implementation

{ ListaServicosLC116Etd }

constructor ListaServicosLC116Etd.Create();
begin
  inherited Create;
end;

constructor ListaServicosLC116Etd.Create(
  const ACodigo, ADescricao: string;
  AInicioVigencia: TDate;
  const AFimVigencia: DateNullable
);
begin
  Create();
  FCodigo := ACodigo;
  FDescricao := ADescricao;
  FInicioVigencia := AInicioVigencia;
  FFimVigencia := AFimVigencia;
end;

{ ListaServicosLC116EtdList }

function ListaServicosLC116EtdList.GetItem(Index: Integer): ListaServicosLC116Etd;
begin
  Result := ListaServicosLC116Etd(inherited Items[Index]);
end;

procedure ListaServicosLC116EtdList.SetItem(Index: Integer; const Value: ListaServicosLC116Etd);
begin
  Put(Index, Value);
end;

end.
