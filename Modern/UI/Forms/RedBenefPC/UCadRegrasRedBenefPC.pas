unit UCadRegrasRedBenefPC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, FilterFR,
  FilterPadraoFR, RegrasRedBenefPcDataSet, IUIFormValidatorUnit, hw_audit_utils, CheckListBoxEmpresasFrameUnit,
  MaskEditNullableFrameUnit, uEditHw, RegraRedBenefPcEtdUnit;

type
  TFrmCadRegrasRedBenefPC = class(TfrmCadPadraoM)
    FilterFramePadrao1: TFilterFramePadrao;
    tabCadastro: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    edDescricao: TEdit;
    CheckListBoxEmpresasFrame1: TCheckListBoxEmpresasFrame;
    lbxRestricoesNcm: TListBox;
    Label8: TLabel;
    Label10: TLabel;
    lbxNaturezasReceita: TListBox;
    edFimVigencia: TMaskEditNullableFrame;
    Label16: TLabel;
    edInicioVigencia: TMaskEdit;
    Label15: TLabel;
    edCST: TMaskEdit;
    Label11: TLabel;
    edSeqId: TMaskEdit;
    edPercReducao: TEditHw;
    Label12: TLabel;
    PopupMenu3: TPopupMenu;
    NatRecIncluir1: TMenuItem;
    NatRecExcluir1: TMenuItem;
    NatRecCopiarLinha1: TMenuItem;
    NatRecCopiarTudo1: TMenuItem;
    NatRecColar1: TMenuItem;
    btNatRecAdd: TSpeedButton;
    btNatRecDel: TSpeedButton;
    btNatRecCopy: TSpeedButton;
    btNatRecPaste: TSpeedButton;
    btRestrNcmAdd: TSpeedButton;
    btRestrNcmDel: TSpeedButton;
    btRestrNcmCopy: TSpeedButton;
    btRestrNcmPaste: TSpeedButton;
    ckLixeira: TCheckBox;
    Label13: TLabel;
    edIndAjusteEFD: TEditHw;
    label14: TLabel;
    edCodAjusteEFD: TEditHw;
    Label17: TLabel;
    edDescricaoAjusteEFD: TEdit;
    edInfComplementarAjusteEFD: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    edCodContaContabil: TEdit;
    procedure edCSTExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure lbxRestricoesNcmKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btRestrNcmPasteClick(Sender: TObject);
    procedure btRestrNcmPasteMouseEnter(Sender: TObject);
    procedure btRestrNcmCopyClick(Sender: TObject);
    procedure btRestrNcmDelClick(Sender: TObject);
    procedure btRestrNcmAddClick(Sender: TObject);
    procedure btNatRecPasteClick(Sender: TObject);
    procedure btNatRecPasteMouseEnter(Sender: TObject);
    procedure btNatRecCopyClick(Sender: TObject);
    procedure lbxNaturezasReceitaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btNatRecDelClick(Sender: TObject);
    procedure btNatRecAddClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FData: TRegrasRedBenefPcDataSet;
    FAuditor: TAudit_OOP;
    FFormValidator: IUIFormValidator;
    FState: RegraRedBenefPcEtd;
  private
    procedure MapStateToForm();
    procedure MapFormToState();
    procedure ShowAbaCadastro();
  public
  end;

var
  FrmCadRegrasRedBenefPC: TFrmCadRegrasRedBenefPC;

implementation

uses
  uDtmAtivo, Math, ClipBrd, hw_utils,
  ContainerUnit, FieldsConfigUnit, UIFormValidatorFactoryUnit, RegraRedBenefPcMetadataUnit, EntityMetadataUnit,
  DbGridConfigUtilsUnit, StringServiceUnit, UIUtilsUnit, EValidacaoNegocioUnit, TipoComunsUnit,
  CreateEntityUseCaseOutputUnit, ObterRegraRedBenefPcUseCaseUnit, StatusRegistroEnumUnit;

{$R *.dfm}

procedure TFrmCadRegrasRedBenefPC.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not FAuditor.Processo('MOD032').Visualizar().Permitido() then
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

procedure TFrmCadRegrasRedBenefPC.BitBtn3Click(Sender: TObject);
begin
  if not FAuditor.Processo('MOD033').Inserir()
    .Permitido() then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    FState.Free();
    FState := RegraRedBenefPcEtd.Create();

    MapStateToForm();
    ShowAbaCadastro();

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadRegrasRedBenefPC.BitBtn4Click(Sender: TObject);
var
  createResult: CreateEntityUseCaseOutPut;
begin
  MapFormToState();

  if not FAuditor.Processo('MOD035').Salvar()
    .Permitido() then
    Exit;

  try try
    createResult := Container.GetInstance().ErpFeaturesFactory.CreateSalvarRegraRedBenefPcUseCase().
      Executar( FState );

    if not createResult.Validation.IsValid then
      FFormValidator.Validate(createResult.Validation)

    else
    begin
      FAuditor.Sucesso().GravarMensagem( FState.Descricao );

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

procedure TFrmCadRegrasRedBenefPC.btNatRecAddClick(Sender: TObject);
var
  L: TStringList;
  S: string;
begin
  inherited;

  if not InputQuery('Natureza da Receita', 'Informe o código da natureza da receita. (ex: 101)', S) then
    Exit;


  S := StringService.OnlyNumber(S);
  try
    if Length(S) <> 3  then
      raise EValidacaoNegocio.Create('Código da natureza da receita inválido. Informe 3 dígitos numéricos');

    L := TStringList.Create;
    try
      L.Sorted := True;
      L.Duplicates := dupIgnore;
      L.AddStrings(lbxNaturezasReceita.Items);

      L.Add(S);

      if L.Count = lbxNaturezasReceita.Items.Count  then
        raise EValidacaoNegocio.Create('Código da natureza da receita já existe na lista');

      lbxNaturezasReceita.Items.Clear();
      lbxNaturezasReceita.Items.AddStrings(L);

    finally
      L.Free();
    end;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

procedure TFrmCadRegrasRedBenefPC.btNatRecCopyClick(Sender: TObject);
var
  S: string;
begin
  S := lbxNaturezasReceita.Items.Text;
  Clipboard.AsText := S;

  S := StringReplace(S, sLineBreak, ', ', [rfReplaceAll]);

  UIUtils.HintInfo( lbxNaturezasReceita, Format('%s copiado para área de transferência', [ S ]));
end;

procedure TFrmCadRegrasRedBenefPC.btNatRecDelClick(Sender: TObject);
var
  I: Integer;
begin
  I := lbxNaturezasReceita.ItemIndex;
  if I > -1 then
  begin
    lbxNaturezasReceita.Items.Delete(lbxNaturezasReceita.ItemIndex);

    if (lbxNaturezasReceita.Items.Count > 0) then
      lbxNaturezasReceita.ItemIndex := Min(I, lbxNaturezasReceita.Items.Count - 1);
  end;
end;

procedure TFrmCadRegrasRedBenefPC.btNatRecPasteClick(Sender: TObject);
var
  L: TStringList;
  S, Mensagem: string;
  A: TArrayString;
  I: Integer;
begin
  S := Clipboard.AsText;
  try

    if S = '' then
      raise EValidacaoNegocio.Create('Nenhum texto na área de transferência');

    if UIUtils.ShowQuestion(
      'O sistema irá copiar apenas os registros que seguirem o formato "NNN" onde "N" corresponde a um número. ' +
      'Deseja continuar?'
    ) <> IDYES then
      Exit;

    S := StringReplace(S, sLineBreak, ',', [rfReplaceAll]);
    S := StringReplace(S, #9, ',', [rfReplaceAll]);
    S := StringReplace(S, ';', ',', [rfReplaceAll]);
    S := StringReplace(S, ' ', ',', [rfReplaceAll]);

    A := StringService.Split([','], S);

    L := TStringList.Create;
    try
      L.Sorted := True;
      L.Duplicates := dupIgnore;
      L.AddStrings(lbxNaturezasReceita.Items);

      for I := 0 to High(A) do
      begin
        S := Copy(StringService.PadLeft(StringService.OnlyNumber(A[I]), 3, '0'), 1, 3);

        // Validacao
        if (StringService.OnlyNumber(A[I]) <> '')
          and (S = StringService.PadLeft(A[I], 3, '0'))
        then
          L.Add( S );
      end;

      lbxNaturezasReceita.Items.Clear();
      lbxNaturezasReceita.Items.AddStrings(L);

    finally
      L.Free();
    end;
  
  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

procedure TFrmCadRegrasRedBenefPC.btNatRecPasteMouseEnter(Sender: TObject);
var
  S: string;
begin
  S := Clipboard.AsText;

  if S <> '' then
    btNatRecPaste.Hint := 'Colar: ' + sLineBreak + StringReplace(S, #9, '  ', [rfReplaceAll] )
  else                                 
    btNatRecPaste.Hint := 'Colar da área de transferência';
end;

procedure TFrmCadRegrasRedBenefPC.btRestrNcmAddClick(Sender: TObject);
var
  L: TStringList;
  S: string;
begin
  inherited;

  if not InputQuery('NCM', 'Informe o NCM da mercadoria. (ex: 82, 4113, 54231090)', S) then
    Exit;


  S := StringService.OnlyNumber(S);
  try
    if (Length(S) < 2) or (Length(S) > 8)  then
      raise EValidacaoNegocio.Create('NCM inválido. Informe entre 2 e 8 dígitos');

    L := TStringList.Create;
    try
      L.Sorted := True;
      L.Duplicates := dupIgnore;
      L.AddStrings(lbxRestricoesNcm.Items);

      L.Add(S);

      if L.Count = lbxRestricoesNcm.Items.Count  then
        raise EValidacaoNegocio.Create('NCM já existe na lista');

      lbxRestricoesNcm.Items.Clear();
      lbxRestricoesNcm.Items.AddStrings(L);

    finally
      L.Free();
    end;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

procedure TFrmCadRegrasRedBenefPC.btRestrNcmCopyClick(Sender: TObject);
var
  S: string;
begin
  S := lbxRestricoesNcm.Items.Text;
  Clipboard.AsText := S;

  S := StringReplace(S, sLineBreak, ', ', [rfReplaceAll]);

  UIUtils.HintInfo( lbxRestricoesNcm, Format('%s copiado para área de transferência', [ S ]));
end;

procedure TFrmCadRegrasRedBenefPC.btRestrNcmDelClick(Sender: TObject);
var
  I: Integer;
begin
  I := lbxRestricoesNcm.ItemIndex;
  if I > -1 then
  begin
    lbxRestricoesNcm.Items.Delete(lbxRestricoesNcm.ItemIndex);

    if (lbxRestricoesNcm.Items.Count > 0) then
      lbxRestricoesNcm.ItemIndex := Min(I, lbxRestricoesNcm.Items.Count - 1);
  end;
end;

procedure TFrmCadRegrasRedBenefPC.btRestrNcmPasteClick(Sender: TObject);
var
  L: TStringList;
  S, Mensagem: string;
  A: TArrayString;
  I: Integer;
begin
  S := Clipboard.AsText;
  try

    if S = '' then
      raise EValidacaoNegocio.Create('Nenhum texto na área de transferência');

    if UIUtils.ShowQuestion(
      'O sistema irá copiar apenas os registros que tenham entre 2 e 8 dígitos numéricos. ' +
      'Deseja continuar?'
    ) <> IDYES then
      Exit;

    S := StringReplace(S, sLineBreak, ',', [rfReplaceAll]);
    S := StringReplace(S, #9, ',', [rfReplaceAll]);
    S := StringReplace(S, ';', ',', [rfReplaceAll]);
    S := StringReplace(S, ' ', ',', [rfReplaceAll]);

    A := StringService.Split([','], S);

    L := TStringList.Create;
    try
      L.Sorted := True;
      L.Duplicates := dupIgnore;
      L.AddStrings(lbxRestricoesNcm.Items);

      for I := 0 to High(A) do
      begin
        S := OnlyNumber(A[I], '.');

        // Validacao
        if (S = A[I]) and ( Length(OnlyNumber(S)) >= 2 ) and ( Length(OnlyNumber(S)) <= 8 ) then
          L.Add( OnlyNumber(S) );
      end;

      lbxRestricoesNcm.Items.Clear();
      lbxRestricoesNcm.Items.AddStrings(L);

    finally
      L.Free();
    end;
  
  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

procedure TFrmCadRegrasRedBenefPC.btRestrNcmPasteMouseEnter(Sender: TObject);
var
  S: string;
begin
  S := Clipboard.AsText;

  if S <> '' then
    btRestrNcmPaste.Hint := 'Colar: ' + sLineBreak + StringReplace(S, #9, '  ', [rfReplaceAll] )
  else
    btRestrNcmPaste.Hint := 'Colar da área de transferência';
end;

procedure TFrmCadRegrasRedBenefPC.edCSTExit(Sender: TObject);
begin
  inherited;
  // Descricao
  if (edCST.Text = '06') and (edDescricao.Text = '') then
    edDescricao.Text := 'REDUCAO DE BENEFICIO TRIBUTADO COM ALIQUOTA ZERO'

  else if (edCST.Text = '07') and (edDescricao.Text = '') then
    edDescricao.Text := 'REDUCAO DE BENEFICIO COM ISENCAO';

  // Codigo de ajuste
  if (edCST.Text = '06') and edCodAjusteEFD.IsNull then
    edCodAjusteEFD.UpdateValue(11)

  else if (edCST.Text = '07') and edCodAjusteEFD.IsNull then
    edCodAjusteEFD.UpdateValue(10);

end;

procedure TFrmCadRegrasRedBenefPC.FormCreate(Sender: TObject);
var
  builder: IFieldsConfigBuilder;
  Meta: EntityMetadata;
begin
  TelaCadastro := vDadosIni.vTipoForm;

  FData := TRegrasRedBenefPcDataSet.Create();
  FAuditor := FData.Auditor;
  builder := FieldsConfigFactory.Create();

  DBGrid1.DataSource := FData._dataSourceOOP;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);
  //configurarGridPeloConfigColunas(DBGrid1);
  Meta := RegraRedBenefPcMetadata.GetMetadata();
  FData.Setup(builder, Meta);

  FilterFramePadrao1.OnFieldChange := FData.HandleFilterField;
  FilterFramePadrao1.TodosToggle(True).FillForm(FData.dataSet, nil, 'Todos');

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder(Meta, BitBtn4)
    .Bind(edCST)
    .Bind(edDescricao)
    .Bind(edPercReducao)
    .Bind(edIndAjusteEFD)
    .Bind(edCodAjusteEFD)
    .Bind(edDescricaoAjusteEFD)
    .Bind(edInfComplementarAjusteEFD)
    .Bind(edCodContaContabil)
    .Bind(Meta.Attribute['NaturezasReceita'], lbxNaturezasReceita)
    .Bind(Meta.Attribute['RestricoesNcm'], lbxRestricoesNcm)
    .Bind(edInicioVigencia)
    .Bind(edFimVigencia)
    .Bind(Meta.Attribute['EmpresasId'], CheckListBoxEmpresasFrame1)
    .Validator();

  DbGridConfigUtils.ApplyToDBGrid(DBGrid1, builder.List);
  PrimeiraPesquisa := False;

  inherited;

  //Self.FieldSelection := FData.ffield('sel');

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C'
end;

procedure TFrmCadRegrasRedBenefPC.FormShow(Sender: TObject);
begin
  PageControl3.ActivePage := tabCadastro;
  PageControl1.ActivePage := TabSheet2;
  Panel1.Visible := True;
  tabCadastro.TabVisible := True;

  if vShow <> 1 then
    inherited;
end;

procedure TFrmCadRegrasRedBenefPC.lbxNaturezasReceitaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = Ord('V')) then
    btNatRecPaste.Click()

  else if (ssCtrl in Shift) and (Key = Ord('C')) and (lbxNaturezasReceita.ItemIndex > -1) then
  begin
    Clipboard.AsText := lbxNaturezasReceita.Items[lbxNaturezasReceita.ItemIndex];
    UIUtils.HintInfo(
      lbxNaturezasReceita,
      Format('%s copiado para área de transferência', [lbxNaturezasReceita.Items[lbxNaturezasReceita.ItemIndex]])
    );
  end;
end;

procedure TFrmCadRegrasRedBenefPC.lbxRestricoesNcmKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Key = Ord('V')) then
    btRestrNcmPaste.Click()

  else if (ssCtrl in Shift) and (Key = Ord('C')) and (lbxRestricoesNcm.ItemIndex > -1) then
  begin
    Clipboard.AsText := lbxRestricoesNcm.Items[lbxRestricoesNcm.ItemIndex];
    UIUtils.HintInfo(
      lbxRestricoesNcm,
      Format('%s copiado para área de transferência', [lbxRestricoesNcm.Items[lbxRestricoesNcm.ItemIndex]])
    );
  end;
end;

procedure TFrmCadRegrasRedBenefPC.MapFormToState;
begin
  FState.Cst := edCST.Text;
  FState.Descricao := edDescricao.Text;
  FState.PercReducao := edPercReducao.AsCurrency;
  FState.IndAjusteEFD := edIndAjusteEFD.AsInteger;
  FState.CodAjusteEFD := edCodAjusteEFD.AsInteger;
  FState.DescricaoAjusteEFD := edDescricaoAjusteEFD.Text;
  FState.InfComplementarAjusteEFD := edInfComplementarAjusteEFD.Text;
  FState.CodContaContabil := edCodContaContabil.Text;
  FState.InicioVigencia := StrToDate(edInicioVigencia.Text);
  FState.FimVigencia := edFimVigencia.GetDateNullable();
  FState.EmpresasId := CheckListBoxEmpresasFrame1.GetIdsEmpresasSelecionadas();
  FState.NaturezasReceita := StringService.StringsToArray( lbxNaturezasReceita.Items );
  FState.RestricoesNcm := StringService.StringsToArray( lbxRestricoesNcm.Items );
end;

procedure TFrmCadRegrasRedBenefPC.MapStateToForm;
var
  I: Integer;
begin
  edSeqId.Text := IntToStr(FState.SeqId);
  edCST.Text := FState.Cst;
  edDescricao.Text := FState.Descricao;
  edPercReducao.UpdateValue(FState.PercReducao);
  edIndAjusteEFD.UpdateValue(FState.IndAjusteEFD);
  edCodAjusteEFD.UpdateValue(FState.CodAjusteEFD, FState.Id = '');
  edDescricaoAjusteEFD.Text := FState.DescricaoAjusteEFD;
  edInfComplementarAjusteEFD.Text := FState.InfComplementarAjusteEFD;
  edCodContaContabil.Text := FState.CodContaContabil;

  lbxNaturezasReceita.Items.Clear();
  for I := 0 to High(FState.NaturezasReceita) do
    lbxNaturezasReceita.Items.Add(FState.NaturezasReceita[I]);

  lbxRestricoesNcm.Items.Clear();
  for I := 0 to High(FState.RestricoesNcm) do
    lbxRestricoesNcm.Items.Add(FState.RestricoesNcm[I]);

  edInicioVigencia.Text := DateToStr(FState.InicioVigencia);
  edFimVigencia.Setup( FState.FimVigencia );

  CheckListBoxEmpresasFrame1.Setup( FState.EmpresasId, FState.Id <> '' );
end;

procedure TFrmCadRegrasRedBenefPC.ShowAbaCadastro;
begin
  FFormValidator.Reset();

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tabCadastro;

  if edCST.CanFocus then
    edCST.SetFocus;
end;

procedure TFrmCadRegrasRedBenefPC.SpeedButton1Click(Sender: TObject);
var
  dado: RegraRedBenefPcEtd;
begin
  if FData.IsEmpty() then
    Exit;

  dado := Container.GetInstance().ErpFeaturesFactory.CreateObterRegraRedBenefPcPorIdUseCase()
    .Executar(FData.fstr('id'));

  if dado = nil then
    ShowAtencao('Registro não se encontra mais disponível')
  else if (dado.Ativo = saLixeira) and
    ((ShowConfirmacao('Registro encontra-se na Lixeira. Deseja restaurar o registro?') <> IDYES) or
    (not FAuditor.Processo('MOD037').Alterar()
      .SetMensagem( dado.Descricao )
      .Permitido() )) then
    dado.Free()
  else
  begin
    if not FAuditor.Processo('MOD034').Alterar()
      .SetMensagem(dado.Descricao)
      .Permitido() then
    begin
      dado.Free();
      Exit;
    end;

    FState.Free();
    FState := dado;
    FState.Ativo := saAtivo;
    MapStateToForm();

    ShowAbaCadastro();
  end;
end;

procedure TFrmCadRegrasRedBenefPC.SpeedButton2Click(Sender: TObject);
begin
  if FData.IsEmpty() or
    (ShowConfirmacao('Deseja mesmo enviar oa registro para a lixeira?') <> ID_YES) then
    Exit;       

  if not FAuditor.Processo('MOD036').Excluir()
    .SetMensagem( FData.fstr('descricao') )
    .Permitido() then
    Exit;

  try
    Container.GetInstance().ErpFeaturesFactory.CreateRemoverRegraRedBenefPcUseCase()
      .Executar(FData.fstr('id'));

    FAuditor.Sucesso().GravarMensagem( FData.fstr('descricao') );

    FData.Refresh();

  except
    on E: Exception do
      UIUtils.HandleError(E);
  end;
end;

end.
