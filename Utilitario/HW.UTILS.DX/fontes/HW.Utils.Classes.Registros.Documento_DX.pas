unit HW.Utils.Classes.Registros.Documento_DX;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.Ticket.Documento.Revisao_DX,
  HW.Utils.Classes.Registros.Ticket.Categoria_DX;

type

  TDocumento = class(THwClassRegistros)
  private
    Fcod_empresa: Integer;
    FRevisoes: TArray<TTicketRevisao>;
    Fativo: Boolean;
    Fdescricao: String;
    Fultima_revisao: string;
    FCategoria: TTicketCategoria;
    Fcod_cliente: Integer;
    Fcod_documento: Integer;
    //FRastreamento: TArray<TRastreamento>;
    Fcod_categoria: Integer;
    [JSONMarshalledAttribute(False)]
    FfilePath: string;
  published
    property cod_documento: Integer read Fcod_documento write Fcod_documento;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property descricao: String read Fdescricao write Fdescricao;
    property cod_categoria: Integer read Fcod_categoria write Fcod_categoria;
    property ultima_revisao: string read Fultima_revisao write Fultima_revisao;
    property ativo: Boolean read Fativo write Fativo;
    property Categoria: TTicketCategoria read FCategoria write FCategoria;// class
    property filePath: string read FfilePath write FfilePath;
    property Revisoes: TArray<TTicketRevisao> read FRevisoes write FRevisoes;// Collection
    //property Rastreamento: TArray<TRastreamento> read FRastreamento write FRastreamento;// Collection
  end;

implementation

end.
