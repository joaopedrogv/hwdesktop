unit uServiceTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type  
  TConfiguracoes = record
    CodEmpresa: Integer;
    Token, EnderecoBancoDeDados: string;
    ServidorDeEnvioNFCe, ServidorDeEnvioSAT, ServidorDeImpressao: Boolean;
    ThreadsAtivasNFCe, ThreadsAtivasSAT: Smallint;
  end;

  TfrmNFCTest = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn16: TBitBtn;
    Timer1: TTimer;
    GroupBox3: TGroupBox;
    BitBtn4: TBitBtn;
    BitBtn17: TBitBtn;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
  private
    { Private declarations }
    Conf: TConfiguracoes;
    FAutoPlay    : Boolean;
    FLoopInterval: Integer;
    FtokenUs: string;
    procedure lerConfig;
    procedure AbreFormConfig;
    procedure AbreFormConfigPosPrinter;
    procedure SalvarLog(Log: string);
    procedure SalvarConfig(FileName, Section, Ident, Value: string);
  public
    { Public declarations }
    
  end;

var
  frmNFCTest: TfrmNFCTest;

implementation

uses IniFiles, uServiceConfig, uServiceConfPosPrinter, StrUtils;

function nfce_client_free: Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_retorna_ultimo_erro: WideString; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_autorizar(ArrayNFCE: array of Integer; CodigoEmpresa: Longint; token, Adicional: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_enviar(CodigoNFCE, CodigoEmpresa: Longint; token, Adicional: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_cancelar(CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_inutilizar(CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_enviar_email(CodigoNFCE, CodigoEmpresa: Longint; token, Adicional: WideString; UsarServidor: Boolean): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_enviar_email_lote(ArrayNFCE: array of Integer; CodigoEmpresa: Longint; token, Email: WideString; UsarServidor: Boolean): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_gerar_contingencia(CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_imprimir_danfe(CodigoNFCE, CodigoEmpresa, TpImp: Longint; token, Adicional: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_client_imprimir_inutilizacao(CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';

function nfce_serv_free: Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_serv_retorna_ultimo_erro: WideString; stdcall; external 'hw.nfe.dx.dll';
function nfce_serv_requisicoes_ativas_nfce: Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_serv_requisicoes_ativas_impressao: Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_serv_verificar_central_acoes_thread(CodigoEmpresa: Longint; token: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';
function nfce_serv_verificar_central_acoes_no_thread(CodigoEmpresa: Longint; token: WideString): Longint; stdcall; external 'hw.nfe.dx.dll';

{$R *.dfm}

procedure TfrmNFCTest.AbreFormConfig;
begin
  Application.CreateForm(TfrmConfServicoNFC, frmConfServicoNFC);
  frmConfServicoNFC.ShowModal;
end;

procedure TfrmNFCTest.AbreFormConfigPosPrinter;
begin
  Application.CreateForm(TfrmConfPosPrinterServiceNFC, frmConfPosPrinterServiceNFC);
  frmConfPosPrinterServiceNFC.ShowModal;
end;

procedure TfrmNFCTest.BitBtn10Click(Sender: TObject);
var
  Retorno: Integer;
  UltimoErro: string;
  CodigoNF, CodigoEmp: Integer;
  ArrayInt : array of Integer;
  ArrayStr : array of string;
  IntID: Integer;
  tmp, TokenUS: string;
  email: string;
begin
  tmp := '0';
  SetLength(ArrayStr, 6);
  ArrayStr[0] := '0';
  ArrayStr[1] := '1';
  ArrayStr[2] := 'joaopedrogv@gmail.com';
  ArrayStr[3] := 'S';
  ArrayStr[4] := 'S';
  ArrayStr[5] := '5092032899992070';

  if not InputQuery('Envido de email', ['Cod NFs separadas por virgula', 'Empresa', 'Email', 'UsarServidor', 'AnexarPDF', 'Token'],
      ArrayStr) then
    Exit;

  CodigoNF  := StrToIntDef(ArrayStr[0], 0);
  CodigoEmp := StrToIntDef(ArrayStr[1], 0);
  email     := ArrayStr[2];
  TokenUS   := ArrayStr[5];

  SetLength(ArrayInt, 0);
  for tmp in ArrayStr[0].Split([',']) do
    if TryStrToInt(tmp, IntID) then
      if (IntID > 0) and (IntID <> CodigoNF) then
      begin
        SetLength(ArrayInt, Length(ArrayInt) + 1);
        ArrayInt[High(ArrayInt)] := IntID;
      end;
  email := IfThen(not ArrayStr[4].Equals('S'), '*') + email; //* no inicio do email vai inibir o anexo do pdf
  if Length(ArrayInt) > 0 then
    Retorno := nfce_client_enviar_email_lote(ArrayInt, CodigoEmp, WideString(TokenUS), WideString(email), ArrayStr[3].Equals('S'))
  else
    Retorno := nfce_client_enviar_email(CodigoNF, CodigoEmp, WideString(TokenUS), WideString(email), ArrayStr[3].Equals('S'));

  UltimoErro := string(nfce_client_retorna_ultimo_erro);
  SalvarLog('Email NFCe ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));
end;

procedure TfrmNFCTest.BitBtn11Click(Sender: TObject);
begin
  nfce_client_free;
end;

procedure TfrmNFCTest.BitBtn12Click(Sender: TObject);
begin
  if Timer1.Enabled then
  begin
    FAutoPlay := False;
    Timer1.Enabled := False;
    BitBtn12.Caption := 'Loop Central Acoes = off';
  end
  else
  begin
    lerConfig;
    FAutoPlay := True;
    Timer1.Interval := FLoopInterval;
    Timer1.Enabled := True;
    BitBtn12.Caption := 'Loop Central Acoes = on';
  end;
end;

procedure TfrmNFCTest.BitBtn13Click(Sender: TObject);
begin
  AbreFormConfigPosPrinter;
end;

procedure TfrmNFCTest.BitBtn14Click(Sender: TObject);
var
  Retorno: Integer;
  UltimoErro: string;
begin
  Retorno := nfce_serv_requisicoes_ativas_impressao;
  UltimoErro := string(nfce_serv_retorna_ultimo_erro);
  SalvarLog('Impressao requisicoes Ativas ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));
end;

procedure TfrmNFCTest.BitBtn16Click(Sender: TObject);
begin
  nfce_serv_free;
end;

procedure TfrmNFCTest.BitBtn17Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmNFCTest.BitBtn1Click(Sender: TObject);
begin
  AbreFormConfig;
  lerConfig;
  SalvarLog('Config CodEmpresa                 = ' + IntToStr(Conf.CodEmpresa));
  SalvarLog('Config Token                      = ' + Trim(Conf.Token));
  SalvarLog('Config Banco de Dados             = ' + Trim(Conf.EnderecoBancoDeDados));
//  SalvarLog('Config Servidor de Envio de NFC-e = ' + BoolToStr(Conf.ServidorDeEnvioNFCe));
//  SalvarLog('Config Servidor de Envio de SAT   = ' + BoolToStr(Conf.ServidorDeEnvioSAT));
//  SalvarLog('Config Servidor de Impressao      = ' + BoolToStr(Conf.ServidorDeImpressao));
end;

procedure TfrmNFCTest.BitBtn2Click(Sender: TObject);
var
  Retorno: Integer;
  UltimoErro: string;
begin
  Retorno := nfce_serv_requisicoes_ativas_nfce;
  UltimoErro := string(nfce_serv_retorna_ultimo_erro);
  SalvarLog('NFCe requisicoes Ativas ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));
end;

procedure TfrmNFCTest.BitBtn3Click(Sender: TObject);
var
  Retorno: Integer;
  UltimoErro: string;
begin
  Retorno := nfce_serv_verificar_central_acoes_thread(Conf.CodEmpresa, WideString(Conf.Token));
  UltimoErro := string(nfce_serv_retorna_ultimo_erro);
  SalvarLog('Central de Acoes    Thread ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));

  Retorno := nfce_serv_verificar_central_acoes_no_thread(Conf.CodEmpresa, WideString(Conf.Token));
  UltimoErro := string(nfce_serv_retorna_ultimo_erro);
  SalvarLog('Central de Acoes No Thread ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));
end;

procedure TfrmNFCTest.BitBtn4Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TfrmNFCTest.BitBtn5Click(Sender: TObject);
var
  Retorno: Integer;
  UltimoErro: string;
  CodigoNF, CodigoEmp: Integer;
  ArrayInt : array of Integer;
  ArrayStr : array of string;
  IntID: Integer;
  tmp, TokenUS: string;
  email: string;
begin
  tmp := '0';
  SetLength(ArrayStr, 6);
  ArrayStr[0] := '0';
  ArrayStr[1] := '1';
  ArrayStr[2] := 'joaopedrogv@gmail.com';
  ArrayStr[3] := 'N';
  ArrayStr[4] := 'N';
  ArrayStr[5] := '62E43A5C9999';

  if not InputQuery('Envido NFCe', ['Cod NFs separadas por virgula', 'Empresa', 'Email', 'UsarServidor', 'AnexarPDF', 'Token'],
      ArrayStr) then
    Exit;

  CodigoNF  := StrToIntDef(ArrayStr[0], 0);
  CodigoEmp := StrToIntDef(ArrayStr[1], 0);
  email     := ArrayStr[2];
  TokenUS   := ArrayStr[5];

  SetLength(ArrayInt, 0);
  for tmp in ArrayStr[0].Split([',']) do
    if TryStrToInt(tmp, IntID) then
      if (IntID > 0) and (IntID <> CodigoNF) then
      begin
        SetLength(ArrayInt, Length(ArrayInt) + 1);
        ArrayInt[High(ArrayInt)] := IntID;
      end;
  email := IfThen(not ArrayStr[4].Equals('S'), '*') + email; //* no inicio do email vai inibir o anexo do pdf
  if Length(ArrayInt) > 0 then
    Retorno := nfce_client_autorizar(ArrayInt, CodigoEmp, WideString(TokenUS), WideString(email))
  else
    Retorno := nfce_client_enviar(CodigoNF, CodigoEmp, WideString(TokenUS), WideString(email));

  UltimoErro := string(nfce_client_retorna_ultimo_erro);
  SalvarLog('Autorizacao NFCe ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));
end;

procedure TfrmNFCTest.BitBtn6Click(Sender: TObject);
var
  Retorno: Integer;
  UltimoErro: string;
  CodigoNF, CodigoEmp: Integer;
  tmp: string;
  tpImp: string;
  Adicional: string;
begin
  tmp := '0';
  if not InputQuery('NF', 'Codigo', tmp) then
    Exit;
  CodigoNF := StrToIntDef(tmp, 0);
  tmp := '1';
  if not InputQuery('Empresa', 'Codigo', tmp) then
    Exit;
  CodigoEmp := StrToIntDef(tmp, 0);
  Adicional := '|viacanc|viacon|viaest|res|';
  if not InputQuery('Adicional', 'Codigo', Adicional) then
    Exit;

    if MessageDlg('Inutilização?', mtConfirmation, [mbYes, mbNo], 0) = IDNO then
    begin
      tpImp := '4';
      if not InputQuery('Tipo de Impressão?', '1: Térmica NF; 4: Normal; 6: Normal A4', tpImp) then
        Exit;

      if (not tpImp.Equals('1')) and (not tpImp.Equals('4')) and (not tpImp.Equals('6')) then
        Exit;

      Retorno := nfce_client_imprimir_danfe(CodigoNF, CodigoEmp, StrToInt(tpImp), WideString(FtokenUs), WideString(Adicional));
    end
    else
      Retorno := nfce_client_imprimir_inutilizacao(CodigoNF, CodigoEmp, WideString(FtokenUs));

  UltimoErro := string(nfce_client_retorna_ultimo_erro);
  SalvarLog('Imprimir NFCe ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));
end;

procedure TfrmNFCTest.BitBtn7Click(Sender: TObject);
var
  Retorno: Integer;
  UltimoErro: string;
  CodigoNF, CodigoEmp: Integer;
  tmp: string;
begin
  tmp := '0';
  if not InputQuery('NF', 'Codigo', tmp) then
    Exit;
  CodigoNF := StrToIntDef(tmp, 0);
  tmp := '1';
  if not InputQuery('Empresa', 'Codigo', tmp) then
    Exit;
  CodigoEmp := StrToIntDef(tmp, 0);

  Retorno := nfce_client_cancelar(CodigoNF, CodigoEmp, WideString(FtokenUs));
  UltimoErro := string(nfce_client_retorna_ultimo_erro);
  SalvarLog('Cancelar NFCe ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));
end;

procedure TfrmNFCTest.BitBtn8Click(Sender: TObject);
var
  Retorno: Integer;
  UltimoErro: string;
  CodigoNF, CodigoEmp: Integer;
  tmp: string;
begin
  tmp := '0';
  if not InputQuery('NF', 'Codigo', tmp) then
    Exit;
  CodigoNF := StrToIntDef(tmp, 0);
  tmp := '1';
  if not InputQuery('Empresa', 'Codigo', tmp) then
    Exit;
  CodigoEmp := StrToIntDef(tmp, 0);

  Retorno := nfce_client_gerar_contingencia(CodigoNF, CodigoEmp, WideString(FtokenUs));
  UltimoErro := string(nfce_client_retorna_ultimo_erro);
  SalvarLog('Gerar Contingencia Num NFCe ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));
end;

procedure TfrmNFCTest.BitBtn9Click(Sender: TObject);
var
  Retorno: Integer;
  UltimoErro: string;
  CodigoNF, CodigoEmp: Integer;
  tmp: string;
begin
  tmp := '0';
  if not InputQuery('NF', 'Codigo', tmp) then
    Exit;
  CodigoNF := StrToIntDef(tmp, 0);
  tmp := '1';
  if not InputQuery('Empresa', 'Codigo', tmp) then
    Exit;
  CodigoEmp := StrToIntDef(tmp, 0);

  Retorno := nfce_client_inutilizar(CodigoNF, CodigoEmp, WideString(FtokenUs));
  UltimoErro := string(nfce_client_retorna_ultimo_erro);
  SalvarLog('Inutilizar NFCe ' + IntToStr(Retorno));
  if Trim(UltimoErro) <> '' then
    SalvarLog('Ultimo erro: ' + Trim(UltimoErro));
end;

procedure TfrmNFCTest.Edit1Exit(Sender: TObject);
begin
  FtokenUs := Edit1.Text;
end;

procedure TfrmNFCTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FAutoPlay then
    SalvarConfig('HWNFC', 'HWNFC', 'AutoPlay'    , '1')
  else
    SalvarConfig('HWNFC', 'HWNFC', 'AutoPlay'    , '0');
  SalvarConfig(  'HWNFC', 'HWNFC', 'LoopInterval', IntToStr(FLoopInterval));
end;

procedure TfrmNFCTest.FormShow(Sender: TObject);
begin
  FtokenUs := Edit1.Text;
  Memo1.Lines.Clear;
  lerConfig;
  SalvarLog('Config CodEmpresa                 = ' + IntToStr(Conf.CodEmpresa));
  SalvarLog('Config Token                      = ' + Trim(Conf.Token));
  SalvarLog('Config Banco de Dados             = ' + Trim(Conf.EnderecoBancoDeDados));
//  SalvarLog('Config Servidor de Envio de NFC-e = ' + BoolToStr(Conf.ServidorDeEnvioNFCe));
//  SalvarLog('Config Servidor de Envio de SAT   = ' + BoolToStr(Conf.ServidorDeEnvioSAT));
//  SalvarLog('Config Servidor de Impressao      = ' + BoolToStr(Conf.ServidorDeImpressao));
  if FAutoPlay then
    BitBtn12.Click;


  if (ParamCount > 0) then
  begin
    BitBtn2.Visible  := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn3.Visible  := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn5.Visible  := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn6.Visible  := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn7.Visible  := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn8.Visible  := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn9.Visible  := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn10.Visible := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn11.Visible := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn12.Visible := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn14.Visible := ParamStr(1).ToUpper.Equals('GUI');
    BitBtn16.Visible := ParamStr(1).ToUpper.Equals('GUI');
  end;
end;

procedure TfrmNFCTest.lerConfig;
var
  Arquivo: TIniFile;
  NomeArquivo: string;
begin
  try
    NomeArquivo := ExtractFilePath(ParamStr(0)) + 'HWNFC.ini';
    Arquivo := TIniFile.Create(NomeArquivo);
    try
      Conf.CodEmpresa          := Arquivo.ReadInteger('HWNFC', 'Empresa'          , 0);
      Conf.Token               := Arquivo.ReadString( 'HWNFC', 'Token'            , '');
//      Conf.ServidorDeEnvioNFCe := Arquivo.ReadBool(   'HWNFC', 'ServidorEnvioNFCe', False);
//      Conf.ServidorDeEnvioSAT  := Arquivo.ReadBool(   'HWNFC', 'ServidorEnvioSAT' , False);
//      Conf.ServidorDeImpressao := Arquivo.ReadBool(   'HWNFC', 'ServidorImpressao', False);
      Conf.ThreadsAtivasNFCe   := Arquivo.ReadInteger('HWNFC', 'ThreadsNFCe'      , 10);
      Conf.ThreadsAtivasSAT    := Arquivo.ReadInteger('HWNFC', 'ThreadsSAT'       , 10);
      FAutoPlay                := Arquivo.ReadBool(   'HWNFC', 'AutoPlay'         , False);
      FLoopInterval            := Arquivo.ReadInteger('HWNFC', 'LoopInterval'     , 1000);
    finally
      Arquivo.Free;
    end;

    NomeArquivo := ExtractFilePath(ParamStr(0)) + 'hwsistemas.ini';
    if not FileExists(NomeArquivo) then
      NomeArquivo := ExtractFilePath(ParamStr(0)) + 'Config.ini';
    Arquivo := TIniFile.Create(NomeArquivo);
    try
      Conf.EnderecoBancoDeDados := Arquivo.ReadString( 'Banco', 'HW', '');
    finally
      Arquivo.Free;
    end;
  except
  end;
end;

procedure TfrmNFCTest.SalvarConfig(FileName, Section, Ident, Value: string);
var
  Arquivo: TIniFile;
  NomeArquivo: string;
begin
  try
    NomeArquivo := ExtractFilePath(ParamStr(0)) + FileName + '.ini';
    Arquivo := TIniFile.Create(NomeArquivo);
    try
      Arquivo.WriteString(Section, Ident, Value);
    finally
      Arquivo.Free;
    end;
  except
  end;
end;

procedure TfrmNFCTest.SalvarLog(Log: string);
begin
  Memo1.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + Log);
end;

procedure TfrmNFCTest.Timer1Timer(Sender: TObject);
begin
  try
    Timer1.Enabled := False;

    BitBtn3.Click;
  finally
    Timer1.Enabled := True;
  end;
end;

end.
