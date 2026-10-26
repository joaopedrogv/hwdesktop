unit ConfigServerUseCase;

interface

uses
  UseCaseBase;

type
  TConfigServerUseCase = class(TUseCaseBase)
  public
    procedure Run();
  end;

implementation

{ TConfigServerUseCase }

uses
  uFormConfigServer,
  Vcl.Forms;

procedure TConfigServerUseCase.Run;
begin
  Application.CreateForm(TfrmConfigServer, frmConfigServer);
  frmConfigServer.paramsUC := paramsUC;
//  frmConfigServer.caixaId   := Self.caixaId;
//  frmConfigServer.dbpath    := repo.DataBasePath;
//  frmConfigServer.empresaId := repo.CodEmpresa;
  frmConfigServer.ShowModal;
end;

end.
