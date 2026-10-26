unit frmInformarDadosHodometro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.ExtCtrls;

type
  TformInformarDadosHodometro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ed_data: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ed_kms: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Fkmhodometro: Integer;
    FdataMedicao: TDateTime;
    { Private declarations }
  public
    property kmhodometro: Integer read Fkmhodometro write Fkmhodometro;
    property dataMedicao: TDateTime read FdataMedicao write FdataMedicao;
  end;

var
  formInformarDadosHodometro: TformInformarDadosHodometro;

implementation

{$R *.dfm}

uses hw_utils;

procedure TformInformarDadosHodometro.BitBtn1Click(Sender: TObject);
var
  data: TDateTime;
  num: Integer;
begin
  if not TryStrToInt(ed_kms.Text, num) then
  begin
    ShowAtencao('Número informado inválido');
    Exit;
  end;

  if num < 0 then
  begin
    ShowAtencao('Valor do hodômetro deve ser maior ou igual a zero');
    Exit;
  end;

  Fkmhodometro := num;

  if not TryStrToDateTime(ed_data.Text, FdataMedicao) then
  begin
    ShowAtencao('Data de medição inválida');
    Exit;
  end;

  ModalResult := IDOK;
end;

procedure TformInformarDadosHodometro.FormShow(Sender: TObject);
begin
  if FdataMedicao > 0 then
    ed_data.Text := FormatDateTime('dd/MM/yyyy hh:mm:ss', FdataMedicao)
  else
    ed_data.Text := FormatDateTime('dd/MM/yyyy hh:mm:ss', Now);
  ed_kms.Text := IntToStr(Fkmhodometro);
end;

end.
