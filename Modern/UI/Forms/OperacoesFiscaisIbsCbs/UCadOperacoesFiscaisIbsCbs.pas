unit UCadOperacoesFiscaisIbsCbs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ModernCadastroFormUnit, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, OperacoesFiscaisIbsCbsDataSet,
  OperacoesFiscaisIbsCbsPresenter, OperacoesFiscaisIbsCbsView,
  OperacaoFiscalIbsCbsEtdUnit, OperacaoFiscalIbsCbsCondicaoEtdUnit,
  TipoComunsUnit, OperacaoInternaEtdUnit, GrupoFiscalEtdUnit,
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
    tabCondicoes: TTabSheet;
    lbEscopoCondicoes: TLabel;
    gbTipoEmissao: TGroupBox;
    clbTipoEmissao: TCheckListBox;
    gbNatureza: TGroupBox;
    clbNatureza: TCheckListBox;
    gbTipoOrgaoPublico: TGroupBox;
    clbTipoOrgaoPublico: TCheckListBox;
    btnVerificarCondicoes: TSpeedButton;
    procedure btnVerificarCondicoesClick(Sender: TObject);
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

    procedure CarregarCondicoesDisponiveis();
    procedure CarregarCheckList(
      const ACheckList: TCheckListBox;
      const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo);
    procedure LimparCondicoesDoForm();
    procedure MarcarCondicaoNoForm(const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd);
    function CheckListDoAtributo(
      const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): TCheckListBox;
    function ObterCondicaoDoForm(
      const ACheckList: TCheckListBox;
      const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo;
      out ACondicao: OperacaoFiscalIbsCbsCondicaoEtd): Boolean;
    function CriarResumoCondicoes(
      const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray): string;
    procedure AtualizarLabelEscopoCondicoes();

    procedure ExibirListas(
      AOperacoesInternas: OperacoesInternasEtd;
      AGruposFiscais: GruposFiscaisEtd
    );
    procedure ExibirAnaliseCondicoes(const AResumo, ARelatorio: string);
    procedure CopiarRelatorioAnalise(Sender: TObject);
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
  StringNullableUnit, DateTimeServiceUnit, Clipbrd;

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

  if Result <> '' then
    Result := Result + ' | ';

  Result := Result + CriarResumoCondicoes(FState.Condicoes);
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

  CarregarCondicoesDisponiveis();

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

procedure TfrmCadOperacoesFiscaisIbsCbs.CarregarCondicoesDisponiveis;
begin
  CarregarCheckList(clbTipoEmissao, ocaTipoEmissao);
  CarregarCheckList(clbNatureza, ocaNaturezaEmissao);
  CarregarCheckList(clbTipoOrgaoPublico, ocaTipoOrgaoPublico);
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.CarregarCheckList(
  const ACheckList: TCheckListBox;
  const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo);
var
  Codigos: TArrayInteger;
  i: Integer;
begin
  ACheckList.Items.Clear;

  Codigos := OperacaoFiscalIbsCbsCondicoes.ValoresDoDominio(AAtributo);
  for i := 0 to High(Codigos) do
    ACheckList.Items.AddObject(
      OperacaoFiscalIbsCbsCondicoes.DescricaoValor(AAtributo, Codigos[i]),
      TObject(Codigos[i]));
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.LimparCondicoesDoForm;
var
  i: Integer;
begin
  for i := 0 to clbTipoEmissao.Items.Count - 1 do
    clbTipoEmissao.Checked[i] := False;

  for i := 0 to clbNatureza.Items.Count - 1 do
    clbNatureza.Checked[i] := False;

  for i := 0 to clbTipoOrgaoPublico.Items.Count - 1 do
    clbTipoOrgaoPublico.Checked[i] := False;
end;

function TfrmCadOperacoesFiscaisIbsCbs.CheckListDoAtributo(
  const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo): TCheckListBox;
begin
  case AAtributo of
    ocaTipoEmissao:
      Result := clbTipoEmissao;
    ocaNaturezaEmissao:
      Result := clbNatureza;
    ocaTipoOrgaoPublico:
      Result := clbTipoOrgaoPublico;
  else
    Result := nil;
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.MarcarCondicaoNoForm(
  const ACondicao: OperacaoFiscalIbsCbsCondicaoEtd);
var
  CheckList: TCheckListBox;
  i: Integer;
begin
  CheckList := CheckListDoAtributo(ACondicao.Atributo);
  if CheckList = nil then
    Exit;

  for i := 0 to CheckList.Items.Count - 1 do
    if OperacaoFiscalIbsCbsCondicoes.Contem(
      ACondicao, Integer(CheckList.Items.Objects[i])) then
      CheckList.Checked[i] := True;
end;

function TfrmCadOperacoesFiscaisIbsCbs.ObterCondicaoDoForm(
  const ACheckList: TCheckListBox;
  const AAtributo: OperacaoFiscalIbsCbsCondicaoAtributo;
  out ACondicao: OperacaoFiscalIbsCbsCondicaoEtd): Boolean;
var
  i, Qtd: Integer;
  Valores: TArrayInteger;
begin
  Result := False;
  SetLength(Valores, 0);
  Qtd := 0;

  for i := 0 to ACheckList.Items.Count - 1 do
    if ACheckList.Checked[i] then
    begin
      SetLength(Valores, Qtd + 1);
      Valores[Qtd] := Integer(ACheckList.Items.Objects[i]);
      Inc(Qtd);
    end;

  if Qtd > 0 then
  begin
    ACondicao := OperacaoFiscalIbsCbsCondicaoEtd.Create(AAtributo, Valores);
    Result := True;
  end;
end;

function TfrmCadOperacoesFiscaisIbsCbs.CriarResumoCondicoes(
  const ACondicoes: OperacaoFiscalIbsCbsCondicaoEtdArray): string;
var
  i, j: Integer;
  NomeAtributo, Valores: string;
  Condicao: OperacaoFiscalIbsCbsCondicaoEtd;
begin
  if Length(ACondicoes) = 0 then
  begin
    Result := 'Condi'#231#245'es: sem restri'#231#227'o';
    Exit;
  end;

  Result := 'Condi'#231#245'es:';
  for i := 0 to High(ACondicoes) do
  begin
    Condicao := ACondicoes[i];

    case Condicao.Atributo of
      ocaTipoEmissao:
        NomeAtributo := 'Emiss'#227'o';
      ocaNaturezaEmissao:
        NomeAtributo := 'Natureza';
      ocaTipoOrgaoPublico:
        NomeAtributo := #211'rg'#227'o';
    else
      NomeAtributo := OperacaoFiscalIbsCbsCondicoes.DescricaoAtributo(
        Condicao.Atributo);
    end;

    Valores := '';
    for j := 0 to High(Condicao.Valores) do
    begin
      if Valores <> '' then
        Valores := Valores + ', ';
      Valores := Valores + OperacaoFiscalIbsCbsCondicoes.DescricaoValor(
        Condicao.Atributo, Condicao.Valores[j]);
    end;

    if i > 0 then
      Result := Result + ';';
    Result := Result + ' ' + NomeAtributo + '=' + Valores;
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.AtualizarLabelEscopoCondicoes;
var
  Grupo: TObject;
begin
  if FState.GrupoFiscalId.ToText('') = '' then
    lbEscopoCondicoes.Caption :=
      'Escopo: Padr'#227'o (sem Grupo Fiscal) - aplica-se somente quando n'#227'o houver v'#237'nculo do grupo'
  else
  begin
    Grupo := edPickerGrupoFiscal.GetSelectedEntity();
    if Grupo <> nil then
      lbEscopoCondicoes.Caption := 'Escopo: Grupo Fiscal ' +
        GrupoFiscalEtd(Grupo).Descricao
    else
      lbEscopoCondicoes.Caption := 'Escopo: Grupo Fiscal ' +
        FState.GrupoFiscalId.Value;
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.MapFormToState;
var
  Condicoes: OperacaoFiscalIbsCbsCondicaoEtdArray;
  Condicao: OperacaoFiscalIbsCbsCondicaoEtd;
  Item: TObject;
begin
  // FState.OperacaoInternaId := ''; // ja atribuido no evento
  // FState.RegraFiscalId := '';
  // FState.GrupoFiscalId := '';
  FState.InicioVigencia := StrToDate(edInicioVigencia.Text);
  FState.FimVigencia := edFinalVigencia.GetDateNullable();
  FState.EmpresasId := CheckListBoxEmpresasFrame1.GetIdsEmpresasSelecionadas();

  Item := edPickerOpInterna.GetSelectedEntity();
  if Item <> nil then
    FState.OperacaoInternaDescricao := OperacaoInternaEtd(Item).Descricao
  else
    FState.OperacaoInternaDescricao := '';

  Item := edPickerGrupoFiscal.GetSelectedEntity();
  if Item <> nil then
    FState.GrupoFiscalDescricao := GrupoFiscalEtd(Item).Descricao
  else
    FState.GrupoFiscalDescricao := '';

  Item := ComboBoxRegrasFiscaisFrame1.GetRegraFiscal();
  try
    if Item <> nil then
      FState.RegraFiscalDescricao := RegraFiscalIbsCbsEtd(Item).Descricao
    else
      FState.RegraFiscalDescricao := '';
  finally
    Item.Free();
  end;

  SetLength(Condicoes, 0);

  if ObterCondicaoDoForm(clbTipoEmissao, ocaTipoEmissao, Condicao) then
  begin
    SetLength(Condicoes, Length(Condicoes) + 1);
    Condicoes[High(Condicoes)] := Condicao;
  end;

  if ObterCondicaoDoForm(clbNatureza, ocaNaturezaEmissao, Condicao) then
  begin
    SetLength(Condicoes, Length(Condicoes) + 1);
    Condicoes[High(Condicoes)] := Condicao;
  end;

  if ObterCondicaoDoForm(clbTipoOrgaoPublico, ocaTipoOrgaoPublico, Condicao) then
  begin
    SetLength(Condicoes, Length(Condicoes) + 1);
    Condicoes[High(Condicoes)] := Condicao;
  end;

  FState.Condicoes := Condicoes;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.MapStateToForm;
var
  i: Integer;
begin
  ComboBoxRegrasFiscaisFrame1.Setup( FState.RegraFiscalId, False );
  edInicioVigencia.Text := DateToStr(FState.InicioVigencia);
  edFinalVigencia.Setup( FState.FimVigencia );
  CheckListBoxEmpresasFrame1.Setup( FState.EmpresasId, FState.Id <> '' );

  LimparCondicoesDoForm();

  for i := 0 to High(FState.Condicoes) do
    MarcarCondicaoNoForm(FState.Condicoes[i]);

  AtualizarLabelEscopoCondicoes();
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

  AtualizarLabelEscopoCondicoes();
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.btnVerificarCondicoesClick(
  Sender: TObject);
begin
  MapFormToState();
  FPresenter.AnalisarCondicoes(FState);
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

procedure TfrmCadOperacoesFiscaisIbsCbs.ExibirAnaliseCondicoes(
  const AResumo, ARelatorio: string);
var
  Dialogo: TForm;
  PanelTopo: TPanel;
  PanelRodape: TPanel;
  PanelRelatorio: TPanel;
  lbResumo: TLabel;
  MemoRelatorio: TMemo;
  btnCopiar: TButton;
  btnFechar: TButton;
begin
  Dialogo := TForm.Create(nil);
  try
    Dialogo.BorderStyle := bsDialog;
    Dialogo.Position := poMainFormCenter;
    Dialogo.Caption := 'Verificação das condições';
    Dialogo.ClientWidth := 640;
    Dialogo.ClientHeight := 440;

    PanelTopo := TPanel.Create(Dialogo);
    PanelTopo.Parent := Dialogo;
    PanelTopo.Align := alTop;
    PanelTopo.Height := 40;
    PanelTopo.BevelOuter := bvNone;
    PanelTopo.BorderWidth := 8;

    lbResumo := TLabel.Create(Dialogo);
    lbResumo.Parent := PanelTopo;
    lbResumo.Align := alClient;
    lbResumo.Font.Style := [fsBold];
    lbResumo.Caption := AResumo;
    lbResumo.WordWrap := True;

    PanelRodape := TPanel.Create(Dialogo);
    PanelRodape.Parent := Dialogo;
    PanelRodape.Align := alBottom;
    PanelRodape.Height := 48;
    PanelRodape.BevelOuter := bvNone;
    PanelRodape.BorderWidth := 6;

    btnFechar := TButton.Create(Dialogo);
    btnFechar.Parent := PanelRodape;
    btnFechar.Caption := 'Fechar';
    btnFechar.Width := 90;
    btnFechar.Height := 28;
    btnFechar.Top := 4;
    btnFechar.Left := PanelRodape.ClientWidth - btnFechar.Width - 6;
    btnFechar.ModalResult := mrOk;
    btnFechar.Default := True;
    btnFechar.Cancel := True;

    btnCopiar := TButton.Create(Dialogo);
    btnCopiar.Parent := PanelRodape;
    btnCopiar.Caption := 'Copiar';
    btnCopiar.Width := 90;
    btnCopiar.Height := 28;
    btnCopiar.Top := 4;
    btnCopiar.Left := btnFechar.Left - btnCopiar.Width - 6;
    btnCopiar.OnClick := CopiarRelatorioAnalise;

    PanelRelatorio := TPanel.Create(Dialogo);
    PanelRelatorio.Parent := Dialogo;
    PanelRelatorio.Align := alClient;
    PanelRelatorio.BevelOuter := bvNone;
    PanelRelatorio.BorderWidth := 6;

    MemoRelatorio := TMemo.Create(Dialogo);
    MemoRelatorio.Name := 'MemoRelatorioAnalise';
    MemoRelatorio.Parent := PanelRelatorio;
    MemoRelatorio.Align := alClient;
    MemoRelatorio.ReadOnly := True;
    MemoRelatorio.ScrollBars := ssVertical;
    MemoRelatorio.WordWrap := True;
    MemoRelatorio.Text := ARelatorio;

    Dialogo.ShowModal();
  finally
    Dialogo.Free();
  end;
end;

procedure TfrmCadOperacoesFiscaisIbsCbs.CopiarRelatorioAnalise(
  Sender: TObject);
var
  Dialogo: TForm;
  MemoRelatorio: TMemo;
begin
  Dialogo := TForm(TButton(Sender).Owner);
  MemoRelatorio := TMemo(Dialogo.FindComponent('MemoRelatorioAnalise'));

  if MemoRelatorio <> nil then
    Clipboard.AsText := MemoRelatorio.Text;
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
