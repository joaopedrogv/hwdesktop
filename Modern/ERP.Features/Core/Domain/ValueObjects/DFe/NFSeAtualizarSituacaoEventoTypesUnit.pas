unit NFSeAtualizarSituacaoEventoTypesUnit;

interface

uses
  SysUtils, Classes, NFSeTypesUnit, NFSeResponseTypesUnit;

type
  NFSeAtualizarSituacaoEventoModel = class
  private
    FNFSeId: string;
    FEventoId: string;
  public
    constructor Create( const ANFSeId, AEventoId: string); virtual;
    property NFSeId: string read FNFSeId;
    property EventoId: string read FEventoId;
  end;

  NFSeAtualizarSituacaoEventoDocModel = class(NFSeAtualizarSituacaoEventoModel)
  private
    FDocumento: string;
  public
    constructor Create( const ANFSeId, AEventoId, ADocumento: string ); virtual;
    property Documento: string read FDocumento;
  end;

  NFSeAtualizarEventoEmEmissaoModel = class(NFSeAtualizarSituacaoEventoModel)
  end;

  NFSeAtualizarEventoEmProcessamentoModel = class(NFSeAtualizarSituacaoEventoDocModel)
  end;

  NFSeAtualizarEventoRejeicaoModel = class(NFSeAtualizarSituacaoEventoDocModel)
  private
    FHistorico: string;
  public
    constructor Create(
      const ANFSeId, AEventoId, AXmlPedido, AHistorico: string
    );
    property Historico: string read FHistorico;
  end;

  NFSeAtualizarEventoFalhaModel = class(NFSeAtualizarEventoRejeicaoModel)
  end;

implementation

{ NFSeAtualizarSituacaoEventoModel }

constructor  NFSeAtualizarSituacaoEventoModel.Create( const ANFSeId, AEventoId: string );
begin
  FNFSeId := ANFSeId;
  FEventoId := AEventoId;
end;

{ NFSeAtualizarSituacaoEventoDocModel }

constructor NFSeAtualizarSituacaoEventoDocModel.Create(
  const ANFSeId, AEventoId, ADocumento: string
);
begin
  inherited Create(ANFSeId, AEventoId);
  FDocumento := ADocumento;
end;

{ NFSeAtualizarEventoRejeicaoModel }

constructor NFSeAtualizarEventoRejeicaoModel.Create(
  const ANFSeId, AEventoId, AXmlPedido, AHistorico: string
);
begin
  inherited Create( ANFSeId, AEventoId, AXmlPedido );
  FHistorico := AHistorico;
end;

end.
