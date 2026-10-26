unit Hw.Integra.Api.Boleto;

interface

type
  TBoleto = class
  private
    FempresaId: Integer;
    Fvalor: Double;
    FmoraDiaria: Double;
    Fativo: Integer;
    FhtmlBoleto: String;
    FnossoNumeroBanco: String;
    FdataVencimento: TDateTime;
    FboletoId: Integer;
    Fmulta: Double;
    Fstatus: String;
    FdataEmissao: TDateTime;
    FvendaId: Integer;
    FnumerodDoc: String;
    FclienteId: Integer;
    FvendaTipo: String;
  public
    property boletoId: Integer read FboletoId write FboletoId;
    property empresaId: Integer read FempresaId write FempresaId;
    property clienteId: Integer read FclienteId write FclienteId;
    property vendaTipo: String read FvendaTipo write FvendaTipo;
    property vendaId: Integer read FvendaId write FvendaId;
    property dataEmissao: TDateTime read FdataEmissao write FdataEmissao;
    property dataVencimento: TDateTime read FdataVencimento write FdataVencimento;
    property numerodDoc: String read FnumerodDoc write FnumerodDoc;
    property valor: Double read Fvalor write Fvalor;
    property multa: Double read Fmulta write Fmulta;
    property moraDiaria: Double read FmoraDiaria write FmoraDiaria;
    property nossoNumeroBanco: String read FnossoNumeroBanco write FnossoNumeroBanco;
    property status: String read Fstatus write Fstatus;
    property htmlBoleto: String read FhtmlBoleto write FhtmlBoleto;
    property ativo: Integer read Fativo write Fativo;
  end;

implementation

end.
