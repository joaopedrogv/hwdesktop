unit INFSeRepositoryUnit;

interface

uses
  SysUtils, Classes,
  CacheableRepositoryUnit, NFSeEtdUnit, NFSeTypesUnit, NFSeAtualizarSituacaoTypesUnit, NFSeHistoricoEtdUnit,
  NFSeEventoEtdUnit, NFSeDocModelUnit, NFSeEventoModelUnit, NFSeResumoModelUnit, NFSeAtualizarSituacaoEventoTypesUnit,
  NFSeEventoResumoModelUnit, NFSeHistoricoTypesUnit, TipoComunsUnit, NFSeOSEtdUnit;

type
  INFSeRepository = class(CacheableRepository)
  private
    {$REGION 'Nao usados'}
    //function GetDocNFSe(const Id: string; EmpresaId: Integer; TipoDoc: TipoDocNFSeEnumSet): NFSeDocModel; virtual; abstract;
    //procedure PostNFSeHistorico(Input: NFSeHistoricoEtd); overload; virtual; abstract;
    {$ENDREGION}
  public
    function CriarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd; virtual; abstract;
    function CriarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd; virtual; abstract;
    function AlterarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd; virtual; abstract;
    function AlterarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd; virtual; abstract;
    function GetNFSe(const Id: string; EmpresaId: Integer): NFSeEtd; virtual; abstract;
    function GetResumoNFSe(const Id: string): NFSeResumoModel; overload; virtual; abstract;
    function GetResumoNFSe(const Id: string; TipoDoc: TipoDocNFSeEnumSet): NFSeResumoModel; overload; virtual; abstract;
    function ListarSituacaoNFSes(const Ids: TArrayString; EmpresaId: Integer): NFSeSitacaoModelArray; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarExcluirRascunhoModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarEmEmissaoModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarRejeicaoModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarEmProcessamentoModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarAutorizacaoModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarAutorizadaNoPortalModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarCancelamentoModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarCancPorSubstuicaoModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarReverterCancelamentoPortalModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarReverterAutorizacaoPortalModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarReverterSubstituicaoPortalModel): NFSeResumoModel; overload; virtual; abstract;
    function AtualizarNFSe(const Input: NFSeAtualizarNumeroRPSModel): NFSeEtd; overload; virtual; abstract;

    function PostNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd; virtual; abstract;
    function PutNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd; virtual; abstract;
    function GetNFSeEvento(const EventoId: string): NFSeEventoEtd; virtual; abstract;
    function GetEventoNFSe(const NFSeId: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoModel; overload; virtual; abstract;
    function GetEventoNFSe(const EventoId: string): NFSeEventoModel; overload; virtual; abstract;
    function GetResumoEventoNFSe(const NFSeId: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoResumoModel; overload; virtual; abstract;
    function GetResumoEventoNFSe(const NFSeId, EventoId: string): NFSeEventoResumoModel; overload; virtual; abstract;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarSituacaoEventoModel; Situacao: SituacaoNFSeEnum): NFSeEventoResumoModel; overload; virtual; abstract;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoEmEmissaoModel): NFSeEventoResumoModel; overload; virtual; abstract;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoRejeicaoModel): NFSeEventoResumoModel; overload; virtual; abstract;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoEmProcessamentoModel): NFSeEventoResumoModel; overload; virtual; abstract;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoFalhaModel): NFSeEventoResumoModel; overload; virtual; abstract;

    function GetLastHistorico(const NFSeId: string; TipoHistorico: TipoHistoricoNFSeEnum): NFSeHistoricoEtd; virtual; abstract;
    procedure PostNFSeHistorico(const Input: NFSeHistoricoModel); virtual; abstract;
    procedure PutNFSeHistorico(const Input: NFSeUltimoHistoricoModel); virtual; abstract;

    procedure CriarRelacionamento(const Input: NFSeOSEtd); virtual; abstract;
    procedure RemoverRelacionamento(const Input: NFSeOSEtd); virtual; abstract;
    function ListarRelacionamento(const NFSeId: string): NFSeOSEtdList; overload; virtual; abstract;
    function ListarRelacionamento(const NumeroOS: Integer): NFSeOSEtdList; overload; virtual; abstract;
    procedure AtualizarRetencoesNFSeOS(const Input: NFSeOSEtdList); virtual; abstract;
  end;

implementation

end.
