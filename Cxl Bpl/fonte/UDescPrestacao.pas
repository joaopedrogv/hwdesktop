unit UDescPrestacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, {UClassesPrestacao,} StdCtrls, Buttons, uEditMoeda, UpendPrestacao,
  EnterantHw, uEditHw; //, uDadosIni;

type
  TFrmDescPrestacao = class(TfrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    procedure EditHw2Enter(Sender: TObject);
    procedure EditHw1Enter(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDescPrestacao: TFrmDescPrestacao;
  //obDesc: TpendPrest;

implementation

uses DB;

{$R *.dfm}

procedure TFrmDescPrestacao.BitBtn1Enter(Sender: TObject);
begin
  inherited;
  if EditHw1.Text = '' then
    EditHw1.AsValue := 0;
  if EditHw2.Text = '' then
    EditHw2.AsValue := 0;
//  CadPendPrest.vValorCorrComDesc := CadPendPrest.dataSet.FieldByName('VALOR_CORR').Value - ((((CadPendPrest.dataSet.FieldByName('VALOR_CORR').Value * EditMoeda1.valor) / 100)) + EditMoeda2.valor);
  CadPendPrest.vValorCorrComDesc :=CadPendPrest.vValorCorrSemDesc - (((CadPendPrest.vValorCorrSemDesc * EditHw1.AsValue) / 100) + EditHw2.AsValue);
  CadPendPrest.vPercDescontoCalc := (((CadPendPrest.vValorCorrSemDesc - CadPendPrest.vValorCorrComDesc) * 100) / CadPendPrest.vValorCorrSemDesc);
  panel1.caption := 'R$' + format('%0.2f', [CadPendPrest.vValorCorrComDesc]);
end;

procedure TFrmDescPrestacao.EditHw1Enter(Sender: TObject);
begin
  inherited;
  if EditHw1.Text = '' then
    EditHw1.AsValue := 0;
  if EditHw2.Text = '' then
    EditHw2.AsValue := 0;
  CadPendPrest.vValorCorrComDesc := CadPendPrest.vValorCorrSemDesc - ((((CadPendPrest.vValorCorrSemDesc * EditHw1.AsValue) / 100)) + EditHw2.AsValue);
  panel1.caption := 'R$' + format('%n', [CadPendPrest.vValorCorrComDesc]);
end;

procedure TFrmDescPrestacao.EditHw2Enter(Sender: TObject);
begin
  inherited;
  if EditHw1.Text = '' then
    EditHw1.AsValue := 0;
  if EditHw2.Text = '' then
    EditHw2.AsValue := 0;
  CadPendPrest.vValorCorrComDesc :=
  CadPendPrest.vValorCorrSemDesc - ((((CadPendPrest.vValorCorrSemDesc * EditHw1.AsValue) / 100)) + EditHw2.AsValue);
  //CadPendPrest.dataSet.FieldByName('VALOR_CORR').Value - ((((CadPendPrest.dataSet.FieldByName('VALOR_CORR').Value * EditHw1.valor) / 100)) + EditHw2.valor);
  panel1.caption := 'R$' + format('%n', [CadPendPrest.vValorCorrComDesc]);
end;

procedure TFrmDescPrestacao.FormShow(Sender: TObject);
begin
  inherited;
  Panel1.Caption := 'R$' + format('%n', [CadPendPrest.vValorCorrSemDesc]); //'R$0,00';
  if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
  	EditHw1.SetFocus;
end;

end.

