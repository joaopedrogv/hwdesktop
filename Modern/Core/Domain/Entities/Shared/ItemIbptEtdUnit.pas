unit ItemIbptEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  EntityBaseUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  DateAndTimeNullableUnit;

type
  ItemIbptEtd = class(EntityBase)
  private
    FId: Integer;
    FCodigo: string;
    FUf: string;
    FEx: Integer;
    FTipo: string;
    FDescricao: string;
    FNacional: Currency;
    FEstadual: Currency;
    FImportado: Currency;
    FMunicipal: Currency;
    FVigenciaInicio: TDateTime;
    FVigenciaFim: DateTimeNullable;
    FChave: StringNullable;
    FVersao: StringNullable;
  public
    constructor Create(); overload;
    constructor Create(
      AId: Integer;
      const ACodigo: string;
      const AUf: string;
      AEx: Integer;
      const ATipo: string;
      const ADescricao: string;
      ANacional: Currency;
      AEstadual: Currency;
      AImportado: Currency;
      AMunicipal: Currency;
      AVigenciaInicio: TDateTime;
      const AVigenciaFim: DateTimeNullable;
      const AChave: StringNullable;
      const AVersao: StringNullable
    ); overload;
    function Clone(): EntityBase; override;
    property Id: Integer read FId write FId;
    property Codigo: string read FCodigo write FCodigo;
    property Uf: string read FUf write FUf;
    property Ex: Integer read FEx write FEx;
    property Tipo: string read FTipo write FTipo;
    property Descricao: string read FDescricao write FDescricao;
    property Nacional: Currency read FNacional write FNacional;
    property Estadual: Currency read FEstadual write FEstadual;
    property Importado: Currency read FImportado write FImportado;
    property Municipal: Currency read FMunicipal write FMunicipal;
    property VigenciaInicio: TDateTime read FVigenciaInicio write FVigenciaInicio;
    property VigenciaFim: DateTimeNullable read FVigenciaFim write FVigenciaFim;
    property Chave: StringNullable read FChave write FChave;
    property Versao: StringNullable read FVersao write FVersao;
  end;

  ItemIbptEtdList = class(TObjectList);

implementation

{ ItemIbptEtd }

constructor ItemIbptEtd.Create();
begin
  inherited Create;
end;

constructor ItemIbptEtd.Create(
  AId: Integer;
  const ACodigo: string;
  const AUf: string;
  AEx: Integer;
  const ATipo: string;
  const ADescricao: string;
  ANacional: Currency;
  AEstadual: Currency;
  AImportado: Currency;
  AMunicipal: Currency;
  AVigenciaInicio: TDateTime;
  const AVigenciaFim: DateTimeNullable;
  const AChave: StringNullable;
  const AVersao: StringNullable
);
begin
  Create();
  FId := AId;
  FCodigo := ACodigo;
  FUf := AUf;
  FEx := AEx;
  FTipo := ATipo;
  FDescricao := ADescricao;
  FNacional := ANacional;
  FEstadual := AEstadual;
  FImportado := AImportado;
  FMunicipal := AMunicipal;
  FVigenciaInicio := AVigenciaInicio;
  FVigenciaFim := AVigenciaFim;
  FChave := AChave;
  FVersao := AVersao;
end;

function ItemIbptEtd.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := ItemIbptEtd.Create(
      FId,
      FCodigo,
      FUf,
      FEx,
      FTipo,
      FDescricao,
      FNacional,
      FEstadual,
      FImportado,
      FMunicipal,
      FVigenciaInicio,
      FVigenciaFim,
      FChave,
      FVersao
    );
end;

end.
