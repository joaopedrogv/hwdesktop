unit UDadosReaisVeiculosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, uEditHw;

type
  TfrmDadosReaisVeiculosCCIA = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    GroupBox16: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label32: TLabel;
    Shape1: TShape;
    GroupBox17: TGroupBox;
    Label91: TLabel;
    Label92: TLabel;
    GroupBox18: TGroupBox;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    EditHw3: TEditHw;
    EditHw4: TEditHw;
    EditHw5: TEditHw;
    Label95: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditHw7: TEditHw;
    EditHw6: TEditHw;
    EditHw9: TEditHw;
    EditHw10: TEditHw;
    EditHw8: TEditHw;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDadosReaisVeiculosCCIA: TfrmDadosReaisVeiculosCCIA;

implementation

{$R *.dfm}

procedure TfrmDadosReaisVeiculosCCIA.BitBtn4Click(Sender: TObject);
begin
  inherited;
 { if EditHw1.AsValue <= 0 then
  begin
    Application.MessageBox('Valor real da compra deve ser informado!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
      EditHw1.SetFocus;
    exit;
  end;
  if EditHw2.AsValue <= 0 then
  begin
    Application.MessageBox('Valor real da venda deve ser informado!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
      EditHw2.SetFocus;
    exit;
  end;
  if EditHw3.AsValue < 0 then
  begin
    Application.MessageBox('Participação do vendedor não deve ser menor que zero!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw3.CanFocus) then
      EditHw3.SetFocus;
    exit;
  end;
  if EditHw4.AsValue < 0 then
  begin
    Application.MessageBox('Participação do gerente não deve ser menor que zero!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw4.CanFocus) then
      EditHw4.SetFocus;
    exit;
  end;
  if EditHw5.AsValue < 0 then
  begin
    Application.MessageBox('Comissão do banco não deve ser menor que zero!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
      EditHw5.SetFocus;
    exit;
  end;
  if EditHw6.AsValue < 0 then
  begin
    Application.MessageBox('Coeficiente utilizado não deve ser menor que zero!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw6.CanFocus) then
      EditHw6.SetFocus;
    exit;
  end;
  if EditHw7.AsValue < 0 then
  begin
    Application.MessageBox('Despesa Financeira não deve ser menor que zero!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw7.CanFocus) then
      EditHw7.SetFocus;
    exit;
  end;
  if EditHw8.AsValue < 0 then
  begin
    Application.MessageBox('Bonificação de Fabrica não deve ser menor que zero!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw8.CanFocus) then
      EditHw8.SetFocus;
    exit;
  end;
  if EditHw9.AsValue < 0 then
  begin
    Application.MessageBox('Participação do retorno do banco para o vendedor não deve ser menor que zero!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw9.CanFocus) then
      EditHw9.SetFocus;
    exit;
  end;
  if EditHw10.AsValue < 0 then
  begin
    Application.MessageBox('Participação do retorno do banco para o gerente não deve ser menor que zero!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHw10.CanFocus) then
      EditHw10.SetFocus;
    exit;
  end;  }

  ModalResult := mrOk;
end;

procedure TfrmDadosReaisVeiculosCCIA.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.
