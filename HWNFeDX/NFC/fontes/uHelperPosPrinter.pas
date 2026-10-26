unit uHelperPosPrinter;

interface

uses
  ACBrPosPrinter;

type
  THelperPosPrinter = class
  private
    FLastError: string;

    procedure desativarPosPrinter(posPrinter: TACBrPosPrinter);
  public

    function SaveConfFile(confName, confFile: string): Boolean;
    function PrintNFCe(XMLAut, XMLCanc, confName, nfceConfName, dadosAdicionais: string): Integer;
    function OpenDrawer(params: string): Integer;

    property LastError: string read FLastError write FLastError;
  end;

implementation

uses
  SysUtils, StrUtils, Math, Classes,
  uNFC_Types, hw_utils,
  ACBrNFe, ACBrNFeDANFeESCPOS, ACBrDFeDANFeReport, ACBrNFeDANFEClass, pcnConversao;


{ THelperPosPrinter }

procedure THelperPosPrinter.desativarPosPrinter(posPrinter: TACBrPosPrinter);
begin
  if Assigned(posPrinter) then
    while posPrinter.Ativo do
    begin
      posPrinter.Desativar;
      if posPrinter.Ativo then
        Sleep(100);
    end;
end;

function THelperPosPrinter.OpenDrawer(params: string): Integer;
begin
  Result := 0;
  var paramValues := NewStringList(params, ';');
  var posPrinter := TACBrPosPrinter.Create(nil);
  try
    try
      var iniPos := TConfsIni.GetPosPrinter(paramValues.Values['confName']);
      var iniImp := TConfsIni.GetNFCeImpressao(paramValues.Values['nfceConfName']);

      if not iniImp.AbrirGaveta then
        Exit;

      posPrinter.Modelo := TACBrPosPrinterModelo(iniPos.Modelo);
      posPrinter.Porta  := iniPos.Porta;

      desativarPosPrinter(posPrinter);

      posPrinter.Porta  := iniPos.Porta;

      if not posPrinter.Ativo then
        posPrinter.Ativar;

      if iniImp.AbrirGaveta then
        if iniImp.AbrirGavetaEspecifica > 0 then
          posPrinter.AbrirGaveta(iniImp.AbrirGavetaEspecifica)
        else
          posPrinter.AbrirGaveta();

      desativarPosPrinter(posPrinter);

      Result := 1;

    except on E: Exception do
      begin
        FLastError := e.Message;
      end;
    end;

  finally
    paramValues.Free;
    posPrinter.Free;
  end;
end;

function THelperPosPrinter.PrintNFCe(XMLAut, XMLCanc, confName, nfceConfName, dadosAdicionais: string): Integer;
begin
  Result := 0;
  {
  var paramValues := NewStringList(dadosAdicionais, ';');
  var NFCeCanc  := paramValues.Values['situacao_nfce'].Equals('Cancelada');
  var ViaCan    := paramValues.Values['viacanc'].Equals('true') and NFCeCanc;
  var Resumido  := paramValues.Values['res'].Equals('true');
  var ViaCon    := paramValues.Values['viacon'].Equals('true');
  var ViaEst    := paramValues.Values['viaest'].Equals('true');

  var NFCeCanc  := paramValues.Values['situacao_nfce'].Equals('Cancelada');
  var ViaCan    := paramValues.Values['viacanc'].Equals('true') and NFCeCanc;
  var Resumido  := paramValues.Values['res'].Equals('true');
  var ViaCon    := paramValues.Values['viacon'].Equals('true');
  var ViaEst    := paramValues.Values['viaest'].Equals('true');
  }

  var NFCeCanc  := (Pos('|nfcecanc|', dadosAdicionais) > 0);
  var ViaCan    := (Pos('|viacanc|' , dadosAdicionais) > 0) and NFCeCanc;
  var FormatoA4 := (Pos('|a4|'      , dadosAdicionais) > 0);
  var Resumido  := (Pos('|res|'     , dadosAdicionais) > 0);
  var ViaCon    := (Pos('|viacon|' , dadosAdicionais) > 0);
  var ViaEst    := (Pos('|viaest|' , dadosAdicionais) > 0);

  if not ViaEst then
    ViaCon := True;

  var Em2Vias := ViaCon and ViaEst and (not ViaCan);

  var iniPos      := TConfsIni.GetPosPrinter(confName);
  var iniImp      := TConfsIni.GetNFCeImpressao(nfceConfName);
  var danfeESCPOS := TACBrNFeDANFeESCPOS.Create(nil);
  var nfceACBR    := TACBrNFe.Create(nil);
  var posPrinter  := TACBrPosPrinter.Create(nil);
  try
    try
      posPrinter.Modelo                     := TACBrPosPrinterModelo(iniPos.Modelo);
      posPrinter.Porta                      := iniPos.Porta;
      posPrinter.ColunasFonteNormal         := iniPos.Colunas;
      posPrinter.EspacoEntreLinhas          := iniPos.EspacoEntreLinhas;
      posPrinter.LinhasBuffer               := iniPos.LinhasBuffer;
      posPrinter.ControlePorta              := iniPos.ControlePorta;
      posPrinter.TraduzirTags               := iniPos.TraduzirTags;
      posPrinter.IgnorarTags                := iniPos.IgnorarTags;
      posPrinter.ArqLOG                     := iniPos.ArqLOG;
      posPrinter.PaginaDeCodigo             := TACBrPosPaginaCodigo(iniPos.PaginaDeCodigo);
      posPrinter.ConfigBarras.LarguraLinha  := iniPos.Barras_LarguraLinha;
      posPrinter.ConfigBarras.Altura        := iniPos.Barras_Altura;
      posPrinter.ConfigBarras.MostrarCodigo := iniPos.Barras_MostrarCodigo;
      posPrinter.ConfigQRCode.Tipo          := iniPos.QRCode_Tipo;
      posPrinter.ConfigQRCode.LarguraModulo := iniPos.QRCode_LarguraModulo;
      posPrinter.ConfigQRCode.ErrorLevel    := iniPos.QRCode_ErrorLevel;
      posPrinter.ConfigLogo.KeyCode1        := iniPos.Logo_KeyCode1;
      posPrinter.ConfigLogo.KeyCode2        := iniPos.Logo_KeyCode2;
      posPrinter.ConfigLogo.FatorX          := iniPos.Logo_FatorX;
      posPrinter.ConfigLogo.FatorY          := iniPos.Logo_FatorY;
      posPrinter.Device.ParamsString        := iniPos.Device_ParamsString;
      posPrinter.CortaPapel                 := False;//iniImp.CortarPapelAposImpressao;
      posPrinter.LinhasEntreCupons          := iniImp.QtdeLinhasAvancoPapelAposNFC;


      danfeESCPOS.PosPrinter           := posPrinter;
      danfeESCPOS.ImprimeLogoLateral   := iniImp.ImprimeLogoLateral;
      danfeESCPOS.Site                 := '';
      nfceACBR.DANFE := danfeESCPOS;

      nfceACBR.DANFE.Sistema               := 'Hw NFC-e';
      nfceACBR.DANFE.TipoDANFE             := tiNFCe;
      nfceACBR.DANFE.Cancelada             := NFCeCanc;
      //nfceACBR.DANFE.ImprimirItens         := not Resumido;
      nfceACBR.DANFE.ImprimeNomeFantasia   := iniImp.ImprimeNomeFantasia;
      nfceACBR.DANFE.ImprimeInfContr       := iniImp.ImprimeInfContr;
      TACBrNFeDANFCEClass(nfceACBR.DANFE).ImprimeQRCodeLateral  := iniImp.QRCodeLateral;
      TACBrNFeDANFCEClass(nfceACBR.DANFE).ViaConsumidor         := ViaCon;
      TACBrNFeDANFCEClass(nfceACBR.DANFE).ImprimeEmUmaLinha     := iniImp.ImprimeEmUmaLinha;
      TACBrNFeDANFCEClass(nfceACBR.DANFE).ImprimeDescAcrescItem := iniImp.ImprimeDescAcrescItem;
      TACBrNFeDANFCEClass(nfceACBR.DANFE).ImprimeTributos       := TpcnTributos(IfThen(iniImp.ImprimirTributos, 0, IfThen(iniImp.TributosSeparadamente, 1, 2)));
      //nfceACBR.DANFE.TributosSeparadamente := iniImp.TributosSeparadamente;

      nfceACBR.EventoNFe.Evento.Clear;
      nfceACBR.NotasFiscais.Clear;
      nfceACBR.NotasFiscais.LoadFromString(XMLAut);
      if NFCeCanc then
        nfceACBR.EventoNFe.LerXMLFromString(XMLCanc);

      desativarPosPrinter(posPrinter);

      posPrinter.Porta := iniPos.Porta;

      if not posPrinter.Ativo then
        posPrinter.Ativar;
      if ViaCan then
        danfeESCPOS.ImprimirDANFECancelado()
      else
      begin
        if Resumido then
          nfceACBR.NotasFiscais.ImprimirResumido
        else
          nfceACBR.NotasFiscais.Imprimir;

        if Em2Vias then
        begin

          if iniImp.CortarPapelAposImpressao then
            posPrinter.CortarPapel(True);

          TACBrNFeDANFCEClass(nfceACBR.DANFE).ViaConsumidor := False;
          if Resumido then
            nfceACBR.NotasFiscais.ImprimirResumido
          else
            nfceACBR.NotasFiscais.Imprimir;

          if iniImp.CortarPapelAposImpressao then
            posPrinter.CortarPapel(True);
        end
        else if iniImp.CortarPapelAposImpressao then
          posPrinter.CortarPapel(True);
      end;

      if iniImp.AbrirGaveta then
        if iniImp.AbrirGavetaEspecifica > 0 then
          posPrinter.AbrirGaveta(iniImp.AbrirGavetaEspecifica)
        else
          posPrinter.AbrirGaveta();

      desativarPosPrinter(posPrinter);

      Result := 1;

    except on E: Exception do
      begin
        FLastError := e.Message;
      end;
    end;

  finally
    //paramValues.Free;
    posPrinter.Free;
    danfeESCPOS.Free;
    nfceACBR.free();
  end;
end;

function THelperPosPrinter.SaveConfFile(confName,
  confFile: string): Boolean;
begin
  if confFile.Trim.IsEmpty then
    Exit(True);

  var fileText := TStringList.Create;
  try
    fileText.Text := confFile;
    fileText.SaveToFile(ExtractFilePath(ParamStr(0)) + confName + '.ini');
    Result := True;
  except on E: Exception do
    begin
      Result := False;
      LastError := Format('Erro ao salvar arquivo de "%s"%s%s', [confName, sLineBreak, e.Message]);
    end;
  end;
end;

end.

