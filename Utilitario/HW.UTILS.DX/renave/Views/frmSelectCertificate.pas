unit frmSelectCertificate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, System.Net.URLClient, System.Net.HttpClient,
  System.Net.HttpClientComponent, System.Generics.Collections, Data.DB, DataSnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, CertificadoModel;

type


  TformSelectCertificate = class(TForm)
    page: TPageControl;
    abaList: TTabSheet;
    abaItem: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    btSelectCertificate: TBitBtn;
    grid_cert: TDBGrid;
    BitBtn2: TBitBtn;
    memoDados: TDBMemo;
    lbEmpresa: TLabel;
    lbVenci: TLabel;
    NetHTTPClient1: TNetHTTPClient;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btSelectCertificateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    cnpjEmpresa: string;
    dataCertificates: TClientDataSet;
    dataSourceCerts: TDataSource;

    procedure NetHTTPClientNeedClientCertificate(const Sender: TObject;
      const ARequest: TURLRequest;
      const ACertificateList: TCertificateList; var AnIndex: Integer);
  public

  end;

var
  formSelectCertificate: TformSelectCertificate;

implementation

uses
  hw_utils,
  Hw.Convert,
  ApiRenave,
  RenaveRepo, hw_win_utils;

{$R *.dfm}

procedure TformSelectCertificate.BitBtn2Click(Sender: TObject);
begin

  var api := TApiRenaveSingleton.GetInstance();
  var repo := TRenaveRepoSingleton.GetInstance();
  var rescId := api.CertificateId;

//  api.CertificateId := dataCertificates.FieldByName('certificateId').AsString;

  var cert := Converter.NewObj<TCertificadoModel>(dataCertificates);//.Copy(cert);

  api.CertificateId := cert.certificateId;

  try

    var payload := api.GetClienteAutenticado();

    if Assigned(payload) then
    begin

      if not repo.DevelopmentMode then
      begin

        if not cert.dados.Contains(payload.cnpj) then
          raise Exception.Create('CNPJ do certificado não confere com o CNPJ retornado da API Renave');

        if not cnpjEmpresa.Equals(payload.cnpj) then
          raise Exception.Create('CNPJ da empresa não confere com o CNPJ retornado da API Renave');

      end;

      if not TRenaveRepoSingleton.GetInstance().PostCertificate(cert) then
        raise Exception.Create('Erro ao salvar identificação do certificado no banco');


      lbEmpresa.Caption := ('Nome: ' + cert.name);
      lbVenci.Caption := ('Vencimento: ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', cert.vencimento));

      ShowAtencao(StrConcat(['Dados da empresa na API Renave', _DLB,
                             'Nome: ', payload.nome, _LB,
                             'CNPJ:', payload.cnpj, _DLB,
                             'Endereço', _LB,
                             payload.endereco.logradouro, ' ', payload.endereco.numero, ' ', payload.endereco.complemento, _LB,
                             payload.endereco.bairro, ' - ', payload.endereco.municipio, ' - CEP ', payload.endereco.cep
        ]));

      page.ActivePage := abaItem;
    end
    else
      raise Exception.Create('Resposta vazia RENAVE');

  except on E: Exception do
    begin

      api.CertificateId := rescId;

      ShowErro('Erro ao comunicar com API Renave:' + sLineBreak +
                E.Message + sLineBreak);
    end;
  end;

end;

procedure TformSelectCertificate.btSelectCertificateClick(Sender: TObject);
begin
  var api := TApiRenaveSingleton.GetInstance();

  api.OnNeedClientCertificate := NetHTTPClientNeedClientCertificate;
  try

    try

      var payload := api.GetClienteAutenticado();


    except on E: Exception do
      begin
        lbEmpresa.Caption := (E.Message);
        lbVenci.Caption := '';
      end;
    end;

  finally
    api.OnNeedClientCertificate := nil;
    api.Reset;
  end;

end;

procedure TformSelectCertificate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  formSelectCertificate := nil;
end;

procedure TformSelectCertificate.FormCreate(Sender: TObject);
begin
  dataSourceCerts := TDataSource.Create(nil);
  dataCertificates := ConverterAll.ClassToEmptyDataSet(TCertificadoModel);
end;

procedure TformSelectCertificate.FormDestroy(Sender: TObject);
begin
  dataCertificates.Free;
  dataSourceCerts.Free;
end;

procedure TformSelectCertificate.FormShow(Sender: TObject);
begin
  var repo := TRenaveRepoSingleton.GetInstance();

  cnpjEmpresa := repo.CnpjEmp;

  var cert := repo.GetCertificate;

  lbVenci.Caption := '';
  if cert.name.IsEmpty then
    lbEmpresa.Caption := ('Nenhum certificado selecionado ainda. Clique no botão abaixo para selecionar')
  else
  begin
    lbEmpresa.Caption := ('Nome: ' + cert.name);
    lbVenci.Caption := ('Vencimento: ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', cert.vencimento));
  end;

  abaList.TabVisible := False;
  abaItem.TabVisible := False;

  page.ActivePage := abaItem;

end;

procedure TformSelectCertificate.NetHTTPClientNeedClientCertificate(
  const Sender: TObject; const ARequest: TURLRequest;
  const ACertificateList: TCertificateList; var AnIndex: Integer);
var
  certificados: TArray<TCertificadoModel>;
//  certs: TCertificados;
  cert: TCertificadoModel;
begin

  for var I := 0 to ACertificateList.Count - 1 do
  begin
    cert := TCertificadoModel.Create;
    cert.dados         := ACertificateList[I].Subject;
    cert.certificateId := ACertificateList[I].SerialNum;
    cert.vencimento    := ACertificateList[I].Expiry;
    cert.emissao       := ACertificateList[I].Start;
    cert.name          := ACertificateList[I].ProtocolName;

    certificados := certificados + [cert];
  end;

  dataCertificates.EmptyDataSet;
  Converter.CopyAll<TCertificadoModel>(certificados, dataCertificates);

  dataSourceCerts.DataSet := dataCertificates;
  grid_cert.DataSource := dataSourceCerts;
  memoDados.DataSource := dataSourceCerts;
  memoDados.DataField := 'dados';

  page.ActivePage := abaList;

  AnIndex := -1;

end;

end.
