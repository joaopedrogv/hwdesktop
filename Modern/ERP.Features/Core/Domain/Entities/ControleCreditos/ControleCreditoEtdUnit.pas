unit ControleCreditoEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  EntityBaseUnit,
  IntegerNullableUnit,
  DoubleNullableUnit,
  StringNullableUnit,
  DateAndTimeNullableUnit;

type
  ControleCreditoEtd = class(EntityBase)
  private
    FCodCred: Integer;
    FCodEmpresa: Integer;
    FNContaPlc: Double;
    FCodigoCtrl: Integer;
    FCodCliente: IntegerNullable;
    FNomeC: StringNullable;
    FDataEntrada: DateTimeNullable;
    FTipoDoc: StringNullable;
    FHistorico: StringNullable;
    FDataVencimento: DateTimeNullable;
    FValorCredito: DoubleNullable;
    FStatus: StringNullable;
    FDataQuitacao: DateTimeNullable;
    FTpDocVenda: StringNullable;
    FNDocVenda: IntegerNullable;
    FNDocCredito: StringNullable;
    FTipCnt: StringNullable;
  public
    constructor Create(); overload;
    constructor Create(
      ACodCred: Integer;
      ACodEmpresa: Integer;
      ANContaPlc: Double;
      ACodigoCtrl: Integer;
      const ACodCliente: IntegerNullable;
      const ANomeC: StringNullable;
      const ADataEntrada: DateTimeNullable;
      const ATipoDoc: StringNullable;
      const AHistorico: StringNullable;
      const ADataVencimento: DateTimeNullable;
      const AValorCredito: DoubleNullable;
      const AStatus: StringNullable;
      const ADataQuitacao: DateTimeNullable;
      const ATpDocVenda: StringNullable;
      const ANDocVenda: IntegerNullable;
      const ANDocCredito: StringNullable;
      const ATipCnt: StringNullable
    ); overload;

    function Clone(): EntityBase; override;
    function IsEqualTo(const Other: ControleCreditoEtd): Boolean;

    property CodCred: Integer read FCodCred write FCodCred;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property NContaPlc: Double read FNContaPlc write FNContaPlc;
    property CodigoCtrl: Integer read FCodigoCtrl write FCodigoCtrl;
    property CodCliente: IntegerNullable read FCodCliente write FCodCliente;
    property NomeC: StringNullable read FNomeC write FNomeC;
    property DataEntrada: DateTimeNullable read FDataEntrada write FDataEntrada;
    property TipoDoc: StringNullable read FTipoDoc write FTipoDoc;
    property Historico: StringNullable read FHistorico write FHistorico;
    property DataVencimento: DateTimeNullable read FDataVencimento write FDataVencimento;
    property ValorCredito: DoubleNullable read FValorCredito write FValorCredito;
    property Status: StringNullable read FStatus write FStatus;
    property DataQuitacao: DateTimeNullable read FDataQuitacao write FDataQuitacao;
    property TpDocVenda: StringNullable read FTpDocVenda write FTpDocVenda;
    property NDocVenda: IntegerNullable read FNDocVenda write FNDocVenda;
    property NDocCredito: StringNullable read FNDocCredito write FNDocCredito;
    property TipCnt: StringNullable read FTipCnt write FTipCnt;
  end;

  ControleCreditoEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): ControleCreditoEtd;
    procedure SetItem(Index: Integer; const Value: ControleCreditoEtd);
  public
    property Items[Index: Integer]: ControleCreditoEtd read GetItem write SetItem;
  end;

implementation

{ ControleCreditoEtd }

constructor ControleCreditoEtd.Create();
begin
  inherited Create;
end;

constructor ControleCreditoEtd.Create(
  ACodCred: Integer;
  ACodEmpresa: Integer;
  ANContaPlc: Double;
  ACodigoCtrl: Integer;
  const ACodCliente: IntegerNullable;
  const ANomeC: StringNullable;
  const ADataEntrada: DateTimeNullable;
  const ATipoDoc: StringNullable;
  const AHistorico: StringNullable;
  const ADataVencimento: DateTimeNullable;
  const AValorCredito: DoubleNullable;
  const AStatus: StringNullable;
  const ADataQuitacao: DateTimeNullable;
  const ATpDocVenda: StringNullable;
  const ANDocVenda: IntegerNullable;
  const ANDocCredito: StringNullable;
  const ATipCnt: StringNullable
);
begin
  Create();
  FCodCred := ACodCred;
  FCodEmpresa := ACodEmpresa;
  FNContaPlc := ANContaPlc;
  FCodigoCtrl := ACodigoCtrl;
  FCodCliente := ACodCliente;
  FNomeC := ANomeC;
  FDataEntrada := ADataEntrada;
  FTipoDoc := ATipoDoc;
  FHistorico := AHistorico;
  FDataVencimento := ADataVencimento;
  FValorCredito := AValorCredito;
  FStatus := AStatus;
  FDataQuitacao := ADataQuitacao;
  FTpDocVenda := ATpDocVenda;
  FNDocVenda := ANDocVenda;
  FNDocCredito := ANDocCredito;
  FTipCnt := ATipCnt;
end;

function ControleCreditoEtd.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := ControleCreditoEtd.Create(
      FCodCred,
      FCodEmpresa,
      FNContaPlc,
      FCodigoCtrl,
      FCodCliente,
      FNomeC,
      FDataEntrada,
      FTipoDoc,
      FHistorico,
      FDataVencimento,
      FValorCredito,
      FStatus,
      FDataQuitacao,
      FTpDocVenda,
      FNDocVenda,
      FNDocCredito,
      FTipCnt
    );
end;

function ControleCreditoEtd.IsEqualTo(const Other: ControleCreditoEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.CodCred = Other.CodCred)
      and (Self.CodEmpresa = Other.CodEmpresa)
      and (Self.NContaPlc = Other.NContaPlc)
      and (Self.CodigoCtrl = Other.CodigoCtrl)
      and Self.CodCliente.IsEqualTo(Other.CodCliente)
      and Self.NomeC.IsEqualTo(Other.NomeC)
      and Self.DataEntrada.IsEqualTo(Other.DataEntrada)
      and Self.TipoDoc.IsEqualTo(Other.TipoDoc)
      and Self.Historico.IsEqualTo(Other.Historico)
      and Self.DataVencimento.IsEqualTo(Other.DataVencimento)
      and Self.ValorCredito.IsEqualTo(Other.ValorCredito)
      and Self.Status.IsEqualTo(Other.Status)
      and Self.DataQuitacao.IsEqualTo(Other.DataQuitacao)
      and Self.TpDocVenda.IsEqualTo(Other.TpDocVenda)
      and Self.NDocVenda.IsEqualTo(Other.NDocVenda)
      and Self.NDocCredito.IsEqualTo(Other.NDocCredito)
      and Self.TipCnt.IsEqualTo(Other.TipCnt);
end;

{ ControleCreditoEtdList }

function ControleCreditoEtdList.GetItem(Index: Integer): ControleCreditoEtd;
begin
  Result := ControleCreditoEtd(inherited Items[Index]);
end;

procedure ControleCreditoEtdList.SetItem(Index: Integer; const Value: ControleCreditoEtd);
begin
  Put(Index, Value);
end;

end.
