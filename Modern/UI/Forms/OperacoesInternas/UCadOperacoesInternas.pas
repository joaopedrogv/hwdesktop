unit UCadOperacoesInternas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, ModernCadastroFormUnit, OperacoesInternasDataSet,
  OperacoesInternasPresenter, IViewFeedbackUnit,
  OperacaoInternaEtdUnit, CheckLst,
  CheckListBoxEmpresasFrameUnit, FilterFR, FilterPadraoFR;

type
  TfrmCadOperacoesInternas = class(TModernCadastroForm, IViewFeedback)
    tabCadastro: TTabSheet;
    Label6: TLabel;
    edSeqId: TEdit;
    Label7: TLabel;
    edDescricao: TEdit;
    Label9: TLabel;
    CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame;
    ckLixeira: TCheckBox;
    lbOpNFCeDefault: TLabel;
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
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
    FOpInternaNFCeDefault: string;
    FData: TOperacoesInternasDataSet;
    FState: OperacaoInternaEtd;
    FPresenter: TOperacoesInternasPresenter;
  private
    procedure ShowAbaCadastro();
    procedure MapStateToForm();
    procedure MapFormToState();
  public
    procedure SetupPresenter(APresenter: TOperacoesInternasPresenter);
    destructor Destroy; override;
  end;

implementation

uses
  uDtmAtivo, UIUtilsUnit, Math,
  FieldsConfigUnit, EntityMetadataUnit, OperacaoInternaMetadataUnit,
  config_sistema_class, DbGridConfigUtilsUnit,
  UIFormValidatorFactoryUnit,
  StatusRegistroEnumUnit,
  UCadOpInternasComTiposVendas, uDadosIni;

{$R *.dfm}

{ TfrmCadOperacoesInternas }

procedure TfrmCadOperacoesInternas.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not FAuditor.Processo('MOD001').Visualizar()
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

procedure TfrmCadOperacoesInternas.BitBtn3Click(Sender: TObject);
begin
  if not FAuditor.Processo('MOD002').Inserir()
    .Permitido() then
    Exit;
  try
    Screen.Cursor := crHourGlass;

    FState.Free();
    FState := OperacaoInternaEtd.Create();

    MapStateToForm();
    ShowAbaCadastro();

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadOperacoesInternas.BitBtn4Click(Sender: TObject);
begin
  MapFormToState();

  if not FAuditor.Processo('MOD004').Salvar()
    .SetMensagem('%d - %s', [FState.SeqId, FState.Descricao] )
    .Permitido() then
    Exit;

  if FPresenter.Salvar(FState) then
  begin
    try
      inherited;
      FData.Refresh();
    except
      on E: Exception do
        UIUtils.HandleError(E);
    end;
  end;
end;

procedure TfrmCadOperacoesInternas.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1.Click;
end;

procedure TfrmCadOperacoesInternas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FData);
  FreeAndNil(FState);

  Action := caFree;

  inherited;
end;

procedure TfrmCadOperacoesInternas.FormCreate(Sender: TObject);
var
  Builder: IFieldsConfigBuilder;
  Meta: EntityMetadata;
begin
  TelaCadastro := vDadosIni.vTipoForm;

  FState := OperacaoInternaEtd.Create();
  FData := TOperacoesInternasDataSet.Create();
  FAuditor := FData.Auditor;

  Builder := FieldsConfigFactory.Create();
  Meta := TOperacaoInternaMetadata.GetMetadata();

  FData.Setup(Builder, Meta);

  SetupDataSetGrid(FData);

  //FiltroGrid.OnFieldChange := FData.HandleFilterField;
  FiltroGrid.TodosToggle(True).FillForm(FData.dataSet, nil, 'Todos');

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder(Meta, BitBtn4)
    .Bind(edDescricao)
    .Validator();

  DbGridConfigUtils.ApplyToDBGrid(DBGrid1, Builder.List);

  PrimeiraPesquisa := False;

  inherited;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadOperacoesInternas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    BitBtn3.Click;
end;

procedure TfrmCadOperacoesInternas.FormShow(Sender: TObject);
begin
  PageControl3.ActivePage := tabCadastro;
  PageControl1.ActivePage := TabSheet2;
  Panel1.Visible          := True;
  tabCadastro.TabVisible  := True;

  if vShow <> 1 then
    inherited;
end;

procedure TfrmCadOperacoesInternas.MapFormToState;
begin
  FState.Descricao := Trim(edDescricao.Text);
  FState.EmpresasId := CheckListBoxEmpresasFrame1.GetIdsEmpresasSelecionadas();
end;

procedure TfrmCadOperacoesInternas.MapStateToForm;
begin
  edSeqId.Text := IntToStr(FState.SeqId);
  edDescricao.Text := FState.Descricao;

  CheckListBoxEmpresasFrame1.Setup( FState.EmpresasId, FState.Id <> '' );

  with TConfig_sistema_class.getConf('nfc_op_internad_default', FData.buscas, vDadosIni.cod_empresa) do
  try

    lbOpNFCeDefault.Visible := (FState.Id <> '') and (FState.Id = value1_vc);

  finally
    Free();
  end;
end;

procedure TfrmCadOperacoesInternas.ShowAbaCadastro;
begin
  FFormValidator.Reset();

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tabCadastro;

  if edDescricao.CanFocus then
    edDescricao.SetFocus;
end;

procedure TfrmCadOperacoesInternas.SetupPresenter(
  APresenter: TOperacoesInternasPresenter
);
begin
  FPresenter := APresenter;
end;

procedure TfrmCadOperacoesInternas.SpeedButton11Click(Sender: TObject);
begin
  inherited;

  if FData.IsEmpty() then
    Exit;

  if not FAuditor.Processo('MOD031').Validar()
    .SetMensagem('%d - %s', [FData.fint('seqid'), FData.fstr('descricao')] )
    .Permitido() then
    Exit;

  with TConfig_sistema_class.getConf('nfc_op_internad_default', FData.buscas, vDadosIni.cod_empresa) do
  try
    chave := 'nfc_op_internad_default';
    cod_empresa := vDadosIni.cod_empresa;
    type1_ := typeString;
    ativo := 0;
    value1_vc := FData.fstr('id');
    SaveConfDB(
      FData.buscas
    ).Transaction.Commit;

    FOpInternaNFCeDefault := value1_vc;
  finally
    Free();
  end;
end;

procedure TfrmCadOperacoesInternas.SpeedButton1Click(Sender: TObject);
var
  dado: OperacaoInternaEtd;
begin
  if FData.IsEmpty() then
    Exit;

  if not FPresenter.ObterParaEdicao(FData.fstr('id'), dado) then
    Exit;

  try
    if dado.Ativo = saLixeira then
    begin
      if UIUtils.ShowQuestion('Registro encontra-se na Lixeira. Deseja restaurar o registro?') <> IDYES then
        Exit;

      if not FAuditor.Processo('MOD006').Alterar()
        .SetMensagem('%d - %s', [FData.fint('seqid'), FData.fstr('descricao')])
        .Permitido() then
        Exit;
    end;

    if not FAuditor.Processo('MOD003').Alterar()
      .SetMensagem('%d - %s', [dado.SeqId, dado.Descricao])
      .Permitido() then
      Exit;

    FState.Free();
    FState := dado;
    dado := nil;
    FState.Ativo := saAtivo;
    MapStateToForm();
    ShowAbaCadastro();
  finally
    dado.Free();
  end;
end;

procedure TfrmCadOperacoesInternas.SpeedButton26Click(Sender: TObject);
var
  form: TfrmCadOpInternasComTiposVendas;
begin
  if FData.IsEmpty() then
    Exit;

  if not FAuditor.Processo('MOD007').Visualizar()
    .SetMensagem('%d - %s', [FData.fint('seqid'), FData.fstr('descricao')] )
    .Permitido() then
    Exit;

  Application.CreateForm( TfrmCadOpInternasComTiposVendas, form );
  try
    form.Inicializar(FData.fstr('id'));
    form.ShowModal();
  finally
    form.Free();
  end;
end;

procedure TfrmCadOperacoesInternas.SpeedButton2Click(Sender: TObject);
begin
  if FData.IsEmpty() then
    Exit;

  if UIUtils.ShowQuestion('Deseja mesmo enviar oa registro para a lixeira?') <> ID_YES then
    Exit;

  if not FAuditor.Processo('MOD005').Excluir()
    .SetMensagem('%d - %s', [FData.fint('seqid'), FData.fstr('descricao')] )
    .Permitido() then
    Exit;

  if FPresenter.Remover(FData.fstr('id')) then
    FData.Refresh();
end;

destructor TfrmCadOperacoesInternas.Destroy;
begin
  FreeAndNil(FPresenter);
  FreeAndNil(FData);
  FreeAndNil(FState);
  inherited;
end;

end.
