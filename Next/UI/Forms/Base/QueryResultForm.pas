unit QueryResultForm;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, Data.DB, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.DBGrids, NextBaseForm, QueryStandardForm,
  DataGridFrame, GridColumnDefinition, IDatabaseReaderUnit, QueryResultOperations, Vcl.StdCtrls, FilterFrame,
  Vcl.ExtCtrls;

type
  // Apresentacao generica de uma leitura. Recebe o leitor, as colunas e o titulo;
  // nao conhece SQL, driver, Setup nem a composicao. A tela possui o leitor
  // recebido; quando ele e o wrapper do Next, a reserva do contexto pertence a
  // esse wrapper e e liberada junto com ele.
  TfrmQueryResult = class(TfrmQueryStandard)
  private
    FReader: IDatabaseReader;
    FColumns: TGridColumnDefinitions;
    FOperations: IQueryResultOperations;
    FTitle: string;
    FPesquisando: Boolean;
    procedure ConfigureColumns;
    procedure ClearResult;
    procedure DoPesquisar(Sender: TObject);
  protected
    procedure DoInitializeView; override;
  public
    destructor Destroy; override;
    procedure Attach(const AReader: IDatabaseReader;
      const AColumns: TGridColumnDefinitions; const ATitle: string;
      AOperations: IQueryResultOperations = nil);
  end;

implementation

{$R *.dfm}

const
  MissingReaderMessage = 'O leitor de dados da consulta nao foi informado.';
  MissingTitleMessage = 'O titulo da consulta nao foi informado.';
  AlreadyAttachedMessage =
    'O leitor de dados da consulta ja foi associado a esta tela.';
  MissingDependencyMessage =
    'A tela de consulta nao recebeu seu leitor de dados.';
  EmptyResultMessage =
    'Nenhum registro foi encontrado para a consulta de %s.';
  FailureMessage = 'Nao foi possivel consultar os dados de %s.';

procedure TfrmQueryResult.Attach(const AReader: IDatabaseReader;
  const AColumns: TGridColumnDefinitions; const ATitle: string;
  AOperations: IQueryResultOperations = nil);
begin
  if AReader = nil then
    raise Exception.Create(MissingReaderMessage);
  if Trim(ATitle) = '' then
    raise Exception.Create(MissingTitleMessage);
  if FReader <> nil then
    raise Exception.Create(AlreadyAttachedMessage);

  // A propriedade do leitor passa para a tela somente depois de todas as
  // verificacoes; nenhuma falha ocorre a partir daqui.
  FReader := AReader;
  FColumns := AColumns;
  FTitle := ATitle;
  FOperations := AOperations;
  FOperations := AOperations;

  fraGrid.Configure(AOperations);

  //fraGrid.Configure(AFieldMark, AOperations);
end;

procedure TfrmQueryResult.ConfigureColumns;
var
  I: Integer;
  Column: TGridColumnDefinition;
  GridColumn: TColumn;
begin
  fraGrid.dbgDados.Columns.Clear;
  for I := 0 to High(FColumns) do
  begin
    Column := FColumns[I];
    GridColumn := fraGrid.dbgDados.Columns.Add;
    GridColumn.FieldName := Column.FieldName;
    GridColumn.Title.Caption := Column.Title;
    if Column.Width > 0 then
      GridColumn.Width := Column.Width;
    case Column.Alignment of
      qcaDefault: ;
      qcaLeft: GridColumn.Alignment := taLeftJustify;
      qcaCenter: GridColumn.Alignment := taCenter;
      qcaRight: GridColumn.Alignment := taRightJustify;
    end;
  end;
end;

procedure TfrmQueryResult.ClearResult;
begin
  // Desvincular antes de fechar impede que um resultado com falha deixe o
  // resultado anterior visivel como se fosse o novo.
  dsConsulta.DataSet := nil;
  if FReader <> nil then
    FReader.Limpar;
end;

procedure TfrmQueryResult.DoPesquisar(Sender: TObject);
begin
  if FPesquisando then
    Exit;
  FPesquisando := True;
  btnPesquisar.Enabled := False;
  try
    ClearResult;
    try
      FReader.Pesquisar;
      dsConsulta.DataSet := FReader.DataSet;
      if FReader.DataSet.IsEmpty then
        MessageDlg(Format(EmptyResultMessage, [FTitle]), mtInformation,
          [mbOK], 0);
    except
      ClearResult;
      MessageDlg(Format(FailureMessage, [FTitle]), mtError, [mbOK], 0);
    end;
  finally
    FPesquisando := False;
    btnPesquisar.Enabled := True;
  end;
end;

procedure TfrmQueryResult.DoInitializeView;
begin
  inherited;
  if FReader = nil then
    raise Exception.Create(MissingDependencyMessage);
  Caption := FTitle;
  btnPesquisar.Enabled := True;
  btnPesquisar.OnClick := DoPesquisar;
  ConfigureColumns;
end;

destructor TfrmQueryResult.Destroy;
begin
  try
    if dsConsulta <> nil then
      dsConsulta.DataSet := nil;
  finally
    try
      // A tela possui o leitor. Libera-lo fecha a consulta e desfaz a transacao;
      // se o leitor for o wrapper do Next, ele libera o leitor interno antes de
      // devolver a reserva do contexto.
      FReader := nil;
    finally
      inherited;
    end;
  end;
end;

end.
