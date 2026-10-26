unit Udepreciacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB,UClassesEquipamentos,
  uEditMoeda;

type
  TFrmDepreciacao = class(TfrmPadrao)
    Panel1: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DtDprec: TDataSource;
    Label1: TLabel;
    EdtDeprec: TEditMoeda;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vcadempresa:string;
    hEquipamento: THandle;
  end;

var
  FrmDepreciacao: TFrmDepreciacao;
  cadequipamento: TEquipamentos;

implementation

uses
  funcoes, UDtmEquipamentos, uDtmAtivo, UClassesGestor, UCtSalGestor, uDadosIni;

{$R *.dfm}

procedure TFrmDepreciacao.BitBtn1Click(Sender: TObject);
var
  gestor: TGestorFormularios;
  vcodemp: string;
begin
  inherited;
  gestor := TGestorFormularios.Create;
  if not vDadosIni.PesqPros('GES048','VERIFICAR','MES/ANO: '+edit1.Text+'/'+Edit2.text,'','',gestor.cQuery,True) then
   Exit;
  gestor.Free;
  try
   StrToInt(Edit1.text);
   StrToInt(Edit2.text);
  except
   Application.MessageBox('Mês e Ano não informado(s) ou informado(s) incorretamente!', 'Confirmação', MB_OK);
   exit;
  end;
  vcodemp:=vDadosIni.codEmpresa;
  vDadosIni.codEmpresa:=vcadempresa;
  CadEquipamento.vDepreciacao.AbredepreciacaoMes(StrToInt(Edit1.text),StrToInt(Edit2.text));
  if cadequipamento.vDepreciacao.dataSet.IsEmpty then
  begin
   Application.MessageBox('Sem depreciação para o Mês informado, Favor proceder com o '+#13+
   'Balanço Gerencial para que o mesmo seja calculado!', 'Confirmação', MB_OK);
   exit;
  end
  else
  begin
    EdtDeprec.Valor:=0;
    while not cadequipamento.vDepreciacao.Eof do
    begin
      EdtDeprec.Valor:=EdtDeprec.Valor+
      cadequipamento.vDepreciacao.dataSet.FieldByName('VALOR_DEPRECI').AsCurrency;
      cadequipamento.vDepreciacao.Next;
    end;
    cadequipamento.vDepreciacao.First;
  end;
  vDadosIni.codEmpresa:=vcodemp;
end;

procedure TFrmDepreciacao.BitBtn2Click(Sender: TObject);
var
 caddespesas: TDespesasGestor;
 vdia: string;
begin
  inherited;
  if EdtDeprec.Valor <= 0  then
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
 if not vDadosIni.PesqPros('GES049','GRAVAR','MES/ANO '+edit1.text+'/'+edit2.text,'','',caddespesas.buscas,True) then
  Exit;
 try
  caddespesas.vmesvendas:=StrToInt(Edit1.text);
  caddespesas.vanovendas:=StrToInt(Edit2.text);
 except
  Application.MessageBox('Mês e Ano não informado(s) ou informado(s) incorretamente!', 'Confirmação', MB_OK);
  exit;
 end;
 Application.MessageBox('É necessário escolher uma Conta', 'Confirmação', MB_OK);
 Application.CreateForm(TFrmContasSalario,FrmContasSalario);
 caddespesas.visualizadespesas;
 if FrmContasSalario.ShowModal = mrOk then
 begin
   caddespesas.vvaldespped:=caddespesas.dataSet.FieldByName('N_CONTA_PLC').AsCurrency;
   caddespesas.gravaProvisoes(vcadempresa,vdia,EdtDeprec.valor,3);
 end;
 FrmContasSalario.Free;
 caddespesas.Free;
end;

procedure TFrmDepreciacao.BitBtn3Click(Sender: TObject);
begin
  inherited;
 Close;
end;

procedure TFrmDepreciacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CadEquipamento.Free;
  DtmEquipamentos.Free;
  DtmEquipamentos:=nil;
  UnloadPackage(HEquipamento);
end;

procedure TFrmDepreciacao.FormShow(Sender: TObject);
begin
  inherited;
  if hEquipamento = 0 then
   CarregaPacote('pkEquipamentos', hEquipamento);
  if DtmEquipamentos = nil then
   DtmEquipamentos := TDtmEquipamentos.Create(DtmEquipamentos);
  CadEquipamento:=TEquipamentos.create;
end;

end.
