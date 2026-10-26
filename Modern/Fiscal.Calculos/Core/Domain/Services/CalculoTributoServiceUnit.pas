unit CalculoTributoServiceUnit;

interface

uses
  ICalculoTributoServiceUnit,
  OperacaoTributacaoModelUnit,
  TributosModelUnit,
  CalculoCbsIbsServiceUnit,
  CalculoImpostoSeletivoServiceUnit,
  MemoriaCalculoServiceUnit,
  ItemCalculoInputUnit,
  ResultadoCbsIbsUnit, TipoComunsUnit,
  IBSCBSModelUnit, MonofasiaModelUnit, ResultadoGrupoMonofasiaUnit, ResultadoGrupoEtapaMonofasiaUnit,
  GrupoIBSCBSModelUnit, IbsUfModelUnit, DevolucaoTributosModelUnit, IBSMunModelUnit, CBSModelUnit,
  TributacaoRegularModelUnit, TributacaoCompraGovernamentalModelUnit,
  TransferenciaCreditoModelUnit, CreditoPresumidoIBSZFMModelUnit, DoubleNullableUnit, MonofasiaPadraoModelUnit,
  AjusteCompetenciaModelUnit, EstornoCreditoModelUnit, CreditoPresumidoOperacaoModelUnit,
  TipoEnteGovernamentalEnumUnit, CurrencyNullableUnit,
  TransferenciaCBSServiceUnit;

type
  // Essa classe faz
  CalculoTributoService = class(TInterfacedObject, ICalculoTributoService)
  private
    FCalculoIbsHabilitado: Boolean;
    FCalculoCbsIbs: ICalculoCbsIbsService;
    FCalculoImpostoSeletivo: ICalculoImpostoSeletivoService;
    FMemoriaCalculo: IMemoriaCalculoService;
    FTransferenciaService: ITransferenciaCBSService;

    function GetMonofasia(
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs
    ): MonofasiaModel;

    function GetDevolucaoTributos(const D: ResultadoCbsIbs): DevolucaoTributosModel; // TODO: Implementar devolução de tributos

    function GetCbs(const Cbs: ResultadoCbsIbs): CBSModel;

    function GetIBSUF(const IbsEstadual: ResultadoCbsIbs): IBSUFModel;

    function GetIBSMun(const IbsMunicipal: ResultadoCbsIbs): IBSMunModel;

    function GetTributacaoRegularCBS(
      const Cbs: ResultadoCbsIbs;
      const Builder: TributacaoRegularModel
    ): TributacaoRegularModel;

    function GetTributacaoRegularIBSUF(
      const IbsEstadual: ResultadoCbsIbs;
      const Builder: TributacaoRegularModel
    ): TributacaoRegularModel;

    function GetTributacaoRegularIBSMun(
      const IbsMunicipal: ResultadoCbsIbs;
      const Builder: TributacaoRegularModel
    ): TributacaoRegularModel;

    function GetTributacaoRegular(
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs
    ): TributacaoRegularModel;

    function GetCompraGovernamental(
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs
    ): TributacaoCompraGovernamentalModel;

    procedure TrataImpactoCompraGovCBS(
      var Cbs: ResultadoCbsIbs;
      const CompraGov: TributacaoCompraGovernamentalModel
    );

    procedure TrataImpactoCompraGovIBSUF(
      var IbsUF: ResultadoCbsIbs;
      const CompraGov: TributacaoCompraGovernamentalModel
    );

    procedure TrataImpactoCompraGovIBSMun(
      var IbsMun: ResultadoCbsIbs;
      const CompraGov: TributacaoCompraGovernamentalModel
    );

    function GetGIBSCBS(
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs;
      TpEnteGov: TipoEnteGovernamental;
      DataFatoGerador: TDateTime
    ): GrupoIBSCBSModel;

    function GetTransferenciaCredito(
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs
    ): TransferenciaCreditoModel; // TODO - Implementar transferência de crédito

    function GetAjusteCompetencia(
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs
    ): AjusteCompetenciaModel; // TODO - Implementar ajuste de competência

    function GetEstornoCredito(
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs
    ): EstornoCreditoModel; // TODO - Implementar estorno de crédito

    function GetCreditoPresumidoOperacao(
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs
    ): CreditoPresumidoOperacaoModel; // TODO - Implementar credito presumido

    function GetCreditoPresumidoIBSZFM(
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs
    ): CreditoPresumidoIBSZFMModel; // TODO - Implementar crédito presumido para IBS Zona Franca de Manaus

    function GetIBSCBS(
      const Item: ItemCalculoInput;
      const Cbs: ResultadoCbsIbs;
      const IbsEstadual: ResultadoCbsIbs;
      const IbsMunicipal: ResultadoCbsIbs;
      TpEnteGov: TipoEnteGovernamental;
      DataFatoGerador: TDate
    ): IBSCBSModel;

    function GetVBC(const c: ResultadoCbsIbs; const valor: DoubleNullable): DoubleNullable;

    function GetVIbs( ibsUF: IBSUFModel; ibsMun: IBSMunModel): Currency;

  public
    constructor Create(
      CalculoCbsIbs: ICalculoCbsIbsService;
      CalculoImpostoSeletivo: ICalculoImpostoSeletivoService;
      MemoriaCalculo: IMemoriaCalculoService;
      TransferenciaService: ITransferenciaCBSService
    );

    function Calcular(const Operacao: OperacaoTributacaoModel): TributosModel;
  end;

implementation

uses
  SysUtils,
  Math,
  TratamentoClassificacaoModelUnit,
  ImpostoSeletivoModelUnit,
  AliquotaImpostoSeletivoModelUnit,
  TipoTributoEnumUnit,
  ResultadoGrupoDiferimentoMonofasiaUnit,
  ResultadoTributacaoRegularUnit, MonofasiaRetencaoModelUnit, MonofasiaRetidoAnteriormenteModelUnit,
  MonofasiaDiferimentoModelUnit,
  ReducaoAliquotaModelUnit;

{ CalculoTributoService }

constructor CalculoTributoService.Create(
  CalculoCbsIbs: ICalculoCbsIbsService;
  CalculoImpostoSeletivo: ICalculoImpostoSeletivoService;
  MemoriaCalculo: IMemoriaCalculoService;
  TransferenciaService: ITransferenciaCBSService
);
begin
  FCalculoIbsHabilitado := True;
  FCalculoCbsIbs := CalculoCbsIbs;
  FCalculoImpostoSeletivo := CalculoImpostoSeletivo;
  FMemoriaCalculo := MemoriaCalculo;
  FTransferenciaService := TransferenciaService;
end;

function CalculoTributoService.GetCbs(const Cbs: ResultadoCbsIbs): CBSModel;
begin
  if Cbs.IsNull() then
  begin
    Result := nil;
    Exit;
  end;

  Result := CBSModel.Create(
    Cbs.Aliquota,
    Cbs.GrupoDiferimento,
    GetDevolucaoTributos(Cbs),
    Cbs.GrupoReducao,
    Cbs.TributoDevido,
    Cbs.MemoriaCalculo
  );
end;

function CalculoTributoService.GetCompraGovernamental(const Cbs, IbsEstadual,
  IbsMunicipal: ResultadoCbsIbs): TributacaoCompraGovernamentalModel;
var
  possuiCompraGovCBS, possuiCompraGovIBSUF, possuiCompraGovIBSMun: Boolean;
  possuiAlgumDiferente: Boolean;
  compraGovCBS, compraGovIBSUF, compraGovIBSMun: TributacaoCompraGovernamentalModel;
begin
  possuiCompraGovCBS := Cbs.PossuiCompraGov();
  possuiCompraGovIBSUF := IbsEstadual.PossuiCompraGov();
  possuiCompraGovIBSMun := IbsMunicipal.PossuiCompraGov();

  if possuiCompraGovCBS and possuiCompraGovIBSUF and possuiCompraGovIBSMun then
  begin
    // merge das compras governamentais de cada tributo em um so
    compraGovCBS := Cbs.CompraGovernamental;
    compraGovIBSUF := IbsEstadual.CompraGovernamental;
    compraGovIBSMun := IbsMunicipal.CompraGovernamental;

    Result := TributacaoCompraGovernamentalModel.Create(
      compraGovIBSUF.PAliqIBSUF, compraGovIBSUF.VTribIBSUF,
      compraGovIBSMun.PAliqIBSMun, compraGovIBSMun.VTribIBSMun,
      compraGovCBS.PAliqCBS, compraGovCBS.VTribCBS
    );
  end
  else
  begin
    possuiAlgumDiferente := possuiCompraGovCBS or possuiCompraGovIBSUF or possuiCompraGovIBSMun;
    if possuiAlgumDiferente then
      raise Exception.Create('Erro ao consolidar valores de compras governamentais. Algum dos tributos não calculou compra governamental.');

    Result := TributacaoCompraGovernamentalModel.NullInstance();
  end;
end;

procedure CalculoTributoService.TrataImpactoCompraGovCBS(var Cbs: ResultadoCbsIbs;
  const CompraGov: TributacaoCompraGovernamentalModel);
var
  grupoReducaoCbs: ReducaoAliquotaModel;
  tributacaoRegular: ResultadoTributacaoRegular;
begin
  if (not Cbs.IsNull()) and (not CompraGov.IsNull()) then
  begin
    grupoReducaoCbs := Cbs.GrupoReducao;
    if grupoReducaoCbs.IsNull() then
    begin
      grupoReducaoCbs := ReducaoAliquotaModel.Create(0, 0);
      Cbs.SetGrupoReducao(grupoReducaoCbs);
    end;

    tributacaoRegular := Cbs.TributacaoRegular;
    if not tributacaoRegular.IsNull() then
    begin
      // possui suspensao
      Cbs.SetGrupoReducao(ReducaoAliquotaModel.Create(0, 0));
      Cbs.SetTributoDevido(0);
      Cbs.SetTributacaoRegular(ResultadoTributacaoRegular.Create(
        tributacaoRegular.Cst,
        tributacaoRegular.CClassTrib,
        tributacaoRegular.BaseCalculo,
        CompraGov.PAliqCBS,
        CompraGov.VTribCBS
      ));
    end
    else
    begin
      Cbs.SetGrupoReducao(ReducaoAliquotaModel.Create(grupoReducaoCbs.PRedAliq, CompraGov.PAliqCBS));
      Cbs.SetTributoDevido(CompraGov.VTribCBS);
    end;
  end;
end;

procedure CalculoTributoService.TrataImpactoCompraGovIBSUF(var IbsUF: ResultadoCbsIbs;
  const CompraGov: TributacaoCompraGovernamentalModel);
var
  grupoReducaoIbsUF: ReducaoAliquotaModel;
  tributacaoRegular: ResultadoTributacaoRegular;
begin
  if (not IbsUF.IsNull()) and (not CompraGov.IsNull()) then
  begin
    grupoReducaoIbsUF := IbsUF.GrupoReducao;
    if grupoReducaoIbsUF.IsNull() then
    begin
      grupoReducaoIbsUF := ReducaoAliquotaModel.Create(0, 0);
      IbsUF.SetGrupoReducao(grupoReducaoIbsUF);
    end;

    tributacaoRegular := IbsUF.TributacaoRegular;
    if not tributacaoRegular.IsNull() then
    begin
      IbsUF.SetGrupoReducao(ReducaoAliquotaModel.Create(0, 0));
      IbsUF.SetTributoDevido(0);
      IbsUF.SetTributacaoRegular(ResultadoTributacaoRegular.Create(
        tributacaoRegular.Cst,
        tributacaoRegular.CClassTrib,
        tributacaoRegular.BaseCalculo,
        CompraGov.PAliqIBSUF,
        CompraGov.VTribIBSUF
      ));
    end
    else
    begin
      IbsUF.SetGrupoReducao(ReducaoAliquotaModel.Create(grupoReducaoIbsUF.PRedAliq, CompraGov.PAliqIBSUF));
      IbsUF.SetTributoDevido(CompraGov.VTribIBSUF);
    end;
  end;
end;

procedure CalculoTributoService.TrataImpactoCompraGovIBSMun(var IbsMun: ResultadoCbsIbs;
  const CompraGov: TributacaoCompraGovernamentalModel);
var
  grupoReducaoIbsMun: ReducaoAliquotaModel;
  tributacaoRegular: ResultadoTributacaoRegular;
begin
  if (not IbsMun.IsNull()) and (not CompraGov.IsNull()) then
  begin
    grupoReducaoIbsMun := IbsMun.GrupoReducao;
    if grupoReducaoIbsMun.IsNull() then
    begin
      grupoReducaoIbsMun := ReducaoAliquotaModel.Create(0, 0);
      IbsMun.SetGrupoReducao(grupoReducaoIbsMun);
    end;

    tributacaoRegular := IbsMun.TributacaoRegular;
    if not tributacaoRegular.IsNull() then
    begin
      IbsMun.SetGrupoReducao(ReducaoAliquotaModel.Create(0, 0));
      IbsMun.SetTributoDevido(0);
      IbsMun.SetTributacaoRegular(ResultadoTributacaoRegular.Create(
        tributacaoRegular.Cst,
        tributacaoRegular.CClassTrib,
        tributacaoRegular.BaseCalculo,
        CompraGov.PAliqIBSMun,
        CompraGov.VTribIBSMun
      ));
    end
    else
    begin
      IbsMun.SetGrupoReducao(ReducaoAliquotaModel.Create(grupoReducaoIbsMun.PRedAliq, CompraGov.PAliqIBSMun));
      IbsMun.SetTributoDevido(CompraGov.VTribIBSMun);
    end;
  end;
end;

function CalculoTributoService.GetCreditoPresumidoIBSZFM(const Cbs, IbsEstadual,
  IbsMunicipal: ResultadoCbsIbs): CreditoPresumidoIBSZFMModel;
begin
  // TODO - Implementar crédito presumido para IBS Zona Franca de Manaus
  Result := CreditoPresumidoIBSZFMModel.NullInstance();
end;

function CalculoTributoService.GetDevolucaoTributos(const D: ResultadoCbsIbs): DevolucaoTributosModel;
begin
  // TODO: Implementar devolução de tributos
  Result := DevolucaoTributosModel.NullInstance();
end;

function CalculoTributoService.GetVBC(const c: ResultadoCbsIbs; const valor: DoubleNullable): DoubleNullable;
begin
  if not valor.IsNull then
    Result := valor

  else if not c.IsNull then
    Result := DoubleNullable.Create( c.BaseCalculo.Value, c.BaseCalculo.IsNull )
  else
    Result := DoubleNullable.NullInstance()
end;

function CalculoTributoService.GetVIbs( ibsUF: IBSUFModel; ibsMun: IBSMunModel): Currency;
begin
  Result := 0;
  if ibsUF <> nil then
    Result := ibsUF.VIBSUF
  else
    Result := 0;

  if ibsMun <> nil then
    Result := Result + ibsMun.VIBSMun;
end;

function CalculoTributoService.GetGIBSCBS(
  const Cbs, IbsEstadual, IbsMunicipal: ResultadoCbsIbs;
  TpEnteGov: TipoEnteGovernamental;
  DataFatoGerador: TDatetime
): GrupoIBSCBSModel;
var
  vBC: DoubleNullable;
  ibsUF: IBSUFModel;
  ibsMun: IBSMunModel;
  vIBS: Currency;
  tributacaoRegular: TributacaoRegularModel;
  compraGovernamental: TributacaoCompraGovernamentalModel;
  compraGovernamentalEfetiva: TributacaoCompraGovernamentalModel;
  cbsEfetivo, ibsUfEfetivo, ibsMunEfetivo: ResultadoCbsIbs;
  pTransferenciaCBS: Currency;
begin
  // CST sem gIBSCBS (ex: imunidade): nenhum tributo foi calculado, nao gera grupo.
  // Espelho de CalculoTributoService.java#L229-L233: o percentual de transferencia
  // so e consultado quando ha grupo IBS/CBS a gerar.
  if Cbs.IsNull() and IbsEstadual.IsNull() and IbsMunicipal.IsNull() then
  begin
    Result := nil;
    Exit;
  end;

  pTransferenciaCBS := FTransferenciaService.GetPercentualTransferencia(DataFatoGerador);

  compraGovernamental := GetCompraGovernamental( Cbs, IbsEstadual, IbsMunicipal );
  if compraGovernamental.IsNull() then
    compraGovernamentalEfetiva := TributacaoCompraGovernamentalModel.NullInstance()
  else
    compraGovernamentalEfetiva := compraGovernamental.GetValoresEfetivos(
      TpEnteGov, CurrencyNullable.Create(pTransferenciaCBS), DataFatoGerador
    );

  // Aplica o impacto da compra governamental efetiva sobre cada tributo,
  // operando sobre copias locais dos resultados (o ResultadoCbsIbs e imutavel por valor).
  cbsEfetivo := Cbs;
  ibsUfEfetivo := IbsEstadual;
  ibsMunEfetivo := IbsMunicipal;

  TrataImpactoCompraGovCBS(cbsEfetivo, compraGovernamentalEfetiva);
  TrataImpactoCompraGovIBSUF(ibsUfEfetivo, compraGovernamentalEfetiva);
  TrataImpactoCompraGovIBSMun(ibsMunEfetivo, compraGovernamentalEfetiva);

  vBC := getVBC(ibsMunEfetivo, getVBC(ibsUfEfetivo, getVBC(cbsEfetivo, DoubleNullable.NullInstance())));
  ibsUF := GetIBSUF( ibsUfEfetivo );
  ibsMun := GetIBSMun( ibsMunEfetivo );
  vIBS := GetVIbs( ibsUF, ibsMun );
  tributacaoRegular := GetTributacaoRegular( cbsEfetivo, ibsUfEfetivo, ibsMunEfetivo );

  if (not tributacaoRegular.IsNull()) and (not compraGovernamental.IsNull()) then
    // suspensao com compra gov - zera valores
    compraGovernamental.ZerarValores();

  if not compraGovernamental.IsNull then
    // Normalizar as casas decimais conforme o modelo do Java
    compraGovernamental.NormalizarSaida();

  Result := GrupoIBSCBSModel.Create(
    CurrencyNullable.Create(vBC.Value, vBC.IsNull),
    ibsUF,
    ibsMun,
    vIBS,
    GetCbs( cbsEfetivo ),
    tributacaoRegular,
    compraGovernamental
  );
end;

function CalculoTributoService.GetIBSCBS(
  const Item: ItemCalculoInput;
  const Cbs, IbsEstadual, IbsMunicipal: ResultadoCbsIbs;
  TpEnteGov: TipoEnteGovernamental;
  DataFatoGerador: TDate
): IBSCBSModel;
var
  monofasia: MonofasiaModel;
  gIBSCBS: GrupoIBSCBSModel;
begin
  monofasia := GetMonofasia( Cbs, IbsEstadual, IbsMunicipal );

  if monofasia = nil then
    gIBSCBS := GetGIBSCBS( Cbs, IbsEstadual, IbsMunicipal, TpEnteGov, DataFatoGerador )
  else
    gIBSCBS := nil;

  Result := IBSCBSModel.Create(
    StrToIntDef( Item.CST, -1 ),
    Item.cClassTrib,
    gIBSCBS,
    monofasia,
    GetTransferenciaCredito( Cbs, IbsEstadual, IbsMunicipal ),
    GetAjusteCompetencia( Cbs, IbsEstadual, IbsMunicipal ),
    GetEstornoCredito( Cbs, IbsEstadual, IbsMunicipal ),
    GetCreditoPresumidoOperacao( Cbs, IbsEstadual, IbsMunicipal ),
    GetCreditoPresumidoIBSZFM( Cbs, IbsEstadual, IbsMunicipal )
  );
end;

function CalculoTributoService.GetIBSMun(const IbsMunicipal: ResultadoCbsIbs): IBSMunModel;
begin
  if IbsMunicipal.IsNull() then
  begin
    Result := nil;//IBSMunModel.NullInstance();
    Exit;
  end;

  Result := IBSMunModel.Create(
    IbsMunicipal.Aliquota,
    IbsMunicipal.GrupoDiferimento,
    GetDevolucaoTributos(IbsMunicipal),
    IbsMunicipal.GrupoReducao,
    IbsMunicipal.TributoDevido,
    IbsMunicipal.MemoriaCalculo
  );
end;

function CalculoTributoService.GetIBSUF(const IbsEstadual: ResultadoCbsIbs): IBSUFModel;
begin
  if IbsEstadual.IsNull() then
  begin
    Result := nil;//IBSUFModel.NullInstance();
    Exit;
  end;

  Result := IBSUFModel.Create(
    IbsEstadual.Aliquota,
    IbsEstadual.GrupoDiferimento,
    GetDevolucaoTributos(IbsEstadual),
    IbsEstadual.GrupoReducao,
    IbsEstadual.TributoDevido,
    IbsEstadual.MemoriaCalculo
  );
end;

function CalculoTributoService.GetMonofasia(const Cbs, IbsEstadual, IbsMunicipal: ResultadoCbsIbs): MonofasiaModel;
var
  monoPadrao: MonofasiaPadraoModel;
  monoReten: MonofasiaRetencaoModel;
  monoRet: MonofasiaRetidoAnteriormenteModel;
  monoDif: MonofasiaDiferimentoModel;
  vTotIBSMonoItem, vTotCBSMonoItem: Currency;
begin
  monoPadrao := MonofasiaPadraoModel.Create( Cbs, IbsEstadual, IbsMunicipal );
  monoReten := MonofasiaRetencaoModel.Create( Cbs, IbsEstadual, IbsMunicipal );
  monoRet := MonofasiaRetidoAnteriormenteModel.Create( Cbs, IbsEstadual, IbsMunicipal );
  monoDif := MonofasiaDiferimentoModel.Create( Cbs, IbsEstadual, IbsMunicipal );

  if not monoPadrao.IsNull()
    or not monoReten.IsNull()
    or not monoRet.IsNull()
    or not monoDif.IsNull()
  then
  begin
    vTotIBSMonoItem := monoPadrao.VIBSMono + monoReten.VIBSMonoReten - monoDif.VIBSMonoDif;
    vTotCBSMonoItem := monoPadrao.VCBSMono + monoReten.VCBSMonoReten - monoDif.VCBSMonoDif;

    Result := MonofasiaModel.Create(
      monoPadrao, monoReten, monoRet, monoDif, vTotIBSMonoItem, vTotCBSMonoItem
    );
  end
  else
    Result := nil;
end;

function CalculoTributoService.GetTransferenciaCredito(const Cbs, IbsEstadual,
  IbsMunicipal: ResultadoCbsIbs): TransferenciaCreditoModel;
begin
  // TODO - Implementar transferência de crédito
  Result := TransferenciaCreditoModel.NullInstance();
end;

function CalculoTributoService.GetAjusteCompetencia(
  const Cbs: ResultadoCbsIbs;
  const IbsEstadual: ResultadoCbsIbs;
  const IbsMunicipal: ResultadoCbsIbs
): AjusteCompetenciaModel;
begin
  // TODO - Implementar ajuste de competência
  Result := AjusteCompetenciaModel.NullInstance();
end;

function CalculoTributoService.GetEstornoCredito(
  const Cbs: ResultadoCbsIbs;
  const IbsEstadual: ResultadoCbsIbs;
  const IbsMunicipal: ResultadoCbsIbs
): EstornoCreditoModel;
begin
  // TODO - Implementar estorno de crédito
  Result := EstornoCreditoModel.NullInstance();
end;

function CalculoTributoService.GetCreditoPresumidoOperacao(
  const Cbs: ResultadoCbsIbs;
  const IbsEstadual: ResultadoCbsIbs;
  const IbsMunicipal: ResultadoCbsIbs
): CreditoPresumidoOperacaoModel;
begin
  // TODO - Implementar credito presumido
  Result := CreditoPresumidoOperacaoModel.NullInstance();
end;


function CalculoTributoService.GetTributacaoRegular(const Cbs, IbsEstadual,
  IbsMunicipal: ResultadoCbsIbs): TributacaoRegularModel;
var
  builderCbs, builderIbsUF, builderIbsMun: TributacaoRegularModel;
begin

  builderCbs := GetTributacaoRegularCBS( Cbs, TributacaoRegularModel.NullInstance() );
  builderIbsUF := GetTributacaoRegularIBSUF( IbsEstadual, builderCbs );
  builderIbsMun := GetTributacaoRegularIBSMun( IbsMunicipal, builderIbsUF );

  Result := builderIbsMun;
end;

function CalculoTributoService.GetTributacaoRegularCBS(const Cbs: ResultadoCbsIbs;
  const Builder: TributacaoRegularModel): TributacaoRegularModel;
var
  tr: ResultadoTributacaoRegular;
begin
  if Cbs.IsNull() or Cbs.TributacaoRegular.IsNull() then
  begin
    if not Builder.IsNull() then
      Result := Builder
    else
      Result := TributacaoRegularModel.NullInstance();
    Exit;
  end;

  tr := Cbs.TributacaoRegular;

  if not Builder.IsNull() then
    Result := Builder
  else
    Result := TributacaoRegularModel.Create( StrToIntDef(tr.Cst, -1), tr.CClassTrib );

  Result.SetCBS(tr.AliquotaEfetiva, tr.TributoDevido);
end;

function CalculoTributoService.GetTributacaoRegularIBSMun(const IbsMunicipal: ResultadoCbsIbs;
  const Builder: TributacaoRegularModel): TributacaoRegularModel;
var
  tr: ResultadoTributacaoRegular;
begin
  if IbsMunicipal.IsNull() or IbsMunicipal.TributacaoRegular.IsNull() then
  begin
    if not Builder.IsNull() then
      Result := Builder
    else
      Result := TributacaoRegularModel.NullInstance();
    Exit;
  end;

  tr := IbsMunicipal.TributacaoRegular;

  if not Builder.IsNull() then
    Result := Builder
  else
    Result := TributacaoRegularModel.Create( StrToIntDef(tr.Cst, -1), tr.CClassTrib );

  Result.SetIBSMun(tr.AliquotaEfetiva, tr.TributoDevido);
end;

function CalculoTributoService.GetTributacaoRegularIBSUF(const IbsEstadual: ResultadoCbsIbs;
  const Builder: TributacaoRegularModel): TributacaoRegularModel;
var
  tr: ResultadoTributacaoRegular;
begin
  if IbsEstadual.IsNull() or IbsEstadual.TributacaoRegular.IsNull() then
  begin
    if not Builder.IsNull() then
      Result := Builder
    else
      Result := TributacaoRegularModel.NullInstance();
    Exit;
  end;

  tr := IbsEstadual.TributacaoRegular;

  if not Builder.IsNull() then
    Result := Builder
  else
    Result := TributacaoRegularModel.Create( StrToIntDef(tr.Cst, -1), tr.CClassTrib );

  Result.SetIBSUF(tr.AliquotaEfetiva, tr.TributoDevido);
end;

function CalculoTributoService.Calcular(const Operacao: OperacaoTributacaoModel): TributosModel;
var
  item: ItemCalculoInput;
  data: TDate;
  ncm: string;
  nbs: string;
  tratamentoCbsIbs: TratamentoClassificacaoModel;
  tratamentoSeletivo: TratamentoClassificacaoModel;
  tratamentoCbsIbsDeson: TratamentoClassificacaoModel;
  tratamentoClassificacao: TratamentoClassificacaoModel;
  temDesoneracao: Boolean;
  impostoSeletivo: ImpostoSeletivoModel;
  aliqImpostoSeletivo: AliquotaImpostoSeletivoModel;
  impostoSelCalculado: Currency;
  cbs, ibsEstadual, ibsMunicipal: ResultadoCbsIbs;
  memoriaCalculoImpostoSeletivo: string;
  memoriaCalculoCbs, memoriaCalculoIbsEstadual, memoriaCalculoIbsMunicipal: string;
begin

  item := Operacao.Item;
  data := Operacao.Data;
  ncm := Trim(item.NCM);
  nbs := Trim(item.NBS);

  tratamentoCbsIbs := Operacao.TratamentoClassificacao.TratamentoClassificacaoCbsIbs;
  tratamentoSeletivo := Operacao.TratamentoClassificacao.TratamentoClassificacaoImpostoSeletivo;
  temDesoneracao := Operacao.TratamentoClassificacao.TemDesoneracao;

  tratamentoCbsIbsDeson := TratamentoClassificacaoModel.NullInstance();
  if temDesoneracao then
    tratamentoCbsIbsDeson := Operacao.TratamentoClassificacao.TratamentoClassificacaoCbsIbsDesoneracao;

  if temDesoneracao then
    tratamentoClassificacao := tratamentoCbsIbsDeson
  else
    tratamentoClassificacao := tratamentoCbsIbs;

  impostoSeletivo := impostoSeletivo.NullInstance();

  if not tratamentoSeletivo.IsNull() then
  begin
    aliqImpostoSeletivo := Operacao.TratamentoClassificacao.AliquotaImpostoSeletivo;
    impostoSeletivo := FCalculoImpostoSeletivo.Calcular(
      item,
      tratamentoSeletivo,
      aliqImpostoSeletivo,
      data
    );
  end;

  cbs := ResultadoCbsIbs.NullInstance();
  ibsEstadual := ResultadoCbsIbs.NullInstance();
  ibsMunicipal := ResultadoCbsIbs.NullInstance();
  if not tratamentoCbsIbs.IsNull() then
  begin
    impostoSelCalculado := IfThen( not impostoSeletivo.IsNull(), impostoSeletivo.GetValorImpostoSeletivo() );

    cbs := FCalculoCbsIbs.Calcular( tbtCBS, Operacao.CodigoUF, Operacao.CodigoMunicipio, item,
      tratamentoCbsIbs, impostoSelCalculado, tratamentoCbsIbsDeson, temDesoneracao, data,
      Operacao.TpEnteGov, Operacao.PRedutor );

    if not cbs.IsNull() then
    begin
      memoriaCalculoCbs := FMemoriaCalculo.GerarMemoriaCalculoCbsIbs(
        tratamentoClassificacao, cbs, item.Quantidade, item.Unidade, data);

      cbs.SetMemoriaCalculo( memoriaCalculoCbs );
    end;

    if FCalculoIbsHabilitado or (Trim(nbs) <> '')  then
    begin
      ibsEstadual := FCalculoCbsIbs.Calcular( tbtIBSUF, Operacao.CodigoUF, Operacao.CodigoMunicipio, item,
        tratamentoCbsIbs, impostoSelCalculado, tratamentoCbsIbsDeson, temDesoneracao, data,
        Operacao.TpEnteGov, Operacao.PRedutor );

      if not ibsEstadual.IsNull() then
      begin
        memoriaCalculoIbsEstadual := FMemoriaCalculo.GerarMemoriaCalculoCbsIbs(
          tratamentoClassificacao, ibsEstadual, item.Quantidade, item.Unidade, data);

        ibsEstadual.SetMemoriaCalculo( memoriaCalculoIbsEstadual );
      end;

      ibsMunicipal := FCalculoCbsIbs.Calcular( tbtIBSMun, Operacao.CodigoUF, Operacao.CodigoMunicipio, item,
        tratamentoCbsIbs, impostoSelCalculado, tratamentoCbsIbsDeson, temDesoneracao, data,
        Operacao.TpEnteGov, Operacao.PRedutor );

      if not ibsMunicipal.IsNull() then
      begin
        memoriaCalculoIbsMunicipal := FMemoriaCalculo.GerarMemoriaCalculoCbsIbs(
          tratamentoClassificacao, ibsMunicipal, item.Quantidade, item.Unidade, data);

        ibsMunicipal.SetMemoriaCalculo( memoriaCalculoIbsMunicipal );
      end;
    end;
  end;

  // Regra: Suspensão de CBS e IBS não suspende o Imposto Seletivo automaticamente.
  // if temDesoneracao and not impostoSeletivo.IsNull() then
  //   impostoSeletivo.SetOperacaoComDesoneracao();

  if not impostoSeletivo.IsNull() then
  begin
    memoriaCalculoImpostoSeletivo := FMemoriaCalculo.GerarMemoriaCalculoImpostoSeletivo(
      tratamentoSeletivo,
      impostoSeletivo,
      item.ImpostoSeletivo.Quantidade,
      item.ImpostoSeletivo.Unidade,
      data
    );
    impostoSeletivo.SetMemoriaCalculo( memoriaCalculoImpostoSeletivo );
  end;

  Result := TributosModel.Create(
    impostoSeletivo,
    GetIBSCBS( item, cbs, ibsEstadual, ibsMunicipal, Operacao.TpEnteGov, data )
  );
end;

end.
