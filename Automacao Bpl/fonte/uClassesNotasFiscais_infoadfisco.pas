unit uClassesNotasFiscais_infoadfisco;

interface

uses
  uDataSet_OOP,
  DB,
  DBClient,
  notafiscal_sped_c113_class,
  efd_1921_class,
  nota_ajuste_class,
  Classes;

type
  TSpedFiscalNF_C110 = class;

  TInformacaoComplementarNF = class(TDataSet_OOP)
  public
    constructor create;
    function abreInfComplementar: boolean; overload;
    function abreInfComplementar(pCod_inf: Integer): boolean; overload;
    function abreInfComplementar(Tipo: string; Cadastrar: Boolean = True): boolean; overload;
    function abreInfComplementarCupom: boolean;
    function abreInfComplementarDevolucao(pNatureza_nf: string): boolean;
    function abreInfComplementarDeOlhoNoImposto: Boolean;
    function post: boolean; override;
    function delete: boolean; override;

    function cadastrar_inf_complementar(Atipo, Atxt, Atxt_compl: string): Boolean;
    function GetTxtComplReplaced(dados: TDataSet_OOP; sTxtCompl: string): string;
  end;

  TSpedFiscalNF_C115 = class(TDataSet_OOP)
  private
    vCidCol, vCidEnt: TClientDataSet;
  public
    destructor Destroy; override;
    constructor create;
    function delete: boolean; override;
    function post: boolean; override;
    function edit: boolean; override;
    function abreC115(cod_nf, cod_inf: integer): boolean; overload;
    function abreC115(cod_nf: integer): boolean; overload;
    function existeUF(coletaOuEntrega: string): boolean;
  end;

  TSpedFiscalNF_C114 = class(TDataSet_OOP)
  public
    constructor create;
    function delete: boolean; override;
    function post: boolean; override;
    function abreC114(cod_nf, cod_inf: integer): boolean; overload;
    function abreC114(cod_nf: integer): boolean; overload;
    function GetTextoInformacaoComplementar(Atxt: string): string;
  end;

  TSpedFiscalNF_C113 = class(TDataSet_OOP)
  private
    FOwner: TSpedFiscalNF_C110;
    fCod_Nf_Ref: integer;
    fCOD_NF: Integer;
    cdsGridNfSped: TClientDataSet;
    procedure abreNFSped;
    procedure COD_NF_REFGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor create(AOwner: TSpedFiscalNF_C110);
    function delete: boolean; override;
    function post: boolean; override;
    function abreC113(cod_nf, cod_inf: integer): boolean; overload;
    function abreC113(cod_nf: integer): boolean; overload;
    function existeNotaFiscal(vNatureza, vSerie: string; vNumNf, vCodCliente: integer): boolean;
    function getCliente(vCodCliente: integer): string;
    function salvarReferenciaPelaChaveNFe(ChaveNfe: string): Boolean;
    function salvarReferenciaModelo01ou02(Anota: TNotafiscal_sped_c113_class): Boolean;
    function getNotaFiscalDaPesquisa: string;
    function GetTextoInformacaoComplementar_NFE(Atxt: string): string;
    function GetTextoInformacaoComplementar_NFCE(Atxt: string): string;
  end;

  TSpedFiscalNF_C112 = class(TDataSet_OOP)
  public
    constructor create;
    function delete: boolean; override;
    function post: boolean; override;
    function abreC112(cod_nf, cod_inf: integer): boolean;
  end;

  TSpedFiscalNF_C111 = class(TDataSet_OOP)
  public
    constructor create;
    function delete: boolean; override;
    function post: boolean; override;
    function abreC111(cod_nf, cod_inf: integer): boolean;
  end;

  TSpedFiscalNF_C110 = class(TDataSet_OOP)
  private
    FOwner: TDataSet_OOP;
  public
    destructor Destroy; override;
    constructor Create(AOwner: TDataSet_OOP);
    function post: boolean; override;
    function delete: boolean; override;
    function abreC110(cod_nf: integer): boolean;
    function incluirC110: Boolean;
    function incluirC111: boolean;
    function incluirC112: boolean;
    function incluirC113: boolean;
    function incluirC114: boolean;
    function incluirC115: boolean;
    function adicionaInfComplSimples(nota: TDataSet_OOP): boolean;
    function adicionaInfComplSimplesExcesso(nota: TDataSet_OOP): boolean;
    function adicionaInfComplCupom(nota: TDataSet_OOP): boolean;
    function adicionaInfComplDevolucaoOuPorItem(nota: TDataSet_OOP): boolean;
    function adicionaInfComplDevolucaoEntradaPedido(): boolean;
    function adicionaInfComplPorItemOuNCM(nota: TDataSet_OOP): boolean;
    function adicinarInfComplDeOlhoNoImposto(nota: TDataSet_OOP): boolean;
    function adicionaInfComplDesoneracaoICMS(nota: TDataSet_OOP): boolean;
    function adicionaInfComplDesoneracaoPISCOFINS(nota: TDataSet_OOP): boolean;
    function adicionaInfComplRetencaoFederal(nota: TDataSet_OOP): boolean;
    function adicionaInfComplPorOperacaoFiscalId(nota: TDataSet_OOP): boolean;
    function adicionaInfComplPorInfId(idsInf: array of Integer): Boolean;
    function ResolverInfComplRedBenefPISCOFINS(nota: TDataSet_OOP): boolean;
  var
    vInfCompl: TInformacaoComplementarNF;
    vC111: TSpedFiscalNF_C111;
    vC112: TSpedFiscalNF_C112;
    vC113: TSpedFiscalNF_C113;
    vC114: TSpedFiscalNF_C114;
    vC115: TSpedFiscalNF_C115;
  end;

  TSpedFiscalNF_C120 = class(TDataSet_OOP)
  public
    constructor create;
    function post: boolean; override;
    function delete: boolean; override;
    function abreC120(cod_nf: integer): boolean;
  end;

  TSpedLancamentoFiscal = class(TDataSet_OOP)
  public
    constructor create;
    function abreLancamentosFiscais:boolean;
  end;


  TLancItemC195C197 = class
  private
    Fnitem: Integer;
    Fvbc: Double;
    Fpaliq: Double;
    Fvicms: Double;
    Fcodobs: Integer;
  public
    property nitem: Integer read Fnitem write Fnitem;
    property vbc: Double read Fvbc write Fvbc;
    property paliq: Double read Fpaliq write Fpaliq;
    property vicms: Double read Fvicms write Fvicms;
    property codobs: Integer read Fcodobs write Fcodobs;
  end;

  TLancItemC195C197Array = array of TLancItemC195C197;

  TLancItemC195C197List = class
  private
    Fitems: TLancItemC195C197Array;
  public
    constructor Create;
    destructor Destroy; override;

    procedure HandleNewItem(newItem: TLancItemC195C197);

    property items: TLancItemC195C197Array read Fitems;
  end;

  TSpedFiscalNF_C195_C197 = class(TDataSet_OOP)
  public
    constructor create;
    destructor Destroy; override;
    function post: boolean; override;
    function delete: boolean; override;
    function abreC195_C197(cod_nf: integer): boolean;
    function incluirC195_c197(cod_nf, nitem: integer; base_icm_icm_st,
      valor_icm_icm_st, aliq_icm, valor_outros:Currency): boolean;
    procedure setValorBaseICMS_ST(valor:Currency);
    procedure setValorDoICMS_ST(valor:Currency);
    function _gerarRegistroAutomatico(cod_nf, nitem: integer; base_icm_icm_st,
      valor_icm_icm_st, aliq_icm, valor_outros: Extended): Boolean; overload;
    function _gerarRegistroAutomatico(items: TDataSet_OOP; defaultAjICMSAnt, defaultAjOutros: Integer; icmsAntAjPorItem, outrosAjPorItem: Boolean): Boolean; overload;

    var
    vLancFiscal: TSpedLancamentoFiscal;
  end;

  TSpedFiscal1921 = class(TDataSet_OOP)
  private
    CamposSelect: string;
    FOwner: TDataSet_OOP;
    procedure GetTextDataSet(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure AfterOpen(Sender: TObject);
  public
    destructor Destroy; override;
    constructor Create(AOwner: TDataSet_OOP);

    procedure OpenByCodNf(cod_nf: Integer);

    function Save(registro: TEfd1921): Boolean;
    function GetItem(id: string): TEfd1921;
    function RemoveItem(id: string): TEfd1921;
    function GetListCodAjustes: TStrings;

  end;

  TSpedFiscalSumarioAjustes = class(TDataSet_OOP)
  private
    procedure GetTextDataSet(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure AfterOpen(Sender: TObject);
  public
    destructor Destroy; override;
    constructor Create(AOwner: TDataSet_OOP);

    procedure RemoverAjustesFiltro(regC197, reg1921: Boolean);

    procedure OpenByDate(mes, ano: Integer);
  end;

  TSpedFiscalNF = class
  private
    FOwner: TDataSet_OOP;
    Freg1921: TSpedFiscal1921;
    FsumAjustes: TSpedFiscalSumarioAjustes;
  public
    destructor Destroy; override;
    constructor create(AOwner: TDataSet_OOP);

    procedure CheckGuidNF(cod_nf: Integer);
    function GetGuidNf(cod_nf: Integer): string;
    function ValidarRegistrosAutomaticos(autoC195: TNotaAjusteDbList; auto1921: TEfd1921List): Boolean;
    function SaveRegistrosAutomaticos(autoC195: TNotaAjusteDbList; auto1921: TEfd1921List): Boolean;

    function VerificarAjustesAutoAposConfirmacao(): Boolean;

    property Owner: TDataSet_OOP read FOwner write FOwner;
    property reg1921: TSpedFiscal1921 read Freg1921 write Freg1921;
    property sumAjustes: TSpedFiscalSumarioAjustes read FsumAjustes write FsumAjustes;
  var
    vC110: TSpedFiscalNF_C110;
    vC120: TSpedFiscalNF_C120;
    vC195_C197: TSpedFiscalNF_C195_C197;
  end;

implementation

uses
  SysUtils, IBDatabase, IBQuery, uDtmAtivo, uDtmNF,
  Forms, Windows, StrUtils, uClassesNotasFiscais, DateUtils,
  uClassesNotasFiscais_consts, Dialogs, uClasseConexao, Math,
  sped_informacao_complementar_class, base_class, uDtmSpedNf,
  uClassesNotasFiscais_pedidos, hw_utils, Query_OOP, Types_OOP,
  FieldsConfigUnit,
  ContainerUnit, InfComplementarDFeEtdUnit, IOperacaoPassivelDeRedBenefPcUseCaseUnit, TipoInfComplementarEnumUnit,
  EValidacaoNegocioUnit, SituacaoNFeEnumUnit,
  uCadNf_AjustesFiscais, StringNullableUnit, ErpFeaturesFactoryUnit;

{ TInformacaoComplementarNF }

function TInformacaoComplementarNF.abreInfComplementar: boolean;
begin
  Result := montaSelect('select * from sped_informacao_complementar' +
    ' where coalesce(ativo_em_nfe, ''S'') <> ''N'' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TInformacaoComplementarNF.abreInfComplementar(pCod_inf:
  Integer): boolean;
begin
  Result := montaSelect('select * from sped_informacao_complementar' +
    ' where coalesce(ativo_em_nfe, ''S'') <> ''N'' and cod_inf = ' + IntToStr(pCod_inf) + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TInformacaoComplementarNF.abreInfComplementar(Tipo: string;
  Cadastrar: Boolean): boolean;
begin
  Result := montaSelect('select * from sped_informacao_complementar' +
                        ' where coalesce(ativo_em_nfe, ''S'') <> ''N'' and tipo = %s and cod_empresa = %s and ativo = 1',
                        [QuotedStr(Tipo), vDadosIni.CodEmpresa]);
  if dataSet.IsEmpty and Cadastrar then
  begin
    cadastrar_inf_complementar(Tipo, '', '');
    dataSet.Refresh;
  end;
end;

function TInformacaoComplementarNF.abreInfComplementarCupom: boolean;
begin
  Result := abreInfComplementar(sInfCplCUPOM);
end;

function TInformacaoComplementarNF.abreInfComplementarDeOlhoNoImposto: Boolean;
begin
  Result := abreInfComplementar(sInfCplDEOLHOIMPOSTO);
end;

function TInformacaoComplementarNF.abreInfComplementarDevolucao(
  pNatureza_nf: string): boolean;
var
  vTemp: string;
begin
  if pNatureza_nf = 'S' then
    vTemp:= 'DEVOLUCAO COMPRAS'
  else
    vTemp:= 'DEVOLUCAO VENDAS';
  Result := montaSelect('select * from sped_informacao_complementar' +
    ' where coalesce(ativo_em_nfe, ''S'') <> ''N'' and tipo = ' + QuotedStr(vTemp) + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TInformacaoComplementarNF.cadastrar_inf_complementar(Atipo, Atxt,
  Atxt_compl: string): Boolean;
var
  Acon: TConexao;
  Ainf: TSped_informacao_complementar_class;
begin
  Result := False;
  Ainf := TSped_informacao_complementar_class.Create;
  Acon := TConexao.Create(dtmAtivo.bancoHw);
  try
    Acon.SqlOpen('select max(inf.cod_inf) maximo, cod.tabela, cod.valor from sped_informacao_complementar inf' +
                 ' left join codigo cod on cod.tabela = ''SPED_INFORMACAO_COMPLEMENTAR'' and cod.cod_empresa = inf.cod_empresa' +
                 ' where inf.cod_empresa = %s' +
                 ' group by 2,3', [vDadosIni.codEmpresa]);
    if Acon.QrAux.FieldByName('maximo').AsInteger > Acon.QrAux.FieldByName('valor').AsInteger then
      Acon.SqlExec('update or insert into codigo (tabela, cod_empresa, valor) values (%s, %s, %d) matching (tabela, cod_empresa)',
                   [QuotedStr('SPED_INFORMACAO_COMPLEMENTAR'), vDadosIni.codEmpresa, Acon.QrAux.FieldByName('maximo').AsInteger]);

    Ainf.SetValuesFrom(Acon.SqlOpen('select %s from %s where cod_empresa = %s and tipo = %s',
                                      [Ainf._tb.GetFieldsSql(), Ainf._tb.name, vDadosIni.codempresa, QuotedStr(Atipo)]));

    if Ainf.cod_inf = 0 then
    begin
      Ainf.beginChanges(True);
      Ainf.cod_empresa := StrToInt(vDadosIni.codEmpresa);
      Ainf.tipo        := Atipo;
      Ainf.txt         := IfThen(Atxt <> '', Atxt,
                                 IfThen(Atipo = sInfCplCUPOM        , 'Ref ECF:') +
                                 IfThen(Atipo = sInfCplDESONERACAO  , '') +
                                 IfThen(Atipo = sInfCplNFCE         , 'Ref NFCe:') +
                                 IfThen(Atipo = sInfCplNFE          , 'Ref NFe:') +
                                 IfThen(Atipo = sInfCplSIMPLES      , '"DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL";  "NÃO GERA DIREITO A CRÉDITO FISCAL DE IPI.";') +
                                 IfThen(Atipo = sInfCplSIMPLES_EX   , '"DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL";   "ESTABELECIMENTO IMPEDIDO DE RECOLHER O ICMS/ISS PELO SIMPLES NACIONAL, NOS TERMOS DO § 1º DO ART. 20 DA LC 123/2006";   "NÃO GERA DIREITO A CRÉDITO FISCAL DE IPI".') +
                                 IfThen(Atipo = sInfCplDEOLHOIMPOSTO, '.'));
      Ainf.txt_compl   := IfThen(Atxt_compl <> '', Atxt_compl,
                                 IfThen(Atipo = sInfCplCUPOM          , '(Mod:[@COD_MOD] ECF:[@ECF_CX] Fab:[@ECF_FAB] COO:[@NUM_DOC] Data:[@DT_DOC])') +
                                 IfThen(Atipo = sInfCplDESONERACAO    , 'Desconto no valor de R$[@VICMDESON] ref. ICMS desonerado conf. convenio de ICMS 100/97 e ajuste SINIEF 10/2012') +
                                 IfThen(Atipo = sInfCplNFCE           , '[@chave_nfe_ref]') +
                                 IfThen(Atipo = sInfCplNFE            , '[@chave_nfe_ref]') +
                                 IfThen(Atipo = sInfCplRETENCAOFEDERAL, 'Retenção Federal total de R$ [@vrettot] conforme art. 64 da Lei 9.430/1996.'));
      with Ainf.SQLMotor('cod_inf') do
      begin
        Options.FieldsInInsertUpdate := fsNewDifOld;// [muCheckModified];
        Ainf.cod_inf := Acon.SqlInsertID(SQLInsertAutoInc, autoIncField);
        if Acon.Transacao.InTransaction then
          Acon.Transacao.Commit;
      end;
    end;

  finally
    FreeAndNil(Acon);
    FreeAndNil(Ainf);
  end;
end;

constructor TInformacaoComplementarNF.create;
begin
  dataSet := TClientDataSet(dtmSpedNf.cdsInfCompl);
  transacao := TIBTransaction(dtmNF.transacaoAux);
  buscas := TIBQuery(dtmNF.qrBuscas);
end;

function TInformacaoComplementarNF.delete: boolean;
begin
  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    if inherited Delete then
      if Apply then
        result := CommitaTransacao;
  end;
end;

function TInformacaoComplementarNF.GetTxtComplReplaced(
  dados: TDataSet_OOP; sTxtCompl: string): string;
var
  sText, tag, value: string;
  fField: TField;
begin
  Result := sTxtCompl;

  sText := sTxtCompl;
  tag := ExtractStr(sText, '[@', ']');
  while tag <> '' do
  begin
    fField := dados.dataSet.FindField(tag);
    if Assigned(fField) then
    begin
      value := fField.Text;
    end
    else
      value := '';

    sText := StringReplace(sText, '[@' + tag + ']', value, [rfReplaceAll, rfIgnoreCase]);
    tag := ExtractStr(sText, '[@', ']');
  end;

  Result := sText;
end;

function TInformacaoComplementarNF.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if dataSet.fieldbyname('tipo').asstring = sInfCplSIMPLES then
    begin
      if Trim(dataSet.fieldbyname('txt').asstring) = '' then
        dataSet.fieldbyname('txt').asstring :=
          '"DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL";' +
          '"NÃO GERA DIREITO A CRÉDITO FISCAL DE IPI.";';
    end
    else if dataSet.fieldbyname('tipo').asstring = sInfCplSIMPLES_EX then
    begin
      if Trim(dataSet.fieldbyname('txt').asstring) = '' then
        dataSet.fieldbyname('txt').asstring :=
          '"DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL";' +
          ' "ESTABELECIMENTO IMPEDIDO DE RECOLHER O ICMS/ISS PELO SIMPLES' +
          ' NACIONAL, NOS TERMOS DO § 1º DO ART. 20 DA LC 123/2006";' +
          ' "NÃO GERA DIREITO A CRÉDITO FISCAL DE IPI".';
    end;

    if Trim(dataSet.FieldByName('txt').AsString) = '' then
      raise exception.create('Texto não informado');

    //    if Trim(dataSet.FieldByName('dados_parametro').AsString) = '' then
    //      raise exception.create('Dados do parâmetro não informado');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('cod_inf').AsInteger :=
        Gencodigo('SPED_INFORMACAO_COMPLEMENTAR', dtmNF.SpIncCodigoAux, vDadosIni.codEmpresa);
    end;

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Apply then
      CommitaTransacao
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := False;
    end;
    Refresh;
  except on e: exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;  

{ TSpedFiscalNF }

procedure TSpedFiscalNF.CheckGuidNF(cod_nf: Integer);
begin
  if cod_nf = 0  then
    Exit;

  try

    FOwner.SqlExec('update notafiscal set guidt = (select guid from spdb_guid)' +
                   ' where cod_nf = %d and cod_empresa = %d and guidt is null',
                   [cod_nf, vDadosIni.cod_empresa]);

    FOwner.SqlExec('update notafiscal_item set guidt = (select guid from spdb_guid)' +
                   ' where cod_nf = %d and cod_empresa = %d and guidt is null',
                   [cod_nf, vDadosIni.cod_empresa]);

    if FOwner.transacao.InTransaction then
      FOwner.transacao.Commit;

  except on E: Exception do
    begin
      vC195_C197.registraErro('TSpedFiscalNF.CheckGuidNF: ' + E.Message);
    end;                                                                      
  end;
end;

constructor TSpedFiscalNF.create(AOwner: TDataSet_OOP);
begin
  FOwner := AOwner;
  vC110 := TSpedFiscalNF_C110.create(FOwner);
  vC120 := TSpedFiscalNF_C120.create;
  vC195_C197 := TSpedFiscalNF_C195_C197.create;
  reg1921 := TSpedFiscal1921.Create(FOwner);
  sumAjustes := TSpedFiscalSumarioAjustes.Create(FOwner);
end;

destructor TSpedFiscalNF.Destroy;
begin
  vC110.Free;
  vC120.Free;
  vC195_C197.Free;
  vC110 := nil;
  vC120 := nil;
  vC195_C197 := nil;

  reg1921.Free;
  sumAjustes.Free;
  inherited;
end;

function TSpedFiscalNF.GetGuidNf(cod_nf: Integer): string;
begin
  Result := FOwner
    .SqlScalar('select guidt from notafiscal where cod_nf = %d and cod_empresa = %d', [cod_nf, vDadosIni.cod_empresa])
    .AsString;
end;

function TSpedFiscalNF.SaveRegistrosAutomaticos(autoC195: TNotaAjusteDbList;
  auto1921: TEfd1921List): Boolean;
var
  I: Integer;
begin
  Result := false;

  if not ValidarRegistrosAutomaticos(autoC195, auto1921) then
    Exit;

  try
    for I := 0 to autoC195.Count - 1 do
      FOwner.SqlExec(autoC195.Items[I].SQLMotor().SQLInsert);

    for I := 0 to auto1921.Count - 1 do
      FOwner.SqlExec(auto1921.Items[I].SQLMotor().SQLInsert);

    FOwner.CommitaTransacao;

    Result := True;

    vC195_C197.Refresh;
    reg1921.Refresh;

  except on E: Exception do
    begin
      Result := false;

      FOwner.RollBackTransacao;

      vC195_C197.registraErro('TSpedFiscalNF.SaveRegistrosAutomaticos: ' + e.Message);
      ShowErro('Erro ao salvar registros automaticos' + sLineBreak + sLineBreak + E.Message);
    end;
  end;
end;

function TSpedFiscalNF.ValidarRegistrosAutomaticos(autoC195: TNotaAjusteDbList;
  auto1921: TEfd1921List): Boolean;
var
  I, codNf, numNf: Integer;
  list: TStrings;
begin
  Result := False;
  try

    list := NewStringList(True);
    codNf := 0;

    for I := 0 to autoC195.Count - 1 do
    begin
      if codNf <> autoC195.Items[I].cod_nf then
      begin
        codNf := autoC195.Items[I].cod_nf;

        numNf :=
          reg1921.queryCons
            .Table('notafiscal_sped_c195_c197 c', 'first 1 n.num_nf')
            .Join('notafiscal n', 'n.cod_nf = c.cod_nf and n.cod_empresa = c.cod_empresa')
            .Equals('c.cod_nf', autoC195.Items[I].cod_nf)
            .Equals('c.cod_empresa', autoC195.Items[I].cod_empresa)
            .Equals('c.cod_aj', autoC195.Items[I].cod_aj)
            .Scalar().AsInteger;
        if numNf > 0 then
          list.Add(Format('Já existe ajuste de Lançamento(C197) %s para a nota fiscal %d', [autoC195.Items[I].cod_aj, numNf]));
      end;
    end;

    for I := 0 to auto1921.Count - 1 do
    begin
      numNf :=
        reg1921.queryCons
          .Table('notafiscal n', 'first 1 n.num_nf')
          .Join('efd_1921 e', 'e.ref_id = n.guidt and e.cod_empresa = n.cod_empresa')
          .Equals('n.guidt', auto1921.Items[I].ref_id)
          .Equals('n.cod_empresa', auto1921.Items[I].cod_empresa)
          .Scalar().AsInteger;
      if numNf > 0 then
        list.Add(Format('Já existe ajuste de Subapuração(1921) %s para a nota fiscal %d', [auto1921.Items[I].cod_ajuste, numNf]));
    end;

    for I := 0 to auto1921.Count - 1 do
    begin
      numNf :=
        reg1921.queryCons
        
          .Table('notafiscal_item ni', 'first 1 n.num_nf')
          .Join('notafiscal n', 'n.cod_nf = ni.cod_nf and n.cod_empresa = ni.cod_empresa')
          .Join('efd_1921 e', 'e.ref_id = ni.guidt and e.cod_empresa = ni.cod_empresa')
          .Equals('ni.guidt', auto1921.Items[I].ref_id)
          .Equals('ni.cod_empresa', auto1921.Items[I].cod_empresa)
          .Scalar().AsInteger;
      if numNf > 0 then
        list.Add(Format('Já existe ajuste de Subapuração(1921) %s para a nota fiscal %d', [auto1921.Items[I].cod_ajuste, numNf]));
    end;

    if list.Count > 0 then
      ShowAtencao(list.Text);

    Result := list.Count = 0;

  except on E: Exception do
    begin
      Result := False;
      vC195_C197.registraErro('TSpedFiscalNF.ValidarRegistrosAutomaticos: ' + E.Message);
      ShowAtencao('Erro ao validar registros aumático: ' + E.Message );
    end;
  end; 
end;

function TSpedFiscalNF.VerificarAjustesAutoAposConfirmacao: Boolean;
var
  nGerado: string;
begin
  if FOwner.fdif('status', stsFechada) then
    Exit; 

  nGerado := IfThen(FOwner.fequals('natureza_nf', 'S'), 'S', FOwner.fstr('num_gerado'));

  if (FOwner.fequals('modelo_nf', '55') and FOwner.fequals('emissao_propria', 'S') and (nGerado = 'S') and FOwner.fequals('situacao_nfe', sitAutorizada))
    or (FOwner.fdif('modelo_nf', '55') and FOwner.fequals('emissao_propria', 'S') and (nGerado = 'S') and FOwner.fequals('status', stsFechada))
    or (FOwner.fequals('emissao_propria', 'N') and FOwner.fequals('status', stsFechada))
  then
  begin
    Application.CreateForm(TfrmCadNF_AjustesFiscais, frmCadNF_AjustesFiscais);
    frmCadNF_AjustesFiscais.sped := Self;
//    frmCadNF_AjustesFiscais.itemNf := Self.vItem;

    Self.vC195_C197.abreC195_C197(FOwner.fint('cod_nf'));
    Self.reg1921.OpenByCodNf(FOwner.fint('cod_nf'));

    try
      frmCadNF_AjustesFiscais.VerificarAjustesAutomaticosAposConfimacaoNF();

    finally
      FreeAndNil(frmCadNF_AjustesFiscais);
    end;

    FOwner.CommitaTransacao;
  end;
end;

{ TSpedFiscalNF_C115 }

function TSpedFiscalNF_C115.abreC115(cod_nf, cod_inf: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_sped_c115 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_inf = ' + IntToStr(cod_inf) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TSpedFiscalNF_C115.abreC115(cod_nf: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_sped_c115 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TSpedFiscalNF_C115.create;
begin
  dataSet := tclientDataSet(DtmSpedNF.cdsC115);
  transacao := tibtransaction(DtmNF.transacaoNF);
  buscas := tibquery(DtmNF.qrBuscas);
  vCidCol := TClientDataSet(dtmSpedNf.cdsCidCol);
  vCidEnt := TClientDataSet(dtmSpedNf.cdsCidEnt);
end;

function TSpedFiscalNF_C115.delete: boolean;
var
  I: Integer;
begin
  if inherited delete then
    Apply;
  i := 0;
  dataSet.First;
  while not dataset.eof do
  begin
    I := i + 1;
    dataSet.edit;
    dataSet.FieldByName('nitem').AsInteger := I;
    dataSet.Post;
    dataSet.next;
  end;
end;

destructor TSpedFiscalNF_C115.Destroy;
begin
  vCidCol.Close;
  vCidEnt.Close;
  inherited;
end;

function TSpedFiscalNF_C115.edit: boolean;
begin
  Result := inherited edit;
  if Result then
  begin
    existeUF('C');
    existeUF('E');
  end;
end;

function TSpedFiscalNF_C115.existeUF(coletaOuEntrega: string): boolean;
var
  vSigla: string;
  vSql: string;
begin
  if coletaOuEntrega = 'C' then
    vSigla := Trim(dataSet.FieldByName('UF_COL').AsString)
  else
    vSigla := Trim(dataSet.FieldByName('UF_ENTG').AsString);
  if vSigla = '' then
    exit;
  buscas.close;
  buscas.SQL.Text := 'select es.sigla_uf, es.ibge_codigo_uf from estados es' +
    ' where es.sigla_uf = ' + QuotedStr(vSigla);
  buscas.Open;
  if (buscas.IsEmpty) or (Trim(buscas.FieldByName('ibge_codigo_uf').AsString) = '') then
  begin
    Application.MessageBox('Estado não encontrado ou não definido o código IBGE', 'Atenção', 0
      + 64);
    buscas.Close;
    exit;
  end;

  vSql := 'select * from cidades_ibge ci where ci.codigo_uf_ibge = ' +
    buscas.FieldByName('ibge_codigo_uf').AsString +
    ' order by ci.nome_municipio';
  if coletaOuEntrega = 'C' then
  begin
    vCidCol.close;
    vCidCol.CommandText := vsql;
    vCidCol.Open;
  end
  else
  begin
    vCidEnt.close;
    vCidEnt.CommandText := vsql;
    vCidEnt.Open;
  end;
  buscas.Close;
end;

function TSpedFiscalNF_C115.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if (Trim(dataSet.FieldByName('COD_MUN_COL').AsString) <> '') then
      dataSet.FieldByName('nfe_xmun_col').AsString :=
        vCidCol.FieldByName('nome_municipio').AsString;
    if (Trim(dataSet.FieldByName('COD_MUN_ENTG').AsString) <> '') then
      dataSet.FieldByName('nfe_xmun_entg').AsString :=
        vCidEnt.FieldByName('nome_municipio').AsString;
    if Trim(dataSet.FieldByName('IE_COL').AsString) = '' then
      dataSet.FieldByName('IE_COL').AsString := 'ISENTO';
    if Trim(dataSet.FieldByName('IE_entG').AsString) = '' then
      dataSet.FieldByName('IE_ENTG').AsString := 'ISENTO';

    if Trim(dataSet.FieldByName('IND_CARGA').AsString) = '' then
      raise exception.create('Indicador do tipo de transporte');

    if (Trim(dataSet.FieldByName('CNPJ_COL').AsString) <> '') or
      (Trim(dataSet.FieldByName('CPF_COL').AsString) <> '') or
      (Trim(dataSet.FieldByName('COD_MUN_COL').AsString) <> '') or
      (Trim(dataSet.FieldByName('UF_COL').AsString) <> '') or
      (Trim(dataSet.FieldByName('nfe_xlgr_col').AsString) <> '') or
      (Trim(dataSet.FieldByName('nfe_nro_col').AsString) <> '') or
      (Trim(dataSet.FieldByName('nfe_xbairro_col').AsString) <> '') or
      (Trim(dataSet.FieldByName('nfe_xmun_col').AsString) <> '') then
    begin
      if (Trim(dataSet.FieldByName('CNPJ_COL').AsString) = '') and
        (Trim(dataSet.FieldByName('CPF_COL').AsString) = '') then
        raise exception.create('Coleta. CNPJ e CPF não informado. Informar um dos dois');
      if (Trim(dataSet.FieldByName('CNPJ_COL').AsString) <> '') and
        (Trim(dataSet.FieldByName('CPF_COL').AsString) <> '') then
        raise exception.create('Coleta. CNPJ e CPF informados. Informar apenas um dos dois');
      if (Trim(dataSet.FieldByName('CNPJ_COL').AsString) <> '') then
        if not cgc(Trim(dataSet.FieldByName('CNPJ_COL').AsString)) then
          raise exception.create('Coleta. CNPJ informado inválido');
      if (Trim(dataSet.FieldByName('CPF_COL').AsString) <> '') then
        if not Cpf(Trim(dataSet.FieldByName('CPF_COL').AsString)) then
          raise exception.create('Coleta. CPF informado inválido');
      if Trim(dataSet.FieldByName('COD_MUN_COL').AsString) = '' then
        raise exception.create('Coleta. Municipio não informado');
      if Trim(dataSet.FieldByName('UF_COL').AsString) = '' then
        raise exception.create('Coleta. Sigla UF não informada');
      if Trim(dataSet.FieldByName('nfe_xlgr_col').AsString) = '' then
        raise exception.create('Coleta. Logradouro não informado');
      if Trim(dataSet.FieldByName('nfe_nro_col').AsString) = '' then
        raise exception.create('Coleta. Número não informado');
      if Trim(dataSet.FieldByName('nfe_xbairro_col').AsString) = '' then
        raise exception.create('Coleta. Bairro não informado');
      if Trim(dataSet.FieldByName('nfe_xmun_col').AsString) = '' then
        raise exception.create('Coleta. Município não informado');
      if ConsisteInscricaoEstadual(Trim(dataSet.FieldByName('IE_COL').AsString),
        Trim(dataSet.FieldByName('UF_COL').AsString)) <> 0 then
        EXIT;

    end;
    if (Trim(dataSet.FieldByName('CNPJ_ENTG').AsString) <> '') or
      (Trim(dataSet.FieldByName('CPF_ENTG').AsString) <> '') or
      (Trim(dataSet.FieldByName('COD_MUN_ENTG').AsString) <> '') or
      (Trim(dataSet.FieldByName('UF_ENTG').AsString) <> '') or
      (Trim(dataSet.FieldByName('nfe_xlgr_ENTG').AsString) <> '') or
      (Trim(dataSet.FieldByName('nfe_nro_ENTG').AsString) <> '') or
      (Trim(dataSet.FieldByName('nfe_xbairro_ENTG').AsString) <> '') or
      (Trim(dataSet.FieldByName('nfe_xmun_ENTG').AsString) <> '') then
    begin
      if (Trim(dataSet.FieldByName('CNPJ_entg').AsString) = '') and
        (Trim(dataSet.FieldByName('CPF_entg').AsString) = '') then
        raise exception.create('Entrega. CNPJ e CPF não informado. Informar um dos dois');
      if (Trim(dataSet.FieldByName('CNPJ_entg').AsString) <> '') and
        (Trim(dataSet.FieldByName('CPF_entg').AsString) <> '') then
        raise exception.create('Entrega. CNPJ e CPF informados. Informar apenas um dos dois');
      if (Trim(dataSet.FieldByName('CNPJ_ENTG').AsString) <> '') then
        if not cgc(Trim(dataSet.FieldByName('CNPJ_ENTG').AsString)) then
          raise exception.create('Entrega. CNPJ informado inválido');
      if (Trim(dataSet.FieldByName('CPF_ENTG').AsString) <> '') then
        if not Cpf(Trim(dataSet.FieldByName('CPF_ENTG').AsString)) then
          raise exception.create('Entrega. CPF informado inválido');
      if Trim(dataSet.FieldByName('COD_MUN_entg').AsString) = '' then
        raise exception.create('Entrega. Municipio não informado');
      if Trim(dataSet.FieldByName('UF_entg').AsString) = '' then
        raise exception.create('Entrega. Sigla UF não informada');
      if Trim(dataSet.FieldByName('nfe_xlgr_entg').AsString) = '' then
        raise exception.create('Entrega. Logradouro não informado');
      if Trim(dataSet.FieldByName('nfe_nro_entg').AsString) = '' then
        raise exception.create('Entrega. Número não informado');
      if Trim(dataSet.FieldByName('nfe_xbairro_entg').AsString) = '' then
        raise exception.create('Entrega. Bairro não informado');
      if Trim(dataSet.FieldByName('nfe_xmun_entg').AsString) = '' then
        raise exception.create('Entrega. Município não informado');
      if ConsisteInscricaoEstadual(Trim(dataSet.FieldByName('IE_ENTG').AsString),
        Trim(dataSet.FieldByName('UF_ENTG').AsString)) <> 0 then
        EXIT;
    end;
    if (Trim(dataSet.FieldByName('CNPJ_ENTG').AsString) = '') and
      (Trim(dataSet.FieldByName('CPF_ENTG').AsString) = '') then
      dataSet.FieldByName('IE_ENTG').AsString := '';
    if (Trim(dataSet.FieldByName('CNPJ_COL').AsString) = '') and
      (Trim(dataSet.FieldByName('CPF_COL').AsString) = '') then
      dataSet.FieldByName('IE_COL').AsString := '';

    if (Trim(dataSet.FieldByName('CNPJ_COL').AsString) <> '') and
      (Trim(dataSet.FieldByName('CNPJ_ENTG').AsString) <> '') then
      if Trim(dataSet.FieldByName('CNPJ_COL').AsString) =
        Trim(dataSet.FieldByName('CNPJ_ENTG').AsString) then
        raise exception.create('Mesmo CNPJ para Coleta e Entrega');

    if (Trim(dataSet.FieldByName('CPF_COL').AsString) <> '') and
      (Trim(dataSet.FieldByName('CPF_ENTG').AsString) <> '') then
      if Trim(dataSet.FieldByName('CPF_COL').AsString) =
        Trim(dataSet.FieldByName('CPF_ENTG').AsString) then
        raise exception.create('Mesmo CPF para Coleta e Entrega');

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    Refresh;
    result := true;
  except on e: exception do
    begin
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Cupom fiscal informado duplicado',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;

{ TSpedFiscalNF_C114 }

function TSpedFiscalNF_C114.abreC114(cod_nf, cod_inf: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_sped_c114 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_inf = ' + IntToStr(cod_inf) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TSpedFiscalNF_C114.abreC114(cod_nf: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_sped_c114 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TSpedFiscalNF_C114.create;
begin
  dataSet := tclientDataSet(DtmSpedNF.cdsC114);
  transacao := tibtransaction(DtmNF.transacaoNF);
  buscas := tibquery(DtmNF.qrBuscas);
end;

function TSpedFiscalNF_C114.delete: boolean;
begin
  if inherited delete then
    Apply;
end;

function TSpedFiscalNF_C114.GetTextoInformacaoComplementar(
  Atxt: string): string;
var
  Atemp: string;
begin

  if Pos('[@', Atxt) = 0 then
  begin
    Result := Atxt;
    Exit;
  end; 

  Result := '';

  prepare_loop();
  try
    while not dataSet.Eof do
    begin
      Atemp := StringReplace(Atxt , '[@ECF_CX]' , fstr('ecf_cx'), [rfReplaceAll, rfIgnoreCase]);
      Atemp := StringReplace(Atemp, '[@ECF_FAB]', fstr('ecf_fab'), [rfReplaceAll, rfIgnoreCase]);
      Atemp := StringReplace(Atemp, '[@NUM_DOC]', fstr('num_doc'), [rfReplaceAll, rfIgnoreCase]);
      Atemp := StringReplace(Atemp, '[@ECF_FAB]', fstr('ecf_fab'), [rfReplaceAll, rfIgnoreCase]);
      Atemp := StringReplace(Atemp, '[@COD_MOD]', fstr('cod_mod'), [rfReplaceAll, rfIgnoreCase]);
      Atemp := StringReplace(Atemp, '[@DT_DOC]' , FormatDateTime('DD/MM/YYYY', fdate('dt_doc')), [rfReplaceAll, rfIgnoreCase]);

      Result := IfThen(Result <> '', ',') + Atemp;

      dataSet.Next;
    end;
  finally
    prepare_loop_done;
  end;
end;

function TSpedFiscalNF_C114.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if Trim(dataSet.FieldByName('COD_MOD').AsString) = '' then
      raise exception.create('Modelo do documento não informado');
    if Trim(dataSet.FieldByName('ECF_FAB').AsString) = '' then
      raise exception.create('Número de Fabricação do ECF não informado');
    if Trim(dataSet.FieldByName('NUM_DOC').AsString) = '' then
      raise exception.create('Numero do Documento fiscal não informada');
    if Trim(dataSet.FieldByName('DT_DOC').AsString) = '' then
      raise exception.create('Data do documento não informada');
    if Trim(dataSet.FieldByName('ECF_CX').AsString) = '' then
      raise exception.create('Numero do Caixa não informado');

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    Refresh;
    result := true;
  except on e: exception do
    begin
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Cupom fiscal informado duplicado',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;

{ TSpedFiscalNF_C113 }

function TSpedFiscalNF_C113.abreC113(cod_nf, cod_inf: integer): boolean;
begin
  fCOD_NF := cod_nf;
  Result := montaSelect('select * from notafiscal_sped_c113 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_inf = ' + IntToStr(cod_inf) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
  abreNFSped;
end;

function TSpedFiscalNF_C113.abreC113(cod_nf: integer): boolean;
begin
  fCOD_NF := cod_nf;
  Result := montaSelect('select * from notafiscal_sped_c113 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
  abreNFSped;
end;

procedure TSpedFiscalNF_C113.abreNFSped;
var
  vTemp: string;
begin
//  if dataSet.IsEmpty then
//  begin
//    cdsGridNfSped.Close;
//    exit;
//  end;
  vTemp := '';
  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('cod_nf_ref').AsInteger > 0 then
      vTemp := vTemp + IfThen(vTemp = '', '(', ',') + dataSet.FieldByName('cod_nf_ref').AsString;
    dataSet.Next;
  end;
  vTemp := vTemp + IfThen(vTemp <> '', ')');
  cdsGridNfSped.Close;
  cdsGridNfSped.CommandText :=
    IfThen( vTemp <> '',
    'select nf.cod_nf, nf.natureza_nf, nf.tipo_nf, nf.num_nf, cast(nf.serie as varchar(11)) serie, cast(nf.modelo_nf as varchar(11)) modelo_nf,' +
    ' cl.cod_cliente, cl.nome_cliente, nf.chave_nfe chave_nfe_ref' +
    ' from notafiscal nf' +
    ' inner join clientes cl on cl.cod_cliente =  nf.cod_cliente and cl.cod_empresa =' +
    ' nf.cod_empresa' +
    ' where nf.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf.cod_nf in ' + vTemp +
    ' union ' ) +
    ' select nf3.cod_nf_ref as cod_nf, null as natureza_nf, null as tipo_nf, nf3.nnf as num_nf,' +
    ' cast(nf3.serie as varchar(11)) serie, cast(nf3.modelo as varchar(11)) as modelo_nf, 0 as cod_cliente, nf3.cnpj as nome_cliente, nf3.chave_nfe_ref' +
    ' from notafiscal_sped_c113 nf3' +
    ' where nf3.cod_nf = ' + IntToStr(fCOD_NF) + ' and nf3.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cod_nf_ref <= 0';
  cdsGridNfSped.Open;
end;

procedure TSpedFiscalNF_C113.COD_NF_REFGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if StrToIntDef(Text, -1) < 0  then
    Text := '';
end;

constructor TSpedFiscalNF_C113.create(AOwner: TSpedFiscalNF_C110);
begin
  FOwner := AOwner;
  dataSet := tclientDataSet(DtmSpedNF.cdsC113);
  transacao := tibtransaction(DtmNF.transacaoNF);
  buscas := tibquery(DtmNF.qrBuscasNF);
  cdsGridNfSped := TClientDataSet(DtmSpedNF.cdsNFSped);
  dtmSpedNf.qrNFSped.Transaction := transacao;
  dataSet.FieldByName('COD_NF_REF').OnGetText := COD_NF_REFGetText;
end;

function TSpedFiscalNF_C113.delete: boolean;
begin
  if dataSet.Locate('cod_nf_ref', cdsGridNfSped.FieldByName('cod_nf').AsInteger, []) then
    if inherited delete then
    begin
      Apply;
      abreNFSped;
    end;
end;

function TSpedFiscalNF_C113.existeNotaFiscal(vNatureza, vSerie: string; vNumNf,
  vCodCliente: integer): boolean;
begin
  Result := False;
  try
    if (copy(vNatureza, 1, 1) <> 'E') and (copy(vNatureza, 1, 1) <> 'S') then
      exit;
    if Trim(vSerie) = '' then
      Exit;
    if vNumNf = 0 then
      exit;
    if vCodCliente = 0 then
      exit;
    buscas.Close;
    buscas.SQL.Text := 'select cod_nf from notafiscal where natureza_nf = ' +
      QuotedStr(copy(vNatureza, 1, 1)) +
      ' and num_nf = ' + IntToStr(vNumNf) + ' and serie = ' + QuotedStr(vSerie) +
      ' and cod_cliente = ' +
      IntToStr(vCodCliente) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    fCod_Nf_Ref := 0;
    if buscas.IsEmpty then
    begin
      Application.MessageBox('Nota Fiscal não encontrada', 'Atenção', MB_ICONINFORMATION +
        MB_OK);
      Exit;
    end;
    fCod_Nf_Ref := buscas.FieldByName('cod_nf').AsInteger;
    Result := True;
  finally
    buscas.Close;
  end;
end;

function TSpedFiscalNF_C113.getCliente(vCodCliente: integer): string;
begin
  Result := retornaValor('select nome_cliente as valor from clientes where cod_cliente = ' +
    IntToStr(vCodCliente) + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TSpedFiscalNF_C113.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if dataSet.FieldByName('cod_nf_ref').AsInteger = 0 then
      dataSet.FieldByName('cod_nf_ref').AsInteger := fCod_Nf_Ref;

    if dataSet.FieldByName('cod_nf_ref').AsInteger = 0 then
      raise exception.create('Nota Fiscal referenciada não encontrada');

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;

    if MatchText(FOwner.fstr('tipo'), [sInfCplNFE, sInfCplNFCE]) then
    begin
      FOwner.dataSet.Edit;
      if FOwner.fequals('tipo', sInfCplNFE) then
        FOwner.dataSet.FieldByName('txt_compl').AsString := GetTextoInformacaoComplementar_NFE(FOwner.fstr('txt_compl'))
      else
        FOwner.dataSet.FieldByName('txt_compl').AsString := GetTextoInformacaoComplementar_NFCE(FOwner.fstr('txt_compl'));
      FOwner.dataSet.Post;
      Apply;
    end;

    Refresh;
    result := true;
    abreNFSped;
  except on e: exception do
    begin
      dataSet.Cancel;
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Nota Fiscal referenciada duplicada',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;

function TSpedFiscalNF_C113.salvarReferenciaModelo01ou02(
  Anota: TNotafiscal_sped_c113_class): Boolean;
var
  ARepetida: Boolean;
  Aaamm: Integer;
begin
  try
    Result := false;

    if Anota.nnf <= 0 then
      raiseExceptionCreate('Número da nota fiscal não informado', '');

    if not(Anota.modelo in [1, 2]) then
      raiseExceptionCreate('Modelo informado inválido', '');

    if (Anota.serie < 0) or (Anota.serie > 999) then
      raiseExceptionCreate('Série informada inválida', '');

    if vDadosIni.IBGEtoUF(Anota.cuf) = '' then
      raiseExceptionCreate('UF informada inválida', '');

    Aaamm := StrToIntDef(Copy(Anota.aamm, 3, 2), -1);
    if (Aaamm < 0) or ( Aaamm > 12) then
      raiseExceptionCreate('Mês de emissão da nota inválido', '');

    Aaamm := StrToIntDef(Copy(Anota.aamm, 1, 2), -1);
    if (Aaamm < 0) then
      raiseExceptionCreate('Ano de emissão da nota inválido', '');

    if Length(Trim(Anota.cnpj)) <> 14 then
      raiseExceptionCreate('CNPJ informado inválido', '')
    else if (not cgc(Trim(Anota.cnpj))) then
      raiseExceptionCreate('CNPJ informado inválido', '');

    ARepetida := False;
    cdsGridNfSped.First;
    while not cdsGridNfSped.Eof do
    begin
      if (cdsGridNfSped.FieldByName('num_nf').AsInteger = Anota.nnf) and
        (cdsGridNfSped.FieldByName('modelo_nf').AsInteger = Anota.modelo) and
        (cdsGridNfSped.FieldByName('serie').AsInteger = Anota.serie) then
      begin
        ARepetida := True;
        Break;
      end;
      cdsGridNfSped.Next;
    end;
    if ARepetida then
      if vDadosIni.ShowConfirmacao('Já exites referencia com mesmo numero, modelo e série. Continuar?') <> IDYES then
        Exit;


    SqlExec('INSERT INTO NOTAFISCAL_SPED_C113 (COD_NF, COD_EMPRESA, COD_INF, COD_NF_REF, NNF, MODELO, SERIE, CUF, AAMM, CNPJ)' +
            ' VALUES (' +
            IntToStr(FOwner.dataSet.FieldByName('COD_NF').AsInteger) + ', ' +
            IntToStr(FOwner.dataSet.FieldByName('COD_EMPRESA').AsInteger) + ', ' +
            IntToStr(FOwner.dataSet.FieldByName('COD_INF').AsInteger) + ', ' +
            '0 - (select cod from incrementa_codigo(' + vDadosIni.codEmpresa + ', ' + QuotedStr('NOTAFISCAL_SPED_C113_CHVNFE') + '))' + ', ' +
            IntToStr(Anota.nnf) + ', ' +
            IntToStr(Anota.modelo) + ', ' +
            IntToStr(Anota.serie) + ', ' +
            IntToStr(Anota.cuf) + ', ' +
            QuotedStr(Anota.aamm) + ', ' +
            QuotedStr(Anota.cnpj) + ')');

    Refresh;
    Result := True;
    abreNFSped;
  except on e: exception do
    begin
      dataSet.Cancel;
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Nota Fiscal referenciada duplicada',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;

function TSpedFiscalNF_C113.salvarReferenciaPelaChaveNFe(
  ChaveNfe: string): Boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select cod from incrementa_codigo(' + vDadosIni.codEmpresa + ', ' + QuotedStr('NOTAFISCAL_SPED_C113_CHVNFE') + ')';
    buscas.Open;

    dataSet.FieldByName('cod_nf_ref').AsInteger := 0 - buscas.FieldByName('cod').AsInteger;// * -1;
    dataSet.FieldByName('chave_nfe_ref').AsString := ChaveNfe;

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;

    if MatchText(FOwner.fstr('tipo'), [sInfCplNFE, sInfCplNFCE]) then
    begin
      FOwner.dataSet.Edit;
      if FOwner.fequals('tipo', sInfCplNFE) then
        FOwner.dataSet.FieldByName('txt_compl').AsString := GetTextoInformacaoComplementar_NFE(FOwner.fstr('txt_compl'))
      else
        FOwner.dataSet.FieldByName('txt_compl').AsString := GetTextoInformacaoComplementar_NFCE(FOwner.fstr('txt_compl'));
      FOwner.dataSet.Post;
      Apply;
    end;

    Refresh;
    result := true;
    abreNFSped;
  except on e: exception do
    begin
      dataSet.Cancel;
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Nota Fiscal referenciada duplicada',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;

function TSpedFiscalNF_C113.getNotaFiscalDaPesquisa: string;
begin
  Result := '';
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NOTAFISCAL');

  if StrToIntDef(Trim(vDadosIni.vPesquisa), -1) > 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select nf.natureza_nf, nf.num_nf, nf.serie, nf.cod_cliente,' +
      ' cl.nome_cliente from notafiscal nf' +
      ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
      ' where nf.cod_nf = ' + vDadosIni.vPesquisa +
      ' and nf.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    Result := '|' +
      vDadosIni.IfThen(buscas.FieldByName('natureza_nf').AsString = 'E', 'Entrada', 'Saida') + '|' +
      IntToStr(buscas.FieldByName('num_nf').AsInteger) + '|' +
      Trim(buscas.FieldByName('serie').AsString) + '|' +
      IntToStr(buscas.FieldByName('cod_cliente').AsInteger) + '|' +
      Trim(buscas.FieldByName('nome_cliente').AsString) + '|';
  end;
end;

function TSpedFiscalNF_C113.GetTextoInformacaoComplementar_NFE(
  Atxt: string): string;
var
  Atemp: string;
begin

  if Pos('[@', Atxt) = 0 then
  begin
    Result := Atxt;
    Exit;
  end;

  Result := '';

  prepare_loop();
  try
    while not dataSet.Eof do
    begin

      SqlOpen('select nf.chave_nfe chave_nfe_ref from notafiscal_sped_c113 nfr' +
              ' inner join notafiscal nf on nf.cod_nf = nfr.cod_nf_ref and nf.cod_empresa = nfr.cod_empresa and nf.modelo_nf = ''55''' +
              ' where nfr.cod_nf = %d and nfr.cod_empresa = %s and nfr.cod_nf_ref > 0' +
              ' union' +
              ' select nfr.chave_nfe_ref from notafiscal_sped_c113 nfr' +
              ' where nfr.cod_nf = %d and nfr.cod_empresa = %s and nfr.cod_nf_ref < 0' +
              ' and coalesce(nfr.chave_nfe_ref, '''') <> '''' ',
              [fint('cod_nf'), vDadosIni.codEmpresa, fint('cod_nf'), vDadosIni.codEmpresa]);
      if (not buscas.IsEmpty) and
         (Copy(buscas.FieldByName('chave_nfe_ref').AsString, 21, 2) = '55' ) then
      begin
        Atemp := StringReplace(Atxt , '[@CHAVE_NFE_REF]' , buscas.FieldByName('CHAVE_NFE_REF').AsString, [rfReplaceAll, rfIgnoreCase]);
//        Atemp := StringReplace(Atemp, '[@NNF]', fstr('NNF'), [rfReplaceAll, rfIgnoreCase]);
//        Atemp := StringReplace(Atemp, '[@MODELO]', fstr('MODELO'), [rfReplaceAll, rfIgnoreCase]);
//        Atemp := StringReplace(Atemp, '[@SERIE]', fstr('SERIE'), [rfReplaceAll, rfIgnoreCase]);
//        Atemp := StringReplace(Atemp, '[@CUF]', fstr('CUF'), [rfReplaceAll, rfIgnoreCase]);
//        Atemp := StringReplace(Atemp, '[@AAMM]', fstr('AAMM'), [rfReplaceAll, rfIgnoreCase]);
//        Atemp := StringReplace(Atemp, '[@CNPJ]', fstr('CNPJ'), [rfReplaceAll, rfIgnoreCase]);

        Result := IfThen(Result <> '', ',') + Atemp;
      end;

      dataSet.Next;
    end;
  finally
    prepare_loop_done;
  end;
end;

function TSpedFiscalNF_C113.GetTextoInformacaoComplementar_NFCE(
  Atxt: string): string;
var
  Atemp: string;
begin

  if Pos('[@', Atxt) = 0 then
  begin
    Result := Atxt;
    Exit;
  end;

  Result := '';


  prepare_loop();
  try
    while not dataSet.Eof do
    begin
      if Copy(fstr('chave_nfe_ref'), 21, 2) = '65' then
      begin
        Atemp := StringReplace(Atxt , '[@CHAVE_NFE_REF]' , fstr('chave_nfe_ref'), [rfReplaceAll, rfIgnoreCase]);

        Result := Result + IfThen(Result <> '', ',') + Atemp;
      end;

      dataSet.Next;
    end;
  finally
    prepare_loop_done;
  end;
end;

{ TSpedFiscalNF_C112 }

function TSpedFiscalNF_C112.abreC112(cod_nf, cod_inf: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_sped_c112 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_inf = ' + IntToStr(cod_inf) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TSpedFiscalNF_C112.create;
begin
  dataSet := tclientDataSet(DtmSpedNF.cdsC112);
  transacao := tibtransaction(DtmNF.transacaoNF);
  buscas := tibquery(DtmNF.qrBuscas);
end;

function TSpedFiscalNF_C112.delete: boolean;
var
  I: Integer;
begin
  if inherited delete then
    Apply;
  i := 0;
  dataSet.First;
  while not dataset.eof do
  begin
    I := i + 1;
    dataSet.edit;
    dataSet.FieldByName('nitem').AsInteger := I;
    dataSet.Post;
    dataSet.next;
  end;
end;

function TSpedFiscalNF_C112.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if Trim(dataSet.FieldByName('COD_DA').AsString) = '' then
      raise exception.create('Código do modelo do documento de arrecadação não informado');
    if Trim(dataSet.FieldByName('UF').AsString) = '' then
      raise exception.create('Unidade federada beneficiária do recolhimento não informada');

    if Trim(dataSet.FieldByName('NUM_DA').AsString) = '' then
      if Trim(dataSet.FieldByName('COD_AUT').AsString) = '' then
        raise exception.create('Código completo da autenticação bancária não informado');
    if Trim(dataSet.FieldByName('VL_DA').AsString) = '' then
      raise exception.create('Valor do total do documento de arrecadação não informado');
    if Trim(dataSet.FieldByName('DT_VCTO').AsString) = '' then
      raise exception.create('Data de vencimento do documento de arrecadação não informada');
    if Trim(dataSet.FieldByName('DT_PGTO').AsString) = '' then
      raise
        exception.create('Data de pagamento ou data do vencimento, no caso de ICMS, não informada');

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    Refresh;
    result := true;
  except on e: exception do
    begin
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Identificação do processo ou ato concessório Duplicado',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;

{ TSpedFiscalNF_C111 }

function TSpedFiscalNF_C111.abreC111(cod_nf, cod_inf: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_sped_c111 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_inf = ' + IntToStr(cod_inf) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TSpedFiscalNF_C111.create;
begin
  dataSet := tclientDataSet(DtmSpedNF.cdsC111);
  transacao := tibtransaction(DtmNF.transacaoNF);
  buscas := tibquery(DtmNF.qrBuscas);
end;

function TSpedFiscalNF_C111.delete: boolean;
begin
  if inherited delete then
    Apply;
end;

function TSpedFiscalNF_C111.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if Trim(dataSet.FieldByName('num_proc').AsString) = '' then
      raise exception.create('Identificação do processo ou ato concessório não informado');
    if Trim(dataSet.FieldByName('ind_proc').AsString) = '' then
      raise exception.create('Indicador da origem do processo não informado');

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    Refresh;
    result := true;
  except on e: exception do
    begin
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Identificação do processo ou ato concessório Duplicado',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;

{ TSpedFiscalNF_C110 }

function TSpedFiscalNF_C110.abreC110(cod_nf: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_sped_c110 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
  if not vInfCompl.dataSet.Active then
    vInfCompl.abreInfComplementar;
end;

function TSpedFiscalNF_C110.adicinarInfComplDeOlhoNoImposto(
  nota: TDataSet_OOP): boolean;
var
  vTem, vTemDeOlhoImposto, vTemInfCompl: Boolean;
  vTempText: string;
begin

  Result := True;

  vTemInfCompl := False;
  vTemDeOlhoImposto := vDadosIni.StrToFloatFormat(nota.dataSet.FieldByName('VTOTTRIB').AsFloat, 2) > 0;

  vInfCompl.abreInfComplementarDeOlhoNoImposto;
  if vTemDeOlhoImposto then
    if vInfCompl.dataSet.IsEmpty then
    begin
      buscas.Close;
      buscas.SQL.Text := 'INSERT INTO SPED_INFORMACAO_COMPLEMENTAR' +
        ' (COD_INF, COD_EMPRESA, TXT, TXT_COMPL, TIPO, ATIVO) VALUES' +
        ' ( (SELECT COD FROM INCREMENTA_CODIGO(' + vDadosIni.codEmpresa +
        ', ''SPED_INFORMACAO_COMPLEMENTAR'')), ' + vDadosIni.codEmpresa +
        ', ''Val Aprox Tributos'', NULL, ' + QuotedStr(sInfCplDEOLHOIMPOSTO) + ', 1)';
      buscas.ExecSQL;

      vInfCompl.abreInfComplementarDeOlhoNoImposto;
      if vInfCompl.dataSet.IsEmpty then
      begin
        Result := False;
        Application.MessageBox(pchar(
          'Informação complementar para exibição dos Tributos (De Olho no Imposto) não encontrada no cadastro' + sLineBreak +
          'Acesse o menu "Cadastros > Cadastros Basicos > Informação Complementar" e faça um novo cadastro com o tipo "DE OLHO NO IMPOSTO"'),
          'Atenção', 0 + 64);
        Exit;
      end;
    end;

  if not dataSet.Active then
    abreC110(nota.dataSet.FieldByName('cod_nf').AsInteger);

  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('cod_inf').AsInteger =
      vInfCompl.dataSet.FieldByName('cod_inf').AsInteger then
    begin
      vTemInfCompl := True;
      if not vTemDeOlhoImposto then
        if nota.dataSet.FieldByName('consumidor_final').AsString <> 'S' then
        begin
          dataSet.Delete;
          Apply;
          Exit;
        end;
      Break;
    end;
    dataSet.Next;
  end;
  if not vTemDeOlhoImposto then
    exit;
  if not vTemInfCompl then
  begin
    dataSet.Insert;
    dataSet.FieldByName('cod_inf').AsInteger :=
      vInfCompl.dataSet.FieldByName('cod_inf').AsInteger;
    dataSet.FieldByName('cod_nf').AsInteger :=
      nota.dataSet.FieldByName('cod_nf').AsInteger;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  end
  else
    dataSet.Edit;

  dataSet.FieldByName('txt').AsString := '';
  dataSet.FieldByName('txt_compl').AsString :=
    'Val Aprox Tributos R$' + Format('%0.2n', [nota.dataSet.FieldByName('VTOTTRIB').AsFloat]) +
    ' (' + Format('%0.2f', [nota.dataSet.FieldByName('VTOTTRIB').AsFloat /
    nota.dataSet.FieldByName('VALOR_TOTAL').AsFloat * 100  ]) +
    '%) Fonte: IBPT';
  dataSet.Post;
  Apply;
end;

function TSpedFiscalNF_C110.adicionaInfComplCupom(nota: TDataSet_OOP): boolean;
var
  AExiste, AExisteCupons, AExisteInfCompl, AExisteNFCe: Boolean;
  ATextTemp: string;
  AListCupoms, AListNFCe: TStringList;
  I: Integer;
begin
  Result := False;
  AExisteCupons := False;
  AExisteNFCe := False;
  AExisteInfCompl := False;

  (nota as TNFCab).vItem.dataSet.First;
  while not (nota as TNFCab).vitem.dataset.eof do
  begin
    if ((nota as TNFCab).vItem.dataset.FieldByName('ncupom').asinteger > 0) and
      ((Trim((nota as TNFCab).vItem.dataset.FieldByName('nserieecf').AsString) <> '')) and
      ((nota as TNFCab).vItem.dataset.FieldByName('data_cupom').AsString <> '') then
    begin
      AExisteCupons := True;
      Break;
    end;
    (nota as TNFCab).vItem.dataSet.Next;
  end;
  (nota as TNFCab).vItem.dataSet.First;
  while not (nota as TNFCab).vitem.dataset.eof do
  begin
    if ((nota as TNFCab).vItem.dataset.FieldByName('cod_nfce').asinteger > 0) then
    begin
      AExisteNFCe := True;
      Break;
    end;
    (nota as TNFCab).vItem.dataSet.Next;
  end;

  if AExisteCupons then
  begin
    vInfCompl.abreInfComplementar(sInfCplCUPOM);
    if vInfCompl.dataSet.IsEmpty then
    begin
      ATextTemp := 'Informação complementar de cupons fiscais/NFC-e não encontrada no cadastro' + sLineBreak +
                     IfThen(AExisteCupons, 'Existem cupons fiscais a serem referenciados' + sLineBreak) +
                   IfThen(AExisteNFCe, 'Existem NFC-e''s a serem referenciadas');
      vDadosIni.ShowErro(ATextTemp);
      Exit;
    end;
  end;

  if not dataSet.Active then
    abreC110(nota.dataSet.FieldByName('cod_nf').AsInteger);
  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('cod_inf').AsInteger =
      vInfCompl.dataSet.FieldByName('cod_inf').AsInteger then
    begin
      AExiste := True;
      AExisteInfCompl := True;
      Break;
    end;
    dataSet.Next;
  end;
//  if AExisteCupons or AExisteNFCe then
  if AExisteCupons then
  begin
    if not AExiste then
    begin
      dataSet.Insert;
      dataSet.FieldByName('cod_inf').AsInteger :=
        vInfCompl.dataSet.FieldByName('cod_inf').AsInteger;
      dataSet.FieldByName('cod_nf').AsInteger :=
        nota.dataSet.FieldByName('cod_nf').AsInteger;
      dataSet.FieldByName('txt_compl').AsString :=
        vInfCompl.dataSet.FieldByName('txt_compl').AsString;
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.Post;
      Apply;
      AExisteInfCompl := True;
    end;
  end;

  AListCupoms := TStringList.Create;
  AListCupoms.Sorted := True;
  AListCupoms.Duplicates := dupIgnore;

  AListNFCe := TStringList.Create;
  AListNFCe.Sorted := True;
  AListNFCe.Duplicates := dupIgnore;

  if AExisteCupons then
  begin
    vC114.abreC114(dataSet.FieldByName('cod_nf').AsInteger,
      dataSet.FieldByName('cod_inf').AsInteger);

    try
      (nota as TNFCab).vItem.dataSet.First;
      while not (nota as TNFCab).vitem.dataset.eof do
      begin
        if ((nota as TNFCab).vItem.dataset.FieldByName('ncupom').asinteger > 0) and
          ((Trim((nota as TNFCab).vItem.dataset.FieldByName('nserieecf').AsString) <> '')) and
          ((nota as TNFCab).vItem.dataset.FieldByName('data_cupom').AsString <> '') then
        begin
          AExiste := False;
          AListCupoms.Add(vDadosIni.StrZero((nota as TNFCab).vItem.dataset.FieldByName('ncupom').AsInteger, 6));
          vC114.dataset.First;
          while not vC114.dataset.eof do
          begin
            if (vC114.dataset.fieldbyname('num_doc').asinteger =
              (nota as TNFCab).vitem.dataset.fieldbyname('ncupom').asinteger) and
              (vC114.dataset.fieldbyname('ecf_fab').asstring =
              (nota as TNFCab).vitem.dataset.FieldByName('nserieecf').AsString) and
              (vC114.dataset.fieldbyname('dt_doc').asstring =
              (nota as TNFCab).vitem.dataset.FieldByName('data_cupom').AsString) then
            begin
              AExiste := true;
              break;
            end;
            vC114.dataset.next;
          end;
          if not AExiste then
          begin
            if incluirC114 then
            begin
              vC114.dataset.fieldbyname('COD_MOD').AsString := '2D';
              vC114.dataset.fieldbyname('ECF_FAB').AsString :=
                (nota as TNFCab).vitem.dataset.FieldByName('nserieecf').AsString;
              vC114.dataset.fieldbyname('ECF_CX').AsString := '1';
              if (nota as TNFCab).vitem.dataset.FieldByName('terminal').AsInteger > 0 then
                vC114.dataset.fieldbyname('ECF_CX').AsString :=
                  (nota as TNFCab).vitem.dataset.FieldByName('terminal').AsString;
              vC114.dataset.fieldbyname('NUM_DOC').AsString :=
                (nota as TNFCab).vitem.dataset.FieldByName('ncupom').AsString;
              vC114.dataset.fieldbyname('DT_DOC').AsString :=
                (nota as TNFCab).vitem.dataset.FieldByName('data_cupom').AsString;
              vC114.Post;
            end;
          end;
        end;
        (nota as TNFCab).vitem.dataSet.next;
      end;
    except
      on e: exception do begin
        Result := False;
        Application.MessageBox(pchar('Erro ao adicionair Cupons Fiscais Referenciados.' + sLineBreak +
          'Favor adiciona-los manualmente'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      end;
    end;
  end;

  //NFC-e
  if AExisteNFCe then
  begin
    vInfCompl.abreInfComplementar(sInfCplNFCE);
    if vInfCompl.dataSet.IsEmpty then
    begin
      vDadosIni.ShowErro('Informação complementar de referencia a NFC-e do tipo "NFCE" não encontrada');
      Exit;
    end;
    vC113.abreC113(nota.fint('cod_nf'));
    try
      (nota as TNFCab).vItem.dataSet.First;
      while not (nota as TNFCab).vitem.dataset.eof do
      begin
        if ((nota as TNFCab).vItem.dataset.FieldByName('cod_nfce').asinteger > 0)  then
        begin
          SqlOpen('select chave_nfce, situacao_nfce from nfce' +
                  ' where cod_nfce = ' + IntToStr((nota as TNFCab).vItem.dataSet.FieldByName('cod_nfce').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa);
          if (buscas.FieldByName('chave_nfce').AsString <> '') then
          begin
            AListNFCe.Add(Trim(buscas.FieldByName('chave_nfce').AsString));

            vC113.filterStr('chave_nfe_ref = ' + QuotedStr(buscas.FieldByName('chave_nfce').AsString));
            try
              if vC113.IsEmpty then
              begin
                filterStr('cod_inf = %d', [vInfCompl.fint('cod_inf')]);
                if dataSet.IsEmpty then if not incluirC110 then Exit;
                if incluirC113 then
                  vC113.salvarReferenciaPelaChaveNFe(buscas.FieldByName('chave_nfce').AsString);
            end;
            finally
              vC113.filterClear;
              filterClear;
          end;
        end;
        end;
        (nota as TNFCab).vitem.dataset.Next;
      end;

    except
      on e: exception do begin
        Result := False;
        Application.MessageBox(pchar('Erro ao adicionair NFC-e''s referenciadas.' + sLineBreak +
          'Favor adiciona-los manualmente'), 'Atenção', MB_OK + MB_ICONINFORMATION);
      end;
    end;
  end;

  if AExisteCupons and AExisteInfCompl then
  begin
    vInfCompl.abreInfComplementar(sInfCplCUPOM, False);
    dataSet.Edit;
    dataSet.FieldByName('txt_compl').AsString := vC114.GetTextoInformacaoComplementar(vInfCompl.fstr('txt_compl') +
                                                                                      IfThen(Pos('[@NUM_DOC]', UpperCase(vInfCompl.fstr('txt_compl'))) = 0, ' [@NUM_DOC]'));
    dataSet.Post;
    Apply;
  end;

  if AExisteNFCe then
  begin
    vInfCompl.abreInfComplementar(sInfCplNFCE, False);
    dataSet.Edit;
    dataSet.FieldByName('txt_compl').AsString := vC113.GetTextoInformacaoComplementar_NFCE(vInfCompl.fstr('txt_compl'));
    dataSet.Post;
    Apply;
  end;

  {
  if AExisteInfCompl then
  begin
    ATextTemp := '';
    if AListCupoms.Count > 0 then
    begin
      ATextTemp := IfThen(AListCupoms.Count > 1, 'Cupons fiscais: ', 'Cupom fiscal: ');
      for I := 0 to AListCupoms.Count - 1 do
        ATextTemp := ATextTemp + IfThen(I > 0, ', ') + AListCupoms[I];
    end;

    if AListNFCe.Count > 0 then
    begin
      ATextTemp := IfThen(AListCupoms.Count > 0, ATextTemp + ';') +
                   IfThen(AListNFCe.Count > 1, 'NFC-e"s: ', 'NFC-e: ');
      for I := 0 to AListNFCe.Count - 1 do
        ATextTemp := ATextTemp + IfThen(I > 0, ', ') + AListNFCe[I];
    end;

    dataSet.Edit;
    dataSet.FieldByName('txt_compl').AsString := ATextTemp;
    dataSet.Post;
    Apply;
  end;
  }
  Result := True;
end;

function TSpedFiscalNF_C110.adicionaInfComplDesoneracaoICMS(nota: TDataSet_OOP): boolean;
var
  Acon: TConexao;
  Ainf: TSped_informacao_complementar_class;
begin
  Ainf := TSped_informacao_complementar_class.Create;
  Acon := TConexao.Create(dtmAtivo.bancoHw);
  try
    Ainf.SetValuesFrom(Acon.SqlOpen('select %s from %s where cod_empresa = %s and tipo = %s',
                                      [Ainf._tb.GetFieldsSql(), Ainf._tb.name, vDadosIni.codempresa, QuotedStr(sInfCplDESONERACAO)]));

    if Ainf.cod_inf = 0 then
    begin
      Ainf.beginChanges(True);
      Ainf.cod_empresa := StrToInt(vDadosIni.codEmpresa);
      Ainf.tipo        := sInfCplDESONERACAO;
      //Ainf.txt         := '';
      Ainf.txt_compl   := 'Desconto no valor de R$[@VICMDESON] ref. ICMS desonerado conf. convenio de ICMS 100/97 e ajuste SINIEF 10/2012';
      with Ainf.SQLMotor('cod_inf') do
      begin
        Options.FieldsInInsertUpdate := fsNewDifOld;// [muCheckModified];
        Ainf.cod_inf := Acon.SqlInsertID(SQLInsertAutoInc, autoIncField);
        if Acon.Transacao.InTransaction then
          Acon.Transacao.Commit;
      end;
    end;

    if nota.ffloat('vicmdeson') <= 0 then
    begin
      if dataSet.Locate('COD_INF', Ainf.cod_inf, []) then
        dataSet.Delete;
      Exit;
    end
    else
    begin
      if dataSet.Locate('COD_INF', Ainf.cod_inf, []) then
        dataSet.Edit
      else
        dataSet.Insert;
      dataSet.FieldByName('cod_nf').AsInteger      := nota.fint('cod_nf');
      dataSet.FieldByName('cod_inf').AsInteger     := Ainf.cod_inf;
      dataSet.FieldByName('cod_empresa').AsInteger := Ainf.cod_empresa;
      dataSet.FieldByName('txt_compl').AsString    := StrReplaceA(Ainf.txt_compl, ['[@VICMDESON]', '[@dest_isuf]'],
                                                                                  [Format('%n', [nota.ffloat('vicmdeson')]), nota.fstr('dest_isuf')]);
      dataSet.Post;
      Apply;
    end;

  finally
    FreeAndNil(Acon);
    FreeAndNil(Ainf);
  end;
end;

function TSpedFiscalNF_C110.adicionaInfComplDesoneracaoPISCOFINS(
  nota: TDataSet_OOP): boolean;
var
  Acon: TConexao;
  Ainf: TSped_informacao_complementar_class;
  strAliqs: string;
  valor: Double;
begin
  Ainf := TSped_informacao_complementar_class.Create;
  Acon := TConexao.Create(dtmAtivo.bancoHw);
  try
    Ainf.SetValuesFrom(Acon.SqlOpen('select %s from %s where cod_empresa = %s and tipo = %s',
                                      [Ainf._tb.GetFieldsSql(), Ainf._tb.name, vDadosIni.codempresa, QuotedStr(sInfCplDESONERACAOPC)]));



    if Ainf.cod_inf = 0 then
    begin
      Ainf.beginChanges(True);
      Ainf.cod_empresa := StrToInt(vDadosIni.codEmpresa);
      Ainf.tipo        := sInfCplDESONERACAOPC;
      //Ainf.txt         := '';
      Ainf.txt_compl   := 'Abatimento de [@ppisdeson]% de PIS referente a isenção a vendas para Zona Franca: R$[@vpisdeson];' +
                          'Abatimento de [@pcofinsdeson]% de COFINS referente a isenção a vendas para Zona Franca: R$[@vcofinsdeson];' +
                          'Registro do cliente na SUFRAMA: [@dest_isuf]';
      with Ainf.SQLMotor('cod_inf') do
      begin
        Options.FieldsInInsertUpdate := fsNewDifOld;// [muCheckModified];
        Ainf.cod_inf := Acon.SqlInsertID(SQLInsertAutoInc, autoIncField);
        if Acon.Transacao.InTransaction then
          Acon.Transacao.Commit;
      end;
    end;

    if nota.ffloat('vpisdeson') <= 0 then
    begin
      if dataSet.Locate('COD_INF', Ainf.cod_inf, []) then
        dataSet.Delete;
      Exit;
    end
    else
    begin
      strAliqs := '';
      valor := 0;
      SqlOpen('select ppisdeson, sum(vpisdeson) vpisdeson from notafiscal_item nfi' +
              ' where nfi.cod_nf = %d and cod_empresa = %d group by 1', [nota.fint('cod_nf'), vdadosini.cod_empresa]).First;
      while not buscas.Eof do
      begin
        strAliqs := strAliqs + IfThen(strAliqs <> '', ', ') + Format('%f', [buscas.FieldByName('ppisdeson').AsFloat]);
        valor := valor + buscas.FieldByName('vpisdeson').AsFloat;
        buscas.Next;
      end;
      Ainf.txt_compl := StrReplaceA(Ainf.txt_compl, ['[@ppisdeson]', '[@vpisdeson]'], [strAliqs, Format('%f', [valor])]);

      strAliqs := '';
      valor := 0;
      SqlOpen('select pcofinsdeson, sum(vcofinsdeson) vcofinsdeson from notafiscal_item nfi' +
              ' where nfi.cod_nf = %d and cod_empresa = %d group by 1', [nota.fint('cod_nf'), vdadosini.cod_empresa]).First;
      while not buscas.Eof do
      begin
        strAliqs := strAliqs + IfThen(strAliqs <> '', ', ') + Format('%f', [buscas.FieldByName('pcofinsdeson').AsFloat]);
        valor := valor + buscas.FieldByName('vcofinsdeson').AsFloat;
        buscas.Next;
      end;
      Ainf.txt_compl := StrReplaceA(Ainf.txt_compl, ['[@pcofinsdeson]', '[@vcofinsdeson]', '[@dest_isuf]'],
                                                    [strAliqs, Format('%f', [valor]), nota.fstr('dest_isuf')]);

      if dataSet.Locate('COD_INF', Ainf.cod_inf, []) then
        dataSet.Edit
      else
        dataSet.Insert;
      dataSet.FieldByName('cod_nf').AsInteger      := nota.fint('cod_nf');
      dataSet.FieldByName('cod_inf').AsInteger     := Ainf.cod_inf;
      dataSet.FieldByName('cod_empresa').AsInteger := Ainf.cod_empresa;
      dataSet.FieldByName('txt_compl').AsString    := Ainf.txt_compl;
      dataSet.Post;
      Apply;
    end;

  finally
    FreeAndNil(Acon);
    FreeAndNil(Ainf);
  end;
end;

function TSpedFiscalNF_C110.adicionaInfComplDevolucaoEntradaPedido: boolean;
var
  PedVendaRef: THw_pedvenda_ref_nf_classList;
  DevVendaRef: THw_pedvenda_ref_nf_classList;
  ATextTemp: string;
  I: Integer;
  Array_inf: array[1..3] of Integer;
begin
  if (FOwner.fstr('tipo_emissao') = '4') and (FOwner.fstr('natureza_nf') = 'E') then
  begin
    Array_inf[1] := 0;
    Array_inf[2] := 0;
    Array_inf[3] := 0;
    PedVendaRef := THw_pedvenda_ref_nf_classList.Create;
    try
      (FOwner as TNFCab).vItem.First;
      while not (FOwner as TNFCab).vItem.Eof do
      begin
        if (FOwner as TNFCab).vItem.fint('nped') > 0 then
          PedVendaRef.Add((FOwner as TNFCab).vItem.fint('nped'), (FOwner as TNFCab).vItem.fstr('tipo_ped'), (FOwner as TNFCab).vItem.fint('cod_empresa'));

        (FOwner as TNFCab).vItem.Next;
      end;

      DevVendaRef := THw_pedvenda_ref_nf_classList.Create;
      (FOwner as TNFCab).vItem.First;
      while not (FOwner as TNFCab).vItem.Eof do
      begin
        if ((FOwner as TNFCab).vItem.fint('seq_devolucao') > 0) and ((FOwner as TNFCab).vItem.fint('seqid_devolucao') > 0) then
          DevVendaRef.Add((FOwner as TNFCab).vItem.fint('seq_devolucao'), 'DEV', (FOwner as TNFCab).vItem.fint('seqid_devolucao'));
        (FOwner as TNFCab).vItem.Next;
      end;

      ATextTemp := '';
      for I := 0 to DevVendaRef.Count - 1 do
      begin
        ATextTemp := IfThen(I > 0, ATextTemp + ' union distinct ') +
                     Format('select dev.cod_venda nped, dev.tipo_venda tipo from devolucao dev where dev.sequencia = %d and dev.seqid = %d and dev.cod_empresa = %d',
                            [DevVendaRef.Items[I].nped, DevVendaRef.Items[I].cod_empresa, vDadosIni.cod_empresa]);
      end;
      DevVendaRef.Free;

      if ATextTemp <> '' then
      begin
        SqlOpen(ATextTemp).First;
        while not buscas.Eof do
        begin
          PedVendaRef.Add(buscas.FieldByName('nped').AsInteger, buscas.FieldByName('tipo').AsString, vDadosIni.cod_empresa);
          buscas.Next;
        end;
      end;
      

      for I := 0 to PedVendaRef.Count - 1 do with PedVendaRef.Items[I] do
      begin
        SqlOpen('select distinct 1 ordem, nfce.chave_nfce, pv.nserieecf, pv.ncupom, pv.data_cupom, pv.operador, ''2D'' modelo' +
                ' from pedvenda pv' +
                ' inner join nfce on nfce.cod_nfce = pv.cod_nfce and nfce.cod_empresa = pv.cod_empresa and nfce.situacao_nfce = ''Autorizada'' ' +
                ' where pv.nped = %d and tipo = %s and pv.cod_empresa = %d' +
                ' union' +
                ' select distinct 2 ordem, '''' chave_nfe, pv.nserieecf, pv.ncupom, pv.data_cupom, pv.operador, ''2D'' modelo' +
                ' from pedvenda pv' +
                ' where pv.nped = %d and tipo = %s and pv.cod_empresa = %d and pv.ncupom > 0' +
                ' order by 1',
                [nped, QuotedStr(tipo), cod_empresa,
                 nped, QuotedStr(tipo), cod_empresa]).First;
        while not buscas.Eof do
        begin
          if buscas.FieldByName('ordem').AsInteger = 1 then
          begin
            vInfCompl.abreInfComplementar(sInfCplNFCE);
            Array_inf[1] := vInfCompl.fint('cod_inf');
            if vInfCompl.dataSet.IsEmpty then
            begin
              vDadosIni.ShowErro('Informação complementar de referencia a NFC-e do tipo "NFCE" não encontrada');
              Exit;
            end;
            if not dataSet.Active then abreC110(FOwner.fint('cod_nf'));
            //if not vC113.dataSet.Active then
            vC113.abreC113(FOwner.fint('cod_nf'));

            filterStr('cod_inf = %d', [vInfCompl.fint('cod_inf')]);
            vC113.filterStr('chave_nfe_ref = ' + QuotedStr(buscas.FieldByName('chave_nfce').AsString));
            try
              if dataSet.IsEmpty then if not incluirC110 then Exit;

              if vC113.dataSet.IsEmpty then
                if incluirC113 then
                  vC113.salvarReferenciaPelaChaveNFe(buscas.FieldByName('chave_nfce').AsString);
            finally
              vC113.filterClear;
              filterClear;
            end;
          end
          else if buscas.FieldByName('ordem').AsInteger = 2 then
          begin
            vInfCompl.abreInfComplementar(sInfCplCUPOM);
            Array_inf[2] := vInfCompl.fint('cod_inf');
            if vInfCompl.dataSet.IsEmpty then
            begin
              vDadosIni.ShowErro('Informação de referencia a cupons ficasis do tipo "CUPOM" não encontrada');
              Exit;
            end;

            if not dataSet.Active       then abreC110(      FOwner.fint('cod_nf'));
            //if not vC114.dataSet.Active then
            vC114.abreC114(FOwner.fint('cod_nf'));

            filterStr('cod_inf = %d', [vInfCompl.fint('cod_inf')]);
            vC114.filterStr('ECF_FAB = %s and ECF_CX = %d and NUM_DOC = %d',
                            [QuotedStr(Trim(buscas.FieldByName('nserieecf').AsString)),
                             IfThen(buscas.FieldByName('operador').AsInteger > 0, buscas.FieldByName('operador').AsInteger, 1),
                             buscas.FieldByName('ncupom').AsInteger]);
            try
              if vC114.dataSet.IsEmpty then
              begin
                if dataSet.IsEmpty then if not incluirC110 then Exit;
                
                if incluirC114 then
                begin
                  vC114.dataset.fieldbyname('COD_MOD').AsString := '2D';
                  vC114.dataset.fieldbyname('ECF_FAB').AsString := Trim(buscas.FieldByName('nserieecf').AsString);
                  vC114.dataset.fieldbyname('ECF_CX').AsInteger := IfThen(buscas.FieldByName('operador').AsInteger > 0, buscas.FieldByName('operador').AsInteger, 1);
                  vC114.dataset.fieldbyname('NUM_DOC').AsString := buscas.FieldByName('ncupom').AsString;
                  vC114.dataset.fieldbyname('DT_DOC').AsString  := buscas.FieldByName('data_cupom').AsString;
                  vC114.Post;
                end;
              end;

             finally
               vC114.filterClear;
               filterClear;
             end;
          end;

          buscas.Next;
        end;

        //caso não tenha cupom ou nfce referenciado ai sim ira procurar FOwner fiscal
        if buscas.IsEmpty then
        begin
          SqlOpen('select distinct 3 ordem, nf.chave_nfe, pv.nserieecf, pv.ncupom, pv.data_cupom, pv.operador, ''2D'' modelo' +
                  ' from pedvenda_prod pvp' +
                  ' inner join pedvenda pv on pv.nped = pvp.nped and pv.tipo = pvp.tipo and pv.cod_empresa = pvp.cod_empresa' +
                  ' inner join notafiscal_item nfi on nfi.nped = pvp.nped and nfi.tipo_ped = pvp.tipo and nfi.cod_empresa = pvp.cod_empresa' +
                  ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa and nf.situacao_nfe = ''Autorizada'' ' +
                  ' where pv.nped = %d and pv.tipo = %s and pv.cod_empresa = %d' +
                  ' order by 1',
                  [nped, QuotedStr(tipo), cod_empresa,
                   nped, QuotedStr(tipo), cod_empresa]).First;
          while not buscas.Eof do
          begin
            vInfCompl.abreInfComplementar(sInfCplNFE);
            Array_inf[3] := vInfCompl.fint('cod_inf');
            if vInfCompl.dataSet.IsEmpty then
            begin
              vDadosIni.ShowErro('Informação complementar de referencia a NFe do tipo "NFE" não encontrada');
              Exit;
            end;
            if not dataSet.Active then abreC110(FOwner.fint('cod_nf'));
            //if not vC113.dataSet.Active then
              vC113.abreC113(FOwner.fint('cod_nf'));

            filterStr('cod_inf = %d', [vInfCompl.fint('cod_inf')]);
            vC113.filterStr('chave_nfe_ref = ' + QuotedStr(buscas.FieldByName('chave_nfe').AsString));
            try
              if dataSet.IsEmpty then if not incluirC110 then Exit;

              if vC113.IsEmpty then
                if incluirC113 then
                  vC113.salvarReferenciaPelaChaveNFe(buscas.FieldByName('chave_nfe').AsString);
            finally
              vC113.filterClear;
              filterClear;
            end;
            buscas.Next;
          end;
        end;
      end;

    finally
      FreeAndNil(PedVendaRef);
    end;

    for I := 1 to 3 do if Array_inf[i] > 0 then
    begin
      filterStr('cod_inf = %d', [Array_inf[i]]);
      try
        if not dataSet.IsEmpty then
          if (I = 2) and (not vC114.dataSet.IsEmpty) then
          begin
            vInfCompl.abreInfComplementar(sInfCplCUPOM, False);
            dataSet.Edit;
            dataSet.FieldByName('txt_compl').AsString := vC114.GetTextoInformacaoComplementar(vInfCompl.fstr('txt_compl'));
            dataSet.Post;
            Apply;
          end
          else if (I in [1, 3]) and (not vC113.dataSet.IsEmpty) then
          begin
            dataSet.Edit;
            if I = 1 then
            begin
              vInfCompl.abreInfComplementar(sInfCplNFCE, False);
              dataSet.FieldByName('txt_compl').AsString := vC113.GetTextoInformacaoComplementar_NFCE(vInfCompl.fstr('txt_compl'));
            end
            else
            begin
              vInfCompl.abreInfComplementar(sInfCplNFE, False);
              dataSet.FieldByName('txt_compl').AsString := vC113.GetTextoInformacaoComplementar_NFE(vInfCompl.fstr('txt_compl'));
            end;
            dataSet.Post;
            Apply;
          end;
      finally
        filterClear;
      end;
    end;
  end;
end;

function TSpedFiscalNF_C110.adicionaInfComplDevolucaoOuPorItem(nota: TDataSet_OOP): boolean;
var
  vTemDevolucao, vTem, vTemInfCompl, vTemInfComplItem: Boolean;
  vTempText: string;
  vCodInf: Integer;
  Alist: TStringList;
  I: Integer;

  procedure addInfComplementar;
  begin
    if vCodInf = 0 then
      Exit;

    vInfCompl.abreInfComplementar(vCodInf);

    if not vInfCompl.dataSet.IsEmpty then
    begin

      if not dataSet.Active then
        abreC110(nota.dataSet.FieldByName('cod_nf').AsInteger);
      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('cod_inf').AsInteger =
          vInfCompl.dataSet.FieldByName('cod_inf').AsInteger then
        begin
          vTemInfComplItem := True;
          Break;
        end;
        dataSet.Next;
      end;

      if not vTemInfComplItem then
      begin
        dataSet.Insert;
        dataSet.FieldByName('cod_inf').AsInteger :=
          vInfCompl.dataSet.FieldByName('cod_inf').AsInteger;
        dataSet.FieldByName('cod_nf').AsInteger :=
          nota.dataSet.FieldByName('cod_nf').AsInteger;
        dataSet.FieldByName('txt_compl').AsString :=
          vInfCompl.dataSet.FieldByName('txt_compl').AsString;
        dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        dataSet.Post;
        Apply;
      end;
    end;

  end;
begin
  vTemDevolucao := False;


  Alist := vDadosIni.NewStringList(True);

  (nota as TNFCab).vItem.dataSet.First;
  while not (nota as TNFCab).vitem.dataset.eof do
  begin
    vCodInf := 0;
    vTemInfComplItem := False;
    if nota.dataSet.FieldByName('emissao_propria').AsString = 'S' then
    begin
      if ((nota as TNFCab).vItem.dataSet.FieldByName('tipo_item').AsString = 'P') and ((nota as TNFCab).campo_natureza_nf = 'S') then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select cod_inf from produtos'+
          ' where grupo_prod = ' + IntToStr((nota as TNFCab).vItem.dataSet.FieldByName('grupo_prod').AsInteger)+
          ' and cod_prod = ' + QuotedStr((nota as TNFCab).vItem.dataSet.FieldByName('cod_prod').AsString) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;

        vCodInf :=  buscas.FieldByName('cod_inf').AsInteger;

      end;

      if (vCodInf = 0) and (Trim((nota as TNFCab).vItem.dataSet.FieldByName('ncm').AsString) <> '') and ((nota as TNFCab).campo_natureza_nf = 'S') then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select cod_inf from nbm'+
          ' where cod_ncm = ' + QuotedStr((nota as TNFCab).vItem.dataSet.FieldByName('ncm').AsString);
        buscas.Open;

        vCodInf :=  buscas.FieldByName('cod_inf').AsInteger;

      end;

      addInfComplementar;

      buscas.Close;
      buscas.SQL.Text := 'select cod_inf from nat_op'+
        ' where codigo_nop = :codigo_nop';
      buscas.ParamByName('codigo_nop').AsFloat := (nota as TNFCab).vItem.dataSet.FieldByName('codigo_nop').AsFloat;
      buscas.Open;

      vCodInf :=  buscas.FieldByName('cod_inf').AsInteger;

      addInfComplementar;

      Alist.Add(IfThen((nota as TNFCab).vItem.str_empty('csosn'), Copy((nota as TNFCab).vItem.f_str('cst'), 2, 2), (nota as TNFCab).vItem.f_str('csosn')));
    end;

    if (nota as TNFCab).cfopDeDevolucao(Trunc((nota as TNFCab).vItem.dataset.FieldByName('codigo_nop').AsFloat)) then
    begin
      vTemDevolucao := True;
      if (nota as TNFCab).campo_natureza_nf <> 'S' then
        Break;
    end;
    (nota as TNFCab).vItem.dataSet.Next;
  end;

  for I := 0 to Pred(Alist.Count) do
  begin
    SqlOpen('select distinct cod_inf from cst_icms_inf_cpl where cst_csosn = %s and cod_empresa = %s',
            [QuotedStr(Alist[I]), vDadosIni.codEmpresa]).First;
    while not buscas.Eof do
    begin
      vCodInf :=  buscas.FieldByName('cod_inf').AsInteger;

      addInfComplementar;

      buscas.Next;
    end;
  end;

  FreeAndNil(Alist);

  vInfCompl.abreInfComplementarDevolucao((nota as TNFCab).campo_natureza_nf);
  if not vInfCompl.dataSet.IsEmpty then
  begin
    if not dataSet.Active then
      abreC110(nota.dataSet.FieldByName('cod_nf').AsInteger);
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('cod_inf').AsInteger =
        vInfCompl.dataSet.FieldByName('cod_inf').AsInteger then
      begin
        vTem := True;
        vTemInfCompl := True;
        Break;
      end;
      dataSet.Next;
    end;
    if vTemDevolucao then
    begin
      if not vTem then
      begin
        dataSet.Insert;
        dataSet.FieldByName('cod_inf').AsInteger :=
          vInfCompl.dataSet.FieldByName('cod_inf').AsInteger;
        dataSet.FieldByName('cod_nf').AsInteger :=
          nota.dataSet.FieldByName('cod_nf').AsInteger;
        dataSet.FieldByName('txt_compl').AsString :=
          vInfCompl.dataSet.FieldByName('txt_compl').AsString;
        dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        dataSet.Post;
        Apply;
        vTemInfCompl := True;
      end;

      vC113.abreC113(dataSet.FieldByName('cod_nf').AsInteger,
        dataSet.FieldByName('cod_inf').AsInteger);

      try
        (nota as TNFCab).vItem.dataSet.First;
        while not (nota as TNFCab).vitem.dataset.eof do
        begin
          if ((nota as TNFCab).vItem.dataset.FieldByName('cod_nf_dev').asinteger > 0) and
            ((nota as TNFCab).vItem.dataset.FieldByName('nitem_dev').AsInteger > 0) then
          begin
            vTem := False;
            vC113.dataset.First;
            while not vC113.dataset.eof do
            begin
              if (vC113.dataset.fieldbyname('COD_NF_REF').asinteger =
                (nota as TNFCab).vitem.dataset.fieldbyname('cod_nf_dev').AsInteger) then
              begin
                vTem := true;
                break;
              end;
              vC113.dataset.next;
            end;
            if not vTem then
            begin
              if incluirC113 then
              begin
                vC113.dataset.fieldbyname('COD_NF_REF').AsInteger :=
                  (nota as TNFCab).vitem.dataset.fieldbyname('cod_nf_dev').AsInteger;
                vC113.Post;
              end;
            end;
          end;
          (nota as TNFCab).vitem.dataSet.next;
        end;
      except
        on e: exception do begin
          Result := False;
          Application.MessageBox(pchar('Erro ao adicionair Notas Fiscais Referenciadas de devolução.' + sLineBreak +
            'Favor adicioná-las manualmente'), 'Atenção', MB_OK + MB_ICONINFORMATION);
        end;
      end;
    end;
  end;

  if vTemInfCompl then
  begin
    vTempText := '';
    vC113.abreC113(nota.dataSet.FieldByName('cod_nf').AsInteger, dataSet.FieldByName('cod_inf').AsInteger);
    vC113.dataSet.First;
    while not vC113.dataSet.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := 'select num_nf from notafiscal' +
        ' where cod_nf = ' + IntToStr(vC113.dataset.fieldbyname('COD_NF_REF').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.FieldByName('num_nf').AsInteger > 0 then
      begin
        if Pos(vDadosIni.StrZero(buscas.FieldByName('num_nf').AsInteger, 8) + ',', vTempText) = 0 then
          vTempText := vTempText + vDadosIni.StrZero(buscas.FieldByName('num_nf').AsInteger, 8) + ', ';
      end
      else if Trim(vC113.dataSet.FieldByName('chave_nfe_ref').AsString) <> '' then
        vTempText := vTempText + Trim(vC113.dataSet.FieldByName('chave_nfe_ref').AsString) + ', ';
      vC113.dataSet.Next;
    end;
    try
      vTempText := Copy(vTempText, 1, length(vTempText) - 2);
    except
    end;
    dataSet.Edit;
    dataSet.FieldByName('txt_compl').AsString :=
      'CONFORME NF(S): ' + vTempText;
    dataSet.Post;
    Apply;
  end;

end;

function TSpedFiscalNF_C110.adicionaInfComplPorInfId(
  idsInf: array of Integer): Boolean;
var
  Ainf: TSped_informacao_complementar_class;
  id, I: Integer;
  text: string;
begin
  for I := Low(idsInf) to High(idsInf) do
  begin

    Ainf := TSped_informacao_complementar_class.Create;
    try
      Ainf.SetValuesFrom(FOwner.SqlOpen('select %s from %s where cod_empresa = %s and cod_inf = %d',
                                        [Ainf._tb.GetFieldsSql(), Ainf._tb.name, vDadosIni.codempresa, idsInf[I]]));

      if Ainf.cod_inf > 0 then
        if not dataSet.Locate('COD_INF', Ainf.cod_inf, []) then
        begin
          text := vInfCompl.GetTxtComplReplaced(FOwner, Ainf.txt_compl);

          dataSet.Insert;
          dataSet.FieldByName('cod_nf').AsInteger      := FOwner.fint('cod_nf');
          dataSet.FieldByName('cod_inf').AsInteger     := Ainf.cod_inf;
          dataSet.FieldByName('cod_empresa').AsInteger := Ainf.cod_empresa;
          dataSet.FieldByName('txt_compl').AsString    := text; // StringReplace(Ainf.txt_compl, '[@VICMDESON]',
                                                                   //      Format('%n', [FOwner.ffloat('vicmdeson')]), [rfReplaceAll, rfIgnoreCase]);
          dataSet.Post;
          Apply;
        end;

    finally
      FreeAndNil(Ainf);
    end;
  end;
end;

function TSpedFiscalNF_C110.adicionaInfComplPorItemOuNCM(nota: TDataSet_OOP): boolean;
var
  vTemDevolucao, vTem, vTemInfCompl: Boolean;
  vTempText: string;
begin
  vTemDevolucao := False;

  (nota as TNFCab).vItem.dataSet.First;
  while not (nota as TNFCab).vitem.dataset.eof do
  begin
    if (nota as TNFCab).cfopDeDevolucaoSPED(Trunc((nota as TNFCab).vItem.dataset.FieldByName('codigo_nop').AsFloat)) then
    begin
      vTemDevolucao := True;
      Break;
    end;
    (nota as TNFCab).vItem.dataSet.Next;
  end;

  vInfCompl.abreInfComplementarDevolucao((nota as TNFCab).campo_natureza_nf);
  if not vInfCompl.dataSet.IsEmpty then
  begin
    if not dataSet.Active then
      abreC110(nota.dataSet.FieldByName('cod_nf').AsInteger);
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('cod_inf').AsInteger =
        vInfCompl.dataSet.FieldByName('cod_inf').AsInteger then
      begin
        vTem := True;
        vTemInfCompl := True;
        Break;
      end;
      dataSet.Next;
    end;
    if vTemDevolucao then
    begin
      if not vTem then
      begin
        dataSet.Insert;
        dataSet.FieldByName('cod_inf').AsInteger :=
          vInfCompl.dataSet.FieldByName('cod_inf').AsInteger;
        dataSet.FieldByName('cod_nf').AsInteger :=
          nota.dataSet.FieldByName('cod_nf').AsInteger;
        dataSet.FieldByName('txt_compl').AsString :=
          vInfCompl.dataSet.FieldByName('txt_compl').AsString;
        dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        dataSet.Post;
        Apply;
        vTemInfCompl := True;
      end;

      vC113.abreC113(dataSet.FieldByName('cod_nf').AsInteger,
        dataSet.FieldByName('cod_inf').AsInteger);

      try
        (nota as TNFCab).vItem.dataSet.First;
        while not (nota as TNFCab).vitem.dataset.eof do
        begin
          if ((nota as TNFCab).vItem.dataset.FieldByName('cod_nf_dev').asinteger > 0) and
            ((nota as TNFCab).vItem.dataset.FieldByName('nitem_dev').AsInteger > 0) then
          begin
            vTem := False;
            vC113.dataset.First;
            while not vC113.dataset.eof do
            begin
              if (vC113.dataset.fieldbyname('COD_NF_REF').asinteger =
                (nota as TNFCab).vitem.dataset.fieldbyname('cod_nf_dev').AsInteger) then
              begin
                vTem := true;
                break;
              end;
              vC113.dataset.next;
            end;
            if not vTem then
            begin
              if incluirC113 then
              begin
                vC113.dataset.fieldbyname('COD_NF_REF').AsInteger :=
                  (nota as TNFCab).vitem.dataset.fieldbyname('cod_nf_dev').AsInteger;
                vC113.Post;
              end;
            end;
          end;
          (nota as TNFCab).vitem.dataSet.next;
        end;
      except
        on e: exception do begin
          Result := False;
          Application.MessageBox(pchar('Erro ao adicionair Notas Fiscais Referenciadas de devolução.' + sLineBreak +
            'Favor adicioná-las manualmente'), 'Atenção', MB_OK + MB_ICONINFORMATION);
        end;
      end;
    end;
  end;
  if vTemInfCompl then
  begin
    vTempText := '';
    vC113.abreC113(nota.dataSet.FieldByName('cod_nf').AsInteger, dataSet.FieldByName('cod_inf').AsInteger);
    vC113.dataSet.First;
    while not vC113.dataSet.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := 'select num_nf from notafiscal' +
        ' where cod_nf = ' + IntToStr(vC113.dataset.fieldbyname('COD_NF_REF').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if Pos(vDadosIni.StrZero(buscas.FieldByName('num_nf').AsInteger, 8) + ',', vTempText) = 0 then
        vTempText := vTempText + vDadosIni.StrZero(buscas.FieldByName('num_nf').AsInteger, 8) + ', ';
      vC113.dataSet.Next;
    end;
    try
      vTempText := Copy(vTempText, 1, length(vTempText) - 2);
    except
    end;
    dataSet.Edit;
    dataSet.FieldByName('txt_compl').AsString :=
      'CONFORME NF(S): ' + vTempText;
    dataSet.Post;
    Apply;
  end;
end;

function TSpedFiscalNF_C110.adicionaInfComplPorOperacaoFiscalId(
  nota: TDataSet_OOP): boolean;
var
  Ainf: TSped_informacao_complementar_class;
  idsInf: array of Integer;
  id, I: Integer;
begin

  SetLength(idsInf, 0);
  nota.SqlOpen('select s.cod_inf from notafiscal_item nfi' +
               ' inner join opf o on o.id = nfi.opf_icms_id and o.cod_empresa = nfi.cod_empresa' +
               ' inner join sped_informacao_complementar s on s.cod_inf = o.cod_inf and s.cod_empresa = o.cod_empresa' +
               ' where nfi.cod_nf = %d and nfi.cod_empresa = %d and nfi.opf_icms_id > 0' +
               ' union distinct' +
               ' select s.cod_inf from notafiscal_item nfi' +
               ' inner join opf o on o.id = nfi.opf_pc_id and o.cod_empresa = nfi.cod_empresa' +
               ' inner join sped_informacao_complementar s on s.cod_inf = o.cod_inf and s.cod_empresa = o.cod_empresa' +
               ' where nfi.cod_nf = %d and nfi.cod_empresa = %d and nfi.opf_pc_id > 0 ' +
               ' union distinct' +
               ' select s.cod_inf from notafiscal_item nfi' +
               ' inner join opf o on o.id = nfi.opf_ret_id and o.cod_empresa = nfi.cod_empresa' +
               ' inner join sped_informacao_complementar s on s.cod_inf = o.cod_inf and s.cod_empresa = o.cod_empresa' +
               ' where nfi.cod_nf = %d and nfi.cod_empresa = %d and nfi.opf_ret_id > 0 ',
               [nota.fint('cod_nf'), vDadosIni.cod_empresa, nota.fint('cod_nf'), vDadosIni.cod_empresa, nota.fint('cod_nf'), vDadosIni.cod_empresa]).First;
  SetLength(idsInf, 0);

  nota.buscas.First;
  while not nota.buscas.Eof do
  begin
    SetLength(idsInf, Length(idsInf) + 1);
    idsInf[High(idsInf)] := nota.buscas.FieldByName('cod_inf').AsInteger;
    nota.buscas.Next;
  end;

  Result := adicionaInfComplPorInfId(idsInf);
  {
  for I := Low(idsInf) to High(idsInf) do
  begin

    Ainf := TSped_informacao_complementar_class.Create;
    try
      Ainf.SetValuesFrom(nota.SqlOpen('select %s from %s where cod_empresa = %s and cod_inf = %d',
                                        [Ainf._tb.GetFieldsSql(), Ainf._tb.name, vDadosIni.codempresa, idsInf[I]]));

      if Ainf.cod_inf > 0 then
        if not dataSet.Locate('COD_INF', Ainf.cod_inf, []) then
        begin
          dataSet.Insert;
          dataSet.FieldByName('cod_nf').AsInteger      := nota.fint('cod_nf');
          dataSet.FieldByName('cod_inf').AsInteger     := Ainf.cod_inf;
          dataSet.FieldByName('cod_empresa').AsInteger := Ainf.cod_empresa;
          dataSet.FieldByName('txt_compl').AsString    := StringReplace(Ainf.txt_compl, '[@VICMDESON]',
                                                                        Format('%n', [nota.ffloat('vicmdeson')]), [rfReplaceAll, rfIgnoreCase]);
          dataSet.Post;
          Apply;
        end;

    finally
      FreeAndNil(Ainf);
    end;
  end;
  }
end;

function TSpedFiscalNF_C110.adicionaInfComplRetencaoFederal(
  nota: TDataSet_OOP): boolean;
var
  totRet: Double;
  text: string;
begin

  totRet := nota.ffloat('valor_irrf') + nota.ffloat('vretcsll') + nota.ffloat('vretpis') + nota.ffloat('vretcofins');

  vInfCompl.abreInfComplementar(sInfCplRETENCAOFEDERAL, True);

  if totRet = 0 then
  begin
    if dataSet.Locate('COD_INF', vInfCompl.fint('cod_inf'), []) then
      dataSet.Delete;
    Exit;
  end
  else
  begin
    text := StringReplace(vInfCompl.fstr('txt_compl'), '[@vrettot]', Format('%n', [totRet]), [rfReplaceAll, rfIgnoreCase]);
    text := vInfCompl.GetTxtComplReplaced(nota, text);

    if dataSet.Locate('COD_INF', vInfCompl.fint('cod_inf'), []) then
      dataSet.Edit
    else
      dataSet.Insert;
    dataSet.FieldByName('cod_nf').AsInteger      := nota.fint('cod_nf');
    dataSet.FieldByName('cod_inf').AsInteger     := vInfCompl.fint('cod_inf');
    dataSet.FieldByName('cod_empresa').AsInteger := vInfCompl.fint('cod_empresa');
    dataSet.FieldByName('txt_compl').AsString    := text;

    dataSet.Post;
    Apply;
  end;
end;

function TSpedFiscalNF_C110.adicionaInfComplSimples(nota: TDataSet_OOP): boolean;
var
  vEditando, vSalvar: boolean;
begin
  vEditando := false;
  vSalvar := False;
  dataSet.First;
  while not dataSet.eof do
  begin
    if dataSet.FieldByName('tipo').AsString = sInfCplSIMPLES then
    begin
      dataSet.Edit;
      vEditando := True;
      vSalvar := True;
      Break
        //          vSped.vC110.dataSet.FieldByName('txt_compl').AsString :=
//            'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL NÃO GERA DIREITO A CRÉDITO FISCAL DE IPI';
    end;
    dataSet.Next;
  end;
  if not vEditando then
  begin
    vInfCompl.abreInfComplementar;
    vInfCompl.dataSet.First;
    while not vInfCompl.dataSet.Eof do
    begin
      if vInfCompl.dataSet.FieldByName('tipo').AsString = sInfCplSIMPLES then
      begin
        dataSet.Insert;
        dataSet.FieldByName('cod_nf').asinteger :=
          nota.dataSet.FieldByName('cod_nf').asinteger;
        dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codempresa;
        dataSet.FieldByName('cod_inf').asinteger :=
          vInfCompl.dataSet.FieldByName('cod_inf').asinteger;
        dataSet.FieldByName('tipo').asstring :=
          vInfCompl.dataSet.FieldByName('tipo').asstring;
        vSalvar := true;
        Break;
      end;
      vInfCompl.dataSet.Next;
    end;
  end;
  if vSalvar then
  begin
    dataSet.FieldByName('txt_compl').AsString := '';
    if ((nota as TNFCab).vClFor.clienteFornecedorContrinuinte) and
      (nota.dataSet.FieldByName('valor_icm_simples').AsFloat > 0) then
      dataSet.FieldByName('txt_compl').AsString :=
        ' PERMITE O APROVEITAMENTO DO CRÉDITO DE ICMS NO VALOR DE R$ ' +
        Format('%0.2n', [nota.dataSet.FieldByName('valor_icm_simples').AsFloat]) + ';' +
      ' CORRESPONDENTE À ALÍQUOTA DE ' +
        Format('%0.2n', [nota.dataSet.FieldByName('aliq_icm_simples').AsFloat]) +
      '%, NOS TERMOS DO ART.23 DA LC 123/2006';
    Post;
  end;
end;

function TSpedFiscalNF_C110.adicionaInfComplSimplesExcesso(
  nota: TDataSet_OOP): boolean;
var
  vEditando, vSalvar: boolean;
begin
  vEditando := false;
  vSalvar := False;
  dataSet.First;
  while not dataSet.eof do
  begin
    if dataSet.FieldByName('tipo').AsString = sInfCplSIMPLES_EX then
    begin
      dataSet.Edit;
      vEditando := True;
      vSalvar := True;
      Break
        //          vSped.vC110.dataSet.FieldByName('txt_compl').AsString :=
//            'DOCUMENTO EMITIDO POR ME OU EPP OPTANTE PELO SIMPLES NACIONAL NÃO GERA DIREITO A CRÉDITO FISCAL DE IPI';
    end;
    dataSet.Next;
  end;
  if not vEditando then
  begin
    vInfCompl.abreInfComplementar;
    vInfCompl.dataSet.First;
    while not vInfCompl.dataSet.Eof do
    begin
      if vInfCompl.dataSet.FieldByName('tipo').AsString = sInfCplSIMPLES_EX then
      begin
        dataSet.Insert;
        dataSet.FieldByName('cod_nf').asinteger :=
          nota.dataSet.FieldByName('cod_nf').asinteger;
        dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codempresa;
        dataSet.FieldByName('cod_inf').asinteger :=
          vInfCompl.dataSet.FieldByName('cod_inf').asinteger;
        dataSet.FieldByName('tipo').asstring :=
          vInfCompl.dataSet.FieldByName('tipo').asstring;
        vSalvar := true;
        Break;
      end;
      vInfCompl.dataSet.Next;
    end;
  end;
  if vSalvar then
  begin
    dataSet.FieldByName('txt_compl').AsString := '';
    Post;
  end;
end;

constructor TSpedFiscalNF_C110.Create(AOwner: TDataSet_OOP);
begin
  FOwner := AOwner;
  dataSet := tclientDataSet(DtmSpedNF.cdsC110);
  transacao := tibtransaction(DtmNF.transacaoNF);
  buscas := tibquery(DtmNF.qrBuscas);
  vInfCompl := TInformacaoComplementarNF.create;
  vC111 := TSpedFiscalNF_C111.create;
  vC112 := TSpedFiscalNF_C112.create;
  vC113 := TSpedFiscalNF_C113.create(Self);
  vC114 := TSpedFiscalNF_C114.create;
  vC115 := TSpedFiscalNF_C115.create;
end;

function TSpedFiscalNF_C110.delete: boolean;
begin
  if inherited delete then
    Apply;
end;

destructor TSpedFiscalNF_C110.Destroy;
begin
  vC111.Free;
  vC111 := nil;
  vC112.Free;
  vC112 := nil;
  vC113.Free;
  vC113 := nil;
  vC114.Free;
  vC114 := nil;
  vC115.Free;
  vC115 := nil;
  inherited;
end;

function TSpedFiscalNF_C110.incluirC110: Boolean;
begin
  try
    dataSet.Insert;
    dataSet.FieldByName('cod_inf').AsInteger    := vInfCompl.fint('cod_inf');
    dataSet.FieldByName('cod_nf').AsInteger     := FOwner.fint('cod_nf');
    dataSet.FieldByName('txt_compl').AsString   := vInfCompl.fstr('txt_compl');
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.Post;

    Result := Apply;

  except on E: Exception do
    begin
      Result := False;
      vDadosIni.ShowErro('Erro ao incluir informação complementar. Erro: ' + e.Message);
      vDadosIni.registraErro('TSpedFiscalNF_C110.incluirC110 ' + e.Message);
    end;
  end;
end;

function TSpedFiscalNF_C110.incluirC111: boolean;
begin
  if vC111.Insert then
  begin
    vC111.dataSet.FieldByName('cod_nf').AsInteger := dataSet.FieldByName('cod_nf').AsInteger;
    vC111.dataSet.FieldByName('cod_empresa').AsInteger :=
      dataSet.FieldByName('cod_empresa').AsInteger;
    vC111.dataSet.FieldByName('cod_inf').AsInteger := dataSet.FieldByName('cod_inf').AsInteger;
    Result := True;
  end;
end;

function TSpedFiscalNF_C110.incluirC112: boolean;
begin
  if vC112.Insert then
  begin
    vC112.dataSet.FieldByName('cod_nf').AsInteger := dataSet.FieldByName('cod_nf').AsInteger;
    vC112.dataSet.FieldByName('cod_empresa').AsInteger :=
      dataSet.FieldByName('cod_empresa').AsInteger;
    vC112.dataSet.FieldByName('cod_inf').AsInteger := dataSet.FieldByName('cod_inf').AsInteger;
    vC112.dataSet.FieldByName('nitem').AsInteger := vC112.dataSet.RecordCount + 1;
    Result := True;
  end;
end;

function TSpedFiscalNF_C110.incluirC113: boolean;
begin
  Result := False;
  if vC113.Insert then
  begin
    vC113.dataSet.FieldByName('cod_nf').AsInteger      := dataSet.FieldByName('cod_nf').AsInteger;
    vC113.dataSet.FieldByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
    vC113.dataSet.FieldByName('cod_inf').AsInteger     := dataSet.FieldByName('cod_inf').AsInteger;
    Result := True;
  end;
end;

function TSpedFiscalNF_C110.incluirC114: boolean;
begin
  if vC114.Insert then
  begin
    vC114.dataSet.FieldByName('cod_nf').AsInteger := dataSet.FieldByName('cod_nf').AsInteger;
    vC114.dataSet.FieldByName('cod_empresa').AsInteger :=
      dataSet.FieldByName('cod_empresa').AsInteger;
    vC114.dataSet.FieldByName('cod_inf').AsInteger := dataSet.FieldByName('cod_inf').AsInteger;
    Result := True;
  end;
end;

function TSpedFiscalNF_C110.incluirC115: boolean;
begin
  if vC115.Insert then
  begin
    vC115.dataSet.FieldByName('cod_nf').AsInteger := dataSet.FieldByName('cod_nf').AsInteger;
    vC115.dataSet.FieldByName('cod_empresa').AsInteger :=
      dataSet.FieldByName('cod_empresa').AsInteger;
    vC115.dataSet.FieldByName('cod_inf').AsInteger := dataSet.FieldByName('cod_inf').AsInteger;
    vC115.dataSet.FieldByName('nitem').AsInteger := vC115.dataSet.RecordCount + 1;
    Result := True;
  end;
end;

function TSpedFiscalNF_C110.post: boolean;
begin
  try
    Result := false;
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    Result := inherited post;
    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;
    Apply;
    Refresh;
  except on e: exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;

function TSpedFiscalNF_C110.ResolverInfComplRedBenefPISCOFINS(nota: TDataSet_OOP): boolean;
var
  totRet: Double;
  text: string;
  infs: InfComplementarDFeEtdList;
  input: OperacaoPassivelDeRedBenefPcUseCaseInput;
  passivelReducao: Boolean;
  itemsDS: TDataSet_OOP;
  I: Integer;
begin
  input := OperacaoPassivelDeRedBenefPcUseCaseInput.Create(nota.fdate('data_lanc'));

  itemsDS := (nota as TNFCab).vItem;
  itemsDS.First;
  while not itemsDS.Eof do
  begin
    input.Add( itemsDS.fstr('cst_pis'), itemsDS.fstr('nat_rec'), itemsDS.fstr('ncm') );
    itemsDS.Next();
  end;

  passivelReducao := Container.GetInstance().ErpFeaturesFactory.CreateOperacaoPassivelDeRedBenefPcUseCase()
    .Executar(input);

  infs := Container.GetInstance().ErpFeaturesFactory.CreateListarInfComplPorTipoPcUseCase().Executar(ticRedBenefPC);
  try try
    if not passivelReducao then
    begin
      for I := 0 to infs.Count - 1 do
        if (dataSet.Locate('COD_INF', infs.Items[I].CodInf, [])) then
          dataSet.Delete;

      Apply;
    end
    else if passivelReducao and (infs.Count = 0) then
      raise EValidacaoNegocio.CreateFmt(
        'Documento passível de redução de benefício do PIS/COFINS. ' +
        'Nenhuma "Informação Complementar" foi encontrada no cadastro com o tipo = "%s".' + sLineBreak +
        'Efetue o cadastro antes de continuar com a emissão da nota',
        [TipoInfComplementarEnumStr[ticRedBenefPC]]
      )
    else
    begin
      for I := 0 to infs.Count - 1 do
        if (dataSet.Locate('COD_INF', infs.Items[I].CodInf, [])) then
        begin
          dataSet.Edit;
          Break;
        end;

      if dataSet.State = dsBrowse then
      begin
        dataSet.Insert;
        dataSet.FieldByName('cod_nf').AsInteger      := nota.fint('cod_nf');
        dataSet.FieldByName('cod_inf').AsInteger     := infs.Items[0].CodInf;
        dataSet.FieldByName('cod_empresa').AsInteger := infs.Items[0].CodEmpresa;
      end;

      dataSet.FieldByName('txt_compl').AsString    := infs.Items[0].TxtCompl.Value;
      dataSet.Post;
      Apply;
    end;
//      vInfCompl.abreInfComplementar(TipoInfComplementarEnumStr[ticRedBenefPC], False);
//
//      if vInfCompl.IsEmpty()
//      begin
//        if (inf <> nil) then
//          ShowAtencao(
//            'NF passível de redução do benefício do PISCOFINS e não possui cadastro da Mensagem(Informação Complementar)'
//          );
//        Exit;
//      end;
//
//      if (inf = nil) and (dataSet.Locate('COD_INF', vInfCompl.fint('cod_inf'), [])) then
//        dataSet.Delete
//
//      else if inf <> nil then
//      begin
//        if dataSet.Locate('COD_INF', vInfCompl.fint('cod_inf'), []) then
//          dataSet.Edit
//        else
//          dataSet.Insert;
//        dataSet.FieldByName('cod_nf').AsInteger      := nota.fint('cod_nf');
//        dataSet.FieldByName('cod_inf').AsInteger     := vInfCompl.fint('cod_inf');
//        dataSet.FieldByName('cod_empresa').AsInteger := vInfCompl.fint('cod_empresa');
//        dataSet.FieldByName('txt_compl').AsString    := inf.;
//
//        dataSet.Post;
//        Apply;
//      end;
    finally
      infs.Free();
    end;

  except on E: Exception do
    ShowAtencao(E.Message);
  end;
end;

{ TSpedFiscalNF_C120 }

function TSpedFiscalNF_C120.abreC120(cod_nf: integer): boolean;
begin
  Result := montaSelect('select * from notafiscal_sped_c120 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TSpedFiscalNF_C120.create;
begin
  dataSet := tclientDataSet(DtmSpedNF.cdsC120);
  transacao := tibtransaction(DtmNF.transacaoNF);
  buscas := tibquery(DtmNF.qrBuscas);
end;

function TSpedFiscalNF_C120.delete: boolean;
begin
  if inherited delete then
    Apply;
end;

function TSpedFiscalNF_C120.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if Trim(dataSet.FieldByName('COD_DOC_IMP').AsString) = '' then
      raise exception.create('Tipo de Documento não informado');
    if Trim(dataSet.FieldByName('NUM_DOC_IMP').AsString) = '' then
      raise exception.create('Número do documento de Importação. não informado');
    if dataSet.FieldByName('NUM_ACDRAW').IsNull then
      dataSet.FieldByName('NUM_ACDRAW').AsString := '';

    dataSet.Post;
    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;
    Apply;
    Result := True;
    Refresh;
  except on e: exception do
    begin
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Identificação do processo ou ato concessório Duplicado',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;   

{ TSpedLancamentoFiscal }

function TSpedLancamentoFiscal.abreLancamentosFiscais: boolean;
begin
  Result :=montaSelect('select * from sped_lancamento_fiscal'+
  ' where cod_empresa = '+vDadosIni.codEmpresa);
end;

constructor TSpedLancamentoFiscal.create;
begin
  dataSet := tclientDataSet(DtmSpedNF.cdsLancF);
  transacao := tibtransaction(DtmNF.transacaoNF);
  buscas := tibquery(DtmNF.qrBuscas);
end;

{ TSpedFiscalNF_C195_C197 }

function TSpedFiscalNF_C195_C197.abreC195_C197(cod_nf: integer): boolean;
begin
  vLancFiscal.abreLancamentosFiscais;
  Result := montaSelect('select * from notafiscal_sped_c195_c197 where cod_nf = ' + IntToStr(cod_nf) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa+' order by cod_obs, nitem');
end;

constructor TSpedFiscalNF_C195_C197.create;
begin
  dataSet := tclientDataSet(DtmSpedNF.cdsC197);
  transacao := tibtransaction(DtmNF.transacaoNF);
  buscas := tibquery(DtmNF.qrBuscas);
  vLancFiscal:=TSpedLancamentoFiscal.create;
end;

function TSpedFiscalNF_C195_C197.delete: boolean;
begin
  if inherited delete then
  begin
    if Apply then
      CommitaTransacao
    else
    begin
      CancelUpdates;
      RollBackTransacao;
    end;
  end;
end;

destructor TSpedFiscalNF_C195_C197.Destroy;
begin
  vLancFiscal.Free;
  vLancFiscal := nil;
  inherited;
end;

function TSpedFiscalNF_C195_C197.incluirC195_c197(cod_nf, nitem: integer;
  base_icm_icm_st, valor_icm_icm_st, aliq_icm, valor_outros: Currency): boolean;
begin
  Result := False;
  if Insert then
  begin
    dataSet.FieldByName('cod_nf').AsInteger := cod_nf;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('nitem').AsInteger := nitem;
    Result := True;
  end;
end;

function TSpedFiscalNF_C195_C197.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    if Trim(dataSet.FieldByName('COD_AJ').AsString) = '' then
      raiseexceptioncreate('Tipo de Ajuste não informado','DBComboBox13');
    if Trim(dataSet.FieldByName('COD_OBS').AsString) = '' then
      raiseexceptioncreate('Tipo de Lançamento Fiscal não informado','DBLookupComboBox13');
    if Trim(dataSet.FieldByName('DESCR_COMPL_AJ').AsString) = '' then
      dataSet.FieldByName('DESCR_COMPL_AJ').AsString:=Trim(dataSet.FieldByName('TXT_OBS').AsString);
    dataSet.FieldByName('VL_BC_ICMS').AsCurrency:=vDadosIni.StrToFloatFormat(dataSet.FieldByName('VL_BC_ICMS').AsCurrency,2);
    dataSet.FieldByName('VL_ICMS').AsCurrency:=vDadosIni.StrToFloatFormat(dataSet.FieldByName('VL_ICMS').AsCurrency,2);
    dataSet.FieldByName('VL_OUTROS').AsCurrency:=vDadosIni.StrToFloatFormat(dataSet.FieldByName('VL_OUTROS').AsCurrency,2);
    dataSet.FieldByName('ALIQ_ICMS').AsCurrency:=vDadosIni.StrToFloatFormat(dataSet.FieldByName('ALIQ_ICMS').AsCurrency,2);
    dataSet.Post;
    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;
    if Apply then
    begin
      CommitaTransacao;
      Result := True;
      Refresh;
    end
    else
    begin
      CancelUpdates;
      RollBackTransacao;
    end;
  except on e: exception do
    begin
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Lançamento Fiscal Duplicado','Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      Result := false;
    end;
  end;
end;

procedure TSpedFiscalNF_C195_C197.setValorBaseICMS_ST(valor: Currency);
begin
  if dataSet.State in [dsedit, dsInsert]  then
    dataSet.FieldByName('VL_BC_ICMS').AsCurrency := vDadosIni.StrToFloatFormat( valor,2);
end;

procedure TSpedFiscalNF_C195_C197.setValorDoICMS_ST(valor: Currency);
begin
  if dataSet.State in [dsedit, dsInsert]  then
    dataSet.FieldByName('VL_ICMS').AsCurrency := vDadosIni.StrToFloatFormat( valor,2);
end;

function TSpedFiscalNF_C195_C197._gerarRegistroAutomatico(items: TDataSet_OOP;
  defaultAjICMSAnt, defaultAjOutros: Integer; icmsAntAjPorItem, outrosAjPorItem: Boolean): Boolean;
var
  list: TLancItemC195C197List;
  item: TLancItemC195C197;
  id: Integer;
  consulta: TQuery_OOP;
  I: Integer;
begin
  list := TLancItemC195C197List.create;
  consulta := TQuery_OOP.Create(buscas);
  try
    items.dataSet.First;
    while not items.dataSet.Eof do
    begin
      if (items.ffloat('valor_icmsub_ant') > 0) or (items.ffloat('vajuste') > 0) then
      begin
        id := 0;
        if not items.fempty('trib_sefaz_id') then
          id := consulta.Scalar('select cod_obs from trib_sefaz where id = %s and cod_empresa = %d', [items.fstrq('trib_sefaz_id'), vDadosIni.cod_empresa]).AsInteger;

        if id = 0 then
          id := IfThen(items.ffloat('valor_icmsub_ant') > 0, defaultAjICMSAnt, defaultAjOutros);

        item        := TLancItemC195C197.Create;
        if items.ffloat('valor_icmsub_ant') > 0 then
          item.nitem  := IfThen(icmsAntAjPorItem, items.fint('nitem'))
        else if items.ffloat('valor_icmsub_ant') > 0 then
          item.nitem  := IfThen(outrosAjPorItem, items.fint('nitem'));
        item.vbc    := IfThen(items.ffloat('valor_icmsub_ant') > 0, items.ffloat('base_icmsub_ant') * items.ffloat('quantidade'), items.ffloat('bcajuste'));
        item.vicms  := IfThen(items.ffloat('valor_icmsub_ant') > 0, items.ffloat('valor_icmsub_ant')* items.ffloat('quantidade'), items.ffloat('vajuste'));
        item.paliq  := 0;//IfThen(items.ffloat('valor_icmsub_ant') = 0, items.ffloat('pajuste'));
        item.codobs := id;

        list.HandleNewItem(item);
      end;      

      items.dataSet.Next;
    end;

    for item in list.items do
    begin
      vLancFiscal.dataSet.Locate('COD_OBS', item.codobs, []);

      if item.nitem > 0 then
        filterStr('NITEM = %d AND COD_AJ = %s', [item.nitem, vLancFiscal.fstrq('COD_PADRAO_AJUSTE')])
      else
        filterStr('COD_AJ = ' + vLancFiscal.fstrq('COD_PADRAO_AJUSTE'));

      if fstr('COD_AJ') = vLancFiscal.fstr('COD_PADRAO_AJUSTE') then
        dataSet.Edit
      else
      begin
        dataSet.Insert;
        dataSet.FieldByName('cod_nf').AsInteger := items.fint('cod_nf');
        dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        dataSet.FieldByName('nitem').AsInteger := item.nitem;
        dataSet.FieldByName('cod_aj').AsString := vLancFiscal.fstr('cod_padrao_ajuste');
        dataSet.FieldByName('cod_obs').AsInteger := vLancFiscal.fint('cod_obs');
      end;

      dataSet.FieldByName('VL_BC_ICMS').AsFloat := item.vbc;
      dataSet.FieldByName('VL_ICMS').AsFloat := item.vicms;
      dataSet.FieldByName('ALIQ_ICMS').AsFloat := item.paliq;
      dataSet.FieldByName('VL_OUTROS').AsFloat := 0;
      dataSet.Post;
    end;

    Result := (dataSet.ChangeCount = 0) or Apply;

  finally
    filterClear;
    consulta.Free;
    list.Free;
  end;
end;

function TSpedFiscalNF_C195_C197._gerarRegistroAutomatico(cod_nf,
  nitem: integer; base_icm_icm_st, valor_icm_icm_st, aliq_icm,
  valor_outros: Extended): Boolean;
begin
  try
    if vLancFiscal.dataSet.IsEmpty then
      raiseExceptionCreate('Sem Lançamentos Fiscais. Favor cadastrar!', '');


    if Trim(vLancFiscal.dataSet.FieldByName('COD_PADRAO_AJUSTE').AsString) = '' then
      raiseExceptionCreate('Código padrão de ajuste não informado no cadastro de Lançamentos Fiscais!', '');

    abreC195_C197(cod_nf);

    try
      if nitem > 0 then
        dataset.Filter := 'NITEM = ' + IntToStr(nitem) + ' AND COD_AJ = ''' + Trim(vLancFiscal.dataSet.FieldByName('COD_PADRAO_AJUSTE').AsString) + ''''
      else
        dataset.Filter := 'COD_AJ = ''' + Trim(vLancFiscal.dataSet.FieldByName('COD_PADRAO_AJUSTE').AsString) + '''' ;

      dataset.Filtered := True;

      if Trim(dataSet.FieldByName('COD_AJ').AsString) =
        Trim(vLancFiscal.dataSet.FieldByName('COD_PADRAO_AJUSTE').AsString) then
        dataSet.Edit
      else if not incluirC195_c197(cod_nf, nitem, base_icm_icm_st, valor_icm_icm_st, aliq_icm, valor_outros) then
        raiseExceptionCreate( 'Impossivel incluir lançamento de ajuste', '');

      dataSet.FieldByName('COD_AJ').AsString := vLancFiscal.dataSet.FieldByName('COD_PADRAO_AJUSTE').AsString;
      dataSet.FieldByName('COD_OBS').AsInteger := vLancFiscal.dataSet.FieldByName('COD_OBS').AsInteger;
      if base_icm_icm_st > 0 then
        dataSet.FieldByName('VL_BC_ICMS').AsFloat := base_icm_icm_st;
      if valor_icm_icm_st > 0 then
        dataSet.FieldByName('VL_ICMS').AsFloat := valor_icm_icm_st;
      if aliq_icm > 0 then
        dataSet.FieldByName('ALIQ_ICMS').AsFloat := aliq_icm;
      if valor_outros > 0 then
        dataSet.FieldByName('VL_OUTROS').AsFloat := valor_outros;

      dataSet.Post;
      Result := Apply;

    finally
      dataset.Filtered := False;
    end;

  except
    on e : Exception do begin
      Result := False;
      registraErro('TSpedFiscalNF_C195_C197._gerarRegistroAutomatico. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

{ TLancItemC195C197List }

constructor TLancItemC195C197List.Create;
begin
  SetLength(Fitems, 0);
end;

destructor TLancItemC195C197List.Destroy;
var
  I: Integer;
begin
  for I := Low(Fitems) to High(Fitems) do
    Fitems[I].Free;

  SetLength(Fitems, 0);

  inherited;
end;

procedure TLancItemC195C197List.HandleNewItem(newItem: TLancItemC195C197);
var
  I: Integer;
begin
  for I := Low(Fitems) to High(Fitems) do
    if (Fitems[I].codobs = newItem.codobs)
      //and (Fitems[I].paliq = newItem.paliq) 
      and (Fitems[I].nitem = newItem.nitem) then
    begin
      Fitems[I].vbc := Fitems[I].vbc + newItem.vbc;
      Fitems[I].vicms := Fitems[I].vicms + newItem.vicms;
      Exit;
    end;

  SetLength(Fitems, Length(Fitems) + 1);
  Fitems[High(Fitems)] := newItem;
end;

{ TSpedFiscal1921 }

procedure TSpedFiscal1921.AfterOpen(Sender: TObject);
begin
  dataSet.FieldByName('num_nf').Visible := False;
  dataSet.FieldByName('id').Visible := False;
  dataSet.FieldByName('cod_empresa').Visible := False;

  dataSet.FieldByName('nitem').OnGetText := GetTextDataSet;
  dataSet.FieldByName('descr_compl').OnGetText := GetTextDataSet;
end;

constructor TSpedFiscal1921.Create(AOwner: TDataSet_OOP);
begin
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_1921');
//  Fobjeto := TOpFiscal.Create;
  TableName := 'EFD_1921';
  _dataSetOOP_AfterOpen := AfterOpen;

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('id,num_nf,cod_empresa', fvInvisivel)
      .Add('valor_ajuste', '', '', DisplayNumber(2), fvInvisivel)
      .Add('aliquota_ajuste', '', '', DisplayNumber(2), fvInvisivel)
  );

  CamposSelect := 'e.id, e.cod_empresa, nf.num_nf,  nfi.nitem, e.cod_ajuste, e.valor_ajuste, e.aliquota_ajuste, e.descr_compl';
end;

destructor TSpedFiscal1921.Destroy;
begin
  FreeDbComponents(True);
  inherited;
end;

function TSpedFiscal1921.GetItem(id: string): TEfd1921;
begin
  Result := nil;
  if SqlOpen('select * from efd_1921 where id = ''%s'' and cod_empresa = %d', [id, vDadosIni.cod_empresa]).RecordCount >= 1 then
    Result := TEfd1921.Create().CopyFrom(buscas) as TEfd1921;
end;

function TSpedFiscal1921.GetListCodAjustes: TStrings;
var
  query: TQuery_OOP;
begin
  Result := NewStringList(True);
  query := QueryHelper.CreateObj(buscas)
    .Open('select distinct cod_ajuste from efd_1921 where cod_empresa = %d order by cod_ajuste', [vDadosIni.cod_empresa])
    .First();
  while not query.Eof do
  begin
    Result.Add(query.fstr('cod_ajuste'));
    query.Next;
  end;

  query.Close;
end;

procedure TSpedFiscal1921.GetTextDataSet(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'NITEM'  then
  begin
    if Sender.AsString = '' then
      Text := '0'
    else
      Text := Sender.AsString;
  end
  else if Sender.FieldName = 'DESCR_COMPL' then
  begin
    if Length(Sender.AsString) > 64 then
      Text := Copy(Sender.AsString, 1, 64)
    else
      Text := Copy(Sender.AsString, 1, Length(Sender.AsString) -2);

  end;
end;

procedure TSpedFiscal1921.OpenByCodNf(cod_nf: Integer);
begin
  Self.ClientOpen('select * from (' +
                  ' select %s from notafiscal nf' +
                  ' inner join NOTAFISCAL_ITEM nfi on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
                  ' inner join efd_1921 e on e.ref_id = nfi.guidt and e.cod_empresa = nfi.cod_empresa' +
                  ' where nf.cod_nf = %d and nf.cod_empresa = %d' +
                  ' union all' +
                  ' select %s from notafiscal nf' +
                  ' inner join efd_1921 e on e.ref_id = nf.guidt and e.cod_empresa = nf.cod_empresa' +
                  ' left join NOTAFISCAL_ITEM nfi on nfi.cod_nf = -1 and nfi.cod_empresa = -1' +
                  ' where nf.cod_nf = %d and nf.cod_empresa = %d) as c' +
                  ' order by c.nitem',
                  [CamposSelect, cod_nf, vDadosIni.cod_Empresa,
                   CamposSelect, cod_nf, vDadosIni.cod_Empresa]);
end;

function TSpedFiscal1921.RemoveItem(id: string): TEfd1921;
begin 
  try

    SqlExec('delete from efd_1921 where id = ''%s'' and cod_empresa = %d', [id, vDadosIni.cod_empresa]);
    if transacao.InTransaction then
      transacao.Commit;

    Self.Refresh;

  except on E: Exception do
    begin

      registraErro('TSpedFiscal1921.RemoveItem[%s]: %s',[id, e.Message]);
      ShowAtencao('Erro ao salvar registro de Subapuração do ICMS: ' + e.Message);
    end;
  end;
end;

function TSpedFiscal1921.Save(registro: TEfd1921): Boolean;
begin

  try

    if registro.id <> '' then
      SqlExec(registro.SQLMotor().SQLUpdate)
    else
      SqlExec(registro.SQLMotor().SQLInsert);

    transacao.Commit;

    Self.Refresh;

  except on E: Exception do
    begin
      Result := false;

      registraErro('TSpedFiscal1921.Save' + e.Message);
    end;
  end;
end;

{ TSpedFiscalSumarioAjustes }

procedure TSpedFiscalSumarioAjustes.AfterOpen(Sender: TObject);
begin
  dataSet.FieldByName('descr_aj_c197').OnGetText := GetTextDataSet;
  dataSet.FieldByName('descr_aj_1921').OnGetText := GetTextDataSet;
end;

constructor TSpedFiscalSumarioAjustes.Create(AOwner: TDataSet_OOP);
begin
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_sum_ajustes');
  _dataSetOOP_AfterOpen := AfterOpen;

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('cod_nf,id_1921', fvInvisivel)
      .Add('natureza_nf', 'E/S')
      .Add('base_icms', '', '', DisplayNumber(2))
      .Add('aliq_icms', '', '', DisplayNumber(2))
      .Add('valor_icms', '', '', DisplayNumber(2))
      .Add('valor_contabil', '', '', DisplayNumber(3))
      .Add('valor_aj_c197', '', '', DisplayNumber(2))
      .Add('valor_aj_1921', '1921 !', '', DisplayNumber(2))
  );

end;

destructor TSpedFiscalSumarioAjustes.Destroy;
begin
  FreeDbComponents(True);
  inherited;
end;

procedure TSpedFiscalSumarioAjustes.GetTextDataSet(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if MatchText(Sender.FieldName, ['DESCR_AJ_C197', 'DESCR_AJ_1921'])then
  begin
    if Length(Sender.AsString) > 64 then
      Text := Copy(Sender.AsString, 1, 64)
    else
      Text := Copy(Sender.AsString, 1, Length(Sender.AsString) -2);
  end;
end;

procedure TSpedFiscalSumarioAjustes.OpenByDate(mes, ano: Integer);
var
  dIni, dFim: TDateTime;
begin
  dIni := StartOfAMonth(ano, mes);
  dFim := EndOfAMonth(ano, mes);

  Self.Close;
  Self.SqlClient( 'select '' '' SEL, nf.cod_nf, nf.data_lanc data_nf, nf.num_nf, nf.emissao_propria, nf.natureza_nf, c.nitem, nfi.descricao_item, nfi.aliq_icm aliq_icms, nfi.base_icm base_icms, nfi.valor_icm valor_icms,' +
                  ' (coalesce(nfi.valor_total,0) -  coalesce(nfi.rateio_desconto, 0) + coalesce(nfi.rateio_seguro,0) + coalesce(nfi.rateio_outdesp,0) +' +
                  ' iif(nf.frete_f_nfe = ''S'', 0, coalesce(nfi.rateio_frete,0))) valor_contabil,' +
                  ' iif(c.nitem = 0, c.cod_ajuste, null) cod_ajuste,' +
                  ' max(iif(c.tipo = ''C197'', c.cod_ajuste, null)) COD_AJ_C197,' +
                  ' sum(iif(c.tipo = ''C197'', c.valor_ajuste, null)) VALOR_AJ_C197,' +
                  ' max(iif(c.tipo = ''C197'', c.descr_compl, null)) DESCR_AJ_C197,' +
                  ' max(iif(c.tipo = ''C197'', c.cod_obs, null)) COD_OBS,' +
                  ' max(iif(c.tipo = ''1921'', c.cod_ajuste, null)) COD_AJ_1921,' +
                  ' sum(iif(c.tipo = ''1921'', c.valor_ajuste, null)) VALOR_AJ_1921,' +
                  ' max(iif(c.tipo = ''1921'', c.descr_compl, null)) DESCR_AJ_1921,' +
                  ' max(iif(c.tipo = ''1921'', c.id_1921, null)) ID_1921' +
                  ' from (' +
                  ' select ''C197'' tipo, nf.cod_nf, nf.cod_empresa, c1.cod_obs, c1.nitem, c1.cod_aj cod_ajuste, c1.descr_compl_aj descr_compl, c1.vl_icms valor_ajuste, null id_1921' +
                  ' from notafiscal nf' +
                  ' inner join notafiscal_sped_c195_c197 c1 on c1.cod_nf = nf.cod_nf and c1.cod_empresa = nf.cod_empresa' +
                  ' inner join NOTAFISCAL_ITEM nfi on nfi.cod_nf = c1.cod_nf and nfi.cod_empresa = c1.cod_empresa and nfi.nitem = c1.nitem' +
                  ' where nf.data_lanc >= :data_ini and nf.data_lanc <= :data_fim and nf.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''C197'' tipo, nf.cod_nf, nf.cod_empresa, c1.cod_obs, c1.nitem, c1.cod_aj cod_ajuste, c1.descr_compl_aj descr_compl, c1.vl_icms valor_ajuste, null id_1921' +
                  ' from notafiscal nf' +
                  ' inner join notafiscal_sped_c195_c197 c1 on c1.cod_nf = nf.cod_nf and c1.cod_empresa = nf.cod_empresa and c1.nitem = 0' +
                  ' where nf.data_lanc >= :data_ini and nf.data_lanc <= :data_fim and nf.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''1921'' tipo, nf.cod_nf, nf.cod_empresa, null cod_obs, nfi.nitem, ei.cod_ajuste, ei.descr_compl, ei.valor_ajuste, ei.id id_1921' +
                  ' from notafiscal nf' +
                  ' inner join NOTAFISCAL_ITEM nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
                  ' inner join efd_1921 ei on ei.ref_id = nfi.guidt and ei.cod_empresa = nfi.cod_empresa' +
                  ' where nf.data_lanc >= :data_ini and nf.data_lanc <= :data_fim and nf.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''1921'' tipo, nf.cod_nf, nf.cod_empresa, null cod_obs, 0 nitem, ei.cod_ajuste, ei.descr_compl, ei.valor_ajuste, ei.id id_1921' +
                  ' from notafiscal nf' +
                  ' inner join efd_1921 ei on ei.ref_id = nf.guidt and ei.cod_empresa = nf.cod_empresa' +
                  ' where nf.data_lanc >= :data_ini and nf.data_lanc <= :data_fim and nf.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''ITEM'' tipo, nf.cod_nf, nf.cod_empresa, null cod_obs, nfi.nitem, '''' cod_ajuste, '''' descr_compl, 0.0 valor_ajuste, null id_1921' +
                  ' from notafiscal nf' +
                  ' inner join NOTAFISCAL_ITEM nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' +
                  ' left join notafiscal_sped_c195_c197 c1 on c1.cod_nf = nfi.cod_nf and c1.cod_empresa = nfi.cod_empresa and c1.nitem = nfi.nitem' +
                  ' left join efd_1921 ei on ei.ref_id = nfi.guidt and ei.cod_empresa = nfi.cod_empresa' +
                  ' where nf.data_lanc >= :data_ini and nf.data_lanc <= :data_fim and nf.cod_empresa = :cod_empresa and c1.cod_nf is null and ei.id is null' +
                  ' ) as c' +
                  ' inner join notafiscal nf on nf.cod_nf = c.cod_nf and nf.cod_empresa = c.cod_empresa' +
                  ' left join notafiscal_item nfi on nfi.cod_nf = c.cod_nf and nfi.cod_empresa = c.cod_empresa and nfi.nitem = c.nitem' +
                  ' group by cod_nf, data_nf, num_nf, emissao_propria, natureza_nf, nitem, descricao_item, aliq_icms, base_icms, valor_icms, valor_contabil, cod_ajuste' +
                  ' order by data_nf, num_nf, cod_nf, nitem')
    .ParamValue('data_ini', dIni)
    .ParamValue('data_fim', dFim)   
    .ParamValue('cod_empresa', vDadosIni.cod_Empresa)
    .Open;
end;

procedure TSpedFiscalSumarioAjustes.RemoverAjustesFiltro(regC197,
  reg1921: Boolean);
var
  filterRescue: string;
begin
  if (not regC197) and (not reg1921) then
    Exit;

  filterRescue := Trim(dataSet.Filter);
  dataSet.Filter := filterRescue + IfThen(filterRescue <> '', ' and ') + ' SEL = ''S''';
  prepare_loop();
  try

    Self.First;
    while not Self.Eof do
    begin
      if regC197
        and (fint('COD_OBS') > 0)
        and (not fempty('COD_AJ_C197')) then
      begin
        Auditor.GravarMensagem('NUM NF %d NITEM %d COD_OBS %d COD_AJ %s', [fint('num_nf'), fint('nitem'), fint('cod_obs'), fstr('COD_AJ_C197')]);
        SqlExec('delete from notafiscal_sped_c195_c197' +
                ' where cod_nf = %d and cod_empresa = %d and cod_obs = %d and nitem = %d and cod_aj = ''%s''',
                [fint('cod_nf'), vDadosIni.cod_empresa, fint('cod_obs'), fint('nitem'), fstr('COD_AJ_C197')]);
      end
      else if reg1921
        and (not fempty('ID_1921')) then
      begin
        Auditor.GravarMensagem('NUM NF %d NITEM %d SUBAPURACAO COD_AJ %s', [fint('num_nf'), fint('nitem'), fstr('COD_AJ_1921')]);
        SqlExec('delete from EFD_1921' +
                ' where id = ''%s'' and cod_empresa = %d',
                [fstr('ID_1921'), vDadosIni.cod_empresa]);
      end;

      Self.Next;
    end;
    Self.transacao.Commit;
    Self.CancelUpdates;
    Self.Refresh;

  finally
    prepare_loop_done();
    dataSet.Filter := filterRescue;
    dataSet.Filtered := True;
  end;

end;

end.
