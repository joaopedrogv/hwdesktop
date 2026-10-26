unit FinalizarNFSeServiceUnit;

interface

uses
  SysUtils, Classes,
  IFinalizarNFSeServiceUnit, INFSeRepositoryUnit;

type
  // Servico que executa todos os processamentos relacionados
  FinalizarNFSeService = class(TInterfacedObject, IFinalizarNFSeService)
  private
    FNFSeRepo: INFSeRepository;
  public
    constructor Create(
      NFSeRepo: INFSeRepository
    );
    procedure Executar(const NFSeId: string; EmpresaId: Integer);
  end;

implementation



{ FinalizarNFSeService }

constructor FinalizarNFSeService.Create(NFSeRepo: INFSeRepository);
begin
  FNFSeRepo := NFSeRepo;
end;

procedure FinalizarNFSeService.Executar(const NFSeId: string; EmpresaId: Integer);
begin

  // * Update pedvenda
  // * Update pedvenda_serv
  // * Update boletos
  // * Update formpagamento
  // * Update NFSe campo FINALIZADA = 1

end;

end.
