{ Projeto     : TEFDelphi
  Unit        : unFuncoesTEF
  Versão      : 4.0.0
  Função      : Agrega todas as funções do TEF
  Autor       : Kohl em 11/07/2003
  Alterações  : Kohl em 17/10/2003 - Inclusão do Tecban
  Alterações  : Herbert em 20/02/2004 - Adaptação para sistema Fiscal.exe -
  por Herbert da Silva Costa

}
unit unFuncoesTEFDiscado;

interface

uses
  Windows, SysUtils, Controls, Forms, FileCtrl, Dialogs, unMensagem, unImpressao, unMensagGerais,
  unMensagGc, udadosINI, uImpressoraF, utranstef, unFuncoesTEF;

type
  // ---< Registro TEFParam >---
  regTEFParam = record
    NSU: integer;
  end;
  TTEFDiscado = class (TTEF)
  private

    // ---< Procedures usadas internamente >---
    procedure TEFVerificaArquivosPendentes; override;
    procedure TEFVerificaArquivosPendentesVND; override;
    procedure TEFVerificaTEFTmp(sExibeErro: string); override;
    procedure TEFVerificaTEFParam; override;
    procedure TEFProximoNSU; override;
    procedure TEFCriaArquivoREQIntPos001; override;
    procedure TEFVerificaIntPosSts(sOperacao: string; iNSU: integer); override;
    procedure TEFVerificaIntPos001(sOperacao: string; iNSU: integer); override;
    procedure TEFGravaOperacao(sOperacao: string); override;
    procedure TEFImprimeTransacao; override;
    procedure TEFMensagemC(sLinha4: string); override;
    procedure TEFMensagemG(sLinha4: string); override;
    procedure TEFMensagem(sLinha1, sLinha2, sLinha3, sLinha4: string); override;

    // ---< Procedures usadas pelo sistema de automação >---
    procedure TEFLimpaVariaveis; override;
    procedure TEFConfirmaOperacao; override;
    procedure TEFNaoConfirmaOperacao; override;
    procedure TEFVerificaOperacaoPendente; override;
    procedure TEFVerificaGerenciadorAtivo; override;
    procedure TEFModoAdministrativo; override;
    procedure TEFPedidoAutorizacaoCartao; override;
    procedure TEFPedidoAutorizacaoCheque; override;
    procedure TEFVendaCartao; override;
    procedure TEFVendaCheque; override;
    procedure TEFCancelaTransacao; override;
    procedure TEFFechaOperacao; override;

    //---------- < Procedure criada na 2006 > -----------------
    procedure VerificaTefImp; override;
    procedure setVoltarParaPrimeiroArquivo(Value: boolean); override;
    procedure Mensagem(mensagem: string); override;
    procedure limpaMensagem; override;

  public
    constructor create;
    function forcaFocoNoSistema(hwnd: THandle): Boolean; override;
    procedure VerificaArquivosPendentes; override;
    function venda(tipoFinalizador, ndocVinculado, Moeda: Integer; verificaCredito,
      atribfinalizador: string; valorTotal: Double): Boolean; override;
    function getTefValorTotal: string; override;
    function getTefNTransacao: string; override;
    function getTefNomeDARede: string; override;
    function getTefDataTransacao: string; override;
    function getTefHoraTransacao: string; override;
    function getQtdeCartao:integer; override;
    function ImprimeTef(impressora: TImpressoraF; gerencial: boolean; pathArquivo: string): boolean; override;
    function ConfirmacaoReimpressao(impressora: TImpressoraF; gerencial: boolean): boolean; override;
    function reimprimeDocVinculadoComoGerencial: boolean; override;
    function operacaoAdministrativo(impressora: TImpressoraF; tecBan: boolean): boolean; override;
    //    function operacaoCancelamentoTransacao(impressora: TImpressoraF; tecBan,a: boolean;
    //      nomeRede, nsuTransacao, data, hora: string; valorTotal: Real): boolean;
    function operacaoCancelamentoTransacao(impressora: TImpressoraF): boolean; override;
    function finalizaOperacao(impressora: TImpressoraF): boolean; override;
    function cancelaOperacoesAnteriores(impressora: TImpressoraF): boolean; override;
    function naoConfirmaUltimaOperacao: boolean; override;
    procedure verificaOperacaoPendente(impressora: TImpressoraF); override;
    function verificaOperacaoPendenteEntrada(impressora: TImpressoraF):boolean; override;

    procedure fechaOperacao; override;
    function cancela_ant(impressora: TImpressoraF; pathArquivo: string): boolean; override;
    function gerenciamentoImpressaoTEF(impressora: TImpressoraF; gerencial: boolean; pathArquivo:
      string): boolean; override;
    procedure setContadorImpressao(valor: Integer); override;
    function voltarParaPrimeiroArquivo: boolean; override;
    procedure limpaVariaveis; override;
    procedure limpaVariaveisNovoCartao; override;
    procedure limpaVariaveisNovoCartao2; override;

    procedure cancelaBKP; override;
    procedure MensagemFiscal(mensagem: string); override;
    function existeTransacaotransTef: boolean; override;
    function getTEFValorTransacao: Currency; override;

  end;

implementation

uses
  uFileList, StdCtrls, DB, uDtmAtivo, UCancTransTef, Mask;

function BlockInput(block: boolean): DWORD; stdcall; external 'user32.DLL';

var
  // ---< Arquivo TEFParam >---
  TEFParam: file of regTEFParam;
  Param: regTEFParam;
  NomeParam: string;

  // ---< Retorna os caracteres a direita a partir da posição iPos >---

function RightFromPos(sString: string; iPos: integer): string;
begin
  result := Trim(Copy(sString, iPos, (Length(sString) - iPos + 1)));
end; {RightFromPos}

// ---< Remove as aspas iniciais e finais da string >---

function RemoveAspas(sString: string): string;
begin
  Result := Trim(sString);
  if IsDelimiter('"', Result, 1) then
    Delete(Result, 1, 1);
  if IsDelimiter('"', Result, Length(Result)) then
    Delete(Result, Length(Result), 1);
end; {RemoveAspas}

// ---< Exibe uma mensagem por iTempo segundos sem intervenção do usuário >---

procedure TTEFDiscado.TEFMensagem(sLinha1, sLinha2, sLinha3, sLinha4: string);
begin
  Application.CreateForm(TfrmMensagem, frmMensagem);
  frmMensagem.lblLinha1.Caption := sLinha1;
  frmMensagem.lblLinha2.Caption := sLinha2;
  frmMensagem.lblLinha3.Caption := sLinha3;
  frmMensagem.lblLinha4.Caption := sLinha4;
  frmMensagem.Refresh;
  frmMensagem.Showmodal;
  //  Sleep(iTEFTempoMensagem*1000);
  //  fMensagem.Free;
end; {TEFMensagem}

// ---< Verifica se existe algum arquivo temporário indevidamente >---

procedure TTEFDiscado.TEFVerificaArquivosPendentes;
var
  aArquivo: TextFile;
  iimp: integer;
begin

  sTEFRetorno := '0';

  try
    if FileExists(sTEFPath + 'REQ\IntPos.Tmp') then
      DeleteFile(sTEFPath + 'REQ\IntPos.Tmp');

    if FileExists(sTEFPath + 'REQ\IntPos.001') then
      DeleteFile(sTEFPath + 'REQ\IntPos.001');

    if FileExists(sTEFPath + 'RESP\IntPos.Sts') then
      DeleteFile(sTEFPath + 'RESP\IntPos.Sts');

    //    if FileExists(sTEFPath + 'RESP\IntPos.001') then
    //      DeleteFile(sTEFPath + 'RESP\IntPos.001');
    try
      Application.CreateForm(tfrmFileList, frmFileList);
      frmFileList.FileListBox1.Mask := '*.Imp';
      frmFileList.FileListBox1.Directory := sTEFKoneKPath;
      frmFileList.FileListBox1.Refresh;
      for iimp := 0 to frmFileList.FileListBox1.Items.Count - 1 do
        DeleteFile(sTEFKoneKPath + frmFileList.FileListBox1.Items.Strings[iimp]);

    finally
      frmFileList.Free;
      frmFileList := nil;
    end;
    if FileExists(sTEFKoneKPath + 'TEF.Imp') then
      DeleteFile(sTEFKoneKPath + 'TEF.Imp');

    if FileExists(sTEFKoneKPath + 'TEFParc.Txt') then
      DeleteFile(sTEFKoneKPath + 'TEFParc.Txt');

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {VerificaArquivosPendentes}

procedure TTEFDiscado.TEFVerificaArquivosPendentesVND;
var
  aArquivo: TextFile;
  iimp: integer;
begin

  sTEFRetorno := '0';

  try

    if FileExists(sTEFPath + 'RESP\IntPos.001') then
      sTEFRetorno := '0'
    else
      sTEFRetorno := '1';
  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {VerificaArquivosPendentes}

// ---< Limpa as variáveis do TEF >---

procedure TTEFDiscado.TEFLimpaVariaveis;
var
  I: Integer;
begin
  sTEFDoctoVinculado := '';
  sTEFValorTotal := '';
  sTEFMoeda := '';
  sTEFCMC7 := '';
  sTEFTipoDePessoa := '';
  sTEFDoctoPessoa := '';
  sTEFDataDoCheque := '';
  sTEFStatusTransac := '';
  sTEFNomeDaRede := '';
  sTEFTipoTransac := '';
  sTEFNSUTransacao := '';
  sTEFCodAutorizacao := '';
  sTEFNumeroLote := '';
  sTEFTsTransacaoH := '';
  sTEFTsTransacaoL := '';
  sTEFTipoParcela := '';
  sTEFQtdeParcelas := '0';
  sTEFDataTransacao := '';
  sTEFHoraTransacao := '';
  sTEFDataPreDatado := '';
  sTEFNumTransCanc := '';
  sTEFTsTransCanc := '';
  sTEFFinalizacao := '';
  sTEFMensOperador := '';
  sTEFMensCliente := '';
  sTEFAutenticacao := '';
  sTEFBanco := '';
  sTEFAgencia := '';
  sTEFAgenciaDC := '';
  sTEFCtaCorrente := '';
  sTEFCtaCorrenteDC := '';
  sTEFNumCheque := '';
  sTEFNumChequeDC := '';
  sTEFAdministradora := '';
  if iTEFTecban = 0 then
    sTEFPath := 'C:\TEF_DIAL\'
  else
    sTEFPath := 'C:\TEF_DISC\';
  vmens := '';
  msgOp := '';

end; {TEFLimpaVariaveis}

// ---< Verifica e abre arquivo TEF.tmp >---
// sExibeErro : 'S" = exibe mensagem, 'N' = Não exibe

procedure TTEFDiscado.TEFVerificaTEFTmp(sExibeErro: string);
var
  aIntPos001: TextFile;
  sNomeArquivo: string;
begin

  sTEFRetorno := '0';

  try
    sNomeArquivo := sTEFPath + 'RESP\IntPos.001';
    if FileExists(sNomeArquivo) then
    begin
      AssignFile(aIntPos001, sNomeArquivo);
      Reset(aIntPos001);
      if EOF(aIntPos001) then
        sTEFRetorno := '1';
      Close(aIntPos001);
    end
    else
      sTEFRetorno := '1';

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

  if (sTEFRetorno <> '0') and (sExibeErro = 'S') then
    ShowMessage('Não existe nenhuma operação pendente');
end;

function TTEFDiscado.venda(tipoFinalizador, ndocVinculado, Moeda: Integer;
  verificaCredito, atribfinalizador: string; valorTotal: Double): boolean;
var
  temp: string;
begin
  VerificaTefImp;
  TEFLimpaVariaveis;
  sTEFDoctoVinculado := inttostr(ndocVinculado);
  sTEFValorTotal := trim(format('%10.2f', [valortotal]));
  delete(sTEFValorTotal, pos(',', sTEFValorTotal), 1);
  sTEFMoeda := inttostr(moeda);
  consulta:=0;

  if ((tipoFinalizador = 3) or (tipoFinalizador = 4)) and (verificaCredito = 'S') then
  begin
    if vTransParaConfirmar then
      fechaOperacao;
    if tipoFinalizador = 3 then
      iTEFTecban := 1
    else
      iTEFTecban := 0;
    vDadosIni.vconsultaCheque := '0';
    TEFVendaCheque;
    vDadosIni.vconsultaCheque := '0';
    consulta :=1;
  end
  else
  begin
    if vTransParaConfirmar then
      fechaOperacao;
    if tipoFinalizador = 3 then
      iTEFTecban := 1
    else
      iTEFTecban := 0;
    vDadosIni.vconsultaCheque := '0';
    TEFVendaCartao;
  end;
  if ((iTEFTecban = 1) and (vmens = '1')) or ((iTEFTecban = 0) and (vmens = '1')and (tipoFinalizador = 4)) then
  begin
    if vmens = '1' then
    begin
      forcaFocoNoSistema(Application.Handle);
      TEFMensagemC(sTEFMensOperador);
      vmens := '0';
    end;
  end;

  if sTEFRetorno = '0' then
  begin
    result := True;
    inc(vQtdeCartao);
    vnometef[vqtdeCartao] := atribfinalizador;
    vvalorTef[vqtdeCartao] := strtofloat(trim(format('%10.2f', [getTEFValorTransacao])));
    sTEFDoctoVinculado := vDadosIni.StrZero(ndocVinculado, 6);
    //    fechaOperacao;
    forcaFocoNoSistema(Application.Handle);
    vTransParaConfirmar := true;
  end
  else
  begin
    forcaFocoNoSistema(Application.Handle);
    result := False;
  end;
end;

procedure TTEFDiscado.VerificaArquivosPendentes;
begin
  TEFVerificaArquivosPendentes;
end;

procedure TTEFDiscado.verificaOperacaoPendente(impressora: TImpressoraF);
var
  imp: TImpressoraF;
begin
  vmens := '';
  sTEFMensOperador := '';
  if vDadosIni.vtefdial = 'S' then
  begin
    iTEFTecban := 0;
    sTEFPath := 'C:\TEF_DIAL\';
    TEFVerificaOperacaoPendente;
  end;
  // Verifica Tef_Disc
  if vDadosIni.vtefdisc = 'S' then
  begin
    iTEFTecban := 1;
    sTEFPath := 'C:\TEF_DISC\';
    TEFVerificaOperacaoPendente;
    iTEFTecban := 0;
    sTEFPath := 'C:\TEF_DIAL\';
  end;
  obTransTef.getTodos;
  while not obTransTef.dataset.IsEmpty do
  begin
    Application.MessageBox(pchar('Existem Transações TEF Pendentes para cancelamento'),
      'Informação', MB_ICONINFORMATION + mb_OK);
    sTEFValorTotal := obTransTef.dataSet.FieldByName('Valor').AsString;
    sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NsuTrans').AsString;
    sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').AsString;
    sTEFHoraTransacao := obTransTef.dataSet.FieldByName('Hora').AsString;
    sTEFNomeDaRede := obTransTef.dataSet.FieldByName('RedeTrans').AsString;
    imp := TImpressoraF(impressora);
    if Cancela_Ant(imp, sTEFKoneKPath + 'TEF.Imp') then
    begin
      obTransTef.delete;
      obTransTef.Apply;
      obTransTef.CommitaTransacao;
    end
    else
    begin
      if vmens = '1' then
      begin
        TEFMensagemC(sTEFMensOperador);
        vmens := '0';
      end;
    end;
  end;
  if vmens = '1' then
  begin
    if FileExists(sTEFKoneKPath + 'IntPos.001') then
    begin
      try
        DeleteFile(sTEFKoneKPath + 'IntPos.001');
      except
      end;
    end;
    vmens := '0';
    Application.MessageBox(pchar(sTEFMensOperador), 'Atenção', MB_OK + MB_ICONINFORMATION);
  end;
  impressora.vErroTEF := 'S';
  impressora.FechaComprovanteNaoFiscalVinculadoTEF;
  impressora.vErroTEF := 'S';
  impressora.FechaRelatorioGerencialTEF;
  impressora.vErroTEF := '';
  limpaVariaveisNovoCartao;
end;

function TTEFDiscado.verificaOperacaoPendenteEntrada(
  impressora: TImpressoraF): boolean;
begin
  vmens := '';
  Result := false;
  sTEFMensOperador := '';
  if vDadosIni.vtefdial = 'S' then
  begin
    iTEFTecban := 0;
    sTEFPath := 'C:\TEF_DIAL\';
    TEFVerificaOperacaoPendente;
  end;
  // Verifica Tef_Disc
  if vDadosIni.vtefdisc = 'S' then
  begin
    iTEFTecban := 1;
    sTEFPath := 'C:\TEF_DISC\';
    TEFVerificaOperacaoPendente;
    iTEFTecban := 0;
    sTEFPath := 'C:\TEF_DIAL\';
  end;
  obTransTef.getTodos;
  while not obTransTef.dataset.IsEmpty do
  begin
    Result := true;
    impressora.vErroTEF := '';
    limpaVariaveisNovoCartao;
    exit;
  end;
  if vmens = '1' then
  begin
    if FileExists(sTEFKoneKPath + 'IntPos.001') then
    begin
      try
        DeleteFile(sTEFKoneKPath + 'IntPos.001');
      except
      end;
    end;
    vmens := '0';
    Application.MessageBox(pchar(sTEFMensOperador), 'Atenção', MB_OK + MB_ICONINFORMATION);
  end;
  impressora.vErroTEF := 'S';
  impressora.FechaComprovanteNaoFiscalVinculadoTEF;
  impressora.vErroTEF := 'S';
  impressora.FechaRelatorioGerencialTEF;
  impressora.vErroTEF := '';
  limpaVariaveisNovoCartao;
end;

{TEFVerificaTEFTmp}

// ---< Verifica se existe o arquivo TEFParam e cria se necessário >---

procedure TTEFDiscado.TEFVerificaTEFParam;
begin
  sTEFRetorno := '0';
  NomeParam := sTEFKoneKPath + 'TEFDelphi.dat';
  try
    Assign(TEFParam, NomeParam);
    // ---> Se arquivo não existe, cria
    if not FileExists(NomeParam) then
    begin
      Rewrite(TEFParam);
      Param.NSU := 0;
      Write(TEFParam, Param);
      Close(TEFParam);
    end;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {VerificaTEFParam}

// ---< Retorna o próximo NSU para arquivos de mensagens >---

procedure TTEFDiscado.TEFProximoNSU;
begin

  NomeParam := sTEFKoneKPath + 'TEFDelphi.dat';

  try
    TEFVerificaTEFParam;
    if sTEFRetorno = '0' then
    begin
      Assign(TEFParam, NomeParam);
      Reset(TEFParam);
      Read(TEFParam, Param);
      Inc(Param.NSU);
      Seek(TEFParam, 0);
      Write(TEFParam, Param);
      Close(TEFParam);
      iTEFProximoNSU := Param.NSU;
    end
    else
      sTEFRetorno := '1';
  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end;

procedure TTEFDiscado.VerificaTefImp;
begin
  if FileExists(sTEFKoneKPath + 'Tef.IMP') then
    CopyFile(Pchar(sTEFKoneKPath + 'TEF.Imp'), Pchar(sTEFKoneKPath + 'ANT' +
      vDadosIni.StrZeroDec(vQtdeCartao, 3, 0) + '.IMP'), true);

  if (sTEFDataTransacao = '') or (sTEFNSUTransacao = '') or (vQtdeCartao = 0) then
      Exit;

  if StrToInt64(trim(sTEFNSUTransacao)) = 0 then
     Exit;

  obTransTef.getTodos;
  if not obTransTef.existeTransacao(sTEFDataTransacao, sTEFNSUTransacao) then
  begin
    if sTEFNSUTransacao <> '' then
    begin
      obTransTef.Insert;
      obTransTef.dataSet.FieldByName('DataTrans').value := sTEFDataTransacao;
      obTransTef.dataSet.FieldByName('Hora').value := sTEFHoraTransacao;
      obTransTef.dataSet.FieldByName('NsuTrans').value := sTEFNSUTransacao;
      obTransTef.dataSet.FieldByName('Valor').value := sTEFValorTotal;
      obTransTef.dataSet.FieldByName('RedeTrans').value := sTEFNomeDaRede;
      obTransTef.Post;
      obTransTef.Apply;
      obTransTef.CommitaTransacao;
    end;
    //    if sTEFRetorno = '0' then
    //      TEFFechaOperacao;
  end;
end;

function TTEFDiscado.voltarParaPrimeiroArquivo: boolean;
begin
  Result := vVoltaImpPrimeiroArq;
end;

{TEFProximoNSU}

// ---< Cria o arquivo IntPos.tmp para receber comandos >---

procedure TTEFDiscado.TEFCriaArquivoREQIntPos001;
var
  IntPosTmp: TextFile;
begin

  sTEFRetorno := '0';

  try
    AssignFile(IntPosTmp, sTEFPath + 'REQ\IntPos.tmp');
    Rewrite(IntPosTmp);
    CloseFile(IntPosTmp);

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFCriaArquivoREQIntPos001}

// ---< Verifica se alguma operação ficou pendente (queda do sistema) >---

procedure TTEFDiscado.TEFVerificaOperacaoPendente;
var
  aArquivo: TextFile;
begin

  sTEFRetorno := '0';

  try
    TEFVerificaArquivosPendentes;
    if sTEFRetorno = '0' then
    begin
      if not FileExists(sTEFPath + 'RESP\IntPos.001') then
      begin
        if FileExists(sTEFKoneKPath + 'IntPos.001') then
        begin
          try
            CopyFile(Pchar(sTEFKoneKPath + 'IntPos.001'), pchar(sTEFPath + 'RESP\IntPos.001'),
              true);
            DeleteFile(sTEFKoneKPath + 'IntPos.001');
          except
          end;
        end;
      end;
      TEFVerificaTEFTmp('N');
      if sTEFRetorno = '0' then
        TEFNaoConfirmaOperacao;
    end;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFVerificaOperacaoPendente}

// ---< Verifica a integridade do arquivo resposta IntPos.Sts >---

procedure TTEFDiscado.TEFVerificaIntPosSts(sOperacao: string; iNSU: integer);
var
  IntPosSts: TextFile;
  sNomeArquivo, sLinha: string;
  iFim, iTempo: integer;
  iInicio: Ttime;
begin

  sTEFRetorno := '0';

  try
    Screen.Cursor := crHourGlass;
    sNomeArquivo := sTEFPath + 'RESP\IntPos.Sts';
    AssignFile(IntPosSts, sNomeArquivo);
    iInicio := Time;
    //    if not fcupom.enabled then
    //     messagedlg('nao',mtinformation,[mbOK],0);
    repeat
      {
            with frmPrincipalFiscal do
            begin
              if (Width <> 808) or (Height <> 608) then
              begin
                Top := 0;
                left := 0;
                Width := 808;
                Height := 608;
              end;
            end;
      }
      Application.ProcessMessages;
    until (FileExists(sNomeArquivo) or ((time - iInicio) > strtotime('00:00:14')));
    if FileExists(sNomeArquivo) then
    begin
      try
        //jp        Sleep(StrToInt(vslepResp));
        Sleep(2000);
      except
      end;
      Reset(IntPosSts);
      if not EOF(IntPosSts) then
      begin
        ReadLn(IntPosSts, sLinha);
        if Trim(sLinha) <> '000-000 = ' + sOperacao then
          sTEFRetorno := '1';
        ReadLn(IntPosSts, sLinha);
        if Copy(Trim(sLinha), 1, 7) = '001-000' then
          if StrToInt(RightFromPos(sLinha, 11)) <> iNSU then
            sTEFRetorno := '1';
      end
      else
        sTEFRetorno := '1';
      CloseFile(IntPosSts);
      DeleteFile(sNomeArquivo);
    end
    else
      sTEFRetorno := '1';

    Screen.Cursor := crDefault;
    {    if sTEFRetorno <> '0' then
        begin
          ShowMessage('Confirmação Enviado Sem Respota Retentar');
          iInicio := Time;
          repeat
           with Fcupom do
           begin
            if (Width <> 808) or (Height <> 608) then
            begin
             Top:=0;
             left:=0;
             Width:=808;
             Height:=608;
            end;
           end;
           Application.ProcessMessages;
          until (FileExists(sNomeArquivo) or ((time-iInicio) > strtotime('00:00:07')));
          if FileExists(sNomeArquivo) then
          begin
            sTEFRetorno := '0';
            Reset(IntPosSts);
            if not EOF(IntPosSts) then
              begin
                ReadLn(IntPosSts, sLinha);
                if Trim(sLinha) <> '000-000 = ' + sOperacao then
                  sTEFRetorno := '1';
                ReadLn(IntPosSts, sLinha);
                if Copy(Trim(sLinha),1,7) = '001-000'then
                  if StrToInt(RightFromPos(sLinha,11)) <> iNSU then
                    sTEFRetorno := '1';
              end
            else
              sTEFRetorno := '1';
            CloseFile(IntPosSts);
            DeleteFile(sNomeArquivo);
          end;
        end;}
  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFVerificaIntPosSts}

// ---< Verifica a integridade do arquivo retorno IntPos.001 >---

procedure TTEFDiscado.TEFVerificaIntPos001(sOperacao: string; iNSU: integer);
var
  bRet: boolean;
  IntPos001, TEFParc: TextFile;
  //  sNomeArquivo, sLinha, sDoctoRet,sValorRet, sLinhas, sParcela : string;
  //  sRedeRet, sVencParcela, sValorParcela, sNSUParcela : string;
  sNomeArquivo, sLinha, sLinhas, sParcela: string;
  sVencParcela, sValorParcela, sNSUParcela: string;
  vflgnsu, iParcelas, i: integer;
begin
  sTEFRetorno := '0';

  try
    Screen.Cursor := crHourGlass;
    sDoctoRet := '';
    sValorRet := '';
    sRedeRet := '';
    sNomeArquivo := sTEFPath + 'RESP\IntPos.001';
    while true do
    begin
      repeat
        {     with Fcupom do
             begin
              if (Width <> 808) or (Height <> 608) then
              begin
               Top:=0;
               left:=0;
               Width:=808;
               Height:=608;
              end;
             end;}
        Application.ProcessMessages;
      until FileExists(sNomeArquivo);
      AssignFile(IntPos001, sNomeArquivo);
      if iTEFTecban <> 1 then
      begin
        try
          CopyFile(Pchar(sNomeArquivo), Pchar(sTEFKoneKPath + 'IntPos.001'), true);
        except
        end;
      end;
      try
        //jp        Sleep(StrToInt(vslepResp));
        Sleep(2000);
      except
      end;
      Reset(IntPos001);
      ReadLn(IntPos001, sLinha);
      //     if Trim(sLinha) <> '000-000 = ' + sOperacao  then
      //     begin
      //       CloseFile(IntPos001);
      //       DeleteFile(sNomeArquivo);
      //     end;
      ReadLn(IntPos001, sLinha);
      if Copy(Trim(sLinha), 1, 7) = '001-000' then
      begin
        if StrToInt(RightFromPos(sLinha, 11)) <> iNSU then
        begin
          CloseFile(IntPos001);
          DeleteFile(sNomeArquivo);
        end
        else
          break;
      end;
    end;

    if not EOF(IntPos001) then
    begin
      //        ReadLn(IntPos001, sLinha);
      //        if Trim(sLinha) <> '000-000 = ' + sOperacao then
      //          sTEFRetorno := '1';
      //        ReadLn(IntPos001, sLinha);
      //        if Copy(Trim(sLinha),1,7) = '001-000' then
      //          if StrToInt(RightFromPos(sLinha,11)) <> iNSU then
      //            sTEFRetorno := '1';
      if sTEFRetorno = '0' then
        repeat
          ReadLn(IntPos001, sLinha);
          if Copy(Trim(sLinha), 1, 7) = '002-000' then
            sTEFDoctoVinculado := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '003-000' then
            sTEFValorTotal := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '004-000' then
            sTEFMoeda := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '005-000' then
            sTEFCMC7 := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '006-000' then
            sTEFTipoDePessoa := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '007-000' then
            sTEFDoctoPessoa := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '008-000' then
            sTEFDataDoCheque := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '009-000' then
            sTEFStatusTransac := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '010-000' then
            sTEFNomeDaRede := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '011-000' then
            sTEFTipoTransac := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '012-000' then
            sTEFNSUTransacao := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '013-000' then
            sTEFCodAutorizacao := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '014-000' then
            sTEFNumeroLote := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '015-000' then
            sTEFTsTransacaoH := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '016-000' then
            sTEFTsTransacaoL := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '017-000' then
            sTEFTipoParcela := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '018-000' then
            sTEFQtdeParcelas := RightFromPos(sLinha, 11);

          // ---> Se existe parcelamento
          {if Copy(Trim(sLinha), 1, 7) = '018-000' then Joao Pedro - 11/08/2009 Homologação TecBan
          begin
            iParcelas := StrToInt(RightFromPos(sLinha, 11));
            if iParcelas = 1 then
            else
            begin
            AssignFile(TEFParc, sTEFKoneKPath + 'TEFParc.txt');
            Rewrite(TEFParc);
            for i := 1 to iParcelas do
            begin
              if True then

              if i < 10 then
                sParcela := '0' + IntToStr(i)
              else
                sParcela := IntToStr(i);
              sVencParcela := '';
              sValorParcela := '';
              sNSUParcela := '';
              ReadLn(IntPos001, sLinha);
              if Copy(Trim(sLinha), 1, 3) = '019' then
                sVencParcela := RightFromPos(sLinha, 11);
              ReadLn(IntPos001, sLinha);
              if Copy(Trim(sLinha), 1, 3) = '020' then
                sValorParcela := RightFromPos(sLinha, 11);
              ReadLn(IntPos001, sLinha);
              if Copy(Trim(sLinha), 1, 3) = '021' then
                sNSUParcela := RightFromPos(sLinha, 11);
              while Length(sValorParcela) < 12 do
                sValorParcela := sValorParcela + ' ';
              while Length(sNSUParcela) < 12 do
                sNSUParcela := sNSUParcela + ' ';
              if (sParcela <> '') and
                (sVencParcela <> '') and
                (sValorParcela <> '') and
                (sNSUParcela <> '') then
                WriteLn(TEFParc, sParcela + sVencParcela + sValorParcela + sNSUParcela);
            end;
            Close(TEFParc);
            end;
          end;}

          if Copy(Trim(sLinha), 1, 7) = '022-000' then
            sTEFDataTransacao := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '023-000' then
            sTEFHoraTransacao := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '024-000' then
            sTEFDataPreDatado := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '025-000' then
            sTEFNumTransCanc := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '026-000' then
            sTEFTsTransCanc := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '027-000' then
            sTEFFinalizacao := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '028-000' then
            sLinhas := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '030-000' then
            sTEFMensOperador := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '031-000' then
            sTEFMensCliente := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '032-000' then
            sTEFAutenticacao := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '033-000' then
            sTEFBanco := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '034-000' then
            sTEFAgencia := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '035-000' then
            sTEFAgenciaDC := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '036-000' then
            sTEFCtaCorrente := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '037-000' then
            sTEFCtaCorrenteDC := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '038-000' then
            sTEFNumCheque := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '039-000' then
            sTEFNumChequeDC := RightFromPos(sLinha, 11);
          if Copy(Trim(sLinha), 1, 7) = '040-000' then
            sTEFAdministradora := RightFromPos(sLinha, 11);
          //            Application.ProcessMessages;
        until EOF(IntPos001);
    end
    else
      sTEFRetorno := '1';

    CloseFile(IntPos001);

    Screen.Cursor := crDefault;

    if Trim(sTEFMensOperador) <> '' then
    begin
      if sTEFDoctoVinculado <> '' then
        sDoctoRet := 'Docto No: ' + Trim(sTEFDoctoVinculado);
      if sTEFValorTotal <> '' then
        sValorRet := 'Valor: ' + format('%n', [(StrToInt(sTEFValorTotal) / 100)]);
      //FloatToStr(StrToInt(sTEFValorTotal)/100);
      if sTEFNomeDaRede <> '' then
        sRedeRet := 'Rede: ' + sTEFNomeDaRede;
      if sTEFStatusTransac <> '0' then
        sTEFMensOperador := sTEFMensOperador;
      //+ ' - Status ' + sTEFStatusTransac;
      if vDadosIni.vConsultaCheque = '0' then
      begin

        if (sTEFStatusTransac <> '0') or (sLinhas = '0') then
        begin
          //          messagedlg(sDoctoRet + #13#10 +
          //                      sValorRet + #13#10 +
          //                      sRedeRet + #13#10 +
          //                      sTEFMensOperador,mtinformation,[mbOK],0)
          if pos('CANCELAMENTO OK', sTEFMensOperador) > 0 then
          else
          begin
            vmens := '1';
            msgOp := sTEFMensOperador;
          end;
        end
        else
          TEFMensagemG(sTEFMensOperador);
      end
      else
      begin
        if (sTEFStatusTransac = '0') or (sTEFStatusTransac = 'P1') then
        begin
          TEFMensagemG(sTEFMensOperador);
        end
        else
        begin
          sTEFRetorno := '1';
          DeleteFile(sNomeArquivo);
        end;
      end;
      //          TEFMensagem(sRedeRet,sDoctoRet,sValorRet,sTEFMensOperador);
    end;
    if vDadosIni.vConsultaCheque = '0' then
    begin
      if sTEFStatusTransac <> '0' then
      begin
        sTEFRetorno := '1';
        DeleteFile(sNomeArquivo);
      end;
    end;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFVerificaIntPos001}

// ---< Grava a operação no arquivo IntPos.001 >---

procedure TTEFDiscado.TEFGravaOperacao(sOperacao: string);
var
  bRet: boolean;
  IntPosTmp, IntPos001: TextFile;
  sLinha: string;
  itx: integer;
begin
  sTEFRetorno := '0';

  try
    TEFCriaArquivoREQIntPos001;

    if sTEFRetorno = '0' then

    begin

      // ---< Verifica se existe operação pendente >---
      if (sOperacao = 'CNF') or (sOperacao = 'NCN') then
      begin
        TEFVerificaTEFTmp('S');
        if sTEFRetorno = '0' then
        begin
          //
          AssignFile(IntPos001, sTEFPath + 'RESP\IntPos.001');
          Reset(IntPos001);
          repeat
            ReadLn(IntPos001, sLinha);
            if Copy(Trim(sLinha), 1, 7) = '002-000' then
              sTEFDoctoVinculado := RightFromPos(sLinha, 11);
            if Copy(Trim(sLinha), 1, 7) = '010-000' then
              sTEFNomeDaRede := RightFromPos(sLinha, 11);
            if Copy(Trim(sLinha), 1, 7) = '012-000' then
              sTEFNSUTransacao := RightFromPos(sLinha, 11);
            if Copy(Trim(sLinha), 1, 7) = '027-000' then
              sTEFFinalizacao := RightFromPos(sLinha, 11);
            //                  Application.ProcessMessages;
          until EOF(IntPos001);

          Close(IntPos001);
          DeleteFile(sTEFPath + 'RESP\IntPos.001');
          if FileExists(sTEFKoneKPath + 'IntPos.001') then
          begin
            try
              DeleteFile(sTEFKoneKPath + 'IntPos.001');
            except
            end;
          end;
        end;
      end;

      AssignFile(IntPosTmp, sTEFPath + 'REQ\IntPos.tmp');
      Append(IntPosTmp);
      TEFProximoNSU();

      WriteLn(IntPosTmp, ('000-000 = ' + sOperacao));
      WriteLn(IntPosTmp, ('001-000 = ' + IntToStr(iTEFProximoNSU)));

      if (sOperacao = 'CHQ') or
        (sOperacao = 'CRT') or
        (sOperacao = 'CNC') or
        (sOperacao = 'CNF') or
        (sOperacao = 'NCN') then
        if Trim(sTEFDoctoVinculado) <> '' then
          WriteLn(IntPosTmp, ('002-000 = ' + sTEFDoctoVinculado));

      if (sOperacao = 'CHQ') or
        (sOperacao = 'CRT') or
        (sOperacao = 'CNC') then
        if Trim(sTEFValorTotal) <> '' then
          WriteLn(IntPosTmp, ('003-000 = ' + sTEFValorTotal));

      if (sOperacao = 'CRT') then
        if Trim(sTEFMoeda) <> '' then
          WriteLn(IntPosTmp, ('004-000 = ' + sTEFMoeda));

      if (sOperacao = 'CHQ') or
        (sOperacao = 'CNC') then
      begin
        if Trim(sTEFCMC7) <> '' then
          WriteLn(IntPosTmp, ('005-000 = ' + sTEFCMC7));
        if Trim(sTEFTipoDePessoa) <> '' then
          WriteLn(IntPosTmp, ('006-000 = ' + sTEFTipoDePessoa));
        if Trim(sTEFDoctoPessoa) <> '' then
          WriteLn(IntPosTmp, ('007-000 = ' + sTEFDoctoPessoa));
        if Trim(sTEFDataDoCheque) <> '' then
          WriteLn(IntPosTmp, ('008-000 = ' + sTEFDataDoCheque));
      end;

      if (sOperacao = 'CNC') or
        (sOperacao = 'CNF') or
        (sOperacao = 'NCN') then
      begin
        if Trim(sTEFNomeDaRede) <> '' then
          WriteLn(IntPosTmp, ('010-000 = ' + sTEFNomeDaRede));
        if Trim(sTEFNSUTransacao) <> '' then
          WriteLn(IntPosTmp, ('012-000 = ' + sTEFNSUTransacao));
      end;

      if (sOperacao = 'CNC') then
      begin
        if Trim(sTEFDataTransacao) <> '' then
          WriteLn(IntPosTmp, ('022-000 = ' + sTEFDataTransacao));
        if Trim(sTEFHoraTransacao) <> '' then
          WriteLn(IntPosTmp, ('023-000 = ' + sTEFHoraTransacao));
      end;

      if (sOperacao = 'CNF') or
        (sOperacao = 'NCN') then
        if Trim(sTEFFinalizacao) <> '' then
          WriteLn(IntPosTmp, ('027-000 = ' + sTEFFinalizacao));

      if (sOperacao = 'CHQ') or
        (sOperacao = 'CNC') then
      begin
        if Trim(sTEFBanco) <> '' then
          WriteLn(IntPosTmp, ('033-000 = ' + sTEFBanco));
        if Trim(sTEFAgencia) <> '' then
          WriteLn(IntPosTmp, ('034-000 = ' + sTEFAgencia));
        if Trim(sTEFAgenciaDC) <> '' then
          WriteLn(IntPosTmp, ('035-000 = ' + sTEFAgenciaDC));
        if Trim(sTEFCtaCorrente) <> '' then
          WriteLn(IntPosTmp, ('036-000 = ' + sTEFCtaCorrente));
        if Trim(sTEFCtaCorrenteDC) <> '' then
          WriteLn(IntPosTmp, ('037-000 = ' + sTEFCtaCorrenteDC));
        if Trim(sTEFNumCheque) <> '' then
          WriteLn(IntPosTmp, ('038-000 = ' + sTEFNumCheque));
        if Trim(sTEFNumChequeDC) <> '' then
          WriteLn(IntPosTmp, ('039-000 = ' + sTEFNumChequeDC));
      end;
//      if (sOperacao = 'CRT') then
//        WriteLn(IntPosTmp, '777-000 = TESTE REDECARD');
      WriteLn(IntPosTmp, '999-999 = 0');
      CloseFile(IntPosTmp);
      bRet := CopyFile(Pchar(sTEFPath + 'REQ\IntPos.tmp'), Pchar(sTEFPath + 'REQ\IntPos.001'),
        true);
      DeleteFile(sTEFPath + 'REQ\IntPos.tmp');

      // ---> Verifica se houve resposta do GP
      TEFVerificaIntPosSts(sOperacao, iTEFProximoNSU);

      // ---> Verifica arquivo de retorno do GP
      if (sTEFRetorno = '0') and
        ((sOperacao = 'ADM') or
        (sOperacao = 'CHQ') or
        (sOperacao = 'CRT') or
        (sOperacao = 'CNC')) then
        TEFVerificaIntPos001(sOperacao, iTEFProximoNSU);

      //        if FileExists(sTEFPath + 'REQ\IntPos.001') then
      //         messagedlg('existe o arquivo viado!!!!',mtinformation,[mbOK],0);

    end; // sTEFRetorno = '0'

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFGravaOperacao}

// ---< Imprime a transação >---

procedure TTEFDiscado.TEFImprimeTransacao;
var
  fImpressao: TfrmImpressao;
  iRet: integer;
begin

  sTEFRetorno := '0';

  try
    fImpressao := TfrmImpressao.Create(Application);
    fImpressao.Show;
    fImpressao.memEditor.Lines.LoadFromFile(sTEFKoneKPath + 'TEF.IMP');
    fImpressao.Refresh;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFImprimeTransacao}

// ---< Executa a confirmação da transação por meio de cartão >---

procedure TTEFDiscado.TEFConfirmaOperacao;
var
  IntPos001, TEFImp: TextFile;
  sLinha: string;
begin

  sTEFRetorno := '0';

  try
    TEFVerificaTEFTmp('S');

    if sTEFRetorno = '0' then
    begin
      AssignFile(IntPos001, sTEFPath + 'RESP\IntPos.001');
      Reset(IntPos001);
      AssignFile(TEFImp, sTEFKoneKPath + 'TEF.Imp');
      Rewrite(TEFImp);
      repeat
        ReadLn(IntPos001, sLinha);
        if Copy(Trim(sLinha), 1, 3) = '029' then
          WriteLn(TEFImp, RemoveAspas(RightFromPos(sLinha, 11)));
        //         Application.ProcessMessages;
      until EOF(IntPos001);
      Close(IntPos001);
      Close(TEFImp);
      reset(TEFImp);
      if EOF(TEFImp) then
      begin
        close(TEFImp);
        DeleteFile(sTEFKoneKPath + 'TEF.Imp');
        DeleteFile(sTEFPath + 'RESP\IntPos.001');
      end
      else
        Close(TEFImp);
      // ---> Envia o comprovante para o vídeo. Remover esta linha na versão final
      //        TEFImprimeTransacao;
    end;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFConfirmaOperacao}

// ---< Executa a não confirmação da transação por meio de cartão >---

procedure TTEFDiscado.TEFNaoConfirmaOperacao;
var
  IntPos001: TextFile;
  sLinha, sDocto, sValor, sRede, sTextoValor: string;
begin

  sTEFRetorno := '0';
  TEFVerificaGerenciadorAtivo;
  try
    TEFVerificaTEFTmp('S');

    if sTEFRetorno = '0' then
    begin
      AssignFile(IntPos001, sTEFPath + 'RESP\IntPos.001');
      Reset(IntPos001);
      repeat
        ReadLn(IntPos001, sLinha);
        if Copy(Trim(sLinha), 1, 7) = '012-000' then
          sDocto := RightFromPos(sLinha, 11);
        if Copy(Trim(sLinha), 1, 7) = '003-000' then
          sValor := RightFromPos(sLinha, 11);
        if Copy(Trim(sLinha), 1, 7) = '010-000' then
          sRede := RightFromPos(sLinha, 11);
        //          Application.ProcessMessages;
      until EOF(IntPos001);
      Close(IntPos001);
      // se for TecBan muda a Variável
      if sRede = 'TECBAN' then
      begin
        iTEFTecban := 1;
        sTEFPath := 'C:\TEF_DISC\';
      end
      else
      begin
        iTEFTecban := 0;
        sTEFPath := 'C:\TEF_DIAL\';
      end;
      //
      if sValor <> '' then
        sTextoValor := 'Valor:' + format('%n', [(StrToInt(sValor) / 100)])
        //FloatToStr(StrToInt(sValor)/100)
      else
        sTextoValor := '';
      //        if sRede = 'VISA' then
      //         vvisa:=sRede;
      //        else
      //         vvisa:='';
      TEFVerificaGerenciadorAtivo;
      TEFGravaOperacao('NCN');
      TEFMensagem('Cancelada a transação:', ('Doc No: ' + Trim(sDocto)), ('Rede: ' + Trim(sRede)),
        sTextoValor);
      //jp      Fcupom.timer2.enabled := false;
    end

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFNaoConfirmaOperacao}

// ---< Verifica se o Gerenciador Padrão está ativo >---

procedure TTEFDiscado.TEFVerificaGerenciadorAtivo;
var
  Ativo001: TextFile;
  iRet: integer;
  sLinha: string;
begin

  sTEFRetorno := '0';
  try

    Screen.Cursor := crHourGlass;

    if not DirectoryExists(sTEFKoneKPath) then
      CreateDir(sTEFKoneKPath);
    //    TEFVerificaArquivosPendentesVND;
    TEFGravaOperacao('ATV');
    {while sTEFRetorno <> '0' do
     begin
       ShowMessage('Gerenciador Padrão não está ativo. Favor ativá-lo manualmente');
       TEFGravaOperacao('ATV');
     end;}
    if sTEFRetorno <> '0' then
    begin
      try
        ShowMessage('Gerenciador Padrão não está ativo e será ativado automaticamente');
        if iTEFTecban = 0 then
          //          iRet := WinExec(pChar('C:\TEF_DIAL\TEF_DIAL.EXE'), SW_HIDE)    //10/06/2008
          iRet := WinExec(pChar('C:\TEF_DIAL\TEF_DIAL.EXE'), SW_HIDE)
        else
          iRet := WinExec(pChar('C:\TEF_DISC\TEF_DISC.EXE'), SW_HIDE);

        sTEFRetorno := '0';
        Sleep(6 * 1000);
        forcaFocoNoSistema(Application.Handle)
      except
        on E: Exception do
        begin
          ShowMessage('Gerenciador Padrão NÃO foi ativado...');
          sTEFRetorno := '1';
          Exit;
        end;
      end;
    end;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

  Screen.Cursor := crDefault;

end; {TEFVerificaGerenciadorAtivo}

// ---< Executa o Módulo Administrativo do GP >---

procedure TTEFDiscado.TEFModoAdministrativo;
begin

  sTEFRetorno := '0';

  try
    TEFVerificaGerenciadorAtivo;
    if sTEFRetorno = '0' then
      TEFGravaOperacao('ADM');
    if sTEFRetorno = '0' then
      TEFConfirmaOperacao;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFModoAdministrativo}

// ---< Executa pedido de autorização para transação por meio de cartão >---

procedure TTEFDiscado.TEFPedidoAutorizacaoCartao;
begin

  sTEFRetorno := '0';

  try
    TEFVerificaGerenciadorAtivo;
    if sTEFRetorno = '0' then
      TEFGravaOperacao('CRT');

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFPedidoAutorizacaoCartao}

// ---< Executa pedido de autorização para transação por meio de cheque >---

procedure TTEFDiscado.TEFPedidoAutorizacaoCheque;
begin

  sTEFRetorno := '0';

  try
    TEFVerificaGerenciadorAtivo;
    if sTEFRetorno = '0' then
      TEFGravaOperacao('CHQ');

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFPedidoAutorizacaoCheque}

// ---< Executa a venda por meio de cartão >---

procedure TTEFDiscado.TEFVendaCartao;
begin

  sTEFRetorno := '0';

  try
    TEFPedidoAutorizacaoCartao;
    if sTEFRetorno = '0' then
      TEFConfirmaOperacao;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFVendaCartao}

// ---< Executa a venda por meio de cheque >---

procedure TTEFDiscado.TEFVendaCheque;
begin

  sTEFRetorno := '0';

  try
    TEFPedidoAutorizacaoCheque;
    if sTEFRetorno = '0' then
      TEFConfirmaOperacao;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFVendaCheque}

// ---< Cancela Transação efetivada >---

procedure TTEFDiscado.cancelaBKP;
begin
  TEFMensagemC(msgOp);
end;

function TTEFDiscado.cancelaOperacoesAnteriores(impressora: TImpressoraF): boolean;
var
  imp: TImpressoraF;
  iimp: integer;
begin
  impressora.vErroTEF := 'S';
  impressora.FechaComprovanteNaoFiscalVinculadoTEF;
  impressora.vErroTEF := 'S';
  impressora.FechaRelatorioGerencialTEF;
  impressora.vErroTEF := '';
  if sTEFNomeDaRede = 'TECBAN' then
  begin
    iTEFTecban := 1;
    sTEFPath := 'C:\TEF_DISC\';
  end
  else
  begin
    iTEFTecban := 0;
    sTEFPath := 'C:\TEF_DIAL\';
  end;
  TEFNaoConfirmaOperacao;
  obTransTef.getTodos;
  while not obTransTef.Dataset.IsEmpty do
  begin
    Application.MessageBox(pchar('Existem Transações TEF Pendentes para cancelamento'),
      'Informação', MB_ICONINFORMATION + mb_OK);
    sTEFValorTotal := obTransTef.dataSet.FieldByName('Valor').AsString;
    sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NsuTrans').AsString;
    sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').AsString;
    sTEFHoraTransacao := obTransTef.dataSet.FieldByName('Hora').AsString;
    sTEFNomeDaRede := obTransTef.dataSet.FieldByName('RedeTrans').AsString;
    imp := TImpressoraF(impressora);
    impressora.vErroTEF := 'S';
    impressora.FechaComprovanteNaoFiscalVinculadoTEF;
    impressora.vErroTEF := 'S';
    impressora.FechaRelatorioGerencialTEF;
    impressora.vErroTEF := '';
    if Cancela_Ant(imp, sTEFKoneKPath + 'TEF.Imp') then
    begin
      obTransTef.delete;
      obTransTef.Apply;
      obTransTef.CommitaTransacao;
    end
    else
    begin
      if vmens = '1' then
      begin
        TEFMensagemC(sTEFMensOperador);
        vmens := '0';
      end;
    end;
  end;
  try
    Application.CreateForm(tfrmFileList, frmFileList);
    frmFileList.FileListBox1.Mask := '*.Imp';
    frmFileList.FileListBox1.Directory := sTEFKoneKPath;
    frmFileList.FileListBox1.Refresh;
    for iimp := 0 to frmFileList.FileListBox1.Items.Count - 1 do
      DeleteFile(sTEFKoneKPath + frmFileList.FileListBox1.Items.Strings[iimp]);
  finally
    frmFileList.Free;
    frmFileList := nil;
    limpaVariaveis;
  end;
  vQtdeCartao := 0;
end;

function TTEFDiscado.cancela_ant(impressora: TImpressoraF; pathArquivo: string): boolean;
var
  imp: TImpressoraF;
begin

  if sTEFNomeDaRede = 'TECBAN' then
  begin
    iTEFTecban := 1;
    sTEFPath := 'C:\TEF_DISC\';
  end
  else
  begin
    iTEFTecban := 0;
    sTEFPath := 'C:\TEF_DIAL\';
  end;

  TEFCancelaTransacao;
  if sTEFRetorno = '0' then
  begin
    if FileExists(pathArquivo) then
    begin
      TEFMensagemG('Imprimindo Comprovante...');
      forcaFocoNoSistema(Application.Handle);
      imp := TImpressoraF(impressora);
      setContadorImpressao(1);
      impressora.vErroTEF := 'S';
      impressora.FechaComprovanteNaoFiscalVinculadoTEF;
      impressora.vErroTEF := 'S';
      impressora.FechaRelatorioGerencialTEF;
      impressora.vErroTEF := '';
      while True do
      begin
        if gerenciamentoImpressaoTEF(imp, true, pathArquivo) then
          //ver forma de corrigir aqui quando reimprime
        begin //o liga a impressora e manda fechar ele retorna verdadeiro e fecha como se tivesse impresso
          sTEFRetorno := '0';
          if not voltarParaPrimeiroArquivo then
            Break;
        end
        else
        begin
          sTEFRetorno := '1';
          Break;
        end;
      end;
    end;
  end;
  if sTEFRetorno = '0' then
  begin
    TEFFechaOperacao;
    Cancela_Ant := true;
  end
  else
  begin
    if vmens <> '1' then
      TEFNaoConfirmaOperacao;
    Cancela_Ant := false;
  end;
end;

function TTEFDiscado.ConfirmacaoReimpressao(impressora: TImpressoraF;
  gerencial: boolean): boolean;
var
  vretorno: Integer;
begin
  Result := true;
  reimprimeGerencial := 0;
  BlockInput(False);
  forcaFocoNoSistema(Application.Handle);
  if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente?'), 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) = mrNo then
  begin
    impressora.vErroTEF := 'S';
    if not gerencial then
      impressora.FechaComprovanteNaoFiscalVinculadoTEF
    else
      impressora.FechaRelatorioGerencialTEF;
    sTEFRetorno := '1';
    result := False;
  end
  else
  begin
    //     Bematech_FI_VerificaImpressoraLigada;
    BlockInput(true);
    if gerencial then
    begin
      vretorno := impressora.FechaRelatorioGerencialTEF;
      if not Impressora.retorno_ImpGer(2) then
        vretorno := 0;
      while vretorno = 0 do
      begin
        impressora.vErroTEF := 'S';
        BlockInput(false);
        forcaFocoNoSistema(Application.Handle);
        if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente?'),
          'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
        begin
          BlockInput(true);
          vretorno := Impressora.FechaRelatorioGerencialTEF
        end
        else
        begin
          impressora.FechaRelatorioGerencialTEF;
          sTEFRetorno := '1';
          break;
        end;
        if not Impressora.retorno_ImpGer(2) then
          vretorno := 0;
      end;
      if sTEFRetorno = '1' then
      begin
        Result := false;
        exit;
      end;
    end
    else
    begin
      vretorno := Impressora.FechaComprovanteNaoFiscalVinculadoTEF;
      if not Impressora.retorno_ImpGer(2) then
        vretorno := 0;
      while vretorno = 0 do
      begin
        impressora.vErroTEF := 'S';
        BlockInput(false);
        forcaFocoNoSistema(Application.Handle);
        if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente?'),
          'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
        begin
          BlockInput(true);
          vretorno := Impressora.FechaComprovanteNaoFiscalVinculadoTEF
        end
        else
        begin
          impressora.FechaComprovanteNaoFiscalVinculadoTEF;
          sTEFRetorno := '1';
          break;
        end;
        if not Impressora.retorno_ImpGer(2) then
          vretorno := 0;
      end;
      if sTEFRetorno = '1' then
      begin
        Result := false;
        exit;
      end;
    end;
    if vretorno <> 0 then
      reimprimeGerencial := 1;
    exit;
  end;
  Impressora.FechaPortaSerial;
end;

constructor TTEFDiscado.create;
begin
  inherited;
  obTransTef := TtransTef.Create;
  TEFLimpaVariaveis;
  vDadosIni := TSingleton.GetInstance;
  iTEFTempoEspera := 15;
  iTEFTempoMensagem := 5;
  iTEFProximoNSU := 0;
  iTEFTecban := 0;
  vQtdeCartao := 0;

  sTEFPath := 'C:\TEF_DIAL\';
  sTEFKoneKPath := 'C:\KoneKTEF\';
end;

function TTEFDiscado.existeTransacaotransTef: boolean;
begin
  obTransTef.getTodos;
  Result := not obTransTef.dataSet.IsEmpty;
  obTransTef.Close;
end;

procedure TTEFDiscado.fechaOperacao;
begin
  TEFFechaOperacao;
  vTransParaConfirmar := false;
end;

function TTEFDiscado.finalizaOperacao(impressora: TImpressoraF): boolean;
var
  iimp: Integer;
  imp: TImpressoraF;
begin
//  begin
//    impressora.cancelaCupomTEF;
//  end;

  if ((iTEFTecban = 1) and (consulta = 1)) or ((iTEFTecban = 0) and (consulta = 1)) then
  begin

    // alteração feita por João Paulo dia 02/06/2011
    // se existir arquivos em Resp/Intpos.001 vai fechar operação, pois não pode ficar arquivo pendente.
    // Obs : aqui só existia o código [ cconsulta := 0 ]  

    TEFVerificaTEFTmp('N');
    if sTEFRetorno = '0' then
    begin
       if vTransParaConfirmar then
          fechaOperacao;
    end
    else
      consulta :=0;
  end
  else if sTEFRetorno = '0' then
  begin
    if vTransParaConfirmar then
      fechaOperacao;

    obTransTef.getTodos;
    while not obTransTef.IsEmpty do
      obTransTef.Delete;
    obTransTef.Apply;
    obTransTef.CommitaTransacao;
  end
  else
  begin
    if not DirectoryExists(sTEFKoneKPath) then
      CreateDir(sTEFKoneKPath);
    TEFNaoConfirmaOperacao;
    obTransTef.getTodos;
    while not obTransTef.eof do
    begin
      sTEFValorTotal := obTransTef.dataSet.FieldByName('Valor').value;
      sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NsuTrans').value;
      sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').value;
      sTEFHoraTransacao := obTransTef.dataSet.FieldByName('Hora').value;
      sTEFNomeDaRede := obTransTef.dataSet.FieldByName('RedeTrans').value;
      imp := TImpressoraF(impressora);
      if cancelaOperacoesAnteriores(imp) then
      begin
        obTransTef.delete;
        obTransTef.Apply;
        obTransTef.CommitaTransacao;
      end
      else
      begin
        if vmens = '1' then
        begin
          TEFMensagemC(sTEFMensOperador);
          vmens := '0';
        end;
      end;
    end;
  end;
  Application.CreateForm(tfrmFileList, frmFileList);
  frmFileList.FileListBox1.Mask := '*.Imp';
  frmFileList.FileListBox1.Directory := sTEFKoneKPath;
  frmFileList.FileListBox1.Refresh;
  for iimp := 0 to frmFileList.FileListBox1.Items.Count - 1 do
    DeleteFile(sTEFKoneKPath + frmFileList.FileListBox1.Items.Strings[iimp]);
  frmFileList.free;
  frmFileList := nil;
  consulta :=0;
end;

function TTEFDiscado.forcaFocoNoSistema(hwnd: THandle): Boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID: DWORD;
  timeout: DWORD;
begin
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);

  if GetForegroundWindow = hwnd then Result := True
  else
  begin
    // Windows 98/2000 doesn't want to foreground a window when some other
    // window has keyboard focus

    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
      ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
      ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
      (Win32MinorVersion > 0)))) then
    begin
      // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
      // Converted to Delphi by Ray Lischner
      // Published in The Delphi Magazine 55, page 16

      Result := False;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow, nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd, nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, True) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, False);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then
      begin
        // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),
          SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else
    begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;

    Result := (GetForegroundWindow = hwnd);
  end;
end;

function TTEFDiscado.gerenciamentoImpressaoTEF(impressora: TImpressoraF;
  gerencial: boolean; pathArquivo: string): boolean;
var
  vret: integer;
  imp: Timpressoraf;
begin
  try
  setVoltarParaPrimeiroArquivo(False);
  while not Impressora.AbrePortaS('') do
  begin
    impressora.vErroTEF := 'S';
    BlockInput(false);
    forcaFocoNoSistema(Application.Handle);
    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente?'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      if gerencial then
        Impressora.FechaRelatorioGerencialTEF
      else
        Impressora.FechaComprovanteNaoFiscalVinculadoTEF;
      gerencial := true;
      setVoltarParaPrimeiroArquivo(true);
      sTEFRetorno := '1';
      Impressora.FechaPortaSerial;
      Result := false;
      exit;
    end;
    BlockInput(true);
  end;

  imp := timpressoraf(impressora);
  while not ImprimeTef(imp, gerencial, pathArquivo) do
  begin
    impressora.vErroTEF := 'S';
    BlockInput(false);
    forcaFocoNoSistema(Application.Handle);
    if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente?'), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      if gerencial then
        Impressora.FechaRelatorioGerencialTEF
      else
        Impressora.FechaComprovanteNaoFiscalVinculadoTEF;
      gerencial := true;
      setVoltarParaPrimeiroArquivo(true);
      sTEFRetorno := '1';
      break;
    end
    else
    begin
      BlockInput(true);
      gerencial := true;
      setContadorImpressao(1);
      setVoltarParaPrimeiroArquivo(True);
      if gerencial then
      begin
        vret := Impressora.FechaRelatorioGerencialTEF;
        if not Impressora.retorno_ImpGer(2) then
          vret := 0;
        while vret = 0 do
        begin
          impressora.vErroTEF := 'S';
          BlockInput(false);
          forcaFocoNoSistema(Application.Handle);
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente?'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
          begin
            BlockInput(true);
            vret := Impressora.FechaRelatorioGerencialTEF;
          end
          else
          begin
            impressora.FechaRelatorioGerencialTEF;
            sTEFRetorno := '1';
            break;
          end;
          if not Impressora.retorno_ImpGer(2) then
            vret := 0;
        end;
        if sTEFRetorno = '1' then
          break;
      end
      else
      begin
        vret := Impressora.FechaComprovanteNaoFiscalVinculadoTEF;
        if not Impressora.retorno_ImpGer(2) then
          vret := 0;
        while vret = 0 do
        begin
          impressora.vErroTEF := 'S';
          BlockInput(false);
          forcaFocoNoSistema(Application.Handle);
          if Application.MessageBox(pchar('Impressora não Responde, Tentar Novamente?'),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
          begin
            BlockInput(true);
            vret := Impressora.FechaComprovanteNaoFiscalVinculadoTEF;
          end
          else
          begin
            impressora.FechaComprovanteNaoFiscalVinculadoTEF;
            sTEFRetorno := '1';
            break;
          end;
          if not Impressora.retorno_ImpGer(2) then
            vret := 0;
        end;
        if sTEFRetorno = '1' then
          break;
        if vret <> 0 then
          gerencial := true;
      end;
      break;
    end;
  end;
  Impressora.FechaPortaSerial;
  Result := sTEFRetorno = '0';
  finally
    if voltarParaPrimeiroArquivo then
    begin
      reimpressao:='S';
      relAberto:='';
    end;
  end;
end;

function TTEFDiscado.getQtdeCartao: integer;
begin
  Result := vQtdeCartao;
end;

function TTEFDiscado.getTefDataTransacao: string;
begin
  Result := sTEFDataTransacao;
end;

function TTEFDiscado.getTefHoraTransacao: string;
begin
  Result := sTEFHoraTransacao;
end;

function TTEFDiscado.getTefNomeDARede: string;
begin
  Result := sTEFNomeDaRede;
end;

function TTEFDiscado.getTefNTransacao: string;
begin
  Result := sTEFNSUTransacao;
end;

function TTEFDiscado.getTefValorTotal: string;
begin
  Result := sTEFValorTotal;
end;

function TTEFDiscado.getTEFValorTransacao: Currency;
var
  temp: string;
begin
  temp := sTEFValorTotal;
  insert(',', temp, length(temp) - 1);
  Result := StrToCurr(temp);
end;

function TTEFDiscado.ImprimeTef(impressora: TImpressoraF; gerencial: boolean;
  pathArquivo: string): boolean;
var
  i, vretorno: Integer;
  vArq: TextFile;
  vlinha: string;
  iInicio: Ttime;
  j: Integer;
  vvalorCartao: Real;
  tempNomeTEF, tempValor, tempDocVinc: string;
begin
  try
    BlockInput(True);
    Result := true;
    Mensagem('Imprimindo...');
    impressora.vFVccancTef := 0;

    if not gerencial then
    begin
      vvalorCartao := vvalorTef[contadorImpressao];
      tempValor := vDadosIni.StrZeroDec(vvalorCartao, 15, 2);
      delete(tempValor, 13, 1);

      Impressora.AbreComprovanteNaoFiscalVinculado(vnomeTef[contadorImpressao],
        tempValor, vDadosIni.StrZeroDec(strtoInt(sTEFDoctoVinculado), 6, 0));
    end
    else
    begin
      //impressora.LeituraX;      // descomentado por João Paulo. 
      if (relAberto <> 'S') then
      begin
        impressora.abrerelatorioGer;
        relAberto :='S';
      end
      else
      begin
        vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
      end;
    end;

    for i := 1 to 2 do
    begin
      AssignFile(varq, pathArquivo);
      //AssignFile(varq, sTEFKoneKPath + frmFileList.FileListBox1.Items.Strings[iimp - 1]);
      Reset(varq);
      readln(varq, vlinha);

      while not eof(varq) do
      begin

        Application.ProcessMessages;
        vretorno := 1;
        //    if Bematech_FI_VerificaImpressoraLigada = 1 then
        //    begin

        if not gerencial then
        begin
          if vlinha = '' then
            vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '))
          else
            vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,vlinha));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
        end
        else
        begin
          if vlinha = '' then
            vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,' '))
          else
            vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,vlinha));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
        end;
        if vretorno = 0 then
          break;
        Impressora.Retorno_impTEF;
        if Impressora.vFVccancTef <> 0 then
          vretorno := 0;
        if vretorno = 0 then
          break;
        readln(varq, vlinha);

//  usar a função recorte de ('--RECORTE PAPEL') ´para fazer parar o tempo e dar os espaços.
//  esta função já foi usada no unfuncoestefdedicado, só olhar e colocar aqui.


        if eof(varq) then
        begin
          if not gerencial then
          begin
            if vlinha = '' then
              vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '))
            else
              vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,vlinha));
            if not Impressora.retorno_ImpGer(2) then
              vretorno := 0;
          end
          else
          begin
            if vlinha = '' then
              vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,' '))
            else
              vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,vlinha));
            if not Impressora.retorno_ImpGer(2) then
              vretorno := 0;
          end;
          if vretorno = 0 then
            break;
        end;
      end;
      CloseFile(varq);
      if vretorno = 0 then
        break
      else
      begin
        vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,' '));
        if not Impressora.retorno_ImpGer(2) then
          vretorno := 0;
        if vretorno = 0 then
          break;
        vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,' '));
        if not Impressora.retorno_ImpGer(2) then
          vretorno := 0;
        if vretorno = 0 then
          break;
      end;
      if i <> 2 then
      begin
        iInicio := time;
        if not gerencial then
        begin
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
        end
        else
        begin
          vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
          vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
          vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
          vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
          vretorno := Impressora.RelatorioGerencial(impressora.TamDescricao(48,' '));
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
          if vretorno = 0 then
            break;
        end;
        repeat
        until ((time - iInicio) > strtotime('00:00:02'));
      end;
    end;
    if vretorno = 0 then
      result := false
    else
    begin
      if not gerencial then
      begin
        vretorno := impressora.FechaComprovanteNaoFiscalVinculadoTEF;
        if not Impressora.retorno_ImpGer(2) then
          vretorno := 0;
      end
      else
      begin
        if reimpressao <> 'S' then
        begin
          vretorno := impressora.FechaRelatorioGerencialTEF;
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;
        end;
      end;
    end;
    if vretorno = 0 then
      result := false;
  finally
    limpaMensagem;
    BlockInput(false);
  end;
end;

procedure TTEFDiscado.limpaMensagem;
begin
  if frmMensagemG <> nil then
  begin
    frmMensagemG.Close;
    frmMensagemG.free;
    frmMensagemG := nil;
  end;
end;

procedure TTEFDiscado.limpaVariaveis;
begin
  TEFLimpaVariaveis;
end;

procedure TTEFDiscado.limpaVariaveisNovoCartao;
var
  I: Integer;
begin
  limpavariaveis;
  vTransParaConfirmar := false;
  vQtdeCartao := 0;
  for I := 0 to 9 do
  begin
    try
      vnomeTef[i] := '';
      vvalorTef[i] := 0;
    except
    end;
  end;
end;

procedure TTEFDiscado.limpaVariaveisNovoCartao2;
begin
  inherited;

end;

procedure TTEFDiscado.Mensagem(mensagem: string);
begin
  if frmMensagemG = nil then
    Application.CreateForm(TfrmMensagemG, frmMensagemG);
  frmMensagemG.Show;
  frmMensagemG.Label1.Caption := mensagem;
  frmMensagemG.Label1.Width := 400;
  frmMensagemG.Refresh;
end;

procedure TTEFDiscado.MensagemFiscal(mensagem: string);
begin

end;

function TTEFDiscado.naoConfirmaUltimaOperacao: boolean;
begin
  Result := True;
end;

function TTEFDiscado.operacaoAdministrativo(impressora: TImpressoraF;
  tecBan: boolean): boolean;
var
  imp: TImpressoraF;
begin
  imp := TImpressoraF(impressora);
  vDadosIni.vConsultaCheque := '0';

  if tecBan then
    iTEFTecban := 1
  else
    iTEFTecban := 0;
  TEFLimpaVariaveis;
  TEFModoAdministrativo;

  if sTEFRetorno = '0' then
  begin
    if FileExists(sTEFKoneKPath + 'TEF.Imp') then
    begin
      try
        Mensagem('Aguarde! Imprimindo...');
        impressora.vErroTEF := 'S';
        impressora.FechaRelatorioGerencialTEF;
        impressora.vErroTEF := '';
        while not ImprimeTef(imp, true, sTEFKoneKPath + 'TEF.Imp') do
        begin
          impressora.vErroTEF := 'S';
          impressora.FechaRelatorioGerencialTEF;
          impressora.vErroTEF := '';
          if ConfirmacaoReimpressao(imp, true) then
          begin
            if (not reimprimeDocVinculadoComoGerencial) or (sTEFRetorno = '1') then
            begin
              break;
              exit;
            end;
          end
          else
          begin
            break;
            exit;
          end;
        end;
      finally
        limpaMensagem;
      end;
    end;
    if FileExists(sTEFKoneKPath + 'TEF.Imp') then
    begin
      if sTEFRetorno = '0' then
        TEFFechaOperacao
      else
      begin
        TEFNaoConfirmaOperacao;
        TEFVerificaArquivosPendentes;
      end;
    end;
  end;
  if vmens = '1' then
  begin
    if FileExists(sTEFKoneKPath + 'IntPos.001') then
    begin
      try
        DeleteFile(sTEFKoneKPath + 'IntPos.001');
      except
      end;
    end;
    vmens := '0';
    Application.MessageBox(pchar(sTEFMensOperador), 'Atenção', MB_OK + MB_ICONINFORMATION);
  end;
end;

//function TTEFDiscado.operacaoCancelamentoTransacao(impressora: TImpressoraF;
//  tecBan,a: boolean; nomeRede, nsuTransacao, data, hora: string;
//  valorTotal: Real): boolean;

function TTEFDiscado.operacaoCancelamentoTransacao(impressora: TImpressoraF): boolean;
var
  imp: TImpressoraF;
  iimp: Integer;
begin
  imp := TImpressoraF(impressora);
  Application.CreateForm(TfrmCancTransTef, frmCancTransTef);
  try
    limpaVariaveisNovoCartao;
    if frmCancTransTef.ShowModal <> mrOk then
      Exit;
    if frmCancTransTef.ListBox1.Items[frmCancTransTef.ListBox1.ItemIndex] = 'TECBAN' then
      iTEFTecban := 1
    else
      iTEFTecban := 0;
    sTEFNomeDaRede := frmCancTransTef.ListBox1.Items[frmCancTransTef.ListBox1.ItemIndex];

    sTEFValorTotal := Format('%10.2f',[frmCancTransTef.edValorTotalC.Valor]);
    sTEFValorTotal:= StringReplace(sTEFValorTotal,' ','',[rfReplaceAll,rfIgnoreCase]);
    sTEFValorTotal:= StringReplace(sTEFValorTotal,'.','',[rfReplaceAll,rfIgnoreCase]);
    sTEFValorTotal:= StringReplace(sTEFValorTotal,',','',[rfReplaceAll,rfIgnoreCase]);
    sTEFValorTotal:= StringReplace(sTEFValorTotal,CurrencyString,'',[rfReplaceAll,rfIgnoreCase]);

    sTEFNSUTransacao := frmCancTransTef.edNSUTransacao.Text;
    sTEFDataTransacao := frmCancTransTef.edDataTransacao.Text;
    sTEFHoraTransacao := frmCancTransTef.edHoraTransacao.Text;

    TEFCancelaTransacao;

    if sTEFRetorno = '0' then
    begin
      if FileExists(sTEFKoneKPath + 'TEF.Imp') then
      begin
        try
          Mensagem('Aguarde! Imprimindo...');
//          if not gerenciamentoImpressaoTEF(imp, True, sTEFKoneKPath + 'TEF.Imp') then
//            sTEFRetorno := '1';
          while not ImprimeTef(imp, true, sTEFKoneKPath + 'TEF.Imp') do
          begin
            if ConfirmacaoReimpressao(imp, true) then
            begin
              if (not reimprimeDocVinculadoComoGerencial) or (sTEFRetorno = '1') then
              begin
                break;
                exit;
              end;
            end
            else
            begin
              break;
              exit;
            end;
          end;
        finally
           limpaMensagem;
        end;
      end;
      if FileExists(sTEFKoneKPath + 'TEF.Imp') then
      begin
        if sTEFRetorno = '0' then
          TEFFechaOperacao
        else
        begin
          TEFNaoConfirmaOperacao;
          TEFVerificaArquivosPendentes;
        end;
      end;
    end;
    if vmens = '1' then
    begin
      if FileExists(sTEFKoneKPath + 'IntPos.001') then
      begin
        try
          DeleteFile(sTEFKoneKPath + 'IntPos.001');
        except
        end;
      end;
      vmens := '0';
      Application.MessageBox(pchar(sTEFMensOperador), 'Atenção', MB_OK + MB_ICONINFORMATION);
    end;
  finally
    frmCancTransTef.Free;
    frmCancTransTef := nil;
    limpaVariaveisNovoCartao;
  end;
end;

function TTEFDiscado.reimprimeDocVinculadoComoGerencial: boolean;
begin
  Result := reimprimeGerencial = 1;
end;

procedure TTEFDiscado.setContadorImpressao(valor: Integer);
begin
  contadorImpressao := valor;
end;

procedure TTEFDiscado.setVoltarParaPrimeiroArquivo(Value: boolean);
begin
  vVoltaImpPrimeiroArq := Value;
end;

procedure TTEFDiscado.TEFCancelaTransacao;
begin

  sTEFRetorno := '0';

  try
    TEFVerificaGerenciadorAtivo;
    if sTEFRetorno = '0' then
      TEFGravaOperacao('CNC');
    if sTEFRetorno = '0' then
      TEFConfirmaOperacao;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end; {TEFCancelaTransacao}

// ---< Confirma e encerra a transação do TEF >---

procedure TTEFDiscado.TEFFechaOperacao;
begin
  TEFVerificaGerenciadorAtivo;
  sTEFRetorno := '0';
  TEFGravaOperacao('CNF');
  if (sTEFRetorno = '0') and (FileExists(sTEFKoneKPath + 'TEF.Imp')) then
    DeleteFile(sTEFKoneKPath + 'TEF.Imp');

end; {TEFFechaOperacao}

procedure TTEFDiscado.TEFMensagemG(sLinha4: string);
begin
  frmMensagemG := TfrmMensagemG.Create(Application);
  frmMensagemG.Show;
  frmMensagemG.Label1.Caption := sLinha4;
  frmMensagemG.Refresh;
  Sleep(iTEFTempoMensagem * 1000);
  frmMensagemG.Free;
  frmMensagemG := nil;
end; {TEFMensagem}

procedure TTEFDiscado.TEFMensagemC(sLinha4: string);
begin
  if frmMensagGc = nil then
    Application.CreateForm(TfrmMensagGc, frmMensagGc);

  frmMensagGc.lblLinha4.Caption := sLinha4;
  if FileExists(sTEFKoneKPath + 'IntPos.001') then
  begin
    try
      DeleteFile(sTEFKoneKPath + 'IntPos.001');
    except
    end;
  end;
  frmMensagGc.Showmodal;
end; {TEFMensagem}

end.

