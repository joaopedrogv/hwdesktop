unit NFSeAtualizarSituacaoTypesUnit;

interface

uses
  SysUtils, Classes, NFSeTypesUnit, NFSeResponseTypesUnit;

type
  // Mudar esse arquivo para Application\OutputPorts\Models\NFSe\
  // Classes de atualizacao parcila de dados da Nota Fiscal de Servico

  // Classes Nota Fiscal
  NFSeSituacaoModel = record
  private
    FId: string;
    FEmpresaId: Integer;
    FSituacao: SituacaoNFSeEnum;
  public
    class function Create(const Id: string; EmpresaId: Integer; Situacao: SituacaoNFSeEnum): NFSeSituacaoModel; static;
    property Id: string read FId;
    property EmpresaId: Integer read FEmpresaId;
    property Situacao: SituacaoNFSeEnum read FSituacao;
  end;

  NFSeAtualizarSituacaoModel = class
  protected
    FId: string;
    FEmpresaId: Integer;
  public
    constructor Create( const AId: string; AEmpresaId: Integer );
    property Id: string read FId;
    property EmpresaId: Integer read FEmpresaId;
  end;

  NFSeAtualizarExcluirRascunhoModel = class(NFSeAtualizarSituacaoModel)
  end;

  NFSeAtualizarSituacaoDocModel = class(NFSeAtualizarSituacaoModel)
  private
    FDocumento: string;
  public
    constructor Create( const AId: string; AEmpresaId: Integer; const ADocumento: string ); virtual;
    property Documento: string read FDocumento;
  end;

  NFSeAtualizarEmEmissaoModel = class(NFSeAtualizarSituacaoDocModel)
  end;

  NFSeAtualizarAutorizadaNoPortalModel = class(NFSeAtualizarSituacaoModel)
  end;

  NFSeAtualizarReverterAutorizacaoPortalModel = class(NFSeAtualizarSituacaoModel)
  end;

  NFSeAtualizarReverterSubstituicaoPortalModel = class(NFSeAtualizarSituacaoModel)
  end;

  NFSeAtualizarEmProcessamentoModel = class(NFSeAtualizarSituacaoModel)
  private
    FProtocolo: string;
  public
    constructor Create( const AId: string; AEmpresaId: Integer; const AProtocolo: string );
    property Protocolo: string read FProtocolo;
  end;

  NFSeAtualizarRejeicaoModel = class(NFSeAtualizarSituacaoDocModel)
  private
    FProtocolo: string;
    FHistorico: string;
  public
    constructor Create( const AId: string; AEmpresaId: Integer; const ADocumento, AProtocolo, AHistorico: string );
    property Protocolo: string read FProtocolo;
    property Historico: string read FHistorico;
  end;

  NFSeAtualizarAutorizacaoModel = class(NFSeAtualizarSituacaoModel)
  private
    FNFSeResponse: NFSeResponseAutorizacaoModel;
  public
    constructor Create(const AId: string; AEmpresaId: Integer; ANFSeResponse: NFSeResponseAutorizacaoModel);
    property NFSeResponse: NFSeResponseAutorizacaoModel read FNFSeResponse;
  end;

  NFSeAtualizarCancPorSubstuicaoModel = class(NFSeAtualizarSituacaoModel)
  private
    FOrigem: OrigemCancelamentoNFSeEnum;
    FDataProcessamento: TDateTime;
    FSubstituta: string;
  public
    constructor Create(
      const AId: string;
      AEmpresaId: Integer;
      AOrigem: OrigemCancelamentoNFSeEnum;
      ADataProcessamento: TDateTime;
      const ASubstituta: string
    );
    property Origem: OrigemCancelamentoNFSeEnum read FOrigem;
    property DataProcessamento: TDateTime read FDataProcessamento;
    property Substituta: string read FSubstituta;
  end;

  NFSeAtualizarCancelamentoModel = class
  private
    FNFSeId: string;
    FEventoId: string;
    FNFSeResponse: NFSeResponseCancelamentoModel;
  public
    constructor Create(
      const ANFSeId: string;
      const AEventoId: string;
      ANFSeResponse: NFSeResponseCancelamentoModel
    );
    destructor Destroy; override;

    property NFSeId: string read FNFSeId;
    property EventoId: string read FEventoId;
    property NFSeResponse: NFSeResponseCancelamentoModel read FNFSeResponse;
  end;

  NFSeAtualizarNumeroRPSModel = record
  private
    FId: string;
    FEmpresaId: Integer;
    FSerie: string;
    FDataEmissao: TDateTime;
  public
    class function Create(
      const Id: string;
      EmpresaId: Integer;
      const Serie: string;
      DataEmissao: TDateTime
    ): NFSeAtualizarNumeroRPSModel; static;
    property Id: string read FId;
    property EmpresaId: Integer read FEmpresaId;
    property DataEmissao: TDateTime read FDataEmissao;
    property Serie: string read FSerie;
  end;

  NFSeAtualizarReverterCancelamentoPortalModel = record
  private
    FNFSeId: string;
    FEventoId: string;
  public                
    class function Create(
      const NFSeId: string;
      const EventoId: string
    ): NFSeAtualizarReverterCancelamentoPortalModel; static;
    property NFSeId: string read FNFSeId;
    property EventoId: string read FEventoId;
  end;

implementation

{ NFSeSituacaoModel }

class function NFSeSituacaoModel.Create(
  const Id: string;
  EmpresaId: Integer;
  Situacao: SituacaoNFSeEnum
): NFSeSituacaoModel;
begin
  Result.FId := Id;
  Result.FEmpresaId := EmpresaId;
  Result.FSituacao := Situacao;
end;

{ NFSeAtualizarSituacaoModel }

constructor  NFSeAtualizarSituacaoModel.Create( const AId: string; AEmpresaId: Integer );
begin
  FId := AId;
  FEmpresaId := AEmpresaId;
end;

{ NFSeAtualizarSituacaoDocModel }

constructor NFSeAtualizarSituacaoDocModel.Create(const AId: string; AEmpresaId: Integer; const ADocumento: string);
begin
  FId := AId;
  FEmpresaId := AEmpresaId;
  FDocumento := ADocumento;
end;

{ NFSeAtualizarAutorizacaoModel }

constructor NFSeAtualizarAutorizacaoModel.Create(const AId: string; AEmpresaId: Integer;
  ANFSeResponse: NFSeResponseAutorizacaoModel);
begin
  FId := AId;
  FEmpresaId := AEmpresaId;
  FNFSeResponse := ANFSeResponse;
end;

{ NFSeAtualizarNumeroRPSModel }

class function NFSeAtualizarNumeroRPSModel.Create(const Id: string; EmpresaId: Integer;
  const Serie: string; DataEmissao: TDateTime): NFSeAtualizarNumeroRPSModel;
begin
  Result.FId := Id;
  Result.FEmpresaId := EmpresaId;
  Result.FSerie := Serie;
  Result.FDataEmissao := DataEmissao;
end;

{ NFSeAtualizarRejeicaoModel }

constructor NFSeAtualizarRejeicaoModel.Create(const AId: string; AEmpresaId: Integer; const ADocumento,
  AProtocolo, AHistorico: string);
begin
  inherited Create( AId, AEmpresaId, ADocumento );
  FProtocolo := AProtocolo;
  FHistorico := AHistorico;
end;

{ NFSeAtualizarCancelamentoModel }

constructor NFSeAtualizarCancelamentoModel.Create(
  const ANFSeId: string;
  const AEventoId: string;
  ANFSeResponse: NFSeResponseCancelamentoModel
);
begin
  FNFSeId := ANFSeId;
  FEventoId := AEventoId;
  FNFSeResponse := ANFSeResponse;
end;

destructor NFSeAtualizarCancelamentoModel.Destroy;
begin
  FNFSeResponse.Free();
  inherited;
end;

{ NFSeAtualizarReverterCancelamentoPortalModel }

class function NFSeAtualizarReverterCancelamentoPortalModel.Create(const NFSeId,
  EventoId: string): NFSeAtualizarReverterCancelamentoPortalModel;
begin
  Result.FNFSeId := NFSeId;
  Result.FEventoId := EventoId;
end;

{ NFSeAtualizarCancPorSubstuicaoModel }

constructor NFSeAtualizarCancPorSubstuicaoModel.Create(
  const AId: string;
  AEmpresaId: Integer;
  AOrigem: OrigemCancelamentoNFSeEnum;
  ADataProcessamento: TDateTime;
  const ASubstituta: string
);
begin
  FId := AId;
  FEmpresaId := AEmpresaId;
  FOrigem := AOrigem;
  FDataProcessamento := ADataProcessamento;
  FSubstituta := ASubstituta;
end;

{ NFSeAtualizarEmProcessamentoModel }

constructor NFSeAtualizarEmProcessamentoModel.Create(const AId: string; AEmpresaId: Integer; const AProtocolo: string);
begin
  inherited Create( AId, AEmpresaId );
  FProtocolo := AProtocolo;
end;

end.
