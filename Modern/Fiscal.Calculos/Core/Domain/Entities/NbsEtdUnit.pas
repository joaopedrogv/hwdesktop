unit NbsEtdUnit;

interface

uses
  EntityBaseUnit,
  TipoComunsUnit,
  DateAndTimeNullableUnit,
  StringNullableUnit,
  Contnrs;

type
  NbsEtd = class(EntityBase)
  private
    FCodigo: string;
    FDescricao: string;
    FLc116: StringNullable;
    FDataInicio: TDate;
    FDataFim: DateNullable;
  public
    constructor Create(
      const Codigo: string;
      const Descricao: string;
      const Lc116: StringNullable;
      DataInicio: TDate;
      const DataFim: DateNullable
    );

    function Clone(): EntityBase; override;

    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property Lc116: StringNullable read FLc116 write FLc116;
    property DataInicio: TDate read FDataInicio write FDataInicio;
    property DataFim: DateNullable read FDataFim write FDataFim;
  end;

  NbssEtd = class(TObjectList);

implementation

{ NbsEtd }

function NbsEtd.Clone: EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NbsEtd.Create(
      FCodigo, FDescricao, FLc116, FDataInicio, FDataFim
    );
end;

constructor NbsEtd.Create(
  const Codigo: string;
  const Descricao: string;
  const Lc116: StringNullable;
  DataInicio: TDate;
  const DataFim: DateNullable
);
begin
  FCodigo := Codigo;
  FDescricao := Descricao;
  FLc116 := Lc116;
  FDataInicio := DataInicio;
  FDataFim := DataFim;
end;

end.

