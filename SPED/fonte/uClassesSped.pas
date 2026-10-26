unit uClassesSped;

interface

uses
  uDataSet_OOP, DB, DBClient, StdCtrls, IBQuery, cst_icms_inf_cpl_class,
  efd_ajustes_conf_class, efd_ajustes_conf_tipo_class, efd_ajustes_conf_cond_class,
  Classes, Variants;

type
  TInformacaoComplementarSPED = class;
  TAcaoJudicialSPED = class;
  TLancamentosFiscais = class;

  TRefCstICMS = class(TCst_icms_inf_cpl_classList)
  private
    FOwner: TInformacaoComplementarSPED;
    FlistOrig: TCst_icms_inf_cpl_classList;
    FconsCST: TDataSet_OOP;
  public
    constructor Create(AOwner: TInformacaoComplementarSPED);
    destructor Destroy; override;

    procedure Iniciar;
    function Salvar: Boolean;
    function Remover(Acst: string): Boolean;
    function Adicionar(Acst: string): Boolean;

    property consCST: TDataSet_OOP read FconsCST write FconsCST;
  end;

  TInformacaoComplementarSPED = class(TDataSet_OOP)
  private
    FrefCST: TRefCstICMS;
    procedure GetTextInfo(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor create;
    destructor Destroy; override;

    procedure cadInformacaoCompl(TipoForm: integer);

    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _statuslixeira: boolean;

    property refCST: TRefCstICMS read FrefCST write FrefCST;
  end;

  TAcaoJudicialSPED = class(TDataSet_OOP)
  public
    constructor create;

    procedure cadAcaoJudicialSPED(TipoForm: integer);

    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;
  end;

  TProcessoAdministrativoSPED = class(TDataSet_OOP)
  public
    constructor create;

    procedure cadProcessoAdmSPED(TipoForm: integer);

    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;
  end;

  TLancamentosFiscais = class(TDataSet_OOP)
  public
    constructor create;

    procedure cadLancamentosFiscais(TipoForm: integer);

    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;
  end;

  TEfdAjusteConf = class(TEfd_ajustes_conf_class)
  private
    Fajuste1921: TEfd_ajustes_conf_tipo_class;
    Fcondicoes: TEfd_ajustes_conf_conds_class;
    FajusteC197: TEfd_ajustes_conf_tipo_class;
  public
    constructor Create();
    destructor Destroy; override;
//    procedure AddCondicao(tipo: TTipoCondicaoAjuste; valor, display: string);

    class function build(id: string; con: TDataSet_OOP): TEfdAjusteConf;

    property ajusteC197 : TEfd_ajustes_conf_tipo_class read FajusteC197 write FajusteC197;
    property ajuste1921 : TEfd_ajustes_conf_tipo_class read Fajuste1921 write Fajuste1921;
    property condicoes: TEfd_ajustes_conf_conds_class  read Fcondicoes write Fcondicoes;
  end;

  TTipoCondicaoAjuste = (tcaCFOP, tcaNCM, tcaUF, tcaConsumoFinal, tcaContribuite, tcaPessoa, tcaFinalidade, tcaOperacaoFiscal, tcaOrigemMerc, tcaCstIcms, tcaAliqICMS, tcaFinaliEmissao);

  TCondicoesAjuste = class(TDataSet_OOP)
  private
    incremento: Integer;
    seqConf: Integer;
    function TipoCondicaoToStr(tipo: TTipoCondicaoAjuste): string;
    procedure SelfDataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();

    function SortAndIgnoreDup(sText: string; separator: string = ','): string;

    procedure IniciarCondicoes(configurcao: TEfdAjusteConf);

    procedure AddCondicao(tipo: TTipoCondicaoAjuste; valor, display: string; aliqIcms: Double = -1; changes: Smallint = 1);
    procedure RemoveCondicao();

    function BuildCondicoes(): TEfd_ajustes_conf_conds_class;
  end;

  TEfdConfAjuestesAuto = class(TDataSet_OOP)
  private
    Fobjeto: TEfdAjusteConf;
    FajusteC197: TEfd_ajustes_conf_tipo_class;
    Fajuste1921: TEfd_ajustes_conf_tipo_class;
    Fcondicoes: TCondicoesAjuste;
//    Fprodutos: TDataSet_OOP;
  public
    constructor Create();
    destructor Destroy; override;

    function Edit: Boolean; override;
    function Insert: Boolean;
    function Post: Boolean;
    function Delete: Boolean;
    function Restaurar: Boolean;

//    procedure HandleProdutos;

    property objeto: TEfdAjusteConf read Fobjeto write Fobjeto;
    property condicoes: TCondicoesAjuste read Fcondicoes write Fcondicoes;
//    property produtos: TDataSet_OOP read Fprodutos write Fprodutos;
  end;

var
  infCompl: TInformacaoComplementarSPED;
  acaoJudic: TAcaoJudicialSPED;
  procAdm: TProcessoAdministrativoSPED;
  lancFis: TLancamentosFiscais;
  ajustesConf: TEfdConfAjuestesAuto;

implementation

uses uDtmSPED, uDtmAtivo, IBDatabase, Forms, Windows, SysUtils,      
  FieldsConfigUnit,
  uCadInformacaoCompl, uCadSpedAcaoJudicial, uCadSpedProcessoAdm, uCadSpedLancamentosFiscais,
  uDadosIni, StrUtils, hw_utils, Query_OOP, Contnrs;

{ TInformacaoComplementarSPED }

function TInformacaoComplementarSPED._abrelixeira: boolean;
begin
  if not _statuslixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select * FROM SPED_INFORMACAO_COMPLEMENTAR' +
      ' WHERE cod_empresa  = ' + vDadosIni.codEmpresa +
      ' and ativo = 0');
end;

procedure TInformacaoComplementarSPED.cadInformacaoCompl(TipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Informação Complementar');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := TipoForm;

    if not vDadosIni.PesqPros('SPED001', 'CONSULTA', '', 'SPED_INFORMACAO_COMPLEMENTAR', '',
      dtmSPED.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadInformacaoCompl = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadInformacaoCompl, frmCadInformacaoCompl);
    end;

    if (TipoForm > 0) and (not frmCadInformacaoCompl.Visible) then
      frmCadInformacaoCompl.ShowModal
    else if (not frmCadInformacaoCompl.Visible) then
      frmCadInformacaoCompl.Show
    else if frmCadInformacaoCompl.FormStyle = fsMDIChild then
      frmCadInformacaoCompl.Show
    else
      frmCadInformacaoCompl.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TInformacaoComplementarSPED.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsInfCompl);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);

  dataSet.FieldByName('ativo_em_nfe').OnGetText := GetTextInfo;
  dataSet.FieldByName('ativo_em_nfce').OnGetText := GetTextInfo;

  FrefCST := TRefCstICMS.Create(Self);
end;

function TInformacaoComplementarSPED.delete: Boolean;
var
  codInf: string;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED005', 'EXCLUIR', 'COD INF ' + dataSet.FieldByName('COD_INF').AsString, 'SPED_INFORMACAO_COMPLEMENTAR', '',
    buscas, True) then
    exit;

  codInf := dataSet.FieldByName('cod_inf').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      result := inherited Delete;
      if Apply then
        if CommitaTransacao then
          if Result then
            vDadosIni.GravaAuditoria('SPED005', 'EXCLUIR', 'SUCESSO', 'SPED_INFORMACAO_COMPLEMENTAR', codInf, buscas)
          else
            vDadosIni.GravaAuditoria('SPED005', 'EXCLUIR', 'FALHA', 'SPED_INFORMACAO_COMPLEMENTAR', codInf, buscas);
      result := true;
    end;
  end
  else
    if Application.MessageBox('Tem certeza que deseja mover este arquivo para a Lixeira ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      if (Edit) or (dataSet.State = dsEdit) then
      begin
        dataSet.FieldByName('Ativo').asString := '0';
        result := inherited Post;
        if Apply then
          if CommitaTransacao then
            if Result then
              vDadosIni.GravaAuditoria('SPED005', 'ENVIAR REGISTRO PARA A LIXEIRA',
                'SUCESSO', 'SPED_INFORMACAO_COMPLEMENTAR', codInf, buscas)
            else
              vDadosIni.GravaAuditoria('SPED005', 'ENVIAR REGISTRO PARA A LIXEIRA ',
                'FALHA', 'SPED_INFORMACAO_COMPLEMENTAR', codInf, buscas);
        Result := true;
      end;
    end;
  Refresh;
end;

destructor TInformacaoComplementarSPED.Destroy;
begin
  if Assigned(FrefCST) then FreeAndNil(FrefCST);  
  inherited;
end;

function TInformacaoComplementarSPED.edit: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED004', 'ALTERAR',
    'COD INF ' + dataSet.FieldByName('COD_INF').AsString, 'SPED_INFORMACAO_COMPLEMENTAR', '',
    buscas, True) then
    exit;

  if (not dataSet.Active) or (dataSet.IsEmpty) then
    Exit;

  if inherited Edit then
  begin
    if fempty('ativo_em_nfe') then
      dataSet.FieldByName('ativo_em_nfe').AsString := 'S';
    if fempty('ativo_em_nfce') then
      dataSet.FieldByName('ativo_em_nfce').AsString := 'N';

    Result := True;
    FrefCST.Iniciar;
  end;
end;

procedure TInformacaoComplementarSPED.GetTextInfo(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Sender.AsString;
  if Sender.FieldName = 'ATIVO_EM_NFE' then
    Text := IfThen((Text = '') or (Text = 'S'), 'Sim', 'Não')
  else if Sender.FieldName = 'ATIVO_EM_NFCE' then
    Text := IfThen((Text = '') or (Text = 'N'), 'Não', 'Sim');
end;

function TInformacaoComplementarSPED.insert: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED003', 'INCLUIR', '', 'SPED_INFORMACAO_COMPLEMENTAR', '',
    buscas, True) then
    exit;

  if not dataSet.Active then
  begin
    montaSelect('select * from SPED_INFORMACAO_COMPLEMENTAR' +
      ' where cod_inf = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
  end;

  if inherited insert then
  begin
    dataSet.FieldByName('ativo_em_nfe').AsString := 'S';
    dataSet.FieldByName('ativo_em_nfce').AsString := 'N';
    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    Result := True;

    FrefCST.Iniciar;
  end;

end;

function TInformacaoComplementarSPED.post: Boolean;
var
  acao: string;
begin
  try

    Result := false;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('SPED006', acao, 'COD INF ' + dataSet.FieldByName('COD_INF').AsString,
      'SPED_INFORMACAO_COMPLEMENTAR', '', buscas, True) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if Trim(dataSet.FieldByName('txt').AsString) = '' then
      raiseExceptionCreate('Texto padrão deve ser preenchido', 'DBMemo1' );

    if dataSet.State = dsInsert then
      if dataSet.FieldByName('COD_INF').AsInteger = 0  then      
        dataSet.FieldByName('COD_INF').AsInteger :=
          Gencodigo('SPED_INFORMACAO_COMPLEMENTAR', dtmSPED.SpIncCodigo, vDadosIni.codEmpresa);

    dataSet.Post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := FrefCST.Salvar;

      if Result then
        CommitaTransacao;

      exit;
    end;

    if Apply then
      FrefCST.Salvar;

    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED006', acao, 'COD INF ' + dataSet.FieldByName('COD_INF').AsString+
      ' SALVO COM SUCESSO', 'SPED_INFORMACAO_COMPLEMENTAR', '', buscas);

    Result := true;

    Refresh;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao salvar Informação Complementar. Erro: ' + e.Message), 'Atenção', 0
        + 64);
      registraErro('function TInformacaoComplementarSPED.post Erro: ' + e.Message);
    end;
  end;
end;

function TInformacaoComplementarSPED._restauralixeira: boolean;
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
            vDadosIni.GravaAuditoria('SPED007', 'RESTAURAR REGISTRO', 'SUCESSO',
              'SPED_INFORMACAO_COMPLEMENTAR', dataSet.FieldByName('COD_INF').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('SPED007', 'RESTAURAR REGISTRO', 'FALHA',
              'SPED_INFORMACAO_COMPLEMENTAR', dataSet.FieldByName('COD_INF').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação',  0 + 64);
  Refresh;
end;

function TInformacaoComplementarSPED._statuslixeira: boolean;
begin
  Result := ExecutaComandosSql('Select first 1 cod_inf from SPED_INFORMACAO_COMPLEMENTAR' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

{ TAcaoJudicialSPED }

procedure TAcaoJudicialSPED.cadAcaoJudicialSPED(TipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Ação Judicial');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := TipoForm;

    if not vDadosIni.PesqPros('SPED010', 'CONSULTA', '', 'SPED_PROC_REF_ACAO_JUDICIAL', '',
      dtmSPED.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadSpedAcaoJudicial = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadSpedAcaoJudicial, frmCadSpedAcaoJudicial);
    end;

    if (TipoForm > 0) and (not frmCadSpedAcaoJudicial.Visible) then
      frmCadSpedAcaoJudicial.ShowModal
    else if (not frmCadSpedAcaoJudicial.Visible) then
      frmCadSpedAcaoJudicial.Show
    else if frmCadSpedAcaoJudicial.FormStyle = fsMDIChild then
      frmCadSpedAcaoJudicial.Show
    else
      frmCadSpedAcaoJudicial.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TAcaoJudicialSPED.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsAcaoJud);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);
end;

function TAcaoJudicialSPED.delete: Boolean;
var
  numProc: string;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED014', 'EXCLUIR', 'NUM PROC ' + dataSet.FieldByName('NUM_PROC').AsString, 'SPED_PROC_REF_ACAO_JUDICIAL',
    dataSet.FieldByName('cod_acao_judicial').AsString,
    buscas, True) then
    exit;

  numProc := dataSet.FieldByName('num_proc').AsString;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    result := inherited Delete;
    if Apply then
      if CommitaTransacao then
        if Result then
          vDadosIni.GravaAuditoria('SPED014', 'EXCLUIR', 'SUCESSO', 'SPED_PROC_REF_ACAO_JUDICIAL', numProc, buscas)
        else
          vDadosIni.GravaAuditoria('SPED014', 'EXCLUIR', 'FALHA', 'SPED_PROC_REF_ACAO_JUDICIAL', numProc, buscas);
    result := True;
  end;

  Refresh;

end;

function TAcaoJudicialSPED.edit: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED013', 'ALTERAR',
    'NUM PROC ' + dataSet.FieldByName('NUM_PROC').AsString, 'SPED_INFORMACAO_COMPLEMENTAR',
    dataSet.FieldByName('cod_acao_judicial').AsString, buscas, True) then
    Exit;

  if (not dataSet.Active) or (dataSet.IsEmpty) then
    Exit;

  if inherited Edit then
    Result := True;

end;

function TAcaoJudicialSPED.insert: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED012', 'INCLUIR', '', 'SPED_PROC_REF_ACAO_JUDICIAL', '',
    buscas, True) then
    exit;

  if not dataSet.Active then
  begin
    montaSelect('select * from SPED_PROC_REF_ACAO_JUDICIAL' +
      ' where cod_acao_judicial = 0');
  end;

  Result := inherited insert;
  
end;

function TAcaoJudicialSPED.post: Boolean;
var
  acao: string;
begin
  try

    Result := false;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('SPED015', acao, 'NUM PROC ' + dataSet.FieldByName('NUM_PROC').AsString,
      'SPED_PROC_REF_ACAO_JUDICIAL', '', buscas, True) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if Trim(dataSet.FieldByName('num_proc').AsString) = '' then
      raiseExceptionCreate('Número do Processo Judicial deve ser preenchido', 'DBEdit2' );

    if Trim(dataSet.FieldByName('id_sec_jud').AsString) = '' then
      raiseExceptionCreate('Identificação da Seção Judicial deve ser preenchida', 'DBEdit3' );

    if Trim(dataSet.FieldByName('id_vara').AsString) = '' then
      raiseExceptionCreate('Identificação da Vara deve ser preenchida', 'DBEdit4' );

    if Trim(dataSet.FieldByName('ind_nat_acao').AsString) = '' then
      raiseExceptionCreate('Indicador da Natureza da Ação Judicial deve ser preenchido', 'DBComboBox1' );

    if dataSet.State = dsInsert then
        dataSet.FieldByName('cod_acao_judicial').AsInteger :=
          Gencodigo('SPED_PROC_REF_ACAO_JUDICIAL', dtmSPED.SpIncCodigo, '1'); // Não é necessário colocar o codigo da empresa pois a
                                                                              //  tabela nao precisa ser por empresa apresenta

    dataSet.Post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED015', acao, 'NUM PROC ' + dataSet.FieldByName('NUM_PROC').AsString+
      ' SALVO COM SUCESSO', 'SPED_PROC_REF_ACAO_JUDICIAL', '', buscas);

    Result := true;

    Refresh;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao salvar Ação Judicial. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TAcaoJudicialSPED.post Erro: ' + e.Message);
    end;
  end;
end;

{ TProcessoAdministrativoSPED }

procedure TProcessoAdministrativoSPED.cadProcessoAdmSPED(TipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Ação Judicial');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := TipoForm;

    if not vDadosIni.PesqPros('SPED016', 'CONSULTA', '', 'SPED_PROC_REF_ADMINISTRATIVO', '',
      dtmSPED.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadSpedProcessoAdm = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadSpedProcessoAdm, frmCadSpedProcessoAdm);
    end;

    if (TipoForm > 0) and (not frmCadSpedProcessoAdm.Visible) then
      frmCadSpedProcessoAdm.ShowModal
    else if (not frmCadSpedProcessoAdm.Visible) then
      frmCadSpedProcessoAdm.Show
    else if frmCadSpedProcessoAdm.FormStyle = fsMDIChild then
      frmCadSpedProcessoAdm.Show
    else
      frmCadSpedProcessoAdm.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TProcessoAdministrativoSPED.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsProcAdm);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);
end;

function TProcessoAdministrativoSPED.delete: Boolean;
var
  numProc: string;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED020', 'EXCLUIR', 'NUM PROC ' + dataSet.FieldByName('NUM_PROC').AsString, 'SPED_PROC_REF_ADMINISTRATIVO',
    dataSet.FieldByName('cod_adm').AsString,
    buscas, True) then
    exit;

  numProc := dataSet.FieldByName('num_proc').AsString;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    result := inherited Delete;
    if Apply then
      if CommitaTransacao then
        if Result then
          vDadosIni.GravaAuditoria('SPED020', 'EXCLUIR', 'SUCESSO', 'SPED_PROC_REF_ADMINISTRATIVO', numProc, buscas)
        else
          vDadosIni.GravaAuditoria('SPED020', 'EXCLUIR', 'FALHA', 'SPED_PROC_REF_ADMINISTRATIVO', numProc, buscas);
    result := True;
  end;

  Refresh;


end;

function TProcessoAdministrativoSPED.edit: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED019', 'ALTERAR',
    'NUM PROC ' + dataSet.FieldByName('NUM_PROC').AsString, 'SPED_PROC_REF_ADMINISTRATIVO',
    dataSet.FieldByName('cod_adm').AsString, buscas, True) then
    Exit;

  if (not dataSet.Active) or (dataSet.IsEmpty) then
    Exit;

  if inherited Edit then
    Result := True;

end;

function TProcessoAdministrativoSPED.insert: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED018', 'INCLUIR', '', 'SPED_PROC_REF_ADMINISTRATIVO', '',
    buscas, True) then
    exit;

  if not dataSet.Active then
  begin
    montaSelect('select * from SPED_PROC_REF_ADMINISTRATIVO' +
      ' where cod_adm = 0');
  end;

  Result := inherited insert;

end;

function TProcessoAdministrativoSPED.post: Boolean;
var
  acao: string;
begin
  try

    Result := false;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('SPED021', acao, 'NUM PROC ' + dataSet.FieldByName('NUM_PROC').AsString,
      'SPED_PROC_REF_ADMINISTRATIVO', '', buscas, True) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if Trim(dataSet.FieldByName('num_proc').AsString) = '' then
      raiseExceptionCreate('Número do Processo Administrativo deve ser preenchido', 'DBEdit2' );

    if Trim(dataSet.FieldByName('ind_nat_acao').AsString) = '' then
      raiseExceptionCreate('Indicador da Natureza do Processo Administrativo deve ser preenchido', 'DBComboBox1' );

    if Trim(dataSet.FieldByName('DT_DEC_ADM').AsString) = '' then
      raiseExceptionCreate('Data do Despacho/Decisão Administrativa deve ser preenchida', 'DBEdit3' );

    if dataSet.State = dsInsert then
        dataSet.FieldByName('cod_adm').AsInteger :=
          Gencodigo('SPED_PROC_REF_ADMINISTRATIVO', dtmSPED.SpIncCodigo, '1'); // Não é necessário colocar o codigo da empresa pois a
                                                                              //  tabela nao precisa ser por empresa apresenta

    dataSet.Post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED021', acao, 'NUM PROC ' + dataSet.FieldByName('NUM_PROC').AsString+
      ' SALVO COM SUCESSO', 'SPED_PROC_REF_ADMINISTRATIVO', '', buscas);

    Result := true;

    Refresh;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao salvar Processo Administrativo. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TProcessoAdministrativoSPED.post Erro: ' + e.Message);
    end;
  end;

end;

{ TLancamentosFiscais }

procedure TLancamentosFiscais.cadLancamentosFiscais(TipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Lançamentos Fiscais');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := TipoForm;

    if not vDadosIni.PesqPros('SPED086', 'CONSULTA', '', 'SPED_LANCAMENTO_FISCAL', '',
      dtmSPED.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadSpedLancamentosFiscais = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadSpedLancamentosFiscais, frmCadSpedLancamentosFiscais);
    end;

    if (TipoForm > 0) and (not frmCadSpedLancamentosFiscais.Visible) then
      frmCadSpedLancamentosFiscais.ShowModal
    else if (not frmCadSpedLancamentosFiscais.Visible) then
      frmCadSpedLancamentosFiscais.Show
    else if frmCadSpedLancamentosFiscais.FormStyle = fsMDIChild then
      frmCadSpedLancamentosFiscais.Show
    else
      frmCadSpedLancamentosFiscais.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TLancamentosFiscais.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsLancF);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);
end;

function TLancamentosFiscais.delete: Boolean;
var
  codObs: string;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED089', 'EXCLUIR', 'COD OBS ' + dataSet.FieldByName('COD_OBS').AsString, 'SPED_LANCAMENTO_FISCAL',
    dataSet.FieldByName('COD_OBS').AsString,
    buscas, True) then
    exit;

  codObs := dataSet.FieldByName('COD_OBS').AsString;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    result := inherited Delete;
    if not Apply then
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('SPED089', 'EXCLUIR', 'FALHA', 'SPED_LANCAMENTO_FISCAL', codObs, buscas);
      Exit;
    end;

    if CommitaTransacao then
      if Result then
        vDadosIni.GravaAuditoria('SPED089', 'EXCLUIR', 'SUCESSO', 'SPED_LANCAMENTO_FISCAL', codObs, buscas)
      else
        vDadosIni.GravaAuditoria('SPED089', 'EXCLUIR', 'FALHA', 'SPED_LANCAMENTO_FISCAL', codObs, buscas);
    result := True;
  end;

  Refresh;
end;

function TLancamentosFiscais.edit: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('SPED088', 'ALTERAR',
    'COD OBS ' + dataSet.FieldByName('COD_OBS').AsString, 'SPED_LANCAMENTO_FISCAL',
    dataSet.FieldByName('cod_obs').AsString, buscas, True) then
    Exit;

  if (not dataSet.Active) or (dataSet.IsEmpty) then
    Exit;

  if inherited Edit then
    Result := True;
end;

function TLancamentosFiscais.insert: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED087', 'INCLUIR', '', 'SPED_LANCAMENTO_FISCAL', '',
    buscas, True) then
    exit;

  if not dataSet.Active then
  begin
    montaSelect('select * from SPED_LANCAMENTO_FISCAL' +
      ' where cod_obs = 0');
  end;

  Result := inherited insert;
  if Result then
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;

end;

function TLancamentosFiscais.post: Boolean;
var
  acao: string;
begin
  try

    Result := false;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('SPED090', acao, 'COD OBS' + dataSet.FieldByName('COD_OBS').AsString,
      'SPED_LANCAMENTO_FISCAL', '', buscas, True) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if Trim(dataSet.FieldByName('TXT').AsString) = '' then
      raiseExceptionCreate('Descrição da observação do lançamento fiscal deve ser preenchida', 'DBEdit2' );

    if dataSet.State = dsInsert then
        dataSet.FieldByName('COD_OBS').AsInteger :=
          Gencodigo('SPED_LANCAMENTO_FISCAL', dtmSPED.SpIncCodigo, vDadosIni.codEmpresa);

    dataSet.Post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED090', acao, 'COD OBS' + dataSet.FieldByName('COD_OBS').AsString+
      ' SALVO COM SUCESSO', 'SPED_LANCAMENTO_FISCAL', '', buscas);

    Result := true;

    Refresh;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao salvar Obs para Lançamento Fiscal. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TLancamentosFiscais.post Erro: ' + e.Message);
    end;
  end;

end;

{ TRefCstICMS }

function TRefCstICMS.Adicionar(Acst: string): Boolean;
var
  I: Integer;
  AcstCsosn: TCst_icms_inf_cpl_class;
begin
  Result := False;
  if Acst = '' then
    Exit;

  for I := 0 to Self.Count - 1 do
    if Acst = Self.Items[I].cst_csosn then
      Exit;

  with Self.New do
  begin
    cst_csosn   := Acst;
    cod_inf     := FOwner.f_int('cod_inf');
    cod_empresa := FOwner.f_int('cod_empresa');
  end;
  Result := True;

end;

constructor TRefCstICMS.Create(AOwner: TInformacaoComplementarSPED);
begin
  inherited Create;
  FOwner := AOwner;
  FlistOrig := TCst_icms_inf_cpl_classList.Create;
  FconsCST := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  with FconsCST.dataSet do
  begin
    Close;
    CommandText := Format('select ''CST'' tipo, ''00'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Tributada integralmente')]) +
                   Format(' union select  ''CST'' tipo, ''10'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Tributada e com cobrança do ICMS por substituição tributária')]) +
                   Format(' union select  ''CST'' tipo, ''20'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Com redução de base de cálculo')]) +
                   Format(' union select  ''CST'' tipo, ''30'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Isenta / não tributada e com cobrança do ICMS por substituição tributária')]) +
                   Format(' union select  ''CST'' tipo, ''40'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Isenta')]) +
                   Format(' union select  ''CST'' tipo, ''41'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Não tributada')]) +
                   Format(' union select  ''CST'' tipo, ''50'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Com suspensão')]) +
                   Format(' union select  ''CST'' tipo, ''51'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Com diferimento')]) +
                   Format(' union select  ''CST'' tipo, ''60'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('ICMS cobrado anteriormente por substituição tributária')]) +
                   Format(' union select  ''CST'' tipo, ''70'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Com redução da BC e cobrança do ICMS por substituição tributária')]) +
                   Format(' union select  ''CST'' tipo, ''90'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Outras')]) +
                   Format(' union select ''CSOSN'' tipo, ''101'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Tributada pelo Simples Nacional com permissão de crédito')]) +
                   Format(' union select ''CSOSN'' tipo, ''102'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Tributada pelo Simples Nacional sem permissão de crédito')]) +
                   Format(' union select ''CSOSN'' tipo, ''103'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Isenção do ICMS no Simples Nacional para faixa de receita bruta')]) +
                   Format(' union select ''CSOSN'' tipo, ''201'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por substituição tributária')]) +
                   Format(' union select ''CSOSN'' tipo, ''202'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por substituição tributária')]) +
                   Format(' union select ''CSOSN'' tipo, ''203'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Isenção do ICMS no Simples Nacional para faixa de receita bruta e com cobrança do ICMS por substituição tributária')]) +
                   Format(' union select ''CSOSN'' tipo, ''300'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Imune')]) +
                   Format(' union select ''CSOSN'' tipo, ''400'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Não tributada pelo Simples Nacional')]) +
                   Format(' union select ''CSOSN'' tipo, ''500'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr(' ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação')]) +
                   Format(' union select ''CSOSN'' tipo, ''900'' cst_csosn, %s as descricao from rdb$database',
                          [QuotedStr('Outros')]) +
                   Format(' order by 1 %s, 2', [IfThen(vDadosIni.vEmp.vRegime <> 'SIMPLES', 'desc')]);
  end;
end;

destructor TRefCstICMS.Destroy;
begin
  if Assigned(FlistOrig) then
  begin
    FlistOrig.Clear;
    FreeAndNil(FlistOrig);
  end;
  if Assigned(FconsCST) then
  begin
    FconsCST.dataSet.Close;
    FconsCST.FreeDbComponents(True);
    FreeAndNil(FconsCST);
  end;
  inherited;
end;

procedure TRefCstICMS.Iniciar;
begin
  Self.Clear;
  FlistOrig.Clear;
  if FOwner.dataSet.State = dsEdit then with FOwner do
  begin
    SqlOpen('select char_length(cst_csosn) ordem, %s from cst_icms_inf_cpl' +
            ' where cod_inf = %d and cod_empresa = %s order by ordem %s, cst_csosn',
            [TCst_icms_inf_cpl_class.GetFieldsSql(), f_int('cod_inf'), vDadosIni.codEmpresa,
             IfThen(vDadosIni.vEmp.vRegime = 'SIMPLES', 'desc')], buscas).First;
    Self.SetValuesFrom(buscas);
    FlistOrig.SetValuesFrom(buscas);
  end;
  FconsCST.Open;
end;

function TRefCstICMS.Remover(Acst: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Self.Count - 1 do
    if Self.Items[I].cst_csosn = Acst then
    begin
      Result := True;
      Self.Delete(I);
      Break;
    end;
end;

function TRefCstICMS.Salvar: Boolean;
var
  AlistDel, AlistInsert: TCst_icms_inf_cpl_classList;
  I, J: Integer;
  AdoSomething: Boolean;
begin
  Result := True;
  AlistDel := TCst_icms_inf_cpl_classList.Create;
  AlistInsert := TCst_icms_inf_cpl_classList .Create;
  try
    //criando lista de insert
    for I := 0 to Self.Count - 1 do
    begin
      AdoSomething := True;
      for J := 0 to FlistOrig.Count - 1 do
        if Self.Items[I].cst_csosn = FlistOrig.Items[J].cst_csosn then
        begin
          AdoSomething := False;
          Break;
        end;
      if AdoSomething then
        AlistInsert.Add(Self.Items[I].Clone);
    end;

    // criando lista de delete
    for I := 0 to FlistOrig.Count - 1 do
    begin
      AdoSomething := True;
      for J := 0 to Self.Count - 1 do
      if FlistOrig.Items[I].cst_csosn = Self.Items[J].cst_csosn then
        begin
          AdoSomething := False;
          Break;
        end;
      if AdoSomething then
        AlistDel.Add(FlistOrig.Items[I].Clone);
    end;

    for I := 0 to AlistDel.Count - 1 do with AlistDel.Items[I] do
      FOwner.SqlExec('delete from cst_icms_inf_cpl' +
                     ' where cod_inf = %d and cod_empresa = %d and cst_csosn = %s',
                     [FOwner.f_int('cod_inf'), cod_empresa, QuotedStr(cst_csosn)]);

    for I := 0 to AlistInsert.Count - 1 do with AlistInsert.Items[I] do
      FOwner.SqlExec(Format('update or insert into cst_icms_inf_cpl (cst_csosn, cod_inf, cod_empresa) values (%s, %d, %d) matching (cst_csosn, cod_inf, cod_empresa)',
                     [QuotedStr(cst_csosn), FOwner.f_int('cod_inf'), cod_empresa]));
  finally
    FreeAndNil(AlistDel);
    FreeAndNil(AlistInsert);    
  end;
end;

{ TEfdConfAjuestesAuto }

constructor TEfdConfAjuestesAuto.Create;
var
  Field: TField;
begin
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_efdconfaj');
  Fobjeto := TEfdAjusteConf.Create;
  TableName := 'EFD_AJUSTES_CONF';

  InitFieldsDef('select * from %s where id = null and cod_empresa = 1', [TableName]);
  AddFieldInternalCalc('ALIQ_C197', ftFloat);
  AddFieldInternalCalc('ALIQ_1921', ftFloat);

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('cod_empresa,ativo,id', fvInvisivel)
      .Add('seq', fvSempreVisivel)
      .Add('aliq_c197', '', '', DisplayNumber(2), fvInvisivel)
      .Add('aliq_1921', '', '', DisplayNumber(2), fvInvisivel)
  );

  Fcondicoes := TCondicoesAjuste.Create;
end;

function TEfdConfAjuestesAuto.Delete: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not Auditor.Processo('SPED114').Excluir
    .Msg('%d - %s', [fint('seq'), fstr('descricao')])
    .Permitido then
    Exit;

  try
    Fobjeto.CopyFrom(dataSet);

    Fobjeto.ativo := 0;
    SqlExec(Fobjeto.SQLMotor().SQLUpdate);

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;
    DataSet.Refresh;

    Auditor.Sucesso.GravarMensagem('');

  except on E: Exception do
    begin
      transacao.Rollback;
      ShowErro('Erro: %s', [e.Message]);
      registraErro('TEfdConfAjuestesAuto.Delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TEfdConfAjuestesAuto.Destroy;
begin
  Fcondicoes.Close;
  Fcondicoes.Free;
  Fobjeto.Free;
//  Fprodutos.Free;
  FreeDbComponents(True);
  inherited;
end;

function TEfdConfAjuestesAuto.Edit: Boolean;
begin
  Result := False;

  dataSet.RefreshRecord;

  if not Auditor.Processo('SPED112').Alterar
    .Msg('%d - %s', [fint('seq'), fstr('descricao')])
    .Permitido then
    Exit;

  Result := inherited Edit;
  if Result then
  begin
    if Assigned(Fobjeto) then FreeAndNil(Fobjeto);

    Fobjeto := TEfdAjusteConf.build(fstr('id'), Self);
    Fobjeto.beginChanges;

    dataSet.FieldByName('aliq_c197').Value := Fobjeto.ajusteC197.aliquota;
    dataSet.FieldByName('aliq_1921').Value := Fobjeto.ajuste1921.aliquota;

    Fcondicoes.IniciarCondicoes(Fobjeto);
  end;
end;

function TEfdConfAjuestesAuto.Insert: Boolean;
begin
  Result := False;

  if not Auditor.Processo('SPED111').Inserir.Permitido then
    Exit;

  if not dataSet.Active then
    montaSelect('select * from %s where id = null and cod_empresa = 1', [TableName]);

  Result := inherited Insert;
  if Result then
  begin
    if Assigned(Fobjeto) then FreeAndNil(Fobjeto);

    Fobjeto := TEfdAjusteConf.Create;
    Fcondicoes.dataSet.EmptyDataSet;
    vDadosIni.vDataHora := vDadosIni.getDataHoraBanco(buscas);

    dataSet.FieldByName('cod_empresa').AsInteger       := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('data_cadastro').AsDateTime    := vDadosIni.vDataHora;
    dataSet.FieldByName('data_modificacao').AsDateTime := vDadosIni.vDataHora;
    Fcondicoes.IniciarCondicoes(Fobjeto);
  end;
end;

function TEfdConfAjuestesAuto.Post: Boolean;
var
  Acao, Str, codAj: string;
  I: Integer;
begin
  Result := False;

  if not Auditor.Processo('SPED113').Salvar
    .Msg('%d - %s', [fint('seq'), fstr('descricao')])
    .Permitido then
    Exit;

  try
    checkFieldEmpty('descricao', 'Descrição precisa ser preenchida', '');

    for I := 1 to 2 do
      if ((I = 1) and (Fobjeto.ajusteC197.ativo = 1)) or ((I = 2) and (Fobjeto.ajuste1921.ativo = 1)) then
      begin
        codAj := IfThen(I = 1, Fobjeto.ajusteC197.cod_ajuste, Fobjeto.ajuste1921.cod_ajuste);

        if SqlScalar('select count(t.id) from EFD_AJUSTES_CONF_TIPO t' +
                     ' inner join EFD_AJUSTES_CONF e on e.id = t.conf_id and e.ativo = 1' +
                     ' where t.conf_id <> ''%s'' and t.cod_empresa = %d and t.tipo = %d and t.ativo = 1' +
                     ' and cod_ajuste = ''%s''',
                     [fstr('id'), vDadosIni.cod_empresa, I, codAj] ).AsInteger > 0 then
        begin
          ShowAtencao('Já existe um registro de %s ativo com o código de ajuste %s' + sLineBreak + sLineBreak +
                      'Este registro não pode ser salvo como ativo até que o outro registro se´ja desativado ou enviado para a lixeira',
                      [IfThen(I = 1, 'Lançamento Fiscal(C197)', 'Subapuração(1921)'), codAj]);
          Exit;
        end;
      end;

    vDadosIni.vDataHora := vDadosIni.getDataHoraBanco(buscas);
    Fobjeto.CopyFrom(dataSet, False);

    if Fobjeto.id = '' then
    begin
      Fobjeto.data_cadastro    := vDadosIni.vDataHora;
      Fobjeto.data_modificacao := vDadosIni.vDataHora;
      Fobjeto.cod_empresa      := vDadosIni.cod_empresa;
      with Fobjeto.SQLMotor('ID', 'ATIVO') do
        Fobjeto.id             := SqlInsertGuid(SQLInsert, 'id');
    end
    else if Fobjeto.FoundChanges then
    begin
      Fobjeto.data_modificacao := vDadosIni.vDataHora;
      SqlExec(Fobjeto.SQLMotor().SQLUpdate);
    end;

    Fobjeto.ajusteC197.aliquota := dataSet.FieldByName('aliq_c197').Value;
    if Fobjeto.ajusteC197.id = '' then
    begin
      Fobjeto.ajusteC197.conf_id     := Fobjeto.id;
      Fobjeto.ajusteC197.cod_empresa := vDadosIni.cod_empresa;
      Fobjeto.ajusteC197.tipo        := 1;
      Fobjeto.ajusteC197.id          := SqlInsertGuid(Fobjeto.ajusteC197.SQLMotor().SQLUpdateOrInsert, 'id');
    end
    else if Fobjeto.ajusteC197.FoundChanges then
      SqlExec(Fobjeto.ajusteC197.SQLMotor().SQLUpdate);

    Fobjeto.ajuste1921.aliquota := dataSet.FieldByName('aliq_1921').Value;
    if Fobjeto.ajuste1921.id = '' then
    begin
      Fobjeto.ajuste1921.conf_id     := Fobjeto.id;
      Fobjeto.ajuste1921.cod_empresa := vDadosIni.cod_empresa;
      Fobjeto.ajuste1921.tipo        := 2;
      Fobjeto.ajuste1921.id          := SqlInsertGuid(Fobjeto.ajuste1921.SQLMotor().SQLUpdateOrInsert, 'id');
    end
    else if Fobjeto.ajuste1921.FoundChanges then
      SqlExec(Fobjeto.ajuste1921.SQLMotor().SQLUpdate);


    Fobjeto.condicoes := Fcondicoes.BuildCondicoes();
    SqlExec('delete from EFD_AJUSTES_CONF_COND where conf_id = ''%s'' and cod_empresa = %d', [Fobjeto.id, vDadosIni.cod_empresa]);
    for I := 0 to Fobjeto.condicoes.Count - 1 do
    begin
      Fobjeto.condicoes.Items[I].conf_id := Fobjeto.id;
      Fobjeto.condicoes.Items[I].cod_empresa := Fobjeto.cod_empresa;
      SqlExec(Fobjeto.condicoes.Items[I].SQLMotor().SQLInsert);
    end;

    if transacao.InTransaction then
      transacao.Commit;
    Result := True;

    Auditor.Sucesso.GravarMensagem('');

    DataSet.Cancel;
    if EndsText('where id = null and cod_empresa = 1', dataSet.CommandText) then
      montaSelect('select * from %s where id = ''%s'' and cod_empresa = %s', [TableName, Fobjeto.id, vDadosIni.codEmpresa])
    else
      DataSet.Refresh;

  except on E: Exception do
    begin
      transacao.Rollback;
      ShowErro('Erro: %s', [e.Message]);
      registraErro('TEfdConfAjuestesAuto.Post Erro: ' + e.Message);
    end;
  end;
end;

function TEfdConfAjuestesAuto.Restaurar: Boolean;
var
  codAj: string;
  I: Integer;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not Auditor.Processo('SPED115')
    .Msg('%d - %s', [fint('seq'), fstr('descricao')])
    .AcaoPermitida('RESTAURAR') then
    Exit;

  try
    for I := 1 to 2 do
    begin
      codAj := SqlScalar('select t.cod_ajuste from EFD_AJUSTES_CONF_TIPO t' +
                         ' inner join EFD_AJUSTES_CONF e on e.id = t.conf_id' +
                         ' where t.conf_id = ''%s'' and t.cod_empresa = %d and t.tipo = %d and t.ativo = 1',
                         [fstr('id'), vDadosIni.cod_empresa, I]).AsString;

      if SqlScalar('select count(t.id) from EFD_AJUSTES_CONF_TIPO t' +
                   ' inner join EFD_AJUSTES_CONF e on e.id = t.conf_id and e.ativo = 1' +
                   ' where t.conf_id <> ''%s'' and t.cod_empresa = %d and t.tipo = %d and t.ativo = 1' +
                   ' and cod_ajuste = ''%s''',
                   [fstr('id'), vDadosIni.cod_empresa, I, codAj] ).AsInteger > 0 then
      begin
        ShowAtencao('Já existe um registro de %s ativo com o código de ajuste %s' + sLineBreak + sLineBreak +
                    'Este registro não pode ser restaurado até que o registro ativo seja enviado para a lixeira',
                    [IfThen(I = 1, 'Lançamento Fiscal(C197)', 'Subapuração(1921)'), codAj]);
        Exit;
      end;
    end;

    Fobjeto.CopyFrom(dataSet);

    Fobjeto.ativo := 1;
    if Fobjeto.FoundChanges then
      SqlExec(Fobjeto.SQLMotor().SQLUpdate);

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;
    DataSet.Refresh;

    Auditor.Sucesso.GravarMensagem('');

  except on E: Exception do
    begin
      transacao.Rollback;
      ShowErro('Erro: %s', [e.Message]);
      registraErro('TOperacaoFiscal.Restaurar Erro: ' + e.Message);
    end;
  end;
end;

{ TEfdAjusteConf }

class function TEfdAjusteConf.build(id: string;
  con: TDataSet_OOP): TEfdAjusteConf;
begin
  Result := TEfdAjusteConf.Create();
  Result.CopyFrom(con.SqlOpen('select * from EFD_AJUSTES_CONF where id = ''%s'' and cod_empresa = %d', [id, vDadosIni.cod_empresa]));
  Result.ajusteC197.CopyFrom(con.SqlOpen('select first 1 * from EFD_AJUSTES_CONF_TIPO where conf_id = ''%s'' and cod_empresa = %d and tipo = 1', [id, vDadosIni.cod_empresa]));
  Result.ajuste1921.CopyFrom(con.SqlOpen('select first 1 * from EFD_AJUSTES_CONF_TIPO where conf_id = ''%s'' and cod_empresa = %d and tipo = 2', [id, vDadosIni.cod_empresa]));
  Result.condicoes.CopyFrom(TEfd_ajustes_conf_cond_class,
    con.SqlOpen('select * from EFD_AJUSTES_CONF_COND where conf_id = ''%s'' and cod_empresa = %d', [id, vDadosIni.cod_empresa]));

//  Result.icms.conf_trib.Text := Result.icms.conf_calc.Text;
//  Result.piscofins.conf_trib.Text := Result.piscofins.conf_calc.Text;
//
//  if Result.icms.id > 0 then
//  begin
//    Result.icms.interno.CopyFrom(
//      con.SqlOpen('select * from opf_icms_dest where opf_icms_id = %d and cod_empresa = %d and iddest = ''1''', [Result.icms.id, vDadosIni.cod_empresa]));
//    Result.icms.interestadual.CopyFrom(
//      con.SqlOpen('select * from opf_icms_dest where opf_icms_id = %d and cod_empresa = %d and iddest = ''2''', [Result.icms.id, vDadosIni.cod_empresa]));
//    Result.icms.exterior.CopyFrom(
//      con.SqlOpen('select * from opf_icms_dest where opf_icms_id = %d and cod_empresa = %d and iddest = ''3''', [Result.icms.id, vDadosIni.cod_empresa]));
//
//    if Result.icms.interno.id > 0 then
//    begin
//      con.SqlOpen('select first 1 * from opf_icms_dest_params where opf_icms_dest_id = %d and cod_empresa = %d', [Result.icms.interno.id, vDadosIni.cod_empresa]);
//      while not con.buscas.Eof do
//      begin
//        item := TOpFiscal_ICMS_Dest_Params.Create;
//        item.CopyFrom(con.buscas);
//        item.beginChanges;
//        item.ativado := True;
//        Result.icms.interno.params.Add(item);
//
//        con.buscas.Next;
//      end;
//    end;
//
//    if Result.icms.interestadual.id > 0 then
//    begin
//      con.SqlOpen('select * from opf_icms_dest_params where opf_icms_dest_id = %d and cod_empresa = %d', [Result.icms.interestadual.id, vDadosIni.cod_empresa]);
//      while not con.buscas.Eof do
//      begin
//        item := TOpFiscal_ICMS_Dest_Params.Create;
//        item.CopyFrom(con.buscas);
//        item.beginChanges;
//        item.ativado := True;
//        Result.icms.interestadual.params.Add(item);
//
//        con.buscas.Next;
//      end;
//    end;
//
//    if Result.icms.exterior.id > 0 then
//    begin
//      con.SqlOpen('select * from opf_icms_dest_params where opf_icms_dest_id = %d and cod_empresa = %d', [Result.icms.exterior.id, vDadosIni.cod_empresa]);
//      while not con.buscas.Eof do
//      begin
//        item := TOpFiscal_ICMS_Dest_Params.Create;
//        item.CopyFrom(con.buscas);
//        item.beginChanges;
//        item.ativado := True;
//        Result.icms.exterior.params.Add(item);
//
//        con.buscas.Next;
//      end;
//    end;
//  end;
end;

constructor TEfdAjusteConf.Create;
begin
  inherited Create();
  FajusteC197 := TEfd_ajustes_conf_tipo_class.Create;
  Fajuste1921 := TEfd_ajustes_conf_tipo_class.Create;
  Fcondicoes := TEfd_ajustes_conf_conds_class.Create;
end;

destructor TEfdAjusteConf.Destroy;
begin
  FajusteC197.Free;
  Fajuste1921.Free;
  Fcondicoes.Free;
  inherited;
end;

{ TCondicoesAjuste }

procedure TCondicoesAjuste.AddCondicao(tipo: TTipoCondicaoAjuste; valor,
  display: string; aliqIcms: Double; changes: Smallint);
var
  sText: string;
  sList: TStrings;
  I: Integer;
begin
  try
    if tipo = tcaUF then
      Self.prepare_loop(Format('cond = %d', [ord(tipo)]), loop_options_with_filter)
    else
      Self.prepare_loop(Format('cond = %d and valor = %s', [ord(tipo), QuotedStr(valor)]), loop_options_with_filter);

    if Self.IsEmpty then
    begin
      Self.Insert;
//      Self.dataSet.FieldByName('id').AsInteger  := incremento;
//      Self.dataSet.FieldByName('opf_id').AsInteger  := 0;
//      Self.dataSet.FieldByName('cod_empresa').AsInteger  := vdadosIni.cod_empresa;
//      incremento := incremento  - 1;
      Inc(incremento);
    end
    else if tipo = tcaUF then
      Self.Edit
    else
      Exit;

    if changes = 1 then    
      if not Self.Auditor.Table('EFD_AJUSTES_CONF').Processo('SPED116').Inserir
        .Msg('Conf %d - Condicao %s = %s', [seqConf, TipoCondicaoToStr(tipo), display])
        .Permitido then
        Exit;

//    sList := NewStringList(True, valor, ',');
//    for I := sList.Count - 1 downto 0 do
//      if Trim(sList[I]) = '' then
//        sList.Delete(I);

//    valor := StrReplace('@' + sList.Text + '@', ['@,', ',@', '@'], '');

//    valor := StrReplace(NewStringList(True, valor, ' ', ''), ',').Text + '@', [',@', '@'],'');

    Self.dataSet.FieldByName('cond').AsInteger := ord(tipo);
    Self.dataSet.FieldByName('valor').AsString := valor;
    Self.dataSet.FieldByName('name').AsString := display;
    Self.dataSet.FieldByName('ativo').AsInteger := 1;
    Self.dataSet.FieldByName('changes').AsInteger := changes;
    if (tipo = tcaAliqICMS) and (aliqIcms > 0) then      
      Self.dataSet.FieldByName('aliquota').AsFloat := aliqIcms;
    
    Self.Post;

  finally
    Self.prepare_loop_done();
    Self.filterStr('ativo = 1');
  end;
end;

function TCondicoesAjuste.BuildCondicoes: TEfd_ajustes_conf_conds_class;
var
  tipo: TTipoCondicaoAjuste;
  sNewText, sText: string;
  vNewAliq, vAliq: Variant;
  cond: TEfd_ajustes_conf_cond_class;
begin
  Result := TEfd_ajustes_conf_conds_class.Create;

  Self.prepare_loop();
  try

    for tipo := Low(TTipoCondicaoAjuste) to High(TTipoCondicaoAjuste) do
    begin
      sText := '';
      Self.dataSet.IndexFieldNames := 'COND;ALIQUOTA;NAME';
      Self.filterStr('cond = %d', [Ord(tipo)]).First;

//      if tipo = tcaAliqICMS then
//      begin
//        while not Self.Eof do
//        begin
//          cond := TEfd_ajustes_conf_cond_class.Create;
//          cond.tipo := Ord(tipo);
//          cond.condicao := fstr('valor');
//          cond.aliquota := ffield('aliquota').Value;
//          Result.Add(cond);
//
//          Self.Next;
//        end;
//      end
//      else
      begin
//        sText := fstr('valor');
//        vAliq := ffield('aliquota').Value;
        sText := '';
        vAliq := ffield('aliquota').Value;

        while not Self.Eof do
        begin
          sNewText := sText + IfThen(sText <> '', ',') + fstr('valor');
          vNewAliq := ffield('aliquota').Value;

          if (Length(sNewText) > 32) or (vNewAliq <> vAliq) then
          begin
            cond := TEfd_ajustes_conf_cond_class.Create;
            cond.tipo := Ord(tipo);
            cond.condicao := sText;
            cond.aliquota := vAliq;
            Result.Add(cond);
            sText := fstr('valor');
            vAliq := ffield('aliquota').Value;
          end
          else
          begin
            sText := sNewText;
            vAliq := vNewAliq;
          end;

          Self.Next;
        end;

        if (Length(sText) > 0) then
        begin
          cond := TEfd_ajustes_conf_cond_class.Create;
          cond.tipo := Ord(tipo);
          cond.condicao := sText;
          cond.aliquota := vAliq;
          Result.Add(cond);
        end;
      end;  

    end;
  finally
    Self.prepare_loop_done();
    Self.filterStr('ativo = 1');
    Self.dataSet.IndexFieldNames := 'COND;NAME';
  end;
end;

constructor TCondicoesAjuste.Create;
begin
  inherited Create(dtmAtivo.bancoHw, Self.transacao);
  //InitFieldsDef('select 0 seq, 0 tipo, ''%s'' cond, ''%s'' name, ''%s'' valor 0.00 aliquota, 0 ativo from rdb$database', [PadL(0,32), PadL(0,32)]);
 // InitFieldsDef('select 0 seq from rdb$database', []);
//  dataSet.FieldDefs.Update;
  dataSet.FieldDefs.Add('SEQ', ftInteger);
  dataSet.FieldDefs[0].CreateField(dataSet);

  AddFieldInternalCalc('COND', ftString, 32);
  AddFieldInternalCalc('NAME', ftString, 256);
  AddFieldInternalCalc('VALOR', ftString, 256);
  AddFieldInternalCalc('ALIQUOTA', ftFloat);
  AddFieldInternalCalc('ATIVO', ftSmallint);
  AddFieldInternalCalc('TIPO', ftSmallint);
  AddFieldInternalCalc('CHANGES', ftSmallint);

  dataSet.CreateDataSet;

  incremento := 0;
end;

procedure TCondicoesAjuste.IniciarCondicoes(
  configurcao: TEfdAjusteConf);
var
  list, listFin, listOp: TStrings;
  sFin, sOp, cond: string;
  I: Integer;
  query: TQuery_OOP;
  J: Integer;
  condicoes: TEfd_ajustes_conf_conds_class;
begin
  Self.dataSet.EmptyDataSet;
  condicoes := configurcao.condicoes;
  seqConf := configurcao.seq;

  for I := 0 to condicoes.Count - 1 do
  begin
    if TTipoCondicaoAjuste(condicoes.Items[I].tipo) = tcaFinalidade then
    begin
      cond := StrReplace(condicoes.Items[I].condicao + '@',['@,', '@'], '');

      Self.queryCons.Table('finalidade', 'id, descricao')
        .InCond('id', cond )
        .Equals('cod_empresa', vDadosIni.cod_empresa).OrderBy('descricao').Open;
      while not queryCons.Eof do
      begin
        AddCondicao(tcaFinalidade, queryCons.fstr('id'), Format('%s - %d', [queryCons.fstr('descricao'), queryCons.fint('id')]), -1, 0);
        queryCons.Next;
      end;
    end
    else
    if TTipoCondicaoAjuste(condicoes.Items[I].tipo) = tcaOperacaoFiscal then
    begin
      cond := StrReplace(condicoes.Items[I].condicao + '@',['@,', '@'], '');

      Self.queryCons.Table('opf', 'id, descricao')
        .InCond('id', cond ).Equals('ativo', 1)
        .Equals('cod_empresa', vDadosIni.cod_empresa).OrderBy('descricao').Open;
      while not queryCons.Eof do
      begin
        AddCondicao(tcaOperacaoFiscal, queryCons.fstr('id'), Format('%s - %d', [queryCons.fstr('descricao'), queryCons.fint('id')]), -1, 0);
        queryCons.Next;
      end;
    end
    else
    begin
      list := NewStringList(condicoes.Items[I].condicao, ',');

      for J := 0 to list.Count - 1 do
        if (TTipoCondicaoAjuste(condicoes.Items[I].tipo) = tcaAliqICMS)
          and (condicoes.Items[I].aliquota <> Null)
        then
          AddCondicao(TTipoCondicaoAjuste(condicoes.Items[I].tipo), list[J],
            Format('Quando %s Utilizar %s', [list[J], FloatToStr(VarToFloat(condicoes.Items[I].aliquota))]),
            VarToFloat(condicoes.Items[I].aliquota), 0)
        else
          AddCondicao(TTipoCondicaoAjuste(condicoes.Items[I].tipo), list[J], list[J], -1, 0);
    end;
  end;

  Self.prepare_loop();
  try
    Self.dataSet.FieldByName('cond').Alignment := taLeftJustify;
    Self.dataSet.FieldByName('cond').OnGetText := SelfDataSetGetText;
    Self.dataSet.FieldByName('name').Alignment := taCenter;
    Self.dataSet.FieldByName('name').OnGetText := SelfDataSetGetText;
    Self.dataSet.IndexFieldNames := 'COND;NAME';

    Self.First;
  finally
    Self.prepare_loop_done();
    Self.filterStr('ativo = 1');
  end;
end;

procedure TCondicoesAjuste.RemoveCondicao;
begin
  if Self.IsEmpty then
    Exit;

  if not Self.Auditor.Table('EFD_AJUSTES_CONF').Processo('SPED117').Excluir
    .Msg('Conf %d - Condicao %s = %s', [seqConf, TipoCondicaoToStr(TTipoCondicaoAjuste(Self.fint('cond'))), Self.fstr('name')])
    .Permitido then
    Exit;                 

  Self.Delete;
  Exit;

//  try
//    Self.edit;
//    Self.dataSet.FieldByName('ativo').AsInteger := 0;
//    Self.dataSet.FieldByName('changes').AsInteger := 1;
//    Self.Post;
//
//  finally
////    Self.filterStr('ativo = 1');
//  end;
end;

function TCondicoesAjuste.TipoCondicaoToStr(tipo: TTipoCondicaoAjuste): string;
begin
  case tipo of
    tcaCFOP: Result := 'CFOP';
    tcaNCM: Result := 'NCM';
    tcaUF: Result := 'Estados';
    tcaConsumoFinal: Result := 'Consumo Final';
    tcaContribuite: Result := 'Ind Contribuinte';
    tcaPessoa: Result := 'Tipo Pessoa';
    tcaFinalidade: Result := 'Finalidade';
    tcaOperacaoFiscal: Result := 'Operação fiscal';
    tcaOrigemMerc: Result := 'Origem mercadoria';
    tcaCstIcms: Result := 'CST Icms';
    tcaAliqICMS: Result := 'Aliquota Icms';
    tcaFinaliEmissao: Result := 'Finalidade emissao';
  end;
end;

procedure TCondicoesAjuste.SelfDataSetGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
var
  tipo: TTipoCondicaoAjuste;
begin
  if dataSet.IsEmpty then
    Exit;

  if Sender.FieldName = 'COND' then
  begin
    Text := TipoCondicaoToStr(TTipoCondicaoAjuste(Self.fint('cond')));
  end
  else if Sender.FieldName = 'NAME' then
  begin
    tipo := TTipoCondicaoAjuste(Self.fint('cond'));
    case tipo of
      tcaConsumoFinal:
        Text := IfThen(Self.fequals('valor', 'S'), 'Sim', 'Nao');

      tcaContribuite:
        Text := IfThen(Self.fequals('valor', '1'), '1 - Contribuinte') +
                IfThen(Self.fequals('valor', '2'), '2 - Isento') +
                IfThen(Self.fequals('valor', '9'), '9 - Não Contribuinte');

      tcaPessoa:
        Text := IfThen(Self.fequals('valor', 'PJ'), 'PJ - Pessoa Jurídica') +
                IfThen(Self.fequals('valor', 'PF'), 'PF - Pessoa Física'); 

      tcaFinaliEmissao:
        Text := IfThen(Self.fequals('valor', '1'), '1 - NF-e normal') +
                IfThen(Self.fequals('valor', '2'), '2 - NF-e complementaro') +
                IfThen(Self.fequals('valor', '3'), '3 - NF-e de ajuste') +
                IfThen(Self.fequals('valor', '4'), '4 - Devolução de mercadoria');

      else
        Text := Sender.AsString;
    end;
  end
  else
    Text := Sender.AsString;
end;

function TCondicoesAjuste.SortAndIgnoreDup(sText, separator: string): string;
var
  sList: TStrings;
  I: Integer;
begin
  sList := NewStringList(True, sText, ',');

  for I := sList.Count - 1 downto 0 do
    if Trim(sList[I]) = '' then
      sList.Delete(I);

  Result := StrReplace('@' + sList.Text + '@', ['@,', ',@', '@'], '');
end;

end.
