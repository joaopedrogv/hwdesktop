unit uCIAP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, ComCtrls, jpeg, Buttons, uEditHw;

type
  TfrmCIAP = class(TfrmPadrao)
    pgCIAP: TPageControl;
    tsCIAP: TTabSheet;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Image2: TImage;
    Label2: TLabel;
    Image3: TImage;
    Label3: TLabel;
    Image4: TImage;
    Label4: TLabel;
    Panel2: TPanel;
    Image5: TImage;
    Label5: TLabel;
    Image6: TImage;
    Label6: TLabel;
    tsValores: TTabSheet;
    pnLancValores: TPanel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    Panel4: TPanel;
    EditHw3: TEditHw;
    EditHw4: TEditHw;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn9: TBitBtn;
    BitBtn8: TBitBtn;
    Memo1: TMemo;
    Image7: TImage;
    Label11: TLabel;
    procedure Image7Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCIAP: TfrmCIAP;

implementation

uses
  uClassesCIAP, UClassesEquipamentos;

{$R *.dfm}

procedure TfrmCIAP.BitBtn1Click(Sender: TObject);
var
  vCiap: TCIAP;
  vVL_TRIB_EXP, vVL_TOTAL: Currency;
begin
  inherited;
  vCiap := TCIAP.create;
  vCiap.pesquisaPeriodo(EditHw1.AsInteger, EditHw2.AsInteger, vVL_TRIB_EXP, vVL_TOTAL);
  EditHw3.AsValue := vVL_TRIB_EXP;
  EditHw4.AsValue := vVL_TOTAL;
end;

procedure TfrmCIAP.BitBtn8Click(Sender: TObject);
begin
  inherited;
  TForm(pnLancValores.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCIAP.BitBtn9Click(Sender: TObject);
var
  vCiap: TCIAP;
  vVL_TRIB_EXP, vVL_TOTAL: Currency;
begin
  inherited;
  vCiap := TCIAP.create;
  if vCiap.salvaValoresPeriodo(EditHw1.AsInteger, EditHw2.AsInteger, EditHw3.AsValue,
    EditHw4.AsValue) then
    TForm(pnLancValores.Parent).ModalResult := IDOK;
end;

procedure TfrmCIAP.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmCIAP.FormShow(Sender: TObject);
begin
  inherited;
  tsCIAP.TabVisible := False;
  tsValores.TabVisible := False;
  pgCIAP.ActivePage := tsCIAP;
end;

procedure TfrmCIAP.Image1Click(Sender: TObject);
var
  vPlContC: TPlanoContasContabil;
begin
  inherited;
  vPlContC.CadPlanoContasC(1);
end;

procedure TfrmCIAP.Image2Click(Sender: TObject);
var
  vCCusto: TCentroCustos;
begin
  inherited;
  vCCusto.CadCentroCustos(1);
end;

procedure TfrmCIAP.Image3Click(Sender: TObject);
var
  vMov: TMovimento_CIAP;
begin
  inherited;
  vMov.CadMovimentoCiap(1);
end;

procedure TfrmCIAP.Image4Click(Sender: TObject);
var
  vEq: TEquipamentos;
begin
  inherited;
  vEq.CadEquipamentos(2);
end;

procedure TfrmCIAP.Image5Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCIAP.Image6Click(Sender: TObject);
var
  vCiap:TCIAP;
begin
  inherited;
  vCiap:=TCIAP.create;
  vCiap.abreFormLancamentoValores;
end;

procedure TfrmCIAP.Image7Click(Sender: TObject);
var
  vContCF: TControleCreditosFiscais;
begin
  inherited;
  vContCF.ControleCreditosFiscais(1);
end;

end.

