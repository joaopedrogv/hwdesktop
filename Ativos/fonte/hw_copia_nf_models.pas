unit hw_copia_nf_models;

interface

uses
  basefb_class,
  nf_class,
  nf_item_class,
  hw_const_types;

type
  TNaturezaOperacao = (nopNone, nopCompraVenda, nopDevolucao, nopTransferencias, nopEnvioDemonstracao, nopRetornoDemonstracao, nopEnvioConserto, nopRetornoConserto, nopGarantia);

  TNFModel = class;

  TNFProdOrigem = record
  private
    FEmpresaId: Integer;
    FNItem: Integer;
    FNotaFiscalId: Integer;
  public
    class function Create(
      NotaFiscalId, EmpresaId, NItem: Integer
    ): TNFProdOrigem; static;

    property NotaFiscalId: Integer read FNotaFiscalId;
    property EmpresaId: Integer read FEmpresaId;
    property NItem: Integer read FNItem;
  end;

  TNFProd = class(TNf_item_class)
  strict private
    function RateioPorQtdeSel(_value: Variant; _decimais: Smallint = -1): Double;
  private
    Fqtde_sel: Double;
    Fnf_str: string;
    FOwnerNF: TNFModel;
    FOrigemItemNF: TNFProdOrigem;
    procedure SetOrigemItemNF(const Value: TNFProdOrigem);
  public
    procedure CalcularQtdeSel;
    procedure LimparDadosDeVinculos;
    function GetEntOuSai: string;
    function ToCfop(_nop: TNaturezaOperacao): Integer;
    procedure Acumular(payload: TNFProd);

    property OwnerNF: TNFModel write FOwnerNF;
    property OrigemItemNF: TNFProdOrigem read FOrigemItemNF write SetOrigemItemNF;
  published
    property nf_str: string read Fnf_str write Fnf_str;
    property qtde_sel: Double read Fqtde_sel write Fqtde_sel;
  end;

  TNFProdList = class(TBaseFbs_class)
  private
    FOwnerNF: TNFModel;
    function GetItem(Index: Integer): TNFProd;
    procedure SetItem(Index: Integer; const Value: TNFProd);
  public
    function New: TNFProd;
    function FindProd(nfId, nitemNf: Integer): TNFProd; overload;
    function FindProd(grupoProd: Integer; codProd: string): TNFProd; overload;
    procedure AddRange(const payload: TNFProdList);

    property OwnerNF: TNFModel write FOwnerNF;
    property Items[Index: Integer]: TNFProd read GetItem write SetItem;
  end;

  TNFModel = class(TNF_class)
  strict private
    Fprods: TNFProdList;
  public
    constructor Create(Aprods: TNFProdList);

    function ToCfopDevolucao1(_Cfop: Double; _Cst: string): Integer;
    function ToCfop1(_Cfop: Double): Integer;

    property prods: TNFProdList read Fprods write Fprods;
  end;

  TNewCopyProps = class
  private
    FEouS: string;
    FIsDev: Boolean;
    FClienteId: Integer;
    FOnLog: TLogEvent;
    FIsSN: Boolean;
    FNatOp: TNaturezaOperacao;
    FManterCalcTrib: Boolean;
    FAgruparProdutos: Boolean;
    FReferenciarPorItem: Boolean;
  public
    procedure BuildFrom(nota: TNFModel);

    property ClienteId: Integer read FClienteId write FClienteId;
    property EouS: string read FEouS write FEouS;
    property IsDev: Boolean read FIsDev write FIsDev;
    property IsSN: Boolean read FIsSN write FIsSN;
    property NatOp: TNaturezaOperacao read FNatOp write FNatOp;
    property ManterCalcTrib: Boolean read FManterCalcTrib write FManterCalcTrib;
    property AgruparProdutos: Boolean read FAgruparProdutos write FAgruparProdutos;
    property ReferenciarPorItem: Boolean read FReferenciarPorItem write FReferenciarPorItem;

    property OnLog: TLogEvent read FOnLog write FOnLog;
  end;

implementation

uses
  SysUtils,
  Variants,
  Classes,
  StrUtils,
  Math,
  hw_utils;

{ TNFProdList }

function TNFProdList.FindProd(grupoProd: Integer; codProd: string): TNFProd;
var
  iIt: Integer;
begin
  Result := nil;
  for iIt := 0 to Self.Count - 1 do
    if (Self.Items[iIt].grupo_prod = grupoProd) and
      (Trim(Self.Items[iIt].cod_prod) = Trim(codProd)) then
    begin
      Result := Self.Items[iIt];
      Break;
    end;
end;

function TNFProdList.GetItem(Index: Integer): TNFProd;
begin
  Result := TNFProd(inherited Items[Index]);
end;

procedure TNFProdList.AddRange(const payload: TNFProdList);
var
  I: Integer;
begin
  for I := 0 to payload.Count - 1 do
  begin
    payload.Items[I].OwnerNF := FOwnerNF;
    Self.Add(payload.Items[I]);
  end;
end;

function TNFProdList.FindProd(nfId, nitemNf: Integer): TNFProd;
var
  iIt: Integer;
begin
  Result := nil;
  for iIt := 0 to Self.Count - 1 do
    if (Self.Items[iIt].cod_nf = nfId) and
      (Self.Items[iIt].nitem = nitemNf) then
    begin
      Result := Self.Items[iIt];
      Break;
    end;
end;

function TNFProdList.New: TNFProd;
begin
  Result := TNFProd.Create;
  Result.OwnerNF := FOwnerNF;
  Add(Result);
end;

procedure TNFProdList.SetItem(Index: Integer; const Value: TNFProd);
begin
  Put(Index, Value)
end;

{ TNFProd }

procedure TNFProd.Acumular(payload: TNFProd);
begin
  quantidade        := VarToFloat(quantidade) + VarToFloat(payload.quantidade);
  valor_total       := VarToFloat(valor_total) + VarToFloat(payload.valor_total);
  valor_unitario    := VarToFloat(valor_total) / VarToFloat(quantidade);

  base_icm          := VarToFloat(base_icm) + VarToFloat(payload.base_icm);
  valor_icm         := VarToFloat(valor_icm) + VarToFloat(payload.valor_icm);
  base_icmsub       := VarToFloat(base_icmsub) + VarToFloat(payload.base_icmsub);
  valor_icmsub      := VarToFloat(valor_icmsub) + VarToFloat(payload.valor_icmsub);
  valor_icm_stdes   := VarToFloat(valor_icm_stdes) + VarToFloat(payload.valor_icm_stdes);
  base_icmant_sub   := VarToFloat(base_icmant_sub) + VarToFloat(payload.base_icmant_sub);
  valor_icmant_sub  := VarToFloat(valor_icmant_sub) + VarToFloat(payload.valor_icmant_sub);
  base_ipi          := VarToFloat(base_ipi) + VarToFloat(payload.base_ipi);
  valor_ipi         := VarToFloat(valor_ipi) + VarToFloat(payload.valor_ipi);
  rateio_desconto   := VarToFloat(rateio_desconto) + VarToFloat(payload.rateio_desconto);
  rateio_outdesp    := VarToFloat(rateio_outdesp) + VarToFloat(payload.rateio_outdesp);
  rateio_seguro     := VarToFloat(rateio_seguro) + VarToFloat(payload.rateio_seguro);
  rateio_frete      := VarToFloat(rateio_frete) + VarToFloat(payload.rateio_frete);
  rateio_acres_fin  := VarToFloat(rateio_acres_fin) + VarToFloat(payload.rateio_acres_fin);
  rateio_desp_pf    := VarToFloat(rateio_desp_pf) + VarToFloat(payload.rateio_desp_pf);
  qtdembrec         := VarToFloat(qtdembrec) + VarToFloat(payload.qtdembrec);
  vlrembnf          := VarToFloat(vlrembnf) + VarToFloat(payload.vlrembnf);
  vlisento          := VarToFloat(vlisento) + VarToFloat(payload.vlisento);
  vloutras          := VarToFloat(vloutras) + VarToFloat(payload.vloutras);
  vln_trib          := VarToFloat(vln_trib) + VarToFloat(payload.vln_trib);
  base_icm_simples  := VarToFloat(base_icm_simples) + VarToFloat(payload.base_icm_simples);
  valor_icm_simples := VarToFloat(valor_icm_simples) + VarToFloat(payload.valor_icm_simples);
  base_iss          := VarToFloat(base_iss) + VarToFloat(payload.base_iss);
  valor_iss         := VarToFloat(valor_iss) + VarToFloat(payload.valor_iss);
  valor_dif         := VarToFloat(valor_dif) + VarToFloat(payload.valor_dif);
  valor_pis         := VarToFloat(valor_pis) + VarToFloat(payload.valor_pis);
  valor_cofins      := VarToFloat(valor_cofins) + VarToFloat(payload.valor_cofins);
  valor_pis_st      := VarToFloat(valor_pis_st) + VarToFloat(payload.valor_pis_st);
  valor_cofins_st   := VarToFloat(valor_cofins_st) + VarToFloat(payload.valor_cofins_st);
  base_pis          := VarToFloat(base_pis) + VarToFloat(payload.base_pis);
  base_cofins       := VarToFloat(base_cofins) + VarToFloat(payload.base_cofins);
  base_pis_st       := VarToFloat(base_pis_st) + VarToFloat(payload.base_pis_st);
  base_cofins_st    := VarToFloat(base_cofins_st) + VarToFloat(payload.base_cofins_st);
  base_icmsub_ant   := VarToFloat(base_icmsub_ant) + VarToFloat(payload.base_icmsub_ant);
  valor_icmsub_ant  := VarToFloat(valor_icmsub_ant) + VarToFloat(payload.valor_icmsub_ant);
  quant_bc_pis      := VarToFloat(quant_bc_pis) + VarToFloat(payload.quant_bc_pis);
  quant_bc_cofins   := VarToFloat(quant_bc_cofins) + VarToFloat(payload.quant_bc_cofins);
  base_ii           := VarToFloat(base_ii) + VarToFloat(payload.base_ii);
  valor_despadu_ii  := VarToFloat(valor_despadu_ii) + VarToFloat(payload.valor_despadu_ii);
  valor_ii          := VarToFloat(valor_ii) + VarToFloat(payload.valor_ii);
  valor_iof_ii      := VarToFloat(valor_iof_ii) + VarToFloat(payload.valor_iof_ii);
  vtottrib          := VarToFloat(vtottrib) + VarToFloat(payload.vtottrib);
  nfe_vipidevol     := VarToFloat(nfe_vipidevol) + VarToFloat(payload.nfe_vipidevol);
  vbcufdest         := VarToFloat(vbcufdest) + VarToFloat(payload.vbcufdest);
  vfcpufdest        := VarToFloat(vfcpufdest) + VarToFloat(payload.vfcpufdest);
  vicmsufdest       := VarToFloat(vicmsufdest) + VarToFloat(payload.vicmsufdest);
  vicmsufremet      := VarToFloat(vicmsufremet) + VarToFloat(payload.vicmsufremet);
  valor_icm_xml     := VarToFloat(valor_icm_xml) + VarToFloat(payload.valor_icm_xml);
  fcp_vfcp          := VarToFloat(fcp_vfcp) + VarToFloat(payload.fcp_vfcp);
  fcp_vfcpst        := VarToFloat(fcp_vfcpst) + VarToFloat(payload.fcp_vfcpst);
  fcp_vfcpstret     := VarToFloat(fcp_vfcpstret) + VarToFloat(payload.fcp_vfcpstret);
  fcp_vbcfcp        := VarToFloat(fcp_vbcfcp) + VarToFloat(payload.fcp_vbcfcp);
  fcp_vbcfcpst      := VarToFloat(fcp_vbcfcpst) + VarToFloat(payload.fcp_vbcfcpst);
  fcp_vbcfcpstret   := VarToFloat(fcp_vbcfcpstret) + VarToFloat(payload.fcp_vbcfcpstret);
  fcp_vbcfcpufdest  := VarToFloat(fcp_vbcfcpufdest) + VarToFloat(payload.fcp_vbcfcpufdest);
  vicmdeson         := VarToFloat(vicmdeson) + VarToFloat(payload.vicmdeson);
  vicmsdif          := VarToFloat(vicmsdif) + VarToFloat(payload.vicmsdif);
  vfcpdif           := VarToFloat(vfcpdif) + VarToFloat(payload.vfcpdif);
  vicmsop_dif       := VarToFloat(vicmsop_dif) + VarToFloat(payload.vicmsop_dif);
  vfcpefet_dif      := VarToFloat(vfcpefet_dif) + VarToFloat(payload.vfcpefet_dif);
  vpisdeson         := VarToFloat(vpisdeson) + VarToFloat(payload.vpisdeson);
  vcofinsdeson      := VarToFloat(vcofinsdeson) + VarToFloat(payload.vcofinsdeson);
  qbcmono           := VarToFloat(qbcmono) + VarToFloat(payload.qbcmono);
  adremicms         := VarToFloat(adremicms) + VarToFloat(payload.adremicms);
  vicmsmono         := VarToFloat(vicmsmono) + VarToFloat(payload.vicmsmono);
  qbcmonoreten      := VarToFloat(qbcmonoreten) + VarToFloat(payload.qbcmonoreten);
  adremicmsreten    := VarToFloat(adremicmsreten) + VarToFloat(payload.adremicmsreten);
  vicmsmonoreten    := VarToFloat(vicmsmonoreten) + VarToFloat(payload.vicmsmonoreten);
  qbcmonoret        := VarToFloat(qbcmonoret) + VarToFloat(payload.qbcmonoret);
  adremicmsret      := VarToFloat(adremicmsret) + VarToFloat(payload.adremicmsret);
  vicmsmonoret      := VarToFloat(vicmsmonoret) + VarToFloat(payload.vicmsmonoret);
  vbcretfed         := VarToFloat(vbcretfed) + VarToFloat(payload.vbcretfed);
  vretir            := VarToFloat(vretir) + VarToFloat(payload.vretir);
  vretcsll          := VarToFloat(vretcsll) + VarToFloat(payload.vretcsll);
  vretpis           := VarToFloat(vretpis) + VarToFloat(payload.vretpis);
  vretcofins        := VarToFloat(vretcofins) + VarToFloat(payload.vretcofins);
end;

procedure TNFProd.CalcularQtdeSel;
begin
  // Sempre que alterar o atributo qtde_sel chamar esse metodo para fazer os rateios

  valor_total       := RateioPorQtdeSel(valor_total, 2);
  base_icm          := RateioPorQtdeSel(base_icm, 2);
  valor_icm         := RateioPorQtdeSel(valor_icm, 2);
  base_icmsub       := RateioPorQtdeSel(base_icmsub, 2);
  valor_icmsub      := RateioPorQtdeSel(valor_icmsub, 2);
  valor_icm_stdes   := RateioPorQtdeSel(valor_icm_stdes, 2);
  base_icmant_sub   := RateioPorQtdeSel(base_icmant_sub, 2);
  valor_icmant_sub  := RateioPorQtdeSel(valor_icmant_sub, 2);
  base_ipi          := RateioPorQtdeSel(base_ipi, 2);
  valor_ipi         := RateioPorQtdeSel(valor_ipi, 2);
  rateio_desconto   := RateioPorQtdeSel(rateio_desconto, 2);
  rateio_outdesp    := RateioPorQtdeSel(rateio_outdesp, 2);
  rateio_seguro     := RateioPorQtdeSel(rateio_seguro, 2);
  rateio_frete      := RateioPorQtdeSel(rateio_frete, 2);
  rateio_acres_fin  := RateioPorQtdeSel(rateio_acres_fin, 2);
  rateio_desp_pf    := RateioPorQtdeSel(rateio_desp_pf, 2);
  qtdembrec         := RateioPorQtdeSel(qtdembrec);
  vlrembnf          := RateioPorQtdeSel(vlrembnf, 2);
  vlisento          := RateioPorQtdeSel(vlisento, 2);
  vloutras          := RateioPorQtdeSel(vloutras, 2);
  vln_trib          := RateioPorQtdeSel(vln_trib, 2);
  base_icm_simples  := RateioPorQtdeSel(base_icm_simples, 2);
  valor_icm_simples := RateioPorQtdeSel(valor_icm_simples, 2);
  base_iss          := RateioPorQtdeSel(base_iss, 2);
  valor_iss         := RateioPorQtdeSel(valor_iss, 2);
  valor_dif         := RateioPorQtdeSel(valor_dif, 2);
  valor_pis         := RateioPorQtdeSel(valor_pis, 2);
  valor_cofins      := RateioPorQtdeSel(valor_cofins, 2);
  valor_pis_st      := RateioPorQtdeSel(valor_pis_st, 2);
  valor_cofins_st   := RateioPorQtdeSel(valor_cofins_st, 2);
  base_pis          := RateioPorQtdeSel(base_pis, 2);
  base_cofins       := RateioPorQtdeSel(base_cofins, 2);
  base_pis_st       := RateioPorQtdeSel(base_pis_st, 2);
  base_cofins_st    := RateioPorQtdeSel(base_cofins_st, 2);
  base_icmsub_ant   := RateioPorQtdeSel(base_icmsub_ant, 2);
  valor_icmsub_ant  := RateioPorQtdeSel(valor_icmsub_ant, 2);
  quant_bc_pis      := RateioPorQtdeSel(quant_bc_pis);
  quant_bc_cofins   := RateioPorQtdeSel(quant_bc_cofins);
  base_ii           := RateioPorQtdeSel(base_ii, 2);
  valor_despadu_ii  := RateioPorQtdeSel(valor_despadu_ii, 2);
  valor_ii          := RateioPorQtdeSel(valor_ii, 2);
  valor_iof_ii      := RateioPorQtdeSel(valor_iof_ii, 2);
  vtottrib          := RateioPorQtdeSel(vtottrib, 2);
  nfe_vipidevol     := RateioPorQtdeSel(nfe_vipidevol, 2);
  vbcufdest         := RateioPorQtdeSel(vbcufdest, 2);
  vfcpufdest        := RateioPorQtdeSel(vfcpufdest, 2);
  vicmsufdest       := RateioPorQtdeSel(vicmsufdest, 2);
  vicmsufremet      := RateioPorQtdeSel(vicmsufremet, 2);
  valor_icm_xml     := RateioPorQtdeSel(valor_icm_xml, 2);
  fcp_vfcp          := RateioPorQtdeSel(fcp_vfcp, 2);
  fcp_vfcpst        := RateioPorQtdeSel(fcp_vfcpst, 2);
  fcp_vfcpstret     := RateioPorQtdeSel(fcp_vfcpstret, 2);
  fcp_vbcfcp        := RateioPorQtdeSel(fcp_vbcfcp, 2);
  fcp_vbcfcpst      := RateioPorQtdeSel(fcp_vbcfcpst, 2);
  fcp_vbcfcpstret   := RateioPorQtdeSel(fcp_vbcfcpstret, 2);
  fcp_vbcfcpufdest  := RateioPorQtdeSel(fcp_vbcfcpufdest, 2);
  vicmdeson         := RateioPorQtdeSel(vicmdeson, 2);
  vicmsdif          := RateioPorQtdeSel(vicmsdif, 2);
  vfcpdif           := RateioPorQtdeSel(vfcpdif, 2);
  vicmsop_dif       := RateioPorQtdeSel(vicmsop_dif, 2);
  vfcpefet_dif      := RateioPorQtdeSel(vfcpefet_dif, 2);
  vpisdeson         := RateioPorQtdeSel(vpisdeson, 2);
  vcofinsdeson      := RateioPorQtdeSel(vcofinsdeson, 2);
  qbcmono           := RateioPorQtdeSel(qbcmono);
  adremicms         := RateioPorQtdeSel(adremicms, 2);
  vicmsmono         := RateioPorQtdeSel(vicmsmono, 2);
  qbcmonoreten      := RateioPorQtdeSel(qbcmonoreten);
  adremicmsreten    := RateioPorQtdeSel(adremicmsreten, 2);
  vicmsmonoreten    := RateioPorQtdeSel(vicmsmonoreten, 2);
  qbcmonoret        := RateioPorQtdeSel(qbcmonoret);
  adremicmsret      := RateioPorQtdeSel(adremicmsret, 2);
  vicmsmonoret      := RateioPorQtdeSel(vicmsmonoret, 2);
  vbcretfed         := RateioPorQtdeSel(vbcretfed, 2);
  vretir            := RateioPorQtdeSel(vretir, 2);
  vretcsll          := RateioPorQtdeSel(vretcsll, 2);
  vretpis           := RateioPorQtdeSel(vretpis, 2);
  vretcofins        := RateioPorQtdeSel(vretcofins, 2);

  quantidade := IfThen(qtde_sel > 0, qtde_sel, VarToFloat(quantidade));

end;

function TNFProd.GetEntOuSai: string;
begin
  Result := IfThen(MatchText(FloatToStr(codigo_nop)[1], ['1','2','3']), 'E', 'S');
end;

procedure TNFProd.LimparDadosDeVinculos;
begin
  nped              := Null;
  tipo_ped          := '';
  nitem_ped         := Null;
  cod_nf_dev        := Null;
  nitem_dev         := Null;
  seq_devolucao     := Null;
  cod_nfce          := Null;
  terminal          := Null;
  ncupom            := Null;
  nserieecf         := '';
  data_cupom        := Null;
  //xped_compra       := '';
  //nitemped_compra   := Null;
  cod_cred_ret_fin  := Null;
  bx_retorno_fin    := '';
  ant_calc          := '';
  aliq_icm_xml      := Null;
  valor_icm_xml     := Null;
  espelho_calc_st   := '';
  icms_recomposicao := Null;
  vretir            := Null;
  vretcsll          := Null;
  vretpis           := Null;
  vretcofins        := Null;
  vbcretfed         := Null;

  if Assigned(espelho_calc) then
    espelho_calc.Clear;

  import_xml          := 'N';
  ucom                := '';
  qcom                := Null;
  vuncom              := Null;
  nitem_xml           := Null;
  icm_orig            := '';
  icm_cst             := '';
  icm_csosn           := '';
  icm_pred            := Null;
  icm_vbc             := Null;
  icm_vicm            := Null;
  icm_vbcfcp          := Null;
  icm_pfcp            := Null;
  icm_vfcp            := Null;
  icm_modbcst         := '';
  icm_pmvast          := Null;
  icm_predbcst        := Null;
  icm_vbcst           := Null;
  icm_picmst          := Null;
  icm_vicmst          := Null;
  icm_vbcfcpst        := Null;
  icm_pfcpst          := Null;
  icm_vfcpst          := Null;
  icm_vicmdeson       := Null;
  icm_vbcstret        := Null;
  icm_pst             := Null;
  icm_vicmssubstituto := Null;
  icm_vicmsstret      := Null;
  icm_vbcfcpstret     := Null;
  icm_pfcpstret       := Null;
  icm_vfcpstret       := Null;
  icm_pdif            := Null;
  icm_vicmsdif        := Null;
  icm_qbcmono         := Null;
  icm_vicmsmono       := Null;
  icm_adremicms       := Null;
  icm_qbcmonoreten    := Null;
  icm_vicmsmonoreten  := Null;
  icm_adremicmsreten  := Null;
  icm_qbcmonoret      := Null;
  icm_vicmsmonoret    := Null;
  icm_adremicmsret    := Null;

end;

function TNFProd.RateioPorQtdeSel(_value: Variant; _decimais: Smallint): Double;
begin
  Result := VarToFloat(_value);

  if (qtde_sel > 0) and (quantidade > 0) then
    Result := Result / quantidade * qtde_sel;

  if _decimais >= 0 then
    Result := RoundTo(Result, 0 - _decimais);
end;

procedure TNFProd.SetOrigemItemNF(const Value: TNFProdOrigem);
begin
  FOrigemItemNF := Value;
end;

function TNFProd.ToCfop(_nop: TNaturezaOperacao): Integer;
const
  stTrib: array[1..4] of string = ('1','3','6','7');
var
  _sCfop, _s1, _s234: string;
  _Cst: string;
begin
  _s1 := IfThen(FOwnerNF.natureza_nf = 'E',
                IfThen(FOwnerNF.nfe_iddest = '3', '3', IfThen(FOwnerNF.nfe_iddest = '2', '2', '1')),
                IfThen(FOwnerNF.nfe_iddest = '3', '7', IfThen(FOwnerNF.nfe_iddest = '2', '6', '5')));

  _Cst := IfThen(Length(cst) = 3, cst[2]) +
          IfThen(Length(cst) = 2, cst[1]);

//TNaturezaOperacao = (nopNone, nopCompraVenda, nopDevolucao, nopTransferencias, nopEnvioConserto, nopRetornoConserto, nopGarantia, nopEnvioDemonstracao, nopRetornoDemonstracao);

  case _nop of
    nopCompraVenda:
      _s234 := IfThen(MatchText(_Cst, stTrib), '403', '102');

    nopDevolucao:
      _s234 := IfThen(MatchText(_Cst, ['1' , '3', '6', '7']), '411', '202');

    nopTransferencias:
      _s234 := IfThen(MatchText(_Cst, ['1' , '3', '6', '7']), '409', '152');

    nopEnvioDemonstracao:
      _s234 := '912';

    nopRetornoDemonstracao:
      _s234 := '913';

    nopEnvioConserto:
      _s234 := '915';

    nopRetornoConserto:
      _s234 := '916';

    nopGarantia:
      _s234 := '949';

    else
    begin
      _s234 := Copy(FloatToStr(Self.codigo_nop), 2, 3);
      if MatchText(_s1, ['1', '2', '6', '7']) and (_s234 = '405') then
        _s234 := '403';
    end;
  end;

  _sCfop := _s1 + _s234;

  Result := StrToInt(_sCfop);
end;

{ TNFModel }

constructor TNFModel.Create(Aprods: TNFProdList);
begin
  inherited Create;
  Fprods := Aprods;
  Fprods.OwnerNF := Self;
end;

function TNFModel.ToCfop1(_Cfop: Double): Integer;
var
  _sCfop, _s1, _s234: string;
begin
  _s1 := IfThen(Self.natureza_nf = 'E',
                IfThen(Self.nfe_iddest = '3', '3', IfThen(Self.nfe_iddest = '2', '2', '1')),
                IfThen(Self.nfe_iddest = '3', '7', IfThen(Self.nfe_iddest = '2', '6', '5')));

  _s234 := Copy(FloatToStr(_Cfop), 2, 3);
  if MatchText(_s1, ['6', '7']) and (_s234 = '405') then
    _s234 := '403';

  _sCfop := _s1 + _s234;

  Result := StrToInt(_sCfop);
end;

function TNFModel.ToCfopDevolucao1(_Cfop: Double; _Cst: string): Integer;
var
  _sCfop, _s1, _s234: string;
begin
  _s1 := IfThen(Self.natureza_nf = 'E',
                IfThen(Self.nfe_iddest = '3', '3', IfThen(Self.nfe_iddest = '2', '2', '1')),
                IfThen(Self.nfe_iddest = '3', '7', IfThen(Self.nfe_iddest = '2', '6', '5')));
  
  _Cst := IfThen(Length(_Cst) = 3, _Cst[2]) +
          IfThen(Length(_Cst) = 2, _Cst[1]);

  _s234 := IfThen(MatchText(_Cst, ['1' , '3', '6', '7']), '411', '202');

  _sCfop := _s1 + _s234;

  Result := StrToInt(_sCfop);
end;

{ TNewCopyProps }

procedure TNewCopyProps.BuildFrom(nota: TNFModel);
var
  sCFOP: string;
begin
  Self.ClienteId := nota.cod_cliente;
  Self.EouS      := nota.natureza_nf;
  Self.IsDev     := nota.tipo_emissao = '4';
  Self.IsSN      := nota.crt = '1';
  Self.EouS      := nota.natureza_nf;

  sCFOP := Copy(FloatToStr(VarToFloat(nota.codigo_nop)), 2, 3);

  if nota.tipo_emissao = '4' then
    Self.NatOp   := nopDevolucao

  else if MatchText(sCFOP, ['409', '152']) then
    Self.NatOp   := nopTransferencias

  else if MatchText(sCFOP, ['912']) then
    Self.NatOp   := nopEnvioDemonstracao

  else if MatchText(sCFOP, ['913']) then
    Self.NatOp   := nopRetornoDemonstracao

  else if MatchText(sCFOP, ['915']) then
    Self.NatOp   := nopEnvioConserto

  else if MatchText(sCFOP, ['916']) then
    Self.NatOp   := nopRetornoConserto

  else if MatchText(sCFOP, ['949']) then
    Self.NatOp   := nopGarantia

  else
    Self.NatOp   := nopNone;
end;

{ TNFProdOrigem }

class function TNFProdOrigem.Create(NotaFiscalId, EmpresaId,
  NItem: Integer): TNFProdOrigem;
begin
  Result.FNotaFiscalId := NotaFiscalId;
  Result.FEmpresaId := EmpresaId;
  Result.FNItem := NItem;
end;

initialization
  RegisterClass(TNFProd);
finalization
  UnRegisterClass(TNFProd);

end.
