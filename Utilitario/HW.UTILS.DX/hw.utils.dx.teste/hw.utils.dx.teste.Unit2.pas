unit hw.utils.dx.teste.Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Datasnap.DBClient,
  REST.Response.Adapter, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
//  System.JSON,
  Data.DBXJSONReflect,
  REST.Json, System.Generics.Collections, System.Contnrs,
  REST.Authenticator.OAuth, hw.utils.dx.teste.Unit3, REST.Json.Types, Vcl.ExtCtrls, Vcl.ComCtrls,
  REST.Utils,
  IdURI, HW.Utils.Classes.Registros_DX, HW.Utils.Classes.IBPT, uClasseConexao, Datasnap.Provider, Vcl.OleCtrls, SHDocVw,
  HW.Utils.Classes.Rtti,
  REST.JsonReflect, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.ImageList, Vcl.ImgList,
  REST.Types, Vcl.Mask;

type
  THWRest_RequestResponseModal1 = class
  private
    FCorpo: TDictionary<string, string>;
    FStatus: string;
  public
    class function FromJsonString(AJsonString: string): THWRest_RequestResponseModal1;
    function Sucess(AStatus: string): Boolean;
  published
    property Status: string read FStatus write FStatus;
    property Corpo: TDictionary<string, string> read FCorpo write FCorpo;
  end;

  TPessoa = class(TObject)//(TCollectionItem)
  private
    FAEmpty: string;
    [JSONMarshalledAttribute(False)]
    FIdade: Integer;
    FNome: string;
    FEndereco: string;
    _DtNasc: TDateTime;
    [JSONNameAttribute('NasceuQuando')]
    FDataNascimento: string;
    [JSONMarshalledAttribute(False)]
    FdataCadastro: TDateTime;
  public
    dataSetP: TClientDataSet;
    procedure SetDataNascimento(const Value: TDateTime);
    function GetDataNascimento(const Value: string): TDateTime;
  published
    property Nome: string read FNome write FNome;
    property Endereco: string read FEndereco write FEndereco;
    property Idade: Integer read FIdade write FIdade;
    property DataNascimento: string read FDataNascimento;
    property dataCadastro: TDateTime read FdataCadastro write FdataCadastro;
    property AEmpty: string read FAEmpty write FAEmpty;
  end;

  TPessoaArray = array of TPessoa;

  TPessoasList = class(TObjectList)
  private
    function GetItem(Index: integer): TPessoa;
    procedure SetItem(Index: integer; const Value: TPessoa);
  public
    function New: TPessoa;
    procedure New2(Value: TPessoa);
    property Items[Index: integer]: TPessoa read GetItem write SetItem;
  end;

  TArrayPessoa = array of TPessoa;

  TCliente__ = class(TObject)
  private
    //[JSONMarshalled(False)]
    [JSONNameAttribute('FirstName')]
    Fcnpj: string;
    [JSONMarshalled(false)]
    Fnome: string;
    FPessoas: TArray<TPessoa>;
//    FPessoas: TArrayPessoa;
    procedure SetPessoas(const Value: TArray<TPessoa>);
    procedure SetCNPJ(const Value: string);
  public
    procedure AddPessoa(Value: TPessoa);
  published
    property cnpj: string read Fcnpj write SetCNPJ;
    //property Pessoas: TArrayPessoa read FPessoas write SetPessoas;
    property Pessoas: TArray<TPessoa> read FPessoas write SetPessoas;
  end;

  TResp_AcessTokent_ = class
  private
    Fdata_ult_login: TDateTime;
    Fcod_empresa: Integer;
    Fcod_ambiente: Integer;
    Femail: string;
    Ftipo_us: string;
    Fcod_usuario: Integer;
    Ftag_menus_excecoes: string;
    Fexpires_in: Integer;
    Fdata_cad: TDateTime;
    Fnivel: Integer;
    Ftag_perfil_menus: string;
    Fcod_cliente: Integer;
    Fusuario: string;
    Ftoken_type: string;
    Faccess_token: string;
    procedure Setaccess_token(const Value: string);
    procedure Setcod_ambiente(const Value: Integer);
    procedure Setcod_cliente(const Value: Integer);
    procedure Setcod_empresa(const Value: Integer);
    procedure Setcod_usuario(const Value: Integer);
    procedure Setdata_cad(const Value: TDateTime);
    procedure Setdata_ult_login(const Value: TDateTime);
    procedure Setemail(const Value: string);
    procedure Setexpires_in(const Value: Integer);
    procedure Setnivel(const Value: Integer);
    procedure Settag_menus_excecoes(const Value: string);
    procedure Settag_perfil_menus(const Value: string);
    procedure Settipo_us(const Value: string);
    procedure Settoken_type(const Value: string);
    procedure Setusuario(const Value: string);
  public
    property access_token: string read Faccess_token write Setaccess_token;
    property token_type: string read Ftoken_type write Settoken_type;
    property expires_in: Integer read Fexpires_in write Setexpires_in;
    property cod_usuario: Integer read Fcod_usuario write Setcod_usuario;
    property cod_empresa: Integer read Fcod_empresa write Setcod_empresa;
    property cod_cliente: Integer read Fcod_cliente write Setcod_cliente;
    property usuario: string read Fusuario write Setusuario;
    property nivel: Integer read Fnivel write Setnivel;
    property email: string read Femail write Setemail;
    property tipo_us: string read Ftipo_us write Settipo_us;
    property data_cad: TDateTime read Fdata_cad write Setdata_cad;
    property data_ult_login: TDateTime read Fdata_ult_login write Setdata_ult_login;
    property tag_perfil_menus: string read Ftag_perfil_menus write Settag_perfil_menus;
    property tag_menus_excecoes: string read Ftag_menus_excecoes write Settag_menus_excecoes;
    property cod_ambiente: Integer read Fcod_ambiente write Setcod_ambiente;
  end;

  TForm2 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    edUsuarioApi: TEdit;
    edPassowordApi: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Splitter2: TSplitter;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    txtEnvio: TMemo;
    txtEnvioFormat: TMemo;
    GroupBox3: TGroupBox;
    Splitter3: TSplitter;
    txtResposta: TMemo;
    txtRespostaFormat: TMemo;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    Outros: TTabSheet;
    edAcao: TEdit;
    txtTest: TMemo;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    Splitter4: TSplitter;
    txtTestFormat: TMemo;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    Rtti: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    TabSheet4: TTabSheet;
    Panel8: TPanel;
    Panel9: TPanel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    Memo2: TMemo;
    TabSheet5: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    Memo3: TMemo;
    Memo4: TMemo;
    TabSheet6: TTabSheet;
    Panel12: TPanel;
    Panel13: TPanel;
    Memo5: TMemo;
    DBGrid2: TDBGrid;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    TabSheet7: TTabSheet;
    Panel14: TPanel;
    Panel15: TPanel;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Memo6: TMemo;
    DBGrid3: TDBGrid;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    TabSheet8: TTabSheet;
    Panel16: TPanel;
    Panel17: TPanel;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    Memo7: TMemo;
    DBGrid4: TDBGrid;
    TabSheet10: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    Panel18: TPanel;
    Panel19: TPanel;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    Memo8: TMemo;
    DBGrid5: TDBGrid;
    BitBtn32: TBitBtn;
    Panel20: TPanel;
    Panel21: TPanel;
    Memo9: TMemo;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    GroupBox4: TGroupBox;
    BitBtn37: TBitBtn;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    Panel22: TPanel;
    Panel23: TPanel;
    BitBtn38: TBitBtn;
    Memo10: TMemo;
    DBGrid6: TDBGrid;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    TabSheet9: TTabSheet;
    Panel24: TPanel;
    Edit2: TEdit;
    BitBtn43: TBitBtn;
    Panel25: TPanel;
    WebBrowser1: TWebBrowser;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn46: TBitBtn;
    IdHTTP1: TIdHTTP;
    BitBtn47: TBitBtn;
    TabSheet11: TTabSheet;
    ImageList1: TImageList;
    BitBtn48: TBitBtn;
    ListView1: TListView;
    TabSheet14: TTabSheet;
    BitBtn49: TBitBtn;
    MaskEdit1: TMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure WebBrowser1NavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
  private
    { Private declarations }
    AJsonEncodedAcessToken: string;
    AEnderecoPadraoTestesFDB: string;
    ADataSource: TDataSource;
    ADBClient: TClientDataSet;
    AProvider: TDataSetProvider;
    function NovaPessoa: TPessoa;
    function NovaPessoaArray: TPessoa;
    function NovaCPessoa(Cod: Integer; Nome, fone: string; Salario: Double): TCPessoa;
    function EncodeURIComponent(const ASrc: string): UTF8String;
    function GetChaveLoginChatWeb(AEmail, ACNPJ: string): string;
  public
    { Public declarations }
    resRespAdapter: TRESTResponseDataSetAdapter;
    clientData: TClientDataSet;
    dataSource: TDataSource;
    resClient: TRESTClient;
    resRequest: TRESTRequest;
    resResponse: TRESTResponse;
  end;

  TTDictionary_test = class
  private
    Ferros: TDictionary<string, string>;
    Ferrocomb: String;
    Fvalid: String;
    procedure Seterrocomb(const Value: String);
    procedure Seterros(const Value: TDictionary<string, string>);
    procedure Setvalid(const Value: String);
  public
    constructor create;
    destructor Destroy; override;
  published
    property valid: String read Fvalid write Setvalid;
    property erros: TDictionary<string, string> read Ferros write Seterros;// class
    property errocomb: String read Ferrocomb write Seterrocomb;
  end;

  TTDictionary_test2 = class
  private
    Ferrocomb: String;
    Fvalid: String;
    procedure Seterrocomb(const Value: String);
    procedure Setvalid(const Value: String);
  published
    property valid: String read Fvalid write Setvalid;
    property errocomb: String read Ferrocomb write Seterrocomb;
  end;

var
  Form2: TForm2;
  pessoas: TObjectList<TPessoa>;
  pessoas2: array of TPessoa;
  pessoas3: TPessoasList;
  hwAcesso: TResp_AcessTokent_;
  chamado: TChamado;
  Cliente: TCliente__;
  pessoasA: TPessoaArray;

  //// variaveis de testes rtti
  ob01Ipbt: TIBPTProdutoNCM;
  ob02Pessoa: TCPessoa;
  ob03Conexao: TConexao;
  ob04Conexao: TConexao;
  ob05Conexao: TConexao;
  ob0708Conexao: TConexao;
  ob11Conexao: TConexao;


implementation

uses
  hw.utils.dx.teste.Unit4,
  HW.Utils.Classes.Funcoes_DX, Winapi.ShellAPI, System.SysUtils,
  System.DateUtils, System.NetEncoding, REST.HttpClient, System.JSON;

function cloud_sinc(paramsList: WideString): Longint; stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TForm2.BitBtn10Click(Sender: TObject);
begin
  resClient := TRESTClient.Create( Edit1.Text + 'Chamado/PesquisarChamadosTipoLista');
  resRequest := TRESTRequest.Create(resClient);
  resResponse := TRESTResponse.Create(resClient);

  clientData := TClientDataSet.Create(Application);

  dataSource := TDataSource.Create(Application);
  dataSource.DataSet := clientData;

  resRespAdapter := TRESTResponseDataSetAdapter.Create(Application);
  resRespAdapter.Response := resResponse;
  resRespAdapter.Dataset := clientData;

  DBGrid1.DataSource := dataSource;

  try
    resRequest.Response := resResponse;
    resRequest.Method := rmGET;

    with resRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'campoPesq';
      Value := 'data_cadastro';
    end;

    with resRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'dataInicial';
      //Value := '201-02-03T00:00:00';
      Value := '06/02/2017';
    end;

    with resRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'dataFinal';
      //Value := '201-02-03T00:00:00';
      Value := '06/02/2017';
    end;

    with resRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'conteudo';
      Value := '';
    end;

    with resRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'condicao';
      Value := '=';
    end;

    with resRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'tipoPesqData';
      Value := 'true';
    end;

    //padrao
    with resRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'cod_usuario';
      Value := '1';
    end;
    with resRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'cod_empresa';
      Value := '1';
    end;

    with resRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'ativo';
      Value := '1';
    end;

    with resRequest.Params.AddItem do
    begin
      Options := [poDoNotEncode];
      Kind := pkHTTPHEADER;
      name := 'Authorization';
      Value := hwAcesso.token_type + ' ' + hwAcesso.access_token;
    end;

    edAcao.Text := 'Obter o chamado: "Chamado/PesquisarChamadosTipoLista"';
    txtEnvio.Lines.Clear;
    txtEnvioFormat.Clear;

    resRequest.Execute;

    edAcao.Text := edAcao.Text + ' - StatusCode = ' + resResponse.StatusCode.ToString;

    if resResponse.JSONValue <> nil then
    begin
      txtResposta.Text := TJson.JsonEncode(resResponse.JSONValue);
      txtRespostaFormat.Text := TJson.Format(resResponse.JSONValue);
      try
        chamado := TJson.JsonToObject<TChamado>(TJson.Format(resResponse.JSONValue), [joDateFormatMongo]);
      except
      end;
    end;

    resRespAdapter.UpdateDataSet;

  finally
//    FreeAndNil(resRequest);
//    FreeAndNil(resClient);
  end;
end;

procedure TForm2.BitBtn12Click(Sender: TObject);
var
  rootob: string;
begin
  rootob := resRespAdapter.RootElement;

  if not InputQuery('','', rootob) then
    Exit;

  resRespAdapter.RootElement := rootob;
  resRespAdapter.UpdateDataSet;


end;

procedure TForm2.BitBtn13Click(Sender: TObject);
var
  urlenc: string;
begin
  urlenc := 'üü=%[-õ459';
  if not InputQuery('URL encode', 'URL', urlenc) then
    Exit;

//urlenc := URIEncode(urlenc);
//  urlenc := TIdURI.URlEncode(urlenc );
  urlenc := EncodeURIComponent(urlenc);

  InputQuery('URL encode', 'URL', urlenc);
end;

procedure TForm2.BitBtn14Click(Sender: TObject);
var
  objeto: TDisplayLabelAttribute;
  objeto2: TProduct;

begin
  objeto := TDisplayLabelAttribute.Create('valor do objeto');
  objeto2 := TProduct.Create();
  objeto2.Price :=5.66;
  objeto2.Description :='Produto teste';
  objeto2.Marca :='Bematech';

//  txtTest.Lines.Text := TArtifactInspector.DisplayLabelFor( TDisplayLabelAttribute);

//  txtTest.Lines.add(TArtifactInspector.LogChanges( objeto ) );
  txtTest.Lines.add(TArtifactInspector.LogChanges( objeto2 ) );



end;

procedure TForm2.BitBtn15Click(Sender: TObject);
var
  objeto2: TProduct;
begin
//  objeto2 := TProduct.Create();
//  objeto2.Price :=5.66;
//  objeto2.Description :='Produto teste';
//  objeto2.Marca :='Bematech';

//  txtTest.Lines.Text := TArtifactInspector.DisplayLabelFor( TDisplayLabelAttribute);

//  txtTest.Lines.add(TArtifactInspector.LogChanges( objeto ) );
//  objeto2 := TArtifactInspector.RetornaObjetoCriado(TProduct, 'Produto novo', 'Epson', 1.999);
  objeto2 := TArtifactInspector.RetornaObjetoCriado2<TProduct>('Produto novo', 'Epson', 1.999);
//  objeto2 := TArtifactInspector.RetornaObjetoCriado1(TProduct, 'Produto novo', 'Epson', 1.999);

  txtTest.Lines.add(TArtifactInspector.LogChanges( objeto2 ) );
end;

procedure TForm2.BitBtn16Click(Sender: TObject);
var
  objeto2: TContentProdutos;
begin
  //objeto2 := TProductArray.Create();

//  objeto2 := TArtifactInspector.RetornaObjetoCriado2<TProduct>('Produto novo', 'Epson', 1.999);


  txtTest.Lines.add(TArtifactInspector.LogChangesClass( TContentProdutos ) ) ;
end;

procedure TForm2.BitBtn18Click(Sender: TObject);
var
  dbClient: TClientDataSet;
  F: TField;
begin
  dbClient := THwDbConverter.ClassToDBClient(TIBPTProdutoNCM);
  Memo2.Lines.Add(dbClient.Name);
  Memo2.Lines.Add(TArtifactInspector.LogChangesForDebug(dbClient));
  for F in dbClient.Fields do
    Memo2.Lines.Add(TArtifactInspector.LogChangesForDebugLine(F));
end;

procedure TForm2.BitBtn19Click(Sender: TObject);
var
  dbClient: TClientDataSet;
  F: TField;
begin
  dbClient := ob01Ipbt.ToDBClient;
  Memo2.Lines.Add(dbClient.Name);
  Memo2.Lines.Add(TArtifactInspector.LogChangesForDebug(dbClient));
  for F in dbClient.Fields do
    Memo2.Lines.Add(TArtifactInspector.LogChangesForDebugLine(F));
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  RESTRequest1.Execute;
  txtTest.Text:= TJson.JsonEncode(RESTResponse1.JSONValue);
  txtTestFormat.Text:= TJson.Format(RESTResponse1.JSONValue);
end;

procedure TForm2.BitBtn20Click(Sender: TObject);
var
  dbClient: TClientDataSet;
  F: TField;
begin
  dbClient := TClientDataSet.Create(nil);
  dbClient.FieldDefs.Add('CODIGO', Data.DB.ftInteger);
  dbClient.FieldDefs.Add('NOME', Data.DB.ftString, 50);
  dbClient.FieldDefs.Add('DATACADASTRO', Data.DB.ftDateTime);
  dbClient.FieldDefs.Add('TELEFONE', Data.DB.ftString, 14);
  dbClient.FieldDefs.Add('SALARIO', Data.DB.ftFloat);
  dbClient.CreateDataSet;

  Memo3.Lines.Add(dbClient.Name);
  Memo3.Lines.Add(TArtifactInspector.LogChangesForDebug(dbClient));
  for F in dbClient.Fields do
    Memo3.Lines.Add(TArtifactInspector.LogChangesForDebugLine(F));

  THwDbConverter.SetPropertiesFields(TCPessoa, dbClient);

  Memo4.Lines.Add(dbClient.Name);
  Memo4.Lines.Add(TArtifactInspector.LogChangesForDebug(dbClient));
  for F in dbClient.Fields do
    Memo4.Lines.Add(TArtifactInspector.LogChangesForDebugLine(F));
end;

procedure TForm2.BitBtn21Click(Sender: TObject);
var
  dbClient: TClientDataSet;
  F: TField;
begin
  dbClient := TClientDataSet.Create(nil);
  dbClient.FieldDefs.Add('CODIGO', Data.DB.ftInteger);
  dbClient.FieldDefs.Add('NOME', Data.DB.ftString, 50);
  dbClient.FieldDefs.Add('DATACADASTRO', Data.DB.ftDateTime);
  dbClient.FieldDefs.Add('TELEFONE', Data.DB.ftString, 14);
  dbClient.FieldDefs.Add('SALARIO', Data.DB.ftFloat);
  dbClient.CreateDataSet;

  Memo3.Lines.Add(dbClient.Name);
  Memo3.Lines.Add(TArtifactInspector.LogChangesForDebug(dbClient));
  for F in dbClient.Fields do
    Memo3.Lines.Add(TArtifactInspector.LogChangesForDebugLine(F));

  ob02Pessoa.SetPropertiesFields(dbClient);

  Memo4.Lines.Add(dbClient.Name);
  Memo4.Lines.Add(TArtifactInspector.LogChangesForDebug(dbClient));
  for F in dbClient.Fields do
    Memo4.Lines.Add(TArtifactInspector.LogChangesForDebugLine(F));
end;

procedure TForm2.BitBtn22Click(Sender: TObject);
begin
  ob03Conexao.Banco.DataBaseName := AEnderecoPadraoTestesFDB;
  ob03Conexao.Banco.Params.Clear;
  ob03Conexao.Banco.Params.Add('user_name=sysdba');
  ob03Conexao.Banco.Params.Add('password=masterkey');
  if ob03Conexao.conectar then
    Memo5.Lines.Add('Conectado')
  else
    Memo5.Lines.Add('Erro n„o Conectado');
end;

procedure TForm2.BitBtn23Click(Sender: TObject);
var
  APessoa: TCPessoa;
  str: array of string;
begin
  if Assigned(ADBClient) then
    ADBClient.Free;
  ADBClient := TClientDataSet.Create(Self);
  AProvider.DataSet := ob03Conexao.QrAux;
  AProvider.Options := AProvider.Options + [poAllowCommandText];
  ADBClient.ProviderName := AProvider.Name;

  ADBClient.Close;
  ADBClient.CommandText := THwRttiConverter.ClassToSqlSelect(TCPessoa, [], []);
  ADBClient.Params.ParamByName('codigo').AsInteger := 1;
  ADBClient.Open;

  THwDbConverter.SetPropertiesFields(TCPessoa, ADBClient);

  ADataSource.DataSet := ADBClient;
  DBGrid2.DataSource := ADataSource;

  APessoa := TCPessoa.Create;
  APessoa.cod := ADBClient.FieldByName('codigo').AsInteger;
  APessoa.nome := ADBClient.FieldByName('nome').AsString;
  APessoa.datcad := ADBClient.FieldByName('datacadastro').AsDateTime;
  APessoa.fone := ADBClient.FieldByName('telefone').AsString;
  APessoa.salario := ADBClient.FieldByName('salario').AsFloat;

  SetLength(str, 5);
  str[0] := APessoa.cod.ToString;
  str[1] := APessoa.nome;
  str[2] := DateToStr(APessoa.datcad);
  str[3] := APessoa.fone;
  str[4] := APessoa.salario.ToString;

  if not InputQuery('Objeto', ['Codigo', 'Nome', 'Data cadastro', 'Telefone', 'Salario'], str) then
    exit;

  APessoa.cod := StrToInt(str[0]);
  APessoa.nome := str[1];
  APessoa.datcad := StrToDateDef(str[2], date);
  APessoa.fone := str[3];
  APessoa.salario := StrToFloatDef(str[4],0);

  if RadioButton1.Checked then
    THwDbConverter.ObjectToDataSetRow(APessoa, DBGrid2.DataSource.DataSet, hwrtacUpdate);
  if RadioButton2.Checked then
    THwDbConverter.ObjectToDataSetRow(APessoa, DBGrid2.DataSource.DataSet, hwrtacInsert);
  if RadioButton3.Checked then
    THwDbConverter.ObjectToDataSetRow(APessoa, DBGrid2.DataSource.DataSet, hwrtacApend);

  Memo5.Lines.Add(APessoa.ToJsonStringFormat);
end;

procedure TForm2.BitBtn24Click(Sender: TObject);
begin
  ob04Conexao.Banco.DataBaseName := AEnderecoPadraoTestesFDB;
  ob04Conexao.Banco.Params.Clear;
  ob04Conexao.Banco.Params.Add('user_name=sysdba');
  ob04Conexao.Banco.Params.Add('password=masterkey');
  if ob04Conexao.conectar then
    Memo6.Lines.Add('Conectado')
  else
    Memo6.Lines.Add('Erro n„o Conectado');
end;

procedure TForm2.BitBtn25Click(Sender: TObject);
var
  APessoa: TCPessoa;
  str: array of string;
begin
  if Assigned(ADBClient) then
    ADBClient.Free;
  ADBClient := TClientDataSet.Create(Self);
  AProvider.DataSet := ob04Conexao.QrAux;
  AProvider.Options := AProvider.Options + [poAllowCommandText];
  ADBClient.ProviderName := AProvider.Name;

  ADBClient.Close;
  ADBClient.CommandText := THwRttiConverter.ClassToSqlSelect(TCPessoa, [], []);
  ADBClient.Params.ParamByName('codigo').AsInteger := 1;
  ADBClient.Open;

  THwDbConverter.SetPropertiesFields(TCPessoa, ADBClient);

  ADataSource.DataSet := ADBClient;
  DBGrid3.DataSource := ADataSource;

  APessoa := TCPessoa.Create;
  APessoa.cod := ADBClient.FieldByName('codigo').AsInteger;
  APessoa.nome := ADBClient.FieldByName('nome').AsString;
  APessoa.datcad := ADBClient.FieldByName('datacadastro').AsDateTime;
  APessoa.fone := ADBClient.FieldByName('telefone').AsString;
  APessoa.salario := ADBClient.FieldByName('salario').AsFloat;

  SetLength(str, 5);
  str[0] := APessoa.cod.ToString;
  str[1] := APessoa.nome;
  str[2] := DateToStr(APessoa.datcad);
  str[3] := APessoa.fone;
  str[4] := APessoa.salario.ToString;

  if not InputQuery('Objeto', ['Codigo', 'Nome', 'Data cadastro', 'Telefone', 'Salario'], str) then
    exit;

  APessoa.cod := StrToInt(str[0]);
  APessoa.nome := str[1];
  APessoa.datcad := StrToDateDef(str[2], date);
  APessoa.fone := str[3];
  APessoa.salario := StrToFloatDef(str[4],0);

  if RadioButton4.Checked then
    THwDbConverter.ObjectToDBClientRow(APessoa, ADBClient, hwrtacUpdate, [hwrtacApplyClient]);
  if RadioButton5.Checked then
    THwDbConverter.ObjectToDBClientRow(APessoa, ADBClient, hwrtacInsert);
  if RadioButton6.Checked then
    THwDbConverter.ObjectToDBClientRow(APessoa, ADBClient, hwrtacApend);

  if ob04Conexao.Transacao.InTransaction then
    ob04Conexao.Transacao.Commit;

  Memo6.Lines.Add(APessoa.ToJsonStringFormat);
end;

procedure TForm2.BitBtn26Click(Sender: TObject);
var
  APessoa: TCPessoa;
  str: array of string;
begin
  if Assigned(ADBClient) then
    ADBClient.Free;
  ADBClient := TClientDataSet.Create(Self);
  AProvider.DataSet := ob03Conexao.QrAux;
  AProvider.Options := AProvider.Options + [poAllowCommandText];
  ADBClient.ProviderName := AProvider.Name;

  ADBClient.Close;
  ADBClient.CommandText := THwRttiConverter.ClassToSqlSelect(TCPessoa, [], []);
  ADBClient.Params.ParamByName('codigo').AsInteger := 1;
  ADBClient.Open;

  THwDbConverter.SetPropertiesFields(TCPessoa, ADBClient);

  ADataSource.DataSet := ADBClient;
  DBGrid2.DataSource := ADataSource;

  APessoa := TCPessoa.Create;
  APessoa.cod := ADBClient.FieldByName('codigo').AsInteger;
  APessoa.nome := ADBClient.FieldByName('nome').AsString;
  APessoa.datcad := ADBClient.FieldByName('datacadastro').AsDateTime;
  APessoa.fone := ADBClient.FieldByName('telefone').AsString;
  APessoa.salario := ADBClient.FieldByName('salario').AsFloat;

  SetLength(str, 5);
  str[0] := APessoa.cod.ToString;
  str[1] := APessoa.nome;
  str[2] := DateToStr(APessoa.datcad);
  str[3] := APessoa.fone;
  str[4] := APessoa.salario.ToString;

  if not InputQuery('Objeto', ['Codigo', 'Nome', 'Data cadastro', 'Telefone', 'Salario'], str) then
    exit;

  APessoa.cod := StrToInt(str[0]);
  APessoa.nome := str[1];
  APessoa.datcad := StrToDateDef(str[2], date);
  APessoa.fone := str[3];
  APessoa.salario := StrToFloatDef(str[4],0);

  if RadioButton1.Checked then
    APessoa.ToDataSetRow(DBGrid2.DataSource.DataSet, hwrtacUpdate);
  if RadioButton2.Checked then
    APessoa.ToDataSetRow(DBGrid2.DataSource.DataSet, hwrtacInsert);
  if RadioButton3.Checked then
    APessoa.ToDataSetRow(DBGrid2.DataSource.DataSet, hwrtacApend);

  Memo5.Lines.Add(APessoa.ToJsonStringFormat);
end;

procedure TForm2.BitBtn27Click(Sender: TObject);
var
  APessoa: TCPessoa;
  str: array of string;
begin
  APessoa := TCPessoa.Create;
  APessoa.cod := 2;
  APessoa.nome := 'Novo';
  APessoa.datcad := date;
  APessoa.fone := '3332762114';
  APessoa.salario := 5.54;

  SetLength(str, 5);
  str[0] := APessoa.cod.ToString;
  str[1] := APessoa.nome;
  str[2] := DateToStr(APessoa.datcad);
  str[3] := APessoa.fone;
  str[4] := APessoa.salario.ToString;

  if not InputQuery('Objeto', ['Codigo', 'Nome', 'Data cadastro', 'Telefone', 'Salario'], str) then
    exit;

  APessoa.cod := StrToInt(str[0]);
  APessoa.nome := str[1];
  APessoa.datcad := StrToDateDef(str[2], date);
  APessoa.fone := str[3];
  APessoa.salario := StrToFloatDef(str[4],0);

//  if RadioButton1.Checked then
//    ADBClient := APessoa.ToDataSetRow(nil, hwrtacUpdate);
  if RadioButton5.Checked then
    ADBClient := APessoa.ToDBClientRow(nil, hwrtacInsert);
  if RadioButton6.Checked then
    ADBClient := APessoa.ToDBClientRow(nil, hwrtacApend);

  ADataSource.DataSet := ADBClient;
  DBGrid3.DataSource := ADataSource;
  THwDbConverter.SetPropertiesFields(TCPessoa, ADBClient);

  Memo6.Lines.Add(APessoa.ToJsonStringFormat);
end;

procedure TForm2.BitBtn28Click(Sender: TObject);
begin
  ob05Conexao.Banco.DataBaseName := AEnderecoPadraoTestesFDB;
  ob05Conexao.Banco.Params.Clear;
  ob05Conexao.Banco.Params.Add('user_name=sysdba');
  ob05Conexao.Banco.Params.Add('password=masterkey');
  if ob05Conexao.conectar then
    Memo7.Lines.Add('Conectado')
  else
    Memo7.Lines.Add('Erro n„o Conectado');
end;

procedure TForm2.BitBtn29Click(Sender: TObject);
var
  APessoa: TCPessoa;
//  AsPessoas: TObjectList<TCPessoa>;
  AsPessoas: TArray<TCPessoa>;
  str: array of string;
  AMax: Integer;
begin

  if Assigned(ADBClient) then
    ADBClient.Free;
  ADBClient := TClientDataSet.Create(Self);
  AProvider.DataSet := ob05Conexao.QrAux;
  AProvider.Options := AProvider.Options + [poAllowCommandText];
  ADBClient.ProviderName := AProvider.Name;

  ADBClient.Close;
  ADBClient.CommandText := 'select * from cpessoa order by codigo';
  ADBClient.Open;
  ADBClient.Last;
  AMax := ADBClient.FieldByName('codigo').AsInteger;

  SetLength(AsPessoas, 5);

  AsPessoas[0] := NovaCPessoa(AMax + 1, 'jose', '3322332255', 1500);
  AsPessoas[1] := NovaCPessoa(AMax + 2, 'joao', '3332725351', 2500);
  AsPessoas[2] := NovaCPessoa(AMax + 3, 'antonio', '3332762114', 3500);
  AsPessoas[3] := NovaCPessoa(AMax + 4, 'maria', '3355447788', 4500);
  AsPessoas[4] := NovaCPessoa(AMax + 5, 'geraldo', '3388556699', 5500);

//  AsPessoas := TObjectList<TCPessoa>.Create();
//  AsPessoas.Add(NovaCPessoa(AMax + 1, 'jose', '3322332255', 1500));
//  AsPessoas.Add(NovaCPessoa(AMax + 2, 'joao', '3332725351', 2500));
//  AsPessoas.Add(NovaCPessoa(AMax + 3, 'antonio', '3332762114', 3500));
//  AsPessoas.Add(NovaCPessoa(AMax + 4, 'maria', '3355447788', 4500));
//  AsPessoas.Add(NovaCPessoa(AMax + 5, 'geraldo', '3388556699', 5500));

  THwDbConverter.SetPropertiesFields(TCPessoa, ADBClient);

  ADataSource.DataSet := ADBClient;
  DBGrid4.DataSource := ADataSource;

  THwDbConverter.ObjectToDataSet<TCPessoa>(AsPessoas, DBGrid4.DataSource.DataSet);

//  Memo7.Lines.Add( TJson.Format(TJson.ObjectToJsonObject(AsPessoas)));
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  pessoas.Add(NovaPessoa);
  txtTest.Text := TJson.ObjectToJsonString(pessoas, [joDateFormatISO8601]);
  txtTestFormat.Text := TJson.Format(TJson.ObjectToJsonObject(pessoas, [joDateFormatISO8601]));
end;

procedure TForm2.BitBtn30Click(Sender: TObject);
begin
  ob0708Conexao.Banco.DataBaseName := AEnderecoPadraoTestesFDB;
  ob0708Conexao.Banco.Params.Clear;
  ob0708Conexao.Banco.Params.Add('user_name=sysdba');
  ob0708Conexao.Banco.Params.Add('password=masterkey');
  if ob0708Conexao.conectar then
    Memo8.Lines.Add('Conectado')
  else
    Memo8.Lines.Add('Erro n„o Conectado');
end;

procedure TForm2.BitBtn31Click(Sender: TObject);
var
  APessoa: TCPessoa;
  str: array of string;
begin
  if Assigned(ADBClient) then
    ADBClient.Free;
  ADBClient := TClientDataSet.Create(Self);
  AProvider.DataSet := ob0708Conexao.QrAux;
  AProvider.Options := AProvider.Options + [poAllowCommandText];
  ADBClient.ProviderName := AProvider.Name;

  ADBClient.Close;
  ADBClient.CommandText := THwRttiConverter.ClassToSqlSelect(TCPessoa, [], []);
  ADBClient.Params.ParamByName('codigo').AsInteger := 1;
  ADBClient.Open;

  THwDbConverter.SetPropertiesFields(TCPessoa, ADBClient);

  ADataSource.DataSet := ADBClient;
  DBGrid5.DataSource := ADataSource;

  APessoa := THwDbConverter.DataSetRowToObject<TCPessoa>(ADBClient);

  Memo8.Lines.Add(APessoa.ToJsonStringFormat);
  Memo8.Lines.Add('Data.DBXJSON');
  Memo8.Lines.Add(APessoa.GetJSONMarshallString);
end;

procedure TForm2.BitBtn32Click(Sender: TObject);
var
  AsPessoas: TArray<TCPessoa>;
  APessoa: TCPessoa;
  str: array of string;
begin
  if Assigned(ADBClient) then
    ADBClient.Free;
  ADBClient := TClientDataSet.Create(Self);
  AProvider.DataSet := ob0708Conexao.QrAux;
  AProvider.Options := AProvider.Options + [poAllowCommandText];
  ADBClient.ProviderName := AProvider.Name;

  ADBClient.Close;
  ADBClient.CommandText := 'select * from cpessoa';
  ADBClient.Open;

  THwDbConverter.SetPropertiesFields(TCPessoa, ADBClient);

  ADataSource.DataSet := ADBClient;
  DBGrid5.DataSource := ADataSource;

  AsPessoas := THwDbConverter.DataSetToObject<TCPessoa>(ADBClient);

  for APessoa in AsPessoas do
    Memo8.Lines.Add(APessoa.ToJsonStringFormat);
end;

procedure TForm2.BitBtn33Click(Sender: TObject);
begin
  Memo9.Lines.Clear;
  Memo9.Lines.Add(THwRttiConverter.ClassToSqlUpdateOrInsert(TCPessoa, []));
  Memo9.Lines.Add('');
  Memo9.Lines.Add(THwRttiConverter.ClassToSqlUpdateOrInsert(TIBPTProdutoNCM, []));
  Memo9.Lines.Add('');
end;

procedure TForm2.BitBtn34Click(Sender: TObject);
begin
  Memo9.Lines.Clear;
  Memo9.Lines.Add(THwRttiConverter.ClassToSqlUpdate(TCPessoa, [], []));
  Memo9.Lines.Add('');
  Memo9.Lines.Add(THwRttiConverter.ClassToSqlUpdate(TIBPTProdutoNCM, ['dataconsulta'], ['codigo', 'uf']));
  Memo9.Lines.Add('');
end;

procedure TForm2.BitBtn35Click(Sender: TObject);
begin
  Memo9.Lines.Clear;
  Memo9.Lines.Add(THwRttiConverter.ClassToSqlInsert(TCPessoa, []));
  Memo9.Lines.Add('');
  Memo9.Lines.Add(THwRttiConverter.ClassToSqlInsert(TIBPTProdutoNCM,
    ['CODIGO', 'UF', 'EX', 'DESCRICAO', 'NACIONAL', 'ESTADUAL', 'IMPORTADO', 'MUNICIPAL', 'TIPO']));
  Memo9.Lines.Add('');
end;

procedure TForm2.BitBtn36Click(Sender: TObject);
begin
  Memo9.Lines.Clear;
  Memo9.Lines.Add(THwRttiConverter.ClassToSqlSelect(TCPessoa, [], ['datacadastro', 'salario']));
  Memo9.Lines.Add('');
  Memo9.Lines.Add(THwRttiConverter.ClassToSqlSelect(TIBPTProdutoNCM,
    ['CODIGO', 'UF', 'EX', 'DESCRICAO', 'NACIONAL', 'ESTADUAL', 'IMPORTADO', 'MUNICIPAL', 'TIPO'], []));
  Memo9.Lines.Add('');
end;

procedure TForm2.BitBtn37Click(Sender: TObject);
begin
  Memo9.Lines.Clear;
  if RadioButton7.Checked then
    Memo9.Lines.Add(THwRttiConverter.ClassToSql(TCPessoa, hwrtacUpdate, ['salario'], []))
  else if RadioButton8.Checked then
    Memo9.Lines.Add(THwRttiConverter.ClassToSql(TCPessoa, hwrtacInsert, [], []))
  else if RadioButton9.Checked then
    Memo9.Lines.Add(THwRttiConverter.ClassToSql(TCPessoa, hwrtacSelect, [], []));

  Memo9.Lines.Add('');

  if RadioButton7.Checked then
    Memo9.Lines.Add(THwRttiConverter.ClassToSql(TIBPTProdutoNCM, hwrtacUpdate, ['nacional', 'estadual', 'importado', 'municipal'], []))
  else if RadioButton8.Checked then
    Memo9.Lines.Add(THwRttiConverter.ClassToSql(TIBPTProdutoNCM, hwrtacInsert, [], []))
  else if RadioButton9.Checked then
    Memo9.Lines.Add(THwRttiConverter.ClassToSql(TIBPTProdutoNCM, hwrtacSelect, ['vigenciainicio', 'vigenciafim' ], ['codigo', 'uf']));
  Memo9.Lines.Add('');
end;

procedure TForm2.BitBtn38Click(Sender: TObject);
begin
  if ob11Conexao.Banco.Connected then
    ob11Conexao.Banco.Connected := False;
  ob11Conexao.Banco.DataBaseName := AEnderecoPadraoTestesFDB;
  ob11Conexao.Banco.Params.Clear;
  ob11Conexao.Banco.Params.Add('user_name=sysdba');
  ob11Conexao.Banco.Params.Add('password=masterkey');

  if ob11Conexao.conectar then
    Memo10.Lines.Add('Conectado')
  else
    Memo10.Lines.Add('Erro n„o Conectado');


  if Assigned(ADBClient) then
    ADBClient.Free;
  ADBClient := TClientDataSet.Create(Self);
  AProvider.DataSet := ob11Conexao.QrAux;
  AProvider.Options := AProvider.Options + [poAllowCommandText];
  ADBClient.ProviderName := AProvider.Name;

  ADBClient.Close;
  ADBClient.CommandText := THwRttiConverter.ClassToSqlSelect(TCPessoa, [], ['']);// 'select * from cpessoa';
  ADBClient.Open;

  THwDbConverter.SetPropertiesFields(TCPessoa, ADBClient);

  ADataSource.DataSet := ADBClient;
  DBGrid6.DataSource := ADataSource;
end;

procedure TForm2.BitBtn39Click(Sender: TObject);
var
  APessoa: TCPessoa;
begin
  APessoa := THwDbConverter.DataSetRowToObject<TCPessoa>(ADBClient);
  ADBClient.Close;
  ADBClient.CommandText := THwRttiConverter.ClassToSqlSelect(TCPessoa, ['codigo', 'nome', 'datacadastro', 'salario'], ['datacadastro']);
  THwRttiConverter.SetObjectToDataSetParams(APessoa, ADBClient.Params);
  ADBClient.Open;
  THwDbConverter.SetPropertiesFields(TCPessoa, ADBClient);
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
var
  restClient: TRESTClient;
  restRequest: TRESTRequest;
  restResponse: TRESTResponse;
  FuserNameApi: string;
  FpasswordApi: string;
begin
  restClient := TRESTClient.Create(Edit1.Text + 'security/token');
  restRequest := TRESTRequest.Create(restClient);
  restResponse := TRESTResponse.Create(restClient);
  try
    FuserNameApi := edUsuarioApi.Text;
    FpasswordApi := edPassowordApi.Text;

    restRequest.Response := restResponse;
    restRequest.Method := rmPOST;
    with restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'grant_type';
      Value := 'password';
    end;
    with restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'username';
      Value := FuserNameApi;
//      Value := 'joaopedro@hwsistemas.com.br';
    end;
    with restRequest.Params.AddItem do
    begin
      Options := [poDoNotEncode];
      Kind := pkGETorPOST;
      name := 'password';
      Value := EncodeURIComponent(FpasswordApi);
//      Value := REST.Utils.URIEncode(FpasswordApi);
//      Value := '^/||';
    end;

    edAcao.Text := 'Pedido de acesso: security/token';
    txtEnvio.Lines.Clear;
    txtEnvioFormat.Lines.Clear;

    restRequest.Execute;

    edAcao.Text := edAcao.Text + ' - StatusCode = ' + restResponse.StatusCode.ToString;

    txtResposta.Lines.Text := TJson.JsonEncode(restResponse.JSONValue);
    AJsonEncodedAcessToken := TJson.JsonEncode(restResponse.JSONValue);
    txtRespostaFormat.Lines.Text := TJson.Format(restResponse.JSONValue);// jValue.ToString();

    hwAcesso := TJson.JsonToObject<TResp_AcessTokent_>(TJson.Format(restResponse.JSONValue));

    txtResposta.Lines.Add('access_token = ' + hwAcesso.access_token);
    txtResposta.Lines.Add('token_type = ' + hwAcesso.token_type);
    txtResposta.Lines.Add('expires_in = ' + hwAcesso.expires_in.ToString);
    txtResposta.Lines.Add('cod_usuario = ' + hwAcesso.cod_usuario.ToString);
    txtResposta.Lines.Add('cod_empresa = ' + hwAcesso.cod_empresa.ToString);
    txtResposta.Lines.Add('cod_cliente = ' + hwAcesso.cod_cliente.ToString);
    txtResposta.Lines.Add('usuario = ' + hwAcesso.usuario);
    txtResposta.Lines.Add('nivel = ' + hwAcesso.nivel.ToString);
    txtResposta.Lines.Add('email = ' + hwAcesso.email);
    txtResposta.Lines.Add('tipo_us = ' + hwAcesso.tipo_us);
    txtResposta.Lines.Add('data_cad = ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', hwAcesso.data_cad));
    txtResposta.Lines.Add('data_ult_login = ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', hwAcesso.data_ult_login));
    txtResposta.Lines.Add('tag_perfil_menus = ' + hwAcesso.tag_perfil_menus);
    txtResposta.Lines.Add('tag_menus_excecoes = ' + hwAcesso.tag_menus_excecoes);
    txtResposta.Lines.Add('cod_ambiente = ' + hwAcesso.cod_ambiente.ToString);
    PageControl1.ActivePage := TabSheet1;

  finally
    FreeAndNil(restRequest);
    FreeAndNil(restClient);
  end;
end;

procedure TForm2.BitBtn40Click(Sender: TObject);
var
  APessoa: TCPessoa;
  str: array of string;
begin
  APessoa := THwDbConverter.DataSetRowToObject<TCPessoa>(ADBClient);

  SetLength(str, 4);
  str[0] := APessoa.nome;
  str[1] := DateToStr(APessoa.datcad);
  str[2] := APessoa.fone;
  str[3] := APessoa.salario.ToString;

  if not InputQuery('Pessoa codigo ' + APessoa.cod.ToString, ['Nome', 'Data cadastro', 'Telefone', 'Salario'], str) then
    exit;

  APessoa.nome := str[0];
  APessoa.datcad := StrToDateDef(str[1], date);
  APessoa.fone := str[2];
  APessoa.salario := StrToFloatDef(str[3],0);

  ob11Conexao.QrAux.Close;
  ob11Conexao.QrAux.SQL.Text := THwRttiConverter.ClassToSqlUpdate(TCPessoa, ['nome', 'datacadastro', 'telefone', 'salario'], [] );
  THwRttiConverter.SetObjectToDataSetParams(APessoa, ob11Conexao.QrAux.Params);
  ob11Conexao.QrAux.ExecSQL;

  if ob11Conexao.QrAux.Transaction.InTransaction then
    ob11Conexao.QrAux.Transaction.Commit;

  ADBClient.Close;
  ADBClient.Open;
end;

procedure TForm2.BitBtn41Click(Sender: TObject);
var
  APessoa: TCPessoa;
  str: array of string;
begin
  APessoa := TCPessoa.Create;// THwDbConverter.DataSetRowToObject<TCPessoa>(ADBClient);

  ob11Conexao.QrAux.Close;
  ob11Conexao.QrAux.SQL.Text := 'select max(codigo) codigo from cpessoa';
  ob11Conexao.QrAux.Open;

  SetLength(str, 5);
  str[0] := (ob11Conexao.QrAux.FieldByName('codigo').AsInteger + 1).ToString;
  str[1] := 'Nome da pessoa';
  str[2] := DateToStr(date);
  str[3] := '';
  str[4] := '0,00';

  if not InputQuery('Objeto', ['Codigo', 'Nome', 'Data cadastro', 'Telefone', 'Salario'], str) then
    exit;

  APessoa.cod := StrToInt(str[0]);
  APessoa.nome := str[1];
  APessoa.datcad := StrToDateDef(str[2], date);
  APessoa.fone := str[3];
  APessoa.salario := StrToFloatDef(str[4],0);

  ob11Conexao.QrAux.Close;
  ob11Conexao.QrAux.SQL.Text := THwRttiConverter.ClassToSqlInsert(TCPessoa, []);
  THwRttiConverter.SetObjectToDataSetParams(APessoa, ob11Conexao.QrAux.Params);
  ob11Conexao.QrAux.ExecSQL;

  if ob11Conexao.QrAux.Transaction.InTransaction then
    ob11Conexao.QrAux.Transaction.Commit;

  ADBClient.Close;
  ADBClient.Open;
end;

procedure TForm2.BitBtn42Click(Sender: TObject);
var
  APessoa: TCPessoa;
  AsPessoas: TArray<TCPessoa>;
  str: array of string;
  AMax: Integer;
begin
  AMax := 0;
  SetLength(AsPessoas, 5);

  AsPessoas[0] := NovaCPessoa(AMax + 1, 'jose', '3322332255', 1500);
  AsPessoas[1] := NovaCPessoa(AMax + 2, 'joao', '3332725351', 2500);
  AsPessoas[2] := NovaCPessoa(AMax + 3, 'antonio', '3332762114', 3500);
  AsPessoas[3] := NovaCPessoa(AMax + 4, 'maria', '3355447788', 4500);
  AsPessoas[4] := NovaCPessoa(AMax + 5, 'geraldo', '3388556699', 5500);

  ADBClient := THwDbConverter.ObjectToDBClient<TCPessoa>(AsPessoas);

  ADataSource.DataSet := ADBClient;
  DBGrid4.DataSource := ADataSource;
end;

procedure TForm2.BitBtn43Click(Sender: TObject);
begin
  Edit4.Text := Edit2.Text +
    THwUtilsClass.EncodeURIParameter(AJsonEncodedAcessToken);
//    WinExec( PAnsiChar( Edit4.Text ), SW_NORMAL);
  ShellExecute(Handle, 'open', PChar(Edit4.Text), nil, nil, SW_SHOWNORMAL);
//  WebBrowser1.Navigate( Edit4.Text );

end;

procedure TForm2.BitBtn44Click(Sender: TObject);
var
  restClient: TRESTClient;
  restRequest: TRESTRequest;
  restResponse: TRESTResponse;
  FuserNameApi: string;
  FpasswordApi: string;
  FUrl: string;
  ACnpj: string;
begin
  restClient := TRESTClient.Create(Edit1.Text + 'security/token');
  restRequest := TRESTRequest.Create(restClient);
  restResponse := TRESTResponse.Create(restClient);
  try

    FuserNameApi := 'joaopedro@hwsistemas.com.br';
    ACnpj := '03530705000109';
    if not InputQuery('Email','Informe o email', FuserNameApi) then
      Exit;
    if not InputQuery('CNPJ','Informe o CNPJ', ACnpj) then
      Exit;

    FpasswordApi := GetChaveLoginChatWeb( FuserNameApi, ACnpj);

    restRequest.Response := restResponse;
    restRequest.Method := rmPOST;
    with restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'grant_type';
      Value := 'password';
    end;
    with restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'username';
      Value := FuserNameApi;
//      Value := 'joaopedro@hwsistemas.com.br';
    end;
    with restRequest.Params.AddItem do
    begin
      Options := [poDoNotEncode];
      Kind := pkGETorPOST;
      name := 'password';
      Value := EncodeURIComponent(FpasswordApi);
//      Value := REST.Utils.URIEncode(FpasswordApi);
//      Value := '^/||';
    end;

    edAcao.Text := 'Pedido de acesso: security/token';
    txtEnvio.Lines.Clear;
    txtEnvioFormat.Lines.Clear;

    restRequest.Execute;

    edAcao.Text := edAcao.Text + ' - StatusCode = ' + restResponse.StatusCode.ToString;

    txtResposta.Lines.Text := TJson.JsonEncode(restResponse.JSONValue);
    AJsonEncodedAcessToken := TJson.JsonEncode(restResponse.JSONValue);
    txtRespostaFormat.Lines.Text := TJson.Format(restResponse.JSONValue);// jValue.ToString();

    hwAcesso := TJson.JsonToObject<TResp_AcessTokent_>(TJson.Format(restResponse.JSONValue));

    txtResposta.Lines.Add('access_token = ' + hwAcesso.access_token);
    txtResposta.Lines.Add('token_type = ' + hwAcesso.token_type);
    txtResposta.Lines.Add('expires_in = ' + hwAcesso.expires_in.ToString);
    txtResposta.Lines.Add('cod_usuario = ' + hwAcesso.cod_usuario.ToString);
    txtResposta.Lines.Add('cod_empresa = ' + hwAcesso.cod_empresa.ToString);
    txtResposta.Lines.Add('cod_cliente = ' + hwAcesso.cod_cliente.ToString);
    txtResposta.Lines.Add('usuario = ' + hwAcesso.usuario);
    txtResposta.Lines.Add('nivel = ' + hwAcesso.nivel.ToString);
    txtResposta.Lines.Add('email = ' + hwAcesso.email);
    txtResposta.Lines.Add('tipo_us = ' + hwAcesso.tipo_us);
    txtResposta.Lines.Add('data_cad = ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', hwAcesso.data_cad));
    txtResposta.Lines.Add('data_ult_login = ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', hwAcesso.data_ult_login));
    txtResposta.Lines.Add('tag_perfil_menus = ' + hwAcesso.tag_perfil_menus);
    txtResposta.Lines.Add('tag_menus_excecoes = ' + hwAcesso.tag_menus_excecoes);
    txtResposta.Lines.Add('cod_ambiente = ' + hwAcesso.cod_ambiente.ToString);

    FUrl :=
      'hw.webbrowser.exe ' +
      '"http://hwsistemas.homelinux.com/hwteste/MinhaConta/LoginERP?sessao=' +
      THwUtilsClass.EncodeURIParameter(AJsonEncodedAcessToken) + '"';

    ShellExecute(Handle, 'open', PChar(FUrl), nil, nil, SW_SHOWNORMAL);

  finally
    FreeAndNil(restRequest);
    FreeAndNil(restClient);
  end;
end;

procedure TForm2.BitBtn45Click(Sender: TObject);
var
  restClient: TRESTClient;
  restRequest: TRESTRequest;
  restResponse: TRESTResponse;
  FuserNameApi: string;
  FpasswordApi: string;
begin
  restClient := TRESTClient.Create(Edit1.Text + 'Geral/VerificarSeTokenEstaAtivo');
  restRequest := TRESTRequest.Create(restClient);
  restResponse := TRESTResponse.Create(restClient);
  try
    restRequest.Response := restResponse;
    restRequest.Method := rmGET;

    with restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'cod_usuario';
      Value := '1';
    end;
    with restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'cod_empresa';
      Value := '1';
    end;
    with restRequest.Params.AddItem do
    begin
      Options := [poDoNotEncode];
      Kind := pkHTTPHEADER;
      name := 'Authorization';
      Value := hwAcesso.token_type + ' w' + hwAcesso.access_token;
    end;

    edAcao.Text := 'Verificar token de acesso: Geral/VerificarSeTokenEstaAtivo';
    txtEnvio.Lines.Clear;
    txtEnvioFormat.Lines.Clear;

    try
      restRequest.Execute;

      edAcao.Text := edAcao.Text + ' - StatusCode = ' + restResponse.StatusCode.ToString;

    except
      on E: EHTTPProtocolException do
      begin
        edAcao.Text := edAcao.Text + ' - StatusCode = ' + restResponse.StatusCode.ToString + e.Message;
      end;

      on E: exception do
      begin
        edAcao.Text := edAcao.Text + ' - StatusCode = ' + restResponse.StatusCode.ToString + e.Message;
      end;


    end;

    PageControl1.ActivePage := TabSheet1;

  finally
    FreeAndNil(restRequest);
    FreeAndNil(restClient);
  end;
end;

procedure TForm2.BitBtn46Click(Sender: TObject);
var
  AJO: TJSONObject;
//  AJO: TJSONArray;
  APa: TJSONPair;
  APessoas: TPessoaArray;
  lMarshal: TJSONMarshal;
begin

  SetLength(APessoas, 2);
  APessoas[0] := NovaPessoa;
  APessoas[1] := NovaPessoa;

  txtTest.Text := TJson.ObjectToJsonString(NovaPessoa, [joDateFormatISO8601]);
  txtTestFormat.Text := TJson.Format(TJson.ObjectToJsonObject(pessoas, [joDateFormatISO8601]));

  AJO := TJSONObject.ParseJSONValue
         (
           TEncoding.UTF8.GetBytes
           (
             TJson.ObjectToJsonString(NovaPessoa)

//           '{"data_ult_login":"","cod_empresa":1,"funcao":"","setores":null,"email":"Odilon9@ciale.com.br","tipo_us":"C","exibir_site_inst":"","ativo":0,"cod_usuario":0,"data_mod":"2017-05-25T00:00:00-03:00","data_login":"","cod_us_mod":0,' +
//           '"tag_menus_excecoes":"","data_cad":"2017-05-25T00:00:00-03:00","token":"","nivel":0,"senha":"","dir_imagem_us":"","seqmod":0,"tag_perfil_menus":"|CLIENTE|","cod_cliente":7,"cod_usuario_integra":0,"chave_temp":"",' +
//           '"nome_cliente":"Odilo\"n","usuario":""}'

//             TJson.JsonEncode
//             (
//               TJson.ObjectToJsonString(pessoas, [joDateFormatISO8601])
//             )
           ),0
         ) as TJSONObject;
  txtTest.Lines.Add('JSONObject');
  txtTest.Lines.Add(AJO.ToString);

  txtTest.Lines.Add('AJO.Count' + #13);
  txtTest.Lines.Add(AJO.Count.ToString);
//  for I := Low to High do

//  txtTest.Lines.Add(AJO.Count.ToString);


end;

procedure TForm2.BitBtn47Click(Sender: TObject);
var
  resp: THWRest_RequestResponseModal1;
begin
  resp := THWRest_RequestResponseModal1.FromJsonString(
    '{"Status":"ErroInconsistencia","Corpo":{"Participante.UsuarioID":"O usu√°rio atual n√£o participa do ticket"}}');

  ShowMessage(resp.Status);
end;

procedure TForm2.BitBtn48Click(Sender: TObject);
begin
  with ListView1.Items.Add do
  begin
    Caption := '..';
    ImageIndex := 1;
    SubItems.Add('Filename');
    SubItems.Add('PathFile\Filename');
  end;
end;

procedure TForm2.BitBtn49Click(Sender: TObject);
begin
  cloud_sinc(WideString(MaskEdit1.Text));
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
var
  restClient: TRESTClient;
  restRequest: TRESTRequest;
  restResponse: TRESTResponse;
begin
  restClient := TRESTClient.Create( Edit1.Text + 'Chamado/GetChamadoTipoLista');
  restRequest := TRESTRequest.Create(restClient);
  restResponse := TRESTResponse.Create(restClient);

  try
    restRequest.Response := restResponse;
    restRequest.Method := rmGET;

    with restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'cod_usuario';
      Value := '1';
    end;
    with restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'cod_empresa';
      Value := '1';
    end;
    with restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'cod_chamado';
//      Value := '529';
//      Value := '3879';
      Value := '5677';
    end;
    with restRequest.Params.AddItem do
    begin
      Options := [poDoNotEncode];
      Kind := pkHTTPHEADER;
      name := 'Authorization';
      Value := hwAcesso.token_type + ' ' + hwAcesso.access_token;
    end;

    edAcao.Text := 'Obter o chamado: "Chamado/GetChamadoTipoLista"';
    txtEnvio.Lines.Clear;
    txtEnvioFormat.Clear;

    restRequest.Execute;

    edAcao.Text := edAcao.Text + ' - StatusCode = ' + restResponse.StatusCode.ToString;

    if restResponse.JSONValue <> nil then
    begin
      txtResposta.Text := TJson.JsonEncode(restResponse.JSONValue);
      txtRespostaFormat.Text := TJson.Format(restResponse.JSONValue);
      try
        chamado := TJson.JsonToObject<TChamado>(TJson.Format(restResponse.JSONValue), [joDateFormatMongo]);
      except
      end;
    end;

  finally
    FreeAndNil(restRequest);
    FreeAndNil(restClient);
  end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
var
  restClient: TRESTClient;
  restRequest: TRESTRequest;
  restResponse: TRESTResponse;
  newText: string;
  respApi: TResponseInformation;
begin
  newText := chamado.mensagem;
  if not InputQuery('Mensagem', 'Mensagem', newText) then
    Exit;

  chamado.mensagem := newText;
  chamado.data_temporaria := THwConvertDateTimeFormatUtils.ConvertDateTimeToStr(Now, 'mongo');

  restClient := TRESTClient.Create(Edit1.Text + 'Chamado/AlterarChamadoTipoLista' +
    '?cod_usuario=1&cod_empresa=1'
  );
  restRequest := TRESTRequest.Create(restClient);
  restResponse := TRESTResponse.Create(restClient);

  try
    restRequest.Response := restResponse;
    restRequest.Method := rmPOST;
    with restRequest.Params.AddItem do
    begin
      Options := [poDoNotEncode];
      Kind := pkHTTPHEADER;
      name := 'Authorization';
      Value := hwAcesso.token_type + ' ' + hwAcesso.access_token;
    end;

    edAcao.Text := 'Alterar chamado: "Chamado/AlterarChamadoTipoLista"';
    txtEnvio.Text := TJson.ObjectToJsonString(chamado, [joDateFormatISO8601]);
    txtEnvioFormat.Text := TJson.Format(TJson.ObjectToJsonObject(chamado, [joDateFormatISO8601]));

    restRequest.AddBody(TJson.ObjectToJsonString(chamado, [joDateFormatISO8601]), ctAPPLICATION_JSON);

    restRequest.Execute;

    edAcao.Text := edAcao.Text + ' - StatusCode = ' + restResponse.StatusCode.ToString;

    if restResponse.JSONValue <> nil then
    begin
      txtResposta.Text := TJson.JsonEncode(restResponse.JSONValue);
      txtRespostaFormat.Text := TJson.Format(restResponse.JSONValue);

      try
        respApi := TJson.JsonToObject<TResponseInformation>(TJson.JsonEncode(restResponse.JSONValue), [joDateFormatMongo]);
        txtResposta.Lines.Add(respApi.valid);
        txtResposta.Lines.Add(respApi.errocomb);
      except
      end;
    end;

  finally
    FreeAndNil(restRequest);
    FreeAndNil(restClient);
  end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
var
 pessoa: TPessoa;
 JSONMarshal: TJSONMarshal;
begin
  pessoa := NovaPessoa;
  Cliente.AddPessoa(pessoa);

  txtTest.Text := TJson.ObjectToJsonString(Cliente, [joDateFormatISO8601]);
  txtTestFormat.Text := TJson.Format(TJson.ObjectToJsonObject(Cliente, [joDateFormatISO8601]));
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
var
  restClient: TRESTClient;
  restRequest: TRESTRequest;
  restResponse: TRESTResponse;
  respApi: TResponseInformation;
begin
  if Assigned(chamado) then
    FreeAndNil(chamado);

  chamado := TChamado.Create;

  restClient := TRESTClient.Create(Edit1.Text + 'Chamado/IncOuAltChamado' +
    '?cod_usuario=1&cod_empresa=1'
  );
  restRequest := TRESTRequest.Create(restClient);
  restResponse := TRESTResponse.Create(restClient);

  try
    restRequest.Response := restResponse;
    restRequest.Method := rmPOST;
    with restRequest.Params.AddItem do
    begin
      Options := [poDoNotEncode];
      Kind := pkHTTPHEADER;
      name := 'Authorization';
      Value := hwAcesso.token_type + ' ' + hwAcesso.access_token;
    end;

    edAcao.Text := 'Incluir chamado: "Chamado/IncOuAltChamado"';
    txtEnvio.Text := TJson.ObjectToJsonString(chamado, [joDateFormatISO8601]);
    txtEnvioFormat.Text := TJson.Format(TJson.ObjectToJsonObject(chamado, [joDateFormatISO8601]));

    restRequest.AddBody(TJson.ObjectToJsonString(chamado, [joDateFormatISO8601]), ctAPPLICATION_JSON);

    restRequest.Execute;

    edAcao.Text := edAcao.Text + ' - StatusCode = ' + restResponse.StatusCode.ToString;

    if restResponse.JSONValue <> nil then
    begin
      txtResposta.Text := TJson.JsonEncode(restResponse.JSONValue);
      txtRespostaFormat.Text := TJson.Format(restResponse.JSONValue);

      try
        respApi := TJson.JsonToObject<TResponseInformation>(TJson.JsonEncode(restResponse.JSONValue), [joDateFormatMongo]);
        txtResposta.Lines.Add(respApi.valid);
        txtResposta.Lines.Add(respApi.errocomb);
      except
      end;
    end;

  finally
    FreeAndNil(restRequest);
    FreeAndNil(restClient);
  end;

end;

procedure TForm2.BitBtn8Click(Sender: TObject);
var
  testeDict: TTDictionary_test;
begin
  testeDict := TTDictionary_test.Create;
  testeDict.valid := 'Erro. Nao incluiu';
  testeDict.errocomb := 'O que ser· isso';
  testeDict.erros.Add('key1', 'valor 1');
//  testeDict.erros.Add('key2', 'valor 2');
//  testeDict.erros.Add('key3', 'valor 3');
//  testeDict.erros.Add('key4', 'valor 4');
//  testeDict.erros.Add('key5', 'valor 5');

  txtTest.Text := TJson.ObjectToJsonString(testeDict, [joDateFormatISO8601]);
  txtTestFormat.Text := TJson.Format(TJson.ObjectToJsonObject(testeDict, [joDateFormatISO8601]));

//
end;

procedure TForm2.BitBtn9Click(Sender: TObject);
var
  testeDict: TTDictionary_test2;
  keyv, value: string;
begin
  testeDict := TJson.JsonToObject<TTDictionary_test2>(txtTestFormat.Text);

  txtTest.Text := TJson.ObjectToJsonString(testeDict, [joDateFormatISO8601]);

//  for keyv in testeDict.erros.Keys do
//    txtTest.Lines.Add( keyv + ' ' + testeDict.erros.Items[keyv]);

  txtTest.Lines.Add(TJson.Format(TJson.ObjectToJsonObject(testeDict, [joDateFormatISO8601])));
end;

function TForm2.EncodeURIComponent(const ASrc: string): UTF8String;
const
  HexMap: UTF8String = '0123456789ABCDEF';

  function IsSafeChar(ch: Integer): Boolean;
  begin
    if      (ch >= 048) and (ch <= 057) then Result := True // 0-9
    else if (ch >= 065) and (ch <= 090) then Result := True // A-Z
    else if (ch >= 097) and (ch <= 122) then Result := True // a-z
    else if (ch = 033 )                 then Result := True // !
    else if (ch >= 039) and (ch <= 042) then Result := True // '()*
    else if (ch >= 045) and (ch <= 046) then Result := True // -.
    else if (ch = 095 )                 then Result := True // _
    else if (ch = 126 )                 then Result := True // ~
    else                                     Result := False;
  end;
var
  I, J: Integer;
  ASrcUTF8: UTF8String;
begin
  Result := '';    {Do not Localize}

  ASrcUTF8 := UTF8Encode(ASrc);
  // UTF8Encode call not strictly necessary but
  // prevents implicit conversion warning

  I := 1; J := 1;
  SetLength(Result, Length(ASrcUTF8) * 3); // space to %xx encode every byte
  while I <= Length(ASrcUTF8) do
  begin
    if IsSafeChar(Ord(ASrcUTF8[I])) then
    begin
      Result[J] := ASrcUTF8[I];
      Inc(J);
    end
    else if ASrcUTF8[I] = ' ' then
    begin
      Result[J] := '+';
      Inc(J);
    end
    else
    begin
      Result[J] := '%';
      Result[J+1] := HexMap[(Ord(ASrcUTF8[I]) shr 4) + 1];
      Result[J+2] := HexMap[(Ord(ASrcUTF8[I]) and 15) + 1];
      Inc(J,3);
    end;
    Inc(I);
  end;

  SetLength(Result, J-1);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  pessoas := TObjectList<TPessoa>.Create();
  pessoas3 := TPessoasList.Create;
  Cliente := TCliente__.Create;
//  Cliente.FCNPJ := '03530705000109';
  WindowState := wsMaximized;

  ADataSource := TDataSource.Create(Self);
  AProvider := TDataSetProvider.Create(Self);
  AProvider.Name := 'AProvider';
  //
  AEnderecoPadraoTestesFDB := '127.0.0.1:D:\Hw\bases\producao\Hwauto.fdb';
  ob01Ipbt := TIBPTProdutoNCM.Create;
  ob02Pessoa := TCPessoa.Create;
  ob03Conexao := TConexao.create;
  ob04Conexao := TConexao.create;
  ob05Conexao := TConexao.create;
  ob0708Conexao := TConexao.create;
  ob11Conexao := TConexao.create;
end;

function TForm2.GetChaveLoginChatWeb(AEmail, ACNPJ: string): string;
var
  ADia, AMes, AAno, AValorDinamico, ALength: Integer;
  AChave, AChaveCodificada, AChaveBase64: string;
  AChaveCodBytes: TArray<Byte>;
begin


  ADia             := DayOf(Date);
  ACNPJ            := ACNPJ.PadLeft(14, '0');
  AMes             := MonthOf(Date);
  ALength          := Length(AEmail);
  AAno             := StrToInt(Copy(IntToStr(YearOf(Date)).PadLeft(4, '0'), 3, 2));

  AValorDinamico   := Abs((ADia * AMes * ALength ) - AAno);

  AChave           := IntToStr(ADia).PadLeft(2, '0') +
                      ACNPJ +
                      IntToStr(AMes).PadLeft(2, '0') +
                      IntToStr(ALength).PadLeft(3, '0') +
                      IntToStr(AAno).PadLeft(2, '0') +
                      IntToStr(AValorDinamico).PadLeft(10, '0');

  AChaveCodificada := THwUtilsClass.Codifica(AChave);

//  AChaveCodBytes   := TEncoding.UTF8.GetBytes(AChaveCodificada);

  AChaveCodBytes   := TEncoding.ASCII.GetBytes(AChaveCodificada);

  AChaveBase64     := TNetEncoding.Base64.EncodeBytesToString(AChaveCodBytes);

  Result           := AChaveBase64;
end;

function TForm2.NovaCPessoa(Cod: Integer; Nome, fone: string; Salario: Double): TCPessoa;
begin
  Result := TCPessoa.Create;
  Result.cod := Cod;
  Result.nome := Nome;
  Result.datcad := Now;
  Result.fone := fone;
  Result.salario := Salario;
end;

function TForm2.NovaPessoa: TPessoa;
begin
  Result := TPessoa.Create;

  Result.Nome := 'Fulano ' + IntToStr(pessoas.Count);
  Result.Endereco := 'Endereco: Rua Mogno, n ' + IntToStr(pessoas.Count);
  Result.Idade := 30 + pessoas.Count;
  Randomize;
  Result.SetDataNascimento( Date - (365 * Result.Idade) + Random(364) );
end;

function TForm2.NovaPessoaArray: TPessoa;
begin


end;

procedure TForm2.WebBrowser1NavigateComplete2(ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin
  Edit3.Text := URL;
end;

{ TPessoa }

function TPessoa.GetDataNascimento(const Value: string): TDateTime;

  function GetDateTimeStr(AValue: TDateTime): string;
  var
    TimeZone: TTimeZoneInformation;
  begin
    GetTimeZoneInformation(TimeZone);
    Result :=
      FormatDateTime('YYYY"-"MM"-"DD"T"hh":"mm":"ss' +
        FormatFloat('00', TimeZone.Bias div -60) + ':00', AValue);
        //'2017-02-03T16:53:55+02:00';
  end;
var
  dateFormats: TFormatSettings;
  StrDate: string;
begin




end;

procedure TPessoa.SetDataNascimento(const Value: TDateTime);

  function GetDateTimeStr(AValue: TDateTime): string;
  var
    TimeZone: TTimeZoneInformation;
  begin
    GetTimeZoneInformation(TimeZone);
    Result :=
      FormatDateTime('YYYY"-"MM"-"DD"T"hh":"mm":"ss' +
        FormatFloat('00', TimeZone.Bias div -60) + ':00', AValue);
  end;

begin
  _DtNasc := Value;
  FDataNascimento := GetDateTimeStr(Value)
end;

{ TPessoasList }

function TPessoasList.GetItem(Index: integer): TPessoa;
begin
	Result := TPessoa(inherited Items[Index]);
end;

function TPessoasList.New: TPessoa;
begin
  Result := TPessoa.create;
  Add(Result);
end;

procedure TPessoasList.New2(Value: TPessoa);
begin
  Add(Value);
end;

procedure TPessoasList.SetItem(Index: integer; const Value: TPessoa);
begin
	Put(Index, Value);
end;

{ TResp_AcessTokent_ }

procedure TResp_AcessTokent_.Setaccess_token(const Value: string);
begin
  Faccess_token := Value;
end;

procedure TResp_AcessTokent_.Setcod_ambiente(const Value: Integer);
begin
  Fcod_ambiente := Value;
end;

procedure TResp_AcessTokent_.Setcod_cliente(const Value: Integer);
begin
  Fcod_cliente := Value;
end;

procedure TResp_AcessTokent_.Setcod_empresa(const Value: Integer);
begin
  Fcod_empresa := Value;
end;

procedure TResp_AcessTokent_.Setcod_usuario(const Value: Integer);
begin
  Fcod_usuario := Value;
end;

procedure TResp_AcessTokent_.Setdata_cad(const Value: TDateTime);
begin
  Fdata_cad := Value;
end;

procedure TResp_AcessTokent_.Setdata_ult_login(const Value: TDateTime);
begin
  Fdata_ult_login := Value;
end;

procedure TResp_AcessTokent_.Setemail(const Value: string);
begin
  Femail := Value;
end;

procedure TResp_AcessTokent_.Setexpires_in(const Value: Integer);
begin
  Fexpires_in := Value;
end;

procedure TResp_AcessTokent_.Setnivel(const Value: Integer);
begin
  Fnivel := Value;
end;

procedure TResp_AcessTokent_.Settag_menus_excecoes(const Value: string);
begin
  Ftag_menus_excecoes := Value;
end;

procedure TResp_AcessTokent_.Settag_perfil_menus(const Value: string);
begin
  Ftag_perfil_menus := Value;
end;

procedure TResp_AcessTokent_.Settipo_us(const Value: string);
begin
  Ftipo_us := Value;
end;

procedure TResp_AcessTokent_.Settoken_type(const Value: string);
begin
  Ftoken_type := Value;
end;

procedure TResp_AcessTokent_.Setusuario(const Value: string);
begin
  Fusuario := Value;
end;

{ TCliente__ }

procedure TCliente__.AddPessoa(Value: TPessoa);
begin
  Fnome := 'Teste';
  SetLength(FPessoas, Length(FPessoas) + 1);
  FPessoas[Length(FPessoas) - 1 ] := Value;
end;

procedure TCliente__.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TCliente__.SetPessoas(const Value: TArray<TPessoa>);
begin
  FPessoas := Value;
end;

{ TTDictionary_test }

constructor TTDictionary_test.create;
begin
  Ferros := TDictionary<string, string>.Create();
end;

destructor TTDictionary_test.Destroy;
begin
  FreeAndNil(Ferros);
  inherited;
end;

procedure TTDictionary_test.Seterrocomb(const Value: String);
begin
  Ferrocomb := Value;
end;

procedure TTDictionary_test.Seterros(const Value: TDictionary<string, string>);
begin
  Ferros := Value;
end;

procedure TTDictionary_test.Setvalid(const Value: String);
begin
  Fvalid := Value;
end;

{ TTDictionary_test2 }

procedure TTDictionary_test2.Seterrocomb(const Value: String);
begin
  Ferrocomb := Value;
end;

procedure TTDictionary_test2.Setvalid(const Value: String);
begin
  Fvalid := Value;
end;

{ THWRest_RequestResponseModal1 }

class function THWRest_RequestResponseModal1.FromJsonString(AJsonString: string): THWRest_RequestResponseModal1;
var
  AJO, AJOC: TJSONObject;
  APa, APaC: TJSONPair;
  I: Integer;
  List: TStrings;
  Dict: TDictionary<string,string>;
  AKey, AValue: string;
begin
  Result := TJson.JsonToObject<THWRest_RequestResponseModal1>(AJsonString);

  Result.Corpo.Clear;

  AJO := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(AJsonString),0) as TJSONObject;

  if AJO.Count = 0 then
    Exit;

  List := TStringList.Create;


    Dict := TDictionary<string,string>.Create();

  for APa in AJO do
    if APa.JsonString.Value.ToLower.Trim = 'corpo' then
    begin
      AJOC := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(APa.JsonValue.ToString), 0) as TJSONObject;
      for APaC in AJOC do
        Dict.Add(APaC.JsonString.Value, APaC.JsonValue.Value);
    end;

  for I := 0 to AJO.Count - 1 do
  begin
    APa := AJO.Pairs[I];
    if APa.JsonString.Value.ToLower.Trim = 'corpo' then
    begin

      AKey   := APa.JsonString.Value;
      AValue := APa.JsonValue.Value;
//      Dict.Add(AKey, AValue);
  //    Result.Corpo.Add(APa.JsonString.Value, APa.JsonValue.Value);



      List.Add('PAR ' + (i+1).ToString);
      List.Add('APa.ToString');
      List.Add(APa.ToString);

      List.Add('APa.JsonString.Value');
      List.Add(APa.JsonString.Value);

      List.Add('APa.Value');
      List.Add(APa.Value);

      List.Add('APa.ToJSON');
      List.Add(APa.ToJSON);

      List.Add('APa.JsonValue.Value');
      List.Add(APa.JsonValue.Value);
      List.Add('');
      List.Add('');
    end;
  end;
  List.SaveToFile('D:\resp1.txt');

  ShowMessage(Dict.Count.ToString);

  Result.Corpo := Dict;

  ShowMessage(List.Text);






end;

function THWRest_RequestResponseModal1.Sucess(AStatus: string): Boolean;
begin

end;

end.
