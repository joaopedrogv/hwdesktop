unit frmVeiculosZeroEntradaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, DataSnap.DBClient, Vcl.ComCtrls, Vcl.StdCtrls,
  uClasseConexao, BaseUseCaseRenave, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, Vcl.Menus, RenaveRepo,
  Vcl.DBCtrls, SolicitacaoSaidaEstoqueZeroModel, Vcl.Mask, IdBaseComponent,
  IdCoder, IdCoder3to4, IdCoderMIME;

type
  TformVeiculosZeroEntradaEstoque = class(TForm)
    TimerEstoque: TTimer;
    popMenu: TPopupMenu;
    Ajustardadoshodometro1: TMenuItem;
    Atualizarestoquerenave1: TMenuItem;
    page: TPageControl;
    ts_estoque: TTabSheet;
    ts_renave: TTabSheet;
    pn_estoque: TPanel;
    Panel2: TPanel;
    bt_check_all: TSpeedButton;
    bt_uncheck_all: TSpeedButton;
    bt_actions: TSpeedButton;
    btEntrarComEstoque: TBitBtn;
    Panel3: TPanel;
    Splitter1: TSplitter;
    grid_est: TDBGrid;
    pnProgress: TPanel;
    lbProgress: TLabel;
    ProgressBar1: TProgressBar;
    pn_error: TPanel;
    memoLog: TMemo;
    Panel1: TPanel;
    bt_close_pnerro: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    grid_est_renave: TDBGrid;
    N1: TMenuItem;
    ts_cidade: TTabSheet;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    btSairComEstoque: TBitBtn;
    Label1: TLabel;
    lb_mun_renave: TLabel;
    Label3: TLabel;
    btConfirmarMunicipio: TBitBtn;
    Panel10: TPanel;
    BitBtn3: TBitBtn;
    combo_cidades: TComboBox;
    Panel11: TPanel;
    bt_voltar_para_estoque: TBitBtn;
    ts_solicitacao_saida: TTabSheet;
    Panel12: TPanel;
    Panel13: TPanel;
    BitBtn2: TBitBtn;
    Panel14: TPanel;
    BitBtn4: TBitBtn;
    Panel15: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox1: TComboBox;
    Label6: TLabel;
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    MaskEdit2: TMaskEdit;
    Label8: TLabel;
    MaskEdit3: TMaskEdit;
    Label9: TLabel;
    MaskEdit4: TMaskEdit;
    AjustarcidadeRENAVEdocliente1: TMenuItem;
    VisualizarestoqueRENAVEdoitem1: TMenuItem;
    BitBtn1: TBitBtn;
    btCancelarEntrada: TBitBtn;
    btCancelarSaida: TBitBtn;
    N2: TMenuItem;
    VeculosZeropendentesdeentrada1: TMenuItem;
    N3: TMenuItem;
    Meusdadosecertificado1: TMenuItem;
    btDevolucaoMontadora: TBitBtn;
    Configuraoresponsvel1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TimerEstoqueTimer(Sender: TObject);
    procedure btEntrarComEstoqueClick(Sender: TObject);
    procedure memoLogChange(Sender: TObject);
    procedure bt_close_pnerroClick(Sender: TObject);
    procedure grid_estDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grid_estMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure grid_estKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_estDblClick(Sender: TObject);
    procedure grid_estCellClick(Column: TColumn);
    procedure bt_check_allClick(Sender: TObject);
    procedure bt_uncheck_allClick(Sender: TObject);
    procedure Ajustardadoshodometro1Click(Sender: TObject);
    procedure bt_actionsClick(Sender: TObject);
    procedure bt_voltar_para_estoqueClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btSairComEstoqueClick(Sender: TObject);
    procedure btConfirmarMunicipioClick(Sender: TObject);
    procedure AjustarcidadeRENAVEdocliente1Click(Sender: TObject);
    procedure VisualizarestoqueRENAVEdoitem1Click(Sender: TObject);
    procedure Atualizarestoquerenave1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btCancelarEntradaClick(Sender: TObject);
    procedure btCancelarSaidaClick(Sender: TObject);
    procedure VeculosZeropendentesdeentrada1Click(Sender: TObject);
    procedure Meusdadosecertificado1Click(Sender: TObject);
    procedure btDevolucaoMontadoraClick(Sender: TObject);
    procedure Configuraoresponsvel1Click(Sender: TObject);
  private
    FnfId: Integer;
    Fchassis: TArray<string>;

    dataSetEstoque: TConexao_OOP;
    dataSetRenave: TConexao_OOP;
    //FcpfResponsanvel: string;
    FuseCaseBase: TUseCaseBaseRenave;

    procedure disableControls;
    procedure EnableControls;

    procedure AtualizarEstoqueRenave(chs: TArray<string>);
    procedure HandleVinculoCidadeIBGE(payload: TAuxiliarCidade);
  public
    property nfId: Integer read FnfId write FnfId;
    property chassis: TArray<string> read Fchassis write Fchassis;
    //property cpfResponsanvel: string read FcpfResponsanvel write FcpfResponsanvel;
    property useCaseBase: TUseCaseBaseRenave read FuseCaseBase write FuseCaseBase;
  end;

var
  formVeiculosZeroEntradaEstoque: TformVeiculosZeroEntradaEstoque;

implementation

uses
  Winapi.ShellApi,
  hw_utils,
  Hw.Convert,
  ApiRenave,
  hw_win_utils,
  VeiculoEstoqueModel,
  VeiculoZeroKmPendenteEntradaEstoqueModel,
  SolicitacaoEntradaEstoqueZeroModel,
  SolicitacaoCancelamentoEntradaZeroKmModel,
  SolicitacaoCancelamentoSaidaZeroKmModel,
  frmInformarDadosHodometro,
  VeiculoDadosHodometroModel,
  rnv_municipio_class,
  MunicipioRenaveModel,
  UseCaseVeiculosZeroPendentes,
  UseCaseSelectCertificate, frmSolicitacaoDevolucaoMontadoraVeiculoZero;

function hw_config_sistema_dx( pChaveIdent, pUsuario: WideString; pCodEmpresa, pNivel: Integer): Integer; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TformVeiculosZeroEntradaEstoque.AjustarcidadeRENAVEdocliente1Click(
  Sender: TObject);
begin
  memoLog.Lines.Clear;
  Screen.Cursor := crHourGlass;
  try

    var api := TApiRenaveSingleton.GetInstance();
    var repo := TRenaveRepoSingleton.GetInstance();

    var payload := repo.GetSolicitacaoSaida(dataSetEstoque.fstr('chassi'), dataSetEstoque.fint('nf_id'));

    if not Assigned(payload) then
    begin
      ShowErro('Dados não encontrados');
      Exit;
    end;

    if (payload.comprador.endereco.codigoMunicipio = 0) then
    begin
      ShowAtencao('Código do município precisa ser vinculado com o cadastro de municípios do ERP' + sLineBreak +
                  'Por favor selecione na tela seguinte o munícipio do cadastro do RENAVE');

      HandleVinculoCidadeIBGE(payload.helperCidade);

      Exit;
    end;

    dataSetEstoque.DataSet.CancelUpdates;
    dataSetEstoque.Refresh;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.Ajustardadoshodometro1Click(
  Sender: TObject);
var
  payload: TArray<TVeiculoDadosHodometroModel>;
begin

  var repo := TRenaveRepoSingleton.GetInstance();

  if not repo.Auditor.Processo('RNV011')
    .Alterar.Permitido then
    Exit;

  payload := [];

  Application.CreateForm(TformInformarDadosHodometro, formInformarDadosHodometro);

  formInformarDadosHodometro.dataMedicao := dataSetEstoque.fdatet('datahoramedicaohodometro');
  formInformarDadosHodometro.kmhodometro := dataSetEstoque.fint('kmhodometro');

  try
    if formInformarDadosHodometro.ShowModal = IDOK then
    begin
      disableControls;
      try
        dataSetEstoque.prepare_loop('sel = ''S'' ').Last.First;
        while not dataSetEstoque.Eof do
        begin
          var veiculo := TVeiculoDadosHodometroModel.Create;
          veiculo.veiculoId := dataSetEstoque.fint('codigo');
          veiculo.chassi := dataSetEstoque.fstr('chassi');
          veiculo.dataMedicao := formInformarDadosHodometro.dataMedicao;
          veiculo.valorHodometro := formInformarDadosHodometro.kmhodometro;

          payload := payload + [veiculo];

          dataSetEstoque.Next;
        end;

        try

          TRenaveRepoSingleton.GetInstance().PostDadosHodometro(payload);

          dataSetEstoque.DataSet.CancelUpdates;
          dataSetEstoque.Refresh;

        except on E: Exception do
          begin
            memoLog.Lines.Add(Format('%s', [e.Message]));
            memoLog.Lines.Add('-')
          end;
        end;

      finally
        dataSetEstoque.prepare_loop_done();
        EnableControls;
      end;
    end;

  finally
    formInformarDadosHodometro.Free;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.AtualizarEstoqueRenave(chs: TArray<string>);
var
  pends: TArray<TVeiculoZeroKmPendenteEntradaEstoqueModel>;
  estoques: TArray<TVeiculoEstoqueModel>;
begin
  TimerEstoque.Enabled := False;
  disableControls;
  try
    lbProgress.Caption := 'Obtendo estoque RENAVE';
    ProgressBar1.Min := 0;
    ProgressBar1.Position := 0;

    var api := TApiRenaveSingleton.GetInstance();
    var repo := TRenaveRepoSingleton.GetInstance();

    for var chassi in chs do
    begin
      pends := api.GetVeiculoZeroKmPendenteEntradaEstoque(chassi);
      for var pend in pends do
      begin
        memoLog.Lines.Add(Format('%s - %s - ENTRADA PENDENTE', [pend.chassi, DateTimeToStr(pend.dataHoraCadastro)]));
        memoLog.Lines.Add('-');
      end;

      api.raiseError := False;
      estoques := api.GetVeiculoEstoque(dataSetEstoque.fstr('chassi'));

      repo.PostEstoqueVeiculo(estoques);

      if not api.LastErrorApi.IsEmpty then
      begin
        memoLog.Lines.Add(api.LastErrorApi);
        memoLog.Lines.Add('-');
      end;

    end;

  finally
    dataSetEstoque.prepare_loop_done();
    EnableControls;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.Atualizarestoquerenave1Click(
  Sender: TObject);
var
  chs: TArray<string>;
begin
  chs := [];
  disableControls;
  try
    dataSetEstoque.prepare_loop('sel = ''S'' ').Last.First;

    if dataSetEstoque.DataSet.RecordCount = 0 then
      ShowAtencao('Nenhum registro selecionado');

    while not dataSetEstoque.Eof do
    begin
      chs := chs + [dataSetEstoque.fstr('chassi')];

      dataSetEstoque.Next;
    end;

  finally
    dataSetEstoque.prepare_loop_done();
    EnableControls;
  end;

  AtualizarEstoqueRenave(chs);
end;

procedure TformVeiculosZeroEntradaEstoque.BitBtn1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    var api := TApiRenaveSingleton.GetInstance();

    api.raiseError := False;
    var atpv := api.GetPdfAtpv(dataSetEstoque.fstr('chassi'));

    if not api.LastErrorApi.IsEmpty then
    begin
      memoLog.Lines.Add(api.LastErrorApi);
      memoLog.Lines.Add('-');
      Exit;
    end;

    if Assigned(atpv) then
    begin

      var Decoder := TIdDecoderMIME.Create(nil);
      var MStream := TMemoryStream.Create;
      try
        Decoder.DecodeStream(atpv.pdfAtpvBase64, MStream);

        var fileName := GetFileNameRandom('', 'pdf');

        MStream.SaveToFile(fileName);

        ShellExecute(Application.Handle, 'open', PWideChar(fileName), '', '',SW_SHOWNORMAL);


//        CreateProcessSimple(fileName);

      finally
        FreeAndNil(Decoder);
        FreeAndNil(MStream);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.btCancelarEntradaClick(
  Sender: TObject);
var
  dataCanc: TDateTime;
begin

  try
    var repo := TRenaveRepoSingleton.GetInstance();

    if not repo.Auditor.Processo('RNV004').SetMensagem('Chassi ' + dataSetRenave.fstr('chassi') )
      .Cancelar.Permitido then
      Exit;

    var payload := TSolicitacaoCancelamentoEntradaZeroKmModel.Create;

    payload.cpfOperadorResponsavel := repo.cpfResponsavel;
    payload.idEstoque := dataSetRenave.fint('id');
    dataCanc := Now;

    var text := DateTimeToStr(datacanc);

    if not InputQuery('Cancelamento de entrada', 'Confirme a data do cancelamento', text) then
      Exit;

    if not TryStrToDateTime(text, datacanc) then
      Exit;

    payload.dataCancelamentoEntradaEstoque := datacanc;

    var estoque := TApiRenaveSingleton.GetInstance().PostCancelamentoEntradaEstoqueZeroKm(payload);

    if Assigned(estoque) then
      repo.PostEstoqueVeiculo([estoque]);

    dataSetRenave.Refresh;
    dataSetEstoque.Refresh;

  except on E: Exception do
    begin
      ShowAtencao(e.Message);
    end;
  end;

end;

procedure TformVeiculosZeroEntradaEstoque.btCancelarSaidaClick(
  Sender: TObject);
var
  dataCanc: TDateTime;
begin

  try
    var repo := TRenaveRepoSingleton.GetInstance();

    if not repo.Auditor.Processo('RNV006').SetMensagem('Chassi ' + dataSetRenave.fstr('chassi') )
      .Cancelar.Permitido then
      Exit;

    var payload := TSolicitacaoCancelamentoSaidaZeroKmModel.Create;

    payload.cpfOperadorResponsavel := repo.cpfResponsavel;
    payload.idEstoque := dataSetRenave.fint('id');
    dataCanc := Now;

    var text := DateTimeToStr(datacanc);

    if not InputQuery('Cancelamento de saída', 'Confirme a data do cancelamento', text) then
      Exit;

    if not TryStrToDateTime(text, datacanc) then
      Exit;

    payload.dataCancelamentoSaidaEstoque := datacanc;

    var estoque := TApiRenaveSingleton.GetInstance().PostCancelamentoSaidaEstoqueZeroKm(payload);

    if Assigned(estoque) then
      repo.PostEstoqueVeiculo([estoque]);

    dataSetRenave.Refresh;
    dataSetEstoque.Refresh;

  except on E: Exception do
    begin
      ShowAtencao(e.Message);
    end;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.btConfirmarMunicipioClick(
  Sender: TObject);
begin
  try
    if combo_cidades.ItemIndex = -1 then
    begin
      ShowAtencao('Município não selecionado');
      Exit;
    end;

    var payload := TRnv_municipio_class.Create;

    with TMunicipioRenaveModel(combo_cidades.Items.Objects[combo_cidades.ItemIndex]) do
    begin
      payload.id := StrToInt(id);
      payload.nome := nome;
      payload.uf := uf;
      payload.ibgeid := lb_mun_renave.Tag;
    end;

    if TRenaveRepoSingleton.GetInstance().PostMunicipioRenave(payload) then
      page.ActivePage := ts_estoque;

  except on E: Exception do
    ShowMessage(e.Message);
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.btDevolucaoMontadoraClick(
  Sender: TObject);
var
  dados: array of string;
  dataSaida: TDateTime;
begin
  memoLog.Lines.Clear;
  Screen.Cursor := crHourGlass;
  try
    lbProgress.Caption := 'Iniciando processo';
    ProgressBar1.Min := 0;
    ProgressBar1.Position := 0;

    var api := TApiRenaveSingleton.GetInstance();
    var repo := TRenaveRepoSingleton.GetInstance();

    if not repo.Auditor.Processo('RNV007').SetMensagem('Chassi ' + dataSetEstoque.fstr('chassi') )
      .Inserir.Permitido then
      Exit;

    if repo.cpfResponsavel.Trim.IsEmpty then
      raise Exception.Create('CPF do responsável não informado. Deve estar presente na configuração do Renave');

    if dataSetEstoque.fstr('estoque_renave').IsEmpty then
    begin
      if ShowConfirmacao('Sem informação do estoque Renave' + sLineBreak +
                         'Deseja consultar dados agora?') = IDYES then
        AtualizarEstoqueRenave([dataSetEstoque.fstr('chassi')]);
      Exit;
    end;

    var payload := repo.GetSolicitacaoDevolucaoMontadora(dataSetEstoque.fstr('chassi'), dataSetEstoque.fint('nf_id'));

    if not Assigned(payload) then
    begin
      ShowErro('Dados não encontrados');
      Exit;
    end;

    Application.CreateForm(TformSolicitacaoDevolucaoMontadoraVeiculoZero, formSolicitacaoDevolucaoMontadoraVeiculoZero);
    formSolicitacaoDevolucaoMontadoraVeiculoZero.solicitacao := payload;

    if formSolicitacaoDevolucaoMontadoraVeiculoZero.ShowModal <> mrOk then
      Exit;

    try

      var estoque := api.PostDevolucaoMontadoraVeiculoZeroKm(payload);

      if Assigned(estoque) then
        repo.PostEstoqueVeiculo([estoque]);

    except on E: Exception do
      begin
        memoLog.Lines.Add(e.Message);
        memoLog.Lines.Add('-')
      end;
    end;

    dataSetEstoque.DataSet.CancelUpdates;
    dataSetEstoque.Refresh;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.btEntrarComEstoqueClick(
  Sender: TObject);
begin
  var repo := TRenaveRepoSingleton.GetInstance();

  if not repo.Auditor.Processo('RNV003')
    .Inserir.Permitido then
    Exit;

  memoLog.Lines.Clear;
  disableControls;
  try
    var api := TApiRenaveSingleton.GetInstance();

//    if repo.cpfResponsanvel.IsEmpty then
//      cpfResponsanvel := repo.GetConfig(RENAVE_CONF_KEY, repo.CodEmpresa).ReadString('Responsavel', 'CPF');

    if repo.cpfResponsavel.IsEmpty then
      raise Exception.Create('CPF do responsável não informado. Deve estar presente na configuração do Renave');

    dataSetEstoque.prepare_loop('sel = ''S'' ').Last.First;

    ProgressBar1.Max := dataSetEstoque.DataSet.RecordCount;
    lbProgress.Caption := 'Enviando informação de entrada em estoque';

    while not dataSetEstoque.Eof do
    begin
      ProgressBar1.Position := dataSetEstoque.DataSet.RecNo;
      Application.ProcessMessages;

      var payload := TSolicitacaoEntradaEstoqueZeroModel.Create;
      payload.chassi := dataSetEstoque.fstr('chassi');
      payload.chaveNotaFiscal := dataSetEstoque.fstr('chave_nfe_compra');
      payload.cpfOperadorResponsavel := repo.cpfResponsavel;
      payload.dataEntradaEstoque := dataSetEstoque.fdatet('data_entrada');
      payload.quilometragemHodometro := dataSetEstoque.fint('kmhodometro');
      payload.dataHoraMedicaoHodometro := dataSetEstoque.fdatet('dataHoraMedicaoHodometro');
      payload.valorCompra := dataSetEstoque.ffloat('valor_compra');

      try

        var entrada := api.PostEntradaEstoqueZeroKm(payload);

        if Assigned(entrada) then
//        begin
          repo.PostEstoqueVeiculo([entrada]);

//          dataSetEstoque.Edit.Text['status_renave'] := entrada.estado;
//          dataSetEstoque.Post;
//        end;

         repo.Auditor.GravarMensagem('Entrada confirmada Chassi %s', [payload.chassi]);

      except on E: Exception do
        begin
          memoLog.Lines.Add(Format('%s - %s', [payload.chassi, e.Message]));
          memoLog.Lines.Add('-')
        end;
      end;

      dataSetEstoque.Next;
    end;

    dataSetEstoque.DataSet.CancelUpdates;
    dataSetEstoque.Refresh;

  finally
    dataSetEstoque.prepare_loop_done();
    EnableControls;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.btSairComEstoqueClick(
  Sender: TObject);
var
  dados: array of string;
  dataSaida: TDateTime;
begin
  memoLog.Lines.Clear;
  Screen.Cursor := crHourGlass;
  try
    lbProgress.Caption := 'Iniciando processo';
    ProgressBar1.Min := 0;
    ProgressBar1.Position := 0;

    var api := TApiRenaveSingleton.GetInstance();
    var repo := TRenaveRepoSingleton.GetInstance();

    if not repo.Auditor.Processo('RNV005').SetMensagem('Chassi ' + dataSetEstoque.fstr('chassi') )
      .Inserir.Permitido then
      Exit;

    if repo.cpfResponsavel.Trim.IsEmpty then
      raise Exception.Create('CPF do responsável não informado. Deve estar presente na configuração do Renave');

    if dataSetEstoque.fstr('estoque_renave').IsEmpty then
    begin
      if ShowConfirmacao('Sem informação do estoque Renave' + sLineBreak +
                         'Deseja consultar dados agora?') = IDYES then
        AtualizarEstoqueRenave([dataSetEstoque.fstr('chassi')]);
      Exit;
    end;

    var payload := repo.GetSolicitacaoSaida(dataSetEstoque.fstr('chassi'), dataSetEstoque.fint('nf_id'));

    if not Assigned(payload) then
    begin
      ShowErro('Dados não encontrados');
      Exit;
    end;

    if (payload.comprador.endereco.codigoMunicipio = 0) then
    begin
      ShowAtencao('Código do município precisa ser vinculado com o cadastro de municípios do ERP' + sLineBreak +
                  'Por favor selecione na tela seguinte o munícipio do cadastro do RENAVE');

      HandleVinculoCidadeIBGE(payload.helperCidade);

      Exit;
    end;

    try
      var text := '';
      if payload.comprador.email.Trim.IsEmpty then
      begin
        if not InputQuery('Email comprador em branco', 'Por favor informe o email do comprador', text) then
          Exit;
        payload.comprador.email := text.Trim;
        if payload.comprador.email.Trim.IsEmpty then
          Exit;
      end;

      var estoqueRenave := repo.GetLastEstoqueZeroRenave(dataSetEstoque.fstr('chassi'));

      if Assigned(estoqueRenave) and Assigned(estoqueRenave.entradaEstoque) then
        if payload.dataVenda < estoqueRenave.entradaEstoque.dataHora then
        begin
          text := DateTimeToStr(estoqueRenave.entradaEstoque.dataHora);
          if not InputQuery('Data da venda menor que a data entrada', 'Por favor informe a data da venda', text) then
            Exit;

          if not TryStrToDateTime(text, dataSaida) then
          begin
            ShowErro('Data da venda deve ser maior que a data de entrada do estoque no RENAVE');
            Exit;
          end;

          payload.dataVenda := dataSaida;
        end;

      if ShowConfirmacao( StrConcat([
        'Chave NFe', _LB, payload.chaveNotaFiscal, _DLB,
        'Data venda', _LB, DateToStr(payload.dataVenda), _DLB,
        'Valor de venda', _LB, Format('%f', [payload.valorVenda]), _DLB,
        'Id Estoque RENAVE', _LB, payload.idEstoque.ToString, _DLB,
        'Nome comprador', _LB, payload.comprador.nome, _DLB,
        'Email comprador', _LB, payload.comprador.email, _DLB,
        'Documento comprador', _LB, payload.comprador.numeroDocumento, _DLB,
        'Confirma o envio dos dados ao RENAVE?'
        ])) <> IDYES then
          Exit;

//      set

//      if not InputQuery('Solicitação de saída RENAVE',
//                        ['Data venda', 'Valor venda', 'CPF comprador', 'Email comprador', ],
//                        dados) then
//        Exit;


      var estoque := api.PostSaidaEstoqueZeroKm(payload);

      if Assigned(estoque) then
        repo.PostEstoqueVeiculo([estoque]);

    except on E: Exception do
      begin
        memoLog.Lines.Add(e.Message);
        memoLog.Lines.Add('-')
      end;
    end;

    dataSetEstoque.DataSet.CancelUpdates;
    dataSetEstoque.Refresh;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.bt_actionsClick(Sender: TObject);
begin
  popMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TformVeiculosZeroEntradaEstoque.bt_check_allClick(
  Sender: TObject);
begin
  dataSetEstoque.CheckUnCheckAllRows(True);
end;

procedure TformVeiculosZeroEntradaEstoque.bt_close_pnerroClick(
  Sender: TObject);
begin
  pn_error.Visible := False;
end;

procedure TformVeiculosZeroEntradaEstoque.bt_uncheck_allClick(
  Sender: TObject);
begin
  dataSetEstoque.CheckUnCheckAllRows(False);
end;

procedure TformVeiculosZeroEntradaEstoque.bt_voltar_para_estoqueClick(
  Sender: TObject);
begin
  page.ActivePage := ts_estoque;
end;

procedure TformVeiculosZeroEntradaEstoque.Configuraoresponsvel1Click(
  Sender: TObject);
begin
  hw_config_sistema_dx(WideString('renave_%'),
                       WideString(useCaseBase.ParamsUC['userHW']),
                       TRenaveRepoSingleton.GetInstance().CodEmpresa,
                       StrToIntDef(useCaseBase.ParamsUC['userLevel'], 0) );
end;

procedure TformVeiculosZeroEntradaEstoque.disableControls;
begin
  Screen.Cursor := crHourGlass;
  pnProgress.Visible := True;
  pn_estoque.Enabled := False;
  pn_error.Visible := False;
end;

procedure TformVeiculosZeroEntradaEstoque.EnableControls;
begin
  pnProgress.Visible := False;
  grid_est.Visible := True;
  pn_estoque.Enabled := True;
  Screen.Cursor := crDefault;
end;

procedure TformVeiculosZeroEntradaEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  formVeiculosZeroEntradaEstoque := nil;
end;

procedure TformVeiculosZeroEntradaEstoque.FormCreate(Sender: TObject);
begin
  ts_estoque.TabVisible := False;
  ts_renave.TabVisible := False;
  ts_cidade.TabVisible := False;
  ts_solicitacao_saida.TabVisible := False;
  btSairComEstoque.Left := btEntrarComEstoque.Left;
  btSairComEstoque.Top := btEntrarComEstoque.Top;
end;

procedure TformVeiculosZeroEntradaEstoque.FormShow(Sender: TObject);
begin
//  page.ActivePage := ts_estoque;
  page.ActivePage := ts_estoque;

  var api := TApiRenaveSingleton.GetInstance();
  var repo := TRenaveRepoSingleton.GetInstance();

  if (repo.cpfResponsavel.IsEmpty) or
     (repo.emailEstabelecimento.IsEmpty) or
      (api.CertificateId.IsEmpty)  then
  begin
    ShowAtencao('Dados exigidos pelo RENAVE precisam ser configurados' + _DLB +
                ' ***** Dados do certificado digital *****' + _LB +
                'Selecione o certificado no menu "Meus dados e certificado" ' + _DLB +
                ' ***** Dados do responsavel *****' + _LB +
                ' * CPF do responsável' + _LB +
                ' * Email do estabelecimento' + _LB +
                'Acesse o menu "Configuração responsável"');
  end
  else
    TimerEstoque.Enabled := True;
end;

procedure TformVeiculosZeroEntradaEstoque.grid_estCellClick(
  Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    if Assigned(dataSetEstoque) then
      dataSetEstoque.CheckUnCheckRow();
end;

procedure TformVeiculosZeroEntradaEstoque.grid_estDblClick(
  Sender: TObject);
begin
  if Assigned(dataSetEstoque) then
    dataSetEstoque.CheckUnCheckRow();
end;

procedure TformVeiculosZeroEntradaEstoque.grid_estDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;
  Agrid := TDBGrid(Sender);

  if (Agrid.DataSource.dataSet.FieldByName('sel').AsString = 'S') and (not (gdFocused in State)) then
  begin
    Agrid.Canvas.Brush.Color := clHighlight;
    Agrid.Canvas.Font.Color  := clHighlightText;
    Agrid.DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.grid_estKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key in [VK_RETURN, VK_SPACE] then
    if Assigned(dataSetEstoque) then
        dataSetEstoque.CheckUnCheckRow();
end;

procedure TformVeiculosZeroEntradaEstoque.grid_estMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ssCtrl in Shift then
    if Assigned(dataSetEstoque) then
      dataSetEstoque.CheckUnCheckRow();
end;

procedure TformVeiculosZeroEntradaEstoque.HandleVinculoCidadeIBGE(
  payload: TAuxiliarCidade);
begin
  Screen.Cursor := crHourGlass;
  try
    lb_mun_renave.Caption := Format('%d - %s - %s', [payload.ibge, payload.cidade, payload.uf]);
    lb_mun_renave.Tag := payload.ibge;
    page.ActivePage := ts_cidade;
    combo_cidades.ItemIndex := -1;

    var api := TApiRenaveSingleton.GetInstance();
    var repo := TRenaveRepoSingleton.GetInstance();

    var cidades := api.GetMunicipiosRenave('',  payload.uf);

    repo.PostMunicipiosRenave(cidades);

    combo_cidades.Items.Clear;

    for var cid in cidades do
      combo_cidades.AddItem(Format('%s - %s', [cid.nome, cid.uf]), cid);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.memoLogChange(Sender: TObject);
begin
  pn_error.Visible := True;
end;

procedure TformVeiculosZeroEntradaEstoque.Meusdadosecertificado1Click(
  Sender: TObject);
begin
  var repo := TRenaveRepoSingleton.GetInstance();

  if not repo.Auditor.Processo('RNV001')
    .Alterar.Permitido then
    Exit;

  var useCase := TUseCaseConfigure.Create(';freeRepoOnDestroy=False;' + useCaseBase.GetStrParamsUC);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.TimerEstoqueTimer(Sender: TObject);
var
  pends: TArray<TVeiculoZeroKmPendenteEntradaEstoqueModel>;
  estoques: TArray<TVeiculoEstoqueModel>;
begin
  TimerEstoque.Enabled := False;
  disableControls;
  try
    lbProgress.Caption := 'Obtendo veículos';
    ProgressBar1.Min := 0;
    ProgressBar1.Position := 0;

    var api := TApiRenaveSingleton.GetInstance();
    var repo := TRenaveRepoSingleton.GetInstance();

    if nfId > 0 then
      dataSetEstoque := repo.GetDataSetVeiculosEmEstoque(nfId)
    else
      dataSetEstoque := repo.GetDataSetVeiculosEmEstoque(chassis);

    grid_est.DataSource := dataSetEstoque.DataSourceOOP;

    btEntrarComEstoque.Visible := dataSetEstoque.fequals('e_s', 'E');
    btSairComEstoque.Visible := dataSetEstoque.fequals('e_s', 'S');
    Ajustardadoshodometro1.Enabled := btEntrarComEstoque.Visible;
//    btDevolucaoMontadora.Enabled := dataSetEstoque.fequals('e_s', 'S') and dataSetEstoque.fequals('finalidade', '4');

       {
    dataSetEstoque.prepare_loop().Last.First;

    ProgressBar1.Max := dataSetEstoque.dataSet.RecordCount;
    lbProgress.Caption := 'Verificando estoque Renave';

    while not dataSetEstoque.Eof do
    begin
      ProgressBar1.Position := dataSetEstoque.dataSet.RecNo;
      Application.ProcessMessages;

      pends := api.GetVeiculoZeroKmPendenteEntradaEstoque(dataSetEstoque.fstr('chassi'));

      if Length(pends) > 0 then
      begin
        dataSetEstoque.Edit.Text['status_renave'] := 'ENTRADA PENDENTE';
        dataSetEstoque.Post;
      end;

      api.raiseError := False;
      estoques := api.GetVeiculoEstoque(dataSetEstoque.fstr('chassi'));

      repo.PostEstoqueVeiculo(estoques);

      if Length(estoques) > 0 then
      begin
        dataSetEstoque.Edit.Text['status_renave'] := estoques[High(estoques)].estado;
        dataSetEstoque.Post;
      end
      else if not api.LastErrorApi.IsEmpty then
      begin
        dataSetEstoque.Edit;
        if api.LastErrorApi.Contains('não foi encontrado no cadastro do Renavam') then
          dataSetEstoque.Text['status_renave'] := 'NAO ENCONTRADO';

        memoLog.Lines.Add(api.LastErrorApi);
        memoLog.Lines.Add('-');
        //dataSetEstoque.Text['mensagem'] := api.LastErrorApi;
        dataSetEstoque.Post;
      end;

      dataSetEstoque.Next;
    end;
    }

  finally
    dataSetEstoque.prepare_loop_done();
    EnableControls;
  end;

end;

procedure TformVeiculosZeroEntradaEstoque.VeculosZeropendentesdeentrada1Click(
  Sender: TObject);
begin
  var repo := TRenaveRepoSingleton.GetInstance();

  if not repo.Auditor.Processo('RNV008')
    .Visualizar.Permitido then
    Exit;

  var useCase := TUseCaseVeiculosZeroPendentes.Create(';freeRepoOnDestroy=False;' + useCaseBase.GetStrParamsUC);
  try
    useCase.Run;
  finally
    useCase.Free;
  end;
end;

procedure TformVeiculosZeroEntradaEstoque.VisualizarestoqueRENAVEdoitem1Click(
  Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    dataSetRenave := TRenaveRepoSingleton.GetInstance().GetDataSetVeiculosRenave(dataSetEstoque.fstr('chassi'));
    grid_est_renave.DataSource := dataSetRenave.DataSourceOOP;

    page.ActivePage := ts_renave;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
