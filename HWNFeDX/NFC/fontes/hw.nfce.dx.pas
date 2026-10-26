unit hw.nfce.dx;

interface

implementation

uses
  SysUtils,
  Classes,
  ActiveX,
  uDLL_ClassesNFC,
  uClasseConexao,
  uNFC_Types,
  synacode,
  synautil,
  RLPrinters,
  uHandleFileACBrNFeServicos,
  hw_utils;

var
  MensagemErro            : string;
  MensagemErroServ        : string;

function nfce_client_free: Longint; stdcall;
begin
  try
    if ConfNFCe <> nil then
      FreeAndNil(ConfNFCe);
    if ConfImp <> nil then
      FreeAndNil(ConfImp);
    Result := 1;
  except
    Result := 0;
  end;
end;

function nfce_client_retorna_ultimo_erro: WideString; stdcall;
begin
  Result := WideString(MensagemErro);
end;

function nfce_client_enviar(CodigoNFCE, CodigoEmpresa: Longint; token, Adicional: WideString): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  HandleFileACBrNFeServicos;

  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.CodNFCe := CodigoNFCE;
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;
    nfce.AcoesAdicionais := string(Adicional);

    Result := nfce.ClientEnviar;

    MensagemErro := nfce.MensagemErro;

    nfce.Task.Run;

  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_client_autorizar(ArrayNFCE: array of Integer; CodigoEmpresa: Longint; token, Adicional: WideString): Longint; stdcall;
var
  I   : Integer;
  nfce: THwNFCe;
begin
  HandleFileACBrNFeServicos;

  Result := 0;
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token           := string(token);
    nfce.CodEmpresa      := CodigoEmpresa;
    nfce.ClientOrServer  := pmClient;
    nfce.AcoesAdicionais := string(Adicional);
    nfce.CodNFCe         := 0;

    nfce.registraErro('count ' + IntToStr(Length(ArrayNFCE)));

    nfce.SetArrayNFCe(ArrayNFCE);

    Result := nfce.ClientEnviar;

    nfce.Task.Run;

  finally
    MensagemErro := nfce.MensagemErro;
    FreeAndNil(nfce);
  end;

end;

function nfce_client_enviar_contingencias(CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;

    Result := nfce.ServEnviarPendenciasNFCe;

    MensagemErro := nfce.MensagemErro;

    nfce.Task.Run;

  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_client_cancelar(CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.CodNFCe := CodigoNFCE;
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;

    Result := nfce.ClientCancelar;

    MensagemErro := nfce.MensagemErro;

    nfce.Task.Run;

  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_client_inutilizar(CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.CodNFCe := CodigoNFCE;
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;

    Result := nfce.ClientInutilizar;

    MensagemErro := nfce.MensagemErro;
  finally
   FreeAndNil(nfce);
  end;
end;

function nfce_client_enviar_email(CodigoNFCE, CodigoEmpresa: Longint; token, Adicional: WideString; UsarServidor: Boolean): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.CodNFCe := CodigoNFCE;
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;
    nfce.AcoesAdicionais := string(Adicional);

    Result := nfce.ClientEnviarEmail(UsarServidor);

    MensagemErro := nfce.MensagemErro;
  finally
   FreeAndNil(nfce);
  end;
end;

function nfce_client_enviar_email_lote(ArrayNFCE: array of Integer; CodigoEmpresa: Longint; token, Email: WideString; UsarServidor: Boolean): Longint; stdcall;
var
  nfce: THwNFCe;
  I: Integer;
begin
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.CodNFCe := 0;
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;
    nfce.AcoesAdicionais := string(Email);
    nfce.SetArrayNFCe(ArrayNFCE);

    Result := nfce.ClientEnviarEmail(UsarServidor);

    MensagemErro := nfce.MensagemErro;
  finally
   FreeAndNil(nfce);
  end;
end;

function nfce_client_gerar_contingencia(CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.CodNFCe := CodigoNFCE;
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;

    Result := nfce.ClientGerarContingencia;

    MensagemErro := nfce.MensagemErro;
  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_client_imprimir_danfe(CodigoNFCE, CodigoEmpresa, TpImp: Longint; token, Adicional: WideString): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.AcoesAdicionais := string(Adicional);
    nfce.CodNFCe := CodigoNFCE;
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;
    Result := nfce.ClientImprimirDANFe(TpImp);

    MensagemErro := nfce.MensagemErro;
  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_client_imprimir_inutilizacao(CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.CodNFCe := CodigoNFCE;
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;

    Result := nfce.ClientImprimirInutilizacao;

    MensagemErro := nfce.MensagemErro;
  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_serv_free: Longint; stdcall;
begin
  try
    if ConfNFCe <> nil then
      FreeAndNil(ConfNFCe);
    if ConfImp <> nil then
      FreeAndNil(ConfImp);
    Result := 1;
  except
    Result := 0;
  end;
end;

function nfce_serv_retorna_ultimo_erro: WideString; stdcall;
begin
  Result := WideString(MensagemErroServ);
end;

function nfce_serv_requisicoes_ativas_nfce: Longint; stdcall;
begin
  if ConfNFCe = nil then
    Result := 0
  else if ConfNFCe.FilaThread = nil then
    Result := 0
  else
    Result := ConfNFCe.FilaThread.Count;
end;

function nfce_serv_requisicoes_ativas_impressao: Longint; stdcall;
begin
  if ConfImp = nil then
    Result := 0
  else if ConfImp.FilaThread = nil then
    Result := 0
  else
    Result := ConfImp.FilaThread.Count;
end;

function nfce_serv_verificar_central_acoes_thread(CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
var
  centralAcoes: THwCentralAcoes;
begin
  try
    centralAcoes            := THwCentralAcoes.create;
    centralAcoes.CodEmpresa := CodigoEmpresa;
    centralAcoes.token      := string(token);
    Result                  := centralAcoes.VerificaCentralDeAcoesThreads;
    MensagemErroServ        := centralAcoes.MensagemErro;
  finally
    FreeAndNil(centralAcoes);
  end;
end;

function nfce_serv_verificar_central_acoes_no_thread(CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
var
  centralAcoes: THwCentralAcoes;
begin
  try
    centralAcoes            := THwCentralAcoes.create;
    centralAcoes.CodEmpresa := CodigoEmpresa;
    centralAcoes.token      := string(token);
    Result                  := centralAcoes.VerificaCentralDeAcoesNoThreads;
    MensagemErroServ        := centralAcoes.MensagemErro;
  finally
    FreeAndNil(centralAcoes);
  end;
end;

//aqui o retorno é falso apenas quando o token for invalido
function nfce_serviceless_enviar_contingencias(CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  HandleFileACBrNFeServicos;

  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    nfce.token := string(token);
    nfce.CodEmpresa := CodigoEmpresa;
    nfce.ClientOrServer := pmClient;

    Result := nfce.ServiceLessEnviarContingenciasNFCe;

    MensagemErro := nfce.MensagemErro;

    nfce.Task.Run;

  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_cert_obterdadospfx(FileName: WideString): WideString; stdcall;
var
  vFile: TFileStream;
begin
  Result := '';
  vFile := TFileStream.Create(FileName, fmOpenRead);
  try
    Result := EncodeBase64(ReadStrFromStream(vFile, vFile.Size));
  finally
    vFile.Free;
  end;
end;

function nfce_print_list: WideString; stdcall;
begin
  Result := RLPrinter.Printers.Text;
end;

function nfce_abrir_gaveta(params: WideString): Longint; stdcall;
var
  nfce: THwNFCe;
begin
  MensagemErro := '';
  nfce := THwNFCe.Create;
  try
    Result := nfce.AbrirGaveta(string(params));

    MensagemErro := nfce.MensagemErro;

  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_anexos(Acod_nf: array of Integer; params: WideString): WideString; stdcall;
var
  nfce: THwNFCe;
  list: TStrings;
begin
  nfce := THwNFCe.create;
  list := NewStringList(True, params, ';');

  try try
    nfce.CodEmpresa := StrToInt(list.Values['EmpresaId']);
    var comPDF      := StrToBool(list.Values['ComPDF']);

    Result := nfce.CriarAnexos(Acod_nf, comPDF);

  except on E: Exception do
    Result := 'ERROR|' + E.Message;
  end;
  finally
    list.Free;
    FreeAndNil(nfce);
  end;
end;

function nfce_anexos_csharp(CodigoNF: Integer; Params: WideString; var AResultado: WideString): Integer; stdcall;
var
  CodigosNF: array of Integer;
begin
  CodigosNF := [ CodigoNF ];

  AResultado := nfce_anexos(CodigosNF, params);

  if string(AResultado).Substring(0,6) = 'ERROR|' then
    Result := 0
  else
    Result := 1;
end;

function nfce_anexos_csharp_buffer(CodigoNF: Integer; Params: WideString; var AResultado: PAnsiChar; var AResultadoSize: Integer): Integer; stdcall;
var
  CodigosNF: array of Integer;
  Resposta: AnsiString;
begin
  CodigosNF := [ CodigoNF ];

  Resposta := nfce_anexos(CodigosNF, params);

  if Assigned(AResultado) and (AResultadoSize >= Length(Resposta) + 1) then
  begin //StrLCopy(AResultado, PAnsiChar(Resposta), AResultadoSize - 1);
    StrPCopy(AResultado, PAnsiChar(Resposta));
    if string(AResultado).Substring(0,6) = 'ERROR|' then
      Result := 0
    else
      Result := 1;
  end
  else
    Result := 0;

  AResultadoSize := Length(Resposta) + 1;
end;

exports
  //metodos nfce_client fazem a validacao do token passado por parametro
  nfce_client_free,
  nfce_client_retorna_ultimo_erro,
  nfce_client_autorizar,
  nfce_client_enviar,
  nfce_client_enviar_contingencias,
  nfce_client_cancelar,
  nfce_client_inutilizar,
  nfce_client_enviar_email,
  nfce_client_enviar_email_lote,
  nfce_client_gerar_contingencia,
  nfce_client_imprimir_danfe,
  nfce_client_imprimir_inutilizacao,
  //metodos usados pelo servico
  nfce_serv_free,
  nfce_serv_retorna_ultimo_erro,
  nfce_serv_requisicoes_ativas_nfce,
  nfce_serv_requisicoes_ativas_impressao,
  nfce_serv_verificar_central_acoes_thread,
  nfce_serv_verificar_central_acoes_no_thread,
  nfce_serviceless_enviar_contingencias,
  //outros metodos
  nfce_cert_obterdadospfx,
  nfce_print_list,
  nfce_abrir_gaveta,
  nfce_anexos,
  nfce_anexos_csharp,
  nfce_anexos_csharp_buffer;

begin
end.
