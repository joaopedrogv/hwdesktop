unit UCondPagParcelamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, uEditHw, Mask, ExtCtrls, Spin, IBQuery;

type
  TfrmCondPagParcelamento = class(TfrmPadrao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lbCondicao: TLabel;
    Label3: TLabel;
    lbNumDoc: TLabel;
    Label5: TLabel;
    lbValor: TLabel;
    Label7: TLabel;
    lbModalidade: TLabel;
    groupDataBase: TGroupBox;
    MaskEdit1: TMaskEdit;
    SpeedButton1: TSpeedButton;
    groupParcelasAdicionais: TGroupBox;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    SpinEdit1: TSpinEdit;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FQuery: TIBQuery;
    { Private declarations }
  public
    { Public declarations }
    property Query: TIBQuery read FQuery write FQuery;
  end;

var
  frmCondPagParcelamento: TfrmCondPagParcelamento;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TfrmCondPagParcelamento.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS409', 'HABILITAR', '', '', '', FQuery) then
    Exit;

  MaskEdit1.Enabled := True;
end;

procedure TfrmCondPagParcelamento.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BAS410', 'HABILITAR', '', '', '', FQuery) then
    Exit;

  SpinEdit1.Enabled := True;
end;

end.
