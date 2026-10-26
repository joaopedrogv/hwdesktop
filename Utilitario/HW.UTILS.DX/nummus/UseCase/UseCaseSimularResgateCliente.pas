unit UseCaseSimularResgateCliente;

interface

uses
  Nummus.Client,
  uClasseConexao;

type

  TUseCaseSimularResgateCliente = class
  public
    function Run(idcliente: string; documentocliente: string; fonecliente: string; emailcliente: string; dadosnummus: string; cod_empresa: Integer; valor_total: Double): Double;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  NummusRepo,
  NummusResponseModels,
  hw_utils,
  Rest.JSON,
  System.NetEncoding,
  hw_win_utils;

{ TUseCaseSimularResgateCliente }

function TUseCaseSimularResgateCliente.Run(
  idcliente: string;
  documentocliente: string;
  fonecliente: string;
  emailcliente: string;
  dadosnummus: string;
  cod_empresa: Integer;
  valor_total: Double): Double;
begin
  try
    Result := 0;

    var repo := TNummusRepoSingleton.GetInstance();

    repo.CodEmpresa := cod_empresa;

    if trim(dadosnummus) = '' then
      raise Exception.Create('Configuração para cashback (nummus) não encontrada no Cadastro de API');

    if trim(idcliente) <> '' then
      idcliente := TNetEncoding.Base64.EncodeBytesToString(TEncoding.ASCII.GetBytes(idcliente));

    var req := RequestInput.New('cashback/simulation', httpPOST).AddBody('{' +
      IfThen(trim(idcliente) <> '', '"customer_id"', IfThen(trim(documentocliente) <> '', '"document_number"', '"phone"')) + ':' +
      IfThen(trim(idcliente) <> '', '"' + trim(idcliente) + '"', IfThen(trim(documentocliente) <> '', '"' + trim(documentocliente) + '"', '"' + trim(fonecliente) + '"')) + ',' +
      '"value_purchase"' + ':' + '"' + FloatToStr(valor_total).Replace(',', '.') + '"' + '}'
    );

    req.UrlBase := getCampoPipe(dadosnummus, 1);

    var client := NummusClientSingleton.GetInstance();

    client.ApiKey := getCampoPipe(dadosnummus, 2);
    client.ClientId := getCampoPipe(dadosnummus, 3);

    var response := client.RawExecute(req);

    if response.StatusCode <> 200  then
      raise Exception.CreateFmt('Erro ao consulta saldo disponível cashback do cliente. Retorno: %d', [response.StatusCode]);

    var JSON := response.ContentAsString(TEncoding.UTF8);

    var resposta := TJson.JsonToObject<TPostSimularResgateResponse>(JSON);

    try
      Result := resposta.rescue_available;
    finally
      FreeAndNil(resposta);
    end;
  except on E: Exception do
    begin
      Result := 0;
      ShowAtencao('Erro ao consultar saldo disponível do cliente (simular resgate)' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
