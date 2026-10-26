unit HW.Utils.Classes.Registros.Ticket.Documento.Rastreamento_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type

  TTicketDocumentoRastreamento = class(THwClassRegistros)
  private
    Fcod_empresa: Integer;
    Ftitulo: String;
    Fdescricao: String;
    Fcod_restreamento: Integer;
    Fparametro: String;
    Fcod_revisao: Integer;
    Fcod_cliente: Integer;
    Fcod_documento: Integer;
    Fdata: string;
  published
    property cod_revisao: Integer read Fcod_revisao write Fcod_revisao;
    property cod_documento: Integer read Fcod_documento write Fcod_documento;
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property cod_restreamento: Integer read Fcod_restreamento write Fcod_restreamento;
    property titulo: String read Ftitulo write Ftitulo;
    property descricao: String read Fdescricao write Fdescricao;
    property data: string read Fdata write Fdata;
    property parametro: String read Fparametro write Fparametro;
  end;

implementation

end.
