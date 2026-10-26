unit UseCaseDownloadBoletoViaUrl;

interface

uses
  BaseUseCasePlugBoleto;

type

  TUseCaseDownloadBoletoViaUrl = class(TUseCaseBasePlugBoleto)
  public
    function Run(api_urlboleto: string): string;
  end;

implementation

uses
  System.SysUtils,
  ApiPlugBoleto;

{ TUseCaseDownloadBoletoViaUrl }

function TUseCaseDownloadBoletoViaUrl.Run(api_urlboleto: string): string;
var
  downloads: TArray<string>;
begin
  Result := '';
  try
    if api_urlboleto.Trim.IsEmpty then
      raise Exception.Create('Nenhuma url de boleto informada');

    InitUseCase();

    api := TApiPlugBoletoSingleton.GetInstance();

    downloads := api.DownloadlPDFBoleto([api_urlboleto.Trim]);

    if Length(downloads) > 0 then
      Result := downloads[0];

  except on E: Exception do
    begin
      Result := '';
      LastError :=  E.message;
    end;
  end;

end;

end.
