unit MemoriaCalculoServiceUnit;

interface

uses
  TratamentoClassificacaoModelUnit,
  TipoComunsUnit,
  ResultadoCbsIbsUnit,
  ImpostoSeletivoModelUnit,
  TokenizerServiceUnit,
  IFundamentacaoClassificacaoRepositoryUnit,
  ITratamentosTributariosRepositoryUnit;

type
  IMemoriaCalculoService = interface
    ['{B29E55CA-85D3-4587-A4AE-47983CB105C7}']

    function GerarMemoriaCalculoCbsIbs(
      TratamentoClassificacao: TratamentoClassificacaoModel;
      Tributo: ResultadoCbsIbs;
      Quantidade: Double;
      Unidade: string;
      Data: TDate
    ): string;

    function GerarMemoriaCalculoImpostoSeletivo(
      TratamentoClassificacao: TratamentoClassificacaoModel;
      Tributo: ImpostoSeletivoModel;
      Quantidade: Double;
      Unidade: string;
      Data: TDate
    ): string;

  end;

  MemoriaCalculoService = class(TInterfacedObject, IMemoriaCalculoService)
  private
    FFundamentacaoClassRepo: IFundamentacaoClassificacaoRepository;
    FTratamentosTribRepo: ITratamentosTributariosRepository;
  public
    constructor Create(
      FundamentacaoClassRepo: IFundamentacaoClassificacaoRepository;
      TratamentosTribRepo: ITratamentosTributariosRepository
    );

    function GerarMemoriaCalculoCbsIbs(
      TratamentoClassificacao: TratamentoClassificacaoModel;
      Tributo: ResultadoCbsIbs;
      Quantidade: Double;
      Unidade: string;
      Data: TDate
    ): string;

    function GerarMemoriaCalculoImpostoSeletivo(
      TratamentoClassificacao: TratamentoClassificacaoModel;
      Tributo: ImpostoSeletivoModel;
      Quantidade: Double;
      Unidade: string;
      Data: TDate
    ): string;
  end;

implementation

{ MemoriaCalculoService }

uses
  Sysutils,
  FundamentacaoClassificacaoModelUnit, NumberServiceUnit, SimpleStringDictionaryUnit, TratamentoTributarioEtdUnit;

constructor MemoriaCalculoService.Create(
  FundamentacaoClassRepo: IFundamentacaoClassificacaoRepository;
  TratamentosTribRepo: ITratamentosTributariosRepository
);
begin
  FFundamentacaoClassRepo := FundamentacaoClassRepo;
  FTratamentosTribRepo := TratamentosTribRepo;
end;

function MemoriaCalculoService.GerarMemoriaCalculoCbsIbs(TratamentoClassificacao: TratamentoClassificacaoModel;
  Tributo: ResultadoCbsIbs; Quantidade: Double; Unidade: string; Data: TDate): string;
var
  fundamentacao: FundamentacaoClassificacaoModel;
  tratamentoTrib: TratamentoTributarioEtd;
  norma, tratamento, baseCalculo, aliquotaAdValorem, aliquotaAdRem, percentualReducao: string;
  aliquotaDesoneracao, montanteDesoneracao, percentualDiferimento, valorDiferimento: string;
  texto: string;
  valores: SimpleStringDictionary;
begin
  tratamentoTrib := FTratamentosTribRepo.ObterTratamentoTributario( TratamentoClassificacao.IdTratamentoTributario );
  if tratamentoTrib.IsNull then
    Exit;

  fundamentacao := FFundamentacaoClassRepo.ObterPorClassificacaoTributariaId(
    TratamentoClassificacao.IdClassificacaoTributaria, Data
  );
  if fundamentacao.IsNull then
    Exit;

  valores := SimpleStringDictionary.Create();
  try
    norma := fundamentacao.TextoCurto;
    tratamento := tratamentoTrib.Descricao;
    baseCalculo := CurrencyService.Parse(Tributo.BaseCalculo.Value);
    aliquotaAdValorem := NumberService.Parse(Tributo.Aliquota);

    //aliquotaAdRem = null;
    aliquotaAdRem := NumberService.Parse( tributo.GrupoMonofasia.TributoMonofasico.AliquotaAdRem );
    percentualReducao := NumberService.Parse( tributo.GrupoReducao.PRedAliq );

    aliquotaDesoneracao := '0';
    montanteDesoneracao := '0';

    //percentualDiferimento = null;
    //valorDiferimento = null;
    if (tributo.GrupoDiferimento.PDif > 0) and
        (tributo.GrupoDiferimento.VDif > 0) then
    begin
      percentualDiferimento := NumberService.Parse( tributo.GrupoDiferimento.PDif );
      valorDiferimento := CurrencyService.Parse( tributo.GrupoDiferimento.VDif );
    end
    else
    begin
      percentualDiferimento := '0';
      valorDiferimento := '0';
    end;

    valores.Add('norma', norma);
    valores.Add('tratamento', tratamento);
    valores.Add('base_calculo', baseCalculo);
    valores.Add('aliquota_ad_valorem', aliquotaAdValorem);
    valores.Add('aliquota_ad_rem', aliquotaAdRem);
    valores.Add('quantidade', NumberService.Parse(quantidade));
    valores.Add('unidade', unidade);

    valores.Add('percentual_reducao', percentualReducao);
    valores.Add('percentual_diferimento', percentualDiferimento);
    valores.Add('valor_diferimento', valorDiferimento);
    valores.Add('aliquota_desoneracao', aliquotaDesoneracao);
    valores.Add('montante_desoneracao', montanteDesoneracao);

    texto := fundamentacao.MemoriaCalculo;

    Result := TokenizerService.SubstituirPlaceholders( texto, valores );

  finally
    valores.Free();
  end;
end;

function MemoriaCalculoService.GerarMemoriaCalculoImpostoSeletivo(TratamentoClassificacao: TratamentoClassificacaoModel;
  Tributo: ImpostoSeletivoModel; Quantidade: Double; Unidade: string; Data: TDate): string;
var
  fundamentacao: FundamentacaoClassificacaoModel;
  tratamentoTrib: TratamentoTributarioEtd;
  norma, tratamento, baseCalculo, aliquotaAdValorem, aliquotaAdRem, texto: string;
  valores: SimpleStringDictionary;
begin
  tratamentoTrib := FTratamentosTribRepo.ObterTratamentoTributario( TratamentoClassificacao.IdTratamentoTributario );
  if tratamentoTrib.IsNull then
    Exit;

  fundamentacao := FFundamentacaoClassRepo.ObterPorClassificacaoTributariaId(
    TratamentoClassificacao.IdClassificacaoTributaria, Data
  );
  if fundamentacao.IsNull then
    Exit;

  valores := SimpleStringDictionary.Create();
  try
    norma := fundamentacao.TextoCurto;
    tratamento := tratamentoTrib.Descricao;
    baseCalculo := CurrencyService.Parse( Tributo.VBCIS );
    aliquotaAdValorem := NumberService.Parse( Tributo.PIS );
    aliquotaAdRem := NumberService.Parse( Tributo.PISEspec );

    valores.Add('norma', norma);
    valores.Add('tratamento', tratamento);
    valores.Add('base_calculo', baseCalculo);
    valores.Add('aliquota_ad_valorem', aliquotaAdValorem);
    valores.Add('aliquota_ad_rem', aliquotaAdRem);
    valores.Add('quantidade', NumberService.Parse(Quantidade));
    valores.Add('unidade', unidade);

    texto := Trim(fundamentacao.MemoriaCalculo);
    if (texto = '') then
      Result := 'Texto de memória de cálculo não encontrado'
    else
      Result := TokenizerService.SubstituirPlaceholders( texto, valores );

  finally
    valores.Free();
  end;
end;

end.
