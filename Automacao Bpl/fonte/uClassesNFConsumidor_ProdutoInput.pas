unit uClassesNFConsumidor_ProdutoInput;

interface

type
  

  TSetProdutoInput = class
  private
    FDesconto: Double;
    FValorTot: Double;
    FValorUnPrinc: Double;
    FDescricao: string;
    FCodigo: string;
    FValorUnVnd: Double;
    FUndVenda: string;
    FAlteracao: Boolean;
    FQtdeVenda: Double;
    FUndFator: Double;
    function GetValorUnPrinc: Double;
    function GetQtdePrinc: Double;
  public
    property Alteracao: Boolean read FAlteracao write FAlteracao;
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property UndVenda: string read FUndVenda write FUndVenda;
    property UndFator: Double read FUndFator write FUndFator;
    property QtdeVenda: Double read FQtdeVenda write FQtdeVenda;
    property QtdePrinc: Double read GetQtdePrinc;
    property ValorUnVnd: Double read FValorUnVnd write FValorUnVnd;
    property ValorUnPrinc: Double read GetValorUnPrinc;
    property ValorTot: Double read FValorTot write FValorTot;
    property Desconto: Double read FDesconto write FDesconto;
  end;

implementation

{ TSetProdutoInput }

function TSetProdutoInput.GetQtdePrinc: Double;
begin
  Result := FQtdeVenda / FUndFator;
end;

function TSetProdutoInput.GetValorUnPrinc: Double;
begin
  Result := FValorTot / Self.QtdePrinc;
end;

end.
/// origem	---   destino
/// 6 UND    =    1 CX
/// 1 CX     =    6 UND
///
///

