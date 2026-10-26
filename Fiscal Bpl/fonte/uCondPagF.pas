unit uCondPagF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, Mask, StdCtrls, Buttons, uEditMoeda, DBCtrls;

type
  TfrmCondPagF = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    EditMoeda1: TEditMoeda;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    Edit1: TEdit;
    MaskEdit1: TMaskEdit;
    EditMoeda2: TEditMoeda;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox3: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Panel2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    ndoc: array[1..99] of string;
    nvalor: array[1..99] of Currency;
    ndata: array[1..99] of string;
  public
    { Public declarations }
    valorOutros: Real;
  end;

var
  frmCondPagF: TfrmCondPagF;

implementation

uses
  uPrincipalF, uCupom, uDtmEntrada, uDtmFiscalHwF, uDadosIniFiscal;

{$R *.dfm}

procedure TfrmCondPagF.BitBtn1Click(Sender: TObject);
var
  I: Integer;
  vValor: Real;
begin
  inherited;
  try
    if trunc(EditMoeda1.Valor) <= 0 then
      Exit;
  except
    Exit;
  end;
  if valorOutros > 0 then
    vValor := valorOutros
  else
    vValor := obCupom.getValorPrazo;

  if obCupom.vFPg.montaParcelamento(ListBox1, trunc(EditMoeda1.Valor), IntToStr(frmCondPagF.Tag),
    vValor, False) then
  begin
    if not obCtrl.dataSet.IsEmpty then
      DBLookupComboBox1.SetFocus
    else
      BitBtn4.SetFocus;
  end;
end;

procedure TfrmCondPagF.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if ListBox1.ItemIndex = -1 then
  begin
    Application.MessageBox('Selecione a parcela desejada', 'Atenção',0+64);
    Exit;
  end;
  
  if not vDadosIniF.PesqPros('FIS045','VALIDAR', '', '', '', dtmEnt.qrBuscas, True) then
    Exit;

  if ListBox1.Items.Count > 0 then
  begin
    Edit1.Text := obCupom.vFPg.getDocParcela(ListBox1.ItemIndex);
    MaskEdit1.Text := obCupom.vFPg.getVencimentoParcela(ListBox1.ItemIndex);
    EditMoeda2.Valor := obCupom.vFPg.getValorParcela(ListBox1.ItemIndex);
    Panel2.Visible := true;
    Edit1.SetFocus;
  end;
end;

procedure TfrmCondPagF.BitBtn3Click(Sender: TObject);
begin
  inherited;
  obCupom.vFPg.setValorParcela(ListBox1.ItemIndex, EditMoeda2.Valor);
  obCupom.vFPg.setDocParcela(ListBox1.ItemIndex, Edit1.Text);
  obCupom.vFPg.setVencimentoParcela(ListBox1.ItemIndex, MaskEdit1.Text);
  ListBox1.Items[ListBox1.ItemIndex] := Edit1.Text + '    ' +
    MaskEdit1.Text + '           ' + Format('%m',
    [EditMoeda2.Valor]);
  BitBtn4.SetFocus;
end;

procedure TfrmCondPagF.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if ListBox1.Items.Count > 0 then
    ModalResult := mrOK;
end;

procedure TfrmCondPagF.BitBtn5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmCondPagF.BitBtn6Click(Sender: TObject);
var
  I: Integer;
  vValor: Real;
begin
  inherited;
  try
    EditMoeda1.Valor := 1;
  except
    Exit;
  end;
  if valorOutros > 0 then
    vValor := valorOutros
  else
    vValor := obCupom.getValorPrazo;

  if obCupom.vFPg.montaParcelamento(ListBox1, 1, IntToStr(frmCondPagF.Tag),
    vValor, True) then
  begin
    if not obCtrl.dataSet.IsEmpty then
      DBLookupComboBox1.SetFocus
    else
      BitBtn4.SetFocus;
  end;
end;

procedure TfrmCondPagF.FormCreate(Sender: TObject);
begin
  inherited;
  valorOutros := 0;
end;

procedure TfrmCondPagF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F4 then
    EditMoeda1.SetFocus
  else if Key = VK_F5 then
    BitBtn1Click(Sender)
  else if Key = VK_F8 then
    ListBox1.SetFocus
  else if Key = VK_F6 then
    BitBtn2Click(Sender)
  else if (Key = VK_F7) and (Panel2.Visible) then
    BitBtn3Click(Sender)
  else if Key = VK_F3 then
    BitBtn4Click(Sender)
  else if Key = VK_F9 then
    BitBtn6Click(BitBtn6)
  else if Key = VK_ESCAPE then
  begin
    ModalResult:= mrCancel;
    close;
  end;
end;

procedure TfrmCondPagF.FormShow(Sender: TObject);
begin
  inherited;

  vDadosIniF.vInibeMensPesqPros := 'S';
  MaskEdit1.Enabled := vDadosIniF.PesqPros('FIS042','HABILITAR', '', '', '', dtmEnt.qrBuscas, False);

  vDadosIniF.vInibeMensPesqPros := 'S';
  EditMoeda2.Enabled := vDadosIniF.PesqPros('FIS043','HABILITAR', '', '', '', dtmEnt.qrBuscas, False);
  
  vDadosIniF.vInibeMensPesqPros := 'S';
  Edit1.Enabled := vDadosIniF.PesqPros('FIS044','HABILITAR', '', '', '', dtmEnt.qrBuscas, False);
    
  Edit1.Clear;
  if valorOutros = 0 then
  begin
    ListBox1.Clear;
    EditMoeda1.Clear;
  end;
  EditMoeda2.Clear;
  MaskEdit1.Clear;
end;

procedure TfrmCondPagF.ListBox1DblClick(Sender: TObject);
begin
  inherited;
  BitBtn2Click(Sender);
end;

procedure TfrmCondPagF.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  Key = VK_RETURN then
    BitBtn2Click(Sender);
end;

procedure TfrmCondPagF.Panel2Exit(Sender: TObject);
begin
  inherited;
  Edit1.Clear;
  MaskEdit1.Clear;
  EditMoeda2.Clear;
  Panel2.Visible := false;
end;

end.

