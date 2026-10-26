unit uTeclado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, Buttons, StdCtrls, ExtCtrls, DBCtrls, Mask,
  ComCtrls;

type
  TfrmTeclado = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTeclado: TfrmTeclado;

implementation

uses uCadastrosF, uTesteTeclas,uDtmConfigF, uConfiguracoes;

{$R *.dfm}

procedure TfrmTeclado.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if obTec.Post then
    obTec.Apply
  else
  begin
    DBEdit3.SetFocus;
    exit;
  end;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmTeclado.BitBtn2Click(Sender: TObject);
begin
  inherited;
  obTec.Cancel;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmTeclado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Application.OnMessage := nil;
  obTec.Free;
  obTec := nil;
  Action := cafree;
  frmTeclado := nil;
end;

procedure TfrmTeclado.FormShow(Sender: TObject);
begin
  inherited;
  if obTec = nil then
    obTec := TTeclado.create;
  obTec.getTodos;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  PageControl1.ActivePage := TabSheet2
end;

procedure TfrmTeclado.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  obTec.Delete;
end;

procedure TfrmTeclado.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obTec.Insert then
  begin
    PageControl1.ActivePage := TabSheet1;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmTeclado.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if obTec.edit then
  begin
    PageControl1.ActivePage := TabSheet1;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmTeclado.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmTesteTeclas, frmTesteTeclas);
  frmTesteTeclas.ShowModal;
end;

procedure TfrmTeclado.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

