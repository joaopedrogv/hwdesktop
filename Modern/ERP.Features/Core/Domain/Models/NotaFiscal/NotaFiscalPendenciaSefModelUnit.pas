unit NotaFiscalPendenciaSefModelUnit;

interface

uses
  Classes, SysUtils, Contnrs,
  EntityBaseUnit, StatusResolucaoNFeSefEnumUnit;

type
  NotaFiscalPendenciaSefModel = class(EntityBase)
  private
    FCodNf: Integer;
    FCodEmpresa: Integer;
    FDhemi: TDateTime;
    FStatusResolucao: StatusResolucaoNFeSefEnum;
    FCodNfPend: Integer;
    FNumNfContingencia: Integer;
    FSituacaoNfContingencia: string;
    FNumNfPendente: Integer;
    FSituacaoNfPendente: string;
  public
    constructor Create(); overload;
    constructor Create(
      ACodNf: Integer;
      ACodEmpresa: Integer;
      ADhemi: TDateTime;
      const AStatusResolucao: StatusResolucaoNFeSefEnum;
      ACodNfPend: Integer;
      ANumNfContingencia: Integer;
      const ASituacaoNfContingencia: string;
      ANumNfPendente: Integer;
      const ASituacaoNfPendente: string
    ); overload;

    function Clone(): EntityBase; override;

    property CodNf: Integer read FCodNf write FCodNf;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property Dhemi: TDateTime read FDhemi write FDhemi;
    property StatusResolucao: StatusResolucaoNFeSefEnum read FStatusResolucao write FStatusResolucao;
    property CodNfPend: Integer read FCodNfPend write FCodNfPend;
    property NumNfContingencia: Integer read FNumNfContingencia;
    property SituacaoNfContingencia: string read FSituacaoNfContingencia;
    property NumNfPendente: Integer read FNumNfPendente;
    property SituacaoNfPendente: string read FSituacaoNfPendente;
  end;

  NotaFiscalPendenciaSefModelList = class(TObjectList)
  private
    function GetItem(Index: Integer): NotaFiscalPendenciaSefModel;
    procedure SetItem(Index: Integer; const Value: NotaFiscalPendenciaSefModel);
  public
    property Items[Index: Integer]: NotaFiscalPendenciaSefModel read GetItem write SetItem;
  end;

implementation

{ NotaFiscalPendenciaSefModel }

constructor NotaFiscalPendenciaSefModel.Create();
begin
  inherited Create;
end;

constructor NotaFiscalPendenciaSefModel.Create(
  ACodNf: Integer;
  ACodEmpresa: Integer;
  ADhemi: TDateTime;
  const AStatusResolucao: StatusResolucaoNFeSefEnum;
  ACodNfPend: Integer;
  ANumNfContingencia: Integer;
  const ASituacaoNfContingencia: string;
  ANumNfPendente: Integer;
  const ASituacaoNfPendente: string
);
begin
  Create();
  FCodNf := ACodNf;
  FCodEmpresa := ACodEmpresa;
  FDhemi := ADhemi;
  FStatusResolucao := AStatusResolucao;
  FCodNfPend := ACodNfPend;
  FNumNfContingencia := ANumNfContingencia;
  FSituacaoNfContingencia := ASituacaoNfContingencia;
  FNumNfPendente := ANumNfPendente;
  FSituacaoNfPendente := ASituacaoNfPendente;
end;

function NotaFiscalPendenciaSefModel.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NotaFiscalPendenciaSefModel.Create(
      FCodNf,
      FCodEmpresa,
      FDhemi,
      FStatusResolucao,
      FCodNfPend,
      FNumNfContingencia,
      FSituacaoNfContingencia,
      FNumNfPendente,
      FSituacaoNfPendente
    );
end;

{ NotaFiscalPendenciaSefModelList }

function NotaFiscalPendenciaSefModelList.GetItem(Index: Integer): NotaFiscalPendenciaSefModel;
begin
  Result := NotaFiscalPendenciaSefModel(inherited Items[Index]);
end;

procedure NotaFiscalPendenciaSefModelList.SetItem(Index: Integer; const Value: NotaFiscalPendenciaSefModel);
begin
  Put(Index, Value);
end;

end.
