unit UCadNFSeCancelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, Mask, ComCtrls, ConfiguracaoNFSeModelUnit, NFSeEtdUnit, NFSeTypesUnit,
  IUIFormValidatorUnit, NFSeEventoModelUnit, NFSeEventoEtdUnit, hw_audit_utils;

type
  TFrmCadNFSeCancelamento = class(TfrmPadrao)
    pnContent: TPanel;
    Panel1: TPanel;
    btSair: TBitBtn;
    pnRetencoesComboNacional: TPanel;
    lbCMotivo: TLabel;
    edCMotivo: TComboBox;
    Panel7: TPanel;
    lbXMotivo: TLabel;
    edXMotivo: TMemo;
    btConcluir: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    edCancPortal: TComboBox;
    lbDhCancelamento: TLabel;
    edDhCancelamento: TMaskEdit;
    Label2: TLabel;
    lbSituacaoEvento: TLabel;
    btReverterCancelamento: TBitBtn;
    btExcluir: TBitBtn;
    procedure btExcluirClick(Sender: TObject);
    procedure btReverterCancelamentoClick(Sender: TObject);
    procedure edCancPortalChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btConcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFormResult: Integer; // Para atualizacao do dataset de quem chamou
    FCancEvento: NFSeEventoModel;
    FFormValidator: IUIFormValidator;
    FState: NFSeEventoEtd;
    FAuditor: TAudit_OOP;
    procedure ExibirHistoricoNFSe(const NFSeId: string);
  public
    procedure Setup(const NFSeId: string; EmpresaId: Integer; Auditor: TAudit_OOP);

    property FormResult: Integer read FFormResult;
  end;

var
  FrmCadNFSeCancelamento: TFrmCadNFSeCancelamento;

implementation

uses
  StrUtils, hw_boleto_utils, hw_win_utils,
  UIUtilsUnit, ContainerUnit, ResultadoNFSeOutputUnit, CancelarNFSeInputUnit, StringNullableUnit, TipoComunsUnit,
  DateAndTimeNullableUnit, UIFormValidatorFactoryUnit, ErpFeaturesFactoryUnit, EValidacaoNegocioUnit,
  DateTimeServiceUnit, StringServiceUnit, UCadNFSeHistorico, NFSeEventoResumoModelUnit, NFSeTypesDisplayUnit,
  NFSeModelUnit, ObterNFSeUseCaseUnit;

{$R *.dfm}

procedure TFrmCadNFSeCancelamento.btConcluirClick(Sender: TObject);
var
  cancelarResult: ResultadoNFSeOutput;
  dh: TDateTime;
  dhn: DateTimeNullable;
  nota: NFSeModel;
  sProcesso: string;
begin
  Screen.Cursor := crHourGlass;
  try try
    nota := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar(FCancEvento.NFSeId);

    sProcesso := IfThen(YesNoEnum(edCancPortal.ItemIndex) = ynYes, 'NFS032', 'NFS031');

    if not FAuditor.Processo( sProcesso, nota.NFSe.GetAuditLabel(), nota.NFSe.GetAuditKey())
      .Alterar().Permitido() then
      Exit;

    if (YesNoEnum(edCancPortal.ItemIndex) = ynYes) and TryStrToDateTime(edDhCancelamento.Text, dh) then
      dhn := DateTimeNullable.Create(dh)
    else
      dhn := DateTimeNullable.NullInstance();

    cancelarResult := Container.GetInstance().ErpFeaturesFactory.CreateCancelarNFSeUseCase()
      .Executar( CancelarNFSeInput.Create(
        FCancEvento.NFSeId, FCancEvento.EmpresaId,
        StringNullable.Create( MotivoCancelamentoNFSeEnumValues[MotivoCancelamentoNFSeEnum(edCMotivo.ItemIndex)] ),
        StringNullable.Create(Trim(edXMotivo.Lines.Text), not edXMotivo.Enabled),
        YesNoEnum(edCancPortal.ItemIndex) = ynYes,
        dhn,
        True,
        False
    ));

    if not cancelarResult.Validacoes.IsValid() then
      FFormValidator.Validate( cancelarResult.Validacoes )

    else
      case cancelarResult.Retorno.NFSe.Situacao of
        sdpsCancelada, sdpsSubstituida:
          begin
            FAuditor.Sucesso().GravarMensagemProcesso('');

            FFormResult := mrOk;
            if (YesNoEnum(edCancPortal.ItemIndex) = ynYes) then
              UIUtils.ShowInfo('Cancelamento conculído com sucesso');
            ModalResult := IDOK;
          end;

        else
          UIUtils.ShowInfo(Format('NFSe se encontra [%s]', [SituacaoNFSeEnumStr[cancelarResult.Retorno.NFSe.Situacao]]));
      end;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    nota.Free();
    cancelarResult.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSeCancelamento.btExcluirClick(Sender: TObject);
var
  excluirResult: NFSeEventoResumoModel;
  nota: NFSeModel;
begin
  Screen.Cursor := crHourGlass;
  try try

    if (FCancEvento = nil ) or (FCancEvento.Evento = nil) then
    begin
      btExcluir.Visible := False;
      Exit;
    end;

    nota := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar(FCancEvento.NFSeId);

    if not FAuditor.Processo( 'NFS034', nota.NFSe.GetAuditLabel(), nota.NFSe.GetAuditKey())
      .Excluir().Permitido() then
      Exit;

    excluirResult := Container.GetInstance().ErpFeaturesFactory.CreateExcluirCancelamentoNFSeUseCase()
      .Executar( FCancEvento.Evento.Id );

    if (excluirResult.SituacaoEvento = sdpsExcluido) then
    begin
      FFormResult := mrOk;
      btConcluir.Visible := False;
      btExcluir.Visible := False;
      btReverterCancelamento.Visible := False;
      lbSituacaoEvento.Caption := SituacaoNFSeEnumStr[excluirResult.SituacaoEvento];
      UIUtils.ShowInfo('Registro excluído com sucesso');
      ModalResult := IDOK;
    end;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    nota.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSeCancelamento.btReverterCancelamentoClick(Sender: TObject);
var
  reverterResult: NFSeEventoResumoModel;
  nota: NFSeModel;
begin
  Screen.Cursor := crHourGlass;
  try try

    if (FCancEvento = nil ) or (FCancEvento.Evento = nil) then
    begin
      btReverterCancelamento.Visible := False;
      Exit;
    end;

    nota := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar(FCancEvento.NFSeId);

    if not FAuditor.Processo( 'NFS033', nota.NFSe.GetAuditLabel(), nota.NFSe.GetAuditKey())
      .Alterar().Permitido() then
      Exit;

    reverterResult := Container.GetInstance().ErpFeaturesFactory.CreateReverterCancelamentoPortalNFSeUseCase()
      .Executar( FCancEvento.Evento.Id );

    if (reverterResult.SituacaoNFSe = sdpsAutorizada) and (reverterResult.SituacaoEvento = sdpsRascunho) then
    begin
      FAuditor.Sucesso().GravarMensagemProcesso('');

      FFormResult := mrOk;
      btConcluir.Visible := True;
      btExcluir.Visible := True;
      btReverterCancelamento.Visible := False;
      lbSituacaoEvento.Caption := SituacaoNFSeEnumStr[reverterResult.SituacaoEvento];
      pnContent.Enabled := True;
      pnContent.ParentFont := True;

      UIUtils.ShowInfo('Reversão realizada com sucesso');
    end;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    nota.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSeCancelamento.edCancPortalChange(Sender: TObject);
var
  dh: TDateTime;
begin
  if YesNoEnum(edCancPortal.ItemIndex) = ynYes then
  begin
    edDhCancelamento.Enabled := True;

    if not TryStrToDateTime( edDhCancelamento.Text, dh ) then
      edDhCancelamento.Text := DateTimeService.ParseLocal( Now() );
  end
  else
    edDhCancelamento.Enabled := False;
end;

procedure TFrmCadNFSeCancelamento.ExibirHistoricoNFSe(const NFSeId: string);
begin
  Application.CreateForm(TFrmCadNFSeHistorico, FrmCadNFSeHistorico);
  try
    FrmCadNFSeHistorico.Setup( NFSeId );

    FrmCadNFSeHistorico.ShowModal();

  finally
    FreeAndNil(FrmCadNFSeHistorico);
  end;
end;

procedure TFrmCadNFSeCancelamento.FormCreate(Sender: TObject);
begin
  inherited;
  FFormResult := mrNone;
  UIUtils.Populate( edCancPortal.Items, YesNoEnumStr );
  UIUtils.Populate( edCMotivo.Items, MotivoCancelamentoNFSeEnumGridStr );
  UIUtils.CenterHorizontal( btConcluir );
  UIUtils.CenterHorizontal( btReverterCancelamento );

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder(btConcluir)
    .Bind(lbCMotivo)
    .Bind(lbXMotivo)
    .Bind(lbDhCancelamento)
    .Validator();
end;

procedure TFrmCadNFSeCancelamento.FormDestroy(Sender: TObject);
begin
  FState.Free();

  inherited;
end;

procedure TFrmCadNFSeCancelamento.Setup(const NFSeId: string; EmpresaId: Integer; Auditor: TAudit_OOP);
var
  I: Integer;
  eve: NFSeEventoEtd;
  eMot: MotivoCancelamentoNFSeEnum;
begin
  FAuditor := Auditor;

  FCancEvento := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeEventoUseCase()
    .Executar( NFSeId, EmpresaId, tenCancelamento );

  if FCancEvento = nil then
    raise EValidacaoNegocio.Create('NFSe não encontrada');

  if FCancEvento.Evento = nil then
  begin
    FState := NFSeEventoEtd.Create();
    eve := FState;
    eve.Situacao := sdpsRascunho;
  end
  else
    eve := FCancEvento.Evento;

  edXMotivo.Enabled := FCancEvento.IsPadraoNacional();

  edXMotivo.Lines.Text := eve.XMotivo.Value;
  edCMotivo.ItemIndex := 0;

  for eMot := Low(MotivoCancelamentoNFSeEnumValues) to High(MotivoCancelamentoNFSeEnumValues) do
    if MotivoCancelamentoNFSeEnumValues[eMot] = eve.CMotivo.Value then
    begin
      edCMotivo.ItemIndex := Ord(eMot);
      Break;
    end;

//  if CancEvento.OrigemCanc = ocnPortalWebSite then
//    edCancPortal.ItemIndex := Ord( ynYes )
//  else
    edCancPortal.ItemIndex := Ord( FCancEvento.OrigemCanc = ocnPortalWebSite );

  edDhCancelamento.Enabled := FCancEvento.OrigemCanc = ocnPortalWebSite;

  if eve.DhProc.HasValue then
    edDhCancelamento.Text := DateTimeService.ParseLocal( eve.DhProc.Value )
  else if FCancEvento.OrigemCanc = ocnPortalWebSite then
    edDhCancelamento.Text := DateTimeService.ParseLocal( Now() );

  lbSituacaoEvento.Caption := SituacaoNFSeEnumStr[eve.Situacao];
                                                       
  btExcluir.Visible := (eve.Id <> '') and (eve.Situacao in [sdpsRascunho, sdpsRejeicao ]);
  btConcluir.Visible := eve.Situacao <> sdpsAutorizada;
  btReverterCancelamento.Visible := (eve.Situacao = sdpsAutorizada)
    and (FCancEvento.OrigemCanc = ocnPortalWebSite);

  pnContent.Enabled := eve.Situacao in [sdpsRascunho, sdpsRejeicao ];
  if not pnContent.Enabled then
    pnContent.Font.Color := clGray
  else
    pnContent.ParentFont := True;  
end;

end.
