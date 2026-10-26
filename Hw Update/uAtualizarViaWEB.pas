unit uAtualizarViaWEB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Gauges, GifImageHw;

type
  TfrmAtualizarViaWEB = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lbTitulo: TLabel;
    lbStatus: TLabel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Gauge1: TGauge;
    lbProcesso: TLabel;
    Panel4: TPanel;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    BitBtn2: TBitBtn;
    timerVerificar: TTimer;
    procedure timerVerificarTimer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizarViaWEB: TfrmAtualizarViaWEB;

implementation

uses
  uClassesHwUpdate, uInstalarVersao;

{$R *.dfm}

procedure TfrmAtualizarViaWEB.BitBtn1Click(Sender: TObject);
begin
  try
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    CheckBox1.Enabled := False;

    frmAtualizarViaWEB.Show;
    

//    if BitBtn1.Caption = '&Continuar' then
//    begin

      try
        vDadosIni.vGauge := TGauge(Gauge1);
        vDadosIni.vLbStatus := TLabel(lbProcesso);

        if vAtHw._verificarAtualizacaoUsuario(CheckBox1.Checked, Self.Tag <> 0) then
        begin
          if not vAtHw.vConfig._getConfig(False) then
            Exit;

          Application.CreateForm(TfrmInstalarVersao, frmInstalarVersao);
          frmInstalarVersao.Tag := Self.Tag;
          frmInstalarVersao.ShowModal;

          Close;
        end;

      finally
        vDadosIni.vGauge := nil;
        vDadosIni.vLbStatus := nil;
      end;

//      BitBtn1.Caption := 'Concluir';
//      Close;
//    end
//    else if BitBtn1.Caption = 'Concluir' then
//      Close;

  finally
    Close;
//    BitBtn1.Enabled := True;
  end;
end;

procedure TfrmAtualizarViaWEB.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAtualizarViaWEB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vAtHw.EmExecucao := False;
end;

procedure TfrmAtualizarViaWEB.FormShow(Sender: TObject);
begin
  Gauge1.Visible := False;
  if Tag = 1 then
  begin
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    timerVerificar.Enabled := True;
  end;
end;

procedure TfrmAtualizarViaWEB.timerVerificarTimer(Sender: TObject);
begin
  timerVerificar.Enabled := False;
  BitBtn1.Click;
end;

end.
