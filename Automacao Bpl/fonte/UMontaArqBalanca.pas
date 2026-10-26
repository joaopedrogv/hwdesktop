unit UMontaArqBalanca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ExtCtrls,IBQuery,udtmativo;

type
  TFrmMntBalanca = class(TfrmPadrao)
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BuscasReceitas,BuscasBalanca: TIBQuery;
    vcodempresa: string;
    vendfil,vendtol: string;
  end;

var
  FrmMntBalanca: TFrmMntBalanca;

implementation

uses DB, uDadosIni;

{$R *.dfm}

procedure TFrmMntBalanca.BitBtn1Click(Sender: TObject);
var
  fSetor, fCadTxt, fReceita: TextFile;
  nSetor, nCadTxt, nReceita: string;
  Arq1, Arq: TextFile;
  NomeArq1, NomeArq: string;
  vcaminho, depto, etiqueta, sql: string;
//  auxstr: ANSIstring;
begin
  inherited;
vcaminho:=Edit1.Text;
if RadioGroup1.ItemIndex = 0  then // Balança Filizola...
begin
  try
  vendfil:=Edit1.text;
  nCadTxt := vcaminho + '\CADTXT.TXT';
  AssignFile(fCadTxt, nCadTxt);
  Rewrite(fCadTxt);

  nSetor := vcaminho + '\SETORTXT.TXT';
  AssignFile(fSetor, nSetor);
  Rewrite(fSetor);

  nReceita := vcaminho + '\REC_ASS.TXT';
  AssignFile(fReceita, nReceita);
  Rewrite(fReceita);
  except
   on E: Exception do
   begin
    Application.MessageBox(PChar('Erro ao Tentar montar o arquivo para balança: '+E.message), 'Atenção', MB_ICONWARNING + MB_OK);
    exit;
   end;
  end;

  with BuscasBalanca do
  begin

    Close;
    SQL.Text := 'SELECT * FROM PRODUTOS WHERE COD_EMPRESA = ' +vcodempresa+
      ' AND ATIVO = 1 AND BALANCA_PROD = ' + QuotedStr('S');
    Open;
    while not Eof do
    begin
      vdadosini.auxstr :=vDadosIni.Space(39);
      vdadosini.MontaLinha(1, Copy(FieldByName('NUM_FAB_PROD').AsString, 8, 6));
      if UpperCase(FieldByName('UNIDADE').AsString) <> 'KG' then
        vdadosini.MontaLinha(7, 'U')
      else
        vdadosini.MontaLinha(7, 'P');
      vdadosini.MontaLinha(8, Copy(FieldByName('DESCR_PROD').AsString, 1, 22));
      vdadosini.MontaLinha(30, vdadosini.TZero(FieldByName('PREC_TAB_PROD').AsFloat, 7));
      vdadosini.MontaLinha(37, vdadosini.StrZeroSTR(Trim(FieldByName('VALIDADE_PROD').AsString), 3));

      Writeln(fCadTxt, vdadosini.auxstr);

      vdadosini.auxstr := vdadosini.Space(22);
      vdadosini.MontaLinha(1, 'GERAL       ');
      vdadosini.MontaLinha(13, Copy(FieldByName('NUM_FAB_PROD').AsString, 8, 6));
      vdadosini.MontaLinha(19, copy(FieldByName('NUM_FAB_PROD').AsString, 8, 4));
      Writeln(fSetor, vdadosini.auxstr);


      BuscasReceitas.Close;
      BuscasReceitas.SQL.Text := 'SELECT * FROM REC_ASS WHERE COD_RECEITA = ' + inttostr(FieldByName('COD_RECEITA').AsInteger);
      BuscasReceitas.Open;
      if not BuscasReceitas.IsEmpty then
      begin
        vdadosini.auxstr := vdadosini.Space(24 + length(BuscasReceitas.FieldByName('DESCRICAO').AsString));
        vdadosini.MontaLinha(0001, '            ');
        vdadosini.MontaLinha(0013, copy(TRIM(FieldByName('NUM_FAB_PROD').AsString), 8, 6));
        vdadosini.MontaLinha(0019, vdadosini.StrZero(BuscasReceitas.FieldByName('COD_RECEITA').AsInteger, 6));
        vdadosini.MontaLinha(0025, BuscasReceitas.FieldByName('DESCRICAO').asstring);
        WriteLn(fReceita, vdadosini.auxstr);
        vdadosini.auxstr := vdadosini.Space(1);
        WriteLn(fReceita, '@');
      end;
      Next;
    end;
  end;
  CloseFile(fCadTxt);
  CloseFile(fSetor);
  CloseFile(fReceita);
  BuscasReceitas.close;
  BuscasBalanca.Close;
  messagedlg('Arquivo Gerado com Sucesso', mtinformation, [mbOK], 0);
end;
if RadioGroup1.ItemIndex = 1  then
begin
 vendtol:=Edit1.text;
 depto := inputbox('Código do Departamento configurado no MGV5', 'Número do Departamento', '1');
 try
   strtoint(depto);
 except
   exit;
 end;
 etiqueta := inputbox('Número da Etiqueta configurada no departamento através do MGV5:', 'Número do Etiqueta', '');
 try
  strtoint(etiqueta);
 except
  exit;
 end;
 Nomearq := vcaminho + '\TXITENS.TXT';
 AssignFile(Arq, NomeArq);
 Rewrite(arq);
 BuscasBalanca.Close;
 BuscasBalanca.sql.Text := 'SELECT * FROM PRODUTOS WHERE BALANCA_PROD = ' + quotedstr('S') + ' and cod_empresa = ' + vcodempresa + ' and ativo=1 ';
 BuscasBalanca.open;
 vDadosIni.auxstr := vdadosini.space(320);
 while not BuscasBalanca.eof do
 begin
   vdadosini.MontaLinha(1, vdadosini.StrZeroStr(depto, 2));
   vdadosini.MontaLinha(3, vdadosini.StrZeroStr(etiqueta, 2));
   if UpperCase(trim(BuscasBalanca.fieldbyname('UNIDADE').AsString)) = 'KG' then
     vdadosini.MontaLinha(5, '0')
   else
     vdadosini.MontaLinha(5, '1');
   vdadosini.MontaLinha(6, copy(TRIM(BuscasBalanca.FieldByName('NUM_FAB_PROD').AsString), 8, 6));
   vdadosini.MontaLinha(12, vdadosini.tzero(BuscasBalanca.fieldbyname('PREC_TAB_PROD').asfloat, 6));
   try
    if BuscasBalanca.fieldbyname('VALIDADE_PROD').AsString <> '' then
     vdadosini.MontaLinha(18,Vdadosini.strzero(BuscasBalanca.fieldbyname('VALIDADE_PROD').asinteger, 3))
    else
     vdadosini.MontaLinha(18,Vdadosini.strzero(0, 3)); //Não pode ser nulo
   except
    vdadosini.MontaLinha(18,Vdadosini.strzero(0, 3)); //Não pode ser nulo
   end;
   vdadosini.MontaLinha(21, copy(BuscasBalanca.fieldbyname('DESCR_PROD').AsString, 1, 25));
   vdadosini.MontaLinha(46, copy(BuscasBalanca.fieldbyname('APLICACAO_PROD').asString, 1, 25));
       //VdadosIni.MontaLinha(71, copy(Dtm1.QRYProdutos.FieldByName('NUM_FAB_PROD').AsString, 1, 25));
//   MontaLinha(71, copy(Dtm1.qryProdutosMARCA_P.asString, 1, 50));
   //
   BuscasReceitas.Close;
   BuscasReceitas.SQL.Text := 'SELECT * FROM REC_ASS WHERE COD_RECEITA = ' + inttostr(BuscasBalanca.FieldByName('COD_RECEITA').AsInteger);
   BuscasReceitas.Open;
   if not BuscasReceitas.IsEmpty then
   begin
    vdadosini.MontaLinha(0071, copy(BuscasReceitas.FieldByName('DESCRICAO').asstring,1,50));
    if Length(BuscasReceitas.FieldByName('DESCRICAO').asstring) > 50 then
      vdadosini.MontaLinha(0121, copy(BuscasReceitas.FieldByName('DESCRICAO').asstring,51,50));
    if Length(BuscasReceitas.FieldByName('DESCRICAO').asstring) > 100 then
      vdadosini.MontaLinha(0171, copy(BuscasReceitas.FieldByName('DESCRICAO').asstring,101,50));
    if Length(BuscasReceitas.FieldByName('DESCRICAO').asstring) > 150 then
      vdadosini.MontaLinha(0221, copy(BuscasReceitas.FieldByName('DESCRICAO').asstring,151,50));
    if Length(BuscasReceitas.FieldByName('DESCRICAO').asstring) > 200 then
      vdadosini.MontaLinha(0271, copy(BuscasReceitas.FieldByName('DESCRICAO').asstring,201,49));
   end;
       //VdadosIni.MontaLinha(121, copy(DtmSup.CdsProdutoMARCA_P.asString, 1, 25));
   WriteLn(arq, vdadosini.auxstr);
   vdadosini.auxstr := vdadosini.space(320);
   BuscasBalanca.next;
     //closeFile(arq1);
 end;
 closeFile(arq);
 BuscasReceitas.close;
 BuscasBalanca.Close;
 messagedlg('Arquivo Gerado com Sucesso', mtinformation, [mbOK], 0);
end;
end;

procedure TFrmMntBalanca.BitBtn2Click(Sender: TObject);
begin
  inherited;
 _GravaConfiguracoesString('EndBalancaFIL', vendfil);
 _GravaConfiguracoesString('EndBalancaTOL', vendtol);
end;

procedure TFrmMntBalanca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  FrmMntBalanca := nil;
end;

procedure TFrmMntBalanca.FormShow(Sender: TObject);
begin
  inherited;
RadioGroup1.ItemIndex:=0;
vendfil:=_LerConfiguracoesRegistroString('EndBalancaFIL');
if vendfil = '' then
 vendfil:='C:\Filizola';
vendtol:=_LerConfiguracoesRegistroString('EndBalancaTOL');
if vendtol = '' then
 vendtol:='C:\Arquivos de programas\TOLEDO\MGV5';
edit1.text:=vendfil;
end;

procedure TFrmMntBalanca.RadioGroup1Click(Sender: TObject);
begin
  inherited;
if RadioGroup1.ItemIndex = 0 then
 edit1.text:=vendfil
else
 edit1.text:=vendtol;
end;

end.
