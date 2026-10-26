unit uCadPadraoModal;

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
{$IFDEF VER300}
  IBX.IBDatabase, Data.DB, Vcl.AppEvnts, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.Graphics, Vcl.Forms, System.Classes,
  Datasnap.DBClient, Winapi.Windows, Winapi.Messages;
{$ELSE}
  Classes, ComCtrls, ExtCtrls, Menus, Buttons, Grids, DBGrids, Controls,
  StdCtrls, Mask, Forms, DBClient, IBDatabase,
  Windows, Spin, Graphics, Messages,
  AppEvnts, DB, Variants, IniFiles;
{$ENDIF}

const
  panelConsulta: string = ('[Alt+P: Pesquisa ]   [Alt+N ou Ins: Novo]   [Alt+S: Sair]   [Del: Delete]');
  panelCadastro: string = ('[Alt+O: Confirmar]   [Alt+C ou ESC: Cancelar]   [Alt+S: Sair]');
  TABS_NOT_TODOS: array[1..19] of string = ('TfrmCadAgenda', 'TFrmSugestaoCompra', 'TfrmCadPedidoCompra', 'TFrmCadPedVenda', 'TfrmCadBoletos',
  																					'TfrmMovVeiculosCCIA', 'TfrmCadNF', 'TfrmCadNFCe', 'TfrmCadServicoTransporte',
                                            'TFrmCadClientes', 'TFrmCadProdutos', 'TFrmCadContasAPagar', 'TfrmCadContasAReceber', 'TfrmLancamentos',
                                            'TfrmNotEnvFinanc', 'TfrmCadMensMob', 'TFrmSugestCompraVenda', 'TfrmCadNfSerieD', 'TfrmNfInteg');
//  TABS_NOT_TODOS: array[1..17] of string = ('SUGESTAOCOMPRA', 'PEDIDO', 'PEDVENDA', 'BOLETAS', 'COM_FAT', 'NOTAFISCAL', 'NFCE', 'CLIENTES', 'PRODUTOS', 'VEICULOS',
//                         'EST_MOTO', 'CONTAS_A_PAGAR', 'CONTROLE_CREDITOS', 'CONTROLE_CHEQUE', 'LANCAMENTOS', 'FILA_RESERVA_VEIC', 'FILA_VEICULOS');

  ECM_FIRST = $1500;
  EM_SHOWBALLOONTIP = (ECM_FIRST + 3);
  EM_HIDEBALLOONTIP = (ECM_FIRST + 4);
  TTI_NONE = 0;
  TTI_INFO = 1;
  TTI_WARNING = 2;
  TTI_ERROR = 3;

type
  TfrmCadPadraoM = class(TForm)
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
    Somarvaloresdacoluna1: TMenuItem;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    pn_pnmemo_botoes: TPanel;
    bt_pnmemo_okk: TBitBtn;
    bt_pnmemo_voltar: TBitBtn;
    bt_pnmemo_ok: TBitBtn;
    pn_modal: TPanel;
    pn_modal_bottom: TPanel;
    bt_modal_assume: TBitBtn;
    bt_modal_cancel: TBitBtn;
    bt_modal_ok: TBitBtn;
    bt_modal_voltar: TBitBtn;
    bt_modal_save: TBitBtn;
    pn_modal_grid: TPanel;
    lb_modal_inf: TLabel;
    grid_modal: TDBGrid;
    pn_modal_top: TPanel;
    lb_modal_inf2: TLabel;
    memoGrid9999: TMemo;
    SalvarValoresConsultaAdicional: TMenuItem;
    SalvarValoresConsultaAvancada: TMenuItem;
    procedure SalvarValoresConsultaAvancadaClick(Sender: TObject);
    procedure SalvarValoresConsultaAdicionalClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1Enter(Sender: TObject);
    procedure listGridDblClick(Sender: TObject);
    procedure imgInformationDblClick(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
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
    FOriginalOnDrawCell: TDrawColumnCellEvent;
    naoOrdenar: boolean; // Variavel auxiliar de ordenacao das colunas
    vCheck: TCheckBox;
    // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
    nomeDTSEt,vAlterarNomeDtSet, usuario: string;
    // variaveis que sao setadas dos formularios filhos informando o nome do clientdataset e o nome do usuario
    campoPesquisa: string;
    cdsColunas: TClientDataSet;
    TemColunasComPosicaoAlteradas: Boolean;

    cdsGrid: TClientDataSet;
    GridCfg: TDBGrid;
    ListGridsAndDataSets: TStrings;
    ListPositions: TStrings;

    trans: TIBTransaction;
    vTabela, vCampoPadrao: string;
    fReset, vCtrlClick, vShiftClick: Boolean;
    indexCol:integer;
    //variaveis excel
    excel, calc, sheet: variant;
    vLinhaExcel: integer;
    vCamposPadraoRegistro: Boolean;
    //clietdataset que recebe outro cliente dataset com as configuracoes ja selecionadas do usuario
    function cripSettings(wtexto: string): string;
    procedure criaChecksColunas(pDtSetGrid: TClientDataSet);
    //metodo que cria um checkbox para cada campo da tabela
    procedure configuraChecks(pDtSetGrid: TClientDataSet);
    //Metodo que marca e desmarca check de acordo a configuracao
    procedure resetarConfiguracoesDeColunas(PGridCfg: TDBGrid);
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
    function GetIni(pChave, pIdentificador, pValorDefault: string): string;
    function getValue(pStr: string; pPos: integer; pDelimiter: string = '|'; StartWithDelimiter: Boolean = True): string;
    function getDataSetNameByGrid(DBGridName, DataSetNameDefault: string): string;
    procedure setDataSetNameByGrid(DBGridName, DataSetName: string; Alteracao: Boolean = True);

    procedure registraEstatisticas;
    function CriaIni: boolean;

    // Funcoes de selecao multiplas no grid   
    procedure SetFieldSelection(const Value: TField);
    function GetIsRowSelected(): Boolean;
    procedure SetIsRowSelected(AValue: Boolean);
    procedure MultiSelectDBGridCellClick(Column: TColumn);
    procedure MultiSelectDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure MultiSelectDBGridDblClick(Sender: TObject);
    procedure MultiSelectDBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MultiSelectDBGridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  public
    function AddFieldEditButton(fieldEditButton: string): TfrmCadPadraoM;
    procedure setTClientDataSet(dtSet: TClientDataSet; nomeUsuario: string; transacao: TIBTransaction; pAlterarNomeDtSet: string = ''); overload;
    procedure setTClientDataSet(dtSet: TClientDataSet; PGridCfg: TDBGrid; nomeUsuario: string; transacao: TIBTransaction; pAlterarNomeDtSet: string = ''); overload;
    //metodo que recebe os paramentros que serao utilizados
    procedure setNomeTabela(nomeTabela, campoPadrao: string);
    //rotinas excel
    function montarExcel:boolean;
    function montarCalc:boolean;
  var
  	vHeight, vWidth: Integer;
    modal: Boolean;
    fechar: Boolean;
    exibirPergFechar: Boolean;
  protected
    PrimeiraPesquisa: Boolean;
    setTClientDtSet: Boolean;
    InibirEstatisticas: Boolean;
    vConfigColuna : boolean;
    statusDataset: string; //variável para indicar Insert ou Edit para fins de msg no 'erros.log' para o usuário
    TelaCadastro: integer; //Variável para indicar se já para cair direto na tela de cadastro
    TextoPadraoStatusBar: string; //Texto padrao do status bar
    clicouNoX: boolean;
    vShow: integer;
    vTitleClickFoco: integer;
    alturaForm, larguraForm, alturaDefault, larguraDefault: integer;
    controle: TControl;
    corControle: TColor;
    ManterGridAvancadoVisivel: Boolean;
    fieldsEditButton: array of string;
    FFieldSelection: TField;
    procedure MostraAjuda; overload;
    procedure MostraAjuda(AjudaHtml: string); overload;
    procedure configuraShow;
    procedure processaMensagem(var Msg: TMsg; var handled: boolean); virtual;
    property OnMessage: TMessageEvent read FOnMessage write FOnMessage;
    procedure statusBar(textoPadrao, hintControle: string); virtual;
    procedure MudaCor;
    procedure lixeiraVazia(vazia: boolean);
    function setFocusCampoErro(var pNomeCampoErro: string; pForcarFoco: Boolean = False): boolean; overload;
    function setFocusCampoErro(var pNomeCampoErro: string; var pMensagemErro: string; pForcarFoco: Boolean = False): boolean; overload;
    procedure _GravaConfiguracoesString(NomeVariavel,Valor : string);
    procedure _GravaConfiguracoesDouble(NomeVariavel : string; Valor : Double);
    procedure _GravaConfiguracoesBoolean(NomeVariavel : string; Valor : Boolean);
    procedure _GravaConfiguracoesInteger(NomeVariavel : string; Valor : Integer);
    function _LerConfiguracoesRegistroString(NomeVariavel : string; Adefault: string = '') : string;
    function _LerConfiguracoesRegistroDouble(NomeVariavel : string; Adefault: Double = 0) : Double;
    function _LerConfiguracoesRegistroBoolean(NomeVariavel : string; Adefault: Boolean = False) : Boolean;
    function _LerConfiguracoesRegistroInteger(NomeVariavel : string; Adefault: Integer = 0) : Integer;
    procedure regSetConfStr(Key, Value: string);
    procedure regSetConfFDouble(Key: string; Value: Double);
    procedure regSetConfBool(Key: string; Value: Boolean);
    procedure regSetConfInt(Key: string; Value: Integer);
    function  regGetConfStr(Key: string; Adefault: string = '') : string;
    function  regGetConfDouble(Key: string; Adefault: Double = 0): Double;
    function  regGetConfBool(Key: string; Adefault: Boolean = False) : Boolean;
    function  regGetConfInt(Key: string; Adefault: Integer = 0) : Integer;
    procedure configuraVisual(nomeCampo: string);
    procedure PreecherCampoConsulta(AField: TField);
    function GetFieldFromDisplayDataSet(const ADisplayLabel: string): TField;
    procedure mostrarHintEmBalao(Window : HWnd; Texto, Titulo : string; Tipo : Integer);
    procedure esconderHintEmBalao(Window : HWnd);
    procedure mostraColunas; //metodo que le as configuracoes e configura o grid
    procedure gravaConfiguracaoUsuario; //metodo que grava as onfiguracoes do usuario

    //joaopedro
    procedure configurarGridPeloConfigColunas(PGridCfg: TDBGrid);
    procedure configurarGridPeloCheckListBox(PGridCfg: TDBGrid);
    procedure salvarGridNoConfigColunas(PGridCfg: TDBGrid);
    procedure ListCheckClickCheck(Sender: TObject);
    procedure PopMnSelAllClick(Sender: TObject);
    procedure PopMnUnSelAllClick(Sender: TObject);
    procedure gridColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure restoreDataSetDefault(PGridCfg: TDBGrid; ClearListPositions: Boolean = False);

    // funcoes auxiliares pnMemo
    procedure form_memo_botoes_sair_habilitar(AlistGridVisible: Boolean = True);
    procedure form_memo_botoes_ok_habilitar(AlistGridVisible: Boolean = True);
    procedure form_memo_botoes_ok_voltar_habilitar(AlistGridVisible: Boolean = True);
    procedure form_memo_botoes_restore;

    //funcoes auxiliares para chamar antes do pn_modal
    procedure form_modal_configure(const Args: array of TComponent; InfoTop: string = ''; InfoGrid: string = ''; InfoRedBottom: string = '');

    property FieldSelection: TField write SetFieldSelection;
  end;

  type
    TEditBalloonTip = packed record
    cbStruct: DWORD;
    pszTitle: LPCWSTR;
    pszText: LPCWSTR;
    ttiIcon: Integer;
  end;

var
  frmCadPadraoM: TfrmCadPadraoM;

implementation

uses
  uColunasExcel, ComObj, CheckLst, StrUtils, uExportPadrao, Math,
{$IFDEF VER300}
  System.SysUtils, Vcl.Dialogs, Vcl.DBCtrls, Vcl.Clipbrd, Vcl.Samples.Spin,
  System.Win.Registry, Winapi.ShellAPI;
{$ELSE}
  ShellAPI, Provider, IBQuery, DBCtrls, SysUtils,
  ActiveX, Registry, dateUtils, Clipbrd, Dialogs;
{$ENDIF}

{$R *.dfm}

function hw_integra_estatistica_inc(banco, descricao: WideString; empresa: Integer): Integer; stdcall; external 'hw.utils.dx.dll';

function TfrmCadPadraoM.AddFieldEditButton(
  fieldEditButton: string): TfrmCadPadraoM;
var
  I: Integer;
begin
  Result := Self;
  for I := Low(fieldsEditButton) to High(fieldsEditButton) do
    if AnsiUpperCase(Trim(fieldEditButton)) = fieldsEditButton[I] then
      Exit;

  SetLength(fieldsEditButton, Length(fieldsEditButton) + 1);
  fieldsEditButton[High(fieldsEditButton)] := AnsiUpperCase(Trim(fieldEditButton));    
end;

procedure TfrmCadPadraoM.AjustaLaguraColunas(Grid: TDBGrid);
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

procedure TfrmCadPadraoM.ApplicationEventsPadraoMessage(var Msg: tagMSG;
  var Handled: Boolean);
begin
//  if (Msg.message = WM_KeyDown) then
    if (Msg.wParam = VK_RETURN) or (Msg.wParam = VK_TAB) then
    begin
      if StatusBar1.Panels.Count > 1 then
      StatusBar1.Panels[1].Text := Application.Hint;
      if ((ActiveControl) is TControl) then
        statusBar('', TControl(ActiveControl).Hint);
    end;
end;

procedure TfrmCadPadraoM.BitBtn1Click(Sender: TObject);
var
  I: Integer;
  field: TField;
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

    field := GetFieldFromDisplayDataSet(ComboBox1.Text);
    if field <> nil then
    begin
      regSetConfStr('Condicao_' + field.FieldName, ComboBox3.Text);
      if Trim(MaskEdit3.Text) <> '' then      
        regSetConfStr('Valor_' + field.FieldName, Trim(MaskEdit3.Text));
    end;
  end
  else
    MaskEdit3.Text := '';
  for I := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Title.Font.Style := [];
  if PrimeiraPesquisa then
  begin
    PrimeiraPesquisa := False;
    configurarGridPeloConfigColunas(DBGrid1);
  end;
  Panel1.Visible := true;

  if (not ManterGridAvancadoVisivel) and (not SalvarValoresConsultaAvancada.Checked) and (not SalvarValoresConsultaAdicional.Checked) then
    GroupBox3.Height := 73;
end;

procedure TfrmCadPadraoM.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPadraoM.BitBtn3Click(Sender: TObject);
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

procedure TfrmCadPadraoM.BitBtn4Click(Sender: TObject);
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
  begin
  	fechar := True;
    close;
	end;
end;

procedure TfrmCadPadraoM.BitBtn5Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet2;
  if self.TelaCadastro <> 0 then
    close
  else if Panel1.Visible then
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;
  statusBar(panelConsulta, '');
end;

procedure TfrmCadPadraoM.bMarketingHWClick(Sender: TObject);
begin
//  if (Self.Enabled) and (Self.Visible) and (bMarketingHW.CanFocus) then
//  	bMarketingHW.SetFocus;
//  PanelFlash.Tag := 1;
//  PanelFlash.Visible := false;
//  NoExibirPropaganda1.Visible := false;
//  ExibirPropaganda1.Visible := true;
//  PanelLeft.Width := PanelFundo.Width -5;
end;

procedure TfrmCadPadraoM.bMarketingHWExit(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (PageControl3.CanFocus) then
    PageControl3.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (groupbox3.CanFocus) then
    groupbox3.SetFocus;
end;

procedure TfrmCadPadraoM.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 201
  else
    GroupBox3.Height := 73;
end;

procedure TfrmCadPadraoM.CheckCadSeqClick(Sender: TObject);
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

procedure TfrmCadPadraoM.CheckBox3Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 201
  else
    GroupBox3.Height := 73;
end;

procedure TfrmCadPadraoM.ComboBox1Enter(Sender: TObject);
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

procedure TfrmCadPadraoM.ComboBox1Exit(Sender: TObject);
var
  I: Integer;
  tipocampo, activeControlName: string;
begin
  if ActiveControl = BitBtn2 then
    Exit;

  activeControlName := '';
  if Assigned(ActiveControl) then
    activeControlName := ActiveControl.Name;

  if MatchText(Self.ClassName, TABS_NOT_TODOS) then
    if uppercase(ComboBox1.Text) = 'TODOS' then
    begin
      Application.MessageBox('Pesquisa com o campo Todos não permitida. Por favor utilize outro campo', 'Atenção');
      ComboBox1.ItemIndex := IfThen(ComboBox1.Items.Count > 0, 0, -1);
      Exit;
    end;

  if uppercase(ComboBox1.Text) <> 'TODOS' then
  begin
    ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(ComboBox1.Text);
    ComboBox1.Text := ComboBox1.Items[ComboBox1.ItemIndex];
    if ComboBox1.ItemIndex<0 then
      ComboBox1.ItemIndex := ComboBox1.Items.Count-1;
  end
  else
  begin
    if MatchText(Self.ClassName, TABS_NOT_TODOS) then
      ComboBox1.ItemIndex := IfThen(ComboBox1.Items.Count > 0, 0, -1)
    else
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
        else if (DBGrid1.DataSource.DataSet.Fields[i] is TMemoField) then
          tipocampo := 'B'
        else
          tipocampo := 'I';

        PreecherCampoConsulta(DBGrid1.DataSource.DataSet.Fields[i]);

        naoOrdenar := true;
        configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName);
        //        DBGrid1TitleClick(DBGrid1.Columns[i]);
        naoOrdenar := false;
        Exit;//break; //Exit;
      end;
    end;

  if (DBGrid1.DataSource <> nil) and (DBGrid1.DataSource.DataSet.Fields.Count > 0) then
    PreecherCampoConsulta(DBGrid1.DataSource.DataSet.Fields[0]);
  {
  if (tipocampo = 'I') or (tipocampo = 'F') then
  begin
    ComboBox3.Items.Clear;
    ComboBox3.Items.Add('Igual');
    //ComboBox3.Items.Add('Começa');
    //ComboBox3.Items.Add('Esta contido');
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
  }
end;

procedure TfrmCadPadraoM.Configurarcolunas1Click(Sender: TObject);
begin
  if (cdsColunas = nil) or {(not cdsColunas.Active) or} (DBGrid1.DataSource = nil) then
    exit;

  configurarGridPeloCheckListBox(DBGrid1);
  salvarGridNoConfigColunas(DBGrid1);
  configuraShow;
  exit;

  configuraChecks(TClientDataSet(DBGrid1.DataSource.DataSet));
  GroupBox2.Visible := true;
  if (Self.Enabled) and (Self.Visible) and (ScrollBox2.CanFocus) then
  	ScrollBox2.SetFocus;
end;

function TfrmCadPadraoM.cripSettings(wtexto: string): string;
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

procedure TfrmCadPadraoM.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
//  for I := 0 to DBGrid1.Columns.Count - 1 do
//    DBGrid1.Columns[i].Title.Font.Style := [];
//  DBGrid1.Columns[ToIndex].Title.Font.Style := [fsBold];
  salvarGridNoConfigColunas(DBGrid1);
  gravaConfiguracaoUsuario;
  TemColunasComPosicaoAlteradas := True;
end;

procedure TfrmCadPadraoM.DBGrid1EditButtonClick(Sender: TObject);
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
        listGrid.Hint := 'Pressione F5 para vizualizar no modo texto';

        memoGrid9999.Lines.Clear;
        memoGrid9999.Lines.Text := DBGrid1.SelectedField.AsString;
        memoGrid9999.Align := alClient;
        memoGrid9999.Hint := listGrid.Hint;

        formMemo.ShowModal;

      finally
        pnMemo.Parent := tsMEmo;
        formMemo.Free;
        formMemo := nil;
      end;

    end;
end;

procedure TfrmCadPadraoM.DBGrid1Enter(Sender: TObject);
var
  iGrid, iArr: Integer;
begin
  if (Length(fieldsEditButton) > 0) and Assigned(DBGrid1.DataSource) and DBGrid1.DataSource.DataSet.Active then
    for iArr := Low(fieldsEditButton) to High(fieldsEditButton) do
      for iGrid := 0 to DBGrid1.Columns.Count - 1 do
        if AnsiUpperCase(DBGrid1.Columns[iGrid].FieldName) = AnsiUpperCase(fieldsEditButton[iArr]) then
        begin
          DBGrid1.Columns[iGrid].ButtonStyle := cbsEllipsis;
          Break;
        end;
end;

procedure TfrmCadPadraoM.DBGrid1TitleClick(Column: TColumn);
var
  i,k, t: integer;
  vTemp,vNomeIdx,sCondicao,sValor: string;
  vInverterOrdem:boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    if DBGrid1.DataSource = nil then
      exit;
  if TClientDataSet(DBGrid1.DataSource.DataSet) <> nil then
    TClientDataSet(DBGrid1.DataSource.DataSet).AfterClose := fDataseAfterClose;

  if (Column.Field<>nil) and (Column.Field.FieldKind = fkCalculated) then//and (Column.Field.FieldKind = fkInternalCalc) then
    exit;
  if vCtrlClick then
  begin
    PreecherCampoConsulta(Column.Field);
    configuraVisual(Column.FieldName);

    if Column.Field <> nil then
    begin
      sCondicao := regGetConfStr('Condicao_' + Column.Field.FieldName);
      sValor := regGetConfStr('Valor_' + Column.Field.FieldName);
      I := ComboBox3.Items.IndexOf(sCondicao);
      if I > -1 then
        ComboBox3.ItemIndex := i;

      if vTitleClickFoco = 1 then
      begin
        try
          if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
            MaskEdit1.SetFocus()
          else if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
          begin
            if sValor <> '' then
              MaskEdit3.Text := sValor;
            MaskEdit3.SetFocus();
          end;
        except
        end;
      end;
    end;

    vCtrlClick:=false;
    exit;
  end;
  try
  if vShiftClick then
  begin
    vInverterOrdem:=false;
    if (TClientDataSet(DBGrid1.DataSource.DataSet).IndexName = '') then//or (copy(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName, 1, 4) = 'IDX$') then
    begin
      vTemp := Column.Field.FieldName;
      vNomeIdx:='IDX$A'+vTemp;
      for I := 0 to DBGrid1.Columns.Count - 1 do
        DBGrid1.Columns[i].Title.Font.Style := [];
      TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
      TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( 'IDX$A'+vTemp, vTemp , []);
    end else if not(pos(Column.Field.FieldName,TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Items[0].FieldExpression)>0) then
    begin
      vNomeIdx := copy(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName,6,length(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName)-5);
      vTemp := TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Items[0].FieldExpression;
      vTemp := vTemp + ';' + Column.Field.FieldName;
      k:=0;
      for I := 1 to Length(vTemp) do
        if vTemp[i]=';' then
          inc(k);
      vNomeIdx:= vNomeIdx+inttostr(k);
      TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
      if pos('IDX$A',TClientDataSet(DBGrid1.DataSource.DataSet).IndexName)>0 then
      begin
         TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( 'IDX$A'+vNomeIdx, vTemp , []);
         vNomeIdx := 'IDX$A'+vNomeIdx;
      end
      else begin
        TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( 'IDX$D'+vNomeIdx, vTemp , [ixDescending]);
        vNomeIdx := 'IDX$D'+vNomeIdx
      end;
    end else begin
      vTemp := TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Items[0].FieldExpression;
      k:=0;
      for I := 1 to Length(vTemp) do
        if vTemp[i]=';' then
          inc(k);
      if TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Find(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName).Options = [ixDescending] then
      begin
        vNomeIdx := StringReplace(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName,'IDX$D','IDX$A',[]);
        vNomeIdx := vNomeIdx + inttostr(k);
        TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
        TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( vNomeIdx, vTemp , []);
      end
      else begin
        vNomeIdx := StringReplace(TClientDataSet(DBGrid1.DataSource.DataSet).IndexName,'IDX$A','IDX$D',[]);
        vNomeIdx := vNomeIdx + inttostr(k);
        TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Clear;
        TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Add( vNomeIdx, vTemp , [ixDescending]);
      end;
//      TClientDataSet(DBGrid1.DataSource.DataSet).IndexFieldNames:='';
      vInverterOrdem:=true;
    end;

    try
//      Application.MessageBox(pchar(vNomeIdx+' '+TClientDataSet(DBGrid1.DataSource.DataSet).IndexDefs.Items[0].FieldExpression), 'Alerta', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      TClientDataSet(DBGrid1.DataSource.DataSet).IndexName := vNomeIdx;
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
    finally
      vShiftClick:=false;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPadraoM.ExibirPropaganda1Click(Sender: TObject);
begin
//  PanelFlash.Tag := 0;
//  PanelLeft.Width := PanelFundo.Width - 200;
//  PanelFlash.Visible := true;
//  ExibirPropaganda1.Visible := false;
//  NoExibirPropaganda1.Visible := true;
end;

procedure TfrmCadPadraoM.fDataseAfterClose(DataSet: TDataSet);
begin
  TClientDataSet(DataSet).IndexName := '';
end;

function TfrmCadPadraoM.montarCalc: boolean;
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
            else if (TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TIntegerField) and (trim(vTemp) <> '') then
              Sheet.getCellByPosition(i, j).setValue(StrToInt(vTemp))
            else if (TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TFloatField) and (trim(vTemp) <> '') then
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

function TfrmCadPadraoM.montarExcel: boolean;
var
  vTemp: string;
  vPointer: Pointer;
  vCor: integer;
  I: Integer;
  DataAux: TDateTime;
  DiaAux: word;
  MesAux: word;
  AnoAux: word;
  vListaErrosExcel: TStringList;
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
      vListaErrosExcel := TStringList.Create;
      vListaErrosExcel.Clear;

      vLinhaExcel := 3;
      TClientDataSet(DBGrid1.DataSource.DataSet).First;
      while not TClientDataSet(DBGrid1.DataSource.DataSet).Eof do
      begin
        if DBGrid1.DataSource.DataSet.RecNo mod 5 = 0 then
          lbTextoProcessamento.Caption := 'Montando Planilha ' + IntToStr(Trunc(DBGrid1.DataSource.DataSet.RecNo / DBGrid1.DataSource.DataSet.RecordCount * 100)) + '%';
        Application.ProcessMessages;

        for I := 1 to DBGrid1.Columns.Count  do
        begin
          try
            vTemp := Trim(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsString);
            if vTemp = '' then
            else if TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName) is TDateTimeField then
            begin
              DataAux:=TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsDateTime;
              DecodeDate(TClientDataSet(DBGrid1.DataSource.DataSet).FieldByName(DBGrid1.Columns[I - 1].FieldName).AsDateTime, AnoAux, MesAux, DiaAux);
              if DataAux-EncodeDate(AnoAux, MesAux, DiaAux) = 0 then
               sheet.cells[vLinhaExcel, I].Value := EncodeDate(AnoAux, MesAux, DiaAux)
              else sheet.cells[vLinhaExcel, I].Value := DataAux;//datetostr(DataAux);
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

        Inc(vLinhaExcel);

        TClientDataSet(DBGrid1.DataSource.DataSet).Next;
      end;

      TClientDataSet(DBGrid1.DataSource.DataSet).GotoBookmark(vPointer);

      excel.Cells.EntireRow.AutoFit;
      excel.Cells.EntireColumn.AutoFit;
    finally
    	if Assigned(vListaErrosExcel) then
        if vListaErrosExcel.Count > 0 then
          Application.MessageBox(PChar('Alguns dados não foram copiados para o Excel.' + #13 + vListaErrosExcel.Text), 'Atenção', 0 + 64);
    end;
  end;
end;


procedure TfrmCadPadraoM.FormClose(Sender: TObject; var Action: TCloseAction);
var
	vFormName: string;
begin
	vFormName := Self.Name;
  if not Assigned(DBGrid1.DataSource) then
    Exit;
  if not Assigned(DBGrid1.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa then
    salvarGridNoConfigColunas(DBGrid1);

  if TemColunasComPosicaoAlteradas then
    restoreDataSetDefault(DBGrid1, True);// aqui limpa o ListPositions pois o formulario vai ser fechado

  Timer1.Enabled := false;
  PageControl1.ActivePage := TabSheet2;
  GroupBox3.Visible := True;
  GroupBox3.Enabled := True;
  if (BitBtn2.CanFocus) then
	  ActiveControl := BitBtn2;
  if (cdsColunas <> nil) and (DBGrid1.DataSource <> nil) then
    configuraChecks(TClientDataSet(DBGrid1.DataSource.DataSet));
//  if (cdsColunas <> nil) and (not fReset) then
//    gravaConfiguracaoUsuario;
  gravaConfiguracoesRegistro;
  salvaConfiguracoesJanela;
  Action := cafree;
  frmCadPadraoM := nil;
end;

procedure TfrmCadPadraoM.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	try
    if Assigned(eventoCloseQueryMainForm) then
    begin
      CanClose := eventoCloseQueryMainForm(Self.Name, DBGrid1, 'TfrmCadPadraoM', fechar, exibirPergFechar);
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

procedure TfrmCadPadraoM.FormCreate(Sender: TObject);
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
  MaskEdit3.CharCase := ecNormal;
  TemColunasComPosicaoAlteradas := False;
  ManterGridAvancadoVisivel := False;
  SetLength(fieldsEditButton, 0);
  setTClientDtSet := False;
  vHeight := Self.Height;
  vWidth  := Self.Width;
  FFieldSelection := nil;
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

procedure TfrmCadPadraoM.FormDestroy(Sender: TObject);
begin
  if Assigned(FOnMessageRescue) then
    Application.OnMessage := FOnMessageRescue;
  if (clicouNoX) then
    abort;
end;

procedure TfrmCadPadraoM.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, k: integer;
  vTmp: string;
begin
  vCtrlClick := Key = VK_CONTROL;
  vShiftClick := Key = VK_SHIFT;
  if Key = VK_F10 then
  begin
{$IFDEF VER300}
    if (ssShift in Shift) and
      (ssCtrl in Shift) and
      (ssAlt in Shift) then
{$ELSE}
    if (Classes.ssShift in Shift) and
      (Classes.ssCtrl in Shift) and
      (Classes.ssAlt in Shift) then
{$ENDIF}

      begin
        try
          vTmp := ActiveControl.Name;
        except
          vTmp := '';
        end;
        InputQuery('Nome do componente', 'Este é o nome do componete onde está o foco', vTmp);
        if (ActiveControl is TDBEdit) or
          (ActiveControl is TDBComboBox) or
          (ActiveControl is TDBLookupComboBox) or
          (ActiveControl is TDBCheckBox) or
          (ActiveControl is TDBListBox) or
          (ActiveControl is TDBRadioGroup) or
          (ActiveControl is TDBMemo) then
        begin
          try
            vTmp := LowerCase(TDBEdit(ActiveControl).DataField);
          except
            vTmp := '';
          end;
          InputQuery('Nome do campo no banco', 'Este é o nome do campo no banco de dados do componete onde está o foco', vTmp);
        end;
      end;
  end
  else if Key = vk_f8 then
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
      else
      begin
      	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
        	MaskEdit1.SetFocus;
      end;
    end;
  end
  else if (key = vk_f7) then
  begin
    if PageControl1.ActivePage = TabSheet2 then
    begin

      if vTabela = 'PRODUTOS' then
      begin
        if ComboBox1.Text = 'Todos' then
        begin
          configuraVisual('NUM_FAB_PROD');
          Exit;
        end;
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
                  else
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    	MaskEdit1.SetFocus;
                  end;
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
                  else
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    	MaskEdit1.SetFocus;
                  end;
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
                  else
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    	MaskEdit1.SetFocus;
                  end;
                  exit;
                end;
            end;
          end
        end;
      end
      else if vTabela = 'CLIENTES' then
      begin      
        if ComboBox1.Text = 'Todos' then
        begin
          configuraVisual('NOME_CLIENTE');
          Exit;
        end;
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
                  else
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    	MaskEdit1.SetFocus;
                  end;
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
                  else
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    	MaskEdit1.SetFocus;
                  end;
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
                  else
                  begin
                  	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
                    	MaskEdit1.SetFocus;
                  end;
                  exit;
                end;
            end;
          end
        end;
      end;
    end;
  end
end;

procedure TfrmCadPadraoM.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_CONTROL then
    vCtrlClick := False;
  if Key = VK_SHIFT then
    vShiftClick := False;
if Key = VK_F1 then
    MostraAjuda;
end;

procedure TfrmCadPadraoM.FormResize(Sender: TObject);
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

procedure TfrmCadPadraoM.FormShow(Sender: TObject);
var
  I: Integer;
  fieldVisivel: boolean;
{$IFDEF VER300}
  ShortDateFormat: string;
{$ENDIF}
begin
	if not Self.Enabled then
  begin
  	if DBGrid1.DataSource <> nil then
    	leConfiguracoesRegistro;
    Exit;
  end;

  SalvarValoresConsultaAvancada.Visible  := CheckBox3.Visible;
  SalvarValoresConsultaAdicional.Visible := CheckBox1.Visible;

{$IFDEF VER300}
  ShortDateFormat := FormatSettings.ShortDateFormat;
{$ENDIF}
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
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
  	//
  else
  	GroupBox3.Height := 73;
  naoOrdenar := true;

  naoOrdenar := false;
  if (Self.Enabled) and (Self.Visible) and (ComboBox1.Enabled) and (ComboBox1.CanFocus) then
  	ComboBox1.SetFocus;
  if DBGrid1.DataSource <> nil then
  begin
//    nomeDTSEt := TClientDataSet(DBGrid1.DataSource.DataSet).Name+vAlterarNomeDtSet;
//    leConfiguracoesRegistro;
    if (vTabela <> '') and (not vCamposPadraoRegistro) then
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
        if MatchText(Self.ClassName, TABS_NOT_TODOS) then
          ComboBox1.ItemIndex := IfThen(ComboBox1.Items.Count > 0, 0, -1)
        else
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
  if StatusBar1.Panels.Count > 0 then
  StatusBar1.Panels[0].Width := StatusBar1.Width;
end;

procedure TfrmCadPadraoM.form_memo_botoes_ok_habilitar(
  AlistGridVisible: Boolean);
begin
  spSairGrid.Visible       := False;
  bt_pnmemo_ok.Visible     := True;
  pn_pnmemo_botoes.Visible := False;
  listGrid.Visible         := AlistGridVisible;
end;

procedure TfrmCadPadraoM.form_memo_botoes_ok_voltar_habilitar(
  AlistGridVisible: Boolean);
begin
  spSairGrid.Visible       := False;
  bt_pnmemo_ok.Visible     := False;
  pn_pnmemo_botoes.Visible := True;
  listGrid.Visible         := AlistGridVisible;
end;

procedure TfrmCadPadraoM.form_memo_botoes_restore;
begin
  form_memo_botoes_sair_habilitar();
  pnMemo.Height := 222;  
end;

procedure TfrmCadPadraoM.form_memo_botoes_sair_habilitar(
  AlistGridVisible: Boolean);
begin
  spSairGrid.Visible       := True;
  bt_pnmemo_ok.Visible     := False;
  pn_pnmemo_botoes.Visible := False;
  listGrid.Visible         := AlistGridVisible;
end;

procedure TfrmCadPadraoM.form_modal_configure(const Args: array of TComponent;
  InfoTop, InfoGrid, InfoRedBottom: string);
var
  I: Integer;
begin
  bt_modal_assume.Visible := False;
  bt_modal_cancel.Visible := False;
  bt_modal_ok.Visible := False;
  bt_modal_voltar.Visible := False;
  bt_modal_save.Visible := False;
  lb_modal_inf.Visible := False;
  lb_modal_inf2.Visible := False;
  pn_modal_top.Visible := False;

  for I := Low(Args) to High(Args) do
    if Args[I] is TBitBtn then
      TBitBtn(Args[I]).Visible := True
    else if Args[I] is TLabel then
      TLabel(Args[I]).Visible := True
    else if Args[I] is TPanel then
      TPanel(Args[I]).Visible := True;

  pn_modal_top.Caption  := InfoTop;
  lb_modal_inf.Caption  := InfoTop;
  lb_modal_inf2.Caption := InfoTop;
end;

function TfrmCadPadraoM.getDataSetNameByGrid(DBGridName,
  DataSetNameDefault: string): string;
var
  I: Integer;
begin
  Result := DataSetNameDefault;
  if ListGridsAndDataSets = nil then
    Exit;
  for I := 0 to ListGridsAndDataSets.Count - 1 do
    if getValue(ListGridsAndDataSets[I], 1) = DBGridName then
    begin
      Result := getValue(ListGridsAndDataSets[I], 2);
      Break;
    end;
end;

function TfrmCadPadraoM.GetFieldFromDisplayDataSet(
  const ADisplayLabel: string): TField;
var
  I: Integer;
begin
  Result := nil;

  if DBGrid1.DataSource = nil then
    Exit;

  for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
    if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ADisplayLabel then
    begin
      Result := DBGrid1.DataSource.DataSet.Fields[i];
      Exit;
    end;
end;

function TfrmCadPadraoM.GetIni(pChave, pIdentificador, pValorDefault: string): string;
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

function TfrmCadPadraoM.GetIsRowSelected: Boolean;
var
  Field: TField;
begin
  Result := False;
  if Assigned(FFieldSelection) then
    case FFieldSelection.DataType of
      ftBoolean:
        Result := FFieldSelection.AsBoolean;

      ftSmallint, ftInteger:
        Result := FFieldSelection.AsInteger = 1;

      ftString, ftWideString:
        Result := FFieldSelection.AsString <> '';
    end;
end;

procedure TfrmCadPadraoM.configurarGridPeloCheckListBox(PGridCfg: TDBGrid);
var
  frmConfCol: TForm;
  PanelAllClient, PanelBottom: TPanel;
  ListCk: TCheckListBox;
  BotaoSair: TBitBtn;
  PopMn: TPopupMenu;
  PopMnSelAl, PopMnUnSelAll: TMenuItem;
  I, J: Integer;
begin
  if PGridCfg = nil then
    Exit;
  GridCfg := TDBGrid(PGridCfg);
  if not Assigned(GridCfg.DataSource) then
    Exit;
  if not Assigned(GridCfg.DataSource.DataSet) then
    Exit;
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);

  frmConfCol := TForm.Create(Application); frmConfCol.Width := 600; frmConfCol.Height := 400; frmConfCol.Position := poScreenCenter; frmConfCol.Caption := 'Configuração de Colunas';
  PanelAllClient := TPanel.Create(frmConfCol); PanelAllClient.Parent := frmConfCol; PanelAllClient.Align := alClient; PanelAllClient.Caption := ''; PanelAllClient.BevelOuter := bvNone; PanelAllClient.BorderWidth := 6; PanelAllClient.Name := 'ContentPanelListCheck999';
  PanelBottom := TPanel.Create(PanelAllClient); PanelBottom.Parent := PanelAllClient; PanelBottom.Align := alBottom; PanelBottom.Caption := ''; PanelBottom.BevelOuter := bvNone; PanelBottom.BevelKind := bkTile; PanelBottom.BorderWidth := 7;
  PopMn := TPopupMenu.Create(frmConfCol);
  ListCk := TCheckListBox.Create(PanelAllClient); ListCk.Parent := PanelAllClient; ListCk.Style := lbOwnerDrawVariable; ListCk.Align := alClient; ListCk.OnClickCheck := ListCheckClickCheck; ListCk.Name := 'ListCheck999'; ListCk.PopupMenu := PopMn;
  ListCk.Clear;
  for I := 0 to cdsGrid.Fields.Count - 1 do
  begin
    J := ListCk.Items.Add(cdsGrid.Fields[I].DisplayLabel);
    ListCk.ItemEnabled[J] := (cdsGrid.Fields[I].Tag = 0) or (cdsGrid.Fields[I].Tag = 3);
    ListCk.Checked[J] := cdsGrid.Fields[I].Visible;
  end;
  ListCk.Sorted := True;

  PopMnSelAl := TMenuItem.Create(ListCk); PopMnSelAl.Caption := 'Selecionar todos'; PopMnSelAl.OnClick := PopMnSelAllClick;
  PopMn.Items.Add(PopMnSelAl);
  PopMnUnSelAll := TMenuItem.Create(ListCk); PopMnUnSelAll.Caption := 'Remover a seleção de todos'; PopMnUnSelAll.OnClick := PopMnUnSelAllClick;
  PopMn.Items.Add(PopMnUnSelAll);

  BotaoSair := TBitBtn.Create(PanelBottom); BotaoSair.Parent := PanelBottom; BotaoSair.Caption := '&Sair'; BotaoSair.Align := alRight; BotaoSair.ModalResult := mrAbort;

  frmConfCol.ShowModal;

  FreeAndNil(BotaoSair);
  FreeAndNil(PopMnSelAl);
  FreeAndNil(PopMnUnSelAll);
  FreeAndNil(PopMn);
  FreeAndNil(ListCk);
  FreeAndNil(PanelBottom);
  FreeAndNil(PanelAllClient);
  FreeAndNil(frmConfCol);
end;

procedure TfrmCadPadraoM.configurarGridPeloConfigColunas(PGridCfg: TDBGrid);
var
  I, Indice: Integer;
  Field: TField;
  FieldName: string;
  Visivel: Boolean;
  Column: TColumn;
  List, ListDelete: TStrings;
begin
  if PGridCfg = nil then
    Exit;
  GridCfg := TDBGrid(PGridCfg);
  if not Assigned(GridCfg.DataSource) then
    Exit;
  if not Assigned(GridCfg.DataSource.DataSet) then
    Exit;
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);
                         
  cdsGrid.DisableControls;
  try
    cdsColunas.Close;
    cdsColunas.CommandText := 'select * from config_colunas ' +
      ' where usuario = ' + QuotedStr(usuario) +
      ' and componente = ' + QuotedStr(getDataSetNameByGrid(GridCfg.Name, cdsGrid.Name));
    cdsColunas.Open;
    cdsColunas.IndexFieldNames := 'ordem';

    if cdsColunas.IsEmpty() then
    begin
      for I := 0 to cdsGrid.Fields.Count - 1 do
      begin
        Field := cdsGrid.Fields[I];

        if (GridCfg.Columns.Count) < (I + 1) then
          Column := TColumn.Create(GridCfg.Columns)
        else
          Column := GridCfg.Columns[Field.Index];

        Column.Index := Field.Index;
        Column.FieldName := Field.FieldName;
        Column.Visible := Field.Visible;
      end;

      Exit;
    end;

//  for I := 0 to cdsGrid.Fields.Count - 1 do
//    if not cdsColunas.Locate('campos', cdsGrid.Name + cdsGrid.Fields[I].FieldName, []) then
//    begin
//      Field := cdsGrid.Fields[I];
//      if (Field.Tag = 0) or (Field.Tag = 2) then Field.Visible := True
//      else Field.Visible := False;
//      cdsColunas.Insert;
//      if Field.Visible then
//        cdsColunas.FieldByName('visivel').AsInteger := 1
//      else
//        cdsColunas.FieldByName('visivel').AsInteger := 0;
//      cdsColunas.FieldByName('usuario').AsString           := usuario;
//      cdsColunas.FieldByName('componente').AsString        := getDataSetNameByGrid(GridCfg.Name, cdsGrid.Name);
//      cdsColunas.FieldByName('campos').AsString            := cdsGrid.Name + Field.FieldName;
//      cdsColunas.FieldByName('ordem').AsInteger            := 9999 + Field.Index;
//      cdsColunas.Post;
//    end;

    cdsColunas.First;
    I := 0;
    while not cdsColunas.Eof do
    begin
      FieldName := cdsColunas.FieldByName('campos').AsString;
      Delete(FieldName, 1, Length(cdsGrid.Name));
      Field := cdsGrid.FindField(FieldName);
      if Field <> nil then
      begin
        Visivel := cdsColunas.FieldByName('visivel').AsInteger = 1;
        if (Field.Tag = 1) then
          Visivel := False
        else if (Field.Tag = 2) then
          Visivel := True;
        Field.Visible := Visivel;
        Field.Index := I;

        if (GridCfg.Columns.Count) < (I + 1) then
          Column := TColumn.Create(GridCfg.Columns)
        else
          Column := GridCfg.Columns[Field.Index];

        if (cdsColunas.FieldByName('largura_exibicao').AsInteger > 0)
        	and (Column.Width <> cdsColunas.FieldByName('largura_exibicao').AsInteger) then
          Column.Width := cdsColunas.FieldByName('largura_exibicao').AsInteger;

        if (Column.Index <> Field.Index) then
        Column.Index := Field.Index;

        if (Column.Visible <> Field.Visible) then
        Column.Visible := Field.Visible;

        if (Column.FieldName <> Field.FieldName) then
        Column.FieldName := Field.FieldName;
      end
      else
      begin
        if ListDelete = nil then
        begin
          ListDelete := TStringList.Create;
          ListDelete.Clear;
        end;
        ListDelete.Add(Trim(cdsColunas.FieldByName('campos').AsString));
      end;
      I := I + 1;
      cdsColunas.Next;
    end;
    if ListDelete <> nil then
    begin
      for I := 0 to ListDelete.Count - 1 do
        if cdsColunas.Locate('campos', ListDelete[I], []) then
          cdsColunas.Delete;
      if cdsColunas.ChangeCount > 0 then
      begin
        cdsColunas.ApplyUpdates(-1);
        trans.Commit;
        trans.StartTransaction;
      end;
    end;
  finally
    cdsGrid.EnableControls;
  end;
end;

procedure TfrmCadPadraoM.configuraShow;
var
  I: Integer;
{$IFDEF VER300}
  ShortDateFormat: string;
{$ENDIF}
begin
	if not Self.Enabled then
  begin
  	if DBGrid1.DataSource <> nil then
    	leConfiguracoesRegistro;
    Exit;
  end;

{$IFDEF VER300}
  ShortDateFormat := FormatSettings.ShortDateFormat;
{$ENDIF}
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
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
  	//
  else
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
      else if MatchText(Self.ClassName, TABS_NOT_TODOS) then
        ComboBox1.ItemIndex := IfThen(ComboBox1.Items.Count > 0, 0, -1)
      else
        ComboBox1.Text := 'Todos';
    end;
  end;
  ComboBox1.Sorted := True;
  ComboBox2.Items := ComboBox1.Items;

  if not MatchText(Self.ClassName, TABS_NOT_TODOS) then
    ComboBox1.Items.Add('Todos');

  ComboBox2.Text := ComboBox2.Items[0];
  if (Self.Enabled) and (Self.Visible) and (ComboBox1.Enabled) and (ComboBox1.CanFocus) then
  	ComboBox1.SetFocus;
  if DBGrid1.DataSource <> nil then
  begin
    leConfiguracoesRegistro;
    nomeDTSEt := TClientDataSet(DBGrid1.DataSource.DataSet).Name+vAlterarNomeDtSet;
    if (vTabela <> '') and (not vCamposPadraoRegistro) then
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
        if Assigned(DBGrid1.Fields[i]) and (DBGrid1.Fields[i].DisplayName = ComboBox1.Text) then
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

procedure TfrmCadPadraoM.configuraVisual(nomeCampo: string);
var
  i: integer;
  vNomeCampo: string;
  vDisplay: Boolean;
  CampoEncontrado: Boolean;
  ctrlNextFocus: string;
{$IFDEF VER300}
  ShortDateFormat: string;
{$ENDIF}
begin
  if DBGrid1.DataSource = nil then
    Exit;

  ctrlNextFocus := '';
  if Assigned(ActiveControl) then
    ctrlNextFocus := ActiveControl.Name;

{$IFDEF VER300}
  ShortDateFormat := FormatSettings.ShortDateFormat;
{$ENDIF}
  vNomeCampo := nomeCampo;
  vDisplay := Pos('*', vNomeCampo) > 0;
  if vDisplay then
    vNomeCampo := Copy(vNomeCampo, 2,length(vNomeCampo));

  CampoEncontrado := False;

    for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
    begin
      if ((TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = vNomeCampo) and (not vDisplay)) or
      ((TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = vNomeCampo) and (vDisplay)) then
      begin
        CampoEncontrado := True;
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
  if not CampoEncontrado then
  begin
    MaskEdit3.Visible := True;
    MaskEdit1.Visible := False;
    MaskEdit2.Visible := False;
    Label4.Visible := True;
    MaskEdit3.EditMask := '';
  end;
  if (ActiveControl <> BitBtn1) and (ActiveControl <> BitBtn3) then
    if (MatchStr(ctrlNextFocus, [MaskEdit1.Name, MaskEdit2.Name])) and (not MaskEdit1.CanFocus) then
    begin
      if (Self.Enabled) and (Self.Visible) and (MaskEdit3.Enabled) and (MaskEdit3.CanFocus) then
        MaskEdit3.SetFocus;
    end
    else if (ctrlNextFocus = MaskEdit3.Name) and (not MaskEdit3.CanFocus) then
      if (Self.Enabled) and (Self.Visible) and (MaskEdit1.Enabled) and (MaskEdit1.CanFocus) then
        MaskEdit1.SetFocus;
    {
    if (Self.Enabled) and (Self.Visible) and (MaskEdit1.canfocus) then
       MaskEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit3.canfocus) then
      MaskEdit3.SetFocus;
    }
end;

procedure TfrmCadPadraoM.Copiarparareadetransferncia1Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TfrmCadPadraoM.criaChecksColunas(pDtSetGrid: TClientDataSet);
var
  k, i, altura: integer;
  jaexiste: boolean;
begin
  Exit;
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

function TfrmCadPadraoM.CriaIni: boolean;
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

function TfrmCadPadraoM.criarCalc: boolean;
begin
	try
    calc := CreateOleObject('com.sun.star.ServiceManager');

    Result := True;

  except
    Result := False;
    Application.MessageBox ('Versão do OpenOffice Calc Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
end;

function TfrmCadPadraoM.criarExcel: boolean;
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

procedure TfrmCadPadraoM.configuraChecks(pDtSetGrid: TClientDataSet);
var
  i, j: integer;
begin
  Exit;
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

procedure TfrmCadPadraoM.mostraColunas;
var
  Settings: TIniFile;
  i, idx, j, menor: integer;
  temp: string;
begin
  ComboBox1.Clear;
  ComboBox2.Clear;
  if DBGrid1.DataSource <> nil then
  begin
    for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
    begin
      if (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].Visible) and
        (TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldKind = fkData) then
        ComboBox1.Items.Add(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayName);
      if vCamposPadraoRegistro then
      begin
        if MatchText(Self.ClassName, TABS_NOT_TODOS) then
          ComboBox1.ItemIndex := IfThen(ComboBox1.Items.Count > 0, 0, -1)
        else
          ComboBox1.Text := 'Todos';
      end
      else if (vTabela = 'PRODUTOS') and (trim(vCampoPadrao) <> '') then
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
      else if MatchText(Self.ClassName, TABS_NOT_TODOS) then
        ComboBox1.ItemIndex := IfThen(ComboBox1.Items.Count > 0, 0, -1)
      else
        ComboBox1.Text := 'Todos';
    end;
  end;
  ComboBox1.Sorted := True;
  ComboBox2.Items := ComboBox1.Items;

  if not MatchText(Self.ClassName, TABS_NOT_TODOS) then
    ComboBox1.Items.Add('Todos');

  ComboBox2.Text := ComboBox2.Items[0];
  nomeDTSEt := TClientDataSet(DBGrid1.DataSource.DataSet).Name+vAlterarNomeDtSet;
leConfiguracoesRegistro;

  Exit;
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
        if vCamposPadraoRegistro then
        begin
          if MatchText(Self.ClassName, TABS_NOT_TODOS) then
            ComboBox1.ItemIndex := IfThen(ComboBox1.Items.Count > 0, 0, -1)
          else
            ComboBox1.Text := 'Todos';
        end
        else if (vTabela = 'PRODUTOS') and (trim(vCampoPadrao) <> '') then
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
        else if MatchText(Self.ClassName, TABS_NOT_TODOS) then
          ComboBox1.ItemIndex := IfThen(ComboBox1.Items.Count > 0, 0, -1)
        else
          ComboBox1.Text := 'Todos';
      end;
    end;
    ComboBox1.Sorted  := True;
    ComboBox2.Items := ComboBox1.Items;

    if not MatchText(Self.ClassName, TABS_NOT_TODOS) then
      ComboBox1.Items.Add('Todos');

    ComboBox2.Text := ComboBox2.Items[0];
    nomeDTSEt := TClientDataSet(DBGrid1.DataSource.DataSet).Name+vAlterarNomeDtSet;
    leConfiguracoesRegistro;
    Settings.Free;
  end;
end;

procedure TfrmCadPadraoM.MudaCor;
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

procedure TfrmCadPadraoM.NoExibirPropaganda1Click(Sender: TObject);
begin
//  PanelFlash.Tag := 1;
  //  Flash.Stop;
//  PanelFlash.Visible := false;
//  PanelLeft.Width := PanelFundo.Width - 5;
//  NoExibirPropaganda1.Visible := false;
//  ExibirPropaganda1.Visible := true;
end;

procedure TfrmCadPadraoM.PageControl3Enter(Sender: TObject);
begin
  if ActiveControl = TabSheet3 then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadPadraoM.PanelFlashEnter(Sender: TObject);
begin
  //  Perform(WM_NEXTDLGCTL, 0, 0);
  if (ActiveControl = bMarketingHW) then
  	if (Self.Enabled) and (Self.Visible) and (bMarketingHW.Enabled) and (bMarketingHW.CanFocus) then
    	bMarketingHW.SetFocus;
end;

procedure TfrmCadPadraoM.PopMnSelAllClick(Sender: TObject);
var
  I: Integer;
  ListCk: TCheckListBox;
begin
  try
    ListCk := TCheckListBox(TMenuItem(Sender).Owner);
    for I := 0 to ListCk.Items.Count - 1 do
      if ListCk.ItemEnabled[I] then
      begin
        ListCk.ItemIndex := I;
        ListCk.Checked[i] := True;
        ListCheckClickCheck(ListCk);
      end;
  except
  end;
end;

procedure TfrmCadPadraoM.PopMnUnSelAllClick(Sender: TObject);
var
  I: Integer;
  ListCk: TCheckListBox;
begin
  try
    ListCk := TCheckListBox( TMenuItem(Sender).Owner);
    for I := 0 to ListCk.Items.Count - 1 do
      if ListCk.ItemEnabled[I] then
      begin
        ListCk.ItemIndex := I;
        ListCk.Checked[i] := False;
        ListCheckClickCheck(ListCk);
      end;
  except
  end;
end;

procedure TfrmCadPadraoM.PreecherCampoConsulta(AField: TField);
var
  tipocampo: string;
  I: Integer;
begin
  if (AField = nil) or (AField.FieldKind <> fkData) then
    Exit;

  if (AField is TIntegerField) or (AField is TSmallintField) then
    tipocampo := 'I'
  else if (AField is TCurrencyField) or (AField is TFloatField) then
    tipocampo := 'F'
  else if AField is TStringField then
    tipocampo := 'S'
  else if (AField is TDateField) or (AField is TDateTimeField) then
    tipocampo := 'D'
  else if (AField is TMemoField) then
    tipocampo := 'B'
  else
    tipocampo := 'I';

  if (tipocampo = 'I') or (tipocampo = 'F') then
  begin
    ComboBox3.Items.Clear;
    ComboBox3.Items.Add('Igual');
    //ComboBox3.Items.Add('Começa');
    //ComboBox3.Items.Add('Esta contido');
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

procedure TfrmCadPadraoM.MultiSelectDBGridCellClick(Column: TColumn);
begin
  if Assigned(FFieldSelection) and ( FFieldSelection.FieldName = Column.FieldName) then
    SetIsRowSelected( not GetIsRowSelected() );
end;

procedure TfrmCadPadraoM.MultiSelectDBGridDblClick(Sender: TObject);
begin
  SetIsRowSelected( not GetIsRowSelected() );
end;

procedure TfrmCadPadraoM.MultiSelectDBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  IsSelected: Boolean;
  DrawRect: TRect;
  Check: Cardinal;
begin
  if not Assigned(FFieldSelection) then
    Exit;

  // Chama handler original, se existir
  if Assigned(FOriginalOnDrawCell) then
    FOriginalOnDrawCell(Sender, Rect, DataCol, Column, State);

  // Renderiza checkbox apenas na primeira coluna (índice 0)
  if Column.FieldName = FFieldSelection.FieldName then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 2 then
      Column.Field.DisplayWidth := 2;

    IsSelected := GetIsRowSelected;

    // Limpa fundo
    if gdSelected in State then
      DBGrid1.Canvas.Brush.Color := clHighlight
    else
      DBGrid1.Canvas.Brush.Color := DBGrid1.Color;
    DBGrid1.Canvas.FillRect(Rect);

    // Desenha checkbox
    DrawRect := Rect;
    InflateRect(DrawRect, 2, 0);

    Check := 0;
    if IsSelected then
      Check := DFCS_CHECKED
    else
      Check := 0;

    DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadPadraoM.MultiSelectDBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_SPACE then
    SetIsRowSelected( not GetIsRowSelected() );
end;

procedure TfrmCadPadraoM.MultiSelectDBGridMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Classes.ssCtrl in Shift then
    SetIsRowSelected( not GetIsRowSelected() );
end;

procedure TfrmCadPadraoM.processaMensagem(var Msg: TMsg; var handled: boolean);
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

procedure TfrmCadPadraoM.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  AjustaLaguraColunas(DBGrid1);
end;

function TfrmCadPadraoM.regGetConfStr(Key: string; Adefault: string): string;
begin
  Result := _LerConfiguracoesRegistroString(Key, Adefault);
end;

procedure TfrmCadPadraoM.registraEstatisticas;
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

function TfrmCadPadraoM.regGetConfBool(Key: string; Adefault: Boolean): Boolean;
begin
  Result := _LerConfiguracoesRegistroBoolean(Key, Adefault);
end;

function TfrmCadPadraoM.regGetConfInt(Key: string; Adefault: Integer): Integer;
begin
  Result := _LerConfiguracoesRegistroInteger(Key, Adefault);
end;

function TfrmCadPadraoM.regGetConfDouble(Key: string; Adefault: Double): Double;
begin
  Result := _LerConfiguracoesRegistroDouble(Key, Adefault);
end;

procedure TfrmCadPadraoM.regSetConfBool(Key: string; Value: Boolean);
begin
  _GravaConfiguracoesBoolean(Key, Value);
end;

procedure TfrmCadPadraoM.regSetConfFDouble(Key: string; Value: Double);
begin
  _GravaConfiguracoesDouble(Key, Value);
end;

procedure TfrmCadPadraoM.regSetConfInt(Key: string; Value: Integer);
begin
  _GravaConfiguracoesInteger(Key, Value);
end;

procedure TfrmCadPadraoM.regSetConfStr(Key, Value: string);
begin
  _GravaConfiguracoesString(Key, Value);
end;

procedure TfrmCadPadraoM.resetarConfiguracoesDeColunas(PGridCfg: TDBGrid);
begin
  if PGridCfg = nil then
    Exit;
  GridCfg := TDBGrid(PGridCfg);
  if not Assigned(GridCfg.DataSource) then
    Exit;
  if not Assigned(GridCfg.DataSource.DataSet) then
    Exit;
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);


//  if Application.MessageBox('Você deverá sair sistema para que as alterações tenham efeito. Deseja continuar?', 'Confirmação',
//    MB_ICONQUESTION + MB_YESNO) = IDNO then
//    exit;

  cdsColunas.Close;
  cdsColunas.CommandText := 'select * from config_colunas ' +
  	' where usuario = ' + QuotedStr(usuario) +
    ' and componente = ' + QuotedStr(getDataSetNameByGrid(GridCfg.Name, cdsGrid.Name));
  cdsColunas.Open;

  while not cdsColunas.IsEmpty do
    cdsColunas.Delete;

  cdsColunas.ApplyUpdates(-1);

  trans.Commit;
  trans.StartTransaction;
  fReset := True;
end;

procedure TfrmCadPadraoM.ResetarConfiguraesdecolunas1Click(Sender: TObject);
var
  I: Integer;
  Columns: TColumn;
begin
	Application.MessageBox('O formulário será fechado, favor reabrir caso necessário.', 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);

  resetarConfiguracoesDeColunas(DBGrid1);

  GridCfg.Columns.Clear;
  GridCfg.Columns.RebuildColumns;

  restoreDataSetDefault(DBGrid1); // aqui nao limpa o ListPositions pois o formulario ainda nao foi fechado
	fechar := True;
  Close;
end;

procedure TfrmCadPadraoM.salvaConfiguracoesJanela;
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

procedure TfrmCadPadraoM.restoreDataSetDefault(PGridCfg: TDBGrid;
  ClearListPositions: Boolean);
var
  I: Integer;
  Columns: TColumn;
  rescueDS: TDataSource;
begin
  if PGridCfg = nil then
    Exit;
  GridCfg := TDBGrid(PGridCfg);
  if not Assigned(GridCfg.DataSource) then
    Exit;
  if not Assigned(GridCfg.DataSource.DataSet) then
    Exit;
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);

  if ClearListPositions then
  begin
    rescueDS := PGridCfg.DataSource;
    PGridCfg.DataSource := nil;
  end;

  try
    for I := 0 to ListPositions.Count - 1 do
    begin
      if cdsGrid.FieldByName(ListPositions[I]).Tag = 0 then
        cdsGrid.FieldByName(ListPositions[I]).Visible := True
      else if cdsGrid.FieldByName(ListPositions[I]).Tag = 1 then
        cdsGrid.FieldByName(ListPositions[I]).Visible := False
      else if cdsGrid.FieldByName(ListPositions[I]).Tag = 2 then
        cdsGrid.FieldByName(ListPositions[I]).Visible := True
      else if cdsGrid.FieldByName(ListPositions[I]).Tag = 3 then
        cdsGrid.FieldByName(ListPositions[I]).Visible := False;
      cdsGrid.FieldByName(ListPositions[I]).Index := I;

      if (GridCfg.Columns.Count) < (I + 1) then
        Columns := TColumn.Create(GridCfg.Columns)
      else
        Columns := GridCfg.Columns[I];
      Columns.Index := I;
      Columns.Visible := cdsGrid.FieldByName(ListPositions[I]).Visible;
      Columns.FieldName := cdsGrid.FieldByName(ListPositions[I]).FieldName;
    end;
    if ClearListPositions then
      ListPositions.Clear;
  finally
    PGridCfg.DataSource := rescueDS;
  end;
end;

procedure TfrmCadPadraoM.salvaConfiguracoesJanela(pWindowState: TWindowState);
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

procedure TfrmCadPadraoM.SalvardadosnoExcel1Click(Sender: TObject);
var
  vRecNo: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.DataSource.DataSet.DisableControls;
    lbStatusProcessamento.Caption := 'Status de processamento';
    lbTextoProcessamento.Caption := 'Montando Excel';
    pnStatusProcessamento.Top := Trunc((Application.MainForm.Height - pnStatusProcessamento.Height) / 2);
    pnStatusProcessamento.Left := Trunc((Application.MainForm.Width - pnStatusProcessamento.Width) / 2);
    pnStatusProcessamento.Visible := True;
    vRecNo := DBGrid1.DataSource.DataSet.RecNo;
    montarExcel;
  finally
    pnStatusProcessamento.Visible := False;
    DBGrid1.DataSource.DataSet.RecNo := vRecNo;
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadPadraoM.salvarGridNoConfigColunas(PGridCfg: TDBGrid);
var
  I, K: Integer;
  Largura, Ordem: Integer;
  ListOrder: TStrings;

  procedure obterDadosExibicaoFieldGrid(FieldName: string);
  var
    J: Integer;
  begin
    for J := 0 to GridCfg.Columns.Count - 1 do
      if GridCfg.Columns[J].FieldName = FieldName then
      begin
        Largura := GridCfg.Columns[J].Width;
//        Ordem := GridCfg.Columns[J].Index;
        Break;
      end;
  end;

begin
  if PGridCfg = nil then
    Exit;
  GridCfg := TDBGrid(PGridCfg);
  if not Assigned(GridCfg.DataSource) then
    Exit;
  if not Assigned(GridCfg.DataSource.DataSet) then
    Exit;
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);

  ListOrder := TStringList.Create;
  ListOrder.Clear;
  for I := 0 to cdsGrid.Fields.Count - 1 do
    ListOrder.Add(cdsGrid.Fields[i].FieldName);
  for K := GridCfg.Columns.Count - 1 downto 0 do
    if GridCfg.Columns[K].Visible then    
    begin
      I := ListOrder.IndexOf(GridCfg.Columns[K].FieldName);
      if I > -1 then
      begin
        ListOrder.Delete(I);
        ListOrder.Insert(0, GridCfg.Columns[K].FieldName);
      end;
    end;
  cdsColunas.Close;
  cdsColunas.CommandText := ' select * from config_colunas ' +
    ' where usuario = ' + QuotedStr(usuario) +
    ' and componente = ' + QuotedStr(getDataSetNameByGrid(GridCfg.Name, cdsGrid.Name));
  cdsColunas.Open;
  for I := 0 to cdsGrid.Fields.Count - 1 do
  begin
//    Ordem := -1;
    Ordem := ListOrder.IndexOf(cdsGrid.Fields[I].FieldName);
    Largura := 0;
    if cdsGrid.Fields[I].Visible then
      obterDadosExibicaoFieldGrid(cdsGrid.Fields[I].FieldName);
    if cdsColunas.Locate('campos', cdsGrid.Name + cdsGrid.Fields[I].FieldName, []) then
    begin
      cdsColunas.Edit;
      if cdsGrid.Fields[I].Visible then
      begin
        cdsColunas.FieldByName('visivel').AsInteger := 1;
        cdsColunas.FieldByName('ordem').AsInteger   := Ordem;
      end
      else
        cdsColunas.FieldByName('visivel').AsInteger := 0;
      if Largura > 0 then
        cdsColunas.FieldByName('largura_exibicao').AsInteger :=  Largura;
      cdsColunas.Post;
    end
    else
    begin
      cdsColunas.Insert;
      if cdsGrid.Fields[I].Visible then
        cdsColunas.FieldByName('visivel').AsInteger := 1
      else
        cdsColunas.FieldByName('visivel').AsInteger := 0;
      cdsColunas.FieldByName('usuario').AsString           := usuario;
      cdsColunas.FieldByName('componente').AsString        := getDataSetNameByGrid(GridCfg.Name, cdsGrid.Name);
      cdsColunas.FieldByName('campos').AsString            := cdsGrid.Name + cdsGrid.Fields[I].FieldName;
      cdsColunas.FieldByName('ordem').AsInteger            := Ordem;
      if Largura > 0 then
        cdsColunas.FieldByName('largura_exibicao').AsInteger :=  Largura;
      cdsColunas.Post;
    end;
  end;

  if cdsColunas.ChangeCount > 0 then
  begin
    cdsColunas.ApplyUpdates(-1);
    trans.Commit;
    trans.StartTransaction;
  end;
end;

procedure TfrmCadPadraoM.SalvarValoresConsultaAdicionalClick(Sender: TObject);
begin
	SalvarValoresConsultaAdicional.Checked := not SalvarValoresConsultaAdicional.Checked;
end;

procedure TfrmCadPadraoM.SalvarValoresConsultaAvancadaClick(Sender: TObject);
begin
	SalvarValoresConsultaAvancada.Checked := not SalvarValoresConsultaAvancada.Checked;
end;

procedure TfrmCadPadraoM.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmCadPadraoM.ScrollBox2Exit(Sender: TObject);
begin
//  if (cdsColunas = nil) or (not cdsColunas.Active) or (not vConfigColuna) then
//    exit;
//  gravaConfiguracaoUsuario;
//  GroupBox2.Visible := false;
//  mostraColunas;
end;

function TfrmCadPadraoM.setFocusCampoErro(var pNomeCampoErro: string;
  pForcarFoco: Boolean = False): boolean;
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

procedure TfrmCadPadraoM.setDataSetNameByGrid(DBGridName, DataSetName: string; Alteracao: Boolean = True);
var
  Adicionar: Boolean;
  I: Integer;
  StrAlteracao: string;
begin
  if Alteracao then
    StrAlteracao := 'True'
  else
    StrAlteracao := 'False';
  if ListGridsAndDataSets = nil then
    ListGridsAndDataSets := TStringList.Create;
  Adicionar := True;
  for I := 0 to ListGridsAndDataSets.Count - 1 do
    if getValue(ListGridsAndDataSets[I], 1) = DBGridName then
    begin
      ListGridsAndDataSets[I] := '|' + DBGridName + '|' + DataSetName + '|' + StrAlteracao + '|';
      Adicionar := False;
      Break;
    end;
  if Adicionar then
    ListGridsAndDataSets.Add('|' + DBGridName + '|' + DataSetName + '|' + StrAlteracao + '|');
end;

procedure TfrmCadPadraoM.SetFieldSelection(const Value: TField);
begin
  if Assigned(Value) then
  begin
    FFieldSelection := Value;

    FOriginalOnDrawCell := DBGrid1.OnDrawColumnCell;

    DBGrid1.OnCellClick := MultiSelectDBGridCellClick;
    DBGrid1.OnDblClick := MultiSelectDBGridDblClick;
    DBGrid1.OnDrawColumnCell := MultiSelectDBGridDrawColumnCell;
    DBGrid1.OnKeyDown := MultiSelectDBGridKeyDown;
    DBGrid1.OnMouseUp := MultiSelectDBGridMouseUp;
  end;
end;

function TfrmCadPadraoM.setFocusCampoErro(var pNomeCampoErro,
  pMensagemErro: string; pForcarFoco: Boolean = False): boolean;
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

procedure TfrmCadPadraoM.SetIsRowSelected(AValue: Boolean);
var
  Field: TField;
  Key: string;
begin
  if not Assigned(FFieldSelection)
    or not Assigned(FFieldSelection) then
    Exit;

  cdsGrid.Edit;
  try
    case FFieldSelection.DataType of
      ftBoolean:
        FFieldSelection.AsBoolean := AValue;

      ftSmallint, ftInteger:
        FFieldSelection.AsInteger := IfThen(AValue, 1);

      ftString, ftWideString:
        FFieldSelection.AsString := IfThen(AValue, 'S');
    end;

  finally
    cdsGrid.Post;
  end;
end;

procedure TfrmCadPadraoM.setNomeTabela(nomeTabela, CampoPadrao: string);
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

procedure TfrmCadPadraoM.gravaConfiguracaoUsuario;
var
  i, t: integer;
begin
  Exit;
  t := 0;
  //  trans.StartTransaction;
  if cdsColunas = nil then
    exit;
  cdsColunas.Close;
  cdsColunas.CommandText := ' select * from config_colunas ' +
    ' where usuario = ' + QuotedStr(usuario) +
    ' and componente = ' + QuotedStr(nomeDTSEt);
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

procedure TfrmCadPadraoM.setTClientDataSet(dtSet: TClientDataSet;
  PGridCfg: TDBGrid; nomeUsuario: string; transacao: TIBTransaction;
  pAlterarNomeDtSet: string);
var
  I: Integer;
begin
  cdsColunas := TClientDataSet(dtSet);
  trans := TIBTransaction(transacao);
  GridCfg := PGridCfg;
  cdsGrid := TClientDataSet(GridCfg.DataSource.DataSet);
  usuario := nomeUsuario;
  setDataSetNameByGrid(GridCfg.Name, cdsGrid.Name + pAlterarNomeDtSet);
  GridCfg.Columns.Clear;
  GridCfg.Columns.RebuildColumns;

  for I := 0 to cdsGrid.Fields.Count - 1 do
    if cdsGrid.Fields[i].Tag = 0 then
      cdsGrid.Fields[i].Visible := True
    else if cdsGrid.Fields[i].Tag = 1 then
      cdsGrid.Fields[i].Visible := False
    else if cdsGrid.Fields[i].Tag = 2 then
      cdsGrid.Fields[i].Visible := True
    else if cdsGrid.Fields[i].Tag = 3 then
      cdsGrid.Fields[i].Visible := False;

  configurarGridPeloConfigColunas(GridCfg);
  registraEstatisticas;
end;

function TfrmCadPadraoM.getValue(pStr: string; pPos: integer;
  pDelimiter: string; StartWithDelimiter: Boolean): string;
var
  StrTemp: string;
  Contador: Smallint;
begin
  if StartWithDelimiter then
    pStr := Trim(Copy(pStr, 2, Length(pStr)));
  StrTemp := pStr;
  Contador := 0;
  while pos(pDelimiter, StrTemp) > 0 do
  begin
    inc(Contador);
    if pPos = Contador then
    begin
      StrTemp := Copy(StrTemp, 1, pos(pDelimiter, StrTemp) - 1);
      Result := Trim(StrTemp);
      exit;
    end;
    StrTemp := Copy(StrTemp, pos(pDelimiter, StrTemp) + 1, length(StrTemp));
  end;
  Result := '';
end;

procedure TfrmCadPadraoM._GravaConfiguracoesBoolean(NomeVariavel: string;
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

procedure TfrmCadPadraoM._GravaConfiguracoesDouble(NomeVariavel: string;
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

procedure TfrmCadPadraoM._GravaConfiguracoesInteger(NomeVariavel: string;
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

procedure TfrmCadPadraoM._GravaConfiguracoesString(NomeVariavel,
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

function TfrmCadPadraoM._LerConfiguracoesRegistroBoolean(
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

function TfrmCadPadraoM._LerConfiguracoesRegistroDouble(
  NomeVariavel: string; Adefault: Double): Double;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: double;
begin
  try
    vTemp := Adefault;
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

function TfrmCadPadraoM._LerConfiguracoesRegistroInteger(
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

function TfrmCadPadraoM._LerConfiguracoesRegistroString(NomeVariavel : string; Adefault: string): string;
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

function TfrmCadPadraoM._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
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

procedure TfrmCadPadraoM.gravaConfiguracoesRegistro;
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
      Registro.WriteBool('MaskEdit1', MaskEdit1.Visible);
      Registro.WriteBool('MaskEdit2', MaskEdit2.Visible);
      Registro.WriteBool('MaskEdit3', MaskEdit3.Visible);

      if (TelaCadastro <= 0) then
      begin
        Registro.WriteBool('CheckBox1', (CheckBox1.Checked) and (CheckBox1.Visible));
        Registro.WriteBool('CheckBox3', (CheckBox3.Checked) and (CheckBox3.Visible));
        Registro.WriteBool('SalvarValoresConsultaAvancada',  (SalvarValoresConsultaAvancada.Checked) and (SalvarValoresConsultaAvancada.Visible));
        Registro.WriteBool('SalvarValoresConsultaAdicional', (SalvarValoresConsultaAdicional.Checked) and (SalvarValoresConsultaAdicional.Visible));
      end;
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadPadraoM.gridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  salvarGridNoConfigColunas(TDBGrid(Sender));
end;

procedure TfrmCadPadraoM.GroupBox3Enter(Sender: TObject);
begin
  if GroupBox3.Height = 73 then
  begin
  	if not SalvarValoresConsultaAvancada.Checked then
    	CheckBox3.Checked := false;
    if not SalvarValoresConsultaAdicional.Checked then
    	CheckBox1.Checked := false;
  end;
end;

procedure TfrmCadPadraoM.GroupBox3Exit(Sender: TObject);
begin
  if GroupBox3.Height = 73 then
  begin
    if not SalvarValoresConsultaAvancada.Checked then
    	CheckBox3.Checked := false;
    if not SalvarValoresConsultaAdicional.Checked then
    	CheckBox1.Checked := false;
  end;
end;

procedure TfrmCadPadraoM.imgInformationDblClick(Sender: TObject);
var
  formMemo: TForm;
begin
  try
    formMemo := TForm.Create(Application);
    formMemo.Position := poScreenCenter;
    formMemo.Caption := 'Informação';
    pnMemo.Parent := formMemo;
    formMemo.AutoSize := True;
    formMemo.AutoScroll := False;
    formMemo.KeyPreview := True;
    formMemo.BorderIcons:=[biSystemMenu];

    listGrid.Clear;
    listGrid.Items.Text := imgInformation.Hint;

    formMemo.ShowModal;

  finally
    pnMemo.Parent := tsMEmo;
    formMemo.Free;
    formMemo := nil;
  end;
end;

procedure TfrmCadPadraoM.esconderHintEmBalao(Window: HWnd);
begin
  SendMessageW(Window, EM_HIDEBALLOONTIP, 0, 0);
end;

procedure TfrmCadPadraoM.LabelSeqClick(Sender: TObject);
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

procedure TfrmCadPadraoM.leConfiguracoesRegistro;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
  vTempBoolean: Boolean;
  existeCampo: Boolean;
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
      existeCampo := Trim(vTemp) <> '';
      if ((vCampoPadrao = '') or (vCamposPadraoRegistro)) and (vTemp <> '') then
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

      if (TelaCadastro <= 0) then
      begin
        CheckBox1.Checked := Registro.ValueExists('CheckBox1') and Registro.ReadBool('CheckBox1');
        CheckBox3.Checked := Registro.ValueExists('CheckBox3') and Registro.ReadBool('CheckBox3');
        SalvarValoresConsultaAvancada.Checked := Registro.ValueExists('SalvarValoresConsultaAvancada')
          and Registro.ReadBool('SalvarValoresConsultaAvancada');
        SalvarValoresConsultaAdicional.Checked := Registro.ValueExists('SalvarValoresConsultaAdicional')
          and Registro.ReadBool('SalvarValoresConsultaAdicional');
      end;

      try
        if existeCampo then // Somente usa as confs se o campo esta preenchido, isso evita um campo que nao seja data com campos de data habilitado
        begin
          MaskEdit1.Visible := Registro.ValueExists('MaskEdit1') and Registro.ReadBool('MaskEdit1');
          MaskEdit2.Visible := Registro.ValueExists('MaskEdit2') and Registro.ReadBool('MaskEdit2');
          MaskEdit3.Visible := not MaskEdit1.Visible
            or (Registro.ValueExists('MaskEdit3') and Registro.ReadBool('MaskEdit3'));
        end;
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

procedure TfrmCadPadraoM.ListCheckClickCheck(Sender: TObject);
var
  DisplayLabel: string;
  ListCheck: TCheckListBox;
  I: Integer;
  J: Integer;
  Columns: TColumn;
begin
  if GridCfg = nil then
    Exit;
  if cdsGrid = nil then
    Exit;

  ListCheck := TCheckListBox(Sender);
  if ListCheck.ItemIndex <= -1 then
    Exit;

  DisplayLabel := ListCheck.Items[ListCheck.ItemIndex];

  for I := 0 to cdsGrid.Fields.Count - 1 do
    if cdsGrid.Fields[I].DisplayLabel = DisplayLabel then
    begin
      cdsGrid.Fields[I].Visible := ListCheck.Checked[ListCheck.ItemIndex];
      for J := 0 to GridCfg.Columns.Count - 1 do
        if GridCfg.Columns[J].FieldName = cdsGrid.Fields[I].FieldName then
        begin
          Columns := GridCfg.Columns[J];
          Columns.Visible := ListCheck.Checked[ListCheck.ItemIndex];
          Columns.Index := GridCfg.Columns.Count - 1;
          Break;
        end;
      Break;
    end;
end;

procedure TfrmCadPadraoM.listGridDblClick(Sender: TObject);
begin
  TForm(pnMemo.Parent).ModalResult := IDOK;
end;

procedure TfrmCadPadraoM.listGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    spSairGrid.Click
  else if Key = VK_F5 then
  begin
    listGrid.Visible := not listGrid.Visible;
    memoGrid9999.Visible := not listGrid.Visible;
  end;

end;

procedure TfrmCadPadraoM.lixeiraVazia(vazia: boolean);
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

procedure TfrmCadPadraoM.MostraAjuda;
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

procedure TfrmCadPadraoM.MaskEdit1Exit(Sender: TObject);
var
  vDataI: string;
{$IFDEF VER300}
  ShortDateFormat: string;
{$ENDIF}
begin
{$IFDEF VER300}
  ShortDateFormat := FormatSettings.ShortDateFormat;
{$ENDIF}
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
     	if (Self.Enabled) and (Self.Visible) and (MaskEdit1.Enabled) and (MaskEdit1.CanFocus) then
      	MaskEdit1.SetFocus;
    end;
  end;
end;

procedure TfrmCadPadraoM.MaskEdit2Exit(Sender: TObject);
var
  vDataF: string;
{$IFDEF VER300}
  ShortDateFormat: string;
{$ENDIF}
begin
{$IFDEF VER300}
  ShortDateFormat := FormatSettings.ShortDateFormat;
{$ENDIF}
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
      if (Self.Enabled) and (Self.Visible) and (MaskEdit2.Enabled) and (MaskEdit2.CanFocus) then
      	MaskEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmCadPadraoM.MaskEdit3Enter(Sender: TObject);
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

procedure TfrmCadPadraoM.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCadPadraoM.MostraAjuda(AjudaHtml: string);
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

procedure TfrmCadPadraoM.setTCLientDataSet(dtSet: TClientDataSet; nomeUsuario: string; transacao:
  TIBTransaction; pAlterarNomeDtSet: string);
var
  I: Integer;
begin
	if (Self.ClassName <> 'TFrmCadPedVenda') and (Self.ClassName <> 'TfrmCadContasAReceber') then
    if setTClientDtSet then
      Exit;

  //Chamar este método em cada formulário no evento onshow depois do datasourse do dbgrid já setado e antes do 'inherited'
  vCamposPadraoRegistro := (GetIni('Sistema', 'CamposPadraoPesquisaNoRegistro', 'N') = 'S');
  cdsColunas := TClientDataSet(dtSet);
  trans := TIBTransaction(transacao);
  usuario := nomeUsuario;
  cdsGrid := TClientDataSet(DBGrid1.DataSource.DataSet);
  GridCfg := DBGrid1;
  cdsColunas.IndexFieldNames := 'ordem';
  setDataSetNameByGrid(GridCfg.Name, cdsGrid.Name + pAlterarNomeDtSet, False);

  GridCfg.Columns.Clear;
  GridCfg.Columns.RebuildColumns;
  if ListPositions = nil then
  begin
    ListPositions := TStringList.Create;
    ListPositions.Clear;
  end;

  for I := 0 to cdsGrid.Fields.Count - 1 do
  begin
    if ListPositions.Count <> cdsGrid.Fields.Count then
      ListPositions.Add(cdsGrid.Fields[i].FieldName);

    if cdsGrid.Fields[i].Tag = 0 then
      cdsGrid.Fields[i].Visible := True
    else if cdsGrid.Fields[i].Tag = 1 then
      cdsGrid.Fields[i].Visible := False
    else if cdsGrid.Fields[i].Tag = 2 then
      cdsGrid.Fields[i].Visible := True
    else if cdsGrid.Fields[i].Tag = 3 then
      cdsGrid.Fields[i].Visible := False;
  end;
  PrimeiraPesquisa := True;
  setTClientDtSet  := True;
  mostraColunas;
  registraEstatisticas;
end;

procedure TfrmCadPadraoM.mostrarHintEmBalao(Window: HWnd; Texto, Titulo: string;
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

procedure TfrmCadPadraoM.Show;
var
	canShow: Boolean;
begin
  if not Self.Enabled then
    Exit;

	canShow := True;
  if Assigned(eventoShowFormMainForm) then
  	canShow := eventoShowFormMainForm(Self.Name, 'TfrmCadPadraoM');

  if canShow then
  begin
    Visible := True;
    BringToFront;
  end;
end;

function TfrmCadPadraoM.ShowModal: Integer;
var
	canShow: Boolean;
begin
	if not Self.Enabled then
    Exit;

	canShow := True;
  if Assigned(eventoShowModalFormMainForm) then
  	canShow := eventoShowModalFormMainForm(Self.Name, 'TfrmCadPadraoM');

  if canShow then
  begin
  	if _mdiAberto(Self.Name) then
  		Result := inherited ShowModal();
  end
  else
  	Result := Self.ModalResult;
end;

procedure TfrmCadPadraoM.Somarvaloresdacoluna1Click(Sender: TObject);
var
  vValorGeral, vValorSelecionados, vValorMarcados: Extended;
  vRecNo, vCountMarcados, vCountSelecionados: Integer;
  vCampoMarc: string;
begin
  if (DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName) is TFloatField) or (DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName) is TIntegerField) then
  begin
    try
      DBGrid1.DataSource.DataSet.DisableControls;
      try
        lbStatusProcessamento.Caption := 'Status de processamento';
        lbTextoProcessamento.Caption := 'Somando registros';
        pnStatusProcessamento.Top := Trunc((Application.MainForm.Height - pnStatusProcessamento.Height) / 2);
        pnStatusProcessamento.Left := Trunc((Application.MainForm.Width - pnStatusProcessamento.Width) / 2);
        pnStatusProcessamento.Visible := True;
        vValorGeral := 0;
        vValorSelecionados := 0;
        vValorMarcados := 0;
        vCountMarcados := 0;
        vCountSelecionados := 0;
        if DBGrid1.DataSource.DataSet.FindField('SEL') <> nil then
          vCampoMarc := 'SEL'
        else if DBGrid1.DataSource.DataSet.FindField('SELEC') <> nil then
          vCampoMarc := 'SELEC'
        else
          vCampoMarc := '';
        vRecNo := DBGrid1.DataSource.DataSet.RecNo;
        DBGrid1.DataSource.DataSet.First;
        while not DBGrid1.DataSource.DataSet.Eof do
        begin
          if DBGrid1.DataSource.DataSet.RecNo mod 5 = 0 then
            lbTextoProcessamento.Caption := 'Somando registros ' + IntToStr(Trunc(DBGrid1.DataSource.DataSet.RecNo / DBGrid1.DataSource.DataSet.RecordCount * 100)) + '%';
          Application.ProcessMessages;
          vValorGeral := vValorGeral + DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsFloat;
          if DBGrid1.SelectedRows.CurrentRowSelected then
          begin
            vValorSelecionados := vValorSelecionados + DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsFloat;
            vCountSelecionados := vCountSelecionados + 1;
          end;
          if vCampoMarc <> '' then
            if DBGrid1.DataSource.DataSet.FieldByName(vCampoMarc).AsString = 'S' then
            begin
              vValorMarcados := vValorMarcados + DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsFloat;
              vCountMarcados := vCountMarcados + 1;
            end;
          DBGrid1.DataSource.DataSet.Next;
        end;
        lbTextoProcessamento.Caption := 'Somando registros 100%';
      finally
        pnStatusProcessamento.Visible := False;
        DBGrid1.DataSource.DataSet.RecNo := vRecNo;
        DBGrid1.DataSource.DataSet.EnableControls;
      end;
      vCampoMarc := 'Soma da coluna selecionada "' +
        DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).DisplayLabel + '"' + #13 +
        'Soma geral: ' + Format('%n', [vValorGeral]) + #13 +
        'Soma selecionados ("Ctrl + Click" ou "Shift + Up ou Down"): ' + Format('%n', [vValorSelecionados]) + #13 +
        'Soma marcados ("Tecla de espaço"): ' + Format('%n', [vValorMarcados]) + #13 +
        'Quantidade de registros geral: ' + IntToStr(DBGrid1.DataSource.DataSet.RecordCount) + #13 +
        'Quantidade de registros selecionados: ' + IntToStr(vCountSelecionados) + #13 +
        'Quantidade de registros marcados: ' + IntToStr(vCountMarcados);
      Application.MessageBox(PChar(vCampoMarc), 'Atenção', 0 + 64);
    except
      on e: Exception do
        Application.MessageBox(PChar('Erro ao efetuar soma. Erro: ' + e.Message), 'Erro', MB_ICONERROR + MB_OK);
    end;
  end
  else
  begin
  	try
      DBGrid1.DataSource.DataSet.DisableControls;
      try
        lbStatusProcessamento.Caption := 'Status de processamento';
        lbTextoProcessamento.Caption := 'Somando registros';
        pnStatusProcessamento.Top := Trunc((Application.MainForm.Height - pnStatusProcessamento.Height) / 2);
        pnStatusProcessamento.Left := Trunc((Application.MainForm.Width - pnStatusProcessamento.Width) / 2);
        pnStatusProcessamento.Visible := True;
        vValorGeral := 0;
        vValorSelecionados := 0;
        vValorMarcados := 0;
        vCountMarcados := 0;
        vCountSelecionados := 0;
        if DBGrid1.DataSource.DataSet.FindField('SEL') <> nil then
          vCampoMarc := 'SEL'
        else if DBGrid1.DataSource.DataSet.FindField('SELEC') <> nil then
          vCampoMarc := 'SELEC'
        else
          vCampoMarc := '';
        vRecNo := DBGrid1.DataSource.DataSet.RecNo;
        DBGrid1.DataSource.DataSet.First;
        while not DBGrid1.DataSource.DataSet.Eof do
        begin
          if DBGrid1.DataSource.DataSet.RecNo mod 5 = 0 then
            lbTextoProcessamento.Caption := 'Somando registros ' + IntToStr(Trunc(DBGrid1.DataSource.DataSet.RecNo / DBGrid1.DataSource.DataSet.RecordCount * 100)) + '%';
          Application.ProcessMessages;
          if DBGrid1.SelectedRows.CurrentRowSelected then
          begin
            vCountSelecionados := vCountSelecionados + 1;
          end;
          if vCampoMarc <> '' then
            if DBGrid1.DataSource.DataSet.FieldByName(vCampoMarc).AsString = 'S' then
            begin
              vCountMarcados := vCountMarcados + 1;
            end;
          DBGrid1.DataSource.DataSet.Next;
        end;
        lbTextoProcessamento.Caption := 'Somando registros 100%';
      finally
        pnStatusProcessamento.Visible := False;
        DBGrid1.DataSource.DataSet.RecNo := vRecNo;
        DBGrid1.DataSource.DataSet.EnableControls;
      end;
      vCampoMarc := 'Soma da coluna selecionada "' +
        DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).DisplayLabel + '"' + #13 +
        'Quantidade de registros geral: ' + IntToStr(DBGrid1.DataSource.DataSet.RecordCount) + #13 +
        'Quantidade de registros selecionados: ' + IntToStr(vCountSelecionados) + #13 +
        'Quantidade de registros marcados: ' + IntToStr(vCountMarcados);
      Application.MessageBox(PChar(vCampoMarc), 'Atenção', 0 + 64);
    except
      on e: Exception do
        Application.MessageBox(PChar('Erro ao efetuar soma. Erro: ' + e.Message), 'Erro', MB_ICONERROR + MB_OK);
    end;
  end;
end;

procedure TfrmCadPadraoM.SpeedButton1Click(Sender: TObject);
begin
  CheckCadSeq.Checked := false;
  CheckCadSeq.Enabled := false;
  CheckCadSeq.visible := false;
  LabelSeq.Visible := false;
  PageControl1.ActivePage := TabSheet1;
  statusBar(panelCadastro, '');
end;

procedure TfrmCadPadraoM.spSairGridClick(Sender: TObject);
begin
  TForm(pnMemo.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadPadraoM.statusBar(textoPadrao, hintControle: string);
var
  vHint: THintWindow;
begin
  if not Assigned(Screen.ActiveForm) then
    Exit;

  if Screen.ActiveForm.Name <> Self.Name then
    Exit;
  if TextoPadrao <> '' then
    TextoPadraoStatusBar := textoPadrao;
  if StatusBar1.Panels.Count > 0 then
  StatusBar1.Panels[0].Text := TextoPadraoStatusBar;
  if StatusBar1.Panels.Count > 1 then
  StatusBar1.Panels[1].Text := hintControle;
  StatusBar1.Hint := TextoPadraoStatusBar + ' - ' + hintControle;
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

procedure TfrmCadPadraoM.TabSheet1Exit(Sender: TObject);
begin
  //  CheckCadSeq.Checked := false;
end;

procedure TfrmCadPadraoM.Timer1Timer(Sender: TObject);
begin
  {  Timer1.Enabled := false;
    if ((ActiveControl) is TControl) then
      statusBar('', TControl(ActiveControl).Hint);
   }
    //    MudaCor;
    //  end;
end;

procedure TfrmCadPadraoM.verificaConfiguracoesJanela;
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

procedure TfrmCadPadraoM.WM_Sys(var Msg: TMessage);
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

