unit uNFCeDadosEmissao;

interface

uses
  Windows, uPadrao, StdCtrls, Buttons, Controls, Classes, ExtCtrls, Forms, 
  uClassesNFConsumidor;

type
  TfrmNFCeDadosEmissao = class(TfrmPadrao)
    pnEmissao: TPanel;
    Label49: TLabel;
    Panel48: TPanel;
    lbImpressao: TLabel;
    pnInfEmail: TPanel;
    edEmail: TEdit;
    pnCkEnviaEmail: TPanel;
    ckEnviarEmail: TCheckBox;
    pnTipoImp: TPanel;
    ckImpressaoResumida: TCheckBox;
    pnConsumidorSolicitaNaoImprimir: TPanel;
    ckConsumidorSolicitaNaoImprimir: TCheckBox;
    Panel49: TPanel;
    btVoltar: TBitBtn;
    pnImpressoraTipo: TPanel;
    ckImpressoraNaoFiscal: TCheckBox;
    ckImpressoraComum: TCheckBox;
    ckViaConsumidor: TCheckBox;
    ckViaEstabelecimento: TCheckBox;
    Panel2: TPanel;
    btEmitir: TBitBtn;
    btEnviarEmail: TBitBtn;
    btImprimir: TBitBtn;
    ckCancelamento: TCheckBox;
    ckFormatoA4: TCheckBox;
    ck_AnexarPDF: TCheckBox;
    lb_notas_selecionadas: TLabel;
    procedure ckViaEstabelecimentoClick(Sender: TObject);
    procedure ckViaConsumidorClick(Sender: TObject);
    procedure ckFormatoA4Click(Sender: TObject);
    procedure ckImpressaoResumidaClick(Sender: TObject);
    procedure ckCancelamentoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckConsumidorSolicitaNaoImprimirClick(Sender: TObject);
    procedure ckImpressoraComumClick(Sender: TObject);
    procedure ckImpressoraNaoFiscalClick(Sender: TObject);
    procedure btEmitirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FNFCe: TNFCe;
    { Private declarations }
  public
    { Public declarations }
    property ANFCe: TNFCe read FNFCe write FNFCe;
  end;

var
  frmNFCeDadosEmissao: TfrmNFCeDadosEmissao;

implementation

uses uNFCeConfig, StrUtils, SysUtils;

{$R *.dfm}

procedure TfrmNFCeDadosEmissao.btEmitirClick(Sender: TObject);
begin
  inherited;  
  ANFCe.Processamento.email                           := edEmail.Text;
  ANFCe.Processamento.EnviarEmail                     := ckEnviarEmail.Checked;
  ANFCe.Processamento.ImpressaoResumida               := ckImpressaoResumida.Checked;
  ANFCe.Processamento.ImpressoraNaoFiscal             := ckImpressoraNaoFiscal.Checked;
  ANFCe.Processamento.ConsumidorSolicitaNaoImprimir   := ckConsumidorSolicitaNaoImprimir.Checked;
  ANFCe.Processamento.ViaConsumidor                   := ckViaConsumidor.Checked;
  ANFCe.Processamento.ViaEstabelecimento              := ckViaEstabelecimento.Checked;
  ANFCe.Processamento.ViaCancelamento                 := ckCancelamento.Checked;
  ANFCe.Processamento.FormatoA4                       := ckFormatoA4.Checked;
  ANFCe.Processamento.AnexarPDF                       := ck_AnexarPDF.Checked;
end;

procedure TfrmNFCeDadosEmissao.ckCancelamentoClick(Sender: TObject);
begin
  inherited;
//  if ckCancelamento.Checked then
//  begin
//    try
//      ckImpressaoResumida.OnClick  := nil;
//      ckViaConsumidor.OnClick      := nil;
//      ckViaEstabelecimento.OnClick := nil;
//
//      ckImpressaoResumida.Checked  := False;
//      ckViaConsumidor.Checked      := False;
//      ckViaEstabelecimento.Checked := False;
//
//    finally
//      ckImpressaoResumida.OnClick  := ckImpressaoResumidaClick;
//      ckViaConsumidor.OnClick      := ckImpressaoResumidaClick;
//      ckViaEstabelecimento.OnClick := ckImpressaoResumidaClick;
//    end;
//  end;
end;

procedure TfrmNFCeDadosEmissao.ckConsumidorSolicitaNaoImprimirClick(
  Sender: TObject);
begin
  inherited;
  if ckConsumidorSolicitaNaoImprimir.Checked then
  begin
    try
      ckImpressoraNaoFiscal.OnClick := nil;
      ckImpressoraComum.OnClick     := nil;
      ckFormatoA4.OnClick           := nil;

      ckImpressoraNaoFiscal.Checked := False;
      ckImpressoraComum.Checked     := False;
      ckFormatoA4.Checked           := False;
      ckViaConsumidor.Checked       := False;
      ckViaEstabelecimento.Checked  := False;
    finally
      ckImpressoraNaoFiscal.OnClick := ckImpressoraNaoFiscalClick;
      ckImpressoraComum.OnClick     := ckImpressoraComumClick;
      ckFormatoA4.OnClick           := ckFormatoA4Click;
    end;
  end
  else
  begin
    ckImpressoraNaoFiscal.Checked := ANFCe.Processamento.ImpressoraNaoFiscal;
    ckImpressoraComum.Checked     := not ckImpressoraNaoFiscal.Checked;
    ckViaConsumidor.Checked       := ANFCe.Processamento.ViaConsumidor;
    ckViaEstabelecimento.Checked  := ANFCe.Processamento.ViaEstabelecimento;
  end;
end;

procedure TfrmNFCeDadosEmissao.ckFormatoA4Click(Sender: TObject);
begin
  inherited;
  if (ckFormatoA4.Checked) and (ckImpressoraNaoFiscal.Checked) then
    ckImpressoraNaoFiscal.Checked := False;
end;

procedure TfrmNFCeDadosEmissao.ckImpressaoResumidaClick(Sender: TObject);
begin
  inherited;
//  if (ckImpressaoResumida.Checked) or (ckViaConsumidor.Checked) or (ckViaEstabelecimento.Checked) then
//    ckCancelamento.Checked := False;
end;

procedure TfrmNFCeDadosEmissao.ckImpressoraComumClick(Sender: TObject);
begin
  inherited;
//  if not ckConsumidorSolicitaNaoImprimir.Checked then
//    ckImpressoraNaoFiscal.Checked := not ckImpressoraComum.Checked;
  if not pnImpressoraTipo.Visible then
    Exit;

  ckImpressoraNaoFiscal.Checked := not ckImpressoraComum.Checked;
  if (ckImpressoraComum.Checked) and (ckConsumidorSolicitaNaoImprimir.Checked) then
    ckConsumidorSolicitaNaoImprimir.Checked := False;
end;

procedure TfrmNFCeDadosEmissao.ckImpressoraNaoFiscalClick(Sender: TObject);
begin
  inherited;
//  if not ckConsumidorSolicitaNaoImprimir.Checked then
//    ckImpressoraComum.Checked := not ckImpressoraNaoFiscal.Checked;
  if not pnImpressoraTipo.Visible then
    Exit;

  ckImpressoraComum.Checked := not ckImpressoraNaoFiscal.Checked;
  if (ckImpressoraNaoFiscal.Checked) and (ckFormatoA4.Checked) then
    ckFormatoA4.Checked := False;
  if (ckImpressoraNaoFiscal.Checked) and (ckConsumidorSolicitaNaoImprimir.Checked) then
    ckConsumidorSolicitaNaoImprimir.Checked := False;
end;

procedure TfrmNFCeDadosEmissao.ckViaConsumidorClick(Sender: TObject);
begin
  inherited;
  ckViaEstabelecimento.Checked := not ckViaConsumidor.Checked;
end;

procedure TfrmNFCeDadosEmissao.ckViaEstabelecimentoClick(Sender: TObject);
begin
  inherited;
  ckViaConsumidor.Checked := not ckViaEstabelecimento.Checked;
end;

procedure TfrmNFCeDadosEmissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmNFCeConfig := nil;
end;

procedure TfrmNFCeDadosEmissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    btVoltar.Click
  else if Key = VK_F7 then
    ckEnviarEmail.Checked := not ckEnviarEmail.Checked
  else if Key = VK_F8 then
    ckConsumidorSolicitaNaoImprimir.Checked := not ckConsumidorSolicitaNaoImprimir.Checked
  else if Key = VK_F9 then
    if btEmitir.Visible then
      btEmitir.Click
    else if btImprimir.Visible then
      btImprimir.Click
    else if btEnviarEmail.Visible then
      btEnviarEmail.Click;
end;

procedure TfrmNFCeDadosEmissao.FormShow(Sender: TObject);
begin
  inherited;
  with ANFCe.Processamento do
  begin
    edEmail.Text                            := email;
    ckEnviarEmail.Checked                   := EnviarEmail;
    ckImpressaoResumida.Checked             := ImpressaoResumida;
    ckImpressoraNaoFiscal.Checked           := ImpressoraNaoFiscal;
    ckImpressoraComum.Checked               := not ckImpressoraNaoFiscal.Checked;
    ckViaConsumidor.Checked                 := ViaConsumidor;
    ckViaEstabelecimento.Checked            := ViaEstabelecimento;
    ckCancelamento.Checked                  := ViaCancelamento;
    ckFormatoA4.Checked                     := FormatoA4;
    ck_AnexarPDF.Visible                    := (CountSelecao > 0) and (Acao = 'Email');
    ck_AnexarPDF.Checked                    := AnexarPDF or (CountSelecao > 0);
    lb_notas_selecionadas.Caption           := Format('%d nota%s selecionada%s', [CountSelecao, IfThen(CountSelecao > 1, 's'), IfThen(CountSelecao > 1, 's')]);
    lb_notas_selecionadas.Visible           := ck_AnexarPDF.Visible;
  end;

  if ANFCe.Processamento.Acao = 'Autorizar' then
  begin
    btEmitir.Visible         := True;
    btImprimir.Visible       := False;
    btEnviarEmail.Visible    := False;
    lbImpressao.Visible      := False;
    pnTipoImp.Visible        := False;
    pnImpressoraTipo.Visible := False;
    ckConsumidorSolicitaNaoImprimir.Checked := ANFCe.ConfigNFCe.Padrao.ConsumidorSolicitaNaoImprimir;
  end
  else if ANFCe.Processamento.Acao = 'Imprimir' then
  begin
    btEmitir.Visible                        := False;
    btImprimir.Visible                      := True;
    btEnviarEmail.Visible                   := False;
    pnInfEmail.Visible                      := False;
    edEmail.Visible                         := False;
    pnCkEnviaEmail.Visible                  := False;
    pnConsumidorSolicitaNaoImprimir.Visible := False;
  end
  else if ANFCe.Processamento.Acao = 'Email' then
  begin
    btEmitir.Visible                        := False;
    btImprimir.Visible                      := False;
    btEnviarEmail.Visible                   := True;
    lbImpressao.Visible                     := False;
    pnTipoImp.Visible                       := False;
    pnImpressoraTipo.Visible                := False;
    ckConsumidorSolicitaNaoImprimir.Visible := False;
    ckEnviarEmail.Checked                   := True;
    pnConsumidorSolicitaNaoImprimir.Visible := False;
  end;
end;

end.
