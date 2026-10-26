unit UprincipalGestor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, Buttons, ExtCtrls,EnterantHw, Menus, StdCtrls,
  FileCtrl, AppEvnts, ExtDlgs;

type
  Tolap_pesquisageral_mdi = procedure(Atipo, ACodEmpresa, ADataBaseName, AUsuario, ACodUsuario: string);
  Tolap_pesquisageral_mdi_free = procedure();

  TFrmPrincipalGestor = class(TfrmPadrao)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton11: TSpeedButton;
    MainMenu1: TMainMenu;
    Opes1: TMenuItem;
    Metas1: TMenuItem;
    Finanas1: TMenuItem;
    Custos1: TMenuItem;
    PaineldeControle1: TMenuItem;
    Sair1: TMenuItem;
    Sobre1: TMenuItem;
    LadoaLadoVertical1: TMenuItem;
    LadoaLadoHorizontal1: TMenuItem;
    Cascata1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre2: TMenuItem;
    Ajuda2: TMenuItem;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Atalhos1: TMenuItem;
    Margem1: TMenuItem;
    CadastrarDNAdaEmpresa1: TMenuItem;
    CotaoCompraVenda1: TMenuItem;
    rocardeUsurio1: TMenuItem;
    Relatrios1: TMenuItem;
    FileListBox1: TFileListBox;
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    VerDimensesdareaparaimagem1: TMenuItem;
    Definirplanodefundo11: TMenuItem;
    DefinirPlanodeFundo21: TMenuItem;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure DefinirPlanodeFundo21Click(Sender: TObject);
    procedure Definirplanodefundo11Click(Sender: TObject);
    procedure VerDimensesdareaparaimagem1Click(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure rocardeUsurio1Click(Sender: TObject);
    procedure PaineldeControle1Click(Sender: TObject);
    procedure CotaoCompraVenda1Click(Sender: TObject);
    procedure Custos1Click(Sender: TObject);
    procedure Finanas1Click(Sender: TObject);
    procedure Metas1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure CadastrarDNAdaEmpresa1Click(Sender: TObject);
    procedure Margem1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Cascata1Click(Sender: TObject);
    procedure LadoaLadoHorizontal1Click(Sender: TObject);
    procedure LadoaLadoVertical1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Menu_Rel(Sender: TObject);
    function _LerConfiguracoesRegistroString(NomeVariavel: string): string;
    procedure _GravaConfiguracoesString(NomeVariavel, Valor: string);
  private
    { Private declarations }
    hMargem,hdativo,HdFormularios,hdEntrada,hdGestorChilds: Thandle;
    MySubItems: array[0..99] of TMenuItem; // Herbert

  public
    { Public declarations }
  end;

var
  FrmPrincipalGestor: TFrmPrincipalGestor;
  enterTela: TEnterHw;
//  hMargem: Thandle;

implementation

uses
  funcoes, uDtmAtivo, uDtmEntrada, uDadosIni, UdtmGestorHw, UMetas,
  Ufinanceiros, UCustosGestor, UPainelControl, uDtmMargemProduto,
  uMargemProduto, UCotacaoCompraVenda, UcadDNAEmpresa, UClassesGestor,
  URelCrystal,Registry;

procedure closeallAuditoria ;stdcall; external 'auditoria.dll';

{$R *.dfm}

procedure TFrmPrincipalGestor.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  inherited;
//vDadosIni.registraErro('GEST '+e.message);
end;

procedure TFrmPrincipalGestor.CadastrarDNAdaEmpresa1Click(Sender: TObject);
 var
  gestor: TGestorFormularios;
begin
  inherited;
 gestor := TGestorFormularios.Create;
 if not vDadosIni.PesqPros('GES007','ABRIR','CADASTRO DNA EMPRESA','','',gestor.cQuery,True) then
  Exit;
  if FrmcadDNAEmpresa = nil then
    FrmcadDNAEmpresa:=TFrmcadDNAEmpresa.Create(FrmcadDNAEmpresa);
  FrmcadDNAEmpresa.ShowModal;
end;

procedure TFrmPrincipalGestor.Cascata1Click(Sender: TObject);
begin
  inherited;
 Cascade;
end;

procedure TFrmPrincipalGestor.CotaoCompraVenda1Click(Sender: TObject);
begin
  inherited;
 SpeedButton6Click(Sender);
end;

procedure TFrmPrincipalGestor.Custos1Click(Sender: TObject);
begin
  inherited;
 SpeedButton3Click(Sender);
end;

procedure TFrmPrincipalGestor.Definirplanodefundo11Click(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
    _GravaConfiguracoesString(Image1.Name+'_1', OpenPictureDialog1.FileName);
end;

procedure TFrmPrincipalGestor.DefinirPlanodeFundo21Click(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
    _GravaConfiguracoesString(Image1.Name+'_2', OpenPictureDialog1.FileName);
end;

procedure TFrmPrincipalGestor.Finanas1Click(Sender: TObject);
begin
  inherited;
 SpeedButton2Click(Sender);
end;

procedure TFrmPrincipalGestor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  Canclose := Application.MessageBox('Deseja Sair do Sistema', 'ConfirmaÁ„o', MB_YESNO+MB_ICONQUESTION) = IDYES;
  if CanClose then
    closeallAuditoria;
end;

procedure TFrmPrincipalGestor.FormShow(Sender: TObject);
var
  vsubitem: TMenuItem;
  i: Integer;
begin
  inherited;
{  for I := 0 to ComponentCount - 1 do
    if Components[i] is TMenuItem then
      TMenuItem(Components[i]).Enabled := false;
 }
  CarregaPacote('pkAtivos', hdAtivo);
  CarregaPacote('pkEntrada', hdEntrada);
  CarregaPacote('pkFormularios', HdFormularios);
  CarregaPacote('PkGestorChilds',hdGestorChilds);
  dtmAtivo := TdtmAtivo.Create(dtmAtivo);
  dtmEnt := TdtmEnt.Create(dtmEnt);
  vDadosIni := TSingleton.GetInstance;
  vDadosIni.vSistema := 'Gestor';
//  panel1.Height := Height;
  if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True) then
  begin
    Abort;
    exit;
    Abort;
  end;
  if not dtmEnt.verificaEntrada then
  begin
    Exit;
    Abort;
  end;
  if DtmGestorHw = nil then
   DtmGestorHw:= TDtmGestorHw.Create(Self);

  StatusBar1.Panels[1].Text := 'Usu·rio: ' + vDadosIni.vNomeUsuario;
  StatusBar1.Panels[2].Text := 'NÌvel: ' + IntToStr(vDadosIni.vNivel);
  StatusBar1.Panels[3].Text := 'EndereÁo: ' + vDadosIni.vBancoHW;
  Caption := 'Hw Sac Gestor 4.0 - Hw Sistemas e Computadores';
//  if vDadosIni.vSistema = 'Automacao' then
  Application.Title := 'Hw Gestor 4.0';

  enterTela := TEnterHw.Create(Self);
  enterTela.ClassList.Clear;
  enterTela.classList.Add('TMaskEdit');
  enterTela.classList.Add('TEdit');
  enterTela.classList.Add('TDBEdit');
  enterTela.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
  enterTela.classList.Add('TCheckBox');
  enterTela.classList.Add('TDBCheckBox');
  enterTela.classList.Add('TComboBox');
  enterTela.classList.Add('TDBComboBox');
  enterTela.classList.Add('TListBox');
  enterTela.classList.Add('TDBListBox');
  enterTela.classList.Add('TDBLookupListBox');
  enterTela.classList.Add('TDBLookupComboBox');
  enterTela.classList.Add('TSpinEdit');
  enterTela.classList.Add('TDateTimePicker');
  enterTela.classList.Add('TRadioGroup');
  enterTela.classList.Add('TDBRadioGroup');
  enterTela.classList.Add('TRadioButton');
  enterTela.classList.Add('TDBRadioButton');
{  vMenu:= TMenusAuto.Create;
  vMenu.configurarMenus(vDadosIni.vDpto);
  vMenu.Free;
  vMenu := nil;}
  if vDadosIni.VpastaRel <> '' then
  begin
    try
      FileListBox1.Directory := vDadosIni.VpastaRel;
      FileListBox1.Refresh;
      if (FileListBox1.items.count - 1 >= 0) then
      begin
        MySubItems[2] := TMenuItem.Create(Self);
        MySubItems[2].Caption := 'Outros';
        MySubitems[2].Tag := 1;
        MySubitems[2].Name := 'OutrosRelatoriosEstoque';
        Relatrios1.Add(MySubItems[2]);
        //    i * 10;
    //      MainMenu1.Items[3].Add(MySubItems[2]);
        vsubitem := MySubItems[2];
      end;
      for i := 0 to FileListBox1.Items.Count - 1 do
      begin
        MySubItems[i] := TMenuItem.Create(Self);
        MySubItems[i].Caption := copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1);
        MySubItems[i].Hint := copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1);
        // 'Novo Subitem ' + IntToStr(i);
        MySubitems[i].Tag := 1;
        MySubitems[i].Name := vDadosIni.StringReplace2(
          copy(FileListBox1.Items.Strings[i], 1, pos('.',
          FileListBox1.items.Strings[i]) - 1),
            'Á«√„’ı Í¡·¿‡…ÈÕÌ”Û⁄˙&@-=+*{}()[] ',
          '                                 ', true);
        //i * 10;
        vsubitem.Add(MySubItems[i]);
        MySubItems[i].OnClick := Menu_Rel;
      end;
      FileListBox1.Directory := ExtractFilePath(Application.Exename);
      FileListBox1.Refresh;
     except
     on E: Exception do
     begin
        if messagedlg('Erro na criaÁ„o do Menu, Mostrar Erro?', mtconfirmation, [mbYES, mbNO], 0) =
          mrYES then
          showmessage(E.Message);
     end;
    end;
  end;
  if FileExists(  _LerConfiguracoesRegistroString(Image1.Name+'_2') ) then
   Image1.Picture.LoadFromFile(_LerConfiguracoesRegistroString(Image1.Name+'_2'))
  else if FileExists( ExtractFilePath(Application.ExeName) + 'logo4_2.jpg' ) then
   Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo4_2.jpg');
end;

procedure TFrmPrincipalGestor.LadoaLadoHorizontal1Click(Sender: TObject);
begin
  inherited;
  TileMode := tbHorizontal;
  Tile;
end;

procedure TFrmPrincipalGestor.LadoaLadoVertical1Click(Sender: TObject);
begin
  inherited;
  TileMode := TbVertical;
  Tile;
end;

procedure TFrmPrincipalGestor.Margem1Click(Sender: TObject);
begin
  inherited;
  CarregaPacote('Pkmargem',hMargem);
  dtmMargemProd:= TdtmMargemProd.Create(dtmAtivo);
  if frmMargemProduto = nil then
    frmMargemProduto:=TfrmMargemProduto.Create(frmMargemProduto);
  frmMargemProduto.ShowModal;
  UnloadPackage(hMargem);
end;

procedure TFrmPrincipalGestor.Menu_Rel(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    Application.CreateForm(TFrRelCrystal, FrRelCrystal);
    FrRelCrystal.Hint := vDadosIni.vPastaRel;
    FrRelCrystal.Caption := (Sender as TmenuItem).Hint;
    FrRelCrystal.tag := vDadosIni.vNivel;
    FrRelCrystal.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmPrincipalGestor.Metas1Click(Sender: TObject);
begin
  inherited;
  SpeedButton1Click(Sender);
end;

procedure TFrmPrincipalGestor.PaineldeControle1Click(Sender: TObject);
begin
  inherited;
 SpeedButton4Click(Sender);
end;

procedure TFrmPrincipalGestor.rocardeUsurio1Click(Sender: TObject);
begin
  inherited;
  if not dtmEnt.verificaEntrada then
  begin
    Exit;
    Abort;
  end;
  StatusBar1.Panels[1].Text := 'Usu·rio: ' + vDadosIni.vNomeUsuario;
  StatusBar1.Panels[2].Text := 'NÌvel: ' + IntToStr(vDadosIni.vNivel);
  StatusBar1.Panels[3].Text := 'EndereÁo: ' + vDadosIni.vBancoHW;
  Caption := 'Hw Sac Gestor 4.0 - Hw Sistemas e Computadores';
end;

procedure TFrmPrincipalGestor.Sair1Click(Sender: TObject);
begin
  inherited;
 Close;
end;

procedure TFrmPrincipalGestor.Sobre2Click(Sender: TObject);
//var
// i: double;
begin
//  inherited;
end;

procedure TFrmPrincipalGestor.SpeedButton1Click(Sender: TObject);
 var
  gestor: TGestorFormularios;
begin
  inherited;
  gestor := TGestorFormularios.Create;
  gestor.cadMetas(0);
  {if vDadosIni.PesqPros('GES001', '', 'METAS', true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      if FrmMetas = nil then
        Application.CreateForm(TFrmMetas, FrmMetas)
      else
        FrmMetas.show;
    finally
      Screen.Cursor := crDefault;
    end;
  end;}
end;

procedure TFrmPrincipalGestor.SpeedButton2Click(Sender: TObject);
 var
  gestor: TGestorFormularios;
begin
  inherited;
  gestor := TGestorFormularios.Create;
  gestor.cadFinancasCustos(0);
{  if vDadosIni.PesqPros('GES002', '', 'FINANCEIRO/CUSTOS', true) then
  begin
    try
      Screen.Cursor := crHourGlass;
      if FrmFinanceiros = nil then
        Application.CreateForm(TFrmFinanceiros, FrmFinanceiros)
      else
        FrmFinanceiros.show;
    finally
      Screen.Cursor := crDefault;
    end;
  end;}
end;

procedure TFrmPrincipalGestor.SpeedButton3Click(Sender: TObject);
 var
  gestor: TGestorFormularios;
begin
  inherited;
  gestor := TGestorFormularios.Create;
  gestor.cadEnsaiosProvisao(0);
{  try
    Screen.Cursor := crHourGlass;
    if FrmCustos = nil then
      Application.CreateForm(TFrmCustos, FrmCustos)
    else
      FrmCustos.show;
  finally
    Screen.Cursor := crDefault;
  end;}
end;

procedure TFrmPrincipalGestor.SpeedButton4Click(Sender: TObject);
 var
  gestor: TGestorFormularios;
begin
  inherited;
  gestor := TGestorFormularios.Create;
  gestor.cadPainelControle(0);
{  try
    Screen.Cursor := crHourGlass;
    if FrmPainelControl = nil then
      Application.CreateForm(TFrmPainelControl, FrmPainelControl)
    else
      FrmPainelControl.show;
  finally
    Screen.Cursor := crDefault;
  end;}
end;

procedure TFrmPrincipalGestor.SpeedButton5Click(Sender: TObject);
 var
  gestor: TGestorFormularios;
  Aolap_pesquisageral_mdi: Tolap_pesquisageral_mdi;
begin
  inherited;
 gestor := TGestorFormularios.Create;
 if not vDadosIni.PesqPros('GES006','CONSULTA','CONSULTAS DIVERSAS','','',gestor.cQuery,True) then
  Exit;

  if vDadosIni.vConsultasOLAP.AHandle = 0 then
    CarregaPacote('pkConsultasOLAP', vDadosIni.vConsultasOLAP.AHandle);

  @Aolap_pesquisageral_mdi := GetProcAddress(vDadosIni.vConsultasOLAP.AHandle, 'olap_pesquisageral_mdi');
  if Assigned(Aolap_pesquisageral_mdi) then
    Aolap_pesquisageral_mdi('1', vDadosIni.codEmpresa, vDadosIni.vBancoHW, vDadosIni.vNomeUsuario, IntToStr(vDadosIni.vCodUsuario));
end;

procedure TFrmPrincipalGestor.SpeedButton6Click(Sender: TObject);
 var
  gestor: TGestorFormularios;
begin
  inherited;
  gestor := TGestorFormularios.Create;
  gestor.cadCotacao(0);
{  try
    Screen.Cursor := crHourGlass;
    if FrmSugestCompraVenda = nil then
      Application.CreateForm(TFrmSugestCompraVenda, FrmSugestCompraVenda)
    else
      FrmSugestCompraVenda.show;
  finally
    Screen.Cursor := crDefault;
  end;}
end;

procedure TFrmPrincipalGestor.SpeedButton7Click(Sender: TObject);
begin
  inherited;
Close;
end;

procedure TFrmPrincipalGestor.VerDimensesdareaparaimagem1Click(Sender: TObject);
begin
  inherited;
  Application.MessageBox(pchar(IntToStr(Image1.Width)+ 'x' + IntToStr(Image1.Height)
  ), 'InformaÁ„o', 0 + 64);
end;

function TFrmPrincipalGestor._LerConfiguracoesRegistroString(
  NomeVariavel: string): string;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    vTemp := '';
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2∞. Par‚metro for True, ele cria a chave caso ela ainda n„o exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // L~e a informaÁ„o da variavel
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

procedure TFrmPrincipalGestor._GravaConfiguracoesString(NomeVariavel, Valor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2∞. Par‚metro for True, ele cria a chave caso ela ainda n„o exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informaÁıes do form
      Registro.WriteString(NomeVariavel, Valor);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

initialization
  RegisterClass(TFrmPrincipalGestor);
finalization
  UnRegisterClass(TFrmPrincipalGestor);

end.
