unit UcadConfigini;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TfrmCadConfigini = class(TfrmPadrao)
    Memo1: TMemo;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadConfigini: TfrmCadConfigini;
  vCaminhobancohw,vCaminhobancoFiscal : String;

implementation

{$R *.dfm}

uses
  uDtmAtivo, uDataSet_OOP, uDadosIni ;

procedure TfrmCadConfigini.BitBtn4Click(Sender: TObject);
begin
  inherited;
  with vDadosIni do
  begin
   Memo1.Lines.SaveToFile(ArqIni);
     Application.MessageBox('Arquivo de Configuração alterado com sucesso.',
     'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1 );
    LerConfigini; 
  end;
  Close;
end;

procedure TfrmCadConfigini.BitBtn5Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadConfigini.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadConfigini.ComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadConfigini.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadConfigini := nil;

end;

procedure TfrmCadConfigini.FormShow(Sender: TObject);
begin
  inherited;

  vCaminhobancohw := vDadosIni.GetBaseDados('Banco','HW');
  vCaminhobancoFiscal := vDadosIni.GetBaseDados('Banco','Fiscal');

  with vDadosIni do
  begin
     try
       ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
       if not FileExists(ArqIni) then
         ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
       Memo1.Lines.LoadFromFile(ArqIni);
       Panel1.Caption:='Caminho: '+ArqIni;
     except
     end;
  end;

  if (Self.Enabled) and (Self.Visible) and (Memo1.CanFocus) then
  	Memo1.SetFocus;
end;

end.
