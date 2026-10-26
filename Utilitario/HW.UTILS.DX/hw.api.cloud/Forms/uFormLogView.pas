unit uFormLogView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uClasseConexao, Vcl.StdCtrls,
  Vcl.CheckLst, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, logmessage_class, logmessage_table_class,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type

  TLogDirection = (ldServerClient, ldClientServer);
  TLogDirectionS = set of TLogDirection;
  TLogLevel = (llError, llWarning, llInfo);
  TLogLevelS = set of TLogLevel;
  TLogEvent = procedure(value: string) of object;

  TLogViewBase = class(TConexao)
  private
    FCnpj: string;
    Fterminais: string;
    Flevel: TLogLevelS;
    Fdirection: TLogDirectionS;
    procedure FieldMemoDGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    property cnpj: string read FCnpj write Fcnpj;
    property terminais: string read Fterminais write Fterminais;
    property level: TLogLevelS read Flevel write Flevel;
    property direction: TLogDirectionS read Fdirection write Fdirection;
  end;

  TLogView = class(TLogViewBase)
  private
    FiniId: Integer;
    FlastId: Integer;
    FLog: TLogEvent;
//    FLastError: string;
  public
    constructor Create();

    function GetLog(): TLogmessages_class;
    procedure Run();

    property lastId: Integer read FlastId write FlastId;
    property OnLog: TLogEvent read FLog write FLog;
  end;

  TLogViewDetail = class(TLogViewBase)
  private
    FlogValues: TConexao_OOP;
    FseqValues: TConexao_OOP;
    query: TConexao_OOP;
    schemaValue: TLogmessage_table_class;
    FdateStart: TDateTime;
    FdateEnds: TDateTime;
    FAfterLogText: TLogEvent;
    FAfterLogValueData: TLogEvent;

    procedure HandleValues();
    procedure HandleValuesData();
    procedure AfterScroll(DataSet: TDataSet);
    procedure SeqAfterScroll(DataSet: TDataSet);
    procedure SeqDataAfterScroll(DataSet: TDataSet);
    procedure FieldEnumGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();
    destructor Destroy; override;

    procedure Run();

    property dateStart: TDateTime read FdateStart write FdateStart;
    property dateEnds: TDateTime read FdateEnds write FdateEnds;
    property logValues: TConexao_OOP read FlogValues write FlogValues;
    property seqValues: TConexao_OOP read FseqValues write FseqValues;
    property AfterLogText: TLogEvent read FAfterLogText write FAfterLogText;
    property AfterLogValueData: TLogEvent read FAfterLogValueData write FAfterLogValueData;
  end;

  TfrmLogView = class(TForm)
    Panel3: TPanel;
    PageControl1: TPageControl;
    ts_log: TTabSheet;
    Panel1: TPanel;
    ts_detail: TTabSheet;
    GroupBox1: TGroupBox;
    ckListCaixa: TCheckListBox;
    Panel5: TPanel;
    memo_log: TMemo;
    timerLog: TTimer;
    Panel6: TPanel;
    Panel7: TPanel;
    GroupBox2: TGroupBox;
    Panel10: TPanel;
    GroupBox3: TGroupBox;
    grid_data: TDBGrid;
    grid_detail: TDBGrid;
    Panel8: TPanel;
    memo_detail: TMemo;
    Panel9: TPanel;
    GroupBox5: TGroupBox;
    ckTipoErros: TCheckBox;
    ckTipoWarn: TCheckBox;
    ckTipoInfo: TCheckBox;
    Panel11: TPanel;
    GroupBox6: TGroupBox;
    ckDirecClientServer: TCheckBox;
    ckDirecServerClient: TCheckBox;
    Panel12: TPanel;
    GroupBox7: TGroupBox;
    ckl_detail_caixa: TCheckListBox;
    Panel13: TPanel;
    GroupBox8: TGroupBox;
    ck_det_err: TCheckBox;
    ck_det_warn: TCheckBox;
    ck_det_info: TCheckBox;
    Panel14: TPanel;
    GroupBox9: TGroupBox;
    ck_det_cli_serv: TCheckBox;
    ck_det_serv_cli: TCheckBox;
    BitBtn5: TBitBtn;
    Panel17: TPanel;
    grid_seq: TDBGrid;
    Panel15: TPanel;
    Panel2: TPanel;
    bt_limpar: TBitBtn;
    bt_parar: TBitBtn;
    Panel4: TPanel;
    BitBtn3: TBitBtn;
    bt_detail: TBitBtn;
    Panel16: TPanel;
    Panel18: TPanel;
    bt_voltar: TBitBtn;
    Panel19: TPanel;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    ed_dt_ini: TMaskEdit;
    ed_dt_fim: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure timerLogTimer(Sender: TObject);
    procedure ckListCaixaClickCheck(Sender: TObject);
    procedure bt_pararClick(Sender: TObject);
    procedure bt_limparClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bt_detailClick(Sender: TObject);
    procedure grid_detailEnter(Sender: TObject);
    procedure grid_dataEnter(Sender: TObject);
    procedure grid_detailDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn5Click(Sender: TObject);
    procedure bt_voltarClick(Sender: TObject);
  private
    Flog: TLogView;
    FcaixaId: Integer;
    FempresaId: Integer;
    FTimerBusy: Boolean;
    logDetail: TLogViewDetail;
    procedure log_print(value: string);
    procedure log_detail_print(value: string);

    procedure build_filter_caixa;
  public
    { Public declarations }
    property log: TLogView read Flog write Flog;
    property caixaId: Integer read FcaixaId write FcaixaId;
    property empresaId: Integer read FempresaId write FempresaId;
  end;

var
  frmLogView: TfrmLogView;

implementation

{$R *.dfm}

uses
  System.StrUtils,
  System.Math,
  Winapi.ShellAPI,
  HW.Json,
  GenericDataEtd,
  hw_win_utils,
  hw_utils;

{ TLogView }

constructor TLogView.Create;
begin
  inherited Create;
  FlastId := 0;
  FiniId := 0;
end;

function TLogView.GetLog(): TLogmessages_class;
begin
  Result := TLogmessages_class.Create;

  if not Banco.Connected then
  begin
    var err := '';
    if not ConfigureStr(';loggeral=N').conectar(IniConf.ReadStr('Banco', 'LogNFCeOff'), '', '', err) then
    begin
//      erro := Format('Erro ao conectar %s', [err]);
      Exit;
    end;
  end;

  if lastId = 0 then
  begin
    lastId := SqlScalar('select first 1 l.seq from logmessage l' +
                        ' where l.createdat <= (select current_ts from sp_current_ts) and l.cnpj = ''%s''' +
                        ' order by l.seq desc').AsInteger;
    FiniId := lastId;
  end;

  Result.CopyFrom(TLogmessage_class,
                  Client.ClientOpen('select * from logmessage' +
                                    ' where cnpj = ''%s''' +
                                    ' and seq > %d' +
                                    ' order by seq', [cnpj, lastId]));
  if Result.Count > 0 then
    lastId := (Result.Last as TLogmessage_class).seq;
end;

procedure TLogView.Run();
begin
  if not Banco.Connected then
  begin
    var err := '';
    if not ConfigureStr(';loggeral=N').conectar(IniConf.ReadStr('Banco', 'LogNFCeOff'), '', '', err) then
    begin
      if Assigned(FLog) then
        LogError(Format('Erro ao conectar %s', [err]));
      Exit;
    end;
  end;

  if lastId = 0 then
  begin
    lastId := SqlScalar('select first 1 l.seq from logmessage l' +
                        ' where l.createdat <= (select current_ts from sp_current_ts) and l.cnpj = ''%s''' +
                        ' order by l.seq desc', [FCnpj]).AsInteger;
    FiniId := lastId;
  end;

//  var list: NewStringList(terminais, ',');
//  var str := '';
//  var I := 0;
//  for I := 0 to list.Count - 1 do
//    str := str + IfThen(str <> '', ',') + list[I].QuotedString;
  var str := IfThen(Fterminais <> '', 'and source in (' + Fterminais + ')');

  var strL := '';
  for var l in Flevel do
    strL := strL +  IfThen(strL <> '', ',') + Ord(l).ToString();

  str := str + IfThen(strL <> '', ' and level_ in (' + strL + ')');

  var strD := '';
  for var d in Fdirection do
    strD := strD +  IfThen(strD <> '', ',') + Ord(d).ToString();

  str := str + IfThen(strD <> '', ' and direction in (' + strD + ')');

  var dados := TLogmessages_class.Create;
  dados.CopyFrom(TLogmessage_class,
                  Client.ClientOpen('select * from logmessage' +
                                    ' where cnpj = ''%s''' +
                                    ' and seq > %d' +
                                    ' %s' +
                                    ' order by seq', [cnpj, lastId, str]));
  if dados.Count > 0 then
    lastId := dados.Items[dados.Count - 1].seq;

  if Assigned(FLog) then
    for var I := 0 to dados.Count - 1 do
    begin
      Sleep(100);
      str := ReverseString(dados.Items[I].text.Text);
      while (Pos(#10#13, str) = 1) do
        str := Copy(str, 3, Length(str));
      str := ReverseString(str);

//      while (dados.Items[I].text.Count > 0) and
//            (dados.Items[I].text[dados.Items[I].text.Count - 1].Trim.IsEmpty) do
//        dados.Items[I].text.Delete(dados.Items[I].text.Count - 1);

//      str := dados.Items[I].text.Text;
//      if EndsText( then

      FLog(dados.Items[I].seq.ToString() + ' - ' +
           FormatDateTime('DD/MM/YYYY hh:mm:ss', VarToDateTime(dados.Items[I].createdat)) + ' - ' +
           dados.Items[I].source + ' - ' +
           IfThen(TLogDirection(dados.Items[I].direction) = ldServerClient, '[Servidor --> Caixa]', '[Caixa --> Servidor]') +
           IfThen(TLogLevel(dados.Items[I].level_) = llError  , ' >>> ERRO <<<') +
           IfThen(TLogLevel(dados.Items[I].level_) = llWarning, ' > Atenção <') + ' ' +
           str);
//           dados.Items[I].text.Text);
    end;
end;

{ TfrmLogView }

procedure TfrmLogView.bt_limparClick(Sender: TObject);
begin
  memo_log.Lines.Clear;
end;

procedure TfrmLogView.bt_detailClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    ckl_detail_caixa.Clear;
    for var I := 0 to ckListCaixa.Count - 1 do
    begin
      ckl_detail_caixa.Items.Add(ckListCaixa.Items[I]);
      ckl_detail_caixa.Checked[I] := ckListCaixa.Checked[I];
    end;

    logDetail.AfterLogValueData := nil;
    logDetail.AfterLogText := log_detail_print;
    logDetail.cnpj := log.cnpj;
    logDetail.terminais := log.terminais;
    logDetail.level := log.level;
    logDetail.direction := log.direction;
    logDetail.dateStart := Now - EncodeTime(0,1,0,0);
    logDetail.dateEnds := Now + EncodeTime(1,0,0,0);
    logDetail.Run;
    grid_detail.DataSource := logDetail.Client.DataSourceOOP;
    grid_seq.DataSource := logDetail.seqValues.DataSourceOOP;
    grid_data.DataSource := logDetail.logValues.DataSourceOOP;

    ed_dt_ini.Text := FormatDateTime('dd/MM/yyyy hh:mm', logDetail.dateStart);
    ed_dt_fim.Text := FormatDateTime('dd/MM/yyyy hh:mm', logDetail.dateEnds);

    PageControl1.ActivePage := ts_detail;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLogView.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogView.BitBtn5Click(Sender: TObject);
var
  dt: TDateTime;
begin
  Screen.Cursor := crHourGlass;
  try

    var str := '';
    var pad := '';
    for var I := 0 to ckl_detail_caixa.Count - 1 do
      if ckl_detail_caixa.Checked[I] then
      begin
        pad := ckl_detail_caixa.Items[I].Substring(0, 3);
        str := str + IfThen(str <> '', ',') + Format('Terminal %s', [PadL(pad, 3, '0')]).QuotedString();
      end;
    logDetail.terminais := str;

    logDetail.level := [];
    if ck_det_err.Checked then
      logDetail.level := logDetail.level + [llError];
    if ck_det_warn.Checked then
      logDetail.level := logDetail.level + [llWarning];
    if ck_det_info.Checked then
      logDetail.level := logDetail.level + [llInfo];

    logDetail.direction := [];
    if ck_det_cli_serv.Checked then
      logDetail.direction := logDetail.direction + [ldClientServer];
    if ck_det_serv_cli.Checked then
      logDetail.direction := logDetail.direction + [ldServerClient];

    if not TryStrToDateTime(ed_dt_ini.Text, dt) then
    begin
      ShowAtencao('Data inicial inválida');
      Exit;
    end;
    logDetail.dateStart := dt;

    if not TryStrToDateTime(ed_dt_fim.Text, dt) then
    begin
      ShowAtencao('Data final inválida');
      Exit;
    end;
    logDetail.dateEnds := dt;

  //  logDetail.AfterLogValueData := nil;
  //  logDetail.AfterLogText := log_detail_print;

    logDetail.Run;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmLogView.bt_pararClick(Sender: TObject);
begin
  timerLog.Enabled := not timerLog.Enabled;
  bt_parar.Caption := IfThen(timerLog.Enabled, 'Parar', 'Continuar');
end;

procedure TfrmLogView.bt_voltarClick(Sender: TObject);
begin
  PageControl1.ActivePage := ts_log;
end;

procedure TfrmLogView.build_filter_caixa;
begin
  var str := '';
  var pad := '';
  for var I := 0 to ckListCaixa.Count - 1 do
    if ckListCaixa.Checked[I] then
    begin
      pad := ckListCaixa.Items[I].Substring(0, 3);
      str := str + IfThen(str <> '', ',') + Format('Terminal %s', [PadL(pad, 3, '0')]).QuotedString();
    end;
  log.terminais := str;
end;

procedure TfrmLogView.ckListCaixaClickCheck(Sender: TObject);
begin
  build_filter_caixa;
end;

procedure TfrmLogView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  log.Free;
  logDetail.Free;

  Action := caFree;
  frmLogView := nil;
end;

procedure TfrmLogView.FormCreate(Sender: TObject);
begin
  log := TLogView.Create;
  log.OnLog := log_print;

  logDetail := TLogViewDetail.Create;

  FTimerBusy := False;
  timerLog.Enabled := False;
end;

procedure TfrmLogView.FormShow(Sender: TObject);
begin
  Self.Icon.Handle := ExtractIcon(Handle,PChar(Application.ExeName), 0);

  ts_log.TabVisible := False;
  ts_detail.TabVisible := False;
  PageControl1.ActivePage := ts_log;

  var conHw := TConexao.Create;
  try
    ckListCaixa.Clear;
    var err := '';
    if not conHw.conectar(err) then
      ShowErro('Não foi possive conectar ao banco para obter os caixas. %s', [err])
    else
    begin
      conHw.ClientOOP('select cod_emissor, nome_emissor from nfc_emissor' +
                      ' where cod_empresa = %d and coalesce(REFRESH_TOKEN, '''') <> ''''' +
                      ' order by cod_emissor',
                      [empresaId]).First;
      while not conHw.Client.Eof do
      begin
        ckListCaixa.Items.Add(Format('%s - %s', [PadL(conHw.Client.fint('cod_emissor'), 3), conHw.Client.fstr('nome_emissor')]));
        if caixaId = conHw.Client.fint('cod_emissor') then
          ckListCaixa.Checked[ckListCaixa.Items.Count - 1] := True;
        conHw.Client.Next;
      end;
    end;

  finally
    conHw.Free;
  end;

  memo_log.Lines.Clear;
  timerLog.Interval := 1000;
  timerLog.Enabled := True;
end;

procedure TfrmLogView.grid_dataEnter(Sender: TObject);
begin
  logDetail.AfterLogText := nil;
  logDetail.AfterLogValueData := log_detail_print;
end;

procedure TfrmLogView.grid_detailDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdFocused in State) then
    if (Column.FieldName = 'LEVEL_') and
       (TLogLevel(logDetail.Client.fint('LEVEL_')) = llError) then
    begin
//      TDBGrid(sender).Canvas.Brush.Color := clRed;
      TDBGrid(sender).Canvas.Font.Color := clRed;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else if (Column.FieldName = 'LEVEL_') and
       (TLogLevel(logDetail.Client.fint('LEVEL_')) = llWarning) then
    begin
//      TDBGrid(sender).Canvas.Brush.Color := clOlive;
      TDBGrid(sender).Canvas.Font.Color := clOlive;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else if (Column.FieldName = 'DIRECTION') then
    begin
      if TLogDirection(logDetail.Client.fint('DIRECTION')) = ldServerClient then
      begin
//        TDBGrid(sender).Canvas.Brush.Color := clBlue;
        TDBGrid(sender).Canvas.Font.Color := clBlue;
      end
      else
      begin
//        TDBGrid(sender).Canvas.Brush.Color := clGreen;
        TDBGrid(sender).Canvas.Font.Color := clGreen;
      end;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmLogView.grid_detailEnter(Sender: TObject);
begin
  logDetail.AfterLogValueData := nil;
  logDetail.AfterLogText := log_detail_print;
end;

procedure TfrmLogView.log_detail_print(value: string);
begin
  memo_detail.Lines.Text := value;
end;

procedure TfrmLogView.log_print(value: string);
begin
  memo_log.Lines.Add(value);
end;

procedure TfrmLogView.timerLogTimer(Sender: TObject);
begin
  if FTimerBusy then
    Exit;

  FTimerBusy := True;
  try
    log.level := [];
    if ckTipoErros.Checked then log.level := log.level + [llError];
    if ckTipoWarn.Checked then  log.level := log.level + [llWarning];
    if ckTipoInfo.Checked then  log.level := log.level + [llInfo];

    log.direction := [];
    if ckDirecServerClient.Checked then log.direction := log.direction + [ldServerClient];
    if ckDirecClientServer.Checked then log.direction := log.direction + [ldClientServer];

    log.Run;
  finally
    FTimerBusy := False;
  end;
end;

{ TLogViewDetail }

procedure TLogViewDetail.AfterScroll(DataSet: TDataSet);
begin
  HandleValues;
end;

constructor TLogViewDetail.Create;
begin
  inherited Create();
  schemaValue := TLogmessage_table_class.Create;
end;

destructor TLogViewDetail.Destroy;
begin
  schemaValue.Free;
  inherited;
end;

procedure TLogViewDetail.FieldEnumGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if not Client.IsEmpty then
    if Sender.FieldName.Equals('DIRECTION') then
      Text := IfThen(TLogDirection(Sender.AsInteger) = ldServerClient, 'Srv>Cli', 'Cli>Srv')
    else if Sender.FieldName.Equals('LEVEL_') then
      Text := IfThen(TLogLevel(Sender.AsInteger) = llInfo, 'Info',
                     IfThen(TLogLevel(Sender.AsInteger) = llWarning, 'Atenção', 'Erro'));
end;

procedure TLogViewDetail.HandleValues;
begin
  if FlogValues.DataSet.Active then
    FlogValues.DataSet.EmptyDataSet;
  if FseqValues.DataSet.Active then
    FseqValues.DataSet.EmptyDataSet;

  if Client.fempty('id') then
    Exit;

  FseqValues.DataSet.AfterScroll := nil;
  FseqValues.Open('select * from LOGMESSAGE_VALUES' +
                  ' where log_id = ''%s''' +
                  ' order by seq', [Client.fstr('id')]);
  schemaValue.CopyFrom(query.ClientOpen('select * from LOGMESSAGE_TABLE' +
                                        ' where log_id = ''%s''', [Client.fstr('id')]));
  FseqValues.DataSet.FieldByName('seq').Alignment := taLeftJustify;
//  fieldsValues := SqlScalar('select ')
  HandleValuesData;
  FseqValues.DataSet.AfterScroll := SeqAfterScroll;
  if Assigned(FAfterLogText) then
    FAfterLogText(Client.fstr('text'));
end;

procedure TLogViewDetail.HandleValuesData;
begin
  if Assigned(FAfterLogValueData) then
    FAfterLogValueData('');
  FlogValues.DataSet.AfterScroll := nil;

  if FlogValues.DataSet.Active then
    FlogValues.DataSet.EmptyDataSet;

  if FseqValues.fempty('log_id') then
    Exit;

  if schemaValue.log_id.IsEmpty then
    Exit;

  if not FseqValues.fequals('log_id', schemaValue.log_id) then
    Exit;

  var keys := TJsonHw.ToObject<TKeyWords>(schemaValue.keys);

  var listData := NewStringList(FseqValues.fstr('data'), keys.separator);
  var listFields := NewStringList(schemaValue.campos.Text, ',');


  if listData.Count <> listFields.Count then
    Exit;


  FlogValues.DataSet.DisableControls;
  for var I := 0 to listFields.Count - 1 do
  begin
//    if listFields[I].Equals('GUIDT') then
//    FlogValues.DataSet.Append;
    FlogValues.DataSet.Append;
    FlogValues.DataSet.FieldByName('field').AsString := listFields[I];
    FlogValues.DataSet.FieldByName('data').AsString := listData[I]
      .Replace(keys.quote, '''')
      .Replace(keys.nullValue, '(null)');
    FlogValues.DataSet.Post;
  end;
  FlogValues.First;
  FlogValues.DataSet.EnableControls;

  if Assigned(FAfterLogValueData) then
    FAfterLogValueData(FlogValues.fstr('data'));

  FlogValues.DataSet.AfterScroll := SeqDataAfterScroll;
end;

procedure TLogViewDetail.Run;
begin
  if not Banco.Connected then
  begin
    var err := '';
    if not ConfigureStr(';loggeral=N').conectar(IniConf.ReadStr('Banco', 'LogNFCeOff'), '', '', err) then
    begin
//      if Assigned(FLog) then
//        LogError(Format('Erro ao conectar %s', [err]));
      Exit;
    end;

    FlogValues := NewClientOOP('select cast('' '' as varchar(31)) field, cast('' '' as blob sub_type 1 segment size 64) data from rdb$database where 1=0');
    FlogValues.DataSet.Close;
    FlogValues.DataSet.FieldDefs.Clear;
    FlogValues.DataSet.FieldDefs.Add('field', ftString, 31);
    FlogValues.DataSet.FieldDefs.Add('data', ftMemo, 0);
    FlogValues.DataSet.CreateDataSet;

    FlogValues.DataSet.FieldByName('data').OnGetText := FieldMemoDGetText;
    query := NewClientOOP();
    FseqValues := NewClientOOP();
  end;

  var str := IfThen(Fterminais <> '', 'and lm.source in (' + Fterminais + ')');

  var strL := '';
  for var l in Flevel do
    strL := strL +  IfThen(strL <> '', ',') + Ord(l).ToString();

  str := str + IfThen(strL <> '', ' and lm.level_ in (' + strL + ')');

  var strD := '';
  for var d in Fdirection do
    strD := strD +  IfThen(strD <> '', ',') + Ord(d).ToString();

  str := str + IfThen(strD <> '', ' and lm.direction in (' + strD + ')');

  Client.DataSet.AfterScroll := nil;
  Client.Open('select lm.*,' +
              ' (select count(lv.log_id) from logmessage_values lv where lv.log_id = lm.id) qtde' +
              ' from logmessage lm' +
              ' where lm.cnpj = ''%s''' +
              ' %s' +
              ' and lm.createdat >= %s and lm.createdat <= %s' +
              ' order by lm.seq desc', [cnpj, str, datet_fb(FdateStart), datet_fb(FdateEnds)]);
  Client.DataSet.FieldByName('text').OnGetText := FieldMemoDGetText;
  Client.DataSet.FieldByName('direction').OnGetText := FieldEnumGetText;
  Client.DataSet.FieldByName('direction').Alignment := taLeftJustify;
  Client.DataSet.FieldByName('level_').OnGetText := FieldEnumGetText;
  Client.DataSet.FieldByName('level_').Alignment := taLeftJustify;

  HandleValues;
  Client.DataSet.AfterScroll := AfterScroll;

end;

procedure TLogViewDetail.SeqAfterScroll(DataSet: TDataSet);
begin
  HandleValuesData;
end;

procedure TLogViewDetail.SeqDataAfterScroll(DataSet: TDataSet);
begin
  if Assigned(FAfterLogValueData) then
    FAfterLogValueData(FlogValues.fstr('data'));
end;

{ TLogViewBase }

procedure TLogViewBase.FieldMemoDGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := Sender.AsString;//.Substring(0,255);
end;

end.
