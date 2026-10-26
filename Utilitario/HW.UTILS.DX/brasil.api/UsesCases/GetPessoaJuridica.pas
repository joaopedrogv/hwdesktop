unit GetPessoaJuridica;

interface

uses
  PessoaJuridica;

type

  GetPessoaJuridicaUseCase = class//(TUseCaseBase)
  public
    function Execute(const cnpj: WideString): string;
  end;

implementation

uses
  BrasilApi.Client,
  System.SysUtils;

{ GetPessoaJuridicaUseCase }

function GetPessoaJuridicaUseCase.Execute(const cnpj: WideString): string;
begin

  var req := RequestInput.New('cnpj', [ 'v1', cnpj ], httpGET);

  var response := BrasilApiClientSingleton.GetInstance().RawExecute(req);

  if response.StatusCode = 404 then
    raise Exception.Create('CNPJ não encontrado');

  if response.StatusCode <> 200  then
    raise Exception.CreateFmt('Erro ao realizar consulta CNPJ. Retorno: %d', [response.StatusCode]);

  Result := response.ContentAsString(TEncoding.UTF8);
end;

end.
