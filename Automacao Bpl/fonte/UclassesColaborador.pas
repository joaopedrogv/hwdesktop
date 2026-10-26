unit UclassesColaborador;

interface

uses
  uDataSet_OOP, DBClient, DB,RDPrint,Math, CheckLst, StdCtrls, Mask, Buttons;

type
  RJornadaTrabalhoDia = record
    segunda: boolean;
    terca: boolean;
    quarta: boolean;
    quinta: boolean;
    sexta: boolean;
    sabado: boolean;
    domingo: boolean;
  end;

  RCalendEscalaDia = record
  	segunda: boolean;
    segundahoraini, segundahorafim: string;
    terca: boolean;
    tercahoraini, tercahorafim: string;
    quarta: boolean;
    quartahoraini, quartahorafim: string;
    quinta: boolean;
    quintahoraini, quintahorafim: string;
    sexta: boolean;
    sextahoraini, sextahorafim: string;
    sabado: boolean;
    sabadohoraini, sabadohorafim: string;
    domingo: boolean;
    domingohoraini, domingohorafim: string;
  end;

  TColaborador = class;
  TCalendColaboradorExc = class;
  TCalendEscalaSemanalDia = class;
  TCalendEscalaSemanal = class;
  TJornadaTrabalho = class;
  TColaboradorContatoMsg = class;
  TColaboradorContatoMsgTipoContato = class;
  TFuncoes = class;
  Tperfil_comissao = class;
  TPerfil_colab = class;
  TIncidencia = class;
  TIncidenciaColab = class;
  TLancDebitoCredito = class;
  TTipoLancDebCred = class;
  TListaColabDC = class;
  TParticipante = class;

  TDeptoFuncao = class(TDataSet_OOP)
  public
    constructor create;
    function abreDepto: boolean;
  end;

  TFuncoes = class(TDataSet_OOP)
  private
    procedure renconciliaErro(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  public
    destructor Destroy; override;
    constructor create;
    function delete: boolean; override;
    function restaurarLixeira: boolean;
    function abreFuncoes: boolean;
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    procedure CadFuncao(TipoForm: integer);
    procedure RelatorioFuncoes;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
  var
    vDepto: TDeptoFuncao;
    ultimasql: string;
  end;

  TPerfil_comissao = class(TDataSet_OOP)
  public
    constructor create;
    function abrePerfil_comissao: boolean;
  end;

  TPerfil_colab = class(TDataSet_OOP)
  public
    constructor create;
    function abrePerfil_colab(cod_colab: integer): boolean;
    function insert(datasetColab: TColaborador): boolean;
    function post: boolean;
    function delete: boolean; override;
  var
    vcolaborador: TColaborador;
    vPerfil_Comissao: Tperfil_comissao;
    Perfil_colabModificou: boolean;
  end;

  TIncidencia = class(TDataSet_OOP)
  public
    constructor create;
    function abreIncidencia: boolean;
  end;

  TIncidenciaColab = class(TDataSet_OOP)
  public
    constructor create;
    function abreIcidenciaColab(cod_colab: integer): boolean;
    function insert(datasetColab: TColaborador): boolean;
    function post: boolean; override;
    function delete: boolean; override;
  var
    vColaborador: TColaborador;
    vIncidencia: TIncidencia;
    IncidenciaColabModificou: boolean;
  end;

  TCidadesColab = class(TDataSet_OOP)
  public
    constructor create;
    function abreCidade: boolean;
  end;

  TUFColab = class(TDataSet_OOP)
  public
    constructor create;
    function abreUF: boolean;
  end;
  TBairroColab = class(TDataSet_OOP)
  public
    constructor create;
    function abreBairro: boolean;
  end;

  TGerenteColab = class(TDataSet_OOP)
  public
    constructor create;
    function abreGerente: Boolean;
  end;

  TParticipante = class(TDataSet_OOP)
  private
  	procedure renconciliaErro(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  public 
    destructor Destroy; override;
    constructor create;
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function AbreParticipante: boolean;
    procedure CadParticipante(TipoForm: integer);
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function restaurarLixeira: boolean;
    function delete: boolean; override;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
  	vCidades: TCidadesColab;
    vUF: TUFColab;
    vBairro: TBairroColab;
    ultimasql: string;
  end;

  TTipo_Contato = class(TDataSet_OOP)
  public
    function Post: Boolean; override;
    function Delete: Boolean; override;

    function Abrir: TTipo_Contato;
  end;

  TAplicativo_Msg = class(TDataSet_OOP)
  public
  	function Abrir: TAplicativo_Msg;
  end;

  TColaboradorContatoMsg = class(TDataSet_OOP)
  private
  	FID: Integer;
    FOwner: TColaborador;
    FAplicativo: TAplicativo_Msg;
    FTipo: TTipo_Contato;
    FContatoMsgTipoContrato: TColaboradorContatoMsgTipoContato;
    procedure DataSetGetTextAplicativo(Sender: TField; var Text: string; DisplayText: Boolean);
  public
  	constructor Create(AOwer: TColaborador);
    destructor Destroy; override;
    function Apply: Boolean; override;
		function Post(pCk_contrato_pla_tipos_contato: TCheckListBox): Boolean; //override;
    function Delete: Boolean; override;

    function Abrir: TColaboradorContatoMsg;

    procedure InserirTipoContato(pCk_contrato_pla_tipos_contato: TCheckListBox);
    procedure EditarTipoContato(pCk_contrato_pla_tipos_contato: TCheckListBox);

    function KeyAudit: string;
    function DataAudit: string;

    property Aplicativo: TAplicativo_Msg read FAplicativo write FAplicativo;
    property Tipo: TTipo_Contato read FTipo write FTipo;
  end;

  TColaboradorContatoMsgTipoContato = class(TDataSet_OOP)
  private
  	FOwner: TColaboradorContatoMsg;
  public
    FtempContatoMsgTipoContato: TClientDataSet;
  	constructor Create(AOwer: TColaboradorContatoMsg);
    function Apply: Boolean; override;
    function Post(pCk_contrato_pla_tipos_contato: TCheckListBox): Boolean; overload;//override;
    function Post(pId: Integer): Boolean; overload;//override;

    function Abrir: TColaboradorContatoMsgTipoContato; overload;
    function Abrir(pIdMensContato: Integer): TColaboradorContatoMsgTipoContato; overload;
    function Abrir(pIdMensContato: Integer; pIdTipoContato: Integer): TColaboradorContatoMsgTipoContato; overload;
  end;

  TJornadaTrabalhoColab = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreJornadaTrabalho: Boolean;
    function BuscarJornadaTrabalho(pCodJornadaTrabalho: Integer; pExibirMensagem: Boolean = True): Boolean;
  end;

  TEscalaSemanalColab = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreEscalaSemanal: Boolean;
    function BuscarEscalaSemanal(pCodEscalaSemanal: Integer; pExibirMensagem: Boolean = True): Boolean;
  end;

  TColaborador = class(TDataSet_OOP)
  private
    FContatoMsg: TColaboradorContatoMsg;
    procedure renconciliaErro(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
  public
    destructor Destroy; override;
    constructor create;
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function AbreColaborador: boolean;
    procedure CadColab(TipoForm: integer);
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function restaurarLixeira: boolean;
    function delete: boolean; override;
    function extrato_conta(pdti,pdtf:TDateTime;pImprimirExtrao:boolean=false):boolean;
    function abreFormSaldoExtrato: Boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
    function cadColaboradorHwCloud(pCodVendedor: Integer): Boolean;

    property ContatoMsg: TColaboradorContatoMsg read FContatoMsg write FContatoMsg;
  var
    cadFuncao: TFuncoes;
    CadPerfil_Comissao: TPerfil_comissao;
    cadPerfil_colab: TPerfil_colab;
    cadIncidencia: TIncidencia;
    cadIncidenciaColab: TIncidenciaColab;
    vCidades: TCidadesColab;
    vUF: TUFColab;
    vBairro: TBairroColab;
    vGerente: TGerenteColab;
    vJornadaTrabalho: TJornadaTrabalhoColab;
    vEscalaSemanal: TEscalaSemanalColab;
    ultimasql: string;
  end;

  TColaboradorCalendColaboradorExc = class(TDataSet_OOP)
  private
  public
    constructor create;
    function AbreColaboradorCalendColaboradorExc(pCodColaborador: Integer): boolean;
    function BuscarColaborador(pCodColaborador: Integer; pExibirMensagem: Boolean = True): Boolean;
  end;

  TCalendColaboradorExc = class(TDataSet_OOP)
  private
  public
    destructor Destroy; override;
    constructor create;
    function insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function post: boolean; override;
    procedure _cadCalendColaboradorExc(pTipoForm: Integer);
  var
    ColaboradorCalendColaboradorExc: TColaboradorCalendColaboradorExc;
  end;

  TCalendEscalaSemanalDia = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreCalendEscalaSemanalDia(pCodigo: Integer): boolean; overload;
    function abreCalendEscalaSemanalDia(
    	pCodigo: Integer;
      pDiaSemana: Integer): boolean; overload;
  end;

  TCalendEscalaSemanal = class(TDataSet_OOP)
  private
  public
    destructor Destroy; override;
    constructor create;
    function insert: boolean; override;
    function edit: boolean; override;
    function delete: boolean; override;
    function post: boolean; override;
    procedure _cadCalendEscalaSemanal(pTipoForm: Integer);
    procedure obterDiaSemana(
      pDiaSemana: Integer;
      ckDiaSemana: TCheckBox;
      mkHoraIni: TMaskEdit;
      mkHoraFim: TMaskEdit;
      spButton: TSpeedButton);
    function atualizarDiaSemana: boolean;
  var
    vCalendEscalaSemanalDia: TCalendEscalaSemanalDia;
    vCalendEscalaDia: RCalendEscalaDia;
  end;

  TJornadaTrabalho = class(TDataSet_OOP)
  private
  public
    constructor create;
    function insert: boolean; override;
    function edit: boolean; override;
    function delete: boolean; override;
    function post: boolean; override;
    procedure _cadJornadaTrabalho(pTipoForm: Integer);
    procedure obterDiaSemana(
      pDiaSemana: Integer;
      ckDiaSemana: TCheckBox);
  var
    vJornadaTrabalhoDia: RJornadaTrabalhoDia;
  end;

  TLancDebitoCredito = class(TDataSet_OOP)
  private
  public
    destructor Destroy; override;
    constructor create;
    function insert: boolean; override;
    function post: boolean; override;
    function creditoPorCumprimentoMeta(pMes,pAno:string): boolean;
    procedure CadLancDebCred(TipoForm: integer);
    function delete: boolean; override;
  var
    vTipoLancDC: TTipoLancDebCred;
    vListaColab: TListaColabDC;
    ultimasql, vsqlAdicional: string;
  end;

  TTipoLancDebCred = class(TDataSet_OOP)
  private
  public
    constructor create;
    function ListaTipoLancDC: boolean;
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function delete: boolean; override;
  var
  end;

  TListaColabDC = class(TDataSet_OOP)
  private
  public
    constructor create;
    function ListaColabDC: boolean;
  var
  end;


implementation

uses
  uDtmColaborador, IBQuery, IBDatabase, SysUtils, uDtmAtivo,
  uDadosIni, Forms, Windows, uCadFuncoes, ucadColaborador,UClassesCadastrosBasicos,
  UCadDebitoCredito,uPadrao, Controls,DateUtils, IBCustomDataSet, 
  Classes, ucadParticipante, hw_utils, uCadCalendColaboradorExc, 
  uCadCalendEscalaSemanal, Variants, StrUtils, uCadJornadaTrabalho;

function hwc_cad_pessoa(AparamsList: WideString; Acodcliente: Integer; Atipocliente: WideString; Aativo: Integer; Atipoop: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';
function hwc_cad_contato(AparamsList: WideString; Aidcontato: Integer; Acodcliente: Integer; Aativo: Integer; Aplataforma: WideString; Acoduserplataforma: WideString; Acontato: WideString; Atipocliente: WideString; Atipoop: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';

{ TFuncoes }

function TFuncoes.abreFuncoes: boolean;
begin
  Result := montaSelect('select * from funcoes where ativo = 1');
end;

function TFuncoes.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect(ultimasql);
    result := false;
  end
  else
    result := montaSelect('SELECT * FROM funcoes WHERE ativo = 0');
end;

procedure TFuncoes.CadFuncao(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  if FrmCadFuncoes = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TfrmCadFuncoes, frmCadFuncoes);
  end;

  if (TipoForm > 0) and (not frmCadFuncoes.Visible) then
    frmCadFuncoes.ShowModal
  else if (not frmCadFuncoes.Visible) then
    frmCadFuncoes.Show
  else if frmCadFuncoes.FormStyle = fsMDIChild then
    frmCadFuncoes.Show
  else
    frmCadFuncoes.ShowModal;
end;

constructor TFuncoes.create;
begin
  dataSet := TClientDataSet(dtmColaborador.cdsFuncao);
  buscas := tibquery(dtmColaborador.qrBuscasFunc);
  transacao := tibtransaction(dtmColaborador.transacaoFuncoes);
  vDepto := TDeptoFuncao.create;
  montaSelect('select * from funcoes where 1=0');
end;

function TFuncoes.delete: boolean;
var
  vApagar: boolean;
	codFunc, descricaoFunc: string;
  vtemp: string;
begin
	try
    Result := False;
    if dataSet.IsEmpty then
      exit;

    try
      vApagar := dataSet.FieldByName('ATIVO').AsInteger <> 1;
      codFunc := dataSet.FieldByName('COD_FUNCAO').AsString;
	    descricaoFunc := dataSet.FieldByName('DESC_FUNCAO').AsString;

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vApagar := dataSet.FieldByName('ATIVO').AsInteger <> 1;
        codFunc := '';
        descricaoFunc := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
      if (trim(codFunc) <> '') then
        prepare_loop('COD_FUNCAO = ' + codFunc)
      else
        prepare_loop('SEL = ''S''');

      if vApagar then
      begin
        vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
          'FUNÇÃO' + #13 +
          'Código: ' + codFunc + #13 +
          'Descrição: ' + descricaoFunc;

        if (trim(descricaoFunc) = '') then
          vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

        if not vDadosIni.PesqPros('COL021', '', '', 'FUNCOES',
          vDadosIni.IfThen(trim(codFunc) <> '', codFunc, ''), buscas, false) then
          exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
          exit;
      end
      else
      begin
        vtemp := 'Tem certeza que deseja mover este registro para a Lixeira?' + #13 + #13 +
          'FUNÇÃO' + #13 +
          'Código: ' + codFunc + #13 +
          'Descrição: ' + descricaoFunc;

        if (trim(descricaoFunc) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

        if not vDadosIni.PesqPros('COL021', '', '', 'FUNCOES',
          vDadosIni.IfThen(trim(codFunc) <> '', codFunc, ''), buscas, false) then
          exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
          exit;
      end;

      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo função(ões) permanentemente')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo função(ões) para lixeira');

      dataset.First;
      while not dataset.Eof do
      begin
        if vApagar then
          vDadosIni.abreStatusProcessamento('', 'Excluíndo função(ões) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
        else
          vDadosIni.abreStatusProcessamento('', 'Movendo função(ões) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        if vApagar then
        begin
        	SqlOpen(' select first 1 cod_vendedor, cod_empresa, nome_vendedor from colaborador ' +
          	' where cod_funcao = %d ',
           	[fint('cod_funcao')], buscas);

          if not buscas.IsEmpty then
          begin
            vtemp := 'Colaborador esta vinculado a essa função' +
              ', não é possível excluir.' + #13 + #13 +
              'COLABORADOR' + #13 +
              'Código: ' + buscas.FieldByName('COD_VENDEDOR').AsString + #13 +
              'Nome: ' + buscas.FieldByName('NOME_VENDEDOR').AsString + #13 +
              'Função: ' + dataSet.FieldByName('DESC_FUNCAO').AsString;

            Application.MessageBox(PChar(vtemp), 'Aviso', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
            RollBackTransacao;
            exit;
          end;


          SqlExec(' delete from funcoes ' +
            ' where cod_funcao = %d ',
            [fint('cod_funcao')], buscas);

          if (trim(codFunc) = '') then
            vDadosIni.GravaAuditoria('COL021', 'EXCLUIR', '', 'FUNCOES',
              dataSet.FieldByName('COD_FUNCAO').AsString, buscas);
        end
        else
        begin
          SqlExec(' update funcoes set ativo = 0 ' +
            ' where cod_funcao = %d ',
            [fint('cod_funcao')], buscas);

          if (trim(codFunc) = '') then
            vDadosIni.GravaAuditoria('COL021', 'EXCLUIR', '', 'FUNCOES',
              dataSet.FieldByName('COD_FUNCAO').AsString, buscas);
        end;

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;

    Result := CommitaTransacao;

    if Result then
    begin
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'COL021', 'COL021'),
        'EXCLUIR', 'SUCESSO', 'FUNCOES',
        vDadosIni.IfThen(trim(codFunc) <> '', codFunc, ''), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'COL021', 'COL021'),
        'EXCLUIR', 'FALHA', 'FUNCOES',
        vDadosIni.IfThen(trim(codFunc) <> '', codFunc, ''), buscas);
    end;

    if Result then
      Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

destructor TFuncoes.Destroy;
begin
  vDepto.buscas.Close;
  inherited;
end;

function TFuncoes.edit: boolean;
begin
  result := false;
  if IsEmpty then
    Exit;
  if inherited Edit then
  begin
    if not vDepto.buscas.Active then
      vDepto.abreDepto;
    Result := true;
  end;
end;

function TFuncoes.insert: boolean;
begin
  if not dataSet.Active then
    montaSelect('select * from funcoes where 1=0');

  if inherited insert then
  begin
    if not vDepto.buscas.Active then
      vDepto.abreDepto;
    dataSet.FieldByName('cod_funcao').AsInteger := 0;
    Result := true;
  end;
end;

function TFuncoes.post: boolean;
var
  acao: string;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;
    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if trim(dataSet.FieldByName('desc_funcao').AsString) = '' then
      raiseExceptionCreate('Descrição da função não informada', 'DBEdit2');  

    if dataSet.FieldByName('cod_depto').AsInteger <= 0 then
      raiseExceptionCreate('Departamento não informado', 'DBLookupComboBox1');

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := true;
      exit;
    end;

    if Result then
      Result := Apply;
    if Result then
      Result := CommitaTransacao;
    if Result then
      vDadosIni.GravaAuditoria('COL025', acao, 'SUCESSO', 'FUNCOES', dataSet.FieldByName('COD_FUNCAO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('COL025', acao, 'FALHA', 'FUNCOES', dataSet.FieldByName('COD_FUNCAO').AsString, buscas);
    //    Refresh;
    montaSelect(ultimasql);
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TFuncoes.RelatorioFuncoes;
begin
  frmCadFuncoes.qrpFuncoes.Preview;
end;

procedure TFuncoes.renconciliaErro(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  try
    if (Pos('FK_COLABORA_RELATION__FUNCOES', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso em Colaboradores', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;
  finally
    RollBackTransacao;
    Self.DataSet.CancelUpdates;
  end;

end;

function TFuncoes.restaurarLixeira: boolean;
var
	codFunc, descricaoFunc: string;
  vtemp: string;
begin
  try
    result := false;
    if dataSet.IsEmpty then
    	exit;

    if dataSet.FieldByName('ATIVO').asinteger <> 0 then
    begin
      Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
      codFunc := dataSet.FieldByName('COD_FUNCAO').AsString;
      descricaoFunc := dataSet.FieldByName('DESC_FUNCAO').AsString;

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        codFunc := '';
        descricaoFunc := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(codFunc) <> '') then
        prepare_loop('COD_FUNCAO = ' + codFunc)
      else
        prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
          'FUNÇÃO' + #13 +
          'Código: ' + codFunc + #13 +
          'Descrição: ' + descricaoFunc;

    	if (trim(codFunc) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('COL024', 'RESTAURAR', '', 'FUNCOES',
      	vDadosIni.IfThen(trim(codFunc) <> '', codFunc, ''), buscas, false) then
  				exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando função(ões)');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando função(ões) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update funcoes set ativo = 1 ' +
          ' where cod_funcao = %d ',
          [fint('cod_funcao')], buscas);

        if (trim(codFunc) = '') then
          vDadosIni.GravaAuditoria('COL024', 'RESTAURAR', '', 'FUNCOES',
            dataSet.FieldByName('COD_FUNCAO').AsString, buscas);

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    result := CommitaTransacao;

    if Result then
    begin
      vDadosIni.GravaAuditoria('COL024', 'RESTAURAR REGISTRO', 'SUCESSO', 'FUNCOES',
        vDadosIni.IfThen(trim(codFunc) <> '', codFunc, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
      vDadosIni.GravaAuditoria('COL024', 'RESTAURAR REGISTRO', 'FALHA', 'FUNCOES',
        vDadosIni.IfThen(trim(codFunc) <> '', codFunc, ''), buscas);
    end;                                  

    if Result then
    	Refresh;

  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TFuncoes.StatusLixeira: boolean;
begin
  result := ExecutaComandosSql('SELECT first 1 COD_FUNCAO FROM funcoes where ativo = 0');
end;

procedure TFuncoes._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFuncoes._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TFuncoes._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TColaborador }

function TColaborador.AbreColaborador: boolean;
begin
  Result := montaSelect(' select * from colaborador ' +
  	' where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 ');
end;

function TColaborador.abreFormSaldoExtrato: Boolean;
var
  formulario: TfrmPadrao;
begin
  result:=false;
  if not vDadosIni.PesqPros('COL034', 'EXIBIR', 'EXIBIR SALDO/EXTRADO: '+trim(dataSet.FieldByName('NOME_VENDEDOR').AsString),'COLABORADOR' , 'COD_VENDEDOR',
    obColaborador.buscas, True) then
    Exit;

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Escolha entre Saldo/Extrato';
    frmCadcolaborador.MaskEdit4.Text:=DateToStr(StartOfTheMonth(vDadosIni.getDataBanco(buscas)));
    frmCadcolaborador.MaskEdit5.Text:=DateToStr( EndOfTheMonth(vDadosIni.getDataBanco(buscas)));
    frmCadcolaborador.pnSaldoExtrato.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;

    result := (formulario.ShowModal = mrOk);
    if Result then
    begin
      if frmCadcolaborador.RadioGroup1.ItemIndex=0 then
        obColaborador.extrato_conta(strtodate(frmCadcolaborador.MaskEdit4.Text),strtodate(frmCadcolaborador.MaskEdit5.Text),false)
      else obColaborador.extrato_conta(strtodate(frmCadcolaborador.MaskEdit4.Text),strtodate(frmCadcolaborador.MaskEdit5.Text),true);
      vDadosIni.GravaAuditoria('COL034', 'IMPRIMIR', 'IMPRESSÃO CONFIRMADA: '+trim(dataSet.FieldByName('NOME_VENDEDOR').AsString),'COLABORADOR' , 'COD_VENDEDOR',buscas);
    end
    else
      vDadosIni.GravaAuditoria('COL034', 'IMPRIMIR', 'IMPRESSÃO NÃO CONFIRMADA: '+trim(dataSet.FieldByName('NOME_VENDEDOR').AsString),'COLABORADOR' , 'COD_VENDEDOR',buscas);

  finally
    frmCadcolaborador.pnSaldoExtrato.Parent := frmCadcolaborador.tsOutros;
    formulario.Free;
    formulario := nil;
  end;
end;

function TColaborador.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect(ultimasql);
    result := false;
  end
  else
    result := montaSelect(' select * from colaborador ' +
                          ' where cod_empresa = ' + vDadosIni.codEmpresa +
                          ' and ativo = 0 ');
end;

procedure TColaborador.CadColab(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);

  if frmCadcolaborador = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TfrmCadcolaborador, frmCadcolaborador);
  end;

  if (TipoForm > 0) and (not frmCadcolaborador.Visible) then
    frmCadcolaborador.ShowModal
  else if (not frmCadcolaborador.Visible) then
    frmCadcolaborador.Show
  else if frmCadcolaborador.FormStyle = fsMDIChild then
    frmCadcolaborador.Show
  else
    frmCadcolaborador.ShowModal;
end;

function TColaborador.cadColaboradorHwCloud(pCodVendedor: Integer): Boolean;
begin
  Result := False;

  try
    if trim(vDadosIni.retornaDadosHwCloudIA(buscas, True)) = '' then
      Exit;

    SqlOpen(
      ' select ' +
      ' colaborador.cod_vendedor, ' +
      ' colaborador.cod_empresa, ' +
      ' iif(colaborador.ativo = 1, 1, 0) ativo, ' +
      ' iif(colaborador.ativo = 99, ''D'', ''I'') tpop from colaborador ' +
      ' inner join funcoes on funcoes.cod_funcao = colaborador.cod_funcao ' +
      ' where colaborador.cod_vendedor = ' + IntToStr(pCodVendedor) +
      ' and colaborador.cod_empresa = ' + vDadosIni.codEmpresa,
      buscas);

    Result := hwc_cad_pessoa(
      Format(';databaseName=%s;empresaid=%s;silent=false;userHW=HW;userLevel=10',
             [vDadosIni.vBancoHW, vDadosIni.codEmpresa]),
      buscas.FieldByName('cod_vendedor').AsInteger,
      'CI',
      buscas.FieldByName('ativo').AsInteger,
      buscas.FieldByName('tpop').AsString
    );

    if Result then
    begin
      SqlOpen(
        ' select distinct ' +
        ' msg_contato.id, ' +
        ' msg_contato.cod_vendedor, ' +
        ' iif(colaborador.ativo = 99, ''D'', iif(msg_contato.ativo = 99, ''D'', ''I'')) tpop, ' +
        ' iif(colaborador.ativo = 0, 0, iif(msg_contato.ativo = 0, 0, 1)) ativo, ' +
        ' msg_plataforma.plataforma, ' +
        ' msg_contato.contato, ' +
        ' msg_contato.identificador from msg_contato ' +
        ' inner join colaborador on ' +
        '    colaborador.cod_vendedor = msg_contato.cod_vendedor ' +
        '    and colaborador.cod_empresa = msg_contato.cod_empresa ' +
        ' inner join msg_contato_tipo on ' +
        '    msg_contato_tipo.id_msg_contato = msg_contato.id ' +
        '    and msg_contato_tipo.cod_empresa = msg_contato.cod_empresa ' +
        ' inner join tipo_contato on ' +
        '    tipo_contato.id = msg_contato_tipo.id_tipo_contato ' +
        '    and tipo_contato.cod_empresa = msg_contato_tipo.cod_empresa ' +
        ' inner join msg_tipo_contato_origem on ' +
        '    msg_tipo_contato_origem.id_tipo_contato = msg_contato_tipo.id_tipo_contato ' +
        '    and msg_tipo_contato_origem.cod_empresa = msg_contato_tipo.cod_empresa ' +
        ' inner join msg_tipo_contato_origem_plat on ' +
        '    msg_tipo_contato_origem_plat.id_msg_tipo_contato_origem = msg_tipo_contato_origem.id ' +
        '    and msg_tipo_contato_origem_plat.cod_empresa = msg_tipo_contato_origem.cod_empresa ' +
        ' inner join msg_plataforma on ' +
        '    msg_plataforma.id = msg_tipo_contato_origem_plat.id_msg_plataforma ' +
        '    and msg_plataforma.cod_empresa = msg_tipo_contato_origem_plat.cod_empresa ' +
        ' inner join msg_aplicativo on ' +
        '    msg_aplicativo.id = msg_plataforma.id_msg_aplicativo ' +
        ' inner join msg_origem on ' +
        '    msg_origem.id = msg_tipo_contato_origem.id_msg_origem ' +
        ' where msg_contato.id_msg_aplicativo = msg_plataforma.id_msg_aplicativo ' +
        ' and msg_contato.cod_vendedor = ' + IntToStr(pCodVendedor) +
        ' and msg_contato.cod_empresa = ' + vDadosIni.codEmpresa,
        buscas);

      buscas.First;
      while not buscas.Eof do
      begin
        hwc_cad_contato(
          Format(';databaseName=%s;empresaid=%s;silent=false;userHW=HW;userLevel=10',
                 [vDadosIni.vBancoHW, vDadosIni.codEmpresa]),
          buscas.FieldByName('id').AsInteger,
          buscas.FieldByName('cod_vendedor').AsInteger,
          buscas.FieldByName('ativo').AsInteger,
          buscas.FieldByName('plataforma').AsString,
          buscas.FieldByName('identificador').AsString,
          buscas.FieldByName('contato').AsString,
          'CI',
          buscas.FieldByName('tpop').AsString
        );

        buscas.Next;
      end;
    end;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

constructor TColaborador.create;
begin
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsColab);
  buscas := tibquery(dtmColaborador.qrBuscas);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
  CadFuncao := TFuncoes.create;
  cadFuncao.dataSet := TClientDataSet(dtmColaborador.cdsF);
  cadPerfil_Comissao := TPerfil_comissao.create;
  cadPerfil_colab := TPerfil_colab.create;
  cadIncidencia := TIncidencia.create;
  cadIncidenciaColab := TIncidenciaColab.create;
  vCidades := TCidadesColab.create;
  vUF := TUFColab.create;
  vBairro := TBairroColab.create;
  vGerente := TGerenteColab.create;
  vJornadaTrabalho := TJornadaTrabalhoColab.create;
  vEscalaSemanal := TEscalaSemanalColab.create;
  
  CadFuncao.abreFuncoes;
  cadIncidencia.abreIncidencia;
  CadPerfil_Comissao.abrePerfil_comissao;
  ContatoMsg := TColaboradorContatoMsg.Create(Self);
  vCidades.abreCidade;
  vUF.abreUF;
  vBairro.abreBairro;
  montaSelect('select * from COLABORADOR where 1=0');
end;

function TColaborador.delete: boolean;
var
  vtemp: string;
	vApagar: boolean;
  vCod_Colaborador: string;
  vNome_Colaborado: string;
  vHabHwCloud: Boolean;
  vListaColaborador: TStringList;
  I: Integer;
begin
  try
    vListaColaborador := TStringList.Create;
    vListaColaborador.Clear;

    try
      Result := False;
      if dataSet.IsEmpty then
        exit;

      try
        vApagar           := dataSet.FieldByName('ATIVO').AsInteger = 0;
        vCod_Colaborador  := trim(dataSet.FieldByName('COD_VENDEDOR').AsString);
        vNome_Colaborado  := trim(dataSet.FieldByName('NOME_VENDEDOR').AsString);

        prepare_loop('SEL = ''S''');

        if not dataset.IsEmpty then
        begin
          vApagar          := dataSet.FieldByName('ATIVO').AsInteger = 0;
          vCod_Colaborador := '';
          vNome_Colaborado := '';
        end;
      finally
        prepare_loop_done;
      end;

      vHabHwCloud := trim(vDadosIni.retornaDadosHwCloudIA(buscas, True)) <> '';

      try
        if (trim(vCod_Colaborador) <> '') then
          prepare_loop('COD_VENDEDOR = ' + vCod_Colaborador)
        else
          prepare_loop('SEL = ''S''');

        if vApagar then
        begin
          vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
            'COLABORADOR' + #13 +
            'Código: ' + vCod_Colaborador + #13 +
            'Nome: ' + vNome_Colaborado;

          if (trim(vCod_Colaborador) = '') then
            vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

          if not vDadosIni.PesqPros('COL013', 'EXCLUIR', '', 'COLABORADOR',
            vDadosIni.IfThen(trim(vCod_Colaborador) <> '', vCod_Colaborador, ''), buscas, true) then
              exit;

          if Application.MessageBox(PChar(vtemp),
            'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
            exit;
        end
        else
        begin
          vtemp := 'Tem certeza que deseja mover este registro para a lixeira?' + #13 + #13 +
            'COLABORADOR' + #13 +
            'Código: ' + vCod_Colaborador + #13 +
            'Nome: ' + vNome_Colaborado;

          if (trim(vCod_Colaborador) = '') then
            vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

          if not vDadosIni.PesqPros('COL004', 'EXCLUIR', '', 'COLABORADOR',
             vDadosIni.IfThen(trim(vCod_Colaborador) <> '', vCod_Colaborador, ''), buscas, true) then
              exit;

          if Application.MessageBox(PChar(vtemp),
            'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
            exit;
        end;

        if vApagar then
          vDadosIni.abreStatusProcessamento('', 'Excluíndo colaborador(es) permanentemente')
        else
          vDadosIni.abreStatusProcessamento('', 'Movendo colaborador(es) para lixeira');

        dataset.First;
        while not dataset.Eof do
        begin
          if vApagar then
            vDadosIni.abreStatusProcessamento('', 'Excluíndo colaborador(es) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
          else
            vDadosIni.abreStatusProcessamento('', 'Movendo colaborador(es) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

          if vApagar then
          begin
            SqlExec(' update colaborador set ativo = 99 ' +
              ' where cod_vendedor = %d and cod_empresa = %d ',
              [fint('cod_vendedor'), fint('cod_empresa')], buscas);
            if (trim(vCod_Colaborador) = '') then
              vDadosIni.GravaAuditoria('COL013', 'EXCLUIR', '', 'COLABORADOR',
                dataSet.FieldByName('COD_VENDEDOR').AsString, buscas);

            if vHabHwCloud then
              vListaColaborador.Add(IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger));
          end
          else
          begin
            SqlExec(' update colaborador set ativo = 0 ' +
              ' where cod_vendedor = %d and cod_empresa = %d ',
              [fint('cod_vendedor'), fint('cod_empresa')], buscas);

            if (trim(vCod_Colaborador) = '') then
              vDadosIni.GravaAuditoria('COL004', 'EXCLUIR', '', 'COLABORADOR',
                dataSet.FieldByName('COD_VENDEDOR').AsString, buscas);
          end;

          dataset.Next;
        end;
      finally
        vDadosIni.fechaStatusProcessamento;
        prepare_loop_done;
      end;

      Result := CommitaTransacao;

      if Result then
        for I := 0 to vListaColaborador.Count - 1 do
          cadColaboradorHwCloud(StrToInt(vListaColaborador[I]));

      if Result then
      begin
        vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'COL013', 'COL004'),
          'EXCLUIR', 'SUCESSO', 'COLABORADOR',
          vDadosIni.IfThen(trim(vCod_Colaborador) <> '', vCod_Colaborador, ''), buscas);
      end
      else
      begin
        RollBackTransacao;
        vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'COL013', 'COL004'),
          'EXCLUIR', 'FALHA', 'COLABORADOR',
          vDadosIni.IfThen(trim(vCod_Colaborador) <> '', vCod_Colaborador, ''), buscas);
      end;
      if Result then
        montaSelect(ultimasql);
    except
      on E: Exception do
      begin
        RollBackTransacao;
        vDadosIni.fechaStatusProcessamento;
        Result := false;
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  finally
    if Assigned(vListaColaborador) then
      FreeAndNil(vListaColaborador) 
  end;
end;

destructor TColaborador.Destroy;
begin
  if CadPerfil_Comissao <> nil then
    FreeAndNil(CadPerfil_Comissao);
  if cadPerfil_colab <> nil then
    FreeAndNil(cadPerfil_colab);
  if cadIncidencia <> nil then
    FreeAndNil(cadIncidencia);
  if cadIncidenciaColab <> nil then
    FreeAndNil(cadIncidenciaColab);
  if cadFuncao <> nil then
    FreeAndNil(cadFuncao);
  if vUF <> nil then
    FreeAndNil(vUF);
  if vCidades <> nil then
    FreeAndNil(vCidades);
  if vGerente <> nil then
    FreeAndNil(vGerente);
  if FContatoMsg <> nil then
    FreeAndNil(FContatoMsg);
  if vJornadaTrabalho <> nil then
    FreeAndNil(vJornadaTrabalho);
  if vEscalaSemanal <> nil then
    FreeAndNil(vEscalaSemanal);
  inherited;
end;

function TColaborador.edit: boolean;
begin
  result := false;
  if IsEmpty then
    exit;
  if inherited Edit then
  begin
    if dataSet.FieldByName('cod_jornada_trabalho').IsNull then
      dataSet.FieldByName('cod_jornada_trabalho').AsInteger := 0;
    if dataSet.FieldByName('cod_escala_semanal').IsNull then
      dataSet.FieldByName('cod_escala_semanal').AsInteger := 0;

    if not vCidades.Active then
      vCidades.abreCidade;

    if not vUF.Active then
      vUF.abreUF;

    if not vBairro.Active then
      vBairro.abreBairro;

    if not cadFuncao.buscas.Active then
      cadFuncao.abreFuncoes;

    if not cadIncidencia.Active then
      cadIncidencia.abreIncidencia;

    if not cadPerfil_Comissao.dataSet.Active then
      cadPerfil_Comissao.abrePerfil_comissao;

    cadPerfil_colab.abrePerfil_colab(dataSet.FieldByName('COD_VENDEDOR').AsInteger);
    if dataSet.State = dsInsert then
      dataSet.FieldByName('data_mod_col').AsDateTime := vDadosIni.getDataBanco(buscas);

    dataSet.FieldByName('fone_vendedor').AsString := vDadosIni.StringReplace2(
      dataSet.FieldByName('fone_vendedor').AsString, '()-', '   ', True);

    dataSet.FieldByName('fone_ult_emp').AsString := vDadosIni.StringReplace2(
      dataSet.FieldByName('fone_ult_emp').AsString, '()-', '   ', True);

    dataSet.FieldByName('fone_plt_emp').AsString := vDadosIni.StringReplace2(
      dataSet.FieldByName('fone_plt_emp').AsString, '()-', '   ', True);

    dataSet.FieldByName('CEP_VENDEDOR').AsString := vDadosIni.StringReplace2(
      dataSet.FieldByName('CEP_VENDEDOR').AsString, '-', ' ', True);

    dataSet.FieldByName('EMAIL').AsString := LowerCase(dataSet.FieldByName('EMAIL').AsString);

    cadPerfil_colab.Perfil_colabModificou := false;
    cadIncidenciaColab.IncidenciaColabModificou := false;
    vGerente.abreGerente;
    FContatoMsg.Abrir;
    vJornadaTrabalho.abreJornadaTrabalho;
    vEscalaSemanal.abreEscalaSemanal;
    Result := true;
  end;
end;

function TColaborador.extrato_conta(pdti,pdtf:TDateTime; pImprimirExtrao: boolean): boolean;
const
  vNomeMes: array[1..12] of string = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
    'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');
var
  rdp:TRDprint;
  linha,vpag: integer;
  query:TIbquery;
  vSaldoIni:double;
  Ano,Mes,Dia,Ano1, Mes1: Word;
  vData:TDateTime;
  vDataTemp,vTimeTemp:string;
  procedure cabecalho;
  begin
    if pImprimirExtrao then
    begin
      inc(linha);
      rdp.ImpF(linha, 1,vDadosIni.Replicate('-',132), [comp17]);
      inc(linha);
      rdp.ImpF(linha, 1,'DATA', [comp17]);
      rdp.ImpF(linha, 13,'ORIGEM LANC', [comp17]);
      rdp.ImpF(linha, 33,'NUM DOC', [comp17]);
      rdp.ImpF(linha, 46,'HISTÓRICO DO LANÇAMENTO', [comp17]);
      rdp.ImpD(linha, 112,'VALOR(R$)', [comp17]);
      rdp.ImpD(linha, 132,'SALDO(R$)', [comp17]);
      inc(linha);
      rdp.ImpF(linha, 1,vDadosIni.Replicate('-',132), [comp17]);
      inc(linha);
    end;
  end;
begin
  result:=false;
  vpag:=1;
  try
    if dataSet.IsEmpty then
      exit;
    rdp := TRDPrint.Create(Application);
    Rdp.CaptionSetup := 'Configurações de Impressão';
    rdp.OpcoesPreview.Preview := true;
    rdp.FonteTamanhoPadrao := S17cpp;
    if pImprimirExtrao then
    begin
      rdp.OpcoesPreview.CaptionPreview := 'Extrato da conta do vendedor';
      rdp.TitulodoRelatorio := 'Extrato da conta do vendedor';
      rdp.TamanhoQteColunas := 132;
    end
    else begin
      rdp.OpcoesPreview.CaptionPreview := 'Saldo da conta do vendedor';
      rdp.TitulodoRelatorio := 'Saldo da conta do vendedor';
      rdp.TamanhoQteColunas := 80;
    end;
    vDadosIni._LimparVarSendEmail;
    rdp.OnSendMail := vDadosini._SendMailRdPrint;
    rdp.TamanhoQteLinhas := 66;
    if not vDadosIni.ModImp(rdp) then
      exit;
    linha := 1;
    if not rdp.EstaAberto then
      result := rdp.Abrir;

    query := TIBQuery.Create(Application);
    query.Database := buscas.Database;
    query.Transaction := buscas.Transaction;
    query.Close;
    query.SQL.Text:='select first 1 sdc.saldo, sdc.data from colaborador col '+
      ' left join saldo_debcred sdc '+
      ' on col.cod_empresa = sdc.cod_empresa and col.cod_vendedor=sdc.cod_vendedor '+
      ' where col.cod_vendedor='+IntToStr(DataSet.FieldByName('cod_vendedor').AsInteger)+
      ' and col.cod_empresa='+vDadosIni.codEmpresa+
      ' and sdc.data< :dti order by sdc.cod_saldo desc';
    if pImprimirExtrao then
      query.ParamByName('dti').AsDateTime:=pdti
    else
      query.ParamByName('dti').AsDateTime:= vDadosIni.getDataHoraBanco(buscas);
    query.Open;


    if not pImprimirExtrao then
    begin
      inc(linha);
      rdp.Impf(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [comp17]);
      rdp.Impd(linha, 80, 'pag.:'+ inttostr(vpag) , [comp17]);
      inc(linha);
      rdp.ImpF(linha, 1,vDadosIni.Replicate('-',80), [comp17]);
      inc(linha);
      rdp.ImpF(linha, 1,'NOME: '+trim(dataSet.FieldByName('nome_vendedor').AsString) , [comp17]);
      inc(linha);
      rdp.ImpF(linha, 1,'SALDO RESUMIDO', [comp17]);
      rdp.ImpD(linha, 80, datetostr(vDadosIni.getDataBanco(buscas))+ ' às '+ TimeToStr(vDadosIni.getDataHoraBanco(buscas)) , [comp17]);
      inc(linha);
      rdp.ImpF(linha, 1,'DESCRIÇÃO', [comp17]);
      rdp.ImpD(linha, 80,'VALOR(R$)', [comp17]);
      inc(linha);
      rdp.ImpF(linha, 1,'SALDO DISPONÍVEL', [comp17]);
      if query.FieldByName('saldo').AsFloat>0 then
        rdp.ImpD(linha, 80, Format('%0.2f', [query.FieldByName('saldo').AsFloat])+' C', [comp17])
      else if query.FieldByName('saldo').AsFloat<0 then
        rdp.ImpD(linha, 80, Format('%0.2f', [query.FieldByName('saldo').AsFloat])+' D', [comp17])
      else rdp.ImpD(linha, 80, Format('%0.2f', [query.FieldByName('saldo').AsFloat]), [comp17]);
      inc(linha);
      rdp.ImpF(linha, 1,vDadosIni.Replicate('-',80), [comp17]);
      inc(linha);
      exit;
    end;


    vDataTemp:= datetostr(vDadosIni.getDataBanco(buscas));
    vTimeTemp:= TimeToStr(vDadosIni.getDataHoraBanco(buscas));

    buscas.Close;
    buscas.SQL.Text:='select col.cod_vendedor,col.nome_vendedor, ldc.vl_lancdebcred,'+
      ' sdc.saldo,ldc.data_lanc,ldc.hora_lanc, '+
      ' ldc.descricao,ldc.origem_lanc,ldc.npedorigem,sdc.data from colaborador col '+
      ' left join lanc_debcred ldc '+
      ' on col.cod_empresa = ldc.cod_empresa and col.cod_vendedor=ldc.cod_vendedor '+
      ' left join saldo_debcred sdc '+
      ' on ldc.cod_empresa = sdc.cod_empresa and ldc.cod_vendedor=sdc.cod_vendedor '+
      ' and ldc.data_lanc=sdc.data '+
      ' where col.cod_vendedor='+IntToStr(DataSet.FieldByName('cod_vendedor').AsInteger)+
      ' and col.cod_empresa='+vDadosIni.codEmpresa+
      ' and ldc.data_lanc>= :dti and ldc.data_lanc<= :dtf order by ldc.COD_LANC';
    buscas.ParamByName('dti').AsDateTime:=pdti;
    buscas.ParamByName('dtf').AsDateTime:=pdtf;
    buscas.Open;

    rdp.Impf(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [comp17]);
    rdp.Impd(linha, 132, 'pag.:'+ inttostr(vpag) , [comp17]);
    inc(linha);
    rdp.ImpF(linha, 1,vDadosIni.Replicate('-',132), [comp17]);
    inc(linha);
    rdp.ImpF(linha, 1,'NOME: '+trim(dataSet.FieldByName('nome_vendedor').AsString) , [comp17]);
    inc(linha);
    rdp.ImpF(linha, 1,'EXTRATO DA CONTA', [comp17]);
    rdp.ImpD(linha, 132, vDataTemp+ ' às '+ vTimeTemp , [comp17]);
    inc(linha);
    rdp.ImpF(linha, 1,'LANÇAMENTOS DE '+ FormatDateTime('DD/MM/YYYY',pdti)+' a ' +
      FormatDateTime('DD/MM/YYYY',pdtf), [comp17]);
    inc(linha);
    if not buscas.IsEmpty then
    begin
      DecodeDate(buscas.FieldByName('data_lanc').AsDateTime, Ano, Mes, Dia);
      Mes1:=Mes;
      Ano1:=Ano;
      vData:=buscas.FieldByName('data_lanc').AsDateTime;
      inc(linha);
      rdp.ImpF(linha, 1,UpperCase(vNomeMes[Mes])+'/'+UpperCase(inttostr(Ano)) , [negrito, comp20]);
    end; 
    cabecalho;

    vSaldoIni:= query.FieldByName('saldo').AsFloat;
    if not query.IsEmpty then
      rdp.ImpF(linha, 1,FormatDateTime('DD/MM/YYYY',query.FieldByName('data').AsDateTime), [negrito,comp17])
    else rdp.ImpF(linha, 1,'   ----   ', [negrito,comp17]);
    rdp.ImpF(linha, 46,'SALDO ANTERIOR', [negrito,comp17]);
    if (vSaldoIni)>0 then
      rdp.ImpD(linha, 132, Format('%0.2f', [vSaldoIni])+' C', [negrito,comp17])
    else if (vSaldoIni)<0 then
      rdp.ImpD(linha, 132, Format('%0.2f', [vSaldoIni])+' D', [negrito,comp17])
    else
      rdp.ImpD(linha, 130, Format('%0.2f', [vSaldoIni]), [negrito,comp17]);
    Inc(linha);
    rdp.ImpF(linha, 1,vDadosIni.Replicate('-',132), [comp17]);
    inc(linha);

    while not buscas.eof do
    begin
      DecodeDate(buscas.FieldByName('data_lanc').AsDateTime, Ano, Mes, Dia);
      if (Mes<>Mes1) or (Ano<>Ano1) then
      begin
        Mes1:=Mes;
        Ano1:=Ano;
        inc(linha);
        rdp.ImpF(linha, 1,UpperCase(vNomeMes[Mes])+'/'+UpperCase(inttostr(Ano)) , [negrito, comp20]);
        cabecalho;
      end;
      rdp.ImpF(linha, 1,trim(buscas.FieldByName('data_lanc').AsString), [comp17]);
      rdp.ImpF(linha, 13,trim(buscas.FieldByName('origem_lanc').AsString), [comp17]);
      rdp.ImpF(linha, 33,trim(buscas.FieldByName('npedorigem').AsString), [comp17]);
      rdp.ImpF(linha, 46,trim(buscas.FieldByName('descricao').AsString), [comp17]);
      vSaldoIni:= vSaldoIni+buscas.FieldByName('vl_lancdebcred').AsFloat;
      if buscas.FieldByName('vl_lancdebcred').AsFloat>0 then
        rdp.ImpD(linha, 112, Format('%0.2f', [buscas.FieldByName('vl_lancdebcred').AsFloat])+' C', [comp17])
      else if buscas.FieldByName('vl_lancdebcred').AsFloat<0 then
        rdp.ImpD(linha, 112, Format('%0.2f', [buscas.FieldByName('vl_lancdebcred').AsFloat])+' D', [comp17])
      else
        rdp.ImpD(linha, 110, Format('%0.2f', [buscas.FieldByName('vl_lancdebcred').AsFloat]), [comp17]);

      if (vSaldoIni)>0 then
        rdp.ImpD(linha, 132, Format('%0.2f', [vSaldoIni])+' C', [comp17])
      else if (vSaldoIni)<0 then
        rdp.ImpD(linha, 132, Format('%0.2f', [vSaldoIni])+' D', [comp17])
      else
        rdp.ImpD(linha, 130, Format('%0.2f', [vSaldoIni]), [comp17]);
      inc(linha);
      if linha=64 then
      begin
        rdp.Novapagina;
        inc(vpag);
        linha:=1;
        rdp.Impf(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [comp17]);
        rdp.Impd(linha, 132, 'pag.:'+ inttostr(vpag) , [comp17]);
        inc(linha);
        rdp.ImpF(linha, 1,vDadosIni.Replicate('-',132), [comp17]);
        inc(linha);
        rdp.ImpF(linha, 1,'NOME: '+trim(dataSet.FieldByName('nome_vendedor').AsString) , [comp17]);
        inc(linha);
        rdp.ImpF(linha, 1,'EXTRATO DA CONTA', [comp17]);
        rdp.ImpD(linha, 132, vDataTemp+ ' às '+ vTimeTemp , [comp17]);
        inc(linha);
        rdp.ImpF(linha, 1,'LANÇAMENTOS DE '+ FormatDateTime('DD/MM/YYYY',pdti)+' a ' +
          FormatDateTime('DD/MM/YYYY',pdtf), [comp17]);
        inc(linha,2);
        rdp.ImpF(linha, 1,UpperCase(vNomeMes[Mes])+'/'+UpperCase(inttostr(Ano)) , [negrito, comp20]);
        cabecalho;
      end;
      buscas.Next;
    end;

    rdp.ImpF(linha, 1,vDadosIni.Replicate('-',132), [comp17]);
    inc(linha);
    rdp.ImpF(linha, 46,'SALDO ATUAL', [negrito,comp17]);
    if (vSaldoIni)>0 then
      rdp.ImpD(linha, 132, Format('%0.2f', [vSaldoIni])+' C', [negrito,comp17])
    else if (vSaldoIni)<0 then
      rdp.ImpD(linha, 132, Format('%0.2f', [vSaldoIni])+' D', [negrito,comp17])
    else
      rdp.ImpD(linha, 130, Format('%0.2f', [vSaldoIni]), [negrito,comp17]);

  finally
    if rdp.EstaAberto then
      rdp.Fechar;
    rdp.Free;
    rdp:=nil;
    buscas.Close;
    query.Close;
  end;
end;

function TColaborador.insert: boolean;
begin
  if not dataSet.Active then
    montaSelect('select * from colaborador where 1 =0');

  if not cadPerfil_Comissao.Active then
    cadPerfil_Comissao.abrePerfil_comissao;

  if not cadPerfil_colab.Active then
    cadPerfil_colab.abrePerfil_colab(dataSet.FieldByName('COD_VENDEDOR').AsInteger);

  if not vCidades.Active then
    vCidades.abreCidade;

  if not vUF.Active then
    vUF.abreUF;

  if not vBairro.Active then
    vBairro.abreBairro;

  if not cadFuncao.buscas.Active then
    cadFuncao.abreFuncoes;

  if not cadIncidencia.Active then
    cadIncidencia.abreIncidencia;

  if inherited insert then
  begin
    if not cadFuncao.buscas.Active then
      cadFuncao.abreFuncoes;

    if not cadPerfil_Comissao.buscas.Active then
      cadPerfil_Comissao.abrePerfil_comissao;

    if not cadPerfil_colab.buscas.Active then
      cadPerfil_colab.abrePerfil_colab(dataSet.FieldByName('COD_VENDEDOR').AsInteger);

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('data_cad_col').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('data_mod_col').AsDateTime := dataSet.FieldByName('data_cad_col').AsDateTime;
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;

      dataSet.FieldByName('cod_jornada_trabalho').AsInteger := 0;
      dataSet.FieldByName('cod_escala_semanal').AsInteger := 0;
    end;
    cadPerfil_colab.Perfil_colabModificou := false;
    cadIncidenciaColab.IncidenciaColabModificou := false;
    vGerente.abreGerente;
    FContatoMsg.Abrir;
    vJornadaTrabalho.abreJornadaTrabalho;
    vEscalaSemanal.abreEscalaSemanal;
    Result := true;
  end;
end;

function TColaborador.post: boolean;
var
  temp, acaoDataset: string;
  CEPs : TCEP;
  vEmails: string;
  vListaEmail: TStringList;
  I: Integer;
begin
  try
    Result := false;

    acaoDataset := '';
    if not (dataSet.State in [dsInsert, dsEdit]) then
      exit;
    if dataSet.State = dsInsert then
      acaoDataset := 'INSERIR'
    else
      acaoDataset := 'EDITAR';

    if trim(dataSet.FieldByName('NOME_VENDEDOR').AsString) = '' then
      raiseExceptionCreate('O campo nome é não foi informado.', 'DBEdit2');

    if trim(dataSet.FieldByName('END_VENDEDOR').AsString) = '' then
      raiseExceptionCreate('O campo endereço é não foi informado.', 'DBEdit3');

    if dataSet.FieldByName('COD_BAIRRO').AsInteger <= 0 then
      raiseExceptionCreate('O campo Bairro não foi informado', 'DBEdit34');

    if dataSet.FieldByName('COD_CIDADE').AsInteger <= 0 then
      raiseExceptionCreate('O campo Cidade não foi informado', 'DBEdit38');

    if dataSet.FieldByName('CODIGO_UF').AsInteger <= 0 then
      raiseExceptionCreate('O campo estado não foi informado', 'DBLookupComboBox2');

    if dataSet.FieldByName('COD_FUNCAO').AsInteger <= 0 then
      raiseExceptionCreate('O campo Função do colaborador não foi informado', 'DBLookupComboBox1');

    dataSet.FieldByName('RG_VENDEDOR').AsString := vDadosIni.apenasLetraseNumeros(dataSet.FieldByName('RG_VENDEDOR').AsString);  

    if Trim(dataSet.FieldByName('email').AsString) <> '' then
    begin
      vEmails := LowerCase(Trim(dataSet.FieldByName('email').AsString));
      vEmails := StringReplace(vEmails, ',', ';', [rfReplaceAll]);
      vListaEmail := TStringList.Create;
      vListaEmail.Clear;
      vListaEmail.Sorted := True;
      vListaEmail.Sort;
      vListaEmail.Duplicates := dupIgnore;

      vListaEmail := vDadosIni.Split(vEmails, ';');
      for I := 0 to vListaEmail.Count - 1 do
        if Trim(vListaEmail[i]) <> '' then
          if not vDadosIni.validaTextoEMail2(Trim(vListaEmail[i])) then
            raiseExceptionCreate('email "' + Trim(vListaEmail[i]) + '" informado inválido', 'DBEdit14');
      dataSet.FieldByName('email').AsString := vEmails;
    end;

    temp := retornaValor('select NOME_CIDADE as valor from cidades where COD_CIDADE =' +
      dataSet.FieldByName('COD_CIDADE').AsString);
    if temp <> '' then
      dataSet.FieldByName('CIDADE_VENDEDOR').AsString := trim(temp);

    temp := trim(retornaValor('select NOME_BAIRRO as valor from BAIRROS where COD_BAIRRO =' +
      dataSet.FieldByName('COD_BAIRRO').AsString));
    if temp <> '' then
      dataSet.FieldByName('BAIRRO_VENDEDOR').AsString := temp;

    if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
      if dataSet.FieldByName('COD_JORNADA_TRABALHO').AsInteger > 0 then
        if not vJornadaTrabalho.BuscarJornadaTrabalho(dataSet.FieldByName('COD_JORNADA_TRABALHO').AsInteger, False) then
          raiseExceptionCreate('Jornada de Trabalho não encontrada', 'DBEdit43');
      
    if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
      if dataSet.FieldByName('COD_ESCALA_SEMANAL').AsInteger > 0 then
        if not vEscalaSemanal.BuscarEscalaSemanal(dataSet.FieldByName('COD_ESCALA_SEMANAL').AsInteger, False) then
          raiseExceptionCreate('Escala Semanal não encontrada', 'DBEdit44');

    if dataSet.FieldByName('COD_JORNADA_TRABALHO').AsInteger <= 0 then
      dataSet.FieldByName('COD_JORNADA_TRABALHO').Value := Null;

    if dataSet.FieldByName('COD_ESCALA_SEMANAL').AsInteger <= 0 then
      dataSet.FieldByName('COD_ESCALA_SEMANAL').Value := Null;

    if dataSet.State = dsInsert then
      dataSet.FieldByName('COD_VENDEDOR').AsInteger := Gencodigo('COLABORADOR',
        dtmColaborador.SpIncCodigo, vDadosIni.codEmpresa);

    Result := inherited post;

    CEPs._GravarCEPAutomatico(
      dataSet.FieldByName('CEP_VENDEDOR').AsString,
      dataSet.FieldByName('CODIGO_UF').AsInteger,
      dataSet.FieldByName('COD_CIDADE').AsInteger,
      dataSet.FieldByName('COD_BAIRRO').AsInteger,
      dataSet.FieldByName('END_VENDEDOR').AsString,'','','','','');

    if (dataSet.ChangeCount = 0) and
      (not cadIncidenciaColab.IncidenciaColabModificou) and
      (not cadPerfil_colab.Perfil_colabModificou) then
    begin
      Result := true;
      RollBackTransacao;
      exit;
    end;
    
    temp := '';
    if dataSet.ChangeCount > 0 then
      temp := 'COLABORADOR';
    if cadPerfil_colab.Perfil_colabModificou then
      temp := temp + ',PERFIL_VEND';
    if cadIncidenciaColab.IncidenciaColabModificou then
      temp := temp + ',LANC_PAG';

    Result :=
      cadIncidenciaColab.IncidenciaColabModificou
      or cadPerfil_colab.Perfil_colabModificou
      or FContatoMsg.Apply;

    if Result then
      Result := Apply;
    if Result then
      Result := CommitaTransacao;

    if result then
      cadColaboradorHwCloud(dataSet.FieldByName('COD_VENDEDOR').AsInteger);

    if result then
      vDadosIni.GravaAuditoria('COL008', acaoDataset, 'SUCESSO', temp, dataSet.FieldByName('COD_VENDEDOR').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('COL008', acaoDataset, 'FALHA', temp, dataSet.FieldByName('COD_VENDEDOR').AsString, buscas);

    Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TColaborador.renconciliaErro(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  try
    if (Pos('FK_LANC_PAG1', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela LANC_PAG', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_MECOS_COLAB', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela MECANICO_OS', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_NF_ENTRA_COLABORAD_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela NF_ENTRADA', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_NF_SERIE_D_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela NF_SERIE_D', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_NF_VENDA_COLABORAD_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela NF_VENDA', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_NOTAS_EM_COLABORAD_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela NOTAS_EMITIDAS', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_ORCAMENT_COLABORAD_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela ORCAMENTOS', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_ORDEM_SE_COLABORAD_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela ORDEM_SERV', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_OS_ITEM__COLABORAD', e.Message) <> 0) or (Pos('FK_OS_ITEM__COLABORADM', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela OS_ITEM_PROD', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_OS_ITEM__COLABORA__COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela OS_ITEM_SERV', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_OSPRODTERC_COLAB', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela OS_PROD_TERC', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_OUTRAS_NF', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela OUTRAS_NF', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_PEDIDO_COLABORAD_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela PEDIDO', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_PEDVENDA_COLABORADOR', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela PEDVENDA', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_PEDVENDA_PROD_COLABORADOR', e.Message) <> 0) or (Pos('FK_PEDVENDA_PROD_COLABORADORM', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela PEDVENDA_PROD', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_PED_PROD_TERC_COLAB', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela PEDVENDA_PROD_TERC', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_PEDVENDA_SERV_COLABORADOR', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela PEDVENDA_SERV', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_REQVENDA_COLABORAD_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela REQVENDA', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_TMO_OS_COLABORAD_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela TMO_SERV_OS', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_VENDA_PE_COLABORAD_COLABORA', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela VENDA_PERDIDA', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;
  finally
    RollBackTransacao;
    Self.DataSet.CancelUpdates;
  end;
end;

function TColaborador.restaurarLixeira: boolean;
var
	vCodColaborador: string;
	vNomeColaborador: string;
  vtemp: string;
begin
	try
  	result := false;
    if dataSet.IsEmpty then
      exit;

    if dataSet.FieldByName('ATIVO').asinteger <> 0 then
    begin
      Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
      vCodColaborador  := trim(dataSet.FieldByName('COD_VENDEDOR').AsString);
      vNomeColaborador := trim(dataSet.FieldByName('NOME_VENDEDOR').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vCodColaborador  := '';
        vNomeColaborador := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(vCodColaborador) <> '') then
      	prepare_loop('COD_VENDEDOR = ' + vCodColaborador)
      else
		    prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        'COLABORADOR' + #13 +
        'Código: ' + vCodColaborador + #13 +
        'Nome: ' + vNomeColaborador;

      if (trim(vNomeColaborador) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('COL007', 'RESTAURAR', '', 'COLABORADOR',
        vDadosIni.IfThen(trim(vCodColaborador) <> '', vCodColaborador, ''), buscas, true) then
          exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando colaborador(es)');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando colaborador(es) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update colaborador set ativo = 1 ' +
          ' where cod_vendedor = %d and cod_empresa = %d ',
          [fint('cod_vendedor'), fint('cod_empresa')], buscas);

        if (trim(vCodColaborador) = '') then
          vDadosIni.GravaAuditoria('COL007', 'RESTAURAR', '', 'COLABORADOR',
            dataSet.FieldByName('COD_VENDEDOR').AsString, buscas);

        dataset.Next;
      end;
    finally
    	vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    Result := CommitaTransacao;
    if Result then
    begin
    	vDadosIni.GravaAuditoria('COL007', 'RESTAURAR', 'SUCESSO', 'COLABORADOR',
        vDadosIni.IfThen(trim(vCodColaborador) <> '', vCodColaborador, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
    	vDadosIni.GravaAuditoria('COL007', 'RESTAURAR', 'FALHA', 'COLABORADOR',
        vDadosIni.IfThen(trim(vCodColaborador) <> '', vCodColaborador, ''), buscas);
    end;

    if Result then
      montaSelect(ultimasql);
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TColaborador.StatusLixeira: boolean;
begin
  result := ExecutaComandosSql(' select first 1 cod_vendedor from colaborador ' +
  	' where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 0');
end;

procedure TColaborador._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TColaborador._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TColaborador._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TDeptoFuncao }

function TDeptoFuncao.abreDepto: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select NOME_DEPTO from depto where ativo = 1';
  buscas.Open;
end;

constructor TDeptoFuncao.create;
begin
  buscas := tibquery(dtmColaborador.qrDpto);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
end;

{ TPerfil_comissao }

function TPerfil_comissao.abrePerfil_comissao: boolean;
begin
  Result := montaSelect(' select * from PERFIL_COMISSAO ' +
  	' where ativo = 1 ');

end;

constructor TPerfil_comissao.create;
begin
  dataSet := TClientDataSet(dtmColaborador.cdsPerfilComissao);
  buscas := tibquery(dtmColaborador.qrPerfilcomissao);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
end;

{ TPerfil_colab }

function TPerfil_colab.abrePerfil_colab(cod_colab: integer): boolean;
begin
  Result := montaSelect('select pv.*, pc.nome_perfil from PERFIL_VENDEDOR pv ' +
  	' inner join perfil_comissao pc on pv.codigo_perfil = pc.codigo_perfil ' +
    ' where pv.ativo = 1 ' +
    ' and pv.cod_vendedor = ' + inttostr(cod_colab) +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa);
  //  Result := montaSelect('select * from PERFIL_VENDEDOR where ativo = 1 and COD_VENDEDOR =' +
  //    inttostr(cod_colab));
end;

constructor TPerfil_colab.create;
begin
  dataSet := TClientDataSet(dtmColaborador.CdsPColab);
  buscas := tibquery(dtmColaborador.qrBuscasPColab);
  transacao := tibtransaction(dtmColaborador.transacaoColab);

  //  buscas := tibquery(dtmColaborador.qrPColab);
//  transacao := tibtransaction(dtmColaborador.transacaoPcolab);
end;

function TPerfil_colab.delete: boolean;
begin
  if dataSet.IsEmpty then
    exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    dataSet.Delete;
  if Apply then
    Perfil_colabModificou := true;
  Refresh;
end;

function TPerfil_colab.insert(datasetColab: TColaborador): boolean;
var
  I: Integer;
begin
  if not dataSet.Active then
    abrePerfil_colab(datasetColab.dataSet.FieldByName('cod_vendedor').AsInteger);
  dataSet.First;
  while not dataSet.Eof do
  begin
    if ((dataSet.FieldByName('COD_VENDEDOR').AsInteger = datasetColab.dataSet.FieldByName('COD_VENDEDOR').AsInteger) and
      (dataSet.FieldByName('CODIGO_PERFIL').AsInteger = datasetColab.CadPerfil_Comissao.dataSet.FieldByName('CODIGO_PERFIL').AsInteger) and
      (dataSet.FieldByName('COD_EMPRESA').AsString = trim(vDadosIni.codEmpresa))) then
    begin
      Application.MessageBox('O perfil já está cadastrado para esse funcionário!', 'Atenção', MB_OK);
      exit;
    end;
    dataset.Next;
  end;

  if inherited insert then
  begin
    dataSet.FieldByName('COD_VENDEDOR').AsInteger :=
      datasetColab.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
    dataSet.FieldByName('CODIGO_PERFIL').AsInteger :=
      datasetColab.CadPerfil_Comissao.dataSet.FieldByName('CODIGO_PERFIL').AsInteger;
    dataSet.FieldByName('COD_EMPRESA').AsString := trim(vDadosIni.codEmpresa);
    result := true;
  end;
end;

function TPerfil_colab.post: boolean;
begin
  try
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := false;
      Exit;
    end;

    Result := inherited post;
    if (not result) or (not apply) then
    begin
      Result := FALSE;
      cancel;
    end
    else
      Perfil_colabModificou := true;
    Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;

  end;
end;

{ TIncidencia }

function TIncidencia.abreIncidencia: boolean;
begin
  montaSelect('select * from INCIDENCIA');
end;

constructor TIncidencia.create;
begin
  dataSet := TClientDataSet(dtmColaborador.cdsIncidencia);
  buscas := tibquery(dtmColaborador.qrIncidencia);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
end;

{ TIncidenciaColab }

function TIncidenciaColab.abreIcidenciaColab(cod_colab: integer): boolean;
begin
  montaSelect('select * from LANC_PAG where ativo = 1 and COD_COLABORADOR = ' + IntToStr(cod_colab));
end;

constructor TIncidenciaColab.create;
begin
  dataSet := TClientDataSet(dtmColaborador.cdsIncidenciaColab);
  buscas := tibquery(dtmColaborador.qrIncidenciaColab);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
  //  transacao := tibtransaction(dtmColaborador.transacaoIncidenciaColab);
end;

function TIncidenciaColab.delete: boolean;
begin
  if dataSet.IsEmpty then
    exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    dataSet.Delete;
  if Apply then
    IncidenciaColabModificou := true;
  Refresh;
end;

function TIncidenciaColab.insert(datasetColab: TColaborador): boolean;
begin
  try
    if datasetColab.cadIncidencia.IsEmpty then
      exit;

    if not (dataset.Active) then
      montaSelect('select * from LANC_PAG');

    dataSet.First;

    while not dataSet.Eof do
    begin
      if ((dataSet.FieldByName('COD_INCIDENCIA').AsInteger = datasetColab.cadIncidencia.dataSet.FieldByName('CODIGO').AsInteger) and
        (dataSet.FieldByName('COD_COLABORADOR').AsInteger = datasetColab.dataSet.FieldByName('COD_VENDEDOR').AsInteger) and
        (dataSet.FieldByName('COD_EMPRESA').AsString = trim(vDadosIni.codEmpresa))) then
      begin
        Application.MessageBox('Incidência já cadastrada para este funcionário.', 'Atenção', MB_OK);
        exit;
      end;
      dataSet.Next;
    end;

    if inherited Insert then
    begin
      dataSet.FieldByName('COD_INCIDENCIA').AsInteger :=
        datasetColab.cadIncidencia.dataSet.FieldByName('CODIGO').AsInteger;

      dataSet.FieldByName('COD_COLABORADOR').AsInteger :=
        datasetColab.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
      dataSet.FieldByName('COD_EMPRESA').AsString := trim(vDadosIni.codEmpresa);

      if dataset.State = dsInsert then
        dataSet.FieldByName('ATIVO').AsInteger := 1;
      result := true;
    end;

  except
    result := false;
  end;

end;

function TIncidenciaColab.post: boolean;
begin
  try
    Result := false;
    if not (dataset.State in [dsInsert, dsEdit]) then
      exit;

    result := inherited post;
    if (not result) or (not apply) then
    begin
      Result := FALSE;
      cancel;
    end
    else
      IncidenciaColabModificou := true;
    Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;

end;

{ TCidadesColab }

function TCidadesColab.abreCidade: boolean;
begin
  buscas.close;
  buscas.SQL.Text := 'select * from cidades where ativo = 1 order by nome_cidade';
  buscas.Open;
end;

constructor TCidadesColab.create;
begin
  buscas := tibquery(dtmColaborador.qrCidades);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
end;

{ TUFColab }

function TUFColab.abreUF: boolean;
begin
  buscas.close;
  buscas.SQL.Text := 'select * from Estados where ativo=1 order by sigla_uf';
  buscas.Open;
end;

constructor TUFColab.create;
begin
  buscas := TIBQuery(dtmColaborador.grUF);
  transacao := TIBTransaction(dtmColaborador.transacaoColab);
end;

{ TBairroColab }

function TBairroColab.abreBairro: boolean;
begin
  buscas.close;
  buscas.SQL.Text := 'select * from Bairros where ativo=1 order by nome_bairro';
  buscas.Open;
end;

constructor TBairroColab.create;
begin
  buscas := TIBQuery(dtmColaborador.qrBairro);
  transacao := TIBTransaction(dtmColaborador.transacaoColab);
end;

{ TGerente }

function TGerenteColab.abreGerente: Boolean;
begin
  result := montaSelect('select * from COLABORADOR where ativo = 1'+
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TGerenteColab.create;
begin
  dataSet := TClientDataSet(dtmColaborador.cdsGerente);
  buscas := TIBQuery(dtmColaborador.qrBuscas);
  transacao := TIBTransaction(dtmColaborador.transacaoColab);
end;

{ TLancDebitoCredito }

procedure TLancDebitoCredito.CadLancDebCred(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);

  if frmCadDebitoCredito = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TfrmCadDebitoCredito, frmCadDebitoCredito);
  end;
  
  if (TipoForm > 0) and (not frmCadDebitoCredito.Visible) then
    frmCadDebitoCredito.ShowModal
  else if (not frmCadDebitoCredito.Visible) then
    frmCadDebitoCredito.Show
  else if frmCadDebitoCredito.FormStyle = fsMDIChild then
    frmCadDebitoCredito.Show
  else
    frmCadDebitoCredito.ShowModal;
end;

constructor TLancDebitoCredito.create;
begin
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsLancDebCred);
  transacao := dtmColaborador.transacaoLanDebCred;
  buscas := TIBQuery.Create(Application);
  buscas.Database := dtmColaborador.qrLancDebCred.Database;
  buscas.Transaction := transacao;
  montaSelect('select * from LANC_DEBCRED where COD_LANC=-1');
  vTipoLancDC := TTipoLancDebCred.create;
end;

function TLancDebitoCredito.creditoPorCumprimentoMeta(pMes,pAno:string): boolean;
var
  formulario: TfrmPadrao;
  vQuery:TIBQuery;
  vCodCol:integer;
  vLanc,vDescricao,vTipoLanc:string;
begin
  result:=false;
  if not vDadosIni.PesqPros('COL032', 'INSERIR', 'INICIANDO LANÇAMENTO POR CUMPRIMENTO DE META', 'LAN_DEBCRED', '', buscas, false) then
    exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Escolha o Mês e Ano de referência para o lançamento';
    frmCadDebitoCredito.MaskEdit4.Text:=FloatToStr(MonthOf(vDadosIni.getDataBanco(buscas)));
    frmCadDebitoCredito.MaskEdit5.Text:=floatToStr(YearOf(vDadosIni.getDataBanco(buscas)));
    frmCadDebitoCredito.Label10.Caption:='';
    frmCadDebitoCredito.pnMesAno.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
//    if vTipoLancDC=nil then
//      vTipoLancDC := TTipoLancDebCred.create;
//    vTipoLancDC.ListaTipoLancDC;
//    vTipoLancDC.dataSet.Filter:= ' natureza_lan = ''C'' and upper(DESCRICAOLANC) like ''%META%'' ';
//    vTipoLancDC.dataSet.Filtered:= true;
//    if vTipoLancDC.IsEmpty then
//    begin
//      vDescricao:='CRÉDITO RELATIVO A CUMPRIMENTO DE META';
//      vTipoLanc:='BONUS POR META';
//    end else begin
//      vDescricao:=trim(vTipoLancDC.dataSet.FieldByName('DESCRICAOLANC').AsString);
//      vTipoLanc:=trim(vTipoLancDC.dataSet.FieldByName('TIPO_LANC').AsString);
//    end;

    result := (formulario.ShowModal = mrOk);
    if Result then
    begin
      vLanc:='';
      vDescricao:=trim(frmCadDebitoCredito.Edit2.Text);
      vTipoLanc:=frmCadDebitoCredito.Edit1.Text;
      vDadosIni.abreStatusProcessamento('', 'Checando vendedores com metas cumpridas');
      vQuery:= TIBQuery.Create(Application);
      vQuery.Database := buscas.Database;
      vQuery.Transaction:= buscas.Transaction;
      vQuery.SQL.Text:='select distinct col.nome_vendedor, col.cod_vendedor, pcom.perc_lancdebcred,mv.mes_meta,mv.ano_meta,'+
        ' (select  sum(vp.vltot_ped_item-vp.rateio_desc+vp.RATEIO_ACRESC) from vendaprodutos vp '+
        ' where extract(month from vp.data_fech)= :pmes and extract(year from vp.data_fech)= :pano'+
        ' and vp.cod_empresa= col.cod_empresa and vp.cod_vendedor=col.cod_vendedor and vp.venda = ''S'' ) as TotalLiquido, '+
        ' (coalesce((select  sum(vp.vltot_ped_item-vp.rateio_desc+vp.RATEIO_ACRESC) '+
        '  from vendaprodutos vp '+
        ' where extract(month from vp.data_fech)= :pmes and extract(year from vp.data_fech)= :pano '+
        ' and vp.cod_empresa= col.cod_empresa and vp.cod_vendedor=col.cod_vendedor and vp.venda = ''S'' ),0) * '+
        ' coalesce(pcom.perc_lancdebcred,0)/100) as Valor '+
        ' from colaborador col inner join perfil_vendedor pcol '+
        ' on col.cod_vendedor=pcol.cod_vendedor and col.cod_empresa=pcol.cod_empresa '+
        ' inner join perfil_comissao pcom '+
        ' on pcol.codigo_perfil=pcom.codigo_perfil '+
        ' inner join perfil_metas pm '+
        ' on pcom.codigo_perfil=pm.codigo_perfil '+
        ' inner join metas_vendas mv '+
        ' on pm.codigo_meta=mv.codigo_meta and pm.cod_empresa=mv.cod_empresa where '+
        ' (select sum(vp.vltot_ped_item-vp.rateio_desc+vp.RATEIO_ACRESC) from vendaprodutos vp '+
        ' where extract(month from vp.data_fech)=:pmes and extract(year from vp.data_fech)= :pano '+
        ' and vp.cod_empresa= col.cod_empresa and vp.cod_vendedor=col.cod_vendedor and vp.venda = ''S'' ) >= mv.valor_meta '+
        ' and mv.ativo=1 and col.cod_empresa= '+vDadosIni.codEmpresa+
        ' order by col.cod_vendedor,mv.ano_meta,mv.mes_meta desc';
      vQuery.ParamByName('pmes').AsInteger:= StrToInt(trim(frmCadDebitoCredito.MaskEdit4.Text));
      vQuery.ParamByName('pano').AsInteger:= StrToInt(trim(frmCadDebitoCredito.MaskEdit5.Text));
      vQuery.Open;
      if vQuery.IsEmpty then
      begin
        Application.MessageBox('Não existe metas cadastradas e viculadas aos vededores ou'+chr(13)+ 'Nenhum vendedor cumpriu a meta de vendas do referido mês.','Informação',MB_OK+MB_ICONINFORMATION);
        exit;
      end;

      vCodCol:=-10;
      while not vQuery.Eof do
      begin
        try
          if vQuery.FieldByName('cod_vendedor').AsInteger<>vCodCol then
          begin
            Application.ProcessMessages;
            vDadosIni.abreStatusProcessamento('', 'Inserindo lançamento para o vendedor: '+trim(vQuery.FieldByName('nome_vendedor').AsString));
            buscas.close;
            buscas.SQL.Text:='INSERT INTO LANC_DEBCRED (COD_LANC, COD_EMPRESA, COD_VENDEDOR, DATA_LANC, HORA_LANC, '+
              ' VL_LANCDEBCRED, DESCRICAO, ORIGEM_LANC, NPEDORIGEM) '+
              ' VALUES ((select COD from INCREMENTA_CODIGO('+vDadosIni.codEmpresa+', ''LANC_DEBCRED'')),'+vDadosIni.codEmpresa+
              ', :pCodVendedor, ' + vDadosIni.FusoSqlDate + ' ,' + vDadosIni.FusoSqlTime + ', :pValor, :pDescricao, :pTipoLanc, 0)';
            buscas.ParamByName('pCodVendedor').AsInteger:=vQuery.FieldByName('cod_vendedor').AsInteger;
            buscas.ParamByName('pValor').AsFloat:= roundto(vQuery.FieldByName('valor').AsFloat,-3);
            buscas.ParamByName('pDescricao').AsString:= vDescricao; //trim(vTipoLancDC.dataSet.FieldByName('DESCRICAOLANC').AsString);
            buscas.ParamByName('pTipoLanc').AsString:= vTipoLanc; //trim(vTipoLancDC.dataSet.FieldByName('TIPO_LANC').AsString);
            buscas.ExecSQL;
            vLanc:=vLanc+ trim(vQuery.FieldByName('nome_vendedor').AsString)+' -> '+ Format('%m', [vQuery.FieldByName('valor').AsFloat])+chr(13);
            vCodCol:=vQuery.FieldByName('cod_vendedor').AsInteger;
            vDadosIni.GravaAuditoria('COL032', 'INSERIR', 'SUCESSO '+ vDescricao+
//             trim(vTipoLancDC.dataSet.FieldByName('DESCRICAOLANC').AsString)+
             ' VENDEDOR: '+inttostr(vQuery.FieldByName('cod_vendedor').AsInteger) , 'LAN_DEBCRED', '', buscas);
          end;
          vQuery.Next;
        except
          vDadosIni.GravaAuditoria('COL032', 'INSERIR', 'FALHA '+vDescricao+
//          trim(vTipoLancDC.dataSet.FieldByName('DESCRICAOLANC').AsString)+
          ' VENDEDOR: '+inttostr(vQuery.FieldByName('cod_vendedor').AsInteger) , 'LAN_DEBCRED', '', buscas);
          vQuery.Next;
        end;
      end;
      result:=CommitaTransacao;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
    if vLanc<>'' then
      Application.MessageBox(Pchar('Foram feitos lançamentos para os vendedores abaixo.'+chr(13)+vLanc),'Informação',MB_OK+MB_ICONINFORMATION);
    vTipoLancDC.dataSet.Filtered:= false;
    if vQuery<> nil then
    begin
      vQuery.Close;
      vQuery.Free;
      vQuery:=nil;
    end;
    frmCadDebitoCredito.pnMesAno.Parent := frmCadDebitoCredito.tsOutros;
    formulario.Free;
    formulario := nil;
  end;
end;

function TLancDebitoCredito.delete: boolean;
var
  codlanc: string;
begin
  result := false;
  if dataSet.IsEmpty then
    exit;
  if not vDadosIni.PesqPros('COL031', 'EXCLUIR', 'INICIAR EXCLUSÃO :'+trim(dataSet.FieldByName('DESCRICAO').AsString), 'LAN_DEBCRED', dataSet.FieldByName('COD_LANC').AsString, buscas, false) then
    exit;
  codlanc := dataSet.FieldByName('COD_LANC').AsString;
  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    try
      result := inherited Delete;
      if Result then
        result := Apply;
      if result then
        result := CommitaTransacao;
      if Result then
        vDadosIni.GravaAuditoria('COL031', 'EXCLUIR', 'SUCESSO', 'LAN_DEBCRED', codlanc, buscas)
      else
        vDadosIni.GravaAuditoria('COL031', 'EXCLUIR', 'FALHA', 'LAN_DEBCRED', codlanc, buscas);
      Refresh;
    except
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('COL031', 'EXCLUIR', 'FALHA', 'LAN_DEBCRED', codlanc, buscas);
      Exit;
    end;
  end;
end;

destructor TLancDebitoCredito.Destroy;
begin
  if vTipoLancDC<>nil then
  begin
    vTipoLancDC.buscas.Free;
    vTipoLancDC.buscas:=nil;
    vTipoLancDC.Free;
    vTipoLancDC:=nil;
  end;
  if vListaColab<>nil then
  begin
    vListaColab.Free;
    vListaColab:=nil;
  end;
  inherited;
end;

function TLancDebitoCredito.insert: boolean;
begin
  if inherited Insert then
  begin
    if vTipoLancDC=nil then
      vTipoLancDC := TTipoLancDebCred.create;
    vTipoLancDC.ListaTipoLancDC;
    if vListaColab=nil then
      vListaColab := TListaColabDC.create;
    vListaColab.ListaColabDC;
    vTipoLancDC.ListaTipoLancDC;
    dataSet.FieldByName('COD_EMPRESA').AsInteger:=strtoint(vDadosIni.codEmpresa);
    dataSet.FieldByName('NPEDORIGEM').AsInteger:= 0;
    dataSet.FieldByName('DATA_LANC').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('HORA_LANC').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
  end;
end;

function TLancDebitoCredito.post: boolean;
var
  codigo: integer;
  vacao:string;
begin
  try
    Result := false;
    if not vDadosIni.PesqPros('COL029', 'SALVAR', '', 'LAN_DEBCRED',
      dataSet.FieldByName('COD_LANC').AsString, buscas, true) then
      Exit;

    if trim(dataSet.FieldByName('ORIGEM_LANC').AsString) = '' then
      raiseExceptionCreate('Origem do lançamento deve ser informado', 'DBLookupComboBox1')
    else if vTipoLancDC.dataSet.FieldByName('NATUREZA_LAN').AsString='' then
    begin
      raiseExceptionCreate('Natureza da origem do lançamento não existe no cadastro', 'DBLookupComboBox1');
    end;

    if vTipoLancDC.dataSet.FieldByName('NATUREZA_LAN').AsString='C' then
    begin
      dataSet.FieldByName('VL_LANCDEBCRED').AsFloat:= abs(dataSet.FieldByName('VL_LANCDEBCRED').AsFloat);
      if dataSet.FieldByName('VL_LANCDEBCRED').AsFloat<=0 then
        raiseExceptionCreate('Lançamento de crédito deve ser maior que zero', 'DBEdit6');
    end else if vTipoLancDC.dataSet.FieldByName('NATUREZA_LAN').AsString='D' then
    begin
      dataSet.FieldByName('VL_LANCDEBCRED').AsFloat:= -abs(dataSet.FieldByName('VL_LANCDEBCRED').AsFloat);
      if dataSet.FieldByName('VL_LANCDEBCRED').AsFloat>=0 then
        raiseExceptionCreate('Lançamento de débito deve ser menor que zero', 'DBEdit6');
    end;
    
    if trim(dataSet.FieldByName('DESCRICAO').AsString) = '' then
      raiseExceptionCreate('Descrição do lançamento deve ser informada', 'DBEdit7');

    dtmColaborador.SpIncCodigo.Transaction := transacao;
    dataSet.FieldByName('COD_LANC').AsInteger :=
        Gencodigo('LANC_DEBCRED', dtmColaborador.SpIncCodigo, vDadosIni.codEmpresa);

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('COL029', 'INSERIR', 'SUCESSO', 'LANC_DEBCRED',
        dataSet.FieldByName('COD_LANC').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('COL029', 'INSERIR', 'FALHA', 'LANC_DEBCRED',
        dataSet.FieldByName('COD_LANC').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TTipoLancDebCred }

constructor TTipoLancDebCred.create;
begin
  DataSet := TClientDataSet(dtmColaborador.cdsTipoLancdc);
  transacao := TIBTransaction(dtmColaborador.transacaoLanDebCred);
  buscas := TIBQuery.Create(Application);
  buscas.Database := dtmColaborador.qrTipoLancdc.Database;
  buscas.Transaction := transacao;
end;

function TTipoLancDebCred.delete: boolean;
var
  codlanc: string;
begin
  result := false;
  if dataSet.IsEmpty then
    exit;
  if not vDadosIni.PesqPros('COL037', 'EXCLUIR', 'INICIAR EXCLUSÃO :'+trim(dataSet.FieldByName('TIPO_LANC').AsString), 'TIPO_LANCDEBCRED', dataSet.FieldByName('COD_TIPOLANCDC').AsString, buscas, false) then
    exit;
  codlanc := dataSet.FieldByName('COD_TIPOLANCDC').AsString;
  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    try
      result := inherited Delete;
      if Result then
        result := Apply;
      if result then
        result := CommitaTransacao;
      if Result then
        vDadosIni.GravaAuditoria('COL037', 'EXCLUIR', 'SUCESSO', 'TIPO_LANCDEBCRED', codlanc, buscas)
      else
        vDadosIni.GravaAuditoria('COL037', 'EXCLUIR', 'FALHA', 'TIPO_LANCDEBCRED', codlanc, buscas);
      Refresh;
    except
      Cancel;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('COL037', 'EXCLUIR', 'FALHA', 'TIPO_LANCDEBCRED', codlanc, buscas);
      Exit;
    end;
  end;
end;

function TTipoLancDebCred.edit: boolean;
begin
  result:=false;
  if not vDadosIni.PesqPros('COL036', 'EDITAR', 'EDITANDO TIPO DE LANÇAMENTO DEB CRED ', 'TIPO_LANCDEBCRED', '', buscas, true) then
    exit;
  if dataSet.IsEmpty then
   exit
  else Result := inherited edit;
end;

function TTipoLancDebCred.insert: boolean;
begin
  result:=false;
  if not vDadosIni.PesqPros('COL035', 'INSERIR', 'INSERINDO TIPO DE LANÇAMENTO DEB CRED ', 'TIPO_LANCDEBCRED', '', buscas, true) then
    exit;
  result := inherited Insert;
  if result then
  begin
    dataSet.FieldByName('COD_EMPRESA').AsInteger:=strtoint(vDadosIni.codEmpresa);
    dataSet.FieldByName('NATUREZA_LAN').AsString:='C';
  end;
end;

function TTipoLancDebCred.ListaTipoLancDC: boolean;
begin
  result := montaSelect('SELECT * FROM tipo_lancdebcred ' +
      ' WHERE cod_empresa = ' + vDadosIni.codEmpresa);
  IndexFieldNames := 'TIPO_LANC';
end;

function TTipoLancDebCred.post: boolean;
var
  codigo: integer;
  vacao,vprocesso:string;
begin
  try
    Result := false;
    if dataSet.State=dsEdit then
    begin
      vacao:= 'EDITAR';
      vprocesso:= 'COL036'
    end
    else if dataSet.State=dsInsert then
    begin
      vacao:= 'INSERIR';
      vprocesso:= 'COL035'
    end
    else exit;

    if (trim(dataSet.FieldByName('NATUREZA_LAN').AsString) <> 'C') and
      (trim(dataSet.FieldByName('NATUREZA_LAN').AsString) <> 'D') then
      raiseExceptionCreate('Natureza do tipo de lançamento deve ser informada', 'DBComboBox1')
    else if trim(dataSet.FieldByName('TIPO_LANC').AsString) = '' then
      raiseExceptionCreate('Tipo de lançamento deve ser informado', 'DBEdit2')
    else if trim(dataSet.FieldByName('DESCRICAOLANC').AsString) = '' then
      raiseExceptionCreate('Informe uma descrição padrão para tipo de lançamento informado', 'DBEdit3');

    if dataSet.State=dsInsert then
    begin
      dtmColaborador.SpIncCodigo.Transaction := transacao;
      dataSet.FieldByName('COD_TIPOLANCDC').AsInteger :=
        Gencodigo('TIPO_LANCDEBCRED', dtmColaborador.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria(vprocesso, vacao, 'SUCESSO', 'TIPO_LANCDEBCRED',
        dataSet.FieldByName('COD_TIPOLANCDC').AsString, buscas)
    else
      vDadosIni.GravaAuditoria(vprocesso, vacao, 'FALHA', 'TIPO_LANCDEBCRED',
        dataSet.FieldByName('COD_TIPOLANCDC').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

{ TListaColab }

constructor TListaColabDC.create;
begin
  DataSet := TClientDataSet(dtmColaborador.cdsLcolab);
  transacao := TIBTransaction(dtmColaborador.transacaoLanDebCred);
end;

function TListaColabDC.ListaColabDC: boolean;
begin
  result := montaSelect('SELECT NOME_VENDEDOR,COD_VENDEDOR FROM colaborador ' +
      ' WHERE cod_empresa = ' + vDadosIni.codEmpresa);
  IndexFieldNames := 'NOME_VENDEDOR';
end;

{ TParticipante }

function TParticipante.AbreParticipante: boolean;
begin
 montaSelect('select * from PARTICIPANTE where ativo = 1');
end;

function TParticipante.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    montaSelect(ultimasql);
    result := false;
  end
  else
    result := montaSelect('SELECT * FROM PARTICIPANTE WHERE ativo = 0');
end;

procedure TParticipante.CadParticipante(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);

  if frmCadParticipante = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TfrmCadParticipante, frmCadParticipante);
  end;
  
  if (TipoForm > 0) and (not frmCadParticipante.Visible) then
    frmCadParticipante.ShowModal
  else if (not frmCadParticipante.Visible) then
    frmCadParticipante.Show
  else if frmCadParticipante.FormStyle = fsMDIChild then
    frmCadParticipante.Show
  else
    frmCadParticipante.ShowModal;
end;

constructor TParticipante.create;
begin
 if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsParticipante);
  buscas := tibquery(dtmColaborador.qrBuscas);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
  vCidades := TCidadesColab.create;
  vUF := TUFColab.create;
  vBairro := TBairroColab.create;
  vCidades.abreCidade;
  vUF.abreUF;
  vBairro.abreBairro;
  dataSet.FieldByName('NOME_PARTICIPANTE').DisplayLabel := vDadosIni.vPedVnd.descricaoParticipante;
  
  montaSelect('select * from PARTICIPANTE where 1=0');
end;

function TParticipante.delete: boolean;
var
  vtemp: string;
	vApagar: boolean;
  vCod_Participante: string;
  vNome_Participante: string;
  I: Integer;
begin
  try
    Result := False;
    if dataSet.IsEmpty then
      exit;

    try
      vApagar            := dataSet.FieldByName('ATIVO').AsInteger = 0;
      vCod_Participante  := trim(dataSet.FieldByName('COD_PARTICIPANTE').AsString);
      vNome_Participante := trim(dataSet.FieldByName('NOME_PARTICIPANTE').AsString);

      prepare_loop('SEL = ''S''');

      if not dataset.IsEmpty then
      begin
        vApagar            := dataSet.FieldByName('ATIVO').AsInteger = 0;
        vCod_Participante  := '';
        vNome_Participante := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
      if (trim(vCod_Participante) <> '') then
        prepare_loop('COD_PARTICIPANTE = ' + vCod_Participante)
      else
        prepare_loop('SEL = ''S''');

      if vApagar then
      begin
        vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
          UpperCase(vDadosIni.vPedVnd.descricaoParticipante) + #13 +
          'Código: ' + vCod_Participante + #13 +
          'Nome: ' + vNome_Participante;

        if (trim(vCod_Participante) = '') then
          vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

        if not vDadosIni.PesqPros('BAS397', 'EXCLUIR', '', 'PARTICIPANTE',
          vDadosIni.IfThen(trim(vCod_Participante) <> '', vCod_Participante, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end
      else
      begin
        vtemp := 'Tem certeza que deseja mover este registro para a lixeira?' + #13 + #13 +
          UpperCase(vDadosIni.vPedVnd.descricaoParticipante) + #13 +
          'Código: ' + vCod_Participante + #13 +
          'Nome: ' + vNome_Participante;

        if (trim(vCod_Participante) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

        if not vDadosIni.PesqPros('BAS396', 'EXCLUIR', '', 'PARTICIPANTE',
           vDadosIni.IfThen(trim(vCod_Participante) <> '', vCod_Participante, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end;

      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo participante(s) permanentemente')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo participante(s) para lixeira');

      dataset.First;
      while not dataset.Eof do
      begin
        if vApagar then
          vDadosIni.abreStatusProcessamento('', 'Excluíndo participante(s) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
        else
          vDadosIni.abreStatusProcessamento('', 'Movendo participante(s) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        if vApagar then
        begin
          SqlExec(' update participante set ativo = 99 ' +
            ' where cod_participante = %d and cod_empresa = %d ',
            [fint('cod_participante'), fint('cod_empresa')], buscas);
          if (trim(vCod_Participante) = '') then
            vDadosIni.GravaAuditoria('BAS397', 'EXCLUIR', '', 'PARTICIPANTE',
              dataSet.FieldByName('COD_PARTICIPANTE').AsString, buscas);
        end
        else
        begin
          SqlExec(' update participante set ativo = 0 ' +
            ' where cod_participante = %d and cod_empresa = %d ',
            [fint('cod_participante'), fint('cod_empresa')], buscas);

          if (trim(vCod_Participante) = '') then
            vDadosIni.GravaAuditoria('BAS396', 'EXCLUIR', '', 'PARTICIPANTE',
              dataSet.FieldByName('COD_PARTICIPANTE').AsString, buscas);
        end;

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;

    Result := CommitaTransacao;
    if Result then
    begin
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'BAS397', 'BAS396'),
        'EXCLUIR', 'SUCESSO', 'PARTICIPANTE',
        vDadosIni.IfThen(trim(vCod_Participante) <> '', vCod_Participante, ''), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'BAS397', 'BAS396'),
        'EXCLUIR', 'FALHA', 'PARTICIPANTE',
        vDadosIni.IfThen(trim(vCod_Participante) <> '', vCod_Participante, ''), buscas);
    end;
    if Result then
      montaSelect(ultimasql);
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

destructor TParticipante.Destroy;
begin
  if vUF <> nil then
    FreeAndNil(vUF);
  if vCidades <> nil then
    FreeAndNil(vCidades);
  if vBairro <> nil then
    FreeAndNil(vBairro);
  inherited;
end;

function TParticipante.edit: boolean;
begin
  result := false;
  if IsEmpty then
    exit;
  if inherited Edit then
  begin
    if not vCidades.Active then
      vCidades.abreCidade;

    if not vUF.Active then
      vUF.abreUF;

    if not vBairro.Active then
      vBairro.abreBairro;

    if dataSet.State = dsInsert then
      dataSet.FieldByName('data_mod_part').AsDateTime := vDadosIni.getDataBanco(buscas);

    dataSet.FieldByName('fone_participante').AsString := vDadosIni.StringReplace2(
      dataSet.FieldByName('fone_participante').AsString, '()-', '   ', True);

    dataSet.FieldByName('cep_participante').AsString := vDadosIni.StringReplace2(
      dataSet.FieldByName('cep_participante').AsString, '-', ' ', True);

    dataSet.FieldByName('EMAIL').AsString := LowerCase(dataSet.FieldByName('EMAIL').AsString);

    Result := true;
  end;
end;

function TParticipante.insert: boolean;
begin
 if not dataSet.Active then
    montaSelect('select * from participante where 1 =0');

  if not vCidades.Active then
    vCidades.abreCidade;

  if not vUF.Active then
    vUF.abreUF;

  if not vBairro.Active then
    vBairro.abreBairro;

  if inherited insert then
  begin
    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('data_cad_part').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('data_mod_part').AsDateTime := dataSet.FieldByName('data_cad_part').AsDateTime;
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    end;
    Result := true;
  end;
end;

function TParticipante.post: boolean;
var
  temp, acaoDataset: string;
  CEPs : TCEP;
  vEmails: string;
  vListaEmail: TStringList;
  I: Integer;
begin
  try
    Result := false;
    acaoDataset := '';
    if not (dataSet.State in [dsInsert, dsEdit]) then
      exit;
    if dataSet.State = dsInsert then
      acaoDataset := 'INSERIR'
    else
      acaoDataset := 'EDITAR';

    if trim(dataSet.FieldByName('NOME_PARTICIPANTE').AsString) = '' then
      raiseExceptionCreate('O campo nome é não foi informado.', 'DBEdit2');

    if trim(dataSet.FieldByName('END_PARTICIPANTE').AsString) = '' then
      raiseExceptionCreate('O campo endereço é não foi informado.', 'DBEdit3');

    if dataSet.FieldByName('COD_BAIRRO').AsInteger <= 0 then
      raiseExceptionCreate('O campo Bairro não foi informado', 'DBEdit34');

    if dataSet.FieldByName('COD_CIDADE').AsInteger <= 0 then
      raiseExceptionCreate('O campo Cidade não foi informado', 'DBEdit38');

    if dataSet.FieldByName('CODIGO_UF').AsInteger <= 0 then
      raiseExceptionCreate('O campo estado não foi informado', 'DBLookupComboBox2');

    if Trim(dataSet.FieldByName('email').AsString) <> '' then
    begin
      vEmails := LowerCase(Trim(dataSet.FieldByName('email').AsString));
      vEmails := StringReplace(vEmails, ',', ';', [rfReplaceAll]);
      vListaEmail := TStringList.Create;
      vListaEmail.Clear;
      vListaEmail.Sorted := True;
      vListaEmail.Sort;
      vListaEmail.Duplicates := dupIgnore;

      vListaEmail := vDadosIni.Split(vEmails, ';');
      for I := 0 to vListaEmail.Count - 1 do
        if Trim(vListaEmail[i]) <> '' then
          if not vDadosIni.validaTextoEMail2(Trim(vListaEmail[i])) then
            raiseExceptionCreate('email "' + Trim(vListaEmail[i]) + '" informado inválido', 'DBEdit14');
      dataSet.FieldByName('email').AsString := vEmails;
    end;

    temp := retornaValor('select NOME_CIDADE as valor from cidades where COD_CIDADE =' +
      dataSet.FieldByName('COD_CIDADE').AsString);
    if temp <> '' then
      dataSet.FieldByName('CIDADE_PARTICIPANTE').AsString := trim(temp);

    temp := trim(retornaValor('select NOME_BAIRRO as valor from BAIRROS where COD_BAIRRO =' +
      dataSet.FieldByName('COD_BAIRRO').AsString));
    if temp <> '' then
      dataSet.FieldByName('BAIRRO_PARTICIPANTE').AsString := temp;

    temp := trim(retornaValor('select SIGLA_UF as valor from ESTADOS where CODIGO_UF =' +
      dataSet.FieldByName('CODIGO_UF').AsString));
    if temp <> '' then
      dataSet.FieldByName('SIGLA_UF').AsString := temp;  

    if dataSet.State = dsInsert then
      dataSet.FieldByName('COD_PARTICIPANTE').AsInteger := Gencodigo('PARTICIPANTE',
        dtmColaborador.SpIncCodigo, vDadosIni.codEmpresa);

    Result := inherited post;

   CEPs._GravarCEPAutomatico(dataSet.FieldByName('CEP_PARTICIPANTE').AsString,
   dataSet.FieldByName('CODIGO_UF').AsInteger,
   dataSet.FieldByName('COD_CIDADE').AsInteger,
   dataSet.FieldByName('COD_BAIRRO').AsInteger,
   dataSet.FieldByName('END_PARTICIPANTE').AsString,'','','','','');

    if (dataSet.ChangeCount = 0) then
    begin
      Result := true;
      RollBackTransacao;
      exit;
    end;
    temp := '';
    if dataSet.ChangeCount > 0 then
      temp := 'PARTICIPANTE';

    if Apply then
      result := CommitaTransacao;

    if result then
      vDadosIni.GravaAuditoria('BAS399', acaoDataset, 'SUCESSO', temp, dataSet.FieldByName('COD_PARTICIPANTE').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('BAS399', acaoDataset, 'FALHA', temp, dataSet.FieldByName('COD_PARTICIPANTE').AsString, buscas);
    Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TParticipante.renconciliaErro(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
   if (Pos('FK_PEDVENDA_PART', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela PEDVENDA', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if (Pos('FK_PEDVENDA_PROD_PART', e.Message) <> 0) then
    begin
      Application.MessageBox('Erro ao Deletar Item' + chr(13) + 'Item em uso na tabela PEDVENDA_PROD', 'Erro', MB_OK + MB_ICONERROR);
      Abort;
    end;
end;

function TParticipante.restaurarLixeira: boolean;
var
	vCodParticipante: string;
	vNomeParticipante: string;
  vtemp: string;
begin
	try
  	result := false;
    if dataSet.IsEmpty then
      exit;

    if dataSet.FieldByName('ATIVO').asinteger <> 0 then
    begin
      Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
      vCodParticipante  := trim(dataSet.FieldByName('COD_PARTICIPANTE').AsString);
      vNomeParticipante := trim(dataSet.FieldByName('NOME_PARTICIPANTE').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vCodParticipante  := '';
        vNomeParticipante := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(vCodParticipante) <> '') then
      	prepare_loop('COD_PARTICIPANTE = ' + vCodParticipante)
      else
		    prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        UpperCase(vDadosIni.vPedVnd.descricaoParticipante) + #13 +
        'Código: ' + vCodParticipante + #13 +
        'Nome: ' + vNomeParticipante;

      if (trim(vNomeParticipante) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('BAS398', 'RESTAURAR', '', 'PARTICIPANTE',
        vDadosIni.IfThen(trim(vCodParticipante) <> '', vCodParticipante, ''), buscas, true) then
          exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando participante(s)');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando participante(s) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update participante set ativo = 1 ' +
          ' where cod_participante = %d and cod_empresa = %d ',
          [fint('cod_participante'), fint('cod_empresa')], buscas);

        if (trim(vCodParticipante) = '') then
          vDadosIni.GravaAuditoria('BAS398', 'RESTAURAR', '', 'PARTICIPANTE',
            dataSet.FieldByName('COD_PARTICIPANTE').AsString, buscas);

        dataset.Next;
      end;
    finally
    	vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    Result := CommitaTransacao;
    if Result then
    begin
    	vDadosIni.GravaAuditoria('BAS398', 'RESTAURAR', 'SUCESSO', 'PARTICIPANTE',
        vDadosIni.IfThen(trim(vCodParticipante) <> '', vCodParticipante, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
    	vDadosIni.GravaAuditoria('BAS398', 'RESTAURAR', 'FALHA', 'PARTICIPANTE',
        vDadosIni.IfThen(trim(vCodParticipante) <> '', vCodParticipante, ''), buscas);
    end;

    if Result then
      montaSelect(ultimasql);
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TParticipante.StatusLixeira: boolean;
begin
 result := ExecutaComandosSql('SELECT first 1 COD_PARTICIPANTE FROM PARTICIPANTE where ativo = 0');
end;

procedure TParticipante._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TParticipante._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TParticipante._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    if not dataSet.Active then
      Exit;

    dataSet.DisableControls;
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
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TColaboradorContatoMsg }

function TColaboradorContatoMsg.Abrir: TColaboradorContatoMsg;
begin
  FAplicativo.Abrir;
  FTipo.Abrir;
  Result := Self;
	ClientOpen(' select * from msg_contato where cod_vendedor = %d and cod_empresa = %d and ativo = %d order by id_msg_aplicativo ',
             [FOwner.fint('cod_vendedor'), vDadosIni.cod_empresa, 1]);
  dataSet.FieldByName('id_msg_aplicativo').OnGetText     := DataSetGetTextAplicativo;

	SqlOpen(' select msg_contato_tipo.id_msg_contato, msg_contato_tipo.id_tipo_contato from msg_contato ' +
  	' inner join msg_contato_tipo on ' +
    ' msg_contato_tipo.id_msg_contato = msg_contato.id and msg_contato_tipo.cod_empresa = msg_contato.cod_empresa ' +
    ' where msg_contato.cod_vendedor = %d ' +
    ' and msg_contato.cod_empresa = %d ' +
    ' and msg_contato.ativo = %d ' +
    ' order by msg_contato_tipo.id_msg_contato, msg_contato_tipo.id_tipo_contato ',
    [FOwner.fint('cod_vendedor'), vDadosIni.cod_empresa, 1], buscas);

  FContatoMsgTipoContrato.FtempContatoMsgTipoContato.EmptyDataSet;
  buscas.First;
  while not buscas.Eof do
  begin
  	FContatoMsgTipoContrato.FtempContatoMsgTipoContato.Insert;
    FContatoMsgTipoContrato.FtempContatoMsgTipoContato.FieldByName('id_msg_contato').AsInteger := buscas.FieldByName('id_msg_contato').AsInteger;
    FContatoMsgTipoContrato.FtempContatoMsgTipoContato.FieldByName('id_tipo_contato').AsInteger := buscas.FieldByName('id_tipo_contato').AsInteger;
    FContatoMsgTipoContrato.FtempContatoMsgTipoContato.FieldByName('ativo').AsInteger := 1;
    FContatoMsgTipoContrato.FtempContatoMsgTipoContato.Post;

    buscas.Next;
  end;
end;

function TColaboradorContatoMsg.Apply: Boolean;
var
	vId: Integer;
begin
	prepare_loop();
  try
    while not dataSet.Eof do
    begin
      vId := dataSet.FieldByName('id').AsInteger;

      if dataSet.FieldByName('id').AsInteger <= 0 then
      begin
        dataSet.Edit;
        dataSet.FieldByName('id').AsInteger := Gencodigo('MSG_CONTATO', dtmColaborador.SpIncCodigo, vDadosIni.codEmpresa);
        dataSet.Post;
      end;

      if dataSet.ChangeCount > 0 then
        Result := inherited Apply
      else
        Result := True;

      FContatoMsgTipoContrato.Post(vId);

      dataSet.Next;
    end;
  finally
    prepare_loop_done();
  end;
end;

constructor TColaboradorContatoMsg.Create(AOwer: TColaborador);
begin
  inherited Create(dtmAtivo.bancoHw, AOwer.transacao);
  FOwner := AOwer;
  FAplicativo := TAplicativo_Msg.Create(dtmAtivo.bancoHw);
  FTipo := TTipo_Contato.Create(dtmAtivo.bancoHw);
  FContatoMsgTipoContrato := TColaboradorContatoMsgTipoContato.Create(Self);
  TableName := 'MSG_CONTATO';
  FID := 0 - 999999;
end;

function TColaboradorContatoMsg.DataAudit: string;
begin
  StrAuditoria := Format('%d-%s-%s', [fint('id_msg_aplicativo'), fstr('contato'), fstr('identificador')]);
  Result := StrAuditoria;
end;

procedure TColaboradorContatoMsg.DataSetGetTextAplicativo(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if Sender.FieldName = 'ID' then
    Text := vDadosIni.IfThen(fint('ID') < 0 , '0', fstr('id'))
  else if Sender.FieldName = 'ID_MSG_APLICATIVO' then
    if FAplicativo.Active then
    begin
    	if fint('id_msg_aplicativo') <= 0 then
        Text := ''
      else
      begin
        FAplicativo.dataSet.Locate('id', fint('id_msg_aplicativo'), []);
        Text := FAplicativo.fstr('aplicativo');
      end;
    end;
end;

function TColaboradorContatoMsg.Delete: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  try
    if not Auditor.Processo('COL043', DataAudit, KeyAudit).ExigirConfirmacao.Excluir.Permitido then
      Exit;

    if fint('id') <= 0 then
    begin
    	Result := inherited Delete;

      if Result then
      	Auditor.GravarMensagem('EXCLUIDO - AGUARDANDO SALVAR COLABORADOR');
    end
    else
    begin
      Result := inherited Edit;
      if Result then
      begin
        fdata('ativo').Put(99);
        Result := inherited Post;

        if dataSet.ChangeCount > 0 then
          Result := inherited Apply
        else
          Result := True;

        if Result then
          Refresh;

        if Result then
          Auditor.GravarMensagem('EXCLUIDO - AGUARDANDO SALVAR COLABORADOR');
      end;
    end;

  except on E: Exception do
    begin
      transacao.Rollback;
      vDadosIni.ShowErro('Erro ao excluir plataforma. Erro: %s', [e.Message]);
      vDadosIni.registraErro('TColaboradorContatoMsg.Delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TColaboradorContatoMsg.Destroy;
begin
  FAplicativo.Free;
  FTipo.Free;
  inherited;
end;

procedure TColaboradorContatoMsg.EditarTipoContato(
  pCk_contrato_pla_tipos_contato: TCheckListBox);
begin
  try
    FContatoMsgTipoContrato.Abrir(fint('id'));

    pCk_contrato_pla_tipos_contato.Clear;

    buscas.Close;
    buscas.SQL.Text := ' select tipo_contato.id, tipo_contato.tipo from tipo_contato ' +
      ' where tipo_contato.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    buscas.FetchAll;

    buscas.First;
    while not buscas.Eof do
    begin
      pCk_contrato_pla_tipos_contato.Items.Add(
        vDadosIni.StrZero(buscas.FieldByName('id').AsInteger, 3) + ' | ' +
        trim(buscas.FieldByName('tipo').AsString)
      );

      FContatoMsgTipoContrato.FtempContatoMsgTipoContato.Filter :=
      	' id_msg_contato = ' + IntToStr(fint('id')) +
      	' and id_tipo_contato = ' + IntToStr(buscas.FieldByName('id').AsInteger) +
        ' and ativo = 1 ';
      FContatoMsgTipoContrato.FtempContatoMsgTipoContato.Filtered := True;
      if not FContatoMsgTipoContrato.FtempContatoMsgTipoContato.IsEmpty then
      	pCk_contrato_pla_tipos_contato.Checked[pCk_contrato_pla_tipos_contato.Count - 1] := True;

      buscas.Next;
    end;
  finally
    FContatoMsgTipoContrato.FtempContatoMsgTipoContato.Filtered := False;
  end;
end;

procedure TColaboradorContatoMsg.InserirTipoContato(
  pCk_contrato_pla_tipos_contato: TCheckListBox);
begin
  FContatoMsgTipoContrato.Abrir(0);

	pCk_contrato_pla_tipos_contato.Clear;

  buscas.Close;
  buscas.SQL.Text := ' select tipo_contato.id, tipo_contato.tipo from tipo_contato ' +
  	' where tipo_contato.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  buscas.First;
  while not buscas.Eof do
  begin
  	pCk_contrato_pla_tipos_contato.Items.Add(
      vDadosIni.StrZero(buscas.FieldByName('id').AsInteger, 3) + ' | ' +
    	trim(buscas.FieldByName('tipo').AsString)
    );

    buscas.Next;
  end;

  if pCk_contrato_pla_tipos_contato.Count = 1 then
  	pCk_contrato_pla_tipos_contato.Checked[pCk_contrato_pla_tipos_contato.Count - 1] := True;
end;

function TColaboradorContatoMsg.KeyAudit: string;
begin
  StrAuditoriaCod := Format('%d-%d', [FOwner.fint('cod_vendedor'), fint('id')]);
  Result := StrAuditoriaCod;
end;

function TColaboradorContatoMsg.Post(
  pCk_contrato_pla_tipos_contato: TCheckListBox): Boolean;
var
	acao: string;
  lista: TStrings;
  vSel: Boolean;
  I: Integer;
begin
  Result := False;

  if dataSet.State = dsEdit then
    acao := 'EDITAR'
  else
    acao := 'INSERIR';

  try
  	 if fint('id_msg_aplicativo') = 0 then
      raiseExceptionCreate('O campo aplicativo deve ser preenchido', 'ed_contato_pla_aplicativo');

    if fempty('contato') then
      raiseExceptionCreate('O campo contato deve ser preenchido', 'ed_contato_pla_contato');

	  if fempty('identificador') then
    	raiseExceptionCreate('O campo ' +
      	Copy(Aplicativo.fstr('aplicativo'), 1, 1) + LowerCase(Copy(Aplicativo.fstr('aplicativo'), 2, Length(Aplicativo.fstr('aplicativo')) - 1)) +
        	' deve ser preenchido', 'ed_contato_pla_identificacao');

    if vDadosIni.retornaNomeAplicativo(fint('id_msg_aplicativo')) = 'E-MAIL' then
  	 begin
      if not fempty('identificador') then
      begin
        if (not vDadosIni._ValidarEMail(Trim(fstr('identificador')))) then
        	raiseExceptionCreate('E-mail "' + Trim(fstr('identificador')) + '" informado inválido', 'ed_contato_pla_identificacao');
      end;
    end
    else if vDadosIni.retornaNomeAplicativo(fint('id_msg_aplicativo')) = 'WHATSAPP' then
    begin
    	if not fempty('identificador') then
      begin
      	if (not vDadosIni._ValidarCelular(Trim(fstr('identificador')))) then
        	raiseExceptionCreate('WhatsApp "' + Trim(fstr('identificador')) + '" informado inválido', 'ed_contato_pla_identificacao');
      end;
    end
    else if vDadosIni.retornaNomeAplicativo(fint('id_msg_aplicativo')) = 'TELEGRAM' then
    begin
    	if not fempty('identificador') then
      begin
      	if (not vDadosIni._ValidarCelular(Trim(fstr('identificador')))) then
        	raiseExceptionCreate('Telegram "' + Trim(fstr('identificador')) + '" informado inválido, informar somente números', 'ed_contato_pla_identificacao');
      end;
    end;

    if pCk_contrato_pla_tipos_contato.Count <= 0 then
    	raiseExceptionCreate('Tipo de contato deve ser informado.', 'ck_contrato_pla_tipos_contato');

    vSel := False;
    for I := 0 to pCk_contrato_pla_tipos_contato.Count - 1 do
    	if pCk_contrato_pla_tipos_contato.Checked[I] then
      begin
      	vSel := True;
        Break;
      end;

    if not vSel then
    	raiseExceptionCreate('Tipo de contato deve ser informado.', 'ck_contrato_pla_tipos_contato');

    SqlOpen(' select msg_contato.id from msg_contato ' +
    	' where msg_contato.cod_vendedor = %d ' +
      ' and msg_contato.cod_empresa = %d ' +
      ' and msg_contato.id_msg_aplicativo = %d ' +
      ' and msg_contato.identificador = %s ' +
      ' and msg_contato.ativo = %d ' +
      ' and msg_contato.id <> %d ',
      [FOwner.fint('cod_vendedor'), vDadosIni.cod_empresa, fint('id_msg_aplicativo'), trim(fstrq('identificador')), 1, fint('id')], buscas);

    if not buscas.IsEmpty then
    	raiseExceptionCreate('Identificação já existe registro para essa Colaborador e Aplicativo:' + #13 + #13 +
        'Aplicativo: ' + trim(Aplicativo.fstr('aplicativo')) + #13 +
        'Identificação: ' + trim(fstr('identificador')), 'ed_contato_pla_identificacao');

    if fint('id') = 0 then
    begin
      fdata('id').Put(FID);
      FID := FID + 1;
    end;

    fdata('cod_vendedor').Put(FOwner.fint('cod_vendedor'));
    fdata('cod_empresa').Put(vDadosIni.cod_empresa);
    fdata('ativo').Put(1);

    Result := inherited Post;

    if dataSet.ChangeCount > 0 then
      Result := inherited Apply
    else
      Result := True;

    FContatoMsgTipoContrato.Post(pCk_contrato_pla_tipos_contato);

    Auditor.GravarMensagem(DataAudit);

  except on E: Exception do
    begin
      registraErro('TColaboradorContatoMsg.Post Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar dados' + #13 + #13 + E.Message);
    end;
  end;
end;

{ TAplicativo_Msg }

function TAplicativo_Msg.Abrir: TAplicativo_Msg;
begin
  Result := Self;
  ClientOpen(' select msg_aplicativo.id, msg_aplicativo.aplicativo from msg_aplicativo ' +
  					 ' where msg_aplicativo.id > 0 ' +
             ' and (select count(*) from msg_plataforma ' +
             '		  where msg_plataforma.id_msg_aplicativo = msg_aplicativo.id ' +
             '      and msg_plataforma.cod_empresa = ' + vDadosIni.codEmpresa + ') <> 0 ' +
             ' order by msg_aplicativo.id ');
  TableName := 'MSG_APLICATIVO';
end;

{ TTipo_Contato }

function TTipo_Contato.Abrir: TTipo_Contato;
begin
  Result := Self;
  ClientOpen('select * from tipo_contato where cod_empresa = %d', [vDadosIni.cod_empresa]);
  TableName := 'TIPO_CONTATO';
end;

function TTipo_Contato.Delete: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if SqlOpen('select count(*) as contador from clientes_contato where cod_empresa = %d and tipo_id = %d',
             [vDadosIni.cod_empresa, fint('id')]).FieldByName('contador').AsInteger > 0 then
  begin
    ShowErro('Tipo de contato está sendo usado em %d registros. Não é permitido excluir', [buscas.FieldByName('contador').AsInteger]);
    Exit;
  end;

  if SqlOpen('select count(*) as contador from msg_contato_tipo where cod_empresa = %d and id_tipo_contato = %d',
             [vDadosIni.cod_empresa, fint('id')]).FieldByName('contador').AsInteger > 0 then
  begin
    ShowErro('Tipo de contato está sendo usado em %d registros. Não é permitido excluir', [buscas.FieldByName('contador').AsInteger]);
    Exit;
  end;

  dataSet.Delete;
  if Apply then
  begin
    CommitaTransacao;
    Auditor.Sucesso.Salvar.GravarMensagem('');
    Refresh;
    Result := True;
  end
  else
  begin
    RollBackTransacao;
    Auditor.Falha.Salvar.GravarMensagem('');
    Result := False;
  end;
end;

function TTipo_Contato.Post: Boolean;
begin
  Result := False;
  try
    if fempty('tipo') then
      raiseExceptionCreate('O tipo de contato deve ser preenchido');

    if not SqlOpen('select tipo from tipo_contato where cod_empresa = %d and tipo = %s and id <> %d',
                   [vDadosIni.cod_empresa, fstrq('tipo'), fint('id')]).IsEmpty then
      raiseExceptionCreate('Já existe um tipo com a mesma descrição');

    fdata('cod_empresa').Put(vDadosIni.cod_empresa);
    fdata('id').Put(IfThen(fint('id') > 0, fint('id')));

    if inherited Post then
    begin
      Result := Apply;
      CommitaTransacao;
      Auditor.Salvar.Sucesso.GravarMensagem(fstr('tipo'));
      Refresh;
    end
    else
    begin
      Result := False;
      RollBackTransacao;
      Auditor.Salvar.Falha.GravarMensagem(fstr('tipo'));
    end;

  except on E: Exception do
    begin
      RollBackTransacao;
      Auditor.Salvar.Falha.GravarMensagem(fstr('tipo'));
      registraErro('TTipo_Contato.Post Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar dados' + #13 + #13 + E.Message);    
    end;
  end;
end;

{ TColaboradorContatoMsgTipoContato }

function TColaboradorContatoMsgTipoContato.Abrir: TColaboradorContatoMsgTipoContato;
begin
  Result := Self;
	ClientOpen(' select * from msg_contato_tipo where id_msg_contato = 0 and id_tipo_contato = 0 and cod_empresa = %d ',
             [0, vDadosIni.cod_empresa]);
end;

function TColaboradorContatoMsgTipoContato.Abrir(
  pIdMensContato: Integer): TColaboradorContatoMsgTipoContato;
begin
  Result := Self;
	ClientOpen(' select * from msg_contato_tipo where id_msg_contato = %d and cod_empresa = %d ',
             [pIdMensContato, vDadosIni.cod_empresa]);
end;

function TColaboradorContatoMsgTipoContato.Abrir(pIdMensContato,
  pIdTipoContato: Integer): TColaboradorContatoMsgTipoContato;
begin
  Result := Self;
	ClientOpen(' select * from msg_contato_tipo where id_msg_contato = %d and id_tipo_contato = %d and cod_empresa = %d ',
             [pIdMensContato, pIdTipoContato, vDadosIni.cod_empresa]);
end;

function TColaboradorContatoMsgTipoContato.Apply: Boolean;
begin
  if dataSet.ChangeCount > 0 then
    Result := inherited Apply
  else
    Result := True;
end;

constructor TColaboradorContatoMsgTipoContato.Create(
  AOwer: TColaboradorContatoMsg);
begin
  inherited Create(dtmAtivo.bancoHw, AOwer.transacao);
  FOwner := AOwer;
  TableName := 'MSG_CONTATO_TIPO';

	try
    FtempContatoMsgTipoContato := TClientDataSet.Create(nil);
    FtempContatoMsgTipoContato.Close;
    FtempContatoMsgTipoContato.FieldDefs.Clear;
    FtempContatoMsgTipoContato.FieldDefs.Add('ID_TIPO_CONTATO', ftInteger, 0, false);
    FtempContatoMsgTipoContato.FieldDefs.Add('ID_MSG_CONTATO', ftInteger, 0, false);
    FtempContatoMsgTipoContato.FieldDefs.Add('ATIVO', ftInteger, 0, false);
  except
  end;

  if FtempContatoMsgTipoContato.Tag = 0 then
  try
    FtempContatoMsgTipoContato.CreateDataSet;
    FtempContatoMsgTipoContato.Tag := 22;
  except
  end;
end;

function TColaboradorContatoMsgTipoContato.Post(
  pCk_contrato_pla_tipos_contato: TCheckListBox): Boolean;
var
	vIdTipoContato: Integer;
  I: Integer;
begin
	Result := False;

  try
  	try
      for I := 0 to pCk_contrato_pla_tipos_contato.Count - 1 do
      begin
        vIdTipoContato := StrToInt(Copy(pCk_contrato_pla_tipos_contato.Items[i], 1, Pos(' | ', pCk_contrato_pla_tipos_contato.Items[i]) - 1));

      	FtempContatoMsgTipoContato.Filter :=
        	' id_msg_contato = ' + IntToStr(FOwner.fint('id')) +
        	' and id_tipo_contato = ' + IntToStr(vIdTipoContato);
        FtempContatoMsgTipoContato.Filtered := True;

        if (pCk_contrato_pla_tipos_contato.Checked[I]) then
        begin
        	if (FtempContatoMsgTipoContato.IsEmpty) then
          begin
            FtempContatoMsgTipoContato.Insert;
            FtempContatoMsgTipoContato.FieldByName('id_msg_contato').AsInteger := FOwner.fint('id');
            FtempContatoMsgTipoContato.FieldByName('id_tipo_contato').AsInteger := vIdTipoContato;
          end
          else
          	FtempContatoMsgTipoContato.Edit;
          FtempContatoMsgTipoContato.FieldByName('ativo').AsInteger := 1;
          FtempContatoMsgTipoContato.Post;
        end
        else if (not pCk_contrato_pla_tipos_contato.Checked[I]) and (not FtempContatoMsgTipoContato.IsEmpty) then
        begin
        	FtempContatoMsgTipoContato.Edit;
          FtempContatoMsgTipoContato.FieldByName('ativo').AsInteger := 99;
          FtempContatoMsgTipoContato.Post;
        end;
      end;
    finally
    	FtempContatoMsgTipoContato.Filtered := False;
    end;

  except on E: Exception do
    begin
      registraErro('TColaboradorContatoMsgTipoContato.Post Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro ao salvar dados' + #13 + #13 + E.Message);
    end;
  end;
end;

function TColaboradorContatoMsgTipoContato.Post(pId: Integer): Boolean;
begin
  FtempContatoMsgTipoContato.Filter := ' id_msg_contato = ' + IntToStr(pId);
  FtempContatoMsgTipoContato.Filtered := True;

  FtempContatoMsgTipoContato.First;
  while not FtempContatoMsgTipoContato.Eof do
  begin
    Abrir(pId, FtempContatoMsgTipoContato.FieldByName('id_tipo_contato').AsInteger);

    if (dataSet.IsEmpty) and (FtempContatoMsgTipoContato.FieldByName('ativo').AsInteger = 1) then
    begin
      dataSet.Insert;
      dataSet.FieldByName('id_msg_contato').AsInteger := FOwner.fint('id');
      dataSet.FieldByName('id_tipo_contato').AsInteger := FtempContatoMsgTipoContato.FieldByName('id_tipo_contato').AsInteger;
      dataSet.FieldByName('cod_empresa').AsInteger := vDadosIni.cod_empresa;
      dataSet.Post;
    end
    else if (not dataSet.IsEmpty) and (FtempContatoMsgTipoContato.FieldByName('ativo').AsInteger = 99) then
    	dataSet.Delete;

    if dataSet.ChangeCount > 0 then
      Result := inherited Apply
    else
      Result := True;
    
    FtempContatoMsgTipoContato.Next;
  end;
end;

{ TCalendColaboradorExc }

constructor TCalendColaboradorExc.create;
begin
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsCalendColaboradorExc);
  buscas := tibquery(dtmColaborador.qrBuscas);
  transacao := tibtransaction(dtmColaborador.transacaoColab);

  ColaboradorCalendColaboradorExc := TColaboradorCalendColaboradorExc.create;
end;

destructor TCalendColaboradorExc.Destroy;
begin
  ColaboradorCalendColaboradorExc.Free;
  ColaboradorCalendColaboradorExc := nil;

  inherited;
end;

function TCalendColaboradorExc.insert: boolean;
begin
 if not vDadosIni.PesqPros('COL047', 'INCLUIR', '', 'CALEND_COLAB_EXC',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect(' select calend_colab_exc.*, colaborador.nome_vendedor from calend_colab_exc ' +
      ' inner join colaborador on ' +
      '   colaborador.cod_vendedor = calend_colab_exc.cod_colaborador ' +
      '   and colaborador.cod_empresa = calend_colab_exc.cod_empresa ' +
      ' where calend_colab_exc.codigo = 0 and calend_colab_exc.cod_empresa = 0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('COD_COLABORADOR').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('TRABALHAR').AsString := 'N';

    ColaboradorCalendColaboradorExc.AbreColaboradorCalendColaboradorExc(0);
  end;
end;

function TCalendColaboradorExc.edit: boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('COL048', 'ALTERAR', '', 'CALEND_COLAB_EXC',
    '', buscas, false) then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('MOTIVO').AsString := dataSet.FieldByName('MOTIVO').AsString;
    if dataSet.FieldByName('TRABALHAR').IsNull then
      dataSet.FieldByName('TRABALHAR').AsString := 'N';

    ColaboradorCalendColaboradorExc.AbreColaboradorCalendColaboradorExc(
      dataSet.FieldByName('COD_COLABORADOR').AsInteger);
  end;
end;

function TCalendColaboradorExc.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('COL050', 'SALVAR', '', 'CALEND_COLAB_EXC',
      dataSet.FieldByName('CODIGO').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('DATA').AsString) = '' then
      raiseExceptionCreate('Data deve ser informado', 'DBEdit1');

    if trim(dataSet.FieldByName('MOTIVO').AsString) = '' then
      raiseExceptionCreate('Motivo deve ser informado', 'DBEdit2');

    if trim(dataSet.FieldByName('TRABALHAR').AsString) = 'S' then
      if trim(dataSet.FieldByName('HORA_INI').AsString) = '' then
        raiseExceptionCreate('Hora inicial deve ser informado', 'DBEdit3');

    if trim(dataSet.FieldByName('TRABALHAR').AsString) = 'S' then
      if trim(dataSet.FieldByName('HORA_FIM').AsString) = '' then
        raiseExceptionCreate('Hora final deve ser informado', 'DBEdit4');

    if dataSet.FieldByName('COD_COLABORADOR').AsInteger <= 0 then
      raiseExceptionCreate('Colaborador deve ser informado', 'DBEdit5');

    if not ColaboradorCalendColaboradorExc.BuscarColaborador(
      dataSet.FieldByName('COD_COLABORADOR').AsInteger,
      False) then
        raiseExceptionCreate('Colaborador não encontrado', 'DBEdit5');

    if trim(dataSet.FieldByName('TRABALHAR').AsString) <> 'S' then
    begin
      dataSet.FieldByName('HORA_INI').Value := Null;
      dataSet.FieldByName('HORA_FIM').Value := Null;
    end;

    buscas.Close;
    buscas.SQL.Text :=  ' SELECT FIRST 1 CODIGO, COD_EMPRESA FROM CALEND_COLAB_EXC ' +
      ' WHERE COD_COLABORADOR = :COD_COLABORADOR ' +
      ' AND COD_EMPRESA = :COD_EMPRESA ' +
      ' AND DATA = :DATA ' +
      ' AND CODIGO <> :CODIGO ';
    buscas.ParamByName('COD_COLABORADOR').AsInteger := dataSet.FieldByName('COD_COLABORADOR').AsInteger;
    buscas.ParamByName('COD_EMPRESA').AsInteger := vDadosIni.cod_empresa;
    buscas.ParamByName('DATA').AsDateTime := dataSet.FieldByName('DATA').AsDateTime;
    buscas.ParamByName('CODIGO').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
    buscas.Open;

    if not buscas.IsEmpty then
      raiseExceptionCreate('Já existe uma exceção para esta data e colaborador, favor verificar antes de continuar.', 'DBEdit1');

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('CODIGO').AsInteger :=
        Gencodigo('CALEND_COLAB_EXC', dtmColaborador.SpIncCodigo, vDadosIni.codEmpresa);

    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('COL050', acao, 'SUCESSO', 'CALEND_COLAB_EXC',
        dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('COL050', acao, 'FALHA', 'CALEND_COLAB_EXC',
        dataSet.FieldByName('CODIGO').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TCalendColaboradorExc.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('CODIGO').AsString;

  if not vDadosIni.PesqPros('COL049', 'EXCLUIR', '', 'CALEND_COLAB_EXC',
    dataSet.FieldByName('CODIGO').AsString, buscas, false) then
      Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  SqlExec(' delete from calend_colab_exc ' +
          ' where codigo = %d ' +
          ' and cod_empresa = %d ',
          [fint('codigo'), fint('cod_empresa')], buscas);

  result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('COL049', 'EXCLUIR', 'SUCESSO', 'CALEND_COLAB_EXC', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('COL049', 'EXCLUIR', 'FALHA', 'CALEND_COLAB_EXC', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

procedure TCalendColaboradorExc._cadCalendColaboradorExc(pTipoForm: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Exceções Calendário');
    if dtmColaborador = nil then
      dtmColaborador := TdtmColaborador.Create(dtmColaborador);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('COL045', 'ABRIR', '', 'CALEND_COLAB_EXC', '',
      dtmColaborador.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadCalendColaboradoExc = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadCalendColaboradoExc, frmCadCalendColaboradoExc);
    end;

    if (pTipoForm > 0) and (not frmCadCalendColaboradoExc.Visible) then
      frmCadCalendColaboradoExc.ShowModal
    else if (not frmCadCalendColaboradoExc.Visible) then
      frmCadCalendColaboradoExc.Show
    else if frmCadCalendColaboradoExc.FormStyle = fsMDIChild then
      frmCadCalendColaboradoExc.Show
    else
      frmCadCalendColaboradoExc.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TColaboradorCalendColaboradorExc }

function TColaboradorCalendColaboradorExc.AbreColaboradorCalendColaboradorExc(pCodColaborador: Integer): boolean;
begin
  Result := montaSelect(
    ' select cod_vendedor, nome_vendedor from colaborador ' +
    ' where ativo = 1 ' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen(pCodColaborador > 0,
      ' union ' +
      ' select cod_vendedor, nome_vendedor from colaborador ' +
      ' where cod_vendedor = ' + IntToStr(pCodColaborador) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo <> 99 ', '') +
    ' order by 2 ');
end;

function TColaboradorCalendColaboradorExc.BuscarColaborador(
  pCodColaborador: Integer; pExibirMensagem: Boolean = True): Boolean;
begin
  Result := True;

  if pCodColaborador <= 0 then
    Exit;

  buscas.Close;
  buscas.SQL.Text := ' select cod_vendedor, cod_empresa from colaborador ' +
    ' where cod_vendedor = ' + IntToStr(pCodColaborador) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 ';
  buscas.Open;

  if buscas.IsEmpty then
  begin
    Result := False;
    Application.MessageBox('Colaborador não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

constructor TColaboradorCalendColaboradorExc.create;
begin
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsColaboradorCalendColaboradorExc);
  buscas := tibquery(dtmColaborador.qrBuscas);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
end;

{ TCalendEscalaSemanal }

function TCalendEscalaSemanal.atualizarDiaSemana: boolean;
var
	vDiaSemana: Integer;
begin
	try
    Result := False;

    // Domingo
    vDiaSemana := 0;
    vCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(
      dataSet.FieldByName('CODIGO').AsInteger,
      vDiaSemana);

    if not vCalendEscalaDia.domingo then
    begin
      if not vCalendEscalaSemanalDia.IsEmpty then
      	vCalendEscalaSemanalDia.Delete;
    end
    else
    begin
      if vCalendEscalaSemanalDia.IsEmpty then
      begin
        vCalendEscalaSemanalDia.dataSet.Insert;
        vCalendEscalaSemanalDia.dataSet.FieldByName('CODIGO').AsInteger :=
          dataSet.FieldByName('CODIGO').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('COD_EMPRESA').AsInteger :=
          dataSet.FieldByName('COD_EMPRESA').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('DIA_SEMANA').AsInteger :=
          vDiaSemana;
      end
      else
        vCalendEscalaSemanalDia.dataSet.Edit;

      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_INI').AsString :=
        vCalendEscalaDia.domingohoraini;
      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_FIM').AsString :=
        vCalendEscalaDia.domingohorafim;

      vCalendEscalaSemanalDia.dataSet.Post;
    end;

    if (vCalendEscalaSemanalDia.DataSet.ChangeCount = 0) then
    	Result := True
    else
      Result := vCalendEscalaSemanalDia.Apply;

    // Segunda
    vDiaSemana := 1;
    vCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(
      dataSet.FieldByName('CODIGO').AsInteger,
      vDiaSemana);

    if not vCalendEscalaDia.segunda then
    begin
    	if not vCalendEscalaSemanalDia.IsEmpty then
      	vCalendEscalaSemanalDia.Delete;
    end
    else
    begin
      if vCalendEscalaSemanalDia.IsEmpty then
      begin
        vCalendEscalaSemanalDia.dataSet.Insert;
        vCalendEscalaSemanalDia.dataSet.FieldByName('CODIGO').AsInteger :=
          dataSet.FieldByName('CODIGO').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('COD_EMPRESA').AsInteger :=
          dataSet.FieldByName('COD_EMPRESA').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('DIA_SEMANA').AsInteger :=
          vDiaSemana;
      end
      else
        vCalendEscalaSemanalDia.dataSet.Edit;

      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_INI').AsString :=
        vCalendEscalaDia.segundahoraini;
      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_FIM').AsString :=
        vCalendEscalaDia.segundahorafim;

      vCalendEscalaSemanalDia.dataSet.Post;
    end;

    if (vCalendEscalaSemanalDia.DataSet.ChangeCount = 0) then
    	Result := True
    else
      Result := vCalendEscalaSemanalDia.Apply;

    // terca
    vDiaSemana := 2;
    vCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(
      dataSet.FieldByName('CODIGO').AsInteger,
      vDiaSemana);

    if not vCalendEscalaDia.terca then
    begin
    	if not vCalendEscalaSemanalDia.IsEmpty then
      	vCalendEscalaSemanalDia.Delete;
    end
    else
    begin
      if vCalendEscalaSemanalDia.IsEmpty then
      begin
        vCalendEscalaSemanalDia.dataSet.Insert;
        vCalendEscalaSemanalDia.dataSet.FieldByName('CODIGO').AsInteger :=
          dataSet.FieldByName('CODIGO').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('COD_EMPRESA').AsInteger :=
          dataSet.FieldByName('COD_EMPRESA').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('DIA_SEMANA').AsInteger :=
          vDiaSemana;
      end
      else
        vCalendEscalaSemanalDia.dataSet.Edit;

      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_INI').AsString :=
        vCalendEscalaDia.tercahoraini;
      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_FIM').AsString :=
        vCalendEscalaDia.tercahorafim;

      vCalendEscalaSemanalDia.dataSet.Post;
    end;

    if (vCalendEscalaSemanalDia.DataSet.ChangeCount = 0) then
    	Result := True
    else
      Result := vCalendEscalaSemanalDia.Apply;

    // quarta
    vDiaSemana := 3;
    vCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(
      dataSet.FieldByName('CODIGO').AsInteger,
      vDiaSemana);

    if not vCalendEscalaDia.quarta then
    begin
      if not vCalendEscalaSemanalDia.IsEmpty then
      	vCalendEscalaSemanalDia.Delete;
    end
    else
    begin
      if vCalendEscalaSemanalDia.IsEmpty then
      begin
        vCalendEscalaSemanalDia.dataSet.Insert;
        vCalendEscalaSemanalDia.dataSet.FieldByName('CODIGO').AsInteger :=
          dataSet.FieldByName('CODIGO').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('COD_EMPRESA').AsInteger :=
          dataSet.FieldByName('COD_EMPRESA').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('DIA_SEMANA').AsInteger :=
          vDiaSemana;
      end
      else
        vCalendEscalaSemanalDia.dataSet.Edit;

      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_INI').AsString :=
        vCalendEscalaDia.quartahoraini;
      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_FIM').AsString :=
        vCalendEscalaDia.quartahorafim;

      vCalendEscalaSemanalDia.dataSet.Post;
    end;

    if (vCalendEscalaSemanalDia.DataSet.ChangeCount = 0) then
    	Result := True
    else
      Result := vCalendEscalaSemanalDia.Apply;

    // quinta
    vDiaSemana := 4;
    vCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(
      dataSet.FieldByName('CODIGO').AsInteger,
      vDiaSemana);

    if not vCalendEscalaDia.quinta then
    begin
      if not vCalendEscalaSemanalDia.IsEmpty then
      	vCalendEscalaSemanalDia.Delete;
    end
    else
    begin
      if vCalendEscalaSemanalDia.IsEmpty then
      begin
        vCalendEscalaSemanalDia.dataSet.Insert;
        vCalendEscalaSemanalDia.dataSet.FieldByName('CODIGO').AsInteger :=
          dataSet.FieldByName('CODIGO').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('COD_EMPRESA').AsInteger :=
          dataSet.FieldByName('COD_EMPRESA').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('DIA_SEMANA').AsInteger :=
          vDiaSemana;
      end
      else
        vCalendEscalaSemanalDia.dataSet.Edit;

      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_INI').AsString :=
        vCalendEscalaDia.quintahoraini;
      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_FIM').AsString :=
        vCalendEscalaDia.quintahorafim;

      vCalendEscalaSemanalDia.dataSet.Post;
    end;

    if (vCalendEscalaSemanalDia.DataSet.ChangeCount = 0) then
    	Result := True
    else
      Result := vCalendEscalaSemanalDia.Apply;

    // sexta
    vDiaSemana := 5;
    vCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(
      dataSet.FieldByName('CODIGO').AsInteger,
      vDiaSemana);

    if not vCalendEscalaDia.sexta then
    begin
      if not vCalendEscalaSemanalDia.IsEmpty then
      	vCalendEscalaSemanalDia.Delete;
    end
    else
    begin
      if vCalendEscalaSemanalDia.IsEmpty then
      begin
        vCalendEscalaSemanalDia.dataSet.Insert;
        vCalendEscalaSemanalDia.dataSet.FieldByName('CODIGO').AsInteger :=
          dataSet.FieldByName('CODIGO').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('COD_EMPRESA').AsInteger :=
          dataSet.FieldByName('COD_EMPRESA').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('DIA_SEMANA').AsInteger :=
          vDiaSemana;
      end
      else
        vCalendEscalaSemanalDia.dataSet.Edit;

      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_INI').AsString :=
        vCalendEscalaDia.sextahoraini;
      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_FIM').AsString :=
        vCalendEscalaDia.sextahorafim;

      vCalendEscalaSemanalDia.dataSet.Post;
    end;

    if (vCalendEscalaSemanalDia.DataSet.ChangeCount = 0) then
    	Result := True
    else
      Result := vCalendEscalaSemanalDia.Apply;

    // sabado
    vDiaSemana := 6;
    vCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(
      dataSet.FieldByName('CODIGO').AsInteger,
      vDiaSemana);

    if not vCalendEscalaDia.sabado then
    begin
      if not vCalendEscalaSemanalDia.IsEmpty then
      	vCalendEscalaSemanalDia.Delete;
    end
    else
    begin
      if vCalendEscalaSemanalDia.IsEmpty then
      begin
        vCalendEscalaSemanalDia.dataSet.Insert;
        vCalendEscalaSemanalDia.dataSet.FieldByName('CODIGO').AsInteger :=
          dataSet.FieldByName('CODIGO').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('COD_EMPRESA').AsInteger :=
          dataSet.FieldByName('COD_EMPRESA').AsInteger;
        vCalendEscalaSemanalDia.dataSet.FieldByName('DIA_SEMANA').AsInteger :=
          vDiaSemana;
      end
      else
        vCalendEscalaSemanalDia.dataSet.Edit;

      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_INI').AsString :=
        vCalendEscalaDia.sabadohoraini;
      vCalendEscalaSemanalDia.dataSet.FieldByName('HORA_FIM').AsString :=
        vCalendEscalaDia.sabadohorafim;

      vCalendEscalaSemanalDia.dataSet.Post;
    end;

    if (vCalendEscalaSemanalDia.DataSet.ChangeCount = 0) then
    	Result := True
    else
      Result := vCalendEscalaSemanalDia.Apply;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

constructor TCalendEscalaSemanal.create;
begin
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsCalendEscalaSemanal);
  buscas := tibquery(dtmColaborador.qrBuscas);
  transacao := tibtransaction(dtmColaborador.transacaoColab);

  vCalendEscalaSemanalDia := TCalendEscalaSemanalDia.create;
end;

destructor TCalendEscalaSemanal.Destroy;
begin
  vCalendEscalaSemanalDia.Free;
  vCalendEscalaSemanalDia := nil;

  inherited;
end;

function TCalendEscalaSemanal.insert: boolean;
begin
  if not vDadosIni.PesqPros('COL053', 'INCLUIR', '', 'CALEND_ESCALA_SEMANAL',
    '', buscas, True) then
	    Exit;

	if not dataset.Active then
    montaSelect(' select * from calend_escala_semanal where 1 = 0');

  if inherited insert then
  begin
    result := true;
    dataset.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;

    vCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(0);
  end;
end;

procedure TCalendEscalaSemanal.obterDiaSemana(pDiaSemana: Integer;
  ckDiaSemana: TCheckBox; mkHoraIni, mkHoraFim: TMaskEdit;
  spButton: TSpeedButton);
begin
  ckDiaSemana.Checked := False;

  mkHoraIni.Clear;
  mkHoraIni.Enabled   := False;

  mkHoraFim.Clear;
  mkHoraFim.Enabled   := False;

  spButton.Enabled    := False;

  if dataSet.FieldByName('CODIGO').AsInteger <= 0 then
  	Exit;

  buscas.Close;
  buscas.SQL.Text := ' select * from calend_escala_semanal_itens ' +
  	' where codigo = :codigo ' +
    ' and cod_empresa = :cod_empresa ' +
    ' and dia_semana = :dia_semana ';
  buscas.ParamByName('codigo').AsInteger := dataSet.FieldByName('CODIGO').AsInteger;
  buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
  buscas.ParamByName('dia_semana').AsInteger := pDiaSemana;
  buscas.Open;

  if buscas.IsEmpty then
  	Exit;

  ckDiaSemana.Checked := True;

  mkHoraIni.Text      := buscas.FieldByName('HORA_INI').AsString;
  mkHoraIni.Enabled   := True;

  mkHoraFim.Text      := buscas.FieldByName('HORA_FIM').AsString;
	mkHoraFim.Enabled   := True;

  spButton.Enabled    := True;
end;

function TCalendEscalaSemanal.edit: boolean;
begin
  Result := False;

	if dataset.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('COL054', 'INCLUIR', '', 'CALEND_ESCALA_SEMANAL',
    dataSet.FieldByName('CODIGO').AsString, buscas, True) then
    	Exit;

  if inherited edit then
  begin
    result := true;
    vCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(0);
  end;
end;

function TCalendEscalaSemanal.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('COL056', 'SALVAR', '', 'CALEND_ESCALA_SEMANAL',
      dataSet.FieldByName('CODIGO').AsString, buscas, true) then
    	  Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('DESCRICAO').AsString) = '' then
      raiseExceptionCreate('Descrição deve ser informado', 'DBEdit2');

    if vCalendEscalaDia.segunda then
    begin
      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.segundahoraini)) = '')  then
        raiseExceptionCreate('Hora inicial do segunda-feira deve ser informado', 'mkSegundaHoraIni');

      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.segundahorafim)) = '') then
        raiseExceptionCreate('Hora final do segunda-feira deve ser informado', 'mkSegundaHoraFim');
    end;

    if vCalendEscalaDia.terca then
    begin
      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.tercahoraini)) = '') then
        raiseExceptionCreate('Hora inicial do terça-feira deve ser informado', 'mkTercaHoraIni');

      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.tercahorafim)) = '') then
        raiseExceptionCreate('Hora final do terça-feira deve ser informado', 'mkTercaHoraFim');
    end;

    if vCalendEscalaDia.quarta then
    begin
      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.quartahoraini)) = '') then
        raiseExceptionCreate('Hora inicial do quarta-feira deve ser informado', 'mkQuartaHoraIni');

      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.quartahorafim)) = '') then
        raiseExceptionCreate('Hora final do quarta-feira deve ser informado', 'mkQuartaHoraFim');
    end;

    if vCalendEscalaDia.quinta then
    begin
      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.quintahoraini)) = '') then
        raiseExceptionCreate('Hora inicial do quinta-feira deve ser informado', 'mkQuintaHoraIni');

      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.quintahorafim)) = '') then
        raiseExceptionCreate('Hora final do quinta-feira deve ser informado', 'mkQuintaHoraFim');
    end;

    if vCalendEscalaDia.sexta then
    begin
      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.sextahoraini)) = '') then
        raiseExceptionCreate('Hora inicial do sexta-feira deve ser informado', 'mkSextaHoraIni');

      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.sextahorafim)) = '') then
        raiseExceptionCreate('Hora final do sexta-feira deve ser informado', 'mkSextaHoraFim');
    end;

    if vCalendEscalaDia.sabado then
    begin
      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.sabadohoraini)) = '') then
        raiseExceptionCreate('Hora inicial do sabado deve ser informado', 'mkSabadoHoraIni');

      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.sabadohorafim)) = '') then
        raiseExceptionCreate('Hora final do sabado deve ser informado', 'mkSabadoHoraFim');
    end;

    if vCalendEscalaDia.domingo then
    begin
      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.domingohoraini)) = '') then
        raiseExceptionCreate('Hora inicial do domingo deve ser informado', 'mkDomingoHoraIni');

      if (vDadosIni.apenasNumeros(trim(vCalendEscalaDia.domingohorafim)) = '') then
        raiseExceptionCreate('Hora final do domingo deve ser informado', 'mkDomingoHoraFim');
    end;

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('CODIGO').AsInteger :=
        Gencodigo('CALEND_ESCALA_SEMANAL', dtmColaborador.SpIncCodigo, vDadosIni.codEmpresa);

    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if not atualizarDiaSemana then
    	Exit;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('COL056', acao, 'SUCESSO', 'CALEND_ESCALA_SEMANAL',
        dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('COL056', acao, 'FALHA', 'CALEND_ESCALA_SEMANAL',
        dataSet.FieldByName('CODIGO').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TCalendEscalaSemanal.delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('CODIGO').AsString;

  if not vDadosIni.PesqPros('COL055', 'EXCLUIR', '', 'CALEND_ESCALA_SEMANAL',
    dataSet.FieldByName('CODIGO').AsString, buscas, false) then
      Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  SqlExec(' delete from calend_escala_semanal ' +
          ' where codigo = %d ' +
          ' and cod_empresa = %d ',
          [fint('codigo'), fint('cod_empresa')], buscas);

  result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('COL055', 'EXCLUIR', 'SUCESSO', 'CALEND_ESCALA_SEMANAL', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('COL055', 'EXCLUIR', 'FALHA', 'CALEND_ESCALA_SEMANAL', vCodFormula, buscas);

  Result := true;
  Refresh;
end;


procedure TCalendEscalaSemanal._cadCalendEscalaSemanal(pTipoForm: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Escala Semanal Calendário');
    if dtmColaborador = nil then
      dtmColaborador := TdtmColaborador.Create(dtmColaborador);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('COL051', 'ABRIR', '', 'CALEND_ESCALA_SEMANAL', '',
      dtmColaborador.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadCalendEscalaSemanal = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadCalendEscalaSemanal, frmCadCalendEscalaSemanal);
    end;

    if (pTipoForm > 0) and (not frmCadCalendEscalaSemanal.Visible) then
      frmCadCalendEscalaSemanal.ShowModal
    else if (not frmCadCalendEscalaSemanal.Visible) then
      frmCadCalendEscalaSemanal.Show
    else if frmCadCalendEscalaSemanal.FormStyle = fsMDIChild then
      frmCadCalendEscalaSemanal.Show
    else
      frmCadCalendEscalaSemanal.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TCalendEscalaSemanalDia }

constructor TCalendEscalaSemanalDia.create;
begin
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsCalendEscalaSemanalDia);
  buscas := tibquery(dtmColaborador.qrBuscas);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
end;

function TCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(
  pCodigo: Integer): boolean;
begin
  Result := montaSelect(' select * from calend_escala_semanal_itens ' +
  	' where codigo = ' + IntToStr(pCodigo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TCalendEscalaSemanalDia.abreCalendEscalaSemanalDia(pCodigo,
  pDiaSemana: Integer): boolean;
begin
  Result := montaSelect(' select * from calend_escala_semanal_itens ' +
  	' where codigo = ' + IntToStr(pCodigo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and dia_semana = ' + IntToStr(pDiaSemana));
end;

{ TJornadaTrabalho }

constructor TJornadaTrabalho.create;
begin
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsJornadaTrabalho);
  buscas := tibquery(dtmColaborador.qrBuscas);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
end;

function TJornadaTrabalho.insert: boolean;
begin
  if not vDadosIni.PesqPros('COL059', 'INCLUIR', '', 'JORNADA_TRABALHO',
    '', buscas, True) then
	    Exit;

	if not dataset.Active then
    montaSelect(' select * from jornada_trabalho where 1 = 0');

  if inherited insert then
  begin
    result := true;
    dataset.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
  end;
end;

procedure TJornadaTrabalho.obterDiaSemana(
  pDiaSemana: Integer;
  ckDiaSemana: TCheckBox);
begin
  ckDiaSemana.Checked := False;

  if dataSet.FieldByName('CODIGO').AsInteger <= 0 then
  	Exit;

  if ContainsText(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString + ',', IntToStr(pDiaSemana) + ',') then
    ckDiaSemana.Checked := True;
end;

function TJornadaTrabalho.edit: boolean;
begin
  Result := False;

	if dataset.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('COL060', 'INCLUIR', '', 'JORNADA_TRABALHO',
    dataSet.FieldByName('CODIGO').AsString, buscas, True) then
    	Exit;

  if inherited edit then
    result := true;
end;

function TJornadaTrabalho.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('COL062', 'SALVAR', '', 'JORNADA_TRABALHO',
      dataSet.FieldByName('CODIGO').AsString, buscas, true) then
    	  Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('DESCRICAO').AsString) = '' then
      raiseExceptionCreate('Descrição deve ser informado', 'DBEdit2');

    if trim(dataSet.FieldByName('HORARIO_INI_PADRAO').AsString) = '' then
      raiseExceptionCreate('Hora inicial deve ser informado', 'DBEdit3');

    if trim(dataSet.FieldByName('HORARIO_FIM_PADRAO').AsString) = '' then
      raiseExceptionCreate('Hora final deve ser informado', 'DBEdit4');

    dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString := '';
    if vJornadaTrabalhoDia.domingo then
      dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString := trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) +
        IfThen(trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) <> '', ',', '') + '0';

    if vJornadaTrabalhoDia.segunda then
      dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString := trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) +
        IfThen(trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) <> '', ',', '') + '1';

    if vJornadaTrabalhoDia.terca then
      dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString := trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) +
        IfThen(trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) <> '', ',', '') + '2';

    if vJornadaTrabalhoDia.quarta then
      dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString := trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) +
        IfThen(trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) <> '', ',', '') + '3';

    if vJornadaTrabalhoDia.quinta then
      dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString := trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) +
        IfThen(trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) <> '', ',', '') + '4';

    if vJornadaTrabalhoDia.sexta then
      dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString := trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) +
        IfThen(trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) <> '', ',', '') + '5';

    if vJornadaTrabalhoDia.sabado then
      dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString := trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) +
        IfThen(trim(dataSet.FieldByName('DIAS_FOLGA_SEMANAIS').AsString) <> '', ',', '') + '6';

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('CODIGO').AsInteger :=
        Gencodigo('JORNADA_TRABALHO', dtmColaborador.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('COL062', acao, 'SUCESSO', 'JORNADA_TRABALHO',
        dataSet.FieldByName('CODIGO').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('COL062', acao, 'FALHA', 'JORNADA_TRABALHO',
        dataSet.FieldByName('CODIGO').AsString, buscas);

    if Result then
      Refresh;

  except
    on e: exception do
    begin
      Result := false;
      if dataSet.State = dsBrowse then
        dataSet.Edit;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TJornadaTrabalho.delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('CODIGO').AsString;

  if not vDadosIni.PesqPros('COL061', 'EXCLUIR', '', 'JORNADA_TRABALHO',
    dataSet.FieldByName('CODIGO').AsString, buscas, false) then
      Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  SqlExec(' delete from jornada_trabalho ' +
          ' where codigo = %d ' +
          ' and cod_empresa = %d ',
          [fint('codigo'), fint('cod_empresa')], buscas);

  result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('COL061', 'EXCLUIR', 'SUCESSO', 'JORNADA_TRABALHO', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('COL061', 'EXCLUIR', 'FALHA', 'JORNADA_TRABALHO', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

procedure TJornadaTrabalho._cadJornadaTrabalho(pTipoForm: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Jornada de Trabalho');
    if dtmColaborador = nil then
      dtmColaborador := TdtmColaborador.Create(dtmColaborador);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('COL057', 'ABRIR', '', 'JORNADA_TRABALHO', '',
      dtmColaborador.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadJornadaTrabalho = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadJornadaTrabalho, frmCadJornadaTrabalho);
    end;

    if (pTipoForm > 0) and (not frmCadJornadaTrabalho.Visible) then
      frmCadJornadaTrabalho.ShowModal
    else if (not frmCadJornadaTrabalho.Visible) then
      frmCadJornadaTrabalho.Show
    else if frmCadJornadaTrabalho.FormStyle = fsMDIChild then
      frmCadJornadaTrabalho.Show
    else
      frmCadJornadaTrabalho.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TEscalaSemanalColab }

function TEscalaSemanalColab.abreEscalaSemanal: Boolean;
begin
  Result := montaSelect(' select 0 codigo, ''SEM ESCALA SEMANAL'' descricao from rdb$database ' +
    ' union all ' +
    ' select calend_escala_semanal.codigo, calend_escala_semanal.descricao from calend_escala_semanal ' +
    ' where calend_escala_semanal.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and calend_escala_semanal.codigo > 0 ' +
    ' order by 1 ');
end;

function TEscalaSemanalColab.BuscarEscalaSemanal(
  pCodEscalaSemanal: Integer;
  pExibirMensagem: Boolean = True): Boolean;
begin
  Result := True;

  if pCodEscalaSemanal <= 0 then
    Exit;

  buscas.Close;
  buscas.SQL.Text := ' select codigo, cod_empresa from calend_escala_semanal ' +
    ' where codigo = ' + IntToStr(pCodEscalaSemanal) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if buscas.IsEmpty then
  begin
    Result := False;
    if pExibirMensagem then
      Application.MessageBox('Escala semanal não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

constructor TEscalaSemanalColab.create;
begin
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsEscalaSemanalCol);
  buscas := tibquery(dtmColaborador.qrBuscas);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
end;

{ TJornadaTrabalhoColab }

function TJornadaTrabalhoColab.abreJornadaTrabalho: Boolean;
begin
  Result := montaSelect(' select 0 codigo, ''SEM JORNADA TRABALHO'' descricao from rdb$database ' +
    ' union all ' +
    ' select jornada_trabalho.codigo, jornada_trabalho.descricao from jornada_trabalho ' +
    ' where jornada_trabalho.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and jornada_trabalho.codigo > 0 ' +
    ' order by 1 ');
end;

function TJornadaTrabalhoColab.BuscarJornadaTrabalho(
  pCodJornadaTrabalho: Integer;
  pExibirMensagem: Boolean = True): Boolean;
begin
  Result := True;

  if pCodJornadaTrabalho <= 0 then
    Exit;

  buscas.Close;
  buscas.SQL.Text := ' select codigo, cod_empresa from jornada_trabalho ' +
    ' where codigo = ' + IntToStr(pCodJornadaTrabalho) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if buscas.IsEmpty then
  begin
    Result := False;
    if pExibirMensagem then
      Application.MessageBox('Jornada de Trabalho não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

constructor TJornadaTrabalhoColab.create;
begin
  if dtmColaborador = nil then
    dtmColaborador := TdtmColaborador.Create(dtmColaborador);
  dataSet := TClientDataSet(dtmColaborador.cdsJornadaTrabalhoCol);
  buscas := tibquery(dtmColaborador.qrBuscas);
  transacao := tibtransaction(dtmColaborador.transacaoColab);
end;

end.

