unit HW.Comercio.Api.ImagemProduto;

interface

type
  TImagemProduto = class
  private
    FLink: String;
    FProdutoId: Integer;
    FId: Integer;
  public
    property Id: Integer read FId write FId;
    property ProdutoId: Integer read FProdutoId write FProdutoId;
    property Link: String read FLink write FLink;
  end;

implementation

end.
