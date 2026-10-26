 unit uCadNFCe_MovOperador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, uEditHw, ExtCtrls, Grids, DBGrids,
  ComCtrls;

type
  TMovePageDirection = (mpFirst, mpNext, mpPrevius);

  TfrmCadNFCe_MovOperador = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    GridPanel14: TGridPanel;
    lb_pn_v2_movimento_operador_title: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Panel112: TPanel;
    Label152: TLabel;
    Label154: TLabel;
    Panel110: TPanel;
    ed_v2_movimento_operador_sang: TEditHw;
    Panel113: TPanel;
    ed_v2_movimento_operador_sup: TEditHw;
    Panel114: TPanel;
    ed_v2_movimento_operador_nfce_din: TEditHw;
    Panel115: TPanel;
    ed_v2_movimento_operador_nfce_out: TEditHw;
    Panel121: TPanel;
    ed_v2_movimento_operador_dia: TMaskEdit;
    Panel109: TPanel;
    ed_v2_movimento_operador_liq_geral: TEditHw;
    Panel117: TPanel;
    ed_v2_movimento_operador_liq_din: TEditHw;
    bt_v2_movimento_operado_dia_ant: TBitBtn;
    bt_v2_movimento_operador_fecharrDia: TBitBtn;
    bt_v2_movimento_operador_voltar: TBitBtn;
    bt_rel_grafico: TBitBtn;
    bt_rel_naofiscal: TBitBtn;
    bt_maisdetalhes: TBitBtn;
    BitBtn4: TBitBtn;
    Panel4: TPanel;
    Label1: TLabel;
    ed_operador: TEditHw;
    Label2: TLabel;
    ed_caixa: TEditHw;
    bt_prev: TSpeedButton;
    bt_next: TSpeedButton;
    SpeedButton1: TSpeedButton;
    bt_v2_movimento_operado_dia_post: TBitBtn;
    bt_abrir_dias: TBitBtn;
    TabSheet3: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    ed_sangria: TEditHw;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    ed_suprimento: TEditHw;
    bt_v2_movimento_operador_sangsup: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_v2_movimento_operador_sangsupClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bt_abrir_diasClick(Sender: TObject);
    procedure bt_v2_movimento_operado_dia_postClick(Sender: TObject);
    procedure bt_v2_movimento_operado_dia_antClick(Sender: TObject);
    procedure bt_v2_movimento_operador_fecharrDiaClick(Sender: TObject);
    procedure bt_v2_movimento_operador_voltarClick(Sender: TObject);
    procedure bt_maisdetalhesClick(Sender: TObject);
    procedure bt_rel_naofiscalClick(Sender: TObject);
    procedure bt_rel_graficoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bt_nextClick(Sender: TObject);
    procedure bt_prevClick(Sender: TObject);
    procedure ed_caixaEnter(Sender: TObject);
    procedure ed_caixaExit(Sender: TObject);
    procedure ed_operadorExit(Sender: TObject);
    procedure ed_operadorEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Foperador, Fcaixa: Integer;
    { Private declarations }
    procedure MovePage(Direction: TMovePageDirection);
  public
    { Public declarations }
  end;

var
  frmCadNFCe_MovOperador: TfrmCadNFCe_MovOperador;

implementation

uses
  uClassesNFConsumidor,
  hw_utils,
  uDtmAtivo,
  uDadosIni,
  StrUtils, uDataSet_OOP, DB;

{$R *.dfm}

procedure TfrmCadNFCe_MovOperador.bt_rel_graficoClick(Sender: TObject);
begin
  inherited;
  if MovOperador.dataSet.IsEmpty then
    ShowErro('Sem dia para apresentar')
  else
    MovOperador.RelatorioDoDia_PrintQuickRep;
end;

procedure TfrmCadNFCe_MovOperador.bt_rel_naofiscalClick(Sender: TObject);
begin
  inherited;
  if MovOperador.dataSet.IsEmpty then
    ShowErro('Sem dia para apresentar')
  else
    MovOperador.RelatorioDoDia_PrintNaoFiscal;
end;

procedure TfrmCadNFCe_MovOperador.bt_v2_movimento_operado_dia_postClick(Sender: TObject);
begin
  inherited;
  MovOperador.dataSet.Next;
  bt_maisdetalhes.Click;
  bt_v2_movimento_operado_dia_ant.Enabled     := not MovOperador.dataSet.Bof;
  bt_v2_movimento_operado_dia_post.Enabled    := not MovOperador.dataSet.Eof;
end;

procedure TfrmCadNFCe_MovOperador.BitBtn1Click(Sender: TObject);
var
  Msg: string;
begin
  inherited;

  if not SangSup.Inserir(ed_suprimento.AsValue, ssSuprimento, Msg) then
  begin
    ShowErro(Msg);
    if (Self.Enabled) and (Self.Visible) and (ed_suprimento.CanFocus) then
      ed_suprimento.SetFocus;
  end
  else
    bt_maisdetalhes.Click;
end;

procedure TfrmCadNFCe_MovOperador.BitBtn3Click(Sender: TObject);
var
  Msg: string;
begin
  inherited;

  if not SangSup.Inserir(ed_sangria.AsValue, ssSangria, Msg) then
  begin
    ShowErro(Msg);
    if (Self.Enabled) and (Self.Visible) and (ed_sangria.CanFocus) then
      ed_sangria.SetFocus;
  end
  else
    bt_maisdetalhes.Click;
end;

procedure TfrmCadNFCe_MovOperador.bt_abrir_diasClick(Sender: TObject);
begin
  inherited;
  
  if not NFCe.ConfigNFCe.MovimentoOperador.Ativo then
  begin
    ShowAtencao('Movimento de Operador não configurado');
    Exit;
  end;

  try
    if not MovOperador.AbrirDia then
      ShowErro(MovOperador.LastMessage)
    else
      ShowAtencao('Dia Aberto com Sucesso!');
  finally
    SpeedButton1.Click;
  end;
end;

procedure TfrmCadNFCe_MovOperador.bt_maisdetalhesClick(Sender: TObject);
begin
  inherited;
  if MovOperador.dataSet.IsEmpty then
  begin
    ShowErro('Sem dia para apresentar');
    Exit;
  end;

  ed_v2_movimento_operador_dia.Clear;

  if MovOperador.dataSet.IsEmpty then
  begin
    lb_pn_v2_movimento_operador_title.Tag     := 0;
    lb_pn_v2_movimento_operador_title.Caption := '[Movimento do Operador - Sem movimento]';
  end
  else
  begin
    lb_pn_v2_movimento_operador_title.Tag     := MovOperador.fint('id');
    lb_pn_v2_movimento_operador_title.Caption := Format('[ID: %s Movimento do Operador %s - Dia %s]',
                                                        [PadL(MovOperador.fint('id'), 3), PadL(MovOperador.fint('operador'), 3),
                                                         IfThen(MovOperador.fnull('dia_fech'), 'Aberto', 'Fechado')]);
  end;

  if not MovOperador.dataSet.IsEmpty then
    ed_v2_movimento_operador_dia.Text := FormatDateTime('    dd/MM/yyyy', MovOperador.fdate('dia_mov'));

  with MovOperador.TotaisDoDia do
  begin
    ed_v2_movimento_operador_sang.AsValue      := Sangria;
    ed_v2_movimento_operador_sup.AsValue       := Suprimento;
    ed_v2_movimento_operador_nfce_din.AsValue  := NFCe_Dinheiro;
    ed_v2_movimento_operador_nfce_out.AsValue  := NFCe_Outros;
    ed_v2_movimento_operador_liq_din.AsValue   := NFCe_Dinheiro + Suprimento - Sangria;
    ed_v2_movimento_operador_liq_geral.AsValue := NFCe_Dinheiro + NFCe_Outros + Suprimento - Sangria;
  end;

//  bt_v2_movimento_operador_abrirDia.Caption := IfThen(MovOperador.DiaEstaAberto, 'Fechar dia de Movimento', 'Abrir dia de Movimento');
//  bt_v2_movimento_operador_abrirDia.Caption := 'Fechar dia de Movimento';
  bt_v2_movimento_operador_fecharrDia.Enabled := MovOperador.fnull('dia_fech');
  bt_v2_movimento_operador_sangsup.Enabled    := bt_v2_movimento_operador_fecharrDia.Enabled;
//  bt_v2_movimento_operado_dia_ant.Enabled     := not MovOperador.dataSet.Bof;
//  bt_v2_movimento_operado_dia_post.Enabled    := not MovOperador.dataSet.Eof;

  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadNFCe_MovOperador.bt_nextClick(Sender: TObject);
begin
  inherited;
  if (vDadosIni.vNFConsumidor.CodEmissor = 0) and (not ed_operador.Enabled) then
    ShowErro('Caixa(Emissor) não configurado')
  else
    MovePage(mpNext);
end;

procedure TfrmCadNFCe_MovOperador.bt_prevClick(Sender: TObject);
begin
  inherited;
  if (vDadosIni.vNFConsumidor.CodEmissor = 0) and (not ed_operador.Enabled) then
    ShowErro('Caixa(Emissor) não configurado')
  else
    MovePage(mpPrevius);
end;

procedure TfrmCadNFCe_MovOperador.bt_v2_movimento_operador_fecharrDiaClick(
  Sender: TObject);
begin
  inherited;
  
  if not NFCe.ConfigNFCe.MovimentoOperador.Ativo then
  begin
    ShowAtencao('Movimento de Operador não configurado');
    Exit;
  end;
  
  try
    if UpperCase(bt_v2_movimento_operador_fecharrDia.Caption) = 'ABRIR DIA DE MOVIMENTO' then
    begin
      if not MovOperador.AbrirDia then
        ShowErro(MovOperador.LastMessage)
      else
        ShowAtencao('Dia aberto com sucesso !!!');
    end
    else
    begin
      if not MovOperador.FecharDia(lb_pn_v2_movimento_operador_title.Tag, False) then
        ShowErro(MovOperador.LastMessage)
      else
        ShowAtencao('Dia fechado com sucesso !!!');
    end;
  finally
    bt_maisdetalhes.Click;
  end;
end;

procedure TfrmCadNFCe_MovOperador.bt_v2_movimento_operador_sangsupClick(
  Sender: TObject);
begin
  inherited;
  ed_sangria.Clear;
  ed_suprimento.Clear;
  PageControl1.ActivePage := TabSheet3;
end;

procedure TfrmCadNFCe_MovOperador.bt_v2_movimento_operado_dia_antClick(
  Sender: TObject);
begin
  inherited;
  MovOperador.dataSet.Prior;
  bt_maisdetalhes.Click;
  bt_v2_movimento_operado_dia_ant.Enabled     := not MovOperador.dataSet.Bof;
  bt_v2_movimento_operado_dia_post.Enabled    := not MovOperador.dataSet.Eof;
end;

procedure TfrmCadNFCe_MovOperador.bt_v2_movimento_operador_voltarClick(
  Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet1;
end;

procedure TfrmCadNFCe_MovOperador.ed_caixaEnter(Sender: TObject);
begin
  inherited;
  Fcaixa := ed_caixa.AsInteger;
end;

procedure TfrmCadNFCe_MovOperador.ed_caixaExit(Sender: TObject);
begin
  inherited;
  if Fcaixa <> ed_caixa.AsInteger then
  begin
    MovePage(mpFirst);
    Fcaixa := ed_caixa.AsInteger;
  end;
end;

procedure TfrmCadNFCe_MovOperador.ed_operadorEnter(Sender: TObject);
begin
  inherited;
  Foperador := ed_operador.AsInteger;
end;

procedure TfrmCadNFCe_MovOperador.ed_operadorExit(Sender: TObject);
begin
  inherited;
  if Foperador <> ed_operador.AsInteger then
  begin
    MovePage(mpFirst);
    Foperador := ed_operador.AsInteger;
  end;
end;

procedure TfrmCadNFCe_MovOperador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadNFCe_MovOperador := nil;
end;

procedure TfrmCadNFCe_MovOperador.FormShow(Sender: TObject);
begin
  inherited;
  TabSheet1.TabVisible    := False;
  TabSheet2.TabVisible    := False;
  TabSheet3.TabVisible    := False;
  ed_caixa.AsValue        := vDadosIni.vNFConsumidor.CodEmissor;
  ed_operador.AsValue     := vDadosIni.vCodUsuario;
  DBGrid1.DataSource      := MovOperador._dataSourceOOP;
  PageControl1.ActivePage := TabSheet1;
  ed_operador.Enabled     := vDadosIni.PesqPros('NFC035', 'HABILITAR', '', '', '', MovOperador.buscas, False, False, True);
  ed_caixa.Enabled        := ed_operador.Enabled;
  if (vDadosIni.vNFConsumidor.CodEmissor = 0) and (not ed_operador.Enabled) then
  begin
    ShowErro('Caixa(Emissor) não configurado');
    ed_caixa.AsValue := -1;
    ed_operador.AsValue := -1;
  end;
  MovePage(mpFirst);
end;

procedure TfrmCadNFCe_MovOperador.MovePage(Direction: TMovePageDirection);
var
  Page: Integer;
begin
  case Direction of
    mpNext   : Page := MovOperador.Page + 1;
    mpPrevius: Page := MovOperador.Page - 1;
    else       Page := 0;
  end;

  MovOperador.GetDiaDoEmissor(ed_operador.AsInteger, ed_caixa.AsInteger, Page);

  bt_prev.Enabled      := MovOperador.Page > 0;
end;

procedure TfrmCadNFCe_MovOperador.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if (vDadosIni.vNFConsumidor.CodEmissor = 0) and (not ed_operador.Enabled) then
    ShowErro('Caixa(Emissor) não configurado')
  else
    MovePage(mpFirst);
end;

end.
