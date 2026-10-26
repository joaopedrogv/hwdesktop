unit HW.Utils.Classes.Registros.Ticket.Categoria_DX;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.Usuario_DX,
  HW.Utils.Classes.Registros.Ticket.Empresa_DX;

type

  TTicketCategoria = class(THwClassRegistros)
  private
    FCodEmpresa: Integer;
    FAtiva: Boolean;
    FCriadoPor: TUsuario;
    FEmpresa: TTicketEmpresa;
    FPadrao: Boolean;
    FPublica: Boolean;
    FNome: String;
    FGrupo: Integer;
    FCriadoPorID: Integer;
    FDataCriacao: string;
    FCategoriaID: Integer;
  published
    property CategoriaID: Integer read FCategoriaID write FCategoriaID;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property Nome: String read FNome write FNome;
    property Publica: Boolean read FPublica write FPublica;
    property Ativa: Boolean read FAtiva write FAtiva;
    property DataCriacao: string read FDataCriacao write FDataCriacao;
    property Grupo: Integer read FGrupo write FGrupo;
    property CriadoPorID: Integer read FCriadoPorID write FCriadoPorID;
    property CriadoPor: TUsuario read FCriadoPor write FCriadoPor;// class
    property Empresa: TTicketEmpresa read FEmpresa write FEmpresa;// class
    property Padrao: Boolean read FPadrao write FPadrao;
  end;

implementation

end.
