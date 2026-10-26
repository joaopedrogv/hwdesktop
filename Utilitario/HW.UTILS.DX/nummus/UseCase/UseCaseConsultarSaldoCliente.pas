unit UseCaseConsultarSaldoCliente;

interface

uses
  Nummus.Client,
  uClasseConexao;

type

  TUseCaseConsultarSaldoCliente = class
  public
    function Run(idcliente: string; documentocliente: string; fonecliente: string; emailcliente: string; dadosnummus: string; cod_empresa: Integer): Double;
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

{ TUseCaseConsultarSaldoCliente }

function TUseCaseConsultarSaldoCliente.Run(
  idcliente: string;
  documentocliente: string;
  fonecliente: string;
  emailcliente: string;
  dadosnummus: string;
  cod_empresa: Integer): Double;
begin
  try
    Result := 0;

    var repo := TNummusRepoSingleton.GetInstance();

    repo.CodEmpresa := cod_empresa;

    if trim(dadosnummus) = '' then
      raise Exception.Create('Configuração para cashback (nummus) não encontrada no Cadastro de API');

    if trim(idcliente) <> '' then
      idcliente := TNetEncoding.Base64.EncodeBytesToString(TEncoding.ASCII.GetBytes(idcliente));

    var req := RequestInput.New('cashback/amount', httpGET).AddQuery(
      IfThen(trim(idcliente) <> '', 'customer_id', IfThen(trim(documentocliente) <> '', 'document_number', 'phone')),
      IfThen(trim(idcliente) <> '', trim(idcliente), IfThen(trim(documentocliente) <> '', trim(documentocliente), trim(fonecliente)))
    );

    req.UrlBase := getCampoPipe(dadosnummus, 1);

    var client := NummusClientSingleton.GetInstance();

    client.ApiKey := getCampoPipe(dadosnummus, 2);
    client.ClientId := getCampoPipe(dadosnummus, 3);

    var response := client.RawExecute(req);

    if response.StatusCode <> 200  then
      raise Exception.CreateFmt('Erro ao consulta saldo acumlado do cliente. Retorno: %d', [response.StatusCode]);

    var JSON := response.ContentAsString(TEncoding.UTF8);

    var resposta := TJson.JsonToObject<TGetSaldoClienteResponse>(JSON);

    try
      Result := resposta.amount;
    finally
      FreeAndNil(resposta);
    end;
  except on E: Exception do
    begin
      Result := 0;
      ShowAtencao('Erro ao consultar saldo acumulado do cliente' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

end.
