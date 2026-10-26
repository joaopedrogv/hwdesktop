unit uEmpresa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TfrmEmpresa = class(TfrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

uses uDtmFiscalHwF, uPrincipalF, uHwF, uDadosIniFiscal;

{$R *.dfm}

procedure TfrmEmpresa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmEmpresa := nil;
  obEmpresa.Free;
  obEmpresa := nil;
end;

procedure TfrmEmpresa.FormShow(Sender: TObject);
begin
  inherited;
  if obEmpresa = nil then
    obEmpresa := TEmpresaF.create;
  obEmpresa.selecionaEmpresa(vDadosIniF.codEmpresa);
end;

end.

