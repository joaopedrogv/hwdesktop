unit UCancTransTef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Mask, Buttons, ExtCtrls, uEditMoeda;

type
  TfrmCancTransTef = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edDataTransacao: TMaskEdit;
    edHoraTransacao: TMaskEdit;
    ListBox1: TListBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    edNSUTransacao: TMaskEdit;
    edValorTotalC: TEditMoeda;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure edValorTotalCExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCancTransTef: TfrmCancTransTef;

implementation

uses UDtmAtivo, uDadosIni;

{$R *.dfm}

procedure TfrmCancTransTef.BitBtn4Click(Sender: TObject);
var
  valCanc: string;
begin                            
  inherited;
  {try
  valCanc := edValorTotalC.Text;
  delete(valCanc,pos(',',valCanc),1);
  edValorTotalC.Text:=valCanc;
  except
    Application.MessageBox('Erro de conversão de valores','Atenção',MB_ICONWARNING+MB_OK);
    Exit;
  end;
  }
  ModalResult := mrOk;
end;

procedure TfrmCancTransTef.BitBtn5Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmCancTransTef.edValorTotalCExit(Sender: TObject);
begin
  inherited;
  if trim(edValorTotalC.Text )= ''   then
  Exit;
  edValorTotalC.Text :=   trim(format('%10.2f',[strtocurr(edValorTotalC.Text)]));
end;

procedure TfrmCancTransTef.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmCancTransTef.FormShow(Sender: TObject);
begin
  inherited;
  ListBox1.ItemIndex :=0;

//  if vDadosIni.vUsaTef = 'E'then
//  begin
//     ListBox1.Visible := false;
//
//     Label24.Left := Label24.Left - 60;
//     edNSUTransacao.Left := edNSUTransacao.Left - 60;
//     Label21.Left := Label21.Left - 60;
//     edValorTotalC.Left := edValorTotalC.Left - 60;
//     Label22.Left := Label22.Left - 60;
//     edDataTransacao.Left := edDataTransacao.Left - 60;
//     Label23.Left := Label23.Left - 60;
//     edHoraTransacao.Left := edHoraTransacao.Left - 60;
//     
//  end;

end;

end.
