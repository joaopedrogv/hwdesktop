unit ObterEventoDFe211130PorIdUseCaseUnit;

interface

uses
  BaseUseCaseUnit,
  ISessionContextUnit,
  IEventosDFeRepositoryUnit,
  IEventoDFe211130RepositoryUnit,
  EventoDFe211130EtdUnit,
  TipoEventoDFeUnit;

type
  ObterEventoDFe211130PorIdUseCase = class
  private
    FSession: ISessionContext;
    FEventosRepo: IEventosDFeRepository;
    FRepo211130: IEventoDFe211130Repository;
  public
    constructor Create(ASession: ISessionContext;
      AEventosRepo: IEventosDFeRepository;
      ARepo211130: IEventoDFe211130Repository);
    function Executar(const AId: string;
      AModo: TModoEventoDFe): EventoDFe211130Etd;
  end;

implementation

uses
  SysUtils,
  EValidacaoNegocioUnit,
  StatusRegistroEnumUnit,
  EventoDFe211130ItemEtdUnit,
  EventoDFeEtdUnit;

{ ObterEventoDFe211130PorIdUseCase }

constructor ObterEventoDFe211130PorIdUseCase.Create(ASession: ISessionContext;
  AEventosRepo: IEventosDFeRepository;
  ARepo211130: IEventoDFe211130Repository);
begin
  FSession := ASession;
  FEventosRepo := AEventosRepo;
  FRepo211130 := ARepo211130;
end;

function ObterEventoDFe211130PorIdUseCase.Executar(const AId: string;
  AModo: TModoEventoDFe): EventoDFe211130Etd;
var
  Header: EventoDFeEtd;
  Itens: EventoDFe211130ItemEtdArray;
begin
  Result := nil;

  Header := FEventosRepo.ObterPorId(AId, FSession.EmpresaId);

  if Header = nil then
    Exit;

  try
    if (Header.FamiliaDocumento <> fdNFe) or
       (Header.TipoEvento <> teImobilizacaoItem) then
      raise EValidacaoNegocio.Create('Tipo de evento divergente.');

    if AModo = meAlteracao then
    begin
      if Header.Ativo <> saAtivo then
        raise EValidacaoNegocio.Create('O evento está na lixeira; use Restaurar.');
    end
    else if Header.Ativo <> saLixeira then
      raise EValidacaoNegocio.Create('O evento não está na lixeira para restauração.');

    Itens := FRepo211130.ObterItens(AId);

    Result := EventoDFe211130Etd.Create(Header.Id, Header.SeqId,
      Header.ChaveDocumento, Header.CodEmpresa, Header.Ativo, Itens,
      Header.DataCadastro, Header.DataAlteracao, AModo = meRestauracao);
  finally
    Header.Free;
  end;
end;

end.
