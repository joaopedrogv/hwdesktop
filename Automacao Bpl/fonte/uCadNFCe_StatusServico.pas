unit uCadNFCe_StatusServico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, Grids, DBGrids, StdCtrls, uClassesNFConsumidor,
  ImgList, Buttons;

type
  TMovePageDirection = (mpFirst, mpNext, mpPrevius);

  TfrmCadNFCe_StatusServico = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    ck_autr: TCheckBox;
    ck_canc: TCheckBox;
    ck_cons: TCheckBox;
    ck_inut: TCheckBox;
    ck_stats: TCheckBox;
    DBGrid1: TDBGrid;
    TimerReOpen: TTimer;
    TimerRefresh: TTimer;
    bt_prev: TSpeedButton;
    bt_next: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bt_prevClick(Sender: TObject);
    procedure bt_nextClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ck_autrClick(Sender: TObject);
    procedure TimerReOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    StatServ: TNFCe_Status_Servico;
    function GetServicos: TStatusServs;
    procedure MovePage(Direction: TMovePageDirection);
  public
    { Public declarations }
  end;

var
  frmCadNFCe_StatusServico: TfrmCadNFCe_StatusServico;

implementation

uses uDataSet_OOP;

{$R *.dfm}

procedure TfrmCadNFCe_StatusServico.ck_autrClick(Sender: TObject);
begin
  inherited;
  TimerReOpen.Enabled := False;
  TimerReOpen.Enabled := True;
end;

procedure TfrmCadNFCe_StatusServico.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Agrid: TDBGrid;
begin
  inherited;
  Agrid := TDBGrid(Sender);

  if Agrid.DataSource.DataSet.FieldByName('STATUS').AsString = '1' then
  begin
    Agrid.Canvas.Brush.Color := $00E9E9E9;
    Agrid.Canvas.Font.Color  := $00004000;
  end
  else
  begin
    Agrid.Canvas.Brush.Color := clCream;
    Agrid.Canvas.Font.Color  := clRed;
  end;
  Agrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmCadNFCe_StatusServico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(StatServ);

  Action := caFree;
  frmCadNFCe_StatusServico := nil;
end;

procedure TfrmCadNFCe_StatusServico.FormCreate(Sender: TObject);
begin
  inherited;
  StatServ := TNFCe_Status_Servico.Create;
end;

procedure TfrmCadNFCe_StatusServico.FormShow(Sender: TObject);
begin
  inherited;
  DBGrid1.DataSource := StatServ._dataSourceOOP;
  MovePage(mpFirst);
end;

function TfrmCadNFCe_StatusServico.GetServicos: TStatusServs;
begin
  Result := [];

  if ck_autr.Checked then
    Result := Result + [tsAutorizacao];

  if ck_canc.Checked then
    Result := Result + [tsCancelamento];

  if ck_cons.Checked then
    Result := Result + [tsConsulta];

  if ck_inut.Checked then
    Result := Result + [tsInutilizacao];

  if ck_stats.Checked then
    Result := Result + [tsInutilizacao];
end;

procedure TfrmCadNFCe_StatusServico.MovePage(Direction: TMovePageDirection);
var
  Page: Integer;
begin
  TimerReOpen.Enabled  := False;
  TimerRefresh.Enabled := False;

  case Direction of
    mpNext   : Page := StatServ.Page + 1;
    mpPrevius: Page := StatServ.Page - 1;
    else       Page := 0;
  end;

  StatServ.AbreRegistros(GetServicos, Page);

  bt_prev.Enabled      := StatServ.Page > 0;
  TimerRefresh.Enabled := True;
end;

procedure TfrmCadNFCe_StatusServico.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  MovePage(mpFirst);
end;

procedure TfrmCadNFCe_StatusServico.bt_prevClick(Sender: TObject);
begin
  inherited;
  MovePage(mpPrevius);
end;

procedure TfrmCadNFCe_StatusServico.bt_nextClick(Sender: TObject);
begin
  inherited;
  MovePage(mpNext);
end;

procedure TfrmCadNFCe_StatusServico.TimerReOpenTimer(Sender: TObject);
begin
  inherited;
  StatServ.dataSet.Refresh;
end;

end.
