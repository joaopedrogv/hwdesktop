unit NFSeDocModelUnit;

interface

uses
  NFSeDocEtdUnit, StringNullableUnit, IntegerNullableUnit, DateAndTimeNullableUnit, NFSeTypesUnit;

type
  NFSeDocModel = class
  private
    FSituacao: SituacaoNFSeEnum;
    FSerie: StringNullable;
    FNDps: IntegerNullable;
    FDhEmi: DateTimeNullable;
    FDocumentos: NFSeDocEtdList;
    function GetDocumentos(TipoDoc: TipoDocNFSeEnum): NFSeDocEtd;
  public
    constructor Create(
      ASituacao: SituacaoNFSeEnum;
      const ASerie: StringNullable;
      const ANDps: IntegerNullable;
      const ADhEmi: DateTimeNullable;
      ADocumentos: NFSeDocEtdList
    );
    destructor Destroy; override;

    property Situacao: SituacaoNFSeEnum read FSituacao write FSituacao;
    property Serie: StringNullable read FSerie write FSerie;
    property NDps: IntegerNullable read FNDps write FNDps;
    property DhEmi: DateTimeNullable read FDhEmi write FDhEmi;
    property Documento[TipoDoc: TipoDocNFSeEnum]: NFSeDocEtd read GetDocumentos;
  end;

implementation

{ NFSeDocModel }

constructor NFSeDocModel.Create(
  ASituacao: SituacaoNFSeEnum;
  const ASerie: StringNullable;
  const ANDps: IntegerNullable;
  const ADhEmi: DateTimeNullable;
  ADocumentos: NFSeDocEtdList
);
begin
  FSituacao := ASituacao;
  FSerie := ASerie;
  FNDps := ANDps;
  FDhEmi := ADhEmi;
  FDocumentos := ADocumentos;
end;

destructor NFSeDocModel.Destroy;
begin
  FDocumentos.Free();

  inherited;
end;


function NFSeDocModel.GetDocumentos(TipoDoc: TipoDocNFSeEnum): NFSeDocEtd;
var
  I: Integer;
begin
  if FDocumentos <> nil then
    for I := 0 to FDocumentos.Count - 1 do
      if NFSeDocEtd(FDocumentos.Items[I]).TipoDoc = TipoDoc then
      begin
        Result := NFSeDocEtd(FDocumentos.Items[I]);
        Exit;
      end;

  Result := nil;
end;

end.
