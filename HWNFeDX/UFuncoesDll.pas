unit UFuncoesDll;

interface
uses
  Vcl.Forms,
  Vcl.StdCtrls,
  SysUtils,
  Vcl.Controls,
  Vcl.Buttons,
  Classes,
  inifiles,
  Vcl.Dialogs,
  Messages,
  windows,
  Vcl.Graphics,
//  SHDocVw,
  ACBrNFe,
  pcnConversao,
//  ACBrNFeDANFEClass,
//  ACBrNFeDANFERave,
  ACBrNFeDANFeRLClass,
//  pcnNFeW,
//  pcnConsSitNFe,
  pcnAuxiliar,
  ACBrDFe.Conversao,
  UAdmNFe,
  UDtmHwNFE,
  UClasseNFe,
  ufrmStatus,
  uDataSet_OOP_DX;

type

//   ArrayBi = array of array of shortstring;
   TEvent = class
   public

      class procedure btExecutarClick(Sender: TObject); virtual;
      class procedure FrStatusShow(Sender: TObject); virtual;
//      class procedure GerarLog(const Mensagem: String);
      class procedure GerarLog(const Mensagem: String; var Tratado: Boolean);
      class procedure FrStatusShowMDFe(Sender: TObject); virtual;
   end;


 function getCampoPipe(plinha: string; pOrdem: integer; pDelimitador: string = '|'): string;
 function strIn(pSubString: string; const pArgs: array of string): Boolean;
 function LerConfiguracao(certif, geral, webservice: array of shortstring;vescolhacert: WideString): WideString; stdcall;
 function leCertificadoNFe: WideString; stdcall;
 function verificarStatusWeb(verresultado: WideString): WideString; stdcall;
 function GeraNFe(hide, hemit, hDest, temVeic, veiculo, htotal: array of shortstring; tProd: ArrayBi; tipoOP: WideString; vNLote: Integer; tipoI_F: Integer;var resposta: WideString;sisint: WideString;NFTP: WideString;codempresa: WideString;Ddup: ArrayBi;DTransp:array of shortstring;vinfadic: WideString;hretirada,hentrega: array of shortstring;DdadosCupom:ArrayBi; pItemDI: array of Record_Item_DI; hexporta: array of shortstring; hrefNFe: array of shortstring): WideString; stdcall;
 function TerminaNFE: LongBool;stdcall;
 function ExecutarDLL(ttipo: WideString; Aux: WideString; Just: WideString;var resposta:WideString;sisint: WideString;NFTP: WideString;codempresa: WideString;vtipocons: WideString;statusNFE: WideString;nregdpec: WideString; pUFWS: WideString): WideString; stdcall;export;
 function ConsultaCadastro(vuf,cnpjcpf,mostrarretorno: WideString): WideString;stdcall;export;
 function verificarRecibolote(vnumrecibo: WideString): WideString; stdcall;
 function GeraChaveNFe(codigo_uf: integer;cnf: integer;modelo: integer;
 serie: integer;nnf: integer;tpemi: integer;vdata: WideString;cnpj: WideString): WideString; stdcall;
 function VerificarSCAN: Integer;
 function VerificarSVC(pUF: string): Integer;
 function Cpf(Num: string): boolean;
 function cgc(Num: string): boolean;
 function Split(const Str: string; Delimiter: Char = '|'): TStringList;


 var
   ACBrNFe1: TACBrNFe;
   ACBrNFeDANFERave1: TACBrNFeDANFeRL;
   ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
   OpenDialog1: TOpenDialog;
   Form: TForm;
//   frstatus: TForm;
   Button1: TButton;
   Edit1: TEdit;
   Label1: TLabel;
   vTipoOP, vAux: shortstring;
   MemoResp: TMemo;
//   WBResposta: TWebBrowser;
   j: Integer;
   Resultado: WideString;
//   LocNFeW: TNFeW;
   vcaminho: string;
   vendbanco: string;
   vcodempresa: string;
   vultstatus: string;
implementation

uses ACBrNFeConfiguracoes, ACBrMDFe, pcnConversaoNFe,
  ACBrMDFe.Conversao, ACBrDFe, ACBrDFeSSL, {pcnEnvEventoNFe, }ACBrNFeNotasFiscais,
  Math, ACBrDFeUtil, ACBrDFeDANFeReport, hw_win_utils;

procedure closeallAuditoria ;stdcall; external 'auditoria.dll';

Class procedure Tevent.GerarLog(const Mensagem: String; var Tratado: Boolean);
var
  Arq: TextFile;
  NomeArq: string;
//  auxstr: string;
begin
  Nomearq := ExtractFilePath(Application.Exename) + 'NFe.log';
  AssignFile(Arq, NomeArq);
  if not FileExists(NomeArq) then
    Rewrite(arq)
  else
    append(arq);
  WriteLn(arq, Mensagem);
  closeFile(arq);
end;

class procedure TEvent.FrStatusShow(Sender: TObject);
var i: Integer;
begin

    case ACBrNFe1.Status of
    stIdle :
    begin
      if ( frmStatus <> nil ) then
        frmStatus.Hide;
    end;
    stNFeStatusServico :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeRetRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Recebendo dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeConsulta :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeCancelamento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeInutilizacao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando pedido de Inutilização...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecibo :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCadastro :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Cadastro...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
//    stNFeEnvDPEC :
//    begin
//      if ( frmStatus = nil ) then
//        frmStatus := TfrmStatus.Create(Application);
//      frmStatus.lblStatus.Caption := 'Enviando DPEC...';
//      frmStatus.Show;
//      frmStatus.BringToFront;
//    end;
//    stNFeConsultaDPEC :
//    begin
//      if ( frmStatus = nil ) then
//        frmStatus := TfrmStatus.Create(Application);
//      frmStatus.lblStatus.Caption := 'Consultando DPEC...';
//      frmStatus.Show;
//      frmStatus.BringToFront;
//    end;
    stNFeEmail :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Email...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEvento:
//    NFeCCe :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Evento para NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
  end;
  Application.ProcessMessages;
end;

class procedure TEvent.FrStatusShowMDFE(Sender: TObject);
var i: Integer;
begin
 case (Sender as TACBrMDFe).Status of
  stMDFeIdle : begin
               if ( frmStatus <> nil ) then frmStatus.Hide;
              end;
  stMDFeStatusServico : begin
                        if ( frmStatus = nil )
                         then frmStatus := TfrmStatus.Create(Application);
                        frmStatus.lblStatus.Caption := 'Verificando Status do servico MDFe...';
                        frmStatus.Show;
                        frmStatus.BringToFront;
                       end;
  stMDFeRecepcao : begin
                   if ( frmStatus = nil )
                    then frmStatus := TfrmStatus.Create(Application);
                   frmStatus.lblStatus.Caption := 'Enviando dados do MDFe...';
                   frmStatus.Show;
                   frmStatus.BringToFront;
                  end;
  stMDFeRetRecepcao : begin
                      if ( frmStatus = nil )
                       then frmStatus := TfrmStatus.Create(Application);
                      frmStatus.lblStatus.Caption := 'Recebendo dados do MDFe...';
                      frmStatus.Show;
                      frmStatus.BringToFront;
                     end;
  stMDFeConsulta : begin
                   if ( frmStatus = nil )
                    then frmStatus := TfrmStatus.Create(Application);
                   frmStatus.lblStatus.Caption := 'Consultando MDFe...';
                   frmStatus.Show;
                   frmStatus.BringToFront;
                  end;
  stMDFeEvento : begin
                  if ( frmStatus = nil )
                   then frmStatus := TfrmStatus.Create(Application);
                  frmStatus.lblStatus.Caption := 'Enviando Evento de MDFe...';
                  frmStatus.Show;
                  frmStatus.BringToFront;
                 end;
  stMDFeRecibo : begin
                 if ( frmStatus = nil )
                  then frmStatus := TfrmStatus.Create(Application);
                 frmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
                 frmStatus.Show;
                 frmStatus.BringToFront;
                end;
  stMDFeEmail   : begin
                 if ( frmStatus = nil )
                  then frmStatus := TfrmStatus.Create(Application);
                 frmStatus.lblStatus.Caption := 'Enviando Email de MDFe';
                 frmStatus.Show;
                 frmStatus.BringToFront;
                end;
 end;
 Application.ProcessMessages;
end;

function TpEmisUFToStr(pUF: string): TpcnTipoEmissao;
begin
  if pos('|' + puf + '|', '|AC|AL|AP|MG|PB|RJ|RS|RO|RR|SC|SE|SP|TO|DF|') > 0 then
    Result := teSVCAN
  else if pos('|' + puf + '|', '|AM|BA|CE|ES|GO|MA|MT|MS|PA|PE|PI|PR|RN|') > 0 then
    Result := teSVCRS;
end;

function  IniciaNFE(certif, geral, webservice: array of shortstring): LongBool;
var
  ATipo: string;
  ALargProd: Integer;
begin
  if Pos('rave', LowerCase(geral[0])) > 0 then
  begin
    if ACBrNFeDANFERave1 = nil then
      ACBrNFeDANFERave1:= TACBrNFeDANFeRL.create(nil);
//      ACBrNFeDANFERave1:= TACBrNFeDANFERaveCB.create(nil);
    ACBrNFeDANFERave1.ExibeInforAdicProduto := infSeparadamente;
    ALargProd := StrToIntDef(geral[15], 0);
    ALargProd := IfThen(ALargProd <= 0, TACBrNFeDANFeRL(ACBrNFeDANFERave1).LarguraCodProd, ALargProd);
    TACBrNFeDANFeRL(ACBrNFeDANFERave1).LarguraCodProd := ALargProd;
  end
  else
  begin
    if not Assigned(ACBrNFeDANFeRL1) then
      ACBrNFeDANFeRL1 := TACBrNFeDANFeRL.Create(Application);
    ACBrNFeDANFeRL1.ExibeInforAdicProduto := infNenhum;
    ALargProd := StrToIntDef(geral[15], 0);
    ALargProd := IfThen(ALargProd <= 0, TACBrNFeDANFeRL(ACBrNFeDANFeRL1).LarguraCodProd, ALargProd);
    TACBrNFeDANFeRL(ACBrNFeDANFeRL1).LarguraCodProd := ALargProd;
    TACBrNFeDANFeRL(ACBrNFeDANFeRL1).PosCanhoto := prCabecalho;
  end;
  if ACBrNFe1 = nil then
  begin
    ACBrNFe1 := TACBrNFe.Create(nil);
    if geral[11] = 'S' then
      ACBrNFe1.OnGerarLog:=TEvent.GerarLog;

    if Pos('rave', LowerCase(geral[0])) > 0 then
      ACBrNFe1.DANFE := ACBrNFeDANFERave1
    else
      ACBrNFe1.DANFE := ACBrNFeDANFeRL1;

    if geral[13] = 'S' then
      ACBrNFe1.DANFE.ExibeInforAdicProduto := infSeparadamente
    else
      ACBrNFe1.DANFE.ExibeInforAdicProduto := infNenhum;

    ACBrNFe1.Configuracoes.Geral.SSLLib := libCapicom;//DelphiSoap;
  end;
  if Pos('rave', LowerCase(geral[0])) > 0 then
    ACBrNFe1.DANFE := ACBrNFeDANFERave1
  else
    ACBrNFe1.DANFE := ACBrNFeDANFeRL1;

  // versao 3.1
  // para nf-e 3.1 funcionar apenas usar estas 2 linhas
  ACBrNFe1.Configuracoes.Geral.ModeloDF := moNFe;
  ACBrNFe1.Configuracoes.Geral.VersaoDF := ve310;
  // fim versao 3.1

//   if ACBrNFe1.DANFE <> nil then
//   begin
      if Pos('Retrato', geral[0]) > 0 then
       ACBrNFe1.DANFE.TipoDANFE := tiretrato
      else
       ACBrNFe1.DANFE.TipoDANFE := tipaisagem;
//      ACBrNFe1.DANFE.RavFile:=geral[5];
      ACBrNFe1.DANFE.PathPDF:=geral[6];
      ACBrNFe1.DANFE.Logo:= geral[2];
      ACBrNFe1.DANFE.Sistema:=geral[12];
      ACBrNFe1.DANFE.CasasDecimais.vUnCom:=strtoint(geral[14]);
      ACBrNFe1.DANFE.CasasDecimais.qCom:=strtoint(geral[14]);
      ACBrNFe1.DANFE.CasasDecimais.MaskqCom := '';
      ACBrNFe1.DANFE.CasasDecimais.MaskvUnCom := '';
//      ACBrNFe1.DANFE.rav
//      ACBrNFe1.DANFE.
//     ACBrNFe1.DANFE:=ACBrNFeDANFERave1;
//   end;

   if geral[1] = 'NORMAL' then
    ACBrNFe1.Configuracoes.Geral.FormaEmissao := tenormal
   else
    if geral[1] = 'SCAN' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSCAN
   else if geral[1] = 'SVC' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := TpEmisUFToStr(webservice[0])
   else
    if geral[1] = 'DPEC' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := teDPEC
   else
    if geral[1] = 'CONTINGENCIA' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := teContingencia
   else
    if geral[1] = 'FSDA' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := teFSDA;

   if geral[3] = '1' then ACBrNFe1.Configuracoes.Geral.Salvar := True;
   if geral[3] = '2' then ACBrNFe1.Configuracoes.Geral.Salvar := False;
   if geral[10] <> '' then
     ACBrNFe1.Configuracoes.WebServices.AguardarConsultaRet:=StrToInt(geral[10]);
   ACBrNFe1.Configuracoes.Arquivos.PathSalvar := geral[4];
   vcaminho := ACBrNFe1.Configuracoes.Arquivos.PathSalvar;
   ACBrNFe1.Configuracoes.WebServices.UF := webservice[0];

   if webservice[1] = 'Homologação' then ACBrNFe1.Configuracoes.WebServices.Ambiente := tahomologacao;
   if webservice[1] = 'Produção' then ACBrNFe1.Configuracoes.WebServices.Ambiente := taproducao;
   if UpperCase(webservice[2]) = 'TRUE' then ACBrNFe1.Configuracoes.WebServices.Visualizar := TRUE;
   if UpperCase(webservice[2]) = 'FALSE' then ACBrNFe1.Configuracoes.WebServices.Visualizar := FALSE;


//{$IFNDEF ACBrNFeCAPICOM}
//  ACBrNFe1.Configuracoes.WebServices.ProxyHost := webservice[3];
//  ACBrNFe1.Configuracoes.WebServices.ProxyPort := webservice[4];
//  ACBrNFe1.Configuracoes.WebServices.ProxyUser := webservice[5];
//  ACBrNFe1.Configuracoes.WebServices.ProxyPass := webservice[6];
   AcBrNFe1.OnStatusChange := TEvent.FrStatusShow;

end;


function LerConfiguracao(certif, geral, webservice: array of shortstring;vescolhacert: WideString): WideString; stdcall;
begin
 IniciaNFE(certif, geral, webservice);
 vendbanco:=geral[7];

 ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 0, Integer(libCapicom)) +
                                                 IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 1, Integer(libOpenSSL)) +
                                                 IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 2, Integer(libWinCrypt)));//libCapicom;// libCapicomDelphiSoap;

 ACBrNFe1.Configuracoes.Geral.Salvar := True;
 ACBrNFe1.Configuracoes.Geral.VersaoDF := ve400;
//{$IFNDEF ACBrNFeCAPICOM}
   ACBrNFe1.Configuracoes.Certificados.ArquivoPFX:= certif[0];
   ACBrNFe1.Configuracoes.Certificados.Senha := certif[1];

   if ACBrNFe1.Configuracoes.Geral.SSLLib <> libOpenSSL then
     ACBrNFe1.Configuracoes.Certificados.NumeroSerie:= certif[2];
//{$ELSE}
{
   if vescolhacert = 'S' then
   begin
    ACBrNFe1.Configuracoes.Certificados.NumeroSerie := ACBrNFe1.SSL.SelecionarCertificado;
    Result:=WideString(ACBrNFe1.Configuracoes.Certificados.NumeroSerie);
   end
   else
   begin
     if certif[2] = '' then
     begin
        Application.MessageBox('Informe o número de série do certificado', 'Atenção', MB_ICONWARNING + MB_OK);
        ACBrNFe1.Configuracoes.Certificados.NumeroSerie := ACBrNFe1.SSL.SelecionarCertificado;
        Result:=WideString(ACBrNFe1.Configuracoes.Certificados.NumeroSerie);
     end
     else
      ACBrNFe1.Configuracoes.Certificados.NumeroSerie := certif[2];
   end;
   if ACBrNFe1.Configuracoes.Certificados.NumeroSerie <> '' then
   //certif[2] = '' then
   begin
     if (ACBrNFe1.SSL.CertDataVenc-date) <= strtoint(certif[3]) then
      Application.MessageBox(WideString('Certificado selecionado vence em: '+
      datetostr(ACBrNFe1.SSL.CertDataVenc)), 'Atenção', MB_ICONWARNING + MB_OK);
   end;
   }
//{$ENDIF}
end;

procedure ShowfrStatus;
var lbl1, lblStatus: TLabel;
begin
   if frmStatus = nil then
   begin
      frmStatus :=TfrmStatus.Create(Application);
      frmStatus.BorderStyle := bsDialog;
      frmStatus.Caption := 'Status';
      frmStatus.Position := poScreenCenter;
      frmStatus.Width := 489;
      frmStatus.Height := 72;
      frmStatus.Name := 'frmStatus';
      lbl1 := Tlabel.Create(frmStatus);
      lblStatus := Tlabel.Create(frmStatus);
      with lbl1 do
      begin
         Left := 2;
         Name := 'lbl1';
         Top := 2;
         Width := 477;
         Height := 17;
         Align := alTop;
         AutoSize := False;
         Caption := 'Aguarde Processando...';
         Color := clSilver;
         Font.Charset := DEFAULT_CHARSET;
         Font.Color := clWhite;
         Font.Height := -13;
         Font.Name := 'Tahoma';
         Font.Style := [];
         ParentColor := False;
         ParentFont := False;
         Transparent := False;
         Layout := tlCenter;
         Left := 4;
         Top := -4;
         Parent := frmStatus;
      end;

      with lblStatus do
      begin
         Name := 'lblStatus';
         Left := 2;
         Top := 19;
         Width := 477;
         Height := 24;
         Align := alClient;
         Color := clGray;
         Font.Charset := DEFAULT_CHARSET;
         Font.Color := clWhite;
         Font.Height := -15;
         Font.Name := 'Tahoma';
         Font.Style := [];
         ParentColor := False;
         ParentFont := False;
         Layout := tlCenter;
         Width := 4;
         Height := 18;
         Parent := frmStatus;

      end;
      frmStatus.Show;
//      frmStatus.Free;
//      frmStatus:=nil;
   end;

end;


function leCertificadoNFe: WideString; stdcall;
begin
  result := WideString(ACBrNFe1.SSL.SelecionarCertificado);
end;

class procedure TEvent.btExecutarClick(Sender: TObject);
begin
{
   try
      OpenDialog1 := TOpenDialog.Create(Form);
      OpenDialog1.Title := 'Selecione a NFE';
      OpenDialog1.DefaultExt := '*-nfe.XML';
      OpenDialog1.Filter := 'Arquivos NFE (*-nfe.XML)|*-nfe.XML|Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';

      OpenDialog1.InitialDir := ACBrNFe1.Configuracoes.Geral.PathSalvar;

      begin
         if vtipoOP = 'Consulta' then
         begin
            ACBrNFe1.NotasFiscais.Clear;
            ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
            ACBrNFe1.Consultar;
//          MemoResp.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS);
            Resultado := UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS);
         end;

         if vtipoOP = 'Imprimir' then
         begin
            ACBrNFe1.NotasFiscais.Clear;
            ACBrNFe1.NotasFiscais.LoadFromFile(OpenDialog1.FileName);
            ACBrNFe1.NotasFiscais.Imprimir;
         end;
         if vtipoOP = 'Cancelar' then
         begin
            ACBrNFe1.Cancelamento(vAux);
            CopyFile(WideString(OpenDialog1.FileName), WideString('C:\BasesAuto\NFE\Cancelado\' + extractfilename(opendialog1.filename)), True);
         end;
      end;

      if vtipoOP = 'Validar' then
      begin
         ACBrNFe1.NotasFiscais.Clear;
         ACBrNFe1.NotasFiscais.LoadFromFile(vAux);
         ACBrNFe1.NotasFiscais.Valida;
         Application.MessageBox('Nota Fiscal Eletrônica Valida', 'Atenção', MB_ICONWARNING + MB_OK);
         CopyFile(WideString(OpenDialog1.FileName), WideString(ACBrNFe1.Configuracoes.Geral.PathSalvar + '\Validado\' + extractfilename(opendialog1.filename)), True);
      end;

   finally
      Form.Close;
   end;
  }
end;

function Status: WideString; stdcall;
begin
   ACBrNFe1.WebServices.StatusServico.Executar;
   Result := WideString(UTF8Encode(ACBrNFe1.WebServices.StatusServico.RetWS));
end;


function TerminaNFE: LongBool;stdcall;
begin
   Result:=true;
   if ACBrNFe1 <> nil then
   begin
//    ACBrNFe1.Configuracoes.Certificados.GetCertificado._Release;
   if ACBrNFeDANFERave1 <> nil then
   begin
    FreeAndNil(ACBrNFeDANFERave1);
    ACBrNFeDANFERave1:=nil;
   end;
   
   if ACBrNFeDANFeRL1 <> nil then
   begin
    FreeAndNil(ACBrNFeDANFeRL1);
    ACBrNFeDANFeRL1:=nil;
   end;

    ACBrNFe1.NotasFiscais.Clear;
//    ACBrNFe1.NotasFiscais.ACBrNFe.Destroy;
//    ACBrNFe1.NotasFiscais.Configuracoes.Destroy;
    ACBrNFe1.NotasFiscais.Destroy;
    ACBrNFe1.WebServices.Destroy;
//    parei...
//    ACBrNFe1.Configuracoes.Certificados.Destroy;
//    ACBrNFe1.Configuracoes.Destroy;

    Acbrnfe1:=nil;
    closeallAuditoria;
//    FreeOnRelease;
    try
     FreeAndNil(ACBrNFe1);
    finally

    end;
//    ACBrNFe1.DANFE.Free;
//    ACBrNFe1.Free;
//    ACBrNFe1:=nil;
   end;
end;

function verificarStatusWeb(verresultado: WideString): WideString; stdcall;
var
 vtp,vflg,vflg1: integer;
 //  vflg: 0: OK; 1: Erro na consulta de status
 //  vflg1: 0: OK; 1: Erro na consulta de status SCAN
 atvis: Boolean;
 voriginal: TpcnTipoEmissao;
begin
// Testar aqui o DPEC  mais a frente...
 vflg := 0;
 voriginal:=ACBrNFe1.Configuracoes.Geral.FormaEmissao;
 if voriginal = teDPEC then
 begin
   Application.MessageBox(WideString('Contingência DPEC ativada. Estas NFes serão enviadas '+
   'por DPEC, após regularização da situação você deverá enviá-las para o SEFAZ Origem'), 'Atenção', MB_ICONWARNING + MB_OK);
   Result:='DPEC';
   vultstatus:=result;
   exit;
 end;
 vtp:=1;

 if voriginal = teSCAN then
 begin
   Application.MessageBox(WideString('Contingência SCAN ativada.'), 'Atenção', MB_ICONWARNING + MB_OK);
  //if application.messagebox('SCAN ATIVADO. Tentar SCAN?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
//  begin
    try
     ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN;
     if verresultado = 'S' then
     begin
       atvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
       ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
     end;
     ACBrNFe1.WebServices.StatusServico.Executar;
     if verresultado = 'S' then
     begin
       ACBrNFe1.Configuracoes.WebServices.Visualizar:=atvis;
     end;
    except
     on e: exception do
     begin
//     ShowMessage('ok');
      Application.MessageBox(PWideChar('552 ' + E.Message),PWideChar('Error'), MB_OK);
      result:='CONTINGENCIA';
      vultstatus:=result;
      exit;
      vflg:=1;
     end;
    end;
  //end;
  if vflg <> 1 then
  begin
   if ACBrNFe1.WebServices.StatusServico.cStat = 107 then
   begin
     Result:='SCAN';
     vultstatus:=result;
     exit;
   end
   else
   begin
    Application.MessageBox(WideString('SCAN indisponível'), 'Atenção', MB_ICONWARNING + MB_OK);
    result:='CONTINGENCIA';
   end;
  end
  else
   result:='CONTINGENCIA';
  vultstatus:=result; 
 end
 else if (voriginal = teSVCAN) or (voriginal = teSVCRS) then
 begin
   Application.MessageBox(WideString('Contingência SVC ativada.'), 'Atenção', MB_ICONWARNING + MB_OK);
    try
     ACBrNFe1.Configuracoes.Geral.FormaEmissao:=voriginal;
     if verresultado = 'S' then
     begin
       atvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
       ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
     end;
     ACBrNFe1.WebServices.StatusServico.Executar;
     if verresultado = 'S' then
     begin
       ACBrNFe1.Configuracoes.WebServices.Visualizar:=atvis;
     end;
    except
     on e: exception do
     begin
//     ShowMessage('ok');
      Application.MessageBox(PWideChar('552 ' + E.Message),PWideChar('Error'), MB_OK);
      result:='CONTINGENCIA';
      vultstatus:=result;
      exit;
      vflg:=1;
     end;
    end;
  //end;
  if vflg <> 1 then
  begin
   if ACBrNFe1.WebServices.StatusServico.cStat = 107 then
   begin
     Result:='SVC';
     vultstatus:=result;
     exit;
   end
   else if ACBrNFe1.WebServices.StatusServico.cStat = 113 then
   begin
     Result:='SVC';
     vultstatus:=result;
     exit;
   end
   else
   begin
    Application.MessageBox(WideString('SVC indisponível'), 'Atenção', MB_ICONWARNING + MB_OK);
    result:='CONTINGENCIA';
   end;
  end
  else
   result:='CONTINGENCIA';
  vultstatus:=result; 
 end;

 while true do
 begin
   vflg:=0;
   try
     if vtp = 1 then
       ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal
     else
      ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN;
     if verresultado = 'S' then
     begin
       atvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
       ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
     end;
     ACBrNFe1.WebServices.StatusServico.Executar;
     if verresultado = 'S' then
     begin
       ACBrNFe1.Configuracoes.WebServices.Visualizar:=atvis;
     end;
   except
     on e: exception do
    begin
//     ShowMessage('ok');
     Application.MessageBox(PWideChar('571 ' + E.Message),PWideChar('Error'), MB_OK);
     vflg:=1;
    end;
   end;
   IF vflg = 1  then
   begin
     case ACBrNFe1.WebServices.Retorno.cStat of
       108:
       begin
          Application.MessageBox(PWideChar('Problema temporário com o Web Service da SEFAZ-'+
          ACBrNFe1.Configuracoes.WebServices.UF+' Aguarde e tente novamente'), 'Atenção', MB_ICONWARNING + MB_OK);
         result:='TEMPORARIO';
         vultstatus:=Result;
         break;
       end;
       109:
       begin
          {
          Application.MessageBox(PWideChar('Problemas com o Web Service da SEFAZ-'+
          ACBrNFe1.Configuracoes.WebServices.UF+' Aguarde Tentando SCAN'), 'Atenção', MB_ICONWARNING + MB_OK);
          ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN; // Tenho que ver se isso funciona mesmo para o scan
          vflg1:=0;
          try
           if verresultado = 'S' then
           begin
             atvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
             ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
           end;
           ACBrNFe1.WebServices.StatusServico.Executar;
           if verresultado = 'S' then
           begin
             ACBrNFe1.Configuracoes.WebServices.Visualizar:=atvis;
           end;
          except
            on e: exception do
            begin
             Application.MessageBox(PWideChar('606 ' + E.Message),PWideChar('Error'), MB_OK);
             vflg1:=1;
            end;
          end;

          if vflg1 = 1 then
          begin
            // poderia aqui entrar o DPEC
            Application.MessageBox(PWideChar('Problemas com o SCAN '+
            ACBrNFe1.Configuracoes.WebServices.UF+' O sistema fará Contingência'), 'Atenção', MB_ICONWARNING + MB_OK);
            ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teContingencia;
            Result:='CONTINGENCIA';
            vultstatus:=result;
            break;
          end
          else
          begin
           result:='SCAN';
           vultstatus:=Result;
          end;
          }
          Application.MessageBox(PWideChar('Serviço Paralisado sem Previsão para o Web Service da SEFAZ-'+
          ACBrNFe1.Configuracoes.WebServices.UF+', Verifique a contingência'), 'Atenção', MB_ICONWARNING + MB_OK);
          result:='TEMPORARIO';
          vultstatus:=Result;
          break;
       end
       else
       begin
         IF vtp = 2 then
         begin
          // poderia aqui entrar o DPEC
          if voriginal = teDPEC then
            result:='DPEC'
          else
          begin
           Application.MessageBox(PWideChar('Problemas com o WebService de Contingencia '+
           ACBrNFe1.Configuracoes.WebServices.UF+' O sistema fará Contingência'), 'Atenção', MB_ICONWARNING + MB_OK);
           ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teContingencia;
           Result:='CONTINGENCIA';
          end;
          vultstatus:=result;
          break;
         end
         else
          if voriginal = teSCAN then
          begin
           if application.messagebox('Erro no serviço de WebService. Tentar SCAN?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            vtp:=2;
          end
          else
          if (voriginal = teSVCAN) or (voriginal = teSVCRS) then
          begin
           if application.messagebox('Erro no serviço de WebService. Tentar SVC?', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
            vtp:=3;
          end
          else
          begin
           Result:='CONTINGENCIA';
           vultstatus:=result;
           Application.MessageBox(PWideChar('Problema temporário com o Web Service da SEFAZ-'+
           ACBrNFe1.Configuracoes.WebServices.UF+' Aguarde e tente novamente. SCAN Desativado'), 'Atenção', MB_ICONWARNING + MB_OK);
           break
          end;
       end;
     end;
   end
   else
   begin
    if vtp = 1 then
     Result:='NORMAL'
    else
    if vtp = 3 then
     Result:='SVC'
    else
     Result:='SCAN';
    vultstatus:=Result;
    break;
    //TEMPO:'+Pchar(inttostr(ACBrNFe1.WebServices.StatusServico.TMed));
   end;
 end;
end;



function verificarRecibolote(vnumrecibo: WideString): WideString; stdcall;
var
 atvis: Boolean;
 voriginal: TpcnTipoEmissao;
begin
// Testar aqui o DPEC  mais a frente...
 voriginal:=ACBrNFe1.Configuracoes.Geral.FormaEmissao;
 if voriginal = teSCAN then
 begin
  Application.MessageBox(PWideChar('Contingência SCAN ativada.'), 'Atenção', MB_ICONWARNING + MB_OK);
 end
 else
  if voriginal = teDPEC then
  begin
   Application.MessageBox(PWideChar('Contingência DPEC ativada. Não consulta Lote!'), 'Atenção', MB_ICONWARNING + MB_OK);
   result:='FALHOU DPEC';
  end;
  try
   atvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
   ACBrNFe1.WebServices.Recibo.Recibo:=vnumrecibo;
   ACBrNFe1.WebServices.Recibo.Executar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=atvis;
   result:='OK';
  except
   on e: exception do
   begin
    result:=PWideChar('FALHOU ERRO: '+e.Message);
   end;
  end;
end;


function GeraChaveNFe(codigo_uf: integer;cnf: integer;modelo: integer;
serie: integer;nnf: integer;tpemi: integer;vdata: WideString;cnpj: WideString): WideString; stdcall;
var
 vchave: AnsiString;
 function OnlyNumber(Atext: string): string;
  var
    I: Integer;
  begin
    Result := '';
    for I := 1 to (Length(Atext)) do
      if Pos(Atext[I], '0123456789') > 0 then
        Result := Result + Atext[I];
  end;


begin
 vchave := GerarChaveAcesso(codigo_uf,strtodatetime(vdata), cnpj,serie,nnf,tpemi,cnf,modelo);
 Result := OnlyNumber(vchave);
// end
// else
//  result:='FALHA';
end;

function GeraNFe(hide, hemit, hDest, temVeic, veiculo, htotal: array of shortstring; tProd: ArrayBi; tipoOP: WideString; vNLote: Integer; tipoI_F: Integer;var resposta: WideString;sisint: WideString;NFTP: WideString;codempresa: WideString;Ddup: ArrayBi;DTransp:array of shortstring;vinfadic: WideString;hretirada,hentrega: array of shortstring;DdadosCupom:ArrayBi; pItemDI: array of Record_Item_DI; hexporta: array of shortstring; hrefNFe: array of shortstring): WideString; stdcall;
var
   x: integer;
   i: integer;
   ok, vok2, vTagICMSUFDest : Boolean;
  vCountDI, vCountADI, vCountDetExp, vCountDetExpInd: Integer;
  vListaTmp: TStringList;
begin

  vTagICMSUFDest := False;

   if tipoI_F = 1 then //
   begin
//      if ACBrNFe1.NotasFiscais.Count = 0 then
//         ACBrNFe1.NotasFiscais.Clear;

      with ACBrNFe1.NotasFiscais.Add.NFe do
      begin
         infNFe.ID := hide[1];

        vListaTmp := TStringList.Create;
        if (Trim(hdest[17]) <> '') or (Trim(hemit[20]) <> '') then
        begin
          vListaTmp.Clear;
          vListaTmp := Split(Trim(hdest[17]) + '|' + hemit[20]);
          vListaTmp.Sort;
          for I := 0 to vListaTmp.Count - 1 do
            if Trim(vListaTmp[I]) <> '' then
            begin
              vok2 := False;
              if Length(Trim(vListaTmp[I])) = 11 then
                vok2 := Cpf(Trim(vListaTmp[I]))
              else if Length(Trim(vListaTmp[I])) = 14 then
                vok2 := cgc(Trim(vListaTmp[I]));
              if autXML.Count >= 10 then
                vok2 := False
              else if (hDest[12] = '1058') and (Trim(hDest[0]) = Trim(vListaTmp[I])) then  //cnpj ou cpf do destinatário ja esta autorizado, portanto nao deve ser adicionado aqui
                vok2 := False;

              if vok2 then
                with autXML.Add do
                  CNPJCPF := Trim(vListaTmp[I]);
            end;
        end;

         ide.NatOp := hide[0]; //<natOp>
         ide.cNF := StrToInt(hide[1]); //<codigo>
         ide.nNF := StrToInt(hide[2]); //<numero>
         ide.modelo := StrToInt(hide[3]); //<modelo>
         ide.serie := StrToInt(hide[4]); //<serie>
         ide.dEmi := StrToDateTime(hide[5]); //<dataemissao>
         Ide.finNFe := fnNormal;
         if hide[6] <> '' then
          ide.dSaiEnt := StrToDateTime(hide[6]); //<datasaida>
         if (trim(hide[14]) = '') then
           Ide.finNFe := fnNormal
         else
           Ide.finNFe := StrToFinNFe(ok, hide[14]);
//         if (trim(hide[14]) <> '') and(trim(hide[15]) <> '') then
//         begin
//          if hide[14] = '3' then
//             Ide.finNFe :=  fnAjuste
//          else if hide[14] = '2' then
//             Ide.finNFe :=  fnComplementar
//          else if hide[14] = '4' then
//             Ide.finNFe :=  fnDevolucao
//           ELSE
//             Ide.finNFe := fnNormal;
//           Ide.NFref.Add;
//           Ide.NFref[0].refNFe := hide[15];
//         end
//         else if hide[14] = '3' then
//           Ide.finNFe :=  fnAjuste;

         for x := 0 to Length(hrefNFe) - 1 do
           if Ide.NFref.Count < 500 then
             if pos('MOD01|', hrefNFe[x]) = 0 then
               with Ide.NFref.Add do
                 refNFe := hrefNFe[x];

         for x := 0 to Length(hrefNFe) - 1 do
           if Ide.NFref.Count < 500 then
             if pos('MOD01|', hrefNFe[x]) > 0 then
               with Ide.NFref.Add do
               begin
                 RefNF.cUF := StrToInt(getCampoPipe(hrefNFe[x], 2));
                 RefNF.AAMM := Trim(getCampoPipe(hrefNFe[x], 3));
                 RefNF.CNPJ := Trim(getCampoPipe(hrefNFe[x], 4));
                 RefNF.modelo := StrToIntDef(getCampoPipe(hrefNFe[x], 5), 1);
                 RefNF.serie := StrToIntDef(getCampoPipe(hrefNFe[x], 6), 0);
                 RefNF.nNF := StrToInt(getCampoPipe(hrefNFe[x], 7));
               end;

         if hide[16] <> '' then
         begin
           Ide.xJust:=hide[16];
           Ide.dhCont:=StrToDateTime(hide[17]);
         end;
         if pos('Homologação', hide[7]) > 0 then ide.tpAmb := taHomologacao;
         if pos('Produção', hide[7]) > 0 then ide.tpAmb := taProducao;
         if hide[8] = 'Saida' then ide.tpNF := tnSaida; //<Saida>
         if hide[8] = 'Entrada' then ide.tpNF := tnEntrada; //<Entrada>
         if hide[9] = 'AVista' then ide.indPag := TpcnIndicadorPagamento.ipVista; //<AVista>
         if hide[9] = 'APrazo' then ide.indPag := TpcnIndicadorPagamento.ipPrazo; //<Prazo>
         if hide[9] = 'Outros' then ide.indPag := TpcnIndicadorPagamento.ipOutras; //<Outras>
         ide.verProc := hide[10]; //<verProc>
         ide.cUF := StrToInt(hide[11]); //<codigo Estado>
         ide.cMunFG := strtoInt(hide[12]); //<Codigo Municipio>
         try
           strtoint(hide[13]);
         except
           Ide.tpEmis:=teNormal;
         end;
         case strtoint(hide[13]) of
           1:
             ide.tpEmis:=teNormal;
           2:
              ide.tpEmis:=teContingencia;
           3:
           begin
              ide.tpEmis:=teSCAN;
           end;
           4:
             ide.tpEmis:=teDPEC;
           6:
              ide.tpEmis:=teSVCAN;
           7:
              ide.tpEmis:=teSVCRS;
         end;
         if hide[18] <> '' then
           ide.hSaiEnt:=StrToTime(hide[18]);
         Ide.indPres := StrToPresencaComprador(ok, hide[19]);
         Ide.idDest := StrToDestinoOperacao(ok, hide[20]);
         Ide.indFinal := StrToConsumidorFinal(ok, hide[21]);
         // Cupons fiscais vinculados...
         for x:=0 to Length(DdadosCupom)-1 do
         begin
          IF DdadosCupom[x,0] <> '' then
          begin
           with Ide.NFref.Add do
           begin
           if DdadosCupom[x,0] = '2B' then
            RefECF.modelo:=ECFModRef2B
           else
            if DdadosCupom[x,0] = '2C' then
              RefECF.modelo:=ECFModRef2C
            else
             RefECF.modelo:=ECFModRef2D;
           RefECF.nECF:=DdadosCupom[x,1];
           RefECF.nCOO:=DdadosCupom[x,2];
           end;
          end;
         end;
         //
         emit.CNPJCPF := hemit[0]; //<CNPJ>
         emit.IE := hemit[1]; //<ie>

         if hemit[18] <> '' then
          Emit.CNAE:=hemit[18];
         if hemit[17] <> '' then
          Emit.IM:=hemit[17];
         if hemit[19] <> '' then
          Emit.IEST:=hemit[19];

         emit.xNome := hemit[2]; //<RazaoSocial>
         emit.xFant := hemit[3]; //<NomeFantasia>
         emit.EnderEmit.fone := hemit[4]; //<Fone>
         emit.EnderEmit.CEP := StrToInt(trim(hemit[5])); //<Cep>
         emit.EnderEmit.xLgr := hemit[6]; //<Endereço>
         emit.EnderEmit.nro := hemit[7]; //<Numero>
         emit.EnderEmit.xCpl := hemit[8]; //<Complemento>
         emit.EnderEmit.xBairro := hemit[9]; //<Bairro>
         emit.EnderEmit.cMun := StrToInt(trim(hemit[10])); //<CodigoMunicipio>
         emit.EnderEmit.xMun := hemit[11]; //<Municipio>
         emit.EnderEmit.UF := hemit[12]; //<Estado>
         emit.enderEmit.cPais := 1058; //<Codigo Pais>
         emit.enderEmit.xPais := 'BRASIL'; //<Pais>
         if hemit[16] = '1' then
           emit.CRT:=crtSimplesNacional
         else
          if hemit[16] = '2' then
           emit.CRT:=crtSimplesExcessoReceita
          else
           Emit.CRT:=crtRegimeNormal;
//       Dados adicionais
         InfAdic.infCpl:=vinfadic;
//         hemit[15];

         if hDest[12] = '1058' then
           Dest.CNPJCPF := hDest[0]; //<cnpj>
         Dest.EnderDest.CEP := strtoint(hDest[1]); //<cep>
         Dest.EnderDest.xLgr := hDest[2]; //<logradouro>
         Dest.EnderDest.nro := hDest[3]; //<numero>
         Dest.EnderDest.xCpl := hDest[4]; //<complemento>
         Dest.EnderDest.xBairro := hDest[5]; //<Bairro>
         Dest.EnderDest.cMun := strtoint(hDest[6]); //<codigoCidade>
         Dest.EnderDest.xMun := hDest[7]; //<Cidade>
         Dest.EnderDest.UF := hDest[8]; //<UF>
         Dest.EnderDest.Fone := hDest[9]; //<Fone>
         if hDest[12] = '1058' then
           Dest.IE := hDest[10]; //<IE>
         Dest.xNome := hDest[11]; //<NomeRazao>
         Dest.EnderDest.cPais := StrToInt(hDest[12]); //1058; //<Codigo Pais>
         Dest.EnderDest.xPais := hDest[13];//'BRASIL'; //<Pais>
         Dest.Email:=string(hdest[14]).Substring(0, 60);
         Dest.indIEDest := StrToindIEDest(Trim(hdest[15]));
         Dest.idEstrangeiro := Trim(hdest[16]);

         for x:=0 to Length(DDadosdup)-1 do
         begin
          IF ddadosdup[x,0] <> '' then
          begin
           Cobr.Dup.Add;             // >>>   TAG de grupo da Duplicata - <dup> - Ocorrência 0-N
           Cobr.Dup[x].nDup :=ddadosdup[x,0];   // Y08 - Número da Duplicata
           Cobr.Dup[x].dVenc :=strtodate(ddadosdup[x,1]); // Y09 - Data de vencimento
           Cobr.Dup[x].vDup :=strtocurr(ddadosdup[x,2]);    // Y10 - Valor da duplicata
          end;
         end;


//         if DDadTransp[15] = '1' then
           if DDadTransp[15] = '0' then
             DDadTransp[15]:='2'
           else
            if DDadTransp[15] = '1' then
              DDadTransp[15]:='0'
            else
             if DDadTransp[15] = '2' then
              DDadTransp[15]:='1';
           transp.modFrete:=StrTomodFrete(ok,trim(DDadTransp[15]));
//           mfContaDestinatario
//         else
//          transp.modFrete := mfContaEmitente;       // X02 - Modalidade do frete
                                                //         (0)=mfContaEmitente     – por conta do emitente;
                                                //         (1)=mfContaDestinatario – por conta do destinatário)
          if DDadTransp[0] <> '' then
          begin                                    //       TAG de grupo Transportador - <transporta> - Ocorrência 0-
            Transp.Transporta.CNPJCPF := DDadTransp[2];          // X05 - Informar o CNPJ ou o CPF do Transportador, preenchendo os zeros não significativos.
            Transp.Transporta.xNome := DDadTransp[0];            // X06 - Razão Social ou nome
            Transp.Transporta.IE := DDadTransp[6];               // X07 - Inscrição Estadual
            Transp.Transporta.xEnder := DDadTransp[3];           // X08 - Endereço Completo
            Transp.Transporta.xMun := DDadTransp[4];             // X09 - Nome do município
            Transp.Transporta.UF := DDadTransp[5];               // X10 - Sigla da UF
                                                          //       TAG de grupo de Retenção do ICMS do transporte - <retTransp> - Ocorrência 0-1
            Transp.veicTransp.placa := DDadTransp[7];            // X19 - Placa do Veículo
            Transp.veicTransp.UF := DDadTransp[8];               // X20 - Sigla da UF
            Transp.veicTransp.RNTC :=DDadTransp[1];             // X21 - Registro Nacional de Transportador de Carga (ANTT)

            if DDadTransp[9] <> '' then
            begin
             Transp.Vol.add;                         //       TAG de grupo Volumes - <vol> - Ocorrência 0-N
             Transp.Vol[0].qVol :=strtoint(DDadTransp[9]);
                             // X27 - Quantidade de volumes transportados
             Transp.vol[0].esp :=DDadTransp[10];                // X28 - Espécie dos volumes transportados
             Transp.Vol[0].marca :=DDadTransp[11];              // X29 - Marca dos volumes transportados
             Transp.Vol[0].nVol :=DDadTransp[12];               // X30 - Numeração dos volumes transportados
             Transp.Vol[0].pesoL:=strtocurr(DDadTransp[14]);// X31 - Peso Líquido (em kg)
             Transp.Vol[0].pesoB :=strtocurr(DDadTransp[13]);// X32 - Peso Bruto (em kg)
            end;
          end;
          // pendente

          //Use os campos abaixo para informar o endereço de retirada quando for diferente do Remetente/Destinatário
          if hretirada[2] <> '' then
          begin
            if hretirada[0] <> '' then
             Retirada.CNPJCPF := hretirada[0]
            else
             Retirada.CNPJCPF := hretirada[1];
            Retirada.xLgr    :=hretirada[2];
            Retirada.nro     :=hretirada[3];
            Retirada.xCpl    :=hretirada[4];
            Retirada.xBairro :=hretirada[5];
            Retirada.cMun    :=strtoint(hretirada[6]);
            Retirada.xMun    :=hretirada[7];
            Retirada.UF      :=hretirada[8];
          end;
          if hentrega[2] <> '' then
          begin
            if hentrega[0] <> '' then
             Entrega.CNPJCPF := hentrega[0]
            else
             Entrega.CNPJCPF :=hentrega[1];
            Entrega.xLgr     :=hentrega[2];
            Entrega.nro      :=hentrega[3];
            Entrega.xCpl     :=hentrega[4];
            Entrega.xBairro  :=hentrega[5];
            Entrega.cMun     :=strtoint(hentrega[6]);
            Entrega.xMun     :=hentrega[7];
            Entrega.UF       :=hentrega[8];
          end;

         for x := 0 to (strtoint(htotal[0]) - 1) do
         begin
            with Det.Add do
            begin
               Prod.nItem := strtoint(tProd[x, 0]); //<numero Item>
               Prod.CFOP := tProd[x, 1]; //<CFOP>
               Prod.cProd := tProd[x, 2]; //<Código>
               Prod.xProd := tProd[x, 3]; //<Descricao>;
               Prod.qCom := strtocurr(tProd[x, 4]); //<Quantidade>
               Prod.uCom := tProd[x, 5]; //<Unidade>
               Prod.vProd := strtocurr(tProd[x, 6]); //<valor total bruto>
               Prod.vUnCom := strtocurr(tProd[x, 7]); //<valorUnitario>
               Prod.qTrib := strtocurr(tProd[x, 8]); //<Qtde Tributável>
               Prod.uTrib := tProd[x, 09]; //<Unidade Tributável>
               Prod.vUnTrib := strtocurr(tProd[x, 10]); //<Valor unitário Tributável>
               Prod.NCM := tProd[x, 28];
               Prod.vOutro:=strtocurr(tprod[x, 33]);
               prod.vFrete:=strtocurr(tprod[x, 25]);
               prod.vSeg:=strtocurr(tprod[x, 26]);
               prod.vDesc:=strtocurr(tprod[x, 27]);

               if tprod[x, 34] = '0' then
                 Prod.IndTot:=itNaoSomaTotalNFe
               else
                 Prod.IndTot:=itSomaTotalNFe;


               infAdProd := tProd[x, 11]; //'Informacao adicional';

               with imposto do
               begin
                  if tprod[x,35] = 'S' then
                  begin
                   with ISSQN do
                   begin
                      vBC:=strtocurr(tprod[x, 16]);
                      vAliq:=strtocurr(tprod[x, 14]);
                      vISSQN:=strtocurr(tprod[x, 15]);
                      cMunFG:=Ide.cMunFG;
                      if tprod[x, 36] = '' then
                      begin
                       Application.MessageBox(PWideChar('Código Serviço conforme LC 116/03 não informada '+tprod[x,2]), 'Atenção', MB_ICONWARNING + MB_OK);
                       Result:=PWideChar('ERRO LC 116/03 Faltando Serv: '+tProd[x, 2]);
                       ACBrNFe1.NotasFiscais.Clear;
                       exit;
                      end
                      else
                       cListServ:=tprod[x, 36];
                      if tprod[x, 37] = '' then
                      begin
                       Application.MessageBox(PWideChar('Código Tributação do Serviço não informado. Verifique o serviço '+tprod[x,2]), 'Atenção', MB_ICONWARNING + MB_OK);
                       Result:=PWideChar('ERRO CÓDIGO TRIBUTAÇÃO FALTANDO Serv: '+tProd[x, 2]);
                       ACBrNFe1.NotasFiscais.Clear;
                       exit;
                      end
                      else
                       cSitTrib:=StrToISSQNcSitTrib(ok,Trim(tprod[x, 37]));
                   end;
                  end
                  else
                  begin
                    with ICMS do
                    begin
//                       if copy(tProd[x, 12],1,1) = '0'  then
//                         orig:=oeNacional
//                       else
//                        if copy(tProd[x, 12],1,1) = '1'  then
//                          orig:=oeEstrangeiraImportacaoDireta
//                        else
//                         orig:=oeEstrangeiraAdquiridaBrasil;
                       orig:=StrToOrig(copy(tProd[x, 12],1,1));

                       //Modalidade de determinação da BC do ICMS
                       if pos('0', tProd[x, 13]) > 0 then ICMS.modBC := dbiMargemValorAgregado;
                       if pos('1', tProd[x, 13]) > 0 then ICMS.modBC := dbiPauta;
                       if pos('2', tProd[x, 13]) > 0 then ICMS.modBC := dbiPrecoTabelado;
                       if pos('3', tProd[x, 13]) > 0 then ICMS.modBC := dbiValorOperacao;
                                            //Modalidade de determinação da BC do ICMS
                       if pos('0', tProd[x, 19]) > 0 then ICMS.modBCST := dbisPrecoTabelado;
                       if pos('1', tProd[x, 19]) > 0 then ICMS.modBCST := dbisListaNegativa;
                       if pos('2', tProd[x, 19]) > 0 then ICMS.modBCST := dbisListaPositiva;
                       if pos('3', tProd[x, 19]) > 0 then ICMS.modBCST := dbisListaNeutra;
                       if pos('4', tProd[x, 19]) > 0 then ICMS.modBCST := dbisMargemValorAgregado;
                       if pos('5', tProd[x, 19]) > 0 then ICMS.modBCST := dbisPauta;


                       if Emit.CRT = crtSimplesNacional then
                       begin
                         // Usado quando é 101, 201
                         //tprod[x, 29] :=CadNfevenda.caditens.vpCredSN; // I17 - NCm
                         //tprod[x, 30] :=CadNfevenda.caditens.vvCredICMSSN; // I17 - NCm
                         //tprod[x, 31] :=CadNfevenda.caditens.vpRedBCST;
                         //tprod[x, 22] := VALOR BASE CALC ST
                         //tprod[x, 24] := VALOR ST
                         //tprod[x, 23] :=CadNfevenda.caditens.vALIQ_ICMSUB;


                         if pos('101', tProd[x, 32]) > 0 then
                         begin
                           CSOSN:=csosn101;
                           if tProd[x, 29] <> '' then
                            pCredSN := strtocurr(tProd[x, 29])//<Alíquota de Crédito Simples Nacional>
                           else
                           begin
                            Application.MessageBox('Aliquota de crédito Simples Nacional não informada', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=PWideChar('ERRO ALIQUOTA FALTANDO CSOSN101 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;

                           if tProd[x, 30] <> '' then
                             vCredICMSSN:=strtocurr(tProd[x, 30]) //<Valor do Crédito Simples Nacional>
                           else
                           begin
                            Application.MessageBox('Valor do crédito Simples Nacional não informado', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR CREDITO FALTANDO CSOSN101 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                         end;

                         if pos('102', tProd[x, 32]) > 0 then
                          CSOSN:=csosn102;
                         if pos('103', tProd[x, 32]) > 0 then
                          CSOSN:=csosn103;

                         if pos('201', tProd[x, 32]) > 0 then
                         begin
                           CSOSN:=csosn201;
                           if tProd[x, 20] <> '' then
                             ICMS.pMVAST:=strtocurr(tProd[x, 20])// N19 - Percentual da margem de valor Adicionado do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou MVA utilizado no cálculo', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO MVA ICMS ST FALTANDO CSOSN201 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 31] <> '' then
                             ICMS.pRedBCST := strtocurr(tProd[x, 31]);                       // N20 - Percentual da Redução de BC do ICMS ST
                           if tProd[x, 22] <> '' then
                             ICMS.vBCST := strtocurr(tProd[x, 22])                          // N21 - Valor da BC do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou BASE ICM ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO BASE ICM ST FALTANDO CSOSN201 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x,23] <> '' then
                            ICMS.pICMSST := strtocurr(tProd[x, 23])                        // N22 - Alíquota do imposto do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou ALIQ. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQ ICMS ST FALTANDO CSOSN201 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 24] <> '' then
                            ICMS.vICMSST := strtocurr(tProd[x, 24])                       // N23 - Valor do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou VL. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VL. ICMS ST FALTANDO CSOSN201 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;

                           if tProd[x, 29] <> '' then
                            pCredSN := strtocurr(tProd[x, 29])//<Alíquota de Crédito Simples Nacional>
                           else
                           begin
                            Application.MessageBox('Aliquota de crédito Simples Nacional não informada', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQUOTA FALTANDO CSOSN201 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;

                           if tProd[x, 30] <> '' then
                             vCredICMSSN:=strtocurr(tProd[x, 30]) //<Valor do Crédito Simples Nacional>
                           else
                           begin
                            Application.MessageBox('Valor do crédito Simples Nacional não informado', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR CREDITO FALTANDO CSOSN201 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                         end;


                         if pos('202', tProd[x, 32]) > 0 then
                         begin
                           CSOSN:=csosn202;
                           if tProd[x, 20] <> '' then
                             ICMS.pMVAST:=strtocurr(tProd[x, 20])// N19 - Percentual da margem de valor Adicionado do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou MVA utilizado no cálculo', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO MVA ICMS ST FALTANDO CSOSN202 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 31] <> '' then
                             ICMS.pRedBCST := strtocurr(tProd[x, 31]);                       // N20 - Percentual da Redução de BC do ICMS ST
                           if tProd[x, 22] <> '' then
                             ICMS.vBCST := strtocurr(tProd[x, 22])                          // N21 - Valor da BC do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou BASE ICM ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO BASE ICM ST FALTANDO CSOSN202 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x,23] <> '' then
                            ICMS.pICMSST := strtocurr(tProd[x, 23])                        // N22 - Alíquota do imposto do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou ALIQ. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQ ICMS ST FALTANDO CSOSN202 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 24] <> '' then
                            ICMS.vICMSST := strtocurr(tProd[x, 24])                       // N23 - Valor do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou VL. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VL. ICMS ST FALTANDO CSOSN202 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                         end;

                         if pos('203', tProd[x, 32]) > 0 then
                         begin
                           CSOSN:=csosn203;
                           if tProd[x, 20] <> '' then
                             ICMS.pMVAST:=strtocurr(tProd[x, 20])// N19 - Percentual da margem de valor Adicionado do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou MVA utilizado no cálculo', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO MVA ICMS ST FALTANDO CSOSN203 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 31] <> '' then
                             ICMS.pRedBCST := strtocurr(tProd[x, 31]);                       // N20 - Percentual da Redução de BC do ICMS ST
                           if tProd[x, 22] <> '' then
                             ICMS.vBCST := strtocurr(tProd[x, 22])                          // N21 - Valor da BC do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou BASE ICM ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO BASE ICM ST FALTANDO CSOSN203 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x,23] <> '' then
                            ICMS.pICMSST := strtocurr(tProd[x, 23])                        // N22 - Alíquota do imposto do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou ALIQ. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQ ICMS ST FALTANDO CSOSN203 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 24] <> '' then
                            ICMS.vICMSST := strtocurr(tProd[x, 24])                       // N23 - Valor do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou VL. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VL. ICMS ST FALTANDO CSOSN203 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                         end;

                         if pos('400', tProd[x, 32]) > 0 then
                          CSOSN:=csosn400;
                         if pos('300', tProd[x, 32]) > 0 then
                          CSOSN:=csosn300;
                         if pos('900', tProd[x, 32]) > 0 then
                         begin
                          CSOSN:=csosn900;

                           if pos('0', tProd[x, 13]) > 0 then modBC := dbiMargemValorAgregado;
                           if pos('1', tProd[x, 13]) > 0 then modBC := dbiPauta;
                           if pos('2', tProd[x, 13]) > 0 then modBC := dbiPrecoTabelado;
                           if pos('3', tProd[x, 13]) > 0 then modBC := dbiValorOperacao;
                           if tProd[x, 16] <> '' then
                             ICMS.vBC := strtocurr(tProd[x, 16]); //<Valor da BC do ICMS>
                           if tprod[x, 18] <> '' then
                             ICMS.pRedBC := strtocurr(tprod[x, 18]);   // N14 - Percentual da Redução de BC do ICMS
                           if tProd[x, 14] <> '' then
                             ICMS.pICMS := strtocurr(tProd[x, 14]);//<Aliq do Imposto>
                           if tProd[x, 15] <> '' then
                             ICMS.vICMS := strtocurr(tProd[x, 15]); //<Valor do ICMS>
                                                //Modalidade de determinação da BC do ICMS
                           if pos('0', tProd[x, 19]) > 0 then modBCST := dbisPrecoTabelado;
                           if pos('1', tProd[x, 19]) > 0 then modBCST := dbisListaNegativa;
                           if pos('2', tProd[x, 19]) > 0 then modBCST := dbisListaPositiva;
                           if pos('3', tProd[x, 19]) > 0 then modBCST := dbisListaNeutra;
                           if pos('4', tProd[x, 19]) > 0 then modBCST := dbisMargemValorAgregado;
                           if pos('5', tProd[x, 19]) > 0 then modBCST := dbisPauta;

                           if tProd[x, 20] <> '' then
                             ICMS.pMVAST:=strtocurr(tProd[x, 20]);// N19 - Percentual da margem de valor Adicionado do ICMS ST

                           if tProd[x, 31] <> '' then
                             ICMS.pRedBCST := strtocurr(tProd[x, 31]);                       // N20 - Percentual da Redução de BC do ICMS ST
                           if tProd[x, 22] <> '' then
                             ICMS.vBCST := strtocurr(tProd[x, 22]);                          // N21 - Valor da BC do ICMS ST

                           if tProd[x,23] <> '' then
                            ICMS.pICMSST := strtocurr(tProd[x, 23]);                        // N22 - Alíquota do imposto do ICMS ST

                           if tProd[x, 24] <> '' then
                            ICMS.vICMSST := strtocurr(tProd[x, 24]);                       // N23 - Valor do ICMS ST

                           if tProd[x, 29] <> '' then
                            pCredSN := strtocurr(tProd[x, 29]);//<Alíquota de Crédito Simples Nacional>

                           if tProd[x, 30] <> '' then
                             vCredICMSSN:=strtocurr(tProd[x, 30]); //<Valor do Crédito Simples Nacional>

                         end;

                         if pos('500', tProd[x, 32]) > 0 then
                         begin
                          CSOSN:=csosn500;
                          if tProd[x, 22] <> '' then
                             ICMS.vBCSTRet := strtocurr(tProd[x, 22])                          // N21 - Valor da BC do ICMS ST
                          else
                          begin
                            Application.MessageBox('ICMS ST, mas não informou BASE ICM ST ANTERIOR', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO BASE ICM ST ANTERIOR FALTANDO CSOSN500 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                          end;
                          if tProd[x, 24] <> '' then
                            ICMS.vICMSSTRet := strtocurr(tProd[x, 24])                       // N23 - Valor do ICMS ST
                          else
                          begin
                           Application.MessageBox('ICMS ST, mas não informou VL. ICMS ST ANTERIOR', 'Atenção', MB_ICONWARNING + MB_OK);
                           Result:=WideString('ERRO VL. ICMS ST ANTERIOR FALTANDO CSOSN500 Prod: '+tProd[x, 2]);
                           ACBrNFe1.NotasFiscais.Clear;
                           exit;
                          end;
                         end;
                       end
                       else
                       begin

//                         if pos('00', tProd[x, 12]) > 0 then
                         if Copy(tProd[x, 12], 2, 2) = '00' then
                         begin
                           CST := cst00;
                           if tProd[x, 14] <> '' then
                            ICMS.pICMS := strtocurr(tProd[x, 14])//<Aliq do Imposto>
                           else
                           begin
                            Application.MessageBox('Tributado integralmente, mas não informou a alíquota', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQUOTA FALTANDO cst00 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;

                           if tProd[x, 15] <> '' then
                            ICMS.vICMS := strtocurr(tProd[x, 15]) //<Valor do ICMS>
                           else
                           begin
                            Application.MessageBox('Tributado integralmente, mas não informou a Valor ICMS', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR ICMS FALTANDO cst00 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 16] <> '' then
                            ICMS.vBC := strtocurr(tProd[x, 16]) //<Valor da BC do ICMS>
                           else
                           begin
                            Application.MessageBox('Tributado integralmente, mas não informou a Base Cálculo ICMS', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR BASE ICMS FALTANDO cst00 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                         end;
//                         if pos('10', tProd[x, 12]) > 0 then
                         if Copy(tProd[x, 12], 2, 2) = '10' then
                         begin
                           CST := cst10;
                           if tProd[x, 14] <> '' then
                            ICMS.pICMS := strtocurr(tProd[x, 14])//<Aliq do Imposto>
                           else
                           begin
                            Application.MessageBox('Tributado integralmente, mas não informou a alíquota', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQUOTA FALTANDO cst00 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;

                           if tProd[x, 15] <> '' then
                            ICMS.vICMS := strtocurr(tProd[x, 15]) //<Valor do ICMS>
                           else
                           begin
                            Application.MessageBox('Tributado integralmente, mas não informou a Valor ICMS', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR ICMS FALTANDO cst00 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 16] <> '' then
                            ICMS.vBC := strtocurr(tProd[x, 16]) //<Valor da BC do ICMS>
                           else
                           begin
                            Application.MessageBox('Tributado integralmente, mas não informou a Base Cálculo ICMS', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR BASE ICMS FALTANDO cst00 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;

                           if tProd[x, 20] <> '' then
                             ICMS.pMVAST:=strtocurr(tProd[x, 20])// N19 - Percentual da margem de valor Adicionado do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou MVA utilizado no cálculo', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO MVA ICMS ST FALTANDO cst10 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 31] <> '' then
                             ICMS.pRedBCST := strtocurr(tProd[x, 31]);                       // N20 - Percentual da Redução de BC do ICMS ST
                           if tProd[x, 22] <> '' then
                             ICMS.vBCST := strtocurr(tProd[x, 22])                          // N21 - Valor da BC do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou BASE ICM ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO BASE ICM ST FALTANDO cst10 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x,23] <> '' then
                            ICMS.pICMSST := strtocurr(tProd[x, 23])                        // N22 - Alíquota do imposto do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou ALIQ. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQ ICMS ST FALTANDO cst10 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 24] <> '' then
                            ICMS.vICMSST := strtocurr(tProd[x, 24])                       // N23 - Valor do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou VL. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VL. ICMS ST FALTANDO cst10 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                         end;
//                         if pos('20', tProd[x, 12]) > 0 then
                         if Copy(tProd[x, 12], 2, 2) = '20' then
                         begin
                           CST := cst20;
                           if tprod[x, 18] <> '' then
                             ICMS.pRedBC := strtocurr(tprod[x, 18])   // N14 - Percentual da Redução de BC do ICMS
                           else
                           begin
                              Application.MessageBox('ICMS COM Redução, mas não informou Perc. redução', 'Atenção', MB_ICONWARNING + MB_OK);
                              Result:=WideString('ERRO Perc. redução FALTANDO cst20 Prod: '+tProd[x, 2]);
                              ACBrNFe1.NotasFiscais.Clear;
                              exit;
                           end;
                           if tProd[x, 14] <> '' then
                            ICMS.pICMS := strtocurr(tProd[x, 14])//<Aliq do Imposto>
                           else
                           begin
                            Application.MessageBox('Tributado integralmente, mas não informou a alíquota', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQUOTA FALTANDO cst20 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;

                           if tProd[x, 15] <> '' then
                            ICMS.vICMS := strtocurr(tProd[x, 15]) //<Valor do ICMS>
                           else
                           begin
                            Application.MessageBox('Tributado integralmente, mas não informou a Valor ICMS', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR ICMS FALTANDO cst20 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 16] <> '' then
                            ICMS.vBC := strtocurr(tProd[x, 16]) //<Valor da BC do ICMS>
                           else
                           begin
                            Application.MessageBox('Tributado integralmente, mas não informou a Base Cálculo ICMS', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR BASE ICMS FALTANDO cst20 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                         end;
//                         if pos('30', tProd[x, 12]) > 0 then
                         if Copy(tProd[x, 12], 2, 2) = '30' then
                         begin
                           CST := cst30;
                           if tProd[x, 20] <> '' then
                             ICMS.pMVAST:=strtocurr(tProd[x, 20])// N19 - Percentual da margem de valor Adicionado do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou MVA utilizado no cálculo', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO MVA ICMS ST FALTANDO cst30 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 31] <> '' then
                             ICMS.pRedBCST := strtocurr(tProd[x, 31]);                       // N20 - Percentual da Redução de BC do ICMS ST
                           if tProd[x, 22] <> '' then
                             ICMS.vBCST := strtocurr(tProd[x, 22])                          // N21 - Valor da BC do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou BASE ICM ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO BASE ICM ST FALTANDO cst30 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x,23] <> '' then
                            ICMS.pICMSST := strtocurr(tProd[x, 23])                        // N22 - Alíquota do imposto do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou ALIQ. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQ ICMS ST FALTANDO cst30 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 24] <> '' then
                            ICMS.vICMSST := strtocurr(tProd[x, 24])                       // N23 - Valor do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST, mas não informou VL. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VL. ICMS ST FALTANDO cst30 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                         end;
//                         if pos('40', tProd[x, 12]) > 0 then CST := cst40;// Verificar quando o veículo tiver benefícios tributários
                         if Copy(tProd[x, 12], 2, 2) = '40' then CST := cst40;
//                         if pos('41', tProd[x, 12]) > 0 then CST := cst41;
                         if Copy(tProd[x, 12], 2, 2) = '41' then CST := cst41;
//                         if pos('50', tProd[x, 12]) > 0 then CST := cst50;
                         if Copy(tProd[x, 12], 2, 2) = '50' then CST := cst50;
//                         if pos('51', tProd[x, 12]) > 0 then CST := cst51;
                         if Copy(tProd[x, 12], 2, 2) = '51' then CST := cst51;
//                         if pos('60', tProd[x, 12]) > 0 then
                         if Copy(tProd[x, 12], 2, 2) = '60' then
                         begin
                          CST := cst60;
                          if tProd[x, 22] <> '' then
                             ICMS.vBCSTRet := strtocurr(tProd[x, 22])                          // N21 - Valor da BC do ICMS ST
                          else
                          begin
                            Application.MessageBox('ICMS ST, mas não informou BASE ICM ST ANTERIOR', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO BASE ICM ST ANTERIOR FALTANDO cst60 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                          end;
                          if tProd[x, 24] <> '' then
                            ICMS.vICMSSTRet := strtocurr(tProd[x, 24])                       // N23 - Valor do ICMS ST
                          else
                          begin
                           Application.MessageBox('ICMS ST, mas não informou VL. ICMS ST ANTERIOR', 'Atenção', MB_ICONWARNING + MB_OK);
                           Result:=WideString('ERRO VL. ICMS ST ANTERIOR FALTANDO cst60 Prod: '+tProd[x, 2]);
                           ACBrNFe1.NotasFiscais.Clear;
                           exit;
                          end;
                         end;

//                         if (pos('70', tProd[x, 12]) > 0) or (pos('90', tProd[x, 12]) > 0)  then
                         if (Copy(tProd[x, 12], 2, 2) = '70') or (Copy(tProd[x, 12], 2, 2) = '90') then
                         begin
                           if (pos('70', tProd[x, 12]) > 0) then
                             CST := cst70
                           else
                            CST := cst90;
                           if tprod[x, 18] <> '' then
                             ICMS.pRedBC := strtocurr(tprod[x, 18])   // N14 - Percentual da Redução de BC do ICMS
                           else
                           begin
                              Application.MessageBox('ICMS COM Redução, mas não informou Perc. redução', 'Atenção', MB_ICONWARNING + MB_OK);
                              Result:=WideString('ERRO Perc. redução FALTANDO cst70 Prod: '+tProd[x, 2]);
                              ACBrNFe1.NotasFiscais.Clear;
                              exit;
                           end;
                           if tProd[x, 14] <> '' then
                            ICMS.pICMS := strtocurr(tProd[x, 14])//<Aliq do Imposto>
                           else
                           begin
                            Application.MessageBox('Tributado com redução, mas não informou a alíquota', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQUOTA FALTANDO cst70 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;

                           if tProd[x, 15] <> '' then
                            ICMS.vICMS := strtocurr(tProd[x, 15]) //<Valor do ICMS>
                           else
                           begin
                            Application.MessageBox('Tributado com redução, mas não informou a Valor ICMS', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR ICMS FALTANDO cst70 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 16] <> '' then
                            ICMS.vBC := strtocurr(tProd[x, 16]) //<Valor da BC do ICMS>
                           else
                           begin
                            Application.MessageBox('Tributado com redução, mas não informou a Base Cálculo ICMS', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VALOR BASE ICMS FALTANDO cst70 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
    {                       //Modalidade de determinação da BC do ICMS
                           if pos('0', tProd[x, 19]) > 0 then ICMS.modBCST := dbiMargemValorAgregado;
                           if pos('1', tProd[x, 19]) > 0 then ICMS.modBCST := dbiPauta;
                           if pos('2', tProd[x, 19]) > 0 then ICMS.modBCST := dbiPrecoTabelado;
                           if pos('3', tProd[x, 19]) > 0 then ICMS.modBCST := dbiValorOperacao;}
                           if tProd[x, 20] <> '' then
                             ICMS.pMVAST:=strtocurr(tProd[x, 20])// N19 - Percentual da margem de valor Adicionado do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST com redução, mas não informou MVA utilizado no cálculo', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO MVA ICMS ST FALTANDO cst70 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 31] <> '' then
                             ICMS.pRedBCST := strtocurr(tProd[x, 31]);                       // N20 - Percentual da Redução de BC do ICMS ST
                           if tProd[x, 22] <> '' then
                             ICMS.vBCST := strtocurr(tProd[x, 22])                          // N21 - Valor da BC do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST com redução, mas não informou BASE ICM ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO BASE ICM ST FALTANDO cst70 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x,23] <> '' then
                            ICMS.pICMSST := strtocurr(tProd[x, 23])                        // N22 - Alíquota do imposto do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST com redução, mas não informou ALIQ. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO ALIQ ICMS ST FALTANDO cst70 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                           if tProd[x, 24] <> '' then
                            ICMS.vICMSST := strtocurr(tProd[x, 24])                       // N23 - Valor do ICMS ST
                           else
                           begin
                            Application.MessageBox('ICMS ST com redução, mas não informou VL. ICMS ST', 'Atenção', MB_ICONWARNING + MB_OK);
                            Result:=WideString('ERRO VL. ICMS ST FALTANDO cst70 Prod: '+tProd[x, 2]);
                            ACBrNFe1.NotasFiscais.Clear;
                            exit;
                           end;
                         end;
    //                    faltando aqui colocar o cst90
                       end;
                    end;

                    with IPI do
                    begin
                       cEnq := tProd[x,74];
                       if Trim(cEnq) <> '' then
                       begin
                        //cEnq:='999';
                        vBC:=strtocurr(tProd[x,38]);
                        pIPI:=strtocurr(tProd[x,39]);
                        vIPI:=strtocurr(tProd[x,40]);
                       end;
                       if Trim(cEnq) = '' then
                       begin
                         cEnq := '999';
                         CST := ipi99;
                         vBC:=strtocurr(tProd[x,38]);
                         pIPI:=strtocurr(tProd[x,39]);
                         vIPI:=strtocurr(tProd[x,40]);
                       end
                       else if Trim(cEnq) <> '' then
                       begin
                         if pos('00', tProd[x, 17]) > 0 then CST := ipi00;
                         if pos('01', tProd[x, 17]) > 0 then CST := ipi01;
                         if pos('02', tProd[x, 17]) > 0 then CST := ipi02;
                         if pos('03', tProd[x, 17]) > 0 then CST := ipi03;
                         if pos('04', tProd[x, 17]) > 0 then CST := ipi04;
                         if pos('05', tProd[x, 17]) > 0 then CST := ipi05;
                         if pos('49', tProd[x, 17]) > 0 then CST := ipi49;
                         if pos('50', tProd[x, 17]) > 0 then CST := ipi50;
                         if pos('51', tProd[x, 17]) > 0 then CST := ipi51;
                         if pos('52', tProd[x, 17]) > 0 then CST := ipi52;
                         if pos('53', tProd[x, 17]) > 0 then CST := ipi53;
                         if pos('54', tProd[x, 17]) > 0 then CST := ipi54;
                         if pos('55', tProd[x, 17]) > 0 then CST := ipi55;
                         if pos('99', tProd[x, 17]) > 0 then CST := ipi99;
                       end;
                    end;
                  end;

                 PIS.CST:=StrToCSTPIS(tprod[x,41]);
                 PIS.vBC:=StrToCurr(tProd[x,42]);
                 PIS.pPIS:=StrToCurr(tProd[x,43]);
                 PIS.vPIS:=StrToCurr(tprod[x,44]);
                 PIS.qBCProd:=strtocurr(tProd[x,45]);
                 PIS.vAliqProd:=StrToCurr(tProd[x,46]);

                 COFINS.CST:=StrToCSTCOFINS(tProd[x,47]);
                 COFINS.vBC:=StrToCurr(tProd[x,48]);
                 COFINS.pCOFINS:=StrToCurr(tprod[x,49]);
                 COFINS.vCOFINS:=StrToCurr(tProd[x,50]);
                 COFINS.qBCProd:=StrToCurr(tprod[x,51]);
                 COFINS.vAliqProd:=StrToCurr(tprod[x,52]);

                 II.vBc := StrToCurr(tprod[x,53]);
                 II.vDespAdu := StrToCurr(tprod[x,54]);
                 II.vII := StrToCurr(tprod[x,55]);
                 II.vIOF := StrToCurr(tprod[x,56]);

                 vTotTrib := StrToCurr(tprod[x,65]);

               end;

                {
                1 = toVendaConcessionaria
                2 = toFaturamentoDireto
                3 = toVendaDireta
                4 = toOutros
                }

               if pos('1', temveic[0]) > 0 then //< Indica que possue veiculo >
               begin
                  if veiculo[0] = '1' then Prod.veicProd.tpOP := toVendaConcessionaria;
                  if veiculo[0] = '2' then Prod.veicProd.tpOP := toFaturamentoDireto;
                  if veiculo[0] = '3' then Prod.veicProd.tpOP := toVendaDireta;
                  if veiculo[0] = '4' then Prod.veicProd.tpOP := toOutros;


                  prod.veicProd.chassi := veiculo[1]; // J03 - Chassi do veículo
                  prod.veicProd.cCor := veiculo[2]; // J04 - Cor
                  prod.veicProd.xCor := veiculo[3]; // J05 - Descrição da Cor
                  prod.veicProd.pot := veiculo[4]; // J06 - Potência Motor
                  prod.veicProd.Cilin:= veiculo[5]; // J07 - CM3 (Potência)
                  prod.veicProd.pesoL := veiculo[6]; // J08 - Peso Líquido
                  prod.veicProd.pesoB := veiculo[7]; // J09 - Peso Bruto
                  prod.veicProd.nSerie := veiculo[8]; // J10 - Serial (série)
                  prod.veicProd.tpComb := veiculo[9]; // J11 - Tipo de combustível
                  prod.veicProd.nMotor := veiculo[10]; // J12 - Número de Motor
                  prod.veicProd.CMT:= veiculo[11]; // J13 - CMKG
                  prod.veicProd.dist := veiculo[12]; // J14 - Distância entre eixos
                  if veiculo[13] <> '' then
                   prod.veicProd.cMod := veiculo[13]; // J15 - RENAVAM            (Não informar a TAG na exportação)
                  prod.veicProd.anoMod := strtoint(veiculo[14]); // J16 - Ano Modelo de Fabricação
                  prod.veicProd.anoFab := strtoint(veiculo[15]); // J17 - Ano de Fabricação
                  prod.veicProd.tpPint := veiculo[16]; // J18 - Tipo de Pintura
                  prod.veicProd.tpVeic := strtoint(veiculo[17]); // J19 - Tipo de Veículo    (Utilizar Tabela RENAVAM)
                  prod.veicProd.espVeic := strtoint(veiculo[18]); // J20 - Espécie de Veículo (Utilizar Tabela RENAVAM)
                  prod.veicProd.VIN := veiculo[19]; // J21 - Condição do VIN
                  // 2.0
                  prod.veicProd.cCorDENATRAN:=veiculo[22];
                  prod.veicProd.lota:=strtoint(veiculo[23]);
                  prod.veicProd.tpRest:=strtoint(veiculo[24]);

                  if pos('1', veiculo[20]) > 0 then
                     prod.veicProd.condVeic := cvAcabado; // J22 - Condição do Veículo (1-Acabado)
                  if pos('2', veiculo[20]) > 0 then
                     prod.veicProd.condVeic := cvInacabado; // J22 - Condição do Veículo (2-Inacabado)
                  if pos('3', veiculo[20]) > 0 then
                     prod.veicProd.condVeic := cvSemiAcabado; // J22 - Condição do Veículo (3-Semi-acabado)

                  prod.veicProd.cMod := trim(veiculo[21]); // 2843; // J23 - Código Marca Modelo (Utilizar Tabela RENAVAM)
               end;

              // DI - Documento de Arrecadação

              if copy(tProd[x, 1],1,1) = '3' then
              begin
                for vCountDI := 0 to pItemDI[X].nCountDI - 1 do
                begin

                  with Prod.DI.Add do
                  begin
                    nDi := pItemDI[X].vDI[vCountDI].nDI;
                    dDi := StrToDate(pItemDI[X].vDI[vCountDI].dDI);
                    xLocDesemb := pItemDI[X].vDI[vCountDI].xLocDesemb;
                    UFDesemb := pItemDI[X].vDI[vCountDI].UFDesemb;
                    dDesemb := StrToDate(pItemDI[X].vDI[vCountDI].dDesemb);
                    cExportador := pItemDI[X].vDI[vCountDI].cExportador;
                    // versao 3.1
                    tpViaTransp := StrToTipoViaTransp(ok, pItemDI[X].vDI[vCountDI].tpViaTransp);
                    vAFRMM := StrToFloatDef(Trim(pItemDI[X].vDI[vCountDI].vAFRMM), 0);
                    tpIntermedio := StrToTipoIntermedio(ok, pItemDI[X].vDI[vCountDI].tpIntermedio);
                    CNPJ := Trim(pItemDI[X].vDI[vCountDI].CNPJ);
                    UFTerceiro := Trim(pItemDI[X].vDI[vCountDI].UFTerceiro);

                    for vCountADI := 0 to pItemDI[X].vDI[vCountDI].nCountADI - 1 do
                    begin

                      with adi.Add do
                      begin

                        nAdicao := StrToInt(pItemDI[X].vDI[vCountDI].vADI[vCountADI].nAdicao);
                        nSeqAdi := StrToInt(pItemDI[X].vDI[vCountDI].vADI[vCountADI].nSeqAdic);
                        cFabricante := pItemDI[X].vDI[vCountDI].vADI[vCountADI].cFabricante;
                        if StrToFloat( pItemDI[X].vDI[vCountDI].vADI[vCountADI].vDescDI) > 0 then
                          vDescDI := StrToFloat(pItemDI[X].vDI[vCountDI].vADI[vCountADI].vDescDI);
                        // versao 3.1
                        nDraw := Trim(pItemDI[X].vDI[vCountDI].vADI[vCountADI].nDraw);
                      end;

                    end;

                  end;

                end;

              end;

              // versao 3.1
              // Detalhes de Exportação
              if (copy(tProd[x, 1],1,1) = '3') or (copy(tProd[x, 1],1,1) = '7') then
              begin
                for vCountDetExp := 0 to pItemDI[X].nCountDetExport - 1 do
                begin
                  with Prod.detExport.Add do
                  begin
                    nDraw := pItemDI[X].vDetExport[vCountDetExp].nDraw;
                    for vCountDetExpInd := 0 to pItemDI[X].vDetExport[vCountDetExp].nCountExportInd - 1 do
                    begin
                      nRE := pItemDI[X].vDetExport[vCountDetExp].vExportInd[vCountDetExpInd].nRE;
                      chNFe := pItemDI[X].vDetExport[vCountDetExp].vExportInd[vCountDetExpInd].chNFe;
                      qExport := StrToFloatDef(Trim(pItemDI[X].vDetExport[vCountDetExp].vExportInd[vCountDetExpInd].qExport), 0);
                    end;
                  end;
                end;
              end;

              if Trim(tProd[x,57]) <> '' then
              begin
                Prod.comb.cProdANP := StrToInt(Trim(tProd[x,57]));
                if Trim(tProd[x,58]) <> '' then
                  Prod.comb.CODIF := Trim(tProd[x,58]);
                if Trim(tProd[x,59]) <> '' then
                  Prod.comb.qTemp := StrToFloat(Trim(tProd[x,59]));
                Prod.comb.UFcons := Trim(tProd[x,60]);
                if Trim(tProd[x,61]) <> '' then
                  Prod.comb.CIDE.qBCProd := StrToFloat(Trim(tProd[x,61]));
                if Trim(tProd[x,62]) <> '' then
                  Prod.comb.CIDE.vAliqProd := StrToFloat(Trim(tProd[x,62]));
                if Trim(tProd[x,63]) <> '' then
                  Prod.comb.CIDE.vCIDE := StrToFloat(Trim(tProd[x,63]));
                // versao 3.1
                if StrToFloatDef(Trim(tProd[x,72]), 0) > 0 then
                  Prod.comb.pMixGN := StrToFloatDef(Trim(tProd[x,72]), 0);
              end;
              Prod.cEAN := Trim(tProd[x,64]);
              Prod.cEANTrib := Trim(tProd[x,64]);

              if (tprod[x, 66] <> '0') and (tprod[x, 67] <> '0') then
              begin
                Prod.xPed := tprod[x, 66];
                Prod.nItemPed := tprod[x, 67];
              end;

              Prod.nFCI := tprod[x, 68];
              if Prod.nFCI.Trim.Length = 32 then
                Prod.nFCI := Prod.nFCI.Insert(08, '-').Insert(13, '-').Insert(18, '-').Insert(23, '-');

              // versao 3.1
              pDevol := StrToFloatDef(tprod[x, 69], 0);
              vIPIDevol := StrToFloatDef(tprod[x, 70], 0);
              Prod.nRECOPI := Trim(tprod[x, 71]);

              if Trim(tprod[x, 73]) <> '' then
              begin
                vListaTmp.Clear;
                vListaTmp := Split(Trim(tprod[x, 73]));

                for I := 0 to vListaTmp.Count - 1 do
                  if (Trim(vListaTmp[I]) <> '') and (Length(Trim(vListaTmp[I])) = 6) then
                    if Prod.NVE.Count < 8 then
                      with Prod.NVE.Add do
                        NVE := Trim(vListaTmp[I]);
              end;
              if (ide.dEmi >= StrToDate('01/04/2016')) or (ide.tpAmb = taHomologacao) then
                Prod.CEST := Trim(tprod[x, 75]);
              if (ide.dEmi >= StrToDate('01/01/2016')) or (ide.tpAmb = taHomologacao) then
              if (Ide.idDest = doInterestadual) and (Ide.indFinal = cfConsumidorFinal) and (Dest.indIEDest = inNaoContribuinte) then
//              if ( not ( strIn(IntToStr(Prod.comb.cProdANP),
//                ['820101001', '820101010', '810102001',
//                 '810102004', '810102002', '810102003', '810101002', '810101001',
//                 '810101003', '220101003', '220101004', '220101002', '220101001',
//                 '220101005', '220101006']) ) ) then
              begin

                Imposto.ICMSUFDest.vBCUFDest      := StrToFloatDef(tprod[x, 76], 0);
                Imposto.ICMSUFDest.pFCPUFDest     := StrToFloatDef(tprod[x, 77], 0);
                Imposto.ICMSUFDest.pICMSUFDest    := StrToFloatDef(tprod[x, 78], 0);
                Imposto.ICMSUFDest.pICMSInter     := StrToFloatDef(tprod[x, 79], 0);
                Imposto.ICMSUFDest.pICMSInterPart := StrToFloatDef(tprod[x, 80], 0);
                Imposto.ICMSUFDest.vFCPUFDest     := StrToFloatDef(tprod[x, 81], 0);
                Imposto.ICMSUFDest.vICMSUFDest    := StrToFloatDef(tprod[x, 82], 0);
                Imposto.ICMSUFDest.vICMSUFRemet   := StrToFloatDef(tprod[x, 83], 0);
                with Imposto.ICMSUFDest do
                  if (vBCUFDest   > 0) or (pFCPUFDest     > 0) or (pICMSUFDest > 0) or
                     (pICMSInter  > 0) or (pICMSInterPart > 0) or (vFCPUFDest  > 0) or
                     (vICMSUFDest > 0) or (vICMSUFRemet   > 0) then
                  vTagICMSUFDest := True;
              end;
            end;
         end;
         total.ICMSTot.vBC :=strtocurr(htotal[01]); //<totais baseicms>
         total.ICMSTot.vICMS := strtocurr(htotal[02]); //<valor icms>
         total.ICMSTot.vNF := strtocurr(htotal[03]); //<valor nota>
         total.ICMSTot.vProd := strtocurr(htotal[04]); //<valor dos Produtos>
         Total.ICMSTot.vBCST := strtocurr(htotal[05]);      // W05 - Base de Cálculo do ICMS ST
         Total.ICMSTot.vST := strtocurr(htotal[06]);        // W06 - Valor Total do ICMS ST
         if htotal[07] <> '' then
          Total.ICMSTot.vFrete := strtocurr(htotal[07]);     // W08 - Valor Total do Frete
         if htotal[08] <> '' then
          Total.ICMSTot.vSeg :=strtocurr(htotal[08]);       // W09 - Valor Total do Seguro
         if htotal[09] <> '' then
          Total.ICMSTot.vDesc :=strtocurr(htotal[09]);      // W10 - Valor Total do Desconto
         if htotal[10] <> '' then
          Total.ICMSTot.vIPI :=strtocurr(htotal[10]);       // W12 - Valor Total do IPI
         if htotal[11] <> '' then
          Total.ICMSTot.vOutro :=strtocurr(htotal[11]);     // W15 - Outras Despesas acessórias
         if htotal[12] <> '' then
          Total.retTrib.vIRRF :=strtocurr(htotal[12]);      // W28 - Valor Retido do IRRF
         if htotal[16] <> '' then
          Total.ICMSTot.vPIS:=strtocurr(htotal[16]);      // W28 - Valor do PIS
         if htotal[17] <> '' then
          Total.ICMSTot.vCOFINS:=strtocurr(htotal[17]);      // W28 - Valor do COFINS
         if htotal[18] <> '' then
          Total.ICMSTot.vII:=strtocurr(htotal[18]);

         if htotal[13] <> '' then
         begin
          Total.ISSQNtot.vBC:=strtocurr(htotal[13]);
          Total.ISSQNtot.vServ:=strtocurr(htotal[14]);
          Total.ISSQNtot.vISS:=strtocurr(htotal[15]);
         end;
         if hexporta[0] <> '' then
         begin
           exporta.UFSaidaPais := hexporta[0];
           exporta.xLocExporta := hexporta[1];
           exporta.xLocDespacho := '';//hexporta[2];
         end;
         Total.ICMSTot.vTotTrib := strtocurr(htotal[19]);
         if vTagICMSUFDest then
         begin
           Total.ICMSTot.vFCPUFDest   := StrToFloatDef(htotal[20], 0);
           Total.ICMSTot.vICMSUFDest  := StrToFloatDef(htotal[21], 0);
           Total.ICMSTot.vICMSUFRemet := StrToFloatDef(htotal[22], 0);
         end;

         if vTagICMSUFDest then
         begin
           InfAdic.infCpl := InfAdic.infCpl + ';' +
             'Valor ICMS relativo ao FCP da UF destino: ' + Format('%n', [Total.ICMSTot.vFCPUFDest]) + ';' +
             'Valor ICMS Interestadual para UF destino, já considerando o valor ICMS relativo ao FCP na UF Destino: ' + Format('%n', [Total.ICMSTot.vICMSUFDest]) + ';' +
             'Valor ICMS Interestadual para a UF do remetente: ' + Format('%n', [Total.ICMSTot.vICMSUFRemet]);
         end;
         InfAdic.infCpl := FiltrarTextoXML(True, InfAdic.infCpl);
      end;
   end;

   if tipoI_F = 2 then
   begin
      if TipoOP = 'Autorizar' then
      begin
         ACBrNFe1.Configuracoes.Arquivos.PathSalvar := vcaminho + '\Validado';
         ACBrNFe1.Enviar(vNLote);
         IF (ACBrNFe1.WebServices.Retorno.cStat = 100) or (ACBrNFe1.WebServices.Retorno.cStat = 104) then
         begin
            for i:=0 to ACBrNFe1.NotasFiscais.Count-1 do
            begin
              if ACBrNFe1.NotasFiscais.Items[0].Confirmada then
              begin
                CopyFile(PWideChar(vcaminho + '\Validado\'+
                ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[i].chDFe+'-nfe.xml'),
                PWideChar(vcaminho + '\Autorizado\'+ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[i].chDFe+'-nfe.xml'), true);
                resposta:='AUTORIZADA';
              end;
            end;
//            ACBrNFe1.WebServices.Retorno.NFeRetorno.nRec+'-pro-rec.xml';
//            ACBrNFe1.WebServices.Retorno.NFeRetorno.nRec+'-ped-rec.xml';
         end;
         // Colocar aqui o método que trata os retornos

//         MemoResp.Lines.Text := ACBrNFe1.WebServices.Retorno.RetWS;
         Result := WideString(UTF8Encode(ACBrNFe1.WebServices.StatusServico.RetWS));
      end;

      if TipoOP = 'Enviar' then
      begin
         if vultstatus <> 'CONTINGENCIA' then
         begin
           ACBrNFe1.NotasFiscais.GerarNFe;
           ACBrNFe1.Configuracoes.Arquivos.PathSalvar := vcaminho;
           try
            ACBrNFe1.NotasFiscais.Assinar;
            resposta:='OK';
            ACBrNFe1.NotasFiscais.Validar;
           except
            on e: exception do
            begin
             Application.MessageBox(PWideChar('Assinar: ' + E.Message),PWideChar('Error'), MB_OK);
             resposta:='ERRO';
            end;
           end;
           try
            if (resposta <> 'ERRO') then//and (ACBrNFe1.NotasFiscais.Items[0].NFe.ide.tpEmis <> teDPEC) then
            begin
             ACBrNFe1.WebServices.Envia(vNLote);
             resposta:='PROCESSADA';
            end
            else
            begin
             if ACBrNFe1.NotasFiscais.Items[0].NFe.ide.tpEmis = teDPEC then
             begin
//               if ACBrNFe1.WebServices.EnvEvento.EnviarDPEC.Executar then
//                 resposta:='PROCESSADA'
//               else
//                 resposta:='ERRO';
             end;
            end;
           except
            on e: exception do
            begin
             Application.MessageBox(PWideChar('Enviar: ' + E.Message),PWideChar('Error'), MB_OK);
             if (acbrnfe1.NotasFiscais.Count-1) > 0 then
               resposta:='PROCESSADA'
             else
               resposta:='ERRO';
            end;
           end;
           // Colocar aqui o método que trata os retornos


//           MemoResp.Lines.Text := ACBrNFe1.WebServices.Retorno.RetWS;
           Result := WideString(UTF8Encode(ACBrNFe1.WebServices.Retorno.RetWS));
//           ACBrNFe1.WebServices.StatusServico.RetWS));
         end
         else
         begin
           ACBrNFe1.NotasFiscais.GerarNFe;
           ACBrNFe1.Configuracoes.Arquivos.PathSalvar := vcaminho + '\Validado';
           ACBrNFe1.NotasFiscais.Assinar;
           ACBrNFe1.NotasFiscais.Validar;
           result := WideString(copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, (length(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) - 44) + 1, 44) + '-NFe.xml');
           result:='CONTINGENCIA';
           resposta:='CONTINGENCIA';
           // Colocar aqui o método que trata os retornos

         end;
      end;
      if TipoOP = 'Gerar' then
      begin
         j := 0;
         ACBrNFe1.NotasFiscais.GerarNFe;
         ACBrNFe1.Configuracoes.Arquivos.PathSalvar := vcaminho + '\Validado';
         ACBrNFe1.NotasFiscais.Assinar;
         ACBrNFe1.NotasFiscais.Validar;
         result := WideString(copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, (length(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID) - 44) + 1, 44) + '-NFe.xml');
         resposta:='VALIDADA';
         // Colocar aqui o método que trata os retornos
      end;
   end;
end;


function ExecutarDLL(ttipo: WideString; Aux: WideString; Just: WideString;var resposta:WideString;sisint: WideString;NFTP: WideString;codempresa: WideString;vtipocons: WideString;statusNFE: WideString;nregdpec: WideString; pUFWS: WideString): WideString; stdcall;
var
  vstatcomp, vExisteArquivo: Boolean;
  vcamint: string;
  vflgacao: integer;
  vteste, vArquivoTeste: string;
//  vcpmemo: Tmemo;
begin
   vAux := Aux;
   vTipoOP := ttipo;
   if vtipoOP = 'Validar' then
   begin
      try
//      try
//       StrToInt('A');
       ACBrNFe1.NotasFiscais.clear;
       ACBrNFe1.NotasFiscais.LoadFromFile(vAux);// Para este caso
                                                // Serão enviados a pasta e o nome do arquivo
       try
        ACBrNFe1.NotasFiscais.Validar;
       except

       end;
//           CopyFile(WideString(ACBrNFe1.Configuracoes.Geral.PathSalvar+'\'+
//            vAux),
//            WideString(vcaminho + '\Validado\'+vAux), true);
       ACBrNFe1.NotasFiscais.clear;
       Application.MessageBox(WideString('Nota Fiscal Eletrônica Válida'),WideString('Aviso'), MB_OK);
       resposta:='OK';
//       resposta:=WideString(inttostr(ACBrNFe1.NotasFiscais.Count));
//       showmessage();
      except
        on e: exception do
        begin
         Application.MessageBox(PWideChar('1916 ' + E.Message),PWideChar('Error'), MB_OK);
         resposta:='Erro';
        end;
      end;
//      except
//       on E: Exception do
//       begin
//        showmessage(E.message);
//        resposta:='Falha Validação';
//       end;
//      end;
      Result := 'Validação';
//      Application.MessageBox('Nota Fiscal Eletrônica Valida', 'Atenção', MB_ICONWARNING + MB_OK);
//      CopyFile(WideString(ACBrNFe1.Configuracoes.Geral.PathSalvar + '\validado\' + vAux), WideString(ACBrNFe1.Configuracoes.Geral.PathSalvar + '\Validado\' + vAux), True);
   end;

   if vtipoOP = 'Consulta' then
   begin
      try
        if (statusNFE = 'Autorizada') or (statusNFE = 'Cancelada') then
        begin
          vcamint:=vcaminho+'\Autorizado';
          ACBrNFe1.Configuracoes.Arquivos.SalvarApenasNFeProcessadas := True;
        end
        else
          vcamint:=vcaminho;

        if FileExists(vcamint+'\' + vAux) then
        begin
         if vtipocons = 'SCAN' then
            ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN
         else if vtipocons = 'SVC' then
            ACBrNFe1.Configuracoes.Geral.FormaEmissao:= TpEmisUFToStr(string(pUFWS))
         else
          ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
         try
           vflgacao:=0;
           ACBrNFe1.NotasFiscais.Clear;
           ACBrNFe1.NotasFiscais.LoadFromFile(vcamint+'\' + vAux);
           ACBrNFe1.Consultar;
         except
          on e: exception do
          begin
           Application.MessageBox(PWideChar('1952 ' + E.Message),PWideChar('Error'), MB_OK);
           vflgacao:=1;
          end;
         end;
        end
        else
        begin
         Application.MessageBox(PWideChar('Arquivo XML da NFe não encontrado no caminho: '+#13+vcamint+'\' + vAux),PWideChar('Error'), MB_OK);
         vflgacao:=1;
        end;
      finally
        ACBrNFe1.Configuracoes.Arquivos.SalvarApenasNFeProcessadas := False;
      end;
      if vflgacao = 1 then
        resposta:='Prob. Consulta'
      else
        resposta:='OK';
      Result := WideString(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS));
   end;

   if vtipoOP = 'Imprimir' then
   begin
      ACBrNFe1.NotasFiscais.Clear;
      try
        {
        if trim(nregdpec) <> '' then
        begin
           try
             ACBrNFe1.NotasFiscais.LoadFromFile(ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\' + vAux);
             ACBrNFe1.DANFE.ProtocoloNFe:=nregdpec;
             ACBrNFe1.NotasFiscais.Imprimir;
           except
             ACBrNFe1.NotasFiscais.LoadFromFile(ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + vAux);
//             ACBrNFe1.DANFE.ProtocoloNFe:=nregdpec;
             ACBrNFe1.NotasFiscais.Imprimir;
           end;
        end
        else
        }
        begin
          if FileExists(ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + vAux) then
          begin
           ACBrNFe1.NotasFiscais.LoadFromFile(ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + vAux);
           if ACBrNFe1.NotasFiscais.Count > 0 then
             if ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.tpEmis = teDPEC then
             begin
               ACBrNFe1.DANFE.Protocolo :=
                 ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt + ' ' +
                 FormatDateTime('DD/MM/YYYY hh:nn:ss', ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.dhRecbto);
             end;
           ACBrNFe1.NotasFiscais.Imprimir;
          end
          else
           application.messagebox('NF-e Não Autorizada, Impressão não permitida', 'Confirmação', MB_OK);
          resposta:='OK';
        end
      except
       on E: Exception do
       begin
        showmessage(E.message);
        resposta:='Falha Imprimir';
       end;
      end;
      Result := 'Impressão';
   end;

   if vtipoOP = 'ImprimirEvento' then
   begin
      ACBrNFe1.NotasFiscais.Clear;
      try
        if FileExists(ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + vAux+'-nfe.XML') then
        begin
         ACBrNFe1.NotasFiscais.LoadFromFile(ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + vAux+'-nfe.XML');
         ACBrNFe1.EventoNFe.Evento.Clear;
         vArquivoTeste := ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + vAux+codempresa+nregdpec+
          '-ProcEventoNFe.XML';
         vExisteArquivo := FileExists(vArquivoTeste);
         if (not vExisteArquivo) and (Length(Trim(nregdpec)) = 1) then
         begin
           nregdpec := WideString('0' + Trim(string(nregdpec)));
           vArquivoTeste := ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + vAux+codempresa+nregdpec+'-ProcEventoNFe.XML';
           vExisteArquivo := FileExists(vArquivoTeste);
         end;
         if (not vExisteArquivo) then
         begin
           if Length(Trim(string(nregdpec))) = 1 then
             nregdpec := WideString('0' + Trim(string(nregdpec)));
           vArquivoTeste := ACBrNFe1.Configuracoes.Arquivos.PathSalvar + '\Autorizado\' + codempresa + vAux + nregdpec + '-ProcEventoNFe.XML';
           vExisteArquivo := FileExists(vArquivoTeste);
         end;
         if vExisteArquivo then
         begin
          ACBrNFe1.EventoNFe.LerXML(vArquivoTeste) ;
          ACBrNFe1.ImprimirEvento;
         end
         else
          application.messagebox('Evento Não Autorizado, Impressão não permitida', 'Confirmação', MB_OK);
        end
        else
         application.messagebox('NF-e Não Autorizada, Impressão não permitida', 'Confirmação', MB_OK);
        resposta:='OK';

      except
       on E: Exception do
       begin
        showmessage(E.message);
        resposta:='Falha Imprimir';
       end;
      end;
      Result := 'Impressão';
   end;

   if vtipoOP = 'Cancelar' then
   begin
      vflgacao:=0;
      try
       if vtipocons = 'SCAN' then
          ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN
       else if vtipocons = 'SVC' then
          ACBrNFe1.Configuracoes.Geral.FormaEmissao:= TpEmisUFToStr(string(pUFWS))
       else
        ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
       vstatcomp:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
       ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
       ACBrNFe1.NotasFiscais.Clear;
       if FileExists(vcaminho+ '\Autorizado\' + vAux) then
       begin
        ACBrNFe1.NotasFiscais.LoadFromFile(vcaminho+ '\Autorizado\' + vAux);
        if ACBrNFe1.Cancelamento(Just) then
        begin
         //vcpmemo:=TMemo.create;
//         vcpmemo.Lines.text:=UTF8Encode(ACBrNFe1.WebServices.Cancelamento.RetWS);
//         vteste:=vcaminho +ACBrNFe1.WebServices.Cancelamento.NFeChave+'-ProcCancNFe.xml';
//         vteste:=vcaminho + 'retcanc\'+
//         ACBrNFe1.WebServices.Cancelamento.NFeChave+'-ProcCancNFe.xml';
{         if not CopyFile(WideString(vcaminho +ACBrNFe1.WebServices.Cancelamento.NFeChave+'-ProcCancNFe.xml'),
         WideString(vcaminho + 'retcanc\'+
         ACBrNFe1.WebServices.Cancelamento.NFeChave+'-ProcCancNFe.xml'), true) then
          application.messagebox('Arquivo de cancelamento não foi copiado para a pasta '+
          'retcanc, Favor verificar se existe esta pasta', 'Confirmação', MB_OK)}
        end;
       end
       else
       begin
        Application.MessageBox(PWideChar('Arquivo XML da NFe não encontrado no caminho: '+#13+vcaminho+'\' + vAux),PWideChar('Error'), MB_OK);
        vflgacao:=1;
       end;
       ACBrNFe1.Configuracoes.WebServices.Visualizar:=vstatcomp;
      except
        on e: exception do
        begin
         ACBrNFe1.Configuracoes.WebServices.Visualizar:=vstatcomp;
         Application.MessageBox(PWideChar('2076 ' + E.Message),PWideChar('Error'), MB_OK);
         vflgacao:=1;
        end;
      end;
       if vflgacao = 1  then
        resposta:='Falha Cancelamento'
      else
        resposta:='OK';
      Result := WideString(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS));
//    CopyFile(WideString(OpenDialog1.FileName), WideString('C:\BasesAuto\NFE\Cancelado\' + extractfilename(opendialog1.filename)), True);
   end;
//   resposta:='TESTE';
end;

function BuscaTroca(Text, Busca, Troca: string): string;
var n: integer;
begin
   for n := 1 to length(Text) do
   begin
      if Copy(Text, n, 1) = Busca then
      begin
         Delete(Text, n, 1);
         Insert(Troca, Text, n);
      end;
   end;
   Result := Text;
end;

function InutilizarNFe(justificativa, cnpjemit, modelo, serie, ano, numeroinicial, numerofinal: WideString): WideString; stdcall;
begin
  try
   if (StrToInt(serie) >= 900) and (StrToInt(serie) <= 999) then
   begin
     if application.messagebox('Foi informado Série do SCAN. Tem certeza que deseja Inutilizar este(s) Numero? ', 'Confirmação', mb_yesno + MB_DEFBUTTON2) = IDYES then
      ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN
     else
     begin
      InutilizarNFe:='ERRO';
      exit;
     end;
   end
   else
    ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;

   ACBrNFe1.WebServices.Inutiliza(trim(cnpjemit),trim(justificativa), StrToInt(ano), StrToInt(modelo), StrToInt(serie), StrToInt(numeroinicial), StrToInt(numerofinal));
   InutilizarNFe:='OK';
  except
   on e: exception do
   begin
    Application.MessageBox(PWideChar('2125 ' + E.Message),PWideChar('Error'), MB_OK);
    InutilizarNFe:='ERRO';
   end;
  end;
//     ACBrNFe1.WebServices.Inutiliza(edtEmitCNPJ.Text, Justificativa, StrToInt(Ano), StrToInt(Modelo), StrToInt(Serie), StrToInt(NumeroInicial), StrToInt(NumeroFinal));
//   Result:=WideString(UTF8Encode(ACBrNFe1.WebServices.Inutilizacao.RetWS));
// MemoResp.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.Inutilizacao.RetWS);
end;

function ConsultaCadastro(vuf,cnpjcpf,mostrarretorno: WideString): WideString;stdcall;export;
var
 vataviso: boolean;
 vformemiss: TpcnTipoEmissao;
begin
  ACBrNFe1.WebServices.ConsultaCadastro.UF  := vuf;
  if Length(trim(cnpjcpf)) = 11 then
  begin
    if not cpf(trim(cnpjcpf)) then
    begin
      Application.MessageBox(WideString('CPF inválido'),WideString('Error'), MB_OK);
      result:='ERRO CPF';
      exit;
    end;
  end;
  if Length(trim(cnpjcpf)) = 14 then
  begin
    if not cgc(trim(cnpjcpf)) then
    begin
      Application.MessageBox(WideString('CNPJ inválido'),WideString('Error'), MB_OK);
      result:='ERRO CNPJ';
      exit;
    end;
  end;
  if Length(cnpjcpf) > 11 then
     ACBrNFe1.WebServices.ConsultaCadastro.CNPJ := cnpjcpf
  else
     ACBrNFe1.WebServices.ConsultaCadastro.CPF := cnpjcpf;
  vformemiss:=ACBrNFe1.Configuracoes.Geral.FormaEmissao;
  ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teNormal;
  if mostrarretorno = 'S' then
  begin
   vataviso:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
  end;
  ACBrNFe1.WebServices.ConsultaCadastro.Executar;
  if mostrarretorno = 'S' then
  begin
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=vataviso;
//   Application.MessageBox(WideString(ACBrNFe1.WebServices.ConsultaCadastro.xMotivo), 'Atenção', MB_ICONWARNING + MB_OK);
   Application.MessageBox(PWideChar(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xNome), 'Atenção', MB_ICONWARNING + MB_OK);
  end;
  result:=WideString(ACBrNFe1.WebServices.ConsultaCadastro.RetWS);
  ACBrNFe1.Configuracoes.Geral.FormaEmissao:=vformemiss;
//  ShowMessage();
//  ShowMessage(ACBrNFe1.WebServices.ConsultaCadastro.RetConsCad.InfCad.Items[0].xNome);
end;

function Cpf(Num: string): boolean;
var
  N1, n2, n3, n4, n5, n6, n7, n8, n9: integer;
  D1, d2: integer;
  Digitado, calculado: string;
begin
  try
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    calculado := inttostr(d1) + inttostr(d2);
    digitado := num[10] + num[11];
    if calculado = digitado then
      cpf := true
    else
      cpf := false;
  except
    cpf := false;
  end;
end;


function cgc(Num: string): boolean;
var
  N1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: integer;
  D1, d2: integer;
  Digitado, calculado: string;
begin
  try
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    n10 := StrToInt(num[10]);
    n11 := StrToInt(num[11]);
    n12 := StrToInt(num[12]);

    d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3
      + n2 * 4 + n1 * 5;
    d1 := 11 - (d1 mod 11);
    if d1 >= 10 then
      d1 := 0;
    d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3
      + n3 * 4 + n2 * 5 + n1 * 6;
    d2 := 11 - (d2 mod 11);
    if d2 >= 10 then
      d2 := 0;
    Calculado := inttostr(d1) + inttostr(d2);
    digitado := num[13] + num[14];
    if calculado = digitado then
      cgc := true
    else
      cgc := false;
  except
    cgc := false;
  end;
end;

function Split(const Str: string; Delimiter: Char = '|'): TStringList;
var
  vLineBreak: string;
begin
  Result := TStringList.Create;
  vLineBreak := Result.LineBreak;
  Result.LineBreak := Delimiter;
  Result.Text := Str;
  Result.LineBreak := vLineBreak;
end;

function getCampoPipe(plinha: string; pOrdem: integer; pDelimitador: string = '|'): string;
var
  vTemp: string;
  vInc: Smallint;
begin
  vTemp := plinha;
  vInc := 0;
  while pos(pDelimitador, vTemp) > 0 do
  begin
    inc(vInc);
    if pOrdem = vInc then
    begin
      vTemp := Copy(vTemp, 1, pos(pDelimitador, vTemp) - 1);
      Result := Trim(vTemp);
      exit;
    end;
    vTemp := Copy(vTemp, pos(pDelimitador, vTemp) + 1, length(vTemp));
  end;
  Result := '';
end;

function strIn(pSubString: string; const pArgs: array of string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Length(pArgs) - 1 do
    if pSubString = pArgs[I] then
//    if Pos(pSubString, string(pArgs[I])) > 0 then
    begin
      Result := True;
      Break;
    end;
end;

function VerificarSCAN: Integer;
var
 atvis: boolean;
begin
 try
   ACBrNFe1.Configuracoes.Geral.FormaEmissao:=teSCAN;
   atvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
   ACBrNFe1.WebServices.StatusServico.Executar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=atvis;
   Result:=ACBrNFe1.WebServices.StatusServico.cStat;
 except
  on e: exception do
  begin
   Application.MessageBox(PWideChar('2273 ' + E.Message),PWideChar('Error'), MB_OK);
   result:=0;
  end;
 end;
end;

function VerificarSVC(pUF: string): Integer;
var
 atvis: boolean;
begin
 try
   ACBrNFe1.Configuracoes.Geral.FormaEmissao:= TpEmisUFToStr(pUF);
   atvis:=ACBrNFe1.Configuracoes.WebServices.Visualizar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=true;
   ACBrNFe1.WebServices.StatusServico.Executar;
   ACBrNFe1.Configuracoes.WebServices.Visualizar:=atvis;
   Result:=ACBrNFe1.WebServices.StatusServico.cStat;
 except
  on e: exception do
  begin
   Application.MessageBox(PWideChar('2476 ' + E.Message),PWideChar('Error'), MB_OK);
   result:=0;
  end;
 end;
end;

function EnviarMDFE(vnumMDF: integer;codempresa: integer;vnumlote: integer;vendBanco: WideString;vusuario: WideString): WideString;stdcall;
var
 cadMDFe: TClassMDFe;
 vresposta: string;
begin
  result:='ERRO';
  vresposta:='ERRO';
  if DtmNFEHW = nil then
   DtmNFEHW:=TDtmNFEHW.create(nil);
  cadMDFe:=TClassMDFe.create;
  cadMDFe.vcaminhobanco:=string(vendBanco);
  cadMDFe.cadempresa.codempresa:=codempresa;
  cadMDFe.conectaBanco;
  cadMDFe.CadEmpresa.dadosGNfe;
  cadMDFe.vusuario:=vusuario;
  cadMDFe.IniciaMDFE;
  if cadMDFe.cadempresa.dataSet.FieldByName('NFE_GRAVALOG').AsString = 'S' then
    cadMDFe.ACBrMDFe1.OnGerarLog:=TEvent.GerarLog;
  cadMDFe.ACBrMDFe1.OnStatusChange := TEvent.FrStatusShowMDFe;
  // Chamar método aqui...
  if cadMDFe.verificarStatusWeb('N') = 'OK' then
  begin
    try
      vresposta:=cadMDFe.EnviarMDFE(vnumMDF,codempresa,vnumlote, TClassMDFeTipoOperacao.opMDFeEnviar);
    finally
     cadMDFe.GravaRetMDFE(cadMDFe.ACBrMDFe1, TClassMDFeTipoRetorno.reMDFeEnvio,vnumlote);
     if vresposta = 'OK' then
     begin
      if cadMDFe.vxmsg <> '' then
       Application.MessageBox(PWideChar('Mensagem da SEFAZ Cod.: '+#13+cadMDFe.vcmsg+' Mensagem: '+cadMDFe.vxmsg),PWideChar('Advertência'), MB_OK);
     end;
    end;
  end;
//   Result:=false;
  result:=WideString(vresposta);
  cadMDFe.DesconectaBanco;
  cadMDFe.Free;
  cadMDFe:=nil;
  FreeAndNil(DtmNFEHW);
end;

function ConsultarMDFE(vnummdfe,vnumloteconsulta,codempresa: integer;vendBanco: WideString;vusuario: WideString): LongBool;stdcall;
var
 cadMDFe: TClassMDFe;
 vresposta: Boolean;
begin
  result:=false;
  vresposta:=false;
  if DtmNFEHW = nil then
   DtmNFEHW:=TDtmNFEHW.create(nil);
  cadMDFe:=TClassMDFe.create;
  cadMDFe.vcaminhobanco:=string(vendBanco);
  cadMDFe.cadempresa.codempresa:=codempresa;
  cadMDFe.conectaBanco;
  cadMDFe.CadEmpresa.dadosGNfe;
  cadMDFe.vusuario:=vusuario;
  cadMDFe.IniciaMDFE;
  if cadMDFe.cadempresa.dataSet.FieldByName('NFE_GRAVALOG').AsString = 'S' then
    cadMDFe.ACBrMDFe1.OnGerarLog:=TEvent.GerarLog;
  cadMDFe.ACBrMDFe1.OnStatusChange := TEvent.FrStatusShowMDFe;
  // Chamar método aqui...
  if cadMDFe.verificarStatusWeb('N') = 'OK' then
  begin
    try
      vresposta:=cadMDFe.ConsultarMDFE(vnummdfe,vnumloteconsulta);
    finally
    end;
  end;
//   Result:=false;
  result:=vresposta;
  cadMDFe.DesconectaBanco;
  cadMDFe.Free;
  cadMDFe:=nil;
  FreeAndNil(DtmNFEHW);
end;

function EnviaEventoMDFE(nmdfe: integer; codempresa: integer;vendBanco: WideString;vusuario: WideString): LongBool;stdcall; // O Evento estará gravado no registro do MDFe
var
 cadMDFe: TClassMDFe;
 vresposta: Boolean;
begin
  result:=false;
  vresposta:=false;
  if DtmNFEHW = nil then
   DtmNFEHW:=TDtmNFEHW.create(nil);
  cadMDFe:=TClassMDFe.create;
  cadMDFe.vcaminhobanco:=string(vendBanco);
  cadMDFe.cadempresa.codempresa:=codempresa;
  cadMDFe.conectaBanco;
  cadMDFe.CadEmpresa.dadosGNfe;
  cadMDFe.vusuario:=vusuario;
  cadMDFe.IniciaMDFE;
  if cadMDFe.cadempresa.dataSet.FieldByName('NFE_GRAVALOG').AsString = 'S' then
    cadMDFe.ACBrMDFe1.OnGerarLog:=TEvent.GerarLog;
  cadMDFe.ACBrMDFe1.OnStatusChange := TEvent.FrStatusShowMDFe;
  // Chamar método aqui...
  if cadMDFe.verificarStatusWeb('N') = 'OK' then
  begin
    try
      vresposta:=cadMDFe.EnviaEventoMDFEint(nmdfe,0);
    finally
    end;
  end;
//   Result:=false;
  result:=vresposta;
  cadMDFe.DesconectaBanco;
  cadMDFe.Free;
  cadMDFe:=nil;
  FreeAndNil(DtmNFEHW);
end;

function ImprimirMDFE(vnummdfe: integer;codempresa: integer;vendBanco: WideString;vusuario: WideString):LongBool;stdcall;
var
 cadMDFe: TClassMDFe;
// vresposta: Boolean;
begin
  result:=false;
  if DtmNFEHW = nil then
   DtmNFEHW:=TDtmNFEHW.create(nil);
  cadMDFe:=TClassMDFe.create;
  cadMDFe.vcaminhobanco:=string(vendBanco);
  cadMDFe.cadempresa.codempresa:=codempresa;
  cadMDFe.conectaBanco;
  cadMDFe.CadEmpresa.dadosGNfe;
  cadMDFe.vusuario:=vusuario;
  cadMDFe.IniciaMDFE;
//  if cadMDFe.cadempresa.dataSet.FieldByName('NFE_GRAVALOG').AsString = 'S' then
//    cadMDFe.ACBrMDFe1.OnGerarLog:=TEvent.GerarLog;
//  cadMDFe.ACBrMDFe1.OnStatusChange := TEvent.FrStatusShowMDFe;
  try
    cadMDFe.buscaMDFE(vnummdfe,0);
    if not cadMDFe.dataSet.IsEmpty then
    begin
     if trim(cadMDFe.dataSet.FieldByName('CHAVE_MDFE').AsString) = '' then
     begin
       cadMDFe.EnviarMDFE(vnummdfe,codempresa,0,TClassMDFeTipoOperacao.opMDFeImprimir);
       result:=cadMDFe.ImprimirMDFE(cadMDFe.vchaveimp);
     end
     else
      result:=cadMDFe.ImprimirMDFE(trim(cadMDFe.dataSet.FieldByName('CHAVE_MDFE').AsString));
    end
    else
    begin
     Application.MessageBox(PWideChar('MDFe: '+IntToStr(vnummdfe)+' Não Encontrado no cadastro!'),PWideChar('Erro'), MB_OK);
     result:=false;
    end;
  finally
  end;
//  result:=vresposta;
  cadMDFe.DesconectaBanco;
  cadMDFe.Free;
  cadMDFe:=nil;
  FreeAndNil(DtmNFEHW);
end;

function ImprimirEventoMDFE(vnmdfe: integer;codempresa: integer;vendBanco: WideString;vusuario: WideString):LongBool;stdcall;
var
 cadMDFe: TClassMDFe;
// vresposta: Boolean;
begin
  result:=false;
  if DtmNFEHW = nil then
   DtmNFEHW:=TDtmNFEHW.create(nil);
  cadMDFe:=TClassMDFe.create;
  cadMDFe.vcaminhobanco:=string(vendBanco);
  cadMDFe.cadempresa.codempresa:=codempresa;
  cadMDFe.conectaBanco;
  cadMDFe.CadEmpresa.dadosGNfe;
  cadMDFe.vusuario:=vusuario;
  cadMDFe.IniciaMDFE;
//  if cadMDFe.cadempresa.dataSet.FieldByName('NFE_GRAVALOG').AsString = 'S' then
//    cadMDFe.ACBrMDFe1.OnGerarLog:=TEvent.GerarLog;
//  cadMDFe.ACBrMDFe1.OnStatusChange := TEvent.FrStatusShowMDFe;
  try
   result:=cadMDFe.ImprimirEventoMDFE(vnmdfe);
  finally
  end;
//  result:=vresposta;
  cadMDFe.DesconectaBanco;
  cadMDFe.Free;
  cadMDFe:=nil;
  FreeAndNil(DtmNFEHW);
end;

function EnviarEmailMDFE(vnmdfe: integer;codempresa,vtpop: integer;vendBanco: WideString;vusuario: WideString):LongBool;stdcall;
// vtpop = 2 Email MDFe vtpop = 3 Email do Evento Anexado ao MDFe
var
 cadMDFe: TClassMDFe;
 vtipoevento: string;
begin
  result:=false;
  vtipoevento:='';
  if DtmNFEHW = nil then
   DtmNFEHW:=TDtmNFEHW.create(nil);
  cadMDFe:=TClassMDFe.create;
  cadMDFe.vcaminhobanco:=string(vendBanco);
  cadMDFe.cadempresa.codempresa:=codempresa;
  cadMDFe.conectaBanco;
  cadMDFe.CadEmpresa.dadosGNfe;
  cadMDFe.vusuario:=vusuario;
  cadMDFe.IniciaMDFE;
  if cadMDFe.cadempresa.dataSet.FieldByName('NFE_GRAVALOG').AsString = 'S' then
    cadMDFe.ACBrMDFe1.OnGerarLog:=TEvent.GerarLog;
  cadMDFe.ACBrMDFe1.OnStatusChange := TEvent.FrStatusShowMDFe;
  try
    cadMDFe.buscaMDFE(vnmdfe,0);
    if not cadMDFe.dataSet.IsEmpty then
    begin
      if vtpop = 3 then
      begin
        if cadMDFe.dataSet.FieldByName('TIPO_EVENTO').AsString = 'CAN' then
          vtipoevento:='110111'
        else
         vtipoevento:='110112';
      end;
      result:=cadMDFe.enviaEmailMDFE(cadMDFe.ACBrMDFe1,TClassMDFeTipoEmail(vtpop),1,vtipoevento);
    end
    else
    begin
     Application.MessageBox(PWideChar('MDFe: '+IntToStr(vnmdfe)+' Não Encontrado no cadastro!'),PWideChar('Erro'), MB_OK);
     result:=false;
    end;
  finally
  end;//  result:=vresposta;
  cadMDFe.DesconectaBanco;
  cadMDFe.Free;
  cadMDFe:=nil;
  FreeAndNil(DtmNFEHW);
end;


exports
 LerConfiguracao,
 IniciaNFE,
 ExecutarDLL,
 status,
 GeraNFe,
 InutilizarNFe,
 leCertificadoNFe,
 verificarStatusWeb,
 TerminaNFE,
 VerificarSCAN,
 ConsultaCadastro,
 verificarRecibolote,
 GeraChaveNFe,
 EnviarMDFE,
 ConsultarMDFE,
 EnviaEventoMDFE,
 ImprimirMDFE,
 ImprimirEventoMDFE,
 EnviarEmailMDFE;

end.
