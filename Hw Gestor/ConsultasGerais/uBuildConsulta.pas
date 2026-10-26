unit uBuildConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, UClassesConsGeral, Mask, Menus;

type
  TfrmBuilConsultaOLAP = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    PageControl1: TPageControl;
    tsSQL: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    memoSQLText: TMemo;
    Panel5: TPanel;
    Label3: TLabel;
    tvParamCons: TTreeView;
    Panel6: TPanel;
    Label2: TLabel;
    tvParamDB: TTreeView;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Panel7: TPanel;
    btSql_Next: TBitBtn;
    btSql_Cancel: TBitBtn;
    tsParams: TTabSheet;
    ScrollBox1: TScrollBox;
    Panel9: TPanel;
    Panel10: TPanel;
    btPamans_Undo: TBitBtn;
    btPamans_Next: TBitBtn;
    btPamans_Cancel: TBitBtn;
    tsFields: TTabSheet;
    Panel11: TPanel;
    Panel12: TPanel;
    btFields_Undo: TBitBtn;
    btFields_Next: TBitBtn;
    btFields_Cancel: TBitBtn;
    Panel13: TPanel;
    Label4: TLabel;
    tvDimensions: TTreeView;
    Panel14: TPanel;
    Label6: TLabel;
    tvSummarys: TTreeView;
    Panel15: TPanel;
    Label7: TLabel;
    tvFormulas: TTreeView;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    popUpViewFormulas: TPopupMenu;
    popUpFormula_nova: TMenuItem;
    popUpFormula_excluir: TMenuItem;
    tsConsultaName: TTabSheet;
    Panel16: TPanel;
    Panel17: TPanel;
    btConsulta_Undo: TBitBtn;
    btConsulta_Next: TBitBtn;
    btConsulta_Cancel: TBitBtn;
    btFields_OLAP: TBitBtn;
    tsConcluir: TTabSheet;
    Panel18: TPanel;
    Panel19: TPanel;
    btConcluir_Undo: TBitBtn;
    btConcluir_Cancel: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    edNomeConsulta: TEdit;
    cbGrupo: TComboBox;
    Panel8: TPanel;
    btConsulta_OLAP: TBitBtn;
    ScrollBox2: TScrollBox;
    GroupBox1: TGroupBox;
    memoInsertSql: TMemo;
    Panel2: TPanel;
    Label5: TLabel;
    edCodConsulta: TEdit;
    Panel20: TPanel;
    btConcluir_Concluir_Script: TBitBtn;
    SpeedButton1: TSpeedButton;
    Splitter5: TSplitter;
    GroupBox2: TGroupBox;
    Panel21: TPanel;
    btConcluir_Concluir_SaveDB: TBitBtn;
    ckCamposInternos: TCheckBox;
    procedure ckCamposInternosClick(Sender: TObject);
    procedure btConcluir_Concluir_SaveDBClick(Sender: TObject);
    procedure edCodConsultaChange(Sender: TObject);
    procedure btConcluir_Concluir_ScriptClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btConsulta_NextClick(Sender: TObject);
    procedure btConsulta_OLAPClick(Sender: TObject);
    procedure btFields_OLAPClick(Sender: TObject);
    procedure tvDimensionsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvDimensionsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure btConcluir_UndoClick(Sender: TObject);
    procedure btConsulta_UndoClick(Sender: TObject);
    procedure btFields_UndoClick(Sender: TObject);
    procedure btPamans_UndoClick(Sender: TObject);
    procedure btSql_CancelClick(Sender: TObject);
    procedure btSql_NextClick(Sender: TObject);
    procedure btFields_NextClick(Sender: TObject);
    procedure btPamans_NextClick(Sender: TObject);
    procedure popUpFormula_excluirClick(Sender: TObject);
    procedure popUpFormula_novaClick(Sender: TObject);
    procedure tvDimensionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvDimensionsDblClick(Sender: TObject);
    procedure tvParamConsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvParamConsDblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure memoSQLTextKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FbuildOLAP: TConsultasBuild;
    FConsOLAP: TRelConsGeral;
    FDragAnDropCurrent: Boolean;
    FConsultaOrigem: TConsultasSalvas;

    procedure Change_tvDB(AList: TParametrosList);
    procedure Change_tvCons(AList: TParametrosList);
    procedure Change_ParamNode(ATreeView: TTreeView; AnodeLevel_0: TTreeNode; AParametro: TParametros);
    procedure make_tvParam(AList: TParametrosList; var ATreeView: TTreeView);

    procedure Change_tvDimensions(AList: TConsultasSalvasFieldsList);
    procedure Change_tvSummarys(AList: TConsultasSalvasFieldsList);
    procedure Change_tvFormulas(AList: TConsultasSalvasFieldsList);
    procedure Change_FieldNode(AnodeLevel_0: TTreeNode; AField: TConsultasSalvasFields);
    procedure make_tvFieldList(AList: TConsultasSalvasFieldsList; var ATreeView: TTreeView);
    procedure add_tvField(AField: TConsultasSalvasFields; var ATreeView: TTreeView);
  public
    { Public declarations }
    property ConsOLAP: TRelConsGeral read FConsOLAP write FConsOLAP;
    property ConsultaOrigem: TConsultasSalvas read FConsultaOrigem write FConsultaOrigem;
  end;

var
  frmBuilConsultaOLAP: TfrmBuilConsultaOLAP;

implementation

uses
  StrUtils, UvisualizadorOLAP_2;

{$R *.dfm}

procedure TfrmBuilConsultaOLAP.add_tvField(AField: TConsultasSalvasFields;
  var ATreeView: TTreeView);
var
  Anode :TTreeNode;
begin
  Anode := ATreeView.Items.AddChild(nil, '');
  ATreeView.Items.AddChild(Anode, '');
  ATreeView.Items.AddChild(Anode, '');
  ATreeView.Items.AddChild(Anode, '');
  ATreeView.Items.AddChild(Anode, '');
  ATreeView.Items.AddChild(Anode, '');
//  ATreeView.Items.AddChild(Anode, '');
  Change_FieldNode(Anode, AField);
end;

procedure TfrmBuilConsultaOLAP.btSql_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBuilConsultaOLAP.btSql_NextClick(Sender: TObject);
var
  I: Integer;
  AComponent: TComponent;
begin
  for I := ScrollBox1.ComponentCount - 1 downto 0 do
  begin
    AComponent := ScrollBox1.Components[I];
    FreeAndNil(AComponent);
  end;

  FConsOLAP.criaparametrosform(Self, FbuildOLAP.ParametrosConsulta, ScrollBox1);

  for I := ScrollBox1.ComponentCount - 1 downto 0 do
  begin
    AComponent := ScrollBox1.Components[I];
    if (AComponent is TMaskEdit) then
      TMaskEdit(AComponent).Text := DateToStr(Now);
  end;

  if FbuildOLAP.ParametrosConsulta.Count = 0 then
    btPamans_Next.Click
  else
    PageControl1.ActivePage := tsParams;
end;

procedure TfrmBuilConsultaOLAP.btPamans_NextClick(Sender: TObject);
var
  I: Integer;
  AComponent: TComponent;
begin
  for I := ScrollBox1.ComponentCount - 1 downto 0 do
  begin
    AComponent := ScrollBox1.Components[I];
    if (AComponent is TMaskEdit) or (AComponent is TComboBox) then
    begin
      if (AComponent is TMaskEdit) then
        FbuildOLAP.ParametrosConsulta.Items[AComponent.Tag].value := TMaskEdit(AComponent).Text
      else
        FbuildOLAP.ParametrosConsulta.Items[AComponent.Tag].value := TComboBox(AComponent).Text;
    end;
  end;

  FbuildOLAP.verificarFields;

  PageControl1.ActivePage := tsFields;
end;

procedure TfrmBuilConsultaOLAP.btPamans_UndoClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsSQL;
end;

procedure TfrmBuilConsultaOLAP.btFields_OLAPClick(Sender: TObject);
var
  I: Integer;
  AForm : TFrmVisualizaOlap_2;
begin
  FConsOLAP.abreStatusProcessamento('', 'Abrindo Consulta Solicitada Aguarde...');
  try

    AForm := TFrmVisualizaOlap_2.Create(Application);
                           
    FbuildOLAP.Consulta.nome_salvo   := edNomeConsulta.Text;
    FbuildOLAP.Consulta.tipoconsulta := cbGrupo.Text;
    FbuildOLAP.Consulta.cod_consulta := -1;
    FbuildOLAP.setFieldsToConsulta;

    AForm.ComboBox1.Items.Clear;
    AForm.pnConsultasSalvas.Visible := False;
    AForm.Label1.Caption            := FbuildOLAP.Consulta.nome_salvo;
    AForm.Panel1.Caption            := FbuildOLAP.Consulta.nome_salvo;
    AForm.NomeConsulta              := FbuildOLAP.Consulta.nome_salvo;
    //AForm.PageControl1.Parent       := ATab;
    //AForm.Panel1.Parent             := ATab;
    AForm.Label1.Visible            := False;
    //AForm.Panel1.Visible            := False;

    FConsOLAP.montapesquisa(AForm.HCubeGERAL, AForm.HierCubeGrid1, '', '', Self, 0, FbuildOLAP.Consulta, True);

    AForm.ShowModal;

    FbuildOLAP.Consulta := FConsOLAP.ConsultaSalva_GetFromGrid(FbuildOLAP.Consulta, AForm.HierCubeGrid1);

    FbuildOLAP.rebuidFieldsFromConsulta;

  finally
    FConsOLAP.fechaStatusProcessamento;
  end;
end;

procedure TfrmBuilConsultaOLAP.btConsulta_OLAPClick(Sender: TObject);
begin
  btFields_OLAP.Click;
  btConsulta_Next.Enabled := True;
end;

procedure TfrmBuilConsultaOLAP.btConcluir_Concluir_SaveDBClick(Sender: TObject);
begin
  if FbuildOLAP.SalvarConsultaNoBanco then
  begin
    Application.MessageBox(PChar('Consulta salva com sucesso ' + #13 + #13 +
      'Codigo: ' + IntToStr(FbuildOLAP.Consulta.cod_consulta) + #13 +
      'Grupo: ' + FbuildOLAP.Consulta.tipoconsulta + #13 +
      'Título: ' + FbuildOLAP.Consulta.nome_salvo), 'Atenção', 0 + 64);
    memoSQLText.Lines.Clear;
    Close;
  end;  
end;

procedure TfrmBuilConsultaOLAP.btConcluir_Concluir_ScriptClick(Sender: TObject);
begin
  memoSQLText.Lines.Clear;
  Close;
end;

procedure TfrmBuilConsultaOLAP.btConcluir_UndoClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsConsultaName;
end;

procedure TfrmBuilConsultaOLAP.btConsulta_NextClick(Sender: TObject);
begin
  FbuildOLAP.Consulta.nome_salvo   := edNomeConsulta.Text;
  FbuildOLAP.Consulta.tipoconsulta := cbGrupo.Text;
  PageControl1.ActivePage := tsConcluir;
end;

procedure TfrmBuilConsultaOLAP.btConsulta_UndoClick(Sender: TObject);
begin
  FbuildOLAP.Consulta.nome_salvo   := edNomeConsulta.Text;
  FbuildOLAP.Consulta.tipoconsulta := cbGrupo.Text;
  PageControl1.ActivePage := tsFields;
end;

procedure TfrmBuilConsultaOLAP.btFields_NextClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsConsultaName;
end;

procedure TfrmBuilConsultaOLAP.btFields_UndoClick(Sender: TObject);
begin
  if FbuildOLAP.ParametrosConsulta.Count > 0 then
    PageControl1.ActivePage := tsParams
  else
    PageControl1.ActivePage := tsSQL;
end;

procedure TfrmBuilConsultaOLAP.Change_FieldNode(AnodeLevel_0: TTreeNode;
  AField: TConsultasSalvasFields);
var
  J: Integer;
begin
  AnodeLevel_0.Text := AField.nome_apresentacao + '{' +
    AField.nome_campo +
    IfThen(AField.tipo_pos <> '', ', ' + LowerCase(AField.tipo_pos)) +
    IfThen(AField.formatstring <> '', ', ' + AField.formatstring) +
    IfThen(AField.formula_campo <> '', ', ' + AField.formula_campo) +
    '}';

  AnodeLevel_0.Item[0].Text := 'Campo: ' + AField.nome_campo;
  AnodeLevel_0.Item[1].Text := 'Display: ' + AField.nome_apresentacao;
//  AnodeLevel_0.Item[2].Text := 'Tipo: ' + AField.tipo_campo;
  AnodeLevel_0.Item[2].Text := 'Posição: ' + AField.tipo_pos;
  AnodeLevel_0.Item[3].Text := 'Format string: ' + AField.formatstring;
  AnodeLevel_0.Item[4].Text := 'Fórmula: ' + AField.formula_campo;
end;

procedure TfrmBuilConsultaOLAP.Change_ParamNode(ATreeView: TTreeView;
  AnodeLevel_0: TTreeNode; AParametro: TParametros);
var
  J: Integer;
begin
  AnodeLevel_0.Text := Trim(StringReplace(AParametro.display, ':', '', [])) + '{' +
    IfThen( AParametro.value <> '', AParametro.value + ' ,') +
    LowerCase(AParametro.tipo) + ' ,' +
    AParametro.codigo + '}';

  AnodeLevel_0.Item[0].Text := 'Display: ' + AParametro.display;
  AnodeLevel_0.Item[1].Text := 'Valor: ' + AParametro.value;
  AnodeLevel_0.Item[2].Text := 'Tipo: ' + LowerCase(AParametro.tipo);
  AnodeLevel_0.Item[3].Text := 'Nome: ' + AParametro.codigo;
  AnodeLevel_0.Item[4].Text := 'Valores válidos:';
  AnodeLevel_0.Item[4].DeleteChildren;
  for J := 0 to AParametro.conteudo.Count - 1 do
    ATreeView.Items.AddChild(AnodeLevel_0.Item[4], AParametro.conteudo[J]);
end;

procedure TfrmBuilConsultaOLAP.Change_tvCons(AList: TParametrosList);
begin
    make_tvParam(AList, tvParamCons);
end;

procedure TfrmBuilConsultaOLAP.Change_tvDB(AList: TParametrosList);
begin
  make_tvParam(AList, tvParamDB);
end;

procedure TfrmBuilConsultaOLAP.Change_tvDimensions(
  AList: TConsultasSalvasFieldsList);
begin
  make_tvFieldList(AList, tvDimensions);
end;

procedure TfrmBuilConsultaOLAP.Change_tvFormulas(
  AList: TConsultasSalvasFieldsList);
begin
  make_tvFieldList(AList, tvFormulas);
end;

procedure TfrmBuilConsultaOLAP.Change_tvSummarys(
  AList: TConsultasSalvasFieldsList);
begin
  make_tvFieldList(AList, tvSummarys);
end;

procedure TfrmBuilConsultaOLAP.ckCamposInternosClick(Sender: TObject);
begin
  edCodConsultaChange(edCodConsulta);
end;

procedure TfrmBuilConsultaOLAP.edCodConsultaChange(Sender: TObject);
var
  AOut: Integer;
begin
   if TryStrToInt(edCodConsulta.Text, AOut) then
   begin
     memoInsertSql.Lines.Text := FbuildOLAP.GetSQLInsert(AOut, ckCamposInternos.Checked).Text;
     memoInsertSql.ScrollBars := ssBoth;
   end
   else
   begin
     memoInsertSql.Lines.Text := edCodConsulta.Text + ' não é um número inteiro válido';
     memoInsertSql.ScrollBars := ssNone;
   end;
end;

procedure TfrmBuilConsultaOLAP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FConsultaOrigem) then
    FreeAndNil(FConsultaOrigem);
  Action := caFree;
  frmBuilConsultaOLAP := nil;
end;

procedure TfrmBuilConsultaOLAP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	if Trim(memoSQLText.Lines.Text) = '' then
    CanClose := True
  else if Application.MessageBox('Deseja mesmo sair sem salvar a consulta?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    CanClose := False;
end;

procedure TfrmBuilConsultaOLAP.FormShow(Sender: TObject);
var
  I: Integer;
begin
  memoSQLText.Lines.Clear;
  edNomeConsulta.Clear;
  Timer1.Enabled := False;
  tsSQL.TabVisible := False;
  tsParams.TabVisible := False;
  tsFields.TabVisible := False;
  tsConsultaName.TabVisible := False;
  tsConcluir.TabVisible := False;  
  PageControl1.ActivePage := tsSQL;
  tsSQL.Show;

  if not Assigned(FConsOLAP) then
  begin
    tvParamDB.Items.Clear;
    tvParamCons.Items.Clear;
    memoSQLText.Enabled := False;
    btSql_Next.Enabled := False;
  end
  else
  begin
    memoSQLText.Enabled := True;
    FbuildOLAP     := TConsultasBuild.Create(FConsOLAP);

    FbuildOLAP.OnChangeParametrosDB       := Change_tvDB;
    FbuildOLAP.OnChangeParametrosConsulta := Change_tvCons;

    FbuildOLAP.OnChangeFieldsDimensions := Change_tvDimensions;
    FbuildOLAP.OnChangeFieldsSummarys   := Change_tvSummarys;
    FbuildOLAP.OnChangeFieldsFormulas   := Change_tvFormulas;

    FbuildOLAP.Iniciar;

    if Assigned(FConsultaOrigem) then
      with FbuildOLAP do
      begin
        Consulta.nome_salvo := 'COPIA - ' + ConsultaOrigem.nome_salvo;
        Consulta.tipoconsulta := ConsultaOrigem.tipoconsulta;
        Consulta.SQLText := ConsultaOrigem.SQLText;

        for I := 0 to Pred(ConsultaOrigem.Campos.Count) do
          Consulta.Campos.Add(ConsultaOrigem.Campos.Items[I].NewCopy);

        SQLText := Consulta.SQLText;
        memoSQLText.Text := SQLText;
        verificarParametros;
        rebuidFieldsFromConsulta;
      end;

    cbGrupo.Items := FbuildOLAP.GetGrupoConsulta;
    cbGrupo.Text        := FbuildOLAP.Consulta.tipoconsulta;
    edNomeConsulta.Text := FbuildOLAP.Consulta.nome_salvo;

    Timer1.Enabled := True;
  end;
end;

procedure TfrmBuilConsultaOLAP.make_tvFieldList(AList: TConsultasSalvasFieldsList;
  var ATreeView: TTreeView);
var
  I: Integer;
  Anode : TTreeNode;
begin
  ATreeView.Items.Clear;
  for I := 0 to AList.Count - 1 do
    add_tvField(AList.Items[I], ATreeView);
  begin
//    Anode := ATreeView.Items.AddChild(nil, '');
//    ATreeView.Items.AddChild(Anode, '');
//    ATreeView.Items.AddChild(Anode, '');
//    ATreeView.Items.AddChild(Anode, '');
//    ATreeView.Items.AddChild(Anode, '');
//    ATreeView.Items.AddChild(Anode, '');
//    ATreeView.Items.AddChild(Anode, '');
//    Change_FieldNode(Anode, AList.Items[I]);
  end;
end;

procedure TfrmBuilConsultaOLAP.make_tvParam(AList: TParametrosList;
  var ATreeView: TTreeView);
var
  I: Integer;
  Anode : TTreeNode;
begin
  ATreeView.Items.Clear;
  for I := 0 to AList.Count - 1 do
  begin
    Anode := ATreeView.Items.AddChild(nil, '');
    ATreeView.Items.AddChild(Anode, '');
    ATreeView.Items.AddChild(Anode, '');
    ATreeView.Items.AddChild(Anode, '');
    ATreeView.Items.AddChild(Anode, '');
    ATreeView.Items.AddChild(Anode, '');
    Change_ParamNode(ATreeView, Anode, AList.Items[I]);
  end;
end;

procedure TfrmBuilConsultaOLAP.memoSQLTextKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssCtrl in Shift then
    if Char(Key) = 'V' then
    begin
      FbuildOLAP.SQLText := memoSQLText.Lines.Text;
      FbuildOLAP.verificarParametros;
    end;
end;

procedure TfrmBuilConsultaOLAP.popUpFormula_excluirClick(Sender: TObject);
var
  AValue: string;
  AField: TConsultasSalvasFields;
  AIndex: Integer;

  function question_delete(AQuestion: string): Boolean;
  begin
    Result := Application.MessageBox(PChar(AQuestion), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES;
  end;
begin
  if not Assigned(tvFormulas.Selected) then
    Exit;

  if tvFormulas.Selected.Level = 0 then
  begin
    if not question_delete(Format('Excluir fórmula %s?', [tvFormulas.Selected.Text])) then
      Exit;
    AIndex := tvFormulas.Selected.Index;
    tvFormulas.Selected.Delete;
  end
  else if tvFormulas.Selected.Level = 1 then
  begin
    if not Assigned(tvFormulas.Selected.Parent) then
      Exit;
    if not question_delete(Format('Excluir fórmula %s?', [tvFormulas.Selected.Parent.Text])) then
      Exit;
    AIndex := tvFormulas.Selected.Parent.Index;
    tvFormulas.Selected.Parent.Delete;
  end
  else
    Exit;

  FbuildOLAP.Formulas.Delete(AIndex);
end;

procedure TfrmBuilConsultaOLAP.popUpFormula_novaClick(Sender: TObject);
var
  AValue: string;
  AField: TConsultasSalvasFields;
begin
  AValue := 'FORMULA' + IntToStr(FbuildOLAP.Formulas.Count + 1);
  try
    AField := TConsultasSalvasFields.create;

    if InputQuery('Campo', 'Informe o nome do campo para a fórmula', AValue) then
      if Trim(AValue) <> '' then
        AField.nome_campo := AValue;

    if InputQuery('Display', 'Informe o display nome do campo para a fórmula', AValue) then
      if Trim(AValue) <> '' then
        AField.nome_apresentacao := AValue;

    AValue := '';
    if InputQuery('Fórmula', 'Informe a fórmula do campo', AValue) then
      if Trim(AValue) <> '' then
        AField.formula_campo := AValue;

    if (AField.nome_campo = '') or (AField.nome_apresentacao = '') or (AField.formula_campo = '') then
      Exit;

    FbuildOLAP.Formulas.Add(AField.NewCopy);
    add_tvField(AField, tvFormulas);

  finally
    FreeAndNil(AField);
  end;
end;

procedure TfrmBuilConsultaOLAP.SpeedButton1Click(Sender: TObject);
begin
  memoInsertSql.SelectAll;
  memoInsertSql.CopyToClipboard;
  Application.MessageBox('Script copiado para área de transferência', 'Atenção', 64);
end;

procedure TfrmBuilConsultaOLAP.Timer1Timer(Sender: TObject);
begin
  if FbuildOLAP.SQLText <> memoSQLText.Lines.Text then
  begin
    FbuildOLAP.SQLText := memoSQLText.Lines.Text;
    FbuildOLAP.verificarParametros;
  end;
end;

procedure TfrmBuilConsultaOLAP.tvDimensionsDblClick(Sender: TObject);
var
  AValue: string;
  I: Integer;
  AExiste: Boolean;
  ATreeView, ATreeViewIn, ATreeViewOut: TTreeView;
  AField: TConsultasSalvasFields;
  AnodeSelect: TTreeNode;
  AFieldsIn, AFieldsOut: TConsultasSalvasFieldsList;
begin
  if not (Sender is TTreeView) then
    Exit;

  ATreeView := TTreeView(Sender);
  if ATreeView.Items.Count <= 0 then
    Exit;
  if not Assigned(ATreeView.Selected) then
    Exit;

  if ATreeView.Selected.Level = 0 then
  begin

    {$REGION 'movendo fields entre dimensions e sumamarys'}
    AFieldsOut := nil;

    if ATreeView.Name = 'tvDimensions' then//entao field para o sumario
    begin
      if not FbuildOLAP.Dimensions.Items[ATreeView.Selected.Index].isnumeric then
      begin
        Application.MessageBox('Campo não numerico não pode ser movido para os somatórios', 'Atenção', 0 + 64);
        Exit;
      end;
      
      AFieldsIn  := FbuildOLAP.Summarys;
      AFieldsOut := FbuildOLAP.Dimensions;

      ATreeViewIn  := tvSummarys;
      ATreeViewOut := tvDimensions;

    end
    else if ATreeView.Name = 'tvSummarys' then//entao sumário para filds
    begin
      AFieldsIn  := FbuildOLAP.Dimensions;
      AFieldsOut := FbuildOLAP.Summarys;

      ATreeViewIn  := tvDimensions;
      ATreeViewOut := tvSummarys;
    end;
    if Assigned(AFieldsOut) then
    begin
      AField := AFieldsOut.Items[ATreeViewOut.Selected.Index].NewCopy;

      AFieldsOut.Delete(ATreeViewOut.Selected.Index);
      AFieldsIn.Add(AField);

      if ATreeViewOut.Items.Count > 1 then
        AnodeSelect := ATreeViewOut.Selected.GetPrev
      else
        AnodeSelect := nil;
      ATreeViewOut.Selected.Delete;
      if Assigned(AnodeSelect) then AnodeSelect.Selected := True;

      add_tvField(AField, ATreeViewIn);
      ATreeViewIn.Items[ATreeViewIn.Items.Count - 1].Selected := True;
    end;
    {$ENDREGION}

  end
  else if ATreeView.Selected.Level = 1 then
  begin

    {$REGION 'alterando valores dos fields dimensions, summarys e formulas'}
    

    if not Assigned(ATreeView.Selected.Parent) then
      Exit;

    if ATreeView.Name = 'tvDimensions' then
    begin
      AField := FbuildOLAP.Dimensions.Items[ATreeView.Selected.Parent.Index];

      {$REGION 'campos que podem ser alterados apenas nas dimmensions'}
      if Pos('Posição:', ATreeView.Selected.Text) = 1 then
      begin
        AField.tipo_pos := IfThen(AField.tipo_pos = 'ROW' , 'COL') +
                           IfThen(AField.tipo_pos = 'COL' , 'PAGE') +
                           IfThen(AField.tipo_pos = 'PAGE', 'ROW') +
                           IfThen(AField.tipo_pos = ''    , 'PAGE');
         Change_FieldNode(ATreeView.Selected.Parent, AField);
      end
      {$ENDREGION}

    end
    else if ATreeView.Name = 'tvSummarys' then
      AField := FbuildOLAP.Summarys.Items[ATreeView.Selected.Parent.Index]
    else
    if ATreeView.Name = 'tvFormulas' then
    begin
      AField := FbuildOLAP.Formulas.Items[ATreeView.Selected.Parent.Index];

      {$REGION 'campos que podem ser alterados apenas nas formulas'}
      if Pos('Campo:', ATreeView.Selected.Text) = 1 then
      begin
        AValue := AField.nome_campo;
        if InputQuery('Campo', 'Informe o nome do campo para a ´fórmula', AValue) then
          if Trim(AValue) <> '' then
          begin
            AField.nome_campo := AValue;
            Change_FieldNode(ATreeView.Selected.Parent, AField);
          end;
      end
      else if Pos('Fórmula:', ATreeView.Selected.Text) = 1 then
      begin
        AValue := AField.formula_campo;
        if InputQuery('Fórmula', 'Informe a fórmula', AValue) then
          if Trim(AValue) <> '' then
          begin
            AField.formula_campo := AValue;
            Change_FieldNode(ATreeView.Selected.Parent, AField);
          end;
      end;  
      {$ENDREGION}

    end;

    {$REGION 'demais campos que podem ser alterados em todos os tipos, o display e formatstring'}
    if Pos('Display:', ATreeView.Selected.Text) = 1 then
    begin

      AValue := AField.nome_apresentacao;
      if InputQuery('Display', 'Informe o display do campo', AValue) then
        if Trim(AValue) <> '' then
        begin
          AField.nome_apresentacao := AValue;
          Change_FieldNode(ATreeView.Selected.Parent, AField);
        end;
    end
    else
    if Pos('Format string:', ATreeView.Selected.Text) = 1 then
    begin

      AValue := AField.formatstring;
      if InputQuery('Format string', 'Informe o formato do campo', AValue) then
        if Trim(AValue) <> '' then
        begin
          AField.formatstring := AValue;
          Change_FieldNode(ATreeView.Selected.Parent, AField);
        end;
    end;   
    {$ENDREGION}

    {$ENDREGION}

  end;
end;

procedure TfrmBuilConsultaOLAP.tvDimensionsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  ANodeSource , ANodeDestine : TTreeNode;
  AFieldSource, AFieldDestine: TConsultasSalvasFields;
  AList: TConsultasSalvasFieldsList;
begin
  ANodeSource  := TTreeView(Sender).Selected;
  ANodeDestine := TTreeView(Sender).GetNodeAt(X,Y);

  if (ANodeSource.Level = 0) and (ANodeDestine.Level = 0) then
  begin
    if ActiveControl = tvDimensions then
      AList := FbuildOLAP.Dimensions
    else if ActiveControl = tvSummarys then
      AList := FbuildOLAP.Summarys
    else if ActiveControl = tvFormulas then
      AList := FbuildOLAP.Formulas
    else
      Exit;

    AFieldSource  := AList.Items[ANodeSource.Index].NewCopy;
    AFieldDestine := AList.Items[ANodeDestine.Index].NewCopy;

    AList.Items[ANodeSource.Index]  := AFieldDestine;
    AList.Items[ANodeDestine.Index] := AFieldSource;

    Change_FieldNode(ANodeSource , AFieldDestine);
    Change_FieldNode(ANodeDestine, AFieldSource);
    ANodeDestine.Selected := True;
  end;
end;

procedure TfrmBuilConsultaOLAP.tvDimensionsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  ANodeSource, ANodeDestine: TTreeNode;
begin
  ANodeSource  := TTreeView(Source).Selected;
  ANodeDestine := TTreeView(Sender).GetNodeAt(X,Y);

  Accept := Assigned(ANodeDestine) and (ANodeSource <> ANodeDestine) and
           (ANodeSource.Level = 0) and (ANodeDestine.Level = 0) and
           (TTreeView(Sender).Name = TTreeView(Source).Name);
end;

procedure TfrmBuilConsultaOLAP.tvDimensionsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    tvDimensionsDblClick(TTreeView(Sender))
  else if (Key = VK_INSERT) and (ActiveControl = tvFormulas) then
    popUpFormula_nova.Click
  else if (Key = VK_DELETE) and (ActiveControl = tvFormulas) then
    popUpFormula_excluir.Click;
end;

procedure TfrmBuilConsultaOLAP.tvParamConsDblClick(Sender: TObject);
var
  AValue: string;
  I: Integer;
  AExiste: Boolean;
begin
  if tvParamCons.Items.Count <= 0 then
    Exit;
  if not Assigned(tvParamCons.Selected) then
    Exit;
  if not Assigned(tvParamCons.Selected.Parent) then
    Exit;


  if tvParamCons.Selected.Level = 1 then
  begin

    {$REGION 'display'}
    if Pos('Display:', tvParamCons.Selected.Text) = 1 then
    begin
      with FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Index] do
      begin
        if not novo then
        begin
          Application.MessageBox('Parametro não pode ser alterado', 'Atenção', 0);
          Exit;
        end;

        AValue := display;
        if InputQuery('Display da consulta', 'Informe o display do parametro', AValue) then
          if Trim(AValue) <> '' then
          begin
            display := AValue;
            Change_ParamNode(tvParamCons, tvParamCons.Selected.Parent, FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Index]);
          end;
      end;
    end
    {$ENDREGION}

    {$REGION 'tipo'}
    else if Pos('Tipo:', tvParamCons.Selected.Text) = 1 then
    begin
      with FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Index] do
      begin
        if not novo then
        begin
          Application.MessageBox('Parametro não pode ser alterado', 'Atenção', 0);
          Exit;
        end;

        tipo := IfThen(tipo = 'DATE', 'STRING', 'DATE');
        if tipo = 'DATE' then conteudo.Clear;
        Change_ParamNode(tvParamCons, tvParamCons.Selected.Parent, FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Index]);
      end;
    end
    {$ENDREGION}

    {$REGION 'valor'}
    else if Pos('Valor:', tvParamCons.Selected.Text) = 1 then
    begin
      with FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Index] do
      begin
        AValue := value;
        if InputQuery('Valor do parametro', 'Informe o valor do parametro', AValue) then
          if Trim(AValue) <> '' then
          begin
            value := AValue;
            Change_ParamNode(tvParamCons, tvParamCons.Selected.Parent, FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Index]);
          end;
      end;
    end
    {$ENDREGION}

    {$REGION 'valores validos insert'}
    else if Pos('Valores válidos:', tvParamCons.Selected.Text) = 1 then
    begin
      with FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Index] do
      begin
        if not novo then
        begin
          Application.MessageBox('Parametro não pode ser alterado', 'Atenção', 0);
          Exit;
        end;

        AValue := '';
        if InputQuery('Valor para escolha', 'Informe um valor para adicionar', AValue) then
          if Trim(AValue) <> '' then
          begin
            AExiste := False;
            for I := 0 to conteudo.Count - 1 do
              if conteudo[I] = AValue then
              begin
                AExiste := True;
                Break;
              end;
            if not AExiste then
            begin
              conteudo.Add(AValue);
              Change_ParamNode(tvParamCons, tvParamCons.Selected.Parent, FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Index]);
            end;
          end;
      end;
    end;
    {$ENDREGION}

  end
  else if (tvParamCons.Selected.Level = 2) then
  begin

    {$REGION 'update valores validos'}
      if (Pos('Valores válidos:', tvParamCons.Selected.Parent.Text) = 1 ) and
      (Assigned(tvParamCons.Selected.Parent.Parent)) then
    begin
      with FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Parent.Index] do
      begin
        AValue := conteudo[tvParamCons.Selected.Index];
        if InputQuery('Valor para escolha', 'Informe o novo valor', AValue) then
          if Trim(AValue) <> '' then
          begin
            conteudo[tvParamCons.Selected.Index]:= Copy(AValue, 1, 30);
            tvParamCons.Selected.Text := conteudo[tvParamCons.Selected.Index];
            Change_ParamNode(tvParamCons, tvParamCons.Selected.Parent.Parent, FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Parent.Index]);
          end;
      end;
    end;
    {$ENDREGION}

  end;

end;

procedure TfrmBuilConsultaOLAP.tvParamConsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key <> VK_DELETE then
    Exit;

  if not Assigned(tvParamCons.Selected) then
    Exit;
  if (tvParamCons.Selected.Level <> 2) then
    Exit;
  if not Assigned(tvParamCons.Selected.Parent) then
    Exit;

  if (tvParamCons.Selected.Level = 2) and
    (Pos('Valores válidos:', tvParamCons.Selected.Parent.Text) = 1 ) and
    (Assigned(tvParamCons.Selected.Parent.Parent)) then
  begin
    with FbuildOLAP.ParametrosConsulta.Items[tvParamCons.Selected.Parent.Parent.Index] do
    begin
      if Application.MessageBox('Excluir valor', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

      conteudo.Delete(tvParamCons.Selected.Index);
      tvParamCons.Items.Delete(tvParamCons.Selected);
    end;
  end;
end;

end.
