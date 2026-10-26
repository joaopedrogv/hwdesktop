unit UInutilizarNFE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,dateutils;

type
  TFrmInutilizarNFes = class(TForm)
    MskCNPJ: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    Label5: TLabel;
    MaskEdit3: TMaskEdit;
    Label6: TLabel;
    MaskEdit4: TMaskEdit;
    Label7: TLabel;
    MaskEdit5: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vresposta: WideString;
  end;

var
  FrmInutilizarNFes: TFrmInutilizarNFes;

implementation

function InutilizarNFe(justificativa, cnpjemit, modelo, serie, ano, numeroinicial, numerofinal: WideString): WideString; stdcall; external 'hw.nfe.dx.dll';
{$R *.dfm}

procedure TFrmInutilizarNFes.BitBtn1Click(Sender: TObject);
begin
 //justificativa,cnpjemit,modelo,serie,ano,numeroinicial,numerofinal: pchar
// testar se a sequência de nf existe aqui...
 vresposta:=InutilizarNFe((MaskEdit1.text),(MskCNPJ.text),(ComboBox1.text),(MaskEdit2.text),(MaskEdit3.text),
 (MaskEdit4.text),(MaskEdit5.text));
end;

procedure TFrmInutilizarNFes.ComboBox1Exit(Sender: TObject);
begin
 if ComboBox1.Text = '' then
 begin
   Application.MessageBox('Modelo da NF-e Não informado', 'Atenção', MB_ICONWARNING + MB_OK);
   MaskEdit1.SetFocus;
 end;
end;

procedure TFrmInutilizarNFes.FormShow(Sender: TObject);
begin
 try
  Icon.LoadFromFile(ExtractFilePath(Application.Exename)+'icone.ico');
 except
 end;
 maskedit3.text:=inttostr(YearOf(Date));
end;

procedure TFrmInutilizarNFes.MaskEdit1Exit(Sender: TObject);
begin
 if maskedit1.Text = '' then
 begin
   Application.MessageBox('Justificativa Não informada', 'Atenção', MB_ICONWARNING + MB_OK);
   MaskEdit1.SetFocus;
 end;
end;

procedure TFrmInutilizarNFes.MaskEdit2Exit(Sender: TObject);
begin
 if maskedit2.Text = '' then
 begin
   Application.MessageBox('Série Não informada', 'Atenção', MB_ICONWARNING + MB_OK);
   MaskEdit2.SetFocus;
 end;
end;

procedure TFrmInutilizarNFes.MaskEdit3Exit(Sender: TObject);
begin
 if maskedit3.Text = '' then
 begin
   Application.MessageBox('Ano Não informado', 'Atenção', MB_ICONWARNING + MB_OK);
   MaskEdit3.SetFocus;
 end;
end;

procedure TFrmInutilizarNFes.MaskEdit4Exit(Sender: TObject);
begin
 if maskedit4.Text = '' then
 begin
   Application.MessageBox('Nº NF-e inicial Não informado', 'Atenção', MB_ICONWARNING + MB_OK);
   MaskEdit4.SetFocus;
 end;
end;

procedure TFrmInutilizarNFes.MaskEdit5Exit(Sender: TObject);
begin
 if maskedit5.Text = '' then
 begin
   Application.MessageBox('Nº NF-e inicial Não informado', 'Atenção', MB_ICONWARNING + MB_OK);
   MaskEdit5.SetFocus;
 end;
end;

end.
