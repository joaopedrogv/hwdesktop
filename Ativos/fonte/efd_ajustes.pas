unit efd_ajustes;

interface  

uses
  efd_ajustes_model,
//  Classes,
//  basefb_class,
//  sp_efd_ajustes_Model,
  efd_1921_class,
  nota_ajuste_class,
  uClasseConexao;
  
type

  ArrayInt = array of Integer;

  AjustesEfdResult = class
  private
    Fefd1921: TEfd1921List;
    FefdC197: TNotaAjusteDbList;
    Fcod_nf: Integer;
  public
    property cod_nf: Integer read Fcod_nf write Fcod_nf;
    property efdC197: TNotaAjusteDbList read FefdC197 write FefdC197;
    property efd1921: TEfd1921List read Fefd1921 write Fefd1921;
  end;

  AjustesEfdResultArr = array of AjustesEfdResult;

  AjustesEFD = class
    class function GetAjustesCalculados(itens: TEfdAjustesConfResultList): AjustesEfdResult;
  public
    class function GetAjustes(codigoNF: ArrayInt; codEmpresa: Integer; con: TConexao): AjustesEfdResultArr;
  end;

implementation

uses
//  StrUtils,
//  SysUtils,
//  Contnrs,
  Math,
//  nf_model,
//  nfitem_model,
  hw_utils,
  hw_strings,
  opfiscal_model,
  opfiscal_hw,
  efd_ajustes_service, sp_efd_ajustes_class, Classes, Contnrs, basefb_class;

{ AjustesEFD }

class function AjustesEFD.GetAjustes(codigoNF: ArrayInt; codEmpresa: Integer;
  con: TConexao): AjustesEfdResultArr;
var
  I: Integer;
  confs: TEfdAjustesConf;
  repo: TAjustesRepo;
  nfParams: TNotaItemParamList;
  ajustes: TEfdAjustesConfResultList;
  calculo: AjustesEfdResult;
begin

  repo := TAjustesRepo.Create(codEmpresa, con);

  try
    confs := repo.GetConfAjustes;

    SetLength(Result, Length(codigoNF));
    for I := Low(codigoNF) to High(codigoNF) do
    begin
      nfParams := repo.GetNotaFiscal(codigoNF[I]);

      ajustes := confs.GetAjusterPorNotaItem(nfParams);

      Result[I] := AjustesEFD.GetAjustesCalculados(ajustes);
    end;

  finally
    repo.Free;
  end;
end;

class function AjustesEFD.GetAjustesCalculados(
  itens: TEfdAjustesConfResultList): AjustesEfdResult;
var
  I, J, K: Integer;
  efd1921: TEfd1921;
  nfAjuste: TNotaAjusteDb;
//  nf: Tnf_Model;
//  nfIt: Tnfitem_Model;
  base: Double;
  existe: Boolean;
begin
  Result := AjustesEfdResult.Create;
  Result.efdC197 := TNotaAjusteDbList.Create;
  Result.efd1921 := TEfd1921List.Create;
                       
  for I := 0 to itens.Count - 1 do
    for J := 0 to itens.Items[i].ajustes.Count - 1 do
    begin
      if itens.Items[i].ajustes.Items[J].cod_obs > 0 then
      begin

        {$REGION 'nota e item model para obter a bc calculo'}
        {
        nf := Tnf_Model.Create;
        nfIt := Tnfitem_Model.Create;
        //nf.modelo_nf := '55'; //itens.Items[i].modelo_nf;
        //nf.nfe_indiedest := itens.Items[i].nfe_indiedest;
        //nf.nfe_iddest := itens.Items[i].nfe_iddest;
        //nf.natureza_nf := itens.Items[i].natureza_nf;
        //nf.dest_uf := itens.Items[i].uf;
        //nf.consumidor_final := itens.Items[i].consumidor_final;
        //nf.conf_bc := itens.Items[i].conf_bc;
        //nf.crt := itens.Items[i].crt;
        //nf.freteconta_tr := itens.Items[i].freteconta_tr;
        nf.frete_f_nfe := itens.Items[i].frete_f_nfe;
        //nfIt.modbcst := itens.Items[i].modbcst;
        //nfIt.comb_cprodanp := itens.Items[i].comb_cprodanp;
        //nfIt.prec_cusm_prod := itens.Items[i].prec_cusm_prod;
        nfIt.tipo_calc := ord(tcCompleto);
        nfIt.cst := itens.Items[i].cst;
        nfIt.valor_total := itens.Items[i].valor_total;
        nfIt.rateio_desconto := itens.Items[i].rateio_desconto;
        nfIt.rateio_frete := itens.Items[i].rateio_frete;
        nfIt.rateio_seguro := itens.Items[i].rateio_seguro;
        nfIt.rateio_outdesp := itens.Items[i].rateio_outdesp;
        }
        {$ENDREGION}

        {$REGION 'Ajuste C195 C197'}

        nfAjuste := TNotaAjusteDb.Create;

        nfAjuste.cod_nf := itens.Items[i].cod_nf;
        nfAjuste.cod_empresa := itens.Items[i].cod_empresa; 
        nfAjuste.cod_obs := itens.Items[i].ajustes.Items[J].cod_obs;
        nfAjuste.cod_aj := itens.Items[i].ajustes.Items[J].aj_c197;
        nfAjuste.descr_compl_aj := itens.Items[i].ajustes.Items[J].conf_c197.Values['DescricaoComplementar'];

        if itens.Items[i].ajustes.Items[J].conf_c197.Values['AjustePorItem'] = 'S' then
          nfAjuste.nitem := itens.Items[i].nitem
        else
          nfAjuste.nitem := 0;

        if itens.Items[i].ajustes.Items[J].conf_c197.Values['PreencherBaseICMS'] = 'S' then
        begin
          if (VarToFloat(nfAjuste.vl_bc_icms) = 0) 
            and (itens.Items[i].ajustes.Items[J].conf_c197.Values['UsarBaseIcms'] = 'S') then                    
            nfAjuste.vl_bc_icms := itens.Items[i].base_icm;

          if (VarToFloat(nfAjuste.vl_bc_icms) = 0) 
            and (itens.Items[i].ajustes.Items[J].conf_c197.Values['UsarBaseIcmsSt'] = 'S') then                    
            nfAjuste.vl_bc_icms := itens.Items[i].base_icmsub; 

          if (VarToFloat(nfAjuste.vl_bc_icms) = 0) 
            and (itens.Items[i].ajustes.Items[J].conf_c197.Values['UsarValorContabil'] = 'S') then
          begin
            nfAjuste.vl_bc_icms := itens.Items[i].valor_total - itens.Items[i].rateio_desconto +
              IfThen(itens.Items[i].frete_f_nfe <> 'S', itens.Items[i].rateio_frete) +
              itens.Items[i].rateio_seguro +
              itens.Items[i].rateio_outdesp;
          end;
        
        end;

        if itens.Items[i].ajustes.Items[J].conf_c197.Values['PreencherAliquotaIcms'] = 'S' then
        begin
          if itens.Items[i].ajustes.Items[J].conf_c197.Values['UsarAliquotaDaCondicao'] = 'S' then        
            nfAjuste.aliq_icms := itens.Items[i].ajustes.Items[J].aliquota;

          if (VarToFloat(nfAjuste.aliq_icms) = 0)
            and (itens.Items[i].ajustes.Items[J].conf_c197.Values['UsarAliquotaIcmsDoItem'] = 'S') then
            nfAjuste.aliq_icms := itens.Items[i].aliq_icm;

          if (VarToFloat(nfAjuste.aliq_icms) = 0)
            and (itens.Items[i].ajustes.Items[J].conf_c197.Values['UsarAliquotaIcmsStDoItem'] = 'S') then
            nfAjuste.aliq_icms := itens.Items[i].aliq_icmsub;

          if (VarToFloat(nfAjuste.aliq_icms) = 0) then
            nfAjuste.aliq_icms := itens.Items[i].ajustes.Items[J].aliq_c197;
        end;

        if itens.Items[i].ajustes.Items[J].conf_c197.Values['ValorIcmsCalculado'] = 'S' then
          nfAjuste.vl_icms := VarToFloat(nfAjuste.aliq_icms) * VarToFloat(nfAjuste.vl_bc_icms) / 100;

        if (VarToFloat(nfAjuste.vl_icms) = 0)
          and (itens.Items[i].ajustes.Items[J].conf_c197.Values['UsarValorIcms'] = 'S') then
          nfAjuste.vl_icms := itens.Items[i].valor_icm;
          
        if (VarToFloat(nfAjuste.vl_icms) = 0)
          and (itens.Items[i].ajustes.Items[J].conf_c197.Values['UsarValorIcmsSt'] = 'S') then
          nfAjuste.vl_icms := itens.Items[i].valor_icmsub;


        existe := False;

        for K := 0 to Result.efdC197.Count - 1 do
          if (Result.efdC197.Items[K].cod_aj = nfAjuste.cod_aj)
            and (Result.efdC197.Items[K].nitem = 0)
            and (RoundTo(VarToFloat(Result.efdC197.Items[K].aliq_icms), -2) = RoundTo(VarToFloat(nfAjuste.aliq_icms), -2)) then
          begin
            existe := True;
            Result.efdC197.Items[K].vl_bc_icms := VarToFloat(Result.efdC197.Items[K].vl_bc_icms) + VarToFloat(nfAjuste.vl_bc_icms);
            Result.efdC197.Items[K].vl_icms := VarToFloat(Result.efdC197.Items[K].vl_icms) + VarToFloat(nfAjuste.vl_icms);
          end;

        if not existe then
          Result.efdC197.Add(nfAjuste);
        {$ENDREGION}

      end;

      if itens.Items[i].ajustes.Items[J].aj_1921 <> '' then
      begin

        {$REGION 'Ajuste 1921'}

        efd1921 := TEfd1921.Create;

        efd1921.cod_empresa := itens.Items[i].cod_empresa;
        efd1921.ref_id := itens.Items[i].guidt;
        efd1921.cod_ajuste := itens.Items[i].ajustes.Items[J].aj_1921;
        efd1921.conf_tipo_id := itens.Items[i].ajustes.Items[J].conf_1921_id;
        efd1921.descr_compl.Text := itens.Items[i].ajustes.Items[J].conf_1921.Values['DescricaoComplementar'];

        base := 0;
        if (itens.Items[i].base_icm > 0) and (base = 0)
          and (itens.Items[i].ajustes.Items[J].conf_1921.Values['UsarBaseIcms'] = 'S') then
          base := itens.Items[i].base_icm;

        if (itens.Items[i].base_icmsub > 0) and (base = 0)
          and (itens.Items[i].ajustes.Items[J].conf_1921.Values['UsarBaseIcmsSt'] = 'S') then
          base := itens.Items[i].base_icmsub;

        if (base = 0)
          and (itens.Items[i].ajustes.Items[J].conf_1921.Values['UsarValorContabil'] = 'S') then
          base := itens.Items[i].valor_total - itens.Items[i].rateio_desconto +
            IfThen(itens.Items[i].frete_f_nfe <> 'S', itens.Items[i].rateio_frete) +
            itens.Items[i].rateio_seguro +
            itens.Items[i].rateio_outdesp;

        if (base > 0) and (itens.Items[i].ajustes.Items[J].aliquota > 0) then
          efd1921.aliquota_ajuste := itens.Items[i].ajustes.Items[J].aliquota
        else
          efd1921.aliquota_ajuste := itens.Items[i].ajustes.Items[J].aliq_1921;

        efd1921.valor_ajuste := base * efd1921.aliquota_ajuste / 100;

        existe := False;

//        for K := 0 to Result.efd1921.Count - 1 do
//          if (Result.efd1921.Items[K].cod_ajuste = efd1921.cod_ajuste)
//            and (Result.efd1921.Items[K].aliquota_ajuste = efd1921.aliquota_ajuste) then
//          begin
//            existe := True;
//            Result.efd1921.Items[K].valor_ajuste := Result.efd1921.Items[K].valor_ajuste + efd1921.valor_ajuste;
//          end;

        if not existe then
          Result.efd1921.Add(efd1921);

        {$ENDREGION}

      end;
    end;

  for K := 0 to Result.efdC197.Count - 1 do
  begin
    Result.efdC197.Items[K].vl_bc_icms := RoundTo(VarToFloat(Result.efdC197.Items[K].vl_bc_icms), -2);
    Result.efdC197.Items[K].vl_icms    := RoundTo(VarToFloat(Result.efdC197.Items[K].vl_icms), -2);
  end;

  //for I := 0 to Result.efd1921.Count - 1 do
    //Result.efd1921.Items[K].valor_ajuste := RoundTo(VarToFloat(Result.efd1921.Items[K].valor_ajuste), -2);

end;

end.
