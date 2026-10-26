unit ContatoPlataformaModel;

interface

uses
  System.SysUtils, System.Classes, System.Rtti, System.SyncObjs, System.TypInfo,
  System.Generics.Collections, System.JSON, System.Generics.Defaults;

type
  TContatoPlataformaModel = class(TPersistent)
  private
    Fcod_cliente: Integer;
    Ftipo_pessoa: string;
    Fativo: Integer;
    Fid: Integer;
    Fid_msg_origem: Integer;
    Fid_msg_aplicativo: Integer;
    Faplicativo: string;
    Fid_msg_plataforma: Integer;
    Fplataforma: string;
    Fidentificador_bot: string;
    Faceita: string;
    Ftestar_email: string;
    Ftestar_celular: string;
    Fusar_template: string;
    Fcontato: string;
    Fidentificador: string;
    Fcod_carta: Integer;
    Fsinc_hwcloud: string;
  published
    property cod_cliente: Integer read Fcod_cliente write Fcod_cliente;
    property tipo_pessoa: string read Ftipo_pessoa write Ftipo_pessoa;
    property ativo: Integer read Fativo write Fativo;
    property id: Integer read Fid write Fid;
    property id_msg_origem: Integer read Fid_msg_origem write Fid_msg_origem;
    property id_msg_aplicativo: Integer read Fid_msg_aplicativo write Fid_msg_aplicativo;
    property aplicativo: string read Faplicativo write Faplicativo;
    property id_msg_plataforma: Integer read Fid_msg_plataforma write Fid_msg_plataforma;
    property plataforma: string read Fplataforma write Fplataforma;
    property identificador_bot: string read Fidentificador_bot write Fidentificador_bot;
    property aceita: string read Faceita write Faceita;
    property testar_email: string read Ftestar_email write Ftestar_email;
    property testar_celular: string read Ftestar_celular write Ftestar_celular;
    property usar_template: string read Fusar_template write Fusar_template;
    property contato: string read Fcontato write Fcontato;
    property identificador: string read Fidentificador write Fidentificador;
    property cod_carta: Integer read Fcod_carta write Fcod_carta;
    property sinc_hwcloud: string read Fsinc_hwcloud write Fsinc_hwcloud;
  end;

  TContatosPlataformaModel = class(TPersistent)
  private
    FContatos: TList<TContatoPlataformaModel>;
  public
    constructor Create();
    destructor Destroy; override;
  published
    property Contatos: TList<TContatoPlataformaModel> read FContatos write FContatos;
  end;

implementation

{ TContatosPlataformaModel }

constructor TContatosPlataformaModel.Create;
begin
  FContatos := TList<TContatoPlataformaModel>.Create;
end;

destructor TContatosPlataformaModel.Destroy;
begin
  FContatos.Free;
  inherited;
end;

end.
