unit UResumoCXL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uEditMoeda, Mask, Buttons, Grids, DBGrids, ExtCtrls,
  ComCtrls,UClassesPend;

type
  TFrmResumoCXL = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    DBGrid3: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    MaskEdit21: TMaskEdit;
    EditMoeda1: TEditMoeda;
    EditMoeda2: TEditMoeda;
    EditMoeda3: TEditMoeda;
    EditMoeda4: TEditMoeda;
    EditMoeda5: TEditMoeda;
    EditMoeda6: TEditMoeda;
    EditMoeda7: TEditMoeda;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    imgInformation: TImage;
    Label8: TLabel;
    EditMoeda8: TEditMoeda;
    Label9: TLabel;
    EditMoeda9: TEditMoeda;
    EditMoeda10: TEditMoeda;
    Label10: TLabel;
    Label11: TLabel;
    EditMoeda11: TEditMoeda;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cadlanc: TLancCXL;
    vcadFecd: TFecdCXL;
    cadRecCxl: TFormRecCXL;
  end;

var
  FrmResumoCXL: TFrmResumoCXL;

implementation

uses  UDtmBalcao, uDadosIni, UDetContrl, uDtmAtivo, UMensagens;

{$R *.dfm}

procedure TFrmResumoCXL.BitBtn1Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('CXL043','CONFIRMAR',vcadFecd.dataSet.fieldbyname('DIA_F_CXL').AsString+' OPERADOR: '+vDadosIni.vNomeUsuario,'','',cadlanc.Buscas,True) then
// if not vDadosIni.PesqPros('CXL043',vcadFecd.dataSet.fieldbyname('DIA_F_CXL').AsString+' OPERADOR: '+vDadosIni.vNomeUsuario,
//      cadlanc.buscas, true) then
 begin
   if vcadFecd.ExecutaComandosSql(' select cr.cod_cred,cr.n_doc_c,cr.cod_cliente,cr.Nome_c,cr.Valor_c,cr.data_venc_c,' +
      ' cr.vl_rq_pg_cxl,cr.status_cxl_rq,cr.dia_cxl,cr.op_cxl,cr.valor_corr,cr.valor_desc,cr.valor_acresc,cr.LOTE_CXL,' +
      ' cr.tp_rec_cxl,cr.cpfcgc,cr.juros_cob,cr.tp_doc_v,cr.N_doc_v,cr.CODIGO_EMP,cr.COD_EMP_MULT,cr.CODIGO_CTRL,' +
      ' cr.COONAOFISCAL,cr.US_CANCELOU,cr.DT_US_CANCELOU,cr.OBS_PARACREDITO,cr.CODIGO_VEND,cr.TIP_CNT,cr.NSERIEECF,cr.COD_TERMINAL' +
      ' from CONTROLE_CREDITOS cr inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp' +
      ' Where (cr.dia_cxl = ' + quotedstr(FormatDateTime('mm/dd/yyyy', vDadosIni.diaFCxl)) + ') and' +
      ' (cr.status_c is null or cr.status_c = '''') and' +
      ' (cr.op_cxl = ' + inttostr(vDadosIni.vcodopcxl) + ' or cr.op_cxl is null or cr.op_cxl = 0) '+
      ' and ctrl.entra_prest_cxl = ''S'' and cr.CODIGO_EMP = ' + vDadosIni.codEmpresa +
      ' and coalesce(STATUS_CXL_RQ,'''')=''R'' and coalesce(VL_RQ_PG_CXL,0) = 0 ') then
   begin
     Application.MessageBox(pchar('Há documentos recebidos(Prestações) com valor zerado no caixa.'+chr(13)+
     	'Favor corrigir antes fechar o dia.'), 'Atenção', MB_OK + MB_ICONWARNING);
     exit;
   end;

   if Application.MessageBox('Confirma o Fechamento do dia?', 'Confirmação',
   MB_YESNO + MB_DEFBUTTON2) = mrYES then
   begin
     if vcadFecd._carga_fin_emAberto then
       Exit;

     if EditMoeda2.Valor <> 0 then
     begin
       Application.MessageBox(pchar('Há documentos sem receber no caixa'), 'Informação', MB_OK + MB_ICONINFORMATION);
       if not vDadosIni.PesqPros('HW539', 'VALIDAR',
       vcadFecd.dataSet.fieldbyname('DIA_F_CXL').AsString+' OPERADOR: '+vDadosIni.vNomeUsuario, '', '',
       cadlanc.buscas, true) then
         exit;
     end;
     if EditMoeda7.valor <> 0 then
     begin
       Application.MessageBox(pchar('Houve Diferença'), 'Informação', MB_OK + MB_ICONINFORMATION);
       if not vDadosIni.PesqPros('HW479', 'VALIDAR',
       vcadFecd.dataSet.fieldbyname('DIA_F_CXL').AsString+' OPERADOR: '+vDadosIni.vNomeUsuario, '', '',
       cadlanc.buscas, true) then
         exit;
     end;
     if vcadFecd.montaarqCXL then
     begin
       if vcadFecd.ConfirmaFechamentoCXL then
        Application.MessageBox(pchar('Dia Fechado com Sucesso'), 'Informação', MB_OK + MB_ICONINFORMATION);
     end;
   end;
 end;
end;

procedure TFrmResumoCXL.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TFrmResumoCXL.BitBtn3Click(Sender: TObject);
begin
  if cadRecCxl.dataSet.IsEmpty then
    exit;

  Application.CreateForm(TFrmDetContrl,FrmDetContrl);
  FrmDetContrl.ShowModal;
  cadRecCxl.AbreformpgCXL(1);
end;

procedure TFrmResumoCXL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
  cadlanc.Free;
end;

procedure TFrmResumoCXL.FormShow(Sender: TObject);
var
 cadReq: TPendReq;
 cadOS: TPendOS;
 cadVeic: TPendVeic;
 CadRecV: TPendRecV;
// CadLanc: Tlanccxl;
 CadContr: TContrCXL;
begin
  Application.CreateForm(TFrmMensagem,FrmMensagem);
  FrmMensagem.Show;
  FrmMensagem.BringToFront;
  Application.ProcessMessages;
  cadReq:=TPendReq.create;
  cadOS:=TPendOS.create;
  cadVeic:=TPendVeic.create;
  CadRecV:=TPendRecV.create;
  CadLanc:=TLancCXL.create;
  CadContr:=TContrCXL.create;
  cadReq.vtipdoc:='REQ';
  cadReq.PegaInfRec;
  cadOS.vtipdoc:='OS';
  cados.PegaInfRec;
  cadveic.PegaInfRec;
  CadRecV.PegaInfRec;
  CadLanc.PegaInfRec;
  cadRecCxl:=TFormRecCXL.create;
  vcadFecd.pegainfrecpre;
  EditMoeda2.Valor:=(cadreq.vsrec+cadOS.vsrec+cadVeic.vsrec+CadRecV.vsrec+vcadFecd.vsrec);
  maskedit1.text := cadReq.vtipdoc;
  maskedit2.text := format('%n', [cadReq.vlVnd]);
  maskedit3.text :=vdadosini.StrZero(cadReq.qtdvnd, 5);
  maskedit4.text :=cadOS.vtipdoc;
  maskedit5.text :=format('%n', [cadOS.vlvnd]);
  maskedit6.text :=vdadosini.StrZero(cadOS.qtdvnd, 5);
  maskedit7.text := cadVeic.vtipdoc;
  maskedit8.text := format('%n', [cadVeic.vlVnd]);
  maskedit9.text := vdadosini.StrZero(cadVeic.qtdvnd, 5);
  {if vusccia = 'S' then
  begin
    maskedit10.text := QrSomaCCIA.fields[0].value;
    maskedit11.text := format('%n', [QrSomaCCIA.fields[1].ascurrency]);
    maskedit12.text := strzero(QrSomaCCIA.fields[2].value, 5);
    maskedit13.text := 'REC';
    maskedit14.text := format('%n', [QrSomaRec.fields[1].ascurrency+QrSomaRecCCIA.fields[1].ascurrency]);
    maskedit15.text := strzero(QrSomaRec.fields[2].value+QrSomaRecCCIA.fields[2].value, 5);
  end
  else
  begin}
  maskedit13.text :=CadRecV.vtipdoc;
  maskedit14.text :=format('%n', [CadRecV.vlVnd]);
  maskedit15.text := vdadosini.StrZero(CadRecV.qtdvnd, 5);
//  end;
{  if vusVeic = 'S' then
  begin
    maskedit17.text := QrSomaUs.fields[0].value;
    maskedit16.text := format('%n', [QrSomaUs.fields[1].ascurrency]);
    maskedit18.text := strzero(QrSomaUs.fields[2].value, 5);
  end;}
  maskedit19.text := 'PRE';
  maskedit20.text := format('%n', [vcadFecd.vlVnd]);
  maskedit21.text := vdadosini.strzero(vcadFecd.qtdvnd, 5); // Implementar as prestações...
  EditMoeda1.Valor:=(cadReq.vlVnd+cadOS.vlVnd+cadVeic.vlVnd+CadRecV.vlVnd+CadLanc.vlVnd+vcadFecd.vlVnd); //Total Documentos
  cadRecCxl.AbreformpgCXL(1);
  EditMoeda3.Valor:= cadRecCxl.vlrec
  		+ cadlanc.vsrec; //Total Entradas
  EditMoeda4.Valor:= - Abs(CadRecV.vlrec); //Rec Antec
  EditMoeda11.Valor:= - Abs(cadReq.vlInter); //Taxa Inter E-Commerce
  EditMoeda5.Valor:= CadLanc.vsrec;
  EditMoeda6.Valor:= (EditMoeda3.Valor{Total Entradas}
  	  - EditMoeda5.Valor); //Total Geral
  EditMoeda10.Valor := cadRecCxl.vljuros; //Juros
//  -EditMoeda5.Valor);
//  EditMoeda7.Valor:= (EditMoeda6.Valor {Total Geral}
//      + Editmoeda4.Valor {Rec Antec}
//      - EditMoeda10.Valor {Juros})
//      - EditMoeda1.Valor {Total Documentos}; //Diferença
  cadlanc.AbreLancCXL;
  cadlanc.versomentelancavl;
  EditMoeda8.Valor:= cadlanc.vllancavl; // Lanc Avulsos
//  EditMoeda7.Valor:= EditMoeda7.Valor - EditMoeda8.Valor {Lanc Avulsos};
  EditMoeda9.Valor := EditMoeda1.Valor {Total Documentos}
  	  - Abs(EditMoeda4.Valor) {Rec Antec}
      - Abs(EditMoeda11.Valor) {Taxa Inter E-Commerce}
      + EditMoeda8.Valor {Lanc Avulsos}
      + EditMoeda10.Valor {Juros}; //Total Líquido

  EditMoeda7.Valor := EditMoeda6.Valor {Total Geral} - EditMoeda9.Valor{Total Líquido};

  FrmMensagem.Free;
  vDadosIni.hw_registra_estatistica(Self.Name);

  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
     'Processo "HW479" PERMITIR FECHAR O CAIXA AUXILIAR COM DIFERENÇA' + #13 +
     'Processo "HW539" PERMITIR FECHAR O CAIXA AUXILIAR COM DOCUMENTOS SEM RECEBIMENTO';
end;

end.
