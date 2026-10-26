unit UCadAjustesRedBenefPC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask,
  AjustesRedBenefPcDataSet, hw_audit_utils, IUIFormValidatorUnit, AjusteRedBenefPcModelUnit, FilterFR, FilterPadraoFR,
  uEditHw, ComboboxEntityPickerFrameUnit;

type
  TFrmCadAjustesRedBenefPC = class(TfrmCadPadraoM)
    FilterFramePadrao1: TFilterFramePadrao;
    tabCadastro: TTabSheet;
    Label6: TLabel;
    Label11: TLabel;
    edCST: TMaskEdit;
    edRegraId: TComboboxEntityPickerFrame;
    Label8: TLabel;
    edIndAj: TEditHw;
    edCodAj: TEditHw;
    Label9: TLabel;
    Label15: TLabel;
    edDataRef: TMaskEdit;
    Label10: TLabel;
    edChaveDFe: TMaskEdit;
    Label12: TLabel;
    edVBC: TEditHw;
    edPPisAj: TEditHw;
    Label13: TLabel;
    Label14: TLabel;
    edVPisAj: TEditHw;
    edPCofinsAj: TEditHw;
    Label16: TLabel;
    Label17: TLabel;
    edVCofinsAj: TEditHw;
    btRegistroSistema: TSpeedButton;
    procedure btRegistroSistemaClick(Sender: TObject);
    procedure edDataRefExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FData: TAjustesRedBenefPcDataSet;
    FAuditor: TAudit_OOP;
    FFormValidator: IUIFormValidator;
    FState: AjusteRedBenefPcModel;
  private
    procedure RegrasListSelectEvent(Sender: TObject; Entity: TObject; out DisplayInfo: string);
    procedure RegrasListAddEvent(Sender: TObject; Entity: TObject; out DisplayInfo: string; out SetSelected: Boolean);
    procedure MapStateToForm();
    procedure MapFormToState();
    procedure ShowAbaCadastro();
  public
  end;

var
  FrmCadAjustesRedBenefPC: TFrmCadAjustesRedBenefPC;

implementation

uses
  uDtmAtivo,
  CreateEntityUseCaseOutputUnit, ContainerUnit, ErpFeaturesFactoryUnit, UIUtilsUnit, FieldsConfigUnit,
  EntityMetadataUnit, AjusteRedBenefPcMetadataUnit, UIFormValidatorFactoryUnit, DbGridConfigUtilsUnit,
  RegraRedBenefPcEtdUnit;

{$R *.dfm}

procedure TFrmCadAjustesRedBenefPC.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not FAuditor.Processo('MOD038').Visualizar().Permitido() then
      Exit;

    FData.SQLMaker.FilterMk.FreeFilters()
      .Add(FilterFramePadrao1.GetFiltros());

    FData.RunSQLMaker();

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadAjustesRedBenefPC.BitBtn3Click(Sender: TObject);
begin
  if not FAuditor.Processo('MOD039').Inserir()
    .Permitido() then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    FState.Free();
    FState := AjusteRedBenefPcModel.Create();
    FState.DataRef := Date();

    MapStateToForm();
    ShowAbaCadastro();

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadAjustesRedBenefPC.BitBtn4Click(Sender: TObject);
var
  createResult: CreateEntityUseCaseOutPut;
begin
  MapFormToState();

  if not FAuditor.Processo('MOD041').Salvar()
    .Permitido() then
    Exit;

  try try
    createResult := Container.GetInstance().ErpFeaturesFactory.CreateSalvarAjusteRedBenefPcUseCase().
      Executar( FState );

    if not createResult.Validation.IsValid then
      FFormValidator.Validate(createResult.Validation)

    else
    begin
      FAuditor.Sucesso().GravarMensagem( FState.GetAuditLabel() );

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

procedure TFrmCadAjustesRedBenefPC.edDataRefExit(Sender: TObject);
var
  dt: TDateTime;
begin
  if TryStrToDate(edDataRef.Text, dt)
    and (dt <> FState.DataRef) then
  begin
    FState.DataRef := dt;
    edRegraId.LoadEntities(
      Container.GetInstance().ErpFeaturesFactory.CreateListarRegrasRedBenefPcVigentesEAtualUseCase()
        .Executar(FState.Id, FState.DataRef),
      True
    );
  end;
end;

procedure TFrmCadAjustesRedBenefPC.FormCreate(Sender: TObject);
var
  builder: IFieldsConfigBuilder;
  Meta: EntityMetadata;
begin
  TelaCadastro := vDadosIni.vTipoForm;

  FData := TAjustesRedBenefPcDataSet.Create();
  FAuditor := FData.Auditor;
  builder := FieldsConfigFactory.Create();

  DBGrid1.DataSource := FData._dataSourceOOP;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);
  //configurarGridPeloConfigColunas(DBGrid1);
  Meta := AjusteRedBenefPcMetadata.GetMetadata();
  FData.Setup(builder, Meta);

  FilterFramePadrao1.OnFieldChange := FData.HandleFilterField;
  FilterFramePadrao1.TodosToggle(True).FillForm(FData.dataSet, nil, 'Todos');

  edRegraId.OnEntitySelected := RegrasListSelectEvent;
  edRegraId.OnEntityAdd := RegrasListAddEvent;

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder(Meta, BitBtn4)
    .Bind(edRegraId)
    .Bind(edIndAj)
    .Bind(edCodAj)
    .Bind(edChaveDFe)
    .Bind(edDataRef)
    .Bind(edCST)
    .Bind(edVBC)
    .Bind(edPPisAj)
    .Bind(edVPisAj)
    .Bind(edPCofinsAj)
    .Bind(edVCofinsAj)
    .Validator();

  DbGridConfigUtils.ApplyToDBGrid(DBGrid1, builder.List);
  PrimeiraPesquisa := False;

  inherited;

  //Self.FieldSelection := FData.ffield('sel');

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C'
end;

procedure TFrmCadAjustesRedBenefPC.FormShow(Sender: TObject);
begin
  PageControl3.ActivePage := tabCadastro;
  PageControl1.ActivePage := TabSheet2;
  Panel1.Visible := True;
  tabCadastro.TabVisible := True;

  if vShow <> 1 then
    inherited;
end;

procedure TFrmCadAjustesRedBenefPC.MapFormToState;
begin
  FState.IndAj := edIndAj.AsInteger;
  FState.CodAj := edCodAj.AsInteger;
  FState.Cst := edCST.Text;
  FState.ChaveDfe := edChaveDFe.Text;
  FState.DataRef := StrToDate(edDataRef.Text);
  FState.VBC := edVBC.AsCurrency;
  FState.PPisAj := edPPisAj.AsCurrency;
  FState.VPisAj := edVPisAj.AsCurrency;
  FState.PCofinsAj := edPCofinsAj.AsCurrency;
  FState.VCofinsAj := edVCofinsAj.AsCurrency;
end;

procedure TFrmCadAjustesRedBenefPC.MapStateToForm;
begin
  edRegraId.LoadEntities(
    Container.GetInstance().ErpFeaturesFactory.CreateListarRegrasRedBenefPcVigentesEAtualUseCase()
      .Executar(FState.Id, FState.DataRef),
    True
  );

  edIndAj.UpdateValue(FState.IndAj);
  edCodAj.UpdateValue(FState.CodAj);
  edCST.Text := FState.Cst;
  edChaveDFe.Text := FState.ChaveDfe;
  edDataRef.Text := DateToStr(FState.DataRef);
  edVBC.UpdateValue(FState.VBC);
  edPPisAj.UpdateValue(FState.PPisAj);
  edVPisAj.UpdateValue(FState.VPisAj);
  edPCofinsAj.UpdateValue(FState.PCofinsAj);
  edVCofinsAj.UpdateValue(FState.VCofinsAj);

  edIndAj.Enabled := not FState.Automatico;
  edCodAj.Enabled := not FState.Automatico;
  edCST.Enabled := not FState.Automatico;
  edChaveDFe.Enabled := not FState.Automatico;
  edDataRef.Enabled := not FState.Automatico;
  edVBC.Enabled := not FState.Automatico;
  edPPisAj.Enabled := not FState.Automatico;
  edVPisAj.Enabled := not FState.Automatico;
  edPCofinsAj.Enabled := not FState.Automatico;
  edVCofinsAj.Enabled := not FState.Automatico;

  btRegistroSistema.Visible := FState.Automatico;
end;

procedure TFrmCadAjustesRedBenefPC.RegrasListAddEvent(Sender, Entity: TObject; out DisplayInfo: string;
  out SetSelected: Boolean);
begin
  SetSelected := FState.RegraId = (Entity as RegraRedBenefPcEtd).Id;
  DisplayInfo := (Entity as RegraRedBenefPcEtd).Descricao;
end;

procedure TFrmCadAjustesRedBenefPC.RegrasListSelectEvent(Sender, Entity: TObject; out DisplayInfo: string);
var
  regra: RegraRedBenefPcEtd;
begin
  regra := (Entity as RegraRedBenefPcEtd);
  FState.RegraId := regra.Id;
  DisplayInfo := Format('CST: %s - Indicador: %d - Codigo Ajuste: %d',
    [ regra.Cst, regra.IndAjusteEFD, regra.CodAjusteEFD ]
  );
end;

procedure TFrmCadAjustesRedBenefPC.ShowAbaCadastro;
begin
  FFormValidator.Reset();

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tabCadastro;

  if edRegraId.edEntity.CanFocus then
    edRegraId.edEntity.SetFocus;
end;

procedure TFrmCadAjustesRedBenefPC.SpeedButton1Click(Sender: TObject);
var
  dado: AjusteRedBenefPcModel;
begin
  if FData.IsEmpty() then
    Exit;

  dado := Container.GetInstance().ErpFeaturesFactory.CreateObterAjusteRedBenefPcPorIdUseCase()
    .Executar(FData.fstr('id'));

  if dado = nil then
    UIUtils.ShowInfo('Registro não se encontra mais disponível')

  else
  begin
    FState.Free();
    FState := dado;

    if not FAuditor.Processo('MOD040').Alterar()
      .SetMensagem( FState.GetAuditLabel() )
      .Permitido() then
      Exit;

    MapStateToForm();
    ShowAbaCadastro();
  end;
end;

procedure TFrmCadAjustesRedBenefPC.SpeedButton2Click(Sender: TObject);
begin
  if FData.IsEmpty() or
    (UIUtils.ShowQuestion('Deseja mesmo enviar excluir o registro? A operação não poderá ser revertida') <> ID_YES) then
    Exit;       

  if not FData.GetAuditorFill('MOD042').Excluir()
    .Permitido() then
    Exit;

  try
    Container.GetInstance().ErpFeaturesFactory.CreateRemoverAjusteRedBenefPcUseCase()
      .Executar(FData.fstr('id'));

    FAuditor.Sucesso.GravarMensagem( FAuditor.Mensagem );

    FData.Refresh();

  except
    on E: Exception do
      UIUtils.HandleError(E);
  end;
end;

procedure TFrmCadAjustesRedBenefPC.btRegistroSistemaClick(Sender: TObject);
begin
  if not FAuditor.Processo('MOD043', FState.GetAuditKey(), FState.GetAuditLabel()).Alterar()
    .Permitido() then
    Exit;                             

  FState.Automatico := False;
  MapStateToForm();
end;

end.
