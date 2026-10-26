unit NotaFiscalPendenciaSefEtdUnit;

interface

uses
  Classes, SysUtils, Contnrs,
  EntityBaseUnit, StatusResolucaoNFeSefEnumUnit;

type
  NotaFiscalPendenciaSefEtd = class(EntityBase)
  private
    FCodNf: Integer;
    FCodEmpresa: Integer;
    FDhemi: TDateTime;
    FStatusResolucao: StatusResolucaoNFeSefEnum;
    FCodNfPend: Integer;
  public
    constructor Create(); overload;
    constructor Create(
      ACodNf: Integer;
      ACodEmpresa: Integer;
      ADhemi: TDateTime;
      const AStatusResolucao: StatusResolucaoNFeSefEnum;
      ACodNfPend: Integer
    ); overload;

    function Clone(): EntityBase; override;

    property CodNf: Integer read FCodNf write FCodNf;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property Dhemi: TDateTime read FDhemi write FDhemi;
    property StatusResolucao: StatusResolucaoNFeSefEnum read FStatusResolucao write FStatusResolucao;
    property CodNfPend: Integer read FCodNfPend write FCodNfPend;
  end;

  NotaFiscalPendenciaSefEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): NotaFiscalPendenciaSefEtd;
    procedure SetItem(Index: Integer; const Value: NotaFiscalPendenciaSefEtd);
  public
    property Items[Index: Integer]: NotaFiscalPendenciaSefEtd read GetItem write SetItem;
  end;

implementation

{ NotaFiscalPendenciaSefEtd }

constructor NotaFiscalPendenciaSefEtd.Create();
begin
  inherited Create;
end;

constructor NotaFiscalPendenciaSefEtd.Create(
  ACodNf: Integer;
  ACodEmpresa: Integer;
  ADhemi: TDateTime;
  const AStatusResolucao: StatusResolucaoNFeSefEnum;
  ACodNfPend: Integer
);
begin
  Create();
  FCodNf := ACodNf;
  FCodEmpresa := ACodEmpresa;
  FDhemi := ADhemi;
  FStatusResolucao := AStatusResolucao;
  FCodNfPend := ACodNfPend;
end;

function NotaFiscalPendenciaSefEtd.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := NotaFiscalPendenciaSefEtd.Create(
      FCodNf,
      FCodEmpresa,
      FDhemi,
      FStatusResolucao,
      FCodNfPend
    );
end;

{ NotaFiscalPendenciaSefEtdList }

function NotaFiscalPendenciaSefEtdList.GetItem(Index: Integer): NotaFiscalPendenciaSefEtd;
begin
  Result := NotaFiscalPendenciaSefEtd(inherited Items[Index]);
end;

procedure NotaFiscalPendenciaSefEtdList.SetItem(Index: Integer; const Value: NotaFiscalPendenciaSefEtd);
begin
  Put(Index, Value);
end;

end.
