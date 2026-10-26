unit AtualizacaoCalculadoraModelUnit;

interface

uses
  TipoComunsUnit;

type
  /// <summary>
  ///   Estado da atualizacao da calculadora. 
  /// </summary>
  TEstadoAtualizacaoCalculadora = (enFalhaDirecionada, enNovaVersaoDisponivel, enVersaoCompativel, enNovaVersaoERP);

  /// <summary>
  ///   Descritor de atualizacao da calculadora.
  /// </summary>
  AtualizacaoCalculadoraModel = record
  private
    FEstado: TEstadoAtualizacaoCalculadora ;
    FVersaoLocal: string;          // Versao local
    FDatabase: string;             // 'rtc-' + VersaoRemota
    FSha256: string;               // '' quando nao aplicavel
    FDataPublicacao: string;
    FVersaoRemoto: string;         // ultima publicada
  public
    class function CreateNovo(
      AEstado: TEstadoAtualizacaoCalculadora;
      const AVersaoLocal, AVersaoRemota, ASha256, ADataBaseName: string
    ): AtualizacaoCalculadoraModel; static;

    property Estado: TEstadoAtualizacaoCalculadora  read FEstado;
    property VersaoLocal: string read FVersaoLocal;
    property Database: string read FDatabase;
    property Sha256: string read FSha256;
    property DataPublicacao: string read FDataPublicacao;
    property VersaoRemoto: string read FVersaoRemoto;
  end;

implementation

{ AtualizacaoCalculadoraModel }

class function AtualizacaoCalculadoraModel.CreateNovo(AEstado: TEstadoAtualizacaoCalculadora; const AVersaoLocal,
  AVersaoRemota, ASha256, ADataBaseName: string): AtualizacaoCalculadoraModel;
begin
  Result.FEstado := AEstado;
  Result.FVersaoLocal := AVersaoLocal;
  Result.FVersaoRemoto := AVersaoRemota;
  Result.FSha256 := ASha256;
  Result.FDatabase := ADataBaseName;
end;

end.
