unit GruposFiscaisForm;

interface

uses
  Winapi.Windows, System.SysUtils, Data.DB, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, QueryResultForm, FilterCriterion, IDataSetReaderUnit,
  GridColumnDefinition, GruposFiscaisPresenter, QueryResultOperations;

type
  // Tela de consulta de Grupos Fiscais. Herda a apresentacao generica e
  // acrescenta a identidade da consulta e o envio da linha corrente para a
  // lixeira. O apresentador e o leitor sao injetados pela composicao.
  TfrmGruposFiscais = class(TfrmQueryResult)
    btnEnviarLixeira: TButton;
    procedure btnEnviarLixeiraClick(Sender: TObject);
  private
    FPresenter: TGruposFiscaisPresenter;
    function LerLinhaCorrente(out AId, ADescricao: string): Boolean;
    function PesquisarGrupos(
      const ACriteria: TFilterCriteria): IDataSetReader;
  protected
    function CanPesquisar: Boolean; override;
    procedure DoInitializeView; override;
  public
    destructor Destroy; override;
    procedure AttachPresenter(APresenter: TGruposFiscaisPresenter;
      const AColumns: TGridColumnDefinitions; const ATitle: string;
      AOperations: IQueryResultOperations = nil);
  end;

implementation

{$R *.dfm}

const
  MissingPresenterMessage =
    'O apresentador de Grupos Fiscais nao foi informado.';
  LixeiraTitle = 'Enviar para a lixeira';
  SemRegistroMessage = 'Selecione um grupo fiscal na grade.';
  ConfirmacaoMessage =
    'Deseja enviar o grupo fiscal "%s" para a lixeira?';
  AtualizacaoFalhouMessage =
    'O grupo fiscal j'#225' foi enviado para a lixeira. Refa'#231'a a pesquisa para' +
    ' atualizar a consulta.';
  FalhaMessage =
    'N'#227'o foi poss'#237'vel enviar o grupo fiscal para a lixeira.';

destructor TfrmGruposFiscais.Destroy;
begin
  try
    FreeAndNil(FPresenter);
  finally
    inherited;
  end;
end;

procedure TfrmGruposFiscais.AttachPresenter(APresenter: TGruposFiscaisPresenter;
  const AColumns: TGridColumnDefinitions; const ATitle: string;
  AOperations: IQueryResultOperations = nil);
begin
  if APresenter = nil then
    raise Exception.Create(MissingPresenterMessage);

  // A base recebe apenas o metodo de pesquisa; a tela assume o apresentador
  // transiente so depois da associacao aceita, para nao deixar posse parcial.
  AttachReaderFactory(PesquisarGrupos, AColumns, ATitle, AOperations, False);
  FPresenter := APresenter;
end;

function TfrmGruposFiscais.PesquisarGrupos(
  const ACriteria: TFilterCriteria): IDataSetReader;
begin
  if FPresenter = nil then
    raise Exception.Create(MissingPresenterMessage);

  Result := FPresenter.CriarLeitor(ACriteria);
end;

function TfrmGruposFiscais.CanPesquisar: Boolean;
begin
  // A decisao e as mensagens de indisponibilidade pertencem ao apresentador, que
  // recebe esta tela como feedback. Sem apresentador a pesquisa nao prossegue.
  Result := (FPresenter <> nil) and FPresenter.AutorizarPesquisa(Self);
end;

procedure TfrmGruposFiscais.DoInitializeView;
begin
  inherited;
  // O botao de envio para a lixeira fica a esquerda do Pesquisar, com a mesma
  // ancora direita. ConfigureFilters (chamado pela composicao antes desta
  // inicializacao) ja reposicionou btnPesquisar a 16 px da borda direita.
  btnEnviarLixeira.Anchors := [akTop, akRight];
  btnEnviarLixeira.Top := btnPesquisar.Top;
  btnEnviarLixeira.Left := btnPesquisar.Left - btnEnviarLixeira.Width - 8;
  Constraints.MinWidth := btnEnviarLixeira.Left +
    btnEnviarLixeira.Width + 8 + btnPesquisar.Width + 16;
end;

function TfrmGruposFiscais.LerLinhaCorrente(out AId, ADescricao: string): Boolean;
var
  DataSet: TDataSet;
  CampoId, CampoDescricao: TField;
begin
  AId := '';
  ADescricao := '';
  Result := False;

  if dsConsulta = nil then
    Exit;

  DataSet := dsConsulta.DataSet;
  if (DataSet = nil) or (not DataSet.Active) or DataSet.IsEmpty then
    Exit;

  // A linha corrente e lida uma unica vez: a identidade identifica o registro a
  // alterar e a descricao identifica a linha na confirmacao e nas mensagens.
  CampoId := DataSet.FindField('ID');
  CampoDescricao := DataSet.FindField('DESCRICAO');
  if (CampoId = nil) or (CampoDescricao = nil) then
    Exit;

  AId := Trim(CampoId.AsString);
  ADescricao := Trim(CampoDescricao.AsString);
  Result := AId <> '';
end;

procedure TfrmGruposFiscais.btnEnviarLixeiraClick(Sender: TObject);
var
  Id, Descricao: string;
begin
  if not LerLinhaCorrente(Id, Descricao) then
  begin
    ShowInformation(SemRegistroMessage, LixeiraTitle);
    Exit;
  end;

  // O envio para a lixeira retira o grupo da consulta: somente a afirmacao
  // explicita prossegue, e o padrao do dialogo e "Nao".
  if Application.MessageBox(PChar(Format(ConfirmacaoMessage, [Descricao])),
    PChar(LixeiraTitle),
    MB_YESNO or MB_ICONWARNING or MB_DEFBUTTON2) <> IDYES then
    Exit;

  btnEnviarLixeira.Enabled := False;
  try
    if FPresenter = nil then
      ShowError(MissingPresenterMessage, LixeiraTitle)
    else
    begin
      try
        // O apresentador interpreta a autorizacao e apresenta a mensagem
        // correspondente; False interrompe sem repetir o que o legado mostrou.
        if not FPresenter.EnviarParaLixeira(Id, Self) then
          Exit;
      except
        // O apresentador traduz as falhas esperadas; este resguardo impede que
        // uma excecao inesperada atravesse o manipulador de evento.
        ShowError(FalhaMessage, LixeiraTitle);
        Exit;
      end;

      // A grade atualizada e a confirmacao do envio; nao ha dialogo de sucesso.
      if not RepetirPesquisa then
        ShowWarning(AtualizacaoFalhouMessage, LixeiraTitle);
    end;
  finally
    btnEnviarLixeira.Enabled := True;
  end;
end;

end.
