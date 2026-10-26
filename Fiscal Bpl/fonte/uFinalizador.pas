unit uFinalizador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, ComCtrls, Grids,
  DBGrids;

type
  TfrmFinalizador = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit3: TDBEdit;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBGrid1: TDBGrid;
    DBCheckBox3: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinalizador: TfrmFinalizador;

implementation

uses uDtmConfigF, uCadastrosF, uConfiguracoes;

{$R *.dfm}

procedure TfrmFinalizador.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if obFinal.Post then
  else
  begin
    DBEdit1.SetFocus;
    exit;
  end;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmFinalizador.BitBtn2Click(Sender: TObject);
begin
  inherited;
  obFinal.Cancel;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmFinalizador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  obFinal.Free;
  obFinal := nil;
  Action := cafree;
  frmFinalizador := nil;
end;

procedure TfrmFinalizador.FormShow(Sender: TObject);
begin
  inherited;
  if obFinal = nil then
    obFinal := TFinalizador.create;
  obFinal.getTodosFiscal;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  PageControl1.ActivePage := TabSheet2
end;

procedure TfrmFinalizador.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if obFinal.Insert then
  begin
    PageControl1.ActivePage := TabSheet1;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmFinalizador.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if obFinal.edit then
  begin
    PageControl1.ActivePage := TabSheet1;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmFinalizador.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  obFinal.Delete;
end;

procedure TfrmFinalizador.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  close;
end;

end.

