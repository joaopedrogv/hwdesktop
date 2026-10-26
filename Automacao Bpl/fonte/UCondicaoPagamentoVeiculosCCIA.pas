unit UCondicaoPagamentoVeiculosCCIA;
(************************ Hw Sistemas e Computadores ***************************
1 - Se for uma nova venda salvar dados em tabela temporária, se for alteração
já alterar direto na tabela.
*******************************************************************************)
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons;

type
  TfrmCondicaoPagamentoCCIA = class(TfrmPadrao)
    Panel1: TPanel;
    DBLookupComboBox5: TDBLookupComboBox;
    Label29: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Panel6: TPanel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    DBGrid3: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCondicaoPagamentoCCIA: TfrmCondicaoPagamentoCCIA;

implementation

{$R *.dfm}

end.
