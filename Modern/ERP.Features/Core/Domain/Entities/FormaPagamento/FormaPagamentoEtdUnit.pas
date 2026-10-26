unit FormaPagamentoEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  EntityBaseUnit,
  IntegerNullableUnit,
  StringNullableUnit,
  DateAndTimeNullableUnit,
  DoubleNullableUnit, StatusRegistroEnumUnit;

type
  FormaPagamentoEtd = class(EntityBase)
  private
    FSeqform: Integer;
    FCodEmpresa: Integer;
    FNrequisicao: IntegerNullable;
    FNdoc: StringNullable;
    FTipdoc: StringNullable;
    FCodControle: IntegerNullable;
    FCliente: StringNullable;
    FCodCliente: IntegerNullable;
    FHistorico: StringNullable;
    FDataMov: DateTimeNullable;
    FValordoc: DoubleNullable;
    FTpdocs: StringNullable;
    FNContaPlc: DoubleNullable;
    FDataVenc: DateTimeNullable;
    FPrcss: StringNullable;
    FOperador: IntegerNullable;
    FTipCnt: StringNullable;
    FOpCxl: IntegerNullable;
    FAtivo: StatusRegistroEnum;
    FNumNota: IntegerNullable;
    FSubSerie: IntegerNullable;
    FRecTipvend: StringNullable;
    FRecNumvend: IntegerNullable;
    FNProcessamento: IntegerNullable;
    FValorContabil: DoubleNullable;
    FCodUnificada: IntegerNullable;
  public
    constructor Create(); overload;
    constructor Create(
      ASeqform: Integer;
      ACodEmpresa: Integer;
      const ANrequisicao: IntegerNullable;
      const ANdoc: StringNullable;
      const ATipdoc: StringNullable;
      const ACodControle: IntegerNullable;
      const ACliente: StringNullable;
      const ACodCliente: IntegerNullable;
      const AHistorico: StringNullable;
      const ADataMov: DateTimeNullable;
      const AValordoc: DoubleNullable;
      const ATpdocs: StringNullable;
      const ANContaPlc: DoubleNullable;
      const ADataVenc: DateTimeNullable;
      const APrcss: StringNullable;
      const AOperador: IntegerNullable;
      const ATipCnt: StringNullable;
      const AOpCxl: IntegerNullable;
      const AAtivo: StatusRegistroEnum;
      const ANumNota: IntegerNullable;
      const ASubSerie: IntegerNullable;
      const ARecTipvend: StringNullable;
      const ARecNumvend: IntegerNullable;
      const ANProcessamento: IntegerNullable;
      const AValorContabil: DoubleNullable;
      const ACodUnificada: IntegerNullable
    ); overload;

    function Clone(): EntityBase; override;
    function IsEqualTo(const Other: FormaPagamentoEtd): Boolean;

    property SeqForm: Integer read FSeqform write FSeqform;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property NRequisicao: IntegerNullable read FNrequisicao write FNrequisicao;
    property NDoc: StringNullable read FNdoc write FNdoc;
    property TipDoc: StringNullable read FTipdoc write FTipdoc;
    property CodControle: IntegerNullable read FCodControle write FCodControle;
    property Cliente: StringNullable read FCliente write FCliente;
    property CodCliente: IntegerNullable read FCodCliente write FCodCliente;
    property Historico: StringNullable read FHistorico write FHistorico;
    property DataMov: DateTimeNullable read FDataMov write FDataMov;
    property Valordoc: DoubleNullable read FValordoc write FValordoc;
    property TpDocs: StringNullable read FTpdocs write FTpdocs;
    property NContaPlc: DoubleNullable read FNContaPlc write FNContaPlc;
    property DataVenc: DateTimeNullable read FDataVenc write FDataVenc;
    property Prcss: StringNullable read FPrcss write FPrcss;
    property Operador: IntegerNullable read FOperador write FOperador;
    property TipCnt: StringNullable read FTipCnt write FTipCnt;
    property OpCxl: IntegerNullable read FOpCxl write FOpCxl;
    property Ativo: StatusRegistroEnum read FAtivo write FAtivo;
    property NumNota: IntegerNullable read FNumNota write FNumNota;
    property SubSerie: IntegerNullable read FSubSerie write FSubSerie;
    property RecTipvend: StringNullable read FRecTipvend write FRecTipvend;
    property RecNumvend: IntegerNullable read FRecNumvend write FRecNumvend;
    property NProcessamento: IntegerNullable read FNProcessamento write FNProcessamento;
    property ValorContabil: DoubleNullable read FValorContabil write FValorContabil;
    property CodUnificada: IntegerNullable read FCodUnificada write FCodUnificada;
  end;

  FormaPagamentoEtdList = class(TObjectList)
  private
    function GetItem(Index: Integer): FormaPagamentoEtd;
    procedure SetItem(Index: Integer; const Value: FormaPagamentoEtd);
  public
    property Items[Index: Integer]: FormaPagamentoEtd read GetItem write SetItem;
  end;

implementation

{ FormaPagamentoEtd }

constructor FormaPagamentoEtd.Create();
begin
  inherited Create;
end;

constructor FormaPagamentoEtd.Create(
  ASeqform: Integer;
  ACodEmpresa: Integer;
  const ANrequisicao: IntegerNullable;
  const ANdoc: StringNullable;
  const ATipdoc: StringNullable;
  const ACodControle: IntegerNullable;
  const ACliente: StringNullable;
  const ACodCliente: IntegerNullable;
  const AHistorico: StringNullable;
  const ADataMov: DateTimeNullable;
  const AValordoc: DoubleNullable;
  const ATpdocs: StringNullable;
  const ANContaPlc: DoubleNullable;
  const ADataVenc: DateTimeNullable;
  const APrcss: StringNullable;
  const AOperador: IntegerNullable;
  const ATipCnt: StringNullable;
  const AOpCxl: IntegerNullable;
  const AAtivo: StatusRegistroEnum;
  const ANumNota: IntegerNullable;
  const ASubSerie: IntegerNullable;
  const ARecTipvend: StringNullable;
  const ARecNumvend: IntegerNullable;
  const ANProcessamento: IntegerNullable;
  const AValorContabil: DoubleNullable;
  const ACodUnificada: IntegerNullable
);
begin
  Create();
  FSeqform := ASeqform;
  FCodEmpresa := ACodEmpresa;
  FNrequisicao := ANrequisicao;
  FNdoc := ANdoc;
  FTipdoc := ATipdoc;
  FCodControle := ACodControle;
  FCliente := ACliente;
  FCodCliente := ACodCliente;
  FHistorico := AHistorico;
  FDataMov := ADataMov;
  FValordoc := AValordoc;
  FTpdocs := ATpdocs;
  FNContaPlc := ANContaPlc;
  FDataVenc := ADataVenc;
  FPrcss := APrcss;
  FOperador := AOperador;
  FTipCnt := ATipCnt;
  FOpCxl := AOpCxl;
  FAtivo := AAtivo;
  FNumNota := ANumNota;
  FSubSerie := ASubSerie;
  FRecTipvend := ARecTipvend;
  FRecNumvend := ARecNumvend;
  FNProcessamento := ANProcessamento;
  FValorContabil := AValorContabil;
  FCodUnificada := ACodUnificada;
end;

function FormaPagamentoEtd.Clone(): EntityBase;
begin
  if Self = nil then
    Result := nil
  else
    Result := FormaPagamentoEtd.Create(
      FSeqform,
      FCodEmpresa,
      FNrequisicao,
      FNdoc,
      FTipdoc,
      FCodControle,
      FCliente,
      FCodCliente,
      FHistorico,
      FDataMov,
      FValordoc,
      FTpdocs,
      FNContaPlc,
      FDataVenc,
      FPrcss,
      FOperador,
      FTipCnt,
      FOpCxl,
      FAtivo,
      FNumNota,
      FSubSerie,
      FRecTipvend,
      FRecNumvend,
      FNProcessamento,
      FValorContabil,
      FCodUnificada
    );
end;

function FormaPagamentoEtd.IsEqualTo(const Other: FormaPagamentoEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.SeqForm = Other.SeqForm)
      and (Self.CodEmpresa = Other.CodEmpresa)
      and Self.NRequisicao.IsEqualTo(Other.NRequisicao)
      and Self.NDoc.IsEqualTo(Other.NDoc)
      and Self.TipDoc.IsEqualTo(Other.TipDoc)
      and Self.CodControle.IsEqualTo(Other.CodControle)
      and Self.Cliente.IsEqualTo(Other.Cliente)
      and Self.CodCliente.IsEqualTo(Other.CodCliente)
      and Self.Historico.IsEqualTo(Other.Historico)
      and Self.DataMov.IsEqualTo(Other.DataMov)
      and Self.Valordoc.IsEqualTo(Other.Valordoc)
      and Self.TpDocs.IsEqualTo(Other.TpDocs)
      and Self.NContaPlc.IsEqualTo(Other.NContaPlc)
      and Self.DataVenc.IsEqualTo(Other.DataVenc)
      and Self.Prcss.IsEqualTo(Other.Prcss)
      and Self.Operador.IsEqualTo(Other.Operador)
      and Self.TipCnt.IsEqualTo(Other.TipCnt)
      and Self.OpCxl.IsEqualTo(Other.OpCxl)
      and (Self.Ativo = Other.Ativo)
      and Self.NumNota.IsEqualTo(Other.NumNota)
      and Self.SubSerie.IsEqualTo(Other.SubSerie)
      and Self.RecTipvend.IsEqualTo(Other.RecTipvend)
      and Self.RecNumvend.IsEqualTo(Other.RecNumvend)
      and Self.NProcessamento.IsEqualTo(Other.NProcessamento)
      and Self.ValorContabil.IsEqualTo(Other.ValorContabil)
      and Self.CodUnificada.IsEqualTo(Other.CodUnificada);
end;

{ FormaPagamentoEtdList }

function FormaPagamentoEtdList.GetItem(Index: Integer): FormaPagamentoEtd;
begin
  Result := FormaPagamentoEtd(inherited Items[Index]);
end;

procedure FormaPagamentoEtdList.SetItem(Index: Integer; const Value: FormaPagamentoEtd);
begin
  Put(Index, Value);
end;

end.
