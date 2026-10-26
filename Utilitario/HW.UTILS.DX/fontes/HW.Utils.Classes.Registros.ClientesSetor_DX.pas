unit HW.Utils.Classes.Registros.ClientesSetor_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type
  TClientesSetor = class(THwClassRegistros)
  private
    FEmpresaID: Integer;
    FSetorID: Integer;
    FUsadoPorChat: Boolean;
    FClienteID: Integer;
  published
    property EmpresaID: Integer read FEmpresaID write FEmpresaID;
    property ClienteID: Integer read FClienteID write FClienteID;
    property SetorID: Integer read FSetorID write FSetorID;
    property UsadoPorChat: Boolean read FUsadoPorChat write FUsadoPorChat;
  end;


implementation

end.
