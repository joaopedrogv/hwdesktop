unit UVincularProdutosGruposFiscais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  uDataSet_OOP, IProgressObserverUnit,
  TipoTributoFiscalEnumUnit, Mask, DbGridNcmsGrupoFiscalVincularFrameUnit, 
  ProgressWithLogFrameUnit, DBGridProdutosGrupoFiscalVincularFrameUnit,
  ComboboxEntityPickerFrameUnit, ComboBoxGruposFiscaisFrameUnit;

type
  TFrmVincularProdutosGruposFiscaisTipo = (
    fvcpVinculoExistente1para1,
    fvcpVinculoExistenteNpara1,
    fvcpVinculoIncompativeis
  );

  TFrmVincularProdutosGruposFiscaisSetup = record
  private
    FTipoTributo: TipoTributoFiscalEnum;
    FDataReferencia: TDate;
    FTipoVinculo: TFrmVincularProdutosGruposFiscaisTipo;
    FDataRevisao: TDateTime;
  public
    class function Create(
      TipoVinculo: TFrmVincularProdutosGruposFiscaisTipo;
      TipoTributo: TipoTributoFiscalEnum;
      DataReferencia: TDate;
      DataRevisao: TDate
    ): TFrmVincularProdutosGruposFiscaisSetup; static;

    property TipoVinculo: TFrmVincularProdutosGruposFiscaisTipo read FTipoVinculo;
    property TipoTributo: TipoTributoFiscalEnum read FTipoTributo;
    property DataReferencia: TDate read FDataReferencia;
    property DataRevisao: TDateTime read FDataRevisao;
  end;

  TFrmVincularProdutosGruposFiscais = class(TfrmPadrao)
    pnTop: TPanel;
    Label1: TLabel;
    pnBottom: TPanel;
    btSair: TBitBtn;
    pnParams: TPanel;
    Label3: TLabel;
    lbTipoTributo: TLabel;
    lbTipoVinculo: TLabel;
    DbGridNcmsGrupoFiscalVincularFrame1: TDbGridNcmsGrupoFiscalVincularFrame;
    DBGridProdutosGrupoFiscalVincularFrame1: TDBGridProdutosGrupoFiscalVincularFrame;
    pnNCM: TPanel;
    pnProdutos: TPanel;
    pnLinksProdutos: TPanel;
    linkVincularProdutos: TLabel;
    linkVerPorNCM: TLabel;
    pnLinksNCM: TPanel;
    linkVincularUsandoNCM: TLabel;
    linkVerProdutosPorNCM: TLabel;
    linkVerTodososProdutos: TLabel;
    Splitter1: TSplitter;
    pnContent: TPanel;
    edDataRevisao: TMaskEdit;
    pnGrupoFiscal: TPanel;
    Label2: TLabel;
    btSelecaoContinuar: TBitBtn;
    btCancelSelecao: TBitBtn;
    ComboBoxGruposFiscaisFrame1: TComboBoxGruposFiscaisFrame;
    procedure btCancelSelecaoClick(Sender: TObject);
    procedure edDataRevisaoExit(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure linkVerPorNCMClick(Sender: TObject);
    procedure linkVerProdutosPorNCMClick(Sender: TObject);
    procedure linkVerTodososProdutosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FDataSet: TDataSet_OOP;
    FTipoTributo: TipoTributoFiscalEnum;
    FDataReferencia: TDate;
    FDataRevisao: TDateTime;
    FTipoVinculo: TFrmVincularProdutosGruposFiscaisTipo;
    FProgressObs: IProgressObserver;
    FProgressWithLogFrame: TProgressWithLogFrame;
    FResultOK: Boolean;

    procedure ExecutarConsultaNcm();
    procedure ExecutarConsultaProdutos();
    procedure ExecutarConsultaProdutosPorNcm(const Ncm: string);

    procedure VincularUsandoNcm1Para1(Sender: TObject);
    procedure VincularUsandoProdutos1Para1(Sender: TObject);

    procedure VincularUsandoNNcmsPara1(Sender: TObject);
    procedure VincularUsandoNProdutosPara1(Sender: TObject);

    procedure SelecionarGrupoFiscalAntesDeVincular(Sender: TObject);

    procedure StartProcessEvent();
    procedure EndsProcessEvent();
    procedure CancelProcessEvent();

    procedure NcmChange(const NCM: string);
  public
    procedure Setup(const Input: TFrmVincularProdutosGruposFiscaisSetup);
  end;

var
  FrmVincularProdutosGruposFiscais: TFrmVincularProdutosGruposFiscais;

implementation

uses
  uDtmAtivo,
  //TypInfo,
  Math,
  DateUtils,
  hw_utils,
  FieldsConfigUnit,
  StringServiceUnit,
  DBGridFrameUnit,
  EnumServiceUnit, TiposTributosServiceUnit, TipoTributoEnumUnit, ContainerUnit,
  UIProgressObserverUnit, ProdutoGrupoFiscalUpdateModelUnit, StringNullableUnit,
  ProdutoNcmGrupoFiscalUpdateModelUnit,
  GrupoFiscalEtdUnit, BaseClassUnit;

{$R *.dfm}

{ TFrmVincularProdutosGruposFiscaisSetup }

class function TFrmVincularProdutosGruposFiscaisSetup.Create(
  TipoVinculo: TFrmVincularProdutosGruposFiscaisTipo;
  TipoTributo: TipoTributoFiscalEnum;
  DataReferencia: TDate;
  DataRevisao: TDate
): TFrmVincularProdutosGruposFiscaisSetup;
begin
  Result.FTipoVinculo := TipoVinculo;
  Result.FTipoTributo := TipoTributo;
  Result.FDataReferencia := DataReferencia;
  Result.FDataRevisao := DataRevisao;
end;

{ TFrmVincularProdutosGruposFiscais }

procedure TFrmVincularProdutosGruposFiscais.btCancelSelecaoClick(
  Sender: TObject);
begin
  inherited;
  pnContent.Visible := True;
  pnGrupoFiscal.Visible := False;
end;

procedure TFrmVincularProdutosGruposFiscais.btSairClick(Sender: TObject);
begin
  if FResultOK then
    ModalResult := mrOk
  else
    Close();
end;

procedure TFrmVincularProdutosGruposFiscais.CancelProcessEvent;
begin
  if ShowConfirmacao('Deseja mesmo cancelar o processamento?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
    Exit;

  FProgressObs.CancelRequest();
end;

procedure TFrmVincularProdutosGruposFiscais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDataSet.Free();

  FrmVincularProdutosGruposFiscais := nil;
  Action := caFree;

  inherited;
end;

procedure TFrmVincularProdutosGruposFiscais.FormCreate(Sender: TObject);
begin
  FResultOK := False;
  FProgressWithLogFrame := TProgressWithLogFrame.Create(Self);
  FProgressWithLogFrame.Parent := Self;
  FProgressWithLogFrame.Visible := False;
  FProgressWithLogFrame.Align := alClient;

  pnGrupoFiscal.Align := alClient;

  //FProgressObs := UIProgressObserver.Create(
  //  DoLog, nil, DoLog, nil, DoCount, StartProcessEvent, CompleteProcessEvent, nil
  //);

  FProgressObs := UIProgressObserver.Create(
    FProgressWithLogFrame.OnMessage,
    FProgressWithLogFrame.OnWarning,
    FProgressWithLogFrame.OnError,
    FProgressWithLogFrame.OnProgress,
    FProgressWithLogFrame.OnCounter,
    StartProcessEvent,
    FProgressWithLogFrame.OnComplete,
    FProgressWithLogFrame.OnCancel
  );

  FProgressWithLogFrame.Setup(
    EndsProcessEvent,
    CancelProcessEvent
  );
end;

procedure TFrmVincularProdutosGruposFiscais.StartProcessEvent;
begin
  FProgressWithLogFrame.Start();
  FProgressWithLogFrame.Visible := True;
  pnContent.Visible := False;
end;

procedure TFrmVincularProdutosGruposFiscais.VincularUsandoNcm1Para1(
  Sender: TObject);
begin
  if ShowConfirmacao('Deseja mesmo executar a rotina', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then
    Exit;

  Screen.Cursor := crDefault;
  try
    Container.GetInstance().ErpFeaturesFactory.CreateAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase( FProgressObs )
      .Executar( DbGridNcmsGrupoFiscalVincularFrame1.GetSelecionados() );

    FResultOK := True;

    ExecutarConsultaNcm();
    if not pnNCM.Visible and pnProdutos.Visible then
      ExecutarConsultaProdutos();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.VincularUsandoNNcmsPara1(
  Sender: TObject);
var
  dados: ProdutoNcmGrupoFiscalUpdateModelArray;
  grupoFiscalId: StringNullable;
  I: Integer;
begin
  if ShowConfirmacao('Deseja mesmo executar a rotina', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then
    Exit;

  Screen.Cursor := crDefault;
  try
    grupoFiscalId := StringNullable.CreateOrNull( ComboBoxGruposFiscaisFrame1.GetGrupoFiscalId() );

    dados := DbGridNcmsGrupoFiscalVincularFrame1.GetSelecionados();
    for I := Low(dados) to High(dados) do
      dados[I].GrupoFiscalId := grupoFiscalId;

    Container.GetInstance().ErpFeaturesFactory.CreateAtualizarGruposFiscaisNoProdutoPorNcmEmLoteUseCase( FProgressObs )
      .Executar( dados );

    btCancelSelecao.Click;

    FResultOK := True;

    ExecutarConsultaNcm();
    if not pnNCM.Visible and pnProdutos.Visible then
      ExecutarConsultaProdutos();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.VincularUsandoNProdutosPara1(
  Sender: TObject);
var
  dados: ProdutoGrupoFiscalUpdateModelArray;
  grupoFiscalId: StringNullable;
  I: Integer;
begin
  if ShowConfirmacao('Deseja mesmo executar a rotina', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then
    Exit;

  Screen.Cursor := crDefault;
  try
    grupoFiscalId := StringNullable.CreateOrNull( ComboBoxGruposFiscaisFrame1.GetGrupoFiscalId() );

    dados := DBGridProdutosGrupoFiscalVincularFrame1.GetSelecionados();
    for I := Low(dados) to High(dados) do
      dados[I].GrupoFiscalId := grupoFiscalId;

    Container.GetInstance().ErpFeaturesFactory.CreateAtualizarGruposFiscaisNoProdutoEmLoteUseCase( FProgressObs )
      .Executar( dados );

    btCancelSelecao.Click;

    FResultOK := True;

    ExecutarConsultaNcm();
    if not pnNCM.Visible and pnProdutos.Visible then
      ExecutarConsultaProdutos();

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TFrmVincularProdutosGruposFiscais.SelecionarGrupoFiscalAntesDeVincular(
  Sender: TObject);
begin
  pnGrupoFiscal.Visible := True;
  pnContent.Visible := False;

  if ComboBoxGruposFiscaisFrame1.edGruposFiscais.CanFocus then
    ComboBoxGruposFiscaisFrame1.edGruposFiscais.SetFocus();

  if Sender = linkVincularUsandoNCM then
    btSelecaoContinuar.OnClick := VincularUsandoNNcmsPara1  // Atribui esse metodo pois faz a mesma coisa, o compoente NcmGrid ja sabe que vai retornar apenas a selecao quando chamar GetSelecionados
  else
    btSelecaoContinuar.OnClick := VincularUsandoNProdutosPara1; // Atribui esse metodo pois faz a mesma coisa, o compoente NcmGrid ja sabe que vai retornar apenas a selecao quando chamar GetSelecionados
end;

procedure TFrmVincularProdutosGruposFiscais.VincularUsandoProdutos1Para1(
  Sender: TObject);
begin
  if ShowConfirmacao('Deseja mesmo executar a rotina', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) <> IDYES then
    Exit;

  Screen.Cursor := crDefault;
  try
    Container.GetInstance().ErpFeaturesFactory.CreateAtualizarGruposFiscaisNoProdutoEmLoteUseCase( FProgressObs )
      .Executar( DBGridProdutosGrupoFiscalVincularFrame1.GetSelecionados() );

    FResultOK := True;

    ExecutarConsultaNcm();
    if not pnNCM.Visible and pnProdutos.Visible then
      ExecutarConsultaProdutos();

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.EndsProcessEvent;
begin
  pnContent.Visible := True;
  FProgressWithLogFrame.Visible := False;
end;

procedure TFrmVincularProdutosGruposFiscais.ExecutarConsultaNcm;
begin
  case FTipoVinculo of
    fvcpVinculoExistente1para1:
      DbGridNcmsGrupoFiscalVincularFrame1.ExecutarUmParaUm( FDataRevisao );

    fvcpVinculoExistenteNpara1:
      DbGridNcmsGrupoFiscalVincularFrame1.ExecutarNParaUm( FDataRevisao );

    fvcpVinculoIncompativeis:
      DbGridNcmsGrupoFiscalVincularFrame1.ExecutarInconpativeis( FDataRevisao );
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.ExecutarConsultaProdutos;
begin
  case FTipoVinculo of
    fvcpVinculoExistente1para1:
      DBGridProdutosGrupoFiscalVincularFrame1.ExecutarUmProdutoParaUmAnexo( FDataRevisao );

    fvcpVinculoExistenteNpara1:
      DBGridProdutosGrupoFiscalVincularFrame1.ExecutarNProdutosParaUmAnexo( FDataRevisao );

    fvcpVinculoIncompativeis:
      DBGridProdutosGrupoFiscalVincularFrame1.ExecutarInconpativeis( FDataRevisao );
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.ExecutarConsultaProdutosPorNcm(
  const Ncm: string);
begin
  case FTipoVinculo of
    fvcpVinculoExistente1para1:
      DBGridProdutosGrupoFiscalVincularFrame1.ExecutarUmProdutoParaUmAnexoPorNCM( Ncm, FDataRevisao );

    fvcpVinculoExistenteNpara1:
      DBGridProdutosGrupoFiscalVincularFrame1.ExecutarNProdutosParaUmAnexoPorNCM( Ncm, FDataRevisao );

    fvcpVinculoIncompativeis:  
      DBGridProdutosGrupoFiscalVincularFrame1.ExecutarInconpativeisPorNcm( Ncm, FDataRevisao );
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.linkVerPorNCMClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if not pnNCM.Visible then
      ExecutarConsultaNcm();

    lbTipoVinculo.Caption := 'Produtos compativeis com 1 anexo apenas. Sem vínculo ou menor que a data de revisão:';

    pnNCM.Visible := True;
    pnProdutos.Visible := False; 
    pnProdutos.Align := alBottom;
    Splitter1.Visible := False;
    pnProdutos.Align := alBottom;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.linkVerProdutosPorNCMClick(
  Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    //DBGridProdutosGrupoFiscalVincularFrame1.Setup(
      //FTipoTributo,
      //FDataRevisao
    //);
    lbTipoVinculo.Caption := 'Produtos compativeis com 1 anexo apenas. Sem vínculo ou até a data de revisão:';

    pnProdutos.Align := alBottom;
    pnProdutos.Height := Trunc(IfThen(pnProdutos.Visible, pnProdutos.Height) + IfThen(pnNCM.Visible, pnNCM.Height) / 2);  
    pnProdutos.Visible := True;
    pnNCM.Visible := True;
    Splitter1.Visible := True;
    Splitter1.Top := pnProdutos.Top - 1;

    ExecutarConsultaProdutosPorNcm(
      DbGridNcmsGrupoFiscalVincularFrame1.GetSelecionado().NCM,
    );

    //testar o select tambem, pra ver pq, se ta usando o ncm deveria ser mais rapido

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.linkVerTodososProdutosClick(
  Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    ExecutarConsultaProdutos();
    lbTipoVinculo.Caption := 'Produtos compativeis com 1 anexo apenas. Sem vínculo ou até a data de revisão:';

    pnProdutos.Align := alClient;
    pnProdutos.Visible := True;
    pnNCM.Visible := False;
    Splitter1.Visible := False;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.edDataRevisaoExit(Sender: TObject);
begin
  inherited;
  if not TryStrToDateTime(edDataRevisao.Text, FDataRevisao) then
  begin
    ShowErro('Data de revisão inválida!');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
    ExecutarConsultaNcm();
    if not pnNCM.Visible and pnProdutos.Visible then
      ExecutarConsultaProdutos();
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.NcmChange(const NCM: string);
begin
  if pnProdutos.Visible then
  begin
    Screen.Cursor := crHourGlass;
    try
      if pnNCM.Visible and pnProdutos.Visible then
        ExecutarConsultaProdutosPorNcm(
          DbGridNcmsGrupoFiscalVincularFrame1.GetSelecionado().NCM
        );
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmVincularProdutosGruposFiscais.Setup(const Input: TFrmVincularProdutosGruposFiscaisSetup);
var
  gridInputNcm, gridInputProd: TDBGridFrameSetup;
begin
  FDataReferencia := Input.DataReferencia;
  FTipoTributo := Input.TipoTributo;
  FTipoVinculo := Input.TipoVinculo;
  FDataRevisao := IncMinute(Input.DataRevisao, -1);

  lbTipoTributo.Caption := TipoTributoFiscalEnumDisplay[FTipoTributo];


  case FTipoVinculo of
    fvcpVinculoExistente1para1:
      begin
        linkVincularUsandoNCM.OnClick := VincularUsandoNcm1Para1;
        linkVincularProdutos.OnClick := VincularUsandoProdutos1Para1;

        lbTipoVinculo.Caption := 'NCM''s compativeis com 1 anexo apenas. Sem vínculo ou até a data de revisão:';
        Caption := 'Configurar NCM''s/Produtos compativeis com 1 Anexo somente';

        gridInputNcm := TDBGridFrameSetup.CreateClean();
        gridInputProd := gridInputNcm;
      end;

    fvcpVinculoExistenteNpara1:
      begin
        ComboBoxGruposFiscaisFrame1.Setup( TSetupComboBoxGruposFiscaisFrame.Create(
          '', True, tcgfComAnexo
        ));

        linkVincularUsandoNCM.OnClick := SelecionarGrupoFiscalAntesDeVincular;
        linkVincularProdutos.OnClick := SelecionarGrupoFiscalAntesDeVincular;

        lbTipoVinculo.Caption := 'NCM''s compativeis com 1 anexo apenas. Sem vínculo ou até a data de revisão:';
        Caption := 'Configurar NCM''s/Produtos compativeis com mais de 1 Anexo';

        gridInputNcm := TDBGridFrameSetup.CreateSelection();
        gridInputProd := TDBGridFrameSetup.CreateSelection(glaLeft);
      end;

    fvcpVinculoIncompativeis:
      begin      
        ComboBoxGruposFiscaisFrame1.Setup( TSetupComboBoxGruposFiscaisFrame.Create(
          '', True, tcgfComAnexo
        ));

        linkVincularUsandoNCM.OnClick := SelecionarGrupoFiscalAntesDeVincular;
        linkVincularProdutos.OnClick := SelecionarGrupoFiscalAntesDeVincular;

        lbTipoVinculo.Caption := 'NCM''s incompativeis com o anexo do cadastro. Sem vínculo ou até a data de revisão:';
        Caption := 'Configurar NCM''s/Produtos incompativeis com o anexo do cadastro';

        gridInputNcm := TDBGridFrameSetup.CreateSelection();
        gridInputProd := TDBGridFrameSetup.CreateSelection(glaLeft);

        FDataRevisao := IncMinute(Date + 1, -1);
      end;
  end;

  edDataRevisao.Text := FormatDateTime( 'dd/MM/yyyy hh:mm', FDataRevisao );

  DbGridNcmsGrupoFiscalVincularFrame1.Setup( TDbGridNcmsGrupoFiscalVincularFrameSetup.Create(
    FTipoTributo,
    FDataReferencia,
    gridInputNcm,
    FTipoVinculo <> fvcpVinculoExistente1para1
  ));
  DbGridNcmsGrupoFiscalVincularFrame1.OnChange := NcmChange;
  ExecutarConsultaNcm();

  DBGridProdutosGrupoFiscalVincularFrame1.Setup( TDBGridProdutosGrupoFiscalVincularFrameSetup.Create(
    FTipoTributo,
    FDataReferencia,
    gridInputProd
  ));
end;

end.
