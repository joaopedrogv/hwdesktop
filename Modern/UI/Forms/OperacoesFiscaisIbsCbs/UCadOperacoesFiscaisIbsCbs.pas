unit UCadOperacoesFiscaisIbsCbs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uDataSet_OOP, OperacaoFiscalIbsCbsEtdUnit, hw_audit_utils,
  IUIFormValidatorUnit, CheckLst, FilterPadraoFR, RegraFiscalIbsCbsEtdUnit,
  CheckListBoxEmpresasFrameUnit, ComboBoxClassTribFrameUnit,
  EditHwNullableFrameUnit, MaskEditNullableFrameUnit, FilterFR,
  ComboboxEntityPickerFrameUnit, ComboBoxRegrasFiscaisFrameUnit;

type
  TfrmCadOperacoesFiscaisIbsCbs = class(TfrmCadPadraoM)
    tabCadastro: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame;
    ckLixeira: TCheckBox;
    Label8: TLabel;
    edInicioVigencia: TMaskEdit;
    Label15: TLabel;
    edFinalVigencia: TMaskEditNullableFrame;
    Label16: TLabel;
    FilterFramePadrao1: TFilterFramePadrao;
    edPickerOpInterna: TComboboxEntityPickerFrame;
    edPickerGrupoFiscal: TComboboxEntityPickerFrame;
    ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FData: TDataSet_OOP;
    FAuditor: TAudit_OOP;
    FState: OperacaoFiscalIbsCbsEtd;
    FFormValidator: IUIFormValidator;

    // eventos selects
    procedure EventAddEntitiesSelects(Sender: TObject; Entity: TObject; out Display: string; out SetSelected: Boolean);
    procedure EventChangeEntitiesSelects(Sender: TObject; Entity: TObject; out Info: string);
    procedure RegrasFiscaisFrameChange(Sender: TObject; RegraFiscal: RegraFiscalIbsCbsEtd);

    function CriarMensagemAuditoriaFormState(): string;
    function CriarMensagemAuditoriaFormGrid(): string;
  private
    procedure ShowAbaCadastro();
    procedure MapStateToForm();
    procedure MapFormToState();
  public

  end;

implementation

uses
  uDtmAtivo, UIUtilsUnit, hw_utils, hw_grid_utils, Math, DB, StrUtils,   
  FieldsConfigUnit,
  Contnrs, UIFormValidatorFactoryUnit,
  ContainerUnit, CreateEntityUseCaseOutputUnit,
  EValidacaoNegocioUnit, StatusRegistroEnumUnit, ErpFeaturesFactoryUnit,
  TipoTributoFiscalEnumUnit, OperacaoInternaEtdUnit,
  ListarOperacoesInternasUseCaseUnit,
  GrupoFiscalEtdUnit, StringNullableUnit, DateTimeServiceUnit;

type
  TOperacoesFiscaisIbsCbsOOP = class(TDataSet_OOP)
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();
  end;

{$R *.dfm}

{ TOperacoesFiscaisIbsCbsOOP }

constructor TOperacoesFiscaisIbsCbsOOP.Create;
var
  I: Integer;
begin
  TableName := 'OP_FISCAIS_IBSCBS';
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_op_fiscais_ibscbs');

  SQLMaker.Build(
    TableName, 'o',
    // 'select  ' +
    '  o.id,  ' +
    '  o.op_interna_id o_op_interna_id, ' +
    '  o.regra_fiscal_id o_regra_fiscal_id, ' +
    '  o.grupo_fiscal_id o_grupo_fiscal_id, ' +
    '  o.data_ini_vigencia o_data_ini_vigencia, ' +
    '  o.data_fim_vigencia o_data_fim_vigencia, ' +
    '  o.ativo, ' +
    '  op.seqid op_seqid, ' +
    '  op.descricao op_descricao, ' +
    // '  op.ativo op_ativo, ' +
    //'  g.id g_id, ' +
    '  g.seqid g_seqid, ' +
    '  g.descricao g_descricao, ' +
    '  g.tipo_tributo g_tipo_tributo, ' +
    // '  g.ativo g_ativo, ' +
    '  r.descricao r_descricao, ' +
    '  r.cclasstrib r_cclasstrib, ' +
    '  r.pdifcbs r_pdifcbs, ' +
    '  r.pdifibsuf r_pdifibsuf, ' +
    '  r.pdifibsmun r_pdifibsmun, ' +
    //'  r.tpopergov r_tpopergov, ' +
    '  r.data_ini_vigencia r_data_ini_vigencia, ' +
    '  r.data_fim_vigencia r_data_fim_vigencia ' ,
    //'  r.ativo r_ativo, ' +
    // 'from op_fiscais_ibscbs o ' +
    'inner join op_internas op on op.id = o.op_interna_id ' +
    'inner join regras_fiscais_ibscbs r on r.id = o.regra_fiscal_id ' +
    'left join grupos_fiscais g on g.id = o.grupo_fiscal_id ',
    '','op.descricao, r.descricao, g.descricao'
  );                              

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('id,ativo,o_op_interna_id,o_regra_fiscal_id,o_grupo_fiscal_id', fvInvisivel)
      .Add('o_data_ini_vigencia', 'Inicio Vigencia')
      .Add('o_data_fim_vigencia', 'Fim Vigencia')
      .Add('op_seqid', 'Cod. Op Interna')
      .Add('op_descricao', 'Operação Interna', fvSempreVisivel)
      .Add('g_seqid', 'Cod. Grupo Fiscal')
      .Add('g_descricao', 'Grupo Fiscal', fvSempreVisivel)
      .Add('g_tipo_tributo', 'Tipo Tributo', GetText)
      .Add('r_descricao', 'Regra Fiscal', fvSempreVisivel)
      .Add('r_cclasstrib', 'CClass Trib', fvSempreVisivel)
      .Add('r_pdifcbs', 'Perc Diferimento CBS', '', DisplayNumber(4))
      .Add('r_pdifibsuf', 'Perc Diferimento IBS UF', '', DisplayNumber(4))
      .Add('r_pdifibsmun', 'Perc Diferimento IBS Municipio', '', DisplayNumber(4))
      .Add('r_data_ini_vigencia', 'Inicio Vigencia Regra Fiscal')
      .Add('r_data_fim_vigencia', 'Fim Vigencia Regra Fiscal')
  );

  SQLMaker.FilterMk.FreeFilters()
    .AddIsNull('id', True);

  RunSQLMaker();
end;

procedure TOperacoesFiscaisIbsCbsOOP.GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'G_TIPO_TRIBUTO' then
    Text := TipoTributoFiscalEnumDisplay[TipoTributoFiscalEnum(Sender.AsInteger)];
end;

{ TfrmCadOperacoesFiscaisIbsCbs }

procedure TfrmCadOperacoesFiscaisIbsCbs.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not FAuditor.Processo('MOD020').Visualizar()
      .Permitido() then
      Exit;

    FData.SQLMaker.FilterMk.FreeFilters()
      .Add('ativo', IfThen(not ckLixeira.Checked, 1))
      .Add(FilterFramePadrao1.GetFiltros());

    FData.RunSQLMaker();

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.BitBtn3Click(Sender: TObject);
begin           
  if not FAuditor.Processo('MOD021').Inserir()
    .Permitido() then
    Exit;
  try
    Screen.Cursor := crHourGlass;

    FState.Free();
    FState := OperacaoFiscalIbsCbsEtd.Create();

    MapStateToForm();
    ShowAbaCadastro();

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.BitBtn4Click(Sender: TObject);
var
  createResult: CreateEntityUseCaseOutPut;
begin
  MapFormToState(); 

  if not FAuditor.Processo('MOD023').Salvar()
    .Permitido() then
    Exit;

  try

    try
      with Container.GetInstance().ErpFeaturesFactory.CreateSalvarOperacaoFiscalIbsCbsUseCase() do
      try
        createResult := Executar( FState );
      finally
        FreeSafe();
      end;

      if not createResult.Validation.IsValid then
        FFormValidator.Validate(createResult.Validation)

      else
      begin
        FAuditor.Sucesso().GravarMensagem( CriarMensagemAuditoriaFormState() );

        inherited;
        FData.Refresh();
      end;

    finally
      createResult.Free();
    end;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

function TfrmCadOperacoesFiscaisIbsCbs.CriarMensagemAuditoriaFormGrid: string;
begin
  Result := '';
  if not FData.fempty('op_seqid') then
    Result := Result + Format(' OP: %d', [ FData.fint('op_seqid') ]);

  if not FData.fempty('op_seqid') then
    Result := Result + Format(' GF: %d', [ FData.fint('g_seqid') ]);

  if not FData.fempty('op_seqid') then
    Result := Result + Format(' RF: %s - %s', [ FData.fstr('r_cclasstrib'), FData.fstr('r_descricao') ]);

  Result := Trim(Result);
end;

function TfrmCadOperacoesFiscaisIbsCbs.CriarMensagemAuditoriaFormState: string;
var
  item: TObject;
begin
  Result := '';

  item := edPickerOpInterna.GetSelectedEntity();
  if item <> nil then
    Result := Result + Format(' OP: %d', [ OperacaoInternaEtd(item).SeqId ]);

  item := edPickerGrupoFiscal.GetSelectedEntity();
  if item <> nil then
    Result := Result + Format('GF: %d', [ GrupoFiscalEtd(item).SeqId ]);

  item := ComboBoxRegrasFiscaisFrame1.GetRegraFiscal();
  try
    if item <> nil then
      Result := Result + Format('RF: %s - %s', [ RegraFiscalIbsCbsEtd(item).CClassTrib, RegraFiscalIbsCbsEtd(item).Descricao ]);
  finally
    item.Free()
  end;
  Result := Trim(Result);
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1.Click;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FData.Free();
  FState.Free();

  Action := caFree;

  inherited;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;

  FState   := OperacaoFiscalIbsCbsEtd.Create();
  FData    := TOperacoesFiscaisIbsCbsOOP.Create();
  FAuditor := FData.Auditor;

  FilterFramePadrao1.TodosToggle(True).FillForm(FData.dataSet, nil, 'Todos');

  edPickerOpInterna.OnEntitySelected := EventChangeEntitiesSelects;
  edPickerOpInterna.OnEntityAdd := EventAddEntitiesSelects;

  edPickerGrupoFiscal.OnEntitySelected := EventChangeEntitiesSelects;
  edPickerGrupoFiscal.OnEntityAdd := EventAddEntitiesSelects;

  ComboBoxRegrasFiscaisFrame1.OnRegraFiscalChange := RegrasFiscaisFrameChange;

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder()
    .Bind('OperacaoInternaId', edPickerOpInterna.edEntity)
    .Bind('RegraFiscalId', ComboBoxRegrasFiscaisFrame1.edRegrasFiscais)
    .Bind('GrupoFiscalId', edPickerGrupoFiscal.edEntity)
    .Bind(edInicioVigencia)
    .Bind('FimVigencia', edFinalVigencia.edMask)
    .Validator();

  DBGrid1.DataSource := FData._dataSourceOOP;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  configurarGridPeloConfigColunas(DBGrid1);
  PrimeiraPesquisa := False;

  inherited;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    BitBtn3.Click;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.FormShow(Sender: TObject);
begin
  PageControl3.ActivePage := tabCadastro;
  PageControl1.ActivePage := TabSheet2;
  Panel1.Visible          := True;
  tabCadastro.TabVisible  := True;

  if vShow <> 1 then
    inherited;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.MapFormToState;
begin
  // FState.OperacaoInternaId := ''; // ja atribuido no evento
  // FState.RegraFiscalId := '';
  // FState.GrupoFiscalId := '';
  FState.InicioVigencia := StrToDate(edInicioVigencia.Text);
  FState.FimVigencia := edFinalVigencia.GetDateNullable();
  FState.EmpresasId := CheckListBoxEmpresasFrame1.GetIdsEmpresasSelecionadas();
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.MapStateToForm;
var
  grupos: GruposFiscaisEtd;
begin
  with Container.GetInstance().ErpFeaturesFactory.CreateListarAtualeTodasOperacoesInternasUseCase() do
  try
    edPickerOpInterna.LoadEntities( Executar( FState.OperacaoInternaId ), True );
  finally
    FreeSafe();
  end;

  with Container.GetInstance().ErpFeaturesFactory.CreateListarAtualeTodosGruposFiscaisUseCase() do
  try
    grupos := Executar( FState.GrupoFiscalId.Value );
  finally
    FreeSafe();
  end;

  grupos.Insert(0, nil);
  edPickerGrupoFiscal.LoadEntities( grupos, True );

  ComboBoxRegrasFiscaisFrame1.Setup( FState.RegraFiscalId, False );
  edInicioVigencia.Text := DateToStr(FState.InicioVigencia);
  edFinalVigencia.Setup( FState.FimVigencia );
  CheckListBoxEmpresasFrame1.Setup( FState.EmpresasId, FState.Id <> '' );
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.RegrasFiscaisFrameChange(
  Sender: TObject; RegraFiscal: RegraFiscalIbsCbsEtd);
begin
  if Sender = ComboBoxRegrasFiscaisFrame1 then
  begin
    if RegraFiscal = nil then
      FState.RegraFiscalId := ''
    else
      FState.RegraFiscalId := RegraFiscal.Id;
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.EventAddEntitiesSelects(Sender,
  Entity: TObject; out Display: string;
  out SetSelected: Boolean);
begin
  SetSelected := False;
  if Sender = edPickerOpInterna then
  begin
    if Entity = nil then
      Display := ''
    else
    begin
      Display := OperacaoInternaEtd(Entity).Descricao;
      SetSelected := OperacaoInternaEtd(Entity).Id = FState.OperacaoInternaId;
    end;
  end
  else if Sender = edPickerGrupoFiscal then
  begin
    if Entity = nil then
      Display := '[ Vazio ]'
    else
    begin
      Display := GrupoFiscalEtd(Entity).Descricao;
      SetSelected := GrupoFiscalEtd(Entity).Id = FState.GrupoFiscalId.Value;
    end;
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.EventChangeEntitiesSelects(Sender,
  Entity: TObject; out Info: string);
var
  R: RegraFiscalIbsCbsEtd;
begin
  if Sender = edPickerOpInterna then
  begin
    if Entity = nil then
      FState.OperacaoInternaId := ''
    else
      FState.OperacaoInternaId := OperacaoInternaEtd(Entity).Id
  end

  else if Sender = edPickerGrupoFiscal then
  begin
    if Entity = nil then
      FState.GrupoFiscalId := StringNullable.NullInstance()
    else
      FState.GrupoFiscalId := StringNullable.CreateOrNull ( GrupoFiscalEtd(Entity).Id )
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.ShowAbaCadastro;
begin
  FFormValidator.Reset();

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tabCadastro;

  if edPickerOpInterna.edEntity.CanFocus then
    edPickerOpInterna.edEntity.SetFocus;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.SpeedButton1Click(Sender: TObject);
var
  dado: OperacaoFiscalIbsCbsEtd;
begin
  if FData.IsEmpty() then
    Exit;

  with Container.GetInstance().ErpFeaturesFactory.CreateObterOperacaoFiscalIbsCbsPorIdUseCase() do
  try
    dado := Executar(FData.fstr('id'));
  finally
    FreeSafe();
  end;

  if dado = nil then
    ShowAtencao('Registro não se encontra mais disponível')
  else if (dado.Ativo = saLixeira) and
    ((ShowConfirmacao('Registro encontra-se na Lixeira. Deseja restaurar o registro?') <> IDYES) or
    (not FAuditor.Processo('MOD025').Alterar()
      .SetMensagem( CriarMensagemAuditoriaFormGrid() )
      .Permitido() )) then
    dado.Free()
  else
  begin
    FState.Free();
    FState := dado;
    FState.Ativo := saAtivo;
    MapStateToForm();

    if not FAuditor.Processo('MOD022').Alterar()
      .SetMensagem( CriarMensagemAuditoriaFormState() )
      .Permitido() then
      Exit;

    ShowAbaCadastro();
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.SpeedButton2Click(Sender: TObject);
begin
  if FData.IsEmpty() or
    (ShowConfirmacao('Deseja mesmo enviar oa registro para a lixeira?') <> ID_YES) then
    Exit;       

  if not FAuditor.Processo('MOD024').Excluir()
    .SetMensagem( CriarMensagemAuditoriaFormGrid() )
    .Permitido() then
    Exit;

  try
    with Container.GetInstance().ErpFeaturesFactory.CreateRemoverOperacaoFiscalIbsCbsUseCase() do
    try
      Executar(FData.fstr('id'));
    finally
      FreeSafe();
    end;

    FAuditor.Sucesso().GravarMensagem( CriarMensagemAuditoriaFormGrid() );

    FData.Refresh();

  except
    on E: Exception do
      UIUtils.HandleError(E);
  end;
end;

end.
