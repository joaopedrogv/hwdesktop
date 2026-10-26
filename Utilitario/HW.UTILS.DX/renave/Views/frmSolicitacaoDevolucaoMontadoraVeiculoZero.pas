unit frmSolicitacaoDevolucaoMontadoraVeiculoZero;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  SolicitacaoDevolucaoMontadoraZeroKmModel, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TformSolicitacaoDevolucaoMontadoraVeiculoZero = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    motivoDev: TRadioGroup;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    Fsolicitacao: TSolicitacaoDevolucaoMontadoraZeroKmModel;
    { Private declarations }
  public
    property solicitacao: TSolicitacaoDevolucaoMontadoraZeroKmModel read Fsolicitacao write Fsolicitacao;
  end;

var
  formSolicitacaoDevolucaoMontadoraVeiculoZero: TformSolicitacaoDevolucaoMontadoraVeiculoZero;

implementation

{$R *.dfm}

uses hw_utils;

procedure TformSolicitacaoDevolucaoMontadoraVeiculoZero.BitBtn2Click(
  Sender: TObject);
var
  data: TDateTime;
begin
  if motivoDev.ItemIndex = -1 then
    Exit;

  if not TryStrToDateTime(MaskEdit1.Text, data) then
  begin
    ShowErro('Data de cancelamento inválida');
    Exit;
  end;

  solicitacao.dataDevolucao := data;
  solicitacao.motivoDevolucaoMontadora := motivoDev.Items[motivoDev.ItemIndex];
  ModalResult := IDOK;
end;

procedure TformSolicitacaoDevolucaoMontadoraVeiculoZero.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  formSolicitacaoDevolucaoMontadoraVeiculoZero := nil;
end;

procedure TformSolicitacaoDevolucaoMontadoraVeiculoZero.FormShow(
  Sender: TObject);
begin
  MaskEdit1.Text := FormatDateTime('dd/MM/yyyy hh:mm:ss', solicitacao.dataDevolucao);
end;

end.
