unit uReestrutura_Classes;

interface

uses
  IBDatabase, IBQuery, IBScript, DBClient, uReestrutura_Versao, Classes, DB,
  Provider, DBGrids;

type
  HwOpcoesSelecao = (osSel, osUnSel, osSelAll, osUnSelAll, osInvert);
  TWorkEvent = procedure(var Count: Integer) of object;

  //Classe de reestruturacao
  TDadosIni = class
  public
    vShiftClick: Boolean;
    procedure registraLog(Text: string; RewriteFile: Boolean = False);
    procedure registraErro(vMenserro: string);
    procedure fDataseAfterClose(DataSet: TDataSet);
    procedure DBGridOnTitleClick(DBGrid: TDBGrid; Column: TColumn);
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    function _LerConfiguracoesRegistroString(NomeVariavel : string; pDefault: string = ''): string;
    function getValue(pStr: string; pPos: integer; pDelimiter: string = '|'): string;
    function GetIni(pChave, pIdentificador, pValorDefault: string): string;
    function strIn(pStr: string; const pArgs: array of string): Boolean;
    function IfThen(AValue: Boolean; ATrue, AFalse: Variant): Variant;
    function StrZero(Num: string; Tam: Integer): string; overload;
    function codifica(wtexto: string): string;
  end;

  TReestrutura = class
  private
    Banco: TIBDataBase;
    Transacao: TIBTransaction;
    Query1: TIBQuery;
    Query2: TIBQuery;
    DML: TIBQuery;
//    DDL: TIBScript;
    Script: TClientDataSet;
    LogErro: TStrings;
    FLastVersion: Smallint;
    FEnderecoBanco: string;
    FSistema: string;
    FCountErros: Smallint;
    FOnWorkEvent: TWorkEvent;
    FDataSource_Script: TDataSource;
    FQuery_Manutencao: TIBQuery;
    FDataSetProvider_Manutencao: TDataSetProvider;
    FManutencao: TClientDataSet;
    FDataSource_Manutencao: TDataSource;
    FDadosIni: TDadosIni;
    FVersaoBPL: string;
    FEnderecoBancoUsuario: string;
    procedure SetEnderecoBancoUsuario(const Value: string);
    procedure SetVersaoBPL(const Value: string);
    procedure SetDadosIni(const Value: TDadosIni);
    procedure SetDataSource_Manutencao(const Value: TDataSource);
    procedure SetManutencao(const Value: TClientDataSet);
    procedure SetDataSource(const Value: TDataSource);
    procedure SetOnWorkEvent(const Value: TWorkEvent);
    procedure FieldScriptGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure FManutencaoAfterOpen(DataSet: TDataSet);

    procedure SetSistema(const Value: string);
    procedure SetEnderecoBanco(const Value: string);
    procedure InicializarObjetos;
    procedure MontarScript(Versao: TfrmReestruturaVersao); overload;
    procedure MontarScript(List: TStrings; const Versao, Build: Integer); overload;
    procedure RegistraErroScript(Erro: string);
    procedure RegistraSucessoScript;
    procedure RegistraInativoScript;
    procedure RegistraReestruturacao;
    procedure ExecutarSnapShot();

    function GetUserDataBase(UserREPL: Boolean): string;
    function GetPasswordDataBase: string;
    function GetLastVersionDB: Integer;
    function ConectaBanco(DataBase: TIBDatabase; DataBaseName: string; ShowError, UsarRepL: Boolean): Boolean;
    function VerificarVersao(Versao, Build: Smallint; UltimaVersao: Boolean): Boolean;
    function ValidarSenhaHw: Boolean;

    function ReadResouceTXT(const ResName: string): string;
//    function GetNewVersionsFromReource(): TStrings;
    function ExtractSqlFromResource(const ResourceName: string): string;
    procedure LoadScriptsFromResource(FromVerion: Integer = -1; UntilVersion: Integer = -1); overload;
    function GetLastManifestDB(): TStrings;
  public
    destructor Destroy; override;
    constructor Create;

    function GetCountScripts: Integer;

    procedure Verificar_Versao; overload;
    procedure Verificar_Versao(startVersion, endVersion: Integer); overload;
    procedure Reestruturar;
    procedure PesquisarScripts(VersaoSistema, VersaosScript, Execucao, ParteScript, ParteErro: string);
    procedure AddScriptParaExecutar;
    procedure ClearScriptParaExecutar;
    procedure ExecutarScriptsAdicionados;
    procedure MarcarScriptComoManual;
    procedure MarcarDesmarcar(Opcao: HwOpcoesSelecao);
    procedure ShowDataBaseInfo;

    property EnderecoBanco        : string                      read FEnderecoBanco         write SetEnderecoBanco;
    property EnderecoBancoUsuario : string                      read FEnderecoBancoUsuario  write SetEnderecoBancoUsuario;
    property Sistema              : string                      read FSistema               write SetSistema;
    property VersaoBPL            : string                      read FVersaoBPL             write SetVersaoBPL;
    property LastVersion          : Smallint                                                write FLastVersion;
    property OnWorkEvent          : TWorkEvent                  read FOnWorkEvent           write SetOnWorkEvent;
    property DataSource_Script    : TDataSource                 read FDataSource_Script     write SetDataSource;
    property Manutencao           : TClientDataSet              read FManutencao            write SetManutencao;
    property DataSource_Manutencao: TDataSource                 read FDataSource_Manutencao write SetDataSource_Manutencao;
    property DadosIni             : TDadosIni                   read FDadosIni              write SetDadosIni;
  end;

var
  reestrutura: TReestrutura;

implementation

uses
  SysUtils, Forms, uReestrutura_Versao1, StrUtils, Math,
  Windows, Variants, Dialogs, uReestrutura_Manutencao, Messages,
  uReestrutura_HwSenha, IBDatabaseInfo, IniFiles, Graphics, Registry,
  uReestrutura_Aplicar;

function __getSenhaFDB: PChar; stdcall; external 'cons40.dll';
function __getUsuarioFDB: PChar; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';
function __criptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';
function _getMd5File(FileName: WideString): WideString; stdcall; external 'MD5XE3.dll';
function UnzipFirstFileFromMemory( Buffer: Pointer; BufferSize: Integer; OutputBuffer: PAnsiChar; MaxOutputSize: Integer ): Integer; stdcall; external 'MD5XE3.dll';
function hw_sql_script_exec(EnderecoBanco, Usuario, Senha, Script: WideString; Commitar: LongBool): WideString; stdcall; external 'HwScript.dll';
function hw_sql_script_exec_charSet(EnderecoBanco, Usuario, Senha, charSet, Script: WideString; Commitar: LongBool): WideString; stdcall; external 'HwScript.dll';
procedure hw_sql_script_free; stdcall; external 'HwScript.dll';

//Chamada pelo sistema Retaguarda para reestruturar o banco do Hwauto.fdb
procedure reestrutura_verificar_hwauto(VersaoBPL: PChar);
begin
  reestrutura := TReestrutura.Create;
  try
    reestrutura.Sistema := 'Hwauto';
    reestrutura.VersaoBPL := string(VersaoBPL);
    reestrutura.Verificar_Versao;
  finally
    FreeAndNil(reestrutura);
  end;
end;

//Chamada pelo sistema Fiscal para reestruturar o banco do Fiscal.fdb
procedure reestrutura_verificar_fiscal(VersaoBPL: PChar);
begin
  reestrutura := TReestrutura.create;
  try
    reestrutura.Sistema := 'Fiscal';
    reestrutura.VersaoBPL := string(VersaoBPL);
    reestrutura.Verificar_Versao;
  finally
    FreeAndNil(reestrutura);
  end;
end;

//Chamada pelo sistema Fiscal para reestruturar o banco do Fiscal.fdb
procedure reestrutura_verificar_fiscal_pelo_endereco(VersaoBPL, EnderecoBanco: PChar);
begin
  reestrutura := TReestrutura.create;
  try
    reestrutura.Sistema := 'Fiscal';
    reestrutura.VersaoBPL := string(VersaoBPL);
    reestrutura.EnderecoBancoUsuario := string(EnderecoBanco);
    reestrutura.Verificar_Versao;
  finally
    FreeAndNil(reestrutura);
  end;
end;

//Chamada pelo sistema Fiscal para reestruturar o banco do HWF.fdb
procedure reestrutura_verificar_hwf(VersaoBPL: PChar);
begin
  reestrutura := TReestrutura.create;
  try
    reestrutura.Sistema := 'HWF';
    reestrutura.VersaoBPL := string(VersaoBPL);
    reestrutura.Verificar_Versao;
  finally
    FreeAndNil(reestrutura);
  end;
end;

//Chamada pelo sistema Fiscal para reestruturar o banco do HWF.fdb
procedure reestrutura_verificar_hwf_pelo_endereco(VersaoBPL, EnderecoBanco: PChar);
begin
  reestrutura := TReestrutura.create;
  try
    reestrutura.Sistema := 'HWF';
    reestrutura.VersaoBPL := string(VersaoBPL);
    reestrutura.EnderecoBancoUsuario := string(EnderecoBanco);
    reestrutura.Verificar_Versao;
  finally
    FreeAndNil(reestrutura);
  end;
end;

//Chamada para abrir o formulario de manutenção dos scripts
procedure reestrutura_manutencao(VersaoBPL: PChar);
begin
  reestrutura := TReestrutura.create;
  try
    reestrutura.VersaoBPL := string(VersaoBPL);
    reestrutura.LastVersion := 0;
    Application.CreateForm(TfrmReestrutura_Manutencao, frmReestrutura_Manutencao);
    frmReestrutura_Manutencao.ShowModal;
  finally
    FreeAndNil(reestrutura);
  end;
end;

exports
  reestrutura_verificar_hwauto,
  reestrutura_verificar_fiscal,
  reestrutura_verificar_hwf,
  reestrutura_manutencao,
  reestrutura_verificar_fiscal_pelo_endereco,
  reestrutura_verificar_hwf_pelo_endereco;

{ TReestrutura }

procedure TReestrutura.AddScriptParaExecutar;
begin
  // Chamado do formulario de manutenção para adicionar a lista de scripts a executar
  if FManutencao.IsEmpty then
    Exit;
  try
    FManutencao.Tag := FManutencao.RecNo;
    FManutencao.Filter := 'sel = ''S''';
    FManutencao.Filtered := True;

    FManutencao.First;
    while not FManutencao.Eof do
    begin
      if Script.Locate('versao;nitem', VarArrayOf([FManutencao.FieldByName('versao_script').AsInteger,
        FManutencao.FieldByName('nitem').AsInteger]),[]) then
        Script.Edit
      else
        Script.Insert;
      Script.FieldByName('nitem').AsInteger  := FManutencao.FieldByName('nitem').AsInteger;
      Script.FieldByName('script').AsString  := FManutencao.FieldByName('sqltext').AsString;
      Script.FieldByName('opcoes').AsString  := FManutencao.FieldByName('opcoes').AsString;
      Script.FieldByName('versao').AsInteger := FManutencao.FieldByName('versao_script').AsInteger;
      Script.FieldByName('build').AsInteger  := FManutencao.FieldByName('build').AsInteger;
      Script.Post;

      FManutencao.Next;
    end;
    FManutencao.Close;
    FManutencao.Open;
  finally
    FManutencao.Filtered := False;
    if FManutencao.Tag <= FManutencao.RecordCount then
      FManutencao.RecNo := FManutencao.Tag;
  end;
end;

procedure TReestrutura.ClearScriptParaExecutar;
begin
  // Chamado do formulario de manutenção para limpar a lista de scripts a executar
  if Script.RecordCount > 0 then
    Script.EmptyDataSet;
end;

function TReestrutura.ConectaBanco(DataBase: TIBDatabase; DataBaseName: string;
  ShowError, UsarRepL: Boolean): Boolean;
var
  vPw, vUs: string;
begin
  try
    vUs := string(__getUsuarioFDB);
    vPw := string(__getSenhaFDB);
    DataBase.ForceClose;
    DataBase.Connected := false;

    if UsarRepL then
      DataBase.Params[0] := 'user_name=REPL'
    else if (Trim(vUs) <> '') then
      DataBase.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)))
    else
      DataBase.Params[0] := 'user_name=sysdba';
    if (Trim(vPw) <> '') then
      DataBase.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));

    DataBase.DatabaseName := DataBaseName;
    try
      DataBase.Connected := true;
    except on e: exception do
      begin
        if ShowError then
          Application.MessageBox(PChar('Reestrutura. Erro na conexão! ' + #13 +
            'DB: ' + Sistema + #13 +
            'Endereço: ' + DataBaseName + #13 +
            'Erro: ' + e.Message), PChar('Erro'), MB_ICONERROR + MB_OK);
        DadosIni.registraErro('TReestrutura.ConectaBanco:' + e.Message);
      end;
    end;
  finally
    Result := DataBase.Connected;
  end;
end;

constructor TReestrutura.Create;
begin
  FSistema := '';
  InicializarObjetos;
end;

destructor TReestrutura.Destroy;
begin
  FreeAndNil(LogErro);
  FreeAndNil(FDataSource_Script);
  FreeAndNil(Script);
  FreeAndNil(Query2);
  FreeAndNil(FQuery_Manutencao);
  FreeAndNil(Query1);
//  FreeAndNil(DDL);
  FreeAndNil(DML);
  FreeAndNil(Transacao);
  FreeAndNil(Banco);
  FreeAndNil(FDadosIni);
  inherited;
end;

procedure TReestrutura.ExecutarScriptsAdicionados;
begin
  // Chamado do formulario de manutenção para executar a lista de scripts selecionados
  if FSistema = 'Hwauto' then
    FEnderecoBanco := DadosIni.GetIni('Banco', 'HW', '')
  else if FSistema = 'HWF' then
    FEnderecoBanco := DadosIni.GetIni('Banco', 'HWF', '')
  else if FSistema = 'Fiscal' then
    FEnderecoBanco := DadosIni.GetIni('Banco', 'Fiscal', '')
  else
    raise Exception.Create('Reestrutura - Sistema não definido para localizar o banco de dados');

  if not ValidarSenhaHw then
    Exit;

  try
    LogErro.Clear;
    FCountErros := 0;

    if Script.RecordCount > 0 then
    begin
      Application.CreateForm(TfrmReestrutura_Aplicar, frmReestrutura_Aplicar);
      frmReestrutura_Aplicar.ShowModal;

      if LogErro.Count > 0 then
        LogErro.SaveToFile(ExtractFilePath(Application.ExeName) + 'ErroManutencaoReestrutura_' + Sistema + '.log');

      if (FCountErros > 0) and (LogErro.Count > 0) and
        (FileExists(ExtractFilePath(Application.ExeName) + 'ErroManutencaoReestrutura_' + Sistema + '.log')) then
        if Application.MessageBox('Houve falhas na reestruturação. Visualizar o log?', 'Confirmação',
          MB_ICONQUESTION + MB_YESNO) = ID_YES then
          WinExec(PChar('notepad.exe ' + ExtractFilePath(Application.ExeName) + 'ErroManutencaoReestrutura_' + Sistema + '.log'), SW_SHOWNORMAL);

      FManutencao.Close;
      FManutencao.Open;
    end
    else
    begin
      Application.MessageBox('Nenhum script adicionado para execução', 'Atenção', 0 + 64);
    end;

  except on E: Exception do
    begin
      DadosIni.registraErro('TReestrutura.Verificar_versao. Erro: ' + E.Message);
      Application.MessageBox(PChar('Erro ao verificar versão. Erro: ' + E.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TReestrutura.ExecutarSnapShot;
begin
  try
    Query1.Close;
    Query1.SQL.Text := 'select * from sp_reestrutura_snapshot_new';
    try
      Query1.Open;
    finally
      Query1.Close;
    end;
  except
  end;
end;

procedure TReestrutura.FieldScriptGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
var
  List: TStrings;
  I: Integer;
begin
  List := TStringList.Create;
  List.Text := Sender.AsString;
  Text := '';
  for I := 0 to List.Count - 1 do
    Text := Text + ' ' + List[I];
  if Length(Text) > 130 then
    Text := Copy(Text, 1, 130) + '...';
end;

procedure TReestrutura.FManutencaoAfterOpen(DataSet: TDataSet);
begin
  if not Assigned(FManutencao.FieldByName('sqltext').OnGetText) then
    FManutencao.FieldByName('sqltext').OnGetText := FieldScriptGetText;
  if not Assigned(FManutencao.FieldByName('logerro').OnGetText) then
    FManutencao.FieldByName('logerro').OnGetText := FieldScriptGetText;
end;

function TReestrutura.GetCountScripts: Integer;
begin
  Result := Script.RecordCount;
end;

function TReestrutura.GetLastManifestDB: TStrings;
begin
  Result := TStringList.Create();

  Query1.Close;
  Query1.SQL.Text := 'select first 1 value1_b from config_sistema' +
    ' where chave = ''reestrutura_manifest'' and cod_empresa = 0';
  try
    Query1.Open;
    Result.Text := Query1.FieldByName('value1_b').AsString;
  finally
    Query1.Close;
  end;
end;

function TReestrutura.GetLastVersionDB: Integer;
begin
  Result := 0;

  Query1.Close;
  Query1.SQL.Text := 'select first 1 VERSAO_SCRIPT from REESTRURURA_VER' +
    ' order by VERSAO_SCRIPT desc';
  try
    Query1.Open;
    Result := Query1.FieldByName('VERSAO_SCRIPT').AsInteger;
  finally
    Query1.Close;
  end;
end;

procedure TReestrutura.ShowDataBaseInfo;
var
  DataBaseInfo: TIBDatabaseInfo;
  List: TStrings;
begin
  if FSistema = 'Hwauto' then
    FEnderecoBanco := DadosIni.GetIni('Banco', 'HW', '')
  else if FSistema = 'HWF' then
  begin
    if Trim(FEnderecoBancoUsuario) <> '' then
      FEnderecoBanco := FEnderecoBancoUsuario
    else
      FEnderecoBanco := DadosIni.GetIni('Banco', 'HWF', '');
  end
  else if FSistema = 'Fiscal' then
  begin
    if Trim(FEnderecoBancoUsuario) <> '' then
      FEnderecoBanco := FEnderecoBancoUsuario
    else
      FEnderecoBanco := DadosIni.GetIni('Banco', 'Fiscal', '');
  end
  else
    raise Exception.Create('Reestrutura - Sistema não definido para localizar o banco de dados');
  DataBaseInfo := TIBDatabaseInfo.Create(Application);
  try
    ConectaBanco(Banco, FEnderecoBanco, True, False);

    DataBaseInfo.Database := Banco;
    List := TStringList.Create;
    List.Clear;

    List.Add( 'Informações do Banco de Dados');
    List.Add( '');
    List.Add( 'Arquivo: ' + DataBaseInfo.DBFileName );
    List.Add( 'Servidor: ' + DataBaseInfo.DBSiteName );
    List.Add( 'Versão Arquivo: ' + StringReplace(FloatToStr(DataBaseInfo.FullODS), ',', '.', [rfReplaceAll]) +
      DadosIni.IfThen(DataBaseInfo.FullODS = 11.0, ' [Firebird 2.0]', '') +
      DadosIni.IfThen(DataBaseInfo.FullODS = 11.1, ' [Firebird 2.1]', '') +
      DadosIni.IfThen(DataBaseInfo.FullODS = 11.2, ' [Firebird 2.5]', '') +
      DadosIni.IfThen(DataBaseInfo.FullODS = 12.0, ' [Firebird 3.0]', '') );
    List.Add( 'Versão Servidor: ' + DataBaseInfo.Version );
    List.Add( 'Usuarios Conectados: ' + IntToStr(DataBaseInfo.UserNames.Count) );

    Application.MessageBox(PChar(List.Text), 'Informção',  0 + 64);

  finally
    Banco.ForceClose;
    FreeAndNil(DataBaseInfo);
  end;
end;

function TReestrutura.GetPasswordDataBase: string;
var
  vPw: string;
begin
  vPw := '';
  try
    vPw := string(__getSenhaFDB);
    if Trim(vPw) <> '' then
      vPw := string(__descriptografaTextoFDB(Pchar(vPw)));
  finally
    Result := DadosIni.IfThen(Trim(vPw) <> '', Trim(vPw), 'masterkey');
  end;
end;

function TReestrutura.GetUserDataBase(UserREPL: Boolean): string;
var
  vUs: string;
begin
  vUs := '';
  try
    if UserREPL then
      vUs := 'REPL'
    else
    begin
      vUs := string(__getUsuarioFDB);
      if Trim(vUs) <> '' then
        vUs := string(__descriptografaTextoFDB(Pchar(vUs)));
    end;
  finally
    Result := DadosIni.IfThen(Trim(vUs) <> '', Trim(vUs), 'sysdba');
  end;
end;

procedure TReestrutura.InicializarObjetos;
begin
  FDadosIni := TDadosIni.Create;
  FEnderecoBanco := '';
  FEnderecoBancoUsuario := '';
  Banco := TIBDatabase.Create(Application);
  Transacao := TIBTransaction.Create(Application);

  Banco.LoginPrompt := False;
  Banco.DefaultTransaction := Transacao;
  Banco.Params.Clear;
  Banco.Params.Add('user_name=sysdba');
  Banco.Params.Add('password=masterkey');

  Transacao.DefaultDatabase := Banco;
  Transacao.Params.Clear;
  Transacao.Params.Add('read_committed');
  Transacao.Params.Add('rec_version');
  Transacao.Params.Add('nowait');

  //Query usada no metodo de reestruturação do banco, quando o script for configurado para usar query (CMD:DML)
  DML             := TIBQuery.Create(Application);
  DML.Database    := Banco;
  DML.Transaction := Transacao;

  //Querys auxiliares da classe
  Query1             := TIBQuery.Create(Application);
  Query1.Database    := Banco;
  Query1.Transaction := Transacao;

  Query2             := TIBQuery.Create(Application);
  Query2.Database    := Banco;
  Query2.Transaction := Transacao;

  //Dataset temporario que armazena os scripts para reestruturacao
  Script := TClientDataSet.Create(Application);
  Script.FieldDefs.Add('nitem'   , ftSmallint  );
  Script.FieldDefs.Add('build'   , ftSmallint  );
  Script.FieldDefs.Add('versao'  , ftSmallint  );
  Script.FieldDefs.Add('script'  , ftMemo      );
  Script.FieldDefs.Add('erro'    , ftMemo      );
  Script.FieldDefs.Add('execucao', ftString,  8);
  Script.FieldDefs.Add('opcoes'  , ftString, 64);
  Script.FieldDefs.Add('update'  , ftString,  1); // indica que o script deve ser atualizado no banco de dados
  Script.CreateDataSet;
  Script.IndexFieldNames := 'versao;nitem';
  Script.FieldByName('script').OnGetText := FieldScriptGetText;

  FDataSource_Script          := TDataSource.Create(Application);
  FDataSource_Script.AutoEdit := False;
  FDataSource_Script.DataSet  := Script;

  //Componentes para apresentar os scripts no formulario de manutencao
  FQuery_Manutencao             := TIBQuery.Create(Application);
  FQuery_Manutencao.Database    := Banco;
  FQuery_Manutencao.Transaction := Transacao;

  FDataSetProvider_Manutencao         := TDataSetProvider.Create(Application);
  FDataSetProvider_Manutencao.Options := [poAllowCommandText,poUseQuoteChar];
  FDataSetProvider_Manutencao.DataSet := FQuery_Manutencao;
  Randomize;
  FDataSetProvider_Manutencao.Name    := 'DSP_114_44text_' + IntToStr(Random(5000));

  FManutencao := TClientDataSet.Create(Application);
  FManutencao.ProviderName := FDataSetProvider_Manutencao.Name;
  FManutencao.FieldDefs.Add('sel'           , ftString, 1);
  FManutencao.FieldDefs.Add('versao_sistema', ftString, 10);
  FManutencao.FieldDefs.Add('versao_script' , ftSmallint);
  FManutencao.FieldDefs.Add('nitem'         , ftSmallint);
  FManutencao.FieldDefs.Add('build'         , ftSmallint);
  FManutencao.FieldDefs.Add('opcoes'        , ftString, 64);
  FManutencao.FieldDefs.Add('execucao'      , ftString, 8);
  FManutencao.FieldDefs.Add('sqltext'       , ftMemo);
  FManutencao.FieldDefs.Add('logerro'       , ftMemo);

  FManutencao.FieldDefs[0].DisplayName       := '...';
  FManutencao.FieldDefs[0].InternalCalcField := True;
  FManutencao.FieldDefs[1].DisplayName       := 'Ver. Sistema';
  FManutencao.FieldDefs[2].DisplayName       := 'Ver. Script';
  FManutencao.FieldDefs[3].DisplayName       := 'Seq';
  FManutencao.FieldDefs[4].DisplayName       := 'Build';
  FManutencao.FieldDefs[5].DisplayName       := 'Opções';
  FManutencao.FieldDefs[6].DisplayName       := 'Execução';
  FManutencao.FieldDefs[7].DisplayName       := 'Script';
  FManutencao.FieldDefs[8].DisplayName       := 'Erro';

  FManutencao.AfterOpen := FManutencaoAfterOpen;

  FDataSource_Manutencao := TDataSource.Create(Application);
  FDataSource_Manutencao.AutoEdit := False;
  FDataSource_Manutencao.DataSet := FManutencao;

  // Lista de gravacao de erros
  LogErro := TStringList.Create;
  LogErro.Clear;
end;


procedure TReestrutura.LoadScriptsFromResource(FromVerion, UntilVersion: Integer);
var
  ResStream: TResourceStream;
  lastManifest, currentManifest, SQL: TStrings;
  currentCrcManifest, lastCrcManifest, SName, SNameSQL: string;
  I, L, ResultZip, bCurrent, bLast: Integer;
begin
  lastManifest := GetLastManifestDB();
  try
    currentCrcManifest := StringReplace(ReadResouceTXT('MANIFEST_CRC'), sLineBreak, '', [rfReplaceAll]);  // Carrega o CRC do manifesto atual
    lastCrcManifest := Trim(lastManifest.Values['manifest.txt']);  // Obtem o CRC do ultimo manifesto aplicado

    if (FromVerion = -1) and (UntilVersion = -1) then
      if (lastCrcManifest <> '') and (lastCrcManifest = currentCrcManifest) then  // Se forem identicos entao já foi executado
        Exit;

    currentManifest := TStringList.Create;
    currentManifest.Text := ReadResouceTXT('MANIFEST');    // Carrega o conteudo manifesto a atual

    bLast    := StrToIntDef(Trim(lastManifest.Values['build']), 0);
    bCurrent := StrToIntDef(Trim(currentManifest.Values['build']), 0);

    if (FromVerion = -1) and (UntilVersion = -1) then
      if (Trim(currentManifest.Values['last']) = Trim(lastManifest.Values['last'])) and     // Se a versao é igual e o buil menor ou igual ao ultimo aplicando entao esta OK // // Se a versao e o buil sao iguais ao ultimo aplicando entao esta OK
        (bCurrent <= bLast) then // (Trim(currentManifest.Values['build']) = Trim(lastManifest.Values['build'])) then
        Exit;

    SQL := TStringList.Create;
    if UntilVersion >= 1 then
      L := UntilVersion
    else
      L := StrToInt(Trim(currentManifest.Values['last']));

    for I := Max(1, FromVerion) to L do
    begin
      SName := Format('SQL_%.*d', [3, I]);
      SNameSQL := Format('%.*d.sql', [3, I]);

      if lastManifest.Values[SNameSQL] = currentManifest.Values[SNameSQL] then // Se o CRC do script em questao é diferente entao ele teve alteracao e deve ser lido novamente
        Continue;

      SQL.Text := ExtractSqlFromResource( SName );

      if SQL.Count > 0 then
        MontarScript(SQL, I, StrToInt(Trim(currentManifest.Values['build'])) );
    end;

  finally
    SQL.Free();
    lastManifest.Free();
    currentManifest.Free();
  end;
end;

function TReestrutura.ExtractSqlFromResource(const ResourceName: string): string;
var
  ResStream: TResourceStream;
  Buffer: PAnsiChar;
  SqlSize: Integer;
  conteudo: UTF8String;
  const MAX_SQL_SIZE = 1024 * 1024; // 1 MB (ajuste conforme necessário)
begin
  Result := '';
  ResStream := TResourceStream.Create(HInstance, ResourceName, RT_RCDATA);
  try
    if ResStream.Size = 0 then
      Exit;
    
    // Aloca buffer para saída
    GetMem(Buffer, MAX_SQL_SIZE);
    try
      // Chama a DLL
      SqlSize := UnzipFirstFileFromMemory(
        ResStream.Memory,
        ResStream.Size,
        Buffer,
        MAX_SQL_SIZE
      );

      if SqlSize < 0 then // vamor menor que zero indica que o valor absoluto corresponde ao tamanho do sql, assim chamamos novamente
        SqlSize := UnzipFirstFileFromMemory(
          ResStream.Memory,
          ResStream.Size,
          Buffer,
          Abs(SqlSize)
        );

      if SqlSize > 0 then
      begin
        SetString(conteudo, Buffer, SqlSize);
        Result := Utf8ToAnsi(conteudo);
      end
      else
        raise Exception.Create('Falha ao descompactar o script: ' + ResourceName);
    finally
      FreeMem(Buffer);
    end;
  finally
    ResStream.Free;
  end;
end;

function TReestrutura.ReadResouceTXT(const ResName: string): string;
var
  ResStream: TResourceStream;
  StrStream: TStringStream;
  StreamSize: Integer;
  Buffer: PChar;
begin
  Result := '';
  try
    ResStream := TResourceStream.Create(HInstance, ResName, RT_RCDATA);
    StrStream := TStringStream.Create('');
    try
      ResStream.SaveToStream(StrStream);
      Result := StrStream.DataString;
    finally
      ResStream.Free;
    end;
  except
    on E: Exception do
    begin
      DadosIni.registraErro('ERRO ao ler o recurso ' + ResName + ': ' + E.Message);
      Application.MessageBox(PChar('Erro ao verificar versão. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TReestrutura.MarcarDesmarcar(Opcao: HwOpcoesSelecao);
begin
  if FManutencao.IsEmpty then
    Exit;
  try
    FManutencao.Tag := FManutencao.RecNo;
    FManutencao.DisableControls;
    if (osSel = Opcao) or (osUnSel = Opcao) then
    begin
      FManutencao.Edit;
      FManutencao.FieldByName('sel').AsString := DadosIni.IfThen(osSel = Opcao, 'S', '');
      FManutencao.Post;
    end
    else if (osSelAll = Opcao) or (osUnSelAll = Opcao) or (osInvert = Opcao) then
    begin
      FManutencao.Last;
      FManutencao.First;
      while not FManutencao.Eof do
      begin
        FManutencao.Edit;
        if osInvert = Opcao then
          FManutencao.FieldByName('sel').AsString := DadosIni.IfThen(FManutencao.FieldByName('sel').AsString = 'S', '', 'S')
        else
          FManutencao.FieldByName('sel').AsString := DadosIni.IfThen(osSelAll = Opcao, 'S', '');
        FManutencao.Post;
        FManutencao.Next;
      end;
    end;
    if FManutencao.Tag <= FManutencao.RecordCount then
      FManutencao.RecNo := FManutencao.Tag;
  finally
    FManutencao.EnableControls;
  end;
end;

procedure TReestrutura.MarcarScriptComoManual;
var
  List: TStrings;
begin
  // Chamado do formulario de manutenção para marcar scripts selecionados como executados manualmente
  // ********** IMPORTANTE -->> Apenas scripts que foram executados com Erro podem ser marcados como Manual
  if FManutencao.IsEmpty then
    Exit; 
  if not ValidarSenhaHw then
    Exit;
  try
    List := TStringList.Create;
    List.Clear;
    FManutencao.Tag := FManutencao.RecNo;

    FManutencao.Filter := 'sel = ''S''';
    FManutencao.Filtered := True;

    FManutencao.First;
    while not FManutencao.Eof do
    begin
      Query1.Close;
      Query1.SQL.Text := 'select execucao from REESTRURURA_SQL' +
        ' where versao_script = ' + IntToStr(FManutencao.FieldByName('versao_script').AsInteger) +
        ' and nitem = ' + IntToStr(FManutencao.FieldByName('nitem').AsInteger);
      Query1.Open;

      if Trim(Query1.FieldByName('execucao').AsString) <> 'Erro' then
        List.Add('Versao: '  + IntToStr(FManutencao.FieldByName('versao_script').AsInteger) +
                 ' Seq:'      + IntToStr(FManutencao.FieldByName('nitem').AsInteger) +
                 ' Execução:' + Query1.FieldByName('execucao').AsString);
      FManutencao.Next;
    end;
    if List.Count > 0 then
      if Application.MessageBox(PChar('Foram encontrados Scripts com execução diferente de "Erro"' +#13 +
        'Estes scripts não podem ser marcados como manual, apenas quando houver o erro' + #13 +
        'Scripts' + #13 + List.Text + #13 + 'Deseja mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

    FManutencao.First;
    while not FManutencao.Eof do
    begin
      Query1.Close;
      Query1.SQL.Text := 'select execucao from REESTRURURA_SQL' +
        ' where versao_script = ' + IntToStr(FManutencao.FieldByName('versao_script').AsInteger) +
        ' and nitem = ' + IntToStr(FManutencao.FieldByName('nitem').AsInteger);
      Query1.Open;

      if Trim(Query1.FieldByName('execucao').AsString) = 'Erro' then
      begin
        Query2.Close;
        Query2.SQL.Text := 'update REESTRURURA_SQL set execucao = ''Manual''' +
          ' where versao_script = ' + IntToStr(FManutencao.FieldByName('versao_script').AsInteger) +
          ' and nitem = ' + IntToStr(FManutencao.FieldByName('nitem').AsInteger);
        if not Query2.Prepared then
          Query2.Prepare;
        Query2.ExecSQL;
      end;

      FManutencao.Next;
    end;

    if Transacao.InTransaction then
      Transacao.Commit;

    FManutencao.Close;
    FManutencao.Open;

  finally
    FManutencao.Filtered := False;
    if FManutencao.Tag <= FManutencao.RecordCount then
      FManutencao.RecNo := FManutencao.Tag;
  end;
end;
procedure TReestrutura.MontarScript(Versao: TfrmReestruturaVersao);
var
  List: TStrings;
begin
  if FSistema = 'Hwauto' then
    List := Versao.sqlHwauto.Lines
  else if FSistema = 'Fiscal' then
    List := Versao.sqlFiscal.Lines
  else if FSistema = 'HWF' then
    List := Versao.sqlHWF.Lines
  else
    Exit;

  MontarScript( List, Versao.Versao, Versao.Build );
end;

procedure TReestrutura.MontarScript(List: TStrings; const Versao, Build: Integer);
var
  //List: TStrings;
  SQL: TStrings;
  I: Integer;
  Linha, StatusExecucao: string;
  Bloco, UsarRepL, ForcarCommit, UsarDML, Desativado {, UsarSetTerm}, BlocoPV: Boolean;
  J, NumItem: Integer;
begin
  ///  Metodo que recebe o formulario da versao como parametro, usa FSistema para saber qual script vai usar
  ///  Aqui os comandos sao lidos e passados para o dataset
  ///  Veja os comandos abaixo
  ///  |BLOCO|          Inicio de Bloco       - Apenas estes dois comandos iniciam com | os demais somente terminam com pipe
  ///  |/BLOCO|         Fechamento de bloco   - Apenas estes dois comandos iniciam com | os demais somente terminam com pipe
  ///  CMD:REPL|        Ativa o uso do usuario REPL para o script
  ///  CMD:COMMIT|      Commita o registro apos sua execução
  ///  CMD:DML|         Ativa o uso de uma query no lugar do ibscript
  ///  CMD:INATIVO|     Desativa o script para nao ser executado, normalmente quando o script for desconsiderado depois de ja estiver no banco do cliente

//  List := TStringList.Create;
//  List.Clear;
//  if FSistema = 'Hwauto' then
//    List := Versao.sqlHwauto.Lines
//  else if FSistema = 'Fiscal' then
//    List := Versao.sqlFiscal.Lines
//  else if FSistema = 'HWF' then
//    List := Versao.sqlHWF.Lines;

  if List.Count = 0 then
    Exit;

  UsarRepL     := False;
  ForcarCommit := False;
  UsarDML      := False;
  Desativado   := False;

  SQL := TStringList.Create;
  SQL.Clear;
  Bloco := False;
  BlocoPV := False; // Bloco_Ponto_e_Virgula
  NumItem := 0;
  for I := 0 to List.Count - 1 do
  begin
    Linha := List[i];
    //Quando for um Bloco inicialmente variavel Bloco = False, depois de |BLOCO| entao = True,
    //    sendo assim todos os comandos devem ser informados na primeira linha sempre
    //Quando nao for um bloco entao é apenas uma linha, portanto os comandos serao antes do script
    if not Bloco then
    begin
      UsarRepL     := Pos('CMD:REPL|'   , Linha) > 0;
      ForcarCommit := Pos('CMD:COMMIT|' , Linha) > 0;
      UsarDML      := Pos('CMD:DML|'    , Linha) > 0;
      Desativado   := Pos('CMD:INATIVO|', Linha) > 0;
    end;

    Linha := StringReplace(Linha, 'CMD:REPL|', '', [rfReplaceAll]);
    Linha := StringReplace(Linha, 'CMD:COMMIT|', '', [rfReplaceAll]);
    Linha := StringReplace(Linha, 'CMD:DML|', '', [rfReplaceAll]);
    Linha := StringReplace(Linha, 'CMD:INATIVO|', '', [rfReplaceAll]);

    if Bloco then
    begin
      if (Pos('|/BLOCO|', UpperCase(Linha)) = 1) or (Pos('--|/BLOCO|', UpperCase(Linha)) = 1) then
        Bloco := False
      else if (Pos('|BLOCO|', UpperCase(Linha)) = 1) or (Pos('--|BLOCO|', UpperCase(Linha)) = 1) then
      begin
        Application.MessageBox(PChar('Bloco de script sem finalização de bloco. Contate o suporte' + #13 +
          'Versão: ' + IntToStr(Versao) + #13 +
          'Build: ' + IntToStr(Build) + #13 +
          'Linha: ' + IntToStr(I + 1))
        , 'Atenção', 0 +64);//mensagem mais clara
        Exit;
      end
      else
        SQL.Add(Linha);
    end
    else if BlocoPV then
    begin
      if EndsText(';', Linha) then
      begin
        SQL.Add(Linha);
        BlocoPV := False;
      end
      else if (Pos('CREATE TABLE', UpperCase(Linha)) = 1)  then
      begin
        Application.MessageBox(PChar('Bloco de script sem finalização de bloco(";"). Contate o suporte' + #13 +
          'Versão: ' + IntToStr(Versao) + #13 +
          'Build: ' + IntToStr(Build) + #13 +
          'Linha: ' + IntToStr(I + 1))
        , 'Atenção', 0 +64);//mensagem mais clara
        DadosIni.registraErro('TReestrutura.MontarScript Script sem fechamento correto de bloco');
        Exit;
      end
      else
        SQL.Add(Linha);
    end
    else if (Pos('|BLOCO|', UpperCase(Linha)) = 1) or (Pos('--|BLOCO|', UpperCase(Linha)) = 1) then
      Bloco := True
    else if (Pos('CREATE TABLE', UpperCase(Linha)) = 1) and not EndsText(';', Linha) then
    begin
      BlocoPV := True;
      SQL.Add(Linha);
    end
    else
      SQL.Add(Linha);

    if Bloco and BlocoPV then
    begin
      Application.MessageBox(PChar('Bloco de script com abertura duplicada. Contate o suporte' + #13 +
          'Versão: ' + IntToStr(Versao) + #13 +
          'Build: ' + IntToStr(Build) + #13 +
          'Linha: ' + IntToStr(I + 1))
        , 'Atenção', 0 +64);
      Exit;
    end;

    if (not Bloco) and (not BlocoPV) then
    begin
      if (Trim(SQL.Text) <> '') then
      begin
        NumItem := NumItem + 1;
        if UsarDML then // verificando se o script nao é compativel com o comando dml = query, ddl = ibscript
        begin
          for J := 0 to SQL.Count - 1 do
            if Trim(SQL[J]) <> '' then
            begin
              UsarDML := DadosIni.IfThen(
                (Pos('CREATE', UpperCase(Trim(SQL[J]))) = 1) or (Pos('DROP', UpperCase(Trim(SQL[J]))) = 1) or
                (Pos('ALTER', UpperCase(Trim(SQL[J]))) = 1) or (Pos('RECREATE', UpperCase(Trim(SQL[J]))) = 1) or
                (Pos('COMMENT', UpperCase(Trim(SQL[J]))) = 1) or (Pos('DECLARE', UpperCase(Trim(SQL[J]))) = 1)
                , False, True);
              Break;
            end;
        end;

        //Verificando se o script ja existe no banco de dados, pois se ele ja existir com status = Sucesso ou Manual
        // quer dizer que ja foi executado no banco de dados, entao este status vai ser gravado no dataset, e quando
        // o metodo de reestruturacao for chamado, ele nao vai tentar executar novamente o script
        Query1.Close;
        Query1.SQL.Text := 'select versao_script, execucao from REESTRURURA_SQL' +
          ' where versao_script = ' + IntToStr(Versao) +
          ' and nitem = ' + IntToStr(Script.RecordCount + 1);
        Query1.Open;
        StatusExecucao := Query1.FieldByName('execucao').AsString;
        if not DadosIni.strIn(StatusExecucao, ['Sucesso', 'Manual']) then
          StatusExecucao := '';

        Script.Insert;
        Script.FieldByName('nitem').AsInteger := NumItem;
        Script.FieldByName('script').AsString := SQL.Text;
        Script.FieldByName('opcoes').AsString :=
          DadosIni.IfThen(UsarRepL    , '|REPL'   , '') +
          DadosIni.IfThen(UsarDML     , '|DML'    , '') +
          DadosIni.IfThen(ForcarCommit, '|COMMIT' , '') +
          DadosIni.IfThen(Desativado  , '|INATIVO', '');
        Script.FieldByName('versao').AsInteger  := Versao;
        Script.FieldByName('build').AsInteger   := Build;
        Script.FieldByName('execucao').AsString := StatusExecucao;
        Script.Post;
      end;

      SQL.Clear;
    end;
  end;
end;

procedure TReestrutura.PesquisarScripts(VersaoSistema, VersaosScript, Execucao,
  ParteScript, ParteErro: string);
var
  SQL: TStrings;
  Condicao: string;
  CondicaoWhere: string;
begin
  if FSistema = 'Hwauto' then
    FEnderecoBanco := DadosIni.GetIni('Banco', 'HW', '')
  else if FSistema = 'HWF' then
    FEnderecoBanco := DadosIni.GetIni('Banco', 'HWF', '')
  else if FSistema = 'Fiscal' then
    FEnderecoBanco := DadosIni.GetIni('Banco', 'Fiscal', '')
  else
    raise Exception.Create('Reestrutura - Sistema não definido para localizar o banco de dados');

  if not ConectaBanco(Banco, EnderecoBanco, True, False) then
    Exit;

  if not ValidarSenhaHw then
  begin
    Banco.ForceClose;
    Exit;
  end;

  SQL := TStringList.Create;
  try
    Condicao := '';
    VersaoSistema := Trim(VersaoSistema);
    Condicao := DadosIni.IfThen( (Copy(VersaoSistema, 1, 1) = '%') or (Copy(VersaoSistema, Length(VersaoSistema), 1) = '%'), 'like', '=');
    if VersaoSistema <> '' then
      VersaoSistema := 'upper(versao_sistema) ' + Condicao + ' upper(' + QuotedStr(VersaoSistema) + ')';
    CondicaoWhere := CondicaoWhere + DadosIni.IfThen( VersaoSistema = '', '',
      DadosIni.IfThen(Pos('where', CondicaoWhere) > 0, ' and ', ' where ') + VersaoSistema + #13);

    Condicao := DadosIni.IfThen( Pos('>', VersaosScript) > 0, '>', DadosIni.IfThen(Pos('<', VersaosScript) > 0, '<', '')) + '=';
    VersaosScript := StringReplace(VersaosScript, '=', '', [rfReplaceAll]);
    VersaosScript := StringReplace(VersaosScript, '>', '', [rfReplaceAll]);
    VersaosScript := StringReplace(VersaosScript, '<', '', [rfReplaceAll]);
    if VersaosScript <> '' then
      VersaosScript := 'upper(versao_script) ' + Condicao + ' upper(' + QuotedStr(VersaosScript) + ')';
    CondicaoWhere := CondicaoWhere + DadosIni.IfThen( VersaosScript = '', '',
      DadosIni.IfThen(Pos('where', CondicaoWhere) > 0, ' and ', ' where ') + VersaosScript + #13);

    Execucao := DadosIni.IfThen(Trim(Execucao) <> 'Todos', Trim(Execucao), '');
    Condicao := '=';
    if Execucao <> '' then
      Execucao := 'upper(execucao) ' + Condicao + ' upper(' + QuotedStr(Execucao) + ')';
    CondicaoWhere := CondicaoWhere + DadosIni.IfThen( Execucao = '', '',
      DadosIni.IfThen(Pos('where', CondicaoWhere) > 0, ' and ', ' where ') + Execucao + #13);

    ParteScript := Trim(ParteScript);
    Condicao := DadosIni.IfThen( (Copy(ParteScript, 1, 1) = '%') or (Copy(ParteScript, Length(ParteScript), 1) = '%'), 'like', '=');
    if ParteScript <> '' then
      ParteScript := 'upper(sqltext) ' + Condicao + ' upper(' + QuotedStr(ParteScript) + ')';
    CondicaoWhere := CondicaoWhere + DadosIni.IfThen( ParteScript = '', '',
      DadosIni.IfThen(Pos('where', CondicaoWhere) > 0, ' and ', ' where ') + ParteScript + #13);

    ParteErro := Trim(ParteErro);
    Condicao := DadosIni.IfThen( (Copy(ParteErro, 1, 1) = '%') or (Copy(ParteErro, Length(ParteErro), 1) = '%'), 'like', '=');
    if ParteErro <> '' then
      ParteErro := 'upper(logerro) ' + Condicao + ' upper(' + QuotedStr(ParteErro) + ')';
    CondicaoWhere := CondicaoWhere + DadosIni.IfThen( ParteErro = '', '',
      DadosIni.IfThen(Pos('where', CondicaoWhere) > 0, ' and ', ' where ') + ParteErro + #13);

    SQL.Clear;
    SQL.Add('select '' '' sel, versao_sistema, versao_script, nitem, ');
    SQL.Add('build, opcoes, execucao, sqltext, logerro              ');
    SQL.Add('from REESTRURURA_SQL                                   ');
    SQL.Add(CondicaoWhere);
    SQL.Add('order by versao_script, nitem');

    FManutencao.Close;
    FQuery_Manutencao.SQL.Text := SQL.Text;
    FManutencao.CommandText := SQL.Text;
    FManutencao.Open;

    FManutencao.EnableControls;

  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao realizar pesquisa. Erro: ' + e.Message), 'Anteção',
        MB_ICONWARNING + MB_OK);
    end;
  end;
end;

procedure TReestrutura.Reestruturar;
var
  UsarRepL, UsarRepLAnt, UsarDML, ForcarCommit, MudouUser, Continuar, Desativado,
    TentarSetTerm, ParametroCodEmpresa, ErroResolvido: Boolean;
  Count, CountErrosResolvidos: Integer;
  ErroTmp, RetornoDLL: string;
  ListEmpresas, DDLScript: TStrings;
  I: Integer;
  Tempo: TDateTime;
  charSet: WideString;

  function executarView: boolean;
  var
  	buscas, buscas2: TIBQuery;
    vNomeTabela, vNomeView, vScriptView: string;
    vRetornoDLL: string;

    function retonraNomeTabela: string;
    var
    	vscript: string;
      vtemp: string;
      J: Integer;
      vNomeTabEncontr: boolean;
    begin
      	vNomeTabEncontr := false;
        vscript := UpperCase(DDLScript.Text);
        System.Delete(vscript, 1, Pos('RDB$RELATION_NAME', UpperCase(DDLScript.Text)));
        vtemp := '';

        for J := 0 to Length(vscript) - 1 do
        begin
        	if (not vNomeTabEncontr) and (vscript[J] = '''') then
          	vNomeTabEncontr := true
          else if (vNomeTabEncontr) and (vscript[J] = '''') then
            Break
          else if vNomeTabEncontr then
          	vtemp := vtemp + vscript[J];
        end;
        vtemp := StringReplace(vtemp, ' , ', ', :', [rfReplaceAll, rfIgnoreCase]);
        
        Result := vtemp;
    end;
  begin
  	try
    	 Result := false;

       if (Pos('UPDATE ', UpperCase(DDLScript.Text)) > 0)
       	and (Pos(' RDB$FIELDS ', UpperCase(DDLScript.Text)) > 0)
        and (Pos('RDB$RELATION_NAME', UpperCase(DDLScript.Text)) > 0) then
       begin
         buscas := TIBQuery.Create(Application);
         buscas.Database := Query1.Database;
         buscas.Transaction := Query1.Transaction;

         buscas2 := TIBQuery.Create(Application);
         buscas2.Database := Query1.Database;
         buscas2.Transaction := Query1.Transaction;

         vNomeTabela := trim(retonraNomeTabela);
         vNomeView := '';
         vScriptView := '';

         if trim(vNomeTabela) <> '' then
         begin
           buscas.Close;
           buscas.SQL.Text := ' select distinct rdb$view_relations.rdb$view_name as nome_view from rdb$view_relations ' +
              ' where rdb$view_relations.rdb$relation_name = :nome_tabela ';
           buscas.ParamByName('nome_tabela').AsString := vNomeTabela;
           buscas.Open;
           buscas.FetchAll;

           if not buscas.IsEmpty then
           begin
            	buscas.First;
            	while not buscas.Eof do
              begin
                vNomeView := trim(buscas.FieldByName('nome_view').AsString);
                vScriptView := '';

                buscas2.Close;
                buscas2.SQL.Text := 'select first 1 rs.sqltext from reestrurura_sql rs' +
                                    ' where ( ((select result from pos(upper(''VIEW ' + vNomeView + ' ''), substring(upper(rs.sqltext) from 1 for 55))) > 0) or' +
                                    '         ((select result from pos(upper(''VIEW ' + vNomeView + '(''), substring(upper(rs.sqltext) from 1 for 55))) > 0) )' +
                                    ' and (select result from pos(''INATIVO'', coalesce(rs.opcoes, ''''))) = 0' +
                                    ' order by rs.versao_script desc, rs.nitem desc';
                buscas2.Open;

                if not buscas2.IsEmpty then
                begin
                  vScriptView := buscas2.FieldByName('sqltext').AsString;

                  vRetornoDLL := hw_sql_script_exec_charSet(WideString(FEnderecoBanco), WideString(GetUserDataBase(False)), WideString(GetPasswordDataBase), charSet, WideString(vScriptView), (ForcarCommit));
                  //vRetornoDLL := hw_sql_script_exec(WideString(FEnderecoBanco), WideString(GetUserDataBase(False)), WideString(GetPasswordDataBase), WideString(vScriptView), (ForcarCommit));

                  if (vRetornoDLL <> 'OK') then
                  begin
                    LogErro.Add(' Erro recriar view ' + vNomeTabela);
                    LogErro.Add('SET TERM: NO -> ERROR');
                    LogErro.Add(vRetornoDLL);
                    LogErro.Add('-- ERROR');

                    if (Pos('SET TERM ^', UpperCase(Trim(vScriptView))) = 0) then
                    begin
                      vScriptView := 'SET TERM ^ ; ' + vScriptView + ' ^ SET TERM ; ^';
                      vRetornoDLL := hw_sql_script_exec_charSet(WideString(FEnderecoBanco), WideString(GetUserDataBase(False)), WideString(GetPasswordDataBase), charSet, WideString(vScriptView), (ForcarCommit));

                      if vRetornoDLL <> 'OK' then
                      begin
                        LogErro.Add('SET TERM: YES -> ERROR');  
                        LogErro.Add(vRetornoDLL);
                        LogErro.Add('-- ERROR');
                      end
                      else
                        LogErro.Add('SET TERM: YES -> SUCESSO');
                    end;
                  end;
                end;
                buscas.Next;
              end;
           end;
         end;
       end;
       Result := true;
    except on E: Exception do
      begin
      	Result := false;
        DadosIni.registraErro('TReestrutura.executarView. Tab ' +  vNomeTabela +
        	' View ' + vNomeView +
          ' - Erro: ' + E.Message +
        	DadosIni.IfThen(trim(vScriptView) <> '', ' Script: ' + vScriptView, ''));
      end;
  	end;
  end;

  procedure testarErros;
  begin
    //Erros
    if ContainsText(RetornoDLL, 'violation of FOREIGN KEY constraint') and
       ContainsText(RetornoDLL, ' on table ') and
       ContainsText(RetornoDLL, 'Foreign key reference target does not exist') then
       RetornoDLL := RetornoDLL
    else if (Pos('VIOLATION OF PRIMARY OR UNIQUE KEY CONSTRAINT', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK'  //incluir - registro existente
  	else if (Pos('ATTEMPT TO STORE DUPLICATE VALUE', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK'  //criar - campo, trigger e udf existente
    else if (Pos('TABLE ', UpperCase(RetornoDLL)) > 0) and (Pos('ALREADY EXISTS', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //criar - tabela e view existente
    else if (Pos('INDEX ', UpperCase(RetornoDLL)) > 0) and (Pos('ALREADY EXISTS', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //criar - chave primária, chave estrangeira e index existente
    else if (Pos('GENERATOR ', UpperCase(RetornoDLL)) > 0) and (Pos('ALREADY EXISTS', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //criar - generator existente
    else if (Pos('PROCEDURE ', UpperCase(RetornoDLL)) > 0) and (Pos('ALREADY EXISTS', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //criar - procedure existente
    else if (Pos('EXCEPTION ', UpperCase(RetornoDLL)) > 0) and (Pos('ALREADY EXISTS', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //criar - exception existente
    else if (Pos('COLUMN ', UpperCase(RetornoDLL)) > 0) and (Pos('DOES NOT EXIST IN TABLE/VIEW', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //deletar - campo naõ existe em tabela e view
    else if ContainsText(RetornoDLL, 'Invalid command.') and
      (Pos('TABLE ', UpperCase(RetornoDLL)) > 0) and (Pos('DOES NOT EXIST', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //deletar - tabela não existe
    else if (Pos('INDEX NOT FOUND', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //deletar - index não existe
    else if (Pos('GENERATOR' , UpperCase(RetornoDLL)) > 0) and (Pos('NOT FOUND', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //deletar - generator não existe
    else if (Pos('VIEW ', UpperCase(RetornoDLL)) > 0) and (Pos('DOES NOT EXIST', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //alterar e deletar - view não existe
    else if (Pos('PROCEDURE ', UpperCase(RetornoDLL)) > 0) and (Pos('NOT FOUND', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //alterar e deletar - procedure não existe
    else if (Pos('CONSTRAINT ', UpperCase(RetornoDLL)) > 0) and (Pos('DOES NOT EXIST', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //deletar - chave estrangeira não existe
    else if (Pos('EXCEPTION NOT FOUND', UpperCase(RetornoDLL)) > 0) then
      RetornoDLL := 'OK' //deletar - exception não existe
    else if (Pos('STORE RDB$RELATION_CONSTRAINTS FAILED', UpperCase(RetornoDLL)) > 0) and (Pos('TO PRESERVE DATA INTEGRITY', UpperCase(RetornoDLL)) > 0) then
    	RetornoDLL := 'OK'; //inclur - chave existe
  end;

begin
  //Metodo de execucao dos scripts no banco de dados
  try
    //UsarRepLAnt serve de comparacao com outra variavel pra saber se do banco mudou, se mudar comita antes de desconectar
    UsarRepLAnt := not Pos('|REPL', Script.FieldByName('opcoes').AsString) > 0;
    FCountErros := 0;
    CountErrosResolvidos := 0;

    if Script.IsEmpty then
      Exit;

    //Conectando como sysdba antes para saber quantas empresas possuem no banco
    if not ConectaBanco(Banco, EnderecoBanco, False, False) then
      Exit;

    ExecutarSnapShot();

    charSet := WideString(DadosIni.GetIni('Banco', 'CharSet', 'WIN1252'));

    Query1.Close;
    if FSistema = 'Fiscal' then
      Query1.SQL.Text := 'select distinct cod_empresa from terminalf order by cod_empresa'
    else
      Query1.SQL.Text := 'select cod_empresa from empresa order by cod_empresa';
    Query1.Open;
    ListEmpresas := TStringList.Create;
    ListEmpresas.Clear;
    Query1.First;
    while not Query1.Eof do
    begin
      ListEmpresas.Add(IntToStr(Query1.FieldByName('cod_empresa').AsInteger));
      Query1.Next;
    end;
    if ListEmpresas.Count = 0 then
      ListEmpresas.Add('1');

    //List para chamar a dll do IBSCript
    // Pois o IBSCript desta versao do Delphi(2006) nao executa corretamente alguns scripts
    DDLScript := TStringList.Create;

    FDadosIni.registraLog('Script de reestruturação ' + DateTimeToStr(Now) + sLineBreak, True);

    Script.First;
    while not Script.Eof do
    begin
      Continuar := True;
       if Assigned(FOnWorkEvent) then
       begin
         Count := Script.RecNo;
         FOnWorkEvent(Count);
       end;

       // Leitura dos parametros para execucao do script
      UsarRepL     := Pos('|REPL'   , Script.FieldByName('opcoes').AsString) > 0;
      UsarDML      := Pos('|DML'    , Script.FieldByName('opcoes').AsString) > 0;
      ForcarCommit := Pos('|COMMIT' , Script.FieldByName('opcoes').AsString) > 0;
      Desativado   := Pos('|INATIVO', Script.FieldByName('opcoes').AsString) > 0;

      MudouUser := UsarRepL <> UsarRepLAnt;

      FDadosIni.registraLog('>>>> ' + Script.FieldByName('opcoes').AsString + sLineBreak + Script.FieldByName('script').AsString);
      Tempo := Now;

//      if (MudouUser) or ((Script.RecNo mod 50) = 0) or (not Banco.Connected) then
      if (MudouUser) or (not Banco.Connected) then
      begin
        if Transacao.InTransaction then
          Transacao.Commit;
        Banco.ForceClose;
        Continuar := ConectaBanco(Banco, EnderecoBanco, False, False);//UsarRepL);
      end;
      if Desativado then
      begin
        Continuar := False;
        RegistraInativoScript;
      end
      else if DadosIni.strIn(Script.FieldByName('execucao').AsString, ['Sucesso', 'Manual']) then
        Continuar := False;

      if Continuar then
      begin
        ParametroCodEmpresa := Pos(':COD_EMPRESA', UpperCase(Script.FieldByName('script').AsString)) > 0;
        if not UsarDML then
        begin
          for I := 0 to ListEmpresas.Count - 1 do
          begin
            DDLScript.Text := Script.FieldByName('script').AsString;
            while Pos(':COD_EMPRESA', UpperCase(DDLScript.Text)) > 0 do
              DDLScript.Text := Copy(DDLScript.Text, 1, Pos(':COD_EMPRESA', UpperCase(DDLScript.Text)) - 1) + ListEmpresas[i] +
                                Copy(DDLScript.Text, Pos(':COD_EMPRESA', UpperCase(DDLScript.Text)) + 12, Length(DDLScript.Text));

//            if ParametroCodEmpresa then
//              DDLScript.Text := StringReplace(UpperCase(Script.FieldByName('script').AsString), ':COD_EMPRESA', ListEmpresas[i], [rfReplaceAll])
//            else
//              DDLScript.Text := Script.FieldByName('script').AsString;
            try

              RetornoDLL := hw_sql_script_exec_charSet(WideString(FEnderecoBanco), WideString(GetUserDataBase(UsarRepL)), WideString(GetPasswordDataBase), charSet, WideString(DDLScript.Text), (ForcarCommit) or ((Script.RecNo mod 50) = 0));

              if (RetornoDLL <> 'OK') and (UsarRepL) then
              begin
                if RetornoDLL <> 'OK' then
                	testarErros;

                if RetornoDLL <> 'OK' then
	                RetornoDLL := hw_sql_script_exec_charSet(WideString(FEnderecoBanco), WideString(GetUserDataBase(False)), WideString(GetPasswordDataBase), charSet, WideString(DDLScript.Text), (ForcarCommit) or ((Script.RecNo mod 50) = 0));

                if RetornoDLL <> 'OK' then
                	testarErros;
                  
                if RetornoDLL <> 'OK' then
                  raise exception.Create(PChar(RetornoDLL));
              end
              else
              begin
                if RetornoDLL <> 'OK' then
                	testarErros;
                  
	              if (RetornoDLL <> 'OK') then
  	              raise exception.Create(PChar(RetornoDLL));
              end;
//              if (RetornoDLL = 'OK') then
//              	executarView;
              RegistraSucessoScript;
            except on E: Exception do
              begin
                FCountErros := FCountErros + 1;
                ErroResolvido := False;
                TentarSetTerm := (DDLScript.Count > 1) and
                  (Pos('SET TERM ^', UpperCase(Trim(DDLScript.Text))) = 0); //Para nao colocar usar set term quando for apenas uma linha

                if TentarSetTerm then
                  ErroTmp := 'SET TERM: NO -> ' + e.Message
                else
                  ErroTmp := E.Message;

                LogErro.Add('Versao: ' + DadosIni.StrZero(IntToStr(Script.FieldByName('versao').AsInteger), 3) +
                  ' - Build: ' + DadosIni.StrZero(IntToStr(Script.FieldByName('build').AsInteger), 2) +
                  ' - Linha: ' + DadosIni.StrZero(IntToStr(Script.FieldByName('nitem').AsInteger), 3) +
                  DadosIni.IfThen(UsarRepL, ' - USER: REPL', '') +
                  ' - DDL' + DadosIni.IfThen(ParametroCodEmpresa, ' - Emp: ' + ListEmpresas[I], '' ));
                if TentarSetTerm then
                  LogErro.Add('SET TERM: NO -> ERROR')
                else
                  LogErro.Add('-> ERROR');
                LogErro.Add(e.Message);
                LogErro.Add('-- ERROR');

                if (TentarSetTerm) then
                begin
                  DDLScript.Clear;
                  DDLScript.Text := 'SET TERM ^ ; ' + Script.FieldByName('script').AsString + ' ^ SET TERM ; ^';
                  try

                    RetornoDLL := hw_sql_script_exec_charSet(WideString(FEnderecoBanco), WideString(GetUserDataBase(UsarRepL)), WideString(GetPasswordDataBase), charSet, WideString(DDLScript.Text), (ForcarCommit) or ((Script.RecNo mod 50) = 0));

                    if (RetornoDLL <> 'OK') and (UsarRepL) then
                    begin
                      RetornoDLL := hw_sql_script_exec_charSet(WideString(FEnderecoBanco), WideString(GetUserDataBase(False)), WideString(GetPasswordDataBase), charSet, WideString(DDLScript.Text), (ForcarCommit) or ((Script.RecNo mod 50) = 0));
                      if RetornoDLL <> 'OK' then
                        raise exception.Create(PChar(RetornoDLL));
                    end
                    else
                    if RetornoDLL <> 'OK' then
                      raise exception.Create(PChar(RetornoDLL));

                    LogErro.Add('SET TERM: YES -> SUCESSO');
                    ErroResolvido := True;
                  except on F: Exception do
                    begin
                      ErroTmp := ErroTmp + #13 + 'SET TERM: YES -> ' + e.Message;
                      LogErro.Add('SET TERM: YES -> ERROR');
                      LogErro.Add(e.Message);
                      LogErro.Add('-- ERROR');
                    end;
                  end;
                end;
                LogErro.Add('--SCRIPT--');
                LogErro.Add(Script.FieldByName('script').AsString);
                RegistraErroScript(ErroTmp);
                if ErroResolvido then
                begin
                  FCountErros := FCountErros - 1;
                  CountErrosResolvidos := CountErrosResolvidos + 1;
                  RegistraSucessoScript;
                end;
              end;
            end;
            if not ParametroCodEmpresa then
              Break;
          end;
        end
        else
        begin
          for I := 0 to ListEmpresas.Count - 1 do
          begin
            DML.Close;
            if ParametroCodEmpresa then
              DML.SQL.Text := StringReplace(UpperCase(Script.FieldByName('script').AsString), ':COD_EMPRESA', ListEmpresas[i], [rfReplaceAll])
            else
              DML.SQL.Text := Script.FieldByName('script').AsString;
            try
              try
                DML.ExecSQL;
              except on E: Exception do
                begin
                  if UsarRepL then // caso o erro foi com o usuario repl, entao o sistema tenta com o usuario normal
                  begin
                    if Transacao.InTransaction then
                      Transacao.Commit;
                    Banco.ForceClose;
                    if ConectaBanco(Banco, EnderecoBanco, False, False) then
                      DML.ExecSQL
                    else
                      raise exception.Create(e.Message);
                  end
                  else
                    raise exception.Create(e.Message);
                end;
              end;
              RegistraSucessoScript;
            except on E: Exception do
              begin
                FCountErros := FCountErros + 1;
                LogErro.Add('Versao: ' + DadosIni.StrZero(IntToStr(Script.FieldByName('versao').AsInteger), 3) +
                  ' - Build: ' + DadosIni.StrZero(IntToStr(Script.FieldByName('build').AsInteger), 2) +
                  ' - Linha: ' + DadosIni.StrZero(IntToStr(Script.FieldByName('nitem').AsInteger), 3) +
                  DadosIni.IfThen(UsarRepL, ' - USER: REPL', '') +
                  ' - DML' + DadosIni.IfThen(ParametroCodEmpresa, ' - Emp: ' + ListEmpresas[I], '' ));
                LogErro.Add('-> ERROR');
                LogErro.Add(e.Message);
                LogErro.Add('-- ERROR');
                LogErro.Add('--SCRIPT--');
                LogErro.Add(Script.FieldByName('script').AsString);
                RegistraErroScript(E.Message);
              end;
            end;
            if not ParametroCodEmpresa then
              Break;
          end;
        end;
      end;

      if (ForcarCommit) or ((Script.RecNo mod 50) = 0) then
        if Transacao.InTransaction then
        begin
          Transacao.Commit;
          Banco.ForceClose;
        end;

      UsarRepLAnt := UsarRepL;

      FDadosIni.registraLog(FormatDateTime('hh:mm:ss.zzz', (Now - Tempo)) + ' <<<<' + sLineBreak);

      Script.Next;
    end;
    if Transacao.InTransaction then
    begin
      Transacao.Commit;
      Banco.ForceClose;
    end;

    RegistraReestruturacao;

    if (FCountErros > 0) or (CountErrosResolvidos > 0) then
    begin
      LogErro.Insert(0, '');
      if (CountErrosResolvidos > 0) then
        LogErro.Insert(0, 'Total de erros resolvidos com SET TERM...: ' + IntToStr(CountErrosResolvidos));
      if (FCountErros > 0) then
        LogErro.Insert(0, 'Total de erros de execução nao resolvidos: ' + IntToStr(FCountErros));
    end;

  finally
    hw_sql_script_free;
    Banco.ForceClose;
  end;
end;

procedure TReestrutura.RegistraErroScript(Erro: string);
begin
  try
    Script.Edit;
    Script.FieldByName('erro').AsString := Erro;
    Script.FieldByName('execucao').AsString := 'Erro';
    Script.FieldByName('update').AsString := 'S';
    Script.Post;
  except on E: Exception do
    begin
      DadosIni.registraErro('TReestrutura.RegistraErroScript:Erro do Paramentro:' + Erro + ' Erro do metodo:' + e.Message);
    end;
  end;
end;

procedure TReestrutura.RegistraInativoScript;
begin
  try
    Script.Edit;
    Script.FieldByName('execucao').AsString := 'Inativo';
    Script.FieldByName('update').AsString := 'S';
    Script.Post;
  except on E: Exception do
    begin
      DadosIni.registraErro('TReestrutura.RegistraSucessoScript:' + e.Message);
    end;
  end;
end;

procedure TReestrutura.RegistraReestruturacao;
var
  ListVer, SqlInsert, SqlUpdate: TStrings;
  I, Build : Integer;
  DataHora: string;

  procedure RegistraVersao;
  var
    MD5Bpl: string;
  begin
    Query1.Close;
    Query1.SQL.Text := 'select * from REESTRURURA_VER' +
      ' where versao_script = :versao_script';
    Query1.ParamByName('versao_script').AsInteger := StrToInt(DadosIni.getValue(ListVer[I], 1));
    Query1.Open;
    MD5Bpl := Copy(Query1.FieldByName('md5bpl').AsString, 1, 32);
    if Build = 0 then
      Build := Query1.FieldByName('build').AsInteger;
    if Query1.IsEmpty then
    begin
      Query1.SQL.Clear;
      Query1.SQL.Add('insert into REESTRURURA_VER');
      Query1.SQL.Add('(versao_script, build, erro, md5bpl)');
      Query1.SQL.Add(' values ');
      Query1.SQL.Add('(:versao_script, :build, :erro, :md5bpl)');
    end
    else
    begin
      Query1.SQL.Clear;
      Query1.SQL.Add('update REESTRURURA_VER ');
      Query1.SQL.Add('set build = :build, erro = :erro, md5bpl = :md5bpl ');
      Query1.SQL.Add('where ');
      Query1.SQL.Add('versao_script = :versao_script');
    end;
    try
      Query1.ParamByName('versao_script').AsInteger := StrToInt(DadosIni.getValue(ListVer[I], 1));
      Query1.ParamByName('build').AsInteger := Build;
      Query1.ParamByName('erro').AsString := DadosIni.IfThen(DadosIni.getValue(ListVer[I], 2) = 'True', 'S', 'N');
      if (FLastVersion > 0) and (FLastVersion = Query1.ParamByName('versao_script').AsInteger)  then
        MD5Bpl := Copy(Trim(string(_getMd5File(ExtractFilePath(Application.ExeName) + 'pkReestrutura.bpl'))), 1, 32);
      Query1.ParamByName('md5bpl').AsString := MD5Bpl;
      Query1.ExecSQL;
    except on E: Exception do
      begin
        LogErro.Add('Versao: ' + DadosIni.StrZero(DadosIni.getValue(ListVer[I], 1), 3) +
          '- Build: ' + DadosIni.StrZero(IntToStr(Build), 2) +
          '- Erro: Falha ao registrar Versao SQL');
        LogErro.Add('-> ERROR');
        LogErro.Add(e.Message);
        LogErro.Add('-- ERROR');
      end;
    end;
  end;

  procedure RegistraManifesto();
  begin
    Query1.Close;
    Query1.SQL.Text :=
      'UPDATE OR INSERT INTO CONFIG_SISTEMA' +
      ' (CHAVE, COD_EMPRESA, DISPLAY_, TAG, TYPE1_, VALUE1_B, ATIVO)' +
      ' VALUES' +
      ' (:CHAVE, 0, :DISPLAY_, :TAG, :TYPE1_, :VALUE1_B, 0)' +
      ' MATCHING (CHAVE, COD_EMPRESA)';
    Query1.ParamByName('CHAVE').AsString := 'reestrutura_manifest';
    Query1.ParamByName('DISPLAY_').AsString := 'Arquivo manifesto reestruturacao';
    Query1.ParamByName('TAG').AsString := 'manifesto;reestruturacao';
    Query1.ParamByName('TYPE1_').AsString := 'blob';
    Query1.ParamByName('VALUE1_B').AsString := ReadResouceTXT('MANIFEST');
    Query1.ExecSQL;
  end;

begin
  ListVer := TStringList.Create;
  TStringList(ListVer).Duplicates := dupIgnore;
  TStringList(ListVer).Sorted := True;
  try
    Banco.ForceClose;
    ConectaBanco(Banco, FEnderecoBanco, False, False);

    Query1.Close;
    Query1.SQL.Text := 'select fh.current_ts as datahora from sp_current_ts fh';
    Query1.Open;

    DataHora := '<-' + FormatDateTime('dd/mm/yyyy hh:mm:ss',
      DadosIni.IfThen(Query1.FieldByName('datahora').AsDateTime > 0, Query1.FieldByName('datahora').AsDateTime, Now));

    Build := Script.FieldByName('build').AsInteger;
    Script.First;
    while not Script.Eof do
    begin
      ListVer.Add('|' + IntToStr(Script.FieldByName('versao').AsInteger) + '|False|');
      if Script.FieldByName('build').AsInteger > Build then
        Build := Script.FieldByName('build').AsInteger;
      Script.Next;
    end;

    SqlInsert := TStringList.Create;
    SqlInsert.Clear;
    SqlInsert.Add('insert into REESTRURURA_SQL');
    SqlInsert.Add('(versao_script, nitem, versao_sistema, build, opcoes, execucao, sqltext, logerro)');
    SqlInsert.Add(' values ');
    SqlInsert.Add('(:versao_script, :nitem, :versao_sistema, :build, :opcoes, :execucao, :sqltext, :logerro)');

    SqlUpdate := TStringList.Create;
    SqlUpdate.Add('update REESTRURURA_SQL set');
    SqlUpdate.Add(' opcoes = :opcoes, execucao = :execucao, logerro = :logerro');
    SqlUpdate.Add(' where');
    SqlUpdate.Add(' versao_script = :versao_script and nitem = :nitem');

    for I := 0 to ListVer.Count - 1 do
    begin

      try
        Script.Filter := 'versao = ' + DadosIni.getValue(ListVer[I], 1);
        Script.Filtered := True;
        Script.First;

        Build := Script.FieldByName('build').AsInteger;
        Script.First;
        while not Script.Eof do
        begin
          if Script.FieldByName('build').AsInteger > Build then
            Build := Script.FieldByName('build').AsInteger;
          Script.Next;
        end;
        RegistraVersao;

        Script.Filtered := False;
        Script.Filter := 'versao = ' + DadosIni.getValue(ListVer[I], 1) + ' and update = ''S''';
        Script.Filtered := True;
        Script.First;
        while not Script.Eof do
        begin
          Query1.Close;
          Query1.SQL.Text := 'select versao_script, logerro from REESTRURURA_SQL' +
            ' where versao_script = ' + IntToStr(Script.FieldByName('versao').AsInteger) +
            ' and nitem = ' + IntToStr(Script.FieldByName('nitem').AsInteger);
          Query1.Open;
          if Query1.IsEmpty then
            Query2.SQL.Text := SqlInsert.Text
          else
            Query2.SQL.Text := SqlUpdate.Text;

          if Query1.IsEmpty then
          begin
            Query2.ParamByName('versao_sistema').AsString := VersaoBPL;
            Query2.ParamByName('build').AsInteger         := Script.FieldByName('build').AsInteger;
            Query2.ParamByName('sqltext').AsString        := Script.FieldByName('script').AsString;
            Query2.ParamByName('logerro').AsString        := DadosIni.IfThen(Trim(Script.FieldByName('erro').AsString) <> '', Script.FieldByName('erro').AsString + DataHora, '');
          end
          else
          begin
            Query2.ParamByName('logerro').AsString      := Query1.FieldByName('logerro').AsString +
              DadosIni.IfThen((Trim(Query1.FieldByName('logerro').AsString) = '') and
                               (Trim(Script.FieldByName('erro').AsString) = ''), '', #13) +
              DadosIni.IfThen((Trim(Script.FieldByName('erro').AsString) <> ''), Script.FieldByName('erro').AsString + DataHora, '');
          end;
          Query2.ParamByName('versao_script').AsInteger := Script.FieldByName('versao').AsInteger;
          Query2.ParamByName('nitem').AsInteger         := Script.FieldByName('nitem').AsInteger;
          Query2.ParamByName('opcoes').AsString         := Script.FieldByName('opcoes').AsString;
          Query2.ParamByName('execucao').AsString       := Script.FieldByName('execucao').AsString;
          try
            Query2.ExecSQL;
          except on E: Exception do
            begin
              ListVer[I] := '|' + DadosIni.getValue(ListVer[I], 1) + '|True|';
              LogErro.Add('Versao: ' + DadosIni.StrZero(IntToStr(Script.FieldByName('versao').AsInteger), 3) +
                '- Build: ' + DadosIni.StrZero(IntToStr(Script.FieldByName('build').AsInteger), 2) +
                '- Linha: ' + DadosIni.StrZero(IntToStr(Script.FieldByName('nitem').AsInteger), 3) +
                '- Erro: Falha ao registrar Script SQL');
              LogErro.Add('-> ERROR');
              LogErro.Add(e.Message);
              LogErro.Add('-- ERROR');
            end;
          end;
          Script.Next;
        end;

        RegistraVersao;

      finally
        Script.Filtered := False;
        Script.Filter := '';
      end;
    end;

    RegistraManifesto();

    if Transacao.InTransaction then
      Transacao.Commit;

  except on E: Exception do
    begin
      DadosIni.registraErro('TReestrutura.RegistraSucessoScript:' + e.Message);
    end;
  end;
end;

procedure TReestrutura.RegistraSucessoScript;
begin
  try
    Script.Edit;
    Script.FieldByName('execucao').AsString := 'Sucesso';
    Script.FieldByName('update').AsString := 'S';
    Script.Post;
  except on E: Exception do
    begin
      DadosIni.registraErro('TReestrutura.RegistraSucessoScript:' + e.Message);
    end;
  end;
end;

function TReestrutura.ValidarSenhaHw: Boolean;
var
  Senha: string;
begin
  if Sistema = 'Fiscal' then
  begin
    Result := True;
    Exit;
  end;

  if (Banco.DatabaseName <> FEnderecoBanco) or (not Banco.Connected) then
    ConectaBanco(Banco, FEnderecoBanco, False, False);

  Result := False;

  Senha:= '';
  Application.CreateForm(TfrmReestrutura_HwSenha, frmReestrutura_HwSenha);
  try
    if frmReestrutura_HwSenha.ShowModal = IDOK then
    begin
     Senha := frmReestrutura_HwSenha.Edit1.Text;
     if Trim(Senha) = '' then
     begin
       Application.MessageBox('Senha do usuário "HW" não informada', 'Atenção', 0 +64);
       Exit;
     end;
    end
    else
      Exit;
  finally
    FreeAndNil(frmReestrutura_HwSenha);
  end;

  Query1.Close;
  Query1.SQL.Text := 'select usuario from senhas where usuario = ''HW'' and senha = ' + QuotedStr(DadosIni.codifica(UpperCase(Senha)));
  Query1.Open;
  Result := Trim(Query1.FieldByName('usuario').AsString) = 'HW';
  Query1.Close;
  if not Result then
    Application.MessageBox('Usuário HW não encontrado ou senha inválida', 'Atenção', 0 +64);
end;

function TReestrutura.VerificarVersao(Versao, Build: Smallint; UltimaVersao: Boolean): Boolean;
begin
  Result := False;
  if Versao <= 0 then
    raise exception.Create('Versao do Reestrutura não definida');
  if Build <= 0 then
    raise exception.Create('Build do Reestrutura não definido');

  Query1.Close;
  Query1.SQL.Text := 'select * from REESTRURURA_VER' +
    ' where VERSAO_SCRIPT = ' + IntToStr(Versao);
  try
    Query1.Open;
    if Query1.IsEmpty then
      Result := True
    else if Query1.FieldByName('erro').AsString = 'S' then
      Result := True
    else if Query1.FieldByName('build').AsInteger < Build then
      Result := True
    else if UltimaVersao then
      if DadosIni.GetIni('MD', 'VMBR', 'N') = 'S' then //VerificarMD5BplReestrutura
      if Copy(Trim(Query1.FieldByName('md5bpl').AsString),1,32) <> Copy(Trim(string(_getMd5File(ExtractFilePath(Application.ExeName) + 'pkReestrutura.bpl'))),1,32) then
        Result := True;
  finally
    Query1.Close;
  end;
end;

procedure TReestrutura.Verificar_Versao(startVersion, endVersion: Integer);
var
  formVersion: TfrmReestruturaVersao;
  ListFormVersion: TStrings;
  I, iform: Integer;
begin
  if FSistema = 'Hwauto' then
    FEnderecoBanco := DadosIni.GetIni('Banco', 'HW', '')
  else if FSistema = 'HWF' then
  begin
    if Trim(FEnderecoBancoUsuario) <> '' then
      FEnderecoBanco := FEnderecoBancoUsuario
    else
      FEnderecoBanco := DadosIni.GetIni('Banco', 'HWF', '');
  end
  else if FSistema = 'Fiscal' then
  begin
    if Trim(FEnderecoBancoUsuario) <> '' then
      FEnderecoBanco := FEnderecoBancoUsuario
    else
      FEnderecoBanco := DadosIni.GetIni('Banco', 'Fiscal', '');
  end
  else
    raise Exception.Create('Reestrutura - Sistema não definido para localizar o banco de dados');

  try
    LogErro.Clear;
    FCountErros := 0;
    try
      Script.EmptyDataSet;
      if not ConectaBanco(Banco, EnderecoBanco, True, False) then
        Exit;

      //Verificando os formularios de versao que possuem scripts
      ListFormVersion := TStringList.Create;
      ListFormVersion.Clear;
      for iform := startVersion to endVersion do
      begin
        FLastVersion := iform;
        if GetClass('TfrmReestruturaVersao' + IntToStr(FLastVersion)) <> nil then
          ListFormVersion.Add('TfrmReestruturaVersao' + IntToStr(FLastVersion));
      end;

      for I := 0 to ListFormVersion.Count - 1 do
      begin
        if formVersion <> nil then
          FreeAndNil(formVersion);
        Application.CreateForm(TComponentClass(GetClass(ListFormVersion[I])), formVersion);
        if VerificarVersao(formVersion.Versao, formVersion.Build, True) then
          MontarScript(formVersion);
      end;
      if formVersion <> nil then
        FreeAndNil(formVersion);

      LoadScriptsFromResource(startVersion, endVersion);

    finally
      Banco.ForceClose;
      ListFormVersion.Free();
    end;

    for iform := startVersion to endVersion do
    begin
      Query1.Close;
      Query1.SQL.Text := Format('select nitem from REESTRURURA_SQL' +
                                ' where VERSAO_SCRIPT = %d', [iform]);
      Query1.Open;

      Query1.First;
      while not Query1.Eof do
      begin
        if Query1.FieldByName('nitem').AsInteger > 0 then
        begin
          Script.Filter := Format('versao = %d and nitem = %d', [iform, Query1.FieldByName('nitem').AsInteger]);
          Script.Filtered := True;
          while not Script.IsEmpty do
            Script.Delete;
        end;
        Query1.Next;
      end;
    end;

    Script.Filter := '';
    Script.Filtered := False;

    Script.First;
    if Script.RecordCount > 0 then
    begin

      Application.CreateForm(TfrmReestrutura_Aplicar, frmReestrutura_Aplicar);
      frmReestrutura_Aplicar.ShowModal;

      if LogErro.Count > 0 then
        LogErro.SaveToFile(ExtractFilePath(Application.ExeName) + 'ErroReestrutura_' + Sistema + '.log');

      if (FCountErros > 0) and (LogErro.Count > 0) and
        (FileExists(ExtractFilePath(Application.ExeName) + 'ErroReestrutura_' + Sistema + '.log')) then
        if Application.MessageBox('Houve falhas na reestruturação. Visualizar o log?', 'Confirmação',
          MB_ICONQUESTION + MB_YESNO) = ID_YES then
          WinExec(PChar('notepad.exe ' + ExtractFilePath(Application.ExeName) + 'ErroReestrutura_' + Sistema + '.log'), SW_SHOWNORMAL);
    end;

  except on E: Exception do
    begin
      DadosIni.registraErro('TReestrutura.Verificar_versao. Erro: ' + E.Message);
      Application.MessageBox(PChar('Erro ao verificar versão. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

procedure TReestrutura.SetDadosIni(const Value: TDadosIni);
begin
  FDadosIni := Value;
end;

procedure TReestrutura.SetDataSource(const Value: TDataSource);
begin
  FDataSource_Script := Value;
end;

procedure TReestrutura.SetDataSource_Manutencao(const Value: TDataSource);
begin
  FDataSource_Manutencao := Value;
end;

procedure TReestrutura.SetEnderecoBanco(const Value: string);
begin
  FEnderecoBanco := Value;
end;

procedure TReestrutura.SetEnderecoBancoUsuario(const Value: string);
begin
  FEnderecoBancoUsuario := Value;
end;

procedure TReestrutura.SetManutencao(const Value: TClientDataSet);
begin
  FManutencao := Value;
end;

procedure TReestrutura.SetOnWorkEvent(const Value: TWorkEvent);
begin
  FOnWorkEvent := Value;
end;

procedure TReestrutura.SetSistema(const Value: string);
begin
  FSistema := Value;
end;

procedure TReestrutura.SetVersaoBPL(const Value: string);
begin
  FVersaoBPL := Value;
end;

procedure TReestrutura.Verificar_Versao;
var
  formVersion: TfrmReestruturaVersao;
  ListFormVersion: TStrings;
  I: Integer;
begin
  if FSistema = 'Hwauto' then
    FEnderecoBanco := DadosIni.GetIni('Banco', 'HW', '')
  else if FSistema = 'HWF' then
  begin
    if Trim(FEnderecoBancoUsuario) <> '' then
      FEnderecoBanco := FEnderecoBancoUsuario
    else
      FEnderecoBanco := DadosIni.GetIni('Banco', 'HWF', '');
  end
  else if FSistema = 'Fiscal' then
  begin
    if Trim(FEnderecoBancoUsuario) <> '' then
      FEnderecoBanco := FEnderecoBancoUsuario
    else
      FEnderecoBanco := DadosIni.GetIni('Banco', 'Fiscal', '');
  end
  else
    raise Exception.Create('Reestrutura - Sistema não definido para localizar o banco de dados');

  try
    LogErro.Clear;
    FCountErros := 0;
    try
      Script.EmptyDataSet;
      if not ConectaBanco(Banco, EnderecoBanco, True, False) then
        Exit;

      //Verificando os formularios de versao que possuem scripts
      ListFormVersion := TStringList.Create;
      ListFormVersion.Clear;
      FLastVersion := GetLastVersionDB - 1;
      while GetClass('TfrmReestruturaVersao' + IntToStr(FLastVersion + 1)) <> nil do
      begin
        FLastVersion := FLastVersion + 1;
        ListFormVersion.Add('TfrmReestruturaVersao' + IntToStr(FLastVersion));
      end;

      for I := 0 to ListFormVersion.Count - 1 do
      begin
        if formVersion <> nil then
          FreeAndNil(formVersion);
        Application.CreateForm(TComponentClass(GetClass(ListFormVersion[I])), formVersion);
        if VerificarVersao(formVersion.Versao, formVersion.Build, (I + 1) = FLastVersion) then
          MontarScript(formVersion);
      end;
      if formVersion <> nil then
        FreeAndNil(formVersion);

      LoadScriptsFromResource();

    finally
      Banco.ForceClose;
      ListFormVersion.Free();
    end;

    if Script.RecordCount > 0 then
    begin
      Application.CreateForm(TfrmReestrutura_Aplicar, frmReestrutura_Aplicar);
      frmReestrutura_Aplicar.ShowModal;

      if LogErro.Count > 0 then
        LogErro.SaveToFile(ExtractFilePath(Application.ExeName) + 'ErroReestrutura_' + Sistema + '.log');

      if (FCountErros > 0) and (LogErro.Count > 0) and
        (FileExists(ExtractFilePath(Application.ExeName) + 'ErroReestrutura_' + Sistema + '.log')) then
        if Application.MessageBox('Houve falhas na reestruturação. Visualizar o log?', 'Confirmação',
          MB_ICONQUESTION + MB_YESNO) = ID_YES then
          WinExec(PChar('notepad.exe ' + ExtractFilePath(Application.ExeName) + 'ErroReestrutura_' + Sistema + '.log'), SW_SHOWNORMAL);
    end;

  except on E: Exception do
    begin
      DadosIni.registraErro('TReestrutura.Verificar_versao. Erro: ' + E.Message);
      Application.MessageBox(PChar('Erro ao verificar versão. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

{ TDadosIni }

function TDadosIni.codifica(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));
  wnormal := '  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*:\/.';
  wcripto := 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºusabcd';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  codifica := wresultado;
end;

procedure TDadosIni.DBGridOnTitleClick(DBGrid: TDBGrid; Column: TColumn);
var
  i, k: integer; vTemp,vNomeIdx: string;
begin
  if TClientDataSet(DBGrid.DataSource.DataSet) <> nil then
    TClientDataSet(DBGrid.DataSource.DataSet).AfterClose := fDataseAfterClose;

  if (Column.Field <> nil) and (Column.Field.FieldKind = fkInternalCalc) then
    exit;
  if DBGrid.DataSource = nil then
    exit;
  try
  if vShiftClick then
  begin
    if (TClientDataSet(DBGrid.DataSource.DataSet).IndexName = '') then//or (copy(TClientDataSet(DBGrid.DataSource.DataSet).IndexName, 1, 4) = 'IDX$') then
    begin
      vTemp := Column.Field.FieldName;
      vNomeIdx:='IDX$A'+vTemp;
      for I := 0 to DBGrid.Columns.Count - 1 do
        DBGrid.Columns[i].Title.Font.Style := [];
      TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Clear;
      TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Add( 'IDX$A'+vTemp, vTemp , []);
    end else if not(pos(Column.Field.FieldName,TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Items[0].FieldExpression)>0) then
    begin
      vNomeIdx := copy(TClientDataSet(DBGrid.DataSource.DataSet).IndexName,6,length(TClientDataSet(DBGrid.DataSource.DataSet).IndexName)-5);
      vTemp := TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Items[0].FieldExpression;
      vTemp := vTemp + ';' + Column.Field.FieldName;
      k:=0;
      for I := 1 to Length(vTemp) do
        if vTemp[i]=';' then
          inc(k);
      vNomeIdx:= vNomeIdx+inttostr(k);
      TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Clear;
      if pos('IDX$A',TClientDataSet(DBGrid.DataSource.DataSet).IndexName)>0 then
      begin
         TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Add( 'IDX$A'+vNomeIdx, vTemp , []);
         vNomeIdx := 'IDX$A'+vNomeIdx;
      end
      else begin
        TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Add( 'IDX$D'+vNomeIdx, vTemp , [ixDescending]);
        vNomeIdx := 'IDX$D'+vNomeIdx
      end;
    end else begin
      vTemp := TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Items[0].FieldExpression;
      k:=0;
      for I := 1 to Length(vTemp) do
        if vTemp[i]=';' then
          inc(k);
      if TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Find(TClientDataSet(DBGrid.DataSource.DataSet).IndexName).Options = [ixDescending] then
      begin
        vNomeIdx := StringReplace(TClientDataSet(DBGrid.DataSource.DataSet).IndexName,'IDX$D','IDX$A',[]);
        vNomeIdx := vNomeIdx + inttostr(k);
        TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Clear;
        TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Add( vNomeIdx, vTemp , []);
      end
      else begin
        vNomeIdx := StringReplace(TClientDataSet(DBGrid.DataSource.DataSet).IndexName,'IDX$A','IDX$D',[]);
        vNomeIdx := vNomeIdx + inttostr(k);
        TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Clear;
        TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Add( vNomeIdx, vTemp , [ixDescending]);
      end;
    end;

    try
      TClientDataSet(DBGrid.DataSource.DataSet).IndexName := vNomeIdx;
      Column.Title.Font.Style := [fsBold];
    except
    end;

  end
  else
  if (TClientDataSet(DBGrid.DataSource.DataSet).Active) then
  begin
    // Aqui todas as colunas voltam para fonte normal
    for I := 0 to DBGrid.Columns.Count - 1 do
      DBGrid.Columns[i].Title.Font.Style := [];
    
    TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Clear;
    if TClientDataSet(DBGrid.DataSource.DataSet).Tag = 0 then // a Propriedade TAG do clientDataSet serve para definir a ordem ascendente quando 1 e descendent quando 2
    begin
      TClientDataSet(DBGrid.DataSource.DataSet).Tag := 1;
      vTemp := 'IDX$A' + Column.Field.FieldName;
      TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Add(vTemp, Column.Field.FieldName,[]);
    end
    else if TClientDataSet(DBGrid.DataSource.DataSet).Tag = 1 then
    begin
      TClientDataSet(DBGrid.DataSource.DataSet).Tag := 0;
      vTemp := 'IDX$D' + Column.Field.FieldName;
      TClientDataSet(DBGrid.DataSource.DataSet).IndexDefs.Add(vTemp, Column.Field.FieldName,[ixDescending]);
    end;
    TClientDataSet(DBGrid.DataSource.DataSet).IndexName := vTemp;
    Column.Title.Font.Style := [fsBold];
  end;
  //Aqui a coluna que foi clicada fica em negrito para destaque.

  if DBGrid.DataSource <> nil then
    if TClientDataSet(DBGrid.DataSource.DataSet).active then
      TClientDataSet(DBGrid.DataSource.DataSet).First;
  finally
    vShiftClick:=false;
  end;
  //Aqui a coluna que foi clicada fica em negrito para destaque.

  if DBGrid.DataSource <> nil then
    if TClientDataSet(DBGrid.DataSource.DataSet).active then
      TClientDataSet(DBGrid.DataSource.DataSet).First;
end;

procedure TDadosIni.fDataseAfterClose(DataSet: TDataSet);
begin
  TClientDataSet(DataSet).IndexName := '';
end;

function TDadosIni.GetIni(pChave, pIdentificador,
  pValorDefault: string): string;
var
  ArqIni: string;
  ArqConfig: TIniFile;
begin
  try
    ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
    if not FileExists(ArqIni) then
      ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
    ArqConfig := TIniFile.Create(ArqIni);

    Result := ArqConfig.ReadString(pChave, pIdentificador, pValorDefault);
  finally
    FreeAndNil(ArqConfig);
  end;
end;

function TDadosIni.getValue(pStr: string; pPos: integer;
  pDelimiter: string): string;
var
  vTemp: string;
  vInc: Integer;
begin
  pStr := Trim(Copy(pStr, 2, Length(pStr)));
  vTemp := pStr;
  vInc := 0;
  while pos(pDelimiter, vTemp) > 0 do
  begin
    inc(vInc);
    if pPos = vInc then
    begin
      vTemp := Copy(vTemp, 1, pos(pDelimiter, vTemp) - 1);
      Result := Trim(vTemp);
      exit;
    end;
    vTemp := Copy(vTemp, pos(pDelimiter, vTemp) + 1, length(vTemp));
  end;
  Result := '';
end;

function TDadosIni.IfThen(AValue: Boolean; ATrue, AFalse: Variant): Variant;
begin
  if AValue then Result := ATrue else Result := AFalse;
end;

procedure TDadosIni.registraErro(vMenserro: string);
var
  Arq: TextFile;
  NomeArq: string;
  auxstr: string;
begin
  Nomearq := ExtractFilePath(Application.Exename) + 'erros.log';
  AssignFile(Arq, NomeArq);
  if not FileExists(NomeArq) then
    Rewrite(arq)
  else
    append(arq);
  auxstr := 'ERRO: ' + vmenserro + ' Dia: ' + datetostr(date) +
    ' Hora: ' + timetostr(time) + ' ' + reestrutura.Sistema;
  WriteLn(arq, auxstr);
  closeFile(arq);
end;

procedure TDadosIni.registraLog(Text: string; RewriteFile: Boolean);
var
  Arq: TextFile;
  NomeArq: string;
  auxstr: string;
begin
  try
    Nomearq := ExtractFilePath(Application.Exename) + 'Logreestrutura.log';
    AssignFile(Arq, NomeArq);
    try
      if( not FileExists(NomeArq)) or (RewriteFile) then
        Rewrite(arq)
      else
        append(arq);
      WriteLn(arq, Text);
    finally
      closeFile(arq);
    end;
  except
  end;
end;

function TDadosIni.strIn(pStr: string; const pArgs: array of string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Length(pArgs) - 1 do
    if pStr = pArgs[I] then
    begin
      Result := True;
      Break;
    end;
end;

function TDadosIni.StrZero(Num: string; Tam: Integer): string;
var
  I: Integer;
  V1: string;
begin
  V1 := Trim(Num);
  for I := 1 to Tam - Length(V1) do
    V1 := '0' + V1;
  Result := V1;
end;

procedure TDadosIni._GravaConfiguracoesString(NomeVariavel, Valor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TDadosIni._LerConfiguracoesRegistroString(NomeVariavel,
  pDefault: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  Result := pDefault;
  try
    vTemp := pDefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadString(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

end.
