unit uNegativarDesnegativarCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, uPadrao, 
  uClassesContasAReceber, Menus, DBClient, IBDatabase, uEditHw;

type
  TfrmNegativarDesnegativarCl = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    ScrollBox111: TScrollBox;
    ScrollBox222: TScrollBox;
    GroupBox1: TGroupBox;
    ScrollBox1: TScrollBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    ScrollBox2: TScrollBox;
    DBGrid2: TDBGrid;
    BitBtnSairNegativarCliente: TBitBtn;
    BitBtnSairDesnegativarCliente: TBitBtn;
    Panel222: TPanel;
    Panel111: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    Selecionartodos1: TMenuItem;
    Desmarcatodos1: TMenuItem;
    Selecionartodos2: TMenuItem;
    Desmarcatodos2: TMenuItem;
    BitBtnNegativarCliente: TBitBtn;
    BitBtnDesnegativarCliente: TBitBtn;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferencia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    Configurarcolunas2: TMenuItem;
    ResetarConfiguraesdecolunas2: TMenuItem;
    ReajustarLarguradascolunas2: TMenuItem;
    SalvardadosnoExcel2: TMenuItem;
    Copiarparareadetransferencia2: TMenuItem;
    Somarvaloresdacoluna2: TMenuItem;
    Splitter11: TSplitter;
    Splitter22: TSplitter;
    BitBtnAtualizarNegativarCliente: TSpeedButton;
    BitBtnAtualizarDesnegativarCliente: TSpeedButton;
    SpeedButtonDesnegativarClienteConf: TSpeedButton;
    SpeedButtonNegativarClienteConf: TSpeedButton;
    RadioGroup1: TRadioGroup;
    GroupBox111: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBox222: TGroupBox;
    CheckBox2: TCheckBox;
    RadioGroup2: TRadioGroup;
    Panel11: TPanel;
    DBGrid11: TDBGrid;
    GroupBox11: TGroupBox;
    ScrollBox11: TScrollBox;
    Panel22: TPanel;
    DBGrid22: TDBGrid;
    GroupBox22: TGroupBox;
    ScrollBox22: TScrollBox;
    PopupMenu11: TPopupMenu;
    Configurarcolunas11: TMenuItem;
    ResetarConfiguraesdecolunas11: TMenuItem;
    ReajustarLarguradascolunas11: TMenuItem;
    SalvardadosnoExcel11: TMenuItem;
    Copiarparareadetransferencia11: TMenuItem;
    Somarvaloresdacoluna11: TMenuItem;
    PopupMenu22: TPopupMenu;
    Configurarcolunas22: TMenuItem;
    ResetarConfiguraesdecolunas22: TMenuItem;
    ReajustarLarguradascolunas22: TMenuItem;
    SalvardadosnoExcel22: TMenuItem;
    Copiarparareadetransferencia22: TMenuItem;
    Somarvaloresdacoluna22: TMenuItem;
    TabSheet3: TTabSheet;
    ScrollBox3: TScrollBox;
    Splitter33: TSplitter;
    GroupBox3: TGroupBox;
    ScrollBox4: TScrollBox;
    DBGrid3: TDBGrid;
    Panel33: TPanel;
    DBGrid33: TDBGrid;
    GroupBox33: TGroupBox;
    ScrollBox5: TScrollBox;
    Panel3: TPanel;
    BitBtnAtualizarDesnegativarCliente2: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtnSairDesnegativarCliente2: TBitBtn;
    Panel333: TPanel;
    BitBtnDesnegativarCliente2: TBitBtn;
    GroupBox333: TGroupBox;
    CheckBox3: TCheckBox;
    RadioGroup3: TRadioGroup;
    PopupMenu3: TPopupMenu;
    Configurarcolunas3: TMenuItem;
    ResetarConfiguraesdecolunas3: TMenuItem;
    ReajustarLarguradascolunas3: TMenuItem;
    SalvardadosnoExcel3: TMenuItem;
    Copiarparareadetransferencia3: TMenuItem;
    Somarvaloresdacoluna3: TMenuItem;
    Selecionartodos3: TMenuItem;
    Desmarcatodos3: TMenuItem;
    PopupMenu33: TPopupMenu;
    Configurarcolunas33: TMenuItem;
    ResetarConfiguraesdecolunas33: TMenuItem;
    ReajustarLarguradascolunas33: TMenuItem;
    SalvardadosnoExcel33: TMenuItem;
    Copiarparareadetransferencia33: TMenuItem;
    Somarvaloresdacoluna33: TMenuItem;
    RadioGroup33: TRadioGroup;
    GroupBoxFiltrar: TGroupBox;
    spFiltrarBarradosVenc: TSpeedButton;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    spFiltrarNaoBarradosVenc: TSpeedButton;
    spFiltrarBarradosSemCredVenc: TSpeedButton;
    pnFiltrarBarradosVenc: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    EdNomeFantasiaGerBarradosVenc: TEdit;
    EdRazaoSocialGerBarradosVenc: TEdit;
    EdCodClienteGerBarradosVenc: TEditHw;
    EdCpfCnpjGerBarradosVenc: TEdit;
    pnFiltrarNaoBarradosVenc: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdNomeFantasiaGerNaoBarradosVenc: TEdit;
    EdRazaoSocialGerNaoBarradosVenc: TEdit;
    EdCodClienteGerNaoBarradosVenc: TEditHw;
    EdCpfCnpjGerNaoBarradosVenc: TEdit;
    pnFiltrarBarradosSemCredVenc: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdNomeFantasiaGerBarradosSemCredVenc: TEdit;
    EdRazaoSocialGerBarradosSemCredVenc: TEdit;
    EdCodClienteGerBarradosSemCredVenc: TEditHw;
    EdCpfCnpjGerBarradosSemCredVenc: TEdit;
    Label211: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdNomeFantasiaGerBarradosSemCredVencChange(Sender: TObject);
    procedure EdCpfCnpjGerBarradosSemCredVencChange(Sender: TObject);
    procedure EdCodClienteGerBarradosSemCredVencChange(Sender: TObject);
    procedure EdRazaoSocialGerNaoBarradosVencChange(Sender: TObject);
    procedure EdNomeFantasiaGerNaoBarradosVencChange(Sender: TObject);
    procedure EdCpfCnpjGerNaoBarradosVencChange(Sender: TObject);
    procedure EdCodClienteGerNaoBarradosVencChange(Sender: TObject);
    procedure EdRazaoSocialGerBarradosVencChange(Sender: TObject);
    procedure EdNomeFantasiaGerBarradosVencChange(Sender: TObject);
    procedure EdCpfCnpjGerBarradosVencChange(Sender: TObject);
    procedure EdCodClienteGerBarradosVencChange(Sender: TObject);
    procedure spFiltrarBarradosSemCredVencClick(Sender: TObject);
    procedure spFiltrarNaoBarradosVencClick(Sender: TObject);
    procedure spFiltrarBarradosVencClick(Sender: TObject);
    procedure DBGrid33TitleClick(Column: TColumn);
    procedure DBGrid33ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid33DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RadioGroup33Click(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure CheckBox3Click(Sender: TObject);
    procedure Somarvaloresdacoluna33Click(Sender: TObject);
    procedure Copiarparareadetransferencia33Click(Sender: TObject);
    procedure SalvardadosnoExcel33Click(Sender: TObject);
    procedure ReajustarLarguradascolunas33Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas33Click(Sender: TObject);
    procedure Configurarcolunas33Click(Sender: TObject);
    procedure Somarvaloresdacoluna3Click(Sender: TObject);
    procedure Copiarparareadetransferencia3Click(Sender: TObject);
    procedure SalvardadosnoExcel3Click(Sender: TObject);
    procedure ReajustarLarguradascolunas3Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas3Click(Sender: TObject);
    procedure Configurarcolunas3Click(Sender: TObject);
    procedure Desmarcatodos3Click(Sender: TObject);
    procedure Selecionartodos3Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure BitBtnAtualizarDesnegativarCliente2Click(Sender: TObject);
    procedure BitBtnDesnegativarCliente2Click(Sender: TObject);
    procedure BitBtnSairDesnegativarCliente2Click(Sender: TObject);
    procedure Somarvaloresdacoluna22Click(Sender: TObject);
    procedure Copiarparareadetransferencia22Click(Sender: TObject);
    procedure SalvardadosnoExcel22Click(Sender: TObject);
    procedure ReajustarLarguradascolunas22Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas22Click(Sender: TObject);
    procedure Configurarcolunas22Click(Sender: TObject);
    procedure Somarvaloresdacoluna11Click(Sender: TObject);
    procedure Copiarparareadetransferencia11Click(Sender: TObject);
    procedure SalvardadosnoExcel11Click(Sender: TObject);
    procedure ReajustarLarguradascolunas11Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas11Click(Sender: TObject);
    procedure Configurarcolunas11Click(Sender: TObject);
    procedure DBGrid22ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid22TitleClick(Column: TColumn);
    procedure DBGrid11TitleClick(Column: TColumn);
    procedure DBGrid11ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox22Enter(Sender: TObject);
    procedure ScrollBox11Enter(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure SpeedButtonDesnegativarClienteConfClick(Sender: TObject);
    procedure SpeedButtonNegativarClienteConfClick(Sender: TObject);
    procedure BitBtnAtualizarDesnegativarClienteClick(Sender: TObject);
    procedure BitBtnAtualizarNegativarClienteClick(Sender: TObject);
    procedure DBGrid22DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid11DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtnDesnegativarClienteClick(Sender: TObject);
    procedure BitBtnNegativarClienteClick(Sender: TObject);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure DBGrid2ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure Copiarparareadetransferencia2Click(Sender: TObject);
    procedure SalvardadosnoExcel2Click(Sender: TObject);
    procedure ReajustarLarguradascolunas2Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas2Click(Sender: TObject);
    procedure Configurarcolunas2Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox1Enter(Sender: TObject);
    procedure Copiarparareadetransferencia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtnSairDesnegativarClienteClick(Sender: TObject);
    procedure BitBtnSairNegativarClienteClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Somarvaloresdacoluna2Click(Sender: TObject);
    procedure Selecionartodos1Click(Sender: TObject);
    procedure Selecionartodos2Click(Sender: TObject);
    procedure Desmarcatodos1Click(Sender: TObject);
    procedure Desmarcatodos2Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DesabilitarDtSetAfterScroll(
    	pNegativar: Boolean = True;
  		pDesnegativar: Boolean = True;
      pDesnegativar2: Boolean = True);
    procedure HabilitarDtSetAfterScroll(
    	pNegativar: Boolean = True;
  		pDesnegativar: Boolean = True;
      pDesnegativar2: Boolean = True);
  private
    { Private declarations }
  public
    { Public declarations }
    vCriou: SmallInt;
  end;

var
  frmNegativarDesnegativarCl: TfrmNegativarDesnegativarCl;
  NegativarClienteCredVenc: TNegativarClienteCredVenc;
  DesnegativarClienteCredVenc: TDesnegativarClienteCredVenc;
  DesnegativarClienteSemCredVenc: TDesnegativarClienteSemCredVenc;
  cdsColunas1, cdsColunas2, cdsColunas3, cdsColunas11, cdsColunas22, cdsColunas33: TClientDataSet;
  cdsGrid1, cdsGrid2, cdsGrid3, cdsGrid11, cdsGrid22, cdsGrid33: TClientDataSet;
  GridCfg1, GridCfg2, GridCfg3, GridCfg11, GridCfg22, GridCfg33: TDBGrid;
  ListGridsAndDataSets1, ListGridsAndDataSets2, ListGridsAndDataSets3, ListGridsAndDataSets11, ListGridsAndDataSets22, ListGridsAndDataSets33: TStrings;
  ListPositions1, ListPositions2, ListPositions3, ListPositions11, ListPositions22, ListPositions33: TStrings;
  fReset1, fReset2, fReset3, fReset11, fReset22, fReset33: Boolean;
  vCtrlClick1, vCtrlClick2, vCtrlClick3, vCtrlClick11, vCtrlClick22, vCtrlClick33: Boolean;
  vShiftClick1, vShiftClick2, vShiftClick3, vShiftClick11, vShiftClick22, vShiftClick33: Boolean;
  TemColunasComPosicaoAlteradas1, TemColunasComPosicaoAlteradas2, TemColunasComPosicaoAlteradas3, TemColunasComPosicaoAlteradas11, TemColunasComPosicaoAlteradas22, TemColunasComPosicaoAlteradas33: Boolean;
  PrimeiraPesquisa1, PrimeiraPesquisa2, PrimeiraPesquisa3, PrimeiraPesquisa11, PrimeiraPesquisa22, PrimeiraPesquisa33: Boolean;
  vAlterarNomeDtSet1, vAlterarNomeDtSet2, vAlterarNomeDtSet3, vAlterarNomeDtSet11, vAlterarNomeDtSet22, vAlterarNomeDtSet33: string;
  nomeDTSEt1, nomeDTSEt2, nomeDTSEt3, nomeDTSEt11, nomeDTSEt22, nomeDTSEt33: string;
  vCamposPadraoRegistro1, vCamposPadraoRegistro2, vCamposPadraoRegistro3, vCamposPadraoRegistro11, vCamposPadraoRegistro22, vCamposPadraoRegistro33: Boolean;
  vConfigColuna1, vConfigColuna2, vConfigColuna3, vConfigColuna11, vConfigColuna22, vConfigColuna33: Boolean;
  usuario: string;
  trans: TIBTransaction;
  vDtDia: TDateTime;
  vOrdem1, vOrdem2, vOrdem3: string;

implementation

uses
  uDtmContasAReceber, uDtmAtivo, Clipbrd, StrUtils, uDadosIni;

{$R *.dfm}

procedure TfrmNegativarDesnegativarCl.BitBtnSairDesnegativarCliente2Click(
  Sender: TObject);
begin
	Close;
end;

procedure TfrmNegativarDesnegativarCl.BitBtnSairDesnegativarClienteClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmNegativarDesnegativarCl.BitBtnNegativarClienteClick(Sender: TObject);
var
	vPanel: Boolean;
begin
	try
  	DBGrid1.Visible := False;

    vPanel := pnFiltrarBarradosVenc.Enabled;

    pnFiltrarBarradosVenc.Enabled := False;
  	spFiltrarBarradosVenc.Enabled := False;
    BitBtnNegativarCliente.Enabled := False;
    BitBtnAtualizarNegativarCliente.Enabled := False;

    DesabilitarDtSetAfterScroll;

    if not NegativarClienteCredVenc._negativaCliente then
      Exit;

   	HabilitarDtSetAfterScroll;

    if RadioGroup1.ItemIndex = 0 then
    	vOrdem1 := 'FANTASIA'
    else if RadioGroup1.ItemIndex = 1 then
      vOrdem1 := 'RAZAO'
    else
    	vOrdem1 := 'CPF';

    NegativarClienteCredVenc.abreNegativarClienteCredVenc(0, '', vOrdem1);
    if (CheckBox1.Checked) then
      CheckBox1Click(Sender);
    
    if RadioGroup2.ItemIndex = 0 then
    	vOrdem2 := 'FANTASIA'
    else if RadioGroup2.ItemIndex = 1 then
      vOrdem2 := 'RAZAO'
    else
    	vOrdem2 := 'CPF';

    DesnegativarClienteCredVenc.abreDesnegativarClienteCredVenc(0, '', vOrdem2);
    if (CheckBox2.Checked) then
      CheckBox2Click(Sender);
    
    if RadioGroup3.ItemIndex = 0 then
    	vOrdem3 := 'FANTASIA'
    else if RadioGroup3.ItemIndex = 1 then
      vOrdem3 := 'RAZAO'
    else
    	vOrdem3 := 'CPF';

    if RadioGroup33.ItemIndex = 0 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'ABERTO'
    else if RadioGroup33.ItemIndex = 1 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'QUITADO'
    else
    	DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'AMBOS';

    DesnegativarClienteSemCredVenc.abreDesnegativarClienteSemCredVenc(0, '', vOrdem3);
    if (CheckBox3.Checked) then
      CheckBox3Click(Sender);
  finally
    pnFiltrarBarradosVenc.Enabled := vPanel;
    spFiltrarBarradosVenc.Enabled := True;
    BitBtnNegativarCliente.Enabled := True;
    BitBtnAtualizarNegativarCliente.Enabled := True;
    DBGrid1.Visible := True;
  end;
end;

procedure TfrmNegativarDesnegativarCl.BitBtnAtualizarDesnegativarCliente2Click(
  Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;

  	DBGrid3.Visible := False;
    BitBtnDesnegativarCliente2.Enabled := False;
    BitBtnAtualizarDesnegativarCliente2.Enabled := False;

    if RadioGroup3.ItemIndex = 0 then
    	vOrdem3 := 'FANTASIA'
    else if RadioGroup3.ItemIndex = 1 then
      vOrdem3 := 'RAZAO'
    else
    	vOrdem3 := 'CPF';

    if RadioGroup33.ItemIndex = 0 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'ABERTO'
    else if RadioGroup33.ItemIndex = 1 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'QUITADO'
    else
    	DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'AMBOS';

    DesnegativarClienteSemCredVenc.abreDesnegativarClienteSemCredVenc(0, '', vOrdem3);
    if (CheckBox3.Checked) then
    	CheckBox3Click(Sender);
  finally
   	BitBtnDesnegativarCliente2.Enabled := True;
    BitBtnAtualizarDesnegativarCliente2.Enabled := True;
    DBGrid3.Visible := True;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.BitBtnAtualizarDesnegativarClienteClick(
  Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;

  	DBGrid2.Visible := False;
    BitBtnDesnegativarCliente.Enabled := False;
    BitBtnAtualizarDesnegativarCliente.Enabled := False;

    if RadioGroup2.ItemIndex = 0 then
    	vOrdem2 := 'FANTASIA'
    else if RadioGroup2.ItemIndex = 1 then
      vOrdem2 := 'RAZAO'
    else
    	vOrdem2 := 'CPF';

    DesnegativarClienteCredVenc.abreDesnegativarClienteCredVenc(0, '', vOrdem2);
    if (CheckBox2.Checked) then
      CheckBox2Click(Sender);
  finally
   	BitBtnDesnegativarCliente.Enabled := True;
    BitBtnAtualizarDesnegativarCliente.Enabled := True;
    DBGrid2.Visible := True;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.BitBtnAtualizarNegativarClienteClick(
  Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;

  	DBGrid1.Visible := False;
    BitBtnNegativarCliente.Enabled := False;
    BitBtnAtualizarNegativarCliente.Enabled := False;

    if RadioGroup1.ItemIndex = 0 then
    	vOrdem1 := 'FANTASIA'
    else if RadioGroup1.ItemIndex = 1 then
      vOrdem1 := 'RAZAO'
    else
    	vOrdem1 := 'CPF';

    NegativarClienteCredVenc.abreNegativarClienteCredVenc(0, '', vOrdem1);
    if (CheckBox1.Checked) then
      CheckBox1Click(Sender);
  finally
   	BitBtnNegativarCliente.Enabled := True;
    BitBtnAtualizarNegativarCliente.Enabled := True;
    DBGrid1.Visible := True;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.BitBtnDesnegativarCliente2Click(
  Sender: TObject);
var
	vPanel: Boolean;
begin
	try
  	DBGrid3.Visible := False;

    vPanel := pnFiltrarBarradosSemCredVenc.Enabled;

    pnFiltrarBarradosSemCredVenc.Enabled := False;
  	spFiltrarBarradosSemCredVenc.Enabled := False;
    BitBtnDesnegativarCliente2.Enabled := False;
    BitBtnAtualizarDesnegativarCliente2.Enabled := False;

    DesabilitarDtSetAfterScroll;

    if not DesnegativarClienteSemCredVenc._desnegativaCliente then
      Exit;

    HabilitarDtSetAfterScroll;

    if RadioGroup1.ItemIndex = 0 then
    	vOrdem1 := 'FANTASIA'
    else if RadioGroup1.ItemIndex = 1 then
      vOrdem1 := 'RAZAO'
    else
    	vOrdem1 := 'CPF';

    NegativarClienteCredVenc.abreNegativarClienteCredVenc(0, '', vOrdem1);
    if (CheckBox1.Checked) then
      CheckBox1Click(Sender);

    if RadioGroup2.ItemIndex = 0 then
    	vOrdem2 := 'FANTASIA'
    else if RadioGroup2.ItemIndex = 1 then
      vOrdem2 := 'RAZAO'
    else
    	vOrdem2 := 'CPF';

    DesnegativarClienteCredVenc.abreDesnegativarClienteCredVenc(0, '', vOrdem2);
    if (CheckBox2.Checked) then
      CheckBox2Click(Sender);
    
    if RadioGroup3.ItemIndex = 0 then
    	vOrdem3 := 'FANTASIA'
    else if RadioGroup3.ItemIndex = 1 then
      vOrdem3 := 'RAZAO'
    else
    	vOrdem3 := 'CPF';

    if RadioGroup33.ItemIndex = 0 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'ABERTO'
    else if RadioGroup33.ItemIndex = 1 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'QUITADO'
    else
    	DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'AMBOS';

    DesnegativarClienteSemCredVenc.abreDesnegativarClienteSemCredVenc(0, '', vOrdem3);
    if (CheckBox3.Checked) then
      CheckBox3Click(Sender);
  finally
  	pnFiltrarBarradosSemCredVenc.Enabled := vPanel;
    spFiltrarBarradosSemCredVenc.Enabled := True;
    BitBtnDesnegativarCliente2.Enabled := True;
    BitBtnAtualizarDesnegativarCliente2.Enabled := True;
    DBGrid3.Visible := True;
  end;
end;

procedure TfrmNegativarDesnegativarCl.BitBtnDesnegativarClienteClick(Sender: TObject);
var
	vPanel: Boolean;
begin
	try
  	DBGrid2.Visible := False;

    vPanel := pnFiltrarNaoBarradosVenc.Enabled;

    pnFiltrarNaoBarradosVenc.Enabled := False;
  	spFiltrarNaoBarradosVenc.Enabled := False;
    BitBtnDesnegativarCliente.Enabled := False;
    BitBtnAtualizarDesnegativarCliente.Enabled := False;

    DesabilitarDtSetAfterScroll;

    if not DesnegativarClienteCredVenc._desnegativaCliente then
      Exit;

    HabilitarDtSetAfterScroll;

    if RadioGroup1.ItemIndex = 0 then
    	vOrdem1 := 'FANTASIA'
    else if RadioGroup1.ItemIndex = 1 then
      vOrdem1 := 'RAZAO'
    else
    	vOrdem1 := 'CPF';

    NegativarClienteCredVenc.abreNegativarClienteCredVenc(0, '', vOrdem1);
    if (CheckBox1.Checked) then
      CheckBox1Click(Sender);
    
    if RadioGroup2.ItemIndex = 0 then
    	vOrdem2 := 'FANTASIA'
    else if RadioGroup2.ItemIndex = 1 then
      vOrdem2 := 'RAZAO'
    else
    	vOrdem2 := 'CPF';

    DesnegativarClienteCredVenc.abreDesnegativarClienteCredVenc(0, '', vOrdem2);
    if (CheckBox2.Checked) then
      CheckBox2Click(Sender);
    
    if RadioGroup3.ItemIndex = 0 then
    	vOrdem3 := 'FANTASIA'
    else if RadioGroup3.ItemIndex = 1 then
      vOrdem3 := 'RAZAO'
    else
    	vOrdem3 := 'CPF';

    if RadioGroup33.ItemIndex = 0 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'ABERTO'
    else if RadioGroup33.ItemIndex = 1 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'QUITADO'
    else
    	DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'AMBOS';

    DesnegativarClienteSemCredVenc.abreDesnegativarClienteSemCredVenc(0, '', vOrdem3);
    if (CheckBox3.Checked) then
    	CheckBox3Click(Sender);
  finally
  	pnFiltrarNaoBarradosVenc.Enabled := vPanel;
    spFiltrarNaoBarradosVenc.Enabled := False;
    BitBtnDesnegativarCliente.Enabled := True;
    BitBtnAtualizarDesnegativarCliente.Enabled := True;
    DBGrid2.Visible := True;
  end;
end;

procedure TfrmNegativarDesnegativarCl.BitBtnSairNegativarClienteClick(Sender: TObject);
begin
	Close;
end;

procedure TfrmNegativarDesnegativarCl.CheckBox1Click(Sender: TObject);
begin
  if not CheckBox1.Enabled then
    Exit;

  try
    if CheckBox1.Checked then
    begin
      NegativarClienteCredVenc.dataSet.AfterScroll := NegativarClienteCredVenc._CredNegativarClienteCredVencAfterScroll;

      if NegativarClienteCredVenc.dataSet.IsEmpty then
        NegativarClienteCredVenc.vCredNegativarClienteCredVenc.abreCredNegativarClienteCredVenc(-1, '')
      else
        NegativarClienteCredVenc.vCredNegativarClienteCredVenc.abreCredNegativarClienteCredVenc(
          NegativarClienteCredVenc.dataSet.FieldByName('COD_CLIENTE').AsInteger,
          NegativarClienteCredVenc.dataSet.FieldByName('CPFCGC').AsString);
    end
    else
      NegativarClienteCredVenc.dataSet.AfterScroll := nil;

    Panel11.Visible := CheckBox1.Checked;

    Splitter11.Top := DBGrid1.Height;
    Panel11.Top := DBGrid1.Height + Splitter11.Height;
  finally
  	_GravaConfiguracoesBoolean(CheckBox1.Name, CheckBox1.Checked);
  end;
end;

procedure TfrmNegativarDesnegativarCl.CheckBox2Click(Sender: TObject);
begin
  if not CheckBox2.Enabled then
    Exit;

  try
    if CheckBox2.Checked then
    begin
      DesnegativarClienteCredVenc.dataSet.AfterScroll := DesnegativarClienteCredVenc._CredDesnegativarClienteCredVencAfterScroll;

      if DesnegativarClienteCredVenc.dataSet.IsEmpty then
        DesnegativarClienteCredVenc.vCredDesnegativarClienteCredVenc.abreCredDesnegativarClienteCredVenc(-1, '')
      else
        DesnegativarClienteCredVenc.vCredDesnegativarClienteCredVenc.abreCredDesnegativarClienteCredVenc(
          DesnegativarClienteCredVenc.dataSet.FieldByName('COD_CLIENTE').AsInteger,
          DesnegativarClienteCredVenc.dataSet.FieldByName('CPFCGC').AsString);
    end
    else
      DesnegativarClienteCredVenc.dataSet.AfterScroll := nil;

    Panel22.Visible := CheckBox2.Checked;

    Splitter22.Top := DBGrid2.Height;
    Panel22.Top := DBGrid2.Height + Splitter22.Height;
  finally
  	_GravaConfiguracoesBoolean(CheckBox2.Name, CheckBox2.Checked);
  end;
end;

procedure TfrmNegativarDesnegativarCl.CheckBox3Click(Sender: TObject);
begin
	if not CheckBox3.Enabled then
    Exit;

  try
    if CheckBox3.Checked then
    begin
      DesnegativarClienteSemCredVenc.dataSet.AfterScroll := DesnegativarClienteSemCredVenc._CredDesnegativarClienteSemCredVencAfterScroll;

      if DesnegativarClienteSemCredVenc.dataSet.IsEmpty then
        DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.abreCredDesnegativarClienteSemCredVenc(-1, '')
      else
        DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.abreCredDesnegativarClienteSemCredVenc(
          DesnegativarClienteSemCredVenc.dataSet.FieldByName('COD_CLIENTE').AsInteger,
          DesnegativarClienteSemCredVenc.dataSet.FieldByName('CPFCGC').AsString);
    end
    else
      DesnegativarClienteSemCredVenc.dataSet.AfterScroll := nil;

    Panel33.Visible := CheckBox3.Checked;

    Splitter33.Top := DBGrid3.Height;
    Panel33.Top := DBGrid3.Height + Splitter33.Height;
  finally
  	_GravaConfiguracoesBoolean(CheckBox3.Name, CheckBox3.Checked);
  end;
end;

procedure TfrmNegativarDesnegativarCl.Configurarcolunas11Click(Sender: TObject);
begin
  inherited;
	vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas11,
    DBGrid11,
    GridCfg11,
  	cdsGrid11,
    usuario,
    ListGridsAndDataSets11,
    vDadosIni.transacaoCol);
end;

procedure TfrmNegativarDesnegativarCl.Configurarcolunas1Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas1,
    DBGrid1,
    GridCfg1,
  	cdsGrid1,
    usuario,
    ListGridsAndDataSets1,
    vDadosIni.transacaoCol);
end;

procedure TfrmNegativarDesnegativarCl.Configurarcolunas22Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas22,
    DBGrid22,
    GridCfg22,
  	cdsGrid22,
    usuario,
    ListGridsAndDataSets22,
    vDadosIni.transacaoCol);
end;

procedure TfrmNegativarDesnegativarCl.Configurarcolunas2Click(Sender: TObject);
begin
  vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas2,
    DBGrid2,
    GridCfg2,
  	cdsGrid2,
    usuario,
    ListGridsAndDataSets2,
    vDadosIni.transacaoCol);
end;

procedure TfrmNegativarDesnegativarCl.Configurarcolunas33Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas33,
    DBGrid33,
    GridCfg33,
  	cdsGrid33,
    usuario,
    ListGridsAndDataSets33,
    vDadosIni.transacaoCol);
end;

procedure TfrmNegativarDesnegativarCl.Configurarcolunas3Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas3,
    DBGrid3,
    GridCfg3,
  	cdsGrid3,
    usuario,
    ListGridsAndDataSets3,
    vDadosIni.transacaoCol);
end;

procedure TfrmNegativarDesnegativarCl.Copiarparareadetransferencia11Click(
  Sender: TObject);
begin
  Clipboard.AsText := DBGrid11.DataSource.DataSet.FieldByName(DBGrid11.Columns[DBGrid11.SelectedIndex].FieldName).AsString;
end;

procedure TfrmNegativarDesnegativarCl.Copiarparareadetransferencia1Click(
  Sender: TObject);
begin
  Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TfrmNegativarDesnegativarCl.Copiarparareadetransferencia22Click(
  Sender: TObject);
begin
  Clipboard.AsText := DBGrid22.DataSource.DataSet.FieldByName(DBGrid22.Columns[DBGrid22.SelectedIndex].FieldName).AsString;
end;

procedure TfrmNegativarDesnegativarCl.Copiarparareadetransferencia2Click(
  Sender: TObject);
begin
  Clipboard.AsText := DBGrid2.DataSource.DataSet.FieldByName(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName).AsString;
end;

procedure TfrmNegativarDesnegativarCl.Copiarparareadetransferencia33Click(
  Sender: TObject);
begin
	Clipboard.AsText := DBGrid33.DataSource.DataSet.FieldByName(DBGrid33.Columns[DBGrid33.SelectedIndex].FieldName).AsString;
end;

procedure TfrmNegativarDesnegativarCl.Copiarparareadetransferencia3Click(
  Sender: TObject);
begin
	Clipboard.AsText := DBGrid3.DataSource.DataSet.FieldByName(DBGrid3.Columns[DBGrid3.SelectedIndex].FieldName).AsString;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid11ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  inherited;
	vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid11,
    GridCfg11,
    cdsGrid11,
    cdsColunas11,
    usuario,
    ListGridsAndDataSets11,
    vDadosIni.transacaoCol);

  TemColunasComPosicaoAlteradas11 := True;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid11DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if (Column.FieldName = 'DATA_VENC_C')
  	and ((TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDtDia)
    and (Trim(TDBGrid(sender).DataSource.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO')
    and (TDBGrid(sender).DataSource.dataSet.FieldByName('COD_CRED').AsInteger > 0)
    and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_VENC_C').IsNull) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if (Column.FieldName = 'DATA_PREV_REC')
  	and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_PREV_REC').AsDateTime < vDtDia)
    and (Trim(TDBGrid(sender).DataSource.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO')
    and (TDBGrid(sender).DataSource.dataSet.FieldByName('COD_CRED').AsInteger > 0)
    and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_PREV_REC').IsNull) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmNegativarDesnegativarCl.DBGrid11TitleClick(Column: TColumn);
begin
  inherited;
	vDadosIni.DBGridOnTitleClick(DBGrid11, Column);
end;

procedure TfrmNegativarDesnegativarCl.DBGrid1CellClick(Column: TColumn);
begin
	if Column.FieldName = 'SEL' then
    NegativarClienteCredVenc._marcaDesmarcaLinha;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid1ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid1,
    GridCfg1,
    cdsGrid1,
    cdsColunas1,
    usuario,
    ListGridsAndDataSets1,
    vDadosIni.transacaoCol);

  TemColunasComPosicaoAlteradas1 := True;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	inherited;
  if (pnFiltrarBarradosVenc.Enabled)
  	and ((EdCodClienteGerBarradosVenc.AsValue > 0)
  			or (trim(EdCpfCnpjGerBarradosVenc.Text) <> '')
    		or (trim(EdNomeFantasiaGerBarradosVenc.Text) <> '')
    		or (trim(EdRazaoSocialGerBarradosVenc.Text) <> '')) then
  begin
    if gdSelected in State then
    begin
      TDBGrid(sender).canvas.brush.color := clBtnText;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if (trim(Column.Field.Dataset.FieldbyName('STATUS_F').AsString) = 'BARRADO')
    and (vDadosIni.vCliente.Barramento.vCodigoBarrado <> 0)
    and ((Column.FieldName = 'SEL')
    	or (Column.FieldName = 'COD_CLIENTE')
      or (Column.FieldName = 'CPFCGC')
      or (Column.FieldName = 'STATUS_F')) then
  begin
  	TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_SPACE then
  	NegativarClienteCredVenc._marcaDesmarcaLinha;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid1TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TfrmNegativarDesnegativarCl.DBGrid22ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  inherited;
	vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid22,
    GridCfg22,
    cdsGrid22,
    cdsColunas22,
    usuario,
    ListGridsAndDataSets22,
    vDadosIni.transacaoCol);

  TemColunasComPosicaoAlteradas22 := True;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid22DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if (Column.FieldName = 'DATA_VENC_C')
  	and ((TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDtDia)
    and (Trim(TDBGrid(sender).DataSource.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO')
    and (TDBGrid(sender).DataSource.dataSet.FieldByName('COD_CRED').AsInteger > 0)
    and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_VENC_C').IsNull) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if (Column.FieldName = 'DATA_PREV_REC')
  	and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_PREV_REC').AsDateTime < vDtDia)
    and (Trim(TDBGrid(sender).DataSource.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO')
    and (TDBGrid(sender).DataSource.dataSet.FieldByName('COD_CRED').AsInteger > 0)
    and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_PREV_REC').IsNull) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmNegativarDesnegativarCl.DBGrid22TitleClick(Column: TColumn);
begin
  inherited;
	vDadosIni.DBGridOnTitleClick(DBGrid22, Column);
end;

procedure TfrmNegativarDesnegativarCl.DBGrid2CellClick(Column: TColumn);
begin
	if Column.FieldName = 'SEL' then
    DesnegativarClienteCredVenc._marcaDesmarcaLinha;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid2ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid2,
    GridCfg2,
    cdsGrid2,
    cdsColunas2,
    usuario,
    ListGridsAndDataSets2,
    vDadosIni.transacaoCol);

  TemColunasComPosicaoAlteradas2 := True;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	inherited;
  if (pnFiltrarNaoBarradosVenc.Enabled)
  	and ((EdCodClienteGerNaoBarradosVenc.AsValue > 0)
  			or (trim(EdCpfCnpjGerNaoBarradosVenc.Text) <> '')
    		or (trim(EdNomeFantasiaGerNaoBarradosVenc.Text) <> '')
    		or (trim(EdRazaoSocialGerNaoBarradosVenc.Text) <> '')) then
  begin
    if gdSelected in State then
    begin
      TDBGrid(sender).canvas.brush.color := clBtnText;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if (trim(Column.Field.Dataset.FieldbyName('STATUS_F').AsString) = 'BARRADO')
    and (vDadosIni.vCliente.Barramento.vCodigoBarrado <> 0)
    and ((Column.FieldName = 'SEL')
    	or (Column.FieldName = 'COD_CLIENTE')
      or (Column.FieldName = 'CPFCGC')
      or (Column.FieldName = 'STATUS_F')) then
  begin
  	TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_SPACE then
  	DesnegativarClienteCredVenc._marcaDesmarcaLinha;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid2TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmNegativarDesnegativarCl.DBGrid33ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	inherited;
	vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid33,
    GridCfg33,
    cdsGrid33,
    cdsColunas33,
    usuario,
    ListGridsAndDataSets33,
    vDadosIni.transacaoCol);

  TemColunasComPosicaoAlteradas33 := True;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid33DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if (Column.FieldName = 'DATA_VENC_C')
  	and ((TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDtDia)
    and (Trim(TDBGrid(sender).DataSource.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO')
    and (TDBGrid(sender).DataSource.dataSet.FieldByName('COD_CRED').AsInteger > 0)
    and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_VENC_C').IsNull) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if (Column.FieldName = 'DATA_PREV_REC')
  	and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_PREV_REC').AsDateTime < vDtDia)
    and (Trim(TDBGrid(sender).DataSource.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO')
    and (TDBGrid(sender).DataSource.dataSet.FieldByName('COD_CRED').AsInteger > 0)
    and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_PREV_REC').IsNull) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmNegativarDesnegativarCl.DBGrid33TitleClick(Column: TColumn);
begin
	inherited;
	vDadosIni.DBGridOnTitleClick(DBGrid33, Column);
end;

procedure TfrmNegativarDesnegativarCl.DBGrid3CellClick(Column: TColumn);
begin
	if Column.FieldName = 'SEL' then
    DesnegativarClienteSemCredVenc._marcaDesmarcaLinha;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid3ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid3,
    GridCfg3,
    cdsGrid3,
    cdsColunas3,
    usuario,
    ListGridsAndDataSets3,
    vDadosIni.transacaoCol);

  TemColunasComPosicaoAlteradas3 := True;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	inherited;
  if (pnFiltrarBarradosSemCredVenc.Enabled)
  	and ((EdCodClienteGerBarradosSemCredVenc.AsValue > 0)
  			or (trim(EdCpfCnpjGerBarradosSemCredVenc.Text) <> '')
    		or (trim(EdNomeFantasiaGerBarradosSemCredVenc.Text) <> '')
    		or (trim(EdRazaoSocialGerBarradosSemCredVenc.Text) <> '')) then
  begin
    if gdSelected in State then
    begin
      TDBGrid(sender).canvas.brush.color := clBtnText;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if (trim(Column.Field.Dataset.FieldbyName('STATUS_F').AsString) = 'BARRADO')
    and (vDadosIni.vCliente.Barramento.vCodigoBarrado <> 0)
    and ((Column.FieldName = 'SEL')
    	or (Column.FieldName = 'COD_CLIENTE')
      or (Column.FieldName = 'CPFCGC')
      or (Column.FieldName = 'STATUS_F')) then
  begin
  	TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_SPACE then
  	DesnegativarClienteSemCredVenc._marcaDesmarcaLinha;
end;

procedure TfrmNegativarDesnegativarCl.DBGrid3TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid3, Column);
end;

procedure TfrmNegativarDesnegativarCl.Desmarcatodos2Click(
  Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

    DBGrid2.Visible := False;
    DesnegativarClienteCredVenc.storeRecNo;
    DesabilitarDtSetAfterScroll(false, true, false);

    DesnegativarClienteCredVenc._desmarcarTodos;
  finally
    HabilitarDtSetAfterScroll(false, true, false);
    DesnegativarClienteCredVenc.restoreRecNo;
    DBGrid2.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.Desmarcatodos3Click(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

    DBGrid3.Visible := False;
    DesnegativarClienteSemCredVenc.storeRecNo;
    DesabilitarDtSetAfterScroll(false, false, true);

    DesnegativarClienteSemCredVenc._desmarcarTodos;
  finally
  	HabilitarDtSetAfterScroll(false, false, true);
    DesnegativarClienteSemCredVenc.restoreRecNo;
    DBGrid3.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdCodClienteGerBarradosSemCredVencChange(
  Sender: TObject);
begin
	if (not DesnegativarClienteSemCredVenc.DataSet.IsEmpty) and (EdCodClienteGerBarradosSemCredVenc.AsInteger > 0) then
  begin
    DesnegativarClienteSemCredVenc.dataSet.IndexFieldNames := 'COD_CLIENTE';
    DesnegativarClienteSemCredVenc.dataSet.FindNearest([IntToStr(EdCodClienteGerBarradosSemCredVenc.AsInteger)]);
  end
  else if (not DesnegativarClienteSemCredVenc.dataSet.IsEmpty) then
  begin
    if RadioGroup1.ItemIndex = 0 then
    begin
      DesnegativarClienteSemCredVenc.dataSet.IndexFieldNames := 'NOME_CLIENTE';
    	DesnegativarClienteSemCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      DesnegativarClienteSemCredVenc.dataSet.IndexFieldNames := 'RAZAO';
    	DesnegativarClienteSemCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      DesnegativarClienteSemCredVenc.dataSet.IndexFieldNames := 'CPFCGC';
    	DesnegativarClienteSemCredVenc.dataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdCodClienteGerBarradosVencChange(
  Sender: TObject);
begin
	if (not NegativarClienteCredVenc.DataSet.IsEmpty) and (EdCodClienteGerBarradosVenc.AsInteger > 0) then
  begin
    NegativarClienteCredVenc.dataSet.IndexFieldNames := 'COD_CLIENTE';
    NegativarClienteCredVenc.dataSet.FindNearest([IntToStr(EdCodClienteGerBarradosVenc.AsInteger)]);
  end
  else if (not NegativarClienteCredVenc.dataSet.IsEmpty) then
  begin
    if RadioGroup1.ItemIndex = 0 then
    begin
      NegativarClienteCredVenc.dataSet.IndexFieldNames := 'NOME_CLIENTE';
    	NegativarClienteCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      NegativarClienteCredVenc.dataSet.IndexFieldNames := 'RAZAO';
    	NegativarClienteCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      NegativarClienteCredVenc.dataSet.IndexFieldNames := 'CPFCGC';
    	NegativarClienteCredVenc.dataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdCodClienteGerNaoBarradosVencChange(
  Sender: TObject);
begin
	if (not DesnegativarClienteCredVenc.DataSet.IsEmpty) and (EdCodClienteGerNaoBarradosVenc.AsInteger > 0) then
  begin
    DesnegativarClienteCredVenc.dataSet.IndexFieldNames := 'COD_CLIENTE';
    DesnegativarClienteCredVenc.dataSet.FindNearest([IntToStr(EdCodClienteGerNaoBarradosVenc.AsInteger)]);
  end
  else if (not DesnegativarClienteCredVenc.dataSet.IsEmpty) then
  begin
    if RadioGroup1.ItemIndex = 0 then
    begin
      DesnegativarClienteCredVenc.dataSet.IndexFieldNames := 'NOME_CLIENTE';
    	DesnegativarClienteCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      DesnegativarClienteCredVenc.dataSet.IndexFieldNames := 'RAZAO';
    	DesnegativarClienteCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      DesnegativarClienteCredVenc.dataSet.IndexFieldNames := 'CPFCGC';
    	DesnegativarClienteCredVenc.dataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdCpfCnpjGerBarradosSemCredVencChange(
  Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not DesnegativarClienteSemCredVenc.DataSet.IsEmpty) and (trim(EdCpfCnpjGerBarradosSemCredVenc.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := DesnegativarClienteSemCredVenc.dataSet.RecNo;

      DesnegativarClienteSemCredVenc.dataSet.DisableControls;
    	DesnegativarClienteSemCredVenc.dataSet.First;
      while not DesnegativarClienteSemCredVenc.dataSet.Eof do
      begin
      	if ContainsText(
        	DesnegativarClienteSemCredVenc.dataSet.FieldByName('CPFCGC').AsString,
          trim(EdCpfCnpjGerBarradosSemCredVenc.Text)) then
        begin
        	vRecNo  := DesnegativarClienteSemCredVenc.dataSet.RecNo;
          vEncReg := True;
          Break;
        end;

        DesnegativarClienteSemCredVenc.dataSet.Next;
      end;
    finally
      if not vEncReg then
        if not DesnegativarClienteSemCredVenc.dataSet.IsEmpty then
          DesnegativarClienteSemCredVenc.dataSet.RecNo := vRecNo;
      DesnegativarClienteSemCredVenc.dataSet.EnableControls;
    end;
  end
  else if (not DesnegativarClienteSemCredVenc.dataSet.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      DesnegativarClienteSemCredVenc.dataSet.IndexFieldNames := 'NOME_CLIENTE';
    	DesnegativarClienteSemCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      DesnegativarClienteSemCredVenc.dataSet.IndexFieldNames := 'RAZAO';
    	DesnegativarClienteSemCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      DesnegativarClienteSemCredVenc.dataSet.IndexFieldNames := 'CPFCGC';
    	DesnegativarClienteSemCredVenc.dataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdCpfCnpjGerBarradosVencChange(
  Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not NegativarClienteCredVenc.DataSet.IsEmpty) and (trim(EdCpfCnpjGerBarradosVenc.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := NegativarClienteCredVenc.dataSet.RecNo;

      NegativarClienteCredVenc.dataSet.DisableControls;
    	NegativarClienteCredVenc.dataSet.First;
      while not NegativarClienteCredVenc.dataSet.Eof do
      begin
      	if ContainsText(
        	NegativarClienteCredVenc.dataSet.FieldByName('CPFCGC').AsString,
          trim(EdCpfCnpjGerBarradosVenc.Text)) then
        begin
        	vRecNo  := NegativarClienteCredVenc.dataSet.RecNo;
          vEncReg := True;
          Break;
        end;

        NegativarClienteCredVenc.dataSet.Next;
      end;
    finally
      if not vEncReg then
        if not NegativarClienteCredVenc.dataSet.IsEmpty then
          NegativarClienteCredVenc.dataSet.RecNo := vRecNo;
      NegativarClienteCredVenc.dataSet.EnableControls;
    end;
  end
  else if (not NegativarClienteCredVenc.dataSet.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      NegativarClienteCredVenc.dataSet.IndexFieldNames := 'NOME_CLIENTE';
    	NegativarClienteCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      NegativarClienteCredVenc.dataSet.IndexFieldNames := 'RAZAO';
    	NegativarClienteCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      NegativarClienteCredVenc.dataSet.IndexFieldNames := 'CPFCGC';
    	NegativarClienteCredVenc.dataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdCpfCnpjGerNaoBarradosVencChange(
  Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not DesnegativarClienteCredVenc.DataSet.IsEmpty) and (trim(EdCpfCnpjGerNaoBarradosVenc.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := DesnegativarClienteCredVenc.dataSet.RecNo;

      DesnegativarClienteCredVenc.dataSet.DisableControls;
    	DesnegativarClienteCredVenc.dataSet.First;
      while not DesnegativarClienteCredVenc.dataSet.Eof do
      begin
      	if ContainsText(
        	DesnegativarClienteCredVenc.dataSet.FieldByName('CPFCGC').AsString,
          trim(EdCpfCnpjGerNaoBarradosVenc.Text)) then
        begin
        	vRecNo  := DesnegativarClienteCredVenc.dataSet.RecNo;
          vEncReg := True;
          Break;
        end;

        DesnegativarClienteCredVenc.dataSet.Next;
      end;
    finally
      if not vEncReg then
        if not DesnegativarClienteCredVenc.dataSet.IsEmpty then
          DesnegativarClienteCredVenc.dataSet.RecNo := vRecNo;
      DesnegativarClienteCredVenc.dataSet.EnableControls;
    end;
  end
  else if (not DesnegativarClienteCredVenc.dataSet.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      DesnegativarClienteCredVenc.dataSet.IndexFieldNames := 'NOME_CLIENTE';
    	DesnegativarClienteCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      DesnegativarClienteCredVenc.dataSet.IndexFieldNames := 'RAZAO';
    	DesnegativarClienteCredVenc.dataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      DesnegativarClienteCredVenc.dataSet.IndexFieldNames := 'CPFCGC';
    	DesnegativarClienteCredVenc.dataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdNomeFantasiaGerBarradosSemCredVencChange(
  Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not DesnegativarClienteSemCredVenc.DataSet.IsEmpty) and (trim(EdNomeFantasiaGerBarradosSemCredVenc.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := DesnegativarClienteCredVenc.DataSet.RecNo;

      DesnegativarClienteCredVenc.DataSet.DisableControls;
    	DesnegativarClienteCredVenc.DataSet.First;
      while not DesnegativarClienteCredVenc.DataSet.Eof do
      begin
      	if ContainsText(
        	DesnegativarClienteCredVenc.DataSet.FieldByName('NOME_CLIENTE').AsString,
          trim(EdNomeFantasiaGerBarradosSemCredVenc.Text)) then
        begin
        	vRecNo  := DesnegativarClienteCredVenc.DataSet.RecNo;
          vEncReg := True;
          Break;
        end;

        DesnegativarClienteCredVenc.DataSet.Next;
      end;
    finally
      if not vEncReg then
        if not DesnegativarClienteCredVenc.DataSet.IsEmpty then
          DesnegativarClienteCredVenc.DataSet.RecNo := vRecNo;
      DesnegativarClienteCredVenc.DataSet.EnableControls;
    end;
  end
  else if (not DesnegativarClienteCredVenc.DataSet.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      DesnegativarClienteCredVenc.DataSet.IndexFieldNames := 'NOME_CLIENTE';
    	DesnegativarClienteCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      DesnegativarClienteCredVenc.DataSet.IndexFieldNames := 'RAZAO';
    	DesnegativarClienteCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      DesnegativarClienteCredVenc.DataSet.IndexFieldNames := 'CPFCGC';
    	DesnegativarClienteCredVenc.DataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdNomeFantasiaGerBarradosVencChange(
  Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not NegativarClienteCredVenc.DataSet.IsEmpty) and (trim(EdNomeFantasiaGerBarradosVenc.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := NegativarClienteCredVenc.DataSet.RecNo;

      NegativarClienteCredVenc.DataSet.DisableControls;
    	NegativarClienteCredVenc.DataSet.First;
      while not NegativarClienteCredVenc.DataSet.Eof do
      begin
      	if ContainsText(
        	NegativarClienteCredVenc.DataSet.FieldByName('NOME_CLIENTE').AsString,
          trim(EdNomeFantasiaGerBarradosVenc.Text)) then
        begin
        	vRecNo  := NegativarClienteCredVenc.DataSet.RecNo;
          vEncReg := True;
          Break;
        end;

        NegativarClienteCredVenc.DataSet.Next;
      end;
    finally
      if not vEncReg then
        if not NegativarClienteCredVenc.DataSet.IsEmpty then
          NegativarClienteCredVenc.DataSet.RecNo := vRecNo;
      NegativarClienteCredVenc.DataSet.EnableControls;
    end;
  end
  else if (not NegativarClienteCredVenc.DataSet.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      NegativarClienteCredVenc.DataSet.IndexFieldNames := 'NOME_CLIENTE';
    	NegativarClienteCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      NegativarClienteCredVenc.DataSet.IndexFieldNames := 'RAZAO';
    	NegativarClienteCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      NegativarClienteCredVenc.DataSet.IndexFieldNames := 'CPFCGC';
    	NegativarClienteCredVenc.DataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdNomeFantasiaGerNaoBarradosVencChange(
  Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not DesnegativarClienteCredVenc.DataSet.IsEmpty) and (trim(EdNomeFantasiaGerNaoBarradosVenc.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := DesnegativarClienteCredVenc.DataSet.RecNo;

      DesnegativarClienteCredVenc.DataSet.DisableControls;
    	DesnegativarClienteCredVenc.DataSet.First;
      while not DesnegativarClienteCredVenc.DataSet.Eof do
      begin
      	if ContainsText(
        	DesnegativarClienteCredVenc.DataSet.FieldByName('NOME_CLIENTE').AsString,
          trim(EdNomeFantasiaGerNaoBarradosVenc.Text)) then
        begin
        	vRecNo  := DesnegativarClienteCredVenc.DataSet.RecNo;
          vEncReg := True;
          Break;
        end;

        DesnegativarClienteCredVenc.DataSet.Next;
      end;
    finally
      if not vEncReg then
        if not DesnegativarClienteCredVenc.DataSet.IsEmpty then
          DesnegativarClienteCredVenc.DataSet.RecNo := vRecNo;
      DesnegativarClienteCredVenc.DataSet.EnableControls;
    end;
  end
  else if (not DesnegativarClienteCredVenc.DataSet.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      DesnegativarClienteCredVenc.DataSet.IndexFieldNames := 'NOME_CLIENTE';
    	DesnegativarClienteCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      DesnegativarClienteCredVenc.DataSet.IndexFieldNames := 'RAZAO';
    	DesnegativarClienteCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      DesnegativarClienteCredVenc.DataSet.IndexFieldNames := 'CPFCGC';
    	DesnegativarClienteCredVenc.DataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdRazaoSocialGerBarradosVencChange(
  Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not NegativarClienteCredVenc.DataSet.IsEmpty) and (trim(EdRazaoSocialGerBarradosVenc.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := NegativarClienteCredVenc.DataSet.RecNo;

      NegativarClienteCredVenc.DataSet.DisableControls;
    	NegativarClienteCredVenc.DataSet.First;
      while not NegativarClienteCredVenc.DataSet.Eof do
      begin
      	if ContainsText(
        	NegativarClienteCredVenc.DataSet.FieldByName('RAZAO').AsString,
          trim(EdRazaoSocialGerBarradosVenc.Text)) then
        begin
        	vRecNo  := NegativarClienteCredVenc.DataSet.RecNo;
          vEncReg := True;
          Break;
        end;

        NegativarClienteCredVenc.DataSet.Next;
      end;
    finally
      if not vEncReg then
        if not NegativarClienteCredVenc.DataSet.IsEmpty then
          NegativarClienteCredVenc.DataSet.RecNo := vRecNo;
      NegativarClienteCredVenc.DataSet.EnableControls;
    end;
  end
  else if (not NegativarClienteCredVenc.DataSet.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      NegativarClienteCredVenc.DataSet.IndexFieldNames := 'NOME_CLIENTE';
    	NegativarClienteCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      NegativarClienteCredVenc.DataSet.IndexFieldNames := 'RAZAO';
    	NegativarClienteCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      NegativarClienteCredVenc.DataSet.IndexFieldNames := 'CPFCGC';
    	NegativarClienteCredVenc.DataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.EdRazaoSocialGerNaoBarradosVencChange(
  Sender: TObject);
var
	vRecNo: Integer;
  vEncReg: Boolean;
begin
  if (not DesnegativarClienteSemCredVenc.DataSet.IsEmpty) and (trim(EdRazaoSocialGerBarradosSemCredVenc.Text) <> '') then
  begin
  	try
    	vEncReg := False;
    	vRecNo := DesnegativarClienteSemCredVenc.DataSet.RecNo;

      DesnegativarClienteSemCredVenc.DataSet.DisableControls;
    	DesnegativarClienteSemCredVenc.DataSet.First;
      while not DesnegativarClienteSemCredVenc.DataSet.Eof do
      begin
      	if ContainsText(
        	DesnegativarClienteSemCredVenc.DataSet.FieldByName('RAZAO').AsString,
          trim(EdRazaoSocialGerBarradosSemCredVenc.Text)) then
        begin
        	vRecNo  := DesnegativarClienteSemCredVenc.DataSet.RecNo;
          vEncReg := True;
          Break;
        end;

        DesnegativarClienteSemCredVenc.DataSet.Next;
      end;
    finally
      if not vEncReg then
        if not DesnegativarClienteSemCredVenc.DataSet.IsEmpty then
          DesnegativarClienteSemCredVenc.DataSet.RecNo := vRecNo;
      DesnegativarClienteSemCredVenc.DataSet.EnableControls;
    end;
  end
  else if (not DesnegativarClienteSemCredVenc.DataSet.IsEmpty) then
  begin
  	if RadioGroup1.ItemIndex = 0 then
    begin
      DesnegativarClienteSemCredVenc.DataSet.IndexFieldNames := 'NOME_CLIENTE';
    	DesnegativarClienteSemCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 1 then
    begin
      DesnegativarClienteSemCredVenc.DataSet.IndexFieldNames := 'RAZAO';
    	DesnegativarClienteSemCredVenc.DataSet.FindNearest(['A']);
    end
    else if RadioGroup1.ItemIndex = 2 then
    begin
      DesnegativarClienteSemCredVenc.DataSet.IndexFieldNames := 'CPFCGC';
    	DesnegativarClienteSemCredVenc.DataSet.FindNearest([1])
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.DesabilitarDtSetAfterScroll(
	pNegativar: Boolean = True;
  pDesnegativar: Boolean = True;
  pDesnegativar2: Boolean = True);
begin
	if pNegativar then
  begin
    if (CheckBox1.Checked) then
      NegativarClienteCredVenc.dataSet.AfterScroll    := nil;
  end;

  if pDesnegativar then
  begin
    if (CheckBox2.Checked) then
      DesnegativarClienteCredVenc.dataSet.AfterScroll := nil;
  end;

  if pDesnegativar2 then
  begin
    if (CheckBox3.Checked) then
      DesnegativarClienteSemCredVenc.dataSet.AfterScroll := nil;
  end;
end;

procedure TfrmNegativarDesnegativarCl.Desmarcatodos1Click(
  Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

    DBGrid1.Visible := False;
    NegativarClienteCredVenc.storeRecNo;
    DesabilitarDtSetAfterScroll(true, false, false);

    NegativarClienteCredVenc._desmarcarTodos
  finally
  	HabilitarDtSetAfterScroll(true, false, false);
    NegativarClienteCredVenc.restoreRecNo;
    DBGrid1.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
	if not Assigned(DBGrid1.DataSource) then
    Exit;
  if not Assigned(DBGrid1.DataSource.DataSet) then
    Exit;


  if not Assigned(DBGrid11.DataSource) then
    Exit;
  if not Assigned(DBGrid11.DataSource.DataSet) then
    Exit;


  if not Assigned(DBGrid2.DataSource) then
    Exit;
  if not Assigned(DBGrid2.DataSource.DataSet) then
    Exit;


  if not Assigned(DBGrid22.DataSource) then
    Exit;
  if not Assigned(DBGrid22.DataSource.DataSet) then
    Exit;


  if not Assigned(DBGrid3.DataSource) then
    Exit;
  if not Assigned(DBGrid3.DataSource.DataSet) then
    Exit;


  if not Assigned(DBGrid33.DataSource) then
    Exit;
  if not Assigned(DBGrid33.DataSource.DataSet) then
    Exit;


  if not PrimeiraPesquisa1 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(
    	DBGrid1,
      GridCfg1,
      cdsGrid1,
      cdsColunas1,
      usuario,
      ListGridsAndDataSets1,
      vDadosIni.transacaoCol);


  if not PrimeiraPesquisa11 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(
    	DBGrid11,
      GridCfg11,
      cdsGrid11,
      cdsColunas11,
      usuario,
      ListGridsAndDataSets11,
      vDadosIni.transacaoCol);


  if not PrimeiraPesquisa2 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(
    	DBGrid2,
      GridCfg2,
      cdsGrid2,
      cdsColunas2,
      usuario,
      ListGridsAndDataSets2,
      vDadosIni.transacaoCol);

  if not PrimeiraPesquisa22 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(
    	DBGrid22,
      GridCfg22,
      cdsGrid22,
      cdsColunas22,
      usuario,
      ListGridsAndDataSets22,
      vDadosIni.transacaoCol);


  if not PrimeiraPesquisa3 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(
    	DBGrid3,
      GridCfg3,
      cdsGrid3,
      cdsColunas3,
      usuario,
      ListGridsAndDataSets3,
      vDadosIni.transacaoCol);


  if not PrimeiraPesquisa33 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(
    	DBGrid33,
      GridCfg33,
      cdsGrid33,
      cdsColunas33,
      usuario,
      ListGridsAndDataSets33,
      vDadosIni.transacaoCol);


  if TemColunasComPosicaoAlteradas1 then
  	vDadosIni.restoreDataSetDefaultCadPadrao(
    	DBGrid1,
      GridCfg1,
      true,
      ListPositions1,
      cdsGrid1);


  if TemColunasComPosicaoAlteradas11 then
  	vDadosIni.restoreDataSetDefaultCadPadrao(
    	DBGrid11,
      GridCfg11,
      true,
      ListPositions11,
      cdsGrid11);


  if TemColunasComPosicaoAlteradas2 then
  	vDadosIni.restoreDataSetDefaultCadPadrao(
    	DBGrid2,
      GridCfg2,
      true,
      ListPositions2,
      cdsGrid2);


  if TemColunasComPosicaoAlteradas22 then
  	vDadosIni.restoreDataSetDefaultCadPadrao(
    	DBGrid22,
      GridCfg22,
      true,
      ListPositions22,
      cdsGrid22);


  if TemColunasComPosicaoAlteradas3 then
  	vDadosIni.restoreDataSetDefaultCadPadrao(
    	DBGrid3,
      GridCfg3,
      true,
      ListPositions3,
      cdsGrid3);


  if TemColunasComPosicaoAlteradas33 then
  	vDadosIni.restoreDataSetDefaultCadPadrao(
    	DBGrid33,
      GridCfg33,
      true,
      ListPositions33,
      cdsGrid33);

  Action := caFree;
  frmNegativarDesnegativarCl := nil;
  NegativarClienteCredVenc.Free;
  DesnegativarClienteCredVenc.Free;
end;

procedure TfrmNegativarDesnegativarCl.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Self.fechar := True;
  inherited;
end;

procedure TfrmNegativarDesnegativarCl.FormCreate(Sender: TObject);
begin
	vCriou := 0;

  inherited;

	NegativarClienteCredVenc       := TNegativarClienteCredVenc.Create;
  DesnegativarClienteCredVenc    := TDesnegativarClienteCredVenc.Create;
  DesnegativarClienteSemCredVenc := TDesnegativarClienteSemCredVenc.Create;

  vDtDia := vDadosIni.getDataBanco(NegativarClienteCredVenc.buscas);

  TemColunasComPosicaoAlteradas1 := False;
  TemColunasComPosicaoAlteradas2 := False;
  TemColunasComPosicaoAlteradas3 := False;

  Panel11.Visible := False;
  Panel22.Visible := False;
  Panel33.Visible := False;

  Splitter11.Top := DBGrid1.Height;
  Panel11.Top := DBGrid1.Height + Splitter11.Height;

  Splitter22.Top := DBGrid2.Height;
  Panel22.Top := DBGrid2.Height + Splitter22.Height;

  Splitter33.Top := DBGrid3.Height;
  Panel33.Top := DBGrid3.Height + Splitter33.Height;

  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmNegativarDesnegativarCl.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_F2 then
  begin
    if PageControl1.ActivePage = TabSheet1 then
    	NegativarClienteCredVenc._marcaDesmarcaLinha
    else if PageControl1.ActivePage = TabSheet2 then
    	DesnegativarClienteCredVenc._marcaDesmarcaLinha
    else if PageControl1.ActivePage = TabSheet3 then
    	DesnegativarClienteSemCredVenc._marcaDesmarcaLinha;
  end;
end;

procedure TfrmNegativarDesnegativarCl.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TfrmNegativarDesnegativarCl.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  if vCriou = 0 then
  begin
  	DBGrid1.DataSource  := dtmContasAReceber.dsNegativarCliente;
	  DBGrid11.DataSource := dtmContasAReceber.dsCredNegativarCliente;
    DBGrid2.DataSource  := dtmContasAReceber.dsDesNegativarCliente;
    DBGrid22.DataSource := dtmContasAReceber.dsCredDesNegativarCliente;
    DBGrid3.DataSource  := dtmContasAReceber.dsDesNegativarCliente2;
    DBGrid33.DataSource := dtmContasAReceber.dsCredDesNegativarCliente2;

    vDadosIni.setTClientDataSetCadPadrao(
    	vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet1,
      GridCfg1,
      DBGrid1,
      cdsGrid1,
      cdsColunas1,
      trans,
      ListGridsAndDataSets1,
      ListPositions1,
      nomeDTSEt1,
      PrimeiraPesquisa1,
      vCamposPadraoRegistro1,
      usuario);


    vDadosIni.setTClientDataSetCadPadrao(
    	vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet11,
      GridCfg11,
      DBGrid11,
      cdsGrid11,
      cdsColunas11,
      trans,
      ListGridsAndDataSets11,
      ListPositions11,
      nomeDTSEt11,
      PrimeiraPesquisa11,
      vCamposPadraoRegistro11,
      usuario);


    vDadosIni.setTClientDataSetCadPadrao(
    	vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet2,
      GridCfg2,
      DBGrid2,
      cdsGrid2,
      cdsColunas2,
      trans,
      ListGridsAndDataSets2,
      ListPositions2,
      nomeDTSEt2,
      PrimeiraPesquisa2,
      vCamposPadraoRegistro2,
      usuario);


    vDadosIni.setTClientDataSetCadPadrao(
    	vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet2,
      GridCfg22,
      DBGrid22,
      cdsGrid22,
      cdsColunas22,
      trans,
      ListGridsAndDataSets22,
      ListPositions22,
      nomeDTSEt22,
      PrimeiraPesquisa22,
      vCamposPadraoRegistro22,
      usuario);


    vDadosIni.setTClientDataSetCadPadrao(
    	vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet3,
      GridCfg3,
      DBGrid3,
      cdsGrid3,
      cdsColunas3,
      trans,
      ListGridsAndDataSets3,
      ListPositions3,
      nomeDTSEt3,
      PrimeiraPesquisa3,
      vCamposPadraoRegistro3,
      usuario);


    vDadosIni.setTClientDataSetCadPadrao(
    	vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet33,
      GridCfg33,
      DBGrid33,
      cdsGrid33,
      cdsColunas33,
      trans,
      ListGridsAndDataSets33,
      ListPositions33,
      nomeDTSEt33,
      PrimeiraPesquisa33,
      vCamposPadraoRegistro33,
      usuario);

  end;

  inherited;

  Label18.Visible 									         := not vDadosIni.vEmp.vFinanceiroUnificado;
  EdCodClienteGerBarradosVenc.Visible        := not vDadosIni.vEmp.vFinanceiroUnificado;
  Label1.Visible 												     := not vDadosIni.vEmp.vFinanceiroUnificado;
  EdCodClienteGerNaoBarradosVenc.Visible     := not vDadosIni.vEmp.vFinanceiroUnificado;
  Label5.Visible 										         := not vDadosIni.vEmp.vFinanceiroUnificado;
  EdCodClienteGerBarradosSemCredVenc.Visible := not vDadosIni.vEmp.vFinanceiroUnificado;

  try
    CheckBox1.Enabled    := False;
    RadioGroup1.Enabled  := False;

    CheckBox1.Checked      := _LerConfiguracoesRegistroBoolean(CheckBox1.Name);
    RadioGroup1.ItemIndex  := _LerConfiguracoesRegistroInteger(RadioGroup1.Name);

    if RadioGroup1.ItemIndex = 0 then
      vOrdem1 := 'FANTASIA'
    else if RadioGroup1.ItemIndex = 1 then
      vOrdem1 := 'RAZAO'
    else
      vOrdem1 := 'CPF';

    NegativarClienteCredVenc.abreNegativarClienteCredVenc(0, '', vOrdem1);
    if (CheckBox1.Checked) then
    begin
      CheckBox1.Enabled := True;
      CheckBox1Click(Sender);
    end
    else
    	NegativarClienteCredVenc.vCredNegativarClienteCredVenc.abreCredNegativarClienteCredVenc(-1, '0');
  finally
    CheckBox1.Enabled    := True;
    RadioGroup1.Enabled  := True;
  end;


  try
  	CheckBox2.Enabled    := False;
    RadioGroup2.Enabled  := False;

    CheckBox2.Checked      := _LerConfiguracoesRegistroBoolean(CheckBox2.Name);
    RadioGroup2.ItemIndex  := _LerConfiguracoesRegistroInteger(RadioGroup2.Name);

    if RadioGroup2.ItemIndex = 0 then
      vOrdem2 := 'FANTASIA'
    else if RadioGroup2.ItemIndex = 1 then
      vOrdem2 := 'RAZAO'
    else
      vOrdem2 := 'CPF';

    DesnegativarClienteCredVenc.abreDesnegativarClienteCredVenc(0, '', vOrdem2);
    if (CheckBox2.Checked) then
    begin
      CheckBox2.Enabled := True;
      CheckBox2Click(Sender);
    end
    else
    	DesnegativarClienteCredVenc.vCredDesnegativarClienteCredVenc.abreCredDesnegativarClienteCredVenc(-1, '0');
  finally
    CheckBox2.Enabled    := True;
    RadioGroup2.Enabled  := True;
  end;


  try
  	CheckBox3.Enabled    := False;
    RadioGroup3.Enabled  := False;
    RadioGroup33.Enabled := False;

    CheckBox3.Checked      := _LerConfiguracoesRegistroBoolean(CheckBox3.Name);
    RadioGroup3.ItemIndex  := _LerConfiguracoesRegistroInteger(RadioGroup3.Name);
    RadioGroup33.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup33.Name);

    if RadioGroup3.ItemIndex = 0 then
      vOrdem3 := 'FANTASIA'
    else if RadioGroup3.ItemIndex = 1 then
      vOrdem3 := 'RAZAO'
    else
      vOrdem3 := 'CPF';

    if RadioGroup33.ItemIndex = 0 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'ABERTO'
    else if RadioGroup33.ItemIndex = 1 then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'QUITADO'
    else
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.vStatus := 'AMBOS';

    DesnegativarClienteSemCredVenc.abreDesNegativarClienteSemCredVenc(0, '', vOrdem3);
    if (CheckBox3.Checked) then
    begin
      CheckBox3.Enabled := True;
      CheckBox3Click(Sender);
    end
    else
    	DesNegativarClienteSemCredVenc.vCredDesNegativarClienteSemCredVenc.abreCredDesnegativarClienteSemCredVenc(-1, '0');
  finally
  	CheckBox3.Enabled    := True;
    RadioGroup3.Enabled  := True;
    RadioGroup33.Enabled := True;
  end;

  if vCriou = 0 then
  begin
  	if PrimeiraPesquisa1 then
    begin
      PrimeiraPesquisa1 := False;
      vDadosIni.configurarGridPeloConfigColunas(
        DBGrid1,
        GridCfg1,
        cdsGrid1,
        cdsColunas1,
        usuario,
        ListGridsAndDataSets1,
        vDadosIni.transacaoCol);
    end;


    if PrimeiraPesquisa11 then
    begin
      PrimeiraPesquisa11 := False;
      vDadosIni.configurarGridPeloConfigColunas(
        DBGrid11,
        GridCfg11,
        cdsGrid11,
        cdsColunas11,
        usuario,
        ListGridsAndDataSets11,
        vDadosIni.transacaoCol);
    end;


    if PrimeiraPesquisa2 then
    begin
      PrimeiraPesquisa2 := False;
      vDadosIni.configurarGridPeloConfigColunas(
        DBGrid2,
        GridCfg2,
        cdsGrid2,
        cdsColunas2,
        usuario,
        ListGridsAndDataSets2,
        vDadosIni.transacaoCol);
    end;


    if PrimeiraPesquisa22 then
    begin
      PrimeiraPesquisa22 := False;
      vDadosIni.configurarGridPeloConfigColunas(
        DBGrid22,
        GridCfg22,
        cdsGrid22,
        cdsColunas22,
        usuario,
        ListGridsAndDataSets22,
        vDadosIni.transacaoCol);
    end;


    if PrimeiraPesquisa3 then
    begin
      PrimeiraPesquisa3 := False;
      vDadosIni.configurarGridPeloConfigColunas(
        DBGrid3,
        GridCfg3,
        cdsGrid3,
        cdsColunas3,
        usuario,
        ListGridsAndDataSets3,
        vDadosIni.transacaoCol);
    end;


    if PrimeiraPesquisa33 then
    begin
      PrimeiraPesquisa33 := False;
      vDadosIni.configurarGridPeloConfigColunas(
        DBGrid33,
        GridCfg33,
        cdsGrid33,
        cdsColunas33,
        usuario,
        ListGridsAndDataSets33,
        vDadosIni.transacaoCol);
    end;
  end;

  if vCriou = 0 then
    vCriou := 1;

  if (Self.Tag = 99) and (NegativarClienteCredVenc.dataSet.IsEmpty) then
  begin
    frmNegativarDesnegativarCl.fechar := True;
    PostMessage(frmNegativarDesnegativarCl.Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmNegativarDesnegativarCl.HabilitarDtSetAfterScroll(
	pNegativar: Boolean = True;
  pDesnegativar: Boolean = True;
  pDesnegativar2: Boolean = True);
begin
	if pNegativar then
  begin
    if (CheckBox1.Checked) and (NegativarClienteCredVenc.dataSet.IsEmpty) then
      NegativarClienteCredVenc.vCredNegativarClienteCredVenc.abreCredNegativarClienteCredVenc(-1, '')
    else if (CheckBox1.Checked) then
    begin
      NegativarClienteCredVenc.dataSet.AfterScroll := NegativarClienteCredVenc._CredNegativarClienteCredVencAfterScroll;
      NegativarClienteCredVenc.vCredNegativarClienteCredVenc.abreCredNegativarClienteCredVenc(
        NegativarClienteCredVenc.dataSet.FieldByName('COD_CLIENTE').AsInteger,
        NegativarClienteCredVenc.dataSet.FieldByName('CPFCGC').AsString);
    end;
  end;

  if pDesnegativar then
  begin
    if (CheckBox2.Checked) and (DesnegativarClienteCredVenc.dataSet.IsEmpty) then
      DesnegativarClienteCredVenc.vCredDesnegativarClienteCredVenc.abreCredDesnegativarClienteCredVenc(-1, '')
    else if (CheckBox2.Checked) then
    begin
      DesnegativarClienteCredVenc.dataSet.AfterScroll := DesnegativarClienteCredVenc._CredDesnegativarClienteCredVencAfterScroll;
      DesnegativarClienteCredVenc.vCredDesnegativarClienteCredVenc.abreCredDesnegativarClienteCredVenc(
        DesnegativarClienteCredVenc.dataSet.FieldByName('COD_CLIENTE').AsInteger,
        DesnegativarClienteCredVenc.dataSet.FieldByName('CPFCGC').AsString);
    end;
  end;

  if pDesnegativar2 then
  begin
    if (CheckBox3.Checked) and (DesnegativarClienteSemCredVenc.dataSet.IsEmpty) then
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.abreCredDesnegativarClienteSemCredVenc(-1, '')
    else if (CheckBox3.Checked) then
    begin
      DesnegativarClienteSemCredVenc.dataSet.AfterScroll := DesnegativarClienteSemCredVenc._CredDesnegativarClienteSemCredVencAfterScroll;
      DesnegativarClienteSemCredVenc.vCredDesnegativarClienteSemCredVenc.abreCredDesnegativarClienteSemCredVenc(
        DesnegativarClienteSemCredVenc.dataSet.FieldByName('COD_CLIENTE').AsInteger,
        DesnegativarClienteSemCredVenc.dataSet.FieldByName('CPFCGC').AsString);
    end;
  end;
end;

procedure TfrmNegativarDesnegativarCl.RadioGroup1Click(Sender: TObject);
begin
  if not RadioGroup1.Enabled then
  	Exit;

	try
  	BitBtnAtualizarNegativarClienteClick(Sender);
	finally
  	_GravaConfiguracoesInteger(RadioGroup1.Name, RadioGroup1.ItemIndex);
  end;
end;

procedure TfrmNegativarDesnegativarCl.RadioGroup2Click(Sender: TObject);
begin
  if not RadioGroup2.Enabled then
  	Exit;

  try
		BitBtnAtualizarDesnegativarClienteClick(Sender);
  finally
    _GravaConfiguracoesInteger(RadioGroup2.Name, RadioGroup2.ItemIndex);
  end;
end;

procedure TfrmNegativarDesnegativarCl.RadioGroup33Click(Sender: TObject);
begin
	if not RadioGroup33.Enabled then
    Exit;

  try
  	DesnegativarClienteSemCredVenc.storeRecNo;
		BitBtnAtualizarDesnegativarCliente2Click(Sender);
  finally
  	DesnegativarClienteSemCredVenc.restoreRecNo;
    _GravaConfiguracoesInteger(RadioGroup33.Name, RadioGroup33.ItemIndex);
  end;
end;

procedure TfrmNegativarDesnegativarCl.RadioGroup3Click(Sender: TObject);
begin
	if not RadioGroup3.Enabled then
  	Exit;

	try
  	BitBtnAtualizarDesnegativarCliente2Click(Sender);
  finally
    _GravaConfiguracoesInteger(RadioGroup3.Name, RadioGroup3.ItemIndex);
  end;
end;

procedure TfrmNegativarDesnegativarCl.ReajustarLarguradascolunas11Click(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid11);
end;

procedure TfrmNegativarDesnegativarCl.ReajustarLarguradascolunas1Click(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid1);
end;

procedure TfrmNegativarDesnegativarCl.ReajustarLarguradascolunas22Click(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid22);
end;

procedure TfrmNegativarDesnegativarCl.ReajustarLarguradascolunas2Click(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid2);
end;

procedure TfrmNegativarDesnegativarCl.ReajustarLarguradascolunas33Click(
  Sender: TObject);
begin
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid33);
end;

procedure TfrmNegativarDesnegativarCl.ReajustarLarguradascolunas3Click(
  Sender: TObject);
begin
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid3);
end;

procedure TfrmNegativarDesnegativarCl.ResetarConfiguraesdecolunas11Click(
  Sender: TObject);
begin
  inherited;
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(
  	DBGrid11,
    GridCfg11,
    cdsColunas11,
    cdsGrid11,
    usuario,
    vDadosIni.transacaoCol,
    fReset11,
    ListGridsAndDataSets11,
    false,
    ListPositions11);
end;

procedure TfrmNegativarDesnegativarCl.ResetarConfiguraesdecolunas1Click(
  Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(
  	DBGrid1,
    GridCfg1,
    cdsColunas1,
    cdsGrid1,
    usuario,
    vDadosIni.transacaoCol,
    fReset1,
    ListGridsAndDataSets1,
    false,
    ListPositions1);
end;

procedure TfrmNegativarDesnegativarCl.ResetarConfiguraesdecolunas22Click(
  Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(
  	DBGrid22,
    GridCfg22,
    cdsColunas22,
    cdsGrid22,
    usuario,
    vDadosIni.transacaoCol,
    fReset22,
    ListGridsAndDataSets22,
    false,
    ListPositions22);
end;

procedure TfrmNegativarDesnegativarCl.ResetarConfiguraesdecolunas2Click(
  Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(
  	DBGrid2,
    GridCfg2,
    cdsColunas2,
    cdsGrid2,
    usuario,
    vDadosIni.transacaoCol,
    fReset2,
    ListGridsAndDataSets2,
    false,
    ListPositions2);
end;

procedure TfrmNegativarDesnegativarCl.ResetarConfiguraesdecolunas33Click(
  Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(
  	DBGrid33,
    GridCfg33,
    cdsColunas33,
    cdsGrid33,
    usuario,
    vDadosIni.transacaoCol,
    fReset33,
    ListGridsAndDataSets33,
    false,
    ListPositions33);
end;

procedure TfrmNegativarDesnegativarCl.ResetarConfiguraesdecolunas3Click(
  Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(
  	DBGrid3,
    GridCfg3,
    cdsColunas3,
    cdsGrid3,
    usuario,
    vDadosIni.transacaoCol,
    fReset3,
    ListGridsAndDataSets3,
    false,
    ListPositions3);
end;

procedure TfrmNegativarDesnegativarCl.Selecionartodos2Click(
  Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

    DBGrid2.Visible := False;
    DesnegativarClienteCredVenc.storeRecNo;
    DesabilitarDtSetAfterScroll(false, true, false);

    DesnegativarClienteCredVenc._marcarTodos;
  finally
  	HabilitarDtSetAfterScroll(false, true, false);
    DesnegativarClienteCredVenc.restoreRecNo;
    DBGrid2.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.Selecionartodos3Click(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

    DBGrid3.Visible := False;
    DesnegativarClienteSemCredVenc.storeRecNo;
    DesabilitarDtSetAfterScroll(false, false, true);

    DesnegativarClienteSemCredVenc._marcarTodos;
  finally
  	HabilitarDtSetAfterScroll(false, false, true);
    DesnegativarClienteSemCredVenc.restoreRecNo;
    DBGrid3.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.Somarvaloresdacoluna11Click(
  Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;

    vDadosIni.SomarvaloresdacolunaCadPadraoClick(
      DBGrid11,
      lbStatusProcessamento,
      lbTextoProcessamento,
      pnStatusProcessamento);

  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.Somarvaloresdacoluna1Click(
  Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;

    DesabilitarDtSetAfterScroll(true, false, false);

    vDadosIni.SomarvaloresdacolunaCadPadraoClick(
      DBGrid1,
      lbStatusProcessamento,
      lbTextoProcessamento,
      pnStatusProcessamento);

    HabilitarDtSetAfterScroll(true, false, false);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.Somarvaloresdacoluna22Click(
  Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;

    vDadosIni.SomarvaloresdacolunaCadPadraoClick(
      DBGrid22,
      lbStatusProcessamento,
      lbTextoProcessamento,
      pnStatusProcessamento);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.Somarvaloresdacoluna2Click(
  Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;

    DesabilitarDtSetAfterScroll(false, true, false);

    vDadosIni.SomarvaloresdacolunaCadPadraoClick(
      DBGrid2,
      lbStatusProcessamento,
      lbTextoProcessamento,
      pnStatusProcessamento);

    HabilitarDtSetAfterScroll(false, true, false);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.Somarvaloresdacoluna33Click(
  Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;

    vDadosIni.SomarvaloresdacolunaCadPadraoClick(
      DBGrid33,
      lbStatusProcessamento,
      lbTextoProcessamento,
      pnStatusProcessamento);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.Somarvaloresdacoluna3Click(
  Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;

    DesabilitarDtSetAfterScroll(false, false, true);

    vDadosIni.SomarvaloresdacolunaCadPadraoClick(
      DBGrid3,
      lbStatusProcessamento,
      lbTextoProcessamento,
      pnStatusProcessamento);

    HabilitarDtSetAfterScroll(false, false, true);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmNegativarDesnegativarCl.SpeedButtonDesnegativarClienteConfClick(
  Sender: TObject);
begin
	vDadosIni.configurarSistema('cl_faturamento_conf', DesnegativarClienteCredVenc.buscas);
end;

procedure TfrmNegativarDesnegativarCl.SpeedButtonNegativarClienteConfClick(
  Sender: TObject);
begin
	vDadosIni.configurarSistema('cl_faturamento_conf', NegativarClienteCredVenc.buscas);
end;

procedure TfrmNegativarDesnegativarCl.spFiltrarBarradosSemCredVencClick(
  Sender: TObject);
begin
	if pnFiltrarBarradosSemCredVenc.Enabled then
  begin
  	pnFiltrarBarradosSemCredVenc.Enabled := False;

    EdCodClienteGerBarradosSemCredVenc.Color := cl3DLight;
    EdCpfCnpjGerBarradosSemCredVenc.Color := cl3DLight;
    EdNomeFantasiaGerBarradosSemCredVenc.Color := cl3DLight;
    EdRazaoSocialGerBarradosSemCredVenc.Color := cl3DLight;
  end
	else
  begin
  	pnFiltrarBarradosSemCredVenc.Enabled := True;
    
    EdCodClienteGerBarradosSemCredVenc.Color := clWindow;
    EdCpfCnpjGerBarradosSemCredVenc.Color := clWindow;
    EdNomeFantasiaGerBarradosSemCredVenc.Color := clWindow;
    EdRazaoSocialGerBarradosSemCredVenc.Color := clWindow;
    
    if (Self.Enabled) and (Self.Visible) and (EdCodClienteGerBarradosSemCredVenc.CanFocus) then
      EdCodClienteGerBarradosSemCredVenc.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EdCpfCnpjGerBarradosSemCredVenc.CanFocus) then
      EdCpfCnpjGerBarradosSemCredVenc.SetFocus
  end;
end;

procedure TfrmNegativarDesnegativarCl.spFiltrarBarradosVencClick(
  Sender: TObject);
begin
	if pnFiltrarBarradosVenc.Enabled then
  begin
  	pnFiltrarBarradosVenc.Enabled := False;

    EdCodClienteGerBarradosVenc.Color := cl3DLight;
    EdCpfCnpjGerBarradosVenc.Color := cl3DLight;
    EdNomeFantasiaGerBarradosVenc.Color := cl3DLight;
    EdRazaoSocialGerBarradosVenc.Color := cl3DLight;
  end
	else
  begin
  	pnFiltrarBarradosVenc.Enabled := True;

    EdCodClienteGerBarradosVenc.Color := clWindow;
    EdCpfCnpjGerBarradosVenc.Color := clWindow;
    EdNomeFantasiaGerBarradosVenc.Color := clWindow;
    EdRazaoSocialGerBarradosVenc.Color := clWindow;

    if (Self.Enabled) and (Self.Visible) and (EdCodClienteGerBarradosVenc.CanFocus) then
      EdCodClienteGerBarradosVenc.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EdCpfCnpjGerBarradosVenc.CanFocus) then
      EdCpfCnpjGerBarradosVenc.SetFocus
  end;
end;

procedure TfrmNegativarDesnegativarCl.spFiltrarNaoBarradosVencClick(
  Sender: TObject);
begin
	if pnFiltrarNaoBarradosVenc.Enabled then
  begin
  	pnFiltrarNaoBarradosVenc.Enabled := False;

    EdCodClienteGerNaoBarradosVenc.Color := cl3DLight;
    EdCpfCnpjGerNaoBarradosVenc.Color := cl3DLight;
    EdNomeFantasiaGerNaoBarradosVenc.Color := cl3DLight;
    EdRazaoSocialGerNaoBarradosVenc.Color := cl3DLight;
  end
	else
  begin
  	pnFiltrarNaoBarradosVenc.Enabled := True;

    EdCodClienteGerNaoBarradosVenc.Color := clWindow;
    EdCpfCnpjGerNaoBarradosVenc.Color := clWindow;
    EdNomeFantasiaGerNaoBarradosVenc.Color := clWindow;
    EdRazaoSocialGerNaoBarradosVenc.Color := clWindow;

    if (Self.Enabled) and (Self.Visible) and (EdCodClienteGerNaoBarradosVenc.CanFocus) then
      EdCodClienteGerNaoBarradosVenc.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EdCpfCnpjGerNaoBarradosVenc.CanFocus) then
      EdCpfCnpjGerNaoBarradosVenc.SetFocus
  end;
end;

procedure TfrmNegativarDesnegativarCl.SalvardadosnoExcel11Click(
  Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(
  	Sender,
    DBGrid11,
    usuario,
  	vDadosIni.transacaoCol,
    lbStatusProcessamento,
    lbTextoProcessamento,
    pnStatusProcessamento,
    Self.Caption);
end;

procedure TfrmNegativarDesnegativarCl.SalvardadosnoExcel1Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(
  	Sender,
    DBGrid1,
    usuario,
  	vDadosIni.transacaoCol,
    lbStatusProcessamento,
    lbTextoProcessamento,
    pnStatusProcessamento,
    TabSheet1.Caption);
end;

procedure TfrmNegativarDesnegativarCl.SalvardadosnoExcel22Click(
  Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(
  	Sender,
    DBGrid22,
    usuario,
  	vDadosIni.transacaoCol,
    lbStatusProcessamento,
    lbTextoProcessamento,
    pnStatusProcessamento,
    Self.Caption);
end;

procedure TfrmNegativarDesnegativarCl.SalvardadosnoExcel2Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(
  	Sender,
    DBGrid2,
    usuario,
  	vDadosIni.transacaoCol,
    lbStatusProcessamento,
    lbTextoProcessamento,
    pnStatusProcessamento,
    TabSheet2.Caption);
end;

procedure TfrmNegativarDesnegativarCl.SalvardadosnoExcel33Click(
  Sender: TObject);
begin
	vDadosIni.SalvardadosnoExcelCadPadraoClick(
  	Sender,
    DBGrid33,
    usuario,
  	vDadosIni.transacaoCol,
    lbStatusProcessamento,
    lbTextoProcessamento,
    pnStatusProcessamento,
    Self.Caption);
end;

procedure TfrmNegativarDesnegativarCl.SalvardadosnoExcel3Click(Sender: TObject);
begin
	vDadosIni.SalvardadosnoExcelCadPadraoClick(
  	Sender,
    DBGrid3,
    usuario,
  	vDadosIni.transacaoCol,
    lbStatusProcessamento,
    lbTextoProcessamento,
    pnStatusProcessamento,
    TabSheet3.Caption);
end;

procedure TfrmNegativarDesnegativarCl.ScrollBox11Enter(Sender: TObject);
begin
  inherited;
	vConfigColuna11 := true;
end;

procedure TfrmNegativarDesnegativarCl.ScrollBox1Enter(Sender: TObject);
begin
  vConfigColuna1 := true;
end;

procedure TfrmNegativarDesnegativarCl.ScrollBox22Enter(Sender: TObject);
begin
  inherited;
	vConfigColuna22 := true;
end;

procedure TfrmNegativarDesnegativarCl.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna2 := true;
end;

procedure TfrmNegativarDesnegativarCl.Selecionartodos1Click(
  Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;

    DBGrid1.Visible := false;
    NegativarClienteCredVenc.storeRecNo;
    DesabilitarDtSetAfterScroll(true, false, false);

    NegativarClienteCredVenc._marcarTodos;
  finally
  	HabilitarDtSetAfterScroll(true, false, false);
    NegativarClienteCredVenc.restoreRecNo;
    DBGrid1.Visible := true;
    Screen.Cursor := crDefault;
  end;
end;

end.
