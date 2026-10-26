unit uAlterarChassiPlaca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, uDadosIni, IBQuery;

type
  TfrmAlterarChassiPlaca = class(TForm)
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    lbChassi: TLabel;
    lbPlaca: TLabel;
    EdChassi: TEdit;
    EdPlaca: TEdit;
    ckAlterarInfOsOrcNF: TCheckBox;
    procedure ckAlterarInfOsOrcNFClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  	procedure AtualizarPlaca;
  private
    { Private declarations }
  public
    { Public declarations }
    vChassi: string;
    vPlaca: string;
    vBuscas: TIBQuery;
  end;

var
  frmAlterarChassiPlaca: TfrmAlterarChassiPlaca;

implementation

uses
  uDtmAtivo;

{$R *.dfm}

procedure TfrmAlterarChassiPlaca.AtualizarPlaca;
var
 vNumeroOld: string;
 vNumeroNew: string;
 vtemp: string;
begin
	if RadioGroup1.ItemIndex = 1 then
  begin
  	EdChassi.Text := vChassi;
    EdPlaca.Text := vPlaca;
  end;

  if vDadosIni.vVeic.vDesabilitarChassi then
  begin
    lbChassi.Visible :=	false;
  	EdChassi.Visible :=	false;
  end
  else
  begin
		lbChassi.Visible :=	RadioGroup1.ItemIndex = 1;
  	EdChassi.Visible :=	RadioGroup1.ItemIndex = 1;
  end;
//  lbPlaca.Visible :=	RadioGroup1.ItemIndex = 1;
//  EdPlaca.Visible :=  RadioGroup1.ItemIndex = 1;

	lbChassi.Left := 8;
  EdChassi.Left := 49;
  lbPlaca.Left := 291;
  EdPlaca.Left := 326;

	if RadioGroup1.ItemIndex = 0 then
  begin
  	lbPlaca.Left := 8;
    EdPlaca.Left := 49;
  end
  else if vDadosIni.vVeic.vDesabilitarChassi then
  begin
    lbPlaca.Left := 8;
    EdPlaca.Left := 49;
  end;

  EdPlaca.Enabled :=  RadioGroup1.ItemIndex = 1;

  if RadioGroup1.ItemIndex = 0 then
  begin
    vNumeroOld := trim(vDadosIni.apenasNumeros(vPlaca));
    while Length(vNumeroOld) > 4 do
      vNumeroOld := Copy(vNumeroOld, 2, Length(vNumeroOld) - 1);

    if Length(vNumeroOld) = 4 then
    begin
      vtemp := Copy(vNumeroOld, 2, 1);

      vNumeroNew := Copy(vNumeroOld, 1, 1);
      if vtemp = '0' then
        vNumeroNew := vNumeroNew + 'A'
      else if vtemp = '1' then
        vNumeroNew := vNumeroNew + 'B'
      else if vtemp = '2' then
        vNumeroNew := vNumeroNew + 'C'
      else if vtemp = '3' then
        vNumeroNew := vNumeroNew + 'D'
      else if vtemp = '4' then
        vNumeroNew := vNumeroNew + 'E'
      else if vtemp = '5' then
        vNumeroNew := vNumeroNew + 'F'
      else if vtemp = '6' then
        vNumeroNew := vNumeroNew + 'G'
      else if vtemp = '7' then
        vNumeroNew := vNumeroNew + 'H'
      else if vtemp = '8' then
        vNumeroNew := vNumeroNew + 'I'
      else if vtemp = '9' then
        vNumeroNew := vNumeroNew + 'J'
      else
        vNumeroNew := vNumeroNew + vtemp;
      vNumeroNew := vNumeroNew + Copy(vNumeroOld, 3, 2);

      EdPlaca.Text := StringReplace(trim(vPlaca), trim(vNumeroOld), trim(vNumeroNew), [rfReplaceAll]);
    end;
  end;
end;

procedure TfrmAlterarChassiPlaca.BitBtn4Click(Sender: TObject);
var
  vtemp: string;
begin
  if RadioGroup1.ItemIndex = 0 then
  begin
  	if trim(vPlaca) = trim(EdPlaca.Text) then
    begin
      Application.MessageBox('Placa deve ser alterada.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;
  end
  else
  begin
  	if vDadosIni.vVeic.vDesabilitarChassi then
    begin
    	if (trim(vPlaca) = trim(EdPlaca.Text)) then
      begin
        Application.MessageBox('Placa deve ser alterada.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        exit;
      end;
    end
    else
    begin
      if (trim(vPlaca) = trim(EdPlaca.Text)) and (trim(vChassi) = trim(edChassi.Text)) then
      begin
        Application.MessageBox('Placa ou Chassi deve ser alterada.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        exit;
      end;
    end;
  end;

  vtemp := vDadosIni.IfThen(RadioGroup1.ItemIndex = 0,
    'Deseja converter placa antiga para placa nova?',
    vDadosIni.IfThen(vDadosIni.vVeic.vDesabilitarChassi,
  		'Deseja alterar placa?',
      'Deseja alterar placa / chassi?'));

  if Application.MessageBox(pchar(vtemp), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
  	exit;

	ModalResult := mrOk;
end;

procedure TfrmAlterarChassiPlaca.BitBtn5Click(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

procedure TfrmAlterarChassiPlaca.ckAlterarInfOsOrcNFClick(Sender: TObject);
begin
  if not ckAlterarInfOsOrcNF.Checked then
  begin
    if not vDadosIni.PesqPros('VEI171', 'DESABILITAR - ' +
    	'Placa: ' + vPlaca + ' Chassi: ' + vChassi, '', 'VEICULOS', '', vBuscas, true) then
    begin
    	ckAlterarInfOsOrcNF.Checked := true;
      Exit;
    end;
  end;
end;

procedure TfrmAlterarChassiPlaca.FormShow(Sender: TObject);
begin
	EdChassi.Text := vChassi;
  EdPlaca.Text  := vPlaca;
	AtualizarPlaca;
end;

procedure TfrmAlterarChassiPlaca.RadioGroup1Click(Sender: TObject);
begin
	AtualizarPlaca;
end;

end.
