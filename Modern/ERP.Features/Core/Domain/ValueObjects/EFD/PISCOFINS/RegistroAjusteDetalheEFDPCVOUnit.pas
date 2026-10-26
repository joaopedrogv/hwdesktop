unit RegistroAjusteDetalheEFDPCVOUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  TipoComunsUnit;

type
  // Representa os registros M225 e M625 da EFD Contribuições
  RegistroAjusteDetalheEFDPCVO = class
  private
    FDetalhamentoValor: Currency;
    FCSTPC: string;
    FDetalhamentoBCCredito: Currency;
    FDetalhamentoAliquota: Currency;
    FDataOperacao: TDate;
    FDescricao: string;
    FCodigoContaContabil: string;
    FInfComplementar: string;
  public
    constructor Create(
      ADetalhamentoValor: Currency;
      const ACSTPC: string;
      ADetalhamentoBCCredito, ADetalhamentoAliquota: Currency;
      ADataOperacao: TDate;
      const ADescricao, ACodigoContaContabil, AInfComplementar: string
    );

    property DetalhamentoValor: Currency read FDetalhamentoValor;
    property CSTPC: string read FCSTPC;
    property DetalhamentoBCCredito: Currency read FDetalhamentoBCCredito;
    property DetalhamentoAliquota: Currency read FDetalhamentoAliquota;
    property DataOperacao: TDate read FDataOperacao;
    property Descricao: string read FDescricao;
    property CodigoContaContabil: string read FCodigoContaContabil;
    property InfComplementar: string read FInfComplementar;
  end;

  RegistroAjusteDetalheEFDPCVOList = class(TObjectList)
  private
    function GetItem(Index: Integer): RegistroAjusteDetalheEFDPCVO;
    procedure SetItem(Index: Integer; const Value: RegistroAjusteDetalheEFDPCVO);
  public
    property Items[Index: Integer]: RegistroAjusteDetalheEFDPCVO read GetItem write SetItem;
  end;

implementation

{ RegistroAjusteDetalheEFDPCVO }

constructor RegistroAjusteDetalheEFDPCVO.Create(
  ADetalhamentoValor: Currency;
  const ACSTPC: string;
  ADetalhamentoBCCredito, ADetalhamentoAliquota: Currency;
  ADataOperacao: TDate;
  const ADescricao, ACodigoContaContabil, AInfComplementar: string
);
begin
  FDetalhamentoValor     := ADetalhamentoValor;
  FCSTPC                 := ACSTPC;
  FDetalhamentoBCCredito := ADetalhamentoBCCredito;
  FDetalhamentoAliquota  := ADetalhamentoAliquota;
  FDataOperacao          := ADataOperacao;
  FDescricao             := ADescricao;
  FCodigoContaContabil   := ACodigoContaContabil;
  FInfComplementar       := AInfComplementar;
end;

{ RegistroAjusteDetalheEFDPCVOList }

function RegistroAjusteDetalheEFDPCVOList.GetItem(Index: Integer): RegistroAjusteDetalheEFDPCVO;
begin
  Result := RegistroAjusteDetalheEFDPCVO(inherited Items[Index]);
end;

procedure RegistroAjusteDetalheEFDPCVOList.SetItem(Index: Integer; const Value: RegistroAjusteDetalheEFDPCVO);
begin
  Put(Index, Value);
end;

end.
