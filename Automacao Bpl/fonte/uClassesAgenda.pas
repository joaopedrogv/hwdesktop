unit uClassesAgenda;

interface
uses
  uDataSet_OOP, DB, IBQuery, Classes, DBClient, StdCtrls;

type
  RConsultaCTP = record
    vSqlAdicional: AnsiString;
    vDataIni, vDataFim, vDataIniAd, vDataFimAd, vCondicao, vCondicaoAd, vCampo, vCampoAd, vValor, vValorAd: string;
    vPorData, vAdicional, vPorDataAd, vLancDiferenca: boolean;
  end;

  TAgenda = class;
  TAgendaItens = class;
  TServicosMecanicos = class;
  TClientes = class;
  TLembrete = class;
  TVeiculosPed = class;
  TAparelhosPed = class;

  TAgenda = class(TDataset_OOP)
  private
  public
    buscas2: TIBQuery;
    constructor create;
    destructor Destroy; override;
    function post: boolean; override;
    function Insert: boolean; override;
    function edit: boolean; override;
    function Delete: boolean; override;
    function _agendamentoDisponivel: boolean; 
    function _abreAgenda(pdata: TDateTime; phoraini, phorafim: string): Boolean;
    function _abreResumoAgenda(pdata: TDateTime; phora: string): Boolean;
    function _abreAgendaServicos(pdata: TDateTime; phora: string; pminuto: string): Boolean;
    function _abreAgendaCompleta: Boolean;
    function _abreAgendaEditar(pCodAgenda: Integer): boolean;
    procedure _cadAgenda(pTipoForm: Integer);
    procedure _QuantHorasSemana(pdata: TDateTime);
    function _atualizarAvisosTMO: Boolean;
    function _atualizarLembreteAgenda(nped: Integer; pstatus: string): Boolean;
    function _mostrarClientes(pcod_cliente: Integer): Boolean;
    function _verificar_cliente(pdata: TDateTime; pcod_cliente: Integer): Boolean;
    function _verificar_horas_dia(pdata: TDateTime; phora: string): Boolean;
    function _verificar_horas_disponiveis(pdata: TDateTime; phora: string; vVerifica: string = ''): Boolean;
    function _verificar_feriado(pdata: TDateTime; pturno: string): Boolean;
    function _verificar_servico_especifico_box(pcod_box, pcod_servico: Integer): Boolean;
    function _verificar_servico_especifico_mecanico(pcod_vendedor, pcod_servico: Integer): Boolean;
    function _verificar_box_servico(pcod_box: Integer): boolean;
    function _verificar_temp_vendedor(pcod_vendedor: Integer): boolean;
    function buscaVeiculo(valor: string; placaChassiCodigo: integer; memo: TMemo; pPlaca: string = ''; pChassi: string = ''): boolean;
    function buscaAparelho(codigo: integer; memo: TMemo): boolean;
    procedure datasetAgendaItensAfterScroll(DataSet: TDataSet);
  var
    vAgendaItens: TAgendaItens;
    vCliente: TClientes;
    vVeic: TVeiculosPed;
    vApar: TAparelhosPed;
    vHorasDisponiveis: Double;
    vHorasUtilizadas: Double;
    vHorasPorDia: Double;
    vTmoServicos: Double;
    vTurno: string;
    Quant_Mecanicos: Integer;
  end;

  TAgendaItens = class(TDataset_OOP)
  private
    buscas2: TIBQuery;
    fServicos: TClientDataSet;
  public
    dtSet: TClientDataSet;
    fTemp: TClientDataSet;
    fMecanicos: TClientDataSet;
    fBox: TClientDataSet;
    constructor create;
    function post: Boolean; override;
    function Insert: Boolean; override;
    function Delete: Boolean; override;
    function _PreencherDatasetTemp: Boolean;
    function _abreTodosServicos: Boolean;
    function _abreAgendaItens(pcod_agenda: Integer): boolean;
    function _abreServicoAgenda(pdata, phora: string): Boolean;
    function _atualizarCodAgenda(pcod_agenda: Integer): boolean;
    function _MostrarServicos(pcod_servico: Integer): Boolean;
    function _mostrarMecanicos: Boolean;
    function _mostrarBox(ptempo_medio: Double): Boolean;
    function _verificarServicoRepetido(pcod_servico: Integer): Boolean;
    function _verificaServicos(pdata: TDateTime; pcod_servico: Integer): Boolean;
    procedure _marcaDesmarcaLinha;
    procedure _LimparDados(pTodos: boolean = false);
    procedure _PreecherBox;
    procedure _PreecherMecanico;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    function _tempoPorBox: Boolean;
    function _buscarTmoBox(ptempo_medio: Double): Boolean;

  var
    vAgenda: TAgenda;
    vTmoAgenda: Double;
    vTmoServPorBox: Double;
    NITEM: Integer;
    ultimasql: string;
  end;

  TServicosMecanicos = class(TDataSet_OOP)
  private
  public
    fMecanicos: TClientDataSet;
    constructor create;
    function _abreAgendaMecanico: boolean;
    function _abrirMecanicos: boolean;
    function _buscarMecanico(pcod_vendedor: Integer): boolean;
    procedure _cadServicosMecanicos(pTipoForm: Integer);
    function _defineSqlAdicional: boolean;
    function ConsultaAvancada(pDateINI, pDateFIM: string; pMec: boolean; pMecanico: Integer): boolean;
  var
    rBOL: RConsultaCTP;
  end;

  TClientes = class(TDataset_OOP)
  private

  public
    constructor create;
    function _abreCliente: Boolean;
    function buscaCliente(cod_cliente: integer): boolean; overload;
    function LocCliente(Cod_Cliente: integer): boolean;
  var
    vCliente: TClientes;
  end;

  TLembrete = class(TDataset_OOP)
  private

  public
    constructor create;
    function MostrarLembrete: boolean; overload;
  end;

  TVeiculosPed = class(TDataSet_OOP)
  public
    constructor create;
    function abreVeiculo(codigo: integer): boolean;
  end;

  TAparelhosPed = class(TDataSet_OOP)
  public
    constructor create;
    function abreAparelho(codigo: integer): boolean;
  end;

var
  CadAgenda: TAgenda;
  CadAgendaItens: TAgendaItens;
  ServicosMecanicos: TServicosMecanicos;
  Lembrete: TLembrete;
  Quant_Horas_Dia: Double;

implementation

uses uDadosIni, uPadrao, IBDatabase, Forms, Windows, uDtmAtivo, SysUtils, RDprint, Controls,
  Variants, UDtmPedVenda, uCadAgenda, uDtmAgenda, uServicosMecanicos;

{ TAgenda }

function TAgenda.buscaAparelho(codigo: integer; memo: TMemo): boolean;
var
  temp: string;
begin
  if codigo = 0 then
  begin
    Result := False;
    Application.MessageBox('Objeto não informado', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    exit;
  end;
  vApar.abreAparelho(codigo);
  if vApar.IsEmpty then
  begin
    Result := false;
    Application.MessageBox('Objeto não encontrado', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    vApar.Close;
    memo.Clear;
    exit;
  end;
  if vApar.dataSet.FieldByName('TIP_EQUIP').AsString = 'I' then
  begin
    Result := false;
    Application.MessageBox('Objeto interno, selecione somente objetos externos', 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    vApar.Close;
    memo.Clear;
    exit;
  end;
  if dataSet.State in [dsinsert, dsEdit] then
  begin
    temp := retornaValor('select first 1 (''O.S.: ''||nped||'' - Data: ''||' +
      'substring(cast(data_ped as varchar(50)) from 9 for 2)||''/''||' +
      'substring(cast(data_ped as varchar(50)) from 6 for 2)||''/''||' +
      'substring(cast(data_ped as varchar(50)) from 1 for 4)) as valor from pedvenda' +
      ' where tipo = ''OS'' and cod_equip = ' + IntToStr(codigo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and nped <> ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and (status_ped is null or status_ped = '''') order by data_ped');
    if temp <> '' then
    begin
      Result := false;
      if Application.MessageBox(pchar('Existe O.S. aberta para este Objeto. ' + temp + #13 +
        'Deseja continuar?'), 'Atenção',
        MB_ICONQUESTION + MB_YESNO) = ID_NO then
      begin
        vApar.Close;
        memo.Clear;
        exit;
      end;
    end;

    dataSet.FieldByName('COD_EQUIP').AsInteger := codigo;

    if (dataSet.FieldByName('COD_CLIENTE').AsInteger = 0) then
    begin
      dataSet.FieldByName('COD_CLIENTE').AsInteger :=
        vApar.dataSet.fieldbyname('COD_PROP').AsInteger;
      vCliente.LocCliente(dataSet.FieldByName('COD_CLIENTE').AsInteger);
    end;
  end;
  memo.Clear;
  memo.lines.Add('Série: ' + TRIM(vApar.dataSet.fieldbyname('N_SERIE').asstring) + ' ' +
    TRIM(vApar.dataSet.fieldbyname('MARCA').asstring) + ' ' +
    TRIM(vApar.dataSet.fieldbyname('MODELO').asstring));
  memo.lines.add('COR: ' + vApar.dataSet.fieldbyname('COR').asstring);
  Result := true;
end;


function TAgenda.buscaVeiculo(valor: string; placaChassiCodigo: integer; memo: TMemo; pPlaca: string = ''; pChassi: string = ''): boolean;
var
  temp: string;
begin
  if placaChassiCodigo = 0 then
  begin
    temp := ' where placa = ' + QuotedStr(pPlaca) +
      ' and chassi = ' + QuotedStr(pChassi) +
      ' and codigo = ' + (valor);
  end
  else if placaChassiCodigo = 1 then
    temp := ' where placa = ' + QuotedStr(valor)
  else if placaChassiCodigo = 2 then
    temp := ' where chassi = ' + QuotedStr(valor)
  else if placaChassiCodigo = 3 then
    temp := ' where codigo = ' + valor
  else
  begin
    Result := false;
    Application.MessageBox('Veículo não informado', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    vVeic.Close;
    memo.Clear;
    exit;
  end;
  vVeic.montaSelect('select * from veiculos' + temp +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
  if vVeic.IsEmpty then
  begin
    Result := false;
    Application.MessageBox('Veículo não encontrado', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    vVeic.Close;
    memo.Clear;
    exit;
  end;
  if dataSet.State in [dsinsert, dsEdit] then
  begin
    temp := retornaValor('select first 1 (''O.S.: ''||nped||'' - Data: ''||' +
      'substring(cast(data_ped as varchar(50)) from 9 for 2)||''/''||' +
      'substring(cast(data_ped as varchar(50)) from 6 for 2)||''/''||' +
      'substring(cast(data_ped as varchar(50)) from 1 for 4)) as valor from pedvenda' +
      ' where placa = ' + QuotedStr(vVeic.dataSet.FieldByName('placa').AsString) +
      ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and nped <> ' + IntToStr(dataSet.FieldByName('nped').AsInteger) +
      ' and (status_ped is null or status_ped = '''')');
    if temp <> '' then
    begin
      Result := false;
      if Application.MessageBox(pchar('Existe O.S. aberta para este Veículo. ' + temp + #13 +
        'Deseja continuar?'), 'Atenção',
        MB_ICONQUESTION + MB_YESNO) = ID_NO then
      begin
        vVeic.Close;
        memo.Clear;
        exit;
      end;
    end;
    dataSet.FieldByName('cod_veiculo').AsString := vVeic.dataSet.FieldByName('codigo').AsString;
    dataSet.FieldByName('placa').AsString := vVeic.dataSet.FieldByName('placa').AsString;
    dataSet.FieldByName('chassi').AsString := vVeic.dataSet.FieldByName('chassi').AsString;
    if (dataSet.FieldByName('COD_CLIENTE').AsInteger = 0) then
    begin
      dataSet.FieldByName('COD_CLIENTE').AsInteger :=
        vVeic.dataSet.fieldbyname('cod_cliente').AsInteger;
      vCliente.LocCliente(dataSet.FieldByName('COD_CLIENTE').AsInteger);
    end;
  end;
  memo.Clear;
  memo.lines.Add(TRIM(vVeic.dataSet.FieldByName('ESPECIE').AsString) + ' ' +
    TRIM(vVeic.dataSet.FieldByName('MARCA_V').AsString) + ' ' +
    TRIM(vVeic.dataSet.FieldByName('DESCMODELO').AsString));
  memo.lines.add(TRIM(vVeic.dataSet.FieldByName('ANOFAB').asstring) + '/' +
    TRIM(vVeic.dataSet.FieldByName('ANOMOD').asstring));
  memo.lines.add(TRIM(vVeic.dataSet.FieldByName('OBS').AsString));

  Result := true;

end;

constructor TAgenda.create;
begin
  if DtmAgenda = nil then
    DtmAgenda := TDtmAgenda.Create(DtmAgenda);

  DataSet := TClientDataSet(DtmAgenda.cdsAgenda);
  transacao := TIBTransaction(DtmAgenda.transacao);
  Buscas := TIBQuery(DtmAgenda.qrBuscas);

  vAgendaItens := TAgendaItens.Create;
  vApar := TAparelhosPed.create;
  vVeic := TVeiculosPed.create;
  vCliente := TClientes.create;
//  dataSet.AfterScroll := datasetAgendaItensAfterScroll;
end;

procedure TAgenda.datasetAgendaItensAfterScroll(DataSet: TDataSet);
begin
  vAgendaItens._abreAgendaItens(dataSet.FieldByName('COD_AGENDA').AsInteger);
end;

function TAgenda.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('COD_AGENDA').AsString;

  if not vDadosIni.PesqPros('AGO005', 'EXCLUIR', '', 'AGENDA',
    dataSet.FieldByName('COD_AGENDA').AsString, buscas, false) then
    Exit;

  if Application.MessageBox('Tem certeza que deseja demarcar o agendamento?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
    Exit;

  if ExecutaComandosSql('select first 1 nped from pedvenda ' +
    ' where cod_agenda = ' + IntToStr(dataSet.FieldByName('COD_AGENDA').AsInteger) +
    ' and tipo=''OS'' and cod_empresa = ' + vDadosIni.codEmpresa) then
  begin
    Application.MessageBox('O Agendamento não pode ser demarcado, pois possui uma OS',
      'Atenção', 0 + 64);
    Exit;
  end;

  buscas.Close;
  buscas.SQL.Text := 'update sugestaoservico set cod_agenda = null ' +
  	' where cod_agenda = ' + IntToStr(dataSet.FieldByName('COD_AGENDA').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.ExecSQL;
  
  result := inherited Delete;
  if Result then
    result := Apply;

  if result then
    result := CommitaTransacao;
  if Result then
    vDadosIni.GravaAuditoria('AGO005', 'EXCLUIR', 'SUCESSO', 'AGENDA', vCodFormula, buscas)
  else
    vDadosIni.GravaAuditoria('AGO005', 'EXCLUIR', 'FALHA', 'AGENDA', vCodFormula, buscas);

  Result := true;
  Refresh;

end;

destructor TAgenda.Destroy;
begin
  vAgendaItens.Free;
  vAgendaItens := nil;
  vApar.Free;
  vApar := nil;
  vVeic.Free;
  vVeic := nil;
  vCliente.Free;
  vCliente := nil;

  inherited;
end;

function TAgenda.edit: boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('AGO004', 'ALTERAR', '', 'AGENDA',
    '', buscas, false) then
    Exit;

  if inherited Edit then
  begin
    Result := True;
    dataSet.FieldByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('COD_CLIENTE').AsInteger;
    dataSet.FieldByName('NOME_CLIENTE').AsString := dataSet.FieldByName('NOME_CLIENTE').AsString;
    dataSet.FieldByName('FONE_CLIENTE').AsString := dataSet.FieldByName('FONE_CLIENTE').AsString;
    dataSet.FieldByName('DATA_AGENDA').AsString := dataSet.FieldByName('DATA_AGENDA').AsString;
    dataSet.FieldByName('HORA_AGENDA').AsString := dataSet.FieldByName('HORA_AGENDA').AsString;
    dataSet.FieldByName('MINUTO_AGENDA').AsString := dataSet.FieldByName('MINUTO_AGENDA').AsString;
    dataSet.FieldByName('OBSERVACAO').AsString := dataSet.FieldByName('OBSERVACAO').AsString;
    vAgendaItens._abreTodosServicos;
    vCliente._abreCliente;
    vAgendaItens._abreAgendaItens(dataSet.FieldByName('COD_AGENDA').AsInteger);
    vAgendaItens._PreencherDatasetTemp;
  end;
end;

function TAgenda.Insert: boolean;
begin
  if not vDadosIni.PesqPros('AGO003', 'INCLUIR', '', 'AGENDA',
    '', buscas, True) then
    Exit;

  if not dataSet.Active then
    montaSelect('select a.* from agenda a ' +
      ' where a.cod_agenda=0 and a.cod_empresa =0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_AGENDA').AsInteger := 0;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('STATUS_AGENDA').AsString := 'AGENDADO';

    vAgendaItens._abreTodosServicos;
    vCliente._abreCliente;
    vAgendaItens._abreAgendaItens(-1);
    vAgendaItens.dtSet.EmptyDataSet;
  end;
end;

function TAgenda.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    vDadosIni.vPesquisaCodAgenda := '';
    vDadosIni.vPesquisaDataAgenda := '';

    Result := false;

    if dataSet.IsEmpty then
      exit;

    if not vDadosIni.PesqPros('AGO006', 'SALVAR', '', 'AGENDA',
      dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if vDadosIni.vEmp.vUsarAparelho = 'S' then
    begin
      if dataSet.FieldByName('COD_EQUIP').IsNull then
        raiseExceptionCreate('Equipamento deve ser informada', 'DBEdit41');
    end
    else
    begin
      if dataSet.FieldByName('COD_VEICULO').IsNull then
        raiseExceptionCreate('Veículo deve ser informada', 'DBEdit32');

      if trim(dataSet.FieldByName('PLACA').AsString) = '' then
        raiseExceptionCreate('Placa deve ser informada', 'DBEdit32');

      if trim(dataSet.FieldByName('NOME_CLIENTE').AsString) = '' then
        raiseExceptionCreate('Chassi deve ser informado', 'DBEdit38');
    end;
      
    if dataSet.FieldByName('COD_CLIENTE').IsNull then
      dataSet.FieldByName('COD_CLIENTE').AsInteger := 0;

    if dataSet.FieldByName('DATA_AGENDA').AsString = '  /  /    ' then
      raiseExceptionCreate('Data da agenda deve ser informada', 'DBEdit2');

    if trim(vDadosIni.vEmp.vUsarDomingoAgenda) <> 'S' then
    	if (DayOfWeek(dataSet.FieldByName('DATA_AGENDA').AsDateTime) = 1) then
      	raiseExceptionCreate('Data da agenda informada é domingo (Agenda não configurada para o Domingo)', 'DBEdit2');

    if trim(dataSet.FieldByName('HORA_AGENDA').AsString) = '' then
      raiseExceptionCreate('Hora da agenda deve ser informada', 'DBEdit3');

    if Length(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) < 2 then
      raiseExceptionCreate('Hora da agenda inválida (2 dígitos)', 'DBEdit3');

    if (DayOfWeek(dataSet.FieldByName('DATA_AGENDA').AsDateTime) = 1) then
    begin
      if (trim(vDadosIni.vEmp.vHora_Manha_Dom) = '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) >= 0)
        and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) <= 12) then
      begin
      	raiseExceptionCreate('Hora da agenda - manha (Domingo) não definido', 'DBEdit3');
      end
      else if (trim(vDadosIni.vEmp.vHora_Tarde_Dom) = '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) >= 13)
        and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) <= 23) then
      begin
      	raiseExceptionCreate('Hora da agenda - tarde (Domingo) não definido', 'DBEdit3');
      end
    	else if (trim(vDadosIni.vEmp.vHora_Manha_Dom) <> '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) < StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Dom, 1, 2))) then
      begin
        raiseExceptionCreate('Hora da agenda inválida (Domingo): ' + #13 + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Manha_Dom, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Manha_Dom, 4, 2) + ')' + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 4, 2) + ')', 'DBEdit3');
      end
      else if (trim(vDadosIni.vEmp.vHora_Manha_Dom) <> '')
      	and (trim(vDadosIni.vEmp.vHora_Tarde_Dom) <> '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) > StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Dom, 4, 2)))
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) < StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 1, 2))) then
      begin
      	raiseExceptionCreate('Hora da agenda inválida (Domingo): ' + #13 + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Manha_Dom, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Manha_Dom, 4, 2) + ')' + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 4, 2) + ')', 'DBEdit3');
      end
      else if (trim(vDadosIni.vEmp.vHora_Tarde_Dom) <> '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) > StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 4, 2))) then
      begin
        raiseExceptionCreate('Hora da agenda inválida (Domingo): ' + #13 + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Manha_Dom, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Manha_Dom, 4, 2) + ')' + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 4, 2) + ')', 'DBEdit3');
      end;
    end
    else if (DayOfWeek(dataSet.FieldByName('DATA_AGENDA').AsDateTime) = 7) then
    begin
    	if (trim(vDadosIni.vEmp.vHora_Manha_Sab) = '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) >= 0)
        and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) <= 12) then
      begin
      	raiseExceptionCreate('Hora da agenda - manha (Sábado) não definido', 'DBEdit3');
      end
      else if (trim(vDadosIni.vEmp.vHora_Tarde_Sab) = '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) >= 13)
        and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) <= 23) then
      begin
      	raiseExceptionCreate('Hora da agenda - tarde (Sábado) não definido', 'DBEdit3');
      end
     	else if (trim(vDadosIni.vEmp.vHora_Manha_Sab) <> '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) < StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Sab, 1, 2))) then
      begin
        raiseExceptionCreate('Hora da agenda inválida (Sábado): ' + #13 + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Manha_Sab, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Manha_Sab, 4, 2) + ')' + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 4, 2) + ')', 'DBEdit3');
      end
      else if (trim(vDadosIni.vEmp.vHora_Manha_Sab) <> '')
      	and (trim(vDadosIni.vEmp.vHora_Tarde_Sab) <> '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) > StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Sab, 4, 2)))
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) < StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 1, 2))) then
      begin
      	raiseExceptionCreate('Hora da agenda inválida (Sábado): ' + #13 + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Manha_Sab, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Manha_Sab, 4, 2) + ')' + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 4, 2) + ')', 'DBEdit3');
      end
      else if (trim(vDadosIni.vEmp.vHora_Tarde_Sab) <> '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) > StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 4, 2))) then
      begin
        raiseExceptionCreate('Hora da agenda inválida (Sábado): ' + #13 + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Manha_Sab, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Manha_Sab, 4, 2) + ')' + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 4, 2) + ')', 'DBEdit3');
      end;
    end
    else
    begin
      if (trim(vDadosIni.vEmp.vHora_Manha_Semana) = '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) >= 0)
        and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) <= 12) then
      begin
      	raiseExceptionCreate('Hora da agenda - manha (Semana) não definido', 'DBEdit3');
      end
      else if (trim(vDadosIni.vEmp.vHora_Tarde_Semana) = '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) >= 13)
        and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) <= 23) then
      begin
      	raiseExceptionCreate('Hora da agenda - tarde (Semana) não definido', 'DBEdit3');
      end
     	else if (trim(vDadosIni.vEmp.vHora_Manha_Semana) <> '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) < StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Semana, 1, 2))) then
      begin
        raiseExceptionCreate('Hora da agenda inválida (Semana): ' + #13 + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Manha_Semana, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Manha_Semana, 4, 2) + ')' + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 4, 2) + ')', 'DBEdit3');
      end
      else if (trim(vDadosIni.vEmp.vHora_Manha_Semana) <> '')
      	and (trim(vDadosIni.vEmp.vHora_Tarde_Semana) <> '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) > StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Semana, 4, 2)))
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) < StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 1, 2))) then
      begin
      	raiseExceptionCreate('Hora da agenda inválida (Semana): ' + #13 + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Manha_Semana, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Manha_Semana, 4, 2) + ')' + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 4, 2) + ')', 'DBEdit3');
      end
      else if (trim(vDadosIni.vEmp.vHora_Tarde_Semana) <> '')
      	and (StrToInt(trim(dataSet.FieldByName('HORA_AGENDA').AsString)) > StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 4, 2))) then
      begin
        raiseExceptionCreate('Hora da agenda inválida (Semana): ' + #13 + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Manha_Semana, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Manha_Semana, 4, 2) + ')' + #13 +
          '(Entre ' + Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 1, 2) +
          ' a ' + Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 4, 2) + ')', 'DBEdit3');
      end;
    end;

    if trim(dataSet.FieldByName('MINUTO_AGENDA').AsString) = '' then
      raiseExceptionCreate('Minuto da agenda deve ser informada', 'DBEdit4');

    if Length(trim(dataSet.FieldByName('MINUTO_AGENDA').AsString)) < 2 then
      raiseExceptionCreate('Minuto da agenda inválido (2 dígitos)', 'DBEdit4');

    if StrToInt(trim(dataSet.FieldByName('MINUTO_AGENDA').AsString)) < 0 then
      raiseExceptionCreate('Minuto da agenda inválido (Entre 0 a 59)', 'DBEdit3');

    if StrToInt(trim(dataSet.FieldByName('MINUTO_AGENDA').AsString)) > 59 then
      raiseExceptionCreate('Minuto da agenda inválido (Entre 0 a 59)', 'DBEdit3');

    if trim(dataSet.FieldByName('NOME_CLIENTE').AsString) = '' then
      raiseExceptionCreate('Cliente deve ser informada', 'DBEdit9');

    if vAgendaItens.dataSet.IsEmpty then
      raiseExceptionCreate('Serviço deve ser informado', 'BitBtn16');

    if vAgendaItens.dataSet.State in [dsInsert, dsEdit] then
      raiseExceptionCreate('Confirme a inclusão do Serviço antes de continuar', 'BitBtn16');

    if not _verificar_horas_dia(dataSet.FieldByName('DATA_AGENDA').AsDateTime,
      dataSet.FieldByName('HORA_AGENDA').AsString) then
      raiseExceptionCreate('Horário de trabalho não disponível para este dia !', 'DBEdit3');

    // Procedimento para verificar se o dia informado é feriado
    if _verificar_feriado(dataSet.FieldByName('DATA_AGENDA').AsDateTime, vTurno) then
      raiseExceptionCreate('Dia ' + dataSet.FieldByName('DATA_AGENDA').AsString +
        ' foi cadastrado como feriado !', 'DBEdit2');

    // Procedimento para verificar se o cliente possuí uma agendamento no dia informado
    if dataSet.State = dsInsert then
      if not _verificar_cliente(dataSet.FieldByName('DATA_AGENDA').AsDateTime,
        dataSet.FieldByName('COD_CLIENTE').AsInteger) then
      begin
        if Application.MessageBox(PChar('Cliente possuí um agendamento marcado neste dia !' +
          chr(13)
          + 'Deseja continuar?'),
          'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1)
          = mrNo then
          Exit;
        if not vDadosIni.PesqPros('AGO011', 'SALVAR', '', 'AGENDA',
          dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
          Exit;

      end;

    // Procedimento para verificar tempo disponível
    if not _verificar_horas_disponiveis(dataSet.FieldByName('DATA_AGENDA').AsDateTime,
      dataSet.FieldByName('HORA_AGENDA').AsString) then
    begin
      if Application.MessageBox(PChar(
        'Agenda sem tempo suficiente, '
        + #13 + 'Total de minutos por dia ..........=   ' + FloatToStr(vHorasPorDia)
        + #13 + 'Total de minutos utilizados ......= - ' + FloatToStr(vHorasUtilizadas)
        + #13 + 'Total de minutos dispóniveis ...=   ' + FloatToStr(vHorasDisponiveis)
        + #13 + 'Minutos deste agendamento ...=   ' + FloatToStr(vTmoServicos * 60) + '' + chr(13) + chr(13) + 'Deseja continuar?'),
        'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1)
        = mrNo then
        Exit;

      if not vDadosIni.PesqPros('AGO010', 'SALVAR', '', 'AGENDA',
        dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
        Exit;
    end;

    dataSet.FieldByName('TMO_SERVICO').AsFloat := vTmoServicos;

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('COD_AGENDA').AsInteger := Gencodigo('AGENDA',
        DtmAgenda.SpIncCodigo, vDadosIni.codEmpresa);

			vDadosIni.vPesquisaCodAgenda := IntToStr(dataSet.FieldByName('COD_AGENDA').AsInteger);
      vDadosIni.vPesquisaDataAgenda := DateTimeToStr(dataSet.FieldByName('DATA_AGENDA').AsDateTime);

      Result := inherited post;

      if (DataSet.ChangeCount = 0) then
        Result := True
      else
        Result := Apply;

      vAgendaItens._atualizarCodAgenda(dataSet.FieldByName('COD_AGENDA').AsInteger);

      if vAgendaItens.Apply then
        vAgendaItens.Refresh
      else
      begin
        result := false;
        dataSet.edit;
        exit;
      end;

    end
    else
    begin
      vDadosIni.vPesquisaCodAgenda := IntToStr(dataSet.FieldByName('COD_AGENDA').AsInteger);
      vDadosIni.vPesquisaDataAgenda := DateTimeToStr(dataSet.FieldByName('DATA_AGENDA').AsDateTime);
      
      Result := inherited post;

      if (DataSet.ChangeCount = 0) then
        Result := True
      else
        Result := Apply;

      if (vAgendaItens._atualizarCodAgenda(dataSet.FieldByName('COD_AGENDA').AsInteger)) then
      begin
        if vAgendaItens.Apply then
          vAgendaItens.Refresh
        else
        begin
          result := false;
          dataSet.edit;
          exit;
        end;
      end;
    end;

    if result then
      result := CommitaTransacao;

    if Result then
      vDadosIni.GravaAuditoria('AGO006', acao, 'SUCESSO', 'AGENDA',
        dataSet.FieldByName('COD_AGENDA').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('AGO006', acao, 'FALHA', 'AGENDA',
        dataSet.FieldByName('COD_AGENDA').AsString, buscas);

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

function TAgenda._abreAgenda(pdata: TDateTime; phoraini, phorafim: string): boolean;
begin
  if Length(phoraini) < 2 then
    phoraini := '0' + phoraini;

  if Length(phorafim) < 2 then
    phorafim := '0' + phorafim;

  buscas.Close;
  buscas.SQL.Text := 'select a.* from agenda a ' +
    ' where a.data_agenda = :data_agenda ' +
    ' and a.hora_agenda >= :hora_ini and a.hora_agenda <= :hora_fim ' +
    ' and a.cod_empresa = :cod_empresa ' +    
    ' order by a.data_agenda asc, a.hora_agenda asc, a.minuto_agenda asc ';
  buscas.ParamByName('DATA_AGENDA').AsDate := pdata;
  buscas.ParamByName('HORA_INI').AsString := phoraini;
  buscas.ParamByName('HORA_FIM').AsString := phorafim;
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;
end;

function TAgenda._abreAgendaCompleta: Boolean;
begin
  Result := montaSelect('select distinct a.* from agenda a ' +
    ' inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa ' +
    ' where a.cod_empresa= ' + vDadosIni.codEmpresa +
    ' order by a.data_agenda desc, a.hora_agenda asc, a.minuto_agenda asc ');
end;

function TAgenda._abreAgendaEditar(pCodAgenda: Integer): boolean;
begin
  dataSet.Close;
  dataSet.CommandText := ' select distinct a.* from agenda a ' +
    ' inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa ' +
    ' where a.cod_agenda = :cod_agenda ' +
    ' and a.cod_empresa= :cod_empresa ';
  dataSet.Params.ParamByName('COD_AGENDA').AsInteger := pCodAgenda;
  dataSet.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.Open;

  Result := not dataSet.IsEmpty;

  if dataSet.IsEmpty then
  begin
    vAgendaItens._abreAgendaItens(-1);
    Result := false;
  end;
end;

function TAgenda._abreAgendaServicos(pdata: TDateTime; phora: string; pminuto: string): Boolean;
begin
    if ((trim(phora) <> '') and (Length(phora) < 2)) then
    	phora := '0' + trim(phora);

    if ((trim(pminuto) <> '') and (Length(pminuto) < 2)) then
    	pminuto := '0' + trim(pminuto);

    dataSet.Close;
    dataSet.CommandText := ' select distinct a.* from agenda a ' +
      ' inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa ' +
      ' where a.data_agenda = :data_agenda ';
    if (trim(phora) <> '') then
	    dataSet.CommandText := dataSet.CommandText + ' and a.hora_agenda = :hora_agenda ';
    if (trim(pminuto) <> '') then
	    dataSet.CommandText := dataSet.CommandText + ' and a.minuto_agenda = :minuto_agenda ';
    dataSet.CommandText := dataSet.CommandText +
      ' and a.cod_empresa= :cod_empresa ' +
      //' and a.nped is null
      ' order by a.data_agenda asc, a.hora_agenda asc, a.minuto_agenda asc ';
    dataSet.Params.ParamByName('DATA_AGENDA').AsDate := pdata;
    if (trim(phora) <> '') then
	    dataSet.Params.ParamByName('HORA_AGENDA').AsString := phora;
    if (trim(pminuto) <> '') then
    	dataSet.Params.ParamByName('MINUTO_AGENDA').AsString := pminuto;
    dataSet.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.Open;

    Result := not dataSet.IsEmpty;

    if dataSet.IsEmpty then
    begin
      vAgendaItens._abreAgendaItens(-1);
      Result := false;
    end;
end;

function TAgenda._abreResumoAgenda(pdata: TDateTime; phora: string): Boolean;
begin
    if ((trim(phora) <> '') and (Length(phora) < 2)) then
    	phora := '0' + trim(phora);

    dataSet.Close;
    dataSet.CommandText := ' select distinct a.* from agenda a ' +
      ' inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa ' +
      ' where a.data_agenda = :data_agenda ';
    if (trim(phora) <> '') then
    	dataSet.CommandText := dataSet.CommandText + ' and a.hora_agenda = :hora_agenda ';
    dataSet.CommandText := dataSet.CommandText +
    	' and a.cod_empresa = :cod_empresa ' +
      ' order by a.data_agenda asc, a.hora_agenda asc, a.minuto_agenda asc, a.cod_agenda asc ';
    dataSet.Params.ParamByName('DATA_AGENDA').AsDate := pdata;
    if (trim(phora) <> '') then
	    dataSet.Params.ParamByName('HORA_AGENDA').AsString := phora;
    dataSet.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.Open;

    Result := not dataSet.IsEmpty;
end;

function TAgenda._agendamentoDisponivel: boolean;
begin
  Result := True;
  if dataSet.FieldByName('COD_USUARIO').AsInteger > 0 then
  begin
    Application.MessageBox('Agendamento indisponível!', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
  	Result := False;
    exit;
  end;
end;

function TAgenda._mostrarClientes(pcod_cliente: Integer): Boolean;
var
  vtelefone: string;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cod_cliente, nome_cliente, fone_cliente, ativo from clientes' +
    ' where cod_cliente = :cod_cliente and cod_empresa= :cod_empresa and ativo =1 ';
  buscas.ParamByName('COD_CLIENTE').AsInteger := pcod_cliente;
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  vtelefone := StringReplace(buscas.FieldByName('FONE_CLIENTE').AsString, '(', '', [rfReplaceAll, rfIgnoreCase]);
  vtelefone := StringReplace(vtelefone, ')', '', [rfReplaceAll, rfIgnoreCase]);
  vtelefone := StringReplace(vtelefone, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  vtelefone := StringReplace(vtelefone, '-', '', [rfReplaceAll, rfIgnoreCase]);

  dataSet.FieldByName('COD_CLIENTE').AsInteger := buscas.FieldByName('COD_CLIENTE').AsInteger;
  dataSet.FieldByName('NOME_CLIENTE').AsString := buscas.FieldByName('NOME_CLIENTE').AsString;
  dataSet.FieldByName('FONE_CLIENTE').AsString := vtelefone;
end;

procedure TAgenda._QuantHorasSemana(pdata: TDateTime);
var
  vManha, vTarde: Integer;
begin
  vManha := 0;
  vTarde := 0;
  if ((DayOfWeek(pdata) > 0) and
    (DayOfWeek(pdata) < 7)) then
  begin
    if Trim(vDadosIni.vEmp.vHora_Manha_Semana) <> '' then
      vManha := (StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Semana, 4, 2)) -
        StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Semana, 1, 2)));

    if Trim(vDadosIni.vEmp.vHora_Tarde_Semana) <> '' then
      vTarde := (StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 4, 2)) -
        StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 1, 2)));

    Quant_Horas_Dia := vManha + vTarde;
  end;

  if vDadosIni.vEmp.vUsarDomingoAgenda = 'S' then
    if ((DayOfWeek(pdata)) < 1) then
    begin
      if Trim(vDadosIni.vEmp.vHora_Manha_Dom) <> '' then
        vManha := (StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Dom, 4, 2)) -
          StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Dom, 1, 2)));

      if Trim(vDadosIni.vEmp.vHora_Tarde_Dom) <> '' then
        vTarde := (StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 4, 2)) -
          StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 1, 2)));

      Quant_Horas_Dia := vManha + vTarde;
    end;

  if ((DayOfWeek(pdata)) > 6) then
  begin
    if Trim(vDadosIni.vEmp.vHora_Manha_Sab) <> '' then
      vManha := (StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Sab, 4, 2)) -
        StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Sab, 1, 2)));

    if Trim(vDadosIni.vEmp.vHora_Tarde_Sab) <> '' then
      vTarde := (StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 4, 2)) -
        StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 1, 2)));

    Quant_Horas_Dia := vManha + vTarde;
  end;
end;

function TAgenda._verificar_box_servico(pcod_box: Integer): Boolean;
begin
  Result := false;

  buscas.Close;
  buscas.SQL.Text := 'select first 1 cod_box from box ' +
    ' where cod_box =' + IntToStr(pcod_box) + ' and cod_empresa=' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if buscas.IsEmpty then
  begin
    Application.MessageBox(PChar('Box = ' + IntToStr(pcod_box) +
      ' não existe, favor informar o box corretamente !'),
      'Confirmação', MB_OK);
    Exit;
  end;

  buscas.Close;
  buscas.SQL.Text := ' select distinct tm.n_os, b.cod_box, tm.dia_fechado from box b ' +
    ' inner join agenda_itens ai on ai.cod_box = b.cod_box and ai.cod_empresa = b.cod_empresa ' +
    ' inner join agenda a on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa ' +
    ' inner join tmo_serv_os tm on tm.cod_servico = ai.cod_servico and tm.n_os = ai.nped and tm.cod_empresa = ai.cod_empresa ' +
    ' where tm.dia_fechado is null and b.cod_box = ' + IntToStr(pcod_box) + ' and b.cod_empresa = ' + vDadosIni.codEmpresa;
//    ' select distinct b.cod_box,ps.nped, p.status_ped from box b'
//    + ' inner join agenda_itens ai on ai.cod_box = b.cod_box and ai.cod_empresa = b.cod_empresa '
//    + ' inner join agenda a on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa '
//    + ' inner join pedvenda_serv ps on ps.cod_servico = ai.cod_servico and ps.nped = a.nped '
//    + ' inner join pedvenda p on ps.nped = p.nped and p.tipo = ps.tipo and p.cod_empresa = ps.cod_empresa '
//    + ' where ((p.status_ped ='''') or (p.status_ped is null) or (p.status_ped=''ABERTA'')) and b.cod_box =' +
//    IntToStr(pcod_box) + ' and p.cod_empresa =' + vDadosIni.codEmpresa + '';
  buscas.Open;

  if buscas.RecordCount >= vDadosIni.vEmp.VQuantOsAbertaBox then
  begin
    if Application.MessageBox(PChar('Box possuí serviço em aberto !' + chr(13) +
      'Deseja continuar?'),
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrNo then
      Exit;

    if not vDadosIni.PesqPros('AGO018', 'SALVAR', '', '',
      dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
      Exit;

    Result := true;

  end
  else
    Result := true;

end;

function TAgenda._verificar_cliente(pdata: TDateTime; pcod_cliente: Integer): Boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cod_cliente from agenda ' +
    ' where cod_cliente = :cod_cliente and data_agenda = :data_agenda ' +
    ' and cod_empresa = :cod_empresa ';
  buscas.ParamByName('COD_CLIENTE').AsInteger := pcod_cliente;
  buscas.ParamByName('DATA_AGENDA').AsDate := pdata;
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;
  buscas.FetchAll;

  Result := buscas.IsEmpty;
end;

function TAgenda._verificar_feriado(pdata: TDateTime; pturno: string): Boolean;
begin
  Result := False;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas2.Close;
  buscas2.SQL.Text := ' select f.data_feriado, f.descr_feriado from feriado f ' +
    ' where f.cod_empresa = :cod_empresa and f.ativo = 1 ' +
    ' and f.data_feriado= :data_feriado and ((f.turno =:turno) or (f.turno =''A''))';
  buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas2.ParamByName('data_feriado').AsDateTime := pdata;
  buscas2.ParamByName('turno').AsString := pturno;
  buscas2.Open;

  if not buscas2.IsEmpty then
    Result := True;
end;

function TAgenda._verificar_horas_dia(pdata: TDateTime; phora: string): Boolean;
var
  vManha_ini, vManha_fim, vTarde_ini, vTarde_fim: Integer;
begin
  Result := false;

  if ((DayOfWeek(pdata) > 0) and (DayOfWeek(pdata) < 7)) then
  begin
    if trim(VDadosini.vEmp.vHora_Manha_Semana) <> '' then
    begin
      vManha_ini := StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Semana, 1, 2));
      vManha_fim := StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Semana, 4, 2));
    end;
    if trim(VDadosini.vEmp.vHora_Tarde_Semana) <> '' then
    begin
      vTarde_ini := StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 1, 2));
      vTarde_fim := StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 4, 2));
    end;

    if ((vManha_fim >= StrToInt(phora)) and (vManha_ini <= StrToInt(phora))) then
      Result := True;
    if ((vTarde_fim >= StrToInt(phora)) and (vTarde_ini <= StrToInt(phora))) then
      Result := true;
  end;

  if vDadosIni.vEmp.vUsarDomingoAgenda = 'S' then
    if ((DayOfWeek(pdata)) < 1) then
    begin
      if trim(VDadosini.vEmp.vHora_Manha_Dom) <> '' then
      begin
        vManha_ini := StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Dom, 1, 2));
        vManha_fim := StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Dom, 4, 2));
      end;
      if trim(VDadosini.vEmp.vHora_Tarde_Dom) <> '' then
      begin
        vTarde_ini := StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 1, 2));
        vTarde_fim := StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 4, 2));
      end;

      if ((vManha_fim >= StrToInt(phora)) and (vManha_ini <= StrToInt(phora))) then
        Result := True;
      if ((vTarde_fim >= StrToInt(phora)) and (vTarde_ini <= StrToInt(phora))) then
        Result := True;
    end;

  if ((DayOfWeek(pdata)) > 6) then
  begin
    if trim(vDadosIni.vEmp.vHora_Manha_Sab) <> '' then
    begin
      vManha_ini := StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Sab, 1, 2));
      vManha_fim := StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Sab, 4, 2));
    end;
    if trim(VDadosini.vEmp.vHora_Tarde_Sab) <> '' then
    begin
      vTarde_ini := StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 1, 2));
      vTarde_fim := StrToInt(Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 4, 2));
    end;

    if ((vManha_fim >= StrToInt(phora)) and (vManha_ini <= StrToInt(phora))) then
      Result := True;
    if ((vTarde_fim >= StrToInt(phora)) and (vTarde_ini <= StrToInt(phora))) then
      Result := true;
  end;
end;

function TAgenda._verificar_horas_disponiveis(pdata: TDateTime;
  phora: string; vVerifica: string = ''): Boolean;
var
  Min_Por_Dia: Double;
begin
  Result := False;
  vTmoServicos := 0;

  buscas.Close;
  buscas.SQL.Text := 'select count(*) as quant_mecanicos from colaborador c ' +
    ' inner join funcoes f on f.cod_funcao = c.cod_funcao ';
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' where ((f.desc_funcao like ''%TECNICO%'') or (f.desc_funcao like ''%TÉCNICO%'')) '
  else
    buscas.SQL.Text := buscas.SQL.Text +
    ' where ((f.desc_funcao like ''%MECANICO%'') or (f.desc_funcao like ''%MECÂNICO%'')) ';
  buscas.SQL.Text := buscas.SQL.Text +
    ' and c.ativo = 1 and c.cod_empresa = :cod_empresa ' +
    ' and ((c.data_ini_ausencia > :DATA_INI) or  c.data_fim_ausencia < :DATA_FIM ' +
    ' or (c.data_ini_ausencia is null or c.data_fim_ausencia is null)) ';
  buscas.ParamByName('DATA_INI').AsDate := pdata;
  buscas.ParamByName('DATA_FIM').AsDate := pdata;
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  Quant_Mecanicos := buscas.FieldByName('QUANT_MECANICOS').AsInteger;
  Min_Por_Dia := Quant_Horas_Dia * (Quant_Mecanicos * 60);
  vHorasPorDia := Min_Por_Dia;


  buscas.Close;
  buscas.SQL.Text := 'select sum(agi.tmo_servico * 60) as horas_utilizadas from agenda ag ' +
    ' inner join agenda_itens agi on agi.cod_agenda = ag.cod_agenda and agi.cod_empresa =ag.cod_empresa ' +
    ' where ag.data_agenda = :data_agenda ' ;
  if vVerifica = '' then
	   buscas.SQL.Text  := buscas.SQL.Text + ' and ag.cod_agenda <>' + IntToStr(dataSet.FieldByName('COD_AGENDA').AsInteger)
  else
	   buscas.SQL.Text  := buscas.SQL.Text + ' and ag.cod_agenda <> 0 ';
  buscas.SQL.Text  := buscas.SQL.Text + ' and ag.cod_empresa = :cod_empresa ';
  buscas.ParamByName('DATA_AGENDA').AsDate := pdata;
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;
  vTmoServicos := 0;
  vHorasUtilizadas := buscas.FieldByName('HORAS_UTILIZADAS').AsFloat;


  if vVerifica = '' then
  begin
    vAgendaItens.dtSet.First;
    while not vAgendaItens.dtSet.Eof do
    begin
      vTmoServicos := vTmoServicos + vAgendaItens.dtSet.FieldByName('TMO_SERVICO').AsFloat;
      vAgendaItens.dtSet.Next;
    end;

    vHorasDisponiveis := Min_Por_Dia - (vHorasUtilizadas + (vTmoServicos * 60));
  end
  else
    vHorasDisponiveis := Min_Por_Dia - vHorasUtilizadas;

  if vHorasDisponiveis >= 0 then
    Result := True
  else
    vHorasDisponiveis := Min_Por_Dia - vHorasUtilizadas;

end;

function TAgenda._verificar_servico_especifico_box(pcod_box, pcod_servico: Integer): Boolean;
var
 vDescrServ: string;
begin
  Result := false;

  vDescrServ :=  '';

  buscas.Close;
  buscas.SQL.Text := ' select first 1 tb.cod_servico, trim(ts.desc_servico) desc_servico from tipo_servico_box tb ' +
    ' inner join tipo_servico ts on ts.cod_servico = tb.cod_servico ' +
    ' where tb.cod_servico = ' + IntToStr(pcod_servico) + ' and tb.cod_empresa= ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if buscas.IsEmpty then
  begin
    Result := True;
    exit;
  end;

  vDescrServ := trim(buscas.FieldByName('DESC_SERVICO').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select first 1 cod_servico from tipo_servico_box ' +
    ' where cod_box = ' + IntToStr(pcod_box) + ' and cod_servico = ' + IntToStr(pcod_servico) +
    ' and cod_empresa= ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if buscas.IsEmpty then
  begin
    if Application.MessageBox(PChar('Serviço ''' + IntToStr(pcod_servico) + ' - ' + Copy(vDescrServ, 1, 30) +
    	''' possui box específico!' + #13 + #13 +
    	'Sim - Para continuar assim mesmo ' + #13 +
      'Não - Para selecionar o box específico '),
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrNo then
      Exit;

    if not vDadosIni.PesqPros('AGO020', 'SALVAR', '', '',
      dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
      Exit;

    Result := True;
  end
  else
    Result := true;

end;

function TAgenda._verificar_servico_especifico_mecanico(pcod_vendedor, pcod_servico: Integer): Boolean;
var
  aux: string;
  vDescrServ: string;
begin
  vDescrServ := '';

  if vDadosIni.vEmp.vUsarAparelho = 'S' then
    aux := 'Técnico'
  else
    aux := 'Mecânico';

  Result := false;

  buscas.Close;
  buscas.SQL.Text := ' select first 1 tm.cod_servico, trim(ts.desc_servico) desc_servico from tipo_servico_mecanico tm ' +
    ' inner join tipo_servico ts on ts.cod_servico = tm.cod_servico ' +
    ' where tm.cod_servico = ' + IntToStr(pcod_servico) + ' and tm.cod_empresa= ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if buscas.IsEmpty then
  begin
    Result := True;
    exit;
  end;

  vDescrServ := trim(buscas.FieldByName('DESC_SERVICO').AsString);

  buscas.Close;
  buscas.SQL.Text := ' select first 1 cod_servico from tipo_servico_mecanico ' +
    ' where cod_vendedor = ' + IntToStr(pcod_vendedor) + ' and cod_servico = ' + IntToStr(pcod_servico) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if buscas.IsEmpty then
  begin
    if Application.MessageBox(PChar('Serviço ''' + IntToStr(pcod_servico) + ' - ' + Copy(vDescrServ, 1, 30) +
      ''' possuí ' + aux + ' específico!' + #13 + #13 +
      'Sim - Para continuar assim mesmo ' + #13 +
      'Não - Para selecionar o ' + aux + ' específico '),
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrNo then
      Exit;

    if not vDadosIni.PesqPros('AGO016', 'SALVAR', '', '',
      dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
      Exit;

    Result := True;
  end
  else
    Result := true;

end;

function TAgenda._verificar_temp_vendedor(pcod_vendedor: Integer): boolean;
var
  aux: string;
begin
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
    aux := 'Técnico'
  else
    aux := 'Mecânico';

  Result := false;

  buscas.Close;
  buscas.SQL.Text := ' select ai.cod_agenda, c.cod_vendedor, tm.dia_fechado from colaborador c ' +
    ' inner join agenda_itens ai on ai.cod_vendedor = c.cod_vendedor and ai.cod_empresa = c.cod_empresa ' +
    ' inner join agenda a on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa ' +
    ' inner join tmo_serv_os tm on tm.cod_servico = ai.cod_servico and tm.n_os = ai.nped and tm.cod_empresa = ai.cod_empresa ' +
    ' where tm.dia_fechado is null and c.cod_vendedor =' + IntToStr(pcod_vendedor) + ' and c.cod_empresa =' + vDadosIni.codEmpresa;
//    ' select c.cod_vendedor, p.status_ped from colaborador c'
//    + '  inner join agenda_itens ai on ai.cod_vendedor = c.cod_vendedor and ai.cod_empresa = c.cod_empresa'
//    + '  inner join agenda a on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa'
//    + '  inner join pedvenda_serv ps on ps.cod_servico = ai.cod_servico and ps.nped = a.nped'
//    + '  inner join pedvenda p on ps.nped = p.nped and p.tipo = ps.tipo and p.cod_empresa = ps.cod_empresa'
//    + '  where ((p.status_ped ='''') or (p.status_ped is null) or (p.status_ped=''ABERTA'')) and c.cod_vendedor =' +
//    IntToStr(pcod_vendedor) + ' and p.tipo=''OS'' and c.cod_empresa =' + vDadosIni.codEmpresa + '';
  buscas.Open;

  if not buscas.IsEmpty then
  begin
    if Application.MessageBox(PChar(aux + ' possuí serviço em aberto!' + chr(13) +
      'Deseja continuar?'),
      'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrNo then
      Exit;

    if not vDadosIni.PesqPros('AGO019', 'SALVAR', '', '',
      dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
      Exit;

    Result := true;
  end
  else
    Result := true;

end;

function TAgenda._atualizarAvisosTMO: Boolean;
var
  vtempoServ, vtempoUtil, vtempoRest, vtmo: Double;
begin
  buscas.Close;
  buscas.SQL.Text := ' select tmo.n_os, tmo.cod_servico, tp.tmo, ' +
    ' sum((coalesce(cast(tmo.hora_fim as time) ,cast(' + vDadosIni.FusoTimeFb + ' as time)))  - cast(tmo.hora_inicio as time)) as tempo ' +
    ' from tmo_serv_os tmo ' +
    ' inner join tipo_servico tp on tp.cod_servico = tmo.cod_servico ' +
    ' inner join pedvenda pd on tmo.n_os = pd.nped and pd.tipo = ''OS'' and tmo.cod_empresa = pd.cod_empresa ' +
    ' and pd.data_fech is null ' +
    ' where tmo.cod_empresa = '+ vDadosIni.codEmpresa + ' and tmo.dia_fechado is null ' +
    ' group by tmo.n_os, tmo.cod_servico, tp.tmo';
  //  and tmo.dia =' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.getDataBanco(buscas)))

  buscas.Open;
  buscas.FetchAll;

  buscas.First;
  while not buscas.Eof do
  begin
    vtempoUtil := (buscas.FieldByName('TEMPO').AsFloat / 3600) * StrToDateTime('01:00:00');
    vtempoServ := (StrToDateTime('01:00:00') * buscas.FieldByName('tmo').AsFloat);

    vtempoRest := vtempoUtil - vtempoServ;
    if vtempoRest > 0 then
      _atualizarLembreteAgenda(buscas.FieldByName('N_OS').AsInteger, 'AVISO');

    buscas.Next;
  end;

  transacao.Commit;
end;

function TAgenda._atualizarLembreteAgenda(nped: Integer;
  pstatus: string): Boolean;
var
 buscas3: TIBQuery;
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas3 := TIBQuery.Create(Application);
  buscas3.Database := buscas.Database;
  buscas3.Transaction := buscas.Transaction;

 // Grava lembrete na agenda_oficina
  buscas2.Close;
  buscas2.SQL.Text := ' select nped from lembrete_agenda ' +
  	' where nped = :nped and cod_empresa = :cod_empresa ';
  buscas2.ParamByName('nped').AsInteger := nped;
  buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas2.Open;

  if buscas2.IsEmpty then
  begin
    buscas2.Close;
    buscas2.SQL.Text := ' INSERT INTO LEMBRETE_AGENDA (NPED, COD_EMPRESA, DATA, HORA, LEMBRETE, STATUS_OS, ATIVO) ' +
      ' VALUES (:NPED, :COD_EMPRESA, :DATA, :HORA, :LEMBRETE, :STATUS_OS, :ATIVO); ';
  end
  else
  begin
    buscas2.Close;
    buscas2.SQL.Text := ' UPDATE LEMBRETE_AGENDA SET DATA = :DATA, HORA = :HORA, ' +
      ' LEMBRETE = :LEMBRETE, STATUS_OS = :STATUS_OS, ATIVO = :ATIVO ' +
      ' WHERE NPED = :NPED AND COD_EMPRESA = :COD_EMPRESA; ';
  end;
  buscas2.ParamByName('NPED').AsInteger := nped;
  buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas2.ParamByName('DATA').AsDateTime := vDadosIni.getDataBanco(buscas3);
	buscas2.ParamByName('HORA').AsString := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas3));
	buscas2.ParamByName('LEMBRETE').AsString := 'OS - ' + IntToStr(nped);
	buscas2.ParamByName('STATUS_OS').AsString := pstatus;
	buscas2.ParamByName('ATIVO').AsInteger := 1;
  buscas2.ExecSQL;
end;

procedure TAgenda._cadAgenda(pTipoForm: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Agenda');
    if DtmAgenda = nil then
      DtmAgenda := TDtmAgenda.Create(DtmAgenda);

    vDadosIni.vTipoForm := pTipoForm;

    if vDadosIni.vEmp.vAgendaOficina <> 'S' then
    begin
      Application.MessageBox('Empresa não configurada para usar Agenda Oficina!',
        'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('AGO001', 'CONSULTA', '', 'AGENDA', '',
      DtmAgenda.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadAgenda = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadAgenda, frmCadAgenda);
    end;

    if (pTipoForm > 0) and (not frmCadAgenda.Visible) then
      frmCadAgenda.ShowModal
    else if (not frmCadAgenda.Visible) then
      frmCadAgenda.Show
    else if frmCadAgenda.FormStyle = fsMDIChild then
      frmCadAgenda.Show
    else
      frmCadAgenda.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TAgendaItens }

constructor TAgendaItens.create;
begin
  DataSet := TClientDataSet(DtmAgenda.cdsAgendaItens);
  transacao := TIBTransaction(DtmAgenda.transacao);
  Buscas := TIBQuery(DtmAgenda.qrBuscas);

  fServicos := TClientDataSet(DtmAgenda.cdsServicoCons);
  fMecanicos := TClientDataSet(DtmAgenda.cdsMecanicoCons);
  fBox := TClientDataSet(DtmAgenda.cdsBoxCons);

  //  fTemp.Free;
//  fTemp := nil;
//  fTemp := TClientDataSet(DtmAgenda.cdsTemp);
//  if fTemp.active then
//    fTemp.close;
//  fTemp.CreateDataSet;


//  dtSet.Free;
//  dtSet := nil;
//  dtSet := TClientDataSet(DtmAgenda.cdsAgendaItensTemp);
//  if dtSet.active then
//    dtSet.close;
//  DtSet.CreateDataSet;

  fTemp := TClientDataSet(DtmAgenda.cdsTemp);
  if fTemp.Tag = 0 then
  try
    fTemp.CreateDataSet;
    fTemp.Tag := 22;
  except
  end;

  dtSet := TClientDataSet(DtmAgenda.cdsAgendaItensTemp);
  if dtSet.Tag = 0 then
  try
    dtSet.CreateDataSet;
    dtSet.Tag := 22;
  except
  end;

end;

function TAgendaItens.Delete: boolean;
var
  vCodFormula: string;
begin
  Result := false;

  if dataSet.IsEmpty then
    exit;

  vCodFormula := dataSet.FieldByName('COD_AGENDA').AsString;

  if not vDadosIni.PesqPros('AGO008', 'EXCLUIR', '', 'AGENDA',
    dataSet.FieldByName('COD_AGENDA').AsString, buscas, false) then
    Exit;

  if dataSet.State in [dsInsert, dsedit] then
  begin
    if dtSet.Locate('COD_AGENDA;NITEM;TMO_SERVICO',
      VarArrayOf([dataSet.FieldByName('COD_AGENDA').AsInteger,
      dataSet.FieldByName('NITEM').AsInteger, dataSet.FieldByName('TMO_SERVICO').AsFloat]),
        [loPartialKey]) then
      dtSet.Delete;
    dataSet.Delete;
    Result := True;
  end
  else
  begin
    if Application.MessageBox(pchar('Deseja cancelar o item?'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      if vDadosIni.PesqPros('AGO008', 'CANCELAR ITEM', '', 'AGENDA_ITENS',
        dataSet.FieldByName('COD_AGENDA').AsString, buscas, false) then
      begin
        if dtSet.Locate('COD_AGENDA;NITEM;TMO_SERVICO',
          VarArrayOf([dataSet.FieldByName('COD_AGENDA').AsInteger,
          dataSet.FieldByName('NITEM').AsInteger, dataSet.FieldByName('TMO_SERVICO').AsFloat]),
            [loPartialKey]) then
          dtSet.Delete;
        dataSet.Delete;

        vDadosIni.GravaAuditoria('AGO008', 'EXCLUIR', 'SUCESSO', 'AGENDA_ITENS', vCodFormula, buscas)
      end;
      Result := true;
    end;
  end;
end;

function TAgendaItens.Insert: boolean;
begin
  if not vDadosIni.PesqPros('AGO007', 'INCLUIR', '', 'AGENDA_ITENS',
    '', buscas, True) then
    Exit;

  if dataSet.State in [dsInsert, dsEdit] then
  begin
    dataSet.Post;
  end;

  if not dataSet.Active then
    montaSelect('select ai.*, c.nome_vendedor from agenda_itens ai ' +
      ' inner join agenda a on a.cod_agenda = ai.cod_agenda and a.cod_empresa = ai.cod_empresa' +
      ' left join colaborador c on c.cod_vendedor = ai.cod_vendedor and c.cod_empresa = ai.cod_empresa' +
      ' where a.cod_agenda=0 and a.cod_empresa =0 ');

  Result := False;
  if inherited Insert then
  begin
    Result := True;
    dataSet.FieldByName('COD_AGENDA').AsInteger := 0;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    if CadAgenda.dataSet.State = dsInsert then
      NITEM := NITEM + 1;
    if CadAgenda.dataSet.State = dsEdit then
      NITEM := dtSet.FieldByName('NITEM').AsInteger + 1;

    dataSet.FieldByName('NITEM').AsInteger := NITEM;
  end;
end;

function TAgendaItens.post: boolean;
var
  acao: string;
  codigo: integer;
begin
  try
    Result := false;

    if not vDadosIni.PesqPros('AGO006', 'SALVAR', '', 'AGENDA_ITENS',
      dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
      Exit;

    if dataSet.State = dsInsert then
      acao := 'INSERIR'
    else
      exit;

    if dataSet.FieldByName('COD_SERVICO').AsInteger = 0 then
    begin
      raiseExceptionCreate('Serviço não informado', 'DBLookupComboBox2');
      exit;
    end;

    if dataSet.FieldByName('TMO_SERVICO').AsFloat = 0 then
    begin
      raiseExceptionCreate('TMO do Serviço não informado', 'DBEdit5');
      exit;
    end;

    if acao = 'INSERIR' then
    begin
      dataSet.FieldByName('COD_AGENDA').AsInteger := 0;
    end;

    if not _verificarServicoRepetido(dataSet.FieldByName('COD_SERVICO').AsInteger) then
    begin
      Application.MessageBox(PChar('Serviço já foi incluído neste Agendamento!'),
        'Confirmação', MB_OK);
      exit;
    end;

    if _verificaServicos(CadAgenda.dataSet.FieldByName('DATA_AGENDA').AsDateTime,
      dataSet.FieldByName('COD_SERVICO').AsInteger) then
    begin
      if Application.MessageBox(PChar('Serviço específico não possuí tempo disponível !' +
        chr(13) + 'Deseja continuar?'),
        'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1)
        = mrNo then
        Exit;
      if not vDadosIni.PesqPros('AGO012', 'SALVAR', '', 'AGENDA',
        dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
        Exit;
    end;

    dtSet.Insert;
    dtSet.FieldByName('COD_AGENDA').AsInteger := dataSet.FieldByName('COD_AGENDA').AsInteger;
    dtSet.FieldByName('COD_SERVICO').AsInteger := dataSet.FieldByName('COD_SERVICO').AsInteger;
    dtSet.FieldByName('NITEM').AsInteger := NITEM;
    dtSet.FieldByName('TMO_SERVICO').AsFloat := dataSet.FieldByName('TMO_SERVICO').AsFloat;
    dtSet.Post;

    Result := inherited post;

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

procedure TAgendaItens._PreecherBox;
begin
  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('SEL').AsString = 'S' then
    begin
      if (trim(dataSet.FieldByName('CODBOX').AsString) = '') then
      begin
	      dataSet.Edit;
  	    dataSet.FieldByName('CODBOX').AsString :=
    	  	fBox.FieldByName('COD_BOX').AsString + ' - ' +
      	  fBox.FieldByName('DESCR_BOX').AsString;
	      dataSet.Post;
      end;
    end;
    dataSet.Next;
  end;
  dataSet.First;
end;

procedure TAgendaItens._PreecherMecanico;
begin
  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('SEL').AsString = 'S' then
    begin
      if (trim(dataSet.FieldByName('CODNOMEVENDEDOR').AsString) = '') then
      begin
        dataSet.Edit;
        dataSet.FieldByName('CODNOMEVENDEDOR').AsString :=
          fTemp.FieldByName('COD_VENDEDOR').AsString + ' - ' +
          fTemp.FieldByName('NOME_VENDEDOR').AsString;
        dataSet.Post;
      end;
    end;
    dataSet.Next;
  end;
  dataSet.First;
end;

procedure TAgendaItens._LimparDados(pTodos: boolean);
begin
  if pTodos then
	 dataSet.First;
  while not dataSet.Eof do
  begin
    dataSet.Edit;
    dataSet.FieldByName('CODNOMEVENDEDOR').AsString := '';
    dataSet.FieldByName('CODBOX').AsString := '';
    dataSet.Post;

    if pTodos then
	    dataSet.Next
    else
    	break;
  end;
  if pTodos then
	  dataSet.First;
end;

function TAgendaItens._PreencherDatasetTemp: Boolean;
begin
  dtSet.EmptyDataSet;
  dataSet.RecordCount;
  dtSet.RecordCount;
  dataSet.First;
  while not dataSet.Eof do
  begin
    dtSet.Insert;
    dtSet.FieldByName('COD_AGENDA').AsInteger := dataSet.FieldByName('COD_AGENDA').AsInteger;
    dtSet.FieldByName('COD_SERVICO').AsInteger := dataSet.FieldByName('COD_SERVICO').AsInteger;
    dtSet.FieldByName('NITEM').AsInteger := dataSet.FieldByName('NITEM').AsInteger;
    dtSet.FieldByName('TMO_SERVICO').AsFloat := dataSet.FieldByName('TMO_SERVICO').AsFloat;
    dtSet.Post;
    dataSet.Next;
  end;
end;



function TAgendaItens._tempoPorBox;
var
  vcod_box: Integer;
begin
  Result := False;
  
  vcod_box := 0;
  vTmoServPorBox := 0;
  Result := false;
  dataSet.First;

  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('SEL').AsString = 'S' then
    begin
      vTmoServPorBox := vTmoServPorBox + dataSet.FieldByName('TMO_SERVICO').AsFloat;
    end;
    dataSet.Next;
  end;
  dataSet.First;


  if Length(Trim(dataSet.FieldByName('CODBOX').AsString)) > 1 then
  begin
    if Pos('-', dataSet.FieldByName('CODBOX').AsString) > 0 then
      vCod_box := StrToInt(trim(Copy(dataSet.FieldByName('CODBOX').AsString, 0, Pos('-', dataSet.FieldByName('CODBOX').AsString) - 1)));

    buscas.Close;
    buscas.SQL.Text := ' select cod_box, descr_box, cod_empresa from box ' +
      ' where (tmo_servicos >= :tmo_servicos or tmo_servicos = 0) ' +
      ' and cod_box = :cod_box and cod_empresa = :cod_empresa and ativo = 1 ' +
      ' order by tmo_servicos asc';
    buscas.ParamByName('TMO_SERVICOS').AsFloat := vTmoServPorBox;
    buscas.ParamByName('COD_BOX').AsInteger := vCod_box;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if not buscas.IsEmpty then
    begin
      Result := true;
      exit;
    end
    else
    begin
      if Application.MessageBox(PChar('Serviço maior que o TMO do box !' +
        chr(13) + 'Deseja continuar?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrNo then
        Exit;

      if not vDadosIni.PesqPros('AGO020', 'SALVAR', '', 'AGENDA',
        dataSet.FieldByName('COD_AGENDA').AsString, buscas, true) then
        Exit;

      Result := true;
    end;
  end
  else
    Result := true;

end;

function TAgendaItens._abreTodosServicos: Boolean;
begin
  fServicos.Close;
  fServicos.CommandText := 'select tipo_servico.cod_servico, tipo_servico.desc_servico, tipo_servico.tmo, tipo_servico.ativo from tipo_servico ' +
  	' inner join tipo_servico_empresa on tipo_servico_empresa.cod_servico = tipo_servico.cod_servico and tipo_servico_empresa.cod_empresa = ' + vDadosIni.codEmpresa + 
    ' where tipo_servico.cod_servico > 0 ' +
    ' and tipo_servico.ativo = 1 ' +
    ' order by tipo_servico.desc_servico';
  fServicos.Open;
end;


function TAgendaItens._abreAgendaItens(pcod_agenda: Integer): boolean;
begin
  Result := montaSelect('select ai.*, c.nome_vendedor, b.descr_box from agenda a ' +
    ' inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa' +
    ' left join colaborador c on c.cod_vendedor = ai.cod_vendedor and c.cod_empresa = ai.cod_empresa' +
    ' left join box b on b.cod_box = ai.cod_box and b.cod_empresa = ai.cod_empresa ' +
    ' where ai.cod_empresa =' + vDadosIni.codEmpresa +
    ' and ai.cod_agenda = ' + IntToStr(pcod_agenda));
end;

function TAgendaItens._abreServicoAgenda(pdata, phora: string): Boolean;
begin
   dataSet.Close;
   dataSet.CommandText :=  ' select ai.*,c.nome_vendedor, b.descr_box from agenda a ' +
    ' inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa ' +
    ' left join colaborador c on c.cod_vendedor = ai.cod_vendedor and c.cod_empresa = ai.cod_empresa ' +
    ' left join box b on b.cod_box = ai.cod_box and b.cod_empresa = ai.cod_empresa ' +
    ' where a.cod_empresa = :cod_empresa ' +
    ' and a.data_agenda = :data_agenda ' +
    ' and a.hora_agenda = :hora_agenda ' +
    ' and ai.nped is null ' +
    ' order by a.hora_agenda, a.minuto_agenda, ai.cod_agenda';
   dataSet.Params.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
   dataSet.Params.ParamByName('data_agenda').AsString := pdata;
   dataSet.Params.ParamByName('hora_agenda').AsString := phora;
   dataSet.Open;

   Result := not dataSet.IsEmpty; 
end;

function TAgendaItens._atualizarCodAgenda(pcod_agenda: Integer): boolean;
begin
  Result := false;

  dataset.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('COD_AGENDA').AsInteger = 0 then
    begin
      dataSet.Edit;
      dataSet.FieldByName('COD_AGENDA').AsInteger := pcod_agenda;
      dataSet.Post;
      Result := true;
    end;
    dataSet.Next;
  end;
end;

function TAgendaItens._buscarTmoBox(ptempo_medio: Double): boolean;
begin
  fBox.Close;
  if ptempo_medio > 0 then
    fBox.CommandText := ' select cod_box, descr_box, cod_empresa from box ' +
      ' where (tmo_servicos >= :tmo_servicos or coalesce(tmo_servicos, 0) = 0) ' +
      ' and cod_empresa= :cod_empresa and ativo = 1 ' +
      ' order by tmo_servicos asc '
  else
    fBox.CommandText := ' select cod_box, descr_box, cod_empresa from box ' +
      ' where cod_empresa= :cod_empresa and ativo = 1 ' +
      ' order by cod_box ';
  fBox.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  if ptempo_medio > 0 then
    fBox.Params.ParamByName('TMO_SERVICOS').AsFloat := ptempo_medio;
  fBox.Open;
end;

procedure TAgendaItens._desmarcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('SEL').AsString = 'S' then
      begin
        vTmoAgenda := vTmoAgenda - dataSet.FieldByName('TMO_SERVICO').AsFloat;
        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := '';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    dataSet.First;

    _buscarTmoBox(vTmoAgenda);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TAgendaItens._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
  begin
    vTmoAgenda := vTmoAgenda - dataSet.FieldByName('TMO_SERVICO').AsFloat;
    dataSet.FieldByName('SEL').AsString := '';
  end
  else
  begin
    vTmoAgenda := vTmoAgenda + dataSet.FieldByName('TMO_SERVICO').AsFloat;
    dataSet.FieldByName('SEL').AsString := 'S';
  end;
  dataSet.Post;

  _buscarTmoBox(vTmoAgenda);
end;

function TAgendaItens._mostrarMecanicos: Boolean;
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas.Close;
  buscas.SQL.Text := ' select c.cod_vendedor, c.nome_vendedor, f.desc_funcao, ' +
    ' cast(coalesce(max(cast(t.dia as date) ||'' ''|| t.hora_inicio),''01/01/1899 00:00:00'') as timestamp) as data, ' +
    ' case when (t.dia is null) then ''F'' when (t.dia_fechado is null) then ''A'' else ''F'' end as tipo ' +
    ' from colaborador c ' +
    ' inner join funcoes f on f.cod_funcao = c.cod_funcao ' +
    ' left join tmo_serv_os t on t.cod_vendedor = c.cod_vendedor ' +
    ' where  c.cod_empresa = :COD_EMPRESA and c.ativo = 1 ';
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
  	buscas.SQL.Text := buscas.SQL.Text +
      ' and ((f.desc_funcao like ''%TECNICO%'') or (f.desc_funcao like ''%TÉCNICO%'')) '
  else
  	buscas.SQL.Text := buscas.SQL.Text +
      ' and ((f.desc_funcao like ''%MECANICO%'') or (f.desc_funcao like ''%MECÂNICO%'')) ';
   buscas.SQL.Text := buscas.SQL.Text +
      ' and (t.tipo_op =''S'' or t.tipo_op =''P'' or t.tipo_op is null) ' +
      ' and ((c.data_ini_ausencia > :DATA_INI) or  c.data_fim_ausencia < :DATA_FIM ' +
      ' or (c.data_ini_ausencia is null or c.data_fim_ausencia is null)) ' +
      ' group by 1,2, 3, 5 ' +
      ' order by 5 desc, 4 ';
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.ParamByName('DATA_INI').AsDateTime := vDadosIni.getDataBanco(buscas2);
  buscas.ParamByName('DATA_FIM').AsDateTime := vDadosIni.getDataBanco(buscas2);
  buscas.Open;
  buscas.FetchAll;

  buscas.First;
  fTemp.EmptyDataSet;
  while not buscas.Eof do
  begin
    fTemp.Filtered := false;
    fTemp.Filter := 'COD_VENDEDOR = ' + IntToStr(buscas.FieldByName('COD_VENDEDOR').AsInteger);
    fTemp.Filtered := true;

    if buscas.FieldByName('COD_VENDEDOR').AsInteger = fTemp.FieldByName('COD_VENDEDOR').AsInteger then
    begin
      if fTemp.FieldByName('DATA').AsDateTime < buscas.FieldByName('DATA').AsDateTime then
      begin
        fTemp.Edit;
        fTemp.FieldByName('DATA').AsDateTime := buscas.FieldByName('DATA').AsDateTime;
        fTemp.FieldByName('TIPO').AsString := buscas.FieldByName('TIPO').AsString;
        fTemp.Post;
      end;
    end
    else
    begin
      fTemp.Insert;
      fTemp.FieldByName('COD_VENDEDOR').AsInteger := buscas.FieldByName('COD_VENDEDOR').AsInteger;
      fTemp.FieldByName('NOME_VENDEDOR').AsString := buscas.FieldByName('NOME_VENDEDOR').AsString;
      fTemp.FieldByName('DESC_FUNCAO').AsString := buscas.FieldByName('DESC_FUNCAO').AsString;
      fTemp.FieldByName('DATA').AsDateTime := buscas.FieldByName('DATA').AsDateTime;
      fTemp.FieldByName('TIPO').AsString := buscas.FieldByName('TIPO').AsString;
      fTemp.Post;
    end;
    buscas.Next;
  end;

  fTemp.Filtered := false;
  fTemp.AddIndex('IndiceDesc', 'TIPO', [ixDescending], 'TIPO');
  fTemp.IndexName := 'IndiceDesc';
  fTemp.IndexFieldNames := 'DATA';
end;


procedure TAgendaItens._marcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('SEL').AsString = '' then
      begin
        vTmoAgenda := vTmoAgenda + dataSet.FieldByName('TMO_SERVICO').AsFloat;
        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := 'S';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    dataSet.First;

    _buscarTmoBox(vTmoAgenda);

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TAgendaItens._mostrarBox(ptempo_medio: Double): Boolean;
begin
  fBox.Close;
  if ptempo_medio <= 0 then
    fBox.CommandText := ' select cod_box, descr_box, cod_empresa from box ' +
      ' where cod_empresa = :cod_empresa and ativo = 1 ' +
      ' order by descr_box'
  else
    fBox.CommandText := ' select cod_box, descr_box, cod_empresa from box ' +
      ' where (tmo_servicos <= :tmo_servicos or tmo_servicos = 0) ' +
      ' and cod_empresa = :cod_empresa and ativo = 1 ' +
      ' order by descr_box ';
  fBox.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  if ptempo_medio > 0 then
    fBox.Params.ParamByName('TMO_SERVICOS').AsFloat := ptempo_medio;
  fBox.Open;
end;



function TAgendaItens._MostrarServicos(pcod_servico: Integer): Boolean;
begin
  buscas.Close;
  buscas.SQL.Text :=
    'select cod_servico, desc_servico, tmo, valor_servico, codigo_nop, ativo from tipo_servico' +
    ' where cod_servico =' + IntToStr(pcod_servico) + ' and ativo =1';
  buscas.Open;

  dataSet.FieldByName('COD_SERVICO').AsInteger := buscas.FieldByName('COD_SERVICO').AsInteger;
  dataSet.FieldByName('DESC_SERVICO').AsString := buscas.FieldByName('DESC_SERVICO').AsString;
  dataSet.FieldByName('TMO_SERVICO').AsString := buscas.FieldByName('TMO').AsString;
  dataSet.FieldByName('VALOR_SERVICO').AsFloat := buscas.FieldByName('VALOR_SERVICO').AsFloat;
  dataSet.FieldByName('CODIGO_NOP').AsFloat := buscas.FieldByName('CODIGO_NOP').AsFloat;
end;

function TAgendaItens._verificarServicoRepetido(
  pcod_servico: Integer): Boolean;
begin
  Result := false;

  dtSet.First;
  while not dtSet.Eof do
  begin
    if dtSet.FieldByName('COD_SERVICO').AsInteger = pcod_servico then
      exit;

    dtSet.Next;
  end;
  Result := true;

end;

function TAgendaItens._verificaServicos(pdata: TDateTime; pcod_servico: Integer): Boolean;
var
  Tmo_Utilizado, Servicos, Quant_Mecanicos, Tempo_disponivel: Double;
  Cod_Vendedor: string;
begin
  Result := false;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas.Close;
  buscas.SQL.Text := 'select cod_servico from tipo_servico_mecanico ' +
    ' where cod_servico = ' + IntToStr(pcod_servico) + ' and cod_empresa=' + vDadosIni.codEmpresa;
  buscas.Open;
  if buscas.IsEmpty then
    exit;

  buscas.Close;
  buscas.SQL.Text :=
    ' select tp.cod_vendedor from tipo_servico_mecanico tp ' +
    ' inner join colaborador c on c.cod_vendedor = tp.cod_vendedor and c.cod_empresa = tp.cod_empresa ' +
    ' where tp.cod_servico = :cod_servico ' +
    ' and ((c.data_ini_ausencia > :DATA_INI) or  c.data_fim_ausencia < :DATA_FIM ' +
    ' or (c.data_ini_ausencia is null or c.data_fim_ausencia is null)) ' +
    ' and c.cod_empresa= :cod_empresa ';
  buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.ParamByName('COD_SERVICO').AsInteger := pcod_servico;
  buscas.ParamByName('DATA_INI').AsDate := pdata;
  buscas.ParamByName('DATA_FIM').AsDate := pdata;
  buscas.Open;
  buscas.FetchAll;

  if buscas.IsEmpty then
    exit;
  Quant_Mecanicos := buscas.RecordCount;

  buscas.First;

  Cod_Vendedor := '';
  while not buscas.Eof do
  begin

    if Cod_Vendedor = '' then
      Cod_Vendedor := buscas.FieldByName('COD_VENDEDOR').AsString
    else
      Cod_Vendedor := Cod_Vendedor + ',' + buscas.FieldByName('COD_VENDEDOR').AsString;

    buscas.Next;
  end;

  buscas.Close;
  buscas.SQL.Text := ' select distinct tp.cod_servico from tipo_servico_mecanico tp '
    + ' where tp.cod_vendedor in (' + Cod_Vendedor + ') and tp.cod_empresa=' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  Tmo_Utilizado := 0;
  buscas.First;
  while not buscas.Eof do
  begin
    buscas2.Close;
    buscas2.SQL.Text := 'select sum(ai.tmo_servico) as tmo from agenda a ' +
       ' inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa ' +
       ' where a.data_agenda = :data_agenda and ai.cod_servico = :cod_servico ' +
       ' and a.cod_empresa = :cod_empresa ';
    buscas2.ParamByName('DATA_AGENDA').AsDate := pdata;
    buscas2.ParamByName('COD_SERVICO').AsInteger := buscas.FieldByName('COD_SERVICO').AsInteger;
    buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.Open;
    buscas2.FetchAll;

    Tmo_Utilizado := Tmo_Utilizado + buscas2.FieldByName('TMO').AsFloat;

    buscas.Next;
  end;

  dtSet.First;
  while not dtSet.Eof do
  begin
    buscas.Close;
    buscas.SQL.Text := ' select tp.cod_servico from tipo_servico_mecanico tp ' +
      ' where tp.cod_servico = ' + IntToStr(dtSet.FieldByName('COD_SERVICO').AsInteger) +
      ' and tp.cod_empresa= ' + vDadosIni.codEmpresa;
    buscas.Open;

    if not buscas.IsEmpty then
      Servicos := Servicos + dtSet.FieldByName('TMO_SERVICO').AsFloat;
    dtSet.Next;
  end;
  dtSet.First;

  Tempo_disponivel := (Quant_Horas_Dia * Quant_Mecanicos) - (Tmo_Utilizado + Servicos +
    dataSet.FieldByName('TMO_SERVICO').AsFloat);

  if Tempo_disponivel < 0 then
    Result := True;

end;

{ TClientes }

function TClientes.buscaCliente(cod_cliente: integer): boolean;
begin
  montaSelect('select * from clientes where cod_cliente = ' + IntToStr(cod_cliente) +
    ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty
end;

constructor TClientes.create;
begin
  dataSet := TClientDataSet(DtmAgenda.cdsClienteCons);
  transacao := TIBTransaction(DtmAgenda.transacao);
  buscas := TIBQuery(DtmAgenda.qrBuscas);
end;

function TClientes._abreCliente: Boolean;
begin
  Result := montaSelect('select * from clientes' +
    ' where cod_cliente =0 and ativo =1 and cod_empresa= 0');
end;

function TClientes.LocCliente(Cod_Cliente: integer): boolean;
begin
  result := true;
  vDadosIni.abreStatusProcessamento('', 'Verificando cliente');
  montaSelect('SELECT * FROM CLIENTES ' +
    'WHERE COD_CLIENTE = ' + inttostr(Cod_Cliente) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
  vDadosIni.fechaStatusProcessamento;
  if dataSet.IsEmpty then
  begin
    result := false;
    Application.MessageBox('Cliente não Encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
  end;
end;

{ TLembrete }

constructor TLembrete.create;
begin
  dataSet := TClientDataSet(DtmAgenda.cdsLembreteAgenda);
  transacao := TIBTransaction(DtmAgenda.transacao);
  buscas := TIBQuery(DtmAgenda.qrBuscas);
end;

function TLembrete.MostrarLembrete: boolean;
begin
  dataSet.Close;
  dataSet.CommandText := ' select * from lembrete_agenda ' +
    ' where cod_empresa = :cod_empresa and ativo = 1 ' +
    ' and ((data = :data) or (status_os =''AVISO'') or (status_os =''AGUARDANDO'')) order by status_os, nped';
  dataSet.Params.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.Params.ParamByName('DATA').AsDateTime := vDadosIni.getDataBanco(buscas);
  dataSet.Open;
  
  Result := not dataSet.IsEmpty
end;

{ TServicosMecanicos }

function TServicosMecanicos.ConsultaAvancada(pDateINI, pDateFIM: string; pMec: boolean; pMecanico: Integer): boolean;
var
  sqladcional: string;
begin
  Result := false;
  try
    try
       StrToDate(pDateINI);
     except
       rBOL.vDataIni := '';
     end;
     try
       StrToDate(pDateFIM);
     except
       rBOL.vDataFim := '';
     end;

    if not pMec then
    begin
      if pMecanico > 0 then
      sqladcional := ' AND AGENDA_ITENS.COD_VENDEDOR  = ' + IntToStr(pMecanico)
    else
      sqladcional :='';
    end
    else
      sqladcional :='';

    dataSet.Close;
    dataSet.CommandText := 'SELECT AGENDA_ITENS.*, AGENDA.COD_CLIENTE, AGENDA.NOME_CLIENTE, AGENDA.DATA_AGENDA, ' +
     ' AGENDA.HORA_AGENDA, AGENDA.STATUS_AGENDA, AGENDA.COD_VEICULO, AGENDA.PLACA, AGENDA.CHASSI, AGENDA.COD_EQUIP, ' +
     ' COLABORADOR.NOME_VENDEDOR, BOX.DESCR_BOX FROM AGENDA_ITENS ' +
     ' INNER JOIN AGENDA ON AGENDA.COD_AGENDA = AGENDA_ITENS.COD_AGENDA AND AGENDA.COD_EMPRESA = AGENDA_ITENS.COD_EMPRESA' +
     ' LEFT JOIN COLABORADOR ON COLABORADOR.COD_VENDEDOR = AGENDA_ITENS.COD_VENDEDOR AND COLABORADOR.COD_EMPRESA = AGENDA_ITENS.COD_EMPRESA ' +
     ' LEFT JOIN BOX ON BOX.COD_BOX = AGENDA_ITENS.COD_BOX AND BOX.COD_EMPRESA = AGENDA_ITENS.COD_EMPRESA ' +
     ' WHERE ((AGENDA.DATA_AGENDA >= :DATA_INI) AND (AGENDA.DATA_AGENDA <= :DATA_FIM)) ' +
     ' AND AGENDA_ITENS.COD_EMPRESA = :COD_EMPRESA AND AGENDA_ITENS.COD_VENDEDOR IS NOT NULL ' + sqladcional;
    dataSet.Params.ParamByName('COD_EMPRESA').AsInteger := StrtoInt(vDadosIni.CodEmpresa);
    dataSet.Params.ParamByName('DATA_INI').AsDateTime := StrToDate(pDateINI) + StrToTime('00:00:00');
    dataSet.Params.ParamByName('DATA_FIM').AsDateTime := StrToDate(pDateFIM) + StrToTime('23:59:59');
    dataSet.Open;

    Result := not dataSet.IsEmpty;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('E0009 Erro ao efetuar consulta. Erro: ' + e.Message + DataSet.CommandText), 'Erro', 0 + 64);
      registraErro('E0009 ' + e.Message + DataSet.CommandText);
    end;
  end;
end;

constructor TServicosMecanicos.create;
begin
  DataSet := TClientDataSet(DtmAgenda.cdsAgendaMecanico);
  transacao := TIBTransaction(DtmAgenda.transacao);
  Buscas := TIBQuery(DtmAgenda.qrBuscas);

  fMecanicos := TClientDataSet(DtmAgenda.cdsMecanicoCons);
end;

function TServicosMecanicos._abreAgendaMecanico: boolean;
begin
  Result :=
    montaSelect('select ai.*, a.cod_cliente, a.nome_cliente, a.status_agenda, a.data_agenda, a.hora_agenda, a.minuto_agenda, a.cod_veiculo, a.chassi, a.placa, a.cod_equip,c.nome_vendedor, b.descr_box from agenda a ' +
     ' inner join agenda_itens ai on ai.cod_agenda = a.cod_agenda and ai.cod_empresa = a.cod_empresa ' +
     ' left join colaborador c on c.cod_vendedor = ai.cod_vendedor and c.cod_empresa = ai.cod_empresa ' +
     ' left join box b on b.cod_box = ai.cod_box and b.cod_empresa = ai.cod_empresa ' +
     ' where ai.cod_agenda = 0 and ai.cod_empresa = 0 ');
end;

function TServicosMecanicos._abrirMecanicos: boolean;
begin
  fMecanicos.Close;
  fMecanicos.CommandText := 'select * from colaborador c ' +
    ' inner join funcoes f on f.cod_funcao = c.cod_funcao ' +
    ' where c.ativo = 1 and c.cod_empresa = ' + vDadosIni.codEmpresa;
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
     fMecanicos.CommandText := fMecanicos.CommandText +
      ' and ((f.desc_funcao like ''%TECNICO%'') or (f.desc_funcao like ''%TÉCNICO%'')) '
  else
  	fMecanicos.CommandText := fMecanicos.CommandText +
      ' and ((f.desc_funcao like ''%MECANICO%'') or (f.desc_funcao like ''%MECÂNICO%'')) ';
  fMecanicos.Open;
end;

function TServicosMecanicos._buscarMecanico(pcod_vendedor: Integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select * from colaborador c ' +
    ' inner join funcoes f on f.cod_funcao = c.cod_funcao ' +
    ' where c.ativo = 1 and c.cod_vendedor = ' + IntToStr(pcod_vendedor) +
    ' and c.cod_empresa = ' + vDadosIni.codEmpresa;
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and ((f.desc_funcao like ''%TECNICO%'') or (f.desc_funcao like ''%TÉCNICO%'')) '
  else
    buscas.SQL.Text := buscas.SQL.Text +
      ' and ((f.desc_funcao like ''%MECANICO%'') or (f.desc_funcao like ''%MECÂNICO%'')) ';
  buscas.Open;

  Result := not buscas.IsEmpty;
end;

procedure TServicosMecanicos._cadServicosMecanicos(pTipoForm: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Agenda Mecânico/Técnico');
    if DtmAgenda = nil then
      DtmAgenda := TDtmAgenda.Create(DtmAgenda);

    vDadosIni.vTipoForm := pTipoForm;

    if vDadosIni.vEmp.vAgendaOficina <> 'S' then
    begin
      Application.MessageBox('Empresa não configurada para usar Agenda Oficina!',
        'Atenção', 0 + 64);
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if not vDadosIni.PesqPros('AGO022', 'CONSULTA', '', 'AGENDA', '',
      DtmAgenda.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmAgendaMecanico = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmAgendaMecanico, frmAgendaMecanico);
    end;

    if (pTipoForm > 0) and (not frmAgendaMecanico.Visible) then
      frmAgendaMecanico.ShowModal
    else if (not frmAgendaMecanico.Visible) then
      frmAgendaMecanico.Show
    else if frmAgendaMecanico.FormStyle = fsMDIChild then
      frmAgendaMecanico.Show
    else
      frmAgendaMecanico.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TServicosMecanicos._defineSqlAdicional: boolean;
var
  I, erro: Integer;
  //  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vCampoTemp, vCondicaoTmp: string;
begin
  result := true;
  rBOL.vSqlAdicional := '';

    if rBOL.vPorData then
    begin
      try
        erro := 0;
        StrToDate(rBOL.vDataIni);
      except
        rBOL.vDataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(rBOL.vDataFim);
      except
        rBOL.vDataFim := '';
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
        if rBOL.vDataIni <> '' then
          rBOL.vDataIni := QuotedStr(FormatDateTime(formatodata, strtodate(rBOL.vDataIni)));
        if rBOL.vDataFim <> '' then
          rBOL.vDataFim := QuotedStr(FormatDateTime(formatodata, strtodate(rBOL.vDataFim)));
      end;
    end
    else if rBOL.vValor = '' then
      exit;

    vCampoTemp:= '';
    if rBOL.vCampo = 'Cod Cliente' then
      vCampoTemp := 'AGENDA.COD_CLIENTE'
    else if rBOL.vCampo = 'Cliente' then
      vCampoTemp := 'AGENDA.NOME_CLIENTE'
    else if rBOL.vCampo = 'Data Agenda' then
      vCampoTemp := 'AGENDA.DATA_AGENDA'
    else if rBOL.vCampo = 'Hora Agenda' then
      vCampoTemp := 'AGENDA.HORA_AGENDA'
    else if rBOL.vCampo = 'Minuto Agenda' then
    	vCampoTemp := 'AGENDA.MINUTO_AGENDA'
    else if rBOL.vCampo = 'Status' then
      vCampoTemp := 'AGENDA.STATUS_AGENDA'
    else if rBOL.vCampo = 'Cod Veiculo' then
      vCampoTemp := 'AGENDA.COD_VEICULO'
    else if rBOL.vCampo = 'Placa' then
      vCampoTemp := 'AGENDA.PLACA'
    else if rBOL.vCampo = 'Chassi' then
      vCampoTemp := 'AGENDA.CHASSI'
    else if rBOL.vCampo = 'Cod Equip' then
      vCampoTemp := 'AGENDA.COD_EQUIP'
    else if rBOL.vCampo = 'Vendedor' then
      vCampoTemp := 'COLABORADOR.NOME_VENDEDOR'
    else if rBOL.vCampo = 'Box' then
      vCampoTemp := 'BOX.DESCR_BOX';


    if not rBOL.vPorData then
    begin
      if Trim(vCampoTemp) <> '' then
      begin
        vCondicaoTmp := rBOL.vCondicao;
        if vCondicaoTmp = 'Igual' then
          vCondicaoTmp := '='
        else if vCondicaoTmp = 'Maior' then
          vCondicaoTmp := '>'
        else if vCondicaoTmp = 'Maior ou Igual' then
          vCondicaoTmp := '>='
        else if vCondicaoTmp = 'Menor' then
          vCondicaoTmp := '<'
        else if vCondicaoTmp = 'Menor ou Igual' then
          vCondicaoTmp := '<='
        else if vCondicaoTmp = 'Diferente' then
          vCondicaoTmp := '<>'
        else if (vCondicaoTmp = 'Esta contido') then
          vCondicaoTmp := 'like'
        else if (vCondicaoTmp = 'Começa') then
          vCondicaoTmp := 'Começa'
        else
          vCondicaoTmp := '=';
        if vCondicaoTmp = 'like' then
          rBOL.vSqlAdicional := rBOL.vSqlAdicional + ' and ' + vCampoTemp + ' like ' + QuotedStr('%' + rBOL.vValor + '%')
        else if vCondicaoTmp = 'Começa' then
          rBOL.vSqlAdicional := rBOL.vSqlAdicional + ' and ' + vCampoTemp + ' like ' + QuotedStr(rBOL.vValor + '%')
        else
          rBOL.vSqlAdicional := rBOL.vSqlAdicional + ' and ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' +QuotedStr(rBOL.vValor);
        rBOL.vValor := '';
        Exit;
      end;
    end;

    if rBOL.vCondicao = 'Igual' then
      rBOL.vCondicao := '='
    else if rBOL.vCondicao = 'Maior' then
      rBOL.vCondicao := '>'
    else if rBOL.vCondicao = 'Maior ou Igual' then
      rBOL.vCondicao := '>='
    else if rBOL.vCondicao = 'Menor' then
      rBOL.vCondicao := '<'
    else if rBOL.vCondicao = 'Menor ou Igual' then
      rBOL.vCondicao := '<='
    else if rBOL.vCondicao = 'Diferente' then
      rBOL.vCondicao := '<>'
    else if (rBOL.vCondicao = 'Esta contido') then
      rBOL.vCondicao := 'like'
    else if (rBOL.vCondicao = 'Começa') then
      rBOL.vCondicao := 'Começa'
    else
      rBOL.vCondicao := '=';

    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rBOL.vCampo) then
        begin
          if rBOL.vCampo = rBOL.vCampo then
          begin
            rBOL.vsqlAdicional := '';
            exit;
          end;
          rBOL.vCampo := DataSet.Fields[I].FieldName;
          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
            ((rBOL.vCondicao = 'Começa') or (rBOL.vCondicao = 'Começa')) then
          begin
            if ((Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)) then
            try
              strtoint(rBOL.vValor);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end
            else if ((Dataset.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField))
              then
            try
              strtofloat(rBOL.vValor);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção',
                MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end;
            rBOL.vCondicao := '=';
            rBOL.vValor := vDadosIni.trocaVirgulaPorPonto(rBOL.vValor);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
            if (rBOL.vDataIni <> '') and (rBOL.vDataFim <> '') then
              rBOL.vSqlAdicional := rBOL.vsqlAdicional + rBOL.vCampo +
                ' >= ' + rBOL.vDataIni +
                ' and ' +
                rBOL.vCampo + ' <= ' + rBOL.vDataIni
            else if (rBOL.vDataFim <> '') then
              rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampo +
                ' <= ' + rBOL.vDataIni
            else if (rBOL.vDataIni <> '') and (rBOL.vDataFim <> '') then
              rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampo +
                ' >= ' + rBOL.vDataIni;
            Break;
          end;
          if rBOL.vCondicao = 'like' then
            rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampo +
              ' like ' + QuotedStr('%' +
              rBOL.vValor +
              '%')
          else if rBOL.vCondicao = 'Começa' then
            rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampo +
              ' like ' +
              QuotedStr(rBOL.vValor + '%')
          else
            rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampo + ' '
              + rBOL.vCondicao + ' ' +
              QuotedStr(rBOL.vValor);
          Break;
        end;
      end;
    end;
//  end;
end;

{ TVeiculosPed }

function TVeiculosPed.abreVeiculo(codigo: integer): boolean;
begin
  Result := montaSelect('select * from veiculos where codigo = ' + IntToStr(codigo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
end;

constructor TVeiculosPed.create;
begin
  DataSet := TClientDataSet(DtmAgenda.cdsveic);
  transacao := TIBTransaction(DtmAgenda.transacao);
  Buscas := TIBQuery(DtmAgenda.qrBuscas);
end;

{ TAparelhosPed }

function TAparelhosPed.abreAparelho(codigo: integer): boolean;
begin
  Result := montaSelect('select * from equipamento where cod_equip = ' + IntToStr(codigo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa); //+ ' and TIP_EQUIP <> ''I''');
end;

constructor TAparelhosPed.create;
begin
  DataSet := TClientDataSet(DtmAgenda.cdsApar);
  transacao := TIBTransaction(DtmAgenda.transacao);
  Buscas := TIBQuery(DtmAgenda.qrBuscas);
end;

end.

