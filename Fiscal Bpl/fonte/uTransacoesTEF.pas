unit uTransacoesTEF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask, uTransTef;

type
  TfrmTransacoesTEF = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    transacao: TTransacoesTEF;
  public
    { Public declarations }
  end;

var
  frmTransacoesTEF: TfrmTransacoesTEF;

implementation

uses uDtmTef, udtmAtivo;

{$R *.dfm}

procedure TfrmTransacoesTEF.BitBtn2Click(Sender: TObject);
begin
  transacao.AbreTransacoes(MaskEdit1.Text, MaskEdit2.Text);
end;

procedure TfrmTransacoesTEF.BitBtn3Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGrid1, 'Trançôes TEF');
end;

procedure TfrmTransacoesTEF.FormCreate(Sender: TObject);
begin
  transacao := TTransacoesTEF.Create;
  MaskEdit1.Text := DateToStr(Date);
  MaskEdit2.Text := DateToStr(Date);
  transacao.AbreTransacoes(MaskEdit1.Text, MaskEdit2.Text);
end;

end.
