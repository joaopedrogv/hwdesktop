unit EventoDFe211130ItensFrame;

interface

uses
  System.Classes, System.SysUtils, Data.DB, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, DataGridFrame, FilterFrame, EditorCadastro, CadastroEditorFrame,
  EventoDFe211130ItemView, EventoDFe211130ItemEditorFactory,
  EventoDFe211130ItemEtdUnit, NextMemoryDatasetDefinition, Vcl.ExtCtrls;

type
  TfrmEventoDFe211130ItensFrame = class(TFrame, IEditorCadastroHost)
    fraGrid: TfrmDataGridFrame;
    dsItens: TDataSource;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnRemover: TButton;
    pnComandos1: TPanel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    FColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>;
    FEditorFactory: IEventoDFe211130ItemEditorFactory;
    FItemForm: TForm;
    FItemEditor: TWinControl;
    FItemView: IEventoDFe211130ItemView;
    FAlterado: Boolean;
    procedure AbrirItem(const AId: string; AEditando: Boolean);
    procedure LiberarItem;
    function GetOnFeedback: TFrameFeedbackEvent;
    procedure SetOnFeedback(const AValue: TFrameFeedbackEvent);
    function GetValidationTarget: TWinControl;
  public
    destructor Destroy; override;
    procedure Configurar(const AColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>;
      const AEditorFactory: IEventoDFe211130ItemEditorFactory);
    procedure Carregar(const AItens: EventoDFe211130ItemEtdArray);
    function SelectAll: EventoDFe211130ItemEtdArray;
    function HasPendingChanges: Boolean;
    procedure Atualizar;
    procedure IncluirItem;
    procedure AlterarItem;
    procedure RemoverItem;
    procedure EditorSalvo(const AEditor: TWinControl);
    procedure EditorCancelado(const AEditor: TWinControl);
    property ValidationTarget: TWinControl read GetValidationTarget;
    property OnFeedback: TFrameFeedbackEvent read GetOnFeedback write SetOnFeedback;
  end;

implementation

{$R *.dfm}

uses
  NextDialogs, EValidacaoNegocioUnit;

destructor TfrmEventoDFe211130ItensFrame.Destroy;
begin
  fraGrid.DataSource := nil;
  dsItens.DataSet := nil;
  FEditorFactory := nil;
  FColecao := nil;
  inherited;
end;

procedure TfrmEventoDFe211130ItensFrame.Configurar(
  const AColecao: INextMemoryDefinition<EventoDFe211130ItemEtd>;
  const AEditorFactory: IEventoDFe211130ItemEditorFactory);
begin
  if AColecao = nil then
    raise Exception.Create('A coleção de itens do evento 211130 não foi informada.');
  if AEditorFactory = nil then
    raise Exception.Create('A fábrica do editor de item do evento 211130 não foi informada.');

  FColecao := AColecao;
  FEditorFactory := AEditorFactory;

  FColecao.Search(nil);
  fraGrid.Configure(FColecao.GetResultOperation, True);
  fraGrid.AttachColumnLayoutSource(FColecao);
  dsItens.DataSet := FColecao.GetDataSet;
  fraGrid.DataSource := dsItens;
  fraGrid.ConfigureColumns;
  Atualizar;
end;

procedure TfrmEventoDFe211130ItensFrame.Carregar(
  const AItens: EventoDFe211130ItemEtdArray);
var
  Modelos: TArray<EventoDFe211130ItemEtd>;
  I: Integer;
begin
  if FColecao = nil then
    raise Exception.Create('A coleção de itens do evento 211130 não foi configurada.');

  // A coleção genérica usa TArray<T>; o array do domínio é um tipo distinto.
  SetLength(Modelos, Length(AItens));
  for I := 0 to High(AItens) do
    Modelos[I] := AItens[I];

  fraGrid.ClearQuickFilters;
  FColecao.Load(Modelos);
  FAlterado := False;
  Atualizar;
end;

function TfrmEventoDFe211130ItensFrame.SelectAll: EventoDFe211130ItemEtdArray;
var
  Modelos: TArray<EventoDFe211130ItemEtd>;
  I: Integer;
begin
  if FColecao = nil then
    raise Exception.Create('A coleção de itens do evento 211130 não foi configurada.');

  Modelos := FColecao.SelectAll;
  SetLength(Result, Length(Modelos));
  for I := 0 to High(Modelos) do
    Result[I] := Modelos[I];
end;

function TfrmEventoDFe211130ItensFrame.HasPendingChanges: Boolean;
begin
  Result := (FItemForm <> nil) or FAlterado;
end;

procedure TfrmEventoDFe211130ItensFrame.Atualizar;
var
  DataSet: TDataSet;
  Item: EventoDFe211130ItemEtd;
  TemLinha: Boolean;
begin
  DataSet := nil;
  if FColecao <> nil then
    DataSet := FColecao.GetDataSet;

  TemLinha := (DataSet <> nil) and DataSet.Active and (not DataSet.IsEmpty);
  btnIncluir.Enabled := FColecao <> nil;
  btnAlterar.Enabled := TemLinha;
  btnRemover.Enabled := TemLinha;

  if TemLinha and FColecao.TryGetSelected(Item) then
    DataSet.Locate('ID', Item.Id, []);
end;

function TfrmEventoDFe211130ItensFrame.GetValidationTarget: TWinControl;
begin
  Result := fraGrid.dbgDados;
end;

function TfrmEventoDFe211130ItensFrame.GetOnFeedback: TFrameFeedbackEvent;
begin
  Result := fraGrid.OnFeedback;
end;

procedure TfrmEventoDFe211130ItensFrame.SetOnFeedback(
  const AValue: TFrameFeedbackEvent);
begin
  fraGrid.OnFeedback := AValue;
end;

procedure TfrmEventoDFe211130ItensFrame.btnIncluirClick(Sender: TObject);
begin
  IncluirItem;
end;

procedure TfrmEventoDFe211130ItensFrame.btnAlterarClick(Sender: TObject);
begin
  AlterarItem;
end;

procedure TfrmEventoDFe211130ItensFrame.btnRemoverClick(Sender: TObject);
begin
  RemoverItem;
end;

procedure TfrmEventoDFe211130ItensFrame.IncluirItem;
begin
  if FItemForm <> nil then
    Exit;

  AbrirItem('', False);
end;

procedure TfrmEventoDFe211130ItensFrame.AlterarItem;
var
  Item: EventoDFe211130ItemEtd;
begin
  if FItemForm <> nil then
    Exit;
  if (FColecao = nil) or (not FColecao.TryGetSelected(Item)) then
    Exit;

  AbrirItem(Item.Id, True);
end;

procedure TfrmEventoDFe211130ItensFrame.RemoverItem;
var
  Item: EventoDFe211130ItemEtd;
begin
  if FItemForm <> nil then
    Exit;
  if (FColecao = nil) or (not FColecao.TryGetSelected(Item)) then
    Exit;

  try
    FColecao.Remove;
    FAlterado := True;
  except
    on E: EValidacaoNegocio do
      TNextDialogs.ShowError(E.Message);
  end;

  Atualizar;
end;

procedure TfrmEventoDFe211130ItensFrame.AbrirItem(const AId: string;
  AEditando: Boolean);
var
  Editor: TEventoDFe211130ItemEditor;
  Preparado: Boolean;
begin
  FItemForm := TForm.CreateNew(nil);
  try
    FItemForm.BorderStyle := bsDialog;
    FItemForm.Position := poMainFormCenter;
    FItemForm.ClientWidth := 600;
    FItemForm.ClientHeight := 380;
    FItemForm.Caption := 'Item do evento';

    Editor := FEditorFactory.Criar(FItemForm, FItemForm, Self, FColecao);
    FItemEditor := Editor.Editor;
    FItemView := Editor.View;

    if AEditando then
      Preparado := TfrmCadastroEditor(FItemEditor).PrepararAbaAlteracao(AId)
    else
      Preparado := TfrmCadastroEditor(FItemEditor).PrepararAbaInclusao;

    if Preparado then
      FItemForm.ShowModal;
  finally
    LiberarItem;
  end;

  // A coleção só pode ser atualizada depois que o modal é liberado.
  Atualizar;
end;

procedure TfrmEventoDFe211130ItensFrame.LiberarItem;
begin
  FreeAndNil(FItemForm);
  FItemEditor := nil;
  FItemView := nil;
end;

procedure TfrmEventoDFe211130ItensFrame.EditorSalvo(const AEditor: TWinControl);
begin
  if FItemForm = nil then
    Exit;

  FAlterado := True;
  FItemForm.ModalResult := mrOk;
end;

procedure TfrmEventoDFe211130ItensFrame.EditorCancelado(
  const AEditor: TWinControl);
begin
  if FItemForm = nil then
    Exit;

  FItemForm.ModalResult := mrCancel;
end;

end.
