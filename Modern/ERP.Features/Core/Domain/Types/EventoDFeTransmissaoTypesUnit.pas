unit EventoDFeTransmissaoTypesUnit;

interface

uses
  SysUtils, TipoEventoDFeUnit, EventoDFeStatusUnit;

type
  TEventoDFeItemImobilizacao = record
    NItem: Integer;
    VIBS: Double;
    VCBS: Double;
    QImobilizado: Double;
    UImobilizado: string;
  end;

  TEventoDFePayload = record
    // Cada tipo usa apenas o proprio ramo do payload.
    DataPrevisaoEntrega: TDate;
    Itens: array of TEventoDFeItemImobilizacao;
  end;

  TEventoDFeRequisicaoPreparo = record
    CodEmpresa: Integer;
    ChaveDocumento: string;
    TipoEvento: TipoEventoDFe;
    NSeqEvento: Integer;
    IdLote: Int64;
    DhEvento: TDateTime;
    Uf: string;
    Cnpj: string;
    COrgao: Integer;
    TpAutor: Integer;
    COrgaoAutor: Integer;
    Payload: TEventoDFePayload;
  end;

  IEventoDFeEnvioPreparado = interface
  ['{9A41E6C2-7D58-4B0F-8C31-5E2D9F7A4B63}']
    function GetXmlEnvio: string;
    function GetAmbiente: Integer;
    property XmlEnvio: string read GetXmlEnvio;
    property Ambiente: Integer read GetAmbiente;
  end;

  TEventoDFePreparacao = record
    Preparado: IEventoDFeEnvioPreparado;
    XmlEnvio: string;
    Ambiente: Integer;
    ErroPreparacao: string;
  end;

  TClasseResultadoEventoDFe = (crAutorizado, crRejeitado, crSemResposta);

  TEventoDFeOrigemResultado = (orNenhuma, orFiscal, orLocal);

  TEventoDFeResultadoTransmissao = record
    Classe: TClasseResultadoEventoDFe;
    OrigemResultado: TEventoDFeOrigemResultado;
    CStatLote: Integer;
    CStatEvento: Integer;
    XMotivo: string;
    NProt: string;
    DhRegEvento: TDateTime;
    XmlRetorno: string;
    XmlProcEvento: string;
    ErroTransporte: string;
  end;

  TEventoDFeEvidenciaLote = record
    CStatLote: Integer;
    XmlRetorno: string;
  end;

  TEventoDFeResultadoConsulta = record
    Respondeu: Boolean;
    CStatNFe: Integer;
    XMotivoNFe: string;
    EventoEncontrado: Boolean;
    NSeqEventoEncontrado: Integer;
    CStatEvento: Integer;
    XMotivoEvento: string;
    NProt: string;
    DhRegEvento: TDateTime;
    XmlProcEvento: string;
    ErroTransporte: string;
  end;

  TEventoDFeConflito = record
    Existe: Boolean;
    IdExistente: string;
    SeqIdExistente: Integer;
    StatusExistente: TStatusEventoDFe;
  end;

function MesclarEvidenciaDoLote(ACStatLoteAtual, ACStatLoteNovo: Integer;
  const AXmlAtual, AXmlNovo: string): TEventoDFeEvidenciaLote;

implementation

function MesclarEvidenciaDoLote(ACStatLoteAtual, ACStatLoteNovo: Integer;
  const AXmlAtual, AXmlNovo: string): TEventoDFeEvidenciaLote;
begin
  Result.CStatLote := ACStatLoteAtual;
  if ACStatLoteNovo <> 0 then
    Result.CStatLote := ACStatLoteNovo;

  Result.XmlRetorno := AXmlAtual;
  if AXmlNovo <> '' then
    Result.XmlRetorno := AXmlNovo;
end;

end.
