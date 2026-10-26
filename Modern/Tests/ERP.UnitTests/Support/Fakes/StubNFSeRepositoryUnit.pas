unit StubNFSeRepositoryUnit;

interface

uses
  INFSeRepositoryUnit,
  NFSeEtdUnit,
  NFSeTypesUnit,
  NFSeAtualizarSituacaoTypesUnit,
  NFSeHistoricoEtdUnit,
  NFSeEventoEtdUnit,
  NFSeEventoModelUnit,
  NFSeResumoModelUnit,
  NFSeAtualizarSituacaoEventoTypesUnit,
  NFSeEventoResumoModelUnit,
  NFSeHistoricoTypesUnit,
  TipoComunsUnit,
  NFSeOSEtdUnit;

type
  TNFSeRepositoryStub = class(INFSeRepository)
  private
    FResumoToReturn: NFSeResumoModel;
    FNFSeToReturn: NFSeEtd;
    FGetResumoCalled: Boolean;
    FGetNFSeCalled: Boolean;
    FLastNFSeId: string;
    FLastEmpresaId: Integer;
    procedure UnexpectedCall(const AMethod: string);
  public
    constructor Create;
    destructor Destroy; override;

    function CriarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd; override;
    function CriarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd; override;
    function AlterarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd; override;
    function AlterarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd; override;
    function GetNFSe(const Id: string; EmpresaId: Integer): NFSeEtd; override;
    function GetResumoNFSe(const Id: string): NFSeResumoModel; overload; override;
    function GetResumoNFSe(const Id: string; TipoDoc: TipoDocNFSeEnumSet): NFSeResumoModel; overload; override;
    function ListarSituacaoNFSes(const Ids: TArrayString; EmpresaId: Integer): NFSeSitacaoModelArray; override;
    function AtualizarNFSe(const Input: NFSeAtualizarExcluirRascunhoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarEmEmissaoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarRejeicaoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarEmProcessamentoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarAutorizacaoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarAutorizadaNoPortalModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarCancelamentoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarCancPorSubstuicaoModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarReverterCancelamentoPortalModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarReverterAutorizacaoPortalModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarReverterSubstituicaoPortalModel): NFSeResumoModel; overload; override;
    function AtualizarNFSe(const Input: NFSeAtualizarNumeroRPSModel): NFSeEtd; overload; override;
    function PostNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd; override;
    function PutNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd; override;
    function GetNFSeEvento(const EventoId: string): NFSeEventoEtd; override;
    function GetEventoNFSe(const NFSeId: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoModel; overload; override;
    function GetEventoNFSe(const EventoId: string): NFSeEventoModel; overload; override;
    function GetResumoEventoNFSe(const NFSeId: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoResumoModel; overload; override;
    function GetResumoEventoNFSe(const NFSeId, EventoId: string): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarSituacaoEventoModel; Situacao: SituacaoNFSeEnum): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoEmEmissaoModel): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoRejeicaoModel): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoEmProcessamentoModel): NFSeEventoResumoModel; overload; override;
    function AtualizarEventoNFSe(const Input: NFSeAtualizarEventoFalhaModel): NFSeEventoResumoModel; overload; override;
    function GetLastHistorico(const NFSeId: string; TipoHistorico: TipoHistoricoNFSeEnum): NFSeHistoricoEtd; override;
    procedure PostNFSeHistorico(const Input: NFSeHistoricoModel); override;
    procedure PutNFSeHistorico(const Input: NFSeUltimoHistoricoModel); override;
    procedure CriarRelacionamento(const Input: NFSeOSEtd); override;
    procedure RemoverRelacionamento(const Input: NFSeOSEtd); override;
    function ListarRelacionamento(const NFSeId: string): NFSeOSEtdList; overload; override;
    function ListarRelacionamento(const NumeroOS: Integer): NFSeOSEtdList; overload; override;
    procedure AtualizarRetencoesNFSeOS(const Input: NFSeOSEtdList); override;

    property ResumoToReturn: NFSeResumoModel read FResumoToReturn write FResumoToReturn;
    property NFSeToReturn: NFSeEtd read FNFSeToReturn write FNFSeToReturn;
    property GetResumoCalled: Boolean read FGetResumoCalled;
    property GetNFSeCalled: Boolean read FGetNFSeCalled;
    property LastNFSeId: string read FLastNFSeId;
    property LastEmpresaId: Integer read FLastEmpresaId;
  end;

implementation

uses
  SysUtils;

constructor TNFSeRepositoryStub.Create;
begin
  inherited Create(nil);
end;

destructor TNFSeRepositoryStub.Destroy;
begin
  FNFSeToReturn.Free;
  inherited;
end;

procedure TNFSeRepositoryStub.UnexpectedCall(const AMethod: string);
begin
  raise Exception.Create('Unexpected call to TNFSeRepositoryStub.' + AMethod);
end;

function TNFSeRepositoryStub.CriarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd;
begin
  UnexpectedCall('CriarNFSeParaEmissao');
end;
function TNFSeRepositoryStub.CriarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd;
begin
  UnexpectedCall('CriarNFSeEmitidaNoPortal');
end;
function TNFSeRepositoryStub.AlterarNFSeParaEmissao(Input: NFSeEtd): NFSeEtd;
begin
  UnexpectedCall('AlterarNFSeParaEmissao');
end;
function TNFSeRepositoryStub.AlterarNFSeEmitidaNoPortal(Input: NFSeEtd): NFSeEtd;
begin
  UnexpectedCall('AlterarNFSeEmitidaNoPortal');
end;
function TNFSeRepositoryStub.GetNFSe(const Id: string; EmpresaId: Integer): NFSeEtd;
begin
  FGetNFSeCalled := True;
  FLastNFSeId := Id;
  FLastEmpresaId := EmpresaId;
  Result := FNFSeToReturn;
  FNFSeToReturn := nil;
end;
function TNFSeRepositoryStub.GetResumoNFSe(const Id: string): NFSeResumoModel;
begin
  FGetResumoCalled := True;
  FLastNFSeId := Id;
  Result := FResumoToReturn;
end;
function TNFSeRepositoryStub.GetResumoNFSe(const Id: string; TipoDoc: TipoDocNFSeEnumSet): NFSeResumoModel;
begin
  UnexpectedCall('GetResumoNFSe');
end;
function TNFSeRepositoryStub.ListarSituacaoNFSes(const Ids: TArrayString; EmpresaId: Integer): NFSeSitacaoModelArray;
begin
  UnexpectedCall('ListarSituacaoNFSes');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarExcluirRascunhoModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarEmEmissaoModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarRejeicaoModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarEmProcessamentoModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarAutorizacaoModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarAutorizadaNoPortalModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarCancelamentoModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarCancPorSubstuicaoModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarReverterCancelamentoPortalModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarReverterAutorizacaoPortalModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarReverterSubstituicaoPortalModel): NFSeResumoModel;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.AtualizarNFSe(const Input: NFSeAtualizarNumeroRPSModel): NFSeEtd;
begin
  UnexpectedCall('AtualizarNFSe');
end;
function TNFSeRepositoryStub.PostNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd;
begin
  UnexpectedCall('PostNFSeEvento');
end;
function TNFSeRepositoryStub.PutNFSeEvento(Input: NFSeEventoEtd): NFSeEventoEtd;
begin
  UnexpectedCall('PutNFSeEvento');
end;
function TNFSeRepositoryStub.GetNFSeEvento(const EventoId: string): NFSeEventoEtd;
begin
  UnexpectedCall('GetNFSeEvento');
end;
function TNFSeRepositoryStub.GetEventoNFSe(const NFSeId: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoModel;
begin
  UnexpectedCall('GetEventoNFSe');
end;
function TNFSeRepositoryStub.GetEventoNFSe(const EventoId: string): NFSeEventoModel;
begin
  UnexpectedCall('GetEventoNFSe');
end;
function TNFSeRepositoryStub.GetResumoEventoNFSe(const NFSeId: string; EmpresaId: Integer; TipoEvento: TipoEventoNFSeEnum): NFSeEventoResumoModel;
begin
  UnexpectedCall('GetResumoEventoNFSe');
end;
function TNFSeRepositoryStub.GetResumoEventoNFSe(const NFSeId, EventoId: string): NFSeEventoResumoModel;
begin
  UnexpectedCall('GetResumoEventoNFSe');
end;
function TNFSeRepositoryStub.AtualizarEventoNFSe(const Input: NFSeAtualizarSituacaoEventoModel; Situacao: SituacaoNFSeEnum): NFSeEventoResumoModel;
begin
  UnexpectedCall('AtualizarEventoNFSe');
end;
function TNFSeRepositoryStub.AtualizarEventoNFSe(const Input: NFSeAtualizarEventoEmEmissaoModel): NFSeEventoResumoModel;
begin
  UnexpectedCall('AtualizarEventoNFSe');
end;
function TNFSeRepositoryStub.AtualizarEventoNFSe(const Input: NFSeAtualizarEventoRejeicaoModel): NFSeEventoResumoModel;
begin
  UnexpectedCall('AtualizarEventoNFSe');
end;
function TNFSeRepositoryStub.AtualizarEventoNFSe(const Input: NFSeAtualizarEventoEmProcessamentoModel): NFSeEventoResumoModel;
begin
  UnexpectedCall('AtualizarEventoNFSe');
end;
function TNFSeRepositoryStub.AtualizarEventoNFSe(const Input: NFSeAtualizarEventoFalhaModel): NFSeEventoResumoModel;
begin
  UnexpectedCall('AtualizarEventoNFSe');
end;
function TNFSeRepositoryStub.GetLastHistorico(const NFSeId: string; TipoHistorico: TipoHistoricoNFSeEnum): NFSeHistoricoEtd;
begin
  UnexpectedCall('GetLastHistorico');
end;
procedure TNFSeRepositoryStub.PostNFSeHistorico(const Input: NFSeHistoricoModel);
begin
  UnexpectedCall('PostNFSeHistorico');
end;
procedure TNFSeRepositoryStub.PutNFSeHistorico(const Input: NFSeUltimoHistoricoModel);
begin
  UnexpectedCall('PutNFSeHistorico');
end;
procedure TNFSeRepositoryStub.CriarRelacionamento(const Input: NFSeOSEtd);
begin
  UnexpectedCall('CriarRelacionamento');
end;
procedure TNFSeRepositoryStub.RemoverRelacionamento(const Input: NFSeOSEtd);
begin
  UnexpectedCall('RemoverRelacionamento');
end;
function TNFSeRepositoryStub.ListarRelacionamento(const NFSeId: string): NFSeOSEtdList;
begin
  UnexpectedCall('ListarRelacionamento');
end;
function TNFSeRepositoryStub.ListarRelacionamento(const NumeroOS: Integer): NFSeOSEtdList;
begin
  UnexpectedCall('ListarRelacionamento');
end;
procedure TNFSeRepositoryStub.AtualizarRetencoesNFSeOS(const Input: NFSeOSEtdList);
begin
  UnexpectedCall('AtualizarRetencoesNFSeOS');
end;

end.
