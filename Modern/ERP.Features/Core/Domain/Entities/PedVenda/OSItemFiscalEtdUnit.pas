unit OSItemFiscalEtdUnit;

interface

uses
  Contnrs,
  EntityBaseUnit,
  TipoComunsUnit,
  IntegerNullableUnit,
  StringNullableUnit;

type
  OSItemFiscalEtd = class(EntityBase)
  private
    FOSId: Integer;
    FEmpresaId: Integer;
    FClienteId: Integer;
    FServicoId: IntegerNullable;
    FDataFechamento: TDate;
    FDescricao: string;
    FObservacaoOrdemServico: StringNullable;
    FDescricaoPredefinida: StringNullable;
    FValorServico: Currency;
    FValorAcrescimo: Currency;
    FValorDesconto: Currency;
    FIsTerceiro: Boolean;
    FCLC116: string;
    FCTribNac: string;
    FNFSeId: StringNullable;
    FNumNF: Int64Nullable;
    FNumRPSLegado: IntegerNullable;

    function GetValorLiquido: Currency;
  public
    constructor Create(
      AOSId: Integer;
      AEmpresaId: Integer;
      AClienteId: Integer;
      const AServicoId: IntegerNullable;
      ADataFechamento: TDate;
      const ADescricao: string;
      const AObservacaoOrdemServico: StringNullable;
      const ADescricaoPredefinida: StringNullable;
      AValorServico: Currency;
      AValorAcrescimo: Currency;
      AValorDesconto: Currency;
      const ACLC116: string;
      const ACTribNac: string;
      const ANFSeId: StringNullable;
      const ANumNF: Int64Nullable;
      const ANumRPSLegado: IntegerNullable;
      AIsTerceiro: Boolean
    );
    function Clone(): EntityBase; override;

    property OSId: Integer read FOSId;
    property EmpresaId: Integer read FEmpresaId;
    property ClienteId: Integer read FClienteId;
    property ServicoId: IntegerNullable read FServicoId;
    property DataFechamento: TDate read FDataFechamento;
    property Descricao: string read FDescricao;
    property ObservacaoOrdemServico: StringNullable read FObservacaoOrdemServico;
    property DescricaoPredefinida: StringNullable read FDescricaoPredefinida;
    property ValorServico: Currency read FValorServico;
    property ValorAcrescimo: Currency read FValorAcrescimo;
    property ValorDesconto: Currency read FValorDesconto;
    property ValorLiquido: Currency read GetValorLiquido;
    property IsTerceiro: Boolean read FIsTerceiro;
    property CLC116: string read FCLC116;
    property CTribNac: string read FCTribNac write FCTribNac;
    property NFSeId: StringNullable read FNFSeId;
    property NumNF: Int64Nullable read FNumNF;
    property NumRPSLegado: IntegerNullable read FNumRPSLegado;
  end;

  OSItemFiscalEtdlList = class(TObjectList)
  private
    function GetItem(Index: Integer): OSItemFiscalEtd;
    procedure SetItem(Index: Integer; const Value: OSItemFiscalEtd);
  public
    property Items[Index: Integer]: OSItemFiscalEtd read GetItem write SetItem; default;
  end;

implementation

{ OSItemFiscalEtd }

function OSItemFiscalEtd.Clone: EntityBase;
begin
  Result := OSItemFiscalEtd.Create(
    FOSId,
    FEmpresaId,
    FClienteId,
    FServicoId,
    FDataFechamento,
    FDescricao,
    FObservacaoOrdemServico,
    FDescricaoPredefinida,
    FValorServico,
    FValorAcrescimo,
    FValorDesconto,
    FCLC116,
    FCTribNac,
    FNFSeId,
    FNumNF,
    FNumRPSLegado,
    FIsTerceiro
  );
end;

constructor OSItemFiscalEtd.Create(
  AOSId: Integer;
  AEmpresaId: Integer;
  AClienteId: Integer;
  const AServicoId: IntegerNullable;
  ADataFechamento: TDate;
  const ADescricao: string;
  const AObservacaoOrdemServico: StringNullable;
  const ADescricaoPredefinida: StringNullable;
  AValorServico: Currency;
  AValorAcrescimo: Currency;
  AValorDesconto: Currency;
  const ACLC116: string;
  const ACTribNac: string;
  const ANFSeId: StringNullable;
  const ANumNF: Int64Nullable;
  const ANumRPSLegado: IntegerNullable;
  AIsTerceiro: Boolean
);
begin
  FOSId := AOSId;
  FEmpresaId := AEmpresaId;
  FClienteId := AClienteId;
  FServicoId := AServicoId;
  FDataFechamento := ADataFechamento;
  FDescricao := ADescricao;
  FObservacaoOrdemServico := AObservacaoOrdemServico;
  FDescricaoPredefinida := ADescricaoPredefinida;
  FValorServico := AValorServico;
  FValorAcrescimo := AValorAcrescimo;
  FValorDesconto := AValorDesconto;
  FIsTerceiro := AIsTerceiro;
  FCLC116 := ACLC116;
  FCTribNac := ACTribNac;
  FNFSeId := ANFSeId;
  FNumNF := ANumNF;
  FNumRPSLegado := ANumRPSLegado;
end;

function OSItemFiscalEtd.GetValorLiquido: Currency;
begin
  Result := FValorServico
    + FValorAcrescimo
    - FValorDesconto;
end;

{ OSItemFiscalEtdlList }

function OSItemFiscalEtdlList.GetItem(Index: Integer): OSItemFiscalEtd;
begin
  Result := OSItemFiscalEtd(inherited Items[Index]);
end;

procedure OSItemFiscalEtdlList.SetItem(Index: Integer; const Value: OSItemFiscalEtd);
begin
  Put(Index, Value);
end;

end.
