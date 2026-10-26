unit uDadosIniFiscal;

interface

uses
  uDadosIni, Controls, uRecord, ComCtrls, Classes, StdCtrls, IBQuery;

type
  TIni = class(TSingleton) // Criei esta classe para definir funcoes especiais do Fiscal
  public

    procedure inicializaVariaveis;

    procedure setBancoConectado(banco: string);
    //Chama outras funcoes para inicializar o fiscal
    function inicializaFiscal: boolean;

    // Abre o frmMensagemG e mostra a mensagem passada no parametro
    procedure MensagemFiscal(mensagem: string); overload;
    function MensagemFiscal(mensagem: string; progresso: boolean): TProgressBar; overload;
    // Fecha o frmMensagem e limpa da memoria.
    procedure limpaMensagem;
    procedure MenuFiscal;
    function RetornoImpressoraErro: boolean;

    function testaConexaoComBanco(localOuServidor: string): boolean;

    //Testa porta de comunicação com o leitor serial
    procedure testaPortas;

    //Verifica integrigado do banco de dados
		procedure testaIntegridadeBanco;

    //Definindo modelo de Impressora a ser instanciado
    procedure definirImpressora;

    //Enviando comandos para o cupom
    function EnvCmdsCupom(vtipo: integer): boolean;

    //Verificando data e hora
    function dataHoraConfereComImp: boolean;

    // Desativar e ativar horario de verão
    function desativarHorarioVerao: boolean;

    function ativarHorarioVerao: boolean;

    //Verifica abertura do dia
    function verificarAberturaDoDia: boolean;

    //Verifica ultimo cupom emitido. Se aberto o sistema o cancela
    function ultimoCupomEmitidoNaoFechado: boolean;

    //Efetua redução Z
    function reducaoZ(pRelatorios: Boolean = True): boolean;

    //Efetua forma de pagamento
    function efetuaFormaPgto(valorPago: Real): boolean;

    //Retorno do SubTotal da Impressora
    function getSubTotalImpressora: string;

		//Verifica status da impressora e do Caixa para permitir venda ou nao
		function statusCaixa: integer;

    procedure efetuaAgendaMentoHorarioVerao(tipoProgramacao: string);
    function getProgramacaoHorarioVerao:string;

    //Vende o item na impressora
    function enviaVendaItemImpressora(nBarra, descricao, aliqSitTrib, quantidade: string;
      digitosVlUnit: integer; valorVenda, descontoAcrescimoPerc, descontoAcrescimoValor,
      vQuantidade: Real): boolean;

    //Verifica se o comando é compativel com a impressora Fiscal
    function existeComando(codigo: string; mostraMensagem: boolean): boolean;

    procedure FecharOp;

    function getNItem: string;

    procedure ImpResumoVnd;

    procedure ImpDAVEmitidos;

    procedure ImpDAVOSEmitidos;

    procedure ImpMeiosPagamento;

    procedure IdentificaoPAFECF;

    function alteraPortaCom: Boolean;

    function verificaGrandeTotal: boolean;

		procedure acumulaGrandeTotal(valor: Currency);

    function imprimeDavNoEcf(var pDav: RVenda): boolean;

    procedure leituraMeroriaFiscal(dataIni, dataFim, tipoImpOuArq, CompletaSimplificada: string);
      overload;

    procedure leituraMeroriaFiscal(cooIni, cooFim: Integer; tipoImpOuArq, CompletaSimplificada:
      string); overload;

    procedure espelhoMFD(dataIni, dataFim: string); overload;

    procedure espelhoMFD(cooIni, cooFim: Integer); overload;

    procedure gerarArquivoCotepe1704(dataIni, dataFim: string; pTipo: string = 'MFD'); overload;

    procedure gerarArquivoCotepe1704(cooIni, cooFim: Integer; pTipo: string = 'MFD'); overload;

    procedure gerarMD5IndiceTecnico(enderecoArquivo:string);

		/// MENU FISCAL

		procedure leituraX;
		procedure lmf;
		procedure registrosDoPAFECF;
		procedure arquivoMfd;
		procedure arquivoMf;
		procedure identificacaoDoPafECFMenuFiscal;
		procedure vendasDoPeriodo;
		procedure tabIndiceTecnicoProducao;
		procedure parametrosDeCOnfiguracao;
    procedure impressaoGerencialLista(pLista: TStringList);

		/// Fim menu fiscal
		///  Distrito Federal
		procedure arquivoLFD;

		/// Metodos Menu fiscal antigo, algums estao em outro menu e ainda sao usados
		procedure espelhoMfdMF;
		procedure movimentoPorEcf;
		procedure meiosDePgto;
    procedure davsEmitidos;
    procedure contasCLientesAbertas(pMensagem: Boolean = True);
    procedure conferenciaContaCliente(pCodCliente: Integer; pCodigoConta: Integer);
    procedure TabProd;
    procedure estoque;
    procedure lmfc;
    procedure lmfs;
    /// Fim

    function SangriaOuSuprimento(valor: Double; SanOuSup: string): boolean;

    procedure abreGaveta;

    function cancelaUltimoCupomEmitido: boolean;

    function verificaEntrada: boolean;

    function conectaBancos: boolean;

    function confirmarVenda: boolean;

    function cancelarItemDoCupom: boolean;
    function getNumSerieEcfDescriptografado:string;
    function getGrandeTotalDescriptografado:string;

    function getNumeroSerieCriptografadoEmArquivoAuxiliar:string;
    function getCodigoTerminalAtivo(pCodDefault: string): string;

    function getGrandeTotalCriptografadoEmArquivoAuxiliar:string;
    function SetGrandeTotalCriptografadoEmArquivoAuxiliar(valorCriptografado:string):boolean;
		procedure corrigeGrandeTotal(valor: Currency);

    function PadR(sString: string; iLength: Integer; cChar: Char): string;

    function PadL(sString: string; iLength: Integer; cChar: Char): string;

    function _Left(sString: string; iLength: Integer): string;

    function _Right(pString: string; xWidth: Integer): string;

    procedure PostKeyEx32(Key: Word; const Shift: TShiftState; SpecialKey: boolean);

    function abreFormRetornoImpressora: boolean;

    function abreFormRecebimentoNaoFiscal(codPrestacao:integer): boolean;
    function cancelaUltimoDocumentoNaoFiscal:boolean;

    procedure verificaCamposNaoCriados;

    function md5Arquivo(pNomeArquivo: string):string;

    function cancelarPreVendasAbertasAntesReducaoZ(pAbrindoDia: Boolean = False; pDataMov: TDate = 0): Boolean;
    function emitirCupomPelaVenda(pNumVenda: Integer;
                                  pTipoVenda: string;
                                  pCancelarCupom: Boolean = False;
                                  pConfirmarExclusao: Boolean = True;
                                  pAntesDoZ: Boolean = False): Boolean;
    function cancelarVendasAnteriores(pNumVenda: Integer; pTipoVenda: string; pQuery: TIBQuery): Boolean;

    /// Funções auxiliares para indentificação do status da impressora ou do correto funcionamento
		function diferencaNoGrandeTotal( pMsg: string ):boolean;
		function diferencaNoNumeroSerie( pMsg: string ):boolean;
		function semComunicacaoComECF( pMsg: string ):boolean;
		function semArquivoAuxiliar( pMsg: string ):boolean;
		function impressaoEmAndamento( pMsg: string ):boolean;
    function caixaFiscalFechado( pMsg: string ):boolean;


    procedure verificarNovoHwF(pCopiarSemConfirmar: Boolean = False);

  end;

var
  vDadosIniF: TIni;

implementation

uses
  Forms, SysUtils, Windows,
  Uimpressoras, unMensagemGerais, uThOpenTable, uCadastrosF, uCupom, uHwF,
  DateUtils, uDtmEntrada, uClasseEntrada, USplash, USenha,
  uCancelarItens, uDataSet_OOP, uDtmConfigF, uPrincipalF, uDtmAtivo,
  uDtmFiscal, Dialogs, DB, uDtmDAVF, uClasseDAVF, uClasseSincF, uClasseADig, uImpressoraF, uMenuFiscal, inifiles, uClasseBalanca,
  unFuncoesTEFDedicado, unFuncoesTEFDiscado, uMensagemRetornoImpressora, Registry,
  uRecebimentoNaoFiscalCxl, IBScript, uCancelarNaoFiscal, MD5, uComandosPDV,
  UAnexoV, UAnexoIVEst, UAnexoVI, uRelPeriodo, uClassesRetaguarda, Funcoes, uPOSVirtualTEF;

function BlockInput(block: boolean): DWORD; stdcall; external 'user32.DLL';

{ TIni }

function TIni.RetornoImpressoraErro: boolean;
var iRetorno,iACK, iST1, iST2: Integer;
begin
Result:= true;
iACK:=0;
iSt1:=0;
iSt2:=0;

  if not CImpressoraF.RetornoImpressora(iACK, iST1, iST2) then
  begin
    Application.MessageBox('Não foi possivel se comunicar com a impressora.','Erro',MB_OK+MB_ICONERROR);
    Result:= false;
    exit;
  end;

   if iACK <> 6 then
  begin
    Application.MessageBox('Ocorreu um erro enquanto a impressora enviava o retorno.'+#13+'Verifique as  ','Erro',MB_OK+MB_ICONERROR);
    Result:= false;
    exit;
  end;


 //ST1
  If iST1 >= 128 Then
  begin
    iST1 := iST1 - 128;
    showmessage('Fim de Papel');
    Result:= false;
  end;

  If iST1 >= 64 Then
  begin
    iST1 := iSt1 - 64;
     showmessage('Pouco Papel');
     Result:= false;
  end;

  If iSt1 >= 32 Then
  begin
    iSt1 := iSt1 - 32;
    showmessage('Erro no Relógio');
    Result:= false;
  end;

  If iSt1 >= 16 Then
  begin
    iSt1 := iSt1 - 16 ;
    showmessage('Impressora em Erro');
    Result:= false;
  end;

  If iSt1 >= 8 Then
  begin
    iSt1 := iSt1 - 8;
    ShowMessage('Comando não iniciado com ESC');
    Result:= false;
  end;

  If iSt1 >= 4 Then
  begin
    iSt1 := iSt1 - 4;
    showmessage('Comando Inexistente');
    Result:= false;
  end;

  If iSt1 >= 2 Then
  begin
    iSt1 := iSt1 - 2;
    showmessage('Cupom Aberto');
    Result:= false;
  end;

  If iSt1 >= 1 Then
  begin
    iSt1 := iSt1 - 1;
    Showmessage('Número de Parâmetro(s) Inválido(s)');
    Result:= false;
  end;

//ST2
  If iSt2 >= 128 Then                                                // bit 7
  begin
    iSt2 := iSt2 - 128;
    ShowMessage('Tipo de Parâmetro de Comando Inválido');
    Result:= false;
  end;

  If iSt2 >= 64 Then
  begin
    iSt2 := iSt2 - 64;
    ShowMessage('Memória Fiscal Lotada');
    Result:= false;
  end;

  If iSt2 >= 32 Then
  begin
    iSt2 := iSt2 - 32;
    ShowMessage('Erro na Memória RAM');
    Result:= false;
  end;

  If iSt2 >= 16 Then
  begin
    iSt2 := iSt2 - 16;
    ShowMessage('Alíquota Não Programada');
    Result:= false;
  end;

  If iSt2 >= 8 Then
  begin
    iSt2 := iSt2 - 8;
    ShowMessage('Capacidade de Alíquotas Lotada');
    Result:= false;
  end;


  If iSt2 >= 4 Then
  begin
    iSt2 := iSt2 - 4;
    ShowMessage('Cancelamento Não Permitido');
    Result:= false;
  end;

  If iSt2 >= 2 Then
  begin
    iSt2 := iSt2 - 2;
    ShowMessage('CNPJ/IE do Proprietário Não Programado');
    Result:= false;
  end;

  If iSt2 >= 1 Then
  begin
    iSt2 := iSt2 - 1;
    ShowMessage('Comando Não Executado');
    Result:= false;
  end;
end;

function TIni.verificaEntrada: boolean;
var
  vUsuario, vSenha: string;
begin
  {  Result := true;
    if dtmEnt = nil then
    begin
      if not FileExists(ExtractFilePath(ParamStr(0)) + 'pkEntrada.bpl') then
        raise Exception.Create('Pacote ' + ExtractFilePath(ParamStr(0)) +
          'pkEntrada.bpl não existe.');
      hdEntrada := LoadPackage('pkEntrada.bpl');
      if hdEntrada = 0 then
        raise Exception.Create('Pacote não carregado ');
      dtmEnt := TdtmEnt.Create(dtmEnt);
      vDadosIniEnt.vSistema := 'Fiscal';
      vUsuario := '';
      vSenha := '';

      vDadosIniEnt.verificaParametrosLogin(vUsuario, vSenha); // then

      if (decodifica(vUsuario) = 'HW') or ((vUsuario = '') or (vSenha = '')) then
      begin
        obUser := TUsuario.Create;
        Application.CreateForm(TfrmSplash, frmSplash);
        Application.CreateForm(TFrmEntrada, FrmEntrada);
        FrmEntrada.ShowModal;
        if FrmEntrada.ModalResult <> mrOK then
        begin
          Result := false;
          Application.Terminate;
          Abort;
        end;
        if (decodifica(vUsuario) <> 'HW') then
          vSistema := 'Fiscal';
      end
      else
      begin
        obUser := TUsuario.Create;
        if not obUser.validaSenha(vUsuario, vSenha, 'Fiscal') then
        begin
          Result := false;
          Application.Terminate;
          Abort;
        end;
      end;
      vDadosIniEnt.setDadosConfig(TSingleton(vDadosIniF));
    end;  }
end;

function TIni.verificaGrandeTotal: boolean;
var
  vGtFiscal, vGtECF: string;
  valor: Currency;
begin
  Result := False;
  vGtFiscal := StrZero(getGrandeTotalDescriptografado, 20);
  try
    vPesquisa := 'PAF: ' + Format('%0.2n',[(StrToInt64(Trim(vGtFiscal)) / 100)]);
  except
  end;
  if not EnvCmdsCupom(2) then
    Exit;
  vGtECF := CImpressoraF.getGrandeTotal;
  if vGtECF = '' then
    Exit;
  vGtECF := StrZero(vGtECF, 20);
  try
    vPesquisa := vPesquisa + '. IMP: ' + Format('%0.2n',[(StrToInt64(Trim(vGtECF)) / 100)]);
  except
  end;
  if vGtFiscal = vGtECF then
  begin
    Result := True;
    Exit;
  end
  else
    Result := False;
  try
    valor := StrToCurr(vGtECF);
  except
    Result := false;
    exit;
  end;
  try
    valor := StrToCurr(vGtFiscal);
  except
    Result := false;
    if CImpressoraF.RelatorioTipo60Mestre then
    begin
      obResumoD.getDiaDoUltimoMovimento;
      if (StrToInt(CImpressoraF.vFvcontRein) = obResumoD.dataSet.FieldByName('cro_mov').AsInteger)
        and
        (StrToInt(CImpressoraF.vFvContRed) = obResumoD.dataSet.FieldByName('coored').AsInteger)
        then
      begin
        valor := StrToCurr(vGtECF);
        obConfImp.corrigeGrandeTotal(valor);
        Result := true;
      end
      else
        Result := false;
    end;
    exit;
  end;
end;

function TIni.verificarAberturaDoDia: boolean;
var
  dtSistemaUltRed, strTmp: string;
  vIntegerTemp: Integer;
  diaAtual: TDate;
begin
  Result := false;
  diaAtual := Date;
  if GetIni('MD', 'DDECF', 'N') = 'S' then //Desconsiderar Data da ECF
  begin
    CImpressoraF.DataHoraImpressora('', '');
    strTmp := CImpressoraF.vFDataECF;
    if InputQuery('Dia Aberto', 'Informe o dia aberto', strTmp) then
      diaAtual := StrToDateDef(strTmp, Date);
  end;

  if obConfImp.dataSet.FieldByName('diaaberto').AsDateTime <> diaAtual then
  begin
    CImpressoraF.AbrePortaS('');
    vIntegerTemp := CImpressoraF.existeReducaoZPendente;

    if vIntegerTemp = 2 then
    begin
      if not EnvCmdsCupom(9) then
        exit;
      try
        MensagemFiscal('Copiando movimento para o sistema...');
        try
          if not obResumoD.existeMovimento(StrToDate(CImpressoraF.vFvDataRes)) then
          begin
            obResumoD.gravaResumoD(StrToDate(CImpressoraF.vFvDataRes),
              CImpressoraF.vFvcooini, CImpressoraF.vFvcoofin, CImpressoraF.vFvContRed,
              CImpressoraF.vFvcontRein, strtocurr(CImpressoraF.vFvvendBr),
              strtocurr(CImpressoraF.vFvGrandT), CImpressoraF.vMapaResumo);
            // Tela para o Usuario confirmar os dados da Redução Z;
          end;
        except
        end;
      finally
        limpaMensagem;
      end;
      obConfImp.abreDia(diaAtual);
    end
    else
    begin
      if vIntegerTemp = 1 then
      begin
				Application.MessageBox(pchar('Dia '+CImpressoraF.vFvDataRes+' não foi fechado'),'Atenção',0+64);
        if not reducaoZ(False) then
        begin
          Application.MessageBox('Não foi possível tirar a redução Z.','Atenção.',MB_OK+MB_ICONERROR);
          result:= false;
          exit;
        end;
      end
      else
      begin
        obConfImp.fechaDia;
      end;
      try
        MensagemFiscal('Copiando movimento para o sistema...');
        try
          if not obResumoD.existeMovimento(StrToInt(CImpressoraF.vMapaResumo.coored)) then
          begin
            obResumoD.gravaResumoD(StrToDate(CImpressoraF.vFvDataRes),
              CImpressoraF.vFvcooini, CImpressoraF.vFvcoofin, CImpressoraF.vFvContRed,
              CImpressoraF.vFvcontRein, strtocurr(CImpressoraF.vFvvendBr),
              strtocurr(CImpressoraF.vFvGrandT), CImpressoraF.vMapaResumo);
            // Tela para o Usuario confirmar os dados da Redução Z;
          end;
        except
        end;
      finally
        limpaMensagem;
      end;
      if Pos(vEmp.vSiglaUF,  GetIni('Fiscal', 'InibirRCCA', 'MG')) = 0 then
      contasCLientesAbertas(False);
      Application.MessageBox('Abre Dia Fiscal', 'Informação', MB_ICONINFORMATION + mb_OK);
      CImpressoraF.FechaPortaSerial;//remover esta linha depois
      MensagemFiscal('Definindo Condições Para Impressora');
      try
        CImpressoraF.AberturaDoDia('', '');
        limpaMensagem;
        CImpressoraF.FechaPortaSerial;
        Result := true;
        CImpressoraF.AbrePortaS(''); // Reabre a porta que foi fechada anteriormente...
        obConfImp.abreDia(diaAtual);

        cancelarPreVendasAbertasAntesReducaoZ(True, Date - 2);
      finally
        limpaMensagem;             
      end;
    end;
    Result := true;
  end else
  result:=true;
end;

function TIni._Left(sString: string; iLength: Integer): string;
begin
  Result := Copy(sString, 1, iLength);
end;

function TIni._Right(pString: string; xWidth: Integer): string;
begin
  Result := Copy(pString, Length(pString) - xWidth + 1, xWidth);
end;

function TIni.ultimoCupomEmitidoNaoFechado: boolean;
var
  cNumeroCupom, ultimoCupom: string;
begin
  Result := true;
  if not EnvCmdsCupom(2) then
    Exit;
  cNumeroCupom := CImpressoraF.NumeroCupom;
  ultimoCupom := obCupom.ultimoCupomEmitidoNaoFechado;
  if (ultimoCupom <> '') and (trim(cNumeroCupom) <> '') then
  begin
    application.messagebox(pchar('Ultimo Cupom: ' + StrZeroDec(strtoint(CNumeroCupom), 5, 0) + ' = '
      + ultimoCupom +
      ' Não foi Fechado Precisa ser Cancelado'), 'Informação', MB_ICONINFORMATION + mb_OK);
    Result := false;

    //Pede a senha do gerente para liberar o cupom
     if not PesqPros('FIS011', 'CANCELAR','CANCELAR CUPOM PENDENTE','CUPOM','', dtmEnt.qrBuscas, true) then
       exit;


    // tentar cancelar na impressora

    try
    if StrToInt(trim(ultimoCupom)) = StrToInt(trim(cNumeroCupom)) then
      begin
        if EnvCmdsCupom(2) then   //abri porta comunicação
          if not EnvCmdsCupom(6) then    //Verifica o nº do Ecf
          begin
            EnvCmdsCupom(10); //Fecha porta serial de comunicação
            exit;
          end;
       if not CImpressoraF.CancelaCupom(vSubTotal)then// cancela cupom
       begin
          GravaAuditoria('FIS011','CANCELAR','ERRO AO TENTAR CANCELAR CUPOM NA ECF','CUPOM','',dtmEnt.qrBuscas);
          raise Exception.Create('Erro na comunicação com a impressora.');
       end;
      end;

    except on e: exception do
      begin
        Application.MessageBox('Não foi possivel cancelar o cupom na impressora.'+#13+'A aplicação sera finalizada.','Atenção.', MB_OK+MB_ICONERROR);
        result := false;
        exit;
      end;
    end;

     GravaAuditoria('FIS011','CANCELAR','CANCELAMENTO DE CUPOM NA ECF','CUPOM','',dtmEnt.qrBuscas);


    if EnvCmdsCupom(10) then
    begin
      obCupom.apagarVendaCancelamento:='N';
      if obCupom.cancelarCupomFiscal then
      begin
        EnvCmdsCupom(2);
        Result := true;
        if obProd <> nil then
        begin
          if obprod.dataSet.active then
          begin
            obProd.CommitaTransacao;
            obProd.IniciaTransacao;
            obProd.dataSet.Refresh;
          end;
        end;
      end;

    end;
  end;
end;

procedure TIni.abreGaveta;
begin
  if not EnvCmdsCupom(2) then
    exit;
  CImpressoraF.AcionaGaveta;
  EnvCmdsCupom(10);
end;

procedure TIni.acumulaGrandeTotal(valor: Currency);
var
  valorArmazenado,valorAInf: Currency;
  temp,tempValor: string;
begin
    try
//      temp := trim(decodifica(getGrandeTotalCriptografadoEmArquivoAuxiliar ));
//      temp := StrZero(temp, 20);
//      temp := Copy(temp, 1, 18) + ',' + Copy(temp, 19, 2);
//      Sleep(1000);
      tempValor := StrZero(Trim(CImpressoraF.getGrandeTotal),20);
      tempValor:=copy(tempValor,1,18)+','+copy(tempValor,19,2);

//      valorArmazenado := StrToCurr(temp);
      valorAInf := StrToFloat(tempValor);//valorAInf := valor;
      //if CImpressoraF.vtipoArredond = 'T' then
        //valorAInf := truncFloat(valorAInf,2);
      temp := trim(format('%18.2f', [({valorArmazenado +} valorAInf)]));
      temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
      temp := codifica(temp);
      SetGrandeTotalCriptografadoEmArquivoAuxiliar(temp);
    except
      Exit;
    end;
end;

function TIni.alteraPortaCom: Boolean;
var
  temp: string;
begin
  inherited;
  Result := False;
  if application.messageBox(pchar('Deseja alterar a porta de comunicação com a impressora?'),
    'Confirmação',
    MB_ICONQUESTION + MB_YESNO) = mrNo then
    exit;

  temp := obConfImp.getPortaComunicacao(vNumSerieEcf);
  if InputQuery('Alterar Porta de Comunicação', 'Informe a nova porta de comunicação', temp)
    then
  begin
    if obConfImp.setPortaComunicacao(vNumSerieEcf, temp) then
    begin
      //application.messageBox(pchar('Porta alterada com sucesso. Reinicie o sistema!'), 'Atenção',
      application.messageBox(pchar('Porta alterada com sucesso.'), 'Atenção',
        MB_ICONINFORMATION + MB_OK);
      Result := True;
    end;
  end;
end;

function TIni.ativarHorarioVerao: boolean;
begin
  if Application.MessageBox('Atenção !!!' + #13 + 'Deseja Ativar Horário de Verão',
    'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;
  if EnvCmdsCupom(2) then
  begin
    if not EnvCmdsCupom(6) then
    begin
      EnvCmdsCupom(10);
      exit;
    end;
    if not CImpressoraF.ProgramaHorarioVerao then
    begin
      Application.ProcessMessages;
      if Application.MessageBox(pchar('Não foi possível ativar o Horário de Verão'+#13+
        'Deseja agendar a programação automática logo após a Redução Z?'),'Confirmação',MB_YESNO+MB_ICONQUESTION) = IDYES then;
          efetuaAgendaMentoHorarioVerao('A');
      //ATIVAR OU DESATIVAR, CRIAR METODO    
    end;
    EnvCmdsCupom(10);
  end;
end;

function TIni.cancelarItemDoCupom: boolean;
begin
  Result := false;
  if (decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'Sweda03')
    then
    exit;
  if obCupom.getSubTotal = 0 then
    exit;
  if not EnvCmdsCupom(2) then
    Exit;
  if not EnvCmdsCupom(6) then
    exit;
  obCupom.Apply;
  obCupom.CommitaTransacao;
  obCupom.vItem.selecionaItens(obCupom.dataSet.FieldByName('cupom').AsInteger,
    obCupom.dataSet.FieldByName('registro').AsInteger);
  obCupom.vItem.First;
  Application.CreateForm(TfrmCancelarItens, frmCancelarItens);
  obCupom.vItem.IndexFieldNames := 'NITEM';
  if frmCancelarItens.ShowModal = mrOk then
    if EnvCmdsCupom(17) then
      if obCupom.cancelaItem then
        result := true;
  frmCancelarItens.Free;
  frmCancelarItens := nil;
end;

function TIni.cancelaUltimoCupomEmitido: boolean;
var
  cNumeroCupom, ultimoCupom: string;
begin
  Result := false;
  try
    if not EnvCmdsCupom(2) then
      exit;
    if not EnvCmdsCupom(6) then
    begin
      EnvCmdsCupom(10);
      exit;
    end;

    cNumeroCupom := CImpressoraF.NumeroCupom;

    if not CImpressoraF.CancelaCupom(vSubTotal) then
      exit;


    Result := obCupom.cancelarUltimoCupom;

    if FileExists(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe') then
       WinExec(Pchar(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe ' + cNumeroCupom), SW_SHOWNOACTIVATE);
    ///  verificar

  finally
    CImpressoraF.FechaPortaSerial;
  end;

  cNumeroCupom := CImpressoraF.NumeroCupom;
  ultimoCupom := obCupom.ultimoCupomEmitido;
  if ultimoCupom <> '' then
  begin
    Application.MessageBox(pchar('Ultimo Cupom: ' + StrZeroDec(strtoint(CNumeroCupom), 5, 0) + ' = '
      + ultimoCupom +
      ' Não foi Fechado Precisa ser Cancelado'), 'Informação', MB_ICONINFORMATION + mb_OK);
    Result := false;
    if (EnvCmdsCupom(10)) and (StrToInt(trim(ultimoCupom)) = StrToInt(trim(cNumeroCupom))) then
      if obCupom.cancelarCupomFiscal then
      begin
        EnvCmdsCupom(2);
        Result := true;
      end;
  end;
  obProd.CommitaTransacao;
  obProd.IniciaTransacao;
  if obProd.dataSet.ACTIVE then  
    obProd.dataSet.Refresh;
end;

function TIni.conectaBancos: boolean;
var
  vIntTmp: Integer;
  vArquivoLocal: string;
  vOK: Boolean;
begin
  try
    LerConfigini;
    bancoConectado := 'servidor';
    Result := false;
    MensagemFiscal('Abrindo banco Fiscal. Tentativa 1 de 2');
    if not conectaBanco(dtmAtivo.bancoFiscal, vBancoFiscal, True) then
    begin
      MensagemFiscal('Abrindo banco Fiscal. Tentativa 2 de 2');
      if not conectaBanco(dtmAtivo.bancoFiscal, vBancoFiscal, true) then
        exit;
    end;

    MensagemFiscal('Abrindo banco Consulta. Tentativa 1 de 2');
    if vTipoConexao = 'off' then
    begin
//      if not conectaBanco(dtmAtivo.bancoHw, vBancoHW, True) then
      begin
        bancoConectado := 'local';
        MensagemFiscal('Abrindo banco Consulta Backup. Tentativa 2 de 2');
        if not conectaBanco(dtmAtivo.bancoHw, vBancoHwF, true) then
          exit;
      end;
      if not conectaBanco(dtmAtivo.bancoHwF, vBancoHWF, True) then
      begin
        try
          vIntTmp:= Pos(':', vBancoHwF);
          if vIntTmp <> 2 then
            vArquivoLocal := Copy(vBancoHwF, Pos(':', vBancoHwF) + 1, length(vBancoHwF))
          else
            vArquivoLocal := vBancoHwF;

          if FileExists(vArquivoLocal + '_OLD') then
          begin
            Application.MessageBox('Houve falha ao conectar ao banco, possivelmente foi uma cópia terminada indevidamente, o sistema irá voltar o arquivo original',
              'Atenção', 0 + 64);
            vOK := True;
            if FileExists(vArquivoLocal) then
              vOK:= DeleteFile(pchar(vArquivoLocal));
            if vOK then
              if RenameFile(vArquivoLocal + '_OLD', vArquivoLocal) then
              begin
                DeleteFile(pchar(vArquivoLocal + '_OLD'));
                if not conectaBanco(dtmAtivo.bancoHwF, vBancoHWF, True) then
                  Exit;
              end;
          end
          else
            Exit;
        except
          Exit;
        end;
      end;
    end
    else
    begin
      if not conectaBanco(dtmAtivo.bancoHw, vBancoHW, True) then
      begin
        bancoConectado := 'local';
        MensagemFiscal('Abrindo banco Consulta Backup. Tentativa 2 de 2');
        if not conectaBanco(dtmAtivo.bancoHw, vBancoHwF, true) then
          Exit;
      end;
    end;
//    if not dtmAtivo.bancoHw.Connected then
//      conectaBanco(dtmAtivo.bancoHw, vBancoHW, false);
    Result := true;
  finally
    limpaMensagem;
  end;
end;

function TIni.confirmarVenda: boolean;
begin

end;

procedure TIni.corrigeGrandeTotal(valor: Currency);
var
  temp: string;
begin
    try
      temp := Format('%17.2f', [valor]);
      temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]);

      temp := codifica(temp);
    except
      Exit;
    end;
      temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
      temp := StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]);
      SetGrandeTotalCriptografadoEmArquivoAuxiliar(temp);
end;

procedure TIni.definirImpressora;
begin
	if (decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'BematechMP20') or
		(decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'BematechMFD') then
	begin
		CImpressoraF := TImpBematech.Create;
		CImpressoraF.SemArquivoAux := False;
		CImpressoraF.vTipoImpressora :=
			decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString);
		CImpressoraF.vtipoArredond :=
			decodifica(obConfImp.dataSet.FieldByName('arredondar_truncar').AsString);
		CImpressoraF.vFvPorta := obConfImp.dataSet.FieldByName('porta_impressora').AsInteger;
		CImpressoraF.vFTecPDV := decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString);
		if decodifica(obConfImp.dataSet.FieldByName('valor_unit_3dig').AsString) = 'S' then
			CImpressoraF.vFqtdDig := 3
		else
			CImpressoraF.vFqtdDig := 2;
		CImpressoraF.vFNumSerieEcf := getNumSerieEcfDescriptografado;
//      decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
		CImpressoraF.vFvmodimpbema := vmodimpbema;
		CImpressoraF.vFaitred := vItRed;
		CImpressoraF.regconfPorta(trim(obConfImp.dataSet.FieldByName('porta_impressora').AsString));
		CImpressoraF.vCodigoFFImpressora := 'BE';
		CImpressoraF.vTemMFD := Self.vTemMFD = 'S';
	end
	else
	//Sweda..
	if (decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'Sweda03') or
		(decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'Sweda10') then
	begin
		CImpressoraF := TImpSWedaMFD.Create;
		CImpressoraF.SemArquivoAux := False;
		CImpressoraF.vTipoImpressora := 'MFD';
//      decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString);
		CImpressoraF.vtipoArredond :=
			decodifica(obConfImp.dataSet.FieldByName('arredondar_truncar').AsString);
		CImpressoraF.vFvPorta := obConfImp.dataSet.FieldByName('porta_impressora').AsInteger;
		CImpressoraF.vFTecPDV := decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString);
		if decodifica(obConfImp.dataSet.FieldByName('valor_unit_3dig').AsString) = 'S' then
			CImpressoraF.vFqtdDig := 3
		else
			CImpressoraF.vFqtdDig := 2;
		CImpressoraF.vFNumSerieEcf := getNumSerieEcfDescriptografado;
//      decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
		//CImpressoraF.vFvmodimpbema:=vmodimpbema;
		CImpressoraF.vFvpfch := vFech9000;
		CImpressoraF.vFvqtparc := vQtdP9000;
		CImpressoraF.vFvleg := vlegSang;
		CImpressoraF.vFvtitulo := vttituloSang;
		CImpressoraF.vFvlegsup := vlegSup;
		CImpressoraF.vFvtitulosup := vttituloSup;
		CImpressoraF.regconfPorta(trim(obConfImp.dataSet.FieldByName('porta_impressora').AsString));
		CImpressoraF.vCodigoFFImpressora := 'SW';
		CImpressoraF.vTemMFD := Self.vTemMFD = 'S';
	end
	else
	//Daruma
	if (decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'DARUMA') or
		(decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'DARUMAMFD') then
	begin
		CImpressoraF := TImpdaruma.Create;
		CImpressoraF.SemArquivoAux := False;
		CImpressoraF.vTipoImpressora :=
			decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString);
		CImpressoraF.vtipoArredond :=
			decodifica(obConfImp.dataSet.FieldByName('arredondar_truncar').AsString);
		CImpressoraF.vFvPorta := obConfImp.dataSet.FieldByName('porta_impressora').AsInteger;
		CImpressoraF.vFTecPDV := decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString);
		if decodifica(obConfImp.dataSet.FieldByName('valor_unit_3dig').AsString) = 'S' then
			CImpressoraF.vFqtdDig := 3
		else
			CImpressoraF.vFqtdDig := 2;
		CImpressoraF.vFNumSerieEcf := getNumSerieEcfDescriptografado;
//      decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
		CImpressoraF.vFvmodimpbema := vmodimpbema;
		CImpressoraF.regconfPorta(trim(obConfImp.dataSet.FieldByName('porta_impressora').AsString));
		CImpressoraF.vCodigoFFImpressora := 'DR';
		CImpressoraF.vTemMFD := Self.vTemMFD = 'S';
	end
	else
	// Impressora Elgin
	if (decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'ELGIN') or
		(decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'ELGINMFD') then
	begin
		CImpressoraF := TImpElgin.Create;
		CImpressoraF.SemArquivoAux := False;
		CImpressoraF.vTipoImpressora :=
			decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString);
		CImpressoraF.vtipoArredond :=
			decodifica(obConfImp.dataSet.FieldByName('arredondar_truncar').AsString);
		CImpressoraF.vFvPorta := obConfImp.dataSet.FieldByName('porta_impressora').AsInteger;
		CImpressoraF.vFTecPDV := decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString);
		if decodifica(obConfImp.dataSet.FieldByName('valor_unit_3dig').AsString) = 'S' then
			CImpressoraF.vFqtdDig := 3
		else
			CImpressoraF.vFqtdDig := 2;
		CImpressoraF.vFNumSerieEcf := getNumSerieEcfDescriptografado;
//      decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
		CImpressoraF.vFvmodimpbema := vmodimpbema;
		CImpressoraF.regconfPorta(trim(obConfImp.dataSet.FieldByName('porta_impressora').AsString));
		CImpressoraF.vCodigoFFImpressora := 'EL';
		CImpressoraF.vTemMFD := Self.vTemMFD ='S';
	end
	else
	//Epson
	if (decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString) = 'EPSON') then
	begin
		CImpressoraF := TImpEpson.Create;
		CImpressoraF.SemArquivoAux := False;
		CImpressoraF.vTipoImpressora :=
			decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString);
		CImpressoraF.vtipoArredond :=
			decodifica(obConfImp.dataSet.FieldByName('arredondar_truncar').AsString);
		CImpressoraF.vFvPorta := obConfImp.dataSet.FieldByName('porta_impressora').AsInteger;
		CImpressoraF.vFTecPDV := decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString);
		if decodifica(obConfImp.dataSet.FieldByName('valor_unit_3dig').AsString) = 'S' then
			CImpressoraF.vFqtdDig := 3
		else
			CImpressoraF.vFqtdDig := 2;
		CImpressoraF.vFNumSerieEcf := getNumSerieEcfDescriptografado;
//      decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
		CImpressoraF.vFvmodimpbema := vmodimpbema;
		CImpressoraF.regconfPorta(trim(obConfImp.dataSet.FieldByName('porta_impressora').AsString));
		CImpressoraF.vCodigoFFImpressora := 'EP';
		CImpressoraF.vTemMFD := Self.vTemMFD = 'S';
	end
	else
	begin
		CImpressoraF := TImpBematech.Create;
		CImpressoraF.SemArquivoAux := (not FileExists(ExtractFilePath(Application.Exename) + 'nserie.hw'));
	end;
end;

function TIni.desativarHorarioVerao: boolean;
begin
  if application.messagebox('Atenção !!!' + #13 + 'Deseja Desativar Horário de Verão',
    'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    exit;
  if EnvCmdsCupom(2) then
  begin
    if not EnvCmdsCupom(6) then
    begin
      EnvCmdsCupom(10);
      exit;
    end;
    CImpressoraF.DesprogramaHorarioVerao;
    EnvCmdsCupom(10);
  end;
end;

function TIni.efetuaFormaPgto(valorPago: Real): boolean;
begin
  if not EnvCmdsCupom(2) then
    Exit;

  while not CImpressoraF.EfetuaFormaPagamento(obFinalizador.getNomeFinalizador, valorPago,
    obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger) do
  begin
    BlockInput(False);
    if Application.MessageBox(pchar('Impressora Fiscal Não Responde, Tentar Novamente?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      Result := false;
      exit;
    end;
    BlockInput(true);
    Sleep(3000);
    BlockInput(true);
    if not obCupom.emSubTotal then
      obCupom.setSubTotal;
  end;
  Result := true;
end;

function TIni.EnvCmdsCupom(vtipo: integer): boolean;
var
  vhoraimp, vhoraComp, vdataImp: string;
  HoraCalc1, HoraCalc2: TDateTime;
  temp1: string;
  temp: string;
  st1,st2,ack: integer;
begin
  //Módulo para envio de comandos para o Cupom fiscal...
  //vtipo é variável que indica o tipo de comando a ser emitido
  //vtipo = 1 -> Colocar máscara do campo valor para impressoras
  //vtipo = 2 -> Abrir porta de comunicação
  //vtipo = 3 -> Abrir Cupom Fiscal e pega o numero do mesmo
  //vtipo = 4 -> Colocar máscara do campo quantidade para impressoras
  //vtipo = 5 -> Enviar venda de itens para impressora
  //vtipo = 6 -> Verifica o nº do Ecf
  //vtipo = 7 -> Verifica se existem cupons Fiscais Abertos na entrada do programa
  //vtipo = 8 -> Verificação das diferenças de hora/data
  //vtipo = 9 -> Abre dia e define, para as impressoras que aceitam, os finalizadores
  //vtipo = 10 ->Fecha porta serial de comunicação
  //vtipo = 11 ->Emite leitura X
  //vtipo = 12 ->Retorno do sub total do cupom
  //vtipo = 13 -> Desconto no subtotal em valor
  //vtipo = 14 -> Define atributo para impressão do TEF
  //vtipo = 15 -> Efetua formas de pagamento
  //vtipo = 16 -> Confirma o fechamento do cupom
  //vtipo = 17 -> Cancela item em qualquer posição
  //vtipo = 18 -> Definir codigo finalizador para prazo
  case vtipo of
    2:
      begin
        if not CImpressoraF.AbrePortaS('') then
        begin
          Application.MessageBox('Porta Não pode ser Aberta Tente Novamente', 'Informação',
            mb_OK);
          EnvCmdsCupom := false;
          exit;
        end;
        result := true;
        semConexao := false;
      end;
    3:
      begin
        if obCupom.getNCupom <> '' then
        begin
          Result := true;
          exit;
        end;
        if not CImpressoraF.AbrePortaS('') then
          Exit;
        if not verificaGrandeTotal then
        begin
          CImpressoraF.vPermitirVenda := false;
          Application.MessageBox(pchar('Cupom Não Pode ser Aberto!' + #13 +
            'Impressora não responde ou' + #13 +
            'Diferença no Grande Total acumulado' + #13 + vPesquisa), 'Informação', MB_ICONINFORMATION + mb_OK);
          vPesquisa := '';
          EnvCmdsCupom := false;
          exit;
        end;

        if not CImpressoraF.AbreCupom('') then
        begin
          Application.MessageBox(pchar('Cupom Não Pode ser Aberto'), 'Informação',
            MB_ICONINFORMATION + mb_OK);
          EnvCmdsCupom := false;
          exit;
        end;
        //jp        vimptef := 0;
        obCupom.setNCupom(CImpressoraF.NumeroCupom);
        if CImpressoraF.vTemMFD then // pos('MFD', decodifica(obConfImp.dataSet.FieldByName('modelo_impressora').AsString)) > 0 then
          obCupom.setNCCF(CImpressoraF.numeroCCF)
        else
          obCupom.setNCCF(CImpressoraF.NumeroCupom);
        result := true;
      end;
    5:
      begin
        Result := true;
        //    eu:=cbarra+'\'+cdesc20+'\'+vSitTributaria+'\'+cQuant+'\'+cpreco+'\0000\UN\'+cTotal;// teste para debug
        if decodifica(obConfImp.dataSet.FieldByName('valor_unit_3dig').AsString) = 'S' then
          CImpressoraF.vFqtdDig := 3
            //          vqtdig := 3
        else
          CImpressoraF.vFqtdDig := 2;
        //        CImpressoraF.Descricaoimp(obProd.getDescricao);
        //        Descricao20;
//        if decodifica(Dm.TBConfImpTecPDV.value) = 'S' then
//          Application.OnMessage := nil;
//        Fcupom.OnKeyDown := nil;
        CImpressoraF.vFcdescit := FloatToStrF(obCupom.getValorDesconto, ffGeneral, 12, 3);
        if not CImpressoraF.VendeItem(obProd.getNBarra,
          CImpressoraF.Descricaoimp(obProd.getDescricao),
          obProd.getSitTributaria, 'F', obProd.getCQuant, 2, obProd.getValorVendaItem, '$',
          obCupom.getDescontoAcrescimoPercenentual, obCupom.getDescontoAcrescimoValor,
          obProd.getQuantidade) then
        begin
          obCupom.somaTotal((-1) * obCupom.getUltimoValor);
          EnvCmdsCupom := false;
          exit;
        end;
        {        cTotal := CImpressoraF.vFvcTotal;
                cPreco := CImpressoraF.vFvcpreco;
                eu := CImpressoraF.vFeu;         }
        //jp        if decodifica(Dm.TBConfImpTecPDV.value) = 'S' then
        //jp          Application.OnMessage := ProcessaMsg;
        //jp        Fcupom.OnKeyDown := FormKeyDown;
      end;
    6:
      begin
        retorno_Var := CImpressoraF.NumeroSerie;
        if Retorno_var <> '' then
        begin
//          if decodifica(copy(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString, 1,
//            length(trim(retorno_Var)))) <> trim(Retorno_var)
          temp1:= copy(getNumSerieEcfDescriptografado,1,length(Trim(retorno_Var)));
          //if pos(trim(Retorno_var),temp1) = 0   then
          if trim(Retorno_var) <> temp1 then
          begin
            temp:='Nº do ECF ' + Copy(retorno_Var,1,length(trim(retorno_var))) + ' <> '+
              temp1+#13+
              'Número de série do ECF diferente do informado no sistema.' +#13+
              'Favor corrigir no sistema de retaguarda e reiniciar o Fiscal';
            Application.MessageBox(pchar(temp
//              'Nº do ECF ' + retorno_var + ' <> ' +
//              getNumSerieEcfDescriptografado+
//              decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString) +
//              ' Número de série do ECF diferente do informado no sistema.' +
//              ' Favor corrigir no sistema de retaguarda'
              ), 'Informação', MB_ICONINFORMATION +
              mb_OK);
            EnvCmdsCupom := TRUE;
            CImpressoraF.vPermitirVenda:=false;
            exit;
          end
          else
            EnvCmdsCupom := true;
        end
        else result := false;
      end;
    8:
      begin
        Result := true;
        CImpressoraF.DataHoraImpressora('', '');
        vdataImp := CImpressoraF.vFDataECF;
        vhoraimp := CImpressoraF.vFHoraEcf;
        //
        vhoraComp := TimeToStr(Time);
        HoraCalc1 := (StrToTime(vhoraimp) - StrToTime(vhoraComp));
        HoraCalc2 := (StrToTime(vhoraComp) - StrToTime(vhoraImp));
        if (HoraCalc1 > strtotime('00:15:00')) and (HoraCalc1 > 0) then
        begin
          Application.MessageBox(pchar('Hora da Impressora não confere com a hora do Computador!' +
            #13 +
            'Hora Impressora..:  ' + vhoraimp + #13 +
            'Hora Computador:  ' + vhoraComp + #13 +
            'Diferença............:   ' + TimeToStr(HoraCalc1)), 'Antenção', mb_OK);
          desativarHorarioVerao;
//          Application.Terminate;
          Result := false;
          exit;
        end
        else if (HoraCalc2 > strtotime('00:15:00')) and (HoraCalc1 < 0) then
        begin
          Application.MessageBox(pchar('Hora da Impressora não confere com a hora do Computador!' +
            #13 +
            'Hora Impressora..:  ' + vhoraimp + #13 +
            'Hora Computador:  ' + vhoraComp + #13 +
            'Diferença............:   ' + TimeToStr(HoraCalc2)), 'Atenção', MB_ICONINFORMATION +
            mb_OK);
          ativarHorarioVerao;
//          Application.Terminate;
          Result := false;
          exit;
        end
          //================================= Verifica a Data =================================
          //     vdataImp:=Fprinter.Dados.DataImp; vdataComp:=DateToStr(Date);
          //     delete(vdataComp,3,1);delete(vdataComp,5,3);
        else if strtodate(vdataImp) <> date then
        begin
          Application.MessageBox(pchar('Data ' + vdataImp +
            ' da Impressora não confere com a data do Computador ' +
            datetostr(date) + '!'), 'Antenção', MB_OK);
//          Application.Terminate;
          if GetIni('MD', 'DDECF', 'N') <> 'S' then //Desconsiderar Data da ECF
          Result := false;
          exit;
        end;
        vdataGeral := strtodate(vdataimp);
      end;
    9:
      begin
        Result := false;
        CImpressoraF.AbrePortaS('');
        if not CImpressoraF.LeTabelaResumo then
          Exit;




        if obConfImp.dataSet.FieldByName('diafechado').AsDateTime <
          obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime then
        begin
          // Se o dia anterior não estiver fechado pede para fechar, tirando a Redução Z
          vnivel := 40;

          try
            if CImpressoraF.vFvDataRes = '00/00/00' then
            begin

            end
            else if not
              CImpressoraF.ImpTirouZSoz(obConfImp.dataSet.FieldByName('DiaAberto').AsDateTime,
              strtodate(CImpressoraF.vFvDataRes)) then
            begin
              MessageDlg('Dia: ' + obConfImp.dataSet.FieldByName('DiaAberto').asstring +
                ' não está Fechado', mtInformation, [mbOK], 0);
              // Fecha porta para que a redução possa ser feita no método dela...
              CImpressoraF.FechaPortaSerial;

            if not RetornoImpressoraErro then
            exit;

              if not reducaoZ then
              begin
                Application.MessageBox('Não foi possível tirar a redução Z.','Atenção.',MB_OK+MB_ICONERROR);
                result:= false;
                exit;
              end;
              CImpressoraF.AbrePortaS(''); // Reabre a porta que foi fechada anteriormente...
            end
            else
            begin
              {obResumoD.gravaResumoD(obConfImp.dataSet.FieldByName('diaaberto').AsDateTime,
                CImpressoraF.vFvcooini, CImpressoraF.vFvcoofin, CImpressoraF.vFvContRed,
                CImpressoraF.vFvcontRein, strtocurr(CImpressoraF.vFvvendBr),
                strtocurr(CImpressoraF.vFvGrandT), CImpressoraF.vMapaResumo); }
              obConfImp.fechaDia;
            end;
            vnivel := 0;
          except
            on E: Exception do
            begin
              if
                Application.MessageBox('Problema ao verificar Dias de Fechamento na Impressora, Mostrar Erro?',
                'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrYes then
                Application.MessageBox(pchar(E.Message), 'Erro', MB_ICONERROR + mb_OK);
            end;
          end;
        end;
        Application.MessageBox('Abre Dia Fiscal', 'Informação', MB_ICONINFORMATION + mb_OK);
        MensagemFiscal('Definindo Condições Para Impressora');
        CImpressoraF.AberturaDoDia('', '');
        limpaMensagem;
        CImpressoraF.FechaPortaSerial;
        Result := true;
        CImpressoraF.AbrePortaS(''); // Reabre a porta que foi fechada anteriormente...
        cancelarPreVendasAbertasAntesReducaoZ(True, Date - 2);
      end;
    10:
      begin
        CImpressoraF.FechaPortaSerial;
        Result := true;
        semConexao := true;
      end;
    11:
      begin

        CImpressoraF.LeituraX;
      end;
    17:
      begin
        Result := TRUE;
        if not CImpressoraF.AbrePortaS('') then
          Exit;
        if not CImpressoraF.CancelaItemGenerico(obCupom.vItem.getNItem) then
        begin
          EnvCmdsCupom := false;
          exit;
        end;
      end;
  end;

end;

function TIni.enviaVendaItemImpressora(nBarra, descricao, aliqSitTrib,
  quantidade: string; digitosVlUnit: integer; valorVenda, descontoAcrescimoPerc,
  descontoAcrescimoValor, vQuantidade: Real): boolean;
begin
  Result := true;
  CImpressoraF.vFqtdDig := digitosVlUnit;
  CImpressoraF.vFcdescit := Format('%12.3f', [obCupom.getValorDesconto]); //, ffGeneral, 12, 3);
  CImpressoraF.vFcdescit := StringReplace(CImpressoraF.vFcdescit, ' ', '', [rfReplaceAll,
    rfIgnoreCase]);
  CImpressoraF.vFcdescit := StringReplace(CImpressoraF.vFcdescit, '.', '', [rfReplaceAll,
    rfIgnoreCase]);
//  if not CImpressoraF.VendeItem(NBarra, CImpressoraF.Descricaoimp(descricao),
//    aliqSitTrib, 'F', quantidade, CImpressoraF.vFqtdDig, valorVenda, '$',
//    descontoAcrescimoPerc, descontoAcrescimoValor, vQuantidade) then
//  begin
//    obCupom.somaTotal((-1) * obCupom.getUltimoValor);
//    Result := false;
//  end;
  if not CImpressoraF.VendeItemSimples(copy(NBarra,1,14), CImpressoraF.Descricaoimp(descricao),
    aliqSitTrib, valorVenda, vQuantidade, descontoAcrescimoPerc,descontoAcrescimoValor) then
  begin
    obCupom.somaTotal((-1) * obCupom.getUltimoValor);
    Result := false;
  end;
  if Trim(vNumSerieEcf) = 'EPMM0400000000000001' then
    Sleep(100);
end;

procedure TIni.espelhoMFD(dataIni, dataFim: string);
var
  nowStr, nomeArquivo: string;
  Buffer: AnsiString;
  Arq: TextFile;
begin
  if EnvCmdsCupom(2) then
  begin
    nowStr := DateTimeToStr(now);
    nowStr := StringReplace(nowStr, '/', '-', [rfReplaceAll, rfIgnoreCase]);
    nowStr := StringReplace(nowStr, ':', '-', [rfReplaceAll, rfIgnoreCase]);
    nowStr := StringReplace(nowStr, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
    nomeArquivo := vPathArquivosDigitais + '\ESPMFD' + nowStr +
      '.txt';
    CImpressoraF.espelhoMFDporData(dataIni, dataFim, '', nomeArquivo, vCodPropEcf);
    EnvCmdsCupom(10);
    gerarMD5ArquivoEletronico(nomeArquivo);
    if FileExists(nomeArquivo) then
      Application.MessageBox(pchar('Arquivo Espelho MFD por Data criado com sucesso'+#13+
        'O arquivo foi salvo em: '+nomeArquivo), 'Atenção', 0 + 64);
    {try
      AssignFile(Arq, nomeArquivo);
        Append(arq);
        WriteLn(arq, '');
        CloseFile(Arq);
      Buffer := Sign_RSA_MD5(pchar(ExtractFilePath(Application.Exename)), nomeArquivo);
      begin
        AssignFile(Arq, nomeArquivo);
        Append(arq);
        WriteLn(arq, 'EAD' + buffer);
        CloseFile(Arq);
      end;
    except
      Application.MessageBox(pchar('Erro ao gravar assinatura digital'), 'Erro', MB_ICONERROR +
        MB_OK);
    end;}
  end;
end;

procedure TIni.espelhoMFD(cooIni, cooFim: Integer);
var
  nowStr, nomeArquivo: string;
  Buffer: AnsiString;
  Arq: TextFile;
begin
  if EnvCmdsCupom(2) then
  begin
    nowStr := DateTimeToStr(now);
    nowStr := StringReplace(nowStr, '/', '-', [rfReplaceAll, rfIgnoreCase]);
    nowStr := StringReplace(nowStr, ':', '-', [rfReplaceAll, rfIgnoreCase]);
    nowStr := StringReplace(nowStr, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
    nomeArquivo := vPathArquivosDigitais + '\ESPMFD' + nowStr + '.txt';
    CImpressoraF.espelhoMFDporCOO(IntToStr(cooIni), IntToStr(cooFim), '', nomeArquivo,
      vCodPropEcf);
    EnvCmdsCupom(10);
    gerarMD5ArquivoEletronico(nomeArquivo);
    if FileExists(nomeArquivo) then
      Application.MessageBox(pchar('Arquivo Espelho MFD por COO criado com sucesso'+#13+
        'O arquivo foi salvo em: '+nomeArquivo), 'Atenção', 0 + 64);
    {try
      AssignFile(Arq, nomeArquivo);
        Append(arq);
        WriteLn(arq, '');
        CloseFile(Arq);
      Buffer := Sign_RSA_MD5(pchar(ExtractFilePath(Application.Exename)), nomeArquivo);
      begin
        AssignFile(Arq, nomeArquivo);
        Append(arq);
        WriteLn(arq, 'EAD' + buffer);
        CloseFile(Arq);
      end;
    except
      Application.MessageBox(pchar('Erro ao gravar assinatura digital'), 'Erro', MB_ICONERROR +
        MB_OK);
    end;}
  end;
end;

function TIni.existeComando(codigo: string; mostraMensagem: boolean): boolean;
begin
  if obComandos = nil then
    obComandos := TComandosImp.Create;
  Result := obComandos.existeComando(codigo, mostraMensagem);
end;

procedure TIni.FecharOp;
var
 vRel: TStringList;
 I: Integer;
begin
	if EnvCmdsCupom(2) then
	begin
		if (decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not strEstaContidoEm(vModoSistema, ['S', 'J'])) then
		begin
			if not obMovOP.movimentoFechado then
				Exit;

			vRel := TStringList.Create;

			if obMovOP.relatorioDeMovimento(vRel, True) then
			begin
				for I:= 0 to vRel.Count - 1 do
					CImpressoraF.RelatorioGerencial(vRel[I]);
				CImpressoraF.FechaRelatorioGerencial;
			end;
      Exit;

			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, '               FECHAMENTO DO OPERADOR           '));
			CImpressoraF.RelatorioGerencial2(Replicate('=', 48));
			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, 'CAIXA/PDV........: ' +
				StrZeroDec(obConfImp.dataSet.FieldByName('COD_TERMINAL').AsInteger, 4, 0)));
			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, 'NOME DO OP.......: ' + trim(vNomeFuncionario)));
			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, 'NUMERO MOVIMENTO.: ' + StrZero(obMovOP.numMovimento, 4)));
			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, 'DATA ABERTURA....: ' + FormatDateTime('dd/mm/yyyy hh:mm', obMovOP.diaAberto)));
			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, 'DATA FECHAMENTO..: ' + FormatDateTime('dd/mm/yyyy hh:mm', obMovOP.diaFechado)));
			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, ' '));
			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, ' '));
			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, '        ---------------------------------       '));
			CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, '                  ASS. DO OPERADOR              '));
			CImpressoraF.FechaRelatorioGerencial;

		end
		else
		CImpressoraF.FecharOp;
    EnvCmdsCupom(10);
  end;
end;

procedure TIni.gerarArquivoCotepe1704(dataIni, dataFim: string; pTipo: string);
var
  nowStr, nomeArquivo: string;
  Buffer: AnsiString;
  Arq: TextFile;
begin
  if EnvCmdsCupom(2) then
  begin
    nowStr := FormatDateTime('yyyy/mm/dd_hh:mm:ss', now);
    nowStr := '_' + StringReplace2(nowStr, '/:', '  ', true);
    nomeArquivo := vPathArquivosDigitais + '\' + pTipo + vNumSerieEcf + nowStr + '.txt';
    CImpressoraF.arquivoMFDCotepe1704porData(dataIni, dataFim, nomeArquivo, vCodPropEcf, pTipo);
    EnvCmdsCupom(10);
    gerarMD5ArquivoEletronico(nomeArquivo);
    if FileExists(nomeArquivo) then
      Application.MessageBox(pchar('Arquivo Arq. MFD por Data criado com sucesso'+#13+
        'O arquivo foi salvo em: '+nomeArquivo), 'Atenção', 0 + 64);
    {try
      AssignFile(Arq, nomeArquivo);
        Append(arq);
        WriteLn(arq, '');
        CloseFile(Arq);
      Buffer := Sign_RSA_MD5(pchar(ExtractFilePath(Application.Exename)), nomeArquivo);
      AssignFile(Arq, nomeArquivo);
      Append(arq);
      WriteLn(arq, 'EAD' + buffer);
      CloseFile(Arq);
    except
      Application.MessageBox(pchar('Erro ao gravar assinatura digital'), 'Erro', MB_ICONERROR +
        MB_OK);
    end;}
  end;
end;

procedure TIni.gerarArquivoCotepe1704(cooIni, cooFim: Integer; pTipo: string);
var
  nowStr, nomeArquivo: string;
  Buffer: AnsiString;
  Arq: TextFile;
begin
  if EnvCmdsCupom(2) then
  begin
    nowStr := FormatDateTime('yyyy/mm/dd_hh:mm:ss', now);
    nowStr := '_' + StringReplace2(nowStr, '/:', '  ', true);
    nomeArquivo := vPathArquivosDigitais + '\' + pTipo + vNumSerieEcf + nowStr + '.txt';
    CImpressoraF.arquivoMFDCotepe1704porCOO(IntToStr(cooIni), IntToStr(cooFim), nomeArquivo,
      vCodPropEcf, pTipo);
    EnvCmdsCupom(10);
    gerarMD5ArquivoEletronico(nomeArquivo);
    if FileExists(nomeArquivo) then
      Application.MessageBox(pchar('Arquivo Arq. MFD por COO criado com sucesso'+#13+
        'O arquivo foi salvo em: '+nomeArquivo), 'Atenção', 0 + 64);
    {try
      AssignFile(Arq, nomeArquivo);
        Append(arq);
        WriteLn(arq, '');
        CloseFile(Arq);
      Buffer := Sign_RSA_MD5(pchar(ExtractFilePath(Application.Exename)), nomeArquivo);
      begin
        AssignFile(Arq, nomeArquivo);
        Append(arq);
        WriteLn(arq, 'EAD' + buffer);
        CloseFile(Arq);
      end;
    except
      Application.MessageBox(pchar('Erro ao gravar assinatura digital'), 'Erro', MB_ICONERROR +
        MB_OK);
    end;}
  end;
end;

function TIni.getGrandeTotalCriptografadoEmArquivoAuxiliar: string;
var
  arquivo:TIniFile;
  ArqIni: string;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  arquivo := TIniFile.Create(ArqIni);
  Result := arquivo.ReadString(Trim(vCodTerminal), 'G', '');
  arquivo.free;
end;

function TIni.getGrandeTotalDescriptografado: string;
var
  TEMP: string;
begin
  temp :=
    StrZero(decodifica(getGrandeTotalCriptografadoEmArquivoAuxiliar),    20);
    temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
    temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
    temp := StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  Result := (temp);
end;

function TIni.getNItem: string;
var
  temp: string;
  tempV: Real;
begin
  obCupom.vItem.IndexFieldNames := 'NITEM';
  obCupom.vItem.Last;
  tempV := obCupom.vItem.getNItem + 1;
  Result := FloatToStr(tempV); //StrZeroDec(tempV,3,0);
end;

function TIni.getNumeroSerieCriptografadoEmArquivoAuxiliar: string;
var
  arquivo:TIniFile;
  ArqIni: string;
begin
	ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  arquivo := TIniFile.Create(ArqIni);
  Result := trim(arquivo.ReadString(Trim(vCodTerminal), 'N', ''));
  arquivo.Free;
end;

function TIni.getCodigoTerminalAtivo(pCodDefault: string): string;
var
  arquivo:TIniFile;
  ArqIni: string;
begin
  if not FileExists(ExtractFilePath(Application.Exename) + 'nserie.hw') then
  begin
    Result := pCodDefault;
    Exit;
  end;
    
  ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  arquivo := TIniFile.Create(ArqIni);
  Result := trim(arquivo.ReadString('T', 'A', '|||'));

  if Result = '|||' then
  begin
    if Trim(pCodDefault) <> '' then
      arquivo.WriteString('T', 'A', codifica(pCodDefault));
    Result := pCodDefault;
  end
  else
    Result := decodifica(Result);
  arquivo.Free;
end;

function TIni.getNumSerieEcfDescriptografado: string;
begin
	Result := decodifica(getNumeroSerieCriptografadoEmArquivoAuxiliar);
end;

function TIni.getSubTotalImpressora: string;
begin
  Result := CImpressoraF.SubTotal;
end;

procedure TIni.IdentificaoPAFECF;
begin
  try
    obIdentF := TIdentFiscal.create;
    obTermImp := TTerminal_Impressoras.create;
    if not EnvCmdsCupom(2) then
      exit;
    obIdentF.montaImpressaoIdentificacaoPAFECF;
    EnvCmdsCupom(10);
  finally
    obIdentF.Free;
    obTermImp.free;
    obIdentF := nil;
    obTermImp := nil;
  end;
end;

procedure TIni.ImpDAVEmitidos;
begin
  if not EnvCmdsCupom(2) then
    exit;
  CImpressoraF.ImpDavsEmitidos;
  EnvCmdsCupom(10);
end;

procedure TIni.ImpDAVOSEmitidos;
begin
  if not EnvCmdsCupom(2) then
    exit;
  CImpressoraF.ImpDavsOSEmitidos;
  EnvCmdsCupom(10);
end;

procedure TIni.ImpMeiosPagamento;
var
  vLista: TStringList;
  I: Integer;
  J: Integer;
  vData: TDate;
  vAcumulado: Extended;
  vFinalizador, vTipo_Documento: string;
  vValorCancelado: Extended;
begin
//  CImpressoraF.ImpMeiosDePagamento;
  try
    Screen.Cursor := crHourGlass;

    if obCupom.vMeiosPag.vDataSetMP.Tag <> 22 then
      try
        obCupom.vMeiosPag.vDataSetMP.CreateDataSet;
        obCupom.vMeiosPag.vDataSetMP.Tag := 22;
      except
      end;

    obCupom.vMeiosPag.vDataSetMP.EmptyDataSet;

		if bancoConectado = 'servidor' then
    begin

      obProd.buscas.Close;
      obProd.buscas.SQL.Text := 'select sum(fp.valordoc) soma, c.codigo_ctrl, c.nome_ctrl, fp.data_mov  from formpagamento fp' +
        ' inner join controles c on c.codigo_ctrl = fp.cod_controle and c.codigo_emp = fp.cod_empresa' +
        ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim and coalesce(fp.num_nota,0) > 0' +
        ' group by 2,3,4';
      obProd.buscas.ParamByName('dataIni').AsDate := obCupom.vMeiosPag.vDataIni;
      obProd.buscas.ParamByName('dataFim').AsDate := obCupom.vMeiosPag.vDataFim;
      obProd.buscas.Open;

      obProd.buscas.First;
      while not obProd.buscas.Eof do
      begin
        obCupom.vMeiosPag.vDataSetMP.Insert;
        obCupom.vMeiosPag.vDataSetMP.FieldByName('data').AsDateTime :=
          obProd.buscas.FieldByName('data_mov').AsDateTime;
        if Trim(obProd.buscas.FieldByName('nome_ctrl').AsString) = 'DINHEIRO' then
          obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString := 'Dinheiro'
        else
          obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString :=
            Trim(obProd.buscas.FieldByName('nome_ctrl').AsString);
        obCupom.vMeiosPag.vDataSetMP.FieldByName('tipo_documento').AsString :=
          Trim('Nota Fiscal');
        obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat :=
          obProd.buscas.FieldByName('soma').AsFloat;
        obCupom.vMeiosPag.vDataSetMP.Post;
        obProd.buscas.Next;
      end;
    end;

    if (obCupom.vMeiosPag.dataSet.IsEmpty) and (obProd.buscas.IsEmpty)  then
    begin
      Application.MessageBox(pchar('Nenhum meio de pagamento encontrado no período informado'), 'Atenção', 0 + 64);
      exit;
    end;

    vLista := TStringList.Create;
    vLista.Clear;
    vData := 0;

    vLista.Add('               MEIOS DE PAGAMENTO               ');
    vLista.Add(Replicate('=', 48));
    vLista.Add(CImpressoraF.vTituloRel);
    vLista.Add('  ');

    obCupom.vMeiosPag.First;
    while not obCupom.vMeiosPag.dataSet.Eof do
    begin
      vValorCancelado := 0;
      if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'CUP' then
        vValorCancelado := obCupom.vMeiosPag.getValorCancelado(
          obCupom.vMeiosPag.dataSet.FieldByName('cod_finalizador').AsInteger,
          obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime,
          obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime);

      if vValorCancelado < obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat then
      begin
        if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'CUP' then
          vTipo_Documento := Trim('Cupom Fiscal')
        else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'REC' then
          vTipo_Documento := Trim('Comprovante Nao Fiscal')
        else if obCupom.vMeiosPag.dataSet.FieldByName('tipo_doc').AsString = 'SUP' then
          vTipo_Documento := Trim('Comprovante Nao Fiscal');
        vFinalizador := Trim(obCupom.vMeiosPag.dataSet.FieldByName('desc_final').AsString);

        obCupom.vMeiosPag.vDataSetMP.Filtered := False;
        obCupom.vMeiosPag.vDataSetMP.Filter := 'data = ' +
          QuotedStr(FormatDateTime('dd/mm/yyyy', obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime)) +
          ' and finalizador = ' + QuotedStr(Trim(vFinalizador)) +
          ' and tipo_documento = ' + QuotedStr(Trim(vTipo_Documento));
        obCupom.vMeiosPag.vDataSetMP.Filtered := True;

        if (obCupom.vMeiosPag.vDataSetMP.FieldByName('data').AsDateTime =
          obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime) and
          (Trim(obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString) = Trim(vFinalizador)) and
          (Trim(obCupom.vMeiosPag.vDataSetMP.FieldByName('tipo_documento').AsString) = Trim(vTipo_Documento)) then
        begin
          obCupom.vMeiosPag.vDataSetMP.Edit;
          obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat :=
            obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat +
            obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
            vValorCancelado ;
          obCupom.vMeiosPag.vDataSetMP.Post;
        end
        else
        begin
          obCupom.vMeiosPag.vDataSetMP.Insert;
          obCupom.vMeiosPag.vDataSetMP.FieldByName('data').AsDateTime :=
            obCupom.vMeiosPag.dataSet.FieldByName('data').AsDateTime;
          obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString := Trim(vFinalizador);
          obCupom.vMeiosPag.vDataSetMP.FieldByName('tipo_documento').AsString := Trim(vTipo_Documento);
          obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat :=
            obCupom.vMeiosPag.dataSet.FieldByName('soma').AsFloat -
            vValorCancelado ;
          obCupom.vMeiosPag.vDataSetMP.Post;
        end;
      end;
      obCupom.vMeiosPag.dataSet.next;
    end;

//    if vDadosIniF.bancoConectado = 'servidor' then
//    begin
//
//      obProd.buscas.Close;
//      obProd.buscas.SQL.Text := 'select sum(fp.valordoc) soma, c.codigo_ctrl, c.nome_ctrl, fp.data_mov  from formpagamento fp' +
//        ' inner join controles c on c.codigo_ctrl = fp.cod_controle and c.codigo_emp = fp.cod_empresa' +
//        ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim and coalesce(fp.num_nota,0) > 0' +
//        ' group by 2,3,4';
//      obProd.buscas.ParamByName('dataIni').AsDate := obCupom.vMeiosPag.vDataIni;
//      obProd.buscas.ParamByName('dataFim').AsDate := obCupom.vMeiosPag.vDataFim;
//      obProd.buscas.Open;
//
//      obProd.buscas.First;
//      while not obProd.buscas.Eof do
//      begin
//        obCupom.vMeiosPag.vDataSetMP.Insert;
//        obCupom.vMeiosPag.vDataSetMP.FieldByName('data').AsDateTime :=
//          obProd.buscas.FieldByName('data_mov').AsDateTime;
//        if Trim(obProd.buscas.FieldByName('nome_ctrl').AsString) = 'DINHEIRO' then
//          obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString := 'Dinheiro'
//        else
//          obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString :=
//            Trim(obProd.buscas.FieldByName('nome_ctrl').AsString);
//        obCupom.vMeiosPag.vDataSetMP.FieldByName('tipo_documento').AsString :=
//          Trim('Nota Fiscal');
//        obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat :=
//          obProd.buscas.FieldByName('soma').AsFloat;
//        obCupom.vMeiosPag.vDataSetMP.Post;
//        obProd.buscas.Next;
//      end;
//    end;

    // Detalhes diarios
    vData := 0;
    vAcumulado := 0;
    obCupom.vMeiosPag.vDataSetMP.IndexFieldNames := 'DATA';
    obCupom.vMeiosPag.vDataSetMP.Filtered := False;
    obCupom.vMeiosPag.vDataSetMP.First;
    while not obCupom.vMeiosPag.vDataSetMP.Eof do
    begin
      if vData <> obCupom.vMeiosPag.vDataSetMP.FieldByName('data').AsDateTime then
      begin
        if vData <> 0 then
        begin
          vLista.Add('Soma do dia ' + FormatDateTime('dd/mm/yyyy', vData) + ': ' + Format('%0.2f', [vAcumulado]));
          vLista.Add('---');
        end;
        vData := obCupom.vMeiosPag.vDataSetMP.FieldByName('data').AsDateTime;
        vAcumulado := 0;
      end;

      vLista.Add(FormatDateTime('dd/mm/yyyy', vData) + ' ' +
        Copy(obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString + '            ', 1, 12) + ' ' +
        Copy(obCupom.vMeiosPag.vDataSetMP.FieldByName('tipo_documento').AsString + '                      ', 1, 22));
      vLista.Add(
        Replicate(' ', 48 - ( Length(Format('%0.2f', [obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat])) ) ) +
        Format('%0.2f', [obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat]));
      vAcumulado := vAcumulado + obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat;
      obCupom.vMeiosPag.vDataSetMP.Next;
    end;
    vLista.Add('Soma do dia ' + FormatDateTime('dd/mm/yyyy', vData) + ': ' + Format('%0.2f', [vAcumulado]));
    vLista.Add('---');
    
    vLista.Add('TOTAL DO PERIODO SOLICITADO');
    vFinalizador := '';
    vAcumulado := 0;
    obCupom.vMeiosPag.vDataSetMP.IndexFieldNames := 'FINALIZADOR';
    obCupom.vMeiosPag.vDataSetMP.Filtered := False;
    obCupom.vMeiosPag.vDataSetMP.First;
    while not obCupom.vMeiosPag.vDataSetMP.Eof do
    begin
      if Trim(vFinalizador) <> Trim(obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString) then
      begin
        if vFinalizador <> '' then
          vLista.Add(vFinalizador + ' - ' + Format('%0.2f', [vAcumulado]));
        vFinalizador := obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString;
        vAcumulado := obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat;
      end
      else
      begin
        vFinalizador := obCupom.vMeiosPag.vDataSetMP.FieldByName('finalizador').AsString;
        vAcumulado := vAcumulado + obCupom.vMeiosPag.vDataSetMP.FieldByName('valor').AsFloat;
      end;
      obCupom.vMeiosPag.vDataSetMP.Next;
    end;
    vLista.Add(vFinalizador + ' - ' + Format('%0.2f', [vAcumulado]));

    MensagemFiscal('Imprimindo');
    CImpressoraF.abrerelatorioGer;
    for I := 0 to vlista.Count - 1 do
      CImpressoraF.RelatorioGerencial2(
        CImpressoraF.TamDescricao(48, vLista[I] + '                                                ' ));
    CImpressoraF.FechaRelatorioGerencial;


  finally
    limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.ImpResumoVnd;
begin
  if not EnvCmdsCupom(2) then
    exit;
  CImpressoraF.ImpResumoVnd;
  EnvCmdsCupom(10);
end;

function TIni.imprimeDavNoEcf(var pDav: RVenda): boolean;
begin
  if not EnvCmdsCupom(2) then
    Exit;
  Result := CImpressoraF.imprimeDavNoEcf(pDav);
  if result then
  begin
    pDav.COO_Impressao := StrToInt(CImpressoraF.NumeroCupom);
    pDav.NSerie_Impressao := vNumSerieEcf;
    pDav.CAIXA_Impressao := StrToInt(vCodTerminal);
  end;
end;

function TIni.inicializaFiscal: boolean;
var
  vVerificarTefEntrada: Boolean;
  vTempCupom: string;
  vValorTEF, vSaqueTEF, vDescTEF: Currency;
  vNSUTef: string;
  vFinalizadorTEF: Integer;
  vValorRestante: Currency;
  vValorCupom: Currency;
  enviarCNF: Boolean;
begin
  try
    MensagemFiscal('Iniciando Sistema Fiscal...');
    Result := true;
    inicializaVariaveis;
    obConfImp := TConfImp.create;
    obConfImp.getTodos;
    vCodTerminal := getCodigoTerminalAtivo(obConfImp.dataSet.FieldByName('cod_terminal').AsString);
    if Trim(vCodTerminal) = '' then
    begin
      Application.MessageBox('Número do terminal não encontrado. Execute o assistente de configuração',
        'Atenção',0+64);
      Result := False;
      exit;
    end;
    vNumSerieEcf := getNumSerieEcfDescriptografado;
//    decodifica(obConfImp.dataSet.FieldByName('num_serie_ecf').AsString);
    vUsaCodigoBarras := decodifica(obConfImp.dataSet.FieldByName('usar_codbarra').AsString);
    vUsaTef := decodifica(obConfImp.dataSet.FieldByName('usar_tef').AsString);
    vUsaLeitorSerial := Decodifica(obConfImp.dataSet.FieldByName('LEITOR_SERIAL').AsString);
    vUsaTecladoPDV := Decodifica(obConfImp.dataSet.FieldByName('teclado_pdv').AsString);
    vModeloBal:= uppercase(Decodifica(obConfImp.dataSet.FieldByName('modelo_balanca').AsString));
    vStringTabelaPrecoADPAF := obConfImp.dataSet.FieldByName('TAB_PRECO_AD').AsString;
    if vUsaTecladoPDV = 'S' then
      vModoConsulta := 'A';
    vQtdeDigDAV := obConfImp.dataSet.FieldByName('QTDE_DIG_DAV').AsInteger;
    vCodCNIEE :=
      obConfImp.retornaValor('select ident_cniee as valor from terminal_impressoras' +
      ' where num_serie_ecf = ' + QuotedStr(codifica(vNumSerieEcf)) +
      ' and cod_terminal = ' + vCodTerminal + ' and cod_empresa = ' + codEmpresa);
    vTemMFD := obConfImp.retornaValor('SELECT IC.temfd AS VALOR FROM impressoras_cniee IC WHERE IC.identificacao = ' +
      QuotedStr(vCodCNIEE));
    if vTemMFD <> 'S' then
      vTemMFD := 'N';
    vCodPropEcf :=
      obConfImp.retornaValor('select cod_proprietario as valor from terminal_impressoras' +
      ' where num_serie_ecf = ' + QuotedStr(codifica(vNumSerieEcf)) +
      ' and cod_terminal = ' + vCodTerminal + ' and cod_empresa = ' + codEmpresa);
    if (vQtdeDigDAV < 10) or (vQtdeDigDAV > 13) then
      vQtdeDigDAV := 10;
    vDescontoISS :=
      obConfImp.retornaValor('select issqndesc as valor from terminal_impressoras' +
      ' where num_serie_ecf = ' + QuotedStr(codifica(vNumSerieEcf)) +
      ' and cod_terminal = ' + vCodTerminal + ' and cod_empresa = ' + codEmpresa);

    obEmpresa := TEmpresaF.create;
    obEmpresa.selecionaEmpresa(codEmpresa);
    obCupom := TCupom.create;
//    MensagemFiscal('Copiando Backup do servidor');
    limpaMensagem;
    verificarNovoHwF();

    obFinalizador := TFinalizador.create;
    obTotalizador := TTotalizadorNaoFiscal.create;
    obCliente := TClienteF.create;
    obProd := TProdutoF.create;
    obServ := TServicoF.create;
    obResumoD := TResumoD.create;
    obTmpOp := TTempoOp.create;
    obDocNF := TDoc_Nao_Fiscais.create;

		obMovOP := TMovimento_Operador.create;
    obSangSup := TSangSup.create;
    obSangSup.verificaCampos;
    obSangSup.Free;
    obSangSup := nil;

    vHwSinc := TAtualizacaoRetaguarda.create;

    if vUsaTef = 'E' then
       obtef := TTEFDedicado.create
    else
       obtef := TTEFDiscado.create;

    try
      obIdentF := TIdentFiscal.create;
      obTermImp := TTerminal_Impressoras.create;
      obIdentF.abreIdentFiscal(True);
      //vMD5Fiscal := obIdentF.dataSet.FieldByName('md5_paf').AsString;
      obTef.TEFSHouse := obIdentF.sNomeSHouse;//;.FieldByName('nome_empdes').AsString;
//      obTef.TEFSHouse := Copy(StringReplace(obTef.TEFSHouse, ' ', '',[rfReplaceAll]), 1, 8);
    finally
      obIdentF.Free;
      obTermImp.free;
      obIdentF := nil;
      obTermImp := nil;
    end;

    ///---------Verificando TEF---------------------------------///

    //Verifica Iregularidades * Talvez seja melhor fazer isto no pkEntrada

    //testa portas
    MensagemFiscal('Testando portas...');
    testaPortas;

    //testa Integridade do Banco
    MensagemFiscal('Verificando banco de dados...');
    testaIntegridadeBanco;

    //Definindo impressoras
    MensagemFiscal('Definindo Impressora...');
		definirImpressora;

    if Pos('generico hw', LowerCase(decodifica(obConfImp.dataSet.FieldByName('MODELO_BALANCA').AsString))) > 0 then
      obBalanca := TBalanca_hw_generic.create(decodifica(obConfImp.dataSet.FieldByName('MODELO_BALANCA').AsString))
    else
      obBalanca := TBalanca_PCScale.create(decodifica(obConfImp.dataSet.FieldByName('MODELO_BALANCA').AsString));

		if not CImpressoraF.SemArquivoAux then
			CImpressoraF.EqualizarVelocidade;
		if not CImpressoraF.SemArquivoAux then
			CImpressoraF.AbrePortaS('');

		CImpressoraF.vPermitirVenda := False;
		CImpressoraF.SemDireitoDeUso := False;

		{if (vUsaTef = 'E') or (vUsaTef = 'I') then
		begin
			MensagemFiscal('Verificando operações pendentes no TEF');
//      if vtefdial = 'S' then
//      begin
//        obTef.iTEFTecban := 0;
//        obTef.sTEFPath := 'C:\TEF_DIAL\';
//        obTef.verificaOperacaoPendente(CImpressoraF);
//      end;
//       Verifica Tef_Disc
//      if vtefdisc = 'S' then
//      begin
//        obTef.iTEFTecban := 1;
//        obTef.sTEFPath := 'C:\TEF_DISC\';

				if obTef.verificaOperacaoPendenteEntrada(CImpressoraF) then
				begin
					if not CImpressoraF.AbrePortaS('') then
					begin
						Application.MessageBox(pchar('Porta não pode ser aberta'), 'Atenção', MB_ICONEXCLAMATION +
							MB_OK);
						alteraPortaCom
						Result := false;
						exit;
					end;
					//Verifica o numero de serie doECF
					Sleep(3000);
					MensagemFiscal('Verificando número de Série do Equipamento');
					if not EnvCmdsCupom(6) then
					begin
						alteraPortaCom;
						Result := false;
						exit;
						if vSistema = 'Fiscal' then
							abort;
					end;

					CImpressoraF.vPermitirVenda := verificaGrandeTotal;

					//Verifica o ultimo cupom emitido
					MensagemFiscal('Verificando último cupom emitido');
					if not ultimoCupomEmitidoNaoFechado then
					begin
						Result := false;
						exit;
					end;
				end;
				obTef.verificaOperacaoPendente(CImpressoraF);
//        obTef.iTEFTecban := 0;
//        obTef.sTEFPath := 'C:\TEF_DIAL\';
//      end;
//      obTef.limpaVariaveisNovoCartao;
		end;

		if not CImpressoraF.AbrePortaS('') then
		begin
			Application.MessageBox(pchar('Porta não pode ser aberta'), 'Atenção', MB_ICONEXCLAMATION +
				MB_OK);
			alteraPortaCom
			Result := false;
			exit;
		end;}

		while not CImpressoraF.AbrePortaS('')  do
		// not CImpressoraF.AbrePortaS('') then
		begin
			Application.MessageBox(pchar('Porta não pode ser aberta'), 'Atenção', MB_ICONEXCLAMATION +
				MB_OK);
			if not alteraPortaCom then
			begin
				Result := false;
				exit;
			end;
		end;

		vVerificarTefEntrada:= True;
		if ((vUsaTef = 'E') or (vUsaTef = 'I')) then
			vCancelarCupomOuMontarCupom := 'C';
		MensagemFiscal('Verificando operações pendentes no TEF');
    if (vCancelarCupomOuMontarCupom = 'C') and ((vUsaTef = 'E') or (vUsaTef = 'I')) and (CImpressoraF.cupomAberto) then
    begin // mudei isso durante a homologação, precisa testar mais para montar o cupom novamente, entao cancela tudo ates testar direito
      MensagemFiscal('Verificando operações pendentes no TEF');
      obTef.existetransacaoTefPendente;
      obTef.cancelaOperacoesAnteriores(CImpressoraF);
    end
    else if (vUsaTef = 'E') or (vUsaTef = 'I') then
    begin
      enviarCNF := False;
      vVerificarTefEntrada:= False;
      MensagemFiscal('Verificando operações pendentes no TEF');
      vTempCupom := obCupom.ultimoCupomEmitidoNaoFechado;

      if Trim(vTempCupom) <> '' then
      begin
        obCupom.vFinCupom.selecionaFinCupom(obCupom.dataSet.FieldByName('cupom').AsInteger,
          obCupom.dataSet.FieldByName('registro').AsInteger,
          codifica(vNumSerieEcf));
        vNSUTef := '';

        if obTef.existeDadosArquivoBkpFormPagamento(
          obCupom.dataSet.FieldByName('cupom').AsInteger,vValorTEF, vSaqueTEF, vNSUTef,
          vFinalizadorTEF, vDescTEF) then
        begin
          if Trim(vNSUTef) > '' then
          begin
            obCupom.vFinCupom.vValorSaque := vSaqueTEF;
            obCupom.vFinCupom.vValorDescPremia := vDescTEF;
            obCupom.vFinCupom.insereFimCupom(
              obCupom.dataSet.FieldByName('registro').AsInteger,
              obCupom.dataSet.FieldByName('cupom').AsInteger, vFinalizadorTEF, 0, 0,
              obCupom.dataSet.FieldByName('ccf').AsInteger,
              vValorTEF, vValorTEF, 'CUP');
            if vUsaTef = 'E' then
              obTef.gravaDadosArquivoBkpFormPagamento(0,0,0,0,'',0);
            obFinalizador.FindNearest([vFinalizadorTEF]);
          end;
        end;
        vValorRestante := obCupom.getValorFinCupom;
        vValorCupom := obCupom.dataSet.FieldByName('total').AsCurrency +
          obCupom.dataSet.FieldByName('valor_acres').AsCurrency -
          obCupom.dataSet.FieldByName('valor_desc').AsCurrency;

        if StrToFloatFormat(vValorRestante,2) < StrToFloatFormat(vValorCupom,2) then
        begin
          MensagemFiscal('Verificando operações pendentes no TEF');
          obTef.existetransacaoTefPendente;
          obTef.cancelaOperacoesAnteriores(CImpressoraF);
          obCupom.cancelaFinCupomUltimoCupomEmitidoNaoFechado;
        end
        else
        begin
          MensagemFiscal('Verificando operações pendentes no TEF');
          obTef.existetransacaoTefPendente;
          obTef.cancelaOperacoesAnteriores(CImpressoraF);
          obCupom.cancelaFinCupomUltimoCupomEmitidoNaoFechado;
        end;
      end
      else
      begin
        MensagemFiscal('Verificando operações pendentes no TEF');
        //obTef.obTransTef.alteraStatusTranstef('NCN');
        obTef.verificaOperacaoPendenteEntrada(CImpressoraF);
        obTef.verificaOperacaoPendente(CImpressoraF);
      end;
    end;

    //Verifica o numero de serie doECF
    try
      Sleep(StrToInt(vSleepInicioDepoisAbrePortas));
    except
    end;
		MensagemFiscal('Verificando número de Série do Equipamento');
		if not semArquivoAuxiliar('S') then
    while not EnvCmdsCupom(6) do
    //if not EnvCmdsCupom(6) then
    begin

      if application.messageBox(pchar('Impressora não responde. Tentar conectar novamente?'),'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = mrNo then
      begin
        //cielo
//        if (vUsaTef = 'E') or (vUsaTef = 'I') then
//          if enviarCNF then
//          begin
//            MensagemFiscal('Verificando operações pendentes no TEF');
//            obTef.existetransacaoTefPendente;
//            obTef.cancelaOperacoesAnteriores(CImpressoraF);
//          end;
        Result := false;
        alteraPortaCom;
        exit;
      end;

      MensagemFiscal('Verificando número de Série do Equipamento');
      //if vSistema = 'Fiscal' then
        //abort;
    end;

		if not semArquivoAuxiliar('N') then
    if obCupom.verificaExisteCupomFechadoImpressoraNaoFechadoNoBanco then
    begin
      MensagemFiscal('Verificando operações pendentes no TEF');
      obTef.verificaOperacaoPendenteEntrada(CImpressoraF);
      obTef.verificaOperacaoPendente(CImpressoraF);
    end;

    {if ((vUsaTef = 'E') or (vUsaTef = 'I')) and (vVerificarTefEntrada) then
    begin
      MensagemFiscal('Verificando operações pendentes no TEF');
      obTef.verificaOperacaoPendenteEntrada(CImpressoraF);
    end;}

    CImpressoraF.vPermitirVenda := verificaGrandeTotal;

    //Verifica o ultimo cupom emitido
		MensagemFiscal('Verificando último cupom emitido');
		if not semArquivoAuxiliar('N') then
    if vCancelarCupomOuMontarCupom = 'C' then
      if not ultimoCupomEmitidoNaoFechado then
      begin
        Result := false;
        exit;
      end;

		if not semArquivoAuxiliar('N') then
		if not CImpressoraF.cupomAberto then
		begin
      if ((vUsaTef = 'E') or (vUsaTef = 'I')) and (vVerificarTefEntrada) then
      begin
        MensagemFiscal('Verificando operações pendentes no TEF');
        obTef.verificaOperacaoPendenteEntrada(CImpressoraF);
      end;
    end;

    {if ((vUsaTef = 'E') or (vUsaTef = 'I')) and (vVerificarTefEntrada) then
    begin
      MensagemFiscal('Verificando operações pendentes no TEF');
      obTef.verificaOperacaoPendente(CImpressoraF);
    end;}

    //Verifica data e Hora
		MensagemFiscal('Verificando data e hora da impressora');
		if not semArquivoAuxiliar('N') then
		if not dataHoraConfereComImp then
    begin
      Result := false;
      exit;
      if vSistema = 'Fiscal' then
        abort;
    end;

    //Verificando aliquotas de trabalho da impressora
		MensagemFiscal('Recuperando alíquotas de trabalho');
		if not semArquivoAuxiliar('N') then
		begin
		if pos(trim(CImpressoraF.NumeroSerie),Trim(getNumSerieEcfDescriptografado)) > 0   then
			CImpressoraF.recuperacaoAutomaticaAliquotas;
		CImpressoraF.defineArredondamentoTruncamento;
		vIndicadorArredondamentoOuTruncamento := CImpressoraF.vtipoArredond;
		end;

		//Abre o dia caso nao tenha sido aberto e verifica fechamento do dia anterior
		MensagemFiscal('Verificando abertura do dia');

		if not semArquivoAuxiliar('N') then
		if CImpressoraF.vPermitirVenda then
			if not verificarAberturaDoDia then
			begin
				if vModoSistema <> 'J' then
					Application.Terminate;
				exit;
				abort;
			end;

		if not semArquivoAuxiliar('N') then
		begin

		EnvCmdsCupom(10);
		semConexao := true;
		if not EnvCmdsCupom(2) then
			Exit;
		MensagemFiscal('Definindo data de trabalho');
		CImpressoraF.diaCaixaFechado;
		end;

		obCupom.selecionaCupom(vCodTerminal, vNumSerieEcf,
			Date);

    limpaMensagem;
    if vSincronizacaoEmSegundoPlano <> 'S' then
      try
				abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
				vHwSinc._sincronizarDados;
			finally
        fechaStatusProcessamento;
      end;
    limpaMensagem;

    if verificaGrandeTotal then
      CImpressoraF.vPermitirVenda := true
    else
      CImpressoraF.vPermitirVenda := false;

//    if obEmpresa.dataSet.FieldByName('COPIAR_HWF_TERM_RET').AsString = 'T' then
//      obConfImp.verificaHwF;
    CImpressoraF.FechaPortaSerial;

    ///Abrindo as tabelas de clientes, produtos e serviços para consulta;
    //openTable := 'TODOS';
    //    tOpenTable.Create(false);
  finally
    limpaMensagem;
  end;
end;

procedure TIni.inicializaVariaveis;
begin
  try
    vCodTerminal := '';
  except
  end;
  try
    vNumSerieEcf := '';
  except
  end;
  try
//    bancoConectado := '';
  except
  end;
  try
    semConexao := false;
  except
  end;
  try
    retorno_Var := '';
  except
  end;
  try
    openTable := '';
  except
  end;
  try
    vSubTotal := 0;
  except
  end;
  try
    vPassarpelocodigo := 1;
  except
  end;
  try
    vUsaCodigoBarras := 'S';
  except
  end;
end;

procedure TIni.leituraMeroriaFiscal(dataIni, dataFim, tipoImpOuArq, CompletaSimplificada: string);
var
  nowStr, nomeArquivo: string;
  Buffer: AnsiString;
  Arq: TextFile;
  vMsg: string;
begin
  if UpperCase(tipoImpOuArq) = 'IMP' then
  begin
    //    if not semConexao then
    begin
      if EnvCmdsCupom(2) then
      begin
        if not EnvCmdsCupom(6) then
        begin
          EnvCmdsCupom(10);
          exit;
        end;
        CImpressoraF.LeituraMemoriaFiscalData(dataIni, dataFim, CompletaSimplificada);
        EnvCmdsCupom(10);
        Application.MessageBox('Leitura efetuada!', 'Informação', MB_ICONINFORMATION + MB_OK);
      end;
    end;
  end
  else if UpperCase(tipoImpOuArq) = 'ARQ' then
  begin
    if EnvCmdsCupom(2) then
    begin
      nowStr := DateTimeToStr(now);
      nowStr := StringReplace(nowStr, '/', '-', [rfReplaceAll, rfIgnoreCase]);
      nowStr := StringReplace(nowStr, ':', '-', [rfReplaceAll, rfIgnoreCase]);
      nowStr := StringReplace(nowStr, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
      nomeArquivo := vPathArquivosDigitais + '\LMF' + UpperCase(CompletaSimplificada) + nowStr +
        '.txt';
      CImpressoraF.LeituraMemoriaFiscalSerialData(dataIni, dataFim, CompletaSimplificada,
        nomeArquivo);
      EnvCmdsCupom(10);
      gerarMD5ArquivoEletronico(nomeArquivo);
      vMsg := 'LMFC';
      if CompletaSimplificada = 's' then
        vMsg := 'LMFS';
      Application.MessageBox(pchar('Arquivo '+vMsg+' por Data criado com sucesso'+#13+
      'O arquivo foi salvo em: '+nomeArquivo), 'Atenção', 0 + 64);
      {try
        AssignFile(Arq, nomeArquivo);
        Append(arq);
        WriteLn(arq, '');
        CloseFile(Arq);
        Buffer := Sign_RSA_MD5(pchar(ExtractFilePath(Application.Exename)), nomeArquivo);
        begin
          AssignFile(Arq, nomeArquivo);
          Append(arq);
          WriteLn(arq, 'EAD' + buffer);
          CloseFile(Arq);
        end;
      except
        Application.MessageBox(pchar('Erro ao gravar assinatura digital'), 'Erro', MB_ICONERROR +
          MB_OK);
      end; }
    end;
  end;
end;

procedure TIni.leituraMeroriaFiscal(cooIni, cooFim: Integer; tipoImpOuArq, CompletaSimplificada:
  string);
var
  nowStr, nomeArquivo, vMsg: string;
  //Buffer: AnsiString;
  Arq: TextFile;
begin
  if UpperCase(tipoImpOuArq) = 'IMP' then
  begin
    if EnvCmdsCupom(2) then
    begin
      CImpressoraF.LeituraMemoriaFiscalReducao(IntToStr(cooIni), IntToStr(cooFim),
        CompletaSimplificada);
      EnvCmdsCupom(10);
      Application.MessageBox('Leitura efetuada!', 'Informação', MB_ICONINFORMATION + MB_OK);
    end;
  end
  else if UpperCase(tipoImpOuArq) = 'ARQ' then
  begin
    if EnvCmdsCupom(2) then
    begin
      nowStr := DateTimeToStr(now);
      nowStr := StringReplace(nowStr, '/', '-', [rfReplaceAll, rfIgnoreCase]);
      nowStr := StringReplace(nowStr, ':', '-', [rfReplaceAll, rfIgnoreCase]);
      nowStr := StringReplace(nowStr, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
      nomeArquivo := vPathArquivosDigitais + '\LMF' + UpperCase(CompletaSimplificada) + nowStr +
        '.txt';
      CImpressoraF.LeituraMemoriaFiscalSerialReducao(IntToStr(cooIni), IntToStr(cooFim),
        CompletaSimplificada, nomeArquivo);
      EnvCmdsCupom(10);
      gerarMD5ArquivoEletronico(nomeArquivo);
      vMsg := 'LMFC';
      if CompletaSimplificada = 's' then
        vMsg := 'LMFS';
      Application.MessageBox(pchar('Arquivo '+vMsg+' por Redução criado com sucesso'+#13+
      'O arquivo foi salvo em: '+nomeArquivo), 'Atenção', 0 + 64);
      {try
        AssignFile(Arq, nomeArquivo);
        Append(arq);
        WriteLn(arq, '');
        CloseFile(Arq);
        Buffer := Sign_RSA_MD5(pchar(ExtractFilePath(Application.Exename)), nomeArquivo);
        begin
          AssignFile(Arq, nomeArquivo);
          Append(arq);
          WriteLn(arq, 'EAD' + buffer);
          CloseFile(Arq);
        end;
      except
        Application.MessageBox(pchar('Erro ao gravar assinatura digital'), 'Erro', MB_ICONERROR +
          MB_OK);
      end;}
    end;
  end;
end;

procedure TIni.leituraX;
begin
	try
		Screen.Cursor := crHourGlass;

		if semComunicacaoComECF('S') then
			Exit
		else if semArquivoAuxiliar('S') then
			Exit
		else if diferencaNoNumeroSerie('S') then
			Exit
		else if impressaoEmAndamento('S') then
      Exit
    else if caixaFiscalFechado('S') then
      Exit;

    if Application.MessageBox('Atenção !!!' + #13 + 'Deseja Emitir a Leitura X ?',
      'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = mrNo then
      exit;

    GravaAuditoria('FIS016', 'LEITURA X','','','', dtmEnt.qrBuscas);

    try
      MensagemFiscal('Aguarde! Imprimindo Leitura X...');

      if not EnvCmdsCupom(2) then
        exit;
      if not EnvCmdsCupom(6) then
      begin
        EnvCmdsCupom(10);
        exit;
      end;

      EnvCmdsCupom(11);
      if decodifica(trim(obConfImp.dataSet.FieldByName('abrir_gaveta').AsString)) = 'SIM' then
        CImpressoraF.AcionaGaveta;
      EnvCmdsCupom(10);
    finally
      limpaMensagem;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.limpaMensagem;
begin
  fechaStatusProcessamento;
  if frmMensagemGe <> nil then
  begin
    frmMensagemGe.Close;
    frmMensagemGe.free;
    frmMensagemGe := nil;
  end;
end;

function TIni.MensagemFiscal(mensagem: string; progresso: boolean): TProgressBar;
begin
  if frmMensagemGe = nil then
    Application.CreateForm(TfrmMensagemGe, frmMensagemGe);
  frmMensagemGe.ProgressBar1.Visible := True;
  frmMensagemGe.Show;
  frmMensagemGe.Label1.Caption := mensagem;
  frmMensagemGe.Label1.Width := 400;
  frmMensagemGe.Refresh;
  Result := frmMensagemGe.ProgressBar1;
end;

procedure TIni.MenuFiscal;
begin
  if frmMenuFiscal = nil then
    Application.CreateForm(TfrmMenuFiscal, frmMenuFiscal);
  frmMenuFiscal.ShowModal;
end;

procedure TIni.MensagemFiscal(mensagem: string);
begin
  abreStatusProcessamento( 'Status PAF-ECF', mensagem);
  exit;
  if frmMensagemGe = nil then
    Application.CreateForm(TfrmMensagemGe, frmMensagemGe);
  frmMensagemGe.Show;
  frmMensagemGe.Label1.Caption := mensagem;
  frmMensagemGe.Label1.Width := 400;
  frmMensagemGe.Refresh;
end;

function TIni.PadL(sString: string; iLength: Integer; cChar: Char): string;
begin
  Result := _Right(Replicate(cChar, iLength) + sString, iLength);
end;

function TIni.PadR(sString: string; iLength: Integer; cChar: Char): string;
begin
  Result := _Left(sString + Replicate(cChar, iLength), iLength);
end;

procedure TIni.PostKeyEx32(Key: Word; const Shift: TShiftState;
  SpecialKey: boolean);
type
  TShiftKeyInfo = record
    shift: Byte;
    vkey: Byte;
  end;
  byteset = set of 0..7;
const
  ShiftKeys: array[1..3] of TShiftKeyInfo = ((shift: Ord(ssCtrl); vkey: VK_CONTROL), (shift:
    Ord(ssShift); vkey: VK_SHIFT), (shift: Ord(ssAlt); vkey: VK_MENU));
var
  Flag: DWORD;
  bShift: ByteSet absolute shift;
  i: Integer;
begin
  for i := 1 to 3 do
  begin
    if shiftkeys[i].shift in bShift then
      Keybd_Event(ShiftKeys[i].vkey, MapVirtualKey(ShiftKeys[i].vkey, 0), 0, 0);
  end;

  if SpecialKey then
    Flag := KEYEVENTF_EXTENDEDKEY
  else
    Flag := 0;
                                                              
  Keybd_Event(Key, MapvirtualKey(Key, 0), Flag, 0);
  Flag := Flag or KEYEVENTF_KEYUP;
  Keybd_Event(Key, MapvirtualKey(Key, 0), Flag, 0);

  for i := 3 downto 1 do
  begin
    if ShiftKeys[i].shift in bShift then
      Keybd_Event(shiftkeys[i].vkey, MapVirtualKey(ShiftKeys[i].vkey, 0), KEYEVENTF_KEYUP, 0);
  end;
end;

function TIni.reducaoZ(pRelatorios: Boolean = True): boolean;
var
  Arq: TextFile;
  vdadredz: array[1..6] of string;
  vl: integer;
  vdiaab, vdiafech: Tdate;
  vmesf, vdiaf, vanof, vmesab, vdab, vanoab: word;
  obArqAnexoVI: TRelProdAnexoVI;
  label1: TLabel;
  nomeArquivo, temp, tempDt: string;
  vOK: Boolean;
  obAnexoIV: TAnexoIV;
begin
  try
    Result := False;
    if not PesqPros('FIS006', 'REDUÇÃO Z','TENTATIVA DE EMISSÃO DE REDUÇÃO Z','','', dtmEnt.qrBuscas, TRUE)then
    begin
      result:= false;
      exit;
    end;

    Screen.Cursor := crHourGlass;
    if obConfImp.dataSet.FieldByName('diafechado').AsDateTime = date then
    begin
      Application.MessageBox('Dia já está fechado', 'Informação', MB_ICONINFORMATION + mb_OK);
      Result := false;
      exit;
    end;

    Application.ProcessMessages;
    if Application.MessageBox(pchar('Atenção !!!' + #13 +
      'A Redução Z impossibilitará novas impressões' + #13 + 'de Cupons Fiscais!' + #13 + #13 +
      'Continua ?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDNO then
    begin
      Result:= False;
      exit;
    end;
  
    if not EnvCmdsCupom(2) then
      Exit;

    if not caixaFiscalFechado('N') then
      if not cancelarPreVendasAbertasAntesReducaoZ(True, Date - 1) then
        Exit;

    if (pRelatorios) and (bancoConectado = 'servidor') then
    begin
      if Pos(vEmp.vSiglaUF,  GetIni('Fiscal', 'InibirRCCA', 'MG')) = 0 then
      contasCLientesAbertas(False);

//      if obVenda = nil then
//        obVenda := TDAVF.create;
//      obVenda.selecionaVendasDAVOSEmitidos(date, date);

//      if not obVenda.dataSet.IsEmpty then
//        ImpDAVOSEmitidos;
    end;

    if CImpressoraF.FechamentoDoDia then
    begin
      Result := True;
      GravaAuditoria('FIS006', 'REDUÇÃO Z','REDUÇÃO Z EMITIDA AS '+TimeToStr(now),'','', dtmEnt.qrBuscas);

      CImpressoraF.vPermitirVenda := false;
      if decodifica(obConfImp.dataSet.FieldByName('abrir_gaveta').AsString) = 'S' then
        CImpressoraF.AcionaGaveta;

      obResumoD.gravaResumoD(StrToDate(CImpressoraF.vFvDataRes),
        CImpressoraF.vFvcooini,
        CImpressoraF.vFvcoofin, CImpressoraF.vFvContRed, CImpressoraF.vFvcontRein,
        strtocurr(CImpressoraF.vFvvendBr),
        strtocurr(CImpressoraF.vFvGrandT), CImpressoraF.vMapaResumo);

      vdiaab := obConfImp.dataSet.FieldByName('diaaberto').AsDateTime;
      vdiafech := obConfImp.dataSet.FieldByName('diafechado').AsDateTime;
      obConfImp.fechaDia;
      DecodeDate(vdiaab, vanoab, vmesab, vdab);
      DecodeDate(vdiafech, vanof, vmesf, vdiaf);
      if (vmesab <> vmesf) then
      begin
        Application.MessageBox('Será emitida Leitura da Memória Fiscal do mês anterior',
          'Informação', MB_ICONINFORMATION + mb_OK);
        leituraMeroriaFiscal(DateToStr(startoftheMonth(StrToDate(CImpressoraF.vFvDataRes) - 27)),
          DateToStr(EndOfTheMonth(StrToDate(CImpressoraF.vFvDataRes) - 27)), 'IMP', 's');
      end;

      //    CImpressoraF.LeTabelaResumo;
      try
        Screen.Cursor := crHourGlass;
        if vSincronizacaoEmSegundoPlano <> 'S' then
          try
            abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
            vHwSinc._sincronizarDados;
          finally
            fechaStatusProcessamento;
          end;
      finally
        Screen.Cursor := crDefault;
      end;
    end else
    begin
      Screen.Cursor := crDefault;
      GravaAuditoria('FIS006', 'REDUÇÃO Z','FALHA NA EMISSÃO DE REDUÇÃO Z','','', dtmEnt.qrBuscas);
      result:= false;
      Exit;
    end;

    if (bancoConectado = 'servidor') or (vTipoConexao = 'off') then
      try

        vOK := True;
        if (vTipoConexao = 'off') then
          if not conectaBanco(dtmAtivo.bancoHw, vBancoHW, False) then
            vOK := False;

        try
          obAnexoIV := TAnexoIV.create;
          try
            obAnexoIV.dataInicial := CImpressoraF.vFvDataRes;
            obAnexoIV.dataFinal := CImpressoraF.vFvDataRes;
            obAnexoIV.progressRegistros := nil;
            obAnexoIV.progressRegistrosDetalhes := nil;
            obAnexoIV.labelRegistros := nil;
            obAnexoIV.labelRegistrosDetalhes := nil;
            obAnexoIV.tipoEstoque := eTotal;
            obAnexoIV.dataSetEstoqueParcial := nil;

            obAnexoIV.montarArquivoMovimentoECF;
          finally
            obAnexoIV.Free;
            obAnexoIV := nil
          end;
        except
          on E: Exception do
          begin
            Application.MessageBox(PChar('Erro de execução. Erro: ' +e.Message), 'Atenção', 0 + 64);
          end;
        end;

//        obArqAnexoVI := TRelProdAnexoVI.create;
//
//
//        obArqAnexoVI.dtini := CImpressoraF.vFvDataRes;
//        obArqAnexoVI.DtFinal := CImpressoraF.vFvDataRes;
//        obArqAnexoVI.vDtMov := CImpressoraF.vFvDataRes;
//        obArqAnexoVI.vcdterminal := StrToInt(vCodTerminal);
//        obArqAnexoVI.vPelaReducao := 'S';
//        obArqAnexoVI.vGerarArqMesmoSemMov := False;
//
//        label1 := TLabel.Create(Application);
//        nomeArquivo := vPathArquivosDigitais + '\';
//        obArqAnexoVI.montarquivoVI(nomeArquivo, MensagemFiscal('Aguarde. Anexo VI', true), label1);
      finally
//        obArqAnexoVI.Free;
      end;
  finally
    limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

function TIni.SangriaOuSuprimento(valor: Double; SanOuSup: string): boolean;
begin
  Result := true;
  if UpperCase(SanOuSup) = 'SAN' then
  begin
    if EnvCmdsCupom(2) then
    begin
      CImpressoraF.AcionaGaveta;
      if not CImpressoraF.Sangria(CImpressoraF.defvalsangsup(valor)) then
        Result := False;
      if not CImpressoraF.retorno_ImpGer(1) then
        Result := False;
      EnvCmdsCupom(10);
    end;
  end
  else if UpperCase(SanOuSup) = 'SUP' then
  begin
    if EnvCmdsCupom(2) then
    begin
      CImpressoraF.AcionaGaveta;
      if not CImpressoraF.Suprimento(CImpressoraF.defvalsangsup(valor), '') then
        Result := False;
      if not CImpressoraF.retorno_ImpGer(1) then
        Result := False;
      EnvCmdsCupom(10);
    end;
  end;
end;

procedure TIni.setBancoConectado(banco: string);
begin
  bancoConectado := banco;
end;

function TIni.SetGrandeTotalCriptografadoEmArquivoAuxiliar(
  valorCriptografado: string): boolean;
var
  arquivo:tiNIfILE;
  ArqIni: string;
begin
	ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  arquivo := TIniFile.Create(ArqIni);
  arquivo.WriteString(Trim(vCodTerminal), 'G', valorCriptografado);
  arquivo.free;
  Result := true;
end;

function TIni.statusCaixa: integer;
var
  data1, data2: string;
begin
  /// Status do caixa para venda -----------------------  ///
  ///  0 - Caixa Liberado
  ///  1 - Caixa Fechado
  ///  2 - Caixa Bloqueado - Impressora não responde
	///  -------------------------------------------------  ///
	data1 := DateToStr(StrToDateDef(obConfImp.dataSet.FieldByName('diaaberto').AsString, 0));
	data2 := dateToStr(StrToDateDef(CImpressoraF.vFvDataRes, 1));
	if StrToDateDef(obConfImp.dataSet.FieldByName('diaaberto').AsString,0) <= StrToDateDef(CImpressoraF.vFvDataRes, 1)
		then
  begin
    Result := 1;
    CImpressoraF.vPermitirVenda := false;
  end
  else
    result := 0;
end;

function TIni.testaConexaoComBanco(localOuServidor: string): boolean;
begin
  {Result := false;
  try
    if LowerCase(localOuServidor) = LowerCase('servidor') then
    begin
      if conectaBanco(dtmAtivo.bancoTeste, vBancoHW, false) then
        Result := true;
    end
    else if LowerCase(localOuServidor) = LowerCase('local') then
    begin
      if conectaBanco(dtmfiscal.bancoTeste, vBancoFiscal, false) then
        Result := true;
      if conectaBanco(dtmfiscal.bancoTeste, vBancoHwF, false) then
        Result := true;
    end;
  finally
    DtmFiscal.bancoTeste.Connected := False;
  end;}
end;

procedure TIni.testaIntegridadeBanco;
begin
  //
end;

procedure TIni.testaPortas;
begin
  if not obConfImp.IsEmpty then
  begin
    if Decodifica(obConfImp.dataSet.FieldByName('LEITOR_SERIAL').AsString) = 'S' then
    begin
//      DtmFiscal.ACBrLCB1.Desativar;
//      DtmFiscal.ACBrLCB1.Porta := 'COM' +
        IntToStr(obConfImp.dataSet.FieldByName('PORTA_LEITOR').AsInteger);
      try
//        DtmFiscal.ACBrLCB1.Ativar;
//        DtmFiscal.ACBrLCB1.Desativar;
      except
        vUsaLeitorSerial := 'N';
        MessageBeep(1);
        Application.MessageBox(pchar('Leitor Serial não pode ser ativado. Problemas de comunicação!'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      end;
    end;
  end;
end;

function TIni.dataHoraConfereComImp: boolean;
begin
  Result := false;
  //  if not semConexao then
  if EnvCmdsCupom(8) then
    Result := true;
end;

function TIni.abreFormRetornoImpressora: boolean;
begin
  if CImpressoraF.RetornoDll.retornoFuncao = 'ERRO' then
    try
      Application.CreateForm(TfrmMensagemRetornoImpressora, frmMensagemRetornoImpressora);
      frmMensagemRetornoImpressora.Memo2.Clear;
      if Trim(CImpressoraF.RetornoDll.estadoComunicacao) <> '' then
      begin
        frmMensagemRetornoImpressora.Memo2.Lines.Add('Estado Comunicação');
        frmMensagemRetornoImpressora.Memo2.Lines.Add(' - '+Trim(CImpressoraF.RetornoDll.estadoComunicacao));
      end;
      if Trim(CImpressoraF.RetornoDll.estadoImpressora) <> '' then
      begin
        frmMensagemRetornoImpressora.Memo2.Lines.Add('Estado da Impressora');
        frmMensagemRetornoImpressora.Memo2.Lines.Add(' - '+Trim(CImpressoraF.RetornoDll.estadoImpressora));
      end;
      if Trim(CImpressoraF.RetornoDll.estadoFiscal) <> '' then
      begin
        frmMensagemRetornoImpressora.Memo2.Lines.Add('Estado Fiscal');
        frmMensagemRetornoImpressora.Memo2.Lines.Add(' - '+Trim(CImpressoraF.RetornoDll.estadoFiscal));
      end;
      if Trim(CImpressoraF.RetornoDll.estadoFuncao) <> '' then
      begin
        frmMensagemRetornoImpressora.Memo2.Lines.Add('Retorno do Comando');
        frmMensagemRetornoImpressora.Memo2.Lines.Add('  '+Trim(CImpressoraF.RetornoDll.estadoFuncao));
      end;
      BlockInput(False);
      result := (frmMensagemRetornoImpressora.ShowModal = IDOK);
    finally
      frmMensagemRetornoImpressora.Free;
      frmMensagemRetornoImpressora := nil;
    end;
end;

procedure TIni.efetuaAgendaMentoHorarioVerao(tipoProgramacao: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp:string;
begin
  if COPY(tipoProgramacao,1,1) = 'ATIVAR' then
    vTemp :='ATIVAR'
  else
    vTemp := 'DESATIVAR';
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + 'Fiscal\HorarioVerao', True);
      Registro.WriteDate('Data', date);
      Registro.WriteString('HorarioVerao', vTemp);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

function TIni.getProgramacaoHorarioVerao:string;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp:string;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + 'Fiscal\HorarioVerao', True);
      if Registro.ReadDate('Date') = Date then
        Result := Registro.ReadString('HorarioVerao')
      else
        Result := 'SEM PROGRAMACAO';
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
    Result := 'SEM PROGRAMACAO';
  end;
end;

function TIni.abreFormRecebimentoNaoFiscal(codPrestacao:integer): boolean;
var
  ValorPrestacao: Currency;
  vcoo: string;
  vgnf: string;
begin
  try
    obRecPrest := TRecebimentoPrestacao.Create;
    try
      obRecPrest.vPrestCxF.vPrestRet.abrePrestacoes(codPrestacao);
      if obRecPrest.vPrestCxF.vPrestRet.Dataset.IsEmpty then
        raise exception.create('Prestação não encontrada');

      if obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('tp_rec_cxl').AsString = 'P' then
        ValorPrestacao := StrToFloatFormat(
          obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('vl_rq_pg_cxl').AsFloat,2)
      else if vComprovanteNaoFiscalComValorCorrigido = 'S' then
        ValorPrestacao := StrToFloatFormat(
          obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('valor_corr').AsFloat,2)
      else if vComprovanteNaoFiscalComValorCorrigido <> 'E' then
        ValorPrestacao := StrToFloatFormat(
          obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('valor_c').AsFloat,2)
      else if Application.MessageBox('Imprimir comprovante não fiscal com o valor corrigido?','Confirmação', MB_ICONQUESTION +  MB_YESNO) = IDYES then
        ValorPrestacao := StrToFloatFormat(
          obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('valor_corr').AsFloat,2)
      else
        ValorPrestacao := StrToFloatFormat(
          obRecPrest.vPrestCxF.vPrestRet.dataSet.FieldByName('valor_c').AsFloat,2);

      if StrToFloatFormat(ValorPrestacao,2) <= 0 then
      begin
        Application.MessageBox('Recebimento não pode ser menor ou igual a zero','Atenção',0+64);
        exit;
      end;

      if not obRecPrest.vPrestCxF.vPrestRet.iniciaRecebimento then
        exit;

      Application.CreateForm(TfrmRecebNaoFiscalCxl, frmRecebNaoFiscalCxl);
      try
        frmRecebNaoFiscalCxl.Label1.Caption := 'Valor da Prestação: '+
          format('%0.2m',[ValorPrestacao]);

        obFinalizador.getTodos;
        obRecPrest.vTot.getTodos;
        if frmRecebNaoFiscalCxl.ShowModal = IDOK then
        begin
          if EnvCmdsCupom(2) then
          begin
            if not CImpressoraF.RecebimentoNaoFiscal(
              StrZero(obRecPrest.vTot.dataSet.FieldByName('sequencia').AsInteger, 2),
              CImpressoraF.defvalsangsup(StrToFloatFormat(ValorPrestacao,2)),
              copy(obFinalizador.dataSet.FieldByName('descricao').AsString, 1, 16)) then
            begin
              obRecPrest.vPrestCxF.vPrestRet.cancelaRecebimento;
              exit;
            end;

            Sleep(2 * 1000);

            vcoo := '      ';
            vcoo := CImpressoraF.NumeroCupom;
            vgnf := CImpressoraF.numeroGNF;
            if not obRecPrest.vPrestCxF.vPrestRet.confirmaRecebimento(
              StrToInt(trim(vcoo))) then
              exit;

//            if not obRecPrest.vPrestCxF.confirmaRecebimento(
//              obRecPrest.vTot.dataSet.FieldByName('sequencia').AsInteger,
//              obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
//              StrToInt(trim(vcoo))) then
//            begin
//              obRecPrest.vPrestCxF.RollBackTransacao;
//              exit;
//            end;
            if obRecPrest.insereRecebimento(StrToInt(trim(vgnf)),
              obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
              StrToFloatFormat(ValorPrestacao,2)) then
                obRecPrest.atualizaRecPrest;

            EnvCmdsCupom(10);
          end;                                              
        end
        else
          obRecPrest.vPrestCxF.vPrestRet.cancelaRecebimento;
        obRecPrest.Free;
        obRecPrest := nil;
      finally
        frmRecebNaoFiscalCxl.Free;
        frmRecebNaoFiscalCxl := nil;
      end;
    finally
      obRecPrest.Free;
      obRecPrest := nil;
    end;
  except
    on e:exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message),'Atenção - Erro',0+64);
      registraErro(e.Message);
    end;
  end;
end;

function TIni.cancelaUltimoDocumentoNaoFiscal:boolean;
var
  vCoo: string;
  vCodFinalizador, vCooInt: Integer;
  valorMov: Currency;
begin
  vCoo := CImpressoraF.numeroCOO;
  Application.CreateForm(TfrmCancelamentoNaoFiscal,frmCancelamentoNaoFiscal);
  frmCancelamentoNaoFiscal.Label1.Caption := 'Último COO no ECF: '+StrZero(Trim(vCoo),6);
  obSangSup := TSangSup.create;
  obSangSup.selecionaSangriaSuprimento(date,date);
  obSangSup.Last;
  if frmCancelamentoNaoFiscal.ShowModal = IDOK then
  begin
    try
      vCooInt := StrToInt(Trim(vCoo));
    except
      vCooInt := 0;
    end;
    if CImpressoraF.CancelamentoNaoFiscal then
    begin
      if StrZero(obSangSup.dataSet.FieldByName('coonaofiscal').AsString,6) <> StrZero(Trim(vCoo),6) then
      begin
        obSangSup.selecionaSangriaSuprimento(vCooInt);
      end;
      if (StrZero(obSangSup.dataSet.FieldByName('coonaofiscal').AsString,6) = StrZero(Trim(vCoo),6)) and
        (vCooInt <> 0) then
      begin
        obSangSup.cancelarRegistro;
        obRecPrest := TRecebimentoPrestacao.Create;
        try
          if bancoConectado <> 'local' then
            obRecPrest.vPrestCxF.vPrestRet.cancelaPrestacao(obSangSup.dataSet.FieldByName('coonaofiscal').AsInteger);
        finally
          obRecPrest.Free;
          obRecPrest := nil;
        end;
      end;
      obSangSup.Free;
      obSangSup := nil;
      Application.MessageBox('Recebimento não fiscal cancelado', 'Atenção',0+64);
    end;
  end;

  {
  vCoo:= CImpressoraF.numeroCOO;
  if CImpressoraF.CancelamentoNaoFiscal then
  begin
    Result := True;
    obSangSup := TSangSup.create;
    try
      obSangSup.selecionaSangriaSuprimento(StrToInt(Trim(vCoo)));
      vCodFinalizador := obSangSup.dataSet.FieldByName('finalizador').AsInteger;
      valorMov := obSangSup.dataSet.FieldByName('valor').AsCurrency;
      if obSangSup.dataSet.FieldByName('sangsuprimento').AsString = 'SANGRIA' then
        obSangSup.insereSangria
      else if obSangSup.dataSet.FieldByName('sangsuprimento').AsString = 'SUPRIMENTO' then
        obSangSup.insereSuprimento
      else if obSangSup.dataSet.FieldByName('sangsuprimento').AsString = 'REC PREST' then
        obSangSup.insereRecebimentoPrestacao
      else
        Exit;
      
      obSangSup.dataSet.FieldByName('finalizador').AsInteger := vCodFinalizador ;
      obSangSup.dataSet.FieldByName('valor').AsCurrency := (-1)*valorMov ;

      if obSangSup.Post1(vCodFinalizador) then
      begin
        obSangSup.CommitaTransacao;
        obSangSup.selecionaSangriaSuprimento(StrToInt(Trim(CImpressoraF.numeroCOO)));

        obSangSup.vFinCupom.insereFimCupom(0, obSangSup.dataSet.FieldByName('nreg').AsInteger,
          obSangSup.dataSet.FieldByName('finalizador').AsInteger, 0,
          StrToInt(Trim(CImpressoraF.numeroGNF)), 0,
          obSangSup.dataSet.FieldByName('valor').AsCurrency,
          obSangSup.dataSet.FieldByName('valor').AsCurrency,
          copy(obSangSup.dataSet.FieldByName('sangsuprimento').AsString, 1, 3));
        GravaAuditoria('FIS036', 'CANCELAMENTO/NAOF', 'CANCELAMENTO',
          'SANGSUP', '', dtmEnt.qrBuscas);
        try
          Screen.Cursor := crHourGlass;
        finally
          Screen.Cursor := crDefault;
          limpaMensagem;
        end;
      end;
    finally
      obSangSup.Free;
      obSangSup := nil;
    end;
  end;   }
end;

procedure TIni.verificaCamposNaoCriados;
var
  ibScript: TIBScript;
begin
  try
    ibScript := TIBScript(DtmFiscal.ibScript1);
    try ibScript.Script.Text := 'ALTER TABLE SANGSUP ADD COONAOFISCAL INTEGER;';ibScript.ExecuteScript;
    except end;
    try ibScript.Script.Text := 'ALTER TABLE SANGSUP ADD VALOR_ORIGINAL T_VL_TODOS;';ibScript.ExecuteScript;
    except end;
    try ibScript.Script.Text := 'ALTER TABLE SANGSUP ADD STATUS VARCHAR(20);';ibScript.ExecuteScript;
    except end;
    try ibScript.Script.Text := 'ALTER TABLE SANGSUP ADD COOCANCELAMENTO INTEGER;';ibScript.ExecuteScript;
    except end;

    
    try ibScript.Script.Text := 'CREATE INDEX IDX_FINCPCUPOM ON FINCUPOM (COD_EMPRESA, ORDEM, CUPOM, COD_TERMINAL, NSERIEECF);';ibScript.ExecuteScript;
    except end;
    try ibScript.Script.Text := 'CREATE INDEX IDX_FORMPAG_CUPOM ON FORMPAGAMENTO (COD_TERMINAL,NSERIEECF,COD_EMPRESA);';ibScript.ExecuteScript;
    except end;
    try ibScript.Script.Text := 'CREATE INDEX IDX_NFSERIED_ENVRET ON NF_SERIE_D (COD_EMPRESA, ENVIADO_RET);';ibScript.ExecuteScript;
    except end;
    try ibScript.Script.Text := 'CREATE INDEX IDX_NFSERIEDITENS_ENVRET ON NF_SERIE_D_ITENS (COD_EMPRESA, ENVIADO_RET);';ibScript.ExecuteScript;
    except end;
    try ibScript.Script.Text := 'ALTER TABLE TABELA_PROCESSOS ADD GRAVAR_AUDITORIA  CHAR(1) DEFAULT ''N'';';ibScript.ExecuteScript;
    except end;
  finally
    if DtmFiscal.transacaoFiscal.InTransaction then
      DtmFiscal.transacaoFiscal.Commit;
  end;
end;

procedure TIni.gerarMD5IndiceTecnico(enderecoArquivo:string);
var
  nowStr, nomeArquivo: string;
  Buffer: AnsiString;
  Arq: TextFile;
begin
  try
    nomeArquivo := Trim(enderecoArquivo);
    AssignFile(Arq, nomeArquivo);
      Append(arq);
      WriteLn(arq, '');
      CloseFile(Arq);
    Buffer := Sign_RSA_MD5(pchar(ExtractFilePath(Application.Exename)), nomeArquivo);
    begin
      AssignFile(Arq, nomeArquivo);
      Append(arq);
      WriteLn(arq, 'EAD' + buffer);
      CloseFile(Arq);
    end;
  except
    Application.MessageBox(pchar('Erro ao gravar assinatura digital'), 'Erro', MB_ICONERROR +
      MB_OK);
  end;
end;

function TIni.md5Arquivo(pNomeArquivo: string):string;
begin
  Result := MD5Print(MD5File(pNomeArquivo));
end;

function TIni.cancelarPreVendasAbertasAntesReducaoZ(pAbrindoDia: Boolean = False; pDataMov: TDate = 0): Boolean;
var
  vQuery: TIBQuery;
  vLista: TStringList;
  I: Integer;
  vDataAtual, vDataMovCancPV: TDate;
  vData2: TDate;
begin
  if vEmp.vUsarPreVenda <> 'S' then
  begin
    Result := True;
    Exit;
  end;

  if bancoConectado = 'local' then
    Exit;

  Result := False;
  try
    Screen.Cursor := crHourGlass;
    try
      vDataAtual := vdataGeral;
    except
      vDataAtual := date;
      vdataGeral := Date;
    end;

    if pDataMov = 0 then
      vDataMovCancPV := vDataAtual - 1
    else
      vDataMovCancPV := pDataMov;

    progressoFuncao('Cancelamento de Pré-Vendas não Concluídas',
      'Pré-Vendas anterior ao dia ' + FormatDateTime('dd/mm/yyyy', vDataMovCancPV + 1),
      'Verificando outros Caixas trabalhando');

    if obPreVenda = nil then
    obPreVenda := TPreVendaRetaguarda.create;
    if obCtrl = nil then
      obCtrl := TControleF.create;
    obPreVenda.desmarcaVendaParaCupom;

    vQuery := TIBQuery(obPreVenda.getQueryRetaguarda);
    vLista := TStringList.Create;
    vLista.Clear;

    if not pAbrindoDia then
    begin
      vQuery.Close;
      vQuery.SQL.Text := 'select distinct cp.cod_terminal, cp.nserieecf from cupom cp' +
        ' where cp.data = :data and cp.cod_terminal <> ' + vCodTerminal +
        ' and cp.cod_empresa = ' + codEmpresa;
      vQuery.ParamByName('data').AsDate := vDataAtual;
      vQuery.Open;

      vQuery.First;
      while not vQuery.Eof do
      begin
        vLista.Add(IntToStr(vQuery.FieldByName('cod_terminal').AsInteger) + '|' +
          Trim(vQuery.FieldByName('nserieecf').AsString) + '|');
        vQuery.Next;
      end;

      for I := 0 to vLista.Count - 1 do
      begin
        vQuery.Close;
        vQuery.SQL.Text := 'select first 1 r.data_mov, r.coored from resumod r' +
          ' where r.data_mov = :data and r.cod_terminal = :cod_terminal and r.nserieecf = :nserieecf' +
          ' and r.cod_empresa = ' + codEmpresa;
        vQuery.ParamByName('data').AsDate := vDataAtual;
        vQuery.ParamByName('cod_terminal').AsInteger := StrToInt(getCampoPipe(vLista[i], 1));
        vQuery.ParamByName('nserieecf').AsString := getCampoPipe(vLista[i], 2);
        vQuery.Open;

        if vQuery.IsEmpty then
        begin
          Result := True;
          Exit;
        end;
      end;
    end;

    vQuery.Close;
    vQuery.SQL.Text := 'select max(data_mov_canc_pv) data_mov_canc_pv, data_ini_canc_pv, cod_terminal, status_canc_pv from terminalf' +
                       ' where data_mov_canc_pv <= :data and cod_empresa = ' + codEmpresa +
                       ' group by 2,3,4';
    vQuery.ParamByName('data').AsDate := vDataMovCancPV;
    vQuery.Open;
    if not vQuery.IsEmpty then
    begin
      if (Trim(vQuery.FieldByName('status_canc_pv').AsString) = 'C') and
        (FormatDateTime('dd/mm/yyyy', vQuery.FieldByName('data_mov_canc_pv').AsDateTime) =
            FormatDateTime('dd/mm/yyyy', vDataMovCancPV)) then
      begin
        Result := True;
        exit;
      end
      else if Trim(vQuery.FieldByName('status_canc_pv').AsString) = 'I' then
        if IntToStr(vQuery.FieldByName('cod_terminal').AsInteger) <> vCodTerminal then
          if FormatDateTime('dd/mm/yyyy', vQuery.FieldByName('data_ini_canc_pv').AsDateTime) =
            FormatDateTime('dd/mm/yyyy', vDataAtual) then
          begin
            Result := True;
            Exit;
          end
          else
          begin
            if not vQuery.Transaction.InTransaction then
              vQuery.Transaction.StartTransaction;

            vQuery.close;
            vQuery.SQL.Text := 'update terminalf set data_mov_canc_pv = null, data_ini_canc_pv = null, status_canc_pv = null' +
              ' where cod_terminal = ' + vCodTerminal + ' and cod_empresa = ' + codEmpresa;
            vQuery.ExecSQL;

            if vQuery.Transaction.InTransaction then
              vQuery.Transaction.Commit;
          end;
    end;

//    vQuery.Close;
//    vQuery.SQL.Text := 'select max(data_mov_canc_pv), cod_terminal, status_canc_pv from terminalf' +
//      ' where data_mov_canc_pv = :data and cod_empresa = ' + vDadosIniF.codEmpresa;
//    vQuery.ParamByName('data').AsDate := vDataMovCancPV;
//    if not vQuery.IsEmpty then
//    begin
//      if Trim(vQuery.FieldByName('status_canc_pv').AsString) = 'I' then
//        if IntToStr(vQuery.FieldByName('cod_terminal').AsInteger) <> vDadosIniF.vCodTerminal then
//          Exit;
//    end;

//    vLista.Clear;
//    vLista.Add(DateToStr(pDataMov));

    if not vQuery.Transaction.InTransaction then
      vQuery.Transaction.StartTransaction;

    vQuery.close;
    vQuery.SQL.Text := 'update terminalf' +
      ' set data_mov_canc_pv = :data, data_ini_canc_pv = :dataAt, status_canc_pv = ''I''' +
      ' where cod_terminal = ' + vCodTerminal +
      ' and cod_empresa = ' + codEmpresa;
    vQuery.ParamByName('data').AsDate := vDataMovCancPV;
    vQuery.ParamByName('dataAt').AsDate := vDataAtual;
    vQuery.ExecSQL;

    if vQuery.Transaction.InTransaction then
      vQuery.Transaction.Commit;

    vQuery.Close;
    vQuery.SQL.Text := 'select distinct data_mov_canc_pv, status_canc_pv from terminalf' +
      ' where cod_terminal <> ' + vCodTerminal +
      ' and data_ini_canc_pv = :dataAt' +
      ' and cod_empresa = ' + codEmpresa;
    vQuery.ParamByName('dataAt').AsDate := vDataAtual;
    vQuery.Open;

    vData2:= 0;
    if not vQuery.IsEmpty then
    begin
      if vQuery.FieldByName('data_mov_canc_pv').AsDateTime = vDataMovCancPV then
      begin
        Result := False;

        if not vQuery.Transaction.InTransaction then
          vQuery.Transaction.StartTransaction;

        vQuery.close;
        vQuery.SQL.Text := 'update terminalf' +
          ' set data_mov_canc_pv = null, data_ini_canc_pv = null, status_canc_pv = null' +
          ' where cod_terminal = ' + vCodTerminal +
          ' and cod_empresa = ' + codEmpresa;
        vQuery.ExecSQL;

        if vQuery.Transaction.InTransaction then
          vQuery.Transaction.Commit;

        Application.MessageBox(pchar('Outro Caixa já iniciou o cancelamento de Pré-Vendas junto com este Caixa, ' +
          'repita a operação'),'Atenção', 0 + 64);
        Exit;
      end
      else
        vData2 := vQuery.FieldByName('data_mov_canc_pv').AsDateTime + 1;
    end;

    progressoFuncao('','',
      'Procurando Pré-Vendas');

    vLista.Clear;               
    vQuery.Close;
    vQuery.SQL.Text := 'select nped, tipo from pedvenda' +
      ' where tipo = ''REQ'' and coalesce(paf_num_prevenda, 0) > 0' +
      ' and status_ped = ''FECHADA'' and data_fech <= :data' +
      ' and coalesce(num_nf, 0) = 0 and coalesce(ncupom, 0) = 0' +
      ' and cod_empresa = ' + codEmpresa +
      ' order by paf_num_prevenda';
    if vData2 > 0 then
    begin
      vQuery.SQL.Text := vQuery.SQL.Text + ' and data_fech >= :data2';
      vQuery.ParamByName('data2').AsDate := vData2;
    end;
    vQuery.ParamByName('data').AsDate := vDataMovCancPV;
    vQuery.Open;

    if vQuery.IsEmpty then
    begin
      Result := True;
      Exit;
    end;

    vQuery.First;
    while not vQuery.Eof do
    begin
      vLista.Add(IntToStr(vQuery.FieldByName('nped').AsInteger) + '|' + Trim(vQuery.FieldByName('tipo').AsString) + '|');
      vQuery.Next;
    end;

    for I := 0 to vLista.Count - 1 do
    begin
      progressoFuncao('', '',
        'Cancelando Pré-Venda Nº ' + getCampoPipe(vLista[i], 1));
      if cancelarVendasAnteriores(StrToInt(getCampoPipe(vLista[I], 1)), getCampoPipe(vLista[I], 2),
        obPreVenda.getQueryRetaguarda) then
        result := emitirCupomPelaVenda(StrToInt(getCampoPipe(vLista[I], 1)), getCampoPipe(vLista[I], 2), True, False, True);
    end;
    progressoFuncao('', '', 'Finalizando...');

    if Result then
    begin
      if not vQuery.Transaction.InTransaction then
        vQuery.Transaction.StartTransaction;

      vQuery.close;
      vQuery.SQL.Text := 'update terminalf' +
        ' set data_mov_canc_pv = :data, data_ini_canc_pv = :dataAt, status_canc_pv = ''C''' +
        ' where cod_terminal = ' + vCodTerminal +
        ' and cod_empresa = ' + codEmpresa;
      vQuery.ParamByName('data').AsDate := vDataMovCancPV;
      vQuery.ParamByName('dataAt').AsDate := vDataAtual;
      vQuery.ExecSQL;

      if vQuery.Transaction.InTransaction then
        vQuery.Transaction.Commit;
    end;

  finally
    finalizaProgresso;
    Screen.Cursor := crDefault;
  end;
end;

function TIni.emitirCupomPelaVenda(pNumVenda: Integer; pTipoVenda: string; pCancelarCupom: Boolean = False; pConfirmarExclusao: Boolean = True; pAntesDoZ: Boolean = False): Boolean;
var
  temDinheiro, temCartao, vVoltarEstoque: Boolean;
  somaForma, somaVenda, vValorItens: Extended;
  vProdServ, quantidade, codBarra: string;
  nCupom: string;
  vSubTotal: Integer;

  function formaPagamento(valor: Currency; codCliente: string): boolean;
  var
    gerencial: boolean;
    I, vNaoConfOper: Integer;
    valorCp, nCP, nReg: string;
    valorInformado, valorRestante, valorTroco: Currency;
  begin
    //Enviando venda para tabelas do fiscal
    if not obCupom.recebeFormaPag(obFinalizador.dataSet.FieldByName('cod_finalizador').AsInteger,
      obFinalizador.dataSet.FieldByName('tipo_finalizador').AsInteger, Valor)
      then
    begin
      Result := false;
      exit;
    end;

    //Fim forma de pagamento
    valorRestante := obCupom.getValorRestante;

    if valorRestante <= 0 then
    begin
      valorCp := trim(FloatToStr(obCupom.getSubTotal));
      nCP := trim(obCupom.getNCupom);
      nReg := Trim(obCupom.getNRegistro);
      if not obCupom.fechaCupomFiscal(codCliente) then
      begin
        Result := false;
        exit;
      end;
      Result := true;
    end;
    Result := true;
  end;

  function setDescontoAcrescimo(desconto, acrescimo: Currency): boolean;
  begin
    if desconto > 0 then
    begin
      obCupom.setDescontoFechamento(desconto);
      obCupom.setSubTotal;
      progressoFuncao('','', 'Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]));
      progressoFuncao('','', 'Desconto  R$   ' + Format(' %10.2f', [desconto]));
    end
    else if acrescimo > 0 then
    begin
      obCupom.setAcrescimoFechamento(acrescimo);
      obCupom.setSubTotal;
      progressoFuncao('','', 'Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]));
      progressoFuncao('','', 'Acrescimo  R$   ' + Format(' %10.2f', [acrescimo]));
    end;
  end;

  procedure CancelarCupomAtual;
  var
    vflagc: integer;
    vSubTotal: integer;
    cNumeroCupom: string;
    vSemCP: Boolean;
  begin

      vSemCP := False;
      if Trim(obCupom.getNCupom) = '' then
        vSemCP := True
      else
      begin
        if FloatToStr(StrToInt64(trim(CImpressoraF.NumeroCupom))) <>
          FloatToStr(StrToInt64(trim(obCupom.getNCupom))) then
          Exit;
      end;

      vflagc := 0;
      vSubTotal := 0;
      if obCupom.emSubTotal then
        vSubTotal := 1;
      cNumeroCupom := CImpressoraF.NumeroCupom;

      if not CImpressoraF.CancelaCupom(vSubTotal) then
        exit
      else
      begin
        CImpressoraF.FechaPortaSerial;
        if not vSemCP then
        begin
          obCupom.cancelarCupomFiscal;
          if FileExists(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe ') then
            WinExec(Pchar(ExtractFilePath(Application.Exename) + 'BaixaEstoque.exe' + cNumeroCupom), SW_SHOWNOACTIVATE);
        end;
        if vSemCP then
          GravaAuditoria('FIS004','CANCELAR',' SEM DADOS DO CUPOM ','CUPOM', cNumeroCupom, dtmEnt.qrBuscas)
        else
          GravaAuditoria('FIS004','CANCELAR','','CUPOM',obCupom.dataSet.FieldByName('cupom').AsString,dtmEnt.qrBuscas);
      end;
      obProd.CommitaTransacao;
      obProd.IniciaTransacao;
      if obprod.dataSet.Active then
        obProd.dataSet.Refresh;
  end;

  
  function ConsultaItem(codigo: string): Boolean;
  begin
    Result := false;
    if (vProdServ = 'S') or (vProdServ = 'T') then
    begin
      if obServ.buscarServico(codigo) then
      begin
        if (vDescontoISS = 'N') then
        begin
          obCupom.setDescontoPercenentual(0);
          obCupom.setDescontoValor(0);
        end;

        if (trim(obServ.getDescricao) = '') or (Length(trim(obServ.getDescricao)) = 1) then
        begin
          Application.MessageBox(pchar('Serviçco sem descrição'), 'Atenção', MB_ICONEXCLAMATION +
            MB_OK);
          Exit;
        end;
        if obServ.getValorVendaItem <= 0 then
        begin
          Application.MessageBox(pchar('Serviço sem valor de venda'), 'Atenção', MB_ICONEXCLAMATION
            +
            MB_OK);
          Exit;
        end;
        if obServ.getQuantidade <= 0 then
        begin
          Application.MessageBox(pchar('Serviço sem quantidade informada'), 'Atenção',
            MB_ICONEXCLAMATION + MB_OK);
          Exit;
        end;

        Result := true;
      end;
    end
    else
    begin
      if obProd.buscarProduto(codigo, True, False,
        decodifica(obConfImp.dataSet.FieldByName('leitura_sup').AsString) = 'S',
        decodifica(obConfImp.dataSet.FieldByName('MODELO_BALANCA').AsString) <> 'Nenhuma',
        (obCupom.vNumDAV > 0) or (obCupom.vNumPVenda > 0))  then
      begin
        if (trim(obProd.getDescricao) = '') or (Length(trim(obProd.getDescricao)) = 1) then
        begin
          Application.MessageBox(pchar('Produto sem descrição'), 'Atenção', MB_ICONEXCLAMATION +
            MB_OK);
          Exit;
        end;
        if obProd.getValorVendaItem <= 0 then
        begin
          Application.MessageBox(pchar('Produto sem valor de venda'), 'Atenção', MB_ICONEXCLAMATION
            +
            MB_OK);
          Exit;
        end;
        if obProd.getQuantidade <= 0 then
        begin
          Application.MessageBox(pchar('Produto sem quantidade informada'), 'Atenção',
            MB_ICONEXCLAMATION + MB_OK);
          Exit;
        end;

        Result := true;
        CImpressoraF.vFqtdDig := StrToInt(obProd.getCasasDecimaisVlUnit);
      end;
    end;
  end;

  function enviaItemVenda(codBarra, descricaoItem: string; valorItem: Currency; pCodVendedor: Integer): boolean;
    var
    v1, nBarra: string;
    nQuant: Real;
    j: Integer;
    i: Integer;
  begin
    Result := False;
    Screen.Cursor := crHourGlass;

    if (trim(codBarra) = '') or (copy(trim(codBarra), 1, 1) = ' ') then
      exit;
    nBarra := trim(codBarra);

    if not ConsultaItem(codbarra) then
      exit;

    obCupom.vItem.vCodVendedor := pCodVendedor;

    if (vProdServ = 'S') or (vProdServ = 'T') then
    begin
      obServ.setValorItemAlterado(valorItem);
      obServ.setValorDescricaoAlterado(descricaoItem);
    end
    else if vProdServ = 'P' then
    begin
      obProd.setValorItemAlterado(valorItem);
      obProd.setValorDescricaoAlterado(descricaoItem);
    end;

    if (vProdServ = 'S') or (vProdServ = 'T') then
    begin
      if (obServ.getValorVendaItem - valorItem) = 0 then
        obCupom.setDescontoValor(0)
      else if (obServ.getValorVendaItem - valorItem) > 0 then
        obCupom.setDescontoValor(obServ.getValorVendaItem - valorItem)
      else if (obServ.getValorVendaItem - valorItem) < 0 then
        obCupom.setAcrescimoValor(valorItem - obServ.getValorVendaItem);
    end
    else if vProdServ = 'P' then
    begin
      if (obProd.getValorVendaItem - valorItem) = 0 then
        obCupom.setDescontoValor(0)
      else if (obProd.getValorVendaItem - valorItem) > 0 then
        obCupom.setDescontoValor(obProd.getValorVendaItem - valorItem)
      else if (obProd.getValorVendaItem - valorItem) < 0 then
        obCupom.setAcrescimoValor(valorItem - obProd.getValorVendaItem);
    end;

    if not CImpressoraF.cupomAberto then
    begin
      if not EnvCmdsCupom(3) then
        exit;

			if not obCupom.abreCupom(vCodUsuario, CImpressoraF.vFHoraEcf) then
			begin
				try CancelarCupomAtual except end;
				Exit;
			end;
    end;
    // Definindo máscara da quantidade de acordo com a impressora...
    if vProdServ = 'P' then
      obProd.setCQuant(CImpressoraF.cMascQuant(obProd.getQuantidade)) //vDadosIniF.EnvCmdsCupom(4);
    else
      obServ.setCQuant(CImpressoraF.cMascQuant(obServ.getQuantidade)); //vDadosIniF.EnvCmdsCupom(4);

    //verificando o numero de serie da impressora
    if not EnvCmdsCupom(6) then
      exit;

    //envia venda do item para impressora
    if vProdServ = 'P' then
      if enviaVendaItemImpressora(obProd.getNBarra,
        CImpressoraF.MontaDescricao(obProd.getDescricao, obProd.getUnidade),
        obProd.getSitTributaria,
        obProd.getCQuant, StrToInt(obProd.getCasasDecimaisVlUnit), obProd.getValorVendaItem,
        obCupom.getDescontoAcrescimoPercenentual, obCupom.getDescontoAcrescimoValor,
        obProd.getQuantidade) then
      begin
        obCupom.vItem.vTipo_item := obProd.dataSet.FieldByName('tipo_item').AsString;
        obCupom.vItem.vUnidade := obProd.dataSet.FieldByName('UNIDADE').AsString;
        obCupom.vItem.vUnidade := obProd.dataSet.FieldByName('UNIDADE').AsString;
				if not obCupom.vendeItem(obProd.dataSet.FieldByName('grupo_prod').AsInteger,
					obProd.dataSet.FieldByName('cod_prod').AsString, obProd.getNBarra,
					obProd.getSitTributaria, CImpressoraF.MontaDescricao(obProd.getDescricao,
					obProd.getUnidade), obProd.getQuantidade,
					obProd.getValorVendaItem, obProd.getCasasDecimaisQtde, obProd.getCasasDecimaisVlUnit,
					obProd.getDescAliq, 'P') then
				begin
					try CancelarCupomAtual except end;
					Exit;
				end;

        progressoFuncao('', '', obProd.getNBarra + ' ' +
          CImpressoraF.MontaDescricao(obProd.getDescricao, obProd.getUnidade));
        progressoFuncao('', '',
          FloatToStr(obProd.getQuantidade)+ ' ' + obProd.getUnidade + ' X ' +
          Format('%6.'+ IntToStr(CImpressoraF.vFqtdDig), [obProd.getValorVendaItem] ) + '          ' +
          obProd.getSitTributaria + ' ' +
          Format('%6.'+ IntToStr(CImpressoraF.vFqtdDig), [obProd.getValorVendaItem * obProd.getQuantidade] ));
        if (obCupom.getDescontoAcrescimoPercenentual > 0) or (obCupom.getDescontoAcrescimoValor > 0) then
          progressoFuncao('', '',
            'desconto ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obProd.getValorVendaItem)]) + '%    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]))
        else if (obCupom.getDescontoAcrescimoPercenentual < 0) or (obCupom.getDescontoAcrescimoValor
          < 0) then
          progressoFuncao('', '', 'acréscimo ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obProd.getValorVendaItem)]) + '%    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]));
        Result := true;
      end;
    if (vProdServ = 'S') or (vProdServ = 'T') then
      if enviaVendaItemImpressora(obServ.getCodigo, obServ.getDescricao,
        obServ.getSitTributaria,
        obServ.getCQuant, StrToInt(obServ.getCasasDecimaisVlUnit), obServ.getValorVendaItem,
        obCupom.getDescontoAcrescimoPercenentual, obCupom.getDescontoAcrescimoValor,
        obServ.getQuantidade) then
      begin
        obCupom.vItem.vTipo_item := '09';
        obCupom.vItem.vUnidade := 'UN';
				if not obCupom.vendeItem(obServ.dataSet.FieldByName('cod_servico').AsInteger,
					obServ.dataSet.FieldByName('cod_servico').AsString, obServ.getCodigo,
					obServ.getSitTributaria, obServ.getDescricao, obServ.getQuantidade,
					obServ.getValorVendaItem, obServ.getCasasDecimaisQtde, obServ.getCasasDecimaisVlUnit,
					obServ.getDescAliq, 'S') then
				begin
					try CancelarCupomAtual except end;
					Exit;
				end;
				progressoFuncao('', '', obProd.getNBarra + ' ' +
					CImpressoraF.MontaDescricao(obProd.getDescricao, obProd.getUnidade));
        progressoFuncao('', '',
          FloatToStr(obProd.getQuantidade)+ ' ' + obProd.getUnidade + ' X ' +
          Format('%6.'+ IntToStr(CImpressoraF.vFqtdDig), [obProd.getValorVendaItem] ) + '          ' +
          obProd.getSitTributaria + ' ' +
          Format('%6.'+ IntToStr(CImpressoraF.vFqtdDig), [obProd.getValorVendaItem * obProd.getQuantidade] ));
        if (obCupom.getDescontoAcrescimoPercenentual > 0) or (obCupom.getDescontoAcrescimoValor > 0) then
          progressoFuncao('', '', 'desconto ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obServ.getValorVendaItem)]) + '%    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]))
        else if (obCupom.getDescontoAcrescimoPercenentual < 0) or (obCupom.getDescontoAcrescimoValor
          < 0) then
          progressoFuncao('', '', 'acréscimo ' + Format(' %5.2f',
            [obCupom.getDescontoAcrescimoPercentualImpressao(obProd.getValorVendaItem)]) + '%    '
            + Format(' %10.2f', [StrToFloat(CImpressoraF.vFValorLiq)]));
        Result := true;
      end;
  end;
begin

  temDinheiro := false;
  temCartao := false;
  somaForma := 0;
  somaVenda := 0;

  Result:= False;

  try
    Screen.Cursor := crHourGlass;

    if obPreVenda = nil then
      obPreVenda := TPreVendaRetaguarda.create;
//    obPreVenda.selecionaVendasParaCupomDiaAtual(0,0);

    obEmpresa.selecionaEmpresa(codEmpresa);

    if pConfirmarExclusao then
      if Application.MessageBox('Deseja mesmo Cancelar a Pré-Venda', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

    obEmpresa.selecionaEmpresa(codEmpresa);
    obPreVenda.selecionaVendasParaCupom(pNumVenda, pTipoVenda, pCancelarCupom);

    vVoltarEstoque := obPreVenda.voltarEstoque;

    if obPreVenda.dataSet.IsEmpty then
    begin
      Application.MessageBox(pchar('Venda não encontrada ou ja emitido cupom fiscal'), 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;
    obPreVenda.vItem.selecionaItensDaVenda(pNumVenda, pTipoVenda);
    obPreVenda.vItem.dataSet.First;
    if obPreVenda.dataSet.IsEmpty then
    begin
      if not pCancelarCupom then
        Application.MessageBox(pchar('Venda sem itens'),'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;

    if not obPreVenda.marcarVendaParaCupom then
    begin
      Application.MessageBox(pchar('Venda travada por outro usuário'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      Exit;
    end;

    somaForma := 0;

    obPreVenda.vItem.First;
    while not obPreVenda.vItem.dataset.Eof do
    begin
      if (Trim(obPreVenda.vItem.dataSet.FieldByName('status').AsString) <> 'CANCELADO') or (pCancelarCupom) then
        somaVenda := somaVenda + (obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
          obPreVenda.vItem.dataSet.FieldByName('QTDE').AsFloat) +
          obPreVenda.vItem.dataSet.FieldByName('rateio_acresc').AsCurrency -
          obPreVenda.vItem.dataSet.FieldByName('rateio_desc').AsCurrency;
      obPreVenda.vItem.dataSet.Next;
    end;

    obCupom.setNPreVND(obPreVenda.dataSet.FieldByName('paf_num_prevenda').AsInteger,
      obPreVenda.dataSet.FieldByName('nped').AsInteger,
      obPreVenda.dataSet.FieldByName('data_fech').AsDateTime,
      obPreVenda.dataSet.FieldByName('valor_total').AsCurrency);
    vValorItens := 0;
    obPreVenda.vItem.First;
    while not obPreVenda.vItem.Eof do
    begin
      vProdServ := obPreVenda.vItem.dataSet.FieldByName('tipo').AsString;
      quantidade := obPreVenda.vItem.dataSet.FieldByName('qtde').AsString;
      obProd.CustoMedio := obPreVenda.vItem.dataSet.FieldByName('PCUST_MC').AsFloat;
      if (obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') then
        codBarra := 'GRUPO|CODIGO|' + IntToStr(obPreVenda.vItem.dataSet.FieldByName('GRUPOOUSERV').AsInteger) + '|' +
          Trim(obPreVenda.vItem.dataSet.FieldByName('cod_prod').AsString) + '|'
      else
        codBarra := trim(obPreVenda.vItem.dataSet.FieldByName('num_fab_prod').AsString);
      if (obPreVenda.vItem.dataSet.FieldByName('tipo').AsString = 'P') and
        (obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency > 0) then
      begin
        if not enviaItemVenda(quantidade + '*' + codBarra,
          trim(obPreVenda.vItem.dataSet.FieldByName('DESCR').AsString),
          (obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency), 
          (obPreVenda.vItem.dataSet.FieldByName('cod_vendedor').AsInteger) ) then
        begin
          if obCupom.getSubTotal > 0 then
            CancelarCupomAtual;
          obPreVenda.desmarcaVendaParaCupom;
          exit;
        end;

        nCupom := obCupom.getNCupom;
        vValorItens := vValorItens + obPreVenda.vItem.dataSet.FieldByName('vl_unit').AsCurrency *
          obPreVenda.vItem.dataSet.FieldByName('qtde').AsFloat;
      end;
      obPreVenda.vItem.Next;
    end;
    obCupom.tipoVenda := obPreVenda.dataSet.FieldByName('tipo').AsString;

    obFinalizador.getTodos;
    obFinalizador.First;
    obCupom.setMemo(nil);

    obCliente.selecionaCliente(obPreVenda.dataSet.FieldByName('cod_cliente').AsInteger);
    obCupom.setDadosAvulso(obPreVenda.dataSet.FieldByName('cod_cliente').AsString + ' '+
    obCliente.dataSet.FieldByName('nome_cliente').AsString,
      Trim(obCliente.dataSet.FieldByName('endereco').AsString) + ', ' +
      obCliente.dataSet.FieldByName('num_end_cliente').AsString,
      obCliente.dataSet.FieldByName('bairro').AsString,
      obCliente.dataSet.FieldByName('cidade').AsString,
      obCliente.dataSet.FieldByName('sigla_uf').AsString,
      obCliente.dataSet.FieldByName('cpfcgc').AsString, '', '');

    if vValorItens > somaVenda then
      setDescontoAcrescimo(vValorItens - somaVenda, 0)
    else
      setDescontoAcrescimo(0, somaVenda - vValorItens);//setDescontoAcrescimo(0, 0);//setDescontoAcrescimo(0, somaVenda - vValorItens);

    progressoFuncao('', '', 'Fechando cupom fiscal');

    if formaPagamento(obCupom.getSubTotal, obPreVenda.dataSet.FieldByName('cod_cliente').AsString) then
    begin
      vSubTotal := 0;
      if obCupom.emSubTotal then
        vSubTotal := 1;

      progressoFuncao('', '', 'Cancelando Cupom Fiscal');

      if not CImpressoraF.CancelaCupom(vSubTotal) then
        exit
      else
      begin
        obCupom.cancelarCupomFiscal;
        CImpressoraF.FechaPortaSerial;
      end;
      obProd.CommitaTransacao;
      obProd.IniciaTransacao;
      if obprod.dataSet.Active then
        obProd.dataSet.Refresh;

      obPreVenda.cancelarPreVenda(vVoltarEstoque);
      obPreVenda.desmarcaVendaParaCupom;
      Result:= True;
    end;
    exit;

  finally
    obPreVenda.Close;
    obPreVenda.CommitaTransacao;
    Screen.Cursor := crDefault;
  end;
end;

function TIni.cancelarVendasAnteriores(pNumVenda: Integer; pTipoVenda: string; pQuery: TIBQuery): Boolean;
var
  vLista: TStringList;
  I: Integer;
begin

  Result := true;

  pQuery.Close;
  pQuery.SQL.Text := 'with recursive' +
                     '  RECURSIVO1 as (' +
                     '    select pv1.nped,' +
                     '           pv1.tipo,' +
                     '           pv1.nped_originado nped_or,' +
                     '           pv1.tipo_originado tipo_or,' +
                     '           pv1.cod_empresa,' +
                     '           count(pv1.nped) as vCont' +
                     '    from pedvenda pv1' +
                     '    where pv1.cod_empresa = ' + codEmpresa + ' and pv1.nped_originado > 0 and pv1.status_ped = ''CANCELADO'' and coalesce(pv1.paf_status_prevenda, '''') = ''''' +
                     '    group by pv1.nped,  pv1.tipo, pv1.cod_empresa, pv1.nped_originado,  pv1.tipo_originado' +
                     '  ),' +
                     '  recursivo2 as (' +
                     '    select pv2.nped,' +
                     '           pv2.tipo,' +
                     '           pv2.cod_empresa' +
                     '    from pedvenda pv2' +
                     '    where pv2.nped = ' + IntToStr(pNumVenda) + ' and pv2.tipo = ' + QuotedStr(Trim(pTipoVenda))+ ' and pv2.cod_empresa = ' + codEmpresa +
                     '    union all' +
                     '    select pv3.nped,' +
                     '           pv3.tipo,' +
                     '           pv3.cod_empresa' +
                     '    from pedvenda pv3' +
                     '         join recursivo2 r2 on r2.nped = pv3.nped_originado and' +
                     '         r2.tipo = pv3.tipo_originado and r2.cod_empresa = pv3.cod_empresa' +
                     '  )' +
                     ' select v.nped,' +
                     '       v.tipo,' +
                     '       v.cod_empresa,' +
                     '       v2.nped_or,' +
                     '       v2.tipo_or,' +
                     '       v2.cod_empresa cod_empresa_or' +
                     ' from recursivo2 v' +
                     '     left join recursivo1 v2' +
                     '       on v2.nped  = v.nped and v2.tipo = v.tipo and v2.cod_empresa = v.cod_empresa' +
                     '       where not v2.nped_or is null';
  pQuery.Open;

  vLista:= TStringList.Create;
  vLista.Clear;

  pQuery.First;
  while not pQuery.Eof do
  begin
    vLista.Add(IntToStr(pQuery.FieldByName('nped').AsInteger) + '|' + Trim(pQuery.FieldByName('tipo').AsString) + '|');
    pQuery.Next;
  end;

  for I := 0 to vLista.Count - 1 do
    result := emitirCupomPelaVenda(StrToInt(getCampoPipe(vLista[I], 1)), getCampoPipe(vLista[I], 2), True, False);
end;

function TIni.diferencaNoGrandeTotal( pMsg: string ):boolean;
begin
  Result := False;
  if not verificaGrandeTotal then
  begin
    Result := True;
    if pMsg = 'S' then
      Application.MessageBox(pchar('Operação Indisponível no momento!' + #13 +
        'Impressora não responde ou diferença no Grande Total acumulado' + #13 + vPesquisa), 'Informação', MB_ICONINFORMATION + mb_OK);
  end;
end;

function TIni.diferencaNoNumeroSerie( pMsg: string ):boolean;
var
  vNsr:string;
  vTemp1: string;
  vTemp2: string;
begin
	Result := False;
	vNsr := Trim(CImpressoraF.NumeroSerie);
	if vNsr = '' then
	begin
		Result := True;
		if pMsg = 'S' then
		begin
			vTemp2 := 'Número de Série de Fabricação do ECF não retornado pelo ECF'+#13+
			 'Verifique problemas de comunicação';
			Application.MessageBox(pchar(vTemp2), 'Informação', 0 + 64);
		end;
	end;
	//vTemp1:= getNumSerieEcfDescriptografado;
	vTemp1:= Trim(copy(getNumSerieEcfDescriptografado,1,length(Trim(vNsr))));
	if trim(vNsr) <> vTemp1 then
 // if pos(trim(vNsr), vTemp1) = 0   then
	begin
		Result := True;
		if pMsg = 'S' then
		begin
			vTemp2 := 'Número de Série de Fabricação do ECF diferente do informado no arquivo auxiliar'+#13+
			 'Informado na Impressora Fiscal:' + Copy(vNsr,1,length(trim(vNsr))) + #13+
			 'Informado no Arquivo Auxiliar.:'+ vTemp1;
			Application.MessageBox(pchar(vTemp2), 'Informação', 0 + 64);
		end;
	end;
	if not Result then
		if vNumSerieEcf <> getNumSerieEcfDescriptografado then
			vNumSerieEcf := getNumSerieEcfDescriptografado;
end;

function TIni.semComunicacaoComECF( pMsg: string ):boolean;
begin
	Result := False;
	if not CImpressoraF.VerificaImpressoraLigada then
	begin
		Result := True;
		if pMsg = 'S' then
      if Application.MessageBox('Sem Comunição com o ECF. Ver retorno?',
        'Confirmação',MB_ICONQUESTION + MB_YESNO) = IDYES then
      begin
        CImpressoraF.Analisa_iRetorno;
        CImpressoraF.Verifica_Impressora;
      end;
  end;
end;

function TIni.impressaoEmAndamento( pMsg: string ):boolean;
begin
  Result := False;
  if CImpressoraF.cupomAberto then
  begin
    Result := True;
    if pMsg = 'S' then
      Application.MessageBox(pchar('Operação Indisponível no momento!' + #13 +
        'Impressão de documento fiscal em andamento'), 'Informação', 0 + 64);
  end;  
end;

function TIni.caixaFiscalFechado( pMsg: string ):boolean;
begin
  Result := False;
  if statusCaixa = 0 then
  else
  begin
    Result := True;
    if pMsg = 'S' then
      Application.MessageBox(pchar('Caixa fechado'), 'Informação', 0 + 64);
  end;
end;

procedure TIni.lmf;
begin
	try
		Screen.Cursor := crHourGlass;

		if semComunicacaoComECF('S') then
      Exit
		else if semArquivoAuxiliar('S') then
			Exit
    else if diferencaNoNumeroSerie('S') then
      Exit
    else if impressaoEmAndamento('S') then
      Exit
    else if caixaFiscalFechado('S') then
      Exit;

    GravaAuditoria('FIS026', 'RELATÓRIO','','','', dtmEnt.qrBuscas);

    Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
    frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.TabSheet1;
    frmComandosPDV.RadioGroup2.ItemIndex := 0;
    frmComandosPDV.RadioGroup2.Enabled := True;
    frmComandosPDV.PageControl1.Tag := 1;
    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.lmfc;
begin
  try
    Screen.Cursor := crHourGlass;

    if semComunicacaoComECF('S') then
      Exit
    else if diferencaNoNumeroSerie('S') then
      Exit
    else if impressaoEmAndamento('S') then
      Exit
    else if caixaFiscalFechado('S') then
      Exit;

    GravaAuditoria('FIS026', 'RELATÓRIO','','','', dtmEnt.qrBuscas);

    Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
    frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.TabSheet1;
    frmComandosPDV.RadioGroup2.ItemIndex := 0;
    frmComandosPDV.RadioGroup2.Enabled := false;
    frmComandosPDV.PageControl1.Tag := 1;
    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.lmfs;
begin
  try
    Screen.Cursor := crHourGlass;

    if semComunicacaoComECF('S') then
      Exit
    else if diferencaNoNumeroSerie('S') then
      Exit
    else if impressaoEmAndamento('S') then
      Exit
    else if caixaFiscalFechado('S') then
      Exit;

    GravaAuditoria('FIS027', 'RELATÓRIO','','','', dtmEnt.qrBuscas);

    Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
    frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.TabSheet1;
    frmComandosPDV.RadioGroup2.ItemIndex := 1;
    frmComandosPDV.RadioGroup2.Enabled := false;
    frmComandosPDV.PageControl1.Tag := 1;
    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.registrosDoPAFECF;
var
  hdTemp: THandle;
  formulario: TForm;
begin
	try
		Screen.Cursor := crHourGlass;

		if vSincronizacaoEmSegundoPlano <> 'S' then
			try
				abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
				vHwSinc._sincronizarDados;
			finally
				fechaStatusProcessamento;
			end;

    formulario := Funcoes.AbreForm('PkArquivosDig', 'TfrmAnexoIV_registrosPAFECF', hdTemp);
    try
      formulario.ShowModal;
    finally
      formulario.Free;
      unLoadPackage(hdTemp);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.espelhoMfdMF;
begin
  try
    Screen.Cursor := crHourGlass;

    if semComunicacaoComECF('S') then
      Exit
    else if diferencaNoNumeroSerie('S') then
      Exit;

    GravaAuditoria('FIS028', 'RELATORIO','','','', dtmEnt.qrBuscas);

    Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
    frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.TabSheet2;
    frmComandosPDV.RadioGroup2.ItemIndex := 0;
    frmComandosPDV.PageControl1.Tag := 2;
    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.arquivoMf;
begin
	try
		Screen.Cursor := crHourGlass;

		if semComunicacaoComECF('S') then
			Exit
		else if semArquivoAuxiliar('S') then
			Exit
		else if diferencaNoNumeroSerie('S') then
			Exit
		else if diferencaNoGrandeTotal('S') then
			Exit;

		GravaAuditoria('FIS029', 'ARQUIVO MF','','','', dtmEnt.qrBuscas);

		Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
		frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.TabSheet8;
		frmComandosPDV.RadioGroup2.ItemIndex := 0;
		frmComandosPDV.GroupBox2.Caption := 'Gerar arquivo MF por data ou COO';
    frmComandosPDV.RadioGroup11.ItemIndex := 1;
    frmComandosPDV.PageControl1.Tag := 8;
    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.arquivoMfd;
begin
	try
		Screen.Cursor := crHourGlass;

		if semComunicacaoComECF('S') then
			Exit
		else if semArquivoAuxiliar('S') then
			Exit
		else if diferencaNoNumeroSerie('S') then
			Exit
		else if diferencaNoGrandeTotal('S') then
			Exit;

		GravaAuditoria('FIS029', 'ARQUIVO MFD','','','', dtmEnt.qrBuscas);

		Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
		frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.TabSheet8;
    frmComandosPDV.RadioGroup2.ItemIndex := 0;
		frmComandosPDV.GroupBox2.Caption := 'Gerar arquivo MFD por data ou COO';
    frmComandosPDV.RadioGroup11.ItemIndex := 0;
    frmComandosPDV.PageControl1.Tag := 8;
    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.TabProd;
begin
  try
    Screen.Cursor := crHourGlass;

    GravaAuditoria('FIS030', 'RELATORIO','','','', dtmEnt.qrBuscas);

    Application.CreateForm(TFrmAnexoV, FrmAnexoV);
    FrmAnexoV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.estoque;
begin
  try
    Screen.Cursor := crHourGlass;

    GravaAuditoria('FIS035', 'RELATÓRIO','','','', dtmEnt.qrBuscas);

//    Application.CreateForm(TFrmAnexoIVEst, FrmAnexoIVEst);
//    FrmAnexoIVEst.ShowModal;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.movimentoPorEcf;
begin
  try
    Screen.Cursor := crHourGlass;

    GravaAuditoria('FIS031','RELATÓRIO','','','', dtmEnt.qrBuscas);

    if (vTipoConexao = 'off') then
      if not conectaBanco(dtmAtivo.bancoHw, vBancoHW, False) then
      begin
        Application.MessageBox('Sem conexão com banco de dados do Servidor', 'Atenção', 0 + 64);
        Exit;
      end;  

    Application.CreateForm(TFrmAnexoVI, FrmAnexoVI);
    FrmAnexoVI.ArqAnexoVI.vDtMov := FormatDateTime('dd/mm/yyyy', Date);
    FrmAnexoVI.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.meiosDePgto;
begin
  try
    Screen.Cursor := crHourGlass;

    if semComunicacaoComECF('S') then
      Exit
    else if diferencaNoNumeroSerie('S') then
      Exit
    else if impressaoEmAndamento('S') then
      Exit;
//    else if caixaFiscalFechado('S') then
//      Exit;

    GravaAuditoria('FIS032', 'RELATÓRIO','','','', dtmEnt.qrBuscas);

    Application.CreateForm(TFrmRelPeriodo, frmRelPeriodo);
    if frmRelPeriodo.showmodal = mrOK then
    begin
      if (frmRelPeriodo.MaskEdit1.Text = '  /  /    ') or
        (frmRelPeriodo.MaskEdit2.Text = '  /  /    ') then
      begin
        application.messagebox(pchar('Período informado inválido'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK);
        exit;
      end;
      TRY
        StrToDate(frmRelPeriodo.MaskEdit1.Text);
        StrToDate(frmRelPeriodo.MaskEdit2.Text);
      except
        application.messagebox(pchar('Período informado inválido'), 'Atenção', MB_ICONEXCLAMATION
          + mb_OK);
        exit;
      end;
      obCupom.vMeiosPag.selecionaPeriodo(StrToDate(frmRelPeriodo.MaskEdit1.Text),
        StrToDate(frmRelPeriodo.MaskEdit2.Text));

//      if not obCupom.vMeiosPag.dataSet.IsEmpty then
      begin
        MensagemFiscal('Aguarde! Meios de Pagamento...');
        try
          CImpressoraF.vTituloRel := 'Período de :' + frmRelPeriodo.MaskEdit1.Text + ' a ' +
            frmRelPeriodo.MaskEdit2.Text;
          ImpMeiosPagamento;
//          application.messagebox('Relatório concluído', 'Atenção', 0+64);
        finally
        end;
//      end
//      else
//      begin
//        application.messagebox(pchar('Nenhum meio de pagamento encontrado no período informado'),
//          'Atenção',
//          MB_ICONEXCLAMATION + mb_OK);
//        exit;
      end;
    end;
  finally
    frmRelPeriodo.free;
    frmRelPeriodo := nil;
    limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.davsEmitidos;
begin
  try
    Screen.Cursor := crHourGlass;

    GravaAuditoria('FIS033', 'RELATÓRIO','','','', dtmEnt.qrBuscas);

    Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
    frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.TabSheet5;
    frmComandosPDV.PageControl1.Tag := 5;

    frmComandosPDV.RadioGroup9.Enabled := True;
    if (semComunicacaoComECF('N')) or (diferencaNoNumeroSerie('N')) or
      (impressaoEmAndamento('N')) or (caixaFiscalFechado('N')) then
    begin
      Application.MessageBox('ECF impedido de fazer impressões. Função disponível apenas de arquivo eletrônico','Atenção',0+64);
      frmComandosPDV.RadioGroup9.ItemIndex := 1;
      frmComandosPDV.RadioGroup9.Enabled := False;
    end;

    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.identificacaoDoPafECFMenuFiscal;
begin
	inherited;
	try
		Screen.Cursor := crHourGlass;

		if semComunicacaoComECF('S') then
			Exit
		else if semArquivoAuxiliar('S') then
			Exit
		else if diferencaNoNumeroSerie('S') then
			Exit
		else if impressaoEmAndamento('S') then
			Exit
		else if caixaFiscalFechado('S') then
			Exit;

    GravaAuditoria('FIS034', 'RELATÓRIO','','','', dtmEnt.qrBuscas);

    MensagemFiscal('Aguarde! Identificação do PAF-ECF...');
    try
      IdentificaoPAFECF;
      GravaAuditoria('FIS034','RELATÓRIO','','','',dtmEnt.qrBuscas);
    finally
    end;
  finally
    limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.vendasDoPeriodo;
var
  nowStr: string;
  vNomeArq: string;
begin
  try
    MensagemFiscal('Aguarde. Inicando processo');
    obCliente.CommitaTransacao;
    obCliente.Refresh;
    MensagemFiscal('Aguarde. Inicando processo');
    obProd.Refresh;
    MensagemFiscal('Aguarde. Inicando processo');
    obServ.Refresh;
		if vSincronizacaoEmSegundoPlano <> 'S' then
			try
				abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
				vHwSinc._sincronizarDados;
			finally
        fechaStatusProcessamento;
      end;
  finally
    limpaMensagem;
  end;
  
  try
    Screen.Cursor := crHourGlass;

    Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
    frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.tsVendasPeriodo;
    frmComandosPDV.RadioGroup2.ItemIndex := 0;
    frmComandosPDV.RadioGroup2.Enabled := false;
    frmComandosPDV.PageControl1.Tag := 10;
    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
  {exit;


  try
    MensagemFiscal('Aguarde. Inicando processo');
    obCliente.CommitaTransacao;
    obCliente.Refresh;
    MensagemFiscal('Aguarde. Inicando processo');
    obProd.Refresh;
    MensagemFiscal('Aguarde. Inicando processo');
    obServ.Refresh;
  finally
    limpaMensagem;
  end;
  try
    Screen.Cursor := crHourGlass;

    GravaAuditoria('FIS039', 'RELATORIO','','','', dtmEnt.qrBuscas);

    Application.CreateForm(TfrmRelPeriodo, frmRelPeriodo);
    frmRelPeriodo.Caption := 'Vendas do Período - Convênio 57/95 - COTEPE ICMS 09/08';
    frmRelPeriodo.Label3.Visible := true;
    frmRelPeriodo.Label3.Caption := 'Informe o perído desejado';
    frmRelPeriodo.ShowModal;
    if frmRelPeriodo.ModalResult = IDOK then
    begin
      nowStr := DateTimeToStr(now);
      nowStr := StringReplace(nowStr, '/', '', [rfReplaceAll, rfIgnoreCase]);
      nowStr := StringReplace(nowStr, ':', '', [rfReplaceAll, rfIgnoreCase]);
      nowStr := StringReplace(nowStr, ' ', '', [rfReplaceAll, rfIgnoreCase]);
      vNomeArq := vPathArquivosDigitais + '\' + Trim(vNumeroLaudoPAFECF)+nowStr+'.txt';

      if FileExists(sintegraPAFECF('N', pchar(vBancoHW), StrToInt(codEmpresa),
        pchar(vVersaoFiscal), pchar(frmRelPeriodo.MaskEdit1.Text),
        pchar(frmRelPeriodo.MaskEdit2.Text),pchar(vNomeArq))) then
        gerarMD5ArquivoEletronico(vNomeArq);

      nowStr := DateTimeToStr(now);
      nowStr := StringReplace(nowStr, '/', '', [rfReplaceAll, rfIgnoreCase]);
      nowStr := StringReplace(nowStr, ':', '', [rfReplaceAll, rfIgnoreCase]);
      nowStr := StringReplace(nowStr, ' ', '', [rfReplaceAll, rfIgnoreCase]);
      vNomeArq := vPathArquivosDigitais + '\' + Trim(vNumeroLaudoPAFECF)+nowStr+'.txt';

      if FileExists(gerarSpedFiscalPAFECF(pchar(codEmpresa),pchar(vBancoHW),
        pchar(frmRelPeriodo.MaskEdit1.Text), pchar(frmRelPeriodo.MaskEdit2.Text),pchar(vNomeArq))) then
        gerarMD5ArquivoEletronico(vNomeArq);
    end;
  finally
    frmRelPeriodo.Free;
    frmRelPeriodo := nil;
    conectaBanco(dtmAtivo.bancoFiscal, vBancoFiscal, true);
    Screen.Cursor := crDefault;
  end;   }
end;

procedure TIni.tabIndiceTecnicoProducao;
begin
	try
		Screen.Cursor := crHourGlass;

		GravaAuditoria('FIS040', 'RELATÓRIO','','','', dtmEnt.qrBuscas);

		Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
		frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.tsIndTec;
		frmComandosPDV.RadioGroup8.ItemIndex := 0;
		frmComandosPDV.RadioGroup10.ItemIndex := 0;
		frmComandosPDV.PageControl1.Tag := 9;

		frmComandosPDV.RadioGroup8.Enabled := True;
		if (semComunicacaoComECF('N')) or (diferencaNoNumeroSerie('N')) or
		(impressaoEmAndamento('N')) or (caixaFiscalFechado('N') or semArquivoAuxiliar('N')) then
    begin
      Application.MessageBox('ECF impedido de fazer impressões. Função disponível apenas de arquivo eletrônico','Atenção',0+64);
      frmComandosPDV.RadioGroup8.ItemIndex := 1;
      frmComandosPDV.RadioGroup8.Enabled := False;
    end;

    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TIni.impressaoGerencialLista(pLista: TStringList);
var
  I: Integer;
begin
	try
		Screen.Cursor := crHourGlass;

		if semComunicacaoComECF('S') then
			Exit
		else if semArquivoAuxiliar('S') then
			Exit
		else if diferencaNoNumeroSerie('S') then
			Exit
		else if impressaoEmAndamento('S') then
			Exit
		else if caixaFiscalFechado('S') then
			Exit;

    MensagemFiscal('Imprimindo');

    CImpressoraF.abrerelatorioGer;
    for I := 0 to plista.Count - 1 do
      CImpressoraF.RelatorioGerencial2(
        CImpressoraF.TamDescricao(48, pLista[I]));
    CImpressoraF.FechaRelatorioGerencial;
  finally
    limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.parametrosDeCOnfiguracao;
var
  vLista: TStringList;
  I: Integer;
begin
	try
		Screen.Cursor := crHourGlass;

		if semComunicacaoComECF('S') then
			Exit
		else if semArquivoAuxiliar('S') then
			Exit
		else if diferencaNoNumeroSerie('S') then
			Exit
		else if impressaoEmAndamento('S') then
			Exit
		else if caixaFiscalFechado('S') then
			Exit;

    MensagemFiscal('Imprimindo');

		vLista := TStringList.Create;
		vLista.Clear;

		vLista.Add(Replicate('=', CImpressoraF.QtdeColunasImpressao));
		vLista.Add(CImpressoraF.centralizaDescricao(CImpressoraF.QtdeColunasImpressao, 'PARÂMETROS DE CONFIGURAÇÃO'));
		vLista.Add(Replicate('=', CImpressoraF.QtdeColunasImpressao));
		vLista.Add('');
		vLista.Add('Todas as parametrizações relacionadas neste');
		vLista.Add('relatório são de configuração inacessível ao');
		vLista.Add('usuário do PAF-ECF. A ativação ou não destes');
		vLista.Add('parâmetros é determinada pela unidade federada');
		vLista.Add('e somente pode ser feita pela intervenção da');
		vLista.Add('empresa desenvolvedora do PAF-ECF.');
		vLista.Add('');
		vLista.Add('IDENTIFICAÇÃO E CARACTERISTICAS DO');
		vLista.Add('PROGRAMA APLICATIVO FISCAL');
		vLista.Add(Replicate('-', CImpressoraF.QtdeColunasImpressao));
		vLista.Add('Nome Comercial....: Fiscal 4.1');
		vLista.Add('Versão............: 4.1');
		vLista.Add('Ling. Programação.: Delphi 2006');
		vLista.Add('Sist. Operacional.: Windows');
		vLista.Add('Banco de dados....: Firebird');
		vLista.Add('');
		vLista.Add('FUNCIONALIDADES');
		vLista.Add(Replicate('-', CImpressoraF.QtdeColunasImpressao));
		vLista.Add('Tipo de Funcionamento...: Exclus Stand Alone');
		vLista.Add('Tipo de Desenvolvimento.: Comercializavel');
		vLista.Add('Integração com PAF-ECF..: Retaguarda');
		vLista.Add('');
		vLista.Add('PARÂMETROS PARA NÃO CONCOMITÂNCIA');
		vLista.Add(Replicate('-', CImpressoraF.QtdeColunasImpressao));
		vLista.Add('--Req IV');
		vLista.Add('ITEM 2: Realiza registros de pré-venda');
		vLista.Add('conforme definido no inciso II do art. 2º...:S');
		vLista.Add('ITEM 3: Emitir DAV, impresso em equip. não');
		vLista.Add('fiscal, conf. defin. no inciso III do art.2º:S');
		vLista.Add('ITEM 4: Emite DAV, impresso no ECF, como');
		vLista.Add('Relat. Ger.,conforme defin. no inciso');
		vLista.Add('III do art.2º...............................:S');
		vLista.Add('ITEM 5: Registro de lançamento de mesa ou');
		vLista.Add('conta de cliente............................:N');
		vLista.Add('--Req VI');
		vLista.Add('ITEM 2: imprime o DAV conforme o modelo');
		vLista.Add('constante no Anexo II.......................:S');
		vLista.Add('');
		vLista.Add('OFICINA DE CONSERTO');
		vLista.Add(Replicate('-', CImpressoraF.QtdeColunasImpressao));
		vLista.Add('--Req LI');
		vLista.Add('ITEM 1: Emite DAV-OS para serviços..........:S');
		vLista.Add('');

		vLista.Add('APLICAÇÕES ESPECIAIS');
		vLista.Add(Replicate('-', CImpressoraF.QtdeColunasImpressao));
		vLista.Add('--Req. VII');
		vLista.Add('ITEM 14: Tabela de Indice Técnico');
		vLista.Add('de Producao.................................:S');
		vLista.Add('');
		vLista.Add('  Bloco II');
		vLista.Add('Revendedor de combustiveis');
		vLista.Add('--Req. XXXIV ao Req. XLV....................:N');
		vLista.Add('');
		vLista.Add('  Bloco III');
		vLista.Add('Bar, Restaurantes e similares');
		vLista.Add('--Req. XLVI ao Req. XLIX....................:N');
		vLista.Add('');
		vLista.Add('  Bloco IV');
		vLista.Add('Farmácia de Manipulação');
		vLista.Add('--Req. L....................................:N');
		vLista.Add('');
		vLista.Add('CRITÉRIOS POR UNIDADE FEDERADA');
		vLista.Add(Replicate('-', CImpressoraF.QtdeColunasImpressao));
		vLista.Add('--Req. XIX');
		vLista.Add('ITEM 1 alinea b: emissão de documento');
		vLista.Add('fiscal por PED...............................:S');
		vLista.Add('--Req. XX');
		vLista.Add('ITEM 1 - Tela de Consulta de Produtos');
		vLista.Add('Alinea a: Totalização dos valores da lista...:N');
		vLista.Add('Alinea b: Transf. das info em Pré-venda......:N');
		vLista.Add('Alinea c: Transf. das info em DAV............:N');
		vLista.Add('--REQ. XXIV');
		vLista.Add('ITEM 7 Alinea b: Recompõe valor GT...........:S');
		vLista.Add('ITEM 8 Recompõe Número Série.................:N');
		vLista.Add('--Req. IX');
		vLista.Add('ITEM 2 : MINAS LEGAL.........................:S');
		vLista.Add('ITEM 2A: CUPOM MANIA.........................:S');
		vLista.Add('ITEM 2B: NOTA LEGAL..........................:S');
		vLista.Add('ITEM 2C: PARAIBA LEGAL.......................:S');
		vLista.Add('--Req. XVI');
		vLista.Add('ITEM 4: TROCO EM CARTÃO');
		vLista.Add('Alinea a1: Minimercados Santa Catarina.......:N');
		vLista.Add('Alinea a2: Doação............................:N');

		vLista.Add('');


					 {
		vLista.Text :=
			'-----Parâmetros de configuração do PAF-ECF------' + #13 +
      '                                                ' + #13 +      
			'Todas as parametrizações relacionadas neste     ' + #13 +
			'relatório são de configuração inacessível ao    ' + #13 +
			'usuário do PAF-ECF. A ativação ou não destes    ' + #13 +
			'parâmetros é determinada pela unidade federada  ' + #13 +
			'e somente pode ser feita pela intervenção da    ' + #13 +
			'empresa desenvolvedora do PAF-ECF.              ' + #13 +
			'                                                ' + #13 +
      'Tipo de funcionamento:                          ' + #13 +
      '  (REQUISITO III)                               ' + #13 +
      '    Exclusivamente Stand Alone                  ' + #13 +
      '                                                ' + #13 +
      'Emissão de DAV-OS para oficina de conserto:     ' + #13 +
      '  (REQUISITO IV – Item 1)                       ' + #13 +
      '    Sim                                         ' + #13 +
      '                                                ' + #13 +
      'Emissão de DAV:                                 ' + #13 +
      '  (REQUISITO IV – Item 1)                       ' + #13 +
      '    Sim                                         ' + #13 +
      '                                                ' + #13 +
      'Realiza registros de Pré-Venda:                 ' + #13 +
      '  (REQUISITO IV – Item 2)                       ' + #13 +
      '    Sim                                         ' + #13 +
      '                                                ' + #13 +
      'Equipamento para impressão de DAV:              ' + #13 +
      '  (REQUISITO IV – Item 3 e 4)                   ' + #13 +
      '    Impressor não fiscal                        ' + #13 +
      '                                                ' + #13 +
      'Realiza registro de Conta de Cliente:           ' + #13 +
      '  (REQUISITO IV – Item 6)                       ' + #13 +
      '    Não                                         ' + #13 +
      '                                                ' + #13 +
      'Tela para consulta de preço permite:            ' + #13 +
      '  (REQUISITO XVIII)                             ' + #13 +
      '  a) Totalização dos valores da lista de        ' + #13 +
      '  itens;                                        ' + #13 +
      '    Não                                         ' + #13 +
      '  b) Transformação das informações digitadas    ' + #13 +
      '  em registro de pré-venda;                     ' + #13 +
      '    Não                                         ' + #13 +
      '  c) A utilização das informações digitadas     ' + #13 +
      '  para impressão de Documento Auxiliar de       ' + #13 +
      '  Vendas                                        ' + #13 +
      '    Não                                         ' + #13 +
      '                                                ' + #13 +
      'Emissão de documento fiscal por PED             ' + #13 +
      '  (REQUISITO XVII, Item 1 - b):                 ' + #13 +
      '  (REQUISITO XXII – Item 6)                     ' + #13 +
      '    Sim                                         ' + #13 +
      '                                                ' + #13 +
      'Executa recomposição de GT se tiver ocorrido    ' + #13 +
      'incremento do CRO?:                             ' + #13 +
      '  (REQUISITO XXII – Item 7)                     ' + #13 +
			'    Sim                                         ';    }

    CImpressoraF.abrerelatorioGer;
    for I := 0 to vlista.Count - 1 do
      CImpressoraF.RelatorioGerencial2(
        CImpressoraF.TamDescricao(48, vLista[I]));
    CImpressoraF.FechaRelatorioGerencial;


    //GravaAuditoria('FIS040', 'RELATÓRIO','','','', dtmEnt.qrBuscas);
//    CImpressoraF.abrerelatorioGer;
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      '           Parâmetros de Configuração'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      vDadosIniF.Replicate('=',48)));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Impedimento de venda com valor zerado: Sim'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Impedimento de venda com valor negativo: Sim'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Tipo de funcionamento: Stand Alone'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Uso de DAV-OS para oficina de conserto: Sim'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Impressão concomitante: Sim'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Emissão de DAV: Sim'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Realiza Pré venda: Não'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Emissão de DAV em ECF: Nâo'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Realiza registro de Conta de Cliente: Não'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Consulta de Preço: Sim'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Totaliza valoresda lista de itens: Não'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      'Emissão de Documento fiscal por PED: Sim'));
//    CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48,
//      '.'));
//
//    CImpressoraF.FechaRelatorioGerencial;
  finally
    limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.contasCLientesAbertas(pMensagem: Boolean = True);
var
	vQuery, vQueryI: TIBQuery;
	vLista: TStringList;
	vCodCliente: Integer;
	I, J: Integer;
begin
	if bancoConectado = 'local' then
		Exit;

	try
		Screen.Cursor := crHourGlass;
		MensagemFiscal('Imprimindo');

		if obPreVenda = nil then
			obPreVenda := TPreVendaRetaguarda.create;

		vQuery := TIBQuery(obPreVenda.getQueryRetaguarda);
		vQueryI := TIBQuery(obPreVenda.getQueryRetaguarda(True));

    vQuery.Close;
    vQuery.SQL.Text := 'select c.cod_cliente, c.razao, ps.nped, ps.nprevenda, ps.data_ped,' +
      ' ps.horaabertura, ps.minabertura  from pedvenda ps' +
      ' inner join clientes c on c.cod_cliente = ps.cod_cliente and c.cod_empresa = ps.cod_empresa' +
      ' where ps.tipo = ''OS'' and ps.cod_empresa = ' + codEmpresa + ' and coalesce(ps.nprevenda, 0) > 0 and' +
      ' coalesce(ps.status_ped, '''') <> ''CANCELADO'' and coalesce(ps.paf_status_prevenda, '''') <> ''CANCELADA'' and' +
      ' ((coalesce(ps.ncupom, 0) = 0) and (coalesce(ps.num_nf, 0) = 0) and (coalesce(ps.num_nfeext, 0) = 0))'+
      ' and ps.valor_total > 0';
    vQuery.Open;

    if vQuery.IsEmpty then
    begin
      if pMensagem then
        Application.MessageBox('Sem Contas "Conta de Clientes Abertas"', 'Atenção', 0 + 64);
      Exit;
    end;

    vLista := TStringList.Create;

    vCodCliente:= 0;
    vLista.Add('------------Conta de Clientes Abertas-----------');
    vLista.Add('-');

    vQuery.First;
    while not vQuery.Eof do
    begin
      if vCodCliente <> vQuery.FieldByName('cod_cliente').AsInteger then
      begin
        if vCodCliente <> 0 then
          vLista.Add('                    ----');
        vCodCliente := vQuery.FieldByName('cod_cliente').AsInteger; 
        vLista.Add(Copy('Cliente: ' + vQuery.FieldByName('cod_cliente').AsString + '-' + vQuery.FieldByName('razao').AsString, 1, 48));
			end;
			vLista.Add('Num: ' + StrZero(vQuery.FieldByName('nprevenda').AsInteger, vQtdeDigDAV) + ' Data/Hora: ' +
				FormatDateTime('dd/mm/yyyy', vQuery.FieldByName('data_ped').AsDateTime) + ' ' +
				StrZero(vQuery.FieldByName('horaabertura').AsInteger, 2 ) + ':' +
				StrZero(vQuery.FieldByName('minabertura').AsInteger, 2 ));

			{vQueryI.Close;
			vQueryI.SQL.Text :=
				'select c.cod_cliente, c.razao, p.nped, p.nprevenda, p.data_ped,' +
				' p.horaabertura, p.minabertura, p.status_ped, p.ncupom,' +
				' case when coalesce(p.num_nf, 0) > 0 then p.num_nf else coalesce(p.num_nfeext, 0) end num_nf,' +
				' case when coalesce(pp.quant_ped_item, 0 ) = 0 then ''N'' else ''P'' end tp, pp.nitem, pp.descr_prod_ped descr,' +
				' pp.quant_ped_item qtd, pp.vlun_ped_item vlun, pp.vltot_ped_item vltot, pp.rateio_desc des, pp.rateio_acresc acre,' +
				' pp.status, p.valor_total, p.paf_status_prevenda' +
				' from pedvenda p' +
				' inner join clientes c on c.cod_cliente = p.cod_cliente and c.cod_empresa = p.cod_empresa' +
				' inner join pedvenda_prod pp on pp.nped = p.nped and pp.tipo = p.tipo and pp.cod_empresa = p.cod_empresa' +
				' where p.tipo = ''OS'' and p.cod_empresa = ' + codEmpresa + ' and p.nprevenda = ' + IntToStr(vQuery.FieldByName('nprevenda').AsInteger) +
				' union' +
				' select c.cod_cliente, c.razao, p.nped, p.nprevenda, p.data_ped, ' +
				' p.horaabertura, p.minabertura, p.status_ped, p.ncupom,' +
				' case when coalesce(p.num_nf, 0) > 0 then p.num_nf else coalesce(p.num_nfeext, 0) end num_nf,' +
				' case when coalesce(ps.quant_serv_ped, 0 ) = 0 then ''N'' else ''S'' end tp, ps.nitem, ps.desc_serv_ped descr,' +
				' ps.quant_serv_ped qtd, ps.valor_un_serv vlun, ps.valor_tot_serv vltot, ps.rateio_desc des, ps.rateio_acresc acre,' +
				' ps.status, p.valor_total, p.paf_status_prevenda' +
				' from pedvenda p' +
				' inner join clientes c on c.cod_cliente = p.cod_cliente and c.cod_empresa = p.cod_empresa' +
				' inner join pedvenda_serv ps on p.nped = ps.nped and p.tipo = ps.tipo and p.cod_empresa = ps.cod_empresa' +
				' where p.tipo = ''OS'' and p.cod_empresa = ' + codEmpresa + ' and p.nprevenda = ' + IntToStr(vQuery.FieldByName('nprevenda').AsInteger) +
				' order by 11,12';
			vQueryI.Open;

			J:= 0;
			vQueryI.First;
			while not vQueryI.Eof do
			begin
			  Inc(J);
				if Trim(vQueryI.FieldByName('status').AsString) = 'CANCELADO' then
					vLista.Add( ' ' +vDadosIni.StrZero(J, 3) + ' ' +
						Space(FloatToStr(vQueryI.FieldByName('qtd').AsFloat), 10) + ' ' +
						Copy(vQueryI.FieldByName('descr').AsString, 1, 23) + ' cancelado')
				else
					vLista.Add( ' ' + vDadosIni.StrZero(J, 3) + ' ' +
						Space(FloatToStr(vQueryI.FieldByName('qtd').AsFloat), 10) + ' ' +
						Copy(vQueryI.FieldByName('descr').AsString, 1, 33));
				vQueryI.Next;
			end;}
			vQuery.Next;
    end;

    if not EnvCmdsCupom(2) then
      exit;

    CImpressoraF.abrerelatorioGer;
    CImpressoraF.Analisa_iRetorno;
    for I := 0 to vlista.Count - 1 do
    begin
      if CImpressoraF.RelatorioGerencial2(
        CImpressoraF.TamDescricao(48, vLista[I])) = 0 then
        if Application.MessageBox('Continuar imprimindo?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
          Break
        else
        begin
          CImpressoraF.abrerelatorioGer;
          CImpressoraF.RelatorioGerencial2( CImpressoraF.TamDescricao(48, vLista[I]));
        end;
    end;
    CImpressoraF.FechaRelatorioGerencial;

    EnvCmdsCupom(10);

  finally
    limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.conferenciaContaCliente(pCodCliente: Integer; pCodigoConta: Integer);
var
  vCodCliente: string;
  vNumContaCliente: string;
  vQuery: TIBQuery;
  vAcrescimo, vDesconto: Extended;
  vLista: TStringList;
  I, vNPed: Integer;
  vCOO, vCER: String;
begin
//  vCodCliente := IntToStr(pCodCliente);
//  if pCodCliente = 0 then
//    try
//      if not InputQuery('Codigo do Cliente', 'Informe o código do cliente', vCodCliente ) then
//        Exit;
//      pCodCliente := StrToInt(Trim(vCodCliente));
//    except
//      Application.MessageBox('Código inválido','Atenção', 0 + 64);
//      Exit;
//    end;

  vNumContaCliente := IntToStr(pCodigoConta);
  if pCodigoConta = 0 then
    try
      if not InputQuery('Conta do Cliente', 'Informe o código do da conta', vNumContaCliente ) then
        Exit;
      pCodigoConta := StrToInt(Trim(vNumContaCliente));
    except
      Application.MessageBox('Código inválido','Atenção', 0 + 64);
      Exit;
    end;

  try
    Screen.Cursor := crHourGlass;
    MensagemFiscal('Imprimindo');

    if obPreVenda = nil then
      obPreVenda := TPreVendaRetaguarda.create;

    vQuery := TIBQuery(obPreVenda.getQueryRetaguarda);

    vQuery.Close;
    vQuery.SQL.Text :=
      'select c.cod_cliente, c.razao, p.nped, p.nprevenda, p.data_ped,' +
      ' p.horaabertura, p.minabertura, p.status_ped, p.ncupom,' +
      ' case when coalesce(p.num_nf, 0) > 0 then p.num_nf else coalesce(p.num_nfeext, 0) end num_nf,' +
      ' case when coalesce(pp.quant_ped_item, 0 ) = 0 then ''N'' else ''P'' end tp, pp.nitem, pp.descr_prod_ped descr,' +
      ' pp.quant_ped_item qtd, pp.vlun_ped_item vlun, pp.vltot_ped_item vltot, pp.rateio_desc des, pp.rateio_acresc acre,' +
      ' pp.status, p.valor_total, p.paf_status_prevenda' +
      ' from pedvenda p' +
      ' inner join clientes c on c.cod_cliente = p.cod_cliente and c.cod_empresa = p.cod_empresa' +
      ' left join pedvenda_prod pp on pp.nped = p.nped and pp.tipo = p.tipo and pp.cod_empresa = p.cod_empresa' +
      ' where p.tipo = ''OS'' and p.cod_empresa = ' + codEmpresa + ' and p.nprevenda = ' + vNumContaCliente +
      ' union' +
      ' select c.cod_cliente, c.razao, p.nped, p.nprevenda, p.data_ped, ' +
      ' p.horaabertura, p.minabertura, p.status_ped, p.ncupom,' +
      ' case when coalesce(p.num_nf, 0) > 0 then p.num_nf else coalesce(p.num_nfeext, 0) end num_nf,' +
      ' case when coalesce(ps.quant_serv_ped, 0 ) = 0 then ''N'' else ''S'' end tp, ps.nitem, ps.desc_serv_ped descr,' +
      ' ps.quant_serv_ped qtd, ps.valor_un_serv vlun, ps.valor_tot_serv vltot, ps.rateio_desc des, ps.rateio_acresc acre,' +
      ' ps.status, p.valor_total, p.paf_status_prevenda' +
      ' from pedvenda p' +
      ' inner join clientes c on c.cod_cliente = p.cod_cliente and c.cod_empresa = p.cod_empresa' +
      ' left join pedvenda_serv ps on p.nped = ps.nped and p.tipo = ps.tipo and p.cod_empresa = ps.cod_empresa' +
      ' where p.tipo = ''OS'' and p.cod_empresa = ' + codEmpresa + ' and p.nprevenda = ' + vNumContaCliente +
      ' order by 11,12';
    vQuery.Open;

    if vQuery.IsEmpty then
    begin
      Application.MessageBox('Conta de Cliente não encontrada', 'Atenção', 0 + 64);
      Exit;
    end;

    if vQuery.FieldByName('ncupom').AsInteger > 0 then
    begin
      Application.MessageBox('Conta de Cliente já teve seu cupom Fiscal emitido', 'Atenção', 0 + 64);
      Exit;
    end;

    if vQuery.FieldByName('num_nf').AsInteger > 0 then
    begin
      Application.MessageBox('Conta de Cliente já teve sua nota fiscal emitida', 'Atenção', 0 + 64);
      Exit;
    end;

    if Trim(vQuery.FieldByName('paf_status_prevenda').AsString) = 'CANCELADA' then
    begin
      Application.MessageBox('Conta de Cliente já foi cancelada', 'Atenção', 0 + 64);
      Exit;
    end;

    if Trim(vQuery.FieldByName('status_ped').AsString) = 'CANCELADO' then
    begin
      Application.MessageBox('Conta de Cliente já foi cancelada', 'Atenção', 0 + 64);
      Exit;
    end;

    vLista := TStringList.Create;
    vLista.Add('-------- Conferência de Conta de Cliente -------');
    vLista.Add('-');
    vLista.Add('AGUARDE A EMISSÃO DO CUPOM FISCAL');
    vLista.Add('-');

    vLista.Add(Copy('Cliente: ' + vQuery.FieldByName('cod_cliente').AsString + '-' + vQuery.FieldByName('razao').AsString, 1, 48));
      vLista.Add('Num: ' + StrZero(vQuery.FieldByName('nprevenda').AsInteger, vQtdeDigDAV) + ' Data/Hora: ' +
        FormatDateTime('dd/mm/yyyy', vQuery.FieldByName('data_ped').AsDateTime) + ' ' +
        StrZero(vQuery.FieldByName('horaabertura').AsInteger, 2 ) + ':' +
        StrZero(vQuery.FieldByName('minabertura').AsInteger, 2 ));

    vDesconto := 0;
    vAcrescimo := 0;
    vQuery.First;
    while not vQuery.Eof do
    begin
      if vQuery.FieldByName('tp').AsString <> 'N' then
      begin

        if Trim(vQuery.FieldByName('status').AsString) = 'CANCELADO' then
          vLista.Add( Space(Copy(Space(vQuery.FieldByName('nitem').AsString, 3),1,3) + Copy(vQuery.FieldByName('descr').AsString,1,35), 38) + ' cancelado')
        else
        begin
          vDesconto := vDesconto + vQuery.FieldByName('des').AsFloat;
          vAcrescimo := vAcrescimo + vQuery.FieldByName('acre').AsFloat;
          vLista.Add( Copy(Space(vQuery.FieldByName('nitem').AsString, 3),1,3) + Copy(vQuery.FieldByName('descr').AsString,1,45));
				end;
				vLista.Add( ' ' + Space(vQuery.FieldByName('tp').AsString, 2) +
					Space(FloatToStr(vQuery.FieldByName('qtd').AsFloat), 13) + ' X ' +
          Space(FloatToStr(vQuery.FieldByName('vlun').AsFloat), 13) + ' = ' +
          Space(Format('%0.2f',[vQuery.FieldByName('vltot').AsFloat]), 13));
      end;
      vQuery.Next;
    end;

    vLista.Add('-');
    if vDesconto > 0 then
      vLista.Add('Desconto : ' + Format('%0.2f', [vDesconto]));
    if vAcrescimo > 0 then
      vLista.Add('Acréscimo: ' + Format('%0.2f', [vAcrescimo]));
    vLista.Add('Total    : ' + Format('%0.2f', [vQuery.FieldByName('valor_total').AsFloat]));

    CImpressoraF.abrerelatorioGer;
    for I := 0 to vlista.Count - 1 do
      CImpressoraF.RelatorioGerencial2(
        CImpressoraF.TamDescricao(48, vLista[I]));
    CImpressoraF.FechaRelatorioGerencial;

    vNPed := vQuery.FieldByName('nped').AsInteger;

    try
      vCOO := CImpressoraF.numeroCOO;
      vCER := CImpressoraF.numeroCER;

      try
        StrToInt(Trim(vCOO));
        StrToInt(Trim(vCER));
      except
        exit;
      end;

      if not vQuery.Transaction.InTransaction then
        vQuery.Transaction.StartTransaction;

      vQuery.Close;
      vQuery.SQL.Text := 'update pedvenda set COO_CONTA_CLIENTE = ' + vCOO +
        ', CER_CONTA_CLIENTE = ' + vCER +
        ', NSERIEECF_CONTA_CLIENTE = ' + QuotedStr(vNumSerieEcf) +
        ' where nped = ' + IntToStr(vNPed) + ' and tipo = ''OS''' +
        ' and cod_empresa = ' + codEmpresa;
      vQuery.ExecSQL;

      if vQuery.Transaction.InTransaction then
        vQuery.Transaction.Commit;
    except
      Application.MessageBox('Erro ao gravar CER e COO do Relatório Gerencial na Conta do Cliente',
        'Atenção', 0 + 64);
    end;
  finally
    limpaMensagem;
    Screen.Cursor := crDefault;
  end;
end;

procedure TIni.verificarNovoHwF(pCopiarSemConfirmar: Boolean = False);
var
  vEndTerminalF: string;
begin

  try
    if vConfImp = nil then
      vConfImp := TConfImp.create;

    vEndTerminalF := '';
    if vEmp.vResponsavelCopiaHwF = 'R' then
    begin
      obCupom.buscas.Close;
      obCupom.buscas.SQL.Text := 'select ENDREDEHWF_FDB from TERMINALF where COD_TERMINAL = ' + vCodTerminal;
      obCupom.buscas.Open;
      vEndTerminalF := Trim(obCupom.buscas.FieldByName('ENDREDEHWF_FDB').AsString);
      vEndTerminalF := vEndTerminalF + '\HwF.fdb';
    end;

		if vVerificarHwfAutomatico <> 'N' then
			try
				vConfImp.verificaHwF(vEndTerminalF, True);
      finally
				vConfImp.getTodos;
      end;
  finally
  end;
end;

procedure TIni.arquivoLFD;
var
  nowStr: string;
  vNomeArq: string;
begin
  try
    MensagemFiscal('Aguarde. Inicando processo');
    obCliente.CommitaTransacao;
    obCliente.Refresh;
    MensagemFiscal('Aguarde. Inicando processo');
    obProd.Refresh;
    MensagemFiscal('Aguarde. Inicando processo');
    obServ.Refresh;
    if vSincronizacaoEmSegundoPlano <> 'S' then
      try
        abreStatusProcessamento('Sincronização', 'Aguarde. Sincronizando dados');
        vHwSinc._sincronizarDados;
      finally
				fechaStatusProcessamento;
      end;
  finally
    limpaMensagem;
  end;

  try
    Screen.Cursor := crHourGlass;

    Application.CreateForm(TfrmComandosPDV, frmComandosPDV);
    frmComandosPDV.PageControl1.ActivePage := frmComandosPDV.tsVendasPeriodo;
    frmComandosPDV.RadioGroup12.Caption := 'Arquivo LFD. Cotepe 05/2005';
    frmComandosPDV.Caption := 'Arquivo LFD. Cotepe 05/2005';
    frmComandosPDV.RadioGroup12.Items.Clear;
    frmComandosPDV.RadioGroup12.Items.Add('Arquivo LFD. Cotepe 05/2005');
    frmComandosPDV.RadioGroup12.ItemIndex := 0;
    frmComandosPDV.RadioGroup2.Enabled := false;
    frmComandosPDV.PageControl1.Tag := 10;
    frmComandosPDV.ShowModal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TIni.semArquivoAuxiliar( pMsg: string ):boolean;
begin
  Result := CImpressoraF.SemArquivoAux;
	if CImpressoraF.SemArquivoAux then
	begin
		Result := True;
		if pMsg = 'S' then
			Application.MessageBox(pchar('Arquivo auxiliar não encontrado.' + #13 +
				'PAF-ECF impossibilitado de efetuar vendas!' + #13 +
				'Corrija o problema e reinicie o sistema'), 'Informação', 0 + 64);
		Exit;
	end;
end;

end.

