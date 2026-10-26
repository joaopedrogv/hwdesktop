unit UCadNFSeConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, uEditHw, Mask, Buttons, ExtCtrls, ComboBoxOpInternasFrameUnit,
  ConfiguracaoNFSeModelUnit, IUIFormValidatorUnit, hw_audit_utils;

type
  TFrmCadNFSeConfig = class(TfrmPadrao)
    pnBottom: TPanel;
    btSair: TBitBtn;
    Panel1: TPanel;
    btSalvar: TBitBtn;
    Panel4: TPanel;
    Label5: TLabel;
    edSerie: TMaskEdit;
    Panel2: TPanel;
    Label1: TLabel;
    edOpSimpNac: TComboBox;
    Panel3: TPanel;
    Label2: TLabel;
    edRegApTribSN: TComboBox;
    Panel5: TPanel;
    Label3: TLabel;
    edRegEsTrib: TComboBox;
    Panel6: TPanel;
    Label4: TLabel;
    ComboBoxOpInternasFrame1: TComboBoxOpInternasFrame;
    Panel7: TPanel;
    Label6: TLabel;
    edLayoutNFSe: TComboBox;
    Panel8: TPanel;
    Label7: TLabel;
    edWSFraseSecreta: TMaskEdit;
    Panel9: TPanel;
    Label8: TLabel;
    edWSSenha: TMaskEdit;
    Panel10: TPanel;
    Label9: TLabel;
    edWSChaveAcesso: TMaskEdit;
    Panel11: TPanel;
    ckEnviarInscricaoMunicipal: TCheckBox;
    ckInibirValTrib: TCheckBox;
    ckPreferirAliqSNaoIbpt: TCheckBox;
    ckIncentivoCultural: TCheckBox;
    ckConvenioAtivo: TCheckBox;
    ckAgruparPorCTribNac: TCheckBox;
    ckDiscriminacaoSimplificada: TCheckBox;
    btDesativarModuloAntigo: TBitBtn;
    lbInfoTransicao: TLabel;
    ckDcomptIgualDataAtual: TCheckBox;
    Panel12: TPanel;
    Label10: TLabel;
    edComunicacaoSistema: TComboBox;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure btDesativarModuloAntigoClick(Sender: TObject);
    procedure edLayoutNFSeChange(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FEmpresaId: Integer;
    FCMunEmitente: Integer;
    FFormValidator: IUIFormValidator;
    FAuditor: TAudit_OOP;
  public
    procedure Setup(const Input: ConfiguracaoNFSeModel; EmpresaId: Integer; Auditor: TAudit_OOP);
  end;

var
  FrmCadNFSeConfig: TFrmCadNFSeConfig;

implementation

uses
  StrUtils, ContainerUnit, UIUtilsUnit, NFSeTypesUnit, WebServiceDFeModelUnit, SalvarConfigNFSeInputUnit,
  StringNullableUnit, ValidationEntityOutputUnit, UIFormValidatorFactoryUnit, DFeDLLAdapterUnit, StringServiceUnit,
  ErpFeaturesFactoryUnit, NFSeTypesDisplayUnit, DateTimeServiceUnit;

const
  ComunicacaoSistemaEnumStr: array[ComunicacaoSistemaEnum] of string = (
    'Ambiente de Dados Nacional (ADN)', 'API do Provedor da Prefeitura'
  );

{$R *.dfm}

procedure TFrmCadNFSeConfig.btDesativarModuloAntigoClick(Sender: TObject);
begin
  btDesativarModuloAntigo.Tag := 1;
  btDesativarModuloAntigo.Enabled := False;

  UIUtils.ShowInfo('Salve as alterações para confirmar');
end;

procedure TFrmCadNFSeConfig.btSalvarClick(Sender: TObject);
var
  validacao: ValidationEntityOutput;
  S: string;
  iRegime: Integer;
begin
  if not FAuditor.Processo('NFS040').Alterar.Permitido() then
    Exit;

  iRegime := StrToIntDef(StringService.OnlyNumber(Copy(Trim(edRegEsTrib.Text), 1, 2)), -1);

  validacao := Container.GetInstance().ErpFeaturesFactory.CreateSalvarConfiguracaoNFSeUseCase()
    .Executar( SalvarConfigNFSeInput.Create(
      FEmpresaId, FCMunEmitente, LayoutNFSeEnum(edLayoutNFSe.ItemIndex), edSerie.Text, ckInibirValTrib.Checked,
      ckEnviarInscricaoMunicipal.Checked, ckConvenioAtivo.Checked, ckPreferirAliqSNaoIbpt.Checked, ckIncentivoCultural.Checked,
      ckAgruparPorCTribNac.Checked,
      RegimeApuracaoSNEnum(edRegApTribSN.ItemIndex), iRegime,
      StringNullable.CreateOrNull(ComboBoxOpInternasFrame1.GetOperacaoInternaId), OptanteSNEnum(edOpSimpNac.ItemIndex),
      edWSFraseSecreta.Text, edWSChaveAcesso.Text, edWSSenha.Text,
      ComunicacaoSistemaEnum(edComunicacaoSistema.ItemIndex), ckDiscriminacaoSimplificada.Checked,
      {DesativacaoLegado} (btDesativarModuloAntigo.Tag = 1), ckDcomptIgualDataAtual.Checked
    ));

  if not validacao.IsValid then
    FFormValidator.Validate(validacao)
  else
  begin
    FAuditor.Sucesso.GravarMensagemProcesso('');
    Close;
  end;
end;

procedure TFrmCadNFSeConfig.edLayoutNFSeChange(Sender: TObject);
var
  layout: LayoutNFSeEnum;
begin
  layout := LayoutNFSeEnum(edLayoutNFSe.ItemIndex);

  ckConvenioAtivo.Enabled := layout <> lytPrefeitura;
  ckEnviarInscricaoMunicipal.Enabled := layout <> lytPrefeitura;
  ckInibirValTrib.Enabled := layout <> lytPrefeitura;
  ckPreferirAliqSNaoIbpt.Enabled := layout <> lytPrefeitura;
  ckIncentivoCultural.Enabled := layout = lytPrefeitura;
  ckAgruparPorCTribNac.Enabled := layout = lytPrefeitura;

  edComunicacaoSistema.ItemIndex := Ord(layout = lytPrefeitura);
  edComunicacaoSistema.Enabled := False;
end;

procedure TFrmCadNFSeConfig.FormCreate(Sender: TObject);
begin
  FFormValidator := UIFormValidatorFactory.Create()
    .Builder(btSalvar)
    .Bind(edSerie)
    .Bind(edOpSimpNac)
    .Bind(edRegApTribSN)
    .Bind(edRegEsTrib)
    .Bind(edLayoutNFSe)
    .Bind(ckInibirValTrib)
    .Bind(ckPreferirAliqSNaoIbpt)
    .Validator();

  UIUtils.Populate( edLayoutNFSe.Items, LayoutNFSeEnumGridStr );
  UIUtils.Populate( edOpSimpNac.Items, OptanteSNEnumStr );
  UIUtils.Populate( edRegApTribSN.Items, RegimeApuracaoSNEnumStr );
  UIUtils.Populate(edComunicacaoSistema.Items, ComunicacaoSistemaEnumStr);
  //UIUtils.Populate( edRegEsTrib.Items, RegimeApuracaoSNEnumStr ); obter da DLL
end;

procedure TFrmCadNFSeConfig.Setup(const Input: ConfiguracaoNFSeModel; EmpresaId: Integer; Auditor: TAudit_OOP);
var
  I: Integer;
  S: string;
  ApiPropria: Boolean;
begin
  FEmpresaId := EmpresaId;
  FCMunEmitente := Input.CMunEmitente;
  FAuditor := Auditor;

  ComboBoxOpInternasFrame1.Setup(TSetupComboBoxOpInternasFrame.Create(
    Input.OpInternaId.Value, False, False
  ));

  ApiPropria := (Input.LayoutNFSe = lytPrefeitura) or Input.WebService.ApiPropria;

  edLayoutNFSe.ItemIndex := Ord(Input.LayoutNFSe);
  edOpSimpNac.ItemIndex := Ord(Input.OpSimpNac);
  edRegApTribSN.ItemIndex := Ord(Input.RegApTribSN);
  //edRegEsTrib.ItemIndex := Input.RegEsTrib;
  edSerie.Text := Input.Serie;
  edWSFraseSecreta.Text := Input.WebService.WSFraseSecreta;
  edWSChaveAcesso.Text := Input.WebService.WSChaveAcesso;
  edWSSenha.Text := Input.WebService.WSSenha;

  ckEnviarInscricaoMunicipal.Checked := Input.EnviarInscricaoMunicipal;
  ckInibirValTrib.Checked := Input.InibirValTrib;
  ckPreferirAliqSNaoIbpt.Checked := Input.PreferirAliqSNaoIbpt;
  ckConvenioAtivo.Checked := Input.ConvenioSistemaNacionalAtivo;
  ckIncentivoCultural.Checked := Input.IncentivoCultural;
  ckAgruparPorCTribNac.Checked := Input.AgruparPorCTribNac;
  ckDiscriminacaoSimplificada.Checked := Input.OpcoesDiscriminacao.SemObsOS;
  ckDcomptIgualDataAtual.Checked := Input.OpcoesDiscriminacao.DComptIgualDataAtual;

  edLayoutNFSeChange(edLayoutNFSe);

  edComunicacaoSistema.ItemIndex := Ord(ApiPropria);

  S := DFeDLLAdapter.ListarRegimesEspeciaisTributacaoNFSe( FEmpresaId );
  if StartsText('ERROR', S) then
  begin
    UIUtils.ShowError(
      'Erro ao obter lista de regimes especiais de tributação' + sLineBreak +
      'Se souber o codigo do regime você pode digitar no campo que o sistema irá salvar sem problemas' + sLineBreak +
      'Caso contrário contacte o suporte técnico'
    );
    S := '';
    edRegEsTrib.Style := csSimple;
  end
  else
  begin
    if not StartsText('0', S) then
      S := '0 - Nenhum' + sLineBreak + S;
  end;

  edRegEsTrib.Items.Text := S;

  edRegEsTrib.ItemIndex := -1;
  for I := 0 to edRegEsTrib.Items.Count - 1 do
    if StartsText(IntToStr(Input.RegEsTrib) + ' -', edRegEsTrib.Items[I]) then
    begin
      edRegEsTrib.ItemIndex := I;
      Break;
    end;

  btDesativarModuloAntigo.Tag := 0;
  if Input.DataDesativacaoLegado.IsNull then
  begin
    btDesativarModuloAntigo.Caption := 'Definir módulo novo como Padrão para novas emissões de NFSe''s';
    lbInfoTransicao.Caption := 'Você ainda poderá usar o módulo antigo para emissões por mais 30 dias';
  end
  else
  begin
    btDesativarModuloAntigo.Visible := False;
    if Input.DataDesativacaoLegado.Value > Now then
      lbInfoTransicao.Caption := Format('Faltam %d dias para desativação do módulo antigo',
        [Trunc(Input.DataDesativacaoLegado.Value - Date)])
    else
      lbInfoTransicao.Caption := 'Data de desativação do módulo antigo: '
        + DateService.ParseLocal(Input.DataDesativacaoLegado.Value) ;
  end;

  if Input.WebService.WSChaveAcesso = 'DECRYPT_TOKEN_ERROR' then
    UIUtils.ShowError('Token inválido ou corrompido. É necessário informar o token novamente');
end;

procedure TFrmCadNFSeConfig.SpeedButton1Click(Sender: TObject);
var
  layout: LayoutNFSeEnum;
begin
  layout := LayoutNFSeEnum(edLayoutNFSe.ItemIndex);

  edComunicacaoSistema.Enabled := layout <> lytPrefeitura;
end;

end.
