library HWNFC;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  ActiveX,
  uDLL_ClassesNFC in '..\fontes\uDLL_ClassesNFC.pas',
  uClasseConexao in '..\..\Automacao Bpl\fonte\uClasseConexao.pas',
  uNFC_Types in '..\fontes\uNFC_Types.pas';

var
  MensagemErro            : string;
  MensagemErroServ        : string;

{$R *.res}

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

function nfce_client_retorna_ultimo_erro: PChar; stdcall;
begin
  Result := PChar(MensagemErro);
end;

function nfce_client_enviar(CodigoNFCE, CodigoEmpresa: Longint; token, Adicional: PChar): Longint; stdcall;
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

    Result := nfce.ClientEnviar;

    MensagemErro := nfce.MensagemErro;
  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_client_cancelar(CodigoNFCE, CodigoEmpresa: Longint; token: PChar): Longint; stdcall;
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
  finally
    FreeAndNil(nfce);
  end;
end;

function nfce_client_inutilizar(CodigoNFCE, CodigoEmpresa: Longint; token: PChar): Longint; stdcall;
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

function nfce_client_enviar_email(CodigoNFCE, CodigoEmpresa: Longint; token, Adicional: PChar; UsarServidor: Boolean): Longint; stdcall;
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

function nfce_client_gerar_contingencia(CodigoNFCE, CodigoEmpresa: Longint; token: PChar): Longint; stdcall;
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

function nfce_client_imprimir_danfe(CodigoNFCE, CodigoEmpresa, TpImp: Longint; token, Adicional: PChar): Longint; stdcall;
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

function nfce_client_imprimir_inutilizacao(CodigoNFCE, CodigoEmpresa: Longint; token: PChar): Longint; stdcall;
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

function nfce_serv_retorna_ultimo_erro: PChar; stdcall;
begin
  Result := PChar(MensagemErroServ);
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

function nfce_serv_verificar_central_acoes_thread(CodigoEmpresa: Longint; token: PChar): Longint; stdcall;
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

function nfce_serv_verificar_central_acoes_no_thread(CodigoEmpresa: Longint; token: PChar): Longint; stdcall;
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

exports
  nfce_client_free,
  nfce_client_retorna_ultimo_erro,
  nfce_client_enviar,
  nfce_client_cancelar,
  nfce_client_inutilizar,
  nfce_client_enviar_email,
  nfce_client_gerar_contingencia,
  nfce_client_imprimir_danfe,
  nfce_client_imprimir_inutilizacao,
  nfce_serv_free,
  nfce_serv_retorna_ultimo_erro,
  nfce_serv_requisicoes_ativas_nfce,
  nfce_serv_requisicoes_ativas_impressao,
  nfce_serv_verificar_central_acoes_thread,
  nfce_serv_verificar_central_acoes_no_thread;


begin
end.



