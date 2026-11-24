unit UClassesMobile;

interface
uses
  uDataSet_OOP, DB, IBQuery, Classes, DBClient;

type
  TMobile = class;
  TMensMobile = class;
  TUsuario = class;
  TSenhas = class;

  RMensMob = record
    vAvancado: Boolean;
    vAplicativo, vMobile, vEcommerce, vFinanceiro, vPagOnline: Boolean;
    vStatusNO, vStatusEP, vStatusAC, vStatusER, vStatusPP: Boolean;
    vOrigemErp, vOrigemBot: Boolean;
    vDestinoErp, vDestinoBot: Boolean;
    vCampo, vCondicao, vValor, vData1, vData2: string;
    vNaolidas: Boolean;
    vAdicional: Boolean; vCampoAd, vCondicaoAd, vValorAd, vData1Ad, vData2Ad: string;
    vPorDataAd: Boolean; vMensagem, vTarefa: Boolean
  end;

  TUsuario = class(TDataset_OOP)
  private

  public
    constructor create;
    function _abreTodosUsuarios: Boolean;
  end;


  TMobile = class(TDataset_OOP)
  private

  public
    constructor create;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _lixeiraCheia: boolean;
    procedure _cadMobile(pTipoForm: Integer);
    function _abreTodosMobile: Boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _marcarMobile(mobile: Integer);
    procedure _desmarcarTodos;
  end;

  TDocEletronicoMensMobile = class(TDataset_OOP)
  private

  public
    constructor create;
    function abreDocEletronicoMensMobile(
    	codmens: Integer;
      tipo: string): boolean;
  end;

  TMensMobile = class(TDataset_OOP)
  private

  public
    destructor Destroy; override;
    constructor create;
    function LerMensagem: boolean;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _lixeiraCheia: boolean;
    procedure _cadMensMobile(pTipoForm: Integer);
    procedure _cadVerMensMobile(pTipoForm: Integer; pOrigMens: string = '');
    function _pesquisa: Boolean;
    function lerDadosApiMensagem: Boolean;
    function AtribuirProf: Boolean;
    function AtualizarStatus: Boolean;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  var
    vMobile: TMobile;
    vUsuario: TUsuario;
    vSenhas: TSenhas;
    vDoc: TDocEletronicoMensMobile;
    vMensMob: RMensMob;
  end;

	TSenhas = class(TDataset_OOP)
  private

  public
    constructor create;
    function _abreTodosSenhas: Boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcarUsuario(cod_usuario_env: Integer);
  end;


var
  CadMobile: TMobile;
  CadMensMobile: TMensMobile;

implementation

uses uDadosIni, uPadrao, IBDatabase, Forms, Windows, uDtmAtivo, SysUtils, RDprint, Controls,
  Variants, UDtmMobile, uCadMobile, uCadMensMobile;

function hwc_atribuir_prof(AparamsList: WideString; Acod_mens: Integer; Auuid: WideString; Aorigem: WideString; Acod_tarefa: Integer; Atipo_tarefa: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';
function hwc_update_mensageria(AparamsList: WideString; Acod_mens: Integer; Auuid: WideString; Aorigem: WideString; Astatus: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';

{ TMobile }

constructor TMobile.create;
begin

  DataSet := TClientDataSet(dtmMobile.cdsMobile);
  transacao := TIBTransaction(dtmMobile.transacao);
  Buscas := TIBQuery(dtmMobile.qrBuscas);

end;

function TMobile.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('IDMOBILE').AsString;

  if dataSet.FieldByName('ATIVO').AsInteger = 1 then
  begin

    if not vDadosIni.PesqPros('MOB005', 'EXCLUIR', '', 'MOBILE',
      dataSet.FieldByName('IDMOBILE').AsString, buscas, false) then
      Exit;

    if Application.MessageBox('Tem certeza que deseja enviar este registro para Lixeira?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      Exit;

    dataSet.Edit;
    dataSet.FieldByName('ATIVO').AsInteger := 0;
    dataSet.Post;

    result := Apply;
    if result then
      result := CommitaTransacao;
    if Result then
      vDadosIni.GravaAuditoria('MOB005', 'EXCLUIR', 'SUCESSO', 'MOBILE', vCodFormula, buscas)
    else
      vDadosIni.GravaAuditoria('MOB005', 'EXCLUIR', 'FALHA', 'MOBILE', vCodFormula, buscas);

    Result := true;
    Refresh;

    Exit;
  end;

  if not vDadosIni.PesqPros('MOB006', 'EXCLUIR', '', 'MOBILE',
    dataSet.FieldByName('IDMOBILE').AsString, buscas, false) then
    Exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  if ExecutaComandosSql('select first 1 idseqm from mensagem_mob ' +
    ' where idmobile = ' + IntToStr(dataSet.FieldByName('IDMOBILE').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa) then
  begin
    Application.MessageBox('O mobile não pode ser excluída pois está vinculado a uma mensagem',
      'Atenção', 0 + 64);
    Exit;
  end;

  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('MOB006', 'EXCLUIR', 'SUCESSO', 'MOBILE', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('MOB006', 'EXCLUIR', 'FALHA', 'MOBILE', vCodFormula, buscas);

  Result := true;
  Refresh;
end;

function TMobile.edit: boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('MOB004', 'ALTERAR', '', 'MOBILE',
    '', buscas, false) then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('DESCRICAO_MOB').AsString := dataSet.FieldByName('DESCRICAO_MOB').AsString;
    dataSet.FieldByName('STATUS_MOB').AsString := dataSet.FieldByName('STATUS_MOB').AsString;
  end;

end;

function TMobile.Insert: boolean;
begin
  if not vDadosIni.PesqPros('MOB003', 'INCLUIR', '', 'MOBILE',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect('select m.* from mobile m ' +
      ' where m.idmobile=0 and m.ativo=0 and m.cod_empresa =0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('ATIVO').AsFloat := 1;
  end;
end;

function TMobile.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('MOB008', 'SALVAR', '', 'MOBILE',
      dataSet.FieldByName('IDMOBILE').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if trim(dataSet.FieldByName('DESCRICAO_MOB').AsString) = '' then
      raiseExceptionCreate('Descrição do mobile deve ser informado', 'DBEdit2');

    if trim(dataSet.FieldByName('STATUS_MOB').AsString) = '' then
      raiseExceptionCreate('Status do mobile deve ser informado', 'DBComboBox1');

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('IDMOBILE').AsInteger :=
        Gencodigo('MOBILE', dtmMobile.SpIncCodigo, vDadosIni.codEmpresa);

    end;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('MOB008', acao, 'SUCESSO', 'MOBILE',
        dataSet.FieldByName('IDMOBILE').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('MOB008', acao, 'FALHA', 'MOBILE',
        dataSet.FieldByName('IDMOBILE').AsString, buscas);

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

function TMobile._abrelixeira: boolean;
begin
  if not _lixeiraCheia then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select m.* from mobile m where m.cod_empresa= ' + vDadosIni.codEmpresa +
      ' and m.ativo = 0');
end;

procedure TMobile._cadMobile(pTipoForm: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro do Mobile');
    if dtmMobile = nil then
      dtmMobile := TdtmMobile.Create(dtmMobile);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('MOB001', 'CONSULTA', '', 'MOBILE', '',
      dtmMobile.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadMobile = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadMobile, frmCadMobile);
    end;

    if (pTipoForm > 0) and (not frmCadMobile.Visible) then
      frmCadMobile.ShowModal
    else if (not frmCadMobile.Visible) then
      frmCadMobile.Show
    else if frmCadMobile.FormStyle = fsMDIChild then
      frmCadMobile.Show
    else
      frmCadMobile.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TMobile._lixeiraCheia: boolean;
begin
  Result := ExecutaComandosSql('Select first 1 idmobile from MOBILE ' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TMobile._restauralixeira: boolean;
begin
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        if (Edit) or (dataSet.State = dsEdit) then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          Result := Post;
          if Result then
            Result := CommitaTransacao;

          if Result then
            vDadosIni.GravaAuditoria('MOB007', 'RESTAURAR', 'SUCESSO',
              'MOBILE', dataSet.FieldByName('IDMOBILE').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('MOB007', 'RESTAURAR', 'FALHA',
              'MOBILE', dataSet.FieldByName('IDMOBILE').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação', 0 + 64);
  Refresh;
end;

function TMobile._abreTodosMobile: Boolean;
begin
  Result := montaSelect('select idmobile, descricao_mob from mobile ' +
    ' where idmobile > 0 and ativo = 1 and cod_empresa =' + vDadosIni.codEmpresa);
end;

procedure TMobile._marcaDesmarcaLinha;
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

procedure TMobile._marcarMobile(mobile: Integer);
begin
  try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if (dataSet.FieldByName('IDMOBILE').AsInteger = mobile) then
      begin
        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := 'S';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TMobile._marcarTodos;
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

procedure TMobile._desmarcarTodos;
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

{ TMensMobile }

function TMensMobile.AtribuirProf: Boolean;
begin
 Result := False;

 if dataSet.IsEmpty then
   Exit;

 if dataSet.FieldByName('COD_TAREFA').AsInteger <= 0 then
 begin
   Application.MessageBox('Mensagem selecionada não é do tipo tarefa.', 'Informação', MB_ICONWARNING + MB_OK);
   Exit;
 end;

 if not dataSet.FieldByName('COD_PROF_RESP').IsNull then
 begin
   Application.MessageBox('Tarefa com profissional responsável já atribuído.', 'Informação', MB_ICONWARNING + MB_OK);
   Exit;
 end;

 if not vDadosIni.PesqPros('MOB021', 'ATRIBUIR', '', 'MENSAGEM_MOB',
 	dataSet.FieldByName('IDSEQM').AsString, buscas, False) then
     Exit;

 if Application.MessageBox('Deseja atribuir profissional a esta tarefa?',
    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
    Exit;

 Result := hwc_atribuir_prof(
    Format(';databaseName=%s;empresaid=%s;silent=false;userHW=HW;userLevel=10',
           [vDadosIni.vBancoHW, vDadosIni.codEmpresa]),
    dataSet.FieldByName('IDSEQM').AsInteger,
    dataSet.FieldByName('UUID').AsString,
    dataSet.FieldByName('ORIGEM').AsString,
    dataSet.FieldByName('COD_TAREFA').AsInteger,
    dataSet.FieldByName('TIPO_TAREFA').AsString);

 if Result then
 begin
   Refresh;
   Application.MessageBox('Profissional atribuído a tarefa.', 'Informação', MB_OK + MB_ICONINFORMATION);
 end;
end;

function TMensMobile.AtualizarStatus: Boolean;
begin
  Result := False;

 if dataSet.IsEmpty then
   Exit;

 if dataSet.FieldByName('COD_TAREFA').AsInteger <= 0 then
 begin
   Application.MessageBox('Mensagem selecionada não é do tipo tarefa.', 'Informação', MB_ICONWARNING + MB_OK);
   Exit;
 end;

 if dataSet.FieldByName('ORIGEM').AsString <> 'bot' then
 begin
   Application.MessageBox('Origem da tarefa deve ser do tipo bot.', 'Informação', MB_ICONWARNING + MB_OK);
   Exit;
 end;

 if (dataSet.FieldByName('STATUS_ENV').AsString <> 'NO') and (dataSet.FieldByName('STATUS_ENV').AsString <> 'EP') then
 begin
   Application.MessageBox('Mensagem com status finalizado.', 'Informação', MB_ICONWARNING + MB_OK);
   Exit;
 end;

 if not vDadosIni.PesqPros('MOB022', 'STATUS', '', 'MENSAGEM_MOB',
 	dataSet.FieldByName('IDSEQM').AsString, buscas, False) then
     Exit;

 if Application.MessageBox('Deseja finalizar esta tarefa?',
    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
    Exit;

 Result := hwc_update_mensageria(
    Format(';databaseName=%s;empresaid=%s;silent=false;userHW=HW;userLevel=10',
           [vDadosIni.vBancoHW, vDadosIni.codEmpresa]),
    dataSet.FieldByName('IDSEQM').AsInteger,
    dataSet.FieldByName('UUID').AsString,
    dataSet.FieldByName('ORIGEM').AsString,
    'PP');

 if Result then
 begin
   Refresh;
   Application.MessageBox('Status da tarefa finalizado.', 'Informação', MB_OK + MB_ICONINFORMATION);
 end;
end;

constructor TMensMobile.create;
begin
  dataSet := TClientDataSet(dtmMobile.cdsMensMobile);
  transacao := TIBTransaction(dtmMobile.transacao);
  buscas := TIBQuery(dtmMobile.qrBuscas);

  vMobile := TMobile.Create;
  vMobile.dataSet := TClientDataSet(dtmMobile.cdsMobileCons);

  vUsuario := TUsuario.create;
  vSenhas := TSenhas.create;
  vDoc := TDocEletronicoMensMobile.create;
end;

function TMensMobile.Delete: boolean;
var
	vApagar: Boolean;
  codMensagemMob: string;
  mensagemMob: string;
  vtemp: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  try
    vApagar        := dataSet.FieldByName('ATIVO').AsInteger <> 1;
    codMensagemMob := dataSet.FieldByName('IDSEQM').AsString;
    mensagemMob    := trim(dataSet.FieldByName('HTML').AsString);

    prepare_loop('SEL = ''S''');
    if not dataset.IsEmpty then
    begin
      vApagar         := dataSet.FieldByName('ATIVO').AsInteger <> 1;
      codMensagemMob  := '';
      mensagemMob     := '';
    end;
  finally
    prepare_loop_done;
  end;

  try
    if (trim(codMensagemMob) <> '') then
      prepare_loop('IDSEQM = ' + codMensagemMob)
    else
      prepare_loop('SEL = ''S''');

    if vApagar then
    begin
      vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
        'MENSAGEM' + #13 +
        'Texto: ' + mensagemMob;

      if (trim(codMensagemMob) = '') then
        vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

      if not vDadosIni.PesqPros('MOB016', 'EXCLUIR', '', 'MENSAGEM_MOB',
        vDadosIni.IfThen(trim(codMensagemMob) <> '', codMensagemMob, ''), buscas, True) then
        exit;

      if Application.MessageBox(PChar(vtemp),
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
        exit;
    end
    else
    begin
      vtemp := 'Tem certeza que deseja mover este registro para a Lixeira?' + #13 + #13 +
        'MENSAGEM' + #13 +
        'Texto: ' + mensagemMob;

       if (trim(codMensagemMob) = '') then
          vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

      if not vDadosIni.PesqPros('MOB015', 'EXCLUIR', '', 'MENSAGEM_MOB',
        vDadosIni.IfThen(trim(codMensagemMob) <> '', codMensagemMob, ''), buscas, false) then
        exit;

      if Application.MessageBox(PChar(vtemp),
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
        exit;
    end;

    if vApagar then
      vDadosIni.abreStatusProcessamento('', 'Excluíndo mensagem(ns) permanentemente')
    else
      vDadosIni.abreStatusProcessamento('', 'Movendo mensagem(ns) para lixeira');

    dataset.First;
    while not dataset.Eof do
    begin
      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo mensagem(ns) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo mensagem(ns) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

      if vApagar then
      begin
        SqlExec(' delete from mensagem_mob ' +
          ' where idseqm = %d and cod_empresa = %d ',
          [fint('idseqm'), fint('cod_empresa')], buscas);

        if (trim(codMensagemMob) = '') then
          vDadosIni.GravaAuditoria('MOB016', 'EXCLUIR', 'SUCESSO', 'MENSAGEM_MOB',
            dataSet.FieldByName('IDSEQM').AsString, buscas);
      end
      else
      begin
        SqlExec(' update mensagem_mob set ativo = 0 ' +
          ' where idseqm = %d and cod_empresa = %d ',
          [fint('idseqm'), fint('cod_empresa')], buscas);

        if (trim(codMensagemMob) = '') then
          vDadosIni.GravaAuditoria('MOB015', 'EXCLUIR', '', 'MENSAGEM_MOB',
            dataSet.FieldByName('IDSEQM').AsString, buscas);
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
    vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'MOB016', 'MOB015'),
      'EXCLUIR', 'SUCESSO', 'MENSAGEM_MOB',
      vDadosIni.IfThen(trim(codMensagemMob) <> '', codMensagemMob, ''), buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'MOB016', 'MOB015'),
      'EXCLUIR', 'FALHA', 'MENSAGEM_MOB',
      vDadosIni.IfThen(trim(codMensagemMob) <> '', codMensagemMob, ''), buscas);
  end;

  if Result then
    Refresh;
end;

destructor TMensMobile.Destroy;
begin
  vMobile.Free;
  vMobile := nil;

  vUsuario.Free;
  vUsuario := nil;

  vSenhas.Free;
  vSenhas := nil;

  vDoc.Free;
  vDoc := nil;

  inherited;
end;

function TMensMobile.edit: boolean;
begin
  Result := False;

  if ((not dataSet.FieldByName('DATA_RECEPCAO').IsNull) and
      (not dataSet.FieldByName('HORA_RECEPCAO').IsNull)) then
  begin
    Result := True;
    vMobile._abreTodosMobile;
    vUsuario._abreTodosUsuarios;
    vSenhas._abreTodosSenhas;
    exit;
  end;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('MOB014', 'ALTERAR', '', 'MENSAGEM_MOB',
    dataSet.FieldByName('IDSEQM').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    Result := True;
    dataSet.FieldByName('cod_us_leu').AsString := IntToStr(vDadosIni.vCodUsuario);
    dataSet.FieldByName('data_recepcao').AsDateTime :=
      vDadosIni.getDataHoraBanco(dtmMobile.qrBuscas);
    dataSet.FieldByName('hora_recepcao').AsString := FormatDateTime('HH:MM',
      dataSet.FieldByName('data_recepcao').AsDateTime);
    dataSet.FieldByName('data_recepcao').AsString := FormatDateTime('DD/MM/YYYY',
      dataSet.FieldByName('data_recepcao').AsDateTime);
    if dataSet.FieldByName('id_msg_aplicativo').IsNull then
    	dataSet.FieldByName('id_msg_aplicativo').AsInteger := 0;
    if dataSet.FieldByName('id_msg_plataforma').IsNull then
    	dataSet.FieldByName('id_msg_plataforma').AsInteger := 0;
    if dataSet.FieldByName('cod_carta').IsNull then
    	dataSet.FieldByName('cod_carta').AsInteger := 0;
    vMobile._abreTodosMobile;
    vUsuario._abreTodosUsuarios;
    vSenhas._abreTodosSenhas;
  end;

end;

function TMensMobile.Insert: boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('MOB013', 'INCLUIR', '', 'MENSAGEM_MOB', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect(' select mb.*, ' +
      ' m.descricao_mob, ' +
      ' c.nome_vendedor as usuario_leu, ' +
      ' f.nome_vendedor as usuario_envio, ' +
      ' a.aplicativo, ' +
      ' p.plataforma, ' +
      ' tp.sla_seg_tarefa, ' +
      ' r.nome_vendedor as prof_resp, ' +
      ' ar.aplicativo as aplicativo_resp, ' +
      ' pr.plataforma as plataforma_resp ' +
      ' from mensagem_mob mb ' +
      ' left join mobile m on m.idmobile = mb.idmobile and m.cod_empresa = mb.cod_empresa ' +
      ' left join colaborador c on c.cod_vendedor = mb.cod_us_leu and c.cod_empresa = mb.cod_empresa ' +
      ' left join colaborador f on f.cod_vendedor = mb.us_envio and f.cod_empresa = mb.cod_empresa ' +
      ' left join colaborador r on r.cod_vendedor = mb.cod_prof_resp and r.cod_empresa = mb.cod_empresa ' +
      ' left join msg_aplicativo a on a.id = mb.id_msg_aplicativo ' +
      ' left join msg_plataforma p on p.id = mb.id_msg_plataforma and p.cod_empresa = mb.cod_empresa ' +
      ' left join msg_aplicativo ar on ar.id = mb.id_msg_aplicativo_resp ' +
      ' left join msg_plataforma pr on pr.id = mb.id_msg_plataforma_resp and pr.cod_empresa = mb.cod_empresa ' +
      ' left join msg_tipo_tarefa tp on tp.id = mb.id_msg_tipo_tarefa ' +
      ' where mb.idseqm = 0 and mb.cod_empresa = 0 and m.ativo = 0 and c.ativo = 0');

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('tipo').AsString := 'E';
    dataSet.FieldByName('natureza_mens').AsString := 'D';
    dataSet.FieldByName('us_envio').AsString := IntToStr(vDadosIni.vCodUsuario);
    dataSet.FieldByName('data_envio').AsDateTime :=
      vDadosIni.getDataHoraBanco(dtmMobile.qrBuscas);
    dataSet.FieldByName('hora_envio').AsString := FormatDateTime('HH:MM',
      dataSet.FieldByName('data_envio').AsDateTime);
    dataSet.FieldByName('data_envio').AsString := FormatDateTime('DD/MM/YYYY',
      dataSet.FieldByName('data_envio').AsDateTime);
    dataSet.FieldByName('ativo').AsFloat := 1;
    dataSet.FieldByName('id_msg_aplicativo').AsInteger := 0;
    dataSet.FieldByName('id_msg_plataforma').AsInteger := 0;
    dataSet.FieldByName('cod_carta').AsInteger := 0;
    vMobile._abreTodosMobile;
    vUsuario._abreTodosUsuarios;
    vSenhas._abreTodosSenhas;
  end;
end;

function TMensMobile.lerDadosApiMensagem: Boolean;
begin
	try
    Result := False;

    if dataSet.IsEmpty then
      Exit;

    if frmCadMensMob.PageControl4.ActivePage = frmCadMensMob.TabSheet_Cad_Mensageria then
      vDoc.abreDocEletronicoMensMobile(
        dataSet.FieldByName('IDSEQM').AsInteger,
        'HWC_MENS_P_')
    else if frmCadMensMob.PageControl4.ActivePage = frmCadMensMob.TabSheet_Ler_Mensageria then
      vDoc.abreDocEletronicoMensMobile(
        dataSet.FieldByName('IDSEQM').AsInteger,
        'HWC_MENS_G_')
    else if frmCadMensMob.PageControl4.ActivePage = frmCadMensMob.TabSheet_Update_Mensageria then
      vDoc.abreDocEletronicoMensMobile(
        dataSet.FieldByName('IDSEQM').AsInteger,
        'HWC_MENS_U_');

    Result := vDadosIni.abreForm('Dados API', frmCadMensMob.pnDadosAPI, [ofEscapeExit, ofAlignAllClientWinCtrl]);
  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TMensMobile.LerMensagem: boolean;
begin
  try
    Result := False;

    storeRecNo;

    if dataSet.IsEmpty then
      Exit;

    if dataSet.FieldByName('ativo').AsInteger <> 1 then
      Exit;

    if not vDadosIni.PesqPros('MOB014', 'ALTERAR', '', 'MENSAGEM_MOB', '', buscas, False) then
      Exit;

    if Application.MessageBox('Deseja ler as mensagens selecionadas?',
        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
    begin
      Result := false;
      exit;
    end;

    try
      dataSet.Filter := 'sel = ''S'' ';
      dataSet.Filtered := True;

      if dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Nenhuma mensagem selecionado!'), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;

      dataSet.First;
      while not dataSet.Eof do
      begin
        dataSet.Edit;
        dataSet.FieldByName('cod_us_leu').AsString := IntToStr(vDadosIni.vCodUsuario);
        dataSet.FieldByName('data_recepcao').AsDateTime :=
          vDadosIni.getDataHoraBanco(dtmMobile.qrBuscas);
        dataSet.FieldByName('hora_recepcao').AsString := FormatDateTime('HH:MM',
          dataSet.FieldByName('data_recepcao').AsDateTime);
        dataSet.FieldByName('data_recepcao').AsString := FormatDateTime('DD/MM/YYYY',
          dataSet.FieldByName('data_recepcao').AsDateTime);
        dataSet.Post;

        vDadosIni.GravaAuditoria('MOB018', 'SALVAR', '', 'MENSAGEM_MOB',
        	dataSet.FieldByName('idseqm').AsString, buscas);
        dataSet.Next;
      end;
    finally
      dataSet.Filtered := False;
    end;

    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('MOB018', 'SALVAR', 'SUCESSO', 'MENSAGEM_MOB',
      	dataSet.FieldByName('idseqm').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('MOB018', 'SALVAR', 'FALHA', 'MENSAGEM_MOB', '', buscas);
    end;

    dataSet.Refresh;

    restoreRecNo;
  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TMensMobile.post: boolean;
var
  acao, mensagem: string;
  vselecionada: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('MOB018', 'SALVAR', '', 'MENSAGEM_MOB',
    dataSet.FieldByName('IDSEQM').AsString, buscas, False) then
    Exit;

  try
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
    begin
      vselecionada := true;
      acao := 'EDITAR';
      Result := inherited Post;
    end
    else
    begin
      acao := 'INSERIR';

      mensagem := dataSet.FieldByName('HTML').AsString;

      if trim(dataSet.FieldByName('HTML').AsString) = '' then
        raiseExceptionCreate('Mensagem deve ser informado!', 'DBMemo1');

      if frmCadMensMob.PageControl2.ActivePage = frmCadMensMob.TabSheetMobile then
      begin
        vMobile.dataSet.First;
        while not vMobile.dataSet.Eof do
        begin
          if ((vMobile.dataSet.FieldByName('SEL').AsString) = 'S') then
          begin
            if not vselecionada then
              dataSet.Cancel;
            vselecionada := true;

            dataSet.Insert;

            dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
            dataSet.FieldByName('tipo').AsString := 'E';
            dataSet.FieldByName('natureza_mens').AsString := 'D';
            dataSet.FieldByName('us_envio').AsString := IntToStr(vDadosIni.vCodUsuario);
            dataSet.FieldByName('data_envio').AsDateTime :=
              vDadosIni.getDataHoraBanco(dtmMobile.qrBuscas);
            dataSet.FieldByName('hora_envio').AsString := FormatDateTime('HH:MM',
              dataSet.FieldByName('data_envio').AsDateTime);
            dataSet.FieldByName('data_envio').AsString := FormatDateTime('DD/MM/YYYY',
              dataSet.FieldByName('data_envio').AsDateTime);
            dataSet.FieldByName('ativo').AsFloat := 1;
            dataSet.FieldByName('IDMOBILE').AsInteger :=
              vMobile.dataSet.FieldByName('IDMOBILE').AsInteger;
            dataSet.FieldByName('HTML').AsString := mensagem;
            dataSet.FieldByName('IDSEQM').AsInteger :=
              Gencodigo('MENSAGEM_MOB', dtmMobile.SpIncCodigo, vDadosIni.codEmpresa);

            dataSet.Post;
          end;
          vMobile.dataSet.Next;
        end;
      end
      else
      begin
        vSenhas.dataSet.First;
        while not vSenhas.dataSet.Eof do
        begin
          if ((vSenhas.dataSet.FieldByName('SEL').AsString) = 'S') then
          begin
            if not vselecionada then
              dataSet.Cancel;
            vselecionada := true;

            dataSet.Insert;
            
            dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
            dataSet.FieldByName('tipo').AsString := 'E';
            dataSet.FieldByName('natureza_mens').AsString := 'D';
            dataSet.FieldByName('us_envio').AsString := IntToStr(vDadosIni.vCodUsuario);
            dataSet.FieldByName('data_envio').AsDateTime :=
              vDadosIni.getDataHoraBanco(dtmMobile.qrBuscas);
            dataSet.FieldByName('hora_envio').AsString := FormatDateTime('HH:MM',
              dataSet.FieldByName('data_envio').AsDateTime);
            dataSet.FieldByName('data_envio').AsString := FormatDateTime('DD/MM/YYYY',
              dataSet.FieldByName('data_envio').AsDateTime);
            dataSet.FieldByName('ativo').AsFloat := 1;
            dataSet.FieldByName('IDMOBILE').AsInteger := 0;
            dataSet.FieldByName('US_DEST').AsString :=
              UpperCase(trim(vSenhas.dataSet.FieldByName('USUARIO').AsString));
            dataSet.FieldByName('HTML').AsString := mensagem;
            dataSet.FieldByName('IDSEQM').AsInteger :=
              Gencodigo('MENSAGEM_MOB', dtmMobile.SpIncCodigo, vDadosIni.codEmpresa);
            dataSet.Post;
          end;
          vSenhas.dataSet.Next;
        end;
      end;
    end;

    if (vselecionada = False) then
      if frmCadMensMob.PageControl2.ActivePage = frmCadMensMob.TabSheetMobile then
        raiseExceptionCreate('Nenhum Mobile selecionado!', 'DBGrid2')
      else
        raiseExceptionCreate('Nenhum Usuário selecionado!', 'DBGrid3');
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('MOB018', acao, 'SUCESSO', 'MENSAGEM_MOB',
        dataSet.FieldByName('IDSEQM').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('MOB018', acao, 'FALHA', 'MENSAGEM_MOB',
        dataSet.FieldByName('IDSEQM').AsString, buscas);
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

function TMensMobile._abrelixeira: boolean;
begin
  if not _lixeiraCheia then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect(' select mb.*, ' +
    	 ' m.descricao_mob, ' +
       ' c.nome_vendedor as usuario_leu, ' +
       ' f.nome_vendedor as usuario_envio, ' +
       ' a.aplicativo, ' +
       ' p.plataforma, ' +
       ' tp.sla_seg_tarefa, ' +
       ' r.nome_vendedor as prof_resp, ' +
       ' ar.aplicativo as aplicativo_resp, ' +
       ' pr.plataforma as plataforma_resp ' +
       ' from mensagem_mob mb' +
       ' left join mobile m on m.idmobile = mb.idmobile and m.cod_empresa = mb.cod_empresa ' +
       ' left join colaborador c on c.cod_vendedor = mb.cod_us_leu and c.cod_empresa = mb.cod_empresa ' +
       ' left join colaborador f on f.cod_vendedor = mb.us_envio and f.cod_empresa = mb.cod_empresa ' +
       ' left join colaborador r on r.cod_vendedor = mb.cod_prof_resp and r.cod_empresa = mb.cod_empresa ' +
       ' left join msg_aplicativo a on a.id = mb.id_msg_aplicativo ' +
       ' left join msg_plataforma p on p.id = mb.id_msg_plataforma and p.cod_empresa = mb.cod_empresa ' +
       ' left join msg_aplicativo ar on ar.id = mb.id_msg_aplicativo_resp ' +
       ' left join msg_plataforma pr on pr.id = mb.id_msg_plataforma_resp and pr.cod_empresa = mb.cod_empresa ' +
       ' left join msg_tipo_tarefa tp on tp.id = mb.id_msg_tipo_tarefa ' +
       ' where mb.ativo = 0 and mb.cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TMensMobile._cadMensMobile(pTipoForm: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro de Mensagem');
    if dtmMobile = nil then
      dtmMobile := TdtmMobile.Create(dtmMobile);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('MOB011', 'CONSULTA', '', 'MOBILE', '',
      dtmMobile.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadMensMob = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadMensMob, frmCadMensMob);
    end;

    if (pTipoForm > 0) and (not frmCadMensMob.Visible) then
      frmCadMensMob.ShowModal
    else if (not frmCadMensMob.Visible) then
      frmCadMensMob.Show
    else if frmCadMensMob.FormStyle = fsMDIChild then
      frmCadMensMob.Show
    else
      frmCadMensMob.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TMensMobile._cadVerMensMobile(pTipoForm: Integer; pOrigMens: string = '');
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro de Mensagens');
    if dtmMobile = nil then
      dtmMobile := TdtmMobile.Create(dtmMobile);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('MOB011', 'CONSULTA', '', 'MOBILE', '',
      dtmMobile.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    vDadosIni.vPesquisa := 'VERMENSAGEM|' + trim(vDadosIni.vNomeUsuario);
    
    if frmCadMensMob = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadMensMob, frmCadMensMob);
    end;

    frmCadMensMob.CheckBox1.Checked    := true;
    frmCadMensMob.CheckBox2.Checked    := true;

    frmCadMensMob.ComboBox1.Text       := 'Data Envio';
    frmCadMensMob.ComboBox1.ItemIndex  := frmCadMensMob.ComboBox1.Items.IndexOf(frmCadMensMob.ComboBox1.Text);
    frmCadMensMob.ComboBox1Exit(frmCadMensMob.ComboBox1);
    frmCadMensMob.MaskEdit1.Text       := FormatDateTime('dd/mm/yyyy', Date - 30);
    frmCadMensMob.MaskEdit2.Text       := FormatDateTime('dd/mm/yyyy', Date);

    frmCadMensMob.ComboBox11.Text      := 'Para';
    frmCadMensMob.ComboBox11.ItemIndex := frmCadMensMob.ComboBox11.Items.IndexOf(frmCadMensMob.ComboBox11.Text);
    frmCadMensMob.ComboBox11Exit(frmCadMensMob.ComboBox11);
    frmCadMensMob.ComboBox12.Text      := 'Igual';
    frmCadMensMob.MaskEdit7.Text       := vDadosIni.vNomeUsuario;

    frmCadMensMob.ckMobile.Checked     := false;
    frmCadMensMob.ckEcommerce.Checked  := false;
    frmCadMensMob.ckFinanceiro.Checked := false;
    frmCadMensMob.ckPagOnline.Checked  := false;
    if pOrigMens = 'M' then
    begin
    	frmCadMensMob.CheckBox3.Checked := true;
    	frmCadMensMob.ckMobile.Checked := true;
    end
    else if pOrigMens = 'E' then
    begin
    	frmCadMensMob.CheckBox3.Checked := true;
    	frmCadMensMob.ckEcommerce.Checked := true;
    end
    else if pOrigMens = 'F' then
    begin
    	frmCadMensMob.CheckBox3.Checked := true;
    	frmCadMensMob.ckFinanceiro.Checked := true;
    end
    else if pOrigMens = 'P' then
    begin
    	frmCadMensMob.CheckBox3.Checked := true;
    	frmCadMensMob.ckPagOnline.Checked := true;
    end;

    if (pTipoForm > 0) and (not frmCadMensMob.Visible) then
      frmCadMensMob.ShowModal
    else if (not frmCadMensMob.Visible) then
      frmCadMensMob.Show
    else if frmCadMensMob.FormStyle = fsMDIChild then
      frmCadMensMob.Show
    else
      frmCadMensMob.ShowModal;


    frmCadMensMob.BitBtn1.Click;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TMensMobile._desmarcarTodos;
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

function TMensMobile._lixeiraCheia: boolean;
begin
  Result := ExecutaComandosSql('select first 1 mb.idseqm from mensagem_mob mb ' +
    ' left join mobile m on m.idmobile = mb.idmobile and m.cod_empresa = mb.cod_empresa ' +
    ' where mb.ativo= 0 and mb.cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TMensMobile._marcaDesmarcaLinha;
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

procedure TMensMobile._marcarTodos;
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

function TMensMobile._pesquisa: Boolean;
var
  I, erro: Integer;
  vOrigMens, vStatusEnv, vOrigem: string; vDestino: string;
  formatodata: string;
  vSqlTemp, vSqlTempAd, vSeqm: string;
begin
  vSqlTemp   := '';
  vSqlTempAd := '';

  if trim(vMensMob.vCampo) = 'Usuario Envio' then
    vSqlTemp := 'f.nome_vendedor '
  else if trim(vMensMob.vCampo) = 'Usuario Receptor' then
    vSqlTemp := 'c.nome_vendedor '
  else if trim(vMensMob.vCampo) = 'Mobile' then
  	vSqlTemp := 'm.descricao_mob '
  else if trim(vMensMob.vCampo) = 'Aplicativo' then
  	vSqlTemp := 'a.aplicativo '
  else if trim(vMensMob.vCampo) = 'Plataforma' then
  	vSqlTemp := 'p.plataforma '
  else if trim(vMensMob.vCampo) = 'Sla Segundos Tarefa' then
   vSqlTemp := 'tp.sla_seg_tarefa '
  else if trim(vMensMob.vCampo) = 'Prof Resp' then
    vSqlTemp := 'r.nome_vendedor'
  else if trim(vMensMob.vCampo) = 'Aplicativo Resp' then
    vSqlTemp := 'ar.aplicativo'
  else if trim(vMensMob.vCampo) = 'Plataforma Resp' then
    vSqlTemp := 'pr.plataforma';

  if vSqlTemp <> '' then
  begin
    if vMensMob.vCondicao = 'Igual' then
      vMensMob.vCondicao := '= '
    else if vMensMob.vCondicao = 'Maior' then
      vMensMob.vCondicao := '> '
    else if vMensMob.vCondicao = 'Maior ou Igual' then
      vMensMob.vCondicao := '>= '
    else if vMensMob.vCondicao = 'Menor' then
      vMensMob.vCondicao := '< '
    else if vMensMob.vCondicao = 'Menor ou Igual' then
      vMensMob.vCondicao := '<= '
    else if vMensMob.vCondicao = 'Diferente' then
      vMensMob.vCondicao := '<> '
    else if (vMensMob.vCondicao = 'Esta contido') then
      vMensMob.vCondicao := 'like'
    else if (vMensMob.vCondicao = 'Começa') then
      vMensMob.vCondicao := 'Começa'
    else
      vMensMob.vCondicao := '= ';

    if vMensMob.vCondicao = 'like' then
      vSqlTemp := vSqlTemp + vMensMob.vCondicao + QuotedStr('%' + vMensMob.vValor + '%')
    else if vMensMob.vCondicao = 'Começa' then
      vSqlTemp := vSqlTemp + 'like' + QuotedStr(vMensMob.vValor + '%')
    else
      vSqlTemp := vSqlTemp + vMensMob.vCondicao + QuotedStr(vMensMob.vValor);
    vMensMob.vValor := '';
  end;

  if vMensMob.vNaolidas then
  begin
  	if trim(vSqlTemp) <> '' then
    	vSqlTemp := vSqlTemp + ' and ';
    vSqlTemp := vSqlTemp + ' mensagem_mob.data_recepcao is null and mensagem_mob.hora_recepcao is null';
  end;

  vSeqm := copy(dataSet.IndexName, 5, length(dataSet.IndexName));
  if Trim(vSeqm) = '' then
    vSeqm := 'IDSEQM';

  vOrigMens  := '';
  vStatusEnv := '';
  vOrigem    := '';
  vDestino   := '';

  if vMensMob.vAvancado then
  begin
    if vMensMob.vAplicativo then
      vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('A');
    if vMensMob.vMobile then
      vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('M');
    if vMensMob.vEcommerce then
      vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('E');
    if vMensMob.vFinanceiro then
      vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('F');
    if vMensMob.vPagOnline then
      vOrigMens := vDadosIni.IfThen(trim(vOrigMens) = '', '', trim(vOrigMens) + ',') + QuotedStr('P');

    if vMensMob.vStatusNO then
      vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('NO');
    if vMensMob.vStatusEP then
      vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('EP');
    if vMensMob.vStatusAC then
      vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('AC');
    if vMensMob.vStatusER then
      vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('ER');
    if vMensMob.vStatusPP then
      vStatusEnv := vDadosIni.IfThen(trim(vStatusEnv) = '', '', trim(vStatusEnv) + ',') + QuotedStr('PP');

    if vMensMob.vOrigemErp then
      vOrigem := vDadosIni.IfThen(trim(vOrigem) = '', '', trim(vOrigem) + ',') + QuotedStr('erp');
    if vMensMob.vOrigemBot then
      vOrigem := vDadosIni.IfThen(trim(vOrigem) = '', '', trim(vOrigem) + ',') + QuotedStr('bot');

    if vMensMob.vDestinoErp then
      vDestino := vDadosIni.IfThen(trim(vDestino) = '', '', trim(vDestino) + ',') + QuotedStr('erp');
    if vMensMob.vDestinoBot then
      vDestino := vDadosIni.IfThen(trim(vDestino) = '', '', trim(vDestino) + ',') + QuotedStr('bot');

    if trim(vOrigMens) <> '' then
    begin
      if trim(vSqlTemp) <> '' then
        vSqlTemp := vSqlTemp + ' and ';
      vSqlTemp := vSqlTemp + ' mensagem_mob.orig_mens in (' + vOrigMens + ')';
    end;

    if trim(vStatusEnv) <> '' then
    begin
      if trim(vSqlTemp) <> '' then
        vSqlTemp := vSqlTemp + ' and ';
      vSqlTemp := vSqlTemp + ' mensagem_mob.status_env in (' + vStatusEnv + ')';
    end;

    if vMensMob.vMensagem <> vMensMob.vTarefa then
    begin
      if trim(vSqlTemp) <> '' then
        vSqlTemp := vSqlTemp + ' and ';
      if vMensMob.vMensagem then
        vSqlTemp := vSqlTemp + ' mensagem_mob.cod_tarefa is null';
      if vMensMob.vTarefa then
        vSqlTemp := vSqlTemp + ' mensagem_mob.cod_tarefa > 0';
    end;

    if trim(vOrigem) <> '' then
    begin
      if trim(vSqlTemp) <> '' then
        vSqlTemp := vSqlTemp + ' and ';
      vSqlTemp := vSqlTemp + ' mensagem_mob.origem in (' + vOrigem + ')';
    end;

    if trim(vDestino) <> '' then
    begin
      if trim(vSqlTemp) <> '' then
        vSqlTemp := vSqlTemp + ' and ';
      vSqlTemp := vSqlTemp + ' mensagem_mob.destino in (' + vDestino + ')';
    end;
  end;

  if vMensMob.vAdicional then
  begin
  	 if vMensMob.vPorDataAd then
    begin
      try
        erro := 0;
        StrToDate(vMensMob.vData1Ad);
        erro := erro + 1;
      except
        vMensMob.vData1Ad := '';
      end;
      try
        StrToDate(vMensMob.vData2Ad);
      except
        vMensMob.vData2Ad := '';
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
        if vMensMob.vData1Ad <> '' then
          vMensMob.vData1Ad := QuotedStr(FormatDateTime(formatodata, strtodate(vMensMob.vData1Ad)));
        if vMensMob.vData2Ad <> '' then
          vMensMob.vData2Ad := QuotedStr(FormatDateTime(formatodata, strtodate(vMensMob.vData2Ad)));
      end;
    end
    else
    begin
      vMensMob.vData1Ad := '';
      vMensMob.vData2Ad := '';
    end;
    if vMensMob.vCondicaoAd = 'Igual' then
      vMensMob.vCondicaoAd := '='
    else if vMensMob.vCondicaoAd = 'Maior' then
      vMensMob.vCondicaoAd := '>'
    else if vMensMob.vCondicaoAd = 'Menor' then
      vMensMob.vCondicaoAd := '<'
    else if vMensMob.vCondicaoAd = 'Diferente' then
      vMensMob.vCondicaoAd := '<>'
    else if (vMensMob.vCondicaoAd = 'Esta contido') then
      vMensMob.vCondicaoAd := 'like'
    else if (vMensMob.vCondicaoAd = 'Começa') then
      vMensMob.vCondicaoAd := 'Começa'
    else
      vMensMob.vCondicaoAd := '=';

    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vMensMob.vCampoAd) then
        begin
        	if trim(vMensMob.vCampoAd) = 'Usuario Envio' then
            vMensMob.vCampoAd := 'f.nome_vendedor '
          else if trim(vMensMob.vCampoAd) = 'Usuario Receptor' then
            vMensMob.vCampoAd := 'c.nome_vendedor '
          else if trim(vMensMob.vCampoAd) = 'Mobile' then
          	vMensMob.vCampoAd := 'm.descricao_mob '
          else if trim(vMensMob.vCampoAd) = 'Aplicativo' then
          	vMensMob.vCampoAd := 'a.aplicativo '
          else if trim(vMensMob.vCampoAd) = 'Plataforma' then
          	vMensMob.vCampoAd := 'p.plataforma '
          else if trim(vMensMob.vCampoAd) = 'Sla Segundos Tarefa' then
            vMensMob.vCampoAd := 'tp.sla_seg_tarefa '
          else if trim(vMensMob.vCampoAd) = 'Prof Resp' then
            vMensMob.vCampoAd := 'r.nome_vendedor '
          else if trim(vMensMob.vCampoAd) = 'Aplicativo Resp' then
            vMensMob.vCampoAd := 'ar.aplicativo '
          else if trim(vMensMob.vCampoAd) = 'Plataforma Resp' then
            vMensMob.vCampoAd := 'pr.plataforma '
          else
          	vMensMob.vCampoAd := 'mensagem_mob.' + trim(DataSet.Fields[I].FieldName);

          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
            ((vMensMob.vCondicaoAd = 'Começa') or (vMensMob.vCondicaoAd = 'Começa')) then
          begin
            vMensMob.vCondicaoAd := '=';
            if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
            begin
              try
                if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
                  vMensMob.vValorAd := IntToStr(StrToInt(Trim(vMensMob.vValorAd)))
                else if (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
                  vMensMob.vValorAd := FloatToStr(StrToFloat(Trim(vMensMob.vValorAd)))
              except
                vMensMob.vValorAd := '0';
                Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
              end;
            end
            else
              vMensMob.vValorAd := vDadosIni.tirapontos(vMensMob.vValorAd, 4);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
          	if trim(vSqlTemp) <> '' then
          		vSqlTemp := vSqlTemp + ' and ';

            if (vMensMob.vData1Ad <> '') and (vMensMob.vData2 <> '') then
              vSqlTemp := vSqlTemp + vMensMob.vCampoAd + ' >= ' + vMensMob.vData1Ad + ' and ' + vMensMob.vCampoAd + ' <= ' + vMensMob.vData2Ad
            else if (vMensMob.vData2Ad <> '') then
              vSqlTemp := vSqlTemp + vMensMob.vCampoAd + ' <= ' + vMensMob.vData1Ad
            else if (vMensMob.vData1Ad <> '') and (vMensMob.vData2Ad <> '') then
              vSqlTemp := vSqlTemp + vMensMob.vCampoAd + ' >= ' + vMensMob.vData1Ad;
            Break;
          end;

          if trim(vSqlTemp) <> '' then
          	vSqlTemp := vSqlTemp + ' and ';

          if vMensMob.vCondicaoAd = 'like' then
          	vSqlTemp := vSqlTemp + vMensMob.vCampoAd + ' like ' + QuotedStr('%' + UpperCase(trim(vMensMob.vValorAd)) + '%')
          else if vMensMob.vCondicaoAd = 'Começa' then
          	vSqlTemp := vSqlTemp + vMensMob.vCampoAd + ' like ' + QuotedStr(UpperCase(trim(vMensMob.vValorAd)) + '%')
          else
          	vSqlTemp := vSqlTemp + vMensMob.vCampoAd + ' ' + vMensMob.vCondicaoAd + ' ' + QuotedStr(UpperCase(trim(vMensMob.vValorAd)));
          Break;
        end;
      end;
    end;
  end;

  if vMensMob.vValor <> '*D*A*T*A*' then
  begin
    Result := ConsultaCampos('MENSAGEM_MOB', vMensMob.vValor, vMensMob.vCampo, vMensMob.vCondicao, vSeqm, True,
      vDadosIni.codEmpresa,
      ' mensagem_mob.*, ' +
      ' m.descricao_mob, ' +
      ' c.nome_vendedor as usuario_leu, ' +
      ' f.nome_vendedor as usuario_envio, ' +
      ' a.aplicativo, ' +
      ' p.plataforma, ' +
      ' tp.sla_seg_tarefa, ' +
      ' r.nome_vendedor as prof_resp, ' +
      ' ar.aplicativo as aplicativo_resp, ' +
      ' pr.plataforma as plataforma_resp ',
      ' left join mobile m on m.idmobile = mensagem_mob.idmobile and m.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join colaborador c on c.cod_vendedor = mensagem_mob.cod_us_leu and c.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join colaborador f on f.cod_vendedor = mensagem_mob.us_envio and f.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join colaborador r on r.cod_vendedor = mensagem_mob.cod_prof_resp and r.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join msg_aplicativo a on a.id = mensagem_mob.id_msg_aplicativo ' +
      ' left join msg_plataforma p on p.id = mensagem_mob.id_msg_plataforma and p.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join msg_aplicativo ar on ar.id = mensagem_mob.id_msg_aplicativo_resp ' +
      ' left join msg_plataforma pr on pr.id = mensagem_mob.id_msg_plataforma_resp and pr.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join msg_tipo_tarefa tp on tp.id = mensagem_mob.id_msg_tipo_tarefa ',
      vSqlTemp);
  end
  else
    Result := ConsultaCampos('MENSAGEM_MOB', vMensMob.vCampo, vSeqm, vMensMob.vData1, vMensMob.vData2, vDadosIni.codEmpresa, 1,
      ' mensagem_mob.*, ' +
      ' m.descricao_mob, ' +
      ' c.nome_vendedor as usuario_leu, ' +
      ' f.nome_vendedor as usuario_envio, ' +
      ' a.aplicativo, ' +
      ' p.plataforma, ' +
      ' tp.sla_seg_tarefa, ' +
      ' r.nome_vendedor as prof_resp, ' +
      ' ar.aplicativo as aplicativo_resp, ' +
      ' pr.plataforma as plataforma_resp ',
      ' left join mobile m on m.idmobile = mensagem_mob.idmobile and m.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join colaborador c on c.cod_vendedor = mensagem_mob.cod_us_leu and c.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join colaborador f on f.cod_vendedor = mensagem_mob.us_envio and f.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join colaborador r on r.cod_vendedor = mensagem_mob.cod_prof_resp and r.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join msg_aplicativo a on a.id = mensagem_mob.id_msg_aplicativo ' +
      ' left join msg_plataforma p on p.id = mensagem_mob.id_msg_plataforma and p.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join msg_aplicativo ar on ar.id = mensagem_mob.id_msg_aplicativo_resp ' +
      ' left join msg_plataforma pr on pr.id = mensagem_mob.id_msg_plataforma_resp and pr.cod_empresa = mensagem_mob.cod_empresa ' +
      ' left join msg_tipo_tarefa tp on tp.id = mensagem_mob.id_msg_tipo_tarefa ',
      vSqlTemp);
end;

function TMensMobile._restauralixeira: boolean;
var
	codMensagemMob: string;
  mensagemMob: string;
  vtemp: string;
begin
  if dataSet.IsEmpty then
    Exit;

  try
  	codMensagemMob := dataSet.FieldByName('IDSEQM').AsString;
    mensagemMob    := trim(dataSet.FieldByName('HTML').AsString);

    prepare_loop('SEL = ''S''');
    if not dataset.IsEmpty then
    begin
    	codMensagemMob := '';
    	mensagemMob    := '';
    end;
  finally
    prepare_loop_done;
  end;

  try
    if (trim(codMensagemMob) <> '') then
      prepare_loop('IDSEQM = ' + codMensagemMob)
    else
      prepare_loop('SEL = ''S''');


    vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
      'MENSAGEM' + #13 +
      'Texto: ' + mensagemMob;

    if (trim(codMensagemMob) = '') then
        vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

    if not vDadosIni.PesqPros('MOB017', 'RESTAURAR', '', 'MENSAGEM',
      vDadosIni.IfThen(trim(codMensagemMob) <> '', codMensagemMob, ''), buscas, false) then
        exit;

    if Application.MessageBox(PChar(vtemp),
      'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      exit;

    vDadosIni.abreStatusProcessamento('', 'Restaurando mensagem(ns)');

    dataset.First;
    while not dataset.Eof do
    begin
      vDadosIni.abreStatusProcessamento('', 'Restaurando mensagem(ns) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

      SqlExec(' update mensagem_mob set ativo = 1 ' +
        ' where idseqm = %d and cod_empresa = %d ',
        [fint('idseqm'), fint('cod_empresa')], buscas);

      if (trim(codMensagemMob) = '') then
        vDadosIni.GravaAuditoria('MOB017', 'RESTAURAR', '', 'MENSAGEM_MOB',
          dataSet.FieldByName('IDSEQM').AsString, buscas);

      dataset.Next;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    prepare_loop_done;
  end;

  result := CommitaTransacao;
  if Result then
  begin
    vDadosIni.GravaAuditoria('MOB017', 'RESTAURAR', 'SUCESSO', 'MENSAGEM_MOB',
      vDadosIni.IfThen(trim(codMensagemMob) <> '', codMensagemMob, ''), buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('MOB017', 'RESTAURAR', 'FALHA', 'MENSAGEM_MOB',
      vDadosIni.IfThen(trim(codMensagemMob) <> '', codMensagemMob, ''), buscas);
  end;

  if Result then
    Refresh;
end;

{ TUsuario }

constructor TUsuario.create;
begin
  dataSet := TClientDataSet(dtmMobile.cdsUsuarioMensMobile);
  transacao := TIBTransaction(dtmMobile.transacao);
  buscas := TIBQuery(dtmMobile.qrBuscas);
end;

function TUsuario._abreTodosUsuarios: Boolean;
begin
  Result := montaSelect('select cod_vendedor, nome_vendedor from colaborador ' +
    ' where cod_vendedor > 0 and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by nome_vendedor ');
end;

{ TSenhas }

constructor TSenhas.create;
begin
  dataSet := TClientDataSet(dtmMobile.cdsSenhasCons);
  transacao := TIBTransaction(dtmMobile.transacao);
  buscas := TIBQuery(dtmMobile.qrBuscas);
end;

function TSenhas._abreTodosSenhas: Boolean;
begin
  Result := montaSelect('select distinct sen.codigo, sen.usuario from senhas sen ' +
   ' inner join senhas_erp er on er.usuario = sen.usuario and er.cod_empresa = sen.cod_empresa ' +
   ' inner join erp a on a.cod_aplicativo = er.cod_aplicativo ' +
   ' where sen.cod_empresa = 1 and sen.ativo = 1 and sen.codigo > 0 ' +
   ' and ((a.nome_aplicativo = ''AUTOMACAO'') or (a.nome_aplicativo = ''CAIXA GERAL'') ' +
   ' or (a.nome_aplicativo = ''VEICULOS'') or (a.nome_aplicativo = ''CRM'') ' +
   ' or (a.nome_aplicativo = ''GESTOR'')  or (a.nome_aplicativo = ''SUPERVISOR'')) ' +
   ' order by sen.usuario ');
end;

procedure TSenhas._desmarcarTodos;
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

procedure TSenhas._marcaDesmarcaLinha;
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

procedure TSenhas._marcarTodos;
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

procedure TSenhas._marcarUsuario(cod_usuario_env: Integer);
begin
   try
    buscas.Close;
    buscas.SQL.Text := ' SELECT CODIGO, USUARIO FROM SENHAS ' +
     ' WHERE CODIGO = :CODIGO AND ATIVO = 1 AND COD_EMPRESA = :COD_EMPRESA';
    buscas.ParamByName('CODIGO').AsInteger := cod_usuario_env;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if not buscas.IsEmpty then
    begin
      dataSet.Locate('USUARIO', trim(buscas.FieldByName('USUARIO').AsString), []);

      dataSet.First;
      while not dataSet.Eof do
      begin
        if (trim(dataSet.FieldByName('USUARIO').AsString) = trim(buscas.FieldByName('USUARIO').AsString)) then
        begin
          dataSet.Edit;
          dataSet.FieldByName('sel').AsString := 'S';
          dataSet.Post;
          break;
        end;
        dataSet.Next;
      end;
      dataSet.First;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TDocEletronicoMensMobile }

function TDocEletronicoMensMobile.abreDocEletronicoMensMobile(
  codmens: Integer;
  tipo: string): boolean;
begin
	Result := montaSelect(
  	' select doc_eletronico.seqid, doc_eletronico.doc, doc_eletronico.data from doc_eletronico ' +
    ' where doc_eletronico.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and doc_eletronico.id_doc = ' + QuotedStr(tipo + IntToStr(codmens)) +
    ' order by doc_eletronico.seqid desc ');
end;

constructor TDocEletronicoMensMobile.create;
begin
  dataSet := TClientDataSet(dtmMobile.cdsDocEletronicoMensMobile);
  transacao := TIBTransaction(dtmMobile.transacao);
  buscas := TIBQuery(dtmMobile.qrBuscas);
end;

end.

