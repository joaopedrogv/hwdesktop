unit uClassesSpedPISCOFINS;

interface

uses
  StdCtrls, ComCtrls, IBQuery, Classes, IBDataBase, ACBrSpedPISCOFINS, uSpedHw, dbclient;

type
  TSpedPISCOFINS = class(TSpedHw)
  private
    FIndicadorSituacaoEspecial: string;
    FNumeroReciboAnterior: string;
    FSPED_C481_LIQ: string;
    FSPED_REGISTROS_LIQ: string;     
    FCOD_REC_M205, FCOD_REC_M605: string;
    FVL_TOT_CRED_DESC_ANT_PIS, FVL_TOT_CRED_DESC_ANT_COFINS: Currency;
    FVL_TOT_RETENC_DESC_ANT_PIS, FVL_TOT_RETENC_DESC_ANT_COFINS: Currency;
    FValorRetFuturo_Pis , FValorRetFuturo_Cofins : Currency;

    FVF600VL_RET_PIS, FVF600VL_RET_COFINS: Currency;

    FRecBrutaNaoCumExp: Currency;
    FRecBrutaNaoCumMI: Currency;
    FRecBrutaNaoCumNaoTBMi: Currency;
    FRecBrutaCum: Currency;
    FRecBrutaTotal: Currency;

    FEmpresas: TStringList;
    F1010: TStringList;
    F1020: TStringList;
    FM410: TStringList;

    procedure montaRegistro0140(pCOD_EST: string);
    procedure montaRegistro1010(pCOD_ACAO_JUDICIAL: Integer);
    procedure montaRegistro1020(pCOD_ADM: Integer);
    procedure acumulaRegistroM410(pCST, pCOD_CTA, pDESC_COMPL, pNAT_REC : string; pVL_REC: Currency);
    function permiteCreditoPISCOFINS(COD_NF, COD_EMPRESA: Integer): Boolean;

    procedure _montarBloco0(pCNPJ: string);
    procedure __montarBloco0;
    procedure __montarBlocoA;
    procedure __montarBlocoC;
    procedure __montarBlocoD;
    procedure __montarBlocoF;
    procedure __montarBlocoM;
    procedure __montarBloco1;

    procedure _verifica0110;
    procedure gravaRetencoes;
  public
    function abreFormSPEDPISCOFINS(EndBanco: string): boolean; overload;
    function abreFormSPEDPISCOFINS(EndBanco, pCNPJ: string): boolean; overload;
    destructor Destroy; override;
    constructor create;
    function iniciaSpedPISCOFINS(pCNPJ: string): boolean;
    function verificarPISCOFINSCupons(pCodEmpresa: string; pLabelTemp: TLabel): boolean; overload;
    function verificarPISCOFINSCupons(pCodEmpresa, pNSerieECF: string; pCodTerminal: integer; pLabelTemp: TLabel): boolean; overload;
    procedure _verificarCreditosPISCOFINS(pEmApuracao: Boolean; pVrDebitoPIS, pVrDebitoCOFINS: Currency; pAno: Integer = 0);
    procedure _verificarRetencoesPISCOFINS(pEmApuracao: Boolean; pVrDebitoPIS, pVrDebitoCOFINS: Currency; pAno: Integer = 0);
    procedure _abreDemostrativoDoPeriodo;
    procedure _abreDetalhesCreditosPISCOFINS;
    procedure _abreDetalhesRetencoesPISCOFINS;
    function _validarRegistrarCreditosPISCOFIS: Boolean;
    function _validarRegistrarRetencaoPISCOFIS: Boolean;
    function _validarRegistrarHistoricoCreditosPISCOFIS: Boolean;
    function _validarRegistrarHistoricoRetencoesPISCOFIS: Boolean;

    property IndicadorSituacaoEspecial: string read FIndicadorSituacaoEspecial write
      FIndicadorSituacaoEspecial;
    property NumeroReciboAnterior: string read FNumeroReciboAnterior write FNumeroReciboAnterior;

    property RecBrutaNaoCumMI: Currency read FRecBrutaNaoCumMI write FRecBrutaNaoCumMI;
    property RecBrutaNaoCumNaoTBMi: Currency read FRecBrutaNaoCumNaoTBMi write FRecBrutaNaoCumNaoTBMi;
    property RecBrutaNaoCumExp: Currency read FRecBrutaNaoCumExp write FRecBrutaNaoCumExp;
    property RecBrutaCum: Currency read FRecBrutaCum write FRecBrutaCum;
    property RecBrutaTotal: Currency read FRecBrutaTotal write FRecBrutaTotal;
  var
    FLabelEmpresas: TLabel;
  end;

implementation

uses
  Forms, uFormSpedPISCOFINS, SysUtils, ACBrEPCBloco_0, DB, ACBrEPCBlocos,
  ACBRSpedPISCOFINSUtilHw, ACBrEPCBloco_A, ACBrEPCBloco_C, ACBrEPCBloco_1,
  ACBrEPCBloco_D, ACBrEPCBloco_F, DateUtils, ACBrEPCBloco_M,
  ACBrEPCBloco_M_Class, Contnrs, Windows, ACBrEPCBloco_A_Class, IBScript, 
  uCreditosPISCOFINS, Controls, uHistCreditosPISCOFINS, Variants, ACBrEPCBloco_F_Class,
  uHistRetencoesPISCOFINS, uRetencoesPISCOFINS, uDemostrativoCredRetPISCOFINS;

{ TSpedPISCOFINS }

function TSpedPISCOFINS.abreFormSPEDPISCOFINS(EndBanco: string): boolean;
begin
  Application.CreateForm(TfrmSpedPISCOFINS, frmSpedPISCOFINS);
  try
    //frmSpedPISCOFINS.vCodEmpresa := codEmpresa;
    frmSpedPISCOFINS.vEndBanco := EndBanco;
    frmSpedPISCOFINS.ShowModal;
  finally
    frmSpedPISCOFINS.Free;
    frmSpedPISCOFINS := nil;
  end;
end;

function TSpedPISCOFINS.abreFormSPEDPISCOFINS(EndBanco, pCNPJ: string): boolean;
begin 
  Application.CreateForm(TfrmSpedPISCOFINS, frmSpedPISCOFINS);
  try
    frmSpedPISCOFINS.vCNPJ := pCNPJ;
    frmSpedPISCOFINS.vEndBanco := EndBanco;
    frmSpedPISCOFINS.ShowModal;
  finally
    frmSpedPISCOFINS.Free;
    frmSpedPISCOFINS := nil;
  end;
end;

procedure TSpedPISCOFINS.acumulaRegistroM410(pCST, pCOD_CTA, pDESC_COMPL,
  pNAT_REC: string; pVL_REC: Currency);
var
  I: Integer;
  vrTemp: Currency;
begin
  for I := 0 to FM410.Count - 1 do
    if (getCampoPipe(FM410[I], 1) = Trim(pCST)) and
      (getCampoPipe(FM410[I], 2) = Trim(pCOD_CTA)) and
      (getCampoPipe(FM410[I], 3) = Trim(pDESC_COMPL)) and
      (getCampoPipe(FM410[I], 4) = Trim(pNAT_REC)) then
    begin
      vrTemp := StrToFloat(getCampoPipe(FM410[I], 5));
      FM410[I] := Trim(pCST) + '|' + Trim(pCOD_CTA) + '|' + Trim(pDESC_COMPL) + '|' +
        Trim(pNAT_REC) + '|' + Format('%0.2f', [pVL_REC + vrTemp]) + '|' ;
      Exit;
    end;
  FM410.Add((pCST) + '|' + Trim(pCOD_CTA) + '|' + Trim(pDESC_COMPL) + '|' +
    Trim(pNAT_REC) + '|' + Format('%0.2f', [pVL_REC]) + '|');
end;

constructor TSpedPISCOFINS.create;
begin
  FSpedP := TACBrSPEDPisCofins.Create(Application);
  FSpedP.TrimString := True;
  FSpedP.CurMascara := '#0.00';
  FSpedP.Delimitador := '|';

  FParticipantes := TStringList.Create;
  FEmpresas := TStringList.Create;
  F0190 := TStringList.Create;
  F0200 := TStringList.Create;
  F0400 := TStringList.Create;
  F0450 := TStringList.Create;
  FC400 := TStringList.Create;
  FM410 := TStringList.Create;

  F1010 := TStringList.Create;
  F1020 := TStringList.Create;

  vConexao := TIBDatabase.Create(Application);
  vTransacao := TIBTransaction.Create(Application);
  vTransacao.Params.Add('read_committed');
  vTransacao.Params.Add('rec_version');
  vTransacao.Params.Add('nowait');

  vTransacaoAux := TIBTransaction.Create(Application);
  vTransacaoAux.Params.Add('read_committed');
  vTransacaoAux.Params.Add('rec_version');
  vTransacaoAux.Params.Add('nowait');

  vTransacao.DefaultDatabase := vConexao;
  vTransacaoAux.DefaultDatabase := vConexao;
  vConexao.Connected := False;
  vConexao.DefaultTransaction := vTransacao;
  vConexao.LoginPrompt := false;
  vConexao.Params.Add('user_name=sysdba');
  vConexao.Params.Add('password=masterkey');

  vNivel0 := TIBQuery.Create(Application);
  vNivel0.Database := vConexao;
  vNivel0.Transaction := vTransacao;
  vNivel2 := TIBQuery.Create(Application);
  vNivel2.Database := vConexao;
  vNivel2.Transaction := vTransacao;
  vNivel3 := TIBQuery.Create(Application);
  vNivel3.Database := vConexao;
  vNivel3.Transaction := vTransacao;
  vNivel4 := TIBQuery.Create(Application);
  vNivel4.Database := vConexao;
  vNivel4.Transaction := vTransacao;
  vNivel5 := TIBQuery.Create(Application);
  vNivel5.Database := vConexao;
  vNivel5.Transaction := vTransacao;
  vNivel6 := TIBQuery.Create(Application);
  vNivel6.Database := vConexao;
  vNivel6.Transaction := vTransacao;
  vQrAux := TIBQuery.Create(Application);
  vQrAux.Database := vConexao;
  vQrAux.Transaction := vTransacao;
  vQrAux1 := TIBQuery.Create(Application);
  vQrAux1.Database := vConexao;
  vQrAux1.Transaction := vTransacao;

  SpedFiscalOuPisCofins := 'PC';
end;

destructor TSpedPISCOFINS.Destroy;
begin
  vNivel0.Free; vNivel2.Free; vNivel3.Free; vNivel4.Free; vNivel5.Free;
  vNivel6.Free; vTransacao.Free; vTransacaoAux.Free; vConexao.Free; vQrAux.Free; vQrAux1.Free;

  vNivel0 := nil; vNivel2 := nil; vNivel3 := nil; vNivel4 := nil; vNivel5 := nil;
  vNivel6 := nil; vTransacao := nil; vTransacaoAux := nil; vConexao := nil; vQrAux := nil; vQrAux1
  := nil;

  if FCreditosAnteriores <> nil then
  begin
    FCreditosAnteriores.Free;
    FCreditosAnteriores := nil;
  end;

  if FCreditosAnterioresHistorico <> nil then
  begin
    FCreditosAnterioresHistorico.Free;
    FCreditosAnterioresHistorico := nil;
  end;

  if FRetencoesAnteriores <> nil then
  begin
    FRetencoesAnteriores.Free;
    FRetencoesAnteriores := nil;
  end;

  if FRetencoesAnterioresHistorico <> nil then
  begin
    FRetencoesAnterioresHistorico.Free;
    FRetencoesAnterioresHistorico := nil;
  end;
  
  inherited;
end;

function TSpedPISCOFINS.iniciaSpedPISCOFINS(pCNPJ: string): boolean;
var
  vIntegerTemp: Integer;
begin

  //  vEnderecoBanco := 'c:\basesauto\motomol\hwauto.fdb';
  //  FCodEmpresa := '1';
  if not conectarBanco then
  begin
    exit;
  end;

  if FRefazerCalculoPISCOFINS then
    FRefazerCalculoPISCOFINS := Application.MessageBox('Deseja mesmo refazer todos os cálculos do PIS e COFINS', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = ID_YES;

  FParticipantes.Clear;
  F0190.Clear;
  F0200.Clear;
  F0400.Clear;
  F0450.Clear;
  FC400.Clear;

  FSpedP.Path := ExtractFilePath(FDestino);
  FSpedP.Arquivo := ExtractFileName(FDestino);
  FSpedP.TrimString := True;

  //  FSpedP.DT_INI := StrToDate(DataIni);
  //  FSpedP.DT_FIN := StrToDate(DataFim);
  //  FSpedP.LinhasBuffer := 1000;
  //  FSpedP.IniciaGeracao;

  FLabelBloco.Caption := 'Bloco 0';
  FLabelStatus.Caption := 'Iniciando';

  FSpedP.Bloco_A.RegistroA001New.IND_MOV := imSemDados;
  FSpedP.Bloco_C.RegistroC001New.IND_MOV := imSemDados;
  FSpedP.Bloco_D.RegistroD001New.IND_MOV := imSemDados;
  FSpedP.Bloco_F.RegistroF001New.IND_MOV := imSemDados;
  FSpedP.Bloco_M.RegistroM001New.IND_MOV := imSemDados;
  FSpedP.Bloco_1.Registro1001New.IND_MOV := imSemDados;

  apagarSpedItem;
  if vBloco0 then
    _montarBloco0(pCNPJ);

  if Trim(FCodEmpresa) = '' then
    Exit;
  
  try
    vIntegerTemp := 0;
    vNivel2.Close;
    vNivel2.SQL.Text :=
      'select e.cod_empresa COD_EST, e.nome_emp NOME, e.cgc_emp CNPJ, es.sigla_uf UF,' +
      ' e.ibge_cod_cidade COD_MUN, e.im_emp IM, e.sped_suframa SUFRAMA' +
      ' from empresa e' +
      ' inner join estados es on es.codigo_uf = e.uf_emp' +
      ' where e.gerar_sped_piscofins = ''S''' +
      ' and e.cgc_emp like ' + QuotedStr(FCNPJGrupo + '%') +
      ' order by cod_empresa';
    vNivel2.Open;
    vNivel2.FetchAll;
    if FRefazerCalculoPISCOFINS then
    begin
      vNivel2.First;
      while not vNivel2.Eof do
      begin
        FCodEmpresa := vNivel2.FieldByName('COD_EST').AsString;
        _zerarDadosSpedPISCOFINS;
        vNivel2.Next;
      end;
    end;

    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FParticipantes.Clear;
      F0190.Clear;
      F0200.Clear;
      F0400.Clear;
      F0450.Clear;
      FC400.Clear;

      FCodEmpresa := vNivel2.FieldByName('COD_EST').AsString;
      inc(vIntegerTemp);
      FLabelEmpresas.Caption := 'Verificando Empresa ' + IntToStr(vIntegerTemp) + ' de ' +
        IntToStr(vNivel2.RecordCount) +
        '. ' + vNivel2.FieldByName('nome').AsString;
      montaRegistro0140(FCodEmpresa);
      __montarBloco0;
      if vBlocoA then
        __montarBlocoA;
      if vBlocoC then
        __montarBlocoC;
      if vBlocoD then
        __montarBlocoD;
      if vBlocoF then
        __montarBlocoF;

      montaRegistro0200;
      vNivel2.Next;
    end;

    if vBlocoM then
      __montarBlocoM;
    if vBloco1 then
      __montarBloco1;

  finally
    vNivel2.Close;
  end;

  FLabelStatus.Caption := 'Finalizando';

  FSpedP.DT_INI := StrToDate(DataIni);
  FSpedP.DT_FIN := StrToDate(DataFim);
  FSpedP.LinhasBuffer := 1000;

  FSpedP.SaveFileTXT;

  gravaCreditoDoPeriodo;

  gravaRetencoes;

  _abreDemostrativoDoPeriodo;

//  _verifica0110;

  FLabelCupons.Caption := '';

  FLabelStatus.Caption := 'Finalizado';
end;

procedure TSpedPISCOFINS.montaRegistro0140(pCOD_EST: string);
var
  I: Integer;
begin
  for I := 0 to FEmpresas.Count - 1 do
    if (getCampoPipe(FEmpresas[I], 1) = pCOD_EST) then
    begin
      FCNPJEmpresa := getCampoPipe(FEmpresas[i], 2);
      exit;
    end;

  vQrAux.Close;
  vQrAux.SQL.Text :=
    'select e.cod_empresa COD_EST, e.nome_emp NOME, e.cgc_emp CNPJ, es.sigla_uf UF,' +
    ' e.ie_emp IE, e.ibge_cod_cidade COD_MUN, e.im_emp IM, e.sped_suframa SUFRAMA, e.ind_apur_ipi' +
    ' from empresa e' +
    ' inner join estados es on es.codigo_uf = e.uf_emp' +
    ' where e.cod_empresa = :cod_empresa';
  vQrAux.ParamByName('cod_empresa').AsString := pCOD_EST;
  vQrAux.Open;
  try
    with FSpedP.Bloco_0.Registro0140New do
    begin
      COD_EST := Trim(vQrAux.FieldByName('COD_EST').AsString);
      NOME := Trim(vQrAux.FieldByName('NOME').AsString);
      CNPJ := Trim(vQrAux.FieldByName('CNPJ').AsString);
      UF := Trim(vQrAux.FieldByName('UF').AsString);
      IE := Trim(vQrAux.FieldByName('IE').AsString);
      COD_MUN := vQrAux.FieldByName('COD_MUN').AsInteger;
      IM := Trim(vQrAux.FieldByName('IM').AsString);
      SUFRAMA := Trim(vQrAux.FieldByName('SUFRAMA').AsString);
      FEmpresas.Add(COD_EST + '|' + CNPJ + '|');
      FCNPJEmpresa := CNPJ;
      FInd_apur_ipi := IntToStr(vQrAux.FieldByName('ind_apur_ipi').AsInteger);
    end;
  finally
    vQrAux.Close;
  end;
end;

procedure TSpedPISCOFINS.montaRegistro1010(pCOD_ACAO_JUDICIAL: Integer);
var
  I: Integer;
begin
  for I := 0 to F1010.Count - 1 do
    if (getCampoPipe(F1010[I], 1) = IntToStr(pCOD_ACAO_JUDICIAL)) then
      exit;

  vQrAux.Close;
  vQrAux.SQL.Text :=
    'select * from SPED_PROC_REF_ACAO_JUDICIAL' +
    ' where cod_acao_judicial = ' + IntToStr(pCOD_ACAO_JUDICIAL);
  vQrAux.Open;

  if vQrAux.IsEmpty then
    Exit;

  try
    FSpedP.Bloco_1.Registro1001New.IND_MOV := imComDados;

    with FSpedP.Bloco_1.Registro1010New do
    begin
      NUM_PROC := Trim(vQrAux.FieldByName('NUM_PROC').AsString);
      ID_SEC_JUD := Trim(vQrAux.FieldByName('ID_SEC_JUD').AsString);
      ID_VARA := Trim(vQrAux.FieldByName('ID_VARA').AsString);
      IND_NAT_ACAO := StrToInt(Trim(vQrAux.FieldByName('IND_NAT_ACAO').AsString));
      DESC_DEC_JUD := Trim(vQrAux.FieldByName('DESC_DEC_JUD').AsString);
      DT_SENT_JUD := vQrAux.FieldByName('DT_SENT_JUD').AsDateTime;
      F1010.Add( IntToStr(pCOD_ACAO_JUDICIAL) + '|');
    end;
  finally
    vQrAux.Close;
  end;
end;

procedure TSpedPISCOFINS.montaRegistro1020(pCOD_ADM: Integer);
var
  I: Integer;
begin
  for I := 0 to F1020.Count - 1 do
    if (getCampoPipe(F1020[I], 1) = IntToStr(pCOD_ADM)) then
      exit;

  vQrAux.Close;
  vQrAux.SQL.Text :=
    'select * from SPED_PROC_REF_ADMINISTRATIVO' +
    ' where cod_adm = ' + IntToStr(pCOD_ADM);
  vQrAux.Open;

  if vQrAux.IsEmpty then
    Exit;

  try
    FSpedP.Bloco_1.Registro1001New.IND_MOV := imComDados;

    with FSpedP.Bloco_1.Registro1020New do
    begin
      NUM_PROC := Trim(vQrAux.FieldByName('NUM_PROC').AsString);
      IND_NAT_ACAO := StrToInt(Trim(vQrAux.FieldByName('IND_NAT_ACAO').AsString));
      DT_DEC_ADM := vQrAux.FieldByName('DT_DEC_ADM').AsDateTime;
      F1020.Add( IntToStr(pCOD_ADM) + '|');
    end;
  finally
    vQrAux.Close;
  end;
end;

function TSpedPISCOFINS.permiteCreditoPISCOFINS(COD_NF,
  COD_EMPRESA: Integer): Boolean;
var
  ValorCredito: Double;
begin
  Result := False;
  ValorCredito := 0;
  vQrAux.Close;
  vQrAux.SQL.Text :=
    'select nfi.nitem NUM_ITEM, nfi.tipo_item , nfi.grupo_prod, nfi.cod_prod,' +
    ' nfi.cod_servico, nfi.chassi,  nfi.num_fab_prod, nfi.descricao_item DESCR_COMPL,' +
    ' nfi.descricao_item_outras, nfi.quantidade QTD, nfi.referencia UNID,' +
    ' nfi.valor_total VL_ITEM, nfi.rateio_desconto VL_DESC, nfi.IND_MOV, nfi.altera_estoque_cfop,' +
    ' case when (nfi.tipo_item = ''S'') then ''041''' +
    '   else nfi.cst' +
    ' end CST_ICMS, nfi.csosn, nfi.codigo_nop CFOP, nfi.codigo_nop COD_NAT,' +
    ' nfi.base_icm VL_BC_ICMS, nfi.aliq_icm ALIQ_ICMS, nfi.valor_icm VL_ICMS,' +
    ' nfi.base_icmsub VL_BC_ICMS_ST, nfi.aliq_icmsub ALIQ_ST,' +
    ' nfi.valor_icmsub VL_ICMS_ST, nfi.cst_ipi, '''' COD_ENQ,' +
    ' nfi.base_ipi VL_BC_IPI, nfi.aliq_ipi ALIQ_IPI, nfi.valor_ipi VL_IPI,' +
    ' nfi.cst_pis, nfi.base_pis VL_BC_PIS, nfi.aliq_pis, nfi.quant_bc_pis, nfi.aliq_pis_quant,' +
    ' nfi.valor_pis VL_PIS, nfi.cst_cofins, nfi.base_cofins VL_BC_COFINS, nfi.aliq_cofins,' +
    ' nfi.quant_bc_cofins, nfi.aliq_cofins_quant,' +
    ' nfi.valor_cofins VL_COFINS, nfi.BASE_ISS VL_BC_ISSQN, nfi.ALIQ_ISS ALIQ_ISSQN,' +
    ' nfi.VALOR_ISS VL_ISSQN, null COD_CTA, nfi.nat_rec, nt.credito_pis_cofins, nt.receita_pis_cofins, nfi.cod_nf_dev,' +
    ' nfi.rateio_seguro, nfi.rateio_outdesp, nfi.rateio_frete ' +
    ' from notafiscal_item nfi' +
    ' inner join nat_op nt on nt.codigo_nop = nfi.codigo_nop' +
    //' inner join nat_op nt on nt.codigo_nop = nfi.codigo_nop and ((not nt.nat_bc_cred is null) and (rtrim(nt.nat_bc_cred) <> ''''))' +
    ' where nfi.cod_nf = :cod_nf and' +
    ' nfi.cod_empresa = :cod_empresa order by nfi.nitem';
  vQrAux.ParamByName('cod_nf').AsInteger := COD_NF;
  vQrAux.ParamByName('cod_empresa').AsInteger := COD_EMPRESA;
  vQrAux.Open;

  vQrAux.First;
  while not vQrAux.Eof do
  begin
    if ((vQrAux.FieldByName('credito_pis_cofins').AsString = 'S') and (vQrAux.FieldByName('CFOP').AsFloat < 3000)) then
      if vQrAux.FieldByName('VL_COFINS').AsFloat > 0 then
      begin
        Result := True;
        vQrAux.Close;
        Exit;
      end;
    vQrAux.Next;
  end;
end;

function TSpedPISCOFINS.verificarPISCOFINSCupons(pCodEmpresa,
  pNSerieECF: string; pCodTerminal: integer; pLabelTemp: TLabel): boolean;
var
  i: Integer;
  vOk: Boolean;
begin
  FCodEmpresa := pCodEmpresa;
  
  conectarBanco;
  
  vNivel0.Close;
  vNivel0.SQL.Text :=
    'select e.nome_emp NOME, e.cgc_emp CNPJ, es.sigla_uf UF, e.ibge_cod_cidade COD_MUN,' +
    ' e.sped_suframa SUFRAMA, e.sped_ind_nat_pj IND_NAT_PJ, E.sped_ind_ativ IND_ATIV,' +
    ' e.sped_cod_inc_trib COD_INC_TRIB, e.sped_ind_apro_cred IND_APRO_CRED,' +
    ' e.sped_cod_tipo_cont COD_TIPO_CONT, e.cod_contador, e.pis_emp, e.cofins_emp, e.regime,' +
    ' e.cod_empresa from empresa e' +
    ' inner join estados es on es.codigo_uf = e.uf_emp' +
    ' where e.cod_empresa = ' + FCodEmpresa ;
  vNivel0.Open;
  if vNivel0.IsEmpty then
  begin
    Result := False;
    Exit;
  end
  else
  begin
    FRegime := Trim(vNivel0.FieldByName('regime').AsString);
    FAliqPIS := vNivel0.FieldByName('pis_emp').AsCurrency;
    FAliqCOFINS := vNivel0.FieldByName('cofins_emp').AsCurrency;
    FCodEmpresa := vNivel0.FieldByName('cod_empresa').AsString;
    FIncidTribPISCOFINS := vNivel0.FieldByName('COD_INC_TRIB').AsString;
  end;

  verificaCamposNullCupom(Trim(pNSerieECF), pCodTerminal);

  _verificaPISCOFINSCupomFiscal(Trim(pNSerieECF), pCodTerminal);

  FLabelStatus.Caption := 'Finalizando';
end;

function TSpedPISCOFINS.verificarPISCOFINSCupons(pCodEmpresa: string;
  pLabelTemp: TLabel): boolean;
var
  i: Integer;
  vOk: Boolean;
begin
  FCodEmpresa := pCodEmpresa;
  
  conectarBanco;
  
  vNivel0.Close;
  vNivel0.SQL.Text :=
    'select e.nome_emp NOME, e.cgc_emp CNPJ, es.sigla_uf UF, e.ibge_cod_cidade COD_MUN,' +
    ' e.sped_suframa SUFRAMA, e.sped_ind_nat_pj IND_NAT_PJ, E.sped_ind_ativ IND_ATIV,' +
    ' e.sped_cod_inc_trib COD_INC_TRIB, e.sped_ind_apro_cred IND_APRO_CRED,' +
    ' e.sped_cod_tipo_cont COD_TIPO_CONT, e.cod_contador, e.pis_emp, e.cofins_emp, e.regime,' +
    ' e.cod_empresa from empresa e' +
    ' inner join estados es on es.codigo_uf = e.uf_emp' +
    ' where e.cod_empresa = ' + FCodEmpresa ;
  vNivel0.Open;
  if vNivel0.IsEmpty then
  begin
    Result := False;
    Exit;
  end
  else
  begin
    FRegime := Trim(vNivel0.FieldByName('regime').AsString);
    FAliqPIS := vNivel0.FieldByName('pis_emp').AsCurrency;
    FAliqCOFINS := vNivel0.FieldByName('cofins_emp').AsCurrency;
    FCodEmpresa := vNivel0.FieldByName('cod_empresa').AsString;
    FIncidTribPISCOFINS := vNivel0.FieldByName('COD_INC_TRIB').AsString;
  end;

  //verificaCamposNullCupom();
  FLabelStatus.Caption := 'Abrindo terminais';
  vNivel2.Close;
  vNivel2.SQL.Text := 'select ''2D'' COD_MOD, cniee.modelo_ecf ECF_MOD, ti.num_serie_ecf ECF_FAB,'
    +
    ' ti.cod_terminal ECF_CX from terminal_impressoras ti' +
    ' inner join impressoras_cniee cniee on cniee.identificacao = ti.ident_cniee' +
    ' where cod_empresa = :cod_empresa order by 4';
  vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.Open;
  vNivel2.FetchAll;

  i:= 0;
  vNivel2.First;
  while not vNivel2.Eof do
  begin
    Application.ProcessMessages;
    Inc(i);
    pLabelTemp.Caption := 'Verificando terminal. ' + IntToStr(i) +' de ' +IntToStr(vNivel2.RecordCount)  ;
    verificaCamposNullCupom(Trim(vNivel2.FieldByName('ECF_FAB').AsString),
      vNivel2.FieldByName('ECF_CX').AsInteger);

    _verificaPISCOFINSCupomFiscal(Trim(vNivel2.FieldByName('ECF_FAB').AsString),
      vNivel2.FieldByName('ECF_CX').AsInteger);
    vNivel2.Next;
  end;

  pLabelTemp.Caption := 'Verificando Notas Fiscais';
  verificaPISCOFINSNotaFiscal;

  FLabelStatus.Caption := 'Finalizando';


end;

procedure TSpedPISCOFINS._abreDemostrativoDoPeriodo;
begin

  if FCreditosAnteriores.IsEmpty and FRetencoesAnteriores.IsEmpty then
    Exit;

  Application.CreateForm(TfrmDemostrativoCredRetPISCOFINS, frmDemostrativoCredRetPISCOFINS);
  frmDemostrativoCredRetPISCOFINS.DataSource1.DataSet := FCreditosAnteriores;
  frmDemostrativoCredRetPISCOFINS.DataSource2.DataSet := FRetencoesAnteriores;
  frmDemostrativoCredRetPISCOFINS.ShowModal;
  frmDemostrativoCredRetPISCOFINS.DataSource1.DataSet := nil;
  frmDemostrativoCredRetPISCOFINS.DataSource2.DataSet := nil;
  frmDemostrativoCredRetPISCOFINS.free;
  frmDemostrativoCredRetPISCOFINS := nil;
end;

procedure TSpedPISCOFINS._abreDetalhesCreditosPISCOFINS;
var
  I: Integer;
begin
  if FCreditosAnteriores = nil then
    Exit;

  if FCreditosAnteriores.IsEmpty then
    Exit;

  vQrAux.Close;
  vQrAux.SQL.Text := 'select * from sped_creditos_periodo_util ' +
    ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = :sped' +
    ' order by ano_util, mes_util';
  vQrAux.ParamByName('ano').AsInteger := FCreditosAnteriores.FieldByName('ano').AsInteger;
  vQrAux.ParamByName('mes').AsInteger := FCreditosAnteriores.FieldByName('mes').AsInteger;
  vQrAux.ParamByName('cnpj').AsString := FCreditosAnteriores.FieldByName('cnpj').AsString;
  vQrAux.ParamByName('sped').AsString := FCreditosAnteriores.FieldByName('sped').AsString;
  vQrAux.Open;

  if FCreditosAnterioresHistorico = nil then
  begin
    FCreditosAnterioresHistorico := TClientDataSet.Create(Application);
    for I := 0 to vQrAux.FieldCount - 1 do
      FCreditosAnterioresHistorico.FieldDefs.Add(
        vQrAux.Fields[i].FieldName,
        vQrAux.Fields[i].DataType,
        vQrAux.Fields[i].Size,
        False);
    FCreditosAnterioresHistorico.FieldDefs.Add('TIPO_SITUACAO', ftString, 1, False);
    FCreditosAnterioresHistorico.CreateDataSet;
    FCreditosAnterioresHistorico.FieldByName('ANO_UTIL').DisplayWidth := 4;
    FCreditosAnterioresHistorico.FieldByName('MES_UTIL').DisplayWidth := 2;
    TFloatField(FCreditosAnterioresHistorico.FieldByName('VALOR_PIS_UTIL')).DisplayFormat := '##0.00';
    TFloatField(FCreditosAnterioresHistorico.FieldByName('VALOR_COFINS_UTIL')).DisplayFormat := '##0.00';
    FCreditosAnterioresHistorico.IndexFieldNames := 'ANO_UTIL;MES_UTIL';
  end;
  FCreditosAnterioresHistorico.EmptyDataSet;
  vQrAux.First;
  while not vQrAux.Eof do
  begin
    FCreditosAnterioresHistorico.Insert;
    for I := 0 to vQrAux.FieldCount - 1 do
      FCreditosAnterioresHistorico.FieldByName(vQrAux.Fields[i].FieldName).Value :=
        vQrAux.FieldByName(vQrAux.Fields[i].FieldName).Value;
    FCreditosAnterioresHistorico.Post;
    vQrAux.Next;
  end;

  if frmHistCreditosPISCOFINS <> nil then
    Exit;

  Application.CreateForm(TfrmHistCreditosPISCOFINS, frmHistCreditosPISCOFINS);
  frmHistCreditosPISCOFINS.DataSource1.DataSet := FCreditosAnterioresHistorico;
  frmHistCreditosPISCOFINS.fDataSetP := TClientDataSet(FCreditosAnteriores);
  frmHistCreditosPISCOFINS.SpedPC := TSpedPISCOFINS(Self);
  frmHistCreditosPISCOFINS.ShowModal;
  _verificarCreditosPISCOFINS(False, 0, 0, FCreditosAnteriores.FieldByName('ANO').AsInteger);
  frmHistCreditosPISCOFINS.free;
  frmHistCreditosPISCOFINS := nil;
end;

procedure TSpedPISCOFINS._abreDetalhesRetencoesPISCOFINS;
var
  I: Integer;
begin
  if FRetencoesAnteriores = nil then
    Exit;

  if FRetencoesAnteriores.IsEmpty then
    Exit;

  vQrAux.Close;
  vQrAux.SQL.Text := 'select * from sped_pc_retencao_periodo_util ' +
    ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = :sped' +
    ' order by ano_util, mes_util';
  vQrAux.ParamByName('ano').AsInteger := FRetencoesAnteriores.FieldByName('ano').AsInteger;
  vQrAux.ParamByName('mes').AsInteger := FRetencoesAnteriores.FieldByName('mes').AsInteger;
  vQrAux.ParamByName('cnpj').AsString := FRetencoesAnteriores.FieldByName('cnpj').AsString;
  vQrAux.ParamByName('sped').AsString := FRetencoesAnteriores.FieldByName('sped').AsString;
  vQrAux.Open;

  if FRetencoesAnterioresHistorico = nil then
  begin
    FRetencoesAnterioresHistorico := TClientDataSet.Create(Application);
    for I := 0 to vQrAux.FieldCount - 1 do
      FRetencoesAnterioresHistorico.FieldDefs.Add(
        vQrAux.Fields[i].FieldName,
        vQrAux.Fields[i].DataType,
        vQrAux.Fields[i].Size,
        False);
    FRetencoesAnterioresHistorico.FieldDefs.Add('TIPO_SITUACAO', ftString, 1, False);
    FRetencoesAnterioresHistorico.CreateDataSet;
    FRetencoesAnterioresHistorico.FieldByName('ANO_UTIL').DisplayWidth := 4;
    FRetencoesAnterioresHistorico.FieldByName('MES_UTIL').DisplayWidth := 2;
    TFloatField(FRetencoesAnterioresHistorico.FieldByName('VALOR_PIS_UTIL')).DisplayFormat := '##0.00';
    TFloatField(FRetencoesAnterioresHistorico.FieldByName('VALOR_COFINS_UTIL')).DisplayFormat := '##0.00';
    FRetencoesAnterioresHistorico.IndexFieldNames := 'ANO_UTIL;MES_UTIL';
  end;
  FRetencoesAnterioresHistorico.EmptyDataSet;
  vQrAux.First;
  while not vQrAux.Eof do
  begin
    FRetencoesAnterioresHistorico.Insert;
    for I := 0 to vQrAux.FieldCount - 1 do
      FRetencoesAnterioresHistorico.FieldByName(vQrAux.Fields[i].FieldName).Value :=
        vQrAux.FieldByName(vQrAux.Fields[i].FieldName).Value;
    FRetencoesAnterioresHistorico.Post;
    vQrAux.Next;
  end;

  if frmHistRetencoesPISCOFINS <> nil then
    Exit;

  Application.CreateForm(TfrmHistRetencoesPISCOFINS, frmHistRetencoesPISCOFINS);
  frmHistRetencoesPISCOFINS.DataSource1.DataSet := FRetencoesAnterioresHistorico;
  frmHistRetencoesPISCOFINS.fDataSetP := TClientDataSet(FRetencoesAnteriores);
  frmHistRetencoesPISCOFINS.SpedPC := TSpedPISCOFINS(Self);
  frmHistRetencoesPISCOFINS.ShowModal;
  _verificarRetencoesPISCOFINS(False, 0, 0, FRetencoesAnteriores.FieldByName('ANO').AsInteger);
  frmHistRetencoesPISCOFINS.free;
  frmHistRetencoesPISCOFINS := nil;
end;

procedure TSpedPISCOFINS.gravaRetencoes;
var
  vGravar: Boolean;
  vSql: string;
  vCNPJ: string;
begin
  vCNPJ := Trim(Copy(Trim(FCNPJEmpresa), 1, 8));

  if Trim(vCNPJ) = '' then
    Exit;

  vQrAux.Close;
  vQrAux.SQL.Text := 'select cnpj, valor_pis, valor_cofins from SPED_PC_RETENCAO_PERIODO' +
    ' where sped = ' + QuotedStr('PC') +
    ' and cnpj = ' + QuotedStr(vCNPJ) +
    ' and mes = :mes and ano = :ano';
  vQrAux.ParamByName('mes').AsInteger := MonthOf(StrToDate(FDataFim));
  vQrAux.ParamByName('ano').AsInteger := YearOf(StrToDate(FDataFim));
  vQrAux.Open;

  if not vQrAux.IsEmpty then
    if (StrToFloatFormat(vQrAux.FieldByName('valor_pis').AsFloat, 2) <> StrToFloatFormat(FValorRetFuturo_Pis, 2)) or
    (StrToFloatFormat(vQrAux.FieldByName('valor_cofins').AsFloat, 2) <> StrToFloatFormat(FValorRetFuturo_Cofins, 2)) then
      if Application.MessageBox(PChar('Valor da Retenção de PIS ou COFINS do mês ' + IntToStr(MonthOf(StrToDate(FDataFim))) +
        ' de ' + IntToStr(YearOf(StrToDate(FDataFim))) + ' (período desta apuração) difere do já gravado' + #13 + #13 +
        'PIS já gravado: ' + Format('%0.2n', [vQrAux.FieldByName('valor_pis').AsFloat]) + #13 +
        'PIS do período: ' + Format('%0.2n', [FValorRetFuturo_Pis]) + #13 + #13 +
        'COFINS já gravado: ' + Format('%0.2n', [vQrAux.FieldByName('valor_cofins').AsFloat]) + #13 +
        'COFINS do período: ' + Format('%0.2n', [FValorRetFuturo_Cofins]) + #13 + #13 +
        'Deseja gravar os valores do período apurado agora?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

  if vQrAux.IsEmpty then
    vSql := 'insert into SPED_PC_RETENCAO_PERIODO (SPED, CNPJ, MES, ANO, VALOR_PIS, VALOR_COFINS)' +
      ' values (:SPED, :CNPJ, :MES, :ANO, :VALOR_PIS, :VALOR_COFINS)'
  else
    vSql := 'update SPED_PC_RETENCAO_PERIODO set VALOR_PIS = :VALOR_PIS, VALOR_COFINS = :VALOR_COFINS' +
      ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO';
  vQrAux.Close;
  vQrAux.SQL.Text := vSql;
  vQrAux.ParamByName('SPED').AsString := 'PC';
  vQrAux.ParamByName('CNPJ').AsString := vCNPJ;
  vQrAux.ParamByName('MES').AsInteger := MonthOf(StrToDate(FDataFim));
  vQrAux.ParamByName('ANO').AsInteger := YearOf(StrToDate(FDataFim));
  vQrAux.ParamByName('VALOR_PIS').AsFloat := FValorRetFuturo_Pis;
  vQrAux.ParamByName('VALOR_COFINS').AsFloat := FValorRetFuturo_Cofins;
  vQrAux.ExecSQL;

  if vQrAux.Transaction.InTransaction then
    vQrAux.Transaction.Commit;

  vQrAux.Close;
  vQrAux.SQL.Text := 'select cnpj, valor_pis, valor_cofins from SPED_PC_RETENCAO_PERIODO' +
    ' where sped = ' + QuotedStr('PC') +
    ' and cnpj = ' + QuotedStr(vCNPJ) +
    ' and mes = :mes and ano = :ano';
  vQrAux.ParamByName('mes').AsInteger := MonthOf(IncMonth(StrToDate(FDataIni), -1));
  vQrAux.ParamByName('ano').AsInteger := YearOf(IncMonth(StrToDate(FDataIni), -1));
  vQrAux.Open;

  if FCreditosAnteriores <> nil then
  begin
    try
      FRetencoesAnteriores.Filter := 'PIS_AT_UTIL > 0 OR COFINS_AT_UTIL > 0';
      FRetencoesAnteriores.Filtered := True;

      FRetencoesAnteriores.First;
      while not FRetencoesAnteriores.Eof do
      begin
        vQrAux.Close;
        vQrAux.SQL.Text := 'insert into SPED_PC_RETENCAO_PERIODO_UTIL (SPED, CNPJ, MES, ANO, MES_UTIL, ANO_UTIL, VALOR_PIS_UTIL, VALOR_COFINS_UTIL)' +
          ' values (:SPED, :CNPJ, :MES, :ANO, :MES_UTIL, :ANO_UTIL, :VALOR_PIS_UTIL, :VALOR_COFINS_UTIL)';
        vQrAux.ParamByName('SPED').AsString := 'PC';
        vQrAux.ParamByName('CNPJ').AsString := vCNPJ;
        vQrAux.ParamByName('MES').AsInteger := FRetencoesAnteriores.FieldByName('MES').AsInteger;
        vQrAux.ParamByName('ANO').AsInteger := FRetencoesAnteriores.FieldByName('ANO').AsInteger;
        vQrAux.ParamByName('MES_UTIL').AsInteger := MonthOf(StrToDate(FDataIni));
        vQrAux.ParamByName('ANO_UTIL').AsInteger := YearOf(StrToDate(FDataIni));
        vQrAux.ParamByName('VALOR_PIS_UTIL').AsFloat := FRetencoesAnteriores.FieldByName('PIS_AT_UTIL').AsFloat;
        vQrAux.ParamByName('VALOR_COFINS_UTIL').AsFloat := FRetencoesAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat;
        vQrAux.ExecSQL;

        if vQrAux.Transaction.InTransaction then
          vQrAux.Transaction.Commit;
        FRetencoesAnteriores.Next;
      end;
    finally
      FRetencoesAnteriores.Filter := '';
      FRetencoesAnteriores.Filtered := False;
    end;
  end;
  vQrAux.Close;
end;

procedure TSpedPISCOFINS._montarBloco0(pCNPJ: string);
var
  vOK: Boolean;
  vListTmp : TStringList;
  vScriptTemp : TIBScript;
  I: Integer;

  procedure setCFOPDevolucao;
  begin
    vNivel0.Close;
    vNivel0.SQL.Text := 'select codigo_nop from nat_op where devolucao_sped = ''S''';
    try
      vNivel0.Open;
    except
      try
        vScriptTemp := TIBScript.Create(Application);
        vScriptTemp.Database := vConexao;
        vScriptTemp.Transaction := vTransacao;

        try
          vScriptTemp.Script.Text := 'ALTER TABLE NAT_OP ADD DEVOLUCAO_SPED CHAR(1) DEFAULT ''N'';';
          vScriptTemp.ExecuteScript;
        except
        end;
        if vScriptTemp.Transaction.InTransaction then
          vScriptTemp.Transaction.Commit;
        vNivel0.Open;
      finally
        vScriptTemp.Free;
        vScriptTemp := nil;
      end;
    end;
    if not vNivel0.IsEmpty then
    begin
      cfopDevolucaoCompra := '';
      cfopDevolucaoVenda := '';

      vNivel0.First;
      while not vNivel0.Eof do
      begin
        if vNivel0.FieldByName('codigo_nop').AsFloat > 3000 then
          cfopDevolucaoVenda := cfopDevolucaoVenda + IntToStr(Trunc(vNivel0.FieldByName('codigo_nop').AsFloat)) + '|'
        else
          cfopDevolucaoCompra :=  cfopDevolucaoCompra + IntToStr(Trunc(vNivel0.FieldByName('codigo_nop').AsFloat)) + '|';
        vNivel0.Next;
      end;
    end;
  end;

begin
  //zerando variaveis
  FValorRetFuturo_Pis    := 0;
  FValorRetFuturo_Cofins := 0;


  FLabelStatus.Caption := 'Montando registro 0000';
  Application.ProcessMessages;
  setCFOPDevolucao;

  FCNPJGrupo := Trim(Copy(Trim(pCNPJ),1,8));
  vNivel0.Close;
  vNivel0.SQL.Text :=
    'select e.nome_emp NOME, e.cgc_emp CNPJ, es.sigla_uf UF, e.ibge_cod_cidade COD_MUN,' +
    ' e.sped_suframa SUFRAMA, e.sped_ind_nat_pj IND_NAT_PJ, E.sped_ind_ativ IND_ATIV,' +
    ' e.sped_cod_inc_trib COD_INC_TRIB, e.sped_ind_apro_cred IND_APRO_CRED,' +
    ' e.sped_cod_tipo_cont COD_TIPO_CONT, e.cod_contador, e.pis_emp, e.cofins_emp, e.regime,' +
    ' e.cod_empresa, e.SPED_IND_REG_CUM, e.SPED_P_COD_REC_PIS, e.SPED_P_COD_REC_COFINS  from empresa e' +
    ' inner join estados es on es.codigo_uf = e.uf_emp' +
    ' where e.gerar_sped_piscofins = ''S'' and e.sped_matriz_filial = ''M''' +
    ' and e.cgc_emp like ' + QuotedStr(FCNPJGrupo + '%') + ' order by e.cod_empresa';

  try
    vNivel0.Open;
  except
    try
      vScriptTemp := TIBScript.Create(Application);
      vScriptTemp.Database := vConexao;
      vScriptTemp.Transaction := vTransacao;

      vListTmp := TStringList.Create;
      vListTmp.Text :=
        'ALTER TABLE EMPRESA ADD SPED_P_COD_REC_PIS VARCHAR(6);' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_P_COD_REC_COFINS VARCHAR(6);';

      for I := 0 to vListTmp.Count - 1 do
        try
          vScriptTemp.Script.Text := vListTmp[I];
          vScriptTemp.ExecuteScript;
        except
        end;
      if vScriptTemp.Transaction.InTransaction then
        vScriptTemp.Transaction.Commit;
      vNivel0.Open;
    finally
      vScriptTemp.Free;
      vScriptTemp := nil;
    end;
  end;

  if vNivel0.IsEmpty then
  begin
    //Tratar arqui mensagem ou log
    Application.MessageBox(pchar(
        'Não foi encontrado no banco de dados nenhuma empresa configurada para gerar o arquivo' + #13 +
        'Verifique no cadastro da Empresa!'), 'Atenção', 0 + 64);
  end
  else
  begin
    montaRegistro0140(vNivel0.FieldByName('cod_empresa').AsString);
    FRegime := Trim(vNivel0.FieldByName('regime').AsString);
    FAliqPIS := vNivel0.FieldByName('pis_emp').AsCurrency;
    FAliqCOFINS := vNivel0.FieldByName('cofins_emp').AsCurrency;
    FCodEmpresa := vNivel0.FieldByName('cod_empresa').AsString;
    FCOD_REC_M205 := vNivel0.FieldByName('SPED_P_COD_REC_PIS').AsString;
    FCOD_REC_M605 := vNivel0.FieldByName('SPED_P_COD_REC_COFINS').AsString;
    if Trim(FCodEmpresa) = '' then
    begin
      Application.MessageBox(pchar(
        'Não foi encontrado no banco de dados nenhuma empresa configurada para gerar o arquivo' + #13 +
        'Verifique no cadastro da Empresa!'), 'Atenção', 0 + 64);
    end;
    FIncidTribPISCOFINS := vNivel0.FieldByName('COD_INC_TRIB').AsString;
    FIndicadorRegimeCumulativo := 0;
    if FIncidTribPISCOFINS = '2' then
    begin
      if (FRegime <> 'LUCRO PRESUMIDO') then
        Application.MessageBox('Regime da empresa não confere com a configuração do SPED. Verifique', 'Atenção', 0 + 64);
      FIndicadorRegimeCumulativo := vNivel0.FieldByName('SPED_IND_REG_CUM').AsInteger;
    end;

    if (Trim(FCOD_REC_M205) = '') or (Trim(FCOD_REC_M605) = '') then
    begin
      if vListTmp = nil then
        vListTmp := TStringList.Create;
      vListTmp.Clear;
      if (Trim(FCOD_REC_M205) = '') and (Trim(FCOD_REC_M605) = '') then
      begin
        vListTmp.Add('Os códigos da receita referente à contribuição a recolher detalhada nos registros M205 e M605 não foram configurados');
        vListTmp.Add('O sistema por padrão irá adotar os seguintes codigos na criação do arquivo');
      end
      else if (Trim(FCOD_REC_M205) = '') then
      begin
        vListTmp.Add('O código da receita referente à contribuição a recolher detalhada no registro M205 não foi configurado');
        vListTmp.Add('O sistema por padrão irá adotar o seguinte codigo na criação do arquivo');
      end
      else if (Trim(FCOD_REC_M605) = '') then
      begin
        vListTmp.Add('O código da receita referente à contribuição a recolher detalhada no registro M605 não foi configurado');
        vListTmp.Add('O sistema por padrão irá adotar o seguinte codigo na criação do arquivo');
      end;
      if (Trim(FCOD_REC_M205) = '') and (FIncidTribPISCOFINS = '2') then
        vListTmp.Add('M205: 810902 - PIS/Pasep - Faturamento - PJ em geral (cumulativo)')
      else if (Trim(FCOD_REC_M205) = '') then
        vListTmp.Add('M205: 691201 - PIS/Pasep - Não cumulativo');
      if (Trim(FCOD_REC_M605) = '') and (FIncidTribPISCOFINS = '2') then
        vListTmp.Add('M605: 217201 - Cofins - Faturamento - PJ em geral (cumulativo)')
      else if (Trim(FCOD_REC_M605) = '') then
        vListTmp.Add('M605: 585601 - Cofins - Não cumulativa');
      Application.MessageBox(pchar(vListTmp.Text), 'Atenção', 64);
    end;
  end;

  with FSpedP.Bloco_0.Registro0000New do
  begin
    if StrToDate(DataIni) >= StrToDate('01/07/2012') then
      COD_VER := vlVersao201
    else
      COD_VER := vlVersao101;
    if FFinalidade = 'Substituto' then
      TIPO_ESCRIT := tpEscrRetificadora
    else
      TIPO_ESCRIT := tpEscrOriginal;
    if copy(FIndicadorSituacaoEspecial, 1, 1) <> 'N' then //vNivel0.FieldByName('sss').AsString
      IND_SIT_ESP := _StrToIndicadorSituacaoEspecial(copy(FIndicadorSituacaoEspecial, 1, 1));
    NUM_REC_ANTERIOR := Trim(FNumeroReciboAnterior);
    DT_INI := StrToDate(FDataIni);
    DT_FIN := StrToDate(FDataFim);
    NOME := Trim(vNivel0.FieldByName('NOME').AsString);
    CNPJ := Trim(vNivel0.FieldByName('CNPJ').AsString);
    FCNPJGrupo := Trim(Copy(CNPJ, 1, 8));
    UF := Trim(vNivel0.FieldByName('UF').AsString);
    COD_MUN := vNivel0.FieldByName('COD_MUN').AsInteger;
    SUFRAMA := Trim(vNivel0.FieldByName('SUFRAMA').AsString);
    IND_NAT_PJ := _StrToIndicadorNaturezaPJ(vNivel0.FieldByName('IND_NAT_PJ').AsString);
    IND_ATIV := _StrToIndicadorAtividade(vNivel0.FieldByName('IND_ATIV').AsString);
  end;

  with FSpedP.Bloco_0.Registro0001New do
    IND_MOV := imComDados;

  try
    FSPED_C481_LIQ := 'N';
    FSPED_REGISTROS_LIQ := 'N';
    vNivel2.Close;
    vNivel2.SQL.Text :=
      'select e.SPED_C481_LIQ, SPED_REGISTROS_LIQ from empresa e' +
      ' where e.gerar_sped_piscofins = ''S'' and e.sped_matriz_filial = ''M''' +
      ' and e.cod_empresa = :cod_empresa';
    vNivel2.ParamByName('cod_empresa').AsInteger := vNivel0.FieldByName('cod_empresa').AsInteger;
    vNivel2.Open;
    FSPED_C481_LIQ := Trim(vNivel2.FieldByName('SPED_C481_LIQ').AsString);
    FSPED_REGISTROS_LIQ := Trim(vNivel2.FieldByName('SPED_REGISTROS_LIQ').AsString);
  except
    FSPED_C481_LIQ := 'N';
    FSPED_REGISTROS_LIQ := 'N';
  end;

  vNivel2.Close;
  vNivel2.SQL.Text :=
    'select ct.nome_cont NOME, ct.cpfcnpj_cont CPF, ct.crc, ct.cnpj_escritorio CNPJ,' +
    ' ct.cep_cont CEP, ct.endereco_cont "END", ct.numero NUM, ct.complemento COMPL,' +
    ' ct.bairro_cont BAIRRO, ct.fone_cont FONE, ct.fax_cont FAX, ct.email_cont EMAIL,' +
    ' cd.ibge_cod_cidade COD_MUN' +
    ' from contador ct' +
    ' inner join empresa em on em.cod_empresa = ct.cod_empresa and em.cod_contador = ct.cod_contador' +
    ' left join cidades cd on cd.cod_cidade = ct.cod_cidade' +
    ' where ct.cod_contador = :cod_contador and ct.cod_empresa = :cod_empresa';
  vNivel2.ParamByName('cod_contador').AsInteger := vNivel0.FieldByName('cod_contador').AsInteger;
  vNivel2.ParamByName('cod_empresa').AsInteger := vNivel0.FieldByName('cod_empresa').AsInteger;
  vNivel2.Open; //adicionar o campo cod_empresa

  with FSpedP.Bloco_0.Registro0100New do
  begin
    NOME := Trim(vNivel2.FieldByName('NOME').AsString);
    CPF := Trim(vNivel2.FieldByName('CPF').AsString);
    CRC := Trim(vNivel2.FieldByName('CRC').AsString);
    CNPJ := Trim(vNivel2.FieldByName('CNPJ').AsString);
    CEP := Trim(vNivel2.FieldByName('CEP').AsString);
    ENDERECO := Trim(vNivel2.FieldByName('END').AsString);
    NUM := Copy(Trim(vNivel2.FieldByName('NUM').AsString),1,10);
    COMPL := Trim(vNivel2.FieldByName('COMPL').AsString);
    BAIRRO := Trim(vNivel2.FieldByName('BAIRRO').AsString);
    FONE := Trim(vNivel2.FieldByName('FONE').AsString);
    FAX := Trim(vNivel2.FieldByName('FAX').AsString);
    EMAIL := Trim(vNivel2.FieldByName('EMAIL').AsString);
    if vNivel2.FieldByName('COD_MUN').AsString <> '' then
      COD_MUN := vNivel2.FieldByName('COD_MUN').AsInteger;
  end;               

  FRecBrutaNaoCumMI := 0;
  FRecBrutaNaoCumNaoTBMi := 0;
  FRecBrutaNaoCumExp:=0;
  FRecBrutaCum:=0;
  FRecBrutaTotal:= 0;
  with FSpedP.Bloco_0.Registro0110New do
  begin
    COD_INC_TRIB := _StrToCodIndIncTributaria(vNivel0.FieldByName('COD_INC_TRIB').AsString);
    IND_APRO_CRED := _StrToIndAproCred(vNivel0.FieldByName('IND_APRO_CRED').AsString);
    COD_TIPO_CONT := _StrToCodIndTipoCon(vNivel0.FieldByName('COD_TIPO_CONT').AsString);
    if vNivel0.FieldByName('COD_INC_TRIB').AsString = '2' then    
      IND_REG_CUM := _StrToCodIndCritEscrit(IntToStr(vNivel0.FieldByName('SPED_IND_REG_CUM').AsInteger));
    if IND_APRO_CRED = indMetodoDeRateioProporcional then
      with FSpedP.Bloco_0.Registro0111New do
      begin
        REC_BRU_NCUM_TRIB_MI := FRecBrutaNaoCumMI;
        REC_BRU_NCUM_NT_MI := FRecBrutaNaoCumNaoTBMi;
        REC_BRU_NCUM_EXP := FRecBrutaNaoCumExp;
        REC_BRU_CUM := FRecBrutaCum;
        REC_BRU_TOTAL := FRecBrutaTotal;
      end;
  end;
  if Trim(FCodEmpresa) = '' then
    Exit;

  FLabelStatus.Caption := 'Montando registro 0500 - Plano de Contas Contábil';
  vNivel2.Close;
  vNivel2.SQL.Text :=
    'select pc.dt_alt,  pc.cod_nat_cc, pc.ind_cta, pc.nivel, pc.cod_cta, pc.nome_cta' +
    ' from p_contas_contabil pc where pc.cod_empresa = :cod_empresa and sped = ''S''';
  vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.Open;

  vNivel2.FetchAll;

  FProgressBar.Min := 0;
  FProgressBar.Max := vNivel2.RecordCount;
  FProgressBar.Position := 1;

  vNivel2.First;
  while not vNivel2.Eof do
  begin
    Application.ProcessMessages;
    with FSpedP.Bloco_0.Registro0500New do
    begin
      if vNivel2.FieldByName('DT_ALT').AsDateTime > StrToDate(FDataIni) then
        DT_ALT := StrToDate(FDataIni)
      else
        DT_ALT := vNivel2.FieldByName('DT_ALT').AsDateTime;
      COD_NAT_CC := _StrToNaturezaConta(vNivel2.FieldByName('COD_NAT_CC').AsString);
      IND_CTA := _StrToIndCTA(vNivel2.FieldByName('IND_CTA').AsString);
      NIVEL := Trim(vNivel2.FieldByName('NIVEL').AsString);
      COD_CTA := Trim(vNivel2.FieldByName('COD_CTA').AsString);
      NOME_CTA := Trim(vNivel2.FieldByName('NOME_CTA').AsString);
      COD_CTA_REF := '';
      CNPJ_EST := '';
    end;
    vNivel2.Next;
    FProgressBar.Position := FProgressBar.Position + 1;
  end;

  FLabelStatus.Caption := 'Montando registro 0600 - Centro de Custos';
  vNivel2.Close;
  vNivel2.SQL.Text :=
    'select cc.cod_ccus, cc.ccus, cc.dt_alt' +
    ' from centro_custos cc where cc.cod_empresa = :cod_empresa';
  vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.Open;

  vNivel2.FetchAll;

  FProgressBar.Min := 0;
  FProgressBar.Max := vNivel2.RecordCount;
  FProgressBar.Position := 1;

  vNivel2.First;
  while not vNivel2.Eof do
  begin
    Application.ProcessMessages;
    with FSpedP.Bloco_0.Registro0600New do
    begin
      if vNivel2.FieldByName('DT_ALT').AsDateTime > StrToDate(FDataIni) then
        DT_ALT := StrToDate(FDataIni)
      else
        DT_ALT := vNivel2.FieldByName('DT_ALT').AsDateTime;
      COD_CCUS := Trim(vNivel2.FieldByName('cod_ccus').AsString);
      CCUS := Trim(vNivel2.FieldByName('ccus').AsString);
    end;
    vNivel2.Next;
    FProgressBar.Position := FProgressBar.Position + 1;
  end;
  FLabelStatus.Caption := '';
end;

function TSpedPISCOFINS._validarRegistrarCreditosPISCOFIS: Boolean;
var
  vSql: string;
  vAno: Integer;
begin
  Result := True;
  if FCreditosAnteriores = nil then
    Exit;

  try

    if FCreditosAnteriores.FieldByName('ano').AsInteger < 2000 then
      raise exception.create('Ano inválido');

    if FCreditosAnteriores.FieldByName('mes').AsInteger < 1 then
      raise exception.create('Mês inválido');

    if FCreditosAnteriores.FieldByName('mes').AsInteger > 12 then
      raise exception.create('Mês inválido');

    if FCreditosAnteriores.FieldByName('valor_pis').AsFloat < 0 then
      raise exception.create('Valor de crédito do PIS inválido');

    if FCreditosAnteriores.FieldByName('valor_cofins').AsFloat < 0 then
      raise exception.create('Valor de crédito da COFINS inválido');

    if FCreditosAnteriores.FieldByName('tipo_situacao').AsString = 'N' then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'select ano, mes from SPED_CREDITOS_PERIODO ' +
        ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = ''PC''';
      vQrAux.ParamByName('ano').AsInteger := FCreditosAnteriores.FieldByName('ano').AsInteger;
      vQrAux.ParamByName('mes').AsInteger := FCreditosAnteriores.FieldByName('mes').AsInteger;
      vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
      vQrAux.Open;
      if not vQrAux.IsEmpty then
        raise exception.create('Já existe um registro para o mês e ano informado');

    end
    else if FCreditosAnteriores.FieldByName('tipo_situacao').AsString = 'A' then
    begin
      FCreditosAnteriores.FieldByName('valor_pis_util').AsFloat :=
        StrToFloatFormat(FCreditosAnteriores.FieldByName('valor_pis_util').AsFloat, 2);
      FCreditosAnteriores.FieldByName('valor_cofins_util').AsFloat :=
        StrToFloatFormat(FCreditosAnteriores.FieldByName('valor_cofins_util').AsFloat, 2);
      if StrToFloatFormat(FCreditosAnteriores.FieldByName('valor_pis').AsFloat, 2) <
        StrToFloatFormat(FCreditosAnteriores.FieldByName('valor_pis_util').AsFloat, 2) then
        raise exception.Create('Valor de crédito do PIS maior que a soma do crédito já utilizado nas apurações');
      if StrToFloatFormat(FCreditosAnteriores.FieldByName('valor_cofins').AsFloat, 2) <
        StrToFloatFormat(FCreditosAnteriores.FieldByName('valor_cofins_util').AsFloat, 2) then
        raise exception.Create('Valor de crédito do COFINS maior que a soma do crédito já utilizado nas apurações');
    end
    else if FCreditosAnteriores.FieldByName('tipo_situacao').AsString = 'E' then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'delete from SPED_CREDITOS_PERIODO ' +
        ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = ''PC''';
      vQrAux.ParamByName('ano').AsInteger := FCreditosAnteriores.FieldByName('ano').AsInteger;
      vQrAux.ParamByName('mes').AsInteger := FCreditosAnteriores.FieldByName('mes').AsInteger;
      vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
      vQrAux.ExecSQL;

      if vQrAux.Transaction.InTransaction then
        vQrAux.Transaction.Commit;

      _verificarCreditosPISCOFINS(False, 0, 0, FCreditosAnteriores.FieldByName('ano').AsInteger);

      Exit;
    end
    else
      Exit;

    if FCreditosAnteriores.FieldByName('tipo_situacao').AsString = 'N' then
      vSql := 'insert into SPED_CREDITOS_PERIODO (SPED, CNPJ, MES, ANO, VALOR_PIS, VALOR_COFINS)' +
        ' values (:SPED, :CNPJ, :MES, :ANO, :VALOR_PIS, :VALOR_COFINS)'
    else if FCreditosAnteriores.FieldByName('tipo_situacao').AsString = 'A' then
      vSql := 'update SPED_CREDITOS_PERIODO set VALOR_PIS = :VALOR_PIS, VALOR_COFINS = :VALOR_COFINS' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO';
    vQrAux.Close;
    vQrAux.SQL.Text := vSql;
    vQrAux.ParamByName('SPED').AsString := SpedFiscalOuPisCofins;
    vQrAux.ParamByName('CNPJ').AsString := FCNPJGrupo;
    vQrAux.ParamByName('MES').AsInteger := FCreditosAnteriores.FieldByName('mes').AsInteger;
    vQrAux.ParamByName('ANO').AsInteger := FCreditosAnteriores.FieldByName('ano').AsInteger;
    vQrAux.ParamByName('VALOR_PIS').AsFloat := FCreditosAnteriores.FieldByName('VALOR_PIS').AsFloat;
    vQrAux.ParamByName('VALOR_COFINS').AsFloat := FCreditosAnteriores.FieldByName('VALOR_COFINS').AsFloat;
    vQrAux.ExecSQL;

    if vQrAux.Transaction.InTransaction then
      vQrAux.Transaction.Commit;

    vAno := FCreditosAnteriores.FieldByName('ano').AsInteger;

    vDadosIniSPED.GravaAuditoria('EFD008', 'SALVAR', 'PIS:' + FCreditosAnteriores.FieldByName('VALOR_PIS').AsString +
      ' COFINS:' + FCreditosAnteriores.FieldByName('VALOR_COFINS').AsString, 'SPED_CREDITOS_PERIODO',
      FCreditosAnteriores.FieldByName('MES').AsString + '/' + FCreditosAnteriores.FieldByName('ANO').AsString, qrAux);

    _verificarCreditosPISCOFINS(False, 0, 0, vAno);

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
  
end;

function TSpedPISCOFINS._validarRegistrarHistoricoCreditosPISCOFIS: Boolean;
var
  vSql: string;
  vMesCred, vMesAprov: TDate;
begin
  Result := True;
  if FCreditosAnterioresHistorico = nil then
    Exit;

  try
    if FCreditosAnterioresHistorico.State = dsInsert then
    begin
      FCreditosAnterioresHistorico.FieldByName('ano').AsInteger :=
        FCreditosAnteriores.FieldByName('ano').AsInteger;
      FCreditosAnterioresHistorico.FieldByName('mes').AsInteger :=
        FCreditosAnteriores.FieldByName('mes').AsInteger;
    end;

    if FCreditosAnterioresHistorico.FieldByName('ano_util').AsInteger < 2000 then
      raise exception.create('Ano inválido');

    if FCreditosAnterioresHistorico.FieldByName('mes_util').AsInteger < 1 then
      raise exception.create('Mês inválido');

    if FCreditosAnterioresHistorico.FieldByName('mes_util').AsInteger > 12 then
      raise exception.create('Mês inválido');

    vMesCred := EncodeDate(FCreditosAnterioresHistorico.FieldByName('ano').AsInteger,
      FCreditosAnterioresHistorico.FieldByName('mes').AsInteger, 1);
    vMesAprov := EncodeDate(FCreditosAnterioresHistorico.FieldByName('ano_util').AsInteger,
      FCreditosAnterioresHistorico.FieldByName('mes_util').AsInteger, 1);

    if vMesAprov <= vMesCred then
      raise exception.create('Mês do aproveitamento deve ser superior ao mês credito');

    if FCreditosAnterioresHistorico.FieldByName('valor_pis_util').AsFloat < 0 then
      raise exception.create('Valor de aproveitamento de crédito do PIS inválido');

    if FCreditosAnterioresHistorico.FieldByName('valor_cofins_util').AsFloat < 0 then
      raise exception.create('Valor de aproveitamento de crédito da COFINS inválido');

    if FCreditosAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'N' then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'select ano, mes from SPED_CREDITOS_PERIODO_UTIL' +
        ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = ''PC''' +
        ' and ano_util = :ano_util and mes_util = :mes_util';
      vQrAux.ParamByName('ano').AsInteger := FCreditosAnterioresHistorico.FieldByName('ano').AsInteger;
      vQrAux.ParamByName('mes').AsInteger := FCreditosAnterioresHistorico.FieldByName('mes').AsInteger;
      vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
      vQrAux.ParamByName('ano_util').AsInteger := FCreditosAnterioresHistorico.FieldByName('ano_util').AsInteger;
      vQrAux.ParamByName('mes_util').AsInteger := FCreditosAnterioresHistorico.FieldByName('mes_util').AsInteger;
      vQrAux.Open;
      if not vQrAux.IsEmpty then
        raise exception.create('Já existe um registro para o mês e ano informado');

    end
    else if FCreditosAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'E' then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'delete from SPED_CREDITOS_PERIODO_UTIL ' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO and MES_UTIL = :MES_UTIL and ANO_UTIL = :ANO_UTIL';
      vQrAux.ParamByName('SPED').AsString := SpedFiscalOuPisCofins;
      vQrAux.ParamByName('CNPJ').AsString := FCNPJGrupo;
      vQrAux.ParamByName('MES').AsInteger := FCreditosAnterioresHistorico.FieldByName('mes').AsInteger;
      vQrAux.ParamByName('ANO').AsInteger := FCreditosAnterioresHistorico.FieldByName('ano').AsInteger;
      vQrAux.ParamByName('MES_UTIL').AsInteger := FCreditosAnterioresHistorico.FieldByName('mes_util').AsInteger;
      vQrAux.ParamByName('ANO_UTIL').AsInteger := FCreditosAnterioresHistorico.FieldByName('ano_util').AsInteger;
      vQrAux.ExecSQL;

      if vQrAux.Transaction.InTransaction then
        vQrAux.Transaction.Commit;

      _abreDetalhesCreditosPISCOFINS;

      Exit;
    end
    else if FCreditosAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'A' then
    else
      Exit;

    vQrAux.Close;
    vQrAux.SQL.Text := 'select sum(valor_pis_util) valor_pis_util, sum(valor_cofins_util) valor_cofins_util from SPED_CREDITOS_PERIODO_UTIL' +
      ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = ''PC''' +
      ' and ((ano_util <> :ano_util) or (mes_util <> :mes_util))';
    vQrAux.ParamByName('ano').AsInteger := FCreditosAnterioresHistorico.FieldByName('ano').AsInteger;
    vQrAux.ParamByName('mes').AsInteger := FCreditosAnterioresHistorico.FieldByName('mes').AsInteger;
    vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
    vQrAux.ParamByName('ano_util').AsInteger := FCreditosAnterioresHistorico.FieldByName('ano_util').AsInteger;
    vQrAux.ParamByName('mes_util').AsInteger := FCreditosAnterioresHistorico.FieldByName('mes_util').AsInteger;
    vQrAux.Open;

    if (FCreditosAnterioresHistorico.FieldByName('valor_pis_util').AsFloat + vQrAux.FieldByName('valor_pis_util').AsFloat) >
      FCreditosAnteriores.FieldByName('valor_pis').AsFloat then
      raise exception.create('Valor da soma do aproveitamento ultrapassa o valor de crédito PIS disponível');

    if (FCreditosAnterioresHistorico.FieldByName('valor_cofins_util').AsFloat + vQrAux.FieldByName('valor_cofins_util').AsFloat) >
      FCreditosAnteriores.FieldByName('valor_cofins').AsFloat then
      raise exception.create('Valor da soma do aproveitamento ultrapassa o valor de crédito COFINS disponível');

    if FCreditosAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'N' then
      vSql := 'insert into SPED_CREDITOS_PERIODO_UTIL (SPED, CNPJ, MES, ANO, MES_UTIL, ANO_UTIL, VALOR_PIS_UTIL, VALOR_COFINS_UTIL)' +
        ' values (:SPED, :CNPJ, :MES, :ANO, :MES_UTIL, :ANO_UTIL, :VALOR_PIS_UTIL, :VALOR_COFINS_UTIL)'
    else if FCreditosAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'A' then
      vSql := 'update SPED_CREDITOS_PERIODO_UTIL set VALOR_PIS_UTIL = :VALOR_PIS_UTIL, VALOR_COFINS_UTIL = :VALOR_COFINS_UTIL' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO and MES_UTIL = :MES_UTIL and ANO_UTIL = :ANO_UTIL';
    vQrAux.Close;
    vQrAux.SQL.Text := vSql;
    vQrAux.ParamByName('SPED').AsString := SpedFiscalOuPisCofins;
    vQrAux.ParamByName('CNPJ').AsString := FCNPJGrupo;
    vQrAux.ParamByName('MES').AsInteger := FCreditosAnterioresHistorico.FieldByName('mes').AsInteger;
    vQrAux.ParamByName('ANO').AsInteger := FCreditosAnterioresHistorico.FieldByName('ano').AsInteger;
    vQrAux.ParamByName('MES_UTIL').AsInteger := FCreditosAnterioresHistorico.FieldByName('mes_util').AsInteger;
    vQrAux.ParamByName('ANO_UTIL').AsInteger := FCreditosAnterioresHistorico.FieldByName('ano_util').AsInteger;
    vQrAux.ParamByName('VALOR_PIS_UTIL').AsFloat := FCreditosAnterioresHistorico.FieldByName('VALOR_PIS_UTIL').AsFloat;
    vQrAux.ParamByName('VALOR_COFINS_UTIL').AsFloat := FCreditosAnterioresHistorico.FieldByName('VALOR_COFINS_UTIL').AsFloat;
    vQrAux.ExecSQL;

    if vQrAux.Transaction.InTransaction then
      vQrAux.Transaction.Commit;

    _abreDetalhesCreditosPISCOFINS;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TSpedPISCOFINS._validarRegistrarHistoricoRetencoesPISCOFIS: Boolean;
var
  vSql: string;
  vMesCred, vMesAprov: TDate;
begin
  Result := True;
  if FRetencoesAnterioresHistorico = nil then
    Exit;

  try
    if FRetencoesAnterioresHistorico.State = dsInsert then
    begin
      FRetencoesAnterioresHistorico.FieldByName('ano').AsInteger :=
        FRetencoesAnteriores.FieldByName('ano').AsInteger;
      FRetencoesAnterioresHistorico.FieldByName('mes').AsInteger :=
        FRetencoesAnteriores.FieldByName('mes').AsInteger;
    end;

    if FRetencoesAnterioresHistorico.FieldByName('ano_util').AsInteger < 2000 then
      raise exception.create('Ano inválido');

    if FRetencoesAnterioresHistorico.FieldByName('mes_util').AsInteger < 1 then
      raise exception.create('Mês inválido');

    if FRetencoesAnterioresHistorico.FieldByName('mes_util').AsInteger > 12 then
      raise exception.create('Mês inválido');

    vMesCred := EncodeDate(FRetencoesAnterioresHistorico.FieldByName('ano').AsInteger,
      FRetencoesAnterioresHistorico.FieldByName('mes').AsInteger, 1);
    vMesAprov := EncodeDate(FRetencoesAnterioresHistorico.FieldByName('ano_util').AsInteger,
      FRetencoesAnterioresHistorico.FieldByName('mes_util').AsInteger, 1);

    if vMesAprov <= vMesCred then
      raise exception.create('Mês do aproveitamento deve ser superior ao mês credito');

    if FRetencoesAnterioresHistorico.FieldByName('valor_pis_util').AsFloat < 0 then
      raise exception.create('Valor de aproveitamento de crédito do PIS inválido');

    if FRetencoesAnterioresHistorico.FieldByName('valor_cofins_util').AsFloat < 0 then
      raise exception.create('Valor de aproveitamento de crédito da COFINS inválido');

    if FRetencoesAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'N' then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'select ano, mes from SPED_PC_RETENCAO_PERIODO_UTIL' +
        ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = ''PC''' +
        ' and ano_util = :ano_util and mes_util = :mes_util';
      vQrAux.ParamByName('ano').AsInteger := FRetencoesAnterioresHistorico.FieldByName('ano').AsInteger;
      vQrAux.ParamByName('mes').AsInteger := FRetencoesAnterioresHistorico.FieldByName('mes').AsInteger;
      vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
      vQrAux.ParamByName('ano_util').AsInteger := FRetencoesAnterioresHistorico.FieldByName('ano_util').AsInteger;
      vQrAux.ParamByName('mes_util').AsInteger := FRetencoesAnterioresHistorico.FieldByName('mes_util').AsInteger;
      vQrAux.Open;
      if not vQrAux.IsEmpty then
        raise exception.create('Já existe um registro para o mês e ano informado');

    end
    else if FRetencoesAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'E' then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'delete from SPED_PC_RETENCAO_PERIODO_UTIL ' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO and MES_UTIL = :MES_UTIL and ANO_UTIL = :ANO_UTIL';
      vQrAux.ParamByName('SPED').AsString := SpedFiscalOuPisCofins;
      vQrAux.ParamByName('CNPJ').AsString := FCNPJGrupo;
      vQrAux.ParamByName('MES').AsInteger := FRetencoesAnterioresHistorico.FieldByName('mes').AsInteger;
      vQrAux.ParamByName('ANO').AsInteger := FRetencoesAnterioresHistorico.FieldByName('ano').AsInteger;
      vQrAux.ParamByName('MES_UTIL').AsInteger := FRetencoesAnterioresHistorico.FieldByName('mes_util').AsInteger;
      vQrAux.ParamByName('ANO_UTIL').AsInteger := FRetencoesAnterioresHistorico.FieldByName('ano_util').AsInteger;
      vQrAux.ExecSQL;

      if vQrAux.Transaction.InTransaction then
        vQrAux.Transaction.Commit;

      _abreDetalhesRetencoesPISCOFINS;

      Exit;
    end
    else if FRetencoesAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'A' then
    else
      Exit;

    vQrAux.Close;
    vQrAux.SQL.Text := 'select sum(valor_pis_util) valor_pis_util, sum(valor_cofins_util) valor_cofins_util from SPED_PC_RETENCAO_PERIODO_UTIL' +
      ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = ''PC''' +
      ' and ((ano_util <> :ano_util) or (mes_util <> :mes_util))';
    vQrAux.ParamByName('ano').AsInteger := FRetencoesAnterioresHistorico.FieldByName('ano').AsInteger;
    vQrAux.ParamByName('mes').AsInteger := FRetencoesAnterioresHistorico.FieldByName('mes').AsInteger;
    vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
    vQrAux.ParamByName('ano_util').AsInteger := FRetencoesAnterioresHistorico.FieldByName('ano_util').AsInteger;
    vQrAux.ParamByName('mes_util').AsInteger := FRetencoesAnterioresHistorico.FieldByName('mes_util').AsInteger;
    vQrAux.Open;

    if (FRetencoesAnterioresHistorico.FieldByName('valor_pis_util').AsFloat + vQrAux.FieldByName('valor_pis_util').AsFloat) >
      FRetencoesAnteriores.FieldByName('valor_pis').AsFloat then
      raise exception.create('Valor da soma do aproveitamento ultrapassa o valor de crédito PIS disponível');

    if (FRetencoesAnterioresHistorico.FieldByName('valor_cofins_util').AsFloat + vQrAux.FieldByName('valor_cofins_util').AsFloat) >
      FRetencoesAnteriores.FieldByName('valor_cofins').AsFloat then
      raise exception.create('Valor da soma do aproveitamento ultrapassa o valor de crédito COFINS disponível');

    if FRetencoesAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'N' then
      vSql := 'insert into SPED_PC_RETENCAO_PERIODO_UTIL (SPED, CNPJ, MES, ANO, MES_UTIL, ANO_UTIL, VALOR_PIS_UTIL, VALOR_COFINS_UTIL)' +
        ' values (:SPED, :CNPJ, :MES, :ANO, :MES_UTIL, :ANO_UTIL, :VALOR_PIS_UTIL, :VALOR_COFINS_UTIL)'
    else if FRetencoesAnterioresHistorico.FieldByName('tipo_situacao').AsString = 'A' then
      vSql := 'update SPED_PC_RETENCAO_PERIODO_UTIL set VALOR_PIS_UTIL = :VALOR_PIS_UTIL, VALOR_COFINS_UTIL = :VALOR_COFINS_UTIL' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO and MES_UTIL = :MES_UTIL and ANO_UTIL = :ANO_UTIL';
    vQrAux.Close;
    vQrAux.SQL.Text := vSql;
    vQrAux.ParamByName('SPED').AsString := SpedFiscalOuPisCofins;
    vQrAux.ParamByName('CNPJ').AsString := FCNPJGrupo;
    vQrAux.ParamByName('MES').AsInteger := FRetencoesAnterioresHistorico.FieldByName('mes').AsInteger;
    vQrAux.ParamByName('ANO').AsInteger := FRetencoesAnterioresHistorico.FieldByName('ano').AsInteger;
    vQrAux.ParamByName('MES_UTIL').AsInteger := FRetencoesAnterioresHistorico.FieldByName('mes_util').AsInteger;
    vQrAux.ParamByName('ANO_UTIL').AsInteger := FRetencoesAnterioresHistorico.FieldByName('ano_util').AsInteger;
    vQrAux.ParamByName('VALOR_PIS_UTIL').AsFloat := FRetencoesAnterioresHistorico.FieldByName('VALOR_PIS_UTIL').AsFloat;
    vQrAux.ParamByName('VALOR_COFINS_UTIL').AsFloat := FRetencoesAnterioresHistorico.FieldByName('VALOR_COFINS_UTIL').AsFloat;
    vQrAux.ExecSQL;

    if vQrAux.Transaction.InTransaction then
      vQrAux.Transaction.Commit;

    _abreDetalhesRetencoesPISCOFINS;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TSpedPISCOFINS._validarRegistrarRetencaoPISCOFIS: Boolean;
var
  vSql: string;
  vAno: Integer;
begin
  Result := True;
  if FRetencoesAnteriores = nil then
    Exit;

  try

    if FRetencoesAnteriores.FieldByName('ano').AsInteger < 2000 then
      raise exception.create('Ano inválido');

    if FRetencoesAnteriores.FieldByName('mes').AsInteger < 1 then
      raise exception.create('Mês inválido');

    if FRetencoesAnteriores.FieldByName('mes').AsInteger > 12 then
      raise exception.create('Mês inválido');

    if FRetencoesAnteriores.FieldByName('valor_pis').AsFloat < 0 then
      raise exception.create('Valor de crédito do PIS inválido');

    if FRetencoesAnteriores.FieldByName('valor_cofins').AsFloat < 0 then
      raise exception.create('Valor de crédito da COFINS inválido');

    if FRetencoesAnteriores.FieldByName('tipo_situacao').AsString = 'N' then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'select ano, mes from SPED_PC_RETENCAO_PERIODO ' +
        ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = ''PC''';
      vQrAux.ParamByName('ano').AsInteger := FRetencoesAnteriores.FieldByName('ano').AsInteger;
      vQrAux.ParamByName('mes').AsInteger := FRetencoesAnteriores.FieldByName('mes').AsInteger;
      vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
      vQrAux.Open;
      if not vQrAux.IsEmpty then
        raise exception.create('Já existe um registro para o mês e ano informado');

    end
    else if FRetencoesAnteriores.FieldByName('tipo_situacao').AsString = 'A' then
    begin
      FRetencoesAnteriores.FieldByName('valor_pis_util').AsFloat :=
        StrToFloatFormat(FRetencoesAnteriores.FieldByName('valor_pis_util').AsFloat, 2);
      FRetencoesAnteriores.FieldByName('valor_cofins_util').AsFloat :=
        StrToFloatFormat(FRetencoesAnteriores.FieldByName('valor_cofins_util').AsFloat, 2);
      if StrToFloatFormat(FRetencoesAnteriores.FieldByName('valor_pis').AsFloat, 2) <
        StrToFloatFormat(FRetencoesAnteriores.FieldByName('valor_pis_util').AsFloat, 2) then
        raise exception.Create('Valor de crédito do PIS maior que a soma do crédito já utilizado nas apurações');
      if StrToFloatFormat(FRetencoesAnteriores.FieldByName('valor_cofins').AsFloat, 2) <
        StrToFloatFormat(FRetencoesAnteriores.FieldByName('valor_cofins_util').AsFloat, 2) then
        raise exception.Create('Valor de crédito do COFINS maior que a soma do crédito já utilizado nas apurações');
    end
    else if FRetencoesAnteriores.FieldByName('tipo_situacao').AsString = 'E' then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'delete from SPED_PC_RETENCAO_PERIODO ' +
        ' where ano = :ano and mes = :mes and cnpj = :cnpj and sped = ''PC''';
      vQrAux.ParamByName('ano').AsInteger := FRetencoesAnteriores.FieldByName('ano').AsInteger;
      vQrAux.ParamByName('mes').AsInteger := FRetencoesAnteriores.FieldByName('mes').AsInteger;
      vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
      vQrAux.ExecSQL;

      if vQrAux.Transaction.InTransaction then
        vQrAux.Transaction.Commit;

      _verificarRetencoesPISCOFINS(False, 0, 0, FRetencoesAnteriores.FieldByName('ano').AsInteger);

      Exit;
    end
    else
      Exit;

    if FRetencoesAnteriores.FieldByName('tipo_situacao').AsString = 'N' then
      vSql := 'insert into SPED_PC_RETENCAO_PERIODO (SPED, CNPJ, MES, ANO, VALOR_PIS, VALOR_COFINS)' +
        ' values (:SPED, :CNPJ, :MES, :ANO, :VALOR_PIS, :VALOR_COFINS)'
    else if FRetencoesAnteriores.FieldByName('tipo_situacao').AsString = 'A' then
      vSql := 'update SPED_PC_RETENCAO_PERIODO set VALOR_PIS = :VALOR_PIS, VALOR_COFINS = :VALOR_COFINS' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO';
    vQrAux.Close;
    vQrAux.SQL.Text := vSql;
    vQrAux.ParamByName('SPED').AsString := SpedFiscalOuPisCofins;
    vQrAux.ParamByName('CNPJ').AsString := FCNPJGrupo;
    vQrAux.ParamByName('MES').AsInteger := FRetencoesAnteriores.FieldByName('mes').AsInteger;
    vQrAux.ParamByName('ANO').AsInteger := FRetencoesAnteriores.FieldByName('ano').AsInteger;
    vQrAux.ParamByName('VALOR_PIS').AsFloat := FRetencoesAnteriores.FieldByName('VALOR_PIS').AsFloat;
    vQrAux.ParamByName('VALOR_COFINS').AsFloat := FRetencoesAnteriores.FieldByName('VALOR_COFINS').AsFloat;
    vQrAux.ExecSQL;

    if vQrAux.Transaction.InTransaction then
      vQrAux.Transaction.Commit;

    vAno := FRetencoesAnteriores.FieldByName('ano').AsInteger;

    vDadosIniSPED.GravaAuditoria('EFD008', 'SALVAR', 'PIS:' + FRetencoesAnteriores.FieldByName('VALOR_PIS').AsString +
      ' COFINS:' + FRetencoesAnteriores.FieldByName('VALOR_COFINS').AsString, 'SPED_PC_RETENCAO_PERIODO',
      FRetencoesAnteriores.FieldByName('MES').AsString + '/' + FRetencoesAnteriores.FieldByName('ANO').AsString, qrAux);

    _verificarRetencoesPISCOFINS(False, 0, 0, vAno);

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TSpedPISCOFINS._verifica0110;
var
  vlista: TStringList;
  I: Integer;
begin
  if StrToDate(DataIni) >= StrToDate('01/07/2012') then
  begin
    vlista := TStringList.Create;
    vlista.LoadFromFile(FDestino);

    for I := 0 to vlista.Count - 1 do
      if copy(vlista[I], 1, 6) = '|0110|' then
      begin
        vlista[I] := vlista[I] + '|';
        vlista.SaveToFile(FDestino);
        Break;
      end;
  end;
end;

procedure TSpedPISCOFINS._verificarCreditosPISCOFINS(pEmApuracao: Boolean; pVrDebitoPIS, pVrDebitoCOFINS: Currency; pAno: Integer);
var
  I: Integer;
begin
  FVL_TOT_CRED_DESC_ANT_PIS := 0;
  FVL_TOT_CRED_DESC_ANT_COFINS := 0;

  if pEmApuracao then
  begin
    vQrAux.Close;
    vQrAux.SQL.Text := 'delete from sped_creditos_periodo_util' +
      ' where ano_util = :ano_util and mes_util = :mes_util' +
      ' and cnpj = :cnpj and sped = ''PC''';
    vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
    vQrAux.ParamByName('ano_util').AsInteger := YearOf(StrToDate(FDataFim));
    vQrAux.ParamByName('mes_util').AsInteger := MonthOf(StrToDate(FDataFim));
    vQrAux.ExecSQL;
  end;

  if vQrAux.Transaction.InTransaction then
    vQrAux.Transaction.Commit;

  vQrAux.Close;
  if pEmApuracao then
  begin
    vQrAux.SQL.Text := 'select scp.ano, scp.mes, scp.cnpj, scp.sped, scp.valor_pis, scp.valor_cofins, scp.valor_icms, sum(scu.valor_pis_util) valor_pis_util, sum(scu.valor_cofins_util) valor_cofins_util' +
      ' from sped_creditos_periodo scp' +
      ' left join sped_creditos_periodo_util scu on scu.ano = scp.ano and scu.mes = scp.mes and scu.cnpj = scp.cnpj and scu.sped = scp.sped and (((scu.ano_util = :anoapuracao) and (scu.mes_util < :mesapuracao)) or (scu.ano_util < :anoapuracao))' +
      ' where (((scp.ano = :anoapuracao) and (scp.mes < :mesapuracao)) or (scp.ano < :anoapuracao))' +
      ' and scp.cnpj = :cnpj and scp.sped = ''PC''' +
      ' and ((scp.valor_pis_util < scp.valor_pis) or (scp.valor_cofins_util < scp.valor_cofins))' +
      ' group by scp.ano, scp.mes, scp.cnpj, scp.sped, scp.valor_pis, scp.valor_cofins, scp.valor_icms' +
      ' order by ano,mes';
    vQrAux.ParamByName('anoapuracao').AsInteger := YearOf(StrToDate(FDataIni));
    vQrAux.ParamByName('mesapuracao').AsInteger := MonthOf(StrToDate(FDataIni));
  end
  else
  begin
    vQrAux.SQL.Text := 'select scp.* from sped_creditos_periodo scp' +
      ' where scp.ano = :ano' +
      ' and scp.cnpj = :cnpj and scp.sped = ''PC''' +
      ' order by ano,mes';
    if pAno = 0 then
      vQrAux.ParamByName('ano').AsInteger := YearOf(date)
    else
      vQrAux.ParamByName('ano').AsInteger := pAno;
  end;
  vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
  vQrAux.Open;

  if FCreditosAnteriores = nil then
  begin
    FCreditosAnteriores := TClientDataSet.Create(Application);
    for I := 0 to vQrAux.FieldCount - 1 do
      FCreditosAnteriores.FieldDefs.Add(
        vQrAux.Fields[i].FieldName,
        vQrAux.Fields[i].DataType,
        vQrAux.Fields[i].Size,
        False);
    FCreditosAnteriores.FieldDefs.Add('PIS_AT_UTIL', ftFloat, 0, False);
    FCreditosAnteriores.FieldDefs.Add('COFINS_AT_UTIL', ftFloat, 0, False);
    FCreditosAnteriores.FieldDefs.Add('TIPO_SITUACAO', ftString, 1, False);
    FCreditosAnteriores.CreateDataSet;
    TFloatField(FCreditosAnteriores.FieldByName('PIS_AT_UTIL')).DisplayFormat := '##0.00';
    TFloatField(FCreditosAnteriores.FieldByName('COFINS_AT_UTIL')).DisplayFormat := '##0.00';
    TFloatField(FCreditosAnteriores.FieldByName('VALOR_PIS')).DisplayFormat := '##0.00';
    TFloatField(FCreditosAnteriores.FieldByName('VALOR_COFINS')).DisplayFormat := '##0.00';
    TFloatField(FCreditosAnteriores.FieldByName('VALOR_PIS_UTIL')).DisplayFormat := '##0.00';
    TFloatField(FCreditosAnteriores.FieldByName('VALOR_COFINS_UTIL')).DisplayFormat := '##0.00';

    FCreditosAnteriores.FieldByName('ANO').DisplayWidth := 4;
    FCreditosAnteriores.FieldByName('MES').DisplayWidth := 2;
    FCreditosAnteriores.IndexFieldNames := 'ANO;MES';
  end;
  FCreditosAnteriores.EmptyDataSet;

  vQrAux.First;
  while not vQrAux.Eof do
  begin
    FCreditosAnteriores.Insert;
    for I := 0 to vQrAux.FieldCount - 1 do
      FCreditosAnteriores.FieldByName(vQrAux.Fields[i].FieldName).Value :=
        vQrAux.FieldByName(vQrAux.Fields[i].FieldName).Value;

    if FVL_TOT_CRED_DESC_ANT_PIS < pVrDebitoPIS then //valor acumulado menor que o debito total
      if vQrAux.FieldByName('VALOR_PIS_UTIL').AsFloat < vQrAux.FieldByName('VALOR_PIS').AsFloat then //valor ja utilizado menor que o credito do periodo
        if (vQrAux.FieldByName('VALOR_PIS').AsFloat - vQrAux.FieldByName('VALOR_PIS_UTIL').AsFloat) <=//valor disponivel a utilizar
          (pVrDebitoPIS - FVL_TOT_CRED_DESC_ANT_PIS) then// valor do debito subtraido os creditos
        begin
          FCreditosAnteriores.FieldByName('PIS_AT_UTIL').AsFloat :=
            (vQrAux.FieldByName('VALOR_PIS').AsFloat - vQrAux.FieldByName('VALOR_PIS_UTIL').AsFloat);
          FVL_TOT_CRED_DESC_ANT_PIS := FVL_TOT_CRED_DESC_ANT_PIS + FCreditosAnteriores.FieldByName('PIS_AT_UTIL').AsFloat;
        end
        else
        begin
          FCreditosAnteriores.FieldByName('PIS_AT_UTIL').AsFloat :=
            (pVrDebitoPIS - FVL_TOT_CRED_DESC_ANT_PIS);
          FVL_TOT_CRED_DESC_ANT_PIS := FVL_TOT_CRED_DESC_ANT_PIS + FCreditosAnteriores.FieldByName('PIS_AT_UTIL').AsFloat;
        end;
    if FVL_TOT_CRED_DESC_ANT_COFINS < pVrDebitoCOFINS then //valor acumulado menor que o debito total
      if vQrAux.FieldByName('VALOR_COFINS_UTIL').AsFloat < vQrAux.FieldByName('VALOR_COFINS').AsFloat then //valor ja utilizado menor que o credito do periodo
        if (vQrAux.FieldByName('VALOR_COFINS').AsFloat - vQrAux.FieldByName('VALOR_COFINS_UTIL').AsFloat) <=//valor disponivel a utilizar
          (pVrDebitoCOFINS - FVL_TOT_CRED_DESC_ANT_COFINS) then// valor do debito subtraido os creditos
        begin
          FCreditosAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat :=
            (vQrAux.FieldByName('VALOR_COFINS').AsFloat - vQrAux.FieldByName('VALOR_COFINS_UTIL').AsFloat);
          FVL_TOT_CRED_DESC_ANT_COFINS := FVL_TOT_CRED_DESC_ANT_COFINS + FCreditosAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat;
        end
        else
        begin
          FCreditosAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat :=
            (pVrDebitoCOFINS - FVL_TOT_CRED_DESC_ANT_COFINS);
          FVL_TOT_CRED_DESC_ANT_COFINS := FVL_TOT_CRED_DESC_ANT_COFINS + FCreditosAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat;
        end;
    FCreditosAnteriores.FieldByName('TIPO_SITUACAO').AsString := 'B';
    FCreditosAnteriores.Post;
    vQrAux.Next;
  end;

  if frmCreditoPISCOFNS <> nil then // se o formulario ja estiver aberto
    Exit;

  if pEmApuracao then
    Exit;

  Application.CreateForm(TfrmCreditoPISCOFNS, frmCreditoPISCOFNS);
  frmCreditoPISCOFNS.DataSource1.DataSet := FCreditosAnteriores;
  frmCreditoPISCOFNS.pnApuracao.Visible := pEmApuracao;
  frmCreditoPISCOFNS.pnConsulta.Visible := not pEmApuracao;
  if not pEmApuracao then
    if pAno > 0 then
      frmCreditoPISCOFNS.lbAno.Tag := pAno
    else
      frmCreditoPISCOFNS.lbAno.Tag := YearOf(date);
  frmCreditoPISCOFNS.SpedPC := TSpedPISCOFINS(Self);
  frmCreditoPISCOFNS.ShowModal;
  frmCreditoPISCOFNS.DataSource1.DataSet := nil;
  frmCreditoPISCOFNS.free;
  frmCreditoPISCOFNS := nil;
end;

procedure TSpedPISCOFINS._verificarRetencoesPISCOFINS(pEmApuracao: Boolean; pVrDebitoPIS, pVrDebitoCOFINS: Currency;
  pAno: Integer);
var
  I: Integer;
  J: Integer;
begin
  FVL_TOT_RETENC_DESC_ANT_PIS := 0;
  FVL_TOT_RETENC_DESC_ANT_COFINS := 0;

  if pEmApuracao then
  begin
    vQrAux.Close;
    vQrAux.SQL.Text := 'delete from SPED_PC_RETENCAO_PERIODO' +
      ' where ano = :ano and mes = :mes' +
      ' and cnpj = :cnpj and sped = ''PC''';
    vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
    vQrAux.ParamByName('ano').AsInteger := YearOf(StrToDate(FDataFim));
    vQrAux.ParamByName('mes').AsInteger := MonthOf(StrToDate(FDataFim));
    vQrAux.ExecSQL;

    vQrAux.Close;
    vQrAux.SQL.Text := 'delete from SPED_PC_RETENCAO_PERIODO_UTIL' +
      ' where ano_util = :ano_util and mes_util = :mes_util' +
      ' and cnpj = :cnpj and sped = ''PC''';
    vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
    vQrAux.ParamByName('ano_util').AsInteger := YearOf(StrToDate(FDataFim));
    vQrAux.ParamByName('mes_util').AsInteger := MonthOf(StrToDate(FDataFim));
    vQrAux.ExecSQL;
  end;

  if vQrAux.Transaction.InTransaction then
    vQrAux.Transaction.Commit;

  vQrAux.Close;
  if pEmApuracao then
  begin
    vQrAux.SQL.Text := 'select scp.ano, scp.mes, scp.cnpj, scp.sped, scp.valor_pis, scp.valor_cofins, sum(scu.valor_pis_util) valor_pis_util, sum(scu.valor_cofins_util) valor_cofins_util' +
      ' from SPED_PC_RETENCAO_PERIODO scp' +
      ' left join SPED_PC_RETENCAO_PERIODO_UTIL scu on scu.ano = scp.ano and scu.mes = scp.mes and scu.cnpj = scp.cnpj and scu.sped = scp.sped and (((scu.ano_util = :anoapuracao) and (scu.mes_util < :mesapuracao)) or (scu.ano_util < :anoapuracao))' +
      ' where (((scp.ano = :anoapuracao) and (scp.mes < :mesapuracao)) or (scp.ano < :anoapuracao))' +
      ' and scp.cnpj = :cnpj and scp.sped = ''PC''' +
      ' and ((scp.valor_pis_util < scp.valor_pis) or (scp.valor_cofins_util < scp.valor_cofins))' +
      ' group by scp.ano, scp.mes, scp.cnpj, scp.sped, scp.valor_pis, scp.valor_cofins' +
      ' order by ano,mes';
    vQrAux.ParamByName('anoapuracao').AsInteger := YearOf(StrToDate(FDataIni));
    vQrAux.ParamByName('mesapuracao').AsInteger := MonthOf(StrToDate(FDataIni));
  end
  else
  begin
    vQrAux.SQL.Text := 'select scp.* from SPED_PC_RETENCAO_PERIODO scp' +
      ' where scp.ano = :ano' +
      ' and scp.cnpj = :cnpj and scp.sped = ''PC''' +
      ' order by ano,mes';
    if pAno = 0 then
      vQrAux.ParamByName('ano').AsInteger := YearOf(date)
    else
      vQrAux.ParamByName('ano').AsInteger := pAno;
  end;
  vQrAux.ParamByName('cnpj').AsString := FCNPJGrupo;
  vQrAux.Open;

  if FRetencoesAnteriores = nil then
  begin
    FRetencoesAnteriores := TClientDataSet.Create(Application);
    for I := 0 to vQrAux.FieldCount - 1 do
      FRetencoesAnteriores.FieldDefs.Add(
        vQrAux.Fields[i].FieldName,
        vQrAux.Fields[i].DataType,
        vQrAux.Fields[i].Size,
        False);
    FRetencoesAnteriores.FieldDefs.Add('PIS_AT_UTIL', ftFloat, 0, False);
    FRetencoesAnteriores.FieldDefs.Add('COFINS_AT_UTIL', ftFloat, 0, False);
    FRetencoesAnteriores.FieldDefs.Add('TIPO_SITUACAO', ftString, 1, False);
    FRetencoesAnteriores.CreateDataSet;
    TFloatField(FRetencoesAnteriores.FieldByName('PIS_AT_UTIL')).DisplayFormat := '##0.00';
    TFloatField(FRetencoesAnteriores.FieldByName('COFINS_AT_UTIL')).DisplayFormat := '##0.00';
    TFloatField(FRetencoesAnteriores.FieldByName('VALOR_PIS')).DisplayFormat := '##0.00';
    TFloatField(FRetencoesAnteriores.FieldByName('VALOR_COFINS')).DisplayFormat := '##0.00';
    TFloatField(FRetencoesAnteriores.FieldByName('VALOR_PIS_UTIL')).DisplayFormat := '##0.00';
    TFloatField(FRetencoesAnteriores.FieldByName('VALOR_COFINS_UTIL')).DisplayFormat := '##0.00';

    FRetencoesAnteriores.FieldByName('ANO').DisplayWidth := 4;
    FRetencoesAnteriores.FieldByName('MES').DisplayWidth := 2;
    FRetencoesAnteriores.IndexFieldNames := 'ANO;MES';
  end;
  FRetencoesAnteriores.EmptyDataSet;

  FValorRetFuturo_Pis    := 0;
  FValorRetFuturo_Cofins := 0;
  for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
    for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Count - 1 do
    begin
      FValorRetFuturo_Pis := FValorRetFuturo_Pis +
        FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_PIS;
      FValorRetFuturo_Cofins := FValorRetFuturo_Cofins +
        FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_COFINS;
    end;
  if (FValorRetFuturo_Pis > 0) or (FValorRetFuturo_Cofins > 0) then
  begin
    FRetencoesAnteriores.Insert;
    FRetencoesAnteriores.FieldByName('ANO').AsInteger                := YearOf(StrToDate(FDataFim));
    FRetencoesAnteriores.FieldByName('MES').AsInteger                := MonthOf(StrToDate(FDataFim));
    FRetencoesAnteriores.FieldByName('CNPJ').AsString                := FCNPJGrupo;
    FRetencoesAnteriores.FieldByName('SPED').AsString                := 'PC';
    FRetencoesAnteriores.FieldByName('VALOR_PIS').AsCurrency         := FValorRetFuturo_Pis;
    FRetencoesAnteriores.FieldByName('VALOR_COFINS').AsCurrency      := FValorRetFuturo_Cofins;
    FRetencoesAnteriores.FieldByName('TIPO_SITUACAO').AsString       := 'B';
    FRetencoesAnteriores.Post;
  end;

  vQrAux.First;
  while not vQrAux.Eof do
  begin
    FRetencoesAnteriores.Insert;
    for I := 0 to vQrAux.FieldCount - 1 do
      FRetencoesAnteriores.FieldByName(vQrAux.Fields[i].FieldName).Value :=
        vQrAux.FieldByName(vQrAux.Fields[i].FieldName).Value;

    FRetencoesAnteriores.FieldByName('TIPO_SITUACAO').AsString := 'B';
    FRetencoesAnteriores.Post;
    vQrAux.Next;
  end;

  FRetencoesAnteriores.First;
  while not FRetencoesAnteriores.Eof do
  begin
    FRetencoesAnteriores.Edit;

    if FVL_TOT_RETENC_DESC_ANT_PIS < pVrDebitoPIS then //valor acumulado menor que o debito total
      if FRetencoesAnteriores.FieldByName('VALOR_PIS_UTIL').AsFloat < FRetencoesAnteriores.FieldByName('VALOR_PIS').AsFloat then //valor ja utilizado menor que o credito do periodo
        if (FRetencoesAnteriores.FieldByName('VALOR_PIS').AsFloat - FRetencoesAnteriores.FieldByName('VALOR_PIS_UTIL').AsFloat) <=//valor disponivel a utilizar
          (pVrDebitoPIS - FVL_TOT_RETENC_DESC_ANT_PIS) then// valor do debito subtraido os creditos
        begin
          FRetencoesAnteriores.FieldByName('PIS_AT_UTIL').AsFloat :=
            (FRetencoesAnteriores.FieldByName('VALOR_PIS').AsFloat - FRetencoesAnteriores.FieldByName('VALOR_PIS_UTIL').AsFloat);
          FVL_TOT_RETENC_DESC_ANT_PIS := FVL_TOT_RETENC_DESC_ANT_PIS + FRetencoesAnteriores.FieldByName('PIS_AT_UTIL').AsFloat;
        end
        else
        begin
          FRetencoesAnteriores.FieldByName('PIS_AT_UTIL').AsFloat :=
            (pVrDebitoPIS - FVL_TOT_RETENC_DESC_ANT_PIS);
          FVL_TOT_RETENC_DESC_ANT_PIS := FVL_TOT_RETENC_DESC_ANT_PIS + FRetencoesAnteriores.FieldByName('PIS_AT_UTIL').AsFloat;
        end;
    if FVL_TOT_RETENC_DESC_ANT_COFINS < pVrDebitoCOFINS then //valor acumulado menor que o debito total
      if FRetencoesAnteriores.FieldByName('VALOR_COFINS_UTIL').AsFloat < FRetencoesAnteriores.FieldByName('VALOR_COFINS').AsFloat then //valor ja utilizado menor que o credito do periodo
        if (FRetencoesAnteriores.FieldByName('VALOR_COFINS').AsFloat - FRetencoesAnteriores.FieldByName('VALOR_COFINS_UTIL').AsFloat) <=//valor disponivel a utilizar
          (pVrDebitoCOFINS - FVL_TOT_RETENC_DESC_ANT_COFINS) then// valor do debito subtraido os creditos
        begin
          FRetencoesAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat :=
            (FRetencoesAnteriores.FieldByName('VALOR_COFINS').AsFloat - FRetencoesAnteriores.FieldByName('VALOR_COFINS_UTIL').AsFloat);
          FVL_TOT_RETENC_DESC_ANT_COFINS := FVL_TOT_RETENC_DESC_ANT_COFINS + FRetencoesAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat;
        end
        else
        begin
          FRetencoesAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat :=
            (pVrDebitoCOFINS - FVL_TOT_RETENC_DESC_ANT_COFINS);
          FVL_TOT_RETENC_DESC_ANT_COFINS := FVL_TOT_RETENC_DESC_ANT_COFINS + FRetencoesAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat;
        end;

    FRetencoesAnteriores.Post;
    FRetencoesAnteriores.Next;
  end;

  if frmRetencoesPISCOFINS <> nil then // se o formulario ja estiver aberto
    Exit;

  if pEmApuracao then
    Exit;

  Application.CreateForm(TfrmRetencoesPISCOFINS, frmRetencoesPISCOFINS);
  frmRetencoesPISCOFINS.DataSource1.DataSet := FRetencoesAnteriores;
  frmRetencoesPISCOFINS.pnApuracao.Visible := pEmApuracao;
  frmRetencoesPISCOFINS.pnConsulta.Visible := not pEmApuracao;
  if not pEmApuracao then
    if pAno > 0 then
      frmRetencoesPISCOFINS.lbAno.Tag := pAno
    else
      frmRetencoesPISCOFINS.lbAno.Tag := YearOf(date);
  frmRetencoesPISCOFINS.SpedPC := TSpedPISCOFINS(Self);
  frmRetencoesPISCOFINS.ShowModal;
  frmRetencoesPISCOFINS.DataSource1.DataSet := nil;
  frmRetencoesPISCOFINS.free;
  frmRetencoesPISCOFINS := nil;
end;

procedure TSpedPISCOFINS.__montarBloco0;
begin
//
end;

procedure TSpedPISCOFINS.__montarBloco1;
var
  v1010: Boolean;
begin
  //FSpedP.Bloco_1.Registro1001New.IND_MOV := imSemDados;
  try
    if (FCreditosAnteriores <> nil) and (not FCreditosAnteriores.IsEmpty) then// ((FVL_TOT_CRED_DESC_ANT_PIS > 0) or (FVL_TOT_CRED_DESC_ANT_COFINS > 0)) then
    begin
      montaRegistro0140(FCodEmpresa);
      FSpedP.Bloco_1.Registro1001.IND_MOV := imComDados;
      FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;

      FCreditosAnteriores.First;
      while not FCreditosAnteriores.Eof do
      begin
//        if FCreditosAnteriores.FieldByName('PIS_AT_UTIL').AsFloat > 0 then
          with FSpedP.Bloco_1.Registro1100New do
          begin
            PER_APU_CRED := StrToInt(IntToStr(FCreditosAnteriores.FieldByName('mes').AsInteger) +
              IntToStr(FCreditosAnteriores.FieldByName('ano').AsInteger));
            ORIG_CRED := 1;
            COD_CRED := 101;
            VL_CRED_APU := FCreditosAnteriores.FieldByName('valor_pis').AsFloat;
            VL_TOT_CRED_APU := FCreditosAnteriores.FieldByName('valor_pis').AsFloat;
            VL_CRED_DESC_PA_ANT := FCreditosAnteriores.FieldByName('valor_pis_util').AsFloat;
            VL_CRED_PER_PA_ANT := 0;
            VL_CRED_DCOMP_PA_ANT := 0;
            SD_CRED_DISP_EFD := VL_TOT_CRED_APU - VL_CRED_DESC_PA_ANT - VL_CRED_PER_PA_ANT - VL_CRED_DCOMP_PA_ANT;
            VL_CRED_DESC_EFD := FCreditosAnteriores.FieldByName('PIS_AT_UTIL').AsFloat;
            VL_CRED_PER_EFD := 0;
            VL_CRED_DCOMP_EFD := 0;
            VL_CRED_TRANS := 0;
            VL_CRED_OUT := 0;
            SLD_CRED_FIM := SD_CRED_DISP_EFD - VL_CRED_DESC_EFD - VL_CRED_PER_EFD - VL_CRED_DCOMP_EFD - VL_CRED_TRANS - VL_CRED_OUT;
          end;

//        if FCreditosAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat > 0 then
          with FSpedP.Bloco_1.Registro1500New do
          begin
            PER_APU_CRED := StrToInt(IntToStr(FCreditosAnteriores.FieldByName('mes').AsInteger) + IntToStr(FCreditosAnteriores.FieldByName('ano').AsInteger));
            ORIG_CRED := 1;
            COD_CRED := 101;
            VL_CRED_APU := FCreditosAnteriores.FieldByName('valor_cofins').AsFloat;
            VL_TOT_CRED_APU := FCreditosAnteriores.FieldByName('valor_cofins').AsFloat;
            VL_CRED_DESC_PA_ANT := FCreditosAnteriores.FieldByName('valor_cofins_util').AsFloat;
            VL_CRED_PER_PA_ANT := 0;
            VL_CRED_DCOMP_PA_ANT := 0;
            SD_CRED_DISP_EFD := VL_TOT_CRED_APU - VL_CRED_DESC_PA_ANT - VL_CRED_PER_PA_ANT - VL_CRED_DCOMP_PA_ANT;
            VL_CRED_DESC_EFD := FCreditosAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat;
            VL_CRED_PER_EFD := 0;
            VL_CRED_DCOMP_EFD := 0;
            VL_CRED_TRANS := 0;
            VL_CRED_OUT := 0;
            SLD_CRED_FIM := SD_CRED_DISP_EFD - VL_CRED_DESC_EFD - VL_CRED_PER_EFD - VL_CRED_DCOMP_EFD - VL_CRED_TRANS - VL_CRED_OUT;
          end;
        FCreditosAnteriores.Next;
      end;
    end;

    if (FRetencoesAnteriores <> nil) and (not FRetencoesAnteriores.IsEmpty) then
    begin
      montaRegistro0140(FCodEmpresa);
      FSpedP.Bloco_1.Registro1001.IND_MOV := imComDados;
      FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;

      FRetencoesAnteriores.First;
      while not FRetencoesAnteriores.Eof do
      begin
        with FSpedP.Bloco_1.Registro1300New do
        begin
          IND_NAT_RET := 03;
          PR_REC_RET := StrToInt(IntToStr(FRetencoesAnteriores.FieldByName('mes').AsInteger) +
            IntToStr(FRetencoesAnteriores.FieldByName('ano').AsInteger));
          VL_RET_APU := FRetencoesAnteriores.FieldByName('valor_pis').AsFloat;
          VL_RET_DED := FRetencoesAnteriores.FieldByName('valor_pis_util').AsFloat +
            FRetencoesAnteriores.FieldByName('pis_at_util').AsFloat;
          VL_RET_PER := 0;
          VL_RET_DCOMP := 0;
          SLD_RET := VL_RET_APU - VL_RET_DED - VL_RET_PER - VL_RET_DCOMP
        end;

        with FSpedP.Bloco_1.Registro1700New do
        begin
          IND_NAT_RET := 03;
          PR_REC_RET := StrToInt(IntToStr(FRetencoesAnteriores.FieldByName('mes').AsInteger) +
            IntToStr(FRetencoesAnteriores.FieldByName('ano').AsInteger));
          VL_RET_APU := FRetencoesAnteriores.FieldByName('valor_cofins').AsFloat;
          VL_RET_DED := FRetencoesAnteriores.FieldByName('valor_cofins_util').AsFloat +
            FRetencoesAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat;  
          VL_RET_PER := 0;
          VL_RET_DCOMP := 0;
          SLD_RET := VL_RET_APU - VL_RET_DED - VL_RET_PER - VL_RET_DCOMP
        end;
        FRetencoesAnteriores.Next;
      end;
    end;

    if (FRegime <> 'LUCRO PRESUMIDO') then
      Exit;

    vQrAux1.Close;
    vQrAux1.SQL.Text :=
      'select e.cod_empresa COD_EST, e.nome_emp NOME, e.cgc_emp CNPJ, es.sigla_uf UF,' +
      ' e.ibge_cod_cidade COD_MUN, e.im_emp IM, e.sped_suframa SUFRAMA' +
      ' from empresa e' +
      ' inner join estados es on es.codigo_uf = e.uf_emp' +
      ' where e.gerar_sped_piscofins = ''S'' order by cod_empresa';
    vQrAux1.Open;

    vQrAux1.First;
    while not vQrAux1.Eof do
    begin

      if (FIndicadorRegimeCumulativo = 1) or (FIndicadorRegimeCumulativo = 2) then
      begin
        vNivel2.Close;
        vNivel2.SQL.Text := 'SELECT' +
          ' sp.modelo COD_MOD,' +
          ' sp.serie SER,' +
          ' sp.subserie SUB_SER,' +
          ' case when sp.situacao = ''REGULAR'' then ''00''' +
          '    when sp.situacao = ''CANCELADO'' then ''02''' +
          '    else ''99''' +
          ' end COD_SIT,' +
          ' sp.cst_pis CST_PIS,' +
          ' sp.cst_pis CST_COFINS,' +
          ' sp.cfop CFOP,' +
          ' '''' COD_CTA,' +
          ' '''' INFO_COMPL,' +
          ' sum(sp.valor_liquido) VL_TOT_REC,' +
          ' count(sp.num_doc) QUANT_DOC' +
          ' from sped_presumido sp' +
          ' where sp.data_lancamento >= :dataIni and sp.data_lancamento <= :dataFim and sp.e_s = ''S'' and sp.receita_pis_cofins = ''S''' +
          ' and sp.cod_empresa = :cod_empresa' +
          ' group by 1,2,3,4,5,6,7,8,9';
        vNivel2.ParamByName('cod_empresa').AsInteger := vQrAux1.FieldByName('COD_EST').AsInteger;
        vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
        vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
        vNivel2.Open;

        vNivel2.FetchAll;
        FProgressBar.Min := 0;
        FProgressBar.Max := vNivel2.RecordCount;
        FProgressBar.Position := 1;
        if not vNivel2.IsEmpty then
        begin
          montaRegistro0140(FCodEmpresa);
          FSpedP.Bloco_1.Registro1001.IND_MOV := imComDados;
          FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        end;

        vNivel2.First;
        while not vNivel2.Eof do
        begin
          FLabelStatus.Caption := 'Montando registro 1900';
          Application.ProcessMessages;
          with FSpedP.Bloco_1.Registro1900New do
          begin
            CNPJ := Trim(vQrAux1.FieldByName('CNPJ').AsString);
            COD_MOD := vNivel2.FieldByName('COD_MOD').AsString;
            SER := Trim(vNivel2.FieldByName('SER').AsString);
            SUB_SER := Trim(vNivel2.FieldByName('SUB_SER').AsString);
            COD_SIT := _StrToSituacaoF(vNivel2.FieldByName('COD_SIT').AsString);
            VL_TOT_REC := vNivel2.FieldByName('VL_TOT_REC').AsFloat;
            QUANT_DOC := vNivel2.FieldByName('QUANT_DOC').AsInteger;
            CST_PIS := _StrToSituacaoTribPIS(vNivel2.FieldByName('CST_PIS').AsString);
            CST_COFINS :=  _StrToSituacaoTribCOFINS(vNivel2.FieldByName('CST_COFINS').AsString);
            CFOP := vNivel2.FieldByName('CFOP').AsInteger;
            COD_CTA  := vNivel2.FieldByName('COD_CTA').AsString;
            INF_COMPL := vNivel2.FieldByName('INFO_COMPL').AsString;

            if Trim(COD_CTA) = '' then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                ' where CST = '+ QuotedStr(Trim(vNivel2.FieldByName('CST_PIS').AsString))+
                ' and TIPO = ' + QuotedStr('O') +
                ' and SUBTIPO = ''N''';
              vQrAux.Open;
              if not vQrAux.IsEmpty then
                COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
            end;
          end;
          vNivel2.Next;
        end;
      end;
      vQrAux1.Next;
    end;
  finally
    vNivel2.Close;
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
    vNivel6.Close;
  end;
end;

procedure TSpedPISCOFINS.__montarBlocoA;
var
  vIntegerTemp: Integer;
  vA010, vExisteF600, vExisteF010: Boolean;
  I, J, K: Integer;
  vCNPJParticipante: string;
begin
  if (FIndicadorRegimeCumulativo = 1) or (FIndicadorRegimeCumulativo = 2) then
    Exit;

  try
    //Serviços apenas na OS. Nota fiscal eletronica de serviços da prefeitura gerada pelo sistema
    _verificaPISCOFINS_Servicos;
    vA010 := False;

    vNivel3.Close;
    vNivel3.SQL.Text :=
      'select ''1'' IND_OPER, ''0'' IND_EMIT,' +
      ' case when coalesce( pv.cod_cliente_nfserv, 0) > 0 then pv.cod_cliente_nfserv' +
      ' else pv.cod_cliente end COD_PART, ''00'' COD_SIT,' +
      ' ps.serie SER,  '''' SUB, ps.n_nf NUM_DOC, ps.codigo_verwsnfse CHV_NFSE,' +
      ' ps.emissao_nfse DT_DOC, pv.data_fech DT_EXE_SERV, cod.desc_cond_pag IND_PGTO,' +
      ' 0 VL_DESC, ps.aliq_iss, ps.nped, sum(base_pis) VL_BC_PIS,' +
      ' sum(coalesce(ps.COFINSRF_SERVICO,0)) VL_COFINS_RET, sum(coalesce(ps.PISRF_SERVICO,0)) VL_PIS_RET,' +
      ' sum(coalesce(ps.IRRF_SERVICO,0)) VL_IR_RET, sum(coalesce(ps.CSSLRF_SERVICO,0)) VL_CSSL_RET,' +
      ' Sum(valor_pis) VL_PIS, sum(base_cofins) VL_BC_COFINS, sum(valor_cofins) VL_COFINS,' +
      ' sum(ps.valor_nfse) VL_DOC' +
      ' from pedvenda pv' +
      ' inner join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and' +
      ' pv.cod_empresa = ps.cod_empresa' +
      ' left join cond_pag cod on cod.cod_cond_pag = pv.cod_cond_pag'+
      ' where ps.status_nfse = ''Autorizada'' and ps.emissao_nfse >= :dataIni and' +
      ' ps.emissao_nfse <= :dataFim and pv.cod_empresa = :cod_empresa' +
      ' group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14';
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.Open;

    vNivel3.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;
    FProgressBar.Position := 1;

    if not vNivel3.IsEmpty then
    begin
      if not vA010 then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_A.RegistroA001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        FSpedP.Bloco_A.RegistroA010New.CNPJ := Trim(FCNPJEmpresa);
        vA010 := True;
      end;
      FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
        'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
    end;
    vNivel3.First;
    while not vNivel3.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro A100 - NFS-e';
      Application.ProcessMessages;
      if vNivel3.FieldByName('VL_DOC').AsCurrency > 0 then      
      with FSpedP.Bloco_A.RegistroA100New do
      begin
        IND_OPER := _StrToIndicadorTpOperacao(vNivel3.FieldByName('IND_OPER').AsString);
        IND_EMIT := _StrToIndicadorEmitenteDF(vNivel3.FieldByName('IND_EMIT').AsString);
        COD_PART := Trim(vNivel3.FieldByName('COD_PART').AsString);
        montaRegistro0150(COD_PART);
        COD_SIT := _StrToSituacaoDF(Trim(vNivel3.FieldByName('COD_SIT').AsString));
        SER := Trim(vNivel3.FieldByName('SER').AsString);
        SUB := Trim(vNivel3.FieldByName('SUB').AsString);
        NUM_DOC := Trim(vNivel3.FieldByName('NUM_DOC').AsString);
        CHV_NFSE := Trim(vNivel3.FieldByName('CHV_NFSE').AsString);
        DT_DOC := vNivel3.FieldByName('DT_DOC').AsDateTime;
        DT_EXE_SERV := vNivel3.FieldByName('DT_EXE_SERV').AsDateTime;
        if DT_EXE_SERV > StrToDate(FDataFim) then
          DT_EXE_SERV := StrToDate(FDataFim);
        if pos('VISTA', UpperCase(vNivel3.FieldByName('IND_PGTO').AsString)) > 0 then
          IND_PGTO := tpVista
        else if pos('SEM PAGAMENTO', UpperCase(vNivel3.FieldByName('IND_PGTO').AsString)) > 0 then
          IND_PGTO := tpSemPagamento
//        else if Trim(vNivel3.FieldByName('IND_PGTO').AsString) = '' then
//          IND_PGTO := tpNenhum
        else
          IND_PGTO := tpPrazo;
        VL_DOC := StrToFloatFormat(vNivel3.FieldByName('VL_DOC').AsCurrency +   // de acordo a Elenice tem de ir tudo
          vNivel3.FieldByName('VL_PIS_RET').AsCurrency +                        // o total do documento é com retencoes, PIS
          vNivel3.FieldByName('VL_COFINS_RET').AsCurrency +                     // COFINS
          vNivel3.FieldByName('VL_IR_RET').AsCurrency +                         // Imposto de renda
          vNivel3.FieldByName('VL_CSSL_RET').AsCurrency                         // CSSL
          ,2);
        if FSPED_REGISTROS_LIQ = 'S' then
        begin
          VL_DOC := StrToFloatFormat(VL_DOC - vNivel3.FieldByName('VL_DESC').AsCurrency,2);
          VL_DESC := 0;
        end
        else
          VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
        //VL_BC_PIS := vNivel3.FieldByName('VL_BC_PIS').AsCurrency;
        //VL_PIS := vNivel3.FieldByName('VL_PIS').AsCurrency;
        //VL_BC_COFINS := vNivel3.FieldByName('VL_BC_COFINS').AsCurrency;
        //VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsCurrency;
        VL_PIS_RET := StrToFloatFormat(vNivel3.FieldByName('VL_PIS_RET').AsCurrency, 2);
        VL_COFINS_RET := StrToFloatFormat(vNivel3.FieldByName('VL_COFINS_RET').AsCurrency, 2);
        VL_ISS := StrToFloatFormat(vNivel3.FieldByName('VL_DOC').AsCurrency *
          vNivel3.FieldByName('aliq_iss').AsFloat / 100, 2);

        if (VL_PIS_RET > 0) or (VL_COFINS_RET > 0) then
        begin
          vExisteF600 := False;
          vCNPJParticipante := Trim(getValueFromList(2,5,COD_PART,FParticipantes));
          for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
            for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Count - 1 do
              if (FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].IND_NAT_RET = StrToIndNatRetFonte('03')) and
                (Trim(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].CNPJ) = vCNPJParticipante) and
                (FormatDateTime('dd/mm/yyyy', FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].DT_RET) =
                FormatDateTime('dd/mm/yyyy', DT_DOC)) then
              begin
                vExisteF600 := True;

                FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_BC_RET :=
                  FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_BC_RET +
                    (VL_DOC - VL_DESC);// + VL_PIS_RET + VL_COFINS_RET;// acima o VL_DOC ja é atribuido os valores de retencoes

                FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET :=
                  FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET + VL_PIS_RET + VL_COFINS_RET;

                FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_PIS :=
                  FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_PIS + VL_PIS_RET;

                FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_COFINS :=
                  FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_COFINS + VL_COFINS_RET;
              end;

          if not vExisteF600 then
          begin
            FSpedP.Bloco_F.RegistroF001.IND_MOV := imComDados;
            FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
            vExisteF010 := False;
            for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
              if Trim(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[I].CNPJ) = Trim(FCNPJEmpresa) then
              begin
                vExisteF010 := True;
                Break;
              end;

            if not vExisteF010 then
              FSpedP.Bloco_F.RegistroF010New.CNPJ := Trim(FCNPJEmpresa);

            with FSpedP.Bloco_F.RegistroF600New do
            begin
              IND_NAT_RET := StrToIndNatRetFonte('03');
              DT_RET := DT_DOC;
              VL_BC_RET := (VL_DOC - VL_DESC);// + VL_PIS_RET + VL_COFINS_RET; // acima o VL_DOC ja é atribuido os valores de retencoes
              VL_RET := VL_PIS_RET + VL_COFINS_RET;
              //COD_REC := '';
              //IND_NAT_REC := StrToIndNatRec('');
              CNPJ := vCNPJParticipante;//FCNPJEmpresa;//de acordo com a ortec
              VL_RET_PIS := VL_PIS_RET;
              VL_RET_COFINS := VL_COFINS_RET;
              IND_DEC := '0';
            end;
          end;
        end;

        vNivel4.Close;
        vNivel4.SQL.Text :=
          'select ps.cod_servico COD_ITEM, ps.desc_serv_ped DESCR_COMPL, 0 VL_DESC,' +
          ' ''13'' NAT_BC_CRED, 0 IND_ORIG_CRED, ps.cst_pis, ps.aliq_pis, ps.cst_cofins,' +
          ' ps.aliq_cofins,  '''' COD_CTA, '''' COD_CCUS,' +
          ' sum(ps.valor_nfse) VL_ITEM, sum(ps.base_pis) vl_bc_pis,' +
          ' sum(coalesce(ps.COFINSRF_SERVICO,0)) VL_COFINS_RET, sum(coalesce(ps.PISRF_SERVICO,0)) VL_PIS_RET,' +
          ' sum(coalesce(ps.IRRF_SERVICO,0)) VL_IR_RET, sum(coalesce(ps.CSSLRF_SERVICO,0)) VL_CSSL_RET,' +
          ' sum(ps.valor_pis) vl_pis, sum(ps.base_cofins) vl_bc_cofins, sum(ps.valor_cofins) vl_cofins' +
          ' from pedvenda_serv ps' +
          ' inner join tipo_servico ts on ts.cod_servico = ps.cod_servico' +
          //' inner join tiposerviconfse tsn on tsn.cod_tpservico = ps.nfs_servico' +
          ' where ps.nped = :nped and ps.tipo = ''OS'' and ps.cod_empresa = :cod_empresa and' +
          ' ps.n_nf = :n_nf and ps.status_nfse = ''Autorizada''' +
          ' group by 1,2,3,4,5,6,7,8,9';
        vNivel4.ParamByName('nped').AsInteger := vNivel3.FieldByName('nped').AsInteger;
        vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel4.ParamByName('n_nf').AsString := vNivel3.FieldByName('NUM_DOC').AsString;
        vNivel4.Open;

        vIntegerTemp := 0;
        vNivel4.First;
        while not vNivel4.Eof do
        begin
          inc(vIntegerTemp);
          with FSpedP.Bloco_A.RegistroA170New do
          begin
            NUM_ITEM := vIntegerTemp;
            COD_ITEM := 'S' + StrZero(vNivel4.FieldByName('COD_ITEM').AsString, 16);

            gravaSpedItem('S', 0, '', '', vNivel4.FieldByName('COD_ITEM').AsInteger, '', 'UN');

            DESCR_COMPL := Trim(vNivel4.FieldByName('DESCR_COMPL').AsString);
            VL_ITEM := StrToFloatFormat(vNivel4.FieldByName('VL_ITEM').AsCurrency + // de acordo a Elenice tem de ir tudo
              vNivel4.FieldByName('VL_PIS_RET').AsCurrency +                        // o total do documento é com retencoes, PIS
              vNivel4.FieldByName('VL_COFINS_RET').AsCurrency +                     // COFINS
              vNivel4.FieldByName('VL_IR_RET').AsCurrency +                         // Imposto de renda
              vNivel4.FieldByName('VL_CSSL_RET').AsCurrency                         // CSSL
              ,2);
            if FSPED_REGISTROS_LIQ = 'S' then
            begin
              VL_ITEM := VL_ITEM - vNivel4.FieldByName('VL_DESC').AsCurrency;
              VL_DESC := 0;
            end
            else
              VL_DESC := vNivel4.FieldByName('VL_DESC').AsCurrency;
            NAT_BC_CRED := _StrToBaseCalculoCredito(vNivel4.FieldByName('NAT_BC_CRED').AsString);
            IND_ORIG_CRED := _StrToOrigemCredito(vNivel4.FieldByName('IND_ORIG_CRED').AsString);
            CST_PIS := _StrToSituacaoTribPIS(vNivel4.FieldByName('CST_PIS').AsString);
            if CST_PIS <> stpisQtdeAliquotaUnidade then
            begin
              VL_BC_PIS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsCurrency,2);
              ALIQ_PIS := vNivel4.FieldByName('ALIQ_PIS').AsFloat;
            end;
            VL_PIS := vNivel4.FieldByName('VL_PIS').AsCurrency;
            CST_COFINS := _StrToSituacaoTribCOFINS(vNivel4.FieldByName('CST_COFINS').AsString);
            if CST_COFINS <> stcofinsQtdeAliquotaUnidade then
            begin
              VL_BC_COFINS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsCurrency,2);
              ALIQ_COFINS := vNivel4.FieldByName('ALIQ_COFINS').AsCurrency;
            end;

            VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsCurrency;
            COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);
            COD_CCUS := Trim(vNivel4.FieldByName('COD_CCUS').AsString);

            if Trim(COD_CTA) = '' then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_PIS').AsString))+
                ' and TIPO = ''S'' and SUBTIPO = ''N''';
              vQrAux.Open;
              if not vQrAux.IsEmpty then
                COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
            end;
          end;

          if _StrToSituacaoTribPIS(vNivel4.FieldByName('CST_PIS').AsString) <> stpisQtdeAliquotaUnidade then
          begin
            VL_BC_PIS := VL_BC_PIS + StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsCurrency,2);
            VL_BC_COFINS := VL_BC_COFINS + StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsCurrency,2);
            VL_PIS := VL_PIS + vNivel4.FieldByName('VL_PIS').AsCurrency;
            VL_COFINS := VL_COFINS + vNivel4.FieldByName('VL_COFINS').AsCurrency;
          end;

          vNivel4.Next;
        end;

      end;

      vNivel3.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;

     //Serviços apenas na OS. Nota fiscal eletronica de serviços da prefeitura

    vNivel3.Close;
    vNivel3.SQL.Text :=
//      'select ''1'' IND_OPER, ''0'' IND_EMIT, pv.cod_cliente COD_PART, ''00'' COD_SIT,' +
//      ' ''1'' SER,  '''' SUB, pv.NUM_NFEEXT NUM_DOC, '''' CHV_NFSE,' +
//      ' pv.DATA_NFEXT DT_DOC, pv.data_fech DT_EXE_SERV, cod.desc_cond_pag IND_PGTO,' +
//      ' 0 VL_DESC, 0 VL_COFINS_RET, 0 VL_PIS_RET, ps.nped, sum(ps.base_pis) VL_BC_PIS,' +
//      ' Sum(ps.valor_pis) VL_PIS, sum(ps.base_cofins) VL_BC_COFINS, sum(ps.valor_cofins) VL_COFINS,' +
//      ' sum((coalesce(ps.valor_tot_serv,0) - coalesce(ps.rateio_desc,0))) VL_DOC,' +
//      ' sum( ps.aliq_iss * (coalesce(ps.valor_tot_serv,0) - coalesce(ps.rateio_desc,0)) ) VL_ISS,'+
//      ' sum(coalesce(pv.VALOR_NFEXT,0)) VALOR_NFEXT, sum(coalesce(pst.vl_servt, 0)) VL_DOC_T' +
//      ' from pedvenda pv' +
//      ' inner join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and' +
//      ' pv.cod_empresa = ps.cod_empresa' +                                           
//      ' left join pedvenda_serv_terc pst on pst.nped = pv.nped and pst.tipo = pv.tipo and pst.cod_empresa = pv.cod_empresa' +
//      ' left join cond_pag cod on cod.cod_cond_pag = pv.cod_cond_pag'+
//      ' where pV.NUM_NFEEXT > 0 and pv.DATA_NFEXT >= :dataIni and' +
//      ' pv.DATA_NFEXT <= :dataFim and pv.cod_empresa = :cod_empresa' +
//      ' and ((ps.lote_nfse is null) or (ps.lote_nfse = 0))' +
//      ' group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15';
      'select ''1'' IND_OPER, ''0'' IND_EMIT, pv.cod_cliente COD_PART, ''00'' COD_SIT,' +
      ' ''1'' SER,  '''' SUB, pv.NUM_NFEEXT NUM_DOC, '''' CHV_NFSE,' +
      ' pv.DATA_NFEXT DT_DOC,' +
      ' 0 VL_DESC, 0 VL_COFINS_RET, 0 VL_PIS_RET, sum(ps.base_pis) VL_BC_PIS,' +
      ' Sum(ps.valor_pis) VL_PIS, sum(ps.base_cofins) VL_BC_COFINS, sum(ps.valor_cofins) VL_COFINS,' +
      ' sum((coalesce(ps.valor_tot_serv,0) - coalesce(ps.rateio_desc,0))) VL_DOC,' +
      ' sum( ps.aliq_iss * (coalesce(ps.valor_tot_serv,0) - coalesce(ps.rateio_desc,0)) ) VL_ISS,' +
      ' avg(coalesce(pv.VALOR_NFEXT,0)) VALOR_NFEXT, sum(coalesce(pst.vl_servt, 0)) VL_DOC_T,' +
      ' min(pv.data_fech) DT_EXE_SERV, min(cod.desc_cond_pag) IND_PGTO' +
      ' from pedvenda pv' +
      ' left join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and' +
      ' pv.cod_empresa = ps.cod_empresa' +
      ' left join pedvenda_serv_terc pst on pst.nped = pv.nped and pst.tipo = pv.tipo and pst.cod_empresa = pv.cod_empresa' +
      ' left join cond_pag cod on cod.cod_cond_pag = pv.cod_cond_pag' +
      ' where pV.NUM_NFEEXT > 0 and pv.DATA_NFEXT >= :dataIni and' +
      ' pv.DATA_NFEXT <= :dataFim and pv.cod_empresa = :cod_empresa' +
      ' and coalesce(ps.status_nfse,'''') <> ''Autorizada''' +
      ' and coalesce(ps.n_nf, 0) = 0 group by 1,2,3,4,5,6,7,8,9,10';
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.Open;

    vNivel3.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;
    FProgressBar.Position := 1;
    if not vNivel3.IsEmpty then
    begin
      if not vA010 then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_A.RegistroA001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        FSpedP.Bloco_A.RegistroA010New.CNPJ := Trim(FCNPJEmpresa);
        vA010 := True;
      end;
      FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
        'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
    end;
    vNivel3.First;
    while not vNivel3.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro A100 - NFS-e';
      Application.ProcessMessages;
      IF (vNivel3.FieldByName('VL_DOC').AsCurrency > 0) or (vNivel3.FieldByName('VL_DOC_T').AsCurrency > 0) THEN
      with FSpedP.Bloco_A.RegistroA100New do
      begin
        IND_OPER := _StrToIndicadorTpOperacao(vNivel3.FieldByName('IND_OPER').AsString);
        IND_EMIT := _StrToIndicadorEmitenteDF(vNivel3.FieldByName('IND_EMIT').AsString);
        COD_PART := Trim(vNivel3.FieldByName('COD_PART').AsString);
        montaRegistro0150(COD_PART);
        COD_SIT := _StrToSituacaoDF(Trim(vNivel3.FieldByName('COD_SIT').AsString));
        SER := Trim(vNivel3.FieldByName('SER').AsString);
        SUB := Trim(vNivel3.FieldByName('SUB').AsString);
        NUM_DOC := Trim(vNivel3.FieldByName('NUM_DOC').AsString);
        CHV_NFSE := Trim(vNivel3.FieldByName('CHV_NFSE').AsString);
        DT_DOC := vNivel3.FieldByName('DT_DOC').AsDateTime;
        DT_EXE_SERV := vNivel3.FieldByName('DT_EXE_SERV').AsDateTime;
        if DT_EXE_SERV > StrToDate(FDataFim) then
          DT_EXE_SERV := StrToDate(FDataFim);
        if pos('VISTA', UpperCase(vNivel3.FieldByName('IND_PGTO').AsString)) > 0 then
          IND_PGTO := tpVista
        else if pos('SEM PAGAMENTO', UpperCase(vNivel3.FieldByName('IND_PGTO').AsString)) > 0 then
          IND_PGTO := tpSemPagamento
//        else if Trim(vNivel3.FieldByName('IND_PGTO').AsString) = '' then
//          IND_PGTO := tpNenhum
        else
          IND_PGTO := tpPrazo;
        VL_DOC := vNivel3.FieldByName('VALOR_NFEXT').AsCurrency;
        if FSPED_REGISTROS_LIQ = 'S' then
        begin
          VL_DOC := vNivel3.FieldByName('VALOR_NFEXT').AsCurrency - vNivel3.FieldByName('VL_DESC').AsCurrency;
          VL_DESC := 0;
        end
        else
          VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
//        VL_BC_PIS := vNivel3.FieldByName('VL_BC_PIS').AsCurrency;
//        VL_PIS := vNivel3.FieldByName('VL_PIS').AsCurrency;
//        VL_BC_COFINS := vNivel3.FieldByName('VL_BC_COFINS').AsCurrency;
//        VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsCurrency;
        VL_PIS_RET := vNivel3.FieldByName('VL_PIS_RET').AsCurrency;
        VL_COFINS_RET := vNivel3.FieldByName('VL_COFINS_RET').AsCurrency;
        VL_ISS := StrToFloatFormat(vNivel3.FieldByName('VL_ISS').AsCurrency, 2);


        vNivel4.Close;
        vNivel4.SQL.Text :=
//          'select ps.cod_servico COD_ITEM, ps.desc_serv_ped DESCR_COMPL, coalesce(ps.rateio_desc,0) VL_DESC,' +
//          ' ''13'' NAT_BC_CRED, 0 IND_ORIG_CRED, ps.cst_pis, ps.aliq_pis, ps.cst_cofins,' +
//          ' ps.aliq_cofins,  '''' COD_CTA, '''' COD_CCUS,' +
//          ' (coalesce(ps.valor_tot_serv,0)) VL_ITEM, ps.base_pis vl_bc_pis,' +
//          ' ps.valor_pis vl_pis, ps.base_cofins vl_bc_cofins, ps.valor_cofins vl_cofins,' +
//          ' ps.valor_nfse' +
//          ' from pedvenda_serv ps' +
//          ' inner join tipo_servico ts on ts.cod_servico = ps.cod_servico' +
//          ' where ps.nped = :nped and ps.tipo = ''OS'' and ps.cod_empresa = :cod_empresa' +
//          ' and ((ps.lote_nfse is null) or (ps.lote_nfse = 0))' +
//          ' union' +
//          ' select e.cod_serv_padrao COD_ITEM, pt.descr_servt DESCR_COMPL, 0 VL_DESC,' +
//          ' ''13'' NAT_BC_CRED, 0 IND_ORIG_CRED, ''01'' cst_pis, e.pis_emp, ''01'' cst_cofins,' +
//          ' e.cofins_emp,  '''' COD_CTA, '''' COD_CCUS,' +
//          ' coalesce(pt.vl_servt,0) VL_ITEM, coalesce(pt.vl_servt,0) vl_bc_pis,' +
//          ' (coalesce(pt.vl_servt,0) * coalesce(e.pis_emp,0) / 100 ) vl_pis,' +
//          ' coalesce(pt.vl_servt,0) vl_bc_cofins,' +
//          ' (coalesce(pt.vl_servt,0) * coalesce(e.cofins_emp,0) / 100 )  vl_cofins,' +
//          ' coalesce(pt.vl_servt,0)' +
//          ' from pedvenda_serv_terc pt' +
//          ' inner join empresa e on e.cod_empresa = pt.cod_empresa' +
//          ' inner join tipo_servico ts on ts.cod_servico = e.cod_serv_padrao' +
//          ' where pt.nped = :nped and pt.tipo = ''OS'' and pt.cod_empresa = :cod_empresa';
//        vNivel4.ParamByName('nped').AsInteger := vNivel3.FieldByName('nped').AsInteger;
          'select ps.cod_servico COD_ITEM, ps.desc_serv_ped DESCR_COMPL, coalesce(ps.rateio_desc,0) VL_DESC,' +
          ' ''13'' NAT_BC_CRED, 0 IND_ORIG_CRED, ps.cst_pis, ps.aliq_pis, ps.cst_cofins,' +
          ' ps.aliq_cofins,  '''' COD_CTA, '''' COD_CCUS,' +
          ' (coalesce(ps.valor_tot_serv,0)) VL_ITEM, ps.base_pis vl_bc_pis,' +
          ' ps.valor_pis vl_pis, ps.base_cofins vl_bc_cofins, ps.valor_cofins vl_cofins,' +
          ' ps.valor_nfse' +
          ' from pedvenda pv' +
          ' inner join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and pv.cod_empresa = ps.cod_empresa' +
          ' inner join tipo_servico ts on ts.cod_servico = ps.cod_servico' +
          ' where pv.num_nfeext = :ndoc and pv.tipo = ''OS'' and pv.cod_empresa = :cod_empresa' +
          ' and coalesce(ps.status_nfse,'''') <> ''Autorizada''' +
          ' and coalesce(ps.n_nf, 0) = 0' +
          ' and pv.DATA_NFEXT >= :dataIni and pv.DATA_NFEXT <= :dataFim' +
          ' union' +
          ' select e.cod_serv_padrao COD_ITEM, pt.descr_servt DESCR_COMPL, 0 VL_DESC,' +
          ' ''13'' NAT_BC_CRED, 0 IND_ORIG_CRED, ''01'' cst_pis, e.pis_emp, ''01'' cst_cofins,' +
          ' e.cofins_emp,  '''' COD_CTA, '''' COD_CCUS,' +
          ' coalesce(pt.vl_servt,0) VL_ITEM, coalesce(pt.vl_servt,0) vl_bc_pis,' +
          ' (coalesce(pt.vl_servt,0) * coalesce(e.pis_emp,0) / 100 ) vl_pis, coalesce(pt.vl_servt,0) vl_bc_cofins,' +
          ' (coalesce(pt.vl_servt,0) * coalesce(e.cofins_emp,0) / 100 )  vl_cofins, coalesce(pt.vl_servt,0)' +
          ' from pedvenda pv' +
          ' left join pedvenda_serv_terc pt on pv.nped = pt.nped and pv.tipo = pt.tipo and pv.cod_empresa = pt.cod_empresa' +
          ' inner join empresa e on e.cod_empresa = pt.cod_empresa' +
          ' inner join tipo_servico ts on ts.cod_servico = e.cod_serv_padrao' +
          ' where pv.num_nfeext = :ndoc and pv.tipo = ''OS'' and pv.cod_empresa = :cod_empresa and not pt.nped is null' +
          ' and pv.DATA_NFEXT >= :dataIni and pv.DATA_NFEXT <= :dataFim';
        vNivel4.ParamByName('ndoc').AsString := vNivel3.FieldByName('NUM_DOC').AsString;
        vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel4.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
        vNivel4.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
        vNivel4.Open;

        vIntegerTemp := 0;
        vNivel4.First;
        while not vNivel4.Eof do
        begin
          inc(vIntegerTemp);
          with FSpedP.Bloco_A.RegistroA170New do
          begin
            NUM_ITEM := vIntegerTemp;
            COD_ITEM := 'S' + StrZero(vNivel4.FieldByName('COD_ITEM').AsString, 16);

            gravaSpedItem('S', 0, '', '', vNivel4.FieldByName('COD_ITEM').AsInteger, '', 'UN');

            DESCR_COMPL := Trim(vNivel4.FieldByName('DESCR_COMPL').AsString);

//            if vNivel4.FieldByName('valor_nfse').AsFloat > 0 then
//              VL_ITEM := vNivel4.FieldByName('valor_nfse').AsCurrency
//            else
              VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency;
            if FSPED_REGISTROS_LIQ = 'S' then
            begin
              VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency - vNivel4.FieldByName('VL_DESC').AsCurrency;
              VL_DESC := 0;
            end
            else
              VL_DESC := vNivel4.FieldByName('VL_DESC').AsCurrency;
            NAT_BC_CRED := _StrToBaseCalculoCredito(vNivel4.FieldByName('NAT_BC_CRED').AsString);
            IND_ORIG_CRED := _StrToOrigemCredito(vNivel4.FieldByName('IND_ORIG_CRED').AsString);
            CST_PIS := _StrToSituacaoTribPIS(vNivel4.FieldByName('CST_PIS').AsString);
            if CST_PIS <> stpisQtdeAliquotaUnidade then
            begin
              VL_BC_PIS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsCurrency,2);
              ALIQ_PIS := vNivel4.FieldByName('ALIQ_PIS').AsFloat;
            end;
            VL_PIS := StrToFloatFormat(vNivel4.FieldByName('VL_PIS').AsCurrency,2);
            CST_COFINS := _StrToSituacaoTribCOFINS(vNivel4.FieldByName('CST_COFINS').AsString);
            if CST_COFINS <> stcofinsQtdeAliquotaUnidade then
            begin
              VL_BC_COFINS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsCurrency,2);
              ALIQ_COFINS := vNivel4.FieldByName('ALIQ_COFINS').AsCurrency;
            end;

            VL_COFINS := StrToFloatFormat(vNivel4.FieldByName('VL_COFINS').AsCurrency,2);
            COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);
            COD_CCUS := Trim(vNivel4.FieldByName('COD_CCUS').AsString);

            if Trim(COD_CTA) = '' then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_PIS').AsString))+
                ' and TIPO = ''S'' and SUBTIPO = ''N''';
              vQrAux.Open;
              if not vQrAux.IsEmpty then
                COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
            end;
          end;

          if _StrToSituacaoTribPIS(vNivel4.FieldByName('CST_PIS').AsString) <> stpisQtdeAliquotaUnidade then
          begin
            VL_BC_PIS := VL_BC_PIS + StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsCurrency,2);
            VL_BC_COFINS := VL_BC_COFINS + StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsCurrency,2);
            VL_PIS := VL_PIS + StrToFloatFormat(vNivel4.FieldByName('VL_PIS').AsCurrency,2);
            VL_COFINS := VL_COFINS + StrToFloatFormat(vNivel4.FieldByName('VL_COFINS').AsCurrency,2);
          end;

          vNivel4.Next;
        end;
      end;

      vNivel3.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;

    //Serviços da nota fiscal Somente serviços, entrada modelo E e O
    vNivel3.Close;
    vNivel3.SQL.Text :=
      'select' +
      ' ''0'' IND_OPER,' +
      ' ''1'' IND_EMIT,' +
      ' nf.cod_cliente COD_PART,' +
      ' case when nf.status = ''Fechada'' then ''00''' +
      ' when nf.status = ''Cancelada'' then ''02''' +
      ' else nf.status' +
      ' end COD_SIT,' +
      ' case when nf.sem_serie = ''S'' then ''''' +
      ' else nf.serie' +
      ' end SER,' +
      ' nf.subserie SUB,' +
      ' nf.num_nf NUM_DOC,' +
      ' case when nf.modelo_nf = ''E'' then nf.chave_nfse' +
      '   else ''''' +
      ' end CHV_NFSE,' +
      ' nf.data_contabil DT_DOC,' +
      ' nf.data_contabil DT_EXE_SERV,' +
      ' nf.valor_total VL_DOC,' +
      ' cod.desc_cond_pag IND_PGTO,' +
      ' nf.valor_desc VL_DESC,' +
      ' 0 VL_BC_PIS,' +
      ' 0 VL_PIS,' +
      ' 0 VL_BC_COFINS,' +
      ' 0 VL_COFINS,' +
      ' 0 VL_PIS_RET,' +
      ' 0 VL_COFINS_RET,' +
      ' 0 VL_ISS,' +
      ' cod_nf' +
      ' from notafiscal nf' +
      ' left join cond_pag cod on cod.cod_cond_pag = nf.cod_cond_pag' +
      ' where nf.data_contabil >= :dataIni and nf.data_contabil <= :dataFim and nf.cod_empresa = :cod_empresa' +
      ' and nf.modelo_nf in (''E'',''O'') and (nf.da is null or nf.da <> ''S'')' +
      ' order by nf.data_contabil, nf.status';
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.Open;

    vNivel3.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;
    FProgressBar.Position := 1;
    if not vNivel3.IsEmpty then
    begin
      if not vA010 then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_A.RegistroA001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        FSpedP.Bloco_A.RegistroA010New.CNPJ := Trim(FCNPJEmpresa);
        vA010 := True;
      end;
      FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
        'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
    end;
    vNivel3.First;
    while not vNivel3.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro A100 - NFS-e';
      Application.ProcessMessages;
      if (Trim(vNivel3.FieldByName('COD_SIT').AsString) <> '00') and (Trim(vNivel3.FieldByName('COD_SIT').AsString) <> '02') then
        Application.MessageBox(pchar('Nota Fiscal ' + IntToStr(vNivel3.FieldByName('num_doc').AsInteger) +
          ' está com o status: ' + Trim(vNivel3.FieldByName('COD_SIT').AsString) + #13 +
          'Portanto ela não irá entrar na apuração'), 'Atenção', 0 + 64)
      else if vNivel3.FieldByName('VL_DOC').AsCurrency > 0 then
      with FSpedP.Bloco_A.RegistroA100New do
      begin
        IND_OPER := _StrToIndicadorTpOperacao(vNivel3.FieldByName('IND_OPER').AsString);
        IND_EMIT := _StrToIndicadorEmitenteDF(vNivel3.FieldByName('IND_EMIT').AsString);
        COD_PART := Trim(vNivel3.FieldByName('COD_PART').AsString);
        montaRegistro0150(COD_PART);
        COD_SIT := _StrToSituacaoDF(Trim(vNivel3.FieldByName('COD_SIT').AsString));
        SER := Trim(vNivel3.FieldByName('SER').AsString);
        SUB := Trim(vNivel3.FieldByName('SUB').AsString);
        NUM_DOC := Trim(vNivel3.FieldByName('NUM_DOC').AsString);
        CHV_NFSE := Trim(vNivel3.FieldByName('CHV_NFSE').AsString);
        DT_DOC := vNivel3.FieldByName('DT_DOC').AsDateTime;
        DT_EXE_SERV := vNivel3.FieldByName('DT_EXE_SERV').AsDateTime;
        if DT_EXE_SERV > StrToDate(FDataFim) then
          DT_EXE_SERV := StrToDate(FDataFim);
        if pos('VISTA', UpperCase(vNivel3.FieldByName('IND_PGTO').AsString)) > 0 then
          IND_PGTO := tpVista
        else if pos('SEM PAGAMENTO', UpperCase(vNivel3.FieldByName('IND_PGTO').AsString)) > 0 then
          IND_PGTO := tpSemPagamento
        else
          IND_PGTO := tpPrazo;
        VL_DOC := vNivel3.FieldByName('VL_DOC').AsCurrency + vNivel3.FieldByName('VL_DESC').AsCurrency;
        if FSPED_REGISTROS_LIQ = 'S' then
        begin
          VL_DOC := VL_DOC - vNivel3.FieldByName('VL_DESC').AsCurrency;
          VL_DESC := 0;
        end
        else
          VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
        VL_BC_PIS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_PIS').AsCurrency,2);
        VL_PIS := vNivel3.FieldByName('VL_PIS').AsCurrency;
        VL_BC_COFINS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_COFINS').AsCurrency,2);
        VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsCurrency;
        VL_PIS_RET := vNivel3.FieldByName('VL_PIS_RET').AsCurrency;
        VL_COFINS_RET := vNivel3.FieldByName('VL_COFINS_RET').AsCurrency;
        VL_ISS := vNivel3.FieldByName('VL_ISS').AsCurrency;

        vNivel4.Close;
        vNivel4.SQL.Text :=
          'select' +
          ' ni.nitem NUM_ITEM,' +
          ' ni.cod_servico COD_ITEM,' +
          ' ni.descricao_item DESCR_COMPL,' +
          ' ni.valor_total VL_ITEM,' +
          ' ni.rateio_desconto VL_DESC,' +
          ' ''03'' NAT_BC_CRED,' +
          ' 0 IND_ORIG_CRED,' +
          ' ni.cst_pis,' +
          ' ni.base_pis VL_BC_PIS,' +
          ' ni.aliq_pis ,' +
          ' ni.valor_pis VL_PIS,' +
          ' ni.cst_cofins,' +
          ' ni.base_cofins VL_BC_COFINS,' +
          ' ni.aliq_cofins,' +
          ' ni.valor_cofins VL_COFINS,' +
          ' ni.valor_iss VL_ISS,' +
          ' '''' COD_CTA,' +
          ' '''' COD_CCUS' +
          ' from notafiscal_item ni' +
          ' where ni.cod_nf = :cod_nf and ni.cod_empresa = :cod_empresa';
        vNivel4.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
        vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel4.Open;

        vIntegerTemp := 0;
        vNivel4.First;
        while not vNivel4.Eof do
        begin
          inc(vIntegerTemp);
          with FSpedP.Bloco_A.RegistroA170New do
          begin
            NUM_ITEM := vIntegerTemp;
            COD_ITEM := 'S' + StrZero(vNivel4.FieldByName('COD_ITEM').AsString, 16);

            gravaSpedItem('S', 0, '', '', vNivel4.FieldByName('COD_ITEM').AsInteger, '', 'UN');

            DESCR_COMPL := Trim(vNivel4.FieldByName('DESCR_COMPL').AsString);
            VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency;
            if FSPED_REGISTROS_LIQ = 'S' then
            begin
              VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency - vNivel4.FieldByName('VL_DESC').AsCurrency;
              VL_DESC := 0;
            end
            else
              VL_DESC := vNivel4.FieldByName('VL_DESC').AsCurrency;
            NAT_BC_CRED := _StrToBaseCalculoCredito(vNivel4.FieldByName('NAT_BC_CRED').AsString);
            IND_ORIG_CRED := _StrToOrigemCredito(vNivel4.FieldByName('IND_ORIG_CRED').AsString);
            CST_PIS := _StrToSituacaoTribPIS(vNivel4.FieldByName('CST_PIS').AsString);
            if CST_PIS <> stpisQtdeAliquotaUnidade then
            begin
              VL_BC_PIS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsCurrency,2);
              ALIQ_PIS := vNivel4.FieldByName('ALIQ_PIS').AsFloat;
            end;
            VL_PIS := vNivel4.FieldByName('VL_PIS').AsCurrency;
            CST_COFINS := _StrToSituacaoTribCOFINS(vNivel4.FieldByName('CST_COFINS').AsString);
            if CST_COFINS <> stcofinsQtdeAliquotaUnidade then
            begin
              VL_BC_COFINS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsCurrency,2);
              ALIQ_COFINS := vNivel4.FieldByName('ALIQ_COFINS').AsCurrency;
            end;

            VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsCurrency;
            COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);
            COD_CCUS := Trim(vNivel4.FieldByName('COD_CCUS').AsString);

            if Trim(COD_CTA) = '' then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_PIS').AsString))+
                ' and TIPO = ''S'' and SUBTIPO = ''N''';
              vQrAux.Open;
              if not vQrAux.IsEmpty then
                COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
            end;
          end;

          if _StrToSituacaoTribPIS(vNivel4.FieldByName('CST_PIS').AsString) <> stpisQtdeAliquotaUnidade then
          begin
            VL_BC_PIS := VL_BC_PIS + StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsCurrency,2);
            VL_BC_COFINS := VL_BC_COFINS + StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsCurrency,2);
            VL_PIS := VL_PIS + vNivel4.FieldByName('VL_PIS').AsCurrency;
            VL_COFINS := VL_COFINS + vNivel4.FieldByName('VL_COFINS').AsCurrency;
          end;
          VL_ISS := VL_ISS + vNivel4.FieldByName('VL_ISS').AsFloat;

          vNivel4.Next;
        end;

      end;

      vNivel3.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;

    //NFS-e canceladas
    vNivel3.Close;
    vNivel3.SQL.Text :=
      'select distinct ''02'' cod_sit, ''1'' ind_oper, ''0'' IND_EMIT, nc.num_nfse num_doc, nc.serie ser, nc.sub_serie sub, pv.cod_cliente cod_part' +
      ' from nfse_canceladas nc' +
      ' left join pedvenda pv on pv.nped = nc.n_os and pv.tipo = ''OS'' and pv.cod_empresa = nc.cod_empresa' +
      ' where nc.emissao_nfse >=:dataIni and nc.emissao_nfse <= :dataFim and nc.cod_empresa = :cod_empresa';
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.Open;

    vNivel3.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;
    FProgressBar.Position := 1;
    if not vNivel3.IsEmpty then
    begin
      if not vA010 then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_A.RegistroA001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        FSpedP.Bloco_A.RegistroA010New.CNPJ := Trim(FCNPJEmpresa);
        vA010 := True;
      end;
      FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
        'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
    end;
    vNivel3.First;
    while not vNivel3.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro A100 - NFS-e Canceladas';
      Application.ProcessMessages;
      with FSpedP.Bloco_A.RegistroA100New do
      begin
        IND_OPER := _StrToIndicadorTpOperacao(vNivel3.FieldByName('IND_OPER').AsString);
        IND_EMIT := _StrToIndicadorEmitenteDF(vNivel3.FieldByName('IND_EMIT').AsString);
        COD_PART := Trim(vNivel3.FieldByName('COD_PART').AsString);
        montaRegistro0150(COD_PART);
        COD_SIT := _StrToSituacaoDF(Trim(vNivel3.FieldByName('COD_SIT').AsString));
        SER := Trim(vNivel3.FieldByName('SER').AsString);
        SUB := Trim(vNivel3.FieldByName('SUB').AsString);
        NUM_DOC := Trim(vNivel3.FieldByName('NUM_DOC').AsString);
      end;

      vNivel3.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;

  finally
    vNivel3.Close;
    vNivel4.Close;
  end;
  //  inicar este bloco
end;

procedure TSpedPISCOFINS.__montarBlocoC;
var
  vBooleanTemp: Boolean;
  vCampoString: AnsiString;
  vUnid: string;
  vStringTemp, vTipoTemp: string;
  vC010: Boolean;
  vOKDev: Boolean;
  vTemMovimentoReducaoZ: Boolean;
  vrPis, vrCofins: Extended;
  I: Integer;
  J: Integer;
begin

  if (FIndicadorRegimeCumulativo = 1) or (FIndicadorRegimeCumulativo = 2) then
    Exit;

  try
    vC010:= False;
    verificaCamposNuloNF;

    verificaPISCOFINSNotaFiscal;

    ///  Entradas e saídas de notas fiscais
    ///  

    vQrAux.Close;
    vQrAux.SQL.Text := 'select nf.num_nf from notafiscal nf' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status = ''Aberta'' and' +
      ' nf.emissao_propria = ''S'' and natureza_nf = ''E'' and situacao_nfe = ''Autorizada'' and' +
      ' nf.modelo_nf  = ''55'' and (nf.da is null or nf.da <> ''S'')';
    vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vQrAux.Open;

    vStringTemp := '';
    vQrAux.First;
    while not vQrAux.Eof do
    begin
      vStringTemp := vStringTemp + vQrAux.FieldByName('num_nf').AsString + ', ';
      vQrAux.Next;
    end;

    if Trim(vStringTemp ) <> '' then
    begin
      Delete(vStringTemp, Length(Trim(vStringTemp)), 1);
      Application.MessageBox(pchar('Existem notas fiscais de emissão própria Autorizadas sem Confirmação: ' + vStringTemp +
      #13 + 'Emp: ' + FCodEmpresa),
        'Atenção', 64);
    end;

    vStringTemp := '';

    vNivel3.Close;
    vNivel3.SQL.Text := 'select nf.cod_nf, nf.natureza_nf,' +
      ' case when nf.natureza_nf = ''E'' then ''0''' +
      '     else ''1'' end IND_OPER,' +
      ' case when nf.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
      ' else nf.serie end SER, nf.num_nf NUM_DOC, nf.chave_nfe CHV_NFE, nf.data_lanc DT_DOC,' +
      ' nf.data_ent_saida DT_E_S, nf.valor_total VL_DOC, co.desc_cond_pag IND_PGTO,' +
      ' nf.valor_desc VL_DESC, 0 VL_ABAT_NT, (nf.valor_prod + nf.valor_serv) VL_MERC,' +
      ' case when ((nf.valor_frete is null) or (nf.valor_frete = 0) or' +
      '     (nf.frete_f_nfe = ''S'')) then ''9''' +
      '     else nf.freteconta_tr' +
      ' end IND_FRT,' +
      ' case when nf.frete_f_nfe = ''S'' then 0' +
      '     else nf.valor_frete' +
      ' end VL_FRT, nf.valor_seguro VL_SEG, nf.valor_out_desp VL_OUT_DA, nf.base_icm' +
      ' VL_BC_ICMS, nf.valor_icm VL_ICMS, nf.base_icmsub VL_BC_ICMS_ST, nf.valor_icmsub' +
      ' VL_ICMS_ST, nf.valor_ipi VL_IPI, nf.valor_pis VL_PIS, nf.valor_cofins VL_COFINS,' +
      ' nf.valor_pis_st VL_PIS_ST, nf.valor_cofins_st VL_COFINS_ST, nf.status,' +
      ' nf.TIPO_EMISSAO, nf.extemporaneo,  nf.emissao_propria,' +
      ' nf.dados_interesse_fisco TXT_COMPL,' +
      ' nf.valor_serv VL_SERV_NT, nf.base_iss VL_BC_ISSQN, nf.valor_iss VL_ISSQN,' +
      ' nf.base_irrf VL_BC_IRRF, nf.valor_irrf VL_IRRF, 0 VL_BC_PREV, 0 VL_PREV,' +
      ' ''T''||nf.codigo_tr codigo_tr, nf.placa_tr VEIC_ID, nf.qtde_volumes_tr QTD_VOL,' +
      ' nf.peso_b PESO_BRT, nf.peso_l PESO_LIQ, nf.uf_placa_tr UF_ID, nf.cod_cons,' +
      ' nf.vl_forn, nf.vl_terc, nf.valor_out_desp VL_DA, nf.tp_ligacao,' +
      ' nf.cod_grupo_tensao, nf.vl_serv, nf.vl_serv_nt, nf.tp_assinante, nf.DESC_NATOP, nf.codigo_nop, nf.situacao_nfe' +
      ' from notafiscal nf' +
      ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
      ' nf.modelo_nf in (''1'',''01'',''1A'',''1-A'',''4'',''04'', ''55'')'+
      ' and (nf.da is null or nf.da <> ''S'')';
    if (FRegime = 'LUCRO PRESUMIDO') and (FIndicadorRegimeCumulativo = 9) then
      vNivel3.SQL.Text := vNivel3.SQL.Text + ' and nf.natureza_nf = ''S''';
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.Open;

    vNivel3.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;
    FProgressBar.Position := 1;
    if not vNivel3.IsEmpty then
    begin

      FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
        'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
    end;

    vNivel3.First;
    while not vNivel3.Eof do
    begin

      FLabelStatus.Caption := 'Montando registro C100';
      Application.ProcessMessages;

      if (FIncidTribPISCOFINS <> '2') or (vNivel3.FieldByName('natureza_nf').AsString <> 'E') then
      begin
        vBooleanTemp := True;
//        if (vNivel3.FieldByName('natureza_nf').AsString = 'E') then
//        begin
          vQrAux.Close;
        vQrAux.SQL.Text := 'select first 1 nfi.cod_nf from notafiscal_item nfi' +
          ' inner join nat_op nt on nt.codigo_nop = nfi.codigo_nop' + // and credito_pis_cofins = ''S''' +// ((not nt.nat_bc_cred is null) and (rtrim(nt.nat_bc_cred) <> ''''))' +
          ' where nfi.cod_nf = :cod_nf and' +
          ' nfi.cod_empresa = :cod_empresa';
        if (vNivel3.FieldByName('natureza_nf').AsString = 'E') then
          vQrAux.SQL.Text := vQrAux.SQL.Text + ' and credito_pis_cofins = ''S'''
        else
          vQrAux.SQL.Text := vQrAux.SQL.Text + ' and receita_pis_cofins = ''S''';
        vQrAux.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
        vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrAux.Open;

        vBooleanTemp := not vQrAux.IsEmpty;
        if vBooleanTemp then
          if (StrZero(vNivel3.FieldByName('COD_MOD').AsString, 2) = '55') and
            (vNivel3.FieldByName('IND_EMIT').AsString = '0') and
            (Trim(vNivel3.FieldByName('situacao_nfe').AsString) = '') then
          begin
            Application.MessageBox(pchar('Nota fiscal modelo 55 de número ' + vNivel3.FieldByName('NUM_DOC').AsString + ' não Autorizada'), 'Atenção', 0 + 64);
            vBooleanTemp := False;
          end
          else if (StrZero(vNivel3.FieldByName('COD_MOD').AsString, 2) = '55') and
            (vNivel3.FieldByName('IND_EMIT').AsString = '0') and
            (Trim(vNivel3.FieldByName('situacao_nfe').AsString) = 'A Inutilizar') then
          begin
            Application.MessageBox(pchar('Nota fiscal modelo 55 de número ' + vNivel3.FieldByName('NUM_DOC').AsString + ' precisa ser Inutilizada'), 'Atenção', 0 + 64);
            vBooleanTemp := False;
          end;
//        end;

        if (vNivel3.FieldByName('natureza_nf').AsString = 'E') then
        begin

          vQrAux.Close;
          vQrAux.SQL.Text := 'select first 1 cpfcgc from clientes'+
            ' where cod_cliente = :cod_cliente' +
            ' and cod_empresa = :cod_empresa';
          vQrAux.ParamByName('cod_cliente').AsInteger := vNivel3.FieldByName('COD_PART').AsInteger;
          vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vQrAux.Open;

          if length(Trim(vQrAux.FieldByName('cpfcgc').AsString)) <> 14 then
            vBooleanTemp := False;

        end;

        if vBooleanTemp then
          if (vNivel3.FieldByName('natureza_nf').AsString = 'E') then
            vBooleanTemp := permiteCreditoPISCOFINS(vNivel3.FieldByName('cod_nf').AsInteger, StrToInt(FCodEmpresa));

        if vBooleanTemp then
        begin
          if not vC010 then
          begin
            vC010:= True;
            montaRegistro0140(FCodEmpresa);
            FSpedP.Bloco_C.RegistroC001.IND_MOV := imComDados;
            FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;

            with FSpedP.Bloco_C.RegistroC010New do
            begin
              CNPJ := Trim(FCNPJEmpresa);
              IND_ESCRI := IndEscriIndividualizado;
            end;
          end;

          with FSpedP.Bloco_C.RegistroC100New do
          begin
            COD_MOD := StrZero(vNivel3.FieldByName('COD_MOD').AsString, 2);
            if (vNivel3.FieldByName('extemporaneo').AsString = 'S') then
            begin
              if (UpperCase(vNivel3.FieldByName('status').AsString) = 'CANCELADA') then
                COD_SIT := sdCanceladoExtemp
              else if (vNivel3.FieldByName('TIPO_EMISSAO').AsString = '2') then
                COD_SIT := sdExtempCompl
              else if (vNivel3.FieldByName('TIPO_EMISSAO').AsString = '3') then
                COD_SIT := sdRegimeEspecNEsp
              else if (UpperCase(vNivel3.FieldByName('status').AsString) = 'FECHADA') then
                COD_SIT := sdExtempRegular
              else
                COD_SIT := sdRegimeEspecNEsp;
            end
            else if (UpperCase(vNivel3.FieldByName('status').AsString) = 'CANCELADA') then
              COD_SIT := sdCancelado
            else if (vNivel3.FieldByName('TIPO_EMISSAO').AsString = '2') and
              ((UpperCase(vNivel3.FieldByName('status').AsString) = 'FECHADA')) then
              COD_SIT := sdFiscalCompl
            else if ((UpperCase(vNivel3.FieldByName('status').AsString) = 'FECHADA')) then
              COD_SIT := sdRegular;
            if COD_MOD = '55' then
            begin
              if (UpperCase(vNivel3.FieldByName('situacao_nfe').AsString) = 'DENEGADA') then
                COD_SIT := sdDoctoDenegado
              else if (UpperCase(vNivel3.FieldByName('situacao_nfe').AsString) = 'INUTILIZADA') then
                COD_SIT := sdDoctoNumInutilizada;
            end;

            IND_OPER := _StrToTipoOperacaoPC(vNivel3.FieldByName('IND_OPER').AsString);
            IND_EMIT := _StrToEmitentePC(vNivel3.FieldByName('IND_EMIT').AsString);
            COD_MOD := StrZero(vNivel3.FieldByName('COD_MOD').AsString, 2);
            SER := Trim(vNivel3.FieldByName('SER').AsString);
            NUM_DOC := vNivel3.FieldByName('NUM_DOC').AsString;
//            if (vNivel3.FieldByName('emissao_propria').AsString) = 'S' then
              CHV_NFE := Trim(vNivel3.FieldByName('CHV_NFE').AsString);

            vBooleanTemp := False;
            if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada]) then
            begin
              vBooleanTemp := True;
              montaRegistro0150(vNivel3.FieldByName('COD_PART').AsString);
              COD_PART := vNivel3.FieldByName('COD_PART').AsString;
              DT_DOC := vNivel3.FieldByName('DT_DOC').AsDateTime;
              DT_E_S := vNivel3.FieldByName('DT_E_S').AsDateTime;
              if DT_E_S < DT_DOC then
                DT_E_S := DT_DOC
              else if DT_E_S > StrToDate(FDataFim) then
                DT_E_S := StrToDate(FDataFim);
              VL_DOC := vNivel3.FieldByName('VL_DOC').AsCurrency;
              if pos('VISTA', UpperCase(vNivel3.FieldByName('IND_PGTO').AsString)) > 0 then
                IND_PGTO := tpVista
              else if pos('SEM PAGAMENTO', UpperCase(vNivel3.FieldByName('IND_PGTO').AsString)) > 0 then
                IND_PGTO := tpSemPagamento
              else IND_PGTO := tpPrazo;

              VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
              VL_MERC := vNivel3.FieldByName('VL_MERC').AsCurrency;
              VL_FRT := vNivel3.FieldByName('VL_FRT').AsCurrency;
              VL_SEG := vNivel3.FieldByName('VL_SEG').AsCurrency;
              VL_OUT_DA := vNivel3.FieldByName('VL_OUT_DA').AsCurrency;

              if FSPED_REGISTROS_LIQ = 'S' then
              begin
                VL_MERC := VL_MERC + VL_FRT + VL_SEG + VL_OUT_DA;
              end;
//              begin
//                VL_DESC := 0;
//                VL_FRT := 0;
//                VL_SEG := 0;
//                VL_OUT_DA := 0;
//                VL_MERC := vNivel3.FieldByName('VL_MERC').AsCurrency -
//                  vNivel3.FieldByName('VL_DESC').AsCurrency +
//                  vNivel3.FieldByName('VL_FRT').AsCurrency +
//                  vNivel3.FieldByName('VL_SEG').AsCurrency +
//                  vNivel3.FieldByName('VL_OUT_DA').AsCurrency;
//              end
//              else
//              begin
//                VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
//                VL_MERC := vNivel3.FieldByName('VL_MERC').AsCurrency;
//                VL_FRT := vNivel3.FieldByName('VL_FRT').AsCurrency;
//                VL_SEG := vNivel3.FieldByName('VL_SEG').AsCurrency;
//                VL_OUT_DA := vNivel3.FieldByName('VL_OUT_DA').AsCurrency;
//              end;

              VL_ABAT_NT := vNivel3.FieldByName('VL_ABAT_NT').AsCurrency;
              if vNivel3.FieldByName('IND_FRT').AsString = '0' then
                IND_FRT := tfPorContaTerceiros
              else if vNivel3.FieldByName('IND_FRT').AsString = '1' then
                IND_FRT := tfPorContaEmitente
              else if vNivel3.FieldByName('IND_FRT').AsString = '2' then
                IND_FRT := tfPorContaDestinatario
              else
                IND_FRT := tfSemCobrancaFrete;
              VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsCurrency;
              VL_ICMS := vNivel3.FieldByName('VL_ICMS').AsCurrency;
              VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsCurrency;
              VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsCurrency;
              VL_IPI := vNivel3.FieldByName('VL_IPI').AsCurrency;

//              vNivel4.Close;
//              vNivel4.SQL.Text :=
//                'select sum(valor_pis) VL_PIS, sum(valor_cofins) VL_COFINS from notafiscal_item nfi'+
//                ' where nfi.cod_nf = '+vNivel3.FieldByName('cod_nf').AsString+
//                ' and nfi.cod_empresa = '+FCodEmpresa;
//              vNivel4.Open;
//              VL_PIS := vNivel4.FieldByName('VL_PIS').AsCurrency;
//              VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsCurrency;

              VL_PIS_ST := 0;//vNivel3.FieldByName('VL_PIS_ST').AsCurrency;
              VL_COFINS_ST := 0;//vNivel3.FieldByName('VL_COFINS_ST').AsCurrency;
            end;

            if vBooleanTemp then
            begin
              vNivel4.Close;
              vNivel4.SQL.Text := 'select c110.cod_inf, spc.txt, c110.txt_compl from' +
                ' notafiscal_sped_c110 c110 inner join sped_informacao_complementar spc on' +
                ' spc.cod_inf = c110.cod_inf and spc.cod_empresa = c110.cod_empresa' +
                ' where c110.cod_nf = :cod_nf and c110.cod_empresa = :cod_empresa' +
                ' order by c110.cod_inf';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;

              vNivel4.First;
              while not vNivel4.Eof do
              begin
                montaRegistro0450(vNivel4.FieldByName('cod_inf').AsInteger,
                  vNivel4.FieldByName('txt').AsString);

                vCampoString := Trim(getCampoBlobString(vNivel4.FieldByName('txt_compl').AsString));
                with FSpedP.Bloco_C.RegistroC110New do
                begin
                  COD_INF := vNivel4.FieldByName('cod_inf').AsString;
                  TXT_COMPL := vCampoString;
                end;

                vNivel5.Close;
                vNivel5.SQL.Text := 'select c111.cod_inf, c111.num_proc, c111.ind_proc,' +
                  ' c111.cod_acao_judicial, c111.cod_adm'+
                  ' from notafiscal_sped_c111 c111 where c111.cod_nf = :cod_nf and' +
                  ' c111.cod_empresa = :cod_empresa and c111.cod_inf = :cod_inf';
                vNivel5.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
                vNivel5.ParamByName('cod_inf').AsInteger := vNivel4.FieldByName('cod_inf').AsInteger;
                vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vNivel5.Open;
                while not vNivel5.Eof do
                begin
                  montaRegistro1010(vNivel5.FieldByName('COD_ACAO_JUDICIAL').AsInteger);
                  montaRegistro1020(vNivel5.FieldByName('COD_ADM').AsInteger);
                  with FSpedP.Bloco_C.RegistroC111New do
                  begin
                    NUM_PROC := vNivel5.FieldByName('NUM_PROC').AsString;
                    IND_PROC := _StrToOrigemProcessoPC(vNivel5.FieldByName('IND_PROC').AsString);
                  end;
                  vNivel5.Next;
                end;

                vNivel4.Next;
              end;

              if (vNivel3.FieldByName('natureza_nf').AsString = 'E') and
                (StrZero(Trim(vNivel3.FieldByName('COD_MOD').AsString),2) = '01') then
              begin
                vNivel4.Close;
                vNivel4.SQL.Text :=
                  'select c120.num_doc_imp, c120.num_acdraw, c120.cod_doc_imp, c120.pis_imp,' +
                  ' c120.cofins_imp from notafiscal_sped_c120 c120 where c120.cod_nf = :cod_nf and' +
                  ' c120.cod_empresa = :cod_empresa';
                vNivel4.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
                vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vNivel4.Open;

                while not vNivel4.Eof do
                begin
                  vCampoString := Trim(getCampoBlobString(vNivel4.FieldByName('txt_compl').AsString));
                  with FSpedP.Bloco_C.RegistroC120New do
                  begin
                    if vNivel4.FieldByName('COD_DOC_IMP').AsString = '0' then
                      COD_DOC_IMP := diImportacao
                    else
                      COD_DOC_IMP := diSimplificadaImport;
                    NUM_DOC__IMP := vNivel4.FieldByName('NUM_DOC_IMP').AsString;
                    PIS_IMP := vNivel4.FieldByName('PIS_IMP').AsCurrency;
                    COFINS_IMP := vNivel4.FieldByName('COFINS_IMP').AsCurrency;
                    NUM_ACDRAW := vNivel4.FieldByName('NUM_ACDRAW').AsString;
                  end;
                  vNivel4.Next;
                end;
              end;

              vNivel4.Close;
              vNivel4.SQL.Text :=
                'select nfi.nitem NUM_ITEM, nfi.tipo_item , nfi.grupo_prod, nfi.cod_prod,' +
                ' nfi.cod_servico, nfi.chassi,  nfi.num_fab_prod, nfi.descricao_item DESCR_COMPL,' +
                ' nfi.descricao_item_outras, nfi.quantidade QTD, nfi.referencia UNID,' +
                ' nfi.valor_total VL_ITEM, nfi.rateio_desconto VL_DESC, nfi.IND_MOV, nfi.altera_estoque_cfop,' +
                ' case when (nfi.tipo_item = ''S'') then ''041''' +
                '   else nfi.cst' +
                ' end CST_ICMS, nfi.csosn, nfi.codigo_nop CFOP, nfi.codigo_nop COD_NAT,' +
                ' nfi.base_icm VL_BC_ICMS, nfi.aliq_icm ALIQ_ICMS, nfi.valor_icm VL_ICMS,' +
                ' nfi.base_icmsub VL_BC_ICMS_ST, nfi.aliq_icmsub ALIQ_ST,' +
                ' nfi.valor_icmsub VL_ICMS_ST, nfi.cst_ipi, '''' COD_ENQ,' +
                ' nfi.base_ipi VL_BC_IPI, nfi.aliq_ipi ALIQ_IPI, nfi.valor_ipi VL_IPI,' +
                ' nfi.cst_pis, nfi.base_pis VL_BC_PIS, nfi.aliq_pis, nfi.quant_bc_pis, nfi.aliq_pis_quant,' +
                ' nfi.valor_pis VL_PIS, nfi.cst_cofins, nfi.base_cofins VL_BC_COFINS, nfi.aliq_cofins,' +
                ' nfi.quant_bc_cofins, nfi.aliq_cofins_quant,' +
                ' nfi.valor_cofins VL_COFINS, nfi.BASE_ISS VL_BC_ISSQN, nfi.ALIQ_ISS ALIQ_ISSQN,' +
                ' nfi.VALOR_ISS VL_ISSQN, null COD_CTA, nfi.nat_rec, nt.credito_pis_cofins, nt.receita_pis_cofins, nfi.cod_nf_dev,' +
                ' nfi.rateio_seguro, nfi.rateio_outdesp, nfi.rateio_frete ' +
                ' from notafiscal_item nfi' +
                ' inner join nat_op nt on nt.codigo_nop = nfi.codigo_nop' +
                //' inner join nat_op nt on nt.codigo_nop = nfi.codigo_nop and ((not nt.nat_bc_cred is null) and (rtrim(nt.nat_bc_cred) <> ''''))' +
                ' where nfi.cod_nf = :cod_nf and' +
                ' nfi.cod_empresa = :cod_empresa order by nfi.nitem';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;

              vNivel4.First;
              while not vNivel4.Eof do
              begin
                vrPis := 0;
                vrCofins := 0;
                with FSpedP.Bloco_C.RegistroC170New do
                begin
                  vTipoTemp := 'O';
                  NUM_ITEM := vNivel4.FieldByName('NUM_ITEM').AsString;
                  UNID := UpperCase(Trim(vNivel4.FieldByName('UNID').AsString));
                  if Trim(UNID) = '' then
                    UNID := 'UN';
                  if vNivel4.FieldByName('tipo_item').AsString = 'P' then
                  begin
                    vTipoTemp := 'P';
                    COD_ITEM := 'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
                      Trim(vNivel4.FieldByName('cod_prod').AsString), 16);

                    gravaSpedItem(vNivel4.FieldByName('tipo_item').AsString,
                      vNivel4.FieldByName('grupo_prod').AsInteger,
                      vNivel4.FieldByName('cod_prod').AsString, '', 0, '', UNID);
                  end
                  else if vNivel4.FieldByName('tipo_item').AsString = 'S' then
                  begin
                    vTipoTemp := 'S';
                    COD_ITEM := 'S' + StrZero(vNivel4.FieldByName('cod_servico').AsString, 16);

                    gravaSpedItem(vNivel4.FieldByName('tipo_item').AsString,
                      0, '', '', vNivel4.FieldByName('cod_servico').AsInteger, '', UNID);
                  end
                  else if vNivel4.FieldByName('tipo_item').AsString = 'V' then
                  begin
                    vTipoTemp := 'V';
                    COD_ITEM := StrZero(vNivel4.FieldByName('chassi').AsString, 17);

                    gravaSpedItem(vNivel4.FieldByName('tipo_item').AsString,
                      0, '', vNivel4.FieldByName('chassi').AsString,
                      0, '', UNID);
                  end
                  else if vNivel4.FieldByName('tipo_item').AsString = 'O' then
                  begin
                    COD_ITEM := 'O' + StrZero(vNivel3.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel4.FieldByName('NUM_ITEM').AsString, 3);

                    gravaSpedItem(vNivel4.FieldByName('tipo_item').AsString,
                      0, '', '', 0, ('O' +
                      StrZero(vNivel3.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel4.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                  end
                  else if vNivel4.FieldByName('tipo_item').AsString = 'D' then
                  begin
                    COD_ITEM := 'D' + StrZero(vNivel3.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel4.FieldByName('NUM_ITEM').AsString, 3);

                    gravaSpedItem(vNivel4.FieldByName('tipo_item').AsString,
                      0, '', '', 0, ('D' +
                      StrZero(vNivel3.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel4.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                  end;
                  if vNivel4.FieldByName('tipo_item').AsString = 'O' then
                    DESCR_COMPL :=
                      getCampoBlobString(vNivel4.FieldByName('descricao_item_outras').AsString)
                  else
                    DESCR_COMPL := vNivel4.FieldByName('DESCR_COMPL').AsString;
                  QTD := vNivel4.FieldByName('QTD').AsFloat;
                  VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency;
                  if FSPED_REGISTROS_LIQ = 'S' then
                  begin
                    VL_DESC := 0;
                    VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency -
                      vNivel4.FieldByName('VL_DESC').AsCurrency +
                      vNivel4.FieldByName('RATEIO_SEGURO').AsCurrency +
                      vNivel4.FieldByName('RATEIO_OUTDESP').AsCurrency +
                      vNivel4.FieldByName('RATEIO_FRETE').AsCurrency;
                  end
                  else
                    VL_DESC := vNivel4.FieldByName('VL_DESC').AsCurrency;
                  IND_MOV := _StrToMovimentacaoFisicaPC(IntToStr(vNivel4.FieldByName('IND_MOV').AsInteger));
                  if Trim(vNivel4.FieldByName('CSOSN').AsString) <> '' then
                    CST_ICMS := StrToCstIcms(Trim(vNivel4.FieldByName('CSOSN').AsString))
                  else
                    CST_ICMS := StrToCstIcms(Trim(vNivel4.FieldByName('CST_ICMS').AsString));
                  CFOP := vNivel4.FieldByName('CFOP').AsString;
                  vStringTemp := vNivel4.FieldByName('COD_NAT').AsString ;
                  if vStringTemp = '1913' then
                    vStringTemp := '1913';
                  //COD_NAT := vNivel4.FieldByName('COD_NAT').AsString ;
                  if vNivel3.FieldByName('codigo_nop').AsString = vNivel4.FieldByName('COD_NAT').AsString then
                    montaRegistro0400(vStringTemp, Trim(vNivel3.FieldByName('DESC_NATOP').AsString))
                  else
                    montaRegistro0400(vStringTemp, '');
                  COD_NAT := vStringTemp;
                  VL_BC_ICMS := vNivel4.FieldByName('VL_BC_ICMS').AsFloat;
                  ALIQ_ICMS := vNivel4.FieldByName('ALIQ_ICMS').AsFloat;
                  VL_ICMS := vNivel4.FieldByName('VL_ICMS').AsFloat;
                  if (copy(Trim(vNivel4.FieldByName('CST_ICMS').AsString), 2, 1) = '1') or
                  (copy(Trim(vNivel4.FieldByName('CST_ICMS').AsString), 2, 1) = '3') or
                  (copy(Trim(vNivel4.FieldByName('CST_ICMS').AsString), 2,1) = '7') or
                  (copy(Trim(vNivel4.FieldByName('CST_ICMS').AsString), 2,1) = '9') then
                  begin
                    VL_BC_ICMS_ST := vNivel4.FieldByName('VL_BC_ICMS_ST').AsFloat;
                    VL_ICMS_ST := vNivel4.FieldByName('VL_ICMS_ST').AsFloat;
                  end
                  else
                  begin
                    VL_BC_ICMS_ST := 0;
                    VL_ICMS_ST := 0;
                  end;
                  ALIQ_ST := vNivel4.FieldByName('ALIQ_ST').AsFloat;
                  IND_APUR := _StrToApuracaoIPIPC( FInd_apur_ipi);
                  if Trim(vNivel4.FieldByName('CST_IPI').AsString) <> '' then
                    CST_IPI := _StrToSituacaoTribIPI(Trim(vNivel4.FieldByName('CST_IPI').AsString))
                  else
                  begin
                    if vNivel4.FieldByName('VL_IPI').AsFloat > 0 then
                    begin
                      if vNivel3.FieldByName('natureza_nf').AsString = 'S' then
                        CST_IPI := _StrToSituacaoTribIPI('50')
                      else
                        CST_IPI := _StrToSituacaoTribIPI('00');
                    end
                    else
                    begin
                      if vNivel3.FieldByName('natureza_nf').AsString = 'S' then
                        CST_IPI := _StrToSituacaoTribIPI('52')
                      else
                        CST_IPI := _StrToSituacaoTribIPI('02');
                    end;
                  end;
                  COD_ENQ := Trim(vNivel4.FieldByName('COD_ENQ').AsString);
                  VL_BC_IPI := vNivel4.FieldByName('VL_BC_IPI').AsFloat;
                  ALIQ_IPI := vNivel4.FieldByName('ALIQ_IPI').AsFloat;
                  VL_IPI := vNivel4.FieldByName('VL_IPI').AsFloat;

                  if ((vNivel4.FieldByName('credito_pis_cofins').AsString = 'S') and
                    (vNivel4.FieldByName('CFOP').AsFloat < 3000)) or
                    ((vNivel4.FieldByName('receita_pis_cofins').AsString = 'S') and
                    (vNivel4.FieldByName('CFOP').AsFloat > 3000)) then
                  begin
                    CST_PIS := _StrToSituacaoTribPIS(Trim(vNivel4.FieldByName('CST_PIS').AsString));
                    if CST_PIS = stpisQtdeAliquotaUnidade then
                    begin
                      if vNivel4.FieldByName('QUANT_BC_PIS').AsFloat > 0 then
                        QUANT_BC_PIS := vNivel4.FieldByName('QUANT_BC_PIS').AsFloat;
                      ALIQ_PIS_R := vNivel4.FieldByName('ALIQ_PIS_QUANT').AsFloat;
                      if vNivel4.FieldByName('QUANT_BC_COFINS').AsFloat > 0 then
                        QUANT_BC_COFINS := vNivel4.FieldByName('QUANT_BC_COFINS').AsFloat;
                      ALIQ_COFINS_R := vNivel4.FieldByName('ALIQ_COFINS_QUANT').AsFloat;
                    end
                    else
                    begin
                      VL_BC_PIS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsFloat,2);
                      ALIQ_PIS_PERC := vNivel4.FieldByName('ALIQ_PIS').AsFloat;
                      VL_BC_COFINS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsFloat,2);
                      ALIQ_COFINS_PERC := vNivel4.FieldByName('ALIQ_COFINS').AsFloat;
                    end;
                    VL_PIS := vNivel4.FieldByName('VL_PIS').AsFloat;
                    CST_COFINS := _StrToSituacaoTribCOFINS(Trim(vNivel4.FieldByName('CST_COFINS').AsString));
                    VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsFloat;
                    if (Trim(vNivel4.FieldByName('CST_PIS').AsString) = '05') or
                      (Trim(vNivel4.FieldByName('CST_PIS').AsString) = '75') then
                    begin
                      VL_PIS_ST := VL_PIS_ST + vNivel4.FieldByName('VL_PIS').AsFloat;
                      VL_COFINS_ST := VL_COFINS_ST + vNivel4.FieldByName('VL_COFINS').AsFloat;
                    end;
                  end
                  else
                  begin
//                    if vNivel4.FieldByName('VL_BC_PIS').AsFloat > 0 then
                    begin
                      CST_PIS := _StrToSituacaoTribPIS('99');
                      CST_COFINS := _StrToSituacaoTribCOFINS('99');
                    end;
//                    else
//                    begin
//                      CST_PIS := _StrToSituacaoTribPIS('70');
//                      CST_COFINS := _StrToSituacaoTribCOFINS('70');
//                    end;
                  end;
                  COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);

                  if Trim(COD_CTA) = '' then
                  begin
                    vQrAux.Close;
                    vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                      ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_PIS').AsString))+
                      ' and TIPO = ' + QuotedStr(vTipoTemp) +
                      ' and SUBTIPO = ''N''';
                    vQrAux.Open;
                    if not vQrAux.IsEmpty then
                      COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
                  end;

                  if vNivel3.FieldByName('IND_OPER').AsInteger = 1 then
                    if CST_PIS in [{stpisValorAliquotaPorST, }stpisAliquotaZero, stpisIsentaContribuicao,
                      stpisSemIncidenciaContribuicao, stpisSuspensaoContribuicao, stpisMonofaticaAliquotaZero] then
                      acumulaRegistroM410(
                        vNivel4.FieldByName('CST_PIS').AsString,
                        COD_CTA, '',
                        vNivel4.FieldByName('NAT_REC').AsString, VL_ITEM);

                  if vNivel4.FieldByName('cod_nf_dev').AsFloat > 0 then
                    if vNivel3.FieldByName('natureza_nf').AsString = 'S' then
                      if FRegime = 'LUCRO REAL' then
                        if cfopDeDevolucao(Trunc(vNivel4.FieldByName('CFOP').AsFloat), vNivel3.FieldByName('natureza_nf').AsString) then
                        begin  
                          if CST_PIS = stpisQtdeAliquotaUnidade then
                          begin
                            QUANT_BC_PIS := 0;
                            QUANT_BC_COFINS := 0;
                          end
                          else
                          begin
                            VL_BC_PIS := 0;
                            VL_BC_COFINS := 0;
                          end;
                          VL_PIS := 0;
                          VL_COFINS := 0;
                        end;

                  if vNivel4.FieldByName('cod_nf_dev').AsFloat > 0 then
                    if vNivel3.FieldByName('natureza_nf').AsString = 'E' then
                      if FRegime = 'LUCRO PRESUMIDO' then
                        if cfopDeDevolucao(Trunc(vNivel4.FieldByName('CFOP').AsFloat), vNivel3.FieldByName('natureza_nf').AsString) then
                        begin
                          if CST_PIS = stpisQtdeAliquotaUnidade then
                          begin
                            QUANT_BC_PIS := 0;
                            QUANT_BC_COFINS := 0;
                          end
                          else
                          begin
                            VL_BC_PIS := 0;
                            VL_BC_COFINS := 0;
                          end;
                          VL_PIS := 0;
                          VL_COFINS := 0;
                        end;

                  vOKDev:= False;
                  if vNivel3.FieldByName('natureza_nf').AsString = 'E' then
                    if FRegime = 'LUCRO REAL' then
      //                if cfopDeDevolucao(Trunc(vNivel4.FieldByName('CFOP').AsFloat), vNivel3.FieldByName('natureza_nf').AsString) then
                        vOKDev:= True;

                  if vNivel3.FieldByName('natureza_nf').AsString = 'S' then
                    if FRegime = 'LUCRO PRESUMIDO' then
      //                if cfopDeDevolucao(Trunc(vNivel4.FieldByName('CFOP').AsFloat), vNivel3.FieldByName('natureza_nf').AsString) then
                        vOKDev:= True;

                  if (VL_COFINS > 0) and (vOKDev) then //and (FIncidTribPISCOFINS = '2') then
                  begin
                    vQrAux.Close;
                    vQrAux.SQL.Text := 'select nfi.codigo_nop, nf.natureza_nf, sum(nfi.quantidade) quantidade from notafiscal nf' +
                      ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
                      ' where nfi.cod_nf_dev = ' + IntToStr(vNivel3.FieldByName('cod_nf').AsInteger) +
                      ' and nfi.nitem_dev = ' + IntToStr(vNivel4.FieldByName('NUM_ITEM').AsInteger) +
                      ' and nfi.cod_empresa = ' + FCodEmpresa +
                      ' and nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and status <> ''Aberta'' and status <> ''Cancelada''' +
                      ' and (case when ((nf.emissao_propria = ''S'') and (nf.modelo_nf = ''55'')) then nf.situacao_nfe' +
                      ' else ''Autorizada'' end) = ''Autorizada''' +
                      ' and (nf.da is null or nf.da <> ''S'')' +
                      ' group by 1, 2';
                    vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
                    vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
                    vQrAux.Open;

                    if cfopDeDevolucao(Trunc(vQrAux.FieldByName('codigo_nop').AsFloat), vQrAux.FieldByName('natureza_nf').AsString) then
                      if vQrAux.FieldByName('quantidade').AsFloat > 0 then
                      begin
                        if vQrAux.FieldByName('quantidade').AsFloat >= vNivel4.FieldByName('QTD').AsFloat then
                        begin   
                          if CST_PIS = stpisQtdeAliquotaUnidade then
                          begin
                            QUANT_BC_PIS := 0;
                            QUANT_BC_COFINS := 0;
                          end
                          else
                          begin
                            VL_BC_PIS := 0;
                            VL_BC_COFINS := 0;
                          end;
                          VL_PIS := 0;
                          VL_COFINS := 0;
                        end
                        else
                        begin
                          if CST_PIS = stpisQtdeAliquotaUnidade then
                          begin
                            if QUANT_BC_PIS > 0 then
                              QUANT_BC_PIS := QUANT_BC_PIS - vQrAux.FieldByName('quantidade').AsFloat;

                            if QUANT_BC_COFINS > 0 then
                              QUANT_BC_COFINS := QUANT_BC_COFINS - vQrAux.FieldByName('quantidade').AsFloat;
                          end
                          else
                          begin
                            VL_BC_PIS :=  StrToFloatFormat((VL_BC_PIS / QTD) *
                              (vNivel4.FieldByName('QTD').AsFloat - vQrAux.FieldByName('quantidade').AsFloat),2);

                            VL_BC_COFINS :=  StrToFloatFormat((VL_BC_COFINS / QTD) *
                              (vNivel4.FieldByName('QTD').AsFloat - vQrAux.FieldByName('quantidade').AsFloat),2);
                          end;

                          VL_PIS :=  (VL_PIS / QTD) *
                            (vNivel4.FieldByName('QTD').AsFloat - vQrAux.FieldByName('quantidade').AsFloat);

                          VL_COFINS :=  (VL_COFINS / QTD) *
                            (vNivel4.FieldByName('QTD').AsFloat - vQrAux.FieldByName('quantidade').AsFloat);

                        end;

                        vQrAux1.Close;
        //                vQrAux1.SQL.Text := 'selec';
      //                  vQrAux1.Open;

                      end;
                  end;

                  vrPis := VL_PIS;
                  vrCofins := VL_COFINS;
                  
                end;

                VL_PIS := VL_PIS + vrPis;
                VL_COFINS := VL_COFINS + vrCofins;

                vNivel4.Next;
              end;
            end;//vBooleanTemp


            
          end;// FSpedP.Bloco_C.RegistroC100New
        end; //vBooleanTemp 1
      end;      
      vNivel3.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;

//    for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
//      if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].CNPJ = FCNPJEmpresa then
//        for J := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Count - 1 downto 0 do
//          if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].IND_OPER = tpEntradaAquisicao then
//            if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].VL_COFINS = 0 then
//              FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Delete(J);

    ///  Opeações consolidadas. NF-e C180, C190
    ///  Nao fazer, pois acima ja é possivel no C110

    verificaPISCOFINSNFSerieD;

    vNivel3.Close;
    vNivel3.SQL.Text := 'select ''02'' COD_MOD, min(nd.dataemissao) DT_DOC_INI,' +
      ' max(nd.dataemissao) DT_DOC_FIN, min(nd.numeronota) NUM_DOC_INI,' +
      ' max(nd.numeronota) NUM_DOC_FIN,' +
      ' sum( case when nd.status <> ''CANCELADA'' then nd.valor_geral' +
      '     else 0 end) VL_DOC,' +
      ' sum( case when nd.status = ''CANCELADA'' then nd.valor_geral' +
      '     else 0 end) VL_DOC_CANC' +
      ' from nf_serie_D nd' +
      ' where nd.dataemissao >= :dataIni and nd.dataemissao <=' +
      ' :dataFim and nd.cod_empresa = :cod_empresa group by 1';
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.Open;

    if not vNivel3.IsEmpty then
    begin
      montaRegistro0140(FCodEmpresa);
      FSpedP.Bloco_C.RegistroC001.IND_MOV := imComDados;
      FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
      FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
        'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
    end;
    vNivel3.First;
    while not vNivel3.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C380';
      Application.ProcessMessages;

      if not vC010 then
      begin
        vC010:= True;
        montaRegistro0140(FCodEmpresa);

        with FSpedP.Bloco_C.RegistroC010New do
        begin
          CNPJ := Trim(FCNPJEmpresa);
          IND_ESCRI := IndEscriIndividualizado;
        end;
      end;

      with FSpedP.Bloco_C.RegistroC380New do
      begin
        COD_MOD := Trim(vNivel3.FieldByName('COD_MOD').AsString);
        DT_DOC_INI := vNivel3.FieldByName('DT_DOC_INI').AsDateTime;
        DT_DOC_FIN := vNivel3.FieldByName('DT_DOC_FIN').AsDateTime;
        NUM_DOC_INI := vNivel3.FieldByName('NUM_DOC_INI').AsInteger;
        NUM_DOC_FIN := vNivel3.FieldByName('NUM_DOC_FIN').AsInteger;
        VL_DOC := vNivel3.FieldByName('VL_DOC').AsCurrency;
        VL_DOC_CANC := vNivel3.FieldByName('VL_DOC_CANC').AsCurrency;
      end;

      vNivel4.Close;
      vNivel4.SQL.Text := 'select ndi.cst_pis, ndi.grupo_prod, ndi.cod_prod,' +
        ' case when (ndi.cst_pis = ''03'') then 0 else ndi.aliq_pis' +
        '     end ALIQ_PIS,' +
        ' case when (ndi.cst_pis = ''03'') then ndi.quantid_item else 0' +
        '     end QUANT_BC_PIS,' +
        ' case when (ndi.cst_pis = ''03'') then ndi.aliq_pis else 0' +
        '     end ALIQ_PIS_QUANT,' +
        ' sum(ndi.vl_tot_item) VL_ITEM, sum(ndi.base_pis) VL_BC_PIS,' +
        ' sum(ndi.valor_pis) VL_PIS, '''' COD_CTA' +
        ' from nf_serie_d nd' +
        ' inner join nf_serie_d_itens ndi on ndi.numeronota = nd.numeronota and' +
        ' ndi.cod_empresa = nd.cod_empresa' +
        ' where nd.dataemissao >= :dataIni and nd.dataemissao <=' +
        ' :dataFim and nd.cod_empresa = :cod_empresa and nd.status <> ''CANCELADA'' ' +
        ' group by 1,2,3,4,5,6';
      vNivel4.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel4.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel4.Open;

      vNivel4.FetchAll;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel4.RecordCount;
      FProgressBar.Position := 1;

      vNivel4.First;
      while not vNivel4.Eof do
      begin
        FLabelStatus.Caption := 'Montando registro C381';
        Application.ProcessMessages;
        with FSpedP.Bloco_C.RegistroC381New do
        begin
          CST_PIS := _StrToSituacaoTribPIS(vNivel4.FieldByName('CST_PIS').AsString);
          COD_ITEM := 'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
            Trim(vNivel4.FieldByName('cod_prod').AsString), 16);

          gravaSpedItem('P', vNivel4.FieldByName('grupo_prod').AsInteger,
            vNivel4.FieldByName('cod_prod').AsString, '', 0, '', 'UN');

          VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency;
          if vNivel4.FieldByName('CST_PIS').AsString <> '03' then
          begin
            VL_BC_PIS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsCurrency,2);
            ALIQ_PIS := vNivel4.FieldByName('ALIQ_PIS').AsFloat;
          end
          else
          begin
            QUANT_BC_PIS := vNivel4.FieldByName('QUANT_BC_PIS').AsFloat;
            ALIQ_PIS_QUANT := vNivel4.FieldByName('ALIQ_PIS_QUANT').AsFloat;
          end;
          VL_PIS := vNivel4.FieldByName('VL_PIS').AsCurrency;
          COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);

          vTipoTemp := 'P';
          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_PIS').AsString))+
              ' and TIPO = ' + QuotedStr(vTipoTemp) +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;

          if CST_PIS in [{stpisValorAliquotaPorST, }stpisAliquotaZero, stpisIsentaContribuicao,
             stpisSemIncidenciaContribuicao, stpisSuspensaoContribuicao, stpisMonofaticaAliquotaZero] then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select case when coalesce(p.nat_rec,'''') = '''' then n.nat_rec' +
              ' else p.nat_rec end nat_rec from produtos p' +
              ' inner join nbm n on n.cod_ncm = p.nbm' +
              ' where p.grupo_prod = ' + vNivel4.FieldByName('grupo_prod').AsString +
              ' and cod_prod = ' + QuotedStr(vNivel4.FieldByName('cod_prod').AsString) +
              ' and cod_empresa = ' + FCodEmpresa;
            vQrAux.Open;

            if Trim(vQrAux.FieldByName('nat_rec').AsString) <> '' then
              acumulaRegistroM410(
                vNivel4.FieldByName('CST_PIS').AsString,
                COD_CTA, '',
                vQrAux.FieldByName('NAT_REC').AsString, VL_ITEM);
          end;

        end;
        vNivel4.Next;
        FProgressBar.Position := FProgressBar.Position + 1;
      end;

      vNivel4.Close;
      vNivel4.SQL.Text := 'select ndi.cst_cofins, ndi.grupo_prod, ndi.cod_prod,' +
        ' case when (ndi.cst_cofins = ''03'') then 0 else ndi.aliq_cofins' +
        '     end aliq_cofins,' +
        ' case when (ndi.cst_cofins = ''03'') then ndi.quantid_item else 0' +
        '     end QUANT_BC_COFINS,' +
        ' case when (ndi.cst_cofins = ''03'') then ndi.aliq_cofins else 0' +
        '     end ALIQ_COFINS_QUANT,' +
        ' sum(ndi.vl_tot_item) VL_ITEM, sum(ndi.base_cofins) VL_BC_COFINS,' +
        ' sum(ndi.valor_cofins) VL_COFINS, '''' COD_CTA' +
        ' from nf_serie_d nd' +
        ' inner join nf_serie_d_itens ndi on ndi.numeronota = nd.numeronota and' +
        ' ndi.cod_empresa = nd.cod_empresa' +
        ' where nd.dataemissao >= :dataIni and nd.dataemissao <=' +
        ' :dataFim and nd.cod_empresa = :cod_empresa and nd.status <> ''CANCELADA'' ' +
        ' group by 1,2,3,4,5,6';
      vNivel4.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel4.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel4.Open;

      vNivel4.FetchAll;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel4.RecordCount;
      FProgressBar.Position := 1;

      vNivel4.First;
      while not vNivel4.Eof do
      begin
        FLabelStatus.Caption := 'Montando registro C385';
        Application.ProcessMessages;
        with FSpedP.Bloco_C.RegistroC385New do
        begin
          CST_COFINS := _StrToSituacaoTribCOFINS(vNivel4.FieldByName('CST_COFINS').AsString);
          COD_ITEM := 'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
            Trim(vNivel4.FieldByName('cod_prod').AsString), 16);

          gravaSpedItem('P', vNivel4.FieldByName('grupo_prod').AsInteger,
            vNivel4.FieldByName('cod_prod').AsString, '', 0, '', 'UN');

          VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency;
          if vNivel4.FieldByName('CST_COFINS').AsString <> '03' then
          begin
            VL_BC_COFINS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsCurrency,2);
            ALIQ_COFINS := vNivel4.FieldByName('ALIQ_COFINS').AsFloat;
          end
          else
          begin
            QUANT_BC_COFINS := vNivel4.FieldByName('QUANT_BC_COFINS').AsFloat;
            ALIQ_COFINS_QUANT := vNivel4.FieldByName('ALIQ_COFINS_QUANT').AsFloat;
          end;
          VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsCurrency;
          COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);

          vTipoTemp := 'P';
          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_COFINS').AsString))+
              ' and TIPO = ' + QuotedStr(vTipoTemp) +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;

        end;
        vNivel4.Next;
        FProgressBar.Position := FProgressBar.Position + 1;
      end;
      vNivel3.Next;
    end;


    ///  Cupons fiscais
    FLabelStatus.Caption := 'Montando registro C400';
    vNivel3.Close;
    vNivel3.SQL.Text :=
      'select ''2D'' COD_MOD, cniee.modelo_ecf ECF_MOD, ti.num_serie_ecf ECF_FAB,' +
      ' ti.cod_terminal ECF_CX from terminal_impressoras ti' +
      ' inner join impressoras_cniee cniee on cniee.identificacao = ti.ident_cniee' +
      ' where cod_empresa = :cod_empresa order by 4';
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.Open;
    vNivel3.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;

    vNivel3.First;
    while not vNivel3.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C400';
      FLabelCupons.Caption := '';
      vStringTemp := vNivel3.FieldByName('ECF_CX').AsString + ' ' +
        vNivel3.FieldByName('ECF_FAB').AsString;
      Application.ProcessMessages;
      verificaCamposNullCupom(Trim(vNivel3.FieldByName('ECF_FAB').AsString),
        vNivel3.FieldByName('ECF_CX').AsInteger);
      _verificaPISCOFINSCupomFiscal(Trim(vNivel3.FieldByName('ECF_FAB').AsString),
        vNivel3.FieldByName('ECF_CX').AsInteger);
      FLabelStatus.Caption := 'Montando registro C400';
      if verificaCupomSemZ(Trim(vNivel3.FieldByName('ECF_FAB').AsString),
        vNivel3.FieldByName('ECF_CX').AsInteger) then
      begin
        FLabelStatus.Caption := 'Montando registro C400';
        vNivel4.Close;
        vNivel4.SQL.Text :=
          'select rd.data_mov DT_DOC, rd.cro_mov CRO, rd.nreducoes CRZ, rd.coored NUM_COO_FIN,' +
          ' rd.vltotgeral GT_FIN, rd.vlvendab VL_BRT' +
          ' from resumod rd where rd.cod_terminal = :cod_terminal and rd.nserieecf = :nserie' +
          ' and rd.cod_empresa = :cod_empresa and rd.data_mov >= :dataIni and rd.data_mov <= :dataFim' +
          ' order by rd.data_mov';
        vNivel4.ParamByName('cod_terminal').AsInteger := vNivel3.FieldByName('ECF_CX').AsInteger;
        vNivel4.ParamByName('nserie').AsString := vNivel3.FieldByName('ECF_FAB').AsString;
        vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel4.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
        vNivel4.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
        vNivel4.Open;
        vNivel4.FetchAll;
        FProgressBar.Min := 0;
        FProgressBar.Max := vNivel4.RecordCount;
        FProgressBar.Position := 1;
        vTemMovimentoReducaoZ := False;

        {if not vNivel4.IsEmpty then
        begin
          montaRegistro0140(FCodEmpresa);
          FSpedP.Bloco_C.RegistroC001.IND_MOV := imComDados;
          FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
          if not vC010 then
            with FSpedP.Bloco_C.RegistroC010New do
            begin
              CNPJ := Trim(FCNPJEmpresa);
              IND_ESCRI := IndEscriIndividualizado;
              vC010:= True;
            end;
          montaRegistroC400(vNivel3.FieldByName('COD_MOD').AsString,
            vNivel3.FieldByName('ECF_MOD').AsString,
            vNivel3.FieldByName('ECF_FAB').AsString,
            vNivel3.FieldByName('ECF_CX').AsString);
        end;}

        vNivel4.First;
        while not vNivel4.Eof do
        begin
          if vNivel4.FieldByName('VL_BRT').AsCurrency > 0 then
          begin
            if not vTemMovimentoReducaoZ then
            begin
              montaRegistro0140(FCodEmpresa);
              FSpedP.Bloco_C.RegistroC001.IND_MOV := imComDados;
              FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
              if not vC010 then
                with FSpedP.Bloco_C.RegistroC010New do
                begin
                  CNPJ := Trim(FCNPJEmpresa);
                  IND_ESCRI := IndEscriIndividualizado;
                  vC010:= True;
                end;
              montaRegistroC400(vNivel3.FieldByName('COD_MOD').AsString,
                vNivel3.FieldByName('ECF_MOD').AsString,
                vNivel3.FieldByName('ECF_FAB').AsString,
                vNivel3.FieldByName('ECF_CX').AsString);
              vTemMovimentoReducaoZ := True;
            end;

            FLabelCupons.Caption := vStringTemp + ' Dia: ' +
              DateToStr(vNivel4.FieldByName('DT_DOC').AsDateTime) + ' C405';
            Application.ProcessMessages;
            with FSpedP.Bloco_C.RegistroC405New do
            begin
              DT_DOC := vNivel4.FieldByName('DT_DOC').AsDateTime;
              CRO := vNivel4.FieldByName('CRO').AsInteger;
              CRZ := vNivel4.FieldByName('CRZ').AsInteger;
              NUM_COO_FIN := vNivel4.FieldByName('NUM_COO_FIN').AsInteger;
              GT_FIN := vNivel4.FieldByName('GT_FIN').AsCurrency;
              // o valor de venda bruta vai sendo incrementado no c420
              VL_BRT := vNivel4.FieldByName('VL_BRT').AsCurrency;
              //VL_BRT := 0;

              FLabelCupons.Caption := vStringTemp + ' Dia: ' +
              DateToStr(vNivel4.FieldByName('DT_DOC').AsDateTime) + ' C481 e C485';
              Application.ProcessMessages;

              vNivel5.Close;
              vNivel5.SQL.Text :=
                'select cp2.prod_serv tipo_item, cp2.grupo_prod, cp2.cod_prod, cp2.cst_pis, cp2.cst_cofins,' +
                ' cp2.aliq_pis, cp2.aliq_cofins,' +

                ' case when cp2.prod_serv = ''P'' then p.unidade else ts.unidade end UNID,' +
                ' case when cp2.prod_serv = ''P'' then p.isento_pis else ts.isento_pis end isento_pis,' +
                //' nn.nat_rec,' +

                ' sum( cp2.total ) VL_ITEM,' +

                ' sum( coalesce(cp2.total,0) + coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc,0) -' +
                ' coalesce(cp2.rat_desc,0) - coalesce(cp2.perc_desc,0) ) VL_ITEM_LIQUIDO,' +
                ' sum(coalesce(cp2.base_pis,0)) base_pis, sum(coalesce(cp2.base_cofins,0)) base_cofins,' +
                ' sum(cp2.quantidade) QTDE_BC, sum(cp2.valor_pis) VL_PIS,' +
                ' sum(cp2.valor_cofins) VL_COFINS, '''' COD_CTA' +
                ' from cupom cp inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
                ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
                ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
                ' left join produtos p on p.grupo_prod = cp2.grupo_prod and p.cod_prod =' +
                ' cp2.cod_prod and p.cod_empresa = cp2.cod_empresa' +

                ' left join tipo_servico ts on ts.cod_servico = cp2.grupo_prod' +
                //' left join nbm nn on nn.cod_ncm = p.nbm'+

                ' where ((cp2.status_it <> ''CANCELADO'') or (cp2.status_it IS NULL))' +
                ' and ((cp.status_cp <> ''CANCELADO'') or (cp.status_cp is null))' +
                ' and cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
                ' and cp2.cod_empresa = :cod_empresa and cp.data = :dia group by 1,2,3,4,5,6,7,8,9';//,10';
              vNivel5.ParamByName('dia').AsDate := vNivel4.FieldByName('DT_DOC').AsDateTime;
              vNivel5.ParamByName('cod_terminal').AsInteger :=
                vNivel3.FieldByName('ECF_CX').AsInteger;
              vNivel5.ParamByName('nserie').AsString := vNivel3.FieldByName('ECF_FAB').AsString;
              vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel5.Open;
              vNivel5.FetchAll;

              FProgressBar2.Min := 0;
              FProgressBar2.Max := vNivel5.RecordCount;
              FProgressBar2.Position := 1;

              vNivel5.First;
              while not vNivel5.Eof do
              begin
//                if (vNivel5.FieldByName('VL_PIS').AsFloat > 0) or (vNivel5.FieldByName('VL_COFINS').AsFloat > 0 ) then
                begin
                  with FSpedP.Bloco_C.RegistroC481New do
                  begin
                    vUnid := UpperCase(Trim(vNivel5.FieldByName('UNID').AsString));
                    if Trim(vUnid) = '' then
                      vUnid := 'UN';

                    if vNivel5.FieldByName('tipo_item').AsString = 'P' then
                    begin
                      COD_ITEM := 'P' + StrZero(vNivel5.FieldByName('grupo_prod').AsString +
                        Trim(vNivel5.FieldByName('cod_prod').AsString), 16);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        vNivel5.FieldByName('grupo_prod').AsInteger,
                        vNivel5.FieldByName('cod_prod').AsString, '', 0, '', vUnid);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'S' then
                    begin
                      COD_ITEM := 'S' + StrZero(vNivel5.FieldByName('grupo_prod').AsString, 16);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', '', vNivel5.FieldByName('grupo_prod').AsInteger, '', vUnid);
                    end;

                    vTipoTemp := Trim(vNivel5.FieldByName('cst_pis').AsString);
                    if Trim(vNivel5.FieldByName('cst_pis').AsString) <> '' then
                      CST_PIS := _StrToSituacaoTribPIS(Trim(vNivel5.FieldByName('cst_pis').AsString))
                    else if (Trim(vNivel5.FieldByName('isento_pis').AsString) = 'S') then
                    begin
                      CST_PIS := stpisMonofaticaAliquotaZero;
                      vTipoTemp := '04';
                    end
                    else
                    begin
                      CST_PIS := stpisValorAliquotaNormal;
                      vTipoTemp := '01';
                    end;

                    if (FSPED_C481_LIQ = 'S') or (FSPED_REGISTROS_LIQ = 'S') then
                      VL_ITEM := vNivel5.FieldByName('VL_ITEM_LIQUIDO').AsFloat
                    else
                      VL_ITEM := vNivel5.FieldByName('VL_ITEM').AsFloat;

                    if CST_PIS = stpisQtdeAliquotaUnidade then
                    begin
//                      VL_BC_PIS := 0;
//                      ALIQ_PIS := 0;
                      ALIQ_PIS_QUANT := vNivel5.FieldByName('aliq_pis').AsFloat;
                      QUANT_BC_PIS := vNivel5.FieldByName('QTDE_BC').AsFloat;
                    end
                    else if CST_PIS = stpisValorAliquotaDiferenciada then
                    begin
                      VL_BC_PIS := StrToFloatFormat(vNivel5.FieldByName('VL_ITEM_LIQUIDO').AsFloat,2);
                      ALIQ_PIS := vNivel5.FieldByName('aliq_pis').AsFloat;
//                      ALIQ_PIS_QUANT := 0;
//                      QUANT_BC_PIS := 0;
                    end
                    else
                    begin
                      VL_BC_PIS := StrToFloatFormat(vNivel5.FieldByName('VL_ITEM_LIQUIDO').AsFloat,2);
                      ALIQ_PIS := vNivel5.FieldByName('aliq_pis').AsFloat;
//                      ALIQ_PIS_QUANT := 0;
//                      QUANT_BC_PIS := 0;

                      if ALIQ_PIS = 0 then
                        VL_BC_PIS := 0;
                    end;
                    VL_PIS := VL_BC_PIS * ALIQ_PIS / 100;
                    COD_CTA := Trim(vNivel5.FieldByName('COD_CTA').AsString);

                    if Trim(COD_CTA) = '' then
                    begin
                      vQrAux.Close;
                      vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                        ' where CST = '+ QuotedStr(Trim(vTipoTemp))+
                        ' and TIPO = ' + QuotedStr(vNivel5.FieldByName('tipo_item').AsString) +
                        ' and SUBTIPO = ''N''';
                      vQrAux.Open;
                      if not vQrAux.IsEmpty then
                        COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
                    end;

                    if (vNivel5.FieldByName('tipo_item').AsString = 'P') and
                      (CST_PIS in [{stpisValorAliquotaPorST, }stpisAliquotaZero, stpisIsentaContribuicao,
                       stpisSemIncidenciaContribuicao, stpisSuspensaoContribuicao, stpisMonofaticaAliquotaZero]) then
                    begin
                      vQrAux.Close;
                      vQrAux.SQL.Text := 'select case when coalesce(p.nat_rec,'''') = '''' then n.nat_rec' +
                        ' else p.nat_rec end nat_rec from produtos p' +
                        ' inner join nbm n on n.cod_ncm = p.nbm' +
                        ' where p.grupo_prod = ' + vNivel5.FieldByName('grupo_prod').AsString +
                        ' and cod_prod = ' + QuotedStr(vNivel5.FieldByName('cod_prod').AsString) +
                        ' and cod_empresa = ' + FCodEmpresa;
                      vQrAux.Open;

                      if Trim(vQrAux.FieldByName('nat_rec').AsString) <> '' then
                        acumulaRegistroM410(
                          vNivel5.FieldByName('CST_PIS').AsString,
                          COD_CTA, '',
                          vQrAux.FieldByName('NAT_REC').AsString, VL_ITEM);
//
//                      if Trim(vNivel5.FieldByName('nat_rec').AsString) <> '' then
//                        acumulaRegistroM410(
//                          vNivel5.FieldByName('CST_PIS').AsString,
//                          COD_CTA, '',
//                          vNivel5.FieldByName('NAT_REC').AsString, VL_ITEM);

                    end
                    else if (vNivel5.FieldByName('tipo_item').AsString = 'S')  then
                    begin
                      vQrAux.Close;
                      vQrAux.SQL.Text := 'select t.nat_rec from tipo_servico t' +
                        ' where t.cod_servico = ' + vNivel5.FieldByName('grupo_prod').AsString;
                      vQrAux.Open;

                      if not (CST_PIS = stpisValorAliquotaPorST) then //Dia 07/05/2014. PVA nao esta validando o registro M400 e M800 com cst 05
                      if Trim(vQrAux.FieldByName('nat_rec').AsString) <> '' then
                        acumulaRegistroM410(
                          vNivel5.FieldByName('CST_PIS').AsString,
                          COD_CTA, '', vQrAux.FieldByName('NAT_REC').AsString, VL_ITEM);
                    end;


                  end;

                  with FSpedP.Bloco_C.RegistroC485New do
                  begin
                    vUnid := UpperCase(Trim(vNivel5.FieldByName('UNID').AsString));
                    if Trim(vUnid) = '' then
                      vUnid := 'UN';

                    if vNivel5.FieldByName('tipo_item').AsString = 'P' then
                    begin
                      COD_ITEM := 'P' + StrZero(vNivel5.FieldByName('grupo_prod').AsString +
                        Trim(vNivel5.FieldByName('cod_prod').AsString), 16);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        vNivel5.FieldByName('grupo_prod').AsInteger,
                        vNivel5.FieldByName('cod_prod').AsString, '', 0, '', vUnid);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'S' then
                    begin
                      COD_ITEM := 'S' + StrZero(vNivel5.FieldByName('grupo_prod').AsString, 16);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', '', vNivel5.FieldByName('grupo_prod').AsInteger, '', vUnid);
                    end;

                    vTipoTemp := Trim(vNivel5.FieldByName('CST_COFINS').AsString);
                    if Trim(vNivel5.FieldByName('CST_COFINS').AsString) <> '' then
                      CST_COFINS := _StrToSituacaoTribCOFINS(Trim(vNivel5.FieldByName('cst_cofins').AsString))
                    else if (Trim(vNivel5.FieldByName('isento_pis').AsString) = 'S') then
                    begin
                      CST_COFINS := stcofinsMonofaticaAliquotaZero;
                      vTipoTemp := '04';
                    end
                    else
                    begin
                      CST_COFINS := stcofinsValorAliquotaNormal;
                      vTipoTemp := '01';
                    end;

                    if (FSPED_C481_LIQ = 'S') or (FSPED_REGISTROS_LIQ = 'S') then
                      VL_ITEM := vNivel5.FieldByName('VL_ITEM_LIQUIDO').AsFloat
                    else
                      VL_ITEM := vNivel5.FieldByName('VL_ITEM').AsFloat;

                    if CST_COFINS = stcofinsQtdeAliquotaUnidade then
                    begin
//                      VL_BC_COFINS := 0;
//                      ALIQ_COFINS := 0;
                      ALIQ_COFINS_QUANT := vNivel5.FieldByName('aliq_cofins').AsFloat;
                      QUANT_BC_COFINS := vNivel5.FieldByName('QTDE_BC').AsFloat;
                    end
                    else if CST_COFINS = stcofinsValorAliquotaDiferenciada then
                    begin
                      VL_BC_COFINS := StrToFloatFormat(vNivel5.FieldByName('VL_ITEM_LIQUIDO').AsFloat,2);
                      ALIQ_COFINS := vNivel5.FieldByName('aliq_cofins').AsFloat;
//                      ALIQ_COFINS_QUANT := 0;
//                      QUANT_BC_COFINS := 0;
                    end
                    else
                    begin
                      VL_BC_COFINS := StrToFloatFormat(vNivel5.FieldByName('VL_ITEM_LIQUIDO').AsFloat,2);
                      ALIQ_COFINS := vNivel5.FieldByName('aliq_cofins').AsFloat;
//                      ALIQ_COFINS_QUANT := 0;
//                      QUANT_BC_COFINS := 0;

                      if ALIQ_COFINS = 0 then
                        VL_BC_COFINS := 0;
                    end;
                    VL_COFINS := VL_BC_COFINS * ALIQ_COFINS / 100;
                    COD_CTA := Trim(vNivel5.FieldByName('COD_CTA').AsString);

                    if Trim(COD_CTA) = '' then
                    begin
                      vQrAux.Close;
                      vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                        ' where CST = '+ QuotedStr(Trim(vTipoTemp))+
                        ' and TIPO = ' + QuotedStr(Trim(vNivel5.FieldByName('tipo_item').AsString)) +
                        ' and SUBTIPO = ''N''';
                      vQrAux.Open;
                      if not vQrAux.IsEmpty then
                        COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
                    end;

                    //O acumulado do M810 ja é feito automaticamente pelo M410

                  end;

                end;

                vNivel5.Next;
                FProgressBar2.Position := FProgressBar2.Position + 1;
                Application.ProcessMessages;
              end; // while vNivel5

            end; //FSpedP.Bloco_C.RegistroC405New

          end; // valor de venda bruta maior que zero

          vNivel4.Next;
          FProgressBar.Position := FProgressBar.Position + 1;
          Application.ProcessMessages;
        end;

      end;// Cupom sem redução Z

      vNivel3.Next;
    end;
    FLabelCupons.Caption := '';
    Application.ProcessMessages;

    
    if (FRegime = 'LUCRO PRESUMIDO') and (FIndicadorRegimeCumulativo = 9) then
      Exit;

    ///  Energia eletrica
    vNivel3.Close;
    vNivel3.SQL.Text := 'select nf.cod_nf, nf.natureza_nf,' +
      ' nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
      ' else nf.serie end SER, nf.subserie SUB, nf.num_nf NUM_DOC, nf.data_contabil DT_DOC,' +
      ' nf.data_lanc DT_ENT, nf.valor_total VL_DOC, nf.valor_icm VL_ICMS,' +
      ' nf.valor_pis VL_PIS, nf.valor_cofins VL_COFINS,' +
      ' nf.extemporaneo, nf.TIPO_EMISSAO, nf.status ' +
      ' from notafiscal nf' +
      ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
      ' nf.modelo_nf in (''6'',''06'',''28'',''29'')'+
      ' and nf.natureza_nf = ''E'''+
      ' and (nf.da is null or nf.da <> ''S'')';
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.Open;

    vNivel3.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;
    FProgressBar.Position := 1;

    vNivel3.First;
    while not vNivel3.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C500';
      Application.ProcessMessages;

      vQrAux.Close;
      vQrAux.SQL.Text := 'select first 1 nfi.cod_nf from notafiscal_item nfi' +
        ' inner join nat_op nt on nt.codigo_nop = nfi.codigo_nop' + // and ((not nt.nat_bc_cred is null) and (rtrim(nt.nat_bc_cred) <> ''''))' +
        ' where nfi.cod_nf = :cod_nf and' +
        ' nfi.cod_empresa = :cod_empresa';
      if (vNivel3.FieldByName('natureza_nf').AsString = 'E') then
        vQrAux.SQL.Text := vQrAux.SQL.Text + ' and credito_pis_cofins = ''S'''
      else
        vQrAux.SQL.Text := vQrAux.SQL.Text + ' and receita_pis_cofins = ''S''';
      vQrAux.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
      vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrAux.Open;

      vBooleanTemp := not vQrAux.IsEmpty;

      if vBooleanTemp then// (vNivel3.FieldByName('VL_PIS').AsCurrency > 0) and (vBooleanTemp) then
      begin

        if not vNivel3.IsEmpty then
        begin
          montaRegistro0140(FCodEmpresa);
          FSpedP.Bloco_C.RegistroC001New.IND_MOV := imComDados;
          FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
          if not vC010 then
            with FSpedP.Bloco_C.RegistroC010New do
            begin
              CNPJ := Trim(FCNPJEmpresa);
              IND_ESCRI := IndEscriIndividualizado;
              vC010:= True;
            end;
          FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
            'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
        end;

        with FSpedP.Bloco_C.RegistroC500New do
        begin
          COD_MOD := StrZero(vNivel3.FieldByName('COD_MOD').AsString, 2);
          if (vNivel3.FieldByName('extemporaneo').AsString = 'S') then
          begin
            if (vNivel3.FieldByName('TIPO_EMISSAO').AsString = '2') then
              COD_SIT := sdExtempCompl
            else if (UpperCase(vNivel3.FieldByName('status').AsString) = 'FECHADA') then
              COD_SIT := sdExtempRegular
            else
              COD_SIT := sdRegimeEspecNEsp;
          end
          else if (vNivel3.FieldByName('TIPO_EMISSAO').AsString = '2') and
            ((UpperCase(vNivel3.FieldByName('status').AsString) = 'FECHADA')) then
            COD_SIT := sdFiscalCompl
          else if ((UpperCase(vNivel3.FieldByName('status').AsString) = 'FECHADA')) then
            COD_SIT := sdRegular;
          if COD_MOD = '55' then
          begin
            if (UpperCase(vNivel3.FieldByName('status').AsString) = 'DENEGADA') then
              COD_SIT := sdDoctoDenegado
            else if (UpperCase(vNivel3.FieldByName('status').AsString) = 'INUTILIZADA') then
              COD_SIT := sdDoctoNumInutilizada;
          end;

          SER := Trim(vNivel3.FieldByName('SER').AsString);
          if Trim(vNivel3.FieldByName('SUB').AsString) <> '' then
            SUB := StrToInt(Trim(vNivel3.FieldByName('SUB').AsString));
          NUM_DOC := vNivel3.FieldByName('NUM_DOC').AsInteger;
          DT_DOC := vNivel3.FieldByName('DT_DOC').AsDateTime;
          DT_ENT := vNivel3.FieldByName('DT_ENT').AsDateTime;
          montaRegistro0150(vNivel3.FieldByName('COD_PART').AsString);
          COD_PART := vNivel3.FieldByName('COD_PART').AsString;
          VL_DOC := vNivel3.FieldByName('VL_DOC').AsCurrency;
          VL_ICMS := vNivel3.FieldByName('VL_ICMS').AsCurrency;
          VL_PIS := vNivel3.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsCurrency;

          vQrAux.Close;
          vQrAux.SQL.Text := 'select first 1 cod_inf from notafiscal_sped_c110 c110' +
            ' where c110.cod_nf = ' +vNivel3.FieldByName('cod_nf').AsString +
            ' and c110.cod_empresa = ' + FCodEmpresa;
          vQrAux.Open;
          if vQrAux.FieldByName('cod_inf').AsInteger > 0 then
          begin
            COD_INF := vQrAux.FieldByName('cod_inf').AsString;
            montaRegistro0450(vQrAux.FieldByName('cod_inf').AsInteger, '');
          end;
        end;

        vNivel4.Close;
        vNivel4.SQL.Text :=
          'select nfi.cst_pis, nfi.cst_cofins, nfi.aliq_pis, nfi.aliq_cofins, '''' NAT_BC_CRED, '''' COD_CTA,' +
          ' sum (nfi.valor_total - nfi.rateio_desconto + nfi.valor_ipi +' +
          ' nfi.rateio_seguro + nfi.rateio_outdesp + nfi.rateio_acres_fin ) VL_ITEM,' +
          ' sum(nfi.base_pis) vl_bc_pis, sum(nfi.valor_pis) VL_PIS,' +
          ' sum(nfi.base_cofins) vl_bc_cofins, sum(nfi.valor_cofins) vl_cofins' +
          ' from notafiscal_item nfi' +
          ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa group by 1,2,3,4,5,6';
        vNivel4.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
        vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel4.Open;

        vNivel4.first;
        while not vNivel4.Eof do
        begin
          with FSpedP.Bloco_C.RegistroC501New do
          begin
            CST_PIS := _StrToSituacaoTribPIS(Trim(vNivel4.FieldByName('CST_PIS').AsString));
            VL_ITEM := vNivel4.FieldByName('vl_item').AsFloat;
            if Trim(vNivel4.FieldByName('NAT_BC_CRED').AsString) <> '' then
              NAT_BC_CRED := _StrToBaseCalculoCredito(Trim(vNivel4.FieldByName('NAT_BC_CRED').AsString))
            else if StrZero(vNivel3.FieldByName('COD_MOD').AsString, 2) = '06' then
              NAT_BC_CRED := bccEnergiaEletricaTermica
            else
              NAT_BC_CRED := bccAqBensUtiComoInsumo;

            VL_BC_PIS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsFloat,2);
            ALIQ_PIS := vNivel4.FieldByName('ALIQ_PIS').AsFloat;
            VL_PIS := vNivel4.FieldByName('VL_PIS').AsFloat;
            COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);

            if Trim(COD_CTA) = '' then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_PIS').AsString))+
                ' and TIPO = ' + QuotedStr('O') +
                ' and SUBTIPO = ''N''';
              vQrAux.Open;
              if not vQrAux.IsEmpty then
                COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
            end;

          end;
          vNivel4.Next;
        end;

        vNivel4.first;
        while not vNivel4.Eof do
        begin
          with FSpedP.Bloco_C.RegistroC505New do
          begin
            CST_COFINS := _StrToSituacaoTribCOFINS(Trim(vNivel4.FieldByName('CST_COFINS').AsString));
            VL_ITEM := vNivel4.FieldByName('vl_item').AsFloat;
            if Trim(vNivel4.FieldByName('NAT_BC_CRED').AsString) <> '' then
              NAT_BC_CRED := _StrToBaseCalculoCredito(Trim(vNivel4.FieldByName('NAT_BC_CRED').AsString))
            else if StrZero(vNivel3.FieldByName('COD_MOD').AsString, 2) = '06' then
              NAT_BC_CRED := bccEnergiaEletricaTermica
            else
              NAT_BC_CRED := bccAqBensUtiComoInsumo;

            VL_BC_COFINS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsFloat,2);
            ALIQ_COFINS := vNivel4.FieldByName('ALIQ_COFINS').AsFloat;
            VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsFloat;
            COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);

            if Trim(COD_CTA) = '' then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_COFINS').AsString))+
                ' and TIPO = ' + QuotedStr('O') +
                ' and SUBTIPO = ''N''';
              vQrAux.Open;
              if not vQrAux.IsEmpty then
                COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
            end;

          end;
          vNivel4.Next;
        end;

        vNivel4.Close;
        vNivel4.SQL.Text := 'select c111.cod_inf, c111.num_proc, c111.ind_proc,' +
          ' c111.cod_acao_judicial, c111.cod_adm'+
          ' from notafiscal_sped_c111 c111 where c111.cod_nf = :cod_nf and' +
          ' c111.cod_empresa = :cod_empresa';
        vNivel4.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
        vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel4.Open;

        vNivel4.first;
        while not vNivel4.Eof do
        begin
          montaRegistro1010(vNivel4.FieldByName('COD_ACAO_JUDICIAL').AsInteger);
          montaRegistro1020(vNivel4.FieldByName('COD_ADM').AsInteger);
          with FSpedP.Bloco_C.RegistroC509New do
          begin
            NUM_PROC := vNivel5.FieldByName('NUM_PROC').AsString;
            IND_PROC := _StrToOrigemProcessoPC(vNivel5.FieldByName('IND_PROC').AsString);
          end;
          vNivel4.Next;
        end;

      end;
      vNivel3.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;
    FLabelStatus.Caption := 'Finalizando Bloco C';

  finally
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
  end;
end;

procedure TSpedPISCOFINS.__montarBlocoD;
var
  vBooleanTemp: Boolean;
  vD010: Boolean;
begin
  if (FIndicadorRegimeCumulativo = 1) or (FIndicadorRegimeCumulativo = 2) then
    Exit;

  try
    vD010 := False;
//    FSpedP.Bloco_D.RegistroD001.IND_MOV := imSemDados;

    verificaPISCOFINSServicoTransporte;
    
    vNivel3.Close;
    vNivel3.SQL.Text :=
      'select st.cod_serv_transp, ''0'' IND_OPER, ''1'' IND_EMIT, ''T''||st.cod_transportador COD_PART,' +
      ' st.modelo COD_MOD, ''00'' COD_SIT, st.serie SER, st.sub_serie SUB,' +
      ' st.num_documento NUM_DOC, st.CHV_CTE, st.data_emissao DT_DOC, st.data_lancamento DT_A_P,' +
      ' '''' TP_CT_e, '''' CHV_CTE_REF, st.valor_total VL_DOC, 0 VL_DESC,' +
      ' case when st.cif_fob_outros is null then 0 else st.cif_fob_outros end IND_FRT,' +
      ' st.valor_total VL_SERV, st.base_calc_icms' +
      ' VL_BC_ICMS, st.valor_icms VL_ICMS,' +
      ' ((case when st.outras is null then 0' +
      '     else st.outras' +
      ' end) +' +
      ' (case when st.isenta_n_tribut is null then 0' +
      '     else st.isenta_n_tribut' +
      ' end)) VL_NT, '''' COD_INF, '''' COD_CTA,' +
      ' st.IND_NAT_FRT, st.NAT_BC_CRED, st.CST_PIS, st.CST_COFINS,' +
      ' st.ALIQ_PIS, st.ALIQ_COFINS, st.BASE_PIS VL_BC_PIS, st.BASE_COFINS VL_BC_COFINS,' +
      ' st.VALOR_PIS VL_PIS, st.VALOR_COFINS VL_COFINS, st.cfop' +
      ' from servico_transporte st' +
      ' where st.data_lancamento >= :dataIni and st.data_lancamento <= :dataFim and' +
      ' st.cod_empresa = :cod_empresa and' +
      ' ((coalesce(st.valor_pis,0) > 0) or (coalesce(st.valor_cofins,0) > 0))' +
      ' and (((st.tipo = ''E'') and (st.cif_fob_outros = 2)) or ( (st.tipo = ''S'') and (st.cif_fob_outros = 1)))';
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.Open;

    vNivel3.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;
    FProgressBar.Position := 1;

    vNivel3.First;
    while not vNivel3.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro D100';
      Application.ProcessMessages;
      vQrAux.Close;
      vQrAux.SQL.Text := 'select first 1 nt.codigo_nop from nat_op nt ' + // and credito_pis_cofins = ''S''' +// ((not nt.nat_bc_cred is null) and (rtrim(nt.nat_bc_cred) <> ''''))' +
        ' where nt.codigo_nop = :codigo_nop';
      vQrAux.SQL.Text := vQrAux.SQL.Text + ' and nt.credito_pis_cofins = ''S''';
      vQrAux.ParamByName('codigo_nop').AsFloat := vNivel3.FieldByName('cfop').AsInteger;
      vQrAux.Open;

      vBooleanTemp := not vQrAux.IsEmpty;

      if vBooleanTemp then
      begin

//        if FSpedP.Bloco_D.RegistroD001.IND_MOV = imSemDados then
        if not vD010 then
        begin
          vD010:= True;
          montaRegistro0140(FCodEmpresa);
          FSpedP.Bloco_D.RegistroD001.IND_MOV := imComDados;
          FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
//          if not vD010 then
//          begin
            FSpedP.Bloco_D.RegistroD010New.CNPJ := Trim(FCNPJEmpresa);
//            vD010:= True;
//          end;
          FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
            'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
        end;

        with FSpedP.Bloco_D.RegistroD100New do
        begin
  //        IND_OPER := _StrToIndicadorTpOperacao(vNivel3.FieldByName('IND_OPER').AsString);
          IND_OPER := vNivel3.FieldByName('IND_OPER').AsString;
          IND_EMIT := _StrToIndicadorEmitenteDF(vNivel3.FieldByName('IND_EMIT').AsString);
          COD_MOD := StrZero(vNivel3.FieldByName('COD_MOD').AsString, 2);
          COD_SIT := sdfRegular;
          SER := Trim(vNivel3.FieldByName('SER').AsString);
          SUB := Trim(vNivel3.FieldByName('SUB').AsString);
          NUM_DOC := vNivel3.FieldByName('NUM_DOC').AsString;
          vBooleanTemp := False;
          if not (COD_SIT in [sdfCancelado, sdfExtCancelado, sdfDenegado, sdfInutilizado]) then
          begin

            vBooleanTemp := True;
            COD_PART := Trim(vNivel3.FieldByName('COD_PART').AsString);
            montaRegistro0150(COD_PART);
            CHV_CTE := Trim(vNivel3.FieldByName('CHV_CTE').AsString);
            DT_DOC := vNivel3.FieldByName('DT_DOC').AsDateTime;
            if Trim(vNivel3.FieldByName('DT_A_P').AsString) <> '' then
            begin
              DT_A_P := vNivel3.FieldByName('DT_A_P').AsDateTime;
              if DT_A_P < DT_DOC then
                DT_A_P := DT_DOC
              else if DT_A_P > StrToDate(FDataFim) then
                DT_A_P := StrToDate(FDataFim);
            end;
            TP_CT_e := Trim(vNivel3.FieldByName('TP_CT_e').AsString);
            CHV_CTE_REF := Trim(vNivel3.FieldByName('CHV_CTE_REF').AsString);
            VL_DOC := vNivel3.FieldByName('VL_DOC').AsCurrency;
            if FSPED_REGISTROS_LIQ = 'S' then
            begin
              VL_DOC := vNivel3.FieldByName('VL_DOC').AsCurrency - vNivel3.FieldByName('VL_DESC').AsCurrency;
              VL_DESC := 0;
            end
            else
              VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
            IND_FRT := _StrToTipoFretePC(Trim(vNivel3.FieldByName('IND_FRT').AsString));
            VL_SERV := vNivel3.FieldByName('VL_SERV').AsCurrency;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsCurrency;
            VL_ICMS := vNivel3.FieldByName('VL_ICMS').AsCurrency;
            VL_NT := vNivel3.FieldByName('VL_NT').AsCurrency;
            COD_INF := Trim(vNivel3.FieldByName('COD_INF').AsString);
            COD_CTA := '';
          end;
        end;

        with FSpedP.Bloco_D.RegistroD101New do
        begin
          IND_NAT_FRT := _StrToNaturezaFrtContratado(vNivel3.FieldByName('IND_NAT_FRT').AsString);
          VL_ITEM := vNivel3.FieldByName('VL_DOC').AsFloat;
          CST_PIS := _StrToSituacaoTribPIS(vNivel3.FieldByName('CST_PIS').AsString);
          NAT_BC_CRED := _StrToBaseCalculoCredito(vNivel3.FieldByName('NAT_BC_CRED').AsString);
          VL_BC_PIS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_PIS').AsFloat,2);
          ALIQ_PIS := vNivel3.FieldByName('ALIQ_PIS').AsFloat;
          VL_PIS := vNivel3.FieldByName('VL_PIS').AsFloat;
          COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString);

          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel3.FieldByName('CST_PIS').AsString))+
              ' and TIPO = ' + QuotedStr('O') +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;

        end;

        with FSpedP.Bloco_D.RegistroD105New do
        begin
          IND_NAT_FRT := _StrToNaturezaFrtContratado(vNivel3.FieldByName('IND_NAT_FRT').AsString);
          VL_ITEM := vNivel3.FieldByName('VL_DOC').AsFloat;
          CST_COFINS := _StrToSituacaoTribCOFINS(vNivel3.FieldByName('CST_COFINS').AsString);
          NAT_BC_CRED := _StrToBaseCalculoCredito(vNivel3.FieldByName('NAT_BC_CRED').AsString);
          VL_BC_COFINS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_COFINS').AsFloat,2);
          ALIQ_COFINS := vNivel3.FieldByName('ALIQ_COFINS').AsFloat;
          VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsFloat;
          COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString);

          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel3.FieldByName('CST_COFINS').AsString))+
              ' and TIPO = ' + QuotedStr('O') +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;
        end;

      end;

      vNivel3.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;

    vNivel3.Close;
    vNivel3.SQL.Text := 'select nf.cod_nf, nf.natureza_nf,' +
      ' case when nf.natureza_nf = ''E'' then ''0''' +
      '     else ''1'' end IND_OPER,' +
      ' case when nf.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
      ' else nf.serie end SER, nf.subserie SUB, nf.num_nf NUM_DOC, nf.chave_nfe CHV_NFE, nf.data_lanc DT_DOC,' +
      ' nf.data_ent_saida DT_E_S, nf.valor_total VL_DOC, co.desc_cond_pag IND_PGTO,' +
      ' nf.valor_desc VL_DESC, 0 VL_ABAT_NT, (nf.valor_prod + nf.valor_serv) VL_SERV,' +
      ' case when ((nf.valor_frete is null) or (nf.valor_frete = 0) or' +
      '     (nf.frete_f_nfe = ''S'')) then ''9''' +
      '     else nf.freteconta_tr' +
      ' end IND_FRT,' +
      ' case when nf.frete_f_nfe = ''S'' then 0' +
      '     else nf.valor_frete' +
      ' end VL_FRT, nf.valor_seguro VL_SEG, nf.valor_out_desp VL_OUT_DA, nf.base_icm' +
      ' VL_BC_ICMS, nf.valor_icm VL_ICMS, nf.base_icmsub VL_BC_ICMS_ST, nf.valor_icmsub' +
      ' VL_ICMS_ST, nf.valor_ipi VL_IPI, nf.valor_pis VL_PIS, nf.valor_cofins VL_COFINS,' +
      ' nf.valor_pis_st VL_PIS_ST, nf.valor_cofins_st VL_COFINS_ST, nf.status,' +
      ' nf.TIPO_EMISSAO, nf.extemporaneo,  nf.emissao_propria,' +
      ' nf.dados_interesse_fisco TXT_COMPL,' +
      ' nf.valor_serv VL_SERV_NT, nf.base_iss VL_BC_ISSQN, nf.valor_iss VL_ISSQN,' +
      ' nf.base_irrf VL_BC_IRRF, nf.valor_irrf VL_IRRF, 0 VL_BC_PREV, 0 VL_PREV,' +
      ' ''T''||nf.codigo_tr codigo_tr, nf.placa_tr VEIC_ID, nf.qtde_volumes_tr QTD_VOL,' +
      ' nf.peso_b PESO_BRT, nf.peso_l PESO_LIQ, nf.uf_placa_tr UF_ID, nf.cod_cons,' +
      ' nf.vl_forn, nf.vl_terc, nf.valor_out_desp VL_DA, nf.tp_ligacao,' +
      ' nf.cod_grupo_tensao, nf.vl_serv, nf.vl_serv_nt, nf.tp_assinante, '''' COD_CTA' +
      ' from notafiscal nf' +
      ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
      ' nf.modelo_nf in (''21'',''22'')'+
      ' and nf.natureza_nf = ''E'''+
      ' and (nf.da is null or nf.da <> ''S'') and' +
      ' ((coalesce(nf.valor_pis,0) > 0) or (coalesce(nf.valor_cofins,0) > 0))';
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.Open;

    vNivel3.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;
    FProgressBar.Position := 1;

    vNivel3.First;
    while not vNivel3.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro D500';
      Application.ProcessMessages;

      vQrAux.Close;
      vQrAux.SQL.Text := 'select first 1 nfi.cod_nf from notafiscal_item nfi' +
        ' inner join nat_op nt on nt.codigo_nop = nfi.codigo_nop'+ // and ((not nt.nat_bc_cred is null) and (rtrim(nt.nat_bc_cred) <> ''''))' +
        ' where nfi.cod_nf = :cod_nf and' +
        ' nfi.cod_empresa = :cod_empresa';
      if (vNivel3.FieldByName('natureza_nf').AsString = 'E') then
        vQrAux.SQL.Text := vQrAux.SQL.Text + ' and credito_pis_cofins = ''S'''
      else
        vQrAux.SQL.Text := vQrAux.SQL.Text + ' and receita_pis_cofins = ''S''';
      vQrAux.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
      vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrAux.Open;

      vBooleanTemp := not vQrAux.IsEmpty;

      if vBooleanTemp then
      begin

        if FSpedP.Bloco_D.RegistroD001.IND_MOV = imSemDados then
        begin
          montaRegistro0140(FCodEmpresa);
          FSpedP.Bloco_D.RegistroD001.IND_MOV := imComDados;
          FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        end;
        if not vD010 then
        begin
          FSpedP.Bloco_D.RegistroD010New.CNPJ := Trim(FCNPJEmpresa);
          vD010:= True;
        end;
        FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
          'Verificando Empresa', 'Empresa', [rfIgnoreCase]);

        with FSpedP.Bloco_D.RegistroD500New do
        begin
          COD_MOD := StrZero(vNivel3.FieldByName('COD_MOD').AsString, 2);
          if (vNivel3.FieldByName('extemporaneo').AsString = 'S') then
          begin
            if (UpperCase(vNivel3.FieldByName('status').AsString) = 'CANCELADA') then
              COD_SIT := sdfExtCancelado
            else if (vNivel3.FieldByName('TIPO_EMISSAO').AsString = '2') then
              COD_SIT := sdfExtComplementar
            else if (UpperCase(vNivel3.FieldByName('status').AsString) = 'FECHADA') then
              COD_SIT := sdfExtRegular
            else
              COD_SIT := sdfEspecial;
          end
          else if (UpperCase(vNivel3.FieldByName('status').AsString) = 'CANCELADA') then
            COD_SIT := sdfCancelado
          else if (vNivel3.FieldByName('TIPO_EMISSAO').AsString = '2') and
            ((UpperCase(vNivel3.FieldByName('status').AsString) = 'FECHADA')) then
            COD_SIT := sdfComplementar
          else if ((UpperCase(vNivel3.FieldByName('status').AsString) = 'FECHADA')) then
            COD_SIT := sdfRegular;
          if COD_MOD = '55' then
          begin
            if (UpperCase(vNivel3.FieldByName('status').AsString) = 'DENEGADA') then
              COD_SIT := sdfDenegado
            else if (UpperCase(vNivel3.FieldByName('status').AsString) = 'INUTILIZADA') then
              COD_SIT := sdfInutilizado;
          end;

          IND_OPER := _StrToIndicadorTpOperacao(vNivel3.FieldByName('IND_OPER').AsString);
          IND_EMIT := _StrToIndicadorEmitenteDF(vNivel3.FieldByName('IND_EMIT').AsString);
          SER := Trim(vNivel3.FieldByName('SER').AsString);
          if Trim(vNivel3.FieldByName('SUB').AsString) <> '' then
            SUB := StrToInt(Trim(vNivel3.FieldByName('SUB').AsString));
          NUM_DOC := vNivel3.FieldByName('NUM_DOC').AsInteger;
          DT_DOC := vNivel3.FieldByName('DT_DOC').AsDateTime;

          vBooleanTemp := False;
          if not (COD_SIT in [sdfCancelado, sdfExtCancelado, sdfDenegado, sdfInutilizado])
            then
          begin
            vBooleanTemp := True;
            montaRegistro0150(vNivel3.FieldByName('COD_PART').AsString);
            if Trim(vNivel3.FieldByName('codigo_tr').AsString) <> '' then
              if (vNivel3.FieldByName('natureza_nf').AsString = 'S') and
                (vNivel3.FieldByName('COD_MOD').AsString <> '55') then
                montaRegistro0150(vNivel3.FieldByName('codigo_tr').AsString);
            COD_PART := vNivel3.FieldByName('COD_PART').AsString;
            DT_A_P := vNivel3.FieldByName('DT_E_S').AsDateTime;
            if DT_A_P < DT_DOC then
              DT_A_P := DT_DOC
            else if DT_A_P > StrToDate(FDataFim) then
              DT_A_P := StrToDate(FDataFim);
            VL_DOC := vNivel3.FieldByName('VL_DOC').AsCurrency;
            if FSPED_REGISTROS_LIQ = 'S' then
            begin
              VL_DOC := vNivel3.FieldByName('VL_DOC').AsCurrency - vNivel3.FieldByName('VL_DESC').AsCurrency;
              VL_DESC := 0;
            end
            else
              VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
            VL_SERV := vNivel3.FieldByName('VL_SERV').AsCurrency;
            VL_SERV_NT := vNivel3.FieldByName('VL_SERV_NT').AsCurrency;
            VL_TERC := vNivel3.FieldByName('VL_TERC').AsCurrency;
            VL_DA := vNivel3.FieldByName('VL_DA').AsCurrency;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsCurrency;
            VL_ICMS := vNivel3.FieldByName('VL_ICMS').AsCurrency;
            VL_PIS := vNivel3.FieldByName('VL_PIS').AsCurrency;
            VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsCurrency;
          end;
        end;
      end;

      if vBooleanTemp then
      begin

        vNivel4.Close;
        vNivel4.SQL.Text :=
          'select nfi.cst_pis, nfi.cst_cofins, nfi.aliq_pis, nfi.aliq_cofins, '''' NAT_BC_CRED, '''' COD_CTA,' +
          ' sum (nfi.valor_total - nfi.rateio_desconto + nfi.valor_ipi +' +
          ' nfi.rateio_seguro + nfi.rateio_outdesp + nfi.rateio_acres_fin ) VL_ITEM,' +
          ' sum(nfi.base_pis) vl_bc_pis, sum(nfi.valor_pis) VL_PIS,' +
          ' sum(nfi.base_cofins) vl_bc_cofins, sum(nfi.valor_cofins) vl_cofins' +
          ' from notafiscal_item nfi' +
          ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa group by 1,2,3,4,5,6';
        vNivel4.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
        vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel4.Open;

        vNivel4.first;
        while not vNivel4.Eof do
        begin
          with FSpedP.Bloco_D.RegistroD501New do
          begin
            CST_PIS := _StrToSituacaoTribPIS(Trim(vNivel4.FieldByName('CST_PIS').AsString));
            VL_ITEM := vNivel4.FieldByName('vl_item').AsFloat;
            if Trim(vNivel4.FieldByName('NAT_BC_CRED').AsString) <> '' then
              NAT_BC_CRED := _StrToBaseCalculoCredito(Trim(vNivel4.FieldByName('NAT_BC_CRED').AsString))
            else 
              NAT_BC_CRED := bccAqServUtiComoInsumo;

            VL_BC_PIS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_PIS').AsFloat,2);
            ALIQ_PIS := vNivel4.FieldByName('ALIQ_PIS').AsFloat;
            VL_PIS := vNivel4.FieldByName('VL_PIS').AsFloat;
            COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);

            if Trim(COD_CTA) = '' then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_PIS').AsString))+
                ' and TIPO = ' + QuotedStr('O') +
                ' and SUBTIPO = ''N''';
              vQrAux.Open;
              if not vQrAux.IsEmpty then
                COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
            end;

          end;
          vNivel4.Next;
        end;

        vNivel4.first;
        while not vNivel4.Eof do
        begin
          with FSpedP.Bloco_D.RegistroD505New do
          begin
            CST_COFINS := _StrToSituacaoTribCOFINS(Trim(vNivel4.FieldByName('CST_COFINS').AsString));
            VL_ITEM := vNivel4.FieldByName('vl_item').AsFloat;
            if Trim(vNivel4.FieldByName('NAT_BC_CRED').AsString) <> '' then
              NAT_BC_CRED := _StrToBaseCalculoCredito(Trim(vNivel4.FieldByName('NAT_BC_CRED').AsString))
            else
              NAT_BC_CRED := bccAqServUtiComoInsumo;

            VL_BC_COFINS := StrToFloatFormat(vNivel4.FieldByName('VL_BC_COFINS').AsFloat,2);
            ALIQ_COFINS := vNivel4.FieldByName('ALIQ_COFINS').AsFloat;
            VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsFloat;
            COD_CTA := Trim(vNivel4.FieldByName('COD_CTA').AsString);

            if Trim(COD_CTA) = '' then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
                ' where CST = '+ QuotedStr(Trim(vNivel4.FieldByName('CST_COFINS').AsString))+
                ' and TIPO = ' + QuotedStr('O') +
                ' and SUBTIPO = ''N''';
              vQrAux.Open;
              if not vQrAux.IsEmpty then
                COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
            end;

          end;
          vNivel4.Next;
        end;

        vNivel4.Close;
        vNivel4.SQL.Text := 'select c111.cod_inf, c111.num_proc, c111.ind_proc,' +
          ' c111.cod_acao_judicial, c111.cod_adm'+
          ' from notafiscal_sped_c111 c111 where c111.cod_nf = :cod_nf and' +
          ' c111.cod_empresa = :cod_empresa';
        vNivel4.ParamByName('cod_nf').AsInteger := vNivel3.FieldByName('cod_nf').AsInteger;
        vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel4.Open;

        vNivel4.first;
        while not vNivel4.Eof do
        begin
          montaRegistro1010(vNivel4.FieldByName('COD_ACAO_JUDICIAL').AsInteger);
          montaRegistro1020(vNivel4.FieldByName('COD_ADM').AsInteger);
          with FSpedP.Bloco_D.RegistroD509New do
          begin
            NUM_PROC := vNivel5.FieldByName('NUM_PROC').AsString;
            IND_PROC := _StrToOrigemProcessoPC(vNivel5.FieldByName('IND_PROC').AsString);
          end;
          vNivel4.Next;
        end;

      end;
      vNivel3.Next;
    end;

  finally
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
    vNivel6.Close;
  end;
end;

procedure TSpedPISCOFINS.__montarBlocoF;
var
  vD010: Boolean;
  vProcRef: TStringList;
  I: Smallint;
  vGr, vCod, vUnd, vCNF, vNIt, vTipoTemp: string;
  vCST_PIS: TACBrSituacaoTribPIS;
begin
//  FSpedP.Bloco_F.RegistroF001New.IND_MOV := imSemDados;

  try
    vD010 := False;
    for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
      if Trim(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[I].CNPJ) = Trim(FCNPJEmpresa) then
      begin
        vD010 := True;
        Break;
      end;

    vProcRef := TStringList.Create;
    if (FRegime = 'LUCRO REAL') then
    begin
      vNivel3.Close;
      vNivel3.SQL.Text :=
        'select * from SPED_OUTRAS_RECEITAS_CREDITOS' +
        ' where dt_oper >= :dataIni and dt_oper <= :dataFim and' +
        ' cod_empresa = :cod_empresa and ativo = 1';
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel3.Open;

      vNivel3.FetchAll;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;
      FProgressBar.Position := 1;
      if not vNivel3.IsEmpty then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_F.RegistroF001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        if not vD010 then
        begin
          FSpedP.Bloco_F.RegistroF010New.CNPJ := Trim(FCNPJEmpresa);
          vD010:= True;
        end;
        FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
          'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
      end;

      vNivel3.First;
      while not vNivel3.Eof do
      begin
        FLabelStatus.Caption := 'Montando registro F100';
        Application.ProcessMessages;
        with FSpedP.Bloco_F.RegistroF100New do
        begin
          IND_OPER := _StrToIndTpOperacaoReceita(vNivel3.FieldByName('IND_OPER').AsString);
          COD_PART := Trim(vNivel3.FieldByName('COD_CLIENTE').AsString);
          montaRegistro0150(COD_PART);
          if getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString,1) = 'P' then
          begin
            COD_ITEM := 'P' + StrZero(getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString, 2) +
              Trim(getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString,3)), 16);

            gravaSpedItem('P', StrToInt(getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString, 2)),
              getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString, 3), '', 0, '', 'UN');
          end
          else if getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString, 1) = 'S' then
          begin
            COD_ITEM := 'S' + StrZero(getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString, 2), 16);

            gravaSpedItem('S',
              0, '', '', StrToInt(getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString, 2)), '', 'UN');
          end
          else if getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString,1) = 'A' then
          begin
            COD_ITEM := 'A' + StrZero(vNivel3.FieldByName('cod_rec_cred').AsString, 6) +
              getCampoPipe(vNivel3.FieldByName('COD_ITEM').AsString,1);

            F0200.Add( COD_ITEM +'|'+
              Trim(vNivel3.FieldByName('descr_item').AsString) +'|'+
              COD_ITEM +'|' +
              '' + '|'+
              'UN' +'|'+
              '99' +'|'+
              '' +'|'+
              '' +'|'+
              '' +'|'+
              '' +'|'+
              '0,00' +'||');
          end;

          DT_OPER := vNivel3.FieldByName('DT_OPER').AsDateTime;
          VL_OPER := vNivel3.FieldByName('VL_OPER').AsFloat;
          CST_PIS := _StrToSituacaoTribPIS(vNivel3.FieldByName('CST_PIS').AsString);
          VL_BC_PIS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_PIS').AsFloat,2);
          ALIQ_PIS := vNivel3.FieldByName('ALIQ_PIS').AsFloat;
          VL_PIS := vNivel3.FieldByName('VL_PIS').AsFloat;
          CST_COFINS := _StrToSituacaoTribCOFINS(vNivel3.FieldByName('CST_COFINS').AsString);
          VL_BC_COFINS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_COFINS').AsFloat,2);
          ALIQ_COFINS := vNivel3.FieldByName('ALIQ_COFINS').AsFloat;
          VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsFloat;
          if IND_OPER = indRepCustosDespesasEncargos then
            NAT_BC_CRED := _StrToBaseCalculoCredito(vNivel3.FieldByName('NAT_BC_CRED').AsString);
          IND_ORIG_CRED := _StrToOrigemCredito(vNivel3.FieldByName('IND_ORIG_CRED').AsString);
          COD_CTA := vNivel3.FieldByName('COD_CTA').AsString;

          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel3.FieldByName('CST_PIS').AsString))+
              ' and TIPO = ' + QuotedStr('O') +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;

          COD_CCUS := vNivel3.FieldByName('COD_CCUS').AsString;
          DESC_DOC_OPER := getCampoBlobString(vNivel3.FieldByName('DESC_DOC_OPER').AsString);

          vProcRef.Clear;

          vProcRef.Text := vNivel3.FieldByName('PROCESSOS_REF').AsString;

          for I := 0 to vProcRef.Count - 1 do
          begin
            if getCampoPipe(vProcRef[I], 4) = 'SPED_PROC_REF_ACAO_JUDICIAL' then
              montaRegistro1010(StrToInt(getCampoPipe(vProcRef[I], 3)))
            else
              montaRegistro1020(StrToInt(getCampoPipe(vProcRef[I], 3)));

            with FSpedP.Bloco_F.RegistroF111New do
            begin
              NUM_PROC := getCampoPipe(vProcRef[I], 1);
              IND_PROC := _StrToOrigemProcessoPC(Trim(getCampoPipe(vProcRef[I], 2)));
            end;

          end;
        end;
        vNivel3.Next;
      end;

      // Registro F120
    
      vNivel3.Close;
      vNivel3.SQL.Text :=
        'select * from SPED_DEPREC_AMORT_BENS' +
        ' where DATA_OPERACAO >= :dataIni and DATA_OPERACAO <= :dataFim and' +
        ' cod_empresa = :cod_empresa and ativo = 1';
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel3.Open;

      vNivel3.FetchAll;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;
      FProgressBar.Position := 1;
      if not vNivel3.IsEmpty then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_F.RegistroF001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        if not vD010 then
        begin
          FSpedP.Bloco_F.RegistroF010New.CNPJ := Trim(FCNPJEmpresa);
          vD010:= True;
        end;
        FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
          'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
      end;

      vNivel3.First;
      while not vNivel3.Eof do
      begin
        FLabelStatus.Caption := 'Montando registro F120';
        Application.ProcessMessages;
        with FSpedP.Bloco_F.RegistroF120New do
        begin
          NAT_BC_CRED := _StrToBaseCalculoCredito(vNivel3.FieldByName('NAT_BC_CRED').AsString);
          IDENT_BEM_IMOB := Trim(vNivel3.FieldByName('IDENT_BEM_IMOB').AsString);
          IND_ORIG_CRED := vNivel3.FieldByName('IND_ORIG_CRED').AsString;
          IND_UTIL_BEM_IMOB := Trim(vNivel3.FieldByName('IND_UTIL_BEM_IMOB').AsString);
          VL_OPER_DEP := vNivel3.FieldByName('VL_OPER_DEP').AsFloat;
          PARC_OPER_NAO_BC_CRED := vNivel3.FieldByName('PARC_OPER_NAO_BC_CRED').AsFloat;
          CST_PIS := _StrToSituacaoTribPIS(vNivel3.FieldByName('CST_PIS').AsString);
          VL_BC_PIS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_PIS').AsFloat,2);
          ALIQ_PIS := vNivel3.FieldByName('ALIQ_PIS').AsFloat;
          VL_PIS := vNivel3.FieldByName('VL_PIS').AsFloat;
          CST_COFINS := _StrToSituacaoTribCOFINS(vNivel3.FieldByName('CST_COFINS').AsString);
          VL_BC_COFINS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_COFINS').AsFloat,2);
          ALIQ_COFINS := vNivel3.FieldByName('ALIQ_COFINS').AsFloat;
          VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsFloat;
          COD_CTA := vNivel3.FieldByName('COD_CTA').AsString;

          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel3.FieldByName('CST_COFINS').AsString))+
              ' and TIPO = ' + QuotedStr('O') +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;

          COD_CCUS := vNivel3.FieldByName('COD_CCUS').AsString;
          DESC_BEM_IMOB := getCampoBlobString(vNivel3.FieldByName('DESC_BEM_IMOB').AsString);

          vProcRef.Clear;

          vProcRef.Text := vNivel3.FieldByName('PROCESSOS_REF').AsString;

          for I := 0 to vProcRef.Count - 1 do
          begin
            if getCampoPipe(vProcRef[I], 4) = 'SPED_PROC_REF_ACAO_JUDICIAL' then
              montaRegistro1010(StrToInt(getCampoPipe(vProcRef[I], 3)))
            else
              montaRegistro1020(StrToInt(getCampoPipe(vProcRef[I], 3)));

            with FSpedP.Bloco_F.RegistroF129New do
            begin
              NUM_PROC := getCampoPipe(vProcRef[I], 1);
              IND_PROC := _StrToOrigemProcessoPC(getCampoPipe(vProcRef[I], 2));
            end;

          end;
        end;
        vNivel3.Next;
      end;

      // Registro F130
    
      vNivel3.Close;
      vNivel3.SQL.Text :=
        'select * from SPED_AQUISICAO_BENS' +
        ' where :dataIni >= data_inicial and :dataFim <= data_final and' +
        ' cod_empresa = :cod_empresa and ativo = 1';
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel3.Open;

      vNivel3.FetchAll;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;
      FProgressBar.Position := 1;
      if not vNivel3.IsEmpty then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_F.RegistroF001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        if not vD010 then
        begin
          FSpedP.Bloco_F.RegistroF010New.CNPJ := Trim(FCNPJEmpresa);
          vD010:= True;
        end;
        FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
          'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
      end;

      vNivel3.First;
      while not vNivel3.Eof do
      begin
        FLabelStatus.Caption := 'Montando registro F130';
        Application.ProcessMessages;
        with FSpedP.Bloco_F.RegistroF130New do
        begin
          NAT_BC_CRED := _StrToBaseCalculoCredito(vNivel3.FieldByName('NAT_BC_CRED').AsString);
          IDENT_BEM_IMOB := Trim(vNivel3.FieldByName('IDENT_BEM_IMOB').AsString);
          IND_ORIG_CRED := vNivel3.FieldByName('IND_ORIG_CRED').AsString;
          IND_UTIL_BEM_IMOB := Trim(vNivel3.FieldByName('IND_UTIL_BEM_IMOB').AsString);
          // No PVA a situação gerada por este comentário estava com erro
          //if vNivel3.FieldByName('IND_NR_PARC').AsInteger = 9 then
            //MES_OPER_AQUIS := StrZero(vNivel3.FieldByName('QTDE_PARCELAS').AsString, 2)
          //else
          if Trim(vNivel3.FieldByName('MES_OPER_AQUIS').AsString) <> '' then
            MES_OPER_AQUIS := StringReplace( copy(FormatDateTime('dd/mm/yyyy',
              vNivel3.FieldByName('MES_OPER_AQUIS').AsDateTime), 4, 7), '/', '', [rfReplaceAll]);
          VL_OPER_AQUIS := vNivel3.FieldByName('VL_OPER_AQUIS').AsFloat;
          PARC_OPER_NAO_BC_CRED := vNivel3.FieldByName('PARC_OPER_NAO_BC_CRED').AsFloat;
          VL_BC_CRED := vNivel3.FieldByName('VL_BC_CRED').AsFloat;
          IND_NR_PARC := vNivel3.FieldByName('IND_NR_PARC').AsInteger;
          CST_PIS := _StrToSituacaoTribPIS(vNivel3.FieldByName('CST_PIS').AsString);
          VL_BC_PIS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_PIS').AsFloat,2);
          ALIQ_PIS := vNivel3.FieldByName('ALIQ_PIS').AsFloat;
          VL_PIS := vNivel3.FieldByName('VL_PIS').AsFloat;
          CST_COFINS := _StrToSituacaoTribCOFINS(vNivel3.FieldByName('CST_COFINS').AsString);
          VL_BC_COFINS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_COFINS').AsFloat,2);
          ALIQ_COFINS := vNivel3.FieldByName('ALIQ_COFINS').AsFloat;
          VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsFloat;
          COD_CTA := vNivel3.FieldByName('COD_CTA').AsString;

          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel3.FieldByName('CST_PIS').AsString))+
              ' and TIPO = ' + QuotedStr('O') +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;

          COD_CCUS := vNivel3.FieldByName('COD_CCUS').AsString;
          DESC_BEM_IMOB := getCampoBlobString(vNivel3.FieldByName('DESC_BEM_IMOB').AsString);

          vProcRef.Clear;

          vProcRef.Text := vNivel3.FieldByName('PROCESSOS_REF').AsString;

          for I := 0 to vProcRef.Count - 1 do
          begin
            if getCampoPipe(vProcRef[I], 4) = 'SPED_PROC_REF_ACAO_JUDICIAL' then
              montaRegistro1010(StrToInt(getCampoPipe(vProcRef[I], 3)))
            else
              montaRegistro1020(StrToInt(getCampoPipe(vProcRef[I], 3)));

            with FSpedP.Bloco_F.RegistroF139New do
            begin
              NUM_PROC := getCampoPipe(vProcRef[I], 1);
              IND_PROC := _StrToOrigemProcessoPC(getCampoPipe(vProcRef[I], 2));
            end;

          end;
        end;
        vNivel3.Next;
      end;

      // Registro F150
    
      vNivel3.Close;
      vNivel3.SQL.Text :=
        'select * from SPED_ESTOQUE_ABERTURA' +
        ' where :dataIni >= data_inicial and :dataFim <= data_final and' +
        ' cod_empresa = :cod_empresa and ativo = 1';
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel3.Open;

      vNivel3.FetchAll;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;
      FProgressBar.Position := 1;
      if not vNivel3.IsEmpty then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_F.RegistroF001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        if not vD010 then
        begin
          FSpedP.Bloco_F.RegistroF010New.CNPJ := Trim(FCNPJEmpresa);
          vD010:= True;
        end;
        FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
          'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
      end;

      vNivel3.First;
      while not vNivel3.Eof do
      begin
        FLabelStatus.Caption := 'Montando registro F150';
        Application.ProcessMessages;
        with FSpedP.Bloco_F.RegistroF150New do
        begin
          NAT_BC_CRED := _StrToBaseCalculoCredito(vNivel3.FieldByName('NAT_BC_CRED').AsString);
          VL_TOT_EST := vNivel3.FieldByName('VL_TOT_EST').AsFloat;
          EST_IMP := Trunc(vNivel3.FieldByName('EST_IMP').AsFloat);
          VL_BC_EST := vNivel3.FieldByName('VL_BC_EST').AsFloat;
          VL_BC_MEN_EST := vNivel3.FieldByName('VL_BC_MEN_EST').AsFloat;
          CST_PIS := _StrToSituacaoTribPIS(vNivel3.FieldByName('CST_PIS').AsString);
          ALIQ_PIS := vNivel3.FieldByName('ALIQ_PIS').AsFloat;
          VL_CRED_PIS := vNivel3.FieldByName('VL_PIS').AsFloat;
          CST_COFINS := _StrToSituacaoTribCOFINS(vNivel3.FieldByName('CST_COFINS').AsString);
          ALIQ_COFINS := vNivel3.FieldByName('ALIQ_COFINS').AsFloat;
          VL_CRED_COFINS := vNivel3.FieldByName('VL_COFINS').AsFloat;
          DESC_EST := getCampoBlobString(vNivel3.FieldByName('DESC_EST').AsString);
          COD_CTA := vNivel3.FieldByName('COD_CTA').AsString;

          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel3.FieldByName('CST_PIS').AsString))+
              ' and TIPO = ' + QuotedStr('O') +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;
        
        end;
        vNivel3.Next;
      end;
    end;

    if (FRegime <> 'LUCRO PRESUMIDO') then
      Exit;

    if (FIndicadorRegimeCumulativo = 1) or (FIndicadorRegimeCumulativo = 2) then
    begin
      _verificaPISCOFINS_Servicos;
      verificaCamposNuloNF;
      verificaPISCOFINSNotaFiscal;
      verificaPISCOFINSNFSerieD;

      vQrAux.Close;
      vQrAux.SQL.Text :=
        'select ''2D'' COD_MOD, cniee.modelo_ecf ECF_MOD, ti.num_serie_ecf ECF_FAB,' +
        ' ti.cod_terminal ECF_CX from terminal_impressoras ti' +
        ' inner join impressoras_cniee cniee on cniee.identificacao = ti.ident_cniee' +
        ' where cod_empresa = :cod_empresa order by 4';
      vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrAux.Open;
      vQrAux.FetchAll;

      vQrAux.First;
      while not vQrAux.Eof do
      begin
        verificaCamposNullCupom(Trim(vQrAux.FieldByName('ECF_FAB').AsString), vQrAux.FieldByName('ECF_CX').AsInteger);
        _verificaPISCOFINSCupomFiscal(Trim(vQrAux.FieldByName('ECF_FAB').AsString), vQrAux.FieldByName('ECF_CX').AsInteger);
        verificaCupomSemZ(Trim(vQrAux.FieldByName('ECF_FAB').AsString), vQrAux.FieldByName('ECF_CX').AsInteger);
        
        vQrAux.Next;
      end;
    end;

    //Registro F500 - LUCRO PRESUMIDO - REGIME DE CAIXA
    if FIndicadorRegimeCumulativo = 1 then
    begin
      vNivel3.Close;
      vNivel3.SQL.Text := 'SELECT' +
        ' sp.cst_pis CST_PIS,' +
        ' sp.aliq_pis ALIQ_PIS,' +
        ' sp.cst_pis CST_COFINS,' +
        ' sp.aliq_cofins ALIQ_COFINS,' +
        ' sp.modelo COD_MOD,' +
        ' sp.cfop CFOP,' +
        ' '''' COD_CTA,' +
        ' '''' INFO_COMPL,' +
        ' sum(sp.valor_liquido) VL_REC_CAIXA,' +
        ' sum(sp.desconto) VL_DESC_PIS,' +
        ' sum(sp.base_pis) VL_BC_PIS,' +
        ' sum(sp.valor_pis) VL_PIS,' +
        ' sum(sp.desconto) VL_DESC_COFINS,' +
        ' sum(sp.base_pis) VL_BC_COFINS,' +
        ' sum(sp.valor_cofins) VL_COFINS' +
        ' from sped_presumido sp' +
        ' where sp.data_lancamento >= :dataIni and sp.data_lancamento <= :dataFim and sp.e_s = ''S''' +
        ' and sp.receita_pis_cofins = ''S'' and sp.cod_empresa = :cod_empresa and sp.situacao = ''REGULAR''' +
        ' group by 1,2,3,4,5,6,7,8';
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel3.Open;

      vNivel3.FetchAll;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;
      FProgressBar.Position := 1;
      if not vNivel3.IsEmpty then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_F.RegistroF001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        if not vD010 then
        begin
          FSpedP.Bloco_F.RegistroF010New.CNPJ := Trim(FCNPJEmpresa);
          vD010:= True;
        end;
        FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
          'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
      end;

      vNivel3.First;
      while not vNivel3.Eof do
      begin
        FLabelStatus.Caption := 'Montando registro F500';
        Application.ProcessMessages;
        with FSpedP.Bloco_F.RegistroF500New do
        begin
          VL_REC_CAIXA := vNivel3.FieldByName('VL_REC_CAIXA').AsFloat;
          CST_PIS := _StrToSituacaoTribPIS(vNivel3.FieldByName('CST_PIS').AsString);
          VL_DESC_PIS := vNivel3.FieldByName('VL_DESC_PIS').AsFloat;
          VL_BC_PIS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_PIS').AsFloat,2);
          ALIQ_PIS := vNivel3.FieldByName('ALIQ_PIS').AsFloat;
          VL_PIS := vNivel3.FieldByName('VL_PIS').AsFloat;
          CST_COFINS :=  _StrToSituacaoTribCOFINS(vNivel3.FieldByName('CST_COFINS').AsString);
          VL_DESC_COFINS := vNivel3.FieldByName('VL_DESC_COFINS').AsFloat;
          VL_BC_COFINS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_COFINS').AsFloat,2);
          ALIQ_COFINS := vNivel3.FieldByName('ALIQ_COFINS').AsFloat;
          VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsFloat;
          COD_MOD  := vNivel3.FieldByName('COD_MOD').AsString;
          CFOP := vNivel3.FieldByName('CFOP').AsInteger;
          COD_CTA  := vNivel3.FieldByName('COD_CTA').AsString;
          INFO_COMPL := vNivel3.FieldByName('INFO_COMPL').AsString;

          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel3.FieldByName('CST_PIS').AsString))+
              ' and TIPO = ' + QuotedStr('O') +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;
        end;
        vNivel3.Next;
        FProgressBar.Position := FProgressBar.Position + 1;
      end;

      vNivel3.Close;
      vNivel3.SQL.Text := 'SELECT' +
        ' ''05'' IND_REC,' +
        ' '''' CNPJ_CPF,' +
        ' 0 NUM_DOC,' +
        ' sp.cod_item COD_ITEM,' +
        ' rtrim(sp.tipo_item) TIPO_ITEM,' +
        ' sp.cst_pis CST_PIS,' +
        ' sp.cst_pis CST_COFINS,' +
        ' sp.NAT_REC,' +
        ' '''' COD_CTA,' +
        ' '''' INFO_COMPL,' +
        ' sum(sp.valor_liquido) VL_REC_DET,' +
        ' sum(sp.valor_liquido) VL_REC' +
        ' from sped_presumido sp' +
        ' where sp.data_lancamento >= :dataIni and sp.data_lancamento <= :dataFim and sp.e_s = ''S''' +
        ' and sp.receita_pis_cofins = ''S''  and sp.cod_empresa = :cod_empresa and sp.situacao = ''REGULAR''' +
        ' group by 1,2,3,4,5,6,7,8,9,10';
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel3.Open;

      vNivel3.FetchAll;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;
      FProgressBar.Position := 1;
      if not vNivel3.IsEmpty then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_F.RegistroF001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        if not vD010 then
        begin
          FSpedP.Bloco_F.RegistroF010New.CNPJ := Trim(FCNPJEmpresa);
          vD010:= True;
        end;
        FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
          'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
      end;

      vNivel3.First;
      while not vNivel3.Eof do
      begin
        FLabelStatus.Caption := 'Montando registro F525';
        Application.ProcessMessages;
        with FSpedP.Bloco_F.RegistroF525New do
        begin
          VL_REC := vNivel3.FieldByName('VL_REC').AsFloat;
          IND_REC := _StrToIndicadorDaComposicaoDaReceitaRecebida(vNivel3.FieldByName('IND_REC').AsString);
          CNPJ_CPF := Trim(vNivel3.FieldByName('CNPJ_CPF').AsString);
          if vNivel3.FieldByName('NUM_DOC').AsInteger > 0 then
            NUM_DOC := IntToStr(vNivel3.FieldByName('NUM_DOC').AsInteger);

          vUnd := 'UN';
          if vNivel3.FieldByName('tipo_item').AsString = 'P' then
          begin
            vGr := Trim(vNivel3.FieldByName('COD_ITEM').AsString);
            vGr := Trim(Copy(vGr, 1, pos('-',vGr)-1));
            vCod := Trim(vNivel3.FieldByName('COD_ITEM').AsString);
            vCod := Trim(Copy(vCod, pos('-',vCod)+1, Length(vCod)));
            vTipoTemp := 'P';

            vQrAux.Close;
            vQrAux.SQL.Text := 'select unidade from produtos' +
              ' where grupo_prod = '+ Trim(vGr) +
              ' and cod_prod = '+ QuotedStr(vCod)+
              ' and cod_empresa = ' + FCodEmpresa;
            vQrAux.Open;

            if Trim(vQrAux.FieldByName('unidade').AsString) <> '' then
              vUnd := Trim(vQrAux.FieldByName('unidade').AsString);

            COD_ITEM := 'P' + StrZero(Trim(vGr) + Trim(vCod), 16);
            gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
              StrToInt(vGr), vCod, '', 0, '', vUnd);
          end
          else if vNivel3.FieldByName('tipo_item').AsString = 'S' then
          begin
            vTipoTemp := 'S';
            COD_ITEM := 'S' + StrZero(vNivel3.FieldByName('COD_ITEM').AsString, 16);

            gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
              0, '', '', vNivel3.FieldByName('COD_ITEM').AsInteger, '', vUnd);
          end
          else if vNivel3.FieldByName('tipo_item').AsString = 'V' then
          begin
            vTipoTemp := 'V';
            COD_ITEM := StrZero(vNivel3.FieldByName('COD_ITEM').AsString, 17);

            gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
              0, '', vNivel3.FieldByName('COD_ITEM').AsString,
              0, '', vUnd);
          end
          else if vNivel3.FieldByName('tipo_item').AsString = 'O' then
          begin
            vCNF := Trim(vNivel3.FieldByName('COD_ITEM').AsString);
            vCNF := Trim(Copy(vCNF, 1, pos('-',vCNF)-1));
            vNIt := Trim(vNivel3.FieldByName('COD_ITEM').AsString);
            vNIt := Trim(Copy(vNIt, pos('-',vNIt)+1, Length(vNIt)));

            COD_ITEM := 'O' + StrZero(vCNF, 7) + StrZero(vNIt, 3);

            gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
              0, '', '', 0, ('O' + StrZero(vCNF, 7) + StrZero(vNIt, 3)), vUnd);
          end
          else if vNivel3.FieldByName('tipo_item').AsString = 'D' then
          begin
            vCNF := Trim(vNivel3.FieldByName('COD_ITEM').AsString);
            vCNF := Trim(Copy(vCNF, 1, pos('-',vCNF)-1));
            vNIt := Trim(vNivel3.FieldByName('COD_ITEM').AsString);
            vNIt := Trim(Copy(vNIt, pos('-',vNIt)+1, Length(vNIt)));

            COD_ITEM := 'D' + StrZero(vCNF, 7) + StrZero(vNIt, 3);

            gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
              0, '', '', 0, ('D' + StrZero(vCNF, 7) + StrZero(vNIt, 3)), vUnd);
          end;
          VL_REC_DET := vNivel3.FieldByName('VL_REC_DET').AsFloat;
          CST_PIS := _StrToSituacaoTribPIS(vNivel3.FieldByName('CST_PIS').AsString);
          CST_COFINS :=  _StrToSituacaoTribCOFINS(vNivel3.FieldByName('CST_COFINS').AsString);
          COD_CTA  := vNivel3.FieldByName('COD_CTA').AsString;
          INFO_COMPL := vNivel3.FieldByName('INFO_COMPL').AsString;

          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel3.FieldByName('CST_PIS').AsString))+
              ' and TIPO = ' + QuotedStr('O') +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;

          if CST_PIS in [{stpisValorAliquotaPorST, }stpisAliquotaZero, stpisIsentaContribuicao,
            stpisSemIncidenciaContribuicao, stpisSuspensaoContribuicao, stpisMonofaticaAliquotaZero] then
            acumulaRegistroM410(
              vNivel3.FieldByName('CST_PIS').AsString,
              COD_CTA, '',
              vNivel3.FieldByName('NAT_REC').AsString, VL_REC_DET);
        end;
        vNivel3.Next;
        FProgressBar.Position := FProgressBar.Position + 1;
      end;

    end
    //Registro F550 - LUCRO PRESUMIDO - REGIME DE COMPETENCIA
    else if FIndicadorRegimeCumulativo = 2 then
    begin
      vNivel3.Close;
      vNivel3.SQL.Text := 'SELECT' +
        ' sp.cst_pis CST_PIS,' +
        ' sp.aliq_pis ALIQ_PIS,' +
        ' sp.cst_pis CST_COFINS,' +
        ' sp.aliq_cofins ALIQ_COFINS,' +
        ' sp.modelo COD_MOD,' +
        ' sp.cfop CFOP,' +
        ' '''' COD_CTA,' +
        ' '''' INFO_COMPL,' +
        ' sum(sp.valor_liquido) VL_REC_COMP,' +
        ' sum(sp.desconto) VL_DESC_PIS,' +
        ' sum(sp.base_pis) VL_BC_PIS,' +
        ' sum(sp.valor_pis) VL_PIS,' +
        ' sum(sp.desconto) VL_DESC_COFINS,' +
        ' sum(sp.base_pis) VL_BC_COFINS,' +
        ' sum(sp.valor_cofins) VL_COFINS' +
        ' from sped_presumido sp' +
        ' where sp.data_lancamento >= :dataIni and sp.data_lancamento <= :dataFim and sp.e_s = ''S''' +
        ' and sp.receita_pis_cofins = ''S'' and sp.cod_empresa = :cod_empresa and sp.situacao = ''REGULAR''' +
        ' group by 1,2,3,4,5,6,7,8';
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel3.Open;

      vNivel3.FetchAll;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;
      FProgressBar.Position := 1;
      if not vNivel3.IsEmpty then
      begin
        montaRegistro0140(FCodEmpresa);
        FSpedP.Bloco_F.RegistroF001.IND_MOV := imComDados;
        FSpedP.Bloco_0.Registro0001.IND_MOV := imComDados;
        if not vD010 then
        begin
          FSpedP.Bloco_F.RegistroF010New.CNPJ := Trim(FCNPJEmpresa);
          vD010:= True;
        end;
        FLabelEmpresas.Caption := StringReplace(FLabelEmpresas.Caption,
          'Verificando Empresa', 'Empresa', [rfIgnoreCase]);
      end;

      vNivel3.First;
      while not vNivel3.Eof do
      begin
        FLabelStatus.Caption := 'Montando registro F500';
        Application.ProcessMessages;
        with FSpedP.Bloco_F.RegistroF550New do
        begin
          VL_REC_COMP := vNivel3.FieldByName('VL_REC_COMP').AsFloat;
          CST_PIS := _StrToSituacaoTribPIS(vNivel3.FieldByName('CST_PIS').AsString);
          VL_DESC_PIS := vNivel3.FieldByName('VL_DESC_PIS').AsFloat;
          VL_BC_PIS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_PIS').AsFloat,2);
          ALIQ_PIS := vNivel3.FieldByName('ALIQ_PIS').AsFloat;
          VL_PIS := vNivel3.FieldByName('VL_PIS').AsFloat;
          CST_COFINS :=  _StrToSituacaoTribCOFINS(vNivel3.FieldByName('CST_COFINS').AsString);
          VL_DESC_COFINS := vNivel3.FieldByName('VL_DESC_COFINS').AsFloat;
          VL_BC_COFINS := StrToFloatFormat(vNivel3.FieldByName('VL_BC_COFINS').AsFloat,2);
          ALIQ_COFINS := vNivel3.FieldByName('ALIQ_COFINS').AsFloat;
          VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsFloat;
          COD_MOD  := vNivel3.FieldByName('COD_MOD').AsString;
          CFOP := vNivel3.FieldByName('CFOP').AsInteger;
          COD_CTA  := vNivel3.FieldByName('COD_CTA').AsString;
          INFO_COMPL := vNivel3.FieldByName('INFO_COMPL').AsString;

          if Trim(COD_CTA) = '' then
          begin
            vQrAux.Close;
            vQrAux.SQL.Text := 'select COD_CTA from RELACAO_CST_PIS_PCONTAS' +
              ' where CST = '+ QuotedStr(Trim(vNivel3.FieldByName('CST_PIS').AsString))+
              ' and TIPO = ' + QuotedStr('O') +
              ' and SUBTIPO = ''N''';
            vQrAux.Open;
            if not vQrAux.IsEmpty then
              COD_CTA :=  Trim(vQrAux.FieldByName('COD_CTA').AsString);
          end;

        end;
        vNivel3.Next;
        FProgressBar.Position := FProgressBar.Position + 1;
      end;

      vNivel3.Close;
      vNivel3.SQL.Text := 'SELECT' +
        ' sp.cst_pis CST_PIS,' +
        ' sp.NAT_REC,' +
        ' '''' COD_CTA,' +
        ' sum(sp.valor_liquido) VL_REC_COMP' +
        ' from sped_presumido sp' +
        ' where sp.data_lancamento >= :dataIni and sp.data_lancamento <= :dataFim and sp.e_s = ''S''' +
        ' and sp.receita_pis_cofins = ''S'' and sp.cod_empresa = :cod_empresa and sp.situacao = ''REGULAR''' +
        ' group by 1,2,3';
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel3.Open;

      vNivel3.First;
      while not vNivel3.Eof do
      begin
        vCST_PIS:= _StrToSituacaoTribPIS(vNivel3.FieldByName('CST_PIS').AsString);
        if vCST_PIS in [{stpisValorAliquotaPorST, }stpisAliquotaZero, stpisIsentaContribuicao,
            stpisSemIncidenciaContribuicao, stpisSuspensaoContribuicao, stpisMonofaticaAliquotaZero] then
            acumulaRegistroM410(
              vNivel3.FieldByName('CST_PIS').AsString,
              vNivel3.FieldByName('COD_CTA').AsString, '',
              vNivel3.FieldByName('NAT_REC').AsString,
              vNivel3.FieldByName('VL_REC_COMP').AsFloat);
        vNivel3.Next;
      end;


    end;

  finally
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
    vNivel6.Close;
  end;
end;

procedure TSpedPISCOFINS.__montarBlocoM;
var
  vlistTemp : TStringList;
  I, J, K, L: Integer;
  vCOD_CONT, vStrTmp : string;
  vOK, vAdd: Boolean;
  vOKM220: Boolean;
  vOKM620: Boolean;
  vM210M610COD_CONT: string;
  vM210ALIQ_PIS, vM210ALIQ_PIS_QUANT, vM210M610VL_REC_BRT, vM210M610VL_BC_CONT, vM210QUANT_BC_PIS, vM610ALIQ_COFINS, vM610ALIQ_COFINS_QUANT, vM610QUANT_BC_COFINS: Extended;
  vM105M505NAT_BC_CRED, vM105M505CST : string;
  vM105M505VL_BC_TOT, vM105M505VL_BC_CUM, vM105M505QUANT_BC_TOT, vM105M505QUANT_BC,
    vM100ALIQ_PIS, vM500ALIQ_COFINS, vM100ALIQ_PIS_QUANT, vM500ALIQ_COFINS_QUANT: Extended;
  vM100COD_CRED: string;

  vValorTotalContrinuicao, vValorTotalCredito: Extended;

  procedure montaM105M505;
  var
    A, B: Integer;
    vTemM105, vTemM505, vTemM100, vTemM500: Boolean;
  begin
    vM105M505VL_BC_TOT := StrToFloatFormat(vM105M505VL_BC_TOT, 2);
    if vM105M505VL_BC_TOT = 0 then
      Exit;

    if not(FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = StrToCodIncTrib('3')) then
      vM105M505VL_BC_CUM := 0;

    vTemM105 := False;
    vTemM505 := False;
    vTemM100 := False;
    vTemM500 := False;

    if vM105M505CST = '50' then
      vM100COD_CRED := '101'
    else if vM105M505CST = '51' then
      vM100COD_CRED := '201'
    else if vM105M505CST = '52' then
      vM100COD_CRED := '301'
    else
      vM100COD_CRED := '101';

    //PIS
    if (vM100ALIQ_PIS > 0) or (vM100ALIQ_PIS_QUANT > 0) then
    begin
      for A := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM100.Count - 1 do
        if (FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].COD_CRED = vM100COD_CRED) and
          (FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].ALIQ_PIS = vM100ALIQ_PIS) and
          (FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].ALIQ_PIS_QUANT = vM100ALIQ_PIS_QUANT) then
        begin
          for B := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Count - 1 do
            if (FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].NAT_BC_CRED = StrToNatBcCred(vM105M505NAT_BC_CRED)) and
              (FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].CST_PIS = _StrToSituacaoTribPIS(vM105M505CST))then
            begin
              FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].VL_BC_PIS_TOT :=
                FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].VL_BC_PIS_TOT + vM105M505VL_BC_TOT;
              FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].VL_BC_PIS_CUM :=
                FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].VL_BC_PIS_CUM + vM105M505VL_BC_CUM;
              FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].VL_BC_PIS_NC :=
                FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].VL_BC_PIS_TOT -
                FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].VL_BC_PIS_CUM;
              FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].VL_BC_PIS :=
                FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].VL_BC_PIS_NC;
              FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].QUANT_BC_PIS_TOT :=
                FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].QUANT_BC_PIS_TOT + vM105M505QUANT_BC_TOT;
              FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].QUANT_BC_PIS :=
                FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].RegistroM105.Items[B].QUANT_BC_PIS + vM105M505QUANT_BC;
              vTemM105 := True;
              Break;
            end;

          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_BC_PIS :=
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_BC_PIS + (vM105M505VL_BC_TOT - vM105M505VL_BC_CUM);
          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].QUANT_BC_PIS :=
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].QUANT_BC_PIS + vM105M505QUANT_BC;
          if FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_BC_PIS > 0 then
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_CRED := StrToFloatFormat(
              FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_BC_PIS * FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].ALIQ_PIS / 100, 2)
          else
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_CRED := StrToFloatFormat(
              FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].QUANT_BC_PIS * FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].ALIQ_PIS_QUANT, 2);

          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_CRED_DISP := StrToFloatFormat(
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_CRED +
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_AJUS_ACRES -
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_AJUS_REDUC -
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_CRED_DIF, 2);

          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_CRED_DESC :=
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].VL_CRED_DISP;

          vTemM100 := True;
          Break;
        end;

      if not vTemM100 then
        with FSpedP.Bloco_M.RegistroM100New do
        begin
          COD_CRED := vM100COD_CRED;
          IND_CRED_ORI := icoOperProprias;
          VL_BC_PIS := vM105M505VL_BC_TOT - vM105M505VL_BC_CUM;
          ALIQ_PIS := vM100ALIQ_PIS;
          QUANT_BC_PIS := vM105M505QUANT_BC;
          ALIQ_PIS_QUANT := vM100ALIQ_PIS_QUANT;
          if VL_BC_PIS > 0 then
            VL_CRED := StrToFloatFormat(VL_BC_PIS * ALIQ_PIS / 100, 2)
          else
            VL_CRED := StrToFloatFormat(QUANT_BC_PIS * ALIQ_PIS_QUANT, 2);
          VL_AJUS_ACRES := 0;
          VL_AJUS_REDUC := 0;
          VL_CRED_DIF := 0;
          VL_CRED_DISP := StrToFloatFormat(VL_CRED + VL_AJUS_ACRES - VL_AJUS_REDUC - VL_CRED_DIF, 2);
          IND_DESC_CRED := idcTotal;
          VL_CRED_DESC := 0;
          SLD_CRED := VL_CRED_DISP - VL_CRED_DESC;
          FValorCredFuturo_Pis := SLD_CRED;
        end;

        if not vTemM105 then
          for A := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM100.Count - 1 do
            if FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[A].COD_CRED = vM100COD_CRED then
              with FSpedP.Bloco_M.RegistroM105New do
              begin
                NAT_BC_CRED := StrToNatBcCred(vM105M505NAT_BC_CRED);
                CST_PIS := StrToCstPis(vM105M505CST);
                VL_BC_PIS_TOT := vM105M505VL_BC_TOT;
                VL_BC_PIS_CUM := vM105M505VL_BC_CUM;
                VL_BC_PIS_NC := VL_BC_PIS_TOT - VL_BC_PIS_CUM;
                VL_BC_PIS := VL_BC_PIS_NC;
                QUANT_BC_PIS_TOT := vM105M505QUANT_BC_TOT;
                QUANT_BC_PIS := vM105M505QUANT_BC;
                DESC_CRED := '';
                Break;
              end;
    end;
    //COFINS
    if (vM500ALIQ_COFINS > 0) or (vM500ALIQ_COFINS_QUANT > 0) then
    begin
      for A := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM500.Count - 1 do
        if (FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].COD_CRED = vM100COD_CRED) and
          (FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].ALIQ_COFINS = vM500ALIQ_COFINS) and
          (FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].ALIQ_COFINS_QUANT = vM500ALIQ_COFINS_QUANT) then
        begin
          for B := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Count - 1 do
            if (FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].NAT_BC_CRED = StrToNatBcCred(vM105M505NAT_BC_CRED)) and
              (FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].CST_COFINS = _StrToSituacaoTribCOFINS(vM105M505CST))then
            begin
              FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].VL_BC_COFINS_TOT :=
                FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].VL_BC_COFINS_TOT + vM105M505VL_BC_TOT;
              FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].VL_BC_COFINS_CUM :=
                FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].VL_BC_COFINS_CUM + vM105M505VL_BC_CUM;
              FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].VL_BC_COFINS_NC :=
                FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].VL_BC_COFINS_TOT -
                FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].VL_BC_COFINS_CUM;
              FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].VL_BC_COFINS :=
                FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].VL_BC_COFINS_NC;
              FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].QUANT_BC_COFINS_TOT :=
                FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].QUANT_BC_COFINS_TOT + vM105M505QUANT_BC_TOT;
              FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].QUANT_BC_COFINS :=
                FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].RegistroM505.Items[B].QUANT_BC_COFINS + vM105M505QUANT_BC;
              vTemM505 := True;
              Break;
            end;

          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_BC_COFINS :=
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_BC_COFINS + (vM105M505VL_BC_TOT - vM105M505VL_BC_CUM);
          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].QUANT_BC_COFINS :=
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].QUANT_BC_COFINS + vM105M505QUANT_BC;
          if FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_BC_COFINS > 0 then
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_CRED := StrToFloatFormat(
              FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_BC_COFINS * FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].ALIQ_COFINS / 100, 2)
          else
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_CRED := StrToFloatFormat(
              FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].QUANT_BC_COFINS * FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].ALIQ_COFINS_QUANT, 2);

          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_CRED_DISP := StrToFloatFormat(
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_CRED +
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_AJUS_ACRES -
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_AJUS_REDUC -
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_CRED_DIFER, 2);

          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_CRED_DESC :=
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].VL_CRED_DISP;

          vTemM500 := True;
          Break;
        end;

      if not vTemM500 then
        with FSpedP.Bloco_M.RegistroM500New do
        begin
          COD_CRED := vM100COD_CRED;
          IND_CRED_ORI := icoOperProprias;
          VL_BC_COFINS := (vM105M505VL_BC_TOT - vM105M505VL_BC_CUM);
          ALIQ_COFINS := vM500ALIQ_COFINS;
          QUANT_BC_COFINS := vM105M505QUANT_BC;
          ALIQ_COFINS_QUANT := vM500ALIQ_COFINS_QUANT;
          if VL_BC_COFINS > 0 then
            VL_CRED := StrToFloatFormat(VL_BC_COFINS * ALIQ_COFINS / 100, 2)
          else
            VL_CRED := StrToFloatFormat(QUANT_BC_COFINS * ALIQ_COFINS_QUANT, 2);
          VL_AJUS_ACRES := 0;
          VL_AJUS_REDUC := 0;
          VL_CRED_DIFER := 0;
          VL_CRED_DISP := StrToFloatFormat(VL_CRED + VL_AJUS_ACRES - VL_AJUS_REDUC - VL_CRED_DIFER, 2);
          IND_DESC_CRED := idcTotal;
          VL_CRED_DESC := 0;
          SLD_CRED := VL_CRED_DISP - VL_CRED_DESC;
          FValorCredFuturo_Cofins := SLD_CRED;
        end;

        if not vTemM505 then
          for A := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM500.Count - 1 do
            if FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[A].COD_CRED = vM100COD_CRED then
              with FSpedP.Bloco_M.RegistroM505New do
              begin
                NAT_BC_CRED := StrToNatBcCred(vM105M505NAT_BC_CRED);
                CST_COFINS := StrToCstCofins(vM105M505CST);
                VL_BC_COFINS_TOT := vM105M505VL_BC_TOT;
                VL_BC_COFINS_CUM := vM105M505VL_BC_CUM;
                VL_BC_COFINS_NC := VL_BC_COFINS_TOT - VL_BC_COFINS_CUM;
                VL_BC_COFINS := VL_BC_COFINS_NC;
                QUANT_BC_COFINS_TOT := vM105M505QUANT_BC_TOT;
                QUANT_BC_COFINS := vM105M505QUANT_BC;
                DESC_CRED := '';
                Break;
              end;
    end;
  end;

  procedure montaM210M610;
  var
    A: Integer;
    vTemM210, vTemM610: Boolean;
  begin
    if (vM210M610VL_BC_CONT = 0) and (vM210QUANT_BC_PIS = 0) and (vM610QUANT_BC_COFINS = 0) then
      Exit;

    //PIS
    vTemM210 := False;
    if (vM210ALIQ_PIS > 0) or (vM210ALIQ_PIS_QUANT > 0) then
    begin
      for A := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Count - 1 do
        if (FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].COD_CONT = _StrToCodCont(vM210M610COD_CONT)) and
          (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].ALIQ_PIS, 4) = StrToFloatFormat(vM210ALIQ_PIS, 4)) and
          (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].ALIQ_PIS_QUANT, 4) = StrToFloatFormat(vM210ALIQ_PIS_QUANT, 4)) then
        begin
          FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_REC_BRT :=
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_REC_BRT + vM210M610VL_REC_BRT;
          FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_BC_CONT :=
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_BC_CONT + vM210M610VL_BC_CONT;
          FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].QUANT_BC_PIS :=
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].QUANT_BC_PIS + vM210QUANT_BC_PIS;
          if FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_BC_CONT > 0 then
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_CONT_APUR := StrToFloatFormat(
              FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_BC_CONT *
              FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].ALIQ_PIS / 100, 2)
          else
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_CONT_APUR := StrToFloatFormat(
              FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].QUANT_BC_PIS *
              FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].ALIQ_PIS_QUANT, 2);
          FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_CONT_PER := StrToFloatFormat(
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_CONT_APUR +
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_AJUS_ACRES -
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_AJUS_REDUC -
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_CONT_DIFER +
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[A].VL_CONT_DIFER_ANT, 2);
          vTemM210 := True;
          Break;
        end;
      if not vTemM210 then
      begin
        with FSpedP.Bloco_M.RegistroM210New do
        begin
          COD_CONT := _StrToCodCont(vM210M610COD_CONT);
          VL_REC_BRT := vM210M610VL_REC_BRT;
          VL_BC_CONT := vM210M610VL_BC_CONT;
          if vM210ALIQ_PIS > 0 then
            ALIQ_PIS := vM210ALIQ_PIS;
          QUANT_BC_PIS := vM210QUANT_BC_PIS;
          if vM210ALIQ_PIS_QUANT > 0 then
            ALIQ_PIS_QUANT := vM210ALIQ_PIS_QUANT;
          if VL_BC_CONT > 0 then
            VL_CONT_APUR := StrToFloatFormat(VL_BC_CONT * ALIQ_PIS / 100, 2)
          else
            VL_CONT_APUR := StrToFloatFormat(QUANT_BC_PIS * ALIQ_PIS_QUANT, 2);
          VL_AJUS_ACRES := 0;
          VL_AJUS_REDUC := 0;
          VL_CONT_DIFER := 0;
          VL_CONT_DIFER_ANT := 0;
          VL_CONT_PER := StrToFloatFormat(VL_CONT_APUR + VL_AJUS_ACRES - VL_AJUS_REDUC - VL_CONT_DIFER + VL_CONT_DIFER_ANT, 2);
        end;
      end;
    end;

    //COFINS
    vTemM610 := False;
    if (vM610ALIQ_COFINS > 0) or (vM610ALIQ_COFINS_QUANT > 0) then
    begin
      for A := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Count - 1 do
        if (FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].COD_CONT = _StrToCodCont(vM210M610COD_CONT)) and
          (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].ALIQ_COFINS, 4) = StrToFloatFormat(vM610ALIQ_COFINS, 4)) and
          (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].ALIQ_COFINS_QUANT, 4) = StrToFloatFormat(vM610ALIQ_COFINS_QUANT, 4)) then
        begin
          FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_REC_BRT :=
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_REC_BRT + vM210M610VL_REC_BRT;
          FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_BC_CONT :=
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_BC_CONT + vM210M610VL_BC_CONT;
          FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].QUANT_BC_COFINS :=
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].QUANT_BC_COFINS + vM610QUANT_BC_COFINS;
          if FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_BC_CONT > 0 then
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_CONT_APUR := StrToFloatFormat(
              FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_BC_CONT *
              FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].ALIQ_COFINS / 100, 2)
          else
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_CONT_APUR := StrToFloatFormat(
              FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].QUANT_BC_COFINS *
              FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].ALIQ_COFINS_QUANT, 2);
          FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_CONT_PER := StrToFloatFormat(
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_CONT_APUR +
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_AJUS_ACRES -
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_AJUS_REDUC -
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_CONT_DIFER +
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[A].VL_CONT_DIFER_ANT, 2);
          vTemM610 := True;
          Break;
        end;
      if not vTemM610 then
      begin
        with FSpedP.Bloco_M.RegistroM610New do
        begin
          COD_CONT := _StrToCodCont(vM210M610COD_CONT);
          VL_REC_BRT := vM210M610VL_REC_BRT;
          VL_BC_CONT := vM210M610VL_BC_CONT;
          if vM610ALIQ_COFINS > 0 then
            ALIQ_COFINS := vM610ALIQ_COFINS;
          QUANT_BC_COFINS := vM610QUANT_BC_COFINS;
          if vM610ALIQ_COFINS_QUANT > 0 then
            ALIQ_COFINS_QUANT := vM610ALIQ_COFINS_QUANT;
          if VL_BC_CONT > 0 then
            VL_CONT_APUR := StrToFloatFormat(VL_BC_CONT * ALIQ_COFINS / 100, 2)
          else
            VL_CONT_APUR := StrToFloatFormat(QUANT_BC_COFINS * ALIQ_COFINS_QUANT, 2);
          VL_AJUS_ACRES := 0;
          VL_AJUS_REDUC := 0;
          VL_CONT_DIFER := 0;
          VL_CONT_DIFER_ANT := 0;
          VL_CONT_PER := StrToFloatFormat(VL_CONT_APUR + VL_AJUS_ACRES - VL_AJUS_REDUC - VL_CONT_DIFER + VL_CONT_DIFER_ANT, 2);
        end;
      end;
    end;

  end;

begin
  FLabelEmpresas.Caption := 'Todas as empresas';
  FValorCredFuturo_Pis := 0;
  FValorCredFuturo_Cofins := 0;

  FM410.Sorted := True;
  FM410.Sort;

  vlistTemp:= TStringList.Create;
  for I := 0 to FM410.Count - 1 do
  begin
    vAdd:= True;
    for J := 0 to vlistTemp.Count - 1 do
    begin
      if (getCampoPipe(FM410[I], 1) = getCampoPipe(vlistTemp[J], 1)) and
        (getCampoPipe(FM410[I], 2) = getCampoPipe(vlistTemp[J], 2)) and
        (getCampoPipe(FM410[I], 3) = getCampoPipe(vlistTemp[J], 3)) then
      begin
        vAdd:= False;
        Break;
      end;
    end;

    if vAdd then
      vlistTemp.Add( getCampoPipe(FM410[I], 1) + '|' + getCampoPipe(FM410[I], 2) + '|' + getCampoPipe(FM410[I], 3) + '|');
  end;

  if FM410.Count > 0 then
    FSpedP.Bloco_M.RegistroM001New.IND_MOV := imComDados;

  for J := 0 to vlistTemp.Count - 1 do
  begin
    with FSpedP.Bloco_M.RegistroM400New do
    begin
      CST_PIS := _StrToSituacaoTribPIS(getCampoPipe(vlistTemp[J], 1));
      COD_CTA := getCampoPipe(vlistTemp[J], 2);
      DESC_COMPL := getCampoPipe(vlistTemp[J], 3);
      VL_TOT_REC := 0;
      for I := 0 to FM410.Count - 1 do
      begin
        if (getCampoPipe(FM410[I], 1) = getCampoPipe(vlistTemp[J], 1)) and
          (getCampoPipe(FM410[I], 2) = getCampoPipe(vlistTemp[J], 2)) and
          (getCampoPipe(FM410[I], 3) = getCampoPipe(vlistTemp[J], 3)) then
          begin
            with FSpedP.Bloco_M.RegistroM410New do
            begin
              NAT_REC := getCampoPipe(FM410[I], 4);
              VL_REC := StrToFloat(getCampoPipe(FM410[I], 5));
              COD_CTA := getCampoPipe(FM410[I], 2);
              DESC_COMPL := getCampoPipe(FM410[I], 3);
              VL_TOT_REC := VL_TOT_REC + VL_REC;
            end;
          end;
      end;
    end;

    with FSpedP.Bloco_M.RegistroM800New do
    begin
      CST_COFINS := _StrToSituacaoTribCOFINS(getCampoPipe(vlistTemp[J], 1));
      COD_CTA := getCampoPipe(vlistTemp[J], 2);
      DESC_COMPL := getCampoPipe(vlistTemp[J], 3);
      VL_TOT_REC := 0;
      for I := 0 to FM410.Count - 1 do
      begin
        if (getCampoPipe(FM410[I], 1) = getCampoPipe(vlistTemp[J], 1)) and
          (getCampoPipe(FM410[I], 2) = getCampoPipe(vlistTemp[J], 2)) and
          (getCampoPipe(FM410[I], 3) = getCampoPipe(vlistTemp[J], 3)) then
          begin
            with FSpedP.Bloco_M.RegistroM810New do
            begin
              NAT_REC := getCampoPipe(FM410[I], 4);
              VL_REC := StrToFloat(getCampoPipe(FM410[I], 5));
              COD_CTA := getCampoPipe(FM410[I], 2);
              DESC_COMPL := getCampoPipe(FM410[I], 3);
              VL_TOT_REC := VL_TOT_REC + VL_REC;
            end;
          end;
      end;
    end;
  end;

  if (FIncidTribPISCOFINS = '2') and (Trim(cfopDevolucaoCompra) <> '') then
  begin

    FLabelStatus.Caption := 'Montando registro M200 e M600';
    Application.ProcessMessages;

    vStrTmp := cfopDevolucaoCompra + '|';

    vStrTmp := StringReplace(vStrTmp, '||', '', [rfReplaceAll]);
    vStrTmp := StringReplace(vStrTmp, '|', ',', [rfReplaceAll]);
    vStrTmp := '(' + vStrTmp + ')';

    vNivel4.Close;
    vNivel4.SQL.Text :=
      'select nfi.cod_nf, nfi.nitem, nfi.cod_nf_dev, nfi.nitem_dev, nfi.cst_pis, nfi.aliq_pis, nfi.aliq_pis_quant,' +
      ' nfi.aliq_cofins, nfi.aliq_cofins_quant, nfi.valor_pis, nfi.valor_cofins, nf.num_nf, nf.cod_empresa,' +
      ' nfi.base_cofins, nfi.base_pis' +
      ' from notafiscal nf' +
      ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
      ' inner join empresa e on e.cod_empresa = nf.cod_empresa and e.gerar_sped_piscofins = ''S''' +
      ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and nf.natureza_nf = ''E''' +
      ' and nf.status = ''Fechada'' and (nf.da is null or nf.da <> ''S'')' +
      ' and nfi.codigo_nop in ' + vStrTmp ;
      // ( 1201, 1202, 1203, 1204, 1410, 1411, 1660, 1661, 1662, 2201, 2202, 2410, 2411, 2660, 2661, 2662 )';
    vNivel4.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel4.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel4.Open;

    vNivel3.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;
    FProgressBar.Position := 1;

    vNivel4.First;
    while not vNivel4.Eof do
    begin
      Application.ProcessMessages;
      vQrAux.Close;

      if (vNivel4.FieldByName('cod_nf_dev').AsInteger > 0) and
        (vNivel4.FieldByName('nitem_dev').AsInteger > 0) then
      begin
        vQrAux.SQL.Text := 'select nfi.nitem from notafiscal_item nfi' +
          ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
          ' where nfi.cod_nf = :cod_nf' +
          ' and nfi.nitem = :nitem' +
          ' and nf.data_lanc >= :dataini and nf.data_lanc <= :dataFim' +
          ' and nfi.cod_empresa = :cod_empresa';
        vQrAux.ParamByName('cod_nf').AsInteger := vNivel4.FieldByName('cod_nf_dev').AsInteger;
        vQrAux.ParamByName('nitem').AsInteger := vNivel4.FieldByName('nitem_dev').AsInteger;
        vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
        vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
        vQrAux.ParamByName('cod_empresa').AsInteger := vNivel4.FieldByName('cod_empresa').AsInteger;
        vQrAux.Open;
      end;

      if ((not vQrAux.Active) or (vQrAux.IsEmpty)) and (vNivel4.FieldByName('valor_pis').AsFloat > 0) then
      begin
        if FIncidTribPISCOFINS = '1' then
          vCOD_CONT := '0'
        else vCOD_CONT := '5';

        if StrToFloatFormat(vNivel4.FieldByName('aliq_pis_quant').AsFloat,2) > 0 then
          vCOD_CONT := vCOD_CONT + '3'
        else if StrToFloatFormat(vNivel4.FieldByName('aliq_pis').AsFloat,2) <> StrToFloatFormat(FAliqPIS, 2) then
          vCOD_CONT := vCOD_CONT + '2'
        else
          vCOD_CONT := vCOD_CONT + '1';

        vOK:= False;
        for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Count - 1 do
        begin
          if (FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].COD_CONT = _StrToCodCont(vCOD_CONT)) and
            (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].ALIQ_PIS_QUANT, 4) =
              StrToFloatFormat(vNivel4.FieldByName('aliq_pis_quant').AsFloat,4)) and
            (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].ALIQ_PIS, 2) =
              StrToFloatFormat(vNivel4.FieldByName('aliq_pis').AsFloat, 2)) then
          begin
            vOK := True;
            FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].VL_AJUS_REDUC :=
              FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].VL_AJUS_REDUC +
              vNivel4.FieldByName('valor_pis').AsFloat;

            vOKM220 := False;  
            for J := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].RegistroM220.Count - 1 do
            begin
              if FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].RegistroM220.Items[J].NUM_DOC =
                vNivel4.FieldByName('num_nf').AsString then
              begin
                vOKM220 := True;
                FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].RegistroM220.Items[J].VL_AJ :=
                  FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].RegistroM220.Items[J].VL_AJ +
                  vNivel4.FieldByName('valor_pis').AsFloat;
                Break;
              end;
            end;
            if not vOKM220 then
              with FSpedP.Bloco_M.RegistroM220New do
              begin
                IND_AJ := indAjReducao;
                VL_AJ := vNivel4.FieldByName('valor_pis').AsFloat;
                COD_AJ := codAjOutrasSituacaoes;
                NUM_DOC := vNivel4.FieldByName('num_nf').AsString;
                DESCR_AJ := 'DEVOLUÇÃO DE VENDAS';
              end;

            Break;
          end;
        end;
        if not vOK then
        begin
          FSpedP.Bloco_M.RegistroM001New.IND_MOV := imComDados;
          with FSpedP.Bloco_M.RegistroM210New do
          begin
            COD_CONT := _StrToCodCont(vCOD_CONT);
            VL_REC_BRT := 0;
            VL_BC_CONT := 0;
            if vNivel4.FieldByName('aliq_pis').AsFloat > 0 then
              ALIQ_PIS := vNivel4.FieldByName('aliq_pis').AsFloat;
            QUANT_BC_PIS := 0;
            if vNivel4.FieldByName('aliq_pis_quant').AsFloat > 0 then
              ALIQ_PIS_QUANT := vNivel4.FieldByName('aliq_pis_quant').AsFloat;
            VL_CONT_APUR := 0;
            VL_AJUS_ACRES := 0;
            VL_AJUS_REDUC := vNivel4.FieldByName('valor_pis').AsFloat;
            VL_CONT_DIFER := 0;
            VL_CONT_DIFER_ANT := 0;
            VL_CONT_PER := 0;
            with FSpedP.Bloco_M.RegistroM220New do
            begin
              IND_AJ := indAjReducao;
              VL_AJ := vNivel4.FieldByName('valor_pis').AsFloat;
              COD_AJ := codAjOutrasSituacaoes;
              NUM_DOC := vNivel4.FieldByName('num_nf').AsString;
              DESCR_AJ := 'DEVOLUÇÃO DE VENDAS';
            end;
          end;
        end;
      end;

      if ((not vQrAux.Active) or (vQrAux.IsEmpty)) and (vNivel4.FieldByName('valor_cofins').AsFloat > 0) then
      begin     
        if FIncidTribPISCOFINS = '1' then
          vCOD_CONT := '0'
        else vCOD_CONT := '5';

        if StrToFloatFormat(vNivel4.FieldByName('aliq_cofins_quant').AsFloat,2) > 0 then
          vCOD_CONT := vCOD_CONT + '3'
        else if StrToFloatFormat(vNivel4.FieldByName('aliq_cofins').AsFloat,2) <> StrToFloatFormat(FAliqCOFINS, 2) then
          vCOD_CONT := vCOD_CONT + '2'
        else
          vCOD_CONT := vCOD_CONT + '1';
          
        vOK:= False;
        for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Count - 1 do
        begin
          if (FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].COD_CONT = _StrToCodCont(vCOD_CONT)) and
            (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].ALIQ_COFINS_QUANT, 4) =
              StrToFloatFormat(vNivel4.FieldByName('aliq_cofins_quant').AsFloat,4)) and
            (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].ALIQ_COFINS, 2) =
              StrToFloatFormat(vNivel4.FieldByName('aliq_cofins').AsFloat, 2)) then
          begin
            vOK := True;
            FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].VL_AJUS_REDUC :=
              FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].VL_AJUS_REDUC +
              vNivel4.FieldByName('valor_cofins').AsFloat;

            vOKM620:= False;
            for J := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].RegistroM620.Count - 1 do
            begin
              if FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].RegistroM620.Items[J].NUM_DOC =
                vNivel4.FieldByName('num_nf').AsString then
              begin
                vOKM620 := true;
                FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].RegistroM620.Items[J].VL_AJ :=
                  FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].RegistroM620.Items[J].VL_AJ +
                  vNivel4.FieldByName('valor_cofins').AsFloat;
                Break;
              end;
            end;
            if not vOKM620 then
              with FSpedP.Bloco_M.RegistroM620New do
              begin
                IND_AJ := indAjReducao;
                VL_AJ := vNivel4.FieldByName('valor_cofins').AsFloat;
                COD_AJ := codAjOutrasSituacaoes;
                NUM_DOC := vNivel4.FieldByName('num_nf').AsString;
                DESCR_AJ := 'DEVOLUÇÃO DE VENDAS';
              end;

            Break;
          end;
        end;
        if not vOK then
        begin
          FSpedP.Bloco_M.RegistroM001New.IND_MOV := imComDados;
          with FSpedP.Bloco_M.RegistroM610New do
          begin
            COD_CONT := _StrToCodCont(vCOD_CONT);
            VL_REC_BRT := 0;
            VL_BC_CONT := 0;
            if vNivel4.FieldByName('aliq_cofins').AsFloat > 0 then
              ALIQ_COFINS := vNivel4.FieldByName('aliq_cofins').AsFloat;
            QUANT_BC_COFINS := 0;
            if vNivel4.FieldByName('aliq_cofins_quant').AsFloat > 0 then
              ALIQ_COFINS_QUANT := vNivel4.FieldByName('aliq_cofins_quant').AsFloat;
            VL_CONT_APUR := 0;
            VL_AJUS_ACRES := 0;
            VL_AJUS_REDUC := vNivel4.FieldByName('valor_cofins').AsFloat;
            VL_CONT_DIFER := 0;
            VL_CONT_DIFER_ANT := 0;
            VL_CONT_PER := 0;
            with FSpedP.Bloco_M.RegistroM620New do
            begin
              IND_AJ := indAjReducao;
              VL_AJ := vNivel4.FieldByName('valor_cofins').AsFloat;
              COD_AJ := codAjOutrasSituacaoes;
              NUM_DOC := vNivel4.FieldByName('num_nf').AsString;
              DESCR_AJ := 'DEVOLUÇÃO DE VENDAS';
            end;
          end;
        end;

      end;

      vNivel4.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;
  end
  else if (FIncidTribPISCOFINS = '1') and (Trim(cfopDevolucaoVenda) <> '') then
  begin

    FLabelStatus.Caption := 'Montando registro M100 e M500';
    Application.ProcessMessages;

    vStrTmp := cfopDevolucaoVenda + '|';

    vStrTmp := StringReplace(vStrTmp, '||', '', [rfReplaceAll]);
    vStrTmp := StringReplace(vStrTmp, '|', ',', [rfReplaceAll]);
    vStrTmp := '(' + vStrTmp + ')';
    
    vNivel4.Close;
    vNivel4.SQL.Text :=
      'select nfi.cod_nf, nfi.nitem, nfi.cod_nf_dev, nfi.nitem_dev, nfi.cst_pis, nfi.aliq_pis, nfi.aliq_pis_quant,' +
      ' nfi.aliq_cofins, nfi.aliq_cofins_quant, nfi.valor_pis, nfi.valor_cofins, nf.num_nf, nf.cod_empresa' +
      ' from notafiscal nf' +
      ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
      ' inner join empresa e on e.cod_empresa = nf.cod_empresa and e.gerar_sped_piscofins = ''S''' +
      ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and nf.natureza_nf = ''S''' +
      ' and nf.status = ''Fechada'' and (nf.da is null or nf.da <> ''S'')' +
      ' and nfi.codigo_nop in ' + vStrTmp;
//      ( 5205, 5206, 5207, 6205, 6206, 6207, 7205, 7206, 7207, 5201, 5202, 5210, 5410, 5411, 5413,' +
//      ' 5660, 6201, 6202, 6210, 6410, 6411, 6413, 6660, 7201, 7202, 7210 )';
    vNivel4.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel4.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel4.Open;

    vNivel4.FetchAll;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel4.RecordCount;
    FProgressBar.Position := 1;

    vNivel4.First;
    while not vNivel4.Eof do
    begin
      Application.ProcessMessages;
      vQrAux.Close;

      if (vNivel4.FieldByName('cod_nf_dev').AsInteger > 0) and
        (vNivel4.FieldByName('nitem_dev').AsInteger > 0) then
      begin
        vQrAux.SQL.Text := 'select nfi.nitem from notafiscal_item nfi' +
          ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
          ' where nfi.cod_nf = :cod_nf' +
          ' and nfi.nitem = :nitem' +
          ' and nf.data_lanc >= :dataini and nf.data_lanc <= :dataFim' +
          ' and nfi.cod_empresa = :cod_empresa';
        vQrAux.ParamByName('cod_nf').AsInteger := vNivel4.FieldByName('cod_nf_dev').AsInteger;
        vQrAux.ParamByName('nitem').AsInteger := vNivel4.FieldByName('nitem_dev').AsInteger;
        vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
        vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
        vQrAux.ParamByName('cod_empresa').AsInteger := vNivel4.FieldByName('cod_empresa').AsInteger;
        vQrAux.Open;
      end;

      if ((not vQrAux.Active) or (vQrAux.IsEmpty)) and (vNivel4.FieldByName('valor_pis').AsFloat > 0) then
      begin
        vCOD_CONT := '10';

        if StrToFloatFormat(vNivel4.FieldByName('aliq_pis_quant').AsFloat,2) > 0 then
          vCOD_CONT := vCOD_CONT + '3'
        else if StrToFloatFormat(vNivel4.FieldByName('aliq_pis').AsFloat,2) <> StrToFloatFormat(FAliqPIS, 2) then
          vCOD_CONT := vCOD_CONT + '2'
        else
          vCOD_CONT := vCOD_CONT + '1';

        vOK:= False;
        for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM100.Count - 1 do
        //for I := 0 to FSpedP.Bloco_M.RegistroM100Count - 1 do
        begin
          if (FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].COD_CRED = vCOD_CONT) and
            (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].ALIQ_PIS_QUANT, 4) =
              StrToFloatFormat(vNivel4.FieldByName('aliq_pis_quant').AsFloat,4)) and
            (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].ALIQ_PIS, 2) =
              StrToFloatFormat(vNivel4.FieldByName('aliq_pis').AsFloat, 2)) then
          begin
            vOK := True;
            FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_AJUS_REDUC :=
              FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_AJUS_REDUC +
              vNivel4.FieldByName('valor_pis').AsFloat;

            for J := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].RegistroM110.Count - 1 do
            begin
              if FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].RegistroM110.Items[J].NUM_DOC =
                vNivel4.FieldByName('num_nf').AsString then
              begin
                FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].RegistroM110.Items[J].VL_AJ :=
                  FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].RegistroM110.Items[J].VL_AJ +
                  vNivel4.FieldByName('valor_pis').AsFloat;
                Break;
              end;
            end;

            Break;
          end;
        end;
        if not vOK then
        begin
          FSpedP.Bloco_M.RegistroM001New.IND_MOV := imComDados;
          with FSpedP.Bloco_M.RegistroM100New do
          begin
            COD_CRED := vCOD_CONT;
            IND_CRED_ORI := icoOperProprias;
            VL_BC_PIS := 0;
            ALIQ_PIS := vNivel4.FieldByName('aliq_pis').AsFloat;
            QUANT_BC_PIS := 0;
            if vNivel4.FieldByName('aliq_pis_quant').AsFloat > 0 then
              ALIQ_PIS_QUANT := vNivel4.FieldByName('aliq_pis_quant').AsFloat;
            VL_CRED := 0;
            VL_AJUS_ACRES := 0;
            VL_AJUS_REDUC := vNivel4.FieldByName('valor_pis').AsFloat;
            VL_CRED_DIF := 0;
            VL_CRED_DISP := 0;
            IND_DESC_CRED := idcTotal;
            VL_CRED_DESC := 0;
            SLD_CRED := 0;
            FValorCredFuturo_Pis := SLD_CRED;
            with FSpedP.Bloco_M.RegistroM110New do
            begin
              IND_AJ := indAjReducao;
              VL_AJ := vNivel4.FieldByName('valor_pis').AsFloat;
              COD_AJ := codAjOutrasSituacaoes;
              NUM_DOC := vNivel4.FieldByName('num_nf').AsString;
              DESCR_AJ := 'DEVOLUÇÃO DE COMPRAS';
            end;
          end;
        end;
      end;

      if ((not vQrAux.Active) or (vQrAux.IsEmpty)) and (vNivel4.FieldByName('valor_cofins').AsFloat > 0) then
      begin
        vCOD_CONT := '10';

        if StrToFloatFormat(vNivel4.FieldByName('aliq_cofins_quant').AsFloat,2) > 0 then
          vCOD_CONT := vCOD_CONT + '3'
        else if StrToFloatFormat(vNivel4.FieldByName('aliq_cofins').AsFloat,2) <> StrToFloatFormat(FAliqCOFINS, 2) then
          vCOD_CONT := vCOD_CONT + '2'
        else
          vCOD_CONT := vCOD_CONT + '1';

        vOK:= False;
        for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM500.Count - 1 do
        //for I := 0 to FSpedP.Bloco_M.RegistroM500Count - 1 do
        begin
          if (FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].COD_CRED = vCOD_CONT) and
            (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].ALIQ_COFINS_QUANT, 4) =
              StrToFloatFormat(vNivel4.FieldByName('aliq_cofins_quant').AsFloat,4)) and
            (StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].ALIQ_COFINS, 2) =
              StrToFloatFormat(vNivel4.FieldByName('aliq_cofins').AsFloat, 2)) then
          begin
            vOK := True;
            FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_AJUS_REDUC :=
              FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_AJUS_REDUC +
              vNivel4.FieldByName('valor_cofins').AsFloat;

            for J := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].RegistroM510.Count - 1 do
            begin
              if FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].RegistroM510.Items[J].NUM_DOC =
                vNivel4.FieldByName('num_nf').AsString then
              begin
                FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].RegistroM510.Items[J].VL_AJ :=
                  FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].RegistroM510.Items[J].VL_AJ +
                  vNivel4.FieldByName('valor_cofins').AsFloat;
                Break;
              end;
            end;

            Break;
          end;
        end;
        if not vOK then
        begin
          FSpedP.Bloco_M.RegistroM001New.IND_MOV := imComDados;
          with FSpedP.Bloco_M.RegistroM500New do
          begin
            COD_CRED := vCOD_CONT;
            IND_CRED_ORI := icoOperProprias;
            VL_BC_COFINS := 0;
            ALIQ_COFINS := vNivel4.FieldByName('aliq_cofins').AsFloat;
            QUANT_BC_COFINS := 0;
            if vNivel4.FieldByName('aliq_cofins_quant').AsFloat > 0 then
              ALIQ_COFINS_QUANT := vNivel4.FieldByName('aliq_cofins_quant').AsFloat;
            VL_CRED := 0;
            VL_AJUS_ACRES := 0;
            VL_AJUS_REDUC := vNivel4.FieldByName('valor_cofins').AsFloat;
            VL_CRED_DIFER := 0;
            VL_CRED_DISP := 0;
            IND_DESC_CRED := idcTotal;
            VL_CRED_DESC := 0;
            SLD_CRED := 0;
            FValorCredFuturo_Cofins := SLD_CRED;
            with FSpedP.Bloco_M.RegistroM510New do
            begin
              IND_AJ := indAjReducao;
              VL_AJ := vNivel4.FieldByName('valor_cofins').AsFloat;
              COD_AJ := codAjOutrasSituacaoes;
              NUM_DOC := vNivel4.FieldByName('num_nf').AsString;
              DESCR_AJ := 'DEVOLUÇÃO DE COMPRAS';
            end;
          end;
        end;

      end;

      vNivel4.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;
  end;


  // Montando registros M100, M500, M105 e M505

  vM105M505VL_BC_CUM := 0;
  //Bloco A Registros A170
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_A.RegistroA001.RegistroA010.Count - 1 do
      for J := 0 to FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Count - 1 do
        if FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].IND_OPER = StrToIndOper('0') then //Servicos contratados
          if (FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].VL_BC_PIS > 0) then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].NAT_BC_CRED);
            vM105M505CST := CstPisToStr(FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].CST_PIS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].VL_BC_PIS;
            vM100ALIQ_PIS := FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].ALIQ_PIS;
            vM500ALIQ_COFINS := FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].ALIQ_COFINS;
            vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;

  //Bloco C Registros C170
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Count - 1 do
        if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].IND_OPER = StrToIndTipoOper('0') then //tpEntradaAquisicao
          for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Count - 1 do
            if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].VL_BC_PIS > 0) then
            begin
              vM105M505NAT_BC_CRED := NatBcCredToStr(bccAqBensRevenda);
              vM105M505CST := CstPisToStr(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].CST_PIS);
              vM105M505VL_BC_TOT := StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].VL_BC_PIS,2);
              vM100ALIQ_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].ALIQ_PIS_PERC;
              vM500ALIQ_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].ALIQ_COFINS_PERC;
              vM100ALIQ_PIS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].ALIQ_PIS_R;
              vM500ALIQ_COFINS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].ALIQ_COFINS_R;
              vM105M505VL_BC_CUM := 0;
              vM105M505QUANT_BC_TOT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].QUANT_BC_PIS;
              vM105M505QUANT_BC := 0;
              montaM105M505;
            end;

  //Bloco C Registros C501 e C505
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Count - 1 do
      begin
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC501.Count - 1 do
          if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC501.Items[K].VL_BC_PIS > 0) then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC501.Items[K].NAT_BC_CRED);
            vM105M505CST := CstPisToStr(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC501.Items[K].CST_PIS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC501.Items[K].VL_BC_PIS;
            vM100ALIQ_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC501.Items[K].ALIQ_PIS;
            vM500ALIQ_COFINS := 0; vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC505.Count - 1 do
          if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC505.Items[K].VL_BC_COFINS > 0) then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC505.Items[K].NAT_BC_CRED);
            vM105M505CST := CstCofinsToStr(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC505.Items[K].CST_COFINS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC505.Items[K].VL_BC_COFINS;
            vM500ALIQ_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC500.Items[J].RegistroC505.Items[K].ALIQ_COFINS;
            vM100ALIQ_PIS := 0; vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;
      end;

  //Bloco D Registros D101 e D105
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_D.RegistroD001.RegistroD010.Count - 1 do
      for J := 0 to FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Count - 1 do
      begin
        for K := 0 to FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD101.Count - 1 do
          if (FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD101.Items[K].VL_BC_PIS > 0) then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD101.Items[K].NAT_BC_CRED);
            vM105M505CST := CstPisToStr(FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD101.Items[K].CST_PIS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD101.Items[K].VL_BC_PIS;
            vM100ALIQ_PIS := FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD101.Items[K].ALIQ_PIS;
            vM500ALIQ_COFINS := 0; vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;
        for K := 0 to FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD105.Count - 1 do
          if (FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD105.Items[K].VL_BC_COFINS > 0) then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD105.Items[K].NAT_BC_CRED);
            vM105M505CST := CstCofinsToStr(FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD105.Items[K].CST_COFINS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD105.Items[K].VL_BC_COFINS;
            vM500ALIQ_COFINS := FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD100.Items[J].RegistroD105.Items[K].ALIQ_COFINS;
            vM100ALIQ_PIS := 0; vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;
      end;

  //Bloco D Registros D501 e D505
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_D.RegistroD001.RegistroD010.Count - 1 do
      for J := 0 to FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Count - 1 do
      begin
        for K := 0 to FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD501.Count - 1 do
          if (FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD501.Items[K].VL_BC_PIS > 0) then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD501.Items[K].NAT_BC_CRED);
            vM105M505CST := CstPisToStr(FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD501.Items[K].CST_PIS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD501.Items[K].VL_BC_PIS;
            vM100ALIQ_PIS := FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD501.Items[K].ALIQ_PIS;
            vM500ALIQ_COFINS := 0; vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;
        for K := 0 to FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD505.Count - 1 do
          if (FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD505.Items[K].VL_BC_COFINS > 0) then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD505.Items[K].NAT_BC_CRED);
            vM105M505CST := CstCofinsToStr(FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD505.Items[K].CST_COFINS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD505.Items[K].VL_BC_COFINS;
            vM500ALIQ_COFINS := FSpedP.Bloco_D.RegistroD001.RegistroD010.Items[i].RegistroD500.Items[J].RegistroD505.Items[K].ALIQ_COFINS;
            vM100ALIQ_PIS := 0; vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;
      end;

  //Bloco F Registros F100
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
      for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Count - 1 do
      begin
        if FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].VL_BC_PIS > 0 then
          if (copy(CstPisToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].CST_PIS),1,1) <> '0') and
            (copy(CstPisToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].CST_PIS),1,1) <> '4') then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].NAT_BC_CRED);
            vM105M505CST := CstPisToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].CST_PIS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].VL_BC_PIS;
            vM100ALIQ_PIS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].ALIQ_PIS;
            vM500ALIQ_COFINS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].ALIQ_COFINS;
            vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;
      end;

  //Bloco F Registros F120
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
      for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF120.Count - 1 do
      begin
        if FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF120.Items[J].VL_BC_PIS > 0 then
          if (copy(CstPisToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF120.Items[J].CST_PIS),1,1) <> '0') and
            (copy(CstPisToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF120.Items[J].CST_PIS),1,1) <> '4') then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF120.Items[J].NAT_BC_CRED);
            vM105M505CST := CstPisToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF120.Items[J].CST_PIS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF120.Items[J].VL_BC_PIS;
            vM100ALIQ_PIS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF120.Items[J].ALIQ_PIS;
            vM500ALIQ_COFINS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF120.Items[J].ALIQ_COFINS;
            vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;
      end;

  //Bloco F Registros F130
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
      for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF130.Count - 1 do
      begin
        if FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF130.Items[J].VL_BC_PIS > 0 then
          if (copy(CstPisToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF130.Items[J].CST_PIS),1,1) <> '0') and
            (copy(CstPisToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF130.Items[J].CST_PIS),1,1) <> '4') then
          begin
            vM105M505NAT_BC_CRED := NatBcCredToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF130.Items[J].NAT_BC_CRED);
            vM105M505CST := CstPisToStr(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF130.Items[J].CST_PIS);
            vM105M505VL_BC_TOT := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF130.Items[J].VL_BC_PIS;
            vM100ALIQ_PIS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF130.Items[J].ALIQ_PIS;
            vM500ALIQ_COFINS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF130.Items[J].ALIQ_COFINS;
            vM100ALIQ_PIS_QUANT := 0; vM500ALIQ_COFINS_QUANT := 0; vM105M505VL_BC_CUM := 0; vM105M505QUANT_BC_TOT := 0; vM105M505QUANT_BC := 0;
            montaM105M505;
          end;
      end;


  // Bloco M200
  //Bloco A servicos A170
  for I := 0 to FSpedP.Bloco_A.RegistroA001.RegistroA010.Count - 1 do
    for J := 0 to FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Count - 1 do
      if FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].IND_OPER = StrToIndOper('1') then
        for K := 0 to FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Count - 1 do
          if (FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].VL_BC_PIS > 0) and
            (FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].CST_PIS in
            ([stpisValorAliquotaNormal, stpisValorAliquotaDiferenciada, stpisQtdeAliquotaUnidade, stpisMonofaticaAliquotaZero, stpisValorAliquotaPorST])) then
          begin
            if FIncidTribPISCOFINS = '1' then
              vM210M610COD_CONT := '0'
            else
              vM210M610COD_CONT := '5';

            if FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].CST_PIS = stpisQtdeAliquotaUnidade then
              vM210M610COD_CONT := vM210M610COD_CONT + '3'
            else if StrToFloatFormat(FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].ALIQ_PIS, 4) <> StrToFloatFormat(FAliqPIS, 4) then
              vM210M610COD_CONT := vM210M610COD_CONT + '2'
            else
              vM210M610COD_CONT := vM210M610COD_CONT + '1';

            vM210ALIQ_PIS := FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].ALIQ_PIS;
            vM210M610VL_REC_BRT := FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].VL_ITEM;
            if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
              vM210M610VL_BC_CONT := 0
            else
              vM210M610VL_BC_CONT := FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].VL_BC_PIS;
            vM610ALIQ_COFINS := FSpedP.Bloco_A.RegistroA001.RegistroA010.Items[i].RegistroA100.Items[J].RegistroA170.Items[K].ALIQ_COFINS;
            vM210ALIQ_PIS_QUANT := 0; vM210QUANT_BC_PIS := 0; vM610ALIQ_COFINS_QUANT := 0; vM610QUANT_BC_COFINS := 0;
              

            if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
              montaM210M610;
          end;

  //Bloco C itens C170
  for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
    for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Count - 1 do
      if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].IND_OPER = StrToIndTipoOper('1')) and
        ((FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].COD_MOD <> '55') or
        (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].IND_ESCRI = IndEscriIndividualizado)) then
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Count - 1 do
          if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].VL_BC_PIS > 0) and
            (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].CST_PIS in
            ([stpisValorAliquotaNormal, stpisValorAliquotaDiferenciada, stpisQtdeAliquotaUnidade, stpisMonofaticaAliquotaZero, stpisValorAliquotaPorST])) then
          begin
            if FIncidTribPISCOFINS = '1' then
              vM210M610COD_CONT := '0'
            else
              vM210M610COD_CONT := '5';

            if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].CST_PIS = stpisQtdeAliquotaUnidade then
              vM210M610COD_CONT := vM210M610COD_CONT + '3'
            else if StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].ALIQ_PIS_PERC, 4) <> StrToFloatFormat(FAliqPIS, 4) then
              vM210M610COD_CONT := vM210M610COD_CONT + '2'
            else
              vM210M610COD_CONT := vM210M610COD_CONT + '1';

            vM210ALIQ_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].ALIQ_PIS_PERC;
            vM210M610VL_REC_BRT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].VL_ITEM;
            if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
              vM210M610VL_BC_CONT := 0
            else
              vM210M610VL_BC_CONT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].VL_BC_PIS;
            vM610ALIQ_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC100.Items[J].RegistroC170.Items[K].ALIQ_COFINS_PERC;
            vM210ALIQ_PIS_QUANT := 0; vM210QUANT_BC_PIS := 0; vM610ALIQ_COFINS_QUANT := 0; vM610QUANT_BC_COFINS := 0;

            if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
              montaM210M610;
          end;

  //Bloco C itens C181
  for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
    if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].IND_ESCRI = IndEscriConsolidado) then
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Count - 1 do
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Count - 1 do
          if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Items[K].VL_BC_PIS > 0) and
            (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Items[K].CST_PIS in
            ([stpisValorAliquotaNormal, stpisValorAliquotaDiferenciada, stpisQtdeAliquotaUnidade, stpisMonofaticaAliquotaZero, stpisValorAliquotaPorST])) then
          begin
            if FIncidTribPISCOFINS = '1' then
              vM210M610COD_CONT := '0'
            else
              vM210M610COD_CONT := '5';

            if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Items[K].CST_PIS = stpisQtdeAliquotaUnidade then
              vM210M610COD_CONT := vM210M610COD_CONT + '3'
            else if StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Items[K].ALIQ_PIS,2) <> StrToFloatFormat(FAliqPIS, 2) then
              vM210M610COD_CONT := vM210M610COD_CONT + '2'
            else
              vM210M610COD_CONT := vM210M610COD_CONT + '1';

            vM210ALIQ_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Items[K].ALIQ_PIS;
            vM210M610VL_REC_BRT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Items[K].VL_ITEM;
            if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
              vM210M610VL_BC_CONT := 0
            else
              vM210M610VL_BC_CONT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Items[K].VL_BC_PIS;
            vM210ALIQ_PIS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Items[K].ALIQ_PIS_QUANT;
            vM210QUANT_BC_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC181.Items[K].QUANT_BC_PIS;
            vM610ALIQ_COFINS := 0; vM610ALIQ_COFINS_QUANT := 0; vM610QUANT_BC_COFINS := 0;

            if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
              montaM210M610;
          end;

  //Bloco C itens C185
  for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
    if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].IND_ESCRI = IndEscriConsolidado) then
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Count - 1 do
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Count - 1 do
          if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Items[K].VL_BC_COFINS > 0) and
            (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Items[K].CST_COFINS in
            ([stcofinsValorAliquotaNormal, stcofinsValorAliquotaDiferenciada, stcofinsQtdeAliquotaUnidade, stcofinsMonofaticaAliquotaZero, stcofinsValorAliquotaPorST])) then
          begin
            if FIncidTribPISCOFINS = '1' then
              vM210M610COD_CONT := '0'
            else
              vM210M610COD_CONT := '5';

            if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Items[K].CST_COFINS = stcofinsQtdeAliquotaUnidade then
              vM210M610COD_CONT := vM210M610COD_CONT + '3'
            else if StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Items[K].ALIQ_COFINS, 4) <> StrToFloatFormat(FAliqCOFINS, 4) then
              vM210M610COD_CONT := vM210M610COD_CONT + '2'
            else
              vM210M610COD_CONT := vM210M610COD_CONT + '1';

            vM210M610VL_REC_BRT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Items[K].VL_ITEM;
            if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
              vM210M610VL_BC_CONT := 0
            else
              vM210M610VL_BC_CONT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Items[K].VL_BC_COFINS;
            vM210ALIQ_PIS := 0; vM210ALIQ_PIS_QUANT := 0; vM210QUANT_BC_PIS := 0;
            vM610ALIQ_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Items[K].ALIQ_COFINS;
            vM610ALIQ_COFINS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Items[K].ALIQ_COFINS_QUANT;
            vM610QUANT_BC_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC180.Items[J].RegistroC185.Items[K].QUANT_BC_COFINS;

            if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
              montaM210M610;
          end;

  //Bloco C itens C491
  for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
    if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].IND_ESCRI = IndEscriConsolidado) then
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Count - 1 do
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Count - 1 do
          if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Items[K].VL_BC_PIS > 0) and
            (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Items[K].CST_PIS in
            ([stpisValorAliquotaNormal, stpisValorAliquotaDiferenciada, stpisQtdeAliquotaUnidade, stpisMonofaticaAliquotaZero, stpisValorAliquotaPorST])) then
          begin
            if FIncidTribPISCOFINS = '1' then
              vM210M610COD_CONT := '0'
            else
              vM210M610COD_CONT := '5';

            if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Items[K].CST_PIS = stpisQtdeAliquotaUnidade then
              vM210M610COD_CONT := vM210M610COD_CONT + '3'
            else if StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Items[K].ALIQ_PIS,2) <> StrToFloatFormat(FAliqPIS, 2) then
              vM210M610COD_CONT := vM210M610COD_CONT + '2'
            else
              vM210M610COD_CONT := vM210M610COD_CONT + '1';

            vM210ALIQ_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Items[K].ALIQ_PIS;
            vM210M610VL_REC_BRT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Items[K].VL_ITEM;
            if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
              vM210M610VL_BC_CONT := 0
            else
              vM210M610VL_BC_CONT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Items[K].VL_BC_PIS;
            vM210ALIQ_PIS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Items[K].ALIQ_PIS_QUANT;
            vM210QUANT_BC_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC491.Items[K].QUANT_BC_PIS;
            vM610ALIQ_COFINS := 0; vM610ALIQ_COFINS_QUANT := 0; vM610QUANT_BC_COFINS := 0;

            if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
              montaM210M610;
          end;

  //Bloco C itens C495
  for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
    if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].IND_ESCRI = IndEscriConsolidado) then
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Count - 1 do
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Count - 1 do
          if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Items[K].VL_BC_COFINS > 0) and
            (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Items[K].CST_COFINS in
            ([stcofinsValorAliquotaNormal, stcofinsValorAliquotaDiferenciada, stcofinsQtdeAliquotaUnidade, stcofinsMonofaticaAliquotaZero, stcofinsValorAliquotaPorST])) then
          begin
            if FIncidTribPISCOFINS = '1' then
              vM210M610COD_CONT := '0'
            else
              vM210M610COD_CONT := '5';

            if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Items[K].CST_COFINS = stcofinsQtdeAliquotaUnidade then
              vM210M610COD_CONT := vM210M610COD_CONT + '3'
            else if StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Items[K].ALIQ_COFINS, 4) <> StrToFloatFormat(FAliqCOFINS, 4) then
              vM210M610COD_CONT := vM210M610COD_CONT + '2'
            else
              vM210M610COD_CONT := vM210M610COD_CONT + '1';

            vM210M610VL_REC_BRT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Items[K].VL_ITEM;
            if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
              vM210M610VL_BC_CONT := 0
            else
              vM210M610VL_BC_CONT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Items[K].VL_BC_COFINS;
            vM210ALIQ_PIS := 0; vM210ALIQ_PIS_QUANT := 0; vM210QUANT_BC_PIS := 0;
            vM610ALIQ_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Items[K].ALIQ_COFINS;
            vM610ALIQ_COFINS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Items[K].ALIQ_COFINS_QUANT;
            vM610QUANT_BC_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC490.Items[J].RegistroC495.Items[K].QUANT_BC_COFINS;

            if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
              montaM210M610;
          end;

  //Bloco C itens C481
  for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
    if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].IND_ESCRI = IndEscriIndividualizado) then
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Count - 1 do
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Count - 1 do
          for L := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Count - 1 do
            if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Items[L].VL_BC_PIS > 0) and
              (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Items[L].CST_PIS in
              ([stpisValorAliquotaNormal, stpisValorAliquotaDiferenciada, stpisQtdeAliquotaUnidade, stpisMonofaticaAliquotaZero, stpisValorAliquotaPorST])) then
            begin
              if FIncidTribPISCOFINS = '1' then
                vM210M610COD_CONT := '0'
              else
                vM210M610COD_CONT := '5';

              if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Items[L].CST_PIS = stpisQtdeAliquotaUnidade then
                vM210M610COD_CONT := vM210M610COD_CONT + '3'
              else if StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Items[L].ALIQ_PIS,2) <> StrToFloatFormat(FAliqPIS, 2) then
                vM210M610COD_CONT := vM210M610COD_CONT + '2'
              else
                vM210M610COD_CONT := vM210M610COD_CONT + '1';

              vM210ALIQ_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Items[L].ALIQ_PIS;
              vM210M610VL_REC_BRT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Items[L].VL_ITEM;
              if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
                vM210M610VL_BC_CONT := 0
              else
                vM210M610VL_BC_CONT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Items[L].VL_BC_PIS;
              vM210ALIQ_PIS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Items[L].ALIQ_PIS_QUANT;
              vM210QUANT_BC_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC481.Items[L].QUANT_BC_PIS;
              vM610ALIQ_COFINS := 0; vM610ALIQ_COFINS_QUANT := 0; vM610QUANT_BC_COFINS := 0;

              if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
                montaM210M610;
            end;

  //Bloco C itens C485
  for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
    if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].IND_ESCRI = IndEscriIndividualizado) then
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Count - 1 do
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Count - 1 do
          for L := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Count - 1 do
            if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Items[L].VL_BC_COFINS > 0) and
              (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Items[L].CST_COFINS in
              ([stcofinsValorAliquotaNormal, stcofinsValorAliquotaDiferenciada, stcofinsQtdeAliquotaUnidade, stcofinsMonofaticaAliquotaZero, stcofinsValorAliquotaPorST])) then
            begin
              if FIncidTribPISCOFINS = '1' then
                vM210M610COD_CONT := '0'
              else
                vM210M610COD_CONT := '5';

              if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Items[L].CST_COFINS = stcofinsQtdeAliquotaUnidade then
                vM210M610COD_CONT := vM210M610COD_CONT + '3'
              else if StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Items[L].ALIQ_COFINS, 4) <> StrToFloatFormat(FAliqCOFINS, 4) then
                vM210M610COD_CONT := vM210M610COD_CONT + '2'
              else
                vM210M610COD_CONT := vM210M610COD_CONT + '1';

              vM210M610VL_REC_BRT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Items[L].VL_ITEM;
              if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
                vM210M610VL_BC_CONT := 0
              else
                vM210M610VL_BC_CONT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Items[L].VL_BC_COFINS;
              vM210ALIQ_PIS := 0; vM210ALIQ_PIS_QUANT := 0; vM210QUANT_BC_PIS := 0;
              vM610ALIQ_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Items[L].ALIQ_COFINS;
              vM610ALIQ_COFINS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Items[L].ALIQ_COFINS_QUANT;
              vM610QUANT_BC_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC400.Items[J].RegistroC405.Items[K].RegistroC485.Items[L].QUANT_BC_COFINS;

              if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
                montaM210M610;
            end;

  //Bloco C itens C381
  for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
    if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].IND_ESCRI = IndEscriIndividualizado) then
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Count - 1 do
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Count - 1 do
          if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Items[K].VL_BC_PIS > 0) and
            (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Items[K].CST_PIS in
            ([stpisValorAliquotaNormal, stpisValorAliquotaDiferenciada, stpisQtdeAliquotaUnidade, stpisMonofaticaAliquotaZero, stpisValorAliquotaPorST])) then
          begin
            if FIncidTribPISCOFINS = '1' then
              vM210M610COD_CONT := '0'
            else
              vM210M610COD_CONT := '5';

            if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Items[K].CST_PIS = stpisQtdeAliquotaUnidade then
              vM210M610COD_CONT := vM210M610COD_CONT + '3'
            else if StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Items[K].ALIQ_PIS,2) <> StrToFloatFormat(FAliqPIS, 2) then
              vM210M610COD_CONT := vM210M610COD_CONT + '2'
            else
              vM210M610COD_CONT := vM210M610COD_CONT + '1';

            vM210ALIQ_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Items[K].ALIQ_PIS;
            vM210M610VL_REC_BRT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Items[K].VL_ITEM;
            if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
              vM210M610VL_BC_CONT := 0
            else
              vM210M610VL_BC_CONT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Items[K].VL_BC_PIS;
            vM210ALIQ_PIS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Items[K].ALIQ_PIS_QUANT;
            vM210QUANT_BC_PIS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC381.Items[K].QUANT_BC_PIS;
            vM610ALIQ_COFINS := 0; vM610ALIQ_COFINS_QUANT := 0; vM610QUANT_BC_COFINS := 0;

            if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
              montaM210M610;
          end;

  //Bloco C itens C385
  for I := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Count - 1 do
    if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].IND_ESCRI = IndEscriIndividualizado) then
      for J := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Count - 1 do
        for K := 0 to FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Count - 1 do
          if (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Items[K].VL_BC_COFINS > 0) and
            (FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Items[K].CST_COFINS in
            ([stcofinsValorAliquotaNormal, stcofinsValorAliquotaDiferenciada, stcofinsQtdeAliquotaUnidade, stcofinsMonofaticaAliquotaZero, stcofinsValorAliquotaPorST])) then
          begin
            if FIncidTribPISCOFINS = '1' then
              vM210M610COD_CONT := '0'
            else
              vM210M610COD_CONT := '5';

            if FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Items[K].CST_COFINS = stcofinsQtdeAliquotaUnidade then
              vM210M610COD_CONT := vM210M610COD_CONT + '3'
            else if StrToFloatFormat(FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Items[K].ALIQ_COFINS, 4) <> StrToFloatFormat(FAliqCOFINS, 4) then
              vM210M610COD_CONT := vM210M610COD_CONT + '2'
            else
              vM210M610COD_CONT := vM210M610COD_CONT + '1';

            vM210M610VL_REC_BRT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Items[K].VL_ITEM;
            if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
              vM210M610VL_BC_CONT := 0
            else
              vM210M610VL_BC_CONT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Items[K].VL_BC_COFINS;
            vM210ALIQ_PIS := 0; vM210ALIQ_PIS_QUANT := 0; vM210QUANT_BC_PIS := 0;
            vM610ALIQ_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Items[K].ALIQ_COFINS;
            vM610ALIQ_COFINS_QUANT := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Items[K].ALIQ_COFINS_QUANT;
            vM610QUANT_BC_COFINS := FSpedP.Bloco_C.RegistroC001.RegistroC010.Items[i].RegistroC380.Items[J].RegistroC385.Items[K].QUANT_BC_COFINS;

            if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
              montaM210M610;
          end;

  //Bloco F itens F100
  for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
    for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Count - 1 do
      if (FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].VL_BC_COFINS > 0) and
        (FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].CST_COFINS in
        ([stcofinsValorAliquotaNormal, stcofinsValorAliquotaDiferenciada, stcofinsQtdeAliquotaUnidade, stcofinsMonofaticaAliquotaZero, stcofinsValorAliquotaPorST])) then
      begin
        if FIncidTribPISCOFINS = '1' then
          vM210M610COD_CONT := '0'
        else
          vM210M610COD_CONT := '5';

        if FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].CST_COFINS = stcofinsQtdeAliquotaUnidade then
          vM210M610COD_CONT := vM210M610COD_CONT + '3'
        else if StrToFloatFormat(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].ALIQ_COFINS, 4) <> StrToFloatFormat(FAliqCOFINS, 4) then
          vM210M610COD_CONT := vM210M610COD_CONT + '2'
        else
          vM210M610COD_CONT := vM210M610COD_CONT + '1';

        vM210M610VL_REC_BRT := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].VL_OPER;
        if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
          vM210M610VL_BC_CONT := 0
        else
          vM210M610VL_BC_CONT := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].VL_BC_COFINS;
        vM210ALIQ_PIS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].ALIQ_PIS;
        vM610ALIQ_COFINS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF100.Items[J].ALIQ_COFINS;
        vM210ALIQ_PIS_QUANT := 0; vM210QUANT_BC_PIS := 0; vM610ALIQ_COFINS_QUANT := 0; vM610QUANT_BC_COFINS := 0;

        if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
          montaM210M610;
      end;

  //Bloco F itens F500
  for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
    for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF500.Count - 1 do
      if (FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF500.Items[J].VL_BC_COFINS > 0) and
        (FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF500.Items[J].CST_COFINS in
        ([stcofinsValorAliquotaNormal, stcofinsValorAliquotaDiferenciada, stcofinsQtdeAliquotaUnidade, stcofinsMonofaticaAliquotaZero, stcofinsValorAliquotaPorST])) then
      begin
        if FIncidTribPISCOFINS = '1' then
          vM210M610COD_CONT := '0'
        else
          vM210M610COD_CONT := '5';

        if FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF500.Items[J].CST_COFINS = stcofinsQtdeAliquotaUnidade then
          vM210M610COD_CONT := vM210M610COD_CONT + '3'
        else if StrToFloatFormat(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF500.Items[J].ALIQ_COFINS, 4) <> StrToFloatFormat(FAliqCOFINS, 4) then
          vM210M610COD_CONT := vM210M610COD_CONT + '2'
        else
          vM210M610COD_CONT := vM210M610COD_CONT + '1';

        vM210M610VL_REC_BRT := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF500.Items[J].VL_REC_CAIXA;
        if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
          vM210M610VL_BC_CONT := 0
        else
          vM210M610VL_BC_CONT := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF500.Items[J].VL_BC_COFINS;
        vM210ALIQ_PIS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF500.Items[J].ALIQ_PIS;
        vM610ALIQ_COFINS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF500.Items[J].ALIQ_COFINS;
        vM210ALIQ_PIS_QUANT := 0; vM210QUANT_BC_PIS := 0; vM610ALIQ_COFINS_QUANT := 0; vM610QUANT_BC_COFINS := 0;

        if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
          montaM210M610;
      end;

  //Bloco F itens F550
  for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
    for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF550.Count - 1 do
      if (FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF550.Items[J].VL_BC_COFINS > 0) and
        (FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF550.Items[J].CST_COFINS in
        ([stcofinsValorAliquotaNormal, stcofinsValorAliquotaDiferenciada, stcofinsQtdeAliquotaUnidade, stcofinsMonofaticaAliquotaZero, stcofinsValorAliquotaPorST])) then
      begin
        if FIncidTribPISCOFINS = '1' then
          vM210M610COD_CONT := '0'
        else
          vM210M610COD_CONT := '5';

        if FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF550.Items[J].CST_COFINS = stcofinsQtdeAliquotaUnidade then
          vM210M610COD_CONT := vM210M610COD_CONT + '3'
        else if StrToFloatFormat(FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF550.Items[K].ALIQ_COFINS, 4) <> StrToFloatFormat(FAliqCOFINS, 4) then
          vM210M610COD_CONT := vM210M610COD_CONT + '2'
        else
          vM210M610COD_CONT := vM210M610COD_CONT + '1';

        vM210M610VL_REC_BRT := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF550.Items[J].VL_REC_COMP;
        if FSpedP.Bloco_0.Registro0000.IND_NAT_PJ = indNatPJSocCooperativa then
          vM210M610VL_BC_CONT := 0
        else
          vM210M610VL_BC_CONT := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF550.Items[J].VL_BC_COFINS;
        vM210ALIQ_PIS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF550.Items[J].ALIQ_PIS;
        vM610ALIQ_COFINS := FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[i].RegistroF550.Items[J].ALIQ_COFINS;
        vM210ALIQ_PIS_QUANT := 0; vM210QUANT_BC_PIS := 0; vM610ALIQ_COFINS_QUANT := 0; vM610QUANT_BC_COFINS := 0;

        if _StrToCodCont(vM210M610COD_CONT) in ([_StrToCodCont('01'), _StrToCodCont('51'), _StrToCodCont('02'), _StrToCodCont('52'), _StrToCodCont('31'), _StrToCodCont('32')]) then
          montaM210M610;
      end;

  FSpedP.Bloco_M.RegistroM001New.IND_MOV := imComDados;
  with FSpedP.Bloco_M.RegistroM200New do
  begin
    VL_TOT_CONT_NC_PER := 0;
    VL_TOT_CRED_DESC := 0;
    VL_TOT_CRED_DESC_ANT := 0;
    VL_TOT_CONT_NC_DEV := 0;
    VL_RET_NC := 0;
    VL_OUT_DED_NC := 0;
    VL_CONT_NC_REC := 0;
    VL_TOT_CONT_CUM_PER := 0;
    VL_RET_CUM := 0;
    VL_OUT_DED_CUM := 0;
    VL_CONT_CUM_REC := 0;
    VL_TOT_CONT_REC := 0;
  end;
  with FSpedP.Bloco_M.RegistroM600New do
  begin
    VL_TOT_CONT_NC_PER := 0;
    VL_TOT_CRED_DESC := 0;
    VL_TOT_CRED_DESC_ANT := 0;
    VL_TOT_CONT_NC_DEV := 0;
    VL_RET_NC := 0;
    VL_OUT_DED_NC := 0;
    VL_CONT_NC_REC := 0;
    VL_TOT_CONT_CUM_PER := 0;
    VL_RET_CUM := 0;
    VL_OUT_DED_CUM := 0;
    VL_CONT_CUM_REC := 0;
    VL_TOT_CONT_REC := 0;
  end;

  //M200
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Count - 1 do
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_NC_PER :=
        FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_NC_PER +
        FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].VL_CONT_PER;

  vValorTotalContrinuicao := 0;
  for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Count - 1 do
    vValorTotalContrinuicao := vValorTotalContrinuicao + FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].VL_CONT_PER;//VL_REC_BRT;

  vValorTotalCredito := 0;
  for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM100.Count - 1 do
    vValorTotalCredito := vValorTotalCredito + FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_CRED_DISP;

  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
  begin
    if vValorTotalContrinuicao >= vValorTotalCredito then
    begin
      for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM100.Count - 1 do
      begin
        FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].IND_DESC_CRED := idcTotal;
        FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_CRED_DESC :=
          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_CRED_DISP;
        FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].SLD_CRED :=
          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_CRED_DISP -
          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_CRED_DESC;
        FValorCredFuturo_Pis := FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].SLD_CRED;
      end;
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CRED_DESC := vValorTotalCredito;

    end
    else if vValorTotalContrinuicao < vValorTotalCredito then
    begin
      for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM100.Count - 1 do
      begin
        FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].IND_DESC_CRED := idcParcial;
        FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_CRED_DESC :=
          (vValorTotalContrinuicao / vValorTotalCredito) *
          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_CRED_DISP;
        FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].SLD_CRED :=
          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_CRED_DISP -
          FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].VL_CRED_DESC;
        FValorCredFuturo_Pis := FSpedP.Bloco_M.RegistroM001.RegistroM100.Items[I].SLD_CRED;
      end;
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CRED_DESC := vValorTotalContrinuicao;
    end;
  end;

  //Retencao do piscofins no m200
//  for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
//    for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Count - 1 do
//      if (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
//        FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_CUM :=
//          FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_CUM +
//          FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_PIS
//      else
//        FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_NC :=
//          FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_NC +
//          FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_PIS;

  FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_NC_DEV :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_NC_PER, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CRED_DESC, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CRED_DESC_ANT, 2);

  FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC :=
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_NC_DEV, 2) -
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_NC, 2) -
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_OUT_DED_NC, 2);

  for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Count - 1 do
    if FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].COD_CONT in
      ([_StrToCodCont('31'), _StrToCodCont('32'),
      _StrToCodCont('51'), _StrToCodCont('52'), _StrToCodCont('53'), _StrToCodCont('54'), _StrToCodCont('72')]) then
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_CUM_PER:=
        FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_CUM_PER +
        StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.RegistroM210.Items[I].VL_CONT_PER, 2);

  FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_CUM_REC :=
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_CUM_PER, 2) -
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_CUM, 2) -
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_OUT_DED_CUM, 2);

  FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_REC :=
    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC +
    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_CUM_REC;
    
  //M600
  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
    for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Count - 1 do
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_NC_PER :=
        FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_NC_PER +
        FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].VL_CONT_PER;

  vValorTotalContrinuicao := 0;
  for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Count - 1 do
    vValorTotalContrinuicao := vValorTotalContrinuicao + FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].VL_CONT_PER;//VL_REC_BRT;

  vValorTotalCredito := 0;
  for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM500.Count - 1 do
    vValorTotalCredito := vValorTotalCredito + FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_CRED_DISP;

  if not (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
  begin
    if vValorTotalContrinuicao >= vValorTotalCredito then
    begin
      for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM500.Count - 1 do
      begin
        FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].IND_DESC_CRED := idcTotal;
        FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_CRED_DESC :=
          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_CRED_DISP;
        FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].SLD_CRED :=
          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_CRED_DISP -
          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_CRED_DESC;
        FValorCredFuturo_Cofins := FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].SLD_CRED;
      end;
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CRED_DESC := vValorTotalCredito;

    end
    else if vValorTotalContrinuicao < vValorTotalCredito then
    begin
      for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM500.Count - 1 do
      begin
        FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].IND_DESC_CRED := idcParcial;
        FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_CRED_DESC :=
          (vValorTotalContrinuicao / vValorTotalCredito) *
          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_CRED_DISP;
        FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].SLD_CRED :=
          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_CRED_DISP -
          FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].VL_CRED_DESC;
        FValorCredFuturo_Cofins := FSpedP.Bloco_M.RegistroM001.RegistroM500.Items[I].SLD_CRED;
      end;
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CRED_DESC := vValorTotalContrinuicao;
    end;
  end;

  //Retencao do piscofins no m200
//  for J := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Count - 1 do
//    for I := 0 to FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Count - 1 do
//      if (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
//        FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_CUM :=
//          FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_CUM +
//          FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_COFINS
//      else
//        FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_NC :=
//          FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_NC +
//          FSpedP.Bloco_F.RegistroF001.RegistroF010.Items[J].RegistroF600.Items[I].VL_RET_COFINS;

  FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_NC_DEV :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_NC_PER, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CRED_DESC, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CRED_DESC_ANT, 2);

  FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_NC_REC :=
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_NC_DEV, 2) -
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_NC, 2) -
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_OUT_DED_NC, 2);

  for I := 0 to FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Count - 1 do
    if FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].COD_CONT in
      ([_StrToCodCont('31'), _StrToCodCont('32'),
      _StrToCodCont('51'), _StrToCodCont('52'), _StrToCodCont('53'), _StrToCodCont('54'), _StrToCodCont('72')]) then
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_CUM_PER:=
        FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_CUM_PER +
        StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.RegistroM610.Items[I].VL_CONT_PER, 2);

  FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_CUM_REC :=
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_CUM_PER, 2) -
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_CUM, 2) -
    StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_OUT_DED_CUM, 2);

  FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_REC :=
    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_NC_REC +
    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_CUM_REC;

  //Verificando creditos anteriores de PIS e COFINS
  if (FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_REC > 0) or
    (FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_REC > 0) then
  begin

    _verificarCreditosPISCOFINS(True,
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_REC,
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_REC);

    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CRED_DESC_ANT := FVL_TOT_CRED_DESC_ANT_PIS;

    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_NC_DEV :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_NC_PER, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CRED_DESC, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CRED_DESC_ANT, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_NC_DEV, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_NC, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_OUT_DED_NC, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_CUM_REC :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_CUM_PER, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_CUM, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_OUT_DED_CUM, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_REC :=
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC +
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_CUM_REC;

    //COFINS
    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CRED_DESC_ANT := FVL_TOT_CRED_DESC_ANT_COFINS;

    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_NC_DEV :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_NC_PER, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CRED_DESC, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CRED_DESC_ANT, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_NC_REC :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_NC_DEV, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_NC, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_OUT_DED_NC, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_CUM_REC :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_CUM_PER, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_CUM, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_OUT_DED_CUM, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_REC :=
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_NC_REC +
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_CUM_REC;
  end
  else
    _verificarCreditosPISCOFINS(True,
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_REC,
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_REC);
      
  //Verificando retencoes anteriores de PIS e COFINS
  if (FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_REC > 0) or
    (FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_REC > 0) then
  begin

    _verificarRetencoesPISCOFINS(True,
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_REC,
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_REC);

    if (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_CUM :=FVL_TOT_RETENC_DESC_ANT_PIS
    else
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_NC := FVL_TOT_RETENC_DESC_ANT_PIS;

    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_NC_DEV, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_NC, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_OUT_DED_NC, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_CUM_REC :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_CUM_PER, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_RET_CUM, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_OUT_DED_CUM, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_REC :=
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC +
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_CUM_REC;

    //COFINS
    if (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncCumulativo) then
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_CUM := FVL_TOT_RETENC_DESC_ANT_COFINS
    else
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_NC := FVL_TOT_RETENC_DESC_ANT_COFINS;

    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_NC_REC :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_NC_DEV, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_NC, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_OUT_DED_NC, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_CUM_REC :=
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_CUM_PER, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_RET_CUM, 2) -
      StrToFloatFormat(FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_OUT_DED_CUM, 2);

    FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_REC :=
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_NC_REC +
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_CUM_REC;
  end
  else
  begin
    _verificarRetencoesPISCOFINS(True,
      FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_TOT_CONT_REC,
      FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_TOT_CONT_REC);
  end;

//  if FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC > 0 then
  if (FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC > 0) or
    (FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_CUM_REC > 0) then
    with FSpedP.Bloco_M.RegistroM205New do
    begin
      if (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncNaoCumulativo) then
      begin
        NUM_CAMPO := '08';
        if Trim(FCOD_REC_M205) <> '' then
          COD_REC := Trim(FCOD_REC_M205)
        else
          COD_REC := '691201';
        VL_DEBITO := FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC;
      end
      else
      begin
        NUM_CAMPO := '12';
        if Trim(FCOD_REC_M205) <> '' then
          COD_REC := Trim(FCOD_REC_M205)
        else
          COD_REC := '810902';
        VL_DEBITO := FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_CUM_REC;
      end;
    end;
//  if FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_NC_REC > 0 then
  if (FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_NC_REC > 0) or
    (FSpedP.Bloco_M.RegistroM001.RegistroM200.VL_CONT_CUM_REC > 0) then
    with FSpedP.Bloco_M.RegistroM605New do
    begin
      if (FSpedP.Bloco_0.Registro0001.Registro0110.COD_INC_TRIB = codEscrOpIncNaoCumulativo) then
      begin
        NUM_CAMPO := '08';
        if Trim(FCOD_REC_M605) <> '' then
          COD_REC := Trim(FCOD_REC_M605)
        else
          COD_REC := '585601';
        VL_DEBITO := FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_NC_REC;
      end
      else
      begin
        NUM_CAMPO := '12';
        if Trim(FCOD_REC_M605) <> '' then
          COD_REC := Trim(FCOD_REC_M605)
        else
          COD_REC := '217201';
        VL_DEBITO := FSpedP.Bloco_M.RegistroM001.RegistroM600.VL_CONT_CUM_REC;
      end;
    end;
end;

end.

