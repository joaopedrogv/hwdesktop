unit UFopag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, Buttons, uEditMoeda, Grids;

type
  TFrmFopag = class(TfrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    EdtValorFolha: TEditMoeda;
    Label3: TLabel;
    EdtNumeroFunc: TEditMoeda;
    Label4: TLabel;
    EdtSalMedio: TEditMoeda;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Label6: TLabel;
    EdtNFuncSairam: TEditMoeda;
    Label7: TLabel;
    EdtINSS: TEditMoeda;
    Label8: TLabel;
    EdtFGTS: TEditMoeda;
    Label9: TLabel;
    EdttotalFGTS: TEditMoeda;
    Label10: TLabel;
    EdtTotalINSS: TEditMoeda;
    Label11: TLabel;
    StProvisoes: TStringGrid;
    Label12: TLabel;
    EdtTotalGastoMes: TEditMoeda;
    Label13: TLabel;
    EdtTotalProvisoes: TEditMoeda;
    BitBtn2: TBitBtn;
    Label14: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label15: TLabel;
    BitBtn3: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure EdtFGTSExit(Sender: TObject);
    procedure EdtNFuncSairamExit(Sender: TObject);
    procedure EdtINSSExit(Sender: TObject);
    procedure EdtNumeroFuncExit(Sender: TObject);
    procedure EdtValorFolhaExit(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function somarValores: boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    vcadempresa: string;
  end;

var
  FrmFopag: TFrmFopag;


implementation

uses UCtSalGestor, UClassesGestor,uDtmAtivo, DB;

{$R *.dfm}

procedure TFrmFopag.BitBtn1Click(Sender: TObject);
var
 caddespesas: TDespesasGestor;
begin
  inherited;
  caddespesas:=TDespesasGestor.create;
  if RadioButton1.Checked then
    caddespesas.vregime:='COMP'
  else
   caddespesas.vregime:='CAIXA';
  try
   caddespesas.vmesvendas:=StrToInt(Edit1.text);
   caddespesas.vanovendas:=StrToInt(Edit2.text);
  except
   Application.MessageBox('Mês e Ano não informado(s) ou informado(s) incorretamente!', 'Confirmação', MB_OK);
   exit;
  end;
  if not caddespesas.contasFopag(ComboBox1.text,1,vcadempresa, 'P') then
  begin
   caddespesas.Free;
   Exit
  end;
  Application.CreateForm(TFrmContasSalario,FrmContasSalario);
  if FrmContasSalario.ShowModal = mrOk then
  begin
    caddespesas.contasFopag(ComboBox1.text,2,vcadempresa, 'P');
    EdtValorFolha.Valor:=caddespesas.vvaldespped;
    Panel3.Enabled:=true;
//    somarValores;
  end
  else
   Panel3.Enabled:=false;
  caddespesas.Free;
  FrmContasSalario.Free;
  if (Self.Enabled) and (Self.Visible) and (EdtValorFolha.CanFocus) then
  	EdtValorFolha.SetFocus;
end;

procedure TFrmFopag.BitBtn2Click(Sender: TObject);
var
 caddespesas: TDespesasGestor;
 vdia: string;
 vtiposal: integer;
begin
  inherited;
  if EdtTotalProvisoes.Valor <= 0  then
  begin
    Application.MessageBox('Sem Valor para Lançar', 'Confirmação', MB_OK);
    Exit;
  end;
  try
    InputQuery('Data de Vencimento', 'Digite a Data de Vencimento formato DD/MM/AAAA: ', vdia);
    StrToDate(vdia);
  except
    Application.MessageBox('Data de Vencimento inválida', 'Confirmação', MB_OK);
    Exit;
  end;
 caddespesas:=TDespesasGestor.create;
 if not vDadosIni.PesqPros('GES047','GRAVAR','MES/ANO '+edit1.text+'/'+edit2.text,'','',caddespesas.buscas,True) then
  Exit;
 try
  caddespesas.vmesvendas:=StrToInt(Edit1.text);
  caddespesas.vanovendas:=StrToInt(Edit2.text);
 except
  Application.MessageBox('Mês e Ano não informado(s) ou informado(s) incorretamente!', 'Confirmação', MB_OK);
  exit;
 end;
 if ComboBox1.Text = 'FIXO' then
  vtiposal:=1
 else
  vtiposal:=2;
 Application.MessageBox('É necessário escolher uma Conta', 'Confirmação', MB_OK);
 Application.CreateForm(TFrmContasSalario,FrmContasSalario);
 caddespesas.visualizadespesas;
 if FrmContasSalario.ShowModal = mrOk then
 begin
   caddespesas.vvaldespped:=caddespesas.dataSet.FieldByName('N_CONTA_PLC').AsCurrency;
   caddespesas.gravaProvisoes(vcadempresa,vdia,EdtTotalProvisoes.valor,vtiposal);
 end;
 FrmContasSalario.Free;
 caddespesas.Free;
end;

procedure TFrmFopag.BitBtn3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmFopag.ComboBox2Exit(Sender: TObject);
begin
  inherited;
  if ComboBox2.Text <> 'SIMPLES' then
    EdtINSS.Valor:=28.80;
  somarValores;
end;

procedure TFrmFopag.EdtFGTSExit(Sender: TObject);
begin
  inherited;
somarValores;
end;

procedure TFrmFopag.EdtINSSExit(Sender: TObject);
begin
  inherited;
somarValores;
end;

procedure TFrmFopag.EdtNFuncSairamExit(Sender: TObject);
begin
  inherited;
somarValores;
end;

procedure TFrmFopag.EdtNumeroFuncExit(Sender: TObject);
begin
  inherited;
somarValores;
end;

procedure TFrmFopag.EdtValorFolhaExit(Sender: TObject);
begin
  inherited;
somarValores;
end;

function TFrmFopag.somarValores: boolean;
var
 i: integer;
 vval: real;
 vfgtsprov13: real;
begin
//
if EdtNumeroFunc.Valor <> 0 then
 EdtSalMedio.Valor:=EdtValorFolha.Valor/EdtNumeroFunc.Valor;
EdttotalFGTS.Valor:=((EdtValorFolha.Valor*EdtFGTS.valor)/100);
EdtTotalINSS.valor:=((EdtValorFolha.Valor*EdtINSS.valor)/100);
EdtTotalGastoMes.Valor:=EdtValorFolha.valor+EdttotalFGTS.Valor+EdtTotalINSS.Valor;
for i := 1 to StProvisoes.RowCount -1 do
 StProvisoes.Rows[I].Clear;
//StProvisoes.RowCount:=1;
StProvisoes.Cells[0,0]:='Tipo Provisionamento';
StProvisoes.Cells[1,0]:='Valor';
StProvisoes.Cells[0,1]:='Provisão para 13º';
StProvisoes.Cells[1,1]:=vDadosIni.alndir(Format('%n', [(EdtValorFolha.Valor/12)]), 14);
StProvisoes.Cells[0,2]:='Provisão para Férias e 1/3 de Férias';
StProvisoes.Cells[1,2]:=vDadosIni.alndir(Format('%n', [(EdtValorFolha.Valor/12)+
(EdtValorFolha.Valor/36)]), 14);
StProvisoes.Cells[0,3]:='FGTS da Provisão 13º';
vfgtsprov13:=(((EdtValorFolha.Valor/12)+(EdtValorFolha.Valor/12)+
(EdtValorFolha.Valor/36))*EdtFGTS.Valor)/100;
StProvisoes.Cells[1,3]:=vDadosIni.alndir(Format('%n', [vfgtsprov13]), 14);
StProvisoes.Cells[0,4]:='INSS da Provisão de Férias, 1/3 de Férias e 13º Salário';
StProvisoes.Cells[1,4]:=vDadosIni.alndir(Format('%n', [(((EdtValorFolha.Valor/12)+
(EdtValorFolha.Valor/36))*EdtINSS.Valor)/100]), 14);
StProvisoes.Cells[0,5]:='1 Mês de Aviso';
StProvisoes.Cells[1,5]:=vDadosIni.alndir(Format('%n', [((EdtSalMedio.Valor/12)*
EdtNFuncSairam.Valor)]), 14);
StProvisoes.Cells[0,6]:='13º e Férias para 1 Mês de Aviso';
vval:=((((EdtSalMedio.Valor/12)+(EdtSalMedio.Valor/36))+
((EdtSalMedio.Valor/12)*(1+(EdtFGTS.Valor/100))))/12)*EdtNFuncSairam.Valor;
StProvisoes.Cells[1,6]:=vDadosIni.alndir(Format('%n', [vval]), 14);
StProvisoes.Cells[0,7]:='Multa de 50% sobre o FGTS depositado';
vval:=(vfgtsprov13+EdttotalFGTS.Valor)*(50/100);
StProvisoes.Cells[1,7]:=vDadosIni.alndir(Format('%n', [vval]), 14);
StProvisoes.Cells[0,8]:='INSS sobre o Aviso Prévio';
vval:=((EdtSalMedio.Valor/12)*EdtNFuncSairam.Valor)*(EdtINSS.Valor/100);
StProvisoes.Cells[1,8]:=vDadosIni.alndir(Format('%n', [vval]), 14);
EdtTotalProvisoes.Valor:=0;
for I := 1 to 8 do
begin
  EdtTotalProvisoes.Valor:=EdtTotalProvisoes.Valor+StrToCurr(vDadosIni.tirapontos(StProvisoes.Cells[1,i],2));
end;
end;

end.
