// Delphi Rio
unit CalculadoraApiReaderUnit;

interface

uses
  System.SysUtils,
  System.JSON,
  IDadosFiscaisReaderUnit,
  IHttpJsonClientUnit,
  JsonQueryResultUnit,
  DateAndTimeNullableUnit,
  VersaoSerproEtdUnit,
  EstadoEtdUnit,
  MunicipioEtdUnit,
  NbsEtdUnit,
  AnexoEtdUnit,
  TipoDfeEtdUnit,
  TipoDfeClassificacaoEtdUnit,
  FundamentacaoLegalEtdUnit,
  TomadorEspecificoEtdUnit,
  AliquotaReferenciaEtdUnit,
  AliquotaPadraoEtdUnit,
  SituacaoTributariaEtdUnit,
  ClassificacaoTributariaEtdUnit,
  PercentualReducaoEtdUnit,
  NcmAplicavelEtdUnit,
  NbsAplicavelEtdUnit,
  FundamentacaoClassificacaoEtdUnit,
  ExcecaoNcmAplicavelEtdUnit,
  ExcecaoNbsAplicavelEtdUnit,
  TributoSituacaoTributariaEtdUnit,
  TratamentoTributarioEtdUnit,
  TratamentoClassificacaoEtdUnit,
  AliquotaAdValoremEtdUnit,
  AliquotaAdValoremProdutoEtdUnit,
  ExcecaoAdValoremProdutoEtdUnit,
  UnidadeMedidaEtdUnit,
  AliquotaAdRemEtdUnit,
  AliquotaAdRemProdutoEtdUnit,
  ExcecaoAdRemProdutoEtdUnit,
  AliquotaAdValoremServicoEtdUnit,
  ExcecaoAdValoremServicoEtdUnit,
  AliquotaAdRemServicoEtdUnit,
  ExcecaoAdRemServicoEtdUnit,
  RedutorCompraGovernamentalEtdUnit,
  TransferenciaCBSEnteGovEtdUnit,
  ListaServicosLC116EtdUnit,
  IndicadorOperacaoEtdUnit,
  IndicadorOpNbsClassificacaoEtdUnit;

type
  /// <summary>
  ///   Implementacao de IDadosFiscaisReader sobre a API Datasette (envelope
  ///   _shape=objects, paginacao por rows/next_url). Nao implementa ObterNCMs:
  ///   NCM permanece sob responsabilidade do fluxo SICOMEX.
  /// </summary>
  CalculadoraApiReader = class(TInterfacedObject, IDadosFiscaisReader)
  private
    FHttp: IHttpJsonClient;
    FBaseUrl: string;
    FToken: string;
    FDatabase: string;

    function RemoverBarraFinal(const AUrl: string): string;
    function EnsureHttps(const AUrl: string): string;
    function MontarUrl(const ATabela: string): string;
    function ObterEnvelope(const AUrl: string): TJSONObject;
    procedure ValidarEnvelope(const AEnvelope: TJSONObject);
    function ObterRows(const AEnvelope: TJSONObject): TJSONArray;
    function ObterNextUrl(const AEnvelope: TJSONObject): string;
    procedure ProcessarPaginas(const AUrlInicial: string; const AProcessarLinha: TProc<JsonQueryResult>);
    procedure LerPaginas(const ATabela: string; const AProcessarLinha: TProc<JsonQueryResult>);
    function StrISOToDate(const Value: string): DateNullable;
  public
    constructor Create(const AHttp: IHttpJsonClient);

    procedure Configurar(const ABaseUrl, AToken, ADatabase: string);

    function ObterUltimaVersao(): VersaoSerproEtd;
    function ObterEstados(): EstadosEtd;
    function ObterMunicipios(): MunicipiosEtd;
    function ObterNBSs(): NbssEtd;
    function ObterAnexos(): AnexosEtd;
    function ObterTiposDFe(): TiposDfeEtd;
    function ObterFundamentacoesLegais(): FundamentacoesLegaisEtd;
    function ObterTomadoresEspecificos(): TomadoresEspecificosEtd;
    function ObterAliquotasReferencia(): AliquotasReferenciaEtd;
    function ObterAliquotasPadrao(): AliquotasPadraoEtd;
    function ObterSituacoesTributarias(): SituacoesTributariasEtd;
    function ObterClassificacoesTributarias(): ClassificacoesTributariasEtd;
    function ObterTiposDFePorClassificacao(): TipoDfeClassificacaoEtdList;
    function ObterPercentuaisReducao(): PercentuaisReducaoEtd;
    function ObterNCMsAplicaveis(): NcmsAplicaveisEtd;
    function ObterNBSsAplicaveis(): NbssAplicaveisEtd;
    function ObterFundamentacoesClassificacoes(): FundamentacoesClassificacoesEtd;
    function ObterExcecoesNCMAplicavel(): ExcecoesNcmAplicavelEtd;
    function ObterExcecoesNBSAplicavel(): ExcecoesNbsAplicavelEtd;
    function ObterTributoSituacoesTributarias(): TributoSituacoesTributariasEtd;
    function ObterTratamentosTributarios(): TratamentosTributariosEtd;
    function ObterTratamentosClassificacoes(): TratamentosClassificacoesEtd;
    function ObterAliquotasAdValorem(): AliquotasAdValoremEtd;
    function ObterAliquotasAdValoremProdutos(): AliquotasAdValoremProdutosEtd;
    function ObterExcecoesAdValoremProdutos(): ExcecoesAdValoremProdutosEtd;
    function ObterUnidadesMedidas(): UnidadesMedidasEtd;
    function ObterAliquotasAdRem(): AliquotaAdRemEtdList;
    function ObterAliquotasAdRemProdutos(): AliquotasAdRemProdutosEtd;
    function ObterExcecoesAdRemProdutos(): ExcecoesAdRemProdutosEtd;
    function ObterAliquotasAdValoremServicos(): AliquotasAdValoremServicosEtd;
    function ObterExcecoesAdValoremServicos(): ExcecoesAdValoremServicosEtd;
    function ObterAliquotasAdRemServicos(): AliquotasAdRemServicosEtd;
    function ObterExcecoesAdRemServicos(): ExcecoesAdRemServicosEtd;
    function ObterRedutoresCompraGovernamental(): RedutoresCompraGovernamentalEtd;
    function ObterTransferenciasCBSEnteGov(): TransferenciaCBSEnteGovEtdList;
    function ObterListaServicosLC116(): ListaServicosLC116EtdList;
    function ObterIndicadoresOperacaoIbsCbs(): IndicadoresOperacaoEtd;
    function ObterClassificacoesNbsIndOpLc(): IndicadoresOpNbsClassificacaoEtd;
  end;

implementation

uses
  StringNullableUnit,
  BooleanNullableUnit,
  IntegerNullableUnit,
  DateTimeServiceUnit,
  TipoTributoEnumUnit,
  LocalIncidenciaEnumUnit;

const
  TAMANHO_PAGINA = 1000;

function StrAsBooleanNullable(const Value: string): BooleanNullable;
begin
  if Value = '' then
    Result := BooleanNullable.NullInstance()
  else
    Result := BooleanNullable.Create(Value = '1');
end;

{ CalculadoraApiReader }

constructor CalculadoraApiReader.Create(const AHttp: IHttpJsonClient);
begin
  inherited Create;
  FHttp := AHttp;
end;

procedure CalculadoraApiReader.Configurar(const ABaseUrl, AToken, ADatabase: string);
begin
  FBaseUrl := RemoverBarraFinal(ABaseUrl.Trim);
  FToken := AToken;
  FDatabase := ADatabase.Trim;
end;

function CalculadoraApiReader.RemoverBarraFinal(const AUrl: string): string;
begin
  Result := AUrl;

  // Evita "//" quando a URL base operacional vier com "/" final.
  while (Result <> '') and Result.EndsWith('/') do
    Result := Result.Substring(0, Result.Length - 1);
end;

function CalculadoraApiReader.MontarUrl(const ATabela: string): string;
begin
  Result := Format(
    '%s/%s/%s.json?_shape=objects&_size=%d',
    [FBaseUrl, FDatabase, ATabela, TAMANHO_PAGINA]
  );
end;

function CalculadoraApiReader.EnsureHttps(const AUrl: string): string;
begin
  if SameText(Copy(AUrl, 1, 7), 'http://') then
    Result := 'https://' + Copy(AUrl, 8, MaxInt)
  else
    Result := AUrl;

  if not SameText(Copy(Result, 1, 8), 'https://') then
    raise Exception.Create('URL insegura retornada pela API Datasette: ' + AUrl);
end;

function CalculadoraApiReader.ObterEnvelope(const AUrl: string): TJSONObject;
var
  Resposta: THttpJsonResult;
  Valor: TJSONValue;
begin
  Resposta := FHttp.Get(AUrl, FToken);

  if not Resposta.Success then
    raise Exception.Create(Format(
      'Falha ao ler a API Datasette (status=%d): %s',
      [Resposta.StatusCode, Resposta.ErrorMessage]
    ));

  Valor := TJSONObject.ParseJSONValue(Resposta.Content);

  if (Valor = nil) or (not (Valor is TJSONObject)) then
  begin
    Valor.Free;
    raise Exception.Create('Resposta invalida da API Datasette: JSON objeto esperado.');
  end;

  Result := TJSONObject(Valor);
end;

procedure CalculadoraApiReader.ValidarEnvelope(const AEnvelope: TJSONObject);
var
  Valor: TJSONValue;
begin
  Valor := AEnvelope.GetValue('ok');

  if (Valor = nil) or (not (Valor is TJSONBool)) or (not TJSONBool(Valor).AsBoolean) then
    raise Exception.Create('API Datasette retornou "ok" falso; leitura abortada.');

  Valor := AEnvelope.GetValue('truncated');

  if (Valor <> nil) and (Valor is TJSONBool) and TJSONBool(Valor).AsBoolean then
    raise Exception.Create('API Datasette retornou "truncated=true"; leitura abortada sem lista parcial.');
end;

function CalculadoraApiReader.ObterRows(const AEnvelope: TJSONObject): TJSONArray;
var
  Valor: TJSONValue;
begin
  Valor := AEnvelope.GetValue('rows');

  if (Valor = nil) or (Valor is TJSONNull) then
    Exit(nil);

  if not (Valor is TJSONArray) then
    raise Exception.Create('Envelope da API Datasette sem "rows" em formato de array.');

  Result := TJSONArray(Valor);
end;

function CalculadoraApiReader.ObterNextUrl(const AEnvelope: TJSONObject): string;
var
  Valor: TJSONValue;
begin
  Valor := AEnvelope.GetValue('next_url');

  if (Valor = nil) or (Valor is TJSONNull) then
    Exit('');

  if Valor is TJSONString then
    Result := TJSONString(Valor).Value
  else
    Result := Valor.Value;

  Result := Trim(Result);
end;

procedure CalculadoraApiReader.ProcessarPaginas(
  const AUrlInicial: string;
  const AProcessarLinha: TProc<JsonQueryResult>
);
var
  Url: string;
  NextUrl: string;
  Envelope: TJSONObject;
  Rows: TJSONArray;
  Qr: JsonQueryResult;
  RowIndex: Integer;
  I: Integer;
begin
  Url := AUrlInicial;
  RowIndex := 0;

  while True do
  begin
    Envelope := ObterEnvelope(Url);
    try
      ValidarEnvelope(Envelope);

      Rows := ObterRows(Envelope);

      if Assigned(Rows) then
        for I := 0 to Rows.Count - 1 do
        begin
          if Rows.Items[I] is TJSONObject then
          begin
            // JsonQueryResult NAO possui o objeto: o envelope e o dono.
            Qr := JsonQueryResult.Create(TJSONObject(Rows.Items[I]), False, RowIndex);
            try
              AProcessarLinha(Qr);
            finally
              Qr.Free;
            end;
          end;

          Inc(RowIndex);
        end;

      NextUrl := ObterNextUrl(Envelope);
    finally
      Envelope.Free;
    end;

    if NextUrl = '' then
      Break;

    Url := EnsureHttps(NextUrl);
  end;
end;

procedure CalculadoraApiReader.LerPaginas(
  const ATabela: string;
  const AProcessarLinha: TProc<JsonQueryResult>
);
begin
  ProcessarPaginas(MontarUrl(ATabela), AProcessarLinha);
end;

function CalculadoraApiReader.StrISOToDate(const Value: string): DateNullable;
begin
  if Trim(Value) = '' then
    Result := DateNullable.NullInstance()
  else
    Result := DateNullable.Create(DateService.ISOToDate(Value));
end;

function CalculadoraApiReader.ObterUltimaVersao: VersaoSerproEtd;
var
  Versao: VersaoSerproEtd;
  Encontrou: Boolean;
begin
  Versao := VersaoSerproEtd.NullInstance();
  Encontrou := False;

  ProcessarPaginas(
    MontarUrl('VERSAO_BASE_DADO') + '&_sort_desc=VRBD_ID&_size=1',
    procedure(Qr: JsonQueryResult)
    begin
      if not Encontrou then
      begin
        Versao := VersaoSerproEtd.Create(
          Qr.FieldAsInteger('VRBD_ID'),
          StrISOToDate(Qr.FieldAsString('VRBD_DATA')).Value,
          Qr.FieldAsString('VRBD_DESCRICAO'),
          Qr.FieldAsStringNullable('VRBD_VERSAO_BASE_DADO')
        );
        Encontrou := True;
      end;
    end
  );

  Result := Versao;
end;

function CalculadoraApiReader.ObterEstados: EstadosEtd;
var
  Lista: EstadosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 1000);

  LerPaginas('UF',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := EstadoEtd.Create(
        Qr.FieldAsInteger('UF_CD'),
        Qr.FieldAsString('UF_SIGLA'),
        Qr.FieldAsString('UF_NOME')
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterMunicipios: MunicipiosEtd;
var
  Lista: MunicipiosEtd;
  Sucesso: Boolean;
begin
  Lista := MunicipiosEtd.Create();
  Sucesso := False;

  try
    LerPaginas('MUNICIPIO',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(MunicipioEtd.Create(
          Qr.FieldAsInteger('MUNI_CD'),
          Qr.FieldAsInteger('MUNI_UF_CD'),
          Qr.FieldAsString('MUNI_NOME')
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterNBSs: NbssEtd;
var
  Lista: NbssEtd;
  Sucesso: Boolean;
begin
  Lista := NbssEtd.Create();
  Sucesso := False;

  try
    LerPaginas('NBS',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(NbsEtd.Create(
          Qr.FieldAsString('NBS_CD'),
          Qr.FieldAsString('NBS_DESCRICAO'),
          Qr.FieldAsStringNullable('NBS_LC_116'),
          StrISOToDate(Qr.FieldAsString('NBS_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('NBS_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterAnexos: AnexosEtd;
var
  Lista: AnexosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 1000);

  LerPaginas('ANEXO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := AnexoEtd.Create(
        Qr.FieldAsInteger('ANXO_ID'),
        Qr.FieldAsString('ANXO_NUMERO'),
        Qr.FieldAsString('ANXO_DESCRICAO'),
        Qr.FieldAsString('ANXO_NUMERO_ITEM'),
        Qr.FieldAsString('ANXO_TEXTO_ITEM'),
        StrISOToDate(Qr.FieldAsString('ANXO_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('ANXO_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterTiposDFe: TiposDfeEtd;
var
  Lista: TiposDfeEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('TIPO_DFE',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := TipoDfeEtd.CreateEtd(
        Qr.FieldAsInteger('TPDF_ID'),
        Qr.FieldAsIntNullable('TPDF_TIPO'),
        Qr.FieldAsString('TPDF_SIGLA'),
        Qr.FieldAsString('TPDF_DESCRICAO'),
        StrISOToDate(Qr.FieldAsString('TPDF_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('TPDF_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterFundamentacoesLegais: FundamentacoesLegaisEtd;
var
  Lista: FundamentacoesLegaisEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 200);

  LerPaginas('FUNDAMENTACAO_LEGAL',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := FundamentacaoLegalEtd.Create(
        Qr.FieldAsInteger('FDLG_ID'),
        Qr.FieldAsString('FDLG_TEXTO'),
        Qr.FieldAsString('FDLG_TEXTO_CURTO'),
        Qr.FieldAsString('FDLG_REFERENCIA_NORMATIVA'),
        StrISOToDate(Qr.FieldAsString('FDLG_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('FDLG_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterTomadoresEspecificos: TomadoresEspecificosEtd;
var
  Lista: TomadoresEspecificosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('TOMADOR_ESPECIFICO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := TomadorEspecificoEtd.Create(
        Qr.FieldAsInteger('TMES_ID'),
        Qr.FieldAsString('TMES_NOME'),
        StrISOToDate(Qr.FieldAsString('TMES_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('TMES_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterAliquotasReferencia: AliquotasReferenciaEtd;
var
  Lista: AliquotasReferenciaEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 3);

  LerPaginas('ALIQUOTA_REFERENCIA',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := AliquotaReferenciaEtd.Create(
        Qr.FieldAsInteger('ALRE_ID'),
        Qr.FieldAsFloat('ALRE_VALOR'),
        StrISOToDate(Qr.FieldAsString('ALRE_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('ALRE_FIM_VIGENCIA')),
        TipoTributoEnum(Qr.FieldAsInteger('ALRE_TBTO_ID'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterAliquotasPadrao: AliquotasPadraoEtd;
var
  Lista: AliquotasPadraoEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 20);

  LerPaginas('ALIQUOTA_PADRAO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := AliquotaPadraoEtd.CreateEtd(
        Qr.FieldAsInteger('ALPA_ID'),
        AliquotaPadraoFormaAplicacaoUtils.FromString(Qr.FieldAsString('ALPA_FORMA_APLICACAO')),
        Qr.FieldAsFloat('ALPA_VALOR'),
        StrISOToDate(Qr.FieldAsString('ALPA_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('ALPA_FIM_VIGENCIA')),
        Qr.FieldAsInteger('ALPA_ALRE_ID'),
        Qr.FieldAsIntNullable('ALPA_MUNI_CD'),
        Qr.FieldAsIntNullable('ALPA_UF_CD')
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterSituacoesTributarias: SituacoesTributariasEtd;
var
  Lista: SituacoesTributariasEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('SITUACAO_TRIBUTARIA',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := SituacaoTributariaEtd.Create(
        Qr.FieldAsInteger('SITR_ID'),
        Qr.FieldAsString('SITR_CD'),
        Qr.FieldAsString('SITR_DESCRICAO'),
        Qr.FieldAreEquals('SITR_IND_GAJUSTECOMPET', 1),
        Qr.FieldAreEquals('SITR_IND_GRED', 1),
        Qr.FieldAreEquals('SITR_IND_GIBSCBS', 1),
        Qr.FieldAreEquals('SITR_IND_GCREDPRESIBSZFM', 1),
        Qr.FieldAreEquals('SITR_IND_GTRANSFCRED', 1),
        Qr.FieldAreEquals('SITR_IND_GDIF', 1),
        Qr.FieldAreEquals('SITR_IND_GIBSCBSMONO', 1),
        StrISOToDate(Qr.FieldAsString('SITR_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('SITR_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterClassificacoesTributarias: ClassificacoesTributariasEtd;
var
  Lista: ClassificacoesTributariasEtd;
  Sucesso: Boolean;
  sTipoAliquota: string;
  sNomeclatura: string;
  S: string;
  sCredOpAntecedente: StringNullable;
begin
  Lista := ClassificacoesTributariasEtd.Create();
  Sucesso := False;

  try
    LerPaginas('CLASSIFICACAO_TRIBUTARIA',
      procedure(Qr: JsonQueryResult)
      begin
        sTipoAliquota := Qr.FieldAsString('CLTR_TIPO_ALIQUOTA');
        if sTipoAliquota = 'Padrão' then
          sTipoAliquota := 'Padrao'
        else if sTipoAliquota = 'Uniforme nacional (referência)' then
          sTipoAliquota := 'Uniforme nacional (referencia)'
        else if sTipoAliquota = 'Sem alíquota' then
          sTipoAliquota := 'Sem aliquota'
        else if sTipoAliquota = 'Alíquotas Combinadas (Ad Valorem e Ad Rem)' then
          sTipoAliquota := 'Aliquotas Combinadas (Ad Valorem e Ad Rem)';

        S := Qr.FieldAsString('CLTR_CREDITO_OPERACAO_ANTECEDENTE');
        if S = 'Manutenção' then
          sCredOpAntecedente := StringNullable.Create('Manutencao')
        else if S = 'Anulação' then
          sCredOpAntecedente := StringNullable.Create('Anulacao')
        else
          sCredOpAntecedente := StringNullable.NullInstance();

        sNomeclatura := Qr.FieldAsString('CLTR_NOMENCLATURA');
        if sNomeclatura = 'Não possui' then
          sNomeclatura := 'Nao possui';

        Lista.Add(ClassificacaoTributariaEtd.Create(
          Qr.FieldAsInteger('CLTR_ID'),
          Qr.FieldAsString('CLTR_CD'),
          Qr.FieldAsString('CLTR_DESCRICAO'),
          Qr.FieldAsString('CLTR_MEMORIA_CALCULO'),
          StrAsBooleanNullable(Qr.FieldAsString('CLTR_IN_APROPRIACAO_CREDITOS_ADQUIRENTES_CBS')),
          StrAsBooleanNullable(Qr.FieldAsString('CLTR_IN_APROPRIACAO_CREDITOS_ADQUIRENTES_IBS')),
          StrAsBooleanNullable(Qr.FieldAsString('CLTR_IN_CREDITO_PRESUMIDO_FORNECEDOR')),
          StrAsBooleanNullable(Qr.FieldAsString('CLTR_IN_CREDITO_PRESUMIDO_ADQUIRENTE')),
          Qr.FieldAsInteger('CLTR_SITR_ID'),
          Qr.FieldAsIntNullable('CLTR_TMES_ID'),
          sTipoAliquota,
          sCredOpAntecedente,
          sNomeclatura,
          Qr.FieldAreEquals('CLTR_IND_GCREDPRESOPER', '1'),
          Qr.FieldAreEquals('CLTR_IND_GMONOPADRAO', '1'),
          Qr.FieldAreEquals('CLTR_IND_GMONORETEN', '1'),
          Qr.FieldAreEquals('CLTR_IND_GMONORET', '1'),
          Qr.FieldAreEquals('CLTR_IND_GMONODIF', '1'),
          Qr.FieldAreEquals('CLTR_IND_GESTORNOCRED', '1'),
          Qr.FieldAsStringNullable('CLTR_ANEXO'),
          StrISOToDate(Qr.FieldAsString('CLTR_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('CLTR_FIM_VIGENCIA')),
          StrISOToDate(Qr.FieldAsString('CLTR_DATA_ATUALIZACAO'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterTiposDFePorClassificacao: TipoDfeClassificacaoEtdList;
var
  Lista: TipoDfeClassificacaoEtdList;
  Sucesso: Boolean;
begin
  Lista := TipoDfeClassificacaoEtdList.Create();
  Sucesso := False;

  try
    LerPaginas('TIPO_DFE_CLASSIFICACAO',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(TipoDfeClassificacaoEtd.CreateEtd(
          Qr.FieldAsInteger('TDCL_ID'),
          Qr.FieldAsInteger('TDCL_CLTR_ID'),
          Qr.FieldAsInteger('TDCL_TPDF_ID'),
          StrISOToDate(Qr.FieldAsString('TDCL_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('TDCL_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterPercentuaisReducao: PercentuaisReducaoEtd;
var
  Lista: PercentuaisReducaoEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('PERCENTUAL_REDUCAO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := PercentualReducaoEtd.CreateEtd(
        Qr.FieldAsInteger('PERE_ID'),
        Qr.FieldAsInteger('PERE_CLTR_ID'),
        TipoTributoEnum(Qr.FieldAsInteger('PERE_TBTO_ID')),
        Qr.FieldAsFloat('PERE_VALOR'),
        StrISOToDate(Qr.FieldAsString('PERE_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('PERE_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterNCMsAplicaveis: NcmsAplicaveisEtd;
var
  Lista: NcmsAplicaveisEtd;
  Sucesso: Boolean;
begin
  Lista := NcmsAplicaveisEtd.Create();
  Sucesso := False;

  try
    LerPaginas('NCM_APLICAVEL',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(NcmAplicavelEtd.Create(
          Qr.FieldAsInteger('NCMA_ID'),
          Qr.FieldAsString('NCMA_NCM_CD'),
          Qr.FieldAsInteger('NCMA_CLTR_ID'),
          Qr.FieldAsIntNullable('NCMA_ANXO_ID'),
          StrISOToDate(Qr.FieldAsString('NCMA_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('NCMA_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterNBSsAplicaveis: NbssAplicaveisEtd;
var
  Lista: NbssAplicaveisEtd;
  Sucesso: Boolean;
begin
  Lista := NbssAplicaveisEtd.Create();
  Sucesso := False;

  try
    LerPaginas('NBS_APLICAVEL',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(NbsAplicavelEtd.Create(
          Qr.FieldAsInteger('NBSA_ID'),
          Qr.FieldAsString('NBSA_NBS_CD'),
          Qr.FieldAsInteger('NBSA_CLTR_ID'),
          Qr.FieldAsIntNullable('NBSA_ANXO_ID'),
          StrISOToDate(Qr.FieldAsString('NBSA_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('NBSA_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterFundamentacoesClassificacoes: FundamentacoesClassificacoesEtd;
var
  Lista: FundamentacoesClassificacoesEtd;
  Sucesso: Boolean;
begin
  Lista := FundamentacoesClassificacoesEtd.Create();
  Sucesso := False;

  try
    LerPaginas('FUNDAMENTACAO_CLASSIFICACAO',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(FundamentacaoClassificacaoEtd.Create(
          Qr.FieldAsInteger('FDCL_ID'),
          Qr.FieldAsInteger('FDCL_CLTR_ID'),
          Qr.FieldAsInteger('FDCL_FDLG_ID'),
          StrISOToDate(Qr.FieldAsString('FDCL_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('FDCL_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterExcecoesNCMAplicavel: ExcecoesNcmAplicavelEtd;
var
  Lista: ExcecoesNcmAplicavelEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('EXCECAO_NCM_APLICAVEL',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := ExcecaoNcmAplicavelEtd.CreateEtd(
        Qr.FieldAsInteger('ENCM_ID'),
        Qr.FieldAsString('ENCM_NCM_CD'),
        Qr.FieldAsInteger('ENCM_NCMA_ID'),
        StrISOToDate(Qr.FieldAsString('ENCM_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('ENCM_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterExcecoesNBSAplicavel: ExcecoesNbsAplicavelEtd;
var
  Lista: ExcecoesNbsAplicavelEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('EXCECAO_NBS_APLICAVEL',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := ExcecaoNbsAplicavelEtd.CreateEtd(
        Qr.FieldAsInteger('ENBS_ID'),
        Qr.FieldAsString('ENBS_NBS_CD'),
        Qr.FieldAsInteger('ENBS_NBSA_ID'),
        StrISOToDate(Qr.FieldAsString('ENBS_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('ENBS_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterTributoSituacoesTributarias: TributoSituacoesTributariasEtd;
var
  Lista: TributoSituacoesTributariasEtd;
  Sucesso: Boolean;
begin
  Lista := TributoSituacoesTributariasEtd.Create();
  Sucesso := False;

  try
    LerPaginas('TRIBUTO_SITUACAO_TRIBUTARIA',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(TributoSituacaoTributariaEtd.Create(
          Qr.FieldAsInteger('TRST_ID'),
          Qr.FieldAsInteger('TRST_SITR_ID'),
          TipoTributoEnum(Qr.FieldAsInteger('TRST_TBTO_ID')),
          StrISOToDate(Qr.FieldAsString('TRST_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('TRST_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterTratamentosTributarios: TratamentosTributariosEtd;
var
  Lista: TratamentosTributariosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('TRATAMENTO_TRIBUTARIO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := TratamentoTributarioEtd.Create(
        Qr.FieldAsInteger('TRTR_ID'),
        Qr.FieldAsString('TRTR_DESCRICAO'),
        Qr.FieldAsStringNullable('TRTR_EXPRESSAO_ALIQUOTA'),
        Qr.FieldAsStringNullable('TRTR_EXPRESSAO_ALIQUOTA_EFETIVA'),
        Qr.FieldAsString('TRTR_EXPRESSAO_BASE_CALCULO'),
        Qr.FieldAsString('TRTR_EXPRESSAO_TRIBUTO_CALCULADO'),
        Qr.FieldAsString('TRTR_EXPRESSAO_TRIBUTO_DEVIDO'),
        Qr.FieldAsStringNullable('TRTR_EXPRESSAO_PERCENTUAL_DIFERIMENTO'),
        Qr.FieldAsStringNullable('TRTR_EXPRESSAO_VALOR_DIFERIMENTO'),
        Qr.FieldAreEquals('TRTR_IN_INCOMPATIVEL_COM_SUSPENSAO', 1),
        Qr.FieldAreEquals('TRTR_IN_EXIGE_GRUPO_DESONERACAO', 1),
        Qr.FieldAreEquals('TRTR_IN_POSSUI_PERCENTUAL_REDUCAO', 1),
        Qr.FieldAreEquals('TRTR_IN_POSSUI_AJUSTE', 1),
        Qr.FieldAreEquals('TRTR_IN_POSSUI_REDUTOR', 1),
        Qr.FieldAreEquals('TRTR_IN_POSSUI_MONOFASIA', 1),
        StrISOToDate(Qr.FieldAsString('TRTR_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('TRTR_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterTratamentosClassificacoes: TratamentosClassificacoesEtd;
var
  Lista: TratamentosClassificacoesEtd;
  Sucesso: Boolean;
begin
  Lista := TratamentosClassificacoesEtd.Create();
  Sucesso := False;

  try
    LerPaginas('TRATAMENTO_CLASSIFICACAO',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(TratamentoClassificacaoEtd.Create(
          Qr.FieldAsInteger('TRCL_ID'),
          Qr.FieldAsInteger('TRCL_CLTR_ID'),
          Qr.FieldAsInteger('TRCL_TRTR_ID'),
          StrISOToDate(Qr.FieldAsString('TRCL_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('TRCL_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterAliquotasAdValorem: AliquotasAdValoremEtd;
var
  Lista: AliquotasAdValoremEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('ALIQUOTA_AD_VALOREM',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := AliquotaAdValoremEtd.CreateEtd(
        Qr.FieldAsInteger('AADV_ID'),
        Qr.FieldAsFloat('AADV_VALOR'),
        TipoTributoEnum(Qr.FieldAsInteger('AADV_TBTO_ID')),
        Qr.FieldAsIntNullable('AADV_CLTR_ID'),
        StrISOToDate(Qr.FieldAsString('AADV_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('AADV_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterAliquotasAdValoremProdutos: AliquotasAdValoremProdutosEtd;
var
  Lista: AliquotasAdValoremProdutosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('ALIQUOTA_AD_VALOREM_PRODUTO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := AliquotaAdValoremProdutoEtd.CreateEtd(
        Qr.FieldAsInteger('AAVP_ID'),
        Qr.FieldAsString('AAVP_NCM_CD'),
        Qr.FieldAsInteger('AAVP_AADV_ID'),
        StrISOToDate(Qr.FieldAsString('AAVP_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('AAVP_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterExcecoesAdValoremProdutos: ExcecoesAdValoremProdutosEtd;
var
  Lista: ExcecoesAdValoremProdutosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('EXCECAO_AD_VALOREM_PRODUTO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := ExcecaoAdValoremProdutoEtd.CreateEtd(
        Qr.FieldAsInteger('EAVP_ID'),
        Qr.FieldAsString('EAVP_NCM_CD'),
        Qr.FieldAsInteger('EAVP_AAVP_ID'),
        StrISOToDate(Qr.FieldAsString('EAVP_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('EAVP_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterUnidadesMedidas: UnidadesMedidasEtd;
var
  Lista: UnidadesMedidasEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 10);

  LerPaginas('UNIDADE_MEDIDA',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := UnidadeMedidaEtd.CreateEtd(
        Qr.FieldAsInteger('UNMD_ID'),
        Qr.FieldAsString('UNMD_SIGLA'),
        Qr.FieldAsString('UNMD_NOME'),
        Qr.FieldAsString('UNMD_DESCRICAO'),
        StrISOToDate(Qr.FieldAsString('UNMD_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('UNMD_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterAliquotasAdRem: AliquotaAdRemEtdList;
var
  Lista: AliquotaAdRemEtdList;
  Sucesso: Boolean;
begin
  Lista := AliquotaAdRemEtdList.Create();
  Sucesso := False;

  try
    LerPaginas('ALIQUOTA_AD_REM',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(AliquotaAdRemEtd.Create(
          Qr.FieldAsInteger('AARE_ID'),
          Qr.FieldAsDouble('AARE_VALOR'),
          Qr.FieldAsInteger('AARE_UNMD_ID'),
          TipoTributoEnum(Qr.FieldAsInteger('AARE_TBTO_ID')),
          StrISOToDate(Qr.FieldAsString('AARE_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('AARE_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterAliquotasAdRemProdutos: AliquotasAdRemProdutosEtd;
var
  Lista: AliquotasAdRemProdutosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('ALIQUOTA_AD_REM_PRODUTO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := AliquotaAdRemProdutoEtd.CreateEtd(
        Qr.FieldAsInteger('AARP_ID'),
        Qr.FieldAsString('AARP_NCM_CD'),
        Qr.FieldAsInteger('AARP_AARE_ID'),
        StrISOToDate(Qr.FieldAsString('AARP_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('AARP_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterExcecoesAdRemProdutos: ExcecoesAdRemProdutosEtd;
var
  Lista: ExcecoesAdRemProdutosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('EXCECAO_AD_REM_PRODUTO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := ExcecaoAdRemProdutoEtd.CreateEtd(
        Qr.FieldAsInteger('EARP_ID'),
        Qr.FieldAsString('EARP_NCM_CD'),
        Qr.FieldAsInteger('EARP_AARP_ID'),
        StrISOToDate(Qr.FieldAsString('EARP_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('EARP_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterAliquotasAdValoremServicos: AliquotasAdValoremServicosEtd;
var
  Lista: AliquotasAdValoremServicosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('ALIQUOTA_AD_VALOREM_SERVICO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := AliquotaAdValoremServicoEtd.CreateEtd(
        Qr.FieldAsInteger('AAVS_ID'),
        Qr.FieldAsString('AAVS_NBS_CD'),
        Qr.FieldAsInteger('AAVS_AADV_ID'),
        StrISOToDate(Qr.FieldAsString('AAVS_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('AAVS_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterExcecoesAdValoremServicos: ExcecoesAdValoremServicosEtd;
var
  Lista: ExcecoesAdValoremServicosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('EXCECAO_AD_VALOREM_SERVICO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := ExcecaoAdValoremServicoEtd.CreateEtd(
        Qr.FieldAsInteger('EAVS_ID'),
        Qr.FieldAsString('EAVS_NBS_CD'),
        Qr.FieldAsInteger('EAVS_AAVS_ID'),
        StrISOToDate(Qr.FieldAsString('EAVS_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('EAVS_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterAliquotasAdRemServicos: AliquotasAdRemServicosEtd;
var
  Lista: AliquotasAdRemServicosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('ALIQUOTA_AD_REM_SERVICO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := AliquotaAdRemServicoEtd.CreateEtd(
        Qr.FieldAsInteger('AARS_ID'),
        Qr.FieldAsString('AARS_NBS_CD'),
        Qr.FieldAsInteger('AARS_AARE_ID'),
        StrISOToDate(Qr.FieldAsString('AARS_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('AARS_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterExcecoesAdRemServicos: ExcecoesAdRemServicosEtd;
var
  Lista: ExcecoesAdRemServicosEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('EXCECAO_AD_REM_SERVICO',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := ExcecaoAdRemServicoEtd.CreateEtd(
        Qr.FieldAsInteger('EARS_ID'),
        Qr.FieldAsString('EARS_NBS_CD'),
        Qr.FieldAsInteger('EARS_AARS_ID'),
        StrISOToDate(Qr.FieldAsString('EARS_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('EARS_FIM_VIGENCIA'))
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterRedutoresCompraGovernamental: RedutoresCompraGovernamentalEtd;
var
  Lista: RedutoresCompraGovernamentalEtd;
  Sucesso: Boolean;
begin
  Lista := RedutoresCompraGovernamentalEtd.Create();
  Sucesso := False;

  try
    LerPaginas('REDUTOR_COMPRA_GOVERNAMENTAL',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(RedutorCompraGovernamentalEtd.Create(
          Qr.FieldAsInteger('RCGO_ID'),
          Qr.FieldAsDouble('RCGO_VALOR'),
          StrISOToDate(Qr.FieldAsString('RCGO_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('RCGO_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterTransferenciasCBSEnteGov: TransferenciaCBSEnteGovEtdList;
var
  Lista: TransferenciaCBSEnteGovEtdList;
  Sucesso: Boolean;
begin
  Lista := TransferenciaCBSEnteGovEtdList.Create();
  Sucesso := False;

  try
    LerPaginas('TRANSFERENCIA_CBS_ENTE_GOV',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(TransferenciaCBSEnteGovEtd.Create(
          Qr.FieldAsInteger('TCEG_ID'),
          Qr.FieldAsDouble('TCEG_VALOR'),
          StrISOToDate(Qr.FieldAsString('TCEG_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('TCEG_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function LocalIncidenciaFromQr(const Qr: JsonQueryResult): LocalIncidencia;
begin
  // Ausencia do codigo tipado corresponde a liUnassigned (SQL NULL): nunca se
  // chama LocalIncidenciaFromCodigo(0). Valor presente fora de 1..7 lanca,
  // abortando a leitura (fail-closed, como os demais erros do Reader).
  if Qr.FieldIsNull('IOIC_CD_LOCAL_INCIDENCIA') then
    Result := LocalIncidenciaEnumUnit.liUnassigned
  else
    Result := LocalIncidenciaEnumUnit.LocalIncidenciaFromCodigo(
      Qr.FieldAsInteger('IOIC_CD_LOCAL_INCIDENCIA'));
end;

function CalculadoraApiReader.ObterListaServicosLC116: ListaServicosLC116EtdList;
var
  Lista: ListaServicosLC116EtdList;
  Sucesso: Boolean;
begin
  Lista := ListaServicosLC116EtdList.Create();
  Sucesso := False;

  try
    LerPaginas('LISTA_SERVICOS_LC_116',
      procedure(Qr: JsonQueryResult)
      begin
        Lista.Add(ListaServicosLC116Etd.Create(
          Qr.FieldAsString('LSLC_CD'),
          Qr.FieldAsString('LSLC_DESCRICAO'),
          StrISOToDate(Qr.FieldAsString('LSLC_INICIO_VIGENCIA')).Value,
          StrISOToDate(Qr.FieldAsString('LSLC_FIM_VIGENCIA'))
        ));
      end
    );

    Sucesso := True;
  finally
    if not Sucesso then
      FreeAndNil(Lista);
  end;

  Result := Lista;
end;

function CalculadoraApiReader.ObterIndicadoresOperacaoIbsCbs: IndicadoresOperacaoEtd;
var
  Lista: IndicadoresOperacaoEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('INDICADOR_OPERACAO_IBS_CBS',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := IndicadorOperacaoEtd.CreateEtd(
        Qr.FieldAsInteger('IOIC_ID'),
        Qr.FieldAsString('IOIC_CD'),
        Qr.FieldAsString('IOIC_LOCAL_INCIDENCIA'),
        StrISOToDate(Qr.FieldAsString('IOIC_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('IOIC_FIM_VIGENCIA')),
        Qr.FieldAsStringNullable('IOIC_TIPO_OPERACAO'),
        Qr.FieldAsIntNullable('IOIC_CD_LOCAL_FORNECIMENTO_DFE'),
        LocalIncidenciaFromQr(Qr)
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

function CalculadoraApiReader.ObterClassificacoesNbsIndOpLc: IndicadoresOpNbsClassificacaoEtd;
var
  Lista: IndicadoresOpNbsClassificacaoEtd;
  Count: Integer;
begin
  Count := 0;
  SetLength(Lista, 50);

  LerPaginas('CLASSIF_NBS_INDOP_LC',
    procedure(Qr: JsonQueryResult)
    begin
      if Count >= Length(Lista) then
        SetLength(Lista, Length(Lista) * 2);

      Lista[Count] := IndicadorOpNbsClassificacaoEtd.CreateEtd(
        Qr.FieldAsInteger('CNIL_ID'),
        Qr.FieldAsString('CNIL_LSLC_CD'),
        Qr.FieldAsString('CNIL_NBS_CD'),
        Qr.FieldAsInteger('CNIL_IOIC_ID'),
        Qr.FieldAsInteger('CNIL_CLTR_ID'),
        StrISOToDate(Qr.FieldAsString('CNIL_INICIO_VIGENCIA')).Value,
        StrISOToDate(Qr.FieldAsString('CNIL_FIM_VIGENCIA')),
        Qr.FieldAreEquals('CNIL_IN_PS_ONEROSA', 1),
        Qr.FieldAreEquals('CNIL_IN_ADQ_EXTERIOR', 1)
      );

      Inc(Count);
    end
  );

  SetLength(Lista, Count);
  Result := Lista;
end;

end.
