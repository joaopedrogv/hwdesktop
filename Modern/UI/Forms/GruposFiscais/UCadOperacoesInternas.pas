unit UCadOperacoesInternas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uDataSet_OOP, OperacaoInternaEtdUnit, hw_audit_utils,
  IUIFormValidatorUnit, CheckLst,
  CheckListBoxEmpresasFrameUnit;

type
  TfrmCadOperacoesInternas = class(TfrmCadPadraoM)
    tabCadastro: TTabSheet;
    Label6: TLabel;
    edSeqId: TEdit;
    Label7: TLabel;
    edDescricao: TEdit;
    edTipoTributo: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame;
    ckLixeira: TCheckBox;
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
    FState: OperacaoInternaEtd;
    FFormValidator: IUIFormValidator;
  private
    procedure ShowAbaCadastro();
    procedure MapStateToForm();
    procedure MapFormToState();
  public

  end;

implementation

uses
  uDtmAtivo, UIUtilsUnit, hw_utils, hw_grid_utils, Math, DB,
  Contnrs, UIFormValidatorFactoryUnit,
  ContainerUnit, CreateEntityUseCaseOutputUnit,
  EValidacaoNegocioUnit, StatusRegistroEnumUnit;

type
  TOperacoesInternasOOP = class(TDataSet_OOP)
  private
    //procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();
  end;

{$R *.dfm}

{ TOperacoesInternasOOP }

constructor TOperacoesInternasOOP.Create;
begin
  TableName := 'OP_INTERNAS';
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_op_internas');

  montaSelect('SELECT * FROM OP_INTERNAS WHERE 1=0');

  dataSet.FieldByName('id').Tag        := TAG_GRID_INVISIVEL_SEMPRE;
  dataSet.FieldByName('ativo').Tag     := TAG_GRID_INVISIVEL_SEMPRE;
  dataSet.FieldByName('descricao').Tag := TAG_GRID_VISIVEL_SEMPRE;
end;

{ TfrmCadOperacoesInternas }

procedure TfrmCadOperacoesInternas.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

//    if not FAuditor.Processo('KAKAK').Visualizar()
//      .Permitido() then
//      Exit;

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

procedure TfrmCadOperacoesInternas.BitBtn3Click(Sender: TObject);
begin
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
var
  createResult: CreateEntityUseCaseOutPut;
begin
  inherited;

  MapFormToState();

  try
    createResult :=
      Container.GetInstance().ErpFeaturesFactory.CreateSalvarOperacoesInternasUseCase()
      .Executar( FState );

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
  FData.Free();
  FState.Free();

  Action := caFree;

  inherited;
end;

procedure TfrmCadOperacoesInternas.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;

  FState   := OperacaoInternaEtd.Create();
  FData    := TOperacoesInternasOOP.Create();
  FAuditor := FData.Auditor;

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder()
    .Bind(edDescricao)
    .Bind(edTipoTributo)
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
  FState.TipoTributo := TipoTributoFiscalEnum(edTipoTributo.ItemIndex);
  FState.EmpresasId := CheckListBoxEmpresasFrame1.GetIdsEmpresasSelecionadas();
end;

procedure TfrmCadOperacoesInternas.MapStateToForm;
begin
  UIUtils.Populate(edTipoTributo.Items, TipoTributoFiscalEnumDisplay);
  edTipoTributo.ItemIndex := Ord(FState.TipoTributo);

  edSeqId.Text := IntToStr(FState.SeqId);
  edDescricao.Text := FState.Descricao;

  CheckListBoxEmpresasFrame1.Setup( FState.EmpresasId, FState.Id <> '' );
end;

procedure TfrmCadOperacoesInternas.ShowAbaCadastro;
begin
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tabCadastro;

  if edDescricao.CanFocus then
    edDescricao.SetFocus;
end;

procedure TfrmCadOperacoesInternas.SpeedButton1Click(Sender: TObject);
var
  dado: OperacaoInternaEtd;
begin
  if FData.IsEmpty() then
    Exit;

  dado := Container.GetInstance().ErpFeaturesFactory.CreateObterOperacoesInternasUseCase()
    .Executar(FData.fstr('id'));

  if dado = nil then
    ShowAtencao('Registro não se encontra mais disponível')
  else if (dado.Ativo = saLixeira) and
    (ShowConfirmacao('Registro encontra-se na Lixeira. Deseja restaurar o registro?') <> IDYES) then
  else
  begin
    FState.Free();
    FState := dado;
    FState.Ativo := saAtivo;
    MapStateToForm();
    ShowAbaCadastro();
  end;
end;

procedure TfrmCadOperacoesInternas.SpeedButton2Click(Sender: TObject);
begin
  if FData.IsEmpty() then
    Exit;

  if ShowConfirmacao('Deseja mesmo enviar oa registro para a lixeira?') <> ID_YES then
    Exit;

  try

    Container.GetInstance().ErpFeaturesFactory.CreateRemoverOperacoesInternasUseCase()
      .Executar(FData.fstr('id'));

    FData.Refresh();

  except
    on E: Exception do
      UIUtils.HandleError(E);
  end;
end;

end.
