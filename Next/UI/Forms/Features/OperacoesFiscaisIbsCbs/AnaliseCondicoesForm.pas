unit AnaliseCondicoesForm;

interface

uses
  System.Classes, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls,
  NextBaseForm;

type
  // Diálogo local de conferência das condições. Apenas apresenta o resumo e o
  // relatório; Copiar escreve o relatório no clipboard e Fechar encerra.
  TfrmAnaliseCondicoes = class(TfrmNextBase)
    pnResumo: TPanel;
    lblResumo: TLabel;
    pnRodape: TPanel;
    btnFechar: TButton;
    btnCopiar: TButton;
    pnRelatorio: TPanel;
    MemoRelatorio: TMemo;
    procedure btnCopiarClick(Sender: TObject);
  public
    procedure Configure(const AResumo, ARelatorio: string);
  end;

implementation

{$R *.dfm}

uses
  Vcl.Clipbrd;

const
  CopyFailureMessage = 'Não foi possível copiar o relatório.';

procedure TfrmAnaliseCondicoes.Configure(const AResumo, ARelatorio: string);
begin
  lblResumo.Caption := AResumo;
  MemoRelatorio.Text := ARelatorio;
end;

procedure TfrmAnaliseCondicoes.btnCopiarClick(Sender: TObject);
begin
  try
    Clipboard.AsText := MemoRelatorio.Text;
  except
    ShowError(CopyFailureMessage);
  end;
end;

end.
