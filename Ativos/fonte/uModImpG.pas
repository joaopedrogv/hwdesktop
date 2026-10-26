unit uModImpG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TFrModImpG = class(TfrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label2: TLabel;
    ComboBoxNomeImpressora: TComboBox;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrModImpG: TFrModImpG;

implementation

uses
  uDtmAtivo, uDadosIni,Printers;

{$R *.dfm}

procedure TFrModImpG.BitBtn4Click(Sender: TObject);
begin
  inherited;
  vDadosIni._GravaConfiguracoesString('ComboBoxNomeImpressora'+vDadosIni.vNomeUsuario,ComboBoxNomeImpressora.Text);
  ModalResult := IDOK;
end;

procedure TFrModImpG.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TFrModImpG.FormShow(Sender: TObject);
var
  i:integer;
begin
  inherited;
  ComboBoxNomeImpressora.Clear;
  for I := 0 to Printer.Printers.Count - 1 do
    ComboBoxNomeImpressora.Items.Add(Printer.Printers.Strings[I]);
  ComboBoxNomeImpressora.ItemIndex := ComboBoxNomeImpressora.Items.IndexOf(vDadosIni._LerConfiguracoesRegistroString('ComboBoxNomeImpressora'+vDadosIni.vNomeUsuario));
  ComboBoxNomeImpressora.Text := ComboBoxNomeImpressora.Items[ComboBoxNomeImpressora.ItemIndex];
  if ComboBoxNomeImpressora.ItemIndex<0 then
    ComboBoxNomeImpressora.ItemIndex := 0;
  Combobox1.Text:= vdadosini.vImp_Us;
end;

end.
