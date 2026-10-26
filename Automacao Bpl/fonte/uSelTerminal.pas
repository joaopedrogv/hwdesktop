unit uSelTerminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, Mask, ComCtrls;

type
  TfrmSelTerminalF = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelTerminalF: TfrmSelTerminalF;

implementation

uses UdtmTerminalF;

{$R *.dfm}

procedure TfrmSelTerminalF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TfrmSelTerminalF.BitBtn2Click(Sender: TObject);
begin
  inherited;
ModalResult := mrCancel;
end;

end.
