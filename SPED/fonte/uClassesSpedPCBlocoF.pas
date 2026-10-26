unit uClassesSpedPCBlocoF;

interface

uses
  uDataSet_OOP, DB, DBClient, StdCtrls, IBQuery;

type

  RPrecessoRef = record
    num_proc, ind_proc: string;
    dataSet: TClientDataSet;
  end;

  TOutrasReceitasOuCreditosSPEDPC = class;
  TCredDepreciacaoAmortBem = class;

  TOutrasReceitasOuCreditosSPEDPC = class(TDataSet_OOP)
  private
    fNomeParticipante, fNomeContaAnalitica, fNomeCentroCusto: string;
  public
    destructor Destroy; override;
    constructor create;

    procedure cadOutrasReceitasOuCreditos(TipoForm: integer);

    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _statuslixeira: boolean;

    function _inserirAcaoJud: Boolean;
    function _inserirProcAdm: Boolean;
    function _salvarProcessoRef: Boolean;

    function _existeParticipante: Boolean;
    function _existeContaContabil: Boolean;
    function _existeCentroCusto: Boolean;
    function _calcularPISCOFINS: Boolean;

    property NomeParticipante: string read fNomeParticipante;
    property NomeContaAnalitica: string read fNomeContaAnalitica;
    property NomeCentroCusto: string read fNomeCentroCusto;
  var
    vProcRef: RPrecessoRef;
  end;

  TCredDepreciacaoAmortBem = class(TDataSet_OOP)
  private
    fNomeContaAnalitica, fNomeCentroCusto: string;
  public
    destructor Destroy; override;
    constructor create;

    procedure cadCredDepreciacaoAmortBem(TipoForm: integer);

    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _statuslixeira: boolean;

    function _inserirAcaoJud: Boolean;
    function _inserirProcAdm: Boolean;
    function _salvarProcessoRef: Boolean;

    function _existeContaContabil: Boolean;
    function _existeCentroCusto: Boolean;
    function _calcularPISCOFINS: Boolean;

    property NomeContaAnalitica: string read fNomeContaAnalitica;
    property NomeCentroCusto: string read fNomeCentroCusto;
  var
    vProcRef: RPrecessoRef;
  end;

  TCredAquisicaoBem = class(TDataSet_OOP)
  private
    fNomeContaAnalitica, fNomeCentroCusto: string;
  public
    destructor Destroy; override;
    constructor create;

    procedure cadCredAquisicaoBem(TipoForm: integer);

    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _statuslixeira: boolean;

    function _inserirAcaoJud: Boolean;
    function _inserirProcAdm: Boolean;
    function _salvarProcessoRef: Boolean;

    function _existeContaContabil: Boolean;
    function _existeCentroCusto: Boolean;
    function _calcularPISCOFINS: Boolean;

    property NomeContaAnalitica: string read fNomeContaAnalitica;
    property NomeCentroCusto: string read fNomeCentroCusto;
  var
    vProcRef: RPrecessoRef;
  end;


  TCredEstoqueAbertura = class(TDataSet_OOP)
  private
    fNomeContaAnalitica: string;
  public
    constructor create;

    procedure cadEstoqueAbertura(TipoForm: integer);

    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _abrelixeira: boolean;
    function _restauralixeira: boolean;
    function _statuslixeira: boolean;

    function _existeContaContabil: Boolean;
    function _calcularPISCOFINS: Boolean;

    property NomeContaAnalitica: string read fNomeContaAnalitica;
  end;

var
  outRecCred: TOutrasReceitasOuCreditosSPEDPC;
  credDeprec: TCredDepreciacaoAmortBem;
  aquisicBem: TCredAquisicaoBem;
  estAbertura: TCredEstoqueAbertura;

implementation

uses uDtmSPED, uDtmAtivo, IBDatabase, Forms, Windows, SysUtils,
  uCadSpedPCOutRecCred, Variants, uDadosIni, Classes, uCadSpedPCDeprAmortBem,
  uCadSpedPCAquisicaoBem, uCadSpedPCEstoqueAbertura;

{ TOutrasReceitasOuCreditosSPEDPC }

procedure TOutrasReceitasOuCreditosSPEDPC.cadOutrasReceitasOuCreditos(
  TipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Outras Receitas ou Créditos para o SPED PIS/COFINS');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := TipoForm;

    if not vDadosIni.PesqPros('SPED022', 'CONSULTA', '', 'SPED_OUTRAS_RECEITAS_CREDITOS', '',
      dtmSPED.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadSpedPCOutRecCred = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadSpedPCOutRecCred, frmCadSpedPCOutRecCred);
    end;

    if (TipoForm > 0) and (not frmCadSpedPCOutRecCred.Visible) then
      frmCadSpedPCOutRecCred.ShowModal
    else if (not frmCadSpedPCOutRecCred.Visible) then
      frmCadSpedPCOutRecCred.Show
    else if frmCadSpedPCOutRecCred.FormStyle = fsMDIChild then
      frmCadSpedPCOutRecCred.Show
    else
      frmCadSpedPCOutRecCred.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TOutrasReceitasOuCreditosSPEDPC.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsOutRecCred);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);

  vProcRef.dataSet := TClientDataSet.Create(Application);
  vProcRef.dataSet.FieldDefs.Add('NUM_PROC', ftString, 20, False);
  vProcRef.dataSet.FieldDefs.Add('IND_PROC', ftString, 48, False);
  vProcRef.dataSet.FieldDefs.Add('COD_PROC', ftString, 20, False);
  vProcRef.dataSet.FieldDefs.Add('TAB_PROC', ftString, 48, False);

  try
    vProcRef.dataSet.CreateDataSet;
  finally
  end;
end;

function TOutrasReceitasOuCreditosSPEDPC.delete: Boolean;
var
  codRecCred: string;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED026', 'EXCLUIR', 'COD REC OU CRED ' + dataSet.FieldByName('COD_REC_CRED').AsString, 'SPED_OUTRAS_RECEITAS_CREDITOS', '',
    buscas, True) then
    exit;

  codRecCred := dataSet.FieldByName('COD_REC_CRED').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      result := inherited Delete;
      if Apply then
        if CommitaTransacao then
          if Result then
            vDadosIni.GravaAuditoria('SPED026', 'EXCLUIR', 'SUCESSO', 'SPED_OUTRAS_RECEITAS_CREDITOS', codRecCred, buscas)
          else
            vDadosIni.GravaAuditoria('SPED026', 'EXCLUIR', 'FALHA', 'SPED_OUTRAS_RECEITAS_CREDITOS', codRecCred, buscas);
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
              vDadosIni.GravaAuditoria('SPED026', 'ENVIAR REGISTRO PARA A LIXEIRA',
                'SUCESSO', 'SPED_OUTRAS_RECEITAS_CREDITOS', codRecCred, buscas)
            else
              vDadosIni.GravaAuditoria('SPED026', 'ENVIAR REGISTRO PARA A LIXEIRA ',
                'FALHA', 'SPED_OUTRAS_RECEITAS_CREDITOS', codRecCred, buscas);
        Result := true;
      end;
    end;
  Refresh;
end;

destructor TOutrasReceitasOuCreditosSPEDPC.Destroy;
begin
  vProcRef.dataSet.Free;
  vProcRef.dataSet := nil;

  inherited;
end;

function TOutrasReceitasOuCreditosSPEDPC.edit: Boolean;
var
  vListaTemp: TStringList;
  I: Integer;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED025', 'ALTERAR',
    'COD REC OU CRED ' + dataSet.FieldByName('COD_REC_CRED').AsString, 'SPED_OUTRAS_RECEITAS_CREDITOS', '',
    buscas, True) then
    exit;

  if (not dataSet.Active) or (dataSet.IsEmpty) then
    Exit;

  vProcRef.dataSet.EmptyDataSet;

  if Trim(dataSet.FieldByName('processos_ref').AsString) <> '' then
  begin
    vListaTemp := TStringList.Create;
    try
      vListaTemp.Clear;

      vListaTemp.Text := dataSet.FieldByName('processos_ref').AsString;

      for I := 0 to vListaTemp.Count - 1 do
      begin
        vProcRef.dataSet.Insert;
        vProcRef.dataSet.FieldByName('num_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],1);
        vProcRef.dataSet.FieldByName('ind_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],2);
        vProcRef.dataSet.FieldByName('cod_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],3);
        vProcRef.dataSet.FieldByName('tab_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],4);
        vProcRef.dataSet.Post;
      end;
    finally
      vListaTemp.Free;
    end;
  end;

  if inherited Edit then
    Result := True;

end;

function TOutrasReceitasOuCreditosSPEDPC.insert: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED024', 'INCLUIR', '', 'SPED_OUTRAS_RECEITAS_CREDITOS', '',
    buscas, True) then
    exit;

  if not dataSet.Active then
  begin
    montaSelect('select * from SPED_OUTRAS_RECEITAS_CREDITOS' +
      ' where COD_REC_CRED = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
  end;

  vProcRef.dataSet.EmptyDataSet;

  if inherited insert then
  begin

    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('IND_OPER').AsInteger := 0;
    dataSet.FieldByName('IND_ORIG_CRED').AsInteger := 0;
    Result := True;

  end;

end;

function TOutrasReceitasOuCreditosSPEDPC.post: Boolean;
var
  acao: string;
  vListaTemp: TStringList;
begin
  try

    Result := false;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('SPED027', acao, 'COD REC OU CRED ' + dataSet.FieldByName('COD_REC_CRED').AsString,
      'SPED_OUTRAS_RECEITAS_CREDITOS', '', buscas, True) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if Trim(dataSet.FieldByName('IND_OPER').AsString) = '' then
      raiseExceptionCreate('Indicador de Tipo de Operação deve ser preenchido', 'DBRadioGroup1' );

    if Trim(dataSet.FieldByName('DT_OPER').AsString) = '' then
      raiseExceptionCreate('Data da Operação deve ser preenchida', 'DBEdit5' );

    if dataSet.FieldByName('VL_OPER').AsFloat <= 0 then
      raiseExceptionCreate('Valor da operação não deve ser menor ou igual a zero', 'DBEdit7' );

    if Trim(dataSet.FieldByName('cst_pis').AsString) = '' then
      raiseExceptionCreate('CST do PIS deve ser preenchido', 'DBComboBox1' );

    if Trim(dataSet.FieldByName('cst_cofins').AsString) = '' then
      raiseExceptionCreate('CST do COFINS deve ser preenchido', 'DBComboBox2' );

    if Trim(dataSet.FieldByName('cod_item').AsString) <> '' then
      if Trim(dataSet.FieldByName('descr_item').AsString) = '' then
        raiseExceptionCreate('Descrição do Item deve ser preenchida', 'DBEdit4' );

    if Trim(dataSet.FieldByName('cst_pis').AsString) <>
      Trim(dataSet.FieldByName('cst_cofins').AsString) then
      raiseExceptionCreate('CST PIS difere do CST COFINS', 'DBComboBox1' );

    if dataSet.FieldByName('VL_BC_PIS').AsFloat <>
      dataSet.FieldByName('VL_BC_COFINS').AsFloat then
      raiseExceptionCreate('Base Cálculo do PIS deve ser igual a Base de Cálculo do COFINS', 'DBEdit8' );
                                                                                                             
    if Trim(dataSet.FieldByName('IND_OPER').AsString) = '0' then
    begin
      if Trim(dataSet.FieldByName('NAT_BC_CRED').AsString) = '' then
        raiseExceptionCreate('Natureza da Base de Cálculo do Crédito deve ser preenchida', 'DBComboBox3' );
        
      if dataSet.FieldByName('cod_cliente').AsInteger = 0 then
        raiseExceptionCreate('Participante de preenchimento obrigatório para operações com direito a crédito', 'DBEdit2' )
      else
      begin
        buscas.Close;
        buscas.SQL.Text := 'select cpfcgc from clientes' +
          ' where cod_cliente = '+ dataSet.FieldByName('cod_cliente').AsString +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;
        if Length(Trim(buscas.FieldByName('cpfcgc').AsString)) <> 14 then
          raiseExceptionCreate('Participante informado deve ser uma pessoa Jurídica para operações com direito a crédito. (CNPJ)', 'DBEdit2');
      end;
    end;

    if (Trim(dataSet.FieldByName('cst_pis').AsString)[1] in ['5', '6']) or
      (Trim(dataSet.FieldByName('cst_pis').AsString)[2] in ['1', '2', '3', '5']) then
    else
    begin
      dataSet.FieldByName('VL_PIS').AsFloat := 0;
      dataSet.FieldByName('VL_BC_PIS').AsFloat := 0;
      dataSet.FieldByName('ALIQ_PIS').AsFloat := 0;
      dataSet.FieldByName('VL_COFINS').AsFloat := 0;
      dataSet.FieldByName('VL_BC_COFINS').AsFloat := 0;
      dataSet.FieldByName('ALIQ_COFINS').AsFloat := 0;
    end;

    if not vProcRef.dataSet.IsEmpty then
    begin
      vListaTemp := TStringList.Create;
      vListaTemp.Clear;
      try
        vProcRef.dataSet.First;
        while not vProcRef.dataSet.Eof do
        begin
          vListaTemp.Add(
            Trim(vProcRef.dataSet.FieldByName('num_proc').AsString) + '|' +
            copy(Trim(vProcRef.dataSet.FieldByName('ind_proc').AsString),1,1) + '|' +
            Trim(vProcRef.dataSet.FieldByName('cod_proc').AsString) + '|' +
            Trim(vProcRef.dataSet.FieldByName('tab_proc').AsString) + '|'
          );
          vProcRef.dataSet.Next;
        end;
        dataSet.FieldByName('processos_ref').AsString := vListaTemp.Text;
      finally
        vListaTemp.Free;
      end;
    end;

    if dataSet.State = dsInsert then
        dataSet.FieldByName('COD_REC_CRED').AsInteger :=
          Gencodigo('SPED_OUTRAS_RECEITAS_CREDITOS', dtmSPED.SpIncCodigo, vDadosIni.codEmpresa);

    dataSet.Post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED027', acao, 'COD REC CRED ' + dataSet.FieldByName('COD_REC_CRED').AsString+
      ' SALVO COM SUCESSO', 'SPED_OUTRAS_RECEITAS_CREDITOS', '', buscas);

    Result := true;

    Refresh;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao salvar Outras Receitas ou Créditos. Erro: ' + e.Message), 'Atenção', 0
        + 64);
      registraErro('function TOutrasReceitasOuCreditosSPEDPC.post Erro: ' + e.Message);
    end;
  end;
end;

function TOutrasReceitasOuCreditosSPEDPC._abrelixeira: boolean;
begin
  if not _statuslixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select * FROM SPED_OUTRAS_RECEITAS_CREDITOS' +
      ' WHERE cod_empresa  = ' + vDadosIni.codEmpresa +
      ' and ativo = 0');
end;

function TOutrasReceitasOuCreditosSPEDPC._calcularPISCOFINS: Boolean;
begin

  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;
    
  if Trim(dataSet.FieldByName('cst_pis').AsString) = '' then
    exit;

  if (Trim(dataSet.FieldByName('cst_pis').AsString)[1] in ['5', '6']) or
    (Trim(dataSet.FieldByName('cst_pis').AsString)[2] in ['1', '2', '3', '5']) then
  begin
    if dataSet.FieldByName('ALIQ_PIS').Value = Null then
      dataSet.FieldByName('ALIQ_PIS').AsFloat := vDadosIni.vEmp.vAliqPIS;
    if dataSet.FieldByName('ALIQ_COFINS').Value = Null then
      dataSet.FieldByName('ALIQ_COFINS').AsFloat := vDadosIni.vEmp.vAliqCOFINS;
  end
  else
  begin
    dataSet.FieldByName('VL_PIS').AsFloat := 0;
    dataSet.FieldByName('VL_BC_PIS').AsFloat := 0;
    dataSet.FieldByName('ALIQ_PIS').AsFloat := 0;
    dataSet.FieldByName('VL_COFINS').AsFloat := 0;
    dataSet.FieldByName('VL_BC_COFINS').AsFloat := 0;
    dataSet.FieldByName('ALIQ_COFINS').AsFloat := 0;
  end;
  
  dataSet.FieldByName('VL_BC_PIS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_PIS').AsFloat, 2);
  dataSet.FieldByName('VL_BC_COFINS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_COFINS').AsFloat, 2);

  dataSet.FieldByName('VL_PIS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_PIS').AsFloat *
    dataSet.FieldByName('ALIQ_PIS').AsFloat / 100, 2);

  dataSet.FieldByName('VL_COFINS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_COFINS').AsFloat *
    dataSet.FieldByName('ALIQ_COFINS').AsFloat / 100, 2);
end;

function TOutrasReceitasOuCreditosSPEDPC._existeCentroCusto: Boolean;
var
  vCodCusto: String;
begin
  vCodCusto := Trim(dataSet.FieldByName('COD_CCUS').AsString);
  if vCodCusto = '' then
    vCodCusto := '0';
  fNomeCentroCusto := Trim(retornaValor(
      'SELECT ccus AS VALOR FROM CENTRO_CUSTOS' +
      ' WHERE COD_CCUS = ' + vCodCusto +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
  if (fNomeCentroCusto = '') and (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.FieldByName('COD_CCUS').AsString := '';
  Result := fNomeCentroCusto <> '';
end;

function TOutrasReceitasOuCreditosSPEDPC._existeContaContabil: Boolean;
begin
  fNomeContaAnalitica := Trim(retornaValor(
      'SELECT nome_cta AS VALOR FROM P_CONTAS_CONTABIL' +
      ' WHERE cod_cta = ' + QuotedStr(dataSet.FieldByName('cod_cta').AsString) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
  if (fNomeContaAnalitica = '') and (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.FieldByName('cod_cta').AsString := '';
  Result := fNomeContaAnalitica <> '';
end;

function TOutrasReceitasOuCreditosSPEDPC._existeParticipante: Boolean;
begin
  fNomeParticipante := Trim(retornaValor(
      'SELECT nome_cliente AS VALOR FROM clientes' +
      ' WHERE cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
  if (fNomeParticipante = '') and (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.FieldByName('cod_cliente').Value := Null;
  Result := fNomeParticipante <> '';
end;

function TOutrasReceitasOuCreditosSPEDPC._inserirAcaoJud: Boolean;
begin
  Result := False;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_PROC_REF_ACAO_JUDICIAL');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    vProcRef.DataSet.Insert;
    vProcRef.DataSet.FieldByName('COD_PROC').AsString := Trim(vDadosIni.vPesquisa);
    vProcRef.DataSet.FieldByName('TAB_PROC').AsString := Trim('SPED_PROC_REF_ACAO_JUDICIAL');
    vProcRef.num_proc := retornaValor(
      'SELECT NUM_PROC AS VALOR FROM SPED_PROC_REF_ACAO_JUDICIAL WHERE COD_ACAO_JUDICIAL = ' + vDadosIni.vPesquisa);
    vProcRef.DataSet.FieldByName('NUM_PROC').AsString := vProcRef.num_proc;
    Result := True;
  end;
end;

function TOutrasReceitasOuCreditosSPEDPC._inserirProcAdm: Boolean;
begin
  Result := False;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_PROC_REF_ADMINISTRATIVO');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    vProcRef.DataSet.Insert;
    vProcRef.DataSet.FieldByName('COD_PROC').AsString := Trim(vDadosIni.vPesquisa);
    vProcRef.DataSet.FieldByName('TAB_PROC').AsString := Trim('SPED_PROC_REF_ADMINISTRATIVO');
    vProcRef.num_proc := Trim(retornaValor(
      'SELECT NUM_PROC AS VALOR FROM SPED_PROC_REF_ADMINISTRATIVO WHERE COD_ADM = ' + vDadosIni.vPesquisa));
    vProcRef.DataSet.FieldByName('NUM_PROC').AsString := vProcRef.num_proc;
    Result := True;
  end;
end;

function TOutrasReceitasOuCreditosSPEDPC._restauralixeira: boolean;
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
            vDadosIni.GravaAuditoria('SPED028', 'RESTAURAR REGISTRO', 'SUCESSO',
              'SPED_OUTRAS_RECEITAS_CREDITOS', dataSet.FieldByName('COD_REC_CRED').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('SPED028', 'RESTAURAR REGISTRO', 'FALHA',
              'SPED_OUTRAS_RECEITAS_CREDITOS', dataSet.FieldByName('COD_REC_CRED').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação',  0 + 64);
  Refresh;
end;

function TOutrasReceitasOuCreditosSPEDPC._salvarProcessoRef: Boolean;
begin
  Result := True;
  if Trim(vProcRef.ind_proc) = '' then
    vProcRef.ind_proc:= '0';
  if not (Trim(vProcRef.ind_proc)[1] in ['1', '3', '9']) then
  begin
    Result := False;
    Application.MessageBox('Indicador de Origem do Processo inválido', 'Atenção', 0 + 64);
    Exit;
  end;

  vProcRef.DataSet.FieldByName('IND_PROC').AsString := Trim(vProcRef.ind_proc);
  vProcRef.DataSet.Post;
end;

function TOutrasReceitasOuCreditosSPEDPC._statuslixeira: boolean;
begin
  Result := ExecutaComandosSql('Select first 1 COD_REC_CRED from SPED_OUTRAS_RECEITAS_CREDITOS' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

{ TCredDepreciacaoAmortBem }

procedure TCredDepreciacaoAmortBem.cadCredDepreciacaoAmortBem(
  TipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Créditos de Depreciação Amortização de Bens');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := TipoForm;

    if not vDadosIni.PesqPros('SPED030', 'CONSULTA', '', 'SPED_DEPREC_AMORT_BENS', '',
      dtmSPED.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadSpedPCDeprecAmortBem = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadSpedPCDeprecAmortBem, frmCadSpedPCDeprecAmortBem);
    end;

    if (TipoForm > 0) and (not frmCadSpedPCDeprecAmortBem.Visible) then
      frmCadSpedPCDeprecAmortBem.ShowModal
    else if (not frmCadSpedPCDeprecAmortBem.Visible) then
      frmCadSpedPCDeprecAmortBem.Show
    else if frmCadSpedPCDeprecAmortBem.FormStyle = fsMDIChild then
      frmCadSpedPCDeprecAmortBem.Show
    else
      frmCadSpedPCDeprecAmortBem.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TCredDepreciacaoAmortBem.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsCredDepr);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);

  vProcRef.dataSet := TClientDataSet.Create(Application);
  vProcRef.dataSet.FieldDefs.Add('NUM_PROC', ftString, 20, False);
  vProcRef.dataSet.FieldDefs.Add('IND_PROC', ftString, 48, False);
  vProcRef.dataSet.FieldDefs.Add('COD_PROC', ftString, 20, False);
  vProcRef.dataSet.FieldDefs.Add('TAB_PROC', ftString, 48, False);

  try
    vProcRef.dataSet.CreateDataSet;
  finally
  end;
end;

function TCredDepreciacaoAmortBem.delete: Boolean;
var
  codCred: string;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED034', 'EXCLUIR', 'COD _DEPREC ' + dataSet.FieldByName('COD_DEPREC').AsString, 'SPED_DEPREC_AMORT_BENS', '',
    buscas, True) then
    exit;

  codCred := dataSet.FieldByName('COD_DEPREC').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      result := inherited Delete;
      if Apply then
        if CommitaTransacao then
          if Result then
            vDadosIni.GravaAuditoria('SPED034', 'EXCLUIR', 'SUCESSO', 'SPED_DEPREC_AMORT_BENS', codCred, buscas)
          else
            vDadosIni.GravaAuditoria('SPED034', 'EXCLUIR', 'FALHA', 'SPED_DEPREC_AMORT_BENS', codCred, buscas);
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
              vDadosIni.GravaAuditoria('SPED034', 'ENVIAR REGISTRO PARA A LIXEIRA',
                'SUCESSO', 'SPED_DEPREC_AMORT_BENS', codCred, buscas)
            else
              vDadosIni.GravaAuditoria('SPED034', 'ENVIAR REGISTRO PARA A LIXEIRA ',
                'FALHA', 'SPED_DEPREC_AMORT_BENS', codCred, buscas);
        Result := true;
      end;
    end;
  Refresh;
end;

destructor TCredDepreciacaoAmortBem.Destroy;
begin
  vProcRef.dataSet.Free;
  vProcRef.dataSet := nil;

  inherited;
end;

function TCredDepreciacaoAmortBem.edit: Boolean;
var
  vListaTemp: TStringList;
  I: Integer;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED033', 'ALTERAR',
    'COD DEPREC ' + dataSet.FieldByName('COD_DEPREC').AsString, 'SPED_DEPREC_AMORT_BENS', '',
    buscas, True) then
    exit;

  if (not dataSet.Active) or (dataSet.IsEmpty) then
    Exit;

  vProcRef.dataSet.EmptyDataSet;

  if Trim(dataSet.FieldByName('processos_ref').AsString) <> '' then
  begin
    vListaTemp := TStringList.Create;
    try
      vListaTemp.Clear;

      vListaTemp.Text := dataSet.FieldByName('processos_ref').AsString;

      for I := 0 to vListaTemp.Count - 1 do
      begin
        vProcRef.dataSet.Insert;
        vProcRef.dataSet.FieldByName('num_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],1);
        vProcRef.dataSet.FieldByName('ind_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],2);
        vProcRef.dataSet.FieldByName('cod_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],3);
        vProcRef.dataSet.FieldByName('tab_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],4);
        vProcRef.dataSet.Post;
      end;
    finally
      vListaTemp.Free;
    end;
  end;

  if inherited Edit then
    Result := True;

end;

function TCredDepreciacaoAmortBem.insert: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED032', 'INCLUIR', '', 'SPED_DEPREC_AMORT_BENS', '',
    buscas, True) then
    exit;

  if not dataSet.Active then
  begin
    montaSelect('select * from SPED_DEPREC_AMORT_BENS' +
      ' where COD_DEPREC = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
  end;

  vProcRef.dataSet.EmptyDataSet;

  if inherited insert then
  begin

    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('IND_UTIL_BEM_IMOB').AsInteger := 9;
    dataSet.FieldByName('IDENT_BEM_IMOB').AsString := '99';
    Result := True;

  end;
end;

function TCredDepreciacaoAmortBem.post: Boolean;
var
  acao: string;
  vListaTemp: TStringList;
begin
  try

    Result := false;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('SPED035', acao, 'CODIGO ' + dataSet.FieldByName('COD_DEPREC').AsString,
      'SPED_DEPREC_AMORT_BENS', '', buscas, True) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if Trim(dataSet.FieldByName('NAT_BC_CRED').AsString) = '' then
      raiseExceptionCreate('Código da Natureza da Base de Cálculo do Credito deve ser preenchido', 'DBComboBox3' );

    if Trim(dataSet.FieldByName('IDENT_BEM_IMOB').AsString) = '' then
      raiseExceptionCreate('Identificação dos Bens/Grupo deve ser preenchida', 'DBRadioGroup2' );

    if Trim(dataSet.FieldByName('IND_UTIL_BEM_IMOB').AsString) = '' then
      raiseExceptionCreate('Indicador da Utilização dos Bens/Grupo deve ser preenchido', 'DBRadioGroup3' );

    if Trim(dataSet.FieldByName('DATA_OPERACAO').AsString) = '' then
      raiseExceptionCreate('Data da Operação deve ser preenchida', 'DBEdit5' );

    if dataSet.FieldByName('VL_OPER_DEP').AsFloat <= 0 then
      raiseExceptionCreate('Valor da operação não deve ser menor ou igual a zero', 'DBEdit7' );

    if Trim(dataSet.FieldByName('cst_pis').AsString) = '' then
      raiseExceptionCreate('CST do PIS deve ser preenchido', 'DBComboBox1' );

    if Trim(dataSet.FieldByName('cst_cofins').AsString) = '' then
      raiseExceptionCreate('CST do COFINS deve ser preenchido', 'DBComboBox2' );

    if Trim(dataSet.FieldByName('cst_pis').AsString) <>
      Trim(dataSet.FieldByName('cst_cofins').AsString) then
      raiseExceptionCreate('CST PIS difere do CST COFINS', 'DBComboBox1' );

    if dataSet.FieldByName('VL_BC_PIS').AsFloat <>
      dataSet.FieldByName('VL_BC_COFINS').AsFloat then
      raiseExceptionCreate('Base Cálculo do PIS deve ser igual a Base de Cálculo do COFINS', 'DBEdit8' );

    if (Trim(dataSet.FieldByName('cst_pis').AsString)[1] in ['5', '6']) or
      (Trim(dataSet.FieldByName('cst_pis').AsString)[2] in ['1', '2', '3', '5']) then
    else
    begin
      dataSet.FieldByName('VL_PIS').AsFloat := 0;
      dataSet.FieldByName('VL_BC_PIS').AsFloat := 0;
      dataSet.FieldByName('ALIQ_PIS').AsFloat := 0;
      dataSet.FieldByName('VL_COFINS').AsFloat := 0;
      dataSet.FieldByName('VL_BC_COFINS').AsFloat := 0;
      dataSet.FieldByName('ALIQ_COFINS').AsFloat := 0;
    end;

    if not vProcRef.dataSet.IsEmpty then
    begin
      vListaTemp := TStringList.Create;
      vListaTemp.Clear;
      try
        vProcRef.dataSet.First;
        while not vProcRef.dataSet.Eof do
        begin
          vListaTemp.Add(
            Trim(vProcRef.dataSet.FieldByName('num_proc').AsString) + '|' +
            copy(Trim(vProcRef.dataSet.FieldByName('ind_proc').AsString),1,1) + '|' +
            Trim(vProcRef.dataSet.FieldByName('cod_proc').AsString) + '|' +
            Trim(vProcRef.dataSet.FieldByName('tab_proc').AsString) + '|'
          );
          vProcRef.dataSet.Next;
        end;
        dataSet.FieldByName('processos_ref').AsString := vListaTemp.Text;
      finally
        vListaTemp.Free;
      end;
    end;

    if dataSet.State = dsInsert then
        dataSet.FieldByName('COD_DEPREC').AsInteger :=
          Gencodigo('SPED_DEPREC_AMORT_BENS', dtmSPED.SpIncCodigo, vDadosIni.codEmpresa);

    dataSet.Post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED035', acao, 'COD DEPREC ' + dataSet.FieldByName('COD_DEPREC').AsString+
      ' SALVO COM SUCESSO', 'SPED_DEPREC_AMORT_BENS', '', buscas);

    Result := true;

    Refresh;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao salvar. Erro: ' + e.Message), 'Atenção', 0
        + 64);
      registraErro('function TCredDepreciacaoAmortBem.post Erro: ' + e.Message);
    end;
  end;
end;

function TCredDepreciacaoAmortBem._abrelixeira: boolean;
begin
  if not _statuslixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select * FROM SPED_DEPREC_AMORT_BENS' +
      ' WHERE cod_empresa  = ' + vDadosIni.codEmpresa +
      ' and ativo = 0');
end;

function TCredDepreciacaoAmortBem._calcularPISCOFINS: Boolean;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if Trim(dataSet.FieldByName('cst_pis').AsString) = '' then
    exit;

  dataSet.FieldByName('VL_BC_PIS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_OPER_DEP').AsFloat -
      dataSet.FieldByName('PARC_OPER_NAO_BC_CRED').AsFloat, 2 );
  dataSet.FieldByName('VL_BC_COFINS').AsFloat := dataSet.FieldByName('VL_BC_PIS').AsFloat;

  if (Trim(dataSet.FieldByName('cst_pis').AsString)[1] in ['5', '6']) or
    (Trim(dataSet.FieldByName('cst_pis').AsString)[2] in ['1', '2', '3', '5']) then
  begin
    if dataSet.FieldByName('ALIQ_PIS').Value = Null then
      dataSet.FieldByName('ALIQ_PIS').AsFloat := vDadosIni.vEmp.vAliqPIS;
    if dataSet.FieldByName('ALIQ_COFINS').Value = Null then
      dataSet.FieldByName('ALIQ_COFINS').AsFloat := vDadosIni.vEmp.vAliqCOFINS;
  end
  else
  begin
    dataSet.FieldByName('VL_PIS').AsFloat := 0;
    dataSet.FieldByName('VL_BC_PIS').AsFloat := 0;
    dataSet.FieldByName('ALIQ_PIS').AsFloat := 0;
    dataSet.FieldByName('VL_COFINS').AsFloat := 0;
    dataSet.FieldByName('VL_BC_COFINS').AsFloat := 0;
    dataSet.FieldByName('ALIQ_COFINS').AsFloat := 0;
  end;

  dataSet.FieldByName('VL_BC_PIS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_PIS').AsFloat, 2);
  dataSet.FieldByName('VL_BC_COFINS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_COFINS').AsFloat, 2);

  dataSet.FieldByName('VL_PIS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_PIS').AsFloat *
    dataSet.FieldByName('ALIQ_PIS').AsFloat / 100, 2);

  dataSet.FieldByName('VL_COFINS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_COFINS').AsFloat *
    dataSet.FieldByName('ALIQ_COFINS').AsFloat / 100, 2);

end;

function TCredDepreciacaoAmortBem._existeCentroCusto: Boolean;
var
  vCodCusto: String;
begin
  vCodCusto := Trim(dataSet.FieldByName('COD_CCUS').AsString);
  if vCodCusto = '' then
    vCodCusto := '0';
  fNomeCentroCusto := Trim(retornaValor(
      'SELECT ccus AS VALOR FROM CENTRO_CUSTOS' +
      ' WHERE COD_CCUS = ' + vCodCusto +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
  if (fNomeCentroCusto = '') and (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.FieldByName('COD_CCUS').AsString := '';
  Result := fNomeCentroCusto <> '';
end;

function TCredDepreciacaoAmortBem._existeContaContabil: Boolean;
begin
  fNomeContaAnalitica := Trim(retornaValor(
      'SELECT nome_cta AS VALOR FROM P_CONTAS_CONTABIL' +
      ' WHERE cod_cta = ' + QuotedStr(dataSet.FieldByName('cod_cta').AsString) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
  if (fNomeContaAnalitica = '') and (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.FieldByName('cod_cta').AsString := '';
  Result := fNomeContaAnalitica <> '';
end;

function TCredDepreciacaoAmortBem._inserirAcaoJud: Boolean;
begin
  Result := False;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_PROC_REF_ACAO_JUDICIAL');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    vProcRef.DataSet.Insert;
    vProcRef.DataSet.FieldByName('COD_PROC').AsString := Trim(vDadosIni.vPesquisa);
    vProcRef.DataSet.FieldByName('TAB_PROC').AsString := Trim('SPED_PROC_REF_ACAO_JUDICIAL');
    vProcRef.num_proc := retornaValor(
      'SELECT NUM_PROC AS VALOR FROM SPED_PROC_REF_ACAO_JUDICIAL WHERE COD_ACAO_JUDICIAL = ' + vDadosIni.vPesquisa);
    vProcRef.DataSet.FieldByName('NUM_PROC').AsString := vProcRef.num_proc;
    Result := True;
  end;
end;

function TCredDepreciacaoAmortBem._inserirProcAdm: Boolean;
begin
  Result := False;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_PROC_REF_ADMINISTRATIVO');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    vProcRef.DataSet.Insert;
    vProcRef.DataSet.FieldByName('COD_PROC').AsString := Trim(vDadosIni.vPesquisa);
    vProcRef.DataSet.FieldByName('TAB_PROC').AsString := Trim('SPED_PROC_REF_ADMINISTRATIVO');
    vProcRef.num_proc := Trim(retornaValor(
      'SELECT NUM_PROC AS VALOR FROM SPED_PROC_REF_ADMINISTRATIVO WHERE COD_ADM = ' + vDadosIni.vPesquisa));
    vProcRef.DataSet.FieldByName('NUM_PROC').AsString := vProcRef.num_proc;
    Result := True;
  end;
end;

function TCredDepreciacaoAmortBem._restauralixeira: boolean;
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
            vDadosIni.GravaAuditoria('SPED036', 'RESTAURAR REGISTRO', 'SUCESSO',
              'SPED_DEPREC_AMORT_BENS', dataSet.FieldByName('COD_DEPREC').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('SPED036', 'RESTAURAR REGISTRO', 'FALHA',
              'SPED_DEPREC_AMORT_BENS', dataSet.FieldByName('COD_DEPREC').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação',  0 + 64);
  Refresh;
end;

function TCredDepreciacaoAmortBem._salvarProcessoRef: Boolean;
begin
  Result := True;
  if Trim(vProcRef.ind_proc) = '' then
    vProcRef.ind_proc:= '0';
  if not (Trim(vProcRef.ind_proc)[1] in ['1', '3', '9']) then
  begin
    Result := False;
    Application.MessageBox('Indicador de Origem do Processo inválido', 'Atenção', 0 + 64);
    Exit;
  end;

  vProcRef.DataSet.FieldByName('IND_PROC').AsString := Trim(vProcRef.ind_proc);
  vProcRef.DataSet.Post;
end;

function TCredDepreciacaoAmortBem._statuslixeira: boolean;
begin
  Result := ExecutaComandosSql('Select first 1 COD_DEPREC from SPED_DEPREC_AMORT_BENS' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

{ TCredAquisicaoBem }

procedure TCredAquisicaoBem.cadCredAquisicaoBem(TipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Créditos de Depreciação Amortização de Bens');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := TipoForm;

    if not vDadosIni.PesqPros('SPED038', 'CONSULTA', '', 'SPED_AQUISICAO_BENS', '',
      dtmSPED.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadSpedPCAquisicaoBem = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadSpedPCAquisicaoBem, frmCadSpedPCAquisicaoBem);
    end;

    if (TipoForm > 0) and (not frmCadSpedPCAquisicaoBem.Visible) then
      frmCadSpedPCAquisicaoBem.ShowModal
    else if (not frmCadSpedPCAquisicaoBem.Visible) then
      frmCadSpedPCAquisicaoBem.Show
    else if frmCadSpedPCAquisicaoBem.FormStyle = fsMDIChild then
      frmCadSpedPCAquisicaoBem.Show
    else
      frmCadSpedPCAquisicaoBem.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TCredAquisicaoBem.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsAqBem);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);

  vProcRef.dataSet := TClientDataSet.Create(Application);
  vProcRef.dataSet.FieldDefs.Add('NUM_PROC', ftString, 20, False);
  vProcRef.dataSet.FieldDefs.Add('IND_PROC', ftString, 48, False);
  vProcRef.dataSet.FieldDefs.Add('COD_PROC', ftString, 20, False);
  vProcRef.dataSet.FieldDefs.Add('TAB_PROC', ftString, 48, False);

  try
    vProcRef.dataSet.CreateDataSet;
  finally
  end;
end;

function TCredAquisicaoBem.delete: Boolean;
var
  codAquisicao: string;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED042', 'EXCLUIR', 'COD AQUISICAO ' + dataSet.FieldByName('COD_AQUISICAO').AsString, 'SPED_AQUISICAO_BENS', '',
    buscas, True) then
    exit;

  codAquisicao := dataSet.FieldByName('COD_AQUISICAO').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      result := inherited Delete;
      if Apply then
        if CommitaTransacao then
          if Result then
            vDadosIni.GravaAuditoria('SPED042', 'EXCLUIR', 'SUCESSO', 'SPED_AQUISICAO_BENS', codAquisicao, buscas)
          else
            vDadosIni.GravaAuditoria('SPED042', 'EXCLUIR', 'FALHA', 'SPED_AQUISICAO_BENS', codAquisicao, buscas);
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
              vDadosIni.GravaAuditoria('SPED042', 'ENVIAR REGISTRO PARA A LIXEIRA',
                'SUCESSO', 'SPED_AQUISICAO_BENS', codAquisicao, buscas)
            else
              vDadosIni.GravaAuditoria('SPED042', 'ENVIAR REGISTRO PARA A LIXEIRA ',
                'FALHA', 'SPED_AQUISICAO_BENS', codAquisicao, buscas);
        Result := true;
      end;
    end;
  Refresh;
end;

destructor TCredAquisicaoBem.Destroy;
begin
  vProcRef.dataSet.Free;
  vProcRef.dataSet := nil;

  inherited;
end;

function TCredAquisicaoBem.edit: Boolean;
var
  vListaTemp: TStringList;
  I: Integer;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED041', 'ALTERAR',
    'COD AQUISICAO ' + dataSet.FieldByName('COD_AQUISICAO').AsString, 'SPED_AQUISICAO_BENS', '',
    buscas, True) then
    exit;

  if (not dataSet.Active) or (dataSet.IsEmpty) then
    Exit;

  vProcRef.dataSet.EmptyDataSet;

  if Trim(dataSet.FieldByName('processos_ref').AsString) <> '' then
  begin
    vListaTemp := TStringList.Create;
    try
      vListaTemp.Clear;

      vListaTemp.Text := dataSet.FieldByName('processos_ref').AsString;

      for I := 0 to vListaTemp.Count - 1 do
      begin
        vProcRef.dataSet.Insert;
        vProcRef.dataSet.FieldByName('num_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],1);
        vProcRef.dataSet.FieldByName('ind_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],2);
        vProcRef.dataSet.FieldByName('cod_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],3);
        vProcRef.dataSet.FieldByName('tab_proc').AsString := vDadosIni.getCampoPipe(vListaTemp[I],4);
        vProcRef.dataSet.Post;
      end;
    finally
      vListaTemp.Free;
    end;
  end;

  if inherited Edit then
    Result := True;

end;

function TCredAquisicaoBem.insert: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED040', 'INCLUIR', '', 'SPED_AQUISICAO_BENS', '',
    buscas, True) then
    exit;

  if not dataSet.Active then
  begin
    montaSelect('select * from SPED_AQUISICAO_BENS' +
      ' where cod_aquisicao = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
  end;

  vProcRef.dataSet.EmptyDataSet;

  if inherited insert then
  begin

    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('IND_UTIL_BEM_IMOB').AsInteger := 9;
    dataSet.FieldByName('IDENT_BEM_IMOB').AsString := '99';
    dataSet.FieldByName('NAT_BC_CRED').AsString := '10';
    Result := True;

  end;
end;

function TCredAquisicaoBem.post: Boolean;
var
  acao: string;
  vListaTemp: TStringList;
begin
  try

    Result := false;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('SPED043', acao, 'COD AQUISICAO ' + dataSet.FieldByName('COD_AQUISICAO').AsString,
      'SPED_AQUISICAO_BENS', '', buscas, True) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if Trim(dataSet.FieldByName('NAT_BC_CRED').AsString) = '' then
      raiseExceptionCreate('Código da Natureza da Base de Cálculo do Credito deve ser preenchido', 'DBComboBox3' );

    if Trim(dataSet.FieldByName('IDENT_BEM_IMOB').AsString) = '' then
      raiseExceptionCreate('Identificação dos Bens/Grupo deve ser preenchida', 'DBRadioGroup2' );

    if Trim(dataSet.FieldByName('IND_UTIL_BEM_IMOB').AsString) = '' then
      raiseExceptionCreate('Indicador da Utilização dos Bens/Grupo deve ser preenchido', 'DBRadioGroup3' );

    if dataSet.FieldByName('IND_NR_PARC').AsInteger = 0 then
      raiseExceptionCreate('Indicador do Número de Parcelas a serem apropriadas deve ser preenchido', 'DBRadioGroup4' );

    if Trim(dataSet.FieldByName('data_inicial').AsString) = '' then
      raiseExceptionCreate('Data Inicial da Apropriação deve ser preenchida', 'DBEdit5' );

    if dataSet.FieldByName('VL_OPER_AQUIS').AsFloat <= 0 then
      raiseExceptionCreate('Valor da operação não deve ser menor ou igual a zero', 'DBEdit7' );

    if Trim(dataSet.FieldByName('cst_pis').AsString) = '' then
      raiseExceptionCreate('CST do PIS deve ser preenchido', 'DBComboBox1' );

    if Trim(dataSet.FieldByName('cst_cofins').AsString) = '' then
      raiseExceptionCreate('CST do COFINS deve ser preenchido', 'DBComboBox2' );

    if Trim(dataSet.FieldByName('cst_pis').AsString) <>
      Trim(dataSet.FieldByName('cst_cofins').AsString) then
      raiseExceptionCreate('CST PIS difere do CST COFINS', 'DBComboBox1' );

    if dataSet.FieldByName('VL_BC_PIS').AsFloat <>
      dataSet.FieldByName('VL_BC_COFINS').AsFloat then
      raiseExceptionCreate('Base Cálculo do PIS deve ser igual a Base de Cálculo do COFINS', 'DBEdit8' );

    if (Trim(dataSet.FieldByName('cst_pis').AsString)[1] in ['5', '6']) or
      (Trim(dataSet.FieldByName('cst_pis').AsString)[2] in ['1', '2', '3', '5']) then
    else
    begin
      dataSet.FieldByName('VL_PIS').AsFloat := 0;
      dataSet.FieldByName('VL_BC_PIS').AsFloat := 0;
      dataSet.FieldByName('ALIQ_PIS').AsFloat := 0;
      dataSet.FieldByName('VL_COFINS').AsFloat := 0;
      dataSet.FieldByName('VL_BC_COFINS').AsFloat := 0;
      dataSet.FieldByName('ALIQ_COFINS').AsFloat := 0;
    end;

    if not vProcRef.dataSet.IsEmpty then
    begin
      vListaTemp := TStringList.Create;
      vListaTemp.Clear;
      try
        vProcRef.dataSet.First;
        while not vProcRef.dataSet.Eof do
        begin
          vListaTemp.Add(
            Trim(vProcRef.dataSet.FieldByName('num_proc').AsString) + '|' +
            copy(Trim(vProcRef.dataSet.FieldByName('ind_proc').AsString),1,1) + '|' +
            Trim(vProcRef.dataSet.FieldByName('cod_proc').AsString) + '|' +
            Trim(vProcRef.dataSet.FieldByName('tab_proc').AsString) + '|'
          );
          vProcRef.dataSet.Next;
        end;
        dataSet.FieldByName('processos_ref').AsString := vListaTemp.Text;
      finally
        vListaTemp.Free;
      end;
    end;

    if dataSet.State = dsInsert then
        dataSet.FieldByName('COD_AQUISICAO').AsInteger :=
          Gencodigo('SPED_AQUISICAO_BENS', dtmSPED.SpIncCodigo, vDadosIni.codEmpresa);

    dataSet.Post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED043', acao, 'COD AQUISIÇÃO ' + dataSet.FieldByName('COD_AQUISICAO').AsString+
      ' SALVO COM SUCESSO', 'SPED_AQUISICAO_BENS', '', buscas);

    Result := true;

    Refresh;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao salvar. Erro: ' + e.Message), 'Atenção', 0
        + 64);
      registraErro('function TCredAquisicaoBem.post Erro: ' + e.Message);
    end;
  end;
end;

function TCredAquisicaoBem._abrelixeira: boolean;
begin
  if not _statuslixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select * FROM SPED_AQUISICAO_BENS' +
      ' WHERE cod_empresa  = ' + vDadosIni.codEmpresa +
      ' and ativo = 0');
end;

function TCredAquisicaoBem._calcularPISCOFINS: Boolean;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if Trim(dataSet.FieldByName('cst_pis').AsString) = '' then
    exit;

  dataSet.FieldByName('VL_BC_CRED').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_OPER_AQUIS').AsFloat -
      dataSet.FieldByName('PARC_OPER_NAO_BC_CRED').AsFloat, 2 );

  if dataSet.FieldByName('IND_NR_PARC').AsInteger = 1 then
    dataSet.FieldByName('QTDE_PARCELAS').AsInteger := 1
  else if dataSet.FieldByName('IND_NR_PARC').AsInteger = 2 then
    dataSet.FieldByName('QTDE_PARCELAS').AsInteger := 12
  else if dataSet.FieldByName('IND_NR_PARC').AsInteger = 3 then
    dataSet.FieldByName('QTDE_PARCELAS').AsInteger := 24
  else if dataSet.FieldByName('IND_NR_PARC').AsInteger = 4 then
    dataSet.FieldByName('QTDE_PARCELAS').AsInteger := 48
  else if dataSet.FieldByName('IND_NR_PARC').AsInteger = 5 then
    dataSet.FieldByName('QTDE_PARCELAS').AsInteger := 6;

  if dataSet.FieldByName('QTDE_PARCELAS').AsInteger <= 0 then
    dataSet.FieldByName('QTDE_PARCELAS').AsInteger := 1;


  dataSet.FieldByName('data_final').AsDateTime :=
    IncMonth(dataSet.FieldByName('data_inicial').AsDateTime,dataSet.FieldByName('QTDE_PARCELAS').AsInteger);


  dataSet.FieldByName('VL_BC_PIS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_CRED').AsFloat / dataSet.FieldByName('QTDE_PARCELAS').AsInteger, 2 );

  dataSet.FieldByName('VL_BC_COFINS').AsFloat := dataSet.FieldByName('VL_BC_PIS').AsFloat;

  if (Trim(dataSet.FieldByName('cst_pis').AsString)[1] in ['5', '6']) or
    (Trim(dataSet.FieldByName('cst_pis').AsString)[2] in ['1', '2', '3', '5']) then
  begin
    if dataSet.FieldByName('ALIQ_PIS').Value = Null then
      dataSet.FieldByName('ALIQ_PIS').AsFloat := vDadosIni.vEmp.vAliqPIS;
    if dataSet.FieldByName('ALIQ_COFINS').Value = Null then
      dataSet.FieldByName('ALIQ_COFINS').AsFloat := vDadosIni.vEmp.vAliqCOFINS;
  end
  else
  begin
    dataSet.FieldByName('VL_PIS').AsFloat := 0;
    dataSet.FieldByName('VL_BC_PIS').AsFloat := 0;
    dataSet.FieldByName('ALIQ_PIS').AsFloat := 0;
    dataSet.FieldByName('VL_COFINS').AsFloat := 0;
    dataSet.FieldByName('VL_BC_COFINS').AsFloat := 0;
    dataSet.FieldByName('ALIQ_COFINS').AsFloat := 0;
  end;

  dataSet.FieldByName('VL_BC_PIS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_PIS').AsFloat, 2);
  dataSet.FieldByName('VL_BC_COFINS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_COFINS').AsFloat, 2);

  dataSet.FieldByName('VL_PIS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_PIS').AsFloat *
    dataSet.FieldByName('ALIQ_PIS').AsFloat / 100, 2);

  dataSet.FieldByName('VL_COFINS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_COFINS').AsFloat *
    dataSet.FieldByName('ALIQ_COFINS').AsFloat / 100, 2);
end;

function TCredAquisicaoBem._existeCentroCusto: Boolean;
var
  vCodCusto: String;
begin
  vCodCusto := Trim(dataSet.FieldByName('COD_CCUS').AsString);
  if vCodCusto = '' then
    vCodCusto := '0';
  fNomeCentroCusto := Trim(retornaValor(
      'SELECT ccus AS VALOR FROM CENTRO_CUSTOS' +
      ' WHERE COD_CCUS = ' + vCodCusto +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
  if (fNomeCentroCusto = '') and (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.FieldByName('COD_CCUS').AsString := '';
  Result := fNomeCentroCusto <> '';
end;

function TCredAquisicaoBem._existeContaContabil: Boolean;
begin
  fNomeContaAnalitica := Trim(retornaValor(
      'SELECT nome_cta AS VALOR FROM P_CONTAS_CONTABIL' +
      ' WHERE cod_cta = ' + QuotedStr(dataSet.FieldByName('cod_cta').AsString) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
  if (fNomeContaAnalitica = '') and (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.FieldByName('cod_cta').AsString := '';
  Result := fNomeContaAnalitica <> '';
end;

function TCredAquisicaoBem._inserirAcaoJud: Boolean;
begin
  Result := False;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_PROC_REF_ACAO_JUDICIAL');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    vProcRef.DataSet.Insert;
    vProcRef.DataSet.FieldByName('COD_PROC').AsString := Trim(vDadosIni.vPesquisa);
    vProcRef.DataSet.FieldByName('TAB_PROC').AsString := Trim('SPED_PROC_REF_ACAO_JUDICIAL');
    vProcRef.num_proc := retornaValor(
      'SELECT NUM_PROC AS VALOR FROM SPED_PROC_REF_ACAO_JUDICIAL WHERE COD_ACAO_JUDICIAL = ' + vDadosIni.vPesquisa);
    vProcRef.DataSet.FieldByName('NUM_PROC').AsString := vProcRef.num_proc;
    Result := True;
  end;
end;

function TCredAquisicaoBem._inserirProcAdm: Boolean;
begin
  Result := False;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_PROC_REF_ADMINISTRATIVO');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    vProcRef.DataSet.Insert;
    vProcRef.DataSet.FieldByName('COD_PROC').AsString := Trim(vDadosIni.vPesquisa);
    vProcRef.DataSet.FieldByName('TAB_PROC').AsString := Trim('SPED_PROC_REF_ADMINISTRATIVO');
    vProcRef.num_proc := Trim(retornaValor(
      'SELECT NUM_PROC AS VALOR FROM SPED_PROC_REF_ADMINISTRATIVO WHERE COD_ADM = ' + vDadosIni.vPesquisa));
    vProcRef.DataSet.FieldByName('NUM_PROC').AsString := vProcRef.num_proc;
    Result := True;
  end;
end;

function TCredAquisicaoBem._restauralixeira: boolean;
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
            vDadosIni.GravaAuditoria('SPED044', 'RESTAURAR REGISTRO', 'SUCESSO',
              'SPED_AQUISICAO_BENS', dataSet.FieldByName('COD_AQUISICAO').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('SPED044', 'RESTAURAR REGISTRO', 'FALHA',
              'SPED_AQUISICAO_BENS', dataSet.FieldByName('COD_AQUISICAO').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação',  0 + 64);
  Refresh;
end;

function TCredAquisicaoBem._salvarProcessoRef: Boolean;
begin
  Result := True;
  if Trim(vProcRef.ind_proc) = '' then
    vProcRef.ind_proc:= '0';
  if not (Trim(vProcRef.ind_proc)[1] in ['1', '3', '9']) then
  begin
    Result := False;
    Application.MessageBox('Indicador de Origem do Processo inválido', 'Atenção', 0 + 64);
    Exit;
  end;

  vProcRef.DataSet.FieldByName('IND_PROC').AsString := Trim(vProcRef.ind_proc);
  vProcRef.DataSet.Post;
end;

function TCredAquisicaoBem._statuslixeira: boolean;
begin
  Result := ExecutaComandosSql('Select first 1 COD_AQUISICAO from SPED_AQUISICAO_BENS' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

{ TCredEstoqueAbertura }

procedure TCredEstoqueAbertura.cadEstoqueAbertura(TipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Créditos de Estoque de Abertura');
    if dtmSPED = nil then
      dtmSPED := TdtmSPED.Create(dtmSPED);

    vDadosIni.vTipoForm := TipoForm;

    if not vDadosIni.PesqPros('SPED038', 'CONSULTA', '', 'SPED_ESTOQUE_ABERTURA', '',
      dtmSPED.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadSpedPCEstoqueAbertura = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadSpedPCEstoqueAbertura, frmCadSpedPCEstoqueAbertura);
    end;

    if (TipoForm > 0) and (not frmCadSpedPCEstoqueAbertura.Visible) then
      frmCadSpedPCEstoqueAbertura.ShowModal
    else if (not frmCadSpedPCEstoqueAbertura.Visible) then
      frmCadSpedPCEstoqueAbertura.Show
    else if frmCadSpedPCEstoqueAbertura.FormStyle = fsMDIChild then
      frmCadSpedPCEstoqueAbertura.Show
    else
      frmCadSpedPCEstoqueAbertura.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TCredEstoqueAbertura.create;
begin
  if dtmSPED = nil then
    dtmSPED := TdtmSPED.Create(dtmSPED);

  dataSet := TClientDataSet(dtmSPED.cdsEstAb);
  transacao := TIBTransaction(dtmSPED.transacao);
  buscas := TIBQuery(dtmSPED.qrBuscas);
end;

function TCredEstoqueAbertura.delete: Boolean;
var
  codAquisicao: string;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('SPED042', 'EXCLUIR', 'COD ESTQUE ' + dataSet.FieldByName('COD_ESTOQUE').AsString, 'SPED_ESTOQUE_ABERTURA', '',
    buscas, True) then
    exit;

  codAquisicao := dataSet.FieldByName('COD_ESTOQUE').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      result := inherited Delete;
      if Apply then
        if CommitaTransacao then
          if Result then
            vDadosIni.GravaAuditoria('SPED042', 'EXCLUIR', 'SUCESSO', 'SPED_ESTOQUE_ABERTURA', codAquisicao, buscas)
          else
            vDadosIni.GravaAuditoria('SPED042', 'EXCLUIR', 'FALHA', 'SPED_ESTOQUE_ABERTURA', codAquisicao, buscas);
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
              vDadosIni.GravaAuditoria('SPED042', 'ENVIAR REGISTRO PARA A LIXEIRA',
                'SUCESSO', 'SPED_ESTOQUE_ABERTURA', codAquisicao, buscas)
            else
              vDadosIni.GravaAuditoria('SPED042', 'ENVIAR REGISTRO PARA A LIXEIRA ',
                'FALHA', 'SPED_ESTOQUE_ABERTURA', codAquisicao, buscas);
        Result := true;
      end;
    end;
  Refresh;
end;

function TCredEstoqueAbertura.edit: Boolean;
var
  vListaTemp: TStringList;
  I: Integer;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED041', 'ALTERAR',
    'COD ESTOQUE ' + dataSet.FieldByName('COD_ESTOQUE').AsString, 'SPED_ESTOQUE_ABERTURA', '',
    buscas, True) then
    exit;

  if (not dataSet.Active) or (dataSet.IsEmpty) then
    Exit;

  if inherited Edit then
    Result := True;
end;

function TCredEstoqueAbertura.insert: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('SPED040', 'INCLUIR', '', 'SPED_ESTOQUE_ABERTURA', '',
    buscas, True) then
    exit;

  if not dataSet.Active then
  begin
    montaSelect('select * from SPED_ESTOQUE_ABERTURA' +
      ' where cod_estoque = 0 and cod_empresa = ' + vDadosIni.codEmpresa);
  end;

  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('NAT_BC_CRED').AsString := '18';
    Result := True;
  end;

end;

function TCredEstoqueAbertura.post: Boolean;
var
  acao: string;
  vListaTemp: TStringList;
begin
  try

    Result := false;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      acao := 'EDITAR';

    if not vDadosIni.PesqPros('SPED043', acao, 'COD ESTOQUE ' + dataSet.FieldByName('COD_ESTOQUE').AsString,
      'SPED_ESTOQUE_ABERTURA', '', buscas, True) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if Trim(dataSet.FieldByName('NAT_BC_CRED').AsString) = '' then
      raiseExceptionCreate('Código da Natureza da Base de Cálculo do Credito deve ser preenchido', 'DBComboBox3' );

    if Trim(dataSet.FieldByName('data_inicial').AsString) = '' then
      raiseExceptionCreate('Data Inicial da Apropriação deve ser preenchida', 'DBEdit5' );

    if dataSet.FieldByName('VL_TOT_EST').AsFloat <= 0 then
      raiseExceptionCreate('Valor Total do Estoque não deve ser menor ou igual a zero', 'DBEdit7' );

    if Trim(dataSet.FieldByName('cst_pis').AsString) = '' then
      raiseExceptionCreate('CST do PIS deve ser preenchido', 'DBComboBox1' );

    if Trim(dataSet.FieldByName('cst_cofins').AsString) = '' then
      raiseExceptionCreate('CST do COFINS deve ser preenchido', 'DBComboBox2' );

    if Trim(dataSet.FieldByName('cst_pis').AsString) <>
      Trim(dataSet.FieldByName('cst_cofins').AsString) then
      raiseExceptionCreate('CST PIS difere do CST COFINS', 'DBComboBox1' );

    if (Trim(dataSet.FieldByName('cst_pis').AsString)[1] in ['5', '6']) or
      (Trim(dataSet.FieldByName('cst_pis').AsString)[2] in ['1', '2', '3', '5']) then
    else
    begin
      dataSet.FieldByName('VL_PIS').AsFloat := 0;
      dataSet.FieldByName('VL_BC_PIS').AsFloat := 0;
      dataSet.FieldByName('ALIQ_PIS').AsFloat := 0;
      dataSet.FieldByName('VL_COFINS').AsFloat := 0;
      dataSet.FieldByName('VL_BC_COFINS').AsFloat := 0;
      dataSet.FieldByName('ALIQ_COFINS').AsFloat := 0;
    end;

    if dataSet.State = dsInsert then
        dataSet.FieldByName('COD_ESTOQUE').AsInteger :=
          Gencodigo('SPED_ESTOQUE_ABERTURA', dtmSPED.SpIncCodigo, vDadosIni.codEmpresa);

    dataSet.Post;

    if dataSet.ChangeCount = 0 then
    begin
      Result := True;
      exit;
    end;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('SPED043', acao, 'COD ESTOQUE ' + dataSet.FieldByName('COD_ESTOQUE').AsString+
      ' SALVO COM SUCESSO', 'SPED_ESTOQUE_ABERTURA', '', buscas);

    Result := true;

    Refresh;

  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao salvar. Erro: ' + e.Message), 'Atenção', 0
        + 64);
      registraErro('function TCredEstoqueAbertura.post Erro: ' + e.Message);
    end;
  end;

end;

function TCredEstoqueAbertura._abrelixeira: boolean;
begin
  if not _statuslixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', 0 + 64);
    Result := False;
  end
  else
    result := montaSelect('select * FROM SPED_ESTOQUE_ABERTURA' +
      ' WHERE cod_empresa  = ' + vDadosIni.codEmpresa +
      ' and ativo = 0');                               
end;

function TCredEstoqueAbertura._calcularPISCOFINS: Boolean;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if Trim(dataSet.FieldByName('cst_pis').AsString) = '' then
    exit;

  dataSet.FieldByName('VL_BC_EST').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_TOT_EST').AsFloat -
      dataSet.FieldByName('EST_IMP').AsFloat, 2 );

  dataSet.FieldByName('data_final').AsDateTime :=
    IncMonth(dataSet.FieldByName('data_inicial').AsDateTime , 12);


  dataSet.FieldByName('VL_BC_MEN_EST').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_EST').AsFloat / 12, 2 );

  if (Trim(dataSet.FieldByName('cst_pis').AsString)[1] in ['5', '6']) or
    (Trim(dataSet.FieldByName('cst_pis').AsString)[2] in ['1', '2', '3', '5']) then
  begin
    if dataSet.FieldByName('ALIQ_PIS').Value = Null then
      dataSet.FieldByName('ALIQ_PIS').AsFloat := 0.65;
    if dataSet.FieldByName('ALIQ_COFINS').Value = Null then
      dataSet.FieldByName('ALIQ_COFINS').AsFloat := 3.00;
  end
  else
  begin
    dataSet.FieldByName('VL_PIS').AsFloat := 0;
    dataSet.FieldByName('ALIQ_PIS').AsFloat := 0;
    dataSet.FieldByName('VL_COFINS').AsFloat := 0;
    dataSet.FieldByName('ALIQ_COFINS').AsFloat := 0;
  end;

  dataSet.FieldByName('VL_PIS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_MEN_EST').AsFloat *
    dataSet.FieldByName('ALIQ_PIS').AsFloat / 100, 2);

  dataSet.FieldByName('VL_COFINS').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VL_BC_MEN_EST').AsFloat *
    dataSet.FieldByName('ALIQ_COFINS').AsFloat / 100, 2);

end;

function TCredEstoqueAbertura._existeContaContabil: Boolean;
begin
  fNomeContaAnalitica := Trim(retornaValor(
      'SELECT nome_cta AS VALOR FROM P_CONTAS_CONTABIL' +
      ' WHERE cod_cta = ' + QuotedStr(dataSet.FieldByName('cod_cta').AsString) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));
  if (fNomeContaAnalitica = '') and (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.FieldByName('cod_cta').AsString := '';
  Result := fNomeContaAnalitica <> '';
end;

function TCredEstoqueAbertura._restauralixeira: boolean;
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
            vDadosIni.GravaAuditoria('SPED044', 'RESTAURAR REGISTRO', 'SUCESSO',
              'SPED_ESTOQUE_ABERTURA', dataSet.FieldByName('COD_ESTOQUE').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('SPED044', 'RESTAURAR REGISTRO', 'FALHA',
              'SPED_ESTOQUE_ABERTURA', dataSet.FieldByName('COD_ESTOQUE').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + #13 +
        'Não é necessário restaurá-lo', 'Informação',  0 + 64);
  Refresh; 
end;

function TCredEstoqueAbertura._statuslixeira: boolean;
begin
  Result := ExecutaComandosSql('Select first 1 COD_ESTOQUE from SPED_ESTOQUE_ABERTURA' +
    ' where ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

end.
