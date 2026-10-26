unit frmTermosPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, uClasseConexao, DocumentsModel, System.Classes,
  Datasnap.DBClient;

type
  EnumPessoa = (pCliente, pColaborador);

  TformTermosPessoa = class(TForm)
    pn_container: TPanel;
    ToolBar1: TToolBar;
    novoTermoCliente: TToolButton;
    novoTermoColab: TToolButton;
    pn_cliente: TPanel;
    grid_cliente: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton8: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    dbClient: TClientDataSet;
    dataDocs: TConexao_OOP;
    FclienteId: Integer;
    FcolaboradorId: Integer;
  public
    { Public declarations }

    procedure FillGrid();
    function GetAllDocumentsApi(pessoa: EnumPessoa; externalCode: Integer): TArray<TDocument>;

    property clienteId: Integer read FclienteId write FclienteId;
    property colaboradorId: Integer read FcolaboradorId write FcolaboradorId;

  end;

var
  formTermosPessoa: TformTermosPessoa;

implementation

{$R *.dfm}

uses
  System.SysUtils,
  System.StrUtils,
  AssineonRepo,
  Hw.Convert,
  ApiAssineOn;

{ TformTermosPessoa }

procedure TformTermosPessoa.FillGrid;
begin
//  if colaboradorId > 0 then



end;

procedure TformTermosPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  dataDocs.Close;

  Action := caFree;
  formTermosPessoa := nil;
end;

procedure TformTermosPessoa.FormShow(Sender: TObject);
begin
  var repo := TAssineOnRepoSingleton.GetInstance();

  dbClient := ConverterAll.ClassToEmptyDataSet(TDocument, True, False, repo.Banco);

  dataDocs := TAssineOnRepoSingleton.GetInstance().NewClientOOP(dbClient);
  grid_cliente.DataSource := dataDocs.DataSourceOOP;

  var docs := GetAllDocumentsApi(pCliente, clienteId);

  Converter.CopyAll<TDocument>(docs, dataDocs.DataSet);

  docs := GetAllDocumentsApi(pColaborador, colaboradorId);

  Converter.CopyAll<TDocument>(docs, dataDocs.DataSet);







end;

function TformTermosPessoa.GetAllDocumentsApi(pessoa: EnumPessoa; externalCode: Integer): TArray<TDocument>;
begin
  Result := [];

  if externalCode = 0 then
    Exit;

  var extCode := IfThen(pessoa = pCliente, 'CLI_', 'COL_') + externalCode.ToString();

  var api := TApiAssineOnSingleton.GetInstance;

  var page := 1;
  var documents := api.GetDocuments(page, 50, extCode);

  if Length(documents) = 0 then
    Exit;

  while Length(documents) > 0 do
  begin
    for var doc in documents do
      Result := Result + [doc];

    page := page + 1;
    documents := api.GetDocuments(page, 50, extCode);
  end;

end;

end.
