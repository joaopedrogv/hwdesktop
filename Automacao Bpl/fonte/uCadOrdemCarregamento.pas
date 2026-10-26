unit uCadOrdemCarregamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, uEditHw, DBClient, IBDatabase;

type
  TfrmCadOrdemCarregamento = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    GroupBox4: TGroupBox;
    BitBtn7: TBitBtn;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit7: TDBEdit;
    DBLookupComboBox10: TDBLookupComboBox;
    Label13: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit8: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBMemo1: TDBMemo;
    Panel4: TPanel;
    BitBtn8: TBitBtn;
    Label14: TLabel;
    tsPesquisaVenda: TTabSheet;
    pnPesqVenda: TPanel;
    Panel10: TPanel;
    EditHw1: TEditHw;
    BitBtn12: TBitBtn;
    Panel11: TPanel;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    pnPesqVendaText: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    DBText1: TDBText;
    Label15: TLabel;
    Label18: TLabel;
    BitBtn16: TBitBtn;
    tsCarregamento: TTabSheet;
    pnCarregamento: TPanel;
    pgControlCarreamento: TPageControl;
    tsTotal: TTabSheet;
    tsParcial: TTabSheet;
    tsEntrega: TTabSheet;
    Panel13: TPanel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    Panel14: TPanel;
    BitBtn20: TBitBtn;
    Panel15: TPanel;
    BitBtn22: TBitBtn;
    GroupBox7: TGroupBox;
    Panel16: TPanel;
    Panel17: TPanel;
    DBGrid4: TDBGrid;
    Panel18: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Panel12: TPanel;
    EditHw2: TEditHw;
    Label22: TLabel;
    tsHistorico2: TTabSheet;
    GroupBox8: TGroupBox;
    Panel19: TPanel;
    Panel20: TPanel;
    BitBtn21: TBitBtn;
    DBGrid5: TDBGrid;
    Panel21: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    Panel22: TPanel;
    BitBtn28: TBitBtn;
    tsImpressao: TTabSheet;
    pnImpressao: TPanel;
    RadioGroup1: TRadioGroup;
    Panel23: TPanel;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    Panel24: TPanel;
    Label25: TLabel;
    DBGrid6: TDBGrid;
    Panel25: TPanel;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    MaskEdit4: TMaskEdit;
    Label26: TLabel;
    Timer2: TTimer;
    CheckBox8: TCheckBox;
    tsItens: TTabSheet;
    pnItens: TPanel;
    pgItens: TPageControl;
    tsItens2: TTabSheet;
    tsHistorico: TTabSheet;
    GroupBox5: TGroupBox;
    Panel5: TPanel;
    Panel6: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn17: TBitBtn;
    DBGrid2: TDBGrid;
    GroupBox6: TGroupBox;
    Panel7: TPanel;
    Panel8: TPanel;
    BitBtn13: TBitBtn;
    CheckBox2: TCheckBox;
    DBGrid3: TDBGrid;
    Panel9: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Timer3: TTimer;
    BitBtn31: TBitBtn;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    RadioGroup3: TRadioGroup;
    RadioGroup2: TRadioGroup;
    tsMontagem: TTabSheet;
    DBText9: TDBText;
    Label28: TLabel;
    GroupBox12: TGroupBox;
    ScrollBox4: TScrollBox;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    BitBtn32: TBitBtn;
    z: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    pnMontagem: TPanel;
    Panel27: TPanel;
    Splitter6: TSplitter;
    GroupBox9: TGroupBox;
    gridCidades: TDBGrid;
    ProgressBar1: TProgressBar;
    GroupBox11: TGroupBox;
    gridClientes: TDBGrid;
    Panel30: TPanel;
    Panel26: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    btConcluirMontagem: TBitBtn;
    BitBtn34: TBitBtn;
    Panel31: TPanel;
    DBLookupComboBox5: TDBLookupComboBox;
    Panel32: TPanel;
    Panel33: TPanel;
    Label27: TLabel;
    DBText8: TDBText;
    GroupBox10: TGroupBox;
    Label29: TLabel;
    edDataBase: TMaskEdit;
    btPesquisarPedidos: TBitBtn;
    ckNomeFantasia: TCheckBox;
    pnEscolherMontagem: TPanel;
    BitBtn33: TBitBtn;
    BitBtn35: TBitBtn;
    pnMontagemRota: TPanel;
    imgMontagem: TImage;
    GroupBox13: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edcod_rota: TMaskEdit;
    edrota: TMaskEdit;
    eddescricao: TMaskEdit;
    ed_monta_rota_dataini: TMaskEdit;
    ed_monta_rota_datafim: TMaskEdit;
    BitBtn36: TBitBtn;
    Panel34: TPanel;
    Panel35: TPanel;
    GroupBox14: TGroupBox;
    Panel36: TPanel;
    Panel37: TPanel;
    DBLookupComboBox6: TDBLookupComboBox;
    Panel38: TPanel;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    SpeedButton9: TSpeedButton;
    Panel39: TPanel;
    grid_monta_por_rota: TDBGrid;
    Panel40: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Panel41: TPanel;
    DBText10: TDBText;
    lb_peso: TLabel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    progress_por_rota: TProgressBar;
    CheckBox5: TCheckBox;
    bt_ped_aberto_sel: TSpeedButton;
    bt_ped_aberto_enviar: TSpeedButton;
    procedure bt_ped_aberto_enviarClick(Sender: TObject);
    procedure bt_ped_aberto_selClick(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure DBLookupComboBox6Exit(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure grid_monta_por_rotaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grid_monta_por_rotaCellClick(Column: TColumn);
    procedure grid_monta_por_rotaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_monta_por_rotaDblClick(Sender: TObject);
    procedure grid_monta_por_rotaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn36Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure DBGrid2ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox4Enter(Sender: TObject);
    procedure pnMontagemEnter(Sender: TObject);
    procedure edDataBaseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridClientesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridClientesDblClick(Sender: TObject);
    procedure gridClientesCellClick(Column: TColumn);
    procedure gridClientesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridCidadesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridCidadesCellClick(Column: TColumn);
    procedure gridCidadesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridCidadesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridCidadesDblClick(Sender: TObject);
    procedure btConcluirMontagemClick(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure ckNomeFantasiaClick(Sender: TObject);
    procedure btPesquisarPedidosClick(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure pnCarregamentoExit(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure pnItensEnter(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure DBGrid6DblClick(Sender: TObject);
    procedure DBGrid6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Timer2Timer(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure pnImpressaoEnter(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure EditHw2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure Panel12Exit(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure GroupBox7Enter(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure pnCarregamentoEnter(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure pnPesqVendaEnter(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

    procedure FormTempKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseTemp(Sender: TObject; var Action: TCloseAction);
    procedure marcaDesmarcaCidade;
    procedure marcaDesmarcaCliente;
    procedure FormMontagemClose(Sender: TObject; var Action: TCloseAction);
    procedure iniciarCamposMontagemMovimento;

    procedure montage_porrota_peso_change;
  public
    { Public declarations }
  end;

var
  frmCadOrdemCarregamento: TfrmCadOrdemCarregamento;

  PrimeiraPesquisa2: Boolean;
  vConfigColuna2 : boolean;
  campoPesquisa2: string;
  cdsColunas2: TClientDataSet;

  cdsGrid2: TClientDataSet;
  GridCfg2: TDBGrid;
  ListGridsAndDataSets2: TStrings;
  ListPositions2: TStrings;

  trans2: TIBTransaction;
  vTabela2, vCampoPadrao2: string;
  fReset2, vCtrlClick2, vShiftClick2: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt2,vAlterarNomeDtSet2, usuario2: string;
  vCamposPadraoRegistro2: Boolean;

implementation

uses
  uDtmOrdemCarregamento, uClassesOrdemCarregamento, uDtmAtivo, DB, uDadosIni,
  uDataSet_OOP, Clipbrd, funcoes, rotas_entr_class, Math;

{$R *.dfm}

procedure TfrmCadOrdemCarregamento.BitBtn10Click(Sender: TObject);
begin
  inherited;
  TForm(pnItens.Parent).ModalResult := IDOK;
  PageControl3.ActivePage := tsCadastro;
end;

procedure TfrmCadOrdemCarregamento.BitBtn11Click(Sender: TObject);
begin
  inherited;
  cadOrdemC.vItem.vHistorico._filtrarHistorico(cadOrdemC.vItem.dataSet.FieldByName('nitem').AsInteger,CheckBox2.Checked);
  pgItens.ActivePage := tsHistorico;
end;

procedure TfrmCadOrdemCarregamento.BitBtn12Click(Sender: TObject);
begin
  inherited;
  try
    if not cadOrdemC._existeVenda(EditHw1.AsInteger) then
    begin
      if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
        EditHw1.SetFocus;
      Exit;
    end;
  finally
    Label18.Caption := cadOrdemC.vTextoCaptionTemp;
  end;
  BitBtn14.Enabled := True;
  BitBtn16.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (BitBtn14.CanFocus) then
    BitBtn14.SetFocus;
  BitBtn12.Enabled := False;
end;

procedure TfrmCadOrdemCarregamento.BitBtn13Click(Sender: TObject);
begin
  inherited;
  pgItens.ActivePage := tsItens2;
end;

procedure TfrmCadOrdemCarregamento.BitBtn14Click(Sender: TObject);
begin
  inherited;
  TForm(pnPesqVenda.Parent).ModalResult := IDOK;
end;

procedure TfrmCadOrdemCarregamento.BitBtn15Click(Sender: TObject);
begin
  inherited;
  TForm(pnPesqVenda.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadOrdemCarregamento.BitBtn16Click(Sender: TObject);
begin
  inherited;
  Label18.Caption := 'Informe o número da venda acima e clique em Procurar';
  BitBtn12.Enabled := True;
  BitBtn14.Enabled := False;
  BitBtn16.Visible := False;
  if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
    EditHw1.SetFocus;
end;

procedure TfrmCadOrdemCarregamento.BitBtn17Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    cadOrdemC._removerMercadorias;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.BitBtn18Click(Sender: TObject);
begin
  inherited;
  if Trim(cadOrdemC.dataSet.FieldByName('conferir').AsString) = '' then
    raise exception.create('Informe se o carregamento deverá ser conferido');

  pgControlCarreamento.ActivePage := tsParcial;
end;

procedure TfrmCadOrdemCarregamento.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
    if Trim(cadOrdemC.dataSet.FieldByName('conferir').AsString) = '' then
      raise exception.create('Informe se o carregamento deverá ser conferido');

  cadOrdemC.vDATA_ENTREGA := StrToDate(MaskEdit4.Text);
  TForm(pnCarregamento.Parent).ModalResult := IDOK;
end;

procedure TfrmCadOrdemCarregamento.BitBtn1Click(Sender: TObject);
var
  vTemp: string;
  I: Integer;
begin
  if not vDadosIni.PesqPros('OCR029', 'CONSULTA', '', 'CARGA', '',
    cadOrdemC.buscas, true) then
    Exit;

  inherited;

  if MaskEdit2.Visible then
    vTemp := '*D*A*T*A*'
  else
    vTemp := MaskEdit3.Text;
  if cadOrdemC._pesquisa(ComboBox1.Text, ComboBox3.Text,vTemp, MaskEdit1.Text, MaskEdit2.Text ) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
    ComboBox1.SetFocus;

  if (not cadOrdemC.dataSet.IsEmpty) then
    for I := 0 to DBGrid1.Columns.Count - 1 do
      if DBGrid1.Columns[i].FieldName = 'AJUDANTES' then
        DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
end;

procedure TfrmCadOrdemCarregamento.BitBtn20Click(Sender: TObject);
begin
  inherited;
  if Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = '' then
    raise exception.create('Tipo de Entrega deve ser informado');

  if Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'PARCIAL' then
    pgControlCarreamento.ActivePage := tsParcial
  else if Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
    pgControlCarreamento.ActivePage := tsTotal;
end;

procedure TfrmCadOrdemCarregamento.BitBtn21Click(Sender: TObject);
begin
  inherited;
  pgControlCarreamento.ActivePage := tsParcial;
end;

procedure TfrmCadOrdemCarregamento.BitBtn23Click(Sender: TObject);
begin
  inherited;
  cadOrdemC.vItem.vHistorico._filtrarHistorico(cadOrdemC.vItem.dataSet.FieldByName('nitem').AsInteger);
  pgControlCarreamento.ActivePage := tsHistorico2;
end;

procedure TfrmCadOrdemCarregamento.BitBtn24Click(Sender: TObject);
begin
  inherited;
  if cadOrdemC._informarQtdeParaHistorico(EditHw2.AsValue, CheckBox8.Checked) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
    	DBGrid4.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
    EditHw2.SetFocus;
end;

procedure TfrmCadOrdemCarregamento.BitBtn25Click(Sender: TObject);
begin
  inherited;
  cadOrdemC.vItem.vHistorico.CancelUpdates;
  cadOrdemC.vItem.CancelUpdates;
  cadOrdemC.Cancel;

  TForm(pnCarregamento.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadOrdemCarregamento.BitBtn28Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if cadOrdemC._removerHistorico then
      if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
        DBGrid5.SetFocus;                       
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.BitBtn29Click(Sender: TObject);
begin
  inherited;
  cadOrdemC.vImp_Descricao:= CheckBox4.Checked;
  cadOrdemC.vImp_OrdenarPorCliente := RadioGroup2.ItemIndex = 0;
  cadOrdemC.vImp_OrdenarPorCidade := RadioGroup2.ItemIndex = 1;
  cadOrdemC.vImp_OrdenarPorLocalidade := RadioGroup2.ItemIndex = 2;
  cadOrdemC.vImp_OrdenarPorNumVenda := RadioGroup2.ItemIndex = 3;
  if RadioGroup2.Items.IndexOf('Rota') > -1 then
    cadOrdemC.vImp_OrdenarPorRota := RadioGroup2.ItemIndex = 4;
  cadOrdemC.vImp_OrdenarPorAlocacao:= RadioGroup3.ItemIndex = 0;
  cadOrdemC.vImp_OrdenarPorCodigo:= RadioGroup3.ItemIndex = 1;
  cadOrdemC.vImp_OrdenarPorDescricao:= RadioGroup3.ItemIndex = 2;
  cadOrdemC.vImp_NomeFantasia:= CheckBox6.Checked;
  cadOrdemC.vImp_DetalhadoRecPed:= (CheckBox5.Checked) and (CheckBox5.Enabled);
  cadOrdemC.vImp_Detalhado:= CheckBox9.Checked;
  cadOrdemC.vImp_ImpAlocacao:= CheckBox10.Checked;
  cadOrdemC._impressao(Copy(RadioGroup1.Items[RadioGroup1.itemIndex],1,2));
//  TForm(pnImpressao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadOrdemCarregamento.BitBtn30Click(Sender: TObject);
begin
  inherited;
  TForm(pnImpressao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadOrdemCarregamento.BitBtn32Click(Sender: TObject);
begin
  if not cadOrdemC.imprimirItens then
    exit;
end;

procedure TfrmCadOrdemCarregamento.BitBtn33Click(Sender: TObject);
begin
  inherited;
  if montaOC = nil then
  begin
    montaOC := TMontagemOC.create;
    edDataBase.Text := DateToStr(montaOC.DataBase);
  end;
  montaOC.CargaSalva := 0;
  iniciarCamposMontagemMovimento;

  cadOrdemC.vVeic._abreTodos;
  if (not vDadosIni.abreForm('Montagem de Carga', pnMontagem, opFormsDefCadEsc)) then
  begin
    cadOrdemC.dataSet.Cancel;
    Exit;
  end
  else
    TForm(pnEscolherMontagem.Parent).ModalResult := IDOK;
end;

procedure TfrmCadOrdemCarregamento.btConcluirMontagemClick(Sender: TObject);
begin
  inherited;
  if montaOC.CargaSalva = 0 then
  begin
    if Application.MessageBox('Deseja mesmo criar uma carga para os pedidos selecionados?', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;
  end
  else if Application.MessageBox(pchar('Deseja mesmo adicionar pedidos selecionados na carga ' +
    IntToStr(montaOC.CargaSalva) + '?'), 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    btConcluirMontagem.Enabled := False;
    btPesquisarPedidos.Enabled := False;
    DBLookupComboBox5.Enabled := False;
    GroupBox9.Enabled := False;
    GroupBox11.Enabled := False;
    ProgressBar1.Visible := True;
    gridCidades.DataSource := nil;
    gridClientes.DataSource := nil;
    cadOrdemC.vProgresso := TProgressBar(ProgressBar1);

    if cadOrdemC._montarOrdemCarregamentoPeloMovimento then
    begin
      montaOC.PesoTotal := 0;
      montaOC.QtdeVendas := 0;
      TForm(pnMontagem.Parent).ModalResult := IDOK;
    end;
  finally
    gridCidades.DataSource := montaOC.vDSCidades;
    gridClientes.DataSource := montaOC.vDSClientes;
    ProgressBar1.Visible := False;
    btPesquisarPedidos.Enabled := True;
    btConcluirMontagem.Enabled := True;
    DBLookupComboBox5.Enabled := True; 
    GroupBox9.Enabled := True;
    GroupBox11.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.BitBtn34Click(Sender: TObject);
begin
  inherited;
  TForm(pnMontagem.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadOrdemCarregamento.BitBtn35Click(Sender: TObject);
begin
  inherited;
  montaOCPorRota := TMontagemPorRota.create;
  try
    grid_monta_por_rota.Visible := False;
    montaOCPorRota.pesoChange := montage_porrota_peso_change;
    cadOrdemC.vVeic._abreTodos;
    edcod_rota.Clear;
    edrota.Clear;
    eddescricao.Clear;
    btSelectAll.Visible          := False;
    btUnSelectAll.Visible        := False;
    bt_ped_aberto_sel.Visible    := False;
    bt_ped_aberto_enviar.Visible := False;

    if (not vDadosIni.abreForm('Montagem de Carga', pnMontagemRota, opFormsDefCadEsc)) then
    begin
      cadOrdemC.dataSet.Cancel;
      Exit;
    end
    else
      TForm(pnEscolherMontagem.Parent).ModalResult := IDOK;
  finally
    FreeAndNil(montaOCPorRota);
  end;
end;

procedure TfrmCadOrdemCarregamento.BitBtn36Click(Sender: TObject);
var
  Arotas: TRotas_entr_classList;
  I: Integer;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  bt_ped_aberto_sel.Visible := False;
  bt_ped_aberto_enviar.Visible := False;
  Arotas := montaOCPorRota.GetRotasAtivas;
  try
    listGrid.Clear;
    for I := 0 to Arotas.Count - 1 do with Arotas.Items[I] do
      listGrid.Items.Add(Format('%s - Rota %s - %s', [vDadosIni.StrZero(cod_rota, 3), rota, descricao]));

    pn_pnmemo_botoes.Visible := True;
    spSairGrid.Visible       := False;
    listGrid.OnDblClick      := listGridDblClick;

    if vDadosIni.abreForm('Selecione a rota para incluir', pnMemo, opFormsDefCadEsc) then
      if listGrid.ItemIndex >= 0 then
        montaOCPorRota.rotaSel := Arotas.Items[listGrid.ItemIndex].Clone;

    if not Assigned(montaOCPorRota.rotaSel) then
      Exit;

    edcod_rota.Text  := IntToStr(montaOCPorRota.rotaSel.cod_rota);
    edrota.Text      := montaOCPorRota.rotaSel.rota;
    eddescricao.Text := montaOCPorRota.rotaSel.descricao;
    Application.ProcessMessages;

    grid_monta_por_rota.DataSource := montaOCPorRota.dsource;

    lb_peso.Caption := '0,00';
    if montaOCPorRota.iniciarMontagem(ed_monta_rota_dataini.Text, ed_monta_rota_datafim.Text) then
      grid_monta_por_rota.Visible := montaOCPorRota.dataSet.RecordCount > 0
    else
      grid_monta_por_rota.Visible := False;
    btSelectAll.Visible := grid_monta_por_rota.Visible;
    btUnSelectAll.Visible := grid_monta_por_rota.Visible;


    bt_ped_aberto_sel.Visible := montaOCPorRota.pedidosAbertos > 0;
    bt_ped_aberto_enviar.Visible := montaOCPorRota.pedidosAbertos > 0;

  finally
    pn_pnmemo_botoes.Visible := False;
    spSairGrid.Visible       := True;
    listGrid.OnDblClick      := nil;
    FreeAndNil(Arotas);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.BitBtn38Click(Sender: TObject);
begin
  inherited;
//  if montaOC.CargaSalva = 0 then
  begin
    if Application.MessageBox('Deseja mesmo criar uma carga para os pedidos selecionados?', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;
  end;
//  else if Application.MessageBox(pchar('Deseja mesmo adicionar pedidos selecionados na carga ' +
//    IntToStr(montaOCPorRota.CargaSalva) + '?'), 'Confirmação',
//    MB_ICONQUESTION + MB_YESNO) <> IDYES then
//    Exit;

  try
    Screen.Cursor := crHourGlass;
    pnMontagemRota.Enabled := False;
    progress_por_rota.Visible := True;
    cadOrdemC.vProgresso := TProgressBar(progress_por_rota);

    if cadOrdemC._montarOrdemCarregamentoPeloMovimento_Rota then
      TForm(pnMontagemRota.Parent).ModalResult := IDOK;

  finally
    cadOrdemC.vProgresso := nil;
    progress_por_rota.Visible := False;
    pnMontagemRota.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.btPesquisarPedidosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    btPesquisarPedidos.Enabled := False;
    ProgressBar1.Visible := True;
    gridCidades.DataSource := nil;
    gridClientes.DataSource := nil;
    montaOC.vProgresso := TProgressBar(ProgressBar1);

    montaOC.DataBase := StrToDate(edDataBase.Text);
    montaOC.iniciarMontagem;

    btConcluirMontagem.Enabled := (montaOC.QtdeVendas > 0) and (not montaOC.dataSet.IsEmpty);

    Panel26.Caption := 'Peso Total: ' + Format('%0.3n', [montaOC.PesoTotal + montaOC.PesoCargaSalva]) + ' KG';
    Panel28.Caption := 'Qtde total de Pedidos: ' + IntToStr(montaOC.QtdeVendas + montaOC.QtdeVendasSalvas);
  finally
    gridCidades.DataSource := montaOC.vDSCidades;
    gridClientes.DataSource := montaOC.vDSClientes;
    ProgressBar1.Visible := False;
    btPesquisarPedidos.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.btSelectAllClick(Sender: TObject);
begin
  inherited;
  if Assigned(montaOCPorRota) then
    if Assigned(montaOCPorRota.dataSet) then
      montaOCPorRota.checkUnCheckAllRows(True);
end;

procedure TfrmCadOrdemCarregamento.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  if Assigned(montaOCPorRota) then
    if Assigned(montaOCPorRota.dataSet) then
      montaOCPorRota.checkUnCheckAllRows(False);
end;

procedure TfrmCadOrdemCarregamento.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not cadOrdemC.Insert then
      exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;                       
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.BitBtn4Click(Sender: TObject);
begin
  if not cadOrdemC.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(cadOrdemC.vNomeCampoErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if cadOrdemC.Insert then
      begin
        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else
      inherited;
  end;
end;

procedure TfrmCadOrdemCarregamento.BitBtn5Click(Sender: TObject);
begin
  cadOrdemC.Cancel;
  inherited;
end;

procedure TfrmCadOrdemCarregamento.BitBtn7Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if (vDadosIni.vEmp.vOC_TipoMontagem <> 'F') then
    begin
      {
      if montaOC = nil then
      begin
        montaOC := TMontagemOC.create;
        edDataBase.Text := DateToStr(montaOC.DataBase);
      end;
      montaOC.CargaSalva := 0;
      iniciarCamposMontagemMovimento;
      if (not cadOrdemC._abreFormMontagemMovimento) then
      begin
        cadOrdemC.dataSet.Cancel;
        Exit;
      end;
      }
      if not vDadosIni.abreForm('Escolha de montagem de carga', pnEscolherMontagem, opFormsDefCadEsc) then
        Exit;

    end
    else if (vDadosIni.vEmp.vOC_TipoMontagem = 'F') and (not cadOrdemC._montarOrdemCarregamentoPeloAssistente) then
      Exit
    else if cadOrdemC.dataSet.FieldByName('tipo_carga').AsString = 'S' then
      Exit;

    inherited;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;                       
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.BitBtn8Click(Sender: TObject);
begin
  inherited;
  PageControl3.ActivePage := tsItens;
end;

procedure TfrmCadOrdemCarregamento.BitBtn9Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not cadOrdemC._adicionarVendaParaCarregamento then
      Exit;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.CheckBox2Click(Sender: TObject);
begin
  inherited;
  cadOrdemC.vItem.vHistorico._filtrarHistorico(cadOrdemC.vItem.dataSet.FieldByName('nitem').AsInteger,CheckBox2.Checked);
end;

procedure TfrmCadOrdemCarregamento.CheckBox9Click(Sender: TObject);
begin
  inherited;
  CheckBox5.Enabled := not CheckBox9.Checked; 
end;

procedure TfrmCadOrdemCarregamento.ckNomeFantasiaClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to gridClientes.Columns.Count - 1 do
    if ckNomeFantasia.Checked then
    begin
      if gridClientes.Columns[i].FieldName = 'RAZAO' then
      begin
        gridClientes.Columns[i].FieldName := 'NOME_CLIENTE';
        TClientDataSet(gridClientes.DataSource.DataSet).IndexFieldNames := 'NOME_CLIENTE';
      end;
    end
    else if gridClientes.Columns[i].FieldName = 'NOME_CLIENTE' then
    begin
      gridClientes.Columns[i].FieldName := 'RAZAO';
        TClientDataSet(gridClientes.DataSource.DataSet).IndexFieldNames := 'RAZAO';
    end;
end;

procedure TfrmCadOrdemCarregamento.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  DBText1.Visible := cadOrdemC.vVeic._existeVeiculo(cadOrdemC.dataSet.FieldByName('cod_veic').AsInteger);
  DBText9.Visible := DBText1.Visible;
  if DBText1.Visible then
    if cadOrdemC.vVeic.dataSet.FieldByName('peso_maximo').AsFloat > 0 then
      if cadOrdemC.dataSet.FieldByName('peso_max').AsFloat <>
        cadOrdemC.vVeic.dataSet.FieldByName('peso_maximo').AsFloat then
        if cadOrdemC.dataSet.State in [dsEdit, dsInsert] then
          if Application.MessageBox('Alterar peso Máximo da Ordem de Carregamento', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
            cadOrdemC.dataSet.FieldByName('peso_max').AsFloat := cadOrdemC.vVeic.dataSet.FieldByName('peso_maximo').AsFloat;
end;

procedure TfrmCadOrdemCarregamento.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;


procedure TfrmCadOrdemCarregamento.DBGrid2ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
    cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TfrmCadOrdemCarregamento.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
  Panel12.Visible := True;
  EditHw2.AsValue :=  cadOrdemC._getQtdePendente;
  if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
  	EditHw2.SetFocus;
end;

procedure TfrmCadOrdemCarregamento.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (Trim(DBGrid4.DataSource.DataSet.FieldByName('pend').AsString) = 'S') then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
//    else if (Trim(DBGrid4.DataSource.DataSet.FieldByName('cod_empresa').AsString) = '0') then
//      TDBGrid(sender).canvas.brush.color :=  $00B0FFB0
    else
      TDBGrid(sender).canvas.brush.color := $00EEDFD2;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid4.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid4.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadOrdemCarregamento.DBGrid4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    DBGrid4DblClick(DBGrid4); 
end;

procedure TfrmCadOrdemCarregamento.DBGrid6CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    cadOrdemC.vEnt._marcaDesmarcaLinha;
end;

procedure TfrmCadOrdemCarregamento.DBGrid6DblClick(Sender: TObject);
begin
  inherited;
  cadOrdemC.vEnt._marcaDesmarcaLinha;
end;

procedure TfrmCadOrdemCarregamento.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.Field.AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid6.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid6.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadOrdemCarregamento.DBGrid6KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    cadOrdemC.vEnt._marcaDesmarcaLinha;
end;

procedure TfrmCadOrdemCarregamento.DBGrid6MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    cadOrdemC.vEnt._marcaDesmarcaLinha;
end;

procedure TfrmCadOrdemCarregamento.DBLookupComboBox6Exit(Sender: TObject);
begin
  inherited;
  montage_porrota_peso_change;  
end;

procedure TfrmCadOrdemCarregamento.edDataBaseKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F2) or (Key = VK_F4) then
  begin
    if not btPesquisarPedidos.Enabled then
      Exit;
    try
      gridCidades.DataSource := nil;
      gridClientes.DataSource := nil;

      montaOC.dataSet.First;
      while not montaOC.dataSet.Eof do
      begin
        if (Key = VK_F2) then
          if Trim(montaOC.dataSet.FieldByName('sel').AsString) = '' then
            marcaDesmarcaCidade;

        if (Key = VK_F4) then
          if Trim(montaOC.dataSet.FieldByName('sel').AsString) = 'S' then
            marcaDesmarcaCidade;
        montaOC.dataSet.Next;
      end;
      montaOC.dataSet.First;
      btConcluirMontagem.Enabled := (montaOC.QtdeVendas > 0) and (not montaOC.dataSet.IsEmpty);
    finally
      gridCidades.DataSource := montaOC.vDSCidades;
      gridClientes.DataSource := montaOC.vDSClientes;
    end;
  end
end;

procedure TfrmCadOrdemCarregamento.EditHw2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
    	DBGrid4.SetFocus;
end;

procedure TfrmCadOrdemCarregamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if not Assigned(DBGrid2.DataSource) then
    Exit;
  if not Assigned(DBGrid2.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa2 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
      cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid2, GridCfg2, true, ListPositions2, cdsGrid2);

  cadOrdemC.Free;
  cadOrdemC := nil;

  Action := caFree;
  frmCadOrdemCarregamento := nil;
end;

procedure TfrmCadOrdemCarregamento.FormCloseTemp(Sender: TObject;
  var Action: TCloseAction);
begin
  _GravaConfiguracoesInteger(RadioGroup2.Name, RadioGroup2.ItemIndex);
  _GravaConfiguracoesInteger(RadioGroup3.Name, RadioGroup3.ItemIndex);
  _GravaConfiguracoesBoolean(CheckBox4.Name, CheckBox4.Checked);
  _GravaConfiguracoesBoolean(CheckBox5.Name, CheckBox5.Checked);
  _GravaConfiguracoesBoolean(CheckBox6.Name, CheckBox6.Checked);
  _GravaConfiguracoesBoolean(CheckBox9.Name, CheckBox9.Checked);
  _GravaConfiguracoesBoolean(CheckBox10.Name, CheckBox10.Checked);
  TForm(pnImpressao.Parent).OnKeyDown := nil;
  Timer2.Enabled := False;
end;

procedure TfrmCadOrdemCarregamento.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  cadOrdemC := TOrdemCarregamento.create;

  tsCadastro.TabVisible := false;
  tsItens.TabVisible := false;
  tsItens2.TabVisible := false;
  tsHistorico.TabVisible := false;
  tsPesquisaVenda.TabVisible := false;
  tsCarregamento.TabVisible := false;
  tsImpressao.TabVisible := False;
  tsMontagem.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadOrdemCarregamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      if BitBtn3.Visible then
        BitBtn3Click(Sender);
  end
  else if key = VK_ESCAPE then
  begin
    if (cadOrdemC.dataSet.State in [dsEdit, dsInsert]) then
    begin
      ActiveControl := BitBtn5;
      BitBtn5Click(Sender);
    end;
  end;
end;

procedure TfrmCadOrdemCarregamento.FormMontagemClose(Sender: TObject; var Action: TCloseAction);
begin
  gridCidades.DataSource := nil;
  gridClientes.DataSource := nil;
  _GravaConfiguracoesBoolean(ckNomeFantasia.Name, ckNomeFantasia.Checked);
end;

procedure TfrmCadOrdemCarregamento.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmOrdemCarregamento.dsCarga;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet2, GridCfg2, DBGrid2, cdsGrid2, cdsColunas2, trans2, ListGridsAndDataSets2,
      ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario2);
    inherited;
  end;

  if TelaCadastro = 1 then
    BitBtn3.Click
  else if TelaCadastro = 2 then
    BitBtn7.Click;

  if PrimeiraPesquisa2 then
  begin
    PrimeiraPesquisa2 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid2, GridCfg2, cdsGrid2, cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
  end;

  BitBtn3.Visible := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
  SpeedButton1.Enabled := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
  SpeedButton6.Enabled := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
  SpeedButton7.Enabled := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
  SpeedButton8.Enabled := vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D';
  if not BitBtn3.Visible then
    BitBtn7.Top := BitBtn3.Top;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadOrdemCarregamento.FormTempKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    BitBtn30.Click;
end;

procedure TfrmCadOrdemCarregamento.gridCidadesCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    marcaDesmarcaCidade;
end;

procedure TfrmCadOrdemCarregamento.gridCidadesDblClick(Sender: TObject);
begin
  inherited;
  marcaDesmarcaCidade;
end;

procedure TfrmCadOrdemCarregamento.gridCidadesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    gridCidades.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(gridCidades.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadOrdemCarregamento.gridCidadesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    marcaDesmarcaCidade
  else if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCadOrdemCarregamento.gridCidadesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    marcaDesmarcaCidade;
end;

procedure TfrmCadOrdemCarregamento.gridClientesCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    marcaDesmarcaCliente;
end;

procedure TfrmCadOrdemCarregamento.gridClientesDblClick(Sender: TObject);
begin
  inherited;
  marcaDesmarcaCliente;
end;

procedure TfrmCadOrdemCarregamento.gridClientesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    gridClientes.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(gridClientes.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadOrdemCarregamento.gridClientesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    marcaDesmarcaCliente
  else if Key = VK_TAB then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TfrmCadOrdemCarregamento.gridClientesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    marcaDesmarcaCliente;
end;

procedure TfrmCadOrdemCarregamento.grid_monta_por_rotaCellClick(
  Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if Assigned(montaOCPorRota) then
      if Assigned(montaOCPorRota.dataSet) then
        montaOCPorRota.checkUnCheckRow();
end;

procedure TfrmCadOrdemCarregamento.grid_monta_por_rotaDblClick(Sender: TObject);
begin
  inherited;
  if Assigned(montaOCPorRota) then
    if Assigned(montaOCPorRota.dataSet) then
      montaOCPorRota.checkUnCheckRow();
end;

procedure TfrmCadOrdemCarregamento.grid_monta_por_rotaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    Agrid := TDBGrid(Sender);
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadOrdemCarregamento.grid_monta_por_rotaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key in [VK_RETURN, VK_SPACE] then
    if Assigned(montaOCPorRota) then
      if Assigned(montaOCPorRota.dataSet) then
        montaOCPorRota.checkUnCheckRow();
end;

procedure TfrmCadOrdemCarregamento.grid_monta_por_rotaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ssCtrl in Shift then
    if Assigned(montaOCPorRota) then
      if Assigned(montaOCPorRota.dataSet) then
        montaOCPorRota.checkUnCheckRow();
end;

procedure TfrmCadOrdemCarregamento.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  vDadosIni.vInibeMensPesqPros := 'S';
  DBEdit8.Enabled := vDadosIni.PesqPros('OCR034', 'HABILITAR', '', 'CARGA', cadOrdemC.dataSet.FieldByName('cod_carga').AsString, cadOrdemC.buscas, True);
//  Label14.Visible := not DBEdit8.Enabled;
  DBText1.Visible := cadOrdemC.vVeic._existeVeiculo(cadOrdemC.dataSet.FieldByName('cod_veic').AsInteger);
  DBText9.Visible := DBText1.Visible;
end;

procedure TfrmCadOrdemCarregamento.GroupBox7Enter(Sender: TObject);
begin
  inherited;
  if Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
    Panel18.Caption := '';

  Panel18.Visible := Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL';
  Panel12.Visible := False;

  MaskEdit4.Text := DateToStr(vDadosIni.getDataBanco(cadOrdemC.buscas));
end;

procedure TfrmCadOrdemCarregamento.iniciarCamposMontagemMovimento;
var
  I: Integer;
begin
  inherited;

  if montaOC = nil then
  begin
    montaOC := TMontagemOC.create;
    edDataBase.Text := DateToStr(montaOC.DataBase);
  end;

  montaOC.dataSet.EmptyDataSet;
  montaOC.vClientes.dataSet.EmptyDataSet;
  montaOC.vVendas.dataSet.EmptyDataSet;
  montaOC.PesoTotal := 0;
  montaOC.QtdeVendas := 0;

  Panel26.Caption := 'Peso Total: ' + Format('%0.3n', [0.00]) + ' KG';
  Panel28.Caption := 'Qtde total de Pedidos: ' + IntToStr(0);
  
  gridCidades.DataSource := montaOC.vDSCidades;
  gridClientes.DataSource := montaOC.vDSClientes;

  ckNomeFantasia.Checked := _LerConfiguracoesRegistroBoolean(ckNomeFantasia.Name);

  cadOrdemC.vVeic._abreTodos;
  if not cadOrdemC.vVeic.dataSet.IsEmpty then
  begin
    DBLookupComboBox5.KeyValue := cadOrdemC.vVeic.dataSet.FieldByName('cod_veic').AsInteger;
    Panel33.Visible := True;
  end
  else
    Panel33.Visible := False;

  for I := 0 to gridClientes.Columns.Count - 1 do
    if ckNomeFantasia.Checked then
    begin
      if gridClientes.Columns[i].FieldName = 'RAZAO' then
      begin
        gridClientes.Columns[i].FieldName := 'NOME_CLIENTE';
        TClientDataSet(gridClientes.DataSource.DataSet).IndexFieldNames := 'NOME_CLIENTE';
      end;
    end
    else if gridClientes.Columns[i].FieldName = 'NOME_CLIENTE' then
    begin
      gridClientes.Columns[i].FieldName := 'RAZAO';
        TClientDataSet(gridClientes.DataSource.DataSet).IndexFieldNames := 'RAZAO';
    end;

  imgMontagem.Hint :=
    'Para marcar todas cidades pressione "F2"' +
    'Para desmarcar todas cidades pressione "F4"';

  btConcluirMontagem.Enabled := (montaOC.QtdeVendas > 0) and (not montaOC.dataSet.IsEmpty);
end;

procedure TfrmCadOrdemCarregamento.marcaDesmarcaCidade;
begin
  montaOC.marcaDemarcaCidade;
  Panel26.Caption := 'Peso Total: ' + Format('%0.3n', [montaOC.PesoTotal + montaOC.PesoCargaSalva]) + ' KG';
  Panel28.Caption := 'Qtde total de Pedidos: ' + IntToStr(montaOC.QtdeVendas + montaOC.QtdeVendasSalvas);
  btConcluirMontagem.Enabled := (montaOC.QtdeVendas > 0) and (not montaOC.dataSet.IsEmpty);
end;

procedure TfrmCadOrdemCarregamento.marcaDesmarcaCliente;
begin
  montaOC.marcaDesmarcaCliente(True);
  Panel26.Caption := 'Peso Total: ' + Format('%0.3n', [montaOC.PesoTotal + montaOC.PesoCargaSalva]) + ' KG';
  Panel28.Caption := 'Qtde total de Pedidos: ' + IntToStr(montaOC.QtdeVendas + montaOC.QtdeVendasSalvas);
  btConcluirMontagem.Enabled := (montaOC.QtdeVendas > 0) and (not montaOC.dataSet.IsEmpty);
end;

procedure TfrmCadOrdemCarregamento.MenuItem1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO197', 'CONFIGURAR', '', 'CARGA_ITEM', '', cadOrdemC.buscas, true) then
    vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas2, DBGrid2, GridCfg2, cdsGrid2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TfrmCadOrdemCarregamento.MenuItem2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO198', 'RESETAR', '', 'CARGA_ITEM', '', cadOrdemC.buscas, true) then
    vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid2, GridCfg2, cdsColunas2, cdsGrid2, usuario2,
       vDadosIni.transacaoCol, fReset2, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TfrmCadOrdemCarregamento.MenuItem3Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid2, usuario2, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TfrmCadOrdemCarregamento.MenuItem4Click(Sender: TObject);
begin
   vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid2);
end;

procedure TfrmCadOrdemCarregamento.MenuItem5Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid2.DataSource.DataSet.FieldByName(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName).AsString;
end;

procedure TfrmCadOrdemCarregamento.montage_porrota_peso_change;
begin
  if Assigned(montaOCPorRota) then
    if Assigned(montaOCPorRota.pedidosSel) then
    begin
      lb_peso.Caption := Format('%n', [montaOCPorRota.pedidosSel.pesoTotal]);
      lb_peso.Font.Color := IfThen(montaOCPorRota.pedidosSel.pesoTotal > cadOrdemC.vVeic.f_float('PESO_MAXIMO'), clRed, clBlue);
    end;
end;

procedure TfrmCadOrdemCarregamento.Panel12Exit(Sender: TObject);
begin
  inherited;
  Panel12.Visible := False;
end;

procedure TfrmCadOrdemCarregamento.pnItensEnter(Sender: TObject);
begin
  inherited;
	pgItens.ActivePage := tsItens2;
end;

procedure TfrmCadOrdemCarregamento.pnMontagemEnter(Sender: TObject);
begin
  inherited;
  TForm(pnMontagem.Parent).KeyPreview := True;
  TForm(pnMontagem.Parent).OnKeyDown := edDataBase.OnKeyDown;
  TForm(pnMontagem.Parent).OnClose := FormMontagemClose;
end;

procedure TfrmCadOrdemCarregamento.pnCarregamentoEnter(Sender: TObject);
begin
  inherited;
  tsEntrega.TabVisible := False;
  tsParcial.TabVisible := False;
  tsTotal.TabVisible := False;
  tsHistorico2.TabVisible := False;
  cadOrdemC._cargaPendenteParaCarregamento;
//  if vDadosIni.vEmp.vOC_TipoPadraoEntregaOrdemC = 'P' then
//    pgControlCarreamento.ActivePage := tsParcial
//  else if vDadosIni.vEmp.vOC_TipoPadraoEntregaOrdemC = 'T' then
//    pgControlCarreamento.ActivePage := tsTotal
//  else
  begin
    if Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'PARCIAL' then
      pgControlCarreamento.ActivePage := tsParcial
    else if Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
    begin
      if Trim(cadOrdemC.dataSet.FieldByName('conferir').AsString) = '' then
        pgControlCarreamento.ActivePage := tsTotal
      else if Trim(cadOrdemC.dataSet.FieldByName('conferir').AsString) = 'S' then
        pgControlCarreamento.ActivePage := tsParcial
      else
        pgControlCarreamento.ActivePage := tsParcial;
    end
    else
      pgControlCarreamento.ActivePage := tsEntrega;
  end;
  Timer3.Enabled := True;

end;

procedure TfrmCadOrdemCarregamento.pnCarregamentoExit(Sender: TObject);
begin
  inherited;
  Timer3.Enabled := False;
end;

procedure TfrmCadOrdemCarregamento.pnImpressaoEnter(Sender: TObject);
begin
  inherited;
  RadioGroup1.Items.Clear;
  CheckBox5.Visible := Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL';
  if Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
  begin
    RadioGroup1.Items.Add('01 - Sintese de Pedidos/Nota Fiscal');
    if Trim(cadOrdemC.dataSet.FieldByName('status').AsString) = 'FECHADA' then
      RadioGroup1.Items.Add('02 - Relação de Mercadorias para Entrega');
  end
  else
  begin
    RadioGroup1.Items.Add('01 - Sintese de Pedidos/Nota Fiscal');
    RadioGroup1.Items.Add('02 - Relação de Mercadorias para Entrega - Último Carregamento');
    RadioGroup1.Items.Add('03 - Relação de Mercadorias para Entrega - Selecionar Carregamentos');
    RadioGroup1.Items.Add('04 - Sintese de Pedidos/Nota Fiscal a entregar');
    RadioGroup1.Items.Add('05 - Sintese de Pedidos/Nota Fiscal entregues');
    if Trim(cadOrdemC.dataSet.FieldByName('status').AsString) = 'FECHADA' then
      RadioGroup1.Items.Add('06 - Sintese de Pedidos/Nota Fiscal entregues - Fechamento');
  end;
  if RadioGroup1.Items.Count > 0 then
    RadioGroup1.ItemIndex := 0;

  RadioGroup2.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup2.Name);
  RadioGroup3.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup3.Name);
  CheckBox4.Checked := _LerConfiguracoesRegistroBoolean(CheckBox4.Name);
  CheckBox5.Checked := _LerConfiguracoesRegistroBoolean(CheckBox5.Name);
  CheckBox6.Checked := _LerConfiguracoesRegistroBoolean(CheckBox6.Name);
  CheckBox9.Checked := _LerConfiguracoesRegistroBoolean(CheckBox9.Name);
  CheckBox10.Checked := _LerConfiguracoesRegistroBoolean(CheckBox10.Name);

  TForm(pnImpressao.Parent).OnKeyDown := FormTempKeyDown;
  TForm(pnImpressao.Parent).OnClose := FormCloseTemp;
  Timer2.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (BitBtn29.CanFocus) then
  	BitBtn29.SetFocus;
end;

procedure TfrmCadOrdemCarregamento.pnPesqVendaEnter(Sender: TObject);
begin
  inherited;
//  if bit then

  Label18.Caption := 'Informe o número da venda acima e clique em Procurar';
  BitBtn12.Enabled := True;
  BitBtn14.Enabled := False;
  BitBtn16.Visible := False;
end;

procedure TfrmCadOrdemCarregamento.ScrollBox4Enter(Sender: TObject);
begin
  vConfigColuna2 := true;
end;

procedure TfrmCadOrdemCarregamento.Somarvaloresdacoluna1Click(Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid2, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TfrmCadOrdemCarregamento.bt_ped_aberto_enviarClick(Sender: TObject);
var
  Acod_pedidos: arrayInt;
  AProcedure: TprocedureArrayInt;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    if Assigned(montaOCPorRota) then
      if Assigned(montaOCPorRota.dataSet) then with montaOCPorRota do
      begin
        prepare_loop('sel = ''S'' and ((status_ped = '''') or (status_ped is null))').dataSet.First;
        try
          SetLength(Acod_pedidos, 0);
          while not dataSet.Eof do
          begin
            if f_str('status_ped') = '' then
            begin
              SetLength(Acod_pedidos, Succ(Length(Acod_pedidos)));
              Acod_pedidos[High(Acod_pedidos)] := f_int('nped');
            end;

            dataSet.Next;
          end;
          if Length(Acod_pedidos) = 0 then
          begin
            vDadosIni.ShowErro('Nenhum pedido aberto encontrado');
            Exit;
          end;

        finally
          montaOCPorRota.prepare_loop_done;
        end;
        if vDadosIni.vNotaFiscal.AHandle = 0 then
          CarregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);

        if vDadosIni.vNotaFiscal.AHandle = 0 then
        begin
          Application.MessageBox('Pacote Nota Fiscal não carregado', 'Anteção', 0 + 64);
          Exit;
        end;
        @AProcedure := GetProcAddress(vDadosIni.vNotaFiscal.AHandle, 'faturamento_add_pedidos');
        if Assigned(AProcedure) then
        begin
          AProcedure(Acod_pedidos, True);

          bt_ped_aberto_sel.Visible    := False;
          bt_ped_aberto_enviar.Visible := False;
          Application.ProcessMessages;

          lb_peso.Caption := '0,00';
          if montaOCPorRota.iniciarMontagem(ed_monta_rota_dataini.Text, ed_monta_rota_datafim.Text) then
            grid_monta_por_rota.Visible := montaOCPorRota.dataSet.RecordCount > 0
          else
            grid_monta_por_rota.Visible := False;
          btSelectAll.Visible   := grid_monta_por_rota.Visible;
          btUnSelectAll.Visible := grid_monta_por_rota.Visible;

          bt_ped_aberto_sel.Visible    := montaOCPorRota.pedidosAbertos > 0;
          bt_ped_aberto_enviar.Visible := montaOCPorRota.pedidosAbertos > 0;
        end;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.bt_ped_aberto_selClick(Sender: TObject);
begin
  inherited;
  if Assigned(montaOCPorRota) then
    if Assigned(montaOCPorRota.dataSet) then
    begin
      montaOCPorRota.checkUnCheckAllRows(False);
      montaOCPorRota.checkUnCheckAllRows(True , 'SEL', '((status_ped = '''') or (status_ped is null))');
    end;
end;

procedure TfrmCadOrdemCarregamento.SpeedButton11Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    cadOrdemC._adicionarRemoverMercadorias;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    cadOrdemC._informarSaida;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.SpeedButton1Click(Sender: TObject);
begin
    try
    Screen.Cursor := crHourGlass;

    if (vDadosIni.vEmp.vOC_TipoMontagem <> 'F') and (not cadOrdemC._ordemCarregamentoFechada) then
    begin
      if Application.MessageBox('Alterar usando tela de pesquisa de pedidos?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      begin
        if not cadOrdemC.Edit then
          exit;
      end
      else
      begin
        if montaOC = nil then
        begin
          montaOC := TMontagemOC.create;
          edDataBase.Text := DateToStr(montaOC.DataBase);
        end;
        montaOC.CargaSalva := cadOrdemC.dataSet.FieldByName('COD_CARGA').AsInteger;
        iniciarCamposMontagemMovimento;
        if (not cadOrdemC._abreFormMontagemMovimento) then
        begin
          cadOrdemC.dataSet.Cancel;
          Exit;
        end;
      end;
    end
    else
    if not cadOrdemC.Edit then
      exit;
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;   
end;

procedure TfrmCadOrdemCarregamento.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    cadOrdemC.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.SpeedButton3Click(Sender: TObject);
begin   
  try
    Screen.Cursor := crHourGlass;
    if cadOrdemC.dataSet.IsEmpty then
      Exit;

    if cadOrdemC.f_int('cod_rota') > 0 then
    begin
      if RadioGroup2.Items.IndexOf('Rota') = -1 then
        RadioGroup2.Items.Add('Rota');
      RadioGroup2.Columns := 5;
      RadioGroup2.ItemIndex := RadioGroup2.Items.IndexOf('Rota');
    end
    else if RadioGroup2.Items.IndexOf('Rota') > -1 then
    begin
      RadioGroup2.Items.Delete(RadioGroup2.Items.IndexOf('Rota'));
      RadioGroup2.Columns := 4;
    end;

    cadOrdemC._abreFormImpressao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.SpeedButton6Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    cadOrdemC._iniciarContinuarCarregamento;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.SpeedButton7Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    cadOrdemC._reabrirOrdemCarregamento;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.SpeedButton8Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not cadOrdemC._ordemCarregamentoFechada then
      if Application.MessageBox(pchar('Deseja fechar a ordem de carregamento?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
        cadOrdemC._fecharOrdemCarregamento;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOrdemCarregamento.SpeedButton9Click(Sender: TObject);
var
  Aprocedure: Tnfc_abreformNFCe;
begin
  inherited;

  if vDadosIni.vCliente.AHandle = 0 then
    CarregaPacote('pkClientes', vDadosIni.vCliente.AHandle);

  if vDadosIni.vCliente.AHandle = 0 then
  begin
    Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
    Exit;
  end;
  @AProcedure := GetProcAddress(vDadosIni.vCliente.AHandle, 'definir_rota');
  if Assigned(AProcedure) then
    AProcedure(StrToIntDef(edcod_rota.Text, 0));
end;

procedure TfrmCadOrdemCarregamento.Timer2Timer(Sender: TObject);
begin
  inherited;
//  CheckBox5.Enabled := (Copy(RadioGroup1.Items[RadioGroup1.itemIndex],1,2) = '02') or
//    (Copy(RadioGroup1.Items[RadioGroup1.itemIndex],1,2) = '03');
//  CheckBox7.Enabled := (Copy(RadioGroup1.Items[RadioGroup1.itemIndex],1,2) = '01') or
//  (Copy(RadioGroup1.Items[RadioGroup1.itemIndex],1,2) = '04') or
//  (Copy(RadioGroup1.Items[RadioGroup1.itemIndex],1,2) = '05') or
//  (Copy(RadioGroup1.Items[RadioGroup1.itemIndex],1,2) = '06');
//  CheckBox6.Enabled := CheckBox5.Enabled;
  Panel24.Visible := (Copy(RadioGroup1.Items[RadioGroup1.itemIndex],1,2) = '03');
end;

procedure TfrmCadOrdemCarregamento.Timer3Timer(Sender: TObject);
begin
  inherited;
  if pgControlCarreamento.ActivePage = tsEntrega then
  begin
    if DBRadioGroup1.ItemIndex = 1 then
      BitBtn20.Enabled := (Trim(cadOrdemC.dataSet.FieldByName('CONFERIR').AsString) <> 'N')
    else
      BitBtn20.Enabled := True;
  end
  else if pgControlCarreamento.ActivePage = tsTotal then
  begin
    BitBtn18.Enabled := DBRadioGroup2.ItemIndex = 0;
    //    if DBRadioGroup2.ItemIndex = 0 then
    //      BitBtn18.Enabled := (Trim(cadOrdemC.dataSet.FieldByName('CONFERIR').AsString) <> 'N')
    //    else
    //      BitBtn18.Enabled := True;
    //  BitBtn18.Enabled := (Copy(RadioGroup2.Items[RadioGroup2.itemIndex],1,1) = 'S');
  end;
end;

end.
