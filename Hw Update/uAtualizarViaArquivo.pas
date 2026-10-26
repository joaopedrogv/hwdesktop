unit uAtualizarViaArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, jpeg, ExtCtrls, GifImageHw;

type
  TfrmAtualizarViaArquivo = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    lbTitulo: TLabel;
    lbStatus: TLabel;
    Panel2: TPanel;
    Gauge1: TGauge;
    lbProcesso: TLabel;
    Panel4: TPanel;
    Memo1: TMemo;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizarViaArquivo: TfrmAtualizarViaArquivo;

implementation

uses uClassesHwUpdate, uInstalarVersao;

{$R *.dfm}

procedure TfrmAtualizarViaArquivo.BitBtn1Click(Sender: TObject);
begin
  try
    BitBtn1.Enabled := False;
    BitBtn2.Enabled := False;
    CheckBox1.Enabled := False;

//    if BitBtn1.Caption = '&Continuar' then
//    begin

      try
        vDadosIni.vGauge := TGauge(Gauge1);
        vDadosIni.vLbStatus := TLabel(lbProcesso);

        if vAtHw._verificarAtualizacaoViaArquivo(lbProcesso.Caption, CheckBox1.Checked) then
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

procedure TfrmAtualizarViaArquivo.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAtualizarViaArquivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vAtHw.EmExecucao := False;
end;

procedure TfrmAtualizarViaArquivo.FormShow(Sender: TObject);
begin
  Gauge1.Visible := False;
end;

end.
