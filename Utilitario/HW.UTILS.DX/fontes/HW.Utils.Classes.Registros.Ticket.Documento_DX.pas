unit HW.Utils.Classes.Registros.Ticket.Documento_DX;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.Ticket.Categoria_DX,
  HW.Utils.Classes.Registros.Ticket.Documento.Revisao_DX,
  REST.Json.Types;

type

  TTicketDocumento = class(THwClassRegistros)
  private
    Fcod_empresa: Integer;
    Fcod_mensagem: Integer;
    FRevisao: TTicketRevisao;
    Fcod_revisao: Integer;
    Fcod_cliente: Integer;
    Fcod_documento: Integer;
    [JSONMarshalledAttribute(False)]
    FfilePath: string;
  published
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property cod_documento: Integer read Fcod_documento write Fcod_documento;
    property cod_revisao: Integer read Fcod_revisao write Fcod_revisao;
    property cod_mensagem: Integer read Fcod_mensagem write Fcod_mensagem;
    property Revisao: TTicketRevisao read FRevisao write FRevisao;// class
    property filePath: string read FfilePath write FfilePath;
  end;


implementation

end.
