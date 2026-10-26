unit TribDFeIbsCbsGrupoFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TribDFeIbsCbsGrupoValoresFrameUnit, StdCtrls, uEditHw, ExtCtrls, TribDFeIbsCbsGrupoTribRegularFrameUnit,
  TribDFeIbsCbsGrupoCompraGovFrameUnit, TributoDFeGrupoIbsCbsEtdUnit, RegraFiscalIbsCbsEtdUnit, ComCtrls;

type
  TTribDFeIbsCbsGrupoFrame = class(TFrame)
    pnBase: TPanel;
    Label1: TLabel;
    edVBC: TEditHw;
    Panel3: TPanel;
    FrameGrupoIbsUF: TTribDFeIbsCbsGrupoValoresFrame;
    Panel4: TPanel;
    FrameGrupoIbsMun: TTribDFeIbsCbsGrupoValoresFrame;
    Panel5: TPanel;
    FrameGrupoCBS: TTribDFeIbsCbsGrupoValoresFrame;
    pnTribRegular: TPanel;
    pn_0: TPanel;
    lbTributacaoRegular: TLabel;
    ckTributacaoRegular: TCheckBox;
    FrameGrupoIbsCbsTribRegular1: TTribDFeIbsCbsGrupoTribRegularFrame;
    pnCompraGovIt: TPanel;
    Panel6: TPanel;
    lbCompraGovernamentalItem: TLabel;
    ckCompraGovernamentalItem: TCheckBox;
    FrameGrupoIbsCbsCompraGovItem1: TTribDFeIbsCbsGrupoCompraGovFrame;
    PageControl1: TPageControl;
    tabIbsCbs: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure ckCompraGovernamentalItemClick(Sender: TObject);
    procedure ckTributacaoRegularClick(Sender: TObject);
  private
    FTributoId: string;
    FPreenchimentoLivre: Boolean;
    function GetValorCbs: Currency;
    function GetValorIbs: Currency;
  public
    procedure Setup(Input: TributoDFeGrupoIbsCbsEtd); overload;
    procedure Setup( RegraFiscal: RegraFiscalIbsCbsEtd; PreenchimentoLivre: Boolean ); overload;

    function GetGrupoIbsCbs(): TributoDFeGrupoIbsCbsEtd;

    property ValorIbs: Currency read GetValorIbs;
    property ValorCbs: Currency read GetValorCbs;
  end;

implementation

uses
  DiferimentoModelUnit,
  ReducaoAliquotaModelUnit,
  DevolucaoTributosModelUnit,
  TributoDFeIbsCbsTribRegEtdUnit,
  TributoDFeIbsCbsCompraGovEtdUnit,
  DoubleNullableUnit;

{$R *.dfm}

{ TTribDFeIbsCbsGrupoFrame }

procedure TTribDFeIbsCbsGrupoFrame.ckCompraGovernamentalItemClick(Sender: TObject);
begin
  FrameGrupoIbsCbsCompraGovItem1.Enabled := FPreenchimentoLivre and ckCompraGovernamentalItem.Checked;
  if FrameGrupoIbsCbsCompraGovItem1.Enabled then
    FrameGrupoIbsCbsCompraGovItem1.ParentFont := True
  else
    FrameGrupoIbsCbsCompraGovItem1.Font.Color := clGrayText;
end;

procedure TTribDFeIbsCbsGrupoFrame.ckTributacaoRegularClick(Sender: TObject);
begin
  FrameGrupoIbsCbsTribRegular1.Enabled := FPreenchimentoLivre and ckTributacaoRegular.Checked;
  if FrameGrupoIbsCbsTribRegular1.Enabled then
    FrameGrupoIbsCbsTribRegular1.ParentFont := True
  else
    FrameGrupoIbsCbsTribRegular1.Font.Color := clGrayText;
end;

function TTribDFeIbsCbsGrupoFrame.GetGrupoIbsCbs: TributoDFeGrupoIbsCbsEtd;
var
  tribIbsUF, tribIbsMun, tribCbs: TributoDFeIbsCbsInput;
  tribRegular: TributoDFeIbsCbsTribRegEtd;
  tribCmpGov: TributoDFeIbsCbsCompraGovEtd;
begin
  tribCbs := FrameGrupoCBS.GetTributo();
  tribIbsUF := FrameGrupoIbsUF.GetTributo();
  tribIbsMun := FrameGrupoIbsMun.GetTributo();
  try

    if FPreenchimentoLivre and not ckTributacaoRegular.Checked then
      tribRegular := nil
    else
      tribRegular := FrameGrupoIbsCbsTribRegular1.GetTribRegular();

    if FPreenchimentoLivre and not ckCompraGovernamentalItem.Checked then
      tribCmpGov := nil
    else
      tribCmpGov := FrameGrupoIbsCbsCompraGovItem1.GetCompraGov();

    Result := TributoDFeGrupoIbsCbsEtd.Create(
      FTributoId,
      edVBC.AsValue,
      tribIbsUF.Aliquota,
      DoubleNullable.Create(tribIbsUF.GDif.PDif, tribIbsUF.GDif.IsNull()),
      DoubleNullable.Create(tribIbsUF.GDif.VDif, tribIbsUF.GDif.IsNull()),
      DoubleNullable.Create(tribIbsUF.GDevTrib.VDevTrib, tribIbsUF.GDevTrib.IsNull()),
      DoubleNullable.Create(tribIbsUF.GRed.PRedAliq, tribIbsUF.GRed.IsNull()),
      DoubleNullable.Create(tribIbsUF.GRed.PAliqEfet, tribIbsUF.GRed.IsNull()),
      tribIbsUF.ValorImposto,
      tribIbsMun.Aliquota,
      DoubleNullable.Create(tribIbsMun.GDif.PDif, tribIbsMun.GDif.IsNull()),
      DoubleNullable.Create(tribIbsMun.GDif.VDif, tribIbsMun.GDif.IsNull()),
      DoubleNullable.Create(tribIbsMun.GDevTrib.VDevTrib, tribIbsMun.GDevTrib.IsNull()),
      DoubleNullable.Create(tribIbsMun.GRed.PRedAliq, tribIbsMun.GRed.IsNull()),
      DoubleNullable.Create(tribIbsMun.GRed.PAliqEfet, tribIbsMun.GRed.IsNull()),
      tribIbsMun.ValorImposto,
      (tribIbsUF.ValorImposto + tribIbsMun.ValorImposto),
      tribCbs.Aliquota,
      DoubleNullable.Create(tribCbs.GDif.PDif, tribCbs.GDif.IsNull()),
      DoubleNullable.Create(tribCbs.GDif.VDif, tribCbs.GDif.IsNull()),
      DoubleNullable.Create(tribCbs.GDevTrib.VDevTrib, tribCbs.GDevTrib.IsNull()),
      DoubleNullable.Create(tribCbs.GRed.PRedAliq, tribCbs.GRed.IsNull()),
      DoubleNullable.Create(tribCbs.GRed.PAliqEfet, tribCbs.GRed.IsNull()),
      tribCbs.ValorImposto,
      tribRegular,
      tribCmpGov
    );

  finally
    tribIbsUF.Free();
    tribIbsMun.Free();
    tribCbs.Free();
  end;
end;

function TTribDFeIbsCbsGrupoFrame.GetValorCbs: Currency;
begin
  Result := FrameGrupoCBS.edVtrib.AsCurrency;
end;

function TTribDFeIbsCbsGrupoFrame.GetValorIbs: Currency;
begin
  Result := FrameGrupoIbsUF.edVtrib.AsCurrency
    + FrameGrupoIbsMun.edVtrib.AsCurrency;
end;

procedure TTribDFeIbsCbsGrupoFrame.Setup(Input: TributoDFeGrupoIbsCbsEtd);
var
  GDif: DiferimentoModel;
  GRed: ReducaoAliquotaModel;
  GDev: DevolucaoTributosModel;
  Trib: TributoDFeIbsCbsInput;
begin
  FrameGrupoCBS.Setup( 'CBS' );
  FrameGrupoIbsUF.Setup( 'IBS UF' );
  FrameGrupoIbsMun.Setup( 'IBS Mun' );

  if Input = nil then
  begin
    FTributoId := '';
    edVBC.Clear;

    FrameGrupoCBS.Setup( nil );
    FrameGrupoIbsUF.Setup( nil );
    FrameGrupoIbsMun.Setup( nil );
    FrameGrupoIbsCbsTribRegular1.Setup( nil );
    FrameGrupoIbsCbsCompraGovItem1.Setup( nil );

    ckTributacaoRegular.Checked := False;
    ckCompraGovernamentalItem.Checked := False;
  end
  else
  begin
    FTributoId := Input.Id;
    edVBC.AsValue := Input.VBc;

    {$REGION 'CBS'}

    if Input.CbsPdif.IsNull then
      GDif := DiferimentoModel.NullInstance()
    else
      GDif := DiferimentoModel.Create( Input.CbsPdif.Value, Input.CbsVdif.Value );

    if Input.CbsVDevTrib.IsNull then
      GDev := DevolucaoTributosModel.NullInstance()
    else
      GDev := DevolucaoTributosModel.Create( Input.CbsVDevTrib.Value );

    if Input.CbsPredAliq.IsNull then
      GRed := ReducaoAliquotaModel.NullInstance()
    else
      GRed := ReducaoAliquotaModel.Create( Input.CbsPredAliq.Value, Input.CbsAliqEfet.Value );

    Trib := TributoDFeIbsCbsInput.Create( Input.PCbs, GDif, GDev, GRed, Input.VCbs, '' );
    try
      FrameGrupoCBS.Setup( Trib );
    finally
      Trib.Free();
    end;

    {$ENDREGION}

    {$REGION 'Ibs UF'}

    if Input.IbsUfPdif.IsNull then
      GDif := DiferimentoModel.NullInstance()
    else
      GDif := DiferimentoModel.Create( Input.IbsUfPdif.Value, Input.IbsUfVdif.Value );

    if Input.IbsUfVDevTrib.IsNull then
      GDev := DevolucaoTributosModel.NullInstance()
    else
      GDev := DevolucaoTributosModel.Create( Input.IbsUfVDevTrib.Value );

    if Input.IbsUfPredAliq.IsNull then
      GRed := ReducaoAliquotaModel.NullInstance()
    else
      GRed := ReducaoAliquotaModel.Create( Input.IbsUfPredAliq.Value, Input.IbsUfAliqEfet.Value );

    Trib := TributoDFeIbsCbsInput.Create( Input.PIbsUf, GDif, GDev, GRed, Input.VIbsUf, '' );
    try
      FrameGrupoIbsUF.Setup( Trib );
    finally
      Trib.Free();
    end;

    {$ENDREGION}

    {$REGION 'Ibs Municipio'}

    if Input.IbsMunPdif.IsNull then
      GDif := DiferimentoModel.NullInstance()
    else
      GDif := DiferimentoModel.Create( Input.IbsMunPdif.Value, Input.IbsMunVdif.Value );

    if Input.IbsMunVDevTrib.IsNull then
      GDev := DevolucaoTributosModel.NullInstance()
    else
      GDev := DevolucaoTributosModel.Create( Input.IbsMunVDevTrib.Value );

    if Input.IbsMunPredAliq.IsNull then
      GRed := ReducaoAliquotaModel.NullInstance()
    else
      GRed := ReducaoAliquotaModel.Create( Input.IbsMunPredAliq.Value, Input.IbsMunAliqEfet.Value );

    Trib := TributoDFeIbsCbsInput.Create( Input.PIbsMun, GDif, GDev, GRed, Input.VIbsMun, '' );
    try
      FrameGrupoIbsMun.Setup( Trib );
    finally
      Trib.Free();
    end;

    {$ENDREGION}

    FrameGrupoIbsCbsTribRegular1.Setup( Input.TribRegular );
    FrameGrupoIbsCbsCompraGovItem1.Setup( Input.CompraGov );

    ckTributacaoRegular.Checked := Input.TribRegular <> nil;
    ckCompraGovernamentalItem.Checked := Input.CompraGov <> nil;
  end;

end;

procedure TTribDFeIbsCbsGrupoFrame.Setup(RegraFiscal: RegraFiscalIbsCbsEtd;
  PreenchimentoLivre: Boolean);
begin
  FPreenchimentoLivre := PreenchimentoLivre;

  pnBase.Enabled := FPreenchimentoLivre;
  if pnBase.Enabled then
    pnBase.ParentFont := True
  else
    pnBase.Font.Color := clGrayText;

  FrameGrupoCBS.Setup( FPreenchimentoLivre );
  FrameGrupoIbsUF.Setup( FPreenchimentoLivre );
  FrameGrupoIbsMun.Setup( FPreenchimentoLivre );

  ckTributacaoRegular.Visible := FPreenchimentoLivre;
  lbTributacaoRegular.Visible := not FPreenchimentoLivre;
  FrameGrupoIbsCbsTribRegular1.Enabled := FPreenchimentoLivre and ckTributacaoRegular.Checked;
  if FrameGrupoIbsCbsTribRegular1.Enabled then
    FrameGrupoIbsCbsTribRegular1.ParentFont := True
  else
    FrameGrupoIbsCbsTribRegular1.Font.Color := clGrayText;

  ckCompraGovernamentalItem.Visible := FPreenchimentoLivre;
  lbCompraGovernamentalItem.Visible := not FPreenchimentoLivre;
  FrameGrupoIbsCbsCompraGovItem1.Enabled := FPreenchimentoLivre and ckCompraGovernamentalItem.Checked;
  if FrameGrupoIbsCbsCompraGovItem1.Enabled then
    FrameGrupoIbsCbsCompraGovItem1.ParentFont := True
  else
    FrameGrupoIbsCbsCompraGovItem1.Font.Color := clGrayText;
end;

end.
