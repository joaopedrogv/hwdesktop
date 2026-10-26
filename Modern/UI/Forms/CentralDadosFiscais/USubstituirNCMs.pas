unit USubstituirNCMs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, uPadrao, IUIFormValidatorUnit, Mask,
  DBGridFrameUnit, TipoComunsUnit, NCMsCDFDataSet;

type
  TFrmSubstituirNCMsSetup = record
  private
    NCMs: TArrayString;
    Data: TDate;
  public
    class function Create(const
      NCMs: TArrayString;
      Data: TDate
    ): TFrmSubstituirNCMsSetup; static;
  end;

  TNcmSubstituto = record
  private
    FNcmOrigem: string;
    FNcmSubstitudo: string;
  public
    property NcmOrigem: string read FNcmOrigem;
    property NcmSubstitudo: string read FNcmSubstitudo;
  end;

  TNcmsSubstitutos = array of TNcmSubstituto;

  TFrmSubstituirNCMs = class(TfrmPadrao)
    Panel1: TPanel;
    pnContent: TPanel;
    Splitter1: TSplitter;
    pnNcms: TPanel;
    pnConsultas: TPanel;
    pnBottom: TPanel;
    btSair: TBitBtn;
    Label3: TLabel;
    lbxNCMs: TListBox;
    pnConsultaDescricao: TPanel;
    pnConsultaAto: TPanel;
    Label1: TLabel;
    pnCamposConsulta: TPanel;
    pnLinks: TPanel;
    Panel4: TPanel;
    Label5: TLabel;
    edCodigo: TMaskEdit;
    Label6: TLabel;
    pnGridNcm8: TPanel;
    DBGridFrameNcms8: TDBGridFrame;
    Splitter2: TSplitter;
    pnGridArvore: TPanel;
    DBGridFrame2NcmArv: TDBGridFrame;
    linkSelecionar: TLabel;
    Panel7: TPanel;
    lbSituacao: TLabel;
    linkVerNovos: TLabel;
    Label4: TLabel;
    edDescricao: TMaskEdit;
    Panel8: TPanel;
    Label8: TLabel;
    lbDataExtincao: TLabel;
    linkUsarConsulta: TLabel;
    pnGrids: TPanel;
    btSelecaoContinuar: TBitBtn;
    procedure DBGridFrameNcms8DBGridDblClick(Sender: TObject);
    procedure btSelecaoContinuarClick(Sender: TObject);
    procedure linkVerNovosClick(Sender: TObject);
    procedure linkUsarConsultaClick(Sender: TObject);
    procedure linkSelecionarClick(Sender: TObject);
    procedure edDescricaoEnter(Sender: TObject);
    procedure edCodigoEnter(Sender: TObject);
    procedure edDescricaoChange(Sender: TObject);
    procedure edCodigoChange(Sender: TObject);
    procedure lbxNCMsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FComunicator: IUIFormComunicator;
    FTimerNcmChange: TTimer;
    FTimerConsultaDescricao: TTimer;
    FNcmsDataSet: TNCMsCDFDataSet;
    FArvoreNcmDataSet: TNCMsCDFDataSet;
    FQueryAtiva: TNCMsCDFDataSetQuery;
    FData: TDate;
    FAtoExtincao: string;

    procedure TimerNcmChangeTimer(Sender: TObject);
    procedure TimerConsultaDescricaoTimer(Sender: TObject);
    procedure DataNcmChange(const NCM: string);
    function GetNcmListBox(): string;
  public
    procedure Setup(const Input: TFrmSubstituirNCMsSetup);
    function GetListaSubstituida(): TNcmsSubstitutos;
  end;

var
  FrmSubstituirNCMs: TFrmSubstituirNCMs;

implementation

{$R *.dfm}

uses
  UIFormValidatorFactoryUnit, MessageTransferType, ContainerUnit, NcmEtdUnit,
  DateAndTimeNullableUnit, ErpFeaturesFactoryUnit, ObterNcmUseCaseUnit,
  FieldsConfigUnit, UIUtilsUnit, DataSetGrid, DbGridConfigUtilsUnit, StrUtils,
  uDataSet_OOP, StringServiceUnit, DateTimeServiceUnit, StringNullableUnit;

{ TFrmSubstituirNCMs }

procedure TFrmSubstituirNCMs.btSelecaoContinuarClick(Sender: TObject);
var
  I, Count: Integer;
begin
  inherited;

  Count := 0;
  for I := 0 to lbxNCMs.Count - 1 do
    if not ContainsStr(lbxNCMs.Items[I], '?') then
      Inc(Count);

  if Count = 0 then
    UIUtils.ShowInfo('Nenhum NCM foi corrigido')

  else if (Count <> lbxNCMs.Count)
    and (UIUtils.ShowQuestion('Nem todos os registros foram corrigidos. Continua?', True) <> mrYes) then
    Exit

  else
    ModalResult := mrOk;
end;

procedure TFrmSubstituirNCMs.DataNcmChange(const NCM: string);
begin                                     
  FTimerNcmChange.Enabled := False;
  FTimerNcmChange.Enabled := True;
end;

procedure TFrmSubstituirNCMs.DBGridFrameNcms8DBGridDblClick(Sender: TObject);
begin
  linkSelecionarClick(linkSelecionar);
end;

procedure TFrmSubstituirNCMs.edCodigoChange(Sender: TObject);
begin
  inherited;
  FTimerConsultaDescricao.Enabled := False;
  FTimerConsultaDescricao.Enabled := True;
end;

procedure TFrmSubstituirNCMs.edCodigoEnter(Sender: TObject);
begin
  FQueryAtiva := ncmQryRegularLikeNCM;
  FTimerConsultaDescricao.Enabled := False;
  FTimerConsultaDescricao.Enabled := True;
  if edCodigo.Tag = 0 then
  begin
    UIUtils.HintInfo(edCodigo, edCodigo.Hint);
    edCodigo.Tag := 1;
  end;
end;

procedure TFrmSubstituirNCMs.edDescricaoChange(Sender: TObject);
begin
  inherited;
  FTimerConsultaDescricao.Enabled := False;
  FTimerConsultaDescricao.Enabled := True;
end;

procedure TFrmSubstituirNCMs.edDescricaoEnter(Sender: TObject);
begin
  FQueryAtiva := ncmQryRegularLikeDescricao;  
  FTimerConsultaDescricao.Enabled := False;
  FTimerConsultaDescricao.Enabled := True;
  if edDescricao.Tag = 0 then
  begin
    UIUtils.HintInfo(edDescricao, edDescricao.Hint);
    edDescricao.Tag := 1;
  end;
end;

procedure TFrmSubstituirNCMs.FormCreate(Sender: TObject);
begin
  inherited;
  FTimerConsultaDescricao := TTimer.Create(Self);
  FTimerConsultaDescricao.Enabled := False;
  FTimerConsultaDescricao.Interval := 400;
  FTimerConsultaDescricao.OnTimer := TimerConsultaDescricaoTimer;

  FTimerNcmChange := TTimer.Create(Self);
  FTimerNcmChange.Enabled := False;
  FTimerNcmChange.Interval := 200;
  FTimerNcmChange.OnTimer := TimerNcmChangeTimer;

  FNcmsDataSet := TNCMsCDFDataSet.Create('CDS_' + Self.ClassName);
  FNcmsDataSet.OnChange := DataNcmChange;
  FArvoreNcmDataSet := TNCMsCDFDataSet.Create('CDS_ARV_' + Self.ClassName);

  FAtoExtincao := '';

//  pnConsultaAto.Align := alClient;
//  pnConsultaDescricao.Align := alClient;
end;

procedure TFrmSubstituirNCMs.FormDestroy(Sender: TObject);
begin
  FNcmsDataSet.Free();
  FArvoreNcmDataSet.Free();
  inherited;
end;

function TFrmSubstituirNCMs.GetListaSubstituida: TNcmsSubstitutos;
var
  I, Count: Integer;
  A: TArrayString;
  R: TNcmSubstituto;
begin
  SetLength(Result, lbxNCMs.Count);
  Count := 0;
  for I := 0 to lbxNCMs.Count - 1 do
  begin
    A := StringService.Split(['>'],lbxNCMs.Items[I]);
    if (Length(A) = 2) and (Trim(A[1]) <> '?') then
    begin
      Inc(Count);
      R.FNcmOrigem := Trim(A[0]);
      R.FNcmSubstitudo := Trim(A[1]);
      Result[Count - 1] := R;
    end;
  end;

  SetLength(Result, Count);
end;

function TFrmSubstituirNCMs.GetNcmListBox: string;

var
  S: string;
  A: TArrayString;
begin
  if lbxNCMs.ItemIndex = -1 then
    Exit;

  A := StringService.Split(['>'],lbxNCMs.Items[lbxNCMs.ItemIndex]);

  Result := Trim(A[0]);
end;

procedure TFrmSubstituirNCMs.lbxNCMsClick(Sender: TObject);
var
  ncm: NcmEtd;
begin
  if lbxNCMs.ItemIndex = -1 then
    Exit;

  ncm := Container.GetInstance().ErpFeaturesFactory.CreateObterNcmMaisRecenteUseCase()
    .Executar( GetNcmListBox() ) ;
  try
    FAtoExtincao := '';
    linkUsarConsulta.Visible := False;
    linkVerNovos.Visible := False;
    FQueryAtiva := ncmQryRegularLikeNCM;

    if ncm = nil then
      lbSituacao.Caption := 'NCM Inexistente'

    else if not ncm.DataFim.IsNull and (FData > ncm.DataFim.Value) then
    begin
      lbSituacao.Caption := 'NCM Extinto';
      lbDataExtincao.Caption := DateService.ParseLocal(ncm.DataFim.Value);
      FAtoExtincao := Trim(ncm.NumeroAtoFim.Value);
      linkUsarConsulta.Visible := True;
      FTimerConsultaDescricao.Enabled := False;
      FTimerConsultaDescricao.Enabled := True;
      FQueryAtiva := ncmQryRegularPorAtoInicio;
    end

    else if ncm.DataInicio > Date then
      lbSituacao.Caption := 'NCM Futuro'

    else
      lbSituacao.Caption := 'NCM Regular';

    pnConsultaAto.Visible := lbSituacao.Caption = 'NCM Extinto';
    pnConsultaDescricao.Visible := not pnConsultaAto.Visible;

    if pnConsultaDescricao.Visible then
      if (edCodigo.Text = '') and (edDescricao.Text = '') then
        FNcmsDataSet.Close()
      else
      begin
        if edCodigo.Text <> '' then
          FQueryAtiva := ncmQryRegularLikeNCM
        else if edDescricao.Text <> '' then
          FQueryAtiva := ncmQryRegularLikeDescricao;

        FTimerConsultaDescricao.Enabled := False;
        FTimerConsultaDescricao.Enabled := True;
      end;

  finally
    ncm.Free();
  end;
end;

procedure TFrmSubstituirNCMs.linkSelecionarClick(Sender: TObject);
var
  S: string;
  A: TArrayString;
  I: Integer;
begin
  if (lbxNCMs.ItemIndex = -1)
    or FNcmsDataSet.IsEmpty then
    Exit;

  A := StringService.Split(['>'],lbxNCMs.Items[lbxNCMs.ItemIndex]);

  lbxNCMs.Items[lbxNCMs.ItemIndex] := Format('%s > %s', [Trim(A[0]), FNcmsDataSet.fstr('ncm')]);

  for I := lbxNCMs.ItemIndex to lbxNCMs.Count - 1 do
    if ContainsStr(lbxNCMs.Items[I], '?') then
    begin
      lbxNCMs.ItemIndex := I;
      lbxNCMsClick(lbxNCMs);
      Exit;
    end;
end;

procedure TFrmSubstituirNCMs.linkUsarConsultaClick(Sender: TObject);
begin
  inherited;
  linkUsarConsulta.Visible := False;
  linkVerNovos.Visible := True;
  pnConsultaDescricao.Visible := True;
  pnConsultaAto.Visible := False;
  FQueryAtiva := ncmQryRegularLikeNCM;
  FTimerConsultaDescricao.Enabled := False;
  FTimerConsultaDescricao.Enabled := True;
end;

procedure TFrmSubstituirNCMs.linkVerNovosClick(Sender: TObject);
begin                              
  linkVerNovos.Visible := False;
  linkUsarConsulta.Visible := True;
  pnConsultaDescricao.Visible := False;
  pnConsultaAto.Visible := True;
  FQueryAtiva := ncmQryRegularPorAtoInicio;
  FTimerConsultaDescricao.Enabled := False;
  FTimerConsultaDescricao.Enabled := True;
end;

procedure TFrmSubstituirNCMs.Setup(const Input: TFrmSubstituirNCMsSetup);
var
  I: Integer;
  builder: IFieldsConfigBuilder;
begin
  FData := Input.Data;
  lbxNCMs.Items.Clear;
  for I := Low(Input.NCMs) to High(Input.NCMs) do
    lbxNCMs.Items.Add( Format('%s > ?', [ Input.NCMs[I] ]));

  if lbxNCMs.Count > 0 then
  begin
    lbxNCMs.ItemIndex := 0;
    lbxNCMsClick(lbxNCMs);
  end;

  FNcmsDataSet.Setup(TNCMsCDFDataSetSetup.Create(ncmQryRegularLikeNCM, ''));
  FArvoreNcmDataSet.Setup(TNCMsCDFDataSetSetup.Create(ncmQryNcmArvore, ''));

  builder := FieldsConfigFactory.Create()
      .Add('ncm', 'NCM' )
      .Add('descricao', 'Descrição').Width(340);

  DBGridFrameNcms8.Setup( TDBGridFrameSetup.CreateClean() );
  DBGridFrameNcms8.DataSource := FNcmsDataSet._dataSourceOOP;

  DbGridConfigUtils.ApplyToDBGrid( DBGridFrameNcms8.DBGrid, builder.List );

  DBGridFrame2NcmArv.Setup( TDBGridFrameSetup.CreateClean() );
  DBGridFrame2NcmArv.DataSource := FArvoreNcmDataSet._dataSourceOOP;

  DbGridConfigUtils.ApplyToDBGrid( DBGridFrame2NcmArv.DBGrid, builder.List );
end;

procedure TFrmSubstituirNCMs.TimerConsultaDescricaoTimer(Sender: TObject);
var
  Q: TNCMsCDFDataSetQuery;
begin
  FTimerConsultaDescricao.Enabled := False;

  if FNcmsDataSet.Query <> FQueryAtiva then
    FNcmsDataSet.Setup(TNCMsCDFDataSetSetup.Create(FQueryAtiva, ''));

  case FQueryAtiva of
    ncmQryRegularLikeNCM:
      if Length(edCodigo.Text) >= 2 then
        FNcmsDataSet.Executar(edCodigo.Text, FData);

    ncmQryRegularLikeDescricao:
      if Length(edDescricao.Text) >= 2 then
        FNcmsDataSet.Executar(edDescricao.Text, FData);

    ncmQryRegularPorAtoInicio: 
      if Trim(FAtoExtincao) <> '' then
        FNcmsDataSet.Executar(FAtoExtincao, FData);
  end;
  {
  if ActiveControl = edCodigo  then
  begin
    if Length(edCodigo.Text) < 2 then
      Exit;

    if FNcmsDataSet.Query <> ncmQryRegularLikeNCM then
      FNcmsDataSet.Setup(TNCMsCDFDataSetSetup.Create(ncmQryRegularLikeNCM, ''));

    FNcmsDataSet.Executar(edCodigo.Text, FData);
  end

  else if ActiveControl = edDescricao  then
  begin
    if Length(edDescricao.Text) < 2 then
      Exit;

    if FNcmsDataSet.Query <> ncmQryRegularLikeDescricao then
      FNcmsDataSet.Setup(TNCMsCDFDataSetSetup.Create(ncmQryRegularLikeDescricao, ''));

    FNcmsDataSet.Executar(edDescricao.Text, FData);
  end

  else if pnConsultaAto.Visible and (FAtoExtincao <> '') then
  begin
    if FNcmsDataSet.Query <> ncmQryRegularPorAtoInicio then
      FNcmsDataSet.Setup(TNCMsCDFDataSetSetup.Create(ncmQryRegularPorAtoInicio, ''));

    FNcmsDataSet.Executar(FAtoExtincao, FData);
  end;
  }
end;

procedure TFrmSubstituirNCMs.TimerNcmChangeTimer(Sender: TObject);
var
  Ncm: string;
begin
  FTimerNcmChange.Enabled := False;

  Ncm := FNcmsDataSet.fstr('ncm');

  FArvoreNcmDataSet.Executar( Ncm, FData );
end;

{ TFrmSubstituirNCMsSetup }

class function TFrmSubstituirNCMsSetup.Create(const NCMs: TArrayString;
  Data: TDate): TFrmSubstituirNCMsSetup;
begin
  Result.NCMs := NCMs;
  Result.Data := Data;
end;

end.
