unit UCadNFSeEnviarEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, Mask, ExtCtrls;

type
  FrmCadNFSeEnviarEmailOutput = record
  private
    FEmail: string;
    FUnicoEmail: Boolean;
    FAnexarPDF: Boolean;
  public
    class function Create(
      const AEmail: string; AUnicoEmail, AAnexarPDF: Boolean
    ): FrmCadNFSeEnviarEmailOutput; static;

    property Email: string read FEmail;
    property UnicoEmail: Boolean read FUnicoEmail;
    property AnexarPDF: Boolean read FAnexarPDF;
  end;

  TFrmCadNFSeEnviarEmail = class(TfrmPadrao)
    pnContent: TPanel;
    pnBtns: TPanel;
    lbCaption: TLabel;
    ckUnicoEmail: TCheckBox;
    ckAnexarPDF: TCheckBox;
    Label1: TLabel;
    edEmail: TMaskEdit;
    btEnviarEmail: TBitBtn;
    procedure btEnviarEmailClick(Sender: TObject);
    procedure ckUnicoEmailClick(Sender: TObject);
  private
  public
    procedure Setup(const ACaption, AEmail: string; AUmaNFSeSomente: Boolean);
    function GetResult(): FrmCadNFSeEnviarEmailOutput;
  end;

var
  FrmCadNFSeEnviarEmail: TFrmCadNFSeEnviarEmail;

implementation

{$R *.dfm}

{ TFrmCadNFSeEnviarEmail }

procedure TFrmCadNFSeEnviarEmail.btEnviarEmailClick(Sender: TObject);
begin
  if not ckUnicoEmail.Checked or (Trim(edEmail.Text) <> '') then
    ModalResult := mrOk;  
end;

procedure TFrmCadNFSeEnviarEmail.ckUnicoEmailClick(Sender: TObject);
begin
  edEmail.Enabled := ckUnicoEmail.Checked;
end;

function TFrmCadNFSeEnviarEmail.GetResult: FrmCadNFSeEnviarEmailOutput;
begin
  Result := FrmCadNFSeEnviarEmailOutput.Create(
    edEmail.Text, ckUnicoEmail.Checked, ckAnexarPDF.Checked
  );
end;

procedure TFrmCadNFSeEnviarEmail.Setup(const ACaption, AEmail: string; AUmaNFSeSomente: Boolean);
begin
  lbCaption.Caption    := ACaption;
  ckUnicoEmail.Checked := AUmaNFSeSomente;
  ckAnexarPDF.Checked  := AUmaNFSeSomente;
  edEmail.Text         := AEmail;

  //ckAnexarPDF.Visible  := AUmaNFSeSomente;
  ckUnicoEmail.Enabled := not AUmaNFSeSomente;
  edEmail.Enabled      := AUmaNFSeSomente;
end;

{ FrmCadNFSeEnviarEmailOutput }

class function FrmCadNFSeEnviarEmailOutput.Create(
  const AEmail: string; AUnicoEmail, AAnexarPDF: Boolean
): FrmCadNFSeEnviarEmailOutput;
begin
  Result.FEmail := AEmail;
  Result.FUnicoEmail := AUnicoEmail;
  Result.FAnexarPDF := AAnexarPDF;
end;

end.
