unit UCustosGestor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, CheckLst, Buttons, ExtCtrls,uclassesgestor;

type
  TFrmCustos = class(TfrmPadrao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    SpeedButton11: TSpeedButton;
    cklbEmpresas: TCheckListBox;
    ckMarcar: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCustos: TFrmCustos;
  cadempresaCus: TEmpresas;

implementation

uses UFopag, Udepreciacao, UEnsaiosDescontos, uDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TFrmCustos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 action:=cafree;
 FrmCustos:=nil;
end;

procedure TFrmCustos.FormShow(Sender: TObject);
begin
  inherited;
  cadempresaCus:=TEmpresas.create;
  cadempresaCus.abreEmpresas;
  cadempresaCus.preenchChecklist(cklbEmpresas);
end;

procedure TFrmCustos.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TFrmCustos.SpeedButton1Click(Sender: TObject);
var
  gestor: TGestorFormularios;
  vcodemp: string;
begin
  inherited;
 gestor := TGestorFormularios.Create;
 if not vDadosIni.PesqPros('GES044','ACESSAR','FOPAG','','',gestor.cQuery,True) then
  Exit;
 gestor.Free;
 if not cadempresaCus.VerificaEmpresas(cklbEmpresas) then
  exit;
 if length(cadempresaCus.vCodEmpresas) > 1 then
 begin
  Application.MessageBox('Fopag só pode ser apurado por empresa, selecione uma empresa específica!', 'Confirmação', MB_OK);
  exit;
 end;
 Application.CreateForm(TFrmFopag,FrmFopag);
 FrmFopag.vcadempresa:=cadempresaCus.vempresas;
 vcodemp:=vDadosIni.codEmpresa;
 vdadosini.codEmpresa:=cadempresaCus.vempresas;
 FrmFopag.Caption:=FrmFopag.Caption+' - '+cadempresaCus.vnomeemps;
 FrmFopag.ShowModal;
 FrmFopag.Free;
 vDadosIni.codEmpresa:=vcodemp;
end;

procedure TFrmCustos.SpeedButton3Click(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
  inherited;
 gestor := TGestorFormularios.Create;
 if not vDadosIni.PesqPros('GES046','ACESSAR','ENSAIOS DIVERSOS','','',gestor.cQuery,True) then
  Exit;
 gestor.Free;
 if not cadempresaCus.VerificaEmpresas(cklbEmpresas) then
  exit;
 if length(cadempresaCus.vCodEmpresas) > 1 then
 begin
  Application.MessageBox('Ensaios só podem ser apurados por empresa, selecione uma empresa específica!', 'Confirmação', MB_OK);
  exit;
 end;
 Application.CreateForm(TFrmEnsaiosDescontos,FrmEnsaiosDescontos);
 cadensaios.vempresas:=cadempresaCus.vempresas;
 FrmEnsaiosDescontos.Caption:=FrmEnsaiosDescontos.Caption+' - '+cadempresaCus.vnomeemps;
// vdadosini.codEmpresa:=cadempresaCus.vempresas;
// FrmEnsaiosDescontos.ShowModal;
// FrmEnsaiosDescontos.Free;
end;

procedure TFrmCustos.SpeedButton4Click(Sender: TObject);
var
  gestor: TGestorFormularios;
begin
  inherited;
 gestor := TGestorFormularios.Create;
 if not vDadosIni.PesqPros('GES045','ACESSAR','DEPRECIAÇÕES','','',gestor.cQuery,True) then
  Exit;
 gestor.Free;
 if not cadempresaCus.VerificaEmpresas(cklbEmpresas) then
  exit;
 if length(cadempresaCus.vCodEmpresas) > 1 then
 begin
  Application.MessageBox('Fopag só pode ser apurado por empresa, selecione uma empresa específica!', 'Confirmação', MB_OK);
  exit;
 end;
 Application.CreateForm(TFrmDepreciacao,FrmDepreciacao);
 FrmDepreciacao.vcadempresa:=cadempresaCus.vempresas;
 vdadosini.codEmpresa:=cadempresaCus.vempresas;
 FrmDepreciacao.Caption:=FrmDepreciacao.Caption+' - '+cadempresaCus.vnomeemps;
 FrmDepreciacao.ShowModal;
 FrmDepreciacao.Free;
end;

end.
