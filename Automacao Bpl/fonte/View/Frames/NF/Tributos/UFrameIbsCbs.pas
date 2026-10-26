unit UFrameIbsCbs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, UFrameGrupoIbsCbs, ComCtrls, ExtCtrls,
  UFrameMonofasiaIbsCbs, uEditHw, UFrameCreditoPresumidoIbsCbs,
  TributoDFeIbsCbsEtdUnit, ClassificacaoTributariaEtdUnit, IUIFormValidatorUnit,
  Buttons, Menus, ComboboxEntityPickerFrameUnit, TipoRegraTributoDFeEnumUnit,   
  RegraFiscalIbsCbsEtdUnit, ComboBoxRegrasFiscaisFrameUnit;

type
  TFrameIbsCbsRegimeTributacao = (rtPadrao, rtMonofasia, rtTransferencia, rtAjusteCompetencia, rtNenhum); // Conforme Schema xsd

  TFrameIbsCbs = class(TFrame)
    edcClassTrib: TMaskEdit;
    Label2: TLabel;
    ckIndDoacao: TCheckBox;
    pageGrupos: TPageControl;
    tsGIbsCbs: TTabSheet;
    tsGMono: TTabSheet;
    tsGTransfCred: TTabSheet;
    pn1: TPanel;
    tsGAjusteCompet: TTabSheet;
    tsEstornoCred: TTabSheet;
    tsCreditoPresumido: TTabSheet;
    pn2: TPanel;
    lbPCbs: TLabel;
    lbVCbs: TLabel;
    edTransfCredVIbs: TEditHw;
    edTransfCredVCbs: TEditHw;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edAjusteCompetvIBS: TEditHw;
    edAjusteCompetvCbs: TEditHw;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edvIBSEstCred: TEditHw;
    edvCBSEstCred: TEditHw;
    Label7: TLabel;
    edcompetApur: TMaskEdit;
    FrameGrupoIbsCbs1: TFrameGrupoIbsCbs;
    FrameMonofasiaIbsCbs1: TFrameMonofasiaIbsCbs;
    FrameCreditoPresumidoIbsCbs1: TFrameCreditoPresumidoIbsCbs;
    PopupMenu1: TPopupMenu;
    btOptions: TSpeedButton; 
    btCalc: TSpeedButton;
    Label1: TLabel;
    edCst: TMaskEdit;
    pn1_2_1: TPanel;
    pn1_1: TPanel;
    pn1_2: TPanel;
    Splitter1: TSplitter;
    RegraFiscalAutomatica1: TMenuItem;
    RegraFiscalManual1: TMenuItem;
    RegraFiscalVazia1: TMenuItem;
    N1: TMenuItem;
    pnRegraCaption: TPanel;
    lbRegraFiscal: TLabel;
    Label9: TLabel;
    pnClassificacao: TPanel;
    lbFlags: TLabel;
    HabilitarRegimetributrio1: TMenuItem;
    RegimePadrao1: TMenuItem;
    RegimeMonofasia1: TMenuItem;
    RegimeTransferenciaDeCredito1: TMenuItem;
    RegimeAjusteCompetencia1: TMenuItem;
    RegimeNenhum1: TMenuItem;
    tsGNenhum: TTabSheet;
    Panel3: TPanel;
    MenuEstornoDeCredito1: TMenuItem;
    MenuCreditoPresumido1: TMenuItem;
    ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame;
    procedure MenuCreditoPresumido1Click(Sender: TObject);
    procedure MenuEstornoDeCredito1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RegimePadrao1Click(Sender: TObject);
    procedure RegraFiscalAutomatica1Click(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure btOptionsClick(Sender: TObject);
  private
    FFormValidator: IUIFormValidator;
    FTipoRegra: TipoRegraTributoDFeEnum;
    FTributoId: string;
    FRegraFiscalId: string;
    FRegimeTributacao: TFrameIbsCbsRegimeTributacao;
    FOperacaoDeMonofasia: Boolean; //**Pend** Isso precisa ser mudado vindo da classificacao talvez
    FOperacaoPadrao: Boolean;
    FOperacaoDeTransfCredito: Boolean;
    FOperacaoDeAjuste: Boolean;
    FOperacaoDeEstorno: Boolean;
    FOperacaoCreditoPresumido: Boolean;
    FReadOnly: Boolean;
    FCalculoCallBack: TNotifyEvent;

    procedure RegrasFiscaisFrameChange(Sender: TObject; RegraFiscal: RegraFiscalIbsCbsEtd);

    procedure VisualHandleRegraFiscal(AHandleFocus: Boolean);
    procedure VisualRegimeTributario();
  public
    constructor Create(AOwner: TComponent); override;

    procedure Reset();
    procedure Setup(Input: TributoDFeIbsCbsEtd); overload;
    procedure Setup(AReadOnly: Boolean); overload;
    //procedure Setup(Manual:  );
    function GetIbsCbs(): TributoDFeIbsCbsEtd;
    property CalculoCallBack: TNotifyEvent read FCalculoCallBack write FCalculoCallBack;
  end;

implementation

uses
  ContainerUnit,
  StrUtils,
  UIUtilsUnit,
  UIFormValidatorFactoryUnit,
  TributoDFeTransfCredIbsCbsEtdUnit,
  TributoDFeAjusteCompetIbsCbsEtdUnit,
  TributoDFeGrupoIbsCbsEtdUnit,
  TributoDFeMonofasiaIbsCbsEtdUnit,
  TributoDFeCredPresOpIbsCbsEtdUnit,
  TributoDFeCredPresZfmIbsCbsEtdUnit,
  StringNullableUnit,
  DateTimeServiceUnit,
  DoubleNullableUnit;

const
  TFrameIbsCbsRegimeTributacaoStr: array[TFrameIbsCbsRegimeTributacao] of string =
    ('Regime Padrão', 'Monofasia', 'Transferência de Crédito', 'Ajuste de Competência', 'Nenhum'); // Conforme Schema xsd

{$R *.dfm}

{ TIbsCbsFrame }

procedure TFrameIbsCbs.btCalcClick(Sender: TObject);
begin
  if Assigned(FCalculoCallBack) then
    FCalculoCallBack(Self);
end;

procedure TFrameIbsCbs.btOptionsClick(Sender: TObject);
begin
  PopupMenu1.Popup( Mouse.CursorPos.X, Mouse.CursorPos.Y );
end;

constructor TFrameIbsCbs.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder()
    .Bind(edCst)
    .Bind(edcClassTrib)
    .Bind('RegraFiscalId', ComboBoxRegrasFiscaisFrame1.edRegrasFiscais)
    .Validator();

  ComboBoxRegrasFiscaisFrame1.OnRegraFiscalChange := RegrasFiscaisFrameChange;
end;

function TFrameIbsCbs.GetIbsCbs: TributoDFeIbsCbsEtd;
var
  mono: TributoDFeMonofasiaIbsCbsEtd;
  tranfCred: TributoDFeTransfCredIbsCbsEtd;
  ajusteCompet: TributoDFeAjusteCompetIbsCbsEtd;
  credPresOp: TributoDFeCredPresOpIbsCbsEtd;
  credPresZFM: TributoDFeCredPresZfmIbsCbsEtd;
begin
  if Trim(edcClassTrib.Text) = '' then
  begin
    Result := nil;
    Exit;
  end;

  if not FOperacaoDeMonofasia  then
    mono := nil
  else
    mono := FrameMonofasiaIbsCbs1.GetMonofasia();

  if not FOperacaoDeTransfCredito then
    tranfCred := nil
  else
    tranfCred := TributoDFeTransfCredIbsCbsEtd.Create( FTributoId, edTransfCredVIbs.AsValue, edTransfCredVCbs.AsValue );

  if not FOperacaoDeAjuste then
    ajusteCompet := nil
  else
    ajusteCompet := TributoDFeAjusteCompetIbsCbsEtd.Create(
      FTributoId, edcompetApur.Text, edAjusteCompetvIBS.AsValue, edAjusteCompetvCbs.AsValue
    );

  if not FOperacaoCreditoPresumido then
  begin
    credPresOp := nil;
    credPresZFM := nil;
  end
  else
  begin
    credPresOp := FrameCreditoPresumidoIbsCbs1.GetCreditoPresumidoOperacao();
    credPresZFM := FrameCreditoPresumidoIbsCbs1.GetCreditoPresumidoZFM();
  end;

  Result := TributoDFeIbsCbsEtd.Create(
    FTributoId,
    StringNullable.CreateOrNull(IfThen( FTipoRegra <> tctNenhuma, FRegraFiscalId)),
    FTipoRegra,
    edCst.Text,
    edcClassTrib.Text,
    ckIndDoacao.Checked,
    DoubleNullable.Create( edvIBSEstCred.AsValue, not FOperacaoDeEstorno ),
    DoubleNullable.Create( edvCBSEstCred.AsValue, not FOperacaoDeEstorno ),
    FrameGrupoIbsCbs1.GetGrupoIbsCbs(),
    mono,
    tranfCred,
    ajusteCompet,
    FrameCreditoPresumidoIbsCbs1.GetCreditoPresumidoOperacao(),
    FrameCreditoPresumidoIbsCbs1.GetCreditoPresumidoZFM()
  );
end;

procedure TFrameIbsCbs.MenuCreditoPresumido1Click(Sender: TObject);
begin
  FOperacaoCreditoPresumido := not FOperacaoCreditoPresumido;

  VisualRegimeTributario();
end;

procedure TFrameIbsCbs.MenuEstornoDeCredito1Click(Sender: TObject);
begin
  FOperacaoDeEstorno := not FOperacaoDeEstorno;

  VisualRegimeTributario();
end;

procedure TFrameIbsCbs.PopupMenu1Popup(Sender: TObject);
begin
  RegimePadrao1.Checked := FRegimeTributacao = rtPadrao;
  RegimeMonofasia1.Checked := FRegimeTributacao = rtMonofasia;
  RegimeTransferenciaDeCredito1.Checked := FRegimeTributacao = rtTransferencia;
  RegimeAjusteCompetencia1.Checked := FRegimeTributacao = rtAjusteCompetencia;
  RegimeNenhum1.Checked := FRegimeTributacao = rtNenhum;
  MenuEstornoDeCredito1.Checked := FOperacaoDeEstorno;
  MenuCreditoPresumido1.Checked := FOperacaoCreditoPresumido;
end;

procedure TFrameIbsCbs.RegimePadrao1Click(Sender: TObject);
begin                                                              
  if not (Sender is TMenuItem) then
    Exit;

  FRegimeTributacao := TFrameIbsCbsRegimeTributacao((Sender as TMenuItem).Tag);

  VisualRegimeTributario();
end;

procedure TFrameIbsCbs.RegraFiscalAutomatica1Click(Sender: TObject);
begin
  if not (Sender is TMenuItem) then
    Exit;

  FTipoRegra := TipoRegraTributoDFeEnum((Sender as TMenuItem).Tag);

  VisualHandleRegraFiscal(True);

  if FTipoRegra = tctManual then
    if ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.CanFocus() then
      ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.SetFocus()
end;

procedure TFrameIbsCbs.RegrasFiscaisFrameChange(Sender: TObject;
  RegraFiscal: RegraFiscalIbsCbsEtd);
begin
  if Sender = ComboBoxRegrasFiscaisFrame1 then
  begin
    if RegraFiscal = nil then
      FRegraFiscalId := ''
    else
    begin
      FRegraFiscalId := RegraFiscal.Id;

      if FTipoRegra <> tctNenhuma then
      begin
        edCst.Text := Copy(RegraFiscal.CClassTrib, 1, 3);
        edcClassTrib.Text := RegraFiscal.CClassTrib;
      end;
    end;
  end;
end;

procedure TFrameIbsCbs.Reset;
begin
  pageGrupos.ActivePage := tsGIbsCbs;
end;

procedure TFrameIbsCbs.Setup(AReadOnly: Boolean);
begin
  FReadOnly := AReadOnly;
  btOptions.Enabled := not FReadOnly;
  btCalc.Enabled := not FReadOnly;
  pn1_2_1.Enabled := not FReadOnly;
  tsEstornoCred.Enabled := not FReadOnly;
  tsCreditoPresumido.Enabled := not FReadOnly;
end;

procedure TFrameIbsCbs.Setup(Input: TributoDFeIbsCbsEtd);
begin
  if Input = nil then
    FRegraFiscalId := ''
  else
    FRegraFiscalId := Input.RegraFiscalId.Value;

  ComboBoxRegrasFiscaisFrame1.Setup( FRegraFiscalId );

  if Input = nil then
  begin
    FTributoId := '';
    FTipoRegra := tctAutomatica; //**Pend** Ainda falta definir como isso será aplicado, se vai ser com base na naturaza E/S
    edCst.Text := '';
    edcClassTrib.Text := '';
    ckIndDoacao.State := cbGrayed;

    FOperacaoPadrao := False;
    FOperacaoDeAjuste := False;
    FOperacaoDeEstorno := False;
    FOperacaoDeMonofasia := False;
    FOperacaoDeTransfCredito := False;
    FOperacaoCreditoPresumido := False;

    FrameGrupoIbsCbs1.Setup( nil );

    FrameMonofasiaIbsCbs1.Setup( nil );

    {$REGION 'Transferencia de Credito'}

    edTransfCredVIbs.Clear;
    edTransfCredVCbs.Clear;

    {$ENDREGION}

    {$REGION 'Ajuste de Competência'}

    edcompetApur.Clear;
    edAjusteCompetvIBS.Clear;
    edAjusteCompetvCbs.Clear;

    {$ENDREGION}

    {$REGION 'Estorno de Credito'}

    edvIBSEstCred.Clear;
    edvCBSEstCred.Clear;

    {$ENDREGION}

    FrameCreditoPresumidoIbsCbs1.Setup( FTributoId, nil, nil );

    VisualHandleRegraFiscal(False);

    Exit;
  end;

  FTributoId := Input.Id;
  FTipoRegra := Input.TipoRegra;
  edCst.Text := Input.Cst;
  edcClassTrib.Text := Input.CClasstrib;
  ckIndDoacao.Checked := Input.Inddoacao;

  FOperacaoPadrao := Input.GIbsCbs <> nil;
  FOperacaoDeAjuste := Input.AjusteCompet <> nil;
  FOperacaoDeEstorno := not Input.VIbsEstCred.IsNull;
  FOperacaoDeMonofasia := Input.Monofasia <> nil;
  FOperacaoDeTransfCredito := Input.TransfCred <> nil;
  FOperacaoCreditoPresumido := (Input.CredPresOp <> nil) and (Input.CredPresZFM <> nil);

  FrameGrupoIbsCbs1.Setup( Input.GIbsCbs );

  FrameMonofasiaIbsCbs1.Setup( Input.Monofasia );

  {$REGION 'Transferencia de Credito'}

  if Input.TransfCred = nil then
  begin
    edTransfCredVIbs.Clear;
    edTransfCredVCbs.Clear;
  end
  else
  begin
    edTransfCredVIbs.AsValue := Input.TransfCred.Vibs;
    edTransfCredVCbs.AsValue := Input.TransfCred.Vcbs;
  end;

  {$ENDREGION}

  {$REGION 'Ajuste de Competência'}

  if Input.AjusteCompet = nil then
  begin
    edcompetApur.Clear;
    edAjusteCompetvIBS.Clear;
    edAjusteCompetvCbs.Clear;
  end
  else
  begin
    edcompetApur.Text := Input.AjusteCompet.Competapur;
    edAjusteCompetvIBS.AsValue := Input.AjusteCompet.Vibs;
    edAjusteCompetvCbs.AsValue := Input.AjusteCompet.Vcbs;
  end;

  {$ENDREGION}

  {$REGION 'Estorno de Credito'}

  if Input.VIbsEstCred.IsNull and Input.VCbsEstCred.IsNull then
  begin
    edvIBSEstCred.Clear;
    edvCBSEstCred.Clear;
  end
  else
  begin
    edvIBSEstCred.AsValue := Input.VIbsEstCred.Value;
    edvCBSEstCred.AsValue := Input.VCbsEstCred.Value;
  end;

  {$ENDREGION}

  FrameCreditoPresumidoIbsCbs1.Setup( FTributoId, Input.CredPresOp, Input.CredPresZFM );

  VisualHandleRegraFiscal(False);
end;

procedure TFrameIbsCbs.VisualHandleRegraFiscal(AHandleFocus: Boolean);
begin
  RegraFiscalAutomatica1.Visible := FTipoRegra <> tctAutomatica;
  RegraFiscalManual1.Visible := FTipoRegra <> tctManual;
  RegraFiscalVazia1.Visible := FTipoRegra <> tctNenhuma;
  btCalc.Enabled := not FReadOnly and ( FTipoRegra <> tctNenhuma );

  HabilitarRegimetributrio1.Enabled := FTipoRegra = tctNenhuma;

  pnClassificacao.Enabled := FTipoRegra = tctNenhuma;
  if pnClassificacao.Enabled then
    pnClassificacao.ParentFont := True
  else
    pnClassificacao.Font.Color := clGrayText;

  case FTipoRegra of
    tctAutomatica:
      begin
        lbRegraFiscal.Caption := '*Automática*';
        lbRegraFiscal.Font.Color := clNavy;

        if AHandleFocus then
          if  UIUtils.SafeActiveControl(Self) = ComboBoxRegrasFiscaisFrame1.edRegrasFiscais then
            pageGrupos.SetFocus();

        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.Enabled := False;
      end;

    tctManual:
      begin
        lbRegraFiscal.Caption := '**Manual**';
        lbRegraFiscal.Font.Color := clMaroon;

        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.Enabled := not FReadOnly;
        if AHandleFocus and ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.CanFocus() then
          ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.SetFocus();
      end;

    tctNenhuma:
      begin
        lbRegraFiscal.Caption := '***Vazia***';
        lbRegraFiscal.Font.Color := clRed;

        if AHandleFocus then                         
          if (UIUtils.SafeActiveControl(Self) = ComboBoxRegrasFiscaisFrame1.edRegrasFiscais) and edCst.CanFocus() then
            edCst.SetFocus();

        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.Enabled := False;
        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.ItemIndex := -1;        
      end;
  end;

  VisualRegimeTributario();
end;

procedure TFrameIbsCbs.VisualRegimeTributario;
var
  regra: RegraFiscalIbsCbsEtd;
begin
  lbFlags.Caption := TFrameIbsCbsRegimeTributacaoStr[FRegimeTributacao];

  case FRegimeTributacao of
    rtPadrao:
      pageGrupos.ActivePage := tsGIbsCbs;

    rtMonofasia:
      pageGrupos.ActivePage := tsGMono;

    rtTransferencia:
      pageGrupos.ActivePage := tsGTransfCred;

    rtAjusteCompetencia:
      pageGrupos.ActivePage := tsGAjusteCompet;

    rtNenhum:
      pageGrupos.ActivePage := tsGNenhum;
  end;

  tsGIbsCbs.TabVisible := FRegimeTributacao = rtPadrao;
  tsGMono.TabVisible := FRegimeTributacao = rtMonofasia;
  tsGTransfCred.TabVisible := FRegimeTributacao = rtTransferencia;
  tsGAjusteCompet.TabVisible := FRegimeTributacao = rtAjusteCompetencia;
  tsGNenhum.TabVisible := FRegimeTributacao = rtNenhum;

  tsEstornoCred.TabVisible := FOperacaoDeEstorno;
  tsCreditoPresumido.TabVisible := FOperacaoCreditoPresumido;

  regra := ComboBoxRegrasFiscaisFrame1.GetRegraFiscal();
  try
    FrameGrupoIbsCbs1.Setup( regra, not FReadOnly and (FTipoRegra = tctNenhuma) );
  finally
    regra.Free();
  end;
//  Habilitar estorno e credito presumido por enquanto, depois na proxima versao adiciona o tratamento, ou ve o que da pra fazer no tratametno agora

//  lbFlags.Caption := Format('Padrao[%s] - Monofasia [%s] - Transf Crédito [%s] - Ajuste de Competência [%s]', []);
                                                                        
end;

end.

