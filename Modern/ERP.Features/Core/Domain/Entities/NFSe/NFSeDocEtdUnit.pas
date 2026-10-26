unit NFSeDocEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  NFSeTypesUnit,
  DateAndTimeNullableUnit;

type
  NFSeDocEtd = class
  private
    FId: string;
    FTipoDoc: TipoDocNFSeEnum;
    FDataEvento: DateTimeNullable;
    FDoc: string;
  public
    constructor Create(); overload;
    constructor Create(
      const AId: string;
      ATipoDoc: TipoDocNFSeEnum;
      ADataEvento: DateTimeNullable;
      const ADoc: string
    ); overload;

    property Id: string read FId write FId;
    property TipoDoc: TipoDocNFSeEnum read FTipoDoc write FTipoDoc;
    property DataEvento: DateTimeNullable read FDataEvento write FDataEvento; // Nullable apenas para o repositorio resolver
    property Doc: string read FDoc write FDoc;
  end;

  NFSeDocEtdList = class(TObjectList);

implementation

{ NFSeDocEtd }

constructor NFSeDocEtd.Create();
begin
  inherited Create;
end;

constructor NFSeDocEtd.Create(
  const AId: string;
  ATipoDoc: TipoDocNFSeEnum;
  ADataEvento: DateTimeNullable;
  const ADoc: string
);
begin
  Create();
  FId := AId;
  FTipoDoc := ATipoDoc;
  FDataEvento := ADataEvento;
  FDoc := ADoc;
end;

end.
