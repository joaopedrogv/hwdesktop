unit uClassesFollowUpPosAtendimento;

interface

uses
  uDataSet_OOP, DB, DBClient, StdCtrls, IBQuery, CheckLst, Classes, Controls;

const
  const_NomeMes: array[1..12] of string = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');
  const_Satisfacao: array[0..5] of string = ('Não sabe responder', 'Totalmente Insatisfeito', 'Insatisfeito', 'Nem Satisfeito nem Insatisfeito', 'Satisfeito', 'Totalmente Satisfeito');
  const_Satisfacao2: array[0..5] of string = ('Não sabe responder', 'Pessimo', 'Ruim', 'Regular', 'Bom', 'Excelente');
  const_Resposta: array[1..2] of string = ('Não', 'Sim');
  const_Alfabeto: array[1..52] of string = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'NA', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ');
type
  CTipo = ( ctAtendimento, ctCurriculum, ctRecado, ctReclamacao, ctSaida, ctSugestao, ctVisitaSuporte, ctVisitaVenda);
  CTipoContato = ( tcDireto, tcTelefone);
  CComContrato = ( ccSim, ccNao);
  CPesquisaCliente = ( pcNome, pcCodigo);

  RConsultaAnotacoes = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    vTipo: array of CTipo;
    vTipoContato: array of CTipoContato;
    vComContrato: array of CComContrato;
    porData, porDataAd: Boolean;
    //Opçoes Adicionais
    adicional: boolean;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd: string;
  end;

  RPesquisa = record
    vOS, vAtd, vHW, vReq: Boolean;
    vDataIni, vDataFim, vTipoReq, vTipoOS: string;
    vCodColab: Integer;
  end;

  TFlw_Grupos = class;
  TFlw_PerguntaComplemento = class;
  TFlw_Pergunta = class;
  TFlw_PerfilPergunta = class;
  TFlw_Perfil = class;
  TFlw_Colaborador = class;
  TFlw_Cliente = class;
  TFlw_Atendimentos_HW = class;
  TFlw_Atendimentos = class;
  TFlw_RespostaComplemento = class;
  TFlw_Resposta = class;
  TFlw_Pesquisa = class;
  TFlw_ImportarPesquisa_TipoVendas = class;
  TFlw_ImportarPesquisa_ItensOS = class;
  TFlw_ImportarPesquisa = class;
  TFlw_Graficos = class;
  TFlw_Tendencias = class;
  TFlw_ReacoesNegativas = class;
  TFlw_Indices = class;
  TFlw_SoftwareSuporte = class;
  TFlw_TipoAnotacoes = class;
  TFlw_Anotacoes = class;

  TFlw_Grupos = class(TDataSet_OOP)
  public
//    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    procedure _cadFlwGrupos(pTipoForm: integer);
    function _abreTodos: Boolean;
    function _existeGrupo(pCodGrupo: Integer; pShowMessageError: Boolean = False): Boolean;
    function _selecionaGrupo(pCodGrupo: Integer): Boolean;
  end;

  TFlw_PerguntaComplemento = class(TDataSet_OOP)
  public
    constructor create;
    function post: boolean; override;
    function _selecionaPergComp(pCodigoPergunta: integer): boolean; overload;
    function _selecionaPergComp(pCodigoPergunta, pCodPergComplemento: integer): boolean; overload;
    function _inserePerguntaComplemento(pCodigoPergunta: integer; pDescricaoAlternativa: string): boolean;
    function _alteraPerguntaComplemento(pDescricaoAlternativa: string): boolean;
  end;

  TFlw_Pergunta = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;

    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    procedure _cadFlwPerguntas(pTipoForm: integer);
    function _abreTodos: Boolean;
    function _selecionaPergunta(pCodigoPerfil: Integer): boolean; 

//    function _selecionaPergunta(pCodigoPergunta: Integer): boolean; overload;
//    function _getTodasPerguntas(pDataSetPerg: TClientDataSet): boolean; overload;
//    function _getTodasPerguntas: boolean; overload;
//    function _existePergunta(pCodigo: integer): boolean; overload;
    function _existePergunta(pDescricaoPergunta: string; pCodigoGrupo: Integer): boolean; overload;
  var
    vGrupo: TFlw_Grupos;
    vComplemento: TFlw_PerguntaComplemento;
  end;

  TFlw_PerfilPergunta = class(TDataSet_OOP)
  private
    fDataSetMem: TClientDataSet;
    iMax: Integer;
  public
    constructor create;
    function delete: Boolean; override;
    function _selecionaPerfilPergunta(pCodigoPerfil: integer; pMontarDataSetMem : Boolean = False): boolean;
    function _inserePerfilPergunta(pCodigoPerfil, pCodigoPergunta: integer): boolean;
//    property dataSetMem: TClientDataSet read fDataSetMem write fDataSetMem;
  var
    vPergunta: TFlw_Pergunta;
  end;

  TFlw_Perfil = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    procedure _cadFlwPerfil(pTipoForm: integer);
    function _selecionaPerfil(pCodPerfil: Integer): Boolean;
    function _abreTodos: Boolean;
  var
    vPerfPerg: TFlw_PerfilPergunta;
  end;

  TFlw_Colaborador = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodos(pUnion: Boolean = False): Boolean;
    function _existeColaborador(pCodigo: Integer): Boolean;
  end;

  TFlw_Cliente = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaCliente(pCodCliente: Integer): Boolean;
    function _selecionaClienteGrafico(pCodCliente: Integer): Boolean;
  end;

  TFlw_Atendimentos_HW = class(TDataSet_OOP)
  public
    constructor create;
    function _pesquisa(pTipo, pDataIni, pDataFim: string; pCodColab: Integer): Boolean;

    procedure _marcaLinha;
    procedure _marcaDesmarcaLinha;
    procedure _desmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
  end;

  TFlw_Atendimentos = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    procedure _cadFlwAtendimentos(pTipoForm: integer);
    function _existeCliente(pAtribuirNome: Boolean = False): Boolean;

    function _importarRegistrosSelecionados: Boolean;

  var
    vColab : TFlw_Colaborador;
    vAtendHw : TFlw_Atendimentos_HW;
  end;

  TFlw_RespostaComplemento = class(TDataSet_OOP)
  public
    vLista: TStringList;
    constructor create;
    function post: boolean; override;
    function _novo(pCodigoPesquisa, pCodigoPergunta: Integer): Boolean; overload;
    function _selecionaRespCompl(pCodigoPesquisa: Integer): Boolean; overload;
    function _selecionaRespCompl(pCodigoPesquisa, pCodigoPergunta: Integer): Boolean; overload;
    function _selecionaRespCompl(pCodigoPesquisa, pCodigoPergunta, pNivel: Integer): Boolean; overload;
    function _incluirRespCompl(pCodigoPesquisa, pCodigoPergunta, pRespostaCompl: Integer): Boolean; overload;
    function _incluirRespCompl(pCodigoPesquisa, pCodigoPergunta: Integer; ckList: TCheckListBox): Boolean; overload;
    function _apagaRespCompl(pCodigoPesquisa, pCodigoPergunta, pRespostaCompl: Integer): Boolean; overload;
    procedure _setCodPesquisa(pCodPesquisa: Integer);
  end;

  TFlw_Resposta = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    function post: boolean; override;
    function _selecionaResposta(pCodigoPesquisa: Integer): Boolean; overload;
    function _selecionaResposta(pCodigoPesquisa, pCodigoPergunta: Integer): Boolean; overload;
    function _incluirResposta(pCodigoPesquisa, pCodigoPergunta, pNivelResposta: Integer; pComentario: string): Boolean;
    function _existeResposta(pCodigoPesquisa, pCodigoPergunta: Integer): Boolean;
    function _excluirResposta(pCodigoPesquisa, pCodigoPergunta: Integer): Boolean;
    procedure _setCodPesquisa(pCodPesquisa: Integer);
  var
    vRespCompl: TFlw_RespostaComplemento;
  end;

  TFlw_Pesquisa = class(TDataSet_OOP)
  private
    function _setDadosPesquisa(pCodigoAntenOuPed: Integer; pTipoPedOuAtend: string): Boolean;
  public
    constructor create;
    constructor createPesquisa;
    destructor destroy; override;
    function edit: Boolean; override;
    function insert: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;
    function _selecionaPesquisa(pTipoPesquisa: string; pCodigo: integer): Boolean;
    function _populaAlternativasComplemento(ckList: TCheckListBox): Boolean;
    function _abrirPesquisa(pCodigoAntenOuPed: Integer; pTipoPedOuAtend: string): Boolean;
    function _concluirPesquisa: Boolean;
    function _iniciarPesquisa: Boolean;
    function _pesquisaConcluida: Boolean;
    function _pesquisaEmAndamento: Boolean;
    procedure _cadPesquisa(pTipoForm: Integer);overload;
    procedure _cadPesquisa(pTipoForm: Integer;pCodCliente:integer); overload;
    function _getInformacaoClienteAtendimento: string;
    function _existePerfil(pCodPerfil: Integer): Boolean;
    function _pesquisa(pCampo, pCondicao, pValor, pData1, pData2: string): Boolean;overload;
    function _pesquisa(pCodCliente:integer): Boolean;overload;
    function _exportarParaExcel: Boolean;

    function _importarRegistrosSelecionados: Boolean;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
  var
    vResposta: TFlw_Resposta;
    vPergunta: TFlw_Pergunta;
    vCliente: TFlw_Cliente;
    vColab: TFlw_Colaborador;
    vPerfil: TFlw_Perfil;
    vImpPesq: TFlw_ImportarPesquisa;
  end;

  TFlw_ImportarPesquisa_TipoVendas = class(TDataSet_OOP)
  private
    fTipo: string;
  public
    constructor create(pTipo: string);
    function _abreTodos: Boolean;
  end;

  TFlw_ImportarPesquisa_ItensOS = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaItens(pTipo: string; pCodigo: Integer): Boolean;
  end;

  TFlw_ImportarPesquisa = class(TDataSet_OOP)
  private
    procedure _dataSetAfterScroll(DataSet: TDataSet);
  public
    constructor create;
    function _pesquisa: Boolean;
    procedure _marcaLinha;
    procedure _marcaDesmarcaLinha;
    procedure _desmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
  var
    vItOS: TFlw_ImportarPesquisa_ItensOS;
    vTVReq: TFlw_ImportarPesquisa_TipoVendas;
    vTVOs: TFlw_ImportarPesquisa_TipoVendas;
    vCons: RPesquisa;
  end;

  TFlw_Graficos = class(TDataSet_OOP)
  private
  public
    function _montaTabelaMensal(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; virtual; abstract;
    function _montaTabelaAnual(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; virtual; abstract;
    function _selecionaValores(mes, ano: TDate; grupo, Pergunta: integer): boolean; overload; virtual;
    function _selecionaValores(ano: TDate; grupo, Pergunta: integer): boolean; overload; virtual;
    function _selecionaGrupoPerguntas(dtSetGP: TClientDataSet; ano: TDate): boolean; virtual;
  var
    vUtilDataSet: TClientDataSet;
    vPerfil: TFlw_Perfil;
    vCliente: TFlw_Cliente;
    vColab: TFlw_Colaborador;
  end;

  TFlw_Tendencias = class(TFlw_Graficos)
  public
    constructor create;
    function _montaTabelaMensal(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; override;
  end;

  TFlw_ReacoesNegativas = class(TFlw_Graficos)
  public
    constructor create;
    function _montaTabelaMensal(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; override;
    function _montaTabelaAnual(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; override;
  end;

  TFlw_Indices = class(TFlw_Graficos)
  public
    constructor create;
    function _montaTabelaAnual(ano: TDate; dtSet: TClientDataSet; grupo, Pergunta: integer): boolean; override;
    function _selecionaValores(ano: TDate; grupo, Pergunta: integer): boolean; override;
  end;

  TFlw_SoftwareSuporte = class(TDataSet_OOP)
  private
    fNomeSoftware: string;
  public
    constructor create;
    function abreFormSoftware: Boolean;
    function abreTodos: Boolean;
    function incluirSoftware: Boolean;
    function alterarSoftware: Boolean;

    property NomeSoftware: string read fNomeSoftware write fNomeSoftware;
  end;

  TFlw_TipoAnotacoes = class(TDataSet_OOP)
  private
    fDescricaoAssunto: string;
  public
    constructor create;
    function abreFormAssunto: Boolean;
    function abreTodos: Boolean;
    function incluirAssunto: Boolean;
    function alterarAssunto: Boolean;

    property DescricaoAssunto: string read fDescricaoAssunto write fDescricaoAssunto;
  end;

  TFlw_Anotacoes = class(TDataSet_OOP)
  private
    fRazaoSocial: Boolean;
    function abreFormClientes: Boolean;
  public

    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira(pSomenteSelecionados: Boolean = False): Boolean;
    function _lixeiraVazia: Boolean;
    procedure _cadAnotacoes(pTipoForm: integer);

    function _existeCliente(pAtribuirNome: Boolean; pPesquisa: CPesquisaCliente ): Boolean;
    function _consulta: boolean;
    property RazaoSocial: Boolean read fRazaoSocial write fRazaoSocial;
  var
    vTipoAnot: TFlw_TipoAnotacoes;
    vSoft: TFlw_SoftwareSuporte;
    vCons: RConsultaAnotacoes;
    vColab : TFlw_Colaborador;
  end;

var
  vCodClienteIn: string;
  flwGrupo: TFlw_Grupos;
  flwPergunta: TFlw_Pergunta;
  flwPerfil: TFlw_Perfil;
  flwAtend: TFlw_Atendimentos;
  flwPesquisa: TFlw_Pesquisa;
  flwPesquisaE: TFlw_Pesquisa;
  flwGraficos: TFlw_Graficos;
  flwAnotacoes: TFlw_Anotacoes;

implementation

uses
  uDtmFollowUpPosAtendimento, uCadFlwGrupos, IBDatabase, uDtmAtivo, Forms,
  Windows, SysUtils, uCadFlwPergunta, uDadosIni, uCadFlwPerfil,
  uCadFlwAtendimento, uFlwPesquisa, uCadFlwPesquisa, DateUtils, ComObj,
  Graphics, uCadAnotacoes, uPadrao;

{ TFlw_Grupos }

constructor TFlw_Grupos.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsFlwGrupo);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
end;

function TFlw_Grupos.delete: Boolean;
var
  codGrup: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codGrup := dataSet.FieldByName('CODGRUPO').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('CRM032', 'EXCLUIR', 'COD GRUPO ' + dataSet.FieldByName('CODGRUPO').AsString, 'FLW_GRUPO',
      dataSet.FieldByName('CODGRUPO').AsString, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    if ExecutaComandosSql('select first 1 codgrupo from flw_pergunta' +
      ' where codgrupo = ' + IntToStr(dataSet.FieldByName('CODGRUPO').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('Grupo não pode ser excluído pois está vinculado a uma ou mais Perguntas',
        'Atenção', 0 + 64);
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from flw_grupo where codgrupo = ' + IntToStr(dataSet.FieldByName('CODGRUPO').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM032', 'EXCLUIR', 'SUCESSO', 'FLW_GRUPO', codGrup, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM032', 'EXCLUIR', 'FALHA', 'FLW_GRUPO', codGrup, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;

  
  if not vDadosIni.PesqPros('CRM031', 'EXCLUIR', 'COD GRUPO ' + dataSet.FieldByName('CODGRUPO').AsString, 'FLW_GRUPO',
    dataSet.FieldByName('CODGRUPO').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM031', 'LIXEIRA', 'SUCESSO', 'FLW_GRUPO', codGrup, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM031', 'LIXEIRA', 'FALHA', 'FLW_GRUPO', codGrup, buscas);
  end;
  Result := true;
  Refresh;
end;

function TFlw_Grupos.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM029', 'ALTERAR', '', 'FLW_GRUPO', dataSet.FieldByName('CODGRUPO').AsString, buscas, False) then
    Exit;

  if inherited edit then
    Result := True;
end;

function TFlw_Grupos.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('CRM028', 'INCLUIR', '', 'FLW_GRUPO', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select * from flw_grupo' +
      ' where codgrupo = 0 and cod_empresa = 0');

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  end;

end;

function TFlw_Grupos.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM030', 'SALVAR', '', 'FLW_GRUPO', dataSet.FieldByName('CODGRUPO').AsString, buscas, False) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('descricao').AsString) = '' then
      raiseExceptionCreate('Descrição do Grupo não informada', 'DBEdit2');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('codgrupo').AsInteger := Gencodigo('FLW_GRUPO', dtmFollowUpPosAtendimento.SpIncCodigo,vDadosIni.codEmpresa);
      vDadosIni.vPesquisa := dataSet.FieldByName('codgrupo').AsString;
    end;

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM030', acao, 'SUCESSO', 'FLW_GRUPO', dataSet.FieldByName('codgrupo').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM030', acao, 'FALHA', 'FLW_GRUPO', dataSet.FieldByName('codgrupo').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TFlw_Grupos._abreTodos: Boolean;
begin
  montaSelect('select * from flw_grupo' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

procedure TFlw_Grupos._cadFlwGrupos(pTipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Grupos de Perguntas');
  if dtmFollowUpPosAtendimento = nil then
    dtmFollowUpPosAtendimento := TdtmFollowUpPosAtendimento.Create(dtmFollowUpPosAtendimento);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('CRM026', 'CONSULTA', '', 'FLW_GRUPO', '',
    dtmFollowUpPosAtendimento.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadFlwGrupos = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadFlwGrupos, frmCadFlwGrupos);
  end;
  if (pTipoForm > 0) and (not frmCadFlwGrupos.Enabled) then
  	frmCadFlwGrupos.ShowModal
  else if (not frmCadFlwGrupos.Enabled) then
  	frmCadFlwGrupos.Show
  else if frmCadFlwGrupos.FormStyle = fsMDIChild then
    frmCadFlwGrupos.Show
  else
    frmCadFlwGrupos.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

function TFlw_Grupos._existeGrupo(pCodGrupo: Integer; pShowMessageError: Boolean = False): Boolean;
begin
  Result := ExecutaComandosSql('select codgrupo from flw_grupo' +
    ' where codgrupo = ' + IntToStr(pCodGrupo) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
  if pShowMessageError and (not Result) then
    Application.MessageBox(pchar('Grupo de código ' + IntToStr(pCodGrupo) + ' não encontrado'), 'Atenção', 0 + 64);
end;

function TFlw_Grupos._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 codgrupo from flw_grupo' +
    ' where codgrupo > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TFlw_Grupos._restaurarRegistroDaLixeira: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM034', 'RESTAURAR', 'COD GRUPO ' + dataSet.FieldByName('CODGRUPO').AsString, 'FLW_GRUPO',
    dataSet.FieldByName('CODGRUPO').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM034', 'RESTAURAR', 'SUCESSO', 'FLW_GRUPO', dataSet.FieldByName('CODGRUPO').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM034', 'RESTAURAR', 'FALHA', 'FLW_GRUPO', dataSet.FieldByName('CODGRUPO').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TFlw_Grupos._selecionaGrupo(pCodGrupo: Integer): Boolean;
begin
  Result := montaSelect('select * from flw_grupo' +
    ' where codgrupo = ' + IntToStr(pCodGrupo) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TFlw_Grupos._verLixeira: Boolean;
begin
  if not vDadosIni.PesqPros('CRM033', 'VER LIXEIRA', '', 'FLW_GRUPO', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select * from flw_grupo ' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 0');
  Result := not dataSet.IsEmpty;
end;

{ TFlw_PerguntaComplemento }

constructor TFlw_PerguntaComplemento.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPergCompl);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
end;

function TFlw_PerguntaComplemento.post: boolean;
begin
  try
    result := true;
    if dataset.State = dsInsert then
      dataSet.FieldByName('CODPERGCOMPL').AsInteger := GenCodigo('PERGUNTACOMPLEMENTO', dtmFollowUpPosAtendimento.SpIncCodigo,vDadosIni.codEmpresa);
    inherited post;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_PerguntaComplemento.post. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao salvar complemento da pergunta. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_PerguntaComplemento._alteraPerguntaComplemento(
  pDescricaoAlternativa: string): boolean;
begin
  Result := False;
  try
    if trim(pDescricaoAlternativa) = '' then
      Exit;
    result := true;
    Edit;
    dataSet.FieldByName('alternativa').AsString := pDescricaoAlternativa;
    post;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_PerguntaComplemento._alteraPerguntaComplemento. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao salvar complemento da pergunta. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_PerguntaComplemento._inserePerguntaComplemento(
  pCodigoPergunta: integer; pDescricaoAlternativa: string): boolean;
begin
  Result := False;
  try
    if trim(pDescricaoAlternativa) = '' then
      Exit;
    result := true;
    insert;
    dataSet.FieldByName('codpergunta').AsInteger := pCodigoPergunta;
    dataSet.FieldByName('alternativa').AsString := pDescricaoAlternativa;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('ordem').AsInteger := dataSet.RecordCount + 1;
    post;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_PerguntaComplemento._inserePerguntaComplemento. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao salvar complemento da pergunta. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_PerguntaComplemento._selecionaPergComp(pCodigoPergunta,
  pCodPergComplemento: integer): boolean;
begin
  Result := montaSelect('select * from flw_perguntacomplemento where codpergcompl = ' + IntToStr(pCodPergComplemento) +
    ' and codpergunta = ' + inttostr(pCodigoPergunta) + ' and cod_empresa = ' + vdadosIni.codempresa + ' order by ordem');
end;

function TFlw_PerguntaComplemento._selecionaPergComp(
  pCodigoPergunta: integer): boolean;
begin
  Result := montaSelect('select * from flw_perguntacomplemento where codpergunta = ' + inttostr(pCodigoPergunta) + ' and cod_empresa = ' + vdadosIni.codempresa +
    ' order by ordem');
end;

{ TFlw_Pergunta }

constructor TFlw_Pergunta.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPergunta);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);

  vGrupo := TFlw_Grupos.create;
  vGrupo.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsFlwGrCons);
  vComplemento := TFlw_PerguntaComplemento.create;
end;

function TFlw_Pergunta.delete: Boolean;
var
  codPergunta: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codPergunta := dataSet.FieldByName('codpergunta').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('CRM040', 'EXCLUIR', 'COD PERGUNTA ' + dataSet.FieldByName('codpergunta').AsString, 'FLW_PERGUNTA',
      dataSet.FieldByName('codpergunta').AsString, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    if ExecutaComandosSql('select first 1 codpergunta from flw_perfilpergunta' +
      ' where codpergunta = ' + IntToStr(dataSet.FieldByName('codpergunta').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('Pergunta não pode ser excluída pois está vinculada a um ou mais Perfis',
        'Atenção', 0 + 64);
      Exit;
    end;

    if ExecutaComandosSql('select first 1 codpergunta from flw_resposta' +
      ' where codpergunta = ' + IntToStr(dataSet.FieldByName('codpergunta').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('Pergunta não pode ser excluída pois está sendo usada em alguma Pesquisa',
        'Atenção', 0 + 64);
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from flw_pergunta where codpergunta = ' + IntToStr(dataSet.FieldByName('codpergunta').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM040', 'EXCLUIR', 'SUCESSO', 'FLW_PERGUNTA', codPergunta, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM040', 'EXCLUIR', 'FALHA', 'FLW_PERGUNTA', codPergunta, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;


  if not vDadosIni.PesqPros('CRM041', 'EXCLUIR', 'COD PERGUNTA ' + dataSet.FieldByName('codpergunta').AsString, 'FLW_PERGUNTA',
    dataSet.FieldByName('codpergunta').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM041', 'LIXEIRA', 'SUCESSO', 'FLW_PERGUNTA', codPergunta, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM041', 'LIXEIRA', 'FALHA', 'FLW_PERGUNTA', codPergunta, buscas);
  end;
  Result := true;
  Refresh;
end;

destructor TFlw_Pergunta.destroy;
begin
  vGrupo.Free;
  vGrupo := nil;
  vComplemento.Free;
  vComplemento := nil;
  inherited;
end;

function TFlw_Pergunta.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM038', 'ALTERAR', '', 'FLW_PERGUNTA', dataSet.FieldByName('CODPERGUNTA').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    vGrupo._abreTodos;
    vComplemento._selecionaPergComp(dataSet.FieldByName('codpergunta').AsInteger);
    Result := True;
  end;
end;

function TFlw_Pergunta.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('CRM037', 'INCLUIR', '', 'FLW_PERGUNTA', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select p.*, g.descricao, g.categoria from flw_pergunta p' +
    ' inner join flw_grupo g on g.codgrupo = p.codgrupo and g.cod_empresa = p.cod_empresa' +
    ' where p.codpergunta = 0 and p.cod_empresa = 0');

  if inherited insert then
  begin
    vGrupo._abreTodos;
    vComplemento._selecionaPergComp(dataSet.FieldByName('codpergunta').AsInteger);
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  end;
end;

function TFlw_Pergunta.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM039', 'SALVAR', '', 'FLW_PERGUNTA', dataSet.FieldByName('CODPERGUNTA').AsString, buscas, False) then
    Exit;

  try

    if (not (dataSet.State in [dsInsert, dsEdit])) and (vComplemento.dataSet.ChangeCount = 0) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataset.FieldByName('pergunta').AsString = '' then
      raiseExceptionCreate('Campo Pergunta de preenchimento obrigatório', 'DBEdit3');
    if dataset.FieldByName('codgrupo').AsString = '' then
      raiseexceptioncreate('Campo Grupo de preenchimento obrigatório', 'DBEdit2');
    if not vGrupo._existeGrupo(dataset.FieldByName('codgrupo').AsInteger) then
      raiseexceptioncreate('Grupo informado não encontrado', 'DBEdit2');
    if dataset.FieldByName('simnaonivel').AsString = '' then
      raiseexceptioncreate('Campo Tipo de Resposta de preenchimento obrigatório', 'DBComboBox1');
    if not vComplemento.IsEmpty then
    begin
      if dataSet.FieldByName('complemento').AsString = ''  then
        raiseExceptionCreate('Quando existir alternativas cadastradas o campo Complemento deve estar preenchido', 'DBEdit5');
    end
    else
    begin
      if dataSet.FieldByName('complemento').AsString <> ''  then
        raiseexceptioncreate('Quando o campo Complemento está preenchido devem existir alternativas', 'Edit1');
    end;

    if dataSet.State = dsInsert then
    begin
      if _existePergunta(dataset.FieldByName('pergunta').AsString, dataset.FieldByName('codgrupo').AsInteger) then
        raise Exception.Create('Pergunta já cadastrada para o grupo informado');
      dataSet.FieldByName('CODPERGUNTA').AsInteger := Gencodigo('FLW_PERGUNTA', dtmFollowUpPosAtendimento.SpIncCodigo,vDadosIni.codEmpresa);
      vComplemento.dataSet.First;
      while not vComplemento.dataSet.Eof do
      begin
        vComplemento.dataSet.Edit;
        vComplemento.dataSet.FieldByName('CODPERGUNTA').AsInteger := dataSet.FieldByName('CODPERGUNTA').AsInteger;
        vComplemento.dataSet.Post;
        vComplemento.dataSet.Next;
      end;
    end;

    if (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := inherited Post;
      Result := Apply;
    end
    else
      Result := True;

    if Result then
      if vComplemento.dataSet.ChangeCount > 0 then
        Result := vComplemento.Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM039', acao, 'SUCESSO', 'FLW_PERGUNTA', dataSet.FieldByName('CODPERGUNTA').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM039', acao, 'FALHA', 'FLW_PERGUNTA', dataSet.FieldByName('CODPERGUNTA').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TFlw_Pergunta._abreTodos: Boolean;
begin
  Result := montaSelect('select p.*, g.descricao, g.categoria from flw_pergunta p' +
    ' inner join flw_grupo g on g.codgrupo = p.codgrupo and g.cod_empresa = p.cod_empresa' +
    ' where p.cod_empresa = ' + vDadosIni.codEmpresa + ' and p.ativo = 1');
end;

procedure TFlw_Pergunta._cadFlwPerguntas(pTipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Perguntas');
  if dtmFollowUpPosAtendimento = nil then
    dtmFollowUpPosAtendimento := TdtmFollowUpPosAtendimento.Create(dtmFollowUpPosAtendimento);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('CRM035', 'CONSULTA', '', 'FLW_GRUPO', '',
    dtmFollowUpPosAtendimento.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadFlwPergunta = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadFlwPergunta, frmCadFlwPergunta);
  end;
  if (pTipoForm > 0) and (not frmCadFlwPergunta.Enabled) then
  	frmCadFlwPergunta.ShowModal
  else if (not frmCadFlwPergunta.Enabled) then
  	frmCadFlwPergunta.Show
  else if frmCadFlwPergunta.FormStyle = fsMDIChild then
    frmCadFlwPergunta.Show
  else
    frmCadFlwPergunta.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

function TFlw_Pergunta._existePergunta(pDescricaoPergunta: string;
  pCodigoGrupo: Integer): boolean;
begin
  Result := ExecutaComandosSql('select first 1 codpergunta from flw_pergunta where pergunta = ' + QuotedStr(pDescricaoPergunta) +
      ' and codgrupo = ' + IntToStr(pCodigoGrupo));
end;

function TFlw_Pergunta._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 codpergunta from flw_pergunta' +
    ' where codpergunta > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TFlw_Pergunta._restaurarRegistroDaLixeira: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM043', 'RESTAURAR', 'COD PERGUNTA ' + dataSet.FieldByName('CODPERGUNTA').AsString, 'FLW_PERGUNTA',
    dataSet.FieldByName('CODPERGUNTA').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM043', 'RESTAURAR', 'SUCESSO', 'FLW_PERGUNTA', dataSet.FieldByName('CODPERGUNTA').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM043', 'RESTAURAR', 'FALHA', 'FLW_PERGUNTA', dataSet.FieldByName('CODPERGUNTA').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TFlw_Pergunta._selecionaPergunta(pCodigoPerfil: Integer): boolean;
begin
  Result := montaSelect('select p.*, g.descricao, g.categoria from flw_pergunta p' +
    ' inner join flw_grupo g on g.codgrupo = p.codgrupo and g.cod_empresa = p.cod_empresa' +
    ' inner join flw_perfilpergunta pp on pp.codpergunta = p.codpergunta and pp.cod_empresa = p.cod_empresa' +
    ' where pp.codperfil = ' + IntToStr(pCodigoPerfil) + ' and pp.cod_empresa = ' + vdadosIni.codempresa);
end;

function TFlw_Pergunta._verLixeira: Boolean;
begin
  if not vDadosIni.PesqPros('CRM042', 'VER LIXEIRA', '', 'FLW_PERGUNTA', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select p.*, g.descricao, g.categoria from flw_pergunta p' +
    ' inner join flw_grupo g on g.codgrupo = p.codgrupo and g.cod_empresa = p.cod_empresa' +
    ' where p.cod_empresa = ' + vDadosIni.codEmpresa + ' and p.ativo = 0');
  Result := not dataSet.IsEmpty;
end;

{ TFlw_PerfilPergunta }

constructor TFlw_PerfilPergunta.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPerfilPerg);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);

  vPergunta := TFlw_Pergunta.create;
  vPergunta.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPergCons);
  fDataSetMem := TClientDataSet(dtmFollowUpPosAtendimento.cdsPerfilPergMem);
  try
    if fDataSetMem.Tag <> 22 then
      fDataSetMem.CreateDataSet;
    fDataSetMem.Tag := 22;
  except
  end;
end;

function TFlw_PerfilPergunta.delete: Boolean;
begin

  if fDataSetMem.IsEmpty then
    Exit;

  dataSet.Filtered := False;
  dataSet.Filter := 'codperfil = ' + IntToStr(fDataSetMem.FieldByName('codperfil').AsInteger) +
    ' and codpergunta = ' + IntToStr(fDataSetMem.FieldByName('codpergunta').AsInteger);
  dataSet.Filtered := True;

  if (dataSet.FieldByName('codperfil').AsInteger = fDataSetMem.FieldByName('codperfil').AsInteger) and
    (dataSet.FieldByName('codpergunta').AsInteger = fDataSetMem.FieldByName('codpergunta').AsInteger) then
  begin
    if vDadosIni.PesqPros('CRM054', 'REMOVER', 'COD PERFIL / PERGUNTA: ' +
      dataSet.FieldByName('codperfil').AsString + ' / ' +
      dataSet.FieldByName('codpergunta').AsString,
      'FLW_PERFILPERGUNTA', '', buscas, true) then
      if inherited delete then
        fDataSetMem.Delete;
  end;
end;

function TFlw_PerfilPergunta._inserePerfilPergunta(pCodigoPerfil,
  pCodigoPergunta: integer): boolean;
begin
  Result := False;
  if not dataSet.Active then
    montaSelect('select * flw_perfilpergunta' +
                ' where codperfil = ' + IntToStr(pCodigoPerfil) +
                ' and cod_empresa = ' + vDadosIni.codEmpresa);

  dataSet.Filtered := False;
  dataSet.Filter := 'codperfil = ' + IntToStr(pCodigoPerfil) +
    ' and codpergunta = ' + IntToStr(pCodigoPergunta);

  try
    dataSet.Filtered := True;

    if dataSet.FieldByName('codpergunta').AsInteger = pCodigoPergunta then
      Exit;

    
    if not vDadosIni.PesqPros('CRM053', 'ADICIONAR', 'COD PERFIL / PERGUNTA: ' +
      IntToStr(pCodigoPerfil) + ' / ' + IntToStr(pCodigoPergunta),
      'FLW_PERFILPERGUNTA', '', buscas, true) then
      Exit;

    if inherited insert then
    begin
      Result := True;
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('codperfil').AsInteger := pCodigoPerfil;
      dataSet.FieldByName('codpergunta').AsInteger := pCodigoPergunta;
      dataSet.FieldByName('ordem').AsInteger := iMax + 1;
      dataset.Post;

      iMax := iMax + 1;

      fDataSetMem.Insert;
      fDataSetMem.FieldByName('CODPERGUNTA').AsInteger := vPergunta.dataSet.FieldByName('CODPERGUNTA').AsInteger;
      fDataSetMem.FieldByName('CODPERFIL').AsInteger := pCodigoPerfil;
      fDataSetMem.FieldByName('PERGUNTA').AsString := vPergunta.dataSet.FieldByName('PERGUNTA').AsString;
      fDataSetMem.FieldByName('COMPLEMENTO').AsString := vPergunta.dataSet.FieldByName('COMPLEMENTO').AsString;
      fDataSetMem.FieldByName('DESCRICAO').AsString := vPergunta.dataSet.FieldByName('DESCRICAO').AsString;
      fDataSetMem.FieldByName('CATEGORIA').AsString := vPergunta.dataSet.FieldByName('CATEGORIA').AsString;
      fDataSetMem.FieldByName('ORDEM').AsInteger := iMax;
      fDataSetMem.Post;

    end;

  finally
    dataSet.Filtered := False;
  end;
end;

function TFlw_PerfilPergunta._selecionaPerfilPergunta(
  pCodigoPerfil: integer; pMontarDataSetMem : Boolean = False): boolean;
begin
  Result := montaSelect('select * from flw_perfilpergunta' +
    ' where codperfil = ' + IntToStr(pCodigoPerfil) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by ordem');

  if pMontarDataSetMem then
  begin
    fDataSetMem.EmptyDataSet;

    vPergunta.dataSet.Filtered := False;
    vPergunta._abreTodos;

    try

      dataSet.First;
      while not dataSet.Eof do
      begin

        vPergunta.dataSet.Filtered := False;
        vPergunta.dataSet.Filter := 'codpergunta = ' + IntToStr(dataSet.FieldByName('codpergunta').AsInteger);
        vPergunta.dataSet.Filtered := True;

        if (dataSet.FieldByName('codperfil').AsInteger = pCodigoPerfil) and
          (dataSet.FieldByName('codpergunta').AsInteger = vPergunta.dataSet.FieldByName('codpergunta').AsInteger) then
        begin
          fDataSetMem.Insert;
          fDataSetMem.FieldByName('CODPERGUNTA').AsInteger := dataSet.FieldByName('CODPERGUNTA').AsInteger;
          fDataSetMem.FieldByName('CODPERFIL').AsInteger := pCodigoPerfil;
          fDataSetMem.FieldByName('PERGUNTA').AsString := vPergunta.dataSet.FieldByName('PERGUNTA').AsString;
          fDataSetMem.FieldByName('COMPLEMENTO').AsString := vPergunta.dataSet.FieldByName('COMPLEMENTO').AsString;
          fDataSetMem.FieldByName('DESCRICAO').AsString := vPergunta.dataSet.FieldByName('DESCRICAO').AsString;
          fDataSetMem.FieldByName('CATEGORIA').AsString := vPergunta.dataSet.FieldByName('CATEGORIA').AsString;
          fDataSetMem.FieldByName('ORDEM').AsInteger := dataSet.FieldByName('ORDEM').AsInteger;
          fDataSetMem.Post;
        end;

        dataSet.Next;
      end;

      iMax := dataSet.FieldByName('ordem').AsInteger;

      fDataSetMem.IndexFieldNames := 'ORDEM';

    finally
      vPergunta.dataSet.Filtered := False;
      vPergunta.dataSet.Filter := '';
    end;
  end;
end;

{ TFlw_Perfil }

constructor TFlw_Perfil.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsFlwPerfil);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);

  vPerfPerg := TFlw_PerfilPergunta.create;
end;

function TFlw_Perfil.delete: Boolean;
var
  codPerfil: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codPerfil := dataSet.FieldByName('codperfil').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('CRM050', 'EXCLUIR', 'COD PERFIL ' + dataSet.FieldByName('CODPERFIL').AsString, 'FLW_PERFIL',
      dataSet.FieldByName('codperfil').AsString, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    if ExecutaComandosSql('select first 1 codperfil from flw_pesquisa' +
      ' where codperfil = ' + IntToStr(dataSet.FieldByName('codperfil').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('Perfil não pode ser excluído pois está vinculada a uma ou mais Pesquisas',
        'Atenção', 0 + 64);
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from flw_perfil where codperfil = ' + IntToStr(dataSet.FieldByName('codperfil').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM050', 'EXCLUIR', 'SUCESSO', 'FLW_PERFIL', codPerfil, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM050', 'EXCLUIR', 'FALHA', 'FLW_PERFIL', codPerfil, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;


  if not vDadosIni.PesqPros('CRM051', 'EXCLUIR', 'COD PERFIL ' + dataSet.FieldByName('codperfil').AsString, 'FLW_PERFIL',
    dataSet.FieldByName('codperfil').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM051', 'LIXEIRA', 'SUCESSO', 'FLW_PERFIL', codPerfil, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM051', 'LIXEIRA', 'FALHA', 'FLW_PERFIL', codPerfil, buscas);
  end;
  Result := true;
  Refresh;
end;

destructor TFlw_Perfil.Destroy;
begin
  vPerfPerg.Free;
  vPerfPerg := nil;
  inherited;
end;

function TFlw_Perfil.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM047', 'ALTERAR', '', 'FLW_PERFIL', dataSet.FieldByName('CODPERFIL').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    vPerfPerg._selecionaPerfilPergunta(dataSet.FieldByName('codperfil').AsInteger, True);
    Result := True;
  end;
end;

function TFlw_Perfil.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('CRM046', 'INCLUIR', '', 'FLW_PERFIL', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select * from flw_perfil' +
      ' where codperfil = 0 and cod_empresa = 0');

  if inherited insert then
  begin
    Result := True;
    vPerfPerg._selecionaPerfilPergunta(dataSet.FieldByName('codperfil').AsInteger, True);
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  end;
end;

function TFlw_Perfil.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM048', 'SALVAR', '', 'FLW_PERFIL', dataSet.FieldByName('CODPERFIL').AsString, buscas, False) then
    Exit;

  try

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataset.FieldByName('descricao').AsString = '' then
      raiseExceptionCreate('Campo Descrição do Perfil de preenchimento obrigatório', 'DBEdit2');
    if dataset.FieldByName('tipo').AsString = '' then
      raiseexceptioncreate('Campo Tipo de preenchimento obrigatório', 'DBComboBox1');
    if dataSet.State in [dsEdit, dsInsert] then
      dataset.FieldByName('tipo').AsString := UpperCase(copy(dataset.FieldByName('tipo').AsString,1,1));
    if (dataset.FieldByName('tipo').AsString <> 'F') and (dataset.FieldByName('tipo').AsString <> 'P') then
      raiseexceptioncreate('Campo Tipo deve ser preenchido com "F: FlollowUp" ou "P: Pós Atendimento"', 'DBComboBox1');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('CODPERFIL').AsInteger := Gencodigo('FLW_PERFIL', dtmFollowUpPosAtendimento.SpIncCodigo,vDadosIni.codEmpresa);
      vPerfPerg.dataSet.First;
      while not vPerfPerg.dataSet.Eof do
      begin
        vPerfPerg.dataSet.Edit;
        vPerfPerg.dataSet.FieldByName('CODPERFIL').AsInteger := dataSet.FieldByName('CODPERFIL').AsInteger;
        vPerfPerg.dataSet.Post;
        vPerfPerg.dataSet.Next;
      end;
    end;

    Result := inherited Post;
    if dataSet.ChangeCount > 0 then
    begin
      Result := Apply;
      if vPerfPerg.dataSet.ChangeCount > 0 then
        if Result then
          Result := vPerfPerg.Apply;
    end
    else if vPerfPerg.dataSet.ChangeCount > 0 then
      Result := vPerfPerg.Apply
    else
    begin
      Result := False;
      Application.MessageBox('Sem modificações no registro', 'Atenção', 0 + 64);
      Exit;
    end;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM048', acao, 'SUCESSO', 'FLW_PERFIL', dataSet.FieldByName('CODPERFIL').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM048', acao, 'FALHA', 'FLW_PERFIL', dataSet.FieldByName('CODPERFIL').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TFlw_Perfil._abreTodos: Boolean;
begin
  Result := montaSelect('select * from flw_perfil' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

procedure TFlw_Perfil._cadFlwPerfil(pTipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Perfil de Perguntas');
  if dtmFollowUpPosAtendimento = nil then
    dtmFollowUpPosAtendimento := TdtmFollowUpPosAtendimento.Create(dtmFollowUpPosAtendimento);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('CRM044', 'CONSULTA', '', 'FLW_PERFIL', '',
    dtmFollowUpPosAtendimento.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadFlwPerfil = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadFlwPerfil, frmCadFlwPerfil);
  end;
  if (pTipoForm > 0) and (not frmCadFlwPerfil.Enabled) then
  	frmCadFlwPerfil.ShowModal
  else if (not frmCadFlwPerfil.Enabled) then
  	frmCadFlwPerfil.Show
	else if frmCadFlwPerfil.FormStyle = fsMDIChild then
    frmCadFlwPerfil.Show
  else
    frmCadFlwPerfil.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

function TFlw_Perfil._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 codperfil from flw_perfil' +
    ' where codperfil > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TFlw_Perfil._restaurarRegistroDaLixeira: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM043', 'RESTAURAR', 'COD PERFIL ' + dataSet.FieldByName('CODPERFIL').AsString, 'FLW_PERFIL',
    dataSet.FieldByName('CODPERFIL').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM043', 'RESTAURAR', 'SUCESSO', 'FLW_PERFIL', dataSet.FieldByName('CODPERFIL').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM043', 'RESTAURAR', 'FALHA', 'FLW_PERFIL', dataSet.FieldByName('CODPERFIL').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TFlw_Perfil._selecionaPerfil(pCodPerfil: Integer): Boolean;
begin
  Result := montaSelect('select * from flw_perfil' +
    ' where codperfil = ' + IntToStr(pCodPerfil) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TFlw_Perfil._verLixeira: Boolean;
begin
  if not vDadosIni.PesqPros('CRM051', 'VER LIXEIRA', '', 'FLW_PERFIL', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select * from flw_perfil' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 0');
  Result := not dataSet.IsEmpty;
end;

{ TFlw_Atendimentos }

constructor TFlw_Atendimentos.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsAtend);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
  vColab := TFlw_Colaborador.create;
  vAtendHw := TFlw_Atendimentos_HW.create;
end;

function TFlw_Atendimentos.delete: Boolean;
var
  codAtendimento: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codAtendimento := dataSet.FieldByName('codatendimento').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('CRM032', 'EXCLUIR', 'COD ATENDIMENTO ' + dataSet.FieldByName('codatendimento').AsString, 'FLW_ATENDIMENTO',
      dataSet.FieldByName('codatendimento').AsString, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    if ExecutaComandosSql('select first 1 codatendimento from flw_pesquisa' +
      ' where codatendimento = ' + IntToStr(dataSet.FieldByName('codatendimento').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('Atendimento não pode ser excluído pois está vinculado a uma Pesquisa',
        'Atenção', 0 + 64);
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from flw_atendimento where codatendimento = ' + IntToStr(dataSet.FieldByName('codatendimento').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM032', 'EXCLUIR', 'SUCESSO', 'FLW_ATENDIMENTO', codAtendimento, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM032', 'EXCLUIR', 'FALHA', 'FLW_ATENDIMENTO', codAtendimento, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;

  
  if not vDadosIni.PesqPros('CRM031', 'EXCLUIR', 'COD ATENDIMENTO ' + dataSet.FieldByName('codatendimento').AsString, 'FLW_ATENDIMENTO',
    dataSet.FieldByName('codatendimento').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM031', 'LIXEIRA', 'SUCESSO', 'FLW_ATENDIMENTO', codAtendimento, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM031', 'LIXEIRA', 'FALHA', 'FLW_ATENDIMENTO', codAtendimento, buscas);
  end;
  Result := true;
  Refresh;
end;

destructor TFlw_Atendimentos.Destroy;
begin
  vColab.Free;
  vColab := nil;
  vAtendHw.Free;
  vAtendHw := nil;
  inherited;
end;

function TFlw_Atendimentos.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM059', 'ALTERAR', '', 'FLW_ATENDIMENTO', dataSet.FieldByName('codatendimento').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    vColab._abreTodos;
    Result := True;
  end;
end;

function TFlw_Atendimentos.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('CRM058', 'INCLUIR', '', 'FLW_ATENDIMENTO', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select flw_atendimento.*, c.nome_vendedor from flw_atendimento' +
      ' inner join colaborador c on c.cod_vendedor = flw_atendimento.cod_vendedor and c.cod_empresa = flw_atendimento.cod_empresa' +
      ' where flw_atendimento.codatendimento = 0 and flw_atendimento.cod_empresa = 0');

  if inherited insert then
  begin
    Result := True;
    vColab._abreTodos;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('DATA_ATEND').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('cod_vendedor').AsInteger := vDadosIni.vCodUsuario;
  end;
end;

function TFlw_Atendimentos.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM060', 'SALVAR', '', 'FLW_ATENDIMENTO', dataSet.FieldByName('codatendimento').AsString, buscas, False) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('NOME_CLIENTE').AsString) = '' then
      raiseExceptionCreate('Cliente do Atendimento não informado', 'DBEdit2');

    if Trim(dataSet.FieldByName('ATENDIMENTO').AsString) = '' then
      raiseExceptionCreate('Descrição do Atendimento não informada', 'DBMemo1');


    if not vColab._existeColaborador(dataSet.FieldByName('cod_vendedor').AsInteger) then
      raiseExceptionCreate('Colaborador informado não informado', 'DBEdit6');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('codatendimento').AsInteger := Gencodigo('FLW_ATENDIMENTO', dtmFollowUpPosAtendimento.SpIncCodigo,vDadosIni.codEmpresa);
      vDadosIni.vPesquisa := dataSet.FieldByName('codatendimento').AsString;
    end;

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM060', acao, 'SUCESSO', 'FLW_ATENDIMENTO', dataSet.FieldByName('codatendimento').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM060', acao, 'FALHA', 'FLW_ATENDIMENTO', dataSet.FieldByName('codatendimento').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

procedure TFlw_Atendimentos._cadFlwAtendimentos(pTipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Atendimentos para Pesquisa');
  if dtmFollowUpPosAtendimento = nil then
    dtmFollowUpPosAtendimento := TdtmFollowUpPosAtendimento.Create(dtmFollowUpPosAtendimento);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('CRM056', 'CONSULTA', '', 'FLW_ATENDIMENTO', '',
    dtmFollowUpPosAtendimento.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadFlwAtendimentos = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadFlwAtendimentos, frmCadFlwAtendimentos);
  end;
  if (pTipoForm > 0) and (not frmCadFlwAtendimentos.Enabled) then
  	frmCadFlwAtendimentos.ShowModal
  else if (not frmCadFlwAtendimentos.Enabled) then
    frmCadFlwAtendimentos.Show   
  else if frmCadFlwAtendimentos.FormStyle = fsMDIChild then
    frmCadFlwAtendimentos.Show
  else
    frmCadFlwAtendimentos.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

function TFlw_Atendimentos._existeCliente(pAtribuirNome: Boolean = False): Boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select nome_cliente from clientes' +
    ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  Result := not buscas.IsEmpty;

  if pAtribuirNome then
    if dataSet.State in [dsEdit, dsInsert] then
      dataSet.FieldByName('nome_cliente').AsString :=
        Trim(buscas.FieldByName('nome_cliente').AsString);
end;

function TFlw_Atendimentos._importarRegistrosSelecionados: Boolean;
var
  vLista: TStringList;
  vTemp: String;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM076', 'INCLUIR', '', 'FLW_ATENDIMENTO', '', buscas, True) then
    exit;

  try
    vLista := TStringList.Create;

    vAtendHw.dataSet.First;
    while not vAtendHw.dataSet.Eof do
    begin
      if vAtendHw.dataSet.FieldByName('sel').AsString = 'S' then
      begin
        dataSet.Insert;
        dataSet.FieldByName('codatendimento').AsInteger := Gencodigo('FLW_ATENDIMENTO', dtmFollowUpPosAtendimento.SpIncCodigo,vDadosIni.codEmpresa);
        dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
        dataSet.FieldByName('cod_vendedor').AsInteger := vAtendHw.dataSet.FieldByName('cod_usuario').AsInteger;
        dataSet.FieldByName('cod_cliente').AsInteger := vAtendHw.dataSet.FieldByName('cod_cliente').AsInteger;
        dataSet.FieldByName('nome_cliente').AsString := vAtendHw.dataSet.FieldByName('nome_cliente').AsString;
        dataSet.FieldByName('data_atend').AsDateTime := vAtendHw.dataSet.FieldByName('data').AsDateTime;
        dataSet.FieldByName('categoria').AsString := vAtendHw.dataSet.FieldByName('tipo').AsString;

        vLista.Clear;
        if vAtendHw.dataSet.FieldByName('TP_CONTR').AsString = 'S' then
          vLista.Add('Atendimento Sem Contrato');
        vTemp := '';
        if Trim(vAtendHw.dataSet.FieldByName('CONTATO').AsString) <> '' then
          vTemp := 'Contato: ' + Trim(vAtendHw.dataSet.FieldByName('CONTATO').AsString) + ' - ';
        if Trim(vAtendHw.dataSet.FieldByName('FONE').AsString) <> '' then
          vTemp := vTemp + 'Telefone: ' + vAtendHw.dataSet.FieldByName('FONE').AsString + ' - ';
        if Trim(vAtendHw.dataSet.FieldByName('EMAIL').AsString) <> '' then
          vTemp := vTemp + 'E-mail: ' + vAtendHw.dataSet.FieldByName('EMAIL').AsString + ' - ';

        vLista.Add(vTemp);

//        vLista.Add('Contato: ' + vAtendHw.dataSet.FieldByName('CONTATO').AsString + ' - Telefone: ' + vAtendHw.dataSet.FieldByName('FONE').AsString + ' - E-mail: ' + vAtendHw.dataSet.FieldByName('EMAIL').AsString);

        if vAtendHw.dataSet.FieldByName('TP_ATEND').AsString = 'D' then
          vLista.Add('Antendimento Direto' + ' - Data: ' + vAtendHw.dataSet.FieldByName('DATA').AsString + ' - De ' + vAtendHw.dataSet.FieldByName('HORA_INICIAL').AsString + ' as ' + vAtendHw.dataSet.FieldByName('HORA_FINAL').AsString)
        else
          vLista.Add('Antendimento Telefone' + ' - Data: ' + vAtendHw.dataSet.FieldByName('DATA').AsString + ' - De ' + vAtendHw.dataSet.FieldByName('HORA_INICIAL').AsString + ' as ' + vAtendHw.dataSet.FieldByName('HORA_FINAL').AsString);
        if Trim(vAtendHw.dataSet.FieldByName('ASSUNTO').AsString) <> '' then
          vLista.Add(Trim(vAtendHw.dataSet.FieldByName('ASSUNTO').AsString));
        if Trim(vAtendHw.dataSet.FieldByName('OBSERVACAO').AsString) <> '' then
          vLista.Add(Trim(vAtendHw.dataSet.FieldByName('OBSERVACAO').AsString));

        vLista.Text := StringReplace(vLista.Text, '<br>', '', [rfReplaceAll, rfIgnoreCase]);
        vLista.Text := StringReplace(vLista.Text, '<p>', '', [rfReplaceAll, rfIgnoreCase]);
        vLista.Text := StringReplace(vLista.Text, '</p>', '', [rfReplaceAll, rfIgnoreCase]);

        dataSet.FieldByName('atendimento').AsString := vLista.Text;
        dataSet.FieldByName('codatendimentohwauto').AsInteger := vAtendHw.dataSet.FieldByName('CODIGO').AsInteger;
        dataSet.Post;

        vAtendHw._desmarcaLinha;
      end;

      vAtendHw.dataSet.Next;
    end;

    Result := Apply;
    if Result  then
      CommitaTransacao;
  except
    on e: exception do begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar(e.Message), 'Atenção', 64);
    end;
  end;
end;

function TFlw_Atendimentos._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 codatendimento from flw_atendimento' +
    ' where codatendimento > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TFlw_Atendimentos._restaurarRegistroDaLixeira: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM064', 'RESTAURAR', 'COD ATENDIMENTO ' + dataSet.FieldByName('codatendimento').AsString, 'FLW_ATENDIMENTO',
    dataSet.FieldByName('codatendimento').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM064', 'RESTAURAR', 'SUCESSO', 'FLW_ATENDIMENTO', dataSet.FieldByName('codatendimento').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM064', 'RESTAURAR', 'FALHA', 'FLW_ATENDIMENTO', dataSet.FieldByName('codatendimento').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TFlw_Atendimentos._verLixeira: Boolean;
begin
  if not vDadosIni.PesqPros('CRM063', 'VER LIXEIRA', '', 'FLW_ATENDIMENTO', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select flw_atendimento.*, c.nome_vendedor from flw_atendimento' +
    ' inner join colaborador c on c.cod_vendedor = flw_atendimento.cod_vendedor and c.cod_empresa = flw_atendimento.cod_empresa' +
    ' where flw_atendimento.codatendimento > 0 and flw_atendimento.cod_empresa = ' + vDadosIni.codEmpresa + ' and flw_atendimento.ativo = 0');
  Result := not dataSet.IsEmpty;
end;

{ TFlw_Colaborador }

function TFlw_Colaborador._abreTodos(pUnion: Boolean = False): Boolean;
begin
  if pUnion then
    Result := montaSelect('select cod_vendedor, nome_vendedor from colaborador' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1' +
      ' union'+
      ' select 0, ''TODOS'' from rdb$database')
  else
    Result := montaSelect('select cod_vendedor, nome_vendedor from colaborador' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TFlw_Colaborador._existeColaborador(pCodigo: Integer): Boolean;
begin
  Result := ExecutaComandosSql('select cod_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(pCodigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

constructor TFlw_Colaborador.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsColab);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
end;

{ TFlw_RespostaComplemento }

constructor TFlw_RespostaComplemento.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsRespCompl);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
  vLista := TStringList.Create;
end;

function TFlw_RespostaComplemento.post: boolean;
begin
  try
    if dataSet.State = dsInsert then
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;

    Result := inherited post;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_RespostaComplemento.post. Erro:' + e.Message);
      Application.MessageBox(pchar('Erro ao salvar complemento da resposta. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_RespostaComplemento._apagaRespCompl(pCodigoPesquisa,
  pCodigoPergunta, pRespostaCompl: Integer): Boolean;
begin
  try
    result := true;
    _selecionaRespCompl(pCodigoPesquisa, pCodigoPergunta, pRespostaCompl);
    if not IsEmpty then
      dataSet.Delete;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_RespostaComplemento._apagaRespCompl. Erro:' + e.Message);
      Application.MessageBox(pchar('Erro ao remover complemento da resposta. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_RespostaComplemento._incluirRespCompl(pCodigoPesquisa,
  pCodigoPergunta: Integer; ckList: TCheckListBox): Boolean;
var
  i: Integer;
begin
  try
    result := true;
    for I := 0 to vlista.Count - 1 do
    begin
      if ckList.Checked[i] then
        _incluirRespCompl(pCodigoPesquisa, pCodigoPergunta, StrToInt(vLista.Strings[i]))
      else
        _apagaRespCompl(pCodigoPesquisa, pCodigoPergunta, StrToInt(vLista.Strings[i]))
    end;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_RespostaComplemento._incluirRespCompl2. Erro:' + e.Message);
      Application.MessageBox(pchar('Erro ao salvar complemento da resposta. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_RespostaComplemento._incluirRespCompl(pCodigoPesquisa,
  pCodigoPergunta, pRespostaCompl: Integer): Boolean;
begin
  try
    result := true;
    _selecionaRespCompl(pCodigoPesquisa, pCodigoPergunta, pRespostaCompl);
    if IsEmpty then
      insert
    else
      edit;
    dataSet.FieldByName('codpergunta').AsInteger := pCodigoPergunta;
    dataSet.FieldByName('codpesquisa').AsInteger := pCodigoPesquisa;
    dataSet.FieldByName('nivelrespcompl').AsInteger := pRespostaCompl;

    Result := Post;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_RespostaComplemento._incluirRespCompl1. Erro:' + e.Message);
      Application.MessageBox(pchar('Erro ao salvar complemento da resposta. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_RespostaComplemento._novo(pCodigoPesquisa,
  pCodigoPergunta: Integer): Boolean;
begin
  try
    result := true;
    if inherited Insert then
    begin
      dataSet.FieldByName('codpergunta').AsInteger := pCodigoPergunta;
      dataSet.FieldByName('codpesquisa').AsInteger := pCodigoPesquisa;
    end
    else
      raise exception.create('Não foi possivel colocar a tabela em inserção');
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_RespostaComplemento._novo. Erro:' + e.Message);
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_RespostaComplemento._selecionaRespCompl(
  pCodigoPesquisa: Integer): Boolean;
begin
  Result := montaSelect('select * from flw_respostacomplemento where codpesquisa = ' + IntToStr(pcodigoPesquisa) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TFlw_RespostaComplemento._selecionaRespCompl(pCodigoPesquisa,
  pCodigoPergunta, pNivel: Integer): Boolean;
begin
  dataSet.Filter := 'codpergunta = ' + IntToStr(pcodigoPergunta) +
    ' and codpesquisa = ' + IntToStr(pcodigoPesquisa) + ' and nivelrespcompl = ' + IntToStr(pnivel);
  dataSet.Filtered := True;
//  Result := montaSelect('select * from flw_respostacomplemento where codpergunta = ' + IntToStr(pcodigoPergunta) +
//    ' and codpesquisa = ' + IntToStr(pcodigoPesquisa) + ' and nivelrespcompl = ' + IntToStr(pnivel) +
//    ' and cod_empresa = ' + vDadosIni.codEmpresa)
end;

procedure TFlw_RespostaComplemento._setCodPesquisa(pCodPesquisa: Integer);
begin
  dataSet.Filtered := False;
  dataSet.First;
  while not dataSet.Eof do
  begin
    dataSet.Edit;
    dataSet.FieldByName('codpesquisa').AsInteger := pCodPesquisa;
    dataSet.Post;
    dataSet.Next;
  end;
end;

function TFlw_RespostaComplemento._selecionaRespCompl(pCodigoPesquisa,
  pCodigoPergunta: Integer): Boolean;
begin
  dataSet.Filter := 'codpergunta = ' + IntToStr(pcodigoPergunta) +
    ' and codpesquisa = ' + IntToStr(pcodigoPesquisa);
  dataSet.Filtered := True;
//  Result := montaSelect('select * from flw_respostacomplemento where codpergunta = ' + IntToStr(pcodigoPergunta) +
//    ' and codpesquisa = ' + IntToStr(pcodigoPesquisa) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

{ TFlw_Resposta }

constructor TFlw_Resposta.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsResposta);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
  vRespCompl := TFlw_RespostaComplemento.create;
end;

destructor TFlw_Resposta.destroy;
begin
  vRespCompl.Free;
  vRespCompl := nil;
  inherited;
end;

function TFlw_Resposta.post: boolean;
begin
  try
    if dataSet.FieldByName('nivelresposta').AsInteger < 0 then
      raise exception.create('Pergunta não respondida');

    if dataSet.State = dsInsert then
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;

    Result := inherited post;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_Resposta.post. Erro:' + e.Message);
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_Resposta._excluirResposta(pCodigoPesquisa,
  pCodigoPergunta: Integer): Boolean;
begin
  try
    result := False;
    vRespCompl._selecionaRespCompl(pCodigoPesquisa, pCodigoPergunta);

    while not vRespCompl.dataSet.IsEmpty do
      vRespCompl.dataSet.Delete;

    _selecionaResposta(pCodigoPesquisa, pCodigoPergunta);

    while not dataSet.IsEmpty do
      dataSet.Delete;

    Result := True;
  except
    on e: exception do
    begin
      result := false;
      registraErro('function TFlw_Resposta._excluirResposta. Erro:' + e.Message);
      Application.MessageBox(pchar('Erro ao limpar resposta. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_Resposta._existeResposta(pCodigoPesquisa,
  pCodigoPergunta: Integer): Boolean;
begin
  Result := ExecutaComandosSql('select first 1 cod_empresa from flw_resposta where codpesquisa = ' + IntToStr(pCodigoPesquisa) +
    ' and codpergunta = ' + IntToStr(pCodigoPergunta) + ' and codempresa  = ' + vDadosIni.codEmpresa);
end;

function TFlw_Resposta._incluirResposta(pCodigoPesquisa, pCodigoPergunta,
  pNivelResposta: Integer; pComentario: string): Boolean;
begin
  try
    result := False;
    _selecionaResposta(pCodigoPesquisa, pCodigoPergunta);

    if not dataSet.IsEmpty then //_existeResposta(pCodigoPesquisa, pCodigoPergunta) then
      Edit
    else
      Insert;
    dataSet.FieldByName('codpesquisa').AsInteger := pCodigoPesquisa;
    dataSet.FieldByName('codpergunta').AsInteger := pCodigoPergunta;
    dataSet.FieldByName('comentario').AsString := pComentario;
    dataSet.FieldByName('nivelresposta').AsInteger := pNivelResposta;
    Result := Post;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_Resposta._incluirResposta. Erro:' + e.Message);
      Application.MessageBox(pchar('Erro ao incluir resposta. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_Resposta._selecionaResposta(pCodigoPesquisa,
  pCodigoPergunta: Integer): Boolean;
begin
  if not dataSet.Active then
    Exit;
  
//  dataSet.Filtered := False;
  dataSet.Filter := ' codpesquisa = ' + IntToStr(pCodigoPesquisa) + ' and codpergunta = ' + IntToStr(pCodigoPergunta) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  dataSet.Filtered := True;
//  Result := montaSelect('select * from resposta where codpesquisa = ' + IntToStr(pCodigoPesquisa) +
//    ' and codpergunta = ' + IntToStr(pCodigoPergunta) + ' and codempresa = ' + vDadosIni.codEmpresa);
end;

procedure TFlw_Resposta._setCodPesquisa(pCodPesquisa: Integer);
begin
  dataSet.Filtered := False;
  dataSet.First;
  while not dataSet.Eof do
  begin
    dataSet.Edit;
    dataSet.FieldByName('codpesquisa').AsInteger := pCodPesquisa;
    dataSet.Post;
    dataSet.Next;
  end;
  vRespCompl._setCodPesquisa(pCodPesquisa);
end;

function TFlw_Resposta._selecionaResposta(pCodigoPesquisa: Integer): Boolean;
begin
  Result := montaSelect('select * from flw_resposta where codpesquisa = ' + IntToStr(pCodigoPesquisa) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa) ;
end;

{ TFlw_Pesquisa }

constructor TFlw_Pesquisa.create;
begin
  if dtmFollowUpPosAtendimento = nil then
    dtmFollowUpPosAtendimento := TdtmFollowUpPosAtendimento.Create(dtmFollowUpPosAtendimento);

  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPesquisaCons);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
//  vOsFlw := TOsFollowUp.create;
//  vPosA := TPosAtendimento.create;

  vResposta := TFlw_Resposta.create;

  vPergunta := TFlw_Pergunta.create;
  vPergunta.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPergPesq);
  vPergunta.vGrupo.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsGrupoPesq);
  vPergunta.vComplemento.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPergComplPesq);

  vCliente := TFlw_Cliente.create;
  vColab := TFlw_Colaborador.create;
  vColab.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsColab);
  vPerfil := TFlw_Perfil.create;
  vPerfil.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPerfPesq);

  vImpPesq:= TFlw_ImportarPesquisa.create;
  vCodClienteIn:='';
end;

constructor TFlw_Pesquisa.createPesquisa;
begin
  create;
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPesquisa);  
end;

function TFlw_Pesquisa.delete: Boolean;
var
  codPesquisa: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codPesquisa := dataSet.FieldByName('codpesquisa').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('CRM073', 'EXCLUIR', 'COD PESQUISA ' + dataSet.FieldByName('codpesquisa').AsString, 'FLW_PESQUISA',
      dataSet.FieldByName('codpesquisa').AsString, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'delete from flw_pesquisa where codpesquisa = ' + IntToStr(dataSet.FieldByName('codpesquisa').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM073', 'EXCLUIR', 'SUCESSO', 'FLW_PESQUISA', codPesquisa, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM073', 'EXCLUIR', 'FALHA', 'FLW_PESQUISA', codPesquisa, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;

  
  if not vDadosIni.PesqPros('CRM072', 'EXCLUIR', 'COD PESQUISA ' + dataSet.FieldByName('codpesquisa').AsString, 'FLW_PESQUISA',
    dataSet.FieldByName('codpesquisa').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM072', 'LIXEIRA', 'SUCESSO', 'FLW_PESQUISA', codPesquisa, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM072', 'LIXEIRA', 'FALHA', 'FLW_PESQUISA', codPesquisa, buscas);
  end;
  Result := true;
  Refresh;
end;

destructor TFlw_Pesquisa.destroy;
begin
  vResposta.Free;
  vPergunta.Free;
  vCliente.Free;
  vColab.Free;
  vResposta := nil;
  vPergunta := nil;
  vCliente := nil;
  vColab := nil;
  inherited;
end;

function TFlw_Pesquisa.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

//  if not vDadosIni.PesqPros('CRM029', 'ALTERAR', '', 'FLW_GRUPO', dataSet.FieldByName('CODGRUPO').AsString, buscas, False) then
//    Exit;

  if inherited edit then
  begin
    Result := True;
    vResposta._selecionaResposta(dataSet.FieldByName('codpesquisa').AsInteger);
    vResposta.vRespCompl._selecionaRespCompl(dataSet.FieldByName('codpesquisa').AsInteger);
    vCliente._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger);
    vColab._abreTodos;
    if dataSet.FieldByName('codperfil').AsInteger > 0 then
      vPerfil._selecionaPerfil(dataSet.FieldByName('codperfil').AsInteger)
    else
      vPerfil._abreTodos;
  end;
end;

function TFlw_Pesquisa.insert: Boolean;
begin
  Result := False;
//  if not vDadosIni.PesqPros('CRM028', 'INCLUIR', '', 'FLW_GRUPO', '', buscas, False) then
//    Exit;

  if not dataSet.Active then
    montaSelect('select * from flw_pesquisa' +
      ' where codpesquisa = 0 and cod_empresa = 0');

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('datapesquisa').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('horapesquisa').AsString := FormatDateTime('HH:MM:SS',vDadosIni.getDataHoraBanco(buscas));
    vResposta._selecionaResposta(dataSet.FieldByName('codpesquisa').AsInteger);
    vResposta.vRespCompl._selecionaRespCompl(dataSet.FieldByName('codpesquisa').AsInteger);
    vCliente._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger);
    vColab._abreTodos;
    vPerfil._abreTodos;
  end;
end;

function TFlw_Pesquisa.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM071', 'SALVAR', '', 'FLW_PESQUISA', dataSet.FieldByName('CODPESQUISA').AsString, buscas, False) then
    Exit;

  try

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataSet.FieldByName('datapesquisa').AsString = '' then
      raise exception.Create('Data da pesquisa não informada');

    if dataSet.FieldByName('horapesquisa').AsString = '' then
      raise exception.Create('Hora da pesquisa não informada');

    if dataSet.FieldByName('codperfil').AsFloat <= 0 then
      raise exception.Create('Perfil de perguntas não selecionado');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('codpesquisa').AsInteger := GenCodigo('FLW_PESQUISA', dtmFollowUpPosAtendimento.SpIncCodigo, vDadosIni.codEmpresa);
      vResposta._setCodPesquisa(dataSet.FieldByName('codpesquisa').AsInteger);
    end;

    Result := inherited Post;

    if dataSet.ChangeCount > 0 then
      Result := Apply
    else
      Result := True;

    if Result then
      if vResposta.dataSet.ChangeCount > 0 then
        Result := vResposta.Apply;

    if Result then
      if vResposta.vRespCompl.dataSet.ChangeCount > 0 then
        Result := vResposta.vRespCompl.Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM071', acao, 'SUCESSO', 'FLW_PESQUISA', dataSet.FieldByName('CODPESQUISA').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM071', acao, 'FALHA', 'FLW_PESQUISA', dataSet.FieldByName('CODPESQUISA').AsString, buscas);
    end;

  except
    on e: exception do
    begin
      result := false;
      registraErro('function TFlw_Pesquisa.post. Erro:' + e.Message);
      Application.MessageBox(pchar('Erro ao salvar Pesquisa. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TFlw_Pesquisa._cadPesquisa(pTipoForm: Integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Atendimentos para Pesquisa');
  if dtmFollowUpPosAtendimento = nil then
    dtmFollowUpPosAtendimento := TdtmFollowUpPosAtendimento.Create(dtmFollowUpPosAtendimento);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('CRM067', 'CONSULTA', '', 'FLW_PESQUISA', '',
    dtmFollowUpPosAtendimento.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadFlwPesquisa = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadFlwPesquisa, frmCadFlwPesquisa);
  end;
  if (pTipoForm > 0) and (not frmCadFlwPesquisa.Enabled) then
  	frmCadFlwPesquisa.ShowModal
  else if (not frmCadFlwPesquisa.Enabled) then
  	frmCadFlwPesquisa.Show
  else if frmCadFlwPesquisa.FormStyle = fsMDIChild then
    frmCadFlwPesquisa.Show
  else
    frmCadFlwPesquisa.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

function TFlw_Pesquisa._existePerfil(pCodPerfil: Integer): Boolean;
begin
  Result := ExecutaComandosSql('Select first 1 codperfil from flw_perfil' +
    ' where codperfil = ' + IntToStr(pCodPerfil) +
    ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TFlw_Pesquisa._exportarParaExcel: Boolean;
var
  objExcel, Sheet, Chart, ColumnRange, s: Variant;
  vSheets, vCodPerfil, vCol, vLinha: Integer;
  vlista : TStringList;
  vTmpTexto, vIndiceTmp : string;
begin

  objExcel := CreateOleObject('Excel.Application');
  objExcel.Visible := True;
  objExcel.Caption := 'Pesquisa';
  objExcel.Workbooks.add;
  vSheets := 0;
  vCodPerfil := 0;
  vlista:= TStringList.Create;

  try

    dataSet.Filter := 'CODPERFIL > 0';
    dataSet.Filtered := True;

    vIndiceTmp := DataSet.IndexName;
//    DataSet.IndexDefs.Clear;
//    DataSet.IndexDefs.Add( 'CODPERFIL;NOME_CLIENTE;DATAPESQUISA', 'CODPERFIL;NOME_CLIENTE;DATAPESQUISA', []);
//    try
//      DataSet.IndexName := 'CODPERFIL;NOME_CLIENTE;DATAPESQUISA';
//    except
//    end;
    DataSet.IndexFieldNames := 'CODPERFIL;NOME_CLIENTE;DATAPESQUISA';

    dataSet.First;
    while not dataSet.Eof do
    begin
      if vCodPerfil <> dataSet.FieldByName('codperfil').AsInteger then
      begin
        vCodPerfil := dataSet.FieldByName('codperfil').AsInteger;
        vPerfil._selecionaPerfil(vCodPerfil);
        vPergunta._selecionaPergunta(vCodPerfil);
        Inc(vSheets);
        if vSheets >= 4 then
          objExcel.Workbooks[1].Worksheets.Add( , Sheet, 1, );


        ColumnRange := objExcel.Workbooks[1].WorkSheets[vSheets].Columns;
        ColumnRange.Columns[1].ColumnWidth := 12;
        ColumnRange.Columns[2].ColumnWidth := 6;
        ColumnRange.Columns[3].ColumnWidth := 30;
        ColumnRange.Columns[4].ColumnWidth := 20;
        ColumnRange.Columns[5].ColumnWidth := 20;

        Sheet:=objExcel.Workbooks[1].sheets[vSheets];
        Sheet.cells[1,1] :='Perfil: ' + vPerfil.dataSet.FieldByName('descricao').AsString;
        Sheet.cells[1,1].HorizontalAlignment := 1;
        Sheet.cells[2,1] := 'Data';
        Sheet.cells[2,2] := 'Hora';
        Sheet.cells[2,3] := 'Cliente';
        Sheet.cells[2,4] := 'Contato';
        Sheet.cells[2,5] := 'Colaborador';
        vCol := 5;
        vLinha := 2;

        vPergunta.dataSet.First;
        while not vPergunta.dataSet.Eof do
        begin
          Inc(vCol);
          Sheet.cells[vLinha, vCol] :=  vPergunta.dataSet.FieldByName('pergunta').AsString;
          if copy(vPergunta.dataSet.FieldByName('simnaonivel').AsString, 1, 1) = 'S' then
            ColumnRange.Columns[vCol].ColumnWidth := 12
          else
            ColumnRange.Columns[vCol].ColumnWidth := 27;
          if Trim(vPergunta.dataSet.FieldByName('complemento').AsString) <> '' then
          begin
            Inc(vCol);
            Sheet.cells[vLinha, vCol] :=  vPergunta.dataSet.FieldByName('complemento').AsString;
            ColumnRange.Columns[vCol].ColumnWidth := 27;
          end;
          Inc(vCol);
          Sheet.cells[vLinha, vCol] :=  'Observações, Críticas, Sugestôes, Elogios:';
          ColumnRange.Columns[vCol].ColumnWidth := 27;
          vPergunta.dataSet.Next;
        end;

        Sheet.range['A1:' + const_Alfabeto[vCol] + '1'].merge;
        Sheet.range['A1:' + const_Alfabeto[vCol] + '2' ].Font.Bold := True;
        Sheet.range['A1:' + const_Alfabeto[vCol] + '1'].Interior.Color := ColorToRGB($0075BAFF);
        Sheet.range['A2:' + const_Alfabeto[vCol] + '2'].Interior.Color := ColorToRGB($0099FFFF);

        ColumnRange.Columns[vCol].ColumnWidth := 27;

      end;

      //Respostas
      vResposta._selecionaResposta(dataSet.FieldByName('codpesquisa').AsInteger);
      vResposta.vRespCompl._selecionaRespCompl(dataSet.FieldByName('codpesquisa').AsInteger);

      Inc(vLinha);
      Sheet.cells[vLinha, 1] := EncodeDate(YearOf(dataSet.FieldByName('DATAPESQUISA').AsDateTime),
        MonthOf(dataSet.FieldByName('DATAPESQUISA').AsDateTime),
        DayOf(dataSet.FieldByName('DATAPESQUISA').AsDateTime));
      Sheet.cells[vLinha, 2] := dataSet.FieldByName('HORAPESQUISA').AsString;
      Sheet.cells[vLinha, 3] := dataSet.FieldByName('NOME_CLIENTE').AsString;
      Sheet.cells[vLinha, 4] := dataSet.FieldByName('CONTATO').AsString;
      Sheet.cells[vLinha, 5] := dataSet.FieldByName('NOME_VENDEDOR').AsString;

      Sheet.range['C1:' + const_Alfabeto[vCol] + IntToStr(vLinha)].NumberFormat := '@';

      vCol := 5;

      vPergunta.dataSet.First;
      while not vPergunta.dataSet.Eof do
      begin
        Inc(vCol);

        vResposta._selecionaResposta(dataSet.FieldByName('codpesquisa').AsInteger, vPergunta.dataSet.FieldByName('codpergunta').AsInteger);
        if copy(vPergunta.dataSet.FieldByName('simnaonivel').AsString, 1, 1) = 'S' then
          Sheet.cells[vLinha, vCol] :=  const_Resposta[vResposta.dataSet.FieldByName('nivelresposta').AsInteger + 1]
        else if copy(vPergunta.dataSet.FieldByName('simnaonivel').AsString, 1, 1) = 'N' then
          Sheet.cells[vLinha, vCol] :=  const_Satisfacao[vResposta.dataSet.FieldByName('nivelresposta').AsInteger]
        else
          Sheet.cells[vLinha, vCol] :=  const_Satisfacao2[vResposta.dataSet.FieldByName('nivelresposta').AsInteger];

        vlista.Clear;
        vTmpTexto:= '';
        if Trim(vPergunta.dataSet.FieldByName('complemento').AsString) <> '' then
        begin
          Inc(vCol);

          vResposta.vRespCompl._selecionaRespCompl(dataSet.FieldByName('codpesquisa').AsInteger, vPergunta.dataSet.FieldByName('codpergunta').AsInteger);
          vResposta.vRespCompl.dataSet.First;
          while not vResposta.vRespCompl.dataSet.Eof do
          begin
            vPergunta.vComplemento._selecionaPergComp(vPergunta.dataSet.FieldByName('codpergunta').AsInteger,
              vResposta.vRespCompl.dataSet.FieldByName('nivelrespcompl').AsInteger);
            vlista.Add(vPergunta.vComplemento.dataSet.FieldByName('alternativa').AsString);
            vTmpTexto := vTmpTexto + vPergunta.vComplemento.dataSet.FieldByName('alternativa').AsString + '; ';

            vResposta.vRespCompl.dataSet.Next;
          end;
          Sheet.cells[vLinha, vCol] := vTmpTexto;// vlista.Text;
        end;

        Inc(vCol);
        Sheet.cells[vLinha, vCol] :=  vResposta.dataSet.FieldByName('comentario').AsString;
        vPergunta.dataSet.Next;
      end;

      Sheet.range['A1:' + const_Alfabeto[vCol] + IntToStr(vLinha)].WrapText := True;
      Sheet.range['A2:' + const_Alfabeto[vCol] + IntToStr(vLinha)].HorizontalAlignment := 1;
      Sheet.range['A2:' + const_Alfabeto[vCol] + IntToStr(vLinha)].VerticalAlignment := -4108;
      Sheet.range['A1:B' +IntToStr(vLinha)].HorizontalAlignment := 1;

      Sheet.range['A3:E' + IntToStr(vLinha)].Interior.Color := ColorToRGB($00FFEDB9);//$00DCFFB9);//$00DFFFFF);
      Sheet.range['A1:' + const_Alfabeto[vCol] + IntToStr(vLinha)].Borders.Weight := 2;
      Sheet.range['A1:' + const_Alfabeto[vCol] + IntToStr(vLinha)].Borders.Color := clblack;

      Sheet.Activate;
      Sheet.Name := vPerfil.dataSet.FieldByName('codperfil').AsString + '-' + vPerfil.dataSet.FieldByName('descricao').AsString;
      objExcel.ActiveWindow.SplitColumn := 5;
      objExcel.ActiveWindow.SplitRow := 2;
      objExcel.ActiveWindow.FreezePanes := True;

      dataSet.Next;
    end;


    objExcel.visible := True;

  finally     
    dataSet.Filter := '';
    dataSet.Filtered := False;
    DataSet.IndexName := vIndiceTmp;
  end;
end;

procedure TFlw_Pesquisa._cadPesquisa(pTipoForm: Integer; pCodCliente:integer);
begin
  try
    vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Atendimentos para Pesquisa');
    if dtmFollowUpPosAtendimento = nil then
      dtmFollowUpPosAtendimento := TdtmFollowUpPosAtendimento.Create(dtmFollowUpPosAtendimento);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('CRM067', 'CONSULTA', '', 'FLW_PESQUISA', '',
      dtmFollowUpPosAtendimento.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadFlwPesquisa = nil then
    begin
      if pTipoForm > 0 then
      begin
        vDadosIni.vModalOuChild := 'M';
        vDadosIni.vPesquisa:= inttostr(pCodCliente);
      end;

      Application.CreateForm(TfrmCadFlwPesquisa, frmCadFlwPesquisa);
    end;
    if (pTipoForm > 0) and (not frmCadFlwPesquisa.Enabled) then
    	frmCadFlwPesquisa.ShowModal
    else if (not frmCadFlwPesquisa.Enabled) then
    	frmCadFlwPesquisa.Show
    else if frmCadFlwPesquisa.FormStyle = fsMDIChild then
      frmCadFlwPesquisa.Show
    else
      frmCadFlwPesquisa.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TFlw_Pesquisa._concluirPesquisa: Boolean;
begin
  try
    result := true;

    if _pesquisaConcluida then
      raiseExceptionCreate('Pesquisa já esta concluída', '');

    if not _pesquisaEmAndamento then
      raiseExceptionCreate('Pesquisa ainda não iniciada', '');

    if not (dataSet.State = dsEdit) then
      Edit;

    dataSet.FieldByName('dataFechamento').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('horaFechamento').AsString := FormatDateTime('HH:MM:SS',vDadosIni.getDataHoraBanco(buscas));
    dataSet.FieldByName('STATUS').AsString := 'CONCLUIDA';

    Result := Post;

  except
    on e: exception do
    begin
      result := false;
      registraErro('function TFlw_Pesquisa._fecharPesquisa. Erro:' + e.Message);
      Application.MessageBox(pchar('Erro ao concluir Pesquisa. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_Pesquisa._getInformacaoClienteAtendimento: string;
var
  vListaTmp: TStringList;
  vCont: Integer;
  vNomeColab: string;
begin
  if flwPesquisaE.dataSet.FieldByName('tipo').AsString = 'F' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select placa, aparelho_ped, OBS_LIVRO_REG, OBS_OS,' +
      ' ACESSORIOS, ESTADO_VEIC, DEFEITO from pedvenda' +
      ' where nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and tipo = ' + QuotedStr(dataSet.FieldByName('tipo_ped').AsString) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    vListaTmp:= TStringList.Create;
    vListaTmp.Clear;

    if Trim(buscas.FieldByName('OBS_LIVRO_REG').AsString) <> '' then
    begin
      vListaTmp.Add('Obs.: Livro Registro: ' + Trim(buscas.FieldByName('OBS_LIVRO_REG').AsString));
      vListaTmp.Add('');
    end;
    if Trim(buscas.FieldByName('OBS_OS').AsString) <> '' then
    begin
      vListaTmp.Add('Observações: ' + Trim(buscas.FieldByName('OBS_OS').AsString));
      vListaTmp.Add('');
    end;
    if Trim(buscas.FieldByName('DEFEITO').AsString) <> '' then
    begin
      vListaTmp.Add('Defeito: ' + Trim(buscas.FieldByName('DEFEITO').AsString));
      vListaTmp.Add('');
    end;
    if Trim(buscas.FieldByName('ACESSORIOS').AsString) <> '' then
    begin
      vListaTmp.Add('Acessórios:: ' + Trim(buscas.FieldByName('ACESSORIOS').AsString));
      vListaTmp.Add('');
    end;
    if Trim(buscas.FieldByName('ESTADO_VEIC').AsString) <> '' then
    begin
      if vDadosIni.vEmp.vUsarAparelho = 'S' then
        vListaTmp.Add('Estado do Objeto: ' + Trim(buscas.FieldByName('ESTADO_VEIC').AsString))
      else
        vListaTmp.Add('Estado do Veículo: ' + Trim(buscas.FieldByName('ESTADO_VEIC').AsString));
      vListaTmp.Add('');
    end;

    if vDadosIni.vEmp.vUsarAparelho = 'S' then
      Result := Trim(buscas.FieldByName('aparelho_ped').AsString)
    else
      Result := Trim(buscas.FieldByName('placa').AsString);

    buscas.Close;
    buscas.SQL.Text := 'select 0 id, ps.nitem nitem,  ps.desc_serv_ped descricao, ps.quant_serv_ped quantidade, ps.status,' +
      ' (select nome_vendedor from colaborador c1 where c1.cod_vendedor = ps.cod_vendedor and c1.cod_empresa = ps.cod_empresa) nome_vendedor1,' +
      ' (select nome_vendedor from colaborador c2 where c2.cod_vendedor = ps.cod_vendedor1 and c2.cod_empresa = ps.cod_empresa) nome_vendedor2' +
      ' from pedvenda_serv ps ' +
      ' where ps.nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and ps.tipo = ' + QuotedStr(dataSet.FieldByName('tipo_ped').AsString) + ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union' +
      ' select 1, 0,  pt.descr_servt, 1, '''',' +
      ' ''TERCEIROS'' nome_vendedor1,' +
      ' ''TERCEIROS'' nome_vendedor2' +
      ' from pedvenda_serv_terc pt' +
      ' where pt.nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and pt.tipo = ' + QuotedStr(dataSet.FieldByName('tipo_ped').AsString) +
      ' and pt.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union' +
      ' select 2, pp.nitem,  pp.descr_prod_ped, pp.quant_ped_item, pp.status,' +
      ' (select nome_vendedor from colaborador c1 where c1.cod_vendedor = pp.cod_vendedor and c1.cod_empresa = pp.cod_empresa) nome_vendedor1,' +
      ' (select nome_vendedor from colaborador c2 where c2.cod_vendedor = pp.col_cod_vendedor and c2.cod_empresa = pp.cod_empresa) nome_vendedor2' +
      ' from pedvenda_prod pp' +
      ' where pp.nped = ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and pp.tipo = ' + QuotedStr(dataSet.FieldByName('tipo_ped').AsString) + ' and pp.cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by 1,2';
    buscas.Open;
    vCont := 1;

    buscas.First;
    while not buscas.Eof do
    begin

      vNomeColab := Trim(buscas.FieldByName('nome_vendedor1').AsString);
      if Trim(buscas.FieldByName('nome_vendedor1').AsString) <> Trim(buscas.FieldByName('nome_vendedor2').AsString) then
        vNomeColab := vNomeColab + ' \ ' + Trim(buscas.FieldByName('nome_vendedor2').AsString);

      if buscas.FieldByName('id').AsString = '0' then
        vListaTmp.Add('Serviço: ' + Trim(buscas.FieldByName('descricao').AsString) + ' Qtde: '  +
          Format('%0.3f', [buscas.FieldByName('quantidade').AsFloat]) + ' - ' + vNomeColab + ' - ' + buscas.FieldByName('status').AsString)
      else if buscas.FieldByName('id').AsString = '1' then
        vListaTmp.Add('Serv Terc: ' + Trim(buscas.FieldByName('descricao').AsString) + ' Qtde: '  +
          Format('%0.3f', [buscas.FieldByName('quantidade').AsFloat]) + ' - ' + vNomeColab + ' - ' + buscas.FieldByName('status').AsString)
      else if buscas.FieldByName('id').AsString = '2' then
        vListaTmp.Add('Produto: ' + Trim(buscas.FieldByName('descricao').AsString) + ' Qtde: '  +
          Format('%0.3f', [buscas.FieldByName('quantidade').AsFloat]) + ' - ' + vNomeColab + ' - ' + buscas.FieldByName('status').AsString);

      Inc(vCont);
      buscas.Next;
    end;

    Result := Result +  #13 + vListaTmp.Text;
  end
  else
  begin
    if Trim(dataSet.FieldByName('tipo_ped').AsString) = 'HW' then
    begin
      buscas.Close;
      buscas.SQL.Text :=
          'select ''HW'' tipo, fa.data, ''Atendimento'' categoria,' +
        ' case when fa.TP_CONTR = ''S'' then ''Atendimento sem contrato'' || ascii_char(13) else '''' end ||' +
        ' case when coalesce(fa.contato, '''') <> '''' then ''Contato: '' || fa.contato || ascii_char(13) else '' '' end  ||' +
        ' case when coalesce(fa.fone, '''') <> '''' then ''Telefone: '' || fa.fone || ascii_char(13) else '''' end ||' +
        ' case when coalesce(fa.email, '''') <> '''' then ''email: '' || fa.email || ascii_char(13) else '''' end ||' +
        ' case when fa.TP_ATEND = ''D'' then ''Antendimento Direto'' else ''Antendimento Telefone'' end ||' +
        ' '' - Data: '' ||' +
        ' extract ( day from fa.data) || ''/'' || extract ( month from fa.data) || ''/'' || extract ( year from fa.data) ||' +
        ' '' de '' || rtrim(fa.hora_inicial) || '' as '' || rtrim(fa.hora_final) || ascii_char(13) ||' +
        ' case when coalesce(fa.assunto, '''') <> '''' then fa.assunto || ascii_char(13) else '''' end ||' +
        ' case when coalesce(fa.observacao, '''') <> '''' then fa.observacao || ascii_char(13) else '''' end atendimento' +
        ' from anotacoes fa' +
        ' where codigo = ' + IntToStr(dataSet.FieldByName('codatendimento').AsInteger) +
          ' and cod_empresa =  ' + vDadosIni.codEmpresa;
      buscas.Open;

      Result := 'Tipo Atendimento: ' + trim(buscas.FieldByName('categoria').AsString) +
        ' - Data: ' + buscas.FieldByName('data').AsString + #13 + #13 +
        buscas.FieldByName('atendimento').AsString;  
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'select categoria, data_atend, atendimento from flw_atendimento' +
        ' where codatendimento =  ' + IntToStr(dataSet.FieldByName('codatendimento').AsInteger) +
        ' and cod_empresa =  ' + vDadosIni.codEmpresa;
      buscas.Open;

      Result := 'Tipo Atendimento: ' + trim(buscas.FieldByName('categoria').AsString) +
        ' - Data: ' + buscas.FieldByName('data_atend').AsString + #13 + #13 +
        buscas.FieldByName('atendimento').AsString;
    end;
  end;

  if dataSet.State in [dsInsert, dsEdit] then
    dataSet.FieldByName('dados').AsString := Result;

  vCliente._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger);
  
end;

function TFlw_Pesquisa._importarRegistrosSelecionados: Boolean;
begin

  if not vDadosIni.PesqPros('CRM069', 'INCLUIR', '', 'FLW_PESQUISA', '', buscas, True) then
    exit;

  try

  vImpPesq.dataSet.First;
  while not vImpPesq.dataSet.Eof do
  begin
    if vImpPesq.dataSet.FieldByName('sel').AsString = 'S' then
    begin
      if flwPesquisaE = nil then
        flwPesquisaE := TFlw_Pesquisa.create;

      flwPesquisaE._selecionaPesquisa(Trim(vImpPesq.dataSet.FieldByName('TIPO').AsString), vImpPesq.dataSet.FieldByName('CODIGO').AsInteger);
      if flwPesquisaE.dataSet.IsEmpty then
      begin
        if flwPesquisaE.insert then
        begin
          Result := True;
          flwPesquisaE.dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
          flwPesquisaE.dataSet.FieldByName('datapesquisa').AsDateTime := vDadosIni.getDataBanco(buscas);
          flwPesquisaE.dataSet.FieldByName('horapesquisa').AsString := FormatDateTime('HH:MM:SS',vDadosIni.getDataHoraBanco(buscas));
          flwPesquisaE.dataSet.FieldByName('codpesquisa').AsInteger := GenCodigo('FLW_PESQUISA', dtmFollowUpPosAtendimento.SpIncCodigo, vDadosIni.codEmpresa);
          flwPesquisaE.dataSet.FieldByName('codperfil').AsInteger := 0;
          Result := flwPesquisaE._setDadosPesquisa(vImpPesq.dataSet.FieldByName('CODIGO').AsInteger, Trim(vImpPesq.dataSet.FieldByName('TIPO').AsString));
          if Result then
          begin
            flwPesquisaE.dataSet.Post;
            Result := flwPesquisaE.Apply;
            if Result then
            begin
              buscas.Close;
              if Trim(vImpPesq.dataSet.FieldByName('TIPO').AsString) = 'ATD' then
                buscas.SQL.Text := 'update flw_atendimento set codpesquisa = ' + IntToStr(flwPesquisaE.dataSet.FieldByName('codpesquisa').AsInteger) +
                  ' where codatendimento = ' + IntToStr(vImpPesq.dataSet.FieldByName('codigo').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa
              else if Trim(vImpPesq.dataSet.FieldByName('TIPO').AsString) = 'HW' then
                buscas.SQL.Text := 'update anotacoes set codpesquisa = ' + IntToStr(flwPesquisaE.dataSet.FieldByName('codpesquisa').AsInteger) +
                  ' where codigo = ' + IntToStr(vImpPesq.dataSet.FieldByName('codigo').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa
              else
                buscas.SQL.Text := 'update pedvenda set codpesquisa = ' + IntToStr(flwPesquisaE.dataSet.FieldByName('codpesquisa').AsInteger) +
                  ' where nped = ' + IntToStr(vImpPesq.dataSet.FieldByName('codigo').AsInteger) +
                  ' and tipo = ' + QuotedStr(vImpPesq.dataSet.FieldByName('tipo').AsString) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa;
              buscas.ExecSQL;
            end;
          end;
        end
        else
          raiseExceptionCreate('Não foi possível colocar o registro em mode de inserção', '');
      end;
      vImpPesq._desmarcaLinha;
    end;
    vImpPesq.dataSet.Next;
  end;

  if Result  then
    flwPesquisaE.CommitaTransacao;
  except
    on e: exception do begin
      Result := False;
      flwPesquisaE.RollBackTransacao;
      Application.MessageBox(pchar(e.Message), 'Atenção', 64);
    end;
  end;
end;

function TFlw_Pesquisa._iniciarPesquisa: Boolean;
begin
  try
    result := true;

    if _pesquisaEmAndamento then
    begin
      Result := True;
      Exit;
    end;

    if _pesquisaConcluida then
      raiseExceptionCreate('Pesquisa já esta concluída', '');

    if not (dataSet.State in [dsEdit, dsInsert]) then
      Exit;

    dataSet.FieldByName('datapesquisa').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('horapesquisa').AsString := FormatDateTime('HH:MM:SS',vDadosIni.getDataHoraBanco(buscas));
    dataSet.FieldByName('STATUS').AsString := 'EM ANDAMENTO';

//    Result := Post;

  except
    on e: exception do
    begin
      result := false;
      registraErro('function TFlw_Pesquisa._iniciarPesquisa. Erro:' + e.Message);
      Application.MessageBox(pchar('Erro ao iniciar Pesquisa. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_Pesquisa._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 CODPESQUISA from flw_pesquisa' +
    ' where codpesquisa > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TFlw_Pesquisa._abrirPesquisa(
  pCodigoAntenOuPed: Integer; pTipoPedOuAtend: string): Boolean;
begin
  try
    _selecionaPesquisa(pTipoPedOuAtend, pCodigoAntenOuPed);
    if dataSet.IsEmpty then
    begin
      if not vDadosIni.PesqPros('CRM069', 'EXCLUIR', 'COD PESQUISA ' + dataSet.FieldByName('CODPESQUISA').AsString, 'FLW_PESQUISA',
        dataSet.FieldByName('CODPESQUISA').AsString, buscas, True) then
        exit;

      Result := Insert;
      if not Result then
        raiseExceptionCreate('Não foi possível colocar o registro em mode de inserção', '');

      Result := _setDadosPesquisa(pCodigoAntenOuPed, pTipoPedOuAtend);

      if Result then
        Result := vPergunta._selecionaPergunta(dataSet.FieldByName('CODPERFIL').AsInteger);
    end
    else if not vDadosIni.PesqPros('CRM070', 'EXCLUIR', 'COD PESQUISA ' + dataSet.FieldByName('CODPESQUISA').AsString, 'FLW_PESQUISA',
        dataSet.FieldByName('CODPESQUISA').AsString, buscas, True) then
        exit
    else
      result := Edit;

    if not Result then
    begin
      dataSet.Cancel;
      RollBackTransacao;
    end
    else
    begin
      Application.CreateForm(TfrmFlwPesquisa, frmFlwPesquisa);
      frmFlwPesquisa.showmodal;
    end;
  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_Pesquisa._abrirPesquisa. Erro:' + e.Message);
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_Pesquisa._pesquisaEmAndamento: Boolean;
begin
  result := Trim(dataSet.FieldByName('status').AsString) = 'EM ANDAMENTO';
end;

function TFlw_Pesquisa._pesquisa(pCampo, pCondicao, pValor, pData1,
  pData2: string): Boolean;
var
  vSqlTemp, vOrdem: string;
begin
  vSqlTemp := '';

  if pCampo = 'Vendedor' then
    vSqlTemp := 'c1.nome_vendedor '
  else if pCampo = 'Pesquisador' then
    vSqlTemp := 'c2.nome_vendedor ';
  if vSqlTemp  <> '' then
  begin
    if pCondicao = 'Igual' then
      pCondicao := '= '
    else if pCondicao = 'Maior' then
      pCondicao := '> '
    else if pCondicao = 'Maior ou Igual' then
      pCondicao := '>= '
    else if pCondicao = 'Menor' then
      pCondicao := '< '
    else if pCondicao = 'Menor ou Igual' then
      pCondicao := '<= '
    else if pCondicao = 'Diferente' then
      pCondicao := '<> '
    else if (pCondicao = 'Esta contido') then
      pCondicao := 'like'
    else if (pCondicao = 'Começa') then
      pCondicao := 'Começa'
    else
      pCondicao := '= ';

    if pCondicao = 'like' then
      vSqlTemp := vSqlTemp + pCondicao + QuotedStr('%' + pValor + '%')
    else if pCondicao = 'Começa' then
      vSqlTemp := vSqlTemp + 'like' + QuotedStr(pValor + '%')
    else
      vSqlTemp := vSqlTemp + pCondicao + QuotedStr(pValor);
    pValor := '';
  end;

//  vOrdem := '';//copy(dataSet.IndexName, 5, length(dataSet.IndexName));
//  if Trim(vOrdem) = '' then
    vOrdem := 'CODPESQUISA';

  if pValor <> '*D*A*T*A*' then
  begin
    Result := ConsultaCampos('FLW_PESQUISA', pValor, pCampo, pCondicao, vOrdem, True, vDadosIni.codEmpresa,
      'flw_pesquisa.*, c1.nome_vendedor, c2.nome_vendedor nome_pesquisador, flw_perfil.descricao',
      ' left join flw_perfil on flw_perfil.codperfil = flw_pesquisa.codperfil and flw_perfil.cod_empresa = flw_pesquisa.cod_empresa' +
      ' left join colaborador c1 on c1.cod_vendedor = flw_pesquisa.cod_vendedor and c1.cod_empresa = flw_pesquisa.cod_empresa' +
      ' left join colaborador c2 on c2.cod_vendedor = flw_pesquisa.codpesquisador and c2.cod_empresa = flw_pesquisa.cod_empresa', vSqlTemp);
  end
  else
    Result := ConsultaCampos('FLW_PESQUISA', pCampo, vOrdem, pData1, pData2, vDadosIni.codEmpresa, 1,
      'flw_pesquisa.*, c1.nome_vendedor, c2.nome_vendedor nome_pesquisador, flw_perfil.descricao',
      ' left join flw_perfil on flw_perfil.codperfil = flw_pesquisa.codperfil and flw_perfil.cod_empresa = flw_pesquisa.cod_empresa' +
      ' left join colaborador c1 on c1.cod_vendedor = flw_pesquisa.cod_vendedor and c1.cod_empresa = flw_pesquisa.cod_empresa' +
      ' left join colaborador c2 on c2.cod_vendedor = flw_pesquisa.codpesquisador and c2.cod_empresa = flw_pesquisa.cod_empresa', vSqlTemp);
end;

function TFlw_Pesquisa._pesquisa(pCodCliente:integer): Boolean;
begin
    Result := montaSelect('select flw_pesquisa.*, c1.nome_vendedor, c2.nome_vendedor nome_pesquisador, '+
      ' flw_perfil.descricao from flw_pesquisa '+
      ' left join flw_perfil on flw_perfil.codperfil = flw_pesquisa.codperfil and flw_perfil.cod_empresa = flw_pesquisa.cod_empresa' +
      ' left join colaborador c1 on c1.cod_vendedor = flw_pesquisa.cod_vendedor and c1.cod_empresa = flw_pesquisa.cod_empresa' +
      ' left join colaborador c2 on c2.cod_vendedor = flw_pesquisa.codpesquisador and c2.cod_empresa = flw_pesquisa.cod_empresa'+
      ' where FLW_PESQUISA.COD_CLIENTE = '+inttostr(pCodCliente)+
      ' and FLW_PESQUISA.COD_EMPRESA = '+vDadosIni.codEmpresa+' and FLW_PESQUISA.ativo=1 order by FLW_PESQUISA.CODPESQUISA');
end;

function TFlw_Pesquisa._pesquisaConcluida: Boolean;
begin
  result := Trim(dataSet.FieldByName('status').AsString) = 'CONCLUIDA';
end;

function TFlw_Pesquisa._populaAlternativasComplemento(
  ckList: TCheckListBox): Boolean;
var
  i: integer;
begin
  vResposta.vRespCompl._selecionaRespCompl(dataSet.FieldByName('codpesquisa').AsInteger,
    vPergunta.dataSet.FieldByName('codpergunta').AsInteger);
  //  if vResposta.IsEmpty then
  //    vResposta.vRespCompl.novo(dataSet.FieldByName('codpesquisa').AsInteger, vPergunta.dataSet.FieldByName('codpergunta').AsInteger)
  //  else
  //    vResposta.vRespCompl.Edit;
  ckList.Items.Clear;
  vResposta.vRespCompl.vLista.Clear;
  i := 0;
  vPergunta.vComplemento.First;
  while not vPergunta.vComplemento.Eof do
  begin
    ckList.Items.Add(vPergunta.vComplemento.dataSet.FieldByName('alternativa').AsString);
    vResposta.vRespCompl.vlista.Add(vPergunta.vComplemento.dataSet.FieldByName('codpergcompl').AsString);

//    if vResposta.vRespCompl.dataSet.FieldByName('nivelrespcompl').AsInteger =
//      vPergunta.vComplemento.dataSet.FieldByName('codpergcompl').AsInteger then
//      ckList.Checked[i] := True;
    inc(i);
    vPergunta.vComplemento.Next;
  end;

  vResposta.vRespCompl.First;
  while not vResposta.vRespCompl.Eof do
  begin
    for I := 0 to vResposta.vRespCompl.vlista.Count - 1 do
    begin
      if vResposta.vRespCompl.dataSet.FieldByName('nivelrespcompl').AsInteger =
        StrToInt(vResposta.vRespCompl.vlista.Strings[i]) then
        ckList.Checked[i] := True;
    end;
    vResposta.vRespCompl.Next;
  end;
end;

function TFlw_Pesquisa._restaurarRegistroDaLixeira: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM075', 'RESTAURAR', 'COD PESQUISA ' + dataSet.FieldByName('codatendimento').AsString, 'FLW_PESQUISA',
    dataSet.FieldByName('CODPESQUISA').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM075', 'RESTAURAR', 'SUCESSO', 'FLW_PESQUISA', dataSet.FieldByName('CODPESQUISA').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM075', 'RESTAURAR', 'FALHA', 'FLW_PESQUISA', dataSet.FieldByName('CODPESQUISA').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TFlw_Pesquisa._selecionaPesquisa(pTipoPesquisa: string;
  pCodigo: integer): Boolean;
begin
  if pTipoPesquisa = 'ATD' then
    Result := montaSelect('select * from flw_pesquisa where tipo = ''P''' +
      ' and codatendimento = ' + IntToStr(pCodigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa)
  else if Trim(pTipoPesquisa) = 'HW' then
    Result := montaSelect('select * from flw_pesquisa where tipo = ''P'' and tipo_ped = ''HW''' +
      ' and codatendimento = ' + IntToStr(pCodigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa)
  else
    Result := montaSelect('select * from flw_pesquisa where tipo = ''F'' and tipo_ped = ' + QuotedStr(pTipoPesquisa) +
      ' and nped = ' + IntToStr(pCodigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
  if Result then
    if dataSet.FieldByName('CODPERFIL').AsInteger > 0 then
      vPergunta._selecionaPergunta(dataSet.FieldByName('CODPERFIL').AsInteger);
end;

function TFlw_Pesquisa._setDadosPesquisa(pCodigoAntenOuPed: Integer;
  pTipoPedOuAtend: string): Boolean;
begin
  Result := False;
  try
    if not (dataSet.State in [dsEdit,dsInsert]) then
      Exit;

    dataSet.FieldByName('codpesquisador').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('TIPO_PED').AsString := pTipoPedOuAtend;
    dataSet.FieldByName('NPED').AsInteger := pCodigoAntenOuPed;
    dataSet.FieldByName('STATUS').AsString := 'AGUARDANDO CONTATO';
    
    if (Trim(pTipoPedOuAtend) = 'REQ') or (Trim(pTipoPedOuAtend) = 'OS') then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select pv.cod_cliente, pv.cod_vendedor, c.nome_cliente from pedvenda pv' +
        ' inner join clientes c on c.cod_cliente = pv.cod_cliente and c.cod_empresa = pv.cod_empresa' +
        ' where pv.nped = ' + IntToStr(pCodigoAntenOuPed) + ' and pv.tipo = ' + QuotedStr(pTipoPedOuAtend) +
        ' and pv.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.IsEmpty then
        raiseExceptionCreate('Venda não encontrada para realizar a pesquisa', '');
      dataSet.FieldByName('NPED').AsInteger := pCodigoAntenOuPed;
      dataSet.FieldByName('cod_cliente').AsInteger := buscas.FieldByName('cod_cliente').AsInteger;
      dataSet.FieldByName('nome_cliente').AsString := buscas.FieldByName('nome_cliente').AsString;
      dataSet.FieldByName('cod_vendedor').AsInteger := buscas.FieldByName('cod_vendedor').AsInteger;
      dataSet.FieldByName('TIPO').AsString := 'F';
    end
    else if Trim(pTipoPedOuAtend) = 'HW' then
    begin

      buscas.Close;
      buscas.SQL.Text :=
        'select a.cod_cliente, a.cod_usuario cod_vendedor, cl.nome_cliente, a.contato from anotacoes a' +
        ' inner join clientes cl on cl.cod_cliente = a.cod_cliente and cl.cod_empresa = a.cod_empresa' +
        ' where a.codigo = ' + IntToStr(pCodigoAntenOuPed) +
        ' and a.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.IsEmpty then
        raiseExceptionCreate('Atendimento do site não encontrado para realizar a pesquisa', '');

      dataSet.FieldByName('CODATENDIMENTO').AsInteger := pCodigoAntenOuPed;

      if buscas.FieldByName('cod_cliente').AsInteger > 0 then
        dataSet.FieldByName('cod_cliente').AsInteger := buscas.FieldByName('cod_cliente').AsInteger;
      dataSet.FieldByName('nome_cliente').AsString := buscas.FieldByName('nome_cliente').AsString;
      dataSet.FieldByName('contato').AsString := Copy(buscas.FieldByName('contato').AsString,1,32);
      dataSet.FieldByName('cod_vendedor').AsInteger := buscas.FieldByName('cod_vendedor').AsInteger;
      dataSet.FieldByName('TIPO').AsString := 'P';
    end
    else
    begin

      buscas.Close;
      buscas.SQL.Text := 'select cod_cliente, cod_vendedor, nome_cliente from flw_atendimento' +
        ' where codatendimento = ' + IntToStr(pCodigoAntenOuPed) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.IsEmpty then
        raiseExceptionCreate('Atendimento não encontrado para realizar a pesquisa', '');

      dataSet.FieldByName('CODATENDIMENTO').AsInteger := pCodigoAntenOuPed;

      if buscas.FieldByName('cod_cliente').AsInteger > 0 then
        dataSet.FieldByName('cod_cliente').AsInteger := buscas.FieldByName('cod_cliente').AsInteger;
      dataSet.FieldByName('nome_cliente').AsString := buscas.FieldByName('nome_cliente').AsString;
      dataSet.FieldByName('cod_vendedor').AsInteger := buscas.FieldByName('cod_vendedor').AsInteger;
      dataSet.FieldByName('TIPO').AsString := 'P';
    end;

    Result := True;

//    if Post then
//      Result := Apply;

  except
    on e: exception do
    begin
      result := false;
      registraErro('TFlw_Pesquisa._setDadosPesquisa. Erro:' + e.Message);
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_Pesquisa._verLixeira: Boolean;
begin
  if not vDadosIni.PesqPros('CRM074', 'VER LIXEIRA', '', 'FLW_PESQUISA', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select flw_pesquisa.*, c1.nome_vendedor, c2.nome_vendedor nome_pesquisador, flw_perfil.descricao from flw_pesquisa' +
    ' left join flw_perfil on flw_perfil.codperfil = flw_pesquisa.codperfil and flw_perfil.cod_empresa = flw_pesquisa.cod_empresa' +
    ' left join colaborador c1 on c1.cod_vendedor = flw_pesquisa.cod_vendedor and c1.cod_empresa = flw_pesquisa.cod_empresa' +
    ' left join colaborador c2 on c2.cod_vendedor = flw_pesquisa.codpesquisador and c2.cod_empresa = flw_pesquisa.cod_empresa' +
    ' where flw_pesquisa.codpesquisa > 0 and flw_pesquisa.cod_empresa = ' + vDadosIni.codEmpresa + ' and flw_pesquisa.ativo = 0');
  Result := not dataSet.IsEmpty;
end;

{ TFlw_Cliente }

constructor TFlw_Cliente.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsCli);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
end;

function TFlw_Cliente._selecionaCliente(pCodCliente: Integer): Boolean;
begin
  Result := montaSelect('select c.cod_cliente,  c.nome_cliente, c.razao, c.fone_cliente, c.ramal,' +
    ' c.tel_res_cf, c.fax, c.contato, c.email from clientes c' +
    ' where c.cod_cliente = ' + IntToStr(pCodCliente) + ' and c.cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TFlw_Cliente._selecionaClienteGrafico(pCodCliente: Integer): Boolean;
begin
  if pCodCliente > 0 then
    if vCodClienteIn = '' then
      vCodClienteIn := '('+ IntToStr(pCodCliente)
    else
      vCodClienteIn :=  vCodClienteIn + ', ' + IntToStr(pCodCliente);

  if pCodCliente > 0 then
    Result := montaSelect('select c.cod_cliente,  c.nome_cliente, c.razao, c.fone_cliente, c.ramal,' +
      ' c.tel_res_cf, c.fax, c.contato, c.email from clientes c' +
      ' where c.cod_cliente in ' + vCodClienteIn + ') and c.cod_empresa = ' + vDadosIni.codEmpresa +
      ' union ' +
      'select' +
      ' 0 cod_cliente,' +
      ' cast(''TODOS'' as varchar(35)) nome_cliente,' +
      ' cast('''' as varchar(60)) razao,' +
      ' cast('''' as varchar(13)) fone_cliente,' +
      ' cast('''' as varchar(5)) ramal,' +
      ' cast('''' as varchar(14)) tel_res_cf,' +
      ' cast('''' as varchar(14)) fax,' +
      ' cast('''' as varchar(10)) contato,' +
      ' cast('''' as varchar(50)) email' +
      ' from rdb$database' +
      ' order by 2')
  else
    Result := montaSelect('select' +
      ' 0 cod_cliente,' +
      ' cast(''TODOS'' as varchar(35)) nome_cliente,' +
      ' cast('''' as varchar(60)) razao,' +
      ' cast('''' as varchar(13)) fone_cliente,' +
      ' cast('''' as varchar(5)) ramal,' +
      ' cast('''' as varchar(14)) tel_res_cf,' +
      ' cast('''' as varchar(14)) fax,' +
      ' cast('''' as varchar(10)) contato,' +
      ' cast('''' as varchar(50)) email' +
      ' from rdb$database');
end;

{ TFlw_ImportarPesquisa }

constructor TFlw_ImportarPesquisa.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsImpPesq);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);

  dataSet.AfterScroll := _dataSetAfterScroll;

  vItOS := TFlw_ImportarPesquisa_ItensOS.create;
  vTVReq := TFlw_ImportarPesquisa_TipoVendas.create('REQ');
  vTVOs := TFlw_ImportarPesquisa_TipoVendas.create('OS');
end;

procedure TFlw_ImportarPesquisa._dataSetAfterScroll(DataSet: TDataSet);
begin
  vItOS._selecionaItens(DataSet.FieldByName('tipo').AsString, DataSet.FieldByName('codigo').AsInteger);
end;

procedure TFlw_ImportarPesquisa._desmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;
  dataSet.Edit;
  dataSet.FieldByName('sel').AsString := '';
  dataSet.Post;
end;

procedure TFlw_ImportarPesquisa._desmarcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFlw_ImportarPesquisa._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TFlw_ImportarPesquisa._marcaLinha;
begin
  if dataSet.IsEmpty then
    exit;
  dataSet.Edit;
  dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TFlw_ImportarPesquisa._marcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TFlw_ImportarPesquisa._pesquisa: Boolean;
var
  vSql, tempSql: string;
begin
  if not (vCons.vOS or vCons.vAtd or vCons.vHW or vCons.vReq) then
    raiseExceptionCreate('Selecione "Atendimento" ou "Serviços"','');

  vSql := '';

  if (vCons.vOS) or (vCons.vReq) then
  begin
    if (vCons.vOS) then
    begin
      tempSql := ' and os.tipo = ''OS''';
      if (Trim(vCons.vTipoOS) <> '') and (Trim(vCons.vTipoOS) <> 'TODOS') then
        tempSql := tempSql + ' and os.tipo_os = ' + QuotedStr(Trim(vCons.vTipoOS));

      vSql := 'select os.tipo tipo, os.nped codigo, os.cod_vendedor, col.nome_vendedor, os.cod_cliente, c.nome_cliente,' +
            ' os.data_fech data, os.tipo_os CATEGORIA,' +
            ' case when coalesce(e.dadvap, '''') = ''SIM'' then ''Objeto: '' || coalesce(os.aparelho_ped, '''') else ''Placa: '' || coalesce(os.placa, '''') end  || ascii_char(13) ||' +
            ' case when coalesce(os.obs_livro_reg, '''') <> '''' then ''Obs.: Livro Registro: '' || rtrim(os.obs_livro_reg) || ascii_char(13) else '''' end ||' +
            ' case when coalesce(os.obs_os, '''') <> '''' then ''Observações: '' || (os.obs_os) || ascii_char(13) else '''' end ||' +
            ' case when coalesce(os.defeito, '''') <> '''' then ''Defeito: '' || (os.defeito) || ascii_char(13) else '''' end ||' +
            ' case when coalesce(os.acessorios, '''') <> '''' then ''Acessorios: '' || (os.acessorios) || ascii_char(13) else '''' end ||' +
            ' case when coalesce(os.estado_veic, '''') <> '''' then' +
            ' case when coalesce(e.dadvap, '''') = ''SIM'' then ''Estado do Objeto: '' else ''Estado do Veículo: '' end || os.estado_veic else '''' end obs,' +
            ' '' '' contato from pedvenda os' +
            ' inner join clientes c on c.cod_cliente = os.cod_cliente and c.cod_empresa = os.cod_empresa' +
            ' inner join colaborador col on col.cod_vendedor = os.cod_vendedor and col.cod_empresa = os.cod_empresa' +
            ' inner join empresa e on e.cod_empresa = os.cod_empresa' +
            ' where coalesce(os.codpesquisa, 0) = 0 ' + tempSql + ' and os.status_ped = ''FECHADA'' and os.cod_empresa = ' + vDadosIni.codEmpresa +
            ' **DATAINIOS** **DATAFIMOS** **COLABOS**';
    end;
    if (vCons.vOS) and (vCons.vReq) then
      vSql := vSql + ' union ';

    if (vCons.vReq) then
    begin
      tempSql := ' and os.tipo = ''REQ''';
      if (Trim(vCons.vTipoReq) <> '') and (Trim(vCons.vTipoReq) <> 'TODOS') then
        tempSql := tempSql + ' and os.tipv = ' + QuotedStr(Trim(vCons.vTipoReq));

      vSql := vSql + 'select os.tipo tipo, os.nped codigo, os.cod_vendedor, col.nome_vendedor, os.cod_cliente, c.nome_cliente,' +
            ' os.data_fech data, os.tipv CATEGORIA,' +
            ' case when coalesce(e.dadvap, '''') = ''SIM'' then ''Objeto: '' || coalesce(os.aparelho_ped, '''') else ''Placa: '' || coalesce(os.placa, '''') end  || ascii_char(13) ||' +
            ' case when coalesce(os.obs_livro_reg, '''') <> '''' then ''Obs.: Livro Registro: '' || rtrim(os.obs_livro_reg) || ascii_char(13) else '''' end ||' +
            ' case when coalesce(os.obs_os, '''') <> '''' then ''Observações: '' || (os.obs_os) || ascii_char(13) else '''' end ||' +
            ' case when coalesce(os.defeito, '''') <> '''' then ''Defeito: '' || (os.defeito) || ascii_char(13) else '''' end ||' +
            ' case when coalesce(os.acessorios, '''') <> '''' then ''Acessorios: '' || (os.acessorios) || ascii_char(13) else '''' end ||' +
            ' case when coalesce(os.estado_veic, '''') <> '''' then' +
            ' case when coalesce(e.dadvap, '''') = ''SIM'' then ''Estado do Objeto: '' else ''Estado do Veículo: '' end || os.estado_veic else '''' end obs,' +
            ' '' '' contato from pedvenda os' +
            ' inner join clientes c on c.cod_cliente = os.cod_cliente and c.cod_empresa = os.cod_empresa' +
            ' inner join colaborador col on col.cod_vendedor = os.cod_vendedor and col.cod_empresa = os.cod_empresa' +
            ' inner join empresa e on e.cod_empresa = os.cod_empresa' +
            ' where coalesce(os.codpesquisa, 0) = 0 ' + tempSql + ' and os.status_ped = ''FECHADA'' and os.cod_empresa = ' + vDadosIni.codEmpresa +
            ' **DATAINIOS** **DATAFIMOS** **COLABOS**';
    end;
  end;

  if (vCons.vOS) or (vCons.vReq) then
    if vCons.vHW then
      vSql := vSql + ' union ';

  if (vCons.vHW) then
    vSql := vSql +
      'select ''HW'' tipo, fa.codigo, fa.cod_usuario cod_vendedor, c.nome_vendedor, fa.cod_cliente, cl.nome_cliente,' +
      ' fa.data, ''Atendimento'' categoria,' +
      ' case when fa.TP_CONTR = ''S'' then ''Atendimento sem contrato'' || ascii_char(13) else '''' end ||' +
      ' case when coalesce(fa.contato, '''') <> '''' then ''Contato: '' || fa.contato || ascii_char(13) else '' '' end  ||' +
      ' case when coalesce(fa.fone, '''') <> '''' then ''Telefone: '' || fa.fone || ascii_char(13) else '''' end ||' +
      ' case when coalesce(fa.email, '''') <> '''' then ''email: '' || fa.email || ascii_char(13) else '''' end ||' +
      ' case when fa.TP_ATEND = ''D'' then ''Antendimento Direto'' else ''Antendimento Telefone'' end ||' +
      ' '' - Data: '' ||' +
      ' extract ( day from fa.data) || ''/'' || extract ( month from fa.data) || ''/'' || extract ( year from fa.data) ||' +
      ' '' de '' || rtrim(fa.hora_inicial) || '' as '' || rtrim(fa.hora_final) || ascii_char(13) ||' +
      ' case when coalesce(fa.assunto, '''') <> '''' then fa.assunto || ascii_char(13) else '''' end ||' +
      ' case when coalesce(fa.observacao, '''') <> '''' then fa.observacao || ascii_char(13) else '''' end obs,' +
      ' fa.contato' +
      ' from anotacoes fa' +
      ' left join colaborador c on c.cod_vendedor = fa.cod_usuario and c.cod_empresa = fa.cod_empresa' +
      ' left join clientes cl on cl.cod_cliente = fa.cod_cliente and cl.cod_empresa = fa.cod_empresa' +
      ' left join flw_atendimento a on a.codatendimentohwauto = fa.codigo and a.cod_empresa = fa.cod_empresa' +
      ' left join tipo_anotacoes_web ta on ta.cod_tipoanot = fa.cod_tipoanot' +
      ' where coalesce(fa.codpesquisa, 0) = 0 and fa.cod_empresa = ' + vDadosIni.codEmpresa +
      ' **DATAINIHW** **DATAFIMHW** **COLABHW**';

  if ((vCons.vOS) or (vCons.vReq) or (vCons.vHW)) and (vCons.vAtd) then
      vSql := vSql + ' union ';

  if vCons.vAtd then
    vSql := vSql + ' select ''ATD'' tipo, fa.codatendimento codigo, fa.cod_vendedor, col.nome_vendedor, fa.cod_cliente, fa.nome_cliente,' +
      ' fa.data_atend data, fa.categoria, fa.atendimento obs, '' '' contato from flw_atendimento fa' +
      ' inner join colaborador col on col.cod_vendedor = fa.cod_vendedor and col.cod_empresa = fa.cod_empresa' +
      ' where coalesce(fa.codpesquisa, 0) = 0 and fa.cod_empresa = ' + vDadosIni.codEmpresa +
      ' **DATAINIATD** **DATAFIMATD** **COLABATD**';

  if vCons.vOS or vCons.vReq or vCons.vAtd or vCons.vHW then
    vSql := vSql + ' order by 7';

  if vCons.vDataIni <> '  /  /    ' then
  begin
    if vCons.vOS or vCons.vReq then
      vSql := StringReplace(vSql, '**DATAINIOS**', 'and os.data_fech >= :dataIni', [rfIgnoreCase, rfReplaceAll]);
    if vCons.vHW then
      vSql := StringReplace(vSql, '**DATAINIHW**', 'and fa.data >= :dataIni', [rfIgnoreCase]);
    if vCons.vAtd then
      vSql := StringReplace(vSql, '**DATAINIATD**', 'and fa.data_atend >= :dataIni', [rfIgnoreCase]);
  end
  else
  begin
    vSql := StringReplace(vSql, '**DATAINIOS**', '', [rfIgnoreCase, rfReplaceAll]);
    vSql := StringReplace(vSql, '**DATAINIHW**', '', [rfIgnoreCase]);
    vSql := StringReplace(vSql, '**DATAINIATD**', '', [rfIgnoreCase]);
  end;

  if vCons.vDataFim <> '  /  /    ' then
  begin
    if vCons.vOS or vCons.vReq then
      vSql := StringReplace(vSql, '**DATAFIMOS**', 'and os.data_fech <= :dataFim', [rfIgnoreCase, rfReplaceAll]);
    if vCons.vHW then
      vSql := StringReplace(vSql, '**DATAFIMHW**', 'and fa.data <= :dataFim', [rfIgnoreCase]);
    if vCons.vAtd then
      vSql := StringReplace(vSql, '**DATAFIMATD**', 'and fa.data_atend <= :dataFim', [rfIgnoreCase]);
  end
  else
  begin
    vSql := StringReplace(vSql, '**DATAFIMOS**', '', [rfIgnoreCase, rfReplaceAll]);
    vSql := StringReplace(vSql, '**DATAFIMHW**', '', [rfIgnoreCase]);
    vSql := StringReplace(vSql, '**DATAFIMATD**', '', [rfIgnoreCase]);
  end;

  if vCons.vCodColab > 0 then
  begin
    if vCons.vOS or vCons.vReq then
      vSql := StringReplace(vSql, '**COLABOS**', 'and os.cod_vendedor = ' + IntToStr(vCons.vCodColab), [rfIgnoreCase, rfReplaceAll]);
    if vCons.vHW then
      vSql := StringReplace(vSql, '**COLABHW**', 'and fa.cod_usuario = ' + IntToStr(vCons.vCodColab), [rfIgnoreCase]);
    if vCons.vAtd then
      vSql := StringReplace(vSql, '**COLABATD**', 'and fa.cod_vendedor = ' + IntToStr(vCons.vCodColab), [rfIgnoreCase]);
  end
  else
  begin
    vSql := StringReplace(vSql, '**COLABOS**', '', [rfIgnoreCase, rfReplaceAll]);
    vSql := StringReplace(vSql, '**COLABHW**', '', [rfIgnoreCase]);
    vSql := StringReplace(vSql, '**COLABATD**', '', [rfIgnoreCase]);
  end;

//  vSql := StringReplace(vSql, ':dataIni',
//    QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(vCons.vDataIni))), [rfIgnoreCase]);
//  vSql := StringReplace(vSql, ':dataFim',
//    QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(vCons.vDataIni))), [rfIgnoreCase]);

  dataSet.Close;
  dataSet.CommandText := vSql;

  if vCons.vDataIni <> '  /  /    ' then
    dataSet.Params.ParamByName('dataIni').AsDate := StrToDate(vCons.vDataIni);

  if (vCons.vDataFim <> '  /  /    ') then
    dataSet.Params.ParamByName('dataFim').AsDate := StrToDate(vCons.vDataFim);
  dataSet.Open;

  vItOS._selecionaItens(DataSet.FieldByName('tipo').AsString, DataSet.FieldByName('codigo').AsInteger);

  Result := True;

end;

{ TFlw_ImportarPesquisa_ItensOS }

constructor TFlw_ImportarPesquisa_ItensOS.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsItImpPesq);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
end;

function TFlw_ImportarPesquisa_ItensOS._selecionaItens(pTipo: string;
  pCodigo: Integer): Boolean;
begin
  Result := montaSelect(
    'select 0 id, ''SERVICOS'' TIPO , ps.nitem nitem,  ps.desc_serv_ped descricao, ps.quant_serv_ped quantidade, ps.status,' +
    ' (select nome_vendedor from colaborador c1 where c1.cod_vendedor = ps.cod_vendedor and c1.cod_empresa = ps.cod_empresa) nome_vendedor1,' +
    ' (select nome_vendedor from colaborador c2 where c2.cod_vendedor = ps.cod_vendedor1 and c2.cod_empresa = ps.cod_empresa) nome_vendedor2' +
    ' from pedvenda_serv ps ' +
    ' where ps.nped = ' + IntToStr(pCodigo) +
    ' and ps.tipo = ' + QuotedStr(pTipo) + ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
    ' union' +
    ' select 1, ''SERV TERCEIROS'', 0,  pt.descr_servt, 1, '''',' +
    ' ''TERCEIROS'' nome_vendedor1,' +
    ' ''TERCEIROS'' nome_vendedor2' +
    ' from pedvenda_serv_terc pt' +
    ' where pt.nped = ' + IntToStr(pCodigo) +
    ' and pt.tipo = ' + QuotedStr(pTipo) +
    ' and pt.cod_empresa = ' + vDadosIni.codEmpresa +
    ' union' +
    ' select 2, ''PRODUTOS'', pp.nitem,  pp.descr_prod_ped, pp.quant_ped_item, pp.status,' +
    ' (select nome_vendedor from colaborador c1 where c1.cod_vendedor = pp.cod_vendedor and c1.cod_empresa = pp.cod_empresa) nome_vendedor1,' +
    ' (select nome_vendedor from colaborador c2 where c2.cod_vendedor = pp.col_cod_vendedor and c2.cod_empresa = pp.cod_empresa) nome_vendedor2' +
    ' from pedvenda_prod pp' +
    ' where pp.nped = ' + IntToStr(pCodigo) +
    ' and pp.tipo = ' + QuotedStr(pTipo) + ' and pp.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by 1,3');
end;

{ TFlw_Atendimentos_HW }

constructor TFlw_Atendimentos_HW.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsAtdmHw);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
end;

procedure TFlw_Atendimentos_HW._desmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;
  dataSet.Edit;
  dataSet.FieldByName('sel').AsString := '';
  dataSet.Post;
end;

procedure TFlw_Atendimentos_HW._desmarcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFlw_Atendimentos_HW._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TFlw_Atendimentos_HW._marcaLinha;
begin
  if dataSet.IsEmpty then
    exit;
  dataSet.Edit;
  dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TFlw_Atendimentos_HW._marcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TFlw_Atendimentos_HW._pesquisa(pTipo, pDataIni, pDataFim: string;
  pCodColab: Integer): Boolean;
var
  vSql: string;
begin

  vSql := 'select fa.*, c.nome_vendedor, cl.nome_cliente, ta.descricao_tipoanot, a.codatendimentohwauto from anotacoes fa' +
    ' left join colaborador c on c.cod_vendedor = fa.cod_usuario and c.cod_empresa = fa.cod_empresa' +
    ' left join clientes cl on cl.cod_cliente = fa.cod_cliente and cl.cod_empresa = fa.cod_empresa' +
    ' left join flw_atendimento a on a.codatendimentohwauto = fa.codigo and a.cod_empresa = fa.cod_empresa' +
    ' left join tipo_anotacoes_web ta on ta.cod_tipoanot = fa.cod_tipoanot' +
    ' where fa.cod_empresa = ' + vDadosIni.codEmpresa + ' and a.codatendimentohwauto is null' +
    ' **DATAINIATD** **DATAFIMATD** **COLABATD** **TIPOATD**' +
    ' order by fa.data, fa.hora_inicial, fa.codigo';

  if pDataIni <> '  /  /    ' then
    vSql := StringReplace(vSql, '**DATAINIATD**', 'and fa.data >= :dataIni', [rfIgnoreCase])
  else
    vSql := StringReplace(vSql, '**DATAINIATD**', '', [rfIgnoreCase]);

  if pDataFim <> '  /  /    ' then
    vSql := StringReplace(vSql, '**DATAFIMATD**', 'and fa.data <= :dataFim', [rfIgnoreCase])
  else
    vSql := StringReplace(vSql, '**DATAFIMATD**', '', [rfIgnoreCase]);

  if pCodColab > 0 then
    vSql := StringReplace(vSql, '**COLABATD**', 'and fa.cod_usuario = ' + IntToStr(pCodColab), [rfIgnoreCase])
  else
    vSql := StringReplace(vSql, '**COLABATD**', '', [rfIgnoreCase]);

  if pTipo <> 'Todos' then
    vSql := StringReplace(vSql, '**TIPOATD**', 'and fa.tipo = ' + QuotedStr(pTipo), [rfIgnoreCase])
  else
    vSql := StringReplace(vSql, '**TIPOATD**', '', [rfIgnoreCase]);

  dataSet.Close;
  dataSet.CommandText := vSql;

  if pDataIni <> '  /  /    ' then
    dataSet.Params[0].AsDate := StrToDate(pDataIni);

  if (pDataIni <> '  /  /    ') and (pDataFim <> '  /  /    ') then
    dataSet.Params[1].AsDate := StrToDate(pDataFim)
  else if (pDataFim <> '  /  /    ') then
    dataSet.Params[1].AsDate := StrToDate(pDataFim);
  dataSet.Open;

  Result := True;
end;

{ TFlw_Graficos }

function TFlw_Graficos._selecionaGrupoPerguntas(dtSetGP: TClientDataSet;
  ano: TDate): boolean;
var
  vTempSqlCl: string;
begin
  try
    if not vPerfil.dataSet.Active then
      vPerfil._abreTodos;

    if vCliente.dataSet.FieldByName('cod_cliente').AsInteger > 0 then
      vTempSqlCl := ' and pq.cod_cliente = ' + IntToStr(vCliente.dataSet.FieldByName('cod_cliente').AsInteger)
    else
      vTempSqlCl := '';

    if vColab.dataSet.FieldByName('cod_vendedor').AsInteger > 0 then
      vTempSqlCl := vTempSqlCl + ' and pq.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

    result := true;
    dtSetGP.close;
    dtSetGP.CommandText := 'select g.codgrupo,g.descricao,p.codpergunta,p.pergunta,p.complemento from flw_resposta r' +
      ' inner join flw_pergunta p on p.codpergunta = r.codpergunta' +
      ' inner join flw_perfilpergunta pp on pp.codpergunta = p.codpergunta and pp.cod_empresa = p.cod_empresa' +
      ' inner join flw_pesquisa pq on pq.codpesquisa = r.codpesquisa and pq.cod_empresa = r.cod_empresa and pq.codperfil = pp.codperfil' +
      ' inner join flw_grupo g on g.codgrupo = p.codgrupo' +
      ' where r.cod_empresa = ' + vDadosIni.codEmpresa + ' and pq.datafechamento >= :dataIni and pq.datafechamento <= :dataFim' +
      ' and pp.codperfil = ' + IntToStr(vPerfil.dataSet.FieldByName('codperfil').AsInteger) + vTempSqlCl +
      ' group by g.codgrupo,g.descricao,p.codpergunta,p.pergunta,p.complemento';
    dtSetGP.Params[0].AsDate := StartOfTheYear(ano);
    dtSetGP.Params[1].AsDate := EndOfTheYear(ano);
    dtSetGP.Open;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TFlw_Graficos._selecionaValores(mes, ano: TDate; grupo,
  Pergunta: integer): boolean;
var
  inicioMes, fimMes: TDate;
  vTempSqlCl: string;
begin
  inicioMes := StartOfTheMonth(StrToDate('01/' + FormatDateTime('mm', mes) + '/' + FormatDateTime('yyy', ano)));
  fimMes := endOfTheMonth(StrToDate('02/' + FormatDateTime('mm', mes) + '/' + FormatDateTime('yyy', ano)));

  if vCliente.dataSet.FieldByName('cod_cliente').AsInteger > 0 then
    vTempSqlCl := ' and pq.cod_cliente = ' + IntToStr(vCliente.dataSet.FieldByName('cod_cliente').AsInteger)
  else
    vTempSqlCl := '';

  if vColab.dataSet.FieldByName('cod_vendedor').AsInteger > 0 then
    vTempSqlCl := vTempSqlCl + ' and pq.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  Result := montaSelect('select g.codgrupo,p.codpergunta,p.simnaonivel,r.nivelresposta,' +
    ' count(r.codpesquisa) as QTDE from flw_resposta r' +
    ' inner join flw_pergunta p on p.codpergunta = r.codpergunta' +
    ' inner join flw_perfilpergunta pp on pp.codpergunta = p.codpergunta and pp.cod_empresa = p.cod_empresa' +
    ' inner join flw_grupo g on g.codgrupo = p.codgrupo' +
    ' inner join flw_pesquisa pq on pq.codpesquisa = r.codpesquisa and pq.cod_empresa = r.cod_empresa and pq.codperfil = pp.codperfil' +
    ' where r.cod_empresa = ' + vDadosIni.codEmpresa + ' and pq.datafechamento >= :dataIni and pq.datafechamento <= :dataFim' +
    ' and p.codpergunta = ' + IntToStr(Pergunta) + ' and p.codgrupo = ' + IntToStr(grupo) +
    ' and pp.codperfil = ' + IntToStr(vPerfil.dataSet.FieldByName('codperfil').AsInteger) + vTempSqlCl +
    ' group by g.codgrupo,p.codpergunta,p.simnaonivel,r.nivelresposta', inicioMes, fimMes);
end;

function TFlw_Graficos._selecionaValores(ano: TDate; grupo,
  Pergunta: integer): boolean;
var
  inicioAno, fimAno: TDate;
  vTempSqlCl: string;
begin
  inicioAno := StartOfTheYear(ano);
  fimAno := EndOfTheYear(ano);

  if vCliente.dataSet.FieldByName('cod_cliente').AsInteger > 0 then
    vTempSqlCl := ' and pq.cod_cliente = ' + IntToStr(vCliente.dataSet.FieldByName('cod_cliente').AsInteger)
  else
    vTempSqlCl := '';

  if vColab.dataSet.FieldByName('cod_vendedor').AsInteger > 0 then
    vTempSqlCl := vTempSqlCl + ' and pq.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);
    
  Result := montaSelect('select pc.alternativa,rc.nivelrespcompl,count(rc.codpesquisa) as qtde' +
    ' from flw_respostacomplemento  rc' +
    ' inner join flw_perguntacomplemento pc on pc.codpergcompl = rc.nivelrespcompl' +
    ' inner join flw_pergunta p on p.codpergunta = rc.codpergunta' +
    ' inner join flw_perfilpergunta pp on pp.codpergunta = p.codpergunta and pp.cod_empresa = p.cod_empresa' +
    ' inner join flw_pesquisa pq on pq.codpesquisa = rc.codpesquisa and pq.cod_empresa = rc.cod_empresa and pq.codperfil = pp.codperfil' +
    ' where rc.cod_empresa = ' + vDadosIni.codEmpresa + ' and pq.datafechamento >= :dataIni and pq.datafechamento <= :dataFim' +
    ' and p.codpergunta = ' + IntToStr(Pergunta) + ' and p.codgrupo = ' + IntToStr(grupo) +
    ' and pp.codperfil = ' + IntToStr(vPerfil.dataSet.FieldByName('codperfil').AsInteger) + vTempSqlCl +
    ' group by pc.alternativa,rc.nivelrespcompl', inicioAno, fimAno);
end;

{ TFlw_Tendencias }

constructor TFlw_Tendencias.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsGraficos);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
  vUtilDataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsUtil);
  vPerfil:= TFlw_Perfil.create;
  vPerfil.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPerfPesq);
  vCliente:= TFlw_Cliente.create;
  vColab:= TFlw_Colaborador.create;
end;

function TFlw_Tendencias._montaTabelaMensal(ano: TDate; dtSet: TClientDataSet;
  grupo, Pergunta: integer): boolean;
var
  qtde, i: integer;
  porcentagem: Double;
begin
  for I := 1 to 12 do
  begin
    dtSet.Insert;
    dtSet.FieldByName('Codigo').AsInteger := i;
    dtSet.FieldByName('Mes').AsString := const_NomeMes[i];
    dtSet.FieldByName('Porcentagem').AsFloat := 0;
    _selecionaValores(strtodate('01/' + vDadosIni.StrZero(i, 2) + '/2000'), ano, grupo, Pergunta);
    qtde := 0;
    porcentagem := 0;
    while not dataset.eof do
    begin
      if dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
      begin
        qtde := qtde + dataSet.FieldByName('qtde').AsInteger;
        if dataSet.FieldByName('nivelresposta').AsInteger = 1 then
          porcentagem := porcentagem + (100 * dataSet.FieldByName('qtde').AsInteger);
      end
      else
      begin
        qtde := qtde + dataSet.FieldByName('qtde').AsInteger;
        if dataSet.FieldByName('nivelresposta').AsInteger = 5 then
          porcentagem := porcentagem + (100 * dataSet.FieldByName('qtde').AsInteger)
        else if dataSet.FieldByName('nivelresposta').AsInteger = 4 then
          porcentagem := porcentagem + (75 * dataSet.FieldByName('qtde').AsInteger)
        else if dataSet.FieldByName('nivelresposta').AsInteger = 3 then
          porcentagem := porcentagem + (50 * dataSet.FieldByName('qtde').AsInteger)
        else if dataSet.FieldByName('nivelresposta').AsInteger = 2 then
          porcentagem := porcentagem + (25 * dataSet.FieldByName('qtde').AsInteger);
      end;
      dataset.next;
    end;
    if (porcentagem > 0) and (qtde > 0) then
      dtSet.FieldByName('Porcentagem').AsFloat := vDadosIni.StrToFloatFormat(porcentagem / qtde,2);
    dtSet.FieldByName('Quantidade').AsInteger := qtde;
    dtSet.Post;
  end;
end;

{ TFlw_ReacoesNegativas }

constructor TFlw_ReacoesNegativas.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsGraficos);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
  vUtilDataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsUtil);
  vPerfil:= TFlw_Perfil.create;
  vPerfil.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPerfPesq);
  vCliente:= TFlw_Cliente.create;
  vColab:= TFlw_Colaborador.create;
end;

function TFlw_ReacoesNegativas._montaTabelaAnual(ano: TDate;
  dtSet: TClientDataSet; grupo, Pergunta: integer): boolean;
begin
  result := true;
  while not dtSet.IsEmpty do
    dtSet.Delete;
  _selecionaValores(ano, grupo, Pergunta);
  while not eof do
  begin
    dtSet.Insert;
    dtSet.FieldByName('Codigo').AsInteger := dataSet.FieldByName('nivelrespcompl').AsInteger;
    dtSet.FieldByName('Alternativa').AsString := dataSet.FieldByName('alternativa').AsString;
    dtSet.FieldByName('QTDE').AsFloat := dataSet.FieldByName('qtde').AsInteger;
    dtSet.Post;
    next;
  end;
  if IsEmpty then
    result := false;
end;

function TFlw_ReacoesNegativas._montaTabelaMensal(ano: TDate;
  dtSet: TClientDataSet; grupo, Pergunta: integer): boolean;
var
  qtde, i, neg, posit: integer; //Neg = Negativos e Posit = Positivo
  porcentagem: Double;
begin
  while not dtSet.IsEmpty do
    dtSet.Delete;
  for I := 1 to 12 do
  begin
    dtSet.Insert;
    dtSet.FieldByName('Codigo').AsInteger := i;
    dtSet.FieldByName('Mes').AsString := const_NomeMes[i];
    dtSet.FieldByName('Porcentagem').AsFloat := 0;
    _selecionaValores(strtodate('01/' + vDadosIni.StrZero(i, 2) + '/2000'), ano, grupo, Pergunta);
    qtde := 0;
    porcentagem := 0;
    neg := 0;
    posit := 0;
    while not eof do
    begin
      if dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
      begin
        if dataSet.FieldByName('nivelresposta').AsInteger = 1 then
          posit := posit + dataSet.FieldByName('qtde').AsInteger
        else
          neg := neg + dataSet.FieldByName('qtde').AsInteger;
      end
      else
      begin
        if dataSet.FieldByName('nivelresposta').AsInteger = 1 then
          neg := neg + dataSet.FieldByName('qtde').AsInteger
        else if dataSet.FieldByName('nivelresposta').AsInteger = 2 then
          neg := neg + dataSet.FieldByName('qtde').AsInteger
        else if dataSet.FieldByName('nivelresposta').AsInteger = 3 then
          posit := posit + dataSet.FieldByName('qtde').AsInteger
        else if dataSet.FieldByName('nivelresposta').AsInteger = 4 then
          posit := posit + dataSet.FieldByName('qtde').AsInteger
        else if dataSet.FieldByName('nivelresposta').AsInteger = 5 then
          posit := posit + dataSet.FieldByName('qtde').AsInteger;
      end;
      next;
    end;
    if (neg > 0) then
      dtSet.FieldByName('Porcentagem').AsFloat := vDadosIni.StrToFloatFormat((100 / (neg + posit)) * neg,2);
    dtSet.FieldByName('Quantidade').AsInteger := neg;
    dtSet.Post;
  end;
end;

{ TFlw_Indices }

constructor TFlw_Indices.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsGraficos);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
  vUtilDataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsUtil);
  vPerfil:= TFlw_Perfil.create;
  vPerfil.dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsPerfPesq);
  vCliente:= TFlw_Cliente.create;
  vColab:= TFlw_Colaborador.create;
end;

function TFlw_Indices._montaTabelaAnual(ano: TDate; dtSet: TClientDataSet; grupo,
  Pergunta: integer): boolean;
var
  total, i: integer;
begin
  result := true;
  while not dtSet.IsEmpty do
    dtSet.Delete;
  Self._selecionaValores(ano, grupo, Pergunta);
  total := 0;
  First;
  while not eof do
  begin
    if dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
      total := total + dataSet.FieldByName('qtde').AsInteger
    else
    begin
      if (dataSet.FieldByName('nivelresposta').AsInteger > 0) and (dataSet.FieldByName('nivelresposta').AsInteger < 6) then
        total := total + dataSet.FieldByName('qtde').AsInteger;
    end;
    next;
  end;
  First;
  if dataSet.FieldByName('simnaonivel').AsString = 'Sim ou Não' then
  begin
    dtSet.Append;
    dtSet.FieldByName('Codigo').AsInteger := 0;
    dtSet.FieldByName('Alternativa').AsString := 'Não';
    dtSet.FieldByName('QTDE').AsFloat := 0;
    dtSet.Post;
    dtSet.Insert;
    dtSet.FieldByName('Codigo').AsInteger := 1;
    dtSet.FieldByName('Alternativa').AsString := 'Sim';
    dtSet.FieldByName('QTDE').AsFloat := 0;
    dtSet.Post;
    First;
    while not eof do
    begin
      dtSet.First;
      while not dtSet.Eof do
      begin
        dtSet.Edit;
        if dataSet.FieldByName('nivelresposta').AsInteger = dtSet.FieldByName('codigo').AsInteger then
          dtSet.FieldByName('QTDE').AsFloat := (100 / total) * dataSet.FieldByName('qtde').AsInteger;
        dtSet.Post;
        dtSet.Next;
      end;
      Next;
    end;
  end
  else
  begin
    for I := 0 to 5 do
    begin
      dtSet.Append;
      dtSet.FieldByName('Codigo').AsInteger := i;
      if dataSet.FieldByName('simnaonivel').AsString = 'Nivel de 1 a 5' then
        dtSet.FieldByName('Alternativa').AsString := const_Satisfacao[i]
      else
        dtSet.FieldByName('Alternativa').AsString := const_Satisfacao2[i];
      dtSet.FieldByName('QTDE').AsFloat := 0;
      dtSet.Post;
    end;
    First;
    while not eof do
    begin
      dtSet.First;
      while not dtSet.Eof do
      begin
        dtSet.Edit;
        if dataSet.FieldByName('nivelresposta').AsInteger = dtSet.FieldByName('codigo').AsInteger then
          dtSet.FieldByName('QTDE').AsFloat := (100 / total) * dataSet.FieldByName('qtde').AsInteger;
        dtSet.Post;
        dtSet.Next;
      end;
      Next;
    end;
  end;
  if IsEmpty then
    result := false;
end;

function TFlw_Indices._selecionaValores(ano: TDate; grupo,
  Pergunta: integer): boolean;
var
  inicioAno, fimAno: TDate;
  vTempSqlCl: string;
begin
  inicioAno := StartOfTheYear(ano);
  fimAno := EndOfTheYear(ano);

  if vCliente.dataSet.FieldByName('cod_cliente').AsInteger > 0 then
    vTempSqlCl := ' and pq.cod_cliente = ' + IntToStr(vCliente.dataSet.FieldByName('cod_cliente').AsInteger)
  else
    vTempSqlCl := '';

  if vColab.dataSet.FieldByName('cod_vendedor').AsInteger > 0 then
    vTempSqlCl := vTempSqlCl + ' and pq.cod_vendedor = ' + IntToStr(vColab.dataSet.FieldByName('cod_vendedor').AsInteger);

  Result := montaSelect('select r.nivelresposta,p.simnaonivel,count(pq.codpesquisa) as qtde' +
    ' from flw_resposta r' +
    ' inner join flw_pergunta p on p.codpergunta = r.codpergunta' +
    ' inner join flw_perfilpergunta pp on pp.codpergunta = p.codpergunta and pp.cod_empresa = p.cod_empresa' +
    ' inner join flw_pesquisa  pq on pq.codpesquisa = r.codpesquisa and pq.cod_empresa = r.cod_empresa and pq.codperfil = pp.codperfil' +
    ' where pq.cod_empresa = ' + vDadosIni.codEmpresa + ' and pq.datafechamento >= :dataIni and pq.datafechamento <= :dataFim' +
    ' and p.codpergunta = ' + IntToStr(Pergunta) + ' and p.codgrupo = ' + IntToStr(grupo) +
    ' and pp.codperfil = ' + IntToStr(vPerfil.dataSet.FieldByName('codperfil').AsInteger) + vTempSqlCl +
    ' group by r.nivelresposta,p.simnaonivel', inicioAno, fimAno);
end;

{ TFlw_Anotacoes }

function TFlw_Anotacoes.abreFormClientes: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Selecione um cliente';

    frmCadAnotacoes.pnClientes.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [biSystemMenu];

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadAnotacoes.pnClientes.Parent := frmCadAnotacoes.tsClientes;
    frmCadAnotacoes.DataSource1.DataSet := nil;
    formulario.Free;
    formulario := nil;
  end;
end;

constructor TFlw_Anotacoes.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsAnotacoes);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);

  vTipoAnot := TFlw_TipoAnotacoes.create;
  vSoft := TFlw_SoftwareSuporte.create;
  vColab := TFlw_Colaborador.create;

  if (dataSet.FieldByName('cod_soft').Visible) and (vDadosIni.vEmp.vCNPJ = '03530705000109') then
    dataSet.FieldByName('cod_soft').Visible := False;
end;

function TFlw_Anotacoes.delete: Boolean;
var
  vCodAnotacao: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  vCodAnotacao := dataSet.FieldByName('CODIGO').AsString;

  if not vDadosIni.PesqPros('CRM085', 'EXCLUIR', 'COD ANOTACAO ' + dataSet.FieldByName('CODIGO').AsString, 'ANOTACOES',
    dataSet.FieldByName('CODIGO').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('CRM085', 'LIXEIRA', 'SUCESSO', 'ANOTACOES', vCodAnotacao, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('CRM085', 'LIXEIRA', 'FALHA', 'ANOTACOES', vCodAnotacao, buscas);
  end;
  Result := true;
  Refresh;
end;

destructor TFlw_Anotacoes.Destroy;
begin
  vTipoAnot.Free;
  vTipoAnot := nil;

  vSoft.Free;
  vSoft := nil;

  inherited;
end;

function TFlw_Anotacoes.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('CRM083', 'ALTERAR', '', 'ANOTACOES', dataSet.FieldByName('CODIGO').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    vTipoAnot.abreTodos;
    vSoft.abreTodos;
    vColab._abreTodos;
    if dataSet.FieldByName('TP_ATEND').AsString = 'D' then
      dataSet.FieldByName('TP_ATEND_D').AsString := 'Direto'
    else
      dataSet.FieldByName('TP_ATEND_D').AsString := 'Telefone';
      
    if dataSet.FieldByName('TP_CONTR').AsString = 'C' then
      dataSet.FieldByName('TP_CONTR_D').AsString := 'Com Contrato'
    else
      dataSet.FieldByName('TP_CONTR_D').AsString := 'Sem Contrato';

    buscas.Close;
    buscas.SQL.Text := 'select c.nome_cliente, c.razao, c.contato, c.fone_cliente, c.email, cc.status from clientes c' +
      ' left join clientes_com_contrato cc on cc.cod_cliente = c.cod_cliente and cc.cod_empresa = c.cod_empresa and cc.status <> ''Rescindido''' +
      ' where c.cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
      ' and c.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if RazaoSocial then
      dataSet.FieldByName('nome_cl').AsString :=
        Trim(buscas.FieldByName('razao').AsString)
    else
      dataSet.FieldByName('nome_cl').AsString :=
        Trim(buscas.FieldByName('nome_cliente').AsString);



    Result := True;
  end;
end;

function TFlw_Anotacoes.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('CRM082', 'INCLUIR', '', 'ANOTACOES', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select anotacoes.*, clientes.nome_cliente, clientes.razao, clientes.cpfcgc, col1.nome_vendedor colab_atend, col2.nome_vendedor colab_status, ss.nome_soft from anotacoes' +
    ' left join clientes on clientes.cod_cliente = anotacoes.cod_cliente and clientes.cod_empresa = anotacoes.cod_empresa' +
    ' left join colaborador col1 on col1.cod_vendedor = anotacoes.cod_usuario and col1.cod_empresa = anotacoes.cod_empresa' +
    ' left join colaborador col2 on col2.cod_vendedor = anotacoes.us_status and col2.cod_empresa = anotacoes.cod_empresa' +
    ' left join softwares_suporte ss on ss.cod_soft = anotacoes.cod_soft and ss.cod_empresa = anotacoes.cod_empresa' +
    ' where anotacoes.COD_TIPOANOT  = 0 and anotacoes.cod_empresa = 1');

  if inherited insert then
  begin
    vTipoAnot.abreTodos;
    vSoft.abreTodos;
    vColab._abreTodos;
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('DATA').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
    dataSet.FieldByName('HORA').AsString := FormatDateTime('HH:MM:SS', dataSet.FieldByName('DATA').AsDateTime);
    dataSet.FieldByName('DATA').AsDateTime := DateOf(dataSet.FieldByName('DATA').AsDateTime);
    dataSet.FieldByName('TP_ATEND_D').AsString := 'Telefone';
    dataSet.FieldByName('TP_CONTR_D').AsString := 'Com Contrato';
    dataSet.FieldByName('TIPO').AsString := 'Atendimento';
    dataSet.FieldByName('COD_USUARIO').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('status').AsString := 'Resolvido';
  end;
end;

function TFlw_Anotacoes.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('CRM084', 'SALVAR', '', 'ANOTACOES', dataSet.FieldByName('CODIGO').AsString, buscas, False) then
    Exit;

  try

    if (not (dataSet.State in [dsInsert, dsEdit])) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if not _existeCliente(False, pcCodigo) then
      raiseExceptionCreate('Campo Cliente de preenchimento obrigatório', 'DBEdit2');

    if Trim(dataset.FieldByName('contato').AsString) = '' then
      raiseExceptionCreate('Campo Contato de preenchimento obrigatório', 'DBEdit6');

    if (Trim(dataset.FieldByName('tipo').AsString) = 'Atendimento') or
      (Trim(dataset.FieldByName('tipo').AsString) = 'VisitaSuporte') then
    begin
      if dataset.FieldByName('COD_SOFT').AsInteger = 0 then
        if vDadosIni.vEmp.vCNPJ <> '03530705000109' then
          raiseExceptionCreate('Campo Software de preenchimento obrigatório', 'DBLookupComboBox4');

      if (Trim(dataset.FieldByName('HORA_INICIAL').AsString) = '') then
        if (Trim(dataset.FieldByName('tipo').AsString) = 'Atendimento') then
          raiseExceptionCreate('Campo de Hora Inicial para o Atendimento de preenchimento obrigatório', 'DBEdit11')
        else
          raiseExceptionCreate('Campo de Hora Inicial para a VisitaSuporte de preenchimento obrigatório', 'DBEdit11');

      if (Trim(dataset.FieldByName('HORA_FINAL').AsString) = '') then
        if (Trim(dataset.FieldByName('tipo').AsString) = 'Atendimento') then
          raiseExceptionCreate('Campo de Hora Final para o Atendimento de preenchimento obrigatório', 'DBEdit12')
        else
          raiseExceptionCreate('Campo de Hora Final para a VisitaSuporte de preenchimento obrigatório', 'DBEdit12');

      try
        StrToTime(Trim(dataset.FieldByName('HORA_INICIAL').AsString));
      except
        if (Trim(dataset.FieldByName('tipo').AsString) = 'Atendimento') then
          raiseExceptionCreate('Campo de Hora Inicial para o Atendimento inválido', 'DBEdit11')
        else
          raiseExceptionCreate('Campo de Hora Inicial para a VisitaSuporte inválido', 'DBEdit11');
      end;

      try
        StrToTime(Trim(dataset.FieldByName('HORA_FINAL').AsString));
      except
        if (Trim(dataset.FieldByName('tipo').AsString) = 'Atendimento') then
          raiseExceptionCreate('Campo de Hora Final para o Atendimento inválido', 'DBEdit12')
        else
          raiseExceptionCreate('Campo de Hora Final para a VisitaSuporte inválido', 'DBEdit12');
      end;

      if StrToTime(Trim(dataset.FieldByName('HORA_INICIAL').AsString)) >
        StrToTime(Trim(dataset.FieldByName('HORA_FINAL').AsString)) then
          raiseExceptionCreate('Campo de Hora de Início maior que a Hora de Fim', 'DBEdit11');
    end;

    buscas.Close;
    buscas.SQL.Text := 'select * from TIPO_ANOTACOES_WEB' +
      ' where COD_TIPOANOT = ' + IntToStr(dataset.FieldByName('COD_TIPOANOT').AsInteger);
    buscas.Open;
    dataset.FieldByName('ASSUNTO').AsString := buscas.FieldByName('DESCRICAO_TIPOANOT').AsString;

    if Trim(dataset.FieldByName('ASSUNTO').AsString) = '' then
      raiseExceptionCreate('Campo Assunto de preenchimento obrigatório', 'DBLookupComboBox1');

    dataSet.FieldByName('TP_ATEND').AsString := Copy(dataSet.FieldByName('TP_ATEND_D').AsString, 1, 1);
    dataSet.FieldByName('TP_CONTR').AsString := Copy(dataSet.FieldByName('TP_CONTR_D').AsString, 1, 1);

      // colocar um processo para o campo de contrato sim ou nao para habilitar ou nao a alteracao

    if dataSet.State = dsInsert then
    begin
      buscas.Close;
      buscas.SQL.Text := 'SELECT GEN_ID(INC_ANOTACOES, 1) INC_ANOTACOES FROM RDB$DATABASE';
      buscas.Open;

      dataSet.FieldByName('CODIGO').AsInteger := buscas.FieldByName('INC_ANOTACOES').AsInteger;
      dataSet.FieldByName('HORA').AsString := FormatDateTime('HH:MM:SS', vDadosIni.getDataHoraBanco(buscas));
    end
    else if dataSet.State = dsEdit then
    begin
      dataSet.FieldByName('US_STATUS').AsInteger := vDadosIni.vCodUsuario;
      if Trim(dataSet.FieldByName('status').AsString) = 'Não Lido' then
        dataSet.FieldByName('status').AsString := 'Lido';
    end;

    if (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := inherited Post;

      if (DataSet.ChangeCount = 0) then
        Result := True
      else
        Result := Apply;
    end
    else
      Result := True;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('CRM084', acao, 'SUCESSO', 'ANOTACOES', dataSet.FieldByName('CODIGO').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CRM084', acao, 'FALHA', 'ANOTACOES', dataSet.FieldByName('CODIGO').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

procedure TFlw_Anotacoes._cadAnotacoes(pTipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Anotações');
  if dtmFollowUpPosAtendimento = nil then
    dtmFollowUpPosAtendimento := TdtmFollowUpPosAtendimento.Create(dtmFollowUpPosAtendimento);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('CRM080', 'CONSULTA', '', 'ANOTACOES', '',
    dtmFollowUpPosAtendimento.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadAnotacoes = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadAnotacoes, frmCadAnotacoes);
  end;
  if (pTipoForm > 0) and (not frmCadAnotacoes.Enabled) then
  	frmCadAnotacoes.ShowModal
  else if (not frmCadAnotacoes.Enabled) then 
  	frmCadAnotacoes.Show
  else if frmCadAnotacoes.FormStyle = fsMDIChild then
    frmCadAnotacoes.Show
  else
    frmCadAnotacoes.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

function TFlw_Anotacoes._consulta: boolean;
var
  I, erro: Integer;
  vVaol: Extended;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql, tempSqlTipo: string;
begin
  try
    if vCons.porData then
    begin
      try
        erro := 0;
        StrToDate(vCons.dataIni);
      except
        vCons.dataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vCons.dataFim);
      except
        vCons.dataFim := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
      end;
    end; //porData
    vsqlAdicional := '';
    if vCons.adicional then
    begin
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
          erro := erro + 1;
        end;
        if erro = 2 then
        begin
          Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
            'Atenção', MB_OK + MB_ICONINFORMATION);
        end
        else
        begin
          if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
            formatodata := 'mm/dd/yyyy'
          else if pos('.', ShortDateFormat) <> 0 then
            formatodata := 'dd.mm.yyyy';
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end;
      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Maior ou Igual' then
        vCons.condicaoAd := '>='
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Menor ou Igual' then
        vCons.condicaoAd := '<='
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';
      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            try
              if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
              begin
                if not TryStrToInt(Trim(vCons.valorAd), erro) then
                  raiseExceptionCreate('Valor digitado inválido para o campo de pesquisa', '');
              end
              else if (Dataset.Fields[I] is TFloatField) or
                (Dataset.Fields[I] is TCurrencyField) then
              begin
                if not TryStrToFloat(Trim(vCons.valorAd), vVaol) then
                  raiseExceptionCreate('Valor digitado inválido para o campo de pesquisa', '');
              end;
              vCons.campoAd := DataSet.Fields[I].FieldName;
              if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
                (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
                ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'Começa')) then
              begin
                vCons.condicaoAd := '=';
                vCons.valorAd := vDadosIni.tirapontos(vCons.valorAd, 4);
              end
              else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              begin
                if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                  vsqlAdicional := ' and ANOTACOES.' + vCons.campoAd + ' >= ' + vCons.dataIniAd +
                    ' and ' +
                    vCons.campoAd + ' <= ' + vCons.dataFimAd
                else if (vCons.dataFimAd <> '') then
                  vsqlAdicional := ' and ANOTACOES.' + vCons.campoAd + ' <= ' + vCons.dataFimAd
                else if (vCons.dataIniAd <> '') then
                  vsqlAdicional := ' and ANOTACOES.' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
                Break;
              end;
              if vCons.condicaoAd = 'like' then
                vsqlAdicional := ' and ANOTACOES.' + vCons.campoAd + ' like ' + QuotedStr('%' +
                  vCons.valorAd +
                  '%')
              else if vCons.condicaoAd = 'Começa' then
                vsqlAdicional := ' and ANOTACOES.' + vCons.campoAd + ' like ' +
                  QuotedStr(vCons.valorAd + '%')
              else
                vsqlAdicional := ' and ANOTACOES.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' +
                  QuotedStr(vCons.valorAd);
            finally
              if (UpperCase(vCons.campoAd) = 'NOME_CLIENTE') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'anotacoes.NOME_CLIENTE', 'clientes.NOME_CLIENTE', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'CPFCGC') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'anotacoes.CPFCGC', 'clientes.CPFCGC', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'RAZAO') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'anotacoes.RAZAO', 'clientes.RAZAO', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'COLAB_ATEND') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'anotacoes.COLAB_ATEND', 'COL1.nome_vendedor', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'COLAB_ATEND') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'anotacoes.COLAB_ATEND', 'COL2.nome_vendedor', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'NOME_SOFT') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'anotacoes.NOME_SOFT', 'SS.NOME_SOFT', [rfIgnoreCase, rfReplaceAll]);
            end;
            Break;
          end;
        end;
      end;
    end; //adicional

    tempSql := '';

    if vCons.campo = 'Razao Social Cliente' then
      tempSql := 'clientes.razao '
    else if vCons.campo = 'CPF/CNPJ Cliente' then
      tempSql := 'clientes.cpfcgc '
    else if vCons.campo = 'Nome Fantasia Cliente' then
      tempSql := 'clientes.nome_cliente '
    else if vCons.campo = 'Colaborador' then
      tempSql := 'col1.nome_vendedor '
    else if vCons.campo = 'Usuario Status' then
      tempSql := 'col2.nome_vendedor '
    else if vCons.campo = 'Software' then
      tempSql := 'ss.nome_soft '
    else if vCons.campo = 'Tipo Anotacao' then
      tempSql := 'anotacoes.tipo ';
    if tempSql  <> '' then
    begin
      if vCons.condicao = 'Igual' then
        tempTipo := '= '
      else if vCons.condicao = 'Maior' then
        tempTipo := '> '
      else if vCons.condicao = 'Maior ou Igual' then
        tempTipo := '>= '
      else if vCons.condicao = 'Menor' then
        tempTipo := '< '
      else if vCons.condicao = 'Menor ou Igual' then
        tempTipo := '<= '
      else if vCons.condicao = 'Diferente' then
        tempTipo := '<> '
      else if (vCons.condicao = 'Esta contido') then
        tempTipo := 'like'
      else if (vCons.condicao = 'Começa') then
        tempTipo := 'Começa'
      else
        tempTipo := '= ';

      if tempTipo = 'like' then
        tempSql := tempSql + tempTipo + QuotedStr('%' + vCons.valor + '%')
      else if tempTipo = 'Começa' then
        tempSql := tempSql + 'like' + QuotedStr(vCons.valor + '%')
      else
        tempSql := tempSql + tempTipo + QuotedStr(vCons.valor);
      vCons.valor := '';
      vsqlAdicional := vsqlAdicional + ' and ' + tempSql;
    end;

    if Length(vCons.vComContrato) = 1 then
      if vCons.vComContrato[0] = ccSim then
        vsqlAdicional := vsqlAdicional + ' and anotacoes.TP_CONTR = ''C'''
      else
        vsqlAdicional := vsqlAdicional + ' and anotacoes.TP_CONTR = ''S''';

    if Length(vCons.vTipoContato) = 1 then
      if vCons.vTipoContato[0] = tcDireto then
        vsqlAdicional := vsqlAdicional + ' and anotacoes.TP_ATEND = ''D'''
      else
        vsqlAdicional := vsqlAdicional + ' and anotacoes.TP_ATEND = ''T''';

    if Length(vCons.vTipo) > 0 then
    begin
      tempSqlTipo := '';
      for I := 0 to Length(vCons.vTipo) - 1 do
      begin
        tempSql := '';
        case vCons.vTipo[i] of
          ctAtendimento: tempSql := tempSql + 'anotacoes.TIPO = ''Atendimento''';
          ctCurriculum: tempSql := tempSql + 'anotacoes.TIPO = ''Curriculum''';
          ctRecado: tempSql := tempSql + 'anotacoes.TIPO = ''Recado''';
          ctReclamacao: tempSql := tempSql + 'anotacoes.TIPO = ''Reclamação''';
          ctSaida: tempSql := tempSql + 'anotacoes.TIPO = ''Saída''';
          ctSugestao: tempSql := tempSql + 'anotacoes.TIPO = ''Sugestão''';
          ctVisitaSuporte: tempSql := tempSql + 'anotacoes.TIPO = ''VisitaSuporte''';
          ctVisitaVenda: tempSql := tempSql + 'anotacoes.TIPO = ''VisitaVenda''';
        end;
        if Length(vCons.vTipo) > 1 then
          tempSqlTipo := tempSqlTipo + ' (' + tempSql + ') or'
        else
          tempSqlTipo := tempSqlTipo + ' and ' + tempSql;
      end;
      if Length(vCons.vTipo) > 1 then
        vsqlAdicional := vsqlAdicional + ' and (' + Copy(tempSqlTipo, 1, length(tempSqlTipo) - 2) + ')'
      else
        vsqlAdicional := vsqlAdicional + tempSqlTipo;
    end;

    if Copy(vsqlAdicional, 1, 4) = ' and' then
      vsqlAdicional := Copy(vsqlAdicional, 5, length(vsqlAdicional));;



//    if vCons.campo = 'Todos' then
//      vsqlAdicional := vsqlAdicional + ' order by lancamentos.cod_lanc ';

//    if vCons.porData then
//      result := ConsultaCampos('ANOTACOES', vCons.campo, 'ANOTACOES.CODIGO', vCons.dataIni,
//        vCons.dataFim, vsqlAdicional, vDadosIni.codEmpresa)
//    else
//      result := ConsultaCampos('ANOTACOES', vCons.valor, vCons.campo, vCons.condicao,
//        'ANOTACOES.CODIGO', vsqlAdicional, False, vDadosIni.codEmpresa);

    if vCons.porData then
      Result := ConsultaCampos('ANOTACOES', vCons.campo, 'ANOTACOES.CODIGO', vCons.dataIni, vCons.dataFim, vDadosIni.codEmpresa, 1,
        'anotacoes.*, clientes.nome_cliente, clientes.razao, clientes.cpfcgc, col1.nome_vendedor colab_atend, col2.nome_vendedor colab_status, ss.nome_soft ',
        ' left join clientes on clientes.cod_cliente = anotacoes.cod_cliente and clientes.cod_empresa = anotacoes.cod_empresa' +
        ' left join colaborador col1 on col1.cod_vendedor = anotacoes.cod_usuario and col1.cod_empresa = anotacoes.cod_empresa' +
        ' left join colaborador col2 on col2.cod_vendedor = anotacoes.us_status and col2.cod_empresa = anotacoes.cod_empresa' +
        ' left join softwares_suporte ss on ss.cod_soft = anotacoes.cod_soft and ss.cod_empresa = anotacoes.cod_empresa',
        vsqlAdicional)
    else
      result := ConsultaCampos('ANOTACOES', vCons.valor, vCons.campo, vCons.condicao, 'ANOTACOES.CODIGO', True, vDadosIni.codEmpresa,
        'anotacoes.*, clientes.nome_cliente, clientes.razao, clientes.cpfcgc, col1.nome_vendedor colab_atend, col2.nome_vendedor colab_status, ss.nome_soft ',
        ' left join clientes on clientes.cod_cliente = anotacoes.cod_cliente and clientes.cod_empresa = anotacoes.cod_empresa' +
        ' left join colaborador col1 on col1.cod_vendedor = anotacoes.cod_usuario and col1.cod_empresa = anotacoes.cod_empresa' +
        ' left join colaborador col2 on col2.cod_vendedor = anotacoes.us_status and col2.cod_empresa = anotacoes.cod_empresa' +
        ' left join softwares_suporte ss on ss.cod_soft = anotacoes.cod_soft and ss.cod_empresa = anotacoes.cod_empresa',
        vsqlAdicional);

    if (dataSet.FieldByName('cod_soft').Visible) and (vDadosIni.vEmp.vCNPJ = '03530705000109') then
      dataSet.FieldByName('cod_soft').Visible := False;
  finally

  end;
end;

function TFlw_Anotacoes._existeCliente(pAtribuirNome: Boolean; pPesquisa: CPesquisaCliente ): Boolean;
begin
  Result := False;
  try

    if pPesquisa = pcNome then
    begin
      if (not (dataSet.State in [dsEdit, dsInsert])) then
        Exit;

      buscas.Close;
      buscas.SQL.Text := 'select c.cod_cliente "Codigo", c.nome_cliente "Nome Cliente", c.razao "Razao Social", c.cpfcgc "CPF/CNPJ",' +
        ' c.cidade "Cidade", c.contato "Contato", c.fone_cliente "Telefone", c.email "email"' +
        ' from clientes c' +
        ' where c.cod_empresa = ' + vDadosIni.codEmpresa;
        if fRazaoSocial then
          buscas.SQL.Text := buscas.SQL.Text + ' and c.razao like ' + QuotedStr(Trim(dataSet.FieldByName('nome_cl').AsString) + '%')
        else
          buscas.SQL.Text := buscas.SQL.Text + ' and c.nome_cliente like ' + QuotedStr(Trim(dataSet.FieldByName('nome_cl').AsString) + '%');
      buscas.Open;

      buscas.FetchAll;

      if buscas.RecordCount = 0 then
      begin
        Result := False;
        Exit;
      end
      else if buscas.RecordCount = 1 then
        dataSet.FieldByName('cod_cliente').AsInteger := buscas.FieldByName('Codigo').AsInteger
      else
      begin
        if abreFormClientes then
          dataSet.FieldByName('cod_cliente').AsInteger := buscas.FieldByName('Codigo').AsInteger
        else
          Exit;
      end;
    end;  

    buscas.Close;
    buscas.SQL.Text := 'select c.nome_cliente, c.razao, c.contato, c.fone_cliente, c.email, cc.status from clientes c' +
      ' left join clientes_com_contrato cc on cc.cod_cliente = c.cod_cliente and cc.cod_empresa = c.cod_empresa and cc.status <> ''Rescindido''' +
      ' where c.cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
      ' and c.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    Result := not buscas.IsEmpty;

    if not Result then
      Exit;

    if pAtribuirNome then
      if dataSet.State in [dsEdit, dsInsert] then
      begin
        if RazaoSocial then
          dataSet.FieldByName('nome_cl').AsString :=
            Trim(buscas.FieldByName('razao').AsString)
        else
          dataSet.FieldByName('nome_cl').AsString :=
            Trim(buscas.FieldByName('nome_cliente').AsString);

        dataSet.FieldByName('contato').AsString :=
          copy(Trim(buscas.FieldByName('contato').AsString),1,40);
        dataSet.FieldByName('email').AsString :=
          copy(Trim(buscas.FieldByName('email').AsString),1,30);
        dataSet.FieldByName('fone').AsString :=
          copy(Trim(buscas.FieldByName('fone_cliente').AsString),1,13);

        buscas.Close;
        buscas.SQL.Text := 'select cc.status from clientes_com_contrato cc' +
          ' where cc.status <> ''Rescindido''' +
          ' and cc.cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
          ' and cc.cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if Trim(buscas.FieldByName('status').AsString) <> '' then
          dataSet.FieldByName('TP_CONTR_D').AsString := 'Com Contrato'
        else
          dataSet.FieldByName('TP_CONTR_D').AsString := 'Sem Contrato';
      end;
  finally
    if not Result then
      Application.MessageBox('Cliente não encontrado no cadastro', 'Atenção', 0 + 64);
  end;
end;

function TFlw_Anotacoes._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 CODIGO from ANOTACOES' +
    ' where CODIGO > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TFlw_Anotacoes._restaurarRegistroDaLixeira(pSomenteSelecionados: Boolean): Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  try
    if pSomenteSelecionados then
    begin
      dataSet.Filter := 'SEL = ''S''';
      dataSet.Filtered := True;

      if dataSet.RecordCount = 0 then
      begin
        Application.MessageBox('Nenhum registro selecionado', 'Anteção', 0 + 64);
        Exit;
      end;
    end;

    if dataSet.FieldByName('ativo').asInteger = 1 then
    begin
      Application.MessageBox('Registro não está na lixeira para ser restaurado', 'Anteção', 0 + 64);
      Exit;
    end;

    if pSomenteSelecionados then
      if not vDadosIni.PesqPros('CRM087', 'RESTAURAR', 'REGISTROS SELECIONADOS', 'ANOTACOES', '', buscas, True) then
        exit;

    if not pSomenteSelecionados then
      if not vDadosIni.PesqPros('CRM087', 'RESTAURAR', 'CODIGO ' + dataSet.FieldByName('CODIGO').AsString, 'ANOTACOES',
        dataSet.FieldByName('CODIGO').AsString, buscas, True) then
        exit;

    if pSomenteSelecionados then
      if Application.MessageBox('Tem certeza que deseja restaurar registros selecionados da Lixeira?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
        Exit;

    if not pSomenteSelecionados then
      if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
        Exit;

    if pSomenteSelecionados then
    begin
      try
        dataSet.First;
        while not dataSet.Eof do
        begin
          buscas.Close;
          buscas.SQL.Text := 'update anotacoes set ativo = 1' +
            ' where codigo = ' + IntToStr(dataSet.FieldByName('codigo').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.ExecSQL;

          vDadosIni.GravaAuditoria('CRM087', 'RESTAURAR', 'CODIGO ' + dataSet.FieldByName('CODIGO').AsString, 'ANOTACOES',
            dataSet.FieldByName('CODIGO').AsString, buscas);

          dataSet.Next;
        end;

        if CommitaTransacao then
          vDadosIni.GravaAuditoria('CRM087', 'RESTAURAR', 'SUCESSO', 'ANOTACOES', dataSet.FieldByName('CODIGO').AsString, buscas)
        else
        begin
          RollBackTransacao;
          vDadosIni.GravaAuditoria('CRM087', 'RESTAURAR', 'FALHA', 'ANOTACOES', dataSet.FieldByName('CODIGO').AsString, buscas);
        end;
      except
        on E: Exception do
        begin   
          RollBackTransacao;
          vDadosIni.GravaAuditoria('CRM087', 'RESTAURAR', 'FALHA', 'ANOTACOES', dataSet.FieldByName('CODIGO').AsString, buscas);
          Exit;
        end;
      end;
    end
    else
    begin
      dataSet.Edit;
      dataSet.FieldByName('Ativo').asString := '1';
      result := inherited Post;
      if Apply then
      begin
        CommitaTransacao;
        vDadosIni.GravaAuditoria('CRM087', 'RESTAURAR', 'SUCESSO', 'ANOTACOES', dataSet.FieldByName('CODIGO').AsString, buscas);
      end
      else
      begin
        RollBackTransacao;
        vDadosIni.GravaAuditoria('CRM087', 'RESTAURAR', 'FALHA', 'ANOTACOES', dataSet.FieldByName('CODIGO').AsString, buscas);
      end;
    end;
    Result := true;
    Refresh;
  finally
    if pSomenteSelecionados then
    begin
      dataSet.Filtered := False;
      dataSet.Filter := '';
    end;
  end;
end;

function TFlw_Anotacoes._verLixeira: Boolean;
begin
  if not vDadosIni.PesqPros('CRM086', 'VER LIXEIRA', '', 'ANOTACOES', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select anotacoes.*, clientes.nome_cliente, clientes.razao, clientes.cpfcgc, col1.nome_vendedor colab_atend, col2.nome_vendedor colab_status, ss.nome_soft from anotacoes' +
    ' left join clientes on clientes.cod_cliente = anotacoes.cod_cliente and clientes.cod_empresa = anotacoes.cod_empresa' +
    ' left join colaborador col1 on col1.cod_vendedor = anotacoes.cod_usuario and col1.cod_empresa = anotacoes.cod_empresa' +
    ' left join colaborador col2 on col2.cod_vendedor = anotacoes.us_status and col2.cod_empresa = anotacoes.cod_empresa' +
    ' left join softwares_suporte ss on ss.cod_soft = anotacoes.cod_soft and ss.cod_empresa = anotacoes.cod_empresa' +
    ' where anotacoes.ativo = 0 and anotacoes.cod_empresa = 1');

  Result := not dataSet.IsEmpty;
end;

{ TFlw_TipoAnotacoes }

function TFlw_TipoAnotacoes.abreFormAssunto: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Assunto';

    frmCadAnotacoes.pnCadAssunto.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [biSystemMenu];

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadAnotacoes.pnCadAssunto.Parent := frmCadAnotacoes.tsAssunto;
    frmCadAnotacoes.DataSource1.DataSet := nil;
    formulario.Free;
    formulario := nil;
  end;

end;

function TFlw_TipoAnotacoes.abreTodos: Boolean;
begin
  Result := montaSelect('select * from TIPO_ANOTACOES_WEB order by DESCRICAO_TIPOANOT');
end;

function TFlw_TipoAnotacoes.alterarAssunto: Boolean;
var
  vCodTpAssunto: Integer;
begin
  if not vDadosIni.PesqPros('CRM089', 'ALTERAR', '', 'TIPO_ANOTACOES_WEB', '', buscas, False) then
    Exit;

  try

    if Trim(fDescricaoAssunto) = '' then
      raiseExceptionCreate('Assunto não informado', '');

    buscas.Close;
    buscas.SQL.Text := 'select * from TIPO_ANOTACOES_WEB' +
      ' where DESCRICAO_TIPOANOT = ' +QuotedStr(Trim(fDescricaoAssunto)) +
      ' and COD_TIPOANOT <> ' + IntToStr(dataSet.FieldbyName('COD_TIPOANOT').AsInteger);
    buscas.Open;

    if not buscas.IsEmpty then
      raiseExceptionCreate('Assunto informado já existe', '');

    vCodTpAssunto := dataSet.FieldbyName('COD_TIPOANOT').AsInteger;

    buscas.Close;
    buscas.SQL.Text := 'update TIPO_ANOTACOES_WEB set DESCRICAO_TIPOANOT = ' + QuotedStr(Copy(fDescricaoAssunto,1,60)) +
      ' where COD_TIPOANOT = ' + IntToStr(vCodTpAssunto);
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    Result := True;

    Application.MessageBox('Assunto alterado com sucesso', 'Atenção', 0 + 64);

    dataSet.Refresh;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao alterar Assunto. Erro: ' + e.Message),
        'Atenção', 0 + 64);
      registraErro('Erro: ' + e.Message);
    end;
  end;
end;

constructor TFlw_TipoAnotacoes.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsTipoAnot);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
end;

function TFlw_TipoAnotacoes.incluirAssunto: Boolean;
var
  vCodTpAssunto: Integer;
begin
  if not vDadosIni.PesqPros('CRM088', 'INCLUIR', '', 'TIPO_ANOTACOES_WEB', '', buscas, False) then
    Exit;

  try

    if Trim(fDescricaoAssunto) = '' then
      raiseExceptionCreate('Assunto não informado', '');

    buscas.Close;
    buscas.SQL.Text := 'select * from TIPO_ANOTACOES_WEB' +
      ' where DESCRICAO_TIPOANOT = ' +QuotedStr(Trim(fDescricaoAssunto));
    buscas.Open;
    if not buscas.IsEmpty then
      raiseExceptionCreate('Assunto informado já existe', '');

    buscas.Close;
    buscas.SQL.Text := 'SELECT GEN_ID(INC_COD_TIPOANOT,1) codigo FROM RDB$DATABASE';
    buscas.Open;

    vCodTpAssunto := buscas.FieldbyName('codigo').AsInteger;

    buscas.Close;
    buscas.SQL.Text := 'insert into TIPO_ANOTACOES_WEB (COD_TIPOANOT, DESCRICAO_TIPOANOT)' +
      ' values (' + IntToStr(vCodTpAssunto) + ', ' + QuotedStr(Copy(fDescricaoAssunto,1,60)) + ')';
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    Result := True;

    Application.MessageBox('Assunto cadastrado com sucesso', 'Atenção', 0 + 64);

    dataSet.Refresh;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao incluir Assunto. Erro: ' + e.Message),
        'Atenção', 0 + 64);
      registraErro('Erro: ' + e.Message);
    end;
  end;
end;

{ TFlw_ImportarPesquisa_TipoVendas }

constructor TFlw_ImportarPesquisa_TipoVendas.create(pTipo: string);
begin
  if pTipo = 'REQ' then
    dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsTVReq)
  else
    dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsTVOS);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
  fTipo := pTipo

end;

function TFlw_ImportarPesquisa_TipoVendas._abreTodos: Boolean;
begin
  Result := montaSelect('select tv.tipo tipo_vendas,  case when tv.tipo = ''REQ'' then tv.sigla else tv.tipo_os end tipo,' +
    ' tv.descricao' +
    ' from tipo_vendas tv' +
    ' where tv.tipo = ' + QuotedStr(fTipo) +
    ' union'+
    ' select ''***'', ''TODOS'', ''TODOS'' from rdb$database' +
    ' order by 1,2,3');
end;

{ TFlw_SoftwareSuporte }

function TFlw_SoftwareSuporte.abreFormSoftware: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Softwares';

    frmCadAnotacoes.pnSoft.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [biSystemMenu];

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadAnotacoes.pnSoft.Parent := frmCadAnotacoes.tsSoft;
    frmCadAnotacoes.DataSource1.DataSet := nil;
    formulario.Free;
    formulario := nil;
  end;
end;

function TFlw_SoftwareSuporte.abreTodos: Boolean;
begin
  Result := montaSelect('select * from softwares_suporte where ativo = 1 order by nome_soft');
end;

function TFlw_SoftwareSuporte.alterarSoftware: Boolean;
var
  vCodSoftware: Integer;
begin
  if not vDadosIni.PesqPros('CRM092', 'ALTERAR', '', 'SOFTWARES_SUPORTE', '', buscas, False) then
    Exit;

  try

    if Trim(fNomeSoftware) = '' then
      raiseExceptionCreate('Nome do Software não informado', '');

    buscas.Close;
    buscas.SQL.Text := 'select * from SOFTWARES_SUPORTE' +
      ' where NOME_SOFT = ' +QuotedStr(Trim(fNomeSoftware)) +
      ' and COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and COD_SOFT <> ' + IntToStr(dataSet.FieldbyName('COD_SOFT').AsInteger);
    buscas.Open;

    if not buscas.IsEmpty then
      raiseExceptionCreate('Nome do Software informado já existe', '');

    vCodSoftware := dataSet.FieldbyName('COD_SOFT').AsInteger;

    buscas.Close;
    buscas.SQL.Text := 'update SOFTWARES_SUPORTE set NOME_SOFT = ' + QuotedStr(Copy(fNomeSoftware,1,32)) +
      ' where COD_SOFT = ' + IntToStr(vCodSoftware) + ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    Result := True;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    Application.MessageBox('Software alterado com sucesso', 'Atenção', 0 + 64);

    dataSet.Refresh;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao alterar Assunto. Erro: ' + e.Message),
        'Atenção', 0 + 64);
      registraErro('Erro: ' + e.Message);
    end;
  end;
end;

constructor TFlw_SoftwareSuporte.create;
begin
  dataSet := TClientDataSet(dtmFollowUpPosAtendimento.cdsSoft);
  transacao := TIBTransaction(dtmFollowUpPosAtendimento.transacao);
  buscas := TIBQuery(dtmFollowUpPosAtendimento.qrBuscas);
end;

function TFlw_SoftwareSuporte.incluirSoftware: Boolean;
var
  vCodSoftware: Integer;
begin
  if not vDadosIni.PesqPros('CRM091', 'INCLUIR', '', 'SOFTWARES_SUPORTE', '', buscas, False) then
    Exit;

  try

    if Trim(fNomeSoftware) = '' then
      raiseExceptionCreate('Nome do Software não informado', '');

    buscas.Close;
    buscas.SQL.Text := 'select * from SOFTWARES_SUPORTE ' +
      ' where NOME_SOFT = ' +QuotedStr(Trim(fNomeSoftware));
    buscas.Open;
    if not buscas.IsEmpty then
      raiseExceptionCreate('Nome do Software informado já existe', '');

    vCodSoftware := Gencodigo('SOFTWARES_SUPORTE', dtmFollowUpPosAtendimento.SpIncCodigo, vDadosIni.codEmpresa);

    buscas.Close;
    buscas.SQL.Text := 'insert into SOFTWARES_SUPORTE (COD_SOFT, COD_EMPRESA, NOME_SOFT)' +
      ' values (' + IntToStr(vCodSoftware) + ', ' + vDadosIni.codEmpresa + ', ' + QuotedStr(Copy(fNomeSoftware,1,60)) + ')';
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    Result := True;

    Application.MessageBox('Software cadastrado com sucesso', 'Atenção', 0 + 64);

    dataSet.Refresh;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao incluir Software. Erro: ' + e.Message),
        'Atenção', 0 + 64);
      registraErro('Erro: ' + e.Message);
    end;
  end;
end;

end.
