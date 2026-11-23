unit EventoDFeTransmissaoEtdUnit;

interface

uses
  SysUtils,
  EventoDFeTransmissaoTypesUnit;

type
  TEventoDFeTransmissaoEtd = class
  private
    FId: string;
    FEventoDFeId: string;
    FIdLote: Int64;
    FDhEvento: TDateTime;
    FDataInicio: TDateTime;
    FDataFim: TDateTime;
    FConcluida: Boolean;
    FCStatLote: Integer;
    FCStatEvento: Integer;
    FOrigemResultado: TEventoDFeOrigemResultado;
    FXmlEnvio: string;
    FXmlRetorno: string;
    FXmlProcEvento: string;
  public
    class function Novo(const AEventoDFeId: string; const AIdLote: Int64;
      const ADhEvento: TDateTime): TEventoDFeTransmissaoEtd;
    // UUID atribuido pelo repositorio no registro da tentativa.
    property Id: string read FId write FId;
    property EventoDFeId: string read FEventoDFeId write FEventoDFeId;
    property IdLote: Int64 read FIdLote write FIdLote;
    property DhEvento: TDateTime read FDhEvento write FDhEvento;
    property DataInicio: TDateTime read FDataInicio write FDataInicio;
    property DataFim: TDateTime read FDataFim write FDataFim;
    property Concluida: Boolean read FConcluida write FConcluida;
    property CStatLote: Integer read FCStatLote write FCStatLote;
    property CStatEvento: Integer read FCStatEvento write FCStatEvento;
    property OrigemResultado: TEventoDFeOrigemResultado
      read FOrigemResultado write FOrigemResultado;
    property XmlEnvio: string read FXmlEnvio write FXmlEnvio;
    property XmlRetorno: string read FXmlRetorno write FXmlRetorno;
    property XmlProcEvento: string read FXmlProcEvento write FXmlProcEvento;
  end;

implementation

class function TEventoDFeTransmissaoEtd.Novo(const AEventoDFeId: string;
  const AIdLote: Int64;
  const ADhEvento: TDateTime): TEventoDFeTransmissaoEtd;
begin
  Result := TEventoDFeTransmissaoEtd.Create;
  Result.FEventoDFeId := AEventoDFeId;
  Result.FIdLote := AIdLote;
  Result.FDhEvento := ADhEvento;
  Result.FOrigemResultado := orNenhuma;
end;

end.
