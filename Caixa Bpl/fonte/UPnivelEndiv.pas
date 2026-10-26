unit UPnivelEndiv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, StdCtrls, Buttons, ComCtrls, Mask, RDprint, 
  uClassesContasAReceber;

type
  TFrmPNivelEndiv = class(TfrmPadrao)
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    ComboBox2: TComboBox;
    Label4: TLabel;
    MaskEdit3: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label9: TLabel;
    ProgressBar1: TProgressBar;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RdInd: TRDprint;
    SpeedButton55: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure RdIndNewPage(Sender: TObject; Pagina: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure _rdSendMail(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPNivelEndiv: TFrmPNivelEndiv;
  obContasAreceber: TControleCredito;
  linha: integer;
  vnomecontrole: string;

implementation

{$R *.dfm}

uses uDtmAtivo, uDadosIni, uDataSet_OOP, DB, ShlObj;

procedure TFrmPNivelEndiv.BitBtn1Click(Sender: TObject);
var
  vvdiv, vvalent, vvquit, vvalPass: currency;
  vvalpdep, vvdivd, vvalentd, vvquitd: currency;
  vdtvnd, vdtvndf, vdep: string;
  vvencd, vaumd, vamortd: array[1..4] of currency;
  idep, itx: integer;
  vdatini: Tdate;
  vtotd: currency;
  vdia, vmes, vano: word;
  vdia1, vmes1, vano1: word;
  vflag: integer;
  vddep, vcodempMult: string;
  vcanc: integer;
begin
  inherited;
  if not vDadosIni.ModImp(Rdind) then
    exit;
  Rdind.FonteTamanhoPadrao := S17cpp;
  Rdind.TamanhoQteColunas := 132;
  Rdind.CaptionSetup := 'Configurações de Impressão';
  rdind.OpcoesPreview.CaptionPreview := 'Boletim de Caixa';
  rdind.TitulodoRelatorio := 'Boletim de Caixa';
  vDadosIni._LimparVarSendEmail;
  rdind.OnSendMail := vDadosini._SendMailRdPrint;
  rdind.OpcoesPreview.Preview := true;
  rdind.OnSendMail :=nil;
  vDadosIni._LimparVarSendEmail;
  rdind.OnSendMail := _rdSendMail;
  obContasAreceber.buscas.close;                     
  obContasAreceber.buscas.sql.text:='select nome_ctrl from controles ' +
  	' where codigo_emp = '+vDadosIni.codEmpresa+' and codigo_ctrl = '+MaskEdit3.Text;
  obContasAreceber.buscas.open;
  vnomecontrole:=obContasAreceber.buscas.FieldByName('NOME_CTRL').AsString;
  obContasAreceber.buscas.close;
  linha := 1;
  if not Rdind.EstaAberto then
   Rdind.Abrir;
  if obContasAreceber.vdepto.Tag <> 1 then
  begin
   obContasAreceber.vdepto.CreateDataSet;
   obContasAreceber.vdepto.Tag:=1;
  end
  else
   obContasAreceber.vdepto.EmptyDataSet;
  obContasAreceber.close;
  obContasAreceber.buscas.sql.text:='select distinct d.nome_depto from colaborador f,depto d, funcoes func,depart_ct dpcx,empresa emp where '+
  ' f.cod_funcao = func.cod_funcao and func.cod_depto = d.cod_depto and d.cod_dptocx = dpcx.cod_dep and '+
  ' f.cod_empresa = emp.cod_empresa ' +
  ' and f.cod_empresa ' +  vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, ' in ', ' = ') +
    vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
	    vDadosIni.vEmp.vCodigoUnificadas, vDadosIni.codEmpresa) +
  ' and f.ativo = 1 order by d.cod_depto';
  obContasAreceber.buscas.open;
  while not obContasAreceber.buscas.eof do
  begin
   obContasAreceber.vdepto.Append;
   obContasAreceber.vdepto.FieldByName('DEPTO').AsString:=obContasAreceber.buscas.FieldByName('nome_depto').AsString;
   obContasAreceber.vdepto.Post;
   obContasAreceber.buscas.next;
  end;
  obContasAreceber.vdepto.Append;
  obContasAreceber.vdepto.FieldByName('DEPTO').AsString:='SEM DEPTO';
  obContasAreceber.vdepto.Post;
  obContasAreceber.vdepto.First;
  label5.Visible:=true;
  while not obContasAreceber.vdepto.eof do
  begin
   Label5.caption:='Depto: '+obContasAreceber.vdepto.FieldByName('DEPTO').AsString;
   obContasAreceber.buscas1.Close;
   obContasAreceber.buscas1.sql.text:=
   ' SELECT ''CHEQUE'',ch.codigo_ch,ch.cod_cliente,ch.nome_ch,ch.data_rec,ch.n_ch,ch.data_venc,ch.valor_ch,'+
   '''                              '',ch.datq_ch,ch.tp_doc_v,ch.data_venda,case when dep.nome_depto is null then ''SEM DEPTO'' else '+
   ' dep.nome_depto end as departamento,col.nome_vendedor FROM controle_cheque ch '+
   ' left join empresa emp on ch.codigo_emp = emp.cod_empresa ' +
   ' left join colaborador col on '+
   ' ch.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
   ' = col.cod_empresa and ch.codigo_vend = col.cod_vendedor ' +
   ' left join funcoes func on col.cod_funcao = func.cod_funcao '+
   ' left join depto dep on func.cod_depto = dep.cod_depto where ch.codigo_ctrl = '+maskedit3.text+
   ' and ch.data_venc <= :vdata1 and ch.data_rec <= :vdata1 ' +
   ' and (datq_ch >= :vdata2 or (datq_ch is null)) ' +
   ' and ((ch.data_venda >= :vdatavnd1 '+
   ' and ch.data_venda <= :vdatavnd2) or ch.data_venda is null) ' +
//   ' and ch.codigo_emp ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ' +
   ' = '+vDadosIni.codEmpresa+
   ' and coalesce(dep.nome_depto,''SEM DEPTO'') = '''+ obContasAreceber.vdepto.FieldByName('DEPTO').AsString+ ''' ' +
   ' union '+
   ' SELECT ''CREDIT'',cr.cod_cred,cr.cod_cliente,cr.nome_c,cr.data_rec_c,cr.n_doc_c,cr.data_venc_c,cr.valor_c,'+
   ' cr.historico_c,datq_c,cr.tp_doc_v,cr.data_venda,case when dep.nome_depto is null then ''SEM DEPTO'' else '+
   ' dep.nome_depto end as departamento,col.nome_vendedor from controle_creditos cr '+
   ' left join empresa emp on cr.codigo_emp = emp.cod_empresa ' +
   ' left join colaborador col on '+
   ' cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
   ' = col.cod_empresa and cr.codigo_vend = col.cod_vendedor ' +
   ' left join funcoes func on col.cod_funcao = func.cod_funcao '+
   ' left join depto dep on func.cod_depto = dep.cod_depto '+
   ' where cr.codigo_ctrl = '+MaskEdit3.text+
   ' and cr.data_venc_c <= :vdata3 and cr.data_rec_c <= :vdata3 ' +
   ' and(cr.datq_c >= :vdata4 or (cr.datq_c is null)) ' +
   ' and ((cr.data_venda >= :vdatavnd1 and cr.data_venda <= :vdatavnd2) or cr.data_venda is null) ' +
//   ' and cr.codigo_emp ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
   ' = '+vDadosIni.codEmpresa+
   ' and coalesce(dep.nome_depto,''SEM DEPTO'') = '''+ obContasAreceber.vdepto.FieldByName('DEPTO').AsString+''' ' +
   ' order by 13,7 ';
   obContasAreceber.buscas1.ParamByName('vdata1').asdate := strtodate(maskedit1.text) - 1;
   obContasAreceber.buscas1.ParamByName('vdata2').asdate := strtodate(maskedit1.text);
   obContasAreceber.buscas1.ParamByName('vdata3').asdate := strtodate(maskedit1.text) - 1;
   obContasAreceber.buscas1.ParamByName('vdata4').asdate := strtodate(maskedit1.text);
   obContasAreceber.buscas1.ParamByName('vdatavnd1').asdate := strtodate(maskedit4.text);
   obContasAreceber.buscas1.ParamByName('vdatavnd2').asdate := strtodate(maskedit5.text);
   obContasAreceber.buscas1.open;
   vvalPass := 0;
   vvalent := 0;
   vvquit := 0;
   vvdiv := 0;
   if combobox2.text = 'Analitico' then
   begin
    RdInd.imp(linha, 1, 'Vencidos ate ' + datetostr(strtodate(maskedit1.text) - 1));
    linha := linha + 1;
   end;
   RdInd.imp(linha, 01, obContasAreceber.buscas1.FieldByName('departamento').AsString);
   vdep := obContasAreceber.buscas1.FieldByName('departamento').AsString;
   linha := linha + 1;
   Label5.caption:='Depto: '+vdep+'/Vencidos ate ' + datetostr(strtodate(maskedit1.text) - 1);
   ProgressBar1.min:=0;
   obContasAreceber.Buscas1.FetchAll;
   ProgressBar1.Max:=obContasAreceber.Buscas1.RecordCount;
   ProgressBar1.position:=0;
   while not obContasAreceber.buscas1.eof do
   begin
    Application.ProcessMessages;
    if vdep <> obContasAreceber.buscas1.FieldByName('departamento').AsString then
    begin
      if combobox2.text = 'Analitico' then
      begin
        linha := linha + 1;
        RdInd.imp(linha, 01, 'Vencidos no Dep em ......: ' + datetostr(strtodate(maskedit1.text) - 1));
        RdInd.imp(linha, 54, Vdadosini.Alndir(format('%n', [vvalPdep]), 12));
        linha := linha + 2;
      end;
//      if obContasAreceber.vdepto.locate('DEPTO',obContasAreceber.buscas1.FieldByName('departamento').AsString,[]) then
      begin
        obContasAreceber.vdepto.Edit;
        obContasAreceber.vdepto.FieldByName('VALORDEPTO').AsCurrency:=obContasAreceber.vdepto.FieldByName('VALORDEPTO').AsCurrency+
        vvalpdep;
        obContasAreceber.vdepto.post;
      end;
      if combobox2.text = 'Analitico' then
      begin
        RdInd.imp(linha, 01, obContasAreceber.buscas1.FieldByName('departamento').AsString);
        linha := linha + 1;
      end;
      vdep := obContasAreceber.buscas1.FieldByName('departamento').AsString;
      vvalpdep := 0.00;
      vvalpdep := vvalpdep + obContasAreceber.buscas1.FieldByName('VALOR_CH').AsCurrency;
      vvalPass := vvalPass + obContasAreceber.buscas1.FieldByName('VALOR_CH').AsCurrency;
      if combobox2.text = 'Analitico' then
      begin
        RdInd.imp(linha, 01, copy(obContasAreceber.buscas1.FieldByName('NOME_CH').AsString, 1, 30));
        RdInd.imp(linha, 32, obContasAreceber.buscas1.FieldByName('DATA_REC').asstring);
        RdInd.imp(linha, 44, obContasAreceber.buscas1.FieldByName('DATA_VENC').asstring);
        RdInd.imp(linha, 54, vDadosIni.AlnDir(format('%n',[obContasAreceber.buscas1.FieldByName('VALOR_CH').ascurrency]),12));
        RdInd.imp(linha, 68, obContasAreceber.buscas1.FieldByName('DATQ_CH').asstring);
        RdInd.imp(linha, 80, obContasAreceber.buscas1.FieldByName('DATA_VENDA').asstring);
        linha := linha + 1;
        if linha >= 60 then
        begin
          linha := 1;
          RdInd.Novapagina;
        end;
      end;
    end
    else
    begin
      vvalpdep := vvalpdep + obContasAreceber.buscas1.FieldByName('VALOR_CH').AsCurrency;
      vvalPass := vvalPass + obContasAreceber.buscas1.FieldByName('VALOR_CH').AsCurrency;
      if combobox2.text = 'Analitico' then
      begin
        RdInd.imp(linha, 01, copy(obContasAreceber.buscas1.FieldByName('NOME_CH').AsString, 1, 30));
        RdInd.imp(linha, 32, obContasAreceber.buscas1.FieldByName('DATA_REC').asstring);
        RdInd.imp(linha, 44, obContasAreceber.buscas1.FieldByName('DATA_VENC').asstring);
        RdInd.imp(linha, 54, vDadosIni.AlnDir(format('%n',[obContasAreceber.buscas1.FieldByName('VALOR_CH').ascurrency]),12));
        RdInd.imp(linha, 68, obContasAreceber.buscas1.FieldByName('DATQ_CH').asstring);
        RdInd.imp(linha, 80, obContasAreceber.buscas1.FieldByName('DATA_VENDA').asstring);
        linha := linha + 1;
        if linha >= 60 then
        begin
          linha := 1;
          RdInd.Novapagina;
        end;
      end;
    end;
    obContasAreceber.buscas1.next;
    ProgressBar1.position:=ProgressBar1.Position+1;
    if vcanc = 1 then
    begin
     if (Application.MessageBox('Deseja Cancelar Processamento?','Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes) then
      break;
    end;
    if obContasAreceber.buscas1.eof then
    begin
     if combobox2.text = 'Analitico' then
     begin
      linha := linha + 1;
      RdInd.imp(linha, 01, 'Vencidos no Dep em ......: ' + datetostr(strtodate(maskedit1.text) - 1));
      RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [vvalPdep]), 12));
      linha := linha + 2;
     end;
//     if obContasAreceber.vdepto.locate('DEPTO',obContasAreceber.buscas1.FieldByName('departamento').AsString,[]) then
     begin
      obContasAreceber.vdepto.Edit;
      obContasAreceber.vdepto.FieldByName('VALORDEPTO').AsCurrency:=obContasAreceber.vdepto.FieldByName('VALORDEPTO').AsCurrency+
      vvalpdep;
      obContasAreceber.vdepto.post;
     end;
     vvalpdep := 0.00;
    end;
   end;

   if vcanc = 1 then
   begin
    RdInd.fechar;
    obContasAreceber.buscas.Close;
    obContasAreceber.buscas1.Close;
    obContasAreceber.buscas2.Close;
    maskedit2.enabled := true;
    combobox2.enabled := true;
    bitbtn1.enabled := true;
    bitbtn2.enabled := true;
    bitbtn3.enabled := false;
    exit;
   end;
   RdInd.imp(linha, 1, vDadosIni.replicate('=', 132));
   linha := linha + 1;
   if combobox2.text = 'Analitico' then
   begin
    linha := linha + 1;
    RdInd.imp(linha, 1, 'Aumento Divida Periodo : ' + maskedit1.text + ' a ' + maskedit2.text);
    linha := linha + 1;
   end;
   obContasAreceber.buscas2.Close;
   obContasAreceber.buscas2.sql.text := 'SELECT ''CHEQUE'',ch.codigo_ch,ch.cod_cliente,ch.nome_ch,ch.data_rec,ch.n_ch,ch.data_venc,ch.valor_ch,' +
   '''                              '',datq_ch,ch.tp_doc_v,ch.data_venda,case when dep.nome_depto is null then ''SEM DEPTO'' else '+
   ' dep.nome_depto end as departamento,col.nome_vendedor FROM  controle_cheque ch ' +
   ' left join empresa emp on ch.codigo_emp = emp.cod_empresa ' +
   ' left join colaborador col on '+
   ' ch.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
   ' = col.cod_empresa and ch.codigo_vend = col.cod_vendedor ' +
   ' left join funcoes func on col.cod_funcao = func.cod_funcao '+
   ' left join depto dep on func.cod_depto = dep.cod_depto ' +
   ' where ch.codigo_ctrl = ' + maskedit3.text +
   ' and (ch.data_venc >= :vdata1 and ch.data_venc <= :vdata2 ' +
   ' and ch.data_rec <= :vdata2 or (ch.data_rec >=:vdata1 and ch.data_rec <=:vdata2 '+
   ' and ch.data_venc < :vdata1)) and (datq_ch >= :vdata3 or (datq_ch is null)) ' +
   ' and ((ch.data_venda >= :vdatavnd1 and ch.data_venda <= :vdatavnd2) '+
   ' or ch.data_venda is null) ' +
//   ' and codigo_emp ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ' +
   ' = '+vDadosIni.codEmpresa+
   ' and coalesce(dep.nome_depto,''SEM DEPTO'') = '''+ obContasAreceber.vdepto.FieldByName('DEPTO').AsString+ ''' ' +
   ' UNION ' +
   ' SELECT ''CREDIT'',cr.cod_cred,cr.cod_cliente,cr.nome_c,cr.data_rec_c,cr.n_doc_c,cr.data_venc_c,cr.valor_c,' +
   ' cr.historico_c,datq_c,cr.tp_doc_v,cr.data_venda,case when dep.nome_depto is null then ''SEM DEPTO'' else '+
   ' dep.nome_depto end as departamento,col.nome_vendedor from controle_creditos cr ' +
   ' left join empresa emp on cr.codigo_emp = emp.cod_empresa ' +
   ' left join colaborador col on '+
   ' cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
   ' = col.cod_empresa and cr.codigo_vend = col.cod_vendedor ' +
   ' left join funcoes func on col.cod_funcao = func.cod_funcao '+
   ' left join depto dep on func.cod_depto = dep.cod_depto ' +
   ' where cr.codigo_ctrl = ' + maskedit3.text +
   ' and (cr.data_venc_c >= :vdata4 and cr.data_venc_c <= :vdata5 and cr.data_rec_c <= :vdata5 ' +
   ' or (cr.data_rec_c >=:vdata4 and cr.data_rec_c <=:vdata5 and cr.data_venc_c < :vdata4)) ' +
   ' and (datq_c >=:vdata6 or (datq_c is null)) and ((cr.data_venda >= :vdatavnd1 and cr.data_venda <= :vdatavnd2) ' +
   ' or cr.data_venda is null) ' +
//   ' and codigo_emp ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
   ' = '+vDadosIni.codEmpresa+
   ' and coalesce(dep.nome_depto,''SEM DEPTO'') = '''+obContasAreceber.vdepto.FieldByName('DEPTO').AsString+ ''' ' +
   ' order by 11,7';
   obContasAreceber.buscas2.Close;
   obContasAreceber.buscas2.ParamByName('vdata1').value := strtodate(maskedit1.text);
   obContasAreceber.buscas2.ParamByName('vdata2').value := strtodate(maskedit2.text);
   obContasAreceber.buscas2.ParamByName('vdata3').value := strtodate(maskedit2.text);
   obContasAreceber.buscas2.ParamByName('vdata4').value := strtodate(maskedit1.text);
   obContasAreceber.buscas2.ParamByName('vdata5').value := strtodate(maskedit2.text);
   obContasAreceber.buscas2.ParamByName('vdata6').value := strtodate(maskedit2.text);
   obContasAreceber.buscas2.ParamByName('vdatavnd1').value := strtodate(maskedit4.text);
   obContasAreceber.buscas2.ParamByName('vdatavnd2').value := strtodate(maskedit5.text);
   obContasAreceber.buscas2.open;
   vdep := obContasAreceber.buscas2.FieldByName('departamento').AsString;
   RdInd.imp(linha, 01, obContasAreceber.buscas2.FieldByName('departamento').AsString);
   linha := linha + 1;
   Label5.caption:='Depto: '+vdep+'/Aumento da dívida no período informado';
   ProgressBar1.min:=0;
   obContasAreceber.Buscas2.FetchAll;
   ProgressBar1.Max:=obContasAreceber.Buscas2.RecordCount;
   ProgressBar1.position:=0;
   while not obContasAreceber.buscas2.eof do
   begin
    Application.ProcessMessages;
    if vdep <> obContasAreceber.buscas2.FieldByName('departamento').AsString then
    begin
      if combobox2.text = 'Analitico' then
      begin
        linha := linha + 1;
        RdInd.imp(linha, 1, 'Aumento Divida Dep Periodo : ' + maskedit1.text + ' a ' + maskedit2.text);
        RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [vvalPdep]), 12));
        linha := linha + 2;
      end;
//      if obContasAreceber.vdepto.locate('DEPTO',obContasAreceber.buscas2.FieldByName('departamento').AsString,[]) then
      begin
       obContasAreceber.vdepto.Edit;
       obContasAreceber.vdepto.FieldByName('VALORAUMENTO').AsCurrency:=obContasAreceber.vdepto.FieldByName('VALORAUMENTO').AsCurrency+
       vvalpdep;
       obContasAreceber.vdepto.post;
      end;
      if combobox2.text = 'Analitico' then
      begin
        RdInd.imp(linha, 01, obContasAreceber.buscas2.FieldByName('departamento').AsString);
        linha := linha + 1;
      end;
      vdep :=obContasAreceber.buscas2.FieldByName('departamento').AsString;
      RdInd.imp(linha, 01, obContasAreceber.buscas2.FieldByName('departamento').AsString);
      linha:=linha+1;
      vvalpdep := 0.00;
      vvalpdep := vvalpdep +obContasAreceber.buscas2.FieldByName('VALOR_CH').AsCurrency;
      vvalent := vvalent +obContasAreceber.buscas2.FieldByName('VALOR_CH').AsCurrency;
      if combobox2.text = 'Analitico' then
      begin
        RdInd.imp(linha, 01, copy(obContasAreceber.buscas2.FieldByName('NOME_CH').AsString, 1, 30));
        RdInd.imp(linha, 32, obContasAreceber.buscas2.FieldByName('DATA_REC').asstring);
        RdInd.imp(linha, 44, obContasAreceber.buscas2.FieldByName('DATA_VENC').asstring);
        RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [obContasAreceber.buscas2.FieldByName('VALOR_CH').value]), 12));
        RdInd.imp(linha, 68, obContasAreceber.buscas2.FieldByName('DATQ_CH').asstring);
        RdInd.imp(linha, 80, obContasAreceber.buscas2.FieldByName('DATA_VENDA').asstring);
        linha := linha + 1;
        if linha >= 60 then
        begin
          linha := 1;
          RdInd.Novapagina;
        end;
      end;
    end
    else
    begin
      vvalpdep := vvalpdep + obContasAreceber.buscas2.FieldByName('VALOR_CH').AsCurrency;
      vvalent := vvalent + obContasAreceber.buscas2.FieldByName('VALOR_CH').AsCurrency;
      if combobox2.text = 'Analitico' then
      begin
        RdInd.imp(linha, 01, copy(obContasAreceber.buscas2.FieldByName('NOME_CH').AsString, 1, 30));
        RdInd.imp(linha, 32, obContasAreceber.buscas2.FieldByName('DATA_REC').asstring);
        RdInd.imp(linha, 44, obContasAreceber.buscas2.FieldByName('DATA_VENC').asstring);
        RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [obContasAreceber.buscas2.FieldByName('VALOR_CH').AsCurrency]), 12));
        RdInd.imp(linha, 68, obContasAreceber.buscas2.FieldByName('DATQ_CH').asstring);
        RdInd.imp(linha, 80, obContasAreceber.buscas2.FieldByName('DATA_VENDA').asstring);
        linha := linha + 1;
        if linha >= 60 then
        begin
          linha := 1;
          RdInd.Novapagina;
        end;
      end;
    end;
    obContasAreceber.buscas2.next;
    ProgressBar1.position:=ProgressBar1.position+1;
    if vcanc = 1 then
    begin
     if messagedlg('Deseja Cancelar Processamento?', mtconfirmation, [mbYES, mbNO], 0) = mrYES then
      break;
    end;
    if obContasAreceber.buscas2.eof then
    begin
      if combobox2.text = 'Analitico' then
      begin
        linha := linha + 1;
        RdInd.imp(linha, 1, 'Aumento Divida Dep Periodo : ' + maskedit1.text + ' a ' + maskedit2.text);
        RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [vvalPdep]), 12));
        linha := linha + 2;
      end;
//      if obContasAreceber.vdepto.locate('DEPTO',obContasAreceber.buscas2.FieldByName('departamento').AsString,[]) then
      begin
       obContasAreceber.vdepto.Edit;
       obContasAreceber.vdepto.FieldByName('VALORAUMENTO').AsCurrency:=obContasAreceber.vdepto.FieldByName('VALORAUMENTO').AsCurrency+
       vvalpdep;
       obContasAreceber.vdepto.post;
      end;
      vvalpdep := 0.00;
    end;
   end;
   if vcanc = 1 then
   begin
    RdInd.fechar;
    obContasAreceber.buscas.Close;
    obContasAreceber.buscas1.Close;
    obContasAreceber.buscas2.Close;
    maskedit1.enabled := true;
    maskedit2.enabled := true;
    combobox2.enabled := true;
    bitbtn1.enabled := true;
    bitbtn2.enabled := true;
    bitbtn3.enabled := false;
    exit;
   end;
   RdInd.imp(linha, 1, Vdadosini.replicate('=', 132));
   linha := linha + 1;
   if combobox2.text = 'Analitico' then
   begin
    linha := linha + 1;
    RdInd.imp(linha, 1, 'Pagamentos No Periodo : ' + maskedit1.text + ' a ' + maskedit2.text);
    linha := linha + 1;
   end;
   obContasAreceber.buscas.Close;
   obContasAreceber.buscas.sql.text := 'SELECT ''CHEQUE'',ch.codigo_ch,ch.cod_cliente,ch.nome_ch,ch.data_rec,ch.n_ch,ch.data_venc,ch.valor_ch,' +
   '''                              '',datq_ch,ch.tp_doc_v,ch.data_venda,case when dep.nome_depto is null then ''SEM DEPTO'' else '+
   ' dep.nome_depto end as departamento,col.nome_vendedor FROM controle_cheque ch ' +
   ' left join empresa emp on ch.codigo_emp = emp.cod_empresa ' +
   ' left join colaborador col on '+
   ' ch.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
   ' = col.cod_empresa and ch.codigo_vend = col.cod_vendedor ' +
   ' left join funcoes func on col.cod_funcao = func.cod_funcao '+
   ' left join depto dep on func.cod_depto = dep.cod_depto ' +
   ' where ch.codigo_ctrl = ' + maskedit3.text +
   ' and datq_ch >= :vdata1 and datq_ch <= :vdata2 ' +
   ' and ((ch.data_venda >= :vdatavnd1 and ch.data_venda <= :vdatavnd2) or ch.data_venda is null) ' +
//   ' and codigo_emp ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else ch.codigo_emp end) ' +
   ' = '+vDadosIni.codEmpresa+
   ' and coalesce(dep.nome_depto,''SEM DEPTO'') = '''+obContasAreceber.vdepto.FieldByName('DEPTO').AsString+ ''' ' +
   ' UNION ' +
   ' SELECT ''CREDIT'',cr.cod_cred,cr.cod_cliente,cr.nome_c,cr.data_rec_c,cr.n_doc_c,cr.data_venc_c,cr.valor_c,' +
   ' cr.historico_c,datq_c,cr.tp_doc_v,cr.data_venda,case when dep.nome_depto is null then ''SEM DEPTO'' else '+
   ' dep.nome_depto end as departamento,col.nome_vendedor from controle_creditos cr ' +
   ' left join empresa emp on cr.codigo_emp = emp.cod_empresa ' +
   ' left join colaborador col on '+
   ' cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = col.cod_empresa and cr.codigo_vend = col.cod_vendedor left join funcoes func on col.cod_funcao = func.cod_funcao '+
   ' left join depto dep on func.cod_depto = dep.cod_depto ' +
   ' where cr.codigo_ctrl = ' + maskedit3.text +
   ' and datq_c >= :vdata3 and datq_c <= :vdata4 ' +
   ' and ((cr.data_venda >= :vdatavnd1 and cr.data_venda <= :vdatavnd2) or cr.data_venda is null) ' +
//   ' and codigo_emp ' +
   ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
   ' = '+vDadosIni.codEmpresa+
   ' and coalesce(dep.nome_depto,''SEM DEPTO'') = '''+obContasAreceber.vdepto.FieldByName('DEPTO').AsString+ ''' ' +
   ' order by 11,7';
   obContasAreceber.buscas.ParamByName('vdata1').value := strtodate(maskedit1.text);
   obContasAreceber.buscas.ParamByName('vdata2').value := strtodate(maskedit2.text);
   obContasAreceber.buscas.ParamByName('vdata3').value := strtodate(maskedit1.text);
   obContasAreceber.buscas.ParamByName('vdata4').value := strtodate(maskedit2.text);
   obContasAreceber.buscas.ParamByName('vdatavnd1').value := strtodate(maskedit4.text);
   obContasAreceber.buscas.ParamByName('vdatavnd2').value := strtodate(maskedit5.text);
   obContasAreceber.buscas.open;
   RdInd.imp(linha, 01, obContasAreceber.buscas.FieldByName('departamento').AsString);
   linha := linha + 1;
   vdep :=obContasAreceber.buscas.FieldByName('departamento').AsString;
   Label5.caption:='Depto: '+vdep+'/Pagamentos no período informado';
   ProgressBar1.min:=0;
   obContasAreceber.Buscas.FetchAll;
   ProgressBar1.Max:=obContasAreceber.Buscas.RecordCount;
   ProgressBar1.position:=0;
   while not obContasAreceber.buscas.eof do
   begin
    Application.ProcessMessages;
    if vdep <> obContasAreceber.buscas.FieldByName('departamento').AsString then
    begin
      if combobox2.text = 'Analitico' then
      begin
        linha := linha + 1;
        RdInd.imp(linha, 1, 'Pagamentos Dep No Periodo : ' + maskedit1.text + ' a ' + maskedit2.text);
        RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [vvalPdep]), 12));
        linha := linha + 2;
      end;
//      if obContasAreceber.vdepto.locate('DEPTO',obContasAreceber.buscas.FieldByName('departamento').AsString,[]) then
      begin
       obContasAreceber.vdepto.Edit;
       obContasAreceber.vdepto.FieldByName('VALORAMORT').AsCurrency:=obContasAreceber.vdepto.FieldByName('VALORAMORT').AsCurrency+
       vvalpdep;
       obContasAreceber.vdepto.post;
      end;
      if combobox2.text = 'Analitico' then
      begin
        RdInd.imp(linha, 01, obContasAreceber.buscas.FieldByName('departamento').AsString);
        linha := linha + 1;
      end;
      vdep := obContasAreceber.buscas.FieldByName('departamento').AsString;
      vvalpdep := 0.00;
      //     if combobox2.text = 'Analitico' then
      //     begin
      if obContasAreceber.buscas1.locate('CODIGO_CH', obContasAreceber.buscas.FieldByName('CODIGO_CH').value, []) then
      begin
        vvquit := vvquit + obContasAreceber.buscas.FieldByName('VALOR_CH').AsCurrency;
        vvalpdep := vvalpdep + obContasAreceber.buscas.FieldByName('VALOR_CH').AsCurrency;
        if combobox2.text = 'Analitico' then
        begin
          RdInd.imp(linha, 01, copy(obContasAreceber.buscas1.FieldByName('NOME_CH').AsString, 1, 30));
          RdInd.imp(linha, 32, obContasAreceber.buscas1.FieldByName('DATA_REC').asstring);
          RdInd.imp(linha, 44, obContasAreceber.buscas1.FieldByName('DATA_VENC').asstring);
          RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [obContasAreceber.buscas1.FieldByName('VALOR_CH').AsCurrency]), 12));
          RdInd.imp(linha, 68, obContasAreceber.buscas1.FieldByName('DATQ_CH').asstring);
          RdInd.imp(linha, 80, obContasAreceber.buscas1.FieldByName('DATA_VENDA').asstring);
          linha := linha + 1;
          if linha >= 60 then
          begin
            linha := 1;
            RdInd.Novapagina;
          end;
        end;
      end
      else
      begin
        if obContasAreceber.buscas2.locate('CODIGO_CH', obContasAreceber.buscas.FieldByName('CODIGO_CH').value, []) then
        begin
          vvquit := vvquit + obContasAreceber.buscas.FieldByName('VALOR_CH').AsCurrency;
          vvalpdep := vvalpdep + obContasAreceber.buscas.FieldByName('VALOR_CH').AsCurrency;
          if combobox2.text = 'Analitico' then
          begin
            RdInd.imp(linha, 01, copy(obContasAreceber.buscas2.FieldByName('NOME_CH').AsString, 1, 30));
            RdInd.imp(linha, 32, obContasAreceber.buscas2.FieldByName('DATA_REC').asstring);
            RdInd.imp(linha, 44, obContasAreceber.buscas2.FieldByName('DATA_VENC').asstring);
            RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [obContasAreceber.buscas2.FieldByName('VALOR_CH').AsCurrency]), 12));
            RdInd.imp(linha, 68, obContasAreceber.buscas2.FieldByName('DATQ_CH').asstring);
            RdInd.imp(linha, 80, obContasAreceber.buscas2.FieldByName('DATA_VENDA').asstring);
            linha := linha + 1;
            if linha >= 60 then
            begin
              linha := 1;
              RdInd.Novapagina;
            end;
          end;
        end;
      end;
      //     end;
    end
    else
    begin
      //    if combobox2.text = 'Analitico' then
      //    begin
      if obContasAreceber.buscas1.locate('CODIGO_CH', obContasAreceber.buscas.FieldByName('CODIGO_CH').value, []) then
      begin
        vvquit := vvquit + obContasAreceber.buscas.FieldByName('VALOR_CH').AsCurrency;
        vvalpdep := vvalpdep + obContasAreceber.buscas.FieldByName('VALOR_CH').AsCurrency;
        if combobox2.text = 'Analitico' then
        begin
          RdInd.imp(linha, 01, copy(obContasAreceber.buscas1.FieldByName('NOME_CH').AsString, 1, 30));
          RdInd.imp(linha, 32, obContasAreceber.buscas1.FieldByName('DATA_REC').asstring);
          RdInd.imp(linha, 44, obContasAreceber.buscas1.FieldByName('DATA_VENC').asstring);
          RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [obContasAreceber.buscas1.FieldByName('VALOR_CH').AsCurrency]), 12));
          RdInd.imp(linha, 68, obContasAreceber.buscas1.FieldByName('DATQ_CH').asstring);
          RdInd.imp(linha, 80, obContasAreceber.buscas1.FieldByName('DATA_VENDA').asstring);
          linha := linha + 1;
          if linha >= 60 then
          begin
            linha := 1;
            RdInd.Novapagina;
          end;
        end;
      end
      else
      begin
        if obContasAreceber.buscas2.locate('CODIGO_CH', obContasAreceber.buscas.FieldByName('CODIGO_CH').value, []) then
//            if QrQtPg.locate('CODIGO_CH', QrPagCODIGO_CH.value, []) then
        begin
          vvquit := vvquit + obContasAreceber.buscas.FieldByName('VALOR_CH').AsCurrency;
          vvalpdep := vvalpdep + obContasAreceber.buscas.FieldByName('VALOR_CH').AsCurrency;
          if combobox2.text = 'Analitico' then
          begin
            RdInd.imp(linha, 01, copy(obContasAreceber.buscas2.FieldByName('NOME_CH').AsString, 1, 30));
            RdInd.imp(linha, 32, obContasAreceber.buscas2.FieldByName('DATA_REC').asstring);
            RdInd.imp(linha, 44, obContasAreceber.buscas2.FieldByName('DATA_VENC').asstring);
            RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [obContasAreceber.buscas2.FieldByName('VALOR_CH').AsCurrency]), 12));
            RdInd.imp(linha, 68, obContasAreceber.buscas2.FieldByName('DATQ_CH').asstring);
            RdInd.imp(linha, 80, obContasAreceber.buscas2.FieldByName('DATA_VENDA').asstring);
            linha := linha + 1;
            if linha >= 60 then
            begin
              linha := 1;
              RdInd.Novapagina;
            end;
          end;
        end;
      end;
      //    end;
    end;
    obContasAreceber.buscas.next;
    ProgressBar1.position:=ProgressBar1.position+1;
    if vcanc = 1 then
    begin
     if messagedlg('Deseja Cancelar Processamento?', mtconfirmation, [mbYES, mbNO], 0) = mrYES then
      break;
    end;
    if obContasAreceber.buscas.eof then
    begin
      if combobox2.text = 'Analitico' then
      begin
        linha := linha + 1;
        RdInd.imp(linha, 1, 'Pagamentos Dep No Periodo : ' + maskedit1.text + ' a ' + maskedit2.text);
        RdInd.imp(linha, 54, vDadosIni.Alndir(format('%n', [vvalPdep]), 12));
        linha := linha + 2;
      end;
//      if obContasAreceber.vdepto.locate('DEPTO',obContasAreceber.buscas.FieldByName('departamento').AsString,[]) then
      begin
       obContasAreceber.vdepto.Edit;
       obContasAreceber.vdepto.FieldByName('VALORAMORT').AsCurrency:=obContasAreceber.vdepto.FieldByName('VALORAMORT').AsCurrency+
       vvalpdep;
       obContasAreceber.vdepto.post;
      end;
      vvalpdep := 0.00;
    end;
   end;
   if vcanc = 1 then
   begin
    RdInd.fechar;
    obContasAreceber.buscas.Close;
    obContasAreceber.buscas1.Close;
    obContasAreceber.buscas2.Close;
    maskedit1.enabled := true;
    maskedit2.enabled := true;
    combobox2.enabled := true;
    bitbtn1.enabled := true;
    bitbtn2.enabled := true;
    bitbtn3.enabled := false;
    exit;
   end;
   if linha >= 60 then
   begin
      linha := 1;
      RdInd.Novapagina;
   end;
   linha := linha + 2;
   RdInd.impf(linha, 01,obContasAreceber.vdepto.FieldByName('DEPTO').AsString, [negrito]);
   linha := linha + 1;
   RdInd.imp(linha, 01, 'Vencidos em ......: ' + datetostr(strtodate(maskedit1.text) - 1));
   RdInd.imp(linha, 50, vDadosIni.Alndir(format('%n', [obContasAreceber.vdepto.FieldByName('VALORDEPTO').AsCurrency]), 12));
   linha := linha + 1;
   RdInd.imp(linha, 01, 'Aumento da Divida : ');
   RdInd.imp(linha, 50, vDadosIni.Alndir(format('%n', [obContasAreceber.vdepto.FieldByName('VALORAUMENTO').AsCurrency]), 12));
   linha := linha + 1;
   RdInd.imp(linha, 01, 'Amortiz da Divida : ');
   RdInd.imp(linha, 50, vDadosIni.Alndir(format('%n', [obContasAreceber.vdepto.FieldByName('VALORAMORT').AsCurrency]), 12));
   linha := linha + 1;
   RdInd.imp(linha, 01, 'Total Divida em ..: ' + maskedit2.text);
   RdInd.imp(linha, 50, vDadosIni.Alndir(format('%n', [(obContasAreceber.vdepto.FieldByName('VALORDEPTO').AsCurrency +
   obContasAreceber.vdepto.FieldByName('VALORAUMENTO').AsCurrency - obContasAreceber.vdepto.FieldByName('VALORAMORT').AsCurrency)]), 12));
   if linha >= 60 then
   begin
    linha := 1;
    RdInd.Novapagina;
   end;
//   linha := 1;
//   RdInd.Novapagina;
   obContasAreceber.vdepto.Next;
  end;
  Rdind.Fechar;
end;

procedure TFrmPNivelEndiv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 Action:=caFree;
end;

procedure TFrmPNivelEndiv.FormCreate(Sender: TObject);
begin
  inherited;
  obContasAreceber:=TControleCredito.create;
end;

procedure TFrmPNivelEndiv.FormShow(Sender: TObject);
begin
  inherited;
  MaskEdit1.Text := DateToStr(Date);
  MaskEdit2.Text := DateToStr(Date);

  MaskEdit4.Text := DateToStr(Date);
  MaskEdit5.Text := DateToStr(Date);

  if not vDadosIni.validarAcessoEmpresasUnificadas(obContasAreceber.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    FrmPNivelEndiv.fechar := True;
    PostMessage(FrmPNivelEndiv.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;
end;

procedure TFrmPNivelEndiv.RdIndNewPage(Sender: TObject; Pagina: Integer);
begin
  inherited;
  RdInd.Imp(linha, 1, vDadosIni.vEmp.vnomeEmpresa);
  linha := linha + 1;
  RdInd.Imp(linha, 1, 'NIVEL DE ENDIVIDAMENTO');
//  linha := linha + 1;
//  RdInd.Imp(linha, 1, 'AGRUPADO POR: ' + combobox1.text);
  linha := linha + 1;
  RdInd.Imp(linha, 1, 'CONTROLE: ' +vnomecontrole);
  linha := linha + 1;
  RdInd.Imp(linha, 1, 'DE: ' + maskedit1.text + ' A: ' + maskedit2.text + ' COM VENDA DE: ' + maskedit4.text + ' ATÉ: ' + maskedit5.text);
  linha := linha + 2;
  RdInd.imp(linha, 01, 'NOME');
  RdInd.imp(linha, 32, 'DATA REC.');
  RdInd.imp(linha, 44, 'DATA VENC');
  RdInd.imp(linha, 61, 'VALOR');
  RdInd.imp(linha, 68, 'DATA QUIT');
  RdInd.imp(linha, 80, 'DATA VENDA');
  linha := linha + 1;
  RdInd.Imp(linha, 1, vdadosini.replicate('=', 132));
  linha := linha + 1;
end;

procedure TFrmPNivelEndiv.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('endividamento_por_depto%', obContasAreceber.buscas);
end;

procedure TFrmPNivelEndiv._rdSendMail(Sender: TObject);
var
 pTipo: string;
begin
  try
     pTipo := 'ENDIVIDAMENTOPORDEPTO';

     Screen.Cursor := crHourGlass;

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
      exit;

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp');

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
      exit;

      TRdprint(Sender).gerarPDF(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

      vDadosIni.EnvEmail(
      	vDadosIni.getConfSisStr('endividamento_por_depto_assunto_email', obContasAreceber.buscas),
      	vDadosIni.getConfSisBlob('endividamento_por_depto_assunto_email', obContasAreceber.buscas).Text,
        0,
        cEmail,
        '',
        '',
        cNenhum,
      	vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

     DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf'));
  finally
     Screen.Cursor := crDefault;
  end;
end;

end.
