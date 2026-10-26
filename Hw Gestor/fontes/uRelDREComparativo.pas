unit uRelDREComparativo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, CheckLst,
  UClassesGestor, DB, Menus;

const
  const_Alfabeto: array[1..52] of string = ('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'NA', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ');

type
  TfrmRelDREComparativo = class(TfrmPadrao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    BitBtn15: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    cklbEmpresas: TCheckListBox;
    ckMarcar: TCheckBox;
    DataSource1: TDataSource;
    ColorDialog1: TColorDialog;
    PopupMenu1: TPopupMenu;
    Definircor1: TMenuItem;
    Fundo1: TMenuItem;
    Fonte1: TMenuItem;
    pnDetalhesCTAContainer: TPanel;
    pnDetalhesCta: TPanel;
    spSairGrid: TSpeedButton;
    DetalhesOLAP1: TMenuItem;
    DetalhesdoRegistro1: TMenuItem;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    pnOpcoesImpressao: TPanel;
    ckImpEstrutura: TCheckBox;
    ckImpConta: TCheckBox;
    ckImpRegistrosFin: TCheckBox;
    ckImpEspacoEntreDetalhes: TCheckBox;
    ckImpSemVinculo: TCheckBox;
    ckImpSemValor: TCheckBox;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure DetalhesOLAP1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure spSairGridClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DetalhesdoRegistro1Click(Sender: TObject);
    procedure Fonte1Click(Sender: TObject);
    procedure Fundo1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    excel, sheet: variant;
    procedure montarExcel(DBGrid: TDBGrid);
  public
    { Public declarations }
  end;

var
  frmRelDREComparativo: TfrmRelDREComparativo;
  cadempresasfin: TEmpresas;

implementation

uses
  uDtmAtivo, uDadosIni, uDataSet_OOP, ComObj, DBClient, UvisualizadorOLAP, DateUtils;

{$R *.dfm}

procedure TfrmRelDREComparativo.BitBtn12Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    BitBtn12.Enabled := False;
    comparativoDRE.dataSet.DisableControls;

    comparativoDRE.mes := StrToIntDef(Trim(Edit1.Text), 0);
    comparativoDRE.ano := StrToIntDef(Trim(Edit2.Text), 0);
    if not cadempresasfin.VerificaEmpresas(cklbEmpresas) then
      exit;
    comparativoDRE.vCodEmpresasDRE := cadempresasfin.vempresas;
    comparativoDRE.vregime := vdadosini.retornoPorCondicao(RadioGroup1.ItemIndex = 0, 'COMP', 'CAIXA');
    comparativoDRE.vTipoCusto := vdadosini.retornoPorCondicao(RadioGroup2.ItemIndex = 0, 'Tipo1', 'Tipo2');
    comparativoDRE.montarDREComparativo('D');

    comparativoDRE.dataSet.First;
  finally
    BitBtn12.Enabled := True;
    comparativoDRE.dataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmRelDREComparativo.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    BitBtn1.Enabled := False;
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('GES079', 'IMPRIMIR', '', '', '', comparativoDRE.buscas,True) then
      Exit;

    ckImpEstrutura.Checked := oiImpEstrutura in comparativoDRE.relOpcoes;
    ckImpConta.Checked     := oiImpContaCTB in comparativoDRE.relOpcoes;
    ckImpRegistrosFin.Checked := oiImpRegistrosFIN in comparativoDRE.relOpcoes;
    ckImpEspacoEntreDetalhes.Checked := oiEspacoEntreDetalhes in comparativoDRE.relOpcoes;
    ckImpSemVinculo.Checked := oiImpContasSemVinculo in comparativoDRE.relOpcoes;
    ckImpSemValor.Checked := oiImpRegistroSemValor in comparativoDRE.relOpcoes;

    if not vDadosIni.abreForm('Opções de Impressão', pnOpcoesImpressao, [ofAlignAllClientWinCtrl]) then
      Exit;
  finally
    BitBtn1.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmRelDREComparativo.BitBtn2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    BitBtn2.Enabled := False;

    if not vDadosIni.PesqPros('GES080', 'EXPORTAR', '', '', '', comparativoDRE.buscas,True) then
      Exit;

    comparativoDRE.dataSet.DisableControls;
    vDadosIni.abreStatusProcessamento('Status Processamento', 'Aguarde... Exportando');
    montarExcel(DBGrid1);//, 'Comparativo DRE Contabilidade');
  finally
    BitBtn2.Enabled := True;
    Screen.Cursor := crDefault;
    vDadosIni.fechaStatusProcessamento;
    comparativoDRE.dataSet.EnableControls;
  end;
end;

procedure TfrmRelDREComparativo.BitBtn4Click(Sender: TObject);
begin
  inherited;
  try
    BitBtn4.Enabled := False;
    Screen.Cursor := crHourGlass;

    comparativoDRE.relOpcoes := [];
    if ckImpEstrutura.Checked then
      comparativoDRE.relOpcoes := comparativoDRE.relOpcoes + [oiImpEstrutura];
    if ckImpConta.Checked then
      comparativoDRE.relOpcoes := comparativoDRE.relOpcoes + [oiImpContaCTB];
    if ckImpRegistrosFin.Checked then
      comparativoDRE.relOpcoes := comparativoDRE.relOpcoes + [oiImpRegistrosFIN];
    if ckImpEspacoEntreDetalhes.Checked then
      comparativoDRE.relOpcoes := comparativoDRE.relOpcoes + [oiEspacoEntreDetalhes];
    if ckImpSemVinculo.Checked then
      comparativoDRE.relOpcoes := comparativoDRE.relOpcoes + [oiImpContasSemVinculo];
    if ckImpSemValor.Checked then
      comparativoDRE.relOpcoes := comparativoDRE.relOpcoes + [oiImpRegistroSemValor];

    comparativoDRE.relatorioComparativo;
  finally
    BitBtn4.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmRelDREComparativo.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  dtSet: TDataSet;
  R: TRect;
begin
  inherited;
  //linha toda
  if comparativoDRE.dataSet.IsEmpty then
    Exit;

  //cor da fonte
  //TDBGrid(sender).canvas.Font.color := clWindowText;

  //cor do preenchimento
  //TDBGrid(sender).Canvas.Brush.Color := clRed;

  //celula
  //TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  //linha toda
  //TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);


  dtSet := TDataSet(DBGrid1.DataSource.DataSet);
  if not (gdFocused in State) then
  begin
    if not (dtSet.FieldByName('nivel').AsInteger = comparativoDRE.MaxNivel) then
      TDBGrid(sender).canvas.Font.Style := [fsBold];
    TDBGrid(sender).canvas.Brush.Color := comparativoDRE.getCorPersonalizadaFundo(comparativoDRE.dataSet.FieldByName('nivel').AsInteger);
    TDBGrid(sender).canvas.Font.Color := comparativoDRE.getCorPersonalizadaFonte(comparativoDRE.dataSet.FieldByName('nivel').AsInteger);

    TDBGrid(sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfrmRelDREComparativo.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  Label1.Caption := IntToStr(Column.Width);
end;

procedure TfrmRelDREComparativo.DBGrid2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    spSairGrid.Click;
end;

procedure TfrmRelDREComparativo.DetalhesdoRegistro1Click(Sender: TObject);
begin
  inherited;
  if comparativoDRE.dataSet.IsEmpty then
    Exit;


  try
    comparativoDRE.detalhesCta.dataSet.Filter := 'TIPO_REL = ' + QuotedStr(comparativoDRE.dataSet.FieldByName('TIPO_REL').AsString) +
      ' and COD_CTA = ' + QuotedStr(comparativoDRE.dataSet.FieldByName('COD_CTA').AsString);
    comparativoDRE.detalhesCta.dataSet.Filtered := True;

    if comparativoDRE.detalhesCta.dataSet.IsEmpty then
    begin
      Application.MessageBox('Sem detalhes para o registro', 'Atenção', 0 + 64);
      Exit;
    end;

    DataSource2.DataSet := comparativoDRE.detalhesCta.dataSet;

    vDadosIni.abreForm('Detalhes: ' + comparativoDRE.dataSet.FieldByName('COD_CTA').AsString +
      ' - ' + comparativoDRE.dataSet.FieldByName('NOME_CTA').AsString, pnDetalhesCta, pnDetalhesCTAContainer);

  finally
    comparativoDRE.detalhesCta.dataSet.Filter := '';
    comparativoDRE.detalhesCta.dataSet.Filtered := False;
  end;
end;

procedure TfrmRelDREComparativo.DetalhesOLAP1Click(Sender: TObject);
begin
  inherited;

  if comparativoDRE.dataSet.IsEmpty then
    Exit;

  comparativoDRE.abreOLAP(DBGrid1.SelectedField.FieldName, 'D');
  Exit;

  if vDadosIni.PosMult(['RECEITA', 'DEVOLUCAO', 'CUSTO'], comparativoDRE.dataSet.FieldByName('TIPO_REL').AsString ) > 0 then
  begin
    comparativoDRE.CadVendas.vdat1 := StartOfTheMonth(EncodeDate(comparativoDRE.ano, comparativoDRE.mes, 1));
    comparativoDRE.CadVendas.vdat2 := EndOfTheMonth(EncodeDate(comparativoDRE.ano, comparativoDRE.mes, 1));
    comparativoDRE.CadVendas.vdatant1 := comparativoDRE.CadVendas.vdat1;
    comparativoDRE.CadVendas.vdatant2 := comparativoDRE.CadVendas.vdat2;
    Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
    if (DBGrid1.SelectedField.FieldName = 'VALOR_CNT') or (DBGrid1.SelectedField.FieldName = 'GRUPO_CNT') then
      comparativoDRE.CadVendas.vendasBICNT(comparativoDRE.vCodEmpresasDRE, FrmVisualizaOlap.HCubeGERAL, 'B')
    else
    begin
      comparativoDRE.CadVendas.vVendasCNT := 'S';
      comparativoDRE.CadVendas.vendasBI(comparativoDRE.vCodEmpresasDRE, FrmVisualizaOlap.HCubeGERAL, 'B');
    end;
    FrmVisualizaOlap.Label1.Caption:='Detalhes de Vendas do Comparativo';
    FrmVisualizaOlap.HierCubeGrid1.SummarySettings.BeginUpdate;
    FrmVisualizaOlap.HierCubeGrid1.SummarySettings.AddSummary('MARKUP','("BRUTO"."Sum"-"DESCONTO"."Sum")/"CUSTO"."Sum"');
    FrmVisualizaOlap.HierCubeGrid1.SummarySettings.Items[0].FunctionSum.SubFunctions[0].FormatString:='##0.0000';
    FrmVisualizaOlap.HierCubeGrid1.SummarySettings.EndUpdate;
    FrmVisualizaOlap.ShowModal;
  end
  else
  begin
    comparativoDRE.caddesp.vdat1 := StartOfTheMonth(EncodeDate(comparativoDRE.ano, comparativoDRE.mes, 1));
    comparativoDRE.caddesp.vdat2 := EndOfTheMonth(EncodeDate(comparativoDRE.ano, comparativoDRE.mes, 1));
    comparativoDRE.caddesp.vdatant1 := comparativoDRE.caddesp.vdat1;
    comparativoDRE.caddesp.vdatant2 := comparativoDRE.caddesp.vdat2;
    comparativoDRE.caddesp.vmesvendas := comparativoDRE.mes;
    comparativoDRE.caddesp.vanovendas := comparativoDRE.ano;
    comparativoDRE.caddesp.vregime := comparativoDRE.vregime;
    comparativoDRE.caddesp.vmesor := comparativoDRE.mes;
    comparativoDRE.caddesp.vtippesq := 'M';
//    comparativoDRE.caddesp.vcoddemo:=comparativoDRE.vcoddemo;
    Application.CreateForm(TFrmVisualizaOlap,FrmVisualizaOlap);
    comparativoDRE.caddesp.despBI(comparativoDRE.vCodEmpresasDRE, FrmVisualizaOlap.HCubeGERAL, 'D');
    FrmVisualizaOlap.Label1.Caption:='Detalhes dos Custos e Inventimentos por Mês';
    FrmVisualizaOlap.ShowModal;
  end;
end;

procedure TfrmRelDREComparativo.Fonte1Click(Sender: TObject);
begin
  inherited;
  try
    if ColorDialog1.Execute then
      comparativoDRE.setCorPersonalizadaFonte(comparativoDRE.dataSet.FieldByName('nivel').AsInteger, ColorDialog1.Color);
  except
  end;
end;

procedure TfrmRelDREComparativo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  comparativoDRE.Free;
  comparativoDRE := nil;

  Action := caFree;
  frmRelDREComparativo := nil;
end;

procedure TfrmRelDREComparativo.FormShow(Sender: TObject);
begin
  inherited;
  comparativoDRE := TDREComparativo.create;
  
  cadempresasfin:=TEmpresas.create;
  cadempresasfin.abreEmpresas;
  cadempresasfin.preenchChecklist(cklbEmpresas);
  
  DBGrid1.DataSource :=DataSource1;
  DataSource1.DataSet := comparativoDRE.dataSet;
end;

procedure TfrmRelDREComparativo.Fundo1Click(Sender: TObject);
begin
  inherited;
  try
    if ColorDialog1.Execute then
      comparativoDRE.setCorPersonalizadaFundo(comparativoDRE.dataSet.FieldByName('nivel').AsInteger, ColorDialog1.Color);
  except
  end;
end;

procedure TfrmRelDREComparativo.montarExcel(DBGrid: TDBGrid);
const
  xlCellTypeLastCell = $0000000B;
var
  vTemp: string;
  vPointer: Pointer;
  vCor, vLinhaExcel: integer;
  I: Integer;
  DataAux: TDateTime;
  DiaAux: word;
  MesAux: word;
  AnoAux: word;
  vOK: Boolean;
  vPerc: Integer;
begin
  try
    excel := CreateOleObject('Excel.Application');
  except
    Application.MessageBox('Versão do Ms-Excel Incompatível', 'Erro', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  try
    excel.Workbooks.add;
    sheet := excel.Workbooks[1].sheets[1];
    sheet.cells[1, 01] := 'Comparativo DRE';
    sheet.cells[1, 01].Font.Size := 12;
    sheet.cells[1, 01].Font.Bold := True;
    excel.Range['A1:' + const_Alfabeto[DBGrid.Columns.Count] + '1'].Mergecells := True;

    for I := 1 to DBGrid.Columns.Count do
      if DBGrid.Columns[I - 1].Visible then
      begin
        vtemp := TClientDataSet(DBGrid.DataSource.DataSet).FieldByName(DBGrid.Columns[I - 1].FieldName).DisplayName;
        sheet.cells[2, I] := vtemp;
        sheet.cells[1, 01].Font.Bold := True;
        sheet.cells[2, I].Interior.Color := $00FFCF9C;// talvez mudar
      end;
  except
  end;

  try
    vPointer := TClientDataSet(DBGrid.DataSource.DataSet).GetBookmark;

    vLinhaExcel := 3;
    TClientDataSet(DBGrid.DataSource.DataSet).First;
    while not TClientDataSet(DBGrid.DataSource.DataSet).Eof do
    begin
      vPerc := Trunc(DBGrid.DataSource.DataSet.RecNo / DBGrid.DataSource.DataSet.RecordCount * 100);
      if (vPerc mod 5) = 0 then
        vDadosIni.abreStatusProcessamento('Status Processamento', 'Aguarde... ' + FloatToStr(vPerc) + '%');

      for I := 1 to DBGrid.Columns.Count do
      begin
        vTemp := (TClientDataSet(DBGrid.DataSource.DataSet).FieldByName(DBGrid.Columns[I - 1].FieldName).AsString);
        if vTemp = '' then
        else if TClientDataSet(DBGrid.DataSource.DataSet).FieldByName(DBGrid.Columns[I - 1].FieldName) is TDateTimeField then
        begin
          DataAux := TClientDataSet(DBGrid.DataSource.DataSet).FieldByName(DBGrid.Columns[I - 1].FieldName).AsDateTime;
          DecodeDate(TClientDataSet(DBGrid.DataSource.DataSet).FieldByName(DBGrid.Columns[I - 1].FieldName).AsDateTime, AnoAux, MesAux, DiaAux);
          if DataAux - EncodeDate(AnoAux, MesAux, DiaAux) = 0 then
            sheet.cells[vLinhaExcel, I].Value := EncodeDate(AnoAux, MesAux, DiaAux)
          else sheet.cells[vLinhaExcel, I].Value := DataAux; //datetostr(DataAux);
  //            sheet.cells[vLinhaExcel, I].Value := EncodeDate(YearOf(StrToDate(vTemp)),MonthOf(StrToDate(vTemp)),DayOf(StrToDate(vTemp)))
        end
        else if TClientDataSet(DBGrid.DataSource.DataSet).FieldByName(DBGrid.Columns[I - 1].FieldName) is TFloatField then
        begin
          sheet.cells[vLinhaExcel, I].Value := StrToFloat(StringReplace(vTemp, '.', '', [rfReplaceAll]));
          sheet.cells[vLinhaExcel, I].NumberFormat := '#.##0,00_);(#.##0,00)';
        end
        else if TClientDataSet(DBGrid.DataSource.DataSet).FieldByName(DBGrid.Columns[I - 1].FieldName) is TStringField then
        begin
//          if DBGrid.Columns[I - 1].FieldName = 'NOME_CTA' then
//            vTemp := vDadosIni.Space(DBGrid.DataSource.DataSet.FieldByName('nivel').AsInteger *
//              vDadosIni.retornoPorCondicao(DBGrid.DataSource.DataSet.FieldByName('nivel').AsInteger = obfMaxNivel, 3, 2)) +
//        Trim(dataSet.FieldByName('NOME_CTA').AsString);

          sheet.cells[vLinhaExcel, I].NumberFormat := '@';
          sheet.cells[vLinhaExcel, I].Value := vTemp;
        end
        else
          sheet.cells[vLinhaExcel, I] := vTemp;

        sheet.cells[vLinhaExcel, I].Interior.Color := comparativoDRE.getCorPersonalizadaFundo(comparativoDRE.dataSet.FieldByName('nivel').AsInteger);
        sheet.cells[vLinhaExcel, I].Font.Color := comparativoDRE.getCorPersonalizadaFonte(comparativoDRE.dataSet.FieldByName('nivel').AsInteger);
      end;

      Inc(vLinhaExcel);

      TClientDataSet(DBGrid.DataSource.DataSet).Next;
    end;

    TClientDataSet(DBGrid.DataSource.DataSet).GotoBookmark(vPointer);

    excel.Cells.EntireRow.AutoFit;
    excel.Cells.EntireColumn.AutoFit;
  finally
    excel.visible := True;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmRelDREComparativo.spSairGridClick(Sender: TObject);
begin
  inherited;
  TForm(pnDetalhesCta.Parent).ModalResult := IDCANCEL;
end;

end.
