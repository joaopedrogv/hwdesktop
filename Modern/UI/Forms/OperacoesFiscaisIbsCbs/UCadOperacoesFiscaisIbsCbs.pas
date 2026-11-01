unit UCadOperacoesFiscaisIbsCbs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ModernCadastroFormUnit, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, OperacoesFiscaisIbsCbsDataSet,
  OperacoesFiscaisIbsCbsPresenter, OperacoesFiscaisIbsCbsView,
  OperacaoFiscalIbsCbsEtdUnit, OperacaoInternaEtdUnit, GrupoFiscalEtdUnit,
  CheckLst, RegraFiscalIbsCbsEtdUnit,
  CheckListBoxEmpresasFrameUnit, ComboBoxClassTribFrameUnit,
  EditHwNullableFrameUnit, MaskEditNullableFrameUnit,
  ComboboxEntityPickerFrameUnit, ComboBoxRegrasFiscaisFrameUnit;

type
  TfrmCadOperacoesFiscaisIbsCbs = class(TModernCadastroForm, IOperacoesFiscaisIbsCbsView)
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
    FData: TOperacoesFiscaisIbsCbsDataSet;
    FState: OperacaoFiscalIbsCbsEtd;
    FPresenter: TOperacoesFiscaisIbsCbsPresenter;

    // eventos selects
    procedure EventAddEntitiesSelects(Sender: TObject; Entity: TObject; out Display: string; out SetSelected: Boolean);
    procedure EventChangeEntitiesSelects(Sender: TObject; Entity: TObject; out Info: string);
    procedure RegrasFiscaisFrameChange(Sender: TObject; RegraFiscal: RegraFiscalIbsCbsEtd);

    function CriarMensagemAuditoriaFormState(): string;

    procedure ExibirListas(
      AOperacoesInternas: OperacoesInternasEtd;
      AGruposFiscais: GruposFiscaisEtd
    );
  private
    procedure ShowAbaCadastro();
    procedure MapStateToForm();
    procedure MapFormToState();
  public
    procedure SetupPresenter(APresenter: TOperacoesFiscaisIbsCbsPresenter);
    destructor Destroy; override;
  end;

implementation

uses
  uDtmAtivo, UIUtilsUnit, hw_utils, hw_grid_utils, Math, DB,
  FieldsConfigUnit, EntityMetadataUnit, OperacaoFiscalIbsCbsMetadataUnit,
  Contnrs, UIFormValidatorFactoryUnit, DbGridConfigUtilsUnit,
  StatusRegistroEnumUnit,
  StringNullableUnit, DateTimeServiceUnit;

{$R *.dfm}

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
      .Add(FiltroGrid.GetFiltros());

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

    if not FPresenter.CarregarListasSelecao(
      FState.OperacaoInternaId, FState.GrupoFiscalId.ToText('')
    ) then
      Exit;

    MapStateToForm();
    ShowAbaCadastro();

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.BitBtn4Click(Sender: TObject);
begin
  MapFormToState();

  if not FAuditor.Processo('MOD023').Salvar()
    .Permitido() then
    Exit;

  if FPresenter.Salvar(FState) then
  begin
    try
      FAuditor.Sucesso().GravarMensagem( CriarMensagemAuditoriaFormState() );

      inherited;
      FData.Refresh();
    except
      on E: Exception do
        UIUtils.HandleError(E);
    end;
  end;
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
  FreeAndNil(FData);
  FreeAndNil(FState);

  Action := caFree;

  inherited;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.FormCreate(Sender: TObject);
var
  Builder: IFieldsConfigBuilder;
  Meta: EntityMetadata;
begin
  TelaCadastro := vDadosIni.vTipoForm;

  FState   := OperacaoFiscalIbsCbsEtd.Create();
  FData    := TOperacoesFiscaisIbsCbsDataSet.Create();
  FAuditor := FData.Auditor;

  Builder := FieldsConfigFactory.Create();

  FData.Setup(Builder);

  SetupDataSetGrid(FData);

  FiltroGrid.TodosToggle(True).FillForm(FData.dataSet, nil, 'Todos');

  edPickerOpInterna.OnEntitySelected := EventChangeEntitiesSelects;
  edPickerOpInterna.OnEntityAdd := EventAddEntitiesSelects;

  edPickerGrupoFiscal.OnEntitySelected := EventChangeEntitiesSelects;
  edPickerGrupoFiscal.OnEntityAdd := EventAddEntitiesSelects;

  ComboBoxRegrasFiscaisFrame1.OnRegraFiscalChange := RegrasFiscaisFrameChange;

  Meta := TOperacaoFiscalIbsCbsMetadata.GetMetadata();

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder(Meta, BitBtn4)
    .Bind('OperacaoInternaId', edPickerOpInterna.edEntity)
    .Bind('RegraFiscalId', ComboBoxRegrasFiscaisFrame1.edRegrasFiscais)
    .Bind('GrupoFiscalId', edPickerGrupoFiscal.edEntity)
    .Bind(edInicioVigencia)
    .Bind('FimVigencia', edFinalVigencia.edMask)
    .Validator();

  DbGridConfigUtils.ApplyToDBGrid(DBGrid1, Builder.List);

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
begin
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

  if not FPresenter.ObterParaEdicao(FData.fstr('id'), dado) then
    Exit;

  if dado.Ativo = saLixeira then
  begin
    if ShowConfirmacao('Registro encontra-se na Lixeira. Deseja restaurar o registro?') <> IDYES then
    begin
      dado.Free();
      Exit;
    end;

    if not FData.GetAuditorFill('MOD025').Alterar().Permitido() then
    begin
      dado.Free();
      Exit;
    end;
  end;

  FState.Free();
  FState := dado;
  FState.Ativo := saAtivo;

  if not FPresenter.CarregarListasSelecao(
    FState.OperacaoInternaId, FState.GrupoFiscalId.ToText('')
  ) then
    Exit;

  MapStateToForm();

  if not FAuditor.Processo('MOD022').Alterar()
    .SetMensagem( CriarMensagemAuditoriaFormState() )
    .Permitido() then
    Exit;

  ShowAbaCadastro();
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.SpeedButton2Click(Sender: TObject);
begin
  if FData.IsEmpty() or
    (ShowConfirmacao('Deseja mesmo enviar oa registro para a lixeira?') <> ID_YES) then
    Exit;       

  if not FData.GetAuditorFill('MOD024').Excluir()
    .Permitido() then
    Exit;

  if FPresenter.Remover(FData.fstr('id')) then
  begin
    try
      FAuditor.Sucesso().GravarMensagem(FAuditor.Mensagem);
      FData.Refresh();
    except
      on E: Exception do
        UIUtils.HandleError(E);
    end;
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.ExibirListas(
  AOperacoesInternas: OperacoesInternasEtd;
  AGruposFiscais: GruposFiscaisEtd
);
begin
  edPickerOpInterna.LoadEntities(AOperacoesInternas, True);

  AGruposFiscais.Insert(0, nil);
  edPickerGrupoFiscal.LoadEntities(AGruposFiscais, True);
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.SetupPresenter(
  APresenter: TOperacoesFiscaisIbsCbsPresenter
);
begin
  FPresenter := APresenter;
end;

destructor TfrmCadOperacoesFiscaisIbsCbs.Destroy;
begin
  FreeAndNil(FPresenter);
  FreeAndNil(FData);
  FreeAndNil(FState);

  inherited;
end;

end.
