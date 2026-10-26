unit hw.utils.dx.teste.integraapihw;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Hw.Integra.Api.Rest,
  Hw.Integra.Api.NotificacaoContasEmAberto, Vcl.Menus, Vcl.Samples.Spin,
  Vcl.Mask, Vcl.Imaging.jpeg;

type

  TItensFreteModel = class
  private
    Fgrupo: Integer;
    Fcodprod: string;
    Fnitem: Integer;
    Ffrete: Double;
    Funidade: string;
    Fquantidade: Double;
    Fvalor: Double;
  published
    property nitem: Integer read Fnitem write Fnitem;
    property unidade: string read Funidade write Funidade;
    property quantidade: Double read Fquantidade write Fquantidade;
    property valor: Double read Fvalor write Fvalor;
    property frete: Double read Ffrete write Ffrete;
    property grupo: Integer read Fgrupo write Fgrupo;
    property codprod: string read Fcodprod write Fcodprod;
  end;

  //TCreditosA = TArray<TCredito>;

  TfrmTestIntegraApi = class(TForm)
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    ed_cnpj: TEdit;
    BitBtn2: TBitBtn;
    ed_cnpj_login: TComboBox;
    ed_url: TComboBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    ed_log: TMemo;
    PopupMenu1: TPopupMenu;
    Financeiro1: TMenuItem;
    AnexoXV1: TMenuItem;
    ConsultaDiaria1: TMenuItem;
    Formulario1: TMenuItem;
    BitBtn5: TBitBtn;
    Ultimaverso1: TMenuItem;
    ConsultarAgora1: TMenuItem;
    GS1Prefix1: TMenuItem;
    Consultadiria1: TMenuItem;
    ConsultarAgora2: TMenuItem;
    ApiClound1: TMenuItem;
    GetGenericData1: TMenuItem;
    tsSincOff: TTabSheet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    bt_nfcesincoff_serviceplay: TSpeedButton;
    ServiceSincNFCeOff: TTimer;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    ed_servicePlay_params: TEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Defaut1: TMenuItem;
    Estatisticas1: TMenuItem;
    Incfuncionalidade1: TMenuItem;
    AdduserHW1: TMenuItem;
    TabSheet3: TTabSheet;
    BitBtn11: TBitBtn;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ed_codemp: TEdit;
    ed_database: TComboBox;
    TabSheet4: TTabSheet;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    Renav1: TMenuItem;
    Configurar1: TMenuItem;
    Veiculoszeropendentesentradaestoque1: TMenuItem;
    Entrarcomestoque1: TMenuItem;
    Entrarcomestoquechassis1: TMenuItem;
    BitBtn15: TBitBtn;
    FileOpenDialog1: TFileOpenDialog;
    PlugBoleto1: TMenuItem;
    Emitir1: TMenuItem;
    BitBtn16: TBitBtn;
    GerarRemessa1: TMenuItem;
    DescartarBoletos1: TMenuItem;
    UploadArquivo1: TMenuItem;
    Image1: TImage;
    Enviar1: TMenuItem;
    EmitirEnviar1: TMenuItem;
    Cedente1: TMenuItem;
    Conta1: TMenuItem;
    Convnio1: TMenuItem;
    BitBtn17: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ConsultaDiaria1Click(Sender: TObject);
    procedure Formulario1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Ultimaverso1Click(Sender: TObject);
    procedure ConsultarAgora1Click(Sender: TObject);
    procedure Consultadiria1Click(Sender: TObject);
    procedure ConsultarAgora2Click(Sender: TObject);
    procedure GetGenericData1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ServiceSincNFCeOffTimer(Sender: TObject);
    procedure bt_nfcesincoff_serviceplayClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure ed_servicePlay_paramsExit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Incfuncionalidade1Click(Sender: TObject);
    procedure AdduserHW1Click(Sender: TObject);
    procedure Defaut1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Configurar1Click(Sender: TObject);
    procedure Veiculoszeropendentesentradaestoque1Click(Sender: TObject);
    procedure Entrarcomestoque1Click(Sender: TObject);
    procedure Entrarcomestoquechassis1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure Emitir1Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure GerarRemessa1Click(Sender: TObject);
    procedure DescartarBoletos1Click(Sender: TObject);
    procedure UploadArquivo1Click(Sender: TObject);
    procedure Enviar1Click(Sender: TObject);
    procedure EmitirEnviar1Click(Sender: TObject);
    procedure Cedente1Click(Sender: TObject);
    procedure Conta1Click(Sender: TObject);
    procedure Convnio1Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
  private
    { Private declarations }
    Api: TIntegraRestApi;
    TokenApi: TIntegraTokenApi;
    //CreditosA: TArray<TCredito>;
    Notificacao: TNotificacaoContasEmAberto;
    nfceOffServiceBusy: Boolean;
  public
    { Public declarations }

    procedure ContentResponse(Sender: TObject);
    procedure Log(Msg: string);

  end;

var
  frmTestIntegraApi: TfrmTestIntegraApi;

implementation

{$R *.dfm}

uses HW.Utils.Classes.Funcoes_DX, Vcl.Clipbrd, Rest.Client, Rest.JSON, Rest.Types,
  System.JSON, HW.Utils.Classes.Registros_DX,
  System.StrUtils,
  Hw.Api.Rest,
  hw_win_utils,
  Hw.Integra.Api.Form.Creditos,
  Hw.Integra.Api.FinanceiroService,
  Hw.Integra.Servicos, hw_utils, GenericDataGetUseCase, NFCePostUseCase, ServiceSincUseCase,
  ConfigServerUseCase, uFormLogView, PedidosGetUseCase, hw_boleto_utils,
  OrcamentoGetUseCase, GhostScriptHelper;

procedure hw_integra_fin_show_creditos_abertos(banco: WideString; empresas: array of Integer; usuario: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_integra_fin_consultadiaria(Banco: WideString; empresas: array of Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_integra_anexoxv_consultadiaria(banco: WideString; empresa: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_integra_anexoxv_consultaragora(banco: WideString; empresa: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_integra_gs1prefix_consultadiaria(banco: WideString; empresa: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_integra_gs1prefix_consultaragora(banco: WideString; empresa: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_integra_default_consultadiaria(banco: WideString; empresa: Integer); stdcall; external 'hw.utils.dx.dll';

function hw_integra_estatistica_inc(banco, descricao: WideString; empresa: Integer): Integer; stdcall; external 'hw.utils.dx.dll';

procedure hw_integra_estatistica_user(banco, userHW: WideString; empresa: Integer); stdcall; external 'hw.utils.dx.dll';

procedure assineon_config(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';

procedure assineon_show_documents(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';

//procedure cloud_get_silent(banco: WideString; empresaId, caixaId: Integer); stdcall; external 'hw.utils.dx.dll';

procedure renave_configure(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';
procedure renave_zero_pendentes_entrada_estoque(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';
procedure renave_zero_estoque_renave(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';

procedure plugboleto_cedente(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_conta(paramsList: WideString; idconvenio: Integer); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_convenio(paramsList: WideString; idconvenio: Integer); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_emitir(paramsList: WideString; ids: array of Integer); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_remessa(paramsList: WideString; ids: array of Integer; diretorio: WideString); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_descartar(paramsList: WideString; ids: array of Integer); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_uploadretorno(paramsList: WideString; diretorioarquivo: WideString; idconvenio: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_image_view(Source: WideString); stdcall; external 'hw.utils.dx.dll';

procedure TfrmTestIntegraApi.AdduserHW1Click(Sender: TObject);
begin
  var userHw := '';
  if not InputQuery('User HW', 'User HW', userHw) then
    Exit;

  hw_integra_estatistica_user(ed_database.Text, userHw, StrToIntDef(ed_codemp.Text, 1));
end;

procedure TfrmTestIntegraApi.BitBtn10Click(Sender: TObject);
begin
  var handle := TOrcamentoGetUseCase.Create(';databasename=joaopedro-pc:D:\Hw\bases\producao\Hwauto_T005.fdb;silent=true;empresaId=1;caixaId=5;id=48');

  handle.OnLog := Log;
  handle.Run;
  handle.Free;
end;

procedure TfrmTestIntegraApi.BitBtn11Click(Sender: TObject);
begin
  assineon_config(
    Format(';databaseName=%s;empresaid=%s;silent=true',
           [ed_database.Text, ed_codemp.Text]));
end;

procedure TfrmTestIntegraApi.BitBtn12Click(Sender: TObject);
begin
  assineon_show_documents(
    Format(';databaseName=%s;empresaid=%s;clienteId=1;colaboradorId=2',
           [ed_database.Text, ed_codemp.Text]));
end;

procedure TfrmTestIntegraApi.BitBtn15Click(Sender: TObject);
begin
  if FileOpenDialog1.Execute then
    hw_image_view(WideString(FileOpenDialog1.FileName));
end;

function GerarImage(lInput, lOutput: string): Boolean;
begin

end;

procedure TfrmTestIntegraApi.BitBtn16Click(Sender: TObject);
var
  Prev: TBoletoPreview;
  I: Integer;
begin

  Prev := TBoletoPreview.Create;
  Screen.Cursor := crHourGlass;
  try

    var lImagen := 'D:\Downloads\PDFs\boleto_pedido_0000008795660.pdf';

    Prev.NewFromFile(lImagen);

    lImagen := 'D:\Downloads\PDFs\Boleto_mercadolivre_cabo_usb_serial.pdf';

    Prev.NewFromFile(lImagen);

//    lImagen := 'D:\Downloads\PDFs\boleto1.jpeg';
//
//    Prev.New(lImagen);

//    var lOutput := ('<html></head><head/><body><img src="' + lImagen + '" width="100%" height="93%"></body></html>');//, [lImagen]);
//
//    Prev.New.html.Text := lOutput;
//
//    lOutput := ('<html></head><head/><body><strong>Meu boleto 2 html<strong/><p/><img src="' + lImagen + '" width="100%" height="93%"></body></html>');//, [lImagen]);
//    Prev.New.html.Text := lOutput;

    if Prev.Count > 0 then
      Prev.Preview;
  finally
    Prev.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmTestIntegraApi.BitBtn17Click(Sender: TObject);
begin
  var lImagen := 'D:\Downloads\PDFs\boleto_pedido_0000008795660.pdf';
  HelperPDFGS.PDF2Print2(lImagen, '');
end;

procedure TfrmTestIntegraApi.BitBtn1Click(Sender: TObject);
begin
  Clipboard.AsText := Format('{"UserID":"%s","Password":"%s"}',
                             [ed_cnpj.Text, THwUtilsClass.CalculaChaveLoginChatWeb(ed_cnpj.Text)]);
  ed_log.Lines.Add(Clipboard.AsText);
end;

procedure TfrmTestIntegraApi.BitBtn2Click(Sender: TObject);
var
  JsonString: string;
begin
  ed_log.Lines.Add('--');
  Api.BaseUrl := ed_url.Text;
  Api.Controller := 'Login';
  Api.OnLog := Log;
  JsonString := Format('{"UserID":"%s","Password":"%s"}',[ed_cnpj_login.Text, THwUtilsClass.CalculaChaveLoginChatWeb(ed_cnpj_login.Text)]);
  case api.Post(TRestApiReq.New('', '', JsonString)) of
    200 :
    begin
      TokenApi := TJson.JsonToObject<TIntegraTokenApi>(Api.JSONReponse);
      if Assigned(TokenApi) then
      begin
        Api.AssignTokenAuthorization(TokenApi);
        //ed_log.Text := TokenApi.cnpj;
      end;
    end;
    else
//      ed_log.Lines.Add(Api.LastError);
  end;
end;

procedure TfrmTestIntegraApi.BitBtn3Click(Sender: TObject);
begin
{
  ed_log.Lines.Add('--');
  Api.Controller := 'Financeiro/CreditosEmAberto';
  Api.ParamsURL := ed_cnpj_login.Text;
  case api.Get(nil) of
    200 :
    begin
      Notificacao := THwClassRegistros.FromJsonToArray<TNotificacaoContasEmAberto>(Api.JSONReponse);
      ed_log.Lines.Add(Api.JSONReponse);
      ed_log.Lines.Text := CreditosA[0].boleto.htmlBoleto;
    end;
  end;
  }
end;

procedure TfrmTestIntegraApi.BitBtn4Click(Sender: TObject);
//var
//  FinanceiroService: TFinanceiroService;
begin
//  FinanceiroService := TFinanceiroService.Create(ed_url.Text, ed_cnpj_login.Text);

//  FinanceiroService.ShowCreditosEmAbertoHw;


//  Application.CreateForm(TFrmCreditosHw, FrmCreditosHw);
//  FrmCreditosHw.CNPJ := ed_cnpj_login.Text;
//  FrmCreditosHw.URLApi := ed_url.Text;
//
//  if Assigned(TokenApi) then
//    FrmCreditosHw.Token := TokenApi;
//
//  FrmCreditosHw.ShowModal;
end;

procedure TfrmTestIntegraApi.BitBtn5Click(Sender: TObject);
begin
  PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmTestIntegraApi.BitBtn6Click(Sender: TObject);
begin
//  var handle := TConfigServerUseCase.Create(Format(';databaseName=%s;charSet=ISO8859_1;empresaId=%d;caixaId=%d;silent=false', [ed_database.Items[1], 1, 1]));
//  var handle := TConfigServerUseCase.Create(Format(';databaseName=%s;charSet=WIN1252;empresaId=%d;caixaId=%d;silent=false',
//                                                   ['joaopedro-pc:D:\Hw\bases\rei\Hwauto.fdb', 1, 1]));
  //ed_database.Items[1], 1, 1, false);//[1] = producao

//  var handle := TConfigServerUseCase.Create(Format(';empresaId=%d;caixaId=%d', [ 1, 1]));
  var handle := TConfigServerUseCase.Create(Format(';empresaId=%d;caixaId=%d', [ 2, 1]));

  handle.OnLog := Log;
  handle.Run();
  handle.Free;
end;

procedure TfrmTestIntegraApi.BitBtn7Click(Sender: TObject);
begin
//  var handle := TServiceSincUseCase.Create(';silent=true;empresaId=1;caixaId=1');
  var handle := TServiceSincUseCase.Create(';databasename=joaopedro-pc:D:\Hw\bases\producao\Hwauto_T005.fdb;silent=true;empresaId=1;caixaId=5');

  handle.OnLog := Log;
  handle.Run;
  handle.Free;

end;

procedure TfrmTestIntegraApi.BitBtn8Click(Sender: TObject);
begin
  Application.CreateForm(TfrmLogView, frmLogView);
  frmLogView.log.cnpj := '03530705000109';
  frmLogView.empresaId := 1;
  frmLogView.caixaId := 5;
  frmLogView.ShowModal;
end;

procedure cloud_get_pedidos(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';

procedure TfrmTestIntegraApi.BitBtn9Click(Sender: TObject);
begin

  cloud_get_pedidos(';databasename=joaopedro-pc:D:\Hw\bases\producao\Hwauto_T005.fdb;silent=true;empresaId=1;caixaId=5;date=30/03/2021');
  exit;

  var handle := TPedidosGetUseCase.Create(';databasename=joaopedro-pc:D:\Hw\bases\producao\Hwauto_T005.fdb;silent=true;empresaId=1;caixaId=5;date=30/03/2021');

  handle.OnLog := Log;
//  handle.date := EncodeDate(2021, 03, 30);
  handle.Run;
  handle.Free;
end;

procedure TfrmTestIntegraApi.Cedente1Click(Sender: TObject);
begin
  plugboleto_cedente(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10;print=true;sendMail=false',
           [ed_database.Text, ed_codemp.Text]));
end;

procedure TfrmTestIntegraApi.Configurar1Click(Sender: TObject);
begin
  renave_configure(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
           [ed_database.Text, ed_codemp.Text]));
end;

procedure TfrmTestIntegraApi.ConsultaDiaria1Click(Sender: TObject);
var
  Servico: THwIntegraServicos;
begin
//  Servico := THwIntegraServicos.Create(True);
//  Servico.CodEmpresa := StrToIntDef(ed_codemp.Text, 1);
//  Servico.DataBasePath := ed_database.Text;
//  Servico.FinanceiroService_ConsultaDiaria;
//  Servico.Free;
  hw_integra_fin_consultadiaria(ed_database.Text, [StrToIntDef(ed_codemp.Text, 1)]);
end;

procedure TfrmTestIntegraApi.Consultadiria1Click(Sender: TObject);
begin
  hw_integra_gs1prefix_consultadiaria(ed_database.Text, StrToIntDef(ed_codemp.Text, 1));
end;

procedure TfrmTestIntegraApi.ConsultarAgora1Click(Sender: TObject);
begin
  hw_integra_anexoxv_consultaragora(ed_database.Text, StrToIntDef(ed_codemp.Text, 1));
end;

procedure TfrmTestIntegraApi.ConsultarAgora2Click(Sender: TObject);
begin
  hw_integra_gs1prefix_consultaragora(ed_database.Text, StrToIntDef(ed_codemp.Text, 1));
end;

procedure TfrmTestIntegraApi.Conta1Click(Sender: TObject);
var
  id_convenio: Integer;
begin
  var Text := '';
  Text := RegistroWin.Read(Self.Name, 'Conta1Click', Text);

  if not InputQuery('Convênio', 'Informe o código do convênio que deseja consultar', Text) then
    Exit;

  RegistroWin.Write(Self.Name, 'Conta1Click', Text);

  if Text.Trim() = '' then
    id_convenio := 0
  else
    id_convenio := StrToInt(Text);

  plugboleto_conta(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10;print=true;sendMail=false',
           [ed_database.Text, ed_codemp.Text]), id_convenio);
end;

procedure TfrmTestIntegraApi.ContentResponse(Sender: TObject);
begin
  //TJson.Format(restResponse.JSONValue)
  if Sender is TJSONValue then
    ed_log.Lines.Add(TJson.Format(TJSONValue(Sender)))
  else
    ed_log.Lines.Add(TJson.Format(TJSONValue(Sender)))
end;

procedure TfrmTestIntegraApi.Convnio1Click(Sender: TObject);
var
  id_convenio: Integer;
begin
  var Text := '';
  Text := RegistroWin.Read(Self.Name, 'Conta1Click', Text);

  if not InputQuery('Convênio', 'Informe o código do convênio que deseja consultar', Text) then
    Exit;

  RegistroWin.Write(Self.Name, 'Conta1Click', Text);

  if Text.Trim() = '' then
    id_convenio := 0
  else
    id_convenio := StrToInt(Text);

  plugboleto_convenio(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10;print=true;sendMail=false',
           [ed_database.Text, ed_codemp.Text]), id_convenio);
end;

procedure TfrmTestIntegraApi.Defaut1Click(Sender: TObject);
begin
  hw_integra_default_consultadiaria(ed_database.Text, StrToIntDef(ed_codemp.Text, 1));
end;

procedure TfrmTestIntegraApi.DescartarBoletos1Click(Sender: TObject);
var
  ids: array of Integer;
begin
  var Text := '';
  Text := RegistroWin.Read(Self.Name, 'Descartar1Click', Text);

  if not InputQuery('Boletos', 'Informe o(s) código(s) do(s) boleto(s) que deseja descartar', Text) then
    Exit;

  RegistroWin.Write(Self.Name, 'Descartar1Click', Text);

  var list := NewStringList(true, Text, ',');

  ids := [];
  for Text in list do
    ids := ids + [StrToInt(Text.Trim)];

  plugboleto_descartar(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
           [ed_database.Text, ed_codemp.Text]), ids);
end;

procedure TfrmTestIntegraApi.ed_servicePlay_paramsExit(Sender: TObject);
begin
  RegistroWin.Write(Self.ClassName, ed_servicePlay_params.Name, ed_servicePlay_params.Text);
end;

procedure TfrmTestIntegraApi.Emitir1Click(Sender: TObject);
var
  ids: array of Integer;
begin
  var Text := '';
  Text := RegistroWin.Read(Self.Name, 'Emitir1Click', Text);

  if not InputQuery('Boletos', 'Informe o(s) código(s) do(s) boleto(s) que deseja emitir', Text) then
    Exit;

  RegistroWin.Write(Self.Name, 'Emitir1Click', Text);

  var list := NewStringList(true, Text, ',');

  ids := [];
  for Text in list do
    ids := ids + [StrToInt(Text.Trim)];

  plugboleto_emitir(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10;print=true;sendMail=false',
           [ed_database.Text, ed_codemp.Text]), ids);
end;

procedure TfrmTestIntegraApi.EmitirEnviar1Click(Sender: TObject);
var
  ids: array of Integer;
begin
  var Text := '';
  Text := RegistroWin.Read(Self.Name, 'Emitir1Click', Text);

  if not InputQuery('Boletos', 'Informe o(s) código(s) do(s) boleto(s) que deseja emitir', Text) then
    Exit;

  RegistroWin.Write(Self.Name, 'Emitir1Click', Text);

  var list := NewStringList(true, Text, ',');

  ids := [];
  for Text in list do
    ids := ids + [StrToInt(Text.Trim)];

  plugboleto_emitir(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10;sendMail=true;print=true',
           [ed_database.Text, ed_codemp.Text]), ids);
end;

procedure TfrmTestIntegraApi.Entrarcomestoque1Click(Sender: TObject);
begin
  var nfId := 0;
  nfId := RegistroWin.Read(Self.Name, 'Entrarcomestoque1ClickNf', nfId);
  var Text := nfId.ToString;

  if not InputQuery('NfId', 'Nf Id?', Text) then
    Exit;

  if not TryStrToInt(Text, nfId) then
    Exit;

  RegistroWin.Write(Self.Name, 'Entrarcomestoque1ClickNf', nfId);

  renave_zero_estoque_renave(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10;nfId=%d',
           [ed_database.Text, ed_codemp.Text, nfId]));
end;

procedure TfrmTestIntegraApi.Entrarcomestoquechassis1Click(
  Sender: TObject);
begin
  var chassis := '';
  chassis := RegistroWin.Read(Self.Name, 'Entrarcomestoquechassis1Click', chassis);

  if not InputQuery('NfId', 'Nf Id?', chassis) then
    Exit;

  RegistroWin.Write(Self.Name, 'Entrarcomestoquechassis1Click', chassis);


  renave_zero_estoque_renave(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10;chassis=%s',
           [ed_database.Text, ed_codemp.Text, chassis]));
end;

procedure TfrmTestIntegraApi.Enviar1Click(Sender: TObject);
var
  ids: array of Integer;
begin
  var Text := '';
  Text := RegistroWin.Read(Self.Name, 'Emitir1Click', Text);

  if not InputQuery('Boletos', 'Informe o(s) código(s) do(s) boleto(s) que deseja emitir', Text) then
    Exit;

  RegistroWin.Write(Self.Name, 'Emitir1Click', Text);

  var list := NewStringList(true, Text, ',');

  ids := [];
  for Text in list do
    ids := ids + [StrToInt(Text.Trim)];

  plugboleto_emitir(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10;print=false;sendMail=true',
           [ed_database.Text, ed_codemp.Text]), ids);
end;

procedure TfrmTestIntegraApi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //if FileExists('log_' + ed_log.Text + '.log') then
  ed_log.Lines.SaveToFile('log' + ed_log.name + '.log');
  Api.Free;
end;

procedure TfrmTestIntegraApi.FormShow(Sender: TObject);
begin
  ed_cnpj.Clear;
  ed_cnpj_login.ItemIndex := 0;

  ed_log.Clear;

  if FileExists('log_' + ed_log.Name + '.log') then
    ed_log.Lines.LoadFromFile('log' + ed_log.name + '.log');

//  ed_url.Text := 'http://localhost/IntegraApiHw/api';
  ed_url.ItemIndex := 0;
  ed_servicePlay_params.Text := VarToStr(RegistroWin.Read(Self.ClassName, ed_servicePlay_params.Name, ';silent=true;empresaId=1;caixaId=1'));
//  Api := TIntegraRestApi.Create(ed_url.Text, true);
//  Api.OnLog := Log;

   ed_database.Text := IniConf.ReadStr('Banco', 'HW', ed_database.Text);
end;

procedure TfrmTestIntegraApi.Formulario1Click(Sender: TObject);
var
  Servico: THwIntegraServicos;
begin
//  Servico := THwIntegraServicos.Create(False);
//  Servico.CodEmpresa := StrToIntDef(ed_codemp.Text, 1);
//  Servico.DataBasePath := ed_database.Text;
//  Servico.FinanceiroService_ShowCreditosEmAberto;
//  Servico.Free;
  hw_integra_fin_show_creditos_abertos(ed_database.Text, [StrToIntDef(ed_codemp.Text, 1)], 1);
end;

procedure TfrmTestIntegraApi.GerarRemessa1Click(Sender: TObject);
var
  ids: array of Integer;
begin
  var Text := '';
  Text := RegistroWin.Read(Self.Name, 'Remessa1Click', Text);

  var Diretorio := '';
  Diretorio := RegistroWin.Read(Self.Name, 'RemessaDiretorio1Click', Diretorio);

  if not InputQuery('Boletos', 'Informe o(s) código(s) do(s) boleto(s) que deseja gerar remessa', Text) then
    Exit;

  if not InputQuery('Boletos', 'Informe diretório do arquivo de remessa', Diretorio) then
    Exit;

  RegistroWin.Write(Self.Name, 'Remessa1Click', Text);

  var list := NewStringList(true, Text, ',');

  ids := [];
  for Text in list do
    ids := ids + [StrToInt(Text.Trim)];

  plugboleto_remessa(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
           [ed_database.Text, ed_codemp.Text]), ids, WideString(Diretorio));
end;

procedure TfrmTestIntegraApi.GetGenericData1Click(Sender: TObject);
begin
//  cloud_get_silent(ed_database.Text, StrToIntDef(ed_codemp.Text, 1), 1);
end;

procedure TfrmTestIntegraApi.Incfuncionalidade1Click(Sender: TObject);
begin
  var func := '';
  if not InputQuery('Funcionalidade', 'Funcionalidade', func) then
    Exit;

  ed_log.Lines.Add(func + ' ' +
  hw_integra_estatistica_inc(ed_database.Text, func, StrToIntDef(ed_codemp.Text, 1)).ToString());
end;

procedure TfrmTestIntegraApi.Log(Msg: string);
begin
  ed_log.Lines.Add(DateTimeToStr(Now) + ' - '  + Msg);
  Application.ProcessMessages;
end;

procedure TfrmTestIntegraApi.ServiceSincNFCeOffTimer(Sender: TObject);
begin
  if not ServiceSincNFCeOff.Enabled then
    Exit;

  if nfceOffServiceBusy then
    Exit;

  try
    nfceOffServiceBusy := True;

//    var handle := TServiceSincUseCase.Create(Format(';databaseName=%s;charSet=ISO8859_1;empresaId=%d;caixaId=%d;silent=false', [ed_database.Text, 1, 1]));
//    var handle := TServiceSincUseCase.Create(';silent=true;empresaId=1;caixaId=1');
        var handle := TServiceSincUseCase.Create(ed_servicePlay_params.Text);

//     Create(ed_database.Text, 1, 1, false);

    handle.OnLog := Log;
    handle.Run;
    handle.Free;
  finally
    nfceOffServiceBusy := False;
  end;

end;

procedure TfrmTestIntegraApi.SpeedButton1Click(Sender: TObject);
var
  handle : TGenericDataGetUseCase;
begin
  handle := TGenericDataGetUseCase.Create(Format(';databaseName=%s;charSet=ISO8859_1;empresaId=%d;caixaId=%d;silent=false', [ed_database.Text, 1, 1]));

  handle.OnLog := Log;
  handle.Run;
  handle.Free;

end;

procedure TfrmTestIntegraApi.SpeedButton2Click(Sender: TObject);
begin
  ed_log.Lines.Clear;
end;

procedure TfrmTestIntegraApi.SpeedButton3Click(Sender: TObject);
begin
  var handle := TNFCePostUseCase.Create(Format(';databaseName=%s;charSet=ISO8859_1;empresaId=%d;caixaId=%d;nfceId=%d;silent=false', [ed_database.Text, 1, 1, 964]));

  handle.OnLog := Log;
  handle.Run();
  handle.Free;
end;

procedure TfrmTestIntegraApi.bt_nfcesincoff_serviceplayClick(Sender: TObject);
begin
  ServiceSincNFCeOff.Enabled := not ServiceSincNFCeOff.Enabled;
  bt_nfcesincoff_serviceplay.Caption := IfThen(ServiceSincNFCeOff.Enabled, 'Service stop', 'Service play');
end;

procedure TfrmTestIntegraApi.Ultimaverso1Click(Sender: TObject);
begin
  hw_integra_anexoxv_consultadiaria(ed_database.Text, StrToIntDef(ed_codemp.Text, 1));
end;

procedure TfrmTestIntegraApi.UploadArquivo1Click(Sender: TObject);
var
  id_convenio: Integer;
begin
  var Text := '';
  Text := RegistroWin.Read(Self.Name, 'Conta1Click', Text);

  if not InputQuery('Convênio', 'Informe o código do convênio que deseja consultar', Text) then
    Exit;

  RegistroWin.Write(Self.Name, 'Conta1Click', Text);

  FileOpenDialog1.FileName := RegistroWin.Read(Self.Name, 'UploadArquivoDir1Click', Text);

  if not FileOpenDialog1.Execute then
    exit;

  RegistroWin.Write(Self.Name, 'UploadArquivoDir1Click', FileOpenDialog1.FileName);

  if Text.Trim() = '' then
    id_convenio := 0
  else
    id_convenio := StrToInt(Text);

  plugboleto_uploadretorno(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
          [ed_database.Text, ed_codemp.Text]), WideString(FileOpenDialog1.FileName), id_convenio);
end;

procedure TfrmTestIntegraApi.Veiculoszeropendentesentradaestoque1Click(
  Sender: TObject);
begin
  renave_zero_pendentes_entrada_estoque(
    Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
           [ed_database.Text, ed_codemp.Text]));
end;

end.
