unit UResumoProdutosGruposFiscais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TFrmResumoProdutosGruposFiscaisSetup = record
//    class function Create(): TFrmResumoProdutosGruposFiscaisSetup; static;
  end;

  TFrmResumoProdutosGruposFiscais = class(TfrmPadrao)
    ScrollBox1: TScrollBox;
    pnTop: TPanel;
    Label1: TLabel;
    pnLog: TPanel;
    edLog: TMemo;
    pnAnexosGruposFiscaisImpSel: TPanel;
    lbQtdeAnexosISelDisplay: TLabel;
    lbQtdeAnexosISel: TLabel;
    btCriarGruposFiscaisImpSel: TSpeedButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    DateTimePicker2: TDateTimePicker;
    Panel3: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    btSair: TBitBtn;
    ProgressBar1: TProgressBar;
  private
    { Private declarations }
  public
    procedure Setup(const Input: TFrmResumoProdutosGruposFiscais);
  end;

var
  FrmResumoProdutosGruposFiscais: TFrmResumoProdutosGruposFiscais;

implementation

{$R *.dfm}

{ TFrmResumoProdutosGruposFiscais }

procedure TFrmResumoProdutosGruposFiscais.Setup(
  const Input: TFrmResumoProdutosGruposFiscais);
begin

end;

end.
