unit uDadosReducaoZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, Grids, DBGrids;

type
  TfrmConferenciaDadosReducaoZ = class(TfrmPadrao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
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
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Panel2: TPanel;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label17: TLabel;
    DBEdit21: TDBEdit;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBComboBox1: TDBComboBox;
    BitBtn6: TBitBtn;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit21Enter(Sender: TObject);
    procedure DBComboBox1Enter(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit14Enter(Sender: TObject);
    procedure DBEdit13Enter(Sender: TObject);
    procedure DBEdit15Enter(Sender: TObject);
    procedure DBEdit10Enter(Sender: TObject);
    procedure DBEdit18Enter(Sender: TObject);
    procedure DBEdit12Enter(Sender: TObject);
    procedure DBEdit11Enter(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBEdit7Enter(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit17Enter(Sender: TObject);
    procedure DBEdit16Enter(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConferenciaDadosReducaoZ: TfrmConferenciaDadosReducaoZ;

implementation

uses uDtmFiscal, uPrincipalF, uDtmEntrada, uDadosIniFiscal;

{$R *.dfm}

procedure TfrmConferenciaDadosReducaoZ.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if obResumoD.mpRes.Edit then
  begin
    Panel3.Enabled := False;
    Panel1.Enabled := False;
    DBGrid1.Enabled := False;
    DBComboBox1.Enabled := False;
    DBEdit21.SetFocus;
  end;
end;

procedure TfrmConferenciaDadosReducaoZ.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if obResumoD.mpRes.Insert then
  begin
    Panel3.Enabled := False;
    Panel1.Enabled := False;
    DBGrid1.Enabled := False;
    DBComboBox1.Enabled := True;
    DBComboBox1.SetFocus;
  end;
end;

procedure TfrmConferenciaDadosReducaoZ.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if not obResumoD.mpRes.Post then
    DBEdit21.SetFocus
  else
  begin
    Panel3.Enabled := True;
    Panel1.Enabled := True;
    DBGrid1.Enabled := True;
  end;
end;

procedure TfrmConferenciaDadosReducaoZ.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if not vDadosIniF.PesqPros('FIS037', 'ALTERAÇÃO','', '', '', dtmEnt.qrBuscas, false)then
    exit;

  if vDadosIniF.vDigitarDadosReducaoZ = 'S' then
  begin
    if Trim(obResumoD.dataSet.FieldByName('COORED').AsString)  = '' then
    begin
      Application.MessageBox('Campo COO Redução Z precisa ser preenchido', 'Atenção', 0 + 64);
      if DBEdit8.CanFocus then
        DBEdit8.SetFocus;
      Exit;
    end;
    if Trim(obResumoD.dataSet.FieldByName('DATA_MOV').AsString)  = '' then
    begin
      Application.MessageBox('Campo Data movimento precisa ser preenchido', 'Atenção', 0 + 64);
      if DBEdit1.CanFocus then
        DBEdit1.SetFocus;
      Exit;
    end;
    if Trim(obResumoD.dataSet.FieldByName('CRO_MOV').AsString)  = '' then
    begin
      Application.MessageBox('Campo Contador de Reinicio', 'Atenção', 0 + 64);
      if DBEdit6.CanFocus then
        DBEdit6.SetFocus;
      Exit;
    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLVENDAB').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Venda Bruta Diaria precisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit4.CanFocus then
//        DBEdit4.SetFocus;
//      Exit;
//    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLDESCONTOS').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Desconto (ICMS+ISS) ´recisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit11.CanFocus then
//        DBEdit11.SetFocus;
//      Exit;
//    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLTOTLIQ').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Venda Líquida precisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit18.CanFocus then
//        DBEdit18.SetFocus;
//      Exit;
//    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLSUBST').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Substituição Trib precisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit15.CanFocus then
//        DBEdit15.SetFocus;
//      Exit;
//    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLNINCIDENCIA').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Não Incidencia precisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit14.CanFocus then
//        DBEdit14.SetFocus;
//      Exit;
//    end;
    if Trim(obResumoD.dataSet.FieldByName('SEQINI').AsString)  = '' then
    begin
      Application.MessageBox('Campo COO Inicial precisa ser preenchido', 'Atenção', 0 + 64);
      if DBEdit2.CanFocus then
        DBEdit2.SetFocus;
      Exit;
    end;
    if Trim(obResumoD.dataSet.FieldByName('SEQFIM').AsString)  = '' then
    begin
      Application.MessageBox('Campo COO Final precisa ser preenchido', 'Atenção', 0 + 64);
      if DBEdit3.CanFocus then
        DBEdit3.SetFocus;
      Exit;
    end;
    if Trim(obResumoD.dataSet.FieldByName('DATA_EMISSAO_Z').AsString)  = '' then
    begin
      Application.MessageBox('Campo Data Emissão precisa ser preenchido', 'Atenção', 0 + 64);
      if DBEdit16.CanFocus then
        DBEdit16.SetFocus;
      Exit;
    end;
    if Trim(obResumoD.dataSet.FieldByName('HORA_EMISSAO_Z').AsString)  = '' then
    begin
      Application.MessageBox('Campo Hora Emissão precisa ser preenchido', 'Atenção', 0 + 64);
      if DBEdit17.CanFocus then
        DBEdit17.SetFocus;
      Exit;
    end;
    if Trim(obResumoD.dataSet.FieldByName('NREDUCOES').AsString)  = '' then
    begin
      Application.MessageBox('Campo Contadore de Reduções Z precisa ser preenchido', 'Atenção', 0 + 64);
      if DBEdit7.CanFocus then
        DBEdit7.SetFocus;
      Exit;
    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLTOTGERAL').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Totalizador Geral precisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit5.CanFocus then
//        DBEdit5.SetFocus;
//      Exit;
//    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLCANCEL').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Cancelamento (ICMS+ISS) precisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit9.CanFocus then
//        DBEdit9.SetFocus;
//      Exit;
//    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLISS').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Total de ISSQN precisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit12.CanFocus then
//        DBEdit12.SetFocus;
//      Exit;
//    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLACRESCIMO').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Acréscimos (ICMS+ISS) precisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit10.CanFocus then
//        DBEdit10.SetFocus;
//      Exit;
//    end;
//    if Trim(obResumoD.dataSet.FieldByName('VLISENTOS').AsString)  = '' then
//    begin
//      Application.MessageBox('Campo Isentos precisa ser preenchido', 'Atenção', 0 + 64);
//      if DBEdit13.CanFocus then
//        DBEdit13.SetFocus;
//      Exit;
//    end;
    


  end;
  ModalResult := IDOK;
end;

procedure TfrmConferenciaDadosReducaoZ.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmConferenciaDadosReducaoZ.BitBtn6Click(Sender: TObject);
begin
  inherited;
  obResumoD.mpRes.Cancel;
  Panel3.Enabled := True;
  Panel1.Enabled := True;
  DBGrid1.Enabled := True;
end;

procedure TfrmConferenciaDadosReducaoZ.DBComboBox1Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Totalizadores da Redução Z');
  Memo1.Lines.Add('Descrição do Totalizador conforme Item 7.3.1.2 - Campo 07: Tabela de Códigos dos Totalizadores Parciais, do ATO COTEPE/ICMS N° 6, DE 14 DE ABRIL DE 2008');
  DBComboBox1.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit10Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('ACRÉSCIMO DE ICMS + ISS');
  Memo1.Lines.Add('Corresponde a soma do valor de acréscimo de ICMS com o acréscimo de ISSQN');
  DBEdit11.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit11Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('DESCONTO DE ICMS + ISS');
  Memo1.Lines.Add('Corresponde a soma do valor de desconto de ICMS com o desconto de ISSQN');
  DBEdit11.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit12Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Total de ISSQN');
  Memo1.Lines.Add('Corresponde a soma do valor de venda feita nos totalizadores de ISSQN');
  DBEdit12.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit13Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Isento de ICMS + ISS');
  Memo1.Lines.Add('Corresponde a soma do valor de isentos de ICMS com o valor de isentos de ISSQN');
  DBEdit13.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit14Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Não Incidência de ICMS + ISS');
  Memo1.Lines.Add('Corresponde a soma do valor de não incidência de ICMS com o valor de não incidência de ISSQN');
  DBEdit14.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit15Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Substituição Tributária de ICMS + ISS');
  Memo1.Lines.Add('Corresponde a soma do valor de substituição tributária de ICMS com o valor de substituição tributária de ISSQN');
  DBEdit15.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit16Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Data de Emissão da Redução Z');
  Memo1.Lines.Add('Corresponde a data em que foi impresso em papel na Redução Z');
  DBEdit16.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit17Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Hora de Emissão da Redução Z');
  Memo1.Lines.Add('Corresponde a hora em que foi impresso em papel na Redução Z');
  DBEdit17.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit18Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('VENDA LÍQUIDA');
  Memo1.Lines.Add('Corresponde ao valor de venda líquida do dia. Venda bruta menos cancelamentos, descontos e Total ISSQN');
  DBEdit18.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit1Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Data de Movimento da Redução Z');
  Memo1.Lines.Add('Corresponde a data em que houve a movimentação Fiscal. Data de impressao de cupons fiscais e outros');
  DBEdit1.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit21Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Valor dos Totalizadores da Redução Z');
  Memo1.Lines.Add('Valor armazenado no Totalizador');
  DBEdit21.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit2Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('COO Inicial');
  Memo1.Lines.Add('Corresponde ao Contador de Ordem de Operação (COO) do primeiro cupom fiscal emitido na data de movimento');
  DBEdit12.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit3Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('COO Final');
  Memo1.Lines.Add('Corresponde ao Contador de Ordem de Operação (COO) do último cupom fiscal emitido na data de movimento');
  DBEdit3.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit4Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('VENDA BRUTA DIÁRIA');
  Memo1.Lines.Add('Valor da venda bruta diária');
  DBEdit4.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit5Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('TOTALIZADOR GERAL');
  Memo1.Lines.Add('É o valor total geral acumulado na impressora fiscal. Grande Total');
  DBEdit5.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit6Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Contador de Reinício de Operação');
  DBEdit6.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit7Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Contador de Redução Z');
  Memo1.Lines.Add('Informa a quantidade de Redução Z que ja foram emitidas');
  DBEdit7.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit8Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('COO de Redução Z');
  Memo1.Lines.Add('Numero do COO da Redução Z localizado na parte superior da Redução Z');
  DBEdit8.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBEdit9Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('CANCELAMENTO DE ICMS + ISS');
  Memo1.Lines.Add('Corresponde a soma do valor de cancelamento de ICMS com o cancelamento de ISSQN');
  DBEdit9.Hint := Memo1.Lines.Text;
end;

procedure TfrmConferenciaDadosReducaoZ.DBGrid1Enter(Sender: TObject);
begin
  inherited;
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Totalizadores da Redução Z');
  Memo1.Lines.Add('Armazenamento dos valores de Cancelamentos, Descontos, Aliquotas de ICMS, ISS, etc.');
  DBGrid1.Hint := Memo1.Lines.Text;
end;

end.
