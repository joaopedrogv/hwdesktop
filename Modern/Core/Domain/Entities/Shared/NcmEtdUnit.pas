unit NcmEtdUnit;

interface

uses
  EntityBaseUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  StringNullableUnit,
  Contnrs;

type
  NcmState = (nsHistoric, nsPresent, nsFuture);

  NcmEtd = class(EntityBase)
  private
    FCodigo: string;
    FDescricao: string;
    FDataInicio: TDate;
    FDataFim: DateNullable;
    FNumeroAtoIni: string;
    FNumeroAtoFim: StringNullable;
    FAnoAtoIni: string;
    FAnoAtoFim: StringNullable;
    FState: NcmState;
  public
    constructor Create(
      const Codigo: string;
      const Descricao: string;
      DataInicio: TDate;
      const DataFim: DateNullable;
      NumeroAtoIni: string;
      const NumeroAtoFim: StringNullable;
      AnoAtoIni: string;
      const AnoAtoFim: StringNullable;
      State: NcmState
    );

    function Clone(): EntityBase; override;

    property Codigo: string read FCodigo;
    property Descricao: string read FDescricao;
    property DataInicio: TDate read FDataInicio;
    property DataFim: DateNullable read FDataFim;
    property NumeroAtoIni: string read FNumeroAtoIni;
    property NumeroAtoFim: StringNullable read FNumeroAtoFim;
    property AnoAtoIni: string read FAnoAtoIni;
    property AnoAtoFim: StringNullable read FAnoAtoFim;
    property State: NcmState read FState;
  end;

  NcmsEtd = class(TObjectList);

implementation

{ NcmEtd }

function NcmEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NcmEtd.Create(
      FCodigo, FDescricao, FDataInicio, FDataFim, FNumeroAtoIni, FNumeroAtoFim, FAnoAtoIni, FAnoAtoFim, FState
    );
end;

constructor NcmEtd.Create(
  const Codigo: string;
  const Descricao: string;
  DataInicio: TDate;
  const DataFim: DateNullable;
  NumeroAtoIni: string;
  const NumeroAtoFim: StringNullable;
  AnoAtoIni: string;
  const AnoAtoFim: StringNullable;
  State: NcmState
);
begin
  FCodigo := Codigo;
  FDescricao := Descricao;
  FDataInicio := DataInicio;
  FDataFim := DataFim;
  FNumeroAtoIni := NumeroAtoIni;
  FNumeroAtoFim := NumeroAtoFim;
  FAnoAtoIni := AnoAtoIni;
  FAnoAtoFim := AnoAtoFim;
  FState := State;
end;

end.
