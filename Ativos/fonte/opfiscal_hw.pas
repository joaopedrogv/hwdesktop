unit opfiscal_hw;

interface

uses
  uClasseConexao,
  Contnrs,
  opfiscal_model,
  opfiscal_confs,
  //nf_model,
  //nfitem_model,
  DB,
{$IFDEF VER180}
  IBDatabase
{$ELSE}
  IBX.IBDatabase
{$ENDIF}
    ;

type
  OpFiscalMotor = class
  strict private
    class function ItemFiscalCheck(item: TItemFiscal): TItemFiscal;
    class function OperacaoComICMSUfDest(
      item  : TItemFiscal;
      trib  : TItemTributo_ICMS;
      confNf: TConfigGlobalNotaFiscal): Boolean;
    class function GetCsosnPorCst(
      cst   : string;
      item  : TItemFiscal;
      trib  : TItemTributo_ICMS;
      confNf: TConfigGlobalNotaFiscal): string;
  public
    class function CalcularICMS(
      item  : TItemFiscal;
      trib  : TItemTributo_ICMS;
      confNf: TConfigGlobalNotaFiscal): TIcmsTributavel;
    class function CalcularICMSUfDest(
      item    : TItemFiscal;
      trib    : TItemTributo_ICMS;
      confNf  : TConfigGlobalNotaFiscal;
      calcIcms: TIcmsTributavel): TIcmsUfDestTributavel;
    class function CalcularPISCOFINS(
      item  : TItemFiscal;
      trib  : TItemTributo_PC;
      confNf: TConfigGlobalNotaFiscal): TPisCofinsTributavel;
    class function CalcularRetencaoTributos(
      item  : TItemFiscal;
      trib  : TItemTributo_Ret;
      confNf: TConfigGlobalNotaFiscal): TRetencaoTributavel;
    class function CalcularIPI(
      item  : TItemFiscal;
      trib  : TItemTributo_IPI;
      confNf: TConfigGlobalNotaFiscal): TIpiTributavel;
    class function CalcularISSQN(
      item  : TItemFiscal;
      trib  : TItemTributo_ISSQN;
      confNf: TConfigGlobalNotaFiscal): TISSQNTributavel;
    class function CalcularAdicionalDesoneracaoTotal(
      item  : TItemFiscal;
      trib  : TItemTributos;
      confNf: TConfigGlobalNotaFiscal): Double;
  end;

  TCadItensTributos = class(TItemTributosList)
  public
    function CopyFrom(dataSet: TDataSet): Integer;
    function GetOperacao(ncm, tipo_item, cst_icms, cst_piscofins: string): TItemTributos; overload;
    function GetOperacao(item: TCondicaoFiscal): TItemTributos; overload;
  end;

  OpFiscal = class
  strict private
    class function Sql(
      item      : TCondicaoFiscal;
      codempresa: Integer): string;
  public
    class function GetOperacao(
      item      : TCondicaoFiscal;
      codempresa: Integer;
      con       : TConexao): TItemTributos;
    class function GetOperacoes(
      id        : string;
      item      : TCondicaoFiscal;
      codempresa: Integer;
      con       : TConexao): TCadItensTributos;
    class function CstIcmsToTributacao(
      cst          : string;
      picm, picmsst: Double): TTributacao;
    {
    class function GetItemFiscal(
      nota  : Tnf_Model;
      nfItem: Tnfitem_Model): TItemFiscal;
    }
  end;

implementation

uses
  Classes,
  SysUtils,
  StrUtils,
  Math,
  hw_utils,
  hw_strings,
  basefb_class;

{ OpFiscalMotor }

class function OpFiscalMotor.CalcularAdicionalDesoneracaoTotal(
  item: TItemFiscal;
  trib: TItemTributos;
  confNf: TConfigGlobalNotaFiscal): Double;
var
  base: Double;
  calcIcm: TIcmsTributavel;
  calcPC: TPisCofinsTributavel;
  perc: Double;
  adicional: Double;
begin

  calcIcm := OpFiscalMotor.CalcularICMS(item, trib.icms, confNf);
  calcPC  := OpFiscalMotor.CalcularPISCOFINS(item, trib.piscofins, confNf);

  perc := calcIcm.deson.picmsdeson - ((1 - (calcIcm.deson.predbc / 100)) * calcIcm.deson.picmsdeson);
  perc := IfThen(perc > 0, perc, calcIcm.deson.picmsdeson) + IfThen(calcPC.cst <> '03', calcPC.ppisdeson + calcPC.pcofinsdeson);

  base      := trib.icms.conf_icm.getBC(ttICMS, item, item.base);
  adicional := RoundTo(base / (1 - (perc / 100)), -2);
  Result    := IfThen(adicional > base, adicional - base);
end;

class function OpFiscalMotor.CalcularICMS(
  item  : TItemFiscal;
  trib  : TItemTributo_ICMS;
  confNf: TConfigGlobalNotaFiscal): TIcmsTributavel;
var
  base: Double;
  calc: TIcmsTributavel;
  cstTributacao: TTributacao;
begin
  item := OpFiscalMotor.ItemFiscalCheck(item);

  calc := TIcmsTributavel.Create;

  cstTributacao := trib.cst;

  //testar se é serviço aqui ou antes de chamar, talves antes?
  //talvez ja buscar o mva no cest logo no mesmo metodo

  {$REGION 'calculo ICMS'}
  base := trib.conf_icm.getBC(ttICMS, item, item.base);

  if trib.calcularIcms and (base > 0) and ((trib.aliq_icms > 0) or (item.simples and (trib.aliq_credsn > 0))) then
  begin
    if item.simples then
    begin
      calc.sn.pcredsn     := RoundTo(trib.aliq_credsn, -4);
      calc.sn.vbcsn       := base;

      if trib.calcularReducaoBC and (trib.aliq_red_bc > 0) and (trib.aliq_red_bc < 100) then
        calc.sn.vbcsn     := RoundTo(calc.sn.vbcsn * (100 - trib.aliq_red_bc) / 100, -2);

      calc.sn.vcredicmssn := RoundTo(calc.sn.vbcsn * calc.sn.pcredsn / 100 , -2);
    end;

    // Orientação da Ortec a pedido da Ang aliquota 4% idependente do indicador de inscricao estadual e de cpf/cnpj
    if (item.iddest = '2') and {(item.indiedest = '1') and} (item.orig[1] in ['1', '2', '3']) then
      calc.op.picms := 4
    else
      calc.op.picms := RoundTo(trib.aliq_icms, -4);

    calc.op.vbc     := base;

    if trib.calcularReducaoBC and (trib.aliq_red_bc > 0) and (trib.aliq_red_bc < 100) then
    begin
      calc.op.predbc := RoundTo(trib.aliq_red_bc, -4);
      if ((item.tipoCalc = tcCompleto) or
          (item.tipoCalc = tcParcial) and (item.base = 0))  then //tipo de calculo parcial e usuario nao informou a base
      calc.op.vbc    := RoundTo(calc.op.vbc * (100 - calc.op.predbc) / 100, -2);
    end;

    calc.op.vicms := RoundTo(calc.op.vbc * calc.op.picms / 100 , -2);

    if (trib.motdesicm > 0) then
    begin
      calc.deson.motdesicms := trib.motdesicm;
      if (base > calc.op.vbc) then
        calc.deson.vicmsdeson := RoundTo(base * calc.op.picms / 100, -2) - calc.op.vicms
      else
        calc.deson.vicmsdeson := RoundTo(base * calc.op.picms / 100, -2);
      calc.deson.predbc     := calc.op.predbc;
      calc.deson.picmsdeson := calc.op.picms;
    end;

    if (trib.aliq_icms_dif > 0) then
    begin
      calc.dif.vicmsop  := calc.op.vicms;
      calc.dif.pdif     := RoundTo(trib.aliq_icms_dif, -4);
      calc.dif.vicmsdif := RoundTo(calc.dif.vicmsop * trib.aliq_icms_dif / 100, -2);
      calc.op.vicms     := calc.dif.vicmsop - calc.dif.vicmsdif;
    end;
  end
  else if (trib.adRemIcms > 0) or (trib.adRemIcmsReten > 0) then
  begin
    calc.mono.qbcmono := RoundTo(IfThen(item.qtdebc > 0, item.qtdebc, item.quantidade), -4);
    calc.mono.adremicms := RoundTo(trib.adRemIcms, -4);
    calc.mono.vicmsmono := RoundTo(calc.mono.qbcmono * calc.mono.adremicms, -2);

    calc.mono.qbcmonoreten := RoundTo(IfThen(item.qtdebc > 0, item.qtdebc, item.quantidade), -4);
    calc.mono.adremicmsreten := RoundTo(trib.adremicmsreten, -4);
    calc.mono.vicmsmonoreten := RoundTo(calc.mono.qbcmonoreten * calc.mono.adremicmsreten, -2);

    // caso tenha o 53 colocar abaixo
  end
  else if trib.calcularDesoneracaoIcms and (base > 0) and (trib.aliq_icms > 0) then
  begin
    calc.deson.vbc := base;
    calc.deson.motdesicms := trib.motdesicm;
    if (item.iddest = '2') and (item.indiedest = '1') and
       (trib.conf_icm.ReadString('Desoneracao', 'ProdutosImportadosOperacaoInterestadual_Aliq_4_porcento', 'N') = 'S') then
    begin
      calc.deson.vicmsdeson := RoundTo(calc.deson.vbc * 4 / 100, -2);
      calc.deson.picmsdeson := 4;
    end
    else
    begin
      calc.deson.vicmsdeson := RoundTo(calc.deson.vbc * trib.aliq_icms / 100, -2);
      calc.deson.picmsdeson := trib.aliq_icms;
    end;

  end;
  {$ENDREGION}

  {$REGION 'calculo ICMS ST'}
  item.vicmsdeson := calc.deson.vicmsdeson;
  base := trib.conf_icm.getBC(ttICMSST, item, item.baseST);

  if (trib.calcularIcmsSt or item.ant_st) and (base > 0) and (trib.aliq_intra > 0) then
  begin
    if not item.destCalcST then
      cstTributacao := icm_00_20_51
    else
    begin

      calc.st.picmsst := RoundTo(trib.aliq_intra, -4);
      calc.st.vbcst   := RoundTo(base, -2);
      calc.st.modbcST := item.modbcST;

      if ((item.tipoCalc = tcCompleto) or
          (item.tipoCalc = tcParcial) and (item.baseST = 0)) and //tipo de calculo parcial e usuario nao informou a base
         (item.modbcST = '4') and (trib.aliq_mva > 0) then
      begin
        calc.st.pmvast := RoundTo(trib.aliq_mva, -4);
        calc.st.vbcst  := RoundTo(calc.st.vbcst + (calc.st.vbcst * calc.st.pmvast / 100), -2);
        if trib.calcularReducaoBC and (trib.aliq_red_bc > 0) and (trib.aliq_red_bc < 100) then
        begin
          calc.st.predbcst := RoundTo(trib.aliq_red_bc, -4);
          calc.st.vbcst    := RoundTo(calc.st.vbcst * (100 - calc.st.predbcst) / 100, -2);
        end;
      end;

      calc.st.vicmsstdest := RoundTo(calc.st.vbcst * calc.st.picmsst / 100, -2);
      calc.st.vicmsst     := RoundTo(calc.st.vicmsstdest - calc.op.vicms, -2);
    end;
  end;
  {$ENDREGION}

  {$REGION 'calculo FCP'}
  if trib.calcularIcms and (calc.op.vbc > 0) and (trib.aliq_fcp > 0) then
  begin
    calc.op.pfcp   := RoundTo(trib.aliq_fcp, -4);
    calc.op.vbcfcp := calc.op.vbc;
    calc.op.vfcp   := RoundTo(calc.op.vbcfcp * calc.op.pfcp / 100, -2);
  end;
  {$ENDREGION}

  {$REGION 'calculo FCP ST'}
  if trib.calcularIcms and (calc.st.vbcst > 0) and (trib.aliq_fcp > 0) then
  begin                                                                 
    calc.st.pfcpst   := RoundTo(trib.aliq_fcp, -4);
    calc.st.vbcfcpst := calc.st.vbcst;
    calc.st.vfcpst   := RoundTo(calc.st.vbcfcpst * calc.st.pfcpst / 100, -2);
  end;
  {$ENDREGION}

  Result := TIcmsTributavel.Create;

  {$REGION 'retorno por CST'}
  // (icm_00_20_51, icm_10_70, icm_30, icm_40, icm_41, icm_50, icm_60, icm_90_comICM_comST,  icm_90_comICM_semST, icm_90_semICM_comST, icm_90_semICM_semST);
  case cstTributacao of

  	{$REGION 'icm_00_20_51'}
    icm_00_20_51:
      begin
        Result.cst      := IfThen(calc.dif.vicmsdif > 0, '51', IfThen(calc.op.predbc > 0, '20', '00'));
        Result.op.modbc := calc.op.modbc;

        if calc.op.vicms > 0 then
        begin
          Result.op.vbc   := calc.op.vbc;
          Result.op.picms := calc.op.picms;
          Result.op.vicms := calc.op.vicms;
          Result.op.vbc   := calc.op.vbc;
        end;

        if not item.simples and (calc.op.vfcp > 0) then
        begin
          Result.op.pfcp   := calc.op.pfcp;
          Result.op.vbcfcp := calc.op.vbcfcp;
          Result.op.vfcp   := calc.op.vfcp;
        end;

        if (Result.cst = '20') then
        begin
          Result.op.predbc := calc.op.predbc;
          if (calc.deson.vicmsdeson > 0) then
          begin
            Result.deson.motdesicms := calc.deson.motdesicms;
            Result.deson.vicmsdeson := calc.deson.vicmsdeson;
            Result.deson.picmsdeson := calc.deson.picmsdeson;
            Result.deson.predbc     := calc.deson.predbc;
          end;
        end;

        if not item.simples and (Result.cst = '51') and (calc.dif.vicmsdif > 0) then
        begin
          Result.dif.pdif     := calc.dif.pdif;
          Result.dif.vicmsdif := calc.dif.vicmsdif;
          Result.dif.pfcpdif  := calc.dif.pfcpdif;
          Result.dif.vfcpdif  := calc.dif.vfcpdif;
          Result.dif.vicmsop  := calc.dif.vicmsop;
          Result.dif.vfcpefet := calc.dif.vfcpefet;
        end;

        if item.simples then
        begin
//          Result.csosn := confNf.Conf_ICMS.getCsosnPorCst('0' + Result.cst, trib.csosn, item.indiedest);
          Result.csosn := OpFiscalMotor.getCsosnPorCst('0' + Result.cst, item, trib, confNf);
          if Result.csosn = '101' then
          begin
            Result.sn.pcredsn     := calc.sn.pcredsn;
            Result.sn.vbcsn       := calc.sn.vbcsn;
            Result.sn.vcredicmssn := calc.sn.vcredicmssn;
          end;
        end
      end;   
    {$ENDREGION}

    {$REGION 'icm_02, icm_15'}
    icm_02, icm_15:
      begin
        Result.cst      := IfThen(trib.cst = icm_02, '02', '15');
        if calc.mono.vicmsmono > 0 then
        begin
          Result.mono.qbcmono   := calc.mono.qbcmono;
          Result.mono.adremicms := calc.mono.adremicms;
          Result.mono.vicmsmono := calc.mono.vicmsmono;
        end;

        if (Result.cst = '15') then
          if calc.mono.vicmsmonoreten > 0 then
          begin
            Result.mono.qbcmonoreten   := calc.mono.qbcmonoreten;
            Result.mono.adremicmsreten := calc.mono.adremicmsreten;
            Result.mono.vicmsmonoreten := calc.mono.vicmsmonoreten;
          end;
      end;
    {$ENDREGION}

    {$REGION 'icm_10_70'}
    icm_10_70:
      begin
        Result.cst      := IfThen(calc.st.predbcst > 0, '70', '10');
        Result.op.modbc := calc.op.modbc;

        if calc.op.vicms > 0 then
        begin
          Result.op.vbc   := calc.op.vbc;
          Result.op.picms := calc.op.picms;
          Result.op.vicms := calc.op.vicms;
          Result.op.vbc   := calc.op.vbc;
        end;

        if not item.simples and (calc.op.vfcp > 0) then
        begin
          Result.op.pfcp   := calc.op.pfcp;
          Result.op.vbcfcp := calc.op.vbcfcp;
          Result.op.vfcp   := calc.op.vfcp;
        end;

        if calc.st.vicmsst > 0 then
        begin
          Result.st.modbcST     := calc.st.modbcST;
          Result.st.pmvast      := calc.st.pmvast;
          Result.st.vbcst       := calc.st.vbcst;
          Result.st.picmsst     := calc.st.picmsst;
          Result.st.vicmsst     := calc.st.vicmsst;
          Result.st.vicmsstdest := calc.st.vicmsstdest;
          Result.st.pfcpst      := calc.st.pfcpst;
          Result.st.vbcfcpst    := calc.st.vbcfcpst;
          Result.st.vfcpst      := calc.st.vfcpst;
        end;

        if (Result.cst = '70') then
        begin
          Result.op.predbc   := calc.op.predbc;
          Result.st.predbcst := calc.st.predbcst;
          if (calc.deson.vicmsdeson > 0) then
          begin
            Result.deson.motdesicms := calc.deson.motdesicms;
            Result.deson.vicmsdeson := calc.deson.vicmsdeson;
            Result.deson.picmsdeson := calc.deson.picmsdeson;
            Result.deson.predbc     := calc.deson.predbc;
          end;
        end;
        // abaixo nao esta calculando
        if (Result.cst = '70') and (calc.deson.vicmsstdeson > 0) then
        begin
          Result.deson.motdesicmsst := calc.deson.motdesicmsst;
          Result.deson.vicmsstdeson := calc.deson.vicmsstdeson;
        end;

        if item.simples then
        begin
          //Result.csosn := confNf.Conf_ICMS.getCsosnPorCst('0' + Result.cst, trib.csosn, item.indiedest);
          Result.csosn := OpFiscalMotor.getCsosnPorCst('0' + Result.cst, item, trib, confNf);
          if Result.csosn = '201' then
          begin
            Result.sn.pcredsn     := calc.sn.pcredsn;
            Result.sn.vbcsn       := calc.sn.vbcsn;
            Result.sn.vcredicmssn := calc.sn.vcredicmssn;
          end;
        end
      end;
    {$ENDREGION}

    {$REGION 'icm_30'}
    icm_30:
      begin
        Result.cst := '30';

        if calc.st.vicmsst > 0 then
        begin
          Result.st.modbcST     := calc.st.modbcST;
          Result.st.pmvast      := calc.st.pmvast;
          Result.st.vbcst       := calc.st.vbcst;
          Result.st.picmsst     := calc.st.picmsst;
          Result.st.vicmsst     := calc.st.vicmsst;
          Result.st.vicmsstdest := calc.st.vicmsstdest;
          Result.st.predbcst    := calc.st.predbcst;

          Result.st.pfcpst   := calc.st.pfcpst;
          Result.st.vbcfcpst := calc.st.vbcfcpst;
          Result.st.vfcpst   := calc.st.vfcpst;
        end;

        if calc.deson.vicmsdeson > 0 then
        begin
          Result.deson.motdesicms := calc.deson.motdesicms;
          Result.deson.vicmsdeson := calc.deson.vicmsdeson;
          Result.deson.picmsdeson := calc.deson.picmsdeson;
          Result.deson.predbc     := calc.deson.predbc;
        end;

        if item.simples then
          //Result.csosn := confNf.Conf_ICMS.getCsosnPorCst('0' + Result.cst, trib.csosn, item.indiedest);
          Result.csosn := OpFiscalMotor.getCsosnPorCst('0' + Result.cst, item, trib, confNf);
      end; 
    {$ENDREGION}

    {$REGION 'icm_40, icm_41, icm_50'}
    icm_40,
    icm_41,
    icm_50:
      begin
        Result.cst := IfThen(trib.cst = icm_40, '40', IfThen(trib.cst = icm_41, '41', '50'));

        if calc.deson.vicmsdeson > 0 then
        begin
          Result.deson.motdesicms := calc.deson.motdesicms;
          Result.deson.vicmsdeson := calc.deson.vicmsdeson;
          Result.deson.picmsdeson := calc.deson.picmsdeson;
          Result.deson.predbc     := calc.deson.predbc;
        end;

        if item.simples then
          //Result.csosn := confNf.Conf_ICMS.getCsosnPorCst('0' + Result.cst, trib.csosn, item.indiedest);
          Result.csosn := OpFiscalMotor.getCsosnPorCst('0' + Result.cst, item, trib, confNf);
      end;
    {$ENDREGION}

    {$REGION 'icm_53, ainda nao implementado'}
    icm_53:
      begin
        Result.cst := '53';      
      end;    
    {$ENDREGION}

    {$REGION 'icm_60'}
    icm_60:
      begin
        Result.cst := '60';

        if item.ant_st then
        begin
          if calc.st.vicmsst > 0 then
          begin
            Result.st.modbcST     := calc.st.modbcST;
            Result.st.pmvast      := calc.st.pmvast;
            Result.st.vbcst       := calc.st.vbcst;
            Result.st.picmsst     := calc.st.picmsst;
            Result.st.vicmsst     := calc.st.vicmsst;
            Result.st.vicmsstdest := calc.st.vicmsstdest;
            Result.st.pfcpst      := calc.st.pfcpst;
            Result.st.vbcfcpst    := calc.st.vbcfcpst;
            Result.st.vfcpst      := calc.st.vfcpst;
          end;

          if calc.deson.vicmsdeson > 0 then
          begin
            Result.deson.motdesicms := calc.deson.motdesicms;
            Result.deson.vicmsdeson := calc.deson.vicmsdeson;
            Result.deson.picmsdeson := calc.deson.picmsdeson;
            Result.deson.predbc     := calc.deson.predbc;
          end;
        end;

        if calc.efet.vicmsefet > 0 then
        begin
          Result.efet.predbcefet := calc.efet.predbcefet;
          Result.efet.vbcefet    := calc.efet.vbcefet;
          Result.efet.picmsefet  := calc.efet.picmsefet;
          Result.efet.vicmsefet  := calc.efet.vicmsefet;
        end;

        if item.simples then
          //Result.csosn := confNf.Conf_ICMS.getCsosnPorCst('0' + Result.cst, trib.csosn, item.indiedest);
          Result.csosn := OpFiscalMotor.getCsosnPorCst('0' + Result.cst, item, trib, confNf);
      end;
    {$ENDREGION}

    {$REGION 'icm_61'}
    icm_61:
      begin
        Result.cst := '61';
      end;
    
    {$ENDREGION}

    {$REGION 'icm_90_comICM_comST, icm_90_comICM_semST, icm_90_semICM_comST, icm_90_semICM_semST'}
    icm_90_comICM_comST,
    icm_90_comICM_semST,
    icm_90_semICM_comST,
    icm_90_semICM_semST:
      begin   
        Result.cst := '90';
        if (trib.cst in [icm_90_comICM_comST, icm_90_comICM_semST]) then
        begin
          if calc.op.vicms > 0 then
          begin
            Result.op.vbc    := calc.op.vbc;
            Result.op.picms  := calc.op.picms;
            Result.op.vicms  := calc.op.vicms;
            Result.op.vbc    := calc.op.vbc;
            Result.op.predbc := calc.op.predbc;
          end;

          if not item.simples and (calc.op.vfcp > 0) then
          begin
            Result.op.pfcp   := calc.op.pfcp;
            Result.op.vbcfcp := calc.op.vbcfcp;
            Result.op.vfcp   := calc.op.vfcp;
          end;
        end;

        if (trib.cst in [icm_90_comICM_comST, icm_90_semICM_comST]) then
        begin
          if calc.st.vicmsst > 0 then
          begin
            Result.st.modbcST     := calc.st.modbcST;
            Result.st.pmvast      := calc.st.pmvast;
            Result.st.vbcst       := calc.st.vbcst;
            Result.st.picmsst     := calc.st.picmsst;
            Result.st.vicmsst     := calc.st.vicmsst;
            Result.st.vicmsstdest := calc.st.vicmsstdest;
            Result.st.predbcst    := calc.st.predbcst;
            Result.st.pfcpst      := calc.st.pfcpst;
            Result.st.vbcfcpst    := calc.st.vbcfcpst;
            Result.st.vfcpst      := calc.st.vfcpst;
          end;
        end;

        if calc.deson.vicmsdeson > 0 then
        begin
          Result.deson.motdesicms := calc.deson.motdesicms;
          Result.deson.vicmsdeson := calc.deson.vicmsdeson;
          Result.deson.picmsdeson := calc.deson.picmsdeson;
          Result.deson.predbc     := calc.deson.predbc;
        end;
        // abaixo nao esta calculando
        if calc.deson.vicmsstdeson > 0 then
        begin
          Result.deson.motdesicmsst := calc.deson.motdesicmsst;
          Result.deson.vicmsstdeson := calc.deson.vicmsstdeson;
        end;

        if item.simples then
          //Result.csosn := confNf.Conf_ICMS.getCsosnPorCst('0' + Result.cst, trib.csosn, item.indiedest);
          Result.csosn := OpFiscalMotor.getCsosnPorCst('0' + Result.cst, item, trib, confNf);
      end; 
    {$ENDREGION}

  end;
  {$ENDREGION}

  {$REGION 'espelho do calculo'}

  {$REGION 'ICMS'}
  if (Result.op.vicms > 0) or (Result.deson.vicmsdeson > 0) or (Result.dif.vicmsdif > 0) or (Result.sn.vcredicmssn > 0) then
  begin
    Result.espelhoCalc.Add('|ICMS OP -> %%ICMS=' + Format('%f', [IfThen(calc.op.picms > 0, calc.op.picms, calc.deson.picmsdeson)]) +
                           IfThen(Result.op.predbc > 0, Format(' %%REDUCAO=%f', [Result.op.predbc]))+
                           IfThen(Result.dif.pdif > 0, Format(' %%DIFERIMENTO%f', [Result.dif.pdif])));

    base := trib.conf_icm.getBC(ttICMS, item, item.base, -2);
    if (item.tipoCalc = tcParcial) and (item.base > 0) and (RoundTo(item.base, -2) <> RoundTo(base, -2)) then
      Result.espelhoCalc.Add(Format('|BC* -> Informada pelo usuário = ', [calc.op.vbc]))
    else if Result.op.predbc > 0 then
    begin
      Result.espelhoCalc.Add(Format('|BC -> (%s) * (1 - %%REDUCAO)', [trib.conf_icm.getBCEspelho(ttICMS, item, True)]));
      Result.espelhoCalc.Add(Format('|BC -> (%s) * (1 - %0.2f%%) = %f', [trib.conf_icm.getBCEspelho(ttICMS, item, False), Result.op.predbc, base]));
    end
    else
    begin
      Result.espelhoCalc.Add('|BC -> ' + trib.conf_icm.getBCEspelho(ttICMS, item, True));
      Result.espelhoCalc.Add(Format('|BC -> %s = %f',[trib.conf_icm.getBCEspelho(ttICMS, item, False), base]));
    end;

    if (Result.dif.vicmsdif > 0) then
      Result.espelhoCalc.Add(Format('|ICMS DIF = %f', [Result.dif.vicmsdif]));

    if (Result.dif.vicmsop > 0) then
      Result.espelhoCalc.Add(Format('|ICMS OP = %f', [Result.dif.vicmsop]));

    if (Result.op.vicms > 0) then
      Result.espelhoCalc.Add(Format('|ICMS  = %f', [Result.op.vicms]));

    if (Result.deson.vicmsdeson > 0) then
      Result.espelhoCalc.Add(Format('|ICMS DESON = %f', [Result.deson.vicmsdeson]));

    if (Result.sn.vcredicmssn > 0) then
      Result.espelhoCalc.Add(Format('|ICMS SN = %f', [Result.sn.vcredicmssn]));

    Result.espelhoCalc.Add('|--------------------------------------------------');
  end;
  {$ENDREGION}

  {$REGION 'ICMS ST'}
  if (Result.st.vicmsst > 0) then
  begin
    Result.espelhoCalc.Add('|ICMS ST -> %ICMS ST=' + Format('%f', [calc.st.picmsst]) +
                           IfThen(Result.st.predbcst > 0, Format(' %%REDUCAO=%f', [Result.st.predbcst]))+
                           IfThen(Result.st.pmvast > 0, Format(' %%MVA=%f', [Result.st.pmvast])));


    if ((item.tipoCalc = tcParcial) and (item.baseST > 0)) then
      Result.espelhoCalc.Add(Format('|BC* -> Informada pelo usuário = ', [Result.st.vbcst]))
    else if Result.st.predbcst > 0 then
      Result.espelhoCalc
        .AddF('|BC -> ((%s) * (1 + %%MVA)) * (1 - %%REDUCAO)', [trib.conf_icm.getBCEspelho(ttICMSST, item, True)])
        .AddF('|BC -> ((%s) * (1 + %0.2f%%)) * (1 - %0.2f%%) = %f', [trib.conf_icm.getBCEspelho(ttICMSST, item, False), Result.st.pmvast, Result.st.predbcst, Result.st.vbcst])
    else
      Result.espelhoCalc
        .AddF('|BC -> (%s) * (1 + %%MVA)', [trib.conf_icm.getBCEspelho(ttICMSST, item, True)])
        .AddF('|BC -> (%s) * (1 + %0.2f%%) = %f',[trib.conf_icm.getBCEspelho(ttICMSST, item, False), Result.st.pmvast, Result.st.vbcst]);

    if (Result.st.vicmsstdest > 0) then
      Result.espelhoCalc.AddF('|ICMS DEST = %f', [Result.st.vicmsstdest]);

    if (Result.st.vicmsst > 0) then
      Result.espelhoCalc.AddF('|ICMS ST = %f', [Result.st.vicmsst]);
    Result.espelhoCalc.Add('|--------------------------------------------------');
  end;
  {$ENDREGION}

  {$REGION 'FCP'}
  if Result.op.vfcp > 0 then
  BEGIN
    Result.espelhoCalc
      .AddF('|FCP -> %FCP=', [Result.op.pfcp])
      .AddF('|FCP = %f', [Result.op.vfcp]);
    Result.espelhoCalc.Add('|--------------------------------------------------');
  end;
  {$ENDREGION}

  {$REGION 'FCP ST'}
  if Result.st.vfcpst > 0 then
  begin
    Result.espelhoCalc
      .AddF('|FCP ST -> %FCPST=', [Result.st.pfcpst])
      .AddF('|FCP ST = %f', [Result.st.vfcpst]);
    Result.espelhoCalc.Add('|--------------------------------------------------');
  end;
  {$ENDREGION}

  {$ENDREGION}

end;

class function OpFiscalMotor.CalcularICMSUfDest(
  item    : TItemFiscal;
  trib    : TItemTributo_ICMS;
  confNf  : TConfigGlobalNotaFiscal;
  calcIcms: TIcmsTributavel): TIcmsUfDestTributavel;
var
  base: Double;
  ehBaseDupla: Boolean;
  calc: TIcmsUfDestTributavel;
begin
  item := OpFiscalMotor.ItemFiscalCheck(item);

  calc := TIcmsUfDestTributavel.Create;

  {$REGION 'calculo ICMS'}

  // Nao precisa testar aqui, pois ja faz antes de mandar pra aqui, aqui só calcula, a regra fica antes
  if (OpFiscalMotor.OperacaoComICMSUfDest(item, trib, confNf)) then
  if (trib.aliq_icms > 0) and (trib.aliq_intra > 0) then
  begin

    calc.picmsinter     := RoundTo(trib.aliq_icms, -2);
    calc.picmsufdest    := RoundTo(trib.aliq_intra, -4);
    calc.pfcpufdest     := RoundTo(trib.aliq_fcp, -4);
    calc.picmsinterpart := 100;

    ehBaseDupla := ContainsStr(confNf.Conf_ICMS.UFsBaseDupla, '|' + item.dest_uf + '|');

    if ehBaseDupla then
    begin

      base              := trib.conf_icm.getBC(ttICMSUFDest, item, item.base);

      calc.vicmsufremet := RoundTo(base * calc.picmsinter / 100, -2);

      calc.vbcufdest    := base - calc.vicmsufremet;
      // eu nao sei sobre a redução, se é feita na primeira etapa ou na segunta
      calc.vbcufdest    := RoundTo(calc.vbcufdest / ( 1 - (calc.picmsufdest / 100)), -2);
      calc.vicmsufdest  := RoundTo(calc.vbcufdest * calc.picmsufdest / 100, -2);

    end
    else
    begin

      base := trib.conf_icm.getBC(ttICMSUFDest, item, item.base);

      // Nota tecnica 2020.005 = ((vBCUFDest * pICMSUFDest) - (vBC * pICMSInter)) * pICMSInterPart
      // Observação 1: Se o resultado do cálculo for menor que zero deverá ser informado o valor “0.00”.
      // Observação 2: Se existir benefício fiscal no destino, o valor da base de cálculo no ICMS de destino (vBCUFDest) deverá ser informado considerando esse benefício

      calc.vbcufdest := RoundTo(base, -2);

      //  caso implemente alguma coisa para obter uma aliquota por estado reducao_icms
      //    if (calcIcms.cst = '00') and (trib.aliq_red_bc > 0) and (trib.aliq_red_bc < 100) then
      //      if ((item.tipoCalc = tcCompleto) or (item.tipoCalc = tcParcial) and (item.base = 0))  then //tipo de calculo parcial e usuario nao informou a base
      //        calc.vbcufdest := RoundTo(calc.vbcufdest * (100 - trib.aliq_red_bc) / 100, -2);

      if MatchText(calcIcms.cst, ['00', '20']) and (calcIcms.op.vbc > 0) then
      begin
        calc.vbcufdest        := calcIcms.op.vbc; // como nao implementamos a reducao pega a bc icms op
        calc.vicmsufremet     := RoundTo(calcIcms.op.vbc * calc.picmsinter / 100, -2);
      end
      else
        calc.vicmsufremet     := RoundTo(calc.vbcufdest * calc.picmsinter / 100, -2);

      calc.vicmsufdest        := RoundTo(calc.vbcufdest * calc.picmsufdest / 100, -2);

      {$REGION 'comentario do calculo antigo'}
      {
      calc.picmsinter     := RoundTo(trib.aliq_icms, -2);
      calc.picmsufdest    := RoundTo(trib.aliq_intra, -4);
      calc.pfcpufdest     := RoundTo(trib.aliq_fcp, -4);
      calc.picmsinterpart := 100;
      //não será mais usado da forma proposta na nota tecnico 2015/003 v1.40
      //base unica conforme noticia da sefaz SC
      //http://www.sef.sc.gov.br/noticias/aten%C3%A7%C3%A3o-contribuinte-delibera%C3%A7%C3%B5es-do-confaz-estendem-prazos-e-simplificam-gest%C3%A3o-tribut%C3%A1ria
      //verificar tambem se o IPI vai compor esta base de calculo

      //fazendo o calculo interestadual
      // base inter = valor da operacao / ( 1 - aliquota) --  aliq: 0,04  0,07   0,12
      //vItem.vrDadosItem.vbcufdest := oner.StrToFloatFormat(vValorBaseICMTemp / ( 1 - ( vItem.vrDadosItem.picmsinter / 100 )), 2);
      calc.vbcufdest        := RoundTo(base, -2);
      //icms interestadual = base inter * aliqinter / 100
      calc.vicmsufremet     := RoundTo(calc.vbcufdest * calc.picmsinter / 100, -2);
      //fazendo o calculo uf destino
      // base destino = valor da operacao / ( 1 - (aliqintra + aliqFCP)) --  aliq: 0,18   0,25   etc
      //vItem.vrDadosItem.vbcufdest := oner.StrToFloatFormat(vValorBaseICMTemp / ( 1 - ( (vItem.vrDadosItem.picmsufdest + vItem.vrDadosItem.pfcpufdest ) / 100 )),2);
      //icms uf destinho = base dest * aliqintra / 100
      calc.vicmsufdest      := RoundTo(calc.vbcufdest * calc.picmsufdest / 100, -2);
      //FCP: Fundo de combate a pobreza
      calc.vbcfcpufdest     := calc.vbcufdest;
      calc.vfcpufdest       := RoundTo(calc.vbcfcpufdest * calc.pfcpufdest / 100, -2);
      //calculando o DIFAL: Diferencial de aliquota
      calc.vicmsufdest      := calc.vicmsufdest - calc.vicmsufremet;
      //definindo a participacao da uf destino, 40% em 2016, 60% em 2017, 80% em 2018, 100% a partir de 2019
      calc.vicmsufremet     := RoundTo(calc.vicmsufdest * (100 - calc.picmsinterpart) / 100, -2);
      calc.vicmsufdest      := RoundTo(calc.vicmsufdest - calc.vicmsufremet, -2);
      if item.simples then
        calc.vicmsufremet   := 0;
      }
      {$ENDREGION}

    end;
    
    calc.vbcfcpufdest     := calc.vbcufdest;
    calc.vfcpufdest       := RoundTo(calc.vbcfcpufdest * calc.pfcpufdest / 100, -2);

    calc.vicmsufdest      := calc.vicmsufdest - calc.vicmsufremet;

    calc.vicmsufremet     := RoundTo(calc.vicmsufdest * (100 - calc.picmsinterpart) / 100, -2);
    calc.vicmsufdest      := RoundTo(calc.vicmsufdest - calc.vicmsufremet, -2);

    if item.simples then
      calc.vicmsufremet   := 0;

  end;

  if (calc.vbcufdest = 0) or
     (ContainsStr(confNf.Conf_ICMS.CSTCSOSNNaoCalcularICMSInterestadual, '|' + calcIcms.cst + '|')) then
  begin
    calc.vbcufdest      := 0;
    calc.pfcpufdest     := 0;
    calc.picmsufdest    := 0;
    calc.picmsinter     := 0;
    calc.picmsinterpart := 0;
    calc.vfcpufdest     := 0;
    calc.vicmsufdest    := 0;
    calc.vicmsufremet   := 0;
    calc.vbcfcpufdest   := 0;
  end;

  Result := calc;
{$ENDREGION}
end;

class function OpFiscalMotor.CalcularIPI(
  item  : TItemFiscal;
  trib  : TItemTributo_IPI;
  confNf: TConfigGlobalNotaFiscal): TIpiTributavel;
var
  base: Double;
  calc: TIpiTributavel;
begin
  item := OpFiscalMotor.ItemFiscalCheck(item);

  calc := TIpiTributavel.Create;

  base := trib.conf_ipi.getBC(ttIPI, item, item.base, -4);

  calc.cst := trib.cst;

  if trib.calcularIpi and (trib.aliq_ipi > 0) then
  begin
    {if trib.conf_ipi.ReadString('Conf', 'TributarPorQuantidade', 'N') = '' then
    begin
      calc.qtde.vbc   := base;
      calc.qtde.paliq := RoundTo(trib.aliq_ipi, -4);
      calc.vipi       := RoundTo(calc.qtde.vbc * calc.qtde.paliq, -2);
    end
    else}
    //begin
      calc.aliq.vbc   := RoundTo(base, -2);
      calc.aliq.paliq := RoundTo(trib.aliq_ipi, -4);
      calc.vipi       := RoundTo(calc.aliq.vbc * calc.aliq.paliq / 100, -2);
    //end;
  end;

  Result := calc;
end;

class function OpFiscalMotor.CalcularISSQN(
  item  : TItemFiscal;
  trib  : TItemTributo_ISSQN;
  confNf: TConfigGlobalNotaFiscal): TISSQNTributavel;
var
  base: Double;
  calc: TISSQNTributavel;
begin
  item := OpFiscalMotor.ItemFiscalCheck(item);

  calc := TISSQNTributavel.Create;

  base := trib.conf_iss.getBC(ttISS, item, item.base);

  if trib.aliq_iss > 0 then
  begin
    calc.vbc    := RoundTo(base, -2);
    calc.paliq  := RoundTo(trib.aliq_iss, -4);
    calc.vissqn := RoundTo(calc.vbc * calc.paliq / 100, -2);
  end;

  Result := calc;
end;

class function OpFiscalMotor.CalcularPISCOFINS(
  item  : TItemFiscal;
  trib  : TItemTributo_PC;
  confNf: TConfigGlobalNotaFiscal): TPisCofinsTributavel;
var
  base: Double;
  calc: TPisCofinsTributavel;
begin
  item := OpFiscalMotor.ItemFiscalCheck(item);

  calc := TPisCofinsTributavel.Create;

  {
  if item.simples then
  begin
    calc.cst := '99';
    Result   := calc;
    Exit;
  end;
  }

  if trib.cst_pc = '03' then
    base := IfThen((item.tipoCalc = tcParcial) and (item.qtdebc > 0), item.qtdebc, item.quantidade)
  else
    base := trib.conf_pc.getBC(ttPISCOFINS, item, item.base, -4);

  if base < 0 then
    base := 0;

  if Length(trib.cst_pc) <> 2 then
    raise Exception.CreateFmt('Item %s CST PISCOFINS inválido ou em branco, valor: %s ', [item.idenItem + sLineBreak, trib.cst_pc]);

  if trib.calcularPisCofins and (trib.aliq_pis > 0) or (trib.valiq_pis > 0) then
  begin
    calc.cst := trib.cst_pc;

    if (trib.aliq_pis > 0) then
    begin
      calc.pcaliq.vbcouqtde   := RoundTo(base, -2);
      calc.pcaliq.paliqpis    := RoundTo(trib.aliq_pis, -4);
      calc.pcaliq.paliqcofins := RoundTo(trib.aliq_cofins, -4);
    end;

    if (trib.valiq_pis > 0) then
    begin
      calc.pcqtde.vbcouqtde   := RoundTo(base, -4);
      calc.pcqtde.paliqpis    := RoundTo(trib.valiq_pis, -4);
      calc.pcqtde.paliqcofins := RoundTo(trib.valiq_cofins, -4);
    end;

    if (trib.cst_pc = '05') and (confNf.Conf_PIS.nf_piscofins_cst_05_revenda_base_zero) then
      calc.pcaliq.vbcouqtde := 0;

    if (trib.cst_pc = '03') then
    begin
      calc.vpis    := RoundTo(calc.pcqtde.vbcouqtde * calc.pcqtde.paliqpis, -2);
      calc.vcofins := RoundTo(calc.pcqtde.vbcouqtde * calc.pcqtde.paliqcofins, -2);
    end
    else
    begin
      calc.vpis    := RoundTo(calc.pcaliq.vbcouqtde * calc.pcaliq.paliqpis / 100, -2);
      calc.vcofins := RoundTo(calc.pcaliq.vbcouqtde * calc.pcaliq.paliqcofins / 100, -2);
    end;
  end
  else
    calc.cst := trib.cst_pc;

  // falta o caso do cst 05 que fica apenas com aliquota

  if trib.motdespc > 0 then
  begin
    Result := TPisCofinsTributavel.Create;

    Result.cst          := calc.cst;
    Result.motdes       := trib.motdespc;
    Result.vpisdeson    := calc.vpis;
    Result.vcofinsdeson := calc.vcofins;

    if (Result.cst = '03') then
    begin
      Result.ppisdeson    := calc.pcqtde.paliqpis;
      Result.pcofinsdeson := calc.pcqtde.paliqcofins;
      Result.vbcdeson     := calc.pcqtde.vbcouqtde;
    end
    else
    begin
      Result.ppisdeson    := calc.pcaliq.paliqpis;
      Result.pcofinsdeson := calc.pcaliq.paliqcofins;
      Result.vbcdeson     := calc.pcaliq.vbcouqtde;
    end;
  end
  else
    Result := calc;

  if MatchText(Result.cst, ['04', '05', '06', '07', '08', '09']) then
    Result.natrec := trib.nat_rec;

  if Result.vpisdeson > 0 then
    Result.espelhoCalc.Add(Format('|PISCOFINS DESONERADO -> CST: %s - ALIQ PIS: %f - ALIQ COFINS: %f - BC: %f - PIS: %f - COFINS: %f - MOTIVO: %d ',
                                  [Result.cst, Result.ppisdeson, Result.pcofinsdeson, Result.vbcdeson, Result.vpisdeson, Result.vcofinsdeson, Result.motdes]))
  else if (Result.cst = '03') then
    Result.espelhoCalc.Add(Format('|PISCOFINS -> CST: %s - ALIQ PIS: %f - ALIQ COFINS: %f - BC: %f - PIS: %f - COFINS: %f',
                                  [Result.cst, Result.pcqtde.paliqpis, Result.pcqtde.paliqcofins, Result.pcqtde.vbcouqtde, Result.vpis, Result.vcofins]))
  else
    Result.espelhoCalc.Add(Format('|PISCOFINS -> CST: %s - ALIQ PIS: %f - ALIQ COFINS: %f - BC: %f - PIS: %f - COFINS: %f',
                                  [Result.cst, Result.pcaliq.paliqpis, Result.pcaliq.paliqcofins, Result.pcaliq.vbcouqtde, Result.vpis, Result.vcofins]));
end;

class function OpFiscalMotor.CalcularRetencaoTributos(item: TItemFiscal;
  trib: TItemTributo_Ret; confNf: TConfigGlobalNotaFiscal): TRetencaoTributavel;
var
  base: Double;
  calc: TRetencaoTributavel;
begin
  item := OpFiscalMotor.ItemFiscalCheck(item);

  calc := TRetencaoTributavel.Create;

  base := trib.conf_ret.getBC(ttRetencoes, item, item.base, -4);

  if base < 0 then
    base := 0;

  if (trib.aliq_ret_ir > 0) then
  begin
    calc.vBcRetFed := RoundTo(base, -2);
    calc.pIr := trib.aliq_ret_ir;
    calc.vir := RoundTo(calc.vBcRetFed * calc.pIr / 100, -2);
  end;

  if (trib.aliq_ret_csll > 0) then
  begin
    calc.vBcRetFed := RoundTo(base, -2);
    calc.pCsll := trib.aliq_ret_csll;
    calc.vCsll := RoundTo(calc.vBcRetFed * calc.pCsll / 100, -2);
  end;

  if (trib.aliq_ret_pis > 0) then
  begin
    calc.vBcRetFed := RoundTo(base, -2);
    calc.pPis := trib.aliq_ret_pis;
    calc.vPis := RoundTo(calc.vBcRetFed * calc.pPis / 100, -2);
  end;

  if (trib.aliq_ret_cofins > 0) then
  begin
    calc.vBcRetFed := RoundTo(base, -2);
    calc.pCofins := trib.aliq_ret_cofins;
    calc.vCofins := RoundTo(calc.vBcRetFed * calc.pCofins / 100, -2);
  end;

  Result := calc;

  if Result.vIr > 0 then
    Result.espelhoCalc.Add(Format('|RETENCAO IR -> BC: %F - ALIQ: %f - VALOR: %f ', [Result.vBcRetFed, Result.pIr, Result.vIr]));

  if Result.vCsll > 0 then
    Result.espelhoCalc.Add(Format('|RETENCAO CSLL -> BC: %F - ALIQ: %f - VALOR: %f ', [Result.vBcRetFed, Result.pCsll, Result.vCsll]));

  if Result.vPis > 0 then
    Result.espelhoCalc.Add(Format('|RETENCAO PIS -> BC: %F - ALIQ: %f - VALOR: %f ', [Result.vBcRetFed, Result.pPis, Result.vPis]));

  if Result.vCofins > 0 then
    Result.espelhoCalc.Add(Format('|RETENCAO COFINS -> BC: %F - ALIQ: %f - VALOR: %f ', [Result.vBcRetFed, Result.pCofins, Result.vCofins]));
end;

class function OpFiscalMotor.GetCsosnPorCst(cst: string; item: TItemFiscal;
  trib: TItemTributo_ICMS; confNf: TConfigGlobalNotaFiscal): string;
var
  Acsosn, Acst, Aorig, Adig: string;
  I: Integer;
begin
  if Length(Trim(cst)) <> 3 then
    raise Exception.Create('Metodo getCsosnPorCst com parametro invalido, cst < 3');

  Aorig := Copy(cst, 1, 1);
  Acst  := Copy(cst, 2, 2);

  Acsosn := '';
  for I := 0 to Pred(confNf.Conf_ICMS.prod_cad_relacao_cst_csosn.Count) do
  begin
    if Acst = StrByPosition(confNf.Conf_ICMS.prod_cad_relacao_cst_csosn[I], 1) then //por padrao vai utilizar o primeiro Acsosn que encontrar
      Acsosn := Copy( confNf.Conf_ICMS.prod_cad_relacao_cst_csosn[I], 4, Length(confNf.Conf_ICMS.prod_cad_relacao_cst_csosn[I]));
    if Acsosn <> '' then
    begin
      if (Trim(trib.csosn) <> '') and (Pos('|' + trib.csosn + '|',  Acsosn) > 0) then
        Acsosn := trib.csosn
      else
        Acsosn := StrByPosition(Acsosn, 1);
      Break;
    end;
  end;

  if not MatchStr(Acsosn, ['101', '102', '103', '201', '202', '203', '300', '400', '500', '900']) then
    Acsosn := '';

  try
    if Acsosn = '' then // caso nao tenha configuracao o padrao é este abaixo
    begin
      Adig   := IfThen(Acst[1] in ['0', '2', '1', '7'], IfThen((item.indiedest = '1') and (Copy(item.regimeCli,1,1) <> 'S'), '1', '2'));
      Acsosn := IfThen(Acst[1] in ['0', '2'], '10' ) +
                IfThen(Acst[1] in ['1', '7'], '20' ) +
                IfThen(Acst = '30'          , '203') +
                IfThen(Acst = '40'          , '103') +
                IfThen(Acst = '41'          , IfThen(confNf.Conf_ICMS.UsarCSOSN300Para041, '300', '400')) +
                IfThen(Acst = '50'          , '103') +
                IfThen(Acst = '51'          , '900') +
                IfThen(Acst = '60'          , '500') +
                IfThen(Acst = '90'          , '900') +
                Adig;
    end;
    { Não vai mais ajustar quando contribuinte, pois a contabilidade da Bellanona é muito chata, a conf global confNf.Conf_ICMS.prod_cad_relacao_cst_csosn é a regra que vai prevalecer
    else if ((FOwnerNF.emissao_propria = 'S') and (FOwnerNF.devolucao <> 'SIM')) then
      if oner.strIn(Acsosn, ['101', '102', '201', '202']) then
        Acsosn := Copy(Acsosn, 1, 2) + IfThen(FOwnerNF.nfe_indiedest = 1, '1', '2');
    }
  finally
    Result := Acsosn;
  end;
end;

class function OpFiscalMotor.ItemFiscalCheck(item: TItemFiscal): TItemFiscal;
begin
  if item.tipoCalc = tcNenhum then
    raise Exception.Create('Tipo de cálculo igual a tcNenhum, esse método não deve ser chamado');

  item.valor    := IfThen(item.valor >= 0, item.valor, 0);
  item.desconto := IfThen(item.desconto >= 0, item.desconto, 0);
  item.frete    := IfThen(item.frete >= 0, item.frete, 0);
  item.seguro   := IfThen(item.seguro >= 0, item.seguro, 0);
  item.outras   := IfThen(item.outras >= 0, item.outras, 0);
  item.vipi     := IfThen(item.vipi >= 0, item.vipi, 0);
  item.custo    := IfThen(item.custo >= 0, item.custo, 0);
  item.base     := IfThen(item.base >= 0, item.base, 0);
  item.baseST   := IfThen(item.baseST >= 0, item.baseST, 0);

  Result := item;
end;

class function OpFiscalMotor.OperacaoComICMSUfDest(
  item  : TItemFiscal;
  trib  : TItemTributo_ICMS;
  confNf: TConfigGlobalNotaFiscal): Boolean;
var
  retorno: Boolean;
begin
  retorno := False;
  try
    retorno := (item.indiedest = '9') and
               (item.consumofinal = 'S') and
               (item.iddest = '2');

    if retorno then
      case trib.cfop of
        1414, 1415, 1451, 1452, 1554, 1664, 1902, 1903, 1904, 1906, 1907, 1909, 1913,
          1914, 1916, 1921, 1925,
          2414, 2415, 2554, 2664, 2902, 2903, 2904, 2906, 2907, 2909, 2913, 2914, 2916,
          2921, 2925,
          5664, 5665, 5902, 5903, 5906, 5907, 5909, 5913, 5916, 5925,
          6664, 6665, 6902, 6903, 6906, 6907, 6909, 6913, 6916, 6925:
          retorno := False;
      end;

    if retorno then
      case trib.cfop of
        5414, 5415, 5451, 5501, 5502, 5504, 5505, 5554, 5657, 5663, 5666, 5901, 5904,
          5905, 5908, 5910, 5911, 5912, 5914, 5915, 5917, 5920, 5923, 5924, 5934,
          6414, 6415, 6501, 6502, 6504, 6505, 6554, 6657, 6663, 6666, 6901, 6904, 6905,
          6908, 6910, 6911, 6912, 6914, 6915, 6917, 6920, 6923, 6924, 6934:
          retorno := False;
      end;

    if (retorno) and (Trim(item.cprodanp) <> '') then
      if Assigned(confNf.Conf_ICMS.nf_exececoes_codigo_anp) then
        retorno := confNf.Conf_ICMS.nf_exececoes_codigo_anp.IndexOf(item.cprodanp) < 0;
  finally
    Result := retorno;
  end;
end;

{ OpFiscal }

class function OpFiscal.GetOperacoes(
  id        : string;
  item      : TCondicaoFiscal;
  codempresa: Integer;
  con       : TConexao): TCadItensTributos;
var
  I: Integer;
begin
  item.icm_cst       := IfThen(Length(item.icm_cst) = 2, item.icm_cst);
  item.piscofins_cst := IfThen(item.piscofins_cst = '', '01', item.piscofins_cst);

  Result := TCadItensTributos.Create;

  Result.CopyFrom
    (con.SqlOpen('select * from sp_get_opfiscal_lote(''%s'', %d, %d, ''%s'', ''%s'', %d, ''%s'', %d, ''%s'')',
    [id, codempresa, item.cidadeIbgeDest, item.consumofinal, item.indiedest, item.finalidadeId,
    item.pessoa, Ord(item.tipoNF), item.ufDest]));

  for I := 0 to Result.Count - 1 do
  begin
    Result.Items[I].cidade_ibge      := item.cidadeIbgeDest;
    Result.Items[I].consumidor_final := item.consumoFinal;
    Result.Items[I].indiedest        := StrToIntDef(item.indiedest, 0);
    Result.Items[I].finalidade_id    := item.finalidadeId;
    Result.Items[I].pessoa           := item.pessoa;
    Result.Items[I].tipo_nota        := Ord(item.tipoNF);
    Result.Items[I].uf               := item.ufDest;
    Result.Items[I].cst_piscofins    := IfThen(Result.Items[I].cst_piscofins = '', '01', Result.Items[I].cst_piscofins);
    //Result.Items[I].ncm              := item.ncm;
    //Result.Items[I].tipo_item        := item.tipoItem;
    //Result.Items[I].cst_icms         := item.icm_cst;
    //Result.Items[I].cst_piscofins    := item.piscofins_cst;
  end;

end;

class function OpFiscal.Sql(
  item      : TCondicaoFiscal;
  codempresa: Integer): string;
begin
  // Result := Format();
end;

class function OpFiscal.CstIcmsToTributacao(
  cst          : string;
  picm, picmsst: Double): TTributacao;
begin
  if MatchStr(cst, ['00', '20', '51']) then
    Result := icm_00_20_51
  else if MatchStr(cst, ['10', '70']) then
    Result := icm_10_70
  else if MatchStr(cst, ['02']) then
    Result := icm_02        
  else if MatchStr(cst, ['15']) then
    Result := icm_15
  else if MatchStr(cst, ['30']) then
    Result := icm_30
  else if MatchStr(cst, ['40']) then
    Result := icm_40
  else if MatchStr(cst, ['41']) then
    Result := icm_41
  else if MatchStr(cst, ['50']) then
    Result := icm_50
  else if MatchStr(cst, ['53']) then
    Result := icm_53
  else if MatchStr(cst, ['60']) then
    Result := icm_60
  else if MatchStr(cst, ['61']) then
    Result := icm_61
  else if MatchStr(cst, ['90']) then
  begin
    if (picm > 0) and (picmsst > 0) then
      Result := icm_90_comICM_comST
    else if (picm > 0) and (picmsst = 0) then
      Result := icm_90_comICM_semST
    else if (picm = 0) and (picmsst > 0) then
      Result := icm_90_semICM_comST
    else
      Result := icm_90_semICM_semST
  end;
end;
{
class function OpFiscal.GetItemFiscal(nota: Tnf_Model;
  nfItem: Tnfitem_Model): TItemFiscal;
begin
  Result.tipoCalc     := TTipoCalculo(nfItem.tipo_calc);
  Result.modeloDoc    := nota.modelo_nf;
  Result.indiedest    := IntToStr(nota.nfe_indiedest);
  Result.iddest       := nota.nfe_iddest;
  Result.e_s          := nota.natureza_nf;
  Result.dest_uf      := nota.dest_uf;
  Result.consumofinal := nota.consumidor_final;
  Result.conf_bcnf    := TStringIni.New(nota.conf_bc.Text);
  Result.simples      := nota.crt = '1';
  Result.orig         := IfThen(nfItem.cst <> '', Copy(nfItem.cst, 1, 1), '0');
  Result.modbcST      := IntToStr(nfItem.modbcst);
  Result.cprodanp     := nfItem.comb_cprodanp;

  Result.valor        := RoundTo(IfThen(nfItem.valor_total > 0, nfItem.valor_total, nfItem.valor_unitario * nfItem.quantidade), -2);
  Result.desconto     := nfItem.rateio_desconto;
  Result.frete        := IfThen((nota.frete_f_nfe <> 'S') and (nota.freteconta_tr <> '9'), nfItem.rateio_frete);
  Result.seguro       := nfItem.rateio_seguro;
  Result.outras       := nfItem.rateio_outdesp;
  Result.custo        := nfItem.prec_cusm_prod;
  Result.quantidade   := nfItem.quantidade;

  Result := Result;
end;
}

class function OpFiscal.GetOperacao(
  item      : TCondicaoFiscal;
  codempresa: Integer;
  con       : TConexao): TItemTributos;
begin
  item.icm_cst       := IfThen(Length(item.icm_cst) = 2, item.icm_cst);
  item.piscofins_cst := IfThen(item.piscofins_cst = '', '01', item.piscofins_cst);

  con.SqlOpen
    ('select * from sp_get_opfiscal(%d, ''%s'', %d, ''%s'', ''%s'', %d, ''%s'', ''%s'', %d, ''%s'', ''%s'', ''%s'')',
    [codempresa, item.ncm, item.cidadeIbgeDest, item.consumofinal, item.indiedest, item.finalidadeId,
    item.pessoa, item.tipoItem, Ord(item.tipoNF), item.ufDest, item.icm_cst, item.piscofins_cst]);

  Result                  := TItemTributos.Create;
  Result.icms             := TItemTributo_ICMS.Create().CopyFrom(con.QrAux) as TItemTributo_ICMS;
  Result.piscofins        := TItemTributo_PC.Create().CopyFrom(con.QrAux) as TItemTributo_PC;
  Result.retTrib          := TItemTributo_Ret.Create().CopyFrom(con.QrAux) as TItemTributo_Ret;
  Result.ipi              := TItemTributo_IPI.Create();
  Result.iss              := TItemTributo_ISSQN.Create();

  Result.cidade_ibge      := item.cidadeIbgeDest;
  Result.consumidor_final := item.consumoFinal;
  Result.indiedest        := StrToIntDef(item.indiedest, 0);
  Result.finalidade_id    := item.finalidadeId;
  Result.pessoa           := item.pessoa;
  Result.tipo_nota        := Ord(item.tipoNF);
  Result.uf               := item.ufDest;
  Result.ncm              := item.ncm;
  Result.tipo_item        := item.tipoItem;
  Result.cst_icms         := item.icm_cst;
  Result.cst_piscofins    := IfThen(item.piscofins_cst = '', '01', item.piscofins_cst);
end;

{ TCadItensTributos }

function TCadItensTributos.CopyFrom(dataSet: TDataSet): Integer;
begin
  dataSet.First;
  while not dataSet.Eof do
  begin

    with Self.New do
    begin
      CopyFrom(dataSet);
      icms.CopyFrom(dataSet);
      piscofins.CopyFrom(dataSet);
      retTrib.CopyFrom(dataSet);
    end;

    dataSet.Next;
  end;
end;

function TCadItensTributos.GetOperacao(ncm, tipo_item, cst_icms,
  cst_piscofins: string): TItemTributos;
var
  I: Integer;
begin
  cst_piscofins := IfThen(cst_piscofins = '', '01', cst_piscofins);

  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].ncm = ncm) and
      (Self.Items[I].tipo_item = tipo_item) and
      (Self.Items[I].cst_icms = cst_icms) and
      (Self.Items[I].cst_piscofins = cst_piscofins) then
    begin
      Result := (Self.Items[I].Clone as TItemTributos);

      Exit;
    end;

  Result := TItemTributos.Create;
end;

function TCadItensTributos.GetOperacao(
  item      : TCondicaoFiscal): TItemTributos;
var
  I: Integer;
begin
  item.piscofins_cst := IfThen(item.piscofins_cst = '', '01', item.piscofins_cst);

  for I := 0 to Self.Count - 1 do
    if (Self.Items[I].cidade_ibge = item.cidadeIbgeDest) and
      (Self.Items[I].consumidor_final = item.consumoFinal) and
      (Self.Items[I].indiedest = StrToInt(item.indiedest)) and
      (Self.Items[I].finalidade_id = item.finalidadeId) and
      (Self.Items[I].pessoa = item.pessoa) and
      (Self.Items[I].tipo_nota = Ord(item.tipoNF)) and
      (Self.Items[I].uf = item.ufDest) and
      (Self.Items[I].ncm = item.ncm) and
      (Self.Items[I].tipo_item = item.tipoItem) and
      (Self.Items[I].cst_icms = item.icm_cst) and
      (Self.Items[I].cst_piscofins = item.piscofins_cst) then
    begin
      Result := (Self.Items[I].Clone as TItemTributos);

      Exit;
    end;

  Result := TItemTributos.Create;
end;

end.
