unit uFechamentoReqNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls;

type
  TfrmFechamentoReqNF = class(TfrmPadrao)
    pnGerarNF: TPanel;
    Label173: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    BitBtn67: TBitBtn;
    BitBtn72: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn67Click(Sender: TObject);
    procedure BitBtn72Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechamentoReqNF: TfrmFechamentoReqNF;

implementation

{$R *.dfm}

procedure TfrmFechamentoReqNF.BitBtn67Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDOK;
end;

procedure TfrmFechamentoReqNF.BitBtn72Click(Sender: TObject);
begin
  inherited;
  ModalResult := IDCANCEL;
end;

procedure TfrmFechamentoReqNF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmFechamentoReqNF := nil;
end;

end.
