unit NFSeTributosDFeFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ComboBoxRegrasFiscaisFrameUnit, ExtCtrls, ComCtrls, TribDFeIbsCbsGrupoFrameUnit,
  Menus, IUIFormValidatorUnit, TipoRegraTributoDFeEnumUnit, RegraFiscalIbsCbsEtdUnit, TributoDFeIbsCbsEtdUnit, uEditHw;

type
  TNFSeTributosDFeFrame = class(TFrame)
    pageGrupos: TPageControl;
    tsGIbsCbs: TTabSheet;
    tsCreditoPresumido: TTabSheet;
    pn1: TPanel;
    Splitter1: TSplitter;
    pn1_1: TPanel;
    lbRegr: TLabel;
    ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame;
    pn1_2_1: TPanel;
    btOptions: TSpeedButton;
    btCalc: TSpeedButton;
    pnClassificacao: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edCst: TMaskEdit;
    edcClassTrib: TMaskEdit;
    TribDFeIbsCbsGrupoFrame1: TTribDFeIbsCbsGrupoFrame;
    PopupMenu1: TPopupMenu;
    RegraFiscalAutomatica1: TMenuItem;
    RegraFiscalManual1: TMenuItem;
    RegraFiscalVazia1: TMenuItem;
    N1: TMenuItem;
    RegimePadrao1: TMenuItem;
    MenuCreditoPresumido1: TMenuItem;
    pnCredOper: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edvBCCredPres: TEditHw;
    edcCredPres: TComboBox;
    pnCredPresIbs: TPanel;
    Label8: TLabel;
    edpCredPresIbs: TEditHw;
    edvCredPresIbs: TEditHw;
    Panel2: TPanel;
    Label11: TLabel;
    edpCredPresCbs: TEditHw;
    edvCredPresCbs: TEditHw;
    Label5: TLabel;
    Label6: TLabel;
    procedure RegimePadrao1Click(Sender: TObject);
    procedure MenuCreditoPresumido1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RegraFiscalAutomatica1Click(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure btOptionsClick(Sender: TObject);
  private
    FFormValidator: IUIFormValidator;
    FTipoRegra: TipoRegraTributoDFeEnum;
    FTributoId: string;
    FRegraFiscalId: string;
    FOperacaoPadrao: Boolean;
    FOperacaoCreditoPresumido: Boolean;
    FReadOnly: Boolean;
    FCalculoCallBack: TNotifyEvent;
    function GetValorCbs: Currency;
    function GetValorCbsMono: Currency;
    function GetValorIbs: Currency;
    function GetValorIbsMono: Currency;
    function GetValorIS: Currency;

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
    property ValorIS: Currency read GetValorIS;
    property ValorIbs: Currency read GetValorIbs;
    property ValorCbs: Currency read GetValorCbs;
    property ValorIbsMono: Currency read GetValorIbsMono;
    property ValorCbsMono: Currency read GetValorCbsMono;
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

{$R *.dfm}

{ TNFSeTributosDFeFrame }

procedure TNFSeTributosDFeFrame.btCalcClick(Sender: TObject);
begin
  if Assigned(FCalculoCallBack) then
    FCalculoCallBack(Self);
end;

procedure TNFSeTributosDFeFrame.btOptionsClick(Sender: TObject);
begin
  PopupMenu1.Popup( Mouse.CursorPos.X, Mouse.CursorPos.Y );
end;

constructor TNFSeTributosDFeFrame.Create(AOwner: TComponent);
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

function TNFSeTributosDFeFrame.GetIbsCbs: TributoDFeIbsCbsEtd;
var
  credPresOp: TributoDFeCredPresOpIbsCbsEtd;
  ibscbs: TributoDFeGrupoIbsCbsEtd;
begin
  if Trim(edcClassTrib.Text) = '' then
  begin
    Result := nil;
    Exit;
  end;

  if not FOperacaoCreditoPresumido then
    credPresOp := nil
  else
    credPresOp := TributoDFeCredPresOpIbsCbsEtd.Create(
      '',
      edvBCCredPres.AsCurrency,
      Copy(edcCredPres.Text, 1, 2),
      DoubleNullable.Create(edpCredPresIbs.AsCurrency, edpCredPresIbs.IsNull and edvCredPresIbs.IsNull),
      DoubleNullable.Create(edvCredPresIbs.AsCurrency, edpCredPresIbs.IsNull and edvCredPresIbs.IsNull),
      DoubleNullable.NullInstance(),
      DoubleNullable.Create(edpCredPresCbs.AsCurrency, edpCredPresCbs.IsNull and edvCredPresCbs.IsNull),
      DoubleNullable.Create(edvCredPresCbs.AsCurrency, edpCredPresCbs.IsNull and edvCredPresCbs.IsNull),
      DoubleNullable.NullInstance()
    );

  Result := TributoDFeIbsCbsEtd.Create(
    FTributoId,
    StringNullable.CreateOrNull(IfThen( FTipoRegra <> tctNenhuma, FRegraFiscalId)),
    FTipoRegra,
    edCst.Text,
    edcClassTrib.Text,
    False,
    DoubleNullable.NullInstance(),
    DoubleNullable.NullInstance(),
    TribDFeIbsCbsGrupoFrame1.GetGrupoIbsCbs(),
    nil,
    nil,
    nil,
    credPresOp,
    nil
  );
end;

function TNFSeTributosDFeFrame.GetValorCbs: Currency;
begin
  Result := TribDFeIbsCbsGrupoFrame1.ValorCbs;  
end;

function TNFSeTributosDFeFrame.GetValorCbsMono: Currency;
begin
  Result := 0.0;
end;

function TNFSeTributosDFeFrame.GetValorIbs: Currency;
begin
  Result := TribDFeIbsCbsGrupoFrame1.ValorIbs;
end;

function TNFSeTributosDFeFrame.GetValorIbsMono: Currency;
begin
  Result := 0.0;
end;

function TNFSeTributosDFeFrame.GetValorIS: Currency;
begin
  Result := 0.0;
end;

procedure TNFSeTributosDFeFrame.MenuCreditoPresumido1Click(Sender: TObject);
begin
  FOperacaoCreditoPresumido := not FOperacaoCreditoPresumido;

  VisualRegimeTributario();
end;

procedure TNFSeTributosDFeFrame.PopupMenu1Popup(Sender: TObject);
begin
  RegimePadrao1.Checked := FOperacaoPadrao;
  MenuCreditoPresumido1.Checked := FOperacaoCreditoPresumido;
end;

procedure TNFSeTributosDFeFrame.RegimePadrao1Click(Sender: TObject);
begin
  FOperacaoPadrao := not FOperacaoPadrao;

  VisualRegimeTributario();
end;

procedure TNFSeTributosDFeFrame.RegraFiscalAutomatica1Click(Sender: TObject);
begin
  if not (Sender is TMenuItem) then
    Exit;

  FTipoRegra := TipoRegraTributoDFeEnum((Sender as TMenuItem).Tag);

  VisualHandleRegraFiscal(True);

  if FTipoRegra = tctManual then
    if ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.CanFocus() then
      ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.SetFocus()
end;

procedure TNFSeTributosDFeFrame.RegrasFiscaisFrameChange(Sender: TObject;
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

procedure TNFSeTributosDFeFrame.Reset;
begin
  pageGrupos.ActivePage := tsGIbsCbs;
end;

procedure TNFSeTributosDFeFrame.Setup(AReadOnly: Boolean);
begin
  FReadOnly := AReadOnly;
  btOptions.Enabled := not FReadOnly;
  btCalc.Enabled := not FReadOnly;
  pn1_2_1.Enabled := not FReadOnly;//???
  tsCreditoPresumido.Enabled := not FReadOnly;
end;

procedure TNFSeTributosDFeFrame.Setup(Input: TributoDFeIbsCbsEtd);
begin
  if Input = nil then
    FRegraFiscalId := ''
  else
    FRegraFiscalId := Input.RegraFiscalId.Value;

  ComboBoxRegrasFiscaisFrame1.Setup( TComboBoxRegrasFiscaisFrameSetup.Create( FRegraFiscalId, False, False ));

  if Input = nil then
  begin
    FTributoId := '';
    FTipoRegra := tctAutomatica; //**Pend** Ainda falta definir como isso será aplicado, se vai ser com base na naturaza E/S
    edCst.Text := '';
    edcClassTrib.Text := '';

    FOperacaoPadrao := False;
    FOperacaoCreditoPresumido := False;

    TribDFeIbsCbsGrupoFrame1.Setup( nil );

    edcCredPres.ItemIndex := -1;
    edvBCCredPres.Clear();
    edpCredPresIbs.Clear();
    edvCredPresIbs.Clear();
    edpCredPresCbs.Clear();
    edvCredPresCbs.Clear();

    VisualHandleRegraFiscal(False);

    Exit;
  end;

  FTributoId := Input.Id;
  FTipoRegra := Input.TipoRegra;
  edCst.Text := Input.Cst;
  edcClassTrib.Text := Input.CClasstrib;

  FOperacaoPadrao := Input.GIbsCbs <> nil;
  FOperacaoCreditoPresumido := Input.CredPresOp <> nil;

  TribDFeIbsCbsGrupoFrame1.Setup( Input.GIbsCbs );

  if Input.CredPresOp <> nil then
  begin
    edcCredPres.ItemIndex := -1; //**Pend**

    edvBCCredPres.AsValue := Input.CredPresOp.Vbccredpres;
    edpCredPresIbs.UpdateValue( Input.CredPresOp.IbsPcredpres.Value, Input.CredPresOp.IbsPcredpres.IsNull );
    edvCredPresIbs.UpdateValue( Input.CredPresOp.IbsVcredpres.Value, Input.CredPresOp.IbsVcredpres.IsNull );
    edpCredPresCbs.UpdateValue( Input.CredPresOp.CbsPcredpres.Value, Input.CredPresOp.CbsPcredpres.IsNull );
    edvCredPresCbs.UpdateValue( Input.CredPresOp.CbsVcredpres.Value, Input.CredPresOp.CbsVcredpres.IsNull );
  end;

  VisualHandleRegraFiscal(False);
end;

procedure TNFSeTributosDFeFrame.VisualHandleRegraFiscal(AHandleFocus: Boolean);
begin

  RegraFiscalAutomatica1.Visible := FTipoRegra <> tctAutomatica;
  RegraFiscalManual1.Visible := FTipoRegra <> tctManual;
  RegraFiscalVazia1.Visible := FTipoRegra <> tctNenhuma;
  btCalc.Enabled := not FReadOnly and ( FTipoRegra <> tctNenhuma );

  pnClassificacao.Enabled := FTipoRegra = tctNenhuma;
  if pnClassificacao.Enabled then
    pnClassificacao.ParentFont := True
  else
    pnClassificacao.Font.Color := clGrayText;

  case FTipoRegra of
    tctAutomatica:
      begin
        lbRegr.Caption := 'Regra Fiscal';
        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.Color := clBtnFace;

        //lbRegraFiscal.Caption := '*Automática*';
        //lbRegraFiscal.Font.Color := clNavy;

        if AHandleFocus then
          if  UIUtils.SafeActiveControl(Self) = ComboBoxRegrasFiscaisFrame1.edRegrasFiscais then
            pageGrupos.SetFocus();

        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.Enabled := False;
      end;

    tctManual:
      begin
        //lbRegraFiscal.Caption := '**Manual**';
        //lbRegraFiscal.Font.Color := clMaroon;
        lbRegr.Caption := 'Regra Fiscal*';
        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.Color := clWindow;

        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.Enabled := not FReadOnly;
        if AHandleFocus and ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.CanFocus() then
          ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.SetFocus();
      end;

    tctNenhuma:
      begin
        lbRegr.Caption := 'Sem Regra Fiscal';
        //lbRegraFiscal.Caption := '***Vazia***';
        //lbRegraFiscal.Font.Color := clRed;

        if AHandleFocus then                         
          if (UIUtils.SafeActiveControl(Self) = ComboBoxRegrasFiscaisFrame1.edRegrasFiscais) and edCst.CanFocus() then
            edCst.SetFocus();

        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.Enabled := False;
        ComboBoxRegrasFiscaisFrame1.edRegrasFiscais.ItemIndex := -1;        
      end;
  end;

  VisualRegimeTributario();
end;

procedure TNFSeTributosDFeFrame.VisualRegimeTributario;
var
  regra: RegraFiscalIbsCbsEtd;
begin
  tsGIbsCbs.TabVisible := FOperacaoPadrao;
  tsCreditoPresumido.TabVisible := FOperacaoCreditoPresumido;

  regra := ComboBoxRegrasFiscaisFrame1.GetRegraFiscal();
  try
    TribDFeIbsCbsGrupoFrame1.Setup( regra, not FReadOnly and (FTipoRegra = tctNenhuma) );
  finally
    regra.Free();
  end;
//  Habilitar estorno e credito presumido por enquanto, depois na proxima versao adiciona o tratamento, ou ve o que da pra fazer no tratametno agora

//  lbFlags.Caption := Format('Padrao[%s] - Monofasia [%s] - Transf Crédito [%s] - Ajuste de Competência [%s]', []);
                                                                        
end;

end.

