unit hw.utils.dx.teste.Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.DBClient, Data.DBXOdbc, Data.FMTBcd, Data.DB, Data.SqlExpr, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    pnMasks: TPanel;
    FileOpenDialog1: TFileOpenDialog;
    sBox: TScrollBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    Panel4: TPanel;
    BitBtn14: TBitBtn;
    Memo1: TMemo;
    Splitter1: TSplitter;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
  private
    { Private declarations }
    FClient, FClient2: TClientDataSet;

    FDS: TDataSource;
    procedure MakeDataSetFromCVSFile;
    function ReturnDataSetFromCVSFile(AFileName: string; ALineBreak: string = ';'): TClientDataSet;
    procedure MaskEditChange(Sender: TObject);
  public
    { Public declarations }

  end;

var
  Form3: TForm3;

implementation

uses
  System.StrUtils, System.Math, System.NetEncoding,
  HW.Utils.Classes.Funcoes_DX;

function hw_central_suporte( AEmail, AColaborador, ACnpj, AToken: WideString): WideString; stdcall; external 'hw.utils.dx.dll';
function hw_central_suporte_notificar_abrir( AEmail, AColaborador, ACnpj, AToken: WideString): WideString; stdcall; external 'hw.utils.dx.dll';
function hw_central_suporte_verificar_notificacoes_erp(ACnpj: WideString): WideString; stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

procedure TForm3.BitBtn11Click(Sender: TObject);
var
  Atoken: string;
begin
  Atoken := hw_central_suporte_notificar_abrir(
      FClient.FieldByName('email').AsString,
      FClient.FieldByName('nome_cliente').AsString,
      '03530705000109',
      THwUtilsClass.AddTagXML('token', THwUtilsClass.EncodeASCIIBase64(FClient.FieldByName('token').AsString)));

  Atoken := THwUtilsClass.ExtractTagXML('token', Atoken);
  Atoken := THwUtilsClass.DecodeASCIIBase64(Atoken);

  if Atoken.Trim = '' then
    Exit;

  FClient.Edit;
  FClient.FieldByName('token').AsString := Atoken;
  FClient.Post;
end;

procedure TForm3.BitBtn12Click(Sender: TObject);
begin
  Memo1.Lines.Add(
    hw_central_suporte_notificar_abrir(
      FClient.FieldByName('email').AsString,
      FClient.FieldByName('email').AsString,
      FClient.FieldByName('cnpj').AsString,
      ''
    )
  );
end;

procedure TForm3.BitBtn14Click(Sender: TObject);
var
  Aresposta, Atoken, AUsuario, AEmail, ANotificacoes: string;
  AMensagens: TStrings;
begin

  Memo1.Clear;
  Memo1.Lines.Add('--resposta');
  Aresposta := hw_central_suporte_verificar_notificacoes_erp(
      FClient.FieldByName('cnpj').AsString);
  Memo1.Lines.Add(Aresposta);
  Memo1.Lines.Add('-- fim resposta');

  AMensagens := TStringList.Create;
  try
    Atoken := THwUtilsClass.ExtractTagXML('token', Aresposta);
    //Atoken := THwUtilsClass.DecodeASCIIBase64(Atoken);
    Memo1.Lines.Add('-- token');
    Memo1.Lines.Add(THwUtilsClass.DecodeASCIIBase64(Atoken));
    Memo1.Lines.Add('-- fim token');

    AUsuario := THwUtilsClass.ExtractTagXML('usuario', Aresposta);
    while AUsuario.Trim <> '' do
    begin
      AEmail        := THwUtilsClass.ExtractTagXML('email', AUsuario);
      ANotificacoes := THwUtilsClass.ExtractTagXML('notificacoes', AUsuario);

      Memo1.Lines.Add('');
      Memo1.Lines.Add('email:  '         + AEmail);
      Memo1.Lines.Add('notificacoes:   ' + ANotificacoes);

      AUsuario := THwUtilsClass.ExtractTagXML('usuario', Aresposta);
    end;

//    if AMensagens.Count > 0 then
//      ShowMessage(AMensagens.Text);

    if Atoken.Trim = '' then
      Exit;

    FClient.Edit;
    FClient.FieldByName('token').AsString := Atoken;
    FClient.Post;
  finally
    FreeAndNil(AMensagens);
  end;
end;

procedure TForm3.BitBtn15Click(Sender: TObject);
var
  AResposata, AUsuario, Atoken, Aemail, ANotificacoes: string;
begin
//  Atoken := Memo1.Lines.Text;
  Memo1.Lines.Clear;

  AResposata := THwUtilsClass.AddTagXML('token', '123456') +
            THwUtilsClass.AddTagXML('usuario',
              THwUtilsClass.AddTagXML('email', 'joaopedro@hwsistemas.com.br') +
              THwUtilsClass.AddTagXML('notificacoes', 'jsonjoaopedro')
            ) +
            THwUtilsClass.AddTagXML('usuario',
              THwUtilsClass.AddTagXML('email', 'odilon@hwsistemas.com.br') +
              THwUtilsClass.AddTagXML('notificacoes', 'jsonodilon')
            ) ;

  Atoken := THwUtilsClass.ExtractTagXML('token', AResposata);
  AUsuario := THwUtilsClass.ExtractTagXML('usuario', AResposata);
  Memo1.Lines.Add('-' + Atoken);
  while AUsuario.Trim <> '' do
  begin
    AEmail        := THwUtilsClass.ExtractTagXML('email', AUsuario);
    ANotificacoes := THwUtilsClass.ExtractTagXML('notificacoes', AUsuario);

    Memo1.Lines.Add('--');
    Memo1.Lines.Add('----' + AEmail);
    Memo1.Lines.Add('------' + ANotificacoes);

    AUsuario := THwUtilsClass.ExtractTagXML('usuario', AResposata);
  end;

//  Atoken := THwUtilsClass.ExtractTagXML('token', Atoken);

end;

procedure TForm3.BitBtn16Click(Sender: TObject);
begin
  FClient2 := ReturnDataSetFromCVSFile('D:\Downloads\DOCsXLSs\emitentes.csv');
  ShowMessage(FClient2.FieldByName('"Razao Social"').AsString);
  DataSource1.DataSet := FClient2;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  MakeDataSetFromCVSFile;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
  Atoken: string;
begin
  Atoken := hw_central_suporte(
      FClient.FieldByName('email').AsString,
      FClient.FieldByName('nome_cliente').AsString,
      FClient.FieldByName('cnpj').AsString,
      THwUtilsClass.AddTagXML('token', THwUtilsClass.EncodeASCIIBase64(FClient.FieldByName('token').AsString)));

  Atoken := THwUtilsClass.ExtractTagXML('token', Atoken);
  Atoken := THwUtilsClass.DecodeASCIIBase64(Atoken);

  if Atoken.Trim = '' then
    Exit;

  FClient.Edit;
  FClient.FieldByName('token').AsString := Atoken;
  FClient.Post;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
var
  Atoken, Amsg: string;
  AMensagens: TStrings;
begin
//  Atoken := hw_central_suporte_notificar(
//      FClient.FieldByName('email').AsString,
//      FClient.FieldByName('nome_cliente').AsString,
//      FClient.FieldByName('cnpj').AsString,
//      THwUtilsClass.AddTagXML('token', THwUtilsClass.EncodeASCIIBase64(FClient.FieldByName('token').AsString)));

  AMensagens := TStringList.Create;
  try
    Amsg := THwUtilsClass.ExtractTagXML('mensagem', Atoken);
    while Amsg.Trim <> '' do
    begin
      AMensagens.Add(Amsg);
      Amsg := THwUtilsClass.ExtractTagXML('mensagem', Atoken);
    end;

    Atoken := THwUtilsClass.ExtractTagXML('token', Atoken);
    Atoken := THwUtilsClass.DecodeASCIIBase64(Atoken);

    if AMensagens.Count > 0 then
      ShowMessage(AMensagens.Text);

    if Atoken.Trim = '' then
      Exit;

    FClient.Edit;
    FClient.FieldByName('token').AsString := Atoken;
    FClient.Post;
  finally
    FreeAndNil(AMensagens);
  end;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
var
  Atoken: string;
begin
  Atoken := hw_central_suporte_notificar_abrir(
      FClient.FieldByName('email').AsString,
      FClient.FieldByName('nome_cliente').AsString,
      FClient.FieldByName('cnpj').AsString,
      THwUtilsClass.AddTagXML('token', THwUtilsClass.EncodeASCIIBase64(FClient.FieldByName('token').AsString)));

  Atoken := THwUtilsClass.ExtractTagXML('token', Atoken);
  Atoken := THwUtilsClass.DecodeASCIIBase64(Atoken);

  if Atoken.Trim = '' then
    Exit;

  FClient.Edit;
  FClient.FieldByName('token').AsString := Atoken;
  FClient.Post;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
var
  Atoken: string;
begin
  Atoken := hw_central_suporte(
      FClient.FieldByName('email').AsString,
      FClient.FieldByName('nome_cliente').AsString,
      '03530705000109',
      THwUtilsClass.AddTagXML('token', THwUtilsClass.EncodeASCIIBase64(FClient.FieldByName('token').AsString)));

  Atoken := THwUtilsClass.ExtractTagXML('token', Atoken);
  Atoken := THwUtilsClass.DecodeASCIIBase64(Atoken);

  if Atoken.Trim = '' then
    Exit;

  FClient.Edit;
  FClient.FieldByName('token').AsString := Atoken;
  FClient.Post;
end;

procedure TForm3.DBGrid1DblClick(Sender: TObject);
var
  Atoken: string;
  Afile: string;
  AText: TStrings;
begin
  Afile := ExtractFilePath(Application.ExeName) + FClient.FieldByName('email').AsString.Trim + '.txt';
  AText := TStringList.Create;
  if FileExists(Afile) then
    AText.LoadFromFile(Afile);

  Atoken := hw_central_suporte(
      FClient.FieldByName('email').AsString,
      FClient.FieldByName('nome_cliente').AsString,
      FClient.FieldByName('cnpj').AsString,
      AText.Text);

  if not Atoken.Trim.IsEmpty then
  begin
    AText.Text := Atoken;
    AText.SaveToFile(Afile);
  end;



//  Atoken := THwUtilsClass.ExtractTagXML('token', Atoken);
//  Atoken := THwUtilsClass.DecodeASCIIBase64(Atoken);

//  if Atoken.Trim = '' then
//    Exit;

//  FClient.Edit;
//  FClient.FieldByName('token').AsString := Atoken;
//  FClient.Post;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  FClient := TClientDataSet.Create(Self);
//  FClient.FieldDefs.Add('Parceiro', ftString, 64);
//  FClient.FieldDefs.Add('Cliente' , ftString, 64);
//  FClient.FieldDefs.Add('CNPJ'    , ftString, 14);
//  FClient.FieldDefs.Add('email'   , ftString, 128);
//  FClient.FieldDefs.Add('Nome'    , ftString, 64);
//  FClient.FieldDefs.Add('Senha'   , ftString, 128);
//  FClient.CreateDataSet;

  FDS := TDataSource.Create(Self);
  FDS.AutoEdit := False;
  FDS.DataSet := FClient;

  DBGrid1.DataSource := FDS;
end;


procedure TForm3.MakeDataSetFromCVSFile;
var
  AFileOpen: TFileOpenDialog;
  ACVSFile: TStringList;
  I: Integer;
  ALinha, AFieldName: string;
  AFieldsName, AFieldsValues: TStrings;
  AMasks: TMaskEdit;
  AComponent: TComponent;
begin

  AFileOpen     := TFileOpenDialog.Create(Self);
  ACVSFile      := TStringList.Create;
  AFieldsName   := TStringList.Create;
  AFieldsValues := TStringList.Create;
  AFieldsName.LineBreak   := ';';
  AFieldsValues.LineBreak := ';';

  try
    AFileOpen.DefaultExtension := 'csv';
    AFileOpen.DefaultFolder := 'D:\Downloads\TXTs';

    if not AFileOpen.Execute then
      Exit;

    ACVSFile.LoadFromFile(AFileOpen.FileName);
    if ACVSFile.Count <= 1 then
      Exit;

    DBGrid1.DataSource := nil;
    DataSource1.DataSet := nil;

    for I := sBox.ComponentCount - 1 downto 0 do
    begin
      AComponent := sBox.Components[i];
      FreeAndNil(AComponent);
    end;
//    for AComponent in sBox do
//    begin
//      if AComponent is TMaskEdit then
//        FreeAndNil(AComponent);
//        TMaskEdit(AComponent).Free;
//    end;

    AFieldsName.Text := ACVSFile[0];
    ACVSFile.Delete(0);
    if FClient.Active then
    begin
      FClient.EmptyDataSet;
      FClient.Close;
      FreeAndNil(FClient);
      FClient := TClientDataSet.Create(Self);
    end;
    for AFieldName in AFieldsName do
      if AFieldName.Trim <> '' then
        FClient.FieldDefs.Add(AFieldName, ftString, 128);

//    FClient.FieldDefs.Add('token', ftString, 8192);
    FClient.CreateDataSet;

    for ALinha in ACVSFile do
    begin
      AFieldsValues.Text := ALinha;

      FClient.Insert;
      for I := 0 to AFieldsName.Count - 1 do
      begin
        AFieldName := AFieldsName[I];
        if AFieldName.Trim <> '' then
        begin
          FClient.FieldByName(AFieldName).AsString := AFieldsValues[I];
          if FClient.FieldByName(AFieldName).Tag < Canvas.TextWidth(FClient.FieldByName(AFieldName).AsString) then
            FClient.FieldByName(AFieldName).Tag := Canvas.TextWidth(FClient.FieldByName(AFieldName).AsString);
        end;
      end;
      FClient.Post;
    end;

    DataSource1.DataSet := FClient;
    DBGrid1.DataSource := DataSource1;

    for I := 0 to DBGrid1.Columns.Count - 1 do
    if not DBGrid1.Columns[I].FieldName.Trim.IsEmpty then
    begin
      if FClient.FieldByName(DBGrid1.Columns[I].FieldName).Tag = 0 then
        DBGrid1.Columns[I].Width := 64
      else
        DBGrid1.Columns[I].Width := FClient.FieldByName(DBGrid1.Columns[I].FieldName).Tag ;

      AMasks := TMaskEdit.Create(sBox);
      AMasks.Parent := sBox;
      AMasks.Name := 'ed' + DBGrid1.Columns[I].FieldName;
      AMasks.Width := DBGrid1.Columns[I].Width + ifthen(DBGrid1.Columns[I].Width < 10, 10);
      AMasks.Left := 999999;
      AMasks.Align := alLeft;
      AMasks.Text := '';
      AMasks.OnChange := MaskEditChange;
    end;
  finally
    FDS.DataSet := FClient;
    DBGrid1.DataSource := FDS;

    FreeAndNil(AFileOpen);
    FreeAndNil(ACVSFile);
    FreeAndNil(AFieldsName);
    FreeAndNil(AFieldsValues);
  end;
end;

procedure TForm3.MaskEditChange(Sender: TObject);
begin
  if TMaskEdit(Sender).Text = '' then
  begin
    FClient.Filtered := False;
    FClient.Filter := '';
    Exit;
  end;

 FClient.Filter := Copy(TMaskEdit(Sender).Name, 3, Length(TMaskEdit(Sender).Name)) +
                   ' like ' + QuotedStr( '%' + TMaskEdit(Sender).Text + '%');
 FClient.Filtered := True;
end;

function TForm3.ReturnDataSetFromCVSFile(AFileName: string;
  ALineBreak: string): TClientDataSet;
var
  AClient: TClientDataSet;
  ACVSFile: TStringList;
  I: Integer;
  ALinha, AFieldName: string;
  AFieldsName, AFieldsValues: TStrings;
begin
  AClient := TClientDataSet.Create(Self);
  ACVSFile      := TStringList.Create;
  AFieldsName   := TStringList.Create;
  AFieldsValues := TStringList.Create;
  AFieldsName.LineBreak   := ALineBreak;
  AFieldsValues.LineBreak := ALineBreak;

  try

    ACVSFile.LoadFromFile(AFileName);
    if ACVSFile.Count <= 1 then
      Exit;

    AFieldsName.Text := ACVSFile[0];
    ACVSFile.Delete(0);

    for AFieldName in AFieldsName do
      if AFieldName.Trim <> '' then
        AClient.FieldDefs.Add(AFieldName, ftString, 256);

    AClient.CreateDataSet;

    for ALinha in ACVSFile do
    begin
      AFieldsValues.Text := ALinha;

      AClient.Insert;
      for I := 0 to AFieldsName.Count - 1 do
      begin
        AFieldName := AFieldsName[I];
        if AFieldName.Trim <> '' then
          AClient.FieldByName(AFieldName).AsString := AFieldsValues[I];
      end;
      AClient.Post;
    end;

  finally
    Result := AClient;

    FreeAndNil(ACVSFile);
    FreeAndNil(AFieldsName);
    FreeAndNil(AFieldsValues);
  end;
end;

end.
