unit EventosRtcForm;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, Data.DB, Vcl.Controls,
  Vcl.Forms, Vcl.StdCtrls, Vcl.Dialogs, Vcl.DBGrids, NextBaseForm,
  QueryStandardForm, DataGridFrame, EventosRtcQuery, NextSetup;

type
  // Tela de Eventos RTC somente leitura. O catalogo injeta a consulta pronta e
  // o Setup antes de o host inicializar a tela; a conexao e a consulta so sao
  // abertas na primeira busca.
  TfrmEventosRtc = class(TfrmQueryStandard)
  private
    FQuery: TEventosRtcQuery;
    FSetup: TNextSetup;
    FPesquisando: Boolean;
    procedure ConfigureColumns;
    procedure ClearResult;
    procedure DoPesquisar(Sender: TObject);
  protected
    procedure DoInitializeView; override;
  public
    destructor Destroy; override;
    procedure Attach(AQuery: TEventosRtcQuery; ASetup: TNextSetup);
  end;

implementation

{$R *.dfm}

const
  MissingDependencyMessage = 'A tela Eventos RTC nao recebeu suas dependencias.';
  MissingQueryMessage = 'A consulta de eventos RTC nao foi informada.';
  MissingSetupMessage = 'O contexto da empresa nao foi informado.';
  AlreadyAttachedMessage = 'A consulta de eventos RTC ja foi associada a esta tela.';
  EmptyResultMessage = 'Nenhum evento RTC foi encontrado para a empresa ativa.';
  FailureMessage = 'Nao foi possivel consultar os eventos RTC da empresa ativa.';

procedure TfrmEventosRtc.Attach(AQuery: TEventosRtcQuery; ASetup: TNextSetup);
begin
  if AQuery = nil then
    raise Exception.Create(MissingQueryMessage);
  if ASetup = nil then
    raise Exception.Create(MissingSetupMessage);
  if (FQuery <> nil) or (FSetup <> nil) then
    raise Exception.Create(AlreadyAttachedMessage);
  // A propriedade da consulta e transferida para esta tela somente apos todas as verificacoes.
  FQuery := AQuery;
  FSetup := ASetup;
end;

procedure TfrmEventosRtc.ConfigureColumns;
var
  Column: TColumn;
begin
  fraGrid.dbgDados.Columns.Clear;

  Column := fraGrid.dbgDados.Columns.Add;
  Column.FieldName := 'CHNFE';
  Column.Title.Caption := 'Chave da NF-e';

  Column := fraGrid.dbgDados.Columns.Add;
  Column.FieldName := 'TPEVENTO';
  Column.Title.Caption := 'Tipo de evento';

  Column := fraGrid.dbgDados.Columns.Add;
  Column.FieldName := 'DHEVENTO';
  Column.Title.Caption := 'Data/hora do evento';
end;

procedure TfrmEventosRtc.ClearResult;
begin
  // Desvincular antes de fechar impede que uma busca com falha deixe o
  // resultado anterior visivel como se fosse o novo.
  dsConsulta.DataSet := nil;
  if FQuery <> nil then
    FQuery.Close;
end;

procedure TfrmEventosRtc.DoInitializeView;
begin
  inherited;
  if (FQuery = nil) or (FSetup = nil) then
    raise Exception.Create(MissingDependencyMessage);
  btnPesquisar.Enabled := True;
  btnPesquisar.OnClick := DoPesquisar;
  ConfigureColumns;
end;

procedure TfrmEventosRtc.DoPesquisar(Sender: TObject);
begin
  if FPesquisando then
    Exit;
  FPesquisando := True;
  btnPesquisar.Enabled := False;
  try
    ClearResult;
    try
      FSetup.EnsureConnection;
      FQuery.Open;
      dsConsulta.DataSet := FQuery.DataSet;
      if FQuery.DataSet.IsEmpty then
        MessageDlg(EmptyResultMessage, mtInformation, [mbOK], 0);
    except
      ClearResult;
      MessageDlg(FailureMessage, mtError, [mbOK], 0);
    end;
  finally
    FPesquisando := False;
    btnPesquisar.Enabled := True;
  end;
end;

destructor TfrmEventosRtc.Destroy;
begin
  dsConsulta.DataSet := nil;
  if FQuery <> nil then
  begin
    FQuery.Close;
    FQuery.Free;
    FQuery := nil;
  end;
  if FSetup <> nil then
  begin
    FSetup.ReleaseContext;
    FSetup := nil;
  end;
  inherited;
end;

end.
