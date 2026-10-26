unit FakeAtualizarSituacaoNFSeServiceUnit;

interface

uses
  IAtualizarSituacaoNFSeServiceUnit,
  NFSeEtdUnit,
  NFSeResponseTypesUnit,
  NFSeEventoModelUnit,
  TributoDFeContextEtdUnit;

type
  TFakeAtualizarSituacaoNFSeService = class(TInterfacedObject, IAtualizarSituacaoNFSeService)
  private
    FReversaoCalled: Boolean;
    FLastNFSeId: string;
    FLastEmpresaId: Integer;
    FRaiseOnReversao: Boolean;
  public
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
    procedure ExecutarAutorizacaoViaPortal(const NFSe: NFSeEtd);
    procedure ExecutarCancelamento(
      const NFSeId: string;
      EmpresaId: Integer;
      const Cancelamento: NFSeResponseCancelamentoModel
    ); overload;
    procedure ExecutarCancelamento(
      const NFSeEvnt: NFSeEventoModel;
      const Cancelamento: NFSeResponseCancelamentoModel
    ); overload;
    procedure ExecutarExclusao(const Input: AtualizarSituacaoNFSeInput);
    procedure ExecutarReversaoAutorizacaoViaPortal(const NFSeId: string; EmpresaId: Integer);

    property ReversaoCalled: Boolean read FReversaoCalled;
    property LastNFSeId: string read FLastNFSeId;
    property LastEmpresaId: Integer read FLastEmpresaId;
    property RaiseOnReversao: Boolean read FRaiseOnReversao write FRaiseOnReversao;
  end;

implementation

uses
  SysUtils;

procedure TFakeAtualizarSituacaoNFSeService.ExecutarReversaoAutorizacaoViaPortal(
  const NFSeId: string;
  EmpresaId: Integer
);
begin
  FReversaoCalled := True;
  FLastNFSeId := NFSeId;
  FLastEmpresaId := EmpresaId;

  if FRaiseOnReversao then
    raise Exception.Create('Configured service failure');
end;

procedure TFakeAtualizarSituacaoNFSeService.ExecutarAutorizacao(
  const NFSe: NFSeEtd;
  const Autorizacao: NFSeResponseAutorizacaoModel;
  const TribDFeResponse: TributoDFeContextEtd
);
begin
  raise Exception.Create('Unexpected call to ExecutarAutorizacao');
end;

procedure TFakeAtualizarSituacaoNFSeService.ExecutarSubstituicao(
  const NFSe: NFSeEtd;
  const Substituicao: NFSeResponseSubstituicaoModel;
  const TribDFeResponse: TributoDFeContextEtd
);
begin
  raise Exception.Create('Unexpected call to ExecutarSubstituicao');
end;

procedure TFakeAtualizarSituacaoNFSeService.ExecutarAutorizacaoViaPortal(const NFSe: NFSeEtd);
begin
  raise Exception.Create('Unexpected call to ExecutarAutorizacaoViaPortal');
end;

procedure TFakeAtualizarSituacaoNFSeService.ExecutarCancelamento(
  const NFSeId: string;
  EmpresaId: Integer;
  const Cancelamento: NFSeResponseCancelamentoModel
);
begin
  raise Exception.Create('Unexpected call to ExecutarCancelamento');
end;

procedure TFakeAtualizarSituacaoNFSeService.ExecutarCancelamento(
  const NFSeEvnt: NFSeEventoModel;
  const Cancelamento: NFSeResponseCancelamentoModel
);
begin
  raise Exception.Create('Unexpected call to ExecutarCancelamento(evento)');
end;

procedure TFakeAtualizarSituacaoNFSeService.ExecutarExclusao(const Input: AtualizarSituacaoNFSeInput);
begin
  raise Exception.Create('Unexpected call to ExecutarExclusao');
end;

end.
