unit HW.Comercio.Api.Pedido;

interface

uses
  HW.Json;

type
  TPedidoItem = class
  private
    FDescricao: String;
    FValorUnitario: Double;
    FProdutoId: Integer;
    FId: Integer;
    FValorTotal: Double;
    FQuantidade: Double;
    FPedidoId: Integer;
  published
    property Id: Integer read FId write FId;
    property PedidoId: Integer read FPedidoId write FPedidoId;
    property ProdutoId: Integer read FProdutoId write FProdutoId;
    property Descricao: String read FDescricao write FDescricao;
    property Quantidade: Double read FQuantidade write FQuantidade;// class
    property ValorUnitario: Double read FValorUnitario write FValorUnitario;// class
    property ValorTotal: Double read FValorTotal write FValorTotal;// class
    //property Produto: TObject read FProduto write FProduto;// class
  end;

  TPedidoCliente = class
  private
    FObservacao: String;
    FPedidoId: Integer;
    FNome: String;
    FTelefone: String;
  published
    property PedidoId: Integer read FPedidoId write FPedidoId;
    property Nome: String read FNome write FNome;
    property Telefone: String read FTelefone write FTelefone;
    property Observacao: String read FObservacao write FObservacao;
  end;

  TPedido = class
  private
    FValor: Double;
    FDataPedido: TDateTime;
    FItens: TArray<TPedidoItem>;
    FCliente: TPedidoCliente;
    FId: Integer;
    FPagamento: Integer;
    FStatus: Integer;
    FLojistaId: Integer;
  published
    property Id: Integer read FId write FId;
    property LojistaId: Integer read FLojistaId write FLojistaId;
    [LocalToUtcJson()]
    property DataPedido: TDateTime read FDataPedido write FDataPedido;
    property Valor: Double read FValor write FValor;// class
    property Status: Integer read FStatus write FStatus;
    property Pagamento: Integer read FPagamento write FPagamento;
    //property Lojista: TObject read FLojista write FLojista;// class
    property Cliente: TPedidoCliente read FCliente write FCliente;// class
    property Itens: TArray<TPedidoItem> read FItens write FItens;// Collection
  end;

implementation

end.
