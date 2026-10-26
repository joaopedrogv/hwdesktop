unit InfComplementarDFeEtdUnit;

interface

uses
  Classes, SysUtils, Contnrs,
  EntityBaseUnit, StringNullableUnit, IntegerNullableUnit, StatusRegistroEnumUnit;

type
  InfComplementarDFeEtd = class(EntityBase)
  private
    FCodInf: Integer;
    FCodEmpresa: Integer;
    FTxt: StringNullable;
    FTxtCompl: StringNullable;
    FTipo: StringNullable;
    FAtivo: StatusRegistroEnum;
    FAtivoEmNfe: Boolean;
    FAtivoEmNfce: Boolean;
  public
    constructor Create(); overload;
    constructor Create(
      ACodInf: Integer;
      ACodEmpresa: Integer;
      const ATxt: StringNullable;
      const ATxtCompl: StringNullable;
      const ATipo: StringNullable;
      AAtivo: StatusRegistroEnum;
      AAtivoEmNfe: Boolean;
      AAtivoEmNfce: Boolean
    ); overload;

    function Clone(): EntityBase; override;

    property CodInf: Integer read FCodInf write FCodInf;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property Txt: StringNullable read FTxt write FTxt;
    property TxtCompl: StringNullable read FTxtCompl write FTxtCompl;
    property Tipo: StringNullable read FTipo write FTipo;
    property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property AtivoEmNfe: Boolean read FAtivoEmNfe write FAtivoEmNfe;
    property AtivoEmNfce: Boolean read FAtivoEmNfce write FAtivoEmNfce;
  end;

  InfComplementarDFeEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): InfComplementarDFeEtd;
    procedure SetItem(Index: Integer; const Value: InfComplementarDFeEtd);
  public
    property Items[Index: Integer]: InfComplementarDFeEtd read GetItem write SetItem;
  end;

implementation

{ InfComplementarDFeEtd }

constructor InfComplementarDFeEtd.Create();
begin
  inherited Create;
end;

function InfComplementarDFeEtd.Clone: EntityBase;
begin

  if Self = nil then
    Result := nil
  else
    Result := InfComplementarDFeEtd.Create(
      FCodInf,
      FCodEmpresa,
      FTxt,
      FTxtCompl,
      FTipo,
      FAtivo,
      FAtivoEmNfe,
      FAtivoEmNfce
    );
end;

constructor InfComplementarDFeEtd.Create(
  ACodInf: Integer;
  ACodEmpresa: Integer;
  const ATxt: StringNullable;
  const ATxtCompl: StringNullable;
  const ATipo: StringNullable;
  AAtivo: StatusRegistroEnum;
  AAtivoEmNfe: Boolean;
  AAtivoEmNfce: Boolean
);
begin
  Create();
  FCodInf := ACodInf;
  FCodEmpresa := ACodEmpresa;
  FTxt := ATxt;
  FTxtCompl := ATxtCompl;
  FTipo := ATipo;
  FAtivo := AAtivo;
  FAtivoEmNfe := AAtivoEmNfe;
  FAtivoEmNfce := AAtivoEmNfce;
end;

{ InfComplementarDFeEtdList }

function InfComplementarDFeEtdList.GetItem(Index: Integer): InfComplementarDFeEtd;
begin
  Result := InfComplementarDFeEtd(inherited Items[Index]);
end;

procedure InfComplementarDFeEtdList.SetItem(Index: Integer; const Value: InfComplementarDFeEtd);
begin
  Put(Index, Value);
end;

end.
