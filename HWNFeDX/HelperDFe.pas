unit HelperDFe;

interface

uses
  uDataSet_OOP_DX,
  System.Classes,
  ACBrDFe,
  ACBrNFe.Classes;

type
  EnumDfeType = (enDefault, enNFe, {enNFCe, }enNFSe, enMDFe);

  TCertificateData = class
  private
    FFileName: string;
    FSerialNumber: string;
    FPassword: string;
    FDaysWarning: Integer;
    FcheckExpires: Boolean;
    FBase64PFX: string;
  public
    property FileName: string read FFileName write FFileName;
    property SerialNumber: string read FSerialNumber write FSerialNumber;
    property Password: string read FPassword write FPassword;
    property Base64PFX: string read FBase64PFX write FBase64PFX;
    property DaysWarning: Integer read FDaysWarning write FDaysWarning;
    property checkExpires: Boolean read FcheckExpires write FcheckExpires;
  end;

  TValoresCST = class
  public
    cst: string;
    base, aliquota, valor: Double;
    infAdicional: string;
  end;

  THelperDFe = class
  public
    class procedure Configure(dfe: TACBrDFe; dfeType: EnumDfeType; certData: TCertificateData); overload;
    class procedure Configure(dfe: TACBrDFe; dfeType: EnumDfeType; emp: TDataSet_OOP_DX; checkExpiresDate: Boolean = True); overload;
    class function GetCertificateData(dfe: TACBrDFe; certData: TCertificateData): TStrings; overload;
    class function GetCertificateData(certData: TCertificateData): string; overload;
    class function GetInfComplementarCombustiveis(nfe: TNFe): TArray<string>;
    class function GetInfAdicionalProdCombustiveis(detItem: TDetCollectionItem): TArray<string>;
  end;

implementation

{ THelperDFe }

uses
  System.SysUtils,
  System.StrUtils,
  System.Math,
  synacode,
  ACBrDFeSSL,
  ACBrNFe,
  pcnConversao,
  blcksock,
  hw_utils,
  hw_win_utils,
  TypInfo;

class procedure THelperDFe.Configure(dfe: TACBrDFe; dfeType: EnumDfeType;
  emp: TDataSet_OOP_DX; checkExpiresDate: Boolean);
var
  certData: TCertificateData;
begin
  certData := TCertificateData.Create;
  try
    certData.FileName := emp.fstr('NFE_CAMINHO_CERT');
    certData.SerialNumber := emp.fstr('NFE_NUMSERIE_CERT');
    certData.Password := emp.fstr('NFE_SENHA__CERT');
    certData.DaysWarning := emp.fint('DIAS_AVISO');
    certData.checkExpires := checkExpiresDate;

    THelperDFe.Configure(dfe, dfeType, certData);

  finally
    certData.Free;
  end;
end;

class function THelperDFe.GetCertificateData(dfe: TACBrDFe;
  certData: TCertificateData): TStrings;
  // Capicom           = [NumeroSerie]
  // CapicomDelphiSoap = [NumeroSerie]
  // OpenSSL           = [ArquivoPFX e Senha] [DadosPFX e Senha]
  // WinCrypt          = [ArquivoPFX e Senha] [DadosPFX e Senha] [NumeroSerie]
  // sslLibs           = [TSSLLib.libWinCrypt, TSSLLib.libOpenSSL, TSSLLib.libCapicom, TSSLLib.libCapicomDelphiSoap];
  // sslLibs = [TSSLLib.libCapicom];
var
  base64: string;
  libDFe: Integer;
  sslTypeDefault: Integer;
  sslLibs: TArray<TSSLLib>;
begin
  Result := NewStringList('',';');
  Result.Values['DiasAviso'] := certData.DaysWarning.ToString();

  if not certData.Base64PFX.Trim.IsEmpty then
    base64 := AnsiString(DecodeBase64(certData.Base64PFX))
  else
    base64 := '';

   sslLibs := [TSSLLib.libWinCrypt, TSSLLib.libOpenSSL, TSSLLib.libCapicom, TSSLLib.libCapicomDelphiSoap];

  for var ssl in sslLibs do
  begin
    dfe.SSL.DescarregarCertificado;
    try
      dfe.Configuracoes.Certificados.NumeroSerie := IfThen(ssl <>  TSSLLib.libOpenSSL, certData.SerialNumber);
      dfe.Configuracoes.Certificados.ArquivoPFX  := IfThen(ssl in [TSSLLib.libOpenSSL, TSSLLib.libWinCrypt], certData.FileName);
      dfe.Configuracoes.Certificados.Senha       := IfThen(ssl in [TSSLLib.libOpenSSL, TSSLLib.libWinCrypt], AnsiString(certData.Password));
      dfe.Configuracoes.Certificados.DadosPFX    := IfThen(ssl in [TSSLLib.libOpenSSL, TSSLLib.libWinCrypt], base64);


      dfe.Configuracoes.Geral.SSLLib := ssl;
      dfe.SSL.CarregarCertificado;;
      if dfe.SSL.CertificadoLido then
      begin
        Result.Values['Lib']            := GetEnumName(TypeInfo(TSSLLib), Ord(ssl));
        Result.Values['DataVencimento'] := IfThen(dfe.SSL.CertDataVenc > 0             , FormatDateTime('dd/MM/yyyy', dfe.SSL.CertDataVenc), Result.Values['DataVencimento']);
        Result.Values['DiasVencimento'] := IfThen(dfe.SSL.CertDataVenc > 0             , Trunc(dfe.SSL.CertDataVenc - Date).ToString(), Result.Values['DiasVencimento']);
        Result.Values['CNPJ']           := IfThen(not dfe.SSL.CertCNPJ.IsEmpty         , dfe.SSL.CertCNPJ         , Result.Values['CNPJ']);
        Result.Values['NumeroSerie']    := IfThen(not dfe.SSL.CertNumeroSerie.IsEmpty  , dfe.SSL.CertNumeroSerie  , Result.Values['NumeroSerie']);
        Result.Values['Certificadora']  := IfThen(not dfe.SSL.CertCertificadora.IsEmpty, dfe.SSL.CertCertificadora, Result.Values['Certificadora']);
        Result.Values['RazaoSocial']    := IfThen(not dfe.SSL.CertRazaoSocial.IsEmpty  , dfe.SSL.CertRazaoSocial  , Result.Values['RazaoSocial']);
        Result.Values['IssuerName']     := IfThen(not dfe.SSL.CertIssuerName.IsEmpty   , dfe.SSL.CertIssuerName   , Result.Values['IssuerName']);
        Result.Values['SubjectName']    := IfThen(not dfe.SSL.CertSubjectName.IsEmpty  , dfe.SSL.CertSubjectName  , Result.Values['SubjectName']);
        Break;
      end;

    except on E: Exception do
      begin
        Result.Values['Error'] := Result.Values['Error'] + IfThen(not Result.Values['Error'].IsEmpty, '|') +
          GetEnumName(TypeInfo(TSSLLib), Ord(ssl)) + ' > ' + E.Message;
      end;
    end;
  end;
end;

class function THelperDFe.GetCertificateData(certData: TCertificateData): string;
var
  DFe: TACBrNFe;
  List: TStrings;
begin
  List := nil;
  DFe := TACBrNFe.Create(nil);
  try try

    List := THelperDFe.GetCertificateData(DFe, certData);

    Result := List.Text;

  except on E: Exception do
    Result :=
      'ERRO' + sLineBreak +
      'Não foi possível carregar dados do certificado' + sLineBreak +
      e.Message;
  end;
  finally
    DFe.Free();
    List.Free();
  end;
end;

class function THelperDFe.GetInfAdicionalProdCombustiveis(
  detItem: TDetCollectionItem): TArray<string>;
begin

  if detItem.Imposto.ICMS.CST in [cst53, cst61] then
  begin
    if detItem.Imposto.ICMS.CST = cst61 then
      Result := Result + ['ICMS monofásico sobre combustíveis cobrado anteriormente conforme Convênio ICMS 199/2022']
    else
      Result := Result + ['ICMS monofásico sobre combustíveis diferido conforme Convênio ICMS 199/2022']

  end
  else if detItem.Imposto.ICMS.CST in [cst02, cst15] then
  begin
    var it := TValoresCST.Create;
    it.aliquota := detItem.Imposto.ICMS.adRemICMS;
    it.base     := detItem.Imposto.ICMS.qBCMono;
    it.valor    := detItem.Imposto.ICMS.vICMSMono;

    Result := Result + [Format('ICMS monofásico próprio: BC %s (em litros), Alíquota: R$ %0.4f, ICMS mono: R$ %0.2n',
                               [FloatToStr(it.base), it.aliquota, it.valor])];


    if detItem.Imposto.ICMS.CST = cst15 then
    begin
      it.aliquota := detItem.Imposto.ICMS.adRemICMSReten;
      it.base     := detItem.Imposto.ICMS.qBCMonoReten;
      it.valor    := detItem.Imposto.ICMS.vICMSMonoReten;

      Result := Result + [Format('ICMS monofásico sujeito a retenção: BC %s (em litros), Alíquota: R$ %0.4f, ICMS mono: R$ %0.2n',
                                 [FloatToStr(it.base), it.aliquota, it.valor])];
    end;
  end;
end;

class function THelperDFe.GetInfComplementarCombustiveis(
  nfe: TNFe): TArray<string>;
var
  somaCst: TArray<TValoresCST>;
  resp: TArray<string>;
  cst: string;
begin
  Result := resp;
  if nfe = nil then
    Exit();

  if nfe.Det.Count = 0 then
    Exit;

//  var cst := nfe.Det.Items[0].Imposto.ICMS.CST ;
  for var I := 0 to nfe.Det.Count - 1 do
  begin
    var tributo := nfe.Det.Items[I];
    if tributo.Imposto.ICMS.CST in [cst53, cst61] then
    begin
      cst := IfThen(tributo.Imposto.ICMS.CST = cst53, '53', '61');
      var itemExists := False;
      for var J := Low(somaCst) to High(somaCst) do
        if itemExists then
          Break
        else
          itemExists := somaCst[J].cst = cst;

      if not itemExists then
      begin
        var it := TValoresCST.Create;
        it.cst := cst;
        somaCst := somaCst + [it];
      end;

    end
    else if tributo.Imposto.ICMS.CST in [cst02, cst15] then
    begin

      if (tributo.Imposto.ICMS.vICMSMono > 0) then
      begin
        cst := 'mono-' + IfThen(tributo.Imposto.ICMS.CST = cst02, '02', '15');
        var itemExists := False;
        for var J := Low(somaCst) to High(somaCst) do
          if (somaCst[J].cst = cst) and (RoundTo(somaCst[J].aliquota, -4) = RoundTo(tributo.Imposto.ICMS.adRemICMS, -4)) then
          begin
            itemExists          := True;
            somaCst[J].aliquota := tributo.Imposto.ICMS.adRemICMS;
            somaCst[J].base     := somaCst[J].base + tributo.Imposto.ICMS.qBCMono;
            somaCst[J].valor    := somaCst[J].valor + tributo.Imposto.ICMS.vICMSMono;
            Break;
          end;

        if not itemExists then
        begin
          var it := TValoresCST.Create;
          it.cst      := cst;
          it.aliquota := tributo.Imposto.ICMS.adRemICMS;
          it.base     := tributo.Imposto.ICMS.qBCMono;
          it.valor    := tributo.Imposto.ICMS.vICMSMono;
          somaCst     := somaCst + [it];
        end;
      end;

      if tributo.Imposto.ICMS.vICMSMonoReten > 0 then
      begin
        cst := 'reten-' + IfThen(tributo.Imposto.ICMS.CST = cst02, '02', '15');

        var itemExists := False;
  //      if cst = '15' then
        begin
          for var J := Low(somaCst) to High(somaCst) do
            if (somaCst[J].cst = cst) and (RoundTo(somaCst[J].aliquota, -4) = RoundTo(tributo.Imposto.ICMS.adRemICMSReten, -4)) then
            begin
              itemExists               := True;
              somaCst[J].aliquota := tributo.Imposto.ICMS.adRemICMSReten;
              somaCst[J].base     := somaCst[J].base + tributo.Imposto.ICMS.qBCMonoReten;
              somaCst[J].valor    := somaCst[J].valor + tributo.Imposto.ICMS.vICMSMonoReten;
              Break;
            end;

          if not itemExists then
          begin
            var it           := TValoresCST.Create;
            it.cst           := cst;
            it.aliquota := tributo.Imposto.ICMS.adRemICMSReten;
            it.base     := tributo.Imposto.ICMS.qBCMonoReten;
            it.valor    := tributo.Imposto.ICMS.vICMSMonoReten;
            somaCst          := somaCst + [it];
          end;
        end;
      end;
    end;
  end;

  for var J := Low(somaCst) to High(somaCst) do
    if somaCst[J].cst = '61' then
      Result := Result + ['ICMS monofásico sobre combustíveis cobrado anteriormente conforme Convênio ICMS 199/2022']
    else if somaCst[J].cst = '53' then
      Result := Result + ['ICMS monofásico sobre combustíveis diferido conforme Convênio ICMS 199/2022']
    else if somaCst[J].cst.StartsWith('mono-') then
      Result := Result + [Format('ICMS monofásico próprio: BC %s (em litros), Alíquota: R$ %0.4f, ICMS mono: R$ %0.2n',
                                 [FloatToStr(somaCst[J].base), somaCst[J].aliquota, somaCst[J].valor])]
    else
    begin
//      Result := Result + [Format('ICMS monofásico próprio: BC %f (em litros); Alíquota: R$ %0.4f; ICMS mono: R$ %0.2n',
//                                 [somaCst[J].base, somaCst[J].aliquota, somaCst[J].valor])];
//      if somaCst[J].cst = '15' then
        Result := Result + [Format('ICMS monofásico sujeito a retenção: BC %s (em litros), Alíquota: R$ %0.4f, ICMS mono: R$ %0.2n',
                                   [FloatToStr(somaCst[J].base), somaCst[J].aliquota, somaCst[J].valor])];
    end;
end;

class procedure THelperDFe.Configure(dfe: TACBrDFe; dfeType: EnumDfeType;
  certData: TCertificateData);
var
  section: string;
  libDFe: Integer;
  sslTypeDefault: Integer;
begin

  sslTypeDefault := -1;
  case dfeType of
    enNFe:
      begin
        section := 'NFe_SSLib';
        libDFe  := Ord(libCapicom);
      end;

    {enNFCe:
      section := 'NFCe_SSLib';}

    enNFSe:
      begin
        section := 'NFSe_SSLib';
        libDFe  := Ord(libOpenSSL);
      end;

    enMDFe:
      begin
        section        := 'MDFe_SSLib';
        libDFe         := Ord(libWinCrypt);
        sslTypeDefault := Ord(LT_TLSv1_2);
      end;
    else
    begin
      section := 'SSLib';
      libDFe  := Ord(libCapicom);
    end;
  end;

  if IniConf.ReadStr(section, 'Ativo') <> 'S' then
    section := 'SSLib';

  if section = 'SSLib' then
    libDFe := IniConf.ReadInt('Sistema', 'libNFe', libDFe)
  else
    libDFe := IniConf.ReadInt(section, 'libNFe', libDFe);

  libDFe := IfThen( TSSLLib(libDFe) in [TSSLLib.libOpenSSL, TSSLLib.libCapicom, TSSLLib.libWinCrypt] , libDFe, Ord(libOpenSSL));

  dfe.Configuracoes.Certificados.NumeroSerie := certData.SerialNumber;
  dfe.Configuracoes.Certificados.ArquivoPFX  := certData.FileName;
  dfe.Configuracoes.Certificados.Senha       := AnsiString(certData.Password);
//  dfe.Configuracoes.Certificados.DadosPFX    := AnsiString(certData.Base64PFX);

  {$REGION 'Vencimento'}

  try
    dfe.SSL.DescarregarCertificado;
    dfe.Configuracoes.Geral.SSLLib := libWinCrypt;

    if ((dfe.SSL.CertDataVenc - Date) <= certData.DaysWarning) then
      ShowAtencao('Certificado selecionado vence em: ' + DateToStr(dfe.SSL.CertDataVenc));

  except
    try
      dfe.SSL.DescarregarCertificado;
      dfe.Configuracoes.Certificados.ArquivoPFX := '';
      dfe.Configuracoes.Geral.SSLLib            := libCapicom;

      if ((dfe.SSL.CertDataVenc - Date) <= certData.DaysWarning) then
        ShowAtencao('Certificado selecionado vence em: ' + DateToStr(dfe.SSL.CertDataVenc));
    except
    end;
  end;

  {$ENDREGION}

  dfe.SSL.DescarregarCertificado;

  dfe.Configuracoes.Certificados.NumeroSerie := '';
  dfe.Configuracoes.Certificados.ArquivoPFX  := '';
//  dfe.Configuracoes.Certificados.DadosPFX    := '';
  dfe.Configuracoes.Certificados.Senha       := '';
  dfe.Configuracoes.Certificados.NumeroSerie := IfThen(TSSLLib(libDFe) <> libOpenSSL, certData.SerialNumber);
  dfe.Configuracoes.Certificados.ArquivoPFX  := IfThen(TSSLLib(libDFe) <> libCapicom, certData.FileName); ;
//  dfe.Configuracoes.Certificados.DadosPFX    := AnsiString(certData.Base64PFX);
  dfe.Configuracoes.Certificados.Senha       := AnsiString(certData.Password);

  dfe.Configuracoes.Geral.SSLLib          := TSSLLib(libDFe);

  if IniConf.ReadInt(section, 'SSLCryptLib', -1) >= 0 then
    dfe.Configuracoes.Geral.SSLCryptLib   := TSSLCryptLib(IniConf.ReadInt(section, 'SSLCryptLib'));

  if IniConf.ReadInt(section, 'SSLHttpLib', -1) >= 0 then
    dfe.Configuracoes.Geral.SSLHttpLib    := TSSLHttpLib(IniConf.ReadInt(section, 'SSLHttpLib'));

  if IniConf.ReadInt(section, 'SSLXmlSignLib', -1) >= 0 then
    dfe.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(IniConf.ReadInt(section, 'SSLXmlSignLib'));

  if IniConf.ReadInt(section, 'SSLType', sslTypeDefault) >= 0 then
    dfe.SSL.SSLType := TSSLType(IniConf.ReadInt(section, 'SSLType', sslTypeDefault));

end;

end.
