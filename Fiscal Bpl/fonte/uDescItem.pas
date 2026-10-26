unit uDescItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls, uEditMoeda;

type
  TfrmDescItem = class(TfrmPadrao)
    EditMoeda1: TEditMoeda;
    EditMoeda2: TEditMoeda;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure EditMoeda2Exit(Sender: TObject);
    procedure EditMoeda1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDescItem: TfrmDescItem;

implementation

uses uPrincipalF, uDadosIniFiscal;

{$R *.dfm}

procedure TfrmDescItem.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmDescItem.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmDescItem.EditMoeda1Exit(Sender: TObject);
begin
  inherited;
  if EditMoeda1.Valor < 0 then
  begin
    Application.MessageBox('Valor menor ou igual a zero não é permitido', 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    EditMoeda1.SetFocus;
    exit;
  end;
end;

procedure TfrmDescItem.EditMoeda2Exit(Sender: TObject);
begin
  inherited;
  if EditMoeda2.Valor < 0 then
  begin
    Application.MessageBox('Valor menor ou igual a zero não é permitido', 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    EditMoeda2.SetFocus;
    exit;
  end;
end;

procedure TfrmDescItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV = 'S' then
  begin
    if (key = 13) and (ActiveControl <> EditMoeda1) and (ActiveControl <> EditMoeda2) then
    begin
      ModalResult := mrOk;
    end
    else if (Key = VK_ESCAPE) then
    begin
      ModalResult := mrCancel;
      close;
    end;
  end
  else
  begin
    if key = VK_F3 then
		begin
			if EditMoeda1.Valor < 0 then
				EditMoeda1.Valor := 0;
			if EditMoeda2.Valor < 0 then
				EditMoeda2.Valor := 0;
      ModalResult := mrOk;
    end
    else if (Key = VK_ESCAPE) then
    begin
      ModalResult := mrCancel;
      close;
    end;
  end;
end;
procedure TfrmDescItem.FormShow(Sender: TObject);
begin
  inherited;
  if vDadosIniF.vUsaTecladoPDV = 'S' then  
    BitBtn1.Caption := 'OK';
end;

end.

