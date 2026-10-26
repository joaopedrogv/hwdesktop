unit uFormSpedFiscal_bloco_K;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons;

type
  TformSpedFiscal_bloco_K = class(TForm)
    Panel1: TPanel;
    group_k280: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dtIni: TMaskEdit;
    dtFim: TMaskEdit;
    GroupBox1: TGroupBox;
    ed_dataestoque_k: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    pn_bottom: TPanel;
    btIniciar: TBitBtn;
    btSair: TBitBtn;
    procedure dtIniExit(Sender: TObject);
    procedure dtFimExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FdataIniApuracao: TDate;
    FdataEstoque    : TDate;
    FdataAjusteIni  : TDate;
    FdataAjusteFim  : TDate;
    { Private declarations }
  public
    { Public declarations }
    property dataIniApuracao: TDate read FdataIniApuracao write FdataIniApuracao;
    property dataEstoque    : TDate read FdataEstoque     write FdataEstoque;
    property dataAjusteIni  : TDate read FdataAjusteIni   write FdataAjusteIni;
    property dataAjusteFim  : TDate read FdataAjusteFim   write FdataAjusteFim;
  end;

var
  formSpedFiscal_bloco_K: TformSpedFiscal_bloco_K;

implementation

{$R *.dfm}

procedure TformSpedFiscal_bloco_K.dtFimExit(Sender: TObject);
begin
  if ActiveControl = btSair then
    Exit;

  if StrToDate(dtFim.Text) >= dataIniApuracao then
  begin
    Application.MessageBox(PWideChar('Data Final deve ser inferior a data inicial da apuração(' + DateToStr(dataIniApuracao) + ')'),
                           'Atenção', 64);
    if dtFim.CanFocus then
      dtFim.SetFocus;
  end
  else if StrToDate(dtFim.Text) < StrToDate(dtIni.Text) then
  begin
    Application.MessageBox(PWideChar('Data Final deve ser maior que a data inicial'),
                           'Atenção', 64);
    if dtFim.CanFocus then
      dtFim.SetFocus;
  end;
end;

procedure TformSpedFiscal_bloco_K.dtIniExit(Sender: TObject);
begin
  if ActiveControl = btSair then
    Exit;

  if StrToDate(dtIni.Text) >= dataIniApuracao then
  begin
    Application.MessageBox(PWideChar('Data inicial deve ser inferior a data inicial da apuração(' + DateToStr(dataIniApuracao) + ')'),
                           'Atenção', 64);
    if dtIni.CanFocus then
      dtIni.SetFocus;
  end
  else if dtFim.CanFocus then
    dtFim.SetFocus;
end;

procedure TformSpedFiscal_bloco_K.FormShow(Sender: TObject);
begin
  ed_dataestoque_k.Text := DateToStr(FdataEstoque);
  dtIni.Text            := DateToStr(FdataAjusteIni);
  dtFim.Text            := DateToStr(FdataAjusteFim);
end;

end.
