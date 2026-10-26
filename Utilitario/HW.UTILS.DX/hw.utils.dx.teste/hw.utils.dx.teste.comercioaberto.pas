unit hw.utils.dx.teste.comercioaberto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons,
  HW.Comercio.Api.Rest, HW.Json;

type
  TTFrmTesteComercioAbertoApi = class(TForm)
    GroupBox1: TGroupBox;
    BitBtn2: TBitBtn;
    ed_cnpj_login: TComboBox;
    ed_url: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    ed_cnpj: TEdit;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ed_codemp: TEdit;
    ed_database: TComboBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ed_log: TMemo;
    TabSheet3: TTabSheet;
    BitBtn3: TBitBtn;
    ed_grupo: TEdit;
    ed_codigo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn4: TBitBtn;
    Label6: TLabel;
    ed_grade: TEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
    Api: TComercioRestApi;
    TokenApi: TComercioTokenApi;
  public
    { Public declarations }

    procedure ContentResponse(Sender: TObject);
    procedure Log(Msg: string);
  end;

  TVendas = class
  private
    fdatavenda: TDateTime;
    fvalor: Double;
  published
    [LocalToUtcJson]
    property datavenda: TDateTime  read fdatavenda write fdatavenda;
    property valor: Double read fvalor write fvalor;
  end;

  TPessoa = class
  private
    fdatacadastro: TDateTime;
    fnome: string;
    fvendas: TArray<TVendas>;
    flastvnd: TVendas;
    farraynull: TArray<TVendas>;
  published
    property nome: string read fnome write fnome;
    [LocalToUtcJson]
    property datacadastro: TDateTime read fdatacadastro write fdatacadastro;
    property vendas: TArray<TVendas> read fvendas write fvendas;
    property lastvnd: TVendas read flastvnd write flastvnd;
    property arraynull: TArray<TVendas> read farraynull write farraynull;
  end;

var
  TFrmTesteComercioAbertoApi: TTFrmTesteComercioAbertoApi;

implementation

uses
  HW.Utils.Classes.Funcoes_DX, Hw.Api.Rest, REST.Types, REST.Json, Vcl.Clipbrd;

//procedure hw_comercio_lojista_enviar(banco: WideString; codempresa: Integer); stdcall; external 'hw.utils.dx.dll';
procedure hw_comercio_produto_enviar(banco: WideString; codempresa, grupoprod: Integer; codprod: WideString; codgrade: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_comercio_consulta_periodica(banco: WideString; codempresa: Integer); stdcall; external 'hw.utils.dx.dll';

procedure hw_comercio_consultar_notificacoes(banco: WideString; codempresa, codusuario: Integer; var dadosnotificacao: WideString); stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TTFrmTesteComercioAbertoApi.BitBtn1Click(Sender: TObject);
begin
  Clipboard.AsText := Format('username=#%s# , password=%s',
                             [ed_cnpj.Text, THwUtilsClass.CalculaChaveLoginChatWeb(ed_cnpj.Text)]);
  ed_log.Lines.Add(Clipboard.AsText);
end;

procedure TTFrmTesteComercioAbertoApi.BitBtn2Click(Sender: TObject);
var
  JsonString, usuario, senha: string;

  procedure setParametros;
  begin
    with Api.restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'grant_type';
      Value := 'password';
    end;
    with Api.restRequest.Params.AddItem do
    begin
      Kind := pkGETorPOST;
      name := 'username';
      Value := usuario;
    end;
    with Api.restRequest.Params.AddItem do
    begin
      Options := [poDoNotEncode];
      Kind := pkGETorPOST;
      name := 'password';
      Value := senha;
    end;
  end;

begin
  ed_log.Lines.Add('--');
  Api.BaseUrl := ed_url.Text;
  Api.Controller := 'security/token';
  Api.OnLog := Log;
  //JsonString := Format('{"UserID":"%s","Password":"%s"}',[ed_cnpj_login.Text, THwUtilsClass.CalculaChaveLoginChatWeb(ed_cnpj_login.Text)]);

  usuario :=  '#' + ed_cnpj_login.Text + '#';
  senha := UTF8ToString(THwUtilsClass.EncodeURIParameter( THwUtilsClass.CalculaChaveLoginChatWeb(ed_cnpj_login.Text) ));

  ed_log.Lines.Add(Format('username=%s, password=%s', [usuario, senha]));



  setParametros;

  case api.Post() of
    200 :
    begin
      TokenApi := TJson.JsonToObject<TComercioTokenApi>(Api.JSONReponse);
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

procedure TTFrmTesteComercioAbertoApi.BitBtn3Click(Sender: TObject);
begin
  hw_comercio_produto_enviar(ed_database.Text, StrToIntDef(ed_codemp.Text, 1), StrToIntDef(ed_grupo.Text, 1), ed_codigo.Text, StrToIntDef(ed_grade.Text, 1));
end;

procedure TTFrmTesteComercioAbertoApi.BitBtn4Click(Sender: TObject);
begin
  hw_comercio_consulta_periodica(ed_database.Text, StrToIntDef(ed_codemp.Text, 1));
end;

procedure TTFrmTesteComercioAbertoApi.BitBtn5Click(Sender: TObject);
begin
  hw_comercio_produto_enviar(ed_database.Text, StrToIntDef(ed_codemp.Text, 1), 1, '123', 0);
end;

procedure TTFrmTesteComercioAbertoApi.BitBtn6Click(Sender: TObject);
begin
//  hw_comercio_lojista_enviar(ed_database.Text, StrToIntDef(ed_codemp.Text, 1));
end;

procedure TTFrmTesteComercioAbertoApi.BitBtn7Click(Sender: TObject);
var
  pessoa: TPessoa;
  v1, v2: TVendas;
  nova: TPessoa;
  strjson: string;
begin

  pessoa := TPessoa.Create;
  pessoa.nome := 'Joao Pedro';
  pessoa.datacadastro := Now;

  v1 := TVendas.Create;
  v1.valor :=  135.36;
  v1.datavenda := Now;// - 45 - EncodeTime(2,43, 33, 33);

  v2 := TVendas.Create;
  v2.valor :=  4155.9993;
  v2.datavenda := Now;// - 10 - EncodeTime(7, 03, 11, 21);

  SetLength(pessoa.fvendas, 2);
  pessoa.fvendas[0] := v1;
  pessoa.fvendas[1] := v2;

  pessoa.lastvnd := TVendas.Create;
  pessoa.lastvnd.valor := 1;
  pessoa.lastvnd.datavenda := Now + 1;

  ed_log.Lines.Text := TJson.ObjectToJsonString(pessoa);

  ed_log.Lines.Add('-----');


  strjson := TJsonHw.ToJsonString(pessoa);
  ed_log.Lines.Add(strjson);

  nova := TJsonHw.ToObject<TPessoa>(strjson);

//  TJsonHw.ObjectToJsonObject<TPessoa>(ed_log.Text);

  ed_log.Lines.Add('-----');


  ed_log.Lines.Add(TJsonHw.ToJsonString(pessoa));

  ed_log.Lines.Add('fim');



end;

procedure TTFrmTesteComercioAbertoApi.BitBtn8Click(Sender: TObject);
var
dados: WideString;
begin

  hw_comercio_consultar_notificacoes(ed_database.Text, StrToIntDef(ed_codemp.Text, 1), 1, dados);

  ed_log.Lines.Add(dados);
end;

procedure TTFrmTesteComercioAbertoApi.ContentResponse(Sender: TObject);
begin

end;

procedure TTFrmTesteComercioAbertoApi.FormShow(Sender: TObject);
begin
  ed_cnpj.Clear;
  ed_cnpj_login.ItemIndex := 0;

  ed_log.Clear;

  if FileExists('log_' + ed_log.Name + '.log') then
    ed_log.Lines.LoadFromFile('log' + ed_log.name + '.log');

//  ed_url.Text := 'http://localhost/IntegraApiHw/api';
  ed_url.ItemIndex := 0;

  Api := TComercioRestApi.Create(ed_url.Text, true);
  Api.OnLog := Log;
end;

procedure TTFrmTesteComercioAbertoApi.Log(Msg: string);
begin
  ed_log.Lines.Add(Msg);
end;

end.
