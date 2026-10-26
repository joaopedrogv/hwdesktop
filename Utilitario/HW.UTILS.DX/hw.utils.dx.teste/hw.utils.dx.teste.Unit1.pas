unit hw.utils.dx.teste.Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.StdCtrls, Vcl.Buttons,
  REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.TabNotBk, Vcl.ExtCtrls,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  REST.Types, Vcl.Mask;

type

  {TRegistros_Estatisticas = class
  private
    FDescricao: string;
    FQuantidade: Integer;
    FData: TDateTime;
    procedure SetData(const Value: TDateTime);
    procedure SetDescricao(const Value: string);
    procedure SetQuantidade(const Value: Integer);
  public
    property Data: TDateTime read FData write SetData;
    property Descricao: string read FDescricao write SetDescricao;
    property Quantidade: Integer read FQuantidade write SetQuantidade;
  end;}

  TThreadProcessamentoSegundoPlano = class(TThread)
  private
    FSleepTime: Integer;
    Ftoken: string;
    FthreadNumber: string;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    property SleepTime: Integer read FSleepTime write FSleepTime;
    property threadNumber: string read FthreadNumber write FthreadNumber;
  end;

  TForm1 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    NetHTTPClient1: TNetHTTPClient;
    NetHTTPRequest1: TNetHTTPRequest;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MemoContent: TMemo;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Memo1: TMemo;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    FileOpenDialog1: TFileOpenDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn10: TBitBtn;
    ed_db: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ed_params: TComboBox;
    BitBtn11: TBitBtn;
    MaskEdit1: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
  private
    { Private declarations }
    FToken: string;
  public
    { Public declarations }
    procedure LogMemo(AString: string);
  end;

var
  Form1: TForm1;

implementation

uses
  System.JSON, hw.utils.dx.teste.Unit2, System.DateUtils;

function hw_enviar_estatisticas( Banco, Usuario, Senha: WideString; CodEmpresa: Integer): Integer; stdcall; external 'hw.utils.dx.dll';
function hw_ibpt_produtos_get( Banco, Usuario, Senha: WideString; CodEmpresa: Integer;
  cnpj, ncm, uf: WideString; ex: Integer): Integer; stdcall; external 'hw.utils.dx.dll';
function hw_central_suporte( AEmail, AColaborador, ACnpj, AToken: WideString): WideString; stdcall; external 'hw.utils.dx.dll';
function hw_central_suporte_notificar_abrir( AEmail, AColaborador, ACnpj, AToken: WideString): WideString; stdcall; external 'hw.utils.dx.dll';

procedure hw_nbackup(banco: WideString; params: WideString); stdcall; external 'hw.utils.dx.dll';
function hw_cep_consultar(banco, cep: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';
function hw_utils_lasterror(): Widestring; stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TForm1.BitBtn10Click(Sender: TObject);
begin
  hw_nbackup(ed_db.Text, ed_params.Text);
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
  if not hw_cep_consultar('joaopedro-pc:D:\Hw\bases\producao\Hwauto.fdb', MaskEdit1.Text) then
    MemoContent.Lines.Add(hw_utils_lasterror);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  jValue: TJSONValue;
begin
  RESTRequest1.Execute;
  jValue:=RESTResponse1.JSONValue;
  MemoContent.Text:= jValue.ToString;
  RESTResponseDataSetAdapter1.UpdateDataSet;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
  ValueT: TDateTime;
  TimeZone: TTimeZoneInformation;
  formatDT: TFormatSettings;
  strDate: string;
  dia, mes, ano: Cardinal;
begin
  GetTimeZoneInformation(TimeZone);
  ValueT := Now;
  BitBtn3.Caption :=
  FormatDateTime('YYYY"-"MM"-"DD"T"hh":"mm":"ss"-"' +
    FormatFloat('00', TimeZone.Bias div 60) + ':00'
    , ValueT
  );

  formatDT.DateSeparator := '-';
  formatDT.TimeSeparator := ':';
  formatDT.ShortDateFormat := 'YYYY-MM-DD';
  formatDT.ShortTimeFormat := 'hh:nn:ss';

  strDate := BitBtn3.Caption;



  strDate := Copy(strDate, 1, 19);
  strDate := StringReplace(strDate, 'T', ' ', []);
  ValueT := StrToDateTime(strDate, formatDT);

  ShowMessage(
    'Dia: ' + DayOf(ValueT).ToString +
    'Mes: ' + MonthOf(ValueT).ToString +
    'Ano: ' + YearOf(ValueT).ToString    +
    'Hora: ' + HourOf(ValueT).ToString +
    'Minutos' + MinuteOf(ValueT).ToString   +
    'Segundos: ' + SecondOf(ValueT).ToString
  );


  ShowMessage(DateToStr(StrToDateTimeDef(BitBtn3.Caption, date - 30)));

//'2017-02-03T16:53:55+02:00';

end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  str1, str2, str3: string;
  str: array of string;
begin
  ShowMessage('low ' + IntToStr(Low(str)) + ' High ' + IntToStr(High(str)) );
  SetLength(str, 3);
  InputQuery('caption', ['1', #1'2', '3'], str);
  ShowMessage(str[0] + str[1] + str[2]);
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var
  str: array of string;
begin
  SetLength(str, 4);
  str[0] := 'Odilon@ciale.com.br';
  str[1] := 'Odilon';
  str[2] := '20465851000117';
//  str[0] := 'niniparafusos@gmail.com';
//  str[1] := 'Nini';
//  str[2] := '64224942000136';
  str[3] := '';

  if not InputQuery('Chat', ['email', 'Nome Usuario', 'CNPJ', 'Access Token'], str) then
    exit;

  FToken := hw_central_suporte(str[0], str[1], str[2], Memo1.Lines.Text);
  Memo1.Lines.Text := FToken;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
var
  str: array of string;
begin
  SetLength(str, 4);
  str[0] := 'Odilon@ciale.com.br';
  str[1] := 'Odilon';
  str[2] := '20465851000117';
  str[3] := '';

  if not InputQuery('Chat', ['email', 'Nome Usuario', 'CNPJ', 'Access Token'], str) then
    exit;

  Memo1.Lines.Text := hw_central_suporte_notificar_abrir(str[0], str[1], str[2], Memo1.Lines.Text);
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
var
  I: Integer;
  Athread: TThreadProcessamentoSegundoPlano;
begin
  for I := 5 downto 1 do
  begin
    Athread := TThreadProcessamentoSegundoPlano.Create(True);
    Athread.FSleepTime := Athread.FSleepTime + 1000;
    Athread.threadNumber := I.ToString;
    Athread.Resume;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  retorno: integer;
begin
  retorno := hw_enviar_estatisticas('192.168.254.5:D:\Hw\bases\producao\Hwauto.fdb', 'sysdba', 'masterkey', 1);
  Button1.Caption := 'EnviSTS' + IntToStr(retorno);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  retorno: integer;
begin
//  retorno := hw_ibpt_produtos_get('192.168.25.5:D:\Hw\bases\producao\Hwauto.fdb', 'sysdba', 'masterkey', 1,
//    '03530705000109', ComboBox1.Text, ComboBox2.Text, 0);

  retorno := hw_ibpt_produtos_get('192.168.254.5:D:\Hw\bases\producao\Hwauto.fdb', 'sysdba', 'masterkey', 1,
    '03530705000109', ComboBox1.Text, ComboBox2.Text, 0);

  Button1.Caption := 'IBPT' + IntToStr(retorno);

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Randomize;
  ComboBox1.ItemIndex := Random(ComboBox1.Items.Count);
  ComboBox2.ItemIndex := Random(ComboBox2.Items.Count);
end;

procedure TForm1.LogMemo(AString: string);
begin
  MemoContent.Lines.Add( FormatDateTime('dd/MM/YYYY hh:mm:ss', Now) + AString);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if FileOpenDialog1.Execute then
    ShowMessage(FileOpenDialog1.FileName);
end;

{ TThreadProcessamentoSegundoPlano }

constructor TThreadProcessamentoSegundoPlano.Create(CreateSuspended: Boolean);
begin
  inherited Create (CreateSuspended);
  Self.FreeOnTerminate := False;
  Self.Priority := tpLower;
  FSleepTime := 1000;
end;

procedure TThreadProcessamentoSegundoPlano.Execute;
var
  ALog: string;
begin
  inherited;
  Sleep(FSleepTime);
  if FSleepTime > 0 then
  begin
    while (not Self.Terminated) do
    begin
      try
        //Ftoken := hw_central_suporte_notificar('Odilon@ciale.com.br', 'Odilon', '20465851000117', Ftoken);
        //Ftoken := hw_central_suporte_notificar('rafaela@angequipamentos.com.br', 'Rafaela', '18330373000196', Ftoken);

      except
      end;
      Sleep(FSleepTime);
    end;
  end;
end;

end.
