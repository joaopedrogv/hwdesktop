unit Hw.Integra.Api.Form.Creditos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Hw.Integra.Api.Rest,
  Hw.Integra.Api.CreditoBoleto,
  Hw.Integra.Api.NotificacaoContasEmAberto,
  Datasnap.DBClient,
  Hw.Servicos,
  Hw.Integra.Servicos,
  Hw.Integra.Servicos.Financeiro;

type
  TFrmCreditosHw = class(TForm)
    Panel1: TPanel;
    pn_information: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    grid_creditos: TDBGrid;
    bt_consulta: TBitBtn;
    bt_print: TBitBtn;
    bt_sair: TBitBtn;
    ed_log: TMemo;
    bt_printall: TBitBtn;
    bt_log: TSpeedButton;
    pn_inf_resolvido: TPanel;
    bt_cad_ctp: TBitBtn;
    procedure bt_consultaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_printClick(Sender: TObject);
    procedure bt_printallClick(Sender: TObject);
    procedure bt_logClick(Sender: TObject);
    procedure bt_cad_ctpClick(Sender: TObject);
    procedure grid_creditosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    FolderImgs: string;
    DataSource: TDataSource;
    Client: TClientDataSet;
    FIntegra: THwIntegraServicosFinanceiro;
    FConsulta: THwServicosJSON;
    FCreditos: TArray<TCreditoBoleto>;
    FEmpresas: TArray<Integer>;
    FUsuarioId: Integer;

    procedure CreditosToClientDataSet();
    function ReplaceImagens(Text: string): string;
  public
    procedure LogApi(Msg: string);

    property Integra: THwIntegraServicosFinanceiro read FIntegra write FIntegra;
    property Consulta: THwServicosJSON read FConsulta write FConsulta;
    property Creditos: TArray<TCreditoBoleto> read FCreditos write FCreditos;
    property Empresas: TArray<Integer> read FEmpresas write FEmpresas;
    property UsuarioId: Integer read FUsuarioId write FUsuarioId;
  end;

var
  FrmCreditosHw: TFrmCreditosHw;

implementation

uses
  HW.Utils.Classes.Funcoes_DX, REST.Json, hw_utils, hw_win_utils, WinApi.SHFolder,
  System.Generics.Collections, HW.Utils.Classes.Registros_DX, hw_boleto_utils,
  System.StrUtils, ShellApi;

{$R *.dfm}

{ TFrmCreditosHw }

procedure TFrmCreditosHw.bt_cad_ctpClick(Sender: TObject);
begin

  if not Assigned(Client) then
    Exit;

  if Client.IsEmpty then
    Exit;

  if Creditos[Client.RecNo - 1].boleto = nil then
    Exit;

  Screen.Cursor := crHourGlass;
  try
    Integra.FinanceiroService_Cadastrar_Contas_Como_APagar(Creditos[Client.RecNo - 1], UsuarioId);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCreditosHw.bt_consultaClick(Sender: TObject);
var
  dados: TNotificacaoContasEmAberto;
  cred, novos: TArray<TCreditoBoleto>;
  I, J, empresaRescue: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    empresaRescue := Integra.CodEmpresa;
    for I := Low(Empresas) to High(Empresas) do
    begin
      Integra.CodEmpresa := Empresas[I];
      dados := Integra.FinanceiroService_Consultar(Consulta);
      if dados <> nil then
        for J := Low(dados.Contas) to High(dados.Contas) do
        begin
          SetLength(novos, Length(novos) + 1);
          novos[High(novos)] := dados.Contas[J];
        end;
    end;
    Integra.CodEmpresa := empresaRescue;

    if Length(novos) > 0 then
  //    cred := novos;

  //  if Assigned(cred) then
    begin
      Creditos := novos;
      CreditosToClientDataSet();
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCreditosHw.bt_printallClick(Sender: TObject);
var
  Prev: TBoletoPreview;
  I: Integer;
begin
  if not Assigned(Client) then
    Exit;

  if Client.IsEmpty then
    Exit;

  Prev := TBoletoPreview.Create;
  Screen.Cursor := crHourGlass;
  try
    for I := Low(Creditos) to High(Creditos) do
      if Assigned(Creditos[I].boleto) then
        if not Creditos[I].boleto.htmlBoleto.Trim.IsEmpty then
        begin
          //Prev.New.html.Text := ReplaceImagens(Creditos[I].boleto.htmlBoleto);
          Prev.NewFromText(ReplaceImagens(Creditos[I].boleto.htmlBoleto));
        end;

    if Prev.Count > 0 then
      Prev.Preview;
  finally
    Prev.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCreditosHw.bt_printClick(Sender: TObject);
var
  Prev: TBoletoPreview;
begin

  if not Assigned(Client) then
    Exit;

  if Client.IsEmpty then
    Exit;

  if Creditos[Client.RecNo - 1].boleto = nil then
    Exit;

  if Creditos[Client.RecNo - 1].boleto.htmlBoleto.IsEmpty then
    Exit;


  Prev := TBoletoPreview.Create;
  Screen.Cursor := crHourGlass;
  try
    //Prev.New.html.Text := ReplaceImagens(Creditos[Client.RecNo - 1].boleto.htmlBoleto);
    Prev.NewFromText(ReplaceImagens(Creditos[Client.RecNo - 1].boleto.htmlBoleto));
    Prev.Preview;
  finally
    Prev.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCreditosHw.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(Client) then
    FreeAndNil(Client);

  DataSource.Free;

  Action := caFree;
  Self := nil;
end;

procedure TFrmCreditosHw.FormCreate(Sender: TObject);
begin
  DataSource := TDataSource.Create(Self);
  DataSource.AutoEdit := False;
end;

procedure TFrmCreditosHw.FormShow(Sender: TObject);
begin
  Self.Icon.Handle := ExtractIcon(Handle,PChar(Application.ExeName),0);

  FolderImgs := GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Hw Sistemas\Utilitarios\';

  grid_creditos.DataSource := DataSource;

  //if not Assigned(FCreditos) then
    //raise Exception.Create('Creditos unassigned');

  if not Assigned(FIntegra) then
    raise Exception.Create('Integra unassigned');

  if not Assigned(FConsulta) then
    raise Exception.Create('Consulta unassigned');

  bt_log.Visible := Integra.DevelopmentMode;

  CreditosToClientDataSet();
end;

procedure TFrmCreditosHw.grid_creditosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  R: TRect;
  Agrid: TDBGrid;
begin
  Agrid := TDBGrid(Sender);
  if Agrid.DataSource = nil then
    Exit;

  if Agrid.DataSource.DataSet = nil then
    Exit;

  if not Agrid.DataSource.DataSet.Active then
    Exit;

  if//-- Column.FieldName.ToLower.Equals('datavencimento') and
    (Client.FieldByName('datavencimento').AsDateTime <= Date) then
    if (gdFocused in State) then
    begin
      Agrid.Canvas.Brush.Color := clWindow;
      Agrid.Canvas.Font.Color  := clWindowText;
    end
    else
    begin
      if Client.FieldByName('datavencimento').AsDateTime = Date then
        Agrid.Canvas.Font.Color := clGreen
      else
        Agrid.Canvas.Font.Color := clRed;
      Agrid.Canvas.Brush.Color := clCream;
      //Agrid.Canvas.Font.Color  := clWhite;
    end;
  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmCreditosHw.CreditosToClientDataSet();
begin
  grid_creditos.Visible := False;
  pn_inf_resolvido.Visible := grid_creditos.Visible;
  grid_creditos.DataSource.DataSet := nil;

  if Assigned(Client) then
    FreeAndNil(Client);
  if Creditos <> nil then
  begin
    Client := THwDbConverter.ObjectToDBClient<TCreditoBoleto>(Creditos);
    Client.FieldByName('valor').DisplayLabel := 'Valor até o Vencimento';
    TFloatField(Client.FieldByName('valor')).DisplayFormat := '#,##0.00';
    grid_creditos.DataSource.DataSet := Client;
    grid_creditos.Visible := Client.RecordCount > 0;
    pn_inf_resolvido.Visible := grid_creditos.Visible;
    Client.IndexDefs.Add('data_venc_desc', 'datavencimento', []);
    Client.IndexName := 'data_venc_desc';
  end;

  pn_information.Caption := 'Relação de Documentos em aberto - Ultima consulta ' +
                            FormatDateTime('dd/MM/yyyy hh:mm:ss', Consulta.DataConsulta) +
                            ' - ' + Consulta.Status;
end;

procedure TFrmCreditosHw.LogApi(Msg: string);
begin
  ed_log.Lines.Add(Msg);
end;

function TFrmCreditosHw.ReplaceImagens(Text: string): string;
begin
  Result := ReplaceText(Text, '¿pathimagens£', FolderImgs);
end;

procedure TFrmCreditosHw.bt_logClick(Sender: TObject);
begin
  ed_log.Visible := not ed_log.Visible;
end;

end.
