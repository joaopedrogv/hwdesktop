unit EventoDFe211130ItensUnit;

interface

uses
  TipoComunsUnit,
  EventoDFe211130ItemEtdUnit;

type
  EventoDFe211130Itens = class
  public
    class function Normalizar(const AItens: EventoDFe211130ItemEtdArray):
      EventoDFe211130ItemEtdArray; static;
    class function Validar(const AItens: EventoDFe211130ItemEtdArray;
      out AErros: TArrayString): Boolean; static;
    class function Iguais(const A, B: EventoDFe211130ItemEtdArray): Boolean; static;
  end;

implementation

uses
  SysUtils;

const
  QUANTIDADE_MINIMA_ITENS = 1;
  QUANTIDADE_MAXIMA_ITENS = 990;
  NITEM_MINIMO = 1;
  NITEM_MAXIMO = 990;
  FATOR_VALOR = 100;
  FATOR_QUANTIDADE = 10000;
  TAMANHO_MAXIMO_UNIDADE = 6;
  TOLERANCIA_CASAS = 0.0001;

function PossuiCasasAte(const AValor: Currency; AFator: Integer): Boolean;
begin
  // O produto em Currency preserva a escala do domínio; a tolerância cobre a
  // conversão para Extended feita por Frac.
  Result := Abs(Frac(AValor * AFator)) <= TOLERANCIA_CASAS;
end;

procedure AdicionarErro(var AErros: TArrayString; const AMensagem: string);
var
  Quantidade: Integer;
begin
  Quantidade := Length(AErros);
  SetLength(AErros, Quantidade + 1);
  AErros[Quantidade] := AMensagem;
end;

{ EventoDFe211130Itens }

class function EventoDFe211130Itens.Normalizar(
  const AItens: EventoDFe211130ItemEtdArray): EventoDFe211130ItemEtdArray;
var
  I, J: Integer;
  Atual: EventoDFe211130ItemEtd;
begin
  SetLength(Result, Length(AItens));

  for I := 0 to High(AItens) do
    Result[I] := EventoDFe211130ItemEtd.Create(
      AItens[I].NItem,
      AItens[I].VIbs,
      AItens[I].VCbs,
      AItens[I].QImobilizado,
      Trim(AItens[I].UImobilizado)
    );

  for I := 1 to High(Result) do
  begin
    Atual := Result[I];
    J := I - 1;
    while (J >= 0) and (Result[J].NItem > Atual.NItem) do
    begin
      Result[J + 1] := Result[J];
      Dec(J);
    end;
    Result[J + 1] := Atual;
  end;
end;

class function EventoDFe211130Itens.Validar(
  const AItens: EventoDFe211130ItemEtdArray;
  out AErros: TArrayString): Boolean;
var
  I, J: Integer;
  Item: EventoDFe211130ItemEtd;
begin
  SetLength(AErros, 0);

  if (Length(AItens) < QUANTIDADE_MINIMA_ITENS) or
     (Length(AItens) > QUANTIDADE_MAXIMA_ITENS) then
  begin
    AdicionarErro(AErros, Format('O evento deve possuir entre %d e %d itens.',
      [QUANTIDADE_MINIMA_ITENS, QUANTIDADE_MAXIMA_ITENS]));
    Result := False;
    Exit;
  end;

  for I := 0 to High(AItens) do
  begin
    Item := AItens[I];

    if (Item.NItem < NITEM_MINIMO) or (Item.NItem > NITEM_MAXIMO) then
      AdicionarErro(AErros, Format('nItem %d deve estar entre %d e %d.',
        [Item.NItem, NITEM_MINIMO, NITEM_MAXIMO]));

    for J := 0 to I - 1 do
      if AItens[J].NItem = Item.NItem then
      begin
        AdicionarErro(AErros, Format('nItem %d está repetido no evento.',
          [Item.NItem]));
        Break;
      end;

    if Item.VIbs < 0 then
      AdicionarErro(AErros, Format('Item %d: valor de IBS não pode ser negativo.',
        [Item.NItem]))
    else if not PossuiCasasAte(Item.VIbs, FATOR_VALOR) then
      AdicionarErro(AErros, Format('Item %d: valor de IBS deve ter no máximo 2 casas decimais.',
        [Item.NItem]));

    if Item.VCbs < 0 then
      AdicionarErro(AErros, Format('Item %d: valor de CBS não pode ser negativo.',
        [Item.NItem]))
    else if not PossuiCasasAte(Item.VCbs, FATOR_VALOR) then
      AdicionarErro(AErros, Format('Item %d: valor de CBS deve ter no máximo 2 casas decimais.',
        [Item.NItem]));

    if Item.QImobilizado < 0 then
      AdicionarErro(AErros, Format('Item %d: quantidade não pode ser negativa.',
        [Item.NItem]))
    else if not PossuiCasasAte(Item.QImobilizado, FATOR_QUANTIDADE) then
      AdicionarErro(AErros, Format('Item %d: quantidade deve ter no máximo 4 casas decimais.',
        [Item.NItem]));

    if (Length(Trim(Item.UImobilizado)) < 1) or
       (Length(Trim(Item.UImobilizado)) > TAMANHO_MAXIMO_UNIDADE) then
      AdicionarErro(AErros, Format('Item %d: unidade deve ter entre 1 e %d caracteres.',
        [Item.NItem, TAMANHO_MAXIMO_UNIDADE]));
  end;

  Result := Length(AErros) = 0;
end;

class function EventoDFe211130Itens.Iguais(
  const A, B: EventoDFe211130ItemEtdArray): Boolean;
var
  NormalizadoA, NormalizadoB: EventoDFe211130ItemEtdArray;
  I: Integer;
begin
  Result := False;

  NormalizadoA := Normalizar(A);
  NormalizadoB := Normalizar(B);

  if Length(NormalizadoA) <> Length(NormalizadoB) then
    Exit;

  for I := 0 to High(NormalizadoA) do
    if (NormalizadoA[I].NItem <> NormalizadoB[I].NItem) or
       (NormalizadoA[I].VIbs <> NormalizadoB[I].VIbs) or
       (NormalizadoA[I].VCbs <> NormalizadoB[I].VCbs) or
       (NormalizadoA[I].QImobilizado <> NormalizadoB[I].QImobilizado) or
       (NormalizadoA[I].UImobilizado <> NormalizadoB[I].UImobilizado) then
      Exit;

  Result := True;
end;

end.
