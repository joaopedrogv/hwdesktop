// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://valadares.sigiss.com.br/valadares/ws/sigiss_ws.php?wsdl
//  >Import : https://valadares.sigiss.com.br/valadares/ws/sigiss_ws.php?wsdl>0
// Encoding : ISO-8859-1
// Version  : 1.0
// (03/04/2018 15:42:55 - - $Rev: 86412 $)
// ************************************************************************ //

unit sigiss_ws;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  tcDadosPrestador     = class;                 { "urn:sigiss_ws"[GblCplx] }
  tcDadosNota          = class;                 { "urn:sigiss_ws"[GblCplx] }
  tcDadosConsultaNota  = class;                 { "urn:sigiss_ws"[GblCplx] }
  tcDadosCancelaNota   = class;                 { "urn:sigiss_ws"[GblCplx] }
  tcDescricaoRps       = class;                 { "urn:sigiss_ws"[GblCplx] }
  tcEstruturaDescricaoErros = class;            { "urn:sigiss_ws"[GblCplx] }
  tcRetornoNota        = class;                 { "urn:sigiss_ws"[GblCplx] }



  // ************************************************************************ //
  // XML       : tcDadosPrestador, global, <complexType>
  // Namespace : urn:sigiss_ws
  // ************************************************************************ //
  tcDadosPrestador = class(TRemotable)
  private
    Fccm: Integer;
    Fcnpj: string;
    Fsenha: string;
    Fcrc: string;
    Fcrc_estado: string;
    Faliquota_simples: string;
  published
    property ccm:              Integer  read Fccm write Fccm;
    property cnpj:             string   read Fcnpj write Fcnpj;
    property senha:            string   read Fsenha write Fsenha;
    property crc:              string   read Fcrc write Fcrc;
    property crc_estado:       string   read Fcrc_estado write Fcrc_estado;
    property aliquota_simples: string   read Faliquota_simples write Faliquota_simples;
  end;



  // ************************************************************************ //
  // XML       : tcDadosNota, global, <complexType>
  // Namespace : urn:sigiss_ws
  // ************************************************************************ //
  tcDadosNota = class(TRemotable)
  private
    Fnota: Integer;
    Fid_sis_legado: string;
    Fautenticidade: string;
    Fdt_conversao: string;
    Fnum_rps: Integer;
    Fserie_rps: string;
    Femissao_rps: string;
    Fprestador_razao: string;
    Fprestador_endereco: string;
    Fprestador_numero: string;
    Fprestador_complemento: string;
    Fprestador_bairro: string;
    Fprestador_cidade: string;
    Fprestador_estado: string;
    Fprestador_cep: string;
    Fprestador_email: string;
    Fvalor: string;
    Fbase: string;
    Fservico: Integer;
    Faliquota_atividade: string;
    Fiss: string;
    Fcnpj_tomador: string;
    Frazao_tomador: string;
    Fendereco_tomador: string;
    Fnumero_tomador: string;
    Fcomplemento_tomador: string;
    Fbairro_tomador: string;
    Fcidade_tomador: string;
    Festado_tomador: string;
    Fcep_tomador: string;
    Femail_tomador: string;
    Fdescricao: string;
    FISSRetido: string;
    FStatusNFe: string;
    Fsituacao: string;
    FOpcaoSimples: string;
    FLinkImpressao: string;
  published
    property nota:                  Integer  read Fnota write Fnota;
    property id_sis_legado:         string   read Fid_sis_legado write Fid_sis_legado;
    property autenticidade:         string   read Fautenticidade write Fautenticidade;
    property dt_conversao:          string   read Fdt_conversao write Fdt_conversao;
    property num_rps:               Integer  read Fnum_rps write Fnum_rps;
    property serie_rps:             string   read Fserie_rps write Fserie_rps;
    property emissao_rps:           string   read Femissao_rps write Femissao_rps;
    property prestador_razao:       string   read Fprestador_razao write Fprestador_razao;
    property prestador_endereco:    string   read Fprestador_endereco write Fprestador_endereco;
    property prestador_numero:      string   read Fprestador_numero write Fprestador_numero;
    property prestador_complemento: string   read Fprestador_complemento write Fprestador_complemento;
    property prestador_bairro:      string   read Fprestador_bairro write Fprestador_bairro;
    property prestador_cidade:      string   read Fprestador_cidade write Fprestador_cidade;
    property prestador_estado:      string   read Fprestador_estado write Fprestador_estado;
    property prestador_cep:         string   read Fprestador_cep write Fprestador_cep;
    property prestador_email:       string   read Fprestador_email write Fprestador_email;
    property valor:                 string   read Fvalor write Fvalor;
    property base:                  string   read Fbase write Fbase;
    property servico:               Integer  read Fservico write Fservico;
    property aliquota_atividade:    string   read Faliquota_atividade write Faliquota_atividade;
    property iss:                   string   read Fiss write Fiss;
    property cnpj_tomador:          string   read Fcnpj_tomador write Fcnpj_tomador;
    property razao_tomador:         string   read Frazao_tomador write Frazao_tomador;
    property endereco_tomador:      string   read Fendereco_tomador write Fendereco_tomador;
    property numero_tomador:        string   read Fnumero_tomador write Fnumero_tomador;
    property complemento_tomador:   string   read Fcomplemento_tomador write Fcomplemento_tomador;
    property bairro_tomador:        string   read Fbairro_tomador write Fbairro_tomador;
    property cidade_tomador:        string   read Fcidade_tomador write Fcidade_tomador;
    property estado_tomador:        string   read Festado_tomador write Festado_tomador;
    property cep_tomador:           string   read Fcep_tomador write Fcep_tomador;
    property email_tomador:         string   read Femail_tomador write Femail_tomador;
    property descricao:             string   read Fdescricao write Fdescricao;
    property ISSRetido:             string   read FISSRetido write FISSRetido;
    property StatusNFe:             string   read FStatusNFe write FStatusNFe;
    property situacao:              string   read Fsituacao write Fsituacao;
    property OpcaoSimples:          string   read FOpcaoSimples write FOpcaoSimples;
    property LinkImpressao:         string   read FLinkImpressao write FLinkImpressao;
  end;



  // ************************************************************************ //
  // XML       : tcDadosConsultaNota, global, <complexType>
  // Namespace : urn:sigiss_ws
  // ************************************************************************ //
  tcDadosConsultaNota = class(TRemotable)
  private
    Fnota: Integer;
    Fserie: string;
    Fvalor: string;
    Fprestador_ccm: Integer;
    Fprestador_cnpj: string;
    Fautenticidade: string;
  published
    property nota:           Integer  read Fnota write Fnota;
    property serie:          string   read Fserie write Fserie;
    property valor:          string   read Fvalor write Fvalor;
    property prestador_ccm:  Integer  read Fprestador_ccm write Fprestador_ccm;
    property prestador_cnpj: string   read Fprestador_cnpj write Fprestador_cnpj;
    property autenticidade:  string   read Fautenticidade write Fautenticidade;
  end;



  // ************************************************************************ //
  // XML       : tcDadosCancelaNota, global, <complexType>
  // Namespace : urn:sigiss_ws
  // ************************************************************************ //
  tcDadosCancelaNota = class(TRemotable)
  private
    Fccm: Integer;
    Fcnpj: string;
    Fsenha: string;
    Fnota: Integer;
    Fmotivo: string;
    Femail: string;
  published
    property ccm:    Integer  read Fccm write Fccm;
    property cnpj:   string   read Fcnpj write Fcnpj;
    property senha:  string   read Fsenha write Fsenha;
    property nota:   Integer  read Fnota write Fnota;
    property motivo: string   read Fmotivo write Fmotivo;
    property email:  string   read Femail write Femail;
  end;



  // ************************************************************************ //
  // XML       : tcDescricaoRps, global, <complexType>
  // Namespace : urn:sigiss_ws
  // ************************************************************************ //
  tcDescricaoRps = class(TRemotable)
  private
    Fccm: string;
    Fcnpj: string;
    Fsenha: string;
    Fcrc: string;
    Fcrc_estado: string;
    Faliquota_simples: string;
    Fid_sis_legado: string;
    Fservico: Integer;
    Fsituacao: string;
    Fvalor: string;
    Fbase: string;
    FdescricaoNF: string;
    Ftomador_tipo: Integer;
    Ftomador_cnpj: string;
    Ftomador_email: string;
    Ftomador_ie: string;
    Ftomador_im: string;
    Ftomador_razao: string;
    Ftomador_fantasia: string;
    Ftomador_endereco: string;
    Ftomador_numero: string;
    Ftomador_complemento: string;
    Ftomador_bairro: string;
    Ftomador_CEP: string;
    Ftomador_cod_cidade: string;
    Ftomador_fone: string;
    Ftomador_ramal: string;
    Ftomador_fax: string;
    Frps_num: Integer;
    Frps_serie: string;
    Frps_dia: Integer;
    Frps_mes: Integer;
    Frps_ano: Integer;
    Foutro_municipio: Integer;
    Fcod_outro_municipio: Integer;
    Fretencao_iss: string;
    Fpis: string;
    Fcofins: string;
    Finss: string;
    Firrf: string;
    Fcsll: string;
    Ftipo_obra: Integer;
    Ftipo_obra_Specified: boolean;
    Fdia_emissao: Integer;
    Fdia_emissao_Specified: boolean;
    Fmes_emissao: Integer;
    Fmes_emissao_Specified: boolean;
    Fano_emissao: Integer;
    Fano_emissao_Specified: boolean;
    procedure Settipo_obra(Index: Integer; const AInteger: Integer);
    function  tipo_obra_Specified(Index: Integer): boolean;
    procedure Setdia_emissao(Index: Integer; const AInteger: Integer);
    function  dia_emissao_Specified(Index: Integer): boolean;
    procedure Setmes_emissao(Index: Integer; const AInteger: Integer);
    function  mes_emissao_Specified(Index: Integer): boolean;
    procedure Setano_emissao(Index: Integer; const AInteger: Integer);
    function  ano_emissao_Specified(Index: Integer): boolean;
  published
    property ccm:                 string   read Fccm write Fccm;
    property cnpj:                string   read Fcnpj write Fcnpj;
    property senha:               string   read Fsenha write Fsenha;
    property crc:                 string   read Fcrc write Fcrc;
    property crc_estado:          string   read Fcrc_estado write Fcrc_estado;
    property aliquota_simples:    string   read Faliquota_simples write Faliquota_simples;
    property id_sis_legado:       string   read Fid_sis_legado write Fid_sis_legado;
    property servico:             Integer  read Fservico write Fservico;
    property situacao:            string   read Fsituacao write Fsituacao;
    property valor:               string   read Fvalor write Fvalor;
    property base:                string   read Fbase write Fbase;
    property descricaoNF:         string   read FdescricaoNF write FdescricaoNF;
    property tomador_tipo:        Integer  read Ftomador_tipo write Ftomador_tipo;
    property tomador_cnpj:        string   read Ftomador_cnpj write Ftomador_cnpj;
    property tomador_email:       string   read Ftomador_email write Ftomador_email;
    property tomador_ie:          string   read Ftomador_ie write Ftomador_ie;
    property tomador_im:          string   read Ftomador_im write Ftomador_im;
    property tomador_razao:       string   read Ftomador_razao write Ftomador_razao;
    property tomador_fantasia:    string   read Ftomador_fantasia write Ftomador_fantasia;
    property tomador_endereco:    string   read Ftomador_endereco write Ftomador_endereco;
    property tomador_numero:      string   read Ftomador_numero write Ftomador_numero;
    property tomador_complemento: string   read Ftomador_complemento write Ftomador_complemento;
    property tomador_bairro:      string   read Ftomador_bairro write Ftomador_bairro;
    property tomador_CEP:         string   read Ftomador_CEP write Ftomador_CEP;
    property tomador_cod_cidade:  string   read Ftomador_cod_cidade write Ftomador_cod_cidade;
    property tomador_fone:        string   read Ftomador_fone write Ftomador_fone;
    property tomador_ramal:       string   read Ftomador_ramal write Ftomador_ramal;
    property tomador_fax:         string   read Ftomador_fax write Ftomador_fax;
    property rps_num:             Integer  read Frps_num write Frps_num;
    property rps_serie:           string   read Frps_serie write Frps_serie;
    property rps_dia:             Integer  read Frps_dia write Frps_dia;
    property rps_mes:             Integer  read Frps_mes write Frps_mes;
    property rps_ano:             Integer  read Frps_ano write Frps_ano;
    property outro_municipio:     Integer  read Foutro_municipio write Foutro_municipio;
    property cod_outro_municipio: Integer  read Fcod_outro_municipio write Fcod_outro_municipio;
    property retencao_iss:        string   read Fretencao_iss write Fretencao_iss;
    property pis:                 string   read Fpis write Fpis;
    property cofins:              string   read Fcofins write Fcofins;
    property inss:                string   read Finss write Finss;
    property irrf:                string   read Firrf write Firrf;
    property csll:                string   read Fcsll write Fcsll;
    property tipo_obra:           Integer  Index (IS_OPTN) read Ftipo_obra write Settipo_obra stored tipo_obra_Specified;
    property dia_emissao:         Integer  Index (IS_OPTN) read Fdia_emissao write Setdia_emissao stored dia_emissao_Specified;
    property mes_emissao:         Integer  Index (IS_OPTN) read Fmes_emissao write Setmes_emissao stored mes_emissao_Specified;
    property ano_emissao:         Integer  Index (IS_OPTN) read Fano_emissao write Setano_emissao stored ano_emissao_Specified;
  end;

  tcDescricaoErros = array of tcEstruturaDescricaoErros;   { "urn:sigiss_ws"[GblCplx] }


  // ************************************************************************ //
  // XML       : tcEstruturaDescricaoErros, global, <complexType>
  // Namespace : urn:sigiss_ws
  // ************************************************************************ //
  tcEstruturaDescricaoErros = class(TRemotable)
  private
    Fid: Integer;
    FDescricaoProcesso: string;
    FDescricaoErro: string;
  published
    property id:                Integer  read Fid write Fid;
    property DescricaoProcesso: string   read FDescricaoProcesso write FDescricaoProcesso;
    property DescricaoErro:     string   read FDescricaoErro write FDescricaoErro;
  end;



  // ************************************************************************ //
  // XML       : tcRetornoNota, global, <complexType>
  // Namespace : urn:sigiss_ws
  // ************************************************************************ //
  tcRetornoNota = class(TRemotable)
  private
    FResultado: Integer;
    FNota: Integer;
    FLinkImpressao: string;
    Fautenticidade: string;
  published
    property Resultado:     Integer  read FResultado write FResultado;
    property Nota:          Integer  read FNota write FNota;
    property LinkImpressao: string   read FLinkImpressao write FLinkImpressao;
    property autenticidade: string   read Fautenticidade write Fautenticidade;
  end;


  // ************************************************************************ //
  // Name      : WebService SigISSPortType
  // Namespace : urn:sigiss_ws
  // soapAction: urn:sigiss_ws#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : WebService SigISSBinding
  // service   : WebService SigISS
  // port      : WebService SigISSPort
  // URL       : https://valadares.sigiss.com.br:443/valadares/ws/sigiss_ws.php
  // ************************************************************************ //
  WebService_SigISSPortType = interface(IInvokable)
  ['{A558117C-93D8-798B-81EA-3E3B22672221}']
    procedure GerarNota(const DescricaoRps: tcDescricaoRps; out RetornoNota: tcRetornoNota; out DescricaoErros: tcDescricaoErros); stdcall;
    procedure CancelarNota(const DadosCancelaNota: tcDadosCancelaNota; out RetornoNota: tcRetornoNota; out DescricaoErros: tcDescricaoErros); stdcall;
    procedure ConsultarNotaValida(const DadosConsultaNota: tcDadosConsultaNota; out RetornoNota: tcRetornoNota; out DescricaoErros: tcDescricaoErros); stdcall;
    procedure ConsultarNotaPrestador(const DadosPrestador: tcDadosPrestador; const Nota: Integer; out DadosNota: tcDadosNota; out DescricaoErros: tcDescricaoErros); stdcall;
    function  gerateste(const dado: Integer): string; stdcall;
  end;

function GetWebService_SigISSPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): WebService_SigISSPortType;


implementation
  uses System.SysUtils, hw_win_utils;

function GetWebService_SigISSPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): WebService_SigISSPortType;
const
  defWSDL = 'https://valadares.sigiss.com.br/valadares/ws/sigiss_ws.php?wsdl';
  defURL  = 'https://valadares.sigiss.com.br:443/valadares/ws/sigiss_ws.php';
  defSvc  = 'WebService SigISS';
  defPrt  = 'WebService SigISSPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;

  RIO.HTTPWebNode.ConnectTimeout := IniConf.ReadInt('SIGISS','ConnectTimeout', RIO.HTTPWebNode.ConnectTimeout);
  RIO.HTTPWebNode.ReceiveTimeout := IniConf.ReadInt('SIGISS','ReceiveTimeout', RIO.HTTPWebNode.ReceiveTimeout);

  try
    Result := (RIO as WebService_SigISSPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure tcDescricaoRps.Settipo_obra(Index: Integer; const AInteger: Integer);
begin
  Ftipo_obra := AInteger;
  Ftipo_obra_Specified := True;
end;

function tcDescricaoRps.tipo_obra_Specified(Index: Integer): boolean;
begin
  Result := Ftipo_obra_Specified;
end;

procedure tcDescricaoRps.Setdia_emissao(Index: Integer; const AInteger: Integer);
begin
  Fdia_emissao := AInteger;
  Fdia_emissao_Specified := True;
end;

function tcDescricaoRps.dia_emissao_Specified(Index: Integer): boolean;
begin
  Result := Fdia_emissao_Specified;
end;

procedure tcDescricaoRps.Setmes_emissao(Index: Integer; const AInteger: Integer);
begin
  Fmes_emissao := AInteger;
  Fmes_emissao_Specified := True;
end;

function tcDescricaoRps.mes_emissao_Specified(Index: Integer): boolean;
begin
  Result := Fmes_emissao_Specified;
end;

procedure tcDescricaoRps.Setano_emissao(Index: Integer; const AInteger: Integer);
begin
  Fano_emissao := AInteger;
  Fano_emissao_Specified := True;
end;

function tcDescricaoRps.ano_emissao_Specified(Index: Integer): boolean;
begin
  Result := Fano_emissao_Specified;
end;

initialization
  { WebService SigISSPortType }
  InvRegistry.RegisterInterface(TypeInfo(WebService_SigISSPortType), 'urn:sigiss_ws', 'ISO-8859-1', '', 'WebService SigISSPortType');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WebService_SigISSPortType), 'urn:sigiss_ws#%operationName%');
  RemClassRegistry.RegisterXSClass(tcDadosPrestador, 'urn:sigiss_ws', 'tcDadosPrestador');
  RemClassRegistry.RegisterXSClass(tcDadosNota, 'urn:sigiss_ws', 'tcDadosNota');
  RemClassRegistry.RegisterXSClass(tcDadosConsultaNota, 'urn:sigiss_ws', 'tcDadosConsultaNota');
  RemClassRegistry.RegisterXSClass(tcDadosCancelaNota, 'urn:sigiss_ws', 'tcDadosCancelaNota');
  RemClassRegistry.RegisterXSClass(tcDescricaoRps, 'urn:sigiss_ws', 'tcDescricaoRps');
  RemClassRegistry.RegisterXSInfo(TypeInfo(tcDescricaoErros), 'urn:sigiss_ws', 'tcDescricaoErros');
  RemClassRegistry.RegisterXSClass(tcEstruturaDescricaoErros, 'urn:sigiss_ws', 'tcEstruturaDescricaoErros');
  RemClassRegistry.RegisterXSClass(tcRetornoNota, 'urn:sigiss_ws', 'tcRetornoNota');

end.