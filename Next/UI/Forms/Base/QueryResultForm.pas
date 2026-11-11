unit QueryResultForm;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, System.UITypes, Data.DB,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBGrids, NextBaseForm,
  QueryStandardForm, DataGridFrame, GridColumnDefinition, IDataSetReaderUnit,
  QueryResultOperations, Vcl.StdCtrls, FilterFrame, FilterCriterion,
  Vcl.ExtCtrls;

type
  // Fabrica de leitores para consultas que montam o SQL a partir dos criterios
  // coletados. A forma de criar o leitor permanece na composicao.
  TQueryResultReaderFactory = reference to function(
    const ACriteria: TFilterCriteria): IDataSetReader;

  // Apresentacao generica de uma leitura. Recebe o leitor, as colunas e o titulo;
  // nao conhece SQL, driver, Setup nem a composicao. A tela possui o leitor
  // recebido; quando ele e o wrapper do Next, a reserva do contexto pertence a
  // esse wrapper e e liberada junto com ele.
  TfrmQueryResult = class(TfrmQueryStandard)
  private
    FReader: IDataSetReader;
    FReaderFactory: TQueryResultReaderFactory;
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
    procedure ResetForSessionChange; override;
    procedure Attach(const AReader: IDataSetReader;
      const AColumns: TGridColumnDefinitions; const ATitle: string;
      AOperations: IQueryResultOperations = nil);
    procedure AttachReaderFactory(const AFactory: TQueryResultReaderFactory;
      const AColumns: TGridColumnDefinitions; const ATitle: string);
  end;

implementation

{$R *.dfm}

const
  MissingReaderMessage = 'O leitor de dados da consulta nao foi informado.';
  MissingReaderFactoryMessage =
    'A fabrica de leitores da consulta nao foi informada.';
  MissingTitleMessage = 'O titulo da consulta nao foi informado.';
  AlreadyAttachedMessage =
    'O leitor de dados da consulta ja foi associado a esta tela.';
  MissingDependencyMessage =
    'A tela de consulta nao recebeu seu leitor de dados.';
  EmptyResultMessage =
    'Nenhum registro foi encontrado para a consulta de %s.';
  FailureMessage = 'Nao foi possivel consultar os dados de %s.';
  InvalidFilterTitle = 'Filtro invalido';
  EmptyResultTitle = 'Consulta sem resultados';
  QueryFailureTitle = 'Falha na consulta';

procedure TfrmQueryResult.Attach(const AReader: IDataSetReader;
  const AColumns: TGridColumnDefinitions; const ATitle: string;
  AOperations: IQueryResultOperations = nil);
begin
  if AReader = nil then
    raise Exception.Create(MissingReaderMessage);
  if Trim(ATitle) = '' then
    raise Exception.Create(MissingTitleMessage);
  if (FReader <> nil) or Assigned(FReaderFactory) then
    raise Exception.Create(AlreadyAttachedMessage);

  // A propriedade do leitor passa para a tela somente depois de todas as
  // verificacoes; nenhuma falha ocorre a partir daqui.
  FReader := AReader;
  FColumns := AColumns;
  FTitle := ATitle;
  FOperations := AOperations;

  fraGrid.Configure(AOperations);

  //fraGrid.Configure(AFieldMark, AOperations);
end;

procedure TfrmQueryResult.AttachReaderFactory(
  const AFactory: TQueryResultReaderFactory;
  const AColumns: TGridColumnDefinitions; const ATitle: string);
begin
  if not Assigned(AFactory) then
    raise Exception.Create(MissingReaderFactoryMessage);
  if Trim(ATitle) = '' then
    raise Exception.Create(MissingTitleMessage);
  if (FReader <> nil) or Assigned(FReaderFactory) then
    raise Exception.Create(AlreadyAttachedMessage);

  // A consulta cria um novo leitor a cada pesquisa; nenhum leitor e recebido
  // nesta associacao. Sem operacoes de marcacao, a grade nao exibe a coluna SEL
  // nem os comandos de selecao.
  FReaderFactory := AFactory;
  FColumns := AColumns;
  FTitle := ATitle;
  FOperations := nil;

  fraGrid.Configure(nil);
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
  // Desvincular antes de limpar impede que a grade retenha um dataset liberado.
  dsConsulta.DataSet := nil;
  if FReader <> nil then
  begin
    FReader.Limpar;
    if Assigned(FReaderFactory) then
      FReader := nil;
  end;
end;

procedure TfrmQueryResult.ResetForSessionChange;
begin
  // A proxima pesquisa deve usar a empresa da sessao atual. O caminho existente
  // desvincula o conjunto e libera o leitor conforme a fabrica ou o modo direto,
  // sem deixar resultado ou marcacoes anteriores disponiveis na grade.
  ClearResult;
end;

procedure TfrmQueryResult.DoPesquisar(Sender: TObject);
var
  Collected: TFilterCriteriaResult;
  Criteria: TFilterCriteria;
  NewReader: IDataSetReader;
begin
  if FPesquisando then
    Exit;
  FPesquisando := True;
  btnPesquisar.Enabled := False;
  try
    Criteria := nil;
    if Assigned(FReaderFactory) and FiltersConfigured then
    begin
      Collected := CollectFilters;
      if Collected.Status = fcsInvalid then
      begin
        Application.MessageBox(PChar(Collected.ValidationMessage),
          PChar(InvalidFilterTitle), MB_OK or MB_ICONWARNING);
        Exit;
      end;

      if Collected.Status = fcsValidCriteria then
        Criteria := Collected.Criteria;
    end;

    ClearResult;
    try
      if Assigned(FReaderFactory) then
      begin
        NewReader := FReaderFactory(Criteria);
        if NewReader = nil then
          raise Exception.Create(MissingReaderMessage);
        FReader := NewReader;
        NewReader := nil;
      end;

      FReader.Pesquisar;
      dsConsulta.DataSet := FReader.DataSet;
      if FReader.DataSet.IsEmpty then
      begin
        ClearResult;
        Application.MessageBox(PChar(Format(EmptyResultMessage, [FTitle])),
          PChar(EmptyResultTitle), MB_OK or MB_ICONINFORMATION);
      end;
    except
      ClearResult;
      Application.MessageBox(PChar(Format(FailureMessage, [FTitle])),
        PChar(QueryFailureTitle), MB_OK or MB_ICONERROR);
    end;
  finally
    FPesquisando := False;
    btnPesquisar.Enabled := True;
  end;
end;

procedure TfrmQueryResult.DoInitializeView;
begin
  inherited;
  if (FReader = nil) and (not Assigned(FReaderFactory)) then
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
      // A tela libera o leitor atual e a fabrica depois de desvincular o
      // conjunto. Se o leitor for o wrapper do Next, ele libera o leitor interno
      // antes de devolver a reserva do contexto.
      FReader := nil;
      FReaderFactory := nil;
    finally
      inherited;
    end;
  end;
end;

end.
