unit HW.Utils.Classes.Registros.NotificacoesNaoLidasERP_DX;

interface

uses
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Registros.NotificacoesNaoLidas_DX;

type
  TNotificacoesNaoLidasERP = class
  private
    Femail: String;
    Fcod_usuario: Integer;
    Fnotificacoes: TArray<TNotificacoesNaoLidas>;
  published
    property cod_usuario: Integer read Fcod_usuario write Fcod_usuario;
    property email: String read Femail write Femail;
    property notificacoes: TArray<TNotificacoesNaoLidas> read Fnotificacoes write Fnotificacoes;// Collection
  end;

implementation

end.
