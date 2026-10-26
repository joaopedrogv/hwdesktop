unit HW.Utils.Classes.Registros.Ticket.Documento.Revisao_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type
  TDocumentoCopy = class(THwClassRegistros)
  private
    Fcod_empresa: Integer;
//    FRevisoes: TArray<TTicketRevisao>;
    Fativo: Boolean;
    Fdescricao: String;
    Fultima_revisao: string;
//    FCategoria: TTicketCategoria;
    Fcod_cliente: Integer;
    Fcod_documento: Integer;
    //FRastreamento: TArray<TRastreamento>;
    Fcod_categoria: Integer;
//    [JSONMarshalledAttribute(False)]
//    FfilePath: string;
  published
    property cod_documento: Integer read Fcod_documento write Fcod_documento;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property descricao: String read Fdescricao write Fdescricao;
    property cod_categoria: Integer read Fcod_categoria write Fcod_categoria;
    property ultima_revisao: string read Fultima_revisao write Fultima_revisao;
    property ativo: Boolean read Fativo write Fativo;
//    property Categoria: TTicketCategoria read FCategoria write FCategoria;// class
//    property filePath: string read FfilePath write FfilePath;
//    property Revisoes: TArray<TTicketRevisao> read FRevisoes write FRevisoes;// Collection
    //property Rastreamento: TArray<TRastreamento> read FRastreamento write FRastreamento;// Collection
  end;

  TTicketRevisao = class(THwClassRegistros)
  private
    Fcod_empresa: Integer;
    Fcaminho: String;
    Fdoc_nome: String;
    Frevisao: Integer;
    Fdata_validade: string;
    Fcod_cliente: Integer;
    Fdata_revisao: string;
    Fcod_documento: Integer;
    Fobservacoes: String;
    FDocumento: TDocumentoCopy;
  published
    property cod_documento: Integer read Fcod_documento write Fcod_documento;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property revisao: Integer read Frevisao write Frevisao;
    property caminho: String read Fcaminho write Fcaminho;
    property data_revisao: string read Fdata_revisao write Fdata_revisao;
    property data_validade: string read Fdata_validade write Fdata_validade;
    property doc_nome: String read Fdoc_nome write Fdoc_nome;
    property observacoes: String read Fobservacoes write Fobservacoes;
    property Documento: TDocumentoCopy read FDocumento write FDocumento;// class
  end;

implementation

end.
