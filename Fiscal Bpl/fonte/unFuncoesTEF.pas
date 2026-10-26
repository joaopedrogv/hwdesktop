{ Projeto     : TEFDelphi
  Unit        : unFuncoesTEF
  Versão      : 4.0.0
  Função      : Agrega todas as funções do TEF
  Autor       : Kohl em 11/07/2003
  Alterações  : Kohl em 17/10/2003 - Inclusão do Tecban
  Alterações  : Herbert em 20/02/2004 - Adaptação para sistema Fiscal.exe -
  por Herbert da Silva Costa

}
unit unFuncoesTEF;

interface

uses
  Windows, SysUtils, Controls, Forms, FileCtrl, Dialogs, unMensagem, unImpressao, unMensagGerais,
  unMensagGc, udadosINI, uImpressoraF, utranstef, Contnrs;

type
  // ---< Registro TEFParam >---
  regTEFParam = record
    NSU: integer;
  end;

  TTEF = class
  private
    FArquivosImp: TObjectList;
    procedure SetArquivosImp(const Value: TObjectList);
  protected
    // ---< Variáveis Gerais >---
    iTEFTempoEspera: integer; // Tempo em seg. para esperar resposta do GP
    iTEFTempoMensagem: integer; // Tempo em seg. para exibição de mensagens
    iTEFProximoNSU: integer; // Nº sequencial único da transação gerado pelo TEFDelphi
    sTEFKoneKPath: string;
    sTEFRetorno: string;

    sTEFValidandoTransTef : string; // utilizada para gravar CNF para os trannstef, quando multiplos cartões.
    sTEFMsgCancelamento : string; // Controle de mensagens no cancelamento de múltiplos cartões.
    sTEFMsgConfirmacao : string; // Controle de mensagens na confirmação de múltiplos cartões. 

    // ---< Variáveis da transação >---
    sTEFOperacao: string; //000-000 VALOR DA OPERAÇÃO.
    sTEFDoctoVinculado: string; // 002-000  DOCUMENTO FISCAL VINCULADO
    sTEFValorTotal: string; // 003-000	VALOR TOTAL
    sTEFMoeda: string; // 004-000	MOEDA - "0" = Real / "1" = Dollar
    sTEFCMC7: string; // 005-000	CMC-7
    sTEFTipoDePessoa: string; // 006-000	TIPO DE PESSOA - "F"ísica / "J"uridica
    sTEFDoctoPessoa: string; // 007-000	DOCUMENTO DA PESSOA
    sTEFDataDoCheque: string; // 008-000	DATA DO CHEQUE
    sTEFStatusTransac: string; // 009-000	STATUS DA TRANSAÇÃO
    sTEFNomeDaRede: string; // 010-000	NOME DA REDE
    sTEFTipoTransac: string; // 011-000	TIPO DA TRANSAÇÃO
    sTEFNSUTransacao: string; // 012-000	NÚMERO DA TRANSAÇÃO - NSU
    sTEFCodAutorizacao: string; // 013-000	CÓDIGO DE AUTORIZAÇÃO DA TRANSAÇÃO ou 521-xxx	RECNR MONITOR
    sTEFNumeroLote: string; // 014-000	NÚMERO DO LOTE DA TRANSAÇÃO
    sTEFTsTransacaoH: string; // 015-000	TIMESTAMP DA TRANSAÇÃO - HOST
    sTEFTsTransacaoL: string; // 016-000	TIMESTAMP DA TRANSAÇÃO - LOCAL
    sTEFTipoParcela: string; // 017-000	TIPO PARCELAMENTO
    sTEFQtdeParcelas: string; // 018-000	QTDE DE PARCELAS
    sTEFDataTransacao: string; // 022-000	DATA DA TRANSAÇÃO - COMPROVANTE
    sTEFHoraTransacao: string; // 023-000	HORA DA TRANSAÇÃO - COMPROVANTE
    sTEFDataPreDatado: string; // 024-000	DATA PRÉ-DATADO
    sTEFNumTransCanc: string; // 025-000	NÚMERO DA TRANSAÇÃO CANCELADA - NSU
    sTEFTsTransCanc: string; // 026-000	TIMESTAMP DA TRANSAÇÃO CANCELADA
    sTEFFinalizacao: string; // 027-000	FINALIZAÇÃO
    sTEFMarcadoRecorte: string; //028-001 MARCA DO RECORD DO CUPOM DE REIMPRESSÃO
    sTEFMensOperador: string; // 030-000	TEXTO ESPECIAL OPERADOR
    sTEFMensCliente: string; // 031-000	TEXTO ESPECIAL CLIENTE
    sTEFAutenticacao: string; // 032-000	AUTENTICAÇÃO
    sTEFBanco: string; // 033-000	BANCO
    sTEFAgencia: string; // 034-000	AGÊNCIA
    sTEFAgenciaDC: string; // 035-000	AGÊNCIA - DC
    sTEFCtaCorrente: string; // 036-000	CONTA CORRENTE
    sTEFCtaCorrenteDC: string; // 037-000	CONTA CORRENTE - DC
    sTEFNumCheque: string; // 038-000	NÚMERO DO CHEQUE
    sTEFNumChequeDC: string; // 039-000	NÚMERO DO CHEQUE  - DC
    sTEFAdministradora: string; // 040-000	NOME DA ADMINISTRADORA
    sTEFValorSaque: string; // 200-000	VALOR TOTAL
    sTEFValorDesconto: string; // 200-000	VALOR TOTAL
    sTEFSHouse: string; // Nome da SofterHouse       
    sTEFHabIdCartDigital: string; // 610-XXX: Habilita Códigos de Identificação das Carteiras Digitais
    sTEFIdCartDigital: string; // 504-000: Códigos de Identificação das Carteiras Digitais
    sTEFNomeCartDigital: string; // 504-001: Nome da Carteira Digital
    sTEFIdPSP: string; // 053-000: PSP (Código do Prestador de Serviço de Pagamento), usado na Resposta
    sTEFIdPSPREQ: string; // 053-000: PSP (Código do Prestador de Serviço de Pagamento), usado na Requisicao

    sDoctoRet: string;
    sValorRet: string;
    sRedeRet: string;
    vQtdeCartao: Integer;
    vnomeTef: array[1..10] of string;
    vvalorTef: array[1..10] of Real;
    reimprimeGerencial, contadorImpressao,consulta: integer;
    vTransParaConfirmar, vVoltaImpPrimeiroArq: boolean;
    sNomeFinalizador: string;
    sValorFinalizador: Currency;

    {variáveis utilizadas para capturar a transação corrente ( venda no cartão ),
     e então executar a função VerificaOperacaoPendenteTransTef (verifica se existe operação pendente),
     para depois retornarem a seus valores iniciais para continuar a transação que estava sendo executada.}
    vsTEFValorTotal : string;
    vsTEFNSUTransacao : string;
    vsTEFDataTransacao : string;
    vsTEFHoraTransacao : string;
    vsTEFNomeDaRede : string;
    vsTEFDoctoVinculado : string;
    vsTEFFinalizacao : string;

    // ---< Procedures usadas internamente >---
    procedure TEFVerificaArquivosPendentes; virtual; abstract;
    procedure TEFVerificaArquivosPendentesVND; virtual; abstract;
    procedure TEFVerificaTEFTmp(sExibeErro: string); virtual; abstract;
    procedure TEFVerificaTEFParam; virtual; abstract;
    procedure TEFProximoNSU; virtual; abstract;
    procedure TEFCriaArquivoREQIntPos001; virtual; abstract;
    procedure TEFVerificaIntPosSts(sOperacao: string; iNSU: integer); virtual; abstract;
    procedure TEFVerificaIntPos001(sOperacao: string; iNSU: integer); virtual; abstract;
    procedure TEFGravaOperacao(sOperacao: string); virtual; abstract;
    procedure TEFImprimeTransacao; virtual; abstract;
    procedure TEFMensagemC(sLinha4: string); virtual; abstract;
    procedure TEFMensagemG(sLinha4: string); virtual; abstract;
    procedure TEFMensagem(sLinha1, sLinha2, sLinha3, sLinha4: string); virtual; abstract;

    // ---< Procedures usadas pelo sistema de automação >---
    procedure TEFLimpaVariaveis; virtual; abstract;
    procedure TEFConfirmaOperacao; virtual; abstract;
    procedure TEFNaoConfirmaOperacao; virtual; abstract;
    procedure TEFVerificaOperacaoPendente; virtual; abstract;
    procedure TEFVerificaGerenciadorAtivo; virtual; abstract;
    procedure TEFModoAdministrativo; virtual; abstract;
    procedure TEFPedidoAutorizacaoCartao; virtual; abstract;
    procedure TEFPedidoAutorizacaoCheque; virtual; abstract;
    procedure TEFVendaCartao; virtual; abstract;
    procedure TEFVendaCheque; virtual; abstract;
    procedure TEFCancelaTransacao; virtual; abstract;
    procedure TEFFechaOperacao; virtual; abstract;

    //---------- < Procedure criada na 2006 > -----------------
    procedure VerificaTefImp; virtual; abstract;
    procedure setVoltarParaPrimeiroArquivo(Value: boolean); virtual; abstract;
    procedure Mensagem(mensagem: string); virtual; abstract;
    procedure limpaMensagem; virtual; abstract;

    function CreateProcessSimple(cmd: string): boolean; virtual; abstract;
    function RightFromPos(sString: string; iPos: integer): string;
    function RemoveAspas(sString: string): string;

  public
    iTEFTecban: integer; // 0 = Usar o GP das redes - 1 = Usar o GP Tecban
    sTEFPath: string;
    reimpressao:string;
    relAberto:string;
    constructor create;
    destructor destroy; override;

    function forcaFocoNoSistema(hwnd: THandle): Boolean; virtual; abstract;
    procedure VerificaArquivosPendentes; virtual; abstract;
    function venda(tipoFinalizador, ndocVinculado, Moeda: Integer; verificaCredito,
      atribfinalizador: string; valorTotal: Double): Boolean; virtual; abstract;
    function getTefValorTotal: string; virtual; abstract;
    function getTefNTransacao: string; virtual; abstract;
    function getTefNomeDARede: string; virtual; abstract;
    function getTefDataTransacao: string; virtual; abstract;
    function getTefHoraTransacao: string; virtual; abstract;
    function getQtdeCartao:integer; virtual; abstract;
    function ImprimeTef(impressora: TImpressoraF; gerencial: boolean; pathArquivo: string): boolean; virtual; abstract;
    function ConfirmacaoReimpressao(impressora: TImpressoraF; gerencial: boolean): boolean; virtual; abstract;
    function reimprimeDocVinculadoComoGerencial: boolean; virtual; abstract;
    function operacaoAdministrativo(impressora: TImpressoraF; tecBan: boolean): boolean; virtual; abstract;
    //    function operacaoCancelamentoTransacao(impressora: TImpressoraF; tecBan,a: boolean;
    //      nomeRede, nsuTransacao, data, hora: string; valorTotal: Real): boolean;
    function operacaoCancelamentoTransacao(impressora: TImpressoraF): boolean; virtual; abstract;
    function finalizaOperacao(impressora: TImpressoraF): boolean; virtual; abstract;
    function cancelaOperacoesAnteriores(impressora: TImpressoraF): boolean; virtual; abstract;
    function naoConfirmaUltimaOperacao: boolean; virtual; abstract;
    procedure verificaOperacaoPendente(impressora: TImpressoraF); virtual; abstract;
    procedure verificaOperacaoPendenteTransTef; virtual; abstract;
    function verificaOperacaoPendenteEntrada(impressora: TImpressoraF):boolean; virtual; abstract;

    procedure fechaOperacao; virtual; abstract;
    function cancela_ant(impressora: TImpressoraF; pathArquivo: string): boolean; virtual; abstract;
    function gerenciamentoImpressaoTEF(impressora: TImpressoraF; gerencial: boolean; pathArquivo:
      string): boolean; virtual; abstract;
    procedure setContadorImpressao(valor: Integer); virtual; abstract;
    function voltarParaPrimeiroArquivo: boolean; virtual; abstract;
    procedure limpaVariaveis; virtual; abstract;
    procedure limpaVariaveisNovoCartao; virtual; abstract;
    procedure limpaVariaveisNovoCartao2; virtual; abstract;

    procedure cancelaBKP; virtual; abstract;
    procedure MensagemFiscal(mensagem: string); virtual; abstract;
    function existeTransacaotransTef: boolean; virtual; abstract;
    function getTEFValorTransacao: Currency; virtual; abstract;
    procedure SalvaVariaveisVendaCorrente(Codigo:integer); virtual; abstract;
    procedure gravaDadosArquivoBkpFormPagamento(pCupom, pFinalizador: integer;
      pValor, pSaque: Currency; pNSU: string; pDesconto: Currency);
    function existeDadosArquivoBkpFormPagamento(pCupom: integer;
      var vValor: Currency; var vSaque: Currency; var vNSU:string; var vFinalizadorTEF: integer; var vDesconto: Currency) : Boolean;
   function existetransacaoTefPendente: boolean;
   procedure gravaHistoricoArqIniBKPCartao(vCartao: integer; nomeFinal:string;
    valorFinal: Currency; nDocVinculado: string);
   function getHistoricoArqIniBKPCartao(vCartao: integer; var nomeFinal:string;
    var valorFinal: Currency; var nDocVinculado: string): boolean;
   function gravaHistoricoArqIniBKPCartaoPendente(vCartao: integer): boolean;
   function existeCartaoPendente: boolean;
   procedure VerificaGerenciadorAtivo;
   function getTEFValorSaque: Currency; virtual; abstract;
   function getTEFValorDesconto: Currency; virtual; abstract;
   function getTEFQtdeParcelas: Integer;
   function getTEFNumAutorizacao: string;
   function getTEFNSUTransacao: string;
   procedure AddArquivoImpressao;
   procedure SetDocumentoVinculado(Value: string);

   procedure AbreFormTransacoes;

   property TEFSHouse: string read sTEFSHouse write sTEFSHouse;
   property TEFTipoParcela: string read sTEFTipoParcela;
   property TEFQtdeParcelas: string read sTEFQtdeParcelas;
   property TEFTipoTransac: string read sTEFTipoTransac;
   property ArquivosImp: TObjectList read FArquivosImp write SetArquivosImp;  
   property IdCartDigital: string read sTEFIdCartDigital write sTEFIdCartDigital;
   property NomeCartDigital: string read sTEFNomeCartDigital write sTEFNomeCartDigital;
   property IdPSP: string read sTEFIdPSP write sTEFIdPSP;

  var
    obTransTef: Ttranstef;
    vmens, msgOp: string;
    vmsgErroImpressora : string;
  end;

implementation

uses
  uFileList, StdCtrls, DB, uDtmAtivo, UCancTransTef, Mask, IniFiles,
  uDataSet_OOP, uTransacoesTEF, Classes;

function BlockInput(block: boolean): DWORD; stdcall; external 'user32.DLL';

var
  // ---< Arquivo TEFParam >---
  TEFParam: file of regTEFParam;
  Param: regTEFParam;
  NomeParam: string;

  // ---< Retorna os caracteres a direita a partir da posição iPos >---



{ TTEF }

procedure TTEF.AbreFormTransacoes;
begin
  Application.CreateForm(TfrmTransacoesTEF, frmTransacoesTEF);
  frmTransacoesTEF.ShowModal;
end;

procedure TTEF.AddArquivoImpressao;
var
  Arquivo: TStrings;
begin
  if FileExists(sTEFKoneKPath + 'TEF.Imp') then
  begin
    Arquivo := TStringList.Create;
    Arquivo.LoadFromFile(sTEFKoneKPath + 'TEF.Imp');
    FArquivosImp.Add(Arquivo);
  end;
end;

constructor TTEF.create;
begin
  FArquivosImp := TObjectList.Create;
  FArquivosImp.Clear;
  setVoltarParaPrimeiroArquivo(False);
end;

destructor TTEF.destroy;
begin
  FreeAndNil(FArquivosImp);
  inherited;
end;

function TTEF.existeCartaoPendente: boolean;
var
  arquivo: TIniFile;
  ArqIni: string;
  vNomeFinal: string;
begin
  Result := False;
  ArqIni := ExtractFilePath(Application.Exename) + 'tef.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    //if arquivo.ReadString('CARTAO1', 'PENDENTE', 'S') <> 'S' then
      if arquivo.ReadString('CARTAO2', 'PENDENTE', 'S') = 'S' then
        Result := True;
  finally
    arquivo.Free;
  end;
end;

function TTEF.existeDadosArquivoBkpFormPagamento(pCupom: integer;
  var vValor: Currency; var vSaque: Currency; var vNSU: string; var vFinalizadorTEF: integer; var vDesconto: Currency): Boolean;
var
  arquivo: TIniFile;
  ArqIni: string;
  vCupomTemp: integer;
begin
  Result := False;
  ArqIni := ExtractFilePath(Application.Exename) + 'tef.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    vCupomTemp := arquivo.ReadInteger('TRANSACAO', 'CUPOM', 0);
    vFinalizadorTEF := arquivo.ReadInteger('TRANSACAO', 'FINALIZADOR', 0);
    vValor := arquivo.ReadFloat('TRANSACAO', 'VALOR', 0);
    vNSU := arquivo.ReadString('TRANSACAO', 'NSU', '');
    vSaque := arquivo.ReadFloat('TRANSACAO', 'SAQUE', 0);
    vDesconto := arquivo.ReadFloat('TRANSACAO', 'DESCONTO', 0);
    if pCupom = vCupomTemp then
      Result := True;
  finally
    arquivo.Free;
  end;
end;

function TTEF.existetransacaoTefPendente: boolean;
var
  bRet: boolean;
  IntPos001, TEFImp: TextFile;
  //  sNomeArquivo, sLinha, sDoctoRet,sValorRet, sLinhas, sParcela : string;
  //  sRedeRet, sVencParcela, sValorParcela, sNSUParcela : string;
  sNomeArquivo, sLinha, sLinhas, sParcela: string;
  sVencParcela, sValorParcela, sNSUParcela: string;
  vflgnsu, iParcelas, i: integer;
  vTemp: string;
  vTemp1: string;
  vTempFinal: string;
  vReimpressao: integer;
  vTpFinal: string;
  vTpValor: Currency;
  vTpNdoc: string;
begin
  vQtdeCartao := 0;
  obTransTef.getTodos;
  Result := not obTransTef.dataSet.IsEmpty;
  if not Result then
    Result := FileExists(sTEFKoneKPath + 'IntPos.001');

  vTransParaConfirmar := Result;
  if Result then
    if not FileExists(sTEFKoneKPath + 'TEF.Imp') then
    begin
      /// Verificando se foi feito o arquivo TEF.Imp
      if FileExists(sTEFPath + 'RESP\IntPos.001') then
      try
        vReimpressao := 0;
        AssignFile(IntPos001, sTEFPath + 'RESP\IntPos.001');
        Reset(IntPos001);
        repeat
          ReadLn(IntPos001, sLinha);
          if Copy(Trim(sLinha), 1, 7) = '028-001' then
            sTEFMarcadoRecorte := RightFromPos(sLinha, 11);
          //Application.ProcessMessages;
        until ( EOF(IntPos001)) ;
        Reset(IntPos001);

        vTemp :='';
        vTemp1:=sTEFMarcadoRecorte;
        vTempFinal:='';
        while POS(':',vTemp1)>0 do
        BEGIN
          vTemp := vDadosIni.StrZero(Copy(vTemp1,1,POS(':',vTemp1)-1),3);
          vTempFinal := vTempFinal+vTemp+ ':';
          vTemp1:=Copy(vTemp1,POS(':',vTemp1)+1, Length(vTemp1));
        end;
        sTEFMarcadoRecorte := vTempFinal + vDadosIni.StrZero(vTemp1,3);

        Reset(IntPos001);
        AssignFile(TEFImp, sTEFKoneKPath + 'TEF.Imp');
        Rewrite(TEFImp);

        repeat
          ReadLn(IntPos001, sLinha);

          if pos ('REIMPRESSAO', UpperCase ( StringReplace(sLinha,' ','',[rfReplaceAll,rfIgnoreCase]) ) ) > 0 then
             vReimpressao := 1;

          if (Copy(Trim(sLinha), 1, 3) = '029') and ( Pos( Copy(Trim(sLinha),5,3),sTEFMarcadoRecorte )=0 ) then
             WriteLn(TEFImp, RemoveAspas(RightFromPos(sLinha, 11)))
          else

          if (Copy(Trim(sLinha), 1, 3) = '029') and ( Pos( Copy(Trim(sLinha),5,3),sTEFMarcadoRecorte )>0 ) then
          begin
            WriteLn(TEFImp, RemoveAspas(RightFromPos(sLinha, 11)));

            if (vReimpressao = 1) and (vDadosIni.vImprimirUnicaViaReimpressao = 'S') then
               Break{
            else
              WriteLn(TEFImp, RemoveAspas('--RECORTE PAPEL'))};

          end;
          //Application.ProcessMessages;
        until ( EOF(IntPos001)) ;


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

      except
        on E: Exception do
        begin
          sTEFRetorno := '1';
          Exit;
        end;
      end;
    end;
  // Verificando a quantidade de cartoes pendentes para impressao
  vTpNdoc := '0';
  getHistoricoArqIniBKPCartao(1, vTpFinal, vTpValor, vTpNdoc );
  if (Trim(vTpNdoc) <> '') and (Trim(vTpNdoc) <> '0') then
    vQtdeCartao := 1;
  vTpNdoc := '0';
  getHistoricoArqIniBKPCartao(2, vTpFinal, vTpValor, vTpNdoc );
  if (Trim(vTpNdoc) <> '') and (Trim(vTpNdoc) <> '0') then
    vQtdeCartao := 2;
end;

function TTEF.getHistoricoArqIniBKPCartao(vCartao: integer;
  var nomeFinal: string; var valorFinal: Currency; var nDocVinculado: string): boolean;
var
  arquivo: TIniFile;
  ArqIni: string;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'tef.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    nomeFinal := arquivo.ReadString('CARTAO'+IntToStr(vCartao), 'NOME', '');
    valorFinal := arquivo.ReadFloat('CARTAO'+IntToStr(vCartao), 'VALOR', 0);
    nDocVinculado := arquivo.ReadString('CARTAO'+IntToStr(vCartao), 'NDOC', '0');
    Result := (Trim(nomeFinal) <> '');
  finally
    arquivo.Free;
  end;
end;

function TTEF.getTEFNSUTransacao: string;
begin
  Result := Trim(sTEFNSUTransacao);
end;

function TTEF.getTEFNumAutorizacao: string;
begin
  Result := Trim(sTEFCodAutorizacao);
end;

function TTEF.getTEFQtdeParcelas: Integer;
begin
  try
    Result := StrToIntDef(Trim(sTEFQtdeParcelas), 1);
  except
    Result := 1;
  end;
end;

function TTEF.gravaHistoricoArqIniBKPCartaoPendente(vCartao: integer): boolean;
var
  arquivo: TIniFile;
  ArqIni: string;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'tef.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    arquivo.ReadString('CARTAO'+IntToStr(vCartao), 'PENDENTE', 'S');
    Result := True;
  finally
    arquivo.Free;
  end;
end;

procedure TTEF.gravaDadosArquivoBkpFormPagamento(pCupom, pFinalizador: integer;
  pValor, pSaque: Currency; pNSU: string; pDesconto: Currency);
var
  arquivo: TIniFile;
  ArqIni: string;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'tef.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    arquivo.WriteInteger('TRANSACAO', 'CUPOM', pCupom);
    if pFinalizador <> -1  then
      arquivo.WriteInteger('TRANSACAO', 'FINALIZADOR', pFinalizador);
    arquivo.WriteFloat('TRANSACAO', 'VALOR', pValor);
    arquivo.WriteString('TRANSACAO', 'NSU', pNSU);
    arquivo.WriteFloat('TRANSACAO', 'SAQUE', pSaque);
    arquivo.WriteFloat('TRANSACAO', 'DESCONTO', pDesconto);
  finally
    arquivo.Free;
  end;
end;

procedure TTEF.gravaHistoricoArqIniBKPCartao(vCartao: integer; nomeFinal:string;
    valorFinal: Currency; nDocVinculado: string);
var
  arquivo: TIniFile;
  ArqIni: string;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'tef.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    arquivo.WriteString('CARTAO'+IntToStr(vCartao), 'NOME', nomeFinal);
    arquivo.WriteFloat('CARTAO'+IntToStr(vCartao), 'VALOR', valorFinal);
    arquivo.WriteString('CARTAO'+IntToStr(vCartao), 'NDOC', nDocVinculado);
    arquivo.ReadString('CARTAO'+IntToStr(vCartao), 'PENDENTE', 'N');
  finally
    arquivo.Free;
  end;
end;

function TTEF.RemoveAspas(sString: string): string;
begin
  Result := Trim(sString);
  if IsDelimiter('"', Result, 1) then
    Delete(Result, 1, 1);
  if IsDelimiter('"', Result, Length(Result)) then
    Delete(Result, Length(Result), 1);
end; {RemoveAspas}

function TTEF.RightFromPos(sString: string; iPos: integer): string;
begin
  result := Trim(Copy(sString, iPos, (Length(sString) - iPos + 1)));
end;

procedure TTEF.SetArquivosImp(const Value: TObjectList);
begin
  FArquivosImp := Value;
end;

procedure TTEF.SetDocumentoVinculado(Value: string);
begin
  sTEFDoctoVinculado := Value;
end;

procedure TTEF.VerificaGerenciadorAtivo;
begin
  TEFVerificaGerenciadorAtivo;
end;

{RightFromPos}

end.
