unit NFSeOSEtdUnit;

interface

uses
  SysUtils, Classes, Contnrs;

type
  NFSeOSEtd = class
  private
    FId: Integer;
    FNFSeId: string;
    FNumPed: Integer;
    FTipo: string;
    FCodEmpresa: Integer;
    FVServicos: Currency;
    FVDescontos: Currency;
    FVRetIrrf: Currency;
    FVRetCsll: Currency;
    FVRetCP: Currency;
    FVRetPis: Currency;
    FVRetCofins: Currency;
    FVRetIss: Currency;
  public
    constructor Create(
      AId: Integer;
      const ANFSeId: string;
      ANumPed: Integer;
      const ATipo: string;
      ACodEmpresa: Integer;
      AVServicos, AVDescontos, AVRetIrrf, AVRetCsll, AVRetCP, AVRetPis, AVRetCofins, AVRetIss: Currency
    );
    property Id: Integer read FId write FId;
    property NFSeId: string read FNFSeId write FNFSeId;
    property NumPed: Integer read FNumPed write FNumPed;
    property Tipo: string read FTipo;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property VServicos: Currency read FVServicos write FVServicos;
    property VDescontos: Currency read FVDescontos write FVDescontos;
    property VRetIrrf: Currency read FVRetIrrf write FVRetIrrf;
    property VRetCsll: Currency read FVRetCsll write FVRetCsll;
    property VRetCP: Currency read FVRetCP write FVRetCP;
    property VRetPis: Currency read FVRetPis write FVRetPis;
    property VRetCofins: Currency read FVRetCofins write FVRetCofins;
    property VRetIss: Currency read FVRetIss write FVRetIss;
  end;

  NFSeOSEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): NFSeOSEtd;
    procedure SetItem(Index: Integer; const Value: NFSeOSEtd);
  public
    property Items[Index: Integer]: NFSeOSEtd read GetItem write SetItem;
  end;

implementation

{ NFSeOSEtd }

constructor NFSeOSEtd.Create(
  AId: Integer;
  const ANFSeId: string;
  ANumPed: Integer;
  const ATipo: string;
  ACodEmpresa: Integer;
  AVServicos, AVDescontos, AVRetIrrf, AVRetCsll, AVRetCP, AVRetPis, AVRetCofins, AVRetIss: Currency
);
begin
  FId := AId;
  FNFSeId := ANFSeId;
  FNumPed := ANumPed;
  FTipo := ATipo;
  FCodEmpresa := ACodEmpresa;
  FVServicos := AVServicos;
  FVDescontos := AVDescontos;
  FVRetIrrf := AVRetIrrf;
  FVRetCsll := AVRetCsll;
  FVRetCP := AVRetCP;
  FVRetPis := AVRetPis;
  FVRetCofins := AVRetCofins;
  FVRetIss := AVRetIss;
end;

{ NFSeOSEtdList }

function NFSeOSEtdList.GetItem(Index: Integer): NFSeOSEtd;
begin
  Result := NFSeOSEtd(inherited Items[Index]);
end;

procedure NFSeOSEtdList.SetItem(Index: Integer; const Value: NFSeOSEtd);
begin
  Put(Index, Value);
end;

end.
