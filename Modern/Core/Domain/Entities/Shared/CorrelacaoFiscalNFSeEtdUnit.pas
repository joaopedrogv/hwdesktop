unit CorrelacaoFiscalNFSeEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  EntityBaseUnit;

type
  CorrelacaoFiscalNFSeEtd = class(EntityBase)
  private
    FId: Integer;
    FClc116: string;
    FCnbs: string;
    FCindop: string;
    FCclasstrib: string;
  public
    constructor Create(); overload;
    constructor Create(
      AId: Integer;
      const AClc116: string;
      const ACnbs: string;
      const ACindop: string;
      const ACclasstrib: string
    ); overload;

    function Clone(): EntityBase; override;

    property Id: Integer read FId write FId;
    property Clc116: string read FClc116 write FClc116;
    property Cnbs: string read FCnbs write FCnbs;
    property Cindop: string read FCindop write FCindop;
    property Cclasstrib: string read FCclasstrib write FCclasstrib;
  end;

  CorrelacaoFiscalNFSeEtdList = class(TObjectList);

implementation

{ CorrelacaoFiscalNFSeEtd }

constructor CorrelacaoFiscalNFSeEtd.Create();
begin
  inherited Create;
end;

constructor CorrelacaoFiscalNFSeEtd.Create(
  AId: Integer;
  const AClc116: string;
  const ACnbs: string;
  const ACindop: string;
  const ACclasstrib: string
);
begin
  Create();
  FId := AId;
  FClc116 := AClc116;
  FCnbs := ACnbs;
  FCindop := ACindop;
  FCclasstrib := ACclasstrib;
end;

function CorrelacaoFiscalNFSeEtd.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := CorrelacaoFiscalNFSeEtd.Create(
      FId,
      FClc116,
      FCnbs,
      FCindop,
      FCclasstrib
    );
end;

end.
