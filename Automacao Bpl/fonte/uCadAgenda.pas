unit uCadAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, DBCtrls,
  uEditHw, Buttons, DB, Calendar, Menus, uCadPadraoModal, AppEvnts, QRCtrls,
  QuickRpt;

type
  TfrmCadAgenda = class(TfrmCadPadraoM)
    tsAgenda: TTabSheet;
    tsCadastro: TTabSheet;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    DBMemo1: TDBMemo;
    DBComboBox1: TDBComboBox;
    DBEdit5: TDBEdit;
    Panel27: TPanel;
    BitBtn16: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn17: TBitBtn;
    DBLookupComboBox2: TDBLookupComboBox;
    DBGrid3: TDBGrid;
    DBEdit1: TDBEdit;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    MonthCalendar1: TMonthCalendar;
    BitBtn8: TBitBtn;
    tsRelAgenda: TTabSheet;
    qrpAgenda: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    lbEmpresa: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel6: TQRLabel;
    PageControl4: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label74: TLabel;
    DBEdit41: TDBEdit;
    Label75: TLabel;
    Memo2: TMemo;
    Label73: TLabel;
    DBEdit40: TDBEdit;
    BitBtn21: TBitBtn;
    DBEdit32: TDBEdit;
    Label64: TLabel;
    Label65: TLabel;
    DBEdit38: TDBEdit;
    Label67: TLabel;
    DBEdit39: TDBEdit;
    Memo1: TMemo;
    BitBtn9: TBitBtn;
    Label22: TLabel;
    QRLabel7: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Panel11: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Panel9: TPanel;
    GroupBox5: TGroupBox;
    pnDia: TPanel;
    pnSemana: TPanel;
    BitBtn7: TBitBtn;
    GroupBox6: TGroupBox;
    pnManha: TPanel;
    pnTarde: TPanel;
    BitBtn10: TBitBtn;
    PageControl2: TPageControl;
    tsDia: TTabSheet;
    Panel12: TPanel;
    Panel14: TPanel;
    Panel18: TPanel;
    StringGrid2: TStringGrid;
    Panel10: TPanel;
    DBGrid2: TDBGrid;
    Panel13: TPanel;
    DBGrid4: TDBGrid;
    Panel15: TPanel;
    tsSemana: TTabSheet;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel19: TPanel;
    StringGrid4: TStringGrid;
    Panel20: TPanel;
    DBGrid5: TDBGrid;
    Panel26: TPanel;
    DBGrid6: TDBGrid;
    Panel28: TPanel;
    Panel8: TPanel;
    Panel6: TPanel;
    Panel29: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    SpeedButton14: TSpeedButton;
    Label29: TLabel;
    DBEdit4: TDBEdit;
    Splitter5: TSplitter;
    Splitter4: TSplitter;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    Label30: TLabel;
    DBEdit10: TDBEdit;
    Splitter3: TSplitter;
    Splitter6: TSplitter;
    procedure FormResize(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure qrpAgendaPreview(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBEdit32Exit(Sender: TObject);
    procedure DBEdit32KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit38KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit38Exit(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit41Exit(Sender: TObject);
    procedure DBEdit41KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure lbEmpresaPrint(sender: TObject; var Value: string);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure StringGrid4Click(Sender: TObject);
    procedure StringGrid2Click(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure pnTardeClick(Sender: TObject);
    procedure pnSemanaClick(Sender: TObject);
    procedure pnManhaClick(Sender: TObject);
    procedure pnDiaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function ObterMenorMaiorHorario(psemana_m, psemana_t, psabado_m, psabado_t, pdomingo_m,
      pdomingo_t: string): Integer;
    function DiaSemana(pdata: TDate; pvisualizacao: string = ''): string;
    procedure Data_Inicial;
    procedure HorasStringGrid;
    procedure StringGridDia;
    procedure StringGridSemana;
    procedure LimparStringGrid;
    procedure PreencherGridStringDia;
    procedure PreencherStringGridsSemana;
    procedure AtualizarLembrete;
    procedure AtualizarInformacoes(pdata:TDateTime);
    procedure VerLembreteAgenda;
    procedure NovaAgenda;
    procedure EditarAgenda;
    procedure ExcluirAgenda;
    procedure ConfigurarForm(pValor: string);
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
    vTelaCadastro: Integer;
    vData_Inicial: TDate;
    vHoras: TStringList;
    cont_horas, cont_horas_m, cont_horas_t: Integer;
    hora_ini_semana_m, hora_ini_semana_t: string;
  end;

var
  frmCadAgenda: TfrmCadAgenda;

implementation

uses
  uClassesAgenda, UClassesCadastrosBasicos, uDtmAtivo, UDtmAgenda, uDataSet_OOP, DateUtils,
  uDadosIni, UClassesVeiculos, UClassesEquipamentos, Registry;

{$R *.dfm}

procedure TfrmCadAgenda.AtualizarInformacoes(pdata:TDateTime);
begin
  // Obtem o valor da Data Inicial
  Data_Inicial;
  // Limpa Todo StringGrid
  LimparStringGrid;
  // Obter Dados da hora do string
  ObterMenorMaiorHorario(vDadosIni.vEmp.vHora_Manha_Semana, vDadosIni.vEmp.vHora_Tarde_Semana,
    vDadosIni.vEmp.vHora_Manha_Sab, vDadosIni.vEmp.vHora_Tarde_Sab, vDadosIni.vEmp.vHora_Manha_Dom,
    vDadosIni.vEmp.vHora_Tarde_Dom);
  // Preenche a hora dos StringsGrid
  HorasStringGrid;
  // Preenche o dia do StringGridDia
  StringGridDia;
  // Preenche o dia do StringGridSemana
  StringGridSemana;
  // Carrega as informações do banco no StringGridDia
  PreencherGridStringDia;
  // Carrega as informações do banco no StringGridSemana
  PreencherStringGridsSemana;
  // Atualiza Grid Lembrete
  AtualizarLembrete;
  // Atualizar Avisos Lembrete
  CadAgenda._atualizarAvisosTMO;
  // Atualizar tempo do label que contém as informações dos minutos
  CadAgenda._QuantHorasSemana(pdata);
  CadAgenda._verificar_horas_disponiveis(pdata,'','S');

  Label23.Caption := FloatToStr(CadAgenda.vHorasPorDia);
  Label24.Caption := FloatToStr(CadAgenda.vHorasUtilizadas);
  Label25.Caption := FloatToStr(CadAgenda.vHorasDisponiveis);

  if pnDia.BevelInner = bvLowered then
    CadAgenda._abreResumoAgenda(MonthCalendar1.Date, StringGrid2.cells[0, StringGrid2.Row])
  else
  begin
    if vDadosIni.vEmp.vUsarDomingoAgenda = 'S' then
      CadAgenda._abreResumoAgenda(StartOfTheWeek(MonthCalendar1.Date) + StringGrid4.Col - 2,
        StringGrid4.cells[0, StringGrid4.Row])
    else
      CadAgenda._abreResumoAgenda(StartOfTheWeek(MonthCalendar1.Date) + StringGrid4.Col - 1,
        StringGrid4.cells[0, StringGrid4.Row]);
  end;
end;

procedure TfrmCadAgenda.AtualizarLembrete;
begin
  Lembrete.MostrarLembrete;
end;

procedure TfrmCadAgenda.BitBtn10Click(Sender: TObject);
begin
  inherited;
  CadAgenda._atualizarAvisosTMO;
  AtualizarLembrete;
end;

procedure TfrmCadAgenda.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if not CadAgenda.vAgendaItens.Insert then
    exit;

  DBEdit8.Enabled := true;
  DBLookupComboBox2.Enabled := true;
  DBEdit5.Enabled := true;

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('AGO013', 'HABILITAR', '', 'AGENDA', '', CadAgenda.buscas, false) then
  begin
    DBEdit5.Enabled := False;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
    DBEdit8.SetFocus;
end;

procedure TfrmCadAgenda.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if not CadAgenda.vAgendaItens.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(cadAgenda.vNomeCampoErro);
    if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
      DBEdit8.SetFocus;
    exit;
  end;

  DBEdit8.Enabled := false;
  DBLookupComboBox2.Enabled := false;
  DBEdit5.Enabled := false;
end;

procedure TfrmCadAgenda.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if not CadAgenda.vAgendaItens.Delete then
    exit;

  DBEdit8.Enabled := false;
  DBLookupComboBox2.Enabled := false;
  DBEdit5.Enabled := false;
end;

procedure TfrmCadAgenda.BitBtn1Click(Sender: TObject);
var
  i: integer;
begin
  if vDadosIni.PesqPros('AGO002', 'PESQUISAR', '',
    'AGENDA', '', CadAgenda.buscas, true) then
  begin
    inherited;
    try
      Screen.Cursor := crHourGlass;
      if MaskEdit2.Visible then
      begin
        if not CadAgenda.ConsultaCampos('AGENDA', ComboBox1.Text,
          ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
          	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          		combobox1.setfocus;
      end
      else if CadAgenda.ConsultaCampos('AGENDA', MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      	DBGrid1.SetFocus;

      if CadAgenda.dataSet.Active then
        for I := 0 to DBGrid1.Columns.Count - 1 do
          if DBGrid1.Columns[i].FieldName = 'OBSERVACAO' then
            DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadAgenda.BitBtn21Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('EQUIPAMENTO', ' AND EQUIPAMENTO.TIP_EQUIP = ''E'' ', '');

  if (Trim(vDadosIni.vPesquisa) = '') then
  begin
    vDadosIni.vPesquisa := '0';
    if (Self.Enabled) and (Self.Visible) and (DBEdit41.CanFocus) then
      DBEdit41.SetFocus;
  end
  else if not CadAgenda.buscaAparelho(StrToInt(vDadosIni.vPesquisa), Memo2) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit41.CanFocus) then
      DBEdit41.SetFocus;
    exit;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
    DBEdit8.SetFocus;
end;

procedure TfrmCadAgenda.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
  	NovaAgenda;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.BitBtn4Click(Sender: TObject);
begin
  if not CadAgenda.post then
  begin
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(cadAgenda.vNomeCampoErro);
    exit;
  end
  else
  begin
  		if (TelaCadastro = 6) or (TelaCadastro = 7) then
      begin
        BitBtn6.Click;
        Exit;
      end;
  end;

  PageControl1.ActivePage := tsAgenda;
  tsAgenda.Show;
  AtualizarInformacoes(MonthCalendar1.Date);
end;

procedure TfrmCadAgenda.BitBtn5Click(Sender: TObject);
begin
  inherited;
  cadAgenda.Cancel;
  cadAgenda.RollBackTransacao;
  CadAgenda.vAgendaItens.Cancel;
  CadAgenda.vAgendaItens.RollBackTransacao;

  if (vTelaCadastro = 0) then
  begin
    PageControl1.ActivePage := tsAgenda;
    tsAgenda.Show;
  end
  else
  begin
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
  end;
end;

procedure TfrmCadAgenda.BitBtn7Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vTelaCadastro := 1;
    PageControl1.ActivePage := TabSheet2;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.BitBtn8Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vTelaCadastro := 0;
    PageControl1.ActivePage := tsAgenda;

    if PageControl2.ActivePage = tsDia then
      CadAgenda._abreResumoAgenda(MonthCalendar1.Date, StringGrid2.cells[0, StringGrid2.Row])
    else
    begin
      if vDadosIni.vEmp.vUsarDomingoAgenda = 'S' then
        CadAgenda._abreResumoAgenda(StartOfTheWeek(MonthCalendar1.Date) + StringGrid4.Col - 2,
          StringGrid4.cells[0, StringGrid4.Row])
      else
        CadAgenda._abreResumoAgenda(StartOfTheWeek(MonthCalendar1.Date) + StringGrid4.Col - 1,
          StringGrid4.cells[0, StringGrid4.Row]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadAgenda.BitBtn9Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('VEICULOS');
  try
    Screen.Cursor := crHourGlass;

    if trim(vDadosIni.vPesquisa) = '' then
      exit;

    if not CadAgenda.buscaVeiculo(vDadosIni.vPesquisa, 0, Memo1, vDadosIni.vPesquisaPlaca, vDadosIni.vPesquisaChassi) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
        DBEdit32.SetFocus;
      exit;
    end;

    CadAgenda.dataSet.FieldByName('COD_VEICULO').AsInteger := StrToInt(vDadosIni.vPesquisa);
    CadAgenda.dataSet.FieldByName('PLACA').AsString := vDadosIni.vPesquisaPlaca;
    CadAgenda.dataSet.FieldByName('CHASSI').AsString := vDadosIni.vPesquisaChassi;

    DBEdit9.Field.AsInteger := CadAgenda.vVeic.dataSet.FieldByName('COD_CLIENTE').AsInteger;
    CadAgenda._mostrarClientes(DBEdit9.Field.AsInteger);

    if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      DBEdit9.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.ConfigurarForm(pValor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    if (TelaCadastro <= 0 ) then
      exit;
      
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + 'TfrmPrincipalS', True);
      // Grava as informações do form
      Registro.WriteString('JanelasMaximizadas', pValor);
      Registro.WriteString('ExibirPropagandaFlash', 'N');
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadAgenda.Data_Inicial;
begin
  if vDadosIni.vEmp.vUsarDomingoAgenda <> 'S' then
  begin
    // Não Usar Domingo no Calendário
    vData_Inicial := StartOfTheWeek(MonthCalendar1.Date);
    StringGrid4.ColCount := 7;
  end
  else
  begin
    // USar Domingo no Calendário
    vData_Inicial := StartOfTheWeek(MonthCalendar1.Date) - 1;
    StringGrid4.ColCount := 8;
  end;
end;

procedure TfrmCadAgenda.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  Label16.Caption := DiaSemana(DBEdit2.Field.AsDateTime, 'C');
  Label16.Visible := true;

  CadAgenda._QuantHorasSemana(CadAgenda.dataSet.FieldByName('DATA_AGENDA').AsDateTime);
end;

procedure TfrmCadAgenda.DBEdit32Exit(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if Trim(CadAgenda.dataSet.FieldByName('PLACA').AsString) = '' then
    begin
      CadAgenda.vVeic.Close;
      Memo1.Clear;
      exit;
    end;

    if ((CadAgenda.dataSet.FieldByName('COD_VEICULO').AsInteger > 0) and (trim(CadAgenda.dataSet.FieldByName('PLACA').AsString) <> '') and (trim(CadAgenda.dataSet.FieldByName('CHASSI').AsString) <> '')) then
    begin
      if not CadAgenda.buscaVeiculo(CadAgenda.dataSet.FieldByName('COD_VEICULO').AsString, 0, Memo1, CadAgenda.dataSet.FieldByName('PLACA').AsString, CadAgenda.dataSet.FieldByName('CHASSI').AsString) then
      begin
        CadAgenda.dataSet.FieldByName('COD_VEICULO').AsInteger := 0;
        CadAgenda.dataSet.FieldByName('CHASSI').AsString := '';
        if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
          DBEdit32.SetFocus;
        exit;
      end;
    end
    else if not CadAgenda.buscaVeiculo(TDBEdit(sender).Text, TDBEdit(sender).Tag, Memo1) then
    begin
      CadAgenda.dataSet.FieldByName('COD_VEICULO').AsInteger := 0;
      CadAgenda.dataSet.FieldByName('CHASSI').AsString := '';
      if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
        DBEdit32.SetFocus;
      exit;
    end;


    DBEdit9.Field.AsInteger := CadAgenda.vVeic.dataSet.FieldByName('COD_CLIENTE').AsInteger;
    CadAgenda._mostrarClientes(DBEdit9.Field.AsInteger);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.DBEdit32KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vVeic: TVeiculos;
begin
  inherited;
  if Key = VK_F4 then
  begin
    vVeic := TVeiculos.create;
    vVeic.CadVeiculos(1);
    if vDadosIni.vPesquisa <> '' then
      CadAgenda.buscaVeiculo(vDadosIni.vPesquisa, 3, Memo1);
  end
  else if key = VK_F3 then
  begin
    BitBtn9Click(Sender);
  end;
end;

procedure TfrmCadAgenda.DBEdit38Exit(Sender: TObject);
begin
  inherited;
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if Trim(CadAgenda.dataSet.FieldByName('CHASSI').AsString) = '' then
    begin
      CadAgenda.vVeic.Close;
      Memo1.Clear;
      exit;
    end;

    if ((CadAgenda.dataSet.FieldByName('COD_VEICULO').AsInteger > 0) and (trim(CadAgenda.dataSet.FieldByName('PLACA').AsString) <> '') and (trim(CadAgenda.dataSet.FieldByName('CHASSI').AsString) <> '')) then
    begin
      if not CadAgenda.buscaVeiculo(CadAgenda.dataSet.FieldByName('COD_VEICULO').AsString, 0, Memo1, CadAgenda.dataSet.FieldByName('PLACA').AsString, CadAgenda.dataSet.FieldByName('CHASSI').AsString) then
      begin
        CadAgenda.dataSet.FieldByName('COD_VEICULO').AsInteger := 0;
        CadAgenda.dataSet.FieldByName('PLACA').AsString := '';
        if (Self.Enabled) and (Self.Visible) and (DBEdit38.CanFocus) then
          DBEdit38.SetFocus;
        exit;
      end;
    end
    else if not CadAgenda.buscaVeiculo(TDBEdit(sender).Text, TDBEdit(sender).Tag, Memo1) then
    begin
      CadAgenda.dataSet.FieldByName('COD_VEICULO').AsInteger := 0;
      CadAgenda.dataSet.FieldByName('PLACA').AsString := '';
      if (Self.Enabled) and (Self.Visible) and (DBEdit38.CanFocus) then
        DBEdit38.SetFocus;
      exit;
    end;

    DBEdit9.Field.AsInteger := CadAgenda.vVeic.dataSet.FieldByName('COD_CLIENTE').AsInteger;
    CadAgenda._mostrarClientes(DBEdit9.Field.AsInteger);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.DBEdit38KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vVeic: TVeiculos;
begin
  inherited;
  if Key = VK_F4 then
  begin
    vVeic := TVeiculos.create;
    vVeic.CadVeiculos(1);
    if vDadosIni.vPesquisa <> '' then
      CadAgenda.buscaVeiculo(vDadosIni.vPesquisa, 3, Memo1);
  end
  else if key = VK_F3 then
  begin
    BitBtn9Click(Sender);
  end;
end;

procedure TfrmCadAgenda.DBEdit3Exit(Sender: TObject);
begin
  inherited;

  if ActiveControl = BitBtn5 then
    exit;

  if Trim(DBEdit3.Text) = '' then
  begin
    Application.MessageBox(pchar('Hora da Agenda deve ser informada'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus;
    exit;
  end;

  if DayOfWeek(StrToDate(DBEdit2.Text)) = 1 then
  begin
    if (trim(vDadosIni.vEmp.vHora_Manha_Semana) <> '') then
      if (StrToInt(DBEdit3.Text) > StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Semana, 4, 2))) then
        CadAgenda.vTurno := 'T'
      else
        CadAgenda.vTurno := 'M';
  end
  else if ((DayOfWeek(StrToDate(DBEdit2.Text)) >= 2) and (DayOfWeek(StrToDate(DBEdit2.Text)) <= 6))
    then
  begin
    if (trim(vDadosIni.vEmp.vHora_Manha_Sab) <> '') then
      if (StrToInt(DBEdit3.Text) > StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Sab, 4, 2))) then
        CadAgenda.vTurno := 'T'
      else
        CadAgenda.vTurno := 'M';
  end
  else
  begin
    if (trim(vDadosIni.vEmp.vHora_Manha_Semana) <> '') then
      if (StrToInt(DBEdit3.Text) > StrToInt(Copy(vDadosIni.vEmp.vHora_Manha_Semana, 4, 2))) then
        CadAgenda.vTurno := 'T'
      else
        CadAgenda.vTurno := 'M';
  end;
end;

procedure TfrmCadAgenda.DBEdit41Exit(Sender: TObject);
begin
  inherited;
  if CadAgenda.dataSet.FieldByName('COD_EQUIP').AsInteger <= 0 then
  begin
    CadAgenda.vApar.Close;
    Memo2.Clear;
    if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      DBEdit9.SetFocus;
    exit;
  end;

  if not CadAgenda.buscaAparelho(CadAgenda.dataSet.FieldByName('COD_EQUIP').AsInteger, Memo2) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit41.CanFocus) then
      DBEdit41.SetFocus;
    exit;
  end;

  if DBEdit9.CanFocus then
  begin
    PageControl3.ActivePage := tsCadastro;
    ActiveControl := DBEdit9;
    CadAgenda._mostrarClientes(DBEdit9.Field.AsInteger);
  end;
end;

procedure TfrmCadAgenda.DBEdit41KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vEquip: TEquipamentos;
begin
  inherited;
  if Key = VK_F4 then
  begin
    vEquip := TEquipamentos.create;
    vEquip.CadEquipamentos(1);
    if vDadosIni.vPesquisa <> '' then
      CadAgenda.buscaAparelho(StrToInt(vDadosIni.vPesquisa), Memo2);
  end
  else if key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('EQUIPAMENTO', ' AND EQUIPAMENTO.TIP_EQUIP = ''E'' ', '');
    CadAgenda.dataSet.FieldByName('COD_EQUIP').AsString := vDadosIni.vPesquisa;
  end;
end;

procedure TfrmCadAgenda.DBEdit4Exit(Sender: TObject);
begin
  inherited;
	if ActiveControl = BitBtn5 then
    exit;

  if Trim(DBEdit4.Text) = '' then
  begin
    Application.MessageBox(pchar('Minuta da Agenda deve ser informada'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      DBEdit4.SetFocus;
    exit;
  end;

  if vDadosIni.vEmp.vUsarAparelho = 'S' then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit41.CanFocus) then
      DBEdit41.SetFocus;
  end
  else
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
      DBEdit32.SetFocus;
  end;
end;

procedure TfrmCadAgenda.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
    BitBtn16.SetFocus;
end;

procedure TfrmCadAgenda.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  if CadAgenda.vAgendaItens.dataSet.State in [dsInsert, dsedit] then
  begin
    CadAgenda.vAgendaItens._MostrarServicos(DBEdit8.Field.AsInteger);
  end;
end;

procedure TfrmCadAgenda.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SERVICOS_EMP', ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa, 'Tipo de Serviço');
    if trim(vDadosIni.vPesquisa) <> '' then
    begin
      DBEdit8.Field.AsInteger := StrToInt(vDadosIni.vPesquisa);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
	      DBLookupComboBox2.SetFocus;
    end;
  end;
end;

procedure TfrmCadAgenda.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  if DBEdit9.Field.AsInteger > 0 then
  begin
    DBEdit7.Enabled := false;
    CadAgenda._mostrarClientes(DBEdit9.Field.AsInteger);
  end
  else
  begin
    DBEdit7.Enabled := true;
    CadAgenda._mostrarClientes(DBEdit9.Field.AsInteger);

    if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
    	DBEdit7.SetFocus;
  end;
end;

procedure TfrmCadAgenda.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
    if trim(vDadosIni.vPesquisa) <> '' then
    begin
      DBEdit9.Field.AsInteger := StrToInt(vDadosIni.vPesquisa);
      if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
	      DBEdit7.SetFocus;
    end;
  end;
end;

procedure TfrmCadAgenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    EditarAgenda;
  end;
end;

procedure TfrmCadAgenda.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  VerLembreteAgenda;
end;

procedure TfrmCadAgenda.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'ABERTA') then
  begin
    TDBGrid(sender).canvas.brush.color := clYellow;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'CANCELADA') then
  begin
    TDBGrid(sender).canvas.brush.color := clRed;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'FECHADA') then
  begin
    TDBGrid(sender).canvas.brush.color := clGreen;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'AVISO') then
  begin
    TDBGrid(sender).canvas.brush.color := clFuchsia;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'AGUARDANDO') then
  begin
    TDBGrid(sender).canvas.brush.color := clMenuHighlight;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadAgenda.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_TAB) or (key = VK_RETURN)) then
    if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
      DBMemo1.SetFocus;
end;

procedure TfrmCadAgenda.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    EditarAgenda;
  end;
end;

procedure TfrmCadAgenda.DBGrid5DblClick(Sender: TObject);
begin
  inherited;
  VerLembreteAgenda;
end;

procedure TfrmCadAgenda.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'ABERTA') then
  begin
    TDBGrid(sender).canvas.brush.color := clYellow;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'CANCELADA') then
  begin
    TDBGrid(sender).canvas.brush.color := clRed;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'FECHADA') then
  begin
    TDBGrid(sender).canvas.brush.color := clGreen;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'AVISO') then
  begin
    TDBGrid(sender).canvas.brush.color := clFuchsia;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  if (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'AGUARDANDO') then
  begin
    TDBGrid(sender).canvas.brush.color := clMenuHighlight;
    TDBGrid(sender).canvas.Font.color := clBlack;
  end;


  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadAgenda.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    try
      Screen.Cursor := crHourGlass;
    	EditarAgenda;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadAgenda.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if CadAgenda.vAgendaItens.dataSet.State in [dsInsert, dsedit] then
  begin
    CadAgenda.vAgendaItens._MostrarServicos(DBLookupComboBox2.KeyValue);
  end;
end;

function TfrmCadAgenda.DiaSemana(pdata: TDate; pvisualizacao: string): string;
var
  i: Integer;
  teste: string;
begin
  i := DayOfWeek(pdata);

  if pvisualizacao = '' then
  begin
    if i = 1 then
      Result := 'dom'
    else if i = 2 then
      Result := 'seg'
    else if i = 3 then
      Result := 'ter'
    else if i = 4 then
      Result := 'qua'
    else if i = 5 then
      Result := 'qui'
    else if i = 6 then
      Result := 'sex'
    else if i = 7 then
      Result := 'sab';
  end
  else
  begin
    if i = 1 then
      Result := 'Domingo'
    else if i = 2 then
      Result := 'Segunda-Feira'
    else if i = 3 then
      Result := 'Terça-Feira'
    else if i = 4 then
      Result := 'Quarta-Feira'
    else if i = 5 then
      Result := 'Quinta-Feira'
    else if i = 6 then
      Result := 'Sexta-Feira'
    else if i = 7 then
      Result := 'Sabado';
  end;

end;

procedure TfrmCadAgenda.EditarAgenda;
begin
  try
    if CadAgenda.dataSet.IsEmpty then
    	exit;
      
    if not CadAgenda.Edit then
      exit;

    inherited;

    if (CadAgenda.dataSet.FieldByName('COD_EQUIP').AsInteger > 0) then
    begin
      PageControl4.ActivePage := TabSheet5;
      TabSheet5.Show;
      CadAgenda.buscaAparelho(CadAgenda.dataSet.FieldByName('COD_EQUIP').AsInteger, Memo2);
    end
    else
    begin
      PageControl4.ActivePage := TabSheet4;
      TabSheet4.Show;
      CadAgenda.buscaVeiculo(CadAgenda.dataSet.FieldByName('COD_VEICULO').AsString, 3, Memo1);
    end;

    if CadAgenda.dataSet.FieldByName('NPED').AsInteger <= 0 then
      BitBtn4.Enabled := true
    else
      BitBtn4.Enabled := false;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    DBComboBox1.Visible := false;

    DBEdit8.Enabled := false;
    DBLookupComboBox2.Enabled := false;
    DBEdit5.Enabled := false;
    Label10.Visible := true;
    Label17.Visible := true;
    DBComboBox1.Visible := true;
    DBEdit1.Visible := true;
    DBComboBox1.Enabled := false;
    DBEdit1.Enabled := false;
    Label16.Visible := false;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadAgenda.Cancel;
      CadAgenda.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadAgenda.ExcluirAgenda;
begin
  inherited;
  try
    if not vDadosIni.PesqPros('AGO005', 'EXCLUIR', '', 'AGENDA',
      CadAgenda.dataSet.FieldByName('COD_AGENDA').AsString, CadAgenda.buscas, false) then
      Exit;

    CadAgenda.Delete;
    AtualizarInformacoes(MonthCalendar1.Date);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      CadAgenda.Cancel;
      CadAgenda.RollBackTransacao;
    end;
  end;

end;

procedure TfrmCadAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  _GravaConfiguracoesBoolean('pnManha', (vDadosIni.IfThen(pnManha.BevelInner = bvNone, False, True)));
  _GravaConfiguracoesBoolean('pnDia', (vDadosIni.IfThen(pnDia.BevelInner = bvNone, False, True)));
  Timer1.Enabled := false;

  if (CadAgenda <> nil) then
    CadAgenda.Cancel;

  CadAgenda.free;
  CadAgenda := nil;

  Lembrete.free;
  Lembrete := nil;

  Action := caFree;
  frmCadAgenda := nil;
end;

procedure TfrmCadAgenda.FormCreate(Sender: TObject);
begin
	vCriou := 0;
//  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'MARCARAGENDA' then
//  begin
//    if DtmAgenda = nil then
//      DtmAgenda := TDtmAgenda.Create(DtmAgenda);
//    vDadosIni.vTipoForm := 6;
//
//    if vDadosIni.vEmp.vUsarAparelho <> 'S' then
//    begin
//      vDadosIni.vPesquisaChassi := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
//      vDadosIni.vPesquisaPlaca := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4);
//    end;
//    vDadosIni.vPesquisa := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
//
//    vDadosIni.vModalOuChild := 'M';
//  end
//  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EDITARAGENDA' then
//  begin
//    if DtmAgenda = nil then
//      DtmAgenda := TDtmAgenda.Create(DtmAgenda);
//    vDadosIni.vTipoForm := 7;
//    vDadosIni.vModalOuChild := 'M';
//    vDadosIni.vPesquisa := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
//  end
//  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'DESMARCARAGENDA' then
//  begin
//    if DtmAgenda = nil then
//      DtmAgenda := TDtmAgenda.Create(DtmAgenda);
//    vDadosIni.vTipoForm := 8;
//    vDadosIni.vModalOuChild := 'M';
//    vDadosIni.vPesquisa := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
//  end;
//  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  CadAgenda := TAgenda.create;
  Lembrete := TLembrete.create;
  vHoras := TStringList.Create;
  tsCadastro.TabVisible := false;
  tsAgenda.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  tsCadastro.TabVisible := false;
  tsRelAgenda.TabVisible := false;

  PageControl1.ActivePage := tsAgenda;
  tsAgenda.show;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadAgenda.FormResize(Sender: TObject);
var
	I: Integer;
begin
  for I := 0 to StringGrid2.ColCount - 1 do
  begin
  	if (I > 0) then
      StringGrid2.ColWidths[I] := Trunc(frmCadAgenda.Height * 1.05);
  end;

  if (vDadosIni.vEmp.vUsarDomingoAgenda = 'S') then
  	StringGrid4.DefaultColWidth := Trunc(frmCadAgenda.Height / 7.20)
  else
		StringGrid4.DefaultColWidth := Trunc(frmCadAgenda.Height / 6.30);

  for I := 0 to StringGrid4.ColCount - 1 do
  begin
  	if (vDadosIni.vEmp.vUsarDomingoAgenda = 'S') then
	  	StringGrid4.ColWidths[I] := Trunc(frmCadAgenda.Height / 7.20)
    else
    	StringGrid4.ColWidths[I] := Trunc(frmCadAgenda.Height / 6.30);
  end;
end;

procedure TfrmCadAgenda.FormShow(Sender: TObject);
begin
	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'MARCARAGENDA' then
  begin
    if DtmAgenda = nil then
      DtmAgenda := TDtmAgenda.Create(DtmAgenda);
    vDadosIni.vTipoForm := 6;

    if vDadosIni.vEmp.vUsarAparelho <> 'S' then
    begin
      vDadosIni.vPesquisaChassi := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
      vDadosIni.vPesquisaPlaca := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4);
    end;
    vDadosIni.vPesquisa := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);

    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EDITARAGENDA' then
  begin
    if DtmAgenda = nil then
      DtmAgenda := TDtmAgenda.Create(DtmAgenda);
    vDadosIni.vTipoForm := 7;
    vDadosIni.vModalOuChild := 'M';
    vDadosIni.vPesquisa := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'DESMARCARAGENDA' then
  begin
    if DtmAgenda = nil then
      DtmAgenda := TDtmAgenda.Create(DtmAgenda);
    vDadosIni.vTipoForm := 8;
    vDadosIni.vModalOuChild := 'M';
    vDadosIni.vPesquisa := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  
//  vTelaCadastro := 0;
  ConfigurarForm('N');
  MonthCalendar1.Date := Date;
  PageControl2.ActivePage := tsDia;

  Timer1.Enabled := true;
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmAgenda.dsAgenda;
    inherited;
    if vCriou = 0 then
    	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;
  PageControl1.ActivePage := tsAgenda;
  tsAgenda.show;
//  SpeedButton9.Height := trunc(Panel11.Height / 3) + 10;
//  SpeedButton10.Height := trunc(Panel11.Height / 3) + 10;

  MonthCalendar1.Date := Date;
  if (_LerConfiguracoesRegistroBoolean('pnDia')) then
  begin
    pnDia.BevelInner := bvLowered;
	  pnDia.Font.Style := pnDia.Font.Style + [fsBold];
    tsDia.Show;
    pnDia.BevelInner := bvLowered;
    pnDia.Font.Style := pnManha.Font.Style + [fsBold];
    pnSemana.BevelInner := bvNone;
    pnSemana.Font.Style := pnManha.Font.Style - [fsBold];
  end
  else
  begin
    pnSemana.BevelInner := bvLowered;
	  pnSemana.Font.Style := pnDia.Font.Style - [fsBold];

    if vDadosIni.vEmp.vUsarDomingoAgenda = 'S' then
    	StringGrid4.Col := DayOfWeek(MonthCalendar1.Date)
    else
	    StringGrid4.Col := DayOfWeek(MonthCalendar1.Date) - 1;
    tsSemana.Show;
    pnDia.BevelInner := bvNone;
    pnDia.Font.Style := pnManha.Font.Style - [fsBold];
    pnSemana.BevelInner := bvLowered;
    pnSemana.Font.Style := pnManha.Font.Style + [fsBold];
  end;
  if (_LerConfiguracoesRegistroBoolean('pnManha')) then
  begin
	  pnManha.BevelInner := bvLowered;
	  pnManha.Font.Style := pnManha.Font.Style + [fsBold];
    pnManhaClick(Sender);
  end
  else
  begin
    pnTarde.BevelInner := bvLowered;
	  pnTarde.Font.Style := pnManha.Font.Style + [fsBold];
    pnTardeClick(Sender);
  end;
  MonthCalendar1Click(Sender);
  vDadosIni.fechaStatusProcessamento;
  if TelaCadastro = 6 then
  begin
  	SpeedButton14Click(Sender);
    if CadAgenda.dataSet.State = dsInsert then
    begin
      try
        if vDadosIni.vEmp.vUsarAparelho = 'S' then
          CadAgenda.dataSet.FieldByName('cod_equip').AsInteger := StrToInt(vDadosIni.vPesquisa)
        else
        begin
          CadAgenda.dataSet.FieldByName('cod_veiculo').AsInteger := StrToInt(vDadosIni.vPesquisa);
          CadAgenda.dataSet.FieldByName('chassi').AsString := vDadosIni.vPesquisaChassi;
          CadAgenda.dataSet.FieldByName('placa').AsString := vDadosIni.vPesquisaPlaca;
          vDadosIni.fechaStatusProcessamento;
        end;
      finally
        vDadosIni.vPesquisa := '';
        vDadosIni.vPesquisaChassi := '';
        vDadosIni.vPesquisaPlaca := '';
      end;
    end;
  end
  else if TelaCadastro = 7 then
  begin
    if CadAgenda._abreAgendaEditar(StrToInt(vDadosIni.vPesquisa)) then
     	SpeedButton10Click(Sender);
    vDadosIni.fechaStatusProcessamento;  
  end
  else if TelaCadastro = 8 then
  begin
    if CadAgenda._abreAgendaEditar(StrToInt(vDadosIni.vPesquisa)) then
     	SpeedButton9Click(Sender);
      if frmCadAgenda = nil then
		    frmCadAgenda := TfrmCadAgenda(Self);
      frmCadAgenda.fechar := True;
      PostMessage(frmCadAgenda.Handle, WM_CLOSE, 0, 0)
  end;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "AGO010" CONFIRMAR AGENDAMENTO OFICINA SEM TEMPO DISPONÍVEL' + #13 +
    'Processo "AGO011" CONFIRMAR O MESMO CLIENTE EM HORARIOS DIFERENTES' + #13 +
    'Processo "AGO012" INCLUIR SERVICO ESPECIFICO SEM TEMPO DISPONÍVEL' + #13 +
    'Processo "AGO013" HABILITAR CAMPO TMO NA AGENDA OFICINA';

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadAgenda.HorasStringGrid;
var
  i: Integer;
  hora, hora_ini: string;

begin
  i := 0;

  if pnManha.BevelInner = bvLowered then
  begin
    hora_ini := hora_ini_semana_m;
    cont_horas := cont_horas_m;
  end
  else
  begin
    hora_ini := hora_ini_semana_t;
    cont_horas := cont_horas_t;
  end;

  while i <= cont_horas do
  begin
    hora := IntToStr(StrToInt(hora_ini) + i);

    if Length(hora) < 2 then
      hora := '0' + hora
    else
      hora := hora;

    StringGrid2.cells[0, i + 1] := hora;
    StringGrid4.cells[0, i + 1] := hora;
    i := i + 1;
  end;

end;

procedure TfrmCadAgenda.lbEmpresaPrint(sender: TObject; var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadAgenda.LimparStringGrid;
var
  i: Integer;
begin
  i := 0;
  while i <= (cont_horas + 2) do
  begin
    StringGrid2.cells[0, i + 1] := '';
    StringGrid4.cells[0, i + 1] := '';
    StringGrid2.cells[1, i + 1] := '';
    StringGrid4.cells[1, i + 1] := '';
    StringGrid4.cells[2, i + 1] := '';
    StringGrid4.cells[3, i + 1] := '';
    StringGrid4.cells[4, i + 1] := '';
    StringGrid4.cells[5, i + 1] := '';
    StringGrid4.cells[6, i + 1] := '';
    i := i + 1;
  end;

end;

procedure TfrmCadAgenda.MonthCalendar1Click(Sender: TObject);
var
	vData: TDateTime;
begin
  try
    Screen.Cursor := crHourGlass;
    vData := MonthCalendar1.Date;
    if pnSemana.BevelInner = bvLowered then
    	MonthCalendar1.Date := vDadosIni.IfThen(DayOfWeek(MonthCalendar1.Date) = 1, MonthCalendar1.Date + 1, MonthCalendar1.Date);
    AtualizarInformacoes(MonthCalendar1.Date);

    MonthCalendar1.Date := vData;

    if pnSemana.BevelInner = bvLowered then
    begin
      if vDadosIni.vEmp.vUsarDomingoAgenda = 'S' then
        StringGrid4.Col := DayOfWeek(MonthCalendar1.Date)
      else
        StringGrid4.Col := DayOfWeek(MonthCalendar1.Date) - 1;
    end;
      
    if pnDia.BevelInner = bvLowered then
	    CadAgenda._abreResumoAgenda(MonthCalendar1.Date, StringGrid2.cells[0, 1])
    else
    	CadAgenda._abreResumoAgenda(MonthCalendar1.Date, StringGrid4.cells[0, 1]);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.NovaAgenda;
begin
  try
    if not CadAgenda.Insert then
      exit;

    inherited;

    if vDadosIni.vEmp.vUsarAparelho = 'S' then
    begin
      PageControl4.ActivePage := TabSheet5;
      TabSheet5.Show;
      CadAgenda.vApar.Close;
      Memo2.Clear;
    end
    else
    begin
      PageControl4.ActivePage := TabSheet4;
      TabSheet4.Show;
      CadAgenda.vVeic.Close;
      Memo1.Clear;
    end;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    DBEdit2.Field.AsDateTime := Date;
    Label10.Visible := false;
    Label17.Visible := false;
    DBComboBox1.Visible := false;
    DBEdit1.Visible := false;
    Label16.Visible := false;
    CadAgenda.vAgendaItens.NITEM := 0;
    CadAgenda.dataSet.FieldByName('DATA_AGENDA').AsString := DateToStr(vDadosIni.getDataBanco(CadAgenda.buscas));


    DBEdit8.Enabled := false;
    DBLookupComboBox2.Enabled := false;
    DBEdit5.Enabled := false;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + E.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl2.ActivePage := tsAgenda;
      tsAgenda.Show;
      CadAgenda.Cancel;
      CadAgenda.RollBackTransacao;
    end;
  end;
end;

function TfrmCadAgenda.ObterMenorMaiorHorario(psemana_m, psemana_t, psabado_m,
  psabado_t, pdomingo_m, pdomingo_t: string): Integer;
var
  vHoraTemp, i: Integer;
begin
  /////////////////////////////////////Manhã/////////////////////////////////////
  vHoraTemp := 99;

  if trim(vDadosIni.vEmp.vHora_Manha_Semana) <> '' then
    vHoras.Add(Copy(psemana_m, 1, 2));

  if trim(vDadosIni.vEmp.vHora_Manha_Sab) <> '' then
    vHoras.Add(Copy(psabado_m, 1, 2));

  if trim(vDadosIni.vEmp.vHora_Manha_Dom) <> '' then
    vHoras.Add(Copy(pdomingo_m, 1, 2));

  for i := (vHoras.Count - 1) downto 0 do
  begin
    if (vHoraTemp > StrToInt(vHoras[i])) then // and ((StrToInt(vHoras[i]) > 0)) then
      vHoraTemp := StrToInt(vHoras[I]);
  end;
  vHoras.Clear;

  hora_ini_semana_m := IntToStr(vHoraTemp);

  vHoraTemp := -1;

  if trim(vDadosIni.vEmp.vHora_Manha_Semana) <> '' then
    vHoras.Add(Copy(psemana_m, 4, 2));

  if trim(vDadosIni.vEmp.vHora_Manha_Sab) <> '' then
    vHoras.Add(Copy(psabado_m, 4, 2));

  if trim(vDadosIni.vEmp.vHora_Manha_Dom) <> '' then
    vHoras.Add(Copy(pdomingo_m, 4, 2));

  for i := (vHoras.Count - 1) downto 0 do
  begin
    if (vHoraTemp < StrToInt(vHoras[i])) then // and ((StrToInt(vHoras[i]) > 0)) then
      vHoraTemp := StrToInt(vHoras[I]);
  end;
  vHoras.Clear;

  cont_horas_m := vHoraTemp - StrToInt(hora_ini_semana_m);

  /////////////////////////////////////Tarde/////////////////////////////////////
  vHoraTemp := 99;

  if trim(vDadosIni.vEmp.vHora_Tarde_Semana) <> '' then
    vHoras.Add(Copy(psemana_t, 1, 2));

  if trim(vDadosIni.vEmp.vHora_Tarde_Sab) <> '' then
    vHoras.Add(Copy(psabado_t, 1, 2));

  if trim(vDadosIni.vEmp.vHora_Tarde_Dom) <> '' then
    vHoras.Add(Copy(pdomingo_t, 1, 2));

  for i := (vHoras.Count - 1) downto 0 do
  begin
    if (vHoraTemp > StrToInt(vHoras[i])) then // and ((StrToInt(vHoras[i]) > 0)) then
      vHoraTemp := StrToInt(vHoras[I]);
  end;
  vHoras.Clear;

  hora_ini_semana_t := IntToStr(vHoraTemp);

  vHoraTemp := -1;

  if trim(vDadosIni.vEmp.vHora_Tarde_Semana) <> '' then
    vHoras.Add(Copy(psemana_t, 4, 2));

  if trim(vDadosIni.vEmp.vHora_Tarde_Sab) <> '' then
    vHoras.Add(Copy(psabado_t, 4, 2));

  if trim(vDadosIni.vEmp.vHora_Tarde_Dom) <> '' then
    vHoras.Add(Copy(pdomingo_t, 4, 2));

  for i := (vHoras.Count - 1) downto 0 do
  begin
    if (vHoraTemp < StrToInt(vHoras[i])) then // and ((StrToInt(vHoras[i]) > 0)) then
      vHoraTemp := StrToInt(vHoras[I]);
  end;
  vHoras.Clear;

  cont_horas_t := vHoraTemp - StrToInt(hora_ini_semana_t);
end;

procedure TfrmCadAgenda.pnManhaClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    pnManha.BevelInner := bvLowered;
    pnManha.Font.Style := pnManha.Font.Style + [fsBold];
    pnTarde.BevelInner := bvNone;
    pnTarde.Font.Style := pnManha.Font.Style - [fsBold];
    AtualizarInformacoes(MonthCalendar1.Date);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.pnTardeClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    pnManha.BevelInner := bvNone;
    pnManha.Font.Style := pnManha.Font.Style - [fsBold];
    pnTarde.BevelInner := bvLowered;
    pnTarde.Font.Style := pnManha.Font.Style + [fsBold];
    AtualizarInformacoes(MonthCalendar1.Date);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.pnDiaClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    tsDia.Show;
    pnDia.BevelInner := bvLowered;
    pnDia.Font.Style := pnManha.Font.Style + [fsBold];
    pnSemana.BevelInner := bvNone;
    pnSemana.Font.Style := pnManha.Font.Style - [fsBold];
    AtualizarInformacoes(MonthCalendar1.Date);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.pnSemanaClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    tsSemana.Show;
    pnDia.BevelInner := bvNone;
    pnDia.Font.Style := pnManha.Font.Style - [fsBold];
    pnSemana.BevelInner := bvLowered;
    pnSemana.Font.Style := pnManha.Font.Style + [fsBold];

    if pnSemana.BevelInner = bvLowered then
      if vDadosIni.vEmp.vUsarDomingoAgenda = 'S' then
        StringGrid4.Col := DayOfWeek(MonthCalendar1.Date)
      else
        StringGrid4.Col := DayOfWeek(MonthCalendar1.Date) - 1;
        
    AtualizarInformacoes(MonthCalendar1.Date);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.PreencherGridStringDia;
var
  i: Integer;
  j: integer;
  data: string;
begin
  i := 0;

  if CadAgenda._verificar_feriado(MonthCalendar1.Date, 'A') then
  begin
    for j := 0 to StringGrid2.RowCount do
      StringGrid2.cells[1, j + 1] := CadAgenda.buscas2.FieldByName('DESCR_FERIADO').AsString;
    exit;
  end;

  if pnManha.BevelInner = bvLowered then
  begin
    if CadAgenda._verificar_feriado(MonthCalendar1.Date, 'M') then
    begin
      for j := 0 to StringGrid2.RowCount do
        StringGrid2.cells[1, j + 1] := CadAgenda.buscas2.FieldByName('DESCR_FERIADO').AsString;
      exit;
    end;
    CadAgenda._abreAgenda(StrToDate(DateToStr(MonthCalendar1.Date)),
      hora_ini_semana_m, IntToStr(StrToInt(hora_ini_semana_m) + cont_horas_m))
  end
  else
  begin
    if CadAgenda._verificar_feriado(MonthCalendar1.Date, 'T') then
    begin
      for j := 0 to StringGrid2.RowCount do
        StringGrid2.cells[1, j + 1] := CadAgenda.buscas2.FieldByName('DESCR_FERIADO').AsString;
      exit;
    end;
    CadAgenda._abreAgenda(StrToDate(DateToStr(MonthCalendar1.Date)),
      hora_ini_semana_t, IntToStr(StrToInt(hora_ini_semana_t) + cont_horas_t));
  end;

  CadAgenda.buscas.First;
  if (DateToStr(MonthCalendar1.Date) = CadAgenda.buscas.FieldByName('DATA_AGENDA').AsString) then
    while not CadAgenda.buscas.Eof do
    begin
      if StringGrid2.cells[0, i + 1] = CadAgenda.buscas.FieldByName('HORA_AGENDA').AsString then
      begin
        if StringGrid2.cells[1, i + 1] = '' then
        begin
          StringGrid2.cells[1, i + 1] := CadAgenda.buscas.FieldByName('COD_CLIENTE').AsString +
            ' - ' + CadAgenda.buscas.FieldByName('NOME_CLIENTE').AsString;
        end
        else
        begin
          StringGrid2.cells[1, i + 1] := StringGrid2.cells[1, i + 1] + ', ' +
            CadAgenda.buscas.FieldByName('COD_CLIENTE').AsString + ' - ' +
            CadAgenda.buscas.FieldByName('NOME_CLIENTE').AsString;
        end;

        CadAgenda.buscas.Next;
      end
      else
      begin
        i := i + 1;
        if (i > (cont_horas + 2)) then
          CadAgenda.buscas.Next;
      end;
    end;
end;

procedure TfrmCadAgenda.PreencherStringGridsSemana;
var
  i, j, g: integer;
  data: string;
begin

  for j := 0 to 6 do
  begin
    if CadAgenda._verificar_feriado(StartOfTheWeek(vData_Inicial) + j, 'A') then
    begin
      for g := 0 to StringGrid4.RowCount do
        StringGrid4.cells[j + 1, g + 1] :=
          CadAgenda.buscas2.FieldByName('DESCR_FERIADO').AsString;
    end
    else
    begin
      i := 0;
      data := DateToStr(vData_Inicial + j);
      if pnManha.BevelInner = bvLowered then
      begin
        if CadAgenda._verificar_feriado(StartOfTheWeek(vData_Inicial) + j, 'M') then
        begin
          for g := 0 to StringGrid4.RowCount do
            StringGrid4.cells[j + 1, g + 1] :=
              CadAgenda.buscas2.FieldByName('DESCR_FERIADO').AsString;
        end
        else
          CadAgenda._abreAgenda(StrToDate(data), hora_ini_semana_m,
            IntToStr(StrToInt(hora_ini_semana_m) + cont_horas_m))
      end
      else
      begin
        if CadAgenda._verificar_feriado(StartOfTheWeek(vData_Inicial) + j, 'T') then
        begin
          for g := 0 to StringGrid4.RowCount do
            StringGrid4.cells[j + 1, g + 1] :=
              CadAgenda.buscas2.FieldByName('DESCR_FERIADO').AsString;
        end
        else
          CadAgenda._abreAgenda(StrToDate(data), hora_ini_semana_t,
            IntToStr(StrToInt(hora_ini_semana_t) + cont_horas_t));
      end;

      CadAgenda.buscas.First;
      if data = CadAgenda.buscas.FieldByName('DATA_AGENDA').AsString then
        while not CadAgenda.buscas.Eof do
        begin
          if StringGrid2.cells[0, i + 1] = CadAgenda.buscas.FieldByName('HORA_AGENDA').AsString then
          begin
            if StringGrid4.cells[j + 1, i + 1] = '' then
              StringGrid4.cells[j + 1, i + 1] := CadAgenda.buscas.FieldByName('COD_CLIENTE').AsString
            else
              StringGrid4.cells[j + 1, i + 1] := StringGrid4.cells[j + 1, i + 1] + ', ' +
                CadAgenda.buscas.FieldByName('COD_CLIENTE').AsString;

            CadAgenda.buscas.Next;
          end
          else
          begin
            i := i + 1;
            if (i > (cont_horas + 2)) then
              CadAgenda.buscas.Next;
          end;
        end;
    end;
  end;

end;

procedure TfrmCadAgenda.qrpAgendaPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Agenda Oficina');
end;

procedure TfrmCadAgenda.SpeedButton10Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
  	EditarAgenda;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.SpeedButton13Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadAgenda.SpeedButton14Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
  	NovaAgenda;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
  	EditarAgenda;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.SpeedButton2Click(Sender: TObject);
begin
  ExcluirAgenda;
end;

procedure TfrmCadAgenda.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('AGO021', 'IMPRIMIR', '', 'AGENDA',
    CadAgenda.dataSet.FieldByName('COD_AGENDA').AsString, CadAgenda.buscas, true) then
    exit;

  if vDadosIni.vEmp.vUsarAparelho = 'S' then
  begin
    QRLabel10.Caption := 'Equip';
    QRDBText7.DataField := 'COD_EQUIP';
    QRLabel11.Caption := '';
    QRDBText8.DataField := '';
  end
  else
  begin
 		QRLabel10.Caption := 'Chassi';
    QRDBText7.DataField := 'CHASSI';
    QRLabel11.Caption := 'Placa';
    QRDBText8.DataField := 'PLACA';
  end;  
  qrpAgenda.Preview;

end;

procedure TfrmCadAgenda.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  ExcluirAgenda;
end;

procedure TfrmCadAgenda.StringGrid2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
	  CadAgenda._abreResumoAgenda(MonthCalendar1.Date, StringGrid2.cells[0, StringGrid2.Row]);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.StringGrid4Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vEmp.vUsarDomingoAgenda = 'S' then
    begin
      MonthCalendar1.Date := StartOfTheWeek(MonthCalendar1.Date) + StringGrid4.Col - 2;
      AtualizarInformacoes(MonthCalendar1.Date);
    end
    else
    begin
      MonthCalendar1.Date := StartOfTheWeek(MonthCalendar1.Date) + StringGrid4.Col - 1;
      AtualizarInformacoes(MonthCalendar1.Date);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadAgenda.StringGridDia;
begin
  StringGrid2.font.name := 'Dia';
  StringGrid2.RowCount := (cont_horas + 2);
  StringGrid2.cells[1, 0] := '' + DiaSemana(MonthCalendar1.Date) + ' ' +
    DateToStr(MonthCalendar1.Date) + '';
end;

procedure TfrmCadAgenda.StringGridSemana;
var
  i, dia: integer;
  prim_dia: TDate;
  teste: string;
begin
  i := 0;
  StringGrid4.font.name := 'Dia';
  StringGrid4.RowCount := (cont_horas + 2);

  while i <= 6 do
  begin
    StringGrid4.cells[i + 1, 0] := '' + DiaSemana(vData_Inicial + i) + ' ' +
      FormatDateTime('dd/mm/yyyy', vData_Inicial + i) + '';
    i := i + 1;
  end;
end;

procedure TfrmCadAgenda.Timer1Timer(Sender: TObject);
begin
  inherited;
//  if Timer1.Interval = 10000 then
  if PageControl1.ActivePage = tsAgenda then
    AtualizarInformacoes(MonthCalendar1.Date);
end;

procedure TfrmCadAgenda.VerLembreteAgenda;
begin
   if Lembrete.dataSet.IsEmpty then
   exit;

   Application.MessageBox(PChar('' + Lembrete.dataSet.FieldByName('LEMBRETE').AsString + ' - ' +
    Lembrete.dataSet.FieldByName('STATUS_OS').AsString + #13 +
    Lembrete.dataSet.FieldByName('DATA').AsString + '  ' +
    Lembrete.dataSet.FieldByName('HORA').AsString + ''),
    PChar('LEMBRETE'), MB_OK);

   if ((Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'AVISO')
    or (Lembrete.dataSet.FieldByName('STATUS_OS').AsString = 'AGUARDANDO')) then
    exit;

  Lembrete.dataSet.Edit;
  Lembrete.dataSet.FieldByName('ATIVO').AsInteger := 0;
  Lembrete.dataSet.Post;

  Lembrete.Apply;
  Lembrete.CommitaTransacao;

  AtualizarLembrete;
end;

initialization
  RegisterClass(TfrmCadAgenda);
finalization
  UnRegisterClass(TfrmCadAgenda);


end.

