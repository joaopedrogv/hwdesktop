unit PreparacaoCalculoServiceInterUnit;

interface

uses
  IPreparacaoCalculoServiceUnit,
  CalcularTributoInputUnit,
  TipoComunsUnit,
  ValidacaoOutputUnit,
  ValidacaoItemOutputUnit,
  IMunicipiosRepositoryUnit,
  ITributoSituacaoTributariaRepositoryUnit,
  ITratamentoClassificacaoRepositoryUnit,
  IClassificacaoTributariaRepositoryUnit,
  ItemCalculoInputUnit,
  PreparacaoResultadoUnit,
  TipoTributoEnumUnit,
  TratamentoOperacaoModelUnit,
  ClassificacaoTributariaEtdUnit,
  TratamentoClassificacaoEtdUnit,
  INcmsRepositoryUnit,
  INbsRepositoryUnit,
  IAliquotaAdValoremProdutoRepositoryUnit,
  IAliquotaAdValoremServicoRepositoryUnit,
  IAliquotaAdRemProdutoRepositoryUnit,
  AliquotaImpostoSeletivoModelUnit,
  NcmAplicavelServiceUnit,
  NbsAplicavelServiceUnit, IClassificacaoTributariaServiceUnit, ClassificacaoTributariaModelUnit,
  TratamentoClassificacaoModelUnit, IRedutorCompraGovernamentalRepositoryUnit;

type
  PreparacaoCalculoServiceInter = class(TInterfacedObject, IPreparacaoCalculoServiceInter)
  private
    FNcmRepo: INcmsRepository;
    FNbsRepo: INbsRepository;
    FMunicipioRepo: IMunicipiosRepository;
    FTributoSituacaoTributariaRepo: ITributoSituacaoTributariaRepository;
    FClassificaoTribRepo: IClassificacaoTributariaRepository;
    FTratamentoClassRepo: ITratamentoClassificacaoRepository;
    FNcmAplicavelService: INcmAplicavelService;
    FNbsAplicavelService: INbsAplicavelService;
    FAliqAdValoremProdRepo: IAliquotaAdValoremProdutoRepository;
    FAliqAdValoremServRepo: IAliquotaAdValoremServicoRepository;
    FAliqAdRemProdRepo: IAliquotaAdRemProdutoRepository;
    FRedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository;
    FClassificacaoTributariaService: IClassificacaoTributariaService;
    FValidacao: ValidacaoOutput;
    //FClassificacaoRepo: IClassificacaoTributariaRepository;
  private
    procedure ValidarUF(const UF: string; out CodigoUF: Integer);
    procedure ValidarMunicipio(Codigo: Integer; const UF: string);
    procedure ValidarNcmNbs(const Item: ItemCalculoInput; const NCM, NBS: string; Data: TDate);
    procedure ValidarCST(const Item: ItemCalculoInput; TributoId: TipoTributoEnum; Data: TDate);
    procedure ValidarQuantidadeEUnidade(const Item: ItemCalculoInput; Aliquota: AliquotaImpostoSeletivoModel);
    procedure ValidarDigitos(const Item: ItemCalculoInput);
    class function DentroLimitesDigitos(const Valor: Double; const MaxInt, MaxFrac: Integer): Boolean; static;
    function ValidarClassificacaoTributariaCbsIbs(const ClassificacaTrib: ClassificacaoTributariaModel; const cst, ncm, nbs, cClassTrib: string): Boolean;
    function ValidarTratamentoClassificacao(
      const TratamentoClass: TratamentoClassificacaoModel; ClassTribId: Integer; Data: TDate
    ): Boolean;
    procedure ValidarClassificacaoTributariaIS(const ClassificacaTrib: ClassificacaoTributariaModel; const cst: string);
  private
    function ObterTratamentoOperacao(const Item: ItemCalculoInput; Data: TDate): TratamentoOperacaoModel;
    function AnalisarAliquotaImpostoSeletivo(const Item: ItemCalculoInput; Data: TDate): AliquotaImpostoSeletivoModel;
  public
    constructor Create(
      MunicipioRepo: IMunicipiosRepository;
      NcmRepo: INcmsRepository;
      NbsRepo: INbsRepository;
      TributoSituacaoTributariaRepo: ITributoSituacaoTributariaRepository;
      ClassificaoTribRepo: IClassificacaoTributariaRepository;
      TratamentoClassRepo: ITratamentoClassificacaoRepository;
      NcmAplicavelService: INcmAplicavelService;
      NbsAplicavelService: INbsAplicavelService;
      AliqAdValoremProdRepo: IAliquotaAdValoremProdutoRepository;
      AliqAdValoremServRepo: IAliquotaAdValoremServicoRepository;
      AliqAdRemProdRepo: IAliquotaAdRemProdutoRepository;
      RedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository;
      ClassificacaoTributariaService: IClassificacaoTributariaService
    );
    function Preparar(const Documento: CalcularTributoInput; const Item: ItemCalculoInput): PreparacaoResultado;
  end;

implementation

uses
  SysUtils, StrUtils, DateUtils,
  CodigosErroValidacao, MunicipioEtdUnit, TributoSituacaoTributariaEtdUnit, OperacaoTributacaoModelUnit,
  DoubleNullableUnit, NcmEtdUnit, NbsEtdUnit, CurrencyNullableUnit, AliquotaAdRemModelUnit;

{ PreparacaoCalculoServiceInter }

function PreparacaoCalculoServiceInter.AnalisarAliquotaImpostoSeletivo(
  const Item: ItemCalculoInput; Data: TDate
): AliquotaImpostoSeletivoModel;
var
  ncm, nbs, unidadeMedida: string;
  aliqAdValorem: CurrencyNullable;
  aliqAdRem: CurrencyNullable;
  aliquota: AliquotaAdRemModel;
begin
  ncm := Trim(Item.NCM);
  nbs := Trim(Item.NBS);
  aliqAdRem.SetNull();
  unidadeMedida := '';

  if Length(ncm) = 8 then
  begin
    aliqAdValorem := FAliqAdValoremProdRepo.ObterAliquota(ncm, tbtIS, Data);
    aliquota := FAliqAdRemProdRepo.ObterAliquotaAdRem(ncm, tbtIS, Data);

    if not aliquota.IsNull() then
    begin
      aliqAdRem.SetValue( aliquota.Valor );
      unidadeMedida := aliquota.UnidadeMedida;
    end;

    if not aliqAdValorem.IsNull then
      Result := AliquotaImpostoSeletivoModel.Create(aliqAdValorem, aliqAdRem, unidadeMedida);
  end

  else if Length(nbs) = 9 then
  begin
    aliqAdValorem := FAliqAdValoremServRepo.ObterAliquotaAdValorem(nbs, tbtIS, {null} 0, Data);
    if not aliqAdValorem.IsNull then
    begin
      Result := AliquotaImpostoSeletivoModel.Create(
        aliqAdValorem, aliqAdRem, ''
      );
      Exit;
    end;
  end

  else
    Result := AliquotaImpostoSeletivoModel.NullInstance();
end;

constructor PreparacaoCalculoServiceInter.Create(
  MunicipioRepo: IMunicipiosRepository;
  NcmRepo: INcmsRepository;
  NbsRepo: INbsRepository;
  TributoSituacaoTributariaRepo: ITributoSituacaoTributariaRepository;
  ClassificaoTribRepo: IClassificacaoTributariaRepository;
  TratamentoClassRepo: ITratamentoClassificacaoRepository;
  NcmAplicavelService: INcmAplicavelService;
  NbsAplicavelService: INbsAplicavelService;
  AliqAdValoremProdRepo: IAliquotaAdValoremProdutoRepository;
  AliqAdValoremServRepo: IAliquotaAdValoremServicoRepository;
  AliqAdRemProdRepo: IAliquotaAdRemProdutoRepository;
  RedutorCompraGovernamentalRepo: IRedutorCompraGovernamentalRepository;
  ClassificacaoTributariaService: IClassificacaoTributariaService
);
begin
  FMunicipioRepo := MunicipioRepo;
  FNcmRepo := NcmRepo;
  FNbsRepo := NbsRepo;
  FTributoSituacaoTributariaRepo := TributoSituacaoTributariaRepo;
  FClassificaoTribRepo := ClassificaoTribRepo;
  FTratamentoClassRepo := TratamentoClassRepo;
  FNcmAplicavelService := NcmAplicavelService;
  FNbsAplicavelService := NbsAplicavelService;
  FAliqAdValoremProdRepo := AliqAdValoremProdRepo;
  FAliqAdValoremServRepo := AliqAdValoremServRepo;
  FAliqAdRemProdRepo := AliqAdRemProdRepo;
  FRedutorCompraGovernamentalRepo := RedutorCompraGovernamentalRepo;
  FClassificacaoTributariaService := ClassificacaoTributariaService;
end;

function PreparacaoCalculoServiceInter.ValidarClassificacaoTributariaCbsIbs(
  const ClassificacaTrib: ClassificacaoTributariaModel; const cst, ncm, nbs, cClassTrib: string): Boolean;
var
  nomeclatura: string;
begin
  Result := True;

  if (ncm = '') and (nbs = '') then
    Exit;

  if ClassificacaTrib.IsNull then
  begin
    FValidacao.Add(ValidacaoItemOutput.CreateFmt(ECOD_CLASSTRIB_NAO_ENCONTRADA,
      '[cClassTrib %s]', [ cClassTrib ]
    ));
    Result := False; // Sem cClassTrib nao tem como continuar
    Exit;
  end;

  nomeclatura := Trim(ClassificacaTrib.Nomeclatura);
  //cClassTrib := Trim(ClassificacaTrib.Codigo);

  if cClassTrib <> Trim(ClassificacaTrib.Codigo) then
    FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
      ECOD_CLASSTRIB_INCORRETA, '[cClassTrib %s] incorreta com encontrada [%s]', [ cClassTrib, ClassificacaTrib.Codigo ]
    ));

  if 'NBS' = nomeclatura then
  begin
    if Trim(ncm) <> '' then
      FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
        ECOD_CLASSTRIB_NAO_SE_APLICA, '%s somente de NBS (CBS e IBS)', [cClassTrib]
      ));

  end
  else if 'NCM' = nomeclatura then
  begin
    if Trim(nbs) <> '' then
      FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
        ECOD_CLASSTRIB_NAO_SE_APLICA, '%s somente de NCM (CBS e IBS)', [cClassTrib]
      ));

  end
  else if 'CIB' = nomeclatura then
  begin
    if (Trim(ncm) <> '') or (Trim(nbs) <> '') then
      FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
        ECOD_CLASSTRIB_NAO_SE_APLICA, '%s somente de CIB (CBS e IBS)', [cClassTrib]
      ));
  end
  else if 'Nao possui' = nomeclatura then
  begin
    if (Trim(ncm) <> '') or (Trim(nbs) <> '') then
      FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
        ECOD_CLASSTRIB_NAO_SE_APLICA, '%s não se aplica a NCM, NBS ou CIB (CBS e IBS)', [cClassTrib]
      ));
  end
  else if 'CIB ou NCM' = nomeclatura then
  begin
    if Trim(nbs) <> '' then
      FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
        ECOD_CLASSTRIB_NAO_SE_APLICA, '%s somente de NCM ou CIB (CBS e IBS)', [cClassTrib]
      ));

  end
  else if 'NBS ou NCM' = nomeclatura then
  else if '' = nomeclatura then
  else
  begin
  end;

  if ClassificacaTrib.CST <> cst then
    FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
      ECOD_CLASSTRIB_NAO_VINCULADA_COM_CST, 'cClassTrib %s - CST %s - CBS e IBS', [ClassificacaTrib.Codigo, cst]
    ));
end;

procedure PreparacaoCalculoServiceInter.ValidarClassificacaoTributariaIS(const ClassificacaTrib: ClassificacaoTributariaModel;
  const cst: string);
begin
  if ClassificacaTrib.CST <> cst then
    FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
      ECOD_CLASSTRIB_NAO_VINCULADA_COM_CST, 'cClassTrib %s - CST %s - IS', [ClassificacaTrib.CST, cst]
    ));
end;

procedure PreparacaoCalculoServiceInter.ValidarCST(const Item: ItemCalculoInput; TributoId: TipoTributoEnum; Data: TDate);
var
  sitTrib: TributoSituacaoTributariaEtd;
begin
  sitTrib := FTributoSituacaoTributariaRepo.Obter(Item.CST, TributoId, Data);
  try
    if (sitTrib = nil) or sitTrib.SituacaoTributaria.IsNull() or (sitTrib.SituacaoTributaria.Codigo = '') then
      FValidacao.Add(
        ValidacaoItemOutput.Create(ECOD_SITUACAO_TRI_NAO_EXISTE,
          Format('[Item %d]', [Item.Numero])
        )
      );
  finally
    sitTrib.Free();
  end;
end;

procedure PreparacaoCalculoServiceInter.ValidarMunicipio(Codigo: Integer; const UF: string);
var
  municipio: MunicipioEtd;
begin
  municipio := FMunicipioRepo.ObterMunicipio(Codigo);
  try
    if municipio = nil then
    begin
      FValidacao.AddDistinct(ValidacaoItemOutput.Create(ECOD_MUNICIPIO_NAO_EXISTE));
      Exit;
    end

    else if (Copy(IntToStr(municipio.Codigo), 1, 2) <> IntToStr(municipio.Estado.Codigo)) or
      (municipio.Estado.Sigla <> UF)
    then
      FValidacao.AddDistinct(ValidacaoItemOutput.Create(ECOD_MUNICIPIO_NAO_PERTENCE_UF));
  finally
    municipio.Free();
  end;
end;

procedure PreparacaoCalculoServiceInter.ValidarNcmNbs(const Item: ItemCalculoInput;
  const NCM, NBS: string; Data: TDate);
var
  ncmObj: NcmEtd;
  nbsObj: NbsEtd;
begin
  if (Trim(NCM) <> '') and (Trim(NBS) <> '') then
    FValidacao.AddDistinct(ValidacaoItemOutput.Create(ECOD_NCM_E_NBS_SIMULTANEOS));

  if (Trim(NCM) <> '') then
  begin
    ncmObj := FNcmRepo.ObterNcm(NCM, Data);
    try
    if (ncmObj = nil) or (ncmObj.Codigo = '') then
      FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
        ECOD_NCM_NAO_ENCONTRADO, 'Item %d NCM %s - Data %s', [Item.Numero, NCM, FormatDateTime('dd/MM/yyyy', Data)]
      ));
    finally
      ncmObj.Free();
    end;
  end;

  if (Trim(NBS) <> '') then
  begin
    nbsObj := FNbsRepo.ObterNbs(NBS, Data);
    try
      if (nbsObj = nil) or (nbsObj.Codigo = '') then
        FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
          ECOD_NBS_NAO_ENCONTRADO, 'NBS %s - Data %s', [NBS, FormatDateTime('dd/MM/yyyy', Data)]
        ));
    finally
      nbsObj.Free();
    end;
  end;
end;

procedure PreparacaoCalculoServiceInter.ValidarQuantidadeEUnidade(const Item: ItemCalculoInput;
  Aliquota: AliquotaImpostoSeletivoModel);
begin
  // C08-03: validacao global de quantidade positiva do item (antes restrita ao bloco ad rem).
  // No Java (processarItem) a quantidade nula recebe default 1 antes desta validacao;
  // ItemCalculoInput.Quantidade e Single (sem nulo), logo a quantidade informada e usada diretamente.
  if (Item.Quantidade <= 0) then
    FValidacao.Add(
      ValidacaoItemOutput.Create( ECOD_VALIDACAO_GENERICA, 'A quantidade do item deve ser maior do que zero')
    );

  // C08-02: para IS com aliquota ad rem, a quantidade e a unidade validadas sao as do
  // Imposto Seletivo (espelho de ProcessamentoItemService.validarQuantidadeEUnidade).
  if not Aliquota.IsNull() and Aliquota.AliquotaAdRem.HasValue and not Item.ImpostoSeletivo.IsNull() then
  begin
    if (Item.ImpostoSeletivo.Quantidade <= 0) then
      FValidacao.Add(
        ValidacaoItemOutput.Create( ECOD_VALIDACAO_GENERICA, 'A quantidade do Imposto Seletivo deve ser maior do que zero para alíquota ad rem')
      );

    if (Trim(Item.ImpostoSeletivo.Unidade) = '') then
      FValidacao.Add(
        ValidacaoItemOutput.Create( ECOD_VALIDACAO_GENERICA, 'A unidade de medida do Imposto Seletivo deve ser informada para alíquota ad rem')
      );

    if (Trim(Item.ImpostoSeletivo.Unidade) <> Trim(Aliquota.UnidadeMedida)) then
      FValidacao.Add(
        ValidacaoItemOutput.CreateFmt(
          ECOD_VALIDACAO_GENERICA,
          'A unidade de medida informada %s é diferente da unidade de medida da alíquota %s',
          [ Item.ImpostoSeletivo.Unidade, Aliquota.UnidadeMedida ]
        )
      );
  end;
end;

class function PreparacaoCalculoServiceInter.DentroLimitesDigitos(
  const Valor: Double; const MaxInt, MaxFrac: Integer
): Boolean;
var
  valorStr: string;
  ponto, intDig, fracDig: Integer;
begin
  // @Digits(integer, fraction): o sinal nao conta e apenas os algarismos sao contados.
  // Valores tao grandes/pequenos que o Delphi representa em notacao cientifica excedem
  // necessariamente os limites aceitos (>= 1e15 inteiros ou < 1e-4 fracionarios).
  valorStr := Trim(FloatToStr(Abs(Valor)));

  if Pos('E', UpperCase(valorStr)) > 0 then
  begin
    Result := False;
    Exit;
  end;

  ponto := Pos(',', valorStr);
  if ponto = 0 then
  begin
    intDig := Length(valorStr);
    fracDig := 0;
  end
  else
  begin
    intDig := ponto - 1;
    fracDig := Length(valorStr) - ponto;
  end;

  Result := (intDig <= MaxInt) and (fracDig <= MaxFrac);
end;

procedure PreparacaoCalculoServiceInter.ValidarDigitos(const Item: ItemCalculoInput);
begin
  // C02-01: valores monetarios (13 inteiros / 2 fracionarios).
  if not DentroLimitesDigitos(Item.BaseCalculo, 13, 2) then
    FValidacao.Add(
      ValidacaoItemOutput.Create( ECOD_VALIDACAO_DIGITOS, 'O campo baseCalculo deve ter no máximo 13 dígitos inteiros e 2 decimais')
    );

  // C02-02: quantidade (11 inteiros / 4 fracionarios).
  if not DentroLimitesDigitos(Item.Quantidade, 11, 4) then
    FValidacao.Add(
      ValidacaoItemOutput.Create( ECOD_VALIDACAO_DIGITOS, 'O campo quantidade deve ter no máximo 11 dígitos inteiros e 4 decimais')
    );

  if not Item.ImpostoSeletivo.IsNull() then
  begin
    if not DentroLimitesDigitos(Item.ImpostoSeletivo.BaseCalculo, 13, 2) then
      FValidacao.Add(
        ValidacaoItemOutput.Create( ECOD_VALIDACAO_DIGITOS, 'O campo baseCalculo do Imposto Seletivo deve ter no máximo 13 dígitos inteiros e 2 decimais')
      );

    if not DentroLimitesDigitos(Item.ImpostoSeletivo.Quantidade, 11, 4) then
      FValidacao.Add(
        ValidacaoItemOutput.Create( ECOD_VALIDACAO_DIGITOS, 'O campo quantidade do Imposto Seletivo deve ter no máximo 11 dígitos inteiros e 4 decimais')
      );

    if not DentroLimitesDigitos(Item.ImpostoSeletivo.ImpostoInformado, 13, 2) then
      FValidacao.Add(
        ValidacaoItemOutput.Create( ECOD_VALIDACAO_DIGITOS, 'O campo impostoInformado do Imposto Seletivo deve ter no máximo 13 dígitos inteiros e 2 decimais')
      );
  end;
end;

function PreparacaoCalculoServiceInter.ValidarTratamentoClassificacao(
  const TratamentoClass: TratamentoClassificacaoModel; ClassTribId: Integer; Data: TDate
): Boolean;
begin
  Result := not TratamentoClass.IsNull;
  if TratamentoClass.IsNull then
    FValidacao.Add('Tratamento tributário não encontrado para classificação tributária com id %d e data %s',
      [ClassTribId, DateToStr(Date)]
    );
end;

procedure PreparacaoCalculoServiceInter.ValidarUF(const UF: string; out CodigoUF: Integer);
const
  CODIGOS: array[0..27] of Integer = (
     12,   27,   13,   16,   29,   23,   53,   32,   52,   21,   31,   50,   51,   15,   25,   26,   22,   41,   33,   24,   11,   14,   43,   42,   28,   35,   17 ,  99 );
  SIGLAS: array[0..27] of string = (
    'AC', 'AL', 'AM', 'AP', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO', 'EX');
var
  Indice: Integer;
begin
  Indice := IndexText(UF, SIGLAS);

  if Indice = -1 then
    FValidacao.AddDistinct(ValidacaoItemOutput.Create(ECOD_UF_INVALIDA))

  else
    CodigoUF := CODIGOS[Indice];
end;

function PreparacaoCalculoServiceInter.ObterTratamentoOperacao(
  const Item: ItemCalculoInput;
  Data: TDate
): TratamentoOperacaoModel;
var
  {
  classificacalCbsIbs: ClassificacaoTributariaEtd;
  classificacaoIS: ClassificacaoTributariaEtd;
  tratamentoCbsIbs: TratamentoClassificacaoEtd;
  tratamentoIS: TratamentoClassificacaoEtd;
  tratamentoDeson: TratamentoClassificacaoEtd;
  }
  classificacalCbsIbs: ClassificacaoTributariaModel;
  classificacaoIS: ClassificacaoTributariaModel;
  tratamentoCbsIbs: TratamentoClassificacaoModel;
  tratamentoIS: TratamentoClassificacaoModel;
  tratamentoDeson: TratamentoClassificacaoModel;
  aliqImpostoSel: AliquotaImpostoSeletivoModel;
  temDeson: Boolean;
  cst, cClassTrib, ncm, nbs: string;
begin

  Result := TratamentoOperacaoModel.NullInstance();

  tratamentoDeson := TratamentoClassificacaoModel.NullInstance();
  tratamentoIS := TratamentoClassificacaoModel.NullInstance();
  classificacaoIS := ClassificacaoTributariaModel.NullInstance();

  cClassTrib := Item.cClassTrib;
  cst := Item.CST;
  ncm := item.NCM;
  nbs := item.NBS;
  temDeson := False;

  classificacalCbsIbs := FClassificacaoTributariaService.ObterClassificacaoTributariaCbsIbs(Item.cClassTrib, Data);
  if not ValidarClassificacaoTributariaCbsIbs(classificacalCbsIbs, cst, ncm, nbs, cClassTrib) then
    Exit;

  tratamentoCbsIbs := FTratamentoClassRepo.ObterTratamentoClassificacaomodel(classificacalCbsIbs.Id, Data);
  if not ValidarTratamentoClassificacao(tratamentoCbsIbs, classificacalCbsIbs.Id, Data) then
    Exit;

  if tratamentoCbsIbs.InExigeGrupoDesoneracao then
  begin
    if Item.TributacaoRegular.cClassTrib = '' then
      FValidacao.Add(ValidacaoItemOutput.Create(ECOD_TRIB_REGULAR_NAO_IFNFO_EM_DESON,
        Format('[Item %d]', [Item.Numero])
      ))

    else
    begin

      cClassTrib := Item.TributacaoRegular.cClassTrib;
      cst := Item.TributacaoRegular.CST;
      ncm := item.NCM;
      nbs := item.NBS;

      tratamentoDeson := tratamentoCbsIbs;

      classificacalCbsIbs := FClassificacaoTributariaService.ObterClassificacaoTributariaCbsIbs(cClassTrib, Data);
      if not ValidarClassificacaoTributariaCbsIbs(classificacalCbsIbs, cst, ncm, nbs, cClassTrib) then
        Exit;

      tratamentoCbsIbs := FTratamentoClassRepo.ObterTratamentoClassificacaomodel(classificacalCbsIbs.Id, Data);
      if not ValidarTratamentoClassificacao(tratamentoCbsIbs, classificacalCbsIbs.Id, Data) then
        Exit;

      if tratamentoCbsIbs.InIncompativelComSuspensao then
        FValidacao.Add(ValidacaoItemOutput.Create(ECOD_CLASSTRIB_INCOMPATIVEL_SUSPENSAO,
          Format('[Item %d]', [Item.Numero])
        ))

      else
         temDeson := True;
    end;
  enD

  else
  begin
    //if (item.getTributacaoRegular() != null)
        //throw new DesoneracaoInformadaIndevidamenteException(cClassTrib, cst);
  end;

  if (ncm = '') and (nbs = '') then
  begin
    FNcmAplicavelService.Validar(ncm, classificacalCbsIbs.Id, data, 'CBS e IBS');
    FNbsAplicavelService.Validar(nbs, classificacalCbsIbs.Id, data, 'CBS e IBS');
  end;

  if Trim(ncm) <> '' then
    FNcmAplicavelService.Validar(ncm, classificacalCbsIbs.Id, data, 'CBS e IBS');

  if Trim(nbs) <> '' then
    FNbsAplicavelService.Validar(nbs, classificacalCbsIbs.Id, data, 'CBS e IBS');

  aliqImpostoSel := AnalisarAliquotaImpostoSeletivo( Item, Data );

  if YearOf(Data) >= 2027 then
  begin
    if not aliqImpostoSel.IsNull() then
    begin
      if not item.ImpostoSeletivo.IsValid then
        FValidacao.AddDistinct(ValidacaoItemOutput.CreateFmt(
          ECOD_IMPOSTO_IS_NAO_INFORMADO, '%s %s - Data %s', [
            IfThen(ncm <> '', 'NCM', 'NBS'),
            IfThen(ncm <> '', ncm, nbs),
            FormatDateTime('dd/MM/yyyy', Data)
          ]
        ))

      else
      begin
        ValidarQuantidadeEUnidade(item, aliqImpostoSel);
        ValidarCST( Item, tbtIS, Data );
        classificacaoIS := FClassificacaoTributariaService.ObterClassificacaoTributariaImpostoSeletivo(
          Item.ImpostoSeletivo.CClassTrib, Data
        );
        ValidarClassificacaoTributariaIS( classificacaoIS, Item.ImpostoSeletivo.Cst );
        tratamentoIS := FTratamentoClassRepo.ObterTratamentoClassificacaomodel( classificacaoIS.Id, Data );
        if not ValidarTratamentoClassificacao(tratamentoIS, classificacaoIS.Id, Data) then
          Exit;
      end;
    end

    else if aliqImpostoSel.IsNull() and not Item.ImpostoSeletivo.IsNull() then
    begin
      //throw new ImpostoSeletivoInformadoIndevidamenteException(ncm, data);
    end;

    if not aliqImpostoSel.IsNull() and not classificacaoIS.IsNull then // Adicionei o teste "not classificacaoIS.IsNull", pois ta vindo aliquota e nao tem IS ainda
    begin
      if (ncm = '') and (nbs = '') then
      begin
        FNcmAplicavelService.Validar(ncm, classificacaoIS.Id, data, 'Imposto Seletivo');
        FNbsAplicavelService.Validar(nbs, classificacaoIS.Id, data, 'Imposto Seletivo');
      end;

      if Trim(ncm) <> '' then
        FNcmAplicavelService.Validar(ncm, classificacaoIS.Id, data, 'Imposto Seletivo');

      if Trim(nbs) <> '' then
        FNbsAplicavelService.Validar(nbs, classificacaoIS.Id, data, 'Imposto Seletivo');
    end;
  end;

  Result := TratamentoOperacaoModel.Create(
    tratamentoCbsIbs,
    tratamentoIS,
    tratamentoDeson,
    aliqImpostoSel,
    temDeson
  );
end;

function PreparacaoCalculoServiceInter.Preparar(
  const Documento: CalcularTributoInput;
  const Item: ItemCalculoInput
): PreparacaoResultado;
var
  codigoUF: Integer;
  tratamentoOp: TratamentoOperacaoModel;
  pRedutorCompraGov: Currency;
begin

  codigoUF := -1;

  FValidacao := ValidacaoOutput.Create();

  ValidarDigitos( Item );

  ValidarUF( Documento.UF, codigoUF );

  ValidarMunicipio( Documento.Municipio, Documento.UF );

  ValidarNcmNbs( Item, Item.NCM, Item.NBS, Documento.GetFatoGeradorAplicavel() );

  ValidarCST( Item, tbtCBS, Documento.GetFatoGeradorAplicavel() );

  tratamentoOp := ObterTratamentoOperacao(Item, Documento.GetFatoGeradorAplicavel());

  // Sem compra governamental, pRedutor e ZERO e o repositorio nao e consultado
  // (espelho do guard nulo em RedutorCompraGovernamentalService.buscarValorRedutor).
  pRedutorCompraGov := 0;
  if not Documento.GCompraGov.IsNull() then
    pRedutorCompraGov := FRedutorCompraGovernamentalRepo.ObterValorRedutor(Documento.GetFatoGeradorAplicavel()).Value;

  Result := PreparacaoResultado.Create(
    OperacaoTributacaoModel.Create(
      Documento.GetFatoGeradorAplicavel(),
      Documento.Municipio,
      codigoUF,
      Item.NCM,
      Item.NBS,
      Item,
      tratamentoOp,
      Documento.GetTpEnteGov(),
      pRedutorCompraGov
    ),
    FValidacao
  );

end;

end.
