unit uClassesTMO;

interface
uses uDataSet_OOP, IB, uDadosIni, uDtmAtivo, IBQuery, IBDatabase, DBClient, DB, SysUtils, Windows,
  Dialogs, forms, Controls;
type

  TTMO = class;
  TColabTMO = class;
  TServTMO = class;

  TServTMO = class(TDataSet_OOP)
  private
    nOSServ, codColabServ: integer;
    vHoraFim, vTipoOp: string;
    buscas2: TIBQuery;
    buscas3: TIBQuery;
    procedure servAfterScroll(DataSet: TDataSet);
  public
    constructor create;
    function abreServico(nOS, codColab: integer; pTodos: boolean): boolean; overload;
    function abreServico(nOS, codColab: integer): boolean; overload;
  var
    vDataDia: TDate;
    vtempo_util, vtempo_rest: Double;
  end;

  TColabTMO = class(TDataSet_OOP)
  private
    procedure colabAfterScroll(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create;
    function abreColab: boolean; overload;
    function abreColab(pOS: integer): boolean; overload;
    function abreColab(pOS, pColab: integer): boolean; overload;
  var
    vServ: TServTMO;
    nOS: integer;
  end;

  TTMO = class(TDataSet_OOP)
  private
    procedure fechaDiasEmAberto;
    procedure desabilitaControlesFormulario;
  public
    destructor Destroy; override;
    constructor create;
    function existeOS(numOS: string; pTodosColabs: boolean): boolean;
    function existe(pMecanico: Integer): boolean;
    function abrirDia: boolean;
    function fecharDia: boolean;
    function pausarServico: boolean;
    function removerPausa: boolean;
    procedure VerIndFinaliza;
    function verificaServOutros: boolean;
    procedure cadTMO(TipoForm: integer);
    function servicosimultaneo: boolean;
    function atualizarLembreteAgenda(pstatus: string): Boolean;
  var
    buscas2: TIBQuery;
    vColab: TColabTMO;
    vTmoServ: double;
    vTmo: double;
  end;

var
  vColab: TColabTMO;
  vServ: TServTMO;

implementation

uses udtmTMO, uTMO, StdCtrls;

{ TServicoOS }

{ TTMO }

function TTMO.abrirDia: boolean;
begin
  Result := false;
  try
    try
      if not verificaServOutros then
       exit;
      montaSelect('select * from tmo_serv_os where n_os = ' + IntToStr(vColab.nOS) +
        ' and cod_vendedor =  ' + vColab.dataSet.FieldByName('cod_vendedor').AsString +
        ' and dia_fechado is null and cod_servico = ' +
        vColab.vServ.dataSet.FieldByName('cod_servico').AsString +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1 order by dia,hora_inicio');
      fechaDiasEmAberto;
      montaSelect('select first 1 * from tmo_serv_os where n_os = ' + IntToStr(vColab.nOS) +
        ' and cod_vendedor =  ' + vColab.dataSet.FieldByName('cod_vendedor').AsString +
        ' and dia = :DataIni and dia = :DataFim ' +
        ' and cod_servico = ' + vColab.vServ.dataSet.FieldByName('cod_servico').AsString +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1 order by hora_inicio desc', vColab.vServ.vDataDia, vColab.vServ.vDataDia);
      if not dataSet.IsEmpty then
      begin
        Application.MessageBox('Dia já esta aberto', 'Atenção', 0 + 64);
        exit;
      end;

      buscas.close;
      buscas.sql.text := ' Select * from tmo_serv_os ' +
        ' where n_os = :vnos and cod_vendedor = :vcod and dia_fechado is null ' +
        ' and cod_servico = :vcodserv and cod_empresa = :cod_empresa and ativo=1 order by dia,tipo_op';
      buscas.Params[0].AsInteger := vColab.nOS;
      buscas.Params[1].AsInteger := vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
      buscas.Params[2].AsInteger := vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
      buscas.ParamByName('COD_EMPRESA').Text := vDadosIni.CodEmpresa;
      buscas.open;
      while not buscas.eof do
      begin
        if buscas.FieldByName('DIA').AsDateTime < date then
        begin
          buscas2.Close;
          if not buscas.FieldByName('HORA_FIM').IsNull then
            buscas2.SQL.Text := ' update tmo_serv_os set dia_fechado = :dia_fechado ' +
             ' where n_os = :n_os and dia = :dia and cod_vendedor = :cod_vendedor and hora_inicio = :hora_inicio ' +
             ' and tipo_op = :tipo_op and cod_servico = :cod_servico and cod_empresa = :cod_empresa'
          else
            buscas2.SQL.Text := ' update tmo_serv_os set hora_fim = :hora_fim, dia_fechado = :dia_fechado ' +
             ' where n_os = :n_os and dia = :dia and cod_vendedor = :cod_vendedor and hora_inicio = :hora_inicio ' +
             ' and tipo_op = :tipo_op and cod_servico = :cod_servico and cod_empresa = :cod_empresa';
          buscas2.ParamByName('N_OS').AsInteger := vColab.nOS;
          buscas2.ParamByName('DIA').AsDateTime := buscas.FieldByName('DIA').AsDateTime;
          buscas2.ParamByName('COD_VENDEDOR').AsInteger := vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
          buscas2.ParamByName('HORA_INICIO').AsString := buscas.FieldByName('HORA_INICIO').AsString;
          buscas2.ParamByName('TIPO_OP').AsString := buscas.FieldByName('TIPO_OP').AsString;
          buscas2.ParamByName('COD_SERVICO').AsInteger := vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
          buscas2.ParamByName('COD_EMPRESA').Text := vDadosIni.CodEmpresa;
          if buscas.FieldByName('HORA_FIM').IsNull then
            buscas2.ParamByName('HORA_FIM').AsString := '23:59:59';
          buscas2.ParamByName('DIA_FECHADO').AsString := buscas.FieldByName('DIA').AsString;
          buscas2.ExecSQL;
        end;
        buscas.next;
      end;

      dataSet.Insert;
      dataSet.FieldByName('n_os').AsInteger := vColab.nOS;
      dataSet.FieldByName('dia').AsDateTime := vColab.vServ.vDataDia;
      dataSet.FieldByName('cod_vendedor').AsInteger :=
        vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
      dataSet.FieldByName('hora_inicio').AsString := FormatDateTime('hh:mm:ss',
        vDadosIni.getDataHoraBanco(buscas));
      dataSet.FieldByName('tipo_op').AsString := 'S';
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('cod_servico').AsInteger :=
        vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
      vTmoServ := StrToDateTime('01:00:00') * vColab.vServ.dataSet.FieldByName('tmo').AsFloat;

      dataSet.Post;

      if dataSet.ChangeCount = 0 then
        exit;

      if Apply then
      begin
        CommitaTransacao;
        Result := true;
      end
      else
      begin
        Cancel;
        RollBackTransacao;
      end;
      Result := true;
    except
      on e: exception do
      begin
        RollBackTransacao;
        Application.MessageBox(pchar('Erro ao abrir dia. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('Erro ao abrir o dia: Componente: ' + DataSet.Name + ' Erro: ' + e.Message);
      end;
    end;
  finally
    if Result then
    begin
      //      vColab.vServ.Close;
      //      vColab.Close;
      //      desabilitaControlesFormulario;
      // mexe aki
      frmTMO.BtnAbrirDia.Enabled := False;
      frmTMO.BtnPausa.Enabled := True;
      frmTMO.BtnTiraPausa.Enabled := False;
      frmTMO.btnFechardia.Enabled := True;
      frmTMO.lbStatus.Visible := False;
      frmTMO.Timer1.Enabled := true;
      frmTMO.Label1.Visible := true;
      frmTMO.Label2.Visible := true;
      frmTMO.Label1.Caption := '00:00:00';
      frmTMO.Label2.Caption := FormatDateTime('hh:mm:ss', obTMO.vTmoServ);
    end;
  end;
end;

function TTMO.atualizarLembreteAgenda(pstatus: string): Boolean;
begin
  // Grava lembrete na agenda_oficina

  if vDadosIni.vEmp.vAgendaOficina <> 'S' then
    exit;

  buscas.Close;
  buscas.SQL.Text := 'select nped from pedvenda '
    + ' where nped =' + IntToStr(vColab.nOS) + ' and cod_empresa =' + vDadosIni.codEmpresa + ' and tipo=''OS''';
    //and cod_agenda is not null';
  buscas.Open;

  if buscas.IsEmpty then
    exit;

  buscas.Close;
  buscas.SQL.Text := 'select nped from lembrete_agenda '
    + ' where nped =' + IntToStr(vColab.nOS) + ' and cod_empresa =' + vDadosIni.codEmpresa + '';
  buscas.Open;

  if buscas.IsEmpty then
  begin
    buscas.Close;
    buscas.SQL.Text :=
      'INSERT INTO LEMBRETE_AGENDA (NPED, COD_EMPRESA, DATA, HORA, LEMBRETE, STATUS_OS, ATIVO)'
      + ' VALUES (' + IntToStr(vColab.nOS) + ', ' + vDadosIni.codEmpresa + ',' +
      QuotedStr(FormatDateTime('mm/dd/yyyy', vDadosIni.getDataBanco(buscas))) + ' ,' +
      QuotedStr(FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas))) + ',''' + '''OS - ' +
      IntToStr(vColab.nOS) + ''', ' + QuotedStr(pstatus) + ',1);';
    buscas.ExecSQL;
  end
  else
  begin
    buscas.Close;
    buscas.SQL.Text := 'UPDATE LEMBRETE_AGENDA SET DATA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',
      vDadosIni.getDataBanco(buscas))) + ', HORA = ' + QuotedStr(FormatDateTime('hh:mm:ss',
      vDadosIni.getDataHoraBanco(buscas))) + ','
      + ' LEMBRETE = ' + '''OS - ' + IntToStr(vColab.nOS) + ''', STATUS_OS ='
      + QuotedStr(pstatus) + ', ATIVO = 1 '
      + ' WHERE NPED = ' + IntToStr(vColab.nOS) + ' AND COD_EMPRESA =' + vDadosIni.codEmpresa + '';
    buscas.ExecSQL;
  end;
  Apply;
  CommitaTransacao;
end;

procedure TTMO.cadTMO(TipoForm: integer);
begin
  vDadosIni.vTipoForm := TipoForm;
  if dtmTMO = nil then
    dtmTMO := TdtmTMO.Create(dtmTMO);
  if frmTMO = nil then
    Application.CreateForm(TfrmTMO, frmTMO);
  frmTMO.Show;
end;

constructor TTMO.create;
begin
  dataSet := TClientDataSet(dtmTMO.cdsTMO2);
  buscas := TIBQuery(dtmTMO.qrBuscas);
  transacao := TIBTransaction(dtmTMO.IBTransTMO);
  vColab := TColabTMO.create;
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;
  desabilitaControlesFormulario;
end;

procedure TTMO.desabilitaControlesFormulario;
begin
  if frmTMO <> nil then
  begin
    frmTMO.BtnAbrirDia.Enabled := False;
    frmTMO.BtnPausa.Enabled := False;
    frmTMO.BtnTiraPausa.Enabled := False;
    frmTMO.btnFechardia.Enabled := False;
    frmTMO.lbStatus.Visible := False;
  end;
end;

destructor TTMO.Destroy;
begin
  vColab.Free;
  vColab := nil;
  inherited;
end;

function TTMO.existe(pMecanico: Integer): boolean;
begin
  Result := True;

  if vDadosIni.vEmp.vUsarAparelho = 'S' then
  begin
   buscas.close;
   buscas.SQL.Text := ' Select c.* from colaborador c  ' +
    ' inner join funcoes f on f.cod_funcao = c.cod_funcao ' +
    ' where ((f.desc_funcao like ''%TECNICO%'') or (f.desc_funcao like ''%TÉCNICO%'')) ' +
    ' and c.cod_vendedor = :cod_vendedor and c.cod_empresa = :cod_empresa and c.ativo=1 ';
   buscas.ParamByName('COD_VENDEDOR').AsInteger := pMecanico;
   buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.CodEmpresa);
   buscas.open;
  end
  else
  begin
   buscas.close;
   buscas.SQL.Text := ' Select c.* from colaborador c  ' +
    ' inner join funcoes f on f.cod_funcao = c.cod_funcao ' +
    ' where ((f.desc_funcao like ''%MECANICO%'') or (f.desc_funcao like ''%MECÂNICO%'')) ' +
    ' and c.cod_vendedor = :cod_vendedor and c.cod_empresa = :cod_empresa and c.ativo=1 ';
   buscas.ParamByName('COD_VENDEDOR').AsInteger := pMecanico;
   buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.CodEmpresa);
   buscas.open;
  end;
  if buscas.isempty then
  begin
    if vDadosIni.vEmp.vUsarAparelho = 'S' then
      Application.MessageBox(pchar('Técnico não encontrado!'), 'Atenção', MB_ICONERROR + MB_OK)
    else
      Application.MessageBox(pchar('Mecânico não encontrado!'), 'Atenção', MB_ICONERROR + MB_OK);

    Result := False;
    exit;
  end
end;

function TTMO.existeOS(numOS: string;
  pTodosColabs: boolean): boolean;
begin
  try
    vColab.nOS := StrToInt(trim(numOS));
  except
    vColab.nOS := 0;
    Application.MessageBox('Numero da Ordem de Serviço inválido', 'Atenção', 0 + 64);
    Result := false;
  end;
  buscas.Close;
  buscas.SQL.Text := 'select pv.nped,pv.status_ped,pv.st_term_serv from pedvenda pv' +
    ' where pv.nped = ' + IntToStr(vColab.nOS) + ' and pv.tipo = ''OS''' +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo = 1';
  buscas.Open;
  if buscas.IsEmpty then
  begin
    Application.MessageBox('Ordem de Serviço não encontrada', 'Atenção', 0 + 64);
    Result := false;
    exit;
  end
  else if buscas.FieldByName('status_ped').AsString = 'FECHADA' then
  begin
    Application.MessageBox('Ordem de Serviço Fechada', 'Atenção', 0 + 64);
    Result := false;
    exit;
  end;
//  else if buscas.FieldByName('st_term_serv').AsString = 'FINALIZADO' then
//  begin
//    if application.messagebox(
//      'Esta O.S. está indicando servico Finalizado, deseja retirar esta afirmação?',
//      'Confirmação', 4 + 32) = IDYES then
//    begin
//      ExecutaComandosSqlExec('update pedvenda set ST_TERM_SERV = '''' ' +
//        ' where nped = ' + IntToStr(vColab.nOS) +
//        ' and tipo = ''OS''' +
//        ' and cod_empresa = ' + vDadosIni.CodEmpresa);
//      atualizarLembreteAgenda('ABERTA');
//      CommitaTransacao;
//    end;
//  end;
  if not vColab.abreColab then
  begin
    Application.MessageBox('Ordem de Serviço sem Serviços', 'Atenção', 0 + 64);
    Result := false;
    exit;
  end;
//  if pTodosColabs then
//  begin
//    if not vColab.abreColab(vColab.nOS) then
//    begin
//      Application.MessageBox('Ordem de Serviço sem Serviços', 'Atenção', 0 + 64);
//      Result := false;
//      exit;
//    end;
//  end
//  else if not vColab.abreColab(vColab.nOS, vDadosIni.vCodUsuario) then
//  begin
//    Application.MessageBox('Ordem de Serviço sem Serviços ou Colaborador não esta incluído na OS', 'Atenção', 0 + 64);
//    Result := false;
//    exit;
//  end;
  Result := true;
end;

procedure TTMO.fechaDiasEmAberto;
begin
  if (dataSet.State = dsBrowse) and (not dataSet.IsEmpty) then
  begin
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('dia_fechado').AsString = '' then
      begin
        dataSet.Edit;
        dataSet.FieldByName('hora_fim').AsString := '23:59:59';
        dataSet.FieldByName('dia_fechado').AsDateTime := dataSet.FieldByName('dia').AsDateTime;
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    if dataSet.ChangeCount = 0 then
      exit;

    if Apply then
      CommitaTransacao
    else
    begin
      Cancel;
      RollBackTransacao;
    end;
  end;
end;

function TTMO.fecharDia: boolean;
var
  vHoraFim: string;
begin
  Result := false;
  try
    try
      montaSelect('select * from tmo_serv_os where n_os = ' + IntToStr(vColab.nOS) +
        ' and cod_vendedor =  ' + vColab.dataSet.FieldByName('cod_vendedor').AsString +
        ' and dia = :DataIni and dia = :DataFim ' +
        ' and cod_servico = ' + vColab.vServ.dataSet.FieldByName('cod_servico').AsString +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1 order by hora_inicio desc', vColab.vServ.vDataDia, vColab.vServ.vDataDia);
      if dataSet.IsEmpty then
      begin
        Application.MessageBox('Dia não encontrado', 'Antenção', 0 + 64);
        exit;
      end
      else if dataSet.FieldByName('dia_fechado').AsString <> '' then
      begin
        Application.MessageBox('Dia já fechado', 'Antenção', 0 + 64);
        exit;
      end;
      vHoraFim := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));

      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('dia_fechado').AsString = '' then
        begin
          dataSet.Edit;
          if dataSet.FieldByName('hora_fim').AsString = '' then
            dataSet.FieldByName('hora_fim').AsString := vHoraFim;
          dataSet.FieldByName('dia_fechado').AsDateTime := dataSet.FieldByName('dia').AsDateTime;
          dataSet.Post;
        end;
        dataSet.Next;
      end;
      if dataSet.ChangeCount = 0 then
        exit;

      if Apply then
        CommitaTransacao
      else
      begin
        Cancel;
        RollBackTransacao;
      end;
      VerIndFinaliza;
      Result := true;
    except
      on e: exception do begin
        Application.MessageBox(pchar('Erro ao tentar fechar dia. Erro: ' + e.Message), 'Atenção', 0
          + 64);
        registraErro('Erro ao tentar fechar o dia: Componente: ' + DataSet.Name + ' Erro: ' +
          e.Message);
      end;
    end;
  finally
    if Result then
    begin
//      vColab.vServ.Close;
//      vColab.Close;
      frmTMO.BtnAbrirDia.Enabled := False;
      frmTMO.BtnPausa.Enabled := False;
      frmTMO.BtnTiraPausa.Enabled := False;
      frmTMO.btnFechardia.Enabled := False;
      frmTMO.lbStatus.Visible := False;
      frmTMO.Timer1.Enabled := false;
//      frmTMO.Label1.Visible := false;
//      frmTMO.Label2.Visible := false;
    end;
  end;
end;

function TTMO.pausarServico: boolean;
var
  vHoraFim: string;
begin
  Result := false;
  try
    try
      montaSelect('select first 1 * from tmo_serv_os where n_os = ' + IntToStr(vColab.nOS) +
        ' and cod_vendedor =  ' + vColab.dataSet.FieldByName('cod_vendedor').AsString +
        ' and dia = :DataIni and dia = :DataFim ' +
        ' and cod_servico = ' + vColab.vServ.dataSet.FieldByName('cod_servico').AsString +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1 order by hora_inicio desc', vColab.vServ.vDataDia, vColab.vServ.vDataDia);
      if dataSet.IsEmpty then
      begin
        Application.MessageBox('Dia não encontrado', 'Antenção', 0 + 64);
        exit;
      end
      else if dataSet.FieldByName('dia_fechado').AsString <> '' then
      begin
        Application.MessageBox('Dia já fechado', 'Antenção', 0 + 64);
        exit;
      end
      else if dataSet.FieldByName('tipo_op').AsString = 'P' then
      begin
        Application.MessageBox('Tempo já pausado', 'Antenção', 0 + 64);
        exit;
      end;
      vHoraFim := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
      dataSet.Edit;
      if dataSet.FieldByName('hora_fim').AsString = '' then
        dataSet.FieldByName('hora_fim').AsString := vHoraFim;
      dataSet.Post;

      dataSet.Insert;
      dataSet.FieldByName('n_os').AsInteger := vColab.nOS;
      dataSet.FieldByName('dia').AsDateTime := vColab.vServ.vDataDia;
      dataSet.FieldByName('cod_vendedor').AsInteger :=
        vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
      dataSet.FieldByName('hora_inicio').AsString := FormatDateTime('hh:mm:ss',
        vDadosIni.getDataHoraBanco(buscas));
      dataSet.FieldByName('tipo_op').AsString := 'P';
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('cod_servico').AsInteger :=
        vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
      dataSet.Post;

      if dataSet.ChangeCount = 0 then
        exit;

      if Apply then
      begin
        CommitaTransacao;
        Result := true;
      end
      else
      begin
        Cancel;
        RollBackTransacao;
      end;
      Result := true;
    except
      on e: exception do begin
        Application.MessageBox(pchar('Erro ao abrir dia. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('Erro ao abrir o dia: Componente: ' + DataSet.Name + ' Erro: ' + e.Message);
      end;
    end;
  finally
    if Result then
    begin
      //vColab.vServ.Close;
      //vColab.Close;
      // desabilitaControlesFormulario;
      frmTMO.Label1.Visible := true;
      frmTMO.Label2.Visible := true;
      frmTMO.BtnAbrirDia.Enabled := false;
      frmTMO.BtnPausa.Enabled := false;
      frmTMO.BtnTiraPausa.Enabled := true;
      frmTMO.btnFechardia.Enabled := false;
      frmTMO.Timer1.Enabled := false;
    end;
  end;
end;

function TTMO.removerPausa: boolean;
var
  vHoraFim: string;
begin
  Result := false;
  try
    try
      if not verificaServOutros then
       exit;
      montaSelect('select first 1 * from tmo_serv_os where n_os = ' + IntToStr(vColab.nOS) +
        ' and cod_vendedor =  ' + vColab.dataSet.FieldByName('cod_vendedor').AsString +
        ' and dia = :DataIni and dia = :DataFim ' +
        ' and cod_servico = ' + vColab.vServ.dataSet.FieldByName('cod_servico').AsString +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1 order by hora_inicio desc', vColab.vServ.vDataDia, vColab.vServ.vDataDia);
      if dataSet.IsEmpty then
      begin
        Application.MessageBox('Dia não encontrado', 'Antenção', 0 + 64);
        exit;
      end
      else if dataSet.FieldByName('dia_fechado').AsString <> '' then
      begin
        Application.MessageBox('Dia já fechado', 'Antenção', 0 + 64);
        exit;
      end
      else if dataSet.FieldByName('tipo_op').AsString = 'S' then
      begin
        Application.MessageBox('Tempo já iniciado', 'Antenção', 0 + 64);
        exit;
      end;

      buscas.close;
      buscas.sql.text := ' Select * from tmo_serv_os ' +
        ' where n_os = :vnos and cod_vendedor = :vcod and dia_fechado is null ' +
        ' and cod_servico = :vcodserv and cod_empresa = :cod_empresa and ativo=1 order by dia,tipo_op';
      buscas.Params[0].AsInteger := vColab.nOS;
      buscas.Params[1].AsInteger := vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
      buscas.Params[2].AsInteger := vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
      buscas.ParamByName('COD_EMPRESA').Text := vDadosIni.CodEmpresa;
      buscas.open;
      while not buscas.eof do
      begin
        if buscas.FieldByName('DIA').AsDateTime < date then
        begin
          buscas2.Close;
          if not buscas.FieldByName('HORA_FIM').IsNull then
            buscas2.SQL.Text := ' update tmo_serv_os set dia_fechado = :dia_fechado ' +
             ' where n_os = :n_os and dia = :dia and cod_vendedor = :cod_vendedor and hora_inicio = :hora_inicio ' +
             ' and tipo_op = :tipo_op and cod_servico = :cod_servico and cod_empresa = :cod_empresa'
          else
            buscas2.SQL.Text := ' update tmo_serv_os set hora_fim = :hora_fim, dia_fechado = :dia_fechado ' +
             ' where n_os = :n_os and dia = :dia and cod_vendedor = :cod_vendedor and hora_inicio = :hora_inicio ' +
             ' and tipo_op = :tipo_op and cod_servico = :cod_servico and cod_empresa = :cod_empresa';
          buscas2.ParamByName('N_OS').AsInteger := vColab.nOS;
          buscas2.ParamByName('DIA').AsDateTime := buscas.FieldByName('DIA').AsDateTime;
          buscas2.ParamByName('COD_VENDEDOR').AsInteger := vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
          buscas2.ParamByName('HORA_INICIO').AsString := buscas.FieldByName('HORA_INICIO').AsString;
          buscas2.ParamByName('TIPO_OP').AsString := buscas.FieldByName('TIPO_OP').AsString;
          buscas2.ParamByName('COD_SERVICO').AsInteger := vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
          buscas2.ParamByName('COD_EMPRESA').Text := vDadosIni.CodEmpresa;
          if buscas.FieldByName('HORA_FIM').IsNull then
            buscas2.ParamByName('HORA_FIM').AsString := '23:59:59';
          buscas2.ParamByName('DIA_FECHADO').AsString := buscas.FieldByName('DIA').AsString;
          buscas2.ExecSQL;
        end;
        buscas.next;
      end;

      vHoraFim := FormatDateTime('hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
      dataSet.Edit;
      if dataSet.FieldByName('hora_fim').AsString = '' then
        dataSet.FieldByName('hora_fim').AsString := vHoraFim;
      dataSet.Post;

      dataSet.Insert;
      dataSet.FieldByName('n_os').AsInteger := vColab.nOS;
      dataSet.FieldByName('dia').AsDateTime := vColab.vServ.vDataDia;
      dataSet.FieldByName('cod_vendedor').AsInteger :=
        vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
      dataSet.FieldByName('hora_inicio').AsString := FormatDateTime('hh:mm:ss',
        vDadosIni.getDataHoraBanco(buscas));
      dataSet.FieldByName('tipo_op').AsString := 'S';
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('cod_servico').AsInteger :=
        vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
      dataSet.Post;

      if vDadosIni.vEmp.vAgendaOficina = 'S' then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select * from tmo_serv_os where n_os = ' + IntToStr(vColab.nOS) +
          ' and cod_vendedor =  ' + vColab.dataSet.FieldByName('cod_vendedor').AsString +
          ' and cod_servico = ' + vColab.vServ.dataSet.FieldByName('cod_servico').AsString +
          ' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and ativo = 1 order by dia asc,hora_inicio asc';
        buscas.Open;

        vTmoServ := 0;
        buscas.First;
        while not buscas.Eof do
        begin
          if not buscas.FieldByName('HORA_FIM').IsNull then
            vTmoServ := vTmoServ + (buscas.FieldByName('HORA_FIM').AsDateTime -
              buscas.FieldByName('HORA_INICIO').AsDateTime);
          buscas.Next;
        end;
      end;

      if dataSet.ChangeCount = 0 then
        exit;

      if Apply then
      begin
        CommitaTransacao;
        Result := true;
      end
      else
      begin
        Cancel;
        RollBackTransacao;
      end;
      Result := true;
    except
      on e: exception do begin
        Application.MessageBox(pchar('Erro ao abrir dia. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('Erro ao abrir o dia: Componente: ' + DataSet.Name + ' Erro: ' + e.Message);
      end;
    end;
  finally
    if Result then
    begin
      //      vColab.vServ.Close;
      //      vColab.Close;
      //      desabilitaControlesFormulario;
      frmTMO.BtnAbrirDia.Enabled := false;
      frmTMO.BtnPausa.Enabled := true;
      frmTMO.BtnTiraPausa.Enabled := false;
      frmTMO.btnFechardia.Enabled := true;
      frmTMO.Timer1.Enabled := true;
      frmTMO.Label1.Visible := true;
      frmTMO.Label2.Visible := true;
    end;
  end;
end;

function TTMO.servicosimultaneo: boolean;
var
  buscas2: TIBQuery;
begin
  Result := true;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas.close;
  buscas.SQL.Text := ' select TMOSERVSIMULT from TIPO_SERVICO ' +
   ' where COD_SERVICO = ' + vColab.vServ.dataSet.FieldByName('cod_servico').AsString;
  buscas.Open;

  if trim(buscas.fieldbyname('TMOSERVSIMULT').asstring) = 'N' then
  begin
   buscas.Close;
   buscas.sql.text := 'Select * from tmo_serv_os ' +
    ' where n_os = :vnos and cod_vendedor = :vcod ' +
    ' and  dia = :vdia and tipo_op = ''S'' and hora_fim is null ' +
    ' and cod_servico <> :vcodserv and cod_empresa = :cod_empresa and ativo = 1 order by tipo_op desc';
   buscas.Params[0].AsInteger := vColab.nOS;
   buscas.Params[1].AsInteger := vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
   buscas.params[2].AsDate := date;
   buscas.Params[3].AsInteger := vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
   buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.CodEmpresa);
   buscas.open;
   if not buscas.isempty then
   begin
     Application.MessageBox('Há outro serviço aberto para esta O.S. Este serviço não aceita TMO simultâneo!', 'Atenção', 0 + 64);
     Result := false;
   end;
  end
  else
  begin
   buscas.Close;
   buscas.sql.text := 'Select * from tmo_serv_os ' +
    ' where n_os = :vnos and cod_vendedor = :vcod ' +
    ' and dia = :vdia and tipo_op = ''S'' and hora_fim is null and cod_servico <> :vcodserv ' +
    ' and cod_empresa = :cod_empresa and ativo=1 order by tipo_op desc';
   buscas.Params[0].AsInteger := vColab.nOS;
   buscas.Params[1].AsInteger := vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
   buscas.params[2].AsDate := date;
   buscas.Params[3].AsInteger := vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
   buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.CodEmpresa);
   buscas.open;
   while not buscas.eof do
   begin
     buscas2.Close;
     buscas2.SQL.Text := ' select TMOSERVSIMULT from TIPO_SERVICO ' +
      ' where COD_SERVICO = ' +  IntToStr(buscas.FieldByName('COD_SERVICO').AsInteger);
     buscas2.Open; 
     if trim(buscas2.fieldbyname('TMOSERVSIMULT').asstring) = 'N' then
     begin
      Application.MessageBox('Há outro serviço aberto para esta O.S. Este serviço não aceita TMO simultâneo!', 'Atenção', 0 + 64);
      Result := false;
      break;
     end;
     buscas.next;
   end;
  end;
end;

function TTMO.verificaServOutros: boolean;
begin
  Result := True;

  buscas.Close;
  buscas.SQL.Text := 'select pv.nped,pv.status_ped,pv.st_term_serv from pedvenda pv' +
      ' where pv.nped = ' + IntToStr(vColab.nOS) + ' and pv.tipo = ''OS''' +
      ' and pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.ativo = 1';
  buscas.Open;

  if buscas.FieldByName('st_term_serv').AsString = 'FINALIZADO' then
  begin
    if application.messagebox(
      'Esta O.S. está indicando servico Finalizado, deseja retirar esta afirmação?',
      'Confirmação', 4 + 32) = IDYES then
    begin
      ExecutaComandosSqlExec('update pedvenda set ST_TERM_SERV = '''' ' +
        ' where nped = ' + IntToStr(vColab.nOS) +
        ' and tipo = ''OS''' +
        ' and cod_empresa = ' + vDadosIni.CodEmpresa);
      atualizarLembreteAgenda('ABERTA');
      CommitaTransacao;
    end
    else
    begin
      Result := False;
      exit;
    end;
  end;

  buscas.close;
  buscas.sql.text := 'select * from pedvenda_serv where cod_vendedor = ' +
    vColab.dataSet.FieldByName('cod_vendedor').AsString + ' and nped = ' +
    IntToStr(vColab.nOS) + ' and tipo = ''OS'' and cod_servico =  ' +
    vColab.vServ.dataSet.FieldByName('cod_servico').AsString;
  buscas.open;
  if Buscas.IsEmpty then
  begin
    Result := False;
    if vDadosIni.vEmp.vUsarAparelho = 'S' then
      Application.MessageBox('Serviço não encontrado para o Técnico!', 'Atenção', 0 + 64)
    else
      Application.MessageBox('Serviço não encontrado para o Mecânico!', 'Atenção', 0 + 64);
    buscas.close;
    buscas.sql.text := 'Select * from tmo_serv_os where n_os = ' + IntToStr(vColab.nOS) +
      ' and cod_vendedor = ' + vColab.dataSet.FieldByName('cod_vendedor').AsString +
      ' and cod_servico = ' + vColab.vServ.dataSet.FieldByName('cod_servico').AsString +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1';
    buscas.open;
    if buscas.isempty then
    begin
      if application.messagebox('Deseja colocar o(s) serviço(s) para este Mecânico/Técnico?',
        'Confirmação', 4 + 32) = IDYES then
      begin
        Result := True;
        ExecutaComandosSqlExec('update pedvenda_serv set cod_vendedor = ' +
          vColab.dataSet.FieldByName('cod_vendedor').AsString + ',nome_vend = ''' +
          vColab.dataSet.FieldByName('nome_vendedor').AsString +
          ''' where nped = ' + IntToStr(vColab.nOS) + ' and tipo = ''OS'' ' +
          ' and cod_servico = ' + vColab.vServ.dataSet.FieldByName('cod_servico').AsString +
          ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
      end;
    end;
  end;

  buscas.close;
  buscas.sql.text := 'Select * from tmo_serv_os where n_os = :vnos and cod_vendedor = :vcod and ' +
    'dia = :vdia and cod_servico = :vcodserv and cod_empresa = :cod_empresa and ativo=1 order by tipo_op desc';
  buscas.Params[0].AsInteger := vColab.nOS;
  buscas.Params[1].AsInteger := vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
  buscas.params[2].AsDate := vColab.vServ.vDataDia;
  buscas.Params[3].AsInteger := vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
  buscas.ParamByName('COD_EMPRESA').Text := vDadosIni.CodEmpresa;
  buscas.open;
  if not buscas.IsEmpty then
  begin
    buscas.close;
    buscas.sql.text := 'Select * from tmo_serv_os where n_os = :vnos and cod_vendedor = :vcod and ' +
      'dia = :vdia and dia_fechado is null and cod_servico = :vcodserv and cod_empresa = :cod_empresa and ativo=1 order by tipo_op desc';
    buscas.Params[0].AsInteger := vColab.nOS;
    buscas.Params[1].AsInteger := vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
    buscas.params[2].AsDate := vColab.vServ.vDataDia;
    buscas.Params[3].AsInteger := vColab.vServ.dataSet.FieldByName('cod_servico').AsInteger;
    buscas.ParamByName('COD_EMPRESA').Text := vDadosIni.CodEmpresa;
    buscas.open;
    if buscas.IsEmpty then
    begin
     Result := False;
     Application.MessageBox('Serviço já fechado para este dia!', 'Atenção', 0 + 64);
     exit;
    end;
  end;
  Result := servicosimultaneo;
end;

procedure TTMO.VerIndFinaliza;
begin
  buscas.close;
  buscas.sql.text := 'Select * from tmo_serv_os where n_os = ' + IntToStr(vColab.nOS) +
    ' and cod_vendedor = ' + vColab.dataSet.FieldByName('cod_vendedor').AsString + ' and ' +
    'dia_fechado is null and cod_empresa = ' + vdadosini.codEmpresa +
    ' and ativo=1 order by tipo_op desc';
  buscas.Open;
  if buscas.IsEmpty then
  begin
    if application.messagebox('Este fechamento do dia, indica término dos serviços desta O.S.?',
      'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    begin
      IniciaTransacao;
      
      if vDadosIni.vEmp.vAgendaOficina = 'S' then
        atualizarLembreteAgenda('AGUARDANDO');

      ExecutaComandosSqlExec('update PEDVENDA set ST_TERM_SERV = ''FINALIZADO'' ' +
        ' where nped = ' + IntToStr(vColab.nOS) + ' and tipo = ''OS'' and cod_empresa = ' +
        vDadosIni.CodEmpresa);
      CommitaTransacao;
    end;
  end;
end;

{ TColabTMO }

function TColabTMO.abreColab(pOS: integer): boolean;
begin
  montaSelect('select distinct c.cod_vendedor, c.nome_vendedor from colaborador c' +
    ' inner join pedvenda_serv ps on ps.tipo = ''OS'' and' +
    ' ((ps.cod_vendedor = c.cod_vendedor))' +
    ' and ps.cod_empresa = c.cod_empresa and (ps.status is null or ps.status = '''') ' +
    ' where ps.nped = ' + IntToStr(pOS) +
    ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by c.nome_vendedor');
  Result := not dataSet.IsEmpty;
end;

function TColabTMO.abreColab(pOS, pColab: integer): boolean;
begin
  montaSelect('select distinct c.cod_vendedor, c.nome_vendedor from colaborador c' +
    ' inner join pedvenda_serv ps on ps.tipo = ''OS'' and' +
    ' ((ps.cod_vendedor = c.cod_vendedor)) and ' +
    ' (ps.status is null or ps.status = '''') ' +
    ' where ps.nped = ' + IntToStr(pOS) +
    ' and c.cod_vendedor = ' + IntToStr(pColab) +
    ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by c.nome_vendedor');
  Result := not dataSet.IsEmpty;
end;

function TColabTMO.abreColab: boolean;
begin
  if vDadosIni.vEmp.vUsarAparelho = 'S' then
  begin
    montaSelect('select c.cod_vendedor, c.nome_vendedor from colaborador c ' +
     ' inner join funcoes f on f.cod_funcao = c.cod_funcao ' +
     ' where ((f.desc_funcao like ''%TECNICO%'') or (f.desc_funcao like ''%TÉCNICO%'')) ' +
     ' and c.ativo = 1 and c.cod_empresa = ' + vDadosIni.codEmpresa);
  end
  else
  begin
    montaSelect('select c.cod_vendedor, c.nome_vendedor from colaborador c ' +
     ' inner join funcoes f on f.cod_funcao = c.cod_funcao ' +
     ' where ((f.desc_funcao like ''%MECANICO%'') or (f.desc_funcao like ''%MECÂNICO%'')) ' +
     ' and c.ativo = 1 and c.cod_empresa = ' + vDadosIni.codEmpresa);
  end;
  Result := not dataSet.IsEmpty;
end;

procedure TColabTMO.colabAfterScroll(DataSet: TDataSet);
begin
  vServ.abreServico(nOS, DataSet.FieldByName('cod_vendedor').AsInteger, true);
//  vServ.abreServico(nOS, DataSet.FieldByName('cod_vendedor').AsInteger);
end;

constructor TColabTMO.create;
begin
  dataSet := TClientDataSet(dtmTMO.cdsColab);
  buscas := TIBQuery(dtmTMO.qrBuscas);
  transacao := TIBTransaction(dtmTMO.IBTransTMO);
  dataSet.AfterScroll := colabAfterScroll;
  vServ := TServTMO.create;
end;

destructor TColabTMO.Destroy;
begin
  vServ.Free;
  vServ := nil;
  inherited;
end;

{ TServTMO }

function TServTMO.abreServico(nOS, codColab: integer): boolean;
begin
  nOSServ := nOS;
  codColabServ := codColab;
  montaSelect(' select ts.cod_servico,ts.desc_servico, tmo from tipo_servico ts ' +
    ' where ((ts.tmo <> 0) and (not ts.tmo is null)) and ts.cod_servico in ' +
    ' (select ps.cod_servico from pedvenda_serv ps ' +
    ' where ps.tipo = ''OS'' and ps.nped = ' + IntToStr(nOS) +
    ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ((ps.cod_vendedor = ' + IntToStr(codColab) + ') or ' +
    ' (ps.cod_vendedor <> ' + inttostr(codcolab) +
    ' and (Select count(*) from tmo_serv_os tmo where tmo.n_os = ' + IntToStr(nOS) +
    ' and tmo.cod_servico = ps.cod_servico and tmo.cod_empresa = ps.cod_empresa ' +
    ' and tmo.ativo=1) = 0 )) ' +
    ' and ps.cod_servico = ts.cod_servico and (ps.status is null or ps.status = '''') ' +
    ' ) order by ts.desc_servico');
  obTMO.vTmo := dataSet.FieldByName('TMO').AsFloat;
  Result := not dataSet.IsEmpty;
end;

function TServTMO.abreServico(nOS, codColab: integer; pTodos: boolean): boolean;
begin
  nOSServ := nOS;
  codColabServ := codColab;
  montaSelect(' select ts.cod_servico,ts.desc_servico, tmo from tipo_servico ts ' +
    ' where ((ts.tmo <> 0) and (not ts.tmo is null)) and ts.cod_servico in ' +
    ' (select ps.cod_servico from pedvenda_serv ps ' +
    ' where ps.tipo = ''OS'' and ps.nped = ' + IntToStr(nOS) +
    ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ps.cod_servico = ts.cod_servico and (ps.status is null or ps.status = '''') ' +
    ' ) order by ts.desc_servico');
  obTMO.vTmo := dataSet.FieldByName('TMO').AsFloat;
  Result := not dataSet.IsEmpty;
end;

constructor TServTMO.create;
begin
  dataSet := TClientDataSet(dtmTMO.cdsServ);
  buscas := TIBQuery(dtmTMO.qrBuscas);
  transacao := TIBTransaction(dtmTMO.IBTransTMO);
  vDataDia := vDadosIni.getDataBanco(buscas);
  dataSet.AfterScroll := servAfterScroll;
end;

procedure TServTMO.servAfterScroll(DataSet: TDataSet);
begin
  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;
  buscas3 := TIBQuery.Create(Application);
  buscas3.Database := buscas.Database;

  buscas.Close;
  buscas.SQL.Text := 'select first 1 tmo.hora_inicio, tmo.hora_fim, tmo.tipo_op, tmo.dia_fechado' +
    ' from tmo_serv_os tmo' +
    ' inner join tipo_servico tp on tp.cod_servico = tmo.cod_servico' +
    ' where tmo.n_os = ' + IntToStr(nOSServ) +
    ' and tmo.dia = :dia' +
    ' and tmo.cod_vendedor = ' + IntToStr(codColabServ) +
    ' and tmo.cod_servico = ' + DataSet.FieldByName('cod_servico').AsString +
    ' and tmo.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by tmo.hora_inicio desc';
  buscas.Params[0].AsDate := vDataDia;
  buscas.Open;
  vHoraFim := buscas.FieldByName('hora_fim').AsString;
  vTipoOp := buscas.FieldByName('tipo_op').AsString;
  if frmTMO <> nil then
  begin

    frmTMO.BtnAbrirDia.Enabled := buscas.IsEmpty;
    frmTMO.BtnPausa.Enabled := (not buscas.IsEmpty) and (vTipoOp = 'S') and (vHoraFim = '');
    frmTMO.BtnTiraPausa.Enabled := (not buscas.IsEmpty) and (vTipoOp = 'P') and (vHoraFim = '');
    frmTMO.btnFechardia.Enabled := (not buscas.IsEmpty);
    frmTMO.lbStatus.Visible := (buscas.FieldByName('dia_fechado').AsString <> '');

    if frmTMO.BtnAbrirDia.Enabled = true then
    begin
      frmTMO.Timer1.Enabled := false;
      frmTMO.Label1.Visible := true;
      frmTMO.Label2.Visible := true;
      frmTMO.Label1.Caption := '00:00:00';
      vtempo_rest := StrToDateTime('01:00:00') * dataSet.FieldByName('tmo').AsFloat;
      frmTMO.Label2.Caption := FormatDateTime('hh:mm:ss', vtempo_rest);
      exit;
    end;

    if frmTMO.BtnPausa.Enabled = true then
    begin
      buscas2.Close;
      buscas2.SQL.Text := 'select * from tmo_serv_os ' +
        ' where n_os = ' + IntToStr(nOSServ) +
        ' and dia = :dia' +
        ' and cod_vendedor =  ' + IntToStr(codColabServ) +
        ' and cod_servico = ' + dataSet.FieldByName('cod_servico').AsString +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ativo = 1 order by dia asc,hora_inicio asc';
      buscas2.Params[0].AsDate := vDataDia;
      buscas2.Open;
      buscas2.FetchAll;

      vtempo_util := 0;
      buscas2.RecordCount;
      buscas2.First;
      while not buscas2.Eof do
      begin
        if buscas2.FieldByName('HORA_FIM').IsNull then
          vtempo_util := vtempo_util + (StrToDateTime(FormatDateTime('hh:mm:ss',
            vDadosIni.getDataHoraBanco(buscas3))) - buscas2.FieldByName('HORA_INICIO').AsDateTime)
        else
          vtempo_util := vtempo_util + (buscas2.FieldByName('HORA_FIM').AsDateTime -
            buscas2.FieldByName('HORA_INICIO').AsDateTime);
        buscas2.Next;
      end;
      frmTMO.Timer1.Enabled := true;
      frmTMO.Label1.Visible := true;
      frmTMO.Label2.Visible := true;
      frmTMO.Label1.Caption := FormatDateTime('hh:mm:ss', vtempo_util);
      vtempo_rest := StrToDateTime('01:00:00') * dataSet.FieldByName('tmo').AsFloat - vtempo_util;

      if vtempo_util >= (StrToDateTime('01:00:00') * obTMO.vTmo) then
        frmTMO.Label2.Caption := '(' + FormatDateTime('hh:mm:ss', vtempo_rest) + ')'
      else
        frmTMO.Label2.Caption := FormatDateTime('hh:mm:ss', vtempo_rest);
      exit;
    end;

    if frmTMO.BtnTiraPausa.Enabled = true then
    begin
      buscas2.Close;
      buscas2.SQL.Text := 'select * from tmo_serv_os ' +
        ' where n_os = ' + IntToStr(nOSServ) +
        ' and dia = :dia' +
        ' and cod_vendedor =  ' + IntToStr(codColabServ) +
        ' and cod_servico = ' + DataSet.FieldByName('cod_servico').AsString +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and tipo_op =''S'' and ativo = 1 order by dia asc,hora_inicio asc';
      buscas2.Params[0].AsDate := vDataDia;
      buscas2.Open;
      buscas2.FetchAll;

      vtempo_util := 0;
      buscas2.First;
      while not buscas2.Eof do
      begin
        if not buscas2.FieldByName('HORA_FIM').IsNull then
          vtempo_util := vtempo_util + (buscas2.FieldByName('HORA_FIM').AsDateTime -
            buscas2.FieldByName('HORA_INICIO').AsDateTime);
        buscas2.Next;
      end;
      frmTMO.Timer1.Enabled := false;
      frmTMO.Label1.Visible := true;
      frmTMO.Label2.Visible := true;
      frmTMO.Label1.Caption := FormatDateTime('hh:mm:ss', vtempo_util);
      vtempo_rest := (StrToDateTime('01:00:00') * dataSet.FieldByName('tmo').AsFloat - vtempo_util);
      if ((StrToDateTime('01:00:00') * dataSet.FieldByName('tmo').AsFloat) >= (vtempo_util)) then
        frmTMO.Label2.Caption := FormatDateTime('hh:mm:ss', vtempo_rest)
      else
        frmTMO.Label2.Caption := '(' + FormatDateTime('hh:mm:ss', vtempo_rest) + ')';
      exit;
    end;

    if frmTMO.btnFechardia.Enabled = true then
    begin
      buscas2.Close;
      buscas2.SQL.Text := 'select * from tmo_serv_os ' +
        ' where n_os = ' + IntToStr(nOSServ) +
        ' and dia = :dia' +
        ' and cod_vendedor =  ' + IntToStr(codColabServ) +
        ' and cod_servico = ' + DataSet.FieldByName('cod_servico').AsString +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and tipo_op =''S'' and ativo = 1 order by dia asc,hora_inicio asc';
      buscas2.Params[0].AsDate := vDataDia;  
      buscas2.Open;
      buscas2.FetchAll;

      vtempo_util := 0;
      buscas2.First;
      while not buscas2.Eof do
      begin
        if not buscas2.FieldByName('HORA_FIM').IsNull then
          vtempo_util := vtempo_util + (buscas2.FieldByName('HORA_FIM').AsDateTime -
            buscas2.FieldByName('HORA_INICIO').AsDateTime);
        buscas2.Next;
      end;
      frmTMO.Timer1.Enabled := false;
      frmTMO.Label1.Visible := true;
      frmTMO.Label2.Visible := true;
      frmTMO.Label1.Caption := FormatDateTime('hh:mm:ss', vtempo_util);
      vtempo_rest := (StrToDateTime('01:00:00') * dataSet.FieldByName('tmo').AsFloat - vtempo_util);
      if ((StrToDateTime('01:00:00') * dataSet.FieldByName('tmo').AsFloat) >= (vtempo_util)) then
        frmTMO.Label2.Caption := FormatDateTime('hh:mm:ss', vtempo_rest)
      else
        frmTMO.Label2.Caption := '(' + FormatDateTime('hh:mm:ss', vtempo_rest) + ')';
      exit;
    end;
  end;
end;

end.

