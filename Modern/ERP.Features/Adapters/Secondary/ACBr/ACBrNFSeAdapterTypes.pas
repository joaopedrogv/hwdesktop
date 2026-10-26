unit ACBrNFSeAdapterTypes;

interface

uses
  SysUtils, Classes;

type
  ACBrSubstituirInput = record
  private
    FChave: string;
    FCodigoMotivo: string;
    FJustificativa: string;
    FSerie: string;
    FNumeroRps: Integer;
    FNumeroNFSe: string;
    FNumeroLote: string;
    FCodigoVerificacao: string;
  public
    class function Create(
      const Chave: string;
      const CodigoMotivo: string;
      const Justificativa: string;
      const Serie: string;
      const NumeroRps: Integer;
      const NumeroNFSe: string;
      const NumeroLote: string;
      const CodigoVerificacao: string
    ): ACBrSubstituirInput; static;

    property Chave: string read FChave;
    property CodigoMotivo: string read FCodigoMotivo;
    property Justificativa: string read FJustificativa;
    property Serie: string read FSerie;
    property NumeroRps: Integer read FNumeroRps;
    property NumeroNFSe: string read FNumeroNFSe;
    property NumeroLote: string read FNumeroLote;
    property CodigoVerificacao: string read FCodigoVerificacao;
  end;

  ACBrConsultarInput = record
  private
    FXmlDoc: string;
    FNumRPS: string;
    FSerie: string;
    FProtocolo: string;
    FTipo: string;
    FNumLote: string;
  public
    class function Create(
      const AXmlDoc: string;
      const ANumRPS: string;
      const ASerie: string;
      const AProtocolo: string;
      const ATipo: string;
      const ANumLote: string
    ): ACBrConsultarInput; static;

    property XmlDps: string read FXmlDoc;
    property NumRPS: string read FNumRPS;
    property Serie: string read FSerie;
    property Protocolo: string read FProtocolo;
    property Tipo: string read FTipo;
    property NumLote: string read FNumLote;
  end;

  ACBrConsultarCancInput = record
  private
    FXmlNFSe: string;
  public
    class function Create(
      const XmlNFSe: string
      //... adicionar mais quando implementar o padrao das Abrasf
    ): ACBrConsultarCancInput; static;
    property XmlNFSe: string read FXmlNFSe;
  end;

  ACBrSalvarPDFInput = record
  end;

  ACBrCancelarInput = record
  private
    FXMLNFSe: string;
    FCCancelamento: string;
    FXMotivo: string;
    FVersaoApp: string;
    FDataEvento: TDateTime;
  public
    class function Create(
      const XMLNFSe: string;
      const CCancelamento: string;
      const XMotivo: string;
      const VersaoApp: string;
      DataEvento: TDateTime
    ): ACBrCancelarInput; static;

    property XMLNFSe: string read FXMLNFSe;
    property CCancelamento: string read FCCancelamento;
    property XMotivo: string read FXMotivo;
    property VersaoApp: string read FVersaoApp;
    property DataEvento: TDateTime read FDataEvento;
  end;

implementation

{ ACBrConsultarInput }

class function ACBrConsultarInput.Create(
  const AXmlDoc: string;
  const ANumRPS: string;
  const ASerie: string;
  const AProtocolo: string;
  const ATipo: string;
  const ANumLote: string
): ACBrConsultarInput;
begin
  Result.FXmlDoc := AXmlDoc;
  Result.FNumRPS := ANumRPS;
  Result.FSerie := ASerie;
  Result.FProtocolo := AProtocolo;
  Result.FTipo := ATipo;
  Result.FNumLote := ANumLote;
end;

{ ACBrCancelarInput }

class function ACBrCancelarInput.Create(
  const XMLNFSe, CCancelamento, XMotivo, VersaoApp: string;
  DataEvento: TDateTime
): ACBrCancelarInput;
begin
  Result.FXMLNFSe := XMLNFSe;
  Result.FCCancelamento := CCancelamento;
  Result.FXMotivo := XMotivo;
  Result.FVersaoApp := VersaoApp;
  Result.FDataEvento := DataEvento;
end;

{ ACBrSubstituirInput }

class function ACBrSubstituirInput.Create(const Chave, CodigoMotivo, Justificativa, Serie: string;
  const NumeroRps: Integer; const NumeroNFSe, NumeroLote, CodigoVerificacao: string): ACBrSubstituirInput;
begin
  Result.FChave := Chave;
  Result.FCodigoMotivo := CodigoMotivo;
  Result.FJustificativa := Justificativa;
  Result.FSerie := Serie;
  Result.FNumeroRps := NumeroRps;
  Result.FNumeroNFSe := NumeroNFSe;
  Result.FNumeroLote := NumeroLote;
  Result.FCodigoVerificacao := CodigoVerificacao;
end;

{ ACBrConsultarCancInput }

class function ACBrConsultarCancInput.Create(const XmlNFSe: string): ACBrConsultarCancInput;
begin
  Result.FXmlNFSe:= XmlNFSe;
end;

end.
