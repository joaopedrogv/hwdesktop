unit HW.Utils.Classes.Registros.Ticket.Empresa_DX;

interface

uses
  HW.Utils.Classes.Registros_DX;

type

  TTicketEmpresa = class(THwClassRegistros)
  private
    Fcod_empresa: Integer;
    Femail_dest_gestor: String;
    Femail_remetente: String;
    Femail_dest_vendedor: String;
    Femail_senha: String;
    Femail_dest_notif: String;
    Femail_usassl: String;
    Femail_login: String;
    Femail_serv_smtp: String;
    Fnome: String;
    Femail_porta_smtp: Integer;
  published
    property cod_empresa: Integer read Fcod_empresa write Fcod_empresa;
    property nome: String read Fnome write Fnome;
    property email_porta_smtp: Integer read Femail_porta_smtp write Femail_porta_smtp;
    property email_usassl: String read Femail_usassl write Femail_usassl;
    property email_serv_smtp: String read Femail_serv_smtp write Femail_serv_smtp;
    property email_remetente: String read Femail_remetente write Femail_remetente;
    property email_dest_notif: String read Femail_dest_notif write Femail_dest_notif;
    property email_login: String read Femail_login write Femail_login;
    property email_senha: String read Femail_senha write Femail_senha;
    property email_dest_vendedor: String read Femail_dest_vendedor write Femail_dest_vendedor;
    property email_dest_gestor: String read Femail_dest_gestor write Femail_dest_gestor;
  end;


implementation

end.
