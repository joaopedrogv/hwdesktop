unit uTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uEditMoeda, Buttons, Spin, ComCtrls, EnterantHw;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    EditMoeda1: TEditMoeda;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    EditMoeda2: TEditMoeda;
    Label4: TLabel;
    SpinEdit1: TSpinEdit;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox3: TComboBox;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ComboBox4: TComboBox;
    Label17: TLabel;
    ComboBox5: TComboBox;
    Label18: TLabel;
    DateTimePicker1: TDateTimePicker;
    CheckBox1: TCheckBox;
    Edit4: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    EnterHw1: TEnterHw;
    BitBtn2: TBitBtn;
    Cancelamento: TButton;
    existe: TButton;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure existeClick(Sender: TObject);
    procedure CancelamentoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  hndl: THandle;

implementation

uses uClasseFP, uFuncoes, uDtmFormPag;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var

  codcondpag, codcliente, codvendedor, codOp, codUsu: integer;
  nomeUs: string;

begin
  codcondpag := StrToInt(copy(ComboBox1.Text, 1, Pos('-', ComboBox1.Text) - 1));
  codcliente := StrToInt(copy(ComboBox2.Text, 1, Pos('-', ComboBox2.Text) - 1));
  codvendedor := StrToInt(copy(ComboBox3.Text, 1, Pos('-', ComboBox3.Text) - 1));
  codOp := StrToInt(copy(ComboBox5.Text, 1, Pos('-', ComboBox5.Text) - 1));
  codUsu := StrToInt(copy(ComboBox4.Text, 1, Pos('-', ComboBox4.Text) - 1));
  nomeUs := ComboBox4.Text;
  if hndl = 0 then
  begin
    CarregaPacote(Edit4.Text, hndl);
    dtmFP := TdtmFP.Create(Self);
    dtmFP.criaDtm;
    vDadosIniFP.codEmpresa := '1';
    vDadosIniFP.vCodUsuario := 1;
    vDadosIniFP.vCodOpCxl := 1;
    //  vDadosIniFP.iniciaPacote(Edit1.Text, Edit2.Text, nomeUs, 'S', Edit3.Text, 10, codUsu,codOp, 100,   DateTimePicker1.date, CheckBox1.Checked);
  end;
  if dtmFP.iniciaFormaPagamento(trunc(EditMoeda2.Valor), codcondpag, SpinEdit1.Value, codcliente,
    codvendedor, ListBox1.Items[ListBox1.ItemIndex], EditMoeda1.Valor) then
    ShowMessage('Deu');
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  obFormPag.detalhamentoVenda(StrToInt(Edit5.Text), Edit6.Text);
end;

procedure TForm1.CancelamentoClick(Sender: TObject);
begin
  obFormPag.cancelaVenda(StrToInt(Edit5.Text), Edit6.Text);
end;

procedure TForm1.existeClick(Sender: TObject);
begin
  if obFormPag.existeRecebimento(StrToInt(Edit7.Text), StrToInt(Edit5.Text), Edit6.Text,) then
    ShowMessage('Verdadeiro')
  else
    ShowMessage('Falso');
end;

end.

