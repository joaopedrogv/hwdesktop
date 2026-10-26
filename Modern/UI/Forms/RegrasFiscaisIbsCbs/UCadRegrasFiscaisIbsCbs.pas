unit UCadRegrasFiscaisIbsCbs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uDataSet_OOP, RegraFiscalIbsCbsEtdUnit, hw_audit_utils,
  IUIFormValidatorUnit, CheckLst, ClassificacaoTributariaEtdUnit,
  CheckListBoxEmpresasFrameUnit, ComboBoxClassTribFrameUnit,
  EditHwNullableFrameUnit, MaskEditNullableFrameUnit,
  ComboBoxRegrasFiscaisFrameUnit, uEditHw;

type
  TfrmCadRegrasFiscaisIbsCbs = class(TfrmCadPadraoM)
    tabCadastro: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    edDescricao: TEdit;
    Label9: TLabel;
    CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame;
    ckLixeira: TCheckBox;
    ComboBoxClassTribFrame1: TComboBoxClassTribFrame;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edInicioVigencia: TMaskEdit;
    Label15: TLabel;
    edFinalVigencia: TMaskEditNullableFrame;
    Label16: TLabel;
    lbRegraFiscalTribRegular: TLabel;
    btUnlockRegraTribRegular: TSpeedButton;
    lbRegraFiscalTribRegProblem: TLabel;
    ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame;
    SpeedButton9: TSpeedButton;
    lbProgressDownload: TLabel;
    edPDifCbs: TEditHw;
    edPDifIbsUf: TEditHw;
    edPDifIbsMun: TEditHw;
    procedure ComboBoxClassTribFrame1Exit(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure lbRegraFiscalTribRegProblemClick(Sender: TObject);
    procedure btUnlockRegraTribRegularClick(Sender: TObject);
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
    FState: RegraFiscalIbsCbsEtd;
    FFormValidator: IUIFormValidator;
    FStateTribRegInformadaIndevidamente: Boolean;
    FStateExigeTribRegENaoInformada: Boolean;

    procedure ClassificacaoChange(Sender: TObject; ClassificacaoTrib: ClassificacaoTributariaEtd);
    procedure RegrasFiscaisFrameChange(Sender: TObject; RegraFiscal: RegraFiscalIbsCbsEtd);
    procedure HandleClassificacaoTributacaoRegular(ClassificacaoTrib: ClassificacaoTributariaEtd);
    procedure DownloadLog(const AMessage: string);
    procedure DownloadProgress(Percent: Integer);
  private
    procedure ShowAbaCadastro();
    procedure MapStateToForm();
    procedure MapFormToState();
  public

  end;

implementation

uses
  uDtmAtivo, UIUtilsUnit, hw_utils, hw_grid_utils, Math, DB,     
  FieldsConfigUnit, MaskUtils,
  Contnrs, UIFormValidatorFactoryUnit,
  ContainerUnit, CreateEntityUseCaseOutputUnit, SalvarRegraFiscalIbsCbsTypesUnit,
  EValidacaoNegocioUnit, StatusRegistroEnumUnit, ErpFeaturesFactoryUnit,
  TipoTributoFiscalEnumUnit, StringNullableUnit, DateTimeServiceUnit,
  CurrencyNullableUnit,
  TratamentoClassificacaoEtdUnit, TratamentoTributarioEtdUnit, MasksConstsUnit, DFeDLLAdapterUnit;

const
  CAPTION_TRIBREG_NAOINF = 'Classificação Exige Tributação Regular e Regra Fiscal não informada. Clique aqu para liberar o cadastro';
  CAPTION_TRIBREG_INFINDEV = 'Classificação NÃO Exige Tributação Regular e Regra Fiscal foi informada. Clique aqu para liberar o cadastro';

type
  TRegrasFiscaisIbsCbsOOP = class(TDataSet_OOP)
  private
    //procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();
  end;

{$R *.dfm}

{ TRegrasFiscaisIbsCbsOOP }

constructor TRegrasFiscaisIbsCbsOOP.Create;
begin
  TableName := 'REGRAS_FISCAIS_IBSCBS';
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_oregras_fiscais_ibscbs');

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('id,ativo,tpopergov,rf_trib_regular', fvInvisivel)
      .Add('descricao,cClassTrib', fvSempreVisivel)
      .Add('pdifcbs', '% Diferimento CBS', '', MSK_DEC_0000)
      .Add('pdifibsuf', '% Diferimento IBS UF', '', MSK_DEC_0000)
      .Add('pdifibsmun', '% Diferimento IBS Município', '', MSK_DEC_0000)
  );

  montaSelect('SELECT * FROM REGRAS_FISCAIS_IBSCBS WHERE 1=0');
end;

{ TfrmCadRegrasFiscaisIbsCbs }

procedure TfrmCadRegrasFiscaisIbsCbs.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not FAuditor.Processo('MOD014').Visualizar()
      .Permitido() then
      Exit;

    if MaskEdit2.Visible then
    begin
      if not FData.ConsultaCampos( FData.TableName, ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, IfThen(not ckLixeira.Checked, 1)) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if FData.ConsultaCampos(FData.TableName, MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa, IfThen(not ckLixeira.Checked, 1)) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    inherited;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.BitBtn3Click(Sender: TObject);
begin     
  if not FAuditor.Processo('MOD015').Inserir()
    .Permitido() then
    Exit;
  try
    Screen.Cursor := crHourGlass;

    FState.Free();
    FState := RegraFiscalIbsCbsEtd.Create();

    MapStateToForm();
    ShowAbaCadastro();

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.BitBtn4Click(Sender: TObject);
var
  createResult: CreateEntityUseCaseOutPut;
begin
  MapFormToState(); 

  if not FAuditor.Processo('MOD017').Salvar()
    .SetMensagem('%s - %s', [FState.CClassTrib, FState.Descricao] )
    .Permitido() then
    Exit;

  try

    try
      with Container.GetInstance().ErpFeaturesFactory.CreateSalvarRegraFiscalIbsCbsUseCase() do
      try
        createResult := Executar( SalvarRegraFiscalIbsCbsUseCaseInput.Create(
           FState, FStateTribRegInformadaIndevidamente, FStateExigeTribRegENaoInformada
        ));
      finally
        FreeSafe();
      end;

      if not createResult.Validation.IsValid then
        FFormValidator.Validate(createResult.Validation)

      else
      begin
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

procedure TfrmCadRegrasFiscaisIbsCbs.btUnlockRegraTribRegularClick(
  Sender: TObject);
begin
  inherited;
  if ComboBoxRegrasFiscaisFrame1.Enabled then
    Exit;

  if not FAuditor.Processo('MOD029').Excluir()
    .SetMensagem('%s - %s', [FState.CClassTrib, FState.Descricao] )
    .Permitido() then
    Exit;

  ComboBoxRegrasFiscaisFrame1.Enabled := True;
  ComboBoxRegrasFiscaisFrame1.ParentFont := True;
  lbRegraFiscalTribRegular.ParentFont := True;
  if ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.CanFocus() then
    ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.SetFocus();
end;

procedure TfrmCadRegrasFiscaisIbsCbs.ClassificacaoChange(Sender: TObject;
  ClassificacaoTrib: ClassificacaoTributariaEtd);
begin
  if Sender = ComboBoxClassTribFrame1 then
    HandleClassificacaoTributacaoRegular( ClassificacaoTrib );
end;

procedure TfrmCadRegrasFiscaisIbsCbs.ComboBoxClassTribFrame1Exit(
  Sender: TObject);
var
  classTrib: ClassificacaoTributariaEtd;
begin
  inherited;
  classTrib := ComboBoxClassTribFrame1.GetClassificacao();
  try
    if (classTrib <> nil) and (Trim(edDescricao.Text) = '') then
      edDescricao.Text := Copy(AnsiUpperCase(classTrib.Descricao), 1, 128);
  finally
    classTrib.Free();
  end;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1.Click;
end;


procedure TfrmCadRegrasFiscaisIbsCbs.DownloadLog(const AMessage: string);
begin
  memoGrid9999.Lines.Add(AMessage);  
end;

procedure TfrmCadRegrasFiscaisIbsCbs.DownloadProgress(Percent: Integer);
begin
  lbProgressDownload.Caption :=  IntToStr(Percent) + '%';
  Application.ProcessMessages;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FData.Free();
  FState.Free();

  Action := caFree;

  inherited;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;

  FState   := RegraFiscalIbsCbsEtd.Create();
  FData    := TRegrasFiscaisIbsCbsOOP.Create();
  FAuditor := FData.Auditor;

  ComboBoxClassTribFrame1.OnClassificacaoChange := ClassificacaoChange;
  ComboBoxRegrasFiscaisFrame1.OnRegraFiscalChange := RegrasFiscaisFrameChange;

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder()
    .Bind(edDescricao)
    .Bind('CClassTrib', ComboBoxClassTribFrame1.edCClassTrib)
    .Bind('RegraFiscalTribRegularId', ComboBoxRegrasFiscaisFrame1.edRegrasFiscais)
    .Bind('PDifCbs', edPDifCbs)
    .Bind('PDifIbsUf', edPDifIbsUf)
    .Bind('PDifIbsMun', edPDifIbsMun)
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

procedure TfrmCadRegrasFiscaisIbsCbs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    BitBtn3.Click;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.FormShow(Sender: TObject);
begin
  PageControl3.ActivePage := tabCadastro;
  PageControl1.ActivePage := TabSheet2;
  Panel1.Visible          := True;
  tabCadastro.TabVisible  := True;

  if vShow <> 1 then
    inherited;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.HandleClassificacaoTributacaoRegular(ClassificacaoTrib: ClassificacaoTributariaEtd);
var
  tratClass: TratamentoClassificacaoEtd;
  campoPreenchidoIndevidamente: Boolean;
begin
  tratClass := nil;
  campoPreenchidoIndevidamente := False;
  if ClassificacaoTrib = nil then
    ComboBoxRegrasFiscaisFrame1.Enabled := False
  else
  begin
    tratClass := ComboBoxClassTribFrame1.GetTratamentoClassificacao();
    try
      if (tratClass <> nil) and
        not tratClass.TratamentoTributario.IsNull() then
      begin
        lbRegraFiscalTribRegProblem.Caption := '';

        if not FStateExigeTribRegENaoInformada
          and tratClass.TratamentoTributario.InExigeGrupoDesoneracao
          and FState.RegraFiscalTribRegularId.IsNull
        then
          lbRegraFiscalTribRegProblem.Caption := CAPTION_TRIBREG_NAOINF;

        if not FStateTribRegInformadaIndevidamente
          and not tratClass.TratamentoTributario.InExigeGrupoDesoneracao
          and not FState.RegraFiscalTribRegularId.IsNull
        then
        begin
          lbRegraFiscalTribRegProblem.Caption := CAPTION_TRIBREG_INFINDEV;
          campoPreenchidoIndevidamente := True;
        end;

        lbRegraFiscalTribRegProblem.Visible := lbRegraFiscalTribRegProblem.Caption <> '';

        ComboBoxRegrasFiscaisFrame1.Enabled := tratClass.TratamentoTributario.InExigeGrupoDesoneracao or campoPreenchidoIndevidamente;
      end;
    finally
      tratClass.Free();
    end;
  end;

  btUnlockRegraTribRegular.Enabled := not ComboBoxRegrasFiscaisFrame1.Enabled;

  if ComboBoxRegrasFiscaisFrame1.Enabled then
  begin
    lbRegraFiscalTribRegular.ParentFont := True;
    ComboBoxRegrasFiscaisFrame1.ParentFont := True;
  end
  else
  begin
    lbRegraFiscalTribRegular.Font.Color := clGray;
    ComboBoxRegrasFiscaisFrame1.Font.Color := clGray;
  end;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.lbRegraFiscalTribRegProblemClick(
  Sender: TObject);
begin
  inherited;
  if lbRegraFiscalTribRegProblem.Caption = '' then
    Exit;

  if not FAuditor.Processo('MOD030').Excluir()
    .SetMensagem('%s - %s', [FState.CClassTrib, FState.Descricao] )
    .Permitido() then
    Exit;

  if lbRegraFiscalTribRegProblem.Caption = CAPTION_TRIBREG_NAOINF then
    FStateExigeTribRegENaoInformada := True;

  if lbRegraFiscalTribRegProblem.Caption = CAPTION_TRIBREG_INFINDEV then
    FStateTribRegInformadaIndevidamente := True;

  lbRegraFiscalTribRegProblem.Visible := False;
  UIUtils.HintInfo(BitBtn4, 'Agora seu cadastro já pode ser salvo');
end;

procedure TfrmCadRegrasFiscaisIbsCbs.MapFormToState;
begin
  FState.Descricao := Trim(edDescricao.Text);
  FState.CClassTrib := ComboBoxClassTribFrame1.GetCClassTrib();
  FState.PDifCbs := CurrencyNullable.Create(edPDifCbs.AsCurrency, edPDifCbs.IsNull);
  FState.PDifIbsUF := CurrencyNullable.Create(edPDifIbsUf.AsCurrency, edPDifIbsUf.IsNull);
  FState.PDifIbsMun := CurrencyNullable.Create(edPDifIbsMun.AsCurrency, edPDifIbsMun.IsNull);
  FState.InicioVigencia := StrToDate(edInicioVigencia.Text);
  FState.FimVigencia := edFinalVigencia.GetDateNullable();
  FState.EmpresasId := CheckListBoxEmpresasFrame1.GetIdsEmpresasSelecionadas();
end;

procedure TfrmCadRegrasFiscaisIbsCbs.MapStateToForm;
var
  C: ClassificacaoTributariaEtd;
  regras: RegrasFiscaisIbsCbsEtd;
begin
  edDescricao.Text := FState.Descricao;
  ComboBoxClassTribFrame1.Setup(FState.CClassTrib, tfIBSCBS, FState.InicioVigencia );
  ComboBoxRegrasFiscaisFrame1.Setup( FState.RegraFiscalTribRegularId.Value, True );
  edPDifCbs.UpdateValue(FState.PDifCbs.Value, FState.PDifCbs.IsNull);
  edPDifIbsUf.UpdateValue(FState.PDifIbsUF.Value, FState.PDifIbsUF.IsNull);
  edPDifIbsMun.UpdateValue(FState.PDifIbsMun.Value, FState.PDifIbsMun.IsNull);
  edInicioVigencia.Text := DateToStr(FState.InicioVigencia);
  edFinalVigencia.Setup( FState.FimVigencia );
  CheckListBoxEmpresasFrame1.Setup( FState.EmpresasId, FState.Id <> '' );

  with Container.GetInstance().ErpFeaturesFactory.CreateListarAtualeTodosRegrasFiscaisUseCase() do
  try
    regras := Executar( FState.RegraFiscalTribRegularId.Value );
  finally
    FreeSafe();
  end;
  regras.Insert(0, nil);
  //edPickerRegraFiscal.LoadEntities( regras, True );

  FStateTribRegInformadaIndevidamente := False;
  FStateExigeTribRegENaoInformada := False;

  C := ComboBoxClassTribFrame1.GetClassificacao();
  try
    HandleClassificacaoTributacaoRegular( C );
  finally
    C.Free();
  end;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.RegrasFiscaisFrameChange(Sender: TObject;
  RegraFiscal: RegraFiscalIbsCbsEtd);
var
  C: ClassificacaoTributariaEtd;
begin
  if Sender = ComboBoxRegrasFiscaisFrame1 then
  begin
    if RegraFiscal = nil then
      FState.RegraFiscalTribRegularId := StringNullable.NullInstance()
    else
      FState.RegraFiscalTribRegularId := StringNullable.Create( RegraFiscal.Id );

    C := ComboBoxClassTribFrame1.GetClassificacao();
    try
      HandleClassificacaoTributacaoRegular( C );
    finally
      C.Free();
    end;
  end;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.ShowAbaCadastro;
begin
  FFormValidator.Reset();

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tabCadastro;

  if ComboBoxClassTribFrame1.edCClassTrib.CanFocus then
    ComboBoxClassTribFrame1.edCClassTrib.SetFocus;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.SpeedButton1Click(Sender: TObject);
var
  dado: RegraFiscalIbsCbsEtd;
begin
  if FData.IsEmpty() then
    Exit;

  with Container.GetInstance().ErpFeaturesFactory.CreateObterRegraFiscalIbsCbsPorIdUseCase() do
  try
    dado := Executar(FData.fstr('id'));
  finally
    FreeSafe();
  end;

  if dado = nil then
    ShowAtencao('Registro não se encontra mais disponível')
  else if (dado.Ativo = saLixeira) and
    ((ShowConfirmacao('Registro encontra-se na Lixeira. Deseja restaurar o registro?') <> IDYES) or
    (not FAuditor.Processo('MOD019').Alterar()
      .SetMensagem('%s - %s', [FData.fstr('cClassTrib'), FData.fstr('descricao')] )
      .Permitido() )) then
    dado.Free()
  else
  begin 
    if not FAuditor.Processo('MOD016').Alterar()
      .SetMensagem('%s - %s', [ dado.CClassTrib, dado.Descricao] )
      .Permitido() then
      Exit;

    FState.Free();
    FState := dado;
    FState.Ativo := saAtivo;
    MapStateToForm();
    ShowAbaCadastro();
  end;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.SpeedButton2Click(Sender: TObject);
begin
  if FData.IsEmpty() then
    Exit;

  if ShowConfirmacao('Deseja mesmo enviar oa registro para a lixeira?') <> ID_YES then
    Exit;  

  if not FAuditor.Processo('MOD018').Excluir()
    .SetMensagem('%s - %s', [FData.fstr('cClassTrib'), FData.fstr('descricao')] )
    .Permitido() then
    Exit;

  try

    with Container.GetInstance().ErpFeaturesFactory.CreateRemoverRegraFiscalIbsCbsUseCase() do
    try
      Executar(FData.fstr('id'));
    finally
      FreeSafe();
    end;

    FData.Refresh();

  except
    on E: Exception do
      UIUtils.HandleError(E);
  end;
end;

procedure TfrmCadRegrasFiscaisIbsCbs.SpeedButton9Click(Sender: TObject);
begin
  DFeDLLAdapter.ComandarAtualizacaoDadosFiscais();
end;

end.
