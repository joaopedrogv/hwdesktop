unit HW.Comercio.Api.Produto;

interface

uses
  System.Variants,
  HW.Comercio.Api.ImagemProduto,
  HW.Json;

type
  TProduto = class//(TJsonHw)
  private
    FValor: Double;
    FImagens: TArray<TImagemProduto>;
    FAtivo: Boolean;
    FDescricao: String;
    FCodigo: String;
    FEstoque: Double;
    FDescricaoCompleta: String;
    FId: Integer;
    FLojistaId: Integer;
    FValorPromocao: Double;
    FTipo: Integer;
    FDataFimPromocao: TDateTime;
    FDataInicioPromocao: TDateTime;
  published
    property Id: Integer read FId write FId;
    property LojistaId: Integer read FLojistaId write FLojistaId;
    property Codigo: String read FCodigo write FCodigo;
    property Descricao: String read FDescricao write FDescricao;
    property DescricaoCompleta: String read FDescricaoCompleta write FDescricaoCompleta;
    property Estoque: Double read FEstoque write FEstoque;// class
    property Valor: Double read FValor write FValor;// class
    property ValorPromocao: Double read FValorPromocao write FValorPromocao;// class
    [LocalToUtcJson()]
    property DataInicioPromocao: TDateTime read FDataInicioPromocao write FDataInicioPromocao;
    [LocalToUtcJson()]
    property DataFimPromocao: TDateTime read FDataFimPromocao write FDataFimPromocao;
    property Tipo: Integer read FTipo write FTipo;
    property Ativo: Boolean read FAtivo write FAtivo;
    //property Lojista: TObject read FLojista write FLojista;// class
    property Imagens: TArray<TImagemProduto> read FImagens write FImagens;// class
  end;

implementation

end.
