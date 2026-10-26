unit ConsultarSituacoesClassificacoesPorNbsUseCaseUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/domain/service/nfse/NfseService.java#consultarSituacoesClassificacoesPorNbs

interface

uses
  IIndicadorOperacaoRepositoryUnit,
  INbsRepositoryUnit,
  TipoComunsUnit;

type
  IConsultarSituacoesClassificacoesPorNbsUseCase = interface
    ['{31E0AD23-6277-44F6-9123-14279D185E9A}']
    function Executar(const Nbs: string; Data: TDate): SituacoesClassificacoesLinha;
  end;

  ConsultarSituacoesClassificacoesPorNbsUseCase = class(TInterfacedObject, IConsultarSituacoesClassificacoesPorNbsUseCase)
  private
    FIndicadorOperacaoRepo: IIndicadorOperacaoRepository;
    FNbsRepo: INbsRepository;
  public
    constructor Create(
      const IndicadorOperacaoRepo: IIndicadorOperacaoRepository;
      const NbsRepo: INbsRepository
    );

    function Executar(const Nbs: string; Data: TDate): SituacoesClassificacoesLinha;
  end;

implementation

uses
  SysUtils;

{ ConsultarSituacoesClassificacoesPorNbsUseCase }

const
  CCLASSTRIB_FALLBACK = '000001';

constructor ConsultarSituacoesClassificacoesPorNbsUseCase.Create(
  const IndicadorOperacaoRepo: IIndicadorOperacaoRepository;
  const NbsRepo: INbsRepository);
begin
  FIndicadorOperacaoRepo := IndicadorOperacaoRepo;
  FNbsRepo := NbsRepo;
end;

function ConsultarSituacoesClassificacoesPorNbsUseCase.Executar(
  const Nbs: string; Data: TDate
): SituacoesClassificacoesLinha;
var
  fallback: SituacaoClassificacaoLinha;
begin
  if FNbsRepo.ObterNbs(Nbs, Data) = nil then
    raise Exception.CreateFmt('NBS ''%s'' não encontrada para a data %s',
      [Nbs, DateToStr(Data)]);

  Result := FIndicadorOperacaoRepo.BuscarSituacoesClassificacoesPorNbsEData(Nbs, Data);

  // Espelho do Java: quando vazio, usa a classificacao fixa "000001" como
  // fallback; se o fallback tambem for vazio, retorna lista vazia.
  if Length(Result) = 0 then
  begin
    fallback := FIndicadorOperacaoRepo.BuscarSituacaoClassificacaoPorClassificacao(CCLASSTRIB_FALLBACK, Data);

    if fallback.Encontrada then
    begin
      SetLength(Result, 1);
      Result[0] := fallback;
    end;
  end;
end;

end.
