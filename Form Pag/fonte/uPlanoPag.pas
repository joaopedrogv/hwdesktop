unit uPlanoPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, uEditMoeda, Buttons, DBCtrls, ExtCtrls,
  uClasseFP;

type
  TfrmPlanoPagamento = class(TfrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edControle: TDBLookupComboBox;
    grupoCalculo: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btGerar: TBitBtn;
    Memo1: TMemo;
    edValorVendaBruto: TEditMoeda;
    edValorDesconto: TEditMoeda;
    edValorVendaLiquido: TEditMoeda;
    edNumeroDeParcelas: TEditMoeda;
    edPrazoPrimeiraParcela: TEditMoeda;
    edIntervaloParcelas: TEditMoeda;
    edValorEntrada: TEditMoeda;
    edPrazoEntrada: TEditMoeda;
    Panel2: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    Label10: TLabel;
    edValorDaParcela: TEditMoeda;
    btVer: TBitBtn;
    rbVarejo: TRadioButton;
    rbAtacado: TRadioButton;
    labelTipoVnd: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btConfirmarClick(Sender: TObject);
    procedure edValorDescontoExit(Sender: TObject);
    procedure edPrazoEntradaExit(Sender: TObject);
    procedure edControleExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btVerClick(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanoPagamento: TfrmPlanoPagamento;
  obPlano: TPlanoPagamento;

implementation

uses uDtmFormPag;

{$R *.dfm}

procedure TfrmPlanoPagamento.btCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmPlanoPagamento.btConfirmarClick(Sender: TObject);
begin
  inherited;
  if obPlano.confirmarPlano then
    ModalResult := mrOk;
end;

procedure TfrmPlanoPagamento.btGerarClick(Sender: TObject);
begin
  inherited;
  btConfirmar.Enabled := obPlano.gerarPlano;
end;

procedure TfrmPlanoPagamento.btVerClick(Sender: TObject);
begin
  inherited;
  if not obPlano.gerarPlanoPeloValorDaParcela then
  begin
  	if (Self.Enabled) and (Self.Visible) and (edValorDaParcela.CanFocus) then
    	edValorDaParcela.SetFocus;
  end
  else
    btConfirmar.Enabled := True;
end;

procedure TfrmPlanoPagamento.edControleExit(Sender: TObject);
begin
  inherited;
  obPlano.habilitarControlePlanoPagamento;
end;

procedure TfrmPlanoPagamento.edPrazoEntradaExit(Sender: TObject);
begin
  inherited;
  obPlano.atribuirDadosDoFormularioParaAtributos;
  if not obPlano.verificaPrazo then
  	if (Self.Enabled) and (Self.Visible) and (edPrazoEntrada.CanFocus) then
    	edPrazoEntrada.SetFocus;
end;

procedure TfrmPlanoPagamento.edValorDescontoExit(Sender: TObject);
begin
  inherited;
  if not obPlano.atribuirDadosDoFormularioParaAtributos then
  begin
  	if (Self.Enabled) and (Self.Visible) and (edValorDesconto.CanFocus) then
    	edValorDesconto.SetFocus;
  end
  else
    obPlano.atribuirAtributosParaFormulario;
end;

procedure TfrmPlanoPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  obPlano.CancelUpdates;
  obPlano.RollBackTransacao;
end;

procedure TfrmPlanoPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  obPlano := TPlanoPagamento.create;
end;

procedure TfrmPlanoPagamento.FormShow(Sender: TObject);
begin
  inherited;
  obPlano.atribuirAtributosParaFormulario;
end;

end.

