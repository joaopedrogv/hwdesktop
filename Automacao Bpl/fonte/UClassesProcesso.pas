unit UClassesProcesso;

interface
uses
  uDataSet_OOP, SysUtils, Classes, IBDatabase, DB, DBClient, Provider, IBQuery,
  IBCustomDataSet, IBStoredProc, Windows, Controls, Forms,
  hw_lote_liberacao_class,
  solicitacoes_acesso_class,
  tabela_processos_class,
  tabela_processos_usuarios_class;
type
	RAtualizarProc = record
  	vHabNivelProcesso, vHabSenhaGerente, vHabFormulario: boolean;
    vNivelProcesso, vSenhaGerente, vFormulario: string;
  end;

  TProcesso = class;
  TExcecao = class;
  TUsuario = class;

  TExcecao = class(TDataSet_OOP)
  public
    constructor create;
    function delete: boolean; override;
    function abreExcecao(processo: string): boolean;
    function insert: boolean; override;
    function post(processo, usuario: string): boolean;
    function existeExcecaoUsuario(processo, usuario: string): boolean;
  end;

  TUsuario = class(TDataSet_OOP)
    constructor create;
    function abreUsuario: boolean;
  end;

  TLote_liberas = class(THw_lote_liberacao_classList)
  public
//    procedure popular(Asolits: TSolicitacoes_acesso_classList; Aprocessos: TTabela_processos_classList);
  end;

  TActionTipoLib = {set of} (tl_lote, tl_processo, tl_solit);

  TLiberarAcesso = class(TDataSet_OOP)
  private
    Flote: TDataSet_OOP;
    Fdata_lote: TClientDataSet;
    Fds_lote: TDataSource;
    Flote_lib: THw_lote_liberacao_classList;
    FchangeLib: TNotifyEvent;

    procedure abrirLiberacaoLote;

  public
  	constructor create;
    destructor Destroy; override;

    function liberarAcesso: boolean;
    function liberarAcesso_lote(Aaction: TActionTipoLib; AindexLote, AindexProcesso, AindexSolit: Integer): boolean;
    procedure apagarLiberacoesAntigas;
    function abrirLiberacaoProcesso: boolean;
    procedure CadLiberacaoProcesso(TipoForm: integer);

    property lote: TDataSet_OOP read Flote write Flote;
    property ds_lote: TDataSource read Fds_lote write Fds_lote;

    property lote_lib: THw_lote_liberacao_classList read Flote_lib write Flote_lib;
    property onChangeLib: TNotifyEvent read FchangeLib write FchangeLib;
  end;

  TProcesso = class(TDataSet_OOP)
  public
    constructor create;
    function delete: boolean; override;
    function restaurarLixeira: boolean;
    function abreProcesso: boolean;
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function ExcecaoProcesso(codigo: string): boolean;
    function VerificaCodProcesso(codigo: string): boolean;
    procedure CadProcesso(TipoForm: integer);
    function incluirExecaoUsuario: boolean;
    function AtualizarProcessoEmLote: boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _marcaLinha;
    procedure _desmarcaLinha;
    procedure _desmarcarTodos;
  var
    vUsuario: TUsuario;
    vExcecao: TExcecao;
    vAtualizarProc: RAtualizarProc;
    ultimasql: string;
  end;

implementation

uses uDtmConfig, uDtmAtivo, UCadProcessos, uLiberarAcesso, uDadosIni, DateUtils,
  Contnrs, StrUtils;

{ TProcesso }

function TProcesso.abreProcesso: boolean;
begin
  result := montaSelect('select * from TABELA_PROCESSOS where ativo = 1 and cod_Empresa = ' +
    vdadosini.codEmpresa);
end;

function TProcesso.AbrirLixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    montaSelect('select * from TABELA_PROCESSOS where ativo = 1 and cod_Empresa = ' +
      vDadosIni.codEmpresa);
    result := false;
  end
  else
    result := montaSelect('select * from TABELA_PROCESSOS where ativo <> 1 and cod_Empresa = ' +
      vDadosIni.codEmpresa);
end;

function TProcesso.AtualizarProcessoEmLote: boolean;
var
	vProcesso: string;
  vtempMensagem: string;
  vIndexName: string;
  vCodProcesso: string;
begin
	Result := false;

  vProcesso := 'PRC016';
  vtempMensagem := 'SALVAR';

  if not vDadosIni.PesqPros(vProcesso, vtempMensagem, '', 'TABELA_PROCESSOS', '', buscas, False) then
   Exit;
	try
  	try
      vIndexName := dataSet.IndexName;

      dataSet.Filtered := false;
      dataSet.Filter := 'sel = ''S'' ';
      dataSet.Filtered := true;

      if dataSet.IsEmpty then
      begin
        Application.MessageBox('Nenhum processo selecionado.', 'Atenção',
          MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        exit;
      end;

      with vAtualizarProc do
      begin
      	if vHabNivelProcesso then
        begin
        	if trim(vNivelProcesso) = '' then
        		raiseExceptionCreate('Nível do processo deve ser informado', 'cbNivelProcesso');

          try
          	StrToInt(vNivelProcesso);
          except
          	raiseExceptionCreate('Nível do processo inválido, informe somente números', 'cbNivelProcesso');
          end;
        end;

        if vHabSenhaGerente then
        begin
        	if (trim(vSenhaGerente) <> 'S')
          	and (trim(vSenhaGerente) <> 'N')
            and (trim(vSenhaGerente) <> 'SIM')
            and (trim(vSenhaGerente) <> 'NÃO') then
            	raiseExceptionCreate('Senha Gerente deve ser informado', 'cbSenhaGerente');
        end;

        if vHabFormulario then
        	if (trim(vFormulario) = '') then
          	raiseExceptionCreate('Formulário deve ser informado', 'EdFormularioProcesso');


        if (not vHabNivelProcesso)
        	and (not vHabSenhaGerente)
          and (not vHabFormulario) then
          	raiseExceptionCreate('Nenhum opção selecionada!', '');


        vDadosIni.abreStatusProcessamento('', 'Atualizando dados processo');

        dataSet.DisableControls;
        dataSet.IndexFieldNames := 'COD_PROCESSO';
        dataSet.First;
        while not dataSet.Eof do
        begin
          vDadosIni.abreStatusProcessamento('', 'Atualizando dados produto (' +
              IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

          if dataSet.FieldByName('SEL').AsString = 'S' then
          begin
            vCodProcesso := dataSet.FieldByName('COD_PROCESSO').AsString;

            dataSet.Edit;
            dataSet.FieldByName('ATIVO').AsInteger := 1;
            if vHabNivelProcesso then
            	dataSet.FieldByName('NIVEL_PROCESSO').AsString := vNivelProcesso;
            if vHabSenhaGerente then
            	dataSet.FieldByName('SENHA_GERENTE').AsString := vSenhaGerente;
            if vHabFormulario then
            	dataSet.FieldByName('FORM').AsString := vFormulario;
            dataSet.Post;

            if (not Apply) and (dataSet.ChangeCount > 0) then
            begin
              dataSet.CancelUpdates;
              RollBackTransacao;
              Result := False;
              Exit;
            end;

            CommitaTransacao;

            vDadosIni.GravaAuditoria(vProcesso, vtempMensagem, '',
              'TABELA_PROCESSOS', vCodProcesso, buscas);
          end;

          dataSet.Next;
        end;
        dataSet.First;
      end;

      Result := true;
    finally
      dataSet.Filtered := false;
      dataSet.IndexFieldNames := '';
      dataSet.IndexName := vIndexName;
      dataSet.EnableControls;
      vDadosIni.fechaStatusProcessamento;
    end;
  except
    on e: exception do
    begin
      Result := false;
      RollBackTransacao;
      vDadosIni.GravaAuditoria(vProcesso, vtempMensagem,	'FALHA', 'TABELA_PROCESSOS', '', buscas);
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TProcesso.CadProcesso(TipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Processos');
  if dtmConfig = nil then
    dtmConfig := TdtmConfig.Create(dtmConfig);

  vDadosIni.vTipoForm := TipoForm;

  if not vDadosIni.PesqPros('PRC001', 'PESQUISAR', '','TABELA_PROCESSOS','', dtmConfig.qrBuscas, true) then
  begin
    vDadosIni.fechaStatusProcessamento;
    exit;
  end;

  if frmCadProcessos = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadProcessos, frmCadProcessos);
  end;

  if (TipoForm > 0) and (not frmCadProcessos.Visible) then
    frmCadProcessos.ShowModal
  else if (not frmCadProcessos.Visible) then
    frmCadProcessos.Show
  else if frmCadProcessos.FormStyle = fsMDIChild then
    frmCadProcessos.Show
  else
    frmCadProcessos.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

constructor TProcesso.create;
begin
  dataSet := TClientDataSet(dtmConfig.cdsProcessos);
  buscas := TIBQuery(dtmConfig.qrBuscasP);
  transacao := TIBTransaction(dtmConfig.IBTransProcessos);
  vUsuario := TUsuario.create;
  vExcecao := TExcecao.create;
end;

function TProcesso.delete: boolean;
var
  vApagar: boolean;
  vCodProcesso, vDescrProcesso: string;
  vtemp: string;
begin
  try
    result := false;
    if dataSet.IsEmpty then
      exit;

    try
      vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
      vCodProcesso   := trim(dataSet.FieldByName('COD_PROCESSO').AsString);
      vDescrProcesso := trim(dataSet.FieldByName('NOME_PROCESSO').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
      	vApagar        := dataSet.FieldByName('ATIVO').AsInteger = 0;
        vCodProcesso   := '';
        vDescrProcesso := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
    	if (trim(vCodProcesso) <> '') then
      	prepare_loop('COD_PROCESSO = ' + QuotedStr(vCodProcesso))
      else
		    prepare_loop('SEL = ''S''');

      if vApagar then
      begin
        vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
          'PROCESSO' + #13 +
          'Cod Processo: ' + vCodProcesso + #13 +
          'Descrição: ' + vDescrProcesso;

        if (trim(vCodProcesso) = '') then
          vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

        if not vDadosIni.PesqPros('PRC012', 'EXCLUIR', '', 'TABELA_PROCESSOS',
          vDadosIni.IfThen(trim(vCodProcesso) <> '', vCodProcesso, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end
      else
      begin
        vtemp := 'Tem certeza que deseja mover este registro para a lixeira?' + #13 + #13 +
          'PROCESSO' + #13 +
          'Cod Processo: ' + vCodProcesso + #13 +
          'Descrição: ' + vDescrProcesso;

        if (trim(vCodProcesso) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

        if not vDadosIni.PesqPros('PRO005', 'EXCLUIR', '', 'TABELA_PROCESSOS',
           vDadosIni.IfThen(trim(vCodProcesso) <> '', vCodProcesso, ''), buscas, true) then
            exit;

        if Application.MessageBox(PChar(vtemp),
          'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;
      end;

      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo processo(s) permanentemente')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo processo(s) para lixeira');

      dataset.First;
      while not dataset.Eof do
      begin
      	if vApagar then
	      	vDadosIni.abreStatusProcessamento('', 'Excluíndo processo(s) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
        else
        	vDadosIni.abreStatusProcessamento('', 'Movendo processo(s) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        if vApagar then
        begin
          SqlExec(' delete from tabela_processos ' +
            ' where cod_processo = %s and cod_empresa = %d ',
            [fstrq('cod_processo'), fint('cod_empresa')], buscas);

          if (trim(vCodProcesso) = '') then
            vDadosIni.GravaAuditoria('PRC012', 'EXCLUIR', '', 'TABELA_PROCESSOS',
              dataSet.FieldByName('COD_PROCESSO').AsString, buscas);                
        end
        else
        begin
          SqlExec(' update tabela_processos set ativo = 0 ' +
            ' where cod_processo = %s and cod_empresa = %d ',
            [fstrq('cod_processo'), fint('cod_empresa')], buscas);


          if (trim(vCodProcesso) = '') then
            vDadosIni.GravaAuditoria('PRC005', 'EXCLUIR', '', 'TABELA_PROCESSOS',
              dataSet.FieldByName('COD_PROCESSO').AsString, buscas);
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
    	vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'PRC012', 'PRO005'),
      	'EXCLUIR', 'SUCESSO', 'TABELA_PROCESSOS',
        vDadosIni.IfThen(trim(vCodProcesso) <> '', vCodProcesso, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
    	vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'PRC012', 'PRO005'),
      	'EXCLUIR', 'FALHA', 'TABELA_PROCESSOS',
        vDadosIni.IfThen(trim(vCodProcesso) <> '', vCodProcesso, ''), buscas);
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

function TProcesso.edit: boolean;
begin
	result := false;
  if not dataSet.Active then
    montaSelect('select * from TABELA_PROCESSOS 1 =0');

  Result := inherited edit;
  if Result then
  begin
  	if trim(dataSet.FieldByName('senha_gerente').AsString) = '' then
			dataSet.FieldByName('senha_gerente').AsString := 'N';
    if trim(dataSet.FieldByName('form').AsString) = '' then
    	dataSet.FieldByName('form').AsString := '.';
  end;
end;

function TProcesso.ExcecaoProcesso(codigo: string): boolean;
var
  valor: integer;
begin
  valor :=
    strtoint(retornaValor('select count(COD_PROCESSO) as valor from TABELA_PROCESSOS_USUARIOS where COD_PROCESSO = ''' + codigo + ''' and cod_Empresa = ' + vdadosini.codEmpresa));
  if valor > 0 then
    result := true
  else
    result := false;
end;

function TProcesso.incluirExecaoUsuario: boolean;
begin
  try
    if dataSet.IsEmpty then
      exit;
    if vExcecao.existeExcecaoUsuario(
      dataSet.FieldByName('COD_PROCESSO').AsString, vUsuario.buscas.FieldByName( 'usuario').AsString) then
      raise Exception.create('A Execeção já existe para esse usuário.');
    vExcecao.Insert;
    vExcecao.post(obProcesso.dataSet.FieldByName('COD_PROCESSO').AsString,
      vUsuario.buscas.FieldByName( 'usuario').AsString);
    vUsuario.abreUsuario;
  except
    on e: Exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

function TProcesso.insert: boolean;
begin
  result := false;
  if not dataSet.Active then
    montaSelect('select * from TABELA_PROCESSOS where cod_processo = '''' and cod_empresa = 0');

  result := inherited insert;
  if Result then
  begin
  	dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('senha_gerente').AsString := 'N';
    dataSet.FieldByName('ativo').AsInteger := 1;
  end;
end;

function TProcesso.post: boolean;
begin
  try
    Result := false;
    
    if not (dataSet.State in [dsInsert, dsEdit]) then
      exit;

    if trim(dataset.FieldByName('COD_PROCESSO').AsString) = '' then
      raiseExceptionCreate('Campo código do processo não informado.', 'DBEdit1');

    if trim(dataset.FieldByName('NOME_PROCESSO').AsString) = '' then
      raiseExceptionCreate('Campo nome do processo não informado.', 'DBEdit2');

    if trim(dataset.FieldByName('NIVEL_PROCESSO').AsString) = '' then
      raiseExceptionCreate('Campo Nível do Processo não informado.', 'DBComboBox2');

    if trim(dataset.FieldByName('SENHA_GERENTE').AsString) = '' then
      raiseExceptionCreate('Campo Senha Gerente não informado.', 'DBComboBox1');

    if trim(dataset.FieldByName('FORM').AsString) = '' then
      raiseExceptionCreate('Campo Formulário não informado.', 'DBEdit5');

    if dataSet.State = dsInsert then
    begin
      if VerificaCodProcesso(dataset.FieldByName('COD_PROCESSO').AsString) then
        raise exception.Create('Código já existente');
    end;

    result := inherited post;

    if dataset.ChangeCount = 0 then
    begin
      result := true;
      exit;
    end;

    if apply then
      CommitaTransacao
    else
    begin
      dataSet.Cancel;
      RollBackTransacao;
      result := false;
    end;

    if Result then
      Refresh;
  except
    on e: Exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TProcesso.restaurarLixeira: boolean;
var
	vApagar: boolean;
  vCodProcesso, vDescrProcesso: string;
  vtemp: string;
begin
	try
    result := false;
    if dataSet.IsEmpty then
      exit;

    try
      vCodProcesso   := trim(dataSet.FieldByName('COD_PROCESSO').AsString);
      vDescrProcesso := trim(dataSet.FieldByName('NOME_PROCESSO').AsString);

      prepare_loop('SEL = ''S''');
      if not dataset.IsEmpty then
      begin
        vCodProcesso := '';
        vDescrProcesso := '';
      end;
    finally
      prepare_loop_done;
    end;

    try
      if (trim(vCodProcesso) <> '') then
        prepare_loop('COD_PROCESSO = ' + QuotedStr(vCodProcesso))
      else
        prepare_loop('SEL = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        'PROCESSO' + #13 +
        'Cod Processo: ' + vCodProcesso + #13 +
        'Descrição: ' + vDescrProcesso;

      if (trim(vCodProcesso) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('PRC008', 'RESTAURAR', '', 'TABELA_PROCESSOS',
        vDadosIni.IfThen(trim(vCodProcesso) <> '', vCodProcesso, ''), buscas, true) then
          exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando processo(s)');

      dataset.First;
      while not dataset.Eof do
      begin
        vDadosIni.abreStatusProcessamento('', 'Restaurando processo(s) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');
                                                                     
        SqlExec(' update tabela_processos set ativo = 1 ' +
          ' where cod_processo = %s and cod_empresa = %d ',
          [fstrq('cod_processo'), fint('cod_empresa')], buscas);

        if (trim(vCodProcesso) = '') then
          vDadosIni.GravaAuditoria('PRC008', 'RESTAURAR', '', 'TABELA_PROCESSOS',
            dataSet.FieldByName('COD_PROCESSO').AsString, buscas);

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    Result := CommitaTransacao;
    if Result then
    begin
      vDadosIni.GravaAuditoria('PRC008', 'RESTAURAR', 'SUCESSO', 'TABELA_PROCESSOS',
        vDadosIni.IfThen(trim(vCodProcesso) <> '', vCodProcesso, ''), buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('PRC008', 'RESTAURAR', 'FALHA', 'TABELA_PROCESSOS',
        vDadosIni.IfThen(trim(vCodProcesso) <> '', vCodProcesso, ''), buscas);
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

function TProcesso.StatusLixeira: boolean;
begin
  result := ExecutaComandosSql('select * from TABELA_PROCESSOS where ativo = 0 and cod_Empresa = ' +
    vdadosini.codEmpresa);
end;

function TProcesso.VerificaCodProcesso(codigo: string): boolean;
var
  valor: string;
begin
  valor := retornaValor('select cod_processo as valor from TABELA_PROCESSOS where cod_processo = ' +
    QuotedStr(trim(codigo)) + ' and ativo = 1 and cod_Empresa = ' + vdadosini.codEmpresa);
  if trim(valor) = '' then
    result := false
  else
    result := true;

end;

procedure TProcesso._desmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  dataSet.FieldByName('SEL').AsString := '';
  dataSet.Post;
end;

procedure TProcesso._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('SEL').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TProcesso._marcaDesmarcaLinha;
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

procedure TProcesso._marcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TProcesso._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('SEL').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TExcecao }

function TExcecao.abreExcecao(processo: string): boolean;
begin
  result := montaSelect('select * from TABELA_PROCESSOS_USUARIOS where COD_PROCESSO = ''' + processo
    + ''' and cod_Empresa = ' + vdadosini.codEmpresa);
end;

constructor TExcecao.create;
begin
  dataSet := TClientDataSet(dtmConfig.cdsExecao);
  buscas := TIBQuery(dtmConfig.qrBuscasP);
  transacao := TIBTransaction(dtmConfig.IBTransProcessos);
end;

function TExcecao.delete: boolean;
begin
  result := false;
  if dataSet.IsEmpty then
    exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    dataSet.Delete;

    if Apply then
      if CommitaTransacao then
        result := true;
  end;
end;

function TExcecao.insert: boolean;
begin
  if not dataSet.Active then
    montaSelect('select * from TABELA_PROCESSOS_USUARIOS where 1 = 0');

  if inherited insert then
  begin
    dataSet.FieldByName('USUARIO_AUTORIZOU').AsString := vDadosIni.vNomeUsuario;
    dataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    result := true;
  end;

end;

function TExcecao.post(processo, usuario: string): boolean;
begin
  try
    dataSet.FieldByName('COD_PROCESSO').AsString := processo;
    dataSet.FieldByName('USUARIO').AsString := usuario;

    if dataSet.FieldByName('USUARIO').AsString = '' then
      raise exception.Create('Usuário não informado.');

    result := inherited post;

    if dataset.ChangeCount = 0 then
    begin
      result := true;
      exit;
    end;

    if apply then
      CommitaTransacao
    else begin
      dataset.Cancel;
      RollBackTransacao;
      result := false;
    end;
    dataSet.Refresh;
  except
    on e: Exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
  Refresh;
end;

function TExcecao.existeExcecaoUsuario(processo, usuario: string): boolean;
begin
  buscas.Close;
  buscas.SQL.Clear;
  buscas.SQL.Add('select count(*) as qtReg from TABELA_PROCESSOS_USUARIOS where COD_PROCESSO = ''' +
    processo + ''' and  USUARIO = ' + QuotedStr(usuario) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
  buscas.Open;
  if buscas.FieldByName('qtreg').AsInteger > 0 then
    result := true
  else
    result := false;
end;

{ TUsuario }

function TUsuario.abreUsuario: boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Clear;
    buscas.SQL.Add('select s.usuario,col.nome_vendedor from senhas s' +
                   ' inner join colaborador col on col.cod_vendedor = s.codigo and col.cod_empresa = s.cod_empresa' +
                   ' where col.ativo = 1 and col.cod_Empresa = ' +  vdadosini.codEmpresa);
    buscas.Open;
    result := true;
  except
    result := false;
  end;
end;

constructor TUsuario.create;
begin
  buscas := TIBQuery(dtmConfig.qrUsuario);
end;

{ TLiberarAcesso }

procedure TLiberarAcesso.abrirLiberacaoLote;
var
  Aprcss: TTabela_processos_classList;
  Asolits: TSolicitacoes_acesso_classList;
  I: Integer;
begin
  Flote_lib.Clear;

  Aprcss := TTabela_processos_classList.Create;
  Asolits := TSolicitacoes_acesso_classList.Create;
  try
    Aprcss.SetValuesFrom(SqlOpen('select distinct %s from tabela_processos tp' +
                                 ' inner join solicitacoes_acesso so on so.processo = tp.cod_processo and so.cod_empresa = tp.cod_empresa' +
                                 ' where so.cod_empresa = %s and (so.data_solicitacao >= ' + vDadosIni.FusoSqlDateTime + ' - 0.0069444444444) and so.lote is not null',
                                 [TTabela_processos_class.GetFieldsSql('tp'), vDadosIni.codEmpresa]));

    Asolits.SetValuesFrom(SqlOpen('select %s from solicitacoes_acesso' +
                                  ' where cod_empresa = %s and (data_solicitacao >= ' + vDadosIni.FusoSqlDateTime + ' - 0.0069444444444) and lote is not null' +
                                  ' order by lote', [TSolicitacoes_acesso_class.GetFieldsSql, vDadosIni.codEmpresa]));



    Flote_lib.popular(Asolits, Aprcss);

    {
    SqlOpen('select distinct lote from solicitacoes_acesso' +
            ' where cod_empresa = %s and (s.data_solicitacao >= asdasd - 0.0069444444444) and lote is not null' +
            ' oder by lote', [vDadosIni.codEmpresa]).First;
    while not buscas.Eof do
    begin
      with Flote_lib.New do
      begin
        lote := buscas.FieldByName('lote').AsInteger
      end;
      buscas.Next;
    end;
    for I := 0 to Pred(Flote_lib.Count) do with Flote_lib.Items[I] do
    begin
      Aprcss.Clear;
    end;

                 }
//	 ' WHERE S.COD_EMPRESA = ' + vdadosini.codEmpresa +
//    ' AND (S.DATA_SOLICITACAO >= asdasdasd - 0.0069444444444) ' +
//    ' AND S.LOTE IS NULL' +
//    ' ORDER BY 1, S.COD_SOLICITACAO DESC ';
//    Asolits.SetValuesFrom( SqlOpen(



//  ' select %s from solicitacoes_acesso where  ' +
//	 ' WHERE S.COD_EMPRESA = ' + vdadosini.codEmpresa +
//    ' AND (S.DATA_SOLICITACAO >= asdasdasd - 0.0069444444444) ' +
//    ' AND S.LOTE IS NULL' +
//    ' ORDER BY 1, S.COD_SOLICITACAO DESC ';




//    Flote_lib.popular(Asolits, Aprcss);


  finally
    if Assigned(Aprcss)  then FreeAndNil(Aprcss);
    if Assigned(Asolits) then FreeAndNil(Asolits);
  end;
  {$REGION 'definindo o dataset do pedvenda'}
  {if not Fdata_lote.Active then
  begin
    Fdata_lote.FieldDefs.Add('cod_processo' , ftString, 10);
    Fdata_lote.FieldDefs.Add('nome_processo', ftString, 50);
    Fdata_lote.FieldDefs.Add('usuario'      , ftString, 10);
    Fdata_lote.FieldDefs.Add('data'         , ftDateTime);
    Fdata_lote.FieldDefs.Add('lote'         , ftInteger);
    Fdata_lote.CreateDataSet;

    with Fdata_lote do
    begin
      FieldByName('sel').DisplayLabel          := '..';
      FieldByName('Sit').DisplayLabel          := 'Sit';
      FieldByName('nped').DisplayLabel         := 'Numero';
      FieldByName('tipo').DisplayLabel         := 'Tipo';
      FieldByName('data_ped').DisplayLabel     := 'Data ped';
      FieldByName('data_fech').DisplayLabel    := 'Data fech';
      FieldByName('status_ped').DisplayLabel   := 'Status';
      FieldByName('valor_total').DisplayLabel  := 'Valor total';
      FieldByName('nome_cliente').DisplayLabel := 'Nome cliente';
      FieldByName('razao').DisplayLabel        := 'Razao social';
      FieldByName('erros').Visible             := False; 
    end;
    TFloatField(Fdata_lote.FieldByName('valor_total')).DisplayFormat := '#,##0.00';
    Fds_ped.DataSet := Fdata_lote;
  end;
  }
  {$ENDREGION}


end;

function TLiberarAcesso.abrirLiberacaoProcesso: boolean;
begin
  //Consulta retorna as solicições realizadas até 10 minutos (0.0069444444444)
  dataSet.Close;
  dataSet.CommandText := ' SELECT CASE WHEN(S.USUARIO_GERENTE IS NULL) THEN 1 ELSE 2 END ORDEM, S.* FROM SOLICITACOES_ACESSO S' +
	 ' WHERE S.COD_EMPRESA = ' + vdadosini.codEmpresa +
    ' AND (S.DATA_SOLICITACAO >= ' + vDadosIni.FusoSqlDateTime + ' - 0.0069444444444) ' +
    ' AND S.LOTE IS NULL' +
    ' ORDER BY 1, S.COD_SOLICITACAO DESC ';
  dataSet.Open;

  Result := not dataSet.IsEmpty;

  abrirLiberacaoLote;

  if Assigned(FchangeLib) then
    FchangeLib(Self);
end;

procedure TLiberarAcesso.apagarLiberacoesAntigas;
begin
  //Apagar solicições realizadas com mais de 10 minutos (0.0069444444444)
  buscas.Close;
  buscas.SQL.Text := ' DELETE FROM SOLICITACOES_ACESSO S' +
	 ' WHERE S.COD_EMPRESA = ' + vdadosini.codEmpresa +
    ' AND (S.DATA_SOLICITACAO < ' + vDadosIni.FusoSqlDateTime + ' - 0.0069444444444) ';
  buscas.ExecSQL;
  buscas.Transaction.Commit;
end;

procedure TLiberarAcesso.CadLiberacaoProcesso(TipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Liberações de Acesso');
  if dtmConfig = nil then
    dtmConfig := TdtmConfig.Create(dtmConfig);

  vDadosIni.vTipoForm := TipoForm;

  if not vDadosIni.PesqPros('PRC013', 'PESQUISAR', '','SOLICITACOES_ACESSO','', dtmConfig.qrBuscas, true) then
  begin
    vDadosIni.fechaStatusProcessamento;
    exit;
  end;

  dtmConfig.qrBuscas.Close;
  dtmConfig.qrBuscas.SQL.Text := ' SELECT USUARIO, COALESCE(LIBERAR_ACESSO, ''N'') LIBERAR_ACESSO FROM SENHAS ' +
    ' WHERE USUARIO = :USUARIO AND COD_EMPRESA = :COD_EMPRESA ';
  dtmConfig.qrBuscas.ParamByName('USUARIO').AsString := vDadosIni.vNomeUsuario;
  dtmConfig.qrBuscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);	
  dtmConfig.qrBuscas.Open;

  if trim(dtmConfig.qrBuscas.FieldByName('LIBERAR_ACESSO').AsString) <> 'S' then
  begin
    Application.MessageBox('Senha não configurada para liberar acesso.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    vDadosIni.fechaStatusProcessamento;
    exit;
  end;

  if frmLiberarAcesso = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmLiberarAcesso, frmLiberarAcesso);
  end;

  if (TipoForm > 0) and (not frmLiberarAcesso.Visible) then
    frmLiberarAcesso.ShowModal
  else if (not frmLiberarAcesso.Visible) then
    frmLiberarAcesso.Show
  else if frmLiberarAcesso.FormStyle = fsMDIChild then
    frmLiberarAcesso.Show
  else
    frmLiberarAcesso.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

constructor TLiberarAcesso.create;
begin
  dataSet := TClientDataSet(dtmConfig.cdsLiberacaoProcesso);
  buscas := TIBQuery(dtmConfig.qrBuscasP);
  transacao := TIBTransaction(dtmConfig.IBTransProcessos);

  Fdata_lote := TClientDataSet.Create(nil);
  Fds_lote := TDataSource.Create(nil);
  Fds_lote.AutoEdit := False;

  Flote := TDataSet_OOP.Create;
  Flote.dataSet := Fdata_lote;

  Flote_lib := THw_lote_liberacao_classList.Create;
end;

destructor TLiberarAcesso.Destroy;
begin
  if Assigned(Fds_lote) then FreeAndNil(Fds_lote);
  if Assigned(Flote) then FreeAndNil(Flote);

    if Assigned(Flote_lib) then FreeAndNil(Flote_lib);

  inherited;
end;

function TLiberarAcesso.liberarAcesso: boolean;
var
  vcodigo, vcodprocesso, vusuario, vgerente: string;
begin
  try
    Result := False;

    if dataSet.IsEmpty then
    	exit;

    if not dataSet.FieldByName('USUARIO_GERENTE').IsNull then
    begin
      Application.MessageBox('Acesso liberado',  'Atenção', 0 + 64);
    	exit;
    end;

    vcodigo := dataSet.FieldByName('COD_SOLICITACAO').AsString;
    vcodprocesso := dataSet.FieldByName('PROCESSO').AsString;
    vusuario := dataSet.FieldByName('USUARIO_SOLICITANTE').AsString;
    vgerente := vDadosIni.vNomeUsuario;

    try
      dataSet.RefreshRecord;
      if vcodigo <> dataSet.FieldByName('cod_solicitacao').AsString then
      begin
        Result := False;
        Application.MessageBox('Registro selecionado foi removido. Aperte F5 e verifique',
          'Atenção', 0 + 64);
        Exit;
      end;

    except on E: Exception do
      begin
        if Pos('changed by another user', e.Message) > 0 then
        begin
          Result := False;
          Application.MessageBox('Registro selecionado foi removido. Aperte F5 e verifique',
            'Atenção', 0 + 64);
          Exit;
        end;
      end;
    end;

    if not vDadosIni.PesqPros('PRC014', 'LIBERAR',
    	'PROCESSO: ' + vcodprocesso + ' SOLIC: ' + vusuario + ' GERENTE: ' + vgerente, 'SOLICITACOES_ACESSO', '', buscas, true) then
    	exit;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    	dataSet.Edit;
    dataSet.FieldByName('USUARIO_GERENTE').AsString := vDadosIni.vNomeUsuario;
    result := inherited post;
    
    if dataset.ChangeCount = 0 then
    begin
      result := true;
      exit;
    end;

    if result then
      result := apply;
    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('PRC014', 'LIBERAR', 'SUCESSO', 'SOLICITACOES_ACESSO',
        vcodigo, buscas)
    else
      vDadosIni.GravaAuditoria('PRC014', 'LIBERAR', 'FALHA', 'SOLICITACOES_ACESSO',
        vcodigo, buscas);
    if Result then
      Refresh
  except
    on e: Exception do
    begin
      vDadosIni.GravaAuditoria('PRC014', 'LIBERAR', 'FALHA', 'SOLICITACOES_ACESSO', vcodigo, buscas);
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
  Refresh;
end;

function TLiberarAcesso.liberarAcesso_lote(Aaction: TActionTipoLib;
  AindexLote, AindexProcesso, AindexSolit: Integer): boolean;
var
  Asols: TSolicitacoes_acesso_classList;
  Aexs : TTabela_processos_usuarios_classList;
  Aprc : TTabela_processos_classList;
  Astrprcs: string;
  I, J: Integer;
  Aprocced: Boolean;
begin
  Asols := TSolicitacoes_acesso_classList.Create;
  Aexs  := TTabela_processos_usuarios_classList.Create;
  Aprc  := TTabela_processos_classList.Create;
  try
    if Aaction = tl_solit then
    begin
      if Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].solit.Items[AindexSolit].usuario_gerente = '' then
      begin
        Asols.Add(Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].solit.Items[AindexSolit].Clone);//.lote := Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].processo.nivel_processo;
        Aprc.Add(Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].processo.Clone);
      end;
    end
    else if Aaction = tl_processo then
    begin
      Aprocced := False;
      for AindexSolit := 0 to Pred(Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].solit.Count) do
        if Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].solit.Items[AindexSolit].usuario_gerente = '' then
        begin
          Aprocced := True;
          Asols.Add(Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].solit.Items[AindexSolit].Clone);//.lote := Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].processo.nivel_processo;
        end;
      if Aprocced then
        Aprc.Add(Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].processo.Clone);
    end
    else
      for AindexProcesso := 0 to Pred(Flote_lib.Items[AindexLote].processos.Count) do
      begin
        Aprocced := False;
        for AindexSolit := 0 to Pred(Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].solit.Count) do
          if Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].solit.Items[AindexSolit].usuario_gerente = '' then
          begin
            Aprocced := True;
            Asols.Add(Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].solit.Items[AindexSolit].Clone);//.lote := Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].processo.nivel_processo;
          end;
        Aprc.Add(Flote_lib.Items[AindexLote].processos.Items[AindexProcesso].processo.Clone);
      end;

    if Asols.Count = 0 then
    begin
      vDadosIni.ShowAtencao('Nenhuma solititação selecionada ou pendente de liberação');
      Exit;
    end;

    Astrprcs := '';
    for I := 0 to Pred(Aprc.Count) do
      Astrprcs := Astrprcs + IfThen(I > 0, ', ') + QuotedStr(Aprc.Items[I].cod_processo);

    Aexs.SetValuesFrom(SqlOpen('select %s from tabela_processos_usuarios where cod_empresa = %s and usuario = %s and cod_processo in (%s)',
                               [TTabela_processos_usuarios_class.GetFieldsSql, vDadosIni.codEmpresa, QuotedStr(vDadosIni.vNomeUsuario), Astrprcs]));

    {$REGION 'validacao, nenhuma solicitacao atendida'}
    Aprocced := False;
    for I := 0 to Pred(Aprc.Count) do
    begin
      if vDadosIni.vNivel >= Aprc.Items[I].nivel_processo then
      begin
        Aprocced := True;
        Break;
      end;

      for J := 0 to Pred(Aexs.Count) do
        if Aexs.Items[I].cod_processo >= Aprc.Items[I].cod_processo then
        begin
          Aprocced := True;
          Break;
        end;
    end;

    if not Aprocced then
    begin
      vDadosIni.ShowAtencao('Nível do usuário não permite liberar nenhuma solicitação');
      Exit;
    end;
    {$ENDREGION}

    {$REGION 'validacao, 1 ou mais solicitações nao atendidas'}
    for I := 0 to Pred(Aprc.Count) do
    begin
      if vDadosIni.vNivel >= Aprc.Items[I].nivel_processo then
        Aprocced := True
      else
      begin
        Aprocced := False;
        for J := 0 to Pred(Aexs.Count) do
          if Aexs.Items[I].cod_processo >= Aprc.Items[I].cod_processo then
          begin                             
            Aprocced := True;
            Break;
          end;
      end;

      if not Aprocced then
      begin
        if vDadosIni.ShowConfirmacao('Existe 1 ou mais solicitações com nível superior ao seu. Continuar e liberar as demais?') <> IDYES then
          Exit;
        for J := Pred(Asols.Count) downto 0 do
          if Asols.Items[J].processo = Aprc.Items[I].cod_processo then
            Asols.Delete(J);
        Break;
      end;
    end;
    {$ENDREGION}

    {$REGION 'liberando via processo e gravando'}
    Astrprcs := vDadosIni.ReplaceFor(Astrprcs, ['''', ' '], ['', '']);
    if not vDadosIni.PesqPros('PRC014', 'LIBERAR',
      Format('LOTE:%d GER:%s PROCESSOS:%s', [Flote_lib.Items[AindexLote].lote, vDadosIni.vNomeUsuario, Astrprcs]),
      'SOLICITACOES_ACESSO', '', buscas, True) then
    	Exit;

    try
      for I := 0 to Pred(Asols.Count) do
      begin
        SqlExec('update solicitacoes_acesso set usuario_gerente = %s where cod_solicitacao = %d and cod_empresa = %s and cont_alt = %d',
                [QuotedStr(vDadosIni.vNomeUsuario), Asols.Items[I].cod_solicitacao, vDadosIni.codEmpresa, Asols.Items[I].cont_alt]);
        if SqlOpen('select cont_alt from solicitacoes_acesso where cod_solicitacao = %d and cod_empresa = %s',
                   [Asols.Items[I].cod_solicitacao, vDadosIni.codEmpresa]).FieldByName('cont_alt').AsInteger <> (Asols.Items[I].cont_alt + 1) then
          raise Exception.CreateFmt('Solicitação %d já não existe ou foi alterada por outro usuário', [Asols.Items[I].cod_solicitacao]);
      end;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

      for I := 0 to Pred(Asols.Count) do
        vDadosIni.GravaAuditoria('PRC014', 'LIBERAR', Format('SUCESSO LOTE %d PROCESSO: %s SOLICITACAO: %d',
                                                             [Flote_lib.Items[AindexLote].lote, Asols.Items[i].processo, Asols.Items[i].cod_solicitacao]),
                                 'SOLICITACOES_ACESSO', IntToStr(Flote_lib.Items[AindexLote].lote), buscas);
      Result := True;
    except on E: Exception do
      begin
        if buscas.Transaction.InTransaction then
          buscas.Transaction.Rollback;

        vDadosIni.GravaAuditoria('PRC014', 'LIBERAR', Format('FALHA LOTE %d', [Flote_lib.Items[AindexLote].lote]),
                                 'SOLICITACOES_ACESSO', IntToStr(Flote_lib.Items[AindexLote].lote), buscas);
        vDadosIni.ShowErro(e.Message);
        registraErro('TLiberarAcesso.liberarAcesso_lote ' + e.Message);
      end;
    end;
    {$ENDREGION}
  finally
    if Assigned(Asols) then FreeAndNil(Asols);
    if Assigned(Aexs) then FreeAndNil(Aexs);
    if Assigned(Aprc) then FreeAndNil(Aprc);
  end;
end;

end.

