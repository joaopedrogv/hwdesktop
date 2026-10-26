unit frmVeiculosZeroPendentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, DataSnap.DBClient, Vcl.Menus, Vcl.Buttons;

type
  EnumMotivoCancelamento = (rDesistencia, rErroOperacionalMontadora);

  TformVeiculosZeroPendentes = class(TForm)
    Panel1: TPanel;
    pn_grid: TPanel;
    Panel3: TPanel;
    grid_veic: TDBGrid;
    SpeedButton1: TSpeedButton;
    popMenu: TPopupMenu;
    Rejeitarveculozero1: TMenuItem;
    N1: TMenuItem;
    Cancelarrejeioveculozero1: TMenuItem;
    Desistencia1: TMenuItem;
    Errooperacionalmontadora1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Desistencia1Click(Sender: TObject);
    procedure Errooperacionalmontadora1Click(Sender: TObject);
    procedure Cancelarrejeioveculozero1Click(Sender: TObject);
  private
    dataSet: TClientDataSet;
    dataSource: TDataSource;

    procedure CallApi;
    procedure RejeitarVeiculo(motivo: EnumMotivoCancelamento);
  public

  end;

var
  formVeiculosZeroPendentes: TformVeiculosZeroPendentes;

implementation

uses
  hw_utils,
  Hw.Convert,
  ApiRenave,
  RenaveRepo,
  hw_win_utils,
  SolicitacaoRejeicaoZeroKmModel,
  VeiculoZeroKmPendenteEntradaEstoqueModel;

{$R *.dfm}

procedure TformVeiculosZeroPendentes.CallApi;
begin

  Screen.Cursor := crHourGlass;
  try

    var api := TApiRenaveSingleton.GetInstance();

    try

      var payload := api.GetVeiculoZeroKmPendenteEntradaEstoque();

      if Assigned(payload) then
      begin
        dataSet.EmptyDataSet;
        Converter.CopyAll<TVeiculoZeroKmPendenteEntradaEstoqueModel>(payload, dataSet);

        dataSource.DataSet := dataSet;
        grid_veic.DataSource := dataSource;
      end
      else
        grid_veic.Visible := False;
  //      raise Exception.Create('Resposta vazia RENAVE');

    except on E: Exception do
      begin

        ShowErro('Erro ao comunicar com API Renave:' + sLineBreak +
                  E.Message + sLineBreak);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TformVeiculosZeroPendentes.Cancelarrejeioveculozero1Click(
  Sender: TObject);
begin
  var chassi := '';
  if not InputQuery('Chassi', 'Informe o chassi', chassi) then
    Exit;


  if chassi.Trim.IsEmpty then
  begin
    ShowErro('Chassi não informado');
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try

    var api := TApiRenaveSingleton.GetInstance();

    try

      var payload := TSolicitacaoCancelamentoRejeicaoZeroKmModel.Create;

      payload.chassi := chassi;
      payload.cpfOperadorResponsavel := TRenaveRepoSingleton.GetInstance().cpfResponsavel;

      var repo := TRenaveRepoSingleton.GetInstance();

      if not repo.Auditor.Processo('RNV010').SetMensagem('Chassi ' + payload.chassi)
        .Cancelar.Permitido then
        Exit;

      if api.PostCancelamentoRejeicaoZeroKm(payload) then
      begin
        ShowAtencao('Cancelamento de rejeição de veículo aceita com sucesso pelo RENAVE');

        CallApi;
      end
      else
        ShowErro('Cancelamento de rejeição de veículo não aceita pelo RENAVE');

    except on E: Exception do
      begin

        ShowErro('Erro com API Renave:' + sLineBreak +
                  E.Message + sLineBreak);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TformVeiculosZeroPendentes.Desistencia1Click(Sender: TObject);
begin
  RejeitarVeiculo(rDesistencia);
end;

procedure TformVeiculosZeroPendentes.Errooperacionalmontadora1Click(
  Sender: TObject);
begin
  RejeitarVeiculo(rErroOperacionalMontadora);
end;

procedure TformVeiculosZeroPendentes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  formVeiculosZeroPendentes := nil;
end;

procedure TformVeiculosZeroPendentes.FormCreate(Sender: TObject);
begin
  dataSource := TDataSource.Create(nil);
  dataSet := ConverterAll.ClassToEmptyDataSet(TVeiculoZeroKmPendenteEntradaEstoqueModel);
end;

procedure TformVeiculosZeroPendentes.FormDestroy(Sender: TObject);
begin
  dataSet.Free;
  dataSource.Free;
end;

procedure TformVeiculosZeroPendentes.FormShow(Sender: TObject);
begin
  CallApi;
end;

procedure TformVeiculosZeroPendentes.RejeitarVeiculo(
  motivo: EnumMotivoCancelamento);
begin
  Screen.Cursor := crHourGlass;
  try

    var api := TApiRenaveSingleton.GetInstance();

    try

      var payload := TSolicitacaoRejeicaoZeroKmModel.Create;

      payload.chassi := dataSet.FieldByName('chassi').AsString;
      payload.cpfOperadorResponsavel := TRenaveRepoSingleton.GetInstance().cpfResponsavel;
      case motivo of
        rDesistencia:
          payload.motivoRejeicao := 'DESISTENCIA';

        rErroOperacionalMontadora:
          payload.motivoRejeicao := 'ERRO_OPERACIONAL_MONTADORA';
      end;

      var repo := TRenaveRepoSingleton.GetInstance();

      if not repo.Auditor.Processo('RNV009').SetMensagem('Chassi ' + payload.chassi)
        .Salvar.Permitido then
        Exit;

      if api.PostRejeicaoZeroKm(payload) then
      begin
        ShowAtencao('Rejeição de veículo aceita com sucesso pelo RENAVE');

        CallApi;
      end
      else
        ShowErro('Rejeição de veículo não aceita pelo RENAVE');

    except on E: Exception do
      begin

        ShowErro('Erro com API Renave:' + sLineBreak +
                  E.Message + sLineBreak);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TformVeiculosZeroPendentes.SpeedButton1Click(Sender: TObject);
begin
  popMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

end.
