unit uGerarPlanoV2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Menus, ExtCtrls, Mask, uEditHw, uClasseFP;

type
  TfrmPlanoPagamentoV2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ListBox1: TListBox;
    Edit1: TEdit;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    Label9: TLabel;
    BitBtn5: TBitBtn;
    MainMenu1: TMainMenu;
    Taxas1: TMenuItem;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label8: TLabel;
    BitBtn6: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    realEdit1: TEditHw;
    realEdit2: TEditHw;
    realEdit3: TEditHw;
    realEdit4: TEditHw;
    realEdit5: TEditHw;
    realEdit6: TEditHw;
    realEdit8: TEditHw;
    realEdit7: TEditHw;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure RealEdit2Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RealEdit6Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure RealEdit1Enter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure RealEdit5Exit(Sender: TObject);
    procedure RealEdit4Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RealEdit1Exit(Sender: TObject);
    procedure Taxas1Click(Sender: TObject);
    procedure RealEdit3Exit(Sender: TObject);
    procedure RealEdit7Exit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanoPagamentoV2: TfrmPlanoPagamentoV2;
  cadPlano: TPlanoPagamento_2;

implementation

uses uDtmAtivo,uTaxasPlano2, Funcoes;

{$R *.DFM}

procedure TfrmPlanoPagamentoV2.BitBtn3Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPlanoPagamentoV2.RealEdit2Exit(Sender: TObject);
begin
  if RealEdit2.Text = '' then
    RealEdit2.AsValue := 0;
  cadPlano.vDadosPlano.valor_desconto := RealEdit2.AsValue;
  if not cadPlano.calcularDesconto then
  begin
  	if (Self.Enabled) and (Self.Visible) and (RealEdit2.CanFocus) then
    	RealEdit2.SetFocus;
    exit;
  end;
  RealEdit3.AsValue := cadPlano.vDadosPlano.valor_com_desconto;
  RealEdit2.OnEnter := RealEdit1Enter;
end;

procedure TfrmPlanoPagamentoV2.SpeedButton1Click(Sender: TObject);
begin                                                             
  if not vDadosIni.PesqPros('FPG015', 'HABILITAR', '',
    'PLANO_PAG', '', cadPlano.buscas, False) then
    Exit;

  RealEdit2.OnEnter := nil;
  if (Self.Enabled) and (Self.Visible) and (RealEdit2.CanFocus) then
  	RealEdit2.SetFocus;
end;

procedure TfrmPlanoPagamentoV2.SpeedButton2Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('FPG016', 'HABILITAR', '',
    'PLANO_PAG', '', cadPlano.buscas, False) then
    Exit;

  RealEdit6.OnEnter := nil;
  if (Self.Enabled) and (Self.Visible) and (RealEdit6.CanFocus) then
  	RealEdit6.SetFocus;
end;

procedure TfrmPlanoPagamentoV2.RealEdit6Exit(Sender: TObject);
begin
  if RealEdit6.Text = '' then
    RealEdit6.AsValue := 0;
  RealEdit6.OnEnter := RealEdit1Enter;
end;

procedure TfrmPlanoPagamentoV2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cadPlano.CancelUpdates;
  cadPlano.RollBackTransacao;
end;

procedure TfrmPlanoPagamentoV2.FormCreate(Sender: TObject);
begin
  cadPlano := TPlanoPagamento_2.create;
end;

procedure TfrmPlanoPagamentoV2.ListBox1DblClick(Sender: TObject);
begin
//Panel1.Visible := true;
//if (Self.Enabled) and (Self.Visible) and (MaskEdit2.CanFocus) then
//	MaskEdit2.SetFocus;
end;

procedure TfrmPlanoPagamentoV2.Panel1Exit(Sender: TObject);
begin
  //Panel1.Visible := false;
end;

procedure TfrmPlanoPagamentoV2.RealEdit1Enter(Sender: TObject);
begin
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmPlanoPagamentoV2.BitBtn4Click(Sender: TObject);
begin
  BitBtn2.Enabled := False;
  cadPlano.vDadosPlano.valor_desconto := RealEdit2.AsValue;
  cadPlano.vDadosPlano.valor_entrada := RealEdit4.AsValue;
  cadPlano.vDadosPlano.numero_prestacoes := Trunc(RealEdit5.AsValue);
  cadPlano.vDadosPlano.taxaAplicada := RealEdit6.AsValue;
  if cadPlano.gerarParcelas(RealEdit7.AsValue,ListBox1) then
  begin
    RealEdit2.AsValue := cadPlano.vDadosPlano.valor_desconto;
    RealEdit3.AsValue := cadPlano.vDadosPlano.valor_com_desconto;
    Edit1.Text := cadPlano.vDadosPlano.textoEdit;
    if cadPlano.vDadosPlano.numero_venda > 0 then
    begin
      BitBtn2.Enabled := True;
      if (Self.Enabled) and (Self.Visible) and (BitBtn2.CanFocus) then
      	BitBtn2.SetFocus;
    end;
  end;
end;

procedure TfrmPlanoPagamentoV2.BitBtn1Click(Sender: TObject);
begin
  BitBtn2.Enabled := False;
  cadPlano.vDadosPlano.valor_desconto := RealEdit2.AsValue;
  cadPlano.vDadosPlano.valor_entrada := RealEdit4.AsValue;
  cadPlano.vDadosPlano.numero_prestacoes := Trunc(RealEdit5.AsValue);
  cadPlano.vDadosPlano.taxaAplicada := RealEdit6.AsValue;
  if cadPlano.gerarParcelas(ListBox1) then
  begin
    Edit1.Text := cadPlano.vDadosPlano.textoEdit;
    RealEdit7.AsValue := cadPlano.vDadosPlano.valor_parcela;
    if cadPlano.vDadosPlano.numero_venda > 0 then
    begin
      BitBtn2.Enabled := True;
      if (Self.Enabled) and (Self.Visible) and (BitBtn2.CanFocus) then
      	BitBtn2.SetFocus;
    end;
  end;
end;

procedure TfrmPlanoPagamentoV2.BitBtn5Click(Sender: TObject);
begin
  cadPlano.create;
  cadPlano.calcularDesconto;
  RealEdit2.AsValue := cadPlano.vDadosPlano.valor_desconto;
  RealEdit3.AsValue := cadPlano.vDadosPlano.valor_com_desconto;
  RealEdit4.AsValue := cadPlano.vDadosPlano.valor_entrada;
  RealEdit5.AsValue := cadPlano.vDadosPlano.numero_prestacoes;
  RealEdit6.AsValue := cadPlano.vDadosPlano.taxaAplicada;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
  	DBLookupComboBox1.SetFocus;
  BitBtn2.Enabled := False;
end;

procedure TfrmPlanoPagamentoV2.DBLookupComboBox1Exit(Sender: TObject);
var
  tx: Double;
begin
  if RealEdit5.Text = '' then
    RealEdit5.AsValue := 0;
  if cadPlano.vDadosPlano.codigo_controle <> cadPlano.vCont.DataSet.FieldByName('CODIGO_CTRL').AsInteger then
    BitBtn2.Enabled := false;
  cadPlano.vDadosPlano.codigo_controle := cadPlano.vCont.DataSet.FieldByName('CODIGO_CTRL').AsInteger;
  cadPlano.vDadosPlano.numero_prestacoes := Trunc(RealEdit5.AsValue);
  if Trim(cadPlano.vCont.dataSet.FieldByName('DOCS').AsString) = 'N' then
  begin
    GroupBox1.Visible := False;
    BitBtn2.Enabled := False;
    cadPlano.vDadosPlano.valor_desconto := RealEdit2.AsValue;
    cadPlano.vDadosPlano.valor_entrada := RealEdit3.AsValue;
    cadPlano.vDadosPlano.numero_prestacoes := 0;
    cadPlano.vDadosPlano.taxaAplicada := 1;
    cadPlano.vDadosPlano.textoEdit := 'Pagamento a vista';
    cadPlano.vDadosPlano.valor_aplicado := cadPlano.vDadosPlano.valor_entrada;
    cadPlano.vDadosPlano.valor_parcela := cadPlano.vDadosPlano.valor_entrada;
    ListBox1.Clear;
    if cadPlano.vDadosPlano.numero_venda > 0 then
    begin
      BitBtn2.Enabled := True;
      if (Self.Enabled) and (Self.Visible) and (BitBtn2.CanFocus) and (ActiveControl <> RealEdit2) then
        BitBtn2.SetFocus;
    end;
  end
  else
  begin
    GroupBox1.Visible := True;
    tx := cadPlano.getTaxa;
    if tx > 0 then
      RealEdit6.AsValue := tx;
    if (Self.Enabled) and (Self.Visible) and (RealEdit4.CanFocus)and (ActiveControl <> RealEdit2) then
      RealEdit4.SetFocus;
  end;
end;

procedure TfrmPlanoPagamentoV2.RealEdit5Exit(Sender: TObject);
var
  tx: Double;
begin
  if RealEdit5.Text = '' then
    RealEdit5.AsValue := 0;
  if cadPlano.vDadosPlano.numero_prestacoes = Trunc(RealEdit5.AsValue) then
    exit
  else
    BitBtn2.Enabled := false;
  cadPlano.vDadosPlano.numero_prestacoes := Trunc(RealEdit5.AsValue);
  tx := cadPlano.getTaxa;
  if tx > 0 then
    RealEdit6.AsValue := tx;
end;

procedure TfrmPlanoPagamentoV2.RealEdit4Exit(Sender: TObject);
var
  tx: Double;
begin
  if RealEdit4.Text = '' then
    RealEdit4.AsValue := 0;
  if Format('%10.2f', [cadPlano.vDadosPlano.valor_entrada]) <> Format('%10.2f', [RealEdit4.AsValue]) then
  begin
    BitBtn2.Enabled := false;
    cadPlano.vDadosPlano.valor_entrada := RealEdit4.AsValue;
    tx := cadPlano.getTaxa;
    if tx > 0 then
      RealEdit6.AsValue := tx;
  end;
  if cadPlano.vDadosPlano.numero_prestacoes <> Trunc(RealEdit5.AsValue) then
    BitBtn2.Enabled := false;
end;

procedure TfrmPlanoPagamentoV2.BitBtn2Click(Sender: TObject);
begin
  if cadPlano.salvarPlanoPagamento then
    ModalResult := mrOK;
end;

procedure TfrmPlanoPagamentoV2.FormShow(Sender: TObject);
begin
  cadPlano.calcularDesconto;
  RealEdit1.AsValue := cadPlano.vDadosPlano.valor_operacao;
  RealEdit2.AsValue := cadPlano.vDadosPlano.valor_desconto;
  RealEdit3.AsValue := cadPlano.vDadosPlano.valor_com_desconto;
end;

procedure TfrmPlanoPagamentoV2.RealEdit1Exit(Sender: TObject);
begin
  if RealEdit1.Text = '' then
    RealEdit1.AsValue := 0;
  cadPlano.vDadosPlano.valor_operacao := RealEdit1.AsValue;
end;

procedure TfrmPlanoPagamentoV2.Taxas1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('FPG017', 'ABRIR', '',
    'PLANO_PAG', '', cadPlano.buscas, False) then
    Exit;

  Application.CreateForm(TfrmTaxasPlano2, frmTaxasPlano2);
  frmTaxasPlano2.ShowModal;
end;

procedure TfrmPlanoPagamentoV2.RealEdit3Exit(Sender: TObject);
begin
  if RealEdit3.Text = '' then
    RealEdit3.AsValue := 0;
end;

procedure TfrmPlanoPagamentoV2.RealEdit7Exit(Sender: TObject);
begin
  if RealEdit7.Text = '' then
    RealEdit7.AsValue := 0;
  RealEdit7.OnEnter := RealEdit1Enter;
end;

procedure TfrmPlanoPagamentoV2.SpeedButton3Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('FPG013', 'HABILITAR', 'HABILITAR CAMPO PARA DIGITACAO',
    'PLANO_PAG', '', cadPlano.buscas, False) then
    Exit;
  RealEdit7.OnEnter := nil;
  if (Self.Enabled) and (Self.Visible) and (RealEdit7.CanFocus) then
  	RealEdit7.SetFocus;
end;

procedure TfrmPlanoPagamentoV2.BitBtn6Click(Sender: TObject);
begin
  if Trim(DBLookupComboBox2.Text) = '' then
  begin
    Application.MessageBox('Selecione o controle','Atenção',0+64);
    exit;
  end;
  TForm(Panel2.Parent).ModalResult := IDOK;
end;

end.

