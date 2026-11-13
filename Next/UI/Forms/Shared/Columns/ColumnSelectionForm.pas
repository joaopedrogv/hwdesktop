unit ColumnSelectionForm;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls,
  NextBaseForm, ColumnSelectionFrame;

type
  // Dialogo local de configuracao de colunas. Nao e registrado no catalogo de
  // telas e nao e aberto pelo host: a selecao volta de forma sincrona ao frame
  // que o abriu. Aplicar confirma; Sair, Esc e o X descartam.
  TfrmColumnSelection = class(TfrmNextBase)
    pnConteudo: TPanel;
    fraColunas: TfrmColumnSelectionFrame;
    pnRodape: TPanel;
    btnSair: TButton;
    btnAplicar: TButton;
  public
    procedure Configure(const AEntries: TColumnSelectionEntries);
    function CollectSelection: TColumnSelectionResults;
  end;

implementation

{$R *.dfm}

procedure TfrmColumnSelection.Configure(
  const AEntries: TColumnSelectionEntries);
begin
  fraColunas.Configure(AEntries);

  // O foco inicial fica na lista para as setas e o espaco operarem os itens. A
  // propriedade ativa o controle quando o dialogo e exibido.
  ActiveControl := fraColunas.clbColunas;
end;

function TfrmColumnSelection.CollectSelection: TColumnSelectionResults;
begin
  Result := fraColunas.CollectSelection;
end;

end.
