unit uDtmEntrada;

interface

uses
  SysUtils, Classes, IniFiles, IBQuery, IBStoredProc,
  IBDatabase, DB, DBClient, IBCustomDataSet, Provider, uClasseEntrada, uDadosIni;

type
  TdtmEnt = class(TDataModule)
    cdsSenha: TClientDataSet;
    cdsEmpresa: TClientDataSet;
    qrEmpresa: TIBQuery;
    qrSenha: TIBQuery;
    transacaoTemp: TIBTransaction;
    SpIncCodigo: TIBStoredProc;
    qrBuscas: TIBQuery;
    dspEmpresa: TDataSetProvider;
    dsEmpresa: TDataSource;
    dspSenha: TDataSetProvider;
    dsSenha: TDataSource;
    bancoTemp: TIBDatabase;
    transacaoHw: TIBTransaction;
    cdsEmpDes: TClientDataSet;
    qrEmpDes: TIBQuery;
    dspEmpDes: TDataSetProvider;
    cdsEmpDesCOD_EMPDES: TIntegerField;
    cdsEmpDesNOME_EMPDES: TStringField;
    cdsEmpDesCNPJ_EMPDES: TStringField;
    cdsEmpDesCODIGO_UF: TIntegerField;
    cdsEmpDesIE_EMPDES: TStringField;
    cdsEmpDesIM_EMPDES: TStringField;
    cdsEmpDesDATA_CAD_EMPDES: TDateTimeField;
    cdsEmpDesDATA_MOD_EMPDES: TDateTimeField;
    cdsEmpDesATIVO: TIntegerField;
    cdsEmpDesENDERECO_EMPDES: TStringField;
    cdsEmpDesBAIRRO_EMPDES: TStringField;
    cdsEmpDesCIDADE_EMPDES: TStringField;
    cdsEmpDesFONE_EMPDES: TStringField;
    cdsEmpDesCONTATO_EMPDES: TStringField;
    cdsEmpDesUF_EMPDES: TStringField;
    cdsEmpDesSITE: TStringField;
    qrTemp: TIBQuery;
    transacaoEmpDes: TIBTransaction;
    cdsSenhaCODIGO: TIntegerField;
    cdsSenhaDEPART: TStringField;
    cdsSenhaUSUARIO: TStringField;
    cdsSenhaSENHA: TStringField;
    cdsSenhaCOD_EMPRESA: TIntegerField;
    cdsSenhaNIVEL_US: TIntegerField;
    cdsSenhaALT_IMP: TStringField;
    cdsSenhaIMP_US: TStringField;
    cdsSenhaESTOQ_NEG: TStringField;
    cdsSenhaNOME_EMP: TStringField;
    cdsSenhaCGC_EMP: TStringField;
    cdsEmpresaCOD_EMPRESA: TIntegerField;
    cdsEmpresaNOME_EMP: TStringField;
    cdsSenhaEXIBIR_MENSAGEM_CONSORCIO: TStringField;
    cdsSenhaNOME_VENDEDOR: TStringField;
    cdsSenhaDESC_FUNCAO: TStringField;
    cdsSenhaEMAIL: TStringField;
    cdsSenhaCOD_PERFIL_HORAS_TRAB: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsSenhaBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure mudaSelect(DataSet: TClientDataSet);
    function criaDtm: boolean;
    procedure verificaEstruturaHwfdb;
    procedure verificaEstruturaFiscalfdb;
    procedure verificaEstruturaHwFfdb;
  public
    { Public declarations }
    function verificaEntrada: boolean;
    procedure verificaEstruturaBancoDeDados;
  end;

function GetOrCreateGlobaUser(): TUsuario;

var
  dtmEnt: TdtmEnt;

implementation

uses Forms, Dialogs, ShellAPI, Windows, USenha, ComCtrls, USplash, Controls, udtmAtivo, hw_utils;

function __getSenhaFDB: PChar; stdcall; external 'cons40.dll';
function __getUsuarioFDB: PChar; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';

{$R *.dfm}

var
  FobUser: TUsuario;

function GetOrCreateGlobaUser(): TUsuario;
begin
  if not Assigned(FobUser) then
    FobUser := TUsuario.Create;

  Result := FobUser;
end;

procedure LiberarDTM;
begin
  if Assigned(FobUser) then
    FreeAndNil(FobUser);

  if Assigned(dtmEnt) then
    FreeAndNil(dtmEnt);
end;

exports
  LiberarDTM;

procedure TdtmEnt.cdsSenhaBeforeOpen(DataSet: TDataSet);
begin
  mudaSelect(TClientDataSet(DataSet));
end;

function TdtmEnt.criaDtm: boolean;
begin
  vDadosIni.LerConfigini;
  try
    if vDadosIni.vSistema <> 'Fiscal' then
      result := vDadosIni.conectaBanco(dtmAtivo.bancoHw,vDadosIni.vBancoHw,true);
  except
    MessageDlg('A base de dados Hw.fdb não se encontra no caminho especificado:'
      + #13 + vDadosIni.GetBaseDados('Banco', 'HW'), mtInformation, [mbOK], 0);
    Result := false;
      Abort;
  end;
end;

procedure TdtmEnt.DataModuleCreate(Sender: TObject);
begin
  try
    //vDadosIni := TSingleton.GetInstance;
    criaDtm;
    if vDadosIni.vSistema = 'Fiscal' then
    begin
      transacaoEmpDes.DefaultDatabase := dtmAtivo.bancoFiscal;
      qrEmpDes.Database := dtmAtivo.bancoFiscal;                  
    end;
  except
  end;
end;

procedure TdtmEnt.mudaSelect(DataSet: TClientDataSet);
var
  i: integer;
begin
  if DataSet.CommandText <> '' then
  begin
    for I := 0 to dtmEnt.ComponentCount - 1 do
    begin
      if (dtmEnt.Components[i] is TDataSetProvider) then
        if UpperCase(TDataSetProvider(dtmEnt.Components[i]).Name) = UpperCase(DataSet.ProviderName)
          then
        begin
          TIBQuery(TDataSetProvider(dtmEnt.Components[i]).DataSet).SQL.Text := DataSet.CommandText;
          Break;
        end;
    end;
  end;
end;

function TdtmEnt.verificaEntrada: boolean;
var
  vUsuario, vSenha, codEmpresaResc: string;
begin
  Result := true;
  vUsuario := '';
  vSenha := '';

//  verificaEstruturaBancoDeDados;

  if not DirectoryExists(ExtractFilePath(application.exename)+'ArquivosDigitais') then
    CreateDirectory(pchar(ExtractFilePath(application.exename)+'ArquivosDigitais'),nil) ;
  vDadosIni.vPathArquivosDigitais := ExtractFilePath(application.exename)+'ArquivosDigitais';

  if not vDadosIni.verificaParametrosLogin(vUsuario, vSenha) then
    with vDadosIni do if GetIni('MD', 'SLA', 'N') = 'S' then //SALVAR LOGIN AUTOMATICAMENTE
      if _LerConfiguracoesRegistroString('LA', 'N') = 'S' then
      begin
        codEmpresaResc := codEmpresa;
        vUsuario   := decodifica(_LerConfiguracoesRegistroString('S1'));
        vSenha     := decodifica(_LerConfiguracoesRegistroString('S2'));
        codEmpresa := decodifica(_LerConfiguracoesRegistroString('S3'));

        //obUser := TUsuario.Create;
        if not GetOrCreateGlobaUser.validaSenha(vUsuario, vSenha, vDadosIni.vSistema) then
        begin
          ShowErro('SLA Login ou senha inválida: ');
          vUsuario := '';
          vSenha := '';
          codEmpresa := codEmpresaResc;
        end;
      end;

  if (vUsuario = 'HW') or ((vUsuario = '') or (vSenha = '')) or (Trim(vDadosIni.codEmpresa) = '') then
  begin
    //obUser := TUsuario.Create;
    vDadosIni.fechaStatusProcessamento;
    Application.CreateForm(TfrmSplash, frmSplash);
    Application.CreateForm(TFrmEntrada, FrmEntrada);
    FrmEntrada.ShowModal;
    if FrmEntrada.ModalResult <> mrOK then
    begin
      Result := false;
      Application.Terminate;
      Abort;
    end
    else if not vDadosIni.InstanciaValida then
    begin
      ShowErro('Já existe uma instancia para esse aplicativo em execução');
      Result := false;
      Application.Terminate;
      Abort;
    end;
  end
  else
  begin
    //obUser := TUsuario.Create;
    if not GetOrCreateGlobaUser.validaSenha(vUsuario, vSenha, vDadosIni.vSistema) then
    begin
      Application.MessageBox(pchar('Usuário não tem acesso a empresa: ' + vDadosIni.codEmpresa),
        'Atenção', 0 + 64);
      Result := false;
      Application.Terminate;
      Abort;
    end
    else if not vDadosIni.InstanciaValida then
    begin
      ShowErro('Já existe uma instancia para esse aplicativo em execução');
      Result := false;
      Application.Terminate;
      Abort;
    end;
  end;
  vDadosIni.setDadosConfig(TSingleton(vDadosIni));
end;

procedure TdtmEnt.verificaEstruturaBancoDeDados;
begin
  try
    if vDadosIni.vSistema = 'Fiscal' then
    begin
      if vDadosIni.vTipoConexao <> 'off' then
        verificaEstruturaHwfdb;
      verificaEstruturaHwFfdb;
      verificaEstruturaFiscalfdb;
    end
    else
    begin
      verificaEstruturaHwfdb;
      if vDadosIni.vTerminalFiscal = 'S' then
        verificaEstruturaFiscalfdb;
    end;
  except
  end;
end;

procedure TdtmEnt.verificaEstruturaFiscalfdb;
var
  vVersaoFiscal: Integer;
  vPw, vUs: string;
begin
  try
    vUs := string(__getUsuarioFDB);
    vPw := string(__getSenhaFDB);
    bancoTemp.Connected := False;
    if (Trim(vUs) <> '') then
      bancoTemp.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
    if (Trim(vPw) <> '') then
      bancoTemp.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
    bancoTemp.DatabaseName := vDadosIni.vBancoFiscal;
    bancoTemp.Connected := True;
    qrTemp.Close;
    qrTemp.SQL.Text := 'select versaobancofiscal, versaobancohwf, versaobancohw from EMPDESVOLV where COD_EMPDES = 1';
    try
      qrTemp.Open;
      vVersaoFiscal := qrTemp.FieldByName('versaobancofiscal').AsInteger;
    except
      vVersaoFiscal := 0;
    end;
    if vVersaoFiscal < vDadosIni.vVersaoBancoFiscal  then
      if vDadosIni.reestruturarBancoDeDados('fiscal',False) then
      begin
        qrTemp.Close;
        qrTemp.SQL.Text := 'update EMPDESVOLV set versaobancofiscal = '+IntToStr(vDadosIni.vVersaoBancoFiscal)+' where COD_EMPDES = 1';
        qrTemp.ExecSQL;
        if transacaoTemp.InTransaction then
          transacaoTemp.Commit;
      end;
  except
  end;
end;

procedure TdtmEnt.verificaEstruturaHwfdb;
var
  vVersaoFiscal, vVersaoHwF, vVersaoHw, vVersaoProcessos: Integer;
  vPw, vUs: string;
begin
  try
    vUs := string(__getUsuarioFDB);
    vPw := string(__getSenhaFDB);
    bancoTemp.Connected := False;
    if (Trim(vUs) <> '') then
      bancoTemp.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
    if (Trim(vPw) <> '') then
      bancoTemp.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
    bancoTemp.DatabaseName := vDadosIni.vBancoHW;
    bancoTemp.Connected := True;
    qrTemp.Close;
    qrTemp.SQL.Text := 'select versaobancofiscal, versaobancohwf, versaobancohw, versaoprocessos from EMPDESVOLV where COD_EMPDES = 1';
    try
      qrTemp.Open;
      vVersaoHw := qrTemp.FieldByName('versaobancohw').AsInteger;
      vVersaoProcessos := qrTemp.FieldByName('versaoprocessos').AsInteger;
    except
      vVersaoHw := 0;
      vVersaoProcessos := 0;
    end;
    if vVersaoHw < vDadosIni.vVersaoBancoHw  then
      if vDadosIni.reestruturarBancoDeDados('hw',False) then
      begin
        qrTemp.Close;
        qrTemp.SQL.Text := 'update EMPDESVOLV set versaobancohw = '+IntToStr(vDadosIni.vVersaoBancoHw)+' where COD_EMPDES = 1';
        qrTemp.ExecSQL;
        if transacaoTemp.InTransaction then
          transacaoTemp.Commit;
      end;
    if vVersaoProcessos < vDadosIni.vVersaoTabelaProcessos  then
      if vDadosIni.reestruturarBancoDeDados('processos',False) then
      begin
        qrTemp.Close;
        qrTemp.SQL.Text := 'update EMPDESVOLV set versaoprocessos = '+IntToStr(vDadosIni.vVersaoTabelaProcessos)+' where COD_EMPDES = 1';
        qrTemp.ExecSQL;
        if transacaoTemp.InTransaction then
          transacaoTemp.Commit;
      end;
    qrTemp.Close;
  except
  end;
end;

procedure TdtmEnt.verificaEstruturaHwFfdb;
var
  vVersaoHwF: Integer;
  vPw, vUs: string;
begin
  try
    try
      vUs := string(__getUsuarioFDB);
      vPw := string(__getSenhaFDB);
      bancoTemp.Connected := False;
      if (Trim(vUs) <> '') then
        bancoTemp.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
      if (Trim(vPw) <> '') then
        bancoTemp.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
      bancoTemp.DatabaseName := vDadosIni.vBancoHwF;
      bancoTemp.Connected := True;
      qrTemp.Close;
      qrTemp.SQL.Text := 'select versaobancofiscal, versaobancohwf, versaobancohw, versaoprocessos from EMPDESVOLV where COD_EMPDES = 1';
      try
        qrTemp.Open;
        vVersaoHwF := qrTemp.FieldByName('versaobancohwf').AsInteger;
      except
        vVersaoHwF := 0;
      end;
      if vVersaoHwF < vDadosIni.vVersaoBancoHwF  then
        if vDadosIni.reestruturarBancoDeDados('hwf',False) then
        begin
          qrTemp.Close;
          qrTemp.SQL.Text := 'update EMPDESVOLV set versaobancohwf = '+IntToStr(vDadosIni.vVersaoBancoHwF)+' where COD_EMPDES = 1';
          qrTemp.ExecSQL;
          if transacaoTemp.InTransaction then
            transacaoTemp.Commit;
        end;
    finally
      bancoTemp.Connected := False;
    end;
  except
  end;
end;

end.

