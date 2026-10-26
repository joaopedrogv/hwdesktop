unit uClassesNotasFiscais_ServTransporte;

interface

uses
  uDataSet_OOP, DB, StdCtrls, servico_transporte_ajuste_class;

type
  TTransport_Frete = class(TDataSet_OOP)
  public
    constructor create;
    function abreTransportador: boolean;
  end;       

  TNatOP_Frete = class(TDataSet_OOP)
  public
    constructor create;
    function abreNaturezaOperacao: boolean;
  end;

  RCTeClipBoard = record
    existe: Boolean;
    chave: string;
    uf: string;
    emissao: string;
    cnpj: string;
    modelo: string;
    serie: string;
    numero: Integer;
  end;

  TServTransporte = class;

  TServTransporteAjuste = class(TServico_transporte_ajuste_class)
  end;

  TServTransporte_D195D197 = class(TDataSet_OOP)
  private
    FOwner: TServTransporte;
    Fobjeto: TServTransporteAjuste;
    servtr_id: string;
  public
    constructor Create(AOwner: TServTransporte);
    destructor Destroy; override;

    function Edit: Boolean; override;
    function Insert: Boolean;
    function Post: Boolean;
    function Delete: Boolean;
    function Open: Boolean;

    property Objeto: TServTransporteAjuste read Fobjeto write Fobjeto;
  end;

  TServTransporte = class(TDataSet_OOP)
  private
    FCTeClipBoard: RCTeClipBoard;
    FAjuste: TServTransporte_D195D197;
  public
    procedure ServTransporteAfterOpen(DataSet: TDataSet);
    function verificaLancamentoContasAPagar : boolean;
    function _abreFormDadosSped: Boolean;
    function validacaoModeloAlternativo: Boolean;
  public
    vsubSerie, vEntSaida: string;
    vNumNota, vCodClFor: integer;
    constructor create; overload;
    constructor create(pSsubSerie, pEntSaida: string;
      pNumNota, pCodClFor: integer); overload;
    destructor Destroy; override;

    function Insert: boolean; override;
    function post: boolean; override;
    function _salvarDadosSPED: boolean;
    function _verificarDadosSPED: Boolean;
    function delete: boolean; override;
    function edit: boolean; override;
    function cancel: boolean; override;
    function statuslixeira: boolean;
    function abrelixeira: boolean;
    function restauralixeira: boolean;
    procedure calulcarPISCOFINS;
    procedure CadServTransporte(pModal: Integer);
    function abreServTransportePeloNumNF(pNumNf, pClFor: integer; pSerie, pEntSaida: string):boolean;
    procedure addNotaFiscal(numeroNota, subSerie, cod_fornecedor: integer); overload;
    procedure addNotaFiscal(numeroNota, subSerie, cod_fornecedor: integer; dbList: TListBox);
      overload;
    procedure delNotaFiscal(indice: integer; dbList: TListBox);
    function existeFreteCadastrado: boolean;
    function validaCFOP: boolean;

    function ClipBoardHasChaveCte(userValue: string = ''): Boolean;
    function CopyCteFromClipboard: Boolean;
    function GetCidadesIbgeDS(): TDataSet;

    property CTeClipBoard: RCTeClipBoard read FCTeClipBoard;
    property Ajuste: TServTransporte_D195D197 read FAjuste;
  var
    vTransportador: TTransport_Frete;
    vCFOP: TNatOP_Frete;
  end;

var
  obServTransporte: TServTransporte;  

implementation

uses
  SysUtils, DBClient, IBDatabase, IBQuery, uDtmAtivo, uDtmNF, Classes,
  Forms, Windows,    
  FieldsConfigUnit,
  uCadServicoTransporte, uClassesNotasFiscais_consts, uPadrao, Controls,
  conf_historicos_class, Clipbrd, hw_utils, uDadosIni, StrUtils, DateUtils,
  Query_OOP, Types_OOP;

{ TTransport_Frete }

function TTransport_Frete.abreTransportador: boolean;
begin
  Result := montaSelect('select * from transportador ' +
  	' where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo <> 99 ');
end;

constructor TTransport_Frete.create;
begin
  dataSet := tclientDataSet(DtmNF.cdsTransp);
  transacao := tibtransaction(DtmNF.transacao);
  buscas := tibquery(DtmNF.qrBuscas);
end;

{ TNatOP_Frete }

function TNatOP_Frete.abreNaturezaOperacao: boolean;
begin
  Result := montaSelect('select * from nat_op');
end;

constructor TNatOP_Frete.create;
begin
  dataSet := tclientDataSet(DtmNF.cdsNatOp);
  transacao := tibtransaction(DtmNF.transacao);
  buscas := tibquery(DtmNF.qrBuscas);
end;

{ TServTransporte }

function TServTransporte.abrelixeira: boolean;
begin

end;

function TServTransporte.abreServTransportePeloNumNF(pNumNf, pClFor: integer;
  pSerie, pEntSaida: string): boolean;
var
  I: Integer;
begin
  Result := False;
  vDadosIni.vTipoForm := 2;
  if dtmNF = nil then
    dtmNF := TdtmNF.Create(dtmNF);

  montaSelect('select st.* from servico_transporte st where st.notas_fiscais like ' +
    QuotedStr('%' + vDadosIni.StrZero(pNumNf, 6) + '|' + pSerie + '|' +
    vDadosIni.StrZero(pClFor, 6) + '%') + ' and st.TIPO = ' + QuotedStr(pEntSaida) +
    ' and st.cod_empresa = ' + vDadosIni.CodEmpresa +
    ' and st.ativo = 1');
  if dataSet.IsEmpty then
  begin
    montaSelect('select st.* from servico_transporte st where st.notas_fiscais like ' +
      QuotedStr('%' + vDadosIni.StrZero(pNumNf, 6) + '-' + vDadosIni.StrZero(pSerie,3) + '-' +
      vDadosIni.StrZero(pClFor, 6) + '%') + ' and st.TIPO = ' + QuotedStr(pEntSaida) +
      ' and st.cod_empresa = ' + vDadosIni.CodEmpresa +
      ' and st.ativo = 1');
    if dataSet.IsEmpty then
      exit;
  end;

  if not vDadosIni.validarAcessoCadastrosEmpresas('SERVICO_TRANSPORTE', 'A', buscas) then
    Exit;

  for I := 0 to Pred(Application.MainForm.MDIChildCount) do
    if Application.MainForm.MDIChildren[i] = frmCadServicoTransporte then
    begin
      if not (fsModal in Application.MainForm.MDIChildren[I].FormState) then
        Application.MainForm.MDIChildren[I].Show;
      Result := True;
      Exit;
    end;
  vDadosIni.vNomeForm := 'frmCadServicoTransporte';
  vDadosIni.vModalOuChild := 'M';
  if frmCadServicoTransporte = nil then
    //    Application.CreateForm(TfrmCadServicoTransporte, frmCadServicoTransporte);
    frmCadServicoTransporte := tfrmCadServicoTransporte.Create2(frmCadServicoTransporte,
      Self.vsubSerie, Self.vEntSaida, self.vNumNota, Self.vCodClFor);
  frmCadServicoTransporte.ShowModal;
  Result := True;
end;

procedure TServTransporte.addNotaFiscal(numeroNota, subSerie,
  cod_fornecedor: integer);
var
  vNomeF: string;
  vCodTransp: string;
  lista: TMemo;
begin
  try
    vNomeF := retornaValor('select c.nome_cliente as valor from clientes c' +
        ' where c.cod_cliente = ' + IntToStr(cod_fornecedor) +
        ' and c.cod_empresa = ' + vDadosIni.codEmpresa);

    if trim(vNomeF) = '' then
    begin
      Application.MessageBox('Cliente ou Fornecedor não encontrado', 'Atenção', mb_ok +
        MB_ICONINFORMATION);
      exit;
    end;

    vCodTransp := retornaValor('select st.cod_serv_transp as valor from servico_transporte st' +
      ' where st.notas_fiscais like ' + QuotedStr('%' + vDadosIni.StrZero(numeroNota, 6) +
      '|' + IntToStr(subSerie) + '|' + vDadosIni.StrZero(cod_fornecedor, 6) + '%') +
      ' and st.cod_empresa = ' + vDadosIni.CodEmpresa);

    if trim(vCodTransp) <> '' then
    begin
      Application.MessageBox(pchar('Nota Fiscal já existe no Serviço de Transporte Codigo : ' +
        vCodTransp), 'Atenção', mb_ok + MB_ICONINFORMATION);
      exit;
    end;
    if dataSet.State in [dsInsert, dsEdit] then
    begin
      lista := TMemo.Create(Application);
      try
        lista.Visible := false;
        lista.Parent := Application.MainForm;
        lista.Width := 800;
        lista.Height := 800;
        lista.WordWrap := False;
        lista.Clear;
        lista.Lines.Text := (dataSet.FieldByName('notas_fiscais').AsString);
//        lista.Lines.Add(vDadosIni.StrZero(numeroNota, 6) + '-' + vDadosIni.StrZero(subSerie, 3) + '-'
//          + vDadosIni.StrZero(cod_fornecedor, 6) + '-' + vNomeF);
        lista.Lines.Add(vDadosIni.StrZero(numeroNota, 6) + '|' + IntToStr(subSerie) + '|'
          + vDadosIni.StrZero(cod_fornecedor, 6) + '|' + vNomeF);
        dataSet.FieldByName('notas_fiscais').AsString := lista.Lines.Text;
      finally
        lista.Free;
        lista := nil;
      end;
    end;
  except
    Application.MessageBox('Campos inválidos', 'Atenção', mb_ok + MB_ICONINFORMATION);
    exit;
  end;
end;

procedure TServTransporte.addNotaFiscal(numeroNota, subSerie,
  cod_fornecedor: integer; dbList: TListBox);
var
  vNomeF: string;
  vCodTransp: string;
begin
  try
    if dataSet.FieldByName('TIPO').AsString = 'E' then
      vNomeF := retornaValor('select c.nome_cliente as valor from clientes c' +
        ' where c.cod_cliente = ' + IntToStr(cod_fornecedor) +
        ' and ((c.tipo = ''F'') or (c.tipo = ''A'') or (c.tipo is null) )')
    else
      vNomeF := retornaValor('select c.nome_cliente as valor from clientes c' +
        ' where c.cod_cliente = ' + IntToStr(cod_fornecedor) +
        ' and ((c.tipo = ''C'') or (c.tipo = ''A'') or (c.tipo is null) )');

    if trim(vNomeF) = '' then
    begin
      Application.MessageBox('Cliente ou Fornecedor não encontrado', 'Atenção', mb_ok +
        MB_ICONINFORMATION);
      exit;
    end;

    vCodTransp := retornaValor('select st.cod_serv_transp as valor from servico_transporte st' +
      ' where st.notas_fiscais like ' + QuotedStr('%' + vDadosIni.StrZero(numeroNota, 6) +
      '|' + IntToStr(subSerie) + '|' + vDadosIni.StrZero(cod_fornecedor, 6) + '%') +
      ' and st.cod_empresa = ' + vDadosIni.CodEmpresa);

    if trim(vCodTransp) <> '' then
    begin
      Application.MessageBox(pchar('Nota Fiscal já existe no Serviço de Transporte numero : ' +
        vCodTransp), 'Atenção', mb_ok + MB_ICONINFORMATION);
      exit;
    end;
    if dataSet.State in [dsInsert, dsEdit] then
    begin
      dbList.Items.Add(vDadosIni.StrZero(numeroNota, 6) + '|' + IntToStr(subSerie) + '|'
        + vDadosIni.StrZero(cod_fornecedor, 6) + '|' + vNomeF);
      dataSet.FieldByName('notas_fiscais').AsString := dbList.Items.Text;
    end;
  except
    Application.MessageBox('Campos inválidos', 'Atenção', mb_ok + MB_ICONINFORMATION);
    exit;
  end;
end;

procedure TServTransporte.CadServTransporte(pModal: Integer);
begin
  vDadosIni.vTipoForm := pModal;
  if dtmNF = nil then
    dtmNF := TdtmNF.Create(dtmNF);

  if not vDadosIni.PesqPros('NF0123', 'CONSULTA', '', 'SERVICO_TRANSPORTE', '', dtmNF.qrBuscas, True) then
    exit;

  if (pModal = 1) or (pModal = 3) then
  begin
    vDadosIni.vNomeForm := 'frmCadServicoTransporte';
    vDadosIni.vModalOuChild := 'M';
  end;
  if frmCadServicoTransporte = nil then
  BEGIN
    //    Application.CreateForm(TfrmCadServicoTransporte, frmCadServicoTransporte);
    if Self.vNumNota > 0 then
      frmCadServicoTransporte := tfrmCadServicoTransporte.Create2(frmCadServicoTransporte,
        Self.vsubSerie, Self.vEntSaida, self.vNumNota, Self.vCodClFor)
    else
      Application.CreateForm(TfrmCadServicoTransporte, frmCadServicoTransporte);
  end;
  if (pModal = 1) or (pModal = 3) then
    frmCadServicoTransporte.ShowModal
  else
    frmCadServicoTransporte.Show;
end;

procedure TServTransporte.calulcarPISCOFINS;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if dataSet.FieldByName('base_pis').AsFloat > 0 then
    dataSet.FieldByName('valor_pis').AsFloat := vDadosIni.StrToFloatFormat(
      dataSet.FieldByName('base_pis').AsFloat *
        dataSet.FieldByName('aliq_pis').AsFloat / 100, 2);

  if dataSet.FieldByName('base_cofins').AsFloat > 0 then
    dataSet.FieldByName('valor_cofins').AsFloat := vDadosIni.StrToFloatFormat(
      dataSet.FieldByName('base_cofins').AsFloat *
        dataSet.FieldByName('aliq_cofins').AsFloat / 100, 2);        
end;

function TServTransporte.cancel: boolean;
begin
  if (dataSet.State in [dsEdit, dsInsert]) then
  begin
    dataSet.Cancel;
    RollBackTransacao;
    result := true;
  end;
end;

function TServTransporte.ClipBoardHasChaveCte(userValue: string): Boolean;
var
  chaveCte, cnpj, modelo, serie, numero, uf, emissao: string;
begin
//  Result := False;
//
//  Exit;

  try
    FCTeClipBoard.existe := False;
    if not (dataSet.state in [dsedit, dsinsert]) then
      Exit;

    if userValue <> '' then
      chaveCte := OnlyNumber(userValue)
    else
      chaveCte := OnlyNumber(Clipboard.AsText);

    FCTeClipBoard.existe := Length(chaveCte) = 44;

    if FCTeClipBoard.existe then
    begin
      uf := Copy(chaveCte, 1, 2);
      emissao := Copy(chaveCte, 3, 4);
      cnpj := Copy(chaveCte, 7, 14);
      modelo := Copy(chaveCte, 21, 2);
      serie := Copy(chaveCte, 23, 3);
      numero := Copy(chaveCte, 26, 9);

      FCTeClipBoard.chave := chaveCte;
      FCTeClipBoard.uf := uf;
      FCTeClipBoard.emissao := emissao;
      FCTeClipBoard.modelo := modelo;
      FCTeClipBoard.cnpj := cnpj;
      FCTeClipBoard.serie := serie;
      FCTeClipBoard.numero := StrToInt(numero);
    end;
  finally
    Result := FCTeClipBoard.existe;
  end;
end;

function TServTransporte.CopyCteFromClipboard: Boolean;
var
  codigoTransportador : Integer;
  digcfop: string;
  ano, mes: Integer;
  data: TDateTime;
begin
  Result := False;
  if not (dataSet.state in [dsedit, dsinsert]) then
    exit;

  codigoTransportador := SqlScalar('select codigo_tr from transportador' +
                                   ' where cnpj_tr = ''%s'' ' +
                                   ' and cod_empresa = %d ' +
                                   ' and ativo <> 99 ',
                                   [CTeClipBoard.cnpj, vDadosIni.cod_empresa]).AsInteger;

  if codigoTransportador > 0 then
  begin
    dataSet.FieldByName('cod_transportador').AsInteger := codigoTransportador;
  end                  //COD_TRANSPORTADOR
  else
  begin
    ShowAtencao('Transportador não encontrado no cadastro com o cnpj "%s"', [CTeClipBoard.cnpj]);
    Exit;
  end;

  if SqlScalar('select sigla_uf from estados' +
               ' where ibge_codigo_uf = %s', [CTeClipBoard.uf]).AsString <> vDadosIni.vEmp.vSiglaUF then
    digcfop := '2'
  else
    digcfop := '1';

  dataSet.FieldByName('cfop').AsString := digcfop + IfThen(fint('cfop')= 0, '353', fstr('cfop', 2, 3));

  dataSet.FieldByName('chv_cte').AsString := CTeClipBoard.chave;
  dataSet.FieldByName('modelo').AsString := CTeClipBoard.modelo;
  dataSet.FieldByName('serie').AsString := CTeClipBoard.serie;
  dataSet.FieldByName('num_documento').AsInteger := CTeClipBoard.numero;

  ano := 2000 + StrToInt(Copy(FCTeClipBoard.emissao, 1, 2));
  mes := StrToInt(Copy(FCTeClipBoard.emissao, 3, 2));

  if TryEncodeDate(ano, mes, DayOf(fdate('data_emissao')), data) then
    dataSet.FieldByName('data_emissao').AsDateTime := data
  else if TryEncodeDate(ano, mes, 1, data) then
    dataSet.FieldByName('data_emissao').AsDateTime := DateOf(EndOfTheMonth(data));

  Result := True;

end;

constructor TServTransporte.create(pSsubSerie, pEntSaida: string; pNumNota,
  pCodClFor: integer);
begin
  if dtmNF = nil then
    dtmNF := TdtmNF.Create(dtmNF);
  dataSet := tclientDataSet(DtmNF.cdsServTransporte);
  transacao := tibtransaction(DtmNF.transacao);
  buscas := tibquery(DtmNF.qrBuscas);
  vTransportador := TTransport_Frete.create;
  vCFOP := TNatOP_Frete.create;
  FAjuste := TServTransporte_D195D197.Create(Self);

  vCFOP.abreNaturezaOperacao;
  dataSet.AfterOpen := ServTransporteAfterOpen;
  vsubSerie := pSsubSerie;
  vEntSaida := pEntSaida;
  vNumNota := pNumNota;
  vCodClFor := pCodClFor;
  TableName := 'SERVICO_TRANSPORTE';
end;

constructor TServTransporte.create;
begin
  if dtmNF = nil then
    dtmNF := TdtmNF.Create(dtmNF);
  dataSet := tclientDataSet(DtmNF.cdsServTransporte);
  transacao := tibtransaction(DtmNF.transacao);
  buscas := tibquery(DtmNF.qrBuscas);
  vTransportador := TTransport_Frete.create;
  vCFOP := TNatOP_Frete.create;
  FAjuste := TServTransporte_D195D197.Create(Self);

  vCFOP.abreNaturezaOperacao;
  dataSet.AfterOpen := ServTransporteAfterOpen;
  vsubSerie := '';
  vEntSaida := '';
  vNumNota := 0;
  vCodClFor := 0;
  TableName := 'SERVICO_TRANSPORTE';
end;

function TServTransporte.delete: boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('NF0127', 'EXCLUIR', 'NUM '+ Trim(dataSet.FieldByName('Num_Documento').asString),
    'SERVICO_TRANSPORTE', Trim(dataSet.FieldByName('COD_SERV_TRANSP').asString), buscas, True) then
    exit;

  if dataSet.IsEmpty then
    exit;

  //if dataSet.FieldByName('Ativo').asInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin

      queryCons.SQL('delete from SERVICO_TRANSPORTE_AJUSTE' +
                    ' where servtr_id = (select st.servtr_id' +
                    '   from SERVICO_TRANSPORTE st' +
                    '   where st.cod_serv_transp = :cod_serv_transp' +
                    '   and st.cod_empresa = :cod_empresa)' +
                    ' and cod_empresa = :cod_empresa')
        .ParamValue('cod_serv_transp', fint('cod_serv_transp'))
        .ParamValue('cod_empresa', vDadosIni.cod_empresa)
        .ExecSQL();

      dataSet.Delete;
      if Apply then
        if CommitaTransacao then
          result := true;
    end;
  end;{
  else
    if Application.MessageBox('Tem certeza que deseja mover este arquivo para a Lixeira ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      if Edit then
      begin
        dataSet.FieldByName('Ativo').asString := '0';
        dataSet.Post;
        if Apply then
          if CommitaTransacao then
            result := true;
      end;
    end;}
  Refresh;
end;

procedure TServTransporte.delNotaFiscal(indice: integer; dbList: TListBox);
begin
  try
    if dataSet.State in [dsInsert, dsEdit] then
    begin
      dbList.Items.Delete(indice);
      dataSet.FieldByName('notas_fiscais').AsString := dbList.Items.Text;
    end;
  except
    Application.MessageBox('Campos inválidos', 'Atenção', mb_ok + MB_ICONINFORMATION);
    exit;
  end;
end;

destructor TServTransporte.Destroy;
begin
  vTransportador.Free;
  vCFOP.Free;
  Ajuste.Free;

  inherited;
end;

function TServTransporte.edit: boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('NF0126', 'ALTERAR', 'NUM ' + Trim(dataSet.FieldByName('Num_Documento').asString),
     'SERVICO_TRANSPORTE', Trim(dataSet.FieldByName('COD_SERV_TRANSP').asString), buscas, True) then
    exit;

  if not dataSet.Active then
    result := montaSelect('Select * from Servico_Transporte where 1 = 0');
  if inherited Edit then
  begin
    result := True;
    vTransportador.abreTransportador;
    if frmCadServicoTransporte <> nil then
      frmCadServicoTransporte.DBListBox1.Items.Text :=
        dataSet.FieldByName('notas_fiscais').AsString;
  end;
end;

function TServTransporte.existeFreteCadastrado: boolean;
begin
  Result := false;
  if (trim(dataSet.FieldByName('NUM_DOCUMENTO').AsString) = '') or
    (trim(dataSet.FieldByName('COD_TRANSPORTADOR').AsString) = '')
//    or (trim(dataSet.FieldByName('SUB_SERIE').AsString) = '')
    then
  begin
    Application.MessageBox('Transportador, Numero do documento ou Sub Série não informado ainda.',
      'Atenção', MB_OK + MB_ICONINFORMATION);
    Result := true;
    exit;
  end;
  if (dataSet.State in [dsEdit, dsInsert]) and
    (trim(dataSet.FieldByName('SUB_SERIE').AsString) <> '') then
  begin
    try
      if StrToIntDef(Trim(dataSet.FieldByName('SUB_SERIE').AsString), -99) <> -99 then
        StrToInt(trim(dataSet.FieldByName('SUB_SERIE').AsString));
    except
      Application.MessageBox('Sub Série inválida',
        'Atenção', MB_OK + MB_ICONINFORMATION);
      Result := true;
      exit;
    end;
  end;
  buscas.Close;
  buscas.SQL.Text :=
    'select NUM_DOCUMENTO,COD_TRANSPORTADOR,SUB_SERIE from servico_transporte sv ' +
    ' where sv.num_documento = ' + dataSet.FieldByName('NUM_DOCUMENTO').AsString +
    ' and sv.cod_transportador = ' + dataSet.FieldByName('COD_TRANSPORTADOR').AsString +
    ' and coalesce(sv.sub_serie, '''') = ' + QuotedStr(dataSet.FieldByName('SUB_SERIE').AsString) +
    ' and sv.Cod_Serv_Transp <> ' + IntToStr(dataSet.FieldByName('Cod_Serv_Transp').AsInteger) +
    ' and sv.cod_empresa  = ' + vDadosIni.CodEmpresa;
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    Result := true;
    if Application.MessageBox('Serviço de Transporte já existe.' + sLineBreak +
      'Deseja alterar serviço de transporte existente', 'Confirmação', MB_YESNO + MB_ICONQUESTION)
      = IDYES then
    begin
      dataSet.Cancel;
      montaSelect('select * from servico_transporte sv ' +
        ' where sv.num_documento = ' + Buscas.fieldbyname('NUM_DOCUMENTO').AsString +
        ' and sv.cod_transportador = ' + Buscas.fieldbyname('COD_TRANSPORTADOR').AsString +
        ' and coalesce(sv.sub_serie, '''') = ' + QuotedStr(Buscas.fieldbyname('SUB_SERIE').AsString) +
        ' and sv.cod_empresa  = ' + vDadosIni.CodEmpresa);
      dataSet.Edit;
      if frmCadServicoTransporte <> nil then
        frmCadServicoTransporte.DBListBox1.Items.Text :=
          dataSet.FieldByName('NOTAS_FISCAIS').AsString;
    end;
  end;
end;

function TServTransporte.GetCidadesIbgeDS(): TDataSet;
begin
  Result := SqlOpen('select CODIGO_MUN_IBGE id, NOME_MUNICIPIO cidade, NOME_UF estado from CIDADES_IBGE order by NOME_MUNICIPIO');
end;

function TServTransporte.Insert: boolean;
begin
  result := false;

  if not vDadosIni.PesqPros('NF0125', 'INCLUIR', '', 'SERVICO_TRANSPORTE', '', buscas, True) then
    exit;

  if not dataSet.Active then
    result := montaSelect('Select * from Servico_Transporte where 1 = 0');
  if inherited Insert then
  begin
    result := true;
    vTransportador.abreTransportador;
    dataSet.FieldByName('Situacao').asString := 'N';
    dataset.FieldByName('Ativo').AsInteger := 1;
    dataSet.FieldByName('serie').asString := 'U';
    dataset.FieldByName('Cod_Empresa').AsInteger := StrToint(vDadosIni.codEmpresa);
    dataset.FieldByName('data_lancamento').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataset.FieldByName('data_emissao').AsDateTime := dataset.FieldByName('data_lancamento').AsDateTime;
    dataSet.FieldByName('CIF_FOB_OUTROS').asString := '0';
    dataSet.FieldByName('TP_CT_E').AsInteger := 0;
    if (Trim(Self.vEntSaida) <> '') then
      dataSet.FieldByName('TIPO').asString := Trim(Self.vEntSaida);
    if (Self.vsubSerie <> '') and (Self.vNumNota <> 0) and (Self.vCodClFor <> 0) then
    begin
      addNotaFiscal(Self.vNumNota, StrToInt(Trim(Self.vsubSerie)), Self.vCodClFor);
      vsubSerie := '';
      vEntSaida := '';
      vNumNota := 0;
      vCodClFor := 0;
    end;
  end;
end;

function TServTransporte.post: boolean;
var
  vsubserie: string;
  vndocumento: string;
  vCodTransp: string;
  vDig1Cst, cnpjTr, emissao: string;
  I: Integer;
  vTem, rescueBool: Boolean;
begin
  Result := False;
  try

    if not vDadosIni.PesqPros('NF0129', 'SALVAR', 'NUM ' + Trim(dataSet.FieldByName('Num_Documento').asString),
      'SERVICO_TRANSPORTE', Trim(dataSet.FieldByName('COD_SERV_TRANSP').asString), buscas, True) then
      exit;

    if not (dataSet.state in [dsedit, dsinsert]) then
      exit;

    if Length(OnlyNumber(fstr('CHV_CTE'))) = 44 then
    begin
      rescueBool := FCTeClipBoard.existe;

      if ClipBoardHasChaveCte(fstr('CHV_CTE')) then
      begin
//        emissao := IntToStr(YearOf(fdate('data_emissao')));
//        emissao := emissao + PadL(MonthOf(fdate('data_emissao')), 2);
        emissao := fstr('data_emissao', 9, 2) + fstr('data_emissao', 4, 2);
//        emissao := Copy(IntToStr(YearOf(fdate('data_emissao'))), 3, 2);
//        emissao := emissao + PadL(MonthOf(fdate('data_emissao')), 2);

        cnpjTr := SqlScalar('select cnpj_tr from transportador' +
                            ' where codigo_tr = %d ' +
                            ' and cod_empresa = %d ' +
                            ' and ativo <> 99 ',
                            [fint('cod_transportador'), vDadosIni.cod_empresa]).AsString;

        if (FCTeClipBoard.numero <> fint('Num_Documento')) or
           (FCTeClipBoard.modelo <> fstr('modelo')) or
           (FCTeClipBoard.serie <> PadL(fstr('serie'), 3, '0')) or
           (FCTeClipBoard.emissao <> emissao) or
           (FCTeClipBoard.cnpj <> cnpjTr) then
        begin
          if ShowConfirmacao('Dados do serviço de transporte não correspondem com os dados da Chave do CTe' + sLineBreak + sLineBreak +
                             'Numero: %d' + sLineBreak +
                             'Serie: %s' + sLineBreak +
                             'Modelo: %s' + sLineBreak +
                             'Cnpj Emitente: %s' + sLineBreak +
                             'Mes/Ano emissão: %s/%s' + sLineBreak + sLineBreak +
                             'Deseja continuar com os dados da Chave?',
                             [FCTeClipBoard.numero, FCTeClipBoard.serie, FCTeClipBoard.modelo, FCTeClipBoard.cnpj,
                              Copy(FCTeClipBoard.emissao, 3, 2), Copy(FCTeClipBoard.emissao, 1, 2)]) <> mrYes then
            Exit

          else if not CopyCteFromClipboard then
            Exit;
        end;
      end;
    end;

    if Trim(dataSet.FieldByName('Num_Documento').asString) = '' then
      raise Exception.Create('Campo Número do Documento não pode ser vazio.');

    if Trim(dataSet.FieldByName('Cod_Transportador').asString) = '' then
      raise Exception.Create('Campo Código do Transportador não pode ser vazio.');

    if Trim(dataSet.FieldByName('Tipo').asString) = '' then
      raise Exception.Create('Campo "Usado em notas fiscais de" não pode ser vazio.')
    else if (Trim(dataSet.FieldByName('Tipo').asString) <> 'E') and
      (Trim(dataSet.FieldByName('Tipo').asString) <> 'S') then
      raise Exception.Create('Campo "Usado em notas fiscais de" deve ser preenchido com S ou E');


    if Trim(dataSet.FieldByName('CIF_FOB_OUTROS').asString) = '' then
      raise Exception.Create('Campo Modalidade de Frete não pode ser vazio.');

    if Trim(dataSet.FieldByName('DATA_EMISSAO').asString) = '' then
      raise Exception.Create('Campo Data Emissão não pode ser vazio.');

    if Trim(dataSet.FieldByName('Modelo').asString) = '' then
      raise Exception.Create('Campo Modelo não pode ser vazio.');
    dataSet.FieldByName('Modelo').AsString :=
      vDadosIni.StrZero(Trim(dataSet.FieldByName('modelo').AsString),2);

    if not validacaoModeloAlternativo then
      Exit;

    if Trim(dataSet.FieldByName('Modelo').asString) = '57' then
      if Trim(dataSet.FieldByName('CHV_CTE').asString) = '' then
        raise Exception.Create('Chave do CT-e obrigatória para modelo 57.')
      else if Length(vDadosIni.apenasNumeros(Trim(dataSet.FieldByName('CHV_CTE').asString))) <> 44 then
        raise Exception.Create('Chave do CT-e deve possuir 44 dígitos numericos para modelo 57');
    {
    if Trim(dataSet.FieldByName('Modelo').asString) = '57' then
      try
        dataSet.FieldByName('serie').AsString := IntToStr(StrToInt(Trim(dataSet.FieldByName('serie').AsString)));
      except
        Application.MessageBox('Série inválida. Para modelo "57" a Série deve ser numérica', 'Atenção', MB_OK + MB_ICONINFORMATION);
        Result := False;
        exit;
      end;
    }
    vTem := False;
    for I := Low(modeloFrete) to High(modeloFrete) do
    begin
      vTem := Trim(dataSet.FieldByName('modelo').AsString) = modeloFrete[i];
      if vTem then
        Break;
    end;
    if not vTem then
      raise Exception.Create('Modelo Inválido. Informe um dos seguintes modelos '+sLineBreak+
      'Modelos: 07, 08, 8B, 09, 10, 11, 26, 27 ou 57');

    if Trim(dataSet.FieldByName('CFOP').asString) = '' then
      raise Exception.Create('Campo CFOP não pode ser vazio.');

    if Trim(dataSet.FieldByName('VALOR_TOTAL').asString) = '' then
      raise Exception.Create('Campo Valor Total não pode ser vazio.');

    if (dataSet.FieldByName('BASE_CALC_ICMS').AsFloat >
      dataSet.FieldByName('VALOR_TOTAL').AsFloat) then
      raise Exception.Create('Base de calculo de ICMS não pode ser maior que o Valor Total.');
    if (dataSet.FieldByName('BASE_CALC_ICMS').AsFloat +
      dataSet.FieldByName('ISENTA_N_TRIBUT').AsFloat +
      dataSet.FieldByName('OUTRAS').AsFloat) >
      dataSet.FieldByName('VALOR_TOTAL').AsFloat then
      raise Exception.Create('Soma da Base de ICMS, Outras e Isenta não pode ser maior que o Valor Total.');

    if (dataSet.FieldByName('BASE_CALC_ICMS').AsFloat > 0) and
      (dataSet.FieldByName('VALOR_ICMS').AsFloat = 0) then
      raise Exception.Create('Preencha o valor de ICMS')
    else if (dataSet.FieldByName('BASE_CALC_ICMS').AsFloat = 0) and
      (dataSet.FieldByName('VALOR_ICMS').AsFloat > 0) then
      raise Exception.Create('Preencha o valor da Base de Calculo do ICMS')
    else if (dataSet.FieldByName('BASE_CALC_ICMS').AsFloat > 0) and
      (dataSet.FieldByName('VALOR_ICMS').AsFloat > 0) or
      (dataSet.FieldByName('OUTRAS').AsFloat > 0) then
    begin
      dataSet.FieldByName('ISENTA_N_TRIBUT').AsFloat :=
      dataSet.FieldByName('VALOR_TOTAL').AsFloat -
        (dataSet.FieldByName('BASE_CALC_ICMS').AsFloat +
        dataSet.FieldByName('OUTRAS').AsFloat);
    end
    else
      dataSet.FieldByName('ISENTA_N_TRIBUT').AsFloat :=
        dataSet.FieldByName('VALOR_TOTAL').AsFloat;
    if Trim(dataSet.FieldByName('cst_icms').AsString) = '' then
      vDig1Cst := '0'
    else
      vDig1Cst := Copy(Trim(dataSet.FieldByName('cst_icms').AsString),1,1);
    if (dataSet.FieldByName('BASE_CALC_ICMS').AsFloat > 0) and
      (dataSet.FieldByName('ISENTA_N_TRIBUT').AsFloat > 0) then
      dataSet.FieldByName('cst_icms').AsString := vDig1Cst+ '20'
    else if (dataSet.FieldByName('BASE_CALC_ICMS').AsFloat > 0) then
      dataSet.FieldByName('cst_icms').AsString := vDig1Cst+ '00'
    else if (dataSet.FieldByName('ISENTA_N_TRIBUT').AsFloat > 0) then
      dataSet.FieldByName('cst_icms').AsString := vDig1Cst+ '40'
    else if (dataSet.FieldByName('outras').AsFloat > 0) then
      dataSet.FieldByName('cst_icms').AsString := vDig1Cst+ '90';

    if not vDadosIni.TestarCst(dataSet.FieldByName('cst_icms').AsString) then
    begin
      Result := False;
      Exit;
    end;

    if (dataSet.FieldByName('VALOR_TOTAL').AsFloat > 0) and
      (dataSet.FieldByName('BASE_CALC_ICMS').AsFloat = 0) and
      (dataSet.FieldByName('ISENTA_N_TRIBUT').AsFloat = 0) and
      (dataSet.FieldByName('OUTRAS').AsFloat = 0) then
      raise Exception.Create('Preencha um dos campos (Base de ICMS, Isento, Outras)');

    if vTransportador.dataSet.FieldByName('UF_TR').asString <> '' then
      dataSet.FieldByName('CODIGO_UF').asInteger :=
        vTransportador.dataSet.FieldByName('UF_TR').asInteger;

    if fequals('modelo', '57') then
    begin
      if fint('cod_mun_orig') <= 0 then
        dataSet.FieldByName('cod_mun_orig').AsInteger :=
        	SqlScalar('select cidade_ibge from transportador ' +
          	' where codigo_tr = %d ' +
            ' and cod_empresa = %d ' +
            ' and ativo <> 99 ',
            [fint('cod_transportador'), vDadosIni.cod_empresa]).AsInteger;

      if fint('cod_mun_dest') <= 0 then
        dataSet.FieldByName('cod_mun_dest').AsInteger := vDadosIni.vEmp.vNfe.ibgeCodCidade;

      if fint('cod_mun_orig') <= 0 then
        raiseExceptionCreate('Cidade Origem precisa ser preenchida');

      if fint('cod_mun_dest') <= 0 then
        raiseExceptionCreate('Cidade Destino precisa ser preenchida');
    end
    else
    begin
      dataSet.FieldByName('cod_mun_orig').AsString := '';
      dataSet.FieldByName('cod_mun_dest').AsString := '';
    end;

    if existeFreteCadastrado then
      exit;

    if not verificaLancamentoContasAPagar then
      exit;

    if dataSet.State = dsInsert then
      dataSet.FieldByName('Cod_Serv_Transp').asInteger := Gencodigo('Servico_Transporte',
        dtmNF.SpIncCodigo, vDadosIni.codEmpresa);

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('NF0129', 'SALVAR', 'SUCESSO NUM ' + Trim(dataSet.FieldByName('Num_Documento').asString),
        'SERVICO_TRANSPORTE', Trim(dataSet.FieldByName('COD_SERV_TRANSP').asString), buscas);
      result := true;
      //dataSet.Refresh;
      _verificarDadosSPED;
      exit;
    end;
    if Apply then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('NF0129', 'SALVAR', 'FALHA NUM ' + Trim(dataSet.FieldByName('Num_Documento').asString),
        'SERVICO_TRANSPORTE', Trim(dataSet.FieldByName('COD_SERV_TRANSP').asString), buscas);
      _verificarDadosSPED;
      result := True;
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := False;
    end;
    //Refresh;
  except
    on e: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TServTransporte.restauralixeira: boolean;
begin

end;

procedure TServTransporte.ServTransporteAfterOpen(DataSet: TDataSet);
begin
  if not vTransportador.dataSet.Active then
    vTransportador.abreTransportador;
end;

function TServTransporte.statuslixeira: boolean;
begin

end;

function TServTransporte.validacaoModeloAlternativo: Boolean;
var
  vModelo: string;
  vSerie: string;
  ValidacaoAlternativa, PermiteSerieNula, PermiteSubserieNula: Boolean;
  ValidacaoSerie, ValidacaoSubserie, ValoresSerie, ValoresSubserie : string;
  List: TStrings;
  I: Integer;
  vTmp, vSubSerie: string;
begin
  Result := True;
  try
    vModelo := Trim(dataSet.FieldByName('Modelo').AsString);
    ValidacaoAlternativa := vDadosIni.getConfSisBool( 'nf_e_hab_validacao_alternativa_modelo', buscas);
    if ValidacaoAlternativa then
    begin
      ValidacaoAlternativa := False;
      List := TStringList.Create;
      List := vDadosIni.getConfSisBlob( 'nf_e_hab_validacao_alternativa_modelo', buscas);
      for I := 0 to List.Count - 1 do
      begin
        vTmp := vDadosIni.getValue(Trim(List[i]), 1);
        ValidacaoAlternativa := vDadosIni.StrZero(Trim(vModelo), 3) = vDadosIni.StrZero(Trim(vTmp), 3);
        if ValidacaoAlternativa then
        begin
          ValidacaoSerie      := Trim(vDadosIni.getValue(List[i], 2));
          vTmp                := Trim(vDadosIni.getValue(List[i], 3));
          PermiteSerieNula    := vDadosIni.IfThen(vTmp = '', True, vTmp = 'S');
          ValoresSerie        := Trim(vDadosIni.getValue(List[i], 4));
          ValidacaoSubserie   := Trim(vDadosIni.getValue(List[i], 5));
          vTmp                := Trim(vDadosIni.getValue(List[i], 6));
          PermiteSubserieNula := vDadosIni.IfThen(vTmp = '', True, vTmp = 'S');
          ValoresSubserie     := Trim(vDadosIni.getValue(List[i], 7));
          Break;
        end;
      end;

      if ValidacaoAlternativa then
      begin
        vSerie    := Trim(dataSet.FieldByName('serie').AsString);
        vSubSerie := Trim(dataSet.FieldByName('SUB_SERIE').AsString);
        if (not PermiteSerieNula) and (Trim(vSerie) = '') then
          raiseexceptioncreate('A série para o modelo "' + vModelo + '" de preenchimento obrigatório conforme configuração do sistema', 'DBEEdit47')
        else if ValidacaoSerie = 'N' then
        begin
          if (not PermiteSerieNula) or (Trim(vSerie) <> '') then
            if StrToIntDef(vSerie, -99) = -99 then
              raiseexceptioncreate('A série para o modelo "' + vModelo + '" deve ser numérica conforme configuração do sistema', 'DBEEdit47');
        end;
        if (Trim(ValoresSerie) <> '') and (Trim(vSerie) <> '') then
        begin
          vTmp := vDadosIni.StringReplace2(ValoresSerie, ',;.', '|||', True) + '|';
          List := vDadosIni.SplitS(vTmp);
          vTmp := '';
          for I := 0 to List.Count - 1 do
            if vDadosIni.StrZero(Trim(List[i]), 5) = vDadosIni.StrZero(Trim(vSerie), 5) then
              vTmp := 'OK';
          if vTmp = '' then
            raiseexceptioncreate('A série para o modelo "' + vModelo + '" deve ser preenchida apenas com um dos valores "' + Trim(ValoresSerie) +
              '" conforme configuração do sistema', 'DBEEdit47');
        end;

        if (not PermiteSubserieNula) and (Trim(vSubSerie) = '') then
          raiseexceptioncreate('A subserie para o modelo "' + vModelo + '" de preenchimento obrigatório conforme configuração do sistema', 'DBEEdit47')
        else if ValidacaoSubserie = 'N' then
        begin
          if (not PermiteSubserieNula) or (Trim(vSubSerie) <> '') then
            if StrToIntDef(vSubSerie, -99) = -99 then
              raiseexceptioncreate('A subserie para o modelo "' + vModelo + '" deve ser numérica conforme configuração do sistema', 'DBEEdit47');
        end;
        if (Trim(ValoresSubserie) <> '') and (Trim(vSubSerie) <> '') then
        begin
          vTmp := vDadosIni.StringReplace2(ValoresSubserie, ',;.', '|||', True) + '|';
          List := vDadosIni.SplitS(vTmp);
          vTmp := '';
          for I := 0 to List.Count - 1 do
            if vDadosIni.StrZero(Trim(List[i]), 5) = vDadosIni.StrZero(Trim(vSubSerie), 5) then
              vTmp := 'OK';
          if vTmp = '' then
            raiseexceptioncreate('A subserie para o modelo "' + vModelo + '" deve ser preenchida apenas com um dos valores "' + Trim(ValoresSubserie) +
              '" conforme configuração do sistema', 'DBEEdit47');
        end;
        Result := True;
        Exit;
      end;
    end;

    if Trim(dataSet.FieldByName('Modelo').asString) = '57' then
      dataSet.FieldByName('SUB_SERIE').AsString := ''
    else if Trim(dataSet.FieldByName('Sub_Serie').asString) = '' then
      raise Exception.Create('Campo Subsérie não pode ser vazio.');

    try
      if (dataSet.State in [dsEdit, dsInsert]) and
        (trim(dataSet.FieldByName('SUB_SERIE').AsString) <> '') then
        dataSet.FieldByName('SUB_SERIE').AsString :=
          vDadosIni.StrZero(StrToInt(trim(dataSet.FieldByName('SUB_SERIE').AsString)), 2);
    except
      Application.MessageBox('Sub Série deve ser numérica', 'Atenção', MB_OK + MB_ICONINFORMATION);
      Result := False;
      exit;
    end;

    if Trim(dataSet.FieldByName('Modelo').asString) <> '57' then
      if Trim(dataSet.FieldByName('Serie').asString) = '' then
        raise Exception.Create('Campo Série não pode ser vazio.');
    if Trim(dataSet.FieldByName('Modelo').asString) <> '57' then
      if (Trim(dataSet.FieldByName('Serie').asString) <> 'B') and
      (Trim(dataSet.FieldByName('Serie').asString) <> 'C') and
      (Trim(dataSet.FieldByName('Serie').asString) <> 'U') then
        raise Exception.Create('Série Inválida. Informe B, C ou U');

  except
    on E: Exception do begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TServTransporte.validaCFOP: boolean;
begin
  if not cfopValido(dataSet.FieldByName('CFOP').AsFloat, 'E') then
  begin
    Application.MessageBox('CFOP inválido para esta operação', 'Atenção', mb_ok +
      MB_ICONINFORMATION);
    Exit;
  end;
  if not existeCFOP(dataSet.FieldByName('CFOP').AsFloat) then
  begin
    Application.MessageBox('CFOP não encontrado no cadastro ou não informado', 'Atenção', mb_ok
      + MB_ICONINFORMATION);
    exit;
  end;
  Result := true;
end;

function TServTransporte.verificaLancamentoContasAPagar: boolean;
var
  lista: TMemo;
  I: Integer;
  vTempNumNota, vTempSerie, vTempNumTransp, vTempCodigo: string;
  vTempSql: string;
  vYes: Boolean;
  formulario: TfrmPadrao;
  vTempDataVenc: string;
  vTempHistorico: string;
  vNumConta: Double;
  vCodControle, vCodCl: Integer;
  vTempNumDoc: string;
  vTempDespesa: Boolean;
  vSql: string;
begin
  Result := False;

  buscas.Close;
  buscas.SQL.Text := 'select cod_cliente from clientes' +
    ' where cpfcgc = ' + QuotedStr(Trim(vTransportador.dataSet.FieldByName('CNPJ_TR').AsString)) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
  buscas.Open;

  if buscas.FieldByName('cod_cliente').AsInteger = 0 then
  begin
    Application.MessageBox(pChar('CNPJ: ' + Trim(vTransportador.dataSet.FieldByName('CNPJ_TR').AsString) +
      ' não encontrado no cadastro de Clientes/Fornecedores para cadastro do Contas a Pagar'), 'Atenção',0+64);

    if Application.MessageBox('Se prosseguir o lançamento de contas a pagar não será efetuado. Deseja continuar?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
      Result := True;
    Exit;
  end;
  vCodCl := buscas.FieldByName('cod_cliente').AsInteger;

  buscas.Close;
  buscas.SQL.Text :=
    'select cp.cod_contrp, cp.codigo_emp, cp.num_nota_nfe, cp.serie,  cp.cod_forn_nfe,' +
    ' cp.ref_frete from contas_a_pagar cp' +
    ' where cp.num_nota_nfe = :numero and cp.cod_forn_nfe = :fornecedor and' +
    ' cp.serie = :serie and cp.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' = :cod_empresa and cp.ref_frete = :ref_frete';
  buscas.ParamByName('numero').AsInteger :=
    dataSet.FieldByName('num_documento').AsInteger;
  buscas.ParamByName('fornecedor').AsInteger :=
    vCodCl;
  buscas.ParamByName('serie').AsString :=
    Trim(copy(dataSet.FieldByName('SERIE').AsString,1,5));
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.ParamByName('ref_frete').AsString := 'S'; // quando o campo ref_frete = 'S' quar dizer que o processo abaixo ja foi feito, o sistema ja localizou a parcela referente ao frete lancado pela nota e a alterou quando o frete foi lancado
  buscas.Open;

  if not buscas.IsEmpty then
  begin
    Result := True;
    exit;
  end;
  lista := TMemo.Create(Application);
  try
    lista.Visible := false;
    lista.Parent := Application.MainForm;
    lista.Width := 800;
    lista.Height := 800;
    lista.WordWrap := False;
    lista.Clear;
    lista.Lines.Text := (dataSet.FieldByName('notas_fiscais').AsString);

    for I := 0 to lista.Lines.Count - 1 do
    begin
      if Trim(lista.Lines[i]) <> '' then
      begin
        if pos('|',Trim(lista.Lines[i])) > 0 then
        begin
          vTempNumNota := vDadosIni.getCampoPipe(Trim(lista.Lines[i]),1);
          try
          vTempSerie := IntToStr(StrToInt(Trim(vDadosIni.getCampoPipe(Trim(lista.Lines[i]),2))));
          except
          end;
          vTempNumTransp := vDadosIni.getCampoPipe(Trim(lista.Lines[i]),3);
        end
        else
        begin
          vTempNumNota := copy(Trim(lista.Lines[i]),1,6);
          try
          vTempSerie := IntToStr(StrToInt(Trim(copy(Trim(lista.Lines[i]),8,3))));
          except
          end;
          vTempNumTransp := copy(Trim(lista.Lines[i]),12,6);
        end;
        try
          buscas.Close;
          buscas.ParamByName('numero').AsInteger := StrToInt(trim(vTempNumNota));
          buscas.ParamByName('fornecedor').AsInteger := StrToInt(trim(vTempNumTransp));
          buscas.ParamByName('serie').AsString := Trim(copy(trim(vTempSerie),1,5));
          buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('ref_frete').AsString := 'F';// quando o campo ref_frete = F quer dizer que a nota fiscal lancou a parcela do frete e o sistema esta aguardando o lancamento do frete(servico_transporte)
          buscas.Open;
          if not buscas.IsEmpty then
          begin
            vTempSql :=
              'update contas_a_pagar cp set cp.num_nota_nfe = :numero, cp.serie = :serie,' +
              ' cp.cod_forn_nfe = :fornecedor, ref_frete = :ref_frete, NOME_FOR_CTP = :NOME_FOR_CTP, cpf_cgc_f = :cpf_cgc_f' +
              ' where cp.cod_contrp = :codigo and cp.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
              ' = :cod_empresa';
            vTempCodigo := buscas.FieldByName('cod_contrp').AsString;

            buscas.Close;
            buscas.SQL.Text := vTempSql;
            buscas.ParamByName('numero').AsInteger := dataSet.FieldByName('num_documento').AsInteger;
            buscas.ParamByName('fornecedor').AsInteger := vCodCl;
            buscas.ParamByName('serie').AsString := Trim(copy(dataSet.FieldByName('SERIE').AsString,1,2));
            buscas.ParamByName('ref_frete').AsString := 'S';
            buscas.ParamByName('NOME_FOR_CTP').AsString := copy(vTransportador.dataSet.FieldByName('nome_tr').AsString,1,35);
            buscas.ParamByName('cpf_cgc_f').AsString := vTransportador.fstr('cnpj_tr');
            buscas.ParamByName('codigo').AsInteger := StrToInt(vTempCodigo);
            buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas.ExecSQL;
            Result := True;
            exit;
          end;
        except
        end;
      end;
    end;
  finally
    lista.Free;
    lista := nil;
  end;
  vYes:= Application.MessageBox('Deseja lançar contas a pagar para este Conhecimento de Transporte',
    'Confirmção',MB_ICONQUESTION + MB_YESNO) = IDYES;
  if not vYes then
  begin
    Result := True;
    exit;
  end
  else
  begin
    try
      formulario := TfrmPadrao.Create(Application);
      formulario.Width := 620;
      formulario.Height := 500;
      formulario.Position := poScreenCenter;
      formulario.Caption := 'Lançamentos de Contas a Pagar';
      frmCadServicoTransporte.pnCPCad.Parent := formulario;
      formulario.AutoSize := True;
      formulario.AutoScroll := False;
      formulario.ShowHint := True;
      frmCadServicoTransporte.MaskEdit4.Text := DateToStr(dataSet.FieldByName('data_emissao').AsDateTime + 30);
      frmCadServicoTransporte.MaskEdit5.Text := vDadosIni.StrZero(dataSet.FieldByName('num_documento').AsString,6) + '/F';
      frmCadServicoTransporte.MaskEdit6.Text := HistoricoHelper.Build(CtpDeFreteAvulso, dataSet);
      //frmCadServicoTransporte.MaskEdit6.Text := 'CONHEC FRETE NUM ' + dataSet.FieldByName('num_documento').AsString;
      frmCadServicoTransporte.CheckBox2.Checked := False;
      vYes := formulario.ShowModal = mrOk;
      if vYes then
      begin
        vTempDataVenc := frmCadServicoTransporte.MaskEdit4.Text;
        vTempNumDoc := frmCadServicoTransporte.MaskEdit5.Text;
        vTempHistorico := frmCadServicoTransporte.MaskEdit6.Text;
        vTempDespesa := frmCadServicoTransporte.CheckBox2.Checked;
      end
      else
      begin
        Result := False;
        Exit;
      end;
    finally
      frmCadServicoTransporte.pnCPCad.Parent := frmCadServicoTransporte.tsContasAPagarCadastro;
      formulario.Free;
      formulario := nil;
    end;
    if vYes then
    begin
      buscas.Close;
      buscas.SQL.Text := 'SELECT NCON_C_PROD, NCON_C_VEIC, CONTR_C_PROD FROM CONT_LIG' +
        ' where cod_emp = ' + vDadosIni.codEmpresa;
      buscas.Open;
      if buscas.IsEmpty then
        raise exception.create('Sem contas de ligação para lançar no contas a Pagar');
      vNumConta := buscas.FieldByName('NCON_C_PROD').AsFloat;
      vCodControle := buscas.FieldByName('CONTR_C_PROD').AsInteger;
      vSql := 'INSERT INTO CONTAS_A_PAGAR (CODIGO_EMP, COD_FORN_NFE, NOME_FOR_CTP, N_CONTA_PLC,' +
        ' CODIGO_CTRL, TIPO_CTP, N_DOC_CTP, NPARCELA, QTDE_PARC, DATA_VENC_CTP, VALOR_CTP, DATA_ENT_CTP, VALOR_CTP_ORIG,' +
        ' NATL_CTP, HISTORICO_CTP, NUM_NOTA_NFE, COD_CONTRP, SERIE, N_DOC_CTP_ORIG, DTREFERENCIA, REF_FRETE, VL_CONTABIL, COD_EMP_MULT, US_CAD)' +
        ' VALUES' +
        ' (:CODIGO_EMP, :COD_FORN_NFE, :NOME_FOR_CTP, :N_CONTA_PLC,' +
        ' :CODIGO_CTRL, :TIPO_CTP, :N_DOC_CTP, :NPARCELA, :QTDE_PARC, :DATA_VENC_CTP, :VALOR_CTP, :DATA_ENT_CTP, :VALOR_CTP_ORIG,' +
        ' :NATL_CTP, :HISTORICO_CTP, :NUM_NOTA_NFE, :COD_CONTRP, :SERIE, :N_DOC_CTP_ORIG, :DTREFERENCIA, :REF_FRETE, :VL_CONTABIL, :COD_EMP_MULT, :US_CAD)';
      buscas.Close;
      buscas.SQL.Text := vSql;
      buscas.ParamByName('COD_CONTRP').AsInteger := Gencodigo('CONTAS_A_PAGAR', dtmNF.SpIncCodigo,
        vDadosIni.codEmpresa);
      buscas.ParamByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
      buscas.ParamByName('COD_EMP_MULT').AsString := vDadosIni.codEmpresa;
      buscas.ParamByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
      buscas.ParamByName('NUM_NOTA_NFE').AsInteger := dataSet.FieldByName('num_documento').AsInteger;
      buscas.ParamByName('serie').AsString := Trim(copy(dataSet.FieldByName('serie').AsString,1,5));
      buscas.ParamByName('COD_FORN_NFE').AsInteger := vCodCl;
      buscas.ParamByName('NOME_FOR_CTP').AsString := copy(vTransportador.dataSet.FieldByName('nome_tr').AsString,1,35);
      buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumConta;
      buscas.ParamByName('CODIGO_CTRL').AsInteger := vCodControle;
      if vTempDespesa then
        buscas.ParamByName('TIPO_CTP').AsString := 'D'
      else
        buscas.ParamByName('TIPO_CTP').AsString := 'F';
      buscas.ParamByName('N_DOC_CTP').AsString := copy(vTempNumDoc,1,20);
      buscas.ParamByName('NPARCELA').AsInteger := 1;
      buscas.ParamByName('QTDE_PARC').AsInteger := 1;
      buscas.ParamByName('DATA_VENC_CTP').AsDate := StrToDate(vTempDataVenc);
      buscas.ParamByName('VALOR_CTP').AsCurrency := dataSet.FieldByName('valor_total').AsCurrency;
      buscas.ParamByName('VL_CONTABIL').AsCurrency := dataSet.FieldByName('valor_total').AsCurrency;
      buscas.ParamByName('VALOR_CTP_ORIG').AsCurrency := dataSet.FieldByName('valor_total').AsCurrency;
      buscas.ParamByName('DATA_ENT_CTP').AsDate := dataSet.FieldByName('data_lancamento').AsDateTime;
      buscas.ParamByName('NATL_CTP').AsString := 'C';

      //buscas.ParamByName('HISTORICO_CTP').AsString := copy(vTempHistorico,1,100);
      buscas.ParamByName('HISTORICO_CTP').AsString := Copy(HistoricoHelper.Build(CtpDeFreteAvulso, dataSet, vTempHistorico),1,100);
      buscas.ParamByName('REF_FRETE').AsString := 'S';  //S aqui indica que o CTP ja esta vinculado ao frete
      buscas.ParamByName('N_DOC_CTP_ORIG').AsString := copY(vTempNumDoc,1,20);
      buscas.ParamByName('DTREFERENCIA').AsDate := dataSet.FieldByName('data_lancamento').AsDateTime;
      buscas.Prepare;
      buscas.ExecSQL;
      Result := True;
    end;
  end;
end;

function TServTransporte._abreFormDadosSped: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Dados para Apuração do SPED';

    frmCadServicoTransporte.pnDadosSPED.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [];

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadServicoTransporte.pnDadosSPED.Parent := frmCadServicoTransporte.tsSPED;
    formulario.Free;
    formulario := nil;
  end;
end;

function TServTransporte._salvarDadosSPED: boolean;
var
  vsubserie: string;
  vndocumento: string;
  vCodTransp: string;
  vDig1Cst:string;
  I: Integer;
  vTem: Boolean;
begin
  try
    if not (dataSet.state in [dsedit, dsinsert]) then
      exit;

    if vDadosIni.vEmp.vGerarSpedPISCOFINS = 'S' then
    begin
      if Trim(dataSet.FieldByName('IND_NAT_FRT').AsString) = '' then
        raiseExceptionCreate('Indicador da Natureza do Frete Contratado não informado', '');
      if Trim(dataSet.FieldByName('NAT_BC_CRED').AsString) = '' then
        raiseExceptionCreate('Natureza da Base de Cálculo do Crédito não informada', '');
      if Trim(dataSet.FieldByName('CST_PIS').AsString) = '' then
        raiseExceptionCreate('CST do PIS não informado', '');
      if Trim(dataSet.FieldByName('CST_COFINS').AsString) = '' then
        raiseExceptionCreate('CST do COFINS não informado', '');
      if Trim(dataSet.FieldByName('CST_PIS').AsString) <>
        Trim(dataSet.FieldByName('CST_COFINS').AsString) then
        raiseExceptionCreate('CST do PIS difere do CST do COFINS, devem ser iguais', '');

      if copy(dataSet.FieldByName('CST_PIS').AsString, 1) = '7' then
      begin
        dataSet.FieldByName('base_pis').AsFloat := 0;
        dataSet.FieldByName('aliq_pis').AsFloat := 0;
        dataSet.FieldByName('valor_pis').AsFloat := 0;
        dataSet.FieldByName('base_cofins').AsFloat := 0;
        dataSet.FieldByName('aliq_cofins').AsFloat := 0;
        dataSet.FieldByName('valor_cofins').AsFloat := 0;
      end;
    end;

    Result := inherited post;

    if dataSet.ChangeCount = 0 then
    begin
      CommitaTransacao;
      result := true;
      exit;
    end;
    if Apply then
    begin
      CommitaTransacao;
      result := True;
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      dataSet.Edit;
      Result := False;
    end;
    //Refresh;
  except
    on e: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;

end;

function TServTransporte._verificarDadosSPED: Boolean;
var
  vSqlT: string;
  vCodTemp: integer;
begin

  if not vDadosIni.PesqPros('NF0128', 'CONSULTA', 'NUM '+ Trim(dataSet.FieldByName('Num_Documento').asString),
    'SERVICO_TRANSPORTE', Trim(dataSet.FieldByName('COD_SERV_TRANSP').asString), buscas, True) then
    exit;

  if Pos('SIMPLES', vDadosIni.vEmp.vRegime) > 0 then
    Exit;
    
  if vDadosIni.vEmp.vGerarSpedPISCOFINS <> 'S' then
    Exit;

  if vDadosIni.vEmp.vSpedIncidTribPISCOFINS = '2' then
    Exit;

  if dataSet.IsEmpty then
    Exit;

  vSqlT := dataSet.CommandText;
  vCodTemp := dataSet.FieldByName('COD_SERV_TRANSP').AsInteger;

  montaSelect('Select * from Servico_Transporte where COD_SERV_TRANSP = ' + IntToStr(vCodTemp) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa );

  if dataSet.FieldByName('tipo').AsString = 'S' then
    if dataSet.FieldByName('CIF_FOB_OUTROS').AsInteger <> 1 then
    begin
      Application.MessageBox('Operações de notas fiscais de saída. Crédito de PIS/COFINS apenas para CIF',
        'Atenção', 0 + 64);
      Exit;
    end;

  if dataSet.FieldByName('tipo').AsString = 'E' then
    if dataSet.FieldByName('CIF_FOB_OUTROS').AsInteger <> 2 then
    begin
      Application.MessageBox('Operações de notas fiscais de entrada. Crédito de PIS/COFINS apenas para FOB',
        'Atenção', 0 + 64);
      Exit;
    end;

  try

    dataSet.Edit;

    if Trim(dataSet.FieldByName('NAT_BC_CRED').AsString) = '' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select NAT_BC_CRED from nat_op' +
        ' where codigo_nop = :codigo_nop';
      buscas.ParamByName('codigo_nop').AsFloat := dataSet.FieldByName('cfop').AsInteger;
      buscas.Open;

      if Trim(buscas.FieldByName('NAT_BC_CRED').AsString) <> '' then
        dataSet.FieldByName('NAT_BC_CRED').AsString:= buscas.FieldByName('NAT_BC_CRED').AsString
      else if dataSet.FieldByName('tipo').AsString = 'E' then
        dataSet.FieldByName('NAT_BC_CRED').AsString:= '03'
      else
        dataSet.FieldByName('NAT_BC_CRED').AsString:= '07';
    end;

    if Trim(dataSet.FieldByName('IND_NAT_FRT').AsString) = '' then
    begin
      if dataSet.FieldByName('tipo').AsString = 'S' then
        dataSet.FieldByName('IND_NAT_FRT').AsInteger := 0
      else
        dataSet.FieldByName('IND_NAT_FRT').AsInteger := 2;
    end;

    if Trim(dataSet.FieldByName('CST_PIS').AsString) = '' then
    begin
      dataSet.FieldByName('CST_PIS').AsString := '50';
      dataSet.FieldByName('ALIQ_PIS').AsFloat := vDadosIni.vEmp.vAliqPIS;
      dataSet.FieldByName('BASE_PIS').AsFloat := dataSet.FieldByName('VALOR_TOTAL').AsFloat;
    end;
    if Trim(dataSet.FieldByName('CST_COFINS').AsString) = '' then
    begin
      dataSet.FieldByName('CST_COFINS').AsString := '50';
      dataSet.FieldByName('ALIQ_COFINS').AsFloat := vDadosIni.vEmp.vAliqCOFINS;
      dataSet.FieldByName('BASE_COFINS').AsFloat := dataSet.FieldByName('VALOR_TOTAL').AsFloat;
    end;
    calulcarPISCOFINS;

    Result := _abreFormDadosSped;

  finally
    montaSelect(vSqlT);
    IndexFieldNames := 'COD_SERV_TRANSP';
    FindNearest([vCodTemp]);
    //dataSet.Cancel;
  end;

end;

{ TServTransporte_D195D197 }

constructor TServTransporte_D195D197.Create(AOwner: TServTransporte);
var
  Field: TField;
begin
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_servtr_ajuste');

  FOwner := AOwner;
  Fobjeto := TServTransporteAjuste.Create;
  TableName := 'SERVICO_TRANSPORTE_AJUSTE';

  Field := dataSet.FindField('ID');

  if Field = nil then  
    InitFieldsDef('select * from %s where id = null and cod_empresa = 1', [TableName]);

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('cod_empresa,id,servtr_id', fvInvisivel)
      .Add('VL_BC_ICMS', '', '', DisplayNumber(2))
      .Add('ALIQ_ICMS', '', '', DisplayNumber(2))
      .Add('VL_ICMS', '', '', DisplayNumber(2))
      .Add('VL_OUTROS', '', '', DisplayNumber(2))
  );
end;

function TServTransporte_D195D197.Delete: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not Auditor.Processo('NF0256').Excluir
    .Msg('%d - %d - %s', [FOwner.fint('cod_serv_transp'), fint('cod_obs'), fstr('cod_aj')])
    .Permitido then
    Exit;

  try
    Fobjeto.CopyFrom(dataSet);

    SqlExec(Fobjeto.SQLMotor().SQLDelete);

    if transacao.InTransaction then
      transacao.Commit;

    Result := True;
    DataSet.Refresh;

    Auditor.Sucesso.GravarMensagem('');

  except on E: Exception do
    begin
      transacao.Rollback;
      ShowErro('Erro: %s', [e.Message]);
      registraErro('TServTransporte_D195D197.Delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TServTransporte_D195D197.Destroy;
begin
  Fobjeto.Free;

  FreeDbComponents(True);
  inherited;
end;

function TServTransporte_D195D197.Edit: Boolean;
begin
  Result := False;

  if Self.IsEmpty then
    Exit;

  dataSet.RefreshRecord;

  if not Auditor.Processo('NF0254').Alterar
    .Msg('%d - %d - %s', [FOwner.fint('cod_serv_transp'), fint('cod_obs'), fstr('cod_aj')])
    .Permitido then
    Exit;

  Result := inherited Edit;
  if Result then
  begin
    Fobjeto.CopyFrom(Self.dataSet);
    Fobjeto.beginChanges;
  end;
end;

function TServTransporte_D195D197.Insert: Boolean;
begin
  Result := False;

  if not Auditor.Processo('NF0253').Inserir.Permitido then
    Exit;

  if not dataSet.Active then
    montaSelect('select * from %s where id = null and cod_empresa = 1', [TableName]);

  Result := inherited Insert;
  if Result then
  begin
    if Assigned(Fobjeto) then FreeAndNil(Fobjeto);

    Fobjeto := TServTransporteAjuste.Create;

    dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('servtr_id').AsString := servtr_id;
  end;
end;

function TServTransporte_D195D197.Open: Boolean;
begin
  servtr_id := '';
  try
    if FOwner.IsEmpty then
      Exit;

    servtr_id := queryCons.Table('servico_transporte', 'servtr_id')
      .Equals('cod_serv_transp', FOwner.fint('cod_serv_transp'))
      .Equals('cod_empresa', vDadosIni.cod_empresa)
      .Scalar().AsString;

    if servtr_id = '' then
    begin
      servtr_id := NewGuid();
      queryCons.SQL('update servico_transporte set servtr_id = :servtr_id' +
                    ' where cod_serv_transp = :cod_serv_transp' +
                    ' and cod_empresa = :cod_empresa')
        .ParamValue('servtr_id', servtr_id)
        .ParamValue('cod_serv_transp', FOwner.fint('cod_serv_transp'))
        .ParamValue('cod_empresa', vDadosIni.cod_empresa)
        .ExecSQL();
      queryCons.query.Transaction.Commit;
    end;

  finally
    Self.ClientOpen('select * from %s where servtr_id = ''%s'' and cod_empresa = %d',
      [TableName, servtr_id, vDadosIni.cod_empresa]);
  end;
end;

function TServTransporte_D195D197.Post: Boolean;
var
  Acao, Str, codAj: string;
  I: Integer;
begin
  Result := False;

  if not Auditor.Processo('NF0255').Salvar
    .Msg('%d - %d - %s', [FOwner.fint('cod_serv_transp'), fint('cod_obs'), fstr('cod_aj')])
    .Permitido then
    Exit;

  try
    checkFieldEmpty('cod_obs', 'Lançamento fiscal precisa ser preenchido', '');
    checkFieldEmpty('cod_aj', 'Codigo de ajuste precisa ser preenchido', '');
    checkFieldEmpty('vl_icms', 'Valor do ajuste precisa ser preenchido', '');
    checkFieldEmpty('servtr_id', 'Id de referencia com Servico de transporte inválido. Contacte o suporte técnico', '');

    if SqlScalar('select count(a.id) from SERVICO_TRANSPORTE_AJUSTE a' +
                 ' where a.id <> ''%s'' and a.cod_empresa = %d and a.cod_obs = %d and a.cod_aj = ''%s''',
                 [fstr('id'), vDadosIni.cod_empresa, fint('cod_obs'), fstr('cod_aj')] ).AsInteger > 0 then
    begin
      ShowAtencao('Já existe um registro de ajuste com combinação de Lançamento Fiscal/Codigo de Ajuste');
      Exit;
    end;

    Fobjeto.CopyFrom(dataSet, False);

    if Fobjeto.id = '' then
    begin
      //Fobjeto.servtr_id   := servtr_id;
      Fobjeto.cod_empresa := vDadosIni.cod_empresa;
      Fobjeto.id          := NewGuid();
      try
        SqlExec( Fobjeto.SQLMotor().SQLInsert );

//        with Fobjeto.SQLMotor() do//with Fobjeto.SQLMotor('ID', 'ATIVO') do
//          Fobjeto.id             := SqlInsertGuid(SQLInsert, 'id');

      except on E: Exception do
        begin
          Fobjeto.id := '';
          raise;
        end;
      end;
    end
    else if Fobjeto.FoundChanges then
    begin
      SqlExec(Fobjeto.SQLMotor().SQLUpdate);
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
      if transacao.Active then
        transacao.Rollback;

      ShowErro('Erro: %s', [e.Message]);
      registraErro('TServTransporte_D195D197.Post Erro: ' + e.Message);
    end;
  end;
end;

end.
