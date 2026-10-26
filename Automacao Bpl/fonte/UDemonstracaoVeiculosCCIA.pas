unit UDemonstracaoVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, uClassesVeiculosCCIA,
  ComCtrls;

type
  TfrmDemonstracaoVeiculosCCIA = class(TfrmPadrao)
    Panel1: TPanel;
    Label30: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemonstracaoVeiculosCCIA: TfrmDemonstracaoVeiculosCCIA;
  Demonstracao: TDemonstracaoCCIA;
  vEmail : string;

implementation
uses  uDtmAtivo, UDtmVeiculosCCIA, uDataSet_OOP, DBClient, Clipbrd, Registry;

{$R *.dfm}

procedure TfrmDemonstracaoVeiculosCCIA.BitBtn4Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Demonstracao.EnvEmail(vEmail);
  finally
    Screen.Cursor := crDefault;
    Self.fechar := True;
    Close;
  end;
end;

procedure TfrmDemonstracaoVeiculosCCIA.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_TAB) or (key = VK_RETURN)) then
    if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
     BitBtn4.SetFocus;
 end;

procedure TfrmDemonstracaoVeiculosCCIA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
 if (Demonstracao <> nil) then
    Demonstracao.Cancel;

  Demonstracao.free;
  Demonstracao := nil;

  Action := caFree;
  if (frmDemonstracaoVeiculosCCIA<> nil) then
    frmDemonstracaoVeiculosCCIA := nil;
end;

procedure TfrmDemonstracaoVeiculosCCIA.FormCreate(Sender: TObject);
begin
  inherited;
  vEmail := '';
  if DtmVeiculosCCIA = nil then
    DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);

  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EMAIL' then
    vEmail := 'S';


  Demonstracao := TDemonstracaoCCIA.create;
  if not Demonstracao.abreDemonstracao then
    exit;
    
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EMAIL' then
   TForm(Sender).ShowModal;
end;


procedure TfrmDemonstracaoVeiculosCCIA.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   if ((Key = VK_TAB) or (key = VK_RETURN)) then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
     BitBtn4.SetFocus;
  end
  else if Key = VK_ESCAPE then
    BitBtn4Click(Sender);
end;

procedure TfrmDemonstracaoVeiculosCCIA.FormShow(Sender: TObject);
begin
  if not Self.Enabled then
  	Exit;

  inherited;

  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;

  vDadosIni.fechaStatusProcessamento;
end;

initialization
  RegisterClass(TfrmDemonstracaoVeiculosCCIA);
finalization
  UnRegisterClass(TfrmDemonstracaoVeiculosCCIA);

end.
