unit RegistroAjusteEFDPCVOUnit;

interface

uses
  SysUtils, Classes, Contnrs,
  TipoComunsUnit, RegistroAjusteDetalheEFDPCVOUnit;

type
  // Representa os registros M220 e M620 da EFD Contribuições
  RegistroAjusteEFDPCVO = class
  private
    FIndicador: Integer;
    FValor: Currency;
    FCodigo: string;
    FNumeroDocumento: string;
    FDescricao: string;
    FDataReferencia: TDate;
    FDetalhes: RegistroAjusteDetalheEFDPCVOList;
  public
    constructor Create(
      AIndicador: Integer; AValor: Currency; ACodigo, ANumeroDocumento, ADescricao: string; ADataReferencia: TDate);

    destructor Destroy; override;

    procedure AddValue(Amount: Currency);

    property Indicador: Integer read FIndicador;
    property Valor: Currency read FValor;
    property Codigo: string read FCodigo;
    property NumeroDocumento: string read FNumeroDocumento;
    property Descricao: string read FDescricao;
    property DataReferencia: TDate read FDataReferencia;
    property Detalhes: RegistroAjusteDetalheEFDPCVOList read FDetalhes;
  end;

  RegistroAjusteEFDPCVOList = class(TObjectList)
  private
    function GetItem(Index: Integer): RegistroAjusteEFDPCVO;
    procedure SetItem(Index: Integer; const Value: RegistroAjusteEFDPCVO);
  public
    function Obter(Indicador: Integer; const Codigo, NumeroDocumento, Descricao: string): RegistroAjusteEFDPCVO;

    property Items[Index: Integer]: RegistroAjusteEFDPCVO read GetItem write SetItem;
  end;

implementation

{ RegistroAjusteEFDPCVO }

procedure RegistroAjusteEFDPCVO.AddValue(Amount: Currency);
begin
  FValor := FValor + Amount;
end;

constructor RegistroAjusteEFDPCVO.Create(AIndicador: Integer; AValor: Currency; ACodigo, ANumeroDocumento, ADescricao: string;
  ADataReferencia: TDate);
begin
  FIndicador := AIndicador;
  FValor := AValor;
  FCodigo := ACodigo;
  FNumeroDocumento := ANumeroDocumento;
  FDescricao := ADescricao;
  FDataReferencia := ADataReferencia;

  FDetalhes := RegistroAjusteDetalheEFDPCVOList.Create();
end;

destructor RegistroAjusteEFDPCVO.Destroy;
begin
  FDetalhes.Free();
  inherited;
end;

{ RegistroAjusteEFDPCVOList }

function RegistroAjusteEFDPCVOList.GetItem(Index: Integer): RegistroAjusteEFDPCVO;
begin
  Result := RegistroAjusteEFDPCVO(inherited Items[Index]);
end;

function RegistroAjusteEFDPCVOList.Obter(Indicador: Integer; const Codigo, NumeroDocumento,
  Descricao: string): RegistroAjusteEFDPCVO;
var
  I: Integer;
begin
  for I := 0 to Self.Count - 1 do
  begin
    Result := GetItem(I);
    if (Result.Indicador = Indicador)
      and (Result.Codigo = Codigo)
      and (Result.NumeroDocumento = NumeroDocumento)
      and (Result.Descricao = Descricao)
    then
      Exit;
  end;

  Result := nil;
end;

procedure RegistroAjusteEFDPCVOList.SetItem(Index: Integer; const Value: RegistroAjusteEFDPCVO);
begin
  Put(Index, Value);
end;

end.
