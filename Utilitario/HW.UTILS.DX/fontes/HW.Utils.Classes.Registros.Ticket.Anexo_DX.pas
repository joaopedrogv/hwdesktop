unit HW.Utils.Classes.Registros.Ticket.Anexo_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type
  ///nao esta sendo usado mais
  TTicketAnexo = class(THwClassRegistros)
  private
    FMensagemID: Integer;
    FDescricao: String;
    FArquivo: String;
    FCaminhoArquivo: String;
    FAnexoID: Integer;
  published
    property AnexoID: Integer read FAnexoID write FAnexoID;
    property Descricao: String read FDescricao write FDescricao;
    property CaminhoArquivo: String read FCaminhoArquivo write FCaminhoArquivo;
    property Arquivo: String read FArquivo write FArquivo;
    property MensagemID: Integer read FMensagemID write FMensagemID;
  end;

implementation

end.
