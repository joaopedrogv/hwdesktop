unit uSpedHwClasses;

interface

uses
  StdCtrls, ComCtrls, Classes, System.Generics.Collections, System.Contnrs;

type
  TSpedHWTipo0200 = (t0200Prod, t0200Serv, t0200Out, t0200Veic, t0200Desp);

  TReg0190 = class
  private
    FUnid: string;
    FDescr: string;
  published
    property Unid: string read FUnid write FUnid;
    property Descr: string read FDescr write FDescr;
  end;

  TReg0220 = class
  private
    FUnid: string;
    FFator: Double;
  published
    property Unid: string read FUnid write FUnid;
    property Fator: Double read FFator write FFator;
  end;

  TReg0221 = class
  private
    FCodigoAtomico: string;
    FQuantidade: Double;
  published
    property CodigoAtomico: string read FCodigoAtomico write FCodigoAtomico;
    property Quantidade: Double read FQuantidade write FQuantidade;
  end;

  TReg0200 = class
  private
    FGrupo_prod: Integer;
    FCod_prod: string;
    FUnid: string;
    FFatoresConv: TObjectList<TReg0220>;
    FTipo: TSpedHWTipo0200;
    FCodigosComerc: TObjectList<TReg0221>;
  public
    constructor Create;
    destructor Destroy; override;

  published
    property Tipo: TSpedHWTipo0200 read FTipo write FTipo;
    property Grupo_prod: Integer read FGrupo_prod write FGrupo_prod;
    property Cod_prod: string read FCod_prod write FCod_prod;
    property Unid: string read FUnid write FUnid;

    property FatoresConv: TObjectList<TReg0220> read FFatoresConv write FFatoresConv;
    property CodigosComerc: TObjectList<TReg0221> read FCodigosComerc write FCodigosComerc;

  end;

//  TReg0200List = class(TObjectList)
//  private
//    function GetItem(Index: Integer): TReg0200; /// GetItem
//    procedure SetItem(Index: Integer; const Value: TReg0200); /// SetItem
//  public
//    function New: TReg0200;
//    property Items[Index: Integer]: TReg0200 read GetItem write SetItem;
//  end;

  TSpedHwProd = class(TObjectList<TReg0200>)
  private
//    FProdutos: TObjectList<TReg0200>;
    FUnidades: TObjectList<TReg0190>;
    function GetProd(AGrupo: Integer; ACodigo: string): TReg0200;
    procedure SetProd(AGrupo: Integer; ACodigo: string; const Value: TReg0200);
  public
    constructor Create;
    destructor Destroy; override;

    function AddProduto(Grupo: Integer; Codigo, Unidade: string): TReg0200; overload;
    function AddProduto(Grupo: Integer; Codigo, UnidPrincipal, UnidConvertida: string; QtdePrincipal, QtdeConvertida: Double): TReg0200; overload;

//    function Get0220(Grupo: Integer; Codigo, Unidade: string): TObjectList<TReg0220>;
//    function Get0200(Grupo: Integer; Codigo, Unidade: string): TReg0200;

    function IndexOfProd(Grupo: Integer; Codigo: string): Integer;
    property Prods[AGrupo: Integer; ACodigo: string]: TReg0200 read GetProd write SetProd;
  published
//    property Produtos: TObjectList<TReg0200> read FProdutos write FProdutos;
    property Unidades: TObjectList<TReg0190> read FUnidades write FUnidades;
  end;

implementation

{ TReg0200 }

uses
  System.SysUtils;

constructor TReg0200.Create;
begin
  FFatoresConv := TObjectList<TReg0220>.Create;
  FCodigosComerc := TObjectList<TReg0221>.Create;
end;

destructor TReg0200.Destroy;
begin
  FFatoresConv.Clear;
  FFatoresConv.Free;
  FCodigosComerc.Clear;
  FCodigosComerc.Free;
  inherited;
end;

{ TSpedHwProd }

function TSpedHwProd.AddProduto(Grupo: Integer; Codigo, UnidPrincipal,
  UnidConvertida: string; QtdePrincipal, QtdeConvertida: Double): TReg0200;
var
  I: Integer;
  found: Boolean;
  prod: TReg0200;
  fat: TReg0220;
begin
  UnidPrincipal := UnidPrincipal.ToUpper.Trim;
  UnidConvertida := UnidConvertida.ToUpper.Trim;

  found := False;
  for I := 0 to Self.Count - 1 do
    if found then
      Break
    else
    begin
      found := (Self.Items[I].Tipo = t0200Prod) and
               (Self.Items[I].Grupo_prod = Grupo) and
               (Self.Items[I].Cod_prod = Codigo.Trim);
      if found then
        prod := Self.Items[I];
    end;

  if not found then
  begin
    prod := TReg0200.Create;
    prod.Tipo := t0200Prod;
    prod.Grupo_prod := Grupo;
    prod.Cod_prod := Codigo.Trim;
    prod.Unid := UnidPrincipal;

    Self.Add(prod);
  end;

  if prod.Unid <> UnidConvertida then
  begin
    found := False;
    for I := 0 to prod.FatoresConv.Count - 1 do
      if found then
        Break
      else
        found := UnidConvertida = prod.FatoresConv.Items[I].Unid;

    if not found then
    begin
      fat := TReg0220.Create;
      fat.Unid := UnidConvertida;
      fat.Fator := QtdePrincipal / QtdeConvertida;

      prod.FatoresConv.Add(fat);
    end;
  end;

  Result := prod;
end;

function TSpedHwProd.AddProduto(Grupo: Integer; Codigo,
  Unidade: string): TReg0200;
begin
  Result := AddProduto(Grupo, Codigo, Unidade, Unidade, 1, 1);
end;

constructor TSpedHwProd.Create();
begin
  inherited;
  Unidades := TObjectList<TReg0190>.Create();
end;

destructor TSpedHwProd.Destroy;
begin
  Unidades.Clear;
  Unidades.Free;

  Self.Clear;
  inherited;
end;
{
function TSpedHwProd.Get0220(Grupo: Integer; Codigo,
  Unidade: string): TObjectList<TReg0220>;
var
  found: Boolean;
  I: Integer;
  prod: TReg0200;
  fat: TReg0220;
begin
  Result := TObjectList<TReg0220>.Create();

  found := False;
  for I := 0 to Self.Count - 1 do
    if found then
      Break
    else
    begin
      found := (Self.Items[I].Tipo = t0200Prod) and
               (Self.Items[I].Grupo_prod = Grupo) and
               (Self.Items[I].Cod_prod = Codigo.Trim);
      if found then
        prod := Self.Items[I];
    end;

  if not found then
    Exit;

  //nesse momento o parametro recebido deve ser a unidade do produto, entao caso algum documento ficou diferente entao é adicionado na conversao
  if prod.Unid <> Unidade.Trim then
  begin
    found := False;
    for I := 0 to prod.FatoresConv.Count - 1 do
      if found then
        Break
      else
        found := prod.Unid = prod.FatoresConv.Items[I].Unid;

    if not found then
    begin
      fat := TReg0220.Create;
      fat.Unid := prod.Unid;
      fat.Fator := 1;

      prod.FatoresConv.Add(fat);
    end;

    prod.Unid := Unidade.Trim;
  end;

  for I := 0 to prod.FatoresConv.Count - 1 do
    if not prod.FatoresConv.Items[I].Unid.Equals(Unidade.Trim) then
    begin
      fat := TReg0220.Create;
      fat.Unid := prod.FatoresConv.Items[I].Unid;
      fat.Fator := prod.FatoresConv.Items[I].Fator;
      Result.Add(fat);
    end;
end;
}
function TSpedHwProd.GetProd(AGrupo: Integer; ACodigo: string): TReg0200;
begin
  Result := nil;
  var idx := IndexOfProd(AGrupo, ACodigo);

  if idx > -1 then
    Result := Self.Items[idx];
end;

function TSpedHwProd.IndexOfProd(Grupo: Integer; Codigo: string): Integer;
begin
  Result := -1;

  for var I := 0 to Self.Count - 1 do
    if (Self.Items[I].Tipo = t0200Prod) and
       (Self.Items[I].Grupo_prod = Grupo) and
       (Self.Items[I].Cod_prod.Trim = Codigo.Trim) then
    begin
      Result := I;
      Break;
    end;
end;

procedure TSpedHwProd.SetProd(AGrupo: Integer; ACodigo: string;
  const Value: TReg0200);
begin
  var idx := IndexOfProd(AGrupo, ACodigo);

  if idx > -1 then
    Self.Items[idx] := Value;
end;

end.
