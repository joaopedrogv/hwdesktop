{******************************************************************************}
{ Projeto: REST HW                                                             }
{  Biblioteca para ser usada em maior parte para consumir a api da HW Sistemas }
{ outras apis também são podem ser consumidas utilizando esta biblioteca       }
{                                                                              }
{ Direitos Autorais Reservados (c) 2017   Hw Sistemas e Computadores           }
{                                                                              }
{ Autor: João Pedro Rodrigues Costa                                            }
{                                                                              }
{            HW Sistemas e Computadores Ltda - www.hwsistemas.com.br           }
{    Rua Mogno, 236, Santo Agostinho - Governador Valadares - MG - 35.065-019  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 15/05/2017: João Pedro
|*  - Criação e distribuição da Primeira Versao da Chamada do Chat
*******************************************************************************}

unit HW.Utils.Classes.CentralAcoes;

interface

uses
  System.Generics.Collections,
  HW.Utils.Classes.Rest_DX,
  HW.Utils.Classes.Registros.Cliente_DX,
  HW.Utils.Classes.Registros.Usuario_DX,
  HW.Utils.Classes.Registros_DX,
  HW.Utils.Classes.Rtti, HW.Utils.Classes.Registros.Chamado_DX,
  HW.Utils.Classes.Registros.Ticket.Consulta_DX,
  HW.Utils.Classes.Registros.NotificacoesNaoLidas_DX,
  HW.Utils.Classes.Registros.NotificacoesNaoLidasERP_DX,
  HW.Utils.Classes.Registros.Ticket_DX,
  HW.Utils.Classes.Registros.Ticket.Mensagem_DX, System.Classes,
  HW.Utils.Classes.Registros.Documento_DX,
  HW.Utils.Classes.Registros.Ticket.Documento.Revisao_DX, IdComponent,
  Vcl.Samples.Gauges, HW.Utils.Classes.Registros.NotificacaoApiNavegador_DX;

type

  THW_CentralSuporte_Resp = class(THwClassRegistros)
  private
    Faccesstoken: string;
    FdataHoraUltimoLogin: TDateTime;
    FclienteHw: string;
    FsetorHw: string;
    Fchamado: string;
    FusuarioHw: string;
    FnotificacoesJson: string;
    FnotificacoesERPJson: string;
  public
    property accesstoken: string read Faccesstoken write Faccesstoken;
    property dataHoraUltimoLogin: TDateTime read FdataHoraUltimoLogin write FdataHoraUltimoLogin;
    property clienteHw: string read FclienteHw write FclienteHw;
    property setorHw: string read FsetorHw write FsetorHw;
    property chamado: string read Fchamado write Fchamado;
    property usuarioHw: string read FusuarioHw write FusuarioHw;
    property notificacoesJson: string read FnotificacoesJson write FnotificacoesJson;
    property notificacoesERPJson: string read FnotificacoesERPJson write FnotificacoesERPJson;
  end;

  THW_CentralSuporte_Download = class
  private
    FGauge: TGauge;
  public
    procedure DownloadHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure DownloadHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure DownloadHTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure NetReceiveData(const Sender: TObject; AContentLength: Int64; AReadCount: Int64; var Abort: Boolean);
    property Gauge: TGauge read FGauge write FGauge;
  end;

  THW_CentralSuporte = class
  private
    FUrlChat    : string;
    FUrlChamado : string;
    FCnpj       : string;
    FEmail      : string;
    FChave      : string;
    FColaborador: string;
    FRest       : TRestHW;
    Fresposta   : THW_CentralSuporte_Resp;
    FacessToken: TResp_AcessTokent;
    FLastError: string;
    FCodigoParceiro: Integer;

    procedure obterClienteCriarUsuarioCasoNaoExista(ACriarUser: Boolean);
    function CalculaChaveLoginChatWeb(AEmail: string; ACnpj: string): string; overload;
    function CalculaChaveLoginChatWeb(ACnpj: string): string; overload;
    function GetLastError: string;

    procedure SaveInCache;
    function LoadInCache: string;

    procedure TratarLastErrorRestClient;
    function GetCodigoParceiro: Integer;

    procedure HomeGetStatusApiHw;

  public
    destructor Destroy; override;
    constructor create(AEmail, AColaborador, ACnpj, AToken: string);

    function LoginExecutar: Boolean;
    //metodos para o chamado
    function ChamadoAtualizarLista(Acod_usuario, Acod_empresa, Acod_chamado: Integer; Aaccess_token: string;
                                   ANotificacaoChamado: TNotificacaoApiNavegador): Boolean;
    function ChamadoGetUltimoAberto(var AchamadoHW: TChamado): Boolean;
    function ChamadoCriar(AChamado: TChamado): Boolean;
    function ChamadoDesistir(AChamado: TChamado): Boolean;
    function ChamadoAdicionarMensagemAoChamado(AChamado: TChamado; Amsg: string): Boolean;

    //metodos para area interna
    procedure HelpDeskAbrir;

    //metodos para o chat
    procedure ChatIniciar;

    //metodos para o ticket
    function TicketGetEmAbertos(var AticketsDoUsuario: TArray<TTicketConsulta>): Boolean;
    function TicketGet(AticketID: Integer): TTicket;
    function TicketRegistrarMensagem(Amensagem: TTicketMensagem; AAtachments: TObjectList<TDocumento>; ANewTicket: TTicket = nil): Boolean;
    function TicketDownloadDocumento(Acod_documento, Arevisao: Integer; ASaveAs: string; ADownloadWork: THW_CentralSuporte_Download): Boolean;

    //metodos para as notificacoes
    function NotificacaoCriarBackup(ATitulo: string; AHeader: string; AMensagem: string): Boolean;
    function NotificacaoGetNaoLidas(var Anotificacoes: TArray<TNotificacoesNaoLidas>): Boolean;
    function NotificacaoGetNaoLidasERP(var Anotificacoes: TArray<TNotificacoesNaoLidasERP>): Boolean;
    function NotificacaoMarcarComoLida(var Anotificacoes: TArray<TNotificacoesNaoLidas>; ANotificacao: TNotificacoesNaoLidas): Boolean; overload;
    function NotificacaoMarcarComoLida(AidUsuario: Integer; ANotificacao: TNotificacoesNaoLidas): Boolean; overload;
    function NotificacaoNotificarERP: string;

    property acessToken: TResp_AcessTokent read FacessToken write FacessToken;
    property resposta: THW_CentralSuporte_Resp read Fresposta write Fresposta;
    property LastError: string read GetLastError;
    property EmailUsuario: string read FEmail;
    property CnpjUsuario: string read FCnpj;
    property CodigoParceiro: Integer read GetCodigoParceiro;
  end;

implementation

{ THW_CentralSuporte }

uses
  REST.Json, System.SysUtils, REST.Types,
  HW.Utils.Classes.Funcoes_DX, Winapi.ShellAPI, Vcl.Controls, Vcl.Forms,
  Winapi.Windows, System.NetEncoding, System.DateUtils, System.StrUtils,
  System.JSON, IdHTTP, IdMultipartFormData, IdURI,
  HW.Utils.Classes.Registros.Ticket.Documento_DX, IdAntiFreezeBase,
  Winapi.SHFolder, System.Net.HttpClientComponent, System.Net.HttpClient,
  HW.Utils.Classes.Registros.Ticket.Participante_DX,
  HW.Utils.Classes.Registros.ConsultaClienteUsuario;

function THW_CentralSuporte.CalculaChaveLoginChatWeb(AEmail: string;
  ACnpj: string): string;
var
  ADia, AMes, AAno, AValorDinamico, ALength: Integer;
  AChave, AChaveCodificada, AChaveBase64: string;
  AChaveCodBytes: TArray<Byte>;
begin
  ADia             := DayOf(Date);
  ACNPJ            := ACNPJ.PadLeft(14, '0');
  AMes             := MonthOf(Date);
  ALength          := Length(AEmail);
  AAno             := StrToInt(Copy(IntToStr(YearOf(Date)).PadLeft(4, '0'), 3, 2));

  AValorDinamico   := Abs((ADia * AMes * ALength ) - AAno);

  AChave           := IntToStr(ADia).PadLeft(2, '0') +
                      ACNPJ +
                      IntToStr(AMes).PadLeft(2, '0') +
                      IntToStr(ALength).PadLeft(3, '0') +
                      IntToStr(AAno).PadLeft(2, '0') +
                      IntToStr(AValorDinamico).PadLeft(10, '0');

  AChaveCodificada := THwUtilsClass.Codifica(AChave);

  AChaveCodBytes   := TEncoding.ASCII.GetBytes(AChaveCodificada);

  AChaveBase64     := TNetEncoding.Base64.EncodeBytesToString(AChaveCodBytes);

  Result           := AChaveBase64;
end;

constructor THW_CentralSuporte.create(Aemail, AColaborador, Acnpj, Atoken: string);
var
  AUrl: string;
  Aaccesstoken: TResp_AcessTokent;
  AclienteHw: TCliente;
begin

  //if THwUtilsClass.GetIni('MD', 'CUSTOM_URL', '') <> 'S' then
    if StrToDateDef(THwUtilsClass.GetIni('MD', 'DATA_PROX_CONS_URL', ''), Date) <= Date  then
      HomeGetStatusApiHw;

  if THwUtilsClass.GetIni('MD', 'CUSTOM_URL', '') = 'S' then
    AUrl   := THwUtilsClass.GetIni('MD', 'URL_SITE', AUrlSiteHomologacao)
  else if THwUtilsClass.GetIni('MD', 'NOVA_URL', '') = 'S' then
    AUrl   := THwUtilsClass.GetIni('MD', 'URL_SITE', AUrlSiteHomologacao)
  else
    AUrl   := IfThen(THwUtilsClass.ComputadorDaRedeHwSistemas, AUrlSiteHomologacao, AUrlSiteProducao);

  AUrl := THwUtilsClass.IncludeTrailingBackslash(AUrl);

  FUrlChat        := AUrl + 'MinhaConta/LoginERP';
  FUrlChamado     := AUrl + 'Chamado/AtualizarListaSuporte';

  Femail          := Aemail;
  Fcnpj           := Acnpj;
  FCodigoParceiro := 0;


  if THwUtilsClass.GetIni('MD', 'DebugApi', 'N') = 'S' then
    Fresposta    := THW_CentralSuporte_Resp.FromJsonString<THW_CentralSuporte_Resp>(LoadInCache)
  else
    Fresposta    := THW_CentralSuporte_Resp.FromJsonString<THW_CentralSuporte_Resp>(THwUtilsClass.DecodeASCIIBase64(AToken));

//  Fresposta    := TJson.JsonToObject<THW_CentralSuporte_Resp>(TJson.ObjectToJsonObject()AToken, []);
  if not Assigned(Fresposta) then
    Fresposta := THW_CentralSuporte_Resp.Create;

  if Fresposta.clienteHw <> '' then
  begin
    AclienteHw := TCliente.FromJsonString<TCliente>(Fresposta.clienteHw);
    if Assigned(AclienteHw) then
      if AclienteHw.cnpj.PadLeft(14, '0') <> FCnpj.PadLeft(14, '0') then
      begin
        FreeAndNil(Fresposta);
        Fresposta := THW_CentralSuporte_Resp.Create;
      end;
  end;

  FColaborador := AColaborador;

  if THwUtilsClass.GetIni('MD', 'CUSTOM_URL', '') = 'S' then //API HW em Homologação = Sim
    AUrl := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
  else if THwUtilsClass.GetIni('MD', 'NOVA_URL', '') = 'S' then
    AUrl := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
  else
    AUrl := IfThen(THwUtilsClass.ComputadorDaRedeHwSistemas, AUrlApiHomologacao, AUrlApiProducao);

  AUrl := THwUtilsClass.IncludeTrailingBackslash(AUrl);

  if not Assigned(FRest) then
    FRest := TRestHW.Create(AUrl, '')
  else
    FRest.urlApi := AUrl;

  if FColaborador.Equals('*@EMPRESA@*') and (AEmail.Trim = '') then
  begin
    FEmail := ACnpj;
    FChave := CalculaChaveLoginChatWeb(FCnpj);
  end
  else
    FChave := CalculaChaveLoginChatWeb(FEmail, FCnpj);
end;

function THW_CentralSuporte.CalculaChaveLoginChatWeb(ACnpj: string): string;
var
  ADia, AMes, AAno, AValorDinamico, ALength: Integer;
  AChave, AChaveCodificada, AChaveBase64: string;
  AChaveCodBytes: TArray<Byte>;
  ADigito: Char;
begin
  ADia             := DayOf(Date);
  ACNPJ            := ACNPJ.PadLeft(14, '0');
  AMes             := MonthOf(Date);
  ALength          := 0;

  for ADigito in ACnpj do
    ALength        := ALength + StrToIntDef(ADigito, 0);

  AAno             := StrToInt(Copy(IntToStr(YearOf(Date)).PadLeft(4, '0'), 3, 2));

  AValorDinamico   := Abs((ADia * AMes * ALength ) - AAno);

  AChave           := IntToStr(ADia).PadLeft(2, '0') +
                      ACNPJ +
                      IntToStr(AMes).PadLeft(2, '0') +
                      IntToStr(ALength).PadLeft(3, '0') +
                      IntToStr(AAno).PadLeft(2, '0') +
                      IntToStr(AValorDinamico).PadLeft(10, '0');

  AChaveCodificada := THwUtilsClass.Codifica(AChave);

  AChaveCodBytes   := TEncoding.ASCII.GetBytes(AChaveCodificada);

  AChaveBase64     := TNetEncoding.Base64.EncodeBytesToString(AChaveCodBytes);

  Result           := AChaveBase64;
end;

function THW_CentralSuporte.ChamadoAdicionarMensagemAoChamado(AChamado: TChamado;
  Amsg: string): Boolean;
var
  AResposta: THWRest_ResponseInformationC;
  AClienteHw: TCliente;
begin
  Result := False;

  if not LoginExecutar then
    Exit(Result);

  FRest.metodo := 'Chamado/AddMensagem';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_empresa', '1', pkGETorPOST, [], True);
  FRest.AddParametro('cod_chamado', AChamado.cod_chamado.ToString, pkGETorPOST, [], True);
  FRest.AddParametro('msg', Amsg.Trim, pkGETorPOST, [], True);

  if not FRest.ExecutarPOST() then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    AResposta := THWRest_ResponseInformationC.FromJsonString(FRest.restResponse.JSONValue.ToJSON);
    if Assigned(AResposta) then
      Result := AResposta.Sucess(1)
    else
      raise Exception.Create('Retorno incompativel com o esperado');
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

function THW_CentralSuporte.ChamadoAtualizarLista(Acod_usuario, Acod_empresa, Acod_chamado: Integer;
  Aaccess_token: string; ANotificacaoChamado: TNotificacaoApiNavegador): Boolean;
//var
//  ANetHTTPClient: TNetHTTPClient;
//  ANetHTTPRequest: TNetHTTPRequest;
//  AURL: string;
//  ASource: TStrings;
begin
  if THwUtilsClass.GetIni('MD', 'CUSTOM_URL', '') = 'S' then
    FRest.urlApi := THwUtilsClass.GetIni('MD', 'URL_SITE', AUrlSiteHomologacao)
  else if THwUtilsClass.GetIni('MD', 'NOVA_URL', '') = 'S' then
    FRest.urlApi := THwUtilsClass.GetIni('MD', 'URL_SITE', AUrlSiteHomologacao)
  else
    FRest.urlApi := IfThen(THwUtilsClass.ComputadorDaRedeHwSistemas, AUrlSiteHomologacao, AUrlSiteProducao);
  try
    FRest.metodo := 'Chamado/AtualizarListaSuporte';

    FRest.restRequest.Params.Clear;
    FRest.AddParametro('cod_usuario', Acod_usuario.ToString, pkGETorPOST, [], True);
    FRest.AddParametro('cod_empresa', Acod_empresa.ToString, pkGETorPOST, [], True);
    FRest.AddParametro('access_token', Aaccess_token, pkGETorPOST, [], True);
    FRest.AddParametro('cod_chamado', Acod_chamado.ToString, pkGETorPOST, [], True);

    try
      if Assigned(ANotificacaoChamado) then
        FRest.ExecutarPOST(ANotificacaoChamado.ToJsonStringEncode)
      else
      begin
        FRest.AddParametro('notificacao', 'null', pkGETorPOST, [], True);
        FRest.ExecutarPOST();
      end;
    except
    end;

  finally
    if THwUtilsClass.GetIni('MD', 'CUSTOM_URL', '') = 'S' then //API HW em Homologação = Sim
      FRest.urlApi := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
    else if THwUtilsClass.GetIni('MD', 'NOVA_URL', '') = 'S' then
      FRest.urlApi := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
    else
      FRest.urlApi := IfThen(THwUtilsClass.ComputadorDaRedeHwSistemas, AUrlApiHomologacao, AUrlApiProducao);
  end;
  {
  ANetHTTPClient := TNetHTTPClient.Create(Application);
  ANetHTTPRequest := TNetHTTPRequest.Create(Application);
  ASource := TStringList.Create;
  try
    AURL := TIdURI.URLEncode(FUrlChamado + '?' +
                           'cod_usuario='   + Acod_usuario.ToString + '&' +
                           'cod_empresa='   + Acod_empresa.ToString + '&' +
                           'access_token='  + Aaccess_token + '&' +
                           'cod_chamado='   + Acod_chamado.ToString + '&' +
                           'notificacao=null');
    try
      ANetHTTPRequest.Client := ANetHTTPClient;
      ANetHTTPRequest.Get(AURL);
      Result := True;
    except
      Result := False;
    end;

  finally
    FreeAndNil(ANetHTTPRequest);
    FreeAndNil(ANetHTTPClient);
    FreeAndNil(ASource);
  end;
  }
end;

function THW_CentralSuporte.ChamadoCriar(AChamado: TChamado): Boolean;
var
  AResposta: THWRest_ResponseInformationC;
  ANotificacaoChamado: TNotificacaoApiNavegador;
  AClienteHw: TCliente;
begin
  Result := False;

  if not LoginExecutar then
    Exit(Result);

  ANotificacaoChamado := TNotificacaoApiNavegador.Create;
  with ANotificacaoChamado do
  begin
    Titulo     := 'Novo Chamado - ' + AChamado.Setor.Nome;
    AClienteHw := THwClassRegistros.FromJsonString<TCliente>(Fresposta.clienteHw);
    if Assigned(AClienteHw) then
      Mensagem := AChamado.nome.Trim + ' - ' + AClienteHw.nome;
    ForcarExibicao := True;
    SetorID := AChamado.SetorID;
  end;
  AChamado.Setor := nil;

  FRest.metodo := 'Chamado/Inserir';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_empresa', '1', pkGETorPOST, [], True);
  
  if not FRest.ExecutarPOST(AChamado.ToJsonStringEncode) then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    AResposta := THWRest_ResponseInformationC.FromJsonString(FRest.restResponse.JSONValue.ToJSON);
    if Assigned(AResposta) then
    begin
      Result := AResposta.Sucess(1);
      if (Result) and (not AResposta.Objecto.Trim.IsEmpty) then
        ChamadoAtualizarLista(FacessToken.cod_usuario,
                              FacessToken.cod_empresa,
                              StrToInt(AResposta.Objecto.Trim),
                              FacessToken.access_token,
                              ANotificacaoChamado);
    end
    else
      raise Exception.Create('Retorno incompativel com o esperado');
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

function THW_CentralSuporte.ChamadoDesistir(AChamado: TChamado): Boolean;
var
  AResposta: THWRest_ResponseInformationC;
  ANotificacaoChamado: TNotificacaoApiNavegador;
  AClienteHw: TCliente;
begin
  Result := False;
  if not LoginExecutar then
    Exit(Result);

  if not Assigned(AChamado) then
    Exit(Result);

  ANotificacaoChamado := TNotificacaoApiNavegador.Create;
  with ANotificacaoChamado do
  begin
    Titulo     := 'Chamado cancelado - ' + AChamado.Setor.Nome;
    AClienteHw := THwClassRegistros.FromJsonString<TCliente>(Fresposta.clienteHw);
    if Assigned(AClienteHw) then
      Mensagem := AChamado.nome.Trim + ' - ' + AClienteHw.nome;
    ForcarExibicao := True;
    SetorID := AChamado.SetorID;
  end;
  AChamado.Setor := nil;

  AChamado.status := 'Cancelado';

//  FRest.metodo := 'Chamado/AtualizarStatus';
  FRest.metodo := 'Chamado/Cancelar';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_empresa', FRest.acessToken.cod_empresa.ToString, pkGETorPOST, [], True);
  FRest.AddParametro('cod_chamado', AChamado.cod_chamado.ToString, pkGETorPOST, [], True);
//  FRest.AddParametro('status', AChamado.status, pkGETorPOST, [], True);
//  FRest.AddParametro('mensagem', '', pkGETorPOST, [], True);
//  FRest.AddParametro('dataDeAgendamento', 'null', pkGETorPOST, [], True);
//  FRest.AddParametro('obsChamado', 'Cliente cancelou via ERP', pkGETorPOST, [], True);
//  FRest.AddParametro('cod_us_notif', '0', pkGETorPOST, [], True);
//  FRest.AddParametro('notificar', 'false', pkGETorPOST, [], True);
//  FRest.AddParametro('enviarEmail', 'false', pkGETorPOST, [], True);
//  FRest.AddParametro('clienteCancelou', 'true', pkGETorPOST, [], True);

  if not FRest.ExecutarPOST() then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    AResposta := THWRest_ResponseInformationC.FromJsonString(FRest.restResponse.JSONValue.ToJSON);
    if Assigned(AResposta) then
    begin
      Result := AResposta.Sucess(1);
      if Result then
        ChamadoAtualizarLista(FacessToken.cod_usuario,
                              FacessToken.cod_empresa,
                              AChamado.cod_chamado,
                              FacessToken.access_token,
                              ANotificacaoChamado);
    end
    else
      raise Exception.Create('Retorno incompativel com o esperado');
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

destructor THW_CentralSuporte.Destroy;
begin
  if THwUtilsClass.GetIni('MD', 'DebugApi', 'N') = 'S' then
    SaveInCache;
  FreeAndNil(FRest);
  FreeAndNil(Fresposta);
  inherited;
end;

function THW_CentralSuporte.GetCodigoParceiro: Integer;
begin               
  Result := FCodigoParceiro;
  if Result <= 0 then
    Result := 1;
end;

function THW_CentralSuporte.GetLastError: string;
begin
  Result := FLastError;
end;

procedure THW_CentralSuporte.HelpDeskAbrir;
var
  AURL: string;
begin
  if not LoginExecutar then
    Exit;

  AUrl := '"' + FUrlChat+ '?sessao=' + UTF8ToString(THwUtilsClass.EncodeURIParameter(Fresposta.accesstoken)) +
                          '&abrirChat=false' + '"';

  ShellExecute(Application.Handle, 'open', PChar(AUrl), nil, nil, SW_SHOWNORMAL);
end;

procedure THW_CentralSuporte.HomeGetStatusApiHw;
var
  AstatusApi: THW_StatusApi;
begin
  if not Assigned(FRest) then
    FRest := TRestHW.Create('', '');

  if THwUtilsClass.GetIni('MD', 'CUSTOM_URL', '') = 'S' then
    FRest.urlApi := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
  else if THwUtilsClass.GetIni('MD', 'NOVA_URL', '') = 'S' then
    FRest.urlApi := THwUtilsClass.GetIni('MD', 'URL_API', AUrlApiHomologacao)
  else
    FRest.urlApi := IfThen(THwUtilsClass.ComputadorDaRedeHwSistemas, AUrlApiHomologacao, AUrlApiProducao);

  try

    FRest.urlApi := THwUtilsClass.IncludeTrailingBackslash(FRest.urlApi);
    FRest.urlApi := FRest.urlApi.Replace('/api/', '/');

    FRest.metodo := 'home/getstatus';
    FRest.restRequest.Params.Clear;
    FRest.ExecutarGET;

    if not Assigned(FRest.restResponse) then
    begin
      THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', FormatDateTime('dd/mm/yyyy', Date + 1));
      Exit;
    end;

    if FRest.restResponse.StatusCode <> 200 then
    begin
      THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', FormatDateTime('dd/mm/yyyy', Date + 1));
      Exit;
    end;

    AstatusApi := THwClassRegistros.FromJsonString<THW_StatusApi>(FRest.restResponse.JSONValue.ToString);
    if not Assigned(AstatusApi) then
    begin
      THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', FormatDateTime('dd/mm/yyyy', Date + 1));
      Exit;
    end;

    if AstatusApi.status.Trim.ToUpper = 'INATIVO' then
    begin
      //testar a nova url antes de alterar no config, se der erro não muda
      FRest.urlApi := THwUtilsClass.IncludeTrailingBackslash(AstatusApi.api_url);
      FRest.urlApi := FRest.urlApi.Replace('/api/', '/');

      FRest.ExecutarGET;
      if not Assigned(FRest.restResponse) then
        Exit;
      if not FRest.restResponse.StatusCode = 200 then
        Exit;
      if THwClassRegistros.FromJsonString<THW_StatusApi>(FRest.restResponse.JSONValue.ToString).status.Trim.ToUpper = 'INATIVO' then
        Exit;
      //final do teste da url

      if AstatusApi.data_inat.Trim.IsEmpty then
        AstatusApi.data_inat := FormatDateTime('dd/mm/yyyy', Date + 1)
      else
        AstatusApi.data_inat := THwConvertDateTimeFormatUtils.ConvertDateTime(AstatusApi.data_inat, 'mongo', 'dd/mm/yyyy');

      THwUtilsClass.SetIni('MD', 'NOVA_URL', 'S');
      THwUtilsClass.SetIni('MD', 'URL_API' , THwUtilsClass.IncludeTrailingBackslash(AstatusApi.api_url));
      THwUtilsClass.SetIni('MD', 'URL_SITE', THwUtilsClass.IncludeTrailingBackslash(AstatusApi.site_url));
      THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', AstatusApi.data_inat);
    end
    else
    begin
      if AstatusApi.data_inat.Trim.IsEmpty then
        AstatusApi.data_inat := FormatDateTime('dd/mm/yyyy', Date + 1)
      else
      begin
        AstatusApi.data_inat := THwConvertDateTimeFormatUtils.ConvertDateTime(AstatusApi.data_inat, 'mongo', 'dd/mm/yyyy');

        if StrToDateTimeDef(AstatusApi.data_inat, Date) <= Date then
          AstatusApi.data_inat := FormatDateTime('dd/mm/yyyy', Date + 1)
      end;

      THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', AstatusApi.data_inat);
    end;
  except
    THwUtilsClass.SetIni('MD', 'DATA_PROX_CONS_URL', FormatDateTime('dd/mm/yyyy', Date + 1));
  end;
end;

function THW_CentralSuporte.LoadInCache: string;
var
  AFileText: TStrings;
begin
  if not FileExists(IncludeTrailingPathDelimiter(THwUtilsClass.GetSpecialFolderPath(CSIDL_APPDATA)) + 'Hw Sistemas\' +
    FEmail + '.json') then
    Exit('');

  try
    AFileText := TStringList.Create;
    try
      AFileText.LoadFromFile(IncludeTrailingPathDelimiter(THwUtilsClass.GetSpecialFolderPath(CSIDL_APPDATA)) + 'Hw Sistemas\' +
        FEmail + '.json');

      Exit(AFileText.Text);
    finally
      FreeAndNil(AFileText);
    end;
  except
    Result := '';
  end;
end;

function THW_CentralSuporte.LoginExecutar: Boolean;
var
  AAcessToken: TResp_AcessTokent;
  ACliente: TCliente;
begin
  Result := True;
  FLastError := '';

  AAcessToken := nil;
  if Fresposta.accesstoken <> '' then
  begin
    AAcessToken := TJson.JsonToObject<TResp_AcessTokent>(Fresposta.accesstoken);
    FacessToken := TResp_AcessTokent.FromJsonString(Fresposta.accesstoken);
  end;

  FRest.DataHoraLoginAtual := Fresposta.dataHoraUltimoLogin;
  FRest.metodo := 'security/token';
//  FChave :=  FChave + '12';
  if not FRest.LoginApiHw(FEmail, FChave, AAcessToken) then
  begin

    case FRest.GetLastStatusCode of
      400 :
        begin
          if not Assigned(FRest.Error400) then
          begin
            FLastError := 'Erro ao efetuar login. Sem retorno do erro. 400';
            if Assigned(FRest.restResponse.JSONValue) then
              THwUtilsClass.RegistraErro('THW_CentralSuporte.LoginExecutar.Login.ResponseJson ' + FRest.restResponse.JSONValue.ToJSON)
            else
              THwUtilsClass.RegistraErro('THW_CentralSuporte.LoginExecutar.Login.ResponseJson.Null');
            Exit(False);
          end
          else
          begin
            if FRest.Error400.error_description.Equals('Erro ao efetuar login. Entre em contato com o suporte técnico.') then
            begin// erro tratado pela api que significa que o usuario foi encontrado porém pertence a outro cnpj
              FLastError := FRest.Error400.error_description;
              THwUtilsClass.RegistraErro('THW_CentralSuporte.LoginExecutar.Login.Erro400 ' + FRest.Error400.error + ' ' + FRest.Error400.error_description);
              Exit(False);
            end
            else if FRest.Error400.error.Equals('invalid_grant') then
            begin //erro qualquer que invalida a sessao
              try
                obterClienteCriarUsuarioCasoNaoExista(True);
              except on E: Exception do
                begin
                  FLastError := 'Erro ao criar usuario. Erro: ' + E.Message;
                  THwUtilsClass.RegistraErro('THW_CentralSuporte.LoginExecutar.CriarUsuario ' + FLastError);
                end;
              end;

              //aqui tenta criar o usuario para acessar o sistema
              FRest.metodo := 'security/token';
              if not FRest.LoginApiHw(FEmail, FChave, AAcessToken) then
              begin
                if (FRest.GetLastStatusCode = 400) and (Assigned(FRest.Error400)) then
                  FLastError := FRest.Error400.error_description
                else if (FRest.GetLastStatusCode = 404) and (Assigned(FRest.Error404)) then
                  FLastError := FRest.Error404.Messagee
                else
                  FLastError := 'Erro ao efetuar login. 400 ' + FRest.GetLastError;
                Exit(False);
              end
            end;
          end;
        end;
      404 :
        begin
          FLastError := 'Controle para login não encontrado. 404';
          if Assigned(FRest.Error404) then
            THwUtilsClass.RegistraErro('THW_CentralSuporte.LoginExecutar.Login.Erro404 ' + FRest.Error404.Messagee)
          else
            THwUtilsClass.RegistraErro('THW_CentralSuporte.LoginExecutar.Login.Erro404.Null');
          Exit(False);
        end;
      else
        begin
          FLastError := 'Erro ao efetuar login - ' + FRest.GetLastError;
          THwUtilsClass.RegistraErro('THW_CentralSuporte.LoginExecutar.Login ' + FLastError);
          Exit(False);
        end;
    end;
  end
  else
    Result := True;

  if Result then
    Fresposta.dataHoraUltimoLogin := FRest.DataHoraLoginAtual;

  if (AAcessToken <> nil) and
    (AAcessToken.access_token <> FRest.acessToken.access_token) or (AAcessToken = nil)  then
  begin
    Fresposta.accesstoken := FRest.restResponse.JSONValue.ToJSON;
    FacessToken           := TResp_AcessTokent.FromJsonString(FRest.restResponse.JSONValue.ToJSON);
    if Assigned(FacessToken) then
    begin
      FacessToken.colaborador_hw := FColaborador;
      Fresposta.accesstoken      := FacessToken.ToJsonStringEncode;
    end;
  end;

  if not FRest.TokenJaEstavaAtivo then //caso o token foi renovado, usuario mudou, então pega os setores novamente
  begin
    obterClienteCriarUsuarioCasoNaoExista(False);
    ACliente := THwClassRegistros.FromJsonString<TCliente>(Fresposta.clienteHw);
    if Assigned(ACliente) then
    begin
      FRest.metodo := 'Setor/GetSetores';
      FRest.restRequest.Params.Clear;
      FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
      FRest.AddParametro('cod_empresa', FRest.acessToken.cod_empresa.ToString(), pkGETorPOST, [], True);
      FRest.AddParametro('ativo', 'true', pkGETorPOST, [], True);
      FRest.AddParametro('cod_cliente', 'null', pkGETorPOST, [], True);

      FRest.ExecutarGET();

      if FRest.restResponse.StatusCode = 200 then
        Fresposta.setorHw := FRest.restResponse.JSONValue.ToJSON
      else
        Fresposta.setorHw := '';
      FCodigoParceiro := ACliente.cod_cl_parc;
    end;
  end;
  if not Assigned(ACliente) then
    ACliente := THwClassRegistros.FromJsonString<TCliente>(Fresposta.clienteHw);
  if Assigned(ACliente) then
    if Assigned(FacessToken) then
      if not FacessToken.colaborador_hw.Equals('*@EMPRESA@*') then
        if ACliente.cod_faturamento = 13 then //barrado
          Result := False;
//      ISSO DAQUI DO BARRADO TA ATRAPALHANDO O ESQUEMA DA NOTIFICACAO GRAVAR Q O CLIENTE
//      TA BARRADO
end;

function THW_CentralSuporte.NotificacaoCriarBackup(
  ATitulo: string;
  AHeader: string;
  AMensagem: string): Boolean;
var
  AChave: string;
begin
  Result := False;

  FRest.metodo := 'security/token';
  FRest.restRequest.Params.Clear;
  AChave := CalculaChaveLoginChatWeb('HW.CADASTRO.USUARIOS', '03530705000109');
  if not FRest.LoginApiHw('HW.CADASTRO.USUARIOS', AChave) then
    Exit;

  FRest.metodo := 'Notificacoes/notificar';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization'     , FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario'       , FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, []);
  FRest.AddParametro('cod_empresa'       , '1', pkGETorPOST, []);
  if (Length(Trim(ATitulo)) <= 50) then
    FRest.AddParametro('titulo_simples'  , Trim(ATitulo), pkGETorPOST, [])
  else
    FRest.AddParametro('titulo_simples'  , Copy(Trim(ATitulo), 1, 50), pkGETorPOST, []);

  FRest.AddParametro('header_html'       , Trim(AHeader), pkGETorPOST, []);
  FRest.AddParametro('tipo_notificacao'  , 'BACKUPHW', pkGETorPOST, []);
  FRest.AddParametro('body_html'         , Trim(AMensagem), pkGETorPOST, []);

  if not FRest.ExecutarGET() then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    resposta.notificacoesERPJson := FRest.restResponse.JSONValue.ToJSON;
    Result := True;
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

function THW_CentralSuporte.NotificacaoGetNaoLidas(var Anotificacoes: TArray<TNotificacoesNaoLidas>): boolean;
begin
  Result := False;

  SetLength(Anotificacoes, 0);

  if not LoginExecutar then
    Exit(Result);

  FRest.metodo := 'Notificacoes/GetUltimasNotificacoesNaoLidas';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, []);
  FRest.AddParametro('cod_empresa', '1', pkGETorPOST, []);

  if not FRest.ExecutarGET() then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    resposta.notificacoesJson := FRest.restResponse.JSONValue.ToJSON;
    Anotificacoes := THwClassRegistros.FromJsonToArray<TNotificacoesNaoLidas>(resposta.notificacoesJson);
    Result := True;
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

function THW_CentralSuporte.NotificacaoGetNaoLidasERP(var Anotificacoes: TArray<TNotificacoesNaoLidasERP>): Boolean;
var
  ACliente: TCliente;
begin
  Result := False;

  SetLength(Anotificacoes, 0);

  ACliente := THwClassRegistros.FromJsonString<TCliente>(Fresposta.clienteHw);
  if not Assigned(ACliente) then
    Exit(Result);

  FRest.metodo := 'Notificacoes/GetUltimasNotificacoesNaoLidasERP';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario'  , FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, []);
  FRest.AddParametro('cod_empresa'  , '1', pkGETorPOST, []);
  FRest.AddParametro('cod_cliente'  , ACliente.cod_cliente.ToString(), pkGETorPOST, []);
  FRest.AddParametro('cnpj'         , FCnpj, pkGETorPOST, []);

  if not FRest.ExecutarGET() then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    resposta.notificacoesERPJson := FRest.restResponse.JSONValue.ToJSON;
    Anotificacoes := THwClassRegistros.FromJsonToArray<TNotificacoesNaoLidasERP>(resposta.notificacoesERPJson);
    Result := True;
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

function THW_CentralSuporte.NotificacaoMarcarComoLida(AidUsuario: Integer;
  ANotificacao: TNotificacoesNaoLidas): Boolean;
var
  AResposta: THWRest_ResponseInformation;
  ATempNotificacoes: TArray<TNotificacoesNaoLidas>;
  AItem: TNotificacoesNaoLidas;
begin
  Result := False;

  if not Assigned(ANotificacao) then
    Exit(Result);

  FRest.metodo := 'Notificacoes/LerNotificacao';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_empresa', '1', pkGETorPOST, [], True);
  FRest.AddParametro('cod_notificacao', ANotificacao.cod_notif.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('idusuario', AidUsuario.ToString(), pkGETorPOST, [], True);//id do usuario que deve ser usado

  if not FRest.ExecutarPOST() then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    AResposta := THwClassRegistros.FromJsonString<THWRest_ResponseInformation>(FRest.restResponse.JSONValue.ToJSON);
    if Assigned(AResposta) then
      if AResposta.valid <> 'OK' then
        raise Exception.Create(AResposta.valid)
      else
        Result := True;
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

function THW_CentralSuporte.TicketDownloadDocumento(Acod_documento, Arevisao: Integer; ASaveAs: string;
  ADownloadWork: THW_CentralSuporte_Download): Boolean;
var
  AURL: string;
  AFile: TFileStream;
  AFileNameTemp: string;
  ANetHTTPClient: TNetHTTPClient;
  ANetHTTPRequest: TNetHTTPRequest;
begin

  Result := False;
  if not LoginExecutar then
    Exit(Result);

  ANetHTTPClient := TNetHTTPClient.Create(Application);
  ANetHTTPRequest := TNetHTTPRequest.Create(Application);
  AFileNameTemp := IncludeTrailingPathDelimiter(THwUtilsClass.GetSpecialFolderPath(CSIDL_APPDATA)) + 'Hw Sistemas\temp.0';
  AFile := TFileStream.Create(AFileNameTemp, fmCreate);
  try
    //download dos arquivos
    AURL := TIdURI.URLEncode(FRest.urlApi   + 'Documento/Download' +  '?' +
                           'cod_empresa='   + FacessToken.cod_empresa.ToString + '&' +
                           'cod_documento=' + Acod_documento.ToString + '&' +
                           'revisao='       + Arevisao.ToString + '&' +
                           'cod_usuario='   + FacessToken.cod_usuario.ToString);// + '&' +
//                           'refName='       + ExtractFileName(ASaveAs));


    ANetHTTPRequest.Client := ANetHTTPClient;
    ANetHTTPRequest.CustomHeaders['Authorization'] := FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token;
    if Assigned(ADownloadWork) then
      ANetHTTPRequest.OnReceiveData := ADownloadWork.NetReceiveData;
      
    try

      ANetHTTPRequest.Get(AURL, AFile);
      Result := True;
    except
      on E: EIdHTTPProtocolException do
      begin
        raise Exception.Create('Erro ao baixar arquivos' + #13 +
                               FRest.MelhorMensagemDeErro(
                                 E.ErrorCode.ToString + #13 +
                                 E.Message + #13 +
                                 E.ErrorMessage)); 
      end;
      on E: Exception do
      begin
        raise Exception.Create('Erro ao subir arquivos' + #13 + FRest.MelhorMensagemDeErro(E.Message));
      end;
    end;

    FreeAndNil(AFile);
    if (Result) and (FileExists(AFileNameTemp)) then
      if not CopyFile(PWideChar(AFileNameTemp), PWideChar(ASaveAs), False) then
        THwUtilsClass.ShowErro('Erro ao salvar arquivo no diretório informado')
      else
        DeleteFile(PWideChar(AFileNameTemp));
  finally
    FreeAndNil(ANetHTTPRequest);
    FreeAndNil(ANetHTTPClient);
  end;
end;

function THW_CentralSuporte.TicketGet(AticketID: Integer): TTicket;
var
  Aticket: TTicket;
begin
  if not LoginExecutar then
    Exit(nil);

  FRest.metodo := 'Ticket/Retornar';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_empresa', '1', pkGETorPOST, []);
  FRest.AddParametro('ticketid', AticketID.ToString, pkGETorPOST, []);
                                
  if not FRest.ExecutarGET() then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    Aticket := THwClassRegistros.FromJsonString<TTicket>(FRest.restResponse.JSONValue.ToJSON);
    Exit(Aticket);
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

function THW_CentralSuporte.TicketGetEmAbertos(var AticketsDoUsuario: TArray<TTicketConsulta>): Boolean;
var
  Atickets: TArray<TTicketConsulta>;
  Aticket: TTicketConsulta;
begin
  Result := False;

  SetLength(AticketsDoUsuario, 0);

  if not LoginExecutar then
    Exit(Result);

  FRest.metodo := 'Ticket/Pesquisar';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_empresa', '1', pkGETorPOST, []);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, []);
  FRest.AddParametro('campoPesq', 'Status', pkGETorPOST, []);
  FRest.AddParametro('dataInicial', '', pkGETorPOST, []);
  FRest.AddParametro('dataFinal', '', pkGETorPOST, []);
  FRest.AddParametro('conteudo', 'Pendente', pkGETorPOST, []);
  FRest.AddParametro('condicao', 'COMECA', pkGETorPOST, []);
  FRest.AddParametro('tipoPesqData', 'false', pkGETorPOST, []);
  FRest.AddParametro('cod_cliente', FRest.acessToken.cod_cliente.ToString, pkGETorPOST, []);

  if not FRest.ExecutarGET() then
    TratarLastErrorRestClient;
    
  if FRest.restResponse.StatusCode = 200 then
  begin
    Atickets := THwClassRegistros.FromJsonToArray<TTicketConsulta>(FRest.restResponse.JSONValue.ToJSON);

    for Aticket in Atickets do
      //remover este comentario quando tudo estiver ok
      if Aticket.CodUsuarioClResp = FRest.acessToken.cod_usuario then
      begin
        SetLength(AticketsDoUsuario, Length(AticketsDoUsuario) + 1);
        AticketsDoUsuario[High(AticketsDoUsuario)] := Aticket;
      end;
      
    Result := True;
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

function THW_CentralSuporte.ChamadoGetUltimoAberto(var AchamadoHW: TChamado): Boolean;
var
  ACliente: TCliente;
  AchamadosHW: TArray<TChamado>;
  AdataServidor, AdataChamado: TDate;
  I: Integer;
  AFormatS: TFormatSettings;
begin
  Result := False;
  
  if Assigned(AchamadoHW) then  
    FreeAndNil(AchamadoHW);

  if not LoginExecutar then
    Exit(Result);

  FRest.metodo := 'Chamado/GetChamadosDoUsuario';
//  FRest.metodo := 'Chamado/ExisteChamado';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, []);
  FRest.AddParametro('cod_empresa', '1', pkGETorPOST, []);

  if not FRest.ExecutarGET() then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    Fresposta.chamado := FRest.restResponse.JSONValue.ToJSON;
    //AchamadoHW := THwClassRegistros.FromJsonString<TChamado>(Fresposta.chamado);
    AchamadosHW := THwClassRegistros.FromJsonToArray<TChamado>(Fresposta.chamado);
    //Anotificacoes := THwClassRegistros.FromJsonToArray<TNotificacoesNaoLidas>(resposta.notificacoesJson);
    Result := True;

    if Length(AchamadosHW) > 0 then
    begin
      AchamadoHW := AchamadosHW[Low(AchamadosHW)];
      AFormatS.ShortDateFormat := 'DD/MM/YYYY hh:mm:ss' ;
      AFormatS.DateSeparator := '/';
      AFormatS.TimeSeparator := ':';
      for I := 0 to FRest.restResponse.Headers.Count - 1 do
        if FRest.restResponse.Headers[I].Contains('data_servidor=') then
        begin
          AdataServidor := DateOf( StrToDateTime(
                                     FRest.restResponse.Headers[I].Substring(14, FRest.restResponse.Headers[I].Length {- 15}).Trim,
                                     AFormatS)
                                  );
          AdataChamado  := DateOf(
                                   THwConvertDateTimeFormatUtils.ConvertStrToDateTime(
                                   AchamadoHW.data_temporaria, 'mongo')
                                  );
          if DateOf(AdataChamado) > DateOf(AdataServidor) then
            FreeAndNil(AchamadoHW);
          Break;
        end;
    end
    else
      AchamadoHW := nil;

    if Assigned(AchamadoHW) then
      if AchamadoHW.ref_cadastro.Trim.ToUpper <> 'SISTEMA' then
      begin
//        FreeAndNil(AchamadoHW);
//        raise Exception.Create('Já existe um chamado criado que não pode ser apresentado aqui. Entre na central de Atendimento');
      end;

    //pega o codigo do parceiro que atende o cliente para gravar no chamado
    if FCodigoParceiro = 0 then
    begin
      ACliente := THwClassRegistros.FromJsonString<TCliente>(Fresposta.clienteHw);
      if Assigned(ACliente) then
        FCodigoParceiro := ACliente.cod_cl_parc;
    end;
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

procedure THW_CentralSuporte.ChatIniciar;
var
  AURL: string;
begin
  if not LoginExecutar then
    Exit;

  AUrl := '"' + FUrlChat+ '?sessao=' + UTF8ToString(THwUtilsClass.EncodeURIParameter(Fresposta.accesstoken)) +
                          '&abrirChat=true' + '"';

  ShellExecute(Application.Handle, 'open', PChar(AUrl), nil, nil, SW_SHOWNORMAL);
end;

function THW_CentralSuporte.NotificacaoMarcarComoLida(
  var Anotificacoes: TArray<TNotificacoesNaoLidas>; ANotificacao: TNotificacoesNaoLidas): Boolean;
var
  AResposta: THWRest_ResponseInformation;
  ATempNotificacoes: TArray<TNotificacoesNaoLidas>;
  AItem: TNotificacoesNaoLidas;
begin
  Result := False;
  if not LoginExecutar then
    Exit(Result);

  if not Assigned(ANotificacao) then
    Exit(Result);

  FRest.metodo := 'Notificacoes/LerNotificacao';
  FRest.restRequest.Params.Clear;
  FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
  FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
  FRest.AddParametro('cod_empresa', '1', pkGETorPOST, [], True);
  FRest.AddParametro('cod_notificacao', ANotificacao.cod_notif.ToString(), pkGETorPOST, [], True);
 // FRest.AddParametro('idusuario', '0', pkGETorPOST, [], True);//id do usuario que deve ser usado

  if not FRest.ExecutarPOST() then
    TratarLastErrorRestClient;

  if FRest.restResponse.StatusCode = 200 then
  begin
    AResposta := THwClassRegistros.FromJsonString<THWRest_ResponseInformation>(FRest.restResponse.JSONValue.ToJSON);
    if Assigned(AResposta) then
      if AResposta.valid <> 'OK' then
        raise Exception.Create(AResposta.valid)
      else
      begin
        Result := True;
        try
          //ATempNotificacoes := THwClassRegistros.FromJsonToArray<TNotificacoesNaoLidas>(resposta.notificacoesJson);
          SetLength(ATempNotificacoes, 0);
          for AItem in Anotificacoes do
            if AItem.cod_notif <> ANotificacao.cod_notif then
            begin
              SetLength(ATempNotificacoes, Length(ATempNotificacoes) + 1);
              ATempNotificacoes[High(ATempNotificacoes)] := AItem;
            end;

          Anotificacoes := ATempNotificacoes;
          resposta.notificacoesJson := THwClassRegistros.ArrayObjectToJsonStringEncode<TNotificacoesNaoLidas>(Anotificacoes);
        except
        end;
      end;
  end
  else
    raise Exception.Create(FRest.GetLastError);
end;

function THW_CentralSuporte.NotificacaoNotificarERP: string;
var
  ANotificacoesNaoLidasERP: TArray<TNotificacoesNaoLidasERP>;
  ANotificacao: TNotificacoesNaoLidasERP;
  ATextOut: TStrings;
begin
//  ATextOut := TStringList.Create;
  try
//    ATextOut.Text := '';

    try
      if NotificacaoGetNaoLidasERP(ANotificacoesNaoLidasERP) then
        Result := 'OK'
      else
        Result := 'ERRO';
    except
      Result := 'ERRO|' + FRest.GetLastError;
    end;
      {
    for ANotificacao in ANotificacoesNaoLidasERP do
    begin
      ATextOut.Add(
        THwUtilsClass.AddTagXML('@usuario@',
          THwUtilsClass.AddTagXML('@email@', ANotificacao.email) +
          THwUtilsClass.AddTagXML( '@notificacoes@',
            THwClassRegistros.ArrayObjectToJsonStringEncode<TNotificacoesNaoLidas>(ANotificacao.notificacoes)
          )
        )
      );
    end;
          }
//    Exit(ATextOut.Text);
  finally
//    FreeAndNil(ATextOut);
  end;
end;

  {
var
  AnotificacoesNovas: TArray<TNotificacoesNaoLidas>;
  AnotificacoesBefore: TArray<TNotificacoesNaoLidas>;
  AnotificacaoNova, AnotificacaoBefore: TNotificacoesNaoLidas;
  AExist: Boolean;
  ATextOut: TStrings;
begin

  ATextOut := TStringList.Create;
  try
    ATextOut.Text := '';
    if not LoginExecutar then
      Exit(ATextOut.Text);

    AnotificacoesBefore := THwClassRegistros.FromJsonToArray<TNotificacoesNaoLidas>(resposta.notificacoesJson);

    try
      if not NotificacaoGetNaoLidas(AnotificacoesNovas) then
        Exit(ATextOut.Text);
    except
      Exit(ATextOut.Text);
    end;

    for AnotificacaoNova in AnotificacoesNovas do
    begin
      AExist := False;
      for AnotificacaoBefore in AnotificacoesBefore do
        if AnotificacaoNova.cod_notif = AnotificacaoBefore.cod_notif then
        begin
          AExist := True;
          Break;
        end;

      if not AExist then
        ATextOut.Add(
          THwUtilsClass.AddTagXML('mensagem',
            THwUtilsClass.AddTagXML('titulo', AnotificacaoNova.titulo) +
            THwUtilsClass.AddTagXML('data',
              THwConvertDateTimeFormatUtils.ConvertDateTime(AnotificacaoNova.data_cadastro, 'mongo', 'DD/MM/YYYY hh:nn')
            )));
    end;

    Exit(ATextOut.Text);
  finally
    FreeAndNil(ATextOut);
  end;
end;
  }
procedure THW_CentralSuporte.obterClienteCriarUsuarioCasoNaoExista(ACriarUser: Boolean);
var
  AAcessToken: TResp_AcessTokent;
  ACliente, ACl: TCliente;
  AUsaurio, novoUsuario: TUsuario;
  AConsultaCliente: TConsultaClienteUsuario;
  AResposta: THWRest_ResponseInformation;
  AChave: string;
begin
//  try
    AAcessToken := nil;

    if ACriarUser then //deve logar para criar, caso contrario já está logado
    begin
      FRest.metodo := 'security/token';
      FRest.restRequest.Params.Clear;
      AChave := CalculaChaveLoginChatWeb('HW.CADASTRO.USUARIOS', '03530705000109');
      if not FRest.LoginApiHw('HW.CADASTRO.USUARIOS', AChave, AAcessToken) then
        Exit;
      {
      FRest.metodo := 'Cliente/ConsultarClientesOuUsuarios';
      FRest.restRequest.Params.Clear;
      FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
      FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
      FRest.AddParametro('cod_empresa', FRest.acessToken.cod_empresa.ToString(), pkGETorPOST, [], True);
      FRest.AddParametro('razaoCliente', '', pkGETorPOST, [], True);
      FRest.AddParametro('cidadeCliente', '', pkGETorPOST, [], True);
      FRest.AddParametro('cnpjCliente', '', pkGETorPOST, [], True);
      FRest.AddParametro('fantasiaCliente', '', pkGETorPOST, [], True);
      FRest.AddParametro('nomeUsuario', '', pkGETorPOST, [], True);
      FRest.AddParametro('emailUsuario', FEmail, pkGETorPOST, [], True);
      FRest.AddParametro('consultarCliente', 'false', pkGETorPOST, [], True);
      FRest.ExecutarGET;

      AConsultaCliente := nil;
      if FRest.restResponse.StatusCode = 200 then
      begin
        for AConsultaCliente in THwClassRegistros.FromJsonToArray<TConsultaClienteUsuario>(FRest.restResponse.JSONValue) do
        begin
          if AConsultaCliente.CNPJCliente.PadLeft(14) = FCnpj.PadLeft(14) then
          begin
            if not AConsultaCliente.AtivoCliente then
              Exit;
          end
          else
            Exit
        end;
      end;
      }
    end;

    FRest.metodo := 'Cliente/PesquisarClientes';
    FRest.restRequest.Params.Clear;
    FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
    FRest.AddParametro('campoPesq', 'cnpj', pkGETorPOST, []);
    FRest.AddParametro('dataInicial', '', pkGETorPOST, []);
    FRest.AddParametro('dataFinal', '', pkGETorPOST, []);
    FRest.AddParametro('conteudo', ''+FCnpj, pkGETorPOST, []);
    FRest.AddParametro('condicao', '=', pkGETorPOST, []);
    FRest.AddParametro('tipoPesqData', 'false', pkGETorPOST, []);
    FRest.AddParametro('cod_empresa', '1', pkGETorPOST, []);
    FRest.AddParametro('ativo', '1', pkGETorPOST, []);
    FRest.AddParametro('cod_parceiro', '0', pkGETorPOST, []);
    FRest.AddParametro('cod_cl_parc', '0', pkGETorPOST, []);
    FRest.AddParametro('tpconsulta', 'S', pkGETorPOST, []);
    FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString, pkGETorPOST, []);

    FRest.ExecutarGET;
    ACl := nil;
    if FRest.restResponse.StatusCode = 200 then
    begin
      for ACliente in THwClassRegistros.FromJsonToArray<TCliente>(FRest.restResponse.JSONValue) do
      begin
        ACl := ACliente;
        if ACliente.cnpj.PadLeft(14) = FCnpj.PadLeft(14) then
        begin
          Fresposta.clienteHw := ACliente.ToJsonStringEncode;

          FRest.metodo := 'Usuario/getUsuarios';
          FRest.restRequest.Params.Clear;
          FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
          FRest.AddParametro('cod_empresa', '1', pkGETorPOST, []);
          FRest.AddParametro('cod_cliente', ACliente.cod_cliente.ToString(), pkGETorPOST, []);
          FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, []);
          FRest.AddParametro('ativo', '1', pkGETorPOST, []);
          FRest.ExecutarGET;

          if FRest.restResponse.StatusCode = 200 then
          begin

            for AUsaurio in THwClassRegistros.FromJsonToArray<TUsuario>(FRest.restResponse.JSONValue) do
              if AUsaurio.email.ToLower.Trim() = FEmail.ToLower.Trim() then
              begin
                Fresposta.usuarioHw := AUsaurio.ToJsonStringEncode;
                Exit;
              end;
          end
          else
            raise Exception.Create(FRest.GetLastError);

          if not ACriarUser then
            Exit;

          Break;
        end;
      end;

      if FColaborador.Equals('*@EMPRESA@*') then
        Exit;

      ACliente := ACl;

      FRest.metodo := 'Usuario/incluioualterausuario';
      FRest.restRequest.Params.Clear;
      FRest.AddParametro('Authorization', FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token, pkHTTPHEADER, [poDoNotEncode]);
      FRest.AddParametro('cod_usuario', FRest.acessToken.cod_usuario.ToString(), pkGETorPOST, [], True);
      FRest.AddParametro('cod_empresa', ACliente.cod_empresa.ToString(), pkGETorPOST, [], True);
//      FRest.AddParametro('Setores', '1', pkGETorPOST, []);//caso fosse um array de setores
//      FRest.AddParametro('Setores', '2', pkGETorPOST, []);
//      FRest.AddParametro('Setores', '3', pkGETorPOST, []);

      novoUsuario := TUsuario.Create;
      novoUsuario.cod_cliente := ACliente.cod_cliente;
      novoUsuario.cod_empresa := ACliente.cod_empresa;
      novoUsuario.email := FEmail;
      novoUsuario.nome_cliente := FColaborador;
      novoUsuario.usuario := '';
      novoUsuario.data_cad := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(Date, 'mongo');
      novoUsuario.data_mod := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(Date, 'mongo');
      novoUsuario.tag_perfil_menus := '|CLIENTE|';
      novoUsuario.tipo_us := 'C';
      novoUsuario.senha := ACliente.cnpj.Substring(1,6);
      novoUsuario.ativo := 1;
      novoUsuario.nivel := 1;

      FRest.ExecutarPOST(novoUsuario.ToJsonStringEncode);

      if FRest.restResponse.StatusCode <> 200 then
        raise Exception.Create(FRest.GetLastError);

      AResposta := TJson.JsonToObject<THWRest_ResponseInformation>(FRest.restResponse.JSONValue.ToJSON);
      if Assigned(AResposta) then
        if AResposta.valid <> 'OK' then
          raise Exception.Create(AResposta.errocomb);
    end
    else
      raise Exception.Create(FRest.GetLastError);

//  except on E: Exception do
//  end;
end;

procedure THW_CentralSuporte.SaveInCache;
var
  AFileText: TStrings;
begin
  AFileText := TStringList.Create;
  try

    AFileText.Text := Fresposta.ToJsonStringEncode;

    AFileText.SaveToFile(
      IncludeTrailingPathDelimiter(THwUtilsClass.GetSpecialFolderPath(CSIDL_APPDATA)) + 'Hw Sistemas\' +
      FEmail + '.json');
  finally
    FreeAndNil(AFileText);
  end;
end;

function THW_CentralSuporte.TicketRegistrarMensagem(Amensagem: TTicketMensagem;
  AAtachments: TObjectList<TDocumento>; ANewTicket: TTicket): Boolean;
var
  Aresposta: THWRest_RequestResponseModal;
  ADocumento: TDocumento;
  ATicketDoc: TTicketDocumento;
  AListTicketDoc: TArray<TTicketDocumento>;
  ATicketDocRev: TTicketRevisao;
  AListKeyValue: TArray<THWRest_RequestResponseKeyValue>;
  AKeyValue: THWRest_RequestResponseKeyValue;
  I: Integer;
  AFormData: TIdMultiPartFormDataStream;
  AURL: string;
  AResponseStream: TStringStream;
  AJsonStringStream: TStringStream;

  ANetHTTPClient: TNetHTTPClient;
  ANetHTTPRequest: TNetHTTPRequest;
  AResp: IHTTPResponse;

begin
  Result := False;
  if not LoginExecutar then
    Exit(Result);

  ANetHTTPClient := TNetHTTPClient.Create(Application);
  ANetHTTPRequest := TNetHTTPRequest.Create(Application);
  AFormData := TIdMultiPartFormDataStream.Create;
  AJsonStringStream := TStringStream.Create;
  AResponseStream := TStringStream.Create;
  try

    ANetHTTPRequest.Client := ANetHTTPClient;
    ANetHTTPRequest.Client.ResponseTimeout   := 60 * 1000;
    ANetHTTPRequest.Client.ConnectionTimeout := 60 * 1000;
    ANetHTTPRequest.CustomHeaders['Authorization'] := FRest.acessToken.token_type + ' ' + FRest.acessToken.access_token;

    if Assigned(AAtachments) and (AAtachments.Count > 0) then
    begin
      AURL := TIdURI.URLEncode(FRest.urlApi + 'Documento/Upload' +  '?' +
                             'cod_empresa='  + FacessToken.cod_empresa.ToString + '&' +
                             'cod_usuario='  + FacessToken.cod_usuario.ToString);
      AFormData.Clear;
      for ADocumento in AAtachments do
        AFormData.AddFile(ADocumento.descricao, ADocumento.filePath, 'application/octet-stream');

      ANetHTTPRequest.CustomHeaders['Content-Type'] := 'multipart/form-data; boundary=' + AFormData.Boundary;

      try
        AResp := ANetHTTPRequest.Post(AURL, AFormData, AResponseStream);

        if AResponseStream.DataString.Trim <> ''then
        begin
          AListKeyValue := THwClassRegistros.FromJsonToArray<THWRest_RequestResponseKeyValue>(Utf8ToAnsi(RawByteString(AResponseStream.DataString)));
          if Length(AListKeyValue) = 0 then
          begin
            THwUtilsClass.ShowErro('Erro ao enviar arquivo(s). Verifique o tamanho máximo(10MB) por mensagem');
            Exit(False);
          end;

          I := 0;//pegar o nome digitado pelo usuario, o retorno é na mesma ordem
          for AKeyValue in AListKeyValue do
          begin
            ATicketDoc    := TTicketDocumento.Create;
            ATicketDocRev := TTicketRevisao.Create;
            ATicketDocRev.doc_nome := AKeyValue.Key;
            ATicketDocRev.caminho := AKeyValue.Value;
            ATicketDocRev.data_revisao := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(date, 'mongo');
            ATicketDocRev.data_validade := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(date, 'mongo');
            ATicketDocRev.Documento := TDocumentoCopy.Create();
            ATicketDocRev.Documento.descricao := IfThen(Assigned(AAtachments[I]), AAtachments[I].descricao, AKeyValue.Key);
            ATicketDocRev.Documento.ultima_revisao := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(date, 'mongo');

            ATicketDoc.Revisao := ATicketDocRev;

            I := I + 1;

            SetLength(AListTicketDoc, Length(AListTicketDoc) + 1);
            AListTicketDoc[High(AListTicketDoc)] := ATicketDoc;
          end;
          Amensagem.Documentos := AListTicketDoc;
        end;
      except
        on E: EIdHTTPProtocolException do
        begin
          raise Exception.Create('Erro ao subir arquivos' + #13 +
                                 FRest.MelhorMensagemDeErro(
                                   E.ErrorCode.ToString + #13 +
                                   E.Message + #13 +
                                   E.ErrorMessage));
        end;
        on E: Exception do
        begin
          raise Exception.Create('Erro ao subir arquivos' + #13 + FRest.MelhorMensagemDeErro(E.Message));
        end;
      end;

      AResponseStream.Clear;
      AFormData.Clear;
    end;

    AJsonStringStream.Clear;
    //envio da mensagem
    if Assigned(ANewTicket) then
    begin
      AURL := TIdURI.URLEncode(FRest.urlApi + 'Ticket/Inserir' +  '?' +
                             'cod_empresa='  + FacessToken.cod_empresa.ToString + '&' +
                             'cod_usuario='  + FacessToken.cod_usuario.ToString + '&' +
                             'usuarioRespID=null' +// FacessToken.cod_usuario.ToString + '&' +
                             'ticketId=0' + '&' +
                             'enviarEmail=false' + '&' +
                             'usuarioClienteRespID=' + FacessToken.cod_usuario.ToString);

      AJsonStringStream.WriteString(ANewTicket.ToJsonStringEncode);
      AFormData.AddFormField('ticket', '', '', AJsonStringStream);
    end
    else
    begin
      //envio da mensagem
      AURL := TIdURI.URLEncode(FRest.urlApi + 'Ticket/RegistrarMensagem' +  '?' +
                             'cod_empresa='  + FacessToken.cod_empresa.ToString + '&' +
                             'cod_usuario='  + FacessToken.cod_usuario.ToString + '&' +
                             'ticketId='     + Amensagem.TicketID.ToString + '&' +
                             'participId='   + Amensagem.CriadaPorID.ToString + '&' +
                             'ticketStatus=' + 'Pendente Empresa' + '&' +
                             'enviarEmail=false');
      AJsonStringStream.WriteString(Amensagem.ToJsonStringEncode);
      AFormData.AddFormField('mensagem', '', '', AJsonStringStream);
    end;

    ANetHTTPRequest.CustomHeaders['Content-Type'] := 'multipart/form-data; boundary=' + AFormData.Boundary;

    try
      AResp := ANetHTTPRequest.Post(AURL,  AFormData, AResponseStream);      
    except
      on E: EIdHTTPProtocolException do
      begin
        raise Exception.Create('Erro ao registrar mensagem' + #13 +
                               FRest.MelhorMensagemDeErro(
                                 E.ErrorCode.ToString + #13 +
                                 E.Message + #13 +
                                 E.ErrorMessage));
      end;
      on E: Exception do
      begin
        raise Exception.Create('Erro ao registrar mensagem' + #13 + FRest.MelhorMensagemDeErro(E.Message));
      end;
    end;

    Aresposta := THWRest_RequestResponseModal.FromJsonString(Utf8ToAnsi(RawByteString(AResponseStream.DataString)));
    if Assigned(Aresposta) then
      Result := Aresposta.Sucess('OK')
    else
      raise Exception.Create('Retorno incompativel com o esperado');
  finally
    FreeAndNil(ANetHTTPRequest);
    FreeAndNil(ANetHTTPClient);
    FreeAndNil(AFormData);
    FreeAndNil(AJsonStringStream);
    FreeAndNil(AResponseStream);
  end;
end;

procedure THW_CentralSuporte.TratarLastErrorRestClient;
begin
  if FRest.GetLastError.Contains('A Conexão foi interrompida') then
  begin
    Fresposta.accesstoken := '';
    FRest.acessToken := TResp_AcessTokent.FromJsonString(Fresposta.accesstoken);    
    raise Exception.Create(FRest.GetLastError + #13 + #13 + 'O sistema irá tentar recuperar a conexão. Tente novamente. ' +
      'Se o problema persistir verifique sua internet');                      
  end
  else      
    raise Exception.Create(FRest.GetLastError);
end;

{ THW_CentralSuporte_Download }

procedure THW_CentralSuporte_Download.DownloadHTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  if Assigned(FGauge) then
    FGauge.Progress := AWorkCount;
end;

procedure THW_CentralSuporte_Download.DownloadHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  if Assigned(FGauge) then
  begin
    FGauge.Progress := 0;
    FGauge.MinValue := 0;
    FGauge.MaxValue := AWorkCountMax;
  end;
end;

procedure THW_CentralSuporte_Download.DownloadHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  if Assigned(FGauge) then
    FGauge.Progress := 100;
end;

procedure THW_CentralSuporte_Download.NetReceiveData(const Sender: TObject; AContentLength, AReadCount: Int64;
  var Abort: Boolean);
begin
  if Assigned(FGauge) then
  begin
    FGauge.MinValue := 0;
    FGauge.MaxValue := AContentLength;
    FGauge.Progress := AReadCount;
  end;
end;

end.
