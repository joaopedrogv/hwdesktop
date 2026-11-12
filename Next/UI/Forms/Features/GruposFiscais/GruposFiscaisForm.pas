unit GruposFiscaisForm;

interface

uses
  System.SysUtils, System.UITypes, Data.DB, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, QueryResultForm, FilterCriterion, IDataSetReaderUnit,
  GridColumnDefinition, GruposFiscaisPresenter, QueryResultOperations;

type
  // Tela de consulta de Grupos Fiscais. Herda a apresentacao generica e
  // acrescenta a identidade da consulta e a simulacao de exclusao da linha
  // corrente (ponto de extensao da operacao real). O apresentador e o leitor
  // sao injetados pela composicao.
  TfrmGruposFiscais = class(TfrmQueryResult)
    btnSimularExclusao: TButton;
    procedure btnSimularExclusaoClick(Sender: TObject);
  private
    FPresenter: TGruposFiscaisPresenter;
    function IdLinhaCorrente: string;
    function PesquisarGrupos(
      const ACriteria: TFilterCriteria): IDataSetReader;
  protected
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

procedure TfrmGruposFiscais.DoInitializeView;
begin
  inherited;
  // O botao de simulacao fica a esquerda do Pesquisar, com a mesma ancora
  // direita. ConfigureFilters (chamado pela composicao antes desta
  // inicializacao) ja reposicionou btnPesquisar a 16 px da borda direita.
  btnSimularExclusao.Anchors := [akTop, akRight];
  btnSimularExclusao.Top := btnPesquisar.Top;
  btnSimularExclusao.Left := btnPesquisar.Left - btnSimularExclusao.Width - 8;
  Constraints.MinWidth := btnSimularExclusao.Left +
    btnSimularExclusao.Width + 8 + btnPesquisar.Width + 16;
end;

function TfrmGruposFiscais.IdLinhaCorrente: string;
var
  DataSet: TDataSet;
  Campo: TField;
begin
  Result := '';
  if dsConsulta = nil then
    Exit;

  DataSet := dsConsulta.DataSet;
  if (DataSet = nil) or (not DataSet.Active) or DataSet.IsEmpty then
    Exit;

  Campo := DataSet.FindField('ID');
  if Campo = nil then
    Exit;

  Result := Trim(Campo.AsString);
end;

procedure TfrmGruposFiscais.btnSimularExclusaoClick(Sender: TObject);
const
  SemRegistroMessage = 'Selecione um grupo fiscal na grade.';
  SemRegistroTitle = 'Simula'#231#227'o de exclus'#227'o';
  SucessoMessage = 'Exclus'#227'o simulada com sucesso.';
  SucessoTitle = 'Exclus'#227'o simulada';
  FalhaMessage =
    'N'#227'o foi poss'#237'vel concluir a simula'#231#227'o de exclus'#227'o.';
  FalhaTitle = 'Simula'#231#227'o de exclus'#227'o';
var
  Id: string;
begin
  Id := IdLinhaCorrente;
  if Id = '' then
  begin
    Application.MessageBox(PChar(SemRegistroMessage), PChar(SemRegistroTitle),
      MB_OK or MB_ICONINFORMATION);
    Exit;
  end;

  btnSimularExclusao.Enabled := False;
  try
    if FPresenter = nil then
    begin
      Application.MessageBox(PChar(FalhaMessage), PChar(FalhaTitle),
        MB_OK or MB_ICONERROR);
      Exit;
    end;

    try
      if FPresenter.SimularExclusao(Id) then
        Application.MessageBox(PChar(SucessoMessage), PChar(SucessoTitle),
          MB_OK or MB_ICONINFORMATION)
      else
        Application.MessageBox(PChar(FalhaMessage), PChar(FalhaTitle),
          MB_OK or MB_ICONERROR);
    except
      Application.MessageBox(PChar(FalhaMessage), PChar(FalhaTitle),
        MB_OK or MB_ICONERROR);
    end;
  finally
    btnSimularExclusao.Enabled := True;
  end;
end;

end.
