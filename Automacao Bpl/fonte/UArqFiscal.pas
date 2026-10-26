unit UArqFiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, DBCtrls;

type
  TFrmArqUsados = class(TfrmPadrao)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmArqUsados: TFrmArqUsados;

implementation

uses UdtmTerminalF, UClassesFinalizadores;

{$R *.dfm}

procedure TFrmArqUsados.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Panel2.Enabled:=false;
  Panel3.Enabled:=true;
  cadTerminais.SoftFiscal.cadArquivosFiscal.Insert;
  if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
  	DBEdit3.SetFocus;
end;

procedure TFrmArqUsados.BitBtn2Click(Sender: TObject);
begin
  inherited;
 	cadTerminais.SoftFiscal.cadArquivosFiscal.Delete;
end;

procedure TFrmArqUsados.BitBtn3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmArqUsados.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if not cadTerminais.SoftFiscal.cadArquivosFiscal.Post then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
  	  DBEdit3.setfocus;
  end
  else
  begin
    Panel3.Enabled:=false;
    Panel2.Enabled:=true;
  end;
end;

procedure TFrmArqUsados.BitBtn5Click(Sender: TObject);
begin
  inherited;
  cadTerminais.SoftFiscal.cadArquivosFiscal.Cancel;
  Panel3.Enabled:=false;
  Panel2.Enabled:=true;
end;

procedure TFrmArqUsados.Button1Click(Sender: TObject);
begin
  inherited;
  Panel2.Enabled:=false;
  Panel3.Enabled:=true;
  cadTerminais.SoftFiscal.cadArquivosFiscal.Edit;
  if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
  	DBEdit3.SetFocus;
end;

procedure TFrmArqUsados.FormShow(Sender: TObject);
begin
  inherited;
  Panel3.Enabled:=false;
end;

end.
