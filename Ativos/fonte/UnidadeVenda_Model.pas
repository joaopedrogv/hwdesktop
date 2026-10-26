unit UnidadeVenda_Model;

interface

uses
  ProdutosConversao_Model,
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  Variants;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  System.Variants;
{$ENDIF}

type
  TUnidadeVenda_Model = class(TProdutosConversao_Model)
  private
    Find        : Integer;
//    Fgrupo_prod : Integer;
//    Fcod_prod   : string;
//    Fcod_empresa: Integer;
//    Funid_princ : string;
//    Funid_vnd   : string;
//    Funid_pref  : string;
//    Ffator      : Double;
    function GetParidade: string;
  protected
    procedure InitializeObjects; override;
  public
    constructor Create;

    function CalculaPrincipal(vvnd: Double): Double;
    function CalculaVenda(vprinc: Double): Double;

    property paridade   : string  read GetParidade;
  published
    property ind        : Integer read Find         write Find;
//    property grupo_prod : Integer read Fgrupo_prod  write Fgrupo_prod;
//    property cod_prod   : string  read Fcod_prod    write Fcod_prod;
//    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
//    property unid_princ : string  read Funid_princ  write Funid_princ;
//    property unid_vnd   : string  read Funid_vnd    write Funid_vnd;
//    property unid_pref  : string  read Funid_pref   write Funid_pref;
//    property fator      : Double  read Ffator       write Ffator;
  end;

  TUnidadeVendas_Model = class(TBaseFbs_class)
  private
    function GetItem(Index: Integer): TUnidadeVenda_Model;
    procedure SetItem(Index: Integer; const Value: TUnidadeVenda_Model);
  public
    function New: TUnidadeVenda_Model;

    function GetConversaoPreferencialXML(ucom: string): TUnidadeVenda_Model;
    function GetConversao(undConversao: string; isVenda: Boolean): TUnidadeVenda_Model;
    function GetConversaoPorEan(cEAN: string): TUnidadeVenda_Model;
    function GetList(isVenda: Boolean): TUnidadeVendas_Model;
    function ListStrings(undFirst: string): TStrings;
    function GerarNovaUnidadeUnq(uCom, cEAN: string): string;
    // Normalmente a lista vai tratar apenas 1 produto, quando tratar mais de 1 produto na lista esse metodo poderá ser utilizado
    function GetUnd(grupoProd: Integer; codProd, undConversao: string): TUnidadeVenda_Model;

    property Items[Index: Integer]: TUnidadeVenda_Model read GetItem write SetItem;
  end;

implementation

uses
  Math,
  SysUtils,
  StrUtils,
  ean_utils;

{ TUnidadeVenda_Model }

function TUnidadeVenda_Model.GetParidade: string;
var
  op, sQtde: string;
begin                                 // 1 cx = 5 und     ----   0,2
  op := Copy(Self.operacao, 1, 1);
  if (Trim(op) = '') and (Self.fator > 0) then
    op := IfThen(Self.fator < 1, 'D', 'M');

  sQtde := IfThen(Self.quantidade <> 0, FloatToStr(Self.quantidade), '?');

  if Self.unid_princ = Self.unid_vnd then
    Result := ''
  else
  if op = 'D' then
    Result := '1' + Self.unid_vnd + ' = ' + sQtde + Self.unid_princ
  else if op = 'M' then
    Result := sQtde + Self.unid_vnd + ' = 1' + Self.unid_princ
  {
  if Self.fator > 1 then
    Result := Format('%s %s = 1 %s', [FloatToStr(RoundTo(Self.fator, -4)), unid_vnd, unid_princ])
  else if Self.fator > 0 then
    Result := Format('1 %s = %s %s', [unid_vnd, FloatToStr(RoundTo(1 / Self.fator, -4)), unid_princ ])
  }
  else
    Result := 'Sem conversão para ' + unid_vnd;
end;

procedure TUnidadeVenda_Model.InitializeObjects;
begin
  Ftable := TTableFb.Create('--ClassModelNoTable--');
end;

function TUnidadeVenda_Model.CalculaPrincipal(vvnd: Double): Double;
begin // UND = PRINC  |  5UND = 1CX  |  1 / 5 = Fator 0,2  |  1 / 0,2 = 5  |
  Result := vvnd / Self.fator;
end;

function TUnidadeVenda_Model.CalculaVenda(vprinc: Double): Double;
begin // UND = PRINC  |  5UND = 1CX  |  1 / 5 = Fator 0,2  |  5 * 0,2 = 5  |
  Result := vprinc * Self.fator;
end;

constructor TUnidadeVenda_Model.Create;
begin
  InitializeObjects;
end;

{ TUnidadeVendas_Model }

function TUnidadeVendas_Model.GerarNovaUnidadeUnq(uCom,
  cEAN: string): string;
var
  I, iLoop: Integer;
  it: TUnidadeVenda_Model;
  uTemp, uLoop, uEAN: string;
begin
  Result := '';
  uTemp := AnsiUpperCase(Trim(uCom));
  uLoop := uTemp;
  iLoop := 0;
  while True do
  begin
    iLoop := iLoop + 1;

    if GetConversao(uTemp, False) = nil then
    begin
      Result := uTemp;
      Exit;
    end;

//    if Length(uTemp) >= 6 then
//    begin
//      Result := GerarNovaUnidadeUnq(Copy(uTemp, 1, 6), cEAN);
//      Exit;
//    end;

    if (Length(Trim(cEAN)) = 14) and (iLoop = 1) then // pra fazer penas o teste 1 unica vez
    begin
      uEAN := uTemp + Copy(Trim(cEAN), 1, 1);
      if GetConversao(uEAN, False) = nil then
      begin
        Result := uEAN;
        Exit;
      end;
    end;

    uTemp := Copy(uLoop, 1, 6 - Length(IntToStr(iLoop))) + IntToStr(iLoop);

    if iLoop >= 99999 then
    begin
      Result := '';
      Exit;
    end;
  end;
end;

function TUnidadeVendas_Model.GetConversao(undConversao: string; isVenda: Boolean): TUnidadeVenda_Model;
var
  I: Integer;
begin
  Result := nil;
  if Trim(undConversao) = '' then
    Exit;

  for I := 0 to Self.Count - 1 do
    if (AnsiUpperCase(Self.Items[I].unid_vnd) = Trim(AnsiUpperCase(undConversao)))
      and ((not isVenda) or (Copy(Self.Items[I].disponivel_venda, 1, 1) = 'S'))
    then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

function TUnidadeVendas_Model.GetConversaoPorEan(
  cEAN: string): TUnidadeVenda_Model;
var
  I: Integer;
begin
  Result := nil;
  if Trim(cEAN) = '' then
    Exit;

  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].codigo_ean = Trim(cEAN)) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

function TUnidadeVendas_Model.GetConversaoPreferencialXML(
  ucom: string): TUnidadeVenda_Model;
var
  I: Integer;
begin
  Result := nil;
  if Trim(ucom) = '' then
    Exit;

  for I := 0 to Self.Count - 1 do
    if AnsiUpperCase(Self.Items[I].unid_pref) = Trim(AnsiUpperCase(ucom)) then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

function TUnidadeVendas_Model.GetItem(Index: Integer): TUnidadeVenda_Model;
begin
  Result := TUnidadeVenda_Model(inherited Items[Index]);
end;

function TUnidadeVendas_Model.GetList(
  isVenda: Boolean): TUnidadeVendas_Model;
var
  I: Integer;
  undItem: TUnidadeVenda_Model;
begin
  Result := TUnidadeVendas_Model.Create;

  for I := 0 to Self.Count - 1 do
    if ((not isVenda) or (Copy(Self.Items[I].disponivel_venda, 1, 1) = 'S')) then
    begin
      undItem := Result.New;
      undItem.CopyFrom(Self.Items[I]);
    end;
end;

function TUnidadeVendas_Model.GetUnd(grupoProd: Integer; codProd,
  undConversao: string): TUnidadeVenda_Model;
var
  I: Integer;
begin
  Result := nil;
  if Trim(undConversao) = '' then
    Exit;

  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].grupo_prod = grupoProd)
      and (Self.Items[I].cod_prod = Trim(codProd))
      and (Self.Items[I].unid_vnd = Trim(AnsiUpperCase(undConversao)))
    then
    begin
      Result := Self.Items[I];
      Break;
    end;
end;

function TUnidadeVendas_Model.ListStrings(undFirst: string): TStrings;
var
  I: Integer;
  undItem: TUnidadeVenda_Model;
begin
  Result := TStringList.Create;
  for I := 0 to Self.Count - 1 do
  begin
    undItem := TUnidadeVenda_Model.Create;
    undItem.CopyFrom(Self.Items[I]);

    Result.AddObject(undItem.unid_vnd, undItem);
  end;

  if Trim(undFirst) <> '' then
    if Result.IndexOf(Trim(undFirst)) >= 0 then
      Result.Move(Result.IndexOf(Trim(undFirst)), 0);
end;

function TUnidadeVendas_Model.New: TUnidadeVenda_Model;
begin
  Result := TUnidadeVenda_Model.Create;
  Add(Result);
end;

procedure TUnidadeVendas_Model.SetItem(Index: Integer; const Value: TUnidadeVenda_Model);
begin
  Put(Index, Value);
end;

initialization
  RegisterClass(TUnidadeVenda_Model);
finalization
  UnRegisterClass(TUnidadeVenda_Model);

end.
