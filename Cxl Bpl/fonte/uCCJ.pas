unit uCCJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, uEditMoeda, Buttons, Mask, ExtCtrls;

type
  TfrmCCJ = class(TfrmPadrao)
    Panel2: TPanel;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    MaskEdit2: TMaskEdit;
    EditMoeda1: TEditMoeda;
    EditMoeda2: TEditMoeda;
    procedure EditMoeda2Exit(Sender: TObject);
    procedure EditMoeda1Exit(Sender: TObject);
    procedure EditMoeda1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCCJ: TfrmCCJ;

implementation

{$R *.dfm}

procedure TfrmCCJ.BitBtn1Click(Sender: TObject);
var
 vDias_j: Extended;
 vl_juros: Extended;
begin
  try
    vDias_j:=strtodate(Maskedit2.text)-strtodate(Maskedit1.text);
    vl_juros:=((((EditMoeda2.Valor/30)*vDias_j)*EditMoeda1.Valor)/100);
    label9.caption:=Format('%n',[vDias_j]);
    label10.Caption:=Format('%m', [vl_juros]);
    label8.caption:=Format('%m', [EditMoeda1.Valor+vl_juros]);
    label8.visible:=True;
    label9.visible:=True;
    label10.visible:=True;

  except on E: Exception do
    begin
      Application.MessageBox('Valores digitados inválidos', 'Atenção', 64);
    end;
  end;
end;

procedure TfrmCCJ.BitBtn2Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCCJ.EditMoeda1Change(Sender: TObject);
begin
  inherited;
  BitBtn1.Enabled:=True;
end;

procedure TfrmCCJ.EditMoeda1Exit(Sender: TObject);
begin
  inherited;
  EditMoeda1.Valor := EditMoeda1.Valor;
end;

procedure TfrmCCJ.EditMoeda2Exit(Sender: TObject);
begin
  inherited;
  EditMoeda2.Valor := EditMoeda2.Valor;
end;

procedure TfrmCCJ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCCJ := nil;
end;

procedure TfrmCCJ.FormShow(Sender: TObject);
begin
  inherited;
  Label8.Visible:=False;
  Label9.Visible:=False;
  Label10.Visible:=False;
  BitBtn1.enabled:=False;
  Maskedit1.SetFocus;
end;

end.
