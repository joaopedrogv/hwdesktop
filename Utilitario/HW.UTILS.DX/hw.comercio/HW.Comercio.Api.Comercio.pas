unit HW.Comercio.Api.Comercio;

interface

uses
  System.Classes,
  Hw.Servicos,
  HW.Json,
  Hw.Comercio.Api,
  HW.Comercio.Api.Lojista,
  HW.Comercio.Api.Produto,
  Hw.Comercio.Api.Rest;

type
  TComercioServiceApi = class(THwComercioApi)
  public
    function LojistaInserir(lojista: TLojista): TLojista;
    function LojistaGet(cnpj: string): TLojista;
    function LojistaAlterar(lojista: TLojista): TLojista;
    function ProdutosInserir(produto: TProduto): TProduto;
    function ProdutosAlterar(produto: TProduto): TProduto;
    function ProdutosExcluir(produtoid: Integer): Integer;
    function ImagensUpload(imagens: TStrings): TStrings;
    function PedidosGet(status: Integer = 0; limit: Integer = 1; offset: Integer = 0): TComercioConsulta;
  end;

implementation

uses
  hw_utils,
  REST.Json,
  Hw.Api.Rest,
  HW.Utils.Classes.Registros_DX,
  System.SysUtils,
  System.Net.HttpClientComponent,
  IdMultipartFormData,
  IdURI,
  System.Net.HttpClient,
  System.StrUtils;

{ TComercioServiceApi }

function TComercioServiceApi.LojistaGet(cnpj: string): TLojista;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := nil;
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('lojistaca/getlojista', '?cpfcnpj=' + cnpj);
      StatCode := Api.Get(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Post(Req);
      end;
      if StatCode = 200 then
        Result := THwClassRegistros.FromJsonString<TLojista>(Api.JSONReponse)
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao obter Lojista na Api';
      FLastError.Local := 'TComercioServiceApi.LojistaGet';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TComercioServiceApi.LojistaInserir(lojista: TLojista): TLojista;
var
  Req: TRestApiReq;
  StatCode: Integer;
  Retorno: TComercioRetorno;
begin
  Result := nil;
  InitApi(URLApi);

  try

    lojista.Id  := 0;
    Api.ClearTokenAuthorization;

    Req := TRestApiReq.New('lojistaca/inserir', '', TJsonHw.ToJsonString(lojista));

    StatCode := Api.Post(Req);

    if StatCode = 401 then
    begin
      Token := nil;
      if ConcederAcesso > 0 then
        StatCode := Api.Post(Req);
    end;
    if StatCode = 200 then
    begin
      Retorno := TComercioRetorno.FromJsonString(Api.JSONReponse);
      if Retorno = nil then
        Exit;

      if Retorno.Status = 1 then
        Result := TJsonHw.ToObject<TLojista>(Retorno.Objecto)
      else
        RetornoResolverErro(Retorno);
    end
    else
      Api.RaiseApiError;//se existir erro

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao inserir Lojista na Api';
      FLastError.Local := 'TComercioServiceApi.LojistaInserir';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TComercioServiceApi.LojistaAlterar(lojista: TLojista): TLojista;
var
  Req: TRestApiReq;
  StatCode: Integer;
  Retorno: TComercioRetorno;
begin
  Result := nil;
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      lojista.Id := Token.Id;
      Req := TRestApiReq.New('lojistaca/alterar', '?lojistaid=' + lojista.Id.ToString, TJsonHw.ToJsonString(lojista));

      StatCode := Api.Post(Req);

      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Post(Req);
      end;
      if StatCode = 200 then
      begin
        Retorno := TComercioRetorno.FromJsonString(Api.JSONReponse);
        if Retorno = nil then
          Exit;

        if Retorno.Status = 1 then
          Result := TJsonHw.ToObject<TLojista>(Retorno.Objecto)
        else
          RetornoResolverErro(Retorno);
      end
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao alterar Lojista na Api';
      FLastError.Local := 'TComercioServiceApi.LojistaPut';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TComercioServiceApi.PedidosGet(status, limit, offset: Integer): TComercioConsulta;
var
  Req: TRestApiReq;
  StatCode: Integer;
begin
  Result := nil;

  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('pedidoca/getpedidos',
                             '?lojistaid=' + Token.Id.ToString +
                             '&status=' + status.ToString +
                             '&limit=' + limit.ToString +
                             '&offset=' + offset.ToString);

      StatCode := Api.Get(Req);

      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Post(Req);
      end;
      if StatCode = 200 then
        Result := TComercioConsulta.FromJson(Api.JSONReponse)
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao consultar Pedidos na Api';
      FLastError.Local := 'TComercioServiceApi.PedidosGet';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TComercioServiceApi.ProdutosAlterar(produto: TProduto): TProduto;
var
  Req: TRestApiReq;
  StatCode: Integer;
  Retorno: TComercioRetorno;
begin
  Result := nil;

  if produto.Id = 0 then
    Exit;

  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      produto.LojistaId := Token.Id;
      Req := TRestApiReq.New('produtoca/alterar', '?lojistaid=' + Token.Id.ToString, TJsonHw.ToJsonString(produto));
      StatCode := Api.Post(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Post(Req);
      end;
      if StatCode = 200 then
      begin
        Retorno := TComercioRetorno.FromJsonString(Api.JSONReponse);
        if Retorno = nil then
          Exit;

        if Retorno.Status = 1 then
          Result := TJsonHw.ToObject<TProduto>(Retorno.Objecto)
        else
          RetornoResolverErro(Retorno);
      end
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao alterar Produto na Api';
      FLastError.Local := 'TComercioServiceApi.ProdutosAlterar';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TComercioServiceApi.ProdutosExcluir(produtoid: Integer): Integer;
var
  Req: TRestApiReq;
  StatCode: Integer;
  Retorno: TComercioRetorno;
begin
  Result := 0;

  if produtoid = 0 then
    Exit;

  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      Req := TRestApiReq.New('produtoca/excluir',
                             '?lojistaid=' + Token.Id.ToString + '&id=' + produtoid.ToString);
      StatCode := Api.Post(Req);
      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Post(Req);
      end;
      if StatCode = 200 then
      begin
        Retorno := TComercioRetorno.FromJsonString(Api.JSONReponse);
        if Retorno = nil then
          Exit;

        if Retorno.Status = 1 then
          Result := 1
        else
          RetornoResolverErro(Retorno);
      end
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao exclui Produto na Api';
      FLastError.Local := 'TComercioServiceApi.ProdutosExcluir';
      FLastError.Exception := e.Message;
    end;
  end;
end;

function TComercioServiceApi.ImagensUpload(imagens: TStrings): TStrings;
var
  Documento, StrData: string;
  ANetHTTPClient: TNetHTTPClient;
  ANetHTTPRequest: TNetHTTPRequest;
  AFormData: TIdMultiPartFormDataStream;
  AResponseStream: TStringStream;
  AResp: IHTTPResponse;
  URLEncoded: string;
  I: Integer;
  chave: string;
begin
  Result := NewStringList(false, '', ',');

  chave := '6LfwACkTAAAAANgr2YY8hduMMNSftVwTJIOA59IW';

  ANetHTTPClient  := TNetHTTPClient.Create(nil);
  ANetHTTPRequest := TNetHTTPRequest.Create(ANetHTTPClient);
  AResponseStream := TStringStream.Create;
  AFormData       := TIdMultiPartFormDataStream.Create;
  try

    InitApi(URLApi);

    if not  ConcederAcesso > 0 then
      Exit;

    ANetHTTPRequest.Client := ANetHTTPClient;
    ANetHTTPRequest.Client.ResponseTimeout   := 60 * 1000;
    ANetHTTPRequest.Client.ConnectionTimeout := 60 * 1000;
//    ANetHTTPRequest.CustomHeaders['Authorization'] := Token.token_type + ' ' + Token.access_token;

    if Assigned(imagens) and (imagens.Count > 0) then
    begin

      try
        AFormData.Clear;
        for Documento in imagens do
          AFormData.AddFile(ExtractFileName(documento), documento, 'application/octet-stream');

        ANetHTTPRequest.CustomHeaders['Content-Type'] := 'multipart/form-data; boundary=' + AFormData.Boundary;


        URLEncoded := URLApi +
                      IfThen(not StrIn(RightStr(URLApi, 1),['/', '\']), '/') +
                      'arquivos/upload' +
                      '?chave=' + chave + '&cnpj=' + CNPJ;
        TIdURI.NormalizePath(URLEncoded);

        AResp := ANetHTTPRequest.Post(TIdURI.URLEncode(URLEncoded), AFormData, AResponseStream);

        if AResponseStream.DataString.Trim <> ''then
        begin
          StrData := Utf8ToAnsi(RawByteString(AResponseStream.DataString));
          if not StrData.ToLower.Trim.Equals('null') then
          begin
            StrData := StrData.Replace('[', '').Replace(']', '').Replace('"', '');
            Result.Text := StrData.Trim;
            for I := 0 to Result.Count - 1 do
              Result[I] := URLApi + IfThen(not StrIn(RightStr(URLApi, 1),['/', '\']), '/') + Result[I];
          end;
        end;

      except on E: Exception do
        begin
          FLastError.Msg := 'Erro ao fazer Upload de imagens na Api';
          FLastError.Local := 'TComercioServiceApi.ImagensUpload';
          FLastError.Exception := e.Message;
        end;
      end;
      AResponseStream.Clear;
      AFormData.Clear;
    end;

  finally
    FreeAndNil(ANetHTTPRequest);
    FreeAndNil(ANetHTTPClient);
    FreeAndNil(AFormData);
    FreeAndNil(AResponseStream);
  end;
end;

function TComercioServiceApi.ProdutosInserir(produto: TProduto): TProduto;
var
  Req: TRestApiReq;
  StatCode: Integer;
  Retorno: TComercioRetorno;
begin
  Result := nil;
  InitApi(URLApi);

  try
    if ConcederAcesso > 0 then
    begin
      produto.LojistaId := Token.Id;
      Req := TRestApiReq.New('produtoca/inserir', '?lojistaid=' + Token.Id.ToString, TJsonHw.ToJsonString(produto));

      StatCode := Api.Post(Req);

      if StatCode = 401 then
      begin
        Token := nil;
        if ConcederAcesso > 0 then
          StatCode := Api.Post(Req);
      end;
      if StatCode = 200 then
      begin
        Retorno := TComercioRetorno.FromJsonString(Api.JSONReponse);
        if Retorno = nil then
          Exit;

        if Retorno.Status = 1 then
          Result := TJsonHw.ToObject<TProduto>(Retorno.Objecto)
        else
          RetornoResolverErro(Retorno);
      end
      else
        Api.RaiseApiError;//se existir erro
    end;

  except on E: Exception do
    begin
      FLastError.Msg := 'Erro ao alterar Produt na Api';
      FLastError.Local := 'TComercioServiceApi.ProdutosInserir';
      FLastError.Exception := e.Message;
    end;
  end;
end;

end.
