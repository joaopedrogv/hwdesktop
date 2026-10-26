unit HW.Utils.Classes.Registros.Setor_DX;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.ClientesSetor_DX;

type

  TSetor = class(THwClassRegistros)
  private
    FClientesSetores: TArray<TClientesSetor>;
    FAtivo: Boolean;
    FCodEmpresa: Integer;
    FSetorID: Integer;
    FUsadoPorChat: Boolean;
    FNome: String;
    FCriadoPorID: Integer;
    FDataCriacao: string;
  published
    property SetorID: Integer read FSetorID write FSetorID;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property Nome: String read FNome write FNome;
    property Ativo: Boolean read FAtivo write FAtivo;
    property DataCriacao: string read FDataCriacao write FDataCriacao;
    property CriadoPorID: Integer read FCriadoPorID write FCriadoPorID;
    property UsadoPorChat: Boolean read FUsadoPorChat write FUsadoPorChat;
    property ClientesSetores: TArray<TClientesSetor> read FClientesSetores write FClientesSetores;// Collection
  end;

implementation

end.
