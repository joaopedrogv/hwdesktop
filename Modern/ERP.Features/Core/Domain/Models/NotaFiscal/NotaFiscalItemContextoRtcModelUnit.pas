unit NotaFiscalItemContextoRtcModelUnit;

interface

uses
  Classes, SysUtils, Contnrs,
  EntityBaseUnit, StringNullableUnit;

type
  NotaFiscalItemContextoRtcModel = class(EntityBase)
  private
    FCodNf: Integer;
    FCodEmpresa: Integer;
    FNitem: Integer;
    FDfeTribId: StringNullable;
  public
    constructor Create(); overload;
    constructor Create(
      ACodNf: Integer;
      ACodEmpresa: Integer;
      ANitem: Integer;
      const ADfeTribId: StringNullable
    ); overload;

    function Clone(): EntityBase; override;

    property CodNf: Integer read FCodNf write FCodNf;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property Nitem: Integer read FNitem write FNitem;
    property DfeTribId: StringNullable read FDfeTribId write FDfeTribId;
  end;

  NotaFiscalItemContextoRtcModelList = class(TObjectList)
  private
    function GetItem(Index: Integer): NotaFiscalItemContextoRtcModel;
    procedure SetItem(Index: Integer; const Value: NotaFiscalItemContextoRtcModel);
  public
    property Items[Index: Integer]: NotaFiscalItemContextoRtcModel read GetItem write SetItem;
  end;

implementation

{ NotaFiscalItemContextoRtcModel }

constructor NotaFiscalItemContextoRtcModel.Create();
begin
  inherited Create;
end;

constructor NotaFiscalItemContextoRtcModel.Create(
  ACodNf: Integer;
  ACodEmpresa: Integer;
  ANitem: Integer;
  const ADfeTribId: StringNullable
);
begin
  Create();
  FCodNf := ACodNf;
  FCodEmpresa := ACodEmpresa;
  FNitem := ANitem;
  FDfeTribId := ADfeTribId;
end;

function NotaFiscalItemContextoRtcModel.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NotaFiscalItemContextoRtcModel.Create(
      FCodNf,
      FCodEmpresa,
      FNitem,
      FDfeTribId
    );
end;

{ NotaFiscalItemContextoRtcModelList }

function NotaFiscalItemContextoRtcModelList.GetItem(Index: Integer): NotaFiscalItemContextoRtcModel;
begin
  Result := NotaFiscalItemContextoRtcModel(inherited Items[Index]);
end;

procedure NotaFiscalItemContextoRtcModelList.SetItem(Index: Integer; const Value: NotaFiscalItemContextoRtcModel);
begin
  Put(Index, Value);
end;

end.
