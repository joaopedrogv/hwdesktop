unit uClassesCIAP;

interface

uses
  uDataSet_OOP, DBClient, DB, StdCtrls, uDadosIni, Classes, Graphics;

type
  TipoArray = array of TColor;

  RLayoutArquivo = record
    CodCTA_Pos, CodCTA_Tamanho: integer;
    NomeCTA_Pos, NomeCTA_Tamanho: integer;
    NatCTA_Pos, NatCTA_Tamanho: integer;
    IndCTA_Pos, IndCTA_Tamanho: integer;
    NivelCTA_Pos, NivelCTA_Tamanho: integer;
    RefRFBCTA_Pos, RefRFBCTA_Tamanho: integer;
    CodCTA_Texto, NomeCTA_Texto, NatCTA_Texto, IndCTA_Texto, NivelCTA_Texto, RefRFBCTA_Texto: string;
    SqlImportacao: string;
    memoImport, memoLog: TMemo;
  end;

  TControleCreditosFiscais = class;
  TControleCreditosFiscais_Item = class;
  TMovimento_CIAP = class;
  TPlanoContasContabil = class;
  TCentroCustos = class;
  TCIAP = class;
  TEquipamento_CIAP = class;
  TNF_CIAP = class;
  TNFItem_CIAP = class;
  TCST_PIS_Relacao = class;

  TCST_PIS_Relacao = class(TDataSet_OOP)
  private
    fCST      :string;
    fTIPO     :string;
    fSUBTIPO  :string;
    fCOD_CTA  :string;
  public
    constructor create;
    function _abreRelacao : Boolean;
    function post         : Boolean; override;
    function insert       : Boolean; override;
    function edit         : Boolean; override;
    function delete       : Boolean; override;
  end;

  TNFItem_CIAP = class(TDataSet_OOP)
  private
    FQtdeAplicada: Double;
  public
    constructor create;
    function selecionaItensNf(pCodNf: Integer): boolean;

    property QtdeAplicada: Double read FQtdeAplicada write FQtdeAplicada;
  end;

  TNF_CIAP = class(TDataSet_OOP)
  private
    procedure AfterScrollItensNF(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create;
    function pesquisaNF(pdataIni, pDataFim, pEntradaSaida: string; pNumNf, pCodCliente: integer):
      boolean; overload;
    function pesquisaNF(pEmissao_propria, pModelo_nf, pSerie, pData_Contabil, pNatureza_nf: string;
      pCodCliente, pNum_NF: integer):
      boolean; overload;
  var
    vItemNf: TNFItem_CIAP;
  end;

  TCIAP = class(TDataSet_OOP)
  public
    constructor create;
    procedure CadCiap(TipoForm: integer);
    function abreFormLancamentoValores: boolean;
    procedure pesquisaPeriodo(pMes, pAno: integer; var pVL_TRIB_EXP: Currency; var pVL_TOTAL:
      Currency);
    function salvaValoresPeriodo(pMes, pAno: integer; pVL_TRIB_EXP, pVL_TOTAL:
      Currency): boolean;
  end;

  TEquipamento_CIAP = class(TDataSet_OOP)
  public
    constructor create;
    function abreEquipamentos: boolean; overload;
  end;

  TMovimento_CIAP = class(TDataSet_OOP)
  private
    function abreFormPesquiaNotaFiscal: boolean;
  public
    destructor Destroy; override;
    constructor create;
    function delete: boolean; override;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    procedure CadMovimentoCiap(TipoForm: integer);
    function abreFormMovimentacaoBem: boolean;
    function salvaMovimentacaoBemComp: boolean;
    function existeBemOuComponente(codigo: integer): boolean;
    procedure buscaClienteOuNotaFiscal(pClienteOuNf: string);
    procedure buscaProduto;
    procedure ReplicarMovimentacao(AParcelaIni, AParcelaFim: Integer);
  var
    vCOD_IND_BEM, vNUM_PARC, vNUM_PARC_INI, vNUM_PARC_FIM: Integer;
    vDT_MOV, vTIPO_MOV: string;
    vVL_IMOB_ICMS_OP, vVL_IMOB_ICMS_ST, vVL_IMOB_ICMS_FRT, vVL_IMOB_ICMS_DIF,
      vVL_PARC_PASS: Currency;
    vLancarBaixaUltimaParcela: Boolean;
    vEquip: TEquipamento_CIAP;
    vNf: TNF_CIAP;
  end;

  TControleCreditosFiscais_Item = class(TDataSet_OOP)
  public
    constructor create;
    function post: boolean; override;
    function selecionaIten(codigo: integer): boolean;
  end;

  TControleCreditosFiscais = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function delete: boolean; override;
    function post: boolean; override;
    function edit: boolean; override;
    function insert: boolean; override;
    function insertItem: boolean;
    function salvaItem: boolean;
    procedure ControleCreditosFiscais(TipoForm: integer);
  var
    vItem: TControleCreditosFiscais_Item;
  end;

  TCentroCustos = class(TDataSet_OOP)
  public
    constructor create;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function restauraLixeira: boolean;
    function delete: boolean; override;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    procedure CadCentroCustos(TipoForm: integer);
  end;

  TPlanoContasContabil = class(TDataSet_OOP)
  private
    fListaDeleteConfigDRE: TStringList;
    fMaxNivel: Integer;
    fCorPersonalizadaFundo: TipoArray;
    fCorPersonalizadaFonte: TipoArray;
    fListaFormulaNaoApl: TStringList;
    fconfigDREsofreuAlteracao: boolean;
    FlkContador: TDadosLookUp_OOP;

    procedure configDREBeforePost(DataSet: TDataSet);
    procedure configDREBeforeDelete(DataSet: TDataSet);
    function decodeFormula(var pFormula: string; var pOperador: string; var pRetorno: string; var pMsg: string; var pContinuar: Boolean): Boolean; // retorna falha se nao conseguir validar a formula
    function validarFormulaRegistroAtual: Boolean;
  public
    constructor create;
    constructor create_ex;
    destructor Destroy; override;
    function abrePlanoContasContabil: boolean;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function restauraLixeira: boolean;
    function delete: boolean; override;
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    procedure CadPlanoContasC(TipoForm: integer);
    function importarArquivoTexto(pArquivoTexto: string): boolean;
    function executarSql: boolean;
    function abreFormModificarDadosEmGrupo: boolean;
    function abreFormImportacao: boolean;
    function abreFormLog: boolean;
    function abreFormRelacaoCST: boolean;
    function abreFormCadastrRelacaoCST: boolean;
    function iniciarConfiguracaoDREComparativo: Boolean;
    function moverConfiguracaoDRE(pDirecao: TDirecao): Boolean;
    function adicionarConfiguracaoSelecionadaDRE(pDirecao: TDirecao): Boolean;
    function removerConfiguracaoSelecionadaDRE: Boolean;
    function salvarConfiguracaoDRE: Boolean;
    function formulaValida: Boolean;
    function ExisteContaContabil(ACodContaContabil: string; AShowErro: Boolean = True): Boolean;

    procedure setCorPersonalizadaFundo(pNivel: Integer; pColor: TColor);
    function getCorPersonalizadaFundo(pNivel: Integer): TColor;
    procedure setCorPersonalizadaFonte(pNivel: Integer; pColor: TColor);
    function getCorPersonalizadaFonte(pNivel: Integer): TColor;

    property MaxNivel: Integer read fMaxNivel write fMaxNivel;
    property configDREsofreuAlteracao: boolean read fconfigDREsofreuAlteracao;
    property lkContador: TDadosLookUp_OOP read FlkContador write FlkContador;
  var
    vLayoutarquivo: RLayoutArquivo;
    vCstRel: TCST_PIS_Relacao;
    configDRE, espConfigDRE: TClientDataSet;
  end;

implementation

uses uDtmCIAP, IBQuery, IBDatabase, Forms, Windows, uDtmAtivo, uCIAP, SysUtils,
  uCadPlContasContabil, uPadrao, dialogs, messages,
  Controls, inifiles, uCadCentroCustos, uCadMovimentacaoBem,
  DateUtils, Variants, uCadContCredSped, Math;

{ TPlanoContasContabil }


function exp_ExisteContaContabil(ACodContaContabil: string; AShowErro: Boolean = True): Boolean;
var
  ACntContabil: TPlanoContasContabil;
begin
  ACntContabil := TPlanoContasContabil.create_ex;
  try
    Result := ACntContabil.ExisteContaContabil(ACodContaContabil, AShowErro);
  finally
    FreeAndNil(ACntContabil);
  end;
end;

exports
  exp_ExisteContaContabil;

function TPlanoContasContabil.abreFormCadastrRelacaoCST: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Relação CST/Conta Contábil';
    frmPlContasContabil.pnCSTCadastro.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);
  finally
    frmPlContasContabil.pnCSTCadastro.Parent := frmPlContasContabil.tsCSTRel;
    formulario.Free;
    formulario := nil;
  end;
end;

function TPlanoContasContabil.abreFormImportacao: boolean;
var
  formulario: TfrmPadrao;
begin                 
    if not vDadosIni.PesqPros('SPED068','ABRIR','','P_CONTAS_CONTABIL','',buscas,True) then
      Exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Log do Processamento do arquivo Texto';
    frmPlContasContabil.pnImportacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);
    if Result then
      executarSql;
  finally
    frmPlContasContabil.pnImportacao.Parent := frmPlContasContabil.tsImportacao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TPlanoContasContabil.abreFormLog: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Log do Processamento do arquivo Texto';
    frmPlContasContabil.pnLog.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);
  finally
    frmPlContasContabil.pnLog.Parent := frmPlContasContabil.tsLog;
    formulario.Free;
    formulario := nil;
  end;
end;

function TPlanoContasContabil.abreFormModificarDadosEmGrupo: boolean;
var
  formulario: TfrmPadrao;
  vNatureza, vIndicador: string;
  vNivelCTA: integer;
begin
    if not vDadosIni.PesqPros('SPED067','ABRIR','','P_CONTAS_CONTABIL','',buscas,True) then
      Exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Modificar dados das Contas Selecionadas';
    frmPlContasContabil.pnModGrupo.Visible := True;
    frmPlContasContabil.pnModGrupo.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmPlContasContabil.pnModGrupo.Refresh;
    result := (formulario.ShowModal = IDOK);
    vNivelCTA := frmPlContasContabil.SpinEdit1.Value;
    vNatureza := frmPlContasContabil.Combobox4.text;
    vIndicador := frmPlContasContabil.Combobox5.text;
    if Result then
      Result := Application.MessageBox('Deseja mesmo alterar os dados das contas selecionadas?',
        'Confirmação', MB_ICONQUESTION +
        MB_YESNO) = IDYES;
    if Result then
    begin
      dataSet.First;
      while not dataSet.Eof do
      begin
        if frmPlContasContabil.DBGrid1.SelectedRows.CurrentRowSelected then
        begin
          dataSet.Edit;
          dataSet.FieldByName('nivel').AsInteger := vNivelCTA;
          dataSet.FieldByName('cod_nat_cc').AsString := vNatureza;
          dataSet.FieldByName('ind_cta').AsString := vIndicador;
          dataSet.Post;
        end;
        dataSet.Next;
      end;
      if Apply then
        CommitaTransacao;
    end;
  finally
    frmPlContasContabil.pnModGrupo.Parent := frmPlContasContabil.tsModGrupo;
    formulario.Free;
    formulario := nil;
  end;
end;

function TPlanoContasContabil.abreFormRelacaoCST: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    vCstRel._abreRelacao;
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Relação de CST/Conta Contábil para associação no SPED PIS COFINS';
    frmPlContasContabil.pnCSTRel.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);
  finally
    frmPlContasContabil.pnCSTRel.Parent := frmPlContasContabil.tsCSTRel;
    formulario.Free;
    formulario := nil;
  end;
end;

function TPlanoContasContabil.abrePlanoContasContabil: boolean;
begin
	Result := montaSelect('select * from P_CONTAS_CONTABIL where ativo = 0');
end;

function TPlanoContasContabil.AbrirLixeira: boolean;
begin
  Result := montaSelect('select * from P_CONTAS_CONTABIL where ativo = 0');
end;

function TPlanoContasContabil.adicionarConfiguracaoSelecionadaDRE(pDirecao: TDirecao): Boolean;
var
  vOrdem: Integer;
  I: Integer;
begin
  if Trim(dataSet.FieldByName('COD_CTA').AsString) = '' then
    Exit;

  if pDirecao = tdAcima then
    vOrdem := configDRE.FieldByName('ORDEM').AsInteger//inserir acima do registro selecionado
  else
    vOrdem := configDRE.FieldByName('ORDEM').AsInteger + 1;//inserir abaixo do selecionado
  if vOrdem = 0 then
    vOrdem  := 1;

  try
    configDRE.Filter := 'COD_CTA = ' + QuotedStr(dataSet.FieldByName('COD_CTA').AsString);
    configDRE.Filtered := True;

    if Trim(dataSet.FieldByName('COD_CTA').AsString) = Trim(configDRE.FieldByName('COD_CTA').AsString) then
      Exit;
    configDRE.Filtered := False;

    configDRE.Last;
    while not configDRE.Bof do
    begin
      if pDirecao <> tdAcima then
        if (vOrdem) >= (configDRE.FieldByName('ORDEM').AsInteger + 1)then
          Break;

      configDRE.Edit;
      configDRE.FieldByName('ORDEM').AsInteger := configDRE.FieldByName('ORDEM').AsInteger + 1;
      configDRE.Post;

      if pDirecao = tdAcima then
        if (vOrdem + 1) = configDRE.FieldByName('ORDEM').AsInteger then
          Break;

      configDRE.Prior;
    end;

    configDRE.Insert;
    for I := 0 to configDRE.FieldCount - 1 do
      if dataSet.FindField(configDRE.Fields[i].FieldName) <> nil then
        configDRE.FieldByName(configDRE.Fields[i].FieldName).Value :=
          dataSet.FieldByName(configDRE.Fields[i].FieldName).Value;
    configDRE.FieldByName('ORDEM').AsInteger := vOrdem;
    configDRE.FieldByName('NOME_CTA').AsString := vDadosIni.Space(configDRE.FieldByName('nivel').AsInteger * 2) +
      Trim(configDRE.FieldByName('NOME_CTA').AsString);
    configDRE.FieldByName('TIPO_REL').AsString := 'OUTRAS';
    if Trim(configDRE.FieldByName('SINAL').AsString) = '' then
      configDRE.FieldByName('SINAL').AsString := '+';
    if Trim(configDRE.FieldByName('SOMARGRUPO').AsString) = '' then
      configDRE.FieldByName('SOMARGRUPO').AsString := 'S';
    configDRE.Post;
    configDRE.IndexFieldNames := 'ORDEM';

  finally
    configDRE.Filtered := False;
    configDRE.RecNo := vOrdem;
  end;
end;

procedure TPlanoContasContabil.CadPlanoContasC(TipoForm: integer);
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);

  vDadosIni.vTipoForm := TipoForm;

  if frmPlContasContabil = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmPlContasContabil, frmPlContasContabil);
  end;

  if (TipoForm > 0) and (not frmPlContasContabil.Visible) then
    frmPlContasContabil.ShowModal
  else if (not frmPlContasContabil.Visible) then
    frmPlContasContabil.Show
  else if frmPlContasContabil.FormStyle = fsMDIChild then
    frmPlContasContabil.Show
  else
    frmPlContasContabil.ShowModal;
end;

procedure TPlanoContasContabil.configDREBeforeDelete(DataSet: TDataSet);
begin
  espConfigDRE.Filter := 'COD_CTA = ' + QuotedStr(Trim(DataSet.FieldByName('COD_CTA').AsString));
  espConfigDRE.Filtered := True;

  if not espConfigDRE.IsEmpty then
    espConfigDRE.Delete;

  espConfigDRE.Filter := '';
  espConfigDRE.Filtered := False;

  fconfigDREsofreuAlteracao:= True;
end;

procedure TPlanoContasContabil.configDREBeforePost(DataSet: TDataSet);
var
  I: Integer;
begin
  espConfigDRE.Filter := 'COD_CTA = ' + QuotedStr(Trim(DataSet.FieldByName('COD_CTA').AsString));
  espConfigDRE.Filtered := True;

  if espConfigDRE.IsEmpty then
    espConfigDRE.Insert
  else
    espConfigDRE.Edit;
  for I := 0 to espConfigDRE.FieldCount - 1 do
    if configDRE.FindField(espConfigDRE.Fields[i].FieldName) <> nil then
      espConfigDRE.FieldByName(espConfigDRE.Fields[i].FieldName).Value :=
        configDRE.FieldByName(espConfigDRE.Fields[i].FieldName).Value;
  espConfigDRE.Post;

  espConfigDRE.Filter := '';
  espConfigDRE.Filtered := False;

  fconfigDREsofreuAlteracao:= True;
end;

constructor TPlanoContasContabil.create;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  dataSet := TClientDataSet(dtmCIAP.cdsPlContasC);
  buscas := TIBQuery(dtmCIAP.qrBuscas);
  transacao := TIBTransaction(dtmCIAP.transacao);
  vCstRel := TCST_PIS_Relacao.create;
  lkContador := TDadosLookUp_OOP.create;
end;

constructor TPlanoContasContabil.create_ex;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  //dataSet := TClientDataSet(dtmCIAP.cdsPlContasC);;//nao usar o datateset nos metodos chamados de fora
  buscas := TIBQuery(dtmCIAP.qrBuscas);
  transacao := TIBTransaction(dtmCIAP.transacao);
end;

function TPlanoContasContabil.decodeFormula(var pFormula, pOperador, pRetorno, pMsg: string; var pContinuar: Boolean): Boolean;
var
  vTmp: string;
  vrTmp: Double;
begin
  ///  esta funcao retorna sucesso na leitura da formula,
  ///  ela deve ser chamada até o parametro pContinuar for false
  ///  existe sempre 3 retornos, o Operador, o numero ou o campo(@chavetabela@) e o retante da formula
  vTmp := pFormula;
  pOperador := '';
  pRetorno := '';
  pContinuar := False;

  // 1º passo, obter o operador
  if vDadosIni.strEstaContidoEm(Copy(vTmp, 1, 1), ['+', '-', '*', '/']) then//teste de operador
  begin
    pOperador := Copy(vTmp, 1, 1);
    System.Delete(vTmp, 1, 1);
  end
  else
    pOperador := '+';

  // 2º passo, Testar se é campo e retornar o campo com o @ no inicio e final
  if Copy(vTmp, 1, 1) = '@' then
  begin
    System.Delete(vTmp, 1, 1);
    if Pos('@', vTmp) = 0 then
    begin
      pMsg:= 'FINAL DE CAMPO(@) NAO ENCONTRADO';
      pContinuar := False;
      Result := False;
      Exit;
    end;
    pRetorno := '@' + Copy(vTmp, 1, Pos('@', vTmp));
    System.Delete(vTmp, 1, Pos('@', vTmp));
    pContinuar := Trim(vTmp) <> '';// caso tenha mais na formula o continuar vai indicar
    pFormula := vTmp;
    Result := True;
  end
  else// caso nao seja campo será considerado sendo um valor
  begin
    if vDadosIni.PosMult(['+', '-', '*', '/'], vTmp) > 0 then// caso encontre outro operador na formula
    begin
      pRetorno := Copy(vTmp, 1, vDadosIni.PosMult(['+', '-', '*', '/'], vTmp) - 1);// o retorno vai até a posicao do 1º operador encontrado
      if not TryStrToFloat(pRetorno, vrTmp) then// teste numérico
      begin
        pMsg := 'NUMERO INVALIDO: ' + pRetorno;
        pContinuar := False;
        Result := False;
        Exit;
      end;
      System.Delete(vTmp, 1, vDadosIni.PosMult(['+', '-', '*', '/'], vTmp));
      pContinuar := True;
      pFormula := vTmp;
      Result := True;
    end
    else
    begin
      pRetorno := Trim(vTmp);
      if not TryStrToFloat(pRetorno, vrTmp) then// teste numérico
      begin
        pMsg := 'NUMERO INVALIDO: ' + pRetorno;
        pContinuar := False;
        Result := False;
        Exit;
      end;
      pContinuar := False;
      pFormula := '';
      Result := True;
    end;
  end;
end;

function TPlanoContasContabil.delete: boolean;
var
  vCod_CTA: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  vCod_CTA := dataSet.FieldByName('COD_CTA').AsString;

  if dataSet.FieldByName('ATIVO').AsInteger = 0 then
  begin              
    if not vDadosIni.PesqPros('SPED064','EXCLUIR','','P_CONTAS_CONTABIL','',buscas,True) then
      Exit;
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      result := inherited Delete;
      if Result then
        result := Apply;
      if result then
        result := CommitaTransacao;
            if Result then
              vDadosIni.GravaAuditoria('SPED064', 'EXCLUIR', 'SUCESSO', 'P_CONTAS_CONTABIL', vCod_CTA, buscas)
            else
              vDadosIni.GravaAuditoria('SPED064', 'EXCLUIR', 'FALHA', 'P_CONTAS_CONTABIL', vCod_CTA, buscas);

    end;
  end
  else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin       
    if not vDadosIni.PesqPros('SPED065','LIXEIRA','','P_CONTAS_CONTABIL','',buscas,True) then
      Exit;
    if inherited Edit then
    begin
      dataSet.FieldByName('ATIVO').asinteger := 0;
      result := inherited Post;
      if Result then
        result := Apply;
      if Result then
        result := CommitaTransacao;
            if Result then
              vDadosIni.GravaAuditoria('SPED065', 'ENVIAR REGISTRO PARA A LIXEIRA', 'SUCESSO', 'P_CONTAS_CONTABIL', vCod_CTA, buscas)
            else
              vDadosIni.GravaAuditoria('SPED065', 'ENVIAR REGISTRO PARA A LIXEIRA ', 'FALHA', 'P_CONTAS_CONTABIL', vCod_CTA, buscas);
    end;
  end;
  if Result then
    Refresh
  else
  begin
    CancelUpdates;
    Refresh;
  end;
end;

destructor TPlanoContasContabil.Destroy;
begin
  vCstRel.Free;
  vCstRel := nil;
  if configDRE <> nil then
  begin
    configDRE.Free;
    configDRE := nil;
  end;
  if Assigned(FlkContador) then
    FreeAndNil(FlkContador);
  inherited;
end;

function TPlanoContasContabil.edit: boolean;
begin
  if not vDadosIni.PesqPros('SPED063','ALTERAR','','P_CONTAS_CONTABIL','',buscas,False) then
    Exit;
  if inherited edit then
    Result := true;
end;

function TPlanoContasContabil.executarSql: boolean;
var
  I: Integer;
begin
  vLayoutarquivo.memoLog.Lines.Clear;
  vLayoutarquivo.memoLog.Lines.Add('Iniciando...');
  for I := 0 to vLayoutarquivo.memoImport.Lines.Count - 1 do
  begin
    if Trim(vLayoutarquivo.memoImport.Lines[i]) <> '' then
    begin
      buscas.Close;
      buscas.SQL.Text := Trim(vLayoutarquivo.memoImport.Lines[i]);
      try
        buscas.ExecSQL;
        vLayoutarquivo.memoLog.Lines.Add('OK: ' + vLayoutarquivo.memoImport.Lines[i])
      except
        on e: exception do begin
          vLayoutarquivo.memoLog.Lines.Add('Falha: ' + vLayoutarquivo.memoImport.Lines[i] + ' Erro: '
            + e.Message);
        end;
      end;
    end;
  end;
  vLayoutarquivo.memoLog.Lines.Add('Finalizado');
  abreFormLog;
end;

function TPlanoContasContabil.ExisteContaContabil(
  ACodContaContabil: string; AShowErro: Boolean): Boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cod_cta from P_CONTAS_CONTABIL' +
    ' where COD_CTA = :COD_CTA and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.ParamByName('COD_CTA').AsString := ACodContaContabil;
  buscas.Open;
  Result := Trim(buscas.FieldByName('cod_cta').AsString) = Trim(ACodContaContabil);
  buscas.Close;
  if (not Result) and (AShowErro) then
    vDadosIni.ShowErro('Conta informada não existe' + #13 + 'Conta: ' + ACodContaContabil);
end;

function TPlanoContasContabil.formulaValida: Boolean;
begin
  try
    configDRE.DisableControls;
    fListaFormulaNaoApl.Clear;
    Result := validarFormulaRegistroAtual;
  finally
    configDRE.EnableControls;
  end;
end;

function TPlanoContasContabil.getCorPersonalizadaFonte(pNivel: Integer): TColor;
var
  vLength: Integer;
begin
  try
    vLength := Length(fCorPersonalizadaFundo);
    if (pNivel > vLength) or (pNivel = 0) then
      Result := clWindowText
    else
      Result := fCorPersonalizadaFonte[pNivel - 1];
  except
    Result := clWindowText;
  end;
end;

function TPlanoContasContabil.getCorPersonalizadaFundo(pNivel: Integer): TColor;
var
  vLength: Integer;
begin
  try
    vLength := Length(fCorPersonalizadaFundo);
    if (pNivel > vLength) or (pNivel = 0) then
      Result := clWhite
    else
      Result := fCorPersonalizadaFundo[pNivel - 1];
  except
    Result := clWhite;
  end;
end;

function TPlanoContasContabil.importarArquivoTexto(pArquivoTexto: string): boolean;
var
  vArquivo: TextFile;
  vLinha: string;
  vTemp: string;
  vTempNivel: Integer;
  vTemp2: string;
  vTempInd: string;
begin
  AssignFile(vArquivo, pArquivoTexto);
  try
    Reset(vArquivo);
    vLinha := '';
    vLayoutarquivo.memoImport.Lines.Clear;
    while not System.Eof(vArquivo) do
    begin
      vLayoutarquivo.CodCTA_Texto := '';
      vLayoutarquivo.NomeCTA_Texto := '';
      vLayoutarquivo.NatCTA_Texto := '';
      vLayoutarquivo.IndCTA_Texto := '';
      vLayoutarquivo.NivelCTA_Texto := '';
      vLayoutarquivo.RefRFBCTA_Texto := '';

      Readln(vArquivo, vLinha);
      if (vLayoutarquivo.CodCTA_Pos > 0) and (vLayoutarquivo.CodCTA_Tamanho > 0) then
      begin
        vLayoutarquivo.CodCTA_Texto :=
          Copy(vLinha, vLayoutarquivo.CodCTA_Pos, vLayoutarquivo.CodCTA_Tamanho);
      end;
      if (vLayoutarquivo.NomeCTA_Pos > 0) and (vLayoutarquivo.NomeCTA_Tamanho > 0) then
      begin
        vLayoutarquivo.NomeCTA_Texto :=
          Copy(vLinha, vLayoutarquivo.NomeCTA_Pos, vLayoutarquivo.NomeCTA_Tamanho);
      end;
      if (vLayoutarquivo.NatCTA_Pos > 0) and (vLayoutarquivo.NatCTA_Tamanho > 0) then
      begin
        vLayoutarquivo.NatCTA_Texto :=
          Copy(vLinha, vLayoutarquivo.NatCTA_Pos, vLayoutarquivo.NatCTA_Tamanho);
      end;
      if (vLayoutarquivo.IndCTA_Pos > 0) and (vLayoutarquivo.IndCTA_Tamanho > 0) then
      begin
        vLayoutarquivo.IndCTA_Texto :=
          Copy(vLinha, vLayoutarquivo.IndCTA_Pos, vLayoutarquivo.IndCTA_Tamanho);
      end;
      if (vLayoutarquivo.NivelCTA_Pos > 0) and (vLayoutarquivo.NivelCTA_Tamanho > 0) then
      begin
        vLayoutarquivo.NivelCTA_Texto :=
          Copy(vLinha, vLayoutarquivo.NivelCTA_Pos, vLayoutarquivo.NivelCTA_Tamanho);
      end;
      if (vLayoutarquivo.RefRFBCTA_Pos > 0) and (vLayoutarquivo.RefRFBCTA_Tamanho > 0) then
      begin
        vLayoutarquivo.RefRFBCTA_Texto :=
          Copy(vLinha, vLayoutarquivo.RefRFBCTA_Pos, vLayoutarquivo.RefRFBCTA_Tamanho);
      end;

      if vLayoutarquivo.NatCTA_Pos = 0 then
        vLayoutarquivo.NatCTA_Texto := '01';

      vTemp := vLayoutarquivo.CodCTA_Texto;
      if Pos('.', vTemp) > 0 then
      begin
        vTempNivel := 0;
        vTempInd := 'S';
        while Pos('.', vTemp) > 0 do
        begin
          Inc(vTempNivel);
          vTemp := Copy(vTemp, Pos('.', vTemp) + 1, length(vTemp));
          vTemp2 := Copy(vTemp, 1, Pos('.', vTemp) - 1);
          if vLayoutarquivo.NivelCTA_Pos = 0 then
            vLayoutarquivo.NivelCTA_Texto := IntToStr(vTempNivel);
          if vLayoutarquivo.IndCTA_Pos = 0 then
            vLayoutarquivo.IndCTA_Texto := vTempInd;
          try
            if StrToInt(Trim(vTemp2)) = 0 then
            begin
              if vLayoutarquivo.NivelCTA_Pos = 0 then
                vLayoutarquivo.NivelCTA_Texto := IntToStr(vTempNivel);
              if vLayoutarquivo.IndCTA_Pos = 0 then
                vLayoutarquivo.IndCTA_Texto := vTempInd;
              Break;
            end;
          except
            if Trim(vTemp2) = '' then
            begin
              if StrToInt(Trim(vTemp)) = 0 then
                vTempInd := 'S'
              else
              begin
                vTempInd := 'A';
                inc(vTempNivel);
              end;
              if vLayoutarquivo.NivelCTA_Pos = 0 then
                vLayoutarquivo.NivelCTA_Texto := IntToStr(vTempNivel);
              if vLayoutarquivo.IndCTA_Pos = 0 then
                vLayoutarquivo.IndCTA_Texto := vTempInd;
            end;
            Break;
          end;
        end;
      end;
      vLayoutarquivo.SqlImportacao :=
        'INSERT INTO P_CONTAS_CONTABIL (COD_CTA, COD_EMPRESA, NOME_CTA, COD_NAT_CC, IND_CTA, NIVEL, COD_CTA_REF)' +
        ' VALUES (' + QuotedStr(vLayoutarquivo.CodCTA_Texto) + ', ' + vDadosIni.codEmpresa + ', ' +
        QuotedStr(vLayoutarquivo.NomeCTA_Texto) + ', ' + QuotedStr(vLayoutarquivo.NatCTA_Texto) +
        ', ' +
        QuotedStr(vLayoutarquivo.IndCTA_Texto) + ', ' + vLayoutarquivo.NivelCTA_Texto + ', ' + QuotedStr(vLayoutarquivo.RefRFBCTA_Texto) + ');';
      vLayoutarquivo.memoImport.Lines.Add(vLayoutarquivo.SqlImportacao);

    end;
    vLayoutarquivo.memoImport.Lines.Add('COMMIT;');
  finally
    CloseFile(vArquivo);
  end;
end;

function TPlanoContasContabil.iniciarConfiguracaoDREComparativo: Boolean;
var
  I: Integer;
begin
  if configDRE = nil then
  begin
    configDRE := TClientDataSet.Create(Application);
    configDRE.FieldDefs.Add('COD_CTA', ftString, 60, False);
    configDRE.FieldDefs.Add('NOME_CTA', ftString, 60, False);
    configDRE.FieldDefs.Add('IND_CTA', ftString, 1, False);
    configDRE.FieldDefs.Add('NIVEL', ftInteger, 0, False);
    configDRE.FieldDefs.Add('TIPO_REL', ftString, 10, False);
    configDRE.FieldDefs.Add('SINAL', ftString, 1, False);
    configDRE.FieldDefs.Add('FORMULA', ftString, 128, False);
    configDRE.FieldDefs.Add('SOMARGRUPO', ftString, 1, False);
    configDRE.FieldDefs.Add('ESTRUTURADRE', ftString, 32, False);
    configDRE.FieldDefs.Add('ORDEM', ftInteger, 0, False);
    configDRE.CreateDataSet;
    configDRE.BeforePost := configDREBeforePost;
    configDRE.BeforeDelete := configDREBeforeDelete;
    fListaDeleteConfigDRE := TStringList.Create;
    fListaFormulaNaoApl := TStringList.Create;
  end;
  configDRE.EmptyDataSet;
  if espConfigDRE = nil then
  begin
    espConfigDRE := TClientDataSet.Create(Application);
    for I := 0 to configDRE.FieldDefs.Count - 1 do
      espConfigDRE.FieldDefs.Add(configDRE.FieldDefs[I].Name , configDRE.FieldDefs[I].DataType, configDRE.FieldDefs[I].Size, False);
    espConfigDRE.CreateDataSet;
    espConfigDRE.IndexFieldNames := 'ORDEM';
  end;
  espConfigDRE.EmptyDataSet;

  fListaDeleteConfigDRE.Clear;
  fListaFormulaNaoApl.Clear;

  buscas.Close;
  buscas.SQL.Text := 'SELECT * FROM P_CONTAS_CONTABIL' +
    ' WHERE TIPO_REL IN (''RECEITA'', ''RECEITA P'', ''RECEITA S'', ''RECEITA V'', ''DEVOLUCAO'', ''CUSTO'', ''OUTRAS'',' +
    ' ''CR PIS'', ''CR COFINS'', ''CR ICMS'', ''DB PIS'', ''DB COFINS'', ''DB ICMS'')' +
    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' ORDER BY ESTRUTURADRE';
  buscas.Open;
  fMaxNivel := 0;

  buscas.First;
  while not buscas.Eof do
  begin

    configDRE.Insert;
    for I := 0 to configDRE.FieldCount - 1 do
      if buscas.FindField(configDRE.Fields[i].FieldName) <> nil then
        configDRE.FieldByName(configDRE.Fields[i].FieldName).Value :=
          buscas.FieldByName(configDRE.Fields[i].FieldName).Value;
    configDRE.FieldByName('ORDEM').AsInteger := buscas.RecNo;
    configDRE.FieldByName('NOME_CTA').AsString := vDadosIni.Space(configDRE.FieldByName('nivel').AsInteger * 2) +
      Trim(configDRE.FieldByName('NOME_CTA').AsString);
    if configDRE.FieldByName('nivel').AsInteger > fMaxNivel then
      fMaxNivel := configDRE.FieldByName('nivel').AsInteger;
    configDRE.Post;

    buscas.Next;
  end;
  configDRE.IndexFieldNames := 'ORDEM';

  configDRE.First;
  while not configDRE.Eof do
  begin
    configDRE.Edit;
    configDRE.FieldByName('NOME_CTA').AsString :=
      vDadosIni.Space(configDRE.FieldByName('nivel').AsInteger *
      vDadosIni.retornoPorCondicao(configDRE.FieldByName('nivel').AsInteger = fMaxNivel, 3, 2)) +
      Trim(configDRE.FieldByName('NOME_CTA').AsString);
    configDRE.Post;
    configDRE.Next;
  end;

  SetLength(fCorPersonalizadaFundo, fMaxNivel);
  for I := 0 to fMaxNivel - 1 do
    fCorPersonalizadaFundo[I] := StrToInt64Def( vDadosIni._LerConfiguracoesRegistroString('DRECorPersonalisadaFundoNivel' + IntToStr(I + 1)), clWhite);
  SetLength(fCorPersonalizadaFonte, fMaxNivel);
  for I := 0 to fMaxNivel - 1 do
    fCorPersonalizadaFonte[I] := StrToInt64Def( vDadosIni._LerConfiguracoesRegistroString('DRECorPersonalisadaFonteNivel' + IntToStr(I + 1)), clWindowText);

  fconfigDREsofreuAlteracao:= False;

  Result := True;
  configDRE.First;
end;

function TPlanoContasContabil.insert: boolean;
begin
  if not vDadosIni.PesqPros('SPED062','INCLUIR','','P_CONTAS_CONTABIL','',buscas,False) then
    Exit;
  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.Codempresa;
    dataSet.FieldByName('dt_alt').AsDateTime := vDadosIni.FusoDate();
    Result := true;
  end;
end;

function TPlanoContasContabil.moverConfiguracaoDRE(pDirecao: TDirecao): Boolean;
var
  vNovaOrdem, vTempOrdem, vRecNo: Integer;
  I: Integer;
begin
  if pDirecao = tdDireira then
  begin
    configDRE.Edit;
    configDRE.FieldByName('nivel').AsInteger := configDRE.FieldByName('nivel').AsInteger + 1;
    configDRE.FieldByName('NOME_CTA').AsString := vDadosIni.Space(configDRE.FieldByName('nivel').AsInteger * 2) +
      Trim(configDRE.FieldByName('NOME_CTA').AsString);
    if configDRE.FieldByName('nivel').AsInteger > fMaxNivel then
    begin
      fMaxNivel := configDRE.FieldByName('nivel').AsInteger;
      SetLength(fCorPersonalizadaFundo, fMaxNivel);

      for I := 0 to fMaxNivel - 1 do
        fCorPersonalizadaFundo[I] := StrToInt64Def( vDadosIni._LerConfiguracoesRegistroString('DRECorPersonalisadaFundoNivel' + IntToStr(I + 1)), clWhite);
      SetLength(fCorPersonalizadaFonte, fMaxNivel);
      for I := 0 to fMaxNivel - 1 do
        fCorPersonalizadaFonte[I] := StrToInt64Def( vDadosIni._LerConfiguracoesRegistroString('DRECorPersonalisadaFonteNivel' + IntToStr(I + 1)), clWindowText);
    end;
    configDRE.Post;
  end
  else if pDirecao = tdEsquerda then
  begin
    if configDRE.FieldByName('nivel').AsInteger <= 1 then
      Exit;
    configDRE.Edit;
    configDRE.FieldByName('nivel').AsInteger := configDRE.FieldByName('nivel').AsInteger - 1;
    configDRE.FieldByName('NOME_CTA').AsString := vDadosIni.Space(configDRE.FieldByName('nivel').AsInteger * 2) +
      Trim(configDRE.FieldByName('NOME_CTA').AsString);
    configDRE.Post;
  end
  else if pDirecao = tdAcima then
  begin
    if configDRE.FieldByName('ordem').AsInteger <= 1 then
      Exit;
    vRecNo :=configDRE.RecNo - 1;
    vNovaOrdem := configDRE.FieldByName('ordem').AsInteger - 1;
    vTempOrdem := configDRE.RecordCount + 1;
    //movendo o registro para ultima posicao
    configDRE.Filter := 'ORDEM = ' + IntToStr(configDRE.FieldByName('ordem').AsInteger);
    configDRE.Filtered := True;
    configDRE.Edit;
    configDRE.FieldByName('ordem').AsInteger := vTempOrdem;
    configDRE.Post;

    //movendo o registro de cima para baixo
    configDRE.Filter := 'ORDEM = ' + IntToStr(vNovaOrdem);
    configDRE.Edit;
    configDRE.FieldByName('ordem').AsInteger := vNovaOrdem + 1;
    configDRE.Post;

    //movendo o registro selecionado para a posicao final e definitiva dele
    configDRE.Filter := 'ORDEM = ' + IntToStr(vTempOrdem);
    configDRE.Edit;
    configDRE.FieldByName('ordem').AsInteger := vNovaOrdem;
    configDRE.Post;

    configDRE.Filtered := False;
    configDRE.RecNo := vRecNo;
  end
  else if pDirecao = tdAbaixo then
  begin
    if configDRE.FieldByName('ordem').AsInteger >= configDRE.RecordCount then
      Exit;
    vRecNo :=configDRE.RecNo + 1;
    vNovaOrdem := configDRE.FieldByName('ordem').AsInteger + 1;
    vTempOrdem := configDRE.RecordCount + 2;
    //movendo o registro para ultima posicao
    configDRE.Filter := 'ORDEM = ' + IntToStr(configDRE.FieldByName('ordem').AsInteger);
    configDRE.Filtered := True;
    configDRE.Edit;
    configDRE.FieldByName('ordem').AsInteger := vTempOrdem;
    configDRE.Post;

    //movendo o registro de baixo para cima
    configDRE.Filter := 'ORDEM = ' + IntToStr(vNovaOrdem);
    configDRE.Edit;
    configDRE.FieldByName('ordem').AsInteger := vNovaOrdem - 1;
    configDRE.Post;

    //movendo o registro selecionado para a posicao final e definitiva dele
    configDRE.Filter := 'ORDEM = ' + IntToStr(vTempOrdem);
    configDRE.Edit;
    configDRE.FieldByName('ordem').AsInteger := vNovaOrdem;
    configDRE.Post;

    configDRE.Filtered := False;
    configDRE.RecNo := vRecNo;
  end;
end;

function TPlanoContasContabil.post: boolean;
var
  acao: string;
begin
    if not vDadosIni.PesqPros('SPED069','SALVAR','','P_CONTAS_CONTABIL','',buscas,True) then
      Exit;
  try
    Result := false;
    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := true;
      exit;
    end;
    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if dataSet.FieldByName('cod_cta').asString = '' then
      raiseExceptionCreate('Código da Conta não informado!', 'DBEDIT1');

    if dataSet.FieldByName('nome_cta').asString = '' then
      raiseExceptionCreate('Descrição da Conta não informada!', 'DBEdit3');

    if dataSet.FieldByName('cod_nat_cc').asString = '' then
      raiseExceptionCreate('Natureza da Conta não informada!', 'DBComboBox1');

    if dataSet.FieldByName('ind_cta').asString = '' then
      raiseExceptionCreate('Indicador da Conta não informado!', 'DBComboBox2');

    if dataSet.FieldByName('nivel').asString = '' then
      raiseExceptionCreate('Nivel da Conta não informada!', 'DBEdit6');

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    Refresh;
    result := true;
    CommitaTransacao;

        if Result then
          vDadosIni.GravaAuditoria('SPED069', acao, 'SUCESSO', 'P_CONTAS_CONTABIL', dataSet.FieldByName('cod_cta').AsString, buscas)
        else
          vDadosIni.GravaAuditoria('SPED069', acao, 'FALHA', 'P_CONTAS_CONTABIL', dataSet.FieldByName('cod_cta').AsString, buscas);
    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Codigo da Conta já existe',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TPlanoContasContabil.removerConfiguracaoSelecionadaDRE: Boolean;
var
  vRecNo, vOrdem: Integer;
begin
  if configDRE.IsEmpty then
    Exit;

  vRecNo := configDRE.RecNo;
  vOrdem := configDRE.FieldByName('ORDEM').AsInteger;

  try
    fListaDeleteConfigDRE.Add(configDRE.FieldByName('COD_CTA').AsString);
    configDRE.Delete;

    configDRE.Filter := 'ORDEM >= ' + IntToStr(vOrdem);
    configDRE.Filtered := True;

    configDRE.First;
    while not configDRE.Eof do
    begin
      configDRE.Edit;
      configDRE.FieldByName('ORDEM').AsInteger := configDRE.FieldByName('ORDEM').AsInteger - 1;
      configDRE.Post;
      configDRE.Next;
    end;

  finally
    configDRE.Filtered := False;
    if vRecNo <= configDRE.RecordCount then
      configDRE.RecNo := vRecNo;
  end;
end;

function TPlanoContasContabil.restauraLixeira: boolean;
begin              
    if not vDadosIni.PesqPros('SPED066','RESTAURAR','','P_CONTAS_CONTABIL','',buscas,True) then
      Exit;
  result := false;
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
      begin
        if inherited Edit then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          result := inherited Post;
          if Result then
            result := Apply;
          if Result then
            result := CommitaTransacao;
          //          if Result then
          //            vDadosIni.GravaAuditoria('BAS067', 'RESTAURAR REGISTRO', 'SUCESSO', 'NAT_OP', dataSet.FieldByName('CODIGO_NOP').AsString, buscas)
          //          else
          //            vDadosIni.GravaAuditoria('BAS067', 'RESTAURAR REGISTRO', 'FALHA', 'NAT_OP', dataSet.FieldByName('CODIGO_NOP').AsString, buscas);
        end;
      end;
    end;
  Refresh; //dataSet.RefreshRecord;
end;

function TPlanoContasContabil.salvarConfiguracaoDRE: Boolean;
var
  I: Integer;
  vConta: string;
  vNivel: Integer;
  vValoresNiveis: array[1..10] of Integer;
begin
  Result := False;
  if not vDadosIni.PesqPros('SPED093', 'SALVAR', '','P_CONTAS_CONTABIL', '', Buscas, False) then
    Exit;

  try
    configDRE.DisableControls;

    for I := 0 to fListaDeleteConfigDRE.Count - 1 do
    begin
      try
        configDRE.Filter := 'COD_CTA = ' + QuotedStr(fListaDeleteConfigDRE[i]);
        configDRE.Filtered := True;

        if configDRE.IsEmpty then
        begin
          buscas.Close;
          buscas.SQL.Text := 'update P_CONTAS_CONTABIL set TIPO_REL = null' +
            ' where COD_CTA = ' + QuotedStr(fListaDeleteConfigDRE[i]) +
            ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
          buscas.ExecSQL;
        end;
      finally
        configDRE.Filtered := False;
      end;
    end;

    configDRE.Filtered := False;

    vNivel := 0;
    for I := 1 to 10 do vValoresNiveis[i] := 0;
    configDRE.First;
    while not configDRE.Eof do
    begin

      if vNivel = 0 then
      begin
        for I := 1 to configDRE.FieldByName('NIVEL').AsInteger do
          vValoresNiveis[I] := vValoresNiveis[I] + 1;
      end
      else if configDRE.FieldByName('NIVEL').AsInteger = vNivel then
        vValoresNiveis[vNivel] := vValoresNiveis[vNivel] + 1
      else if configDRE.FieldByName('NIVEL').AsInteger > vNivel then
      begin
        //teste caso pule de um nivel para outro com um intervalo maior que 1
        for I := 1 to configDRE.FieldByName('NIVEL').AsInteger do // vai percorrer todo o niveis
          if vValoresNiveis[I] = 0 then// caso algum nivel nao tenha valor, ou seja, pulou um nivel ou é o nivel atual da configuracao
            vValoresNiveis[I] := vValoresNiveis[I] + 1;
      end
      else// if configDRE.FieldByName('NIVEL').AsInteger < vNivel then
      begin
        for I := (configDRE.FieldByName('NIVEL').AsInteger + 1) to 10 do
          vValoresNiveis[i] := 0;
        vValoresNiveis[configDRE.FieldByName('NIVEL').AsInteger] := vValoresNiveis[configDRE.FieldByName('NIVEL').AsInteger] + 1;
      end;

      vConta := '';
      for I := 1 to configDRE.FieldByName('NIVEL').AsInteger do
        vConta := vConta + vDadosIni.StrZero(vValoresNiveis[I], 2) + vDadosIni.retornoPorCondicao(configDRE.FieldByName('NIVEL').AsInteger = I, '', '.');


      configDRE.Edit;
      configDRE.FieldByName('ESTRUTURADRE').AsString := vConta;
      configDRE.Post;

      vNivel := configDRE.FieldByName('NIVEL').AsInteger;

      configDRE.Next;
    end;

    configDRE.First;
    while not configDRE.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := 'update P_CONTAS_CONTABIL set' +
        ' TIPO_REL = :TIPO_REL,' +
        ' SINAL = :SINAL,' +
        ' FORMULA = :FORMULA,' +
        ' SOMARGRUPO = :SOMARGRUPO,' +
        ' ESTRUTURADRE = :ESTRUTURADRE,' +
        ' NIVEL = :NIVEL' +
        ' where COD_CTA = ' + QuotedStr(configDRE.FieldByName('cod_cta').AsString) +
        ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
      buscas.ParamByName('TIPO_REL').AsString := configDRE.FieldByName('TIPO_REL').AsString;
      buscas.ParamByName('SINAL').AsString := configDRE.FieldByName('SINAL').AsString;
      buscas.ParamByName('FORMULA').AsString := configDRE.FieldByName('FORMULA').AsString;
      buscas.ParamByName('SOMARGRUPO').AsString := configDRE.FieldByName('SOMARGRUPO').AsString;
      buscas.ParamByName('ESTRUTURADRE').AsString := configDRE.FieldByName('ESTRUTURADRE').AsString;
      buscas.ParamByName('NIVEL').AsInteger := configDRE.FieldByName('NIVEL').AsInteger;
      buscas.ExecSQL;

      configDRE.Next;
    end;

    buscas.Transaction.Commit;
    fListaDeleteConfigDRE.Clear;
    Result := True;
    fconfigDREsofreuAlteracao := False;
  finally
    configDRE.EnableControls;
  end;
end;

procedure TPlanoContasContabil.setCorPersonalizadaFonte(pNivel: Integer; pColor: TColor);
begin
  vDadosIni._GravaConfiguracoesString('DRECorPersonalisadaFonteNivel' + IntToStr(pNivel), IntToStr(pColor));

  try fCorPersonalizadaFonte[pNivel - 1] := pColor; except end;
end;

procedure TPlanoContasContabil.setCorPersonalizadaFundo(pNivel: Integer; pColor: TColor);
begin
  vDadosIni._GravaConfiguracoesString('DRECorPersonalisadaFundoNivel' + IntToStr(pNivel), IntToStr(pColor));

  try fCorPersonalizadaFundo[pNivel - 1] := pColor; except end;
end;

function TPlanoContasContabil.StatusLixeira: boolean;
begin
  Result := ExecutaComandosSql('select first 1 cod_cta from P_CONTAS_CONTABIL where ativo = 0');
end;

function TPlanoContasContabil.validarFormulaRegistroAtual: Boolean;
var
  vFormFormula: string;
  vFormOperador: string;
  vFormRetorno: string;
  vFormErro: string;
  vContinuar: Boolean;
  vFiltro: string;
  vRecNo: Integer;
  vFiltered: Boolean;
  vListaFormulasApl: TStringList;
  vContaAT: string;
  vFiltroTmp: string;
begin
  Result := True;

  if Trim(configDRE.FieldByName('FORMULA').AsString) = '' then
    Exit;

  vRecNo := configDRE.RecNo;
  vFiltro := configDRE.Filter;
  vFiltered := configDRE.Filtered;
  vListaFormulasApl := TStringList.Create;
  vListaFormulasApl.Clear;
  vContaAT := configDRE.FieldByName('cod_cta').AsString;

  vFormFormula := Trim(configDRE.FieldByName('FORMULA').AsString);

  vContinuar := True;
  while vContinuar do
  begin
    if not decodeFormula(vFormFormula, vFormOperador, vFormRetorno, vFormErro, vContinuar) then
    begin
        Application.MessageBox(PChar('Formula inválida "' + vFormErro + '" conta : ' + vContaAT + ' '),
          'Atenção', 0 + 64);
        Result := False;
        Break;
    end
    else if Copy(vFormRetorno, 1, 1) = '@' then
    begin
      if (Pos(vFormRetorno, fListaFormulaNaoApl.Text) > 0) then
      begin
        Application.MessageBox(PChar(vFormErro + 'Referencia circular "' + vFormRetorno + '" conta : ' + vContaAT + ' '),
          'Atenção', 0 + 64);
        Result := False;
        Break;
      end
      else
        fListaFormulaNaoApl.Add(vFormRetorno);
      vFormRetorno := StringReplace(vFormRetorno, '@', '', [rfReplaceAll]);
      configDRE.Filter := 'COD_CTA = ' + QuotedStr(vFormRetorno);
      configDRE.Filtered := True;
      if configDRE.IsEmpty then
      begin
        Application.MessageBox(PChar(vFormErro + 'Conta "'+vFormRetorno+'" presente na formula não encontrada. Conta : ' + vContaAT + ' '),
          'Atenção', 0 + 64);
        Result := False;
        Break;
      end
      else
      begin
        if (Trim(configDRE.FieldByName('FORMULA').AsString) <> '') then
        begin
          vFiltroTmp := configDRE.Filter;
          if not validarFormulaRegistroAtual then
          begin
//            Application.MessageBox(PChar(''vFormErro + 'Conta "'+vFormRetorno+'" presente na formula não encontrada. Conta : ' + vContaAT + ' '),
//             'Atenção', 0 + 64);
            Result := False;
            Break;
          end;
          configDRE.Filter := vFiltroTmp;
          configDRE.Filtered := True;
        end;
      end;
      vListaFormulasApl.Add('@' + vFormRetorno + '@');
    end;
  end;

  configDRE.Filter := vFiltro;
  configDRE.Filtered := vFiltered;
  configDRE.RecNo := vRecNo;

end;

{ TCIAP }

function TCIAP.abreFormLancamentoValores: boolean;
var
  formulario: TfrmPadrao;
begin        
  if not vDadosIni.PesqPros('SPED075','INCLUIR','','VALORES_CIAP','',buscas,False) then
    Exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Lançamento de Valores CIAP';
    frmCIAP.pnLancValores.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    ShortDateFormat := 'dd/mm/yyyy';
    frmCIAP.EditHw1.AsValue := StrToInt(Trim(copy(DateToStr(date), 4, 2)));
    frmCIAP.EditHw2.AsValue := StrToInt(Trim(copy(DateToStr(date), 7, 4)));
    frmCIAP.EditHw3.AsValue := 0;
    frmCIAP.EditHw4.AsValue := 0;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCIAP.pnLancValores.Parent := frmCIAP.tsValores;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TCIAP.CadCiap(TipoForm: integer);
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  if frmCIAP = nil then
    Application.CreateForm(TfrmCIAP, frmCIAP);

  if (TipoForm > 0) and (not frmCIAP.Visible) then
    frmCIAP.ShowModal
  else if (not frmCIAP.Visible) then
    frmCIAP.Show
  else if frmCIAP.FormStyle = fsMDIChild then
    frmCIAP.Show
  else
    frmCIAP.ShowModal;
end;

constructor TCIAP.create;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  dataSet := TClientDataSet(dtmCIAP.cdsCCusto);
  buscas := TIBQuery(dtmCIAP.qrBuscas);
  transacao := TIBTransaction(dtmCIAP.transacao);
end;

procedure TCIAP.pesquisaPeriodo(pMes, pAno: integer;
  var pVL_TRIB_EXP: Currency; var pVL_TOTAL: Currency);
begin
  buscas.Close;
  buscas.SQL.Text := 'select * from VALORES_CIAP where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ano = ' + IntToStr(pAno) + ' and mes = ' + IntToStr(pMes);
  buscas.Open;
  if buscas.IsEmpty then
  begin
    pVL_TRIB_EXP := 0;
    pVL_TOTAL := 0;
  end
  else
  begin
    pVL_TRIB_EXP := buscas.FieldByName('VL_TRIB_EXP').AsFloat;
    pVL_TOTAL := buscas.FieldByName('VL_TOTAL').AsFloat;
  end;
  buscas.Close;
end;

function TCIAP.salvaValoresPeriodo(pMes, pAno: integer; pVL_TRIB_EXP,
  pVL_TOTAL: Currency): boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'select * from VALORES_CIAP where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ano = ' + IntToStr(pAno) + ' and mes = ' + IntToStr(pMes);
    buscas.Open;
    if buscas.IsEmpty then
    begin
      buscas.Close;
      buscas.SQL.Text := 'INSERT INTO VALORES_CIAP (MES, ANO, COD_EMPRESA, VL_TRIB_EXP, VL_TOTAL)' +
        ' VALUES (:MES, :ANO, :COD_EMPRESA, :VL_TRIB_EXP, :VL_TOTAL)';
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'UPDATE VALORES_CIAP SET VL_TRIB_EXP = :VL_TRIB_EXP, VL_TOTAL = :VL_TOTAL'
        +
        ' WHERE MES = :MES AND ANO = :ANO AND COD_EMPRESA = :COD_EMPRESA';
    end;
    buscas.ParamByName('MES').AsInteger := pMes;
    buscas.ParamByName('ANO').AsInteger := pAno;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('VL_TRIB_EXP').AsCurrency := pVL_TRIB_EXP;
    buscas.ParamByName('VL_TOTAL').AsCurrency := pVL_TOTAL;
    buscas.ExecSQL;
    CommitaTransacao;
    Result := True;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

{ TCentroCustos }

function TCentroCustos.AbrirLixeira: boolean;
begin
  Result := montaSelect('select * from CENTRO_CUSTOS where ativo = 0');
end;

procedure TCentroCustos.CadCentroCustos(TipoForm: integer);
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);

  vDadosIni.vTipoForm := TipoForm;

  if frmCadCentroCustos = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadCentroCustos, frmCadCentroCustos);
  end;

  if (TipoForm > 0) and (not frmCadCentroCustos.Visible) then
    frmCadCentroCustos.ShowModal
  else if (not frmCadCentroCustos.Visible) then
    frmCadCentroCustos.Show
  else if frmCadCentroCustos.FormStyle = fsMDIChild then
    frmCadCentroCustos.Show
  else
    frmCadCentroCustos.ShowModal;
end;

constructor TCentroCustos.create;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  dataSet := TClientDataSet(dtmCIAP.cdsCCusto);
  buscas := TIBQuery(dtmCIAP.qrBuscas);
  transacao := TIBTransaction(dtmCIAP.transacao);
end;

function TCentroCustos.delete: boolean;
var
  vCod_CCUS: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  vCod_CCUS := dataSet.FieldByName('COD_CCUS').AsString;

  if dataSet.FieldByName('ATIVO').AsInteger = 0 then
  begin
    if not vDadosIni.PesqPros('SPED057','EXCLUIR','','CENTRO_CUSTOS','',buscas,True) then
      Exit;
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      result := inherited Delete;
      if Result then
        result := Apply;
      if result then
        result := CommitaTransacao;
      //      if Result then
      //        vDadosIni.GravaAuditoria('BAS091', 'EXCLUIR', 'SUCESSO', 'COND_PAG', vCod_CTA, buscas)
      //      else
      //        vDadosIni.GravaAuditoria('BAS091', 'EXCLUIR', 'FALHA', 'COND_PAG', vCod_CTA, buscas);

    end;
  end
  else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
    if not vDadosIni.PesqPros('SPED058','LIXEIRA','','CENTRO_CUSTOS','',buscas,False) then
      Exit;
    if inherited Edit then
    begin
      dataSet.FieldByName('ATIVO').asinteger := 0;
      result := inherited Post;
      if Result then
        result := Apply;
      if Result then
        result := CommitaTransacao;
      //      if Result then
      //        vDadosIni.GravaAuditoria('BAS090', 'ENVIAR REGISTRO PARA A LIXEIRA', 'SUCESSO', 'COND_PAG', codCondPag, buscas)
      //      else
      //        vDadosIni.GravaAuditoria('BAS090', 'ENVIAR REGISTRO PARA A LIXEIRA ', 'FALHA', 'COND_PAG', codCondPag, buscas);
    end;
  end;
  if Result then
    Refresh
  else
  begin
    CancelUpdates;
    Refresh;
  end;
end;

function TCentroCustos.edit: boolean;
begin
  if not vDadosIni.PesqPros('SPED056','EDITAR','','CENTRO_CUSTOS','',buscas,False) then
    Exit;
  if inherited edit then
    Result := true;
end;

function TCentroCustos.insert: boolean;
begin
  if not vDadosIni.PesqPros('SPED055','INCLUIR','','CENTRO_CUSTOS','',buscas,False) then
    Exit;
  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.Codempresa;
    Result := true;
  end;
end;

function TCentroCustos.post: boolean;
var
  acao: string;
begin
  if not vDadosIni.PesqPros('SPED060','SALVAR','','CENTRO_CUSTOS','',buscas,False) then
    Exit;
  try
    Result := false;
    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := true;
      exit;
    end;
    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if dataSet.FieldByName('COD_CCUS').asString = '' then
      raiseExceptionCreate('Código do Centro de Custo não informado!', 'DBEDIT1');

    if dataSet.FieldByName('CCUS').asString = '' then
      raiseExceptionCreate('Descrição do Centro de Custo não informada!', 'DBEdit2');

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    Refresh;
    result := true;
    CommitaTransacao;

        if Result then
          vDadosIni.GravaAuditoria('SPED060', acao, 'SUCESSO', 'CENTRO_CUSTOS', dataSet.FieldByName('COD_CCUS').AsString, buscas)
        else
          vDadosIni.GravaAuditoria('SPED060', acao, 'FALHA', 'CENTRO_CUSTOS', dataSet.FieldByName('COD_CCUS').AsString, buscas);
    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Codigo do Custo já existe',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TCentroCustos.restauraLixeira: boolean;
begin    
  if not vDadosIni.PesqPros('SPED059','RESTAURAR','','CENTRO_CUSTOS','',buscas,False) then
    Exit;
  result := false;
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
      begin
        if inherited Edit then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          result := inherited Post;
          if Result then
            result := Apply;
          if Result then
            result := CommitaTransacao;
          //          if Result then
          //            vDadosIni.GravaAuditoria('BAS067', 'RESTAURAR REGISTRO', 'SUCESSO', 'NAT_OP', dataSet.FieldByName('CODIGO_NOP').AsString, buscas)
          //          else
          //            vDadosIni.GravaAuditoria('BAS067', 'RESTAURAR REGISTRO', 'FALHA', 'NAT_OP', dataSet.FieldByName('CODIGO_NOP').AsString, buscas);
        end;
      end;
    end;
  Refresh; //dataSet.RefreshRecord;
end;

function TCentroCustos.StatusLixeira: boolean;
begin
  Result := ExecutaComandosSql('select first 1 COD_CCUS from CENTRO_CUSTOS where ativo = 0');
end;

{ TMovimento_CIAP }

function TMovimento_CIAP.abreFormMovimentacaoBem: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Movimentação de Bem ou Componente';
    frmMovimentacaoBem.pnMovimentacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    vCOD_IND_BEM := 0;
    vNUM_PARC := 0;
    vNUM_PARC_INI := 0;
    vNUM_PARC_FIM := 0;
    vDT_MOV := DateToStr(Date);
    vTIPO_MOV := 'SI';
    vVL_IMOB_ICMS_OP := 0;
    vVL_IMOB_ICMS_ST := 0;
    vVL_IMOB_ICMS_FRT := 0;
    vVL_IMOB_ICMS_DIF := 0;
    vVL_PARC_PASS := 0;
    vLancarBaixaUltimaParcela := True;

    frmMovimentacaoBem.CheckBox3.Checked := True;
    frmMovimentacaoBem.EditHw1.AsValue := 0;
    frmMovimentacaoBem.EditHw2.AsValue := 0;
    frmMovimentacaoBem.EditHw3.AsValue := 0;
    frmMovimentacaoBem.EditHw4.AsValue := 0;
    frmMovimentacaoBem.EditHw5.AsValue := 0;
    frmMovimentacaoBem.EditHw6.AsValue := 0;
    frmMovimentacaoBem.EditHw7.AsValue := 0;
    frmMovimentacaoBem.EditHw8.AsValue := 0;
    frmMovimentacaoBem.EditHw9.AsValue := 0;
    frmMovimentacaoBem.DBLookupComboBox2.KeyValue := 0;
    frmMovimentacaoBem.ComboBox4.ItemIndex := 0;
    frmMovimentacaoBem.MaskEdit4.Text := '';

    vEquip.abreEquipamentos;

    result := (formulario.ShowModal = IDOK);
  finally
    frmMovimentacaoBem.pnMovimentacao.Parent := frmMovimentacaoBem.tsMovimentacao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TMovimento_CIAP.abreFormPesquiaNotaFiscal: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Pesquisa de Notas Fiscais';
    frmMovimentacaoBem.pnConsultaNF.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);
    if Result then
      Result := not vNf.dataSet.IsEmpty;
    if Result then
      Result := not vNf.vItemNf.dataSet.IsEmpty;
  finally
    frmMovimentacaoBem.pnConsultaNF.Parent := frmMovimentacaoBem.tsConsultaNf;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TMovimento_CIAP.buscaClienteOuNotaFiscal(pClienteOuNf: string);
begin
  if pClienteOuNf = 'C' then
  begin
    vDadosIni.vPesquisa :=
      vDadosIni.pesquisaRapida('CLIENTES');
    if Trim(vDadosIni.vPesquisa) <> '' then
    begin
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      dataSet.FieldByName('COD_CLIENTE').AsString :=
        Trim(vDadosIni.vPesquisa);
    end;
  end
  else
  begin
    if abreFormPesquiaNotaFiscal then
    begin
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      //dataSet.FieldByName('COD_NF').AsInteger             := vNf.dataSet.FieldByName('COD_NF').AsInteger;
      dataSet.FieldByName('EMISSAO_PROPRIA').AsString     := vNf.dataSet.FieldByName('EMISSAO_PROPRIA').AsString;
      dataSet.FieldByName('COD_CLIENTE').AsInteger        := vNf.dataSet.FieldByName('COD_CLIENTE').AsInteger;
      dataSet.FieldByName('MODELO_NF').AsString           := vNf.dataSet.FieldByName('MODELO_NF').AsString;
      dataSet.FieldByName('SERIE').AsString               := vNf.dataSet.FieldByName('SERIE').AsString;
      dataSet.FieldByName('NUM_NF').AsInteger             := vNf.dataSet.FieldByName('NUM_NF').AsInteger;
      dataSet.FieldByName('CHV_NFE_CTE').AsString         := vNf.dataSet.FieldByName('chave_nfe').AsString;
      dataSet.FieldByName('DATA_DOC').AsDateTime          := vNf.dataSet.FieldByName('DATA_CONTABIL').AsDateTime;
      dataSet.FieldByName('NUM_ITEM').AsInteger           := vNf.vItemNf.dataSet.FieldByName('NITEM').AsInteger;
      dataSet.FieldByName('grupo_prod').AsInteger         := vNf.vItemNf.dataSet.FieldByName('grupo_prod').AsInteger;
      dataSet.FieldByName('cod_prod').AsString            := vNf.vItemNf.dataSet.FieldByName('cod_prod').AsString;
      dataSet.FieldByName('unid').AsString                := vNf.vItemNf.dataSet.FieldByName('referencia').AsString;
      dataSet.FieldByName('qtde').AsFloat                 := vNf.vItemNf.QtdeAplicada;
      dataSet.FieldByName('VL_ICMS_OP_APLICADO').AsFloat  := RoundTo(vNf.vItemNf.ffloat('valor_icm') / vNf.vItemNf.ffloat('quantidade') * vNf.vItemNf.QtdeAplicada, -2);
      dataSet.FieldByName('VL_ICMS_ST_APLICADO').AsFloat  := RoundTo(vNf.vItemNf.ffloat('valor_icmsub') / vNf.vItemNf.ffloat('quantidade') * vNf.vItemNf.QtdeAplicada, -2);
      //dataSet.FieldByName('VL_ICMS_FRT_APLICADO').AsFloat := RoundTo(vNf.vItemNf.ffloat('valor_icm') / vNf.vItemNf.ffloat('quantidade') * vNf.vItemNf.QtdeAplicada, -2);
      //dataSet.FieldByName('VL_ICMS_DIF_APLICADO').AsFloat := RoundTo(vNf.vItemNf.ffloat('valor_icm') / vNf.vItemNf.ffloat('quantidade') * vNf.vItemNf.QtdeAplicada, -2);
    end;
  end;
end;

procedure TMovimento_CIAP.buscaProduto;
begin
  vDadosIni.vPesquisa :=
    vDadosIni.pesquisaRapida('PRODUTOS');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'SELECT GRUPO_PROD , COD_PROD FROM PRODUTOS WHERE NUM_FAB_PROD = ' +
      QuotedStr(Trim(vDadosIni.vPesquisa)) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if dataSet.State = dsBrowse then
      dataSet.Edit;
    dataSet.FieldByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
    dataSet.FieldByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
    buscas.Close;
  end;
end;

procedure TMovimento_CIAP.CadMovimentoCiap(TipoForm: integer);
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  if frmMovimentacaoBem = nil then
    Application.CreateForm(TfrmMovimentacaoBem, frmMovimentacaoBem);

  if (TipoForm > 0) and (not frmMovimentacaoBem.Visible) then
    frmMovimentacaoBem.ShowModal
  else if (not frmMovimentacaoBem.Visible) then
    frmMovimentacaoBem.Show
  else if frmMovimentacaoBem.FormStyle = fsMDIChild then
    frmMovimentacaoBem.Show
  else
    frmMovimentacaoBem.ShowModal;
end;

constructor TMovimento_CIAP.create;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  dataSet := TClientDataSet(dtmCIAP.cdsMovCiap);
  buscas := TIBQuery(dtmCIAP.qrBuscas);
  transacao := TIBTransaction(dtmCIAP.transacao);
  vEquip := TEquipamento_CIAP.create;
  vNf := TNF_CIAP.create;
end;

function TMovimento_CIAP.delete: boolean;
var
  vCod_Bem: string;
begin
  if not vDadosIni.PesqPros('SPED073','EXCLUIR','','MOVIMENTO_CIAP','',buscas,True) then
    Exit;
  Result := False;
  if dataSet.IsEmpty then
    exit;
  vCod_Bem := dataSet.FieldByName('COD_IND_BEM').AsString;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    result := inherited Delete;
    if Result then
      result := Apply;
    if result then
      result := CommitaTransacao;
    //      if Result then
    //        vDadosIni.GravaAuditoria('BAS091', 'EXCLUIR', 'SUCESSO', 'COND_PAG', vCod_CTA, buscas)
    //      else
    //        vDadosIni.GravaAuditoria('BAS091', 'EXCLUIR', 'FALHA', 'COND_PAG', vCod_CTA, buscas);
  end;
  if Result then
    Refresh
  else
  begin
    CancelUpdates;
    Refresh;
  end;
end;

destructor TMovimento_CIAP.Destroy;
begin
  FreeAndNil(vEquip);
  FreeAndNil(vNf);
  inherited;
end;

function TMovimento_CIAP.edit: boolean;
begin
  if not vDadosIni.PesqPros('SPED072','CONSULTA','','MOVIMENTO_CIAP','',buscas,False) then
    Exit;
  if inherited Edit then
  begin
    vEquip.abreEquipamentos;
    Result := true;
  end;
end;

function TMovimento_CIAP.existeBemOuComponente(codigo: integer): boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'select * from equipamento where cod_equip = ' + IntToStr(codigo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if buscas.IsEmpty then
      raiseExceptionCreate('Bem ou componente não encontrado', 'EditHw1');
    if buscas.FieldByName('sped').AsString <> 'S' then
      raiseExceptionCreate('Bem ou componente não está marcado para entrar nos Registros do SPED',
        'EditHw1');
    if buscas.FieldByName('nr_parc').AsInteger <= 0 then
      raiseExceptionCreate('Numero de parcelas de Apropriação do Bem ou componente não está definido no seu cadastro', 'EditHw1');
    if (Trim(buscas.FieldByName('NF_E_EMISSAO_PROPRIA').AsString) = '') or
      (Trim(buscas.FieldByName('NF_E_COD_CLIENTE').AsString) = '') or
      (Trim(buscas.FieldByName('NF_E_MODELO_NF').AsString) = '') or
      (Trim(buscas.FieldByName('NF_E_NUM_NF').AsString) = '') or
      (Trim(buscas.FieldByName('NF_E_DATA_DOC').AsString) = '') or
      (Trim(buscas.FieldByName('NF_E_NUM_ITEM').AsString) = '') or
      (Trim(buscas.FieldByName('NF_E_COD_ITEM').AsString) = '') then
      raiseExceptionCreate('Dados da Nota fiscal de Entrada do Bem ou componente não estão definidos no seu cadastro'
        + #13 + 'Ou estão incompletos', 'EditHw1');
    vNUM_PARC := buscas.FieldByName('nr_parc').AsInteger;
    if vNUM_PARC_INI = 0 then
      vNUM_PARC_INI := 1;
    vNUM_PARC_FIM := vNUM_PARC_INI + vNUM_PARC - 1;
    buscas.Close;
    Result := True;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;

  end;

end;

function TMovimento_CIAP.insert: boolean;
begin
  if not vDadosIni.PesqPros('SPED071','INCLUIR','','MOVIMENTO_CIAP','',buscas,False) then
    Exit;
  if not dataSet.Active then
    montaSelect('SELECT * FROM MOVIMENTO_CIAP WHERE COD_EMPRESA = 0');

  if inherited insert then
  begin
    vEquip.abreEquipamentos;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.Codempresa;
    Result := true;
  end;
end;

function TMovimento_CIAP.post: boolean;
var
  acao: string;
begin
  if not vDadosIni.PesqPros('SPED074','SALVAR','','MOVIMENTO_CIAP','',buscas,True) then
    Exit;
  try
    Result := false;
    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := true;
      exit;
    end;
    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'BA') or
      (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'AT') or
      (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'PE') or
      (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'OT') then
    begin
      dataSet.FieldByName('VL_IMOB_ICMS_OP').AsCurrency := 0;
      dataSet.FieldByName('VL_IMOB_ICMS_ST').AsCurrency := 0;
      dataSet.FieldByName('VL_IMOB_ICMS_FRT').AsCurrency := 0;
      dataSet.FieldByName('VL_IMOB_ICMS_DIF').AsCurrency := 0;
      dataSet.FieldByName('NUM_PARC').AsInteger := 0;
      dataSet.FieldByName('VL_PARC_PASS').AsCurrency := 0;
    end;
    if (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'SI') or
      (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'IM') or
      (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'IA') or
      (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'CI') or
      (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'MC') then
    begin
      if (dataSet.FieldByName('VL_IMOB_ICMS_OP').AsCurrency <= 0) and
        (dataSet.FieldByName('VL_IMOB_ICMS_ST').AsCurrency <= 0) and
        (dataSet.FieldByName('VL_IMOB_ICMS_FRT').AsCurrency <= 0) and
        (dataSet.FieldByName('VL_IMOB_ICMS_DIF').AsCurrency <= 0) then
        raiseExceptionCreate('Informar pelo menos 1 dos campos de Valor de ICMS', 'DBEdit5');
    end;

    if dataSet.FieldByName('COD_IND_BEM').asString = '' then
      raiseExceptionCreate('Código do Bem ou Componente não informado!', 'DBEDIT1');

    if dataSet.FieldByName('DT_MOV').asString = '' then
      raiseExceptionCreate('Data de movimentação do Bem ou Componente não informada!',
        'DBEdit2');
    if (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'SI') then
      dataSet.FieldByName('DT_MOV').AsDateTime :=
        DateOf(StartOfTheMonth(dataSet.FieldByName('DT_MOV').AsDateTime))
    else
      dataSet.FieldByName('DT_MOV').AsDateTime :=
        DateOf(EndOfTheMonth(dataSet.FieldByName('DT_MOV').AsDateTime));

    if dataSet.FieldByName('TIPO_MOV').asString = '' then
      raiseExceptionCreate('Tipo de Movimentação do Bem ou Componente não informada!',
        'DBComboBox1');

    if (Trim(dataSet.FieldByName('EMISSAO_PROPRIA').AsString) = '') or
      (Trim(dataSet.FieldByName('COD_CLIENTE').AsString) = '') or
      (Trim(dataSet.FieldByName('MODELO_NF').AsString) = '') or
      (Trim(dataSet.FieldByName('NUM_NF').AsString) = '') or
      (Trim(dataSet.FieldByName('DATA_DOC').AsString) = '') or
      (Trim(dataSet.FieldByName('NUM_ITEM').AsString) = '') or
      (Trim(dataSet.FieldByName('GRUPO_PROD').AsString) = '') or
      (Trim(dataSet.FieldByName('COD_PROD').AsString) = '') then
    begin
      if //(copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'SI') or
      (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'IM') or
        (copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'IA') // or
      //(copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'CI') or
    //(copy(dataSet.FieldByName('TIPO_MOV').asString, 1, 2) = 'MC')
      then
        raiseExceptionCreate('Para os Tipo de Movimento: "IM, IA" Preencher os dados da nota fiscal',
          'DBEdit20');
    end;

    if (Trim(dataSet.FieldByName('NUM_NF').AsString) = '') then
    begin
      dataSet.FieldByName('EMISSAO_PROPRIA').AsString := '';
      dataSet.FieldByName('COD_CLIENTE').AsString := '';
      dataSet.FieldByName('MODELO_NF').AsString := '';
      dataSet.FieldByName('NUM_NF').AsString := '';
      dataSet.FieldByName('DATA_DOC').AsString := '';
      dataSet.FieldByName('NUM_ITEM').AsString := '';
      dataSet.FieldByName('GRUPO_PROD').AsString := '';
      dataSet.FieldByName('COD_PROD').AsString := '';
      dataSet.FieldByName('SERIE').AsString := '';
      dataSet.FieldByName('CHV_NFE_CTE').AsString := '';
    end;
    if Trim(dataSet.FieldByName('cod_prod').AsString) = '' then
      dataSet.FieldByName('cod_prod').Value := Null;

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    Refresh;
    result := true;
    CommitaTransacao;

        if Result then
          vDadosIni.GravaAuditoria('SPED074', acao, 'SUCESSO', 'MOVIMENTO_CIAP', dataSet.FieldByName('COD_IND_BEM').AsString, buscas)
        else
          vDadosIni.GravaAuditoria('SPED074', acao, 'FALHA', 'MOVIMENTO_CIAP', dataSet.FieldByName('COD_IND_BEM').AsString, buscas);
    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Movimentação do bem ja existe para este dia',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TMovimento_CIAP.ReplicarMovimentacao(AParcelaIni,
  AParcelaFim: Integer);
var
  ADBClient: TClientDataSet;
  AField: TField;
  I, ParcelaIni, ParcelaFim: Integer;
  J: Integer;
begin
  if AParcelaIni > AParcelaFim then
    Exit;

  ADBClient := TClientDataSet.Create(Application);
  try
    dataSet.DisableControls;
    try
      for I := 0 to dataSet.Fields.Count - 1 do
      begin
        AField := dataSet.Fields[I];
        if AField.FieldKind = fkData then
          ADBClient.FieldDefs.Add(AField.FieldName, AField.DataType, AField.Size);
      end;

      ADBClient.CreateDataSet;
      ADBClient.Append;
      for I := 0 to dataSet.Fields.Count - 1 do
      begin
        AField := dataSet.Fields[I];
        if AField.FieldKind = fkData then
          ADBClient.FieldByName(AField.FieldName).Value := AField.Value;
      end;
      ADBClient.Post;

      for I := AParcelaIni to AParcelaFim do
      begin
        vDadosIni.abreStatusProcessamento('Replicando', 'Parcela ' + IntToStr(I) + ' de ' +IntToStr(AParcelaFim));
        ADBClient.Edit;
        ADBClient.FieldByName('DT_MOV').AsDateTime := IncMonth(ADBClient.FieldByName('DT_MOV').AsDateTime);
        ADBClient.FieldByName('NUM_PARC').AsInteger := I;
        ADBClient.Post;

        buscas.Close;
        buscas.SQL.Text := 'select NUM_PARC, DT_MOV from MOVIMENTO_CIAP' +
          ' where COD_IND_BEM = ' + IntToStr(ADBClient.FieldByName('COD_IND_BEM').AsInteger) +
          ' and DT_MOV = :DT_MOV' +
          ' and TIPO_MOV = ' + QuotedStr(ADBClient.FieldByName('TIPO_MOV').AsString) +
          ' and COD_EMPRESA = ' + IntToStr(ADBClient.FieldByName('COD_EMPRESA').AsInteger);
        buscas.ParamByName('DT_MOV').AsDate := ADBClient.FieldByName('DT_MOV').AsDateTime;
        buscas.Open;

        if not buscas.IsEmpty then
          raiseExceptionCreate('Já existe registro de movimento para o Bem neste no dia' + #13 +
            'Parcela: ' + IntToStr(ADBClient.FieldByName('NUM_PARC').AsInteger) + #13 +
            'Dia: ' + FormatDateTime('dd/mm/yyyy', ADBClient.FieldByName('DT_MOV').AsDateTime), '');

        buscas.Close;
        buscas.SQL.Text := 'select NUM_PARC, DT_MOV from MOVIMENTO_CIAP' +
          ' where COD_IND_BEM = ' + IntToStr(ADBClient.FieldByName('COD_IND_BEM').AsInteger) +
          ' and NUM_PARC = ' + IntToStr(ADBClient.FieldByName('NUM_PARC').AsInteger) +
          ' and TIPO_MOV = ' + QuotedStr(ADBClient.FieldByName('TIPO_MOV').AsString) +
          ' and COD_EMPRESA = ' + IntToStr(ADBClient.FieldByName('COD_EMPRESA').AsInteger);
        buscas.Open;

        if not buscas.IsEmpty then
          raiseExceptionCreate('Já existe registro de movimento para o Bem com este número de Parcela' + #13 +
            'Parcela: ' + IntToStr(ADBClient.FieldByName('NUM_PARC').AsInteger) + #13 +
            'Dia: ' + FormatDateTime('dd/mm/yyyy', ADBClient.FieldByName('DT_MOV').AsDateTime), '');

        dataSet.Append;
        for J := 0 to ADBClient.Fields.Count - 1 do
        begin
          AField := dataSet.FindField(ADBClient.Fields[J].FieldName);
          if AField <> nil then
            if AField.FieldKind = fkData then
              AField.Value := ADBClient.Fields[J].Value;
        end;
        dataSet.Post;
      end;

      if Apply then
        CommitaTransacao
      else
      begin
        RollBackTransacao;
        Application.MessageBox('Não foi possivel replicar', 'Atenção', 0 + 64);
      end;
    except
      on E: Exception do
      begin
        dataSet.CancelUpdates;
        RollBackTransacao;
        registraErro('TMovimento_CIAP.ReplicarMovimentacao ' + e.Message);
        Application.MessageBox(PChar('Erro ao replicar. Erro ' + E.Message ), 'Atenção', 0 + 64);
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    dataSet.EnableControls;
    ADBClient.Free;
  end;
end;

function TMovimento_CIAP.salvaMovimentacaoBemComp: boolean;
var
  I: Integer;
  vDtTemp: TDate;
begin
  try
    Result := false;
    //    SI = Saldo inicial de bens imobilizados;
    //IM = Imobilização de bem individual;
    //IA = Imobilização em Andamento - Componente;
    //MC = Imobilização oriunda do Ativo Circulante;
    if (vTIPO_MOV <> 'IM') and (vTIPO_MOV <> 'IA') then
      raiseExceptionCreate('Tipo de movimentação inválida', 'ComboBox4');

    if (vCOD_IND_BEM = 0) then
      raiseExceptionCreate('Bem ou Componente não informado', 'EditHw1');

    try
      StrToDate(vDT_MOV);
    except
      raiseExceptionCreate('Data de Movimentação do Bem inválida', 'MaskEdit4');
    end;

    if (vVL_IMOB_ICMS_OP = 0) and (vVL_IMOB_ICMS_ST = 0) and
      (vVL_IMOB_ICMS_FRT = 0) and (vVL_IMOB_ICMS_DIF = 0) then
      raiseExceptionCreate('Informar pelo menos Um valor de ICMS para apropriação de crédito',
        'EditHw2');
    if (vNUM_PARC_FIM - vNUM_PARC_INI + 1) > vNUM_PARC then
      raiseExceptionCreate('Numero de Parcelas Maior que a quantidade informada no Bem ou Componente'
        + #13 +
        'No Bem ou Componente: ' + IntToStr(vNUM_PARC) + #13 +
        'Informada: ' + IntToStr(vNUM_PARC_FIM - vNUM_PARC_INI + 1),
        'EditHw6')
    else if (vNUM_PARC_FIM - vNUM_PARC_INI + 1) < vNUM_PARC then
      raiseExceptionCreate('Numero de Parcelas Maior que a quantidade informada no Bem ou Componente'
        + #13 +
        'No Bem ou Componente: ' + IntToStr(vNUM_PARC) + #13 +
        'Informada: ' + IntToStr(vNUM_PARC_FIM - vNUM_PARC_INI + 1),
        'EditHw6');

    buscas.Close;
    buscas.SQL.Text :=
      'INSERT INTO MOVIMENTO_CIAP (COD_IND_BEM, DT_MOV, TIPO_MOV, COD_EMPRESA, VL_IMOB_ICMS_OP, VL_IMOB_ICMS_ST, VL_IMOB_ICMS_FRT, VL_IMOB_ICMS_DIF, NUM_PARC, VL_PARC_PASS)' +
      ' VALUES (:COD_IND_BEM, :DT_MOV, :TIPO_MOV, :COD_EMPRESA, :VL_IMOB_ICMS_OP, :VL_IMOB_ICMS_ST, :VL_IMOB_ICMS_FRT, :VL_IMOB_ICMS_DIF, :NUM_PARC, :VL_PARC_PASS)';
    vDtTemp := StartOfTheMonth(StrToDate(vDT_MOV));
    for I := vNUM_PARC_INI to vNUM_PARC_FIM do
    begin
      buscas.Close;
      buscas.ParamByName('COD_IND_BEM').AsInteger := vCOD_IND_BEM;
      if vTIPO_MOV = 'SI' then
        buscas.ParamByName('DT_MOV').AsDate := StartOfTheMonth(vDtTemp)
      else
        buscas.ParamByName('DT_MOV').AsDate := EndOfTheMonth(vDtTemp);
      buscas.ParamByName('TIPO_MOV').AsString := vTIPO_MOV;
      buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      buscas.ParamByName('VL_IMOB_ICMS_OP').AsFloat := vVL_IMOB_ICMS_OP;
      buscas.ParamByName('VL_IMOB_ICMS_ST').AsFloat := vVL_IMOB_ICMS_ST;
      buscas.ParamByName('VL_IMOB_ICMS_FRT').AsFloat := vVL_IMOB_ICMS_FRT;
      buscas.ParamByName('VL_IMOB_ICMS_DIF').AsFloat := vVL_IMOB_ICMS_DIF;
      buscas.ParamByName('NUM_PARC').AsInteger := I;
      buscas.ParamByName('VL_PARC_PASS').AsFloat := vVL_PARC_PASS;
      buscas.ExecSQL;
      if (I = vNUM_PARC_FIM) and (vLancarBaixaUltimaParcela) then
      begin
        buscas.Close;
        buscas.ParamByName('COD_IND_BEM').AsInteger := vCOD_IND_BEM;
        buscas.ParamByName('DT_MOV').AsDate := EndOfTheMonth(vDtTemp);
        buscas.ParamByName('TIPO_MOV').AsString := 'BA';
        buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
        buscas.ParamByName('VL_IMOB_ICMS_OP').AsFloat := 0;
        buscas.ParamByName('VL_IMOB_ICMS_ST').AsFloat := 0;
        buscas.ParamByName('VL_IMOB_ICMS_FRT').AsFloat := 0;
        buscas.ParamByName('VL_IMOB_ICMS_DIF').AsFloat := 0;
        buscas.ParamByName('NUM_PARC').AsInteger := 0;
        buscas.ParamByName('VL_PARC_PASS').AsFloat := 0;
        buscas.ExecSQL;
      end;
      vDtTemp := IncMonth(vDtTemp, 1);
    end;
    CommitaTransacao;
    Result := True;
  except
    on e: exception do
    begin
      Result := false;
      if pos('PRIMARY OR UNIQUE KEY', UpperCase(E.Message)) > 0 then
        Application.MessageBox(pchar('Movimentação do bem ja existe para este dia: ' +
          DateToStr(vDtTemp)),
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

{ TEquipamento_CIAP }

function TEquipamento_CIAP.abreEquipamentos: boolean;
begin
  result := montaSelect('SELECT * FROM EQUIPAMENTO where ativo = 1' +
    ' and COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and TIP_EQUIP = ''I'' AND SPED = ''S''');
end;

constructor TEquipamento_CIAP.create;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  dataSet := TClientDataSet(dtmCIAP.cdsEquipamentos);
  buscas := TIBQuery(dtmCIAP.qrBuscas);
  transacao := TIBTransaction(dtmCIAP.transacao);
end;

{ TNF_CIAP }

procedure TNF_CIAP.AfterScrollItensNF(DataSet: TDataSet);
begin
  vItemNf.selecionaItensNf(DataSet.FieldByName('cod_nf').AsInteger);
end;

constructor TNF_CIAP.create;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  DataSet := TClientDataSet(dtmCIAP.cdsNf);
  transacao := TIBTransaction(dtmCIAP.transacao);
  Buscas := TIBQuery(dtmCIAP.qrBuscas);
  vItemNf := TNFItem_CIAP.create;
  dataSet.AfterScroll := AfterScrollItensNF;
end;

destructor TNF_CIAP.Destroy;
begin
  FreeAndNil(vItemNf);
  inherited;
end;

function TNF_CIAP.pesquisaNF(pdataIni, pDataFim, pEntradaSaida: string; pNumNf,
  pCodCliente: integer): boolean;
var
  vSql: string;
begin
  try
    vSql := 'select * from notafiscal where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tipo_nf = ''P''';
    if pEntradaSaida = 'E' then
      vSql := vSql + ' and natureza_nf = ''E'''
    else
      vSql := vSql + ' and natureza_nf = ''S''';
    try
      StrToDate(pdataIni);
      StrToDate(pDataFim);
      vSql := vSql + ' and data_contabil >= :dataIni and data_contabil <= :dataFim';
    except
      if (pNumNf = 0) and (pCodCliente = 0) then
        raiseExceptionCreate('Informe dados para efetuar a consulta', 'MaskEdit4');
    end;
    if pNumNf > 0 then
      vSql := vSql + ' and num_nf = ' + IntToStr(pNumNf);
    if pCodCliente > 0 then
      vSql := vSql + ' and cod_cliente = ' + IntToStr(pCodCliente);
    try
      StrToDate(pdataIni);
      StrToDate(pDataFim);
      montaSelect(vSql, StrToDate(pdataIni), StrToDate(pDataFim));
    except;
      montaSelect(vSql);
    end;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TNF_CIAP.pesquisaNF(pEmissao_propria, pModelo_nf, pSerie,
  pData_Contabil, pNatureza_nf: string; pCodCliente, pNum_NF: integer): boolean;
begin
  montaSelect('select * from notafiscal where emissao_propria = ' + QuotedStr(pEmissao_propria) +
    ' and modelo_nf = ' + QuotedStr(pModelo_nf) + ' and serie = ' + QuotedStr(pSerie) +
    ' and data_contabil = :dataIni and data_contabil = :dataFim ' +
    ' and cod_cliente = ' + IntToStr(pCodCliente) + ' and num_nf = ' + IntToStr(pNum_NF) +
    ' and natureza_nf = ' + QuotedStr(pNatureza_nf), StrToDate(pData_Contabil),
    StrToDate(pData_Contabil));
  Result := not dataSet.IsEmpty;
end;

{ TNFItem_CIAP }

constructor TNFItem_CIAP.create;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  DataSet := TClientDataSet(dtmCIAP.cdsINf);
  transacao := TIBTransaction(dtmCIAP.transacao);
  Buscas := TIBQuery(dtmCIAP.qrBuscas);
end;

function TNFItem_CIAP.selecionaItensNf(pCodNf: Integer): boolean;
begin
  montaSelect('select * from notafiscal_item where cod_nf = ' + IntToStr(pCodNf) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

{ TControleCreditosFiscais }

procedure TControleCreditosFiscais.ControleCreditosFiscais(TipoForm: integer);
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  if frmCadContSped = nil then
    Application.CreateForm(TfrmCadContSped, frmCadContSped);

  if (TipoForm > 0) and (not frmCadContSped.Visible) then
    frmCadContSped.ShowModal
  else if (not frmCadContSped.Visible) then
    frmCadContSped.Show
  else if frmCadContSped.FormStyle = fsMDIChild then
    frmCadContSped.Show
  else
    frmCadContSped.ShowModal;
end;

constructor TControleCreditosFiscais.create;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  dataSet := TClientDataSet(dtmCIAP.cdsContCF);
  buscas := TIBQuery(dtmCIAP.qrBuscas);
  transacao := TIBTransaction(dtmCIAP.transacao);
  vItem := TControleCreditosFiscais_Item.create;
end;

function TControleCreditosFiscais.delete: boolean;
var
  vCod_ContCredF: string;
begin
  if not vDadosIni.PesqPros('SPED079','EXCLUIR','','SPED_CONT_CRED_FISC','',buscas,True) then
    Exit;
  Result := False;
  if dataSet.IsEmpty then
    exit;
  vCod_ContCredF := dataSet.FieldByName('COD_CONT_CRED_F').AsString;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    result := inherited Delete;
    if Result then
      result := Apply;
    if result then
      result := CommitaTransacao;
    //      if Result then
    //        vDadosIni.GravaAuditoria('BAS091', 'EXCLUIR', 'SUCESSO', 'COND_PAG', vCod_CTA, buscas)
    //      else
    //        vDadosIni.GravaAuditoria('BAS091', 'EXCLUIR', 'FALHA', 'COND_PAG', vCod_CTA, buscas);
  end;
  if Result then
    Refresh
  else
  begin
    CancelUpdates;
    Refresh;
  end;
end;

destructor TControleCreditosFiscais.Destroy;
begin
  FreeAndNil(vItem);
  inherited;
end;

function TControleCreditosFiscais.edit: boolean;
begin
  if not vDadosIni.PesqPros('SPED078','EDITAR','','SPED_CONT_CRED_FISC','',buscas,False) then
    Exit;
  if inherited Edit then
  begin
    vItem.selecionaIten(dataSet.FieldByName('COD_CONT_CRED_F').AsInteger);
    Result := true;
  end;
end;

function TControleCreditosFiscais.insert: boolean;
begin
  if not vDadosIni.PesqPros('SPED077','INCLUIR','','SPED_CONT_CRED_FISC','',buscas,False) then
    Exit;
  if not dataSet.Active then
    montaSelect('SELECT * FROM SPED_CONT_CRED_FISC WHERE COD_EMPRESA = 0');

  if inherited insert then
  begin
    vItem.selecionaIten(dataSet.FieldByName('COD_CONT_CRED_F').AsInteger);
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.Codempresa;
    dataSet.FieldByName('COD_AJ_APUR').AsString := 'MG040001';
    Result := true;
  end;
end;

function TControleCreditosFiscais.insertItem: boolean;
begin
  if vItem.insert then
  begin
    vItem.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.Codempresa;
    vItem.dataSet.FieldByName('COD_CONT_CRED_F').AsInteger :=
          dataSet.FieldByName('COD_CONT_CRED_F').AsInteger;
    Result := true;
  end;
end;

function TControleCreditosFiscais.post: boolean;
var
  acao: string;
begin
  if not vDadosIni.PesqPros('SPED080','SALVAR','','SPED_CONT_CRED_FISC','',buscas,True) then
    Exit;
  try
    Result := false;
    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := true;
      exit;
    end;
    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if dataSet.FieldByName('COD_AJ_APUR').asString = '' then
      raiseExceptionCreate('Código do Ajuste não informado!', 'DBComboBox1');

    dataSet.FieldByName('DATA_MOVIMENTO').AsDateTime :=
      StartOfTheMonth(dataSet.FieldByName('DATA_MOVIMENTO').AsDateTime);
    dataSet.FieldByName('CRED_UTIL').AsFloat := 0;

    vItem.dataSet.First;
    while not vItem.dataSet.Eof do
    begin
      dataSet.FieldByName('CRED_UTIL').AsFloat :=
        dataSet.FieldByName('CRED_UTIL').AsFloat +
        vItem.dataSet.FieldByName('VL_CRED_UTIL').AsFloat;
      vItem.dataSet.Next;
    end;
    dataSet.FieldByName('SLD_CRED_FIM').AsFloat :=
      (dataSet.FieldByName('SLD_CRED').AsFloat +
      dataSet.FieldByName('CRED_APR').AsFloat +
      dataSet.FieldByName('CRED_RECEB').AsFloat) -
      dataSet.FieldByName('CRED_UTIL').AsFloat;

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('COD_CONT_CRED_F').AsInteger :=
        Gencodigo('SPED_CONT_CRED_FISC', dtmCIAP.SpIncCodigo, vDadosIni.codEmpresa);

      vItem.dataSet.First;
      while not vItem.dataSet.Eof do
      begin
        vItem.dataSet.Edit;
        vItem.dataSet.FieldByName('COD_CONT_CRED_F').AsInteger :=
          dataSet.FieldByName('COD_CONT_CRED_F').AsInteger;
        vItem.dataSet.Post;
        vItem.dataSet.Next;
      end;
    end;        

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    vItem.Apply;
    //Refresh;
    result := true;
    CommitaTransacao;

        if Result then
          vDadosIni.GravaAuditoria('SPED080', acao, 'SUCESSO', 'SPED_CONT_CRED_FISC', dataSet.FieldByName('COD_CONT_CRED_F').AsString, buscas)
        else
          vDadosIni.GravaAuditoria('SPED080', acao, 'FALHA', 'SPED_CONT_CRED_FISC', dataSet.FieldByName('COD_CONT_CRED_F').AsString, buscas);
    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Codigo do Custo já existe',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TControleCreditosFiscais.salvaItem: boolean;
begin
  Result := vItem.Post;
  dataSet.FieldByName('SLD_CRED_FIM').AsFloat := 0;
  vItem.dataSet.First;
  while not vItem.dataSet.Eof do
  begin
    dataSet.FieldByName('CRED_UTIL').AsFloat :=
      dataSet.FieldByName('CRED_UTIL').AsFloat +
      vItem.dataSet.FieldByName('VL_CRED_UTIL').AsFloat;
    vItem.dataSet.Next;
  end;
  dataSet.FieldByName('SLD_CRED_FIM').AsFloat :=
    (dataSet.FieldByName('SLD_CRED').AsFloat +
    dataSet.FieldByName('CRED_APR').AsFloat +
    dataSet.FieldByName('CRED_RECEB').AsFloat) -
    dataSet.FieldByName('CRED_UTIL').AsFloat;
end;

{ TControleCreditosFiscais_Item }

constructor TControleCreditosFiscais_Item.create;
begin
  dataSet := TClientDataSet(dtmCIAP.cdsItContCF);
  buscas := TIBQuery(dtmCIAP.qrBuscas);
  transacao := TIBTransaction(dtmCIAP.transacao);
end;

function TControleCreditosFiscais_Item.post: boolean;
begin
  try
    Result := false;
    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := true;
      exit;
    end;
    if dataSet.FieldByName('TIPO_UTIL').asString = '' then
      raiseExceptionCreate('Código do Ajuste não informado!', 'DBComboBox2');

    dataSet.FieldByName('NR_DOC').AsString :=
      dataSet.FieldByName('NR_DOC').AsString;

    dataSet.FieldByName('VL_CRED_UTIL').AsFloat :=
      dataSet.FieldByName('VL_CRED_UTIL').AsFloat;

    dataSet.post;

    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Item já existe',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;

end;

function TControleCreditosFiscais_Item.selecionaIten(codigo: integer): boolean;
begin
  Result := montaSelect('select * from SPED_CONT_CRED_FISC_UTIL where ' +
    ' cod_empresa = ' + vDadosIni.codEmpresa + ' and COD_CONT_CRED_F = ' + IntToStr(codigo));
end;

{ TCST_PIS_Relacao }

constructor TCST_PIS_Relacao.create;
begin
  if dtmCIAP = nil then
    dtmCIAP := TdtmCIAP.Create(dtmCIAP);
  DataSet := TClientDataSet(dtmCIAP.cdsCSTRel);
  transacao := TIBTransaction(dtmCIAP.transacao);
  Buscas := TIBQuery(dtmCIAP.qrBuscas);
end;

function TCST_PIS_Relacao.delete: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;
  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    result := inherited Delete;
    if Result then
      result := Apply;
    if result then
      result := CommitaTransacao;
  end;
  _abreRelacao;
end;

function TCST_PIS_Relacao.edit: Boolean;
begin
  Result := False;
  if inherited Edit then
  begin
    fCST      := Trim(dataSet.FieldByName('CST').AsString);
    fTIPO     := Trim(dataSet.FieldByName('TIPO').AsString);
    fSUBTIPO  := Trim(dataSet.FieldByName('SUBTIPO').AsString);
    fCOD_CTA  := Trim(dataSet.FieldByName('COD_CTA').AsString);
    Result := True;
  end;
end;

function TCST_PIS_Relacao.insert: Boolean;
begin
  Result := False;
  if inherited insert then
  begin
    fCST      := '';
    fTIPO     := '';
    fSUBTIPO  := '';
    fCOD_CTA  := '';
    Result := True;
  end;
end;

function TCST_PIS_Relacao.post: Boolean;
var
  acao: string;
begin
  try
    Result := False;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := true;
      exit;
    end;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if Trim(dataSet.FieldByName('cst').asString) = '' then
      raiseExceptionCreate('CST do PIS COFINS deve ser preenchido!', 'DBComboBox3');

    if Trim(dataSet.FieldByName('tipo').asString) = '' then
      raiseExceptionCreate('Tipo deve ser preenchido', 'DBRadioGroup1');

    if Trim(dataSet.FieldByName('subtipo').asString) = '' then
      dataSet.FieldByName('subtipo').asString := 'N';

    if Trim(dataSet.FieldByName('cod_cta').asString) = '' then
      raiseExceptionCreate('Código do Conta Analítica Contábil deve ser preenchida!', 'DBEdit7');

    buscas.Close;
    if dataSet.State = dsInsert then
    begin
      buscas.SQL.Text := 'select cst from RELACAO_CST_PIS_PCONTAS' +
        ' where cst = ' + QuotedStr(Trim(dataSet.FieldByName('cst').asString)) +
        ' and tipo = ' + QuotedStr(Trim(dataSet.FieldByName('tipo').asString)) +
        ' and subtipo = ' + QuotedStr(Trim(dataSet.FieldByName('subtipo').asString)) +
        ' and cod_cta = ' + QuotedStr(Trim(dataSet.FieldByName('cod_cta').asString));
    end
    else
    begin
      buscas.SQL.Text := 'select cst from RELACAO_CST_PIS_PCONTAS' +
        ' where cst = ' + QuotedStr(Trim(dataSet.FieldByName('cst').asString)) +
        ' and tipo = ' + QuotedStr(Trim(dataSet.FieldByName('tipo').asString)) +
        ' and subtipo = ' + QuotedStr(Trim(dataSet.FieldByName('subtipo').asString)) +
        ' and cod_cta = ' + QuotedStr(Trim(dataSet.FieldByName('cod_cta').asString)) +
        ' and cst <> ' + QuotedStr(Trim(fCST)) +
        ' and tipo <> ' + QuotedStr(Trim(fTIPO)) +
        ' and subtipo <> ' + QuotedStr(Trim(fSUBTIPO)) +
        ' and cod_cta <> ' + QuotedStr(Trim(fCOD_CTA));
    end;
    buscas.Open;

    if not buscas.IsEmpty then
      raiseExceptionCreate('Dados informados já existem para outro cadastro', 'DBComboBox3');

    dataSet.post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    Apply;
    Refresh;
    result := true;
    CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('SPED085', acao, 'SUCESSO', 'MOVIMENTO_CIAP', '', buscas)
    else
      vDadosIni.GravaAuditoria('SPED085', acao, 'FALHA', 'MOVIMENTO_CIAP', '', buscas);

  if Result then
    _abreRelacao;

  except on E: Exception do
  begin
    Result := False;
    Application.MessageBox(pchar('Erro: '+e.Message), 'Atenção', 0 + 64);
    registraErro('TCST_PIS_Relacao.post. Erro: ' + e.message);
  end;
  end;
end;

function TCST_PIS_Relacao._abreRelacao: boolean;
begin
  Result := montaSelect('select * from RELACAO_CST_PIS_PCONTAS');
end;

end.

