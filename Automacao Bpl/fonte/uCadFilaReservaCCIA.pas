unit uCadFilaReservaCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, UClassesVeiculosCCIA,
  AppEvnts, Menus, ComCtrls, Grids, DBGrids, uCadPadraoModal, DBClient, 
  IBDatabase, uEditHw;

type
  TfrmCadFilaReservaCCIA = class(TfrmCadPadraoM)
    Label_Codigo: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    DBEdit_Codigo: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit10: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBMemo2: TDBMemo;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit17: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    TabSheet6: TTabSheet;
    ScrollBox5: TScrollBox;
    Panel8: TPanel;
    Panel9: TPanel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    pnAvaria: TPanel;
    pnLoja: TPanel;
    pnDemonstracao: TPanel;
    pnFaturadasPrevisao: TPanel;
    Label16: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label11: TLabel;
    TabSheet4: TTabSheet;
    ScrollBox4: TScrollBox;
    Panel4: TPanel;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    DBEdit2: TDBEdit;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    ckDeposito: TCheckBox;
    GroupBox63: TGroupBox;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label17: TLabel;
    GroupBox4: TGroupBox;
    Label24: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    ColorDialog1: TColorDialog;
    imgInformationTipoOP: TImage;
    groupAdicional: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    pnAnterios: TPanel;
    pnDeposito: TPanel;
    ckNovo: TCheckBox;
    ckUsado: TCheckBox;
    pnFuturos: TPanel;
    pnAnteriosFaturadas: TPanel;
    pnFuturosFaturadas: TPanel;
    BitBtn19: TBitBtn;
    Label56: TLabel;
    Label48: TLabel;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    BitBtn16: TBitBtn;
    procedure BitBtn16Click(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3Enter(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure ComboBox12Enter(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure pnDemonstracaoDblClick(Sender: TObject);
    procedure pnLojaDblClick(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ScrollBox2Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_CodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_CodigoExit(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit17Exit(Sender: TObject);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit11Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure habilitarBotoes(pTipo: Integer =0; pTroca: boolean = false);
    procedure FiltrarOrdem(pCodigo, pAnoFab, pAnoMod, pCor: Integer; pTroca: boolean = False);
    procedure AjustarGrid(Grid: TDBGrid);
    procedure SalvarGrid(Grid: TDBGrid);
    procedure SalvarPosicaoGrid;
    procedure RetornaPosicaoGrid;
    procedure DesabilitarCampos(pTipo: Integer);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    cdsColunas: TClientDataSet;
    trans: TIBTransaction;
    nomeDTSEt: string;
    vBuscas: boolean;
    vCriou: SmallInt;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFilaReservaCCIA: TfrmCadFilaReservaCCIA;
  FilaReserva: TFilaReserva;
  vAno: Integer;
  vCodigo, vAnoFab, vAnoMod, vCor, vRecNo, vCodEst: Integer;
  vStatus: string;
  vPesq, vHabilitarDtReserva: boolean;
  vCodigoTemp: Integer;

implementation

uses 
  uDtmAtivo, UDtmVeiculosCCIA, uDataSet_OOP, DB, uDadosIni;
{$R *.dfm}

procedure TfrmCadFilaReservaCCIA.AjustarGrid(Grid: TDBGrid);
var
 I: Integer;
begin
  Exit;
  if vPesq then
    exit;

  if cdsColunas.IsEmpty then
    exit;
  for I := 0 to Grid.Columns.Count - 1 do
  begin
    if trim(Grid.Columns[I].FieldName) <> '' then
    begin
      vPesq := true;
      cdsColunas.FindNearest([vDadosIni.vNomeUsuario, nomeDTSEt+Grid.Columns[I].FieldName]);
      if (cdsColunas.FieldByName('campos').AsString = nomeDTSEt+Grid.Columns[I].FieldName)
        and ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(vDadosIni.vNomeUsuario)) then
          if cdsColunas.FieldByName('largura_exibicao').AsInteger > 0 then
            Grid.Columns[I].Width := cdsColunas.FieldByName('largura_exibicao').AsInteger;
          if cdsColunas.FieldByName('VISIVEL').AsInteger = 0 then
            Grid.Columns[I].Visible := False
          else
          begin
            Grid.Columns[I].Visible := True;
            if cdsColunas.FieldByName('ordem').AsInteger <= Grid.Columns.Count - 1 then
              Grid.Columns[I].Index := cdsColunas.FieldByName('ordem').AsInteger;
          end;
      if (trim(Grid.Columns[I].FieldName) = 'SEL') or (trim(Grid.Columns[I].FieldName) = 'COD_EMPRESA')
      or (trim(Grid.Columns[I].FieldName) = 'ORDEM_TEMP') or (trim(Grid.Columns[I].FieldName) = 'CODIGO')
      or (trim(Grid.Columns[I].FieldName) = 'ORDEM') or (trim(Grid.Columns[I].FieldName) = 'ORDEM_TPV')
      or (trim(Grid.Columns[I].FieldName) = 'ORDEM_CLI') or (trim(Grid.Columns[I].FieldName) = 'PREV_CHEG')
      or (trim(Grid.Columns[I].FieldName) = 'POSICAO') or (trim(Grid.Columns[I].FieldName) = 'ORDEM_CLI') then
        Grid.Columns[I].Visible := False;
    end;
  end;
end;

procedure TfrmCadFilaReservaCCIA.BitBtn13Click(Sender: TObject);
var
 pCodigo, pAnoFab, pAnoMod, pCor: Integer;
begin
  inherited;
  try
    if not vDadosIni.PesqPros('VEI144', 'GRAVAR ORDEM', '', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas, true) then
      exit;

    pCodigo := FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_MODELO').AsInteger;
    pAnoFab := FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_FAB').AsInteger;
    pAnoMod := FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_MOD').AsInteger;
    pCor := FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_COR').AsInteger;
    FilaReserva.vFilaVeiculos.CommitaTransacao;
    vDadosIni.GravaAuditoria('VEI144', 'GRAVAR ORDEM', 'SUCESSO', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas);
    FilaReserva.ChecarLista;
    FiltrarOrdem(pCodigo, pAnoFab, pAnoMod, pCor);
    BitBtn13.Enabled := False;
    BitBtn14.Enabled := False;
    Application.MessageBox(pchar('Processo conclúido'), 'Atenção', 0 + 64);
  except
    FilaReserva.RollBackTransacao;
    vDadosIni.GravaAuditoria('VEI144', 'GRAVAR ORDEM', 'FALHA', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas);
  end;
end;

procedure TfrmCadFilaReservaCCIA.BitBtn14Click(Sender: TObject);
var
 pCodigo, pAnoFab, pAnoMod, pCor: Integer;
begin
  pCodigo := FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_MODELO').AsInteger;
  pAnoFab := FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_FAB').AsInteger;
  pAnoMod := FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_MOD').AsInteger;
  pCor := FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_COR').AsInteger;
  FilaReserva.vFilaVeiculos.RollBackTransacao;
  FilaReserva.vFilaVeiculos.Refresh;
  vDadosIni.GravaAuditoria('VEI144', 'GRAVAR ORDEM', 'CANCELADO', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas);
  FiltrarOrdem(pCodigo, pAnoFab, pAnoMod, pCor);
  BitBtn13.Enabled := False;
  BitBtn14.Enabled := False;
end;

procedure TfrmCadFilaReservaCCIA.BitBtn15Click(Sender: TObject);
var
 I: Integer;
begin
  FilaReserva.vFilaVeiculos.RollBackTransacao;
  FilaReserva.vFilaVeiculos.Refresh;
  DBGrid1.OnTitleClick := DBGrid1TitleClick;
  habilitarBotoes(0);
  vPesq := false;
//  AjustarGrid(DBGrid1);
  for I:= 0 to DBGrid1.Columns.Count - 1 do
  begin
    if (trim(DBGrid1.Columns[I].FieldName) = 'ORDEM_TEMP') or (trim(DBGrid1.Columns[I].FieldName) = 'SEL') then
       DBGrid1.Columns[I].Visible := False;
  end;
  FilaReserva.vFilaVeiculos.dataSet.Filtered := false;
  Panel1.Parent := TabSheet2;
  PageControl1.ActivePage := TabSheet2;
//  FilaReserva.vFilaVeiculos.dataSet.RecNo := vRecNo;
  RetornaPosicaoGrid;
end;

procedure TfrmCadFilaReservaCCIA.BitBtn16Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VEI149', 'RENOVAR', 'RENOVAR', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas, true) then
   exit;
 BitBtn16.SetFocus;
 if not FilaReserva.renovarReserva then
 begin
   setFocusCampoErro(FilaReserva.vNomeCampoErro, FilaReserva.vMensagemErro);
   exit;
 end;
 TabSheet2.Show;
 if Panel1.Visible then
   DBGrid1.SetFocus;
 statusBar(panelConsulta, '');
 if self.TelaCadastro <> 0 then
   close;
end;

procedure TfrmCadFilaReservaCCIA.BitBtn19Click(Sender: TObject);
begin
  inherited;
  FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger := 0;
  DBEdit5Exit(Sender);
  BitBtn4Click(Sender);
end;

procedure TfrmCadFilaReservaCCIA.BitBtn1Click(Sender: TObject);
var
 I: Integer;
 vOrdem, vTemp: string;
begin
  AjustarGrid(DBGrid1);
  try
    if not vDadosIni.PesqPros('VEI137', 'CONSULTA', '', 'FILA_RESERVA_VEIC', '',
      FilaReserva.buscas, true) then
      Exit;
    Screen.Cursor := crHourGlass;  
    inherited;
    CheckBox1Click(Sender);
    FilaReserva.vFilaVeiculos.vCons.campo := ComboBox1.Text;
//    FilaReserva.vFilaVeiculos.vCons.ordem := ComboBox2.Text;
    FilaReserva.vFilaVeiculos.vCons.condicao := ComboBox3.Text;
    FilaReserva.vFilaVeiculos.vCons.valor := MaskEdit3.Text;
    FilaReserva.vFilaVeiculos.vCons.dataIni := MaskEdit1.Text;
    FilaReserva.vFilaVeiculos.vCons.dataFim := MaskEdit2.Text;
    FilaReserva.vFilaVeiculos.vCons.porData := MaskEdit1.Visible;

    FilaReserva.vFilaVeiculos.vCons.campoAd := ComboBox11.Text;
    FilaReserva.vFilaVeiculos.vCons.valorAd := MaskEdit7.Text;
    FilaReserva.vFilaVeiculos.vCons.dataIniAd := MaskEdit9.Text;
    FilaReserva.vFilaVeiculos.vCons.dataFimAd := MaskEdit8.Text;
    FilaReserva.vFilaVeiculos.vCons.condicaoAd := ComboBox12.Text;
    FilaReserva.vFilaVeiculos.vCons.porDataAd := MaskEdit9.Visible;
    if (not ckNovo.Checked) and (not ckUsado.Checked) and (not ckDeposito.Checked) then
      ckNovo.Checked := True;
    FilaReserva.vFilaVeiculos.vCons.novo := ckNovo.Checked;
    FilaReserva.vFilaVeiculos.vCons.usado := ckUsado.Checked;
    FilaReserva.vFilaVeiculos.vCons.deposito := ckDeposito.Checked;
    FilaReserva.vFilaVeiculos.vCons.adicional := CheckBox1.Checked;
    vBuscas := true;
    FilaReserva.vFilaVeiculos.consulta;
    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if DBGrid1.CanFocus then
     DBGrid1.SetFocus;
  finally
  	gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFilaReservaCCIA.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
   try
    if not vDadosIni.PesqPros('VEI138', 'INSERIR', '', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas, true) then
    	Exit;

    if not FilaReserva.Insert then
      Exit;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    inherited;
    BitBtn16.Enabled := false;
    BitBtn19.Enabled := false;
    DesabilitarCampos(0);
    TabSheet3.Caption := 'Incluir Controle de Estoque';
    TabSheet3.TabVisible := true;
    TabSheet3.Show;
    BitBtn19.Enabled := false;
    if DBEdit_Codigo.CanFocus then
      DBEdit_Codigo.SetFocus;

  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    FilaReserva.Cancel;
    FilaReserva.RollBackTransacao;
  end;
end;

procedure TfrmCadFilaReservaCCIA.BitBtn4Click(Sender: TObject);
var
 vEdicao: boolean;
 vcodmodelo, vanofab, vanomod, vcodcor: Integer;
 vprevcheg: string;
begin
   BitBtn4.SetFocus;
   vcodmodelo := FilaReserva.dataSet.FieldByName('COD_MODELO').AsInteger;
   vanofab := FilaReserva.dataSet.FieldByName('ANO_FAB').AsInteger;
   vanomod := FilaReserva.dataSet.FieldByName('ANO_MOD').AsInteger;
   vcodcor := FilaReserva.dataSet.FieldByName('COD_COR').AsInteger;
   vprevcheg := FilaReserva.dataSet.FieldByName('PREV_CHEG').AsString;
   vEdicao := FilaReserva.dataSet.State = dsEdit;
   if not FilaReserva.post then
   begin
     PageControl3.ActivePage := TabSheet3;
     setFocusCampoErro(FilaReserva.vNomeCampoErro, FilaReserva.vMensagemErro);
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
       if FilaReserva.Insert then
       begin
         PageControl3.ActivePage := TabSheet3;
         FilaReserva.dataSet.FieldByName('COD_MODELO').AsInteger := vcodmodelo;
         FilaReserva.dataSet.FieldByName('ANO_FAB').AsInteger := vanofab;
         FilaReserva.dataSet.FieldByName('ANO_MOD').AsInteger := vanomod;
         FilaReserva.dataSet.FieldByName('COD_COR').AsInteger := vcodcor;
         FilaReserva.dataSet.FieldByName('PREV_CHEG').AsString := vprevcheg;
         FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger := 0;
         DBEdit5Exit(Sender);
         if DBEdit_Codigo.CanFocus then
          DBEdit_Codigo.SetFocus;
       end;
     end
     else
       inherited;
   end;
   if (TelaCadastro <> 7) then
     if vEdicao then
       FilaReserva.vFilaVeiculos.dataSet.RecNo := vRecNo;
end;

procedure TfrmCadFilaReservaCCIA.BitBtn5Click(Sender: TObject);
begin
  inherited;
  try
    FilaReserva.Cancel;
    FilaReserva.RollBackTransacao;
    if FilaReserva.dataSet.State = dsEdit then
      FilaReserva.vFilaVeiculos.dataSet.RecNo := vRecNo;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFilaReservaCCIA.BitBtn7Click(Sender: TObject);
begin
  if not FilaReserva.vFilaVeiculos.TrocarVendedores then
    exit;

  Application.MessageBox(pchar('Processo conclúido'), 'Atenção', 0 + 64);
end;

procedure TfrmCadFilaReservaCCIA.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 219
  else
    GroupBox3.Height := 97;

  groupAdicional.Visible := CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
  if ComboBox11.CanFocus then  
    ComboBox11.SetFocus;
end;

procedure TfrmCadFilaReservaCCIA.ComboBox11Exit(Sender: TObject);
var
  I: Integer;
  vCampoAdcional: string;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
    if ComboBox11.ItemIndex<0 then
      ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if ComboBox11.CanFocus then
      ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        vCampoAdcional := DBGrid1.DataSource.dataSet.Fields.Fields[i].FieldName;

        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
    if MaskEdit9.CanFocus then
      MaskEdit9.SetFocus
    else if MaskEdit7.CanFocus then
      MaskEdit7.SetFocus;
end;

procedure TfrmCadFilaReservaCCIA.ComboBox12Enter(Sender: TObject);
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

procedure TfrmCadFilaReservaCCIA.ComboBox12Exit(Sender: TObject);
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
        break;
      end;
    end;
  end;
  if BitBtn1.CanFocus then
    BitBtn1.SetFocus;
end;

procedure TfrmCadFilaReservaCCIA.DBComboBox1Exit(Sender: TObject);
var
 vTipoRes, vTipoResOld, vGrupoCotaRD, vDataVenc, vHoraVenc, vDataAssembleia: Variant;
begin
  inherited;
//  if trim(FilaReserva.dataSet.FieldByName('TIPO_RES').AsString) = '' then
//    Exit;
  FilaReserva.buscas.Close;
  FilaReserva.buscas.SQL.Text := ' select * from tipo_reserva res ' +
   ' where res.tipo = ''VEI'' and res.sigla = :sigla ';
  FilaReserva.buscas.ParamByName('SIGLA').AsString := trim(FilaReserva.dataSet.FieldByName('TIPO_RES').AsString);
  FilaReserva.buscas.Open;

  if FilaReserva.buscas.IsEmpty then
  begin
    Label16.Visible := False;
    DBEdit2.Visible := False;
    Label15.Visible := False;
    DBEdit3.Visible := False;
    Exit;
  end;
  if trim(FilaReserva.dataSet.FieldByName('SIT_RES').AsString) = '' then  
    FilaReserva.dataSet.FieldByName('SIT_RES').AsString := 'V';
  Label16.Visible := trim(FilaReserva.buscas.FieldByName('TIPO_RES').AsString) = 'C';
  DBEdit2.Visible := trim(FilaReserva.buscas.FieldByName('TIPO_RES').AsString) = 'C';
  Label15.Visible := trim(FilaReserva.buscas.FieldByName('TIPO_RES').AsString) = 'C';
  DBEdit3.Visible := trim(FilaReserva.buscas.FieldByName('TIPO_RES').AsString) = 'C';
  DBEdit3.Enabled := (trim(FilaReserva.buscas.FieldByName('TIPO_RES').AsString) = 'C') and (vHabilitarDtReserva);

  if trim(FilaReserva.dataSet.FieldByName('STATUS_RES').AsString) = 'S' then
    exit;

  if not vDadosIni.RetornaDataHoraVenc(FilaReserva.buscas,
    'FILA',
    FilaReserva.dataSet.FieldByName('TIPO_RES').AsString,
    FilaReserva.dataSet.FieldByName('GRUPO_COTA_RD').AsString,
    FilaReserva.dataSet.FieldByName('DATA_RES').AsDateTime,
    FilaReserva.dataSet.FieldByName('HORA_RES').AsString,
    FilaReserva.dataSet.FieldByName('DATA_ASSEMBLEIA').AsDateTime,
    vTipoRes, vGrupoCotaRD, vDataVenc, vHoraVenc, vDataAssembleia) then
    	exit;

  if not (FilaReserva.dataSet.FieldByName('DATA_VENC_RES').IsNull) then
    if (vDataVenc <= FilaReserva.dataSet.FieldByName('DATA_VENC_RES').AsDateTime) then
      exit;

  FilaReserva.dataSet.FieldByName('DATA_VENC_RES').Value := vDataVenc;
  FilaReserva.dataSet.FieldByName('HORA_VENC_RES').Value := vHoraVenc;
end;

procedure TfrmCadFilaReservaCCIA.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if FilaReserva.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
  begin
    if not FilaReserva.vClientesVeic.abreClientes(FilaReserva.dataSet.FieldByName('COD_CLIENTE').asinteger) then
    begin
      Application.MessageBox('Cliente não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if DBEdit11.CanFocus then
        DBEdit11.SetFocus;
    end
    else
    begin
      FilaReserva.dataSet.FieldByName('NOME_RES').AsString := FilaReserva.vClientesVeic.dataSet.FieldByName('NOME_CLIENTE').AsString;
      if (vDadosIni.apenasNumeros(FilaReserva.dataSet.FieldByName('FONE_RES').AsString) <> '')
        and (FilaReserva.vCodCliente > 0)
        and (FilaReserva.vCodCliente <> FilaReserva.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
      begin
         if Application.MessageBox(pchar('Deseja carregar o telefone do cadastro do cliente?'), 'Atenção',
          MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
           FilaReserva.dataSet.FieldByName('FONE_RES').AsString := vDadosIni.apenasNumeros(FilaReserva.vClientesVeic.dataSet.FieldByName('FONE_CLIENTE').AsString);
      end
      else if trim(FilaReserva.dataSet.FieldByName('FONE_RES').AsString) = '' then
        FilaReserva.dataSet.FieldByName('FONE_RES').AsString := vDadosIni.apenasNumeros(FilaReserva.vClientesVeic.dataSet.FieldByName('FONE_CLIENTE').AsString);
      FilaReserva.vCodCliente := FilaReserva.dataSet.FieldByName('COD_CLIENTE').AsInteger;
    end;
  end;
  DBEdit12.ReadOnly := (FilaReserva.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0);
end;

procedure TfrmCadFilaReservaCCIA.DBEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      FilaReserva.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadFilaReservaCCIA.DBEdit17Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if FilaReserva.dataSet.FieldByName('COD_COR').AsInteger > 0 then
  begin
    if not FilaReserva.vCoresVeic.buscarCor(FilaReserva.dataSet.FieldByName('COD_COR').asinteger) then
    begin
      Application.MessageBox('Cor não encontrada!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if DBEdit17.CanFocus then
        DBEdit17.SetFocus;
    end
  end;
end;

procedure TfrmCadFilaReservaCCIA.DBEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      FilaReserva.dataSet.FieldByName('COD_COR').AsString := vDadosIni.pesquisaRapida('CODIGO_CORFAB');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;


procedure TfrmCadFilaReservaCCIA.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      FilaReserva.dataSet.FieldByName('COD_COND_PAG').AsString := vDadosIni.pesquisaRapida('COND_PAG');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadFilaReservaCCIA.DBEdit3Enter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(DBEdit3.Handle, PChar('Data da assembleia' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TfrmCadFilaReservaCCIA.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
  	try
      FilaReserva.dataSet.FieldByName('DATA_ASSEMBLEIA').EditMask := '';
      FilaReserva.dataSet.FieldByName('DATA_ASSEMBLEIA').Value := Null;
      DBEdit3.Text := '99/99/9999';
      DBEdit3.Clear;
    finally
      FilaReserva.dataSet.FieldByName('DATA_ASSEMBLEIA').EditMask := '!99/99/0000;1;_';
    end;
  end;
end;

procedure TfrmCadFilaReservaCCIA.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0 then
  begin
    if not FilaReserva.vColaboradorVeic.buscarColaborador(FilaReserva.dataSet.FieldByName('COD_VENDEDOR').asinteger) then
    begin
      Application.MessageBox('Vendedor não encontrado', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if DBEdit5.CanFocus then
        DBEdit5.SetFocus;
      exit;
    end;
  end;

//  if FilaReserva.vCodVendedor <> FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger then
//  begin
//    if (FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0)
//    and (FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger <> vDadosIni.vCodUsuario) then
//    begin
//      if Application.MessageBox('Vendedor informado é diferente do usuário logado, deseja continuar?',
//        'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
//      begin
//        if DBEdit5.CanFocus then
//          DBEdit5.SetFocus;
//        exit;
//      end;
//
//      if not vDadosIni.PesqPros('VEI159', 'VALIDAR', '', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas, true) then
//      begin
//        if DBEdit5.CanFocus then
//          DBEdit5.SetFocus;
//        exit;
//      end;
//    end;
//  end;

  FilaReserva.vCodVendedor := FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
  FilaReserva.vNomeVendedor := trim(FilaReserva.dataSet.FieldByName('NOME_VENDEDOR').AsString);
  FilaReserva.atualizarDados;

  DBEdit11.Enabled := FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0;
  DBEdit12.Enabled := FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0;
  DBEdit13.Enabled := FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0;
  DBComboBox1.Enabled := FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0;
  DBComboBox2.Enabled := FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0;
  BitBtn19.Enabled := (FilaReserva.dataSet.State = dsEdit)
    and (FilaReserva.vCodVendedorOld > 0) and (FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0);
end;

procedure TfrmCadFilaReservaCCIA.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.pesquisaRapida('COD_VENDEDOR');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadFilaReservaCCIA.DBEdit_CodigoExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if FilaReserva.dataSet.FieldByName('COD_MODELO').AsInteger > 0 then
  begin
    if not FilaReserva.vModVeic.buscarModelo(FilaReserva.dataSet.FieldByName('COD_MODELO').AsInteger) then
    begin
      Application.MessageBox('Modelo de veículo não encontrado!', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      if DBEdit_Codigo.CanFocus then
        DBEdit_Codigo.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmCadFilaReservaCCIA.DBEdit_CodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      FilaReserva.dataSet.FieldByName('COD_MODELO').AsString := vDadosIni.pesquisaRapida('TIPMODELO');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadFilaReservaCCIA.DBGrid1DblClick(Sender: TObject);
begin
 if PageControl1.ActivePage = TabSheet4 then
  if not FilaReserva.vFilaVeiculos.dataSet.IsEmpty then
    FilaReserva.vFilaVeiculos._marcaDesmarcaLinha;
end;

procedure TfrmCadFilaReservaCCIA.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (trim(Column.Field.Dataset.FieldbyName('STATUS_AVARIAS').AsString) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnAvaria.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
      if (trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString) = 'S') then
        TDBGrid(sender).canvas.Font.Style := TDBGrid(sender).canvas.Font.Style + [fsBold];
    end;
  end
  else if (trim(Column.Field.Dataset.FieldbyName('TPV').AsString) = 'FILA')
    or (trim(Column.Field.Dataset.FieldbyName('TPV').AsString) = 'TRANSITO') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      if ((Column.Field.Dataset.FieldbyName('ANO_FAB').AsInteger < vAno)
      or (Column.Field.Dataset.FieldbyName('ANO_MOD').AsInteger < vAno)) then
        TDBGrid(sender).canvas.brush.color := pnAnteriosFaturadas.Color
      else if ((Column.Field.Dataset.FieldbyName('ANO_FAB').AsInteger > vAno)
      or (Column.Field.Dataset.FieldbyName('ANO_MOD').AsInteger > vAno)) then
        TDBGrid(sender).canvas.brush.color := pnFuturosFaturadas.Color
      else
        TDBGrid(sender).canvas.brush.color := pnFaturadasPrevisao.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
      if (trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString) = 'S') then
        TDBGrid(sender).canvas.Font.Style := TDBGrid(sender).canvas.Font.Style + [fsBold];
    end;
  end
  else if ((Column.Field.Dataset.FieldbyName('ANO_FAB').AsInteger < vAno)
   or (Column.Field.Dataset.FieldbyName('ANO_MOD').AsInteger < vAno))
   and (trim(Column.Field.Dataset.FieldbyName('TPV').AsString) <> '') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnAnterios.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
      if (trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString) = 'S') then
        TDBGrid(sender).canvas.Font.Style := TDBGrid(sender).canvas.Font.Style + [fsBold];
    end;
  end
  else if ((Column.Field.Dataset.FieldbyName('ANO_FAB').AsInteger > vAno)
   or (Column.Field.Dataset.FieldbyName('ANO_MOD').AsInteger > vAno))
   and (trim(Column.Field.Dataset.FieldbyName('TPV').AsString) <> '') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnFuturos.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
      if (trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString) = 'S') then
        TDBGrid(sender).canvas.Font.Style := TDBGrid(sender).canvas.Font.Style + [fsBold];
    end;
  end
  else if (trim(Column.Field.Dataset.FieldbyName('TPV').AsString) = 'LOJA')
  or (trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnLoja.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
      if (trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString) = 'S') then
        TDBGrid(sender).canvas.Font.Style := TDBGrid(sender).canvas.Font.Style + [fsBold];
    end;
  end
  else if (trim(Column.Field.Dataset.FieldbyName('TPV').AsString) = 'DEPOSITO') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnDeposito.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
      if (trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString) = 'S') then
        TDBGrid(sender).canvas.Font.Style := TDBGrid(sender).canvas.Font.Style + [fsBold];
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadFilaReservaCCIA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if PageControl1.ActivePage = TabSheet2 then
  begin
    if (key = VK_RETURN) then
    	SpeedButton1Click(Sender)
    else if key = VK_DELETE then
      SpeedButton2Click(Sender)
    else if (key = VK_INSERT) then
      BitBtn3Click(Sender)
    else if (Key = VK_F5) then
    begin
      try
        Screen.Cursor := crHourGlass;
        FilaReserva.vFilaVeiculos.Refresh;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
  else if PageControl1.ActivePage = TabSheet4 then
  begin
    if Key = VK_SPACE then
    begin
     if not FilaReserva.vFilaVeiculos.dataSet.IsEmpty then
       FilaReserva.vFilaVeiculos._marcaDesmarcaLinha;
    end;
  end;
end;

procedure TfrmCadFilaReservaCCIA.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  DBEdit5Exit(Sender);
  if DBEdit11.CanFocus then
    DBEdit11.SetFocus;  
end;

procedure TfrmCadFilaReservaCCIA.DesabilitarCampos(pTipo: Integer);
begin
  DBEdit_Codigo.Enabled := pTipo = 0;
  DBLookupComboBox5.Enabled := pTipo = 0;
  DBEdit8.Enabled := pTipo = 0;
  DBEdit10.Enabled := pTipo = 0;
  DBEdit17.Enabled := pTipo = 0;
  DBLookupComboBox3.Enabled := pTipo = 0;
end;

procedure TfrmCadFilaReservaCCIA.FiltrarOrdem(pCodigo, pAnoFab, pAnoMod, pCor: Integer; pTroca: boolean = False);
var
 vFiltro: string;
begin
//  if pTroca then
//    vFiltro := 'CILINDRADA;DESCRICAO;DESCRICAO_COR;ANO_FAB;ANO_MOD;ORDEM_CLI;ORDEM_TPV;PREV_CHEG;ORDEM'
//  else
//    vFiltro := 'CILINDRADA;DESCRICAO;DESCRICAO_COR;ANO_FAB;ANO_MOD;ORDEM_TPV;PREV_CHEG;ORDEM';
//  vFiltro := 'CILINDRADA;DESCRICAO;ANO_FAB;ANO_MOD;DESCRICAO_COR;ORDEM_TPV;DATA_CH_NOTA;DATA_TRANS_NOTA;ORDEM';
//  FilaReserva.vFilaVeiculos.dataSet.IndexFieldNames := vFiltro;  

  FilaReserva.vFilaVeiculos.dataSet.Filtered := false;
  if pTroca then
    FilaReserva.vFilaVeiculos.dataSet.Filter :=
     ' COD_MODELO = ' + IntToStr(pCodigo) +
     ' AND ANO_FAB = ' + IntToStr(pAnoFab) +
     ' AND ANO_MOD = ' + IntToStr(pAnoMod) +
     ' AND COD_COR = ' + IntToStr(pCor)//  AND TRIM(TPV) <> ''DEPOSITO'''
  else
    FilaReserva.vFilaVeiculos.dataSet.Filter :=
     ' COD_MODELO = ' + IntToStr(pCodigo) +
     ' AND ANO_FAB = ' + IntToStr(pAnoFab) +
     ' AND ANO_MOD = ' + IntToStr(pAnoMod) +
     ' AND COD_COR = ' + IntToStr(pCor) +
     ' AND TRIM(TPV) = ''FILA''';
  FilaReserva.vFilaVeiculos.dataSet.Filtered := true;
  FilaReserva.vFilaVeiculos.Refresh;
  FilaReserva.PreencherDtsetTemp;
end;

procedure TfrmCadFilaReservaCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;

  FilaReserva.vFilaVeiculos.dataSet.Filtered := false;
  SalvarGrid(DBGrid1);
  if (FilaReserva <> nil) then
  begin
    FilaReserva.Cancel;
    FilaReserva.RollBackTransacao;
  end;
  FilaReserva.Free;
  FilaReserva := nil;

  Action := CaFree;
  if (frmCadFilaReservaCCIA <> nil) then
    frmCadFilaReservaCCIA := nil;
end;

procedure TfrmCadFilaReservaCCIA.FormCreate(Sender: TObject);
var
 I: Integer;
begin
	vCriou := 0;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CONSORCIOSEMASSEMBLEIA' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    vDadosIni.vPesquisa := '';
    if frmCadFilaReservaCCIA = nil then
	    frmCadFilaReservaCCIA := TfrmCadFilaReservaCCIA.Create(Self);
  end
  else if trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1)) = 'FILARESERVAVEIC' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 7;  
    vDadosIni.vModalOuChild := 'M';
    vCodigoTemp := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    vDadosIni.vPesquisa := '';
    if frmCadFilaReservaCCIA = nil then
	    frmCadFilaReservaCCIA := TfrmCadFilaReservaCCIA.Create(Self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;
  TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet6.TabVisible := False;

  FilaReserva := TFilaReserva.create;
  FilaReserva._AbreFilaReserva;
  FilaReserva.verificatiporeserva(1, DBComboBox1, 'VEI', '');
  vDadosIni.vPesquisa := '';
  vBuscas := false;
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadFilaReservaCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PageControl1.ActivePage = TabSheet2  then
  begin
     if Key = VK_F11 then
       ckNovo.Checked := not ckNovo.Checked
     else if Key = VK_F12 then
       ckUsado.Checked := not ckUsado.Checked
     else if Key = VK_F7 then
       ckDeposito.Checked := not ckDeposito.Checked
     else if Key = VK_INSERT then
       BitBtn3Click(Sender);
  end;
end;

procedure TfrmCadFilaReservaCCIA.FormShow(Sender: TObject);
var
 pIntTemp: Integer;
begin
	if not Self.Enabled then
  	Exit;

  vPesq := false;
  vDadosIni.fechaStatusProcessamento;
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := DtmVeiculosCCIA.dsFilaVeiculos;
    if vCriou = 0 then
    begin
      inherited;
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
      nomeDTSEt := 'cdsFilaVeiculos';
      cdsColunas := vDadosIni.dataSetCol;
      trans := vDadosIni.transacaoCol;
    end;
  end;

  leConfiguracoesFormRegistro;

  if (TelaCadastro = 7) then
  begin
    if not FilaReserva.vFilaVeiculos.abreFilaVeiculos(vCodigoTemp, 'FILA') then
    begin
    	frmCadFilaReservaCCIA.fechar := True;
      PostMessage(frmCadFilaReservaCCIA.Handle, WM_CLOSE, 0, 0);
      Exit;
    end;
    SpeedButton1Click(Sender);
  end;

  vDadosIni.vInibeMensPesqPros := 'S';
  DBComboBox1.Enabled := vDadosIni.PesqPros('VEI100', 'HABILITAR', '', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas, true);
  vDadosIni.vInibeMensPesqPros := 'S';
  FilaReserva.vRetirar := vDadosIni.PesqPros('VEI163', 'HABILITAR', '', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas, false);
  vDadosIni.vInibeMensPesqPros := 'S';
  vHabilitarDtReserva := vDadosIni.PesqPros('VEI165', 'HABILITAR', '', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas, false);
  BitBtn19.Visible := FilaReserva.vRetirar;
  vDadosIni.vInibeMensPesqPros := 'S';
  DBEdit1.Enabled := vDadosIni.PesqPros('VEI157', 'HABILITAR', '', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas, true);
  vDadosIni.vInibeMensPesqPros := 'S';
  if vDadosIni.PesqPros('VEI158', 'HABILITAR', '', 'FILA_RESERVA_VEIC', '', FilaReserva.buscas, true) then
  begin
    DBEdit5.Enabled := true;
    DBLookupComboBox2.Enabled := true;
  end
  else
  begin
    DBEdit5.Enabled := false;
    DBLookupComboBox2.Enabled := false;
  end;

  habilitarBotoes(0);
  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "VEI100" HABILITAR CAMPO TIPO DE RESERVA' + #13 +
    'Processo "VEI146" RESERVAR VEICULO PARA MESMO VENDEDOR MAIS DE UMA VEZ' + #13 +
    'Processo "VEI147" RESERVAR VEICULO PARA MESMO CLIENTE MAIS DE UMA VEZ' + #13 +
    'Processo "VEI152" RETIRAR RESERVA DE OUTRO VENDEDOR' + #13 +
    'Processo "VEI153" RENOVAR RESERVA DE OUTRO VENDEDOR' + #13 +
    'Processo "VEI154" EXCLUIR RESERVA DE OUTRO VENDEDOR' + #13 +
    'Processo "VEI155" VALIDAR CAMPO TELEFONE AO FAZER RESERVA' + #13 +
    'Processo "VEI156" VALIDAR CAMPO VENDEDOR NA FILA RESERVA' + #13 +
    'Processo "VEI157" HABILITAR CAMPO PREV. RESERVA NA FILA RESERVA' + #13 +
    'Processo "VEI158" HABILITAR CAMPO VENDEDOR' + #13 +
    'Processo "VEI159" EDITAR RESERVA DE OUTRO VENDEDOR' + #13 +
    'Processo "VEI160" RENOVAR RESERVA DE VEICULO MAIS DE UMA VEZ' + #13 +
    'Processo "VEI161" ALTERAR ORDEM DA FILA PARA VENDEDOR QUE NAO SE ENCONTRA FRENTE' + #13 +
    'Processo "VEI162" CONFIGURAR CORES DO CONTROLE DE ESTOQUE' +#13 +
    'Processo "VEI163" HABILITAR BOTAO RETIRAR RESERVA NA FILA RESERVA' + #13 +
    'Processo "VEI165" HABLITAR CAMPO DATA DA ASSEMBLEIA' + #13 +
    'Processo "VEI166" TESTAR CAMPO DATA DA ASSEMBLEIA AO FAZER RESERVA'  + #13 +
    'Processo "VEI167" PERMITIR RESERVA DO TIPO MONTAGEM AO FAZER PRIMEIRA RESERVA';

  imgInformationTipoOP.Hint := 'TIPO OP (ENTRADA/SAÍDA)' + #13 + #13 +
    'A - ATIVO IMOBILIZADO' + #13 +
    'C - CONSIGNAÇÃO' + #13 +
    'D - DEMONSTRAÇÃO DE MERCADORIAS' + #13 +
    'E - DEVOLUÇÃO' + #13 +
    'I - INTERMEDIAÇÃO' + #13 +
    'O - OUTRAS OPERAÇÕES' + #13 +
    'R - RETORNO DE DEMONSTRAÇÃO' + #13 +
    'T - TRANSFERÊNCIA' + #13 +
    'V - MERCADORIA ADQUIRIDA';
  SpeedButton4.Visible := False;
  if trim(vDadosIni.vEmp.vMascaraGrupoCotaRd) <> '' then
    FilaReserva.dataSet.FieldByName('GRUPO_COTA_RD').EditMask := vDadosIni.vEmp.vMascaraGrupoCotaRd;
  vAno := StrToInt(FormatDateTime('yyyy', vDadosIni.getDataBanco(FilaReserva.buscas)));

  FilaReserva.vFilaVeiculos.definirCoresConsulta;
  if vDadosIni.vMensagemConsorcio = 'S' then
    if not (vDadosIni.VerificarDataAssembleia(FilaReserva.buscas))then
      Application.MessageBox('Reservas de consorcio sem data da assembleia definida.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);

  if vCriou = 0 then
  begin
  	CheckBox1Click(Sender);
    vCriou := 1;
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadFilaReservaCCIA.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
  	_GravaConfiguracoesBoolean('ckNovo', ckNovo.Checked);
    _GravaConfiguracoesBoolean('ckUsado', ckUsado.Checked);
    _GravaConfiguracoesBoolean('ckDeposito', ckDeposito.Checked);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
  end;
end;

procedure TfrmCadFilaReservaCCIA.GroupBox1Enter(Sender: TObject);
begin
  inherited;
  DBComboBox1Exit(Sender);
  DBEdit5Exit(Sender);
end;

procedure TfrmCadFilaReservaCCIA.habilitarBotoes(pTipo: Integer = 0; pTroca: boolean = false);
var
 I: Integer;
begin
  if pTipo = 0 then
  begin
    SpeedButton1.Visible := True;
    SpeedButton2.Visible := True;
    SpeedButton12.Visible := True;
    SpeedButton8.Visible := True;
    SpeedButton11.Visible := True;
    SpeedButton23.Visible := True;
    SpeedButton24.Visible := True;
    SpeedButton26.Visible := True;
    SpeedButton3.Visible := True;
    SpeedButton6.Visible := False;
    SpeedButton7.Visible := False;
//    FilaReserva.vFilaVeiculos.dataSet.FieldByName('ORDEM_TEMP').Visible := False;
//    FilaReserva.vFilaVeiculos.dataSet.FieldByName('ORDEM_TEMP').Tag := 1;
//    FilaReserva.vFilaVeiculos.dataSet.FieldByName('SEL').Visible := False;
//    FilaReserva.vFilaVeiculos.dataSet.FieldByName('SEL').Tag := 1;
    Label11.Visible := False;
  end
  else
  begin
    SpeedButton1.Visible := False;
    SpeedButton2.Visible := False;
    SpeedButton12.Visible := False;
    SpeedButton8.Visible := False;
    SpeedButton11.Visible := False;
    SpeedButton23.Visible := False;
    SpeedButton24.Visible := False;
    SpeedButton26.Visible := False;
    SpeedButton3.Visible := False;
    if pTroca then
    begin
//      FilaReserva.vFilaVeiculos.dataSet.FieldByName('ORDEM_TEMP').Visible := False;
//      FilaReserva.vFilaVeiculos.dataSet.FieldByName('ORDEM_TEMP').Tag := 1;
//      FilaReserva.vFilaVeiculos.dataSet.FieldByName('SEL').Visible := True;
//      FilaReserva.vFilaVeiculos.dataSet.FieldByName('SEL').Tag := 0;
      SpeedButton6.Visible := False;
      SpeedButton7.Visible := False;
      Label11.Visible := True;
    end
    else
    begin
//      FilaReserva.vFilaVeiculos.dataSet.FieldByName('ORDEM_TEMP').Visible := True;
//      FilaReserva.vFilaVeiculos.dataSet.FieldByName('ORDEM_TEMP').Tag := 0;
//      FilaReserva.vFilaVeiculos.dataSet.FieldByName('SEL').Visible := False;
//      FilaReserva.vFilaVeiculos.dataSet.FieldByName('SEL').Tag := 1;
      SpeedButton6.Visible := True;
      SpeedButton7.Visible := True;
      Label11.Visible := False;
    end;
  end;
end;

procedure TfrmCadFilaReservaCCIA.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
    ckNovo.Checked := _LerConfiguracoesRegistroBoolean(ckNovo.Name);
    ckUsado.Checked := _LerConfiguracoesRegistroBoolean(ckUsado.Name);
    ckDeposito.Checked := _LerConfiguracoesRegistroBoolean(ckDeposito.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
 	  CheckBox1Click(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name)) <> '' then
    	ComboBox11.Text   := _LerConfiguracoesRegistroString(ComboBox11.Name);
    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
 			if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
      	ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    ComboBox11Exit(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name)) <> '' then
    	ComboBox12.Text       := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text        := _LerConfiguracoesRegistroString(MaskEdit7.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text        := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text        := _LerConfiguracoesRegistroString(MaskEdit9.Name);
  end;
end;

procedure TfrmCadFilaReservaCCIA.pnLojaDblClick(Sender: TObject);
var
 pCor: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('VEI162', 'CONFIGURAR', '', 'FILA_RESERVA_VEIC', '',
      FilaReserva.buscas, true) then
     Exit;

    pCor := TPanel(Sender).Color;
    ColorDialog1.Color := pCor;
    if ColorDialog1.Execute then
      TPanel(Sender).Color := ColorDialog1.Color;
    FilaReserva.vFilaVeiculos.definirCoresConsulta(1);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFilaReservaCCIA.pnDemonstracaoDblClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('VEI162', 'CONFIGURAR', '', 'FILA_RESERVA_VEIC', '',
        FilaReserva.buscas, true) then
       Exit;

    if Application.MessageBox('Deseja usar cores padrão de marcação?',
        'Alterar Cores', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
      exit;
    pnAnterios.Color := clYellow;
    pnAvaria.Color := TColor($007979FF);
    pnDemonstracao.Color := clBlack;
    pnDeposito.Color := TColor($009BFFB5);
    pnFaturadasPrevisao.Color := clWhite;
    pnFuturos.Color := TColor($00FFD9B3);
    pnLoja.Color := clGreen;
    pnAnteriosFaturadas.Color := TColor($00AAFFFF);
    pnFuturosFaturadas.Color := TColor($00FFEBD9);
    FilaReserva.vFilaVeiculos.definirCoresConsulta(1);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFilaReservaCCIA.RetornaPosicaoGrid;
begin
 if not FilaReserva.vFilaVeiculos.dataSet.IsEmpty then 
   if trim(vStatus) = 'FILA' then
     FilaReserva.vFilaVeiculos.dataSet.Locate('CODIGO', VarArrayOf([vCodEst]), [loPartialKey])
   else
     FilaReserva.vFilaVeiculos.dataSet.Locate('COD_ESTMOTO', VarArrayOf([vCodEst]), [loPartialKey])
end;

procedure TfrmCadFilaReservaCCIA.SalvarGrid(Grid: TDBGrid);
var
 I: Integer;
begin
  Exit;
//  if Grid.Columns.Count > 0 then
//   if Grid.Columns[0].FieldName = '' then
//    exit;
  if not vBuscas then
   exit;

  for I := 0 to Grid.Columns.Count - 1 do
  begin
    cdsColunas.FindNearest([vDadosIni.vNomeUsuario, nomeDTSEt + Grid.Columns[I].FieldName]);
    if (cdsColunas.FieldByName('campos').AsString = nomeDTSEt + Grid.Columns[I].FieldName) and
      ((trim(cdsColunas.FieldByName('USUARIO').AsString)) = trim(vDadosIni.vNomeUsuario)) then
    begin
      cdsColunas.Edit;
      if Grid.Columns[I].Visible then
      begin
        cdsColunas.FieldByName('visivel').AsInteger := 1;
        cdsColunas.FieldByName('ordem').AsInteger := Grid.Columns[I].Index;
      end
      else
      begin
        cdsColunas.FieldByName('visivel').AsInteger := 0;
        cdsColunas.FieldByName('ordem').AsInteger := -1;
      end;
      cdsColunas.FieldByName('largura_exibicao').AsInteger := Grid.Columns[I].Width;
      cdsColunas.Post;
    end
    else
    begin
      if (Grid.Columns[I].FieldName) <> '' then
      begin
        cdsColunas.Insert;
        cdsColunas.FieldByName('usuario').AsString := trim(vDadosIni.vNomeUsuario);
        cdsColunas.FieldByName('componente').AsString := nomeDTSEt;
        cdsColunas.FieldByName('campos').AsString := nomeDTSEt + Grid.Columns[I].FieldName;
        if Grid.Columns[I].Visible then
        begin
          cdsColunas.FieldByName('visivel').AsInteger := 1;
          cdsColunas.FieldByName('ordem').AsInteger := Grid.Columns[I].Index;
        end
        else
        begin
          cdsColunas.FieldByName('visivel').AsInteger := 0;
          cdsColunas.FieldByName('ordem').AsInteger := -1;
        end;
        cdsColunas.FieldByName('largura_exibicao').AsInteger := Grid.Columns[I].Width;
        cdsColunas.Post;
//        cdsColunas.ApplyUpdates(-1);
      end;
    end;
  end;

  if cdsColunas.ChangeCount > 0 then
  begin
    cdsColunas.ApplyUpdates(-1);
    trans.Commit;
    trans.StartTransaction;
  end;
end;

procedure TfrmCadFilaReservaCCIA.SalvarPosicaoGrid;
begin
  if trim(FilaReserva.vFilaVeiculos.dataSet.FieldByName('POSICAO').AsString) = 'FILA' then
  begin
    vStatus := 'FILA';
    vCodEst := FilaReserva.vFilaVeiculos.dataSet.FieldByName('CODIGO').AsInteger;
  end
  else
  begin
    vStatus := 'EST_MOTO';
    vCodEst := FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_ESTMOTO').AsInteger;
  end;
end;

procedure TfrmCadFilaReservaCCIA.ScrollBox2Exit(Sender: TObject);
begin
//  gravaConfiguracaoUsuario;
//  vPesq := false;
//  AjustarGrid(DBGrid1);
//  GroupBox2.Visible := false;
//  mostraColunas;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    FilaReserva.vEstMoto.AbreEstMoto(FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_ESTMOTO').AsInteger,
     FilaReserva.vFilaVeiculos.dataSet.FieldByName('CHASSI_C').AsString);
    FilaReserva.vEstMoto.abreFormSaidaCCIA(1);
    FilaReserva.vFilaVeiculos.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton12Click(Sender: TObject);
var
 I: Integer;
begin
  if FilaReserva.vFilaVeiculos.dataSet.IsEmpty then
  begin
    Application.MessageBox('Nenhum registro selecionado.', 'Atenção', MB_OK);
    exit;
  end;

  if not vDadosIni.PesqPros('VEI144', 'CONSULTA', '', 'EST_MOTO', '',
   FilaReserva.buscas, true) then
    Exit;

  vCodigo := FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_MODELO').AsInteger;
  vAnoFab := FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_FAB').AsInteger;
  vAnoMod := FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_MOD').AsInteger;
  vCor := FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_COR').AsInteger;
//  vRecNo := FilaReserva.vFilaVeiculos.dataSet.RecNo;
  SalvarPosicaoGrid;
  
  Label30.Caption:= trim(FilaReserva.vFilaVeiculos.dataSet.FieldByName('DESCRICAO').AsString);
  Label24.Caption:= IntToStr(FilaReserva.vFilaVeiculos.dataSet.FieldByName('CILINDRADA').AsInteger);
  Label28.Caption:= IntToStr(FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_FAB').AsInteger);
  Label29.Caption:= IntToStr(FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_MOD').AsInteger);
  Label26.Caption:= trim(FilaReserva.vFilaVeiculos.dataSet.FieldByName('DESCRICAO_COR').AsString);

  FiltrarOrdem(vCodigo, vAnoFab, vAnoMod, vCor);
  habilitarBotoes(1);
  vPesq := false;
//  AjustarGrid(DBGrid1, 1);
  for I:= 0 to DBGrid1.Columns.Count - 1 do
  begin
    if (trim(DBGrid1.Columns[I].FieldName) = 'ORDEM_TEMP') then
    begin
       DBGrid1.Columns[I].Visible := True;
       if DBGrid1.Columns[I].Index <> 0 then
         DBGrid1.Columns[I].Index := 0;
    end;
  end;
  DBGrid1.OnTitleClick := nil;
  Panel1.Parent := Panel8;
  PageControl1.ActivePage := TabSheet6;
  BitBtn13.Enabled := False;
  BitBtn14.Enabled := False;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
 try
   if FilaReserva.vFilaVeiculos.IsEmpty then
      exit;

    if (TelaCadastro <> 7) then
	    vRecNo := FilaReserva.vFilaVeiculos.dataSet.RecNo;
    if trim(FilaReserva.vFilaVeiculos.dataSet.FieldByName('TPV').AsString) <> 'FILA' then
    begin
      if (TelaCadastro <> 7) then
      begin
        if not FilaReserva.vFilaVeiculos.verificarRegistro then
         exit;
      end;

      if not FilaReserva.vReserva.abreFormReserva(
      	1,
      	FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_ESTMOTO').AsInteger,
        FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_EMPRESA').AsInteger,
        FilaReserva.vFilaVeiculos.dataSet.FieldByName('CHASSI_C').AsString) then
         exit;


      FilaReserva.vFilaVeiculos.Refresh;
      FilaReserva.vFilaVeiculos.dataSet.RecNo := vRecNo;
      exit;
    end;

    if not FilaReserva.vFilaVeiculos.verificarRegistro then
      exit;

    if not FilaReserva._AbreFilaReserva(FilaReserva.vFilaVeiculos.dataSet.FieldByName('CODIGO').AsInteger) then
      exit;

    if not FilaReserva.Edit then
    	exit;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    inherited;
    PageControl1.ActivePage := TabSheet1;
    TabSheet1.Show;
    DesabilitarCampos(1);
    TabSheet3.Caption := 'Alterar Controle de Estoque';
    TabSheet3.TabVisible := true;
    BitBtn16.Enabled := (FilaReserva.vCodVendedorOld > 0)
      and (FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0)
      and (FilaReserva.dataSet.FieldByName('DATA_VENC_RES').AsDateTime > 0);
    BitBtn19.Enabled := (FilaReserva.vCodVendedorOld > 0)
      and (FilaReserva.dataSet.FieldByName('COD_VENDEDOR').AsInteger > 0);
    PageControl3.ActivePage := TabSheet3;
    if DBEdit_Codigo.CanFocus then
      DBEdit_Codigo.SetFocus
    else if DBEdit5.CanFocus then
      DBEdit5.SetFocus
    else if DBEdit11.CanFocus then
      DBEdit11.SetFocus;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    FilaReserva.Cancel;
    FilaReserva.RollBackTransacao;
  end;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if FilaReserva.vFilaVeiculos.IsEmpty then
      exit;
  vRecNo := FilaReserva.vFilaVeiculos.dataSet.RecNo;
  if trim(FilaReserva.vFilaVeiculos.dataSet.FieldByName('TPV').AsString) = 'FILA' then
  begin
    Application.MessageBox('Não é possível visualizar histórico, veículo não faturado!', 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  FilaReserva.abreEstMoto(FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_ESTMOTO').AsInteger, FilaReserva.vFilaVeiculos.dataSet.FieldByName('CHASSI_C').AsString);
  FilaReserva.vFilaVeiculos.Refresh;
  FilaReserva.vFilaVeiculos.dataSet.RecNo := vRecNo;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if FilaReserva.vFilaVeiculos.IsEmpty then
    exit;
  vRecNo := FilaReserva.vFilaVeiculos.dataSet.RecNo;
  if not FilaReserva.vFilaVeiculos.abreFormAvaria then
    exit;

  FilaReserva.vFilaVeiculos.Refresh;
  FilaReserva.vFilaVeiculos.dataSet.RecNo := vRecNo;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton26Click(Sender: TObject);
var
 I: Integer;
begin
  if FilaReserva.vFilaVeiculos.dataSet.IsEmpty then
  begin
    Application.MessageBox('Nenhum registro selecionado.', 'Atenção', MB_OK);
    exit;
  end;

  if not vDadosIni.PesqPros('VEI144', 'CONSULTA', '', 'EST_MOTO', '',
   FilaReserva.buscas, true) then
    Exit;

  vCodigo := FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_MODELO').AsInteger;
  vAnoFab := FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_FAB').AsInteger;
  vAnoMod := FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_MOD').AsInteger;
  vCor := FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_COR').AsInteger;
//  vRecNo := FilaReserva.vFilaVeiculos.dataSet.RecNo;
  SalvarPosicaoGrid;

  Label35.Caption:= trim(FilaReserva.vFilaVeiculos.dataSet.FieldByName('DESCRICAO').AsString);
  Label31.Caption:= IntToStr(FilaReserva.vFilaVeiculos.dataSet.FieldByName('CILINDRADA').AsInteger);
  Label33.Caption:= IntToStr(FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_FAB').AsInteger);
  Label34.Caption:= IntToStr(FilaReserva.vFilaVeiculos.dataSet.FieldByName('ANO_MOD').AsInteger);
  Label32.Caption:= trim(FilaReserva.vFilaVeiculos.dataSet.FieldByName('DESCRICAO_COR').AsString);

  FiltrarOrdem(vCodigo, vAnoFab, vAnoMod, vCor, true);
  habilitarBotoes(1, true);
  vPesq := false;
//  AjustarGrid(DBGrid1, 2);
  for I:= 0 to DBGrid1.Columns.Count - 1 do
  begin
    if (trim(DBGrid1.Columns[I].FieldName) = 'SEL') then
    begin
       DBGrid1.Columns[I].Visible := True;
       if DBGrid1.Columns[I].Index <> 0 then
         DBGrid1.Columns[I].Index := 0;
    end;
  end;
  DBGrid1.OnTitleClick := nil;
  Panel1.Parent := Panel4;
  PageControl1.ActivePage := TabSheet4;
  BitBtn13.Enabled := False;
  BitBtn14.Enabled := False;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton2Click(Sender: TObject);
begin
  try
    inherited;
    if trim(FilaReserva.vFilaVeiculos.dataSet.FieldByName('TPV').AsString) <> 'FILA' then
    begin
     Application.MessageBox('Não é possível excluir, veículo faturado!', 'Atenção',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
     exit;
    end;
    if not FilaReserva.vFilaVeiculos.verificarRegistro then
      exit;

    if not FilaReserva._AbreFilaReserva(FilaReserva.vFilaVeiculos.dataSet.FieldByName('CODIGO').AsInteger) then
     exit;  

    if not FilaReserva.Delete then
      exit;
    FilaReserva.vFilaVeiculos.Refresh;  
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    FilaReserva.Cancel;
    FilaReserva.RollBackTransacao;
  end;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FilaReserva.vFilaVeiculos.IsEmpty then
      exit;
  vRecNo := FilaReserva.vFilaVeiculos.dataSet.RecNo;
  if not vDadosIni.PesqPros('VEI148', 'DEFINIR', '', 'EST_MOTO', '',
   FilaReserva.buscas, true) then
    Exit;

  if not FilaReserva.vEstMoto.definirDataAssembleia(
    FilaReserva.vFilaVeiculos.dataSet.FieldByName('CODIGO').AsInteger,
    FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_ESTMOTO').AsInteger) then
      exit;

  FilaReserva.vFilaVeiculos.Refresh;
  FilaReserva.vFilaVeiculos.dataSet.RecNo := vRecNo;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not FilaReserva.vFilaVeiculos.verificarRegistro then
    exit;
  if not FilaReserva.vFilaVeiculos.OrdenarUpGrid then
    exit;
  BitBtn13.Enabled := True;
  BitBtn14.Enabled := True;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if not FilaReserva.vFilaVeiculos.verificarRegistro then
    exit;
  if not FilaReserva.vFilaVeiculos.OrdenarDownGrid then
    exit;
  BitBtn13.Enabled := True;
  BitBtn14.Enabled := True;
end;

procedure TfrmCadFilaReservaCCIA.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    FilaReserva.vEstMoto.AbreEstMoto(FilaReserva.vFilaVeiculos.dataSet.FieldByName('COD_ESTMOTO').AsInteger,
     FilaReserva.vFilaVeiculos.dataSet.FieldByName('CHASSI_C').AsString);
    FilaReserva.vEstMoto.abreFormEntradaCCIA(1);
    FilaReserva.vFilaVeiculos.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

initialization
  RegisterClass(TfrmCadFilaReservaCCIA);
finalization
  UnRegisterClass(TfrmCadFilaReservaCCIA);


end.
