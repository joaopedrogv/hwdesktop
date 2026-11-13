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
    FQuickFilterEnabled: Boolean;
    FPesquisando: Boolean;
    procedure ConfigureColumns;
    procedure ClearResult;
    procedure DoPesquisar(Sender: TObject);
    function Pesquisar(const AExibirFalha: Boolean): Boolean;
  protected
    // Permite que a tela filha interrompa a pesquisa antes de limpar o
    // resultado ou criar um novo leitor. A validacao dos filtros ocorre antes.
    function CanPesquisar: Boolean; virtual;
    // Repete a pesquisa atual pela mesma sequencia de filtros, autorizacao e
    // leitura, sem o dialogo generico da falha. Retorna True quando a grade
    // reflete a consulta, incluindo resultado vazio. Destina-se as telas que
    // alteram dados e precisam atualizar o resultado com mensagem propria.
    function RepetirPesquisa: Boolean;
    procedure DoInitializeView; override;
  public
    destructor Destroy; override;
    procedure ResetForSessionChange; override;
    procedure Attach(const AReader: IDataSetReader;
      const AColumns: TGridColumnDefinitions; const ATitle: string;
      AOperations: IQueryResultOperations = nil;
      AQuickFilterEnabled: Boolean = False);
    procedure AttachReaderFactory(const AFactory: TQueryResultReaderFactory;
      const AColumns: TGridColumnDefinitions; const ATitle: string;
      AOperations: IQueryResultOperations = nil;
      AQuickFilterEnabled: Boolean = False);
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
  AOperations: IQueryResultOperations = nil;
  AQuickFilterEnabled: Boolean = False);
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
  FQuickFilterEnabled := AQuickFilterEnabled;

  fraGrid.Configure(AOperations, FQuickFilterEnabled);

  //fraGrid.Configure(AFieldMark, AOperations);
end;

procedure TfrmQueryResult.AttachReaderFactory(
  const AFactory: TQueryResultReaderFactory;
  const AColumns: TGridColumnDefinitions; const ATitle: string;
  AOperations: IQueryResultOperations = nil;
  AQuickFilterEnabled: Boolean = False);
begin
  if not Assigned(AFactory) then
    raise Exception.Create(MissingReaderFactoryMessage);
  if Trim(ATitle) = '' then
    raise Exception.Create(MissingTitleMessage);
  if (FReader <> nil) or Assigned(FReaderFactory) then
    raise Exception.Create(AlreadyAttachedMessage);

  // A consulta cria um novo leitor a cada pesquisa; nenhum leitor e recebido
  // nesta associacao. Sem coluna de marcacao nas operacoes recebidas, os
  // comandos de selecao ficam desabilitados. O filtro rapido tambem depende das
  // operacoes; nesta fatia a opcao permanece desabilitada quando elas nao
  // existem.
  FReaderFactory := AFactory;
  FColumns := AColumns;
  FTitle := ATitle;
  FOperations := AOperations;
  FQuickFilterEnabled := AQuickFilterEnabled;

  fraGrid.Configure(AOperations, FQuickFilterEnabled);
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
  // Cada pesquisa comeca sem criterios rapidos e sem a ordenacao do resultado
  // anterior; ambos pertencem ao conjunto que sera substituido.
  fraGrid.ClearSorting();
  fraGrid.ClearQuickFilters();

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

function TfrmQueryResult.CanPesquisar: Boolean;
begin
  Result := True;
end;

function TfrmQueryResult.Pesquisar(const AExibirFalha: Boolean): Boolean;
var
  Collected: TFilterCriteriaResult;
  Criteria: TFilterCriteria;
  NewReader: IDataSetReader;
begin
  Result := False;
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

    if not CanPesquisar then
      Exit;

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
      // A sequencia terminou e a grade reflete a consulta; resultado vazio
      // tambem conclui a pesquisa.
      Result := True;
      if FReader.DataSet.IsEmpty then
      begin
        ClearResult;
        Application.MessageBox(PChar(Format(EmptyResultMessage, [FTitle])),
          PChar(EmptyResultTitle), MB_OK or MB_ICONINFORMATION);
      end;
    except
      Result := False;
      ClearResult;
      // A falha generica pertence ao botao; a repeticao programatica deixa a
      // mensagem especifica para o chamador.
      if AExibirFalha then
        Application.MessageBox(PChar(Format(FailureMessage, [FTitle])),
          PChar(QueryFailureTitle), MB_OK or MB_ICONERROR);
    end;
  finally
    FPesquisando := False;
    btnPesquisar.Enabled := True;
  end;
end;

procedure TfrmQueryResult.DoPesquisar(Sender: TObject);
begin
  Pesquisar(True);
end;

function TfrmQueryResult.RepetirPesquisa: Boolean;
begin
  Result := Pesquisar(False);
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
