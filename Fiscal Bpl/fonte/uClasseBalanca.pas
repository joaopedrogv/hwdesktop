unit uClasseBalanca;

interface

const
  PcScale = 'PcScale.dll'; //Contante para não ficar repetindo
  modeloBal : array [1..9] of string = ('Nenhuma','Filizola - IDS','Rice Lake - IQPLUS 810','Toledo - 9091','Toledo - 8132','Filizola - ID10000','Filizola - BP','Filizola - MF','Filizola - IDC');

type
  TBalanca = class(TObject)
  protected
    Balanca: Integer;
    Modelo: Integer;
    Porta: Integer;
    BaudRate: Integer;
    Campo: Integer;
    Preco: Double;
    Ret: PChar;
    vBalancaAtiva: boolean;
    vStatus:integer;
    vLeitura: string;
    FInteracaoDLL: Boolean;
  public
    constructor Create(AModelo: string);
    destructor destroy; override;
    function iniciaLeituraBalanca: boolean; virtual; abstract;
    function finalizaLeituraBalanca: boolean; virtual; abstract;
    function getStatusBalanca: integer; virtual; abstract;
    function getInformacao(indice: integer): Double; virtual; abstract;
    procedure getLeitura(var valor: string); virtual; abstract;
    procedure abreConfiguracaoBal; virtual; abstract;
    function getLeituraInteracaoDll: string; virtual; abstract;
    property balancaAtiva:Boolean read vBalancaAtiva;
    property statusBalanca:integer read vStatus;
    property InteracaoDLL: Boolean read FInteracaoDLL;
  end;

  TBalanca_PCScale = class(TBalanca)
  private
    function retornaStatusImpressora: integer;
    procedure configuraBal;
  public
    function iniciaLeituraBalanca: boolean; override;
    function finalizaLeituraBalanca: boolean; override;
    function getStatusBalanca: integer; override;
    function getInformacao(indice: integer): Double; override;
    procedure getLeitura(var valor: string); override;
    procedure abreConfiguracaoBal; override;
    function getLeituraInteracaoDll: string; override;
  end;

  TBalanca_hw_generic = class(TBalanca)
  private

  public
    function iniciaLeituraBalanca: boolean; override;
    function finalizaLeituraBalanca: boolean; override;
    function getStatusBalanca: integer; override;
    function getInformacao(indice: integer): Double; override;
    procedure getLeitura(var valor: string); override;
    procedure abreConfiguracaoBal; override;
    function getLeituraInteracaoDll: string; override;
  end;

implementation

uses
  Forms, uDtmAtivo, Windows, SysUtils, Controls;

  function InicializaLeitura(Balanca: Integer): Boolean;
  stdcall; external PcScale;

function ObtemInformacao(Balanca: Integer; Campo: Integer): double;
  stdcall; external PcScale;

function FinalizaLeitura(Balanca: Integer): Boolean;
  stdcall; external PcScale;

procedure ExibeMsgErro(Aplicativo: THandle);
  stdcall; external PcScale;

function SalvaParametrosBalanca(Balanca: Integer; Modelo: Integer;
  Porta: Integer; BaudRate: Integer): Boolean stdcall; external PcScale;

function ObtemParametrosBalanca(Balanca: Integer; Modelo: PInteger;
  Porta: PInteger; BaudRate: PInteger  ): Boolean  stdcall; external PcScale;

function ConfiguraBalanca(Balanca: Integer; Aplicativo: THandle): Boolean;
             stdcall; external 'PcScale.dll';

function hw_bal_generic_configurar: LongBool; stdcall; external 'hw.bal.generic.dll';

function hw_bal_generic_ler_peso_interacao_dll(var AValue: PChar): LongBool; stdcall; external 'hw.bal.generic.dll';

function hw_bal_generic_ultimo_erro: PChar; stdcall; external 'hw.bal.generic.dll';

{ TBalanca_PCScale }

procedure TBalanca_PCScale.abreConfiguracaoBal;
var
  I: Integer;
begin
  ConfiguraBalanca(0,Application.Handle);
  for I := 1 to 9 do
    if UpperCase(vDadosIni.vModeloBal) = UpperCase(modeloBal[i]) then
    begin
        Modelo := I - 2;
          Break;
    end;
    if Modelo = -1 then
      Exit;
  if ObtemParametrosBalanca(0,@Modelo,@Porta,@BaudRate) then
  begin
    vDadosIni.vPortaBal := Porta;
    vDadosIni.vBaudRateBal := BaudRate;
    vDadosIni.GravaIni('Fiscal','PortaBalanca',IntToStr(vDadosIni.vPortaBal));
    vDadosIni.GravaIni('Fiscal','BaudRateBalanca',IntToStr(vDadosIni.vBaudRateBal));
  end;
end;

procedure TBalanca_PCScale.configuraBal;
var
  I: Integer;
begin
  for I := 1 to 9 do
    if UpperCase(vDadosIni.vModeloBal) = UpperCase(modeloBal[i]) then
    begin
        Modelo := I - 2;
          Break;
    end;
    if Modelo = -1 then
      Exit;
  SalvaParametrosBalanca(0,modelo,vDadosIni.vPortaBal,vDadosIni.vBaudRateBal);
end;

function TBalanca_PCScale.finalizaLeituraBalanca: boolean;
begin
  Result := false;
  if not vBalancaAtiva then
    exit;
  if not FinalizaLeitura(0) then
  begin
    ExibeMsgErro(Application.Handle);
    Exit;
  end;
  Result := true;
  vBalancaAtiva := false;
end;

function TBalanca_PCScale.getInformacao(indice: integer): Double;
begin
  try
    result := ObtemInformacao(0, indice);
  except
    Result :=0;
  end;
end;

procedure TBalanca_PCScale.getLeitura(var valor: string);
var
  iRetorno: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    valor := '';
    if not iniciaLeituraBalanca then
      Exit;
    if not vBalancaAtiva then
    begin
      Application.MessageBox('Balança não esta ativa', 'Ateção', MB_OK + MB_ICONEXCLAMATION);
      exit;
    end;
    //    1: ; //lblStatus.Caption := 'Peso Oscilando.';
    //    2: ; //lblStatus.Caption := 'Peso Estável.';
    //    3: ; //lblStatus.Caption := 'Sobrecarga de Peso ou Alivio de Plataforma.';
    //    4: ; // lblStatus.Caption := 'Erro lendo licensa do Software.';
    iRetorno := 0;
    while iRetorno <> 2 do
    begin
      Application.ProcessMessages;
      iRetorno := retornaStatusImpressora;
      if iRetorno = 1 then
        valor := vLeitura
      else if iRetorno <> 2 then
      begin
        ExibeMsgErro(Application.Handle);
        exit;
      end;
    end;
  finally
    finalizaLeituraBalanca;
    Screen.Cursor := crDefault;
  end;
end;

function TBalanca_PCScale.getLeituraInteracaoDll: string;
begin
  raise Exception.Create('Função não disponível para o modelo configurado');
end;

function TBalanca_PCScale.getStatusbalanca: integer;
begin
  Result := StrToInt(FloatToStr(ObtemInformacao(0, 0)));
  vStatus := Result;
  if (Result = 0) or (Result = 4) then
  begin
    finalizaLeituraBalanca;
    vBalancaAtiva := false;
  end;
end;

function TBalanca_PCScale.iniciaLeituraBalanca: boolean;
var
  I: Integer;
begin
  Result := false;
  configuraBal;
  if Modelo = -1 then
    exit;
//  if not (vDadosIniF.vModeloBal = 'FILIZOLA') then
//  begin
//    Application.MessageBox('Balança aceita somente FILIZOLA', 'Ateção', MB_OK +
//      MB_ICONEXCLAMATION);
//    vBalancaAtiva := false;
//    exit;
//  end;

  if not InicializaLeitura(0) then
  begin
    ExibeMsgErro(Application.Handle);
    vBalancaAtiva := false;
    exit;
  end;
  Result := true;
  vBalancaAtiva := Result;
end;

function TBalanca_PCScale.retornaStatusImpressora: integer;
var
  status: integer;
  mascara: string;
begin
  Result := 0;
  status := StrToInt(FloatToStr(ObtemInformacao(0, 0)));
  case status of
    0:
      begin
        Application.MessageBox('Falha comunicando-se com a balança.', 'Ateção', MB_OK +
          MB_ICONEXCLAMATION);
        exit;
      end;
    1: ; //lblStatus.Caption := 'Peso Oscilando.';
    2: ; //lblStatus.Caption := 'Peso Estável.';
    3: ; //lblStatus.Caption := 'Sobrecarga de Peso ou Alivio de Plataforma.';
    4: ; // lblStatus.Caption := 'Erro lendo licensa do Software.';
  end;
  Result := status;

  if (status = 1) or (status = 2) then
  begin
    // vamos construir uma mascara para formatar o peso com as casas
    // decimais da balança
    if mascara = '' then
      mascara := '0.000';
    vLeitura := floattostr(ObtemInformacao(0, 1) / 1000);
  end;
end;

{ TBalanca_hw_generic }

procedure TBalanca_hw_generic.abreConfiguracaoBal;
begin
  inherited;
  if not hw_bal_generic_configurar then
    vDadosIni.ShowErro(string(hw_bal_generic_ultimo_erro));
end;

function TBalanca_hw_generic.finalizaLeituraBalanca: boolean;
begin

end;

function TBalanca_hw_generic.getInformacao(indice: integer): Double;
begin
end;

procedure TBalanca_hw_generic.getLeitura(var valor: string);
begin
end;

function TBalanca_hw_generic.getLeituraInteracaoDll: string;
var
  AValue: PChar;
begin
  inherited;
  Result := '';
  if FInteracaoDLL then
  begin
    if not hw_bal_generic_ler_peso_interacao_dll(AValue) then
      vDadosIni.ShowErro(string(hw_bal_generic_ultimo_erro))
    else
      Result := string(AValue);
  end
  else
    raise Exception.Create('Função não disponível para o modelo configurado');
end;

function TBalanca_hw_generic.getStatusBalanca: integer;
begin

end;

function TBalanca_hw_generic.iniciaLeituraBalanca: boolean;
begin

end;

{ TBalanca }

constructor TBalanca.create(AModelo: string);
begin
  vBalancaAtiva := false;
  vStatus := 0;
  FInteracaoDLL := False;
  FInteracaoDLL := Pos('dll', LowerCase(AModelo)) > 0;
end;

destructor TBalanca.destroy;
begin
  vBalancaAtiva := false;
  inherited;
end;

end.

