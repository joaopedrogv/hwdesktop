unit QueryStandardForm;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, Data.DB, Vcl.Controls,
  Vcl.ExtCtrls, Vcl.Forms, Vcl.StdCtrls, Vcl.Dialogs, NextBaseForm,
  DataGridFrame, FilterDefinition, FilterCriterion, FilterFrame,
  LocalPreferences;

type
  TfrmQueryStandard = class(TfrmNextBase)
    pnFiltros: TPanel;
    fraFiltros: TfrmFilterFrame;
    btnPesquisar: TButton;
    fraGrid: TfrmDataGridFrame;
    dsConsulta: TDataSource;
  private
    FFiltersConfigured: Boolean;
    FFilterDefinition: TFilterDefinition;
    procedure DoPesquisarPreview(Sender: TObject);
    procedure GridTitleCtrlClick(Sender: TObject; const AFieldName: string);
  protected
    function CollectFilters: TFilterCriteriaResult;
    procedure DoInitializeView; override;
    // Indica se CollectFilters esta disponivel. Telas que executam a pesquisa
    // com dados usam esta informacao para decidir se devem coletar criterios.
    property FiltersConfigured: Boolean read FFiltersConfigured;
  public
    // Recebe a definição, as preferências locais e a identidade estável da tela.
    // Configura a instância inline de fraFiltros somente quando chamado; a tela
    // herdada de Eventos RTC não usa filtros e mantém o próprio manipulador de
    // pesquisa.
    procedure ConfigureFilters(const ADefinition: TFilterDefinition;
      const APreferences: ILocalPreferences; const AIdentity: string);
  end;

implementation

{$R *.dfm}

const
  FiltersAlreadyConfiguredMessage =
    'Os filtros desta tela já foram configurados.';
  MissingPreferencesMessage =
    'As preferências locais dos filtros não foram informadas.';
  MissingIdentityMessage = 'A identidade dos filtros não foi informada.';
  FiltersNotConfiguredMessage =
    'Os filtros desta tela ainda não foram configurados.';
  NoFilterMessage = 'Nenhum filtro foi informado.';
  AllFilterMessage =
    'Todos os registros foram selecionados; não há filtros definidos.';
  FilterListHeader = 'Filtros coletados: %d';

procedure TfrmQueryStandard.ConfigureFilters(
  const ADefinition: TFilterDefinition;
  const APreferences: ILocalPreferences; const AIdentity: string);
begin
  if FFiltersConfigured then
    raise Exception.Create(FiltersAlreadyConfiguredMessage);

  if APreferences = nil then
    raise Exception.Create(MissingPreferencesMessage);

  if Trim(AIdentity) = '' then
    raise Exception.Create(MissingIdentityMessage);

  // O frame já faz parte do formulário (inline no DFM). A configuração apenas
  // injeta a definição e as preferências na instância existente, sem criar ou
  // liberar o frame: a tela é a proprietária.
  fraFiltros.Configure(ADefinition, APreferences, AIdentity);
  FFilterDefinition := ADefinition;
  FFiltersConfigured := True;

  // O botão fica à direita do frame, ancorado na borda direita do painel, sem
  // sobrepor os controles do frame. A largura mínima preserva essa separação.
  btnPesquisar.Align := alNone;
  btnPesquisar.Anchors := [akTop, akRight];
  btnPesquisar.Left := pnFiltros.ClientWidth - btnPesquisar.Width - 16;
  Constraints.MinWidth := btnPesquisar.Left + btnPesquisar.Width + 16;

  // A prévia só exibe o frame e habilita a pesquisa após a configuração.
  fraFiltros.Visible := True;
  btnPesquisar.OnClick := DoPesquisarPreview;
  btnPesquisar.Enabled := True;
end;

function TfrmQueryStandard.CollectFilters: TFilterCriteriaResult;
begin
  if not FFiltersConfigured then
    raise Exception.Create(FiltersNotConfiguredMessage);

  Result := fraFiltros.CollectCriteria;
end;

procedure TfrmQueryStandard.GridTitleCtrlClick(Sender: TObject;
  const AFieldName: string);
begin
  // O atalho apenas prepara o editor de pesquisa. Sem filtros configurados, o
  // gesto nao altera a ordem nem o resultado ja carregado.
  if FFiltersConfigured then
    fraFiltros.TrySelectField(AFieldName);
end;

procedure TfrmQueryStandard.DoPesquisarPreview(Sender: TObject);
var
  Collected: TFilterCriteriaResult;
  MessageText: string;
  I: Integer;
begin
  // A prévia apenas apresenta os critérios coletados; não executa SQL, leitor
  // nem consulta de dados.
  Collected := CollectFilters;

  case Collected.Status of
    fcsInvalid:
      MessageDlg(Collected.ValidationMessage, mtWarning, [mbOK], 0);
    fcsNoUserFilters:
      begin
        if Collected.AllSelected then
          MessageDlg(AllFilterMessage, mtInformation, [mbOK], 0)
        else
          MessageDlg(NoFilterMessage, mtInformation, [mbOK], 0);
      end;
    fcsValidCriteria:
      begin
        MessageText := Format(FilterListHeader, [Length(Collected.Criteria)]);
        for I := 0 to High(Collected.Criteria) do
          MessageText := MessageText + sLineBreak +
            FilterCriterionDisplayText(Collected.Criteria[I],
              FFilterDefinition);
        MessageDlg(MessageText, mtInformation, [mbOK], 0);
      end;
  end;
end;

procedure TfrmQueryStandard.DoInitializeView;
begin
  Caption := Format('Consulta - Next %d', [InstanceNumber]);
  fraGrid.DataSource := dsConsulta;
  fraGrid.OnTitleCtrlClick := GridTitleCtrlClick;

  // A tela só exibe filtros quando ConfigureFilters foi chamado. A instância
  // herdada de Eventos RTC mantém o frame oculto e instala, no próprio
  // descendente, o manipulador de pesquisa do leitor.
  if not FFiltersConfigured then
  begin
    fraFiltros.Visible := False;
    btnPesquisar.OnClick := nil;
    btnPesquisar.Enabled := False;
    Exit;
  end;

  fraFiltros.Visible := True;
  btnPesquisar.OnClick := DoPesquisarPreview;
  btnPesquisar.Enabled := True;
end;

end.
