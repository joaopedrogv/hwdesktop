unit uNFC_Types;

interface

type
  RLibSSLDFe = record
    SSLLib       : SmallInt;
    SSLCryptLib  : SmallInt;
    SSLHttpLib   : SmallInt;
    SSLXmlSignLib: SmallInt;
  end;

  RNFCeOff = record
    EmpresaId: Integer;
    CaixaId: Integer;
    BancoHwauto: string;
    BancoLogNFCeOff: string;
    IntervaloMinutos: Integer;
  end;

  RConfiguracoes = record
    CodEmpresa: Integer;
    Token, EnderecoBancoDeDados: string;
    ServidorDeEnvioNFCe, //ServidorDeEnvioSAT,
      ServidorDeImpressao, ServidorDeEmail: Boolean;
    ThreadsAtivasNFCe{, ThreadsAtivasSAT}: Smallint;
    SleepTimeServiceThread, SleepTimeServiceNoThread: Smallint;
    SalvarLogNFCe{, SalvarLogSAT}: Boolean;
    LogRespostaServico: Boolean;
    TimeVerificarEnvioContingencia: Smallint;
  end;

  RImpressaoNaoFiscal = record
    QtdeLinhasAvancoPapelAposNFC, SleepAfterPrint                     : Smallint;
    CortarPapelAposImpressao, ImprimeEmUmaLinha, ImprimeDescAcrescItem: Boolean;
    Logo_Width, Logo_Height                                           : Integer;
    ImprimeNomeFantasia, ImprimirTributos, TributosSeparadamente      : Boolean;
    ImprimeLogoLateral, QRCodeLateral, ImprimeInfContr                : Boolean;
    AbrirGaveta                                                       : Boolean;
    AbrirGavetaEspecifica                                             : Integer;
    MargemInferior, MargemSuperior, MargemEsquerda, MargemDireita     : Double;
  end;

  RPosPrinter = record
    Modelo                                                     : Integer;
    Porta                                                      : string;
    Colunas, EspacoEntreLinhas, LinhasBuffer, LinhasEntreCupons: Integer;
    ControlePorta, TraduzirTags, IgnorarTags                   : Boolean;
    ArqLOG                                                     : string;
    PaginaDeCodigo                                             : Integer;
    Barras_LarguraLinha, Barras_Altura                         : Integer;
    Barras_MostrarCodigo                                       : Boolean;
    QRCode_Tipo, QRCode_LarguraModulo, QRCode_ErrorLevel       : Integer;
    Logo_KeyCode1, Logo_KeyCode2, Logo_FatorX, Logo_FatorY     : Integer;
    Device_ParamsString                                        : string;
  end;

  TServiceUtils = class
  private
    FConf: RConfiguracoes;
    FServiceName: string;
    FImpr: RImpressaoNaoFiscal;
    FPosPrinter: RPosPrinter;
    FNFCeOff: RNFCeOff;
    procedure SetPosPrinter(const Value: RPosPrinter);
    procedure SetImpr(const Value: RImpressaoNaoFiscal);
    procedure SetConf(const Value: RConfiguracoes);
  public
    constructor create(ServiceName: string);
    procedure SalvarLog(Log: string; const Args: array of const; AppendFile: Boolean = True); overload;
    procedure SalvarLog(Log: string; AppendFile: Boolean = True); overload;
    procedure LerConfig;
    procedure LerConfigImpressao;
    procedure LerConfigPosPrinter;
    procedure SalvarConfig;

    property Conf: RConfiguracoes read FConf write SetConf;
    property Impr: RImpressaoNaoFiscal read FImpr write SetImpr;
    property PosPrinter: RPosPrinter read FPosPrinter write SetPosPrinter;
    property NFCeOff: RNFCeOff read FNFCeOff write FNFCeOff;
  end;

  TConfsIni = class
  public
   class function GetPosPrinter(name: string = ''): RPosPrinter;
   class function GetNFCeImpressao(name: string = ''): RImpressaoNaoFiscal;
  end;

implementation

uses
  IniFiles,
  SysUtils,
  ACBrPosPrinter,
  System.StrUtils;

{ TServiceUtils }

constructor TServiceUtils.create(ServiceName: string);
begin
  FServiceName := ServiceName;
end;

procedure TServiceUtils.LerConfig;
var
  Arquivo: TIniFile;
  NomeArquivo: string;
begin
  try
    NomeArquivo := ExtractFilePath(ParamStr(0)) + 'HWNFC.ini';
    Arquivo := TIniFile.Create(NomeArquivo);
    try
      FConf.CodEmpresa                     := Arquivo.ReadInteger('HWNFC', 'Empresa'          , 0);
      FConf.Token                          := Arquivo.ReadString( 'HWNFC', 'Token'            , '');
      FConf.ServidorDeEnvioNFCe            := Arquivo.ReadBool(   'HWNFC', 'ServidorEnvioNFCe', False);
      //FConf.ServidorDeEnvioSAT             := Arquivo.ReadBool(   'HWNFC', 'ServidorEnvioSAT' , False);
      FConf.ServidorDeImpressao            := Arquivo.ReadBool(   'HWNFC', 'ServidorImpressao', False);
      FConf.ServidorDeEmail                := Arquivo.ReadBool(   'HWNFC', 'ServidorEmail'    , False);
      FConf.ThreadsAtivasNFCe              := Arquivo.ReadInteger('HWNFC', 'ThreadsNFCe'      , 10);
      //FConf.ThreadsAtivasSAT               := Arquivo.ReadInteger('HWNFC', 'ThreadsSAT'       , 10);
      FConf.SleepTimeServiceThread         := Arquivo.ReadInteger('HWNFC', 'SleepTimeServiceThread'  , 500);
      FConf.SleepTimeServiceNoThread       := Arquivo.ReadInteger('HWNFC', 'SleepTimeServiceNoThread', 500);
      FConf.SalvarLogNFCe                  := Arquivo.ReadBool(   'HWNFC', 'SalvarLogNFCe', True);
      //FConf.SalvarLogSAT                   := Arquivo.ReadBool(   'HWNFC', 'SalvarLogSAT' , True);
      FConf.TimeVerificarEnvioContingencia := Arquivo.ReadInteger('HWNFC', 'TimeVerificarEnvioContingencia' , 5);
      FConf.LogRespostaServico             := Arquivo.ReadBool(   'HWNFC', 'LogRespostaServico' , False);
    finally
      Arquivo.Free;
    end;

    NomeArquivo := ExtractFilePath(ParamStr(0)) + 'hwsistemas.ini';
    if not FileExists(NomeArquivo) then
      NomeArquivo := ExtractFilePath(ParamStr(0)) + 'Config.ini';
    Arquivo := TIniFile.Create(NomeArquivo);
    try
      FConf.EnderecoBancoDeDados := Arquivo.ReadString( 'Banco', 'HW', '');
      FNFCeOff.BancoLogNFCeOff := Arquivo.ReadString( 'Banco', 'LogNFCeOff', '');
      FNFCeOff.BancoHwauto := FConf.EnderecoBancoDeDados;
      FNFCeOff.EmpresaId := Arquivo.ReadInteger( 'NFCeSincOff', 'Empresa', 0);
      FNFCeOff.CaixaId := Arquivo.ReadInteger( 'NFCeSincOff', 'Caixa', 0);
      FNFCeOff.IntervaloMinutos := Arquivo.ReadInteger( 'NFCeSincOff', 'IntervaloMinutos', 5);
      if FNFCeOff.IntervaloMinutos < 2 then
        FNFCeOff.IntervaloMinutos := 2
      else if FNFCeOff.IntervaloMinutos > 60 then
        FNFCeOff.IntervaloMinutos := 60;
    finally
      Arquivo.Free;
    end;
  except
  end;
end;

procedure TServiceUtils.LerConfigImpressao;
  {
var
  Arquivo: TIniFile;
  NomeArquivo: string;
  }
begin
  FImpr := TConfsIni.GetNFCeImpressao();
  {
  try
    NomeArquivo := ExtractFilePath(ParamStr(0)) + 'HWNFC.ini';
    Arquivo := TIniFile.Create(NomeArquivo);
    try
      FImpr.QtdeLinhasAvancoPapelAposNFC := Arquivo.ReadInteger('Impressao', 'QtdeLinhasAvancoPapelAposNFC', 2);
      FImpr.SleepAfterPrint              := Arquivo.ReadInteger('Impressao', 'SleepAfterPrint'             , 500);
      FImpr.CortarPapelAposImpressao     := Arquivo.ReadBool(   'Impressao', 'CortarPapelAposImpressao'    , True);
      FImpr.ImprimeEmUmaLinha            := Arquivo.ReadBool(   'Impressao', 'ImprimeEmUmaLinha'           , False);
      FImpr.ImprimeDescAcrescItem        := Arquivo.ReadBool(   'Impressao', 'ImprimeDescAcrescItem'       , False);
      FImpr.Logo_Height                  := Arquivo.ReadInteger('Impressao', 'Logo_Height'                 , 41);
      FImpr.Logo_Width                   := Arquivo.ReadInteger('Impressao', 'Logo_Width'                  , 64);
      FImpr.ImprimeNomeFantasia          := Arquivo.ReadBool(   'Impressao', 'ImprimeNomeFantasia'         , False);
      FImpr.ImprimirTributos             := Arquivo.ReadBool(   'Impressao', 'ImprimirTributos'            , True);
      FImpr.TributosSeparadamente        := Arquivo.ReadBool(   'Impressao', 'TributosSeparadamente'       , False);
      FImpr.ImprimeLogoLateral           := Arquivo.ReadBool(   'Impressao', 'ImprimeLogoLateral'          , False);
      FImpr.QRCodeLateral                := Arquivo.ReadBool(   'Impressao', 'QRCodeLateral'               , True);
      FImpr.AbrirGaveta                  := Arquivo.ReadBool(   'Impressao', 'AbrirGaveta'                 , True);
      FImpr.AbrirGavetaEspecifica        := Arquivo.ReadInteger('Impressao', 'AbrirGavetaEspecifica'       , 0);

      FImpr.MargemInferior               := Arquivo.ReadFloat(  'Impressao', 'MargemInferior'              , 8);
      FImpr.MargemSuperior               := Arquivo.ReadFloat(  'Impressao', 'MargemSuperior'              , 8);
      FImpr.MargemEsquerda               := Arquivo.ReadFloat(  'Impressao', 'MargemEsquerda'              , 6);
      FImpr.MargemDireita                := Arquivo.ReadFloat(  'Impressao', 'MargemDireita'               , 5.1);

    finally
      Arquivo.Free;
    end;
  except
  end;
  }
end;

procedure TServiceUtils.LerConfigPosPrinter;
  {
var
  Arquivo: TIniFile;
  NomeArquivo: string;
  TMPPosPrinter : TACBrPosPrinter;
  }
begin
  FPosPrinter := TConfsIni.GetPosPrinter();
  {
  try
    NomeArquivo := ExtractFilePath(ParamStr(0)) + 'PosPrinter.ini';
    Arquivo := TIniFile.Create(NomeArquivo);
    try
      TMPPosPrinter := TACBrPosPrinter.Create(nil);
      FPosPrinter.Modelo                      := Arquivo.ReadInteger('PosPrinter', 'Modelo', Integer(TMPPosPrinter.Modelo));
      FPosPrinter.Porta                       := Arquivo.ReadString('PosPrinter', 'Porta', TMPPosPrinter.Porta);
      FPosPrinter.Colunas                     := Arquivo.ReadInteger('PosPrinter', 'Colunas', TMPPosPrinter.Colunas);
      FPosPrinter.EspacoEntreLinhas           := Arquivo.ReadInteger('PosPrinter', 'EspacoEntreLinhas' , TMPPosPrinter.EspacoEntreLinhas);
      FPosPrinter.LinhasBuffer                := Arquivo.ReadInteger('PosPrinter', 'LinhasBuffer', TMPPosPrinter.LinhasBuffer);
      FPosPrinter.LinhasEntreCupons           := Arquivo.ReadInteger('PosPrinter', 'LinhasPular', TMPPosPrinter.LinhasEntreCupons);
      FPosPrinter.ControlePorta               := Arquivo.ReadBool('PosPrinter', 'ControlePorta', TMPPosPrinter.ControlePorta);
      FPosPrinter.TraduzirTags                := Arquivo.ReadBool('PosPrinter', 'TraduzirTags', TMPPosPrinter.TraduzirTags);
      FPosPrinter.IgnorarTags                 := Arquivo.ReadBool('PosPrinter', 'IgnorarTags', TMPPosPrinter.IgnorarTags);
      FPosPrinter.ArqLOG                      := Arquivo.ReadString('PosPrinter', 'ArqLOG', TMPPosPrinter.ArqLOG);
      FPosPrinter.PaginaDeCodigo              := Arquivo.ReadInteger('PosPrinter', 'PaginaDeCodigo', Integer(TMPPosPrinter.PaginaDeCodigo));
      FPosPrinter.Barras_LarguraLinha         := Arquivo.ReadInteger('Barras', 'Largura', TMPPosPrinter.ConfigBarras.LarguraLinha);
      FPosPrinter.Barras_Altura               := Arquivo.ReadInteger('Barras', 'Altura', TMPPosPrinter.ConfigBarras.Altura);
      FPosPrinter.Barras_MostrarCodigo        := Arquivo.ReadBool('Barras', 'HRI', TMPPosPrinter.ConfigBarras.MostrarCodigo);
      FPosPrinter.QRCode_Tipo                 := Arquivo.ReadInteger('QRCode', 'Tipo', TMPPosPrinter.ConfigQRCode.Tipo);
      FPosPrinter.QRCode_LarguraModulo        := Arquivo.ReadInteger('QRCode', 'LarguraModulo', TMPPosPrinter.ConfigQRCode.LarguraModulo);
      FPosPrinter.QRCode_ErrorLevel           := Arquivo.ReadInteger('QRCode', 'ErrorLevel', TMPPosPrinter.ConfigQRCode.ErrorLevel);
      FPosPrinter.Logo_KeyCode1               := Arquivo.ReadInteger('Logo', 'KC1', TMPPosPrinter.ConfigLogo.KeyCode1);
      FPosPrinter.Logo_KeyCode2               := Arquivo.ReadInteger('Logo', 'KC2', TMPPosPrinter.ConfigLogo.KeyCode2);
      FPosPrinter.Logo_FatorX                 := Arquivo.ReadInteger('Logo', 'Logo_FatorX', TMPPosPrinter.ConfigLogo.FatorX);
      FPosPrinter.Logo_FatorY                 := Arquivo.ReadInteger('Logo', 'Logo_FatorY', TMPPosPrinter.ConfigLogo.FatorY);
      FPosPrinter.Device_ParamsString         := Arquivo.ReadString('Device', 'ParamsString', TMPPosPrinter.Device.ParamsString);
    finally
      if TMPPosPrinter <> nil then
        FreeAndNil(TMPPosPrinter);
      Arquivo.Free;
    end;
  except
  end;
  }
end;

procedure TServiceUtils.SalvarConfig;
var
  Arquivo: TIniFile;
  NomeArquivo: string;
begin
  try
    NomeArquivo := ExtractFilePath(ParamStr(0)) + 'HWNFC.ini';
    Arquivo := TIniFile.Create(NomeArquivo);
    try
      Arquivo.WriteInteger('HWNFC', 'Empresa'          , FConf.CodEmpresa);
      Arquivo.WriteString( 'HWNFC', 'Token'            , FConf.Token);
      Arquivo.WriteBool(   'HWNFC', 'ServidorEnvioNFCe', FConf.ServidorDeEnvioNFCe);
      //Arquivo.WriteBool(   'HWNFC', 'ServidorEnvioSAT' , FConf.ServidorDeEnvioSAT);
      Arquivo.WriteBool(   'HWNFC', 'ServidorImpressao', FConf.ServidorDeImpressao);
      Arquivo.WriteBool(   'HWNFC', 'ServidorEmail'    , FConf.ServidorDeEmail);
      Arquivo.WriteInteger('HWNFC', 'ThreadsNFCe'      , FConf.ThreadsAtivasNFCe);
      //Arquivo.WriteInteger('HWNFC', 'ThreadsSAT'       , FConf.ThreadsAtivasSAT);
      Arquivo.WriteInteger('HWNFC', 'SleepTimeServiceThread'  , FConf.SleepTimeServiceThread);
      Arquivo.WriteInteger('HWNFC', 'SleepTimeServiceNoThread', FConf.SleepTimeServiceNoThread);
      Arquivo.WriteBool(   'HWNFC', 'SalvarLogNFCe', FConf.SalvarLogNFCe);
      //Arquivo.WriteBool(   'HWNFC', 'SalvarLogSAT' , FConf.SalvarLogSAT);
      Arquivo.WriteInteger('HWNFC', 'TimeVerificarEnvioContingencia' , FConf.TimeVerificarEnvioContingencia);
    finally
      Arquivo.Free;
    end;

    NomeArquivo := ExtractFilePath(ParamStr(0)) + 'hwsistemas.ini';
    if not FileExists(NomeArquivo) then
      NomeArquivo := ExtractFilePath(ParamStr(0)) + 'Config.ini';
    Arquivo := TIniFile.Create(NomeArquivo);
    try
      Arquivo.WriteString( 'Banco', 'HW', FConf.EnderecoBancoDeDados);
    finally
      Arquivo.Free;
    end;
  except
  end;
end;

procedure TServiceUtils.SalvarLog(Log: string; const Args: array of const; AppendFile: Boolean);
begin
  SalvarLog(Format(Log, Args), AppendFile);
end;

procedure TServiceUtils.SalvarLog(Log: string; AppendFile: Boolean);
var
  ArquivoTexto: TextFile;
  NomeArquivo: string;
begin
  NomeArquivo := ExtractFilePath(ParamStr(0)) + FServiceName + '.log';
  try
    AssignFile(ArquivoTexto, NomeArquivo);
    try
      if (not FileExists(NomeArquivo)) or (not AppendFile) then
        Rewrite(ArquivoTexto)
      else
        append(ArquivoTexto);
      WriteLn(ArquivoTexto, FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' - ' + Log);
    finally
      CloseFile(ArquivoTexto);
    end;
  except
  end;
end;

procedure TServiceUtils.SetConf(const Value: RConfiguracoes);
begin
  FConf := Value;
end;

procedure TServiceUtils.SetImpr(const Value: RImpressaoNaoFiscal);
begin
  FImpr := Value;
end;

procedure TServiceUtils.SetPosPrinter(const Value: RPosPrinter);
begin
  FPosPrinter := Value;
end;

{ TConfsIni }

class function TConfsIni.GetNFCeImpressao(
  name: string): RImpressaoNaoFiscal;
begin
  try
    var fileName := IfThen(name.Trim().Equals(EmptyStr), 'HWNFC.ini', name);
    if not EndsText('.ini', fileName) then
      fileName := fileName + '.ini';

    fileName := ExtractFilePath(ParamStr(0)) + fileName;
    var iniFile := TIniFile.Create(fileName);
    try
      Result.QtdeLinhasAvancoPapelAposNFC := iniFile.ReadInteger('Impressao', 'QtdeLinhasAvancoPapelAposNFC', 2);
      Result.SleepAfterPrint              := iniFile.ReadInteger('Impressao', 'SleepAfterPrint'             , 500);
      Result.CortarPapelAposImpressao     := iniFile.ReadBool(   'Impressao', 'CortarPapelAposImpressao'    , True);
      Result.ImprimeEmUmaLinha            := iniFile.ReadBool(   'Impressao', 'ImprimeEmUmaLinha'           , False);
      Result.ImprimeDescAcrescItem        := iniFile.ReadBool(   'Impressao', 'ImprimeDescAcrescItem'       , False);
      Result.Logo_Height                  := iniFile.ReadInteger('Impressao', 'Logo_Height'                 , 41);
      Result.Logo_Width                   := iniFile.ReadInteger('Impressao', 'Logo_Width'                  , 64);
      Result.ImprimeNomeFantasia          := iniFile.ReadBool(   'Impressao', 'ImprimeNomeFantasia'         , False);
      Result.ImprimirTributos             := iniFile.ReadBool(   'Impressao', 'ImprimirTributos'            , True);
      Result.TributosSeparadamente        := iniFile.ReadBool(   'Impressao', 'TributosSeparadamente'       , False);
      Result.ImprimeLogoLateral           := iniFile.ReadBool(   'Impressao', 'ImprimeLogoLateral'          , False);
      Result.QRCodeLateral                := iniFile.ReadBool(   'Impressao', 'QRCodeLateral'               , True);
      Result.AbrirGaveta                  := iniFile.ReadBool(   'Impressao', 'AbrirGaveta'                 , True);
      Result.AbrirGavetaEspecifica        := iniFile.ReadInteger('Impressao', 'AbrirGavetaEspecifica'       , 0);
      Result.ImprimeInfContr              := iniFile.ReadBool(   'Impressao', 'ImprimeInfoContribuinte'     , True);

      Result.MargemInferior               := iniFile.ReadFloat(  'Impressao', 'MargemInferior'              , 8);
      Result.MargemSuperior               := iniFile.ReadFloat(  'Impressao', 'MargemSuperior'              , 8);
      Result.MargemEsquerda               := iniFile.ReadFloat(  'Impressao', 'MargemEsquerda'              , 6);
      Result.MargemDireita                := iniFile.ReadFloat(  'Impressao', 'MargemDireita'               , 5.1);

    finally
      iniFile.Free;
    end;
  except
  end;
end;

class function TConfsIni.GetPosPrinter(name: string): RPosPrinter;
begin
  try
    var fileName := IfThen(name.Trim().Equals(EmptyStr), 'PosPrinter.ini', name);
    if not EndsText('.ini', fileName) then
      fileName := fileName + '.ini';
    fileName := ExtractFilePath(ParamStr(0)) + fileName;

    var iniFile := TIniFile.Create(fileName);
    var posPrinter := TACBrPosPrinter.Create(nil);
    try
      Result.Modelo                      := iniFile.ReadInteger('PosPrinter', 'Modelo', Integer(posPrinter.Modelo));
      Result.Porta                       := iniFile.ReadString('PosPrinter', 'Porta', posPrinter.Porta);
      Result.Colunas                     := iniFile.ReadInteger('PosPrinter', 'Colunas', posPrinter.Colunas);
      Result.EspacoEntreLinhas           := iniFile.ReadInteger('PosPrinter', 'EspacoEntreLinhas' , posPrinter.EspacoEntreLinhas);
      Result.LinhasBuffer                := iniFile.ReadInteger('PosPrinter', 'LinhasBuffer', posPrinter.LinhasBuffer);
      Result.LinhasEntreCupons           := iniFile.ReadInteger('PosPrinter', 'LinhasPular', posPrinter.LinhasEntreCupons);
      Result.ControlePorta               := iniFile.ReadBool('PosPrinter', 'ControlePorta', posPrinter.ControlePorta);
      Result.TraduzirTags                := iniFile.ReadBool('PosPrinter', 'TraduzirTags', posPrinter.TraduzirTags);
      Result.IgnorarTags                 := iniFile.ReadBool('PosPrinter', 'IgnorarTags', posPrinter.IgnorarTags);
      Result.ArqLOG                      := iniFile.ReadString('PosPrinter', 'ArqLOG', posPrinter.ArqLOG);
      Result.PaginaDeCodigo              := iniFile.ReadInteger('PosPrinter', 'PaginaDeCodigo', Integer(posPrinter.PaginaDeCodigo));
      Result.Barras_LarguraLinha         := iniFile.ReadInteger('Barras', 'Largura', posPrinter.ConfigBarras.LarguraLinha);
      Result.Barras_Altura               := iniFile.ReadInteger('Barras', 'Altura', posPrinter.ConfigBarras.Altura);
      Result.Barras_MostrarCodigo        := iniFile.ReadBool('Barras', 'HRI', posPrinter.ConfigBarras.MostrarCodigo);
      Result.QRCode_Tipo                 := iniFile.ReadInteger('QRCode', 'Tipo', posPrinter.ConfigQRCode.Tipo);
      Result.QRCode_LarguraModulo        := iniFile.ReadInteger('QRCode', 'LarguraModulo', posPrinter.ConfigQRCode.LarguraModulo);
      Result.QRCode_ErrorLevel           := iniFile.ReadInteger('QRCode', 'ErrorLevel', posPrinter.ConfigQRCode.ErrorLevel);
      Result.Logo_KeyCode1               := iniFile.ReadInteger('Logo', 'KC1', posPrinter.ConfigLogo.KeyCode1);
      Result.Logo_KeyCode2               := iniFile.ReadInteger('Logo', 'KC2', posPrinter.ConfigLogo.KeyCode2);
      Result.Logo_FatorX                 := iniFile.ReadInteger('Logo', 'Logo_FatorX', posPrinter.ConfigLogo.FatorX);
      Result.Logo_FatorY                 := iniFile.ReadInteger('Logo', 'Logo_FatorY', posPrinter.ConfigLogo.FatorY);
      Result.Device_ParamsString         := iniFile.ReadString('Device', 'ParamsString', posPrinter.Device.ParamsString);
    finally
      posPrinter.Free;
      iniFile.Free;
    end;
  except
  end;
end;

end.
