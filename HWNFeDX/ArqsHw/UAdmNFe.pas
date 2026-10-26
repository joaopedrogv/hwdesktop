unit UAdmNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.DBCtrls, UClasseNFe, pcnconversao, Data.DB;

type
   ArrayBi = array of array of shortstring;
  TFrmAdmNfe = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LbNomeEmpresa: TLabel;
    LbCNPJ_CPF: TLabel;
    LbIE: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    MaskEdit3: TMaskEdit;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn2: TBitBtn;
    btnStatusServ: TButton;
    btnConsultar: TButton;
    btnInutilizar: TButton;
    btnCancNF: TButton;
    btnConsCad: TButton;
    btnImprimir: TButton;
    btnCriarEnviar: TButton;
    btnValidarXML: TButton;
    btnGerarPDF: TButton;
    btnEnviarEmail: TButton;
    Button1: TButton;
    Label6: TLabel;
    ComboBox3: TComboBox;
    Button2: TButton;
    DBCheckBox1: TDBCheckBox;
    Label8: TLabel;
    ComboBox4: TComboBox;
    MaskEdit2: TMaskEdit;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Panel1: TPanel;
    Label10: TLabel;
    DBText1: TDBText;
    Label11: TLabel;
    DBText2: TDBText;
    Label12: TLabel;
    DBText3: TDBText;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label4: TLabel;
    lbforma: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnConsCadClick(Sender: TObject);
    procedure btnCriarEnviarClick(Sender: TObject);
    procedure btnEnviarEmailClick(Sender: TObject);
    procedure btnGerarPDFClick(Sender: TObject);
    procedure btnValidarXMLClick(Sender: TObject);
    procedure btnInutilizarClick(Sender: TObject);
    procedure btnCancNFClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnStatusServClick(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure configuraVisual(nomeCampo: string);
    procedure leconfigNFE(vClass: TClassNfe);
    function enviaNFe: boolean;
    function ImprimirNFe: boolean;
    function ImprimirEvento(codigoEvento: string): boolean;
    function EnviarEmail_NFe: Boolean;
    function CancelarNFE: boolean;
    function Mconsultasefazor(vuf: string;vchave: string;vserie: string): boolean;
    function LerSCAN: integer;
    function ConsultaNFEDLL: boolean;
    function enviaEvento(vidlote: integer): boolean;
    function enviaEventoEmail(codigoEvento: string): boolean;
    function verificaNFedestinadas(indnfe, indemi: string;vtpop: integer;{vtpcons: integer;}nsuespec: string): boolean;
    function enviaeventoNFeDestinadas(idlote: integer): boolean;
    function NFDownload(vchave: string): boolean;
    procedure Button5Click(Sender: TObject);

  private
    { Private declarations }
   naoOrdenar: boolean; // Variavel auxiliar de ordenacao das colunas
    procedure ShowStatusProcessamento(ATitulo, AMensagem: string);
  public
    { Public declarations }
    CadNfeVenda: TClassNfe;
    cadnfgeralconf: TClassNfe;
  end;

var
  FrmAdmNfe: TFrmAdmNfe;
   tIde, temit, tdest, temVeic, veiculo, ttotal, ttipo,tretirada,tentrega, tExporta: array of shortstring;
   DDadTransp,certif, geral, webservice: array of shortstring;
   tProd,DDadosdup,DdadosCupom: ArrayBi;
   x, i,vNLote: Integer;
   vTipoOP, vChaveNF: string;
   vresposta: WideString;
   vItemDI: array of Record_Item_DI;


implementation

uses UDtmHwNFE, DBClient, UFuncoesDll, UInutilizarNFE,
  uDataSet_OOP_DX, ShellAPI, UFormconsCad, UConfcontingencia,
  {pcnEnvEventoNFe,}ufrmStatus, pcnRetDistDFeInt, ACBrNFeConfiguracoes,
  pcnConversaoNFe, ACBrNFe, pcnAuxiliar, ACBrNFeNotasFiscais,
  ACBrNFeWebServices, ACBrUtil, Math, uGerarChaveNFe,
  FormHelperDFe;

{$R *.dfm}

procedure TFrmAdmNfe.BitBtn1Click(Sender: TObject);
var
 vtabela: string;
 vtp: string;
begin

{ CadNfeVenda.Open;
 CadNfeVenda.dataSet.EDIT;
 CadNfeVenda.dataSet.FieldByName('CODCLIFOR').AsInteger:=2;
 CadNfeVenda.Post;
 CadNfeVenda.Apply;}
{'NF.SEL_NFE, NF.NUM_NF_VND AS NUM_NOTA, NF.COD_EMPRESA,'
'CL.COD_CLIENTE AS CODCLIFOR,CL.NOME_CLIENTE AS NOMECLIFOR,'
'NF.DATA_EM_VND AS DATAEMISSAO,NF.SUB_SERIE AS SUBSERIE,'
'NF.CHAVE_NFE,NF.RESULTADO_ENVIO,'
'NF.DATA_AUTORIZACAO,NF.SITUACAO_NFE,NF.DIGEST,'
'NF.PROTOCOLO,NF.CODIGOERRO,NF.DESCRICAOERRO,'
'NF.TEMPORESPOSTA,NF.HORA_ENVIO,NF.TIPONFE,'
'NF.DANFEIMPRESSO,DATAHORA_ENVIO'
 }
  if (CadNfeVenda is TClassNfVenda) then
    vtabela:='NOTAFISCAL';
  if RadioButton1.Checked then
   vtp:='S';
  if RadioButton2.Checked then
   vtp:='N';
  if RadioButton3.Checked then
   vtp:='';
  if MaskEdit2.Visible then
  begin

   if not CadNfeVenda.ConsultaCampos(vtabela,ComboBox1.Text,
    ComboBox4.text,maskedit1.text,maskedit2.text,inttostr(CadNfeVenda.cadempresa.codempresa),vtp,CadNfeVenda.vtpnfe) then
      combobox1.setfocus;
  end
  else
   if CadNfeVenda.ConsultaCampos(vtabela,MaskEdit3.text,ComboBox1.Text,
    combobox2.Text,ComboBox4.text,true,inttostr(CadNfeVenda.cadempresa.codempresa),vtp,CadNfeVenda.vtpnfe) then
      ComboBox1.SetFocus;
end;

procedure TFrmAdmNfe.btnCancNFClick(Sender: TObject);
begin
  if CadNfeVenda.PesqPros(true,'HW515','') then
  begin
//   if CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').AsString <> 'Cancelada' then
//    CancelarNFE
//   else
   leconfigNFE(CadNfeVenda);
   Application.CreateForm(TFrmConfContingencia,FrmConfContingencia);
//   try
     FrmConfContingencia.cadempresa:=CadNfeVenda.cadempresa;
     FrmConfContingencia.ShowModal;
     lbforma.Caption := CadNfeVenda.cadempresa.dataSet.FieldByName('NFE_DANFE_FOREMISS').AsString;
//   finally

     FrmConfContingencia.free;
//   end;
  end;
end;

procedure TFrmAdmNfe.btnConsCadClick(Sender: TObject);
begin
//  if CadNfeVenda.PesqPros(true,'HW517') then
leconfigNFE(CadNfeVenda);
Application.CreateForm(TFrmConsCad,FrmConsCad);
FrmConsCad.vuf := CadNfeVenda.cadempresa.vSIGLA_UFemp;
FrmConsCad.ShowModal;
FrmConsCad.free;
end;

procedure TFrmAdmNfe.btnConsultarClick(Sender: TObject);
begin
  ConsultaNFEDLL;
end;

procedure TFrmAdmNfe.btnCriarEnviarClick(Sender: TObject);
var
 vflag: integer;
begin
  if CadNfeVenda.PesqPros(true,'HW512','') then
  begin
   vflag:=0;
   if not CadNfeVenda.IsEmpty then
   begin
    if CadNfeVenda.dataSet.FieldByName('NATUREZA_NF').AsString = 'E' then
    begin
     Application.MessageBox(PWideChar('Não permitio o envio de NF-e de entrada por este módulo'),PWideChar('Error'), MB_OK);
     exit;
    end;
    CadNfeVenda.First;
    while not CadNfeVenda.eof do
    begin
     if CadNfeVenda.dataSet.FieldByName('SEL_NFE').Value = 1 then
     begin
      vflag:=vflag+1;
      if (CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').Value = 'Autorizada') or
      (CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').Value = 'Cancelada') or
      (CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').Value = 'Denegada') or
      (CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').Value = 'A Inutilizar') or
      (CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').Value = 'Em Processamento') then
      begin
       Application.MessageBox(PWideChar('NF-e já Autorizada/Cancelada/Em Processamento/Denegada/A Inutilizar'),PWideChar('Error'), MB_OK);
       vflag:=vflag-1;
       CadNfeVenda.marcaSel;
      end;
      if (CadNfeVenda.dataSet.FieldByName('STATUS').Value = 'Aberta') then
      begin
       Application.MessageBox(PWideChar('NF-e está Aberta. Favor editá-la e confirmar o seu fechamento!'),PWideChar('Error'), MB_OK);
       vflag:=vflag-1;
       CadNfeVenda.marcaSel;
      end;

     end;
     CadNfeVenda.next;
    end;
   end;
  //  enviaNFe
    if vflag > 0 then
     enviaNFe
    else
     Application.MessageBox(PWideChar('Nenhuma NF-e marcada para envio. Tente novamente '),PWideChar('Error'), MB_OK);
  end;
end;

procedure TFrmAdmNfe.btnEnviarEmailClick(Sender: TObject);
{
var
 varq,para: string;
 vusassl: boolean;
 Aanexos: TStrings;
 I: Integer;
}
begin
  if CadNfeVenda.PesqPros(true,'HW520',CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString) then
    EnviarEmail_NFe;
  {
  begin
   leconfigNFE(CadNfeVenda);
   if CadNfeVenda.dataSet.FieldByName('situacao_nfe').AsString = 'Cancelada' then
   begin
     Application.MessageBox(PWideChar('NFe Cancelada, será enviado o arquivo de cancelamento para o cliente'),PWideChar('Aviso'), MB_OK);
     if CadNfeVenda.dataSet.FieldByName('DATA_LANC').AsDateTime >= strtodate('01/12/2012')  then
      CadNfeVenda.enviaEmail(ACBrNFe1,5,1,'110111')
     else
      CadNfeVenda.enviaEmail(ACBrNFe1,2,0,'0');
   end
   else
   begin
    Aanexos := CadNfeVenda.getArquivosBoletoParaAnexos;
    if CadNfeVenda.dataSet.FieldByName('NFE_DPEC_NREGDPEC').AsString <> '' then
     CadNfeVenda.enviaEmail(ACBrNFe1,3,0,CadNfeVenda.dataSet.FieldByName('NFE_DPEC_NREGDPEC').AsString, Aanexos)
    else
     CadNfeVenda.enviaEmail(ACBrNFe1,3,0,'0', Aanexos);
    if Assigned(Aanexos) then
      for I := 0 to Aanexos.Count - 1  do
        DeleteFile(PWideChar(Aanexos[I]));
   end;
  end;
  }
end;

procedure TFrmAdmNfe.btnGerarPDFClick(Sender: TObject);
var
 varq: string;
begin
  if CadNfeVenda.PesqPros(true,'HW519',CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString) then
  begin
    leconfigNFE(CadNfeVenda);
    ACBrNFe1.NotasFiscais.Clear;
    varq:=CadNfeVenda.cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+
    '\Autorizado\'+CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml';
    if FileExists(Varq) then
    begin
      ACBrNFe1.NotasFiscais.LoadFromFile(varq);
      ACBrNFe1.NotasFiscais.ImprimirPDF;
    end
    else
     Application.MessageBox(PWideChar('Arquivo XML da NFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
  end;
end;

procedure TFrmAdmNfe.btnImprimirClick(Sender: TObject);
begin
  if CadNfeVenda.PesqPros(true,'HW516',CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString) then
   imprimirNFe;
end;

procedure TFrmAdmNfe.btnInutilizarClick(Sender: TObject);
begin
  if CadNfeVenda.PesqPros(true,'HW514','') then
  begin
    leconfigNFE(CadNfeVenda);
    Application.CreateForm(TFrmInutilizarNFes,FrmInutilizarNFes);
    FrmInutilizarNFes.MskCNPJ.Text:=LbCNPJ_CPF.Caption;
    FrmInutilizarNFes.MaskEdit2.text:=CadNfeVenda.cadempresa.VSUB_SERIE;
    FrmInutilizarNFes.Showmodal;
    if FrmInutilizarNFes.vresposta = 'OK' then
    begin
    CadNfeVenda.inutilizaNFe(StrToInt(FrmInutilizarNFes.MaskEdit4.text),
    strtoint(FrmInutilizarNFes.MaskEdit5.Text),CadNfeVenda.cadempresa.codempresa,FrmInutilizarNFes.MaskEdit2.text);
    end;
    FrmInutilizarNFes.Free;
  end;
end;

procedure TFrmAdmNfe.btnStatusServClick(Sender: TObject);
var
 vresstatus: string;
begin
 leconfigNFE(CadNfeVenda);
 vresstatus:=verificarStatusWeb('S');
end;

procedure TFrmAdmNfe.btnValidarXMLClick(Sender: TObject);
var
 i: integer;
begin
  if CadNfeVenda.PesqPros(true,'HW518','') then
  begin
    ShellExecute(Handle, 'open', PWideChar('http://www.nfe.fazenda.gov.br/portal/consulta.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8='), nil, nil, SW_SHOWNORMAL);
//    application.CreateForm(TFrmRecuperaXML,FrmRecuperaXML);
//    FrmRecuperaXML.ShowModal;
//    FrmRecuperaXML.Free;
{    leconfigNFE(CadNfeVenda);
    OpenDialog1.Title := 'Selecione a NFE';
    OpenDialog1.DefaultExt := '*-nfe.XML';
    OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
     OpenDialog1.InitialDir := CadNfeVenda.cadempresa.vNFE_LOGPATH;
     if OpenDialog1.Execute then
      vChaveNF:=ExtractFilePath(OpenDialog1.FileName)+extractfilename(opendialog1.filename);
     if vChaveNF <> ''  then
     begin
      vresposta:='                    ';
      ExecutarDLL(PWideChar('Validar'), PWideChar(trim(vChaveNF)),PWideChar('.'),PWideChar(vresposta),PWideChar('1'),PWideChar('NF_VENDA'),PWideChar('1'),PWideChar('NORMAL'),PWideChar('Autorizada'),'');
     end;}
  end;
end;

procedure TFrmAdmNfe.Button1Click(Sender: TObject);
var
 atvis: boolean;
begin
 leconfigNFE(CadNfeVenda);
 atvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
 if CadNfeVenda.dataSet.FieldByName('NFE_DPEC_NREGDPEC').AsString <> '' then
 begin
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
//   ACBrNFe1.WebServices.ConsultaDPEC.nRegDPEC:=CadNfeVenda.dataSet.FieldByName('NFE_DPEC_NREGDPEC').AsString;
//   ACBrNFe1.WebServices.ConsultaDPEC.Executar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=atvis;
 end
 else
 begin
  if application.messagebox('Nota Fiscal sem numero de registro DPEC. deseja consultar pela chave da NFe?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
  begin
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
//   ACBrNFe1.WebServices.ConsultaDPEC.NFeChave:=CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString;
//   ACBrNFe1.WebServices.ConsultaDPEC.Executar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=atvis;
  end;
 end;
end;

procedure TFrmAdmNfe.Button2Click(Sender: TObject);
var
 vflag: integer;
begin
  if CadNfeVenda.PesqPros(true,'NFE002','') then
  begin
    leconfigNFE(CadNfeVenda);
    vflag:=0;
    CadNfeVenda.First;
    while not CadNfeVenda.eof do
    begin
     if CadNfeVenda.dataSet.FieldByName('SEL_NFE').Value = 1 then
     begin
      if (CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').Value = 'Autorizada') or
      (CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').Value = 'Cancelada') then
       vflag:=vflag+1
      else
      begin
       Application.MessageBox(PWideChar('NF-e não Autorizada/Cancelada'),PWideChar('Error'), MB_OK);
       vflag:=vflag-1;
       CadNfeVenda.marcaSel;
      end;
     end;
     CadNfeVenda.next;
    end;
  //  enviaNFe
    if vflag > 0 then
     CadNfeVenda.enviaEmail(ACBrNFe1,4,0,'0')
    else
     Application.MessageBox(PWideChar('Nenhuma NF-e marcada para envio. Tente novamente '),PWideChar('Error'), MB_OK);
  end;
end;

procedure TFrmAdmNfe.Button3Click(Sender: TObject);
var
 vresstatus: string;
begin
 if CadNfeVenda.dataSet.FieldByName('NFE_RECIBO').AsString <> '' then
 begin
  leconfigNFE(CadNfeVenda);
    vresstatus:=verificarRecibolote(PWideChar(CadNfeVenda.dataSet.FieldByName('NFE_RECIBO').AsString));
 end;
end;

procedure TFrmAdmNfe.Button4Click(Sender: TObject);
var
 vnum,vchavegerada,vdata,vtpemiss,vserie,vcnf: string;
 ASerie: Integer;
begin
  leconfigNFE(CadNfeVenda);
  Application.CreateForm(TfrmGerarChaveNFe, frmGerarChaveNFe);
  with frmGerarChaveNFe do
  begin
    UF := CadNfeVenda.cadempresa.dataSet.FieldByName('IBGE_CODIGO_UF').asinteger;
    CNPJ := CadNfeVenda.cadempresa.dataset.FieldByName('CGC_EMP').AsString.Trim;
    if CadNfeVenda.dataSet.FieldByName('data_contabil').IsNull then
      DataEmi := FormatDateTime('dd/mm/yyyy', Now)
    else
      DataEmi := FormatDateTime('dd/mm/yyyy', CadNfeVenda.dataSet.FieldByName('data_contabil').AsDateTime);
    nNF := CadNfeVenda.dataSet.FieldByName('num_nf').AsInteger;
    if TryStrToInt(CadNfeVenda.dataSet.FieldByName('serie').AsString.Trim, ASerie) then
      cSerie := ASerie
    else
      cSerie := 0;
    cNF := Math.IfThen(CadNfeVenda.dataSet.FieldByName('cnfe').AsInteger > 0,
                       CadNfeVenda.dataSet.FieldByName('cnfe').AsInteger,
                       CadNfeVenda.dataSet.FieldByName('num_nf').AsInteger);
    tpEmiss := IfThen(CadNfeVenda.cadempresa.dataSet.FieldByName('NFE_DANFE_FOREMISS').AsString.ToUpper.Contains('SVC'), 6, 1);
    ShowModal;
  end;
  FreeAndNil(frmGerarChaveNFe);

  Exit;

  if Trim(CadNfeVenda.dataSet.FieldByName('chave_nfe').AsString) <> '' then
  begin
    vnum := IntToStr(CadNfeVenda.dataSet.FieldByName('num_nf').AsInteger);
    vdata := DateToStr(CadNfeVenda.dataSet.FieldByName('data_contabil').AsDateTime);
    vserie := Trim(CadNfeVenda.dataSet.FieldByName('serie').AsString);
    vcnf := IntToStr(Math.IfThen(CadNfeVenda.dataSet.FieldByName('cnfe').AsInteger > 0,
                                 CadNfeVenda.dataSet.FieldByName('cnfe').AsInteger,
                                 CadNfeVenda.dataSet.FieldByName('num_nf').AsInteger));
  end;
  if (InputQuery('Chave NFe', 'Entre com o Número Desejado: ', vnum)) then
  begin
    try
      strtoint(vnum);
    except
      Application.MessageBox(PWideChar('Número da NF Inválido'),PWideChar('Error'), MB_OK);
      exit;
    end;
  end;
  if (InputQuery('Chave NFe', 'Entre com a Data de Emissão da NF FORMATO DD/MM/AAAA: ', vdata)) then
  begin
    try
      strtodatetime(vdata);
    except
      Application.MessageBox(PWideChar('Data informada está Inválido'),PWideChar('Error'), MB_OK);
      exit;
    end;
  end;
  if (InputQuery('Chave NFe', 'Tipo de emissao(1-NORMAL,6-CONTINGENCIA): ', vtpemiss)) then
  begin
    try
      strtoint(vtpemiss);
    except
      Application.MessageBox(PWideChar('Tipo de emissão stá Inválido'),PWideChar('Error'), MB_OK);
      exit;
    end;
  end;
  vserie:=CadNfeVenda.cadempresa.VSUB_SERIE;
  if (InputQuery('Chave NFe', 'Serie da NFe: ', vserie)) then
  begin
    try
      strtoint(vserie);
    except
      Application.MessageBox(PWideChar('Tipo de emissão stá Inválido'),PWideChar('Error'), MB_OK);
      exit;
    end;
  end;

    vchavegerada:=GeraChaveNFe(CadNfeVenda.cadempresa.dataSet.FieldByName('IBGE_CODIGO_UF').asinteger,
    strtoint(vcnf),55,strtoint(vserie),strtoint(vnum),strtoint(vtpemiss),PWideChar(vdata),PWideChar(trim(CadNfeVenda.cadempresa.dataset.FieldByName('CGC_EMP').AsString)));
    InputQuery('Chave NFe', 'Chave Gerada conforme informações:', vchavegerada);
end;

procedure TFrmAdmNfe.Button5Click(Sender: TObject);
begin
  Application.CreateForm(TFrmHelperDFe, FrmHelperDFe);
  FrmHelperDFe.ShowModal;
end;

function TFrmAdmNfe.CancelarNFE: boolean;
var
 vjust: string;
begin
 result:=true;
 if not (InputQuery('WebServices Cancelamento', 'Justificativa', vjust)) then
 begin
   Result:=false;
   exit;
 end;
 if vjust = '' then
 begin
   Application.MessageBox(PWideChar('Justificativa precisa ser preenchida'),PWideChar('Error'), MB_OK);
   Result:=false;
   exit;
 end;
 leconfigNFE(CadNfeVenda);
 ExecutarDLL('Cancelar',PWideChar(CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.XML'),(vjust),vresposta,'1',
 'NF_VENDA',PWideChar(inttostr(CadNfeVenda.cadempresa.codempresa)),PWideChar(CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString),
 PWideChar(CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').AsString),'',PWideChar(CadNfeVenda.cadempresa.vWEBSERV_UF));
 if vresposta = 'OK' then
 begin
   CadNfeVenda.obtemdadostotaisnf;
   CadNfeVenda.CancelaNFEint(strtoint(CadNfeVenda.VNUMNOTA),vjust);
   if CadNfeVenda.cadempresa.vENVIAEMAILNFE = 'S' then
     CadNfeVenda.enviaEmail(ACBrNFe1,2,0,'0');
 end
 else
 begin
  Result:=false;
 end;
end;

procedure TFrmAdmNfe.ComboBox1Enter(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        exit;
      end;
    end;
  end;
end;

procedure TFrmAdmNfe.ComboBox1Exit(Sender: TObject);
var
  i: integer;
begin
  if ActiveControl = BitBtn1 then
    Exit;

  if ComboBox1.Text <> 'TODOS' then
    ComboBox1.Text := ComboBox1.Items[ComboBox1.ItemIndex];
  if ComboBox1.Text <> 'TODOS' then
    ComboBox4.Text := ComboBox1.Text
  else
    ComboBox4.Text := ComboBox1.Items[0];
  if DBGrid1.DataSource <> nil then
  for I := 0 to DBGrid1.Columns.Count - 1 do
  begin
    if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
    begin
      naoOrdenar := true;
        configuraVisual(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName);
      //        DBGrid1TitleClick(DBGrid1.Columns[i]);
      naoOrdenar := false;
      Exit;
    end;
  end;
end;

procedure TFrmAdmNfe.ComboBox3Exit(Sender: TObject);
begin
  DBText2.DataField:='CIDADE';
  DBText1.DataField:='NOME_CLIENTE';

  {
  if not Assigned(CadNfeVenda) then
  begin
    CadNfeVenda := TClassNfVenda.create;
    CadNfeVenda.cadempresa := CadNfeVenda.cadempresa;
  end
  else
  begin
    if (CadNfeVenda is TClassNfVenda) then
      CadNfeVenda.cadempresa:=CadNfeVenda.cadempresa
    else
    begin
      CadNfeVenda.free;
      CadNfeVenda:=TClassNfVenda.create;
      CadNfeVenda.cadempresa:=CadNfeVenda.cadempresa;
    end;
  end;
  Exit;
  }

  if ComboBox3.Text = 'NOTAS FISCAIS DE SAÍDA' then
    CadNfeVenda.vtpnfe:='S'
  else
    CadNfeVenda.vtpnfe:='E';

  CadNfeVenda.vusuario := CadNfeVenda.vusuario;
  CadNfeVenda.RetornaAtributos(ComboBox1,ComboBox4);
  ComboBox1.Text:=CadNfeVenda.dataSet.Fields[1].DisplayName;
  ComboBox4.Text:=CadNfeVenda.dataSet.Fields[1].DisplayName;
  CadNfeVenda.abrevazio;
  DBText1.DataField:=CadNfeVenda.cadclfor.vnomecampodataset;
  dbgrid1.Columns[0].Width:=20;
end;

procedure TFrmAdmNfe.configuraVisual(nomeCampo: string);
var
  i: integer;
begin
  if DBGrid1.DataSource <> nil then
    for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
    begin
      if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = nomeCampo then
      begin
        if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i] is TDateTimeField then
        begin
          MaskEdit3.Visible := false;
          MaskEdit1.Visible := true;
          MaskEdit2.Visible := true;
//          Label4.Visible := true;
          if MaskEdit1.Text = '  /  /    ' then
            MaskEdit1.Text := DateToStr(Date);
          if MaskEdit2.Text = '  /  /    ' then
            MaskEdit2.Text := DateToStr(Date);
          ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          ComboBox4.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          MaskEdit1.SetFocus;
          Break;
        end
        else
        begin
          MaskEdit3.Visible := true;
          MaskEdit1.Visible := false;
          MaskEdit2.Visible := false;
//          Label4.Visible := true;
          MaskEdit3.EditMask := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].EditMask;
          ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          ComboBox4.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          MaskEdit3.SetFocus;
          Break;
        end;
      end;
    end;
end;

function TFrmAdmNfe.ConsultaNFEDLL: boolean;
var
 varq: string;
 vstatatual, vOut: Boolean;
 vflag, I: integer;
 vchave: ansistring;
 dhCont: TDateTime;
 xJust: string;
 vLista: TStringList;
 vErrosASS, vNORMAL_SVC: string;
 AFilesEnvLote, AXmlFile: TStrings;
begin
(*
if CadNfeVenda.PesqPros(true,'HW513',CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString) then
 begin
  if not CadNfeVenda.dataSet.IsEmpty then
  begin
      leconfigNFE(CadNfeVenda);
      CadNfeVenda.first;
      while not CadNfeVenda.Eof do
      begin
       if CadNfeVenda.dataSet.fieldbyname('SEL_NFE').value = 1 then
//       if DBGrid1.SelectedRows.CurrentRowSelected then
       begin
        if (CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').AsString = 'Autorizada')
        or (CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').AsString = 'Cancelada') then
        begin
          vstatatual:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
          ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
          try
            varq:=CadNfeVenda.cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+
            '\Autorizado\'+CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml';
            if FileExists(Varq) then
            begin
             if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SVC' then
               ACBrNFe1.Configuracoes.Geral.FormaEmissao:=CadNfeVenda.cadempresa.TpEmisUFToStr(CadNfeVenda.cadempresa.vWEBSERV_UF)
             else if CadNfeVenda.dataSet.FieldByName('SERIE').AsInteger =
             CadNfeVenda.cadempresa.vSERIE_SCAN then
                ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN
             else
              ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
             ACBrNFe1.NotasFiscais.Clear;
             ACBrNFe1.NotasFiscais.LoadFromFile(varq);
             ACBrNFe1.Consultar;
             if CadNfeVenda.cadempresa.vENVIAEMAILNFE = 'S' then
               CadNfeVenda.enviaEmail(ACBrNFe1,1,0,'0');
             CadNfeVenda.Edit;
             CadNfeVenda.dataSet.FieldByName('SEL_NFE').Value:=0;
             CadNfeVenda.Post;
            end
            else
             Application.MessageBox(PWideChar('Arquivo XML da NFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
          finally
            ACBrNFe1.Configuracoes.WebServices.Visualizar:=vstatatual;
            ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
          end;
        end
        else
        begin
          vstatatual:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
          ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
          try
            varq:=CadNfeVenda.cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString+
            '\'+CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.xml';
            if FileExists(Varq) then
            begin
              ACBrNFe1.Configuracoes.Geral.FormaEmissao := StrToTpEmis(vOut, Copy(CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString, 35, 1));
              if ACBrNFe1.Configuracoes.Geral.FormaEmissao = teNormal then
                vNORMAL_SVC := 'NORMAL'
              else
                vNORMAL_SVC := 'SVC';
//             if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SVC' then
//               ACBrNFe1.Configuracoes.Geral.FormaEmissao:=CadNfeVenda.cadempresa.TpEmisUFToStr(CadNfeVenda.cadempresa.vWEBSERV_UF)
//             else if CadNfeVenda.dataSet.FieldByName('SERIE').AsInteger =
//              CadNfeVenda.cadempresa.vSERIE_SCAN then
//                ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN
//             else
//              ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
             ACBrNFe1.NotasFiscais.Clear;
             ACBrNFe1.NotasFiscais.LoadFromFile(varq);
             try
               ACBrNFe1.Consultar;
             except on E: Exception do
               begin
                 if (Pos('DigestValue do documento', E.Message) > 0) and
                   (Pos('não confere.', E.Message) > 0) and
                   (ACBrNFe1.NotasFiscais.Count > 0) then
                 begin
                   Application.MessageBox(PWideChar('DigestValue da NF-e diverge do retorno do webService' + #13 +
                     'Digest NF: ' + ACBrNFe1.NotasFiscais.Items[0].NFe.signature.DigestValue + #13 +
                     'Digest WS: ' +ACBrNFe1.WebServices.Consulta.protNFe.digVal), 'Anteção', 0 + 64);
                   try
                     ShowStatusProcessamento('Localizando DigestValue ', 'Localizando DigestValue na pasta dos XML''s');
                     AFilesEnvLote := TStringList.Create;
                     AXmlFile      := TStringList.Create;
                     FindFiles(IncludeTrailingPathDelimiter(ACBrNFe1.Configuracoes.Arquivos.PathSalvar) +
                       '*-env-lot.xml', AFilesEnvLote);

                     for I := AFilesEnvLote.Count - 1 downto 0 do
                     begin
                       ShowStatusProcessamento('', 'Localizando... ' + IntToStr(100 - Trunc( I / AFilesEnvLote.Count * 100  )) + '%');
                       AXmlFile.LoadFromFile(AFilesEnvLote[I]);
                       ACBrNFe1.NotasFiscais.Clear;
                       ACBrNFe1.NotasFiscais.LoadFromString(AXmlFile.Text);
                       if ACBrNFe1.NotasFiscais.Count > 0 then
                         if (ACBrNFe1.NotasFiscais.Items[0].NumID = ACBrNFe1.WebServices.Consulta.protNFe.chNFe) and
                           (ACBrNFe1.NotasFiscais.Items[0].NFe.signature.DigestValue = ACBrNFe1.WebServices.Consulta.protNFe.digVal )then
                         begin
                           AXmlFile.Text := ACBrNFe1.NotasFiscais.Items[0].XML;
                           AXmlFile.SaveToFile(IncludeTrailingPathDelimiter(ACBrNFe1.Configuracoes.Arquivos.PathSalvar) +
                             ACBrNFe1.NotasFiscais.Items[0].NumID + '-nfe.xml');
                           ACBrNFe1.Consultar;
                           Break;
                         end;
                     end;
                   finally
                     FreeAndNil(frmStatus);
                     FreeAndNil(AXmlFile);
                     FreeAndNil(AFilesEnvLote);
                   end;
                   //raise EACBrNFeException.Create('DigestValue do documento ' +
                   //   NumID + ' não confere.');
                 end
                 else
                   raise EACBrNFeException.Create(e.Message);
               end;
             end;

             CadNfeVenda.Edit;
             CadNfeVenda.dataSet.FieldByName('SEL_NFE').Value:=1;
             CadNfeVenda.GravaRetNFE(ACBrNFe1,2,0);
             if CadNfeVenda.vxmsg <> '' then
              Application.MessageBox(PWideChar('Mensagem da SEFAZ Cod.: '+#13+CadNfeVenda.vcmsg+' Mensagem: '+CadNfeVenda.vxmsg),PWideChar('Advertência'), MB_OK);

              //Caso notas tenha sido enviadas no ambiente normal e nao obteve a resposta
              //Aqui o sistema verifica a mudanca de ambiente, e pergunta se deseja fazer a consulta no outro ambiente
             if (ACBrNFe1.WebServices.Consulta.cStat in [204, 217]) then
             begin
               if Application.MessageBox(PWideChar('Deseja consultar nota fiscal novamente?'),
                 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
               begin
                 vLista := TStringList.Create;
                 vLista.LoadFromFile(varq);
                 ACBrNFe1.NotasFiscais.Clear;
                 ACBrNFe1.NotasFiscais.LoadFromString(vLista.Text);

                 // aqui caso a consulta anterior foi no svc, entao vai fazer a consulta no normal e vice versa
                 if Trim(vNORMAL_SVC) = 'NORMAL' then
                   ACBrNFe1.Configuracoes.Geral.FormaEmissao := CadNfeVenda.cadempresa.TpEmisUFToStr(CadNfeVenda.cadempresa.vWEBSERV_UF)
                 else
                   ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;

                 for I := 0 to ACBrNFe1.NotasFiscais.Count - 1 do
                 begin
                   vchave := GeraChaveNFe(
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.cUF,
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.cNF,
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.modelo,
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.serie,
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.nNF,
                     StrToInt(TpEmisToStr(ACBrNFe1.Configuracoes.Geral.FormaEmissao)),
                     DateToStr(ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.dEmi),
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Emit.CNPJCPF);
                   ACBrNFe1.NotasFiscais.Items[I].NFe.infNFe.ID := vchave;
                   ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.tpEmis := ACBrNFe1.Configuracoes.Geral.FormaEmissao;
                   if ACBrNFe1.Configuracoes.Geral.FormaEmissao = teNormal then
                   begin
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.dhCont := 0;
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.xJust := '';
                   end
                   else if ACBrNFe1.Configuracoes.Geral.FormaEmissao in [teSVCAN, teSVCRS] then
                   begin
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.dhCont := CadNfeVenda.dataSet.FieldByName('NFE_DHCONT').AsDateTime;
                     ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.xJust := CadNfeVenda.dataSet.FieldByName('NFE_XJUST').AsString;
                   end;
                 end;

                 ACBrNFe1.NotasFiscais.GerarNFe;
                 ACBrNFe1.NotasFiscais.Assinar;
                 ACBrNFe1.Consultar;

                 CadNfeVenda.Edit;
                 CadNfeVenda.dataSet.FieldByName('SEL_NFE').Value:=1;
                 CadNfeVenda.GravaRetNFE(ACBrNFe1,2,0);
               end
               else if Application.MessageBox(PWideChar('Deseja informar o XML baixado no site da SEFAZ?'),
                 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
               begin
                 ACBrNFe1.Configuracoes.Geral.FormaEmissao := StrToTpEmis(vOut, Copy(CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString, 35, 1));
                 OpenDialog1.Title := 'Selecione a NFE';
                 OpenDialog1.DefaultExt := '*.xml';
                 OpenDialog1.Filter := 'Arquivos XML (*.XML)|Arquivos NFE (*-nfe.XML)|*-nfe.XML|*.XML|Todos os Arquivos (*.* )|*.*';
                 if OpenDialog1.Execute then
                 begin
                   varq:=ExtractFilePath(OpenDialog1.FileName)+extractfilename(opendialog1.filename);
                   ACBrNFe1.NotasFiscais.Clear;
                   ACBrNFe1.NotasFiscais.LoadFromFile(varq);
                   vErrosASS := '';
                   if not ACBrNFe1.NotasFiscais.VerificarAssinatura(vErrosASS) then
                   begin
                     Application.MessageBox(PWideChar('Erro ao validar assinatura do XML informado' + #13 +
                       vErrosASS), 'Erro', MB_ICONERROR + MB_OK);
                   end
                   else
                   begin
                     vLista := TStringList.Create;
                     for I := 0 to ACBrNFe1.NotasFiscais.Count - 1 do
                       if (ACBrNFe1.NotasFiscais.Items[I].NFe.procNFe.cStat in [100, 104]) and
                         (ACBrNFe1.NotasFiscais.Items[I].NFe.Ide.nNF = CadNfeVenda.dataSet.FieldByName('num_nf').AsInteger) then
                       begin
                         vLista.LoadFromFile(varq);
                         vLista.SaveToFile(ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' + ACBrNFe1.NotasFiscais.Items[I].NFe.procNFe.chNFe + '-nfe.xml');
                         CadNfeVenda.Edit;
                         CadNfeVenda.dataSet.FieldByName('SEL_NFE').Value:=1;
                         CadNfeVenda.GravaRetNFE(ACBrNFe1,3,0);
                       end;
                   end;

                 end;
               end;
             end;
            end
            else
            begin
             Application.MessageBox(PWideChar('Arquivo XML da NFe não encontrado no caminho: '+#13+varq),PWideChar('Error'), MB_OK);
             if application.messagebox('Deseja buscar pelo arquivo XML?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
             begin
              OpenDialog1.Title := 'Selecione a NFE';
              OpenDialog1.DefaultExt := '*-nfe.xml';
              OpenDialog1.Filter := 'Arquivos NFE (*-nfe.xml)|*-nfe.xml|Arquivos XML (*.xml)|*.xml|Todos os Arquivos (*.* )|*.*';
              OpenDialog1.InitialDir := CadNfeVenda.cadempresa.vNFE_LOGPATH;
              if OpenDialog1.Execute then
              begin
               varq:=ExtractFilePath(OpenDialog1.FileName)+extractfilename(opendialog1.filename);
               if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SVC' then
                 ACBrNFe1.Configuracoes.Geral.FormaEmissao:=CadNfeVenda.cadempresa.TpEmisUFToStr(CadNfeVenda.cadempresa.vWEBSERV_UF)
               else if CadNfeVenda.dataSet.FieldByName('SERIE').AsInteger =
                CadNfeVenda.cadempresa.vSERIE_SCAN then
                ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN
               else
                ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
               ACBrNFe1.NotasFiscais.Clear;
               ACBrNFe1.NotasFiscais.LoadFromFile(varq);
               ACBrNFe1.Consultar;
               CadNfeVenda.Edit;
               CadNfeVenda.dataSet.FieldByName('SEL_NFE').Value:=1;
               CadNfeVenda.GravaRetNFE(ACBrNFe1,2,0);
                if CadNfeVenda.vxmsg <> '' then
                 Application.MessageBox(PWideChar('Mensagem da SEFAZ Cod.: '+#13+CadNfeVenda.vcmsg+' Mensagem: '+CadNfeVenda.vxmsg),PWideChar('Advertência'), MB_OK);
              end;
             end;
            end;
          finally
           ACBrNFe1.Configuracoes.WebServices.Visualizar:=vstatatual;
           ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
          end;
        end;
       end;
       CadNfeVenda.next;
      end;
  end;
 end;
 *)
end;

procedure TFrmAdmNfe.DBGrid1ColExit(Sender: TObject);
begin
  if DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField then
    DBCheckBox1.Visible := False
end;

procedure TFrmAdmNfe.DBGrid1DblClick(Sender: TObject);
begin
 CadNfeVenda.marcaSel;
end;

procedure TFrmAdmNfe.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const IsChecked : array[boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
     DBCheckBox1.Left := Rect.Left + DBGrid1.Left + 5;
     DBCheckBox1.Top := Rect.Top + DBGrid1.top + 2;
     DBCheckBox1.Width := Rect.Right - Rect.Left;
     DBCheckBox1.Height := Rect.Bottom - Rect.Top;

     DBCheckBox1.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = DBCheckBox1.DataField) then
    begin
      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);
      DrawState := ISChecked[(Column.Field.value = 1)];

      DBGrid1.Canvas.FillRect(Rect);
      DrawFrameControl(DBGrid1.Canvas.Handle, DrawRect,
                       DFC_BUTTON, DrawState);
    end;
  end;
end;

procedure TFrmAdmNfe.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = Chr(9)) then Exit;

  if (DBGrid1.SelectedField.FieldName = DBCheckBox1.DataField) then
  begin
    DBCheckBox1.SetFocus;
    SendMessage(DBCheckBox1.Handle, WM_Char, word(Key), 0);
  end;
end;

function TFrmAdmNfe.enviaEvento(vidlote: integer): boolean;
var
 vstvis: boolean;
 vflagevento: integer;
 I, J, ACodNF: integer;
 ANFe: NotaFiscal;
 AFileName: string;
 AWriteNewNFe: Boolean;
begin
 result:=false;
 try
   leconfigNFE(CadNfeVenda);
   ACBrNFe1.Configuracoes.Geral.VersaoDF := ve400;
   if CadNfeVenda.cadCCe.buscaEvento(vidlote,CadNfeVenda.cadempresa.codempresa) then
   begin
     if CadNfeVenda.cadCCe.dataSet.FieldByName('TIPO_EVENTO').AsString = 'EPE' then
     begin
       if CadNfeVenda.cadCCe.dataSet.FieldByName('situacao').AsString = 'Autorizada' then
         raise Exception.Create('Evento já autorizado');

       if CadNfeVenda.cadCCe.dataSet.FieldByName('nseqevento').AsInteger <> 1 then
         raise Exception.Create('Evento EPEC permitido deve ser o primeiro');

       ACodNF := CadNfeVenda.cadCCe.dataSet.FieldByName('cod_nf').AsInteger;

       CadNfeVenda.buscas.Close;
       CadNfeVenda.buscas.SQL.Text :=
         'select nf.situacao_nfe, ev.situacao, ev.xml_nfe_epec, ev.xml_evento from NOTAFISCAL nf' +
         ' inner join NOTAFISCAL_CARTA_CORRECAO ev on ev.cod_nf = nf.cod_nf and ev.cod_empresa = nf.cod_empresa' +
         '   and ev.idlote = ' + IntToStr(vidlote) + ' and nseqevento = 1' +
         ' where nf.cod_nf = ' + IntToStr(ACodNF) +
         ' and nf.cod_empresa = '+inttostr(CadNfeVenda.cadempresa.codempresa);
       CadNfeVenda.buscas.Open;

       //fazer os testes aqui
       if CadNfeVenda.buscas.FieldByName('situacao_nfe').AsString <> '' then
         raise Exception.Create('Nota Fiscal já possui status: ' + CadNfeVenda.buscas.FieldByName('situacao_nfe').AsString + #13 +
           'Não é possível enviar Evento EPEC');

       ACBrNFe1.NotasFiscais.Clear;
       ACBrNFe1.EventoNFe.Evento.Clear;

       AWriteNewNFe := (Trim(CadNfeVenda.buscas.FieldByName('situacao').AsString) = '') or
                       (Trim(CadNfeVenda.buscas.FieldByName('situacao').AsString) = 'Rejeitada');

       if (not AWriteNewNFe) and (Trim(CadNfeVenda.buscas.FieldByName('xml_nfe_epec').AsString) <> '') then
         ACBrNFe1.NotasFiscais.LoadFromString(Trim(CadNfeVenda.buscas.FieldByName('xml_nfe_epec').AsString), False)
       else
         CadNfeVenda.AddNotaFiscalToACBrNFe(ACodNF, 4 {DPEC}, ACBrNFe1);

       if ACBrNFe1.NotasFiscais.Count > 0 then
       begin
//         ACBrNFe1.NotasFiscais.GerarNFe;
         ACBrNFe1.NotasFiscais.Assinar;

         if (not AWriteNewNFe) and (Trim(CadNfeVenda.buscas.FieldByName('xml_evento').AsString) <> '') then
           ACBrNFe1.EventoNFe.LerXMLFromString(Trim(CadNfeVenda.buscas.FieldByName('xml_evento').AsString))
         else
         begin
           with ACBrNFe1.EventoNFe.Evento.Add do
           begin
             with ACBrNFe1.NotasFiscais.Items[0] do
             begin
               InfEvento.id                           := NFe.infNFe.ID;
               InfEvento.cOrgao                       := 91;
               InfEvento.tpAmb                        := NFe.Ide.tpAmb;
               InfEvento.CNPJ                         := NFe.Emit.CNPJCPF;
               InfEvento.chNFe                        := NumID;
               InfEvento.dhEvento                     := Now;
               InfEvento.tpEvento                     := teEPECNFe;
               InfEvento.nSeqEvento                   := 1;
               //InfEvento.versaoEvento               := '';
               //InfEvento.detEvento.versao           := '';
               InfEvento.detEvento.descEvento         := 'EPEC';
               InfEvento.detEvento.cOrgaoAutor        := NFe.Ide.cUF;
               InfEvento.detEvento.verAplic           := NFe.Ide.verProc;
               InfEvento.detEvento.dhEmi              := NFe.Ide.dEmi;
               InfEvento.detEvento.tpNF               := NFe.Ide.tpNF;
               InfEvento.detEvento.IE                 := NFe.Emit.IE;
               InfEvento.detEvento.dest.UF            := NFe.Dest.EnderDest.UF;
               InfEvento.detEvento.dest.CNPJCPF       := NFe.Dest.CNPJCPF;
               InfEvento.detEvento.dest.idEstrangeiro := NFe.Dest.idEstrangeiro;
               InfEvento.detEvento.dest.IE            := NFe.Dest.IE;
               InfEvento.detEvento.vNF                := NFe.Total.ICMSTot.vNF;
               InfEvento.detEvento.vICMS              := NFe.Total.ICMSTot.vICMS;
               InfEvento.detEvento.vST                := NFe.Total.ICMSTot.vST;
             end;
           end;
         end;
         ACBrNFe1.EventoNFe.GerarXML;
         ACBrNFe1.Configuracoes.WebServices.Visualizar:=false;

         ACBrNFe1.EnviarEvento(vidlote);
         with ACBrNFe1.WebServices do
         begin
           if EnvEvento.EventoRetorno.retEvento.Count > 0 then
           begin
             case EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat of
               485:
                 begin
                   ACBrNFe1.Consultar();
                   for I := 0 to ACBrNFe1.WebServices.Consulta.procEventoNFe.Count - 1 do
                     for J := 0 to ACBrNFe1.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Count - 1 do
                       if (ACBrNFe1.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe.retEvento.Items[J].RetInfEvento.tpEvento = teEPECNFe) then
                         CadNfeVenda.cadCCe.GravaRetornoEvento(
                           ACBrNFe1.WebServices.Consulta.procEventoNFe.Items[I].RetEventoNFe,
                           ACBrNFe1.NotasFiscais.Items[0], True);
                 end;
               else
                 CadNfeVenda.cadCCe.GravaRetornoEvento(EnvEvento.EventoRetorno, ACBrNFe1.NotasFiscais.Items[0], True);
             end;
           end;
         end;
       end;
     end
     else
     begin
        CadNfeVenda.pesquisaNF(strtoint(CadNfeVenda.cadCCe.vnumnf),CadNfeVenda.cadempresa.codempresa,CadNfeVenda.cadCCe.vserie);
        ACBrNFe1.EventoNFe.Evento.clear;
        ACBrNFe1.EventoNFe.idLote:=vidLote;
        with ACBrNFe1.EventoNFe.Evento.Add do
        begin
         infEvento.chNFe := CadNfeVenda.cadCCe.chavenfe;
         if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SCAN' then
           ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN
         else if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SVC' then
         begin
           if (CadNfeVenda.cadCCe.TipoEvento = 2) and (Now > (CadNfeVenda.dataSet.FieldByName('DATA_AUTORIZACAO').AsDateTime + 1)) then
           begin
             if Application.MessageBox('Cancelamento Extemporâneo?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
               ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal
             else
               ACBrNFe1.Configuracoes.Geral.FormaEmissao:=CadNfeVenda.cadempresa.TpEmisUFToStr(CadNfeVenda.cadempresa.vWEBSERV_UF);
           end
           else
             ACBrNFe1.Configuracoes.Geral.FormaEmissao:=CadNfeVenda.cadempresa.TpEmisUFToStr(CadNfeVenda.cadempresa.vWEBSERV_UF)
         end
         else
          ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
    //     if strtoint(CadNfeVenda.cadCCe.vserie) >= 900 then
    //       infEvento.cOrgao := 90
    //     else
    //      infEvento.cOrgao := CadNfeVenda.cadempresa.dataSet.FieldByName('IBGE_CODIGO_UF').asinteger;
    //     except
    //      infEvento.cOrgao := CadNfeVenda.cadempresa.dataSet.FieldByName('IBGE_CODIGO_UF').asinteger;
    //     end;
         infEvento.CNPJ   := trim(CadNfeVenda.cadempresa.dataset.FieldByName('CGC_EMP').AsString);
         infEvento.dhEvento := now;
         if CadNfeVenda.cadCCe.TipoEvento = 1 then
         begin
           // SVC nao aceita evento de CCe
           if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SVC' then
             ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
           infEvento.tpEvento :=tecce;
           infEvento.detEvento.descEvento := 'Carta de Correção';
         end;
         if CadNfeVenda.cadCCe.TipoEvento = 2 then
         begin
           infEvento.tpEvento :=teCancelamento;
           infEvento.detEvento.descEvento := 'Cancelamento';
           InfEvento.detEvento.nProt:=CadNfeVenda.cadCCe.vprotocolo;
           InfEvento.detEvento.xJust:=CadNfeVenda.cadCCe.dataSet.FieldByName('XCORRECAO').AsString;
         end;
         //110110;
         infEvento.nSeqEvento := CadNfeVenda.cadCCe.dataSet.FieldByName('NSEQEVENTO').AsInteger;
         infEvento.versaoEvento := '1.00';
         infEvento.detEvento.xCorrecao :=CadNfeVenda.cadCCe.dataSet.FieldByName('XCORRECAO').AsString;
         infEvento.detEvento.xCondUso := ''; //Texto fixo conforme NT 2011.003 -  http://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=tsiloeZ6vBw=
        end;
        vstvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
        ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
        vflagevento:=-1;
        // Consultar para ver se tem retorno 2.01 ou se a NFe existe na base da SEFAZ
        ExecutarDLL('Consulta',PWideChar(CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.XML'),PWideChar(''),vresposta,'1',
        'NF_VENDA',PWideChar(inttostr(CadNfeVenda.cadempresa.codempresa)),PWideChar(CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString),
        PWideChar(CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').AsString),'', PWideChar(CadNfeVenda.cadempresa.vWEBSERV_UF));
        if vresposta = 'OK' then
        begin
          if CadNfeVenda.cadCCe.TipoEvento = 1 then // Envio de Evento(CC-e) para a Sefaz de Origem quando for SCAN ou SVC
          begin
           if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SCAN' then
            ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal
           else if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SVC' then
            ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
          end;
          if ACBrNFe1.WebServices.Consulta.procEventoNFe.Count > 0 then
           for i:=0 to ACBrNFe1.WebServices.Consulta.procEventoNFe.Count-1 do
           begin
             if (ACBrNFe1.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.InfEvento.nSeqEvento = CadNfeVenda.cadCCe.vnseqevento)
             and (ACBrNFe1.WebServices.Consulta.procEventoNFe.Items[i].RetEventoNFe.InfEvento.tpEvento = ACBrNFe1.EventoNFe.Evento.Items[0].InfEvento.tpEvento) then
             begin
              vflagevento:=i;
              break;
             end;
           end;
           ACBrNFe1.Configuracoes.WebServices.Visualizar:=false;
           if vflagevento = -1 then
            ACBrNFe1.EnviarEvento(vidlote);
           if CadNfeVenda.cadCCe.GravaRetornoEvento(ACBrNFe1,vidlote,vflagevento) then
           begin
            if CadNfeVenda.cadCCe.TipoEvento = 2 then
              CadNfeVenda.CancelaNFEint(strtoint(CadNfeVenda.cadCCe.vnumnf),CadNfeVenda.cadCCe.dataSet.FieldByName('XCORRECAO').AsString);
           end
           else
           begin
            Application.MessageBox(PWideChar('Retorno do Evento: '+CadNfeVenda.cadCCe.dataset.FieldByName('CSTAT').AsString+
            ' '+CadNfeVenda.cadCCe.dataset.FieldByName('XMOTIVO').AsString),PWideChar('Advertência'), MB_OK);
            result:=false;
           end;
        end;
     end;
    ACBrNFe1.Configuracoes.WebServices.Visualizar:=vstvis;
   end;
 except
  on e: exception do
  begin
   if application.messagebox('Erro ao processar Evento. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
   result:=false;
  end;
 end;
end;

function TFrmAdmNfe.enviaEventoEmail(codigoEvento: string): boolean;
begin
//
 leconfigNFE(CadNfeVenda);
 CadNfeVenda.enviaEmail(ACBrNFe1,5,CadNfeVenda.cadCCe.dataSet.FieldByName('nseqevento').AsInteger,codigoEvento);
end;

function TFrmAdmNfe.enviaeventoNFeDestinadas(idlote: integer): boolean;
var
 vstvis,ok: boolean;
 voriginal: TpcnTipoEmissao;
begin
 result:=false;
 try
   leconfigNFE(CadNfeVenda);
   ACBrNFe1.EventoNFe.Evento.clear;
   ACBrNFe1.EventoNFe.idLote:=idlote;
    with ACBrNFe1.EventoNFe.Evento.Add do
    begin
     infEvento.chNFe := CadNfeVenda.datasetnfdest.FieldByName('CHAVE_NFE').AsString;
     infEvento.CNPJ   := CadNfeVenda.cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
     infEvento.dhEvento := now;
     infEvento.tpEvento :=CadNfeVenda.sitconftotpevento(CadNfeVenda.datasetnfdest.FieldByName('CSITCONFPEDIDO').AsInteger);
     InfEvento.cOrgao:=91;
     if infEvento.tpEvento = TpcnTpEvento.teManifDestOperNaoRealizada then
       InfEvento.detEvento.xJust := CadNfeVenda.datasetnfdest.FieldByName('XJUST').AsString;
    end;
    voriginal:=ACBrNFe1.Configuracoes.Geral.FormaEmissao;
    if ACBrNFe1.Configuracoes.Geral.FormaEmissao <> teNormal then
      ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;

    vstvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
    ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
    ACBrNFe1.EnviarEvento(idlote);
    if not CadNfeVenda.GravarRetornoEnvioEvento(ACBrNFe1, idlote) then
    begin
     Application.MessageBox(PWideChar('Retorno do Evento: '+CadNfeVenda.cadCCe.dataset.FieldByName('CSTAT').AsString+
     ' '+CadNfeVenda.cadCCe.dataset.FieldByName('XMOTIVO').AsString),PWideChar('Advertência'), MB_OK);
     result:=false;
    end;
    ACBrNFe1.Configuracoes.WebServices.Visualizar:=vstvis;
    ACBrNFe1.Configuracoes.Geral.FormaEmissao:=voriginal;
 except
  on e: exception do
  begin
   if application.messagebox('Erro ao processar retorno de Evento . Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
   result:=false;
  end;
 end;
end;

function TFrmAdmNfe.enviaNFe: boolean;
var qtdeNF: Integer;
   resultado: string;
   vresstatus: string;
   vresult: WideString;
   vflag: integer;
   ix,iy: integer;
begin
   if not CadNfeVenda.verificanfepend then
   begin
     if not CadNfeVenda.PesqPros(true,'NFE001','') then
     begin
      Result:=false;
      exit;
     end;
   end;
   if not CadNfeVenda.validarEnvioComandoFechado then
   begin
     Result := False;
     Exit;
   end;
   Result:=true;
   vNLote:=CadNfeVenda.obtemlote;
   leconfigNFE(CadNfeVenda);
   qtdeNF := 1;
   if CadNfeVenda.dataSet.FieldByName('TIPO_NF').AsString = 'V' then
     CadNfeVenda.vtemveic:='S'
   else
     CadNfeVenda.vtemveic:='N';
//   vNLote:=10;
   vTipoOP := 'Enviar';
   SetLength(tIde, 22); //ide
   SetLength(tEmit, 21); //emit
   SetLength(tdest, 18); //dest
   SetLength(tProd, 1, 84); //Produto num. 4 são digitos
   SetLength(temveic, 1); //total
   SetLength(veiculo, 26); //total
   SetLength(tTotal, 23); //total
   SetLength(DDadosdup,1,3); //Dados Duplicata
   SetLength(DdadosCupom,1,3); //Dados Duplicata
   SetLength(DDadTransp, 16); //Dados Transportador
   SetLength(tretirada, 9); //Dados Local retirada
   SetLength(tentrega, 9); //Dados Local Entrega
   SetLength(tExporta, 2); //Dados Exportacao

   for  ix:=0 to 21 do
     tIde[ix]:='';
   for  ix:=0 to 20 do
     temit[ix]:='';
   for  ix:=0 to 17 do
     tdest[ix]:='';
   for  ix:=0 to 15 do
     DDadTransp[ix]:='';
   for  ix:=0 to 8 do
     tretirada[ix]:='';
   for  ix:=0 to 8 do
     tentrega[ix]:='';
   for  ix:=0 to 0 do
     for iy := 0 to 83 do
       tProd[ix,iy]:='';
   for  ix:=0 to 0 do
     for iy := 0 to 2 do
       DDadosdup[ix,iy]:='';
   for  ix:=0 to 0 do
    for iy := 0 to 2 do
     DdadosCupom[ix,iy]:='';
   for  ix:=0 to 1 do
     tExporta[ix]:='';

   temVeic[0]:='';
   for  ix:=0 to 25 do
     veiculo[ix]:='';
   for  ix:=0 to 22 do
     ttotal[ix]:='';
   if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SCAN' then
   begin
     ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN;
     vultstatus:='SCAN';
   end
   else if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SVC' then
   begin
     ACBrNFe1.Configuracoes.Geral.FormaEmissao:=CadNfeVenda.cadempresa.TpEmisUFToStr(CadNfeVenda.cadempresa.vWEBSERV_UF);
     vultstatus:='SVC';
   end
   else
    vresstatus:=verificarStatusWeb('N');
   if vresstatus = 'SCAN' then
   begin
       // Chamar uma função para colocar as notas em uma sequência de contingência.
       CadNfeVenda.First;
       while not CadNfeVenda.Eof do
       begin
        if (CadNfeVenda.dataSet.fieldbyname('SEL_NFE').value = 1)
        and (CadNfeVenda.dataSet.fieldbyname('SERIE').Value <> CadNfeVenda.cadempresa.vSERIE_SCAN) then
        begin
          if application.messagebox('SCAN ATIVADO. Envia NF''(s) para SCAN?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
          begin
           if not CadNfeVenda.mudarNFSCANouSVC('SCAN') then
              exit;
          end
          else
          begin
           CadNfeVenda.marcaSel;
           vresstatus:='NENHUM';
           Result:=false;
           TerminaNFE;
           Exit;
          end;
        end;
        CadNfeVenda.next;
       end;
       CadNfeVenda.First;
   end
   else if vresstatus = 'SVC' then
   begin
       // Chamar uma função para colocar as notas em uma sequência de contingência.
       CadNfeVenda.First;
       while not CadNfeVenda.Eof do
       begin
//        if (Trim(CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString) = 'NORMAL') then
//        begin
          if  (trim(CadNfeVenda.dataSet.FieldByName('NFE_DPEC_NREGDPEC').asstring) <> '') then// ser chegar neste ponto ja esta em DPEC e tentou enviar pelo modo normal, sendo assim nao pode mudar para SVC pois o numero da nota ja esta no DPEC
          begin
            if CadNfeVenda.dataSet.fieldbyname('SEL_NFE').value = 1 then
            begin
             Application.MessageBox(PWideChar('NFe já está em DPEC. Deve ser enviada para SEFAZ Origem'),PWideChar('Advertência'), MB_OK);
             Result:=false;
             TerminaNFE;
             Exit;
            end;
//          end;
//          if application.messagebox('SVC ATIVADO. Envia NF''(s) para SVC?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
//          begin
//           if not CadNfeVenda.mudarNFSCANouSVC('SVC') then
//              exit;
//          end
//          else
//          begin
//           CadNfeVenda.marcaSel;
//           vresstatus:='NENHUM';
//           Result:=false;
//           TerminaNFE;
//           Exit;
          end;
        //end;
        CadNfeVenda.next;
       end;
       CadNfeVenda.First;
   end
   else
   begin
    if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SCAN' then
      vresstatus:='SCAN'
    else if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'SVC' then
      vresstatus:='SVC'
    else if CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString = 'NORMAL' then
      vresstatus:='NORMAL';
    CadNfeVenda.First;
    if (vresstatus <> 'NORMAL') and (vresstatus <> 'SCAN') and (vresstatus <> 'SVC') and (vresstatus <> 'DPEC') then
    begin
     Result:=false;
     TerminaNFE;
     Exit;
    end;
    if (vresstatus = 'DPEC') then
    begin
       CadNfeVenda.first;
       while not CadNfeVenda.Eof do
       begin
         if  (trim(CadNfeVenda.dataSet.FieldByName('NFE_DPEC_NREGDPEC').asstring) <> '') then
         begin
          if CadNfeVenda.dataSet.fieldbyname('SEL_NFE').value = 1 then
          begin
           Application.MessageBox(PWideChar('NFe já está em DPEC'),PWideChar('Advertência'), MB_OK);
           Result:=false;
           TerminaNFE;
           Exit;
          end;
         end;
         CadNfeVenda.next;
       end;
    end;
   end;
//    if CadNfeVenda.dataSet.Eof then
//    begin
//     Result:=false;
//     TerminaNFE;
//     Exit;
//    end;

    //gravando data e hora da contingencia para nao dar erro futuro de digest nao confere
    if vresstatus = 'SVC' then
    begin
      CadNfeVenda.dataSet.first;
      while not CadNfeVenda.dataSet.Eof do
      begin
        if CadNfeVenda.dataSet.fieldbyname('SEL_NFE').value = 1 then
        begin
          if (Trim(CadNfeVenda.dataSet.FieldByName('NFE_DHCONT').AsString) = '') and
            (Trim(CadNfeVenda.dataSet.FieldByName('NFE_XJUST').AsString) = '') then
          begin
            CadNfeVenda.dataSet.Edit;
            CadNfeVenda.dataSet.FieldByName('NFE_DHCONT').AsDateTime := StrToDateTime(CadNfeVenda.cadempresa.vdhCont);
            CadNfeVenda.dataSet.FieldByName('NFE_XJUST').AsString := CadNfeVenda.cadempresa.vxJust;
            CadNfeVenda.dataSet.Post;
            CadNfeVenda.Apply;
            CadNfeVenda.CommitaTransacao;
          end;
        end;
        CadNfeVenda.dataSet.Next;
      end;
    end;
    CadNfeVenda.vTIPONFE:=vresstatus;
//   if pos(':',vresstatus) > 0 then
//    CadNfeVenda.vTEMPORESPOSTA:=strtoint(trim(copy(string(vresstatus),14,2)));
   vflag:=0;
   i:=0;
   CadNfeVenda.first;
   while not CadNfeVenda.Eof do
//   for I := 0 to (qtdeNF - 1) do
   begin
    if CadNfeVenda.dataSet.fieldbyname('SEL_NFE').value = 1 then
    begin
      // para cada NF zera os dados das duplicatas...
      SetLength(DDadosdup,1,3); //Dados Duplicata
      for  ix:=0 to 0 do
       for iy := 0 to 2 do
        DDadosdup[ix,iy]:='';
      x:=0;
      if CadNfeVenda.dataSet.FieldByName('TIPO_NF').AsString = 'V' then
       CadNfeVenda.vtemveic:='S'
      else
       CadNfeVenda.vtemveic:='N';
      CadNfeVenda.obtemdadostotaisnf;
      tide[0] := copy(CadNfeVenda.vDescNatop,1,60);//<natOp>
      tide[1] := CadNfeVenda.VCNFE;
//      '33'; //<codigo>
      tide[2] :=CadNfeVenda.VNUMNOTA;
//      '33'; //<numero>
      tide[3] := '55'; //<numero>

      if vresstatus = 'SCAN' then
      begin
       tide[4] :=IntToStr(CadNfeVenda.cadempresa.vSERIE_SCAN); //<serie>
       tIde[13] := '3'; //<Tipo de Emissão>;
       tide[16] :=CadNfeVenda.cadempresa.vxJust;
       tide[17] :=CadNfeVenda.cadempresa.vdhCont;
      end
      else if vresstatus = 'SVC' then
      begin
       tide[4] :=CadNfeVenda.cadempresa.VSUB_SERIE;
       tIde[13] := TpEmisToStr(CadNfeVenda.cadempresa.TpEmisUFToStr(CadNfeVenda.cadempresa.vWEBSERV_UF)); //<Tipo de Emissão>;
       if Trim(CadNfeVenda.dataSet.FieldByName('NFE_XJUST').AsString) <> '' then
         tide[16] := Trim(CadNfeVenda.dataSet.FieldByName('NFE_XJUST').AsString)
       else
         tide[16] :=CadNfeVenda.cadempresa.vxJust;
       if Trim(CadNfeVenda.dataSet.FieldByName('NFE_DHCONT').AsString) <> '' then
         tide[17] := CadNfeVenda.dataSet.FieldByName('NFE_DHCONT').AsString
       else
         tide[17] :=CadNfeVenda.cadempresa.vdhCont;
      end;
      if vresstatus = 'NORMAL' then
      begin
       tide[4] :=CadNfeVenda.cadempresa.VSUB_SERIE;
//       '001'; //<serie>
       tIde[13] := '1'; //<Tipo de Emissão>;
      end;
      //if vresstatus = 'DPEC' then
      if Trim(CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString) = 'DPEC' then
      begin
       tide[4] :=CadNfeVenda.dataSet.FieldByName('SERIE').AsString;
//       '001'; //<serie>
       tIde[13] := '4'; //<Tipo de Emissão>;
       if Trim(CadNfeVenda.dataSet.FieldByName('NFE_XJUST').AsString) <> '' then
         tide[16] := Trim(CadNfeVenda.dataSet.FieldByName('NFE_XJUST').AsString)
       else
         tide[16] :=CadNfeVenda.cadempresa.vxJust;
       if Trim(CadNfeVenda.dataSet.FieldByName('NFE_DHCONT').AsString) <> '' then
         tide[17] := Trim(CadNfeVenda.dataSet.FieldByName('NFE_DHCONT').AsString)
       else
         tide[17] :=CadNfeVenda.cadempresa.vdhCont;
      end;
      if vresstatus = 'CONTINGENCIA' then
      begin
       tide[4] := '001'; //<serie>
       tIde[13] := '2'; //<Tipo de Emissão>;
       tide[16] :=CadNfeVenda.cadempresa.vxJust;
       tide[17] :=CadNfeVenda.cadempresa.vdhCont;
//     Pedir aqui o número do formulário de segurança...
      end;

      tide[5] :=CadNfeVenda.vdatemiss; //<dataemissao>  // versao 3.1 data e hora
      tide[6] :=CadNfeVenda.vdataensaid; //<datasaida>  // versao 3.1 data e hora
      tide[7] := CadNfeVenda.cadempresa.vWEBSERV_AMBIENTE;
//      'Homologação'; //<Produção, Homologação>
      tide[8] := CadNfeVenda.vnatNF;
//      'Saida'; //<Entrad,Saida>
      if pos('VISTA',CadNfeVenda.vCondicaoPAG) > 0 then
        tide[9] := 'AVista' //<AVista,APrazo,Outros>
      else if pos('PRAZO',CadNfeVenda.vCondicaoPAG) > 0 then
        tide[9] := 'APrazo' //<AVista,APrazo,Outros>
      else
        tide[9] := 'Outros'; //<AVista,APrazo,Outros>
      tide[10] := TClassNfVenda(CadNfeVenda).GetVersaoProc; //<verProc>
      tIde[11] :=CadNfeVenda.cadempresa.dataSet.FieldByName('IBGE_CODIGO_UF').AsString;
      //'31'; //<codigo Estado>
      tIde[12] :=inttostr(CadNfeVenda.cadempresa.vIBGE_COD_CIDADE);//<Codigo Municipio>

      tIde[14] :=CadNfeVenda.vfinNFE;//<Finalidade da NF>
      tIde[15] := '';// versao 3.1 passei a enviar um parametro a mais CadNfeVenda.vrefNFE;//<nf referenciada>
//      tide[18] :=CadNfeVenda.dataSet.fieldbyname('HORA_ENT_SAIDA').asstring;  // versao 3.1 nao tem mais hora de saida, fica junto da data
      // versao 3.1
      tide[19] :=CadNfeVenda.vNFE_INDPRES;
      tide[20] :=CadNfeVenda.vNFE_IDDEST;
      tide[21] :=CadNfeVenda.vIndFinal;


      temit[0] := trim(CadNfeVenda.cadempresa.dataset.FieldByName('CGC_EMP').AsString);//<cnpj>
      temit[1] := trim(CadNfeVenda.cadempresa.dataSet.FieldByName('IE_EMP').AsString);//<ie>
      temit[2] := CadNfeVenda.cadempresa.dataSet.FieldByName('NOME_EMP').AsString; //<RazaoSocial>
      temit[3] := CadNfeVenda.cadempresa.dataSet.FieldByName('FANTASIA_EMP').AsString; //<fantasia>
      temit[4] := CadNfeVenda.cadempresa.dataSet.FieldByName('TELEFONE_EMP').AsString;//<fone>
      temit[5] := CadNfeVenda.cadempresa.dataSet.FieldByName('CEP_EMP').AsString;//<cep>
      temit[6] := CadNfeVenda.cadempresa.dataSet.FieldByName('ENDRECO_EMP').AsString;//<logradouro>
      temit[7] := CadNfeVenda.cadempresa.dataSet.FieldByName('NUMERO_END').AsString;//<numero>
      temit[8] := CadNfeVenda.cadempresa.dataSet.FieldByName('COMPLEMENTO_EMP').AsString;//<complementos>
      temit[9] := CadNfeVenda.cadempresa.dataSet.FieldByName('BAIRRO_EMP').AsString;//<Bairro>
      temit[10] :=CadNfeVenda.cadempresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsString;//<codigoCidade>
      temit[11] :=CadNfeVenda.cadempresa.dataSet.FieldByName('CIDADE_EMP').AsString;//<Cidade>
      temit[12] :=CadNfeVenda.cadempresa.dataSet.FieldByName('WEBSERV_UF').AsString;//<Estado>
      temit[13] := '1058'; //<Codigo Pais>
      temit[14] := 'BRASIL'; //<Pais>
      temit[15] :=CadNfeVenda.vinfadc;
      temit[16] :=CadNfeVenda.dataSet.FieldByName('CRT').AsString;
      temit[17] :=CadNfeVenda.dataSet.FieldByName('IM_EMP').AsString;
      temit[18] :=CadNfeVenda.dataSet.FieldByName('CNAE_FISCAL').AsString;
      temit[19] :=CadNfeVenda.dataSet.FieldByName('INSCRICAO_SUBSTITUTO').AsString;
      temit[20] :=CadNfeVenda.cadempresa.dataSet.FieldByName('NFE_AUTXML').AsString;

      if not CadNfeVenda.cadclfor.BuscaClifor(CadNfeVenda.VCODCLIFOR,CadNfeVenda.cadempresa.codempresa) then
      begin
        CadNfeVenda.marcaSel;
        CadNfeVenda.Apply;
        CadNfeVenda.CommitaTransacao;
        Result:=false;
        exit;
      end;
      CadNfeVenda.caditens.vSiglaUFCliente := CadNfeVenda.cadclfor.vSiglaEstado;
      tDest[0] := CadNfeVenda.cadclfor.vcnpj;//<cnpj>
      tDest[1] := CadNfeVenda.cadclfor.vcep; //<cep>
      tDest[2] := CadNfeVenda.cadclfor.vlogr; //<logradouro>
      tDest[3] := CadNfeVenda.cadclfor.vnumero; //<numero>
      tDest[4] := CadNfeVenda.cadclfor.vcompl;//<complemento>
      tDest[5] := CadNfeVenda.cadclfor.vbairro; //<Bairro>
      tDest[6] := CadNfeVenda.cadclfor.vcod_cidade; //<codigoCidade>
      tDest[7] := CadNfeVenda.cadclfor.vdesccidade; //<Cidade>
      tDest[8] := CadNfeVenda.cadclfor.vdescuf; //<UF>
      tDest[9] := CadNfeVenda.cadclfor.vfone;//<Fone>
      tDest[10] :=CadNfeVenda.cadclfor.vie;//<IE>
      tDest[11] :=CadNfeVenda.cadclfor.vrazao; //<NomeRazao>
      tDest[12] :=CadNfeVenda.cadclfor.vcodpais; //<Codigo Pais>
      tDest[13] :=CadNfeVenda.cadclfor.vdescpais; //<Pais>
      tDest[14] :=CadNfeVenda.GetListaEmails(CadNfeVenda.cadclfor.vemail)[0].Substring(0, 60);
      // versao 3.1
      if tide[20] = '3' then
        tDest[15] := '9'
      else if (CadNfeVenda.dataset.fieldbyname('NFE_INDIEDEST').AsInteger in [1,2,9]) then
        tdest[15] := IntToStr(CadNfeVenda.dataset.fieldbyname('NFE_INDIEDEST').AsInteger)
      else
        tDest[15] :=CadNfeVenda.cadclfor.vNFE_INDIEDEST;
      tDest[16] :=CadNfeVenda.cadclfor.vNFE_IDESTRANGEIRO;
      tDest[17] :=CadNfeVenda.cadclfor.vNFE_AUTXML;

      if CadNfeVenda.vtransRazao <> '' then
      begin
        DDadTransp[0]:=CadNfeVenda.vtransRazao;
        DDadTransp[1]:=CadNfeVenda.vtransantt;
        DDadTransp[2]:=CadNfeVenda.vtranscnpj;
        DDadTransp[3]:=CadNfeVenda.vtransendereco;
        DDadTransp[4]:=CadNfeVenda.vtransmunicipio;
        DDadTransp[5]:=CadNfeVenda.vtransuftrans;
        DDadTransp[6]:=CadNfeVenda.vtransIE;
        DDadTransp[7]:=CadNfeVenda.vtransPlacaVeic;
        DDadTransp[8]:=CadNfeVenda.vtransUF;
        DDadTransp[9]:=CadNfeVenda.vtransQvol;
        DDadTransp[10]:=CadNfeVenda.vtransEspecie;
        DDadTransp[11]:=CadNfeVenda.vtransMarca;
        DDadTransp[12]:=CadNfeVenda.vtransNVol;
        DDadTransp[13]:=CadNfeVenda.vtransPesoB;
        DDadTransp[14]:=CadNfeVenda.vtranspesoL;
      end;
      DDadTransp[15]:=CadNfeVenda.vtranspfrc;
      CadNfeVenda.verificabol;

      if CadNfeVenda.verlocalretent then
      begin
        if CadNfeVenda.buscas.FieldByName('NFE_XLGR_COL').AsString <> '' then
        begin
         tretirada[0]:=CadNfeVenda.buscas.FieldByName('CNPJ_COL').AsString;
         tretirada[1]:=CadNfeVenda.buscas.FieldByName('CPF_COL').AsString;
         tretirada[2]:=CadNfeVenda.buscas.FieldByName('NFE_XLGR_COL').AsString;
         tretirada[3]:=CadNfeVenda.buscas.FieldByName('NFE_NRO_COL').AsString;
         tretirada[4]:=CadNfeVenda.buscas.FieldByName('NFE_XCPL_COL').AsString;
         tretirada[5]:=CadNfeVenda.buscas.FieldByName('NFE_XBAIRRO_COL').AsString;
         tretirada[6]:=CadNfeVenda.buscas.FieldByName('COD_MUN_COL').AsString;
         tretirada[7]:=CadNfeVenda.buscas.FieldByName('NFE_XMUN_COL').AsString;
         tretirada[8]:=CadNfeVenda.buscas.FieldByName('UF_COL').AsString;
        end;
        if CadNfeVenda.buscas.FieldByName('NFE_XLGR_ENTG').AsString <> '' then
        begin
         tentrega[0]:=CadNfeVenda.buscas.FieldByName('CNPJ_ENTG').AsString;
         tentrega[1]:=CadNfeVenda.buscas.FieldByName('CPF_ENTG').AsString;
         tentrega[2]:=CadNfeVenda.buscas.FieldByName('NFE_XLGR_ENTG').AsString;
         tentrega[3]:=CadNfeVenda.buscas.FieldByName('NFE_NRO_ENTG').AsString;
         tentrega[4]:=CadNfeVenda.buscas.FieldByName('NFE_XCPL_ENTG').AsString;
         tentrega[5]:=CadNfeVenda.buscas.FieldByName('NFE_XBAIRRO_ENTG').AsString;
         tentrega[6]:=CadNfeVenda.buscas.FieldByName('COD_MUN_ENTG').AsString;
         tentrega[7]:=CadNfeVenda.buscas.FieldByName('NFE_XMUN_ENTG').AsString;
         tentrega[8]:=CadNfeVenda.buscas.FieldByName('UF_ENTG').AsString;
        end;
      end;
//      CadNfeVenda.verificabol()
//      (DDadosdup);
      for ix := 0 to Length(CadNfeVenda.vndoc)-1 do
      begin
        if CadNfeVenda.vndoc[ix] <> '' then
        begin
         DDadosdup[ix,0]:=CadNfeVenda.vndoc[ix];
         DDadosdup[ix,1]:=DateToStr(CadNfeVenda.vndtvenc[ix]);
         DDadosdup[ix,2]:=CadNfeVenda.vnval[ix];
         if (ix+1) <= (Length(CadNfeVenda.vndoc)-1) then
           SetLength(DDadosdup,ix+2,3); //Produto num. 4 são digitos
        end;
      end;
      // Dados de cupons fiscais referenciados
      CadNfeVenda.verificacuponsref;
      for ix := 0 to Length(CadNfeVenda.vnumecf)-1 do
      begin
        if CadNfeVenda.vmodecf[ix] <> '' then
        begin
         DdadosCupom[ix,0]:=CadNfeVenda.vmodecf[ix];
         DdadosCupom[ix,1]:=CadNfeVenda.vnumecf[ix];
         DdadosCupom[ix,2]:=CadNfeVenda.vcooecf[ix];
         if (ix+1) <= (Length(CadNfeVenda.vnumecf)-1) then
           SetLength(DdadosCupom,ix+2,3); //Produto num. 4 são digitos
        end;
      end;
      if not CadNfeVenda.ObterItens(strtoint(CadNfeVenda.VNUMNOTA),
      CadNfeVenda.dataSet.FieldByName('COD_EMPRESA').AsInteger,CadNfeVenda.dataSet.FieldByName('COD_NF').Asstring,CadNfeVenda.vtemveic) then
      begin
        vflag:=1;
        Result:=false;
        break;
      end;
      while not CadNfeVenda.caditens.Eof do
//      for x := 0 to (1 - 1) do
      begin
            //Dados do Produto
         tprod[x, 0] :=CadNfeVenda.caditens.vitem; //<item>
         tprod[x, 1] :=CadNfeVenda.caditens.vcfopit; //<cfop>
         tprod[x, 2] :=CadNfeVenda.caditens.vcodit;//<codigo>
         tprod[x, 3] :=CadNfeVenda.caditens.vdescprod; //<descricao>
         tprod[x, 4] :=CadNfeVenda.caditens.vqtde; //<quantidade>
         tprod[x, 5] :=CadNfeVenda.caditens.vunid; //<unidade>
         tprod[x, 6] :=CadNfeVenda.caditens.vvaltotit; //<valorTotal>
         tprod[x, 7] :=CadNfeVenda.caditens.vvaluntit; //<valorUnitario>
         tprod[x, 8] :=CadNfeVenda.caditens.vqtde;//<Qtde Tributável>
         tprod[x, 9] :=CadNfeVenda.caditens.vunidtrib; //<Unidade Tributável>
         tprod[x, 10] :=CadNfeVenda.caditens.vluntrib; //<valor unitario de tributação>
         tprod[x, 11] :=CadNfeVenda.caditens.vinfAdicionalit;//<Informação do Produto>
            //Imposto
         tprod[x, 12] :=CadNfeVenda.caditens.vcst; //<CST>
         tprod[x, 13] :=CadNfeVenda.caditens.vmoddet; //<//Modalidade de determinação da BC do ICMS>
                                   {  '0' = MargemValorAgregado;
                                      '1' = Pauta;
                                      '2' = PrecoTabelado;
                                      '3' = ValorOperacao; }
         tprod[x, 14] :=CadNfeVenda.caditens.valiqit; //<Aliq do Imposto>
         tprod[x, 15] :=CadNfeVenda.caditens.valicmsit; //<Valor do ICMS>
         tprod[x, 16] :=CadNfeVenda.caditens.valbaseicmsit; //<Valor da BC do ICMS>

         tprod[x, 17] :=CadNfeVenda.caditens.vcstipi;//<ipi cst>

         tprod[x, 18] :=CadNfeVenda.caditens.vPERC_RED_PROD;// Percentual da Redução de BC do ICMS
         tprod[x, 19] :=CadNfeVenda.caditens.vmodBCST;//CadNfeVenda.caditens.vmoddet; // Modalidade de determinação da BC do ICMS ST
         tprod[x, 20] :=CadNfeVenda.caditens.vPERC_SUBSTTR_IT; // Percentual da margem de valor Adicionado do ICMS ST
         tprod[x, 21] :=CadNfeVenda.caditens.vPERC_RED_PROD; // Percentual da Redução de BC do ICMS ST
         tprod[x, 22] := '0,00';
         if CadNfeVenda.caditens.vBICMSUB_VND <> '0,00' then
          tprod[x, 22] :=CadNfeVenda.caditens.vBICMSUB_VND // Valor da BC do ICMS ST
         else if CadNfeVenda.caditens.vBASEICMANT_SUB_IT <> '0,00' then
          tprod[x, 22] :=CadNfeVenda.caditens.vBASEICMANT_SUB_IT; // Valor da BC do ICMS ST
         tprod[x, 23] :=CadNfeVenda.caditens.vALIQ_ICMSUB; // Alíquota do imposto do ICMS ST
         tprod[x, 24] := '0,00';
         if CadNfeVenda.caditens.vICMSUB_VND <> '0,00' then
           tprod[x, 24] :=CadNfeVenda.caditens.vICMSUB_VND // Valor do ICMS ST
         else if CadNfeVenda.caditens.vBASEICMANT_SUB_IT <> '0,00' then
          tprod[x, 24] :=CadNfeVenda.caditens.vICMANT_SUB_IT; // Valor do ICMS ST

         if ((Copy(CadNfeVenda.caditens.vcst,2,2) = '90') and (temit[16] <> '1')) or
          ((CadNfeVenda.caditens.vCSOSN = '900') and (temit[16] = '1')) then
         begin
           if (CadNfeVenda.caditens.vICMSUB_VND = '0,00') and (CadNfeVenda.caditens.vICMANT_SUB_IT <> '0,00') then
           begin
             // No gerador de xml do ACBR nao vai regar na tag vBCSTRet quando o CST for 90 ou CSOSN 900
             // entao quando o valor do ST nao for preenchido a antecipacao nao deve ir, apenas no cst 60
             tprod[x, 19] := '';     // Modalidade de determinação da BC do ICMS ST
             tprod[x, 20] := '0,00'; // Percentual da margem de valor Adicionado do ICMS ST
             tprod[x, 21] := '0,00'; // Percentual da Redução de BC do ICMS ST
             tprod[x, 22] := '0,00'; // Valor da BC do ICMS ST
             tprod[x, 23] := '0,00'; // Alíquota do imposto do ICMS ST
             tprod[x, 24] := '0,00'; // Valor do ICMS ST
           end;
         end;
         tprod[x, 25] :=CadNfeVenda.caditens.vFRETE_IT; // I15 - Valor Total do Frete
         tprod[x, 26] :=CadNfeVenda.caditens.vSEGURO_IT; // I16 - Valor Total do Seguro
         tprod[x, 27] :=CadNfeVenda.caditens.vDESCONTO_PROD; // I17 - Valor do Desconto
         tprod[x, 28] :=CadNfeVenda.caditens.vNCM; // I17 - NCm
         // Novos campos para o supersimples...
         tprod[x, 29] :=CadNfeVenda.caditens.vpCredSN; // I17 - NCm
         tprod[x, 30] :=CadNfeVenda.caditens.vvCredICMSSN; // I17 - NCm
         tprod[x, 31] :=CadNfeVenda.caditens.vpRedBCST;
         tprod[x, 32] :=CadNfeVenda.caditens.vCSOSN;
         tprod[x, 33] :=CadNfeVenda.caditens.vO_DESP_IT;
         tprod[x, 34] :=CadNfeVenda.caditens.vindtot;
         tprod[x, 35] :=CadNfeVenda.caditens.vtipitem;
         tprod[x, 36] :=CadNfeVenda.caditens.vcodservlc116;
         tprod[x, 37] :=CadNfeVenda.caditens.vcodtrib;
         tprod[x, 38] :=CadNfeVenda.caditens.vbaseipi;
         tprod[x, 39] :=CadNfeVenda.caditens.valiqipi;
         tprod[x, 40] :=CadNfeVenda.caditens.valipiit;
         // Impostos Federais PIS/COFINS
         tprod[x,41]:=CadNfeVenda.caditens.vcstpis;
         tProd[x,42]:=CadNfeVenda.caditens.vbcpis;
         tProd[x,43]:=CadNfeVenda.caditens.vppis;
         tprod[x,44]:=CadNfeVenda.caditens.vpis;
         tProd[x,45]:=CadNfeVenda.caditens.vqbcprodpis;
         tProd[x,46]:=CadNfeVenda.caditens.vvaliqpropis;
         tProd[x,47]:=CadNfeVenda.caditens.vcstcofins;
         tProd[x,48]:=CadNfeVenda.caditens.vbccofins;
         tprod[x,49]:=CadNfeVenda.caditens.vpcofins;
         tProd[x,50]:=CadNfeVenda.caditens.vcofins;
         tprod[x,51]:=CadNfeVenda.caditens.vqbcprodcofins;
         tprod[x,52]:=CadNfeVenda.caditens.vvaliqcofins;

         tprod[x,53]:=CadNfeVenda.caditens.vBC_II;
         tprod[x,54]:=CadNfeVenda.caditens.vDespAdu_II;
         tprod[x,55]:=CadNfeVenda.caditens.vII_II;
         tprod[x,56]:=CadNfeVenda.caditens.vIOF_II;

         tprod[x,57]:=CadNfeVenda.caditens.vcProdANP;
         tprod[x,58]:=CadNfeVenda.caditens.vCODIF;
         tprod[x,59]:=CadNfeVenda.caditens.vqTemp;
         tprod[x,60]:=CadNfeVenda.caditens.vUFCons;
         tprod[x,61]:=CadNfeVenda.caditens.vCIDE_qBCProd;
         tprod[x,62]:=CadNfeVenda.caditens.vCIDE_vAliqProd;
         tprod[x,63]:=CadNfeVenda.caditens.vCIDE_vCIDE;
         tprod[x,64]:=CadNfeVenda.caditens.cEAN;
         tprod[x,65]:=CadNfeVenda.caditens.vTotTrib;
         tprod[x,66]:=CadNfeVenda.caditens.xped_compra;
         tprod[x,67]:=CadNfeVenda.caditens.nitemped_compra;
         tprod[x,68]:=CadNfeVenda.caditens.nfci;

         // versao 3.1
         tprod[x,69]:=CadNfeVenda.caditens.vNFE_PDEVOL;
         tprod[x,70]:=CadNfeVenda.caditens.vNFE_VIPIDEVOL;
         tprod[x,71]:=CadNfeVenda.caditens.vNFE_NRECOPI;
         tprod[x,72]:=CadNfeVenda.caditens.vCOMB_PMIXGN;
         tprod[x,73]:=CadNfeVenda.caditens.vNVE;

         tprod[x,74]:=CadNfeVenda.caditens.vCENQ;//era aqui
         tprod[x,75]:=CadNfeVenda.caditens.vCEST;
         tprod[x,76]:=CadNfeVenda.caditens.vVBCUFDEST;
         tprod[x,77]:=CadNfeVenda.caditens.vPFCPUFDEST;
         tprod[x,78]:=CadNfeVenda.caditens.vPICMSUFDEST;
         tprod[x,79]:=CadNfeVenda.caditens.vPICMSINTER;
         tprod[x,80]:=CadNfeVenda.caditens.vPICMSINTERPART;
         tprod[x,81]:=CadNfeVenda.caditens.vVFCPUFDEST;
         tprod[x,82]:=CadNfeVenda.caditens.vVICMSUFDEST;
         tprod[x,83]:=CadNfeVenda.caditens.vVICMSUFREMET;

         if CadNfeVenda.vtemveic = 'S' then
         begin
           temveic[0] := '1'; {< 0 - Não Possue veiculo

                            < 1   Possue veiculo > }
           veiculo[1]:=CadNfeVenda.caditens.vchassi;
           veiculo[2]:=CadNfeVenda.caditens.vccor;
           veiculo[3]:=CadNfeVenda.caditens.vxcor;
           veiculo[4]:=CadNfeVenda.caditens.vpot;
           veiculo[5]:=CadNfeVenda.caditens.vcm3;
           veiculo[6]:=CadNfeVenda.caditens.vpesol;
           veiculo[7]:=CadNfeVenda.caditens.vpesob;
           veiculo[8]:=CadNfeVenda.caditens.vnserie;
           veiculo[9]:=CadNfeVenda.caditens.vtpcomb;
           veiculo[10]:=CadNfeVenda.caditens.vnmotor;
           veiculo[11]:=CadNfeVenda.caditens.vcmkg;
           veiculo[12]:=CadNfeVenda.caditens.vdist;
           veiculo[13]:=CadNfeVenda.caditens.vcmod;
           veiculo[14]:=CadNfeVenda.caditens.vanomod;
           veiculo[15]:=CadNfeVenda.caditens.vanofab;
           veiculo[16]:=CadNfeVenda.caditens.vtppint;
           veiculo[17]:=CadNfeVenda.caditens.vtpveic;
           veiculo[18]:=CadNfeVenda.caditens.vespecie;
           veiculo[19]:=CadNfeVenda.caditens.vvin;
           veiculo[20]:=CadNfeVenda.caditens.vcondveic;
           veiculo[21]:=CadNfeVenda.caditens.vcmod;
           // 2.0
           veiculo[22]:=CadNfeVenda.caditens.vcodcordenatran;
           veiculo[23]:=CadNfeVenda.caditens.vLotacao;
           veiculo[24]:=CadNfeVenda.caditens.vtprest;

         end;

         //DI - Documento de Importacao

         SetLength(vItemDI, x+1);

         vItemDI[x] := CadNfeVenda.caditens.vDI_Item;

         CadNfeVenda.caditens.proximoitem(CadNfeVenda.vtemveic);
         if not CadNfeVenda.caditens.Eof then
         begin
           x:=x+1;
           SetLength(tProd, x+1, 84); //Produto num. 4 são digitos
         end;
      end;
      ttotal[00]:=CadNfeVenda.caditens.vitem;//<qtde de produto>
      ttotal[01]:=CadNfeVenda.vbasicm;//<totais baseicms>
      ttotal[02]:=CadNfeVenda.vvalicm;//<valor icms>
      ttotal[03]:=CadNfeVenda.vvalnota;//<valor nota>
      ttotal[04]:=CadNfeVenda.vvalprod;//<valor dos Produtos>
      ttotal[05]:=CadNfeVenda.vbcst;
      ttotal[06]:=CadNfeVenda.vST;
      ttotal[07]:=CadNfeVenda.vFrete;
      ttotal[08]:=CadNfeVenda.vSeg;
      ttotal[09]:=CadNfeVenda.vDesc;
      ttotal[10]:=CadNfeVenda.vIPI;
      ttotal[11]:=CadNfeVenda.vOutro;
      ttotal[12]:=CadNfeVenda.vIRRF_VND;
      ttotal[13]:=CadNfeVenda.vbcserv;
      ttotal[14]:=CadNfeVenda.valiqiss;
      ttotal[15]:=CadNfeVenda.vserv;
//
      ttotal[16]:=CadNfeVenda.vpis;
      ttotal[17]:=CadNfeVenda.vcofins;
      ttotal[18]:=CadNfeVenda.vII_II;
      ttotal[19]:=CadNfeVenda.vTotTrib;
      
      ttotal[20]:=CadNfeVenda.vFCPUFDest;
      ttotal[21]:=CadNfeVenda.vICMSUFDest;
      ttotal[22]:=CadNfeVenda.vICMSUFRemet;

      tExporta[0] := CadNfeVenda.vExporta_UFEmbarq;
      tExporta[1] := CadNfeVenda.vExporta_xLocEmbarq;

      vresult:=GeraNFe(tIde, tEmit, tdest, temVeic, veiculo, ttotal, tProd, PWideChar(vTipoOP), vNLote , 1,vresposta,'1','NOTAFISCAL',PWideChar(inttostr(CadNfeVenda.cadempresa.codempresa)),DDadosdup,DDadTransp,CadNfeVenda.vinfadc,tretirada,tentrega,DdadosCupom,vItemDI, tExporta, CadNfeVenda.vListRefNFe);
      if Pos('ERRO',string(vresult)) > 0 then
      begin
        vflag:=1;
        Result:=false;
        break;
      end;
    end;
    CadNfeVenda.Next;
    i:=i+1;
   end;
   if vflag = 0 then
   begin
    try
     resultado := GeraNFe(tIde, tEmit, tdest, temVeic, veiculo, ttotal, tProd, PWideChar(vTipoOP),vNlote, 2,vresposta,'1','NOTAFISCAL',PWideChar(inttostr(CadNfeVenda.cadempresa.codempresa)),DDadosdup,DDadTransp,CadNfeVenda.vinfadc,tretirada,tentrega,DdadosCupom,vItemDI, tExporta, CadNfeVenda.vListRefNFe);
    finally
     CadNfeVenda.GravaRetNFE(ACBrNFe1,1,vNLote);
     if vresposta = 'PROCESSADA' then
     begin
      result:=true;
      if CadNfeVenda.vxmsg <> '' then
       Application.MessageBox(PWideChar('Mensagem da SEFAZ Cod.: '+#13+CadNfeVenda.vcmsg+' Mensagem: '+CadNfeVenda.vxmsg),PWideChar('Advertência'), MB_OK);
     end
     else
     if vresposta = 'ERRO' then
      Result:=false;
    end;
   end;
   TerminaNFE;
   {
    Ide     = Identificação
    tEmit   = Emitente
    tdest   = Destinatario
    temVeic = Se na nota tem Veículo [1,2]
    veiculo = dados do Veículo
    ttotal  = Total da NF
    tProd   = Dados do Produto
    vTipoOP = [ Enviar ou Gerar ]
    1 ou 2  = 1 indica inicio do Lote e 2 Final do Lote
   }
end;

function TFrmAdmNfe.EnviarEmail_NFe: Boolean;
var
  varq,para: string;
  vusassl: boolean;
  Aanexos: TStrings;
  I: Integer;
begin
  leconfigNFE(CadNfeVenda);
  if CadNfeVenda.dataSet.FieldByName('situacao_nfe').AsString = 'Cancelada' then
  begin
    Application.MessageBox(PWideChar('NFe Cancelada, será enviado o arquivo de cancelamento para o cliente'),PWideChar('Aviso'), MB_OK);
    if CadNfeVenda.dataSet.FieldByName('DATA_LANC').AsDateTime >= strtodate('01/12/2012')  then
      CadNfeVenda.enviaEmail(ACBrNFe1,5,1,'110111')
    else
      CadNfeVenda.enviaEmail(ACBrNFe1,2,0,'0');
  end
  else
  begin
    Aanexos := CadNfeVenda.getArquivosBoletoParaAnexos;
    if CadNfeVenda.dataSet.FieldByName('NFE_DPEC_NREGDPEC').AsString <> '' then
      CadNfeVenda.enviaEmail(ACBrNFe1,3,0,CadNfeVenda.dataSet.FieldByName('NFE_DPEC_NREGDPEC').AsString, Aanexos)
    else
      CadNfeVenda.enviaEmail(ACBrNFe1,3,0,'0', Aanexos);
    if Assigned(Aanexos) then
      for I := 0 to Aanexos.Count - 1  do
        DeleteFile(PWideChar(Aanexos[I]));
  end;
end;

procedure TFrmAdmNfe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(CadNfeVenda) then
    FreeAndNil(CadNfeVenda);
  TerminaNFE;
end;

procedure TFrmAdmNfe.FormCreate(Sender: TObject);
begin
  CadNfeVenda := TClassNfVenda.create;
end;

procedure TFrmAdmNfe.FormShow(Sender: TObject);
begin
  try
    Self.Icon.Handle:= ExtractIcon(Handle, PWideChar(Application.ExeName),0);
  except
  end;
  ComboBox3.ItemIndex:=0;
  ComboBox3.setfocus;
  LbNomeEmpresa.Caption:=CadNfeVenda.cadempresa.dataSet.FieldByName('NOME_EMP').AsString;
  LbCNPJ_CPF.Caption:=CadNfeVenda.cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
  LbIE.Caption:=CadNfeVenda.cadempresa.dataSet.FieldByName('IE_EMP').AsString;
  lbforma.Caption:=CadNfeVenda.cadempresa.dataSet.FieldByName('NFE_DANFE_FOREMISS').AsString;
  if CadNfeVenda.cadempresa.codempresa = 0 then
    raise Exception.Create('Codigo da empresa não definido');
  PageControl1.ActivePage := TabSheet1;
end;

function TFrmAdmNfe.ImprimirNFe: boolean;
begin
 leconfigNFE(CadNfeVenda);
 ExecutarDLL('Imprimir',PWideChar(CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString+'-nfe.XML'),'',vresposta,'1',
 'NF_VENDA',PWideChar(inttostr(CadNfeVenda.cadempresa.codempresa)),PWideChar(CadNfeVenda.dataSet.FieldByName('TIPONFE').AsString),
 PWideChar(CadNfeVenda.dataSet.FieldByName('SITUACAO_NFE').AsString),PWideChar(CadNfeVenda.dataSet.FieldByName('NFE_DPEC_NREGDPEC').asstring), PWideChar(CadNfeVenda.cadempresa.vWEBSERV_UF));
end;

function TFrmAdmNfe.ImprimirEvento(codigoEvento: string): boolean;
begin
 leconfigNFE(CadNfeVenda);
 ExecutarDLL('ImprimirEvento',PWideChar(CadNfeVenda.dataSet.FieldByName('CHAVE_NFE').AsString),'',vresposta,'1',
 'NF_VENDA',PWideChar(codigoEvento{Código do evento aqui no lugar do codigo da empresa}),PWideChar(''),
 PWideChar(''),PWideChar(CadNfeVenda.cadCCe.dataSet.FieldByName('NSEQEVENTO').AsString), PWideChar(CadNfeVenda.cadempresa.vWEBSERV_UF));
end;


procedure TFrmAdmNfe.leconfigNFE(vClass: TClassNfe);
begin
//================ CONFIGURAÇÃO =============================
   SetLength(certif, 4); //certificacao
   SetLength(geral, 16); //geral
   SetLength(webservice, 7); //Webservice

   certif[0] := vClass.CadEmpresa.dataset.fieldbyname('NFE_CAMINHO_CERT').AsString; //<caminho>
   certif[1] := vClass.CadEmpresa.dataset.fieldbyname('NFE_SENHA__CERT').AsString;
   certif[2] := vClass.CadEmpresa.dataset.fieldbyname('NFE_NUMSERIE_CERT').AsString;//<num serial>
   if vClass.CadEmpresa.dataset.fieldbyname('DIAS_AVISO').asinteger <> 0 then
    certif[3] := vClass.CadEmpresa.dataset.fieldbyname('DIAS_AVISO').AsString//<dias de aviso do certificado>
   else
    certif[3] := '0';

   geral[0] := vClass.cadempresa.dataSet.FieldByName('NFE_DANFE_TIPO').AsString;//<danfe>
   geral[1] := vClass.cadempresa.dataSet.FieldByName('NFE_DANFE_FOREMISS').AsString;// cbFormaEmissao.Text; //<Forma emissao>
   geral[2] :=StringReplace(vClass.cadempresa.dataSet.FieldByName('NFE_LOGOMARCA').AsString,'.BMP','.JPG',[rfIgnoreCase,rfReplaceAll]);//<logo marca>
   geral[3] := '1'; //<Salvar Arquivos de Envio e Resposta>
   geral[4] := vClass.cadempresa.dataSet.FieldByName('NFE_LOGPATH').AsString; //<PathSalvar>
   geral[5] := vClass.cadempresa.dataSet.FieldByName('NFE_ENDRELRAVE').AsString; //Endereco do arquivo de relatorio Rave
   geral[6] := vClass.cadempresa.dataSet.FieldByName('NFE_ENDERECOPDF').AsString;// Endereço de geração do arquivo PDF
   geral[7] := vClass.vcaminhobanco;// Endereço do banco de dados.Caso for em branco o sistema não considerará
                                                          // Nosso banco de dados...
   geral[8] :=IntToStr(vClass.cadempresa.codempresa);// Código da empres
   geral[9] :='4.0'; // Código da empresa
   geral[10] :=vClass.cadempresa.dataSet.FieldByName('NFE_TMPRETORNOMIL').AsString; // sleep para retorno do webservice.
   geral[11] :=vClass.cadempresa.dataSet.FieldByName('NFE_GRAVALOG').AsString; // sleep para retorno do webservice.
   geral[12] :=vClass.cadempresa.vSISTEMA; // Dados do desenvolvedor
   geral[13] :=vClass.cadempresa.dataSet.FieldByName('MS_VAL_LIQ_NFE').AsString; // Mostrar valor líquido dos itens na NFe
   geral[14] :=vClass.cadempresa.dataSet.FieldByName('CASAS_DECIMAIS').AsString; // Mostrar valor líquido dos itens na NFe
   geral[15] :=vClass.cadempresa.SqlOpen('select VALUE1_F from CONFIG_SISTEMA' +
                              ' where CHAVE = ' + QuotedStr('nfe_cfg_ad_danfe_largura_codprod') +
                              ' and COD_EMPRESA = ' + IntToStr(vClass.cadempresa.codempresa)).FieldByName('VALUE1_F').AsString;

//   dataSet.FieldByName('NFE_GRAVALOG').AsString; // sleep para retorno do webservice.

//   geral[10] :=parei...
//   '4.0'; // Código da empresa
   webservice[0] := vClass.cadempresa.dataSet.FieldByName('WEBSERV_UF').AsString;//<uf>
   webservice[1] := vClass.cadempresa.dataSet.FieldByName('WEBSERV_AMBIENTE').AsString;//cbAmbiente.text; //<Selecione o Ambiente de Destino:>

   if vClass.cadempresa.dataSet.FieldByName('WEBSERV_VISUALIZAR').AsString = 'SIM' then
    webservice[2] :='True'
   else
    webservice[2] := 'False'; //<visualizar Mensagem>

   webservice[3] := ''; //<host>
   webservice[4] := ''; //<porta>
   webservice[5] := ''; //<user>
   webservice[6] := ''; //<pass>

   if  certif[2] = '' then
    certif[2]:=LerConfiguracao(certif, geral, webservice,'N')
   else
    LerConfiguracao(certif, geral, webservice,'N');
//==========================================================
   ACBrNFe1.NotasFiscais.Clear;
end;

function TFrmAdmNfe.LerSCAN: integer;
begin
 leconfigNFE(CadNfeVenda);
 result:=VerificarSCAN;
end;

function TFrmAdmNfe.Mconsultasefazor(vuf, vchave, vserie: string): boolean;
var
 vstatatual: Boolean;
 vufant: string;
begin
//
  leconfigNFE(CadNfeVenda);
  vstatatual:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
  ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
  vufant:=ACBrNFe1.Configuracoes.WebServices.UF;
  ACBrNFe1.Configuracoes.WebServices.UF:=vuf;
  try
   if strtoint(vserie) >= 900 then
      ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN
   else
    ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
    ACBrNFe1.WebServices.Consulta.NFeChave := vChave;
    ACBrNFe1.WebServices.Consulta.Executar;
    if CadNfeVenda.buscaNFDestinada(0,CadNfeVenda.cadempresa.codempresa,PWideChar(vchave)) then
    begin
      CadNfeVenda.GravarRetornoConsultaSEFAZ(ACBrNFe1);
      CadNfeVenda.datasetnfdest.close;
    end;

   finally
    ACBrNFe1.Configuracoes.WebServices.UF:=vufant;
    ACBrNFe1.Configuracoes.WebServices.Visualizar:=vstatatual;
    ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
   end;
end;

function TFrmAdmNfe.NFDownload(vchave: string): boolean;
var
 vstvis,ok: boolean;
 vdirpadrao: string;
 voriginal: TpcnTipoEmissao;
begin
 {
 result:=false;
 try
   if ( frmStatus = nil ) then
    frmStatus := TfrmStatus.Create(Application);
   frmStatus.lblStatus.Caption := 'Efetuando Download da NFe: '+copy(vchave,26,9);
   frmStatus.Show;
   frmStatus.BringToFront;
   leconfigNFE(CadNfeVenda);
   voriginal:=ACBrNFe1.Configuracoes.Geral.FormaEmissao;
   if ACBrNFe1.Configuracoes.Geral.FormaEmissao <> teNormal then
   begin
     ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
   end;
   with ACBrNFe1.DownloadNFe do
   begin
    ACBrNFe1.DownloadNFe.Download.Chaves.Clear;
    ACBrNFe1.DownloadNFe.Download.CNPJ := CadNfeVenda.cadempresa.dataSet.FieldByName('CGC_EMP').AsString;
    with Download.Chaves.Add do
    begin
     chNFe := vchave;
    end;
   end;
   vstvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
   if not DirectoryExists(ACBrNFe1.Configuracoes.Arquivos.PathSalvar+'NFepend') then
     CreateDir(ACBrNFe1.Configuracoes.Arquivos.PathSalvar+'NFepend');
   vdirpadrao:=ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
   ACBrNFe1.Configuracoes.Arquivos.PathSalvar:=ACBrNFe1.Configuracoes.Arquivos.PathSalvar+'NFepend';
   ACBrNFe1.Download;
   ACBrNFe1.Configuracoes.Arquivos.PathSalvar:=vdirpadrao;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=vstvis;
   if ACBrNFe1.WebServices.DownloadNFe.retDownloadNFe.cStat = 139 then
   begin
    if ACBrNFe1.WebServices.DownloadNFe.retDownloadNFe.retNFe.Items[0].cStat = 140 then
    begin
      Result:=true
    end
    else
    begin
      ShowMessage('Problema Download: '+inttostr(ACBrNFe1.WebServices.DownloadNFe.retDownloadNFe.retNFe.Items[0].cStat)+' '+
      ACBrNFe1.WebServices.DownloadNFe.retDownloadNFe.retNFe.Items[0].xMotivo);
      Result:=false;
    end;
   end
   else
   begin
    ShowMessage('Problema Download: '+inttostr(ACBrNFe1.WebServices.DownloadNFe.retDownloadNFe.cStat)+' '+
    ACBrNFe1.WebServices.DownloadNFe.retDownloadNFe.xMotivo);
    result:=false;
   end;
   ACBrNFe1.Configuracoes.Geral.FormaEmissao:=voriginal;
   frmStatus.Hide;
 except
  on e: exception do
  begin
   ACBrNFe1.Configuracoes.Arquivos.PathSalvar:=vdirpadrao;
   frmStatus.Hide;
   if application.messagebox('Erro ao Fazer Download da NFe . Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
   result:=false;
  end;
 end;
 }
end;

procedure TFrmAdmNfe.ShowStatusProcessamento(ATitulo, AMensagem: string);
begin
  if ( frmStatus = nil ) then
    frmStatus := TfrmStatus.Create(Application);
  if ATitulo <> '' then
    frmStatus.lbl1.Caption := ATitulo;
  frmStatus.lblStatus.Caption := AMensagem;
  frmStatus.Show;
  frmStatus.BringToFront;
  Application.ProcessMessages;
end;

function TFrmAdmNfe.verificaNFedestinadas(indnfe, indemi: string;vtpop: integer;{vtpcons: integer;}nsuespec: string): boolean;
var
 ultNSU: string;
 vncons,i: integer;
 ok: boolean;
 voriginal: TpcnTipoEmissao;
 vchavecopyo,vchavecopyd: string;
begin
 result:=false;
 try
   if ( frmStatus = nil ) then
    frmStatus := TfrmStatus.Create(Application);
   frmStatus.lblStatus.Caption := 'Verificando NF Destinadas a este Contribuinte...';
   frmStatus.Show;
   frmStatus.BringToFront;

   begin
     if vtpop = 1 then
     begin
      if CadNfeVenda.cadempresa.dataSet.FieldByName('ULTIMONSUNFDEST').AsString <> '' then
        ultNSU:=CadNfeVenda.cadempresa.dataSet.FieldByName('ULTIMONSUNFDEST').AsString
      else
        ultNSU:='0';
     end
     else
      ultNSU:='0';
     leconfigNFE(CadNfeVenda);
//     ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
     voriginal:=ACBrNFe1.Configuracoes.Geral.FormaEmissao;
     if ACBrNFe1.Configuracoes.Geral.FormaEmissao <> teNormal then
     begin
       ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
     end;

     if (nsuespec <> '0') then
      ultNSU:=''
     else
      nsuespec:='';

     if not DirectoryExists(ACBrNFe1.Configuracoes.Arquivos.PathSalvar+'NFepend') then
      CreateDir(ACBrNFe1.Configuracoes.Arquivos.PathSalvar+'NFepend');


     while True do
     begin
       Application.ProcessMessages;
       ACBrNFe1.DistribuicaoDFe(acbrnfe1.Configuracoes.WebServices.UFCodigo,
       CadNfeVenda.cadempresa.dataSet.FieldByName('CGC_EMP').AsString,
       ultNSU,nsuespec);


      for i := 0 to AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Count-1 do
      begin
        if Trim(AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resDFe.chDFe) <> '' then
        begin
          CadNfeVenda.GravarNFDestinadas(ACBrNFe1,i,CadNfeVenda.cadempresa.codempresa, trNFe);
          if FileExists(ACBrNFe1.Configuracoes.Arquivos.PathSalvar+Trim(AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.
          docZip.Items[i].resDFe.chDFe)+'-nfe.xml') then
          begin
             vchavecopyo:=ACBrNFe1.Configuracoes.Arquivos.PathSalvar+Trim(AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.
             docZip.Items[i].resDFe.chDFe)+'-nfe.xml';
             vchavecopyd:=ACBrNFe1.Configuracoes.Arquivos.PathSalvar+'NFepend\'+Trim(AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.
             docZip.Items[i].resDFe.chDFe)+'-nfe.xml';
             if copyfile(PWideChar(vchavecopyo),PWideChar(vchavecopyd),false) then
               DeleteFile(PWideChar(vchavecopyo));
          end;
        end
        else
         if Trim(ACBrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.docZip.Items[i].resEvento.chDFe) <> '' then
          CadNfeVenda.GravarNFDestinadas(ACBrNFe1, i, CadNfeVenda.cadempresa.codempresa, trEvento);
      end;

      vncons:=vncons+1;
      frmStatus.lblStatus.Caption := 'BUSCA N.: '+IntToStr(vncons)+' ultnsu: '+ultNSU+' Maxnsu: '+AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU;
      frmStatus.Show;
      frmStatus.BringToFront;
      if (strtoint(AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU) < strtoint(AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU))
      and (AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat = 138) then
      begin
       if nsuespec <> '' then
          break
       else
       begin
        ultNSU:=AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;
        CadNfeVenda.cadempresa.registraultimoNSU(ultNSU);
       end;
      end
      else
      begin
       ultNSU:=AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.ultNSU;
       break;
      end;
      Application.ProcessMessages;
      Sleep(30000);
     end;
   end;
   frmStatus.Hide;
   if nsuespec = '' then
    CadNfeVenda.cadempresa.registraultimoNSU(ultNSU);
   CadNfeVenda.datasetnfdest.Close;
   ACBrNFe1.Configuracoes.Geral.FormaEmissao:=voriginal;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=false;
   Result:=true;
 except
  on e: exception do
  begin
//    ACBrNFe1.Configuracoes.Geral.FormaEmissao:=voriginal;
   if application.messagebox('Erro ao processar NFDestinadas. Mostrar Erro?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
    Application.MessageBox(PWideChar(E.Message),PWideChar('Error'), MB_OK);
    frmStatus.Hide;
   if (AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat <> 137) and (AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.cStat <> 138) then
   begin
     Application.MessageBox(PWideChar(AcbrNFe1.WebServices.DistribuicaoDFe.retDistDFeInt.xMotivo),PWideChar('Error'), MB_OK);
   end;
   result:=false;
  // ACBrNFe1.Configuracoes.WebServices.Visualizar:=false;
  end;
 end;
end;

end.
