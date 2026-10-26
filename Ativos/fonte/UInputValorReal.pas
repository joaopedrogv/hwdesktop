unit UInputValorReal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, uEditMoeda;

type
  TFrmInputValorReal = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    EditMoeda1: TEditMoeda;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    BitBtn3: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInputValorReal: TFrmInputValorReal;

implementation

{$R *.dfm}

end.
