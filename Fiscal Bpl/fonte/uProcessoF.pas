unit uProcessoF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls;

type
  TfrmProcesso = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcesso: TfrmProcesso;

implementation

uses uCadastrosF,uDtmConfigF, uConfiguracoes;

{$R *.dfm}

procedure TfrmProcesso.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if obProc.Post then
    obProc.Apply
  else
  begin
    DBEdit1.SetFocus;
    exit;
  end;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmProcesso.BitBtn2Click(Sender: TObject);
begin
  inherited;
  obProc.Cancel;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmProcesso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  obProc.Free;
  obProc :=nil;
  Action := cafree;
  frmProcesso := nil;
end;

procedure TfrmProcesso.FormShow(Sender: TObject);
begin
  inherited;
  if obProc = nil then
    obProc := TProcesso.create;
  obProc.getTodos;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  PageControl1.ActivePage := TabSheet2
end;

procedure TfrmProcesso.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obProc.Insert then
  begin
    PageControl1.ActivePage := TabSheet1;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmProcesso.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if obProc.Edit then
  begin
    PageControl1.ActivePage := TabSheet1;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmProcesso.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  obProc.Delete;
end;

procedure TfrmProcesso.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

