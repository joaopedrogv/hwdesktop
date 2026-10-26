unit uCadNF_AlterarItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, Grids, DBGrids, ExtCtrls, DBCtrls, uEditHw,
  Menus, Buttons, uClassesNotasFiscais;

type
  TfmrCadNF_AlterarItens = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    DBGrid13: TDBGrid;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    filter_descr: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    bt_filter_clear: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Limparfiltros1: TMenuItem;
    Selecionartodos1: TMenuItem;
    ckcfop: TCheckBox;
    edpicms: TEditHw;
    edpredbc: TEditHw;
    ckpst: TCheckBox;
    edpst: TEditHw;
    edpredbcst: TEditHw;
    ckpredbcst: TCheckBox;
    ckmva: TCheckBox;
    edmva: TEditHw;
    ckpdif: TCheckBox;
    edpdif: TEditHw;
    ckpfcp: TCheckBox;
    edpfcp: TEditHw;
    ckpfcpst: TCheckBox;
    edpfcpst: TEditHw;
    ckcst: TCheckBox;
    ckcsosn: TCheckBox;
    ckpicms: TCheckBox;
    ckpredbc: TCheckBox;
    ckdeson: TCheckBox;
    ckcalc: TCheckBox;
    edcalc: TComboBox;
    eddeson: TComboBox;
    ckBC: TCheckBox;
    bt_voltar: TBitBtn;
    bt_aplicar: TBitBtn;
    edcst: TComboBox;
    edcsosn: TComboBox;
    bt_campos_clear: TSpeedButton;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    filter_cfop: TMaskEdit;
    filter_cst: TMaskEdit;
    filter_csosn: TMaskEdit;
    filter_ncm: TMaskEdit;
    filter_cest: TMaskEdit;
    edcfop: TEditHw;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure filter_descrChange(Sender: TObject);
    procedure DBGrid13DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ckcfopClick(Sender: TObject);
    procedure bt_campos_clearClick(Sender: TObject);
    procedure bt_filter_clearClick(Sender: TObject);
    procedure bt_aplicarClick(Sender: TObject);
    procedure edcfopChange(Sender: TObject);
  private
    Fnota: TNFCab;
    procedure handleFilter;
    procedure clearCampos;
  public
    { Public declarations }
    property nota: TNFCab read Fnota write Fnota;
  end;

var
  fmrCadNF_AlterarItens: TfmrCadNF_AlterarItens;

implementation

uses
  uDtmNF,
  DB,
  StrUtils,
  Math,
  hw_progress_utils,
  uDataSet_OOP,
  uDtmAtivo,
  uDadosIni,
  hw_utils,
  DBClient,
  uClassesNotasFiscais_consts;

{$R *.dfm}

procedure TfmrCadNF_AlterarItens.BitBtn1Click(Sender: TObject);
var
  filter: string;
  sels: array of Integer;
  I: Integer;
begin
  inherited;

  if nota.vItem.dataSet.RecordCount = 0 then
    Exit;

  filter := nota.vItem.dataSet.Filter;

  nota.vItem.prepare_loop();

  nota.vItem.dataSet.Filter := filter + IfThen(filter <> '', ' and ') + 'sel = ''S''';
  nota.vItem.dataSet.Filtered := True;

  if nota.vItem.dataSet.RecordCount = 0 then
    nota.vItem.dataSet.Filter := filter;

  SetLength(sels, nota.vItem.dataSet.RecordCount);
  nota.vItem.dataSet.First;
  while not nota.vItem.dataSet.Eof do
  begin
    sels[nota.vItem.dataSet.RecNo- 1] := nota.vItem.fint('nitem');
    nota.vItem.dataSet.Next;
  end;

  nota.vItem.dataSet.Filtered := False;
  nota.vItem.marcaItem(opmNenhum);
  for I := Low(sels) to High(sels) do
    if nota.vItem.dataSet.Locate('NITEM', sels[I], []) then
      nota.vItem.marcaItem(opmIndividual);

  nota.vItem.filterStr('sel = ''S''');


  Screen.Cursor := crHourGlass;
  try
    ProgressUtil.Msg('Excluindo registros. Aguarde!');

    nota.removerItemsSelecionados;

  finally
    nota.vItem.dataSet.Filtered := False;
    nota.vItem.marcaItem(opmNenhum);
    nota.vItem.prepare_loop_done();
    handleFilter;
    ProgressUtil.Terminate;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmrCadNF_AlterarItens.btSelectAllClick(Sender: TObject);
begin
  inherited;
  nota.vItem.marcaItem(opmTodos);
end;

procedure TfmrCadNF_AlterarItens.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  nota.vItem.marcaItem(opmNenhum);
end;

procedure TfmrCadNF_AlterarItens.bt_aplicarClick(Sender: TObject);
var
  filter: string;
  sels: array of Integer;
  I: Integer;
begin
  inherited;

  if nota.vItem.dataSet.RecordCount = 0 then
    Exit;

  filter := nota.vItem.dataSet.Filter;

  ProgressUtil.MaxSteps(nota.vItem.dataSet.RecordCount, 0);
  ProgressUtil.Msg('Alterando dados');
  nota.vItem.prepare_loop();

  nota.vItem.dataSet.Filter := filter + IfThen(filter <> '', ' and ') + 'sel = ''S''';
  nota.vItem.dataSet.Filtered := True;

  if nota.vItem.dataSet.RecordCount = 0 then
    nota.vItem.dataSet.Filter := filter;

  SetLength(sels, nota.vItem.dataSet.RecordCount);
  nota.vItem.dataSet.First;
  while not nota.vItem.dataSet.Eof do
  begin
    sels[nota.vItem.dataSet.RecNo- 1] := nota.vItem.fint('nitem');
    nota.vItem.dataSet.Next;
  end;

  nota.vItem.dataSet.Filtered := False;
  nota.vItem.marcaItem(opmNenhum);
  for I := Low(sels) to High(sels) do
    if nota.vItem.dataSet.Locate('NITEM', sels[I], []) then
      nota.vItem.marcaItem(opmIndividual);

  nota.vItem.filterStr('sel = ''S''');

  nota.vItem.dataSet.First;

  Screen.Cursor := crHourGlass;
  try
    ProgressUtil.IncStep;

    //nota.calc_fat.calculo_faturamento_completo_obterdados(forceGetData);

    
    if ckCFOP.Checked then
    begin
      if not nota.validaCfop(edcfop.AsInteger) then
        Exit;

      if nota.dataSet.State in [dsEdit, dsInsert] then
        nota.dataSet.FieldByName('verificar_mud_cfop').AsString := 'N';
    end;

    nota.vItem.First;
    while not nota.vItem.dataSet.Eof do
    begin

      nota.vItem.alterar;
      nota.vItem.vrDadosItem.calcIcmsActive := (ckcst.Checked) or
                                               (ckdeson.Checked) or
                                               (ckcalc.Checked) or
                                               (ckpicms.Checked) or
                                               (ckpredbc.Checked) or
                                               (ckpst.Checked) or
                                               (ckpredbcst.Checked) or
                                               (ckmva.Checked) or
                                               (ckpdif.Checked) or
                                               (ckpfcp.Checked) or
                                               (ckpfcpst.Checked) or
                                               (ckBC.Checked);

      if nota.vItem.vrDadosItem.calcIcmsActive and (not ckcalc.Checked) then
        if ShowConfirmacao('Você está alterando alguma informação que pode alterar o tributo do ICMS' + sLineBreak +
                           'Porém o campo de cálculo não foi selecionado' + sLineBreak + sLineBreak +
                           'Deseja ativar e alterar para Parcial?') = IDYES then
        begin
          ckcalc.Checked := True;
          edcalc.ItemIndex := 1;
        end;

      if ckCFOP.Checked then
        nota.vItem.vrDadosItem.codigo_nop := edcfop.AsInteger;

      if ckcst.Checked then
        nota.vItem.vrDadosItem.cst := Copy(nota.vItem.vrDadosItem.cst, 1, 1) + edcst.Text;

      if ckcsosn.Checked then
        nota.vItem.vrDadosItem.csosn := edcsosn.Text;

      if ckdeson.Checked then
        nota.vItem.vrDadosItem.ind_desoneracao := StrToInt(Trim(Copy(eddeson.Text, 1, 2)));

      if ckcalc.Checked then
        nota.vItem.vrDadosItem.tipo_calc := edcalc.ItemIndex;

      if ckpicms.Checked then
      begin
        nota.vItem.vrDadosItem.aliq_icm := edpicms.AsValue;
        nota.vItem.vrDadosItem.aliq_icm_simples := edpicms.AsValue;
      end;

      if ckpredbc.Checked then
        nota.vItem.vrDadosItem.perc_red_prod := edpredbc.AsValue;

      if ckpst.Checked then
        nota.vItem.vrDadosItem.aliq_icmsub := edpst.AsValue;

      if ckpredbcst.Checked then
        nota.vItem.vrDadosItem.perc_red_prod_sub := edpredbcst.AsValue;

      if ckmva.Checked then
      begin
        nota.vItem.vrDadosItem.mva := edmva.AsValue;
        nota.vItem.vrDadosItem.modbcst := IfThen(nota.vItem.vrDadosItem.mva > 0, 4, 0);
      end;

      if ckpdif.Checked then
        nota.vItem.vrDadosItem.pdif := edpdif.AsValue;

      if ckpfcp.Checked then
        nota.vItem.vrDadosItem.fcp_pfcp := edpfcp.AsValue;

      if ckpfcpst.Checked then
        nota.vItem.vrDadosItem.fcp_pfcpst := edpfcpst.AsValue;

      if ckBC.Checked then
      begin
        nota.vItem.vrDadosItem.base_icm     := 0;
        nota.vItem.vrDadosItem.base_icmsub  := 0;
        nota.vItem.vrDadosItem.fcp_vbcfcp   := 0;
        nota.vItem.vrDadosItem.fcp_vbcfcpst := 0;
      end;

      if not nota.validaDadosItem then
        Exit;

      nota.calc_fat.calculo_faturamento_individual_executar(True);
      if nota.vItem.Edit then
      begin
        nota.vItem.setDadosIntemNF();
        nota.vItem.dataSet.post;
      end;
      nota.vItem.cancelar;

      nota.vItem.Next;
    end;

  finally
    nota.vItem.dataSet.Filtered := False;
    nota.vItem.marcaItem(opmNenhum);
    nota.vItem.prepare_loop_done();
    handleFilter;
    ProgressUtil.Terminate;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmrCadNF_AlterarItens.bt_filter_clearClick(Sender: TObject);
begin
  inherited;
  filter_descr.Clear;
  filter_cfop.Clear;
  filter_cst.Clear;
  filter_csosn.Clear;
  filter_ncm.Clear;
  filter_cest.Clear;
end;

procedure TfmrCadNF_AlterarItens.ckcfopClick(Sender: TObject);
var
  currentControl: string;
  seachControl: TComponent;
begin
  inherited;

  currentControl := TComponent(Sender).Name;
  seachControl := FindComponent('ed' + Copy(currentControl, 3, Length(currentControl)));

  if not (Sender as TCheckBox).Checked then
  begin
    if Assigned(seachControl) then
      if (seachControl is TMaskEdit) then
        (seachControl as TMaskEdit).Clear
      else if (seachControl is TComboBox) then
        (seachControl as TComboBox).ItemIndex := 0
      else if (seachControl is TEditHw) then
        (seachControl as TEditHw).AsValue := 0;
    (Sender as TCheckBox).Checked := False;
  end;
end;

procedure TfmrCadNF_AlterarItens.clearCampos;
begin
  ckCFOP.Checked := False;
  ckcst.Checked := False;
  ckcsosn.Checked := False;
  ckdeson.Checked := False;
  ckcalc.Checked := False;
  ckpicms.Checked := False;
  ckpredbc.Checked := False;
  ckpst.Checked := False;
  ckpredbcst.Checked := False;
  ckmva.Checked := False;
  ckpdif.Checked := False;
  ckpfcp.Checked := False;
  ckpfcpst.Checked := False;
end;

procedure TfmrCadNF_AlterarItens.DBGrid13DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (Trim(nota.vItem.dataSet.FieldByName('sel').AsString) = 'S') then
    //(Column.FieldName = 'NITEM') then
  begin                                                      
    DBGrid13.Canvas.Brush.Color := $00FFD9B3;
    DBGrid13.Canvas.Font.Color := clWindowText;
    DBGrid13.Canvas.FillRect(Rect);
    DBGrid13.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfmrCadNF_AlterarItens.DBGrid13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    nota.vItem.marcaItem(opmIndividual)
  else if Key = VK_F4 then
    nota.vItem.marcaItem(opmTodos);
end;

procedure TfmrCadNF_AlterarItens.edcfopChange(Sender: TObject);
var
  currentControl: string;
  seachControl: TComponent;
begin
  inherited;

  currentControl := TComponent(Sender).Name;
  seachControl := FindComponent('ck' + Copy(currentControl, 3, Length(currentControl)));

  if Assigned(seachControl) and (seachControl is TCheckBox) then
    (seachControl as TCheckBox).Checked := True;
end;

procedure TfmrCadNF_AlterarItens.filter_descrChange(Sender: TObject);
begin
  inherited;
  handleFilter;
end;

procedure TfmrCadNF_AlterarItens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fmrCadNF_AlterarItens := nil;
end;

procedure TfmrCadNF_AlterarItens.FormShow(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  bt_filter_clear.Click;
  bt_campos_clear.Click;
  filter_csosn.Enabled := vDadosIni.vEmp.vRegime = 'SIMPLES';
  ckcsosn.Enabled := filter_csosn.Enabled;
  edcsosn.Enabled := filter_csosn.Enabled;

  for I := 0 to Self.ComponentCount - 1 do
    if Self.Components[I] is TEditHw then
      if (Self.Enabled) and (Self.Visible) and ((Self.Components[I] as TEditHw).CanFocus) then
        (Self.Components[I] as TEditHw).SetFocus;
              
  clearCampos;
  clearCampos;
  if (Self.Enabled) and (Self.Visible) and (filter_descr.CanFocus) then
  	filter_descr.SetFocus;
end;

procedure TfmrCadNF_AlterarItens.handleFilter;
var
  filter: string;
begin

  filter := IfThen(Trim(filter_descr.Text) <> '', '|' + 'descricao_item like ''%' + Trim(filter_descr.Text) + '%''') +
            IfThen(Trim(filter_cfop.Text ) <> '', '|' + 'codigo_nop = '           + Trim(filter_cfop.Text)) +
            IfThen(Trim(filter_cst.Text  ) <> '', '|' + 'cst like ''%'            + Trim(filter_cst.Text) + '%''') +
            IfThen(Trim(filter_csosn.Text) <> '', '|' + 'csosn like ''%'          + Trim(filter_csosn.Text) + '%''') +
            IfThen(Trim(filter_ncm.Text  ) <> '', '|' + 'ncm like ''%'            + Trim(filter_ncm.Text) + '%''') +
            IfThen(Trim(filter_cest.Text ) <> '', '|' + 'cest like ''%'           + Trim(filter_cest.Text) + '%''');

  while StartsStr('|', filter) do
    System.Delete(filter, 1, 1);

  filter := ReplaceStr(filter, '|', ' and ');

  if filter <> '' then
    nota.vItem.filterStr(filter)
  else
    nota.vItem.filterClear;
end;

procedure TfmrCadNF_AlterarItens.bt_campos_clearClick(Sender: TObject);
begin
  inherited;
  clearCampos;
  clearCampos;
end;

end.
