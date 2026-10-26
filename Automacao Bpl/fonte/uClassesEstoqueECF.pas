unit uClassesEstoqueECF;

interface

uses
  uDataSet_OOP, DBClient, StdCtrls, ComCtrls;

type
  TEstoqueECF = class;
  TCNIEE_ECF = class;

  TCNIEE_ECF = class(TDataSet_OOP)
  public
    constructor create;
    function getTodos: boolean;
  end;

  TEstoqueECF = class(TDataSet_OOP)
  private
    vTempAuditoria: string;
  public
    vNomeUsuarioECF, vCpfCnpjUsuarioECF: string;

    destructor Destroy; override;
    constructor create;
    procedure cadEstoqueECF(modal: boolean);
    function post: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    function delete: boolean; override;
    function abreFormSaidaIntervencao: boolean;
    function abreFormModificarStatusECF: boolean;
    function abreFormMontarArquivoEletronico: boolean;
    function abreFormEscolhaProduto: boolean;
    function abreFormInicializacaoECF: boolean;
    function montarArquivoEletronicoAnexoI: boolean;
    function montarArquivoEletronicoAnexoV: boolean;
    procedure setDadosCNIEE;
    function setDadosProduto(vCodigo: string): boolean;
    function getDescricaoProduto(vCodigo: string): string;
    function getDadosUsuarioECF(vCodigo:integer):boolean;
  var
    vImpCNIEE: TCNIEE_ECF;
    //Variaveis para montagem do arquivo eletronico
    vMesAnoRef, vIdentEstrutura, vInformante, vNomeArquivoAnexoI, vNomeArquivoAnexoV: string;
    vProgresso: TProgressBar;
  end;

implementation

uses uDtmEstoqueECF, uCadEstoqueECF, Forms, IBDatabase, IBQuery, uDtmAtivo, DB,
  SysUtils, uPadrao, Windows, uDadosIni, DateUtils;

{ TCNIEE_ECF }

constructor TCNIEE_ECF.create;
begin
  if dtmEstoqueECF = nil then
    dtmEstoqueECF := TdtmEstoqueECF.Create(dtmEstoqueECF);
  DataSet := TClientDataSet(dtmEstoqueECF.cdsCNIEE);
  transacao := TIBTransaction(dtmEstoqueECF.transacao);
  Buscas := TIBQuery(dtmEstoqueECF.qrBuscas);
end;

function TCNIEE_ECF.getTodos: boolean;
begin
  result := montaSelect('select * from impressoras_cniee where ativo = 1 ');
end;

{ TEstoqueECF }

function TEstoqueECF.abreFormEscolhaProduto: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('ECF012', 'ABRIR', '', 'ECF',
    dataSet.FieldByName('N_SERIE_FAB').asString, buscas, True) then
    exit;
  try
    vTempAuditoria := 'PROD ANT' + dataSet.FieldByName('grupo_prod').AsString + '|' +
      dataSet.FieldByName('cod_prod').AsString;
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Alterar Produto do ECF';
    frmCadEstoqueECF.pnModificarProduto.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;

    buscas.close;
    buscas.SQL.Text := 'select p.num_fab_prod, p.descr_prod from produtos p' +
      ' where p.grupo_prod= ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
      ' and p.cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString) +
      ' and p.ativo = 1';
    buscas.Open;
    frmCadEstoqueECF.Edit1.Text := Trim(buscas.FieldByName('num_fab_prod').AsString);
    frmCadEstoqueECF.Edit2.Text := Trim(buscas.FieldByName('descr_prod').AsString);
    buscas.close;
    result := (formulario.ShowModal = IDOK);
  finally
    frmCadEstoqueECF.pnModificarProduto.Parent := frmCadEstoqueECF.tsDadosProduto;
    formulario.Free;
    formulario := nil;
  end;
end;

function TEstoqueECF.abreFormInicializacaoECF: boolean;

var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('ECF013', 'ABRIR', '', 'ECF',
    dataSet.FieldByName('N_SERIE_FAB').asString, buscas, True) then
    exit;
  try
    vTempAuditoria := 'PROD ANT' + dataSet.FieldByName('grupo_prod').AsString + '|' +
      dataSet.FieldByName('cod_prod').AsString;
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Informar dados de Inicialização de ECF';
    frmCadEstoqueECF.pnInicializacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;

    getDadosUsuarioECF(dataSet.FieldByName('cod_cliente_inicializacao').AsInteger);

    frmCadEstoqueECF.Edit4.Text := vNomeUsuarioECF;
    frmCadEstoqueECF.Edit5.Text := vCpfCnpjUsuarioECF;

    Edit;

    result := (formulario.ShowModal = IDOK);
    if Result then
      Result := Post
    else
      Cancel;
  finally
    frmCadEstoqueECF.pnInicializacao.Parent := frmCadEstoqueECF.tsInicializacao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TEstoqueECF.abreFormModificarStatusECF: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('ECF010', 'ABRIR', '', 'ECF',
    dataSet.FieldByName('N_SERIE_FAB').asString, buscas, True) then
    exit;
  try
    vTempAuditoria := 'STATUS ANT ' + dataSet.FieldByName('STATUS').AsString;
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Alterar Status do ECF';
    frmCadEstoqueECF.pnAlterarStatusECF.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    dataSet.Edit;
    result := (formulario.ShowModal = IDOK);
    if Result then
      Result := Post;

    vTempAuditoria := vTempAuditoria + 'STATUS ATU ' + dataSet.FieldByName('STATUS').AsString;
    if Result then
      vDadosIni.GravaAuditoria('ECF010', 'ALTERAR', vTempAuditoria, 'ECF',
        dataSet.FieldByName('N_SERIE_FAB').asString, buscas);
  finally
    frmCadEstoqueECF.pnAlterarStatusECF.Parent := frmCadEstoqueECF.tsModificarStatusECF;
    formulario.Free;
    formulario := nil;
  end;
end;

function TEstoqueECF.abreFormMontarArquivoEletronico: boolean;
var
  formulario: TfrmPadrao;
  vtempStr: string;
begin
  if not vDadosIni.PesqPros('ECF011', 'MONTAR', 'ARQUIVO ELETRONICO', 'ECF',
    '', buscas, True) then
    exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Montagem de arquivo eletronico - Anexo I Convênio ICMS 09/2009';
    frmCadEstoqueECF.pnMontarArquivoEletronico.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    vtempStr := copy(DateToStr(StartOfTheMonth(Date) - 1), 4, 7);
    frmCadEstoqueECF.MaskEdit4.Text := vtempStr;
    frmCadEstoqueECF.Edit3.Text := ExtractFilePath(Application.ExeName) +'ECFANEXOI'+
      StringReplace(frmCadEstoqueECF.MaskEdit4.Text, '/', '', [rfReplaceAll]) + '.txt';
    frmCadEstoqueECF.Edit6.Text := ExtractFilePath(Application.ExeName) +'ECFANEXOV'+
      StringReplace(frmCadEstoqueECF.MaskEdit4.Text, '/', '', [rfReplaceAll]) + '.txt';
    frmCadEstoqueECF.ProgressBar1.Position := 0;
    result := (formulario.ShowModal = IDOK);
  finally
    frmCadEstoqueECF.pnMontarArquivoEletronico.Parent := frmCadEstoqueECF.tsArquivoEletronico;
    formulario.Free;
    formulario := nil;
  end;
end;

function TEstoqueECF.abreFormSaidaIntervencao: boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('ECF006', 'ABRIR', '', 'ECF',
    dataSet.FieldByName('N_SERIE_FAB').asString, buscas, True) then
    exit;
  try
    formulario := TfrmPadrao.Create(Application);
    try
      if Trim(dataSet.FieldByName('status').asString) <> 'Vendido' then
      begin
        if Application.MessageBox('Equipamento ainda não foi vendido. Deseja continuar assim mesmo?',
          'Confirmação', MB_ICONQUESTION + MB_OK) = IDNO then
        begin
          Cancel;
          exit;
        end;
      end;

      formulario.Width := 620;
      formulario.Height := 500;
      formulario.Position := poScreenCenter;
      formulario.Caption :=
        'Informar dados de Intevenção Técnica / Saída';
      frmCadEstoqueECF.pnIntevencao.Parent := formulario;
      formulario.AutoSize := True;
      formulario.AutoScroll := False;
      dataSet.Edit;
      result := (formulario.ShowModal = IDOK);
      if Result then
      begin
        if Trim(dataSet.FieldByName('HOUVE_INTERVENCAO').asString) = 'S' then
        begin
          if (Trim(dataSet.FieldByName('LACRE_EXTERNO1').asString) = '') and
            (Trim(dataSet.FieldByName('LACRE_EXTERNO2').asString) = '') and
            (Trim(dataSet.FieldByName('LACRE_EXTERNO3').asString) = '') and
            (Trim(dataSet.FieldByName('LACRE_EXTERNO4').asString) = '') then
          begin
            if not vDadosIni.PesqPros('ECF008', 'SALVAR', 'NENHUM LACRE_EXTERNO INFORMADO', 'ECF',
              dataSet.FieldByName('N_SERIE_FAB').asString, buscas, True) then
              exit;
            if Application.MessageBox(
              'Houve intervenção Técnica e nenhum Lacre externo foi informado. Deseja continuar assim mesmo?',
              'Confirmação', MB_ICONQUESTION + MB_OK) = IDNO then
            begin
              Cancel;
              exit;
            end
            else
              vDadosIni.GravaAuditoria('ECF008', 'SALVAR', 'NENHUM LACRE_EXTERNO INFORMADO', 'ECF',
                dataSet.FieldByName('N_SERIE_FAB').asString, buscas);
          end;
          if (Trim(dataSet.FieldByName('LACRE_MFD').asString) = '') then
          begin
            if not vDadosIni.PesqPros('ECF008', 'SALVAR', ' LACRE_MFD NAO INFORMADO', 'ECF',
              dataSet.FieldByName('N_SERIE_FAB').asString, buscas, True) then
              exit;
            if Application.MessageBox(
              'Houve intervenção Técnica e não foi informado o numero do Lacre da MFD. Deseja continuar assim mesmo?',
              'Confirmação', MB_ICONQUESTION + MB_OK) = IDNO then
            begin
              Cancel;
              exit;
            end
            else
              vDadosIni.GravaAuditoria('ECF008', 'SALVAR', ' LACRE_MFD NAO INFORMADO', 'ECF',
                dataSet.FieldByName('N_SERIE_FAB').asString, buscas);
          end;
        end;
        Result := Post;
      end;
    except
      on e: exception do
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  finally
    frmCadEstoqueECF.pnIntevencao.Parent := frmCadEstoqueECF.tsIntervencao;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TEstoqueECF.cadEstoqueECF(modal: boolean);
begin
  if dtmEstoqueECF = nil then
    dtmEstoqueECF := TdtmEstoqueECF.Create(dtmEstoqueECF);
  if frmCadEstoqueECF = nil then
  begin
    vDadosIni.vTipoForm := 0;
    if modal then
    begin
      vDadosIni.vModalOuChild := 'M';
      vDadosIni.vTipoForm := 2;
    end
    else
      vDadosIni.vModalOuChild := 'C';
    Application.CreateForm(TfrmCadEstoqueECF, frmCadEstoqueECF);
  end;
  if modal then
    frmCadEstoqueECF.Showmodal
  else
    frmCadEstoqueECF.Show;
end;

constructor TEstoqueECF.create;
begin
  if dtmEstoqueECF = nil then
    dtmEstoqueECF := TdtmEstoqueECF.Create(dtmEstoqueECF);
  DataSet := TClientDataSet(dtmEstoqueECF.cdsEstECF);
  transacao := TIBTransaction(dtmEstoqueECF.transacao);
  Buscas := TIBQuery(dtmEstoqueECF.qrBuscas);
  vImpCNIEE := TCNIEE_ECF.create;
end;

function TEstoqueECF.delete: boolean;
var
  vNumeroSerieDoECF: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;
  vNumeroSerieDoECF := dataSet.FieldByName('N_SERIE_FAB').AsString;

  if not vDadosIni.PesqPros('ECF004', 'EXCLUIR', '', 'ECF',
    dataSet.FieldByName('N_SERIE_FAB').asString, buscas, True) then
    exit;
  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
  begin
    result := inherited Delete;
    if Result then
      result := Apply;
    if result then
      result := CommitaTransacao;
    if Result then
      vDadosIni.GravaAuditoria('ECF004', 'EXCLUIR', '', 'ECF',
        dataSet.FieldByName('N_SERIE_FAB').asString, buscas)
    else
      vDadosIni.GravaAuditoria('ECF004', 'EXCLUIR', '', 'ECF',
        dataSet.FieldByName('N_SERIE_FAB').asString, buscas);
  end;
  if Result then
    Refresh
  else
  begin
    CancelUpdates;
    Refresh;
  end;
end;

destructor TEstoqueECF.Destroy;
begin
  vImpCNIEE.Free;
  vImpCNIEE := nil;
  inherited;
end;

function TEstoqueECF.edit: boolean;
begin
  if not vDadosIni.PesqPros('ECF003', 'ALTERAR', '', 'ECF',
    dataSet.FieldByName('N_SERIE_FAB').asString, buscas, True) then
    exit;
  if dataSet.IsEmpty then
    Exit;
  if inherited edit then
  begin
    vImpCNIEE.getTodos;
    if (dataSet.FieldByName('grupo_prod').AsInteger > 0) and
      (Trim(dataSet.FieldByName('cod_prod').AsString) <> '') then
    begin
      buscas.close;
      buscas.SQL.Text := 'select grupo_prod, cod_prod, ecf from produtos' +
        ' where grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
        ' and cod_prod = ' + QuotedStr(Trim(dataSet.FieldByName('cod_prod').AsString)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1';
      buscas.Open;
      if not buscas.IsEmpty then
        dataSet.FieldByName('tipo').AsString := buscas.FieldByName('ecf').AsString;

    end;
    Result := true;
  end;
end;

function TEstoqueECF.getDadosUsuarioECF(vCodigo: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT NOME_CLIENTE, CPFCGC FROM CLIENTES '+
  ' WHERE COD_CLIENTE = '+IntToStr(vCodigo)+
  ' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
  buscas.Open;
  vNomeUsuarioECF := Trim(buscas.FieldByName('NOME_CLIENTE').AsString);
  vCpfCnpjUsuarioECF := Trim(buscas.FieldByName('CPFCGC').AsString);
  Result := not buscas.IsEmpty;  
end;

function TEstoqueECF.getDescricaoProduto(vCodigo: string): string;
begin
  try
    buscas.close;
    buscas.SQL.Text := 'select c.grupo_prod, c.cod_prod, p.descr_prod, p.ecf from cod_barra c' +
      ' inner join produtos p on p.grupo_prod = c.grupo_prod and' +
      ' p.cod_prod = c.cod_prod and p.cod_empresa = c.cod_empresa' +
      ' where c.cod_barra = ' + QuotedStr(vCodigo) + ' and p.ativo = 1 and c.ativo = 1';
    buscas.Open;
    if buscas.IsEmpty then
      raiseExceptionCreate('Produto não encontrado', 'Edit1')
    else
    begin
      if dataSet.FieldByName('tipo').AsString = 'E' then
        if buscas.FieldByName('ecf').AsString <> 'E' then
          raiseExceptionCreate('Produto não marcado no campo de Controle de Nº de Série como "ECF"', 'Edit1');

      if dataSet.FieldByName('tipo').AsString = 'O' then
        if buscas.FieldByName('ecf').AsString <> 'O' then
          raiseExceptionCreate('Produto não marcado no campo de Controle de Nº de Série como "Outros"', 'Edit1');

      Result := Trim(buscas.FieldByName('descr_prod').AsString);
    end;
    buscas.Close;
  except on e: exception do begin
      buscas.Close;
      Result := '';
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TEstoqueECF.insert: boolean;
begin
  if not vDadosIni.PesqPros('ECF002', 'INCLUIR', '', 'ECF',
    '', buscas, False) then
    exit;
  if not dataSet.Active then
    montaSelect('select * from ecf where N_SERIE_FAB = '''' and cod_empresa = '+vDadosIni.codEmpresa);

  if inherited insert then
  begin
    vImpCNIEE.getTodos;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.Codempresa;
    dataSet.FieldByName('tipo').AsString := 'O';
    Result := true;
  end;
end;

function TEstoqueECF.montarArquivoEletronicoAnexoI: boolean;
var
  Arq: TextFile;
  vDataIni: string;
  vDataFim: string;
begin
  AssignFile(Arq, vNomeArquivoAnexoI);
  try
    try
      Rewrite(Arq);
      vDadosIni.auxstr := vDadosIni.Space(176);
      vDadosIni.LimpaLinha(vDadosIni.auxstr);

      vDadosIni.MontaLinha(001, 'F1');
      vDadosIni.MontaLinha(003, vInformante);
      vDadosIni.MontaLinha(004, vDadosIni.vEmp.vCNPJ);
      vDadosIni.MontaLinha(018, vDadosIni.vEmp.vRazaoSocial);
      vDadosIni.MontaLinha(068, vDadosIni.vEmp.vEndereco);
      vDadosIni.MontaLinha(118, vDadosIni.vEmp.vSiglaUF);
      vDadosIni.MontaLinha(120, copy(vMesAnoRef, 1, 2));
      vDadosIni.MontaLinha(122, copy(vMesAnoRef, 4, 4));
      vDadosIni.MontaLinha(126, vDadosIni.vEmp.vProprietario);
      vDadosIni.MontaLinha(176, vIdentEstrutura);
      WriteLn(arq, vDadosIni.auxstr);
      vDadosIni.LimpaLinha(vDadosIni.AuxStr);

      vDadosIni.auxstr := vDadosIni.Space(261);
      vDataIni := '01/' + vMesAnoRef;
      vDataFim := '01/' + vMesAnoRef;
      vDataFim := DateToStr(EndOfTheMonth(StrToDate(vDataFim)));

      vProgresso.Min := 0;
      vProgresso.Position := 0;

      buscas.Close;
      buscas.SQL.Text :=
        'select e.identificacao, e.n_serie_fab, e.n_memoria_fiscal, e.lacre_externo1,'
        +
        ' e.lacre_externo2, e.lacre_externo3, e.lacre_externo4, e.tipo_dispositivo,' +
        ' e.num_disp_prot_sb, e.lacre_mfd, cl.razao,  cl.cpfcgc, cl.insc_est, '''' insc_municipal,' +
        ' cl.endereco, cl.num_end_cliente, cl.complemento, es.sigla_uf, nf.num_nf,' +
        ' nf.data_lanc, e.uso_proprio, e.houve_intervencao from ecf e' +
        ' inner join notafiscal nf on nf.num_nf = e.nnf and nf.serie = e.serie and' +
        ' nf.natureza_nf = ''S'' and nf.cod_empresa = e.cod_empresa' +
        ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and' +
        ' cl.cod_empresa = nf.cod_empresa' +
        ' inner join estados es on es.codigo_uf = cl.codigo_uf' +
        ' where nf.status = ''Fechada'' and' +
        ' nf.data_lanc >= :dataInicial and nf.data_lanc <= :dataFinal and' +
        ' e.cod_empresa = ' + vDadosIni.codEmpresa+
        ' and e.status = ''Vendido'''+
        ' and e.tipo = ''E''';
      buscas.ParamByName('dataInicial').AsDate := StrToDate(vDataIni);
      buscas.ParamByName('dataFinal').AsDate := StrToDate(vDataFim);
      buscas.Open;

      buscas.FetchAll;
      vProgresso.Max := buscas.RecordCount;

      buscas.First;
      while not buscas.Eof do
      begin
        vDadosIni.MontaLinha(001, 'F2');
        vDadosIni.MontaLinha(003, buscas.FieldByName('identificacao').AsString);
        vDadosIni.MontaLinha(009, buscas.FieldByName('n_serie_fab').AsString);
        vDadosIni.MontaLinha(029, buscas.FieldByName('n_memoria_fiscal').AsString);
        if buscas.FieldByName('houve_intervencao').AsString = 'S' then
        begin
          vDadosIni.MontaLinha(049, buscas.FieldByName('lacre_externo1').AsString);
          vDadosIni.MontaLinha(061, buscas.FieldByName('lacre_externo2').AsString);
          vDadosIni.MontaLinha(073, buscas.FieldByName('lacre_externo3').AsString);
          vDadosIni.MontaLinha(085, buscas.FieldByName('lacre_externo4').AsString);
          if Trim(buscas.FieldByName('tipo_dispositivo').AsString) = 'E' then
            vDadosIni.MontaLinha(097, '1')
          else
            vDadosIni.MontaLinha(097, '2');
          vDadosIni.MontaLinha(098, vDadosIni.StrZero(buscas.FieldByName('num_disp_prot_sb').AsString,7));
          vDadosIni.MontaLinha(105, vDadosIni.StrZero(buscas.FieldByName('lacre_mfd').AsString,7));
        end;
        vDadosIni.MontaLinha(112, copy(buscas.FieldByName('razao').AsString, 1, 40));
        vDadosIni.MontaLinha(152, buscas.FieldByName('cpfcgc').AsString);
        vDadosIni.MontaLinha(166, buscas.FieldByName('insc_est').AsString);
        vDadosIni.MontaLinha(181, buscas.FieldByName('insc_municipal').AsString);
        vDadosIni.MontaLinha(196, copy(
          Trim(buscas.FieldByName('endereco').AsString) + ',' +
          Trim(buscas.FieldByName('num_end_cliente').AsString) + ',' +
          Trim(buscas.FieldByName('complemento').AsString), 1, 48));
        vDadosIni.MontaLinha(244, buscas.FieldByName('sigla_uf').AsString);
        vDadosIni.MontaLinha(246, vDadosIni.StrZero(buscas.FieldByName('num_nf').AsInteger, 6));
        vDadosIni.MontaLinha(252, copy(buscas.FieldByName('data_lanc').AsString, 7, 4) +
          copy(buscas.FieldByName('data_lanc').AsString, 4, 2) +
          copy(buscas.FieldByName('data_lanc').AsString, 1, 2));
        if buscas.FieldByName('uso_proprio').AsString = 'S' then
          vDadosIni.MontaLinha(260, '1')
        else
          vDadosIni.MontaLinha(260, '2');
        if buscas.FieldByName('houve_intervencao').AsString = 'S' then
          vDadosIni.MontaLinha(261, '1')
        else
          vDadosIni.MontaLinha(261, '2');
        WriteLn(arq, vDadosIni.auxstr);
        vDadosIni.LimpaLinha(vDadosIni.AuxStr);

        buscas.Next;
        vProgresso.Position := vProgresso.Position + 1;
      end;

      vDadosIni.auxstr := vDadosIni.Space(25);
      vDadosIni.LimpaLinha(vDadosIni.auxstr);

      vDadosIni.MontaLinha(001, 'F9');
      vDadosIni.MontaLinha(003, vDadosIni.vEmp.vCNPJ);
      if vProgresso.Position > 0 then
        vDadosIni.MontaLinha(017, 'SIM')
      else
        vDadosIni.MontaLinha(017, 'NAO');
      vDadosIni.MontaLinha(020, vDadosIni.StrZero(vProgresso.Position, 6));
      WriteLn(arq, vDadosIni.auxstr);

      vDadosIni.auxstr := vDadosIni.Space(1);
      vDadosIni.LimpaLinha(vDadosIni.AuxStr);
      Application.MessageBox('Arquivo referente ao Anexo I salvo com sucesso', 'Atenção', 0 + 64);
      Result := True;
    except on e: exception do begin
        Result := false;
        Application.MessageBox(pchar('Erro ao gerar arquivo: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('procedure montarArquivoEletronicoAnexoI ' + e.Message);
      end;
    end;
  finally
    CloseFile(Arq);
  end;
end;

function TEstoqueECF.montarArquivoEletronicoAnexoV: boolean;
var
  Arq: TextFile;
  vDataIni: string;
  vDataFim: string;
begin
  AssignFile(Arq, vNomeArquivoAnexoV);
  try
    try
      Rewrite(Arq);
      vDadosIni.auxstr := vDadosIni.Space(176);
      vDadosIni.LimpaLinha(vDadosIni.auxstr);

      vDadosIni.MontaLinha(001, 'I1');
      vDadosIni.MontaLinha(003, vInformante);
      vDadosIni.MontaLinha(004, vDadosIni.vEmp.vCNPJ);
      vDadosIni.MontaLinha(018, vDadosIni.vEmp.vRazaoSocial);
      vDadosIni.MontaLinha(068, vDadosIni.vEmp.vEndereco);
      vDadosIni.MontaLinha(118, vDadosIni.vEmp.vSiglaUF);
      vDadosIni.MontaLinha(120, copy(vMesAnoRef, 1, 2));
      vDadosIni.MontaLinha(122, copy(vMesAnoRef, 4, 4));
      vDadosIni.MontaLinha(126, vDadosIni.vEmp.vProprietario);
      vDadosIni.MontaLinha(176, '1');
      WriteLn(arq, vDadosIni.auxstr);
      vDadosIni.LimpaLinha(vDadosIni.AuxStr);

      vDadosIni.auxstr := vDadosIni.Space(584);
      vDataIni := '01/' + vMesAnoRef;
      vDataFim := '01/' + vMesAnoRef;
      vDataFim := DateToStr(EndOfTheMonth(StrToDate(vDataFim)));

      vProgresso.Min := 0;
      vProgresso.Position := 0;

      buscas.Close;
      buscas.SQL.Text :=
        'select e.identificacao, e.n_serie_fab, c.cpfcgc, c.insc_est, c.insc_municipal,' +
        ' e.chave_publica, e.chave_privada from ecf e' +
        ' inner join clientes c on c.cod_cliente = e.cod_cliente_inicializacao and' +
        ' c.cod_empresa = e.cod_empresa' +
        ' where e.data_inicializacao >= :dataInicial and e.data_inicializacao <= :dataFinal and' +
        ' e.cod_empresa = ' + vDadosIni.codEmpresa+
        ' and e.tipo = ''E''';
      buscas.ParamByName('dataInicial').AsDate := StrToDate(vDataIni);
      buscas.ParamByName('dataFinal').AsDate := StrToDate(vDataFim);
      buscas.Open;

      buscas.FetchAll;
      vProgresso.Max := buscas.RecordCount;

      buscas.First;
      while not buscas.Eof do
      begin
        vDadosIni.auxstr := vDadosIni.Space(584);
        vDadosIni.MontaLinha(001, 'I2');
        vDadosIni.MontaLinha(003, buscas.FieldByName('identificacao').AsString);
        vDadosIni.MontaLinha(009, buscas.FieldByName('n_serie_fab').AsString);
        vDadosIni.MontaLinha(029, vDadosIni.StrZero(Trim(buscas.FieldByName('cpfcgc').AsString),14));
        vDadosIni.MontaLinha(043, buscas.FieldByName('insc_est').AsString);
        if buscas.FieldByName('insc_municipal').AsString = '' then
          vDadosIni.MontaLinha(058, 'ISENTO')
        else
         vDadosIni.MontaLinha(058, buscas.FieldByName('insc_municipal').AsString);
        vDadosIni.MontaLinha(073, buscas.FieldByName('chave_publica').AsString);
        vDadosIni.MontaLinha(329, buscas.FieldByName('chave_privada').AsString);
        WriteLn(arq, vDadosIni.auxstr);
        vDadosIni.LimpaLinha(vDadosIni.AuxStr);

        buscas.Next;
        vProgresso.Position := vProgresso.Position + 1;
      end;

      vDadosIni.auxstr := vDadosIni.Space(25);
      vDadosIni.LimpaLinha(vDadosIni.auxstr);

      vDadosIni.MontaLinha(001, 'I9');
      vDadosIni.MontaLinha(003, vDadosIni.vEmp.vCNPJ);
      if vProgresso.Position > 0 then
        vDadosIni.MontaLinha(017, 'SIM')
      else
        vDadosIni.MontaLinha(017, 'NAO');
      vDadosIni.MontaLinha(020, vDadosIni.StrZero(vProgresso.Position, 6));
      WriteLn(arq, vDadosIni.auxstr);

      vDadosIni.auxstr := vDadosIni.Space(1);
      vDadosIni.LimpaLinha(vDadosIni.AuxStr);
      Application.MessageBox('Arquivo referente ao Anexo V salvo com sucesso', 'Atenção', 0 + 64);
      Result := True;
    except on e: exception do begin
        Result := false;
        Application.MessageBox(pchar('Erro ao gerar arquivo: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('procedure montarArquivoEletronicoAnexoV ' + e.Message);
      end;
    end;
  finally
    CloseFile(Arq);
  end;
end;

function TEstoqueECF.post: boolean;
var
  acao: string;
begin
  try
    Result := false;
    if not vDadosIni.PesqPros('ECF005', 'ABRIR', '', 'ECF',
      dataSet.FieldByName('N_SERIE_FAB').asString, buscas, True) then
      exit;
    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := true;
      exit;
    end;
    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if Trim(dataSet.FieldByName('N_SERIE_FAB').asString) = '' then
      raiseExceptionCreate('Número de Sério de Fabricação do ECF não informado', 'DBEDIT1');

    if (Trim(dataSet.FieldByName('IDENTIFICACAO').asString) = '') and
      (Trim(dataSet.FieldByName('tipo').asString) = 'E') then
      raiseExceptionCreate('Código Nacional de Identificação do Equipamento ECF (CNIEE) não informado!', 'DBEDIT1');

    if dataSet.FieldByName('cod_cliente_inicializacao').AsInteger = 0 then
      dataSet.FieldByName('cod_cliente_inicializacao').AsString := ''
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'SELECT NOME_CLIENTE, CPFCGC FROM CLIENTES '+
        ' WHERE COD_CLIENTE = '+IntToStr(dataSet.FieldByName('cod_cliente_inicializacao').AsInteger)+
        ' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
      buscas.Open;
      if buscas.IsEmpty then
      begin
        dataSet.FieldByName('cod_cliente_inicializacao').AsString := '';
        Application.MessageBox('Cliente usuário não encontrado','Atenção',0+64);
      end;
    end;

    if dataSet.State = dsInsert then
      dataSet.FieldByName('COD_NSERIE').AsInteger :=
        Gencodigo('ECF', dtmEstoqueECF.SpIncCodigo, vDadosIni.codEmpresa);

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
      vDadosIni.GravaAuditoria('ECF005', acao, 'SUCESSO', 'ECF',
        dataSet.FieldByName('N_SERIE_FAB').asString, buscas)
    else
      vDadosIni.GravaAuditoria('ECF005', acao, 'FALHA', 'ECF',
        dataSet.FieldByName('N_SERIE_FAB').asString, buscas);
    if Result then
      Refresh;
  except
    on e: exception do
    begin
      Result := false;
      if pos('KEY VIOLATION', UpperCase(E.Message)) > 0 then
        Application.MessageBox('Equipamento já existe',
          'Atenção', 0 + 64)
      else
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TEstoqueECF.setDadosCNIEE;
begin
  if (dataSet.State in [dsInsert, dsEdit]) then
  begin
    dataSet.FieldByName('TIPO_ECF').AsString := vImpCNIEE.dataSet.FieldByName('TIPO_ECF').AsString;
    dataSet.FieldByName('MARCA_ECF').AsString :=
      vImpCNIEE.dataSet.FieldByName('MARCA_ECF').AsString;
    dataSet.FieldByName('MODELO_ECF').AsString :=
      vImpCNIEE.dataSet.FieldByName('MODELO_ECF').AsString;
    dataSet.FieldByName('VERSAOSB').AsString := vImpCNIEE.dataSet.FieldByName('VERSAOSB').AsString;
  end;
end;

function TEstoqueECF.setDadosProduto(vCodigo: string): boolean;
var
  vTemCodigo, vTem, vCodProd: string;
  vGrupo: Integer;
begin
  try
    buscas.close;
    buscas.SQL.Text := 'select grupo_prod, cod_prod from cod_barra where cod_barra = ' +
      QuotedStr(vCodigo) + ' and ativo = 1' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
      raiseExceptionCreate('Produto não encontrado', 'Edit1');

    vGrupo := buscas.FieldByName('grupo_prod').AsInteger;
    vCodProd := buscas.FieldByName('cod_prod').AsString;

    buscas.close;
    buscas.SQL.Text := 'select grupo_prod, cod_prod, ecf from produtos' +
      ' where grupo_prod = ' + IntToStr(vGrupo) +
      ' and cod_prod = ' + QuotedStr(vCodProd) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo = 1';
    buscas.Open;

    if buscas.IsEmpty then
      raiseExceptionCreate('Produto não encontrado', 'Edit1');

    if (buscas.FieldByName('ECF').AsString <> 'E') and (buscas.FieldByName('ECF').AsString <> 'O') then
      raiseExceptionCreate('Produto não esta marcado para Controle de Nº de Série', 'Edit1');

    dataSet.Edit;
    dataSet.FieldByName('grupo_prod').AsString := buscas.FieldByName('grupo_prod').AsString;
    dataSet.FieldByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
    dataSet.FieldByName('tipo').AsString := buscas.FieldByName('ecf').AsString;

    Result := Post;
    vTempAuditoria := vTempAuditoria + ' PROD ATU' + dataSet.FieldByName('grupo_prod').AsString + '|'
      +
      dataSet.FieldByName('cod_prod').AsString;
    if Result then
      vDadosIni.GravaAuditoria('ECF012', 'ALTERAR', vTempAuditoria, 'ECF',
        dataSet.FieldByName('N_SERIE_FAB').asString, buscas);
    buscas.Close;
  except on e: exception do begin
      buscas.Close;
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

end.

