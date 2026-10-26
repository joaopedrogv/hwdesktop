unit uCadPadrao;

(************************ Hw Sistemas e Computadores ***************************
*   1. Formulário padrao de consulta                                           *
*   2. Coloca em ordem alfabética os itens dos combobox                        *
*   3. Ordena os campos ao clicar no titulo do grid(Ascendente e Descendente)  *
*   4. Configura as colunas em visivel ou invisivel e a ordem da coluna        *
*   5. A configuração é feita por usuário, na tabela CONFIG_COLUNAS            *
*   6. É feita a leitura do componente TClientDataSet passado como parametro,  *
*      verifica se o tag de cada Field para funcionamento: (0=configuravel),   *
*      (1=invisivel) , (2=semprevisivel) e(3=configuravel mas invisível quando *
*      logo que cria um novo usuário)                                          *
*   7. Se nao for passado nenhum ClientDataSet ao formulário ele irá trabalhar *
*      conforme foi definido no grid, não irá tentar efetuar nenhuma           *
*      configuração. Podendo assim definir os campos visiveis no próprio       *
*      DBGrid.                                                                 *
*    8. A funcao :setTClientDataSet(dtSet: TClientDataSet; nomeUsuario: string)*
*      onde o dtSet é o componente das configuracoes
*    9. Adicionar esta rotina no create do seu DataModule
*var
*  J, I: Integer;
*begin
*  for J := 0 to Self.ComponentCount - 1 do
*    if Self.Components[J] is TClientDataSet then
*      for I := 0 to TClientDataSet(Self.Components[J]).FieldCount - 1 do
*      begin
*        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXA' +
*          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
*          TClientDataSet(Self.Components[J]).Fields[I].FieldName, []);
*        TClientDataSet(Self.Components[J]).IndexDefs.Add('IDXD' +
*          TClientDataSet(Self.Components[J]).Fields[I].FieldName,
*          TClientDataSet(Self.Components[J]).Fields[I].FieldName, [ixDescending]);
*      end;
*******************************************************************************)

interface

uses
  Classes, ComCtrls, ExtCtrls, Menus, Buttons, Grids, DBGrids, Controls,
  StdCtrls, Mask, Forms, DBClient, IBDatabase,
  Windows, uEditMoeda, Spin, Graphics, Messages,
  AppEvnts, DB, IniFiles;

const
  panelConsulta: string = ('[Alt+P: Pesquisa ]   [Alt+N ou Ins: Novo]   [Alt+S: Sair]   [Del: Delete]');
  panelCadastro: string = ('[Alt+O: Confirmar]   [Alt+C ou ESC: Cancelar]   [Alt+S: Sair]');

  ECM_FIRST = $1500;
  EM_SHOWBALLOONTIP = (ECM_FIRST + 3);
  EM_HIDEBALLOONTIP = (ECM_FIRST + 4);
  TTI_NONE = 0;
  TTI_INFO = 1;
  TTI_WARNING = 2;
  TTI_ERROR = 3;

type
  TfrmCadPadrao = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    CheckBox3: TCheckBox;
    ScrollBox1: TScrollBox;
    PopupMenu1: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    Splitter1: TSplitter;
    PageControl3: TPageControl;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    TabSheet3: TTabSheet;
    ScrollBox3: TScrollBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    ComboBox3: TComboBox;
    Label5: TLabel;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    CheckCadSeq: TCheckBox;
    PanelFlash: TPanel;
    PanelFundo: TPanel;
    PanelLeft: TPanel;
    Splitter2: TSplitter;
    PopupMenu2: TPopupMenu;
    NoExibirPropaganda1: TMenuItem;
    ExibirPropaganda1: TMenuItem;
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    LabelSeq: TLabel;
    bMarketingHW: TBitBtn;
    ApplicationEventsPadrao: TApplicationEvents;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    tsMemo: TTabSheet;
    pnMemo: TPanel;
    listGrid: TListBox;
    spSairGrid: TSpeedButton;
    ReajustarLarguradascolunas1: TMenuItem;
    imgInformation: TImage;
    Copiarparareadetransferncia1: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure listGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spSairGridClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure MaskEdit3Enter(Sender: TObject);
    procedure ApplicationEventsPadraoMessage(var Msg: tagMSG;
      var Handled: Boolean);
    procedure bMarketingHWExit(Sender: TObject);
    procedure bMarketingHWClick(Sender: TObject);
    procedure PageControl3Enter(Sender: TObject);
    procedure PanelFlashEnter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GroupBox3Exit(Sender: TObject);
    procedure GroupBox3Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ExibirPropaganda1Click(Sender: TObject);
    procedure NoExibirPropaganda1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure LabelSeqClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure CheckCadSeqClick(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure ScrollBox2Exit(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AjustaLaguraColunas(Grid: TDBGrid);
    procedure WM_Sys(var Msg: TMessage); message WM_SysCommand;
    procedure Show;
    function ShowModal: Integer;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
  private
    { Private declarations }
    ArqIni: string;
    ArqConfig: TIniFile;
    FOnMessage: TMessageEvent;
    FOnMessageRescue: TMessageEvent;
    vTextoPadrao: string; //Texto padrao do status bar
    naoOrdenar: boolean; // Variavel auxiliar de ordenacao das colunas
    vCheck: TCheckBox;
    // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
    nomeDTSEt,vAlterarNomeDtSet, usuario: string;
    // variaveis que sao setadas dos formularios filhos informando o nome do clientdataset e o nome do usuario
    campoPesquisa: string;
    cdsColunas: TClientDataSet;
    trans: TIBTransaction;
    vTabela, vCampoPadrao: string;
    fReset, vCtrlClick, vShiftClick: Boolean;
    indexCol:integer;
    //variaveis excel
    excel, calc, sheet: variant;
    vLinhaExcel: integer;
    vCamposPadraoRegistro: Boolean;

    function GetIni(pChave, pIdentificador, pValorDefault: string): string;
    //clietdataset que recebe outro cliente dataset com as configuracoes ja selecionadas do usuario
    function cripSettings(wtexto: string): string;
    procedure mostraColunas; //metodo que le as configuracoes e configura o grid
    procedure gravaConfiguracaoUsuario; //metodo que grava as onfiguracoes do usuario
    procedure criaChecksColunas(pDtSetGrid: TClientDataSet);
    //metodo que cria um checkbox para cada campo da tabela
    procedure configuraChecks(pDtSetGrid: TClientDataSet);
    //Metodo que marca e desmarca check de acordo a configuracao
    procedure resetarConfiguracoesDeColunas;
    procedure gravaConfiguracoesRegistro;
    procedure leConfiguracoesRegistro;

    //rotinas excel
    function criarExcel:boolean;
    function criarCalc:boolean;

    //funcoes que ajustam as telas ao iniciar o formulario
    procedure verificaConfiguracoesJanela;
    procedure salvaConfiguracoesJanela; overload;
    procedure salvaConfiguracoesJanela(pWindowState: TWindowState); overload;

    procedure fDataseAfterClose(DataSet: TDataSet);

    procedure registraEstatisticas;
    function CriaIni: boolean;

  public
    { Public declarations }
    procedure setTClientDataSet(dtSet: TClientDataSet; nomeUsuario: string; transacao:
      TIBTransaction;pAlterarNomeDtSet:string='');
    //metodo que recebe os paramentros que serao utilizados
    procedure setNomeTabela(nomeTabela, campoPadrao: string);
    //rotinas excel
    function montarExcel:boolean;
    function montarCalc:boolean;
  var
  	vHeight, vWidth: Integer;
    fechar: Boolean;
    exibirPergFechar: Boolean;
  protected
    vConfigColuna : boolean;
    InibirEstatisticas: Boolean;
    statusDataset: string; //variável para indicar Insert ou Edit para fins de msg no 'erros.log' para o usuário
    TelaCadastro: integer; //Variável para indicar se já para cair direto na tela de cadastro
    clicouNoX: boolean;
    vShow: integer;
    vTitleClickFoco: integer;
    alturaForm, larguraForm, alturaDefault, larguraDefault: integer;
    controle: TControl;
    corControle: TColor;
    procedure MostraAjuda; overload;
    procedure MostraAjuda(AjudaHtml: string); overload;
    procedure configuraShow;
    procedure processaMensagem(var Msg: TMsg; var handled: boolean); virtual;
    property OnMessage: TMessageEvent read FOnMessage write FOnMessage;
    procedure statusBar(textoPadrao, hintControle: string);
    procedure MudaCor;
    procedure lixeiraVazia(vazia: boolean);
    function setFocusCampoErro(var pNomeCampoErro: string; pForcarFoco: Boolean = False): boolean; overload;
    function setFocusCampoErro(var pNomeCampoErro: string; var pMensagemErro: string; pForcarFoco: Boolean = False): boolean; overload;
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    procedure _GravaConfiguracoesDouble(NomeVariavel : string; Valor : Double);
    procedure _GravaConfiguracoesBoolean(NomeVariavel : string; Valor : Boolean);
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);
    function _LerConfiguracoesRegistroString(NomeVariavel : string) : string;
    function _LerConfiguracoesRegistroDouble(NomeVariavel : string) : Double;
    //Se de erro ao retornar do regitro ele retorna falso
    function _LerConfiguracoesRegistroBoolean(NomeVariavel : string) : Boolean;
    function _LerConfiguracoesRegistroInteger(NomeVariavel : string) : Integer;
    procedure ordemAlfabetica(lista: TStrings); //Função para ordenar TStrings
    procedure configuraVisual(nomeCampo: string);
    procedure mostrarHintEmBalao(Window : HWnd; Texto, Titulo : string; Tipo : Integer);
    procedure esconderHintEmBalao(Window : HWnd);
  end;

  type
    TEditBalloonTip = packed record
    cbStruct: DWORD;
    pszTitle: LPCWSTR;
    pszText: LPCWSTR;
    ttiIcon: Integer;
  end;

var
  frmCadPadrao: TfrmCadPadrao;

implementation

uses ShellAPI, Provider, IBQuery, DBCtrls, SysUtils, uExportPadrao,
  ActiveX, Registry, dateUtils, ComObj,  Clipbrd, uColunasExcel, Variants;

{$R *.dfm}

function hw_integra_estatistica_inc(banco, descricao: WideString; empresa: Integer): Integer; stdcall; external 'hw.utils.dx.dll';

procedure TfrmCadPadrao.AjustaLaguraColunas(Grid: TDBGrid);
var
  Tamanhos: array of Integer;
  I, Tam: Integer;
  //  DataSet: TDataSet;
begin
{  SetLength(Tamanhos, Grid.Columns.Count);
  for I := 0 to Grid.Columns.Count - 1 do
  begin
    if Grid.DataSource.DataSet.Fields[i] is TStringField then
    begin
      if Grid.DataSource.DataSet.Fields[i].Size>Grid.Canvas.TextWidth(Grid.Columns[I].Title.Caption)+10 then
        Tamanhos[I] := Grid.DataSource.DataSet.Fields[i].Size
      else Tamanhos[I] := Grid.Canvas.TextWidth(Grid.Columns[I].Title.Caption)+10;
    end
    else
      Tamanhos[I] := Grid.Canvas.TextWidth(Grid.Columns[I].Title.Caption)+10;
//    Grid.DataSource.DataSet.FieldByName(Grid.DataSource.DataSet.Fields[I].Name).
  end;
//  DataSet := Grid.DataSource.DataSet;
//  Grid.DataSource.DataSet.DisableControls;
//  try
//      for I := 0 to Grid.Columns.Count - 1 do
//      begin
//        Tam := Grid.Canvas.TextWidth(DataSet.Fields[I].Text);
//        Tam := Grid.Canvas.TextWidth(Grid.DataSource.DataSet.Fields[I].Text);
//        if Tam > Tamanhos[I] then
//          Tamanhos[I] := Tam;
//      end;
    for I := 0 to Grid.Columns.Count - 1 do
      Grid.Columns[I].Width := Tamanhos[I];// + 10;
//    Grid.Columns.RebuildColumns;
//  finally
//    Grid.DataSource.DataSet.EnableControls;
//    DataSet.EnableControls;
//  end;}

  for I := 0 to Grid.Columns.Count - 1 do
  begin
     //Irá redimensionar as colunas pelo tamanho do Caption -10
//    if Grid.DataSource.DataSet.FindField(Grid.Columns[I].Field.FieldName).FieldName = Grid.Columns[I].Field.FieldName then
//    begin
//      if Grid.DataSource.DataSet.FindField(Grid.Columns[I].Field.FieldName) is TStringField then
//      begin
//        if Grid.DataSource.DataSet.FindField(Grid.Columns[I].Field.FieldName).Size> Grid.Canvas.TextWidth(Grid.Columns[I].Title.Caption) then
//            Grid.Columns[I].Width := Grid.DataSource.DataSet.FindField(Grid.Columns[I].Field.FieldName).Size
//        else Grid.Columns[I].Width := Grid.Canvas.TextWidth(Grid.Columns[I].Title.Caption)-10;
//      end
//      else
        Grid.Columns[I].Width := Grid.Canvas.TextWidth(Grid.Columns[I].Title.Caption)+10;
//    end;
  end;

{// aqui tinha a idéia de ler as configuraçoes de tamanho de coluna do banco... mas não sei por quias cargas d'água só debugando funcionava aí abandonei a idéia.
    cdsColunas.IndexFieldNames := 'USUARIO;CAMPOS;FIELDNAME';
    if cdsColunas = nil then
      exit;
    if Grid.DataSource = nil then
      exit;
    if not cdsColunas.IsEmpty then
    begin
      for k := 0 to Grid.Columns.Count - 1 do
      for I := 0 to TClientDataSet(Grid.DataSource.DataSet).FieldCount - 1 do
      begin
        cdsColunas.FindNearest([usuario,
          cripSettings(TClientDataSet(Grid.DataSource.DataSet).Fields[i].Name),Grid.Columns[k].FieldName]);
        if (cdsColunas.FieldByName('campos').AsString =
          TClientDataSet(Grid.DataSource.DataSet).Fields[i].Name) and
          ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(usuario)) and
          (trim(cdsColunas.FieldByName('FIELDNAME').AsString) =
          Grid.Columns[k].FieldName) and (cdsColunas.FieldByName('TAMANHOCAMPO').AsInteger<>0) then
        begin
         Grid.Columns[k].Width := cdsColunas.FieldByName('TAMANHOCAMPO').AsInteger;
         break;
        end;
      end;
    end;
}
end;

procedure TfrmCadPadrao.ApplicationEventsPadraoMessage(var Msg: tagMSG;
  var Handled: Boolean);
begin
//  if (Msg.message = WM_KeyDown) then
    if (Msg.wParam = VK_RETURN) or (Msg.wParam = VK_TAB) then
    begin
      StatusBar1.Panels[1].Text := Application.Hint;
      if ((ActiveControl) is TControl) then
        statusBar('', TControl(ActiveControl).Hint);
    end;
end;

procedure TfrmCadPadrao.BitBtn1Click(Sender: TObject);
begin
  if (UpperCase(ComboBox1.Text) = 'TODOS') then
  begin
    MaskEdit1.Visible := false;
    MaskEdit2.Visible := false;
    MaskEdit3.Visible := true;
    MaskEdit3.Text := '';
  end;
  if trim(ComboBox1.Text) = '' then
  begin
    Application.MessageBox('Campo para pesquisa está vazio.', 'Alerta', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
    	ComboBox1.SetFocus;
    abort;
    exit;
  end;
  if MaskEdit3.Visible then
  begin
    if (trim(MaskEdit3.Text) = '') and (UpperCase(ComboBox1.Text) <> 'TODOS') then
    begin
      Application.MessageBox('Conteúdo da pesquisa está vazio.', 'Alerta', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
      	MaskEdit3.SetFocus;
      abort;
      exit;
    end;
  end
  else
    MaskEdit3.Text := '';
  Panel1.Visible := true;
  GroupBox3.Height := 73;
end;

procedure TfrmCadPadrao.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPadrao.BitBtn3Click(Sender: TObject);
begin
  if PageControl1.ActivePage <> TabSheet2 then
    PageControl1.ActivePage := TabSheet2;
  //  ActiveControl := BitBtn3;
  if (self.TelaCadastro = 0) and (self.CheckCadSeq.Tag = 0) then
  begin
    CheckCadSeq.Enabled := true;
    CheckCadSeq.Visible := true;
    LabelSeq.Enabled := true;
    LabelSeq.Visible := true;
  end;
  PageControl1.ActivePage := TabSheet1;
  statusBar(panelCadastro, '');
end;

procedure TfrmCadPadrao.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  //  PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
  if Panel1.Visible then
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	  DBGrid1.SetFocus;
  statusBar(panelConsulta, '');
  if self.TelaCadastro <> 0 then
    close;
end;

procedure TfrmCadPadrao.BitBtn5Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  if self.TelaCadastro <> 0 then
    close
  else if Panel1.Visible then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  statusBar(panelConsulta, '');
end;

procedure TfrmCadPadrao.bMarketingHWClick(Sender: TObject);
begin
//  if (Self.Enabled) and (Self.Visible) and (bMarkegingHW.CanFocus) then
//  	bMarketingHW.SetFocus;
//  PanelFlash.Tag := 1;
//  PanelFlash.Visible := false;
//  NoExibirPropaganda1.Visible := false;
//  ExibirPropaganda1.Visible := true;
//  PanelLeft.Width := PanelFundo.Width -5;
end;

procedure TfrmCadPadrao.bMarketingHWExit(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (PageControl3.Enabled) and (PageControl3.CanFocus) then
    PageControl3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (groupbox3.Enabled) and (groupbox3.CanFocus) then
    groupbox3.SetFocus;
end;

procedure TfrmCadPadrao.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 201
  else
    GroupBox3.Height := 73;
end;

procedure TfrmCadPadrao.CheckCadSeqClick(Sender: TObject);
begin
  if CheckCadSeq.Checked then
  begin
    LabelSeq.Font.Color := clRed;
    CheckCadSeq.Font.Color := clRed;
  end
  else
  begin
    LabelSeq.Font.Color := clTeal;
    CheckCadSeq.Font.Color := clTeal;
  end;
end;

procedure TfrmCadPadrao.CheckBox3Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 201
  else
    GroupBox3.Height := 73;
end;

procedure TfrmCadPadrao.ComboBox1Enter(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        exit;
      end;
    end;
  end;
end;

procedure TfrmCadPadrao.ComboBox1Exit(Sender: TObject);
var
  I: Integer;
  tipocampo: string;
begin
  if ActiveControl = BitBtn2 then
    Exit;

  if uppercase(ComboBox1.Text) <> 'TODOS' then
  begin
    ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(ComboBox1.Text);
    ComboBox1.Text := ComboBox1.Items[ComboBox1.ItemIndex];
    if ComboBox1.ItemIndex<0 then
      ComboBox1.ItemIndex := ComboBox1.Items.Count-1;
  end
  else begin
    ComboBox1.Text := 'Todos';
    MaskEdit3.Text:='';
    MaskEdit3.EditMask:='';
  end;
  if uppercase(ComboBox1.Text) <> 'TODOS' then
    ComboBox2.Text := ComboBox1.Text
  else
    ComboBox2.Text := ComboBox1.Items[0];

  if DBGrid1.DataSource <> nil then
//    for I := 0 to DBGrid1.Columns.Count - 1 do
    for I := 0 to DBGrid1.DataSource.DataSet.FieldCount - 1 do
    begin
      if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
      begin
        if (DBGrid1.DataSource.Dataset.Fields[I] is TIntegerField) or (DBGrid1.DataSource.DataSet.Fields[I] is TSmallintField) then
          tipocampo := 'I'
        else if (DBGrid1.DataSource.Dataset.Fields[I] is TCurrencyField) or (DBGrid1.DataSource.Dataset.Fields[I] is TFloatField) then
          tipocampo := 'F'
        else if DBGrid1.DataSource.DataSet.Fields[i] is TStringField then
          tipocampo := 'S'
        else if (DBGrid1.DataSource.DataSet.Fields[i] is TDateField) or (DBGrid1.DataSource.DataSet.Fields[i] is TDateTimeField) then
          tipocampo := 'D'
        else
          tipocampo := 'I';
        naoOrdenar := true;
        configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName);
        //        DBGrid1TitleClick(DBGrid1.Columns[i]);
        naoOrdenar := false;
        break; //Exit;
      end;
    end;
  if (tipocampo = 'I') or (tipocampo = 'F') then
  begin
    ComboBox3.Items.Clear;
    ComboBox3.Items.Add('Igual');
    ComboBox3.Items.Add('Começa');
    ComboBox3.Items.Add('Esta contido');
    ComboBox3.Items.Add('Diferente');
    ComboBox3.Items.Add('Maior');
    ComboBox3.Items.Add('Maior ou Igual');
    ComboBox3.Items.Add('Menor');
    ComboBox3.Items.Add('Menor ou Igual');
    //    ComboBox3.Items.Add('É Vazio');
//    ComboBox3.Items.Add('Não é Vazio');
  end
  else
  begin
    ComboBox3.Items.Clear;
    ComboBox3.Items.Add('Começa');
    ComboBox3.Items.Add('Esta contido');
    ComboBox3.Items.Add('Igual');
    ComboBox3.Items.Add('Diferente');
    ComboBox3.Items.Add('Maior');
    ComboBox3.Items.Add('Maior ou Igual');
    ComboBox3.Items.Add('Menor');
    ComboBox3.Items.Add('Menor ou Igual');
    //    ComboBox3.Items.Add('É Vazio');
    //    ComboBox3.Items.Add('Não é Vazio');
  end;
  tipocampo := '';
  for I := 0 to ComboBox3.Items.Count - 1 do
    if ComboBox3.Text = ComboBox3.Items[i] then
    begin
      tipocampo := ComboBox3.Text;
      break;
    end;
  if tipocampo = '' then
    ComboBox3.ItemIndex := 0;
end;

procedure TfrmCadPadrao.Configurarcolunas1Click(Sender: TObject);
begin
  if (cdsColunas = nil) or (not cdsColunas.Active) or (DBGrid1.DataSource = nil) then
    exit;
  configuraChecks(TClientDataSet(DBGrid1.DataSource.DataSet));
  GroupBox2.Visible := true;
  if (Self.Enabled) and (Self.Visible) and (ScrollBox2.CanFocus) then
  	ScrollBox2.SetFocus;
end;

function TfrmCadPadrao.cripSettings(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin //caso seja criptografado
  {  wsembranco := wtexto;
    wresultado := '';
    wtam := length(trim(wsembranco));
    wnormal := ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_';
    wcripto := '9z8x7c5v6b4n1m2a3s0dfghjklçqpwoeirutyP.O+I-U*Y/T,R_E;W=Q°A~S^D´F`';
    for wi := 1 to wtam do
    begin
      wposicao := pos(copy(wsembranco, wi, 1), wnormal);
      wresultado := wresultado + copy(wcripto, wposicao, 1);
    end;
    result := wresultado;}Result := wtexto;
end;

procedure TfrmCadPadrao.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  DBGrid1.Columns[ToIndex].Title.Font.Style := [fsBold];
  gravaConfiguracaoUsuario;
end;

procedure TfrmCadPadrao.DBGrid1EditButtonClick(Sender: TObject);
var
  I: Integer;
  formMemo: TForm;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    if DBGrid1.Columns[I].FieldName = DBGrid1.SelectedField.FieldName then
    begin
      try
        formMemo := TForm.Create(Application);
        formMemo.Position := poScreenCenter;
        formMemo.Caption := DBGrid1.Columns[I].Title.Caption;
        pnMemo.Parent := formMemo;
        formMemo.AutoSize := True;
        formMemo.AutoScroll := False;
        formMemo.KeyPreview := True;
        formMemo.BorderIcons:=[biSystemMenu];

        listGrid.Clear;
        listGrid.Items.Text := DBGrid1.SelectedField.AsString;

        formMemo.ShowModal;

      finally
        pnMemo.Parent := tsMEmo;
        formMemo.Free;
        formMemo := nil;
      end;

    end;
end;

procedure TfrmCadPadrao.DBGrid1TitleClick(Column: TColumn);
var
  i, t: integer; vTemp: string;
begin
  if TClientDataSet(DBGrid1.DataSource.DataSet) <> nil then
    TClientDataSet(DBGrid1.DataSource.DataSet).AfterClose := fDataseAfterClose;

  if (Column.Field<>nil) and (Column.Field.FieldKind = fkInternalCalc) then
    exit;
  if DBGrid1.DataSource = nil then
    exit;
  if vCtrlClick then
  begin
    configuraVisual(Column.FieldName);
    vCtrlClick:=false;
    exit;
  end;

  if vShiftClick then
  begin
    if (TClientDataSet(DBGrid1.DataSource.DataSet).IndexName <> '') and
      (copy(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName, 1, 4) <> 'IDX$') then
      vTemp := TClientDataSet(DBGrid1.DataSource.DataSet).IndexName + ';' + Column.Field.FieldName
    else
    begin
      vTemp := Column.Field.FieldName;
      for I := 0 to DBGrid1.Columns.Count - 1 do
        DBGrid1.Columns[i].Title.Font.Style := [];
    end;
    TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
    TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( vTemp, vTemp , []);
    try
      TClientDataSet(DBGrid1.DataSource.DataSet).IndexName := vTemp;
      Column.Title.Font.Style := [fsBold];
    except
    end;

  end
  else
  if (not naoOrdenar) and (TClientDataSet(DBGrid1.DataSource.DataSet).Active) then
  begin
    // Aqui todas as colunas voltam para fonte normal
    for I := 0 to DBGrid1.Columns.Count - 1 do
      DBGrid1.Columns[i].Title.Font.Style := [];
    
    TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
    if TClientDataSet(DBGrid1.DataSource.DataSet).Tag = 0 then // a Propriedade TAG do clientDataSet serve para definir a ordem ascendente quando 1 e descendent quando 2
    begin
      TClientDataSet(DBGrid1.DataSource.DataSet).Tag := 1;
      vTemp := 'IDX$A' + Column.Field.FieldName;
      TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add(vTemp, Column.Field.FieldName,[]);
    end
    else if TClientDataSet(DBGrid1.DataSource.DataSet).Tag = 1 then
    begin
      TClientDataSet(DBGrid1.DataSource.DataSet).Tag := 0;
      vTemp := 'IDX$D' + Column.Field.FieldName;
      TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add(vTemp, Column.Field.FieldName,[ixDescending]);
    end;    
    TClientDataSet(DBGrid1.DataSource.DataSet).IndexName := vTemp;
    Column.Title.Font.Style := [fsBold];
  end;
  //Aqui a coluna que foi clicada fica em negrito para destaque.  
  
  if DBGrid1.DataSource <> nil then
    if TClientDataSet(DBGrid1.DataSource.DataSet).active then
      TClientDataSet(DBGrid1.DataSource.DataSet).First;
end;

procedure TfrmCadPadrao.ExibirPropaganda1Click(Sender: TObject);
begin
//  PanelFlash.Tag := 0;
//  PanelLeft.Width := PanelFundo.Width - 200;
//  PanelFlash.Visible := true;
//  ExibirPropaganda1.Visible := false;
//  NoExibirPropaganda1.Visible := true;
end;

procedure TfrmCadPadrao.fDataseAfterClose(DataSet: TDataSet);
begin
  TClientDataSet(DataSet).IndexName := '';
end;

function TfrmCadPadrao.montarCalc: boolean;
var
	OpenDesktop, Documento, Sheets, Sheet, Celula, Planilha: Variant;
  Connect, OpenOffice: Variant;
  vTemp: string;
  vPointer: Pointer;
  vCor: integer;
  I, J: Integer;
  DataAux: TDateTime;
  DiaAux: word;
  MesAux: word;
  AnoAux: word;
  vListaErrosExcel: TStringList;
  vSize: Integer;
begin

	Application.CreateForm(TfrmColunasExcel, frmColunasExcel);
  frmColunasExcel.vDataSetTabela := TClientDataSet(DBGrid1.DataSource.DataSet);
  frmColunasExcel.vNomeUsuario := usuario;
  frmColunasExcel.vTitulo := Self.Caption;
  frmColunasExcel.vTransacao := trans;
  frmColunasExcel.ShowModal;
  Exit;

  if criarCalc then
  begin
    try
      //Cria o link OLE com o OpenOffice
      if VarIsEmpty(OpenOffice) then
        OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
      Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

      //Inicia o Calc
      OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
      Documento   := OpenDesktop.LoadComponentFromURL('private:factory/scalc',
                        '_blank', 0, VarArrayCreate([0, -1], varVariant));
      Planilha    := Documento.getSheets.getByName('Planilha1');
      Sheets      := Documento.Sheets;
      Sheet       := Sheets.getByIndex(0);

      //Criar linha inicial
      Celula := Planilha.getCellByPosition(i, 0);
      Celula.CharWeight := 200;
      Sheet.getCellByPosition(i, 0).setString('Exportação de dados para Planilha');

      //Definir largura colunas
      for I := 0 to DBGrid1.Columns.Count - 1 do
      begin
        if (I = 0) then
        begin
          if Length('Exportação de dados para Planilha') > (TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I].FieldName).Size) then
            vSize := Length('Exportação de dados para Planilha')
          else
            vSize := TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I].FieldName).Size;
        end
        else
          vSize := TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I].FieldName).Size;
        Planilha.getColumns.getByIndex(i).width := vSize * 220;
      end;

      //Preencher colunas planilha
      j := 1;
      for I := 0 to DBGrid1.Columns.Count - 1 do
      begin
        Celula := Planilha.getCellByPosition(i, j);
        Celula.CharWeight := 200;
        Celula.CellBackColor := '39423';
        Sheet.getCellByPosition(i, j).setString(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I].FieldName).DisplayName);
      end;

      //Preencher linhas planilha
      vPointer:=TClientDataSet(DBGrid1.DataSource.DataSet).GetBookmark;
      vListaErrosExcel := TStringList.Create;
      vListaErrosExcel.Clear;

      j := 2;
      TClientDataSet(DBGrid1.DataSource.DataSet).First;
      while not TClientDataSet(DBGrid1.DataSource.DataSet).Eof do
      begin
        for I := 1 to DBGrid1.Columns.Count  do
        begin
          try
            vTemp := Trim(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsString);
            if vTemp = '' then
            else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TTimeField then
            begin
            	if not TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).IsNull then
              begin
                DataAux := TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsDateTime;
                Sheet.getCellByPosition(i, j).setString(FormatDateTime('hh:mm:ss', DataAux));
              end;
            end
            else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TDateTimeField then
            begin
            	if not TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).IsNull then
              begin
                DataAux:=TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsDateTime;
                DecodeDate(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsDateTime, AnoAux, MesAux, DiaAux);
                if DataAux-EncodeDate(AnoAux, MesAux, DiaAux) = 0 then
                  Sheet.getCellByPosition(i, j).setString(FormatDateTime('dd/mm/yyyy', EncodeDate(AnoAux, MesAux, DiaAux)))
                else
                  Sheet.getCellByPosition(i, j).setString(FormatDateTime('dd/mm/yyyy', DataAux));
              end;
            end
            else if (TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TIntegerField) and (trim(vTemp) <> '')  then
            	Sheet.getCellByPosition(i, j).setValue(StrToInt(vTemp))
            else if (TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TFloatField) and (trim(vTemp) <> '')  then
            begin
            	Sheet.getCellByPosition(i, j).setValue(StrToFloat(vTemp));
              if (TFloatField(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName)).currency) then
              	Sheet.getCellByPosition(i, j).NumberFormat := 21
              else
                Sheet.getCellByPosition(i, j).NumberFormat := 4;
            end
            else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TStringField then
              Sheet.getCellByPosition(i, j).setString(vTemp)
            else
              Sheet.getCellByPosition(i, j).setString(vTemp);

            Celula := Planilha.getCellByPosition(i, j);
            
            if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TTimeField then
            	Celula.HoriJustify   := 3
        	  else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TDateTimeField then
            	Celula.HoriJustify   := 3
            else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TFloatField then
            	Celula.HoriJustify   := 3
            else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TIntegerField then
            	Celula.HoriJustify   := 3;
              
            if ((j mod 2) = 1) then
              Celula.CellBackColor := 8303567
            else
              Celula.CellBackColor := 13893372;
          except
            on e: exception do
            begin
              vListaErrosExcel.Add(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).DisplayName + ': ' +
                'Linha: ' + IntToStr(DBGrid1.DataSource.DataSet.RecNo) +
                ' Conteúdo: ' + Copy(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsString, 1, 20)
              );
            end;
          end;
        end;
        j := j + 1;

        TClientDataSet(DBGrid1.DataSource.DataSet).Next;
      end;

      TClientDataSet(DBGrid1.DataSource.DataSet).GotoBookmark(vPointer);
    finally
    	if Assigned(vListaErrosExcel) then
      begin
        if vListaErrosExcel.Count > 0 then
          Application.MessageBox(PChar('Alguns dados não foram copiados para o Calc.' + #13 + vListaErrosExcel.Text), 'Atenção', 0 + 64);
      end;
    end;
  end;
end;

function TfrmCadPadrao.montarExcel: boolean;
var
  vTemp: string;
  vPointer: Pointer;
  vCor: integer;
  I: Integer;
  DataAux: TDateTime;
  DiaAux: word;
  MesAux: word;
  AnoAux: word;
begin
	CriaIni;
	if trim(ArqConfig.ReadString('Sistema', 'OpenOfficeExportRel', 'N')) = 'S' then
  begin
	  montarCalc;
    exit;
  end;

  Application.CreateForm(TfrmColunasExcel, frmColunasExcel);
  frmColunasExcel.vDataSetTabela := TClientDataSet(DBGrid1.DataSource.DataSet);
  frmColunasExcel.vNomeUsuario := usuario;
  frmColunasExcel.vTitulo := Self.Caption;
  frmColunasExcel.vTransacao := trans;
  frmColunasExcel.ShowModal;
  Exit;
  
  if criarExcel then
  begin
    try
      vPointer:=TClientDataSet(DBGrid1.DataSource.DataSet).GetBookmark;

      vLinhaExcel := 3;
      TClientDataSet(DBGrid1.DataSource.DataSet).First;
      while not TClientDataSet(DBGrid1.DataSource.DataSet).Eof do
      begin
        for I := 1 to DBGrid1.Columns.Count  do
        begin
          vTemp := Trim(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsString);
          if vTemp = '' then
          else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TDateTimeField then
          begin
            DataAux:=TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsDateTime;
            DecodeDate(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsDateTime, AnoAux, MesAux, DiaAux);
            if DataAux-EncodeDate(AnoAux, MesAux, DiaAux) = 0 then
              sheet.cells[vLinhaExcel, I].Value := EncodeDate(AnoAux, MesAux, DiaAux)
            else
            	sheet.cells[vLinhaExcel, I].Value := DataAux;//datetostr(DataAux);
//            sheet.cells[vLinhaExcel, I].Value := EncodeDate(YearOf(StrToDate(vTemp)),MonthOf(StrToDate(vTemp)),DayOf(StrToDate(vTemp)))
          end
          else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TFloatField then
          begin
            sheet.cells[vLinhaExcel, I].Value := StrToFloat(StringReplace(vTemp,'.','',[rfReplaceAll]));
            vTemp := Trim(TFloatField(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName)).DisplayFormat);
            if vTemp <> '' then
            begin
              vTemp := StringReplace(vTemp,'#','',[rfReplaceAll]);
              vTemp := StringReplace(vTemp,'.',',',[rfReplaceAll]);
            end
            else
              vTemp := '0,00';
            sheet.cells[vLinhaExcel, I].NumberFormat := vTemp;
          end
          else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TStringField then
          begin
            sheet.cells[vLinhaExcel, I].NumberFormat := '@';
            sheet.cells[vLinhaExcel, I].Value := vTemp;
          end
          else
            sheet.cells[vLinhaExcel, I] := vTemp;

          if (vLinhaExcel mod 2) = 1 then
            sheet.cells[vLinhaExcel, I].Interior.Color := 8303567//ColorToRGB(clYellow)
          else
            sheet.cells[vLinhaExcel, I].Interior.Color := 13893372;//ColorToRGB(clSkyBlue);
        end;

        Inc(vLinhaExcel);

        TClientDataSet(DBGrid1.DataSource.DataSet).Next;
      end;

      TClientDataSet(DBGrid1.DataSource.DataSet).GotoBookmark(vPointer);

      excel.Cells.EntireRow.AutoFit;
      excel.Cells.EntireColumn.AutoFit;
    finally
      excel.visible := True;
    end;
  end;
end;


procedure TfrmCadPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := false;
  PageControl1.ActivePage := TabSheet2;
  GroupBox3.Visible := True;
  GroupBox3.Enabled := True;
  ActiveControl := BitBtn2;
  if (cdsColunas <> nil) and (DBGrid1.DataSource <> nil) then
    configuraChecks(TClientDataSet(DBGrid1.DataSource.DataSet));
//  if (cdsColunas <> nil) and (not fReset) then
//    gravaConfiguracaoUsuario;
  gravaConfiguracoesRegistro;
  salvaConfiguracoesJanela;
  Action := cafree;
  frmCadPadrao := nil;
end;

procedure TfrmCadPadrao.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	try
    if Assigned(eventoCloseQueryMainForm) then
    begin
      CanClose := eventoCloseQueryMainForm(Self.Name, DBGrid1, 'TfrmCadPadrao', fechar, exibirPergFechar);
      if fechar then
        CanClose := True
      else if not CanClose then
        gravaConfiguracoesRegistro;
      Exit;
    end;
    CanClose := True;
  finally
    exibirPergFechar := True;
  end;
end;

procedure TfrmCadPadrao.FormCreate(Sender: TObject);
begin
	fechar := False;
  exibirPergFechar := True;
  
  indexCol:=0;
  vTabela := '';
  vCampoPadrao := '';
  PanelFundo.Caption := '';
  PanelFlash.Caption := '';
  PanelLeft.Caption := '';
  fReset:= False; vCtrlClick := False; vShiftClick := False;
  InibirEstatisticas := False;
  vHeight := Self.Height;
  vWidth  := Self.Width;
  {if not (csDesigning in ComponentState) then
  begin
    FOnMessageRescue := Application.OnMessage;
    Application.OnMessage := processaMensagem;
  end;}
//  for I := 0 to TForm(Sender).ComponentCount - 1 do
//  begin
//    if ((TForm(Sender).Components[i]) is TControl) then
//      TControl(TForm(Sender).Components[i]).ShowHint := true;
//  end;
end;

procedure TfrmCadPadrao.FormDestroy(Sender: TObject);
begin
  if Assigned(FOnMessageRescue) then
    Application.OnMessage := FOnMessageRescue;
  if (clicouNoX) then
    abort;
end;

procedure TfrmCadPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, k: integer;
begin
  vCtrlClick := Key = VK_CONTROL;
  vShiftClick := Key = VK_SHIFT;
  if Key = vk_f8 then
  begin
    if (CheckBox3.visible) and (PageControl1.ActivePage = TabSheet2) then
      CheckBox3.Checked := not CheckBox3.Checked;
  end
  else if Key = vk_f9 then
  begin
    if (CheckBox1.visible) and (PageControl1.ActivePage = TabSheet2) then
      CheckBox1.Checked := not CheckBox1.Checked;
  end
  else if (key = vk_f2) and (self.TelaCadastro = 0) and CheckCadSeq.Enabled then
  begin
    if PageControl1.ActivePage = TabSheet1 then
      self.CheckCadSeq.Checked := not self.CheckCadSeq.Checked;
    if CheckCadSeq.Checked then
    begin
      self.CheckCadSeq.Font.Color := clRed;
      LabelSeq.Font.Color := clRed;
    end
    else
    begin
      LabelSeq.Font.Color := clTeal;
      self.CheckCadSeq.Font.Color := clTeal;
    end;
    self.CheckCadSeq.Refresh;
  end
  else if (key = vk_f3) then
  begin
    if PageControl1.ActivePage = TabSheet2 then
    begin
      if MaskEdit3.Visible then
      begin
        if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
      	  MaskEdit3.SetFocus;
      end
      else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
        MaskEdit1.SetFocus;
    end;
  end
  else if (key = vk_f7) then
  begin
    if PageControl1.ActivePage = TabSheet2 then
    begin

      if vTabela = 'PRODUTOS' then
      begin
        for i := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
        begin
          if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'COD_PROD')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'DESCR_PROD') then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'COD_PROD' then
                begin
                  ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    MaskEdit1.SetFocus;
                  exit;
                end;
            end
            else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'DESCR_PROD')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'NUM_FAB_PROD') then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'DESCR_PROD' then
                begin
                  ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  naoOrdenar := true;
                  configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName);
                  naoOrdenar := false;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    MaskEdit1.SetFocus;
                  exit;
                end;
            end
            else if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'NUM_FAB_PROD' then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'NUM_FAB_PROD' then
                begin
                  ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  naoOrdenar := true;
                  configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName);
                  naoOrdenar := false;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    MaskEdit1.SetFocus;
                  exit;
                end;
            end;
          end
        end;
      end
      else if vTabela = 'CLIENTES' then
      begin
        for i := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
        begin
          if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
          begin
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'COD_CLIENTE')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'NOME_CLIENTE') then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'COD_CLIENTE' then
                begin
                  ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    MaskEdit1.SetFocus;
                  exit;
                end;
            end
            else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'NOME_CLIENTE')
              and (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'CPFCGC') then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'NOME_CLIENTE' then
                begin
                  ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    MaskEdit1.SetFocus;
                  exit;
                end;
            end
            else if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName <> 'CPFCGC' then
            begin
              for k := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
                if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].FieldName = 'CPFCGC' then
                begin
                  ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[k].DisplayLabel;
                  if MaskEdit3.Visible then
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
                    	MaskEdit3.SetFocus;
                  end
                  else if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    MaskEdit1.SetFocus;
                  exit;
                end;
            end;
          end
        end;
      end;
    end;
  end
end;

procedure TfrmCadPadrao.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_CONTROL then
    vCtrlClick := False;
  if Key = VK_SHIFT then
    vShiftClick := False;
if Key = VK_F1 then
    MostraAjuda;
end;

procedure TfrmCadPadrao.FormResize(Sender: TObject);
begin

  if PanelFlash.Tag <> 1 then
  begin
    if Width > PanelLeft.Width then
    begin
//      PanelFlash.Visible := true;
//      if Flash = nil then
//      begin
//        CoInitialize(nil);
//        Flash := TShockwaveFlash.Create(self);
//        Flash.Parent := PanelFlash;
//        FlashThread := ThreadFlash.CriarFlash(Flash, PanelFlash, false);
//        NoExibirPropaganda1.Visible := true;
//      end;
    end
    else
    begin
//      PanelFlash.Visible := false;
//      PanelLeft.Width := PanelFundo.Width - 5;
    end;
  end
  else
    PanelLeft.Width := PanelFundo.Width - 5;
end;

procedure TfrmCadPadrao.FormShow(Sender: TObject);
var
  I: Integer;
  fieldVisivel: boolean;
begin
	if not Self.Enabled then
  begin
  	if DBGrid1.DataSource <> nil then
    	leConfiguracoesRegistro;
    Exit;
  end;

	vCamposPadraoRegistro := (GetIni('Sistema', 'CamposPadraoPesquisaNoRegistro', 'N') = 'S');
  imgInformation.ShowHint := True;
  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
                    'Ctrl + Click no nome da coluna para alterar o texto do "Campo" para pesquisa'+ #13 +
                    'Shift + Click no nome da coluna para Ordernar por mais de uma coluna' + #13 +
                    'Click Direito do Mouse no GRID para mais Opções';
  Application.HintPause:=200; //meio segundo para mostrar o hint
  Application.HintHidePause:=10000; //tempo de duração = 5 segundos
  tsMemo.TabVisible := False;
  fieldVisivel := false;
  PageControl1.Height := ClientHeight;
  PageControl1.Width := Width;
  PanelFundo.Width := Width;
  Splitter2.Left := Width;
  PanelLeft.Width := Width;
  PanelFlash.Visible := False;
  Width := Width + 10;
  if vShow <> 1 then
    top := 0;

  vShow := 1;

  vTitleClickFoco := 0;

  if (self.TelaCadastro = 0) and (self.CheckCadSeq.Tag = 0) then
  begin
    CheckCadSeq.Font.Color := clTeal;
    LabelSeq.Font.Color := clTeal;
  end
  else
  begin
    CheckCadSeq.Enabled := false;
    CheckCadSeq.Visible := false;
    LabelSeq.Enabled := false;
    LabelSeq.Visible := false;
  end;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  GroupBox3.Height := 73;
  naoOrdenar := true;

  naoOrdenar := false;
  if (Self.Enabled) and (Self.Visible) and (ComboBox1.Enabled) and (ComboBox1.CanFocus) then
  	ComboBox1.SetFocus;
  if DBGrid1.DataSource <> nil then
  begin
//    nomeDTSEt := TClientDataSet(DBGrid1.DataSource.DataSet).Name+vAlterarNomeDtSet;
//    leConfiguracoesRegistro;
    if vTabela <> '' then
    begin
      for I := 0 to DBGrid1.Columns.Count - 1 do //  TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
      begin
        if DBGrid1.Columns[i].FieldName = vCampoPadrao then //if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao then
        begin
          try
            vCtrlClick := True;
            DBGrid1TitleClick(DBGrid1.Columns[i]);
          finally
            vCtrlClick := False;
          end;
          break;
        end;
      end;
    end
    else
    begin
      if (UpperCase(ComboBox1.Text) = 'TODOS') then
      begin
        try
          vCtrlClick := True;
          DBGrid1TitleClick(DBGrid1.Columns[0]);
        finally
          vCtrlClick := False;
        end;
        ComboBox1.Text := 'Todos';
      end
      else
      begin
         ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(ComboBox1.Text);
         if ComboBox1.ItemIndex<0 then
         begin
           ComboBox1.ItemIndex := ComboBox1.Items.Count-1;
           try
            vCtrlClick := True;
            DBGrid1TitleClick(DBGrid1.Columns[0]);
          finally
            vCtrlClick := False;
          end;
         end;
        ComboBox1Exit(ComboBox1);
      end;
    end;
  end;
  if not TForm(Sender).KeyPreview then
    TForm(Sender).KeyPreview := true;

  vTitleClickFoco := 1;

  if (UpperCase(ComboBox1.Text) = 'TODOS') or (trim(ComboBox1.Text)='') then
  begin
    MaskEdit1.Visible := False;
    MaskEdit2.Visible := False;
    MaskEdit3.Visible := True;
    MaskEdit3.EditMask :='';
  end;

  if uppercase(ShortDateFormat[1]) <> 'D' then
    ShortDateFormat := 'dd/mm/yyyy';
  for i := 0 to ComponentCount - 1 do //Testando aqui se o form tem algum campo MaskEdit.
  begin
    if (Components[i] is TMaskEdit) then
      if (pos('  /  /    ', TMaskEdit(Components[i]).Text) <> 0) or
        (pos('  -  -    ', TMaskEdit(Components[i]).Text) <> 0) or
        (pos('  .  .    ', TMaskEdit(Components[i]).Text) <> 0) then
      begin
        if (length(ShortDateFormat) <= 8) and (pos('yyyy', ShortDateFormat) = 0) then
        begin
          TMaskEdit(Components[i]).EditMask := '!99/99/00;1;_';
          TMaskEdit(Components[i]).Text := datetostr(date);
        end
        else
        begin
          TMaskEdit(Components[i]).EditMask := '!99/99/0000;1;_';
          TMaskEdit(Components[i]).Text := datetostr(date);
        end;
      end;
    if (Components[i] is TControl) then
      TControl(Components[i]).ShowHint := true;
  end;
  if PageControl1.ActivePage = TabSheet2 then
    statusBar(panelConsulta, '')
  else if PageControl1.ActivePage = TabSheet1 then
    StatusBar(panelCadastro, '');
  //jp  Timer1.Enabled := true;
  verificaConfiguracoesJanela;
  vConfigColuna := false;
  DBGrid1.ShowHint := False;
  StatusBar1.Panels[0].Width := StatusBar1.Width;
end;

function TfrmCadPadrao.GetIni(pChave, pIdentificador,
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
    ArqConfig.Free;
  end;
end;

procedure TfrmCadPadrao.configuraShow;
var
  I: Integer;
begin
	if not Self.Enabled then
  begin
  	if DBGrid1.DataSource <> nil then
    	leConfiguracoesRegistro;
    Exit;
  end;
  
  PageControl1.Height := ClientHeight;
  PageControl1.Width := Width;
  Splitter2.Left := Width;
//  PanelLeft.Width := Width;
//  PanelFlash.left := Width;

  if vShow <> 1 then
    top := 0;

  vShow := 1;

  vTitleClickFoco := 0;

  CheckCadSeq.Font.Color := clTeal;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  GroupBox3.Height := 73;
  naoOrdenar := true;

  naoOrdenar := false;

  ComboBox1.Clear;
  ComboBox2.Clear;
  if DBGrid1.DataSource <> nil then
  begin
    for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
    begin
      if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible) and
        (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldKind = fkData) then
        ComboBox1.Items.Add(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName);

      if (vTabela = 'PRODUTOS') and (trim(vCampoPadrao) <> '') then
      begin
        if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao) then
          ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
      end
      else if (vTabela = 'CLIENTES') and (trim(vCampoPadrao) <> '') then
      begin
        if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao) then
          ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
      end
      else if (vTabela = 'VEICULOS') and (trim(vCampoPadrao) <> '') then
      begin
        if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao) then
          ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
      end
      else
        ComboBox1.Text := 'Todos';
    end;
  end;
  ordemAlfabetica(ComboBox1.Items);
  ComboBox2.Items := ComboBox1.Items;
  ComboBox1.Items.Add('Todos');
  ComboBox2.Text := ComboBox2.Items[0];
  if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
  	ComboBox1.SetFocus;
  if DBGrid1.DataSource <> nil then
  begin
    leConfiguracoesRegistro;
    nomeDTSEt := TClientDataSet(DBGrid1.DataSource.DataSet).Name+vAlterarNomeDtSet;
    if vTabela <> '' then
    begin
      for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
        if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao then
        begin
          try
            vCtrlClick := True;
            DBGrid1TitleClick(DBGrid1.Columns[i]);
          finally
            vCtrlClick := False;
          end;
          break;
        end;
    end
    else for I := 0 to DBGrid1.FieldCount - 1 do   //      DBGrid1TitleClick(DBGrid1.Columns[0]);
        if DBGrid1.Fields[i].DisplayName = ComboBox1.Text then
        begin
           try
            vCtrlClick := True;
            DBGrid1TitleClick(DBGrid1.Columns[i]);
          finally
            vCtrlClick := False;
          end;
           break;
        end;
  end;
  if not Self.KeyPreview then
    Self.KeyPreview := true;

  vTitleClickFoco := 1;

  if uppercase(ShortDateFormat[1]) <> 'D' then
    ShortDateFormat := 'dd/mm/yyyy';
  for i := 0 to ComponentCount - 1 do //Testando aqui se o form tem algum campo MaskEdit.
  begin
    if (Components[i] is TMaskEdit) then
      if (pos('  /  /    ', TMaskEdit(Components[i]).Text) <> 0) or
        (pos('  -  -    ', TMaskEdit(Components[i]).Text) <> 0) or
        (pos('  .  .    ', TMaskEdit(Components[i]).Text) <> 0) then
      begin
        if (length(ShortDateFormat) <= 8) and (pos('yyyy', ShortDateFormat) = 0) then
        begin
          TMaskEdit(Components[i]).EditMask := '!99/99/00;1;_';
          TMaskEdit(Components[i]).Text := datetostr(date);
        end
        else
        begin
          TMaskEdit(Components[i]).EditMask := '!99/99/0000;1;_';
          TMaskEdit(Components[i]).Text := datetostr(date);
        end;
      end;
  end;
end;

procedure TfrmCadPadrao.configuraVisual(nomeCampo: string);
var
  i: integer;
  vNomeCampo: string;
  vDisplay: Boolean;
begin
  vNomeCampo := nomeCampo;
  vDisplay := Pos('*', vNomeCampo) > 0;
  if vDisplay then
    vNomeCampo := Copy(vNomeCampo, 2,length(vNomeCampo));
  if DBGrid1.DataSource <> nil then
  begin
    for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
    begin
      if ((TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vNomeCampo) and (not vDisplay)) or
      ((TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = vNomeCampo) and (vDisplay)) then
      begin
        if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i] is TDateTimeField then
        begin
          MaskEdit3.Visible := false;
          MaskEdit1.Visible := true;
          MaskEdit2.Visible := true;
          Label4.Visible := true;
          if (uppercase(ShortDateFormat[1]) <> 'D') or (length(ShortDateFormat) > 10) then
            if pos('.', ShortDateFormat) <> 0 then
              ShortDateFormat := 'dd.mm.yyyy'
            else
              ShortDateFormat := 'dd/mm/yyyy';
          if (length(ShortDateFormat) <= 8) and (pos('yyyy', ShortDateFormat) = 0) then
          begin
            MaskEdit1.EditMask := '!99/99/00;1;_';
            MaskEdit2.EditMask := '!99/99/00;1;_';
            if MaskEdit1.Text = '  /  /  ' then
              MaskEdit1.Text := DateToStr(Date);
            if MaskEdit2.Text = '  /  /  ' then
              MaskEdit2.Text := DateToStr(Date);
          end
          else
          begin
            MaskEdit1.EditMask := '!99/99/0000;1;_';
            MaskEdit2.EditMask := '!99/99/0000;1;_';
            if MaskEdit1.Text = '  /  /    ' then
              MaskEdit1.Text := DateToStr(Date);
            if MaskEdit2.Text = '  /  /    ' then
              MaskEdit2.Text := DateToStr(Date);
          end;
          ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          ComboBox2.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          Break;
        end
        else
        begin
          MaskEdit3.Visible := true;
          MaskEdit1.Visible := false;
          MaskEdit2.Visible := false;
          Label4.Visible := true;
          MaskEdit3.EditMask := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].EditMask;
          ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          ComboBox2.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          Break;
        end;
      end;
    end;
  end;
  if (ActiveControl <> BitBtn1) and (ActiveControl <> BitBtn3) then
    if MaskEdit1.canfocus then
       MaskEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit3.canfocus) then
      MaskEdit3.SetFocus;
end;

procedure TfrmCadPadrao.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TfrmCadPadrao.criaChecksColunas(pDtSetGrid: TClientDataSet);
var
  k, i, altura: integer;
  jaexiste: boolean;
begin
  jaexiste := false;
  jaexiste := false;
  cdsColunas.IndexFieldNames := 'campos';
  altura := 0;
  for I := 0 to pDtSetGrid.FieldCount - 1 do
  begin
    for k := 0 to ComponentCount - 1 do //Testando aqui o CheckBox já não existe.
    begin
      if (Components[k] is TCheckBox) then
        if pDtSetGrid.Fields[i].Name = TCheckBox(Components[k]).Name then
        begin
          jaexiste := true;
        end;
    end;
    if not jaexiste then
    begin
      altura := altura + 15;
      vCheck := TCheckBox.create(Self);
      vCheck.Alignment := taRightJustify;
      vCheck.Parent := ScrollBox2;
      vCheck.Name := pDtSetGrid.Fields[i].Name;
      vCheck.Caption := pDtSetGrid.Fields[i].DisplayName;
      vCheck.Tag := pDtSetGrid.Fields[i].Index;
      vCheck.Left := 16;
      vCheck.Width := 225;
      vCheck.Top := altura;
      vCheck.Visible := true;
      vCheck.Checked := pDtSetGrid.Fields[I].Visible;
      if not((pDtSetGrid.Fields[I].Tag = 0) or (pDtSetGrid.Fields[I].Tag = 3))  then
        vCheck.Enabled := false;
    end;
  end;
end;

function TfrmCadPadrao.CriaIni: boolean;
begin
	try
    Result := true;
    ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
    if not FileExists(ArqIni) then
      ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
    ArqConfig := TIniFile.Create(ArqIni);
  except
    Result := false;
  end;
end;

function TfrmCadPadrao.criarCalc: boolean;
begin
	try
    calc := CreateOleObject('com.sun.star.ServiceManager');

    Result := True;

  except
    Result := False;
    Application.MessageBox ('Versão do OpenOffice Calc Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
end;

function TfrmCadPadrao.criarExcel: boolean;
var
  I, J: Integer;
  vtemp: string;
begin
  try
    excel := CreateOleObject('Excel.Application');

    Result := True;

  except
    Result := False;
    Application.MessageBox ('Versão do Microsoft Office Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
  try
    excel.Workbooks.add;
    sheet := excel.Workbooks[1].sheets[1];
    sheet.cells[1,01] := Self.Caption;
    sheet.cells[1,01].Font.Size := 12;
    sheet.cells[1,01].Font.Bold := True;

    for I := 1 to DBGrid1.Columns.Count  do
      if DBGrid1.Columns[I - 1].Visible then
      begin
        vtemp := TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).DisplayName;
        sheet.cells[2, I] := vtemp;
        sheet.cells[1,01].Font.Bold := True;
        sheet.cells[2, I].Interior.Color := $00ffcf9c;
      end;
  except

  end;
end;

procedure TfrmCadPadrao.configuraChecks(pDtSetGrid: TClientDataSet);
var
  i, j: integer;
begin
  for I := 0 to pDtSetGrid.FieldCount - 1 do
  begin
    for j := 0 to Self.ComponentCount - 1 do
      if (Components[j] is TCheckBox) and (Components[j].Name = pDtSetGrid.Fields[i].Name) then
      begin
        if (pDtSetGrid.Fields[I].Tag = 0) or (pDtSetGrid.Fields[I].Tag = 3) then
          TCheckBox(Components[j]).Checked := pDtSetGrid.Fields[i].Visible
        else if (pDtSetGrid.Fields[I].Tag = 1) then
          TCheckBox(Components[j]).Checked := false
        else if (pDtSetGrid.Fields[I].Tag = 2) then
          TCheckBox(Components[j]).Checked := true;
        Break;
      end;
  end;
end;

procedure TfrmCadPadrao.mostraColunas;
var
  Settings: TIniFile;
  i, idx, j, menor: integer;
  temp: string;
begin

  cdsColunas.IndexFieldNames := 'USUARIO;CAMPOS';
  try
    if cdsColunas = nil then
      exit;
    if DBGrid1.DataSource = nil then
      exit;
    if not cdsColunas.IsEmpty then
    begin
      for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
      begin
        cdsColunas.FindNearest([usuario,
          cripSettings(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Name)]);
        if (cdsColunas.FieldByName('campos').AsString =
          cripSettings(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Name)) and
          ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(usuario)) then
        begin
          if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Tag = 0) or (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Tag = 3) then
            TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible :=
              (cdsColunas.FieldByName('visivel').AsInteger = 1)
          else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Tag = 1) then
            TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible := false
          else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Tag = 2) then
            TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible := true;
        end;
      end;
    end
    else
    begin
      for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
      begin
        if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Tag = 0) then
          TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible := True
        else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Tag = 1) then
          TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible := False
        else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Tag = 2) then
          TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible := True
        else if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Tag = 3) then
          TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible := false;
      end;
    end;

    if not cdsColunas.IsEmpty then
    begin
      temp := cdsColunas.IndexFieldNames;
      cdsColunas.IndexFieldNames := 'USUARIO;COMPONENTE;ORDEM';
      cdsColunas.First;
      cdsColunas.FindNearest([trim(usuario), nomeDTSEt, cdsColunas.FieldByName('ordem').AsInteger]);
      while not cdsColunas.Eof do
      begin
        if cdsColunas.FieldByName('ordem').AsInteger > -1 then
          for I := TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 downto 0 do
            if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Name =
              cdsColunas.FieldByName('campos').AsString) and
              ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(usuario)) then
            begin
              TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Index :=
                cdsColunas.FieldByName('ordem').AsInteger;
              Break;
            end;
        cdsColunas.Next;
        if cdsColunas.FieldByName('componente').AsString <> nomeDTSEt then
          Break;
      end;
      cdsColunas.IndexFieldNames := temp;
    end;
  finally
    ComboBox1.Clear;
    ComboBox2.Clear;
    if DBGrid1.DataSource <> nil then
    begin
      for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
      begin
        if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible) and
          (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldKind = fkData) then
          ComboBox1.Items.Add(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName);

        if (vTabela = 'PRODUTOS') and (trim(vCampoPadrao) <> '') then
        begin
          if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao) then
            ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
        end
        else if (vTabela = 'CLIENTES') and (trim(vCampoPadrao) <> '') then
        begin
          if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao) then
            ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
        end
        else if (vTabela = 'VEICULOS') and (trim(vCampoPadrao) <> '') then
        begin
          if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vCampoPadrao) then
            ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName;
        end
        else
          ComboBox1.Text := 'Todos';
      end;
    end;
    ComboBox1.Sorted  := True;
    ComboBox2.Items := ComboBox1.Items;
    ComboBox1.Items.Add('Todos');
    ComboBox2.Text := ComboBox2.Items[0];
    nomeDTSEt := TClientDataSet(DBGrid1.DataSource.DataSet).Name+vAlterarNomeDtSet;
    leConfiguracoesRegistro;
    Settings.Free;
  end;
end;

procedure TfrmCadPadrao.MudaCor;
begin
  exit;  // para não ter mais qualquer funcionalidade no sistema.
  if ((ActiveControl) is TDBEdit) then
    TDBEdit(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TEdit) then
    TEdit(ActiveControl).Color := clInactiveCaptionText
  else if ((ActiveControl) is TDBComboBox) then
    TDBComboBox(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TComboBox) then
    TComboBox(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TDBLookupComboBox) then
    TDBLookupComboBox(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TDBListBox) then
    TDBListBox(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TListBox) then
    TListBox(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TMaskEdit) then
    TMaskEdit(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TSpinEdit) then
    TSpinEdit(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TDBMemo) then
    TDBMemo(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TMemo) then
    TMemo(ActiveControl).Color := 16041126
  else if ((ActiveControl) is TDBGrid) then
    TDBGrid(ActiveControl).Color := clInfoBk;
  if (controle <> nil) and (controle.Name <> ActiveControl.Name) then
    TEdit(controle).Color := clWindow;
  if ((ActiveControl) is TDBEdit) then
    controle := TDBEdit(ActiveControl)
  else if ((ActiveControl) is TEdit) then
    controle := TEdit(ActiveControl)
  else if ((ActiveControl) is TDBComboBox) then
    controle := TDBComboBox(ActiveControl)
  else if ((ActiveControl) is TComboBox) then
    controle := TComboBox(ActiveControl)
  else if ((ActiveControl) is TDBLookupComboBox) then
    controle := TDBLookupComboBox(ActiveControl)
  else if ((ActiveControl) is TDBListBox) then
    controle := TDBListBox(ActiveControl)
  else if ((ActiveControl) is TListBox) then
    controle := TListBox(ActiveControl)
  else if ((ActiveControl) is TMaskEdit) then
    controle := TMaskEdit(ActiveControl)
  else if ((ActiveControl) is TSpinEdit) then
    controle := TSpinEdit(ActiveControl)
  else if ((ActiveControl) is TDBMemo) then
    controle := TDBMemo(ActiveControl)
  else if ((ActiveControl) is TMemo) then
    controle := TMemo(ActiveControl)
  else if ((ActiveControl) is TDBGrid) then
    controle := TDBGrid(ActiveControl);
end;

procedure TfrmCadPadrao.NoExibirPropaganda1Click(Sender: TObject);
begin
//  PanelFlash.Tag := 1;
  //  Flash.Stop;
//  PanelFlash.Visible := false;
//  PanelLeft.Width := PanelFundo.Width - 5;
//  NoExibirPropaganda1.Visible := false;
//  ExibirPropaganda1.Visible := true;
end;

procedure TfrmCadPadrao.ordemAlfabetica(lista: TStrings);
var
  ok: Boolean;
  indice: integer;
  valor: string;
begin
  repeat
    ok := False;
    indice := 0;
    repeat
      if CompareStr(UpperCase(lista[indice]), UpperCase(lista[indice + 1])) > 0 then
      begin
        valor := lista[indice];
        lista[indice] := lista[indice + 1];
        lista[indice + 1] := valor;
        ok := True;
      end;
      Inc(indice);
    until (indice >= (lista.Count - 1));
  until (ok = False);
end;

procedure TfrmCadPadrao.PageControl3Enter(Sender: TObject);
begin
  if ActiveControl = TabSheet3 then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadPadrao.PanelFlashEnter(Sender: TObject);
begin
  //  Perform(WM_NEXTDLGCTL, 0, 0);
  if (ActiveControl = bMarketingHW) then
  	if (Self.Enabled) and (Self.Visible) and (bMarketingHW.CanFocus) then
    	bMarketingHW.SetFocus;
end;

procedure TfrmCadPadrao.processaMensagem(var Msg: TMsg; var handled: boolean);
begin
  if Screen <> nil then
    if Screen.ActiveControl <> nil then
 {     if (Msg.message = WM_KeyDown) then
        Timer1.Enabled := (Msg.wParam = VK_RETURN) or (Msg.wParam = VK_TAB) or ((Msg.wParam >= 112) and (Msg.wParam <= 135))
      else if Msg.message = WM_LBUTTONDOWN then
        Timer1.Enabled := true;}

  if Assigned(FOnMessageRescue) then
    FOnMessageRescue(Msg, Handled);
  if Assigned(FOnMessage) then
    FOnMessage(Msg, Handled);
end;

procedure TfrmCadPadrao.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  AjustaLaguraColunas(DBGrid1);
end;

procedure TfrmCadPadrao.registraEstatisticas;
var
//  AUsuario, ASenha: string;
  I: Integer;
  db: TIBDatabase;
begin
  if (not InibirEstatisticas) and (trans <> nil) then
  begin
    InibirEstatisticas := True;
    {
    AUsuario := 'sysdba';
    ASenha := 'masterkey';
    for I := 0 to trans.DefaultDatabase.Params.Count - 1 do
      if Pos('user_name=', LowerCase(trans.DefaultDatabase.Params[I])) > 0 then
        AUsuario := StringReplace(trans.DefaultDatabase.Params[I], 'user_name=', '', [rfReplaceAll, rfIgnoreCase])
      else if Pos('password=', LowerCase(trans.DefaultDatabase.Params[I])) > 0 then
        ASenha := StringReplace(trans.DefaultDatabase.Params[I], 'password=', '', [rfReplaceAll, rfIgnoreCase]);
    }

    try
      Label5.Hint := 'Sts ' + IntToStr(
        hw_integra_estatistica_inc(WideString(padrao_DBName), WideString(Self.Name), padrao_EmpresaId)
      );
    except
    end;
  end;
end;

procedure TfrmCadPadrao.resetarConfiguracoesDeColunas;
begin
  if Application.MessageBox('Você deverá sair sistema para que as alterações tenham efeito. Deseja continuar?', 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  cdsColunas.Close;
  cdsColunas.CommandText := 'select * from config_colunas where usuario = ' +
    QuotedStr(usuario)+' and componente = '+QuotedStr(nomeDTSEt);
  cdsColunas.Open;

  while not cdsColunas.IsEmpty do
    cdsColunas.Delete;

  cdsColunas.ApplyUpdates(-1);

  trans.Commit;
  trans.StartTransaction;
  fReset := True;
end;

procedure TfrmCadPadrao.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  resetarConfiguracoesDeColunas;
end;

procedure TfrmCadPadrao.salvaConfiguracoesJanela(pWindowState: TWindowState);
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

procedure TfrmCadPadrao.salvaConfiguracoesJanela;
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

procedure TfrmCadPadrao.SalvardadosnoExcel1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    montarExcel;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPadrao.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmCadPadrao.ScrollBox2Exit(Sender: TObject);
begin
  if (cdsColunas = nil) or (not cdsColunas.Active) or (not vConfigColuna) then
    exit;
  gravaConfiguracaoUsuario;
  GroupBox2.Visible := false;
  mostraColunas;
end;

function TfrmCadPadrao.setFocusCampoErro(var pNomeCampoErro: string;
  pForcarFoco: Boolean): boolean;
var
  vComponenteW : TWinControl;
begin
  try
    Result := False;
    if (FindComponent(pNomeCampoErro) <> nil) and (pForcarFoco) then
      if not TWinControl(FindComponent(pNomeCampoErro)).CanFocus then
      begin
        vComponenteW := TWinControl(FindComponent(pNomeCampoErro));
        while vComponenteW.Parent <> nil do
        begin
          if vComponenteW.Parent is TTabSheet then
          	if TTabSheet(vComponenteW.Parent).Enabled then
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
        TWinControl(FindComponent(pNomeCampoErro)).SetFocus;
        pNomeCampoErro:='';
        Result := True;
      end;
  except
  end;
end;

function TfrmCadPadrao.setFocusCampoErro(var pNomeCampoErro,
  pMensagemErro: string; pForcarFoco: Boolean): boolean;
var
  vComponenteW : TWinControl;
begin
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

procedure TfrmCadPadrao.setNomeTabela(nomeTabela, CampoPadrao: string);
begin
  if (nomeTabela <> 'PRODUTOS') and (nomeTabela <> 'CLIENTES') and (nomeTabela <> 'VEICULOS') then
  begin
    vTabela := '';
    vCampoPadrao := '';
  end
  else
  begin
    vTabela := nomeTabela;
    vCampoPadrao := CampoPadrao;
  end;
end;

procedure TfrmCadPadrao.gravaConfiguracaoUsuario;
var
  i, t: integer;
begin
  t := 0;
  //  trans.StartTransaction;
  if cdsColunas = nil then
    exit;
  cdsColunas.Close;
  cdsColunas.CommandText := 'select * from config_colunas where usuario = ' +
    QuotedStr(usuario)+' and componente = '+QuotedStr(nomeDTSEt);
  cdsColunas.Open;
  cdsColunas.IndexFieldNames := 'USUARIO;CAMPOS';

  if DBGrid1.DataSource = nil then
    exit;
  with Self do
    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TCheckBox) then
        if (TCheckBox(Components[i]).Parent = ScrollBox2) and (TCheckBox(Components[i]).Enabled) then
        begin
          cdsColunas.FindNearest([usuario, cripSettings(TCheckBox(Components[i]).Name)]);
          if (cdsColunas.FieldByName('campos').AsString =
            cripSettings(TCheckBox(Components[i]).Name)) and
            ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(usuario)) then
          begin
            cdsColunas.Edit;
            if TCheckBox(Components[i]).Checked then
              cdsColunas.FieldByName('visivel').AsInteger := 1
            else
              cdsColunas.FieldByName('visivel').AsInteger := 0;
            cdsColunas.Post;
          end
          else
          begin
            cdsColunas.Insert;
            if cdsColunas.State = dsInsert then
              inc(t);
            cdsColunas.FieldByName('usuario').AsString := usuario;
            cdsColunas.FieldByName('componente').AsString := nomeDTSEt;
            cdsColunas.FieldByName('campos').AsString :=
              cripSettings(TCheckBox(Components[i]).Name);
            if TCheckBox(Components[i]).Checked then
              cdsColunas.FieldByName('visivel').AsInteger := 1
            else
              cdsColunas.FieldByName('visivel').AsInteger := 0;
            cdsColunas.FieldByName('ordem').AsInteger := 0;
            cdsColunas.Post;
            cdsColunas.ApplyUpdates(-1);
          end;
        end;
  for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
  begin
    cdsColunas.FindNearest([usuario,
      cripSettings(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].name)]);
    if (cdsColunas.FieldByName('campos').AsString =
      cripSettings(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Name)) and
      ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(usuario)) then
    begin
      cdsColunas.Edit;
      if (cdsColunas.FieldByName('visivel').AsInteger = 1) then
        cdsColunas.FieldByName('ordem').AsInteger :=
          TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Index
      else
        cdsColunas.FieldByName('ordem').AsInteger := -1;
        {for k := 0 to DBGrid1.Columns.Count-1 do   //Aqui estava tentanto utiliazar a gravação de configuração de tamanho de campo para ajustar as colunas
         if DBGrid1.Columns[k].FieldName=TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName then
         begin
          cdsColunas.FieldByName('TAMANHOCAMPO').AsInteger:= DBGrid1.Columns[k].Width;// DataSource.DataSet.FindField(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName));
          cdsColunas.FieldByName('FIELDNAME').AsString:=DBGrid1.Columns[k].FieldName;
          break;
         end;}
      cdsColunas.Post;
    end
    else
    begin
      cdsColunas.Insert;
      cdsColunas.FieldByName('usuario').AsString := usuario;
      cdsColunas.FieldByName('componente').AsString := nomeDTSEt;
      cdsColunas.FieldByName('campos').AsString :=
        TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Name;
      cdsColunas.FieldByName('ordem').AsInteger :=
        TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Index;
      if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Tag = 1 then
        cdsColunas.FieldByName('visivel').AsInteger := 0
      else
        cdsColunas.FieldByName('visivel').AsInteger := 1;
      cdsColunas.Post;
      cdsColunas.ApplyUpdates(-1);
    end;
  end;
  if cdsColunas.ChangeCount > 0 then
  begin
    cdsColunas.ApplyUpdates(-1);
    trans.Commit;
    trans.StartTransaction;
  end;
end;

procedure TfrmCadPadrao._GravaConfiguracoesBoolean(NomeVariavel: string;
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

procedure TfrmCadPadrao._GravaConfiguracoesDouble(NomeVariavel: string;
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

procedure TfrmCadPadrao._GravaConfiguracoesInteger(NomeVariavel: string;
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

procedure TfrmCadPadrao._GravaConfiguracoesString(NomeVariavel,
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

function TfrmCadPadrao._LerConfiguracoesRegistroBoolean(
  NomeVariavel: string): Boolean;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Boolean;
begin
  try
    vTemp := False;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
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

function TfrmCadPadrao._LerConfiguracoesRegistroDouble(
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

function TfrmCadPadrao._LerConfiguracoesRegistroInteger(
  NomeVariavel: string): Integer;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: Integer;
begin
  try
    vTemp := 0;
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
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

function TfrmCadPadrao._LerConfiguracoesRegistroString(NomeVariavel : string): string;
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
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
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

function TfrmCadPadrao._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
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

procedure TfrmCadPadrao.gravaConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
  	if Self.ClassName = 'TFrmCadPedVenda' then
    	Exit;
      
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString('Campo', ComboBox1.Text);
      Registro.WriteString('Condicao', ComboBox3.Text);
      Registro.WriteString('DataIni', MaskEdit1.Text);
      Registro.WriteString('DataFim', MaskEdit2.Text);
      Registro.WriteString('PalavraChave', MaskEdit3.Text);
      Registro.WriteBool('MaskEdit1',MaskEdit1.Visible);
      Registro.WriteBool('MaskEdit2',MaskEdit2.Visible);
      Registro.WriteBool('MaskEdit3',MaskEdit3.Visible);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadPadrao.GroupBox3Enter(Sender: TObject);
begin
  if GroupBox3.Height = 73 then
  begin
    CheckBox3.Checked := false;
    CheckBox1.Checked := false;
  end;
end;

procedure TfrmCadPadrao.GroupBox3Exit(Sender: TObject);
begin
  if GroupBox3.Height = 73 then
  begin
    CheckBox3.Checked := false;
    CheckBox1.Checked := false;
  end;
end;

procedure TfrmCadPadrao.esconderHintEmBalao(Window: HWnd);
begin
  SendMessageW(Window, EM_HIDEBALLOONTIP, 0, 0);
end;

procedure TfrmCadPadrao.LabelSeqClick(Sender: TObject);
begin
  if CheckCadSeq.Tag = 0 then
  begin
    CheckCadSeq.Checked := not CheckCadSeq.Checked;
    if CheckCadSeq.Checked then
    begin
      CheckCadSeq.Font.Color := clRed;
      LabelSeq.Font.Color := clRed
    end
    else
    begin
      LabelSeq.Font.Color := clTeal;
      CheckCadSeq.Font.Color := clTeal;
    end;
  end;
end;

procedure TfrmCadPadrao.leConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
  	if Self.ClassName = 'TFrmCadPedVenda' then
    	Exit;
      
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      vTemp := Registro.ReadString('Campo');
      if (vCampoPadrao = '') and (vTemp <> '') then
        ComboBox1.Text := vTemp;
      vTemp := Registro.ReadString('Condicao');
      if vTemp <> '' then
        ComboBox3.Text := vTemp;
      vTemp := Registro.ReadString('DataIni');
      if vTemp <> '' then
        MaskEdit1.Text := vTemp;
      vTemp := Registro.ReadString('DataFim');
      if vTemp <> '' then
        MaskEdit2.Text := vTemp;
      vTemp := Registro.ReadString('PalavraChave');
      if vTemp <> '' then
        MaskEdit3.Text := vTemp;
      try
        MaskEdit1.Visible := Registro.ReadBool('MaskEdit1');
        MaskEdit2.Visible := Registro.ReadBool('MaskEdit2');
        MaskEdit3.Visible := Registro.ReadBool('MaskEdit3');
      except
        MaskEdit1.Visible := false;
        MaskEdit2.Visible := false;
        MaskEdit3.Visible := true;
        MaskEdit3.EditMask:='';
      end;
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadPadrao.listGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    spSairGrid.Click;
end;

procedure TfrmCadPadrao.lixeiraVazia(vazia: boolean);
begin
  if vazia then
  begin
    SpeedButton25.Visible := false;
    SpeedButton5.Visible := false;
    SpeedButton1.Visible := true;
  end
  else
    SpeedButton25.Visible := true;
end;

procedure TfrmCadPadrao.MostraAjuda;
var
  Parametro, NomeArquivo: string;
  handle: THandle;
  AjudaHtml: string;
begin
  NomeArquivo := ExtractFilePath(ParamStr(0)) + 'Help.chm';
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

procedure TfrmCadPadrao.MaskEdit1Exit(Sender: TObject);
var
  vDataI: string;
begin
  if (ActiveControl <> BitBtn2) and (ActiveControl <> BitBtn3) then
  begin
    vDataI := StringReplace(MaskEdit1.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataI := StringReplace(vDataI, '.', '', [rfReplaceAll, rfIgnoreCase]);
    try
      if ((vDataI <> '      ') and (vDataI <> '        ')) then
        StrToDate(MaskEdit1.Text);
    except
      Application.MessageBox(Pchar('Data informada errada.' + chr(13) + 'Preencha no formato ' +
        StringReplace(ShortDateFormat, 'y', 'a', [rfReplaceAll, rfIgnoreCase])), 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
      	MaskEdit1.SetFocus;
    end;
  end;
end;

procedure TfrmCadPadrao.MaskEdit2Exit(Sender: TObject);
var
  vDataF: string;
begin
  if (ActiveControl <> BitBtn2) and (ActiveControl <> BitBtn3) then
  begin
    vDataF := StringReplace(MaskEdit2.Text, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '-', '', [rfReplaceAll, rfIgnoreCase]);
    vDataF := StringReplace(vDataF, '.', '', [rfReplaceAll, rfIgnoreCase]);
    try
      if ((vDataF <> '      ') and (vDataF <> '        ')) then
        StrToDate(MaskEdit2.Text);
    except
      Application.MessageBox(Pchar('Data informada errada.' + chr(13) + 'Preencha no formato ' +
        StringReplace(ShortDateFormat, 'y', 'a', [rfReplaceAll, rfIgnoreCase])), 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (MaskEdit2.CanFocus) then
      	MaskEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmCadPadrao.MaskEdit3Enter(Sender: TObject);
begin
  if UpperCase(ComboBox1.Text)='TODOS' then
  begin
    if (MaskEdit3.EditMask='!99/99/00;1;_') or (MaskEdit3.EditMask= '!99/99/0000;1;_') then
    begin
      MaskEdit3.Text:='';
      MaskEdit3.EditMask:='';
    end;
  end;
end;

procedure TfrmCadPadrao.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
  begin
    if ComboBox1.ItemIndex > 0 then
    begin
      ComboBox1.ItemIndex := ComboBox1.ItemIndex - 1;
      ComboBox1Exit(Sender);
    end;
  end
  else if Key = VK_DOWN then
  begin
    if ComboBox1.ItemIndex < (ComboBox1.Items.Count - 1) then
    begin
      ComboBox1.ItemIndex := ComboBox1.ItemIndex + 1;
      ComboBox1Exit(Sender);
    end;
  end;
end;

procedure TfrmCadPadrao.MostraAjuda(AjudaHtml: string);
var
  Parametro, NomeArquivo: string;
  handle: THandle;
begin
  NomeArquivo := ExtractFilePath(ParamStr(0)) + 'Help.chm';
  if not FileExists(NomeArquivo) then
    raise Exception.CreateFmt('Arquivo de ajuda "%s" não encontrado.', [NomeArquivo]);

  if (AjudaHtml <> '') then
  begin
    Parametro := Format('%s::%s', [NomeArquivo, AjudaHtml + '.html']);
    if ShellExecute(handle, 'open', 'HH.exe', PChar(Parametro), nil, SW_SHOWDEFAULT) <= 32 then
      raise Exception.Create('Não foi possível abrir arquivo');
  end;
end;

procedure TfrmCadPadrao.setTCLientDataSet(dtSet: TClientDataSet; nomeUsuario: string; transacao:
  TIBTransaction;pAlterarNomeDtSet:string='');
begin
  //Chamar este método em cada formulário no evento onshow depois do datasourse do dbgrid já setado e antes do 'inherited'
  vAlterarNomeDtSet:=pAlterarNomeDtSet;
  cdsColunas := TClientDataSet(dtSet);
  trans := TIBTransaction(transacao);

  DBGrid1.Columns.Clear;
  usuario := nomeUsuario;
  nomeDTSEt := TClientDataSet(DBGrid1.DataSource.DataSet).Name+vAlterarNomeDtSet;

  cdsColunas.Close;
  cdsColunas.CommandText := 'select * from config_colunas ' +
  	' where usuario = ' + QuotedStr(nomeUsuario) +
    ' and componente = ' + QuotedStr(nomeDTSEt);
  cdsColunas.Open;

  if DBGrid1.DataSource <> nil then
    criaChecksColunas(TClientDataSet(DBGrid1.DataSource.DataSet));
  mostraColunas;
  registraEstatisticas;
end;

procedure TfrmCadPadrao.mostrarHintEmBalao(Window: HWnd; Texto, Titulo: string;
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

procedure TfrmCadPadrao.Show;
var
	canShow: Boolean;
begin
  if not Self.Enabled then
    Exit;

	canShow := True;
  if Assigned(eventoShowFormMainForm) then
  	canShow := eventoShowFormMainForm(Self.Name, 'TfrmCadPadrao');

  if canShow then
  begin
    Visible := True;
    BringToFront;
  end;
end;

function TfrmCadPadrao.ShowModal: Integer;
var
	canShow: Boolean;
begin
	if not Self.Enabled then
    Exit;

	canShow := True;
  if Assigned(eventoShowModalFormMainForm) then
  	canShow := eventoShowModalFormMainForm(Self.Name, 'TfrmCadPadrao');

  if canShow then
  begin
  	if _mdiAberto(Self.Name) then
  		Result := inherited ShowModal();
  end
  else
  	Result := Self.ModalResult;
end;

procedure TfrmCadPadrao.SpeedButton1Click(Sender: TObject);
begin
  CheckCadSeq.Checked := false;
  CheckCadSeq.Enabled := false;
  CheckCadSeq.visible := false;
  LabelSeq.Visible := false;
  PageControl1.ActivePage := TabSheet1;
  statusBar(panelCadastro, '');
end;

procedure TfrmCadPadrao.spSairGridClick(Sender: TObject);
begin
  TForm(pnMemo.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadPadrao.statusBar(textoPadrao, hintControle: string);
var
  vHint: THintWindow;
begin
  if Screen.ActiveForm.Name <> Self.Name then
    Exit;
  if TextoPadrao <> '' then
    vTextoPadrao := textoPadrao;
  StatusBar1.Panels[0].Text := vTextoPadrao;
  StatusBar1.Panels[1].Text := hintControle;
  StatusBar1.Hint := vTextoPadrao + ' - ' + hintControle;
  {if Trim(hintControle) = '' then
    exit;
  with ThreadHint.Create(hintControle,
    StatusBar1.ClientOrigin.X + 345,
    StatusBar1.ClientOrigin.Y,
    //  ActiveControl.ClientOrigin.X,
    //    ActiveControl.ClientOrigin.Y-25,
    800) do
  begin
    FreeOnTerminate := true;
  end; }
end;

procedure TfrmCadPadrao.TabSheet1Exit(Sender: TObject);
begin
  //  CheckCadSeq.Checked := false;
end;

procedure TfrmCadPadrao.Timer1Timer(Sender: TObject);
begin
  {  Timer1.Enabled := false;
    if ((ActiveControl) is TControl) then
      statusBar('', TControl(ActiveControl).Hint);
   }
    //    MudaCor;
    //  end;
end;

procedure TfrmCadPadrao.verificaConfiguracoesJanela;
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

procedure TfrmCadPadrao.WM_Sys(var Msg: TMessage);
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

end.

{  if PanelFlash.Visible then
    if Flash.ReadyState = 4 then
      if Flash.PercentLoaded = 0 then
      begin
        Randomize;
        case Random(5) of
          0:
            begin
              if FileExists(ExtractFilePath(Application.Exename) + 'banner.swf') then
                Flash.Movie := ExtractFilePath(Application.Exename) + 'banner.swf';
            end;
          1:
            begin
              if FileExists(ExtractFilePath(Application.Exename) + 'banner1.swf') then
                Flash.Movie := ExtractFilePath(Application.Exename) + 'banner1.swf';
            end;
          2:
            begin
              if FileExists(ExtractFilePath(Application.Exename) + 'banner2.swf') then
                Flash.Movie := ExtractFilePath(Application.Exename) + 'banner2.swf';
            end;
          3:
            begin
              if FileExists(ExtractFilePath(Application.Exename) + 'CabBotao.swf') then
                Flash.Movie := ExtractFilePath(Application.Exename) + 'CabBotao.swf';
            end;
          4:
            begin
              if FileExists(ExtractFilePath(Application.Exename) + 'PropCentral.swf') then
                Flash.Movie := ExtractFilePath(Application.Exename) + 'PropCentral.swf';
            end;
        end;
        timer1.Enabled := false;
        Flash.Hint := Flash.Movie;
        Flash.ShowHint := true;
      end
      else
      begin
        Flash.Hint := Flash.Movie;
        Flash.ShowHint := true;
        timer1.Enabled := false;
      end; }

