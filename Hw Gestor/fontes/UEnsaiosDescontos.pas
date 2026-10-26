unit UEnsaiosDescontos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, ExtCtrls, Grids, Buttons, ComCtrls, uEditMoeda,
  CheckLst,UClassesGestor, DBGrids,ComObj;

type
  TFrmEnsaiosDescontos = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    StCustosEmp: TStringGrid;
    Panel3: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EdtCustos: TEditMoeda;
    EdtRedCMV: TEditMoeda;
    EdtRedOCV: TEditMoeda;
    EdtPercLucro: TEditMoeda;
    EdtLucrodinheiro: TEditMoeda;
    EdtFaturamento: TEditMoeda;
    BitBtn3: TBitBtn;
    EdtPercDesconto: TEditMoeda;
    BitBtn5: TBitBtn;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    stEnsaios: TStringGrid;
    TabSheet4: TTabSheet;
    BitBtn2: TBitBtn;
    GROUP: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    LbContador: TLabel;
    Edit3: TEdit;
    CheckListBox1: TCheckListBox;
    CheckBox1: TCheckBox;
    ProgressContador: TProgressBar;
    GroupBox2: TGroupBox;
    ChecktpVendas: TCheckListBox;
    Label12: TLabel;
    StpercVenda: TStringGrid;
    Label13: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure EdtFaturamentoExit(Sender: TObject);
    procedure EdtPercLucroExit(Sender: TObject);
    procedure EdtLucrodinheiroExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure povoastrgrid;
    procedure sugestaovenda;
    function AtribuirBoras(pOpenOffice, Cor, EspLinInter, EspLinExter, DistLinha: Variant): Variant;
  private
    { Private declarations }
  public
    { Public declarations }
    vcadempresa: string;
    cadcotacao: Tcotacao;
  end;

var
  FrmEnsaiosDescontos: TFrmEnsaiosDescontos;
  cadensaios: TensaiosDescontos;
//  caddep: TDepto;
implementation

uses UdtmGestorHw, uDataSet_OOP, uDtmAtivo;


{$R *.dfm}

function TFrmEnsaiosDescontos.AtribuirBoras(pOpenOffice, Cor, EspLinInter,
  EspLinExter, DistLinha: Variant): Variant;
var
	otherRef: Variant;
begin
	otherRef := pOpenOffice.createInstance('com.sun.star.reflection.CoreReflection');
  otherRef.forName('com.sun.star.table.BorderLine').createObject(result);
  result.Color := Cor;
  result.InnerLineWidth := EspLinInter;
  result.OuterLineWidth := EspLinExter;
  result.LineDistance   := DistLinha;
end;

procedure TFrmEnsaiosDescontos.BitBtn1Click(Sender: TObject);
var
 vflg: integer;
begin
  inherited;
BitBtn7.Enabled:=false;
try
 if not vDadosIni.PesqPros('GES025','OBTER','DE '+Edit1.text+' A '+Edit2.text,'','',cadcotacao.buscas,True) then
  Exit;
 cadensaios.vmesinf:=strtoint(Edit1.text);
 cadensaios.vano:=StrToInt(edit2.text);
 cadensaios.caddre.CadApuracao.vmesap:=strtoint(Edit1.text);
 cadensaios.caddre.CadApuracao.vanoap:=StrToInt(edit2.text);
 cadcotacao.vmesinf:=cadensaios.vmesinf;
 cadcotacao.vanoinf:=cadensaios.vano;
except
 Application.MessageBox('Mês e Ano não informado(s) ou informado(s) incorretamente!', 'Confirmação', MB_OK);
 exit;
end;
vflg:=0;
cadcotacao.montardatas;
if ComboBox1.Text = 'EMPRESA' then
begin
  if not cadensaios.caddre.CadApuracao.buscaapuracao(99,cadensaios.vempresas) then
    vflg:=1
  else
  begin
   cadcotacao.cadCotacaoItens.cadprodutos.verificarPartVenda('',1);
   povoastrgrid;
  end;
end
else
begin
 cadensaios.caddre.CadDepto.procuraDepto(ComboBox1.Text);
 if not cadensaios.caddre.CadApuracao.buscaapuracao(cadensaios.caddre.CadDepto.dataSet.FieldByName('COD_DEP').AsInteger,cadensaios.vempresas) then
  vflg:=1
 else
 begin
   if cadensaios.caddre.CadDepto.vdepprod = 'S' then
   begin
    cadcotacao.cadCotacaoItens.cadprodutos.verificarPartVenda('',1);
    povoastrgrid;
   end;
 end;
end;
if vflg <> 1 then
begin
 cadensaios.VerificaCustos(StCustosEmp);
 ComboBox1.Enabled:=false;
 Panel5.Enabled:=true;
end;
end;

procedure TFrmEnsaiosDescontos.BitBtn2Click(Sender: TObject);
begin
  inherited;
close;
end;

procedure TFrmEnsaiosDescontos.BitBtn3Click(Sender: TObject);
begin
  inherited;
 if not vDadosIni.PesqPros('GES026','GERAR SIMULADO','DE '+Edit1.text+' A '+Edit2.text,'','',cadensaios.buscas,True) then
  Exit;
 cadensaios.vredcustoperc:=EdtCustos.Valor;
 cadensaios.vredcmvperc:=EdtRedCMV.Valor;
 cadensaios.vredocvperc:=EdtRedOCV.Valor;
 cadensaios.vlucrodesadoperc:=EdtPercLucro.Valor;
 cadensaios.vLucroDesejadoDinheiro:=EdtLucrodinheiro.Valor;
 cadensaios.vfaturamento:=EdtFaturamento.Valor;
 cadensaios.vdescontoperc:=EdtPercDesconto.Valor;
 cadensaios.VerificaEnsaios(stEnsaios,StCustosEmp);
 BitBtn7.Enabled:=true;
end;

procedure TFrmEnsaiosDescontos.BitBtn4Click(Sender: TObject);
var
 i,x: integer;
begin
  inherited;
for I :=0 to 4 do
  for x := 1 to 7 do
    StCustosEmp.Cells[i,x]:='';
ComboBox1.Enabled:=true;
Panel5.Enabled:=false;
end;

procedure TFrmEnsaiosDescontos.BitBtn5Click(Sender: TObject);
begin
  inherited;
// Application.CreateForm(TFrmCotacaoVenda,FrmCotacaoVenda);
  PageControl1.ActivePage:=TabSheet2;
end;

procedure TFrmEnsaiosDescontos.BitBtn6Click(Sender: TObject);
var
 vatl: string;
 vflag,i: integer;
 vpercv,vpercq: real;
 vcodemp: string;
begin
  inherited;
 if not vDadosIni.PesqPros('GES028','GERAR','NOVA SUGESTAO PARA VENDA DE PRODUTOS','','',cadcotacao.buscas,True) then
  Exit;
 try
  cadcotacao.vqtdediasmes:=StrToInt(Edit3.text);
 except
   Application.MessageBox('Valor dos Dias disponíveis mês informado está inválido!', 'Confirmação', MB_OK);
   exit;
 end;
 if cadcotacao.vfatcot = 0 then
 begin
  Application.MessageBox('Valor do ensaio não gerado!', 'Confirmação', MB_OK);
  exit;
 end;
 if (ComboBox1.Text = 'EMPRESA') or (cadensaios.caddre.CadDepto.vdepprod = 'S') then
 begin
   vpercv:=0;
   vpercq:=0;
   for I := 0 to 5 do
   begin
     if StpercVenda.Cells[0,i+1] = cadcotacao.cadCotacaoItens.cadprodutos.vperctivendageral[i,0] then
     begin
       vpercv:=vpercv+StrToFloat(StpercVenda.Cells[1,i+1]);
       vpercq:=vpercq+StrToFloat(StpercVenda.Cells[2,i+1]);
     end;
   end;
   if (vpercv > 100) or (vpercq > 100) then
   begin
     Application.MessageBox('Problemas com a definição de percentual por tipo de venda. A soma deve ser menor ou igual a 100%!', 'Confirmação', MB_OK);
     Exit;
   end;
 end;

 if CheckBox1.Checked then
  vatl:='R'
 else
  vatl:='';
 try
 bitbtn6.Enabled:=false;
 vcodemp:=vDadosIni.codEmpresa;
 vDadosIni.codEmpresa:=cadensaios.vempresas;
 cadcotacao.abrecotacao;
 cadcotacao.cadCotacaoItens.cadprodutos.vvalest:=0;
 cadcotacao.cadCotacaoItens.cadprodutos.verificaclassesProduto(CheckListBox1);
 cadcotacao.vnovaCotacao:='S';
 cadcotacao.vnitem:=1;
 vDadosIni.codEmpresa:=vcodemp;
 if (ComboBox1.Text = 'EMPRESA') or (cadensaios.caddre.CadDepto.vdepprod = 'S') then
 begin
   for I := 0 to 5 do
   begin
     if StpercVenda.Cells[0,i+1] = cadcotacao.cadCotacaoItens.cadprodutos.vperctivendageral[i,0] then
     begin
       cadcotacao.cadCotacaoItens.cadprodutos.vperctivendageral[i,1]:=Format('%n', [(StrToFloat(StpercVenda.Cells[1,i+1])/100)]);
       cadcotacao.cadCotacaoItens.cadprodutos.vperctivendageral[i,2]:=Format('%n', [(StrToFloat(StpercVenda.Cells[2,i+1])/100)]);
     end;
   end;
 end;
 vflag:=0;
 for i:=0 to CheckListBox1.Items.Count-1 do
 begin
  if CheckListBox1.Checked[i] then
    vflag:=1;
 end;
 if vflag = 0 then
 begin
   Application.MessageBox('Nenhuma curva selecionada', 'Confirmação', MB_OK);
   Exit;
 end;
 vflag:=0;
 for i:=0 to ChecktpVendas.Items.Count-1 do
 begin
  if ChecktpVendas.Checked[i] then
    vflag:=1;
 end;
 if vflag = 0 then
 begin
   Application.MessageBox('Nenhum tipo de venda selecionado', 'Confirmação', MB_OK);
   Exit;
 end;
// vcodemp:=vDadosIni.codEmpresa;
 vDadosIni.codEmpresa:=cadensaios.vempresas;
 GROUP.Enabled:=False;
 for i:=0 to ChecktpVendas.Items.Count-1 do
 begin
  if ComboBox1.Text <> 'EMPRESA' then
  begin
    cadcotacao.vtipcot:=cadensaios.caddre.CadDepto.dataSet.FieldByName('COD_DEP').AsString;
    cadcotacao.vnomedep:=cadensaios.caddre.CadDepto.dataSet.FieldByName('DESC_DEP').AsString;
  end
  else
  begin
   cadcotacao.vtipcot:='99';
   cadcotacao.vnomedep:='EMPRESA';
  end;
  if ChecktpVendas.Checked[i] then
   cadcotacao.MontacotacaoVenda(cadcotacao.cadCotacaoItens.cadprodutos.vclasses,vatl,'',
    LbContador,ProgressContador,Copy(ChecktpVendas.Items[i],1,1));
 end;
 cadcotacao.VerificaCustosFixos(LbContador,ProgressContador);
 cadcotacao.Close;
 Application.MessageBox('Favor verificar a(s) cotação(ões) de venda gerada', 'Atenção', MB_OK);
 finally
  bitbtn6.Enabled:=true;
  GROUP.Enabled:=true;
  vDadosIni.codEmpresa:=vcodemp;
 end;
end;

procedure TFrmEnsaiosDescontos.BitBtn7Click(Sender: TObject);
var
 OpenDesktop, Documento, Sheets, Sheet, Celula, Planilha: Variant;
 Connect, OpenOffice: Variant;
 objExcel,Chart,s : Variant;
 ix,i,j, vSize: integer;
 cTitulo : string;
 vLinha: Integer;
 z: integer;
begin
  inherited;
 //
// if not vDadosIni.PesqPros('GES024','EXPORTAR EXCEL','DE '+maskedit3.text+' A '+maskedit4.text,'','',CadBalancoHw.buscas,True) then
//  Exit;
 cTitulo := 'Planilha de DRE';
 if (vDadosIni.vOpenOfficeExportRel = 'S') then
 begin
   //Cria o link OLE com o OpenOffice
   try
     if VarIsEmpty(OpenOffice) then
       OpenOffice := CreateOleObject('com.sun.star.ServiceManager');
   except
   	 Application.MessageBox ('Versão do OpenOffice Calc Incompatível','Erro',MB_OK+MB_ICONEXCLAMATION);
   	 exit;
   end;
   Connect := not (VarIsEmpty(OpenOffice) or VarIsNull(OpenOffice));

   //Inicia o Calc
   OpenDesktop := OpenOffice.CreateInstance('com.sun.star.frame.Desktop');
   Documento   := OpenDesktop.LoadComponentFromURL('private:factory/scalc',
                    '_blank', 0, VarArrayCreate([0, -1], varVariant));
   Planilha    := Documento.getSheets.getByName('Planilha1');
   Sheets      := Documento.Sheets;
   Sheet       := Sheets.getByIndex(0);

   i := 0;
   j := 0;

   cadensaios.buscas.Close;
   cadensaios.buscas.sql.text:='select nome_emp from empresa where cod_empresa = '+cadensaios.vempresas;
   cadensaios.buscas.Open;
   
   //Criar linha inicial
   Celula := Planilha.getCellByPosition(0, j);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(i, j).setString(cadensaios.buscas.FieldByName('NOME_EMP').AsString);

   //Definir largura colunas
   for I := 0 to 2 do
   begin
     vSize := 10;
     Planilha.getColumns.getByIndex(i).width := vSize * 500;
   end;

   j := j + 1;
   Celula := Planilha.getCellByPosition(0, j);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(0, j).setString('Departamento: ');

   Celula := Planilha.getCellByPosition(1, j);
   Sheet.getCellByPosition(1, j).setString(ComboBox1.Text);

   j := j + 1;
   Celula := Planilha.getCellByPosition(0, j);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(0, j).setString('Mês: ');

   Celula := Planilha.getCellByPosition(1, j);
   Celula.HoriJustify   := 3;
   Sheet.getCellByPosition(1, j).setString(edit1.Text);

   j := j + 1;
   Celula := Planilha.getCellByPosition(0, j);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(0, j).setString('Ano: ');

   Celula := Planilha.getCellByPosition(1, j);
   Celula.HoriJustify   := 3;
   Sheet.getCellByPosition(1, j).setString(edit2.Text);


   j := j + 1;
   Celula := Planilha.getCellByPosition(0, j);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(0, j).setString(Label2.Caption);

   vLinha := j + 1;
   for I := 0 to StCustosEmp.RowCount-1 do
   begin
      for j := 0 to 2 do
      begin
      	if (i = 0) or (j = 0) or (i = StCustosEmp.RowCount - 1) then
        begin
          Celula := Planilha.getCellByPosition(j, vLinha);
          Celula.CharWeight := 200;
          Celula.CellBackColor := '13893372';
          Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Sheet.getCellByPosition(j, vLinha).setString(StCustosEmp.Cells[j,i]);
        end
        else
        begin
        	Celula := Planilha.getCellByPosition(j, vLinha);
          Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.HoriJustify   := 3;
          if (j = 1) then
	          Celula.NumberFormat := 21
          else
          	Celula.NumberFormat := 4;

          Sheet.getCellByPosition(j, vLinha).setValue(StrToFloat(Trim(StringReplace(StCustosEmp.Cells[j,i], '.', '', [rfReplaceAll, rfIgnoreCase]))));
        end;
      end;
      vLinha := vLinha + 1;
   end;

   // Inserir linha
   Celula := Planilha.getCellByPosition(0, vLinha);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(0, vLinha).setString(Label3.Caption);

   Celula := Planilha.getCellByPosition(1, vLinha);
   Celula.HoriJustify   := 3;
   Celula.NumberFormat := 4;
   Sheet.getCellByPosition(1, vLinha).setValue(StrToFloat(Trim(
   	StringReplace(StringReplace(EdtCustos.Text, '.', '', [rfReplaceAll, rfIgnoreCase]), 'R$', '', [rfReplaceAll, rfIgnoreCase]))));

   Celula := Planilha.getCellByPosition(2, vLinha);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(2, vLinha).setString(Label6.Caption);

   Celula := Planilha.getCellByPosition(3, vLinha);
   Celula.HoriJustify   := 3;
   Celula.NumberFormat := 4;
   Sheet.getCellByPosition(3, vLinha).setValue(StrToFloat(Trim(
   	StringReplace(StringReplace(EdtPercLucro.Text, '.', '', [rfReplaceAll, rfIgnoreCase]), 'R$', '', [rfReplaceAll, rfIgnoreCase]))));

   Celula := Planilha.getCellByPosition(4, vLinha);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(4, vLinha).setString(Label9.Caption);

   Celula := Planilha.getCellByPosition(5, vLinha);
   Celula.HoriJustify   := 3;
   Celula.NumberFormat := 4;
   Sheet.getCellByPosition(5, vLinha).setValue(StrToFloat(Trim(
   	StringReplace(StringReplace(EdtPercDesconto.Text, '.', '', [rfReplaceAll, rfIgnoreCase]), 'R$', '', [rfReplaceAll, rfIgnoreCase]))));

   // Inserir linha
   vLinha := vLinha + 1;
   Celula := Planilha.getCellByPosition(0, vLinha);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(0, vLinha).setString(Label4.Caption);

   Celula := Planilha.getCellByPosition(1, vLinha);
   Celula.HoriJustify   := 3;
   Celula.NumberFormat := 4;
   Sheet.getCellByPosition(1, vLinha).setValue(StrToFloat(Trim(
   	StringReplace(StringReplace(EdtRedCMV.Text, '.', '', [rfReplaceAll, rfIgnoreCase]), 'R$', '', [rfReplaceAll, rfIgnoreCase]))));

   Celula := Planilha.getCellByPosition(2, vLinha);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(2, vLinha).setString(Label7.Caption);

   Celula := Planilha.getCellByPosition(3, vLinha);
   Celula.HoriJustify   := 3;
   Celula.NumberFormat := 21;
   Sheet.getCellByPosition(3, vLinha).setValue(StrToFloat(Trim(
   	StringReplace(StringReplace(EdtLucrodinheiro.Text, '.', '', [rfReplaceAll, rfIgnoreCase]), 'R$', '', [rfReplaceAll, rfIgnoreCase]))));

   // Inserir linha
   vLinha := vLinha + 1;
   Celula := Planilha.getCellByPosition(0, vLinha);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(0, vLinha).setString(Label5.Caption);

   Celula := Planilha.getCellByPosition(1, vLinha);
   Celula.HoriJustify   := 3;
   Celula.NumberFormat := 4;
   Sheet.getCellByPosition(1, vLinha).setValue(StrToFloat(Trim(
   	StringReplace(StringReplace(EdtRedOCV.Text, '.', '', [rfReplaceAll, rfIgnoreCase]), 'R$', '', [rfReplaceAll, rfIgnoreCase]))));

   Celula := Planilha.getCellByPosition(2, vLinha);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(2, vLinha).setString(Label8.Caption);

   Celula := Planilha.getCellByPosition(3, vLinha);
   Celula.HoriJustify   := 3;
   Celula.NumberFormat := 21;
   Sheet.getCellByPosition(3, vLinha).setValue(StrToFloat(Trim(
   	StringReplace(StringReplace(EdtFaturamento.Text, '.', '', [rfReplaceAll, rfIgnoreCase]), 'R$', '', [rfReplaceAll, rfIgnoreCase]))));

   // Inserir Linha
   vLinha := vLinha + 1;
   Celula := Planilha.getCellByPosition(0, vLinha);
   Celula.CharWeight := 200;
   Sheet.getCellByPosition(0, vLinha).setString(TabSheet3.Caption);

   vLinha := vLinha + 1;
   for I := 0 to stEnsaios.RowCount-1 do
   begin
      for j := 0 to 2 do
      begin
        if (i = 0) or (j = 0) or (i = stEnsaios.RowCount - 1) then
        begin
          Celula := Planilha.getCellByPosition(j, vLinha);
          Celula.CharWeight := 200;
          Celula.CellBackColor := '13893372';
          Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Sheet.getCellByPosition(j, vLinha).setString(stEnsaios.Cells[j,i]);
        end
        else
        begin
        	Celula := Planilha.getCellByPosition(j, vLinha);
          Celula.TopBorder     := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.LeftBorder    := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.RightBorder   := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.BottomBorder  := AtribuirBoras(OpenOffice, 0, 1, 1, 0);
          Celula.HoriJustify   := 3;
          if (j = 1) then
	          Celula.NumberFormat := 21
          else
          	Celula.NumberFormat := 4;

          Sheet.getCellByPosition(j, vLinha).setValue(StrToFloat(Trim(StringReplace(stEnsaios.Cells[j,i], '.', '', [rfReplaceAll, rfIgnoreCase]))));
        end;
      end;
      vLinha := vLinha + 1;
   end;
 end
 else
 begin
   cTitulo := 'Planilha de Ensaios';
   objExcel := CreateOleObject('Excel.Application');
   objExcel.Visible := True;
   objExcel.Caption := cTitulo;
   objExcel.Workbooks.add;
   // objExcel.Workbooks[1].sheets.add;
   Sheet:=objExcel.Workbooks[1].sheets[1];
   ix := 1;
   cadensaios.buscas.Close;
   cadensaios.buscas.sql.text:='select nome_emp from empresa where cod_empresa = '+cadensaios.vempresas;
   cadensaios.buscas.Open;
   Sheet.cells[ix,1].font.bold := true; // Negrito
   Sheet.cells[ix,1]:=cadensaios.buscas.FieldByName('NOME_EMP').AsString;
   ix:=ix+1;
   Sheet.cells[ix,1].font.bold := true; // Negrito
   Sheet.cells[ix,1]:='Departamento: ';
   Sheet.cells[ix,2]:=ComboBox1.Text;
   ix:=ix+1;
   Sheet.cells[ix,1].font.bold := true; // Negrito
   Sheet.cells[ix,1]:='Mês: ';
   Sheet.cells[ix,2]:=edit1.Text;
   ix:=ix+1;
   Sheet.cells[ix,1].font.bold := true; // Negrito
   Sheet.cells[ix,1]:='Ano: ';
   Sheet.cells[ix,2]:=edit2.Text;
   ix:=ix+1;
   Sheet.cells[ix,1].font.bold := true; // Negrito
   Sheet.cells[ix,1]:=Label2.Caption;
   ix:=ix+1;
   for I := 0 to StCustosEmp.RowCount-1 do
   begin
      for j := 0 to 2 do
      begin
       Sheet.cells[ix,j+1]:=StCustosEmp.Cells[j,i];
       if ((i+1) = 1) or ((j+1) = 1) or ((i+1) = (StCustosEmp.RowCount)) then
       begin
        Sheet.cells[ix,j+1].Font.size := 10;
        Sheet.cells[ix,j+1].ColumnWidth := 20;
        Sheet.cells[ix,j+1].Borders.Item[$00000009].Weight := $FFFFEFD6;
        Sheet.cells[ix,j+1].Borders.Item[$00000009].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$00000007].Weight := $FFFFEFD6;
        Sheet.cells[ix,j+1].Borders.Item[$00000007].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
        Sheet.cells[ix,j+1].Borders.Item[$0000000A].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$00000008].Weight := $FFFFEFD6;
        Sheet.cells[ix,j+1].Borders.Item[$00000008].Color := clblack;
  //      Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
        Sheet.cells[ix,j+1].Interior.Color := $00ffcf9c; // Cor da Célula
        Sheet.cells[ix,j+1].font.bold := true; // Negrito
        if ((i+1) = (StCustosEmp.RowCount)) then
          Sheet.cells[ix,j+1].HorizontalAlignment := 4;
       end
       else
       begin
        Sheet.cells[ix,j+1].HorizontalAlignment := 4;
        Sheet.cells[ix,j+1].Borders.Item[$00000009].Weight := $00000002;
        Sheet.cells[ix,j+1].Borders.Item[$00000009].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$00000007].Weight := $00000002;
        Sheet.cells[ix,j+1].Borders.Item[$00000007].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$0000000A].Weight := $00000002;
        Sheet.cells[ix,j+1].Borders.Item[$0000000A].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$00000008].Weight := $00000002;
        Sheet.cells[ix,j+1].Borders.Item[$00000008].Color := clblack;
       end;
      end;
      ix:=ix+1;
   end;
   Sheet.cells[ix,1].font.bold := true; // Negrito
   Sheet.cells[ix,1]:=Label3.Caption;
   Sheet.cells[ix,2]:=EdtCustos.Text;
   Sheet.cells[ix,3].font.bold := true; // Negrito
   Sheet.cells[ix,3]:=Label6.Caption;
   Sheet.cells[ix,4]:=EdtPercLucro.Text;
   Sheet.cells[ix,5].font.bold := true; // Negrito
   Sheet.cells[ix,5]:=Label9.Caption;
   Sheet.cells[ix,6]:=EdtPercDesconto.Text;
   ix:=ix+1;
   Sheet.cells[ix,1].font.bold := true; // Negrito
   Sheet.cells[ix,1]:=Label4.Caption;
   Sheet.cells[ix,2]:=EdtRedCMV.Text;
   Sheet.cells[ix,3].font.bold := true; // Negrito
   Sheet.cells[ix,3]:=Label7.Caption;
   Sheet.cells[ix,4]:=EdtLucrodinheiro.Text;
   ix:=ix+1;
   Sheet.cells[ix,1].font.bold := true; // Negrito
   Sheet.cells[ix,1]:=Label5.Caption;
   Sheet.cells[ix,2]:=EdtRedOCV.Text;
   Sheet.cells[ix,3].font.bold := true; // Negrito
   Sheet.cells[ix,3]:=Label8.Caption;
   Sheet.cells[ix,4]:=EdtFaturamento.Text;
   ix:=ix+1;
   Sheet.cells[ix,1].font.bold := true; // Negrito
   Sheet.cells[ix,1]:=TabSheet3.Caption;
   ix:=ix+1;
   for I := 0 to stEnsaios.RowCount-1 do
   begin
      for j := 0 to 2 do
      begin
       Sheet.cells[ix,j+1]:=stEnsaios.Cells[j,i];
       if ((i+1) = 1) or ((j+1) = 1) or ((i+1) = (stEnsaios.RowCount)) then
       begin
        Sheet.cells[ix,j+1].Font.size := 10;
        Sheet.cells[ix,j+1].ColumnWidth := 20;
        Sheet.cells[ix,j+1].Borders.Item[$00000009].Weight := $FFFFEFD6;
        Sheet.cells[ix,j+1].Borders.Item[$00000009].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$00000007].Weight := $FFFFEFD6;
        Sheet.cells[ix,j+1].Borders.Item[$00000007].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$0000000A].Weight := $FFFFEFD6;
        Sheet.cells[ix,j+1].Borders.Item[$0000000A].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$00000008].Weight := $FFFFEFD6;
        Sheet.cells[ix,j+1].Borders.Item[$00000008].Color := clblack;
  //      Sheet.Range['A1','D1'].font.color := clYellow; // Cor da Fonte
        Sheet.cells[ix,j+1].Interior.Color := $00ffcf9c; // Cor da Célula
        Sheet.cells[ix,j+1].font.bold := true; // Negrito
        if ((i+1) = (stEnsaios.RowCount)) then
          Sheet.cells[ix,j+1].HorizontalAlignment := 4;
       end
       else
       begin
        Sheet.cells[ix,j+1].HorizontalAlignment := 4;
        Sheet.cells[ix,j+1].Borders.Item[$00000009].Weight := $00000002;
        Sheet.cells[ix,j+1].Borders.Item[$00000009].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$00000007].Weight := $00000002;
        Sheet.cells[ix,j+1].Borders.Item[$00000007].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$0000000A].Weight := $00000002;
        Sheet.cells[ix,j+1].Borders.Item[$0000000A].Color := clblack;
        Sheet.cells[ix,j+1].Borders.Item[$00000008].Weight := $00000002;
        Sheet.cells[ix,j+1].Borders.Item[$00000008].Color := clblack;
       end;
      end;
      ix:=ix+1;
   end;
   Sheet.SaveAs(ExtractFilePath(Application.ExeName)+'Ensaios.xls');
  // objExcel.Workbooks[1].close(ExtractFilePath(Application.ExeName)+'fluxo.xls');
  // objExcel.Quit;
 end;
 Application.MessageBox('Arquivo Gerado com Sucesso!', 'Confirmação', MB_OK); // Gravará na tabela de resultado o dpto 99
end;

procedure TFrmEnsaiosDescontos.EdtFaturamentoExit(Sender: TObject);
begin
  inherited;
 if EdtFaturamento.Valor <> 0 then
 begin
   EdtPercLucro.valor:=0;
   EdtLucrodinheiro.valor:=0;
 end;
end;

procedure TFrmEnsaiosDescontos.EdtLucrodinheiroExit(Sender: TObject);
begin
  inherited;
  if EdtLucrodinheiro.valor <> 0 then
  begin
    EdtPercLucro.Valor:=0;
    EdtFaturamento.Valor:=0;
  end;
  
end;

procedure TFrmEnsaiosDescontos.EdtPercLucroExit(Sender: TObject);
begin
  inherited;
  if EdtPercLucro.Valor <> 0 then
  begin
    EdtLucrodinheiro.Valor:=0;
    EdtFaturamento.Valor:=0;
  end;
end;

procedure TFrmEnsaiosDescontos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=caFree;
end;

procedure TFrmEnsaiosDescontos.FormShow(Sender: TObject);
begin
  inherited;
  cadensaios:=TensaiosDescontos.create;
  cadensaios.vempresas:=vcadempresa;
  cadensaios.caddre.CadDepto.preencheCombo(ComboBox1);
  cadcotacao:=Tcotacao.create;
  PageControl1.ActivePage:=TabSheet1;
  TabSheet1.Show;
end;

procedure TFrmEnsaiosDescontos.PageControl1Change(Sender: TObject);
begin
  inherited;
	if PageControl1.ActivePage = TabSheet2 then
  	sugestaovenda;
end;

procedure TFrmEnsaiosDescontos.povoastrgrid;
var
 i: integer;
begin
 StpercVenda.Cells[0,0]:='TIPO VENDA';
 StpercVenda.Cells[1,0]:='%Valor';
 StpercVenda.Cells[2,0]:='%Qtde';
 if (ComboBox1.Text = 'EMPRESA') or (cadensaios.caddre.CadDepto.vdepprod = 'S') then
 begin
   for I := 0 to 5 do
   begin
       StpercVenda.Cells[0,i+1]:=cadcotacao.cadCotacaoItens.cadprodutos.vperctivendageral[i,0];
       StpercVenda.Cells[1,i+1]:=Format('%n', [(StrToFloat(cadcotacao.cadCotacaoItens.cadprodutos.vperctivendageral[i,1])*100)]);
       StpercVenda.Cells[2,i+1]:=Format('%n', [(StrToFloat(cadcotacao.cadCotacaoItens.cadprodutos.vperctivendageral[i,2])*100)]);
   end;
 end;
end;

procedure TFrmEnsaiosDescontos.sugestaovenda;
begin
	if not vDadosIni.PesqPros('GES027','OBTER SUGESTAO DE VENDA','DE '+Edit1.text+' A '+Edit2.text,'','',cadcotacao.buscas,True) then
   Exit;
 cadcotacao.vcfcot:=cadensaios.vcfensaio;
 cadcotacao.vcmvcot:=cadensaios.vperccmv;
 cadcotacao.vocvcot:=cadensaios.vpercocv;
 cadcotacao.vpequilcot:=cadensaios.vpeensaio;
 cadcotacao.vfatcot:=cadensaios.vfatensaio;
 cadcotacao.vfatdesc:=EdtPercDesconto.valor;
 cadcotacao.vlucrocot:=cadensaios.vlucroensaio;
 if ComboBox1.Text <> 'EMPRESA' then
 begin
  cadcotacao.vtipcot:=cadensaios.caddre.CadDepto.dataSet.FieldByName('COD_DEP').AsString;
  cadcotacao.vnomedep:=cadensaios.caddre.CadDepto.dataSet.FieldByName('DESC_DEP').AsString;
  if cadensaios.caddre.CadDepto.vdepprod <> 'S' then
  begin
    CheckBox1.Enabled:=false;
    GroupBox2.Enabled:=false;
  end
  else
  begin
    CheckBox1.Enabled:=true;
    GroupBox2.Enabled:=True;
  end;
  GROUP.Enabled:=true;
 end
 else
 begin
//  cadcotacao.vtipcot:='99';
//  cadcotacao.vnomedep:='EMPRESA';
//  Application.MessageBox('Sugestão de Venda feita apenas por departamento!', 'Confirmação', MB_OK);
//  exit;
 end;
end;

end.
