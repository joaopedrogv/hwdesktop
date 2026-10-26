unit TributosDFeSerivceUnit;

interface

uses
  ROCItemDomainUnit,
  TributoDFeContextEtdUnit,
  TributosDFeServiceTypes;

type

  TributosDFeSerivce = class
  public
    class function Create(const Input: TributoDFeContextInput; Item: ROCItemDomain): TributoDFeContextEtd;
    class procedure AplicarProporcao(Tributo: TributoDFeContextEtd; Proporcao: Double);
  end;

implementation

uses
  SysUtils,
  Math, DiferimentoModelUnit,
  DevolucaoTributosModelUnit, ReducaoAliquotaModelUnit,
  ImpostoSeletivoModelUnit,
  TributoDFeImpostoSeletivoEtdUnit,
  TributoDFeGrupoIbsCbsEtdUnit,
  TributoDFeIbsCbsEtdUnit,
  TributoDFeMonofasiaIbsCbsEtdUnit,
  TributoDFeTransfCredIbsCbsEtdUnit,
  TributoDFeAjusteCompetIbsCbsEtdUnit,
  TributoDFeCredPresOpIbsCbsEtdUnit,
  TributoDFeCredPresZfmIbsCbsEtdUnit,
  TributoDFeIbsCbsTribRegEtdUnit,
  TributoDFeIbsCbsCompraGovEtdUnit,
  IBSCBSModelUnit,
  GrupoIBSCBSModelUnit,
  MonofasiaModelUnit,
  TransferenciaCreditoModelUnit,
  CreditoPresumidoIBSZFMModelUnit,
  CreditoPresumidoOperacaoModelUnit,
  TributacaoRegularModelUnit,
  TributacaoCompraGovernamentalModelUnit, DoubleNullableUnit, IBSUFModelUnit,
  IBSMunModelUnit, CBSModelUnit, NumberServiceUnit;

type
  TributosDFeFromROCCalculadora = class(TributoDFeContextEtd)
  private
    //FImpostoSeletivo: TNotafiscalItemImpostoSeletivo;
    //FIbsCbs: TNotaFiscalItemGrupoIbsCbs;
    //FCodNF: Integer;
    //FCodEmpresa: Integer;
    //FNItem: Integer;
    //FIndDoacao: Boolean;
      //**Pend** Esse atributo é de preenchimento do usuario, e tem os calculados, falta forma de sincronizar

    function GetIS(const Input: ImpostoSeletivoModel): TributoDFeImpostoSeletivoEtd;
    function GetIbsCbs(const InputContexto: TributoDFeContextInput; Input: IBSCBSModel): TributoDFeIbsCbsEtd;
    function GetGrupoIbsCbs(Input: GrupoIBSCBSModel): TributoDFeGrupoIbsCbsEtd;
    function GetTribRegular(const Input: TributacaoRegularModel): TributoDFeIbsCbsTribRegEtd;
    function GetCompraGov(const Input: TributacaoCompraGovernamentalModel): TributoDFeIbsCbsCompraGovEtd;
    function GetMonofasia(const Input: MonofasiaModel): TributoDFeMonofasiaIbsCbsEtd;
    function GetTransfCred(const Input: TransferenciaCreditoModel): TributoDFeTransfCredIbsCbsEtd;
    function GetAjusteCompet(Input: GrupoIBSCBSModel): TributoDFeAjusteCompetIbsCbsEtd;
      //**Pend** Grupo novo nao implementado calculadora
    function GetCreditoOp(const Input: CreditoPresumidoOperacaoModel): TributoDFeCredPresOpIbsCbsEtd;
    function GetCreditoZFM(const Input: CreditoPresumidoIBSZFMModel): TributoDFeCredPresZfmIbsCbsEtd;
  public
    constructor Create(const Input: TributoDFeContextInput; Item: ROCItemDomain);
  end;

{ TributosDFeFromROCCalculadora }

constructor TributosDFeFromROCCalculadora.Create(const Input: TributoDFeContextInput; Item: ROCItemDomain);
begin
  Self.Id := Input.Id;
  Self.Origem := Input.Origem;

  if Item = nil then
    Exit;

  if not Item.PossuiImpostoSeletivo then
    ImpostoSeletivo := nil
  else
    ImpostoSeletivo := GetIS(Item.ImpostoSeletivoModel);

  if Item.TribCalc.IBSCBS = nil then
    IbsCbs := nil
  else
    IbsCbs := GetIbsCbs(Input, Item.TribCalc.IBSCBS);
end;

function TributosDFeFromROCCalculadora.GetAjusteCompet(
  Input: GrupoIBSCBSModel): TributoDFeAjusteCompetIbsCbsEtd;
begin
  //**Pend**
  Result := nil;
end;

function TributosDFeFromROCCalculadora.GetCompraGov(
  const Input: TributacaoCompraGovernamentalModel): TributoDFeIbsCbsCompraGovEtd;
begin
  if Input.IsNull() then
    Result := nil

  else
    Result := TributoDFeIbsCbsCompraGovEtd.Create
    (
      Self.Id,
      Input.PAliqIBSUF,
      Input.VTribIBSUF,
      Input.PAliqIBSMun,
      Input.VTribIBSMun,
      Input.PAliqCBS,
      Input.VTribCBS
    );
end;

function TributosDFeFromROCCalculadora.GetCreditoOp(
  const Input: CreditoPresumidoOperacaoModel): TributoDFeCredPresOpIbsCbsEtd;
var
  PIbsCredPres, VIbsCredPres, VIbsCredPresCondSus, PCbsCredPres, VCbsCredPres, VCbsCredPresCondSus: DoubleNullable;
begin
  if Input.IsNull then
    Result := nil

  else
  begin
    if Input.GIbsCredPres.IsNull() then
    begin
      PIbsCredPres := DoubleNullable.NullInstance();
      VIbsCredPres := DoubleNullable.NullInstance();
      VIBsCredPresCondSus := DoubleNullable.NullInstance();
    end
    else
    begin
      PIbsCredPres := DoubleNullable.Create( Input.GIbsCredPres.PCredPres );
      VIbsCredPres := DoubleNullable.Create( Input.GIbsCredPres.VCredPres );
      VIbsCredPresCondSus := DoubleNullable.Create( Input.GIbsCredPres.VCredPresCondSus );
    end;

    if Input.GCbsCredPres.IsNull() then
    begin
      PCbsCredPres := DoubleNullable.NullInstance();
      VCbsCredPres := DoubleNullable.NullInstance();
      VCbsCredPresCondSus := DoubleNullable.NullInstance();
    end
    else
    begin
      PCbsCredPres := DoubleNullable.Create( Input.GCbsCredPres.PCredPres );
      VCbsCredPres := DoubleNullable.Create( Input.GCbsCredPres.VCredPres );
      VIbsCredPresCondSus := DoubleNullable.Create( Input.GCbsCredPres.VCredPresCondSus );
    end;

    Result := TributoDFeCredPresOpIbsCbsEtd.Create
      (
      Self.Id,
      Input.VBCCredPres,
      IntToStr(Input.CCredPres),
      PIbsCredPres,
      VIbsCredPres,
      VIbsCredPresCondSus,
      PCbsCredPres,
      VCbsCredPres,
      VCbsCredPresCondSus
      );
  end;
end;

function TributosDFeFromROCCalculadora.GetCreditoZFM(
  const Input: CreditoPresumidoIBSZFMModel): TributoDFeCredPresZfmIbsCbsEtd;
begin
  if Input.IsNull then
    Result := nil

  else
    Result := TributoDFeCredPresZfmIbsCbsEtd.Create
      (
      Self.Id,
      {CompetApur} '', //**Pend** Vem do usuario, da data da nota?
      Input.TpCredPresIBSZFM,
      Input.VCredPresIBSZFM
      );
end;

function TributosDFeFromROCCalculadora.GetIbsCbs(
  const InputContexto: TributoDFeContextInput;
  Input: IBSCBSModel
): TributoDFeIbsCbsEtd;
var
  gIbsCbs: TributoDFeGrupoIbsCbsEtd;
begin
  if Input = nil then
    Result := nil
  else
  begin
    case Input.CST of
      410:
        gIbsCbs := nil
      else
        gIbsCbs := GetGrupoIbsCbs(Input.GIBSCBS);
    end;

    Result := TributoDFeIbsCbsEtd.Create(
      InputContexto.Id,
      InputContexto.RegraFiscalId,
      InputContexto.TipoRegra,
      Format('%.*d', [3, Input.CST]),
      Input.CClassTrib,
      InputContexto.IndDoacao,
      { VIbsestcred } DoubleNullable.NullInstance(), //**Pend** Grupo de estorno de crédito a definir
      { VCbsestcred } DoubleNullable.NullInstance(), //**Pend** Grupo de estorno de crédito a definir
      gIbsCbs,
      GetMonofasia(Input.GIBSCBSMono),
      GetTransfCred(Input.GTransfCred),
      GetAjusteCompet(Input.GIBSCBS),
      GetCreditoOp(Input.GCredPresOper),
      GetCreditoZFM(Input.GCredPresIBSZFM)
    );
  end;
end;

function TributosDFeFromROCCalculadora.GetGrupoIbsCbs(
  Input: GrupoIBSCBSModel): TributoDFeGrupoIbsCbsEtd;
var
  AIbsufPdif, AIbsufVdif, AIbsufVdevtrib, AIbsufPredaliq, AIbsufAliqefet,
    AIbsmunPdif, AIbsmunVdif, AIbsmunVdevtrib, AIbsmunPredaliq, AIbsmunAliqefet,
    ACbsPdif, ACbsVdif, ACbsVdevtrib, ACbsPredaliq, ACbsAliqefet: DoubleNullable;
  APibsuf, AVibsuf, APibsmun, AVibsmun, AVibs, APcbs, AVcbs: Double;
begin

  if Input.PossuiIBSUF or Input.PossuiIBSMun or Input.PossuiCbs then
  begin
    APibsuf := Input.GIBSUF.PIBSUF;
    AVibsuf := Input.GIBSUF.VIBSUF;
    APibsmun := Input.GIBSMun.PIBSMun;
    AVibsmun := Input.GIBSMun.VIBSMun;
    AVibs := Input.VIBS;
    APcbs := Input.GCBS.PCBS;
    AVcbs := Input.GCBS.VCBS;
  end;

  {$REGION 'IBSUF'}

  if Input.PossuiIBSUF then
  begin
    if Input.GIBSUF.GDif.IsNull then
    begin
      AIbsufPdif := DoubleNullable.NullInstance();
      AIbsufVdif := DoubleNullable.NullInstance();
    end
    else
    begin
      AIbsufPdif := DoubleNullable.Create(Input.GIBSUF.GDif.PDif);
      AIbsufVdif := DoubleNullable.Create(Input.GIBSUF.GDif.VDif);
    end;

    AIbsufVdevtrib := DoubleNullable.Create( Input.GIBSUF.GDevTrib.VDevTrib, Input.GIBSUF.GDevTrib.IsNull() );

    if Input.GIBSUF.GRed.IsNull then
    begin
      AIbsufPredaliq := DoubleNullable.NullInstance();
      AIbsufAliqefet := DoubleNullable.NullInstance();
    end
    else
    begin
      AIbsufPredaliq := DoubleNullable.Create(Input.GIBSUF.GRed.PRedAliq);
      AIbsufAliqefet := DoubleNullable.Create(Input.GIBSUF.GRed.PAliqEfet);
    end;
  end
  else
  begin
    AIbsufPdif := DoubleNullable.NullInstance();
    AIbsufVdif := DoubleNullable.NullInstance();
    AIbsufVdevtrib := DoubleNullable.NullInstance();
    AIbsufPredaliq := DoubleNullable.NullInstance();
    AIbsufAliqefet := DoubleNullable.NullInstance();
  end;

  {$ENDREGION}

  {$REGION 'IBS Municipio'}

  if Input.PossuiIBSMun then
  begin
    if Input.GIBSMun.GDif.IsNull() then
    begin
      AIbsmunPdif := DoubleNullable.NullInstance();
      AIbsmunVdif := DoubleNullable.NullInstance();
    end
    else
    begin
      AIbsmunPdif := DoubleNullable.Create(Input.GIBSMun.GDif.PDif);
      AIbsmunVdif := DoubleNullable.Create(Input.GIBSMun.GDif.VDif);
    end;

    AIbsmunVdevtrib := DoubleNullable.Create( Input.GIBSMun.GDevTrib.VDevTrib, Input.GIBSMun.GDevTrib.IsNull() );

    if Input.GIBSMun.GRed.IsNull then
    begin
      AIbsmunPredaliq := DoubleNullable.NullInstance();
      AIbsmunAliqefet := DoubleNullable.NullInstance();
    end
    else
    begin
      AIbsmunPredaliq := DoubleNullable.Create(Input.GIBSMun.GRed.PRedAliq);
      AIbsmunAliqefet := DoubleNullable.Create(Input.GIBSMun.GRed.PAliqEfet);
    end;
  end
  else
  begin
    AIbsmunPdif := DoubleNullable.NullInstance();
    AIbsmunVdif := DoubleNullable.NullInstance();
    AIbsmunVdevtrib := DoubleNullable.NullInstance();
    AIbsmunPredaliq := DoubleNullable.NullInstance();
    AIbsmunAliqefet := DoubleNullable.NullInstance();
  end;

  {$ENDREGION}

  AVibs := AVibsuf + AVibsmun;

  {$REGION 'CBS'}

  if Input.PossuiCbs then
  begin
    if Input.GCBS.GDif.IsNull() then
    begin
      ACbsPdif := DoubleNullable.NullInstance();
      ACbsVdif := DoubleNullable.NullInstance();
    end
    else
    begin
      ACbsPdif := DoubleNullable.Create(Input.GCBS.GDif.PDif);
      ACbsVdif := DoubleNullable.Create(Input.GCBS.GDif.VDif);
    end;

    ACbsVdevtrib := DoubleNullable.Create( Input.GCBS.GDevTrib.VDevTrib, Input.GCBS.GDevTrib.IsNull() );

    if Input.GCBS.GRed.IsNull then
    begin
      ACbsPredaliq := DoubleNullable.NullInstance();
      ACbsAliqefet := DoubleNullable.NullInstance();
    end
    else
    begin
      ACbsPredaliq := DoubleNullable.Create(Input.GCBS.GRed.PRedAliq);
      ACbsAliqefet := DoubleNullable.Create(Input.GCBS.GRed.PAliqEfet);
    end;
  end
  else
  begin
    ACbsPdif := DoubleNullable.NullInstance();
    ACbsVdif := DoubleNullable.NullInstance();
    ACbsVdevtrib := DoubleNullable.NullInstance();
    ACbsPredaliq := DoubleNullable.NullInstance();
    ACbsAliqefet := DoubleNullable.NullInstance();
  end;

  {$ENDREGION}

  if Input = nil then
    Result := nil

  else
    Result := TributoDFeGrupoIbsCbsEtd.Create
    (
      Self.Id,
      Input.VBC.Value,
      APibsuf,
      AIbsufPdif,
      AIbsufVdif,
      AIbsufVdevtrib, AIbsufPredaliq, AIbsufAliqefet, AVibsuf, APibsmun, AIbsmunPdif,
      AIbsmunVdif, AIbsmunVdevtrib, AIbsmunPredaliq, AIbsmunAliqefet, AVibsmun, AVibs, APcbs, ACbsPdif, ACbsVdif,
      ACbsVdevtrib, ACbsPredaliq, ACbsAliqefet, AVcbs,
      GetTribRegular(Input.TributacaoRegular),
      GetCompraGov(Input.GTribCompraGov)
    );
end;

function TributosDFeFromROCCalculadora.GetIS(
  const Input: ImpostoSeletivoModel): TributoDFeImpostoSeletivoEtd;
begin
  if Input.IsNull then
    Result := nil

  else
    Result := TributoDFeImpostoSeletivoEtd.Create
    (
      Self.Id,
      Format('%.*d', [3, Input.CSTIS]),
      Input.CClassTribIS,
      DoubleNullable.Create( Input.VBCIS ),
      DoubleNullable.Create( Input.PIS ),
      DoubleNullable.Create( Input.PISEspec ),
      Input.UTrib,
      DoubleNullable.Create( Input.QTrib ),
      DoubleNullable.Create( Input.VIS )
    );
end;

function TributosDFeFromROCCalculadora.GetMonofasia(
  const Input: MonofasiaModel): TributoDFeMonofasiaIbsCbsEtd;
begin
  if Input = nil then
    Result := nil

  else
    Result := TributoDFeMonofasiaIbsCbsEtd.Create
    (
      Self.Id,
      DoubleNullable.Create( Input.GMonoPadrao.QBCMono, Input.GMonoPadrao.IsNull() ),
      DoubleNullable.Create( Input.GMonoPadrao.AdRemIBS, Input.GMonoPadrao.IsNull() ),
      DoubleNullable.Create( Input.GMonoPadrao.VIBSMono, Input.GMonoPadrao.IsNull() ),
      DoubleNullable.Create( Input.GMonoPadrao.AdRemCBS, Input.GMonoPadrao.IsNull() ),
      DoubleNullable.Create( Input.GMonoPadrao.VCBSMono, Input.GMonoPadrao.IsNull() ),
      DoubleNullable.Create( Input.GMonoReten.QBCMonoReten, Input.GMonoReten.IsNull() ),
      DoubleNullable.Create( Input.GMonoReten.AdRemIBSReten, Input.GMonoReten.IsNull() ),
      DoubleNullable.Create( Input.GMonoReten.VIBSMonoReten, Input.GMonoReten.IsNull() ),
      DoubleNullable.Create( Input.GMonoReten.AdRemCBSReten, Input.GMonoReten.IsNull() ),
      DoubleNullable.Create( Input.GMonoReten.VCBSMonoReten, Input.GMonoReten.IsNull() ),
      DoubleNullable.Create( Input.GMonoRet.QBCMonoRet, Input.GMonoRet.IsNull() ),
      DoubleNullable.Create( Input.GMonoRet.AdRemIBSRet, Input.GMonoRet.IsNull() ),
      DoubleNullable.Create( Input.GMonoRet.VIBSMonoRet, Input.GMonoRet.IsNull() ),
      DoubleNullable.Create( Input.GMonoRet.AdRemCBSRet, Input.GMonoRet.IsNull() ),
      DoubleNullable.Create( Input.GMonoRet.VCBSMonoRet, Input.GMonoRet.IsNull() ),
      DoubleNullable.Create( Input.GMonoDif.PDifIBS, Input.GMonoDif.IsNull() ),
      DoubleNullable.Create( Input.GMonoDif.VIBSMonoDif, Input.GMonoDif.IsNull() ),
      DoubleNullable.Create( Input.GMonoDif.PDifCBS, Input.GMonoDif.IsNull() ),
      DoubleNullable.Create( Input.GMonoDif.VCBSMonoDif, Input.GMonoDif.IsNull() ),
      Input.VTotIBSMonoItem,
      Input.VTotCBSMonoItem
    );
end;

function TributosDFeFromROCCalculadora.GetTransfCred(
  const Input: TransferenciaCreditoModel): TributoDFeTransfCredIbsCbsEtd;
begin
  if Input.IsNull then
    Result := nil

  else
    Result := TributoDFeTransfCredIbsCbsEtd.Create
    (
      Self.Id,
      Input.VIBS, Input.VCBS
    );
end;

function TributosDFeFromROCCalculadora.GetTribRegular(
  const Input: TributacaoRegularModel): TributoDFeIbsCbsTribRegEtd;
begin
  if Input.IsNull then
    Result := nil

  else
    Result := TributoDFeIbsCbsTribRegEtd.Create
    (
      Self.Id,
      Format('%.*d', [3, Input.CSTReg]),
      Input.CClassTribReg,
      Input.PAliqEfetRegIBSUF,
      Input.VTribRegIBSUF,
      Input.PAliqEfetRegIBSMun,
      Input.VTribRegIBSMun,
      Input.PAliqEfetRegCBS,
      Input.VTribRegCBS
    );
end;

{ TributosDFeSerivce }

class procedure TributosDFeSerivce.AplicarProporcao(
  Tributo: TributoDFeContextEtd; Proporcao: Double);
begin
  if Tributo = nil then
    Exit;

  if Tributo.ImpostoSeletivo <> nil then
  begin
    if not Tributo.ImpostoSeletivo.Vbcis.IsNull and (Tributo.ImpostoSeletivo.Vbcis.Value > 0) then
      Tributo.ImpostoSeletivo.Vbcis := DoubleNullable.Create( NumberService.RoundHalfUp(
        Tributo.ImpostoSeletivo.Vbcis.Value * Proporcao, 2
      ));
    if not Tributo.ImpostoSeletivo.Qtrib.IsNull and (Tributo.ImpostoSeletivo.Qtrib.Value > 0) then
      Tributo.ImpostoSeletivo.Qtrib := DoubleNullable.Create( NumberService.RoundHalfUp(
        Tributo.ImpostoSeletivo.Qtrib.Value * Proporcao, 2
      ));
    if not Tributo.ImpostoSeletivo.Vis.IsNull and (Tributo.ImpostoSeletivo.Vis.Value > 0) then
      Tributo.ImpostoSeletivo.Vis := DoubleNullable.Create( NumberService.RoundHalfUp(
        Tributo.ImpostoSeletivo.Vis.Value * Proporcao, 2
      ));
  end;

  if Tributo.IbsCbs <> nil then
  begin
    if not Tributo.IbsCbs.VIbsEstCred.IsNull and (Tributo.IbsCbs.VIbsEstCred.Value > 0) then
      Tributo.IbsCbs.VIbsEstCred := DoubleNullable.Create( NumberService.RoundHalfUp(
        Tributo.IbsCbs.VIbsEstCred.Value * Proporcao, 2
      ));
    if not Tributo.IbsCbs.VCbsEstCred.IsNull and (Tributo.IbsCbs.VCbsEstCred.Value > 0) then
      Tributo.IbsCbs.VCbsEstCred := DoubleNullable.Create( NumberService.RoundHalfUp(
        Tributo.IbsCbs.VCbsEstCred.Value * Proporcao, 2
      ));
    if Tributo.IbsCbs.GIbsCbs <> nil then
    begin
      if Tributo.IbsCbs.GIbsCbs.VBc > 0 then
        Tributo.IbsCbs.GIbsCbs.VBc := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.VBc * Proporcao, 2);

      if not Tributo.IbsCbs.GIbsCbs.IbsUfVdif.IsNull and (Tributo.IbsCbs.GIbsCbs.IbsUfVdif.Value > 0) then
        Tributo.IbsCbs.GIbsCbs.IbsUfVdif := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.GIbsCbs.IbsUfVdif.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.GIbsCbs.IbsMunVdif.IsNull and (Tributo.IbsCbs.GIbsCbs.IbsMunVdif.Value > 0) then
        Tributo.IbsCbs.GIbsCbs.IbsMunVdif := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.GIbsCbs.IbsMunVdif.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.GIbsCbs.CbsVdif.IsNull and (Tributo.IbsCbs.GIbsCbs.CbsVdif.Value > 0) then
        Tributo.IbsCbs.GIbsCbs.CbsVdif := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.GIbsCbs.CbsVdif.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.GIbsCbs.IbsUfVDevTrib.IsNull and (Tributo.IbsCbs.GIbsCbs.IbsUfVDevTrib.Value > 0) then
        Tributo.IbsCbs.GIbsCbs.IbsUfVDevTrib := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.GIbsCbs.IbsUfVDevTrib.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.GIbsCbs.IbsMunVDevTrib.IsNull and (Tributo.IbsCbs.GIbsCbs.IbsMunVDevTrib.Value > 0) then
        Tributo.IbsCbs.GIbsCbs.IbsMunVDevTrib := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.GIbsCbs.IbsMunVDevTrib.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.GIbsCbs.CbsVDevTrib.IsNull and (Tributo.IbsCbs.GIbsCbs.CbsVDevTrib.Value > 0) then
        Tributo.IbsCbs.GIbsCbs.CbsVDevTrib := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.GIbsCbs.CbsVDevTrib.Value * Proporcao, 2
        ));
      if Tributo.IbsCbs.GIbsCbs.VCbs > 0 then
        Tributo.IbsCbs.GIbsCbs.VCbs := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.VCbs * Proporcao, 2);
      if Tributo.IbsCbs.GIbsCbs.VIbsUf > 0 then
        Tributo.IbsCbs.GIbsCbs.VIbsUf := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.VIbsUf * Proporcao, 2);
      if Tributo.IbsCbs.GIbsCbs.VIbsmun > 0 then
        Tributo.IbsCbs.GIbsCbs.VIbsmun := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.VIbsmun * Proporcao, 2);
      if Tributo.IbsCbs.GIbsCbs.VIbs > 0 then
        Tributo.IbsCbs.GIbsCbs.VIbs := Tributo.IbsCbs.GIbsCbs.VIbsUf + Tributo.IbsCbs.GIbsCbs.VIbsmun;

      if Tributo.IbsCbs.GIbsCbs.TribRegular <> nil then
      begin
        if Tributo.IbsCbs.GIbsCbs.TribRegular.Vtribregibsuf > 0 then
          Tributo.IbsCbs.GIbsCbs.TribRegular.Vtribregibsuf := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.TribRegular.Vtribregibsuf * Proporcao, 2);
        if Tributo.IbsCbs.GIbsCbs.TribRegular.Vtribregibsmun > 0 then
          Tributo.IbsCbs.GIbsCbs.TribRegular.Vtribregibsmun := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.TribRegular.Vtribregibsmun * Proporcao, 2);
        if Tributo.IbsCbs.GIbsCbs.TribRegular.Vtribregcbs > 0 then
          Tributo.IbsCbs.GIbsCbs.TribRegular.Vtribregcbs := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.TribRegular.Vtribregcbs * Proporcao, 2);
      end;

      if Tributo.IbsCbs.GIbsCbs.CompraGov <> nil then
      begin
        if Tributo.IbsCbs.GIbsCbs.CompraGov.Vtribibsuf > 0 then
          Tributo.IbsCbs.GIbsCbs.CompraGov.Vtribibsuf := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.CompraGov.Vtribibsuf * Proporcao, 2);
        if Tributo.IbsCbs.GIbsCbs.CompraGov.Vtribibsmun > 0 then
          Tributo.IbsCbs.GIbsCbs.CompraGov.Vtribibsmun := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.CompraGov.Vtribibsmun * Proporcao, 2);
        if Tributo.IbsCbs.GIbsCbs.CompraGov.Vtribcbs > 0 then
          Tributo.IbsCbs.GIbsCbs.CompraGov.Vtribcbs := NumberService.RoundHalfUp(Tributo.IbsCbs.GIbsCbs.CompraGov.Vtribcbs * Proporcao, 2);
      end;
    end;

    if Tributo.IbsCbs.TransfCred <> nil then
    begin
      if Tributo.IbsCbs.TransfCred.Vibs > 0 then
        Tributo.IbsCbs.TransfCred.Vibs := NumberService.RoundHalfUp(Tributo.IbsCbs.TransfCred.Vibs * Proporcao, 2);
      if Tributo.IbsCbs.TransfCred.Vcbs > 0 then
        Tributo.IbsCbs.TransfCred.Vcbs := NumberService.RoundHalfUp(Tributo.IbsCbs.TransfCred.Vcbs * Proporcao, 2);
    end;

    if Tributo.IbsCbs.AjusteCompet <> nil then
    begin
      if Tributo.IbsCbs.AjusteCompet.Vibs > 0 then
        Tributo.IbsCbs.AjusteCompet.Vibs := NumberService.RoundHalfUp(Tributo.IbsCbs.AjusteCompet.Vibs * Proporcao, 2);
      if Tributo.IbsCbs.AjusteCompet.Vcbs > 0 then
        Tributo.IbsCbs.AjusteCompet.Vcbs := NumberService.RoundHalfUp(Tributo.IbsCbs.AjusteCompet.Vcbs * Proporcao, 2);
    end;

    if Tributo.IbsCbs.CredPresOp <> nil then
    begin
      if Tributo.IbsCbs.CredPresOp.Vbccredpres > 0 then
        Tributo.IbsCbs.CredPresOp.Vbccredpres := NumberService.RoundHalfUp(Tributo.IbsCbs.CredPresOp.Vbccredpres * Proporcao, 2);
      if not Tributo.IbsCbs.CredPresOp.IbsVcredpres.IsNull and (Tributo.IbsCbs.CredPresOp.IbsVcredpres.Value > 0) then
        Tributo.IbsCbs.CredPresOp.IbsVcredpres := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.CredPresOp.IbsVcredpres.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.CredPresOp.IbsVcredprescondsus.IsNull and (Tributo.IbsCbs.CredPresOp.IbsVcredprescondsus.Value > 0) then
        Tributo.IbsCbs.CredPresOp.IbsVcredprescondsus := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.CredPresOp.IbsVcredprescondsus.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.CredPresOp.CbsVcredpres.IsNull and (Tributo.IbsCbs.CredPresOp.CbsVcredpres.Value > 0) then
        Tributo.IbsCbs.CredPresOp.CbsVcredpres := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.CredPresOp.CbsVcredpres.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.CredPresOp.CbsVcredprescondsus.IsNull and (Tributo.IbsCbs.CredPresOp.CbsVcredprescondsus.Value > 0) then
        Tributo.IbsCbs.CredPresOp.CbsVcredprescondsus := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.CredPresOp.CbsVcredprescondsus.Value * Proporcao, 2
        ));
    end;

    if Tributo.IbsCbs.CredPresZFM <> nil then
    begin
      if Tributo.IbsCbs.CredPresZFM.Vcredpresibszfm > 0 then
        Tributo.IbsCbs.CredPresZFM.Vcredpresibszfm := NumberService.RoundHalfUp(Tributo.IbsCbs.CredPresZFM.Vcredpresibszfm * Proporcao, 2);
    end;

    if Tributo.IbsCbs.Monofasia <> nil then
    begin
      if Tributo.IbsCbs.Monofasia.Vtotibsmonoitem > 0 then
        Tributo.IbsCbs.Monofasia.Vtotibsmonoitem := NumberService.RoundHalfUp(Tributo.IbsCbs.Monofasia.Vtotibsmonoitem * Proporcao, 2);
      if Tributo.IbsCbs.Monofasia.Vtotcbsmonoitem > 0 then
        Tributo.IbsCbs.Monofasia.Vtotcbsmonoitem := NumberService.RoundHalfUp(Tributo.IbsCbs.Monofasia.Vtotcbsmonoitem * Proporcao, 2);
      if not Tributo.IbsCbs.Monofasia.Vibsmono.IsNull and (Tributo.IbsCbs.Monofasia.Vibsmono.Value > 0) then
        Tributo.IbsCbs.Monofasia.Vibsmono := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.Monofasia.Vibsmono.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.Monofasia.Vcbsmono.IsNull and (Tributo.IbsCbs.Monofasia.Vcbsmono.Value > 0) then
        Tributo.IbsCbs.Monofasia.Vcbsmono := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.Monofasia.Vcbsmono.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.Monofasia.Vibsmonoreten.IsNull and (Tributo.IbsCbs.Monofasia.Vibsmonoreten.Value > 0) then
        Tributo.IbsCbs.Monofasia.Vibsmonoreten := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.Monofasia.Vibsmonoreten.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.Monofasia.Vcbsmonoreten.IsNull and (Tributo.IbsCbs.Monofasia.Vcbsmonoreten.Value > 0) then
        Tributo.IbsCbs.Monofasia.Vcbsmonoreten := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.Monofasia.Vcbsmonoreten.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.Monofasia.Vibsmonoret.IsNull and (Tributo.IbsCbs.Monofasia.Vibsmonoret.Value > 0) then
        Tributo.IbsCbs.Monofasia.Vibsmonoret := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.Monofasia.Vibsmonoret.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.Monofasia.Vcbsmonoret.IsNull and (Tributo.IbsCbs.Monofasia.Vcbsmonoret.Value > 0) then
        Tributo.IbsCbs.Monofasia.Vcbsmonoret := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.Monofasia.Vcbsmonoret.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.Monofasia.Vibsmonodif.IsNull and (Tributo.IbsCbs.Monofasia.Vibsmonodif.Value > 0) then
        Tributo.IbsCbs.Monofasia.Vibsmonodif := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.Monofasia.Vibsmonodif.Value * Proporcao, 2
        ));
      if not Tributo.IbsCbs.Monofasia.Vcbsmonodif.IsNull and (Tributo.IbsCbs.Monofasia.Vcbsmonodif.Value > 0) then
        Tributo.IbsCbs.Monofasia.Vcbsmonodif := DoubleNullable.Create( NumberService.RoundHalfUp(
          Tributo.IbsCbs.Monofasia.Vcbsmonodif.Value * Proporcao, 2
        ));
    end;
  end;

end;

class function TributosDFeSerivce.Create(const Input: TributoDFeContextInput; Item: ROCItemDomain): TributoDFeContextEtd;
begin
  Result := TributosDFeFromROCCalculadora.Create( Input, Item );
end;

end.
