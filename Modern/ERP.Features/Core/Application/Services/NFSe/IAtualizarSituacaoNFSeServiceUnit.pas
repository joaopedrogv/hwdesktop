unit IAtualizarSituacaoNFSeServiceUnit;

interface

uses
  NFSeEtdUnit, NFSeResponseTypesUnit, NFSeEventoModelUnit, NFSeTypesUnit, TributoDFeContextEtdUnit;

type
  // Esse modelo deve ficar em Core\Application\Services\NFSe\Models
  AtualizarSituacaoNFSeInput = record
  private
    FNFSeId: string;
    FEmpresaId: Integer;
    FSituacao: SituacaoNFSeEnum;
  public
    class function Create(
      const ANFSeId: string;
      AEmpresaId: Integer;
      ASituacao: SituacaoNFSeEnum
    ): AtualizarSituacaoNFSeInput; static;

    property NFSeId: string read FNFSeId;
    property EmpresaId: Integer read FEmpresaId;
    property Situacao: SituacaoNFSeEnum read FSituacao;
  end;

  // Essa interface e sua implementacao deve ficar em Core\Application\Services\NFSe
  IAtualizarSituacaoNFSeService = interface
    ['{531B52AC-DA2F-4ED3-BDCC-252116DFEF84}']
    procedure ExecutarAutorizacao(
      const NFSe: NFSeEtd;
      const Autorizacao: NFSeResponseAutorizacaoModel;
      const TribDFeResponse: TributoDFeContextEtd
    );
    procedure ExecutarSubstituicao(
      const NFSe: NFSeEtd;
      const Substituicao: NFSeResponseSubstituicaoModel;
      const TribDFeResponse: TributoDFeContextEtd
    );
    procedure ExecutarAutorizacaoViaPortal( const NFSe: NFSeEtd );
    procedure ExecutarCancelamento(const NFSeId: string; EmpresaId: Integer; const Cancelamento: NFSeResponseCancelamentoModel); overload;// ?, poderia isso?, acho que nao
    procedure ExecutarCancelamento(const NFSeEvnt: NFSeEventoModel; const Cancelamento: NFSeResponseCancelamentoModel); overload;
    procedure ExecutarExclusao(const Input: AtualizarSituacaoNFSeInput);
    procedure ExecutarReversaoAutorizacaoViaPortal( const NFSeId: string; EmpresaId: Integer );
    //procedure Executar(const Input: AtualizarSituacaoNFSeInput); overload;
  end;

implementation

{ AtualizarSituacaoNFSeInput }

class function AtualizarSituacaoNFSeInput.Create(const ANFSeId: string; AEmpresaId: Integer;
  ASituacao: SituacaoNFSeEnum): AtualizarSituacaoNFSeInput;
begin
  Result.FNFSeId := ANFSeId;
  Result.FEmpresaId := AEmpresaId;
  Result.FSituacao := ASituacao;
end;

end.

