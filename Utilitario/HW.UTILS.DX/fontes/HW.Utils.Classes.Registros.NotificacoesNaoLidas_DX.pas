unit HW.Utils.Classes.Registros.NotificacoesNaoLidas_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type

  TNotificacoesNaoLidas = class(THwClassRegistros)
  private
    Ftitulo: String;
    Fdata_visualizacao: string;
    Fbody_html: String;
    Fheader_html: String;
    Fdata_cadastro: string;
    Fcod_notif: Integer;
  published
    property cod_notif: Integer read Fcod_notif write Fcod_notif;
    property titulo: String read Ftitulo write Ftitulo;
    property data_cadastro: string read Fdata_cadastro write Fdata_cadastro;
    property data_visualizacao: string read Fdata_visualizacao write Fdata_visualizacao;
    property header_html: String read Fheader_html write Fheader_html;
    property body_html: String read Fbody_html write Fbody_html;
  end;

implementation

end.
