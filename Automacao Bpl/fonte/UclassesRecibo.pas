unit UclassesRecibo;

interface
uses
  uDataSet_OOP, SysUtils, Classes, IBDatabase, DB, DBClient, Provider, IBQuery,
  IBCustomDataSet, IBStoredProc, windows, Forms;
type
  TRecibo = class;
  TDevedor = class;
  THistoricoRec = class;

  TDepartamentoRec = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreDepto: boolean; overload;
    function abreDepto(pDepto: string): boolean; overload;
  end;

  TColaboradorRec = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreColaborador: boolean; overload;
    function abreColaborador(pDepartamento: string): boolean; overload;
    function abreColaborador(pCodVendedor: Integer; pDepartamento: string = ''): boolean; overload;
    function BuscaPeloCodigo(codigo: integer; pDepartamento: string = ''; pExibirMens: boolean = true): string;
  end;

  TDevedor = class(TDataSet_OOP)
  public
    constructor create;
    function abreBeneficiario: boolean;
    function BuscaPeloCodigo(codigo: integer; pCodigoUnificada: Integer; pExibirMens: boolean = true): string;
  end;

  TPrePosto = class(TDataSet_OOP)
  public
    constructor create;
    function BuscaPeloCodigo(codigo: integer; pCodigoUnificada: Integer): string;
  end;

  TBeneficiario = class(TDataSet_OOP)
    constructor create;
    function BuscaPeloCodigo(codigo: integer; pCodigoUnificada: Integer; pExibirMens: boolean = true): string;
    function retornaNomeCliente(codigo: integer): string;
  end;

  TReciboSimples = class(TDataSet_OOP)
  public
    constructor create;
    function gerarCodigo: string;
    function BuscaPeloCodigo(codigo: integer): string;
    procedure CadReciboSimples(TipoForm: integer);
  var
    vBenef: TBeneficiario;
    vDevedor: TDevedor;
  end;

  TEmpresasUnificadas = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosEmpresas: Boolean;
    function _BuscarEmpresas(vCodEmp: Integer): Boolean;
  end;

  TRecibo = class(TDataSet_OOP)
  public
    constructor create;
    destructor Destroy; override;
    function delete: boolean; override;
    function restaurarLixeira: boolean;
    function abreRecibo: boolean; overload;
    function abreRecibo(pNRecibo: Integer): boolean; overload;
    function abreRecibo(pNRecibo: Integer; pCodEmpresa: Integer): boolean; overload;
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function StatusLixeira: boolean;
    function AbrirLixeira: boolean;
    function BuscaPeloCodigo(codigo: integer; pCodigoUnificada: Integer): string;
    procedure CadRecibo(TipoForm: integer);
    function recebido: boolean;
    function _lixeiraCheia: boolean;
    function abreBaixas: boolean;
    procedure setRecAntecipado(antecipado: boolean);
    function efetuarForma: boolean;
    function detalhesrec: boolean;
    function _existeFormPagamento(numeroVenda: integer; Mensagem: string = ''): boolean;
    function _existeHistorico(numeroVenda: integer; Mensagem: string = ''): boolean;
    function _existeRecebimento(Mensagem: string = ''): boolean;
    function AlterarDepartamento: boolean;
    function retornaNumRec: string;
    function verificarRegistro: boolean;
    function enviarBoletoPorEmail: boolean;
  var
    vEmpresasUnificadas: TEmpresasUnificadas;
    vDepartamento: TDepartamentoRec;
    vColaborador: TColaboradorRec;
    vBenef: TBeneficiario;
    vDevedor: TDevedor;
    vHistRecibo: THistoricoRec;
    vPrep: TPrePosto;
    vDepar: string;
    vCodEmpMult: Integer;
  end;

  THistoricoRec = class(TDataSet_OOP)
  public
    constructor create;
    function abreHistoricoRec(NumRec: integer): boolean;
    function Recebimento(recibo: TRecibo): boolean;
    function insert: boolean; override;
    function post: boolean; override;
    function contaBaixas(recibo: TRecibo): integer;
    function delete(recibo: TRecibo): boolean;
    function _existeHistorico(codigo: integer; nrecibo: string): boolean;
  end;

implementation

uses UdtmRecibo, uDtmAtivo, UCadRecibo, UReciboSimples, Dialogs, uclassefp,
  funcoes, uDadosIni, Variants, StrUtils, Math, config_sistema_class;

procedure abrirRecibo(pTipoForm: Integer);
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Abrindo Recibos');
    vDadosIni.vTipoForm := pTipoForm;
    vDadosIni.vPesquisa := 'CADRECIBO|0|';
    if dtmRecibo = nil then
      dtmRecibo := TdtmRecibo.Create(dtmRecibo);

    if pTipoForm > 0 then
    begin
      vDadosIni.vModalOuChild := 'C';//'M';
      vDadosIni.vTipoForm := 1;
    end
    else
    	vDadosIni.vModalOuChild := 'C';

    if frmCadRecibo = nil then
      Application.CreateForm(TfrmCadRecibo, frmCadRecibo);

    if (pTipoForm > 0) and (not frmCadRecibo.Visible) then
      frmCadRecibo.ShowModal
    else if (not frmCadRecibo.Visible) then
      frmCadRecibo.Show
    else if frmCadRecibo.FormStyle = fsMDIChild then
      frmCadRecibo.Show
    else
      frmCadRecibo.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

exports abrirRecibo;

{ TRecibo }

function TRecibo.abreBaixas: boolean;
begin
  if dataSet.IsEmpty then
    exit;
  vHistRecibo.abreHistoricoRec(dataSet.FieldByName('NRECIBO').AsInteger);
  Result := not vHistRecibo.dataSet.IsEmpty;
  if not Result then
    Application.MessageBox('Sem baixas para o recibo selecionado', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
end;

function TRecibo.abreRecibo: boolean;
begin
  result := montaSelect(' select recibos.*, empresa.identificacao_emp, colaborador.nome_vendedor, depto.nome_depto from Recibos ' +
   ' left join empresa on empresa.cod_empresa = recibos.cod_empresa ' +
   ' left join colaborador on colaborador.cod_vendedor = recibos.cod_us and colaborador.cod_empresa = recibos.cod_empresa ' +
   ' left join depto on depto.cod_depto = recibos.cod_depto ' +
   ' where recibos.ativo = 1 and recibos.cod_empresa = ' + vDadosIni.codEmpresa);
end;

function TRecibo.abreRecibo(pNRecibo: Integer): boolean;
begin
  result := montaSelect(' select recibos.*, empresa.identificacao_emp, colaborador.nome_vendedor, depto.nome_depto from Recibos ' +
   ' left join empresa on empresa.cod_empresa = recibos.cod_empresa ' +
   ' left join colaborador on colaborador.cod_vendedor = recibos.cod_us and colaborador.cod_empresa = recibos.cod_empresa ' +
   ' left join depto on depto.cod_depto = recibos.cod_depto ' +
   ' where recibos.nrecibo = ' + IntToStr(pNRecibo) +
   ' and recibos.cod_empresa = ' + vDadosIni.codEmpresa +
   ' and recibos.ativo = 1');
end;

function TRecibo.AbrirLixeira: boolean;
var
 vTemp: string;
begin
  if not statusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    result := false;
  end
  else
  begin
    result := montaSelect('select recibos.*, empresa.identificacao_emp, colaborador.nome_vendedor, depto.nome_depto from Recibos ' +
     ' left join empresa on empresa.cod_empresa = recibos.cod_empresa ' +
     ' left join colaborador on colaborador.cod_vendedor = recibos.cod_us and colaborador.cod_empresa = recibos.cod_empresa ' +
     ' left join depto on depto.cod_depto = recibos.cod_depto ' +
     ' where recibos.Ativo = 0 and recibos.cod_empresa = ' + vDadosIni.codEmpresa);
  end;
end;

function TRecibo.AlterarDepartamento: boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
   exit;

  if (UpperCase(trim(vDadosIni.vDpto)) = UpperCase(trim(dataSet.FieldByName('NOME_DEPTO').AsString))) then
  begin
    Application.MessageBox(pchar('Departamento do recibo já pertence ao departamento do usuário.'),
      'Atenção',  MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  if not vDepartamento.abreDepto(vDadosIni.vDpto) then
  begin
    Application.MessageBox(pchar('Departamento do usuário não encontrado, favor verificar.'),
      'Atenção',  MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  dataSet.Edit;
  dataSet.FieldByName('COD_DEPTO').AsInteger := vDepartamento.dataSet.FieldByName('COD_DEPTO').AsInteger;
  dataset.FieldByName('COD_US').AsInteger := vDadosIni.vCodUsuario;
  if vDadosIni.vRecibo.HabRecPorDepart then
	  dataSet.FieldByName('NUM_REC_DEP').AsString := retornaNumRec;
  dataSet.Post;
  if (DataSet.ChangeCount = 0) then
    Result := True
  else
    Result := Apply;

  if result then
    result := CommitaTransacao;

  if Result then
    vDadosIni.GravaAuditoria('REC017', 'ALTERAR', 'SUCESSO', 'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas)
  else
    vDadosIni.GravaAuditoria('REC017', 'ALTERAR', 'FALHA', 'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas);

  if Result then
    Refresh;
end;

function TRecibo.BuscaPeloCodigo(codigo: integer; pCodigoUnificada: Integer): string;
begin
  if dataSet.State in [dsEdit, dsInsert] then
  begin
    dataSet.FieldByName('BENEF_CLIENT').AsString := vBenef.BuscaPeloCodigo(codigo, pCodigoUnificada);
    dataSet.FieldByName('LOCALDATA').AsString :=
      trim(vBenef.dataSet.FieldByName('CIDADE').AsString) + ', ' +
      vDadosIni.DataPorExtenso(vDadosIni.getDataBanco(buscas));
  end;
  //  buscas.Close;
  //  buscas.SQL.Clear;
  //  buscas.SQL.Add('select C.COD_CLIENTE, C.NOME_CLIENTE, C.BAIRRO, C.CPFCGC, C.ENDERECO, C.CEP,FONE_CLIENTE, C.CIDADE, E.SIGLA_UF ' +
  //    ' from Clientes c, estados e where C.CODIGO_UF = E.CODIGO_UF and C.ativo = 1 and C.cod_empresa = ' +
  //      vDadosIni.codEmpresa + ' and C.COD_CLIENTE = ' + IntToStr(codigo));
  //  buscas.Open;
  //  result := buscas.FieldByName('NOME_CLIENTE').AsString;
end;

procedure TRecibo.CadRecibo(TipoForm: integer);
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Abrindo Recibos');
    vDadosIni.vTipoForm := TipoForm;
    if dtmRecibo = nil then
      dtmRecibo := TdtmRecibo.Create(dtmRecibo);
    if frmCadRecibo = nil then
      Application.CreateForm(TfrmCadRecibo, frmCadRecibo);
    frmCadRecibo.Show;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TRecibo.create;
begin
	if dtmRecibo = nil then
  	dtmRecibo := tdtmRecibo.Create(dtmRecibo);

  dataSet := TClientDataSet(dtmRecibo.cdsRecibo);
  transacao := TIBTransaction(dtmRecibo.IBTransRecibo);
  buscas := TIBQuery(dtmRecibo.qrBuscas);
  vBenef := TBeneficiario.create;
  vDevedor := TDevedor.create;
  vHistRecibo := THistoricoRec.create;
  vPrep := TPrePosto.create;
  vColaborador := TColaboradorRec.create;
  vDepartamento := TDepartamentoRec.create;
  vEmpresasUnificadas:= TEmpresasUnificadas.create;
end;

function TRecibo.delete: boolean;
var
  sProcesso: string;
begin
  result := false;
  if dataSet.IsEmpty then
    exit;

  sProcesso := IfThen(fint('ativo') = 0, 'REC013', 'REC005');

  if not vDadosIni.PesqPros(sProcesso, 'EXCLUIR', '', 'RECIBOS', dataSet.FieldByName('NRECIBO').AsString) then
    exit;

  if dataSet.FieldByName('Ativo').asInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      exit;

    if _existeRecebimento then
      exit;

    if not _existeHistorico(dataSet.FieldByName('NRECIBO').AsInteger) then
      exit;

    if not _existeFormPagamento(dataSet.FieldByName('NRECIBO').AsInteger) then
      exit;

//    // Atualizar pontos programa de fidelidade
//    if not vDadosIni.setarPontosProgFidelidade(dataSet.FieldByName('NRECIBO').AsInteger,
//      'REC', buscas) then
//    begin
//      RollBackTransacao;
//      Result := false;
//      exit;
//    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from recibos ' +
      ' where nrecibo = ' +  IntToStr(dataSet.FieldByName('NRECIBO').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      Result := True;
      CommitaTransacao;
      vDadosIni.GravaAuditoria('REC013', 'EXCLUIR', 'SUCESSO', 'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas);
    except
      Result := False;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('REC013', 'EXCLUIR', 'FALHA', 'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas);
    end;
  end
  else if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
    //      if not vDadosIni.PesqPros('', dataSet.FieldByName('').AsString,
    //        buscas, true) then
    //        exit;
    if _existeRecebimento then
      exit;

    if not _existeHistorico(dataSet.FieldByName('NRECIBO').AsInteger) then
      exit;

    if not _existeFormPagamento(dataSet.FieldByName('NRECIBO').AsInteger) then
      exit;

    if Edit then
    begin
      dataSet.FieldByName('ATIVO').AsInteger := 0;
      dataSet.FieldByName('RECANT').AsString := 'N';
      dataSet.Post;
      if Apply then
      begin
        if CommitaTransacao then
          result := true;
        vDadosIni.GravaAuditoria(sProcesso, 'EXCLUIR', 'SUCESSO', 'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas);
      end
      else
        vDadosIni.GravaAuditoria(sProcesso, 'EXCLUIR', 'FALHA', 'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas);
    end;
  end;
  Refresh;
end;

destructor TRecibo.Destroy;
begin
  vBenef.Free;
  vBenef := nil;

  vDevedor.Free;
  vDevedor := nil;

  vHistRecibo.Free;
  vHistRecibo := nil;

  vPrep.Free;
  vPrep := nil;

  vColaborador.Free;
  vColaborador := nil;

  vDepartamento.Free;
  vDepartamento := nil;
  
  vEmpresasUnificadas.Free;
  vEmpresasUnificadas := nil;
  
  inherited;
end;

function TRecibo.detalhesrec: boolean;
var
  obFp2: TFormPag2;
begin
  inherited;
  try

//   if vDadosIni.PesqPros('CXL031', CadPendReq.dataSet.fieldbyname('TIPO').AsString+' '+CadPendReq.dataSet.FieldByName('NPED').AsString,CadPendReq.Buscas, True) then
    begin
      obFp2 := TFormPag2.create;
    //  obFp.detalhamentoVenda(CadPendReq.dataSet.FieldByName('NREQ').AsInteger,'REQ');
      obFp2.detalhamentoVenda(dataSet.FieldByName('NRECIBO').AsInteger, '', 'REC',
      	dataset.FieldByName('COD_EMPRESA').AsInteger);
//    obFp.detalhamentoVenda(, CadPendReq.vtipdoc);
    end;
  finally
  end;
end;

function TRecibo.edit: boolean;
begin
  if not dataset.Active then
    montaSelect(' select recibos.*, empresa.identificacao_emp, colaborador.nome_vendedor, depto.nome_depto from recibos ' +
     ' left join empresa on empresa.cod_empresa = recibos.cod_empresa ' +
     ' left join colaborador on colaborador.cod_vendedor = recibos.cod_us and colaborador.cod_empresa = recibos.cod_empresa ' +
     ' left join depto on depto.cod_depto = recibos.cod_depto ' +
     ' where recibos.nrecibo = -1');

  if inherited Edit then
  begin
  	dataSet.FieldByName('STATUS_REC').AsString := trim(dataSet.FieldByName('STATUS_REC').AsString);
    if dataSet.FieldByName('COD_EMP_MULT').IsNull then
      dataSet.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
    vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vDepartamento.abreDepto;
    vDepar := trim(dataSet.FieldByName('NOME_DEPTO').AsString);
    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.PesqPros('REC022', 'HABILITAR', '', 'RECIBOS', '', buscas, true) then
    	vColaborador.abreColaborador(dataSet.FieldByName('NOME_DEPTO').AsString)
    else
      vColaborador.abreColaborador;
    vEmpresasUnificadas._abreTodosEmpresas;  
    Result := true;
  end;
end;

function TRecibo.efetuarForma: boolean;
var
  hdFormPag: THandle;
  vFp2: TComunicacaoFormaPagamento;
begin
  if ((vDadosIni.vEmp.vModoFaturamento <> 'S') or (vDadosIni.vRecibo.ReceberPeloFinanceiro)) then 
  begin
    if (vDadosIni.vEmp.vModoFaturamento = 'S') and (vDadosIni.vSistema <> 'Cxl') then
      if vDadosIni.vRecibo.ReceberPeloFinanceiro then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if not vDadosIni.PesqPros('REC024', 'HABILITAR',
         '"REC" ' + dataSet.FieldByName('NRECIBO').AsString,
         'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas, false) then
         exit;
      end;
    try
      CarregaPacote('pkFormPag', hdFormPag);
      vFp2 := TComunicacaoFormaPagamento.Create;
      vFp2.iniciaFormaPagamento(dataSet.FieldByName('NRECIBO').AsInteger,
        1, 0, dataSet.FieldByName('cod_devedor').AsInteger,
        vDadosIni.vCodUsuario, 'REC', dataSet.FieldByName('valor').AsCurrency);

          //          if vFormPag = nil then
          //            vFormPag := TFormPag.create;
          //          vFormPag.iniciaFormaPagamento(dataSet.FieldByName('nped').AsInteger,
          //            dataSet.FieldByName('cod_cond_pag').AsInteger, 0,
          //            dataSet.FieldByName('cod_cliente').AsInteger,
          //            dataSet.FieldByName('cod_vendedor').AsInteger,
          //            vSing.vTipoVenda, dataSet.FieldByName('valor_total').AsCurrency);
    finally
      UnloadPackage(hdFormPag);
    end;
  end;
end;

function TRecibo.enviarBoletoPorEmail: boolean;
begin
  try
     Result := false;

     if dataSet.IsEmpty then
       exit;

     if not vDadosIni.PesqPros('REC023', 'ENVIAR',
       '"REC" ' + dataSet.FieldByName('NRECIBO').AsString,
       'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas, true) then
       exit;

     buscas.Close;
     buscas.SQL.Text := ' select * from boletas ' +
       ' where num_nf_vnd = :num_nf_vnd and tipo_emissao = ''REC'' ' +
       ' and cod_empresa = :cod_empresa ';
     buscas.ParamByName('num_nf_vnd').AsInteger := dataSet.FieldByName('NRECIBO').AsInteger;
     buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas.Open;

     if buscas.IsEmpty then
     begin
        Application.MessageBox(Pchar('Nenhuma boleta encontrada para este Recibo'), 'Atenção', MB_ICONINFORMATION + MB_OK);
        exit;
     end;
     
     Result := vDadosIni.gerar_boletoNFOS(
     	 dataSet.FieldByName('NRECIBO').AsInteger,
       0,
       'REC',
       dataSet.FieldByName('COD_BENEF').AsInteger,
       '',
       true,
       true,
       vDadosIni.retornaArrayAplicativo,
       vDadosIni.retornaArrayContato(dataSet.FieldByName('COD_BENEF').AsInteger, cBoleto),
       cBoleto);

     if Result then
        vDadosIni.GravaAuditoria('REC023', 'ENVIAR', 'SUCESSO - ' +
        '"REC" ' + dataSet.FieldByName('NRECIBO').AsString,
        'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas)
     else
        vDadosIni.GravaAuditoria('REC023', 'ENVIAR', 'FALHA - ' +
        '"REC" ' + dataSet.FieldByName('NRECIBO').AsString,
        'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas);

   except on E: Exception do
    begin
      vDadosIni.GravaAuditoria('REC023', 'ENVIAR', 'FALHA', 'RECIBOS', '', buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TPedVenda.enviarBoletoPorEmail. Erro: ' + e.Message);
    end;
  end;
end;

function TRecibo.insert: boolean;
begin
  if not dataset.Active then
    montaSelect(' select recibos.*, empresa.identificacao_emp, colaborador.nome_vendedor, depto.nome_depto from recibos ' +
     ' left join empresa on empresa.cod_empresa = recibos.cod_empresa ' +
     ' left join colaborador on colaborador.cod_vendedor = recibos.cod_us and colaborador.cod_empresa = recibos.cod_empresa ' +
     ' left join depto on depto.cod_depto = recibos.cod_depto ' +
     ' where recibos.nrecibo = -1');

  if inherited Insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('COD_EMP_MULT').AsInteger := strToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('DATA_REC').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataset.FieldByName('COD_US').AsInteger := vDadosIni.vCodUsuario;
    vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vDepartamento.abreDepto;
    vDepartamento.dataSet.Locate('NOME_DEPTO', trim(vDadosIni.vDpto), []);
    dataSet.FieldByName('COD_DEPTO').AsInteger := vDepartamento.dataSet.FieldByName('COD_DEPTO').AsInteger;
    vDepar := trim(vDepartamento.dataSet.FieldByName('NOME_DEPTO').AsString);
    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.PesqPros('REC022', 'HABILITAR', '', 'RECIBOS', '', buscas, true) then
    	vColaborador.abreColaborador(vDadosIni.vDpto)
    else
      vColaborador.abreColaborador;
    vDepartamento.abreDepto;
    vEmpresasUnificadas._abreTodosEmpresas;
    vDadosIni.vInibeMensPesqPros := 'S';
    setRecAntecipado(
      //REC016: habilitar a inclusao do recibo ja como antecipado
      vDadosIni.PesqPros('REC016', 'HABILITAR', '', 'RECIBOS',
      '', buscas, true)
    );
    Result := true;
  end;
end;

function TRecibo.post: boolean;
var
  acao, vobscxl: string;
  vnrecibo: Integer;
  vcod_empresa: Integer;
  vDataAtual: TDateTime;
begin
  try
    Result := false;

    vnrecibo     := 0;
    vcod_empresa := 0;

    if not (dataset.State in [dsInsert, dsEdit]) then
      exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    vDataAtual := vDadosIni.getDataBanco(buscas);

    if (vDadosIni.vEmp.vFinanceiroUnificado) then
//    	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
    begin
      if dataSet.FieldByName('COD_EMP_MULT').AsInteger <= 0 then
    if vDadosIni.vRecibo.HabRecPorDepart then
          raiseExceptionCreate('Código Empresa Unificada', 'DBEditCodUnificada2')
        else
          raiseExceptionCreate('Código Empresa Unificada', 'DBEditCodUnificada') ;

      if not vEmpresasUnificadas._BuscarEmpresas(dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
        if vDadosIni.vRecibo.HabRecPorDepart then
          raiseExceptionCreate('Código Empresa Unificada não existe ou não encontrada!', 'DBLookupComboBoxCodUnificada2')
        else
          raiseExceptionCreate('Código Empresa Unificada não existe ou não encontrada!', 'DBLookupComboBoxCodUnificada');
    end
    else
      dataSet.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;  

    if vDadosIni.vRecibo.HabRecPorDepart then
	    if trim(vDepartamento.dataSet.FieldByName('INICIAIS_DEPTO').AsString) = '' then
 			  raiseExceptionCreate('Departamento ' + QuotedStr(trim(vDepartamento.dataSet.FieldByName('NOME_DEPTO').AsString)) +
         ' não esta configurado para emitir recibos.', 'DBLookupComboBox6');

    if vDadosIni.vRecibo.HabRecPorDepart then
      if dataSet.FieldByName('COD_US').AsInteger <= 0 then
        raiseExceptionCreate('Responsável não informado.', 'DBEdit28');

    vDadosIni.vInibeMensPesqPros := 'S';    
    if vDadosIni.PesqPros('REC022', 'HABILITAR', '', 'RECIBOS', '', buscas, true) then
      if vDadosIni.vRecibo.TestarGerenteDepart then
        if ((dataSet.State = dsInsert) and (vDadosIni.vRecibo.HabRecPorDepart)
         or ((dataSet.State <> dsInsert) and (trim(dataSet.FieldByName('NUM_REC_DEP').AsString) <> ''))) then
            if dataSet.FieldByName('COD_US').AsInteger > 0 then
              if vColaborador.BuscaPeloCodigo(dataSet.FieldByName('COD_US').AsInteger, trim(vDepartamento.dataSet.FieldByName('NOME_DEPTO').AsString), false) = '' then
                raiseExceptionCreate('Responsável não pertence ao departamento ' + QuotedStr(trim(vDepartamento.dataSet.FieldByName('NOME_DEPTO').AsString)), 'DBEdit3');

    if dataSet.FieldByName('COD_DEVEDOR').AsInteger > 0 then
	     if vDevedor.BuscaPeloCodigo(dataSet.FieldByName('COD_DEVEDOR').AsInteger,
       	dataSet.FieldByName('COD_EMP_MULT').AsInteger, false) = '' then
					if vDadosIni.vRecibo.HabRecPorDepart then
            raiseExceptionCreate('Campo Recebemos não encontrado.', 'DBEdit25')
       		else
         		raiseExceptionCreate('Campo Nome da pessoa que está pagando não informado.', 'DBEdit10');

    if dataSet.FieldByName('NOME_DEV').AsString = '' then
      if vDadosIni.vRecibo.HabRecPorDepart then
       raiseExceptionCreate('Campo Recebemos não informado.', 'DBEdit23')
      else
	      raiseExceptionCreate('Campo Nome da pessoa que está pagando não informado.', 'DBEdit2');

    if ((dataSet.FieldByName('Valor').AsString = '') or (dataSet.FieldByName('Valor').AsFloat < 0.01)) then
      if vDadosIni.vRecibo.HabRecPorDepart then
        raiseExceptionCreate('Campo quantia não informado.', 'DBEdit17')
      else
	      raiseExceptionCreate('Campo importância não informado.', 'DBEdit4');

    if ((dataSet.State = dsInsert) and (vDadosIni.vRecibo.HabRecPorDepart)
	  or ((dataSet.State <> dsInsert) and (trim(dataSet.FieldByName('NUM_REC_DEP').AsString) <> ''))) then
      if ((trim(dataSet.FieldByName('ATRAVES1').AsString) = '')
        and (trim(dataSet.FieldByName('ATRAVES2').AsString) = '')
        and (trim(dataSet.FieldByName('ATRAVES3').AsString) = ''))  then
        if vDadosIni.vRecibo.HabRecPorDepart then
		    	raiseExceptionCreate('Campo através de não informado.', 'DBEdit29');

    if ((dataSet.State = dsInsert) and (vDadosIni.vRecibo.HabRecPorDepart)
	  or ((dataSet.State <> dsInsert) and (trim(dataSet.FieldByName('NUM_REC_DEP').AsString) <> ''))) then
      if ((trim(dataSet.FieldByName('REFERENCIA1').AsString) = '')
        and (trim(dataSet.FieldByName('REFERENCIA2').AsString) = '')
        and (trim(dataSet.FieldByName('REFERENCIA3').AsString) = '')
        and (trim(dataSet.FieldByName('REFERENCIA4').AsString) = ''))  then
	        if vDadosIni.vRecibo.HabRecPorDepart then
			    	raiseExceptionCreate('Campo referência não informado.', 'DBEdit18');

    if dataSet.FieldByName('COD_BENEF').AsInteger <= 0 then
     if vDadosIni.vRecibo.HabRecPorDepart then
      raiseExceptionCreate('Campo beneficiário não informado.', 'DBEdit24')
     else
      raiseExceptionCreate('Campo beneficiário não informado.', 'DBEdit3');

    if ((vDadosIni.vPesquisa <> 'Obs Caixa =N') and (vDadosIni.vEmp.vModoFaturamento = 'S')) then
    begin
       vobscxl := trim(dataSet.FieldByName('OBSERVACAO1').AsString) + ' ' +
        trim(dataSet.FieldByName('OBSERVACAO2').AsString) + ' ' +
 	      trim(dataSet.FieldByName('OBSERVACAO3').AsString);

      InputQuery('Observação Caixa', ' Digite Obs. Caixa:', vobscxl);
      dataSet.FieldByName('OBS_CXL_RQ').AsString := vobscxl;
    end;

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('NRECIBO').AsInteger := Gencodigo('RECIBOS', dtmRecibo.SpIncCodigo, vDadosIni.codEmpresa);
      if vDadosIni.vRecibo.HabRecPorDepart then
        dataSet.FieldByName('NUM_REC_DEP').AsString := trim(retornaNumRec)
      else
        dataSet.FieldByName('NUM_REC_DEP').AsInteger := dataSet.FieldByName('NRECIBO').AsInteger;
    end;

    dataSet.FieldByName('VALOR').AsFloat := RoundTo(dataSet.FieldByName('VALOR').AsFloat, -2);

    if (dataSet.FieldByName('RECANT').AsString <> 'S') and (dataSet.FieldByName('RECANT').AsString <> 'O') then
    	dataSet.FieldByName('DATA_VENC').Value := Null
    else if (trim(dataSet.FieldByName('STATUS_REC').AsString) <> 'RECEBIDO')
      and (dataSet.FieldByName('DATA_VENC').IsNull) then
    begin
      if (vDadosIni.vRecibo.Baixar.vUtilizarDataVencimentoRecAntValeCompra = 'S') and (trim(vDadosIni.vRecibo.Baixar.vDiasVencimentoRecAntValeCompra) <> '') then
    		dataSet.FieldByName('DATA_VENC').AsDateTime := vDataAtual + StrToInt(trim(vDadosIni.vRecibo.Baixar.vDiasVencimentoRecAntValeCompra))
      else
      	dataSet.FieldByName('DATA_VENC').Value := Null;
    end;

    vnrecibo     := dataSet.FieldByName('NRECIBO').AsInteger;
    vcod_empresa := dataSet.FieldByName('COD_EMPRESA').AsInteger;

    Result := inherited post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

    if (acao = 'INSERIR') then
      efetuarForma;

    if (vnrecibo > 0) then
    	abreRecibo(vnrecibo, vcod_empresa)
    else
    	dataSet.Refresh;

    if Result then
      vDadosIni.GravaAuditoria('REC003', acao, 'SUCESSO', 'RECIBOS', IntToStr(vnrecibo), buscas)
    else
      vDadosIni.GravaAuditoria('REC003', acao, 'FALHA', 'RECIBOS', IntToStr(vnrecibo), buscas);

//    if Result then
//      Refresh;

  except
    on e: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TRecibo.recebido: boolean;
begin
  if dataSet.IsEmpty then
    Result := false
  else
  begin
//    if (obRecibo.dataSet.FieldByName('RECANT').AsString <> 'S') then
//    begin
//      Application.MessageBox('Recibo selecionado não é recibo antecipado de venda', 'Atenção',
//        IDOK + 64);
//      exit;
//    end;
    Result := trim(dataset.FieldByName('STATUS_REC').AsString) = 'RECEBIDO';
  end;
end;

function TRecibo.restaurarLixeira: boolean;
begin
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
      begin
        //
        if Edit then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          DataSet.Post;
          if Apply then
            CommitaTransacao;
        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + chr(13) +
        'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
  Refresh;
end;

function TRecibo.retornaNumRec: string;
var
 vTemp: string;
begin
  vTemp := '';

  buscas.Close;
  buscas.SQL.Text := ' SELECT COALESCE(INICIAIS_DEPTO, '''') INICIAIS_DEPTO FROM DEPTO ' +
  	' WHERE ATIVO = 1 AND NOME_DEPTO = :NOME_DEPTO ';
  buscas.ParamByName('NOME_DEPTO').AsString := vDepartamento.dataSet.FieldByName('NOME_DEPTO').AsString;  
  buscas.Open;

  if trim(buscas.FieldByName('INICIAIS_DEPTO').AsString) <> '' then
  begin
    vTemp := trim(buscas.FieldByName('INICIAIS_DEPTO').AsString);
    vTemp := vTemp + vDadosIni.StrZero(Gencodigo('RECIBOS_' + trim(buscas.FieldByName('INICIAIS_DEPTO').AsString),
    	dtmRecibo.SpIncCodigo, vDadosIni.codEmpresa), 4) + '/';
    vTemp := vTemp + FormatDateTime('yy', vDadosIni.getDataBanco(buscas))
  end;
  Result := vTemp;  
end;

procedure TRecibo.setRecAntecipado(antecipado: boolean);
begin
  if dataSet.State in [dsEdit, dsInsert] then
  begin
    if antecipado then
      dataSet.FieldByName('recant').AsString := 'S'
    else
      dataSet.FieldByName('recant').AsString := 'N';
  end;
end;

function TRecibo.StatusLixeira: boolean;
begin
  result := montaSelect('select recibos.*, empresa.identificacao_emp, colaborador.nome_vendedor, depto.nome_depto from Recibos ' +
   ' left join empresa on empresa.cod_empresa = recibos.cod_empresa ' +
   ' left join colaborador on colaborador.cod_vendedor = recibos.cod_us and colaborador.cod_empresa = recibos.cod_empresa ' +
   ' left join depto on depto.cod_depto = recibos.cod_depto ' +
   ' where recibos.ativo = 0 and recibos.cod_empresa = ' + vDadosIni.codEmpresa);
end;


function TRecibo.verificarRegistro: boolean;
var
 vCodigo: Integer;
begin
  Result := True;

  vCodigo := dataSet.FieldByName('NRECIBO').AsInteger;
  try
    dataSet.RefreshRecord;
    if vCodigo <> dataSet.FieldByName('NRECIBO').AsInteger then
    begin
      Result := False;
      Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte o botão Procurar e verifique',
        'Atenção', 0 + 64);
      Exit;
    end;

  except on E: Exception do
    begin
      if Pos('changed by another user', e.Message) > 0 then
      begin
        Result := False;
        Application.MessageBox('Registro selecionado foi modificado por outro usuário. Aperte o botão Procurar e verifique',
          'Atenção', 0 + 64);
        Exit;
      end;
    end;
  end;
end;

function TRecibo._existeFormPagamento(numeroVenda: integer; Mensagem: string = ''): boolean;
begin
  result := true;

  buscas.close;
  buscas.sql.text := ' select  * from formpagamento fp' +
     ' where fp.nrequisicao = ' + IntToStr(numeroVenda) + ' and fp.tpdocs = ''REC'' and fp.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if not buscas.IsEmpty then
  begin
    if Mensagem <> 'N' then
      Application.MessageBox('Recibo possuí forma de pagamento não é possível excluir!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    result := false;
    exit;
  end;

  buscas.close;
  buscas.sql.text := ' select  * from formpagamento fp' +
   ' inner join lanccxl lc on lc.tipo_doc_cxl = fp.tpdocs and lc.n_doc_cxl = fp.nrequisicao and lc.codigo_emp = fp.cod_empresa' +
   ' inner join formpagamento fp1 on fp1.nrequisicao = LC.COD_LANCXL AND FP1.TPDOCS = ''LCS'' and fp1.cod_empresa = lc.codigo_emp' +
   ' where fp.rec_numvend = ' + IntToStr(numeroVenda) + ' and fp.rec_tipvend = ''REC'' AND FP.op_cxl > 0 and fp.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if buscas.IsEmpty then
  begin
    buscas.Close;
    buscas.Sql.Text := 'select  * from formpagamento fp' +
      ' inner join formpagamento fp1 on fp1.nrequisicao = FP.rec_numvend AND FP1.TPDOCS = ''LCS'' and fp1.cod_empresa = FP.cod_empresa AND FP1.op_cxl = FP.op_cxl' +
      ' where fp.rec_numvend = ' + IntToStr(numeroVenda) + ' and fp.rec_tipvend = ''REC'' AND FP.op_cxl = 0 and fp.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
  end;

  if not buscas.IsEmpty then
  begin
    if Mensagem <> 'N' then
        Application.MessageBox('Recibo utilizado em venda uma ou mais vendas não é possível excluir!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    result := false;
  end;
end;

function TRecibo._existeHistorico(numeroVenda: integer; Mensagem: string = ''): boolean;
begin
  result := true;

  buscas.Close;
  buscas.Sql.Text := 'select * from recibos rc ' +
    ' inner join hist_rec h on h.nrecibo = rc.nrecibo and h.cod_empresa = rc.cod_empresa' +
    ' where rc.nrecibo =' + IntToStr(numeroVenda) + ' and rc.cod_empresa =' + vDadosIni.codEmpresa;
  buscas.Open;

  if not buscas.IsEmpty then
  begin
    if Mensagem <> 'N' then
      Application.MessageBox('Recibo possuí histórico não é possível excluir!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    result := false;
  end;
end;

function TRecibo._existeRecebimento(Mensagem: string = ''): boolean;
begin
  Result := trim(dataset.FieldByName('STATUS_REC').AsString) = 'RECEBIDO';

  if (Mensagem <> 'N') then
  begin
    if Result then
      Application.MessageBox('Recibo possuí recebimento não é possível excluir!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

function TRecibo._lixeiraCheia: boolean;
begin
  Result := ExecutaComandosSql('select first 1 nrecibo from Recibos where ativo = 0 and cod_empresa =' +
    vDadosIni.codEmpresa);
end;

function TRecibo.abreRecibo(pNRecibo, pCodEmpresa: Integer): boolean;
begin
	result := montaSelect(' select recibos.*, empresa.identificacao_emp, colaborador.nome_vendedor, depto.nome_depto from Recibos ' +
   ' left join empresa on empresa.cod_empresa = recibos.cod_empresa ' +
   ' left join colaborador on colaborador.cod_vendedor = recibos.cod_us and colaborador.cod_empresa = recibos.cod_empresa ' +
   ' left join depto on depto.cod_depto = recibos.cod_depto ' +
   ' where recibos.nrecibo = ' + IntToStr(pNRecibo) +
   ' and recibos.cod_empresa = ' + IntToStr(pCodEmpresa));
end;

{ TDevedor }

function TDevedor.abreBeneficiario: boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Clear;
    buscas.SQL.Text := 'select c.cod_cliente,c.nome_cliente,' +
      ' case' +
      '    when char_length(c.cpfcgc) = 11 then ''CPF: ''||c.cpfcgc' +
      '    when char_length(c.cpfcgc) = 14 then ''CNPJ: ''||c.cpfcgc' +
      '    else ''CPF/CNPJ: ''||c.cpfcgc' +
      ' end cpfcgc,' +
      ' ''Fone: ''||c.fone_cliente fone_cliente,' +
      ' case' +
      '    when (not c.num_end_cliente is null) and (not c.complemento is null) then c.endereco||'', ''||c.num_end_cliente||'' ''||c.complemento' +
      '    when not c.num_end_cliente is null then c.endereco||'', ''||c.num_end_cliente' +
      '    when not c.endereco is null then c.endereco' +
      '    else ''''' +
      ' end endereco,' +
      ' case' +
      '    when ( not cid.nome_cidade is null) then c.cep||'' - ''||trim(cid.nome_cidade)||'' - ''||es.sigla_uf' +
      '    else c.cep||'' - ''||es.sigla_uf' +
      ' end cepcidadeuf' +
      ' from clientes c' +
      ' left join cidades cid on cid.cod_cidade =  c.cod_cidade' +
      ' inner join estados es on es.codigo_uf = c.codigo_uf' +
      ' where c.ativo = 1 and c.cod_empresa = ' + vDadosIni.codEmpresa;
    //    buscas.SQL.Add('select C.COD_CLIENTE, C.NOME_CLIENTE, C.BAIRRO, C.CPFCGC, C.ENDERECO, C.CEP,FONE_CLIENTE, C.CIDADE, E.SIGLA_UF ' +
    //      ' from Clientes c, estados e where C.CODIGO_UF = E.CODIGO_UF and C.ativo = 1 and C.cod_empresa = ' +
    //        vDadosIni.codEmpresa);
    buscas.Open;
    result := true;
  except
    result := false;
  end;
end;

function TDevedor.BuscaPeloCodigo(codigo: integer; pCodigoUnificada: Integer; pExibirMens: boolean = true): string;
begin
  buscas.Close;
  buscas.SQL.Clear;
  buscas.SQL.Text := 'select c.cod_cliente,c.nome_cliente,' +
    ' case' +
    '    when char_length(c.cpfcgc) = 11 then ''CPF: ''||c.cpfcgc' +
    '    when char_length(c.cpfcgc) = 14 then ''CNPJ: ''||c.cpfcgc' +
    '    else ''CPF/CNPJ: ''||c.cpfcgc' +
    ' end cpfcgc,' +
    ' ''Fone: ''||c.fone_cliente fone_cliente,' +
    ' case' +
    '    when (not c.num_end_cliente is null) and (not c.complemento is null) then c.endereco||'', ''||c.num_end_cliente||'' ''||c.complemento' +
    '    when not c.num_end_cliente is null then c.endereco||'', ''||c.num_end_cliente' +
    '    when not c.endereco is null then c.endereco' +
    '    else ''''' +
    ' end endereco,' +
    ' case' +
    '    when ( not cid.nome_cidade is null) then c.cep||'' - ''||trim(cid.nome_cidade)||'' - ''||es.sigla_uf' +
    '    else c.cep||'' - ''||es.sigla_uf' +
    ' end cepcidadeuf' +
    ' from clientes c' +
    ' left join cidades cid on cid.cod_cidade =  c.cod_cidade' +
    ' inner join estados es on es.codigo_uf = c.codigo_uf' +
    ' where c.ativo = 1 ' +
    ' and c.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
		   InttoStr(pCodigoUnificada) , vDadosIni.codEmpresa) +	
    ' and c.cod_cliente = ' + IntToStr(codigo);
  buscas.Open;
  result := buscas.FieldByName('NOME_CLIENTE').AsString;
  if trim(Result) = '' then
    if pExibirMens then
	    Application.MessageBox('Recebemos não encontrado!', 'Atenção',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
end;

constructor TDevedor.create;
begin
  buscas := TIBQuery(dtmRecibo.qrDev);
  transacao := TIBTransaction(dtmRecibo.IBTransRecibo);
end;

{ THistoricoRec }

function THistoricoRec.abreHistoricoRec(NumRec: integer): boolean;
begin
  dataSet.Close;
  dataSet.CommandText := 'SELECT HIST_REC.*, RECIBOS.NUM_REC_DEP FROM HIST_REC ' +
   ' LEFT JOIN RECIBOS ON RECIBOS.NRECIBO = HIST_REC.NRECIBO AND RECIBOS.COD_EMPRESA = HIST_REC.COD_EMPRESA ' +
   ' WHERE HIST_REC.ATIVO = 1 ' +
   ' AND HIST_REC.NRECIBO =' + IntToStr(nUMrEC) +
   vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
   	' AND HIST_REC.COD_EMPRESA in ' + vDadosIni.vEmp.vCodigoUnificadas,
    ' AND HIST_REC.COD_EMPRESA = ' + vDadosIni.codEmpresa) +
   ' ORDER BY HIST_REC.COD_EMPRESA, HIST_REC.SEQCAD_REC ';
  dataSet.Open;
end;

function THistoricoRec.contaBaixas(recibo: TRecibo): integer;
begin
  try
    buscas.Close;
    buscas.SQL.Clear;
    buscas.SQL.Add('select count(*)as qtd from hist_rec where Ativo = 1 and cod_empresa = ' +
      vDadosIni.codEmpresa + ' and NRECIBO = ' + recibo.dataSet.FieldByName('NRECIBO').AsString);
    buscas.Open;
    result := buscas.FieldByName('qtd').AsInteger;
  except on e: Exception do
    begin
      application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      result := 0;
    end;
  end;
end;

constructor THistoricoRec.create;
begin
  dataset := TClientDataSet(dtmRecibo.cdsHistRecibo);
  transacao := TIBTransaction(dtmRecibo.IBTransRecibo);
  buscas := TIBQuery(dtmRecibo.qrBuscas);
end;

function THistoricoRec.delete(recibo: TRecibo): boolean;
var
  vBaixa: real;
  vHist: string;
  vtpbx: string;
begin
  if dataset.IsEmpty then
    exit;
  dataSet.RefreshRecord;
  if dataSet.FieldByName('NRECIBO').AsString = '' then
  begin
    Application.MessageBox('É necessário selecionar um registo!', 'Atenção', MB_ICONWARNING +
      MB_OK);
    exit;
  end;
  try
    IniciaTransacao;
    vBaixa := dataSet.FieldByName('VALOR_BAIXA').AsFloat;
    vhist := dataSet.FieldByName('HISTORICO_REC').AsString;
    vtpbx := dataSet.FieldByName('TP_BAIXA').AsString;
    if Application.MessageBox('Tem certeza que deseja excluir histórico?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
      Exit;

    if (dataSet.FieldByName('COD_EMPRESA').AsInteger <> StrToInt(vDadosIni.codEmpresa)) then
    begin
      Application.MessageBox(PChar('Histórico não pode ser excluído, ' +
      	'pois operação foi realizada na Empresa: ' +
         IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger)),
         'Atenção', MB_ICONERROR + MB_OK);
      exit;   
    end;

    vDadosIni.vPesquisa := 'Obs Caixa =N';

    if not _existeHistorico(dataSet.FieldByName('SEQCAD_REC').AsInteger, dataSet.FieldByName('NRECIBO').AsString) then
      exit;

    buscas.Close;
    buscas.SQL.Text := 'update hist_rec' +
      ' set valor_recibo = (valor_recibo + :valor_baixa)' +
      ' where seqcad_rec > ' + IntToStr(dataSet.FieldByName('seqcad_rec').AsInteger) +
      ' and nrecibo = ' + IntToStr(dataSet.FieldByName('nrecibo').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tp_baixa = ''P''';
    buscas.ParamByName('valor_baixa').AsFloat := vBaixa;
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := 'update hist_rec' +
      ' set valor_recibo = (valor_baixa + :valor_baixa)' +
      ' where seqcad_rec > ' + IntToStr(dataSet.FieldByName('seqcad_rec').AsInteger) +
      ' and nrecibo = ' + IntToStr(dataSet.FieldByName('nrecibo').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and tp_baixa = ''T''';
    buscas.ParamByName('valor_baixa').AsFloat := vBaixa;
    buscas.ExecSQL;

//    buscas.Close;
//    buscas.SQL.Text := 'update hist_rec hr1 set hr1.valor_recibo =' +
//      ' (select coalesce(sum(hr2.valor_baixa ), 0) from hist_rec hr2' +
//      ' where hr2.nrecibo = hr1.nrecibo and hr2.seqcad_rec >= hr1.seqcad_rec' +
//      ' and hr2.cod_empresa = hr1.cod_empresa)' +
//      ' where hr1.nrecibo = :nrecibo and hr1.cod_empresa = ' + vDadosIni.codEmpresa ;
//    buscas.ParamByName('seqcad_rec').AsInteger := dataSet.FieldByName('seqcad_rec').AsInteger;
//    buscas.ParamByName('nrecibo').AsInteger := dataSet.FieldByName('nrecibo').AsInteger;
//    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := 'update hist_rec' +
      ' set tp_baixa = ''P''' +
      ' where nrecibo = ' + IntToStr(dataSet.FieldByName('nrecibo').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := 'delete from hist_rec' +
      ' where seqcad_rec = ' + IntToStr(dataSet.FieldByName('seqcad_rec').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    //dataSet.Delete;
//    if Apply then
    begin
      result := true;
      if vtpbx = 'P' then
      //pos('PARCIAL', vhist) > 0 then
      begin
        recibo.Edit;
        if Trim(recibo.dataSet.FieldByName('STATUS_REC').AsString) = 'RECEBIDO' then
          recibo.dataSet.FieldByName('VALOR').AsFloat := vBaixa
        else
          recibo.dataSet.FieldByName('VALOR').AsFloat := recibo.dataSet.FieldByName('VALOR').AsFloat +
            vBaixa;
        recibo.dataSet.FieldByName('STATUS_REC').AsString := '';
        recibo.dataSet.FieldByName('DATA_BAIXA').asstring := '';
        recibo.Post;
        recibo.Apply;
      end
      else
      begin
        recibo.edit;
        recibo.dataSet.FieldByName('STATUS_REC').AsString := '';
        recibo.dataSet.FieldByName('NDOCANT').value := 0;
        recibo.dataSet.FieldByName('DATA_BAIXA').asstring := '';
        recibo.post;
        recibo.Apply;
      end;
    end;
//    else
//    begin
//      RollBackTransacao;
//      Result := False;
//      Exit;
//    end;
    CommitaTransacao;
    dataSet.Refresh;
  except
    on e: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function THistoricoRec.insert: boolean;
begin
  if not dataSet.Active then
    montaSelect('SELECT HIST_REC.*, RECIBOS.NUM_REC_DEP FROM HIST_REC ' +
   ' LEFT JOIN RECIBOS ON RECIBOS.NRECIBO = HIST_REC.NRECIBO AND RECIBOS.COD_EMPRESA = HIST_REC.COD_EMPRESA ' +
   ' WHERE HIST_REC.SEQCAD_REC = 0 AND HIST_REC.COD_EMPRESA = 0');

  if inherited Insert then
    result := true;

end;

function THistoricoRec.post: boolean;
begin
  try
    Result := false;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := true;
      exit;
    end;

    if ((dataSet.FieldByName('VALOR_BAIXA').AsString = '') or (dataSet.FieldByName('VALOR_BAIXA').AsFloat < 0.01)) then
      raise Exception.Create('Valor da baixa não informado.');

    if dataset.FieldByName('HISTORICO_REC').AsString = '' then
      raise Exception.Create('Histórico não informado.');

    dataset.FieldByName('SEQCAD_REC').AsInteger := Gencodigo('HIST_REC',
      dtmRecibo.SpIncCodigo, vDadosIni.codEmpresa);

    dataSet.FieldByName('VALOR_BAIXA').AsFloat := RoundTo(dataSet.FieldByName('VALOR_BAIXA').AsFloat, -2);

    result := inherited post;

    if dataSet.ChangeCount = 0 then
      result := true
    else
      Result := Apply;

    if result then
      result := CommitaTransacao;

  except on e: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
  Refresh;
end;

function THistoricoRec.Recebimento(recibo: TRecibo): boolean;
begin
  Result := false;

  dataset.edit;
  dataset.FieldByName('NRECIBO').AsInteger := recibo.dataset.FieldByName('NRECIBO').AsInteger;

  if vDadosIni.StrToFloatFormat(dataset.FieldByName('VALOR_BAIXA').AsCurrency, 2) >
    vdadosini.StrToFloatFormat(recibo.dataSet.FieldByName('VALOR').AsCurrency, 2) then
//  dataset.FieldByName('VALOR_BAIXA').AsFloat > recibo.dataSet.FieldByName('VALOR').AsFloat then
    raise Exception.Create('O valor informado é maior que o valor do recibo.');
  if dataset.FieldByName('NDOCANT').AsString = '' then
    raise Exception.Create('N. de Documento deve ser informado!');

  if vDadosIni.StrToFloatFormat(dataset.FieldByName('VALOR_BAIXA').AsCurrency, 2) = vdadosini.StrToFloatFormat(recibo.dataSet.FieldByName('VALOR').AsCurrency, 2) then
  begin
    recibo.edit;
    recibo.dataset.FieldByName('STATUS_REC').AsString := 'RECEBIDO';
    recibo.dataset.FieldByName('NDOCANT').AsString := dataset.FieldByName('NDOCANT').AsString;
    recibo.dataSet.FieldByName('DATA_BAIXA').AsDateTime := vDadosIni.getDataBanco(buscas);

    recibo.dataset.FieldByName('HISTORICO_REC').AsString :=
    	copy(trim(dataset.FieldByName('HISTORICO_REC').AsString), 1, 41) + ' TOTAL';

    dataset.FieldByName('HISTORICO_REC').AsString :=
    	copy(trim(dataset.FieldByName('HISTORICO_REC').AsString), 1, 41) + ' TOTAL';

    recibo.dataSet.post;
    recibo.Apply;
    Application.MessageBox('Recibo quitado', 'Atenção', MB_ICONINFORMATION + MB_OK)
  end;

  if vDadosIni.StrToFloatFormat(dataset.FieldByName('VALOR_BAIXA').AsFloat, 2) <
    vDadosIni.StrToFloatFormat(recibo.dataSet.FieldByName('VALOR').AsFloat, 2) then
  begin
    dataSet.FieldByName('VALOR_RECIBO').AsFloat :=
    	RoundTo(recibo.dataSet.FieldByName('VALOR').AsFloat, -2);

    recibo.edit;

    recibo.dataSet.FieldByName('VALOR').AsFloat :=
    	RoundTo(recibo.dataSet.FieldByName('VALOR').AsFloat, -2) -
      RoundTo(dataset.FieldByName('VALOR_BAIXA').AsFloat, -2);

    recibo.dataset.FieldByName('HISTORICO_REC').AsString :=
    	copy(trim(dataset.FieldByName('HISTORICO_REC').AsString), 1, 41) + ' PARCIAL';

    dataset.FieldByName('HISTORICO_REC').AsString :=
    	copy(trim(dataset.FieldByName('HISTORICO_REC').AsString), 1, 41) + ' PARCIAL';

    recibo.dataSet.post;
    recibo.Apply;
  end;

  dataset.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
  dataset.FieldByName('DATA_REC').AsString := recibo.dataset.FieldByName('DATA_REC').AsString;
  dataset.FieldByName('DATA_BAIXA').AsDateTime := vDadosIni.getDataBanco(buscas);
  dataset.FieldByName('RECANT').AsString := recibo.dataset.FieldByName('RECANT').AsString;
  dataset.FieldByName('COD_US').AsInteger := vDadosIni.vCodUsuario;

  if RoundTo(dataset.FieldByName('VALOR_BAIXA').AsFloat, -2) = RoundTo(recibo.dataSet.FieldByName('VALOR').AsFloat, -2) then
    dataSet.FieldByName('TP_BAIXA').AsString := 'T'
  else
    dataSet.FieldByName('TP_BAIXA').AsString := 'P';
  Result := true;
end;

function THistoricoRec._existeHistorico(codigo: integer; nrecibo: string): boolean;
begin
  result := true;

  buscas.Close;
  buscas.Sql.Text := 'select * from hist_rec' +
    ' where seqcad_rec =' + IntToStr(codigo) + ' and nrecibo =' + nrecibo + ' and cod_empresa =' + vDadosIni.codEmpresa;
  buscas.Open;

  if not buscas.FieldByName('TP_DOC_BAIXA').IsNull then
  begin
    if Application.MessageBox(pchar('Recibo utilizado em uma ou mais vendas, Deseja realmente excluir histórico?'), 'Atenção',
      MB_ICONQUESTION + MB_YESNO) = IDNO then
    begin
      result := false;
      exit;
    end;

    if not vDadosIni.PesqPros('REC015', 'APAGAR HIST. RECEBIMENTO DE REC VINCULADO A VENDA', '', 'RECIBOS',
      dataSet.FieldByName('NRECIBO').AsString, buscas, true) then
    begin
      result := false;
      exit;
    end;
  end;
end;

{ TReciboSimples }

function TReciboSimples.BuscaPeloCodigo(codigo: integer): string;
begin
  buscas.Close;
  buscas.SQL.Clear;
  buscas.SQL.Add('select COD_CLIENTE, NOME_CLIENTE as valor from Clientes where ativo = 1 and COD_CLIENTE = ' + IntToStr(codigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
  buscas.Open;
  result := buscas.FieldByName('valor').AsString;
end;

procedure TReciboSimples.CadReciboSimples(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmRecibo = nil then
    dtmRecibo := TdtmRecibo.Create(dtmRecibo);
  if frmReciboSimples = nil then
    Application.CreateForm(TfrmReciboSimples, frmReciboSimples);
  frmReciboSimples.ShowModal;
end;

constructor TReciboSimples.create;
begin
  buscas := TIBQuery(dtmRecibo.qrBuscas);
  vBenef := TBeneficiario.create;
  vDevedor := TDevedor.create;
end;

function TReciboSimples.gerarCodigo: string;
begin
  result := inttostr(Gencodigo('RECIBOS', dtmRecibo.SpIncCodigo, vDadosIni.codEmpresa));
end;

{ TBeneficiario }

function TBeneficiario.BuscaPeloCodigo(codigo: integer; pCodigoUnificada: Integer; pExibirMens: boolean = true): string;
begin
  dataSet.Close;
  dataSet.Params[0].AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
   pCodigoUnificada , StrToInt(vDadosIni.codEmpresa));
  dataSet.Params[1].AsInteger := codigo;
  dataSet.Open;
  Result := dataSet.FieldByName('nome_cliente').AsString;
  if pExibirMens then
    if trim(Result) = '' then
      Application.MessageBox('Beneficiário não encontrado', 'Atenção', IDOK + 64);
end;

constructor TBeneficiario.create;
begin
  dataSet := TClientDataSet(dtmRecibo.cdsClrec);
  buscas := TIBQuery(dtmRecibo.qrBuscas);
  transacao := TIBTransaction(dtmRecibo.IBTransRecibo);
end;

function TBeneficiario.retornaNomeCliente(codigo: integer): string;
begin
  Result :=
    retornaValor('select NOME_CLIENTE as valor from Clientes where ativo = 1 and COD_CLIENTE = ' +
    IntToStr(codigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

{ TPrePosto }

function TPrePosto.BuscaPeloCodigo(codigo: integer; pCodigoUnificada: Integer): string;
begin
  buscas.Close;
  buscas.SQL.Clear;
  buscas.SQL.Text := 'select c.cod_cliente,c.nome_cliente  from clientes c' +
    ' where c.ativo = 1 ' +
    ' and c.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
	   InttoStr(pCodigoUnificada) , vDadosIni.codEmpresa) +
    ' and c.cod_cliente = ' + IntToStr(codigo);
  buscas.Open;
  result := buscas.FieldByName('NOME_CLIENTE').AsString;
  if trim(Result) = '' then
    Application.MessageBox('Préposto não encontrado', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
end;

constructor TPrePosto.create;
begin
  buscas := TIBQuery(dtmRecibo.qrPrep);
  transacao := TIBTransaction(dtmRecibo.IBTransRecibo);
end;

{ TColaborador }

function TColaboradorRec.abreColaborador(pDepartamento: string): boolean;
begin
  Result := montaselect(' SELECT COL.COD_VENDEDOR, TRIM(COL.NOME_VENDEDOR) NOME_VENDEDOR FROM COLABORADOR COL ' +
  	' INNER JOIN FUNCOES FUNC ON FUNC.COD_FUNCAO = COL.COD_FUNCAO ' +
    ' INNER JOIN DEPTO DEP ON DEP.COD_DEPTO = FUNC.COD_DEPTO ' +
    ' WHERE COL.ATIVO = 1 AND COL.COD_EMPRESA = ' + vDadosIni.codEmpresa +
		' AND DEP.NOME_DEPTO = ' + QuotedStr(pDepartamento) +
    ' ORDER BY COL.NOME_VENDEDOR ');
end;

function TColaboradorRec.abreColaborador(pCodVendedor: Integer; pDepartamento: string = ''): boolean;
var
 vTemp: string;
begin
  vTemp := ' SELECT COL.COD_VENDEDOR, TRIM(COL.NOME_VENDEDOR) NOME_VENDEDOR FROM COLABORADOR COL ' +
	  ' INNER JOIN FUNCOES FUNC ON FUNC.COD_FUNCAO = COL.COD_FUNCAO ' +
    ' INNER JOIN DEPTO DEP ON DEP.COD_DEPTO = FUNC.COD_DEPTO ' +
    ' WHERE  COL.ATIVO = 1 AND COL.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND COL.COD_VENDEDOR = ' + IntToStr(pCodVendedor);
  if trim(pDepartamento) <> '' then
  	vTemp := ' AND DEP.NOME_DEPTO = ' + QuotedStr(pDepartamento);
  vTemp := ' ORDER BY COL.NOME_VENDEDOR ';
  Result := montaselect(vTemp);
end;

function TColaboradorRec.abreColaborador: boolean;
begin
  Result := montaselect(' SELECT COL.COD_VENDEDOR, TRIM(COL.NOME_VENDEDOR) NOME_VENDEDOR FROM COLABORADOR COL ' +
  	' WHERE  COL.ATIVO = 1 AND COL.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' ORDER BY COL.NOME_VENDEDOR ');
end;

function TColaboradorRec.BuscaPeloCodigo(codigo: integer; pDepartamento: string = ''; pExibirMens: boolean = true): string;
begin
  buscas.Close;
  buscas.SQL.Text := 'SELECT COL.COD_VENDEDOR, TRIM(COL.NOME_VENDEDOR) NOME_VENDEDOR FROM COLABORADOR COL ' +
    ' INNER JOIN FUNCOES FUNC ON FUNC.COD_FUNCAO = COL.COD_FUNCAO ' +
    ' INNER JOIN DEPTO DEP ON DEP.COD_DEPTO = FUNC.COD_DEPTO ' +
    ' WHERE COL.COD_VENDEDOR = ' + IntToStr(codigo) + ' AND COL.COD_EMPRESA = ' + vDadosIni.codEmpresa;
  if trim(pDepartamento) <> '' then
	  buscas.SQL.Text := buscas.SQL.Text + ' AND DEP.NOME_DEPTO = ' + QuotedStr(pDepartamento);
  buscas.Open;

  result := buscas.FieldByName('NOME_VENDEDOR').AsString;
  if trim(Result) = '' then
    if pExibirMens then
      if trim(pDepartamento) = '' then
        Application.MessageBox(PChar('Responsável não encontrado!'), 'Atenção',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
      else
		    Application.MessageBox(PChar('Responsável não encontrado para departamento ' + QuotedStr(pDepartamento) + '!'), 'Atenção',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
end;

constructor TColaboradorRec.create;
begin
  dataSet := TClientDataSet(dtmRecibo.cdsColaborador);
  buscas := TIBQuery(dtmRecibo.qrBuscas);
  transacao := TIBTransaction(dtmRecibo.IBTransRecibo);
end;

{ TDepartamentoRec }

function TDepartamentoRec.abreDepto: boolean;
begin
  Result := montaselect(' SELECT COD_DEPTO, NOME_DEPTO, INICIAIS_DEPTO FROM DEPTO ' +
  	' WHERE ATIVO = 1 ORDER BY NOME_DEPTO ');
end;

function TDepartamentoRec.abreDepto(pDepto: string): boolean;
begin
  Result := montaselect(' SELECT COD_DEPTO, NOME_DEPTO, INICIAIS_DEPTO FROM DEPTO ' +
  	' WHERE ATIVO = 1 AND NOME_DEPTO = ' + QuotedStr(pDepto));
end;

constructor TDepartamentoRec.create;
begin
  dataSet := TClientDataSet(dtmRecibo.cdsDepto);
  buscas := TIBQuery(dtmRecibo.qrBuscas);
  transacao := TIBTransaction(dtmRecibo.IBTransRecibo);
end;

{ TEmpresasUnificadas }

constructor TEmpresasUnificadas.create;
begin
  DataSet := TClientDataSet(dtmRecibo.cdsEmpresasUnificadas);
  transacao := TIBTransaction(dtmRecibo.IBTransRecibo);
  Buscas := TIBQuery(dtmRecibo.qrBuscas);
end;

function TEmpresasUnificadas._abreTodosEmpresas: Boolean;
begin
 Result := montaSelect(' select cod_empresa, (identificacao_emp ||'' - ''|| cgc_emp) identificacao_emp from empresa ' +
  ' where codigo_unificadora = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
  	IntToStr(vDadosIni.vEmp.vCodigoUnificadora), vDadosIni.codEmpresa) +
  ' and financeiro_unificado = ''S'' ' +
  ' order by cod_empresa');
end;

function TEmpresasUnificadas._BuscarEmpresas(vCodEmp: Integer): Boolean;
begin
 Result := False;

 buscas.Close;
 buscas.SQL.Text := ' select cod_empresa from empresa ' +
  ' where codigo_unificadora = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
  	IntToStr(vDadosIni.vEmp.vCodigoUnificadora), vDadosIni.codEmpresa) +
  ' and financeiro_unificado = ''S'' ';
 buscas.Open;
 buscas.FetchAll;


 buscas.First;
 while not buscas.Eof do
 begin
   if buscas.FieldByName('COD_EMPRESA').AsInteger = vCodEmp then
   begin
     Result := True;
     Break;
   end;
   buscas.Next;
 end;
 buscas.Close;

end;

end.

