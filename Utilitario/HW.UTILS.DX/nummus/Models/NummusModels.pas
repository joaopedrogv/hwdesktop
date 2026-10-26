unit NummusModels;

interface

type
  TSaldoClienteNummus = class;

  TSaldoClienteNummus = class
  private
    FapiKey: string;
    FclientId: string;
  published
    property apiKey: string read FapiKey write FapiKey;
    property clientId: string read FclientId write FclientId;
  end;
implementation

end.
