unit uManutencaoHw;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, StdCtrls, Buttons, Mask, Menus;

type
  TfrmManutencaoHw = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    GroupBox2: TGroupBox;
    BitBtn4: TBitBtn;
    MaskEdit3: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit4: TMaskEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    BitBtn6: TBitBtn;
    MaskEdit5: TMaskEdit;
    MainMenu1: TMainMenu;
    MenuFiscal1: TMenuItem;
    procedure MenuFiscal1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManutencaoHw: TfrmManutencaoHw;

implementation

uses
  uDtmAtivo, uPrincipalF, uDadosIniFiscal;

{$R *.dfm}

procedure TfrmManutencaoHw.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    StrToCurr(MaskEdit2.Text);
  except
    Application.MessageBox(pchar('Valor informado inválido'), 'Atenção', MB_ICONEXCLAMATION +
      MB_OK);
    exit;
  end;
  obconfImp.corrigeGrandeTotal(StrToCurr(MaskEdit2.Text));
  MaskEdit2.Text := vDadosIniF.getGrandeTotalDescriptografado;
end;

procedure TfrmManutencaoHw.BitBtn2Click(Sender: TObject);
var
  dia: string;
  hora: string;
  /// 2 primeiros digitos: hw
  /// proximos 2 = hora do pc: ex 14:15 = 14, 09:13 = 09
  /// proximos 2 digitos: eu
  /// proximos 2 digitos: dia do mes ex: 31/03/09 = 31, 01/04/09 = 01
begin
  inherited;
  try
    hora := TimeToStr(Time);
    dia := DateToStr(Date);
    if (Length(trim(MaskEdit1.Text)) <> 8) or
      (Copy(MaskEdit1.Text, 1, 2) <> 'HW') or
      (copy(vDadosIni.StrZero(hora, 8), 1, 2) <> copy(MaskEdit1.Text, 3, 2)) or
      (Copy(MaskEdit1.Text, 5, 2) <> 'EU') or
      (copy(vDadosIni.StrZero(dia, 10), 1, 2) <> copy(MaskEdit1.Text, 7, 2)) then
      raise exception.create('Senha inválida')
    else
    begin
      GroupBox1.Visible := true;
      GroupBox2.Visible := true;
      Panel2.Visible := true;
      MaskEdit2.SetFocus;
      Panel1.Visible := false;
    end;
  except
    on e: exception do begin
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

procedure TfrmManutencaoHw.BitBtn3Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmManutencaoHw.BitBtn4Click(Sender: TObject);
var
  codigo: integer;
begin
  inherited;
  if (trim(MaskEdit3.Text) = '') or (trim(MaskEdit4.Text) = '') then
  begin
    Application.MessageBox(pchar('Preencha todos os campos'), 'Atenção', MB_ICONWARNING + MB_OK);
    MaskEdit3.SetFocus;
    Exit;
  end;

  codigo := CImpressoraF.cadastraNovoTotalizadorNaoFiscal(MaskEdit4.Text, StrToInt(MaskEdit3.Text));
  if codigo = 0 then
  begin
    if Application.MessageBox(pchar('Totalizador não foi cadastrado na impressora.' + #13 +
      'Deseja cadastrar assim mesmo no sistema?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) =
      mrNo then
      exit;
    if obTotalizador.cadastraTotalizador(StrToInt(MaskEdit3.Text), MaskEdit4.Text) then
      obTotalizador.Post;
  end
  else if obTotalizador.cadastraTotalizador(codigo, MaskEdit4.Text) then
    obTotalizador.Post;
  obTotalizador.getTodos;
end;

procedure TfrmManutencaoHw.BitBtn5Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmManutencaoHw.BitBtn6Click(Sender: TObject);
begin
  inherited;
  try
    StrToCurr(MaskEdit2.Text);
  except
    Application.MessageBox(pchar('Valor informado inválido'), 'Atenção', MB_ICONEXCLAMATION +
      MB_OK);
    exit;
  end;
  obconfImp.corrigeGrandeTotal(StrToCurr(MaskEdit2.Text));
  MaskEdit2.Text := vDadosIniF.getGrandeTotalDescriptografado;
end;

procedure TfrmManutencaoHw.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  obTotalizador.Close;
  Action := cafree;
  frmManutencaoHw := nil;
end;

procedure TfrmManutencaoHw.FormShow(Sender: TObject);
begin
  inherited;
  obTotalizador.getTodos;
  MaskEdit3.Text := obTotalizador.dataSet.FieldByName('sequencia').AsString;
  MaskEdit4.Text := obTotalizador.dataSet.FieldByName('descricao').AsString;
  Panel1.Align := alClient;
  MaskEdit1.SetFocus;
end;

procedure TfrmManutencaoHw.MenuFiscal1Click(Sender: TObject);
begin
  inherited;
vDadosIniF.MenuFiscal;
end;

procedure TfrmManutencaoHw.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  obTotalizador.Prior;
  MaskEdit3.Text := obTotalizador.dataSet.FieldByName('sequencia').AsString;
  MaskEdit4.Text := obTotalizador.dataSet.FieldByName('descricao').AsString;
end;

procedure TfrmManutencaoHw.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  obTotalizador.Next;
  MaskEdit3.Text := obTotalizador.dataSet.FieldByName('sequencia').AsString;
  MaskEdit4.Text := obTotalizador.dataSet.FieldByName('descricao').AsString;
end;

end.

