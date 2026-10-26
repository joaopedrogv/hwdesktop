unit TributosDFeFactoryUnit;

interface

uses
  TributoDFeContextEtdUnit,
  ACBrNFe.Classes, ACBrDFe.RTC.Classes, TributoDFeOrigemEnumUnit;

type
  // As alteracoes nesse arquivo nao sao definitivas, ainda falta criar os modelos no banco de dados e suas classes respectivas
  TributosDFeFactory = class
  public
    class function GetIBSCBS(Contexto: TributoDFeContextEtd): TIBSCBS;
    class function GetTributoDFe(Origem: TributoDFeOrigemEnum; Imposto: TImposto): TributoDFeContextEtd;
  end;

implementation

uses
  SysUtils, StrUtils,
  ACBrDFe.Conversao,
  pcnConversaoNFe,
  TributoDFeIbsCbsEtdUnit, GuidServiceUnit, StringNullableUnit, TipoRegraTributoDFeEnumUnit,
  TributoDFeImpostoSeletivoEtdUnit, DoubleNullableUnit, TributoDFeGrupoIbsCbsEtdUnit, TributoDFeMonofasiaIbsCbsEtdUnit,
  TributoDFeTransfCredIbsCbsEtdUnit, TributoDFeAjusteCompetIbsCbsEtdUnit, TributoDFeCredPresOpIbsCbsEtdUnit,
  TributoDFeCredPresZfmIbsCbsEtdUnit, TributoDFeIbsCbsTribRegEtdUnit, TributoDFeIbsCbsCompraGovEtdUnit;

type
  TributoDFeToACBrService = class
  public
    class function Get(Contexto: TributoDFeContextEtd): TIBSCBS;
  end;

  ACBrDFeToTributoDFe = class
  private
    class function GetCredPresZFM(const ContextoId: string; Input: TCredPresIBSZFM): TributoDFeCredPresZfmIbsCbsEtd;
    class function GetCredPresOper(const ContextoId: string; Input: TgCredPresOper): TributoDFeCredPresOpIbsCbsEtd;
    class function GetAjusteCompet(const ContextoId: string; Input: TgAjusteCompet): TributoDFeAjusteCompetIbsCbsEtd;
    class function GetTransfCred(const ContextoId: string; Input: TgTransfCred): TributoDFeTransfCredIbsCbsEtd;
    class function GetMonofasia(const ContextoId: string; Input: TgIBSCBSMono): TributoDFeMonofasiaIbsCbsEtd;
    class function GetGIbsCbsCompraGov(const ContextoId: string; Input: TgTribCompraGov): TributoDFeIbsCbsCompraGovEtd;
    class function GetGIbsCbsTribReg(const ContextoId: string; Input: TgTribRegular): TributoDFeIbsCbsTribRegEtd;
    class function GetGIbsCbs(const ContextoId: string; Input: TgIBSCBS): TributoDFeGrupoIbsCbsEtd;
    class function GetImpSel(const ContextoId: string; Input: TgIS): TributoDFeImpostoSeletivoEtd;
    class function GetIbsCbs(const ContextoId: string; Input: TIBSCBS): TributoDFeIbsCbsEtd;
  public
    class function Get(Origem: TributoDFeOrigemEnum; Imposto: TImposto): TributoDFeContextEtd;
  end;

{ TributoDFeToACBrService }

class function TributoDFeToACBrService.Get(Contexto: TributoDFeContextEtd): TIBSCBS;
var
  _ibscbs: TributoDFeIbsCbsEtd;
begin
  if (Contexto = nil) or (Contexto.IbsCbs = nil) then
  begin
    Result := nil;
    Exit;
  end;

  _ibscbs := Contexto.IbsCbs;

  Result := TIBSCBS.Create();

  with Result do
  begin
    CST := StrToCSTIBSCBS( _ibscbs.Cst );
    cClassTrib := _ibscbs.CClasstrib;
    indDoacao := StrToTIndicadorEx( IfThen( _ibscbs.Inddoacao, '1', '0' ));

    if _ibscbs.GIbsCbs <> nil then
    begin

      {$REGION 'gIBSCBS'}

      with gIBSCBS do
      begin
        vBC := _ibscbs.GIbsCbs.VBc;

        {$REGION 'gIBSUF'}

        with gIBSUF do
        begin
          pIBSUF := _ibscbs.GIbsCbs.PIbsUf;

          if not _ibscbs.GIbsCbs.IbsUfPdif.IsNull then
          begin
            gDif.pDif := _ibscbs.GIbsCbs.IbsUfPdif.Value;
            gDif.vDif := _ibscbs.GIbsCbs.IbsUfVdif.Value;
          end;

          if not _ibscbs.GIbsCbs.IbsUfVDevTrib.IsNull then
            gDevTrib.vDevTrib := _ibscbs.GIbsCbs.IbsUfVDevTrib.Value;

          if not _ibscbs.GIbsCbs.IbsUfPredAliq.IsNull then
          begin
            gRed.pRedAliq := _ibscbs.GIbsCbs.IbsUfPredAliq.Value;
            gRed.pAliqEfet := _ibscbs.GIbsCbs.IbsUfAliqEfet.Value;
          end;

          vIBSUF := _ibscbs.GIbsCbs.VIbsUf;
        end;

        {$ENDREGION}

        {$REGION 'gIBSMun'}

        with gIBSMun do
        begin
          pIBSMun := _ibscbs.GIbsCbs.pIBSMun;

          if not _ibscbs.GIbsCbs.IbsMunPdif.IsNull then
          begin
            gDif.pDif := _ibscbs.GIbsCbs.IbsMunPdif.Value;
            gDif.vDif := _ibscbs.GIbsCbs.IbsMunVdif.Value;
          end;

          if not _ibscbs.GIbsCbs.IbsMunVDevTrib.IsNull then
            gDevTrib.vDevTrib := _ibscbs.GIbsCbs.IbsMunVDevTrib.Value;

          if not _ibscbs.GIbsCbs.IbsMunPredAliq.IsNull then
          begin
            gRed.pRedAliq := _ibscbs.GIbsCbs.IbsMunPredAliq.Value;
            gRed.pAliqEfet := _ibscbs.GIbsCbs.IbsMunAliqEfet.Value;
          end;

          vIBSMun := _ibscbs.GIbsCbs.VIbsmun;
        end;

        {$ENDREGION}

        vIBS := _ibscbs.GIbsCbs.VIbs;

        {$REGION 'gCBS'}

        with gCBS do
        begin
          pCBS := _ibscbs.GIbsCbs.pCBS;

          if not _ibscbs.GIbsCbs.CbsPdif.IsNull then
          begin
            gDif.pDif := _ibscbs.GIbsCbs.CbsPdif.Value;
            gDif.vDif := _ibscbs.GIbsCbs.CbsVdif.Value;
          end;

          if not _ibscbs.GIbsCbs.CbsVDevTrib.IsNull then
            gDevTrib.vDevTrib := _ibscbs.GIbsCbs.CbsVDevTrib.Value;

          if not _ibscbs.GIbsCbs.CbsPredAliq.IsNull then
          begin
            gRed.pRedAliq := _ibscbs.GIbsCbs.CbsPredAliq.Value;
            gRed.pAliqEfet := _ibscbs.GIbsCbs.CbsAliqEfet.Value;
          end;

          vCBS := _ibscbs.GIbsCbs.vCBS;
        end;

        {$ENDREGION}

        {$REGION 'gTribRegular'}

        if _ibscbs.GIbsCbs.TribRegular <> nil then
          with gTribRegular do
          begin
            CSTReg := StrToCSTIBSCBS(_ibscbs.GIbsCbs.TribRegular.Cstreg);
            cClassTribReg := _ibscbs.GIbsCbs.TribRegular.CClasstribreg;
            pAliqEfetRegIBSUF := _ibscbs.GIbsCbs.TribRegular.Paliqefetregibsuf;
            vTribRegIBSUF := _ibscbs.GIbsCbs.TribRegular.Vtribregibsuf;
            pAliqEfetRegIBSMun := _ibscbs.GIbsCbs.TribRegular.Paliqefetregibsmun;
            vTribRegIBSMun := _ibscbs.GIbsCbs.TribRegular.Vtribregibsmun;
            pAliqEfetRegCBS := _ibscbs.GIbsCbs.TribRegular.Paliqefetregcbs;
            vTribRegCBS := _ibscbs.GIbsCbs.TribRegular.Vtribregcbs;
          end;

        {$ENDREGION}

        {$REGION 'gTribCompraGov'}

        if _ibscbs.GIbsCbs.CompraGov <> nil then
          with gTribCompraGov do
          begin
            pAliqIBSUF := _ibscbs.GIbsCbs.CompraGov.Paliqibsuf;
            vTribIBSUF := _ibscbs.GIbsCbs.CompraGov.Vtribibsuf;
            pAliqIBSMun := _ibscbs.GIbsCbs.CompraGov.Paliqibsmun;
            vTribIBSMun := _ibscbs.GIbsCbs.CompraGov.Vtribibsmun;
            pAliqCBS := _ibscbs.GIbsCbs.CompraGov.Paliqcbs;
            vTribCBS := _ibscbs.GIbsCbs.CompraGov.Vtribcbs;
          end;

        {$ENDREGION}

      end;

      {$ENDREGION}

    end

    else if _ibscbs.Monofasia <> nil then
    begin

      {$REGION 'gIBSCBSMono'}

      with gIBSCBSMono do
      begin

        {$REGION 'gMonoPadrao'}
        {
        if not _ibscbs.Monofasia.Qbcmono.IsNull then
          with gMonoPadrao do
          begin
            qBCMono := _ibscbs.Monofasia.Qbcmono.Value;
            adRemIBS := _ibscbs.Monofasia.adRemIBS.Value;
            adRemCBS := _ibscbs.Monofasia.adRemCBS.Value;
            vIBSMono := _ibscbs.Monofasia.vIBSMono.Value;
            vCBSMono := _ibscbs.Monofasia.vCBSMono.Value;
          end;
        }
        {$ENDREGION}

        {$REGION 'gMonoReten'}
        {
        if not _ibscbs.Monofasia.Qbcmonoreten.IsNull then
          with gMonoReten do
          begin
            qBCMonoReten := _ibscbs.Monofasia.Qbcmonoreten.Value;
            adRemIBSReten := _ibscbs.Monofasia.Adremibsreten.Value;
            adRemCBSReten := _ibscbs.Monofasia.Adremcbsreten.Value;
            vIBSMonoReten := _ibscbs.Monofasia.Vibsmonoreten.Value;
            vCBSMonoReten := _ibscbs.Monofasia.Vcbsmonoreten.Value;
          end;
        }
        {$ENDREGION}

        {$REGION 'gMonoRet'}
        {
        if not _ibscbs.Monofasia.Qbcmonoret.IsNull then
          with gMonoRet do
          begin
            qBCMonoRet := _ibscbs.Monofasia.Qbcmonoret.Value;
            adRemIBSRet := _ibscbs.Monofasia.Adremibsret.Value;
            adRemCBSRet := _ibscbs.Monofasia.Adremcbsret.Value;
            vIBSMonoRet := _ibscbs.Monofasia.Vibsmonoret.Value;
            vCBSMonoRet := _ibscbs.Monofasia.Vcbsmonoret.Value;
          end;
        }
        {$ENDREGION}

        {$REGION 'gMonoRet'}
        {
        if not _ibscbs.Monofasia.Pdifibs.IsNull then
          with gMonoDif do
          begin
            pDifIBS := _ibscbs.Monofasia.Pdifibs.Value;
            vIBSMonoDif := _ibscbs.Monofasia.vIBSMonoDif.Value;
            pDifCBS := _ibscbs.Monofasia.pDifCBS.Value;
            vCBSMonoDif := _ibscbs.Monofasia.vCBSMonoDif.Value;
          end;
        }
        {$ENDREGION}

        {$REGION 'gIBSMonoAdRem'}

        with gIBSMonoAdRem do
        begin
          if not _ibscbs.Monofasia.Qbcmono.IsNull then
            with gMonoPadrao do
            begin
              qBCMono := _ibscbs.Monofasia.Qbcmono.Value;
              adRemIBS := _ibscbs.Monofasia.adRemIBS.Value;
              vIBSMono := _ibscbs.Monofasia.vIBSMono.Value;
            end;

          if not _ibscbs.Monofasia.Qbcmonoreten.IsNull then
            with gMonoReten do
            begin
              qBCMonoReten := _ibscbs.Monofasia.Qbcmonoreten.Value;
              adRemIBSReten := _ibscbs.Monofasia.Adremibsreten.Value;
              vIBSMonoReten := _ibscbs.Monofasia.Vibsmonoreten.Value;
            end;

          // Cuidado, mesmo campo AdRem e AdValorem
          // if not _ibscbs.Monofasia.?.IsNull then
            with gMonoRet do
            begin
              // vIBSMonoRet := _ibscbs.Monofasia.?.Value;
            end;

          //if not _ibscbs.Monofasia.qBCBioComb.IsNull then
            with gpBioDiferenca do
            begin
              { Falta novos campos
              qBCBioComb := _ibscbs.Monofasia.qBCBioComb.Value;;
              vIBSDiferenca := _ibscbs.Monofasia.qBCBioComb.Value;
              }
            end;
        end;

        {$ENDREGION}

        {$REGION 'gIBSMonoAdValorem'}

        with gIBSMonoAdValorem do
        begin
          //if not _ibscbs.Monofasia.vBCMono.IsNull then
            with gMonoPadrao do
            begin
              { Falta definição na calculadora, aqui AdValorem, cuidado que AdRem tem campos com mesmos nomes
              vBCMono := ;
              pAliqMonoUF := ;
              pAliqMonoMun := ;
              IBSMonoUF := ;
              vIBSMonoMun := ;
              vIBSMono := ;
              }
            end;

          if not _ibscbs.Monofasia.vIBSMonoReten.IsNull then
            with gMonoReten do
            begin
              // vBCMonoReten := _ibscbs.Monofasia.vBCMonoReten.Value;
              // pAliqMonoReten := _ibscbs.Monofasia.pAliqMonoReten.Value;
              vIBSMonoReten := _ibscbs.Monofasia.Vibsmonoreten.Value;
            end;

          // Cuidado, mesmo campo AdRem e AdValorem
          // if not _ibscbs.Monofasia.?.IsNull then
            with gMonoRet do
            begin
              // vIBSMonoRet := _ibscbs.Monofasia.?.Value;
            end;

          //if not _ibscbs.Monofasia.qBCBioComb.IsNull then
            with gpBioDiferenca do
            begin
              { Falta novos campos
              qBCBioComb := _ibscbs.Monofasia.qBCBioComb.Value;;
              vIBSDiferenca := _ibscbs.Monofasia.qBCBioComb.Value;
              }
            end;
        end;

        {$ENDREGION}

        {$REGION 'gCBSMonoAdRem'}

        with gCBSMonoAdRem do
        begin
          if not _ibscbs.Monofasia.Qbcmono.IsNull then
            with gMonoPadrao do
            begin
              qBCMono := _ibscbs.Monofasia.Qbcmono.Value;
              adRemCBS := _ibscbs.Monofasia.Adremcbs.Value;
              vCBSMono := _ibscbs.Monofasia.Vcbsmono.Value;
            end;

          if not _ibscbs.Monofasia.Qbcmonoreten.IsNull then
            with gMonoReten do
            begin
              qBCMonoReten := _ibscbs.Monofasia.Qbcmonoreten.Value;
              adRemCBSReten := _ibscbs.Monofasia.Adremcbsreten.Value;
              vCBSMonoReten := _ibscbs.Monofasia.Vcbsmonoreten.Value;
            end;

          // Cuidado, mesmo campo AdRem e AdValorem
          // if not _ibscbs.Monofasia.?.IsNull then
            with gMonoRet do
            begin
              // vIBSMonoRet := _ibscbs.Monofasia.?.Value;
            end;

          //if not _ibscbs.Monofasia.qBCBioComb.IsNull then
            with gpBioDiferenca do
            begin
              { Falta novos campos
              qBCBioComb := _ibscbs.Monofasia.qBCBioComb.Value;;
              vIBSDiferenca := _ibscbs.Monofasia.qBCBioComb.Value;
              }
            end;
        end;

        {$ENDREGION}

        {$REGION 'gCBSMonoAdValorem'}

        with gCBSMonoAdValorem do
        begin

        end;

        {$ENDREGION}

        vTotIBSMonoItem := _ibscbs.Monofasia.Vtotibsmonoitem;
        vTotCBSMonoItem := _ibscbs.Monofasia.Vtotcbsmonoitem;
      end;


      {$ENDREGION}

    end

    else if _ibscbs.TransfCred <> nil then
    begin

      {$REGION 'gTransfCred'}

      with gTransfCred do
      begin

        vIBS := _ibscbs.TransfCred.Vibs;
        vCBS := _ibscbs.TransfCred.Vcbs;

      end;

      {$ENDREGION}

    end

    else if _ibscbs.AjusteCompet <> nil then
    begin

      {$REGION 'gAjusteCompet'}

      with gAjusteCompet do
      begin
        competApur := EncodeDate(
          StrToInt(_ibscbs.AjusteCompet.Competapur.Substring(0, 4)),
          StrToInt(_ibscbs.AjusteCompet.Competapur.Substring(5, 2)),
          1
        );
        vIBS := _ibscbs.AjusteCompet.Vibs;
        vCBS := _ibscbs.AjusteCompet.Vcbs;
      end;

      {$ENDREGION}

    end;

    if not _ibscbs.VIbsEstCred.IsNull or not _ibscbs.VIbsEstCred.IsNull then
    begin

      {$REGION 'gEstornoCred'}

      with gEstornoCred do
      begin
        vIBSEstCred := _ibscbs.VIbsEstCred.Value;
        vCBSEstCred := _ibscbs.VCbsEstCred.Value;
      end;

      {$ENDREGION}

    end;

    if _ibscbs.CredPresOp <> nil then
    begin

      {$REGION 'gCredPresOper'}

      with gCredPresOper do
      begin
        vBCCredPres := _ibscbs.CredPresOp.Vbccredpres;
        cCredPres := StrTocCredPres( _ibscbs.CredPresOp.Ccredpres );

        if not _ibscbs.CredPresOp.IbsPcredpres.IsNull then
          with gIBSCredPres do
          begin
            pCredPres := _ibscbs.CredPresOp.IbsPcredpres.Value;
            vCredPres := _ibscbs.CredPresOp.IbsVcredpres.Value;
            vCredPresCondSus := _ibscbs.CredPresOp.IbsVcredprescondsus.Value;
          end;

        if not _ibscbs.CredPresOp.CbsPcredpres.IsNull then
          with gCBSCredPres do
          begin
            pCredPres := _ibscbs.CredPresOp.CbsPcredpres.Value;
            vCredPres := _ibscbs.CredPresOp.CbsVcredpres.Value;
            vCredPresCondSus := _ibscbs.CredPresOp.CbsVcredprescondsus.Value;
          end;
      end;

      {$ENDREGION}

    end

    else if _ibscbs.CredPresZFM <> nil then
    begin

      {$REGION 'gCredPresIBSZFM'}

      with gCredPresIBSZFM do
      begin
        competApur := EncodeDate(
          StrToInt(_ibscbs.CredPresZFM.Competapur.Substring(0, 4)),
          StrToInt(_ibscbs.CredPresZFM.Competapur.Substring(5, 2)),
          1
        );

        tpCredPresIBSZFM := StrToTpCredPresIBSZFM( _ibscbs.CredPresZFM.Tpcredpresibszfm.ToString() );

        vCredPresIBSZFM := _ibscbs.CredPresZFM.Vcredpresibszfm;
      end;

      {$ENDREGION}

    end;
  end;
end;

{ ACBrDFeToTributoDFe }

class function ACBrDFeToTributoDFe.Get(Origem: TributoDFeOrigemEnum; Imposto: TImposto): TributoDFeContextEtd;
var
  contextoId: string;
begin
  Result := nil;

  if (Imposto = nil)
    or ((Imposto.IBSCBS.CST = cstNenhum) and (Imposto.ISel.cClassTribIS.Trim() = ''))
  then
    Exit;

  contextoId := GuidService.New();

  Result := TributoDFeContextEtd.Create(
    contextoId,
    Origem,
    ACBrDFeToTributoDFe.GetImpSel( contextoId, Imposto.ISel ),
    ACBrDFeToTributoDFe.GetIbsCbs( contextoId, Imposto.IBSCBS )
  );
end;

class function ACBrDFeToTributoDFe.GetAjusteCompet(const ContextoId: string;
  Input: TgAjusteCompet): TributoDFeAjusteCompetIbsCbsEtd;
begin
  Result := TributoDFeAjusteCompetIbsCbsEtd.Create(
    ContextoId,
    FormatDateTime('yyyy-MM', Input.competApur),
    Input.vIBS,
    Input.vCBS
  );
end;

class function ACBrDFeToTributoDFe.GetCredPresOper(const ContextoId: string;
  Input: TgCredPresOper): TributoDFeCredPresOpIbsCbsEtd;
begin
  if Input.cCredPres = cpNenhum then
    Result := nil

  else
    Result := TributoDFeCredPresOpIbsCbsEtd.Create(
      ContextoId,
      Input.vBCCredPres,
      cCredPresToStr( Input.cCredPres ),
      DoubleNullable.Create( Input.gIBSCredPres.pCredPres, Input.gIBSCredPres.pCredPres = 0 ),
      DoubleNullable.Create( Input.gIBSCredPres.vCredPres, Input.gIBSCredPres.pCredPres = 0 ),
      DoubleNullable.Create( Input.gIBSCredPres.vCredPresCondSus, Input.gIBSCredPres.vCredPresCondSus = 0 ),
      DoubleNullable.Create( Input.gCBSCredPres.pCredPres, Input.gCBSCredPres.pCredPres = 0 ),
      DoubleNullable.Create( Input.gCBSCredPres.vCredPres, Input.gCBSCredPres.pCredPres = 0 ),
      DoubleNullable.Create( Input.gCBSCredPres.vCredPresCondSus, Input.gCBSCredPres.vCredPresCondSus = 0 )
    );
end;

class function ACBrDFeToTributoDFe.GetCredPresZFM(const ContextoId: string;
  Input: TCredPresIBSZFM): TributoDFeCredPresZfmIbsCbsEtd;
begin
  Result := TributoDFeCredPresZfmIbsCbsEtd.Create(
    ContextoId,
    FormatDateTime('yyyy-MM', Input.competApur),
    StrToIntDef(TpCredPresIBSZFMToStr(Input.tpCredPresIBSZFM), -1),
    Input.vCredPresIBSZFM
  );
end;

class function ACBrDFeToTributoDFe.GetGIbsCbs(const ContextoId: string; Input: TgIBSCBS): TributoDFeGrupoIbsCbsEtd;
begin
  Result := TributoDFeGrupoIbsCbsEtd.Create(
    ContextoId,
    Input.vBC,
    Input.gIBSUF.pIBSUF,
    DoubleNullable.Create( Input.gIBSUF.gDif.pDif, Input.gIBSUF.gDif.pDif = 0 ),
    DoubleNullable.Create( Input.gIBSUF.gDif.vDif, Input.gIBSUF.gDif.pDif = 0 ),
    DoubleNullable.Create( Input.gIBSUF.gDevTrib.vDevTrib, Input.gIBSUF.gDevTrib.vDevTrib = 0 ),
    DoubleNullable.Create( Input.gIBSUF.gRed.pRedAliq , Input.gIBSUF.gRed.pRedAliq = 0 ),
    DoubleNullable.Create( Input.gIBSUF.gRed.pAliqEfet, Input.gIBSUF.gRed.pRedAliq = 0 ),
    Input.gIBSUF.vIBSUF,
    Input.gIBSMun.pIBSMun,
    DoubleNullable.Create( Input.gIBSMun.gDif.pDif, Input.gIBSMun.gDif.pDif = 0 ),
    DoubleNullable.Create( Input.gIBSMun.gDif.vDif, Input.gIBSMun.gDif.pDif = 0 ),
    DoubleNullable.Create( Input.gIBSMun.gDevTrib.vDevTrib, Input.gIBSMun.gDevTrib.vDevTrib = 0 ),
    DoubleNullable.Create( Input.gIBSMun.gRed.pRedAliq , Input.gIBSMun.gRed.pRedAliq = 0 ),
    DoubleNullable.Create( Input.gIBSMun.gRed.pAliqEfet, Input.gIBSMun.gRed.pRedAliq = 0 ),
    Input.gIBSMun.vIBSMun,
    Input.vIBS,
    Input.gCBS.pCBS,
    DoubleNullable.Create( Input.gCBS.gDif.pDif, Input.gCBS.gDif.pDif = 0 ),
    DoubleNullable.Create( Input.gCBS.gDif.vDif, Input.gCBS.gDif.pDif = 0 ),
    DoubleNullable.Create( Input.gCBS.gDevTrib.vDevTrib, Input.gCBS.gDevTrib.vDevTrib = 0 ),
    DoubleNullable.Create( Input.gCBS.gRed.pRedAliq , Input.gCBS.gRed.pRedAliq = 0 ),
    DoubleNullable.Create( Input.gCBS.gRed.pAliqEfet, Input.gCBS.gRed.pRedAliq = 0 ),
    Input.gCBS.vCBS,
    ACBrDFeToTributoDFe.GetGIbsCbsTribReg( ContextoId, Input.gTribRegular ),
    ACBrDFeToTributoDFe.GetGIbsCbsCompraGov( ContextoId, Input.gTribCompraGov )
  );
end;

class function ACBrDFeToTributoDFe.GetGIbsCbsCompraGov(const ContextoId: string;
  Input: TgTribCompraGov): TributoDFeIbsCbsCompraGovEtd;
begin
  if (Input.pAliqIBSUF = 0)
    and (Input.vTribIBSUF = 0)
    and (Input.pAliqIBSMun = 0)
    and (Input.vTribIBSMun = 0)
    and (Input.pAliqCBS = 0)
    and (Input.vTribCBS = 0)
  then
    Result := nil

  else
    Result := TributoDFeIbsCbsCompraGovEtd.Create(
      ContextoId,
      Input.pAliqIBSUF,
      Input.vTribIBSUF,
      Input.pAliqIBSMun,
      Input.vTribIBSMun,
      Input.pAliqCBS,
      Input.vTribCBS
    );
end;

class function ACBrDFeToTributoDFe.GetGIbsCbsTribReg(const ContextoId: string;
  Input: TgTribRegular): TributoDFeIbsCbsTribRegEtd;
begin
  if Input.CSTReg = cstNenhum then
    Result := nil

  else
    Result := TributoDFeIbsCbsTribRegEtd.Create(
      ContextoId,
      CSTIBSCBSToStr( Input.CSTReg ),
      Input.cClassTribReg,
      Input.pAliqEfetRegIBSUF,
      Input.vTribRegIBSUF,
      Input.pAliqEfetRegIBSMun,
      Input.vTribRegIBSMun,
      Input.pAliqEfetRegCBS,
      Input.vTribRegCBS
    );
end;

class function ACBrDFeToTributoDFe.GetIbsCbs(const ContextoId: string; Input: TIBSCBS): TributoDFeIbsCbsEtd;
var
  gEstCredSetNull: Boolean;
  gIbsCbs: TributoDFeGrupoIbsCbsEtd;
  gMono: TributoDFeMonofasiaIbsCbsEtd;
  gTransfCred: TributoDFeTransfCredIbsCbsEtd;
  gAjusteCompet: TributoDFeAjusteCompetIbsCbsEtd;
  gCredPresZFM: TributoDFeCredPresZfmIbsCbsEtd;
begin
  if Input.CST = cstNenhum then
  begin
    Result := nil;
    Exit;
  end;

  gEstCredSetNull := (Input.gEstornoCred.vIBSEstCred = 0) and (Input.gEstornoCred.vCBSEstCred = 0 );

  gIbsCbs := nil;
  gMono := nil;
  gTransfCred := nil;
  gAjusteCompet := nil;
  gCredPresZFM := nil;

  case Input.CST of
    cst000, cst200, cst220, cst222,
    cst510, cst515, cst550,
    cst830:
      gIbsCbs := ACBrDFeToTributoDFe.GetGIbsCbs( ContextoId, Input.gIBSCBS );

    cst620:
      gMono := ACBrDFeToTributoDFe.GetMonofasia( ContextoId, Input.gIBSCBSMono );

    cst800:
      gTransfCred := ACBrDFeToTributoDFe.GetTransfCred( ContextoId, Input.gTransfCred );

    cst810:
      gCredPresZFM := ACBrDFeToTributoDFe.GetCredPresZFM( ContextoId, Input.gCredPresIBSZFM );

    cst811:
      gAjusteCompet := ACBrDFeToTributoDFe.GetAjusteCompet( ContextoId, Input.gAjusteCompet );
  end;

  Result := TributoDFeIbsCbsEtd.Create(
    ContextoId,
    StringNullable.NullInstance(),
    TipoRegraTributoDFeEnum.tctNenhuma,
    CSTIBSCBSToStr(Input.CST),
    Input.cClassTrib,
    Input.indDoacao = TIndicadorEx.tieSim,
    DoubleNullable.Create(Input.gEstornoCred.vIBSEstCred, gEstCredSetNull ),
    DoubleNullable.Create(Input.gEstornoCred.vCBSEstCred, gEstCredSetNull ),
    gIbsCbs,
    gMono,
    gTransfCred,
    gAjusteCompet,
    ACBrDFeToTributoDFe.GetCredPresOper( ContextoId, Input.gCredPresOper ),
    gCredPresZFM
  );
end;

class function ACBrDFeToTributoDFe.GetImpSel(const ContextoId: string; Input: TgIS): TributoDFeImpostoSeletivoEtd;
var
  bBCandPISSetNull: Boolean;
  bTribSetNull: Boolean;
begin
  if Input.CSTIS = '' then
    Result := nil

  else
  begin
    bBCandPISSetNull := (Input.vBCIS = 0) and (Input.pIS = 0);
    bTribSetNull := bBCandPISSetNull or ((Input.uTrib.Trim() = '') and (Input.qTrib = 0));

    Result := TributoDFeImpostoSeletivoEtd.Create(
      ContextoId,
      Input.CSTIS,
      Input.cClassTribIS,
      DoubleNullable.Create( Input.vBCIS, bBCandPISSetNull ),
      DoubleNullable.Create( Input.pIS, bBCandPISSetNull ),
      DoubleNullable.Create( Input.adRemIS, bBCandPISSetNull or (Input.adRemIS = 0) ),
      Input.uTrib.Trim(),
      DoubleNullable.Create( Input.qTrib, bTribSetNull ),
      DoubleNullable.Create( Input.vIS, bBCandPISSetNull )
    );
  end;
end;

class function ACBrDFeToTributoDFe.GetMonofasia(const ContextoId: string;
  Input: TgIBSCBSMono): TributoDFeMonofasiaIbsCbsEtd;
var
  bIbsPadraoSetNull, bCbsPadraoSetNull: Boolean;
  bIbsRetenSetNull, bCbsRetenSetNull: Boolean;
  bIbsRetSetNull, bCbsRetSetNull: Boolean;
  bDifSetNull: Boolean;
begin
  bIbsPadraoSetNull := (Input.gIBSMonoAdRem.gMonoPadrao.qBCMono = 0)
    and (Input.gIBSMonoAdRem.gMonoPadrao.adRemIBS = 0)
    and (Input.gIBSMonoAdRem.gMonoPadrao.vIBSMono = 0);
  bCbsPadraoSetNull := (Input.gCBSMonoAdRem.gMonoPadrao.qBCMono = 0)
    and (Input.gCBSMonoAdRem.gMonoPadrao.adRemCBS = 0)
    and (Input.gCBSMonoAdRem.gMonoPadrao.vCBSMono = 0);

  bIbsPadraoSetNull := (Input.gIBSMonoAdRem.gMonoReten.qBCMonoReten = 0)
    and (Input.gIBSMonoAdRem.gMonoReten.adRemIBSReten = 0)
    and (Input.gIBSMonoAdRem.gMonoReten.vIBSMonoReten = 0);
  bCbsRetenSetNull := (Input.gCBSMonoAdRem.gMonoReten.qBCMonoReten = 0)
    and (Input.gCBSMonoAdRem.gMonoReten.adRemCBSReten = 0)
    and (Input.gCBSMonoAdRem.gMonoReten.vCBSMonoReten = 0);

  bIbsRetenSetNull := (Input.gIBSMonoAdRem.gMonoRet.vIBSMonoRet = 0);
  bCbsRetenSetNull := (Input.gCBSMonoAdRem.gMonoRet.vCBSMonoRet = 0);

//  bRetenSetNull := (Input.gMonoDif.pDifIBS = 0)
//    and (Input.gMonoDif.vIBSMonoDif = 0)
//    and (Input.gMonoDif.pDifCBS = 0)
//    and (Input.gMonoDif.vCBSMonoDif = 0);

  Result := TributoDFeMonofasiaIbsCbsEtd.Create(
    ContextoId,
    DoubleNullable.Create( Input.gIBSMonoAdRem.gMonoPadrao.qBCMono, bIbsPadraoSetNull ),
    DoubleNullable.Create( Input.gIBSMonoAdRem.gMonoPadrao.adRemIBS, bIbsPadraoSetNull ),
    DoubleNullable.Create( Input.gIBSMonoAdRem.gMonoPadrao.vIBSMono, bIbsPadraoSetNull ),
    DoubleNullable.Create( Input.gCBSMonoAdRem.gMonoPadrao.adRemCBS, bCbsPadraoSetNull ),
    DoubleNullable.Create( Input.gCBSMonoAdRem.gMonoPadrao.vCBSMono, bCbsPadraoSetNull ),
    DoubleNullable.Create( Input.gIBSMonoAdRem.gMonoReten.qBCMonoReten, bIbsPadraoSetNull ),
    DoubleNullable.Create( Input.gIBSMonoAdRem.gMonoReten.adRemIBSReten, bIbsPadraoSetNull ),
    DoubleNullable.Create( Input.gIBSMonoAdRem.gMonoReten.vIBSMonoReten, bIbsPadraoSetNull ),
    DoubleNullable.Create( Input.gCBSMonoAdRem.gMonoReten.adRemCBSReten, bCbsPadraoSetNull ),
    DoubleNullable.Create( Input.gCBSMonoAdRem.gMonoReten.vCBSMonoReten, bCbsPadraoSetNull ),
    DoubleNullable.NullInstance(), // Create( Input.gIBSMonoAdRem.gMonoRet.qBCMonoRet, bRetSetNull ),
    DoubleNullable.NullInstance(), // Create( Input.gIBSMonoAdRem.gMonoRet.adRemIBSRet, bRetSetNull ),
    DoubleNullable.Create( Input.gIBSMonoAdRem.gMonoRet.vIBSMonoRet, bIbsRetenSetNull ),
    DoubleNullable.NullInstance(), // Create( Input.gCBSMonoAdRem.gMonoRet.adRemCBSRet, bRetSetNull ),
    DoubleNullable.Create( Input.gCBSMonoAdRem.gMonoRet.vCBSMonoRet, bCbsRetenSetNull ),
    DoubleNullable.NullInstance(), // Create( Input.gIBSMonoAdRem.gMonoDif.pDifIBS, bDifSetNull ),
    DoubleNullable.NullInstance(), // Create( Input.gIBSMonoAdRem.gMonoDif.vIBSMonoDif, bDifSetNull ),
    DoubleNullable.NullInstance(), // Create( Input.gIBSMonoAdRem.gMonoDif.pDifCBS, bDifSetNull ),
    DoubleNullable.NullInstance(), // Create( Input.gIBSMonoAdRem.gMonoDif.vCBSMonoDif, bDifSetNull ),
    Input.vTotIBSMonoItem,
    Input.vTotCBSMonoItem
  );
end;

class function ACBrDFeToTributoDFe.GetTransfCred(const ContextoId: string;
  Input: TgTransfCred): TributoDFeTransfCredIbsCbsEtd;
begin
  Result := TributoDFeTransfCredIbsCbsEtd.Create(
    ContextoId,
    Input.vIBS,
    Input.vCBS
  );
end;

{ TributosDFeFactory }

class function TributosDFeFactory.GetIBSCBS(Contexto: TributoDFeContextEtd): TIBSCBS;
begin
  Result := TributoDFeToACBrService.Get( Contexto );
end;

class function TributosDFeFactory.GetTributoDFe(Origem: TributoDFeOrigemEnum; Imposto: TImposto): TributoDFeContextEtd;
begin
  Result := ACBrDFeToTributoDFe.Get( Origem, Imposto );
end;

end.

