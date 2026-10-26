unit UCadNFSe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  uCadPadraoModal, FilterFR, FilterPadraoFR, ComboBoxRegrasFiscaisFrameUnit,
  AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask,
  NFSeDataSet, hw_audit_utils, IUIFormValidatorUnit, NFSeFrameUnit, NFSeModelUnit, TipoComunsUnit,
  EmissaoLoteNFSeOutputUnit, ImgList;

type
  TFrmCadNFSe = class(TfrmCadPadraoM)
    tabCadastro: TTabSheet;
    FilterFramePadrao1: TFilterFramePadrao;
    btSalvar: TBitBtn;
    btEnviarConsultar: TBitBtn;
    NFSeFrame1: TNFSeFrame;
    popMenuNova: TPopupMenu;
    EmissaoPropriaViaWebService1: TMenuItem;
    EmissaoPropriaViaPortal1: TMenuItem;
    N2: TMenuItem;
    EmissaoTerceiros1: TMenuItem;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    btEmitirOuConsultar2: TSpeedButton;
    btCancelar: TSpeedButton;
    btSubstituicao: TSpeedButton;
    N1: TMenuItem;
    btEmail: TSpeedButton;
    btEmitirDaOS: TSpeedButton;
    btNFSeOS: TSpeedButton;
    btMaisOpcoesInternas: TSpeedButton;
    ImageList1: TImageList;
    ReverterAutorizacao1: TMenuItem;
    ConsultarSituacaoNFSe1: TMenuItem;
    AlterarNaturezaEmissaoPortal1: TMenuItem;
    AlterarNaturezaEmissaoWS1: TMenuItem;
    btMaisOpcoesConsulta: TSpeedButton;
    N3: TMenuItem;
    ConfiguracoesNFSe1: TMenuItem;
    ModuloNFSeAntigo1: TMenuItem;
    procedure btMaisOpcoesConsultaClick(Sender: TObject);
    procedure ModuloNFSeAntigo1Click(Sender: TObject);
    procedure ConfiguracoesNFSe1Click(Sender: TObject);
    procedure AlterarNaturezaEmissaoPortal1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btMaisOpcoesInternasClick(Sender: TObject);
    procedure ConsultarSituacaoNFSe1Click(Sender: TObject);
    procedure btNFSeOSClick(Sender: TObject);
    procedure btEmitirDaOSClick(Sender: TObject);
    procedure ReverterAutorizacao1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btEmailClick(Sender: TObject);
    procedure btSubstituicaoClick(Sender: TObject);
    procedure popMenuNovaPopup(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btEmitirOuConsultar2Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btEnviarConsultarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EmissaoTerceiros1Click(Sender: TObject);
    procedure EmissaoPropriaViaPortal1Click(Sender: TObject);
    procedure EmissaoPropriaViaWebService1Click(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FNeedRefreshData: Boolean;
    FData: TNFSeDataSet;
    FAuditor: TAudit_OOP;
    FFormValidator: IUIFormValidator;

    function SalvarNFSe(): Boolean;
    procedure ExibirHistoricoNFSe(const NFSeId: string);
    procedure ChecarAtualizacaoDadosFiscais();
    function SelecionarOrdensDeServicoParaCriacaoDeNFSe(const NumerosOSs: TArrayInteger): Boolean;
    procedure CriarNFSeDasOrdensDeServico(const NumerosOSs: TArrayInteger; CriarEmitir: Boolean; out CloseFormulario: Boolean);
    procedure EmitirLoteNFSe(const NFSeIDs, Emails: TArrayString);
    procedure TratarRespostaEmissaoEmLote(
      RespostaEmissao: EmissaoLoteNFSeOutput; const CaptionNotas: string
    );
  private
    procedure SetupAlteracao(const Nota: NFSeModel);
    procedure ShowAbaCadastro(ANFSe: NFSeModel);
    procedure ShowAbaConsulta();
  public

  end;

var
  FrmCadNFSe: TFrmCadNFSe;

implementation

uses
  StrUtils, Dialogs, DB, Math, Contnrs,
  uDtmAtivo, hw_utils, hw_win_utils, hw_grid_utils, {hw_boleto_utils, }FieldsConfigUnit, uDataSet_OOP,
  UCadNFSeHistorico, UCadNFSeConfig, UCadNFSeCancelamento,
  ContainerUnit, DbGridConfigUtilsUnit, UIUtilsUnit, UIFormValidatorFactoryUnit, EValidacaoNegocioUnit,
  StatusRegistroEnumUnit, ErpFeaturesFactoryUnit, TipoTributoFiscalEnumUnit, OperacaoInternaEtdUnit,
  ListarOperacoesInternasUseCaseUnit, GrupoFiscalEtdUnit, StringNullableUnit, DateTimeServiceUnit,
  OperacaoFiscalIbsCbsEtdUnit, DataSetGrid, InicializarDpsModelUnit, NFSeTypesUnit, EmitirNFSeCommandUnit,
  ResultadoNFSeOutputUnit, DFeDLLAdapterUnit, ResultadoOperacaoDFeUnit, ConluirNFSeInputUnit,
  DFeDLLHeader, NFSeTypesDisplayUnit, NFSeEtdUnit, ValidationEntityOutputUnit, UCadNFSeEncontrarOS,
  UCadNFSeCriarAPartirDeOS, CriarNFSeAgrupadasInputUnit, UCadNFSeVinculosOS, DataMatrixUnit, EmitirLoteNFSeCommandUnit,
  NFSeMetadataUnit, EmitirNFSeInputUnit, ICriarEmitirNFSeAgrupadasUseCaseUnit, EmitirNFSeUseCaseUnit, StringServiceUnit,
  ArrayServiceUnit, LegacyDFeDLLAdapterUnit, UCadNFSeEnviarEmail, uDadosIni, 
  uEnviarMensagem;

{$R *.dfm}

{ TFrmCadDPS }

procedure TFrmCadNFSe.AlterarNaturezaEmissaoPortal1Click(Sender: TObject);
var
  Nota: NFSeModel;
  S: string;
begin
  Screen.Cursor := crHourGlass;
  try try
    if UIUtils.ShowQuestion(
      'Deseja mesmo alternar a natureza da emissão desa NFSe?', True
    ) <> IDYES then
      Exit;

    if NFSeFrame1.HasChanges() and not SalvarNFSe() then
      Exit;

    Nota := NFSeFrame1.GetDPS();
    S := Nota.NFSe.GetAuditLabel(NaturezaEmissaoNFSeEnumStr[Nota.NFSe.NaturezaEmissao]);

    if not FAuditor.Processo('NFS025', S, Nota.NFSe.GetAuditKey() )
      .Alterar().Permitido() then
      Exit;

    Nota.Free();
    Nota := Container.GetInstance().ErpFeaturesFactory.CreateAlternarNaturezaEmissaoPropiaNFSeUseCase()
      .Executar( NFSeFrame1.NFSeId );

    FAuditor.Sucesso().GravarMensagemProcesso(' - ' + NaturezaEmissaoNFSeEnumStr[Nota.NFSe.NaturezaEmissao]);
    FNeedRefreshData := True;
    ShowAbaCadastro( Nota );

    UIUtils.ShowInfo('Alteração realizada com sucesso');

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    Nota.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.BitBtn1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    if not FAuditor.Processo('NFS011').Visualizar().Permitido() then
      Exit;

    FData.SQLMaker.FilterMk.FreeFilters()
      .Add('situacao', Ord(sdpsExcluido), '<>' )
      .Add(FilterFramePadrao1.GetFiltros());

    FData.RunSQLMaker();

    FNeedRefreshData := False;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.BitBtn3Click(Sender: TObject);
begin
  ChecarAtualizacaoDadosFiscais();

  popMenuNova.Tag := 1; // Nova
  popMenuNova.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmCadNFSe.BitBtn4Click(Sender: TObject);
var
  conlcuirResult: ResultadoNFSeOutput;
  DPS: NFSeModel;
  temFalhaValidacao: Boolean;
  sProcesso: string;
begin
  Screen.Cursor := crHourGlass;
  try try

    if NFSeFrame1.HasChanges() and not SalvarNFSe() then
      Exit;

    DPS := NFSeFrame1.GetDPS();

    sProcesso := IfThen( DPS.NFSe.NaturezaEmissao = nemtTomadorTerceiros, 'NFS019', 'NFS018' );
    if not FAuditor.Processo( sProcesso ).Salvar().Permitido() then
      Exit;

    FNeedRefreshData := True;
    temFalhaValidacao := False;

    FreeAndNil(DPS);

    conlcuirResult :=
      Container.GetInstance().ErpFeaturesFactory.CreateConcluirDoPortalNFSeUseCase()
      .Executar( ConcluirNFSeInput.Create( NFSeFrame1.NFSeId, False ));

    if (Length(conlcuirResult.Validacoes.Validations) = 1)
      and (conlcuirResult.Validacoes.Validations[0].FieldName = 'ChaveNFSe')
      and (conlcuirResult.Validacoes.Validations[0].Problem = vepRequired)
    then
      if FAuditor.Processo('NFS020').Validar().Permitido then
      begin
        FreeAndNil(conlcuirResult);
        conlcuirResult :=
          Container.GetInstance().ErpFeaturesFactory.CreateConcluirDoPortalNFSeUseCase()
          .Executar( ConcluirNFSeInput.Create( NFSeFrame1.NFSeId, True ));
      end;

    if not conlcuirResult.Validacoes.IsValid() then
      temFalhaValidacao := True

    else
      case conlcuirResult.Retorno.NFSe.Situacao of
        sdpsAutorizada:
          begin
            FAuditor.Processo(sProcesso).Sucesso().GravarMensagemProcesso('SUCESSO');
            ShowAbaConsulta();
            Exit;
          end;

        else
          UIUtils.ShowInfo(Format('NFSe se encontra [%s]', [SituacaoNFSeEnumStr[conlcuirResult.Retorno.NFSe.Situacao]]));
      end;

    if (conlcuirResult.Retorno <> nil) and (conlcuirResult.Retorno.NFSe <> nil) then
      DPS := conlcuirResult.ExtractNFSe()
    else
      DPS := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar( NFSeFrame1.NFSeId );

    NFSeFrame1.Setup( DPS, FAuditor );

    if temFalhaValidacao then
      FFormValidator.Validate( conlcuirResult.Validacoes );

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    DPS.Free();
    conlcuirResult.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.BitBtn5Click(Sender: TObject);
begin       
  if FNeedRefreshData and FData.Active then
    FData.Refresh();
    
  inherited;
end;

procedure TFrmCadNFSe.btCancelarClick(Sender: TObject);
var
  resultadoOp: ResultadoOperacaoDFe;
  formCanc: TFrmCadNFSeCancelamento;
begin
  if FData.IsEmpty() then
    Exit;

  if not FData.GetAuditorFill('NFS030').Validar.Permitido() then
    Exit;

  formCanc := TFrmCadNFSeCancelamento.Create(nil);
  try
    formCanc.Setup( FData.fstr('id'), vDadosIni.cod_empresa, FAuditor );

    if (formCanc.ShowModal = mrOk) or (formCanc.FormResult = mrOk) then
      FData.Refresh();

  finally
    FreeAndNil(formCanc);
  end;
end;

procedure TFrmCadNFSe.ConfiguracoesNFSe1Click(Sender: TObject);
var
  F: TFrmCadNFSeConfig;
begin
  if not FAuditor.Processo('NFS039').Visualizar.Permitido() then
    Exit;

  F := TFrmCadNFSeConfig.Create(nil);
  try

    F.Setup(
      Container.GetInstance().ErpFeaturesFactory.CreateObterConfiguracaoNFSeUseCase().Executar( vDadosIni.cod_empresa ),
      vDadosIni.cod_empresa, FAuditor
    );

    F.ShowModal();

  finally
    F.Free();
  end;
end;

procedure TFrmCadNFSe.ConsultarSituacaoNFSe1Click(Sender: TObject);
var
  emitirResult: ResultadoNFSeOutput;
  nota: NFSeModel;
  temFalhaValidacao: Boolean;
begin
  Screen.Cursor := crHourGlass;
  try try

    nota := NFSeFrame1.GetDPS();

    if not FAuditor.Processo('NFS024', nota.NFSe.GetAuditLabel(), nota.NFSe.GetAuditKey()).Validar().Permitido() then
      Exit;

    FNeedRefreshData := True;
    temFalhaValidacao := False;

    nota := nil;  

    emitirResult :=
      Container.GetInstance().ErpFeaturesFactory.CreateConsultarEmissaoNFSeUseCase()
      .Executar( EmitirNFSeInput.Create( NFSeFrame1.NFSeId, vDadosIni.cod_empresa, False));

    if not emitirResult.Validacoes.IsValid() then
      temFalhaValidacao := True

    else
      case emitirResult.Retorno.NFSe.Situacao of
        sdpsAutorizada:
          begin
            ShowAbaConsulta();
            Exit;
          end;

      sdpsRejeicao:
        ExibirHistoricoNFSe(NFSeFrame1.NFSeId);

        else
          UIUtils.ShowInfo(Format('NFSe se encontra [%s]', [SituacaoNFSeEnumStr[emitirResult.Retorno.NFSe.Situacao]]));
      end;

    nota.Free();
    if (emitirResult.Retorno <> nil)  and (emitirResult.Retorno.NFSe <> nil) then
      nota := emitirResult.ExtractNFSe()
    else
      nota := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar( NFSeFrame1.NFSeId );

    SetupAlteracao( nota );

    if temFalhaValidacao then
      FFormValidator.Validate( emitirResult.Validacoes );

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    nota.Free();
    emitirResult.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.btEmailClick(Sender: TObject);
var
//  nota: NFSeModel;
//  tomadorEmail: string;
//  resultadoOp: ResultadoOperacaoDFe;
  anexo: string;
  emailResult, countSelecao: Integer;
  sNFSeIds, sEmails, sCaption, sEmailCaption: string;
  emailsArray, anexos, NFSeIDsArray, NFSeIDsArrayTmp: TArrayString;
  bUnicoEmail: Boolean;
  dataMatrix: TDataMatrix;
  vAplicativo: TAplicativoEnv;
  vArrayAplicativo: arrayaplicativo;
  vArrayContato: arraycontato;
  vUtilizarArrayContato: Boolean;
  vAssunto, vMensagem: string;
  vClienteId: Integer;
  vArrayClientes: ArrayInts;
  vEnvUnicaMens, vAnexarPdfs: Boolean;
  vStringListErros: TStringList;
  I, J: Integer;
begin
  if FData.IsEmpty() then
    Exit;

  if not FAuditor.Processo( 'NFS029').Validar().Permitido()  then
    Exit;

  sCaption      := Format('NFSe %d - %s', [FData.fint('nnfse'), FData.fstr('t_xnome')]);
  sNFSeIds      := FData.fstr('id');
  sEmails       := StringReplace(FData.fstr('cl_email'), ';', ',', [rfReplaceAll]) ;
  sEmailCaption := sEmails;
  countSelecao  := 1;

  dataMatrix := FData.GetDataMatrix('id,cl_email', True, False);
  Screen.Cursor := crHourGlass;
  try try
    if dataMatrix.RowCount > 0 then
    begin
      emailsArray := dataMatrix.GetColumnArray('cl_email');
      for I := 0 to High(emailsArray) do
        emailsArray[I] := StringReplace(emailsArray[I], ';', ',', [rfReplaceAll]) ;

      sCaption := Format('Registros de NFSe selecionados: %d', [  dataMatrix.RowCount ]);
      sNFSeIds := StringService.Join( ';', dataMatrix.GetColumnArray('id'));
      sEmails  := StringService.Join( ';', emailsArray);
      bUnicoEmail := False;
      countSelecao := dataMatrix.RowCount;
    end
    else
      bUnicoEmail := True;

    if Container.GetInstance().ErpFeaturesFactory.CreateObterConfiguracaoNFSeUseCase().Executar( vDadosIni.cod_empresa )
      .UsarMensageriaAI then
    begin
      try
      	try
          vArrayClientes := FData.GetArrayDistinctInts('cod_cliente', True, True);
          vClienteId := IfThen(Length(vArrayClientes) > 1, 0, vArrayClientes[0]);
        finally
          SetLength(vArrayClientes, 0);
        end;

        if not vDadosIni.sincronizarDadosContatoClienteAplicativo(vClienteId) then
        	Exit;

        vStringListErros := TStringList.Create;
        vStringListErros.Clear;

      	Application.CreateForm(TFrmEnviarMensagem, FrmEnviarMensagem);
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Clear;
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Add('Enviar única mensagem');
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Add('Anexar PDFs');
        
        FrmEnviarMensagem.FrameCheckListaContato.CodCliente := vClienteId;
        FrmEnviarMensagem.FrameCheckListaContato.Origem := cNfse;
        FrmEnviarMensagem.FrameCheckListaContato.UnicoMens := False;

        if FrmEnviarMensagem.ShowModal <> ID_OK then
          Exit;

        vArrayAplicativo := vDadosIni.retornaArrayAplicativo(FrmEnviarMensagem.FrameCheckListaContato.CheckListBoxAplicativo, True);
        vArraycontato    := vDadosIni.retornaArrayContato(FrmEnviarMensagem.FrameCheckListaContato.CheckListBoxContato, True);

        vUtilizarArrayContato := Length(vArrayContato) > 0;

        vEnvUnicaMens  := FrmEnviarMensagem.EnvUnicaMens;
        vAnexarPdfs    := FrmEnviarMensagem.AnexarPdfs;

      	try
        	if dataMatrix.RowCount > 0 then
            NFSeIDsArray := dataMatrix.GetColumnArray('id')
          else
            NFSeIDsArray := StringService.Split([','], sNFSeIds);

          for I := 0 to Length(NFSeIDsArray) - 1 do
          begin
          	if vEnvUnicaMens then
              anexos := Container.GetInstance().ErpFeaturesFactory.CreateCriarAnexosEmailPorNFSeIdUseCase().Executar(
                NFSeIDsArray, vAnexarPdfs
              )
            else
            begin
            	SetLength(NFSeIDsArrayTmp, 1);
            	NFSeIDsArrayTmp[0] := NFSeIDsArray[I];
            	anexos := Container.GetInstance().ErpFeaturesFactory.CreateCriarAnexosEmailPorNFSeIdUseCase().Executar(
                NFSeIDsArrayTmp, vAnexarPdfs
              );
            end;

            if vUtilizarArrayContato then
            begin
              for J := 0 to Length(vArrayContato) - 1 do
              begin
                 vDadosIni.retornaMensagemEnv(cNfse, vArraycontato[J].Aplicativo, vAssunto, vMensagem);

                 try
                   if not vDadosIni.EnvEmail(
                     vAssunto,
                     vMensagem,
                     vClienteId,
                     vArrayContato[J].Aplicativo,
                     vDadosIni.IfThen(vEnvUnicaMens, '', NFSeIDsArray[I]),
                     vDadosIni.IfThen(vEnvUnicaMens, '', OrigemEnvStr[cNfse]),
                     cNfse,
                     StringService.Join(sLineBreak, anexos),
                     Length(anexos),
                     True,
                     vArrayContato[J].Identificacao,
                     vArrayContato[J].Contato,
                     vArrayContato[J].Avulso) then
                   begin
                     if vStringListErros.Count = 10 then
                       vStringListErros.Add('...');
                     if vStringListErros.Count < 10 then
                       vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                   end;
                 except
                   if vStringListErros.Count = 10 then
                     vStringListErros.Add('...');
                   if vStringListErros.Count < 10 then
                     vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                 end;
              end;

              if vEnvUnicaMens then
              	Break;
            end
            else
            begin
              for vAplicativo in vArrayAplicativo do
           		begin
                vDadosIni.retornaMensagemEnv(cNfse, vAplicativo, vAssunto, vMensagem);

                FData.SqlOpen(' select cod_cliente from nfse ' +
                	' where id = ' + NFSeIDsArray[I], FData.buscas);
                vClienteId := FData.buscas.FieldByName('cod_cliente').AsInteger;

                if not vDadosIni.sincronizarDadosContatoClienteAplicativo(vClienteId) then
                	Exit;

                vArrayContato := vDadosIni.retornaArrayContato(vClienteId, vAplicativo, cNfse, False);

                for J := 0 to Length(vArrayContato) - 1 do
                begin
                  try
                    if not vDadosIni.EnvEmail(
                      vAssunto,
                      vMensagem,
                      vClienteId,
                      vArrayContato[J].Aplicativo,
                      vDadosIni.IfThen(vEnvUnicaMens, 0, NFSeIDsArray[I]),
                      vDadosIni.IfThen(vEnvUnicaMens, '', OrigemEnvStr[cNfse]),
                      cNfse,
                      StringService.Join(sLineBreak, anexos),
                      Length(anexos),
                      True,
                      vArrayContato[J].Identificacao,
                      vArrayContato[J].Contato,
                      vArrayContato[J].Avulso) then
                    begin
                      if vStringListErros.Count = 10 then
                     	  vStringListErros.Add('...');
                      if vStringListErros.Count < 10 then
                        vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                    end;
                  except
                    if vStringListErros.Count = 10 then
                    	vStringListErros.Add('...');
                    if vStringListErros.Count < 10 then
                      vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                  end;
                end;
              end;
            end;
          end;

          if vStringListErros.Count > 0 then
          	Application.MessageBox(PChar(vStringListErros.Text), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);          
        finally
        	for anexo in anexos do
          	if FileExists(anexo) then
        	  	DeleteFile(anexo);
        end;
      finally
      	if Assigned(vStringListErros) then
        	FreeAndNil(vStringListErros);

        if Assigned(FrmEnviarMensagem) then
        begin
          FrmEnviarMensagem.Free;
          FrmEnviarMensagem := nil;
        end;
      end;
      Exit;
    end;

    Application.CreateForm(TFrmCadNFSeEnviarEmail, FrmCadNFSeEnviarEmail);
    try
      FrmCadNFSeEnviarEmail.Setup( sCaption, sEmailCaption, bUnicoEmail );

      if FrmCadNFSeEnviarEmail.ShowModal() = mrOk then
        with FrmCadNFSeEnviarEmail.GetResult() do
        begin
          {
          ShowAtencao(
            'Email: %s ' + sLineBreak +
            'Unico email: %s' + sLineBreak +
            'AnexarPDF: %s',
            [ Email, BoolToStr(UnicoEmail, True), BoolToStr(AnexarPDF, True) ]
          );
          }
          emailResult := DFeDLLAdapter.CallEnviarEmail( DFeDLLAdapter.InputEmailNFSe(
            sNFSeIds, IfThen(UnicoEmail, Email, sEmails), vDadosIni.cod_empresa, UnicoEmail, AnexarPDF, False
          ));
          if (UnicoEmail or (countSelecao = 1)) and (emailResult <> 1) then
            raise EValidacaoNegocio.Create('Email não foi enviado. Consulte o log para mais detalhes')
          else if (not UnicoEmail) and (countSelecao <> emailResult) then
            raise EValidacaoNegocio.CreateFmt(
              'NFSe selecionadas: %d. Emails enviados: %d' + sLineBreak +
              'Consulte o log em cada NFSe para mais detalhes',
              [countSelecao, emailResult]
            );
        end;
    finally
      FreeAndNil(FrmCadNFSeEnviarEmail);
    end;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    dataMatrix.Free();
    Screen.Cursor := crDefault;
  end;
  {
  if FData.IsEmpty() then
    Exit;

  nota := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar(FData.fstr('id') );
  try try
    if nota = nil then
      raise EValidacaoNegocio.Create('NFSe não encontrada no banco de dados');

    if not FAuditor.Processo( 'NFS029', nota.NFSe.GetAuditLabel(), nota.NFSe.GetAuditKey())
      .Validar().Permitido() then
      Exit;

    if not (nota.NFSe.Situacao in [ sdpsAutorizada, sdpsCancelada, sdpsSubstituida]) then
      raise EValidacaoNegocio.Create('Envio de email não permitido para essa situação da NFSe');

    if not nota.NFSe.IsEmissaoSistema() then
      raise EValidacaoNegocio.Create('Não é possível enviar email de uma NFSe emtida fora do Sistema');

    tomadorEmail := FData.fstr('cl_email');
    if not InputQuery('Email', 'Informar emails separados por vírgula', tomadorEmail) then
      Exit;

    tomadorEmail := Trim(tomadorEmail);

    if tomadorEmail = '' then
    begin
      UIUtils.HintInfo('Nenhum email informado');
      Exit;
    end;

    DFeDLLAdapter.CallFeaturesNFSe( DFeDLLAdapter.InputNFSe(
      nota.NFSe.Id, nota.NFSe.CodEmpresa, False, [ dftEmail ], '', tomadorEmail
    ));

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    nota.Free;
  end;
  }
end;

procedure TFrmCadNFSe.btEmitirDaOSClick(Sender: TObject);
var
  form: TFrmCadNFSeEncontrarOS;
begin
  form := TFrmCadNFSeEncontrarOS.Create(nil);
  Screen.Cursor := crHourGlass;
  try try

    if not FAuditor.Processo('NFS036').Visualizar().Permitido() then
      Exit;

    try
      form.Setup();
    finally
      Screen.Cursor := crDefault;
    end;

    form.Callback := SelecionarOrdensDeServicoParaCriacaoDeNFSe;

    if form.ShowModal() = mrOk then
      FData.Refresh();
  
  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    form.Free();
  end;
end;

procedure TFrmCadNFSe.btEmitirOuConsultar2Click(Sender: TObject);
var
  emitirResult: ResultadoNFSeOutput;
  nfseId: string;
  dataMatrix: TDataMatrix;
begin
  if FData.IsEmpty() then
    Exit;

  dataMatrix := FData.GetDataMatrix('id,cl_email');
  try

    if dataMatrix.RowCount <> 1 then
    begin
      EmitirLoteNFSe(
        dataMatrix.GetColumnArray('id'),
        dataMatrix.GetColumnArray('cl_email')
      );
      Exit;
    end
    else
      nfseId := dataMatrix.CurrentFieldValue('id');
  finally
    dataMatrix.Free();
  end;

  Screen.Cursor := crHourGlass;
  try try

    if not FAuditor.Processo('NFS017').Alterar().Permitido() then
      Exit;

    emitirResult := Container.GetInstance().ErpFeaturesFactory.CreateEmitirNFSeUseCase()
      .Executar( EmitirNFSeInput.Create( nfseId, vDadosIni.cod_empresa, False ));

    if not emitirResult.Validacoes.IsValid() then
      raise EValidacaoNegocio.Create(FFormValidator.FormatValidations( emitirResult.Validacoes ));

    case emitirResult.Retorno.NFSe.Situacao of
      sdpsAutorizada: ;

      sdpsRejeicao:
        ExibirHistoricoNFSe(nfseId);

      else
        UIUtils.ShowInfo(Format('NFSe se encontra [%s]', [SituacaoNFSeEnumStr[emitirResult.Retorno.NFSe.Situacao]]));
    end;

    FData.Refresh();   

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    emitirResult.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.btEnviarConsultarClick(Sender: TObject);
var
  emitirResult: ResultadoNFSeOutput;
  nf: NFSeModel;
  temFalhaValidacao: Boolean;
begin
  Screen.Cursor := crHourGlass;
  try try
    if NFSeFrame1.HasChanges() and not SalvarNFSe() then
      Exit;

    if not FAuditor.Processo('NFS017').Salvar()
      .Permitido() then
      Exit;

    FNeedRefreshData := True;
    temFalhaValidacao := False;

    nf := nil;  

    emitirResult :=
      Container.GetInstance().ErpFeaturesFactory.CreateEmitirNFSeUseCase()
      .Executar( EmitirNFSeInput.Create( NFSeFrame1.NFSeId, vDadosIni.cod_empresa, False ));

    if not emitirResult.Validacoes.IsValid() then
      temFalhaValidacao := True

    else
      case emitirResult.Retorno.NFSe.Situacao of
        sdpsAutorizada:
          begin
            ShowAbaConsulta();
            Exit;
          end;

      sdpsRejeicao:
        ExibirHistoricoNFSe(NFSeFrame1.NFSeId);

        else
          UIUtils.ShowInfo(Format('NFSe se encontra [%s]', [SituacaoNFSeEnumStr[emitirResult.Retorno.NFSe.Situacao]]));
      end;

    if (emitirResult.Retorno <> nil)  and (emitirResult.Retorno.NFSe <> nil) then
      nf := emitirResult.ExtractNFSe()
    else
      nf := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar( NFSeFrame1.NFSeId );

    SetupAlteracao( nf );

    if temFalhaValidacao then
      FFormValidator.Validate( emitirResult.Validacoes );

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    nf.Free();
    emitirResult.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.btMaisOpcoesConsultaClick(Sender: TObject);
begin
  popMenuNova.Tag := 3; // Opcoes consulta
  popMenuNova.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmCadNFSe.btMaisOpcoesInternasClick(Sender: TObject);
begin
  popMenuNova.Tag := 2; // Opcoes internas
  popMenuNova.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmCadNFSe.btNFSeOSClick(Sender: TObject);
begin
  if FData.IsEmpty() then
    Exit;

  if not FData.GetAuditorFill('NFS037').Visualizar().Permitido() then
    Exit;

  Application.CreateForm(TFrmCadNFSeVinculosOS, FrmCadNFSeVinculosOS);
  try
    FrmCadNFSeVinculosOS.Setup( FData.fstr('id') );

    FrmCadNFSeVinculosOS.ShowModal();

  finally
    FreeAndNil(FrmCadNFSeVinculosOS);
  end;
end;

procedure TFrmCadNFSe.ReverterAutorizacao1Click(Sender: TObject);
var
  reverterResult: NFSeModel;
  nota: NFSeModel;
begin
  Screen.Cursor := crHourGlass;
  try try
    nota := NFSeFrame1.GetDPS();

    if nota = nil then
      raise EValidacaoNegocio.Create('NFSe não encontrada no banco de dados');

    if not FAuditor.Processo('NFS021', nota.NFSe.GetAuditLabel(), nota.NFSe.GetAuditKey() ).Alterar().Permitido() then
      Exit;

    reverterResult := Container.GetInstance().ErpFeaturesFactory.CreateReverterAutorizacaoPortalNFSeUseCase()
      .Executar( NFSeFrame1.NFSeId, vDadosIni.cod_empresa );

    if (reverterResult.NFSe.Situacao = sdpsRascunho) then
    begin
      FAuditor.Sucesso().GravarMensagemProcesso('');
      FNeedRefreshData := True;
      ShowAbaCadastro( reverterResult );
      //NFSeFrame1.Setup( reverterResult );
      UIUtils.ShowInfo('Reversão realizada com sucesso');
    end;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    reverterResult.Free();
    nota.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.btSalvarClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try try

    SalvarNFSe();

    Screen.Cursor := crDefault;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.btSubstituicaoClick(Sender: TObject);
var
  nota: NFSeModel;
begin
  if FData.IsEmpty() then
    Exit;

//  if not FAuditor.Processo('NFS012').Inserir()
//    .Permitido() then
//    Exit;
  try
    Screen.Cursor := crHourGlass;

    try
      nota := Container.GetInstance().ErpFeaturesFactory.CreateIniciarSubstuicaoNFSeUseCase().Executar(
        FData.fstr('ID'), vDadosIni.cod_empresa
      );

    except on E: Exception do
      begin
        UIUtils.HandleError(E);
        Exit;
      end;
    end;

    ShowAbaCadastro( nota );

  finally
    nota.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.ChecarAtualizacaoDadosFiscais;
var
  data: TDate;
begin
  data := StrToDateTimeDef(RegistroWin.Read('AtualizacaoDadosFiscais', 'Data', ''), Date() - 1);
  if data < Date() then
  begin
    try try
      DFeDLLAdapter.ResolverAtualizacaoDadosFiscais();
    except on E: Exception do
      begin
        UIUtils.ShowError( 'Erro na verificação da atualização daos dados fiscais: ' + E.Message );
      end;
    end;
    finally
      RegistroWin.Write('AtualizacaoDadosFiscais', 'Data', DateToStr(Date()));
    end;
  end;
end;

procedure TFrmCadNFSe.CriarNFSeDasOrdensDeServico(
  const NumerosOSs: TArrayInteger; CriarEmitir: Boolean; out CloseFormulario: Boolean
);
var
  emissaoOutput: EmissaoLoteNFSeOutput;
  nota: NFSeModel;
begin
  emissaoOutput := nil;
  Screen.Cursor := crHourGlass;
  try //try

    if not FAuditor.Processo('NFS038').SetMensagem(
        'OS: ' + StringService.Join(',', ArrayService.IntArrayToStringArray(NumerosOSs))
      ).Inserir()
      .Permitido() then
      Exit;

    emissaoOutput := Container.GetInstance().ErpFeaturesFactory.CreateCriarEmitirNFSeAgrupadasUseCase()
      .Executar( CriarNFSeAgrupadasInput.Create(
        NumerosOSs, False, True, True, CriarEmitir
    ));

    CloseFormulario := (emissaoOutput.TotalNotasCriadas > 0); // Qualquer nota criada fecha o formulário

    if CriarEmitir then
      TratarRespostaEmissaoEmLote( emissaoOutput, 'Criadas' )

    else if Length(emissaoOutput.NFSeIDs) = 1 then
    begin
      nota := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar(emissaoOutput.NFSeIDs[0] );
      try
        if nota <> nil then
          ShowAbaCadastro(nota);
      finally
        nota.Free();
      end;
    end
    else
    begin
      if not Assigned(emissaoOutput) then
        raise EValidacaoNegocio.Create('TratarRespostaEmissaoEmLote NFSe = Resposta vazia');

      emissaoOutput.Validacoes.RaiseIfNotIsValid();
    end;
  finally
    Screen.Cursor := crDefault;
    emissaoOutput.Free();
  end;
end;

function TFrmCadNFSe.SelecionarOrdensDeServicoParaCriacaoDeNFSe(const NumerosOSs: TArrayInteger): Boolean;
var
  form: TFrmCadNFSeCriarAPartirDeOS;
begin
  form := TFrmCadNFSeCriarAPartirDeOS.Create(nil);
  Screen.Cursor := crHourGlass;
  try 
    try
      form.Setup(TFrmCadNFSeCriarAPartirDeOSInput.Create(
        Container.GetInstance().ErpFeaturesFactory.CreateObterConfiguracaoNFSeUseCase().Executar( vDadosIni.cod_empresa ),
        NumerosOSs        
      ));
    finally
      Screen.Cursor := crDefault;
    end;

    form.Callback := CriarNFSeDasOrdensDeServico;
         
    Result := form.ShowModal() = mrOk;

  finally
    form.Free();
  end;
end;

procedure TFrmCadNFSe.SetupAlteracao(const Nota: NFSeModel);
begin
  NFSeFrame1.Setup( Nota, FAuditor );

  btEnviarConsultar.Visible := Nota.NFSe.NaturezaEmissao = nemtPrestadorWS;
  BitBtn4.Visible := Nota.NFSe.NaturezaEmissao <> nemtPrestadorWS;

  btEnviarConsultar.Enabled := Nota.NFSe.Situacao in [ sdpsRascunho, sdpsRejeicao, sdpsEmissao, sdpsEmProcessamento ];
//  btConsultarEmissao.Visible := (Nota.NFSe.NaturezaEmissao = nemtPrestadorWS)
//    and (Nota.NFSe.Situacao in [ sdpsEmissao, sdpsEmProcessamento ]);

//  btReverterAutorizacao.Visible := (Nota.NFSe.Situacao = sdpsAutorizada)
//    and (Nota.NFSe.NaturezaEmissao <> nemtPrestadorWS);

  ReverterAutorizacao1.Enabled   := not Nota.NFSe.IsEmissaoSistema() and (Nota.NFSe.Situacao = sdpsAutorizada);
  ConsultarSituacaoNFSe1.Enabled := Nota.NFSe.IsEmissaoSistema() and (Nota.NFSe.Situacao in [ sdpsEmissao, sdpsEmProcessamento ]);
  AlterarNaturezaEmissaoPortal1.Enabled := Nota.NFSe.IsEmissaoSistema() and Nota.NFSe.IsEmissaoPropria and Nota.NFSe.EstaEmDigitacao();
  AlterarNaturezaEmissaoWS1.Enabled := not Nota.NFSe.IsEmissaoSistema() and Nota.NFSe.IsEmissaoPropria and Nota.NFSe.EstaEmDigitacao();

  BitBtn4.Enabled := Nota.NFSe.EstaEmDigitacao(); //Nota.NFSe.Situacao in [ sdpsRascunho, sdpsRejeicao ];
  btSalvar.Enabled := Nota.NFSe.EstaEmDigitacao();
end;

procedure TFrmCadNFSe.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  SitNFSe: Integer;
begin
  // Verifica se a coluna atual é a de 'SITUACAO'
  if Column.FieldName = 'SITUACAO' then
  begin
    SitNFSe := Column.Field.AsInteger;

    // Define as cores baseadas na lógica solicitada
    case SitNFSe of
      1: // Rascunho (Verde suave - OK, trabalhando)
        begin
          DBGrid1.Canvas.Brush.Color := $00D9FFD9; // Verde claro
          DBGrid1.Canvas.Font.Color  := clGreen;
        end;
      2: // Rejeitada (Vermelho suave - Alerta/Urgência)
        begin
          DBGrid1.Canvas.Brush.Color := $00CCCCFF; // Vermelho/Rosa claro
          DBGrid1.Canvas.Font.Color  := clRed;
        end;
      3, 4: // Em Emissão / Processamento (Amarelo/Laranja suave - Cuidado/Aguarde)
        begin
          DBGrid1.Canvas.Brush.Color := $00D1F1FF; // Amarelo palha
          DBGrid1.Canvas.Font.Color  := $000066CC; // Laranja escuro ou Marrom
        end;
    end;

    // Se a linha estiver selecionada no grid, mantém o destaque padrão de seleção
    // para não "cegar" o usuário ao clicar na linha
    if gdSelected in State then
    begin
      DBGrid1.Canvas.Brush.Color := clHighlight;
      DBGrid1.Canvas.Font.Color  := clHighlightText;
    end;

    // Aplica as cores e desenha o fundo
    DBGrid1.Canvas.FillRect(Rect);
    
    // Desenha o texto original do campo centralizado verticalmente
    DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFrmCadNFSe.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    SpeedButton1.Click;
end;

procedure TFrmCadNFSe.EmissaoPropriaViaWebService1Click(Sender: TObject);
var
  dps: NFSeModel;
begin
  if not FAuditor.Processo('NFS012').Inserir()
    .Permitido() then
    Exit;

  Screen.Cursor := crHourGlass;
  try try
    dps := Container.GetInstance().ErpFeaturesFactory.CreateIniciarDpsVazioUseCase().Executar(
      InicializarDpsModel.Create( Now(), nemtPrestadorWS)
    );
    ShowAbaCadastro(dps);

  except on E: Exception do
    begin
      UIUtils.HandleError(E);
      Exit;
    end;
  end;
  finally
    dps.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.EmissaoPropriaViaPortal1Click(Sender: TObject);
var
  dps: NFSeModel;
begin
  inherited;
  if not FAuditor.Processo('NFS013').Inserir()
    .Permitido() then
    Exit;

  Screen.Cursor := crHourGlass;
  try try
    dps := Container.GetInstance().ErpFeaturesFactory.CreateIniciarDpsVazioUseCase().Executar(
      InicializarDpsModel.Create( Now(), nemtPrestadorPortal )
    );
    ShowAbaCadastro(dps);

  except on E: Exception do
    begin
      UIUtils.HandleError(E);
      Exit;
    end;
  end;
  finally
    dps.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.EmissaoTerceiros1Click(Sender: TObject);
var
  dps: NFSeModel;
begin
  inherited;
  if not FAuditor.Processo('NFS014').Inserir()
    .Permitido() then
    Exit;

  Screen.Cursor := crHourGlass;
  try try
    dps := Container.GetInstance().ErpFeaturesFactory.CreateIniciarDpsVazioUseCase().Executar(
      InicializarDpsModel.Create( Now(), nemtTomadorTerceiros )
    );
    ShowAbaCadastro(dps);

  except on E: Exception do
    begin
      UIUtils.HandleError(E);
      Exit;
    end;
  end;
  finally
    dps.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.EmitirLoteNFSe(const NFSeIDs, Emails: TArrayString);
var
  emissaoOutput: EmissaoLoteNFSeOutput;
begin
  emissaoOutput := nil;
  Screen.Cursor := crHourGlass;
  try try
    emissaoOutput := Container.GetInstance().ErpFeaturesFactory.CreateEmitirLoteNFSeUseCase()
      .Executar( EmitirLoteNFSeInput.Create(
        NFSeIDs, vDadosIni.cod_empresa, False, Emails
    ));
    TratarRespostaEmissaoEmLote( emissaoOutput, 'Selecionadas' );

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    emissaoOutput.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.ExibirHistoricoNFSe(const NFSeId: string);
begin
  Application.CreateForm(TFrmCadNFSeHistorico, FrmCadNFSeHistorico);
  try
    FrmCadNFSeHistorico.Setup( NFSeId );

    FrmCadNFSeHistorico.ShowModal();

  finally
    FreeAndNil(FrmCadNFSeHistorico);
  end;
end;

procedure TFrmCadNFSe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(FData) then
    FreeAndNil(FData);

  Action := caFree;
  FrmCadNFSe := nil;

  inherited;
end;

procedure TFrmCadNFSe.FormCreate(Sender: TObject);
var
  builder: IFieldsConfigBuilder;
begin
  TelaCadastro := vDadosIni.vTipoForm;

  FData := TNFSeDataSet.Create();
  FAuditor := FData.Auditor;
  builder := FieldsConfigFactory.Create();

  DBGrid1.DataSource := FData._dataSourceOOP;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol);
  //configurarGridPeloConfigColunas(DBGrid1);
  FData.Setup(builder);
                                                                             
  FilterFramePadrao1.OnFieldChange := FData.HandleFilterField;
  FilterFramePadrao1.TodosToggle(True).FillForm(FData.dataSet, nil, 'Todos');

  FFormValidator := UIFormValidatorFactory.Create()
    .Builder(NFSeMetadata.GetMetadata(), btSalvar)
    .Bind('OperacaoInternaId', 'Operação Interna', NFSeFrame1.ComboBoxOpInternasFrame1.edOpInternas)
    .Bind('DCompet', builder.List.Field['DCompet'].DisplayLabel, NFSeFrame1.edDataPrestacao)
    .Bind('DHEmi', builder.List.Field['DHEmi'].DisplayLabel, NFSeFrame1.edDhemi)
    .Bind('DhProc', NFSeFrame1.edDhProcessamento)
    //.Bind('TomadorId', 'Tomador do Serviço', NFSeFrame1.DPSPartPrincipalFrame1.edCpfCnpj)
    .Bind('TomadorId', 'Tomador do Serviço', NFSeFrame1.edCodCliente)
    //.Bind('PrestadorId', 'Prestador do Serviço', NFSeFrame1.DPSPartPrincipalFrame1.edCpfCnpj)
    .Bind('PrestadorId', 'Prestador do Serviço', NFSeFrame1.edCodCliente)
    .Bind('CodServico', 'Serviço', NFSeFrame1.edCodServico)
    .Bind('CCNAE', builder.List.Field['CCNAE'].DisplayLabel, NFSeFrame1.edCcnae)
    .Bind('CLC116', builder.List.Field['CLC116'].DisplayLabel, NFSeFrame1.edClc116)
    .Bind('XDescServ', builder.List.Field['XDescServ'].DisplayLabel, NFSeFrame1.edDiscriminacao)
    .Bind('DestIbsCbsId', 'Destinatário IBSCBS', NFSeFrame1.DPSDestIbsCbsFrame1.edCpfCnpj)
    .Bind('CTribNac', builder.List.Field['CTribNac'].DisplayLabel, NFSeFrame1.edCTribNac)
    .Bind('VServ', builder.List.Field['VServ'].DisplayLabel, NFSeFrame1.edVServ)
    .Bind('Serie', builder.List.Field['Serie'].DisplayLabel, NFSeFrame1.edSerie)
    .Bind('NNFSe', 'Numero NFSe', NFSeFrame1.edNumeroNFSe)
    .Bind('ChaveNFSe', 'Chave NFSe', NFSeFrame1.edChave)                               
//    .Bind('PTotTribSN', builder.List.Field['PTotTribSN'].DisplayLabel, NFSeFrame1.edvtrib_ptot)
//    .Bind('PTotTribMun', builder.List.Field['PTotTribMun'].DisplayLabel, NFSeFrame1.edvtrib_pmun)

//    falta adicionar os outros campos aqui

    .Bind('Substituida.Chave', builder.List.Field['s_chave'].DisplayLabel, NFSeFrame1.edSubChave)
    .Bind('Substituida.XMotivo', builder.List.Field['s_xmotivo'].DisplayLabel, NFSeFrame1.edSubXMotivo)
    .Bind('Substituida.CMotivo', builder.List.Field['s_cmotivo'].DisplayLabel, NFSeFrame1.edSubCMotivo)
    .Bind('Substituida.NNFSe', builder.List.Field['s_nnfse'].DisplayLabel, NFSeFrame1.edSubNNFSe)
    .Bind('TpRetPisCofins', 'Retenção Federal PIS/COFINS', NFSeFrame1.edRetPISCOFINS)
    .Validator();

  DbGridConfigUtils.ApplyToDBGrid(DBGrid1, builder.List);
  PrimeiraPesquisa := False;

  inherited;

  Self.FieldSelection := FData.ffield('sel');

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadNFSe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_INSERT then
    BitBtn3.Click;
end;

procedure TFrmCadNFSe.FormShow(Sender: TObject);
begin
  PageControl3.ActivePage := tabCadastro;
  PageControl1.ActivePage := TabSheet2;
  Panel1.Visible := True;
//  tabCadastro.TabVisible := True;

  if vShow <> 1 then
    inherited;
end;

procedure TFrmCadNFSe.ModuloNFSeAntigo1Click(Sender: TObject);
begin
  if not FAuditor.Processo('NF0108').Visualizar.Permitido() then
    Exit;

  LegacyDFeDLLAdapter.ShowModuloNFSe(vDadosIni.vBancoHW, vDadosIni.cod_empresa, vDadosIni.vNomeUsuario);
end;

procedure TFrmCadNFSe.popMenuNovaPopup(Sender: TObject);
var
  DPS: NFSeModel;
begin
  // 1 = Nova, 2 = Interno
  EmissaoPropriaViaWebService1.Visible := popMenuNova.Tag = 1;// Novo
  EmissaoPropriaViaPortal1.Visible     := popMenuNova.Tag = 1;// Novo
  EmissaoTerceiros1.Visible            := popMenuNova.Tag = 1;// Novo

  ReverterAutorizacao1.Visible          := popMenuNova.Tag = 2;
  ConsultarSituacaoNFSe1.Visible        := popMenuNova.Tag = 2;
  AlterarNaturezaEmissaoPortal1.Visible := popMenuNova.Tag = 2;
  AlterarNaturezaEmissaoWS1.Visible     := popMenuNova.Tag = 2;
  
  ConfiguracoesNFSe1.Visible := popMenuNova.Tag = 3;
  ModuloNFSeAntigo1.Visible  := popMenuNova.Tag = 3;
end;

function TFrmCadNFSe.SalvarNFSe(): Boolean;
var
  createResult: ResultadoNFSeOutput;
  DPS: NFSeModel;
begin
  Result := False;
  DPS := NFSeFrame1.GetDPS();
  try
    if not FAuditor.Processo(
      IfThen(
        DPS.NFSe.NaturezaEmissao = nemtTomadorTerceiros, 'NFS016', 'NFS015' ),
        DPS.NFSe.GetAuditLabel(),
        DPS.NFSe.GetAuditKey()
      ).Salvar().Permitido() then
      Exit;

    createResult :=
      Container.GetInstance().ErpFeaturesFactory.CreateSalvarNFSeUseCase()
      .Executar(DPS);

    if not createResult.Validacoes.IsValid then
      FFormValidator.Validate(createResult.Validacoes)

    else
    begin
      Result := True;
      FNeedRefreshData := True;
      FAuditor.Sucesso().GravarMensagemProcesso('');

      if createResult.Retorno <> nil then
      begin
        DPS.Free();
        DPS := createResult.ExtractNFSe();

        SetupAlteracao( DPS );
      end;
    end;

  finally
    DPS.Free();
    createResult.Free();
  end;
end;

procedure TFrmCadNFSe.ShowAbaCadastro(ANFSe: NFSeModel);
begin
  FFormValidator.Reset();

  NFSeFrame1.Reset();

  SetupAlteracao( ANFSe );

  BitBtn4.Left := btEnviarConsultar.Left;
  BitBtn4.Top := btSalvar.Top;

  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tabCadastro;
end;

procedure TFrmCadNFSe.ShowAbaConsulta;
begin
  BitBtn5Click(BitBtn5); // uCadPadraoModal
end;

procedure TFrmCadNFSe.SpeedButton10Click(Sender: TObject);
var
  nota: NFSeModel;
  resultadoOp: ResultadoOperacaoDFe;
begin
  if FData.IsEmpty() then
    Exit;

  nota := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar(FData.fstr('id'));
  try try
    if nota = nil then
      raise EValidacaoNegocio.Create('NFSe não encontrada no banco de dados');

    if not FAuditor.Processo( 'NFS028', nota.NFSe.GetAuditLabel(), nota.NFSe.GetAuditKey())
      .Validar().Permitido() then
      Exit;

    if not (nota.NFSe.Situacao in [ sdpsAutorizada, sdpsCancelada, sdpsSubstituida]) then
      raise EValidacaoNegocio.Create('Impressão não permitida para essa situação da NFSe');

    if not nota.NFSe.IsEmissaoSistema() then
      raise EValidacaoNegocio.Create('Não é possível imprimmir uma NFSe emtida fora do Sistema');

    DFeDLLAdapter.CallFeaturesNFSe( DFeDLLAdapter.InputNFSe( nota.NFSe.Id, nota.NFSe.CodEmpresa, False, [ dftImprimir ]));
    
  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    nota.NFSe.Free;
  end;
end;

procedure TFrmCadNFSe.SpeedButton1Click(Sender: TObject);
var
  nota: NFSeModel;
begin
  nota := nil;
  Screen.Cursor := crHourGlass;
  try
    ChecarAtualizacaoDadosFiscais();

    if FData.IsEmpty() then
      Exit;

    nota := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar(FData.fstr('id'));

    if nota = nil then
    begin
      ShowAtencao('Registro não se encontra mais disponível');
      exit;
    end;

    if not FAuditor.Processo(
        IfThen( nota.NFSe.NaturezaEmissao = nemtTomadorTerceiros, 'NFS027', 'NFS026' ),
        nota.NFSe.GetAuditLabel(),
        nota.NFSe.GetAuditKey()
      ).Salvar().Permitido()
    then
      Exit;

    ShowAbaCadastro(nota);

  finally
    nota.Free();
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadNFSe.SpeedButton2Click(Sender: TObject);
begin
  if FData.IsEmpty() or
    (ShowConfirmacao('Deseja mesmo descartar o Rascunho da NFSe?') <>
      ID_YES) then
    Exit;

  if not FData.GetAuditorFill('NFS022').Excluir().Permitido() then
    Exit;

  try
    Container.GetInstance().ErpFeaturesFactory.CreateExcluirRascunhoNFSeUseCase()
      .Executar(FData.fstr('id'), vDadosIni.cod_empresa);

    FAuditor.Sucesso().GravarMensagem('');

    FData.Refresh();

  except
    on E: Exception do
      UIUtils.HandleError(E);
  end;
end;

procedure TFrmCadNFSe.SpeedButton9Click(Sender: TObject);
begin
  if FData.IsEmpty() then
    Exit;

  if not FData.GetAuditorFill('NFS035').Validar.Permitido() then
    Exit;

  ExibirHistoricoNFSe( FData.fstr('id') );
end;

procedure TFrmCadNFSe.TratarRespostaEmissaoEmLote(RespostaEmissao: EmissaoLoteNFSeOutput; const CaptionNotas: string);
var
  anexo: string;
  anexos: TArrayString;
  NFSeIDsArrayTmp: TArrayString;
  vAplicativo: TAplicativoEnv;
  vArrayAplicativo: arrayaplicativo;
  vArrayContato: arraycontato;
  vUtilizarArrayContato: Boolean;
  vAssunto, vMensagem: string;
  vClienteId: Integer;
  vEnvUnicaMens, vAnexarPdfs: Boolean;
  I, J: Integer;
  vStringListErros: TStringList;
  nota: NFSeModel;
begin
  try try
    if not Assigned(RespostaEmissao) then
      raise EValidacaoNegocio.Create('TratarRespostaEmissaoEmLote NFSe = Resposta vazia');

    if (RespostaEmissao.TotalEmEmissao > 0)
      or (RespostaEmissao.TotalNotasRejeitadas > 0)
      or (RespostaEmissao.TotalFalhaRegistradas > 0)
      or (RespostaEmissao.TotalFalhasNaoTratadas > 0) then
    begin
      UIUtils.ShowInfo(Format(
        'Total Notas %s: %d. ' + sLineBreak +
        'Total Notas Autorizadas: %d. ' + sLineBreak +
        'Total Notas ainda em Emissão: %d. ' + sLineBreak +
        'Total Notas Rejeitadas: %d. ' + sLineBreak +
        'Total de Falhas registradas no log de Notas: %d. ' + sLineBreak +
        'Total de Falhas de execução gravadas no log do sistema: %d. ',
        [
          CaptionNotas,
          RespostaEmissao.TotalNotasCriadas,
          RespostaEmissao.TotalNotasAutorizadas,
          RespostaEmissao.TotalEmEmissao,
          RespostaEmissao.TotalNotasRejeitadas,
          RespostaEmissao.TotalFalhaRegistradas,
          RespostaEmissao.TotalFalhasNaoTratadas
        ]
      ));
    end;

    RespostaEmissao.Validacoes.RaiseIfNotIsValid();

    FAuditor.Sucesso.GravarMensagemProcesso(Trim(
      IfThen(RespostaEmissao.TotalNotasCriadas > 0,  ' CRIADAS: ' + IntToStr(RespostaEmissao.TotalNotasCriadas))
      + IfThen(RespostaEmissao.TotalNotasAutorizadas > 0, ' AUTORIZADAS: ' + IntToStr(RespostaEmissao.TotalNotasAutorizadas))
      + IfThen(RespostaEmissao.TotalEmEmissao > 0, ' EMISSAO: ' + IntToStr(RespostaEmissao.TotalEmEmissao))
      + IfThen(RespostaEmissao.TotalNotasRejeitadas > 0, ' REJEITADAS: ' + IntToStr(RespostaEmissao.TotalNotasRejeitadas))
    ));

    if (Length(RespostaEmissao.NFSeIDsAutorizadas) > 0)  and
      Container.GetInstance().ErpFeaturesFactory.CreateObterConfiguracaoNFSeUseCase().Executar( vDadosIni.cod_empresa )
      .UsarMensageriaAI then
    begin
      try
      	if (RespostaEmissao.TotalNotasCriadas = 1) and (Length(RespostaEmissao.NFSeIDsAutorizadas) = 1) then
        begin
          nota := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeUseCase().Executar(RespostaEmissao.NFSeIDsAutorizadas[0]);
          try
            if nota <> nil then
            begin
              vClienteId := nota.NFSe.CodCliente.Value;
            end;
          finally
            nota.Free();
          end;
        end
        else
          vClienteId := 0;

        if not vDadosIni.sincronizarDadosContatoClienteAplicativo(vClienteId) then
        	Exit;

        vStringListErros := TStringList.Create;
        vStringListErros.Clear;

      	Application.CreateForm(TFrmEnviarMensagem, FrmEnviarMensagem);
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Add('Enviar única mensagem');
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Add('Anexar PDFs');

        FrmEnviarMensagem.FrameCheckListaContato.CodCliente := vClienteId;
        FrmEnviarMensagem.FrameCheckListaContato.Origem := cNfse;
        FrmEnviarMensagem.FrameCheckListaContato.UnicoMens := False;

        if FrmEnviarMensagem.ShowModal <> ID_OK then
          Exit;

        vArrayAplicativo := vDadosIni.retornaArrayAplicativo(FrmEnviarMensagem.FrameCheckListaContato.CheckListBoxAplicativo, True);
        vArraycontato    := vDadosIni.retornaArrayContato(FrmEnviarMensagem.FrameCheckListaContato.CheckListBoxContato, True);

        vUtilizarArrayContato := Length(vArrayContato) > 0;

        vEnvUnicaMens  := FrmEnviarMensagem.EnvUnicaMens;
        vAnexarPdfs    := FrmEnviarMensagem.AnexarPdfs;

      	try
        	for I := 0 to Length(RespostaEmissao.NFSeIDsAutorizadas) - 1 do
          begin
            if vEnvUnicaMens then
              anexos := Container.GetInstance().ErpFeaturesFactory.CreateCriarAnexosEmailPorNFSeIdUseCase().Executar(
                RespostaEmissao.NFSeIDsAutorizadas, vAnexarPdfs
              )
            else
            begin
            	SetLength(NFSeIDsArrayTmp, 1);
              NFSeIDsArrayTmp[0] := RespostaEmissao.NFSeIDsAutorizadas[I];
              anexos := Container.GetInstance().ErpFeaturesFactory.CreateCriarAnexosEmailPorNFSeIdUseCase().Executar(
                NFSeIDsArrayTmp, vAnexarPdfs
              );
            end;

            if vUtilizarArrayContato then
         		begin
              for J := 0 to Length(vArrayContato) - 1 do
              begin
                 vDadosIni.retornaMensagemEnv(cNfse, vArraycontato[J].Aplicativo, vAssunto, vMensagem);

                 try
                   if not vDadosIni.EnvEmail(
                     vAssunto,
                     vMensagem,
                     vClienteId,
                     vArrayContato[J].Aplicativo,
                     vDadosIni.IfThen(vEnvUnicaMens, 0, StrToInt(RespostaEmissao.NFSeIDsAutorizadas[I])),
                     vDadosIni.IfThen(vEnvUnicaMens, '', OrigemEnvStr[cNfse]),
                     cNfse,
                     StringService.Join(sLineBreak, anexos),
                     Length(anexos),
                     True,
                     vArrayContato[J].Identificacao,
                     vArrayContato[J].Contato,
                     vArrayContato[J].Avulso) then
                   begin
                     if vStringListErros.Count = 10 then
                     	 vStringListErros.Add('...');
                     if vStringListErros.Count < 10 then
                       vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                   end;
                 except
                   if vStringListErros.Count = 10 then
                   	 vStringListErros.Add('...');
                   if vStringListErros.Count < 10 then
                     vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                 end;
              end;

              if vEnvUnicaMens then
                Break;
            end
            else
            begin
            	for vAplicativo in vArrayAplicativo do
           		begin
                vDadosIni.retornaMensagemEnv(cNfse, vAplicativo, vAssunto, vMensagem);

                FData.SqlOpen(' select cod_cliente from nfse ' +
                	' where id = ' + RespostaEmissao.NFSeIDsAutorizadas[I], FData.buscas);
                vClienteId := FData.buscas.FieldByName('cod_cliente').AsInteger;

                if not vDadosIni.sincronizarDadosContatoClienteAplicativo(vClienteId) then
              		Exit;

                vArrayContato := vDadosIni.retornaArrayContato(vClienteId, vAplicativo, cNfse, False);

                for J := 0 to Length(vArrayContato) - 1 do
                begin
                   try
                     if not vDadosIni.EnvEmail(
                       vAssunto,
                       vMensagem,
                       vClienteId,
                       vArrayContato[J].Aplicativo,
                       vDadosIni.IfThen(vEnvUnicaMens, 0, StrToInt(RespostaEmissao.NFSeIDsAutorizadas[I])),
                       vDadosIni.IfThen(vEnvUnicaMens, '', OrigemEnvStr[cNfse]),
                       cNfse,
                       StringService.Join(sLineBreak, anexos),
                       Length(anexos),
                       True,
                       vArrayContato[J].Identificacao,
                       vArrayContato[J].Contato,
                       vArrayContato[J].Avulso) then
                     begin
                       if vStringListErros.Count = 10 then
                     	   vStringListErros.Add('...');
                       if vStringListErros.Count < 10 then
                         vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                     end;
                   except
                     if vStringListErros.Count = 10 then
                     	 vStringListErros.Add('...');
                     if vStringListErros.Count < 10 then
                       vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                   end;
                end;
              end;
            end;
          end;

          if vStringListErros.Count > 0 then
          	Application.MessageBox(PChar(vStringListErros.Text), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);          
        finally
          for anexo in anexos do
          	if FileExists(anexo) then
          		DeleteFile(anexo);
        end;
      finally
      	if Assigned(vStringListErros) then
        	FreeAndNil(vStringListErros);

        if Assigned(FrmEnviarMensagem) then
        begin
          FrmEnviarMensagem.Free;
          FrmEnviarMensagem := nil;
        end;
      end;
    end;

  finally
    if Assigned(RespostaEmissao) then
      for I := 0 to High(RespostaEmissao.ArquivosPDF) do
        DeleteFile(RespostaEmissao.ArquivosPDF[I]);
  end;
  except on E: Exception do
    begin
      FAuditor.Falha.GravarMensagemProcesso('');
      UIUtils.HandleError(E);
    end;
  end;
end;

end.
