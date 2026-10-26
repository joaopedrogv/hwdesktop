unit uCadDesoneracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, uDataSet_OOP;

type
  TfrmCadDesoneracao = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    pn_cadastro: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label8: TLabel;
    grid_regras: TStringGrid;
    Label9: TLabel;
    grid_ncms: TStringGrid;
    Label10: TLabel;
    bt_regras_add: TSpeedButton;
    bt_regras_del: TSpeedButton;
    bt_excecoes_add: TSpeedButton;
    bt_excecoes_del: TSpeedButton;
    ts_regras: TTabSheet;
    pn_regras: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    lb_ufs: TListBox;
    Label11: TLabel;
    lb_csts: TListBox;
    Label12: TLabel;
    Label13: TLabel;
    ck_contribuimte: TCheckBox;
    ck_isento: TCheckBox;
    ck_nao_contribuinte: TCheckBox;
    Label14: TLabel;
    ck_fisica: TCheckBox;
    ck_juridica: TCheckBox;
    Label15: TLabel;
    ck_consu_final: TCheckBox;
    ck_nao_consu_final: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label16: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    bt_regras_edit: TSpeedButton;
    procedure bt_regras_editClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lb_cstsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lb_ufsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lb_ufsExit(Sender: TObject);
    procedure lb_ufsEnter(Sender: TObject);
    procedure grid_regrasDblClick(Sender: TObject);
    procedure bt_regras_delClick(Sender: TObject);
    procedure bt_regras_addClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure lb_cstsDblClick(Sender: TObject);
    procedure lb_ufsDblClick(Sender: TObject);
    procedure lb_cstsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure lb_ufsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure pn_regrasEnter(Sender: TObject);
    procedure bt_excecoes_addClick(Sender: TObject);
    procedure bt_excecoes_delClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Flk_motivo: TDadosLookUp_OOP;
    Flk_finalidade: TDadosLookUp_OOP;
    procedure regras_change(Sender: TObject);
    procedure excecoes_change(Sender: TObject);

    procedure montarComponentes;
  public
    { Public declarations }
  end;

var
  frmCadDesoneracao: TfrmCadDesoneracao;

implementation

uses
  StrUtils,
  Math,
  uClassesDesoneracao,
  uDtmAtivo,
  base_class,
  desoneracao_class,
  desoneracao_regras_class,
  desoneracao_excecoes_class,
  uDadosIni;

{$R *.dfm}

procedure TfrmCadDesoneracao.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('PRO322', 'CONSULTA', '', deson.TableName, '', deson.buscas, False) then
      Exit;

    inherited;

    if MaskEdit2.Visible then
    begin
      if not deson.ConsultaCampos(deson.TableName, ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if deson.ConsultaCampos(deson.TableName, MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadDesoneracao.BitBtn3Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ActiveControl := BitBtn3;

    montarComponentes;

    deson.regras.OnChange   := regras_change;
    deson.excecoes.OnChange := excecoes_change;

    if not deson.Insert then
    begin
      deson.regras.OnChange   := nil;
      deson.excecoes.OnChange := nil;

      Exit;
    end;

    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadDesoneracao.BitBtn4Click(Sender: TObject);
begin
  if not deson.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(deson.vNomeCampoErro);
  end
  else
  begin
    deson.regras.OnChange   := nil;
    deson.excecoes.OnChange := nil;

    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
    begin
      if deson.Insert then
      begin
        deson.regras.OnChange   := regras_change;
        deson.excecoes.OnChange := excecoes_change;

        PageControl3.ActivePage := tsCadastro;
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      end;
    end
    else if TelaCadastro = 2 then
      BitBtn5.Click
    else
      inherited;
  end;
end;

procedure TfrmCadDesoneracao.BitBtn5Click(Sender: TObject);
begin
  inherited;
  deson.regras.OnChange   := nil;
  deson.excecoes.OnChange := nil;
  deson.Cancel;
end;

procedure TfrmCadDesoneracao.BitBtn7Click(Sender: TObject);
begin
  inherited;
  try

    if Assigned(deson.regras.current) then with deson.regras.current do
    begin

      if not vDadosIni.PesqPros('PRO329', 'CONSULTA',
        Format('%d - %s [%d - %s - %s]', [deson.objeto.id, deson.objeto.descricao, id_regras, sigla_uf, csts]),
        SQLMotor().MetaTable.name, IntToStr(id_regras), deson.buscas) then
        Exit;

      contribuinte     := IfThen(ck_contribuimte.Checked, '1|') +
                          IfThen(ck_isento.Checked, '2|') +
                          IfThen(ck_nao_contribuinte.Checked, '9|');

      pessoa           := IfThen(ck_fisica.Checked, '0|') +
                          IfThen(ck_juridica.Checked, '1|');

      consumidor_final := IfThen(ck_nao_consu_final.Checked, '0|') +
                          IfThen(ck_consu_final.Checked, '1|');

      finalidadeid     := IfThen(DBLookupComboBox2.KeyValue <> Null, Flk_finalidade.fint('id'));

      if sigla_uf = '' then       
        deson.raiseExceptionCreate('Pelo menos 1 estado deve ser selecionado', lb_ufs.Name);

      if csts = '' then
        deson.raiseExceptionCreate('Pelo menos 1 CST deve ser selecionado', lb_csts.Name);

      if contribuinte = '' then
        deson.raiseExceptionCreate('Pelo menos 1 opção para o Contribuinte deve ser selecionada', '');

      if pessoa = '' then
        deson.raiseExceptionCreate('Pelo menos 1 opção para o Tipo Pessoa deve ser selecionada', '');

      if consumidor_final = '' then
        deson.raiseExceptionCreate('Pelo menos 1 opção para o Ind Finalidade deve ser selecionada', '');

      TForm(pn_regras.Parent).ModalResult := IDOK;
    end;

  except on E: Exception do
    begin
      vDadosIni.registraErro('TfrmCadDesoneracao.BitBtn7Click ' + e.Message);
      setFocusCampoErro(deson.vNomeCampoErro, deson.vMensagemErro);
    end;
  end;
end;

procedure TfrmCadDesoneracao.bt_excecoes_addClick(Sender: TObject);
var
  Ancm: string;
begin
  inherited;
  if not vDadosIni.PesqPros('PRO331', 'INSERIR', '', 'DESONERACAO_EXCECOES', '', deson.buscas, False) then
    Exit;

  Ancm := '';
  if InputQuery('Exceção de NCM', 'Informe o NCM', Ancm) then
    deson.excecoes.Incluir(Ancm);
end;

procedure TfrmCadDesoneracao.bt_excecoes_delClick(Sender: TObject);
var
  Aindex: Integer;
begin
  inherited;
  Aindex := grid_ncms.Col + ( grid_ncms.Row * grid_ncms.ColCount);
  deson.excecoes.DeleteItem(Aindex);
end;

procedure TfrmCadDesoneracao.bt_regras_addClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO327', 'INSERIR', '', 'DESONERACAO_REGRAS', '', deson.buscas, False) then
    Exit;

  deson.regras.current := TDesoneracao_regras_class.Create;
  deson.regras.current.beginChanges(True);

  if vDadosIni.abreForm('Nova regra para desoneração', pn_regras, opFormsDefCad)  then
  begin
    deson.regras.current.recordState := rsNew;
    deson.regras.AddItem(deson.regras.current);
  end;
end;

procedure TfrmCadDesoneracao.bt_regras_delClick(Sender: TObject);
begin
  inherited;
  deson.regras.DeleteItem(grid_regras.Row - 1);
end;

procedure TfrmCadDesoneracao.bt_regras_editClick(Sender: TObject);
var
  Aregra: TDesoneracao_regras_class;
begin
  inherited;

  if deson.regras.OutOfBounds(grid_regras.Row - 1) then
    Exit;

  deson.regras.current := deson.regras.Items[grid_regras.Row - 1].Clone;

  with deson do with regras.current do
    if not vDadosIni.PesqPros('PRO328', 'ALTERAR', Format('%d - %s [%d - %s - %s]', [fint('id'), fstr('descricao'), id_regras, sigla_uf, csts]),
      'DESONERACAO_REGRAS', '', buscas, False) then
      Exit;

  if vDadosIni.abreForm('Alteração de regra para desoneração', pn_regras, opFormsDefCad)  then
    if deson.regras.current.HasChangesIn then
    begin
      if deson.regras.current.recordState <> rsNew  then
        deson.regras.current.recordState := rsUpdated;
      deson.regras.Items[grid_regras.Row - 1].CopyFrom(deson.regras.current);//.Clone;
      regras_change(deson.regras);
    end;
end;

procedure TfrmCadDesoneracao.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadDesoneracao.excecoes_change(Sender: TObject);
var
  Lista: TDesoneracao_Excecoes;
  I, Row, Col: Integer;
begin
  Lista := TDesoneracao_Excecoes(Sender);

  grid_ncms.ColCount := 9;
  grid_ncms.RowCount := Trunc(Lista.Count / grid_ncms.ColCount) + 1;

  for Row := 0 to grid_ncms.RowCount - 1 do
    for Col := 0 to grid_ncms.ColCount - 1 do
      grid_ncms.Cells[Col, Row] := '';

  Col := 0;
  Row := 0;
  for I := 0 to Lista.Count - 1 do with Lista.Items[I] do
  begin
    grid_ncms.Cells[Col, Row] := ncm;
    Col := Col + 1;
    if Col > grid_ncms.ColCount - 1 then
    begin
      Col := 0;
      Row := Row + 1;
    end;
  end;
end;

procedure TfrmCadDesoneracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;   
  Action := caFree;
  frmCadDesoneracao := nil;

  if Assigned(Flk_motivo) then
    FreeAndNil(Flk_motivo);

  if Assigned(Flk_finalidade) then
    FreeAndNil(Flk_finalidade);

  if Assigned(deson) then
    FreeAndNil(deson);
end;

procedure TfrmCadDesoneracao.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  if not Assigned(deson) then
  begin
    deson := TDesoneracao.Create;
    DBGrid1.DataSource := deson._dataSourceOOP;
  end;

  tsCadastro.TabVisible := False;
  ts_regras.TabVisible := False;
  TabSheet1.TabVisible := False;
  PageControl1.ActivePage := TabSheet2;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadDesoneracao.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := deson._dataSourceOOP;
    deson.montaSelect('select %s from desoneracao where id = 0 and cod_empresa = 0', [TDesoneracao_class.GetFieldsSql()]);
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  imgInformation.Hint := imgInformation.Hint + sLineBreak + sLineBreak +
   'PRO322 - BT PESQUISAR DESONERACAO' + sLineBreak +
   'PRO323 - BT INSERIR DESONERACAO' + sLineBreak +
   'PRO324 - BT ALTERAR DESONERACAO' + sLineBreak +
   'PRO325 - BT EXCLUIR DESONERACAO' + sLineBreak +
   'PRO326 - BT SALVAR DESONERACAO' + sLineBreak +
   'PRO327 - BT INSERIR REGRA DESONERACAO' + sLineBreak +
   'PRO328 - BT ALTERAR REGRA DESONERACAO' + sLineBreak +
   'PRO329 - BT SALVAR REGRA DESONERACAO' + sLineBreak +
   'PRO330 - BT EXCLUIR REGRA DESONERACAO' + sLineBreak +
   'PRO331 - BT INSERIR EXCECAO DESONERACAO' + sLineBreak +
   'PRO332 - BT EXCLUIR EXCECAO DESONERACAO';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadDesoneracao.grid_regrasDblClick(Sender: TObject);
begin
  inherited;
  bt_regras_edit.Click;
end;

procedure TfrmCadDesoneracao.lb_cstsDblClick(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if Assigned(deson.regras.current) then with deson.regras.current do
  begin
    if lb_csts.ItemIndex > -1 then
      if Pos(Trim(lb_csts.Items[lb_csts.ItemIndex]) + '|', csts) = 0 then
        csts := csts + Trim(lb_csts.Items[lb_csts.ItemIndex]) + '|'
      else
      begin
        vTemp:= Trim(csts);
        Delete(vTemp, Pos(Trim(lb_csts.Items[lb_csts.ItemIndex]) + '|', vTemp), 3);
        csts := vTemp;
      end;
  end;
end;

procedure TfrmCadDesoneracao.lb_cstsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  if Assigned(deson.regras.current) then with deson.regras.current do
    with (Control as TListBox).Canvas do
    begin
      if (pos(Trim(lb_csts.Items[Index]) + '|', csts) > 0) then
      begin
         Brush.Color := clTeal;
         Font.Color  := clWhite;
      end;

      Brush.Style := bsSolid;
      FillRect(Rect);
      Brush.Style := bsClear;
      TextOut(Rect.Left, Rect.Top,(Control as TListBox).Items[Index]);
    end;
end;

procedure TfrmCadDesoneracao.lb_cstsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    lb_cstsDblClick(Sender);
end;

procedure TfrmCadDesoneracao.lb_ufsDblClick(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if Assigned(deson.regras.current) then with deson.regras.current do
  begin
    if lb_ufs.ItemIndex > -1 then
      if Pos(Trim(lb_ufs.Items[lb_ufs.ItemIndex]) + '|', sigla_uf) = 0 then
        sigla_uf := sigla_uf + Trim(lb_ufs.Items[lb_ufs.ItemIndex]) + '|'
      else
      begin
        vTemp:= Trim(sigla_uf);
        Delete(vTemp, Pos(Trim(lb_ufs.Items[lb_ufs.ItemIndex]) + '|', vTemp), 3);
        sigla_uf := vTemp;
      end;
  end;
end;

procedure TfrmCadDesoneracao.lb_ufsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  if Assigned(deson.regras.current) then with deson.regras.current do
    with (Control as TListBox).Canvas do
    begin
      if (pos(Trim(lb_ufs.Items[Index]) + '|', sigla_uf) > 0) then
      begin
         Brush.Color := clTeal;
         Font.Color  := clWhite;
      end;

      Brush.Style := bsSolid;
      FillRect(Rect);
      Brush.Style := bsClear;
      TextOut(Rect.Left, Rect.Top,(Control as TListBox).Items[Index]);
    end;
end;

procedure TfrmCadDesoneracao.lb_ufsEnter(Sender: TObject);
begin
  inherited;
  if TListBox(Sender).Tag > 0 then
    TListBox(Sender).Selected[TListBox(Sender).Tag]:= True
  else if TListBox(Sender).Tag = -1 then
    TListBox(Sender).Selected[0]:= True;
end;

procedure TfrmCadDesoneracao.lb_ufsExit(Sender: TObject);
begin
  inherited;
  TListBox(Sender).Tag := TListBox(Sender).ItemIndex;
  TListBox(Sender).Selected[TListBox(Sender).ItemIndex]:= False;
end;

procedure TfrmCadDesoneracao.lb_ufsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    lb_ufsDblClick(Sender);
end;

procedure TfrmCadDesoneracao.montarComponentes;
begin
  if not Assigned(DBEdit1.DataSource) then
  begin
    Flk_motivo := TDadosLookUp_OOP.create;
    Flk_motivo.setDadosDataSet(['0', '1', '3', '4', '5', '6', '7', '8', '9', '10', '11'],
                               ['0 - Sem desoneração',
                                '1 - Taxi',
                                '3 - Produtor Agropecuário',
                                '4 - Frotista/Locadora',
                                '5 - Diplomático/Consular',
                                '6 - Utilitários e Motocicletas da Amazônia Ocidental e Áreas de Livre Comércio (Resolução 714/88 e 790/94 – CONTRAN e suas alterações)',
                                '7 - SUFRAMA',
                                '8 - Venda a Órgão Público',
                                '9 - Outros. (NT 2011/004)',
                                '10 - Deficiente Condutor (Convênio ICMS 38/12)',
                                '11 - Deficiente Não Condutor (Convênio ICMS 38/12)'],
                                DBLookupComboBox1);

    Flk_finalidade := TDadosLookUp_OOP.create;
                                
    DBEdit1.DataSource := deson._dataSourceOOP;
    DBEdit2.DataSource := deson._dataSourceOOP;
    DBLookupComboBox1.DataSource := deson._dataSourceOOP;
  end;

  Flk_finalidade.setDadosDataSet('ID', 'DESCRICAO', deson.SqlOpen('select ID, DESCRICAO from finalidade' +
                                                                  ' where cod_empresa = ' + vDadosIni.codEmpresa +
                                                                  ' union ' +
                                                                  ' select 0 id, '' Todas as finalidades específicas'' descricao from rdb$database' +
                                                                  ' order by 2'), DBLookupComboBox2);
end;

procedure TfrmCadDesoneracao.pn_regrasEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if Assigned(deson.regras.current) then with deson.regras.current do
  begin
    ck_contribuimte.Checked     := Pos('1|', contribuinte) > 0;
    ck_isento.Checked           := Pos('2|', contribuinte) > 0;
    ck_nao_contribuinte.Checked := Pos('9|', contribuinte) > 0;
    ck_fisica.Checked           := Pos('0|', pessoa) > 0;
    ck_juridica.Checked         := Pos('1|', pessoa) > 0;
    ck_nao_consu_final.Checked  := Pos('0|', consumidor_final) > 0;
    ck_consu_final.Checked      := Pos('1|', consumidor_final) > 0;
    DBLookupComboBox2.KeyValue  := finalidadeid;
    for I := 0 to lb_ufs.Count - 1 do lb_ufs.Items[I] := '  ' + Trim(lb_ufs.Items[I]);
    for I := 0 to lb_csts.Count - 1 do lb_csts.Items[I] := '  ' + Trim(lb_csts.Items[I]);
  end;
end;

procedure TfrmCadDesoneracao.SpeedButton1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    montarComponentes;

    deson.regras.OnChange   := regras_change;
    deson.excecoes.OnChange := excecoes_change;

    if not deson.Edit then
    begin
      deson.regras.OnChange   := nil;
      deson.excecoes.OnChange := nil;

      exit;
    end;

    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;


    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadDesoneracao.SpeedButton2Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if deson.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if vDadosIni.ShowConfirmacao('Deseja mesmo excluir o registro') = IDYES then
      deson.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadDesoneracao.regras_change(Sender: TObject);
var
  Lista: TDesoneracao_Regras;
  I, Row, Col: Integer;
begin
  Lista := TDesoneracao_Regras(Sender);

  I := Lista.Count + 1;

  grid_regras.RowCount  := IfThen(I < 1, 1, I) + 1;
  grid_regras.ColCount  := 7;

  for Row := 0 to grid_regras.RowCount - 1 do
    for Col := 0 to grid_regras.ColCount - 1 do
      grid_regras.Cells[Col, Row] := '';

  grid_regras.Cells[00, 0] := 'UFs';
  grid_regras.Cells[01, 0] := 'CSTs';
  grid_regras.Cells[02, 0] := 'Contribuinte';
  grid_regras.Cells[03, 0] := 'Pessoa';
  grid_regras.Cells[04, 0] := 'Consumidor Final';
  grid_regras.Cells[05, 0] := 'Finalidade especifica';
  grid_regras.Cells[06, 0] := 'ID';

  grid_regras.ColWidths[00] := 200;

  for I := 0 to Lista.Count - 1 do with Lista.Items[I] do
  begin
    Row := I + 1;
    grid_regras.Cells[00, Row] := sigla_uf;
    grid_regras.Cells[01, Row] := csts;
    grid_regras.Cells[02, Row] := IfThen(Pos('1|', contribuinte) > 0, '1: Contribuinte ') +
                                  IfThen(Pos('2|', contribuinte) > 0, '2: Isento ') +
                                  IfThen(Pos('9|', contribuinte) > 0, '2: Não Contribuinte');
    grid_regras.Cells[03, Row] := IfThen(Pos('0|', pessoa) > 0, 'Física ') +
                                  IfThen(Pos('1|', pessoa) > 0, 'Jurídica');
    grid_regras.Cells[04, Row] := IfThen(Pos('0|', consumidor_final) > 0, 'Não ') +
                                  IfThen(Pos('1|', consumidor_final) > 0, 'Sim');
    grid_regras.Cells[05, Row] := IfThen(Flk_finalidade.dataSet.Locate('ID', finalidadeid, []), IntToStr(finalidadeid) + ' ' + Flk_finalidade.fstr('descricao'));
    grid_regras.Cells[06, Row] := IfThen(id_regras > 0, IntToStr(id_regras));
  end;

//  grid_regras.RowCount := Lista.Count + 1;//(I < 1, 1, I) + 3;
end;

end.
