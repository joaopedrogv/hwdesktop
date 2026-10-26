unit Form.NbackupHw;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, uScript;

type
  TFormNbackupHw = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    gbHistory: TGroupBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    ck_cons_level_0: TCheckBox;
    ck_cons_level_1: TCheckBox;
    ck_cons_level_2: TCheckBox;
    ck_cons_level_3: TCheckBox;
    ed_data: TMaskEdit;
    Label1: TLabel;
    bt_consulta: TBitBtn;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    Memo1: TMemo;
    GroupBox3: TGroupBox;
    Panel6: TPanel;
    Panel5: TPanel;
    BitBtn3: TBitBtn;
    Panel7: TPanel;
    Panel8: TPanel;
    BitBtn4: TBitBtn;
    rb_cons_level_0: TRadioButton;
    rb_cons_level_1: TRadioButton;
    rb_cons_level_2: TRadioButton;
    rb_cons_level_3: TRadioButton;
    SpeedButton1: TSpeedButton;
    BitBtn5: TBitBtn;
    bt_log: TSpeedButton;
    gbLog: TGroupBox;
    ed_log: TMemo;
    procedure BitBtn4Click(Sender: TObject);
    procedure bt_consultaClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure bt_logClick(Sender: TObject);
  private
    Fnbackup: THw_NBACKUP;
    { Private declarations }

  public
    { Public declarations }
    property nbackup: THw_NBACKUP read Fnbackup write Fnbackup;
  end;

var
  FormNbackupHw: TFormNbackupHw;

implementation

{$R *.dfm}

uses
  System.StrUtils,
  Vcl.Clipbrd,
  hw_utils,
  config_sistema_class;

procedure TFormNbackupHw.bt_consultaClick(Sender: TObject);
var
  level: string;
begin
  level := IfThen(ck_cons_level_0.Checked, '0,') +
           IfThen(ck_cons_level_1.Checked, '1,') +
           IfThen(ck_cons_level_2.Checked, '2,') +
           IfThen(ck_cons_level_3.Checked, '3,');

  level := IfThen(level.Trim.IsEmpty, '0,1,2,3', level.Substring(0, level.LastIndexOf(',')));

  Screen.Cursor := crHourGlass;
  try
    nbackup.GetHistoryData(StrToDateDef(ed_data.Text, Date) + EncodeTime(23, 59, 59, 900), level);
  finally
    Screen.Cursor := crDefault;
  end;

  DBGrid1.DataSource := nbackup.Client.DataSourceOOP;
end;

procedure TFormNbackupHw.bt_logClick(Sender: TObject);
begin
  gbLog.Align       := alClient;
  gbHistory.Visible := not gbHistory.Visible;
  gbLog.Visible     := not gbHistory.Visible;

  Screen.Cursor := crHourGlass;
  try
    if gbLog.Visible and (ed_log.Lines.Count = 0) then
      with TCfg_sis.getConf('hw_nbackup_last_exec', nbackup.QrAux, 0) do
      begin
        ed_log.Lines.Text := value1_b.Text;
        Free;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFormNbackupHw.BitBtn2Click(Sender: TObject);
begin
  Clipboard.AsText := Memo1.Lines.Text;
end;

procedure TFormNbackupHw.BitBtn3Click(Sender: TObject);
var
  cmd: string;
begin
  cmd := IfThen(rb_cons_level_0.Checked, '0') +
         IfThen(rb_cons_level_1.Checked, '1') +
         IfThen(rb_cons_level_2.Checked, '2') +
         IfThen(rb_cons_level_3.Checked, '3');

  if cmd.IsEmpty then
  begin
    ShowAtencao('Selecione um level para o backup');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
    nbackup.Executar('', '-force' + cmd);
    ed_log.Lines.Clear;
  finally
    Screen.Cursor := crDefault;
  end;
  bt_consulta.Click;
end;

procedure TFormNbackupHw.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TFormNbackupHw.BitBtn5Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    nbackup.Executar('', '');
  finally
    Screen.Cursor := crDefault;
  end;
  bt_consulta.Click;
end;

procedure TFormNbackupHw.SpeedButton1Click(Sender: TObject);
begin
  if ShowConfirmacao('Deseja registrar "NBackup Hwauto" no agendador de tarefas do Windows?') <> IDYES then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    nbackup.Executar('', '-taskschedule');
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
