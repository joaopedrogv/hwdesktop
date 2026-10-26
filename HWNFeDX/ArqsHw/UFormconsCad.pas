unit UFormconsCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, DB,UClasseNFe;

type
  TFrmConsCad = class(TForm)
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DtEstados: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vuf: string;
  end;

var
  FrmConsCad: TFrmConsCad;
  cadestados: Testado;

implementation

uses UFuncoesDll, UDtmHwNFE;

{$R *.dfm}

procedure TFrmConsCad.BitBtn1Click(Sender: TObject);
begin
 if (Length(trim(edit1.text)) <> 14) and (length(trim(edit1.text)) <> 11) then
 begin
   Application.MessageBox(pchar('Digitos do CPF/CNPJ incorretos 11 digitos para CPF e 14 para CNPJ'),Pchar('Error'), MB_OK);
   exit;
 end
 else
 begin
   ConsultaCadastro(pchar(cadestados.dataset.fieldbyname('SIGLA_UF').asstring),Pchar(edit1.text),'S');
 end;
end;

procedure TFrmConsCad.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TFrmConsCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 cadestados.Free;
end;

procedure TFrmConsCad.FormShow(Sender: TObject);
begin
 cadestados:=Testado.create;
 cadestados.abrirestados(vuf);
end;

end.
