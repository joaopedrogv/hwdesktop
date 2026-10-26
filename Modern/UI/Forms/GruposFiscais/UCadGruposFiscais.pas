unit UCadGruposFiscais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uDataSet_OOP, GrupoFiscalEtdUnit, hw_audit_utils,
  IUIFormValidatorUnit, CheckLst,
  CheckListBoxEmpresasFrameUnit;

type
  TfrmCadGruposFiscais = class(TfrmCadPadraoM)
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
    FState: GrupoFiscalEtd;
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
  FieldsConfigUnit,
  TipoTributoFiscalEnumUnit, Contnrs, UIFormValidatorFactoryUnit,
  ContainerUnit, CreateEntityUseCaseOutputUnit,
  EValidacaoNegocioUnit, StatusRegistroEnumUnit, TipoComunsUnit;

type
  TGruposFiscaisOOP = class(TDataSet_OOP)   
  private
    procedure GetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    constructor Create();
  end;

{$R *.dfm}

{ TGruposFiscaisOOP }

constructor TGruposFiscaisOOP.Create;
begin
  TableName := 'GRUPOS_FISCAIS';
  inherited Create(dtmAtivo.bancoHw, nil, True, 'cds_grupos_fiscai');

  ConfigFields(
    FieldsConfigFactory.Create()
      .Add('id,ativo', fvInvisivel)
      .Add('descricao', '', fvSempreVisivel)
      .Add('tipo_tributo', 'Tipo Tributo', GetText)
      .Add('gerido_sistema', 'Sistema', GetText)
  );                                            

  montaSelect('SELECT * FROM GRUPOS_FISCAIS WHERE 1=0');
end;

procedure TGruposFiscaisOOP.GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'TIPO_TRIBUTO' then
    Text := TipoTributoFiscalEnumDisplay[TipoTributoFiscalEnum(Sender.AsInteger)];
  if Sender.FieldName = 'GERIDO_SISTEMA' then
    Text := YesNoEnumStr[YesNoEnum(Sender.AsInteger)];
end;

{ TfrmCadGruposFiscais }

procedure TfrmCadGruposFiscais.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not FAuditor.Processo('MOD008').Visualizar()
      .Permitido() then
      Exit;

    if MaskEdit2.Visible then
    begin
      if not FData.ConsultaCampos( FData.TableName, ComboBox1.Text,
        'seqid', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, IfThen(not ckLixeira.Checked, 1)) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else
      if FData.ConsultaCampos(FData.TableName, MaskEdit3.text, ComboBox1.Text,
        combobox3.Text, 'seqid', true, vDadosIni.codEmpresa, IfThen(not ckLixeira.Checked, 1)) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		ComboBox1.SetFocus;

    inherited;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadGruposFiscais.BitBtn3Click(Sender: TObject);
begin
  if not FAuditor.Processo('MOD009').Inserir()
    .Permitido() then
    Exit;
  try
    Screen.Cursor := crHourGlass;

    FState.Free();
    FState := GrupoFiscalEtd.Create();

    MapStateToForm();
    ShowAbaCadastro();
    
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadGruposFiscais.BitBtn4Click(Sender: TObject);
var
  createResult: CreateEntityUseCaseOutPut;
begin
  MapFormToState();   

  if not FAuditor.Processo('MOD011').Salvar()
    .SetMensagem('%d - %s', [FState.SeqId, FState.Descricao] )
    .Permitido() then
    Exit;

  try

    try
      with Container.GetInstance().ErpFeaturesFactory.CreateSalvarGruposFiscaisUseCase() do
      try
        createResult := Executar( FState );
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

procedure TfrmCadGruposFiscais.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1.Click;
end;

procedure TfrmCadGruposFiscais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FData.Free();
  FState.Free();
                     
  Action := caFree;

  inherited;
end;

procedure TfrmCadGruposFiscais.FormCreate(Sender: TObject);
begin
  TelaCadastro := vDadosIni.vTipoForm;

  FState   := GrupoFiscalEtd.Create();
  FData    := TGruposFiscaisOOP.Create();
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

procedure TfrmCadGruposFiscais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    BitBtn3.Click;
end;

procedure TfrmCadGruposFiscais.FormShow(Sender: TObject);
begin
  PageControl3.ActivePage := tabCadastro;
  PageControl1.ActivePage := TabSheet2;
  Panel1.Visible          := True;
  tabCadastro.TabVisible  := True;

  if vShow <> 1 then
    inherited;
end;

procedure TfrmCadGruposFiscais.MapFormToState;
begin
  FState.Descricao := Trim(edDescricao.Text);
  FState.TipoTributo := TipoTributoFiscalEnum(edTipoTributo.ItemIndex);
  FState.EmpresasId := CheckListBoxEmpresasFrame1.GetIdsEmpresasSelecionadas();
end;

procedure TfrmCadGruposFiscais.MapStateToForm;
begin
  UIUtils.Populate(edTipoTributo.Items, TipoTributoFiscalEnumDisplay);
  edTipoTributo.ItemIndex := Ord(FState.TipoTributo);

  edSeqId.Text := IntToStr(FState.SeqId);
  edDescricao.Text := FState.Descricao;

  CheckListBoxEmpresasFrame1.Setup( FState.EmpresasId, FState.Id <> '' );
end;

procedure TfrmCadGruposFiscais.ShowAbaCadastro;
begin
  FFormValidator.Reset();

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tabCadastro;

  edTipoTributo.Enabled := FState.Id = '';

  if edDescricao.CanFocus then
    edDescricao.SetFocus;  
end;

procedure TfrmCadGruposFiscais.SpeedButton1Click(Sender: TObject);
var
  dado: GrupoFiscalEtd;
begin
  if FData.IsEmpty() then
    Exit;

  with Container.GetInstance().ErpFeaturesFactory.CreateObterGruposFiscaisUseCase()
  do
  try
    dado := Executar(FData.fstr('id'));
  finally
    FreeSafe();
  end;

  if dado = nil then
    ShowAtencao('Registro não se encontra mais disponível')
  else if (dado.Ativo = saLixeira) and
    ((ShowConfirmacao('Registro encontra-se na Lixeira. Deseja restaurar o registro?') <> IDYES) or
    (not FAuditor.Processo('MOD013').Alterar()
      .SetMensagem('%d - %s', [FData.fint('seqid'), FData.fstr('descricao')] )
      .Permitido() )) then
    dado.Free()
  else
  begin
    if not FAuditor.Processo('MOD010').Alterar()
      .SetMensagem('%d - %s', [ dado.SeqId, dado.Descricao] )
      .Permitido() then
      Exit;

    FState.Free();
    FState := dado;
    FState.Ativo := saAtivo;
    MapStateToForm();
    ShowAbaCadastro();
  end;
end;

procedure TfrmCadGruposFiscais.SpeedButton2Click(Sender: TObject);
begin
  if FData.IsEmpty() then
    Exit;

  if ShowConfirmacao('Deseja mesmo enviar oa registro para a lixeira?') <> ID_YES then
    Exit;

  if not FAuditor.Processo('MOD012').Excluir()
    .SetMensagem('%d - %s', [FData.fint('seqid'), FData.fstr('descricao')] )
    .Permitido() then
    Exit;

  try
    with Container.GetInstance().ErpFeaturesFactory.CreateRemoverGruposFiscaisUseCase() do
    try
       Executar(FData.fstr('id'))
    finally
      FreeSafe();
    end;

    FData.Refresh();

  except
    on E: Exception do
      UIUtils.HandleError(E);
  end;
end;

end.

