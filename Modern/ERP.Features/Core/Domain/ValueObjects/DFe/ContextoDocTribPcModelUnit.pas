unit ContextoDocTribPcModelUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  TipoComunsUnit, ModelosDFeEnumUnit;

type
  ContextoItemTribPcModel = record
  private
    FCST: string;
    FNCM: string;
    FNaturezaReceita: string;
    FValorLiquidoCobrado: Currency;
    FValorIpi: Currency;
    FValorIcms: Currency;
  public
    class function Create(
      const ACST, ANCM, ANaturezaReceita: string; AValorLiquidoCobrado, AValorIpi, AValorIcms: Currency
    ): ContextoItemTribPcModel; static;

    property CST: string read FCST;
    property NCM: string read FNCM;
    property NaturezaReceita: string read FNaturezaReceita;
    property ValorLiquidoCobrado: Currency read FValorLiquidoCobrado;
    property ValorIpi: Currency read FValorIpi;
    property ValorIcms: Currency read FValorIcms;
  end;

  ContextoItemTribPcModelArray = array of ContextoItemTribPcModel;

  ContextoDocTribPcModel = class
  private
    FChaveDFe: string;
    FData: TDate;
    FEmpresaId: Integer;
    FItens: ContextoItemTribPcModelArray;
    FModeloDFe: ModelosDFeEnum;
    FCodigoDoc: Integer;
    FRedBenefCalculado: Boolean;
  public
    constructor Create(
      AChaveDFe: string;
      AData: TDate;
      AEmpresaId: Integer;
      AModeloDFe: ModelosDFeEnum;
      ACodigoDoc: Integer;
      ARedBenefCalculado: Boolean
    );

    procedure SomaPorCstNcmNatRec(
      const ACST, ANCM, ANaturezaReceita: string; AValorLiquidoCobrado, AValorIpi, AValorIcms: Currency
    );

    property ChaveDFe: string read FChaveDFe;
    property Data: TDate read FData;
    property CodigoDoc: Integer read FCodigoDoc;
    property EmpresaId: Integer read FEmpresaId;
    property ModeloDFe: ModelosDFeEnum read FModeloDFe;
    property RedBenefCalculado: Boolean read FRedBenefCalculado;
    property Itens: ContextoItemTribPcModelArray read FItens;
  end;

  ContextoDocTribPcModelList = class(TObjectList)
  private
    function GetItem(Index: Integer): ContextoDocTribPcModel;
    procedure SetItem(Index: Integer; const Value: ContextoDocTribPcModel);
  public
    property Items[Index: Integer]: ContextoDocTribPcModel read GetItem write SetItem;
  end;

implementation

{ ContextoItemTribPcModel }

class function ContextoItemTribPcModel.Create(
  const ACST, ANCM, ANaturezaReceita: string; AValorLiquidoCobrado, AValorIpi, AValorIcms: Currency
): ContextoItemTribPcModel;
begin
  Result.FCST := ACST;
  Result.FNCM := ANCM;
  Result.FNaturezaReceita := ANaturezaReceita;
  Result.FValorLiquidoCobrado := AValorLiquidoCobrado;
  Result.FValorIpi := AValorIpi;
  Result.FValorIcms := AValorIcms;
end;

{ ContextoDocTribPcModel }

constructor ContextoDocTribPcModel.Create(
  AChaveDFe: string; AData: TDate; AEmpresaId: Integer; AModeloDFe: ModelosDFeEnum; ACodigoDoc: Integer;
  ARedBenefCalculado: Boolean
);
begin
  FChaveDFe := AChaveDFe;
  FData := AData;
  FEmpresaId := AEmpresaId;
  FModeloDFe := AModeloDFe;
  FCodigoDoc := ACodigoDoc;
  FRedBenefCalculado := ARedBenefCalculado;
  SetLength( FItens, 0);
end;

procedure ContextoDocTribPcModel.SomaPorCstNcmNatRec(const ACST, ANCM, ANaturezaReceita: string; AValorLiquidoCobrado,
  AValorIpi, AValorIcms: Currency);
var
  I: Integer;
begin
  for I := 0 to High(FItens) do
    if (FItens[I].CST = ACST)
      and (FItens[I].NaturezaReceita = ANaturezaReceita)
      and (FItens[I].NCM = ANCM) then
    begin
      FItens[I].FValorLiquidoCobrado := FItens[I].FValorLiquidoCobrado + AValorLiquidoCobrado;
      FItens[I].FValorIpi := FItens[I].FValorIpi + AValorIpi;
      FItens[I].FValorIcms := FItens[I].FValorIcms + AValorIcms;
      Exit;
    end;

  SetLength( FItens, Length(FItens) + 1 );

  FItens[High(FItens)] := ContextoItemTribPcModel.Create(
    ACST, ANCM, ANaturezaReceita, AValorLiquidoCobrado, AValorIpi, AValorIcms
  );
end;

{ ContextoDocTribPcModelList }

function ContextoDocTribPcModelList.GetItem(Index: Integer): ContextoDocTribPcModel;
begin
  Result := ContextoDocTribPcModel(inherited Items[Index]);
end;

procedure ContextoDocTribPcModelList.SetItem(Index: Integer; const Value: ContextoDocTribPcModel);
begin
  Put(Index, Value);
end;

end.