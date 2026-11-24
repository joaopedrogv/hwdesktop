unit ObterEventoDFe112150PorIdUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  ISessionContextUnit,
  IEventosDFeRepositoryUnit,
  IEventoDFe112150RepositoryUnit,
  EventoDFe112150EtdUnit,
  TipoEventoDFeUnit;

type
  ObterEventoDFe112150PorIdUseCase = class
  private
    FSession: ISessionContext;
    FEventosRepo: IEventosDFeRepository;
    FRepo112150: IEventoDFe112150Repository;
  public
    constructor Create(ASession: ISessionContext;
      AEventosRepo: IEventosDFeRepository;
      ARepo112150: IEventoDFe112150Repository);
    function Executar(const AId: string): EventoDFe112150Etd;
  end;

implementation

uses
  SysUtils,
  EValidacaoNegocioUnit,
  EventoDFeEtdUnit;

{ ObterEventoDFe112150PorIdUseCase }

constructor ObterEventoDFe112150PorIdUseCase.Create(ASession: ISessionContext;
  AEventosRepo: IEventosDFeRepository;
  ARepo112150: IEventoDFe112150Repository);
begin
  FSession := ASession;
  FEventosRepo := AEventosRepo;
  FRepo112150 := ARepo112150;
end;

function ObterEventoDFe112150PorIdUseCase.Executar(const AId: string): EventoDFe112150Etd;
var
  Header: EventoDFeEtd;
  DataPrevisao: TDate;
begin
  Result := nil;

  Header := FEventosRepo.ObterPorId(AId, FSession.EmpresaId);

  if Header = nil then
    Exit;

  try
    if (Header.FamiliaDocumento <> fdNFe) or
       (Header.TipoEvento <> teAtualizacaoPrevisaoEntrega) then
      raise EValidacaoNegocio.Create('Tipo de evento divergente.');

    if not FRepo112150.ObterDataPrevisao(AId, DataPrevisao) then
      Exit;

    Result := EventoDFe112150Etd.Create(Header.Id, Header.SeqId,
      Header.ChaveDocumento, Header.CodEmpresa, Header.Ativo, DataPrevisao,
      Header.DataCadastro, Header.DataAlteracao);
  finally
    Header.Free;
  end;
end;

end.
