unit UConciliaCartao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, grimgctrl, qrpctrls, StdCtrls, Buttons, Grids,
  DBGrids, ComCtrls, DBCtrls, ExtCtrls, Gauges, uPadrao,FileCtrl, 
  uclassesconciliacartao, Mask, Menus;

type
  TFrmConciliaCartao = class(TfrmPadrao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    PageControl_Retorno: TPageControl;
    tsCreditos: TTabSheet;
    DBGrid_Retorno: TDBGrid;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit_Soma: TEdit;
    Edit_SomaMenosJuros: TEdit;
    BitBtn_SomarSelecionados: TBitBtn;
    tsHistorico: TTabSheet;
    Memo_Retorno: TMemo;
    Panel2: TPanel;
    TabSheet_Relatorio1: TTabSheet;
    ScrollBox1: TScrollBox;
    QuickRep_Retorno1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRBand2: TQRBand;
    QRPLabel2: TQRPLabel;
    QRSysData3: TQRSysData;
    QRLabel19: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel25: TQRLabel;
    lbEmpresa1: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRHRule3: TQRHRule;
    QRHRule4: TQRHRule;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel46: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRBand3: TQRBand;
    QRLabel45: TQRLabel;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel55: TQRLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Edit5: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    BitBtn_QuitarCreditos: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    FileListBox1: TFileListBox;
    CheckBox11: TCheckBox;
    lbl_statusProc: TLabel;
    Gauge_HistoricoRetorno: TGauge;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    Label9: TLabel;
    CheckBox15: TCheckBox;
    Edit6: TEdit;
    Label10: TLabel;
    Edit7: TEdit;
    Label11: TLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr3: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    pnRelatorio: TPanel;
    GroupBox5: TGroupBox;
    MaskEdit1: TMaskEdit;
    Label12: TLabel;
    MaskEdit2: TMaskEdit;
    Label13: TLabel;
    GroupBox6: TGroupBox;
    ComboBox1: TComboBox;
    Panel3: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    PopupMenu1: TPopupMenu;
    ApagarPendnciaSelecionada1: TMenuItem;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    QRLabel11: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText20: TQRDBText;
    Label14: TLabel;
    QRLabel16: TQRLabel;
    QRDBText21: TQRDBText;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ApagarPendnciaSelecionada1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QuickRep_Retorno1Preview(Sender: TObject);
    procedure DBGrid_RetornoTitleClick(Column: TColumn);
    procedure BitBtn_QuitarCreditosClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure BitBtn_SomarSelecionadosClick(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure atualizafiltro;
    function criarExcel: boolean;
  private
    { Private declarations }
    excel, sheet: variant;
    vLinhaExcel: integer;
  public
    { Public declarations }
  end;

var
  FrmConciliaCartao: TFrmConciliaCartao;
  cadadmcartao: TadmCartao;
  cadconcilia: Tconciliacartao;

implementation

uses uDataSet_OOP, DB, DBClient, DateUtils, ComObj, uDtmContasAReceber, 
  uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TFrmConciliaCartao.ApagarPendnciaSelecionada1Click(Sender: TObject);
begin
  if cadconcilia <> nil then
  begin
    if Application.MessageBox('Deseja Excluir Pendência selecionada?', 'Atenção',
    MB_ICONQUESTION + MB_YESNO) = IDYES then
     cadconcilia.apagapendencia;
  end;
end;

procedure TFrmConciliaCartao.atualizafiltro;
begin
  if (CheckBox6.Checked) and
  (CheckBox7.Checked) and (CheckBox8.Checked) and
  (CheckBox9.Checked) and (CheckBox10.Checked) and ((not checkbox11.Checked)
  and (not checkbox12.Checked) and (not checkbox13.Checked) and (not checkbox14.Checked)) then
    CheckBox5.Checked:=true
  else
  CheckBox5.Checked:=false;

  cadconcilia.filtrodataset(CheckBox6.Checked,CheckBox7.Checked,
  CheckBox8.Checked,CheckBox9.Checked,CheckBox10.Checked,CheckBox5.Checked,
  checkbox11.Checked,checkbox12.Checked,checkbox13.Checked,checkbox14.Checked);
end;

procedure TFrmConciliaCartao.BitBtn1Click(Sender: TObject);
var
  vTemp: string;
  vPointer: Pointer;
  vCor: integer;
  I: Integer;
begin
  if criarExcel then
  begin
    try
      vPointer:=TClientDataSet(dbgrid_retorno.DataSource.DataSet).GetBookmark;

      vLinhaExcel := 3;
      TClientDataSet(dbgrid_retorno.DataSource.DataSet).First;
      while not TClientDataSet(dbgrid_retorno.DataSource.DataSet).Eof do
      begin

        for I := 1 to dbgrid_retorno.Columns.Count  do
        begin
          vTemp := Trim(TClientDataSet(dbgrid_retorno.DataSource.DataSet).FieldByName(dbgrid_retorno.Columns[I - 1].FieldName).AsString);

          if vTemp = '' then
          else if TClientDataSet(dbgrid_retorno.DataSource.DataSet).FieldByName(dbgrid_retorno.Columns[I - 1].FieldName) is TDateTimeField then
            sheet.cells[vLinhaExcel, I].Value := EncodeDate(YearOf(StrToDate(vTemp)),MonthOf(StrToDate(vTemp)),DayOf(StrToDate(vTemp)))
          else  if TClientDataSet(dbgrid_retorno.DataSource.DataSet).FieldByName(dbgrid_retorno.Columns[I - 1].FieldName) is TFloatField then
          begin
            sheet.cells[vLinhaExcel, I].Value := StrToFloat(StringReplace(vTemp,'.','',[rfReplaceAll]));
            vTemp := Trim(TFloatField(TClientDataSet(dbgrid_retorno.DataSource.DataSet).FieldByName(dbgrid_retorno.Columns[I - 1].FieldName)).DisplayFormat);
            if vTemp <> '' then
            begin
              vTemp := StringReplace(vTemp,'#','',[rfReplaceAll]);
              vTemp := StringReplace(vTemp,'.',',',[rfReplaceAll]);
            end
            else
              vTemp := '0,00';
            sheet.cells[vLinhaExcel, I].NumberFormat := vTemp;
          end
          else if TClientDataSet(dbgrid_retorno.DataSource.DataSet).FieldByName(dbgrid_retorno.Columns[I - 1].FieldName) is TStringField then
          begin
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

        TClientDataSet(dbgrid_retorno.DataSource.DataSet).Next;
      end;

      TClientDataSet(dbgrid_retorno.DataSource.DataSet).GotoBookmark(vPointer);

      excel.Cells.EntireRow.AutoFit;
      excel.Cells.EntireColumn.AutoFit;
    finally
      excel.visible := True;
    end;
  end;
end;

procedure TFrmConciliaCartao.BitBtn2Click(Sender: TObject);
var
  formulario: TfrmPadrao;
begin

  MaskEdit1.Text := _LerConfiguracoesRegistroString(MaskEdit1.Name);
  MaskEdit2.Text := _LerConfiguracoesRegistroString(MaskEdit2.Name);
  ComboBox1.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox1.Name);

  if MaskEdit1.Text = '  /  /    ' then
    MaskEdit1.Text := DateToStr(Date);
  if MaskEdit2.Text = '  /  /    ' then
    MaskEdit2.Text := DateToStr(Date);
  

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Relatório de Conciliação de Cartão';
    pnRelatorio.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowModal;

  finally
    pnRelatorio.Parent := TabSheet_Relatorio1;
    formulario.Free;
    formulario := nil;
  end;

end;

function TFrmConciliaCartao.criarExcel: boolean;
var
  I, J: Integer;
  vtemp: string;
begin
  try
    excel := CreateOleObject('Excel.Application');

    Result := True;

  except
    Result := False;
    Application.MessageBox ('Versão do Ms-Excel Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
  end;
  try
    excel.Workbooks.add;
    sheet := excel.Workbooks[1].sheets[1];
    sheet.cells[1,01] := Self.Caption;
    sheet.cells[1,01].Font.Size := 12;
    sheet.cells[1,01].Font.Bold := True;

    for I := 1 to dbgrid_retorno.Columns.Count  do
      if dbgrid_retorno.Columns[I - 1].Visible then
      begin
        vtemp := TClientDataSet(dbgrid_retorno.DataSource.DataSet).FieldByName(dbgrid_retorno.Columns[I - 1].FieldName).DisplayName;
        sheet.cells[2, I] := vtemp;
        sheet.cells[1,01].Font.Bold := True;
        sheet.cells[2, I].Interior.Color := $00ffcf9c;
      end;
  except

  end;
end;


procedure TFrmConciliaCartao.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('IMPFIN027', 'CONSULTAR', Trim(cadadmcartao.dataSet.FieldByName('DESCRICAO_ADM').AsString), '', '', cadadmcartao.buscas, False) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    BitBtn3.Enabled := False;
    if DBLookupComboBox1.Text <> '' then
    begin
       if Copy(Trim(cadadmcartao.dataSet.FieldByName('DESCRICAO_ADM').AsString), 1, 5) = 'CIELO' then
       begin
         cadconcilia:=TconciliaCielo.create;
         PageControl_Retorno.Enabled:=false;
         cadconcilia.vcod_adm:=cadadmcartao.dataSet.FieldByName('COD_ADM').AsInteger;
         cadconcilia.codigoUnificada := cadadmcartao.dataSet.FieldByName('cod_empresa').AsInteger;
         cadconcilia.criarlistamovimento(Edit1.Text,FileListBox1,Gauge_HistoricoRetorno,lbl_statusProc,CheckBox15);
         CheckBox5.Checked := True;
         CheckBox6.Checked := True;
         CheckBox7.Checked := True;
         CheckBox8.Checked := True;
         CheckBox9.Checked := True;
         CheckBox10.Checked := True;
         CheckBox11.Checked := False;
         CheckBox12.Checked := False;
         CheckBox13.Checked := False;
         CheckBox14.Checked := False;
         atualizafiltro;

         GroupBox2.Enabled := not cadconcilia.vmovcartao.IsEmpty;
         GroupBox3.Enabled := not cadconcilia.vmovcartao.IsEmpty;
         BitBtn_QuitarCreditos.Enabled := not cadconcilia.vmovcartao.IsEmpty;

         Edit6.Text := IntToStr(cadconcilia.getQtdeTransacoesVinculadas);
         Edit7.Text := IntToStr(cadconcilia.getQtdeTransacoesPagas);

         PageControl_Retorno.Enabled:=True;
         PageControl_Retorno.Refresh;
         BitBtn_SomarSelecionadosClick(Sender);
         PageControl_Retorno.Refresh;
         GroupBox1.Refresh;
       end
     end
     else
       Application.MessageBox('Favor escolher a administradora de cartão', 'Atenção', 0 + 64);
  finally
    BitBtn3.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartao.BitBtn4Click(Sender: TObject);
begin
  inherited;
close;
end;

procedure TFrmConciliaCartao.BitBtn5Click(Sender: TObject);
var
  vRel : TRelatorioConciliaCartao;
  vtpdata: string;
begin
  vRel := TRelatorioConciliaCartao.create;

  if RadioButton1.Checked then
  begin
   vtpdata:='Q';
   QRPLabel2.Caption := 'Relatório de quitação de Cartão - Período: ' + MaskEdit1.Text + ' a ' + MaskEdit2.Text +
    ' - Ordenado por ' + ComboBox1.Text;
  end
  else
  begin
   vtpdata:='P';
   QRPLabel2.Caption := 'Relatório de Processamento(Baixa Real) de Cartão - Período: ' + MaskEdit1.Text + ' a ' + MaskEdit2.Text +
    ' - Ordenado por ' + ComboBox1.Text;
  end;

  vRel.abrePesquisaRelatorio(MaskEdit1.Text, MaskEdit2.Text, ComboBox1.Text,vtpdata);

  QuickRep_Retorno1.Preview;

  _GravaConfiguracoesString(MaskEdit1.Name, MaskEdit1.Text);
  _GravaConfiguracoesString(MaskEdit2.Name, MaskEdit2.Text);
  _GravaConfiguracoesInteger(ComboBox1.Name, ComboBox1.ItemIndex);

end;

procedure TFrmConciliaCartao.BitBtn6Click(Sender: TObject);
begin
  TForm(pnRelatorio.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmConciliaCartao.BitBtn_QuitarCreditosClick(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', cadconcilia.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'I', cadconcilia.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', cadconcilia.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', cadconcilia.buscas) then
    Exit;

  // Financeiro sendo fechado
  if vDadosIni.financeiroFechando(cadconcilia.buscas) then
    Exit;
  cadconcilia.vLancarTarifa := CheckBox1.Checked;
  cadconcilia.vLancarComissao := CheckBox2.Checked;
  cadconcilia.vLancarAjustePositivo := CheckBox3.Checked;
  cadconcilia.vLancarAjusteNegativo := CheckBox4.Checked;
  if (Application.MessageBox(PChar('Tem certeza de que deseja continuar com o processamento de extratos?'),
  'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes) then
    cadconcilia.processadadoscartao(FileListBox1,Gauge_HistoricoRetorno,lbl_statusProc,dbgrid_retorno);

end;


procedure TFrmConciliaCartao.BitBtn_SomarSelecionadosClick(Sender: TObject);
var
 vtarifa,vcomissao,vajustemais,vajustemenos,vtotalgeral: currency;
begin
 vtarifa:=0;
 vcomissao:=0;
 vajustemais:=0;
 vajustemenos:=0;
 vtotalgeral:=0;
// DBGrid_Retorno.Enabled:=false;
 cadconcilia.vmovcartao.First;
 while not cadconcilia.vmovcartao.eof do
 begin
   if (cadconcilia.vmovcartao.FieldByName('COD_TIPOEXTRATO').AsInteger = 4) or
   (cadconcilia.vmovcartao.FieldByName('COD_TIPOEXTRATO').AsInteger= 5) then
   begin
     if cadconcilia.vmovcartao.FieldByName('STATUS_ADM').AsInteger = 1 then
     begin
      vtotalgeral:=vtotalgeral+cadconcilia.vmovcartao.FieldByName('VALORPARCELA').AsCurrency;
      vcomissao:=vcomissao+cadconcilia.vmovcartao.FieldByName('TAXA_CARTAO_CRED').AsCurrency;
      vtarifa:=vtarifa+cadconcilia.vmovcartao.FieldByName('TARIFA_CARTAO').AsCurrency;
      if cadconcilia.vmovcartao.FieldByName('IND_OR_AJUSTE_ADM').AsInteger <> 0 then
      begin
        if cadconcilia.vmovcartao.FieldByName('VALORPARCELA').AsCurrency < 0 then
          vajustemenos:=vajustemenos+cadconcilia.vmovcartao.FieldByName('VALORPARCELA').AsCurrency
        else
        vajustemais:=vajustemais+cadconcilia.vmovcartao.FieldByName('VALORPARCELA').AsCurrency;
      end;
     end;
   end;
   cadconcilia.vmovcartao.next;
 end;
 edit2.Text:=format('%n',[vtarifa]);
 edit3.Text:=format('%n',[vcomissao]);
 edit4.text:=format('%n',[vajustemais]);
 edit5.text:=format('%n',[vajustemenos]);
 Edit_Soma.Text:=format('%n',[vtotalgeral]);
 Edit_SomaMenosJuros.Text:=format('%n',[vtotalgeral+vcomissao+vtarifa+vajustemais+vajustemenos]);
// DBGrid_Retorno.Enabled:=True;

end;

procedure TFrmConciliaCartao.CheckBox10Click(Sender: TObject);
begin
 atualizafiltro;
end;

procedure TFrmConciliaCartao.CheckBox11Click(Sender: TObject);
begin
 atualizafiltro;
end;

procedure TFrmConciliaCartao.CheckBox12Click(Sender: TObject);
begin
 atualizafiltro;
end;

procedure TFrmConciliaCartao.CheckBox13Click(Sender: TObject);
begin
 atualizafiltro;
end;

procedure TFrmConciliaCartao.CheckBox14Click(Sender: TObject);
begin
 atualizafiltro;
end;

procedure TFrmConciliaCartao.CheckBox5Click(Sender: TObject);
begin
  atualizafiltro
end;

procedure TFrmConciliaCartao.CheckBox6Click(Sender: TObject);
begin
 atualizafiltro;
end;

procedure TFrmConciliaCartao.CheckBox7Click(Sender: TObject);
begin
 atualizafiltro;
end;

procedure TFrmConciliaCartao.CheckBox8Click(Sender: TObject);
begin
 atualizafiltro;
end;

procedure TFrmConciliaCartao.CheckBox9Click(Sender: TObject);
begin
 atualizafiltro;
end;

procedure TFrmConciliaCartao.DBGrid_RetornoTitleClick(Column: TColumn);
begin
  vDadosini.DBGridOnTitleClick(DBGrid_Retorno, Column);
end;

procedure TFrmConciliaCartao.DBLookupComboBox1Exit(Sender: TObject);
begin
  edit1.Text:=cadadmcartao.dataSet.FieldByName('END_ARQUIVO_ADM').AsString;
  Label14.Caption := 'EMP: ' + vDadosIni.StrZero( cadadmcartao.dataSet.FieldByName('cod_empresa').AsInteger, 3);
end;

procedure TFrmConciliaCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;


  _GravaConfiguracoesBoolean(CheckBox1.Name, not CheckBox1.Checked);
  _GravaConfiguracoesBoolean(CheckBox3.Name, not CheckBox3.Checked);
  _GravaConfiguracoesBoolean(CheckBox4.Name, not CheckBox4.Checked);

  if Assigned(cadadmcartao) then
    FreeAndNil(cadadmcartao);
  if Assigned(cadconcilia) then
  begin
//    cadconcilia.vmovcartao.Close;
//    cadconcilia.datasetpend.close;
    cadconcilia.fechatudo;
    FreeAndNil(cadconcilia);
  end;
  Action:=caFree;
end;

procedure TFrmConciliaCartao.FormShow(Sender: TObject);
begin
  vDadosIni.hw_registra_estatistica(Self.Name);
  cadadmcartao:=TadmCartao.create;
  cadadmcartao.abreadmcartao;
  edit1.Text:=cadadmcartao.dataSet.FieldByName('END_ARQUIVO_ADM').AsString;
  TabSheet_Relatorio1.TabVisible := False;
  tsHistorico.TabVisible := False;

  if not vDadosIni.validarAcessoEmpresasUnificadas(cadadmcartao.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    FrmConciliaCartao.fechar := True;
    PostMessage(FrmConciliaCartao.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  CheckBox1.Checked := not _LerConfiguracoesRegistroBoolean(CheckBox1.Name);
  CheckBox3.Checked := not _LerConfiguracoesRegistroBoolean(CheckBox3.Name);
  CheckBox4.Checked := not _LerConfiguracoesRegistroBoolean(CheckBox4.Name);

end;

procedure TFrmConciliaCartao.QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  lbEmpresa1.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TFrmConciliaCartao.QRGroup1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel16.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  QRDBText21.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
end;

procedure TFrmConciliaCartao.QuickRep_Retorno1Preview(Sender: TObject);
begin
  vDadosIni.VisualizaRelQrp(Sender, 'Conciliação de Cartão');
end;

end.
