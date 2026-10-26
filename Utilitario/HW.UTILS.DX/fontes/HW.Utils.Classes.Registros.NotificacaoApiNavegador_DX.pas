unit HW.Utils.Classes.Registros.NotificacaoApiNavegador_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type

  TNotificacaoApiNavegador = class(THwClassRegistros)
  private
    FTitulo: string;
    FSetorID: Integer;
    FForcarExibicao: Boolean;
    FMensagem: string;
    FIcone: string;
  public
    property Titulo: string read FTitulo write FTitulo;
    property Mensagem: string read FMensagem write FMensagem;
    property Icone: string read FIcone write FIcone;
    property ForcarExibicao: Boolean read FForcarExibicao write FForcarExibicao;
    property SetorID: Integer read FSetorID write FSetorID;
  end;

implementation

end.
