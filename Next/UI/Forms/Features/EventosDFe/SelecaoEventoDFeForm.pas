unit SelecaoEventoDFeForm;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, TipoEventoDFeUnit;

type
  // Apenas apresenta as opções recebidas; a escolha pertence ao modal e a permissão ao apresentador.
  TfrmSelecaoEventoDFe = class(TForm)
    lbTipos: TListBox;
    btnOk: TButton;
    btnCancelar: TButton;
  private
    // Os códigos não são contíguos: o índice do item é convertido pela lista configurada.
    FTipos: TipoEventoDFeArray;
  public
    procedure Configurar(const AOpcoes: TipoEventoDFeArray);
    function TipoSelecionado: TipoEventoDFe;
  end;

implementation

{$R *.dfm}

uses
  System.SysUtils;

procedure TfrmSelecaoEventoDFe.Configurar(const AOpcoes: TipoEventoDFeArray);
var
  Indice: Integer;
begin
  FTipos := Copy(AOpcoes, 0, Length(AOpcoes));

  lbTipos.Items.Clear;
  for Indice := 0 to High(FTipos) do
    lbTipos.Items.Add(TipoEventoDFeDisplay(FTipos[Indice]));

  if lbTipos.Items.Count > 0 then
    lbTipos.ItemIndex := 0;
end;

function TfrmSelecaoEventoDFe.TipoSelecionado: TipoEventoDFe;
begin
  if (lbTipos.ItemIndex < 0) or (lbTipos.ItemIndex > High(FTipos)) then
    raise Exception.Create('O tipo de evento não foi selecionado.');

  Result := FTipos[lbTipos.ItemIndex];
end;

end.
