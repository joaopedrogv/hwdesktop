{ Projeto     : TEFDelphi
  Unit        : unFuncoesTEF
  Versão      : 4.0.0
  Função      : Agrega todas as funções do TEF
  Autor       : Kohl em 11/07/2003
  Alterações  : Kohl em 17/10/2003 - Inclusão do Tecban
  Alterações  : Herbert em 20/02/2004 - Adaptação para sistema Fiscal.exe -
  por Herbert da Silva Costa

}
unit unFuncoesTEFDedicado;

interface

uses
  Windows, SysUtils, Controls, Forms, FileCtrl, Dialogs, unMensagem, unImpressao, unMensagGerais,
  unMensagGc, udadosINI, uImpressoraF, utranstef, unFuncoesTEF;

const
  OP_CRT = 'CRT';
  OP_CARTDIGI = 'CARTDIGI';

type
  // ---< Registro TEFParam >---
  regTEFParam = record
    NSU: integer;
  end;

  TSIMNAO = (snNAO, snSIM);
  TobterDadosCartao = function (pAUT, pNSU:PChar; pCOMPROVANTE: PChar): PChar; stdcall;

  TMensagemEvent = procedure (mensagem: string) of object;
  TMensagemClear = procedure of object;

  TTEFDedicado = class (TTEF)
  strict private
    procedure TEFObterDadosImpressao;
    procedure DeleteFilesImp;
  private

    vMensagemNSUTrasancao: string;
    vOPADM: string;
    FOnMensagem: TMensagemEvent;
    FOnMensagemClear: TMensagemClear;
    FOnLogRESP: TMensagemEvent;
    FOnLogREQ: TMensagemEvent;
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
    procedure TEFPedidoAutorizacaoCarteirasDigitais;
    procedure TEFPedidoAutorizacaoCheque; override;
    procedure TEFVendaCartao; override;
    procedure TEFVendaCarteirasDigitais;
    procedure TEFVendaCheque; override;
    procedure TEFCancelaTransacao; override;
    procedure TEFFechaOperacao; override;

    //---------- < Procedure criada na 2006 > -----------------
    procedure VerificaTefImp; override;
    procedure setVoltarParaPrimeiroArquivo(Value: boolean); override;
    procedure Mensagem(mensagem: string); override;
    procedure limpaMensagem; override;
    function getPathTEF: string;
    function getFileTEF: string;

    function CreateProcessSimple(cmd: string): boolean; override;

    procedure gravaNSUnoBkpFormpagamento;

    procedure registrarDadosTransacao;

    procedure verificaMultiCappta(pNSU, pAuto, pFile: string);

  public
//    iTEFTecban: integer; // 0 = Usar o GP das redes - 1 = Usar o GP Tecban
//    sTEFPath: string;
//    reimpressao:string;
//    relAberto:string;


    constructor create;
    function forcaFocoNoSistema(hwnd: THandle): Boolean; override;
    procedure VerificaArquivosPendentes; override;
    function venda(tipoFinalizador, ndocVinculado, Moeda: Integer; verificaCredito,
      atribfinalizador: string; valorTotal: Double): Boolean; override;
    function CarteiraDigital(ndocVinculado, habCarteiraDigital, idPSP: string; value: Double): Boolean;
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
    procedure verificaOperacaoPendenteTransTef; override;
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
    function getTEFValorSaque: Currency; override;
    function getTEFValorDesconto: Currency; override;
    procedure SalvaVariaveisVendaCorrente(Codigo:integer); override;

    function verificaConfirmacaoPendenteAntesNovaVenda : boolean;

    property OnMensagem: TMensagemEvent read FOnMensagem write FOnMensagem;
    property OnMensagemClear: TMensagemClear read FOnMensagemClear write FOnMensagemClear;
    property OnLogREQ: TMensagemEvent read FOnLogREQ write FOnLogREQ;
    property OnLogRESP: TMensagemEvent read FOnLogRESP write FOnLogRESP;

//  var
//    obTransTef: Ttranstef;
//    vmens, msgOp: string;
//    vmsgErroImpressora : string;
  end;

implementation

uses
  uFileList, StdCtrls, DB, uDtmAtivo, UCancTransTef, Mask, Messages, ShellAPI,
  Classes, DateUtils, StrUtils, hw_utils, hw_win_utils;

function BlockInput(block: boolean): DWORD; stdcall; external 'user32.DLL';

var
  // ---< Arquivo TEFParam >---
  TEFParam: file of regTEFParam;
  Param: regTEFParam;
  NomeParam: string;

  // ---< Retorna os caracteres a direita a partir da posição iPos >---

// ---< Remove as aspas iniciais e finais da string >---


// ---< Exibe uma mensagem por iTempo segundos sem intervenção do usuário >---

procedure TTEFDedicado.TEFMensagem(sLinha1, sLinha2, sLinha3, sLinha4: string);
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

procedure TTEFDedicado.TEFVerificaArquivosPendentes;
var
  aArquivo: TextFile;
  files: TStrings;
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

    files := GetFileList(sTEFKoneKPath, '*.Imp');
    for iimp := 0 to files.Count - 1 do
        DeleteFile(sTEFKoneKPath + files[iimp]);
    {
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
    }

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

procedure TTEFDedicado.TEFVerificaArquivosPendentesVND;
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

procedure TTEFDedicado.TEFLimpaVariaveis;
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
  sTEFValidandoTransTef := '0';
  sTEFMsgCancelamento := '0';
  sTEFMsgConfirmacao := '0';
  sTEFValorSaque := '0';
  sTEFValorDesconto := '0';
  sTEFHabIdCartDigital := '';
  sTEFIdCartDigital := '';
  sTEFNomeCartDigital := '';
  sTEFIdPSP := '';
  sTEFIdPSPREQ := '';

  if iTEFTecban = 0 then
    sTEFPath := getPathTEF
  else
    sTEFPath := getPathTEF;
  vmens := '';
  msgOp := '';

end; {TEFLimpaVariaveis}

// ---< Verifica e abre arquivo TEF.tmp >---
// sExibeErro : 'S" = exibe mensagem, 'N' = Não exibe

procedure TTEFDedicado.TEFVerificaTEFTmp(sExibeErro: string);
var
  aIntPos001: TextFile;
  sNomeArquivo: string;
  sLinha : string;
  sOperacao : string;
begin


  sTEFRetorno := '0';

  try
    sNomeArquivo := sTEFPath + 'RESP\IntPos.001';
    if FileExists(sNomeArquivo) then
    begin
      AssignFile(aIntPos001, sNomeArquivo);
      Reset(aIntPos001);
      if not EOF (aIntPos001) then
      begin
          while not Eof (aIntPos001) do
          begin
             ReadLn(aIntPos001, sLinha);
             if Copy(Trim(sLinha), 1, 7) = '000-000' then
                sTEFOperacao := RightFromPos(sLinha, 11);
             if Copy(Trim(sLinha), 1, 7) = '009-000' then
                sTEFStatusTransac := RightFromPos(sLinha, 11);
             if Copy(Trim(sLinha), 1, 7) = '012-000' then
             begin
                sTEFNSUTransacao := RightFromPos(sLinha, 11);
                Break;
             end;
          end;
      end
      else
         sTEFRetorno := '1';

      //if EOF(aIntPos001) then
      //  sTEFRetorno := '1';
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

function TTEFDedicado.venda(tipoFinalizador, ndocVinculado, Moeda: Integer;
   verificaCredito, atribfinalizador: string; valorTotal: Double): boolean;
var
  temp: string;
begin
  sTEFPath := getPathTEF;
  Result := False;
  if not verificaConfirmacaoPendenteAntesNovaVenda then
    Exit;
  VerificaTefImp;
  TEFLimpaVariaveis;
  sTEFDoctoVinculado := inttostr(ndocVinculado);
  sTEFValorTotal := trim(format('%10.2f', [valortotal]));
  delete(sTEFValorTotal, pos(',', sTEFValorTotal), 1);
  sTEFMoeda := inttostr(moeda);
  consulta:=0;
  sNomeFinalizador := atribfinalizador;

  {tipoFinalizador = 3 => Tecban, fazer venda no cheque}
  if ((tipoFinalizador = 3) or (tipoFinalizador = 4)) and (verificaCredito = 'S') then
  begin
    //if vTransParaConfirmar then
//       fechaOperacao;

    //if tipoFinalizador = 3 then
       iTEFTecban := 1;
    //else
    //   iTEFTecban := 0;

    vDadosIni.vconsultaCheque := '1';
    TEFVendaCheque;
    vDadosIni.vconsultaCheque := '0';
    consulta :=1;
  end
  else
  begin
    {fazer venda no Cartão}
    if vTransParaConfirmar then
//       fechaOperacao;

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
    vvalorTef[vqtdeCartao] := strtofloat(trim(format('%10.2f', [getTEFValorTransacao]))) +
      getTEFValorSaque - getTEFValorDesconto;
    sTEFDoctoVinculado := StrZero(ndocVinculado, 6);
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

procedure TTEFDedicado.VerificaArquivosPendentes;
begin
  TEFVerificaArquivosPendentes;
end;

function TTEFDedicado.verificaConfirmacaoPendenteAntesNovaVenda: boolean;
begin
  Result :=true;
  if vQtdeCartao > 0 then
    exit;
  if (FileExists(sTEFKoneKPath + 'TEF.Imp')) then
    try
      DeleteFile(sTEFKoneKPath + 'TEF.Imp');
    except
      ShowMessage('Erro ao apagar TEF.Imp');
    end;

  verificaOperacaoPendenteTransTef;
  Exit;

  vMensagemNSUTrasancao := #13;

  obTransTef.getTefNaoConfirmadoCNF;
  obTransTef.First;
  TEFVerificaGerenciadorAtivo;
  if sTEFRetorno = '1' then
  begin
    Result := False;
    exit;
  end;
  if not obTransTef.dataset.IsEmpty then
  begin
    while not obTransTef.dataset.IsEmpty do
    begin

        //Application.MessageBox(pchar('Existem Transações TEF Pendentes para confirmação.'),
        //'Confirmação', MB_ICONINFORMATION + mb_OK);

        sTEFValorTotal := obTransTef.dataSet.FieldByName('Valor').AsString;
        sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NsuTrans').AsString;
        sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').AsString;
        sTEFHoraTransacao := obTransTef.dataSet.FieldByName('Hora').AsString;
        sTEFNomeDaRede := obTransTef.dataSet.FieldByName('RedeTrans').AsString;
        sTEFDoctoVinculado := obTransTef.dataSet.FieldByName('DocVinculado').Value;
        sTEFFinalizacao := obTransTef.dataSet.FieldByName('Finalizacao').Value;

        TEFVerificaGerenciadorAtivo;
        sTEFRetorno := '0';

        Try
           sTEFValidandoTransTef := '1';
           TEFVerificaGerenciadorAtivo;
           if sTEFRetorno = '1' then
           begin
             Result := False;
             Break;
           end;
           sTEFRetorno := '0';
           if  Trim(sTEFNSUTransacao) <> '' then
             vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'NSU: ' + sTEFNSUTransacao + #13;
           TEFGravaOperacao('CNF');

           vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'Para rede Cielo utilizar os 6 últimos dígitos';
           Application.MessageBox(pchar('Última transação foi confirmada. Favor reimprimir último cupom.'+vMensagemNSUTrasancao),
           'Confirmação', MB_ICONINFORMATION + mb_OK);
        finally
           sTEFValidandoTransTef := '0';
        end;

        if sTEFRetorno = '0' then
        begin
           obTransTef.delete;
           obTransTef.Apply;
           obTransTef.CommitaTransacao;
        end;
    end;

    vmens := '';
    sTEFMensOperador := '';
    Try
       sTEFMsgConfirmacao := '1' ;
       TEFVerificaOperacaoPendente;
    finally
       sTEFMsgConfirmacao := '0' ;
    end;

  end
  else
  begin
      vmens := '';
      sTEFMensOperador := '';
      TEFVerificaOperacaoPendente;  //Confirma (CNF) Operação pendente e envia msg para Reimpressão do cupom TEF (ADM).
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
  limpaVariaveisNovoCartao;
end;

procedure TTEFDedicado.verificaMultiCappta(pNSU, pAuto, pFile: string);
var
  hdCompativel: THandle;
  obterDadosCartao : TobterDadosCartao;
  vDados: PCHAR;
begin
  ///  metodo dentro do compativel le os compravantes e ser for multi, se encontrar mais de um NSU na impressao do campo 029
  ///  retorna os dados de cada transacao por linha no formato AUT|NSU|VALOR|PARCELA|
  ///  como o uso disto no sistema seria em caso de lanchonetes onde a conta seria dividido achamos ( joao pedor e o herbert)
  ///  melhor nao implementar isto, futuramente se for interessante podemos analisar uma forma de tratar estes dados,
  ///  talvez gravando no fincupom em um campo blob estes dados para processamento no retaguarda
  try
    hdCompativel := 0;
    hdCompativel := LoadLibrary(Pchar('CompativelHW.dll'));
    if hdCompativel <> 0 then
    begin
      @obterDadosCartao := GetProcAddress(hdCompativel, PChar('obterDadosCartao'));
      vDados := obterDadosCartao(PChar(pAuto),PChar(pNSU),PChar(pFile));
    end;
  finally
    if hdCompativel <> 0 then
      FreeLibrary(hdCompativel);
  end;
end;

procedure TTEFDedicado.verificaOperacaoPendente(impressora: TImpressoraF);
var
  imp: TImpressoraF;
begin

  //TEFVerificaGerenciadorAtivo;
  vMensagemNSUTrasancao := #13;

  obTransTef.getTodos;
  obTransTef.First;
  if not obTransTef.dataset.IsEmpty then
  begin
    while not obTransTef.dataset.IsEmpty do
    begin

        //Application.MessageBox(pchar('Existem Transações TEF Pendentes para confirmação.'),
        //'Confirmação', MB_ICONINFORMATION + mb_OK);

        TEFVerificaGerenciadorAtivo;
        if sTEFRetorno = '1' then
          exit;

        sTEFValorTotal := obTransTef.dataSet.FieldByName('Valor').AsString;
        sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NsuTrans').AsString;
        sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').AsString;
        sTEFHoraTransacao := obTransTef.dataSet.FieldByName('Hora').AsString;
        sTEFNomeDaRede := obTransTef.dataSet.FieldByName('RedeTrans').AsString;
        sTEFDoctoVinculado := obTransTef.dataSet.FieldByName('DocVinculado').Value;
        sTEFFinalizacao := obTransTef.dataSet.FieldByName('Finalizacao').Value;
        imp := TImpressoraF(impressora);

        sTEFRetorno := '0';

        Try
           sTEFValidandoTransTef := '1';
           if  Trim(sTEFNSUTransacao) <> '' then
             vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'NSU: ' + sTEFNSUTransacao + #13;
           TEFGravaOperacao('CNF');
        finally
           sTEFValidandoTransTef := '0';
        end;

        if sTEFRetorno = '0' then
        begin
           obTransTef.delete;
           obTransTef.Apply;
           obTransTef.CommitaTransacao;
           vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'Para rede Cielo utilizar os 6 últimos dígitos';
           Application.MessageBox(pchar('Última transação foi confirmada. Favor reimprimir último cupom.' + vMensagemNSUTrasancao),
           'Confirmação', MB_ICONINFORMATION + mb_OK);
        end;
    end;

    vmens := '';
    sTEFMensOperador := '';
    Try
       sTEFMsgConfirmacao := '1' ;
       TEFVerificaOperacaoPendente;
    finally
       sTEFMsgConfirmacao := '0' ;
    end;

  end
  else
  begin
      vmens := '';
      sTEFMensOperador := '';
      TEFVerificaOperacaoPendente;  //Confirma (CNF) Operação pendente e envia msg para Reimpressão do cupom TEF (ADM).
//      if vDadosIni.vtefdial = 'S' then
//      begin
//        iTEFTecban := 0;
//        sTEFPath := 'C:\Client\';
//        TEFVerificaOperacaoPendente;
//      end;
//      if vDadosIni.vtefdisc = 'S' then
//      begin
//        iTEFTecban := 1;
//        sTEFPath := 'C:\Client\';
//        TEFVerificaOperacaoPendente;  //Confirma (CNF) Operação pendente e envia msg para Reimpressão do cupom TEF (ADM).
//        iTEFTecban := 0;
//        sTEFPath := 'C:\Client\';
//      end;
  end;

//    if Cancela_Ant(imp, sTEFKoneKPath + 'TEF.Imp') then
//    begin
//      obTransTef.delete;
//      obTransTef.Apply;
//      obTransTef.CommitaTransacao;
//    end
//    else
//    begin
//      if vmens = '1' then
//      begin
//        TEFMensagemC(sTEFMensOperador);
//        vmens := '0';
//      end;
//    end;

//  end;  fechava o while do transtef.

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

function TTEFDedicado.verificaOperacaoPendenteEntrada(
  impressora: TImpressoraF): boolean;
var
  vTipoTransacao: string;
  vApresentarMensagem: Integer;
  iimp: integer;
begin
  Result := false;
  vApresentarMensagem := 0;
  limpaVariaveis;
  iTEFTecban := 0;
  sTEFPath := getPathTEF;

  vMensagemNSUTrasancao := #13;

  obTransTef.getTodos;
  if not obTransTef.dataset.IsEmpty then
  begin
    TEFVerificaGerenciadorAtivo;
    if sTEFRetorno = '1' then
    begin
      Result := False;
      exit;
    end;
    /// Aqui o sistema verifica se existe resposta, e se o arquivo nao é o mesmo do gravado no transtef.
    ///  Se for o mesmo o sistema não tentara fazer dois NCN para a mesma transacao
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
      TEFVerificaTEFTmp('N');   //verifica se existe, e se tem conteúdo o arquivo IntPos.001 dentro resp/IntPos.001;
    end;
    obTransTef.dataset.First;
    while not obTransTef.dataset.Eof do
    begin
      if Trim(sTEFNSUTransacao) = Trim(obTransTef.dataSet.FieldByName('NsuTrans').AsString) then
      begin
        sTEFValorTotal := obTransTef.dataSet.FieldByName('Valor').AsString;
        sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NsuTrans').AsString;
        sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').AsString;
        sTEFHoraTransacao := obTransTef.dataSet.FieldByName('Hora').AsString;
        sTEFNomeDaRede := obTransTef.dataSet.FieldByName('RedeTrans').AsString;
        sTEFDoctoVinculado := obTransTef.dataSet.FieldByName('DocVinculado').Value;
        sTEFFinalizacao := obTransTef.dataSet.FieldByName('Finalizacao').Value;

        sTEFRetorno := '0';

        vTipoTransacao := Trim(obTransTef.dataSet.FieldByName('TipoConfirmacao').AsString);
        try
          sTEFValidandoTransTef := '1';
          if Trim(obTransTef.dataSet.FieldByName('TipoConfirmacao').AsString) = 'CNF' then
          begin
            if  Trim(sTEFNSUTransacao) <> '' then
              vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'NSU: ' + sTEFNSUTransacao + #13;

            TEFGravaOperacao('CNF');
          end
          else
            TEFGravaOperacao('NCN');
        finally
          sTEFValidandoTransTef := '0';
        end;

        if sTEFRetorno = '0' then
        begin
          obTransTef.delete;
          obTransTef.Apply;
          obTransTef.CommitaTransacao;
          vApresentarMensagem := 1;
        end;

      end;
      obTransTef.dataset.Next;
    end;
    if (sTEFRetorno = '0') and (sTEFNSUTransacao <> '') and
      (sTEFNSUTransacao <> '0') and (vApresentarMensagem = 0) then
    begin
      //TEFNaoConfirmaOperacao;  = grava um IntPos.001 como NCN (não confirmado), fazendo assim o cancelamento o TeF.
      TEFVerificaGerenciadorAtivo;
      if (sTEFRetorno = '1') then
        Exit;
      if  Trim(sTEFNSUTransacao) <> '' then
        vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'NSU: ' + sTEFNSUTransacao + #13;
      TEFGravaOperacao('CNF');
      if sTEFRetorno = '0' then
      begin
        vApresentarMensagem := 1;
        vTipoTransacao := 'CNF';
      end;
    end;

    while not obTransTef.dataset.IsEmpty do
    begin
      TEFVerificaGerenciadorAtivo;
      if sTEFRetorno = '1' then
      begin
        Result := False;
        exit;
      end;

      sTEFValorTotal := obTransTef.dataSet.FieldByName('Valor').AsString;
      sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NsuTrans').AsString;
      sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').AsString;
      sTEFHoraTransacao := obTransTef.dataSet.FieldByName('Hora').AsString;
      sTEFNomeDaRede := obTransTef.dataSet.FieldByName('RedeTrans').AsString;
      sTEFDoctoVinculado := obTransTef.dataSet.FieldByName('DocVinculado').Value;
      sTEFFinalizacao := obTransTef.dataSet.FieldByName('Finalizacao').Value;

      sTEFRetorno := '0';

      try
        sTEFValidandoTransTef := '1';
        if obTransTef.dataSet.FieldByName('TipoConfirmacao').Value = 'CNF' then
        begin
          if  Trim(sTEFNSUTransacao) <> '' then
            vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'NSU: ' + sTEFNSUTransacao + #13;
          TEFGravaOperacao('CNF');
        end
        else
          TEFGravaOperacao('NCN');
      finally
        sTEFValidandoTransTef := '0';
      end;

      if sTEFRetorno = '0' then
      begin
        obTransTef.delete;
        obTransTef.Apply;
        obTransTef.CommitaTransacao;
        vApresentarMensagem := 1;
      end;
    end;
  end
  else
  begin
    /// Caso nao exista transacoes no transtef sera confirmada a transacao pendente
    ///  em arquivo
    TEFVerificaGerenciadorAtivo;
    if sTEFRetorno = '1' then
    begin
      Result := False;
      exit;
    end;
    /// Aqui o sistema verifica se existe resposta, e se o arquivo nao é o mesmo do gravado no transtef.
    ///  Se for o mesmo o sistema não tentara fazer dois NCN para a mesma transacao
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
      TEFVerificaTEFTmp('N');   //verifica se existe, e se tem conteúdo o arquivo IntPos.001 dentro resp/IntPos.001;
    end;
    if (sTEFRetorno = '0') and (sTEFNSUTransacao <> '') and (sTEFNSUTransacao <> '0') then
    begin
      //TEFNaoConfirmaOperacao;  = grava um IntPos.001 como NCN (não confirmado), fazendo assim o cancelamento o TeF.
      TEFVerificaGerenciadorAtivo;
      if (sTEFRetorno = '1') then
        Exit;
      if  Trim(sTEFNSUTransacao) <> '' then
        vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'NSU: ' + sTEFNSUTransacao + #13;
      TEFGravaOperacao('CNF');
      if sTEFRetorno = '0' then
      begin
        vApresentarMensagem := 1;
        vTipoTransacao := 'CNF';
      end;
    end;
  end;

  if vApresentarMensagem = 1 then
  begin
    Result := True;
    if vTipoTransacao = 'CNF' then
    begin
      vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'Para rede Cielo utilizar os 6 últimos dígitos';
      Application.MessageBox(pchar('Última transação foi confirmada. Favor reimprimir último cupom.'+vMensagemNSUTrasancao),
           'Confirmação', MB_ICONINFORMATION + mb_OK);
    end
    else
      Application.MessageBox('Transação não efetuada. Favor reter o Cupom.','Confirmação',
         MB_ICONINFORMATION + MB_OK);
  end;

  DeleteFilesImp;

  {vmens := '';
  Result := false;
  sTEFMensOperador := '';
  //if vDadosIni.vtefdial = 'S' then
  begin
    iTEFTecban := 0;
    sTEFPath := 'C:\Client\';
    TEFVerificaOperacaoPendente;
    Result := sTEFRetorno = '0' ;
  end;
  // Verifica Tef_Disc
  {if vDadosIni.vtefdisc = 'S' then
  begin
    iTEFTecban := 1;
    sTEFPath := 'C:\Client\';
    TEFVerificaOperacaoPendente;
    iTEFTecban := 0;
    sTEFPath := 'C:\Client\';
  end;}

//  obTransTef.getTodos;
//  while not obTransTef.dataset.IsEmpty do
//  begin
//    Result := true;
//    impressora.vErroTEF := '';
//    limpaVariaveisNovoCartao;
//    exit;
//  end;

  {if vmens = '1' then
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
  limpaVariaveisNovoCartao; }
end;

procedure TTEFDedicado.verificaOperacaoPendenteTransTef ;
var
  vCapituraRetorno : String;
begin

  TEFVerificaGerenciadorAtivo;

  vCapituraRetorno := sTEFRetorno;

  obTransTef.getTefNaoConfirmado;
  obTransTef.First;
  if not obTransTef.dataset.IsEmpty then
  begin
    while not obTransTef.dataset.IsEmpty do
    begin

        sTEFValorTotal := obTransTef.dataSet.FieldByName('Valor').AsString;
        sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NsuTrans').AsString;
        sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').AsString;
        sTEFHoraTransacao := obTransTef.dataSet.FieldByName('Hora').AsString;
        sTEFNomeDaRede := obTransTef.dataSet.FieldByName('RedeTrans').AsString;
        sTEFDoctoVinculado := obTransTef.dataSet.FieldByName('DocVinculado').Value;
        sTEFFinalizacao := obTransTef.dataSet.FieldByName('Finalizacao').Value;
        sTEFRetorno := '0';

        Try
           sTEFValidandoTransTef := '1';
           if obTransTef.dataSet.FieldByName('TipoConfirmacao').Value = 'CNF' then
               TEFGravaOperacao('CNF')
           else
           if obTransTef.dataSet.FieldByName('TipoConfirmacao').Value = 'NCN' then
               TEFGravaOperacao('NCN');

        finally
           sTEFValidandoTransTef := '0';
        end;

        if sTEFRetorno = '0' then
        begin
           obTransTef.delete;
           obTransTef.Apply;
           obTransTef.CommitaTransacao;
        end;

    end;
  end;

  sTEFRetorno := vCapituraRetorno;
end;

{TEFVerificaTEFTmp}

// ---< Verifica se existe o arquivo TEFParam e cria se necessário >---

procedure TTEFDedicado.TEFVerificaTEFParam;
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

procedure TTEFDedicado.TEFProximoNSU;
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

procedure TTEFDedicado.VerificaTefImp;
begin
  if FileExists(sTEFKoneKPath + 'Tef.IMP') then
  begin
    CopyFile(Pchar(sTEFKoneKPath + 'TEF.Imp'), Pchar(sTEFKoneKPath + 'ANT' +
      StrZero(vQtdeCartao, 3) + '.IMP'), true);
    DeleteFile(sTEFKoneKPath + 'TEF.Imp');
  end;

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
      obTransTef.dataSet.FieldByName('DocVinculado').value := sTEFDoctoVinculado;
      obTransTef.dataSet.FieldByName('Finalizacao').value := sTEFFinalizacao;
      obTransTef.dataSet.FieldByName('TefNaoConfirmado').AsInteger := 0;
      //cielo
//      obTransTef.dataSet.FieldByName('TipoConfirmacao').value := 'CNF';
      obTransTef.dataSet.FieldByName('TipoConfirmacao').value := 'NCN';
      obTransTef.Post;
      obTransTef.Apply;
      obTransTef.CommitaTransacao;
    end;
    //    if sTEFRetorno = '0' then
    //      TEFFechaOperacao;
  end;
end;

function TTEFDedicado.voltarParaPrimeiroArquivo: boolean;
begin
  Result := vVoltaImpPrimeiroArq;
end;

{TEFProximoNSU}

// ---< Cria o arquivo IntPos.tmp para receber comandos >---

procedure TTEFDedicado.TEFCriaArquivoREQIntPos001;
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

procedure TTEFDedicado.TEFVerificaOperacaoPendente;
var
  aArquivo: TextFile;
begin

  sTEFRetorno := '0';

  vMensagemNSUTrasancao := #13;

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
      TEFVerificaTEFTmp('N');   //verifica se existe, e se tem conteúdo o arquivo IntPos.001 dentro resp/IntPos.001;
      if (sTEFRetorno = '0') and {(sTEFOperacao = 'CRT') and } (sTEFNSUTransacao <> '') and (sTEFNSUTransacao <> '0') then
      begin
        //TEFNaoConfirmaOperacao;  = grava um IntPos.001 como NCN (não confirmado), fazendo assim o cancelamento o TeF.

        TEFVerificaGerenciadorAtivo;
        if (sTEFRetorno = '1') then
          Exit;
        if  Trim(sTEFNSUTransacao) <> '' then
          vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'NSU: ' + sTEFNSUTransacao + #13;
        TEFGravaOperacao('CNF');
        if sTEFMsgConfirmacao = '0' then    //utilizado em caso de multiplos cartões para não imprimir a msg 2 vezes.
        begin
           vMensagemNSUTrasancao := vMensagemNSUTrasancao + 'Para rede Cielo utilizar os 6 últimos dígitos';
           Application.MessageBox(pchar('Última transação foi confirmada. Favor reimprimir último cupom.'+vMensagemNSUTrasancao),'Confirmação',
           MB_ICONINFORMATION + MB_OK);
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

end; {TEFVerificaOperacaoPendente}

// ---< Verifica a integridade do arquivo resposta IntPos.Sts >---

procedure TTEFDedicado.TEFVerificaIntPosSts(sOperacao: string; iNSU: integer);
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
      Try
        Sleep(50); //PAUSA PARA NAO CARREGAR TODO O PROCESSAMENTO DA MAQUINA. CASO SEJA UM NUCLEO SOMENTE.
        Application.ProcessMessages;
      Except
      end;
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

procedure TTEFDedicado.TEFVerificaIntPos001(sOperacao: string; iNSU: integer);
var
  bRet: boolean;
  IntPos001, TEFParc: TextFile;
  //  sNomeArquivo, sLinha, sDoctoRet,sValorRet, sLinhas, sParcela : string;
  //  sRedeRet, sVencParcela, sValorParcela, sNSUParcela : string;
  sNomeArquivo, sLinha, sLinhas, sParcela: string;
  sVencParcela, sValorParcela, sNSUParcela: string;
  vflgnsu, iParcelas, i: integer;
  vValor1, vValor2, vValor3: Extended;
  vTemp, vPathLog, vFileLog: string;
  logText: TStrings;
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
        Sleep(50); //PAUSA PARA NAO CARREGAR TODO O PROCESSAMENTO DA MAQUINA. CASO SEJA UM NUCLEO SOMENTE.
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
            sTEFCodAutorizacao := RightFromPos(sLinha, 11)
          else if (Copy(Trim(sLinha), 1, 7) = '521-001') and (Trim(sTEFCodAutorizacao) = '') then
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
          if Copy(Trim(sLinha), 1, 7) = '028-000  ' then
            sLinhas := RightFromPos(sLinha, 11);

          if Copy(Trim(sLinha), 1, 7) = '028-001' then
            sTEFMarcadoRecorte := RightFromPos(sLinha, 11)

          else if Copy(Trim(sLinha), 1, 7) = '030-000' then
            sTEFMensOperador := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '031-000' then
            sTEFMensCliente := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '032-000' then
            sTEFAutenticacao := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '033-000' then
            sTEFBanco := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '034-000' then
            sTEFAgencia := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '035-000' then
            sTEFAgenciaDC := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '036-000' then
            sTEFCtaCorrente := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '037-000' then
            sTEFCtaCorrenteDC := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '038-000' then
            sTEFNumCheque := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '039-000' then
            sTEFNumChequeDC := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '040-000' then
            sTEFAdministradora := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '053-000' then
            sTEFIdPSP := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '200-000' then
            sTEFValorSaque := RightFromPos(sLinha, 11)

          else if Copy(Trim(sLinha), 1, 7) = '210-081' then
          begin
            vTemp := StringReplace(Trim(sTEFValorTotal), ',', '', [rfReplaceAll]);
            vTemp := StringReplace(Trim(vTemp), '.', '', [rfReplaceAll]);
            vTemp := StringReplace(Trim(vTemp), ' ', '', [rfReplaceAll]);
            try
              vValor1 := StrToInt(vTemp) / 100;
            except
            end;

            vTemp := RightFromPos(sLinha, 11);
            vTemp := StringReplace(Trim(vTemp), ',', '', [rfReplaceAll]);
            vTemp := StringReplace(Trim(vTemp), '.', '', [rfReplaceAll]);
            vTemp := StringReplace(Trim(vTemp), ' ', '', [rfReplaceAll]);
            try
              vValor2 := StrToInt(vTemp) / 100;
            except
            end;

            try
              sTEFValorDesconto := Format('%0.2f', [(vValor1 - vValor2)]);
              sTEFValorDesconto := StringReplace(sTEFValorDesconto, '.', ',', [rfReplaceAll])
            except
            end;
          end
          else
          if Copy(Trim(sLinha), 1, 7) = '504-000' then
            sTEFIdCartDigital := RightFromPos(sLinha, 11)
          else if Copy(Trim(sLinha), 1, 7) = '504-001' then
            sTEFNomeCartDigital := RightFromPos(sLinha, 11);

          //            Application.ProcessMessages;
        until EOF(IntPos001);
    end
    else
      sTEFRetorno := '1';

    CloseFile(IntPos001);

    /// Aqui o sistema ira gravar a transacao no arquivo de bkp da forma de pagamento
    gravaNSUnoBkpFormpagamento;

    /// Aqui registra no banco quando  configurado
    if IniConf.ReadStr('TEF', 'RegistrarTransacoes', 'N') = 'S' then
      if (sOperacao = 'CRT') or (sOperacao = OP_CARTDIGI) or (sOperacao = 'CNC') then
        registrarDadosTransacao;

    if Assigned(FOnLogRESP) then
    begin
      logText := NewStringList('');
      try
        logText.LoadFromFile(sNomeArquivo);
        FOnLogRESP(logText.Text);
      finally
        logText.Free;
      end;
    end;

    if IniConf.ReadStr('TEF', 'SaveLog', 'N') = 'S' then
    begin
      vPathLog := IniConf.ReadStr('TEF', 'PathLog', 'C:\BasesAuto\TEF\Log\');
      if DirectoryExists(vPathLog) then
      begin
        vFileLog := StrZero(sTEFDoctoVinculado, 6);
        vFileLog := 'Resp_IntPos_' + vFileLog + '_' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + '.001';
        vFileLog := StringReplace(vFileLog, '/', '', [rfReplaceAll, rfIgnoreCase]);
        vFileLog := StringReplace(vFileLog, ':', '', [rfReplaceAll, rfIgnoreCase]);
        vFileLog := StringReplace(vFileLog, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
        vFileLog := vPathLog + '\' + vFileLog;
        CopyFile(Pchar(sNomeArquivo), Pchar(vFileLog), False);
      end;
    end;

    Screen.Cursor := crDefault;

    if Trim(sTEFMensOperador) <> '' then
    begin
      if sTEFDoctoVinculado <> '' then
        sDoctoRet := 'Docto No: ' + Trim(sTEFDoctoVinculado);

      if sTEFValorTotal <> '' then
      begin
        delete(sTEFValorTotal, pos(',', sTEFValorTotal), 1);
        sValorRet := 'Valor: ' + format('%n', [(StrToInt(sTEFValorTotal) / 100)]);
      end;

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
          if ((Trim(sLinhas) = '') or (Trim(sLinhas) = '0')) and (Trim(sTEFMarcadoRecorte) = '0')  then
          begin
            Application.MessageBox(pchar(sTEFMensOperador),'Atenção',0+64);
            vmens := '0';
          end
          else
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

procedure TTEFDedicado.TEFGravaOperacao(sOperacao: string);
var
  bRet: boolean;
  IntPosTmp, IntPos001: TextFile;
  sLinha, vFileLog, vPathLog: string;
  logText: TStrings;
  itx: integer;
begin
  sTEFRetorno := '0';

  try

    TEFCriaArquivoREQIntPos001;  //apenas cria (em branco) o arquivo Intpos.001.    cria TMP

    if sTEFRetorno = '0' then
    begin

      if (sOperacao = 'CNF') or (sOperacao = 'NCN') then
      begin

         if sTEFValidandoTransTef = '0' then  // JPaulo.
         begin

            TEFVerificaTEFTmp('S');   //verifica se existem Intpos.001 no Resp
            if sTEFRetorno = '0' then
            begin
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

         end;  // se falidandoTranstef

      end;

      AssignFile(IntPosTmp, sTEFPath + 'REQ\IntPos.tmp');
      Append(IntPosTmp);
      TEFProximoNSU();

      WriteLn(IntPosTmp, ('000-000 = ' + sOperacao));
      WriteLn(IntPosTmp, ('001-000 = ' + IntToStr(iTEFProximoNSU)));

      if (sOperacao = 'CHQ') or
        (sOperacao = 'CRT') or
        (sOperacao = OP_CARTDIGI) or
        (sOperacao = 'CNC') or
        (sOperacao = 'CNF') or
        (sOperacao = 'NCN') then
        if Trim(sTEFDoctoVinculado) <> '' then
          WriteLn(IntPosTmp, ('002-000 = ' + sTEFDoctoVinculado));

      if (sOperacao = 'CHQ') or
        (sOperacao = 'CRT') or
        (sOperacao = OP_CARTDIGI) or
        (sOperacao = 'CNC') then
        if Trim(sTEFValorTotal) <> '' then
          WriteLn(IntPosTmp, ('003-000 = ' + sTEFValorTotal));

      if (sOperacao = 'CRT') or
        (sOperacao = OP_CARTDIGI)  then
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

      if (sOperacao = 'CNF') or (sOperacao = 'NCN') then
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

      if (sOperacao = OP_CARTDIGI) then
      begin
        if Trim(sTEFIdPSPREQ) <> '' then
          WriteLn(IntPosTmp, '053-000 = ' + Trim(sTEFIdPSPREQ));
      end;

//      if (sOperacao = 'CRT') then
//        WriteLn(IntPosTmp, '777-000 = TESTE REDECARD');

//      if (sOperacao = 'ADM') then
//         WriteLn(IntPosTmp, ('501-001 = ' + '111111111111111111111111111111111111111111111111111111111111' ));
//                                              10     |         |         |         |         |         |

      if IniConf.ReadStr('TEF', 'SW', '') = 'CAPPTA' then
      begin
        if (sOperacao = 'CRT') or (sOperacao = OP_CARTDIGI) or (sOperacao = 'CNF') or (sOperacao = 'CNC') or (sOperacao = 'NCN') then
        begin
          WriteLn(IntPosTmp, '701-000 - Fiscal');
          WriteLn(IntPosTmp, '716-000 - HW SISTEMAS E COMPUTADORES LTDA');
          WriteLn(IntPosTmp, '736-000 - 4.1.1');
        end;
      end
      else
      if (sOperacao = 'CRT') or (sOperacao = OP_CARTDIGI) then
      begin
        WriteLn(IntPosTmp, '210-084 = ' + Copy(sTEFSHouse, 1, 8) + '10');

        if (sOperacao = OP_CARTDIGI) then
        begin
          if sTEFHabIdCartDigital <> '' then
            WriteLn(IntPosTmp, '610-001 = ' + sTEFHabIdCartDigital);
          //WriteLn(IntPosTmp, '610-002 = 00600012');
          //WriteLn(IntPosTmp, '610-003 = 00290006');
          //WriteLn(IntPosTmp, '610-004 = 00650013');

          WriteLn(IntPosTmp, '701-000 = 0');
        end;
        WriteLn(IntPosTmp, '701-034 = 4');
      end;

      WriteLn(IntPosTmp, '999-999 = 0');
      CloseFile(IntPosTmp);

      if IniConf.ReadStr('TEF', 'SaveLogReq', 'N') = 'S' then
      begin
        vPathLog := IniConf.ReadStr('TEF', 'PathLog', 'C:\BasesAuto\TEF\Log\');
        if DirectoryExists(vPathLog) then
        begin
          vFileLog := StrZero(sTEFDoctoVinculado, 6);
          vFileLog := 'Req_IntPos_' + vFileLog + '_' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + '.001';
          vFileLog := StringReplace(vFileLog, '/', '', [rfReplaceAll, rfIgnoreCase]);
          vFileLog := StringReplace(vFileLog, ':', '', [rfReplaceAll, rfIgnoreCase]);
          vFileLog := StringReplace(vFileLog, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
          vFileLog := vPathLog + '\' + vFileLog;
          CopyFile(Pchar(sTEFPath + 'REQ\IntPos.tmp'), Pchar(vFileLog), False);
        end;
      end;

      if Assigned(FOnLogREQ) then
      begin
        logText := NewStringList('');
        try
          logText.LoadFromFile(sTEFPath + 'REQ\IntPos.tmp');
          FOnLogREQ(logText.Text);
        finally
          logText.Free;
        end;
      end;

      //if IniConf.ReadStr('TEF', 'TSPLUS', '') = 'S' then
      RenameFile(Pchar(sTEFPath + 'REQ\IntPos.tmp'), Pchar(sTEFPath + 'REQ\IntPos.001'));
      {
        bRet := CopyFile(Pchar(sTEFPath + 'REQ\IntPos.tmp'), Pchar(sTEFPath + 'REQ\IntPos.001'), true);
      }
      DeleteFile(sTEFPath + 'REQ\IntPos.tmp');

      // ---> Verifica se houve resposta do GP

      TEFVerificaIntPosSts(sOperacao, iTEFProximoNSU);

      // JPaulo.
      // Se não confirmar o Sts de um CNF , deve gerar um transtef pra confirmação futura.
      try
        if ((sOperacao = 'CNF') or (sOperacao = 'NCN')) and (sTEFRetorno <> '0') then
        begin
          //obTransTef.getTodos;
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
              obTransTef.dataSet.FieldByName('DocVinculado').value := sTEFDoctoVinculado;
              obTransTef.dataSet.FieldByName('Finalizacao').value := sTEFFinalizacao;
              obTransTef.dataSet.FieldByName('TefNaoConfirmado').value := '1';

              if sOperacao = 'CNF' then
                 obTransTef.dataSet.FieldByName('TipoConfirmacao').value := 'CNF'
              else
              if sOperacao = 'NCN' then
                 obTransTef.dataSet.FieldByName('TipoConfirmacao').value := 'NCN';

              obTransTef.Post;
              obTransTef.Apply;
              obTransTef.CommitaTransacao;
            end;
          end
          else
          begin
            obTransTef.Edit;
            obTransTef.dataSet.FieldByName('TefNaoConfirmado').value := '1';
            if sOperacao = 'CNF' then
               obTransTef.dataSet.FieldByName('TipoConfirmacao').value := 'CNF'
            else
            if sOperacao = 'NCN' then
               obTransTef.dataSet.FieldByName('TipoConfirmacao').value := 'NCN';
            obTransTef.Post;
            obTransTef.Apply;
            obTransTef.CommitaTransacao;
          end;

          if FileExists(sTEFPath + 'REQ\IntPos.001') then
             DeleteFile(sTEFPath + 'REQ\IntPos.001');

        end;
      except
      end;

      // ---> Verifica arquivo de retorno do GP
      if (sTEFRetorno = '0') and
        ((sOperacao = 'ADM') or
        (sOperacao = 'CHQ') or
        (sOperacao = 'CRT') or
        (sOperacao = OP_CARTDIGI) or
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

procedure TTEFDedicado.TEFImprimeTransacao;
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

procedure TTEFDedicado.TEFConfirmaOperacao;
var
  IntPos001, TEFImp: TextFile;
  sLinha: string;
  vTemp: string;
  vTemp1: string;
  vTempFinal: string;
  vReimpressao : Integer;
  vTerminarTefImp : Integer;
  vv : String;
  vImpressaoReduzida, vViaLojista: TStringList;
  vUsImpReduzida: Boolean;
  strvia1, strvia2: string;
begin

  vReimpressao := 0;
  sTEFRetorno := '0';

  vUsImpReduzida := IniConf.ReadStr('TEF', 'ComprovanteReduzido', 'N') = 'S';
  if vUsImpReduzida then
  begin
    vImpressaoReduzida := TStringList.Create;
    vImpressaoReduzida.Clear;
    vViaLojista := TStringList.Create;
    vViaLojista.Clear;
  end;

  try
    TEFVerificaTEFTmp('S');

    vTemp :='';
    vTemp1:=sTEFMarcadoRecorte;
    vTempFinal:='';
    while POS(':',vTemp1)>0 do
    BEGIN
      vTemp := StrZero(Copy(vTemp1,1,POS(':',vTemp1)-1),3);
      vTempFinal := vTempFinal+vTemp+ ':';
      vTemp1:=Copy(vTemp1,POS(':',vTemp1)+1, Length(vTemp1));
    end;
    sTEFMarcadoRecorte := vTempFinal + StrZero(vTemp1,3);

    if sTEFRetorno = '0' then
    begin
      AssignFile(IntPos001, sTEFPath + 'RESP\IntPos.001');
      Reset(IntPos001);
      AssignFile(TEFImp, sTEFKoneKPath + 'TEF.Imp');
      Rewrite(TEFImp);

      repeat
        ReadLn(IntPos001, sLinha);

        if pos ('REIMPRESSAO', UpperCase ( StringReplace(sLinha,' ','',[rfReplaceAll,rfIgnoreCase]) ) ) > 0 then
           vReimpressao := 1;

        if (Copy(Trim(sLinha), 1, 3) = '711') and ( Pos( Copy(Trim(sLinha),5,3),sTEFMarcadoRecorte )=0 ) then
          vImpressaoReduzida.Add( RemoveAspas(RightFromPos(sLinha, 11)) );

        if (Copy(Trim(sLinha), 1, 3) = '715') and ( Pos( Copy(Trim(sLinha),5,3),sTEFMarcadoRecorte )=0 ) then
          vViaLojista.Add( RemoveAspas(RightFromPos(sLinha, 11)) );

        if (Copy(Trim(sLinha), 1, 3) = '029') and ( Pos( Copy(Trim(sLinha),5,3),sTEFMarcadoRecorte )=0 ) then
           WriteLn(TEFImp, RemoveAspas(RightFromPos(sLinha, 11)))
        else

        if (Copy(Trim(sLinha), 1, 3) = '029') and ( Pos( Copy(Trim(sLinha),5,3),sTEFMarcadoRecorte )>0 ) then
        begin
          WriteLn(TEFImp, RemoveAspas(RightFromPos(sLinha, 11)));

          if (vReimpressao = 1) and (vDadosIni.vImprimirUnicaViaReimpressao = 'S') then
             Break
          else
          begin
//            WriteLn(TEFImp, RemoveAspas('  '));
//            WriteLn(TEFImp, RemoveAspas('--RECORTE PAPEL'));
//            WriteLn(TEFImp, RemoveAspas('  '));
          end;

        end;
        //Application.ProcessMessages;
      until ( EOF(IntPos001)) ;


      Close(IntPos001);
      Close(TEFImp);

      TEFObterDadosImpressao;

      if ((vUsImpReduzida) and (vImpressaoReduzida.Count > 0) and (vViaLojista.Count > 0) and (vOPADM = '')) then
      begin
        strvia1 := vImpressaoReduzida.Text;
        strvia2 := vViaLojista.Text;
        vImpressaoReduzida.Add('');
        vImpressaoReduzida.Add('');
        vViaLojista.Add('');
        vImpressaoReduzida.Text := vImpressaoReduzida.Text + vViaLojista.Text;
        vImpressaoReduzida.SaveToFile(sTEFKoneKPath + 'TEF.Imp');
      end;
      {
      if (FileExists(sTEFKoneKPath + 'TEF.Imp')) then
      begin
        try vDadosIni.vPOSV.vLinhasImpressao := TStringList.Create; except end;
        try vDadosIni.vPOSV.vLinhasImpressao.LoadFromFile(sTEFKoneKPath + 'TEF.Imp'); except end;
      end;
      }

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

procedure TTEFDedicado.TEFNaoConfirmaOperacao;
var
  IntPos001: TextFile;
  sLinha, sDocto, sValor, sRede, sTextoValor: string;
begin

  sTEFRetorno := '0';


  //TEFVerificaGerenciadorAtivo; JPaulo.

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
        sTEFPath := getPathTEF;
      end
      else
      begin
        iTEFTecban := 0;
        sTEFPath := getPathTEF;
      end;
      //
      if sValor <> '' then
      begin
        delete(sValor, pos(',', sValor), 1);
        sTextoValor := 'Valor:' + format('%n', [(StrToInt(sValor) / 100)])
        //FloatToStr(StrToInt(sValor)/100)
      end
      else
        sTextoValor := '';
      //        if sRede = 'VISA' then                  |
      //         vvisa:=sRede;
      //        else
      //         vvisa:='';


      //TEFVerificaGerenciadorAtivo;  JPaulo.

      TEFGravaOperacao('NCN');
      if sTEFMsgCancelamento = '0' then
         Application.MessageBox('Transação não efetuada. Favor reter o Cupom.','Confirmação',
         MB_ICONINFORMATION + MB_OK);



      {TEFMensagem('Cancelada a transação:', ('Doc No: ' + Trim(sDocto)), ('Rede: ' + Trim(sRede)),
        sTextoValor);
      }
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

procedure TTEFDedicado.TEFVerificaGerenciadorAtivo;
var
  Ativo001: TextFile;
  iRet: integer;
  sLinha: string;
  hdd: THandle;
begin

  sTEFRetorno := '0';
  try

    Screen.Cursor := crHourGlass;

    if not DirectoryExists(sTEFKoneKPath) then
      CreateDir(sTEFKoneKPath);
    //    TEFVerificaArquivosPendentesVND;


    TEFGravaOperacao('ATV');
//    if sTEFRetorno <> '0' then
//       ShowMessage('Erro de Comunicação – Client SiTef. Favor Ativá-lo.');

    if sTEFRetorno <> '0' then
    begin
      try
        if IniConf.ReadStr('TEF', 'TSPLUS', '') = 'S' then
          ShowMessage('Aplicativo do TEF não está ativo ou não está respondendo' + sLineBreak + sLineBreak +
                      'Por favor se ele estiver travado, force o encerramento dele e o inicie novamente' + sLineBreak + sLineBreak +
                      'Você vai encontrar o aplicativo em: ' + sLineBreak + sLineBreak +
                      getFileTEF + sLineBreak + sLineBreak +
                      'Clique no OK apenas após o inicio do Aplicativo TEF')
        else
        if IniConf.ReadStr('TEF', 'AtivarGPAuto', 'S') = 'N' then
        begin
          if IniConf.ReadStr('TEF', 'SW', '') = 'CAPPTA' then
            ShowMessage('TEF Cappta não está ativo')
          else if IniConf.ReadStr('TEF', 'SW', '') = '' then
            ShowMessage('TEF não está ativo');
          sTEFRetorno := '1';
          forcaFocoNoSistema(Application.Handle);
          Exit;
        end
        else
        if pos('CLIENTSITEF.EXE', UpperCase(getFileTEF)) = 0 then
          ShowMessage('Gerenciador Padrão não está ativo e será ativado automaticamente.')
        else
          ShowMessage('Cliente SiTef não está ativo e será ativado automaticamente.');

        if FindWindow(nil, 'Client SiTef - Modular') > 0 then
           PostMessage(FindWindow(nil, 'Client SiTef - Modular'), WM_CLOSE, 0,0);

//        iRet := WinExec(pChar('C:\Client\ClientSitef.exe'), SW_NORMAL);
//        CreateProcessSimple('C:\Client\ClientSitef.exe');

        ShellExecute(hdd, nil, pchar(getFileTEF ), '', pchar(getPathTEF),SW_HIDE);

        Sleep( StrToInt(vDadosIni.vTempoEsperaCLientSitef) * 1000);
        TEFGravaOperacao('ATV');

        if sTEFRetorno <> '0' then
        begin
          application.messageBox(pchar('Não houve resposta do Cliente SiTef, será feita uma nova tentativa, aguarde!'),'Atenção',
          MB_ICONQUESTION + MB_OK);
          TEFGravaOperacao('ATV');
        end;

        if sTEFRetorno <> '0' then
          application.messageBox(pchar('Não houve resposta do Cliente SiTef, verificar possíveis problemas de instalação.'),'Atenção',
          MB_ICONQUESTION + MB_OK);

        forcaFocoNoSistema(Application.Handle);
      except
        on E: Exception do
        begin
          ShowMessage('Cliente SiTef não foi ativado...');
          sTEFRetorno := '1';
          Exit;
        end;
      end;
    end;

//    while sTEFRetorno <> '0' do
//     begin
//       ShowMessage('Erro de Comunicação – Client SiTef. Favor Ativá-lo.');
//       TEFGravaOperacao('ATV');
//     end;



{    if sTEFRetorno <> '0' then
    begin
      try
        //ShowMessage('Gerenciador Padrão não está ativo e será ativado automaticamente');
        ShowMessage('Erro de Comunicação – Client SiTef. Favor Ativa-ló.');
        //if iTEFTecban = 0 then
          //          iRet := WinExec(pChar('C:\TEF_DIAL\TEF_DIAL.EXE'), SW_HIDE)    //10/06/2008
          //iRet := WinExec(pChar('C:\Client\ClientSitef.exe'), SW_NORMAL)
          //CreateProcessSimple('C:\Client\ClientSitef.exe');
        //else
          //iRet := WinExec(pChar('C:\Client\ClientSitef.exe'), SW_NORMAL);

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
}
  forcaFocoNoSistema(Application.Handle)
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

procedure TTEFDedicado.TEFModoAdministrativo;
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

procedure TTEFDedicado.TEFObterDadosImpressao;
var
  impressao: TStrings;
  I: Integer;
begin
  if not FileExists(sTEFPath + 'RESP\IntPos.001') then
    Exit;

  impressao := TStringList.Create();
  try
    try vDadosIni.vPOSV.vLinhasImpressao := TStringList.Create; except end;
    try
      vDadosIni.vPOSV.vLinhasImpressao.Clear;

      impressao.LoadFromFile(sTEFPath + 'RESP\IntPos.001');
      if IniConf.ReadStr('TEF', 'SW', '') = 'CAPPTA' then
      begin
        for I := 0 to impressao.Count - 1 do
          if StartsStr('028-', impressao[I]) or
             StartsStr('029-', impressao[I]) or
             StartsStr('710-', impressao[I]) or
             StartsStr('711-', impressao[I]) or
             StartsStr('712-', impressao[I]) or
             StartsStr('713-', impressao[I]) or
             StartsStr('714-', impressao[I]) or
             StartsStr('715-', impressao[I]) then
            vDadosIni.vPOSV.vLinhasImpressao.Add(impressao[I]);
      end
      else
        for I := 0 to impressao.Count - 1 do
          if StartsStr('028-', impressao[I]) or StartsStr('029-', impressao[I]) then
            vDadosIni.vPOSV.vLinhasImpressao.Add(impressao[I]);
    except
    end;

  finally
    impressao.Free;
  end;
end;

// ---< Executa pedido de autorização para transação por meio de cartão >---

procedure TTEFDedicado.TEFPedidoAutorizacaoCartao;
begin

  sTEFRetorno := '0';
  try

    TEFVerificaGerenciadorAtivo;
    if sTEFRetorno <> '0' then
       exit;

    if sTEFRetorno = '0' then
      TEFGravaOperacao('CRT');

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end;

procedure TTEFDedicado.TEFPedidoAutorizacaoCarteirasDigitais;
begin

  sTEFRetorno := '0';
  try

    TEFVerificaGerenciadorAtivo;
    if sTEFRetorno <> '0' then
       exit;

    if sTEFRetorno = '0' then
      TEFGravaOperacao(OP_CARTDIGI);

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end;

{TEFPedidoAutorizacaoCartao}

// ---< Executa pedido de autorização para transação por meio de cheque >---

procedure TTEFDedicado.TEFPedidoAutorizacaoCheque;
begin

  sTEFRetorno := '0';

  try
    TEFVerificaGerenciadorAtivo;
    if sTEFRetorno <> '0' then
       exit;

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

procedure TTEFDedicado.TEFVendaCartao;
begin

  sTEFRetorno := '0';

  try
    TEFPedidoAutorizacaoCartao;
    if sTEFRetorno <> '0' then
       exit;

    if sTEFRetorno = '0' then
      TEFConfirmaOperacao;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end;

procedure TTEFDedicado.TEFVendaCarteirasDigitais;
begin

  sTEFRetorno := '0';

  try
    TEFPedidoAutorizacaoCarteirasDigitais;
    if sTEFRetorno <> '0' then
       exit;

    if sTEFRetorno = '0' then
      TEFConfirmaOperacao;

  except
    on E: Exception do
    begin
      sTEFRetorno := '1';
      Exit;
    end;
  end;

end;

{TEFVendaCartao}

// ---< Executa a venda por meio de cheque >---

procedure TTEFDedicado.TEFVendaCheque;
begin

  sTEFRetorno := '0';

  try
    TEFPedidoAutorizacaoCheque;
    if sTEFRetorno <> '0' then
       exit;

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

procedure TTEFDedicado.cancelaBKP;
begin
  TEFMensagemC(msgOp);
end;

function TTEFDedicado.cancelaOperacoesAnteriores(impressora: TImpressoraF): boolean;
var
  imp: TImpressoraF;
  iimp: integer;
  vMensagemConfirmacao : Integer;
begin

  vMensagemConfirmacao := 0;
  sTEFValidandoTransTef := '0';

  TEFVerificaGerenciadorAtivo;
  //  if sTEFRetorno <> '0' then
  //     exit;

  if  impressora <> nil then
  begin
  impressora.vErroTEF := 'S';
  impressora.FechaComprovanteNaoFiscalVinculadoTEF;
  impressora.vErroTEF := 'S';
  impressora.FechaRelatorioGerencialTEF;
  impressora.vErroTEF := '';
  end;
  if sTEFNomeDaRede = 'TECBAN' then
  begin
    iTEFTecban := 1;
    sTEFPath := getPathTEF;
  end
  else
  begin
    iTEFTecban := 0;
    sTEFPath := getPathTEF;
  end;

  obTransTef.getTodos;
  if not obTransTef.Dataset.IsEmpty then
  begin
    if vQtdeCartao > 1 then
    begin
      TEFGravaOperacao('NCN');
      if sTEFRetorno = '0' then
        vMensagemConfirmacao := 1;
    end;

      //Application.MessageBox(pchar('Existem Transações TEF Pendentes para cancelamento'),
      //'Informação', MB_ICONINFORMATION + mb_OK);

      while not obTransTef.Dataset.Eof do
      begin

          sTEFValorTotal := obTransTef.dataSet.FieldByName('Valor').AsString;
          sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NsuTrans').AsString;
          sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').AsString;
          sTEFHoraTransacao := obTransTef.dataSet.FieldByName('Hora').AsString;
          sTEFNomeDaRede := obTransTef.dataSet.FieldByName('RedeTrans').AsString;
          sTEFDoctoVinculado := obTransTef.dataSet.FieldByName('DocVinculado').Value;
          sTEFFinalizacao := obTransTef.dataSet.FieldByName('Finalizacao').Value;

          if impressora <> nil then
          begin
          imp := TImpressoraF(impressora);
          impressora.vErroTEF := 'S';
          impressora.FechaComprovanteNaoFiscalVinculadoTEF;
          impressora.vErroTEF := 'S';
          impressora.FechaRelatorioGerencialTEF;
          impressora.vErroTEF := '';
          end;

          sTEFRetorno := '0';

          Try
             sTEFValidandoTransTef := '1';
             TEFGravaOperacao('NCN');
          finally
             sTEFValidandoTransTef := '0';
          end;

          if sTEFRetorno = '0' then
          begin
             obTransTef.delete;
             obTransTef.Apply;
             obTransTef.CommitaTransacao;
          end
          else
             obTransTef.Next;
      end;

      if sTEFRetorno = '0' then
        vMensagemConfirmacao := 1;
  end
  else
  begin
    /// Joao pedro. Coloquei este bloco dentro do else, pois se existir transtef
    ///  esta funcao nao funciona pois as variavis ja foram setadas acimas e foram
    ///  enviadas NCN para elas
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
      TEFVerificaTEFTmp('N');   //verifica se existe, e se tem conteúdo o arquivo IntPos.001 dentro resp/IntPos.001;
    end;

    if sTEFRetorno = '0' then
      TEFGravaOperacao('NCN');
    if sTEFRetorno = '0' then
      vMensagemConfirmacao := 1;

  end;

  if sTEFRetorno = '0' then
    if FileExists(sTEFKoneKPath + 'IntPos.001') then
    begin
      try
        DeleteFile(sTEFKoneKPath + 'IntPos.001');
      except
      end;
    end;

  if vMensagemConfirmacao = 1 then
      Application.MessageBox('Transação não efetuada. Favor reter o Cupom.','Confirmação',
        MB_ICONINFORMATION + MB_OK);


//    if Cancela_Ant(imp, sTEFKoneKPath + 'TEF.Imp') then
//    begin4
//      obTransTef.delete;
//      obTransTef.Apply;
//      obTransTef.CommitaTransacao;
//    end
//    else
//    begin
//      if vmens = '1' then
//      begin
//        TEFMensagemC(sTEFMensOperador);
//        vmens := '0';
//      end;
//    end;

//end;  {fecha o while do transtef.^}

  try
    DeleteFilesImp;
  finally
    limpaVariaveis;
  end;
  {
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
  }
  vQtdeCartao := 0;
end;

function TTEFDedicado.cancela_ant(impressora: TImpressoraF; pathArquivo: string): boolean;
var
  imp: TImpressoraF;
begin

  if sTEFNomeDaRede = 'TECBAN' then
  begin
    iTEFTecban := 1;
    sTEFPath := getPathTEF;
  end
  else
  begin
    iTEFTecban := 0;
    sTEFPath := getPathTEF;
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

function TTEFDedicado.ConfirmacaoReimpressao(impressora: TImpressoraF;
  gerencial: boolean): boolean;
var
  vretorno: Integer;
begin
  Result := true;
  reimprimeGerencial := 0;
  BlockInput(False);
  forcaFocoNoSistema(Application.Handle);
  if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'), 'Confirmação',
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
        if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
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
        if Application.MessageBox(pchar('Impressora não responde. Tentar imprimir novamente?'),
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

constructor TTEFDedicado.create;
begin
  inherited;
  obTransTef := TtransTef.Create;
  TEFLimpaVariaveis;
  {$IFDEF VER180} vDadosIni := TSingleton.GetInstance;  {$ENDIF}
  iTEFTempoEspera := 15;
  iTEFTempoMensagem := 5;
  iTEFProximoNSU := 0;
  iTEFTecban := 0;
  vQtdeCartao := 0;
  vmsgErroImpressora := 'Impressora não responde. Tentar imprimir novamente?';

  sTEFPath := getPathTEF;
  sTEFKoneKPath := 'C:\KoneKTEF\';
  vOPADM := '';
  {$IFDEF VER180}
  {
  if not obTransTef.buscas.Database.Connected then
    if Trim(obTransTef.buscas.Database.DatabaseName) <> Trim(vDadosIni.vBancoFiscal) then
      obTransTef.buscas.Database.DatabaseName := vDadosIni.vBancoFiscal;
  }
  {$ENDIF}
end;

function TTEFDedicado.CreateProcessSimple(cmd: string): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_SHOW;

  Result := CreateProcess(nil, PChar(cmd), nil, nil, false, CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS, nil, nil, SUInfo, ProcInfo);

  if (Result) then
  begin
    WaitForSingleObject(ProcInfo.hProcess, 0);
    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end;
end;


procedure TTEFDedicado.DeleteFilesImp;
var
  files: TStrings;
  iimp: Integer;
begin
  files := GetFileList(sTEFKoneKPath, '*.Imp');
  for iimp := 0 to files.Count - 1 do
    DeleteFile(sTEFKoneKPath + files[iimp]);
end;

function TTEFDedicado.CarteiraDigital(
  ndocVinculado, habCarteiraDigital, idPSP: string; value: Double): Boolean;
var
  temp: string;
begin
  sTEFPath := getPathTEF;

  Result := False;
  if not verificaConfirmacaoPendenteAntesNovaVenda then
    Exit;

  VerificaTefImp;
  TEFLimpaVariaveis;
  sTEFDoctoVinculado := ndocVinculado;
  sTEFValorTotal := ReplaceStr(Format('%0.2f', [value]), ',', '');
  sTEFHabIdCartDigital := habCarteiraDigital;

  sTEFMoeda := '1';
  iTEFTecban := Ord(snNAO);
  vDadosIni.vconsultaCheque := '0';

  TEFVendaCarteirasDigitais;

  if sTEFRetorno = '0' then
  begin
    result := True;
    inc(vQtdeCartao);
    vnometef[vqtdeCartao] := 'POSVIRTUAL';
    vvalorTef[vqtdeCartao] := strtofloat(trim(format('%10.2f', [getTEFValorTransacao]))) +
      getTEFValorSaque - getTEFValorDesconto;
    sTEFDoctoVinculado := StrZero(ndocVinculado, 6);
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

function TTEFDedicado.existeTransacaotransTef: boolean;
begin
  obTransTef.getTodos;
  Result := not obTransTef.dataSet.IsEmpty;
  obTransTef.Close;
end;

procedure TTEFDedicado.fechaOperacao;
begin
  TEFFechaOperacao;
  vTransParaConfirmar := false;
end;

function TTEFDedicado.finalizaOperacao(impressora: TImpressoraF): boolean;
var
  iimp: Integer;
  imp: TImpressoraF;
begin
   sTEFValidandoTransTef := '0';

  if ((iTEFTecban = 1) and (consulta = 1)) or ((iTEFTecban = 0) and (consulta = 1)) then
  begin
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

    //if vTransParaConfirmar then
    //  fechaOperacao;
    //TEFVerificaGerenciadorAtivo;

    if vTransParaConfirmar then
    begin
      obTransTef.getTodos;
      if not obTransTef.dataset.IsEmpty then
      begin
        while not obTransTef.dataset.Eof do
        begin

            sTEFDataTransacao := obTransTef.dataSet.FieldByName('DataTrans').value;
            sTEFDoctoVinculado := obTransTef.dataSet.FieldByName('DOCVINCULADO').Value;
            sTEFNomeDaRede := obTransTef.dataSet.FieldByName('REDETRANS').Value;
            sTEFNSUTransacao := obTransTef.dataSet.FieldByName('NSUTRANS').Value;
            sTEFFinalizacao := obTransTef.dataSet.FieldByName('FINALIZACAO').Value;
            sTEFRetorno := '0';

            Try
               sTEFValidandoTransTef := '1';
               Try
                  TEFGravaOperacao('CNF');
               Except
               end;
            finally
               sTEFValidandoTransTef := '0';
            end;

            if sTEFRetorno = '0' then
            begin
               obTransTef.delete;
               obTransTef.Apply;
               obTransTef.CommitaTransacao;
            end
            else
               obTransTef.Next;

        end;
        //fechaOperacao;
        if vQtdeCartao > 1 then
        begin
          sTEFValidandoTransTef := '0';
          TEFGravaOperacao('CNF');
          if (sTEFRetorno = '0') and (FileExists(sTEFKoneKPath + 'TEF.Imp')) then
            DeleteFile(sTEFKoneKPath + 'TEF.Imp');
        end;
      end
      else
      begin
          //fechaOperacao;
          sTEFValidandoTransTef := '0';
          TEFGravaOperacao('CNF');
          if (sTEFRetorno = '0') and (FileExists(sTEFKoneKPath + 'TEF.Imp')) then
            DeleteFile(sTEFKoneKPath + 'TEF.Imp');

      end;
    end;

//    obTransTef.getTodos;
//    while not obTransTef.IsEmpty do
//      obTransTef.Delete;
//    obTransTef.Apply;
//    obTransTef.CommitaTransacao;
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
      if imp <> nil then
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
  DeleteFilesImp;
  {
  Application.CreateForm(tfrmFileList, frmFileList);
  frmFileList.FileListBox1.Mask := '*.Imp';
  frmFileList.FileListBox1.Directory := sTEFKoneKPath;
  frmFileList.FileListBox1.Refresh;
  for iimp := 0 to frmFileList.FileListBox1.Items.Count - 1 do
    DeleteFile(sTEFKoneKPath + frmFileList.FileListBox1.Items.Strings[iimp]);
  frmFileList.free;
  frmFileList := nil;
  }
  consulta :=0;
end;

function TTEFDedicado.forcaFocoNoSistema(hwnd: THandle): Boolean;
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

function TTEFDedicado.gerenciamentoImpressaoTEF(impressora: TImpressoraF;
  gerencial: boolean; pathArquivo: string): boolean;
var
  vret: integer;
  imp: Timpressoraf;
begin
  try
  sTEFRetorno := '0';
  setVoltarParaPrimeiroArquivo(False);
  while not Impressora.AbrePortaS('') do
  begin
    impressora.vErroTEF := 'S';
    BlockInput(false);
    forcaFocoNoSistema(Application.Handle);
    vmsgErroImpressora := 'Impressora não responde. Tentar imprimir novamente?';
    //if not impressora.verificaPapel then
      //vmsgErroImpressora := 'Falta de Papel. Tentar imprimir novamente?';
    if Application.MessageBox(pchar( vmsgErroImpressora ), 'Confirmação',
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
      obTransTef.alteraStatusTranstef('NCN');
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
    vmsgErroImpressora := 'Impressora não responde. Tentar imprimir novamente?';
    //if not impressora.verificaPapel then
      //vmsgErroImpressora := 'Falta de Papel. Tentar imprimir novamente?';
    if Application.MessageBox(pchar( vmsgErroImpressora ), 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      if gerencial then
        Impressora.FechaRelatorioGerencialTEF
      else
        Impressora.FechaComprovanteNaoFiscalVinculadoTEF;
      gerencial := true;
      setVoltarParaPrimeiroArquivo(true);
      obTransTef.alteraStatusTranstef('NCN');
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

          vmsgErroImpressora := 'Impressora não responde. Tentar imprimir novamente?';
          //if not impressora.verificaPapel then
            //vmsgErroImpressora := 'Falta de Papel. Tentar imprimir novamente?';
          if Application.MessageBox(pchar( vmsgErroImpressora ),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
          begin
            BlockInput(true);
            vret := Impressora.FechaRelatorioGerencialTEF;
          end
          else
          begin
            impressora.FechaRelatorioGerencialTEF;
            sTEFRetorno := '1';
            obTransTef.alteraStatusTranstef('NCN');
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

          vmsgErroImpressora := 'Impressora não responde. Tentar imprimir novamente?';
          //if not impressora.verificaPapel then
             //vmsgErroImpressora := 'Falta de Papel. Tentar imprimir novamente?';

          if Application.MessageBox(pchar(vmsgErroImpressora),
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
          begin
            BlockInput(true);
            vret := Impressora.FechaComprovanteNaoFiscalVinculadoTEF;
          end
          else
          begin
            impressora.FechaComprovanteNaoFiscalVinculadoTEF;
            sTEFRetorno := '1';
            obTransTef.alteraStatusTranstef('NCN');
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

function TTEFDedicado.getFileTEF: string;
begin
  Result := IniConf.ReadStr('TEF', 'ExeFile', 'C:\Client\ClientSitef.exe')
end;

function TTEFDedicado.getPathTEF: string;
var
  vpathtmp: string;
begin
  vpathtmp := IniConf.ReadStr('TEF', 'Path', 'C:\Client\');
  if Copy(vpathtmp, Length(vpathtmp), 1) <> '\' then
    vpathtmp := vpathtmp + '\';
  Result := vpathtmp;
end;

function TTEFDedicado.getQtdeCartao: integer;
begin
  Result := vQtdeCartao;
end;

function TTEFDedicado.getTefDataTransacao: string;
begin
  Result := sTEFDataTransacao;
end;

function TTEFDedicado.getTefHoraTransacao: string;
begin
  Result := sTEFHoraTransacao;
end;

function TTEFDedicado.getTefNomeDARede: string;
begin
  Result := sTEFNomeDaRede;
end;

function TTEFDedicado.getTefNTransacao: string;
begin
  Result := sTEFNSUTransacao;
end;

function TTEFDedicado.getTEFValorDesconto: Currency;
var
  temp: string; vrTemp:Currency;
begin
  try
  vrTemp := 0;

  temp := StringReplace(sTEFValorDesconto,'.','',[rfReplaceAll]);
  temp := StringReplace(temp ,',','',[rfReplaceAll]);
  temp := StringReplace(temp ,' ','',[rfReplaceAll]);

  insert(',', temp, length(temp) - 1);
  vrTemp := vrTemp + StrToCurr(temp);
  Result := vrTemp;
  except
    Result := 0;
  end;
end;

function TTEFDedicado.getTEFValorSaque: Currency;
var
  temp: string; vrTemp:Currency;
begin
  try
  vrTemp := 0;

  temp := StringReplace(sTEFValorSaque,'.','',[rfReplaceAll]);
  temp := StringReplace(temp ,',','',[rfReplaceAll]);
  temp := StringReplace(temp ,' ','',[rfReplaceAll]);

  insert(',', temp, length(temp) - 1);
  vrTemp := vrTemp + StrToCurr(temp);
  Result := vrTemp;
  except
    Result := 0;
  end;
end;

function TTEFDedicado.getTefValorTotal: string;
begin
  Result := sTEFValorTotal;
end;

function TTEFDedicado.getTEFValorTransacao: Currency;
var
  temp: string; vrTemp:Currency;
begin
  vrTemp := 0;
  temp := StringReplace(sTEFValorTotal,'.','',[rfReplaceAll]);
  temp := StringReplace(temp ,',','',[rfReplaceAll]);
  temp := StringReplace(temp ,' ','',[rfReplaceAll]);
  insert(',', temp, length(temp) - 1);
  vrTemp := StrToCurr(temp);

//  temp := StringReplace(sTEFValorSaque,'.','',[rfReplaceAll]);
//  temp := StringReplace(temp ,',','',[rfReplaceAll]);
//  temp := StringReplace(temp ,' ','',[rfReplaceAll]);

  //insert(',', temp, length(temp) - 1);
  //vrTemp := vrTemp + StrToCurr(temp);
  Result := vrTemp;
end;

procedure TTEFDedicado.gravaNSUnoBkpFormpagamento;
var
  vTempNSU: string;
  vNcupom, vFinalizador: integer;
  vValorTemp, vSaqueTemp, vDescTemp: Currency;
begin
  if Trim(sTEFNSUTransacao) = '' then
    Exit;
  try
    vNcupom := StrToInt(Trim(sTEFDoctoVinculado));
  except
    vNcupom := 0;
  end;
  if vNcupom = 0 then
    Exit;
  if existeDadosArquivoBkpFormPagamento(vNcupom, vValorTemp, vSaqueTemp, vTempNSU , vFinalizador, vDescTemp) then
  begin
    vSaqueTemp := getTEFValorSaque;
    vDescTemp := getTEFValorDesconto;
    gravaDadosArquivoBkpFormPagamento(vNcupom, vFinalizador, vValorTemp, vSaqueTemp, Trim(sTEFNSUTransacao), vDescTemp);
//    if vSaqueTemp > 0 then
      gravaHistoricoArqIniBKPCartao(vQtdeCartao + 1, sNomeFinalizador, getTEFValorTransacao + vSaqueTemp - vDescTemp, sTEFDoctoVinculado);
//    else
//      gravaHistoricoArqIniBKPCartao(vQtdeCartao + 1, sNomeFinalizador, getTEFValorTransacao, sTEFDoctoVinculado);
  end;
end;

function TTEFDedicado.ImprimeTef(impressora: TImpressoraF; gerencial: boolean;
  pathArquivo: string): boolean;
var
  i, vretorno, vContLn, vLinhaCorte: Integer;
  vArq: TextFile;
  vlinha: string;
  iInicio: Ttime;
  j: Integer;
  vvalorCartao: Real;
  tempNomeTEF, tempValor, tempDocVinc, vTempImpressao: string;
  temValorFinalizador: Currency;
  T: Integer;
  R: Integer;
begin
  try
    BlockInput(True);
    Result := true;
    Mensagem('Imprimindo...');
    impressora.vFVccancTef := 0;

    if not gerencial then
    begin
      if getHistoricoArqIniBKPCartao(contadorImpressao, tempNomeTEF,
        temValorFinalizador, tempDocVinc) then
      begin
        tempValor := vDadosIni.StrZeroDec(temValorFinalizador, 15, 2);
        delete(tempValor, 13, 1);

        Impressora.AbreComprovanteNaoFiscalVinculado(tempNomeTEF,
          tempValor, vDadosIni.StrZeroDec(strtoInt(Trim(tempDocVinc)), 6, 0));
        obTransTef.alteraStatusTranstef('CNF');
      end
      else
      begin
        vvalorCartao := vvalorTef[contadorImpressao];
        tempValor := vDadosIni.StrZeroDec(vvalorCartao, 15, 2);
        delete(tempValor, 13, 1);

        Impressora.AbreComprovanteNaoFiscalVinculado(vnomeTef[contadorImpressao],
          tempValor, vDadosIni.StrZeroDec(strtoInt(sTEFDoctoVinculado), 6, 0));
        obTransTef.alteraStatusTranstef('CNF');
      end;
    end
    else
    begin

      obTransTef.alteraStatusTranstef('CNF');
      if (relAberto <> 'S') then
      begin
        impressora.abrerelatorioGer;
        relAberto :='S';
      end
      else
      begin

      end;
    end;

    for i := 1 to 1 do
    begin
      vContLn := 0;
      vLinhaCorte := 0;

      AssignFile(varq, pathArquivo);
      try
        //AssignFile(varq, sTEFKoneKPath + frmFileList.FileListBox1.Items.Strings[iimp - 1]);
        Reset(varq);
        readln(varq, vlinha);
        inc(vContLn);
        // Impressao da primeira linha
        vTempImpressao := impressora.TamDescricao(48, vlinha);

        if not gerencial then
          vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(vTempImpressao)
        else
          vretorno := Impressora.RelatorioGerencial(vTempImpressao);
        if not Impressora.retorno_ImpGer(2) then
        begin
          vretorno := 0;
          Break;
        end;

        while not eof(varq) do
        begin

          Application.ProcessMessages;
          vretorno := 1;
          vTempImpressao := '';
          for T := 1 to 3 do
          begin
            readln(varq, vlinha);
            inc(vContLn);
            if (Trim(vlinha) <> '--RECORTE PAPEL') then
              vTempImpressao := vTempImpressao + impressora.TamDescricao(48, vlinha);
            if (vlinha = '--RECORTE PAPEL') then// or (eof(varq)) then
              Break;

            if (vContLn = vLinhaCorte)  or (eof(varq)) then
              Break;
          end;

          if not gerencial then
            vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(vTempImpressao)
          else
            vretorno := Impressora.RelatorioGerencial(vTempImpressao);
          if not Impressora.retorno_ImpGer(2) then
            vretorno := 0;

          if (vlinha = '--RECORTE PAPEL') then// or (eof(varq)) then
          begin
            vTempImpressao := '';
            vTempImpressao := vTempImpressao + impressora.TamDescricao(48, '');

            for R := 1 to StrToInt(vDadosIni.vQtdeLinhasCortePapelTEF) do
            begin
              readln(varq, vlinha);
              if (Trim(vlinha) <> '--RECORTE PAPEL') then
                vTempImpressao := vTempImpressao + impressora.TamDescricao(48, vlinha);
            end;

            if not gerencial then
              vretorno := Impressora.UsaComprovanteNaoFiscalVinculado(vTempImpressao)
            else
              vretorno := Impressora.RelatorioGerencial(vTempImpressao);
            if not Impressora.retorno_ImpGer(2) then
              vretorno := 0;
            impressora.acionaCortePapel(false,gerencial);

          end;



          if vretorno = 0 then
            break;
          Impressora.Retorno_impTEF;
          if Impressora.vFVccancTef <> 0 then
            vretorno := 0;
          if vretorno = 0 then
            break;

        end;
      finally
        CloseFile(varq);
      end;

      if vretorno = 0 then
        break;

    end;

    if (vQtdeCartao > 1) and gerencial and (pos('ANT', pathArquivo) > 0) then
    begin
      vlinha := '';
      vTempImpressao := impressora.TamDescricao(48, vlinha) + impressora.TamDescricao(48, vlinha);
      vretorno := Impressora.RelatorioGerencial(vTempImpressao);
      if not Impressora.retorno_ImpGer(2) then
        vretorno := 0;

      vlinha := '';
      vTempImpressao := impressora.TamDescricao(48, vlinha) + impressora.TamDescricao(48, vlinha);
      vretorno := Impressora.RelatorioGerencial(vTempImpressao);
      if not Impressora.retorno_ImpGer(2) then
        vretorno := 0;

      impressora.acionaCortePapel(false,gerencial);

      vTempImpressao := impressora.TamDescricao(48, vlinha);
      vretorno := Impressora.RelatorioGerencial(vTempImpressao);
      if not Impressora.retorno_ImpGer(2) then
        vretorno := 0;
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

procedure TTEFDedicado.limpaMensagem;
begin
  {$IFDEF VER180}
  if frmMensagemG <> nil then
  begin
    frmMensagemG.Close;
    frmMensagemG.free;
    frmMensagemG := nil;
  end;
  {$ENDIF}

  if Assigned(FOnMensagemClear) then
    FOnMensagemClear;
end;

procedure TTEFDedicado.limpaVariaveis;
begin
  TEFLimpaVariaveis;
end;

procedure TTEFDedicado.limpaVariaveisNovoCartao;
var
  I: Integer;
begin
  limpavariaveis;
  vTransParaConfirmar := false;
  vQtdeCartao := 0;
  sNomeFinalizador := '';
  sValorFinalizador := 0;
  gravaHistoricoArqIniBKPCartao(1, '', 0, '0');
  gravaHistoricoArqIniBKPCartao(2, '', 0, '0');
  //gravaHistoricoArqIniBKPCartaoPendente(1);
  //gravaHistoricoArqIniBKPCartaoPendente(2);
  for I := 0 to 9 do
  begin
    try
      vnomeTef[i] := '';
      vvalorTef[i] := 0;
    except
    end;
  end;
end;

procedure TTEFDedicado.limpaVariaveisNovoCartao2;
begin
  limpavariaveis;
  vTransParaConfirmar := false;
  //vQtdeCartao := 0;
  sNomeFinalizador := '';
  sValorFinalizador := 0;
  gravaHistoricoArqIniBKPCartao(1, '', 0, '0');
  gravaHistoricoArqIniBKPCartao(2, '', 0, '0');
end;

procedure TTEFDedicado.Mensagem(mensagem: string);
begin
{$IFDEF VER180}
  if frmMensagemG = nil then
    Application.CreateForm(TfrmMensagemG, frmMensagemG);
  frmMensagemG.Show;
  frmMensagemG.Label1.Caption := mensagem;
  frmMensagemG.Label1.Width := 400;
  frmMensagemG.Refresh;
{$ENDIF}

  if Assigned(FOnMensagem) then
    FOnMensagem(mensagem);

end;

procedure TTEFDedicado.MensagemFiscal(mensagem: string);
begin

end;

function TTEFDedicado.naoConfirmaUltimaOperacao: boolean;
var
  iimp: integer;
  vMensagemConfirmacao : Integer;
begin
  /// Esta funcao nao esta sendo usada ainda.
  /// Poderá ser usada na seguinte situação:
  ///  Venda de multiplos cartoes
  ///  1° cartao normal
  ///  2° cartao desliga o ecf antes de fazer a forma de pagamento
  ///  O sistema pergunta se deseja tentar novamente. Ligar o ecf e teclar im Nao
  ///  Cancelar com o NCN a transacao do segundo cartao e a aplicacao volta para o usuario informar a nova forma de pagamento
  ///  Falta tirar esta duvida na Software express
  ///  Duvida sanada. Quando optar por nao no segundo cartao, enviar ncn para todas a transacoes pendentes
end;

function TTEFDedicado.operacaoAdministrativo(impressora: TImpressoraF;
  tecBan: boolean): boolean;
var
  imp: TImpressoraF;
  Comprovante: TStrings;
  resc: string;
begin
  try
  vOPADM := 'S';

  imp := TImpressoraF(impressora);
  Comprovante := TStringList.Create;
  vDadosIni.vConsultaCheque := '0';

  if tecBan then
    iTEFTecban := 1
  else
    iTEFTecban := 0;
  TEFLimpaVariaveis;
  TEFModoAdministrativo;

  if (IniConf.ReadStr('TEF', 'SW', 'SOFTWAREEXPRESS') = 'SOFTWAREEXPRESS') then
    if FileExists(sTEFKoneKPath + 'TEF.Imp') and (sTEFNSUTransacao <> '') and (sTEFNSUTransacao <> '0') then
      if sTEFRetorno = '0' then
      begin
        Comprovante.LoadFromFile(sTEFKoneKPath + 'TEF.Imp');
        TEFFechaOperacao;
        Comprovante.SaveToFile(sTEFKoneKPath + 'TEF.Imp');
      end;

  if sTEFRetorno = '0' then
  begin
    if (FileExists(sTEFKoneKPath + 'TEF.Imp')) and (impressora <> nil) then
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
    end
    else if (FileExists(sTEFKoneKPath + 'TEF.Imp')) then
    begin
      {
      try vDadosIni.vPOSV.vLinhasImpressao := TStringList.Create; except end;
      try vDadosIni.vPOSV.vLinhasImpressao.LoadFromFile(sTEFKoneKPath + 'TEF.Imp'); except end;
      }
    end;

//    if IniConf.ReadStr('TEF', 'SW', '') = 'CAPPTA' then
//      sTEFNSUTransacao := ''; //quando é capta a resposta esta vindo com numero da NSU, fazendo com entre no if abaixo e nao exclua o IntPos.001

    if (IniConf.ReadStr('TEF', 'SW', 'SOFTWAREEXPRESS') = 'SOFTWAREEXPRESS') then
    begin
       TEFVerificaArquivosPendentes;
       if FileExists(sTEFPath + 'RESP\IntPos.001') then
          DeleteFile(sTEFPath + 'RESP\IntPos.001');
       if FileExists(sTEFKoneKPath + 'TEF.Imp') then
         DeleteFile(sTEFKoneKPath + 'TEF.Imp');
    end
    else
    if FileExists(sTEFKoneKPath + 'TEF.Imp') and (sTEFNSUTransacao <> '') and (sTEFNSUTransacao <> '0') then  //verifica se foi feita alguma transação com ADM
    begin
      if sTEFRetorno = '0' then
        TEFFechaOperacao
      else
      begin
        TEFNaoConfirmaOperacao;
//        TEFVerificaArquivosPendentes;
      end;
      TEFVerificaArquivosPendentes;
      if FileExists(sTEFPath + 'RESP\IntPos.001') then
        DeleteFile(sTEFPath + 'RESP\IntPos.001');
    end
    else
    begin
       TEFVerificaArquivosPendentes;
       if FileExists(sTEFPath + 'RESP\IntPos.001') then
          DeleteFile(sTEFPath + 'RESP\IntPos.001');
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

     TEFVerificaArquivosPendentes;
     if FileExists(sTEFPath + 'RESP\IntPos.001') then
       DeleteFile(sTEFPath + 'RESP\IntPos.001');

    vmens := '0';
    Application.MessageBox(pchar(sTEFMensOperador), 'Atenção', MB_OK + MB_ICONINFORMATION);
  end;
  finally
    resc := sTEFRetorno;
    TEFVerificaArquivosPendentes;
    sTEFRetorno := resc;

    vOPADM := '';
  end;
end;

//function TTEFDedicado.operacaoCancelamentoTransacao(impressora: TImpressoraF;
//  tecBan,a: boolean; nomeRede, nsuTransacao, data, hora: string;
//  valorTotal: Real): boolean;

function TTEFDedicado.operacaoCancelamentoTransacao(impressora: TImpressoraF): boolean;
var
  imp: TImpressoraF;
  iimp: Integer;
begin
  imp := TImpressoraF(impressora);
  vDadosIni.vConsultaCheque := '0';  //colocado por João Paulo.
{$IFDEF VER180}
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
  {$ENDIF}
end;

procedure TTEFDedicado.registrarDadosTransacao;
var
  dataHora: TDateTime;
  SeqID: Integer;
begin
  try
    obTransTef.buscas.Close;
    obTransTef.buscas.SQL.Text := 'SELECT COD FROM INCREMENTA_CODIGO('+ vDadosIni.codEmpresa + ', ''TEF_TMP_TRANSACOES'')';
    obTransTef.buscas.Open;

    SeqID := obTransTef.buscas.FieldByName('cod').AsInteger;
    obTransTef.buscas.Close;
    obTransTef.buscas.SQL.Text := 'insert into TEF_TMP_TRANSACOES ' +
      ' (SEQID, COD_EMPRESA, NUM_DOC, VALOR_TOTAL, MOEDA, STATUS_TRANSACAO, NOME_REDE,' +
      ' TIPO_TRANSACAO, NSU, NUM_AUT, DATA_HORA_HOST_TR, DATA_HORA_LOCAL_TR, QTDE_PARCELAS,' +
      ' DATA_TRANSACAO, HORA_TRANSACAO, NUMERO_CONTROLE, BANDEIRA_CARTAO)' +
      ' values ' +
      ' ( ' + IntToStr(SeqID) + ' , ' + vDadosIni.codEmpresa + ', ' +
      ' :NUM_DOC, :VALOR_TOTAL, :MOEDA, :STATUS_TRANSACAO, :NOME_REDE,' +
      ' :TIPO_TRANSACAO, :NSU, :NUM_AUT, :DATA_HORA_HOST_TR, :DATA_HORA_LOCAL_TR, :QTDE_PARCELAS,' +
      ' :DATA_TRANSACAO, :HORA_TRANSACAO, :NUMERO_CONTROLE, :BANDEIRA_CARTAO)';
    obTransTef.buscas.ParamByName('NUM_DOC').AsString := Copy(Trim(sTEFDoctoVinculado), 1, 32);
    obTransTef.buscas.ParamByName('VALOR_TOTAL').AsFloat := StrToFloatDef( Trim(sTEFValorTotal), 0) / 100;
    obTransTef.buscas.ParamByName('MOEDA').AsString := Copy(Trim(sTEFMoeda), 1, 1);
    obTransTef.buscas.ParamByName('STATUS_TRANSACAO').AsString := Copy(Trim(sTEFStatusTransac), 1, 3);
    obTransTef.buscas.ParamByName('NOME_REDE').AsString := Copy(Trim(sTEFNomeDaRede), 1, 32);
    obTransTef.buscas.ParamByName('TIPO_TRANSACAO').AsString := Copy(Trim(sTEFTipoTransac), 1, 2);
    obTransTef.buscas.ParamByName('NSU').AsString := Copy(Trim(sTEFNSUTransacao), 1, 32);
    obTransTef.buscas.ParamByName('NUM_AUT').AsString := Copy(Trim(sTEFCodAutorizacao), 1, 32);
    dataHora := EncodeDate(YearOf(Date),
    											 StrToIntDef(Copy(Trim(sTEFTsTransacaoH), 3, 2), 1),
    											 StrToIntDef(Copy(Trim(sTEFTsTransacaoH), 1, 2), 1)) +
                EncodeTime(StrToIntDef(Copy(Trim(sTEFTsTransacaoH), 5, 2), 1),
    											 StrToIntDef(Copy(Trim(sTEFTsTransacaoH), 7, 2), 1),
    											 StrToIntDef(Copy(Trim(sTEFTsTransacaoH), 9, 2), 1),
                           0);
    obTransTef.buscas.ParamByName('DATA_HORA_HOST_TR').AsDateTime := dataHora;
    dataHora := EncodeDate(YearOf(Date),
    											 StrToIntDef(Copy(Trim(sTEFTsTransacaoL), 3, 2), 1),
    											 StrToIntDef(Copy(Trim(sTEFTsTransacaoL), 1, 2), 1)) +
                EncodeTime(StrToIntDef(Copy(Trim(sTEFTsTransacaoL), 5, 2), 1),
    											 StrToIntDef(Copy(Trim(sTEFTsTransacaoL), 7, 2), 1),
    											 StrToIntDef(Copy(Trim(sTEFTsTransacaoL), 9, 2), 1),
                           0);
    obTransTef.buscas.ParamByName('DATA_HORA_LOCAL_TR').AsDateTime := dataHora;
    obTransTef.buscas.ParamByName('QTDE_PARCELAS').AsInteger := StrToIntDef(Trim(sTEFQtdeParcelas), 1);
    dataHora := EncodeDate(StrToIntDef(Copy(Trim(sTEFDataTransacao), 5, 4), 1),
    											 StrToIntDef(Copy(Trim(sTEFDataTransacao), 3, 2), 1),
    											 StrToIntDef(Copy(Trim(sTEFDataTransacao), 1, 2), 1));
    obTransTef.buscas.ParamByName('DATA_TRANSACAO').AsDate := dataHora;
    obTransTef.buscas.ParamByName('HORA_TRANSACAO').AsString :=
      Copy(Trim(sTEFHoraTransacao), 1, 2) + ':' +
      Copy(Trim(sTEFHoraTransacao), 3, 2) + ':' +
      Copy(Trim(sTEFHoraTransacao), 5, 2);
    obTransTef.buscas.ParamByName('NUMERO_CONTROLE').AsString := Copy(Trim(sTEFFinalizacao), 1, 32);
    obTransTef.buscas.ParamByName('BANDEIRA_CARTAO').AsString := Copy(Trim(sTEFAdministradora), 1, 32);
    obTransTef.buscas.ExecSQL;
    if obTransTef.buscas.Transaction.InTransaction then
      obTransTef.buscas.Transaction.Commit;
  except
    on E: Exception do
    begin
      LogApp.Error('TTEFDedicado.registrarDadosTransacao: ' + e.Message);
    end;
  end;
end;

function TTEFDedicado.reimprimeDocVinculadoComoGerencial: boolean;
begin
  Result := reimprimeGerencial = 1;
end;

procedure TTEFDedicado.SalvaVariaveisVendaCorrente(Codigo: integer);
begin
  // Salva as variáveis do sitema ( cartão corrente );
  if codigo = 1 then
  begin
    vsTEFValorTotal := '' ;
    vsTEFNSUTransacao := '' ;
    vsTEFDataTransacao := '' ;
    vsTEFHoraTransacao := '' ;
    vsTEFNomeDaRede := '' ;
    vsTEFDoctoVinculado := '' ;
    vsTEFFinalizacao := '' ;

    vsTEFValorTotal := sTEFValorTotal;
    vsTEFNSUTransacao := sTEFNSUTransacao;
    vsTEFDataTransacao := sTEFDataTransacao;
    vsTEFHoraTransacao := sTEFHoraTransacao;
    vsTEFNomeDaRede := sTEFNomeDaRede;
    vsTEFDoctoVinculado := sTEFDoctoVinculado;
    vsTEFFinalizacao := sTEFFinalizacao;

    sTEFValorTotal := '';
    sTEFNSUTransacao := '';
    sTEFDataTransacao := '';
    sTEFHoraTransacao := '';
    sTEFNomeDaRede := '';
    sTEFDoctoVinculado := '';
    sTEFFinalizacao := '';
  end;

  //retorna para as variáveis do sistema os valores iniciais.
  if codigo = 0 then
  begin
    sTEFValorTotal := vsTEFValorTotal;
    sTEFNSUTransacao := vsTEFNSUTransacao;
    sTEFDataTransacao := vsTEFDataTransacao;
    sTEFHoraTransacao := vsTEFHoraTransacao;
    sTEFNomeDaRede := vsTEFNomeDaRede;
    sTEFDoctoVinculado := vsTEFDoctoVinculado;
    sTEFFinalizacao := vsTEFFinalizacao;
  end;

end;

procedure TTEFDedicado.setContadorImpressao(valor: Integer);
begin
  contadorImpressao := valor;
end;

procedure TTEFDedicado.setVoltarParaPrimeiroArquivo(Value: boolean);
begin
  vVoltaImpPrimeiroArq := Value;
end;

procedure TTEFDedicado.TEFCancelaTransacao;
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

procedure TTEFDedicado.TEFFechaOperacao;
begin
  TEFVerificaGerenciadorAtivo;
  sTEFRetorno := '0';
  TEFGravaOperacao('CNF');

  if (sTEFRetorno = '0') and (FileExists(sTEFKoneKPath + 'TEF.Imp')) then
    DeleteFile(sTEFKoneKPath + 'TEF.Imp');

end; {TEFFechaOperacao}

procedure TTEFDedicado.TEFMensagemG(sLinha4: string);
var
  I: Integer;
begin
{$IFDEF VER180}
  frmMensagemG := TfrmMensagemG.Create(Application);
  frmMensagemG.Show;
  frmMensagemG.Label1.Caption := sLinha4;
  frmMensagemG.Refresh;
  Sleep(iTEFTempoMensagem * 1000);
  frmMensagemG.Free;
  frmMensagemG := nil;
{$ENDIF}

  if Assigned(FOnMensagem) then
  begin
    FOnMensagem(sLinha4);
    i := 0;
    if iTEFTempoMensagem > 0 then
      while i < iTEFTempoMensagem do
      begin

        I := i + 1;
        Sleep(1000);

        sLinha4 := sLinha4 + '.';
        limpaMensagem;
        FOnMensagem(sLinha4);
      end;
  end;

end; {TEFMensagem}

procedure TTEFDedicado.TEFMensagemC(sLinha4: string);
begin
  {$IFDEF VER180}
  if frmMensagGc = nil then
    Application.CreateForm(TfrmMensagGc, frmMensagGc);

  frmMensagGc.lblLinha4.Caption := sLinha4;
  {$ENDIF}
  if FileExists(sTEFKoneKPath + 'IntPos.001') then
  begin
    try
      DeleteFile(sTEFKoneKPath + 'IntPos.001');
    except
    end;
  end;
  {$IFDEF VER180}
  frmMensagGc.Showmodal;
  {$ELSE}
  ShowAtencao(sLinha4);
  {$ENDIF}
end; {TEFMensagem}

end.

