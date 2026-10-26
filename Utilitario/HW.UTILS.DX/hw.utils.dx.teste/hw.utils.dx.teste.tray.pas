unit hw.utils.dx.teste.tray;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,
  Hw.Tray.Servicos;

type
  TTFrmTesteTrayApi = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ed_codemp: TEdit;
    ed_database: TComboBox;
    Panel1: TPanel;
    ed_log: TMemo;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ed_log_serv: TMemo;
    Splitter1: TSplitter;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ed_params: TEdit;
    BitBtn7: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_databaseExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
    servico: THwTrayServicos;
  public
    { Public declarations }
    procedure log(Text: string);
  end;

var
  TFrmTesteTrayApi: TTFrmTesteTrayApi;

implementation

uses
  HW.Tray.Api.Category,
  HW.Tray.Api.Variant,
  HW.Tray.Api.Rest,
  HW.Tray.Api.Product,
  HW.Tray.Api.Property_,
  HW.Tray.Api.AdditionalInfo,
  Hw.Tray.Api.Form.Cadastros,
  HW. Json;

{$R *.dfm}

procedure TTFrmTesteTrayApi.BitBtn1Click(Sender: TObject);
var
  categorias: TArray<TCategory>;
  I: Integer;
begin

  categorias := servico.GetList<TCategory>('categories', 'Categories', ['sort=id_desc']);

  if Length(categorias) > 0 then
    for I := Low(categorias) to High(categorias) do
    begin
      ed_log.Lines.Add(' -- ' + IntToStr(I + 1) + ' --');
      ed_log.Lines.Add(TJsonHw.ToJsonString(categorias[I]));
    end;
end;

procedure TTFrmTesteTrayApi.BitBtn2Click(Sender: TObject);
var
  variacoes: TArray<TVariant>;
  I: Integer;
begin

  variacoes := servico.GetList<TVariant>('products/variants', 'Variants', ['limit=0']);

  if Length(variacoes) > 0 then
    for I := Low(variacoes) to High(variacoes) do
    begin
      ed_log.Lines.Add(' -- ' + IntToStr(I + 1) + ' --');
      ed_log.Lines.Add(TJsonHw.ToJsonString(variacoes[I]));
    end;
end;

procedure TTFrmTesteTrayApi.BitBtn3Click(Sender: TObject);
var
  consulta: TTrayConsulta;
  variacoes: TArray<TVariant>;
  I: Integer;
begin
  consulta := servico.GetConsulta('products/variants', 'Variants', ['limit=0']);

  if consulta = nil then
  begin
    ed_log.Lines.Add('consulta null');
    Exit;
  end;

  ed_log.Lines.Add(TJsonHw.ToJsonString(consulta));
  ed_log.Lines.Add('-- objeto dinamico --');

  variacoes := TJsonHw.ToArrayObject<TVariant>(consulta.dadosDinamicos);

  if Length(variacoes) > 0 then
    for I := Low(variacoes) to High(variacoes) do
    begin
      ed_log.Lines.Add(' -- ' + IntToStr(I + 1) + ' --');
      ed_log.Lines.Add(TJsonHw.ToJsonString(variacoes[I]));
    end;

end;

procedure TTFrmTesteTrayApi.BitBtn4Click(Sender: TObject);
var
  consulta: TTrayConsulta;
  categorias: TArray<TCategory>;
  I: Integer;
begin
  consulta := servico.GetConsulta('categories', 'Categories', ['sort=id_desc', 'limit=0']);

  if consulta = nil then
  begin
    ed_log.Lines.Add('consulta null');
    Exit;
  end;

  ed_log.Lines.Add(TJsonHw.ToJsonString(consulta));

  ed_log.Lines.Add( sLineBreak + '-- objeto dinamico --' + sLineBreak);

  categorias := TJsonHw.ToArrayObject<TCategory>(consulta.dadosDinamicos);

  if Length(categorias) > 0 then
    for I := Low(categorias) to High(categorias) do
    begin
      ed_log.Lines.Add(' -- ' + IntToStr(I + 1) + ' --');
      ed_log.Lines.Add(TJsonHw.ToJsonString(categorias[I]));
    end;
end;

procedure TTFrmTesteTrayApi.BitBtn5Click(Sender: TObject);
var
  caracteristicas: TArray<TProperty>;
  I: Integer;
  params: TArray<string>;
begin

  if ed_params.Text <> '' then
  begin
    SetLength(params, 1);
    params[0] := ed_params.Text;
  end;
  params := params + ['limit=0'];

  caracteristicas := servico.GetList<TProperty>('products/properties', 'Properties', params);// ['limit=0']);

  if Length(caracteristicas) > 0 then
    for I := Low(caracteristicas) to High(caracteristicas) do
    begin
      ed_log.Lines.Add(' -- ' + IntToStr(I + 1) + ' --');
      ed_log.Lines.Add(TJsonHw.ToJsonString(caracteristicas[I]));
    end;
end;

procedure TTFrmTesteTrayApi.BitBtn6Click(Sender: TObject);
var
  produtos: TArray<TProduct>;
  I: Integer;
  params: TArray<string>;
begin

  if ed_params.Text <> '' then
  begin
    SetLength(params, 1);
    params[0] := ed_params.Text;
  end;
  params := params + ['limit=10'];

  produtos := servico.GetList<TProduct>('products', 'Products', params);

  if Length(produtos) > 0 then
    for I := Low(produtos) to High(produtos) do
    begin
      ed_log.Lines.Add(' -- ' + IntToStr(I + 1) + ' --');
      ed_log.Lines.Add(TJsonHw.ToJsonString(produtos[I]));
    end;
end;

procedure TTFrmTesteTrayApi.BitBtn7Click(Sender: TObject);
begin
  Application.CreateForm(TFrmTrayCadastros, FrmTrayCadastros);
  FrmTrayCadastros.DataBasePath := ed_database.Text;
  FrmTrayCadastros.CodEmpresa := StrToInt(ed_codemp.Text);
  FrmTrayCadastros.Usuario := 'HW';
  FrmTrayCadastros.ShowModal;
end;

procedure TTFrmTesteTrayApi.ed_databaseExit(Sender: TObject);
begin
  servico.DataBasePath := ed_database.Text;
  servico.CodEmpresa := StrToInt(ed_codemp.Text);
end;

procedure TTFrmTesteTrayApi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  servico.Free;
end;

procedure TTFrmTesteTrayApi.FormCreate(Sender: TObject);
begin
  servico := THwTrayServicos.Create(False);
  servico.OnLog := log;
end;

procedure TTFrmTesteTrayApi.FormShow(Sender: TObject);
begin
  ed_log.Lines.Clear;
  ed_log_serv.Lines.Clear;

  ed_database.Text := '192.168.254.50:C:\DadosHW\Sys\clientes\trayteste\Hwauto.fdb';
end;

procedure TTFrmTesteTrayApi.log(Text: string);
begin
  ed_log_serv.Lines.Add(Text);
end;

end.
