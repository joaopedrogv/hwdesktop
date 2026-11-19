unit UFuncoesDll;

interface
uses
  Vcl.Forms,
  SysUtils,
  Vcl.Controls,
  Classes,
  inifiles,
  Messages,
  windows,
  ACBrNFe,
  pcnConversao,
  ACBrNFeDANFeRLClass,
  pcnAuxiliar,
  ACBrDFe.Conversao,
  UDtmHwNFE,
  UClasseNFe,
  ufrmStatus,
  uDataSet_OOP_DX;

type
   TEvent = class
   public
      class procedure FrStatusShow(Sender: TObject); virtual;
      class procedure GerarLog(const Mensagem: String; var Tratado: Boolean);
      class procedure FrStatusShowMDFe(Sender: TObject); virtual;
   end;

  TNFeCertificadoLegado = record
    CaminhoPFX: string;
    Senha: string;
    NumeroSerie: string;
  end;

  TNFeGeralLegado = record
    TipoDANFE: string;
    FormaEmissao: string;
    Logomarca: string;
    SalvarArquivos: string;
    PathSalvar: string;
    EnderecoPDF: string;
    AguardarConsultaRet: string;
    GravarLog: string;
    Sistema: string;
    MostrarValorLiquido: string;
    CasasDecimais: string;
    LarguraCodProd: string;
  end;

  TNFeWebServiceLegado = record
    UF: string;
    Ambiente: string;
    Visualizar: string;
  end;

  TNFeConfiguracaoLegado = record
    Certificado: TNFeCertificadoLegado;
    Geral: TNFeGeralLegado;
    WebService: TNFeWebServiceLegado;
  end;

 function GeraChaveNFe(codigo_uf: integer;cnf: integer;modelo: integer;
   serie: integer;nnf: integer;tpemi: integer;vdata: WideString;cnpj: WideString): WideString;
 function LerConfiguracao(const AConfigLegado: TNFeConfiguracaoLegado): WideString;
 function VerificarSVC(pUF: string): Integer;
 function Cpf(Num: string): boolean;
 function cgc(Num: string): boolean;

 function TerminaNFE: LongBool;stdcall;
 function ConsultaCadastro(vuf,cnpjcpf,mostrarretorno: WideString): WideString;stdcall;


 var
   ACBrNFe1: TACBrNFe;
   ACBrNFeDANFERave1: TACBrNFeDANFeRL;
   ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
implementation

uses ACBrNFeConfiguracoes, ACBrMDFe, pcnConversaoNFe,
  ACBrMDFe.Conversao, ACBrDFe, ACBrDFeSSL, {pcnEnvEventoNFe, }ACBrNFeNotasFiscais,
  Math, ACBrDFeUtil, ACBrDFeDANFeReport, hw_win_utils;

procedure closeallAuditoria; stdcall; external 'auditoria.dll';

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

procedure IniciaNFE(const AConfigLegado: TNFeConfiguracaoLegado);
var
  ALargProd: Integer;
begin
  if Pos('rave', LowerCase(AConfigLegado.Geral.TipoDANFE)) > 0 then
  begin
    if ACBrNFeDANFERave1 = nil then
      ACBrNFeDANFERave1:= TACBrNFeDANFeRL.create(nil);
//      ACBrNFeDANFERave1:= TACBrNFeDANFERaveCB.create(nil);
    ACBrNFeDANFERave1.ExibeInforAdicProduto := infSeparadamente;
    ALargProd := StrToIntDef(AConfigLegado.Geral.LarguraCodProd, 0);
    ALargProd := IfThen(ALargProd <= 0, TACBrNFeDANFeRL(ACBrNFeDANFERave1).LarguraCodProd, ALargProd);
    TACBrNFeDANFeRL(ACBrNFeDANFERave1).LarguraCodProd := ALargProd;
  end
  else
  begin
    if not Assigned(ACBrNFeDANFeRL1) then
      ACBrNFeDANFeRL1 := TACBrNFeDANFeRL.Create(Application);
    ACBrNFeDANFeRL1.ExibeInforAdicProduto := infNenhum;
    ALargProd := StrToIntDef(AConfigLegado.Geral.LarguraCodProd, 0);
    ALargProd := IfThen(ALargProd <= 0, TACBrNFeDANFeRL(ACBrNFeDANFeRL1).LarguraCodProd, ALargProd);
    TACBrNFeDANFeRL(ACBrNFeDANFeRL1).LarguraCodProd := ALargProd;
    TACBrNFeDANFeRL(ACBrNFeDANFeRL1).PosCanhoto := prCabecalho;
  end;
  if ACBrNFe1 = nil then
  begin
    ACBrNFe1 := TACBrNFe.Create(nil);
    if AConfigLegado.Geral.GravarLog = 'S' then
      ACBrNFe1.OnGerarLog:=TEvent.GerarLog;

    if Pos('rave', LowerCase(AConfigLegado.Geral.TipoDANFE)) > 0 then
      ACBrNFe1.DANFE := ACBrNFeDANFERave1
    else
      ACBrNFe1.DANFE := ACBrNFeDANFeRL1;

    if AConfigLegado.Geral.MostrarValorLiquido = 'S' then
      ACBrNFe1.DANFE.ExibeInforAdicProduto := infSeparadamente
    else
      ACBrNFe1.DANFE.ExibeInforAdicProduto := infNenhum;

    ACBrNFe1.Configuracoes.Geral.SSLLib := libCapicom;//DelphiSoap;
  end;
  if Pos('rave', LowerCase(AConfigLegado.Geral.TipoDANFE)) > 0 then
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
      if Pos('Retrato', AConfigLegado.Geral.TipoDANFE) > 0 then
       ACBrNFe1.DANFE.TipoDANFE := tiretrato
      else
       ACBrNFe1.DANFE.TipoDANFE := tipaisagem;
      ACBrNFe1.DANFE.PathPDF:=AConfigLegado.Geral.EnderecoPDF;
      ACBrNFe1.DANFE.Logo:= AConfigLegado.Geral.Logomarca;
      ACBrNFe1.DANFE.Sistema:=AConfigLegado.Geral.Sistema;
      ACBrNFe1.DANFE.CasasDecimais.vUnCom:=strtoint(AConfigLegado.Geral.CasasDecimais);
      ACBrNFe1.DANFE.CasasDecimais.qCom:=strtoint(AConfigLegado.Geral.CasasDecimais);
      ACBrNFe1.DANFE.CasasDecimais.MaskqCom := '';
      ACBrNFe1.DANFE.CasasDecimais.MaskvUnCom := '';
//      ACBrNFe1.DANFE.rav
//      ACBrNFe1.DANFE.
//     ACBrNFe1.DANFE:=ACBrNFeDANFERave1;
//   end;

   if AConfigLegado.Geral.FormaEmissao = 'NORMAL' then
    ACBrNFe1.Configuracoes.Geral.FormaEmissao := tenormal
   else
    if AConfigLegado.Geral.FormaEmissao = 'SCAN' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := teSCAN
   else if AConfigLegado.Geral.FormaEmissao = 'SVC' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := TpEmisUFToStr(AConfigLegado.WebService.UF)
   else
    if AConfigLegado.Geral.FormaEmissao = 'DPEC' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := teDPEC
   else
    if AConfigLegado.Geral.FormaEmissao = 'CONTINGENCIA' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := teContingencia
   else
    if AConfigLegado.Geral.FormaEmissao = 'FSDA' then
     ACBrNFe1.Configuracoes.Geral.FormaEmissao := teFSDA;

   if AConfigLegado.Geral.SalvarArquivos = '1' then ACBrNFe1.Configuracoes.Geral.Salvar := True;
   if AConfigLegado.Geral.SalvarArquivos = '2' then ACBrNFe1.Configuracoes.Geral.Salvar := False;
   if AConfigLegado.Geral.AguardarConsultaRet <> '' then
     ACBrNFe1.Configuracoes.WebServices.AguardarConsultaRet:=StrToInt(AConfigLegado.Geral.AguardarConsultaRet);
   ACBrNFe1.Configuracoes.Arquivos.PathSalvar := AConfigLegado.Geral.PathSalvar;
   ACBrNFe1.Configuracoes.WebServices.UF := AConfigLegado.WebService.UF;

   if AConfigLegado.WebService.Ambiente = 'Homologação' then ACBrNFe1.Configuracoes.WebServices.Ambiente := tahomologacao;
   if AConfigLegado.WebService.Ambiente = 'Produção' then ACBrNFe1.Configuracoes.WebServices.Ambiente := taproducao;
   if UpperCase(AConfigLegado.WebService.Visualizar) = 'TRUE' then ACBrNFe1.Configuracoes.WebServices.Visualizar := TRUE;
   if UpperCase(AConfigLegado.WebService.Visualizar) = 'FALSE' then ACBrNFe1.Configuracoes.WebServices.Visualizar := FALSE;


   AcBrNFe1.OnStatusChange := TEvent.FrStatusShow;

end;


function LerConfiguracao(const AConfigLegado: TNFeConfiguracaoLegado): WideString;
begin
 IniciaNFE(AConfigLegado);

 ACBrNFe1.Configuracoes.Geral.SSLLib := TSSLLib(IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 0, Integer(libCapicom)) +
                                                 IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 1, Integer(libOpenSSL)) +
                                                 IfThen(IniConf.ReadInt('Sistema', 'libNFe', 0) = 2, Integer(libWinCrypt)));//libCapicom;// libCapicomDelphiSoap;

 ACBrNFe1.Configuracoes.Geral.Salvar := True;
 ACBrNFe1.Configuracoes.Geral.VersaoDF := ve400;
   ACBrNFe1.Configuracoes.Certificados.ArquivoPFX:= AConfigLegado.Certificado.CaminhoPFX;
   ACBrNFe1.Configuracoes.Certificados.Senha := AConfigLegado.Certificado.Senha;

   if ACBrNFe1.Configuracoes.Geral.SSLLib <> libOpenSSL then
     ACBrNFe1.Configuracoes.Certificados.NumeroSerie:= AConfigLegado.Certificado.NumeroSerie;
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

function GeraChaveNFe(codigo_uf: integer;cnf: integer;modelo: integer;
serie: integer;nnf: integer;tpemi: integer;vdata: WideString;cnpj: WideString): WideString;
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

function ConsultaCadastro(vuf,cnpjcpf,mostrarretorno: WideString): WideString;stdcall;
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
  end;
  cadMDFe.DesconectaBanco;
  cadMDFe.Free;
  cadMDFe:=nil;
  FreeAndNil(DtmNFEHW);
end;


exports
 EnviarMDFE,
 ConsultarMDFE,
 EnviaEventoMDFE,
 ImprimirMDFE,
 ImprimirEventoMDFE,
 EnviarEmailMDFE;

end.
