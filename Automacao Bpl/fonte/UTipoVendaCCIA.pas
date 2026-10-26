unit UTipoVendaCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmTipoVendaCCIA = class(TForm)
    pnTipoVenda: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoVendaCCIA: TfrmTipoVendaCCIA;

implementation

uses
  uDtmAtivo, DB;

{$R *.dfm}

procedure TfrmTipoVendaCCIA.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.vDtSetTmp.IsEmpty then
  begin
    if vDadosIni.vDtSetTmp.State <> dsEdit then
     vDadosIni.vDtSetTmp.Edit;
    vDadosIni.vDtSetTmp.FieldByName('TIPO_VENDA_V').AsString := 'N';
    vDadosIni.vDtSetTmp.Post;
  end;
  ModalResult := mrOk;
end;

procedure TfrmTipoVendaCCIA.BitBtn2Click(Sender: TObject);
begin
  if not vDadosIni.vDtSetTmp.IsEmpty then
  begin
    if vDadosIni.vDtSetTmp.State <> dsEdit then
     vDadosIni.vDtSetTmp.Edit;
    vDadosIni.vDtSetTmp.FieldByName('TIPO_VENDA_V').AsString := 'U';
    vDadosIni.vDtSetTmp.Post;
  end;
  ModalResult := mrOk;   
end;

procedure TfrmTipoVendaCCIA.BitBtn3Click(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TfrmTipoVendaCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
    BitBtn3Click(Sender);
end;

procedure TfrmTipoVendaCCIA.FormShow(Sender: TObject);
begin
 vDadosIni.fechaStatusProcessamento;
end;

end.
