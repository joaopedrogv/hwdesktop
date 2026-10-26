unit uReservasVencidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, UClassesVeiculosCCIA, DB;

type
  TfrmReservasVencidas = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    Label30: TLabel;
    Panel5: TPanel;
    BitBtn99: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn20: TBitBtn;
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn99Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure habilitarbotoes(phabilitar: boolean = true);
    procedure ConfigurarForm(pValor: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReservasVencidas: TfrmReservasVencidas;
  FilaVeiculosReserva: TFilaVeiculosReserva;
  vDataHoraBanco: TDateTime;

implementation

uses
	uDtmAtivo, UDtmVeiculosCCIA, uDataSet_OOP, Registry, uDadosIni, DateUtils;

{$R *.dfm}

procedure TfrmReservasVencidas.BitBtn10Click(Sender: TObject);
begin
  inherited;
  try
	  FilaVeiculosReserva.abrirReserva;
  finally
    FilaVeiculosReserva.dataSet.Refresh;
  end;
end;

procedure TfrmReservasVencidas.BitBtn20Click(Sender: TObject);
var
	vProc: string;
begin
  try
    Screen.Cursor := crHourGlass;
    if FilaVeiculosReserva.dataSet.IsEmpty then
    	exit;
      
    habilitarbotoes(false);
    if trim(FilaVeiculosReserva.dataSet.FieldByName('TIPO_RES').AsString) = 'B' then
      vProc := 'VEI150'
    else if trim(FilaVeiculosReserva.dataSet.FieldByName('TIPO_RES').AsString)  = 'C' then
      vProc := 'VEI151'
    else
      vProc := 'VEI149';

    if not vDadosIni.PesqPros(vProc, 'RENOVAR', '', 'EST_MOTO', '', FilaVeiculosReserva.buscas, true) then
      exit;

    FilaVeiculosReserva.renovarReservasVencidas;
  finally
    habilitarbotoes;
    FilaVeiculosReserva.dataSet.Refresh;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmReservasVencidas.BitBtn99Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
  	FilaVeiculosReserva.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmReservasVencidas.BitBtn9Click(Sender: TObject);
var
	vProc: string;
begin
  try
    Screen.Cursor := crHourGlass;
    if FilaVeiculosReserva.dataSet.IsEmpty then
    	exit;
      
    habilitarbotoes(false);
    if trim(FilaVeiculosReserva.dataSet.FieldByName('TIPO_RES').AsString) = 'B' then
      vProc := 'VEI131'
    else if trim(FilaVeiculosReserva.dataSet.FieldByName('TIPO_RES').AsString)  = 'C' then
      vProc := 'VEI133'
    else
      vProc := 'VEI064';

    if not vDadosIni.PesqPros(vProc, 'RETIRAR', '', 'EST_MOTO', '', FilaVeiculosReserva.buscas, true) then
      exit;

    FilaVeiculosReserva.retirarReservasVencidas;
  finally
    habilitarbotoes;
    FilaVeiculosReserva.dataSet.Refresh;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmReservasVencidas.Configurarcolunas1Click(Sender: TObject);
begin
  inherited;
  TabSheet4.Show;
end;

procedure TfrmReservasVencidas.ConfigurarForm(pValor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    if (TelaCadastro <= 0 ) then
      exit;
      
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + 'TfrmPrincipalS', True);
      // Grava as informações do form
      Registro.WriteString('JanelasMaximizadas', pValor);
      Registro.WriteString('ExibirPropagandaFlash', 'N');
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmReservasVencidas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if trim(TDBGrid(Sender).DataSource.DataSet.FieldByName('POSICAO').AsString) <> '' then
    if (Column.FieldName = 'DATA_VENC_RES') or (Column.FieldName = 'HORA_VENC_RES') then
    begin
      if vDataHoraBanco > (TDBGrid(Sender).DataSource.DataSet.FieldByName('DATA_VENC_RES').AsDateTime
      + StrToTimeDef(TDBGrid(Sender).DataSource.DataSet.FieldByName('HORA_VENC_RES').AsString, TimeOf(vDataHoraBanco))) then
      begin
        TDBGrid(sender).Canvas.Brush.Color := clRed;
        TDBGrid(sender).Canvas.FillRect(Rect);
        TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
      end;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmReservasVencidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if (FilaVeiculosReserva <> nil) then
  begin
    FilaVeiculosReserva.Cancel;
    FilaVeiculosReserva.RollBackTransacao;
  end;
  FilaVeiculosReserva.free;
  FilaVeiculosReserva := nil;

  Action := caFree;
  if (frmReservasVencidas <> nil) then
    frmReservasVencidas := nil;
end;

procedure TfrmReservasVencidas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  try
  	Screen.Cursor := crHourGlass;
    habilitarbotoes(false);
    if TelaCadastro = 6 then
    begin
      if not vDadosIni.PesqPros('VEI064', 'RETIRAR', '', 'EST_MOTO', '', FilaVeiculosReserva.buscas, true) then
        exit;
      FilaVeiculosReserva.retirarReservasVencidas(true);
    end;
  finally
    habilitarbotoes;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmReservasVencidas.FormCreate(Sender: TObject);
begin
  if trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1)) = 'RESERVAVENC' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    if trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2)) = '2' then
    begin
      vDadosIni.vTipoForm := 6;
      if frmReservasVencidas = nil then
	      frmReservasVencidas := TfrmReservasVencidas(Self);
    end
    else
      vDadosIni.vTipoForm := 7;
    frmReservasVencidas.Caption := 'Veículos com reserva vencidas';
    vDadosIni.vModalOuChild := 'M';
  end
  else if trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1)) = 'RESERVAVENCENDO' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    if trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2)) = '2' then
      vDadosIni.vTipoForm := 10
    else
      vDadosIni.vTipoForm := 9;
    if frmReservasVencidas = nil then
	    frmReservasVencidas := TfrmReservasVencidas(Self);
    frmReservasVencidas.Caption := 'Reservas vencendo: ' + vDadosIni.vNomeFuncionario;
    Label30.Caption := frmReservasVencidas.Caption;
    vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;
	vDadosIni.vPesquisa := '';

  DBGrid1.DataSource := DtmVeiculosCCIA.dsFilaVeiculosReserva;
	FilaVeiculosReserva := TFilaVeiculosReserva.Create;
  TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;

  InibirEstatisticas := True;
  setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmReservasVencidas.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

	try
    ConfigurarForm('N');
    inherited;
    frmReservasVencidas.WindowState := wsNormal;
    frmReservasVencidas.Height := 598;
    frmReservasVencidas.Width  := 806;
    vDataHoraBanco := vDadosIni.getDataHoraBanco(FilaVeiculosReserva.buscas);
    configurarGridPeloConfigColunas(DBGrid1);
    PrimeiraPesquisa := false;
    if (TelaCadastro = 6) or (TelaCadastro = 7) then
    begin
       Panel2.Visible := false;
       Panel1.Visible := true;
       Panel1.Parent := Panel5;
       PageControl1.ActivePage := TabSheet4;
       TabSheet4.Show;

       if not FilaVeiculosReserva.BuscaReservaVencidas then
       begin
         if TelaCadastro = 6 then
         begin
         	 frmReservasVencidas.fechar := True;
           PostMessage(frmReservasVencidas.Handle, WM_CLOSE, 0, 0);
           Exit;
         end;
       end;
    end
    else if (TelaCadastro = 9) or (TelaCadastro = 10) then
    begin
       Panel2.Visible := false;
       Panel1.Visible := true;
       Panel1.Parent := Panel5;
       PageControl1.ActivePage := TabSheet4;
       TabSheet4.Show;

       if not FilaVeiculosReserva.BuscaReservaVencendo then
       begin
         if TelaCadastro = 9 then
         begin
         	 frmReservasVencidas.fechar := True;
           PostMessage(frmReservasVencidas.Handle, WM_CLOSE, 0, 0);
           Exit;
         end;
       end;
    end;
  finally
  	TelaCadastro := vDadosIni.vTipoForm;
    vDadosIni.vPesquisa := '';
    vDadosIni.vTipoForm := 0;
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmReservasVencidas.habilitarbotoes(phabilitar: boolean);
begin
 if PageControl1.ActivePage <> TabSheet4 then
   exit;

 BitBtn9.Enabled := phabilitar;
 BitBtn10.Enabled := phabilitar;
 BitBtn99.Enabled := phabilitar;
 BitBtn6.Enabled := phabilitar;
 DBGrid1.Enabled := phabilitar;
end;

initialization
  RegisterClass(TfrmReservasVencidas);
finalization
  UnRegisterClass(TfrmReservasVencidas);


end.
