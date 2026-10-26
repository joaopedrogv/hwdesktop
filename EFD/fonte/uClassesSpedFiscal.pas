unit uClassesSpedFiscal;

interface

uses
  StdCtrls, ComCtrls, Classes, ACBrSpedFiscal, uSpedHw, IBX.IBquery, IBX.IBDatabase, Contnrs,
    uClasseConexao, System.Generics.Collections, hw_rest_compl_utils, efd_icmsst_cr_apuracao_class,
    Query_OOP;

const
  Sigla: array[1..27] of string = ('AC', 'AC', 'AM', 'RR', 'PA', 'AP', 'TO', 'MA', 'PI', 'CE', 'RN',
    'PB', 'PE', 'AL', 'SE', 'BA', 'MG', 'ES', 'RJ', 'SP', 'PR', 'SC', 'RS', 'MS', 'MT', 'GO', 'DF');
  IBGE: array[1..27] of string = ('11', '12', '13', '14', '15', '16', '17', '21', '22', '23', '24',
    '25', '26', '27', '28', '29', '31', '32', '33', '35', '41', '42', '43', '50', '51', '52', '53');

  CFOP_DEV_ST_S: array[1..14] of string =  ('5410', '5411', '5414', '5415', '5660', '5661', '1662',
                                            '6410', '6411', '6414', '6415', '6660', '6661', '6662');

  CFOP_DEV_ST_E: array[1..14] of string = ('1410', '1411', '1414', '1415', '1660', '1661', '1662',
                                           '2410', '2411', '2414', '2415', '2660', '2661', '2662');

  strNfDataVersion = 'Ver003';

type
  CampoImposto = (csCampoVlMerc, csCamposProprios, csCampoOutros);

  RConf_Bloco_K = record
    Ativo, Producao, Estoque: Boolean;
    dataEstoque, dataAjusteIni, dataAjusteFim: TDate;
    Dados_0210: string;
  end;

  RConf_ICMSST = record
    EmissaoPropria: CampoImposto;
    EmissaoTerceiro: CampoImposto;
    AntecipacaoST: Boolean;
  end;

  RConf_IPI = record
  private
    CFOPsDeCamposProprios: TArray<Integer>;
  public
    EmissaoPropria: CampoImposto;
    EmissaoTerceiro: CampoImposto;
  public
    function GetCampoImposto(const AEmissaoPropia: Boolean; ACFOP: Integer): CampoImposto;
  end;

  RConf_ICMSSN = record
    FormaAjuste: string;
    CodigoAjuste: string;
  end;

  RConf_Inventario = record
    RegistroH020_MultiplicarPelaQtde: Boolean;
  end;

  RConf_Escrituracao = record
    Ativo: Boolean;
    ConfST: RConf_ICMSST;
    ConfIPI: RConf_IPI;
    ConfICMSSN: RConf_ICMSSN;
    ConfInventario: RConf_Inventario;
  end;

  TSpedFiscal = class;

  TRestComplST = class(TConexao)
  strict private
    FGerar: Boolean;
    ConfEANInv: TStrings;
    ArqEntrada: TStrings;
    ArqSaidas: TStrings;
    function RegistroSaida: TObjectList<TRestCompSaida>;
  private
    FOwner: TSpedFiscal;
    FDataIni: TDateTime;
    FDataFim: TDateTime;
    FDataInv: TDateTime;
    FEstoque: TConexao_OOP;
    RefDev: TConexao_OOP;
    C180: TObjectList<TC180>;
    C181: TObjectList<TC181>;
    FRegSaida: TObjectList<TRestCompSaida>;
    C186: TObjectList<TC186>;
    H030: TObjectList<TH030>;
    ProdCont: TArqContProdList;
    EstPeriodo: TObjectList<TEstoquePeriodo>;
    Conf: TICMS_ST_rest_compl_Conf;
    FUsarJaGravado: Boolean;

  public
    constructor Create(AOwner: TSpedFiscal);
    destructor Destroy; override;

    function CalcularExecutar(perfil: string): Boolean;

    function RegistroC180(id, itemid: Integer): TObjectList<TC180>;
    function RegistroC181(id, itemid: Integer): TObjectList<TC181>;
    function RegistroC185(tpdoc: string; id: Integer): TObjectList<TRestCompSaida>;
    function RegistroC186(id: Integer): TObjectList<TC186>;
    function RegistroC330(data: TDateTime; grupo: Integer; codigo: string): TObjectList<TRestCompSaida>;
    function RegistroC380(id, grupo: Integer; codigo: string): TObjectList<TRestCompSaida>;
    function RegistroC430(data: TDateTime; grupo: Integer; codigo: string): TObjectList<TRestCompSaida>;
    function RegistroC480(nserie: string; num_nf, id, grupo: Integer; codigo: string): TObjectList<TRestCompSaida>;
    function RegistroH030(grupo: Integer; codigo: string): TObjectList<TH030>;
    function CriarArquivosCSV: TStrings;
    function SalvarApuracao(values: TEfd_icmsst_cr_apuracoes_class): Boolean;
    function ExistsC180C181(id, itemid: Integer): Boolean;

    //property DataIni: TDateTime read FDataIni write FDataIni;
    //property DataFim: TDateTime read FDataFim write FDataFim;
    property DataInv: TDateTime read FDataInv write FDataInv;
    property Estoque: TConexao_OOP read FEstoque write FEstoque;
    property RegSaida: TObjectList<TRestCompSaida> read FRegSaida write FRegSaida;
    property Gerar: Boolean read FGerar write FGerar;
    property UsarJaGravado: Boolean read FUsarJaGravado write FUsarJaGravado;
  end;

  TSpedFiscal = class(TSpedHw)
  strict private
    qryLvl3: TQuery_OOP;
    Registro0221_ProdutosC190: Boolean;
    procedure VerificarConfs;
    procedure Build0221;
    procedure HandleC120OnWrite(var ALinha: String);
  private
    //Componentes de Conexao do Banco
    //Valores Bloco E
    FVL_TOT_DEBITOS, FVL_AJ_DEBITOS, FVL_TOT_CREDITOS, FVL_AJ_CREDITOS, FVL_TOT_DED: Currency;
    F0300: TStringList;
    F0460: TStringList;
    FVL_DEVOL_ST: array[1..27] of Currency;
    //    FVL_RESSARC_ST: array[1..27] of Currency;
    FVL_OUT_CRED_ST: array[1..27] of Currency;
    FVL_AJ_CREDITOS_ST: array[1..27] of Currency;
    FVL_RETENCAO_ST: array[1..27] of Currency;
    FVL_AJ_DEBITOS_ST: array[1..27] of Currency;
    FDEB_ESP_ST: array[1..27] of Currency;
    FSigla: array[1..27] of string;
    FE510List: TObjectList;
    fApurarST, fApurarIPI: Boolean;
    fApurarSTAnt, fStIpiEmMerc: Boolean;
    fefd_icms_desconsiderar_insc_st_apuracao: Boolean;
    ListCodAJ_E220_ST_Recolhido: TStrings;
    fDiaVencICMS: Smallint;
    fCOD_OR_E116, fCOD_REC_E116, fCOD_OR_E250, fCOD_REC_E250: string;
    fUFIBGE: string;
    fApurarStIpiEmOutDesp: string;
    fH005GerarMotivo01: Boolean;
    FCodContador: Integer;
    FIndexUFEmpresa: Integer;
    Fefd_icms_d100_campo_vl_nt_zerado: Boolean;
    Fefd_icms_k: RConf_Bloco_K;
    FdataEmissaoIgualDataEntrada: Boolean;
    FGerarRestComplST: Boolean;
    FRestComplST: TRestComplST;
    ConfUnif: RConf_Escrituracao;

    function getUFParticipante(codigo: string): string;
    function getSiglaUFParticipante(codigo: string): string;
    procedure verificaFormasPagS(numNf: integer; dataNF, serieNF: string);
    procedure somaFVL_DEVOL_ST(cod_part: string; pVL_DEVOL_ST: Currency);
    procedure somaFVL_OUT_CRED_ST(cod_part: string; pVL_OUT_CRED_ST: Currency);
    procedure somaFVL_AJ_CREDITOS_ST(UF: string; pVL_AJ_CREDITOS_ST: Currency);
    procedure somaFVL_RETENCAO_ST(cod_part: string; pVL_RETENCAO_ST: Currency);
    procedure somaFVL_AJ_DEBITOS_ST(UF: string; pVL_AJ_DEBITOS_ST: Currency);
    procedure somaFDEB_ESP_ST(UF: string; pDEB_ESP_ST: Currency);
    procedure setSTEstado(cod_part: string);
    procedure montaRegistro0300(pCOD_IND_BEM: string);
    procedure montaRegistro0460(pCOD_OBS: integer; pTXT: string);
    procedure montarBloco0;
    procedure montarBlocoC;
    procedure montarBlocoD;
    procedure montarBlocoE;
    procedure montarBlocoG;
    procedure montarBlocoH;
    procedure montarBlocoK;
    procedure montarBloco1;
  protected
    procedure montaRegistro0200; override;
  public
    procedure abreFormSpedFiscal(codEmpresa, EndBanco: string);
    procedure verificarConfiguracoes;
    constructor create;
    destructor Destroy; override;

    procedure teste;

    function iniciaSpedFiscal: Boolean;

    property efd_icms_k: RConf_Bloco_K read Fefd_icms_k write Fefd_icms_k;
    property RestComplST: TRestComplST read FRestComplST write FRestComplST;
    property GerarRestComplST: Boolean read FGerarRestComplST write FGerarRestComplST;
  end;

implementation

uses
  Forms, SysUtils, ACBrEFDBloco_0, ACBrEFDBlocos, DB, ACBrEFDBloco_C,
  ACBRSpedFiscalUtilHw, Controls, ACBrEFDBloco_C_Class, ACBrEFDBloco_D,
  ACBrEFDBloco_E, DateUtils, ACBrEFDBloco_H, ACBrEFDBloco_G, ACBrEFDBloco_1,
  uFormSpedFiscal, ACBrEFDBloco_0_Class, IBX.IBScript, uDiferencaE310entreE316,
  Windows, StrUtils, Math, ACBrEFDBloco_K, hw_utils, config_sistema_class,
  uSpedHwClasses, hw_audit_utils, hw_strings, hw_subapuracao_conf;

function nfe_atualizar_valores_xml(codigos_nf: array of Integer; cod_empresa: Longint; dbName: WideString; var Aerros: WideString): Integer; stdcall; external 'hw.nfe.dx.dll';

{ TSpedFiscal }

procedure TSpedFiscal.abreFormSpedFiscal(codEmpresa, EndBanco: string);
begin
  Application.CreateForm(TfrmSpedFiscal, frmSpedFiscal);
  try
    frmSpedFiscal.vCodEmpresa := codEmpresa;
    frmSpedFiscal.vEndBanco := EndBanco;
    frmSpedFiscal.ShowModal;
  finally
    frmSpedFiscal.Free;
    frmSpedFiscal := nil;
  end;
end;

procedure TSpedFiscal.Build0221;
var
  prod: TReg0200;
  codComerc: TReg0221;
  sSql: string;
begin
   // REGISTRO 0221 - CORRELAÇÃO ENTRE CÓDIGOS DE ITENS COMERCIALIZADOS

  if (not FRegistro0221) or (not Registro0221_ProdutosC190) then
    Exit;

  FLabelStatus.Caption := 'Montando registro 0190, 0200 e 221 - Produtos';

  prod := nil;
  var queryOOP := QueryHelper.CreateObj(vQrAux1);
  try
    sSql := queryOOP.Close
      .Table('nfce', 'distinct ni.grupo_prod, ni.cod_prod, si.tipo')
      .Join('nfce_item ni', 'ni.cod_nfce = nfce.cod_nfce and ni.cod_empresa = nfce.cod_empresa and ni.tipo_item = ''P''')
      .Join('produtos p', 'p.grupo_prod = ni.grupo_prod and p.cod_prod = ni.cod_prod and p.cod_empresa = ni.cod_empresa')
      .Join('indice_tecnico idt', 'idt.grupo_prod_acabado = p.grupo_prod and idt.cod_prod_acabado = p.cod_prod and idt.cod_empresa = p.cod_empresa')
      .Join('sped_item si', 'si.grupo_prod = p.grupo_prod and si.cod_prod = p.cod_prod and si.cod_empresa = p.cod_empresa and si.tipo = ''P''', TSqlJoin.sqLeft)
      .Equals('nfce.cod_empresa', StrToInt(FCodEmpresa))
      .Between('nfce.data_lanc'  , StrToDateTime(FDataIni), StrToDateTime(FDataFim))
      .InCond('nfce.situacao_nfce', '''Autorizada'', ''Cancelada''')
      .Equals('nfce.ativo', 1)
      .Conditional('si.tipo', 'is', 'null', False)
      .query.SQL.Text +

      ' union distinct ' +

      queryOOP
      .Table('notafiscal nf', 'distinct nfi.grupo_prod, nfi.cod_prod, si.tipo')
      .Join('notafiscal_item nfi', 'nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa and nfi.tipo_item = ''P''')
      .Join('produtos p', 'p.grupo_prod = nfi.grupo_prod and p.cod_prod = nfi.cod_prod and p.cod_empresa = nfi.cod_empresa')
      .Join('indice_tecnico idt', 'idt.grupo_prod_acabado = p.grupo_prod and idt.cod_prod_acabado = p.cod_prod and idt.cod_empresa = p.cod_empresa')
      .Join('sped_item si', 'si.grupo_prod = p.grupo_prod and si.cod_prod = p.cod_prod and si.cod_empresa = p.cod_empresa and si.tipo = ''P''', TSqlJoin.sqLeft)
      .Equals('nf.cod_empresa', StrToInt(FCodEmpresa))
      .Between('nf.data_lanc'  , StrToDateTime(FDataIni), StrToDateTime(FDataFim))
      .Equals('nf.status', 'Fechada')
      .InCond('nf.modelo_nf', '''1'',''01'',''1A'',''1-A'',''4'',''04'',''55''')
      .Equals('iif(nf.modelo_nf = ''55'', nf.situacao_nfe, ''Autorizada'')', 'Autorizada')
      .Conditional('coalesce(nf.da, '''')', '<>', 'S')
      .Conditional('si.tipo', 'is', 'null', False)
      .query.SQL.Text;

    queryOOP.SQL(sSql)
      .Open()
      .First();
    while not queryOOP.Eof do
    begin
      AddProdCodigos0221(queryOOP.fint('grupo_prod'), queryOOP.fstr('cod_prod'));

      queryOOP.Next;
    end;


  finally
    queryOOP.Free;
  end;

end;

constructor TSpedFiscal.create;
begin
  FSpedF := TACBrSPEDFiscal.Create(Application);
  FSpedF.TrimString := True;
  FSpedF.CurMascara := '#0.00';
  FSpedF.Delimitador := '|';

  FSpedF.EventsBloco_C.OnWriteRegistroC120 := HandleC120OnWrite;

  FParticipantes := TStringList.Create;
  F0190 := TStringList.Create;
  F0300 := TStringList.Create;
  F0400 := TStringList.Create;
  F0450 := TStringList.Create;
  F0460 := TStringList.Create;
  FC400 := TStringList.Create;
  FE510List := TRegistroE510List.Create;

  vConexao := TIBDatabase.Create(Application);
  vTransacao := TIBTransaction.Create(Application);
  vTransacaoAux := TIBTransaction.Create(Application);

  vTransacao.DefaultDatabase := vConexao;
  vTransacaoAux.DefaultDatabase := vConexao;

  vTransacao.Params.Add('read_committed');
  vTransacao.Params.Add('rec_version');
  vTransacao.Params.Add('nowait');
  vTransacaoAux.Params.Add('read_committed');
  vTransacaoAux.Params.Add('rec_version');
  vTransacaoAux.Params.Add('nowait');

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
  qryLvl3 := QueryHelper.CreateObj(vNivel3, '');

  SpedFiscalOuPisCofins := 'F';
  Fefd_icms_d100_campo_vl_nt_zerado := False;

  FRestComplST := TRestComplST.Create(Self);
  Produtos := TSpedHwProd.Create;
end;

destructor TSpedFiscal.Destroy;
begin
  //  vNivel0.Close; vNivel1.Close; vNivel2.Close; vNivel3.Close; vNivel4.Close;
  //  vNivel5.Close; vNivel6.Close;
  FSpedF.Free;
  FParticipantes.Free;

  F0190.Free;
  F0300.Free;
  F0400.Free;
  F0450.Free;
  F0460.Free;
  FC400.Free;
  FE510List.Free;

  vNivel0.Free;
  vNivel2.Free;
  vNivel3.Free;
  vNivel4.Free;
  vNivel5.Free;
  vNivel6.Free;
  vTransacao.Free;
  vTransacaoAux.Free;
  vConexao.Free;
  vQrAux.Free;
  vQrAux1.Free;

  vNivel0 := nil;
  vNivel2 := nil;
  vNivel3 := nil;
  vNivel4 := nil;
  vNivel5 := nil;
  vNivel6 := nil;
  vTransacao := nil;
  vTransacaoAux := nil;
  vConexao := nil;
  vQrAux := nil;
  vQrAux1 := nil;
//  if Assigned(FE510List) then
//    FreeAndNil(FE510List);
  FRestComplST.Free;
//  Produtos.Free;
  qryLvl3.Free;

  inherited;
end;

function TSpedFiscal.getSiglaUFParticipante(codigo: string): string;
var
  I: Integer;
begin
  for I := 0 to FParticipantes.Count - 1 do
    if copy(FParticipantes[I], 1, pos('|', FParticipantes[I]) - 1) = codigo then
    begin
      Result := getCampoPipe(FParticipantes[i],3);
      Exit;
    end;
  Result := '';
end;

function TSpedFiscal.getUFParticipante(codigo: string): string;
var
  I: Integer;
begin
  for I := 0 to FParticipantes.Count - 1 do
    if copy(FParticipantes[I], 1, pos('|', FParticipantes[I]) - 1) = codigo then
    begin        
      Result := getCampoPipe(FParticipantes[i],2);
//      Result := copy(Trim(copy(FParticipantes[i], pos('|', FParticipantes[i]) + 1,
//        length(FParticipantes[i]))), 1, 2);
      Exit;
    end;
  Result := '';
end;

procedure TSpedFiscal.HandleC120OnWrite(var ALinha: String);
begin

  if ALinha.IsEmpty then
    Exit;

  var lns := NewStringList(ALinha.Substring(1), '|');

  if lns.Count = 5 then
    lns.Add('')
  else if lns.Count <> 6 then
    Exit;

  if not (lns[3].Equals('0,00') and lns[4].Equals('0,00')) then
    Exit;

  lns[3] := '';
  lns[4] := '';

  ALinha := '|' + String.Join('|', lns.ToStringArray());
end;

function TSpedFiscal.iniciaSpedFiscal: Boolean;
var
  I: Integer;
begin

  try

    if not conectarBanco then
      exit;

    FStop := False;
    FParticipantes.Clear;
    F0190.Clear;
    F0300.Clear;
    F0400.Clear;
    F0450.Clear;
    F0460.Clear;
    FC400.Clear;
    FE510List.Clear;
    for I := 1 to 27 do begin
      FVL_DEVOL_ST[i] := 0;
      FVL_OUT_CRED_ST[i] := 0;
      //    FVL_RESSARC_ST[i] := 0;
      FVL_AJ_CREDITOS_ST[i] := 0;
      FVL_RETENCAO_ST[i] := 0;
      FVL_AJ_DEBITOS_ST[i] := 0;
      FDEB_ESP_ST[i] := 0;
      FSigla[i] := '';
    end;

    fH005GerarMotivo01 := False;
    if vBlocoH then
  //    if Copy(FDataIni, 4, 2) = '02' then
  //      fH005GerarMotivo01 := True
  //    else
        fH005GerarMotivo01 := Application.MessageBox('Deseja registro de inventário para motivo 01: "No final do periodo"?',
          'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;

    FSpedF.Path := ExtractFilePath(FDestino);
    FSpedF.Arquivo := ExtractFileName(FDestino);
    FSpedF.TrimString := True;

    FLabelBloco.Caption := 'Bloco 0';
    FLabelStatus.Caption := 'Iniciando';
    apagarSpedItem;
    if vBloco0 then
      montarBloco0;
    FLabelBloco.Caption := 'Bloco C';
    FLabelStatus.Caption := 'Iniciando';
    if vBlocoC then
      montarBlocoC;
    if FStop then Exit;

    FLabelBloco.Caption := 'Bloco D';
    FLabelStatus.Caption := 'Iniciando';
    if vBlocoD then
      montarBlocoD;
    FLabelBloco.Caption := 'Bloco E';
    FLabelStatus.Caption := 'Iniciando';
    if vBlocoE then
      montarBlocoE;
    FLabelBloco.Caption := 'Bloco G';
    FLabelStatus.Caption := 'Iniciando';
    if vBlocoG then
      montarBlocoG;
    FLabelBloco.Caption := 'Bloco H';
    FLabelStatus.Caption := 'Iniciando';
    if vBlocoH or RestComplST.Gerar then
      montarBlocoH;
    FLabelBloco.Caption := 'Bloco K';
    FLabelStatus.Caption := 'Iniciando';
    if vBlocoK then
      montarBlocoK;
    FLabelBloco.Caption := 'Bloco 1';
    FLabelStatus.Caption := 'Iniciando';
    if vBloco1 then
      montarBloco1;

    FLabelStatus.Caption := 'Finalizando';

  //  montaRegistro0190e0200;
    montaRegistro0200;

    FSpedF.DT_INI := StrToDate(DataIni);
    FSpedF.DT_FIN := StrToDate(DataFim);
    FSpedF.LinhasBuffer := 1000;

    if Fefd_icms_k.Ativo and (Fefd_icms_k.Producao or Fefd_icms_k.Estoque) then
      if FSpedF.Bloco_0.Registro0001.Registro0200.Count > 0 then
        if FSpedF.Bloco_K.RegistroK001.RegistroK100.Count > 0 then with FSpedF.Bloco_K.RegistroK001.RegistroK100.Items[0] do
          if RegistroK200.Count = 0 then
          begin
            Application.MessageBox('Registro de Estoque não encontrado. Favor gerar o inventário para o dia desejado', 'Atenção');
            if not vDadosIniSPED.PesqPros('EFD016', 'VALIDAR', Format('EFD DE %s A %s: DT EST: %s',
                                                                      [DataIni, DataFim, DateToStr(Fefd_icms_k.dataEstoque)]),
                                          'SPED_FISCAL', '', vQrAux, True) then
              Exit;
          end;

    FSpedF.SaveFileTXT;

    gravaCreditoDoPeriodo;

    FLabelCupons.Caption := '';

    FLabelStatus.Caption := 'Finalizado';

    //Application.MessageBox(pchar('Arquivo gerado com sucesso: ' + sLineBreak + Destino),'Atenção',0+64);

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      RestComplST.registraErro('TSpedFiscal.iniciaSpedFiscal ' + E.Message);

      ShowErro('Erro ao gerar arquivo ' + sLineBreak + e.Message);
    end;
  end;
end;

procedure TSpedFiscal.montarBloco0;
var
  vScriptTemp : TIBScript;
  Alist: TStrings;
  I: Integer;
begin
  vNivel0.Close;
  vNivel0.SQL.Text := 'select SPED_APURAR_ST, SPED_F_DIA_VENC_ICMS, ' +
    ' SPED_F_COD_REC_E116, SPED_F_COD_REC_E250, SPED_F_COD_OB_REC_E116,' +
    ' SPED_F_COD_OB_REC_E250, SPED_STIPI_OUTD from empresa where cod_empresa = ' + FCodEmpresa;
  try
    vNivel0.Open;
  except
    try
      vScriptTemp := TIBScript.Create(Application);
      vScriptTemp.Database := vConexao;
      vScriptTemp.Transaction := vTransacao;

//      vScriptTemp.Script.Text :=
      Alist := TStringList.Create;
      Alist.Text :=
        'ALTER TABLE EMPRESA ADD SPED_APURAR_ST CHAR(1);' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_DIA_VENC_ICMS SMALLINT;' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_COD_REC_E116 VARCHAR(64);' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_COD_REC_E250 VARCHAR(64);' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_COD_OB_REC_E116 VARCHAR(3);' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_STIPI_OUTD CHAR(1);' + #13 +
        'UPDATE EMPRESA SET SPED_STIPI_OUTD = SPED_F_APURAR_STIPI_OUT_DESP WHERE SPED_STIPI_OUTD IS NULL;' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_COD_OB_REC_E250 VARCHAR(3);';

      for I := 0 to Alist.Count - 1 do
        try
          vScriptTemp.Script.Text := Alist[I];
          vScriptTemp.ExecuteScript;
        except
        end;
      if vScriptTemp.Transaction.InTransaction then
        vScriptTemp.Transaction.Commit;
    finally
      vScriptTemp.Free;
      vScriptTemp := nil;
    end;
  end;

  
  vNivel0.Close;
  vNivel0.SQL.Text := 'select first 1 seqid from PRODUTOS_ALTERACOES' +
    ' where seqid = 0 and cod_empresa = 0';
  try
    vNivel0.Open;
  except
    try
      vScriptTemp := TIBScript.Create(Application);
      vScriptTemp.Database := vConexao;
      vScriptTemp.Transaction := vTransacao;

      Alist := TStringList.Create;
      Alist.Clear;
      Alist.Add('CREATE TABLE PRODUTOS_ALTERACOES ( SEQID INTEGER NOT NULL, COD_EMPRESA INTEGER NOT NULL);');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD GRUPO_PROD  INTEGER NOT NULL;');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD COD_PROD CHAR(6) NOT NULL;');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD TIPO_ALT CHAR(1);');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD VALOR_ANTERIOR VARCHAR(32);');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DATA_ALTERACAO TIMESTAMP;');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DATA_HORA_WS TIMESTAMP;');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD MOV_SPED CHAR(7);');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DATA_INI TIMESTAMP;');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DESCR_PROD_ANTERIOR VARCHAR(75);');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DATA_HORA_ALT_WS TIMESTAMP;');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD CONSTRAINT PK_PRODUTOS_ALTERACOES PRIMARY KEY (SEQID, COD_EMPRESA);');
      Alist.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD CONSTRAINT FK_PRODUTOS_ALTERACOES_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;');

      for I := 0 to Alist.Count - 1 do
        try
          vScriptTemp.Script.Text := Alist[I];
          vScriptTemp.ExecuteScript;
        except
        end;
      if vScriptTemp.Transaction.InTransaction then
        vScriptTemp.Transaction.Commit;
    finally
      vScriptTemp.Free;
    end;
  end;
  
  vNivel0.Close;
  vNivel0.SQL.Text := 'select first 1 cod_contador from P_CONTAS_CONTABIL' +
    ' where cod_cta = ''.'' and cod_empresa = 0';
  try
    vNivel0.Open;
  except
    try
      vScriptTemp := TIBScript.Create(Application);
      vScriptTemp.Database := vConexao;
      vScriptTemp.Transaction := vTransacao;

      Alist := TStringList.Create;
      Alist.Text :=
        'ALTER TABLE P_CONTAS_CONTABIL ADD COD_CONTADOR INTEGER';

      for I := 0 to Alist.Count - 1 do
        try
          vScriptTemp.Script.Text := Alist[I];
          vScriptTemp.ExecuteScript;
        except
        end;
      if vScriptTemp.Transaction.InTransaction then
        vScriptTemp.Transaction.Commit;
    finally
      vScriptTemp.Free;
      vScriptTemp := nil;
    end;
  end;

  vNivel0.Close;
  vNivel0.SQL.Text := 'select em.nome_emp NOME, em.cgc_emp CNPJ, es.sigla_uf UF, em.ie_emp IE,' +
    ' em.ibge_cod_cidade COD_MUN, em.im_emp IM, em.sped_suframa SUFRAMA,' +
    ' em.sped_ind_perfil IND_PERFIL, em.sped_ind_ativ IND_ATIV,' +
    ' em.fantasia_emp fantasia, em.cep_emp CEP, em.endreco_emp "END",' +
    ' em.numero_end NUM, complemento_emp COMPL, em.bairro_emp BAIRRO,' +
    ' em.telefone_emp FONE,'''' FAX, em.email_emp email, em.cod_contador,' +
    ' em.pis_emp, em.cofins_emp, em.regime, em.sped_apurar_st, em.contribuinte_ipi,' +
    ' em.sped_f_dia_venc_icms, em.sped_f_cod_rec_e116, em.sped_f_cod_rec_e250,' +
    ' em.sped_f_cod_ob_rec_e116, sped_f_cod_ob_rec_e250, SPED_STIPI_OUTD' +
    ' from empresa em' +
    ' inner join estados es on es.codigo_uf = em.uf_emp' +
    ' where em.cod_empresa = :cod_empresa';
  vNivel0.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel0.Open;

  if vNivel0.IsEmpty then
  begin
    //Tratar arqui mensagem ou log
  end
  else
  begin
    FRegime := Trim(vNivel0.FieldByName('regime').AsString);
    FAliqPIS := vNivel0.FieldByName('pis_emp').AsCurrency;
    FAliqCOFINS := vNivel0.FieldByName('cofins_emp').AsCurrency;
    fApurarST := vNivel0.FieldByName('sped_apurar_st').AsString = 'S';
    fApurarIPI := vNivel0.FieldByName('contribuinte_ipi').AsString = 'S';
    fDiaVencICMS := vNivel0.FieldByName('sped_f_dia_venc_icms').AsInteger;
    fCOD_REC_E116 := vNivel0.FieldByName('sped_f_cod_rec_e116').AsString;
    fCOD_REC_E250 := vNivel0.FieldByName('sped_f_cod_rec_e250').AsString;
    fCOD_OR_E116 := vNivel0.FieldByName('sped_f_cod_ob_rec_e116').AsString;
    fCOD_OR_E250 := vNivel0.FieldByName('sped_f_cod_ob_rec_e250').AsString;
    fApurarStIpiEmOutDesp := vNivel0.FieldByName('SPED_STIPI_OUTD').AsString;

    verificarConfiguracoes;
    vNivel0.Open;

    with TCfg_sis.getConf('efd_icms_escrituracao', vQrAux, StrToInt(FCodEmpresa)) do
    begin
      ConfUnif.Ativo := AsBoolean;
      case ReadInteger('ICMSST', 'EmissaoPropria') of
        1:   ConfUnif.ConfST.EmissaoPropria := csCamposProprios;
        2:   ConfUnif.ConfST.EmissaoPropria := csCampoOutros;
        else ConfUnif.ConfST.EmissaoPropria := csCampoVlMerc;
      end;
      case ReadInteger('ICMSST', 'EmissaoTerceiro') of
        1:   ConfUnif.ConfST.EmissaoTerceiro := csCamposProprios;
        2:   ConfUnif.ConfST.EmissaoTerceiro := csCampoOutros;
        else ConfUnif.ConfST.EmissaoTerceiro := csCampoVlMerc;
      end;
      ConfUnif.ConfST.AntecipacaoST := ReadString('ICMSST', 'AntecipacaoST') = 'S';

      case ReadInteger('IPI', 'EmissaoPropria') of
        1:   ConfUnif.ConfIPI.EmissaoPropria := csCamposProprios;
        2:   ConfUnif.ConfIPI.EmissaoPropria := csCampoOutros;
        else ConfUnif.ConfIPI.EmissaoPropria := csCampoVlMerc;
      end;
      case ReadInteger('IPI', 'EmissaoTerceiro') of
        1:   ConfUnif.ConfIPI.EmissaoTerceiro := csCamposProprios;
        2:   ConfUnif.ConfIPI.EmissaoTerceiro := csCampoOutros;
        else ConfUnif.ConfIPI.EmissaoTerceiro := csCampoVlMerc;
      end;

      ConfUnif.ConfIPI.CFOPsDeCamposProprios := [];

      var sCFOPs := ReadString('IPI', 'CFOPs_CamposProprios', '').Split([',']);
      for var S in sCFOPs do
        if TryStrToInt(S, I) then
          ConfUnif.ConfIPI.CFOPsDeCamposProprios := ConfUnif.ConfIPI.CFOPsDeCamposProprios + [ I ];

      ConfUnif.ConfICMSSN.FormaAjuste := ReadString('ICMSSN', 'FormaAjuste').Trim;
      ConfUnif.ConfICMSSN.CodigoAjuste := ReadString('ICMSSN', 'CodigoAjuste').Trim;
      ConfUnif.ConfInventario.RegistroH020_MultiplicarPelaQtde := ReadString('Inventario', 'RegistroH020_MultiplicarPelaQtde', 'S').Trim.Equals('S');
    end;

    fefd_icms_desconsiderar_insc_st_apuracao := getConfSisBool('efd_icms_desconsiderar_insc_st_apuracao', vQrAux);
    ListCodAJ_E220_ST_Recolhido := TStringList.Create;
    ListCodAJ_E220_ST_Recolhido := getConfSisBlob('efd_icms_e220_cod_ajuste_st_recolhida', vQrAux);
    fApurarSTAnt := getConfSisBool('efd_icms_e200_apurar_st_antcipacao', vQrAux);
    fStIpiEmMerc  := getConfSisBool('efd_icms_valor_st_ipi_em_vlmerc', vQrAux);
    Fefd_icms_d100_campo_vl_nt_zerado := getConfSisBool('efd_icms_d100_campo_vl_nt_zerado', vQrAux);

    with TConfig_sistema_class.getConf('efd_icms_registro0221', vQrAux, StrToInt(CodEmpresa)) do
    begin
      FRegistro0221 :=  ReadString('Conf', 'ListaUFs', '').ToUpper.Contains( vNivel0.FieldByName('UF').AsString.ToUpper.Trim);
      Registro0221_ProdutosC190 :=  ReadString('Conf', 'RegistrarQuandoPresenteNoC190', '').ToUpper.Equals('S');
      Free;
    end;

    Alist                    := TStringList.Create;
    try
      Alist                  := getConfSisBlob('efd_icms_k', vQrAux);
      Fefd_icms_k.Ativo      := GetIni('Conf', 'Ativo'     , 'N', Alist) = 'S';
      Fefd_icms_k.Producao   := GetIni('Conf', 'Producao'  , 'N', Alist) = 'S';
      Fefd_icms_k.Estoque    := GetIni('Conf', 'Estoque'   , 'N', Alist) = 'S';
      Fefd_icms_k.Dados_0210 := GetIni('Conf', 'Dados_0210', 'N', Alist);
    finally
      FreeAndNil(Alist);
    end;

    FdataEmissaoIgualDataEntrada := GetIni('Conf', 'DataEmissaoIgualDataEntrada', 'N',
                                           getConfSisBlob('efd_icms_data_emiss', vQrAux)) = 'S';
  end;

  with FSpedF.Bloco_0.Registro0000New do
  begin
    if StrToDate(DataIni) >= StrToDate('01/01/2026') then
      COD_VER := vlVersao119
    else if StrToDate(DataIni) >= StrToDate('01/01/2025') then
      COD_VER := vlVersao118
    else if StrToDate(DataIni) >= StrToDate('01/01/2024') then
      COD_VER := vlVersao117
    else if StrToDate(DataIni) >= StrToDate('01/01/2023') then
      COD_VER := vlVersao116
    else if StrToDate(DataIni) >= StrToDate('01/01/2022') then
      COD_VER := vlVersao115
    else if StrToDate(DataIni) >= StrToDate('01/01/2021') then
      COD_VER := vlVersao114
    else if StrToDate(DataIni) >= StrToDate('01/01/2020') then
      COD_VER := vlVersao113
    else if StrToDate(DataIni) >= StrToDate('01/01/2019') then
      COD_VER := vlVersao112
    else if StrToDate(DataIni) >= StrToDate('01/01/2018') then
      COD_VER := vlVersao111
    else if StrToDate(DataIni) >= StrToDate('01/01/2017') then
      COD_VER := vlVersao110
    else if StrToDate(DataIni) >= StrToDate('01/01/2016') then
      COD_VER := vlVersao109
    else if StrToDate(DataIni) >= StrToDate('01/01/2015') then
      COD_VER := vlVersao108
    else if StrToDate(DataIni) >= StrToDate('01/01/2014') then
      COD_VER := vlVersao107
    else if StrToDate(DataIni) >= StrToDate('01/01/2013') then
      COD_VER := vlVersao106
    else if StrToDate(DataIni) >= StrToDate('01/07/2012') then
      COD_VER := vlVersao105
    else if StrToDate(DataIni) >= StrToDate('01/01/2012') then
      COD_VER := vlVersao104
    else if StrToDate(DataIni) >= StrToDate('01/01/2011') then
      COD_VER := vlVersao103
    else
      COD_VER := vlVersao102;

    if FFinalidade = 'Substituto' then
      COD_FIN := raSubstituto
    else
      COD_FIN := raOriginal;
    DT_INI := StrToDate(DataIni);
    DT_FIN := StrToDate(DataFim);
    NOME := Trim(vNivel0.FieldByName('NOME').AsString);
    CNPJ := Trim(vNivel0.FieldByName('CNPJ').AsString);
    FCnpjEmpresa := CNPJ;
    CPF := '';
    UF := vNivel0.FieldByName('UF').AsString;
    FIndexUFEmpresa := -1;
    for I := 1 to 27 do
      if UF = Sigla[I] then
        FIndexUFEmpresa := I;
    IE := vNivel0.FieldByName('IE').AsString;
    if vNivel0.FieldByName('COD_MUN').AsString <> '' then
      COD_MUN := vNivel0.FieldByName('COD_MUN').AsInteger;
    fUFIBGE := Copy(vNivel0.FieldByName('COD_MUN').AsString,1,2);
    IM := Trim(vNivel0.FieldByName('IM').AsString);
    SUFRAMA := Trim(vNivel0.FieldByName('SUFRAMA').AsString);
    if vNivel0.FieldByName('IND_PERFIL').AsString = 'A' then
      IND_PERFIL := pfPerfilA
    else if vNivel0.FieldByName('IND_PERFIL').AsString = 'B' then
      IND_PERFIL := pfPerfilB
    else
      IND_PERFIL := pfPerfilC;
    if vNivel0.FieldByName('IND_ATIV').AsString = '0' then
      IND_ATIV := atIndustrial
    else
      IND_ATIV := atOutros;
  end;

  with FSpedF.Bloco_0.Registro0001New do
  begin
    IND_MOV := imComDados;
  end;

  with FSpedF.Bloco_0.Registro0005New do
  begin
    FANTASIA := Trim(vNivel0.FieldByName('FANTASIA').AsString);
    CEP := Trim(vNivel0.FieldByName('CEP').AsString);
    ENDERECO := Trim(vNivel0.FieldByName('END').AsString);
    NUM := Copy(Trim(vNivel0.FieldByName('NUM').AsString),1,10);
    COMPL := Trim(vNivel0.FieldByName('COMPL').AsString);
    BAIRRO := Trim(vNivel0.FieldByName('BAIRRO').AsString);
    FONE := vNivel0.FieldByName('FONE').AsString;
    FONE := StringReplace( FONE, '(', '', [rfReplaceAll]);
    FONE := StringReplace( FONE, ')', '', [rfReplaceAll]);
    FONE := StringReplace( FONE, '-', '', [rfReplaceAll]);
    FONE := StringReplace( FONE, ' ', '', [rfReplaceAll]);
    FAX := vNivel0.FieldByName('FAX').AsString;
    EMAIL := Trim(vNivel0.FieldByName('EMAIL').AsString);
  end;

  vNivel2.Close;
  vNivel2.SQL.Text := 'select esb.sigla_uf uf_st, esb.inscricao ie_st from empresa_substituto esb' +
    ' where esb.cod_empresa = :cod_empresa';
  vNivel2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.Open;

  while not vNivel2.Eof do
  begin
    with FSpedF.Bloco_0.Registro0015New do
    begin
      UF_ST := vNivel2.FieldByName('UF_ST').AsString;
      IE_ST := vNivel2.FieldByName('IE_ST').AsString;
    end;
    vNivel2.Next;
  end;

  vNivel2.Close;
  vNivel2.SQL.Text :=
    'select ct.nome_cont NOME, ct.cpfcnpj_cont CPF, ct.crc, ct.cnpj_escritorio CNPJ,' +
    ' ct.cep_cont CEP, ct.endereco_cont "END", ct.numero NUM, ct.complemento COMPL,' +
    ' ct.bairro_cont BAIRRO, ct.fone_cont FONE, ct.fax_cont FAX, ct.email_cont EMAIL,' +
    ' cd.ibge_cod_cidade COD_MUN, ct.cod_contador' +
    ' from contador ct' +
    ' inner join empresa em on em.cod_empresa = ct.cod_empresa and em.cod_contador =' +
    ' ct.cod_contador' +
    ' left join cidades cd on cd.cod_cidade = ct.cod_cidade' +
    ' where ct.cod_empresa = :cod_empresa AND CT.cod_contador = :cod_contador';
  vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.ParamByName('cod_contador').AsInteger := vNivel0.FieldByName('cod_contador').AsInteger;
  vNivel2.Open;

  if vNivel2.IsEmpty then
  begin
    //Tratar aqui
  end;

  FCodContador := vNivel2.FieldByName('cod_contador').AsInteger;

  while not vNivel2.Eof do
  begin
    with FSpedF.Bloco_0.Registro0100New do
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
    vNivel2.Next;
  end;

  FLabelStatus.Caption := 'Montando registro 0500 - Plano de Contas Contábil';
  vNivel2.Close;
  vNivel2.SQL.Text :=
    'select pc.dt_alt,  pc.cod_nat_cc, pc.ind_cta, pc.nivel, pc.cod_cta, pc.nome_cta' +
    ' from p_contas_contabil pc where pc.cod_empresa = :cod_empresa' +
    ' and pc.cod_contador = ' + IntToStr(FCodContador);
  vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.Open;

  vNivel2.FetchAll;

  FProgressBar.Position := 0;
  FProgressBar.Min := 0;
  FProgressBar.Max := vNivel2.RecordCount;

  vNivel2.First;
  while not vNivel2.Eof do
  begin
    Application.ProcessMessages;
    with FSpedF.Bloco_0.Registro0500New do
    begin
      if vNivel2.FieldByName('DT_ALT').AsDateTime > StrToDate(FDataIni) then
        DT_ALT := StrToDate(FDataIni)
      else
        DT_ALT := vNivel2.FieldByName('DT_ALT').AsDateTime;
      COD_NAT_CC := Trim(vNivel2.FieldByName('COD_NAT_CC').AsString);
      IND_CTA := Trim(vNivel2.FieldByName('IND_CTA').AsString);
      NIVEL := Trim(vNivel2.FieldByName('NIVEL').AsString);
      COD_CTA := Trim(vNivel2.FieldByName('COD_CTA').AsString);
      NOME_CTA := Trim(vNivel2.FieldByName('NOME_CTA').AsString);
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

  FProgressBar.Position := 0;
  FProgressBar.Min := 0;
  FProgressBar.Max := vNivel2.RecordCount;

  vNivel2.First;
  while not vNivel2.Eof do
  begin
    Application.ProcessMessages;
    with FSpedF.Bloco_0.Registro0600New do
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

  //Registro 0460 deve ser gerado assim que o registro C190 for informado.
  //Registro C195 sao dados complementares do registro 0460, portanto deve
  //ser gerado caso nao suporte todo o texto no 0460

  FVL_TOT_DEBITOS := 0;
  FVL_AJ_DEBITOS := 0;
  FVL_TOT_CREDITOS := 0;
  FVL_AJ_CREDITOS := 0;
  FVL_TOT_DED := 0;

end;

procedure TSpedFiscal.montarBloco1;
const
  indicesApur: array[1..6] of string = ('3','4','5','6','7','8');

  function Get1255(codmotivo: string): TRegistro1255;
  var
    i1255: Integer;
  begin
    Result := nil;
    if FSpedF.Bloco_1.Registro1001.Registro1250.Count = 0 then
    begin
      FSpedF.Bloco_1.Registro1001.IND_MOV := imComDados;
      FSpedF.Bloco_1.Registro1250New;
      Result := FSpedF.Bloco_1.Registro1255New;
      Result.COD_MOT_REST_COMPL := codmotivo;
      Exit;
    end;

    for i1255 := 0 to FSpedF.Bloco_1.Registro1001.Registro1250.Items[0].Registro1255.Count - 1 do
      if codmotivo = FSpedF.Bloco_1.Registro1001.Registro1250.Items[0].Registro1255.Items[i1255].COD_MOT_REST_COMPL then
      begin
        Result := FSpedF.Bloco_1.Registro1001.Registro1250.Items[0].Registro1255.Items[i1255];
        Exit;
      end;

    Result := FSpedF.Bloco_1.Registro1255New;
    Result.COD_MOT_REST_COMPL := codmotivo;
  end;

var
  v0200ComProdAgro: Boolean;
  Conf1600: TStrings;
  VincularCadastroAdm, AjustarOperacaoDebitoCreditoPeloVencimento: string;
  QtdeMaximaDiasPrazoParaConsiderarDebito: Integer;
  reg1255: TRegistro1255;
  reg1900: TRegistro1900;
//  reg1910: TRegistro1910;
  reg1920: TRegistro1920;
  reg1926: TRegistro1926;
  valores: TEfd_icmsst_cr_apuracoes_class;
  val: TEfd_icmsst_cr_apuracao_class;
  I, J, K, L, M: Integer;
  dtime: TDateTime;
  subConf: TSubApuracaoConf;
begin
  try
    FSpedF.Bloco_1.Registro1001New.IND_MOV := imSemDados;
    FLabelStatus.Caption := 'Montando registro 1200';

    vNivel2.Close;
    vNivel2.SQL.Text :=
      'select * from sped_cont_cred_fisc sf where sf.cod_empresa = :cod_empresa and' +
      ' sf.data_movimento >= :dataIni and sf.data_movimento <= :dataFim';
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.Open;

    vNivel2.FetchAll;

    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;

    if StrToDate(DataIni) >= StrToDate('01/07/2012') then
    begin

      FSpedF.Bloco_1.Registro1001.IND_MOV := imComDados;

      with FSpedF.Bloco_1.Registro1010New do
      begin
        IND_EXP := 'N';
        IND_CCRF := 'N';
        IND_COMB := 'N';
        IND_USINA := 'N';
        IND_VA := 'N';
        IND_EE := 'N';
        IND_CART := 'N';
        IND_FORM := 'N';
        IND_AER := 'N';
        IND_GIAF1 := 'N';
        IND_GIAF3 := 'N';
        IND_GIAF4 := 'N';
        IND_REST_RESSARC_COMPL_ICMS := 'N';

        {$REGION 'Registro 1200'}
        if vNivel2.RecordCount > 0 then
        begin
          FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
          with FSpedF.Bloco_1.Registro1200New do
          begin
            vNivel2.First;
            while not vNivel2.Eof do
            begin
              COD_AJ_APUR := Trim(vNivel2.FieldByName('COD_AJ_APUR').AsString);
              SLD_CRED := vNivel2.FieldByName('SLD_CRED').AsCurrency;
              CRED_APR := vNivel2.FieldByName('CRED_APR').AsCurrency;
              CRED_RECEB := vNivel2.FieldByName('CRED_RECEB').AsCurrency;
              CRED_UTIL := vNivel2.FieldByName('CRED_UTIL').AsCurrency;
              SLD_CRED_FIM := vNivel2.FieldByName('SLD_CRED_FIM').AsCurrency;

              vNivel3.Close;
              vNivel3.SQL.Text :=
                'select * from sped_cont_cred_fisc_util su where su.cod_empresa = :cod_empresa and' +
                ' su.cod_cont_cred_f = :cod_cont_cred_f';
              vNivel3.ParamByName('cod_cont_cred_f').AsInteger :=
                vNivel2.FieldByName('cod_cont_cred_f').AsInteger;
              vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel3.Open;

              vNivel3.First;
              while not vNivel3.Eof do
              begin
                with FSpedF.Bloco_1.Registro1210New do
                begin
                  TIPO_UTIL := Trim(vNivel3.FieldByName('TIPO_UTIL').AsString);
                  NR_DOC := Trim(vNivel3.FieldByName('NR_DOC').AsString);
                  VL_CRED_UTIL := vNivel3.FieldByName('VL_CRED_UTIL').AsCurrency;
                end;
                vNivel3.Next;
              end;
              vNivel2.Next;
              FProgressBar.Position := FProgressBar.Position + 1;
            end;
          end;
          if not vNivel2.IsEmpty then
            IND_CCRF := 'S';
        end;
        {$ENDREGION}

        {$REGION 'Registro 1250'}

        {$REGION 'Soma C181'}
        for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Count - 1 do
          for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i].RegistroC170.Count - 1 do
            for K := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i].RegistroC170.Items[J].RegistroC181.Count - 1 do
              with FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i].RegistroC170.Items[J].RegistroC181.Items[K] do
              begin
                reg1255 := Get1255(COD_MOT_REST_COMPL);
                reg1255.VL_CREDITO_ICMS_OP_MOT := reg1255.VL_CREDITO_ICMS_OP_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_OP_ESTOQUE_CONV_SAIDA), -2);
                reg1255.VL_ICMS_ST_REST_MOT := reg1255.VL_ICMS_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_REST), -2);
                reg1255.VL_FCP_ST_REST_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_ICMS_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_COMPL), -2);
                reg1255.VL_FCP_ST_COMPL_MOT := reg1255.VL_FCP_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_COMPL), -2);
              end;
        {$ENDREGION}

        {$REGION 'Soma C185'}
        for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Count - 1 do
          for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i].RegistroC185.Count - 1 do
            with FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i].RegistroC185.Items[J] do
              begin
                reg1255 := Get1255(COD_MOT_REST_COMPL);
                reg1255.VL_CREDITO_ICMS_OP_MOT := reg1255.VL_CREDITO_ICMS_OP_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_OP_ESTOQUE_CONV), -2);
                reg1255.VL_ICMS_ST_REST_MOT := reg1255.VL_ICMS_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_REST), -2);
                reg1255.VL_FCP_ST_REST_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_ICMS_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_COMPL), -2);
                reg1255.VL_FCP_ST_COMPL_MOT := reg1255.VL_FCP_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_COMPL), -2);
              end;
        {$ENDREGION}

        {$REGION 'Soma C330'}
        for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC300.Count - 1 do
          for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC300.Items[i].RegistroC320.Count - 1 do
            for K := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC300.Items[i].RegistroC320.Items[J].RegistroC321.Count - 1 do
              for L := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC300.Items[i].RegistroC320.Items[J].RegistroC321.Items[K].RegistroC330.Count - 1 do
                with FSpedF.Bloco_C.RegistroC001.RegistroC300.Items[i].RegistroC320.Items[J].RegistroC321.Items[K].RegistroC330.Items[L] do
                  begin
                    reg1255 := Get1255(COD_MOT_REST_COMPL);
                    reg1255.VL_CREDITO_ICMS_OP_MOT := reg1255.VL_CREDITO_ICMS_OP_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_OP_ESTOQUE_CONV), -2);
                    reg1255.VL_ICMS_ST_REST_MOT := reg1255.VL_ICMS_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_REST), -2);
                    reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                    reg1255.VL_FCP_ST_REST_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                    reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_ICMS_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_COMPL), -2);
                    reg1255.VL_FCP_ST_COMPL_MOT := reg1255.VL_FCP_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_COMPL), -2);
                  end;
        {$ENDREGION}

        {$REGION 'Soma C380'}
        for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC350.Count - 1 do
          for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC350.Items[i].RegistroC370.Count - 1 do
            for K := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC350.Items[i].RegistroC370.Items[J].RegistroC380.Count - 1 do
              with FSpedF.Bloco_C.RegistroC001.RegistroC350.Items[i].RegistroC370.Items[J].RegistroC380.Items[K] do
                begin
                  reg1255 := Get1255(COD_MOT_REST_COMPL);
                  reg1255.VL_CREDITO_ICMS_OP_MOT := reg1255.VL_CREDITO_ICMS_OP_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_OP_ESTOQUE_CONV), -2);
                  reg1255.VL_ICMS_ST_REST_MOT := reg1255.VL_ICMS_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_REST), -2);
                  reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                  reg1255.VL_FCP_ST_REST_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                  reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_ICMS_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_COMPL), -2);
                  reg1255.VL_FCP_ST_COMPL_MOT := reg1255.VL_FCP_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_COMPL), -2);
                end;
        {$ENDREGION}

        {$REGION 'Soma C430'}
        for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Count - 1 do
          for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Count - 1 do
            for K := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Items[J].RegistroC420.Count - 1 do
              for L := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Items[J].RegistroC420.Items[K].RegistroC425.Count - 1 do
                for M := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Items[J].RegistroC420.Items[K].RegistroC425.Items[L].RegistroC430.Count - 1 do
                  with FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Items[J].RegistroC420.Items[K].RegistroC425.Items[L].RegistroC430.Items[M] do
                  begin
                    reg1255 := Get1255(COD_MOT_REST_COMPL);
                    reg1255.VL_CREDITO_ICMS_OP_MOT := reg1255.VL_CREDITO_ICMS_OP_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_OP_ESTOQUE_CONV), -2);
                    reg1255.VL_ICMS_ST_REST_MOT := reg1255.VL_ICMS_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_REST), -2);
                    reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                    reg1255.VL_FCP_ST_REST_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                    reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_ICMS_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_COMPL), -2);
                    reg1255.VL_FCP_ST_COMPL_MOT := reg1255.VL_FCP_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_COMPL), -2);
                  end;
        {$ENDREGION}

        {$REGION 'Soma C480'}
        for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Count - 1 do
          for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Count - 1 do
            for K := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Items[J].RegistroC460.Count - 1 do
              for L := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Items[J].RegistroC460.Items[K].RegistroC470.Count - 1 do
                for M := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Items[J].RegistroC460.Items[K].RegistroC470.Items[L].RegistroC480.Count - 1 do
                  with FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[i].RegistroC405.Items[J].RegistroC460.Items[K].RegistroC470.Items[L].RegistroC480.Items[M] do
                  begin
                    reg1255 := Get1255(COD_MOT_REST_COMPL);
                    reg1255.VL_CREDITO_ICMS_OP_MOT := reg1255.VL_CREDITO_ICMS_OP_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_OP_ESTOQUE_CONV), -2);
                    reg1255.VL_ICMS_ST_REST_MOT := reg1255.VL_ICMS_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_REST), -2);
                    reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                    reg1255.VL_FCP_ST_REST_MOT := reg1255.VL_FCP_ST_REST_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_REST), -2);
                    reg1255.VL_ICMS_ST_COMPL_MOT := reg1255.VL_ICMS_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_ICMS_ST_CONV_COMPL), -2);
                    reg1255.VL_FCP_ST_COMPL_MOT := reg1255.VL_FCP_ST_COMPL_MOT + RoundTo(QUANT_CONV * VarToFloat(VL_UNIT_FCP_ST_CONV_COMPL), -2);
                  end;
        {$ENDREGION}

        {$REGION 'Soma 1255'}
        valores := TEfd_icmsst_cr_apuracoes_class.Create;
        try
          if FSpedF.Bloco_1.Registro1001.Registro1250.Count > 0 then
            with FSpedF.Bloco_1.Registro1001.Registro1250.Items[0] do
              for I := 0 to Registro1255.Count - 1 do
              begin
                VL_CREDITO_ICMS_OP := VL_CREDITO_ICMS_OP + Registro1255.Items[I].VL_CREDITO_ICMS_OP_MOT;
                VL_ICMS_ST_REST := VL_ICMS_ST_REST + Registro1255.Items[I].VL_ICMS_ST_REST_MOT;
                VL_FCP_ST_REST := VL_FCP_ST_REST + Registro1255.Items[I].VL_FCP_ST_REST_MOT;
                VL_ICMS_ST_COMPL := VL_ICMS_ST_COMPL + Registro1255.Items[I].VL_ICMS_ST_COMPL_MOT;
                VL_FCP_ST_COMPL := VL_FCP_ST_COMPL + Registro1255.Items[I].VL_FCP_ST_COMPL_MOT;

                val := valores.New;
                begin
                  val.beginChanges;
                  val.tipo := StrToInt(Registro1255.Items[I].COD_MOT_REST_COMPL.Substring(2, 1));
                  if  val.tipo = 1 then
                  begin
                    val.icmsop := 0;
                    val.icmsst := Registro1255.Items[I].VL_ICMS_ST_REST_MOT;
                    val.fcpst  := Registro1255.Items[I].VL_FCP_ST_REST_MOT;
                  end
                  else if  val.tipo = 2 then
                  begin
                    val.icmsop := Registro1255.Items[I].VL_CREDITO_ICMS_OP_MOT;
                    val.icmsst := Registro1255.Items[I].VL_ICMS_ST_REST_MOT;
                    val.fcpst  := Registro1255.Items[I].VL_FCP_ST_REST_MOT;
                  end
                  else if  val.tipo = 3 then
                  begin
                    val.icmsop := 0;
                    val.icmsst := Registro1255.Items[I].VL_ICMS_ST_COMPL_MOT;
                    val.fcpst  := Registro1255.Items[I].VL_FCP_ST_COMPL_MOT;
                  end;
                end
              end;
          if valores.Count > 0 then
            RestComplST.SalvarApuracao(valores);
        finally
          valores.Free;
        end;
        {$ENDREGION}

        {$ENDREGION}

        {$REGION 'Registro 1400'}
        FLabelStatus.Caption := 'Montando registro 1400';

        vNivel2.Close;
        vNivel2.SQL.Text :=
          'select c.IBGE_COD_CIDADE, ''Produtos_Agropecuarios'' cod_item, sum(valor_total) valor_total from notafiscal nf' +
          ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
          ' inner join cidades c on c.cod_cidade = cl.cod_cidade' +
          ' inner join tipos_clientes tc on tc.codigo_tipo = cl.codigo_tipo' +
          ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim' +
          ' and nf.natureza_nf = ''E'' and nf.emissao_propria = ''S'' and nf.status = ''Fechada''' +
          ' and ((nf.modelo_nf <> ''55'') or ( nf.situacao_nfe = ''Autorizada''))' +
          ' and tc.DESCRICAO_TIPO = ''PRODUTOR RURAL NAO EMITENTE''' +
          ' group by 1';
//          fazer union aqui com o select das coperativas, ver o cfop de remessa para deposito e ver se vai usar o sum nos itens da nf
        vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
        vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
        vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel2.Open;

        vNivel2.FetchAll;

        FProgressBar.Position := 0;
        FProgressBar.Min := 0;
        FProgressBar.Max := vNivel2.RecordCount;
        v0200ComProdAgro := False;

        if vNivel2.RecordCount > 0 then
        begin
          FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
          vNivel2.First;
          while not vNivel2.Eof do
          begin
            with FSpedF.Bloco_1.Registro1400New do
            begin
              COD_ITEM := vNivel2.FieldByName('cod_item').AsString;
              MUN := vNivel2.FieldByName('IBGE_COD_CIDADE').AsString;
              VALOR := vNivel2.FieldByName('valor_total').AsFloat;
            end;
            if (Trim(vNivel2.FieldByName('cod_item').AsString) = 'Produtos_Agropecuarios') and (not v0200ComProdAgro) then
            begin
              v0200ComProdAgro := True;
              with FSpedF.Bloco_0.Registro0200New do
              begin
                COD_ITEM := 'Produtos_Agropecuarios';
                DESCR_ITEM := 'Produtos Agropecuários/Hortifrutigranjeiros';
                UNID_INV := 'UN';
                TIPO_ITEM := tiOutras;
              end;
            end;
            vNivel2.Next;
            FProgressBar.Position := FProgressBar.Position + 1;
          end;
          if not vNivel2.IsEmpty then
            IND_VA := 'S';
        end;
        {$ENDREGION}

        {$REGION 'Registro 1600'}
        if FSpedF.Bloco_0.Registro0000.COD_VER < TACBrVersaoLeiaute.vlVersao115 then
        begin

          FLabelStatus.Caption := 'Montando registro 1600';

          Conf1600                                   := TStringList.Create;
          Conf1600                                   := getConfSisBlob('efd_icms_1600_conf_cartao', vQrAux);
          VincularCadastroAdm                        := GetIni('Cartao1600', 'VincularCadastroAdm', 'N', Conf1600);
          AjustarOperacaoDebitoCreditoPeloVencimento := GetIni('Cartao1600', 'AjustarOperacaoDebitoCreditoPeloVencimento', 'N', Conf1600);
          QtdeMaximaDiasPrazoParaConsiderarDebito    := StrToIntDef(GetIni('Cartao1600', 'QtdeMaximaDiasPrazoParaConsiderarDebito', '5', Conf1600), 5);

          if VincularCadastroAdm  = 'S' then
          begin
            vNivel2.Close;
            vNivel2.SQL.Text := 'select ad.cod_cliente COD_PART,' +
  //            '--case when tr.operacao is null then' +
  //            '--  case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
  //            '--    case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
  //            '--  else' +
  //            '--    case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
  //            '--  end' +
  //            '--else' +
  //            '--  tr.operacao' +
  //            '--end  operacao,' +
              'sum (' +
              ' case when' +
              '   case when tr.operacao is null then' +
              '     case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
              '       case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
              '     else' +
              '       case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
              '     end' +
              '   else' +
              '     tr.operacao' +
              '   end = ''D'' then fp.valordoc' +
              ' else' +
              '   0' +
              ' end) TOT_DEBITO,' +
              ' sum (' +
              ' case when case when tr.operacao is null then' +
              '     case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
              '       case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
              '     else' +
              '       case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
              '     end' +
              '   else' +
              '     tr.operacao' +
              '   end = ''C'' then fp.valordoc' +
              ' else' +
              '   0' +
              ' end) TOT_CREDITO' +
              ' from formpagamento fp' +
              ' inner join controles cl on cl.codigo_ctrl = fp.cod_controle and cl.codigo_emp = fp.cod_empresa' +
              ' left join terminal_cartao tc on tc.cod_term_adm = fp.cod_terminal_adm and tc.cod_empresa = fp.cod_empresa' +
              ' left join adm_cartao ad on ad.cod_adm = tc.cod_adm and ad.cod_empresa = tc.cod_empresa' +
              ' left join transacao_cartao tr on tr.cod_empresa = fp.cod_empresa and tr.cod_terminal_adm = fp.cod_terminal_adm and tr.n_aut_cart = fp.n_aut_cart and tr.n_docnsu_adm = fp.n_docnsu_adm' +
              ' where ((cl.cartao_sped = 1) or (cl.cartao_sped = 2)) and fp.cod_empresa = :cod_empresa and' +
              ' fp.data_mov >= :dataIni and fp.data_mov <= :dataFim group by 1';
            vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
            vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
            vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel2.ParamByName('AjustarOperacaoDebitoCreditoPeloVencimento').AsString := AjustarOperacaoDebitoCreditoPeloVencimento;
            vNivel2.Open;
          end
          else
          begin
            vNivel2.Close;
            vNivel2.SQL.Text := 'select cl.cartao_sped_part COD_PART,' +
              ' sum (case when case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
              '       case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
              '     else' +
              '       case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
              '     end = ''D'' then fp.valordoc else 0 end) TOT_DEBITO,' +
              ' sum (case when case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
              '       case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
              '     else' +
              '       case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
              '     end = ''C'' then fp.valordoc else 0 end) TOT_CREDITO' +
              '  from formpagamento fp' +
              ' inner join controles cl on cl.codigo_ctrl = fp.cod_controle and cl.codigo_emp = fp.cod_empresa' +
              ' where ((cl.cartao_sped = 1) or (cl.cartao_sped = 2)) and fp.cod_empresa = :cod_empresa and' +
              ' fp.data_mov >= :dataIni and fp.data_mov <= :dataFim group by 1';
            vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
            vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
            vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel2.ParamByName('AjustarOperacaoDebitoCreditoPeloVencimento').AsString := AjustarOperacaoDebitoCreditoPeloVencimento;
            vNivel2.Open;
          end;

          vNivel2.FetchAll;

          FProgressBar.Position := 0;
          FProgressBar.Min := 0;
          FProgressBar.Max := vNivel2.RecordCount;

          if vNivel2.RecordCount > 0 then
          begin
            FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
               
            vNivel2.First;
            while not vNivel2.Eof do
            begin
              with FSpedF.Bloco_1.Registro1600New do
              begin
                COD_PART := vNivel2.FieldByName('COD_PART').AsString;
                montaRegistro0150(COD_PART);
                TOT_CREDITO := vNivel2.FieldByName('TOT_CREDITO').AsCurrency;
                TOT_DEBITO := vNivel2.FieldByName('TOT_DEBITO').AsCurrency;
              end;
              vNivel2.Next;
              FProgressBar.Position := FProgressBar.Position + 1;
            end;
            if not vNivel2.IsEmpty then
              IND_CART := 'S';
          end;
        end;

        {$ENDREGION}

        {$REGION 'Registro 1601'}
        if FSpedF.Bloco_0.Registro0000.COD_VER >= TACBrVersaoLeiaute.vlVersao115 then
        begin

          FLabelStatus.Caption := 'Montando registro 1601';

          //Conf1600                                   := TStringList.Create;
          //Conf1600                                   := getConfSisBlob('efd_icms_1600_conf_cartao', vQrAux);
          //VincularCadastroAdm                        := GetIni('Cartao1600', 'VincularCadastroAdm', 'N', Conf1600);

          vNivel2.Close;
          vNivel2.SQL.Text := 'select * from sped_1601(:cod_empresa, :dataIni, :dataFim)';
          vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
          vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
          vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel2.Open;

          vNivel2.FetchAll;

          FProgressBar.Position := 0;
          FProgressBar.Min := 0;
          FProgressBar.Max := vNivel2.RecordCount;

          if vNivel2.RecordCount > 0 then
          begin
            FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;

            vNivel2.First;
            while not vNivel2.Eof do
            begin
              with FSpedF.Bloco_1.Registro1601New do
              begin
                COD_PART_IP := vNivel2.FieldByName('COD_PART_IP').AsString;
                montaRegistro0150(COD_PART_IP);

                if vNivel2.FieldByName('COD_PART_IT').AsInteger > 0 then
                begin
                  COD_PART_IT := vNivel2.FieldByName('COD_PART_IT').AsString;
                  montaRegistro0150(COD_PART_IT);
                end;

                TOT_VS := vNivel2.FieldByName('TOT_VS').AsCurrency;
                TOT_ISS := vNivel2.FieldByName('TOT_ISS').AsCurrency;
                TOT_OUTROS := vNivel2.FieldByName('TOT_OUTROS').AsCurrency;
              end;
              vNivel2.Next;
              FProgressBar.Position := FProgressBar.Position + 1;
            end;
            if not vNivel2.IsEmpty then
              IND_CART := 'S';
          end;
        end;

        {$ENDREGION}

        IND_REST_RESSARC_COMPL_ICMS := IfThen(FSpedF.Bloco_1.Registro1001.Registro1250.Count > 0, 'S', 'N');
      end;

      {$REGION 'Registro 1900, 1910, 1920, 1921'}

      subConf := SubApuracaoUtils.GetConf(vNivel5.Database, StrToInt(FCodEmpresa));
      try
        if MatchText(subConf.conf.Values['IndicadorApuracaoIcms1900'].Trim, ['3', '4', '5', '6', '7', '8']) then
        begin
          reg1920 := nil;
          for I := 0 to FSpedF.Bloco_1.Registro1001.Registro1900.Count - 1 do
            if reg1920 <> nil then
              Break
            else if FSpedF.Bloco_1.Registro1001.Registro1900.Items[I].IND_APUR_ICMS = subConf.conf.Values['IndicadorApuracaoIcms1900'] then
            begin
              reg1920 := FSpedF.Bloco_1.Registro1001.Registro1900.Items[I].Registro1910.Items[0].Registro1920.Items[0];
            end;

          if reg1920 = nil then
          begin
            with FSpedF.Bloco_1.Registro1900New do
            begin
              IND_APUR_ICMS := subConf.conf.Values['IndicadorApuracaoIcms1900'];
              DESCR_COMPL_OUT_APUR := subConf.conf.Values['DescricaoComplementar1900'];

              with Registro1910.New do
              begin
                DT_INI := StrToDate(DataIni);
                DT_FIN := StrToDate(DataFim);

                reg1920 := Registro1920.New;
              end
            end
          end;

          var consulta := QueryHelper.CreateObj(vNivel5)
            .Table('notafiscal nf', 't.conf, e.cod_ajuste, e.descr_compl, sum(e.valor_ajuste) valor_ajuste')
            .Join('notafiscal_item nfi', 'nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa')
            .Join('efd_1921 e', 'e.ref_id = nfi.guidt and e.cod_empresa = nfi.cod_empresa')
            .Join('efd_ajustes_conf_tipo t', 't.tipo = 2 and t.id = e.conf_tipo_id')
            .Between('nf.data_lanc', StrToDate(DataIni), StrToDate(DataFim))
            .Equals('nf.cod_empresa', StrToInt(FCodEmpresa))
            .Equals('nf.status', 'Fechada')
            .Equals('iif(nf.emissao_propria = ''S'', nf.situacao_nfe, ''Autorizada'')', 'Autorizada')
            .GroupBy('1,2,3')
            .Open();

          if not consulta.fempty('cod_ajuste') then
          begin
            var existe1900 := False;

            consulta.First;
            while not consulta.Eof do
            begin
              var conf := NewStringList(consulta.fstr('conf'));

              (*
              reg1920 := nil;
              for I := 0 to FSpedF.Bloco_1.Registro1001.Registro1900.Count - 1 do
                if reg1920 <> nil then
                  Break
                else if FSpedF.Bloco_1.Registro1001.Registro1900.Items[I].IND_APUR_ICMS = conf.Values['IndicadorApuracaoIcms1900'] then
                begin
  //              reg1900 := FSpedF.Bloco_1.Registro1001.Registro1900.Items[I];
  //              reg1910 := reg1900.Registro1910.Items[0];
  //              reg1920 := reg1900.Registro1910.Items[0].Registro1920.Items[0];
                  reg1920 := FSpedF.Bloco_1.Registro1001.Registro1900.Items[I].Registro1910.Items[0].Registro1920.Items[0];
                end;

              if reg1920 = nil then
              begin
                {
                reg1900 := FSpedF.Bloco_1.Registro1900New;
                reg1900.IND_APUR_ICMS := conf.Values['IndicadorApuracaoIcmsEFD'];
                reg1900.DESCR_COMPL_OUT_APUR := conf.Values['DescricaoComplementarApuracaoIcmsEFD'];

                reg1910 := reg1900.Registro1910.New;
                reg1910.DT_INI := StrToDate(DataIni);
                reg1910.DT_FIN := StrToDate(DataIni);
                }
                with FSpedF.Bloco_1.Registro1900New do
                begin
                  IND_APUR_ICMS := conf.Values['IndicadorApuracaoIcms1900'];
                  DESCR_COMPL_OUT_APUR := conf.Values['DescricaoComplementar1900'];

                  with Registro1910.New do
                  begin
                    DT_INI := StrToDate(DataIni);
                    DT_FIN := StrToDate(DataFim);

                    reg1920 := Registro1920.New;
                  end
                end
              end;
              *)

              var reg1921 := reg1920.Registro1921.New;

              reg1921.COD_AJ_APUR := consulta.fstr('cod_ajuste');
              reg1921.DESCR_COMPL_AJ := consulta.fstr('descr_compl');
              reg1921.VL_AJ_APUR := consulta.ffloat('valor_ajuste', -2);

              if reg1921.COD_AJ_APUR.Substring(2, 1).Equals('0')
                and reg1921.COD_AJ_APUR.Substring(3, 1).Equals('0')
              then
                reg1920.VL_TOT_AJ_DEBITOS_OA := reg1920.VL_TOT_AJ_DEBITOS_OA + reg1921.VL_AJ_APUR;

              if reg1921.COD_AJ_APUR.Substring(2, 1).Equals('0')
                and reg1921.COD_AJ_APUR.Substring(3, 1).Equals('1')
              then
                reg1920.VL_ESTORNOS_CRED_OA := reg1920.VL_ESTORNOS_CRED_OA + reg1921.VL_AJ_APUR;

              if reg1921.COD_AJ_APUR.Substring(2, 1).Equals('0')
                and reg1921.COD_AJ_APUR.Substring(3, 1).Equals('2')
              then
                reg1920.VL_TOT_AJ_CREDITOS_OA := reg1920.VL_TOT_AJ_CREDITOS_OA + reg1921.VL_AJ_APUR;

              if reg1921.COD_AJ_APUR.Substring(2, 1).Equals('0')
                and reg1921.COD_AJ_APUR.Substring(3, 1).Equals('3')
              then
                reg1920.VL_ESTORNOS_DEB_OA := reg1920.VL_ESTORNOS_DEB_OA + reg1921.VL_AJ_APUR;

              if reg1921.COD_AJ_APUR.Substring(2, 1).Equals('0')
                and reg1921.COD_AJ_APUR.Substring(3, 1).Equals('4')
              then
                reg1920.VL_TOT_DED := reg1920.VL_TOT_DED + reg1921.VL_AJ_APUR;

              (*
              for var i1900 := 0 to FSpedF.Bloco_1.Registro1001.Registro1900.Count - 1 do
                for var i1910:= 0 to FSpedF.Bloco_1.Registro1001.Registro1900.Items[i1900].Registro1910.Count - 1 do
                  for var i1920 := 0 to FSpedF.Bloco_1.Registro1001.Registro1900.Items[i1900].Registro1910.Items[i1910].Registro1920.Count - 1 do
                  begin
                    reg1920 := FSpedF.Bloco_1.Registro1001.Registro1900.Items[i1900].Registro1910.Items[i1910].Registro1920.Items[i1920];
                    reg1900 := FSpedF.Bloco_1.Registro1001.Registro1900.Items[i1900];

                    for var iC100 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Count - 1 do
                      if not (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[iC100].COD_SIT in [TACBrCodSit.sdExtempRegular, TACBrCodSit.sdExtempCompl])
                      then
                      for var iC195 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[iC100].RegistroC195.Count - 1 do
                        for var iC197 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[iC100].RegistroC195.Items[iC195].RegistroC197.Count - 1 do
                        begin
                          var regC197 := FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[iC100].RegistroC195.Items[iC195].RegistroC197.Items[iC197];

    //                    var indicesApur := array of string = ['3','4','5','6','7','8'];

                          for var iInd := Low(indicesApur) to High(indicesApur) do
                            if (reg1900.IND_APUR_ICMS = indicesApur[iInd])
                              and regC197.COD_AJ.Substring(2, 1).Equals('2')
                              and regC197.COD_AJ.Substring(3, 1).Equals(indicesApur[iInd])
                              //and regC197.COD_AJ.Substring(2, 2).Equals('2' + indicesApur[iInd])
                            then
                              reg1920.VL_TOT_TRANSF_DEBITOS_OA := reg1920.VL_TOT_TRANSF_DEBITOS_OA + regC197.VL_ICMS;

                          for var iInd := Low(indicesApur) to High(indicesApur) do
                            if (reg1900.IND_APUR_ICMS = indicesApur[iInd])
                              and regC197.COD_AJ.Substring(2, 1).Equals('5')
                              and regC197.COD_AJ.Substring(3, 1).Equals(indicesApur[iInd])
                            then
                              reg1920.VL_TOT_TRANSF_CREDITOS_OA := reg1920.VL_TOT_TRANSF_CREDITOS_OA + regC197.VL_ICMS;

                          for var iInd := Low(indicesApur) to High(indicesApur) do
                              if regC197.COD_AJ.Substring(2, 1).Equals('6' + indicesApur[iInd])
                              and MatchText(regC197.COD_AJ.Substring(3, 2), indicesApur)
                            then
                              reg1920.VL_TOT_DED := reg1920.VL_TOT_DED + regC197.VL_ICMS;
                        end;

                    reg1920.VL_SLD_APURADO_OA := reg1920.VL_TOT_TRANSF_DEBITOS_OA + reg1920.VL_TOT_AJ_DEBITOS_OA + reg1920.VL_ESTORNOS_CRED_OA -
                      (reg1920.VL_TOT_TRANSF_CREDITOS_OA + reg1920.VL_TOT_AJ_CREDITOS_OA + reg1920.VL_ESTORNOS_DEB_OA + + reg1920.VL_SLD_CREDOR_ANT_OA);

                    if reg1920.VL_SLD_APURADO_OA >= 0 then
                      reg1920.VL_SLD_CREDOR_TRANSP_OA := 0
                    else
                    begin
                      reg1920.VL_SLD_CREDOR_TRANSP_OA := Abs(reg1920.VL_SLD_APURADO_OA);
                      reg1920.VL_SLD_APURADO_OA := 0;
                    end;

                    reg1920.VL_ICMS_RECOLHER_OA := reg1920.VL_SLD_APURADO_OA - reg1920.VL_TOT_DED;


                    reg1926 := nil;
                    for var i1926 := 0 to reg1920.Registro1926.Count - 1 do
                      if reg1926 <> nil then
                        Break
                      else if reg1920.Registro1926.Items[i1926].COD_OR = conf.Values['CodigoObrigacaoRecolher1926'] then
                        reg1926 := reg1920.Registro1926.Items[i1926];

                    if reg1926 = nil then
                    begin
                      reg1926 := reg1920.Registro1926.New;
                      reg1926.COD_OR := conf.Values['CodigoObrigacaoRecolher1926'];
                      reg1926.COD_REC := conf.Values['CodigoReceitaObrigacaoRecolher1926'];
                      reg1926.IND_PROC := conf.Values['IndicadorProcessoObrigacaoRecolher1926'];
                      reg1926.NUM_PROC := conf.Values['NumeroProcessoObrigacaoRecolher1926'];
                      reg1926.PROC := conf.Values['DescricaoProcessoObrigacaoRecolher1926'];
                      reg1926.TXT_COMPL := conf.Values['TextoComplementarObrigacaoRecolher1926'];

                      dtime := StrToDate(FDataIni);
                      reg1926.MES_REF := Format('%s%d', [MonthOf(dtime).ToString().PadLeft(2, '0'), YearOf(dtime)]);

                      dtime := IncMonth(dtime);
                      var dia := 9;
                      TryStrToInt(conf.Values['DiaVencimentoObrigacaoRecolher1926'], dia);


                      if TryEncodeDate(YearOf(dtime), MonthOf(dtime), dia, dtime) then
                        reg1926.DT_VCTO := dtime
                      else
                        reg1926.DT_VCTO := EncodeDate(YearOf(dtime), MonthOf(dtime), 9);
                    end;

                    reg1926.VL_OR := reg1920.VL_ICMS_RECOLHER_OA + reg1920.DEB_ESP_OA;


    //              reg1920.VL_ICMS_RECOLHER_OA
    //              reg1920.VL_SLD_CREDOR_TRANSP_OA
    //              reg1920.DEB_ESP_OA
                  end;
                  *)

              consulta.Next;
            end;
          end;

          for var i1900 := 0 to FSpedF.Bloco_1.Registro1001.Registro1900.Count - 1 do
            for var i1910:= 0 to FSpedF.Bloco_1.Registro1001.Registro1900.Items[i1900].Registro1910.Count - 1 do
              for var i1920 := 0 to FSpedF.Bloco_1.Registro1001.Registro1900.Items[i1900].Registro1910.Items[i1910].Registro1920.Count - 1 do
              begin
                reg1920 := FSpedF.Bloco_1.Registro1001.Registro1900.Items[i1900].Registro1910.Items[i1910].Registro1920.Items[i1920];
                reg1900 := FSpedF.Bloco_1.Registro1001.Registro1900.Items[i1900];

                {$REGION 'Handle Registro C197 - Notas'}

                for var iC100 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Count - 1 do
                  if not (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[iC100].COD_SIT in [TACBrCodSit.sdExtempRegular, TACBrCodSit.sdExtempCompl])
                  then
                  for var iC195 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[iC100].RegistroC195.Count - 1 do
                    for var iC197 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[iC100].RegistroC195.Items[iC195].RegistroC197.Count - 1 do
                    begin
                      var regC197 := FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[iC100].RegistroC195.Items[iC195].RegistroC197.Items[iC197];

                      //var indicesApur := array of string = ['3','4','5','6','7','8'];

                      for var iInd := Low(indicesApur) to High(indicesApur) do
                        if (reg1900.IND_APUR_ICMS = indicesApur[iInd])
                          and regC197.COD_AJ.Substring(2, 1).Equals('2')
                          and regC197.COD_AJ.Substring(3, 1).Equals(indicesApur[iInd])
                          //and regC197.COD_AJ.Substring(2, 2).Equals('2' + indicesApur[iInd])
                        then
                          reg1920.VL_TOT_TRANSF_DEBITOS_OA := reg1920.VL_TOT_TRANSF_DEBITOS_OA + regC197.VL_ICMS;

                      for var iInd := Low(indicesApur) to High(indicesApur) do
                        if (reg1900.IND_APUR_ICMS = indicesApur[iInd])
                          and regC197.COD_AJ.Substring(2, 1).Equals('5')
                          and regC197.COD_AJ.Substring(3, 1).Equals(indicesApur[iInd])
                        then
                          reg1920.VL_TOT_TRANSF_CREDITOS_OA := reg1920.VL_TOT_TRANSF_CREDITOS_OA + regC197.VL_ICMS;

                      for var iInd := Low(indicesApur) to High(indicesApur) do
                          if regC197.COD_AJ.Substring(2, 1).Equals('6' + indicesApur[iInd])
                          and MatchText(regC197.COD_AJ.Substring(3, 2), indicesApur)
                        then
                          reg1920.VL_TOT_DED := reg1920.VL_TOT_DED + regC197.VL_ICMS;
                    end;

                {$ENDREGION}

                {$REGION 'Handle Registro D197 - Transportes'}

                for var i100 := 0 to FSpedF.Bloco_D.RegistroD001.RegistroD100.Count - 1 do
                  if not (FSpedF.Bloco_D.RegistroD001.RegistroD100.Items[i100].COD_SIT in [TACBrCodSit.sdExtempRegular, TACBrCodSit.sdExtempCompl])
                  then
                  for var i195 := 0 to FSpedF.Bloco_D.RegistroD001.RegistroD100.Items[i100].RegistroD195.Count - 1 do
                    for var i197 := 0 to FSpedF.Bloco_D.RegistroD001.RegistroD100.Items[i100].RegistroD195.Items[i195].RegistroD197.Count - 1 do
                    begin
                      var regD197 := FSpedF.Bloco_D.RegistroD001.RegistroD100.Items[i100].RegistroD195.Items[i195].RegistroD197.Items[i197];

                      //var indicesApur := array of string = ['3','4','5','6','7','8'];

                      for var iInd := Low(indicesApur) to High(indicesApur) do
                        if (reg1900.IND_APUR_ICMS = indicesApur[iInd])
                          and regD197.COD_AJ.Substring(2, 1).Equals('2')
                          and regD197.COD_AJ.Substring(3, 1).Equals(indicesApur[iInd])
                          //and regD197.COD_AJ.Substring(2, 2).Equals('2' + indicesApur[iInd])
                        then
                          reg1920.VL_TOT_TRANSF_DEBITOS_OA := reg1920.VL_TOT_TRANSF_DEBITOS_OA + regD197.VL_ICMS;

                      for var iInd := Low(indicesApur) to High(indicesApur) do
                        if (reg1900.IND_APUR_ICMS = indicesApur[iInd])
                          and regD197.COD_AJ.Substring(2, 1).Equals('5')
                          and regD197.COD_AJ.Substring(3, 1).Equals(indicesApur[iInd])
                        then
                          reg1920.VL_TOT_TRANSF_CREDITOS_OA := reg1920.VL_TOT_TRANSF_CREDITOS_OA + regD197.VL_ICMS;

                      for var iInd := Low(indicesApur) to High(indicesApur) do
                          if regD197.COD_AJ.Substring(2, 1).Equals('6' + indicesApur[iInd])
                          and MatchText(regD197.COD_AJ.Substring(3, 2), indicesApur)
                        then
                          reg1920.VL_TOT_DED := reg1920.VL_TOT_DED + regD197.VL_ICMS;
                    end;

                {$ENDREGION}

                reg1920.VL_SLD_APURADO_OA := reg1920.VL_TOT_TRANSF_DEBITOS_OA + reg1920.VL_TOT_AJ_DEBITOS_OA + reg1920.VL_ESTORNOS_CRED_OA -
                  (reg1920.VL_TOT_TRANSF_CREDITOS_OA + reg1920.VL_TOT_AJ_CREDITOS_OA + reg1920.VL_ESTORNOS_DEB_OA + + reg1920.VL_SLD_CREDOR_ANT_OA);

                if reg1920.VL_SLD_APURADO_OA >= 0 then
                  reg1920.VL_SLD_CREDOR_TRANSP_OA := 0
                else
                begin
                  reg1920.VL_SLD_CREDOR_TRANSP_OA := Abs(reg1920.VL_SLD_APURADO_OA);
                  reg1920.VL_SLD_APURADO_OA := 0;
                end;

                reg1920.VL_ICMS_RECOLHER_OA := reg1920.VL_SLD_APURADO_OA - reg1920.VL_TOT_DED;
          end;

          reg1926 := nil;
          for var i1926 := 0 to reg1920.Registro1926.Count - 1 do
            if reg1926 <> nil then
              Break
            else if reg1920.Registro1926.Items[i1926].COD_OR = subConf.conf.Values['CodigoObrigacaoRecolher1926'] then
              reg1926 := reg1920.Registro1926.Items[i1926];

          if reg1926 = nil then
          begin
            reg1926 := reg1920.Registro1926.New;
            reg1926.COD_OR := subConf.conf.Values['CodigoObrigacaoRecolher1926'];
            reg1926.COD_REC := subConf.conf.Values['CodigoReceitaObrigacaoRecolher1926'];
            reg1926.IND_PROC := subConf.conf.Values['IndicadorProcessoObrigacaoRecolher1926'];
            reg1926.NUM_PROC := subConf.conf.Values['NumeroProcessoObrigacaoRecolher1926'];
            reg1926.PROC := subConf.conf.Values['DescricaoProcessoObrigacaoRecolher1926'];
            reg1926.TXT_COMPL := subConf.conf.Values['TextoComplementarObrigacaoRecolher1926'];

            dtime := StrToDate(FDataIni);
            reg1926.MES_REF := Format('%s%d', [MonthOf(dtime).ToString().PadLeft(2, '0'), YearOf(dtime)]);

            dtime := IncMonth(dtime);
            var dia := 9;
            TryStrToInt(subConf.conf.Values['DiaVencimentoObrigacaoRecolher1926'], dia);


            if TryEncodeDate(YearOf(dtime), MonthOf(dtime), dia, dtime) then
              reg1926.DT_VCTO := dtime
            else
              reg1926.DT_VCTO := EncodeDate(YearOf(dtime), MonthOf(dtime), 9);
          end;

          reg1926.VL_OR := reg1920.VL_ICMS_RECOLHER_OA + reg1920.DEB_ESP_OA;

        end;


      finally
        subConf.Free;
      end;

      {$ENDREGION}

    end
    else
    begin

      {$REGION 'Regisotr 1200'}
      if vNivel2.RecordCount > 0 then
      begin
        FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
        with FSpedF.Bloco_1.Registro1200New do
        begin
          vNivel2.First;
          while not vNivel2.Eof do
          begin
            COD_AJ_APUR := Trim(vNivel2.FieldByName('COD_AJ_APUR').AsString);
            SLD_CRED := vNivel2.FieldByName('SLD_CRED').AsCurrency;
            CRED_APR := vNivel2.FieldByName('CRED_APR').AsCurrency;
            CRED_RECEB := vNivel2.FieldByName('CRED_RECEB').AsCurrency;
            CRED_UTIL := vNivel2.FieldByName('CRED_UTIL').AsCurrency;
            SLD_CRED_FIM := vNivel2.FieldByName('SLD_CRED_FIM').AsCurrency;

            vNivel3.Close;
            vNivel3.SQL.Text :=
              'select * from sped_cont_cred_fisc_util su where su.cod_empresa = :cod_empresa and' +
              ' su.cod_cont_cred_f = :cod_cont_cred_f';
            vNivel3.ParamByName('cod_cont_cred_f').AsInteger :=
              vNivel2.FieldByName('cod_cont_cred_f').AsInteger;
            vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.Open;

            vNivel3.First;
            while not vNivel3.Eof do
            begin
              with FSpedF.Bloco_1.Registro1210New do
              begin
                TIPO_UTIL := Trim(vNivel3.FieldByName('TIPO_UTIL').AsString);
                NR_DOC := Trim(vNivel3.FieldByName('NR_DOC').AsString);
                VL_CRED_UTIL := vNivel3.FieldByName('VL_CRED_UTIL').AsCurrency;
              end;
              vNivel3.Next;
            end;
            vNivel2.Next;
            FProgressBar.Position := FProgressBar.Position + 1;
          end;
        end;
      end;
      {$ENDREGION}

      {$REGION 'Registro 1600'}
      FLabelStatus.Caption := 'Montando registro 1600';

      vNivel2.Close;
      vNivel2.SQL.Text := 'select cl.cartao_sped_part COD_PART,' +
        ' sum (case when cl.cartao_sped = 1 then fp.valordoc else 0 end) TOT_DEBITO,' +
        ' sum (case when cl.cartao_sped = 2 then fp.valordoc else 0 end) TOT_CREDITO' +
        '  from formpagamento fp' +
        ' inner join controles cl on cl.codigo_ctrl = fp.cod_controle and cl.codigo_emp = fp.cod_empresa' +
        ' where ((cl.cartao_sped = 1) or (cl.cartao_sped = 2)) and fp.cod_empresa = :cod_empresa and' +
        ' fp.data_mov >= :dataIni and fp.data_mov <= :dataFim group by 1';
      vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel2.Open;

      vNivel2.FetchAll;

      FProgressBar.Position := 0;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel2.RecordCount;

      if vNivel2.RecordCount > 0 then
      begin
        FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
             
        vNivel2.First;
        while not vNivel2.Eof do
        begin
          with FSpedF.Bloco_1.Registro1600New do
          begin
            COD_PART := vNivel2.FieldByName('COD_PART').AsString;
            montaRegistro0150(COD_PART);
            TOT_CREDITO := vNivel2.FieldByName('TOT_CREDITO').AsCurrency;
            TOT_DEBITO := vNivel2.FieldByName('TOT_DEBITO').AsCurrency;
          end;
          vNivel2.Next;
          FProgressBar.Position := FProgressBar.Position + 1;
        end;
      end;
      {$ENDREGION}

    end;
  finally
    vNivel2.Close;
    vNivel3.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoC;
var
  vCampoString: AnsiString;
  vIntegerTemp: Integer;
  vBooleanTemp, vOK: Boolean;
  vCurrencyTemp, vCurrencySoma: Currency;
  vStringTemp, vStringTemp2: string;
  vListaTemp, vListaTotalizadores, vListaSumC470, vListaUltimosC490: TStringList;
  I, J, K, L, M, N: Integer;
  vOKST, vBreak, okC170, warningCodigoAjuste: Boolean;
  vSomarST, vMensagemDevolucao: Boolean;
  vTempStr: string;
  AE510: TRegistroE510;
  Advertencia: Boolean;
  Alist: TStringList;
  NumerosNotasFiscais: string;
  valores: TEfd_icmsst_cr_apuracoes_class;
  vrBCICMS, vrVICMS, vrVL_ABAT: Double;
  fieldImposto: CampoImposto;
  qtdeConvertida: Double;
  unidConvertida: string;
  regC195: TRegistroC195;
  regC197: TRegistroC197;
begin
  try
    vMensagemDevolucao := False;
    warningCodigoAjuste := False;
    verificaCamposNuloNF;
    if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao109 then
      verificaICMSInterestadual;
    FSpedF.Bloco_C.RegistroC001.IND_MOV := imSemDados;

    if ExisteNotasPendentes then
    begin
      FStop := True;
      Exit;
    end;

    vListaTemp := TStringList.Create;;
    vListaTemp.Clear;

    vListaTotalizadores := TStringList.Create;;
    vListaTotalizadores.Clear;

    {$REGION 'Nota Fiscal modelos (01, 1A, 04, 55)'}

    if Assigned(Alist) then FreeAndNil(Alist);
    Alist := TStringList.Create;
    TStringList(Alist).Sorted := True;
    TStringList(Alist).Duplicates := dupIgnore;

    FRestComplST.Auditor.listauditoria.Clear;

    FLabelStatus.Caption := 'Processando dados de Restituição/Complemento de ICMS ST';
    Application.ProcessMessages;
    if not RestComplST.CalcularExecutar(Ifthen(FSpedF.Bloco_0.Registro0000.IND_PERFIL = pfPerfilA, 'A', 'B')) then
      if ShowConfirmacao('Continuar mesmo assim?') <> ID_YES then
      begin
        FStop := True;
        Exit;
      end;
    FLabelCupons.Caption := '';

    vStringTemp := '';
    vNivel2.Close;
    vNivel2.SQL.Text := 'select nf.cod_nf, nf.natureza_nf,' +
      ' case when nf.natureza_nf = ''E'' then ''0''' +
      '     else ''1'' end IND_OPER,' +
      ' case when nf.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
      ' else nf.serie end SER, nf.num_nf NUM_DOC, nf.chave_nfe CHV_NFE, nf.data_lanc DT_DOC,' +
      ' nf.data_contabil, nf.data_lanc,' +
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
      ' nf.cod_grupo_tensao, nf.vl_serv, nf.vl_serv_nt, nf.tp_assinante, nf.situacao_nfe,' +
      ' nf.vfcpufdest, nf.vicmsufdest, nf.vicmsufremet ' +
      ' from notafiscal nf' +
      ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
      ' nf.modelo_nf in (''1'',''01'',''1A'',''1-A'',''4'',''04'',''55'')'+
      ' and (nf.da is null or nf.da <> ''S'')';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.Open;

    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;
    if not vNivel2.IsEmpty then
      FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;
    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C100';
      Application.ProcessMessages;

      vrVL_ABAT := 0;
      vBooleanTemp := True;
      if (StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '55') and
        (vNivel2.FieldByName('IND_EMIT').AsString = '0') and
        (Trim(vNivel2.FieldByName('situacao_nfe').AsString) = '') then
      begin
        //Application.MessageBox(pchar('Nota fiscal modelo 55 de número ' + vNivel2.FieldByName('NUM_DOC').AsString + ' não Autorizada'), 'Atenção', 0 + 64);
        vBooleanTemp := False;
      end

      else if (StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '55') and
        (vNivel2.FieldByName('IND_EMIT').AsString = '0') and
        (Trim(vNivel2.FieldByName('situacao_nfe').AsString) = 'A Inutilizar') then
      begin
        //Application.MessageBox(pchar('Nota fiscal modelo 55 de número ' + vNivel2.FieldByName('NUM_DOC').AsString + ' precisa ser Inutilizada'), 'Atenção', 0 + 64);
        vBooleanTemp := False;
      end

      else if (StrToDate(FDataIni) >= EncodeDate(2023, 1, 1)) and
              (MatchText(UpperCase(vNivel2.FieldByName('situacao_nfe').AsString), ['DENEGADA', 'INUTILIZADA'])) then
        vBooleanTemp := False;

      if vBooleanTemp then
      with FSpedF.Bloco_C.RegistroC100New do
      begin
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        if (vNivel2.FieldByName('extemporaneo').AsString = 'S') then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
            COD_SIT := sdCanceladoExtemp
          else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') then
            COD_SIT := sdExtempCompl
          else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '3') then
            COD_SIT := sdRegimeEspecNEsp
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA') then
            COD_SIT := sdExtempRegular
          else
            COD_SIT := sdRegimeEspecNEsp;
        end
        else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
          COD_SIT := sdCancelado
        else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') and
          ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdFiscalCompl
        else if ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdRegular;
        if COD_MOD = '55' then
        begin
          if (UpperCase(vNivel2.FieldByName('situacao_nfe').AsString) = 'DENEGADA') then
            COD_SIT := sdDoctoDenegado
          else if (UpperCase(vNivel2.FieldByName('situacao_nfe').AsString) = 'INUTILIZADA') then
            COD_SIT := sdDoctoNumInutilizada
          else
          begin
            try
              if (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) >= 890) and
                (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) <= 899) then
                COD_SIT := sdRegimeEspecNEsp;
            except
            end;
          end;

        end;

        IND_OPER := StrToTipoOperacao(vNivel2.FieldByName('IND_OPER').AsString);
        IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        SER := Trim(vNivel2.FieldByName('SER').AsString);
        NUM_DOC := vNivel2.FieldByName('NUM_DOC').AsString;
//        if (vNivel2.FieldByName('emissao_propria').AsString) = 'S' then
        if COD_SIT <> sdDoctoNumInutilizada then
          CHV_NFE := Trim(vNivel2.FieldByName('CHV_NFE').AsString);

        vBooleanTemp := False;
        if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada])
          then
        begin
          vBooleanTemp := True;
          montaRegistro0150(vNivel2.FieldByName('COD_PART').AsString);
          if Trim(vNivel2.FieldByName('codigo_tr').AsString) <> '' then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
              (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
              montaRegistro0150(vNivel2.FieldByName('codigo_tr').AsString);
          //CHV_NFE := Trim(vNivel2.FieldByName('CHV_NFE').AsString);
          COD_PART := vNivel2.FieldByName('COD_PART').AsString;
          if (vNivel2.FieldByName('natureza_nf').AsString = 'E') and (not FdataEmissaoIgualDataEntrada) then
            DT_DOC := vNivel2.FieldByName('data_contabil').AsDateTime
          else
            DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;
          if (vNivel2.FieldByName('natureza_nf').AsString = 'E') then
            DT_E_S := vNivel2.FieldByName('data_lanc').AsDateTime
          else
            DT_E_S := vNivel2.FieldByName('DT_E_S').AsDateTime;
          if DT_E_S < DT_DOC then
            DT_E_S := DT_DOC
          else if DT_E_S > StrToDate(FDataFim) then
            DT_E_S := StrToDate(FDataFim);
          VL_DOC := 0;//vNivel2.FieldByName('VL_DOC').AsCurrency;
          if pos('VISTA', UpperCase(vNivel2.FieldByName('IND_PGTO').AsString)) > 0 then
            IND_PGTO := tpVista
          else if pos('SEM PAGAMENTO', UpperCase(vNivel2.FieldByName('IND_PGTO').AsString)) > 0 then
            IND_PGTO := tpSemPagamento
          else IND_PGTO := tpPrazo;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          VL_ABAT_NT := 0;
          VL_MERC := vNivel2.FieldByName('VL_MERC').AsCurrency;
          if vNivel2.FieldByName('IND_FRT').AsString = '0' then
            IND_FRT := tfPorContaTerceiros
          else if vNivel2.FieldByName('IND_FRT').AsString = '1' then
            IND_FRT := tfPorContaEmitente
          else if vNivel2.FieldByName('IND_FRT').AsString = '2' then
            IND_FRT := tfPorContaDestinatario
          else
            IND_FRT := tfSemCobrancaFrete;
          VL_FRT := vNivel2.FieldByName('VL_FRT').AsCurrency;
          VL_SEG := vNivel2.FieldByName('VL_SEG').AsCurrency;
          VL_OUT_DA := vNivel2.FieldByName('VL_OUT_DA').AsCurrency;
          VL_BC_ICMS := 0;//vNivel2.FieldByName('VL_BC_ICMS').AsCurrency;
          VL_ICMS := 0;//vNivel2.FieldByName('VL_ICMS').AsCurrency;
          vrBCICMS := 0;
          vrVICMS := 0;

          if (FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao109) and
             (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
            if (vNivel2.FieldByName('VFCPUFDEST').AsCurrency > 0) or
              (vNivel2.FieldByName('VICMSUFDEST').AsCurrency > 0) or
              (vNivel2.FieldByName('VICMSUFREMET').AsCurrency > 0) then
              with RegistroC101.New do
              begin
                VL_FCP_UF_DEST  := vNivel2.FieldByName('VFCPUFDEST').AsCurrency;
                if vNivel2.FieldByName('TIPO_EMISSAO').AsString <> '4' then
                begin
                  VL_ICMS_UF_DEST := vNivel2.FieldByName('VICMSUFDEST').AsCurrency;
                  VL_ICMS_UF_REM  := vNivel2.FieldByName('VICMSUFREMET').AsCurrency;
                end
                else
                begin
                  vMensagemDevolucao := True;
                  VL_ICMS_UF_DEST := vNivel2.FieldByName('VICMSUFREMET').AsCurrency;
                  VL_ICMS_UF_REM  := vNivel2.FieldByName('VICMSUFDEST').AsCurrency;
                end;
              end;

          vStringTemp :='';
          vOKST := False;
          for L := 0 to FSpedF.Bloco_0.Registro0001.Registro0015.Count - 1 do
          begin
            vStringTemp := getSiglaUFParticipante(vNivel2.FieldByName('COD_PART').AsString);
            if vStringTemp = FSpedF.Bloco_0.Registro0001.Registro0015.Items[L].UF_ST then
            begin
              vOKST := True;
              Break;
            end;
          end;
          if not vOKST then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              vOKST := fefd_icms_desconsiderar_insc_st_apuracao;

          if not vOKST then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'E') then
              if fApurarST then
                vOKST := True;

//          if vOK then
//          begin
//            VL_BC_ICMS_ST := vNivel2.FieldByName('VL_BC_ICMS_ST').AsCurrency;
//            VL_ICMS_ST := vNivel2.FieldByName('VL_ICMS_ST').AsCurrency;
//          end
//          else
//          begin
            VL_BC_ICMS_ST := 0;
            VL_ICMS_ST := 0;
//          end;

//          if (VL_ICMS_ST > 0) and (COD_SIT in [sdExtempRegular, sdExtempCompl]) then
//            somaFDEB_ESP_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS);
          if ConfUnif.Ativo then
          else
          if fStIpiEmMerc then
          else
          if (fApurarIPI) and (fApurarStIpiEmOutDesp <> 'S') then
            VL_IPI := vNivel2.FieldByName('VL_IPI').AsCurrency;

          vNivel3.Close;
          vNivel3.SQL.Text :=
            'select sum(valor_pis) VL_PIS, sum(valor_cofins) VL_COFINS from notafiscal_item nfi'+
            ' where nfi.cod_nf = '+vNivel2.FieldByName('cod_nf').AsString+
            ' and nfi.cod_empresa = '+FCodEmpresa;
          vNivel3.Open;
          VL_PIS := vNivel3.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsCurrency;

          VL_PIS_ST := vNivel2.FieldByName('VL_PIS_ST').AsCurrency;
          VL_COFINS_ST := vNivel2.FieldByName('VL_COFINS_ST').AsCurrency;
        end;


        if vBooleanTemp then
        begin

          if (vNivel2.FieldByName('emissao_propria').AsString = 'S') and
            (vNivel2.FieldByName('cod_mod').AsString = '55') then
          else
          begin
            vNivel3.Close;
            vNivel3.SQL.Text := 'select c110.cod_inf, spc.txt, c110.txt_compl from' +
              ' notafiscal_sped_c110 c110 inner join sped_informacao_complementar spc on' +
              ' spc.cod_inf = c110.cod_inf and spc.cod_empresa = c110.cod_empresa' +
              ' where c110.cod_nf = :cod_nf and c110.cod_empresa = :cod_empresa' +
              ' order by c110.cod_inf';
            vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
            vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.Open;

            vNivel3.First;
            while not vNivel3.Eof do
            begin
              montaRegistro0450(vNivel3.FieldByName('cod_inf').AsInteger,
                vNivel3.FieldByName('txt').AsString);
              //      vCampoString := getCampoBlobString(vNivel3.FieldByName('txt').AsString);
              //      with FSpedF.Bloco_0.Registro0450New do
              //      begin
              //        COD_INF := vNivel3.FieldByName('cod_inf').AsString;
              //        TXT := vCampoString;
              //      end;

              vCampoString := Trim(getCampoBlobString(vNivel3.FieldByName('txt_compl').AsString));
              with FSpedF.Bloco_C.RegistroC110New do
              begin
                COD_INF := vNivel3.FieldByName('cod_inf').AsString;
                TXT_COMPL := vCampoString;
              end;

              vNivel4.Close;
              vNivel4.SQL.Text := 'select c111.cod_inf, c111.num_proc, c111.ind_proc' +
                ' from notafiscal_sped_c111 c111 where c111.cod_nf = :cod_nf and' +
                ' c111.cod_empresa = :cod_empresa and c111.cod_inf = :cod_inf';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              while not vNivel4.Eof do
              begin
                with FSpedF.Bloco_C.RegistroC111New do
                begin
                  NUM_PROC := vNivel4.FieldByName('NUM_PROC').AsString;
                  IND_PROC := StrToOrigemProcesso(vNivel4.FieldByName('IND_PROC').AsString);
                end;
                vNivel4.Next;
              end;

              vNivel4.Close;
              vNivel4.SQL.Text :=
                'select c112.cod_inf, c112.cod_da, c112.uf, c112.num_da, c112.cod_aut,'
                +
                ' c112.vl_da, c112.dt_vcto, c112.dt_pgto' +
                ' from notafiscal_sped_c112 c112 where c112.cod_nf = :cod_nf and' +
                ' c112.cod_empresa = :cod_empresa and c112.cod_inf = :cod_inf';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              while not vNivel4.Eof do
              begin
                with FSpedF.Bloco_C.RegistroC112New do
                begin
                  if vNivel4.FieldByName('COD_DA').AsString = '0' then
                    COD_DA := daEstadualArrecadacao
                  else
                    COD_DA := daGNRE;
                  UF := vNivel4.FieldByName('UF').AsString;
                  NUM_DA := vNivel4.FieldByName('NUM_DA').AsString;
                  COD_AUT := vNivel4.FieldByName('COD_AUT').AsString;
                  VL_DA := vNivel4.FieldByName('VL_DA').AsCurrency;
                  DT_VCTO := vNivel4.FieldByName('DT_VCTO').AsDateTime;
                  DT_PGTO := vNivel4.FieldByName('DT_PGTO').AsDateTime;

                end;
                vNivel4.Next;
              end;

              vNivel4.Close;
              vNivel4.SQL.Text := 'select nf.cod_nf,' +
                ' case when nf.natureza_nf = ''E'' then ''0''' +
                '     else ''1'' end IND_OPER,' +
                ' case when nf.natureza_nf = ''S'' then ''0''' +
                '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
                ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
                ' else nf.serie end SER, nf.subserie SUB, nf.num_nf NUM_DOC, nf.data_lanc DT_DOC,' +
                ' nf.data_contabil, nf.data_lanc,' +
                ' nf.chave_nfe, c113.chave_nfe_ref' +
                ' from notafiscal_sped_c113 c113' +
                ' inner join notafiscal nf on nf.cod_nf = c113.cod_nf_ref and nf.cod_empresa =' +
                ' c113.cod_empresa' +
                ' where c113.cod_nf = :cod_nf and c113.cod_empresa = :cod_empresa and' +
                ' c113.cod_inf = :cod_inf';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              while not vNivel4.Eof do
              begin
                with FSpedF.Bloco_C.RegistroC113New do
                begin
                  if vNivel4.FieldByName('IND_OPER').AsString = '0' then
                    IND_OPER := tpEntradaAquisicao
                  else
                    IND_OPER := tpSaidaPrestacao;
                  if vNivel4.FieldByName('IND_EMIT').AsString = '0' then
                    IND_EMIT := edEmissaoPropria
                  else
                    IND_EMIT := edTerceiros;
                  COD_PART := vNivel4.FieldByName('COD_PART').AsString;
                  COD_MOD := StrZero(vNivel4.FieldByName('COD_MOD').AsString, 2);
                  SER := vNivel4.FieldByName('SER').AsString;
                  SUB := vNivel4.FieldByName('SUB').AsString;
                  NUM_DOC := vNivel4.FieldByName('NUM_DOC').AsString;
                  DT_DOC := vNivel4.FieldByName('data_contabil').AsDateTime;
                  CHV_DOCe := Trim(vNivel4.FieldByName('chave_nfe').AsString);
                  if Trim(CHV_DOCe) = '' then
                    CHV_DOCe := Trim(vNivel4.FieldByName('chave_nfe_ref').AsString);
                end;
                vNivel4.Next;
              end;

              vNivel4.Close;
              vNivel4.SQL.Text :=
                'select c114.cod_inf, c114.ecf_fab, c114.num_doc,c114.dt_doc, c114.ecf_cx,'
                +
                ' c114.cod_mod' +
                ' from notafiscal_sped_c114 c114 where c114.cod_nf = :cod_nf and' +
                ' c114.cod_empresa = :cod_empresa and c114.cod_inf = :cod_inf';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              while not vNivel4.Eof do
              begin
                with FSpedF.Bloco_C.RegistroC114New do
                begin
                  COD_MOD := StrZero(vNivel4.FieldByName('COD_MOD').AsString, 2);
                  ECF_FAB := vNivel4.FieldByName('ECF_FAB').AsString;
                  ECF_CX := vNivel4.FieldByName('ECF_CX').AsString;
                  NUM_DOC := vNivel4.FieldByName('NUM_DOC').AsString;
                  DT_DOC := vNivel4.FieldByName('DT_DOC').AsDateTime;
                end;
                vNivel4.Next;
              end;
              //C115
              if (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
              begin
                vNivel4.Close;
                vNivel4.SQL.Text := 'select c115.ind_carga, c115.cnpj_col, c115.ie_col, c115.cpf_col,'
                  +
                  ' c115.cod_mun_col, c115.cnpj_entg, c115.ie_entg, c115.cpf_entg,' +
                  ' c115.cod_mun_entg from notafiscal_sped_c115 c115' +
                  ' where c115.cod_nf = :cod_nf and' +
                  ' c115.cod_empresa = :cod_empresa and c115.cod_inf = :cod_inf';
                vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
                vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
                vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vNivel4.Open;
                while not vNivel4.Eof do
                begin
                  with FSpedF.Bloco_C.RegistroC115New do
                  begin
                    IND_CARGA := StrToTipoTransporte(vNivel4.FieldByName('IND_CARGA').AsString);
                    CNPJ_COL := Trim(vNivel4.FieldByName('CNPJ_COL').AsString);
                    IE_COL := vNivel4.FieldByName('IE_COL').AsString;
                    CPF_COL := Trim(vNivel4.FieldByName('CPF_COL').AsString);
                    COD_MUN_COL := vNivel4.FieldByName('COD_MUN_COL').AsString;
                    CNPJ_ENTG := Trim(vNivel4.FieldByName('CNPJ_ENTG').AsString);
                    IE_ENTG := vNivel4.FieldByName('IE_ENTG').AsString;
                    CPF_ENTG := Trim(vNivel4.FieldByName('CPF_ENTG').AsString);
                    COD_MUN_ENTG := vNivel4.FieldByName('COD_MUN_ENTG').AsString;
                  end;
                  vNivel4.Next;
                end;
              end;
              vNivel3.Next;
            end;

          end;

          if vNivel2.FieldByName('natureza_nf').AsString = 'E' then
          begin
            vNivel3.Close;
            vNivel3.SQL.Text :=
              'select c120.num_doc_imp, c120.num_acdraw, c120.cod_doc_imp, c120.pis_imp,'
              +
              ' c120.cofins_imp from notafiscal_sped_c120 c120 where c120.cod_nf = :cod_nf and' +
              ' c120.cod_empresa = :cod_empresa';
            vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
            vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.Open;

            while not vNivel3.Eof do
            begin
              with FSpedF.Bloco_C.RegistroC120New do
              begin
                if vNivel3.FieldByName('COD_DOC_IMP').AsString = '0' then
                  COD_DOC_IMP := diImportacao
                else
                  COD_DOC_IMP := diSimplificadaImport;
                NUM_DOC__IMP := vNivel3.FieldByName('NUM_DOC_IMP').AsString;
//                PIS_IMP := vNivel3.FieldByName('PIS_IMP').AsCurrency;
//                COFINS_IMP := vNivel3.FieldByName('COFINS_IMP').AsCurrency;
                NUM_ACDRAW := vNivel3.FieldByName('NUM_ACDRAW').AsString;
              end;
              vNivel3.Next;
            end;
          end;

          if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
            (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
          begin
            with FSpedF.Bloco_C.RegistroC130New do
            begin
              VL_SERV_NT := vNivel2.FieldByName('VL_SERV_NT').AsCurrency;
              VL_BC_ISSQN := vNivel2.FieldByName('VL_BC_ISSQN').AsCurrency;
              VL_ISSQN := vNivel2.FieldByName('VL_ISSQN').AsCurrency;
              VL_BC_IRRF := vNivel2.FieldByName('VL_BC_IRRF').AsCurrency;
              VL_IRRF := vNivel2.FieldByName('VL_IRRF').AsCurrency;
              VL_BC_PREV := vNivel2.FieldByName('VL_BC_PREV').AsCurrency;
              VL_PREV := vNivel2.FieldByName('VL_PREV').AsCurrency;
            end;
          end;
          if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
            (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
          begin
            verificaFormasPagS(vNivel2.FieldByName('NUM_DOC').AsInteger,
              vNivel2.FieldByName('DT_DOC').AsString,
              Trim(vNivel2.FieldByName('SER').AsString));
            vNivel3.close;
            vNivel3.SQL.Text := 'select cn.ind_tit, cn.nome_ctrl DESC_TIT,' +
              ' case when (( not fp.rec_tipvend is null) and (fp.rec_numvend > 0)) then fp.rec_numvend' +
              '   else fp.nrequisicao' +
              ' end NUM_TIT,' +
              ' fp.cod_controle, fp.tipdoc, fp.rec_tipvend,  fp.rec_numvend, ''S'' nat,' +
              ' count(fp.nrequisicao) QTD_PARC, sum(fp.valordoc) VL_TIT' +
              ' from formpagamento fp' +
              ' inner join controles cn on cn.codigo_ctrl = fp.cod_controle and' +
              ' cn.codigo_emp = fp.cod_empresa' +
              ' where fp.num_nota = :num_nfV and sub_serie = :sub_serieV and' +
              ' cod_empresa = :cod_empresa and fp.tpdocs <> ''LCS'' and fp.tpdocs <> ''REC''' +
              ' group by 1, 2, 3, 4, 5, 6, 7 , 8';
            vNivel3.ParamByName('num_nfV').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
            try
              vNivel3.ParamByName('sub_serieV').AsInteger :=
                StrToInt(Trim(vNivel2.FieldByName('SER').AsString));
              vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel3.Open;
            except
            end;

            while not vNivel3.Eof do //if not vNivel3.IsEmpty then
            begin
              if Trim(vNivel3.FieldByName('rec_tipvend').AsString) = 'REC' then
              begin
                vQrAux.Close;
                vQrAux.SQL.Text := 'select cn.ind_tit, cn.nome_ctrl DESC_TIT, fp.nrequisicao NUM_TIT,'
                  +
                  ' fp.cod_controle, fp.tipdoc,' +
                  ' count(fp.nrequisicao) QTD_PARC, sum(fp.valordoc) VL_TIT' +
                  ' from formpagamento fp' +
                  ' inner join controles cn on cn.codigo_ctrl = fp.cod_controle and' +
                  ' cn.codigo_emp = fp.cod_empresa' +
                  ' where fp.nrequisicao = :nrecibo and fp.tpdocs = ''REC'' and' +
                  ' cod_empresa = :cod_empresa and fp.tpdocs <> ''LCS''' +
                  ' group by 1, 2, 3, 4, 5';
                vQrAux.ParamByName('nrecibo').AsInteger := vNivel3.FieldByName('num_tit').AsInteger;
                vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vQrAux.Open;
                if not vQrAux.IsEmpty then
                begin
                  vQrAux.First;
                  while not vQrAux.Eof do
                  begin
                    with FSpedF.Bloco_C.RegistroC140New do
                    begin
                      IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
                      IND_TIT := StrToTipoTitulo(vQrAux.FieldByName('IND_TIT').AsString);
                      if IND_TIT = tcOutros then
                        DESC_TIT := Trim(vQrAux.FieldByName('DESC_TIT').AsString);
                      NUM_TIT := Trim(vQrAux.FieldByName('NUM_TIT').AsString);
                      QTD_PARC := vQrAux.FieldByName('QTD_PARC').AsInteger;
                      VL_TIT := vQrAux.FieldByName('VL_TIT').AsCurrency;
                    end;
                    vNivel4.Close;
                    vNivel4.SQL.Text := 'select  FP.data_venc DT_VCTO, fp.valordoc VL_PARC' +
                      ' from formpagamento fp' +
                      ' inner join controles cn on cn.codigo_ctrl = fp.cod_controle and cn.codigo_emp = fp.cod_empresa' +
                      ' where fp.nrequisicao = :nrequisicao and cod_empresa = :cod_empresa and' +
                      ' fp.cod_controle = :cod_controle and fp.tipdoc = :tipdoc';
                    try
                      vNivel4.ParamByName('nrequisicao').AsInteger :=
                        vQrAux.FieldByName('NUM_TIT').AsInteger;
                      vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                      vNivel4.ParamByName('cod_controle').AsInteger :=
                        vQrAux.FieldByName('cod_controle').AsInteger;
                      vNivel4.ParamByName('tipdoc').AsString :=
                        Trim(vQrAux.FieldByName('tipdoc').AsString);
                      vNivel4.Open;
                    except
                    end;
                    vNivel4.First;
                    vIntegerTemp := 0;
                    while not vNivel4.Eof do
                    begin
                      inc(vIntegerTemp);
                      with FSpedF.Bloco_C.RegistroC141New do
                      begin
                        NUM_PARC := StrZero(IntToStr(vIntegerTemp), 2);
                        if (vNivel4.FieldByName('DT_VCTO').AsString <> '') and
                          (vNivel4.FieldByName('DT_VCTO').AsDateTime >=
                          vNivel2.FieldByName('DT_DOC').AsDateTime) then
                          DT_VCTO := vNivel4.FieldByName('DT_VCTO').AsDateTime
                        else
                          DT_VCTO := vNivel2.FieldByName('DT_DOC').AsDateTime;
                        VL_PARC := vNivel4.FieldByName('VL_PARC').AsCurrency;
                      end;
                      vNivel4.Next;
                    end;
                    vQrAux.Next;
                  end;

                end;
              end
              else
              begin
                with FSpedF.Bloco_C.RegistroC140New do
                begin
                  IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
                  IND_TIT := StrToTipoTitulo(vNivel3.FieldByName('IND_TIT').AsString);
                  if IND_TIT = tcOutros then
                    DESC_TIT := Trim(vNivel3.FieldByName('DESC_TIT').AsString);
                  NUM_TIT := Trim(vNivel3.FieldByName('NUM_TIT').AsString);
                  QTD_PARC := vNivel3.FieldByName('QTD_PARC').AsInteger;
                  VL_TIT := vNivel3.FieldByName('VL_TIT').AsCurrency;
                end;
                vNivel4.Close;
                vNivel4.SQL.Text := 'select  FP.data_venc DT_VCTO, fp.valordoc VL_PARC' +
                  ' from formpagamento fp' +
                  ' inner join controles cn on cn.codigo_ctrl = fp.cod_controle and' +
                  ' cn.codigo_emp = fp.cod_empresa' +
                  ' where fp.num_nota = :num_nf and sub_serie = :sub_serie and' +
                  ' cod_empresa = :cod_empresa and fp.nrequisicao = :nrequisicao and' +
                  ' fp.cod_controle = :cod_controle and cn.ind_tit = :ind_tit and' +
                  ' fp.tipdoc = :tipdoc and ((fp.rec_tipvend <> ''REC'') or (fp.rec_tipvend is null))';
                vNivel4.ParamByName('num_nf').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
                try
                  vNivel4.ParamByName('sub_serie').AsInteger :=
                    StrToInt(Trim(vNivel2.FieldByName('SER').AsString));
                  vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                  vNivel4.ParamByName('nrequisicao').AsInteger :=
                    vNivel3.FieldByName('NUM_TIT').AsInteger;
                  vNivel4.ParamByName('cod_controle').AsInteger :=
                    vNivel3.FieldByName('cod_controle').AsInteger;
                  vNivel4.ParamByName('ind_tit').AsString :=
                    Trim(vNivel3.FieldByName('ind_tit').AsString);
                  vNivel4.ParamByName('tipdoc').AsString :=
                    Trim(vNivel3.FieldByName('tipdoc').AsString);
                  vNivel4.Open;
                except
                end;
                vNivel4.Open;
                vNivel4.First;
                vIntegerTemp := 0;
                while not vNivel4.Eof do
                begin
                  inc(vIntegerTemp);
                  with FSpedF.Bloco_C.RegistroC141New do
                  begin
                    NUM_PARC := StrZero(IntToStr(vIntegerTemp), 2);
                    if (vNivel4.FieldByName('DT_VCTO').AsString <> '') and
                      (vNivel4.FieldByName('DT_VCTO').AsDateTime >=
                      vNivel2.FieldByName('DT_DOC').AsDateTime) then
                      DT_VCTO := vNivel4.FieldByName('DT_VCTO').AsDateTime
                    else
                      DT_VCTO := vNivel2.FieldByName('DT_DOC').AsDateTime;
                    VL_PARC := vNivel4.FieldByName('VL_PARC').AsCurrency;
                  end;
                  vNivel4.Next;
                end;
              end; //else
              vNivel3.Next;
            end; //While
          end
          else if (vNivel2.FieldByName('COD_MOD').AsString <> '55') then //natureza_nf = 'E'
          begin
            vNivel3.Close;
            vNivel3.SQL.Text := 'select ''01'' IND_TIT, cap.num_nota_nfe||''-''||cap.serie NUM_TIT,' +
              ' case when ((cap.n_doc_ctp_orig is null) or (ltrim(rtrim(cap.n_doc_ctp_orig)) = '''')) then cap.n_doc_ctp' +
              '   else cap.n_doc_ctp_orig' +
              ' end n_doc_ctp, cap.data_venc_ctp DT_VCTO, sum(cap.valor_ctp) VL_PARC, count(cap.cod_contrp)' +
              ' from contas_a_pagar cap where cap.num_nota_nfe = :num_nf and cap.serie = :serie' +
              ' and cap.cod_forn_nfe = :cod_forn_nfe and cap.codigo_emp = :cod_empresa group by 1, 2, 3, 4';
            vNivel3.ParamByName('num_nf').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
            vNivel3.ParamByName('SERIE').AsString := vNivel2.FieldByName('SER').AsString;
            vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.ParamByName('cod_forn_nfe').AsInteger :=
              vNivel2.FieldByName('cod_part').AsInteger;
            vNivel3.Open;
            vNivel3.First;
            vCurrencyTemp := 0;
            vIntegerTemp := 0;
            while not vNivel3.Eof do
            begin
              if pos('F', vNivel3.FieldByName('n_doc_ctp').AsString) = 0 then
              begin
                Inc(vIntegerTemp);
                vCurrencyTemp := vCurrencyTemp + vNivel3.FieldByName('VL_PARC').AsCurrency;
              end;
              vNivel3.Next;
            end;

            if vCurrencyTemp > 0 then
            begin
              with FSpedF.Bloco_C.RegistroC140New do
              begin
                IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
                IND_TIT := StrToTipoTitulo(vNivel3.FieldByName('IND_TIT').AsString);
                NUM_TIT := Trim(vNivel3.FieldByName('NUM_TIT').AsString);
                QTD_PARC := vIntegerTemp;
                VL_TIT := vCurrencyTemp;
              end;

              vNivel3.First;
              vIntegerTemp := 0;
              while not vNivel3.Eof do
              begin
                if pos('F', vNivel3.FieldByName('n_doc_ctp').AsString) = 0 then
                begin
                  inc(vIntegerTemp);
                  with FSpedF.Bloco_C.RegistroC141New do
                  begin
                    NUM_PARC := StrZero(IntToStr(vIntegerTemp), 2);
                    if (vNivel3.FieldByName('DT_VCTO').AsString <> '') and
                      (vNivel3.FieldByName('DT_VCTO').AsDateTime >=
                      vNivel2.FieldByName('DT_DOC').AsDateTime) then
                      DT_VCTO := vNivel3.FieldByName('DT_VCTO').AsDateTime
                    else
                      DT_VCTO := vNivel2.FieldByName('DT_DOC').AsDateTime;
                    VL_PARC := vNivel3.FieldByName('VL_PARC').AsCurrency;
                  end;
                end;
                vNivel3.Next;
              end;
            end;
          end;

          if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
            (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
          begin
            if Trim(vNivel2.FieldByName('codigo_tr').AsString) <> '' then
              with FSpedF.Bloco_C.RegistroC160New do
              begin
                COD_PART := vNivel2.FieldByName('codigo_tr').AsString;
                VEIC_ID := vNivel2.FieldByName('VEIC_ID').AsString;
                QTD_VOL := vNivel2.FieldByName('QTD_VOL').AsInteger;
                PESO_BRT := vNivel2.FieldByName('PESO_BRT').AsFloat;
                PESO_LIQ := vNivel2.FieldByName('PESO_LIQ').AsFloat;
                UF_ID := vNivel2.FieldByName('UF_ID').AsString;
              end;
          end;

          if (RestComplST.Gerar) then
            okC170 := True
          else
            okC170 := not ((vNivel2.FieldByName('emissao_propria').AsString = 'S') and
                           (vNivel2.FieldByName('cod_mod').AsString = '55'));
          if okC170 then
          begin
            vNivel3.Close;
            vNivel3.SQL.Text :=
              'select nfi.nitem NUM_ITEM, nfi.tipo_item , nfi.grupo_prod, nfi.cod_prod,' +
              ' nfi.cod_servico, nfi.chassi,  nfi.num_fab_prod, nfi.descricao_item DESCR_COMPL,' +
              ' nfi.descricao_item_outras, nfi.quantidade QTD, nfi.referencia UNID,' +
              ' nfi.valor_total VL_ITEM, nfi.rateio_desconto VL_DESC, nfi.IND_MOV, nfi.altera_estoque_cfop,' +
              ' case when (nfi.tipo_item = ''S'') then ''041''' +
              '   else nfi.cst' +
              ' end CST_ICMS, nfi.codigo_nop CFOP, nfi.codigo_nop COD_NAT,' +
              ' nfi.base_icm VL_BC_ICMS, nfi.aliq_icm ALIQ_ICMS, nfi.valor_icm VL_ICMS,' +
              ' nfi.base_icmsub VL_BC_ICMS_ST, nfi.aliq_icmsub ALIQ_ST,' +
              ' nfi.valor_icmsub VL_ICMS_ST, e.ind_apur_ipi IND_APUR, nfi.cst_ipi, '''' COD_ENQ,' +
              ' iif(nfi.antec_trib = ''S'', 0, nfi.valor_icmsub) ST_VALOR,' +
              ' iif(nfi.antec_trib = ''S'', 0, nfi.base_icmsub) ST_BC,' +
              ' iif(nfi.antec_trib = ''S'', 0, nfi.aliq_icmsub) ST_ALIQ,' +
              ' iif(nfi.antec_trib = ''S'', 0, nfi.fcp_vfcpst) ST_FCP_VALOR,' +
              ' iif(nfi.antec_trib = ''S'', 0, nfi.fcp_pfcpst) ST_FCP_ALIQ,' +
              ' nfi.base_ipi VL_BC_IPI, nfi.aliq_ipi ALIQ_IPI, nfi.valor_ipi VL_IPI,' +
              ' nfi.cst_pis,' +
              ' nfi.base_pis VL_BC_PIS, nfi.aliq_pis, nfi.quant_bc_pis, nfi.aliq_pis_quant ALIQ_PIS1,' +
              ' nfi.valor_pis VL_PIS, nfi.cst_cofins,' +
              ' nfi.base_cofins VL_BC_COFINS, nfi.aliq_cofins, nfi.quant_bc_cofins, nfi.aliq_cofins_quant ALIQ_COFINS1,' +
              ' nfi.valor_cofins VL_COFINS, nfi.BASE_ISS VL_BC_ISSQN, nfi.ALIQ_ISS ALIQ_ISSQN,' +
              ' nfi.VALOR_ISS VL_ISSQN, npc.COD_CTA, nfi.antec_trib, nfi.nfe_vipidevol, nfi.fcp_vfcpst,' +
              ' nfi.fcp_vfcp, nfi.fcp_pfcp, nfi.fcp_pfcpst, nfi.nfe_pdevol,' +
              ' nfi.ucom, nfi.qcom, nfi.unidade_nf, nfi.qtdembrec,' +
              ' (coalesce(nfi.vpisdeson, 0) + coalesce(nfi.vcofinsdeson, 0) + iif(nf.totais_com_deson = ''N'', 0, coalesce(nfi.vicmdeson, 0))) VL_ABAT_NT,' +
              ' pr.unidade unid_inv, nf.import_xml' +
              ' from notafiscal_item nfi' +
              ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
              ' inner join empresa e on e.cod_empresa = nfi.cod_empresa' +
              ' left join nat_op_p_contas_contabil npc on npc.codigo_nop = nfi.codigo_nop and npc.cod_empresa = nfi.cod_empresa' +
              ' left join produtos pr on pr.grupo_prod = nfi.grupo_prod and pr.cod_prod = nfi.cod_prod and pr.cod_empresa = nfi.cod_empresa' +
              ' where nfi.cod_nf = :cod_nf and' +
              ' nfi.cod_empresa = :cod_empresa order by nfi.nitem';
            vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
            vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.Open;

            vNivel3.First;
            while not vNivel3.Eof do
            begin
              /// Para cada registro C100, obrigatoriamente deve ser apresentado, pelo menos, um registro C170 e um registro C190
              ///  Exceção 2: Notas Fiscais Eletrônicas - NF-e de emissão própria: regra geral, devem ser apresentados somente os registros C100 e C190
              ///  ...;somente será admitida a informação do registro C170 quando também houver sido informado o registro C176, C180, C181 ou o Registro C177
              if (RestComplST.Gerar) and
                 (RestComplST.ExistsC180C181(vNivel2.FieldByName('cod_nf').AsInteger,
                                             vNivel3.FieldByName('NUM_ITEM').AsInteger)) then
                okC170 := True
              else
                okC170 := not ((vNivel2.FieldByName('emissao_propria').AsString = 'S') and
                               (vNivel2.FieldByName('cod_mod').AsString = '55'));

              if okC170 then
              begin
                with FSpedF.Bloco_C.RegistroC170New do
                begin
                  NUM_ITEM := vNivel3.FieldByName('NUM_ITEM').AsString;

                  // Se for produto vai sobreescrever logo abaixo, unid = referencia
                  UNID := IfEmpty(vNivel3.FieldByName('unid').AsString.ToUpper.Trim, 'UN');
                  QTD := vNivel3.FieldByName('qtd').AsFloat;

                  if vNivel3.FieldByName('tipo_item').AsString = 'P' then
                  begin
                    COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                      Trim(vNivel3.FieldByName('cod_prod').AsString), 16);

                    gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                      vNivel3.FieldByName('grupo_prod').AsInteger,
                      vNivel3.FieldByName('cod_prod').AsString, '', 0, '',
                      vNivel3.FieldByName('unid_inv').AsString.ToUpper.Trim);

                    if (qryLvl3.fstr('import_xml') >= strNfDataVersion)  then
                    begin
                      if (not qryLvl3.fempty('unidade_nf')) and (qryLvl3.ffloat('qtdembrec') > 0)  then
                      begin
                        qtdeConvertida := qryLvl3.ffloat('qtdembrec');
                        unidConvertida := qryLvl3.fstr('unidade_nf');
                      end
                      else
                      begin
                        qtdeConvertida := qryLvl3.ffloat('qtd');
                        unidConvertida := qryLvl3.fstr('unid');
                      end;
                    end
                    else
                    begin
                      if (not qryLvl3.fempty('ucom')) and (qryLvl3.ffloat('qcom') > 0)  then
                      begin
                        qtdeConvertida := qryLvl3.ffloat('qcom');
                        unidConvertida := qryLvl3.fstr('ucom');
                      end
                      else
                      begin
                        qtdeConvertida := qryLvl3.ffloat('qtd');
                        unidConvertida := qryLvl3.fstr('unid');
                      end;
                    end;

                    QTD  := qtdeConvertida;
                    UNID := unidConvertida;

                    Produtos.AddProduto(vNivel3.FieldByName('grupo_prod').AsInteger,
                                        vNivel3.FieldByName('cod_prod').AsString,
                                        vNivel3.FieldByName('unid_inv').AsString.ToUpper.Trim,
                                        unidConvertida,
                                        qryLvl3.ffloat('qtd'),
                                        qtdeConvertida);
                  end
                  else if vNivel3.FieldByName('tipo_item').AsString = 'S' then
                  begin
                    COD_ITEM := 'S' + StrZero(vNivel3.FieldByName('cod_servico').AsString, 16);

                    gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                      0, '', '', vNivel3.FieldByName('cod_servico').AsInteger, '', UNID);
                  end
                  else if vNivel3.FieldByName('tipo_item').AsString = 'V' then
                  begin
                    COD_ITEM := StrZero(vNivel3.FieldByName('chassi').AsString, 17);

                    gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                      0, '', vNivel3.FieldByName('chassi').AsString,
                      0, '', UNID);
                  end
                  else if vNivel3.FieldByName('tipo_item').AsString = 'O' then
                  begin
                    COD_ITEM := 'O' + StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel3.FieldByName('NUM_ITEM').AsString, 3);

                    gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                      0, '', '', 0, ('O' +
                      StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel3.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                  end
                  else if vNivel3.FieldByName('tipo_item').AsString = 'D' then
                  begin
                    COD_ITEM := 'D' + StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel3.FieldByName('NUM_ITEM').AsString, 3);

                    gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                      0, '', '', 0, ('D' +
                      StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel3.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                  end;
                  if vNivel3.FieldByName('tipo_item').AsString = 'O' then
                    DESCR_COMPL :=
                      getCampoBlobString(vNivel3.FieldByName('descricao_item_outras').AsString)
                  else
                    DESCR_COMPL := vNivel3.FieldByName('DESCR_COMPL').AsString;
                  DESCR_COMPL := DESCR_COMPL.Replace('|', '');
                  VL_ITEM := RoundTo(vNivel3.FieldByName('VL_ITEM').AsCurrency, -2);
                  VL_DESC := RoundTo(vNivel3.FieldByName('VL_DESC').AsCurrency, -2);
                  VL_ABAT_NT := RoundTo(vNivel3.FieldByName('VL_ABAT_NT').AsCurrency, -2);
                  IND_MOV :=
                    StrToMovimentacaoFisica(IntToStr(vNivel3.FieldByName('IND_MOV').AsInteger));
                  CST_ICMS := vNivel3.FieldByName('CST_ICMS').AsString;
                  CFOP := vNivel3.FieldByName('CFOP').AsString;
                  COD_NAT := vNivel3.FieldByName('COD_NAT').AsString;
                  montaRegistro0400(COD_NAT);
                  if not MatchText(CFOP, ['5929', '6929']) then
                  begin
                    VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsFloat;
                    ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat +
                                 vNivel3.FieldByName('fcp_pfcp').AsFloat;
                    VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsFloat +
                                                vNivel3.FieldByName('fcp_vfcp').AsFloat,2);
                    vrBCICMS := vrBCICMS + VL_BC_ICMS;
                    vrVICMS := vrVICMS + VL_ICMS;
                  end;

                  vStringTemp :='';
  //                vOK := False;
  //                for L := 0 to FSpedF.Bloco_0.Registro0001.Registro0015.Count - 1 do
  //                begin
  //                  vStringTemp := getUFParticipante(vNivel2.FieldByName('COD_PART').AsString);
  //                  if vStringTemp = FSpedF.Bloco_0.Registro0001.Registro0015.Items[L].UF_ST then
  //                  begin
  //                    vOK := True;
  //                    Break;
  //                  end;
  //                end;

                  if ConfUnif.Ativo then
                  begin
                    //ST
                    if vNivel2.FieldByName('emissao_propria').AsString = 'S'  then
                      fieldImposto := ConfUnif.ConfST.EmissaoPropria
                    else
                      fieldImposto := ConfUnif.ConfST.EmissaoTerceiro;

                    case fieldImposto of

                      csCampoVlMerc: begin
                        VL_ITEM := VL_ITEM + vNivel3.FieldByName('ST_VALOR').AsFloat + vNivel3.FieldByName('ST_FCP_VALOR').AsFloat;
                        VL_MERC := VL_MERC + vNivel3.FieldByName('ST_VALOR').AsFloat + vNivel3.FieldByName('ST_FCP_VALOR').AsFloat;
                      end;

                      csCamposProprios: begin
                        if MatchStr(CST_ICMS.Substring(1,1), ['1','3','7','6','9']) then
                        begin
                          VL_BC_ICMS_ST := vNivel3.FieldByName('ST_BC').AsFloat;
                          VL_ICMS_ST := vNivel3.FieldByName('ST_VALOR').AsFloat + vNivel3.FieldByName('ST_FCP_VALOR').AsFloat;
                          ALIQ_ST := vNivel3.FieldByName('ST_ALIQ').AsFloat + vNivel3.FieldByName('ST_FCP_ALIQ').AsFloat;
                        end;
                      end;
                      csCampoOutros: ;
                    end;

                    //IPI
                    fieldImposto := ConfUnif.ConfIPI.GetCampoImposto(
                      vNivel2.FieldByName('emissao_propria').AsString = 'S',
                      vNivel3.FieldByName('CFOP').AsInteger);
                    {
                    if vNivel2.FieldByName('emissao_propria').AsString = 'S'  then
                      fieldImposto := ConfUnif.ConfIPI.EmissaoPropria
                    else
                      fieldImposto := ConfUnif.ConfIPI.EmissaoTerceiro;
                      }

                    case fieldImposto of
                      csCampoVlMerc: begin
                        VL_ITEM := VL_ITEM + vNivel3.FieldByName('VL_IPI').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat;
                        VL_MERC := VL_MERC + vNivel3.FieldByName('VL_IPI').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat;
                      end;

                      csCamposProprios: begin
                        IND_APUR := StrToApuracaoIPI(IntToStr(vNivel3.FieldByName('IND_APUR').AsInteger));
                        COD_ENQ := Trim(vNivel3.FieldByName('COD_ENQ').AsString);
                        VL_BC_IPI := vNivel3.FieldByName('VL_BC_IPI').AsFloat;
                        ALIQ_IPI := vNivel3.FieldByName('ALIQ_IPI').AsFloat + vNivel3.FieldByName('nfe_pdevol').AsFloat;
                        VL_IPI := vNivel3.FieldByName('VL_IPI').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat;

                        if Trim(vNivel3.FieldByName('CST_IPI').AsString) <> '' then
                          CST_IPI := vNivel3.FieldByName('CST_IPI').AsString
                        else
                          CST_IPI := IfThen(vNivel2.FieldByName('natureza_nf').AsString = 'S', '5', '0') +
                                     IfThen(VL_IPI > 0, '0', '2');
                      end;

                      csCampoOutros: ;
                    end;

                  end
                  else
                  if fStIpiEmMerc then
                  begin
                    if Trim(vNivel3.FieldByName('antec_trib').AsString) <> 'S'  then
                    begin
                      VL_ITEM := VL_ITEM + vNivel3.FieldByName('VL_ICMS_ST').AsFloat + vNivel3.FieldByName('fcp_vfcpst').AsFloat;
                      VL_MERC := VL_MERC + vNivel3.FieldByName('VL_ICMS_ST').AsFloat + vNivel3.FieldByName('fcp_vfcpst').AsFloat;
                    end;
                  end
                  else
                  if ((copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2,1) = '7') or (copy(CST_ICMS, 2,1) = '6') or (copy(CST_ICMS, 2,1) = '9')) and
                  (vOKST) and (Trim(vNivel3.FieldByName('antec_trib').AsString) <> 'S') and (fApurarStIpiEmOutDesp <> 'S') then
                  begin
                    VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
                    VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsFloat + vNivel3.FieldByName('fcp_vfcpst').AsFloat;
                    ALIQ_ST := vNivel3.FieldByName('ALIQ_ST').AsFloat + vNivel3.FieldByName('fcp_pfcpst').AsFloat;
                  end
                  else
                  begin
                    VL_BC_ICMS_ST := 0;
                    VL_ICMS_ST := 0;
                    ALIQ_ST := 0;
                  end;

                  if ConfUnif.Ativo then
                  else
                  if fStIpiEmMerc then
                  begin
                    VL_ITEM := VL_ITEM + vNivel3.FieldByName('VL_IPI').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat;
                    VL_MERC := VL_MERC + vNivel3.FieldByName('VL_IPI').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat;
                  end
                  else
                  if (fApurarStIpiEmOutDesp = 'S') then
                  begin

                  end
                  else
                  if fApurarIPI then
                  begin
                    IND_APUR := StrToApuracaoIPI(IntToStr(vNivel3.FieldByName('IND_APUR').AsInteger));
                    if Trim(vNivel3.FieldByName('CST_IPI').AsString) <> '' then
                      CST_IPI := vNivel3.FieldByName('CST_IPI').AsString
                    else
                    begin
                      if vNivel3.FieldByName('VL_IPI').AsFloat > 0 then
                      begin
                        if vNivel2.FieldByName('natureza_nf').AsString = 'S' then
                          CST_IPI := '50'
                        else
                          CST_IPI := '00';
                      end
                      else
                      begin
                        if vNivel2.FieldByName('natureza_nf').AsString = 'S' then
                          CST_IPI := '52'
                        else
                          CST_IPI := '02';
                      end;
                    end;
                    COD_ENQ := Trim(vNivel3.FieldByName('COD_ENQ').AsString);
                    VL_BC_IPI := vNivel3.FieldByName('VL_BC_IPI').AsFloat;
                    ALIQ_IPI := vNivel3.FieldByName('ALIQ_IPI').AsFloat + vNivel3.FieldByName('nfe_pdevol').AsFloat;
                    VL_IPI := vNivel3.FieldByName('VL_IPI').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat;
                  end;
                  CST_PIS := Trim(vNivel3.FieldByName('CST_PIS').AsString);
                  VL_BC_PIS := vNivel3.FieldByName('VL_BC_PIS').AsFloat;
                  ALIQ_PIS_PERC := vNivel3.FieldByName('ALIQ_PIS').AsFloat;
                  if vNivel3.FieldByName('QUANT_BC_PIS').AsFloat > 0 then
                    QUANT_BC_PIS := vNivel3.FieldByName('QUANT_BC_PIS').AsFloat;
                  ALIQ_PIS_R := vNivel3.FieldByName('ALIQ_PIS1').AsFloat;
                  VL_PIS := vNivel3.FieldByName('VL_PIS').AsFloat;
                  CST_COFINS := Trim(vNivel3.FieldByName('CST_COFINS').AsString);
                  VL_BC_COFINS := vNivel3.FieldByName('VL_BC_COFINS').AsFloat;
                  ALIQ_COFINS_PERC := vNivel3.FieldByName('ALIQ_COFINS').AsFloat;
                  if vNivel3.FieldByName('QUANT_BC_COFINS').AsFloat > 0 then
                    QUANT_BC_COFINS := vNivel3.FieldByName('QUANT_BC_COFINS').AsFloat;
                  ALIQ_COFINS_R := vNivel3.FieldByName('ALIQ_COFINS1').AsFloat;
                  VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsFloat;
                  COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString);
                end;
                if (StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '01') and
                  (vNivel3.FieldByName('tipo_item').AsString = 'S') and
                  (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
                begin
                  with FSpedF.Bloco_C.RegistroC172New do
                  begin
                    VL_BC_ISSQN := vNivel3.FieldByName('VL_BC_ISSQN').AsCurrency;
                    ALIQ_ISSQN := vNivel3.FieldByName('ALIQ_ISSQN').AsCurrency;
                    VL_ISSQN := vNivel3.FieldByName('VL_ISSQN').AsCurrency;
                  end;
                end;

                if ((StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '01') or
                  (StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '55')) and
                  (vNivel3.FieldByName('tipo_item').AsString = 'V') then
                begin
                  vQrAux.Close;
                  vQrAux.SQL.Text := 'select tipo_venda from notafiscal_item_veiculo where' +
                    ' cod_nf = :cod_nf and cod_empresa = :cod_empresa and nitem = :nitem';
                  vQrAux.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
                  vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                  vQrAux.ParamByName('nitem').AsInteger := vNivel3.FieldByName('NUM_ITEM').AsInteger;
                  vQrAux.Open;
                  if (vQrAux.FieldByName('tipo_venda').AsString = 'N') then
                  begin
                    with FSpedF.Bloco_C.RegistroC175New do
                    begin
                      if vNivel2.FieldByName('natureza_nf').AsString = 'E' then
                        IND_VEIC_OPER := StrToTipoOperacaoVeiculo('0')
                      else
                        IND_VEIC_OPER := StrToTipoOperacaoVeiculo('3');
                      CNPJ := '';
                      UF := '';
                      CHASSI_VEIC := vNivel3.FieldByName('chassi').AsString;
                    end;
                  end;
                end;

                //C176. Minas Gerais esta dispensad0
                if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and (False) then
                begin
                  if (vNivel3.FieldByName('tipo_item').AsString = 'P') or
                    (vNivel3.FieldByName('tipo_item').AsString = 'V') then
                  begin
                    if vNivel3.FieldByName('tipo_item').AsString = 'P' then
                    begin
                      vNivel4.Close;
                      vNivel4.SQL.Text :=
                        'select first 1 nf.modelo_nf COD_MOD_ULT_E, nf.num_nf NUM_DOC_ULT_E,'
                        +
                        ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
                        ' else nf.serie end SER_ULT_E, nf.data_lanc DT_ULT_E, nf.cod_cliente COD_PART_ULT_E,' +
                        ' nfi.quantidade QUANT_ULT_E, nfi.valor_unitario VL_UNIT_ULT_E,' +
                        ' (nfi.valor_icmsub / nfi.quantidade) VL_UNIT_BC_ST  from notafiscal_item nfi' +
                        ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
                        ' where nfi.grupo_prod = :grupo_prod and nfi.cod_prod = :cod_prod and' +
                        ' nfi.cod_empresa = :cod_empresa and nfi.tipo_item = ''P'' ' +
                        ' and nf.status = ''Fechada'' and nf.emissao_propria = ''E'' and (nf.da is null or nf.da <> ''S'') order by nf.data_lanc desc';
                      vNivel4.ParamByName('grupo_prod').AsInteger :=
                        vNivel3.FieldByName('grupo_prod').AsInteger;
                      vNivel4.ParamByName('cod_prod').AsString :=
                        vNivel3.FieldByName('cod_prod').AsString;
                      vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                      vNivel4.Open;
                    end
                    else if vNivel3.FieldByName('tipo_item').AsString = 'V' then
                    begin
                      vNivel4.Close;
                      vNivel4.SQL.Text :=
                        'select first 1 nf.modelo_nf COD_MOD_ULT_E, nf.num_nf NUM_DOC_ULT_E,'
                        +
                        ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
                        ' else nf.serie end SER_ULT_E, nf.data_lanc DT_ULT_E, nf.cod_cliente COD_PART_ULT_E,' +
                        ' nfi.quantidade QUANT_ULT_E, nfi.valor_unitario VL_UNIT_ULT_E,' +
                        ' (nfi.valor_icmsub / nfi.quantidade) VL_UNIT_BC_ST  from notafiscal_item nfi' +
                        ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
                        ' where nfi.chassi = :chassi and' +
                        ' nfi.cod_empresa = :cod_empresa and nfi.tipo_item = ''V'' ' +
                        ' and (nf.da is null or nf.da <> ''S'')'+
                        ' and nf.status = ''Fechada'' and nf.emissao_propria = ''E'' and (nf.da is null or nf.da <> ''S'') order by nf.data_lanc desc';
                      vNivel4.ParamByName('chassi').AsString := vNivel3.FieldByName('chassi').AsString;
                      vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                      vNivel4.Open;
                    end;
                    if not vNivel4.IsEmpty then
                      with FSpedF.Bloco_C.RegistroC176New do
                      begin
                        COD_MOD_ULT_E := vNivel4.FieldByName('COD_MOD_ULT_E').AsString;
                        NUM_DOC_ULT_E := vNivel4.FieldByName('NUM_DOC_ULT_E').AsString;
                        SER_ULT_E := vNivel4.FieldByName('SER_ULT_E').AsString;
                        DT_ULT_E := vNivel4.FieldByName('DT_ULT_E').AsDateTime;
                        COD_PART_ULT_E := vNivel4.FieldByName('COD_PART_ULT_E').AsString;
                        QUANT_ULT_E := vNivel4.FieldByName('QUANT_ULT_E').AsFloat;
                        VL_UNIT_ULT_E := vNivel4.FieldByName('VL_UNIT_ULT_E').AsFloat;
                        VL_UNIT_BC_ST := vNivel4.FieldByName('VL_UNIT_BC_ST').AsFloat;
                      end;
                  end;
                end; //natureza_nf = 'S'

                //http://www.spedbrasil.net/forum/topics/registro-c179-informacoes-2
                //Os seguintes Registros estão dispensados em Minas Gerais: C176, C179, C495, 1500.

                //Restituição Complemento do Item da NF
                if vNivel2.FieldByName('natureza_nf').AsString.Equals('E') then
                  if (FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao114) and
                     (RestComplST.RegistroC181(vNivel2.FieldByName('COD_NF').AsInteger,
                                               vNivel3.FieldByName('NUM_ITEM').AsInteger).Count > 0) then
                  begin
                    with FSpedF.Bloco_C.RegistroC181New do
                    begin
                      COD_MOT_REST_COMPL := FSpedF.Bloco_0.Registro0000.UF + RestComplST.C181.Items[0].COD_MOT_REST_COMPL;
                      QUANT_CONV := RestComplST.C181.Items[0].QUANT_CONV;
                      UNID := RestComplST.C181.Items[0].UNID;
                      COD_MOD_SAIDA := RestComplST.C181.Items[0].DocFiscal.Modelo;
                      SERIE_SAIDA := RestComplST.C181.Items[0].DocFiscal.Serie;
                      ECF_FAB_SAIDA := RestComplST.C181.Items[0].DocFiscal.NumECF;
                      NUM_DOC_SAIDA := RestComplST.C181.Items[0].DocFiscal.NumDoc;
                      CHV_DFE_SAIDA := RestComplST.C181.Items[0].DocFiscal.ChvDFe;
                      DT_DOC_SAIDA := RestComplST.C181.Items[0].DocFiscal.DataDoc;
                      NUM_ITEM_SAIDA  := RestComplST.C181.Items[0].NUM_ITEM.ToString;
                      VL_UNIT_CONV_SAIDA  := RestComplST.C181.Items[0].VL_UNIT_CONV;

                      if MatchStr(RestComplST.C181.Items[0].COD_MOT_REST_COMPL.Substring(0, 1), ['5', '6', '7', '8']) then
                      begin
                        VL_UNIT_ICMS_OP_ESTOQUE_CONV_SAIDA := RestComplST.C181.Items[0].VL_UNIT_ICMS_OP_ESTOQUE_CONV;
                        VL_UNIT_ICMS_ST_ESTOQUE_CONV_SAIDA := RestComplST.C181.Items[0].VL_UNIT_ICMS_ST_ESTOQUE_CONV;
                        VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV_SAIDA := RestComplST.C181.Items[0].VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
                      end;

                      if MatchStr(RestComplST.C181.Items[0].COD_MOT_REST_COMPL.Substring(0, 1), ['6', '8']) then
                        VL_UNIT_ICMS_NA_OPERACAO_CONV_SAIDA := RestComplST.C181.Items[0].VL_UNIT_ICMS_NA_OPERACAO_CONV;

                      if MatchStr(RestComplST.C181.Items[0].COD_MOT_REST_COMPL.Substring(0, 1), ['7']) and (RestComplST.Conf.UsarVL_UNIT_ICMS_OP_CONV) then
                        VL_UNIT_ICMS_OP_CONV_SAIDA := RestComplST.C181.Items[0].VL_UNIT_ICMS_OP_CONV;

                      if MatchStr(RestComplST.C181.Items[0].COD_MOT_REST_COMPL.Substring(0, 1), ['8']) then
                      begin
                        VL_UNIT_ICMS_ST_CONV_REST := RestComplST.C181.Items[0].VL_UNIT_ICMS_ST_CONV_REST;
                        VL_UNIT_FCP_ST_CONV_REST := RestComplST.C181.Items[0].VL_UNIT_FCP_ST_CONV_REST;
                      end;

                      if MatchStr(RestComplST.C181.Items[0].COD_MOT_REST_COMPL.Substring(0, 1), ['6', '7']) then
                      begin
                        VL_UNIT_ICMS_ST_CONV_COMPL := RestComplST.C181.Items[0].VL_UNIT_ICMS_ST_CONV_COMPL;
                        VL_UNIT_FCP_ST_CONV_COMPL := RestComplST.C181.Items[0].VL_UNIT_FCP_ST_CONV_COMPL;
                      end;

                      Produtos.AddProduto(RestComplST.C181.Items[0].GRUPO_PROD,
                                          RestComplST.C181.Items[0].COD_PROD,
                                          RestComplST.C181.Items[0].UNID,
                                          RestComplST.C181.Items[0].UNID,
                                          RestComplST.C181.Items[0].QUANT_CONV,
                                          RestComplST.C181.Items[0].QUANT_CONV);
                    end;
                  end
                  else if RestComplST.RegistroC180(vNivel2.FieldByName('COD_NF').AsInteger,
                                              vNivel3.FieldByName('NUM_ITEM').AsInteger).Count > 0 then
                  begin
                    with FSpedF.Bloco_C.RegistroC180New do
                    begin
                      COD_RESP_RET := RestComplST.C180.Items[0].COD_RESP_RET.ToString;
                      QUANT_CONV := RestComplST.C180.Items[0].QUANT_CONV;
                      UNID  := RestComplST.C180.Items[0].UNID;
                      VL_UNIT_CONV  := RestComplST.C180.Items[0].VL_UNIT_CONV;
                      VL_UNIT_ICMS_OP_CONV  := RestComplST.C180.Items[0].VL_UNIT_ICMS_OP_CONV;
                      VL_UNIT_BC_ICMS_ST_CONV  := RestComplST.C180.Items[0].VL_UNIT_BC_ICMS_ST_CONV;
                      VL_UNIT_ICMS_ST_CONV  := RestComplST.C180.Items[0].VL_UNIT_ICMS_ST_CONV;
                      VL_UNIT_FCP_ST_CONV  := RestComplST.C180.Items[0].VL_UNIT_FCP_ST_CONV;
                      COD_DA  := RestComplST.C180.Items[0].COD_DA;
                      NUM_DA  := RestComplST.C180.Items[0].NUM_DA;

                      Produtos.AddProduto(vNivel3.FieldByName('grupo_prod').AsInteger,
                                          vNivel3.FieldByName('cod_prod').AsString,
                                          RestComplST.C180.Items[0].UnidPrincipal,
                                          RestComplST.C180.Items[0].UNID,
                                          RestComplST.C180.Items[0].QtdePrincipal,
                                          RestComplST.C180.Items[0].QUANT_CONV);
                    end;
                  end;
              end;//okC170

              vNivel3.Next;
            end;
          end;

          //Restituição Complemento do Item da NF
          if vNivel2.FieldByName('natureza_nf').AsString.Equals('S') then
            if (FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao114) and
               (RestComplST.RegistroC186(vNivel2.FieldByName('COD_NF').AsInteger).Count > 0) then
            begin
              for N := 0 to RestComplST.C186.Count - 1 do
                with FSpedF.Bloco_C.RegistroC186New do
                begin
                  NUM_ITEM := RestComplST.C186.Items[N].NUM_ITEM.ToString;
                  COD_ITEM := 'P' + PadL(RestComplST.C186.Items[N].GRUPO_PROD.ToString +
                                            RestComplST.C186.Items[N].COD_PROD.Trim, 16, '0');

                  gravaSpedItem('P', RestComplST.C186.Items[N].GRUPO_PROD,
                                     RestComplST.C186.Items[N].COD_PROD.Trim, '', 0, '',
                                     RestComplST.C186.Items[N].UNID.Trim);

                  Produtos.AddProduto(RestComplST.C186.Items[N].GRUPO_PROD,
                                      RestComplST.C186.Items[N].COD_PROD,
                                      RestComplST.C186.Items[N].UNID,
                                      RestComplST.C186.Items[N].UNID,
                                      RestComplST.C186.Items[N].QUANT_CONV,
                                      RestComplST.C186.Items[N].QUANT_CONV);

                  CST_ICMS := RestComplST.C186.Items[N].CST_ICMS;
                  CFOP := RestComplST.C186.Items[N].CFOP.ToString;
                  COD_MOT_REST_COMPL := FSpedF.Bloco_0.Registro0000.UF +
                                        RestComplST.C186.Items[N].COD_MOT_REST_COMPL;
                  QUANT_CONV := RestComplST.C186.Items[N].QUANT_CONV;
                  UNID := RestComplST.C186.Items[N].UNID;
                  COD_MOD_ENTRADA := RestComplST.C186.Items[N].DocFiscal.Modelo;
                  SERIE_ENTRADA := RestComplST.C186.Items[N].DocFiscal.Serie;
                  NUM_DOC_ENTRADA := RestComplST.C186.Items[N].DocFiscal.NumDoc;
                  CHV_DFE_ENTRADA := RestComplST.C186.Items[N].DocFiscal.ChvDFe;
                  DT_DOC_ENTRADA := RestComplST.C186.Items[N].DocFiscal.DataDoc;
                  NUM_ITEM_ENTRADA  := RestComplST.C186.Items[N].NUM_ITEM.ToString;

                  VL_UNIT_CONV_ENTRADA := RestComplST.C186.Items[N].VL_UNIT_CONV;
                  VL_UNIT_ICMS_OP_CONV_ENTRADA  := RestComplST.C186.Items[N].VL_UNIT_ICMS_OP_CONV;
                  VL_UNIT_BC_ICMS_ST_CONV_ENTRADA  := RestComplST.C186.Items[N].VL_UNIT_BC_ICMS_ST_CONV;
                  VL_UNIT_ICMS_ST_CONV_ENTRADA  := RestComplST.C186.Items[N].VL_UNIT_ICMS_ST_CONV;
                  VL_UNIT_FCP_ST_CONV_ENTRADA  := RestComplST.C186.Items[N].VL_UNIT_FCP_ST_CONV;
                end;
            end
            else if RestComplST.RegistroC185('NF', vNivel2.FieldByName('COD_NF').AsInteger).Count > 0 then
              for N := 0 to RestComplST.RegSaida.Count - 1 do                
                with FSpedF.Bloco_C.RegistroC185New do
                begin
                  NUM_ITEM := RestComplST.RegSaida.Items[N].NUM_ITEM.ToString;
                  COD_ITEM := 'P' + PadL(RestComplST.RegSaida.Items[N].GRUPO_PROD.ToString +
                                            RestComplST.RegSaida.Items[N].COD_PROD.Trim, 16, '0');

                  gravaSpedItem('P', RestComplST.RegSaida.Items[N].GRUPO_PROD,
                                     RestComplST.RegSaida.Items[N].COD_PROD.Trim, '', 0, '',
                                     RestComplST.RegSaida.Items[N].UNID.Trim);

                  Produtos.AddProduto(RestComplST.RegSaida.Items[N].GRUPO_PROD,
                                      RestComplST.RegSaida.Items[N].COD_PROD,
                                      RestComplST.RegSaida.Items[N].UNID,
                                      RestComplST.RegSaida.Items[N].UNID,
                                      RestComplST.RegSaida.Items[N].QUANT_CONV,
                                      RestComplST.RegSaida.Items[N].QUANT_CONV);

                  CST_ICMS := RestComplST.RegSaida.Items[N].CST_ICMS;
                  CFOP := RestComplST.RegSaida.Items[N].CFOP.ToString;
                  COD_MOT_REST_COMPL := FSpedF.Bloco_0.Registro0000.UF + 
                                        RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL;
                  QUANT_CONV := RestComplST.RegSaida.Items[N].QUANT_CONV;       
                  UNID := RestComplST.RegSaida.Items[N].UNID;
                  VL_UNIT_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_CONV;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '3']) then
                    VL_UNIT_ICMS_NA_OPERACAO_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_NA_OPERACAO_CONV;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['2']) and (RestComplST.Conf.UsarVL_UNIT_ICMS_OP_CONV) then
                    VL_UNIT_ICMS_OP_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_CONV;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2', '3']) then
                  begin
                    VL_UNIT_ICMS_OP_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_ESTOQUE_CONV;
                    VL_UNIT_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_ESTOQUE_CONV;
                    VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
                  end;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2']) then
                  begin
                    VL_UNIT_ICMS_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_REST;
                    VL_UNIT_FCP_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_REST;
                  end;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['3']) then
                  begin
                    VL_UNIT_ICMS_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_COMPL;
                    VL_UNIT_FCP_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_COMPL;
                  end;
//                10  VL_UNIT_ICMS_NA_OPERACAO_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_NA_OPERACAO_CONV;
//                11  VL_UNIT_ICMS_OP_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_CONV;
//                12  VL_UNIT_ICMS_OP_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_ESTOQUE_CONV;
//                13  VL_UNIT_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_ESTOQUE_CONV;
//                14  VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
//                15  VL_UNIT_ICMS_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_REST;
//                16  VL_UNIT_FCP_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_REST;
//                17  VL_UNIT_ICMS_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_COMPL;
//                18  VL_UNIT_FCP_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_COMPL;
                end;

          vNivel3.Close;
          vNivel3.SQL.Text := 'select case when nfi.tipo_item = ''S'' then ''041''' +
            ' else nfi.cst' +
            ' end CST_ICMS, nfi.codigo_nop CFOP,' +
            ' iif(nfi.codigo_nop in (5929, 6929), 0, (nfi.aliq_icm + coalesce(nfi.fcp_pfcp, 0))) aliq_icms,' +
            ' sum (nfi.valor_total -' +
            '  (nfi.rateio_desconto + coalesce(nfi.vpisdeson, 0) + coalesce(nfi.vcofinsdeson, 0) + iif(nf.totais_com_deson = ''N'', 0, coalesce(nfi.vicmdeson, 0))) + ' +
            ' nfi.rateio_seguro + nfi.rateio_outdesp ) VL_OPR,' +
            ' sum(nfi.base_icm) VL_BC_ICMS, sum(nfi.valor_icm) VL_ICMS,' +
            ' sum( case when ( (coalesce(nfi.antec_trib, '''' ) <> ''S'' ) and ((substring(nfi.cst from 2 for 2) = ''10'') or' +
            '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''90'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''60'')) ) then nfi.base_icmsub' +
            '     else 0' +
            ' end) VL_BC_ICMS_ST, sum( case when ( (coalesce(nfi.antec_trib, '''' ) <> ''S'' ) and ((substring(nfi.cst from 2 for 2) = ''10'') or' +
            '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''90'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''60'')) ) then nfi.valor_icmsub' +
            '     else 0' +
            ' end) VL_ICMS_ST,' +
            ' sum(case when ((substring(nfi.cst from 2 for 2) = ''20'') or' +
            '     (substring(nfi.cst from 2 for 2) = ''70'')) then nfi.vlisento' +
            '     else 0' +
            ' end) VL_RED_BC, sum(nfi.valor_ipi) VL_IPI, sum(nfi.rateio_frete) frete, '''' COD_OBS,' +
            ' sum(coalesce(nfi.fcp_vfcpst, 0)) fcp_vfcpst, sum(coalesce(nfi.nfe_vipidevol, 0)) nfe_vipidevol,' +
            ' sum(coalesce(nfi.fcp_vfcp, 0)) fcp_vfcp,' +
            ' sum(coalesce(nfi.vpisdeson, 0) + coalesce(nfi.vcofinsdeson, 0) + iif(nf.totais_com_deson = ''N'', 0, coalesce(nfi.vicmdeson, 0))) VL_ABAT_NT ' +
            ' from notafiscal_item nfi' +
            ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
            ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa group by 1,2,3';
          vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
          vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel3.Open;

          vNivel3.first;
          while not vNivel3.Eof do
          begin
            with FSpedF.Bloco_C.RegistroC190New do
            begin
              CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
              CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
              VL_OPR := vNivel3.FieldByName('VL_OPR').AsFloat;
              if vNivel2.FieldByName('VL_FRT').AsFloat > 0 then
                VL_OPR := VL_OPR + vNivel3.FieldByName('frete').AsFloat;
//              if (copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7')
//                 or (copy(CST_ICMS, 2, 1) = '9') then
//                VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
              if not MatchText(CFOP, ['5929', '6929']) then
              begin
                ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
                VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsFloat;
                VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsFloat +
                                            vNivel3.FieldByName('fcp_vfcp').AsFloat,2);
                vrBCICMS := vrBCICMS + VL_BC_ICMS;
                vrVICMS := vrVICMS + VL_ICMS;
                vrVL_ABAT := vrVL_ABAT + RoundTo(vNivel3.FieldByName('VL_ABAT_NT').AsCurrency, -2);
              end;
              if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
                FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
              if (vNivel2.FieldByName('natureza_nf').AsString = 'E') and
                ((CFOP <> '1605') or (CFOP = '5605')) then
                FVL_TOT_CREDITOS := FVL_TOT_CREDITOS + VL_ICMS;

              vStringTemp :='';

              {$REGION 'Atribuição dos valores da Operacao, ICMS ST e IPI'}

              //ST
              vSomarST:= False;
              if ConfUnif.Ativo then
              begin

                VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat + vNivel3.FieldByName('fcp_vfcpst').AsFloat +
                                   vNivel3.FieldByName('VL_IPI').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat;
                //ST
                if vNivel2.FieldByName('emissao_propria').AsString = 'S'  then
                  fieldImposto := ConfUnif.ConfST.EmissaoPropria
                else
                  fieldImposto := ConfUnif.ConfST.EmissaoTerceiro;

                if fieldImposto = csCamposProprios then
                begin
                  VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
                  VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsFloat +
                                vNivel3.FieldByName('fcp_vfcpst').AsFloat;
                  if VL_ICMS_ST > 0 then
                  begin
                    setSTEstado(vNivel2.FieldByName('COD_PART').AsString);

                    if MatchStr(CFOP, CFOP_DEV_ST_E) then
                      somaFVL_DEVOL_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST)
                    else if MatchStr(CFOP.Substring(0, 1), ['1', '2']) then
                      somaFVL_OUT_CRED_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
                    if MatchStr(CFOP.Substring(0, 1), ['5', '6', '7']) then
                      somaFVL_RETENCAO_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
                  end;
                end
                else if fieldImposto = csCampoOutros then
                  VL_OUT_DA := VL_OUT_DA + vNivel3.FieldByName('VL_ICMS_ST').AsFloat + vNivel3.FieldByName('fcp_vfcpst').AsFloat;
                //IPI
                fieldImposto := ConfUnif.ConfIPI.GetCampoImposto(
                  vNivel2.FieldByName('emissao_propria').AsString = 'S',
                  vNivel3.FieldByName('CFOP').AsInteger);
                {
                if vNivel2.FieldByName('emissao_propria').AsString = 'S'  then
                  fieldImposto := ConfUnif.ConfIPI.EmissaoPropria
                else
                  fieldImposto := ConfUnif.ConfIPI.EmissaoTerceiro;
                }

                if fieldImposto = csCamposProprios then
                  VL_IPI := vNivel3.FieldByName('VL_IPI').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat
                else if fieldImposto = csCampoOutros then
                  VL_OUT_DA := VL_OUT_DA + vNivel3.FieldByName('VL_IPI').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat;
              end
              else
              if fStIpiEmMerc then
              begin
                VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat +
                                   vNivel3.FieldByName('fcp_vfcpst').AsFloat;
              end
              else
              if ((copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7') or (copy(CST_ICMS, 2, 1) = '6') or (copy(CST_ICMS, 2, 1) = '9')) and
                ((vOKST) or ( (fApurarST) and
                              (
                                (CFOP = '5410') or (CFOP = '5411') or (CFOP = '5414') or (CFOP = '5415') or
                                (CFOP = '5660') or (CFOP = '5661') or (CFOP = '1662') or
                                (CFOP = '6410') or (CFOP = '6411') or (CFOP = '6414') or (CFOP = '6415') or
                                (CFOP = '6660') or (CFOP = '6661') or (CFOP = '6662')
                              )
                            )
                ) then
              // De acordo a contabilidade nao deve haver ST para não substitutos
              begin
                vSomarST := True;
                VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat +
                                   vNivel3.FieldByName('fcp_vfcpst').AsFloat;
                if fApurarStIpiEmOutDesp <> 'S' then
                begin
                  VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
                  VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsFloat +
                                vNivel3.FieldByName('fcp_vfcpst').AsFloat;
                  if VL_ICMS_ST > 0 then
                    setSTEstado(vNivel2.FieldByName('COD_PART').AsString);
                  if (CFOP = '1410') or (CFOP = '1411') or (CFOP = '1414') or (CFOP = '1415') or
                    (CFOP = '1660') or (CFOP = '1661') or (CFOP = '1662') or (CFOP = '2410') or
                    (CFOP = '2411') or (CFOP = '2414') or (CFOP = '2415') or (CFOP = '2660') or
                    (CFOP = '2661') or (CFOP = '2662') then
                    somaFVL_DEVOL_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST)
                  else if (copy(CFOP, 1, 1) = '1') or (copy(CFOP, 1, 1) = '2') then
                    somaFVL_OUT_CRED_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
                  //              else if (CFOP = '1603') or (CFOP = '2603') then
                  //                somaFVL_RESSARC_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
                  if (copy(CFOP, 1, 1) = '5') or (copy(CFOP, 1, 1) = '6') or (copy(CFOP, 1, 1) = '7')
                    then
                    somaFVL_RETENCAO_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
                end;
              end
              else
              begin
                VL_BC_ICMS_ST := 0;
                VL_ICMS_ST := 0;
                if fApurarStIpiEmOutDesp = 'S' then
                  VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat +
                                     vNivel3.FieldByName('fcp_vfcpst').AsFloat;
              end;

              //IPI
              if ConfUnif.Ativo then
              else
              if fStIpiEmMerc then
              begin
                VL_OPR := VL_OPR + vNivel3.FieldByName('VL_IPI').AsFloat +
                                   vNivel3.FieldByName('nfe_vipidevol').AsFloat;
              end
              else
              if fApurarStIpiEmOutDesp = 'S' then
                VL_IPI := 0
              else
              if fApurarIPI  then
                VL_IPI := vNivel3.FieldByName('VL_IPI').AsFloat +
                          vNivel3.FieldByName('nfe_vipidevol').AsFloat;

              {$ENDREGION}

              VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsFloat;
              COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
              VL_DOC := VL_DOC + VL_OPR;

              if MatchStr(Copy(CST_ICMS, 2, 2), ['20', '70']) then
                if vNivel3.FieldByName('VL_OPR').AsFloat > VL_BC_ICMS then
                  VL_RED_BC := vNivel3.FieldByName('VL_OPR').AsFloat - VL_BC_ICMS;
            end;

            if ConfUnif.Ativo then
//            begin
//              if vSomarST then
//              begin
//                VL_BC_ICMS_ST := VL_BC_ICMS_ST + vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
//                VL_ICMS_ST := VL_ICMS_ST + vNivel3.FieldByName('VL_ICMS_ST').AsFloat +
//                                           vNivel3.FieldByName('fcp_vfcpst').AsFloat;
//              end;
//            end
            else
            if fStIpiEmMerc then
            else
            if fApurarStIpiEmOutDesp = 'S' then
            begin
              VL_OUT_DA := VL_OUT_DA + vNivel3.FieldByName('VL_ICMS_ST').AsFloat + vNivel3.FieldByName('VL_IPI').AsFloat +
                                       vNivel3.FieldByName('fcp_vfcpst').AsFloat + vNivel3.FieldByName('nfe_vipidevol').AsFloat;
            end
            else if vSomarST then
            begin
              VL_BC_ICMS_ST := VL_BC_ICMS_ST + vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
              VL_ICMS_ST := VL_ICMS_ST + vNivel3.FieldByName('VL_ICMS_ST').AsFloat +
                                         vNivel3.FieldByName('fcp_vfcpst').AsFloat;
            end;
            VL_BC_ICMS := VL_BC_ICMS + vrBCICMS;
            VL_ICMS := VL_ICMS + vrVICMS;
            vNivel3.Next;
          end;
          VL_ABAT_NT := vrVL_ABAT;

          // posso somar os valores dos itens do cabeçalho aqui,
          if ConfUnif.Ativo then
          begin
            VL_ICMS := 0;
            VL_ICMS_ST := 0;
            VL_IPI := 0;
            VL_BC_ICMS := 0;
            VL_BC_ICMS_ST := 0;

            for N := 0 to RegistroC190.Count - 1 do with RegistroC190 do
            begin
              VL_ICMS := VL_ICMS + Items[N].VL_ICMS;
              VL_ICMS_ST := VL_ICMS_ST + Items[N].VL_ICMS_ST;
              VL_IPI := VL_IPI + Items[N].VL_IPI;
              VL_BC_ICMS := VL_BC_ICMS + Items[N].VL_BC_ICMS;
              VL_BC_ICMS_ST := VL_BC_ICMS_ST + Items[N].VL_BC_ICMS_ST;
            end;
          end;

          //dados para o IPI
          if ConfUnif.Ativo then
          begin
            vOK := True;
            { Teste sendo feito no bbloco
            if vNivel2.FieldByName('emissao_propria').AsString = 'S'  then
              vok := ConfUnif.ConfIPI.EmissaoPropria = csCamposProprios
            else
              vok := ConfUnif.ConfIPI.EmissaoTerceiro = csCamposProprios;
            }
          end
          else
            vOK  := ((not fApurarStIpiEmOutDesp.Trim.Equals('S')) and (fApurarIPI));

          if (FSpedF.Bloco_0.Registro0000.IND_ATIV = atIndustrial) and (vok) then
//            (not fApurarStIpiEmOutDesp.Trim.Equals('S')) and (fApurarIPI) then
          begin
            vNivel3.Close;
            vNivel3.SQL.Text := 'select nfi.cst_ipi, nfi.codigo_nop CFOP, nfi.antec_trib,' +
              ' sum (nfi.valor_total -' +
              '   (nfi.rateio_desconto + coalesce(nfi.vpisdeson, 0) + coalesce(nfi.vcofinsdeson, 0) + iif(nf.totais_com_deson = ''N'', 0, coalesce(nfi.vicmdeson, 0))) + ' +
              ' nfi.rateio_seguro + nfi.rateio_outdesp) VL_OPR,' +
              ' sum(nfi.valor_icmsub) VL_ICMS_ST,' +
              ' sum(nfi.base_ipi) VL_BC_IPI,' +
              ' sum(nfi.valor_ipi + coalesce(nfi.nfe_vipidevol, 0)) VL_IPI,' +
              ' sum(coalesce(nfi.fcp_vfcpst, 0)) fcp_vfcpst,' +
              ' sum(nfi.rateio_frete) frete' +
              ' from notafiscal_item nfi' +
              ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
              ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa group by 1,2,3';
            vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
            vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.Open;

            vNivel3.first;
            while not vNivel3.Eof do
            begin
              fieldImposto := ConfUnif.ConfIPI.GetCampoImposto(
                vNivel2.FieldByName('emissao_propria').AsString = 'S',
                vNivel3.FieldByName('CFOP').AsInteger);

              if not ConfUnif.Ativo or (fieldImposto = CampoImposto.csCamposProprios) then
              begin
                AE510 := nil;
                vBooleanTemp := True;

                for K := 0 to FE510List.Count - 1 do
                  if (vNivel3.FieldByName('CFOP').AsString.Substring(0, 4) = TRegistroE510(FE510List.Items[L]).CFOP) and
                    (vNivel3.FieldByName('CST_IPI').AsString.Substring(0, 2) = TRegistroE510(FE510List.Items[L]).CST_IPI) then
                  begin
                    AE510 := TRegistroE510(FE510List.Items[L]);
                    vBooleanTemp := False;
                    Break;
                  end;
                if vBooleanTemp then
                  AE510 := TRegistroE510.Create(nil);

                AE510.CFOP        := vNivel3.FieldByName('CFOP').AsString.Substring(0, 4);
                AE510.CST_IPI     := vNivel3.FieldByName('CST_IPI').AsString.Substring(0, 2);

                AE510.VL_CONT_IPI := AE510.VL_CONT_IPI + vNivel3.FieldByName('VL_OPR').AsFloat;

                //if fStIpiEmMerc then
                  AE510.VL_CONT_IPI := AE510.VL_CONT_IPI + vNivel3.FieldByName('VL_IPI').AsFloat +
                                                           vNivel3.FieldByName('fcp_vfcpst').AsFloat;
                if {(fStIpiEmMerc) and} ( not vNivel3.FieldByName('antec_trib').AsString.Trim.Equals('S'))  then
                  AE510.VL_CONT_IPI := AE510.VL_CONT_IPI + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
                if vNivel2.FieldByName('VL_FRT').AsFloat > 0 then
                  AE510.VL_CONT_IPI := AE510.VL_CONT_IPI + vNivel3.FieldByName('frete').AsFloat;

                AE510.VL_BC_IPI   := AE510.VL_BC_IPI   + vNivel3.FieldByName('VL_BC_IPI').AsFloat;
                AE510.VL_IPI      := AE510.VL_IPI      + vNivel3.FieldByName('VL_IPI').AsFloat;

                if vBooleanTemp then
                  FE510List.Add(AE510);
              end;

              vNivel3.Next;
            end;
          end;
          //fim dos dados para o ipi

          vNivel3.Close;
          vNivel3.SQL.Text := 'select c195.cod_obs, sl.txt TXT_COMPL, count(c195.cod_nf)' +
            ' from notafiscal_sped_c195_c197 c195' +
            ' inner join sped_lancamento_fiscal sl on sl.cod_obs = c195.cod_obs and sl.cod_empresa = c195.cod_empresa' +
            ' where c195.cod_nf = :cod_nf and c195.cod_empresa = :cod_empresa group by 1,2';
          vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
          vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel3.Open;

          while not vNivel3.Eof do
          begin
            montaRegistro0460(vNivel3.FieldByName('cod_obs').AsInteger,
              vNivel3.FieldByName('TXT_COMPL').AsString);

            regC195 := FSpedF.Bloco_C.RegistroC195New;
            with regC195 do
            begin
              COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
              TXT_COMPL := Trim(vNivel3.FieldByName('TXT_COMPL').AsString);
            end;

            vNivel4.Close;
            vNivel4.SQL.Text :=
              'select c195.cod_aj, c195.descr_compl_aj, c195.nitem, nfi.tipo_item, nfi.grupo_prod,' +
              ' c195.aliq_icms, c195.vl_bc_icms, c195.vl_icms, c195.vl_outros,' +
              ' nfi.cod_prod, nfi.cod_servico, nfi.chassi, nfi.cod_servico, nfi.referencia und, pr.unidade unid_inv' +
              ' from notafiscal_sped_c195_c197 c195' +
              ' inner join sped_lancamento_fiscal sl on sl.cod_obs = c195.cod_obs and sl.cod_empresa = c195.cod_empresa ' +
              ' left join notafiscal_item nfi on nfi.cod_nf = c195.cod_nf and nfi.cod_empresa = c195.cod_empresa and nfi.nitem = c195.nitem' +
              ' left join produtos pr on pr.grupo_prod = nfi.grupo_prod and pr.cod_prod = nfi.cod_prod and pr.cod_empresa = nfi.cod_empresa' +
              ' where c195.cod_nf = :cod_nf and c195.cod_empresa = :cod_empresa';
            vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel4.Open;
            vNivel4.First;
            while not vNivel4.Eof do
            begin
              //with FSpedF.Bloco_C.RegistroC197New do
              begin
                var vCOD_AJ := Trim(vNivel4.FieldByName('COD_AJ').AsString);
                var vDESCR_COMPL_AJ := Trim(vNivel4.FieldByName('DESCR_COMPL_AJ').AsString);
                var vCOD_ITEM := '';

                //if vNivel4.FieldByName('nitem').AsInteger > 0 then
                begin
                  if vNivel4.FieldByName('tipo_item').AsString = 'P' then
                  begin
                    vCOD_ITEM := 'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
                      Trim(vNivel4.FieldByName('cod_prod').AsString), 16);

                    gravaSpedItem(vNivel4.FieldByName('tipo_item').AsString,
                      vNivel4.FieldByName('grupo_prod').AsInteger,
                      vNivel4.FieldByName('cod_prod').AsString, '', 0, '',
                      vNivel4.FieldByName('unid_inv').AsString.ToUpper.Trim);
                  end
                  else if vNivel4.FieldByName('tipo_item').AsString = 'S' then
                  begin
                    vCOD_ITEM := 'S' + StrZero(vNivel4.FieldByName('cod_servico').AsString, 16);

                    gravaSpedItem(vNivel4.FieldByName('tipo_item').AsString,
                      0, '', '', vNivel4.FieldByName('cod_servico').AsInteger, '',
                      vNivel4.FieldByName('und').AsString);
                  end
                  else if vNivel4.FieldByName('tipo_item').AsString = 'V' then
                    vCOD_ITEM := StrZero(vNivel4.FieldByName('chassi').AsString, 17)
                  else if vNivel4.FieldByName('tipo_item').AsString = 'O' then
                  begin
                    vCOD_ITEM := 'O' + StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel4.FieldByName('nitem').AsString, 3);

                    gravaSpedItem(vNivel4.FieldByName('tipo_item').AsString,
                      0, '', '', 0, vCOD_ITEM, vNivel4.FieldByName('und').AsString);
                  end
                  else if vNivel4.FieldByName('tipo_item').AsString = 'D' then
                  begin
                    vCOD_ITEM := 'D' + StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel4.FieldByName('nitem').AsString, 3);

                    gravaSpedItem(vNivel4.FieldByName('tipo_item').AsString,
                      0, '', '', 0, vCOD_ITEM, vNivel4.FieldByName('und').AsString);
                  end;

                end;
                //else
                  //COD_ITEM := '';

                regC197 := nil;
                for var iC197 := 0 to regC195.RegistroC197.Count - 1 do
                  if regC197 <> nil then
                    Break
                  else if (regC195.RegistroC197.Items[iC197].COD_AJ = vCOD_AJ)
                    and (regC195.RegistroC197.Items[iC197].COD_ITEM = vCOD_ITEM)  then
                  begin
                    regC197 := regC195.RegistroC197.Items[iC197];
                    if RoundTo(regC197.ALIQ_ICMS, -2) <> RoundTo(vNivel4.FieldByName('ALIQ_ICMS').AsFloat, -2) then
                      regC197.ALIQ_ICMS := 0;
                  end;

                if regC197 = nil then
                begin
                  regC197 := regC195.RegistroC197.New;
                  regC197.COD_AJ := vCOD_AJ;
                  regC197.COD_ITEM := vCOD_ITEM;
                  regC197.DESCR_COMPL_AJ := vDESCR_COMPL_AJ;
                  regC197.ALIQ_ICMS := vNivel4.FieldByName('ALIQ_ICMS').AsCurrency;
                end;

                regC197.VL_BC_ICMS := regC197.VL_BC_ICMS + vNivel4.FieldByName('VL_BC_ICMS').AsCurrency;
                regC197.VL_ICMS    := regC197.VL_ICMS    + StrToFloatFormat(vNivel4.FieldByName('VL_ICMS').AsCurrency,2);
                regC197.VL_OUTROS  := regC197.VL_OUTROS  + vNivel4.FieldByName('VL_OUTROS').AsCurrency;

                {
                if ((COPY(COD_AJ, 3, 1) = '4') or (COPY(COD_AJ, 3, 1) = '5') or
                  (COPY(COD_AJ, 3, 1) = '6')) and
                  ((COPY(COD_AJ, 4, 1) = '0') or (COPY(COD_AJ, 4, 1) = '3') or
                  (COPY(COD_AJ, 4, 1) = '4') or (COPY(COD_AJ, 4, 1) = '5')) then
                  FVL_AJ_DEBITOS := FVL_AJ_DEBITOS + VL_ICMS;
                if ((COPY(COD_AJ, 3, 1) = '0') or (COPY(COD_AJ, 3, 1) = '1') or
                  (COPY(COD_AJ, 3, 1) = '2')) and
                  ((COPY(COD_AJ, 4, 1) = '0') or (COPY(COD_AJ, 4, 1) = '3') or
                  (COPY(COD_AJ, 4, 1) = '4') or (COPY(COD_AJ, 4, 1) = '5')) then
                  FVL_AJ_CREDITOS := FVL_AJ_CREDITOS + VL_ICMS;
                if (COPY(COD_AJ, 3, 1) = '6') and (COPY(COD_AJ, 4, 1) = '0') then
                  FVL_TOT_DED := FVL_TOT_DED + VL_ICMS;
                if ((COPY(COD_AJ, 3, 1) = '0') or (COPY(COD_AJ, 3, 1) = '1') or
                  (COPY(COD_AJ, 3, 1) = '2')) and
                  (COPY(COD_AJ, 4, 1) = '1') then
                  somaFVL_AJ_CREDITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);
                if ((COPY(COD_AJ, 3, 1) = '3') or (COPY(COD_AJ, 3, 1) = '4') or
                  (COPY(COD_AJ, 3, 1) = '5')) and
                  (COPY(COD_AJ, 4, 1) = '1') then
                  somaFVL_AJ_DEBITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);
                if (COPY(COD_AJ, 3, 1) = '7') and (COPY(COD_AJ, 4, 1) = '1') then
                  somaFDEB_ESP_ST(Copy(COD_AJ, 1, 2), VL_ICMS);
                }
              end;
              vNivel4.Next;
            end;
            vNivel3.Next;
          end;

          if (ConfUnif.Ativo) and (ConfUnif.ConfICMSSN.FormaAjuste.Contains('A')) and (ConfUnif.ConfICMSSN.CodigoAjuste.IsEmpty) then
            ShowWarning('Codigo do ajuste de apuração para registros C195 e C197 sem prencher')
          else if (ConfUnif.Ativo) and (ConfUnif.ConfICMSSN.FormaAjuste.Contains('A')) and
                  (vNivel2.FieldByName('emissao_propria').AsString = 'N') then
          begin
            vOK := True;
            for N := 0 to RegistroC195.Count - 1 do with RegistroC195 do
              for M := 0 to Items[N].RegistroC197.Count - 1 do with Items[N].RegistroC197 do
                if Items[M].COD_AJ.Equals(ConfUnif.ConfICMSSN.CodigoAjuste) then
                begin
                  vOK := False;
                  Break;
                end;

            if vOK then
            begin
              SqlOpen('select sl.cod_obs, sl.txt txt_compl, %s cod_aj, nfi.icm_picm aliq_icms,' +
                      ' sum(nfi.valor_icmsub) vl_icmsst,' +
                      ' sum(nfi.icm_vicm) vl_icms' +
                      ' from (' +
                      ' select first 1 sl.cod_obs, sl.txt from sped_lancamento_fiscal sl' +
                      ' where sl.cod_padrao_ajuste = %s and sl.cod_empresa = %s) as sl' +
                      ' right join notafiscal nf on 1 = 1' +
                      ' left join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
                      ' where nf.emissao_propria = ''N'' and nf.cod_nf = %d and nf.cod_empresa = %s' +
                      '  and coalesce(nfi.icm_csosn, '''') <> '''' and nfi.icm_vicm > 0 and coalesce(nfi.valor_icmsub, 0) = 0' +
                      ' group by 1,2,3,4',
                      [ConfUnif.ConfICMSSN.CodigoAjuste.QuotedString, ConfUnif.ConfICMSSN.CodigoAjuste.QuotedString,
                       FCodEmpresa, vNivel2.FieldByName('cod_nf').AsInteger, FCodEmpresa],
                      vNivel3).First;
              while not vNivel3.Eof do
              begin
                regC195 := nil;
                for N := 0 to RegistroC195.Count - 1 do with RegistroC195 do
                  for M := 0 to Items[N].RegistroC197.Count - 1 do with Items[N].RegistroC197 do
                    if Items[M].COD_AJ.Equals(ConfUnif.ConfICMSSN.CodigoAjuste) then
                    begin
                      regC195 := RegistroC195.Items[N];
                      Break;
                    end;

                if regC195 = nil then
                begin
                  regC195 := RegistroC195.New;
                  regC195.COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
                  regC195.TXT_COMPL := Trim(vNivel3.FieldByName('TXT_COMPL').AsString);

                  if vNivel3.FieldByName('COD_OBS').IsNull then
                    warningCodigoAjuste := True;

                  montaRegistro0460(vNivel3.FieldByName('cod_obs').AsInteger, vNivel3.FieldByName('TXT_COMPL').AsString);
                end;

                regC197 := regC195.RegistroC197.New;

                regC197.COD_AJ := ConfUnif.ConfICMSSN.CodigoAjuste;
                regC197.ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsCurrency;
                regC197.VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsCurrency,2);
                regC197.VL_BC_ICMS := RoundTo(regC197.VL_ICMS /  regC197.ALIQ_ICMS * 100, -2);

                vNivel3.Next;
              end;
            end;
          end;

          for N := 0 to RegistroC195.Count - 1 do with RegistroC195 do
            for M := 0 to Items[N].RegistroC197.Count - 1 do with Items[N].RegistroC197.Items[M] do
            begin
              if MatchStr(COD_AJ[3], ['3', '4', '5']) and MatchStr(COD_AJ[4], ['0', '3', '4', '5', '6', '7', '8']) then
                FVL_AJ_DEBITOS := FVL_AJ_DEBITOS + VL_ICMS;

              if MatchStr(COD_AJ[3], ['0', '1', '2']) and MatchStr(COD_AJ[4], ['0', '3', '4', '5', '6', '7', '8']) then
                FVL_AJ_CREDITOS := FVL_AJ_CREDITOS + VL_ICMS;

              if (COD_AJ[3] = '6') and (COD_AJ[4] = '0') then
                FVL_TOT_DED := FVL_TOT_DED + VL_ICMS;

              if MatchStr(COD_AJ[3], ['0', '1', '2']) and (COD_AJ[4] = '1') then
                somaFVL_AJ_CREDITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);

              if MatchStr(COD_AJ[3], ['3', '4', '5']) and (COD_AJ[4] = '1') then
                somaFVL_AJ_DEBITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);

              if (COD_AJ[3] = '7') and (COD_AJ[4] = '1') then
                somaFDEB_ESP_ST(Copy(COD_AJ, 1, 2), VL_ICMS);

//              if ((COPY(COD_AJ, 3, 1) = '4') or (COPY(COD_AJ, 3, 1) = '5') or (COPY(COD_AJ, 3, 1) = '6')) and
//                 ((COPY(COD_AJ, 4, 1) = '0') or (COPY(COD_AJ, 4, 1) = '3') or (COPY(COD_AJ, 4, 1) = '4') or (COPY(COD_AJ, 4, 1) = '5')) then
//                FVL_AJ_DEBITOS := FVL_AJ_DEBITOS + VL_ICMS;
//              if ((COPY(COD_AJ, 3, 1) = '0') or (COPY(COD_AJ, 3, 1) = '1') or (COPY(COD_AJ, 3, 1) = '2')) and
//                 ((COPY(COD_AJ, 4, 1) = '0') or (COPY(COD_AJ, 4, 1) = '3') or (COPY(COD_AJ, 4, 1) = '4') or (COPY(COD_AJ, 4, 1) = '5')) then
//                FVL_AJ_CREDITOS := FVL_AJ_CREDITOS + VL_ICMS;
//              if (COPY(COD_AJ, 3, 1) = '6') and (COPY(COD_AJ, 4, 1) = '0') then
//                FVL_TOT_DED := FVL_TOT_DED + VL_ICMS;
//              if ((COPY(COD_AJ, 3, 1) = '0') or (COPY(COD_AJ, 3, 1) = '1') or (COPY(COD_AJ, 3, 1) = '2')) and (COPY(COD_AJ, 4, 1) = '1') then
//                somaFVL_AJ_CREDITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);
//              if ((COPY(COD_AJ, 3, 1) = '3') or (COPY(COD_AJ, 3, 1) = '4') or (COPY(COD_AJ, 3, 1) = '5')) and (COPY(COD_AJ, 4, 1) = '1') then
//                somaFVL_AJ_DEBITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);
//              if (COPY(COD_AJ, 3, 1) = '7') and (COPY(COD_AJ, 4, 1) = '1') then
//                somaFDEB_ESP_ST(Copy(COD_AJ, 1, 2), VL_ICMS);
            end;

        end;


      end; //RegistroC100New
      //    FSpedF.WriteBloco_C(False);

      vNivel2.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;
    if warningCodigoAjuste then
      ShowWarning('Codigo do ajuste de apuração "%s" para registros C195 e C197 não encontrado no cadastro. Por favor cadastre',
                  [ConfUnif.ConfICMSSN.CodigoAjuste]);

    //FIM NF-E
    {$ENDREGION}

    {$REGION 'Nota Fiscal Consumidor modelo 65'}
    {
    vQrAux.Close;
    vQrAux.SQL.Text := 'select nfce.num_nf,  nfce.serie,  nfce.status,  nfce.situacao_nfce from nfce' +
      ' where nfce.num_nf > 0 and not nfce.situacao_nfce in (''Autorizada'', ''Cancelada'', ''Denegada'', ''Inutilizada'')' +
      ' and nfce.data_lanc >= :dataIni and nfce.data_lanc <= :dataFim' +
      ' and cod_empresa = :cod_empresa';
    vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vQrAux.Open;

    vStringTemp := '';
    vQrAux.First;
    while not vQrAux.Eof do
    begin
      vStringTemp := vStringTemp +
        vQrAux.FieldByName('num_nf').AsString + '/' + vQrAux.FieldByName('serie').AsString + ': ' +
        vQrAux.FieldByName('situacao_nfce').AsString + #13;
      vQrAux.Next;
    end;

    vStringTemp := IfThen(vStringTemp <> '',
                          'Existem NFC-e'' pendentes de Autorização, Cancelamento ou Inutilização' + #13 + #13 + vStringTemp);

    if Trim(vStringTemp ) <> '' then
      Application.MessageBox(pchar(vStringTemp), 'Atenção', 64);
    }

    vNivel2.Close;
    vNivel2.SQL.Text := 'select nfce.cod_nfce, 1 ind_oper,' +
      ' 0 ind_emit, nfce.cod_cliente cod_part, ''65'' cod_mod,' +
      ' nfce.serie SER, nfce.num_nf NUM_DOC, nfce.chave_nfce CHV_NFE, nfce.dhemi DT_DOC,' +
      ' nfce.data_lanc DT_E_S, nfce.vnf VL_DOC, ' +
      ' nfce.vdesc VL_DESC, 0 VL_ABAT_NT, nfce.vprod VL_MERC,' +
      ' nfce.modfrete, nfce.vfrete VL_FRT, nfce.vseg VL_SEG, nfce.voutro VL_OUT_DA, nfce.vbc' +
      ' VL_BC_ICMS, nfce.vicms VL_ICMS, 0 VL_BC_ICMS_ST, 0' +
      ' VL_ICMS_ST, 0 VL_IPI, nfce.vpis VL_PIS, nfce.vcofins VL_COFINS,' +
      ' 0 VL_PIS_ST, 0 VL_COFINS_ST, nfce.status,' +
      ' nfce.tpemis , nfce.infadfisco, nfce.infcpl,' +
      ' 0 VL_SERV_NT, 0 VL_BC_ISSQN, 0 VL_ISSQN,' +
      ' 0 VL_BC_IRRF, 0 VL_IRRF, 0 VL_BC_PREV, 0 VL_PREV,' +
      ' nfce.situacao_nfce' +
      ' from nfce' +
      ' where nfce.cod_empresa = :cod_empresa' +
      ' and nfce.data_lanc >= :dataIni' +
      ' and nfce.data_lanc <= :dataFim ' +
      ' and nfce.situacao_nfce in (''Autorizada'', ''Cancelada'', ''Denegada'', ''Inutilizada'')' +
      ' and nfce.ativo = 1' +
      ' order by nfce.serie, nfce.num_nf';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.Open;

    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;
    if not vNivel2.IsEmpty then
      FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;
    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C100';
      Application.ProcessMessages;

      vBooleanTemp := true;
      if (StrToDate(FDataIni) >= EncodeDate(2023, 1, 1)) and
        (MatchText(UpperCase(vNivel2.FieldByName('situacao_nfce').AsString), ['DENEGADA', 'INUTILIZADA'])) then
        vBooleanTemp := False;

      if vBooleanTemp then
      begin
        with FSpedF.Bloco_C.RegistroC100New do
        begin
          IND_OPER := StrToIndOper( vNivel2.FieldByName('ind_oper').AsString);
          IND_EMIT := StrToIndEmit( vNivel2.FieldByName('ind_emit').AsString);
          //COD_PART
          COD_MOD := vNivel2.FieldByName('cod_mod').AsString; //65
          COD_SIT := StrToCodSit(
                                 IfThen(Trim(vNivel2.FieldByName('situacao_nfce').AsString) = 'Autorizada', '00') +
                                 IfThen(Trim(vNivel2.FieldByName('situacao_nfce').AsString) = 'Cancelada', '02') +
                                 IfThen(Trim(vNivel2.FieldByName('situacao_nfce').AsString) = 'Denegada', '04') +
                                 IfThen(Trim(vNivel2.FieldByName('situacao_nfce').AsString) = 'Inutilizada', '05')
                                 );
          SER := vNivel2.FieldByName('ser').AsString;
          NUM_DOC := vNivel2.FieldByName('num_doc').AsString;
          CHV_NFE := IfThen(COD_SIT <> sdDoctoNumInutilizada, vNivel2.FieldByName('chv_nfe').AsString);
          if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada]) then
          begin
            DT_DOC := vNivel2.FieldByName('dt_doc').AsDateTime;
            //DT_E_S
            VL_DOC := vNivel2.FieldByName('vl_doc').AsFloat;
            if SqlOpen('select pag.cod_nfce,' +
                       ' sum(case when pag.tpag in (1,4) then 1 else 0 end ) avista,' +
                       ' sum(case when pag.tpag in (2,3,5) then 1 else 0 end ) aprazo,' +
                       ' sum(case when pag.tpag not in (1,2,3,4,5) then 1 else 0 end ) outros' +
                       ' from nfce_pagamento pag' +
                       ' where pag.cod_nfce = ' + IntToStr(vNivel2.FieldByName('cod_nfce').AsInteger) +
                       ' and pag.cod_empresa = ' + FCodEmpresa +
                       ' group by 1').IsEmpty then
              IND_PGTO := tpOutros
            else if vQrAux.FieldByName('outros').AsInteger > 0 then
              IND_PGTO := tpOutros
            else if vQrAux.FieldByName('aprazo').AsInteger > 0 then
              IND_PGTO := tpPrazo
            else if vQrAux.FieldByName('avista').AsInteger > 0 then
              IND_PGTO := tpVista
            else
              IND_PGTO := tpOutros;
            VL_DESC := vNivel2.FieldByName('vl_desc').AsFloat;
            VL_ABAT_NT := vNivel2.FieldByName('vl_abat_nt').AsFloat;
            VL_MERC := vNivel2.FieldByName('vl_merc').AsFloat;
            IND_FRT := StrToIndFrt(
                                   IfThen(vNivel2.FieldByName('modfrete').AsString = '0', '0') +
                                   IfThen(vNivel2.FieldByName('modfrete').AsString = '1', '1') +
                                   IfThen(vNivel2.FieldByName('modfrete').AsString = '2', '2') +
                                   IfThen(vNivel2.FieldByName('modfrete').AsString = '9', '9')
                                  );
            VL_SEG := vNivel2.FieldByName('vl_seg').AsFloat;
            VL_OUT_DA := vNivel2.FieldByName('vl_out_da').AsFloat;
            VL_BC_ICMS := vNivel2.FieldByName('vl_bc_icms').AsFloat;
            VL_ICMS := vNivel2.FieldByName('vl_icms').AsFloat;
            //VL_BC_ICMS_ST
            //VL_ICMS_ST
            //VL_IPI
            //VL_PIS
            //VL_COFINS
            //VL_PIS_ST
            //VL_COFINS_ST

  //          SqlOpen('select ' +
  //            ' from nfce_item it' +
  //            ' where it.cod_nfce = ' + IntToStr(vNivel2.FieldByName('cod_nfce').AsInteger) +
  //            ' and it.cod_empresa = ' + FCodEmpresa +
  //            ' order by it.nitem');

            //aqui o c185new
            if RestComplST.RegistroC185('NFC', vNivel2.FieldByName('cod_nfce').AsInteger).Count > 0 then
              for N := 0 to RestComplST.RegSaida.Count - 1 do
                with FSpedF.Bloco_C.RegistroC185New do
                begin
                  NUM_ITEM := RestComplST.RegSaida.Items[N].NUM_ITEM.ToString;
                  COD_ITEM := 'P' + PadL(RestComplST.RegSaida.Items[N].GRUPO_PROD.ToString +
                                            RestComplST.RegSaida.Items[N].COD_PROD.Trim, 16, '0');

                  gravaSpedItem('P', RestComplST.RegSaida.Items[N].GRUPO_PROD,
                                     RestComplST.RegSaida.Items[N].COD_PROD.Trim, '', 0, '',
                                     RestComplST.RegSaida.Items[N].UNID.Trim);

                  Produtos.AddProduto(RestComplST.RegSaida.Items[N].GRUPO_PROD,
                                      RestComplST.RegSaida.Items[N].COD_PROD,
                                      RestComplST.RegSaida.Items[N].UNID,
                                      RestComplST.RegSaida.Items[N].UNID,
                                      RestComplST.RegSaida.Items[N].QUANT_CONV,
                                      RestComplST.RegSaida.Items[N].QUANT_CONV);

                  CST_ICMS := RestComplST.RegSaida.Items[N].CST_ICMS;
                  CFOP := RestComplST.RegSaida.Items[N].CFOP.ToString;
                  COD_MOT_REST_COMPL := FSpedF.Bloco_0.Registro0000.UF +
                                        RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL;
                  QUANT_CONV := RestComplST.RegSaida.Items[N].QUANT_CONV;
                  UNID := RestComplST.RegSaida.Items[N].UNID;
                  VL_UNIT_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_CONV;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '3']) then
                    VL_UNIT_ICMS_NA_OPERACAO_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_NA_OPERACAO_CONV;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['2']) and (RestComplST.Conf.UsarVL_UNIT_ICMS_OP_CONV) then
                    VL_UNIT_ICMS_OP_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_CONV;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2', '3']) then
                  begin
                    VL_UNIT_ICMS_OP_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_ESTOQUE_CONV;
                    VL_UNIT_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_ESTOQUE_CONV;
                    VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
                  end;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2']) then
                  begin
                    VL_UNIT_ICMS_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_REST;
                    VL_UNIT_FCP_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_REST;
                  end;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['3']) then
                  begin
                    VL_UNIT_ICMS_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_COMPL;
                    VL_UNIT_FCP_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_COMPL;
                  end;
                end;

            SqlOpen('select it.icm_orig||it.icm_cst CST_ICMS, it.cfop, it.icm_picms aliq_icms,' +
              ' sum(it.vprod + it.vseg + it.voutro - it.vdesc + case when it.frete_na_base = ''S'' then it.vfrete else 0 end) VL_OPR,' +
              ' sum(it.icm_vbc) VL_BC_ICMS, sum(it.icm_vicms) VL_ICMS,' +
              ' sum(0) VL_BC_ICMS_ST, sum(0) VL_ICMS_ST,' +
              ' sum(0) VL_IPI, '' '' COD_OBS' +
              ' from nfce_item it' +
              ' where it.cod_nfce = ' + IntToStr(vNivel2.FieldByName('cod_nfce').AsInteger) +
              ' and it.cod_empresa = ' + FCodEmpresa +
              ' group by 1,2,3', vNivel3);

            vNivel3.First;
            while not vNivel3.Eof do
            begin
  //            with FSpedF.Bloco_C.RegistroC190New do
              with RegistroC190.New do
              begin
                CST_ICMS      := vNivel3.FieldByName('cst_icms').AsString;
                CFOP          := vNivel3.FieldByName('cfop').AsString;
                ALIQ_ICMS     := vNivel3.FieldByName('aliq_icms').AsFloat;
                VL_OPR        := vNivel3.FieldByName('vl_opr').AsFloat;
                VL_BC_ICMS    := vNivel3.FieldByName('vl_bc_icms').AsFloat;
                VL_ICMS       := vNivel3.FieldByName('vl_icms').AsFloat;
                VL_BC_ICMS_ST := vNivel3.FieldByName('vl_bc_icms_st').AsFloat;
                VL_ICMS_ST    := vNivel3.FieldByName('vl_icms_st').AsFloat;
                VL_RED_BC     := IfThen((VL_OPR > VL_BC_ICMS) and (MatchStr(CST_ICMS.Substring(1,2), ['20', '70'])), VL_OPR - VL_BC_ICMS);
                VL_IPI        := vNivel3.FieldByName('vl_ipi').AsFloat;
                COD_OBS       := vNivel3.FieldByName('cod_obs').AsString;

                FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
              end;
              vNivel3.Next;
            end;
          end;
        end;
      end;

      vNivel2.Next;
    end;

    {$ENDREGION}

    {$REGION 'chamanda teste para gravar os valores de restituição complemento icms st'}
    {
    valores := TEfd_icmsst_cr_apuracoes_class.Create;
    with valores.New do
    begin
      cod_empresa := 1;
      tipo := 1;
      icmsop := 0;
      icmsst := 2;
      fcpst := 1;
    end;

    with valores.New do
    begin
      cod_empresa := 1;
      tipo := 2;
      icmsop := 1.5;
      icmsst := 0;
      fcpst := 0;
    end;

    with valores.New do
    begin
      cod_empresa := 3;
      tipo := 3;
      icmsop := 0;
      icmsst := 4;
      fcpst := 2;
    end;

    RestComplST.SalvarApuracao(valores);
    FStop := True;
    Exit;
    }
    {$ENDREGION}

    {$REGION 'Nota Fiscal Série D'}

    verificaPISCOFINSNFSerieD;

    {$REGION 'Perfil B'}

    if FSpedF.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilA then
    begin
      FLabelStatus.Caption := 'Montando registro C300';
      verificaNfSerieD;

      vNivel2.Close;
      vNivel2.SQL.Text :=
        'select ''02'' COD_MOD, nd.serie SER, nd.subserie SUB, nd.dataemissao DT_DOC,' +
        ' '''' COD_CTA,' +
        ' min(nd.numeronota) NUM_DOC_INI, max(nd.numeronota) NUM_DOC_FIN,' +
        ' sum(' +
        ' case when nd.status = ''FECHADA'' then nd.valor_geral' +
        '     else 0' +
        ' end) VL_DOC, sum(nd.valor_cofins) vl_cofins, sum(nd.valor_pis) vl_pis' +
        ' from nf_serie_d nd' +
        ' where nd.dataemissao >= :dataIni and nd.dataemissao <=' +
        ' :dataFim and nd.cod_empresa = :cod_empresa group by 1,2,3,4,5';
      vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel2.Open;

      vNivel2.FetchAll;
      FProgressBar.Position := 0;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel2.RecordCount;
      if not vNivel2.IsEmpty then
        FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;

      vNivel2.First;
      while not vNivel2.Eof do
      begin
        Application.ProcessMessages;
        with FSpedF.Bloco_C.RegistroC300New do
        begin
          COD_MOD := vNivel2.FieldByName('COD_MOD').AsString;
          SER := Trim(vNivel2.FieldByName('SER').AsString);
          SUB := Trim(vNivel2.FieldByName('SUB').AsString);
          NUM_DOC_INI := Trim(vNivel2.FieldByName('NUM_DOC_INI').AsString);
          NUM_DOC_FIN := Trim(vNivel2.FieldByName('NUM_DOC_FIN').AsString);
          DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_PIS := vNivel2.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel2.FieldByName('VL_COFINS').AsCurrency;

          vNivel3.Close;
          vNivel3.SQL.Text := 'select first 1 npc.cod_cta' +
            ' from nf_serie_d nd' +
            ' inner join nf_serie_d_itens ndi on ndi.cod_empresa = nd.cod_empresa and ndi.numeronota = nd.numeronota' +
            ' inner join produtos pr on pr.grupo_prod = ndi.grupo_prod and pr.cod_prod = ndi.cod_prod and pr.cod_empresa = ndi.cod_empresa' +
            ' inner join nat_op_p_contas_contabil npc on npc.codigo_nop = pr.codigo_nop and npc.cod_empresa = pr.cod_empresa' +
            ' where nd.dataemissao >= :dataIni and nd.dataemissao <=' +
            ' :dataFim and nd.cod_empresa = :cod_empresa';
          vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
          vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
          vNivel3.Open;

          COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString);
        end;

        vNivel3.Close;
        vNivel3.SQL.Text := 'select nd.numeronota NUM_DOC_CANC from nf_serie_d nd' +
          ' where nd.status = ''CANCELADA'' and nd.dataemissao = :dataIni and nd.cod_empresa = :cod_empresa';
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('dataIni').AsDate := vNivel2.FieldByName('DT_DOC').AsDateTime;
        vNivel3.Open;

        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC310New do
          begin
            NUM_DOC_CANC := vNivel3.FieldByName('NUM_DOC_CANC').AsString;
          end;
          vNivel3.Next;
        end;

        vNivel3.Close;
        vNivel3.SQL.Text := 'select p.cst_prod CST_ICMS, p.codigo_nop CFOP, ndi.aliquota ALIQ_ICMS,'
          +
          ' sum(ndi.vl_tot_item) VL_OPR, sum(ndi.base_icm) VL_BC_ICMS, sum(ndi.valor_icm)' +
          ' VL_ICMS, sum( case when ( (ndi.base_icm > 0) and (ndi.vl_tot_item > ndi.base_icm)) then' +
          '   (ndi.vl_tot_item - ndi.base_icm) else 0 end) VL_RED_BC, '''' COD_OBS' +
          ' from nf_serie_d nd inner join nf_serie_d_itens ndi on ndi.numeronota =' +
          ' nd.numeronota and ndi.cod_empresa = nd.cod_empresa' +
          ' inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod_prod =' +
          ' ndi.cod_prod and p.cod_empresa = ndi.cod_empresa' +
          ' where nd.dataemissao = :dia and nd.cod_empresa = :cod_empresa' +
          ' and coalesce(nd.status, '' '') <> ''CANCELADA'' ' +
          ' group by 1,2,3';
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('dia').AsDate := vNivel2.FieldByName('DT_DOC').AsDateTime;
        vNivel3.Open;

        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC320New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsCurrency;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsCurrency;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsCurrency,2);
            //if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsCurrency;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;

          vNivel4.Close;
          vNivel4.SQL.Text :=
            'select ndi.grupo_prod, ndi.cod_prod, p.unidade UNID, 0 VL_DESC,' +
            ' sum(ndi.quantid_item) QTD, sum(ndi.vl_tot_item) VL_ITEM,' +
            ' sum(ndi.base_icm) VL_BC_ICMS, sum(ndi.valor_icm) VL_ICMS,' +
            ' sum(nd.valor_cofins) vl_cofins, sum(nd.valor_pis) vl_pis' +
            ' from nf_serie_d nd inner join nf_serie_d_itens ndi on ndi.numeronota =' +
            ' nd.numeronota and ndi.cod_empresa = nd.cod_empresa' +
            ' inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod_prod =' +
            ' ndi.cod_prod and p.cod_empresa = ndi.cod_empresa' +
            ' where nd.dataemissao = :dia and nd.cod_empresa = :cod_empresa' +
            ' and coalesce(nd.status, '' '') <> ''CANCELADA'' ' +
            ' and p.cst_prod = :cst_prod and p.codigo_nop = :codigo_nop and ndi.aliquota = :aliquota' +
            ' group by 1,2,3,4';
          vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel4.ParamByName('dia').AsDate := vNivel2.FieldByName('DT_DOC').AsDateTime;
          vNivel4.ParamByName('cst_prod').AsString := vNivel3.FieldByName('CST_ICMS').AsString;
          vNivel4.ParamByName('codigo_nop').AsFloat := vNivel3.FieldByName('CFOP').AsFloat;
          vNivel4.ParamByName('aliquota').AsFloat := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
          vNivel4.Open;

          vNivel4.First;
          while not vNivel4.Eof do
          begin
            with FSpedF.Bloco_C.RegistroC321New do
            begin
              COD_ITEM := 'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
                Trim(vNivel4.FieldByName('cod_prod').AsString), 16);

              QTD := vNivel4.FieldByName('QTD').AsFloat;
//              UNID := getUnidade('P',
//                vNivel4.FieldByName('grupo_prod').AsInteger,
//                vNivel4.FieldByName('cod_prod').AsString,
//                '' , 0,'');
              if Trim(UNID) = '' then
                UNID := UpperCase(Trim(vNivel4.FieldByName('UNID').AsString));

              gravaSpedItem('P',
                vNivel4.FieldByName('grupo_prod').AsInteger,
                vNivel4.FieldByName('cod_prod').AsString, '', 0, '', UNID);

              VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency;
              VL_DESC := vNivel4.FieldByName('VL_DESC').AsCurrency;
              VL_BC_ICMS := vNivel4.FieldByName('VL_BC_ICMS').AsCurrency;
              VL_ICMS := StrToFloatFormat(vNivel4.FieldByName('VL_ICMS').AsCurrency,2);
              VL_PIS := vNivel4.FieldByName('VL_PIS').AsCurrency;
              VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsCurrency;
            end;

            //Restituição Complemento do Item da NF
            if RestComplST.RegistroC330(vNivel2.FieldByName('dt_doc').AsDateTime,
                                        vNivel4.FieldByName('grupo_prod').AsInteger,
                                        vNivel4.FieldByName('cod_prod').AsString).Count > 0 then
              for N := 0 to RestComplST.RegSaida.Count - 1 do
                with FSpedF.Bloco_C.RegistroC330New do
                begin
                  COD_MOT_REST_COMPL := FSpedF.Bloco_0.Registro0000.UF +
                                        RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL;
                  QUANT_CONV := RestComplST.RegSaida.Items[N].QUANT_CONV;
                  UNID := RestComplST.RegSaida.Items[N].UNID;

                  Produtos.AddProduto(RestComplST.RegSaida.Items[N].GRUPO_PROD,
                                      RestComplST.RegSaida.Items[N].COD_PROD,
                                      RestComplST.RegSaida.Items[N].UNID,
                                      RestComplST.RegSaida.Items[N].UNID,
                                      RestComplST.RegSaida.Items[N].QUANT_CONV,
                                      RestComplST.RegSaida.Items[N].QUANT_CONV);

                  VL_UNIT_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_CONV;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '3']) then
                    VL_UNIT_ICMS_NA_OPERACAO_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_NA_OPERACAO_CONV;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['2']) and (RestComplST.Conf.UsarVL_UNIT_ICMS_OP_CONV) then
                    VL_UNIT_ICMS_OP_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_CONV;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2', '3']) then
                  begin
                    VL_UNIT_ICMS_OP_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_ESTOQUE_CONV;
                    VL_UNIT_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_ESTOQUE_CONV;
                    VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
                  end;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2']) then
                  begin
                    VL_UNIT_ICMS_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_REST;
                    VL_UNIT_FCP_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_REST;
                  end;

                  if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['3']) then
                  begin
                    VL_UNIT_ICMS_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_COMPL;
                    VL_UNIT_FCP_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_COMPL;
                  end;
                end;

            vNivel4.Next;
          end;

          vNivel3.Next;
        end;

        vNivel2.Next;
        FProgressBar.Position := FProgressBar.Position + 1;
      end;
    end;

    {$ENDREGION}

    {$REGION 'Perfil A'}

    if FSpedF.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilB then
    begin
      FLabelStatus.Caption := 'Montando registro C350';
      verificaNfSerieD;

      vNivel2.Close;
      vNivel2.SQL.Text := 'select nd.numeronota NUM_DOC, nd.serie SER, nd.subserie SUB_SER,' +
        ' nd.dataemissao DT_DOC, c.cpfcgc CNPJ_CPF, nd.valor_geral VL_MERC,' +
        ' nd.valor_geral VL_DOC, 0 VL_DESC, nd.valor_pis VL_PIS, nd.valor_cofins VL_COFINS, '''' COD_CTA' +
        ' from nf_serie_d nd' +
        ' inner join clientes c on c.cod_cliente = nd.cod_cliente and c.cod_empresa =' +
        ' nd.cod_empresa where nd.dataemissao >= :dataIni and nd.dataemissao <=' +
        ' :dataFim and nd.cod_empresa = :cod_empresa and ((nd.status <> ''CANCELADA'')' +
        ' or (nd.status is null))';
      vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel2.Open;
      vNivel2.FetchAll;
      FProgressBar.Position := 0;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel2.RecordCount;
      if not vNivel2.IsEmpty then
        FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;

      vNivel2.First;
      while not vNivel2.Eof do
      begin
        Application.ProcessMessages;
        with FSpedF.Bloco_C.RegistroC350New do
        begin
          SER := Trim(vNivel2.FieldByName('SER').AsString);
          SUB_SER := Trim(vNivel2.FieldByName('SUB_SER').AsString);
          NUM_DOC := Trim(vNivel2.FieldByName('NUM_DOC').AsString);
          DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;
          CNPJ_CPF := Trim(vNivel2.FieldByName('CNPJ_CPF').AsString);
          VL_MERC := vNivel2.FieldByName('VL_MERC').AsCurrency;
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          VL_PIS := vNivel2.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel2.FieldByName('VL_COFINS').AsCurrency;

          vNivel3.Close;
          vNivel3.SQL.Text := 'select first 1 npc.cod_cta' +
            ' from nf_serie_d nd' +
            ' inner join nf_serie_d_itens ndi on ndi.cod_empresa = nd.cod_empresa and ndi.numeronota = nd.numeronota' +
            ' inner join produtos pr on pr.grupo_prod = ndi.grupo_prod and pr.cod_prod = ndi.cod_prod and pr.cod_empresa = ndi.cod_empresa' +
            ' inner join nat_op_p_contas_contabil npc on npc.codigo_nop = pr.codigo_nop and npc.cod_empresa = pr.cod_empresa' +
            ' where ndi.numeronota = :numeronota and ndi.cod_empresa = :cod_empresa';
          vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel3.ParamByName('numeronota').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
          vNivel3.Open;
          vNivel3.Open;

          COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString);
        end;

        vNivel3.Close;
        vNivel3.SQL.Text := 'select ndi.grupo_prod, ndi.cod_prod, ndi.quantid_item QTD,' +
          ' p.unidade UNID, ndi.vl_tot_item VL_ITEM, 0 VL_DESC' +
          ' from nf_serie_d_itens ndi' +
          ' inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod_prod =' +
          ' ndi.cod_prod and p.cod_empresa = ndi.cod_empresa' +
          ' where ndi.numeronota = :numeronota and ndi.cod_empresa = :cod_empresa';
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('numeronota').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
        vNivel3.Open;

        vIntegerTemp := 0;
        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC370New do
          begin
            inc(vIntegerTemp);
            NUM_ITEM := IntToStr(vIntegerTemp);
            COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
              Trim(vNivel3.FieldByName('cod_prod').AsString), 16);

            QTD := vNivel3.FieldByName('QTD').AsFloat;
//            UNID := getUnidade('P',
//                vNivel3.FieldByName('grupo_prod').AsInteger,
//                vNivel3.FieldByName('cod_prod').AsString,
//                '' , 0, '');
            if Trim(UNID) = '' then
              UNID := UpperCase(Trim(vNivel3.FieldByName('UNID').AsString));

            gravaSpedItem('P',
              vNivel3.FieldByName('grupo_prod').AsInteger,
              vNivel3.FieldByName('cod_prod').AsString, '', 0, '', UNID);
            VL_ITEM := vNivel3.FieldByName('VL_ITEM').AsCurrency;
            VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
          end;

          //Restituição Complemento do Item da NF
          if RestComplST.RegistroC380(vNivel2.FieldByName('num_doc').AsInteger,
                                      vNivel3.FieldByName('grupo_prod').AsInteger,
                                      vNivel3.FieldByName('cod_prod').AsString).Count > 0 then
            for N := 0 to RestComplST.RegSaida.Count - 1 do
              with FSpedF.Bloco_C.RegistroC380New do
              begin
                COD_MOT_REST_COMPL := FSpedF.Bloco_0.Registro0000.UF +
                                      RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL;
                QUANT_CONV := RestComplST.RegSaida.Items[N].QUANT_CONV;
                UNID := RestComplST.RegSaida.Items[N].UNID;

                Produtos.AddProduto(RestComplST.RegSaida.Items[N].GRUPO_PROD,
                                      RestComplST.RegSaida.Items[N].COD_PROD,
                                      RestComplST.RegSaida.Items[N].UNID,
                                      RestComplST.RegSaida.Items[N].UNID,
                                      RestComplST.RegSaida.Items[N].QUANT_CONV,
                                      RestComplST.RegSaida.Items[N].QUANT_CONV);

                VL_UNIT_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_CONV;

                if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '3']) then
                    VL_UNIT_ICMS_NA_OPERACAO_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_NA_OPERACAO_CONV;

                if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['2']) and (RestComplST.Conf.UsarVL_UNIT_ICMS_OP_CONV) then
                  VL_UNIT_ICMS_OP_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_CONV;

                if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2', '3']) then
                begin
                  VL_UNIT_ICMS_OP_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_ESTOQUE_CONV;
                  VL_UNIT_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_ESTOQUE_CONV;
                  VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
                end;

                if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2']) then
                begin
                  VL_UNIT_ICMS_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_REST;
                  VL_UNIT_FCP_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_REST;
                end;

                if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['3']) then
                begin
                  VL_UNIT_ICMS_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_COMPL;
                  VL_UNIT_FCP_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_COMPL;
                end;

                CST_ICMS := RestComplST.RegSaida.Items[N].CST_ICMS;
                CFOP := RestComplST.RegSaida.Items[N].CFOP.ToString;
              end;

          vNivel3.Next;
        end;

        vNivel3.Close;
        vNivel3.SQL.Text := 'select p.cst_prod CST_ICMS, p.codigo_nop CFOP, ndi.aliquota ALIQ_ICMS,' +
          ' sum(ndi.vl_tot_item) VL_OPR, sum(ndi.base_icm) VL_BC_ICMS, sum(ndi.valor_icm)' +
          ' VL_ICMS, sum( case when ( (ndi.base_icm > 0) and (ndi.vl_tot_item > ndi.base_icm)) then' +
          '   (ndi.vl_tot_item - ndi.base_icm) else 0 end) VL_RED_BC, '''' COD_OBS' +
          ' from nf_serie_d nd inner join nf_serie_d_itens ndi on ndi.numeronota =' +
          ' nd.numeronota and ndi.cod_empresa = nd.cod_empresa' +
          ' inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod_prod =' +
          ' ndi.cod_prod and p.cod_empresa = ndi.cod_empresa' +
          ' where nd.numeronota = :numeronota and nd.cod_empresa = :cod_empresa group by 1,2,3';
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('numeronota').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
        vNivel3.Open;

        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC390New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsCurrency;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsCurrency;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsCurrency,2);
            //if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsCurrency;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;
          vNivel3.Next;
        end;

        vNivel2.Next;
        FProgressBar.Position := FProgressBar.Position + 1;
      end;
    end;

    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'Cupons Fiscal modelo 2D'}

    FLabelStatus.Caption := 'Montando registro C400';
    vNivel2.Close;
    vNivel2.SQL.Text := 'select ''2D'' COD_MOD, cniee.modelo_ecf ECF_MOD, ti.num_serie_ecf ECF_FAB,'
      +
      ' ti.cod_terminal ECF_CX from terminal_impressoras ti' +
      ' inner join impressoras_cniee cniee on cniee.identificacao = ti.ident_cniee' +
      ' where cod_empresa = :cod_empresa order by 4';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.Open;
    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;

    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C400';
      FLabelCupons.Caption := '';
      vStringTemp := vNivel2.FieldByName('ECF_CX').AsString + ' ' +
        vNivel2.FieldByName('ECF_FAB').AsString;
      Application.ProcessMessages;
      verificaCamposNullCupom(Trim(vNivel2.FieldByName('ECF_FAB').AsString),
        vNivel2.FieldByName('ECF_CX').AsInteger);
      _verificaPISCOFINSCupomFiscal(Trim(vNivel2.FieldByName('ECF_FAB').AsString),
        vNivel2.FieldByName('ECF_CX').AsInteger);
      Application.ProcessMessages;
      FLabelStatus.Caption := 'Montando registro C400';
      if verificaCupomSemZ(Trim(vNivel2.FieldByName('ECF_FAB').AsString),
        vNivel2.FieldByName('ECF_CX').AsInteger) then
      begin
        FLabelStatus.Caption := 'Montando registro C400';
        vNivel3.Close;
        vNivel3.SQL.Text :=
          'select rd.data_mov DT_DOC, rd.cro_mov CRO, rd.nreducoes CRZ, rd.coored NUM_COO_FIN,' +
          ' rd.vltotgeral GT_FIN, rd.vlvendab VL_BRT' +
          ' from resumod rd where rd.cod_terminal = :cod_terminal and rd.nserieecf = :nserie' +
          ' and rd.cod_empresa = :cod_empresa and rd.data_mov >= :dataIni and rd.data_mov <= :dataFim' +
          ' order by 1';
        vNivel3.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
        vNivel3.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
        vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
        vNivel3.Open;
        vNivel3.FetchAll;
        FProgressBar.Position := 0;
        FProgressBar.Min := 0;
        FProgressBar.Max := vNivel3.RecordCount;

        vNivel3.First;
        while not vNivel3.Eof do
        begin

          if (not vNivel3.IsEmpty) and (vNivel3.FieldByName('VL_BRT').AsCurrency > 0) then
          begin
            FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;
            montaRegistroC400(vNivel2.FieldByName('COD_MOD').AsString,
              vNivel2.FieldByName('ECF_MOD').AsString,
              vNivel2.FieldByName('ECF_FAB').AsString,
              vNivel2.FieldByName('ECF_CX').AsString);
          end;

          FLabelCupons.Caption := vStringTemp + ' Dia: ' +
            DateToStr(vNivel3.FieldByName('DT_DOC').AsDateTime) + ' C405';
          Application.ProcessMessages;
          if vNivel3.FieldByName('VL_BRT').AsCurrency > 0 then
          with FSpedF.Bloco_C.RegistroC405New do
          begin
            DT_DOC := vNivel3.FieldByName('DT_DOC').AsDateTime;
            CRO := vNivel3.FieldByName('CRO').AsInteger;
            CRZ := vNivel3.FieldByName('CRZ').AsInteger;
            NUM_COO_FIN := vNivel3.FieldByName('NUM_COO_FIN').AsInteger;
            GT_FIN := vNivel3.FieldByName('GT_FIN').AsCurrency;
            // o valor de venda bruta vai sendo incrementado no c420
            // VL_BRT := vNivel3.FieldByName('VL_BRT').AsCurrency;
            VL_BRT := 0;

            FLabelCupons.Caption := vStringTemp + ' Dia: ' +
              DateToStr(vNivel3.FieldByName('DT_DOC').AsDateTime) + ' C420';
            Application.ProcessMessages;

            vNivel4.Close;
            vNivel4.SQL.Text := 'select' +
              ' case when ((mra.descaliq = ''Can-T'') or (mra.descaliq = ''Canc-T'')) then ''CAN-T''' +
              ' when ((mra.descaliq = ''Can-S'') or (mra.descaliq = ''Canc-S'')) then ''CAN-T''' +
              ' else mra.descaliq ' +
              ' end COD_TOT_PAR, mra.valoraliq VLR_ACUM_TOT,' +
              ' case when ((substring(mra.descaliq from 3 for 1) = ''T'') or' +
              '     (substring(mra.descaliq from 3 for 1) = ''S'')) then' +
              '         substring(mra.descaliq from 1 for 2)' +
              '      else ''0''' +
              ' end NR_TOT, '''' DESCR_NR_TOT, mra.descaliq' +
              ' from mapa_resumo_aliq mra where mra.coored = :coored and' +
              ' mra.cod_terminal = :cod_terminal and mra.nserieecf = :nserie' +
              ' and mra.cod_empresa = :cod_empresa';
            vNivel4.ParamByName('coored').AsInteger := vNivel3.FieldByName('NUM_COO_FIN').AsInteger;
            vNivel4.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
            vNivel4.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel4.Open;
            vNivel4.FetchAll;

            FProgressBar2.Position := 0;
            FProgressBar2.Min := 0;
            FProgressBar2.Max := vNivel4.RecordCount;

            vListaTotalizadores.Clear;

            vNivel4.First;
            while not vNivel4.Eof do
            begin
              IF Trim(vNivel4.FieldByName('COD_TOT_PAR').AsString) <> 'AT' then
              with FSpedF.Bloco_C.RegistroC420New do
              begin
                if Trim(vNivel4.FieldByName('COD_TOT_PAR').AsString) = 'FS' then
                  COD_TOT_PAR := 'FS1'
                else
                  COD_TOT_PAR := Trim(vNivel4.FieldByName('COD_TOT_PAR').AsString);
                  VLR_ACUM_TOT := vNivel4.FieldByName('VLR_ACUM_TOT').AsCurrency;
                try
                  NR_TOT := vNivel4.FieldByName('NR_TOT').AsInteger;
                  DESCR_NR_TOT := Trim(vNivel4.FieldByName('DESCR_NR_TOT').AsString);
                except
                end;

                if (Trim(COD_TOT_PAR) <> 'OPNF') and (Trim(COD_TOT_PAR) <> 'DO') and
                  (Trim(COD_TOT_PAR) <> 'AO') and (Trim(COD_TOT_PAR) <> 'CAN-O') and (Trim(COD_TOT_PAR) <> 'IOF') then
                begin
                  VL_BRT := VL_BRT + VLR_ACUM_TOT;
                  if Pos('CAN', COD_TOT_PAR) = 0 then
                  begin
                    if Trim(COD_TOT_PAR) = 'F1' then
                      vStringTemp2 := 'F'
                    else if Trim(COD_TOT_PAR) = 'I1' then
                      vStringTemp2 := 'I'
                    else if Trim(COD_TOT_PAR) = 'N1' then
                      vStringTemp2 := 'N'
//                    else if (Trim(COD_TOT_PAR) = 'FS1') or (Copy(Trim(COD_TOT_PAR),3,1) = 'S') then
//                      vStringTemp2 := 'SERV'
                    else if (Trim(COD_TOT_PAR) = 'FS1') then
                      vStringTemp2 := 'FS'
                    else if (Trim(COD_TOT_PAR) = 'IS1') then
                      vStringTemp2 := 'IS'
                    else if (Trim(COD_TOT_PAR) = 'NS1') then
                      vStringTemp2 := 'NS'
                    else
                      vStringTemp2 := Trim(vNivel4.FieldByName('descaliq').AsString);

                    vBooleanTemp := False;
                    for I := 0 to vListaTotalizadores.Count - 1 do
                      if getCampoPipe(vListaTotalizadores[i], 1) = vStringTemp2 then
                      begin
                        vListaTotalizadores[i] :=
                          getCampoPipe(vListaTotalizadores[i], 1) + '|' +
                          format('%0.2f', [
                            (StrToFloat(getCampoPipe(vListaTotalizadores[i], 2))) +
                            VLR_ACUM_TOT]) + '|';
                        vBooleanTemp := True;
                        Break;
                      end;

                    if not vBooleanTemp then
                      vListaTotalizadores.Add(
                        Trim(vStringTemp2) + '|' +
                        format('%0.2f', [VLR_ACUM_TOT]) + '|'
                      );
                  end;
                end;

                if (FSpedF.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilA) and
                  ((copy(COD_TOT_PAR, 3, 1) = 'T') or (copy(COD_TOT_PAR, 3, 1) = 'S') or
                  (Trim(COD_TOT_PAR) = 'F1') or (Trim(COD_TOT_PAR) = 'I1') or (Trim(COD_TOT_PAR) = 'N1') or (Trim(COD_TOT_PAR) = 'FS1')) then
                begin
                  if (copy(COD_TOT_PAR, 3, 1) = 'T') or (copy(COD_TOT_PAR, 3, 1) = 'S') then
                    vListaTemp.Add(copy(COD_TOT_PAR, 4, 4) + '|' + Format('%0.2f',[VLR_ACUM_TOT])+'|');
                  //else
                    //vListaTemp.Add(COD_TOT_PAR + '|' + Format('%0.2f',[VLR_ACUM_TOT])+'|');

                  vNivel5.Close;
                  vNivel5.SQL.Text :=
                    'select cp2.prod_serv tipo_item, cp2.grupo_prod, cp2.cod_prod, p.unidade UNID,' +
                    ' p.isento_pis, sum(cp2.valor_pis) VL_PIS, sum(cp2.valor_cofins) VL_COFINS,' +
                    ' SUM(cp2.quantidade) QTD,' +
                    ' sum( (coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0)))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0) ) VL_ITEM' +
                    //' SUM(cp2.quantidade) QTD, sum(cp2.total) VL_ITEM' +
                  ' from cupom cp inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
                    ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
                    ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
                    ' left join produtos p on p.grupo_prod = cp2.grupo_prod and p.cod_prod =' +
                    ' cp2.cod_prod and p.cod_empresa = cp2.cod_empresa' +
                    ' where ((cp2.status_it <> ''CANCELADO'') or (cp2.status_it IS NULL))' +
                    ' and ((cp.status_cp <> ''CANCELADO'') or (cp.status_cp is null))' +
                    ' and cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
                    ' and cp2.descaliq = :descaliq' +
                    ' and cp2.cod_empresa = :cod_empresa and cp.data = :dia group by 1,2,3,4,5';
                  vNivel5.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
                  vNivel5.ParamByName('cod_terminal').AsInteger :=
                    vNivel2.FieldByName('ECF_CX').AsInteger;
                  vNivel5.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
                  if Trim(COD_TOT_PAR) = 'F1' then
                  begin
                    vNivel5.SQL.Text := StringReplace(vNivel5.SQL.Text,
                      'cp2.descaliq = :descaliq',
                      'cp2.aliquota_it = :descaliq', [rfReplaceAll, rfIgnoreCase]);
                    vNivel5.ParamByName('descaliq').AsString := 'FF';
                    //                  vNivel5.ParamByName('descaliq1').AsString := 'F1';
                  end
                  else if Trim(COD_TOT_PAR) = 'I1' then
                  begin
                    vNivel5.SQL.Text := StringReplace(vNivel5.SQL.Text,
                      'cp2.descaliq = :descaliq',
                      'cp2.aliquota_it = :descaliq', [rfReplaceAll, rfIgnoreCase]);
                    vNivel5.ParamByName('descaliq').AsString := 'II';
                    //                  vNivel5.ParamByName('descaliq').AsString := 'I';
                    //                  vNivel5.ParamByName('descaliq1').AsString := 'I1';
                  end
                  else if Trim(COD_TOT_PAR) = 'N1' then
                  begin
                    vNivel5.SQL.Text := StringReplace(vNivel5.SQL.Text,
                      'cp2.descaliq = :descaliq',
                      'cp2.aliquota_it = :descaliq', [rfReplaceAll, rfIgnoreCase]);
                    vNivel5.ParamByName('descaliq').AsString := 'NN';
                    //                  vNivel5.ParamByName('descaliq').AsString := 'N';
                    //                  vNivel5.ParamByName('descaliq1').AsString := 'N1';
                  end
                  else if Trim(COD_TOT_PAR) = 'FS1' then
                    vNivel5.ParamByName('descaliq').AsString := 'FS'
                  else if Trim(COD_TOT_PAR) = 'IS1' then
                    vNivel5.ParamByName('descaliq').AsString := 'IS'
                  else if Trim(COD_TOT_PAR) = 'NS1' then
                    vNivel5.ParamByName('descaliq').AsString := 'NS'
                  else
                    vNivel5.ParamByName('descaliq').AsString := Trim(COD_TOT_PAR);

                  vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                  vNivel5.Open;

                  vCurrencyTemp := 0;
                  vNivel5.First;
                  while not vNivel5.Eof do
                  begin
                    vCurrencyTemp := vCurrencyTemp + vNivel5.FieldByName('VL_ITEM').AsFloat;
                    vNivel5.Next;
                  end;
                  if Abs(vCurrencyTemp - vNivel4.FieldByName('VLR_ACUM_TOT').AsCurrency) <= 0.5 then
                    vCurrencyTemp := 0;

                  vNivel5.First;
                  while not vNivel5.Eof do
                  begin
                    if StrToFloatFormat(vNivel5.FieldByName('VL_ITEM').AsFloat, 2) > 0 then
                    begin
                      with FSpedF.Bloco_C.RegistroC425New do
                      begin
    //                    UNID := getUnidade('P',
    //                        vNivel5.FieldByName('grupo_prod').AsInteger,
    //                        vNivel5.FieldByName('cod_prod').AsString,
    //                        '', 0,'');
                        if Trim(UNID) = '' then
                          UNID := UpperCase(Trim(vNivel5.FieldByName('UNID').AsString));
                        if Trim(UNID) = '' then
                          UNID := 'UN';
                        if vNivel5.FieldByName('tipo_item').AsString = 'P' then
                        begin
                          COD_ITEM := 'P' + StrZero(vNivel5.FieldByName('grupo_prod').AsString +
                            Trim(vNivel5.FieldByName('cod_prod').AsString), 16);

                          gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                            vNivel5.FieldByName('grupo_prod').AsInteger,
                            vNivel5.FieldByName('cod_prod').AsString, '', 0, '', UNID);
                        end
                        else if vNivel5.FieldByName('tipo_item').AsString = 'S' then
                        begin
                          COD_ITEM := 'S' + StrZero(vNivel5.FieldByName('grupo_prod').AsString, 16);

                          gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                            0, '', '', vNivel5.FieldByName('grupo_prod').AsInteger, '', UNID);
                        end;
                        QTD := vNivel5.FieldByName('QTD').AsFloat;
                        VL_ITEM := vNivel5.FieldByName('VL_ITEM').AsFloat;
                        if vCurrencyTemp > 0 then
                          VL_ITEM := (VL_ITEM / vCurrencyTemp) *
                            (vNivel4.FieldByName('VLR_ACUM_TOT').AsCurrency - vCurrencyTemp) + VL_ITEM;

                        VL_PIS := vNivel5.FieldByName('VL_PIS').AsFloat;
                        VL_COFINS := vNivel5.FieldByName('VL_COFINS').AsFloat;
                      end;

                      //Restituição Complemento do Item da NF
                      if RestComplST.RegistroC430(vNivel3.FieldByName('dt_doc').AsDateTime,
                                                  vNivel5.FieldByName('grupo_prod').AsInteger,
                                                  vNivel5.FieldByName('cod_prod').AsString).Count > 0 then
                        for N := 0 to RestComplST.RegSaida.Count - 1 do
                          with FSpedF.Bloco_C.RegistroC430New do
                          begin
                            COD_MOT_REST_COMPL := FSpedF.Bloco_0.Registro0000.UF +
                                                  RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL;
                            QUANT_CONV := RestComplST.RegSaida.Items[N].QUANT_CONV;
                            UNID := IfEmpty(vNivel5.FieldByName('UNID').AsString, 'UN'); //RestComplST.RegSaida.Items[N].UNID;
                            VL_UNIT_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_CONV;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '3']) then
                              VL_UNIT_ICMS_NA_OPERACAO_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_NA_OPERACAO_CONV;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['2']) and (RestComplST.Conf.UsarVL_UNIT_ICMS_OP_CONV) then
                              VL_UNIT_ICMS_OP_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_CONV;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2', '3']) then
                            begin
                              VL_UNIT_ICMS_OP_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_ESTOQUE_CONV;
                              VL_UNIT_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_ESTOQUE_CONV;
                              VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
                            end;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2']) then
                            begin
                              VL_UNIT_ICMS_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_REST;
                              VL_UNIT_FCP_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_REST;
                            end;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['3']) then
                            begin
                              VL_UNIT_ICMS_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_COMPL;
                              VL_UNIT_FCP_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_COMPL;
                            end;

                            CST_ICMS := RestComplST.RegSaida.Items[N].CST_ICMS;
                            CFOP := RestComplST.RegSaida.Items[N].CFOP.ToString;
                          end;

                    end;
                    vNivel5.Next;
                  end;
                end;
              end;
              vNivel4.Next;
              FProgressBar2.Position := FProgressBar2.Position + 1;
            end;

            FLabelCupons.Caption := vStringTemp + ' Dia: ' +
              DateToStr(vNivel3.FieldByName('DT_DOC').AsDateTime) + ' C460';
            Application.ProcessMessages;

            if FSpedF.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilB then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := ' select cp2.descaliq, sum(coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0)) VL_ITEM' +
                ' from cupom cp' +
                ' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
                ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
                ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
                ' where cp.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
                ' and cp.cod_empresa = :cod_empresa' +
                ' and coalesce(cp2.status_it,'''') <> ''CANCELADO'' and cp.data = :dia' +
                ' group by 1';
              vQrAux.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
              vQrAux.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
              vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vQrAux.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
              vQrAux.Open;

              if vListaSumC470 = nil then
                vListaSumC470 := TStringList.Create;
              vListaSumC470.Clear;

              vQrAux.First;
              while not vQrAux.Eof do
              begin

                if (Copy(vQrAux.FieldByName('descaliq').AsString,3,1) = 'T') then
                  vListaSumC470.Add(Trim(vQrAux.FieldByName('descaliq').AsString) + '|' +
                    Format('%0.2f', [vQrAux.FieldByName('VL_ITEM').AsFloat]) + '|');

                vQrAux.Next;
              end;

              vQrAux.Close;
              vQrAux.SQL.Text := 'select cp2.descaliq, cp2.cst, max(cp.cupom||''|''||cp2.nitem),' +
                ' sum(coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0)) VL_ITEM' +
                ' from cupom cp' +
                ' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
                ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
                ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
                ' where cp.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
                ' and cp.cod_empresa = :cod_empresa' +
                ' and coalesce(cp2.status_it,'''') <> ''CANCELADO'' and cp.data = :dia' +
                ' group by 1,2';
              vQrAux.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
              vQrAux.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
              vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vQrAux.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
              vQrAux.Open;

              if vListaUltimosC490 = nil then
                vListaUltimosC490 := TStringList.Create;
              vListaUltimosC490.Clear;

              vQrAux.First;
              while not vQrAux.Eof do
              begin

                if (Copy(vQrAux.FieldByName('descaliq').AsString,3,1) = 'T') then
                  vListaUltimosC490.Add(Trim(vQrAux.FieldByName('descaliq').AsString) + '|' +
                    Trim(vQrAux.FieldByName('cst').AsString) + '|' +
                    Format('%0.2f', [vQrAux.FieldByName('VL_ITEM').AsFloat]) + '|');

                vQrAux.Next;
              end;



              vNivel4.Close;
              vNivel4.SQL.Text := 'select cp.registro, ''2D'' COD_MOD,' +
                ' case when cp.status_cp = ''CANCELADO'' then ''02''' +
                '     else ''00''' +
                ' end COD_SIT, cp.cupom NUM_DOC, cp.data DT_DOC, cp.valorcupom VL_DOC,' +
                ' cp.valor_pis VL_PIS, cp.valor_cofins VL_COFINS, c.cpfcgc CPF_CNPJ, c.nome_cliente NOM_ADQ' +
                ' from cupom cp left join clientes c on c.cod_cliente = cp.cliente and' +
                ' c.cod_empresa = cp.cod_empresa' +
                ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
                ' and cp.cod_empresa = :cod_empresa and cp.data = :dia' +
                ' order by cp.cupom';
              vNivel4.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
              vNivel4.ParamByName('cod_terminal').AsInteger :=
                vNivel2.FieldByName('ECF_CX').AsInteger;
              vNivel4.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              vNivel4.FetchAll;

              FProgressBar2.Position := 0;
              FProgressBar2.Min := 0;
              FProgressBar2.Max := vNivel4.RecordCount;

              FValorPISAcumulado := 0;
              FValorCOFINSAcumulado := 0;

              vNivel4.First;
              while not vNivel4.Eof do
              begin

                with FSpedF.Bloco_C.RegistroC460New do
                begin
                  COD_MOD := Trim(vNivel4.FieldByName('COD_MOD').AsString);
                  if vNivel4.FieldByName('COD_SIT').AsString = '02' then
                    COD_SIT := sdCancelado
                  else
                    COD_SIT := sdRegular;
                  NUM_DOC := Trim(vNivel4.FieldByName('NUM_DOC').AsString);
                  vBooleanTemp := False;
                  if COD_SIT = sdRegular then
                  begin
                    vBooleanTemp := True;
                    DT_DOC := vNivel4.FieldByName('DT_DOC').AsDateTime;
//                    VL_DOC := vNivel4.FieldByName('VL_DOC').AsCurrency;
                    VL_PIS := vNivel4.FieldByName('VL_PIS').AsCurrency;
                    VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsCurrency;
                    CPF_CNPJ := Trim(vNivel4.FieldByName('CPF_CNPJ').AsString);
                    NOM_ADQ := Trim(vNivel4.FieldByName('NOM_ADQ').AsString);

                    vNivel5.Close;
                    vNivel5.SQL.Text :=
                      'select cp2.prod_serv tipo_item, cp2.grupo_prod, cp2.cod_prod, cp2.quantidade QTD,' +
                      ' case when cp2.status_it = ''CANCELADO'' then cp2.quantidade' +
                      '     else 0' +
                      ' end QTD_CANC, p.unidade UNID,' +
                      ' (coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0)))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0) VL_ITEM,' +

                      ' case when (cp2.prod_serv = ''S'') then ''041''' +
                      ' when (coalesce(cp2.cst, '''') <> '''') then cp2.cst' +
                      '   else p.cst_prod' +
                      ' end CST_ICMS,' +
                      ' case when ((not cp2.codigo_nop is null) and ( cp2.codigo_nop > 0)) then cp2.codigo_nop' +
                      ' when ((cp2.prod_serv = ''S'') and (not ts.codigo_nop is null)) then ts.codigo_nop' +
                      '   when (cp2.prod_serv = ''S'') then 5949' +
                      '   else p.codigo_nop' +
                      ' end CFOP,' +
                      ' case when (substring(cp2.descaliq from 3 for 1) = ''T'') then' +
                      '  substring(cp2.descaliq from 4 for 2)||'',''||substring(cp2.descaliq from 6 for 2)' +
                      '     else ''0''' +
                      ' end ALIQ_ICMS, cp2.valor_pis VL_PIS, cp2.valor_cofins VL_COFINS, p.isento_pis, cp2.descaliq' +
                      ' from cupom2 cp2' +
                      ' left join produtos p on p.grupo_prod = cp2.grupo_prod and p.cod_prod =' +
                      ' cp2.cod_prod and p.cod_empresa = cp2.cod_empresa' +
                      ' left join tipo_servico ts on ts.cod_servico = cp2.grupo_prod and cp2.prod_serv = ''S''' +
                      ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
                      ' and cp2.cod_empresa = :cod_empresa and cp2.cupom = :cupom and cp2.ordem = :ordem' +
                      ' and coalesce(cp2.status_it,'''') <> ''CANCELADO''' +
                      ' order by cp2.nitem';
                    vNivel5.ParamByName('cod_terminal').AsInteger :=
                      vNivel2.FieldByName('ECF_CX').AsInteger;
                    vNivel5.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
                    vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                    vNivel5.ParamByName('cupom').AsInteger := vNivel4.FieldByName('NUM_DOC').AsInteger;
                    vNivel5.ParamByName('ordem').AsInteger := vNivel4.FieldByName('registro').AsInteger;
                    vNivel5.Open;

                    vNivel5.First;
                    while not vNivel5.Eof do
                    begin
                      with FSpedF.Bloco_C.registroC470New do
                      begin
    //                    UNID := getUnidade(vNivel5.FieldByName('tipo_item').AsString,
    //                        vNivel5.FieldByName('grupo_prod').AsInteger,
    //                        vNivel5.FieldByName('cod_prod').AsString,
    //                        '',
    //                        vNivel5.FieldByName('grupo_prod').AsInteger,
    //                        '');
                        if Trim(UNID) = '' then
                          UNID := UpperCase(Trim(vNivel5.FieldByName('UNID').AsString));
                        if Trim(UNID) = '' then
                          UNID := 'UN';
                        if vNivel5.FieldByName('tipo_item').AsString = 'P' then
                        begin
                          COD_ITEM := 'P' + StrZero(vNivel5.FieldByName('grupo_prod').AsString +
                            Trim(vNivel5.FieldByName('cod_prod').AsString), 16);

                          gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                            vNivel5.FieldByName('grupo_prod').AsInteger,
                            vNivel5.FieldByName('cod_prod').AsString, '', 0, '', UNID);
                        end
                        else if vNivel5.FieldByName('tipo_item').AsString = 'S' then
                        begin
                          COD_ITEM := 'S' + StrZero(vNivel5.FieldByName('grupo_prod').AsString, 16);

                          gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                            0, '', '', vNivel5.FieldByName('grupo_prod').AsInteger, '', UNID);
                        end;
                        QTD := vNivel5.FieldByName('QTD').AsFloat;
                        QTD_CANC := vNivel5.FieldByName('QTD_CANC').AsFloat;
                        VL_ITEM := vNivel5.FieldByName('VL_ITEM').AsFloat;
                        if (Copy(vNivel5.FieldByName('descaliq').AsString,3,1) = 'T') then
                          for I := 0 to vListaSumC470.Count - 1 do
                            if (getCampoPipe(vListaSumC470[I], 1) = Trim(vNivel5.FieldByName('descaliq').AsString))then
                              for K := 0 to vListaTotalizadores.Count - 1 do
                                if (getCampoPipe(vListaSumC470[I], 1) = getCampoPipe(vListaTotalizadores[K], 1)) then
                                  if Abs(StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) - StrToFloat(getCampoPipe(vListaSumC470[k],2))) > 0 then
                                  begin
                                    vCurrencyTemp := VL_ITEM / StrToFloat(getCampoPipe(vListaSumC470[k],2)) *
                                      Abs(StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) - StrToFloat(getCampoPipe(vListaSumC470[k],2)));

                                    if StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) < StrToFloat(getCampoPipe(vListaSumC470[k],2)) then
                                      vCurrencyTemp := (-1) * vCurrencyTemp;

                                    VL_ITEM := VL_ITEM + StrToFloatFormat(vCurrencyTemp,2);
                                  end;
                        CST_ICMS := Trim(vNivel5.FieldByName('CST_ICMS').AsString);
                        CFOP := Trim(vNivel5.FieldByName('CFOP').AsString);
                        if QTD_CANC > 0 then
                          ALIQ_ICMS := 0
                        else
                          ALIQ_ICMS := vNivel5.FieldByName('ALIQ_ICMS').AsFloat;
                        VL_PIS := vNivel5.FieldByName('VL_PIS').AsFloat;
                        VL_COFINS := vNivel5.FieldByName('VL_COFINS').AsFloat;

                        VL_DOC :=  VL_DOC + VL_ITEM;
                      end;

                      //Restituição Complemento do Item da NF
                      if RestComplST.RegistroC480(vNivel2.FieldByName('ecf_fab').AsString,
                                                  vNivel4.FieldByName('num_doc').AsInteger,
                                                  vNivel4.FieldByName('registro').AsInteger,
                                                  vNivel5.FieldByName('grupo_prod').AsInteger,
                                                  vNivel5.FieldByName('cod_prod').AsString).Count > 0 then
                        for N := 0 to RestComplST.RegSaida.Count - 1 do
                          with FSpedF.Bloco_C.RegistroC480New do
                          begin
                            COD_MOT_REST_COMPL := FSpedF.Bloco_0.Registro0000.UF +
                                                  RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL;
                            QUANT_CONV := RestComplST.RegSaida.Items[N].QUANT_CONV;
                            UNID := IfEmpty(vNivel5.FieldByName('UNID').AsString, 'UN');//RestComplST.RegSaida.Items[N].UNID;
                            VL_UNIT_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_CONV;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '3']) then
                              VL_UNIT_ICMS_NA_OPERACAO_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_NA_OPERACAO_CONV;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['2']) and (RestComplST.Conf.UsarVL_UNIT_ICMS_OP_CONV) then
                              VL_UNIT_ICMS_OP_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_CONV;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2', '3']) then
                            begin
                              VL_UNIT_ICMS_OP_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_OP_ESTOQUE_CONV;
                              VL_UNIT_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_ESTOQUE_CONV;
                              VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
                            end;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['1', '2']) then
                            begin
                              VL_UNIT_ICMS_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_REST;
                              VL_UNIT_FCP_ST_CONV_REST := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_REST;
                            end;

                            if MatchStr(RestComplST.RegSaida.Items[N].COD_MOT_REST_COMPL.Substring(0, 1), ['3']) then
                            begin
                              VL_UNIT_ICMS_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_ICMS_ST_CONV_COMPL;
                              VL_UNIT_FCP_ST_CONV_COMPL := RestComplST.RegSaida.Items[N].VL_UNIT_FCP_ST_CONV_COMPL;
                            end;

                            CST_ICMS := RestComplST.RegSaida.Items[N].CST_ICMS;
                            CFOP := RestComplST.RegSaida.Items[N].CFOP.ToString;
                          end;

                      vNivel5.Next;
                    end;

                    FValorPISAcumulado := FValorPISAcumulado + vNivel4.FieldByName('VL_PIS').AsCurrency;
                    FValorCOFINSAcumulado := FValorCOFINSAcumulado +
                      vNivel4.FieldByName('VL_COFINS').AsCurrency;
                  end;
                end;
                vNivel4.Next;
                FProgressBar2.Position := FProgressBar2.Position + 1;
              end;
            end;

            if vNivel3.FieldByName('VL_BRT').AsCurrency > 0 then
            with FSpedF.Bloco_C.RegistroC410New do
            begin
              VL_PIS := FValorPISAcumulado;
              VL_COFINS := FValorCOFINSAcumulado;
            end;

            FLabelCupons.Caption := vStringTemp + ' Dia: ' +
              DateToStr(vNivel3.FieldByName('DT_DOC').AsDateTime) + ' C490';
            Application.ProcessMessages;
            vTempStr := '';

            for K := 0 to vListaTotalizadores.Count - 1 do
            begin

            vNivel4.Close;
            vNivel4.SQL.Text := 'select' +
              ' case when (cp2.prod_serv = ''S'') then ''041''' +
              ' when (coalesce(cp2.cst, '''') <> '''') then cp2.cst' +
              '   else p.cst_prod' +
              ' end CST_ICMS,' +
              ' case when ((not cp2.codigo_nop is null) and ( cp2.codigo_nop > 0)) then cp2.codigo_nop' +
              ' when ((cp2.prod_serv = ''S'') and (not ts.codigo_nop is null)) then ts.codigo_nop' +
              '   when (cp2.prod_serv = ''S'') then 5949' +
              '   else p.codigo_nop' +
              ' end CFOP,' +
              ' case when (substring(cp2.descaliq from 3 for 1) = ''T'') then' +
              ' substring(cp2.descaliq from 4 for 2)||'',''||substring(cp2.descaliq from 6 for 2)' +
              '    else ''0'' end ALIQ_ICMS,' +
              ' '''' COD_OBS,' +
              ' sum( (coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0)))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0) ) VL_OPR' +
              ' from cupom cp inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
              ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
              ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
              ' LEFT join produtos p on p.grupo_prod = cp2.grupo_prod and p.cod_prod =' +
              ' cp2.cod_prod and p.cod_empresa = cp2.cod_empresa and cp2.prod_serv = ''P''' +
              ' left join tipo_servico ts on ts.cod_servico = cp2.grupo_prod and cp2.prod_serv = ''S''' +
              ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
              ' and cp2.cod_empresa = :cod_empresa and cp.data  = :dia and cp2.aliquota_it <> ''CANC''' +
              ' and cp2.descaliq = ' + QuotedStr(getCampoPipe(vListaTotalizadores[K],1) ) +
              ' group by 1,2,3,4';//,5';
            if getCampoPipe(vListaTotalizadores[K],1) = 'SERV' then
              vNivel4.SQL.Text := StringReplace(
                vNivel4.SQL.Text,
                ' and cp2.descaliq = ' + QuotedStr(getCampoPipe(vListaTotalizadores[K],1) ),
                ' and cp2.prod_serv = ''S''',
                [rfReplaceAll, rfIgnoreCase]);
            vNivel4.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
            vNivel4.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
            vNivel4.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel4.Open;

            vCurrencySoma := 0;
            vNivel4.First;
            while not vNivel4.Eof do
            begin
              vCurrencySoma := vCurrencySoma + vNivel4.FieldByName('VL_OPR').AsCurrency;
              vNivel4.Next;
            end;
            vListaTotalizadores[K] := getCampoPipe(vListaTotalizadores[k],1)+'|'+getCampoPipe(vListaTotalizadores[k],2)+'|'+
              Format('%0.2f',[vCurrencySoma]) + '|';

            vTempStr := vTempStr + vListaTotalizadores[K] + #13;

            vNivel4.First;
            while not vNivel4.Eof do
            begin
              Application.ProcessMessages;

              vBreak := False;
              if (getCampoPipe(vListaTotalizadores[K],1) = 'N') or (getCampoPipe(vListaTotalizadores[K],1) = 'FS') or (copy(getCampoPipe(vListaTotalizadores[K],1), 3, 1) = 'S') then// Acontece uma situacao do servico ficar como N no cupom2 quando nao tem aliquota de iss, para nao repetir aqui tem este for abaixo
              for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Count - 1 do
                if Trim(vNivel2.FieldByName('ECF_FAB').AsString) = Trim(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].ECF_FAB) then
                begin
                  for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Count - 1 do
                    if vNivel3.FieldByName('DT_DOC').AsDateTime = FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].DT_DOC then
                    begin
                      for L := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Count - 1 do
                        if (Trim(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].CST_ICMS) =
                            Trim(vNivel4.FieldByName('CST_ICMS').AsString)) and
                          (Trim(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].CFOP) =
                            Trim(vNivel4.FieldByName('CFOP').AsString)) and
                          (FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].ALIQ_ICMS =
                            vNivel4.FieldByName('ALIQ_ICMS').AsFloat) then
                        begin
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_OPR :=
                            FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_OPR +
                            vNivel4.FieldByName('VL_OPR').AsCurrency;
                          if FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].ALIQ_ICMS > 0 then
                          begin
                            FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_BC_ICMS :=
                              FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_OPR;
                            FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_ICMS :=
                              FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_BC_ICMS *
                              FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].ALIQ_ICMS / 100;
                          end;
                          vBreak := True;
                          Break;
                        end;
                      Break;
                    end;
                  Break;
                end;

              if not vBreak then
              with FSpedF.Bloco_C.RegistroC490New do
              begin
                CST_ICMS := Trim(vNivel4.FieldByName('CST_ICMS').AsString);
                CFOP := Trim(vNivel4.FieldByName('CFOP').AsString);
                ALIQ_ICMS := vNivel4.FieldByName('ALIQ_ICMS').AsFloat;
                VL_OPR := vNivel4.FieldByName('VL_OPR').AsCurrency;
                VL_BC_ICMS := 0;
                VL_ICMS := 0;

                if Abs(StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) - StrToFloat(getCampoPipe(vListaTotalizadores[k],3))) > 0.5 then
                begin
                  vCurrencyTemp := VL_OPR / vCurrencySoma *
                    Abs(StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) - StrToFloat(getCampoPipe(vListaTotalizadores[k],3)));

                  if StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) < StrToFloat(getCampoPipe(vListaTotalizadores[k],3)) then
                    vCurrencyTemp := (-1) * vCurrencyTemp;

                  VL_OPR := VL_OPR + vCurrencyTemp;
                end;
                if ALIQ_ICMS > 0 then
                begin
                  VL_BC_ICMS := VL_OPR;
                  VL_ICMS := StrToFloatFormat(VL_BC_ICMS * ALIQ_ICMS / 100,2);
                end;

                FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
                COD_OBS := Trim(vNivel4.FieldByName('COD_OBS').AsString);
              end;
              vNivel4.Next;
            end;

            end; //fim for lista totalizadores

          end;

          vNivel3.Next;
          FProgressBar.Position := FProgressBar.Position + 1;
        end;

        FLabelCupons.Caption := 'Validando somatórios';
        Application.ProcessMessages;

        for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Count - 1 do
          for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Count - 1 do
          begin
            for K := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Count - 1 do
            begin

              if (FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].ALIQ_ICMS > 0) and // talvez pode testar apenas o CST <> '20'
                (copy(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CST_ICMS,2,2) <> '20') then
              begin
                vCurrencySoma := 0;
                for L := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Count - 1 do
                  for M := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Count - 1 do
                    if (FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].ALIQ_ICMS > 0)and // talvez pode testar apenas o CST <> '20'
                      (copy(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CST_ICMS, 2, 2) <> '20') and
                      ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].ALIQ_ICMS =
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].ALIQ_ICMS) and
                      ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CST_ICMS =
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CST_ICMS) and
                      ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CFOP =
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CFOP) then
                      vCurrencySoma := vCurrencySoma + FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].VL_ITEM;

                if Abs(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].VL_OPR - vCurrencySoma) > 0.5  then
                begin
                  vBreak := False;
                  for L := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Count - 1 do
                  begin
                    for M := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Count - 1 do
                    begin
                      if (FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].ALIQ_ICMS > 0)and // talvez pode testar apenas o CST <> '20'
                        (copy(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CST_ICMS, 2, 2) <> '20') and
                        ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].ALIQ_ICMS =
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].ALIQ_ICMS) and
                        ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CST_ICMS =
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CST_ICMS) and
                        ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CFOP =
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CFOP) then
                      begin
                        vCurrencySoma := FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].VL_OPR - vCurrencySoma;
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].VL_ITEM :=
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].VL_ITEM + vCurrencySoma;
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].VL_DOC :=
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].VL_DOC + vCurrencySoma;
                        vBreak := True;
                      end;
                      if vBreak then
                        Break;
                    end;
                    if vBreak then
                      Break;
                  end;
                end;
              end;
            end;
          end;

      end;
      vNivel2.Next;
    end;
    FLabelCupons.Caption := '';
    Application.ProcessMessages;

    {$ENDREGION}

    {$REGION 'Nota Fiscal de Consumo modelos (06, 28, 29, 66'}

    vNivel2.Close;
    vNivel2.SQL.Text := 'select nf.cod_nf, nf.natureza_nf,' +
      ' case when nf.natureza_nf = ''E'' then ''0''' +
      '     else ''1'' end IND_OPER,' +
      ' case when nf.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
      ' else nf.serie end SER, nf.subserie SUB, nf.num_nf NUM_DOC, nf.chave_nfe CHV_NFE, nf.data_lanc DT_DOC,' +
      ' nf.data_contabil, nf.data_lanc,' +
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
      ' nf.cod_grupo_tensao, nf.vl_serv, nf.vl_serv_nt, nf.tp_assinante' +
      ' from notafiscal nf' +
      ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
      ' nf.modelo_nf in (''6'',''06'',''28'',''29'', ''66'')'+
      ' and (nf.da is null or nf.da <> ''S'')';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.Open;

    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;
    if not vNivel2.IsEmpty then
      FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;
    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C500';
      Application.ProcessMessages;
      with FSpedF.Bloco_C.RegistroC500New do
      begin
        if (vNivel2.FieldByName('extemporaneo').AsString = 'S') then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
            COD_SIT := sdCanceladoExtemp
          else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') then
            COD_SIT := sdExtempCompl
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA') then
            COD_SIT := sdExtempRegular
          else
            COD_SIT := sdRegimeEspecNEsp;
        end
        else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
          COD_SIT := sdCancelado
        else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') and
          ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdFiscalCompl
        else if ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdRegular;
        if COD_MOD = '55' then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'DENEGADA') then
            COD_SIT := sdDoctoDenegado
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'INUTILIZADA') then
            COD_SIT := sdDoctoNumInutilizada
          else
          begin
            try
              if (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) >= 890) and
                (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) <= 899) then
                COD_SIT := sdRegimeEspecNEsp;
            except
            end;
          end;
        end;

        IND_OPER := StrToTipoOperacao(vNivel2.FieldByName('IND_OPER').AsString);
        IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        SER := Trim(vNivel2.FieldByName('SER').AsString);
        NUM_DOC := vNivel2.FieldByName('NUM_DOC').AsString;
        if (vNivel2.FieldByName('natureza_nf').AsString = 'E') and (not FdataEmissaoIgualDataEntrada) then
          DT_DOC := vNivel2.FieldByName('data_contabil').AsDateTime
        else
          DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;

        vBooleanTemp := False;
        if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada])
          then
        begin
          vBooleanTemp := True;
          montaRegistro0150(vNivel2.FieldByName('COD_PART').AsString);
          if Trim(vNivel2.FieldByName('codigo_tr').AsString) <> '' then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
              (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
              montaRegistro0150(vNivel2.FieldByName('codigo_tr').AsString);

          CHV_DOCe := Trim(vNivel2.FieldByName('CHV_NFE').AsString);
          if not CHV_DOCe.Trim.IsEmpty then
            FIN_DOCe := TACBrFinalidadeEmissaoDocumentoEletronico.fedcNormal
          else
            COD_CONS := Trim(vNivel2.FieldByName('COD_CONS').AsString);

          COD_PART := vNivel2.FieldByName('COD_PART').AsString;
          SUB := Trim(vNivel2.FieldByName('SUB').AsString);
          if (vNivel2.FieldByName('natureza_nf').AsString = 'E') then
            DT_E_S := vNivel2.FieldByName('data_lanc').AsDateTime
          else
            DT_E_S := vNivel2.FieldByName('DT_E_S').AsDateTime;
          if DT_E_S < DT_DOC then
            DT_E_S := DT_DOC
          else if DT_E_S > StrToDate(FDataFim) then
            DT_E_S := StrToDate(FDataFim);
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          VL_FORN := vNivel2.FieldByName('VL_FORN').AsCurrency;
          if VL_FORN <= 0 then
            VL_FORN := VL_DOC;
          VL_SERV_NT := vNivel2.FieldByName('VL_SERV_NT').AsCurrency;
          VL_TERC := vNivel2.FieldByName('VL_TERC').AsCurrency;
          VL_DA := vNivel2.FieldByName('VL_DA').AsCurrency;
          VL_BC_ICMS := vNivel2.FieldByName('VL_BC_ICMS').AsCurrency;
          VL_ICMS := StrToFloatFormat(vNivel2.FieldByName('VL_ICMS').AsCurrency,2);
          VL_BC_ICMS_ST := vNivel2.FieldByName('VL_BC_ICMS_ST').AsCurrency;
          VL_ICMS_ST := vNivel2.FieldByName('VL_ICMS_ST').AsCurrency;
          if (VL_ICMS_ST > 0) and (COD_SIT in [sdExtempRegular, sdExtempCompl]) then
            somaFDEB_ESP_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS);
          VL_PIS := vNivel2.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel2.FieldByName('VL_COFINS').AsCurrency;
          //TP_LIGACAO
          //COD_GRUPO_TENSAO
        end;
      end;
      if vBooleanTemp then
      begin
        vNivel3.Close;
        vNivel3.SQL.Text := 'select case when nfi.tipo_item = ''S'' then ''041''' +
          ' else nfi.cst' +
          ' end CST_ICMS, nfi.codigo_nop CFOP, nfi.aliq_icm aliq_icms,' +
          ' sum (nfi.valor_total - nfi.rateio_desconto + nfi.valor_ipi +' +
          ' nfi.rateio_seguro + nfi.rateio_outdesp) VL_OPR,' +
          ' sum(nfi.base_icm) VL_BC_ICMS, sum(nfi.valor_icm) VL_ICMS,' +
          ' sum( case when ((substring(nfi.cst from 2 for 2) = ''10'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''90'')) then nfi.base_icmsub' +
          '     else 0' +
          ' end) VL_BC_ICMS_ST, sum( case when ((substring(nfi.cst from 2 for 2) = ''10'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''90'')) then nfi.valor_icmsub' +
          '     else 0' +
          ' end) VL_ICMS_ST,' +
          ' sum(case when ((substring(nfi.cst from 2 for 2) = ''20'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')) then nfi.vlisento' +
          '     else 0' +
          ' end) VL_RED_BC, sum(nfi.valor_ipi) VL_IPI, sum(nfi.rateio_frete) frete, '''' COD_OBS' +
          ' from notafiscal_item nfi' +
          ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa group by 1,2,3';
        vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.Open;

        vNivel3.first;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC590New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsFloat;
            if vNivel2.FieldByName('VL_FRT').AsFloat > 0 then
              VL_OPR := VL_OPR + vNivel3.FieldByName('frete').AsFloat;
            if (copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7') or (copy(CST_ICMS, 2, 1) = '9') then
              VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsFloat;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsFloat,2);

            vStringTemp :='';
            vOK := False;
            for L := 0 to FSpedF.Bloco_0.Registro0001.Registro0015.Count - 1 do
            begin
              vStringTemp := getSiglaUFParticipante(vNivel2.FieldByName('COD_PART').AsString);
              if vStringTemp = FSpedF.Bloco_0.Registro0001.Registro0015.Items[L].UF_ST then
              begin
                vOK := True;
                Break;
              end;
            end;


            if ((copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1)= '7') or (copy(CST_ICMS, 2, 1)= '9'))and
              (vOK) then
            begin
              VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
              VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
              if VL_ICMS_ST > 0 then
                setSTEstado(vNivel2.FieldByName('COD_PART').AsString);
              if (copy(CFOP, 1, 1) = '5') or (copy(CFOP, 1, 1) = '6') then
                somaFVL_RETENCAO_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
            end
            else
            begin
              VL_BC_ICMS_ST := 0;
              VL_ICMS_ST := 0;
            end;
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            if (vNivel2.FieldByName('natureza_nf').AsString = 'E') and
              ((CFOP <> '1605') or (CFOP = '5605')) then
              FVL_TOT_CREDITOS := FVL_TOT_CREDITOS + VL_ICMS;
            VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsFloat;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;
          vNivel3.Next;
        end;
      end;
      vNivel2.Next;
    end;

    {$ENDREGION}

    {$REGION 'Somatorio registro C100'}
    for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Count - 1 do with FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[I] do
    begin
      VL_BC_ICMS := 0;
      VL_ICMS := 0;
      for J := 0 to RegistroC190.Count - 1 do
      begin
        VL_BC_ICMS := VL_BC_ICMS + RegistroC190.Items[J].VL_BC_ICMS;
        VL_ICMS := VL_ICMS + RegistroC190.Items[J].VL_ICMS;
      end;
    end;

    {$ENDREGION}

    FLabelStatus.Caption := 'Finalizando Bloco C';
    if vMensagemDevolucao then
      Application.MessageBox( PChar(
        'Foram escrituradas devoluções de venda com DIFAL/FCP' + #13 + #13 +
        'Provavelmente o arquivo vai gerar inconsistências na validação do PVA' + #13 +
        'Por favor informe a sua contabilidade sobre as devoluções, pois devem ser feitos ajustes na apuração'), 'Atenção', MB_ICONWARNING + MB_OK);
  finally
    vNivel2.Close;
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
    vNivel6.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoD;
var
  vBooleanTemp: Boolean;
  I: Integer;
  regD100: TRegistroD100;
  regD195: TRegistroD195;
  regD197: TRegistroD197;
begin
  try
    verificaDataServicoTransporte;
    FSpedF.Bloco_D.RegistroD001New.IND_MOV := imSemDados;
    vNivel2.Close;
    vNivel2.SQL.Text :=
      'select st.cod_serv_transp, st.servtr_id, ''0'' IND_OPER, ''1'' IND_EMIT, ''T''||st.cod_transportador COD_PART,' +
      ' st.modelo COD_MOD, ''00'' COD_SIT, st.serie SER, st.sub_serie SUB,' +
      ' st.num_documento NUM_DOC, st.CHV_CTE, st.data_emissao DT_DOC, st.data_lancamento DT_A_P,' +
      ' st.TP_CT_e, '''' CHV_CTE_REF, st.valor_total VL_DOC, 0 VL_DESC,' +
      ' case when st.cif_fob_outros is null then 0 else st.cif_fob_outros end IND_FRT,' +
      ' st.valor_total VL_SERV, st.base_calc_icms' +
      ' VL_BC_ICMS, st.valor_icms VL_ICMS,' +
      ' ((case when st.outras is null then 0' +
      '     else st.outras' +
      ' end) +' +
      ' (case when st.isenta_n_tribut is null then 0' +
      '     else st.isenta_n_tribut' +
      ' end)) VL_NT, '''' COD_INF, npc.COD_CTA, st.COD_MUN_ORIG, st.COD_MUN_DEST' +
      ' from servico_transporte st' +
      ' left join NAT_OP_P_CONTAS_CONTABIL npc on npc.codigo_nop = st.cfop and npc.cod_empresa = st.cod_empresa' +
      ' where st.data_lancamento >= :dataIni and st.data_lancamento <= :dataFim and' +
      ' st.cod_empresa = :cod_empresa';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.Open;

    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;
    if not vNivel2.IsEmpty then
      FSpedF.Bloco_D.RegistroD001.IND_MOV := imComDados;
    vNivel2.First;

    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro D100';
      Application.ProcessMessages;

      regD100 := FSpedF.Bloco_D.RegistroD100New;

      with regD100 do
      begin
        IND_OPER := StrToTipoOperacao(vNivel2.FieldByName('IND_OPER').AsString);
        IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        COD_SIT := sdRegular;
        SER := Trim(vNivel2.FieldByName('SER').AsString);
        SUB := Trim(vNivel2.FieldByName('SUB').AsString);
        NUM_DOC := vNivel2.FieldByName('NUM_DOC').AsString;
        vBooleanTemp := False;
        if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada])
          then
        begin
          vBooleanTemp := True;
          COD_PART := Trim(vNivel2.FieldByName('COD_PART').AsString);
          montaRegistro0150(COD_PART);
          CHV_CTE := Trim(vNivel2.FieldByName('CHV_CTE').AsString);
          DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;
          if Trim(vNivel2.FieldByName('DT_A_P').AsString) <> '' then
          begin
            DT_A_P := vNivel2.FieldByName('DT_A_P').AsDateTime;
            if DT_A_P < DT_DOC then
              DT_A_P := DT_DOC
            else if DT_A_P > StrToDate(FDataFim) then
              DT_A_P := StrToDate(FDataFim);
          end;
          if COD_MOD = '57' then
            TP_CT_e := Trim(vNivel2.FieldByName('TP_CT_e').AsString);
          CHV_CTE_REF := Trim(vNivel2.FieldByName('CHV_CTE_REF').AsString);
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          IND_FRT := StrToTipoFrete(Trim(vNivel2.FieldByName('IND_FRT').AsString));
          VL_SERV := vNivel2.FieldByName('VL_SERV').AsCurrency;
          VL_BC_ICMS := vNivel2.FieldByName('VL_BC_ICMS').AsCurrency;
          VL_ICMS := StrToFloatFormat(vNivel2.FieldByName('VL_ICMS').AsCurrency,2);
          if not Fefd_icms_d100_campo_vl_nt_zerado then
            VL_NT := vNivel2.FieldByName('VL_NT').AsCurrency;
          COD_INF := Trim(vNivel2.FieldByName('COD_INF').AsString);
          COD_CTA := Trim(vNivel2.FieldByName('COD_CTA').AsString);

          if (COD_MOD = '57') or (COD_MOD = '63') or (COD_MOD = '67') then
          begin
            COD_MUN_ORIG := vNivel2.FieldByName('COD_MUN_ORIG').AsString.Trim();
            COD_MUN_DEST := vNivel2.FieldByName('COD_MUN_DEST').AsString.Trim();

            if COD_MUN_ORIG.Trim.IsEmpty then
              for I := 0 to FSpedF.Bloco_0.Registro0001.Registro0150.Count - 1 do
                if COD_PART = FSpedF.Bloco_0.Registro0001.Registro0150.Items[I].COD_PART then
                begin
                  COD_MUN_ORIG := FSpedF.Bloco_0.Registro0001.Registro0150.Items[I].COD_MUN.ToString;
                  Break;
                end;

            if COD_MUN_DEST.Trim.IsEmpty then
              COD_MUN_DEST := FSpedF.Bloco_0.Registro0000.COD_MUN.ToString();
          end;

        end;
      end;

      if vBooleanTemp then
      begin
        vNivel3.Close;
        vNivel3.SQL.Text := 'select' +
          ' case when ((not st.cst_icms is null) and (st.cst_icms <> '''')) then st.cst_icms' +
          '     when (st.base_calc_icms > 0) then ''000''' +
          '     when ((st.isenta_n_tribut > 0) or (st.outras > 0))  then ''041''' +
          '     else ''090''' +
          ' end cst_icms, st.cfop , st.aliq_icm aliq_icms, st.valor_total VL_OPR,' +
          ' st.base_calc_icms VL_BC_ICMS, st.valor_icms VL_ICMS,' +
          ' case when ((not st.base_calc_icms is null) and (st.valor_total > st.base_calc_icms)) then' +
          '     (st.valor_total - st.base_calc_icms)' +
          '     else 0' +
          ' end VL_RED_BC, '''' COD_OBS' +
          ' from servico_transporte st' +
          ' where st.cod_serv_transp = :cod_serv_transp and st.cod_empresa = :cod_empresa';
        vNivel3.ParamByName('cod_serv_transp').AsInteger := vNivel2.FieldByName('cod_serv_transp').AsInteger;
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.Open;

        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_D.RegistroD190New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsCurrency;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsCurrency;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsCurrency,2);
            if (vNivel2.FieldByName('IND_OPER').AsString = '1') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            if (vNivel2.FieldByName('IND_OPER').AsString = '0') and
              ((CFOP <> '1605') or (CFOP = '5605')) then
              FVL_TOT_CREDITOS := FVL_TOT_CREDITOS + VL_ICMS;
            if not Fefd_icms_d100_campo_vl_nt_zerado then
              VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsCurrency;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;
          vNivel3.Next;
        end;

        {$REGION 'D195 e D197'}

        vNivel3.Close;
        vNivel3.SQL.Text := 'select distinct c195.cod_obs, c195.txt_compl_d195, sl.txt TXT_COMPL ' +
          ' from servico_transporte_ajuste c195' +
          ' inner join sped_lancamento_fiscal sl on sl.cod_obs = c195.cod_obs and sl.cod_empresa = c195.cod_empresa' +
          ' where c195.servtr_id = :servtr_id and c195.cod_empresa = :cod_empresa';
          //' group by 1,2';
        vNivel3.ParamByName('servtr_id').AsString := vNivel2.FieldByName('servtr_id').AsString;
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.Open;

        while not vNivel3.Eof do
        begin
          montaRegistro0460(vNivel3.FieldByName('cod_obs').AsInteger,
            vNivel3.FieldByName('TXT_COMPL').AsString);

          regD195 := FSpedF.Bloco_D.RegistroD195New;
          with regD195 do
          begin
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
            TXT_COMPL := Trim(vNivel3.FieldByName('TXT_COMPL_D195').AsString);
          end;

          vNivel4.Close;
          vNivel4.SQL.Text :=
            'select c195.cod_aj, c195.descr_compl_aj, ' +
            ' c195.aliq_icms, c195.vl_bc_icms, c195.vl_icms, c195.vl_outros ' +
            ' from servico_transporte_ajuste c195' +
            ' inner join sped_lancamento_fiscal sl on sl.cod_obs = c195.cod_obs and sl.cod_empresa = c195.cod_empresa ' +
            ' where c195.servtr_id = :servtr_id and c195.cod_empresa = :cod_empresa and c195.txt_compl_d195 = :txt_compl_d195';
          vNivel4.ParamByName('servtr_id').AsString := vNivel2.FieldByName('servtr_id').AsString;
          vNivel4.ParamByName('txt_compl_d195').AsString := vNivel3.FieldByName('txt_compl_d195').AsString;
          vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel4.Open;
          vNivel4.First;
          while not vNivel4.Eof do
          begin

            var vCOD_AJ := Trim(vNivel4.FieldByName('COD_AJ').AsString);
            var vDESCR_COMPL_AJ := Trim(vNivel4.FieldByName('DESCR_COMPL_AJ').AsString);
            var vCOD_ITEM := '';

            regD197 := nil;
            for var iC197 := 0 to regD195.RegistroD197.Count - 1 do
              if regD197 <> nil then
                Break
              else if (regD195.RegistroD197.Items[iC197].COD_AJ = vCOD_AJ)
                and (regD195.RegistroD197.Items[iC197].COD_ITEM = vCOD_ITEM)  then
              begin
                regD197 := regD195.RegistroD197.Items[iC197];
                if RoundTo(regD197.ALIQ_ICMS, -2) <> RoundTo(vNivel4.FieldByName('ALIQ_ICMS').AsFloat, -2) then
                  regD197.ALIQ_ICMS := 0;
              end;

            if regD197 = nil then
            begin
              regD197 := regD195.RegistroD197.New;
              regD197.COD_AJ := vCOD_AJ;
              regD197.COD_ITEM := vCOD_ITEM;
              regD197.DESCR_COMPL_AJ := vDESCR_COMPL_AJ;
              regD197.ALIQ_ICMS := vNivel4.FieldByName('ALIQ_ICMS').AsCurrency;
            end;

            regD197.VL_BC_ICMS := regD197.VL_BC_ICMS + vNivel4.FieldByName('VL_BC_ICMS').AsCurrency;
            regD197.VL_ICMS    := regD197.VL_ICMS    + StrToFloatFormat(vNivel4.FieldByName('VL_ICMS').AsCurrency,2);
            regD197.VL_OUTROS  := regD197.VL_OUTROS  + vNivel4.FieldByName('VL_OUTROS').AsCurrency;

            vNivel4.Next;
          end;

          for var i195 := 0 to regD100.RegistroD195.Count - 1 do with regD100.RegistroD195 do
            for var i197 := 0 to Items[i195].RegistroD197.Count - 1 do with Items[i195].RegistroD197.Items[i197] do
            begin
              if MatchStr(COD_AJ[3], ['3', '4', '5']) and MatchStr(COD_AJ[4], ['0', '3', '4', '5', '6', '7', '8']) then
                FVL_AJ_DEBITOS := FVL_AJ_DEBITOS + VL_ICMS;

              if MatchStr(COD_AJ[3], ['0', '1', '2']) and MatchStr(COD_AJ[4], ['0', '3', '4', '5', '6', '7', '8']) then
                FVL_AJ_CREDITOS := FVL_AJ_CREDITOS + VL_ICMS;

              if (COD_AJ[3] = '6') and (COD_AJ[4] = '0') then
                FVL_TOT_DED := FVL_TOT_DED + VL_ICMS;

              if MatchStr(COD_AJ[3], ['0', '1', '2']) and (COD_AJ[4] = '1') then
                somaFVL_AJ_CREDITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);

              if MatchStr(COD_AJ[3], ['3', '4', '5']) and (COD_AJ[4] = '1') then
                somaFVL_AJ_DEBITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);

              if (COD_AJ[3] = '7') and (COD_AJ[4] = '1') then
                somaFDEB_ESP_ST(Copy(COD_AJ, 1, 2), VL_ICMS);
            end;

          vNivel3.Next;
        end;


        {$ENDREGION}

      end;

      vNivel2.Next;
    end;

    vNivel2.Close;
    vNivel2.SQL.Text := 'select nf.cod_nf, nf.natureza_nf,' +
      ' case when nf.natureza_nf = ''E'' then ''0''' +
      '     else ''1'' end IND_OPER,' +
      ' case when nf.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
      ' else nf.serie end SER, nf.subserie SUB, nf.num_nf NUM_DOC, nf.chave_nfe CHV_NFE, nf.data_lanc DT_DOC,' +
      ' nf.data_contabil, nf.data_lanc,' +
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
      ' nf.cod_grupo_tensao, nf.vl_serv, nf.vl_serv_nt, nf.tp_assinante, npc.COD_CTA' +
      ' from notafiscal nf' +
      ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
      ' left join NAT_OP_P_CONTAS_CONTABIL npc on npc.codigo_nop = nf.codigo_nop and npc.cod_empresa = nf.cod_empresa' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
      ' nf.modelo_nf in (''21'',''22'')'+
      ' and (nf.da is null or nf.da <> ''S'')';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.Open;

    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;
    if not vNivel2.IsEmpty then
      FSpedF.Bloco_D.RegistroD001.IND_MOV := imComDados;
    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro D500';
      Application.ProcessMessages;
      with FSpedF.Bloco_D.RegistroD500New do
      begin
        if (vNivel2.FieldByName('extemporaneo').AsString = 'S') then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
            COD_SIT := sdCanceladoExtemp
          else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') then
            COD_SIT := sdExtempCompl
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA') then
            COD_SIT := sdExtempRegular
          else
            COD_SIT := sdRegimeEspecNEsp;
        end
        else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
          COD_SIT := sdCancelado
        else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') and
          ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdFiscalCompl
        else if ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdRegular;
        if COD_MOD = '55' then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'DENEGADA') then
            COD_SIT := sdDoctoDenegado
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'INUTILIZADA') then
            COD_SIT := sdDoctoNumInutilizada
          else
          begin
            try
              if (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) >= 890) and
                (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) <= 899) then
                COD_SIT := sdRegimeEspecNEsp;
            except
            end;
          end;
        end;

        IND_OPER := StrToTipoOperacao(vNivel2.FieldByName('IND_OPER').AsString);
        IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        SER := Trim(vNivel2.FieldByName('SER').AsString);
        SUB := Trim(vNivel2.FieldByName('SUB').AsString);
        NUM_DOC := vNivel2.FieldByName('NUM_DOC').AsString;
        if (vNivel2.FieldByName('natureza_nf').AsString = 'E') and (not FdataEmissaoIgualDataEntrada) then
          DT_DOC := vNivel2.FieldByName('data_contabil').AsDateTime
        else
          DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;

        vBooleanTemp := False;
        if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada])
          then
        begin
          vBooleanTemp := True;
          montaRegistro0150(vNivel2.FieldByName('COD_PART').AsString);
          if Trim(vNivel2.FieldByName('codigo_tr').AsString) <> '' then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
              (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
              montaRegistro0150(vNivel2.FieldByName('codigo_tr').AsString);
          //CHV_NFE := Trim(vNivel2.FieldByName('CHV_NFE').AsString);
          COD_PART := vNivel2.FieldByName('COD_PART').AsString;
          if (vNivel2.FieldByName('natureza_nf').AsString = 'E') then
            DT_A_P := vNivel2.FieldByName('data_lanc').AsDateTime
          else
            DT_A_P := vNivel2.FieldByName('DT_E_S').AsDateTime;
          if DT_A_P < DT_DOC then
            DT_A_P := DT_DOC
          else if DT_A_P > StrToDate(FDataFim) then
            DT_A_P := StrToDate(FDataFim);
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          VL_SERV := vNivel2.FieldByName('VL_SERV').AsCurrency;
          VL_SERV_NT := vNivel2.FieldByName('VL_SERV_NT').AsCurrency;
          VL_TERC := vNivel2.FieldByName('VL_TERC').AsCurrency;
          VL_DA := vNivel2.FieldByName('VL_DA').AsCurrency;
          VL_BC_ICMS := vNivel2.FieldByName('VL_BC_ICMS').AsCurrency;
          VL_ICMS := StrToFloatFormat(vNivel2.FieldByName('VL_ICMS').AsCurrency,2);
          VL_PIS := vNivel2.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel2.FieldByName('VL_COFINS').AsCurrency;
          COD_CTA := Trim(vNivel2.FieldByName('COD_CTA').AsString);
          TP_ASSINANTE := assComercialIndustrial;
        end;
      end;
      if vBooleanTemp then
      begin
        vNivel3.Close;
        vNivel3.SQL.Text := 'select case when nfi.tipo_item = ''S'' then ''041''' +
          ' else nfi.cst' +
          ' end CST_ICMS, nfi.codigo_nop CFOP, nfi.aliq_icm aliq_icms,' +
          ' sum (nfi.valor_total - nfi.rateio_desconto + nfi.valor_ipi +' +
          ' nfi.rateio_seguro + nfi.rateio_outdesp) VL_OPR,' +
          ' sum(nfi.base_icm) VL_BC_ICMS, sum(nfi.valor_icm) VL_ICMS,' +
          ' sum( case when ((substring(nfi.cst from 2 for 2) = ''10'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''90'')) then nfi.base_icmsub' +
          '     else 0' +
          ' end) VL_BC_ICMS_ST, sum( case when ((substring(nfi.cst from 2 for 2) = ''10'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''90'')) then nfi.valor_icmsub' +
          '     else 0' +
          ' end) VL_ICMS_ST,' +
          ' sum(case when ((substring(nfi.cst from 2 for 2) = ''20'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')) then nfi.vlisento' +
          '     else 0' +
          ' end) VL_RED_BC, sum(nfi.valor_ipi) VL_IPI, sum(nfi.rateio_frete) frete, '''' COD_OBS' +
          ' from notafiscal_item nfi' +
          ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa group by 1,2,3';
        vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.Open;

        vNivel3.first;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_D.RegistroD590New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsFloat;
            if vNivel2.FieldByName('VL_FRT').AsFloat > 0 then
              VL_OPR := VL_OPR + vNivel3.FieldByName('frete').AsFloat;
            if (copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7') or (copy(CST_ICMS, 2, 1) = '9') then
              VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsFloat;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsFloat,2);
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            if (vNivel2.FieldByName('natureza_nf').AsString = 'E') and
              ((CFOP <> '1605') or (CFOP = '5605')) then
              FVL_TOT_CREDITOS := FVL_TOT_CREDITOS + VL_ICMS;
            if (copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7') or (copy(CST_ICMS, 2, 1) = '9') then
            begin
//              VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
//              VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
//              if VL_ICMS_ST > 0 then
//                setSTEstado(vNivel2.FieldByName('COD_PART').AsString);
//              if (copy(CFOP, 1, 1) = '5') or (copy(CFOP, 1, 1) = '6') then
//                somaFVL_RETENCAO_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
            end
            else
            begin
//              VL_BC_ICMS_ST := 0;
//              VL_ICMS_ST := 0;
            end;
            VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsFloat;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;
          vNivel3.Next;
        end;
      end;
      vNivel2.Next;
    end;

  finally
    vNivel2.Close;
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
    vNivel6.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoE;
var
  FVL_ICMS_RECOLHER: Currency;
  vStringTemp: string;
  I, J, K, L: Integer;
  i100, i101: Integer;
  vContEst: Integer;
  UNID: string;
  vUFEmp, vUFPart: string;
  vrEquacao, vDEB_ESP_DIFAL, vVL_OR_E316: Double;
  vDEB_ESP_FCP: Double;
  iAJ: Integer;
  AC170: TRegistroC170;
  AE510: TRegistroE510;
  AC190: TRegistroC190;
  vOK: Boolean;
  conf: TConfig_sistema_class;
begin
  conf := TConfig_sistema_class.getConf('efd_icms_escrituracao', vQrAux, StrToInt(CodEmpresa));
  try
    FLabelStatus.Caption := 'Montando registro E100';
    FVL_ICMS_RECOLHER := 0;
    FValorCredFuturo_ICMS := 0;
    FSpedF.Bloco_E.RegistroE001New.IND_MOV := imComDados;
    with FSpedF.Bloco_E.RegistroE100New do
    begin
      DT_INI := StrToDate(FDataIni);
      DT_FIN := StrToDate(FDataFim);
    end;

    with FSpedF.Bloco_E.RegistroE110New do
    begin
      VL_TOT_DEBITOS := FVL_TOT_DEBITOS;
      VL_AJ_DEBITOS := FVL_AJ_DEBITOS;
      VL_TOT_AJ_DEBITOS := 0;
      VL_ESTORNOS_CRED := 0;
      VL_TOT_CREDITOS := FVL_TOT_CREDITOS;
      VL_AJ_CREDITOS := FVL_AJ_CREDITOS;
      VL_TOT_AJ_CREDITOS := 0;
      VL_ESTORNOS_DEB := 0;
      VL_SLD_CREDOR_ANT := FValorCredPerAnt_ICMS;
      VL_SLD_APURADO :=
        (VL_TOT_DEBITOS + (VL_AJ_DEBITOS + VL_TOT_AJ_DEBITOS) + VL_ESTORNOS_CRED) -
        (VL_TOT_CREDITOS + (VL_AJ_CREDITOS + VL_TOT_AJ_CREDITOS) + VL_ESTORNOS_DEB +
        VL_SLD_CREDOR_ANT);
      if VL_SLD_APURADO >= 0 then
        VL_SLD_CREDOR_TRANSPORTAR := 0
      else
      begin
        VL_SLD_CREDOR_TRANSPORTAR := Abs(VL_SLD_APURADO);
        VL_SLD_APURADO := 0;
      end;

      VL_TOT_DED := FVL_TOT_DED;
      VL_ICMS_RECOLHER := VL_SLD_APURADO - VL_TOT_DED;
      if VL_ICMS_RECOLHER < 0 then
      begin
        VL_SLD_CREDOR_TRANSPORTAR := abs(VL_ICMS_RECOLHER);
        VL_ICMS_RECOLHER := 0;
      end;
      FVL_ICMS_RECOLHER := VL_ICMS_RECOLHER;
      DEB_ESP := 0;
      FValorCredFuturo_ICMS := VL_SLD_CREDOR_TRANSPORTAR;
    end;
    if FVL_ICMS_RECOLHER > 0 then
      with FSpedF.Bloco_E.RegistroE116New do
      begin
        if Trim(fCOD_OR_E116) <> '' then
          COD_OR := Trim(fCOD_OR_E116)
        else        
          COD_OR := '000';
        VL_OR := FVL_ICMS_RECOLHER;
        if fDiaVencICMS > 0 then
        begin
          vStringTemp := StrZero(IntToStr(fDiaVencICMS), 2) + '/';
          vStringTemp := vStringTemp + Copy(FormatDateTime('dd/mm/yyyy',IncMonth(StrToDate(FDataIni))), 4, 7);
          try
            StrToDate(vStringTemp);          
          except
            Application.MessageBox(pchar('Dia de Vencimento de ICMS inválido! ' + StrZero(IntToStr(fDiaVencICMS), 2)),
              'Atenção', 0 + 64);
            vStringTemp := FormatDateTime('dd/mm/yyyy',IncMonth(StrToDate(FDataIni)));
            vStringTemp := '09/' + copy(vStringTemp,4,7);
            Application.MessageBox(pchar('Será assumida a data ' + vStringTemp), 'Atenção', 0 + 64);
          end;
        end
        else
        begin
          vStringTemp := FormatDateTime('dd/mm/yyyy',IncMonth(StrToDate(FDataIni)));
          vStringTemp := '09/' + copy(vStringTemp,4,7);
        end;
        DT_VCTO := StrToDate(vStringTemp);
        if Trim(fCOD_REC_E116) <> '' then
          COD_REC := Trim(fCOD_REC_E116)
        else
        begin
          if Trim(fCOD_REC_E116) = '' then
            Application.MessageBox(pchar('Campo Codigo de Receita(E116 - COD_REC) não encontrado no cadastro!' + #13 +
              'Campo exigido pelo PVA. Acesse o cadastro da empresa na aba SPED -> EFD ICMS IPI' + 
              ' e informe o Código exigido!' + #13 +
              'Códigos disponíveis no site do SPED (Tabelas de Códigos de Receita)'), 'Atenção', 0 + 64);
          COD_REC := '0';
        end;
        NUM_PROC := '';
        IND_PROC := opNenhum;
        PROC := '';
        TXT_COMPL := '';
        vStringTemp := FormatDateTime('dd/mm/yyyy', StartOfTheMonth(StrToDate(FDataIni)));
        MES_REF := StringReplace(Copy(vStringTemp, 4, 7), '/', '', [rfReplaceAll]);
      end;

    for I := 1 to 27 do
    begin
      if ConfUnif.Ativo then
      else
      if not fApurarST then
      begin
        FVL_DEVOL_ST[I]    := 0;
        FVL_OUT_CRED_ST[I] := 0;
        FVL_RETENCAO_ST[I] := 0;
      end;

      if ConfUnif.Ativo then
        vOK := not ConfUnif.ConfST.AntecipacaoST
      else
        vOK := not fApurarSTAnt;

      if vOK then
      begin
        FVL_AJ_CREDITOS_ST[I] := 0;
        FVL_AJ_DEBITOS_ST[I]  := 0;
        FDEB_ESP_ST[I]        := 0;
      end;
      if (FVL_DEVOL_ST[I] = 0) and (FVL_OUT_CRED_ST[I] = 0) and (FVL_RETENCAO_ST[I] = 0) and //st
        (FVL_AJ_CREDITOS_ST[I] = 0) and (FVL_AJ_DEBITOS_ST[I] = 0) and (FDEB_ESP_ST[I] = 0) then// stant
        FSigla[I] := '';
    end;

    if ConfUnif.Ativo then
      vOK := ConfUnif.ConfST.AntecipacaoST or (ConfUnif.ConfST.EmissaoPropria = csCamposProprios) or (ConfUnif.ConfST.EmissaoTerceiro = csCamposProprios)
    else
      vOK := fApurarST or fApurarSTAnt;

//    if fApurarST or fApurarSTAnt then
    if vOK then
      for I := 1 to 27 do
        if Trim(FSigla[i]) <> '' then
        begin
          with FSpedF.Bloco_E.RegistroE200New do
          begin
            UF := FSigla[i];
            DT_INI := StrToDate(FDataIni);
            DT_FIN := StrToDate(FDataFim);
          end;

          with FSpedF.Bloco_E.RegistroE210New do
          begin
            IND_MOV_ST := mstComOperacaoST;
            VL_SLD_CRED_ANT_ST := 0;
            VL_DEVOL_ST := FVL_DEVOL_ST[I];
            VL_RESSARC_ST := 0; //FVL_RESSARC_ST[i];
            VL_OUT_CRED_ST := FVL_OUT_CRED_ST[i];
            VL_AJ_CREDITOS_ST := FVL_AJ_CREDITOS_ST[i];
            VL_RETENCAO_ST := FVL_RETENCAO_ST[i];
            VL_OUT_DEB_ST := 0;
            VL_AJ_DEBITOS_ST := FVL_AJ_DEBITOS_ST[i];
            VL_SLD_DEV_ANT_ST := (VL_RETENCAO_ST + VL_OUT_DEB_ST + VL_AJ_DEBITOS_ST) -
              (VL_SLD_CRED_ANT_ST + VL_DEVOL_ST + VL_RESSARC_ST + VL_OUT_CRED_ST + VL_AJ_CREDITOS_ST);
            if VL_SLD_DEV_ANT_ST >= 0 then
              VL_SLD_CRED_ST_TRANSPORTAR := 0
            else
            begin
              VL_SLD_CRED_ST_TRANSPORTAR := Abs(VL_SLD_DEV_ANT_ST);
              VL_SLD_DEV_ANT_ST := 0;
            end;
            VL_DEDUCOES_ST := 0;
            VL_ICMS_RECOL_ST := VL_SLD_DEV_ANT_ST - VL_DEDUCOES_ST;
            //          if VL_ICMS_RECOL_ST <= 0 then
            //            VL_ICMS_RECOL_ST := 0;
            DEB_ESP_ST := FDEB_ESP_ST[i];
            if fUFIBGE = IBGE[i] then
            begin
              DEB_ESP_ST := 0;
              for vContEst := 1 to 27 do
                DEB_ESP_ST := DEB_ESP_ST + FDEB_ESP_ST[vContEst];
//              if (DEB_ESP_ST - FDEB_ESP_ST[i]) >= 0 then
//                DEB_ESP_ST := DEB_ESP_ST - FDEB_ESP_ST[i];
            end;

            if (DEB_ESP_ST + VL_ICMS_RECOL_ST) > 0 then
            begin
              //Ajuste/Beneficio/Incentivo - pela orientação da Ortec não há no caso da ST emissão própria, desativado a funcionalidade na nova configuração
              if ConfUnif.Ativo then
              else
              if fUFIBGE <> IBGE[i] then
              begin
                if DEB_ESP_ST > 0 then
                  with FSpedF.Bloco_E.RegistroE220New do
                  begin
                    COD_AJ_APUR := FSigla[i] + '159999';
                    VL_AJ_APUR := DEB_ESP_ST;
                  end;

                if VL_ICMS_RECOL_ST > 0 then
                  with FSpedF.Bloco_E.RegistroE220New do
                  begin
                    COD_AJ_APUR := FSigla[i] + '149999';
                    VL_AJ_APUR := VL_ICMS_RECOL_ST;
                    //
                    VL_DEDUCOES_ST := VL_AJ_APUR;
                    VL_ICMS_RECOL_ST := VL_SLD_DEV_ANT_ST - VL_DEDUCOES_ST;
                    for iAJ := 0 to ListCodAJ_E220_ST_Recolhido.Count - 1 do
                      if getValue(ListCodAJ_E220_ST_Recolhido[iAJ], 1) = FSigla[i] then
                      begin
                        COD_AJ_APUR := FSigla[i] + getValue(ListCodAJ_E220_ST_Recolhido[iAJ], 2);
                        DESCR_COMPL_AJ := getValue(ListCodAJ_E220_ST_Recolhido[iAJ], 3);
                      end;
                  end;
              end;

              with FSpedF.Bloco_E.RegistroE250New do
              begin
                if ConfUnif.Ativo then
                  COD_OR := conf.ReadString('ICMSST', 'CodigoObrigacaoArecolher_E250_' + FSigla[i], '001')
                else
                if Trim(fCOD_OR_E250) <> '' then
                  COD_OR := Trim(fCOD_OR_E250)
                else
                  COD_OR := '999';
                VL_OR := DEB_ESP_ST + VL_ICMS_RECOL_ST;
                DT_VCTO := StrToDate(FDataFim);
                if ConfUnif.Ativo then
                  COD_REC := conf.ReadString('ICMSST', 'CodigoReceita_E250_' + FSigla[i], '100099')
                else
                if Trim(fCOD_REC_E250) <> '' then
                  COD_REC := Trim(fCOD_REC_E250)
                else
                begin
                  if Trim(fCOD_REC_E250) = '' then
                    Application.MessageBox(pchar('Campo Codigo de Receita(E250 - COD_REC) não encontrado no cadastro!' + #13 +
                      'Campo exigido pelo PVA. Acesse o cadastro da empresa na aba SPED -> EFD ICMS IPI' +
                      ' e informe o Código exigido!' + #13 +
                      'Códigos disponíveis no site do SPED (Tabelas de Códigos de Receita)'), 'Atenção', 0 + 64);
                  COD_REC := '0';
                end;
                NUM_PROC := '';
                IND_PROC := opNenhum;
                PROC := '';
                TXT_COMPL := '';
                //ShortDateFormat := 'dd/mm/yyyy';
                vStringTemp := FormatDateTime('dd/mm/yyyy', StartOfTheMonth(StrToDate(FDataIni)));
                MES_REF := StringReplace(Copy(vStringTemp, 4, 7), '/', '', [rfReplaceAll]);
              end;
            end;
          end;

      end;

    if (FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao109) then
    begin
      // Montando registro E300';
      FLabelStatus.Caption := 'Montando registro E300';
      vNivel2.Close;
      vNivel2.SQL.Text :=
        ' select distinct uf from SPED_F_ICMINTER_AJ' +
        ' where data_lanc>= :dataini and data_lanc <= :datafim' +
        ' and cod_empresa = :cod_empresa' +
        ' union ' +
        ' select distinct uf from SPED_F_ICMINTER_OB_DIFAL' +
        ' where data_lanc>= :dataini and data_lanc <= :datafim' +
        ' and cod_empresa = :cod_empresa' +
        ' union ' +
        ' select distinct es.sigla_uf uf' +
        ' from notafiscal nf' +
        ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
        ' inner join clientes cl on cl.cod_cliente =  nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
        ' inner join estados es on es.codigo_uf = cl.codigo_uf' +
        ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
        ' nf.data_lanc <= :dataFim and status = ''Fechada'' and natureza_nf = ''S'' and' +
        ' nf.modelo_nf in (''1'',''01'',''1A'',''1-A'',''4'',''04'',''55'')'+
        ' and (nf.da is null or nf.da <> ''S'')' +
        ' and ((coalesce(nf.vfcpufdest,0) > 0) or (coalesce(nf.vicmsufdest,0) > 0)' +
        ' or (coalesce(nf.vicmsufremet, 0) > 0))' +
        ' union ' +
        ' select distinct es.sigla_uf uf from empresa emp' +
        ' inner join estados es on es.codigo_uf = emp.uf_emp' +
        ' where emp.cod_empresa = :cod_empresa' +
        ' order by 1';
      vNivel2.ParamByName('dataini').AsDate := StrToDate(FDataIni);
      vNivel2.ParamByName('datafim').AsDate := StrToDate(FDataFim);
      vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
      vNivel2.Open;
      vNivel2.FetchAll;

      vNivel2.First;
      while not vNivel2.Eof do
      begin
        with FSpedF.Bloco_E.RegistroE300New do
        begin
          // dados do registro E300
          UF := vNivel2.FieldByName('uf').AsString;
          DT_INI := StrToDate(FDataIni);
          DT_FIN := StrToDate(FDataFim);

          vDEB_ESP_DIFAL := 0;
          vDEB_ESP_FCP := 0;
          vVL_OR_E316 := 0;
          with FSpedF.Bloco_E.RegistroE310New do
          begin
            IND_MOV_DIFAL := mDifalSemOperacaoICMS;
            //registro 311
            vNivel4.Close;
            vNivel4.SQL.Text :=
              ' select * from SPED_F_ICMINTER_AJ' +
              ' where data_lanc >= :dataini and data_lanc <= :datafim' +
              ' and cod_empresa = :cod_empresa' +
              ' and uf = :uf' +
              ' order by data_lanc, seqid';
            vNivel4.ParamByName('dataini').AsDate := StrToDate(FDataIni);
            vNivel4.ParamByName('datafim').AsDate := StrToDate(FDataIni);
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
            vNivel4.ParamByName('uf').AsString := vNivel2.FieldByName('uf').AsString;
            vNivel4.Open;
            vNivel4.First;
            while not vNivel4.Eof do
            begin
              with FSpedF.Bloco_E.RegistroE311New do
              begin
                IND_MOV_DIFAL := mDifalComOperacaoICMS;
                COD_AJ_APUR := vNivel4.FieldByName('COD_AJ_APUR').AsString;
                DESCR_COMPL_AJ :=  vNivel4.FieldByName('DESCR_COMPL_AJ').AsString;
                VL_AJ_APUR :=  vNivel4.FieldByName('VL_AJ_APUR').AsFloat;

                //campo VL_OUT_DEB_DIFAL registro E310
                if (Copy(COD_AJ_APUR, 3, 1) = '2') then
                  if (Copy(COD_AJ_APUR, 4, 1) = '0') or (Copy(COD_AJ_APUR, 4, 1) = '1')  then
                    VL_OUT_DEB_DIFAL := VL_OUT_DEB_DIFAL + VL_AJ_APUR;

                //campo VL_OUT_CRED_DIFAL registro E310
                if (Copy(COD_AJ_APUR, 3, 1) = '2') then
                  if (Copy(COD_AJ_APUR, 4, 1) = '2') or (Copy(COD_AJ_APUR, 4, 1) = '3')  then
                    VL_OUT_CRED_DIFAL := VL_OUT_CRED_DIFAL + VL_AJ_APUR;

                //campo VL_DEDUCOES_DIFAL registro E310
                if (Copy(COD_AJ_APUR, 3, 1) = '2') then
                  if (Copy(COD_AJ_APUR, 4, 1) = '4')then
                    VL_DEDUCOES_DIFAL := VL_DEDUCOES_DIFAL + VL_AJ_APUR;

                //campo DEB_ESP_DIFAL registro E310
                if (Copy(COD_AJ_APUR, 3, 1) = '2') then
                  if (Copy(COD_AJ_APUR, 4, 1) = '5')then
                    DEB_ESP_DIFAL := DEB_ESP_DIFAL + VL_AJ_APUR;

                 if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao110 then
                 begin
                   // campos fcp 2017
                 
                  //campo VL_OUT_DEB_FCP registro E310
                  if (Copy(COD_AJ_APUR, 3, 1) = '3') then
                    if (Copy(COD_AJ_APUR, 4, 1) = '0') or (Copy(COD_AJ_APUR, 4, 1) = '1')  then
                      VL_OUT_DEB_FCP := VL_OUT_DEB_FCP + VL_AJ_APUR;

                  //campo VL_OUT_CRED_FCP registro E310
                  if (Copy(COD_AJ_APUR, 3, 1) = '3') then
                    if (Copy(COD_AJ_APUR, 4, 1) = '2') or (Copy(COD_AJ_APUR, 4, 1) = '3')  then
                      VL_OUT_CRED_FCP := VL_OUT_CRED_FCP + VL_AJ_APUR;

                  //campo VL_DEDUCOES_FCP registro E310
                  if (Copy(COD_AJ_APUR, 3, 1) = '3') then
                    if (Copy(COD_AJ_APUR, 4, 1) = '4')then
                      VL_DEDUCOES_FCP := VL_DEDUCOES_FCP + VL_AJ_APUR;

                  //campo DEB_ESP_FCP registro E310
                  if (Copy(COD_AJ_APUR, 3, 1) = '3') then
                    if (Copy(COD_AJ_APUR, 4, 1) = '5')then
                      DEB_ESP_FCP := DEB_ESP_FCP + VL_AJ_APUR;
                 end;

                // registro E312
                vNivel5.Close;
                vNivel5.SQL.Text :=
                  ' select * from SPED_F_ICMINTER_AJ_INF_AD' +
                  ' where seqid_aj = :seqid_aj' +
                  ' and cod_empresa = :cod_empresa' +
                  ' order by seqid';
                vNivel5.ParamByName('seqid_aj').AsInteger := vNivel4.FieldByName('seqid').AsInteger;
                vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
                vNivel5.Open;
                vNivel5.First;
                while not vNivel5.Eof do
                begin
                  with FSpedF.Bloco_E.RegistroE312New do
                  begin
                    NUM_DA := vNivel5.FieldByName('NUM_DA').AsString;
                    NUM_PROC := vNivel5.FieldByName('NUM_PROC').AsString;
                    IND_PROC := StrToOrigemProcesso(vNivel5.FieldByName('NUM_PROC').AsString);
                    PROC := vNivel5.FieldByName('PROC').AsString;
                    TXT_COMPL := vNivel5.FieldByName('TXT_COMPL').AsString;
                  end;
                  vNivel5.Next;
                end;

                //registro E313
                vNivel5.Close;
                vNivel5.SQL.Text :=
                  ' select sp.*, nf.modelo_nf, nf.serie, nf.subserie, nf.num_nf, nf.chave_nfe, nf.data_lanc,' +
                  ' nf.cod_cliente COD_PART, nfi.tipo_item, nfi.referencia unidade, nfi.grupo_prod, nfi.cod_prod, nfi.cod_servico,' +
                  ' nfi.nitem NUM_ITEM, nfi.chassi' +
                  ' from SPED_F_ICMINTER_AJ_INF_DOC sp' +
                  ' left join notafiscal nf on nf.cod_nf = sp.cod_nf and nf.cod_empresa = sp.cod_empresa' +
                  ' left join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa  and nfi.nitem = sp.nitem_nf' +
                  ' where sp.seqid_aj = :seqid_aj' +
                  ' and sp.cod_empresa = :cod_empresa' +
                  ' order by sp.seqid';
                vNivel5.ParamByName('seqid_aj').AsInteger := vNivel4.FieldByName('seqid').AsInteger;
                vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
                vNivel5.Open;
                vNivel5.First;
                while not vNivel5.Eof do
                begin
                  with FSpedF.Bloco_E.RegistroE313New do
                  begin
                    COD_PART := vNivel5.FieldByName('COD_PART').AsString;
                    montaRegistro0150(vNivel5.FieldByName('COD_PART').AsString);
                    COD_MOD := vNivel5.FieldByName('modelo_nf').AsString;
                    SER := vNivel5.FieldByName('serie').AsString;
                    if StrToIntDef(vNivel5.FieldByName('subserie').AsString, -1) > 0  then
                      SUB := vNivel5.FieldByName('subserie').AsString;
                    NUM_DOC := vNivel5.FieldByName('num_nf').AsString;
                    CHV_DOCe := vNivel5.FieldByName('chave_nfe').AsString;
                    DT_DOC := vNivel5.FieldByName('data_lanc').AsDateTime;

                    UNID:= vNivel5.FieldByName('unidade').AsString;
                    if vNivel5.FieldByName('tipo_item').AsString = 'P' then
                    begin
                      COD_ITEM := 'P' + StrZero(vNivel5.FieldByName('grupo_prod').AsString +
                        Trim(vNivel5.FieldByName('cod_prod').AsString), 16);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        vNivel5.FieldByName('grupo_prod').AsInteger,
                        vNivel5.FieldByName('cod_prod').AsString, '', 0, '', UNID);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'S' then
                    begin
                      COD_ITEM := 'S' + StrZero(vNivel5.FieldByName('cod_servico').AsString, 16);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', '', vNivel5.FieldByName('cod_servico').AsInteger, '', UNID);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'V' then
                    begin
                      COD_ITEM := StrZero(vNivel5.FieldByName('chassi').AsString, 17);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', vNivel5.FieldByName('chassi').AsString,
                        0, '', UNID);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'O' then
                    begin
                      COD_ITEM := 'O' + StrZero(vNivel5.FieldByName('cod_nf').AsString, 7) +
                        StrZero(vNivel5.FieldByName('NUM_ITEM').AsString, 3);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', '', 0, ('O' +
                        StrZero(vNivel5.FieldByName('cod_nf').AsString, 7) +
                        StrZero(vNivel5.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'D' then
                    begin
                      COD_ITEM := 'D' + StrZero(vNivel5.FieldByName('cod_nf').AsString, 7) +
                        StrZero(vNivel5.FieldByName('NUM_ITEM').AsString, 3);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', '', 0, ('D' +
                        StrZero(vNivel5.FieldByName('cod_nf').AsString, 7) +
                        StrZero(vNivel5.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                    end;
                    VL_AJ_ITEM := vNivel5.FieldByName('VL_AJ_ITEM').AsFloat;
                  end;
                  vNivel5.Next;
                end;

              end;
              vNivel4.Next;
            end;

            //registro 316
            vNivel4.Close;
            vNivel4.SQL.Text :=
              ' select * from SPED_F_ICMINTER_OB_DIFAL' +
              ' where data_lanc >= :dataini and data_lanc <= :datafim' +
              ' and cod_empresa = :cod_empresa' +
              ' and uf = :uf' +
              ' order by data_lanc, seqid';
            vNivel4.ParamByName('dataini').AsDate := StrToDate(FDataIni);
            vNivel4.ParamByName('datafim').AsDate := StrToDate(FDataFim);
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
            vNivel4.ParamByName('uf').AsString := vNivel2.FieldByName('uf').AsString;
            vNivel4.Open;
            vNivel4.First;
            while not vNivel4.Eof do
            begin
              IND_MOV_DIFAL := mDifalComOperacaoICMS;
              with FSpedF.Bloco_E.RegistroE316New do
              begin
                COD_OR := vNivel4.FieldByName('COD_OR').AsString;
                VL_OR := vNivel4.FieldByName('VL_OR').AsFloat;
                DT_VCTO := vNivel4.FieldByName('DT_VCTO').AsDateTime;
                COD_REC := vNivel4.FieldByName('COD_REC').AsString;
                NUM_PROC := vNivel4.FieldByName('NUM_PROC').AsString;
                IND_PROC := StrToOrigemProcesso(vNivel4.FieldByName('IND_PROC').AsString);
                PROC := vNivel4.FieldByName('PROC').AsString;
                TXT_COMPL := vNivel4.FieldByName('TXT_COMPL').AsString;
                MES_REF := StrZero(vNivel4.FieldByName('mes_ref').AsString, 2) + vNivel4.FieldByName('ano_ref').AsString;
                vVL_OR_E316 := vVL_OR_E316 + VL_OR;
              end;
              vNivel4.Next;
            end;

            // dados do registro E310, montado a partir dos dados dos outros registros

            vUFEmp := FSpedF.Bloco_0.Registro0000.UF;
            for i100 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Count - 1 do
              for i101 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Count - 1 do
                if (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].IND_OPER = StrToTipoOperacao('1')) and
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT <> StrToCodSit('01')) and
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT <> StrToCodSit('07')) then
                begin
                  IND_MOV_DIFAL := mDifalComOperacaoICMS;
                  vUFPart := getSiglaUFParticipante(FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_PART);
                  // campos VL_TOT_DEBITOS_DIFAL e VL_TOT_DEB_FCP registro E310
                  if UF = vUFEmp then
                  begin
                    VL_TOT_DEBITOS_DIFAL := VL_TOT_DEBITOS_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_REM;
                    VL_TOT_DEB_FCP := VL_TOT_DEB_FCP + 0;
                  end
                  else if UF = vUFPart then
                  begin
                    VL_TOT_DEBITOS_DIFAL := VL_TOT_DEBITOS_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_DEST;
                    VL_TOT_DEB_FCP := VL_TOT_DEB_FCP + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_FCP_UF_DEST;
                  end;
                end
                else if (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].IND_OPER = StrToTipoOperacao('0')) then
                begin
                  IND_MOV_DIFAL := mDifalComOperacaoICMS;
                  // campos VL_TOT_CREDITOS_DIFAL e VL_TOT_CRED_FCP registro E310
                  vUFPart := getSiglaUFParticipante(FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_PART);
                  if UF = vUFEmp then
                  begin
                    VL_TOT_CREDITOS_DIFAL := VL_TOT_CREDITOS_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_DEST;
                    VL_TOT_CRED_FCP := VL_TOT_CRED_FCP + 0;
                  end
                  else if UF = vUFPart then
                  begin
                    VL_TOT_CREDITOS_DIFAL := VL_TOT_CREDITOS_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_REM;
                    VL_TOT_CRED_FCP := VL_TOT_CRED_FCP + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_FCP_UF_DEST;
                  end;
                end
                else if (StrToDate(FDataFim) <= StrToDate('31/01/2016')) and
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].IND_OPER = StrToTipoOperacao('1')) and
                  ((FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT = StrToCodSit('01')) or
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT = StrToCodSit('07'))) then
                begin
                  IND_MOV_DIFAL := mDifalComOperacaoICMS;
                  if UF = vUFEmp then
                    vDEB_ESP_DIFAL := vDEB_ESP_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_REM
                  else if UF = vUFPart then
                    vDEB_ESP_DIFAL := vDEB_ESP_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_FCP_UF_DEST;
                end
                else if (StrToDate(FDataFim) <= StrToDate('31/01/2017')) then
                begin
                  if UF = vUFEmp then
                    vDEB_ESP_FCP :=  0;
                end
                else if  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].IND_OPER = StrToTipoOperacao('1')) and
                  ((FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT = StrToCodSit('01')) or
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT = StrToCodSit('07'))) then
                begin
                  if UF <> vUFEmp then
                    vDEB_ESP_FCP := vDEB_ESP_FCP + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_FCP_UF_DEST;
                end;

            //campo VL_SLD_DEV_ANT_DIFAL registro E310
            if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao110 then
              vrEquacao := (VL_TOT_DEBITOS_DIFAL + VL_OUT_DEB_DIFAL) -
                (VL_SLD_CRED_ANT_DIF + VL_TOT_CREDITOS_DIFAL + VL_OUT_CRED_DIFAL)
            else
            vrEquacao := (VL_TOT_DEBITOS_DIFAL + VL_OUT_DEB_DIFAL + VL_TOT_DEB_FCP) -
              (VL_SLD_CRED_ANT_DIF + VL_TOT_CREDITOS_DIFAL + VL_OUT_CRED_DIFAL + VL_TOT_CRED_FCP);

            if vrEquacao >= 0 then
              VL_SLD_DEV_ANT_DIFAL := vrEquacao
            else
              VL_SLD_DEV_ANT_DIFAL := 0;
            //campo VL_RECOL registro E310
            vrEquacao := (VL_SLD_DEV_ANT_DIFAL - VL_DEDUCOES_DIFAL);
            if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao110 then
            begin
              if vrEquacao >= 0 then
                VL_RECOL_DIFAL := vrEquacao
              else
                VL_RECOL_DIFAL := 0;
            end
            else
            if vrEquacao >= 0 then
              VL_RECOL := vrEquacao
            else
              VL_RECOL := 0;
            //campo VL_SLD_CRED_TRANSPORTAR registro E310
            vrEquacao := (VL_SLD_CRED_ANT_DIF + VL_TOT_CREDITOS_DIFAL + VL_OUT_CRED_DIFAL+ VL_TOT_CRED_FCP) -
              (VL_TOT_DEBITOS_DIFAL + VL_OUT_DEB_DIFAL + VL_TOT_DEB_FCP);
            if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao110 then
            begin
              if vrEquacao > 0 then
                VL_SLD_CRED_TRANSPORTAR_DIFAL := vrEquacao
              else
                VL_SLD_CRED_TRANSPORTAR_DIFAL := 0;
            end
            else
            if vrEquacao > 0 then
              VL_SLD_CRED_TRANSPORTAR := vrEquacao
            else
              VL_SLD_CRED_TRANSPORTAR := 0;
            DEB_ESP_DIFAL := vDEB_ESP_DIFAL;
            // novos campos fcp 2017
            if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao110 then
            begin
              //campo VL_SLD_DEV_ANT_FCP registro E310
              vrEquacao := (VL_TOT_DEB_FCP + VL_OUT_DEB_FCP) -
                (VL_SLD_CRED_ANT_FCP + VL_TOT_CRED_FCP + VL_OUT_CRED_FCP);
              if vrEquacao >= 0 then
                VL_SLD_DEV_ANT_FCP := vrEquacao
              else
                VL_SLD_DEV_ANT_FCP := 0;

              //campo VL_RECOL_FCP registro E310
              vrEquacao := (VL_SLD_DEV_ANT_FCP - VL_DEDUCOES_FCP);
              if vrEquacao >= 0 then
                VL_RECOL_FCP := vrEquacao
              else
                VL_RECOL_FCP := 0;

              vrEquacao := (VL_SLD_CRED_ANT_FCP + VL_TOT_CRED_FCP + VL_OUT_CRED_FCP) -
                (VL_TOT_DEB_FCP + VL_OUT_DEB_FCP);
              if vrEquacao > 0 then
                VL_SLD_CRED_TRANSPORTAR_FCP := vrEquacao
              else
                VL_SLD_CRED_TRANSPORTAR_FCP := 0;

              DEB_ESP_FCP := vDEB_ESP_FCP;
              //fim novos campos fcp 2017
            end;

            //aqui é feita a diferença para apresentar a tela ao usuário para lancamento da diferença
//            vVL_OR_E316 := (VL_RECOL + DEB_ESP_DIFAL) - vVL_OR_E316;
            if StrToFloatFormat(((VL_RECOL + DEB_ESP_DIFAL) - vVL_OR_E316), 2) > 0 then
            begin
              Application.CreateForm(TfrmDifE310eE316, frmDifE310eE316);
              frmDifE310eE316.Edit1.Text := UF;
              frmDifE310eE316.vrObrigacoes := (VL_RECOL + DEB_ESP_DIFAL) - vVL_OR_E316;
              frmDifE310eE316.lbE310.Caption := Format('%0.2n', [(VL_RECOL + DEB_ESP_DIFAL)]);
              frmDifE310eE316.lbE316.Caption := Format('%0.2n', [(vVL_OR_E316)]);
              frmDifE310eE316.vQrAud := vQrAux;

              if frmDifE310eE316.ShowModal = IDOK then
              begin
                with FSpedF.Bloco_E.RegistroE316New do
                begin
                  COD_OR := frmDifE310eE316.vE316.COD_OR;
                  VL_OR := frmDifE310eE316.vE316.VL_OR;
                  DT_VCTO := frmDifE310eE316.vE316.DT_VCTO;
                  COD_REC := frmDifE310eE316.vE316.COD_REC;
                  NUM_PROC := frmDifE310eE316.vE316.NUM_PROC;
                  IND_PROC := frmDifE310eE316.vE316.IND_PROC;
                  PROC := frmDifE310eE316.vE316.PROC;
                  TXT_COMPL := frmDifE310eE316.vE316.TXT_COMPL;
                  MES_REF := frmDifE310eE316.vE316.MES_REF;
                end;
              end;
              FreeAndNil(frmDifE310eE316.vE316);
              frmDifE310eE316.Free;
              frmDifE310eE316 := nil;
            end;
          end;//RegistroE310New
        end;//RegistroE300New
        vNivel2.Next;
      end;
    end;//  endif (FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao109)

    if ConfUnif.Ativo then
      vOK := (ConfUnif.ConfIPI.EmissaoPropria = csCamposProprios) or
             (ConfUnif.ConfIPI.EmissaoTerceiro = csCamposProprios) or
             (FE510List.Count > 0)
    else
      vOK  := ((not fApurarStIpiEmOutDesp.Trim.Equals('S')) and (fApurarIPI));

    if (FSpedF.Bloco_0.Registro0000.IND_ATIV = atIndustrial) and (vOK) then
//      (not fApurarStIpiEmOutDesp.Trim.Equals('S')) and (fApurarIPI) then
      with FSpedF.Bloco_E.RegistroE500New do
      begin
        IND_APUR := iaMensal;
        DT_INI := StrToDate(FDataIni);
        DT_FIN := StrToDate(FDataFim);

        for I := 0 to FE510List.Count - 1 do
        begin
          AE510 := FSpedF.Bloco_E.RegistroE510New;

          AE510.CFOP        := TRegistroE510(FE510List.Items[I]).CFOP;
          AE510.CST_IPI     := TRegistroE510(FE510List.Items[I]).CST_IPI;
          AE510.VL_CONT_IPI := TRegistroE510(FE510List.Items[I]).VL_CONT_IPI;
          AE510.VL_BC_IPI   := TRegistroE510(FE510List.Items[I]).VL_BC_IPI;;
          AE510.VL_IPI      := TRegistroE510(FE510List.Items[I]).VL_IPI;
        end;

        with FSpedF.Bloco_E.RegistroE520New do
        begin
          VL_SD_ANT_IPI := FValorCredPerAnt_IPI;
          for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Count - 1 do
            for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[I].RegistroC190.Count - 1 do
              if FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[I].RegistroC190.Items[J].CFOP.Substring(0, 1).IndexOfAny(['5', '6']) > -1 then
                VL_DEB_IPI := VL_DEB_IPI + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[I].RegistroC190.Items[J].VL_IPI;
          //VL_DEB_IPI := 0;

          for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Count - 1 do
            for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[I].RegistroC190.Count - 1 do
              if FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[I].RegistroC190.Items[J].CFOP.Substring(0, 1).IndexOfAny(['1', '2', '3']) > -1 then
                VL_CRED_IPI := VL_CRED_IPI + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[I].RegistroC190.Items[J].VL_IPI;
          //VL_CRED_IPI := 0;

          VL_OD_IPI := 0;
          VL_OC_IPI := 0;

          if ((VL_DEB_IPI + VL_OD_IPI) - (VL_SD_ANT_IPI + VL_CRED_IPI + VL_OC_IPI)) < 0 then
            VL_SC_IPI := Abs((VL_DEB_IPI + VL_OD_IPI) - (VL_SD_ANT_IPI + VL_CRED_IPI + VL_OC_IPI));
          //VL_SC_IPI := 0;
          if ((VL_DEB_IPI + VL_OD_IPI) - (VL_SD_ANT_IPI + VL_CRED_IPI + VL_OC_IPI)) >= 0 then
            VL_SD_IPI := (VL_DEB_IPI + VL_OD_IPI) - (VL_SD_ANT_IPI + VL_CRED_IPI + VL_OC_IPI);
          //VL_SD_IPI := 0;
          FValorCredFuturo_IPI := VL_SC_IPI;
        end;
      end;
  finally
    conf.Free;
  end;
end;

procedure TSpedFiscal.montarBlocoG;
var
  vSALDO_IN_ICMS, vSOM_PARC, vVL_TRIB_EXP, vVL_TOTAL, vSOM_ICMS_OC: Currency;
begin
  try
    vSALDO_IN_ICMS := 0;
    //vSALDO_FN_ICMS := 0;
    vSOM_PARC := 0;
    vVL_TRIB_EXP := 0;
    vVL_TOTAL := 0;
    //vIND_PER_SAI := 0;
    //vICMS_APROP := 0;
    vSOM_ICMS_OC := 0;
    FSpedF.Bloco_G.RegistroG001.IND_MOV := imSemDados;
    FLabelStatus.Caption := 'Montando registro G110';

    vNivel3.Close;
    vNivel3.SQL.Text := 'select mc.cod_ind_bem, mc.dt_mov, mc.tipo_mov,' +
      ' mc.vl_imob_icms_op, mc.vl_imob_icms_st, mc.vl_imob_icms_frt,' +
      ' mc.vl_imob_icms_dif, mc.num_parc, mc.vl_parc_pass,' +
      ' case when mc.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, mc.cod_cliente,mc.modelo_nf, mc.serie, mc.num_nf,' +
      ' mc.chv_nfe_cte, mc.data_doc, mc.num_item, mc.grupo_prod, mc.cod_prod, mc.num_da,' +
      ' mc.qtde, mc.unid, mc.vl_icms_op_aplicado, mc.vl_icms_st_aplicado,' +
      ' mc.vl_icms_frt_aplicado, mc.vl_icms_dif_aplicado ' +
      ' from movimento_ciap mc' +
      ' where mc.dt_mov >= :dataIni and mc.dt_mov <= :dataFim and' +
      ' mc.cod_empresa = :cod_empresa';
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.Open;

    vNivel3.FetchAll;

    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;

    if vNivel3.RecordCount > 0 then
    begin
      FSpedF.Bloco_G.RegistroG001.IND_MOV := imComDados;
      with FSpedF.Bloco_G.RegistroG110New do
      begin
        vNivel3.First;
        while not vNivel3.Eof do
        begin
          Application.ProcessMessages;
          with FSpedF.Bloco_G.RegistroG125New do
          begin
            COD_IND_BEM := vNivel3.FieldByName('cod_ind_bem').AsString;
            montaRegistro0300(COD_IND_BEM);

            DT_MOV := vNivel3.FieldByName('DT_MOV').AsDateTime;
            TIPO_MOV := StrToMovimentoBens(vNivel3.FieldByName('TIPO_MOV').AsString);
            VL_IMOB_ICMS_OP := vNivel3.FieldByName('VL_IMOB_ICMS_OP').AsCurrency;
            VL_IMOB_ICMS_ST := vNivel3.FieldByName('VL_IMOB_ICMS_ST').AsCurrency;
            VL_IMOB_ICMS_FRT := vNivel3.FieldByName('VL_IMOB_ICMS_FRT').AsCurrency;
            VL_IMOB_ICMS_DIF := vNivel3.FieldByName('VL_IMOB_ICMS_DIF').AsCurrency;
            NUM_PARC := vNivel3.FieldByName('NUM_PARC').AsInteger;
            VL_PARC_PASS := vNivel3.FieldByName('VL_PARC_PASS').AsCurrency;
            if TIPO_MOV = mbcSI then
              vSALDO_IN_ICMS := vSALDO_IN_ICMS + (VL_IMOB_ICMS_OP + VL_IMOB_ICMS_ST +
                VL_IMOB_ICMS_FRT + VL_IMOB_ICMS_DIF);
            vSOM_PARC := vSOM_PARC + VL_PARC_PASS;

            if vNivel3.FieldByName('num_nf').AsInteger > 0 then
            begin
              with FSpedF.Bloco_G.RegistroG130New do
              begin
                IND_EMIT := StrToEmitente(vNivel3.FieldByName('IND_EMIT').AsString);
                montaRegistro0150(vNivel3.FieldByName('cod_cliente').AsString);
                COD_PART := Trim(vNivel3.FieldByName('cod_cliente').AsString);
                COD_MOD := Trim(vNivel3.FieldByName('modelo_nf').AsString);
                SERIE := Trim(vNivel3.FieldByName('serie').AsString);
                NUM_DOC := Trim(vNivel3.FieldByName('num_nf').AsString);
                CHV_NFE_CTE := Trim(vNivel3.FieldByName('chv_nfe_cte').AsString);
                DT_DOC := vNivel3.FieldByName('data_doc').AsDateTime;
                NUM_DA := vNivel3.FieldByName('num_da').AsString;
              end; //with FSpedF.Bloco_G.RegistroG130New do

              with FSpedF.Bloco_G.RegistroG140New do
              begin
                NUM_ITEM := vNivel3.FieldByName('num_item').AsString;
                COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                  Trim(vNivel3.FieldByName('cod_prod').AsString), 16);
                QTDE := vNivel3.FieldByName('qtde').AsFloat;
                UNID := vNivel3.FieldByName('UNID').AsString;
                VL_ICMS_OP_APLICADO := vNivel3.FieldByName('VL_ICMS_OP_APLICADO').AsFloat;
                VL_ICMS_ST_APLICADO := vNivel3.FieldByName('VL_ICMS_ST_APLICADO').AsFloat;
                VL_ICMS_FRT_APLICADO := vNivel3.FieldByName('VL_ICMS_FRT_APLICADO').AsFloat;
                VL_ICMS_DIF_APLICADO := vNivel3.FieldByName('VL_ICMS_DIF_APLICADO').AsFloat;

                vNivel5.Close;
                vNivel5.SQL.Text := 'select unidade from produtos where grupo_prod = ' +
                  vNivel3.FieldByName('grupo_prod').AsString +
                  ' and cod_prod = ' + QuotedStr(vNivel3.FieldByName('cod_prod').AsString) +
                  ' and cod_empresa = ' + FCodEmpresa;
                vNivel5.Open;

                gravaSpedItem('P',
                  vNivel3.FieldByName('grupo_prod').AsInteger,
                  vNivel3.FieldByName('cod_prod').AsString, '', 0, '',
                  UpperCase(Trim(vNivel5.FieldByName('unidade').AsString)));
              end; //with FSpedF.Bloco_G.RegistroG140New do
            end; //if vNivel3.FieldByName('num_nf').AsInteger > 0 then

            //VL_PARC_APROP
          end; //with FSpedF.Bloco_G.RegistroG125New do

          //Conclusao de Imobilizacao em andamento - Bem resultante
          //Aqui serao montados os IA que resultaram no CI
          if vNivel3.FieldByName('TIPO_MOV').AsString = 'CI' then
          begin
            vNivel4.Close;
            vNivel4.SQL.Text := 'select mc.cod_ind_bem, mc.dt_mov, mc.tipo_mov,' +
              ' mc.vl_imob_icms_op, mc.vl_imob_icms_st, mc.vl_imob_icms_frt,' +
              ' mc.vl_imob_icms_dif, mc.num_parc, mc.vl_parc_pass,' +
              ' case when mc.emissao_propria = ''S'' then ''0''' +
              '     else ''1'' end IND_EMIT, mc.cod_cliente,mc.modelo_nf, mc.serie, mc.num_nf,' +
              ' mc.chv_nfe_cte, mc.data_doc, mc.num_item, mc.grupo_prod, mc.cod_prod,' +
              ' mc.qtde, mc.unid, mc.vl_icms_op_aplicado, mc.vl_icms_st_aplicado,' +
              ' mc.vl_icms_frt_aplicado, mc.vl_icms_dif_aplicado' +
              ' from movimento_ciap mc' +
              ' inner join equipamento eq on eq.cod_equip = mc.cod_ind_bem and' +
              ' eq.cod_empresa = mc.cod_empresa' +
              ' where eq.cod_prnc = :cod_prnc and mc.tipo_mov = :tipo_mov and' +
              ' mc.dt_mov < :dataIni and mc.cod_empresa = :cod_empresa';
            vNivel4.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
            vNivel4.ParamByName('cod_prnc').AsInteger :=
              vNivel3.FieldByName('cod_ind_bem').AsInteger;
            vNivel4.ParamByName('tipo_mov').AsString := 'IA';
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel4.Open;

            vNivel4.First;
            while not vNivel4.Eof do
            begin
              with FSpedF.Bloco_G.RegistroG125New do
              begin
                COD_IND_BEM := vNivel4.FieldByName('cod_ind_bem').AsString;
                montaRegistro0300(COD_IND_BEM);
                DT_MOV := vNivel4.FieldByName('DT_MOV').AsDateTime;
                TIPO_MOV := StrToMovimentoBens(vNivel4.FieldByName('TIPO_MOV').AsString);
                VL_IMOB_ICMS_OP := vNivel4.FieldByName('VL_IMOB_ICMS_OP').AsCurrency;
                VL_IMOB_ICMS_ST := vNivel4.FieldByName('VL_IMOB_ICMS_ST').AsCurrency;
                VL_IMOB_ICMS_FRT := vNivel4.FieldByName('VL_IMOB_ICMS_FRT').AsCurrency;
                VL_IMOB_ICMS_DIF := vNivel4.FieldByName('VL_IMOB_ICMS_DIF').AsCurrency;
                NUM_PARC := vNivel4.FieldByName('NUM_PARC').AsInteger;
                VL_PARC_PASS := vNivel4.FieldByName('VL_PARC_PASS').AsCurrency;
                if TIPO_MOV = mbcSI then
                  vSALDO_IN_ICMS := vSALDO_IN_ICMS + (VL_IMOB_ICMS_OP + VL_IMOB_ICMS_ST +
                    VL_IMOB_ICMS_FRT + VL_IMOB_ICMS_DIF);
                vSOM_PARC := vSOM_PARC + VL_PARC_PASS;

                if vNivel4.FieldByName('num_nf').AsInteger > 0 then
                begin
                  with FSpedF.Bloco_G.RegistroG130New do
                  begin
                    IND_EMIT := StrToEmitente(vNivel4.FieldByName('IND_EMIT').AsString);
                    montaRegistro0150(vNivel4.FieldByName('cod_cliente').AsString);
                    COD_PART := Trim(vNivel4.FieldByName('cod_cliente').AsString);
                    COD_MOD := Trim(vNivel4.FieldByName('modelo_nf').AsString);
                    SERIE := Trim(vNivel4.FieldByName('serie').AsString);
                    NUM_DOC := Trim(vNivel4.FieldByName('num_nf').AsString);
                    CHV_NFE_CTE := Trim(vNivel4.FieldByName('chv_nfe_cte').AsString);
                    DT_DOC := vNivel4.FieldByName('data_doc').AsDateTime;
                  end; //with FSpedF.Bloco_G.RegistroG130New do

                  with FSpedF.Bloco_G.RegistroG140New do
                  begin
                    NUM_ITEM := vNivel4.FieldByName('num_item').AsString;
                    COD_ITEM := 'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
                      Trim(vNivel4.FieldByName('cod_prod').AsString), 16);
                    QTDE := vNivel4.FieldByName('qtde').AsFloat;
                    UNID := vNivel4.FieldByName('UNID').AsString;
                    VL_ICMS_OP_APLICADO := vNivel4.FieldByName('VL_ICMS_OP_APLICADO').AsFloat;
                    VL_ICMS_ST_APLICADO := vNivel4.FieldByName('VL_ICMS_ST_APLICADO').AsFloat;
                    VL_ICMS_FRT_APLICADO := vNivel4.FieldByName('VL_ICMS_FRT_APLICADO').AsFloat;
                    VL_ICMS_DIF_APLICADO := vNivel4.FieldByName('VL_ICMS_DIF_APLICADO').AsFloat;

                    vNivel5.Close;
                    vNivel5.SQL.Text := 'select unidade from produtos where grupo_prod = ' +
                      vNivel4.FieldByName('grupo_prod').AsString +
                      ' and cod_prod = ' + QuotedStr(vNivel4.FieldByName('cod_prod').AsString) +
                      ' and cod_empresa = ' + FCodEmpresa;
                    vNivel5.Open;

                    gravaSpedItem('P',
                      vNivel4.FieldByName('grupo_prod').AsInteger,
                      vNivel4.FieldByName('cod_prod').AsString, '', 0, '',
                      UpperCase(Trim(vNivel5.FieldByName('unidade').AsString)));


                  end; //with FSpedF.Bloco_G.RegistroG140New do
                end; //if vNivel4.FieldByName('num_nf').AsInteger > 0 then

              end; //with FSpedF.Bloco_G.RegistroG125New do
              vNivel4.Next;
            end; //while not vNivel4.Eof do

          end;
          vNivel3.Next;
          FProgressBar.Position := FProgressBar.Position + 1;
        end;

        vNivel2.Close;
        vNivel2.SQL.Text := 'select * from valores_ciap where cod_empresa = ' + FCodEmpresa +
          ' and mes = :mes and ano = :ano';
        vNivel2.ParamByName('mes').AsInteger := StrToInt(Trim(copy(FDataIni, 4, 2))); ;
        vNivel2.ParamByName('ano').AsInteger := StrToInt(Trim(copy(FDataIni, 7, 4)));
        vNivel2.Open;
        vVL_TRIB_EXP := vNivel2.FieldByName('VL_TRIB_EXP').AsCurrency;
        vVL_TOTAL := vNivel2.FieldByName('VL_TOTAL').AsCurrency;

        //DT_INI := StrToDate(FDataIni);
        //DT_FIN := StrToDate(FDataFim);
        //MODO_CIAP
        SALDO_IN_ICMS := vSALDO_IN_ICMS;
        //SALDO_FN_ICMS:=vSALDO_FN_ICMS;
        SOM_PARC := vSOM_PARC;
        VL_TRIB_EXP := vVL_TRIB_EXP;
        VL_TOTAL := vVL_TOTAL;
        try
          if VL_TOTAL > 0 then
            IND_PER_SAI := VL_TRIB_EXP / VL_TOTAL
          else
            IND_PER_SAI := 0;
        except
        end;
        ICMS_APROP := SOM_PARC * IND_PER_SAI;
        SOM_ICMS_OC := vSOM_ICMS_OC;
      end;
    end;

  finally
    vNivel2.Close;
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoH;
const
  tipos: array[1..4] of string = ('02', '03', '04', '05');
var
  vCurrencyTemp: Currency;
  I: Integer;
begin
  try
    FSpedF.Bloco_H.RegistroH001New.IND_MOV := imSemDados;
    FLabelStatus.Caption := 'Montando registro H010 - Inventário - Motivo 01';

    if vBlocoH and fH005GerarMotivo01 then
    begin
      vNivel3.Close;
      {
      vNivel3.SQL.Text := 'select i.*,' +
            ' iif(Trim(coalesce(i7.chassi_mt, '''')) = '''', ''P'', ''V'') tipo_item,' +
            ' i7.chassi_mt chassi, p.unidade unid, i.cod_cliente COD_PART, p.cod_cta_estoque COD_CTA,' +
            ' i.posse_qtde QTD, (i.posse_total / i.posse_qtde) VL_ITEM,' +
            ' '' '' TXT_COMPL' +
            ' from (' +
            '   select inv.data_inv, inv.cod_empresa, inv.grupo_prod, inv.cod_prod,' +
            '   iif(ip.id is null, 0, iif(ip.ind_prop = 0, 0, iif(ip.ind_prop = 1, 1, 2))) IND_PROP,' +
            '   ip.cod_cliente,' +
            '   sum(iif(ip.id is null, inv.quantidade, ip.qtde)) posse_qtde,' +
            '   sum(iif(ip.id is null, inv.valor_prod * inv.quantidade, ip.valor * ip.qtde)) posse_total' +
            '   from inv_tipo74 inv' +
            '   left join inv_tipo74_posse ip on ip.inv_id = inv.id and ip.cod_empresa = inv.cod_empresa' +
            '     where inv.cod_empresa = :cod_empresa and data_inv = :datainv' +
            '     group by 1,2,3,4,5,6' +
            '      )' +
            ' as i' +
            ' inner join inv_tipo74 i7 on i7.data_inv = i.data_inv and i7.cod_empresa = i.cod_empresa' +
            '    and i7.grupo_prod = i.grupo_prod and i7.cod_prod = i.cod_prod' +
            ' left join produtos p on p.grupo_prod = i.grupo_prod and p.cod_prod = i.cod_prod' +
            '    and p.cod_empresa = i.cod_empresa';
      }
      vNivel3.SQL.Text := 'select case when not i.chassi_mt is null then ''V''' +
        ' else ''P''' +
        ' end tipo_item, i.grupo_prod, i.cod_prod, i.chassi_mt chassi, p.unidade unid, i.quantidade QTD, i.valor_prod VL_ITEM,' +
        ' i.codigo_posse IND_PROP, i.cod_cliente COD_PART, '''' TXT_COMPL, p.cod_cta_estoque COD_CTA from vw_inv_tipo74 i' +
        ' left join produtos p on p.grupo_prod = i.grupo_prod and p.cod_prod = i.cod_prod and' +
        ' p.cod_empresa = i.cod_empresa where i.data_inv = :DataInv and i.cod_empresa = :cod_empresa';
      vNivel3.ParamByName('datainv').AsDate := StrToDate(FDataInv);
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.Open;

      if vNivel3.IsEmpty then
      begin
        {
        vNivel3.Close;
        vNivel3.SQL.Text := 'select ''P'' tipo_item, p.grupo_prod, p.cod_prod, '''' chassi, p.unidade unid, (p.est_f + p.est_r) QTD,' +
          ' p.prec_cusm_prod VL_ITEM, ''00000000000000'' IND_PROP, '''' COD_PART, '''' TXT_COMPL, p.COD_CTA_ESTOQUE COD_CTA' +
          ' from  produtos p where p.cod_empresa = :cod_empresa and p.ativo = 1 and (p.est_f + p.est_r) > 0' +
          ' union' +
          ' select ''V'' tipo_item, 0, '''', e.chassi_c chassi, ''UN'' unid, 1 qtd,' +
          ' (select first 1 v4.custo from comprasmesesv4 v4 where v4.chassi = e.chassi_c and' +
          ' v4.cod_empresa = e.cod_empresa order by v4.data_ch_nota) VL_ITEM , ''00000000000000'' IND_PROP,' +
          ' '''' COD_PART, '''' TXT_COMPL, ''001'' COD_CTA' +
          ' from est_moto e' +
          ' inner join comprasmesesv4 v4 on v4.chassi = e.chassi_c and v4.cod_empresa = e.cod_empresa';
        vNivel3.Open;
        }
      end;

      vNivel3.FetchAll;

      FProgressBar.Position := 0;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;

      vCurrencyTemp := 0;
      if vNivel3.RecordCount > 0 then
      begin
        FSpedF.Bloco_H.RegistroH001.IND_MOV := imComDados;
        with FSpedF.Bloco_H.RegistroH005New do
        begin
          vNivel3.First;
          while not vNivel3.Eof do
          begin
            Application.ProcessMessages;
            with FSpedF.Bloco_H.RegistroH010New do
            begin
  //            UNID := getUnidade(vNivel3.FieldByName('tipo_item').AsString,
  //                vNivel3.FieldByName('grupo_prod').AsInteger,
  //                vNivel3.FieldByName('cod_prod').AsString,
  //                vNivel3.FieldByName('chassi').AsString,
  //                0, '');
  //            if Trim(UNID) = '' then
              UNID := UpperCase(Trim(vNivel3.FieldByName('UNID').AsString));
              if Trim(UNID) = 'OCA' then
                Application.MessageBox('OCA', '', 0 + 64);

              if Trim(UNID) = '' then
                UNID := 'UN';
              if vNivel3.FieldByName('tipo_item').AsString = 'P' then
              begin
                COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                  Trim(vNivel3.FieldByName('cod_prod').AsString), 16);

                gravaSpedItem(Trim(vNivel3.FieldByName('tipo_item').AsString),
                  vNivel3.FieldByName('grupo_prod').AsInteger,
                  Trim(vNivel3.FieldByName('cod_prod').AsString), '', 0, '', UNID);
              end
              else if vNivel3.FieldByName('tipo_item').AsString = 'V' then
              begin
                COD_ITEM := StrZero(vNivel3.FieldByName('chassi').AsString, 17);

                gravaSpedItem(Trim(vNivel3.FieldByName('tipo_item').AsString),
                  0, '', Trim(vNivel3.FieldByName('chassi').AsString),
                  0, '', UNID);

                vQrAux.Close;
                vQrAux.SQL.Text := 'select ''N'' tipo, em.versaoest versao from est_moto em' +
                  ' where em.chassi_c = :chassi and em.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''T'' tipo, td.versaov versao from transf_dep td' +
                  ' where td.chassiv = :chassi and td.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''U'' tipo, mu.versao_us versao from mtusadas mu' +
                  ' where mu.chassi_us = :chassi and mu.cod_empresa = :cod_empresa';
                vQrAux.ParamByName('chassi').AsString := Trim(vNivel3.FieldByName('chassi').AsString);
                vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vQrAux.Open;

                if Trim(vQrAux.FieldByName('tipo').AsString) <> '' then
                begin
                  vQrAux1.Close;
                  vQrAux1.SQL.Text := 'select COD_CTA_EST_VEIC, COD_CTA_EST_SEMI from TIPMODELO' +
                    ' where codigo = :codigo and cod_empresa = :cod_empresa';
                  vQrAux1.ParamByName('codigo').AsInteger := vQrAux.FieldByName('versao').AsInteger;
                  vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                  vQrAux1.Open;
                  if Trim(vQrAux.FieldByName('tipo').AsString) <> 'U' then
                    COD_CTA := Trim(vQrAux1.FieldByName('COD_CTA_EST_VEIC').AsString)
                  else
                    COD_CTA := Trim(vQrAux1.FieldByName('COD_CTA_EST_SEMI').AsString);
                end;
              end;
              QTD := RoundTo(vNivel3.FieldByName('QTD').AsFloat, -3);
              VL_UNIT := StrToFloatFormat(vNivel3.FieldByName('VL_ITEM').AsFloat,6);
              VL_ITEM := StrToFloatFormat(VL_UNIT * QTD,2);
              IND_PROP := StrToIndProp(vNivel3.FieldByName('IND_PROP').AsString);
              COD_PART := Trim(vNivel3.FieldByName('COD_PART').AsString);
              if vNivel3.FieldByName('COD_PART').AsInteger > 0 then
                montaRegistro0150(COD_PART);
              TXT_COMPL := Trim(vNivel3.FieldByName('TXT_COMPL').AsString);
              if Trim(COD_CTA) <> '' then
              else if Trim(vNivel3.FieldByName('COD_CTA').AsString) <> '' then
                COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString)
              else
                COD_CTA := '001';
              vCurrencyTemp := vCurrencyTemp + VL_ITEM;
            end;
            vNivel3.Next;
            FProgressBar.Position := FProgressBar.Position + 1;
          end;
          DT_INV := StrToDate(FDataInv);
          VL_INV := vCurrencyTemp;
        end;
      end;
    end;

    if vBlocoH then
    for I := 1 to Length(tipos) do
    begin
      FLabelStatus.Caption := 'Montando registro H010 - Inventário - Motivo ' + tipos[i];

      vNivel3.Close;
      vNivel3.SQL.Text := 'select case when not i.chassi_mt is null then ''V''' +
        ' else ''P''' +
        ' end tipo_item, i.grupo_prod, i.cod_prod, i.chassi_mt chassi, p.unidade unid, i.quantidade QTD, i.valor_prod VL_ITEM,' +
        ' i.inscr_posse IND_PROP, '''' COD_PART, '''' TXT_COMPL, p.cod_cta_estoque COD_CTA,' +
        ' iv.h020_cst, iv.h020_bc_icms, iv.h020_vl_icms' +
        ' from inv_tipo74 i' +
        ' left join inv_tipo74_sped_sint iv on iv.data_inv = i.data_inv and iv.cod_empresa = i.cod_empresa and iv.grupo_prod = i.grupo_prod and iv.cod_prod = i.cod_prod' +
        ' left join produtos p on p.grupo_prod = i.grupo_prod and p.cod_prod = i.cod_prod and' +
        ' p.cod_empresa = i.cod_empresa where i.data_inv = :DataInv and i.cod_empresa = :cod_empresa' +
        ' and iv.tp_arq_fiscal like ' + QuotedStr('%|' + tipos[I] + '|%');
      vNivel3.ParamByName('datainv').AsDate := StrToDate(FDataInv);
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.Open;

      vNivel3.FetchAll;

      FProgressBar.Position := 0;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;

      vCurrencyTemp := 0;
      if vNivel3.RecordCount > 0 then
      begin
        FSpedF.Bloco_H.RegistroH001.IND_MOV := imComDados;
        with FSpedF.Bloco_H.RegistroH005New do
        begin
          vNivel3.First;
          while not vNivel3.Eof do
          begin
            Application.ProcessMessages;
            if vNivel3.FieldByName('VL_ITEM').AsCurrency > 0 then
            with FSpedF.Bloco_H.RegistroH010New do
            begin
              if Trim(UNID) = '' then
                UNID := UpperCase(Trim(vNivel3.FieldByName('UNID').AsString));
              if Trim(UNID) = '' then
                UNID := 'UN';
              if vNivel3.FieldByName('tipo_item').AsString = 'P' then
              begin
                COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                  Trim(vNivel3.FieldByName('cod_prod').AsString), 16);

                gravaSpedItem(Trim(vNivel3.FieldByName('tipo_item').AsString),
                  vNivel3.FieldByName('grupo_prod').AsInteger,
                  Trim(vNivel3.FieldByName('cod_prod').AsString), '', 0, '', UNID);
              end
              else if vNivel3.FieldByName('tipo_item').AsString = 'V' then
              begin
                COD_ITEM := StrZero(vNivel3.FieldByName('chassi').AsString, 17);

                gravaSpedItem(Trim(vNivel3.FieldByName('tipo_item').AsString),
                  0, '', Trim(vNivel3.FieldByName('chassi').AsString),
                  0, '', UNID);

                vQrAux.Close;
                vQrAux.SQL.Text := 'select ''N'' tipo, em.versaoest versao from est_moto em' +
                  ' where em.chassi_c = :chassi and em.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''T'' tipo, td.versaov versao from transf_dep td' +
                  ' where td.chassiv = :chassi and td.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''U'' tipo, mu.versao_us versao from mtusadas mu' +
                  ' where mu.chassi_us = :chassi and mu.cod_empresa = :cod_empresa';
                vQrAux.ParamByName('chassi').AsString := Trim(vNivel3.FieldByName('chassi').AsString);
                vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vQrAux.Open;

                if Trim(vQrAux.FieldByName('tipo').AsString) <> '' then
                begin
                  vQrAux1.Close;
                  vQrAux1.SQL.Text := 'select COD_CTA_EST_VEIC, COD_CTA_EST_SEMI from TIPMODELO' +
                    ' where codigo = :codigo and cod_empresa = :cod_empresa';
                  vQrAux1.ParamByName('codigo').AsInteger := vQrAux.FieldByName('versao').AsInteger;
                  vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                  vQrAux1.Open;
                  if Trim(vQrAux.FieldByName('tipo').AsString) <> 'U' then
                    COD_CTA := Trim(vQrAux1.FieldByName('COD_CTA_EST_VEIC').AsString)
                  else
                    COD_CTA := Trim(vQrAux1.FieldByName('COD_CTA_EST_SEMI').AsString);
                end;
              end;
              QTD := RoundTo(vNivel3.FieldByName('QTD').AsFloat, -3);
              VL_UNIT := StrToFloatFormat(vNivel3.FieldByName('VL_ITEM').AsCurrency,6);
              VL_ITEM := StrToFloatFormat(VL_UNIT * QTD,2);
              IND_PROP := piInformante;
              COD_PART := Trim(vNivel3.FieldByName('COD_PART').AsString);
              TXT_COMPL := Trim(vNivel3.FieldByName('TXT_COMPL').AsString);
              if Trim(COD_CTA) <> '' then
              else if Trim(vNivel3.FieldByName('COD_CTA').AsString) <> '' then
                COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString)
              else
                COD_CTA := '001';
              vCurrencyTemp := vCurrencyTemp + VL_ITEM;

              if (vCurrencyTemp > 0) then
                if (Trim(vNivel3.FieldByName('h020_cst').AsString) <> '') or
                  (vNivel3.FieldByName('h020_bc_icms').AsFloat > 0) or
                  (vNivel3.FieldByName('h020_vl_icms').AsFloat > 0) then
                begin
                  with FSpedF.Bloco_H.RegistroH020New do
                  begin
                    CST_ICMS := Trim(vNivel3.FieldByName('h020_cst').AsString);
                    BC_ICMS := RoundTo(vNivel3.FieldByName('h020_bc_icms').AsFloat * IfThen(ConfUnif.ConfInventario.RegistroH020_MultiplicarPelaQtde, QTD, 1), -2);
                    VL_ICMS := RoundTo(vNivel3.FieldByName('h020_vl_icms').AsFloat * IfThen(ConfUnif.ConfInventario.RegistroH020_MultiplicarPelaQtde, QTD, 1), -2);
                  end;
                end;

            end;
            vNivel3.Next;
            FProgressBar.Position := FProgressBar.Position + 1;
          end;
          DT_INV := StrToDate(FDataInv);
          VL_INV := vCurrencyTemp;
          MOT_INV := StrToMotInv(tipos[I])
        end;
      end;
    end;

    if RestComplST.Gerar then
    begin
      FLabelStatus.Caption := 'Montando registro H010 - Inventário - Motivo 06';
      Application.ProcessMessages;

      vCurrencyTemp := 0;
      FSpedF.Bloco_H.RegistroH001.IND_MOV := imComDados;
      with FSpedF.Bloco_H.RegistroH005New do
      begin
        DT_INV := RestComplST.DataInv;
        MOT_INV := miControleMercadoriaSujeitaST;

        RestComplST.Estoque.prepare_loop_fmt('dia = %s', [FormatDateTime('YYYYMMDD', RestComplST.DataInv).QuotedString]);
        try
          FProgressBar.Position := 0;
          FProgressBar.Min := 0;
          FProgressBar.Max := RestComplST.FEstoque.DataSet.RecordCount;

          while not RestComplST.FEstoque.Eof do
          begin
            Application.ProcessMessages;
            FProgressBar.Position := FProgressBar.Position + 1;

            //if RestComplST.FEstoque.ffloat('VL_ITEM') > 0 then
            with FSpedF.Bloco_H.RegistroH010New do
            begin
              UNID := IfEmpty(RestComplST.FEstoque.fstr('unidade').ToUpper, 'UN');
              COD_ITEM := 'P' + PadL(RestComplST.FEstoque.fstr('grupo_prod') +
                                     RestComplST.FEstoque.fstr('cod_prod'), 16, '0');
              gravaSpedItem('P', RestComplST.FEstoque.fint('grupo_prod'),
                                 RestComplST.FEstoque.fstr('cod_prod'), '', 0, '', UNID);

              Produtos.AddProduto(RestComplST.FEstoque.fint('grupo_prod'),
                                  RestComplST.FEstoque.fstr('cod_prod'), UNID, UNID, 1, 1);

              QTD := RestComplST.FEstoque.ffloat('QTD', -3);
              VL_UNIT := RestComplST.FEstoque.ffloat('VL_ITEM', -6);
              VL_ITEM := RoundTo(VL_UNIT * QTD, -2);
              IND_PROP := StrToIndProp(RestComplST.FEstoque.fstr('IND_PROP'));
              COD_PART := RestComplST.FEstoque.fstr('COD_PART');
              if RestComplST.FEstoque.fint('COD_PART') > 0 then
                montaRegistro0150(COD_PART);
              TXT_COMPL := RestComplST.FEstoque.fstr('TXT_COMPL');
              COD_CTA := IfEmpty(RestComplST.FEstoque.fstr('COD_CTA'), '001');
              vCurrencyTemp := vCurrencyTemp + VL_ITEM;

              with FSpedF.Bloco_H.RegistroH030New do
              begin
                VL_ICMS_OP := RestComplST.FEstoque.ffloat('vl_icms_op', -6);
                VL_BC_ICMS_ST := RestComplST.FEstoque.ffloat('vl_bc_icms_st', -6);
                VL_ICMS_ST := RestComplST.FEstoque.ffloat('vl_icms_st', -6);
                VL_FCP := RestComplST.FEstoque.ffloat('vl_fcp', -6);
              end;
            end;
            RestComplST.FEstoque.Next;
          end;

        finally
          RestComplST.Estoque.prepare_loop_done();
        end;

        VL_INV := vCurrencyTemp;
      end;
    end;

  finally
    vNivel3.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoK;
var
  AK100: TRegistroK100;
  AK230: TRegistroK230;
  AK235, AK235tmp: TRegistroK235;
  I: Integer;
  J: Integer;

  function GetK100: TRegistroK100;
  var
    Z: Integer;
  begin
    for Z := 0 to Pred(FSpedF.Bloco_K.RegistroK001.RegistroK100.Count) do
    begin
      Result := FSpedF.Bloco_K.RegistroK001.RegistroK100.Items[Z];
      Exit;
    end;

    Result := FSpedF.Bloco_K.RegistroK100New;
  end;

begin
  try
    FSpedF.Bloco_K.RegistroK001New.IND_MOV := imSemDados;


    if vQrAux.Transaction.InTransaction then
      vQrAux.Transaction.Commit;

    {$REGION 'registros detalhados'}

    if Fefd_icms_k.Ativo and Fefd_icms_k.Producao then
    begin

      {$REGION 'registros K230'}

      {$REGION 'inserindo na tabela sped_item'}
      {
      SqlExec('insert into sped_item (cod_empresa, tipo, grupo_prod, cod_prod, chassi, cod_servico, cod_outras, unid)' +
              Format(' select distinct pr.cod_empresa, ''P'' tipo, pr.grupo_prod, pr.cod_prod, '''' chassi,  0 cod_servico, '''' cod_outras, pr.unidade unid' +
                     ' from producao pdc' +
                     ' inner join producao_item pdi on pdi.cod_producao = pdc.cod_producao and pdi.cod_empresa = pdc.cod_empresa' +
                     ' inner join produtos pr on pr.grupo_prod = pdi.grupo_prod and pr.cod_prod = pdi.cod_prod and pr.cod_empresa = pdi.cod_empresa' +
                     ' left join sped_item spi on spi.grupo_prod = pr.grupo_prod and spi.cod_prod = pr.cod_prod and spi.cod_empresa = pr.cod_empresa and spi.tipo = ''P''' +
                     ' where pdc.data_fechamento >= %s and pdc.data_fechamento <= %s and pdc.cod_empresa = %s' +
                     ' and pdc.status = ''FECHADO'' and spi.tipo is null',
                     [FormatDateTime('YYYY-MM-DD', StrToDate(DataIni)).QuotedString,
                      FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]) +
              Format(' union' +
                     ' select distinct pr.cod_empresa, ''P'' tipo, pr.grupo_prod, pr.cod_prod, '''' chassi,  0 cod_servico, '''' cod_outras, pr.unidade unid' +
                     ' from producao pdc' +
                     ' inner join producao_item_indice pii on pii.cod_producao = pdc.cod_producao and pii.cod_empresa = pdc.cod_empresa' +
                     ' inner join produtos pr on pr.grupo_prod = pii.grupo_prod and pr.cod_prod = pii.cod_prod and pr.cod_empresa = pii.cod_empresa' +
                     ' left join sped_item spi on spi.grupo_prod = pr.grupo_prod and spi.cod_prod = pr.cod_prod and spi.cod_empresa = pr.cod_empresa and spi.tipo = ''P''' +
                     ' where pdc.data_fechamento >= %s and pdc.data_fechamento <= %s and pdc.cod_empresa = %s' +
                     ' and pdc.status = ''FECHADO'' and spi.tipo is null',
                     [FormatDateTime('YYYY-MM-DD', StrToDate(DataIni)).QuotedString,
                      FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]));

      SqlExec('insert into sped_item (cod_empresa, tipo, grupo_prod, cod_prod, chassi, cod_servico, cod_outras, unid)' +
              Format(' select distinct pr.cod_empresa, ''P'' tipo, pr.grupo_prod, pr.cod_prod, '''' chassi,  0 cod_servico, '''' cod_outras, pr.unidade unid' +
                     ' from producao pdc' +
                     ' inner join producao_item pdi on pdi.cod_producao = pdc.cod_producao and pdi.cod_empresa = pdc.cod_empresa' +
                     ' inner join produtos pr on pr.grupo_prod = pdi.grupo_prod and pr.cod_prod = pdi.cod_prod and pr.cod_empresa = pdi.cod_empresa' +
                     ' left join sped_item spi on spi.grupo_prod = pr.grupo_prod and spi.cod_prod = pr.cod_prod and spi.cod_empresa = pr.cod_empresa and spi.tipo = ''P''' +
                     ' where pdc.data_inicio <= %s and pdc.cod_empresa = %s' +
                     ' and pdc.status = ''INICIADO'' and spi.tipo is null',
                     [FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]) +
              Format(' union' +
                     ' select distinct pr.cod_empresa, ''P'' tipo, pr.grupo_prod, pr.cod_prod, '''' chassi,  0 cod_servico, '''' cod_outras, pr.unidade unid' +
                     ' from producao pdc' +
                     ' inner join producao_item_indice pii on pii.cod_producao = pdc.cod_producao and pii.cod_empresa = pdc.cod_empresa' +
                     ' inner join produtos pr on pr.grupo_prod = pii.grupo_prod and pr.cod_prod = pii.cod_prod and pr.cod_empresa = pii.cod_empresa' +
                     ' left join sped_item spi on spi.grupo_prod = pr.grupo_prod and spi.cod_prod = pr.cod_prod and spi.cod_empresa = pr.cod_empresa and spi.tipo = ''P''' +
                     ' where pdc.data_inicio <= %s and pdc.cod_empresa = %s' +
                     ' and pdc.status = ''INICIADO'' and spi.tipo is null',
                     [FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]));}
      {$ENDREGION}

      {$REGION 'inserindo na tabela temporaria para obter o estoque posteriormente e para o regisotro 0200'}
      SqlExec('ALTER SEQUENCE SEQ_PRODUTOS_TMP RESTART WITH 0');
      SqlExec('insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod)' +
              Format(' select distinct ''K200_A'' id_tmp, pr.cod_empresa, pr.grupo_prod, pr.cod_prod' +
                     ' from producao pdc' +
                     ' inner join producao_item pdi on pdi.cod_producao = pdc.cod_producao and pdi.cod_empresa = pdc.cod_empresa' +
                     ' inner join produtos pr on pr.grupo_prod = pdi.grupo_prod and pr.cod_prod = pdi.cod_prod and pr.cod_empresa = pdi.cod_empresa' +
                     ' left join produtos_tmp ptm on ptm.grupo_prod = pr.grupo_prod and ptm.cod_prod = pr.cod_prod and ptm.cod_empresa = pr.cod_empresa' +
                     ' where pdc.data_fechamento >= %s and pdc.data_fechamento <= %s and pdc.cod_empresa = %s' +
                     ' and pdc.status = ''FECHADO''',
                     [FormatDateTime('YYYY-MM-DD', StrToDate(DataIni)).QuotedString,
                      FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]) +
              Format(' union' +
                     ' select distinct ''K200_M'' id_tmp, pr.cod_empresa, pr.grupo_prod, pr.cod_prod' +
                     ' from producao pdc' +
                     ' inner join producao_item_indice pii on pii.cod_producao = pdc.cod_producao and pii.cod_empresa = pdc.cod_empresa' +
                     ' inner join produtos pr on pr.grupo_prod = pii.grupo_prod and pr.cod_prod = pii.cod_prod and pr.cod_empresa = pii.cod_empresa' +
                     ' left join produtos_tmp ptm on ptm.grupo_prod = pr.grupo_prod and ptm.cod_prod = pr.cod_prod and ptm.cod_empresa = pr.cod_empresa' +
                     ' where pdc.data_fechamento >= %s and pdc.data_fechamento <= %s and pdc.cod_empresa = %s' +
                     ' and pdc.status = ''FECHADO''',
                     [FormatDateTime('YYYY-MM-DD', StrToDate(DataIni)).QuotedString,
                      FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]) +
              Format(' union' +
                     ' select distinct ''K200_A'' id_tmp, pr.cod_empresa, pr.grupo_prod, pr.cod_prod' +
                     ' from producao pdc' +
                     ' inner join producao_item pdi on pdi.cod_producao = pdc.cod_producao and pdi.cod_empresa = pdc.cod_empresa' +
                     ' inner join produtos pr on pr.grupo_prod = pdi.grupo_prod and pr.cod_prod = pdi.cod_prod and pr.cod_empresa = pdi.cod_empresa' +
                     ' left join produtos_tmp ptm on ptm.grupo_prod = pr.grupo_prod and ptm.cod_prod = pr.cod_prod and ptm.cod_empresa = pr.cod_empresa' +
                     ' where pdc.data_inicio <= %s and pdc.cod_empresa = %s' +
                     ' and pdc.status = ''INICIADO''',
                     [FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]) +
              Format(' union' +
                     ' select distinct ''K200_M'' id_tmp, pr.cod_empresa, pr.grupo_prod, pr.cod_prod' +
                     ' from producao pdc' +
                     ' inner join producao_item_indice pii on pii.cod_producao = pdc.cod_producao and pii.cod_empresa = pdc.cod_empresa and pii.nitem > 0' +
                     ' inner join produtos pr on pr.grupo_prod = pii.grupo_prod and pr.cod_prod = pii.cod_prod and pr.cod_empresa = pii.cod_empresa' +
                     ' left join produtos_tmp ptm on ptm.grupo_prod = pr.grupo_prod and ptm.cod_prod = pr.cod_prod and ptm.cod_empresa = pr.cod_empresa' +
                     ' where pdc.data_inicio <= %s and pdc.cod_empresa = %s' +
                     ' and pdc.status = ''INICIADO''',
                     [FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]));
      {$ENDREGION}

      SqlOpen(
        Format('select pdc.data_inicio, pdc.data_fechamento, pdc.cod_producao, pdc.status, pdc.data_estoque' +
               ' from producao pdc' +
               ' where pdc.data_fechamento >= %s and pdc.data_fechamento <= %s and pdc.cod_empresa = %s' +
               ' and pdc.status = ''FECHADO'' and coalesce(pdc.tipo_k,''K230'') = ''K230''',
               [FormatDateTime('YYYY-MM-DD', StrToDate(DataIni)).QuotedString,
                FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]) +
        Format(' union' +
               ' select pdc.data_inicio, pdc.data_fechamento, pdc.cod_producao, pdc.status, pdc.data_estoque' +
               ' from producao pdc' +
               ' where pdc.data_inicio <= %s and pdc.cod_empresa = %s' +
               ' and pdc.status = ''INICIADO'' and coalesce(pdc.tipo_k,''K230'') = ''K230''',
               [FormatDateTime('YYYY-MM-DD', StrToDate(DataFim)).QuotedString, FCodEmpresa]), vNivel2).FetchAll;

      FProgressBar.Max := vNivel2.RecordCount;
      vNivel2.First;
      while not vNivel2.Eof do
      begin
        FProgressBar.Position := vNivel2.RecNo;
        Application.ProcessMessages;
        SqlOpen('select pdi.nitem, pdi.grupo_prod, pdi.cod_prod, sum(pdi.quantidade) quantidade' +
                ' from producao_item pdi' +
                ' where pdi.cod_producao = %d and pdi.cod_empresa = %s' +
                ' group by 1,2,3',
                [vNivel2.FieldByName('cod_producao').AsInteger, FCodEmpresa], vNivel3).First;
        while not vNivel3.Eof do
        begin
          if not Assigned(AK100) then
          begin
            AK100 := GetK100;
            with AK100 do
            begin
              DT_INI := StrToDate(FDataIni);
              DT_FIN := StrToDate(FDataFim);
            end;
          end;

          AK230 := nil;
          for I := 0 to FSpedF.Bloco_K.RegistroK001.RegistroK100.Count - 1 do
            for J := 0 to FSpedF.Bloco_K.RegistroK001.RegistroK100.Items[I].RegistroK230.Count - 1 do
              with FSpedF.Bloco_K.RegistroK001.RegistroK100.Items[I].RegistroK230.Items[J] do
                if (COD_DOC_OP = vNivel2.FieldByName('cod_producao').AsString) and
                   (COD_ITEM = 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                                          Trim(vNivel3.FieldByName('cod_prod').AsString), 16)) then
                begin
                  AK230 := FSpedF.Bloco_K.RegistroK001.RegistroK100.Items[I].RegistroK230.Items[J];
                  Break;
                end;

          if not Assigned(AK230) then
          begin
            AK230 := FSpedF.Bloco_K.RegistroK230New;
            AK230.DT_INI_OP := vNivel2.FieldByName('data_inicio').AsDateTime;
          end;

          with AK230 do
          begin
            COD_DOC_OP := vNivel2.FieldByName('cod_producao').AsString;
            COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                                 Trim(vNivel3.FieldByName('cod_prod').AsString), 16);
            if vNivel2.FieldByName('status').AsString = 'FECHADO' then
            begin
              DT_FIN_OP := vNivel2.FieldByName('data_fechamento').AsDateTime;
              QTD_ENC   := vNivel3.FieldByName('quantidade').AsFloat;
            end;
          end;

          SqlOpen('select pii.grupo_prod, pii.cod_prod,' +
                  ' sum(coalesce(pii.quantidade_utilizada, 0) + coalesce(pii.quantidade_perda, 0)) quantidade' +
                  ' from producao_item_indice pii' +
                  ' where pii.cod_producao = %d and pii.cod_empresa = %s and pii.nitem = %d' +
                  ' group by 1,2',
                  [vNivel2.FieldByName('cod_producao').AsInteger, FCodEmpresa,
                   vNivel3.FieldByName('nitem').AsInteger], vNivel4).First;
          while not vNivel4.Eof do
          begin
            AK235tmp := TRegistroK235.Create(nil);
            with AK235tmp do
            begin
              DT_SAIDA := IfThen((vNivel2.FieldByName('data_estoque').IsNull) or
                                 (vNivel2.FieldByName('data_estoque').AsDateTime < vNivel2.FieldByName('data_inicio').AsDateTime),
                                 vNivel2.FieldByName('data_inicio').AsDateTime,
                                 vNivel2.FieldByName('data_estoque').AsDateTime);
              DT_SAIDA := IfThen(DT_SAIDA < StrToDate(FDataIni), StrToDate(FDataIni), DT_SAIDA);
              COD_ITEM :=  'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
                                 Trim(vNivel4.FieldByName('cod_prod').AsString), 16);
              QTD      := vNivel4.FieldByName('quantidade').AsFloat;
            end;

            AK235 := nil;
            for I := 0 to AK230.RegistroK235.Count - 1 do
              with AK230.RegistroK235.Items[I] do
                if (DT_SAIDA = AK235tmp.DT_SAIDA) and (COD_ITEM = AK235tmp.COD_ITEM) then
                begin
                  AK235 := AK230.RegistroK235.Items[I];
                  QTD := QTD + AK235tmp.QTD;
                end;

            if not Assigned(AK235) then
              with FSpedF.Bloco_K.RegistroK235New do
              begin
                DT_SAIDA := AK235tmp.DT_SAIDA;
                COD_ITEM := AK235tmp.COD_ITEM;
                QTD := AK235tmp.QTD;
              end;

            vNivel4.Next;
          end;
          vNivel3.Next;
        end;
        vNivel2.Next;
      end;

      {$ENDREGION}

    end;

    if Fefd_icms_k.Ativo and (Fefd_icms_k.Producao or Fefd_icms_k.Estoque) then
    begin
      //fH005GerarMotivo01
      //vBlocoH;

      {$REGION 'inserindo na tabela temporario para o 0200'}
      if vBlocoH and fH005GerarMotivo01 and (StrToDate(DataInv) = StrToDate(FDataFim)) then
        Fefd_icms_k.dataEstoque := StrToDate(DataInv);

      SqlExec('insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod)' +
              Format(' select distinct ''K280'' id_tmp, ei.cod_empresa, ei.grupo_prod, ei.cod_prod' +
                     ' from estoque_ajuste ea' +
                     ' inner join estoque_ajuste_itens ei on ei.id_ajuste = ea.id_ajuste and ei.cod_empresa = ea.cod_empresa' +
                     ' where ea.data_apuracao >= %s and ea.data_apuracao <= %s and ea.cod_empresa = %s' +
                     ' group by 1,2,3,4' +
                     ' having sum(ei.quantidade) <> 0',
                     [FormatDateTime('YYYY-MM-DD', Fefd_icms_k.dataAjusteIni).QuotedString,
                      FormatDateTime('YYYY-MM-DD', Fefd_icms_k.dataAjusteFim).QuotedString, FCodEmpresa]) +
              Format(' union' +
                     ' select distinct ''K200'' id_tmp, iv.cod_empresa, iv.grupo_prod, iv.cod_prod from inv_tipo74 iv' +
                     ' inner join produtos pr on pr.grupo_prod = iv.grupo_prod and pr.cod_prod = iv.cod_prod and pr.cod_empresa = iv.cod_empresa' +
                     ' where iv.data_inv = %s and iv.cod_empresa = %s' +
                     ' and case when pr.consumo = ''S'' then ''07'' ' +
                     '          when (coalesce(pr.tipo_item, '''') = '''') then ''00''' +
                     '          else pr.tipo_item' +
                     '     end in (''00'',''01'',''02'',''03'',''04'',''05'',''06'',''10'')',
                     [FormatDateTime('YYYY-MM-DD', Fefd_icms_k.dataEstoque).QuotedString, FCodEmpresa]));
      {$ENDREGION}

      {$REGION 'registro K200 - estoque'}
      //FDataInv := DateToStr(StrToDateDef(FDataInv, StrToDate(FDataFim)));
      SqlOpen('select iv.grupo_prod, iv.cod_prod, iv.quantidade, iv.codigo_posse, iv.cod_cliente from vw_inv_tipo74 iv' +
              ' inner join produtos pr on pr.grupo_prod = iv.grupo_prod and pr.cod_prod = iv.cod_prod and pr.cod_empresa = iv.cod_empresa' +
              ' where iv.data_inv = %s and iv.cod_empresa = %s' +
              ' and case when pr.consumo = ''S'' then ''07'' ' +
              '          when (coalesce(pr.tipo_item, '''') = '''') then ''00''' +
              '          else pr.tipo_item' +
              '     end in (''00'',''01'',''02'',''03'',''04'',''05'',''06'',''10'')' +
              ' order by iv.grupo_prod, iv.cod_prod',
              [FormatDateTime('YYYY-MM-DD', Fefd_icms_k.dataEstoque).QuotedString,
               FCodEmpresa], vNivel3).FetchAll;
      {SqlOpen('select pr.grupo_prod, pr.cod_prod, coalesce(cs.quantidade, coalesce(esd.estoque, pr.est_f)) estoque,' +
              ' cs.quantidade qt_inv, esd.estoque qt_estd, pr.est_f qt_prod' +
              ' from (select pdt.grupo_prod, pdt.cod_prod, pdt.cod_empresa, i74.quantidade, max(ed.seqid) seqid' +
              '       from produtos_tmp pdt' +
              '       left join inv_tipo74 i74 on i74.grupo_prod = pdt.grupo_prod and i74.cod_prod = pdt.cod_prod and i74.cod_empresa = pdt.cod_empresa and i74.data_inv = %s and i74.quantidade > 0' +
              '       left join estoque_diario ed on ed.grupo_prod = pdt.grupo_prod and ed.cod_prod = pdt.cod_prod and ed.cod_empresa = pdt.cod_empresa and ed.dia <= %s and ed.estoque > 0' +
              '       where pdt.id_tmp = %s and pdt.cod_empresa = %s' +
              '       group by pdt.grupo_prod, pdt.cod_prod, pdt.cod_empresa, i74.quantidade' +
              '       ) as cs' +
              ' inner join produtos pr on pr.grupo_prod = cs.grupo_prod and pr.cod_prod = cs.cod_prod and pr.cod_empresa = cs.cod_empresa' +
              ' left join estoque_diario esd on esd.tipo = ''P'' and esd.seqid = cs.seqid and esd.cod_empresa = cs.cod_empresa',
              [FormatDateTime('YYYY-MM-DD', Fefd_icms_k.dataEstoque).QuotedString,
               FormatDateTime('YYYY-MM-DD', StrToDate(FDataFim)).QuotedString,
               QuotedStr('K200_E'), FCodEmpresa], vNivel3).FetchAll;}
      FProgressBar.Max := vNivel3.RecordCount;
      vNivel3.First;
      while not vNivel3.Eof do
      begin
        if not Assigned(AK100) then
        begin
          AK100 := GetK100;
          with AK100 do
          begin
            DT_INI := StrToDate(FDataIni);
            DT_FIN := StrToDate(FDataFim);
          end;
        end;

        FProgressBar.Position := vNivel3.RecNo;
        Application.ProcessMessages;
        with FSpedF.Bloco_K.RegistroK200New do
        begin
          DT_EST   := StrToDate(FDataFim);
          COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                               Trim(vNivel3.FieldByName('cod_prod').AsString), 16);
          QTD      := IfThen(vNivel3.FieldByName('quantidade').AsFloat >= 0, vNivel3.FieldByName('quantidade').AsFloat, 0);
          IND_EST  := TACBrIndEstoque( vNivel3.FieldByName('codigo_posse').AsInteger );
          COD_PART := vNivel3.FieldByName('cod_cliente').AsString;
          if vNivel3.FieldByName('cod_cliente').AsInteger > 0 then
            montaRegistro0150(COD_PART);
        end;
        vNivel3.Next;
      end;
      {$ENDREGION}

      {$REGION 'K280 - Correções de estoque'}
      SqlOpen('select ea.data_apuracao, ei.grupo_prod, ei.cod_prod, sum(ei.quantidade) quantidade' +
              ' from estoque_ajuste ea' +
              ' inner join estoque_ajuste_itens ei on ei.id_ajuste = ea.id_ajuste and ei.cod_empresa = ea.cod_empresa' +
              ' where ea.data_apuracao >= %s and ea.data_apuracao <= %s and ea.cod_empresa = %s' +
              ' group by 1,2,3' +
              ' order by 2,3,1',
              [FormatDateTime('YYYY-MM-DD', Fefd_icms_k.dataAjusteIni).QuotedString,
               FormatDateTime('YYYY-MM-DD', Fefd_icms_k.dataAjusteFim).QuotedString,
               FCodEmpresa], vNivel3).FetchAll;
      FProgressBar.Max := vNivel3.RecordCount;
      vNivel3.First;
      while not vNivel3.Eof do
      begin
        FProgressBar.Position := vNivel3.RecNo;
        Application.ProcessMessages;
        if vNivel3.FieldByName('quantidade').AsFloat <> 0 then
        begin
          if not Assigned(AK100) then
          begin
            AK100 := GetK100;
            with AK100 do
            begin
              DT_INI := StrToDate(FDataIni);
              DT_FIN := StrToDate(FDataFim);
            end;
          end;
          with FSpedF.Bloco_K.RegistroK280New do
          begin
            DT_EST   := vNivel3.FieldByName('data_apuracao').AsDateTime;
            COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                                 Trim(vNivel3.FieldByName('cod_prod').AsString), 16);
            if vNivel3.FieldByName('quantidade').AsFloat > 0 then
              QTD_COR_POS := Abs(vNivel3.FieldByName('quantidade').AsFloat)
            else
              QTD_COR_NEG := Abs(vNivel3.FieldByName('quantidade').AsFloat);
            IND_EST  := estPropInformantePoder;
          end;
        end;

        vNivel3.Next;
      end;
      {$ENDREGION}

    end;

    {$REGION 'registros da receita 0210 quando todos '}
    if Fefd_icms_k.Ativo and (Fefd_icms_k.Dados_0210 = 'T') then
      SqlExec('insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod)' +
            Format(' select %s id_tmp, pr.cod_empresa, pr.grupo_prod, pr.cod_prod' +
                   ' from (select distinct ind.grupo_prod_acabado grupo_prod, ind.cod_prod_acabado cod_prod, ind.cod_empresa' +
                   ' from indice_tecnico ind' +
                   ' where ind.cod_empresa = %s) as acab' +
                   ' inner join produtos pr on pr.grupo_prod = acab.grupo_prod and pr.cod_prod = acab.cod_prod' +
                   ' and pr.cod_empresa = acab.cod_empresa and pr.ativo = 1',
                   [QuotedStr('K200_A'), FCodEmpresa]) +
            Format(' union' +
                   ' select distinct %s id_tmp, pr.cod_empresa, pr.grupo_prod, pr.cod_prod' +
                   ' from (select distinct ind.grupo_prod_acabado grupo_prod, ind.cod_prod_acabado cod_prod, ind.cod_empresa' +
                   '       from indice_tecnico ind' +
                   '       where ind.cod_empresa = %s) as acab' +
                   ' inner join indice_tecnico tec on tec.grupo_prod_acabado = acab.grupo_prod' +
                   '       and tec.cod_prod_acabado = acab.cod_prod and tec.cod_empresa = acab.cod_empresa' +
                   ' inner join produtos pr on pr.grupo_prod = tec.grupo_prod_mprima' +
                   '       and pr.cod_prod = tec.cod_prod_mprima and pr.cod_empresa = tec.cod_empresa and pr.ativo = 1',
                   [QuotedStr('K200_M'), FCodEmpresa]))
    else if Fefd_icms_k.Ativo and (Fefd_icms_k.Dados_0210 = 'Q') then
      SqlExec('insert into produtos_tmp (id_tmp, cod_empresa, grupo_prod, cod_prod)' +
            Format(' select %s id_tmp, pr.cod_empresa, pr.grupo_prod, pr.cod_prod' +
                   ' from produtos_tmp pdt' +
                   ' inner join indice_tecnico tec on tec.grupo_prod_acabado = pdt.grupo_prod' +
                   '       and tec.cod_prod_acabado = pdt.cod_prod and tec.cod_empresa = pdt.cod_empresa' +
                   ' inner join produtos pr on pr.grupo_prod = tec.grupo_prod_mprima' +
                   '       and pr.cod_prod = tec.cod_prod_mprima and pr.cod_empresa = tec.cod_empresa and pr.ativo = 1' +
                   ' left join produtos_tmp ptm on ptm.grupo_prod = pr.grupo_prod and ptm.cod_prod = pr.cod_prod' +
                   '       and ptm.cod_empresa = pr.cod_empresa and ptm.grupo_prod is null' +
                   ' where pdt.id_tmp = %s and pdt.cod_empresa = %s',
                   [QuotedStr('K200_M'), QuotedStr('K200_A'), FCodEmpresa]));
    {$ENDREGION}

    {$ENDREGION}

    {$REGION 'inserindo na tabela sped_item'}
     SqlExec('insert into sped_item (cod_empresa, tipo, grupo_prod, cod_prod, chassi, cod_servico, cod_outras, unid)' +
             ' select distinct pr.cod_empresa, ''P'' tipo, pr.grupo_prod, pr.cod_prod, '''' chassi,  0 cod_servico, '''' cod_outras, pr.unidade unid' +
             ' from produtos_tmp pdt' +
             ' inner join produtos pr on pr.grupo_prod = pdt.grupo_prod and pr.cod_prod = pdt.cod_prod and pr.cod_empresa = pdt.cod_empresa' +
             ' left join sped_item spi on spi.grupo_prod = pr.grupo_prod and spi.cod_prod = pr.cod_prod and spi.cod_empresa = pr.cod_empresa' +
             '   and spi.tipo = ''P'' ' +
             ' where pdt.id_tmp in (%s) and pdt.cod_empresa = %s and spi.cod_prod is null',
             [Format('%s,%s,%s', [QuotedStr('K200_A'), QuotedStr('K200_M'), QuotedStr('K200'), QuotedStr('K280')]), FCodEmpresa]);
     if Fefd_icms_k.Ativo and (IndexText(Fefd_icms_k.Dados_0210, ['T', 'Q']) >= 0) then
       SqlExec('update sped_item si set si.cod_outras = ''A'' where si.tipo = ''P'' and si.cod_empresa = %s' +
               ' and exists( select * from produtos_tmp pt' +
               '               where pt.grupo_prod = si.grupo_prod and pt.cod_prod = si.cod_prod' +
               '                     and pt.cod_empresa = si.cod_empresa and pt.id_tmp = ''K200_A'')',
               [FCodEmpresa]);
     if vQrAux.Transaction.InTransaction then
       vQrAux.Transaction.Commit;
    {$ENDREGION}

    if FSpedF.Bloco_K.RegistroK001.RegistroK100.Count > 0 then
      with FSpedF.Bloco_K.RegistroK001.RegistroK100.Items[0] do
        if (RegistroK200.Count > 0) or (RegistroK210.Count > 0) or
           (RegistroK220.Count > 0) or (RegistroK230.Count > 0) or
           (RegistroK250.Count > 0) or (RegistroK260.Count > 0) or
           (RegistroK270.Count > 0) or (RegistroK280.Count > 0) then
          FSpedF.Bloco_K.RegistroK001New.IND_MOV := imComDados;

  finally
    vNivel2.Close;
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
    vNivel6.Close;
  end;
end;

procedure TSpedFiscal.montaRegistro0200;
begin

  Build0221;

  inherited;

end;

procedure TSpedFiscal.montaRegistro0300(pCOD_IND_BEM: string);
var
  I, vCOD_PRNC: Integer;
begin
  vCOD_PRNC := 0;
  for I := 0 to F0300.Count - 1 do
    if F0300[I] = pCOD_IND_BEM then
      exit;
  vQrAux.Close;
  vQrAux.SQL.Text := 'select eq.cod_equip COD_IND_BEM, eq.ident_merc, eq.nom_equip DESCR_ITEM,' +
    ' eq.cod_prnc, eq.cod_cta_eq COD_CTA, eq.nr_parc, eq.cod_ccus, eq.func,' +
    ' eq.vida_util from equipamento eq' +
    ' where eq.cod_equip = :COD_IND_BEM and eq.cod_empresa = :cod_empresa';
  vQrAux.ParamByName('COD_IND_BEM').AsInteger := StrToInt(Trim(pCOD_IND_BEM));
  vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(Trim(FCodEmpresa));
  vQrAux.Open;
  try
    with FSpedF.Bloco_0.Registro0300New do
    begin
      COD_IND_BEM := vQrAux.FieldByName('COD_IND_BEM').AsString;
      IDENT_MERC := vQrAux.FieldByName('IDENT_MERC').AsInteger;
      DESCR_ITEM := Trim(vQrAux.FieldByName('DESCR_ITEM').AsString);
      if vQrAux.FieldByName('COD_PRNC').AsInteger > 0 then
      begin
        COD_PRNC := vQrAux.FieldByName('COD_PRNC').AsString;
        vCOD_PRNC := vQrAux.FieldByName('COD_PRNC').AsInteger;
      end;
      COD_CTA := Trim(vQrAux.FieldByName('COD_CTA').AsString);
      if vQrAux.FieldByName('NR_PARC').AsFloat > 0 then
        NR_PARC := vQrAux.FieldByName('NR_PARC').AsFloat;

      with FSpedF.Bloco_0.Registro0305New do
      begin
        COD_CCUS := vQrAux.FieldByName('COD_CCUS').AsString;
        FUNC := Trim(getCampoBlobString(vQrAux.FieldByName('FUNC').AsString));
        if vQrAux.FieldByName('VIDA_UTIL').AsInteger > 0 then
          VIDA_UTIL := vQrAux.FieldByName('VIDA_UTIL').AsInteger;
      end;
      F0300.Add(pCOD_IND_BEM);
    end;
    if vCOD_PRNC > 0 then
    begin
      for I := 0 to F0300.Count - 1 do
        if F0300[I] = IntToStr(vCOD_PRNC) then
          exit;
      vQrAux.Close;
      vQrAux.SQL.Text := 'select eq.cod_equip COD_IND_BEM, eq.ident_merc, eq.nom_equip DESCR_ITEM,'
        +
        ' eq.cod_prnc, eq.cod_cta_eq COD_CTA, eq.nr_parc, eq.cod_ccus, eq.func,' +
        ' eq.vida_util from equipamento eq' +
        ' where eq.cod_equip = :COD_IND_BEM and eq.cod_empresa = :cod_empresa';
      vQrAux.ParamByName('COD_IND_BEM').AsInteger := vCOD_PRNC;
      vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(Trim(FCodEmpresa));
      vQrAux.Open;
      with FSpedF.Bloco_0.Registro0300New do
      begin
        COD_IND_BEM := vQrAux.FieldByName('COD_IND_BEM').AsString;
        IDENT_MERC := vQrAux.FieldByName('IDENT_MERC').AsInteger;
        DESCR_ITEM := Trim(vQrAux.FieldByName('DESCR_ITEM').AsString);
        //COD_PRNC
        COD_CTA := Trim(vQrAux.FieldByName('COD_CTA').AsString);
        if vQrAux.FieldByName('NR_PARC').AsFloat > 0 then
          NR_PARC := vQrAux.FieldByName('NR_PARC').AsFloat;

        with FSpedF.Bloco_0.Registro0305New do
        begin
          COD_CCUS := vQrAux.FieldByName('COD_CCUS').AsString;
          FUNC := Trim(getCampoBlobString(vQrAux.FieldByName('FUNC').AsString));
          if vQrAux.FieldByName('VIDA_UTIL').AsInteger > 0 then
            VIDA_UTIL := vQrAux.FieldByName('VIDA_UTIL').AsInteger;
        end;
        F0300.Add(pCOD_IND_BEM);
      end;
    end;
  finally
    vQrAux.Close;
  end;
end;

procedure TSpedFiscal.montaRegistro0460(pCOD_OBS: integer; pTXT: string);
var
  I: Integer;
begin
  for I := 0 to F0460.Count - 1 do
    if F0460[I] = IntToStr(pCOD_OBS) then
      exit;
  with FSpedF.Bloco_0.Registro0460New do
  begin
    COD_OBS := IntToStr(pCOD_OBS);
    TXT := getCampoBlobString(pTXT);
    F0460.Add(IntToStr(pCOD_OBS));
  end;
end;

procedure TSpedFiscal.setSTEstado(cod_part: string);
var
  vStringTemp: string;
  I: Integer;
begin
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FSigla[i] := Sigla[i];
end;

procedure TSpedFiscal.somaFDEB_ESP_ST(UF: string; pDEB_ESP_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  for I := 1 to 27 do
    if UF = Sigla[i] then
    begin
      FDEB_ESP_ST[i] := FDEB_ESP_ST[i] + pDEB_ESP_ST;
      FSigla[I]      := UF;
    end;
  {
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FDEB_ESP_ST[i] := FDEB_ESP_ST[i] + pDEB_ESP_ST;
  }
end;

procedure TSpedFiscal.somaFVL_AJ_CREDITOS_ST(UF: string;
  pVL_AJ_CREDITOS_ST: Currency);
var
  I: Integer;
begin
  for I := 1 to 27 do
    if UF = Sigla[i] then
    begin
      FVL_AJ_CREDITOS_ST[i] := FVL_AJ_CREDITOS_ST[i] + pVL_AJ_CREDITOS_ST;
      FSigla[I]             := UF;
    end;
  {
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_AJ_CREDITOS_ST[i] := FVL_AJ_CREDITOS_ST[i] + pVL_AJ_CREDITOS_ST;
  }
end;

procedure TSpedFiscal.somaFVL_AJ_DEBITOS_ST(UF: string;
  pVL_AJ_DEBITOS_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  for I := 1 to 27 do
    if UF = Sigla[i] then
    begin
      FVL_AJ_DEBITOS_ST[i] := FVL_AJ_DEBITOS_ST[i] + pVL_AJ_DEBITOS_ST;
      FSigla[I]            := UF;
    end;
  {
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_AJ_DEBITOS_ST[i] := FVL_AJ_DEBITOS_ST[i] + pVL_AJ_DEBITOS_ST;
  }
end;

procedure TSpedFiscal.somaFVL_DEVOL_ST(cod_part: string;
  pVL_DEVOL_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_DEVOL_ST[i] := FVL_DEVOL_ST[i] + pVL_DEVOL_ST;
end;

procedure TSpedFiscal.somaFVL_OUT_CRED_ST(cod_part: string;
  pVL_OUT_CRED_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_OUT_CRED_ST[i] := FVL_OUT_CRED_ST[i] + pVL_OUT_CRED_ST;
end;

procedure TSpedFiscal.somaFVL_RETENCAO_ST(cod_part: string;
  pVL_RETENCAO_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_RETENCAO_ST[i] := FVL_RETENCAO_ST[i] + pVL_RETENCAO_ST;
end;

procedure TSpedFiscal.teste;
begin
  FSpedF := TACBrSPEDFiscal.Create(Application);
  FSpedF.DT_INI := StrToDate(DataIni);
  FSpedF.DT_FIN := StrToDate(DataFim);
  FSpedF.LinhasBuffer := 1000;

  FSpedF.IniciaGeracao;
end;

procedure TSpedFiscal.verificaFormasPagS(numNf: integer; dataNF,
  serieNF: string);
var
  vQrTemp, vQrTemp2, vQrExec: TIBQuery;
begin
  try
    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    vQrTemp2 := TIBQuery.Create(Application);
    vQrTemp2.Database := vConexao;
    vQrTemp2.Transaction := vTransacao;

    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacao;
    try
      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select num_nf, data_nf, tipo, nped' +
        ' from pedvenda where num_nf = ' + IntToStr(numNf) + ' and data_nf = :data_nf' +
        ' and cod_empresa = ' + FCodEmpresa + ' and ativo = 1';
      vQrTemp.ParamByName('data_nf').AsDate := StrToDate(dataNF);
      vQrTemp.Open;
      while not vQrTemp.Eof do
      begin
        vQrTemp2.Close;
        vQrTemp2.SQL.Text := 'select nrequisicao from formpagamento' +
          ' where nrequisicao = ' + vQrTemp.FieldByName('nped').AsString +
          ' and tpdocs = ' + QuotedStr(Trim(vQrTemp.FieldByName('tipo').AsString)) +
          ' and cod_empresa = ' + FCodEmpresa +
          ' and num_nota is null ';
        vQrTemp2.Open;
        if not vQrTemp2.IsEmpty then
        begin
          vQrExec.Close;
          vQrExec.SQL.Text := 'update formpagamento set num_nota = ' + IntToStr(numNf) +
            ', sub_serie = ' + Trim(serieNF) +
            ' where nrequisicao = ' + vQrTemp.FieldByName('nped').AsString +
            ' and tpdocs = ' + QuotedStr(Trim(vQrTemp.FieldByName('tipo').AsString)) +
            ' and cod_empresa = ' + FCodEmpresa +
            ' and num_nota is null';
          vQrExec.Prepare;
          vQrExec.ExecSQL;
        end;
        vQrTemp.Next;
      end;
      vQrTemp.Close;
      vQrTemp2.Close;
    except
    end;
  finally
    vQrTemp.Free;
    vQrTemp := nil;
    vQrTemp2.Free;
    vQrTemp2 := nil;
    vQrExec.Free;
    vQrExec := nil;
  end;
end;

procedure TSpedFiscal.verificarConfiguracoes;
var
  vVersaoConfigBanco: Integer;
  vVersaoConfigSped: Integer; // versao da configuracao
  conf: TConfig_sistema_class;
begin
  try

    if not conectarBanco then
      Exit;

    vVersaoConfigSped := 1;
    vVersaoConfigBanco := getConfSisInt('efd_icms_versao_config', vQrAux);

    if vVersaoConfigBanco < 1 then
    begin
      setConfSisInt('efd_icms_versao_config', 0, vQrAux,
        'EFD ICMS IPI - Versao da configuração do sistema', nil);
      setConfSisBool('efd_icms_desconsiderar_insc_st_apuracao', True, vQrAux,
        'EFD ICMS IPI - Desconsiderar inscricao de substituto na apuracao do ST do SPED Fiscal',
        'Habilitar ao gerar o arquivo do Sped Fiscal o sistema desconsiderar a inscrição' + #13 +
        'de substituto tributário no estado de destino para dados de ST das notas fiscais');
      setConfSisBlob('efd_icms_e220_cod_ajuste_st_recolhida', vQrAux,
        'EFD ICMS IPI - E220 - Codigo de Ajuste da ST recolhida na apuracao por UF',
        'O codigo possui uma regra que deve ser obedecida para evitar erros de validacao no PVA' + #13 +
        'Regra: O codigo deve iniciar em "14" e logo em seguida outros 4 numeros' + #13 +
        '|Sigla da UF|Codigo de ajuste Tabela 5.1.1 sem a sigla da UF|Descricao complementar|' + #13 +
        '|SP|141499||');
    end;
    
    if vVersaoConfigBanco < 2 then
    begin
      vVersaoConfigSped := 2;
      setConfSisBlob('efd_icms_1600_conf_cartao', vQrAux,
        'EFD ICMS IPI - 1600 - Configurações para obter valores de vendas cartão',
        '[Cartao1600]' + #13 +
        '# Ativa o vinculo com as trasacoes do POS Virtual' + #13 +
        'VincularCadastroAdm=N' + #13 +
        '# Usar o prazo (data_venc - data_mov) para indicar se Credito ou Debito' + #13 +
        'AjustarOperacaoDebitoCreditoPeloVencimento=N' + #13 +
        '# Qtde de dias para considerar o registro como Debito' + #13 +
        'QtdeMaximaDiasPrazoParaConsiderarDebito=5');
    end;

    if vVersaoConfigBanco < 3 then
    begin
      vVersaoConfigSped := 3;
      setConfSisBool('efd_icms_e200_apurar_st_antcipacao', True, vQrAux,
        'EFD ICMS IPI - E200 - Montar o registro E200 com os valores da ST Antecipação', '');
      setConfSisBool('efd_icms_valor_st_ipi_em_vlmerc', True, vQrAux,
        'EFD ICMS IPI - Apurar o valor da ST e IPI nos campos correspondentes ao valor da mercadoria(Conforme Manual)', '');
    end;

    if vVersaoConfigBanco < 4 then
    begin
      vVersaoConfigSped := 4;
      setConfSisBool('efd_icms_d100_campo_vl_nt_zerado', False, vQrAux,
        'EFD ICMS IPI - D100 - Zerar campo Valor não-tributado(VL_NT)', '');
    end;

    if vVersaoConfigBanco < 5 then
    begin
      vVersaoConfigSped := 5;
      setConfSisBlob('efd_icms_k', vQrAux, 'EFD ICMS IPI - Bloco K',
                     '[Conf]' + sLineBreak +
                     'Ativo=N' + sLineBreak +
                     'Producao=N' + sLineBreak +
                     'Estoque=N' + sLineBreak +
                     'Dados_0210=N' + sLineBreak +
                     '# Sobre o registro 0210(indice tecnico)' + sLineBreak +
                     '# A critério de cada UF a apresentação deste registro deve ser assim' + sLineBreak +
                     '# N: Não, T: Todos sempre, Q: Quando existir producao em K230 e K250');
    end;

    if vVersaoConfigBanco < 6 then
    begin
      vVersaoConfigSped := 6;
      setConfSisBlob('efd_icms_data_emiss', vQrAux, 'EFD ICMS IPI - Configuração de data Registros C100, C500 e D500',
                     '[Conf]' + sLineBreak +
                     'DataEmissaoIgualDataEntrada=N');
    end;

    if vVersaoConfigBanco < 7 then
    begin
      try
        conf := TConfig_sistema_class.getConf('efd_icms_data_emiss', vQrAux, StrToInt(CodEmpresa));
        conf.AtivarMapeamentoKeys;
        conf.ReadString('Conf', 'DataEmissaoIgualDataEntrada', 'N');

        if conf.KesyChanges then
          conf.SaveConfDB(vQrAux);
      finally
        conf.Free;
      end;
      vVersaoConfigSped := 7;
    end;

    if vVersaoConfigBanco < 8 then
    begin
      conf := TConfig_sistema_class.getConf('efd_icms_escrituracao', vQrAux, StrToInt(CodEmpresa));
      try

        if conf.chave.IsEmpty then
        begin
          conf.Free;
          conf := TConfig_sistema_class.Create('efd_icms_escrituracao', 'EFD ICMS IPI - Configuração unificada para escrituração dos Impostos',
                                               ';efd;icms;ipi;sped;fiscal;', typeBool, StrToInt(FCodEmpresa))
          .ConfString('ICMSST', 'EmissaoPropria', '1')
          .ConfString('ICMSST', 'EmissaoTerceiros', '')
          .ConfString('ICMSST', 'AntecipacaoST', 'S')
          .ConfString('IPI', 'EmissaoPropria', '')
          .ConfString('IPI', 'EmissaoTerceiros', '')
          .ConfString('ICMSSN', 'FormaAjuste', 'N')
          .ConfString('ICMSSN', 'CodigoAjuste', 'MG10990505')
          .Comment('ICMSST', ['Essa configuração quando ativada, inativa todas as anteriores relativas a escrituração dos Impostos',
                              'Valores válidos para configurações "EmissaoPropria" e "EmissaoTerceiros", valor padrão = 3 caso diferente de 1 e 2',
                              '1 = Campos proprios',
                              '2 = Campos outras despesas',
                              '3 = Campo valor da mercadoria conforme manual',
                              'Valores válidos para o campo AntecipacaoST: S ou N para o registro E210'])
          .Comment('ICMSSN', ['Confiurações relacionadas a entrada de notas fiscais de fornecedores do simples nacional',
                              'Valores válidos para configuração FormaAjuste',
                              'A  = Automático - Nesse caso o sistema usa os valores originais do xml para criar os registros de ajustes C195 e C197',
                              'S  = Sistema - Nesse caso ao confirmar a nota via sistema ele registra nas tabelas próprias os valores, ficando assim disponível para alteração',
                              'AS = Automático e Sistema - Ambas as alternativas acima',
                              'N  = Nenhuma - Nesse caso não há nenhum registro pelo sistema, porém não há nenhum impedimento de registro manual',
                              'CodigoAjuste=MG10990505 - O valor desse registro deve existir na tabela de lançamento fiscal, caso contrário o PVA vai acusar erro']);
        end;
        conf.ConfString('ICMSST', 'CodigoObrigacaoArecolher_E250_MG', '001')
          .ConfString('ICMSST', 'CodigoReceita_E250_MG', '3137')
          .Comment('ICMSST', ['Para as configurações CodigoObrigacaoArecolher_E250_XX e CodigoReceita_E250_XX trocar o XX pela UF correspondente',
                                'CodigoObrigacaoArecolher_E250_XX = código da obrigação conforme exigencia do PVA',
                                'CodigoReceita_E250_XX = Código da receita da GNRE(geralmente é 100099)'], True);
        if conf.KesyChanges then
          conf.SaveConfDB(vQrAux);
      finally
        conf.Free;
      end;
      vVersaoConfigSped := 8;
    end;

    if vVersaoConfigBanco < 9 then
    begin
      conf := TConfig_sistema_class.getConf('efd_icms_escrituracao', vQrAux, StrToInt(CodEmpresa));
      try
        conf.ConfString('Inventario',  'RegistroH020_MultiplicarPelaQtde', 'S')
            .Comment(   'Inventario', ['RegistroH020_MultiplicarPelaQtdePara: S ou N, no Manual do PVA a informação diz que os campos',
                                       '  BC_ICMS e VL_ICMS é unitário, essa configuração serve para desconsiderar isso e fazer a multiplicação',
                                       '  pela quantidade do inventário'], True);
        if conf.KesyChanges then
          conf.SaveConfDB(vQrAux);
      finally
        conf.Free;
      end;
      vVersaoConfigSped := 9;
    end;

    if vVersaoConfigBanco < 10 then
    begin
      conf := TConfig_sistema_class.getConf('efd_icms_registro0221', vQrAux, StrToInt(CodEmpresa));
      try
        if conf.chave .IsEmpty then
        begin
          conf := TConfig_sistema_class.Create('efd_icms_registro0221',
                                               'EFD ICMS IPI - Obrigatoriedade para o registro 0221( Lista UFs)', ';efd;0221;',  typeBlob, StrToInt(CodEmpresa));
          conf.WriteString('Conf', 'ListaUFs', 'MG')
              .WriteString('Conf', 'RegistrarQuandoPresenteNoC190', 'N')
              .Comment('Conf', ['ListaUFs > Informe a lista de UFs dos estados separados por virgula. Ex: MG, SP',
                                'RegistrarQuandoPresenteNoC190 > O registro C190 não tem o código do produto diretamente, apenas cfop,cst e aliq icms.' +
                                ' Porém o sistema pode adicionar o registro 0200 e 0221 quando movimentados no período'], True);
          conf.value1_vc := 'MG';
          conf.SaveConfDB(vQrAux);
        end;

      finally
        conf.Free;
      end;
      vVersaoConfigSped := 10;
    end;

    if vVersaoConfigBanco < 12 then // comentarios ficaram ausentes
    begin
      conf := TConfig_sistema_class.getConf('efd_icms_escrituracao', vQrAux, StrToInt(CodEmpresa));
      var inic := TStringIni.Create();
      try
        if not conf.chave.IsEmpty then
        begin
          conf.AtivarMapeamentoKeys;
          if conf.ValueExists('ICMSST', 'EmissaoTerceiros') and not conf.ValueExists('ICMSST', 'EmissaoTerceiro') then
            conf.WriteString('ICMSST', 'EmissaoTerceiro', conf.ReadString('ICMSST', 'EmissaoTerceiro'));

          if conf.ValueExists('IPI', 'EmissaoTerceiros') and not conf.ValueExists('IPI', 'EmissaoTerceiro') then
            conf.WriteString('IPI', 'EmissaoTerceiro', conf.value1_b.ReadString('ICMSST', 'EmissaoTerceiro'));

          inic.Text := conf.value1_b.Text;

          conf.value1_b.Clear;

          conf.ConfString('ICMSST', 'EmissaoPropria', inic.ReadString('ICMSST', 'EmissaoPropria', '1'))
              .ConfString('ICMSST', 'EmissaoTerceiro', inic.ReadString('ICMSST', 'EmissaoTerceiro'))
              .ConfString('ICMSST', 'AntecipacaoST', inic.ReadString('ICMSST', 'AntecipacaoST', 'S'))
              .ConfString('ICMSST', 'CodigoObrigacaoArecolher_E250_MG', inic.ReadString('ICMSST', 'CodigoObrigacaoArecolher_E250_MG', '001'))
              .ConfString('ICMSST', 'CodigoReceita_E250_MG', inic.ReadString('ICMSST', 'CodigoReceita_E250_MG', '3137'))
              .ConfString('IPI', 'EmissaoPropria', inic.ReadString('IPI', 'EmissaoPropria'))
              .ConfString('IPI', 'EmissaoTerceiro', inic.ReadString('IPI', 'EmissaoTerceiro'))
              .ConfString('IPI', 'CFOPs_CamposProprios', inic.ReadString('IPI', 'CFOPs_CamposProprios'))
              .ConfString('ICMSSN', 'FormaAjuste', inic.ReadString('ICMSSN', 'FormaAjuste', 'N'))
              .ConfString('ICMSSN', 'CodigoAjuste', inic.ReadString('ICMSSN', 'CodigoAjuste', 'MG10990505'))
          .Comment('ICMSST', ['Essa configuração quando ativada, inativa todas as anteriores relativas a escrituração dos Impostos',
                              'Valores válidos para configurações "EmissaoPropria" e "EmissaoTerceiros", valor padrão = 3 caso diferente de 1 e 2',
                              '1 = Campos proprios',
                              '2 = Campos outras despesas',
                              '3 = Campo valor da mercadoria conforme manual',
                              'Valores válidos para o campo AntecipacaoST: S ou N para o registro E210',
                              'Para as configurações CodigoObrigacaoArecolher_E250_XX e CodigoReceita_E250_XX trocar o XX pela UF correspondente',
                              'CodigoObrigacaoArecolher_E250_XX = código da obrigação conforme exigencia do PVA',
                              'CodigoReceita_E250_XX = Código da receita da GNRE(geralmente é 100099)'])
          .Comment('ICMSSN', ['Confiurações relacionadas a entrada de notas fiscais de fornecedores do simples nacional',
                              'Valores válidos para configuração FormaAjuste',
                              'A  = Automático - Nesse caso o sistema usa os valores originais do xml para criar os registros de ajustes C195 e C197',
                              'S  = Sistema - Nesse caso ao confirmar a nota via sistema ele registra nas tabelas próprias os valores, ficando assim disponível para alteração',
                              'AS = Automático e Sistema - Ambas as alternativas acima',
                              'N  = Nenhuma - Nesse caso não há nenhum registro pelo sistema, porém não há nenhum impedimento de registro manual',
                              'CodigoAjuste=MG10990505 - O valor desse registro deve existir na tabela de lançamento fiscal, caso contrário o PVA vai acusar erro'], True)
          .SaveConfDB(vQrAux);
        end;
      finally
        conf.Free;
        inic.Free;
      end;
      vVersaoConfigSped := 12;
    end;

    if vVersaoConfigSped > vVersaoConfigBanco then // versao do programa maior que a versao salva no banco
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'update config_sistema set value1_f = :value1_f' +
        ' where chave = ''efd_icms_versao_config'' and cod_empresa = ' + FCodEmpresa;
      vQrAux.ParamByName('value1_f').AsFloat := vVersaoConfigSped;
      vQrAux.ExecSQL;
      if vQrAux.Transaction.InTransaction then
        vQrAux.Transaction.Commit;
    end;

    RestComplST.Conf := TICMS_ST_rest_compl_Conf.Create(RestComplST, StrToInt(FCodEmpresa));
    RestComplST.Conf.executar_leitura;

    vQrAux.Close;

    VerificarConfs;

  except
    on e: exception do
    begin
      Application.MessageBox(pchar('Erro ao abrir configuracoes (config_sistema). Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

procedure TSpedFiscal.VerificarConfs;
var
  conf: TConfig_sistema_class;
begin
  conf := TConfig_sistema_class.getConf('efd_icms_escrituracao', vQrAux, StrToInt(CodEmpresa));
  try
    SqlExec('update config_sistema set display_ = ''%s'' where cod_empresa = %s and chave = ''efd_icms_data_emiss'' and display_ <> ''%s'' ',
            ['EFD ICMS IPI - Configuração de data Registros C100, C500 e D500', CodEmpresa,
             'EFD ICMS IPI - Configuração de data Registros C100, C500 e D500'], vQrAux);
    SqlExec('update config_sistema set ativo = %d' +
            ' where cod_empresa = %s and ativo = %d and chave in (%s)',
            [IfThen(conf.AsBoolean, 0, 1),
             CodEmpresa,
             conf.AsInteger,
             '''efd_icms_e220_cod_ajuste_st_recolhida'', ' +
             '''efd_icms_desconsiderar_insc_st_apuracao'', ' +
             '''efd_icms_e200_apurar_st_antcipacao'', ' +
             '''efd_icms_valor_st_ipi_em_vlmerc'' '], vQrAux).Transaction.Commit;
  finally
    conf.Free;
  end;
end;

{ TRestComplST }

function TRestComplST.CalcularExecutar(perfil: string): Boolean;
var
  prod: TArqContProd;
  est: TEstoquePeriodo;
  confEAN: tconfig_sistema_class;
  codigos_nf, cods_env: array of Integer;
  I: Integer;
  erros: WideString;
  sql: string;
  contador: Integer;
  periodos: TArray<TDateTime>;
begin

  C180.Clear;
  RegSaida.Clear;
  H030.Clear;
  ProdCont.Clear;

  if not FGerar then
    Exit(True);


  Auditor.Tabela := 'EFD_ICMSST_CR_APURACAO';
  if not Auditor.Processo('EFD017').Permitido then
    Exit;

  try

    //ler configurações
    if Assigned(Conf) then
      Conf.Free;

    FDataIni := StrToDate(FOwner.DataIni);
    FDataFim := StrToDate(FOwner.DataFim);
    FDataInv := DateOf(EndOfTheMonth(IncMonth(FDataIni, -1)));

    if  SqlOpen('select count(*) cont from inv_tipo74 where data_inv = %s and cod_empresa = %s',
                [date_fb(FDataInv), FOwner.CodEmpresa]).FieldByName('cont').AsInteger = 0 then
      raise Exception.Create('Sem registro de inventário para o último dia do mês anterior da apuração');

    Conf := TICMS_ST_rest_compl_Conf.Create(Self, StrToInt(FOwner.CodEmpresa));

    Conf.executar_leitura;

    {$REGION 'verificando notas sem dados do xml'}
    if (not UsarJaGravado) or
       (SqlOpen('select count(*) cont from efd_icmsst_cr_e_s where data >= %s and data <= %s and cod_empresa = %s',
                [date_fb(FDataIni), date_fb(FDataFim), FOwner.CodEmpresa]).FieldByName('cont').AsInteger = 0) then
    begin
      FOwner.FLabelCupons.Caption := 'Obtendo dados de XML das notas do período e do Estoque';
      Application.ProcessMessages;
      SetLength(codigos_nf, 0);
      SqlOpen('select distinct cod_nf from (' +
              ' select distinct nfi.cod_nf from notafiscal nf' +
              ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
              ' where nf.%s >= %s and nf.%s <= %s and nf.cod_empresa = %s' +
              ' and nf.natureza_nf = ''E'' and nf.emissao_propria = ''N''' +
              ' and nf.import_xml is null and nfi.import_xml = ''S''' +
              ' union  select cod_nf from ( select cod_nf from sp_nf_pend_importxml( %s, %s, %d))' +
              ' ) as c order by cod_nf',
              [IfThen(Conf.UsarDataEmissao, 'data_contabil', 'data_lanc'), date_fb(FDataIni),
               IfThen(Conf.UsarDataEmissao, 'data_contabil', 'data_lanc'), date_fb(FDataFim), FOwner.CodEmpresa,
               date_fb(FDataInv), FOwner.CodEmpresa, IfThen(Conf.UsarDataEmissao, 1, 0)]).FetchAll;

      FOwner.FLabelCupons.Caption := 'Obtendo dados de XML das notas do período e do Estoque...';
      Application.ProcessMessages;

      SetLength(cods_env, 0);
      QrAux.First;
      while not QrAux.Eof do
      begin
        cods_env := cods_env + [QrAux.FieldByName('cod_nf').AsInteger];
        QrAux.Next;
      end;
      QrAux.Close;

      for I := Low(cods_env) to High(cods_env) do
      begin

        codigos_nf := codigos_nf + [cods_env[I]];

        if Length(codigos_nf) mod 100 = 0 then
        begin
          contador := nfe_atualizar_valores_xml(codigos_nf, StrToInt(FOwner.CodEmpresa), WideString(FOwner.EnderecoBanco), erros);
          SetLength(codigos_nf, 0);

          FOwner.FLabelCupons.Caption := 'Obtendo dados de XML das notas do período e do Estoque...' + IntToStr(Trunc((I + 1) / Length(cods_env) * 100)) + '%' ;
          Application.ProcessMessages;
        end;
      end;

      FOwner.FLabelCupons.Caption := 'Obtendo dados de XML das notas do período e do Estoque...100%';
      Application.ProcessMessages;
      if Length(codigos_nf) > 0 then
        contador := nfe_atualizar_valores_xml(codigos_nf, StrToInt(FOwner.CodEmpresa), WideString(FOwner.EnderecoBanco), erros);
    end;
    {$ENDREGION}

    if not conf.UsarCFOPPisCofin then
      SqlOpen('insert into EFD_ICMSST_CR_CFOPS (CFOP)' +
              ' select codigo_nop from nat_op where codigo_nop in (%s)', [Conf.CFOPs]);

    if not conf.CFOPsTransf.Trim.IsEmpty then
      SqlOpen('insert into EFD_ICMSST_CR_CFOPS (CFOP)' +
              ' select codigo_nop from nat_op where codigo_nop in (%s)', [Conf.CFOPsTransf]);

    if not UsarJaGravado then
      FOwner.FLabelCupons.Caption := 'Gerando valores de apuração'
    else
      FOwner.FLabelCupons.Caption := 'Obtendo valores de apuração';
    Application.ProcessMessages;

    periodos := [];

    Client.ClientOpen('select distinct * from SP_EFD_ICMSST_DEV_PERIODO(%s, %s, %s, %d)',
                     [date_fb(FDataIni), date_fb(FDataFim), FOwner.CodEmpresa, IfThen(Conf.UsarDataEmissao, 1 , 0)]);
    while not Client.Eof do
    begin
      if not ((MonthOf(FDataIni) = Client.fint('mes')) and (YearOf(FDataIni) = Client.fint('ano'))) then
        periodos := periodos + [EncodeDate(Client.fint('ano'), Client.fint('mes'), 1)];
      Client.Next;
    end;

    // Gerar periodo das referencias das devoluções
    for I := Low(periodos) to High(periodos)  do
      if not SqlOpen('select * from sp_efd_icmsst_cr_est(%s, %s, %s, %s, %d, %d, %d)',
                     [date_fb(DateOf(EndOfTheMonth(IncMonth(periodos[I], -1)))),
                      date_fb(periodos[I]),
                      date_fb(EndOfTheMonth(periodos[I])), FOwner.CodEmpresa,
                      IfThen(Conf.UsarDataEmissao, 1 , 0),
                      IfThen(UsarJaGravado, 0 , 1),
                      IfThen(Conf.UsarCFOPPisCofin, 1 , 0)])
                     .FieldByName('result').AsString.Trim.Equals('1') then
        raise Exception.Create('Banco não conseguiu gerar dados');

    Result := SqlOpen('select * from sp_efd_icmsst_cr_est(%s, %s, %s, %s, %d, %d, %d)',
                      [date_fb(FDataInv), date_fb(FDataIni), date_fb(FDataFim), FOwner.CodEmpresa,
                       IfThen(Conf.UsarDataEmissao, 1 , 0),
                       IfThen(UsarJaGravado, 0 , 1),
                       IfThen(Conf.UsarCFOPPisCofin, 1 , 0)])
                      .FieldByName('result').AsString.Trim.Equals('1');
    if not Result then
      raise Exception.Create('Banco não conseguiu gerar dados');

    SqlOpen('select * from sp_efd_icmsst_dev_make(%s, %s, %s)',
            [date_fb(FDataIni), date_fb(FDataFim), FOwner.CodEmpresa]);

    FOwner.FLabelCupons.Caption := 'Obtendo valores de apuração';
    Application.ProcessMessages;

    Client.ClientOpen('select es.tpdoc, es.e_s, es.data, es.grupo_prod, trim(es.cod_prod) cod_prod, es.orig, es.cst, es.csosn,' +
                      ' es.ant_st, es.codigo_nop, es.unidade, es.nf_ucom, es.est_bcst, es.est_icm, es.est_st,' +
                      ' es.est_fcpst, es.consumidor_final, es.iddest, es.indiedest, pr.perc_red_prod, pr.descr_prod, pr.nbm,' +
                      ' iif(es.tpdoc in (''NFD''), %s, '' '') chave,' +
                      ' iif(es.tpdoc in (''NF'', ''NFC''), es.cod_doc, %s) cod_doc,' +
                      ' iif(es.tpdoc in (''NF'', ''NFC''), es.num_nf , %s) num_nf,' +
                      ' iif(es.tpdoc in (''NF'', ''NFC''), es.nitem, 0) nitem,' +
                      ' iif(ncm.aliq_intra > 0, ncm.aliq_intra, %s) aliq_icm,' +
                      ' iif(ncm.fcp_aliq   > 0, ncm.fcp_aliq, %s) aliq_fcp,' +
                      ' extract(day from es.data) dia,' +
                      ' extract(month from es.data) mes,' +
                      ' extract(year from es.data) ano,' +
                      ' iif(es.tpdoc = ''NF'', 1, 2) ordem,' +
                      ' sum(es.quantidade) quantidade,  sum(es.total_liq) total_liq, sum(es.total_bcicm) total_bcicm,' +
                      ' sum(es.total_icm) total_icm, sum(es.total_bcst) total_bcst, sum(es.total_st) total_st,' +
                      ' sum(es.total_fcpst) total_fcpst, sum(es.total_fcpstret) total_fcpstret, sum(es.nf_qcom) nf_qcom,' +
                      ' sum(es.nf_bcicm) nf_bcicm, sum(es.nf_icm) nf_icm, sum(es.nf_bcst) nf_bcst, sum(es.nf_st) nf_st,' +
                      ' sum(es.nf_fcpst) nf_fcpst, sum(es.nf_fcpstret) nf_fcpstret, sum(es.nf_bcstret) nf_bcstret,' +
                      ' sum(es.nf_stret) nf_stret' +
                      ' from efd_icmsst_cr_e_s es' +
                      ' inner join produtos pr on pr.grupo_prod = es.grupo_prod and pr.cod_prod = es.cod_prod and pr.cod_empresa = es.cod_empresa' +
                      ' left join nbm ncm on ncm.cod_ncm = pr.nbm' +
                      ' where es.data >= %s and es.data <= %s and es.cod_empresa = %s' +
                      ' group by es.tpdoc, es.e_s, es.data, es.grupo_prod, es.cod_prod, es.orig, es.cst, es.csosn, es.ant_st, es.codigo_nop,' +
                      '   es.unidade, es.nf_ucom, es.est_bcst, es.est_icm, es.est_st, es.est_fcpst, es.consumidor_final, es.iddest,' +
                      '   es.indiedest, pr.perc_red_prod, pr.descr_prod, pr.nbm, chave, cod_doc, num_nf, nitem,' +
                      '   aliq_icm, aliq_fcp, dia, mes, ano, ordem' +
                      ' order by es.e_s, es.data, ordem, es.tpdoc, num_nf, cod_doc, nitem',
                      [IfThen(perfil.Equals('B'), 'es.chave', QuotedStr(' ')),
                       IfThen(perfil.Equals('B'), 'es.cod_doc', '0'),
                       IfThen(perfil.Equals('B'), 'es.num_nf', '0'),
                       float_fb(Conf.aliq_icm), float_fb(Conf.aliq_fcp),
                       date_fb(FDataIni), date_fb(FDataFim), FOwner.CodEmpresa]);

    RefDev.ClientOpen('select esd.tpdoc tpdoc_dev, esd.cod_doc cod_doc_dev, esd.e_s es_dev, esd.nitem nitem_dev,' +
                      ' iif(es.tpdoc = ''NF'', nf.modelo_nf, iif(es.tpdoc = ''NFC'', ''65'', iif(es.tpdoc = ''NFD'', ''02'', ''2D''))) modelo, ' +
                      ' iif(es.tpdoc = ''NF'', nf.serie, '' '') serie, ' +
                      ' es.tpdoc, es.e_s, es.data, es.grupo_prod, trim(es.cod_prod) cod_prod, es.orig, es.cst, es.csosn,' +
                      ' es.ant_st, es.codigo_nop, es.unidade, es.nf_ucom, es.est_bcst, es.est_icm, es.est_st,' +
                      ' es.est_fcpst, es.consumidor_final, es.iddest, es.indiedest, pr.perc_red_prod, pr.descr_prod, pr.nbm,' +
                      ' es.chave, es.cod_doc, es.num_nf, es.nitem,' +
                      ' iif(ncm.aliq_intra > 0, ncm.aliq_intra, %s) aliq_icm,' +
                      ' iif(ncm.fcp_aliq   > 0, ncm.fcp_aliq, %s) aliq_fcp,' +
                      ' extract(day from es.data) dia,' +
                      ' extract(month from es.data) mes,' +
                      ' extract(year from es.data) ano,' +
                      ' iif(es.tpdoc = ''NF'', 1, 2) ordem,' +
                      ' (es.quantidade) quantidade,  (es.total_liq) total_liq, (es.total_bcicm) total_bcicm,' +
                      ' (es.total_icm) total_icm, (es.total_bcst) total_bcst, (es.total_st) total_st,' +
                      ' (es.total_fcpst) total_fcpst, (es.total_fcpstret) total_fcpstret, (es.nf_qcom) nf_qcom,' +
                      ' (es.nf_bcicm) nf_bcicm, (es.nf_icm) nf_icm, (es.nf_bcst) nf_bcst, (es.nf_st) nf_st,' +
                      ' (es.nf_fcpst) nf_fcpst, (es.nf_fcpstret) nf_fcpstret, (es.nf_bcstret) nf_bcstret,' +
                      ' (es.nf_stret) nf_stret' +
                      ' from efd_icmsst_cr_e_s esd' +
                      ' inner join nat_op np on np.codigo_nop = esd.codigo_nop and np.devolucao = ''S'' ' +
                      ' inner join efd_icmsst_cr_e_s_dev esl on esl.cod_nf = esd.cod_doc and esl.cod_empresa = esd.cod_empresa and esl.nitem = esd.nitem' +
                      ' inner join efd_icmsst_cr_e_s es on es.tpdoc = esl.tipo_ref and es.cod_doc = esl.cod_ref and es.cod_empresa = esd.cod_empresa and es.nitem = esl.nitem_ref' +
                      ' inner join produtos pr on pr.grupo_prod = es.grupo_prod and pr.cod_prod = es.cod_prod and pr.cod_empresa = es.cod_empresa' +
                      ' left join nbm ncm on ncm.cod_ncm = pr.nbm' +
                      ' left join notafiscal nf on nf.cod_nf = es.cod_doc and nf.cod_empresa = es.cod_empresa and es.tpdoc = ''NF'' ' +
                      ' left join nfce nfc on nfc.cod_nfce = es.cod_doc and nfc.cod_empresa = es.cod_empresa and es.tpdoc = ''NFC'' ' +
                      ' where esd.data >= %s and esd.data <= %s and esd.cod_empresa = %s' +
                      ' order by es.e_s, es.data, ordem, es.tpdoc, num_nf, cod_doc, nitem',
                      [float_fb(Conf.aliq_icm), float_fb(Conf.aliq_fcp),
                       date_fb(FDataIni), date_fb(FDataFim), FOwner.CodEmpresa]);

    confEAN := TCfg_sis.getConf('prod_ean_prefixos_invalidos', QrAux, StrToIntDef(FOwner.CodEmpresa, 0));
    ConfEANInv.Text := confEAN.value1_b.Text;

           //Estoque do periodo
    sql := 'select * from (' +
           Format(' select est.ano, est.mes, est.grupo_prod, est.cod_prod, est.data, est.vl_icms_op, est.vl_bc_icms_st, est.vl_icms_st, est.vl_fcp,' +
                  ' (select first 1 case when s2.valido = 1 then cb.cod_barra else null end from cod_barra cb' +
                  '    left join sp_ean_valido(cb.cod_barra) s2 on 1 = 1' +
                  '    where cb.grupo_prod = pr.grupo_prod and cb.cod_prod = pr.cod_prod and cb.cod_empresa = pr.cod_empresa and cb.ativo = 1' +
                  '    and coalesce(cb.padrao_gtin, '''') in (''GTIN-13'')' +
                  '   ) ean,' +
                  '   (select first 1 case when s2.valido = 1 then cb.cod_barra else null end from cod_barra cb' +
                  '    left join sp_ean_valido(cb.cod_barra) s2 on 1 = 1' +
                  '    where cb.grupo_prod = pr.grupo_prod and cb.cod_prod = pr.cod_prod and cb.cod_empresa = pr.cod_empresa and cb.ativo = 1' +
                  '    and char_length(trim(cb.cod_barra)) in (13) and substring(cb.cod_barra from 1 for 3) in (''789'', ''790'')' +
                  '    and coalesce(cb.padrao_gtin, '''') = '''' ' +
                  '   ) ean_sis,' +
                  ' extract(year from est.data) || (select  result from strzero(extract(month from est.data), 2)) || (select result from strzero(extract(day from est.data), 2)) dia,' +
                  ' i.quantidade QTD, i.valor_prod VL_ITEM, i.codigo_posse IND_PROP, i.cod_cliente COD_PART, '''' TXT_COMPL, i.quantidade qtde_dispo,' +
                  ' pr.cod_cta_estoque COD_CTA, pr.nbm, pr.unidade, pr.descr_prod ' +
                  ' from efd_icmsst_cr_est est' +
                  ' left join VW_INV_TIPO74 i on i.grupo_prod = est.grupo_prod and i.cod_prod = est.cod_prod' +
                  '   and i.cod_empresa = est.cod_empresa and i.data_inv = est.data' +
                  ' inner join produtos pr on pr.grupo_prod = est.grupo_prod and pr.cod_prod = est.cod_prod' +
                  '   and pr.cod_empresa = est.cod_empresa' +
                  ' where est.ano = %d and est.mes = %d and est.data >= %s and est.data <= %s and est.cod_empresa = %s',
                  [YearOf(FDataIni), MonthOf(FDataIni), date_fb(FDataInv), date_fb(FDataFim), FOwner.CodEmpresa]) +
           ' union ' +
           //Registros sem estoque no mes anterior e q foram movimentados nos arquivos do período
           Format(' select distinct %d ano, %d mes, pr.grupo_prod, pr.cod_prod, c.data, 0 vl_icms_op, 0 vl_bc_icms_st, 0 vl_icms_st, 0 vl_fcp,' +
                  ' null ean, null ean_sis,' +
                  ' extract(year from c.data) || (select result from strzero(extract(month from c.data), 2)) || (select result from strzero(extract(day from c.data), 2)) dia,' +
                  ' 0 QTD, 0 VL_ITEM, 0 IND_PROP, null COD_PART, null TXT_COMPL, 0 qtde_dispo, pr.cod_cta_estoque COD_CTA, pr.nbm, pr.unidade, pr.descr_prod' +
                  ' from (' +
                  '   select distinct es.grupo_prod, es.cod_prod, es.cod_empresa, cast(%s as timestamp) data from efd_icmsst_cr_e_s es' +
                  '     left join vw_inv_tipo74 inv on inv.grupo_prod = es.grupo_prod and inv.cod_prod = es.cod_prod and inv.cod_empresa = es.cod_empresa' +
                  '       and inv.data_inv = %s' +
                  '   where es.data >= %s and es.data <= %s and es.cod_empresa = %s and inv.cod_prod is null' +
                  ' ) as c' +
                  ' inner join produtos pr on pr.grupo_prod = c.grupo_prod and pr.cod_prod = c.cod_prod and pr.cod_empresa = c.cod_empresa',
                  [YearOf(FDataIni), MonthOf(FDataIni), date_fb(FDataInv), date_fb(FDataInv),
                   date_fb(FDataIni), date_fb(FDataFim), FOwner.CodEmpresa]) +
           ') as cs order by cs.data desc, cs.grupo_prod, cs.cod_prod ';

    {FEstoque.ClientOpen(sql, [YearOf(FDataIni), MonthOf(FDataIni), date_fb(FDataIni), date_fb(FDataFim), FOwner.CodEmpresa]);

    FEstoque.prepare_loop();
    while not FEstoque.Eof do
    begin
      est := EstPeriodo.NewInstance;

      est.Grupo_prod := FEstoque.fint('grupo_prod');
      est.Cod_prod := FEstoque.fstr('cod_prod');
      est.Data := FEstoque.fdate('data');
      est.Quantidade := FEstoque.fdate('qtd');

      FEstoque.Next;
    end;
    FEstoque.prepare_loop_done;}

    FEstoque.ClientOpen(sql, [YearOf(FDataIni), MonthOf(FDataIni), date_fb(FDataInv), date_fb(FDataFim), FOwner.CodEmpresa]);

    FEstoque.prepare_loop_fmt('dia = %s', [FormatDateTime('YYYYMMDD', FDataInv).QuotedString]);
    try
      while not FEstoque.Eof do
      begin
        prod := ProdCont.New;

        prod.Grupo_prod := FEstoque.fint('grupo_prod');
        prod.Cod_prod := FEstoque.fstr('cod_prod');
        prod.DS_PRODMERC := FEstoque.fstr('descr_prod').Replace('|', '');
        prod.CD_NCM := FEstoque.fstr('nbm');
        prod.TP_UNIDADE := FEstoque.fstr('unidade');
        prod.CD_EAN13 := FEstoque.fstr('ean');
        if prod.CD_EAN13.Trim.IsEmpty then
          if not FEstoque.fempty('ean_sis') then
            if ConfEANInv.IndexOf(FEstoque.fcopy('ean_sis', 3)) = -1 then
              prod.CD_EAN13 := FEstoque.fstr('ean_sis');

        {est := EstPeriodo.NewInstance;

        est.Grupo_Prod := prod.Grupo_prod;
        est.Cod_Prod := prod.Cod_prod;
        est.Data := FEstoque.fdate('data');
        est.Quantidade := FEstoque.fdate('qtd');    }

        FEstoque.Next;
      end;
    finally
      FEstoque.prepare_loop_done;
    end;

    confEAN.Free;

 except on E: Exception do
   begin
     Result := False;

     C180.Clear;
     RegSaida.Clear;
     H030.Clear;
     ProdCont.Clear;

     FGerar := False;

     registraErro('TRestComplST.CalcularExecutar ' + E.Message);
     ShowErro('Erro ao obter dados para cálculo de Restituição/Complemento da ST' + sLineBreak + E.Message);
   end;
 end;
end;

constructor TRestComplST.Create(AOwner: TSpedFiscal);
begin
  FOwner := AOwner;
  inherited Create(FOwner.Banco);
  RefDev := Self.NewClientOOP(Self.Client.Transaction);
  RefDev.DataSet.PacketRecords := 100;
  FEstoque := Self.NewClientOOP();// TConexao_OOP.Create(Self);
  FEstoque.DataSet.PacketRecords := 100;
  Client.DataSet.PacketRecords := 100;
  ConfEANInv := TStringList.Create;
  ArqEntrada := TStringList.Create;
  ArqSaidas := TStringList.Create;
  C180 := TObjectList<TC180>.Create();
  C181 := TObjectList<TC181>.Create();
  C186 := TObjectList<TC186>.Create();
  RegSaida := TObjectList<TRestCompSaida>.Create();
  H030 := TObjectList<TH030>.Create();
  ProdCont := TArqContProdList.Create();
  EstPeriodo := TObjectList<TEstoquePeriodo>.Create();
  Auditor := TAudit_OOP.Create(vDadosIniSPED.vNomeUsuario, StrToInt(vDadosIniSPED.vCodEmpresa), Banco);
end;

function TRestComplST.CriarArquivosCSV: TStrings;
var
  filename: string;
  I: Integer;
begin
  Result := TStringList.Create;

  if not FGerar then Exit;

  FOwner.FLabelStatus.Caption := 'Montando arquivos auxiliares de Restituição/Complemento de ICMS ST';;
  FOwner.FLabelCupons.Caption := 'Arquivo de Entradas';
  Application.ProcessMessages;

  filename := ExtractFilePath(FOwner.Destino) + 'EFDRESTCOMPL' +
              FormatDateTime('MMYYYY', StrToDate(FOwner.DataIni));

  ArqEntrada.Insert(0, 'Grupo-Codigo;Produto;NCM;E/S;Doc;Numero;Data;RespRetncao;CST;CSOSN;CFOP;Ant;Unidade;Quantidade;Total Liq;Total ICMS;Base ST;Total ST;Total FCPST');

  ArqEntrada.SaveToFile(filename + '_ENT.csv');
  ArqEntrada.Clear;

  FOwner.FLabelCupons.Caption := 'Arquivo de Saídas';
  Application.ProcessMessages;

  ArqSaidas.Insert(0, 'Grupo-Codigo;Produto;NCM;Doc;Numero;Data;CodMotivoRestCompl;CST;CSOSN;CFOP;Unidade;Quantidade;Total Liq;PercRedICMS;' +
                      'AliqICMS;AliqFCP;ValorIcms;VlUnitIcmsCampo11;VlUnitIcmsEst;VlUnitIcmsStEst;VlUnitFcpEst;' +
                      'VlUnitST_Rest;VlUnitFCPST_Rest;VlUnitST_Compl;VlUnitFCPST_Compl;');

  ArqSaidas.SaveToFile(filename + '_SAI.csv');
  ArqSaidas.Clear;

  FOwner.FLabelCupons.Caption := 'Arquivo Contabil';
  Application.ProcessMessages;

  ArqEntrada.Add('CD_SPED|CD_NCM|CD_EAN13|DS_PRODMERC|TP_UNIDADE|QT_PROD_ST_COMP|VR_ICMS_ST_COMP|VR_FEM_ST_COMP|QT_PROD_ST_REST|VR_ICMS_ST_REST|VR_FEM_ST_REST|');
  for I := 0 to ProdCont.Count - 1 do with ProdCont.Items[I] do
    if (VR_ICMS_ST_COMP > 0) or (VR_FEM_ST_COMP > 0) or (QT_PROD_ST_REST > 0) or (VR_ICMS_ST_REST > 0) or (VR_FEM_ST_REST > 0) then
    begin
      ArqEntrada.Add(Format('%s|%s|%s|%s|%s|%0.6f|%0.6f|%0.6f|%0.6f|%0.6f|%0.6f|',
                            [CD_SPED, CD_NCM, CD_EAN13, DS_PRODMERC.Replace('|', ' ', [rfReplaceAll]), TP_UNIDADE, QT_PROD_ST_COMP,
                             VR_ICMS_ST_COMP, VR_FEM_ST_COMP, QT_PROD_ST_REST, VR_ICMS_ST_REST, VR_FEM_ST_REST]));
    end;
  ArqEntrada.SaveToFile(filename + '_CONT.txt');
  ArqEntrada.Clear;

  FOwner.FLabelCupons.Caption := 'Arquivo de Estoque do Inventário e do Período';
  Application.ProcessMessages;

  FEstoque.prepare_loop();
  try
    FOwner.FProgressBar.Position := 0;
    FOwner.FProgressBar.Max := FEstoque.DataSet.RecordCount;

    ArqEntrada.Add('Grupo-Codigo;Produto;NCM;Unidade;Data;Quantidade;VlUnitIcmsOP;VlUnitBCST;VlUnitST;VlUnitFCPST');
    while not FEstoque.Eof do
    begin
      FOwner.FProgressBar.Position := FOwner.FProgressBar.Position + 1;
      Application.ProcessMessages;

      ArqEntrada.Add(Format('%s;%s;%s;%s;%s;%0.6f;%0.6f;%0.6f;%0.6f;%0.6f',
                            [FEstoque.fstr('grupo_prod') + '-' + FEstoque.fstr('cod_prod'),
                             FEstoque.fstr('descr_prod').Replace(';', ',', [rfReplaceAll]).Replace('|', ''),
                             FEstoque.fstr('nbm'),
                             FEstoque.fstr('unidade').Replace(';', ',', [rfReplaceAll]),
                             FEstoque.fstrdate('data'),
                             FEstoque.ffloat('qtd'),
                             FEstoque.ffloat('vl_icms_op'),
                             FEstoque.ffloat('vl_bc_icms_st'),
                             FEstoque.ffloat('vl_icms_st'),
                             FEstoque.ffloat('vl_fcp')
                            ]));
      FEstoque.Next;
    end;
  finally
    FEstoque.prepare_loop_done();
    FOwner.FProgressBar.Position := 0;
  end;
  ArqEntrada.SaveToFile(filename + '_EST.csv');
  ArqEntrada.Clear;

  Result.Add(filename + '_CONT.txt');
  Result.Add(filename + '_ENT.csv');
  Result.Add(filename + '_SAI.csv');
  Result.Add(filename + '_EST.csv');

  FOwner.FLabelStatus.Caption := '';
  FOwner.FLabelCupons.Caption := '';
end;

destructor TRestComplST.Destroy;
begin
//  FEstoque.Free;
  ConfEANInv.Free;
  ArqEntrada.Free;
  ArqSaidas.Free;

  C180.Clear;
  C180.Free;

  C181.Clear;
  C181.Free;

  C186.Clear;
  C186.Free;

  RegSaida.Clear;
  RegSaida.Free;

  H030.Clear;
  H030.Free;

  ProdCont.Clear;
  ProdCont.Free;

  EstPeriodo.Clear;
  EstPeriodo.Free;

  inherited;
end;

function TRestComplST.ExistsC180C181(id, itemid: Integer): Boolean;
var
  rest_ftpres, rest_intra, rest_inter, compl_intra, compl_inter, sem_compl_rest: Boolean;
  valorun: Double;
begin
  Result := False;
  Client.filterStr('tpdoc = ''NF'' and e_s = ''E'' and cod_doc = %d and nitem = %d and' +
                   ' ((nf_bcst > 0) or (nf_bcstret > 0))', [id, itemid]).First;

  while not Client.Eof do
  begin
    Result := ((Client.finsideof('cst', Conf.CSTs_E) and (not Client.fempty('cst')) ) or
               (Client.finsideof('csosn', Conf.CSTs_E) and (not Client.fempty('csosn'))));
    if Result then
      Exit;
    Client.Next;
  end;

  RefDev.filterStr('tpdoc_dev = ''NF'' and es_dev = ''E'' and cod_doc_dev = %d and nitem_dev = %d',
                   [id, itemid]).First;

  while not RefDev.Eof do
  begin

    if (RefDev.finsideof('cst', Conf.CSTs_S) and (not RefDev.fempty('cst'))) or
       (RefDev.finsideof('csosn', Conf.CSTs_S) and (not RefDev.fempty('csosn'))) then
    begin

      valorun := RoundTo(RefDev.ffloat('total_liq') / RefDev.ffloat('quantidade'), -6);


      rest_ftpres := RefDev.fequals('indiedest', '2') and
                         (not Conf.FP_RestCodMotivo.Trim.IsEmpty) and
                         (not (RefDev.fequals('consumidor_final', 'S') and Conf.MicroEmpPeqPorte));

      rest_inter :=  (not rest_ftpres) and
                     (not Conf.AQ_RestCodMotivo.Trim.IsEmpty) and
                     RefDev.fequals('iddest', '2') and
                     RefDev.fequals('consumidor_final', 'S') and
                     RefDev.fdif('indiedest', '1') and
                     Conf.MicroEmpPeqPorte and
                     (valorun < RefDev.ffloat('est_bcst', -6));

      compl_inter := (not rest_ftpres) and (not rest_inter) and
                     (not Conf.AQ_CompCodMotivo.Trim.IsEmpty) and
                     RefDev.fequals('iddest', '2') and
                     RefDev.fequals('consumidor_final', 'S') and
                     RefDev.fdif('indiedest', '1') and
                     Conf.MicroEmpPeqPorte and
                     (valorun > RefDev.ffloat('est_bcst', -6));

      rest_intra := (not rest_ftpres) and (not rest_inter) and (not compl_inter) and
                     (not Conf.AQ_RestCodMotivo.Trim.IsEmpty) and
                     RefDev.fequals('iddest', '1') and
                     RefDev.fequals('consumidor_final', 'S') and
                     (valorun < RefDev.ffloat('est_bcst', -6));


      compl_intra := (not rest_ftpres) and (not rest_inter) and (not compl_inter) and (not rest_intra) and
                     (not Conf.AQ_CompCodMotivo.Trim.IsEmpty) and
                     RefDev.fequals('iddest', '1') and
                     RefDev.fequals('consumidor_final', 'S') and
                     (valorun > RefDev.ffloat('est_bcst', -6));

      sem_compl_rest := (not rest_inter) and (not compl_inter) and (not rest_intra) and (not compl_intra) and (not Conf.AQ_DevSemRCCodMotivo.Trim.IsEmpty) ;

      {$ENDREGION}

      if compl_intra or rest_inter or compl_inter or rest_intra or sem_compl_rest then
        Exit(True);
    end;

    RefDev.Next;
  end;
end;

function TRestComplST.RegistroC185(tpdoc: string; id: Integer): TObjectList<TRestCompSaida>;
begin
  if not FGerar then Exit(RegSaida);

  Client.filterStr('tpdoc = ''%s'' and e_s = ''S'' and cod_doc = %d', [tpdoc, id]);
  Result := RegistroSaida();
end;

function TRestComplST.RegistroC186(id: Integer): TObjectList<TC186>;
var
  reg: TC186;
  codresp: string;
  valorun: Double;
begin

  //colocar o somatorio respectivo dos registro c181ec186 no final do processameto

  C186.Clear;
  Result := C186;

  if not FGerar then Exit;

  RefDev.filterStr('tpdoc_dev = ''NF'' and es_dev = ''S'' and cod_doc_dev = %d', [id]);

  RefDev.First;
  while not RefDev.Eof do
  begin
    if ((RefDev.ffloat('nf_bcst') > 0) or
        (RefDev.ffloat('nf_bcstret') > 0)) and
       ((RefDev.finsideof('cst', Conf.CSTs_E) and (not RefDev.fempty('cst')) ) or
        (RefDev.finsideof('csosn', Conf.CSTs_E) and (not RefDev.fempty('csosn')) ) ) then
    begin
      valorun := RoundTo(RefDev.ffloat('total_liq') / RefDev.ffloat('quantidade'), -6);

      reg := TC186.Create;
      with reg do
      begin
        reg.COD_MOT_REST_COMPL := OnlyNumber(Conf.AQ_DevEntCodMotivo.Trim);
        NUM_ITEM := RefDev.fint('nitem');
        GRUPO_PROD := RefDev.fint('grupo_prod');
        COD_PROD := RefDev.fstr('cod_prod');
        CST_ICMS := RefDev.fstr('orig') + RefDev.fstr('cst');
        CFOP := RefDev.fint('codigo_nop');

        DocFiscal := TDocumentoF.Create;

        DocFiscal.Modelo := IfThen(RefDev.fequals('tpdoc', 'NFC'), '65') +
                            IfThen(RefDev.fequals('tpdoc', 'NFD'), '02') +
                            IfThen(RefDev.fequals('tpdoc', 'CP'), '2D') +
                            IfThen(RefDev.fequals('tpdoc', 'NF'), IfThen(RefDev.fmatchText('modelo', ['1', '01', '001', '1A', '1B', '1-A']), '01', RefDev.fstr('modelo')));

        DocFiscal.Serie := IfThen(MatchStr(DocFiscal.Modelo, ['01', '04']), RefDev.fstr('serie'));
        DocFiscal.NumECF := IfThen(RefDev.fequals('tpdoc', 'CP'), RefDev.fstr('chave'));
        DocFiscal.NumDoc := IfThen(MatchStr(DocFiscal.Modelo, ['01', '02', '2D']), RefDev.fstr('num_nf'));
        DocFiscal.ChvDFe := IfThen(MatchStr(DocFiscal.Modelo, ['55', '65']), RefDev.fstr('chave'));
        DocFiscal.DataDoc := RefDev.fdate('data');

        UnidPrincipal := RefDev.fstr('unidade');
        QtdePrincipal := RefDev.ffloat('quantidade', -6);

        if Conf.UsarUnidadeDoc and
          (RefDev.ffloat('nf_qcom', -6) > 0) and
          (not RefDev.fempty('nf_ucom')) then
        begin
          QUANT_CONV := RefDev.ffloat('nf_qcom', -6);
          UNID := RefDev.fstr('nf_ucom');
        end
        else
        begin
          QUANT_CONV := RefDev.ffloat('quantidade', -6);
          UNID := RefDev.fstr('unidade');
        end;
        VL_UNIT_CONV := RoundTo(RefDev.ffloat('total_liq') / QUANT_CONV, -6);

        if RefDev.ffloat('nf_icm') > 0 then
          VL_UNIT_ICMS_OP_CONV := RoundTo(RefDev.ffloat('nf_icm') / QUANT_CONV, -6)
        else if RefDev.ffloat('total_icm') > 0 then
          VL_UNIT_ICMS_OP_CONV := RoundTo(RefDev.ffloat('total_icm') / QUANT_CONV, -6);

        if (RefDev.ffloat('nf_bcst') > 0) and (RefDev.ffloat('nf_st') > 0) then
        begin
          COD_RESP_RET := 1;
          VL_UNIT_BC_ICMS_ST_CONV := RoundTo(RefDev.ffloat('nf_bcst') / QUANT_CONV, -6);
          VL_UNIT_ICMS_ST_CONV    := RoundTo(RefDev.ffloat('nf_st') / QUANT_CONV, -6);
          VL_UNIT_FCP_ST_CONV     := RoundTo(RefDev.ffloat('nf_fcpst') / QUANT_CONV, -6);
        end
        else if (RefDev.ffloat('nf_bcstret') > 0) and (RefDev.ffloat('nf_stret') > 0) then
        begin
          COD_RESP_RET := 2;
          VL_UNIT_BC_ICMS_ST_CONV := RoundTo(RefDev.ffloat('nf_bcstret') / QUANT_CONV, -6);
          VL_UNIT_ICMS_ST_CONV    := RoundTo(RefDev.ffloat('nf_stret') / QUANT_CONV, -6);
          VL_UNIT_FCP_ST_CONV     := RoundTo(RefDev.ffloat('nf_fcpstret') / QUANT_CONV, -6);
        end
        else if (RefDev.ffloat('total_bcst') > 0) and (RefDev.ffloat('total_st') > 0) then
        begin
          COD_RESP_RET := IfThen(RefDev.fequals('ant_st', 'S'), 3, 1);
          VL_UNIT_BC_ICMS_ST_CONV := RoundTo(RefDev.ffloat('total_bcst') / QUANT_CONV, -6);
          VL_UNIT_ICMS_ST_CONV    := RoundTo(RefDev.ffloat('total_st') / QUANT_CONV, -6);
          if RefDev.ffloat('total_fcpst') > 0 then
            VL_UNIT_FCP_ST_CONV   := RoundTo(RefDev.ffloat('total_fcpst') / QUANT_CONV, -6)
          else
            VL_UNIT_FCP_ST_CONV   := RoundTo(RefDev.ffloat('total_fcpstret') / QUANT_CONV, -6);
        end;
        COD_DA := '';
        NUM_DA := '';
      end;

      C186.Add(reg);

      //Codigo;Produto;NCM;E/S;Doc;Numero;Data;CST;CSOSN;CFOP;Ant;Unidade;Quantidade;Total Liq;Total ICMS;Base ST;Total ST;Total FCPST;
      ArqEntrada.Add(Format('%s;%s;%s;%s;%s;%d;%s;%d;%s;%s;%d;%s;%s;%0.3f;%0.2f;%0.2f;%0.2f;%0.2f;%0.2f',
                            [RefDev.fstr('grupo_prod') + '-' + RefDev.fstr('cod_prod'),
                             RefDev.fstr('descr_prod').Replace(';', ',', [rfReplaceAll]).Replace('|', ''),
                             RefDev.fstr('nbm').Replace(';', ',', [rfReplaceAll]),
                             RefDev.fstr('e_s'),
                             RefDev.fstr('tpdoc'),
                             RefDev.fint('num_nf'),
                             FormatDateTime('DD/MM/YYYY', RefDev.fdate('data')),
                             reg.COD_RESP_RET,
                             RefDev.fstr('cst'),
                             RefDev.fstr('csosn'),
                             RefDev.fint('codigo_nop'),
                             RefDev.fstr('ant_st'),
                             reg.UNID,
                             reg.QUANT_CONV,
                             RefDev.ffloat('total_liq'),
                             reg.VL_UNIT_ICMS_OP_CONV * reg.QUANT_CONV,
                             reg.VL_UNIT_BC_ICMS_ST_CONV * reg.QUANT_CONV,
                             reg.VL_UNIT_ICMS_ST_CONV * reg.QUANT_CONV,
                             reg.VL_UNIT_FCP_ST_CONV * reg.QUANT_CONV]));
    end;
    RefDev.Next;
  end;
end;

function TRestComplST.RegistroC330(data: TDateTime; grupo: Integer;
  codigo: string): TObjectList<TRestCompSaida>;
begin
  if not FGerar then Exit(RegSaida);

  Client.filterStr('tpdoc = ''NFD'' and dia = %d and mes = %d and ano = %d and grupo_prod = %d and cod_prod = ''%s''',
                   [DayOf(data), MonthOf(data), YearOf(data), grupo, codigo.Trim.QuotedString]);
  Result := RegistroSaida();
end;

function TRestComplST.RegistroC380(id, grupo: Integer;
  codigo: string): TObjectList<TRestCompSaida>;
begin
  if not FGerar then Exit(RegSaida);

  Client.filterStr('tpdoc = ''NFD'' and cod_doc = %d and grupo_prod = %d and cod_prod = %s',
                   [id, grupo, codigo.Trim.QuotedString]);
  Result := RegistroSaida();
end;

function TRestComplST.RegistroC430(data: TDateTime; grupo: Integer;
  codigo: string): TObjectList<TRestCompSaida>;
begin
  if not FGerar then Exit(RegSaida);

  Client.filterStr('tpdoc = ''CP'' and dia = %d and mes = %d and ano = %d and grupo_prod = %d and cod_prod = %s',
                   [DayOf(data), MonthOf(data), YearOf(data), grupo, codigo.Trim.QuotedString]);
  Result := RegistroSaida();
end;

function TRestComplST.RegistroC480(nserie: string;
  num_nf, id, grupo: Integer; codigo: string): TObjectList<TRestCompSaida>;
begin
  if not FGerar then Exit(RegSaida);

  Client.filterStr('tpdoc = ''CP'' and chave = %s and num_nf = %d and cod_doc = %d ' +
                   ' and grupo_prod = %d and cod_prod = %s',
                   [nserie.Trim.QuotedString, num_nf, id, grupo, codigo.Trim.QuotedString]);
  Result := RegistroSaida();
end;

function TRestComplST.RegistroH030(grupo: Integer;
  codigo: string): TObjectList<TH030>;
var
  reg: TH030;
begin
  H030.Clear;
  Result := H030;

  if not FGerar then Exit;

//  FEstoque.filterStr('grupo_prod = %d and cod_prod = %s and dia = %d and mes = %d and ano = %d ',
  FEstoque.filterStr('grupo_prod = %d and cod_prod = %s and dia = %s',
                     [grupo, codigo.Trim.QuotedString, FormatDateTime('YYYYMMDD', FDataInv).QuotedString]);
//  if (Client.ffloat('vl_icms_st') >= 0) or
//     (Client.ffloat('vl_bc_icms_st') >= 0) then
  begin
    reg := TH030.Create;
    with reg do
    begin
      VL_ICMS_OP := FEstoque.ffloat('vl_icms_op', -6);
      VL_BC_ICMS_ST := FEstoque.ffloat('vl_bc_icms_st', -6);
      VL_ICMS_ST := FEstoque.ffloat('vl_icms_st', -6);
      VL_FCP := FEstoque.ffloat('vl_fcp', -6);
    end;

    H030.Add(reg);
  end;
end;

function TRestComplST.RegistroC180(id, itemid: Integer): TObjectList<TC180>;
var
  reg: TC180;
  codresp: string;
begin
  C180.Clear;
  Result := C180;

  if not FGerar then Exit;

  Client.filterStr('tpdoc = ''NF'' and e_s = ''E'' and cod_doc = %d and nitem = %d', [id, itemid]);
  if ((Client.ffloat('nf_bcst') > 0) or
      (Client.ffloat('nf_bcstret') > 0) or
      (Client.ffloat('total_bcst') > 0)) and
     ( ( Client.finsideof('cst', Conf.CSTs_E) and (not Client.fempty('cst')) ) or
       ( Client.finsideof('csosn', Conf.CSTs_E) and (not Client.fempty('csosn')) ) ) then
  begin
    reg := TC180.Create;
    with reg do
    begin
      UnidPrincipal := Client.fstr('unidade');
      QtdePrincipal := Client.ffloat('quantidade', -6);

      if Conf.UsarUnidadeDoc and
        (Client.ffloat('nf_qcom', -6) > 0) and
        (not Client.fempty('nf_ucom')) then
      begin
        QUANT_CONV := Client.ffloat('nf_qcom', -6);
        UNID := Client.fstr('nf_ucom');
      end
      else
      begin
        QUANT_CONV := Client.ffloat('quantidade', -6);
        UNID := Client.fstr('unidade');
      end;
      VL_UNIT_CONV := RoundTo(Client.ffloat('total_liq') / QUANT_CONV, -6);

      if Client.ffloat('nf_icm') > 0 then
        VL_UNIT_ICMS_OP_CONV := RoundTo(Client.ffloat('nf_icm') / QUANT_CONV, -6)
      else if Client.ffloat('total_icm') > 0 then
        VL_UNIT_ICMS_OP_CONV := RoundTo(Client.ffloat('total_icm') / QUANT_CONV, -6);

      if (Client.ffloat('nf_bcst') > 0) and (Client.ffloat('nf_st') > 0) then
      begin
        COD_RESP_RET := 1;
        VL_UNIT_BC_ICMS_ST_CONV := RoundTo(Client.ffloat('nf_bcst') / QUANT_CONV, -6);
        VL_UNIT_ICMS_ST_CONV    := RoundTo(Client.ffloat('nf_st') / QUANT_CONV, -6);
        VL_UNIT_FCP_ST_CONV     := RoundTo(Client.ffloat('nf_fcpst') / QUANT_CONV, -6);
      end
      else if (Client.ffloat('nf_bcstret') > 0) and (Client.ffloat('nf_stret') > 0) then
      begin
        COD_RESP_RET := 2;
        VL_UNIT_BC_ICMS_ST_CONV := RoundTo(Client.ffloat('nf_bcstret') / QUANT_CONV, -6);
        VL_UNIT_ICMS_ST_CONV    := RoundTo(Client.ffloat('nf_stret') / QUANT_CONV, -6);
        VL_UNIT_FCP_ST_CONV     := RoundTo(Client.ffloat('nf_fcpstret') / QUANT_CONV, -6);
      end
      else if (Client.ffloat('total_bcst') > 0) and (Client.ffloat('total_st') > 0) then
      begin
        COD_RESP_RET := IfThen(Client.fequals('ant_st', 'S'), 3, 1);
        VL_UNIT_BC_ICMS_ST_CONV := RoundTo(Client.ffloat('total_bcst') / QUANT_CONV, -6);
        VL_UNIT_ICMS_ST_CONV    := RoundTo(Client.ffloat('total_st') / QUANT_CONV, -6);
        if Client.ffloat('total_fcpst') > 0 then
          VL_UNIT_FCP_ST_CONV   := RoundTo(Client.ffloat('total_fcpst') / QUANT_CONV, -6)
        else
          VL_UNIT_FCP_ST_CONV   := RoundTo(Client.ffloat('total_fcpstret') / QUANT_CONV, -6);
      end;
      COD_DA := '';
      NUM_DA := '';
    end;

    C180.Add(reg);

    //Codigo;Produto;NCM;E/S;Doc;Numero;Data;CST;CSOSN;CFOP;Ant;Unidade;Quantidade;Total Liq;Total ICMS;Base ST;Total ST;Total FCPST;
    ArqEntrada.Add(Format('%s;%s;%s;%s;%s;%d;%s;%d;%s;%s;%d;%s;%s;%0.3f;%0.2f;%0.2f;%0.2f;%0.2f;%0.2f',
                          [Client.fstr('grupo_prod') + '-' + Client.fstr('cod_prod'),
                           Client.fstr('descr_prod').Replace(';', ',', [rfReplaceAll]).Replace('|', ''),
                           Client.fstr('nbm').Replace(';', ',', [rfReplaceAll]),
                           Client.fstr('e_s'),
                           Client.fstr('tpdoc'),
                           Client.fint('num_nf'),
                           FormatDateTime('DD/MM/YYYY', Client.fdate('data')),
                           reg.COD_RESP_RET,
                           Client.fstr('cst'),
                           Client.fstr('csosn'),
                           Client.fint('codigo_nop'),
                           Client.fstr('ant_st'),
                           reg.UNID,
                           reg.QUANT_CONV,
                           Client.ffloat('total_liq'),
                           reg.VL_UNIT_ICMS_OP_CONV * reg.QUANT_CONV,
                           reg.VL_UNIT_BC_ICMS_ST_CONV * reg.QUANT_CONV,
                           reg.VL_UNIT_ICMS_ST_CONV * reg.QUANT_CONV,
                           reg.VL_UNIT_FCP_ST_CONV * reg.QUANT_CONV]));
  end;

end;

function TRestComplST.RegistroC181(id,
  itemid: Integer): TObjectList<TC181>;
var
  reg: TC181;
  prod: TArqContProd;
  rest_ftpres, rest_intra, rest_inter, compl_intra, compl_inter, sem_compl_rest: Boolean;
  valorun, valuet, reduc: Double;//, qutil, qtemp: Double;
  found: Boolean;
  I: Integer;
  opcs: set of TTipoConferenciaEstoque;
  opc: TTipoConferenciaEstoque;
begin
  //analisar se vai alterar o calculo tanto no registro como no produto

  C181.Clear;
  Result := C181;

  if not FGerar then Exit;

  RefDev.filterStr('tpdoc_dev = ''NF'' and es_dev = ''E'' and cod_doc_dev = %d and nitem_dev = %d', [id, itemid]);

  //filtro pelo cst da nota de saida
  if not ((RefDev.finsideof('cst', Conf.CSTs_S) and (not RefDev.fempty('cst')) ) or
          (RefDev.finsideof('csosn', Conf.CSTs_S) and (not RefDev.fempty('csosn')) ) ) then
    Exit;

  valorun := RoundTo(RefDev.ffloat('total_liq') / RefDev.ffloat('quantidade'), -6);

  {$REGION 'Montando registros'}

  {$REGION 'definindo tipo de restituição/complemento'}

  rest_ftpres := RefDev.fequals('indiedest', '2') and
                     (not Conf.FP_RestCodMotivo.Trim.IsEmpty) and
                     (not (RefDev.fequals('consumidor_final', 'S') and Conf.MicroEmpPeqPorte));

  rest_inter :=  (not rest_ftpres) and
                 (not Conf.AQ_RestCodMotivo.Trim.IsEmpty) and
                 RefDev.fequals('iddest', '2') and
                 RefDev.fequals('consumidor_final', 'S') and
                 RefDev.fdif('indiedest', '1') and
                 Conf.MicroEmpPeqPorte and
                 (valorun < RefDev.ffloat('est_bcst', -6));

  compl_inter := (not rest_ftpres) and (not rest_inter) and
                 (not Conf.AQ_CompCodMotivo.Trim.IsEmpty) and
                 RefDev.fequals('iddest', '2') and
                 RefDev.fequals('consumidor_final', 'S') and
                 RefDev.fdif('indiedest', '1') and
                 Conf.MicroEmpPeqPorte and
                 (valorun > RefDev.ffloat('est_bcst', -6));

  rest_intra := (not rest_ftpres) and (not rest_inter) and (not compl_inter) and
                 (not Conf.AQ_RestCodMotivo.Trim.IsEmpty) and
                 RefDev.fequals('iddest', '1') and
                 RefDev.fequals('consumidor_final', 'S') and
                 (valorun < RefDev.ffloat('est_bcst', -6));


  compl_intra := (not rest_ftpres) and (not rest_inter) and (not compl_inter) and (not rest_intra) and
                 (not Conf.AQ_CompCodMotivo.Trim.IsEmpty) and
                 RefDev.fequals('iddest', '1') and
                 RefDev.fequals('consumidor_final', 'S') and
                 (valorun > RefDev.ffloat('est_bcst', -6));





//  compl_inter := (not rest_inter) and
//                 (not OnlyNumber(Conf.AQ_DevEstCompCodMotivo).Trim.IsEmpty) and
//                 RefDev.fdif('indiedest', '1') and
//                 Conf.MicroEmpPeqPorte and
//                 RefDev.fequals('consumidor_final', 'S') and
//                 RefDev.fdif('iddest', '1') and
//                 (valorun > RefDev.ffloat('est_bcst', -6));
//
//  rest_intra := (not rest_inter) and (not compl_inter) and
//                 (not OnlyNumber(Conf.AQ_DevEstRestCodMotivo).Trim.IsEmpty) and
//                 RefDev.fequals('consumidor_final', 'S') and
//                 RefDev.fequals('indiedest', '1') and
//                 (valorun < RefDev.ffloat('est_bcst', -6));
//
//  compl_intra := (not rest_inter) and (not compl_inter) and (not rest_intra) and
//                 (not OnlyNumber(Conf.AQ_DevEstCompCodMotivo).Trim.IsEmpty) and
//                 RefDev.fequals('consumidor_final', 'S') and
//                 RefDev.fequals('indiedest', '1') and
//                 (valorun > RefDev.ffloat('est_bcst', -6));

  sem_compl_rest := (not rest_inter) and (not compl_inter) and (not rest_intra) and (not compl_intra) and (not OnlyNumber(Conf.AQ_DevSemRCCodMotivo).Trim.IsEmpty) ;

  {$ENDREGION}

  if compl_intra or rest_inter or compl_inter or rest_intra or sem_compl_rest then
  begin

    {$REGION 'Registros de saida para o arquivo EFD ICMS'}
    reg := TC181.Create;
    with reg do
    begin
      if compl_inter or compl_intra then
        COD_MOT_REST_COMPL := OnlyNumber(Conf.AQ_DevEstCompCodMotivo.Trim)
      else if rest_inter or rest_intra then
        COD_MOT_REST_COMPL := OnlyNumber(Conf.AQ_DevEstRestCodMotivo.Trim)
      else
        COD_MOT_REST_COMPL := OnlyNumber(Conf.AQ_DevSemRCCodMotivo.Trim);

      DocFiscal := TDocumentoF.Create;

      DocFiscal.Modelo := IfThen(RefDev.fequals('tpdoc', 'NFC'), '65') +
                          IfThen(RefDev.fequals('tpdoc', 'NFD'), '02') +
                          IfThen(RefDev.fequals('tpdoc', 'CP'), '2D') +
                          IfThen(RefDev.fequals('tpdoc', 'NF'), IfThen(RefDev.fmatchText('modelo', ['1', '01', '001', '1A', '1B', '1-A']), '01', RefDev.fstr('modelo')));

      DocFiscal.Serie := IfThen(MatchStr(DocFiscal.Modelo, ['01', '04']), RefDev.fstr('serie'));
      DocFiscal.NumECF := IfThen(RefDev.fequals('tpdoc', 'CP'), RefDev.fstr('chave'));
      DocFiscal.NumDoc := IfThen(MatchStr(DocFiscal.Modelo, ['01', '02', '2D']), RefDev.fstr('num_nf'));
      DocFiscal.ChvDFe := IfThen(MatchStr(DocFiscal.Modelo, ['55', '65']), RefDev.fstr('chave'));
      DocFiscal.DataDoc := RefDev.fdate('data');

      NUM_ITEM := RefDev.fint('nitem');
      GRUPO_PROD := RefDev.fint('grupo_prod');
      COD_PROD := RefDev.fstr('cod_prod');
      CST_ICMS := RefDev.fstr('orig') + RefDev.fstr('cst');
      CFOP := RefDev.fint('codigo_nop');
      QUANT_CONV := RefDev.ffloat('quantidade', -6);
      UNID := RefDev.fstr('unidade');
      VL_UNIT_CONV := valorun;

      if rest_inter then
      begin
        valuet := 0;
        reduc  := 0;
      end
      else
      begin
        if RefDev.ffloat('perc_red_prod') > 0 then
          reduc := Abs(IfThen(not Conf.UsarReducaoInver, -100) + RefDev.ffloat('perc_red_prod'));

        if RefDev.ffloat('perc_red_prod') > 0 then
          valuet := RefDev.ffloat('total_liq') * reduc / 100
        else
          valuet := RefDev.ffloat('total_liq');
        valuet := valuet * (RefDev.ffloat('aliq_icm') + RefDev.ffloat('aliq_fcp')) / 100;
        valuet := RoundTo(valuet / QUANT_CONV, -6);
      end;

      VL_UNIT_ICMS_NA_OPERACAO_CONV := valuet;
      if not Conf.UsarVL_UNIT_ICMS_OP_CONV then
        VL_UNIT_ICMS_OP_CONV := 0
      else
        VL_UNIT_ICMS_OP_CONV := RefDev.ffloat('est_icm', -6);

      VL_UNIT_ICMS_OP_ESTOQUE_CONV := RefDev.ffloat('est_icm', -6);
      VL_UNIT_ICMS_ST_ESTOQUE_CONV := RefDev.ffloat('est_st', -6) + RefDev.ffloat('est_fcpst', -6);
      VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV := RefDev.ffloat('est_fcpst', -6);
      {
      if rest_ftpres then
      begin
        if Conf.FP_CamposST then
        begin
          if not Conf.UsarVL_UNIT_ICMS_OP_CONV then
          begin
            VL_UNIT_ICMS_ST_CONV_REST := VL_UNIT_ICMS_ST_ESTOQUE_CONV;
            VL_UNIT_FCP_ST_CONV_REST  := VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
          end
          else
          begin
            VL_UNIT_ICMS_ST_CONV_REST := VL_UNIT_ICMS_OP_ESTOQUE_CONV + VL_UNIT_ICMS_ST_ESTOQUE_CONV - VL_UNIT_ICMS_OP_CONV;
            VL_UNIT_FCP_ST_CONV_REST  := VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
          end;
        end
        else
        begin
          VL_UNIT_ICMS_ST_CONV_REST := 0;
          VL_UNIT_FCP_ST_CONV_REST  := 0;
        end;
        VL_UNIT_ICMS_ST_CONV_COMPL := 0;
        VL_UNIT_FCP_ST_CONV_COMPL := 0;
      end
      else
      }
      //aqui como será o estorno então o valor sera preenchido nos campos inversos da operacao, ou seja
      // se existiu complemento na saida aqui se faz a restituicao e vice versa
      if compl_inter or compl_intra then
      begin
        VL_UNIT_ICMS_ST_CONV_REST := VL_UNIT_ICMS_NA_OPERACAO_CONV - VL_UNIT_ICMS_OP_ESTOQUE_CONV - VL_UNIT_ICMS_ST_ESTOQUE_CONV;
        VL_UNIT_FCP_ST_CONV_REST  := VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
        VL_UNIT_ICMS_ST_CONV_COMPL := 0;
        VL_UNIT_FCP_ST_CONV_COMPL := 0;
      end
      else if rest_inter or rest_intra then
      begin
        VL_UNIT_ICMS_ST_CONV_REST := 0;
        VL_UNIT_FCP_ST_CONV_REST  := 0;
        VL_UNIT_ICMS_ST_CONV_COMPL := VL_UNIT_ICMS_OP_ESTOQUE_CONV + VL_UNIT_ICMS_ST_ESTOQUE_CONV -
                                     IfThen(Conf.UsarVL_UNIT_ICMS_OP_CONV, VL_UNIT_ICMS_OP_CONV, VL_UNIT_ICMS_NA_OPERACAO_CONV);
        VL_UNIT_FCP_ST_CONV_COMPL := VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
      end;
    end;
    {$ENDREGION}

    //if (reg.VL_UNIT_ICMS_ST_CONV_REST > 0) or
    //   (reg.VL_UNIT_ICMS_ST_CONV_COMPL > 0) then
    begin

      C181.Add(reg);

      prod := nil;
      for I := 0 to ProdCont.Count - 1 do
        if (reg.GRUPO_PROD = ProdCont.Items[I].Grupo_prod) and
           (reg.COD_PROD = ProdCont.Items[I].Cod_prod) then
        begin
          prod := ProdCont.Items[I];
          Break;
        end;

      if prod = nil then
      begin
        FEstoque.prepare_loop_fmt('grupo_prod = %d and cod_prod = %s', [FEstoque.fint('grupo_prod'), FEstoque.fstrq('cod_prod')]);
        try
          if not FEstoque.IsEmpty then
          begin
            prod := TArqContProd.Create;

            prod.Grupo_prod := FEstoque.fint('grupo_prod');
            prod.Cod_prod := FEstoque.fstr('cod_prod');
            prod.DS_PRODMERC := FEstoque.fstr('descr_prod').Replace('|', '');
            prod.CD_NCM := FEstoque.fstr('nbm');
            prod.TP_UNIDADE := FEstoque.fstr('unidade');
            prod.CD_EAN13 := FEstoque.fstr('ean');
            if prod.CD_EAN13.Trim.IsEmpty then
              if not FEstoque.fempty('ean_sis') then
                if ConfEANInv.IndexOf(FEstoque.fcopy('ean_sis', 3)) = -1 then
                  prod.CD_EAN13 := FEstoque.fstr('ean_sis');

            ProdCont.Add(prod);

          end;
        finally
          FEstoque.prepare_loop_done;
        end;
      end;

      if (reg.VL_UNIT_ICMS_ST_CONV_REST > 0) or (reg.VL_UNIT_ICMS_ST_CONV_COMPL > 0) then
        if prod <> nil then
        begin
          found := True;
          if reg.VL_UNIT_ICMS_ST_CONV_REST > 0 then
            prod.QT_PROD_ST_REST := prod.QT_PROD_ST_REST + reg.QUANT_CONV
          else if reg.VL_UNIT_ICMS_ST_CONV_COMPL > 0 then
            prod.QT_PROD_ST_COMP := prod.QT_PROD_ST_COMP + reg.QUANT_CONV;

          prod.VR_ICMS_ST_COMP := prod.VR_ICMS_ST_COMP + (reg.VL_UNIT_ICMS_ST_CONV_COMPL * reg.QUANT_CONV);
          prod.VR_FEM_ST_COMP := prod.VR_FEM_ST_COMP + (reg.VL_UNIT_FCP_ST_CONV_COMPL * reg.QUANT_CONV);

          prod.VR_ICMS_ST_REST := prod.VR_ICMS_ST_REST + (reg.VL_UNIT_ICMS_ST_CONV_REST * reg.QUANT_CONV);
          prod.VR_FEM_ST_REST := prod.VR_FEM_ST_REST + (reg.VL_UNIT_FCP_ST_CONV_REST * reg.QUANT_CONV);
        end;

      //Codigo;Produto;NCM;Doc;Numero;Data;CST;CSOSN;CFOP;Unidade;Quantidade;Total Liq;PercRedICMS;
      //AliqICMS;AliqFCP;ValorIcms;VlUnitIcmsCampo11;VlUnitIcmsEst;VlUnitIcmsStEst;VlUnitFcpEst;
      //VlUnitST_Rest;VlUnitFCPST_Rest;VlUnitST_Compl;VlUnitFCPST_Compl;
      ArqSaidas.Add(Format('%s;%s;%s;%s;%d;%s;%s;%s;%s;%d;%s;%0.6f;%0.6f;%0.4f;' +
                           '%0.2f;%0.2f;%0.6f;%0.6f;%0.6f;%0.6f;' +
                           '%0.6f;%0.6f;%0.6f;%0.6f;%0.6f;',
                           [RefDev.fstr('grupo_prod') + '-' + RefDev.fstr('cod_prod'),
                            RefDev.fstr('descr_prod').Replace(';', ',', [rfReplaceAll]).Replace('|', ''),
                            RefDev.fstr('nbm').Replace(';', ',', [rfReplaceAll]),
                            RefDev.fstr('tpdoc'),
                            RefDev.fint('num_nf'),
                            FormatDateTime('DD/MM/YYYY', RefDev.fdate('data')),
                            reg.COD_MOT_REST_COMPL,
                            RefDev.fstr('cst'),
                            RefDev.fstr('csosn'),
                            RefDev.fint('codigo_nop'),
                            reg.UNID,
                            reg.QUANT_CONV,
                            RefDev.ffloat('total_liq'),
                            reduc,
                            RefDev.ffloat('aliq_icm'),
                            RefDev.ffloat('aliq_fcp'),
                            reg.VL_UNIT_ICMS_NA_OPERACAO_CONV,
                            reg.VL_UNIT_ICMS_OP_CONV,
                            reg.VL_UNIT_ICMS_OP_ESTOQUE_CONV,
                            reg.VL_UNIT_ICMS_ST_ESTOQUE_CONV,
                            reg.VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV,
                            reg.VL_UNIT_ICMS_ST_CONV_REST,
                            reg.VL_UNIT_FCP_ST_CONV_REST,
                            reg.VL_UNIT_ICMS_ST_CONV_COMPL,
                            reg.VL_UNIT_FCP_ST_CONV_COMPL]));
    end;

  end;
  {$ENDREGION}
end;

function TRestComplST.RegistroSaida: TObjectList<TRestCompSaida>;
var
  reg: TRestCompSaida;
  prod: TArqContProd;
  rest_ftpres, rest_aspqtt, comp_aspqtt, rest_intern, comp_intern: Boolean;
  valorun, valuet, reduc: Double;//, qutil, qtemp: Double;
  found: Boolean;
  I: Integer;
  opcs: set of TTipoConferenciaEstoque;
  opc: TTipoConferenciaEstoque;
begin
  {$REGION 'comentarios'}
    //quando ir utilizando os valores nas saidas é ideal que a quantidade da saida venha abatendo nos estoques
    //para nao aproveitar de um valor que nao tenha a entrada de notas fiscais

    //criei a quantidade ja utilizada para o algoritimo ir diminuindo
    //mas talvez o ideal seja usar o proprio dataset, pois pode usar um filter com valor > 0 e data de entrada menor que a data do documento
    //e ir gravando a quantidade disponivel ate zerar, e se o caso nao tenha como aproveitar de uma entrada anterior aproveitar uma proxima eu acho!!

    //Configuração para o comportamento do sistema quanto ao estoque para aproveitamento no cálculo
    // Usar estoque Período estoque faz com que o sistema calcule o estoque
    // * Sem Comportamento, o sistema vai fazer o calculo independente do estoque disponivel, vai considerar apenas a base do st e valor
    // * Considerar estoque do dia ou anterior, o sistema vai diminuindo o estoque a medida que vai utilizando
    // * Considerar qualquer estoque do periodo, mesma configuracao acima, porem se nao existir estoque na condicao acima e existir apos o dia do documento,
    //     o sistema vai utilizar desse valor para o calculo

  {$ENDREGION}

  FRegSaida.Clear;
  Result := FRegSaida;

  Client.First;
  while not Client.Eof do
  begin
    var okContinua := (Client.ffloat('est_st', -6) + Client.ffloat('est_fcpst', -6)) > 0;
    if okContinua then
    begin
      okContinua := ( Client.finsideof('cst', Conf.CSTs_S) and (not Client.fempty('cst')) ) or
                    ( Client.finsideof('csosn', Conf.CSTs_S) and (not Client.fempty('csosn')) );
      if not okContinua then
        okContinua := Client.fequals('iddest', '2') and
                      (( Client.finsideof('cst', Conf.CSTs_SInterest) and (not Client.fempty('cst')) ) or
                       ( Client.finsideof('csosn', Conf.CSTs_SInterest) and (not Client.fempty('csosn')) ));
    end;
    {
    if ((Client.ffloat('est_st', -6) + Client.ffloat('est_fcpst', -6)) > 0) and
       ( ( Client.finsideof('cst', Conf.CSTs_S) and (not Client.fempty('cst')) ) or
         ( Client.finsideof('csosn', Conf.CSTs_S) and (not Client.fempty('csosn')) ) ) then
    }
    if okContinua then
    begin

      valorun := RoundTo(Client.ffloat('total_liq') / Client.ffloat('quantidade'), -6);

      {$REGION 'validando a quantidade'}
      (*
      //caso fosse validar as quantidades em estoque talvez usasse um codigo parecido com abaixo
      qutil := 0;
      if Conf.TpConfEstoque = tceIgualOuAnterior then
        opcs := [tceIgualOuAnterior]
      else if Conf.TpConfEstoque = tceQualquerDia then
        opcs := [tceIgualOuAnterior, tceQualquerDia];
      else
        qutil := Client.ffloat('quantidade', -6);

      qtemp := Client.ffloat('quantidade', -6);
      for opc in opcs do
      begin
        if opc = tceIgualOuAnterior then
          FEstoque.prepare_loop_fmt('grupo_prod = %d and cod_prod = %s and dia <= %s',
                                    [FEstoque.fint('grupo_prod'), FEstoque.fstrq('cod_prod'),
                                     FormatDateTime('YYYYMMDD', Client.fdate('data'))])
        else
          FEstoque.prepare_loop();

        try
          while not FEstoque.Eof do
          begin

            if (FEstoque.ffloat('qtde_dispo', -6) >= qtemp) then
            begin
              qutil := qutil + qtemp;
              FEstoque.DataSet.Edit;
              FEstoque.DataSet.FieldByName('qtde_dispo').AsFloat := FEstoque.DataSet.FieldByName('qtde_dispo').AsFloat - qtemp;
              FEstoque.DataSet.Post;
              qtemp := 0;
            end
            else if (FEstoque.ffloat('qtde_dispo', -6) > 0) then
            begin
              qutil := qutil + FEstoque.ffloat('qtde_dispo', -6);
              qtemp := qtemp - FEstoque.ffloat('qtde_dispo', -6);
              FEstoque.DataSet.Edit;
              FEstoque.DataSet.FieldByName('qtde_dispo').AsFloat := 0;
              FEstoque.DataSet.Post;
            end;

            if (qtemp <= 0 ) then
              Break;

            FEstoque.Next;
          end;
        finally
          FEstoque.prepare_loop_done;
        end;
      end;
      *)
      {$ENDREGION}

      {$REGION 'Montando registros'}

      {$REGION 'definindo tipo de restituição/complemento'}

      var strr := Client.fstr('iddest') + '|' + Conf.FP_RestCodMotivo + '|' + Client.fstr('consumidor_final') + '|' + IfThen(Conf.MicroEmpPeqPorte, 'S','N');
      if strr = 'sd' then
        LogError('eee');

      rest_ftpres := Client.fequals('iddest', '2') and
                     (not Conf.FP_RestCodMotivo.Trim.IsEmpty) and
                     (not (Client.fequals('consumidor_final', 'S') and Conf.MicroEmpPeqPorte));

//      if rest_ftpres then
//        if Conf.MicroEmpPeqPorte and Client.fequals('consumidor_final', 'S') and Client.fdif('iddest', '1') then
//          rest_ftpres:= False;

                     //colocar o teste do cst, pegar a config e colocar nos demais lugares, testar Match(cst.(0,2), [])
                     // talvez colocar direto no filtro fica melhor, melhor direto no select
                     // indIEDest: Inscricao estadual -
                     // iddest   : 1 Interna, 2 Interestadual
      rest_aspqtt := (not rest_ftpres) and
                     (not Conf.AQ_RestCodMotivo.Trim.IsEmpty) and
                     Client.fequals('iddest', '2') and
                     Client.fequals('consumidor_final', 'S') and
                     Client.fdif('indiedest', '1') and
                     Conf.MicroEmpPeqPorte and
                     (valorun < Client.ffloat('est_bcst', -6));

      comp_aspqtt := (not rest_ftpres) and (not rest_aspqtt) and
                     (not Conf.AQ_CompCodMotivo.Trim.IsEmpty) and
                     Client.fequals('iddest', '2') and
                     Client.fequals('consumidor_final', 'S') and
                     Client.fdif('indiedest', '1') and
                     Conf.MicroEmpPeqPorte and
                     (valorun > Client.ffloat('est_bcst', -6));

      rest_intern := (not rest_ftpres) and (not rest_aspqtt) and (not comp_aspqtt) and
                     (not Conf.AQ_RestCodMotivo.Trim.IsEmpty) and
                     Client.fequals('iddest', '1') and
                     Client.fequals('consumidor_final', 'S') and
                     (valorun < Client.ffloat('est_bcst', -6));


      comp_intern := (not rest_ftpres) and (not rest_aspqtt) and (not comp_aspqtt) and (not rest_intern) and
                     (not Conf.AQ_CompCodMotivo.Trim.IsEmpty) and
                     Client.fequals('iddest', '1') and
                     Client.fequals('consumidor_final', 'S') and
                     (valorun > Client.ffloat('est_bcst', -6));
      {$ENDREGION}

      //if qutil > 0 then
      //begin
      if comp_intern or rest_ftpres or rest_aspqtt or comp_aspqtt or rest_intern then
      begin

        {$REGION 'Registros de saida para o arquivo EFD ICMS'}
        reg := TRestCompSaida.Create;
        with reg do
        begin
          COD_MOT_REST_COMPL := OnlyNumber(IfThen(rest_ftpres, Conf.FP_RestCodMotivo) +
                                IfThen(rest_aspqtt or rest_intern, Conf.AQ_RestCodMotivo) +
                                IfThen(comp_aspqtt or comp_intern, Conf.AQ_CompCodMotivo));

          NUM_ITEM := Client.fint('nitem');
          GRUPO_PROD := Client.fint('grupo_prod');
          COD_PROD := Client.fstr('cod_prod');
          CST_ICMS := Client.fstr('orig') + Client.fstr('cst');
          CFOP := Client.fint('codigo_nop');
          //COD_MOT_REST_COMPL := IfThen(rest_ftpres, '200') +
          //                      IfThen(rest_aspqtt or rest_intern, '100') +
          //                      IfThen(comp_aspqtt or comp_intern, '300');
          QUANT_CONV := Client.ffloat('quantidade', -6);
          UNID := Client.fstr('unidade');
          VL_UNIT_CONV := valorun;

          if rest_ftpres then
          begin
            valuet := 0;
            reduc  := 0;
          end
          else
          begin
            if Client.ffloat('perc_red_prod') > 0 then
              reduc := Abs(IfThen(not Conf.UsarReducaoInver, -100) + Client.ffloat('perc_red_prod'));

            if Client.ffloat('perc_red_prod') > 0 then
              valuet := Client.ffloat('total_liq') * reduc / 100
            else
              valuet := Client.ffloat('total_liq');
            valuet := valuet * (Client.ffloat('aliq_icm') + Client.ffloat('aliq_fcp')) / 100;
            valuet := RoundTo(valuet / QUANT_CONV, -6);
          end;

          VL_UNIT_ICMS_NA_OPERACAO_CONV := valuet;
          if not Conf.UsarVL_UNIT_ICMS_OP_CONV then
            VL_UNIT_ICMS_OP_CONV := 0
          else
            VL_UNIT_ICMS_OP_CONV := Client.ffloat('est_icm', -6);

          VL_UNIT_ICMS_OP_ESTOQUE_CONV := Client.ffloat('est_icm', -6);
          VL_UNIT_ICMS_ST_ESTOQUE_CONV := Client.ffloat('est_st', -6) + Client.ffloat('est_fcpst', -6);
          VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV := Client.ffloat('est_fcpst', -6);
//          Client.LogDataSet('dataset', true);
          if rest_ftpres then
          begin
            if Conf.FP_CamposST then
            begin
              if not Conf.UsarVL_UNIT_ICMS_OP_CONV then
              begin
                VL_UNIT_ICMS_ST_CONV_REST := VL_UNIT_ICMS_ST_ESTOQUE_CONV;
                VL_UNIT_FCP_ST_CONV_REST  := VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
              end
              else
              begin
                VL_UNIT_ICMS_ST_CONV_REST := VL_UNIT_ICMS_OP_ESTOQUE_CONV + VL_UNIT_ICMS_ST_ESTOQUE_CONV - VL_UNIT_ICMS_OP_CONV;
                VL_UNIT_FCP_ST_CONV_REST  := VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
              end;
            end
            else
            begin
              VL_UNIT_ICMS_ST_CONV_REST := 0;
              VL_UNIT_FCP_ST_CONV_REST  := 0;
            end;
            VL_UNIT_ICMS_ST_CONV_COMPL := 0;
            VL_UNIT_FCP_ST_CONV_COMPL := 0;
          end
          else if rest_aspqtt or rest_intern then
          begin
            VL_UNIT_ICMS_ST_CONV_REST := VL_UNIT_ICMS_OP_ESTOQUE_CONV + VL_UNIT_ICMS_ST_ESTOQUE_CONV -
                                         IfThen(Conf.UsarVL_UNIT_ICMS_OP_CONV, VL_UNIT_ICMS_OP_CONV, VL_UNIT_ICMS_NA_OPERACAO_CONV);
            VL_UNIT_FCP_ST_CONV_REST  := VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV;
            VL_UNIT_ICMS_ST_CONV_COMPL := 0;
            VL_UNIT_FCP_ST_CONV_COMPL := 0;
          end
          else if comp_aspqtt or comp_intern then
          begin
            VL_UNIT_ICMS_ST_CONV_REST := 0;
            VL_UNIT_FCP_ST_CONV_REST  := 0;
            VL_UNIT_ICMS_ST_CONV_COMPL := VL_UNIT_ICMS_NA_OPERACAO_CONV - VL_UNIT_ICMS_OP_ESTOQUE_CONV - VL_UNIT_ICMS_ST_ESTOQUE_CONV;
            VL_UNIT_FCP_ST_CONV_COMPL := 0;
          end;
        end;
        {$ENDREGION}

        if (reg.VL_UNIT_ICMS_ST_CONV_REST > 0) or
           (reg.VL_UNIT_ICMS_ST_CONV_COMPL > 0) then
        begin

          FRegSaida.Add(reg);

          prod := nil;
          for I := 0 to ProdCont.Count - 1 do
            if (reg.GRUPO_PROD = ProdCont.Items[I].Grupo_prod) and
               (reg.COD_PROD = ProdCont.Items[I].Cod_prod) then
            begin
              prod := ProdCont.Items[I];
              Break;
            end;

          if prod = nil then
          begin
            FEstoque.prepare_loop_fmt('grupo_prod = %d and cod_prod = %s', [FEstoque.fint('grupo_prod'), FEstoque.fstrq('cod_prod')]);
            try
              if not FEstoque.IsEmpty then
              begin
                prod := TArqContProd.Create;

                prod.Grupo_prod := FEstoque.fint('grupo_prod');
                prod.Cod_prod := FEstoque.fstr('cod_prod');
                prod.DS_PRODMERC := FEstoque.fstr('descr_prod').Replace('|', '');
                prod.CD_NCM := FEstoque.fstr('nbm');
                prod.TP_UNIDADE := FEstoque.fstr('unidade');
                prod.CD_EAN13 := FEstoque.fstr('ean');
                if prod.CD_EAN13.Trim.IsEmpty then
                  if not FEstoque.fempty('ean_sis') then
                    if ConfEANInv.IndexOf(FEstoque.fcopy('ean_sis', 3)) = -1 then
                      prod.CD_EAN13 := FEstoque.fstr('ean_sis');

                ProdCont.Add(prod);

              end;
            finally
              FEstoque.prepare_loop_done;
            end;
          end;

          if prod <> nil then
          begin
            found := True;
            if reg.VL_UNIT_ICMS_ST_CONV_REST > 0 then
              prod.QT_PROD_ST_REST := prod.QT_PROD_ST_REST + reg.QUANT_CONV
            else if reg.VL_UNIT_ICMS_ST_CONV_COMPL > 0 then
              prod.QT_PROD_ST_COMP := prod.QT_PROD_ST_COMP + reg.QUANT_CONV;

            prod.VR_ICMS_ST_COMP := prod.VR_ICMS_ST_COMP + (reg.VL_UNIT_ICMS_ST_CONV_COMPL * reg.QUANT_CONV);
            prod.VR_FEM_ST_COMP := prod.VR_FEM_ST_COMP + (reg.VL_UNIT_FCP_ST_CONV_COMPL * reg.QUANT_CONV);

            prod.VR_ICMS_ST_REST := prod.VR_ICMS_ST_REST + (reg.VL_UNIT_ICMS_ST_CONV_REST * reg.QUANT_CONV);
            prod.VR_FEM_ST_REST := prod.VR_FEM_ST_REST + (reg.VL_UNIT_FCP_ST_CONV_REST * reg.QUANT_CONV);
          end;

          //Codigo;Produto;NCM;Doc;Numero;Data;CST;CSOSN;CFOP;Unidade;Quantidade;Total Liq;PercRedICMS;
          //AliqICMS;AliqFCP;ValorIcms;VlUnitIcmsCampo11;VlUnitIcmsEst;VlUnitIcmsStEst;VlUnitFcpEst;
          //VlUnitST_Rest;VlUnitFCPST_Rest;VlUnitST_Compl;VlUnitFCPST_Compl;
          ArqSaidas.Add(Format('%s;%s;%s;%s;%d;%s;%s;%s;%s;%d;%s;%0.6f;%0.6f;%0.4f;' +
                               '%0.2f;%0.2f;%0.6f;%0.6f;%0.6f;%0.6f;' +
                               '%0.6f;%0.6f;%0.6f;%0.6f;%0.6f;',
                               [Client.fstr('grupo_prod') + '-' + Client.fstr('cod_prod'),
                                Client.fstr('descr_prod').Replace(';', ',', [rfReplaceAll]).Replace('|', ''),
                                Client.fstr('nbm').Replace(';', ',', [rfReplaceAll]),
                                Client.fstr('tpdoc'),
                                Client.fint('num_nf'),
                                FormatDateTime('DD/MM/YYYY', Client.fdate('data')),
                                reg.COD_MOT_REST_COMPL,
                                Client.fstr('cst'),
                                Client.fstr('csosn'),
                                Client.fint('codigo_nop'),
                                reg.UNID,
                                reg.QUANT_CONV,
                                Client.ffloat('total_liq'),
                                reduc,
                                Client.ffloat('aliq_icm'),
                                Client.ffloat('aliq_fcp'),
                                reg.VL_UNIT_ICMS_NA_OPERACAO_CONV,
                                reg.VL_UNIT_ICMS_OP_CONV,
                                reg.VL_UNIT_ICMS_OP_ESTOQUE_CONV,
                                reg.VL_UNIT_ICMS_ST_ESTOQUE_CONV,
                                reg.VL_UNIT_FCP_ICMS_ST_ESTOQUE_CONV,
                                reg.VL_UNIT_ICMS_ST_CONV_REST,
                                reg.VL_UNIT_FCP_ST_CONV_REST,
                                reg.VL_UNIT_ICMS_ST_CONV_COMPL,
                                reg.VL_UNIT_FCP_ST_CONV_COMPL]));
        end;

      end;
      //end;
      {$ENDREGION}

    end;

    Client.Next;
  end;

end;

function TRestComplST.SalvarApuracao(values: TEfd_icmsst_cr_apuracoes_class): Boolean;
var
  apuracao, value: TEfd_icmsst_cr_apuracao_class;
  apuracoes: TEfd_icmsst_cr_apuracoes_class;
  delId, I, j: Integer;
begin
  if not FGerar then
    Exit(True);

  Auditor.Tabela := 'EFD_ICMSST_CR_APURACAO';
//  if not Auditor.Processo('EFD017').Permitido then
//    Exit;

  Client.filterClear;
  Client.DataSet.Close;

  apuracoes := TEfd_icmsst_cr_apuracoes_class.Create;
  try

    apuracoes.CopyFrom(TEfd_icmsst_cr_apuracao_class,
                       SqlOpen('select * from efd_icmsst_cr_apuracao where ano = %d and mes = %d and cod_empresa = %s',
                               [YearOf(FDataIni), MonthOf(FDataIni), FOwner.CodEmpresa]));

    for I := 0 to apuracoes.Count - 1 do
    begin
      value := nil;
      apuracao := apuracoes.Items[i];
      for J := 0 to values.Count - 1 do
        if apuracao.tipo = values.Items[J].tipo then
        begin
          value := values.Items[J];
          Break;
        end;

      if Assigned(value) and (value.tipo = apuracao.tipo) and
        ((VarToFloat(value.icmsop) <> VarToFloat(apuracao.icmsop)) or
         (VarToFloat(value.icmsst) <> VarToFloat(apuracao.icmsst)) or
         (VarToFloat(value.fcpst ) <> VarToFloat(apuracao.fcpst))) then
      begin
        Client.filterClear;
        if not Client.ClientOpen('select cod_nf, num_nf, status, situacao_nfe from notafiscal' +
                                 ' where efdrestcomplicms_id = %d and cod_empresa = %d', [apuracao.id, apuracao.cod_empresa])
          .IsEmpty then
          if not MatchText(Client.fstr('situacao_nfe'), ['Cancelada', 'Denegada', 'Inutilizada', 'AInutilizar']) then
          begin
            if ShowConfirmacao('Já existe uma Nota Fiscal de Complemento no sistema para apuração' + sLineBreak +
                               'Codigo: %d' + sLineBreak +
                               'Número: %d' + sLineBreak +
                               'Status: %s' + sLineBreak +
                               'Situação: %s' + sLineBreak + sLineBreak +
                               'Se continuar os dados da apuração serão sobreescritos. Deseja continuar mesmo assim?',
                               [Client.fint('cod_nf'), Client.fint('num_nf'), Client.fstr('status'), Client.fstr('situacao_nfe')]) <> ID_YES then
              Exit;

            Auditor.SetTabela('EFD_ICMSST_CR_APURACAO').Processo('EFD018').Alterar
                   .Msg('Ano %d Mes %d[ICMS %f ST %f FCP %f]->[ICMS %f ST %f FCP %f]',
                        [YearOf(FDataIni), MonthOf(FDataIni),
                         VarToFloat(apuracao.icmsop) , VarToFloat(apuracao.icmsst), VarToFloat(apuracao.fcpst),
                         VarToFloat(value.icmsop) , VarToFloat(value.icmsst), VarToFloat(value.fcpst)])
                   .Key(apuracao.ano.ToString + apuracao.mes.ToString + apuracao.tipo.ToString)
                   .AddProcesso();
          end;
      end;
    end;

    if Auditor.listauditoria.Count > 0 then
      if not Auditor.Permitido then
        Exit;

    try

      for I := 0 to values.Count - 1 do
      begin
        value := values.Items[I];
        delId := -1;

        for J := 0 to apuracoes.Count - 1 do
          if value.tipo = apuracoes.Items[J].tipo then
          begin
            delId    := J;
            value.id := apuracoes.Items[J].id;
            value.tipo := apuracoes.Items[J].tipo;
            Break;
          end;

        if delId > -1 then
          apuracoes.Delete(delId);

        value.ano := YearOf(FDataIni);
        value.mes := MonthOf(FDataIni);
        value.cod_empresa := StrToInt(FOwner.CodEmpresa);
        value.tipo := value.tipo;
        value.icmsop := value.icmsop;
        value.icmsst := value.icmsst;
        value.fcpst := value.fcpst;

        SqlExec(value.SQLMotor('id').SQLUpdateOrInsert);
      end;

      for I := 0 to apuracoes.Count - 1 do
      begin
        apuracao := apuracoes.Items[i];
        Client.ClientOpen('select cod_nf, num_nf, status, situacao_nfe from notafiscal' +
                          ' where efdrestcomplicms_id = %d and cod_empresa = %d', [apuracao.id, apuracao.cod_empresa]);
        if Client.IsEmpty then
          SqlExec(apuracao.SQLMotor().SQLDelete);
      end;

      if Transacao.InTransaction then
        Transacao.Commit;

      Auditor.Processo('EFD017').Sucesso.GravarMensagem('');

    except on E: Exception do
      begin
        Transacao.Rollback;

        registraErro('TRestComplST.SalvarApuracao ' + e.message);
        Auditor.Processo('EFD017').Falha.GravarMensagem('');
        ShowErro('Erro ao gravar dados da Restiuição/Complemento no sistema' + sLineBreak +
                 'Erro: %s', [E.Message]);
      end;
    end;

  finally
    apuracoes.Free;
  end;
end;

{ RConf_IPI }

function RConf_IPI.GetCampoImposto(const AEmissaoPropia: Boolean; ACFOP: Integer): CampoImposto;
begin
  for var I := Low(CFOPsDeCamposProprios) to High(CFOPsDeCamposProprios) do
    if ACFOP = CFOPsDeCamposProprios[I] then
    begin
      Result := CampoImposto.csCamposProprios;
      Exit();
    end;

  if AEmissaoPropia then
    Result := EmissaoPropria
  else
    Result := EmissaoTerceiro;
end;

end.



