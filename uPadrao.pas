unit uPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Registry;

type
  TfrmPadrao = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure WM_Sys(var Msg: TMessage); message WM_SysCommand;
    procedure Show;
    function ShowModal: Integer;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
  private
    { Private declarations }
    procedure registraEstatisticas;
    procedure verificaConfiguracoesJanela;
    procedure salvaConfiguracoesJanela; overload;
    procedure salvaConfiguracoesJanela(pWindowState: TWindowState); overload;
  public
    { Public declarations }
    InibirEstatisticas: Boolean;
    vHeight, vWidth: Integer;
    fechar: Boolean;
    exibirPergFechar: Boolean;
  protected
  	clicouNoX: boolean;
    procedure MostraAjuda; overload;
    procedure MostraAjuda(AjudaHtml: string); overload;
    function setFocusCampoErro(var pNomeCampoErro: string): boolean; overload;
    function setFocusCampoErro(var pNomeCampoErro: string; var pMensagemErro: string; pForcarFoco: Boolean = False): boolean; overload;
    procedure mostrarHintEmBalao(Window : HWnd; Texto, Titulo : string; Tipo : Integer);
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    procedure _GravaConfiguracoesDouble(NomeVariavel : string; Valor : Double);
    procedure _GravaConfiguracoesBoolean(NomeVariavel : string; Valor : Boolean);
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);
    function _LerConfiguracoesRegistroString(NomeVariavel : string; Adefault: string = '') : string;
    function _LerConfiguracoesRegistroDouble(NomeVariavel : string) : Double;
    //Se de erro ao retornar do regitro ele retorna falso
    function _LerConfiguracoesRegistroBoolean(NomeVariavel : string; Adefault: Boolean = False) : Boolean;
    function _LerConfiguracoesRegistroInteger(NomeVariavel : string; Adefault: Integer = 0) : Integer;
  end;

var
  frmPadrao: TfrmPadrao;

implementation

uses ShellAPI, ComCtrls, uCadPadrao, uExportPadrao;

{$R *.dfm}

function hw_integra_estatistica_inc(banco, descricao: WideString; empresa: Integer): Integer; stdcall; external 'hw.utils.dx.dll';

{ TfrmPadrao }

procedure TfrmPadrao.MostraAjuda(AjudaHtml: string);
var
  Parametro, NomeArquivo: string;
  handle: THandle;
begin
  NomeArquivo := 'Help.chm';
  if not FileExists(NomeArquivo) then
    raise Exception.CreateFmt('Arquivo de ajuda "%s" não encontrado.', [NomeArquivo]);

  if (AjudaHtml <> '') then
  begin
    Parametro := Format('%s::%s', [NomeArquivo, AjudaHtml + '.html']);
    if ShellExecute(handle, 'open', 'HH.exe', PChar(Parametro), nil, SW_SHOWDEFAULT) <= 32 then
      raise Exception.Create('Não foi possível abrir arquivo');
  end;
end;

procedure TfrmPadrao.mostrarHintEmBalao(Window: HWnd; Texto, Titulo: string;
  Tipo: Integer);
var
  EditBalloonTip : TEditBalloonTip;
  vTexto, vTitulo: PWideChar;
begin
  EditBalloonTip.cbStruct := SizeOf(TEditBalloonTip);
  EditBalloonTip.pszText := PWideChar(WideString(Texto));
  EditBalloonTip.pszTitle := PWideChar(WideString(Titulo));
  EditBalloonTip.ttiIcon := Tipo;
  SendMessageW(Window, EM_SHOWBALLOONTIP, 0,Integer(@EditBalloonTip));
end;

procedure TfrmPadrao.registraEstatisticas;
var
  I: Integer;
begin
  if (not InibirEstatisticas) and (Self.Name <> 'frmPadrao') then
  begin
    InibirEstatisticas := True;

    try
      I := hw_integra_estatistica_inc(WideString(padrao_DBName), WideString(Self.Name), padrao_EmpresaId)
//      if Self.Hint = '' then
//        Self.Hint := 'Sts ' + IntToStr(I);
    except
    end;
  end;
end;

procedure TfrmPadrao.salvaConfiguracoesJanela;
var
  Registro: TRegistry;
begin
	if fsModal in Self.FormState then
    Exit;
    
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey('Software\Hw\Configuracao\Telas\TfrmPrincipalS', True);
//      if PanelFlash.Visible then
//        Registro.WriteString('ExibirPropagandaFlash', 'S')
//      else
//        Registro.WriteString('ExibirPropagandaFlash', 'N');
      if WindowState = wsMaximized then
        Registro.WriteString('JanelasMaximizadas', 'S')
      else
        Registro.WriteString('JanelasMaximizadas', 'N');   
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmPadrao.salvaConfiguracoesJanela(pWindowState: TWindowState);
var
  Registro: TRegistry;
begin
	if fsModal in Self.FormState then
    Exit;
    
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey('Software\Hw\Configuracao\Telas\TfrmPrincipalS', True);
//      if PanelFlash.Visible then
//        Registro.WriteString('ExibirPropagandaFlash', 'S')
//      else
//        Registro.WriteString('ExibirPropagandaFlash', 'N');
      if pWindowState = wsMaximized then
        Registro.WriteString('JanelasMaximizadas', 'S')
      else
        Registro.WriteString('JanelasMaximizadas', 'N');
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TfrmPadrao.setFocusCampoErro(var pNomeCampoErro, pMensagemErro: string;
  pForcarFoco: Boolean): boolean;
var
  vTipoMSG: Integer;
  vComponenteW : TWinControl;
begin
  /// O Parametro "pForcarFoco" serve para forcar o foco nas abas caso a aba esteja abilitada
  try
    Result := False;
    if (FindComponent(pNomeCampoErro) <> nil) and (pForcarFoco) then
      if not TWinControl(FindComponent(pNomeCampoErro)).CanFocus then
      begin
        vComponenteW := TWinControl(FindComponent(pNomeCampoErro));
        while vComponenteW.Parent <> nil do
        begin
          if vComponenteW.Parent is TTabSheet then
            TTabSheet(vComponenteW.Parent).Show;
          if not TWinControl(FindComponent(pNomeCampoErro)).CanFocus then
            vComponenteW := vComponenteW.Parent
          else
            Break;
        end;
      end;

    if FindComponent(pNomeCampoErro) <> nil then
      if (Self.Enabled) and (Self.Visible) and (TWinControl(FindComponent(pNomeCampoErro)).CanFocus) then
      begin
        if Trim(pMensagemErro) <> '' then
        begin
          if Copy(pMensagemErro, 1, 3) = '|N|' then
            mostrarHintEmBalao(TWinControl(FindComponent(pNomeCampoErro)).Handle, PChar(Copy(pMensagemErro, 4, length(pMensagemErro))), 'Atenção', TTI_NONE)
          else if Copy(pMensagemErro, 1, 3) = '|I|' then
            mostrarHintEmBalao(TWinControl(FindComponent(pNomeCampoErro)).Handle, PChar(Copy(pMensagemErro, 4, length(pMensagemErro))), 'Atenção', TTI_INFO)
          else if Copy(pMensagemErro, 1, 3) = '|W|' then
            mostrarHintEmBalao(TWinControl(FindComponent(pNomeCampoErro)).Handle, PChar(Copy(pMensagemErro, 4, length(pMensagemErro))), 'Atenção', TTI_WARNING)
          else if Copy(pMensagemErro, 1, 3) = '|E|' then
            mostrarHintEmBalao(TWinControl(FindComponent(pNomeCampoErro)).Handle, PChar(Copy(pMensagemErro, 4, length(pMensagemErro))), 'Atenção', TTI_ERROR)
          else
            mostrarHintEmBalao(TWinControl(FindComponent(pNomeCampoErro)).Handle, PChar(pMensagemErro), 'Atenção', TTI_ERROR);
          pMensagemErro := '';
        end;
        TWinControl(FindComponent(pNomeCampoErro)).SetFocus;
        pNomeCampoErro:='';
        Result := True;
      end;
  except
  end;
end;

procedure TfrmPadrao.Show;
var
	canShow: Boolean;
begin
  if not Self.Enabled then
    Exit;

	canShow := True;
  if Assigned(eventoShowFormMainForm) then
  	canShow := eventoShowFormMainForm(Self.Name, 'TfrmPadrao');

  if canShow then
  begin
    Visible := True;
    BringToFront;
  end;
end;

function TfrmPadrao.ShowModal: Integer;
var
	canShow: Boolean;
begin
	if not Self.Enabled then
    Exit;

	canShow := True;
  if Assigned(eventoShowModalFormMainForm) then
  	canShow := eventoShowModalFormMainForm(Self.Name, 'TfrmPadrao');

  if canShow then
  begin
  	if _mdiAberto(Self.Name) then
  		Result := inherited ShowModal();
  end
  else
  	Result := Self.ModalResult;
end;

procedure TfrmPadrao.verificaConfiguracoesJanela;
var
  Registro: TRegistry;
  vTemp, vTemp2: string;
begin
	if fsModal in Self.FormState then
    Exit;

  try
    vTemp := '';
    Registro := TRegistry.Create;
    try
      Registro.OpenKey('Software\Hw\Configuracao\Telas\TfrmPrincipalS', True);
      try
        vTemp := Registro.ReadString('JanelasMaximizadas');
      except
      end;
//      try
//        vTemp2 := Registro.ReadString('ExibirPropagandaFlash');
//      except
//      end;
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;

  if vTemp = 'S' then
    WindowState := wsMaximized;

//  if vTemp2 = 'N' then
//  begin
//    PanelLeft.Width := PanelFundo.Width - 5;
//    PanelFlash.Visible := False;
//    PanelFlash.Tag := 1;
//    ExibirPropaganda1.Visible := true;
//    NoExibirPropaganda1.Visible := false;
//  end;
end;

procedure TfrmPadrao.WM_Sys(var Msg: TMessage);
begin
	if (Msg.WParam = SC_Close) and (Msg.LParam <> 0) then
  begin
    clicouNoX := true;
    inherited;
  end
  else
  begin
  	if (Msg.WParam = SC_MAXIMIZE) then
    	salvaConfiguracoesJanela(wsMaximized)
    else if (Msg.WParam = SC_MINIMIZE) or (Msg.WParam = SC_RESTORE) then
    	salvaConfiguracoesJanela(wsMinimized);

    clicouNoX := false;
    inherited;
  end;
end;

function TfrmPadrao.setFocusCampoErro(var pNomeCampoErro: string): boolean;
begin
  try
    Result := False;
    if FindComponent(pNomeCampoErro) <> nil then
      if (Self.Enabled) and (Self.Visible) and (TWinControl(FindComponent(pNomeCampoErro)).CanFocus) then
      begin
        TWinControl(FindComponent(pNomeCampoErro)).SetFocus;
        pNomeCampoErro:='';
        Result := True;
      end;
  except
  end;
end;

procedure TfrmPadrao._GravaConfiguracoesBoolean(NomeVariavel: string;
  Valor: Boolean);
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
      Registro.WriteBool(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmPadrao._GravaConfiguracoesDouble(NomeVariavel: string;
  Valor: Double);
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
      Registro.WriteFloat(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmPadrao._GravaConfiguracoesInteger(NomeVariavel: string;
  Valor: Integer);
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
      Registro.WriteInteger(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmPadrao._GravaConfiguracoesString(NomeVariavel,
  Valor: string);
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

function TfrmPadrao._LerConfiguracoesRegistroBoolean(
  NomeVariavel: string; Adefault: Boolean): Boolean;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Boolean;
begin
  try
    vTemp := Adefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadBool(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function TfrmPadrao._LerConfiguracoesRegistroDouble(
  NomeVariavel: string): Double;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: double;
begin
  try
    vTemp := 0;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadFloat(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function TfrmPadrao._LerConfiguracoesRegistroInteger(
  NomeVariavel: string; Adefault: Integer): Integer;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Integer;
begin
  try
    vTemp := Adefault;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      if not Registro.ValueExists(NomeVariavel) then
        Exit;
      // L~e a informação da variavel
      vTemp := Registro.ReadInteger(NomeVariavel);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Result := vTemp;
      Registro.Free;
    end;
  except
  end;
end;

function TfrmPadrao._LerConfiguracoesRegistroString(NomeVariavel : string; Adefault: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    vTemp := Adefault;
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

function TfrmPadrao._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if (UpperCase(Application.MainForm.MDIChildren[X].Name) = UpperCase(pNomeFormMDI))
      	or (UpperCase(Application.MainForm.MDIChildren[X].ClassName) = UpperCase(pNomeFormMDI)) then
      begin
        Result := False;
        if trim(pMensagem) <> ''  then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	salvaConfiguracoesJanela;
  Action := cafree;
  frmPadrao := nil;
end;

procedure TfrmPadrao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	try
    if Assigned(eventoCloseQueryMainForm) then
    begin
      CanClose := eventoCloseQueryMainForm(Self.Name, nil, 'TfrmPadrao', fechar, exibirPergFechar);
      if fechar then
        CanClose := True
      else if not CanClose then
        salvaConfiguracoesJanela;
      Exit;
    end;
    CanClose := True;
  finally
    exibirPergFechar := True;
  end;
end;

procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
	fechar := False;
  exibirPergFechar := True;

  InibirEstatisticas := False;
  vHeight := Self.Height;
  vWidth  := Self.Width;
//
end;

procedure TfrmPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //
end;

procedure TfrmPadrao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F1 then
    MostraAjuda;
end;

procedure TfrmPadrao.FormShow(Sender: TObject);
begin
	verificaConfiguracoesJanela;

  if not Self.KeyPreview then
    Self.KeyPreview := true;
  registraEstatisticas;
end;

procedure TfrmPadrao.MostraAjuda;
var
  Parametro, NomeArquivo: string;
  handle: THandle;
  AjudaHtml: string;
begin
  NomeArquivo := 'Help.chm';
  AjudaHtml := Self.Name;
  if not FileExists(NomeArquivo) then
    raise Exception.CreateFmt('Arquivo de ajuda "%s" não encontrado.', [NomeArquivo]);

  if (AjudaHtml <> '') then
  begin
    Parametro := Format('%s::%s', [NomeArquivo, AjudaHtml + '.html']);
    if ShellExecute(handle, 'open', 'HH.exe', PChar(Parametro), nil, SW_SHOWDEFAULT) <= 32 then
      raise Exception.Create('Não foi possível abrir arquivo');
  end;
end;

end.

