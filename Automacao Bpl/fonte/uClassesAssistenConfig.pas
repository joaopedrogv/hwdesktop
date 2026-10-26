unit uClassesAssistenConfig;

interface

uses
  uDataSet_OOP, DBClient, DB, Forms, Controls, IBQuery, ComCtrls, StdCtrls, 
  Classes;

type
  RTerminal_Conf = record
    fiscalFDB, terminalFiscal, bancoHw, bancoHWF, bancoFiscal: string;
  end;

  RRetaguarda_Conf = record
    pathAutomacao, pathCxl, pathCaixa: string;
  end;

  RConfig_Conf = record
    clientePadrao, vendedorPadrao, pastaRelatorios, vtipoConexao, vSegundoPlano: string;
  end;

  RECF_Conf = record
    modeloImpressora, numSerie, numEquipamento, modeloDocFiscal, modelOBalanca, obsCupom,
			EnderecoHwf, impDavECF: string;
		abrirGaveta, verificarPapel, politicaPreco, tecladoPDV, vUsarTEF, supermercado, UsarCodBarra,
			COnferirEstoque, TresDigVlUnit, usarLeitor, MovOperador: string;
    arredondarTruncar: string;
    porta, contadorReinicio, portaLeitor, codTerminal, qtdeDigDAV, qtdeViasCPNF: integer;
    maxDescItem: Double;
    diaAberto, diaFechado: string;
    valorGrandeTotal: string;
    vListaTabPreco: TStringList;
  end;

  RFinalizadores_Conf = record
    contador: integer;
    codigo, tipo, tecla: array[1..99] of integer;
    descricao, verificarDeb, verificarCred, parcelar: array[1..99] of string;
  end;

  RTotalizadoresNaoF_Conf = record
    contador: integer;
    codigo: array[1..99] of integer;
    descricao: array[1..99] of string;
  end;

  RTerminais_Conf = record
    CNIEE, mfAdicional, dataSB, horaSB, descontoISSQN, codigoProprietario: string;
  end;

  RComandos_Conf = record
    vComando: array[1..10] of string;
    //    vCod1, vCod2, vCod3, vCod4, vCod5, vCod6, vCod7, vCod8, vCod9, vCod10:string;
  end;

  TECF_Assistente = class(TDataSet_OOP)
  private
    vDataDoDia: TDate;
    function setConfigSistemas: boolean;
    function setDadosConfImp: boolean;
    function setDadosFinalizadores: boolean;
    function setDadosTotalizadores: boolean;
    function setDadosTerminaisImpressoras: boolean;
    function setComandosTerminal: boolean;
    function setGrandeTotal: boolean;
    function removeItensRepetidos: boolean;
  public
    vImpCNIEE: TIBQuery;
    vTerminal: RTerminal_Conf;
    vRetaguarda: RRetaguarda_Conf;
    vConfig: RConfig_Conf;
    vECF: RECF_Conf;
    vFinalizador: RFinalizadores_Conf;
    vTotalizador: RTotalizadoresNaoF_Conf;
    vTerminais: RTerminais_Conf;
    vComandos: RComandos_Conf;
    vNumSerieRepetidos: array of string;
    vCodTerminalRepetidos: array of string;
    vLocalRepetidos: array of string;
    vApagarDadosRepetidos: array of string;
    vCodigoTerminal: integer;
    vEnderecoTerminal: string;
    constructor create;
    destructor Destroy; override;
    function getDadosCadastrado: boolean;
    function getDadosECF: boolean;
    function getDadosFinalizadores: boolean;
    function getDadosTotalizadores: boolean;
    function getDadosTerminais: boolean;
    function getDadosComandos: boolean;
    function getNumSerieRepetidos: boolean;
    function getGrandeTotal: Boolean;
    function concluirAssistente(progress: TProgressBar; lab: TLabel; pListBox:TListBox): boolean;
    function validaBancos:boolean;
  end;

implementation

uses uDtmAssistente, IBDatabase, uDtmAtivo, uDadosIni,
  SysUtils, IniFiles, UClassesFinalizadores, Windows;

{ TECF_Assistente }

function TECF_Assistente.concluirAssistente(progress: TProgressBar;
  lab: TLabel; pListBox:TListBox): boolean;
var
  vterminais: TTerminaisF;
begin
  try
    pListBox.Clear;
    pListBox.Items.Add('Assistente de Configuração do PAF-ECF');
    pListBox.Items.Add(' - Alterando arquivos de Configuração *.ini');
    if not setConfigSistemas then
      Exit;
    pListBox.Items.Add(' - Configurando dados para comunicação do Terminal com ECF');
    if not setDadosConfImp then
      exit;
    pListBox.Items.Add(' - Registrando Finalizadores do ECF no sistema');
    if not setDadosFinalizadores then
      exit;
    pListBox.Items.Add(' - Registrando Totalizadores do ECF no sistema');
    if not setDadosTotalizadores then
      exit;
    pListBox.Items.Add(' - Configurando parametros do Terminal');
    if not setDadosTerminaisImpressoras then
      exit;
    pListBox.Items.Add(' - Configurando dados para comunicação do Terminal com ECF');
    if not setComandosTerminal then
      exit;

    if not setGrandeTotal then
      exit;
    pListBox.Items.Add(' - Configurando dados para comunicação do Terminal com ECF');
    if not removeItensRepetidos then
      exit;
    if vDadosIni.conectaBanco(dtmAtivo.bancoFiscal, vTerminal.bancoFiscal, true) then
    begin
      pListBox.Items.Add(' - Sincronizando dados do Retaguarda com o Terminal');
      vDadosIni.vInibeMensPesqPros := 'S';
      vterminais := TTerminaisF.create;
      vterminais.vdtini := StrToDate('01/01/1900');
      vterminais.vdtfim := StrToDate('01/01/1900');

      vterminais.sincterminal(1, progress, lab, '');
      pListBox.Items.Add(' - Sincronizando dados do Terminal com o Retaguarda');
      vterminais.sincterminal(2, progress, lab, '');
    end;
    pListBox.Items.Add('Finalizado.');
    Application.MessageBox('O Assistente concluiu a configuração do terminal','Atenção', mb_ok + MB_ICONINFORMATION);
    Result := true;
  finally
    vDadosIni.vInibeMensPesqPros := 'N';
    dtmAssistente.bdF.Connected := false;
    dtmAssistente.bdHw.Connected := false;
  end;
end;

constructor TECF_Assistente.create;
begin
  if dtmAssistente = nil then
    dtmAssistente := TdtmAssistente.Create(dtmAssistente);
  dataSet := TClientDataSet(dtmAssistente.cdsHw);
  buscas := TIBQuery(dtmAssistente.qrBuscas);
  transacao := TIBtransaction(dtmAssistente.transHw);
  vImpCNIEE := TIBQuery(dtmAssistente.qrCNIEE);
  vCodigoTerminal := 0;
  vECF.vListaTabPreco := TStringList.Create;
  vECF.vListaTabPreco.Duplicates := dupIgnore;
end;

destructor TECF_Assistente.Destroy;
begin
  dtmAssistente.bdF.Connected:=false;
  dtmAssistente.bdHw.Connected:=false;
  inherited;
end;

function TECF_Assistente.getDadosCadastrado: boolean;
begin
  if vCodigoTerminal <> 0 then
    vTerminal.bancoFiscal := vEnderecoTerminal
  else
    vTerminal.bancoFiscal := vDadosIni.vBancoFiscal;
  vTerminal.fiscalFDB := 'S';
  vTerminal.terminalFiscal := vdadosini.vTerminalFiscal;
  vTerminal.bancoHw := vDadosIni.vBancoHW;
  vTerminal.bancoHWF := vDadosIni.vBancoHwF;
  vRetaguarda.pathAutomacao := 'C:\Arquivos de programas\Hw Sistemas\Automacao';
  vRetaguarda.pathCaixa := 'C:\Arquivos de programas\Hw Sistemas\CaixaGeral';
  vRetaguarda.pathCxl := 'C:\Arquivos de programas\Hw Sistemas\CaixaAuxiliar';
  vConfig.clientePadrao := vDadosIni.vCliente.vCodClientePadrao;
  vConfig.vendedorPadrao := vDadosIni.vCodVendedorPadrao;
  vConfig.pastaRelatorios := vDadosIni.vPastaRel;
  vConfig.vtipoConexao := vDadosIni.vTipoConexao;
  vConfig.vSegundoPlano := vDadosIni.vSincronizacaoEmSegundoPlano;
end;

function TECF_Assistente.getDadosComandos: boolean;
var
  I: Integer;
begin
  //  vDadosIni.conectaBanco(dtmAssistente.bdF,vTerminal.bancoFiscal,true);
  buscas.Close;
  buscas.Database := dtmAssistente.bdF;
  buscas.Transaction := dtmAssistente.transF;

  buscas.Close;
  buscas.SQL.Text := 'select * from comandosimp' +
    ' where cod_cniee = ' + QuotedStr(vImpCNIEE.FieldByName('identificacao').AsString);
  buscas.Open;
  for I := 1 to 10 do
    vComandos.vComando[i] := 'N';

  if not buscas.IsEmpty then
  begin
    while not buscas.Eof do
    begin
      vComandos.vComando[buscas.FieldByName('codfunfiscal').AsInteger] :=
        buscas.FieldByName('comando').AsString;
      buscas.Next;
    end;
  end;
end;

function TECF_Assistente.getDadosECF: boolean;
begin
  vDadosIni.conectaBanco(dtmAssistente.bdF, vTerminal.bancoFiscal, true);
  buscas.Close;
  buscas.Database := dtmAssistente.bdF;
  buscas.Transaction := dtmAssistente.transF;

  buscas.Close;
  buscas.SQL.Text := 'select * from confimp';
  buscas.Open;

  vECF.numSerie := vDadosIni.decodifica(buscas.FieldByName('NUM_SERIE_ECF').AsString);
  vECF.modeloImpressora := vDadosIni.decodifica(buscas.FieldByName('MODELO_IMPRESSORA').AsString);
  vECF.numEquipamento := vDadosIni.decodifica(buscas.FieldByName('NUM_EQUIP').AsString);
  vECF.obsCupom := vDadosIni.decodifica(buscas.FieldByName('OBSERVACAO_CUPOM').AsString);
  vECF.modelOBalanca := vDadosIni.decodifica(buscas.FieldByName('MODELO_BALANCA').AsString);
  vECF.modeloDocFiscal := vDadosIni.decodifica(buscas.FieldByName('MODELO_DOCF').AsString);
  vECF.impDavECF := vDadosIni.decodifica(buscas.FieldByName('IMPRIMIR_DAV_ECF').AsString);
  vECF.arredondarTruncar := vDadosIni.decodifica(buscas.FieldByName('ARREDONDAR_TRUNCAR').AsString);
  vECF.tecladoPDV := vDadosIni.decodifica(buscas.FieldByName('TECLADO_PDV').AsString);
  vECF.vUsarTEF := vDadosIni.decodifica(buscas.FieldByName('USAR_TEF').AsString);
  vECF.supermercado := vDadosIni.decodifica(buscas.FieldByName('LEITURA_SUP').AsString);
  vECF.TresDigVlUnit := vDadosIni.decodifica(buscas.FieldByName('VALOR_UNIT_3DIG').AsString);
  vECF.MovOperador := vDadosIni.decodifica(buscas.FieldByName('USAR_MOV_OP').AsString);
  vECF.abrirGaveta := vDadosIni.decodifica(buscas.FieldByName('ABRIR_GAVETA').AsString);
  vECF.UsarCodBarra := vDadosIni.decodifica(buscas.FieldByName('USAR_CODBARRA').AsString);
  vECF.COnferirEstoque := vDadosIni.decodifica(buscas.FieldByName('CONFERIR_ESTOQUE').AsString);
  vECF.usarLeitor := vDadosIni.decodifica(buscas.FieldByName('LEITOR_SERIAL').AsString);
  vECF.verificarPapel := vDadosIni.decodifica(buscas.FieldByName('VERIFICAR_PAPEL').AsString);
  vECF.politicaPreco := vDadosIni.decodifica(buscas.FieldByName('USPOLPREC').AsString);
  vECF.porta := buscas.FieldByName('PORTA_IMPRESSORA').AsInteger;
  vECF.portaLeitor := buscas.FieldByName('PORTA_LEITOR').AsInteger;
  vECF.qtdeDigDAV := buscas.FieldByName('QTDE_DIG_DAV').AsInteger;
  vECF.qtdeViasCPNF := buscas.FieldByName('QT_VIAS_NAOFISCAIS').AsInteger;
  vECF.EnderecoHwf := vDadosIni.decodifica(buscas.FieldByName('ENDERECO_HWF').AsString);
  vECF.contadorReinicio := buscas.FieldByName('CONTADOR_REINICIO').AsInteger;
  if vCodigoTerminal = 0 then
    vECF.codTerminal := buscas.FieldByName('COD_TERMINAL').AsInteger
  else
    vECF.codTerminal := vCodigoTerminal;
  vECF.maxDescItem := buscas.FieldByName('MAX_DESC_ITEM').AsFloat;
  vECF.diaAberto := buscas.FieldByName('DIAABERTO').AsString;
  vECF.diaFechado := buscas.FieldByName('DIAFECHADO').AsString;
  vECF.vListaTabPreco.Text := buscas.FieldByName('TAB_PRECO_AD').AsString;

  buscas.Close;

end;

function TECF_Assistente.getDadosFinalizadores: boolean;
var
  i: Integer;
begin
  //  vDadosIni.conectaBanco(dtmAssistente.bdF,vTerminal.bancoFiscal,true);
  buscas.Close;
  buscas.Database := dtmAssistente.bdF;
  buscas.Transaction := dtmAssistente.transF;

  buscas.Close;
  buscas.SQL.Text := 'select * from finalizadores f' +
    ' where f.cod_terminal = ' + inttostr(vECF.codTerminal) +
    ' and f.nserieecf = ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
    ' and f.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by f.cod_finalizador';
  buscas.Open;
  for I := 1 to 99 do
  begin
    vFinalizador.codigo[i] := 0;
    vFinalizador.descricao[i] := '';
    vFinalizador.tecla[i] := 0;
    vFinalizador.tipo[i] := 0;
    vFinalizador.verificarDeb[i] := '';
    vFinalizador.verificarCred[i] := '';
    vFinalizador.parcelar[i] := '';
  end;

  i := 1;
  buscas.First;
  while not buscas.Eof do
  begin
    if i = 99 then
      Break;
    vFinalizador.codigo[i] := buscas.FieldByName('cod_finalizador').AsInteger;
    vFinalizador.descricao[i] := buscas.FieldByName('descricao').AsString;
    vFinalizador.tecla[i] := buscas.FieldByName('tecla_pdv').AsInteger;
    vFinalizador.tipo[i] := buscas.FieldByName('tipo_finalizador').AsInteger;
    vFinalizador.verificarDeb[i] := Trim(buscas.FieldByName('verificar_debito').AsString);
    vFinalizador.verificarCred[i] := Trim(buscas.FieldByName('verificar_credito').AsString);
    vFinalizador.parcelar[i] := buscas.FieldByName('prazo').AsString;
    inc(i);
    buscas.Next;
  end;
  buscas.Close;
end;

function TECF_Assistente.getDadosTerminais: boolean;
begin
  vDadosIni.conectaBanco(dtmAssistente.bdHw, vTerminal.bancoHw, true);

  vImpCNIEE.Close;
  vImpCNIEE.Database := dtmAssistente.bdHw;
  vImpCNIEE.Transaction := dtmAssistente.transHw;

  vImpCNIEE.Close;
  vImpCNIEE.SQL.Text := 'select * from IMPRESSORAS_CNIEE';
  vImpCNIEE.Open;

  buscas.Close;
  buscas.Database := dtmAssistente.bdHw;
  buscas.Transaction := dtmAssistente.transHw;

  buscas.Close;
  buscas.SQL.Text := 'select * from terminal_impressoras ti' +
    ' where ti.cod_terminal = ' + inttostr(vECF.codTerminal) +
    ' and ti.num_serie_ecf = ' + QuotedStr({vDadosIni.codifica}(vECF.numSerie)) +
    ' and ti.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ti.atual = ''S''';
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    vImpCNIEE.Locate('IDENTIFICACAO', buscas.FieldByName('ident_cniee').AsString, []);
    vTerminais.CNIEE := buscas.FieldByName('ident_cniee').AsString;
    vTerminais.mfAdicional := buscas.FieldByName('mf_adicional').AsString;
    vTerminais.dataSB := buscas.FieldByName('data_sb').AsString;
    vTerminais.horaSB := buscas.FieldByName('hora_sb').AsString;
    vTerminais.descontoISSQN := buscas.FieldByName('issqndesc').AsString;
    vTerminais.codigoProprietario := buscas.FieldByName('cod_proprietario').AsString;
  end
  else
  begin
    vImpCNIEE.First;
    vTerminais.CNIEE := vImpCNIEE.FieldByName('identificacao').AsString;
    vTerminais.mfAdicional := '';
    vTerminais.dataSB := '';
    vTerminais.horaSB := '';
    vTerminais.descontoISSQN := 'N';
    vTerminais.codigoProprietario := '';

  end;
  buscas.Close;
end;

function TECF_Assistente.getDadosTotalizadores: boolean;
var
  i: Integer;
begin
  buscas.Close;
  buscas.Database := dtmAssistente.bdF;
  buscas.Transaction := dtmAssistente.transF;

  buscas.Close;
  buscas.SQL.Text := 'select * from totalizador_naof f' +
    ' where f.cod_terminal = ' + inttostr(vECF.codTerminal) +
    ' and f.nserieecf = ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
    ' and f.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by f.sequencia';
  buscas.Open;
  for I := 1 to 99 do
  begin
    vTotalizador.codigo[i] := 0;
    vTotalizador.descricao[i] := '';
  end;

  i := 1;
  buscas.First;
  while not buscas.Eof do
  begin
    if i = 99 then
      Break;
    vTotalizador.codigo[i] := buscas.FieldByName('sequencia').AsInteger;
    vTotalizador.descricao[i] := buscas.FieldByName('descricao').AsString;
    inc(i);
    buscas.Next;
  end;
  buscas.Close;
end;

function TECF_Assistente.getGrandeTotal: Boolean;
var
  arquivo: tiNIfILE;
  ArqIni: string;
  valorArmazenado, valorAInf: Currency;
  temp: string;
begin
  try
    try
      ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
      arquivo := TIniFile.Create(ArqIni);
      Temp := arquivo.ReadString( IntToStr(vCodigoTerminal), 'G', '');
    finally
      arquivo.free;
    end;

    temp := trim(vDadosIni.decodifica(Temp));
    temp := vDadosIni.StrZero(temp, 20);
    temp := Copy(temp, 1, 18) + ',' + Copy(temp, 19, 2);
    vECF.valorGrandeTotal := (temp);
    Result := true;
  except
    Exit;
  end;
end;

function TECF_Assistente.getNumSerieRepetidos: boolean;
var
  tam: Integer;
begin
  vDadosIni.conectaBanco(dtmAssistente.bdF, vTerminal.bancoFiscal,true);
  buscas.Close;
  buscas.Database := dtmAssistente.bdF;
  buscas.Transaction := dtmAssistente.transF;

  //CONFIMP
  buscas.Close;
  buscas.SQL.Text := 'select NUM_SERIE_ECF,cod_terminal from confimp group by 1,2';
  buscas.Open;
  SetLength(vNumSerieRepetidos, 0);
  SetLength(vCodTerminalRepetidos, 0);
  SetLength(vLocalRepetidos, 0);

  while not buscas.eof do
  begin
    if (Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString))) <>
      vECF.numSerie) or (buscas.FieldByName('cod_terminal').AsInteger <>
      vECF.codTerminal) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString)));
      vLocalRepetidos[tam] := '{Terminal} [CONFIMP]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  //TERMINAL_IMPRESSORAS
  buscas.Close;
  buscas.SQL.Text := 'select num_serie_ecf,cod_terminal from terminal_impressoras ti' +
    ' where (ti.cod_terminal <> ' + inttostr(vECF.codTerminal) +
    ' or ti.num_serie_ecf <> ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
    ') and ti.cod_empresa = ' + vDadosIni.codEmpresa +
    ' group by 1,2';
  buscas.Open;

  while not buscas.eof do
  begin
    if (Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString))) <>
      vECF.numSerie) or (buscas.FieldByName('cod_terminal').AsInteger <>
      vECF.codTerminal) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString)));
      vLocalRepetidos[tam] := '{Terminal} [TERMINAL_IMPRESSORAS]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  //ALIQ
  buscas.Close;
  buscas.SQL.Text := 'select NSERIEECF,cod_terminal from ALIQ ti' +
    ' where (ti.cod_terminal <> ' + inttostr(vECF.codTerminal) +
    ' or ti.NSERIEECF <> ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
    ') and ti.cod_empresa = ' + vDadosIni.codEmpresa +
    ' group by 1,2';
  buscas.Open;
  while not buscas.eof do
  begin
    if (Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NSERIEECF').AsString))) <>
      vECF.numSerie) or (buscas.FieldByName('cod_terminal').AsInteger <>
      vECF.codTerminal) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NSERIEECF').AsString)));
      vLocalRepetidos[tam] := '{Terminal} [ALIQ]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  //FINALIZADORES
  buscas.Close;
  buscas.SQL.Text := 'select NSERIEECF,cod_terminal from FINALIZADORES ti' +
    ' where (ti.cod_terminal <> ' + inttostr(vECF.codTerminal) +
    ' or ti.NSERIEECF <> ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
    ') and ti.cod_empresa = ' + vDadosIni.codEmpresa +
    ' group by 1,2';
  buscas.Open;
  while not buscas.eof do
  begin
    if (Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NSERIEECF').AsString))) <>
      vECF.numSerie) or (buscas.FieldByName('cod_terminal').AsInteger <>
      vECF.codTerminal) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NSERIEECF').AsString)));
      vLocalRepetidos[tam] := '{Terminal} [FINALIZADORES]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  //TOTALIZADOR_NAOF
  buscas.Close;
  buscas.SQL.Text := 'select NSERIEECF,cod_terminal from TOTALIZADOR_NAOF ti' +
    ' where (ti.cod_terminal <> ' + inttostr(vECF.codTerminal) +
    ' or ti.NSERIEECF <> ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
    ') and ti.cod_empresa = ' + vDadosIni.codEmpresa +
    ' group by 1,2';
  buscas.Open;
  while not buscas.eof do
  begin
    if (Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NSERIEECF').AsString))) <>
      vECF.numSerie) or (buscas.FieldByName('cod_terminal').AsInteger <>
      vECF.codTerminal) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(vDadosIni.decodifica(Trim(buscas.FieldByName('NSERIEECF').AsString)));
      vLocalRepetidos[tam] := '{Terminal} [TOTALIZADOR_NAOF]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  //TERMINALF
  buscas.Close;
  buscas.SQL.Text := 'select * from TERMINALF ti' +
    ' where ti.cod_terminal <> ' + inttostr(vECF.codTerminal) +
    ' and ti.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  while not buscas.eof do
  begin
    tam := high(vNumSerieRepetidos) + 1;
    SetLength(vNumSerieRepetidos, tam + 1);
    SetLength(vCodTerminalRepetidos, tam + 1);
    SetLength(vLocalRepetidos, tam + 1);
    SetLength(vApagarDadosRepetidos, tam + 1);
    vNumSerieRepetidos[tam] :=
      Trim(buscas.FieldByName('nome_terminal').AsString);
    vLocalRepetidos[tam] := '{Terminal} [TERMINALF]';
    vCodTerminalRepetidos[tam] :=
      buscas.FieldByName('cod_terminal').AsString;
    buscas.Next;
  end;

  //RETAGUARDA
  vDadosIni.conectaBanco(dtmAssistente.bdHw,vTerminal.bancoHW,true);
  if dtmAssistente.transHw.InTransaction then
    dtmAssistente.transHw.Rollback;
  buscas.Close;
  buscas.Database := dtmAssistente.bdHw;
  buscas.Transaction := dtmAssistente.transHw;

  //CONFIMP
  buscas.Close;
  buscas.SQL.Text := 'select NUM_SERIE_ECF,cod_terminal from confimp' +
    ' where cod_terminal = ' + IntToStr(vECF.codTerminal) +
    ' group by 1,2';
  buscas.Open;

  while not buscas.eof do
  begin
    if (Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString)) <>
      (vECF.numSerie) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString);
      vLocalRepetidos[tam] := '{Retaguarda} [CONFIMP]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  //TERMINAL_IMPRESSORAS
  buscas.Close;
  buscas.SQL.Text := 'select num_serie_ecf,cod_terminal from terminal_impressoras ti' +
    ' where ti.cod_terminal = ' + inttostr(vECF.codTerminal) +
    ' and ti.num_serie_ecf <> ' + QuotedStr(vECF.numSerie) +
    ' and ti.cod_empresa = ' + vDadosIni.codEmpresa +
    ' group by 1,2';
  buscas.Open;

  while not buscas.eof do
  begin
    if (Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString)) <>
      (vECF.numSerie) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString);
      vLocalRepetidos[tam] := '{Retaguarda} [TERMINAL_IMPRESSORAS]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  //ALIQ
  buscas.Close;
  buscas.SQL.Text := 'select NSERIEECF,cod_terminal from ALIQ ti' +
    ' where ti.cod_terminal = ' + inttostr(vECF.codTerminal) +
    ' and ti.NSERIEECF <> ' + QuotedStr(vECF.numSerie) +
    ' and ti.cod_empresa = ' + vDadosIni.codEmpresa +
    ' group by 1,2';
  buscas.Open;
  while not buscas.eof do
  begin
    if (Trim(buscas.FieldByName('NSERIEECF').AsString)) <>
      (vECF.numSerie) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(buscas.FieldByName('NSERIEECF').AsString);
      vLocalRepetidos[tam] := '{Retaguarda} [ALIQ]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  //FINALIZADORES
  buscas.Close;
  buscas.SQL.Text := 'select NSERIEECF,cod_terminal from FINALIZADORES ti' +
    ' where ti.cod_terminal = ' + inttostr(vECF.codTerminal) +
    ' and ti.NSERIEECF <> ' + QuotedStr(vECF.numSerie) +
    ' and ti.cod_empresa = ' + vDadosIni.codEmpresa +
    ' group by 1,2';
  buscas.Open;
  while not buscas.eof do
  begin
    if (Trim(buscas.FieldByName('NSERIEECF').AsString)) <>
      (vECF.numSerie) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(buscas.FieldByName('NSERIEECF').AsString);
      vLocalRepetidos[tam] := '{Retaguarda} [FINALIZADORES]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  //TOTALIZADOR_NAOF
  buscas.Close;
  buscas.SQL.Text := 'select NSERIEECF,cod_terminal from TOTALIZADOR_NAOF ti' +
    ' where ti.cod_terminal = ' + inttostr(vECF.codTerminal) +
    ' and ti.NSERIEECF <> ' + QuotedStr(vECF.numSerie) +
    ' and ti.cod_empresa = ' + vDadosIni.codEmpresa +
    ' group by 1,2';
  buscas.Open;
  while not buscas.eof do
  begin
    if (Trim(buscas.FieldByName('NSERIEECF').AsString)) <>
      (vECF.numSerie) then
    begin
      tam := high(vNumSerieRepetidos) + 1;
      SetLength(vNumSerieRepetidos, tam + 1);
      SetLength(vCodTerminalRepetidos, tam + 1);
      SetLength(vLocalRepetidos, tam + 1);
      SetLength(vApagarDadosRepetidos, tam + 1);
      vNumSerieRepetidos[tam] :=
        Trim(buscas.FieldByName('NSERIEECF').AsString);
      vLocalRepetidos[tam] := '{Retaguarda} [TOTALIZADOR_NAOF]';
      vCodTerminalRepetidos[tam] :=
        buscas.FieldByName('cod_terminal').AsString;
    end;
    buscas.Next;
  end;

  buscas.Close;
  buscas.Database := dtmAssistente.bdF;
  buscas.Transaction := dtmAssistente.transF;
end;

function TECF_Assistente.removeItensRepetidos: boolean;
var
  I: Integer;
  vSql, vSqlWhere, vSqlNSerie: string;
  j: Integer;
begin
  Result := true;
  for I := 0 to High(vNumSerieRepetidos) do
  begin
    if vApagarDadosRepetidos[i] = 'S' then
    begin
      if pos('[TERMINALF]', vLocalRepetidos[I]) > 0 then
        vSqlNSerie := ''
      else if (pos('[CONFIMP]', vLocalRepetidos[I]) > 0) or (pos('[TERMINAL_IMPRESSORAS]',
        vLocalRepetidos[I]) > 0) then
        vSqlNSerie := 'NUM_SERIE_ECF'
      else
        vSqlNSerie := 'NSERIEECF';

      if pos('{Terminal}', vLocalRepetidos[I]) > 0 then
      begin
        vDadosIni.conectaBanco(dtmAssistente.bdF, vTerminal.bancoFiscal, true);
        buscas.Close;
        buscas.Database := dtmAssistente.bdF;
        buscas.Transaction := dtmAssistente.transF;
        vSqlWhere := ' where (cod_terminal <> ' + IntToStr(vECF.codTerminal) +
          ' or ' + vSqlNSerie + ' <> ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
          ') and cod_empresa = ' + vDadosIni.codEmpresa;
      end
      else
      begin
        vDadosIni.conectaBanco(dtmAssistente.bdHw, vTerminal.bancoHw, true);
        buscas.Close;
        buscas.Database := dtmAssistente.bdHw;
        buscas.Transaction := dtmAssistente.transHw;
        vSqlWhere := ' where cod_terminal = ' + IntToStr(vECF.codTerminal) +
          ' and ' + vSqlNSerie + ' <> ' + QuotedStr(vECF.numSerie) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
      end;

      //    for j := Pos('[', vLocalRepetidos[I]) + 1 to Pos(']', vLocalRepetidos[I]) - 1 do

      vSql := 'delete from ' + copy(vLocalRepetidos[I], Pos('[', vLocalRepetidos[I]) + 1,
        Pos(']', vLocalRepetidos[I]) - Pos('[', vLocalRepetidos[I]) - 1);
      if Pos('[TERMINALF]', vLocalRepetidos[I]) > 0 then
        vSql := vSql + ' where cod_terminal <> ' + IntToStr(vECF.codTerminal)
      else
        vSql := vSql + vSqlWhere;
      buscas.SQL.Text := vSql;

      buscas.ExecSQL;
    end;
  end;
end;

function TECF_Assistente.setComandosTerminal: boolean;
var
  I: Integer;
begin
  Result := true;
  dataSet.Close;
  vDadosIni.conectaBanco(dtmAssistente.bdF, vTerminal.bancoFiscal, true);

  dataSet.Close;
  dataSet := TClientDataSet(dtmAssistente.cdsF);
  transacao := TIBtransaction(dtmAssistente.transF);

  if dtmAssistente.transF.InTransaction then
    dtmAssistente.transF.Rollback;
  if not dtmAssistente.transF.InTransaction then
    dtmAssistente.transF.StartTransaction;
  for I := 1 to 10 do
  begin
    montaSelect('select * from comandosimp' +
      ' where cod_cniee = ' + quotedstr(vTerminais.CNIEE) +
      ' and codfunfiscal = ' + IntToStr(I));
    while not dataSet.IsEmpty do
      dataSet.Delete;

    if dataSet.IsEmpty then
    begin
      dataSet.Insert;
      dataSet.FieldByName('cod_cniee').AsString := vTerminais.CNIEE;
      dataSet.FieldByName('codfunfiscal').AsInteger := I;
    end
    else
      dataSet.Edit;
    dataSet.FieldByName('comando').AsString := vComandos.vComando[i];
    dataSet.Post;
    if Apply then
      CommitaTransacao
    else
      RollBackTransacao;
  end;
end;

function TECF_Assistente.setConfigSistemas: boolean;
var
  ArqIni: string;
  ArqConfig: TIniFile;
begin
  try
    Result := true;
    ArqIni := StringReplace(
      vRetaguarda.pathAutomacao + '\Config.ini', '\\', '\', [rfReplaceAll, rfIgnoreCase]);
    if FileExists(ArqIni) then
    begin
      ArqConfig := TIniFile.Create(ArqIni);
      try
        ArqConfig.WriteString('Automacao', 'FiscalFDB', 'S');
        ArqConfig.WriteString('Automacao', 'TerminalFiscal', vTerminal.terminalFiscal);
      finally
        ArqConfig.Free;
      end;
    end;

    ArqIni := StringReplace(
      vRetaguarda.pathCxl + '\Config.ini', '\\', '\', [rfReplaceAll, rfIgnoreCase]);
    if FileExists(ArqIni) then
    begin
      ArqConfig := TIniFile.Create(ArqIni);
      try
        ArqConfig.WriteString('Automacao', 'FiscalFDB', 'S');
        ArqConfig.WriteString('Automacao', 'TerminalFiscal', vTerminal.terminalFiscal);
      finally
        ArqConfig.Free;
      end;
    end;

    ArqIni := StringReplace(
      vRetaguarda.pathCaixa + '\Config.ini', '\\', '\', [rfReplaceAll, rfIgnoreCase]);
    if FileExists(ArqIni) then
    begin
      ArqConfig := TIniFile.Create(ArqIni);
      try
        ArqConfig.WriteString('Automacao', 'FiscalFDB', 'S');
        ArqConfig.WriteString('Automacao', 'TerminalFiscal', vTerminal.terminalFiscal);
      finally
        ArqConfig.Free;
      end;
    end;

    ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
    if not FileExists(ArqIni) then
      ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
    if FileExists(ArqIni) then
    begin
      ArqConfig := TIniFile.Create(ArqIni);
      try
        ArqConfig.WriteString('Banco', 'Fiscal', vTerminal.bancoFiscal);
//        if vTerminal.terminalFiscal = 'S' then
//        begin
          ArqConfig.WriteString('Banco', 'HW', vTerminal.bancoHw);
          ArqConfig.WriteString('Banco', 'HWF', vTerminal.bancoHWF);
//          ArqConfig.WriteString('Sistema', 'PastaRel', vConfig.pastaRelatorios);
//        end;
        //ArqConfig.WriteString('Sistema', 'ClientePadrao', vConfig.clientePadrao);//agora no banco
        ArqConfig.WriteString('Sistema', 'VendedorPadrao', vConfig.vendedorPadrao);
        ArqConfig.WriteString('Fiscal', 'TipoConexao', vConfig.vtipoConexao);
        ArqConfig.WriteString('Fiscal', 'SincronizacaoEmSegundoPlano', vConfig.vSegundoPlano);
      finally
        ArqConfig.Free;
        vDadosIni.LerConfigini;
      end;
    end;
  except
    Result := false;
  end;

end;

function TECF_Assistente.setDadosConfImp: boolean;
begin
  Result := true;
  vDadosIni.conectaBanco(dtmAssistente.bdF, vTerminal.bancoFiscal, true);
  buscas.Close;
  buscas.Database := dtmAssistente.bdF;
  buscas.Transaction := dtmAssistente.transF;

  if dtmAssistente.transF.InTransaction then
    dtmAssistente.transF.Rollback;
  if not dtmAssistente.transF.InTransaction then
    dtmAssistente.transF.StartTransaction;
  buscas.Close;
  buscas.SQL.Text := 'delete from confimp';
  buscas.ExecSQL;

  buscas.Close;
  buscas.SQL.Text :=
    'INSERT INTO CONFIMP (NUM_SERIE_ECF, MODELO_IMPRESSORA, PORTA_IMPRESSORA, NUM_EQUIP, COD_TERMINAL, QTDE_DIG_DAV, PORTA_LEITOR, QT_VIAS_NAOFISCAIS, OBSERVACAO_CUPOM, MODELO_BALANCA, CONTADOR_REINICIO, ALIQ_ISS, MAX_DESC_ITEM, MODELO_DOCF,' +
		' ARREDONDAR_TRUNCAR, TECLADO_PDV, USAR_TEF, LEITURA_SUP, VALOR_UNIT_3DIG, USAR_MOV_OP, ABRIR_GAVETA, USAR_CODBARRA, CONFERIR_ESTOQUE, LEITOR_SERIAL, VERIFICAR_PAPEL, COD_EMPRESA, DIAABERTO, DIAFECHADO, USPOLPREC,' +
		' VALOR_GT, ENDERECO_HWF, IMPRIMIR_DAV_ECF, TAB_PRECO_AD)' +
		' VALUES (:NUM_SERIE_ECF, :MODELO_IMPRESSORA, :PORTA_IMPRESSORA, :NUM_EQUIP, :COD_TERMINAL, :QTDE_DIG_DAV, :PORTA_LEITOR, :QT_VIAS_NAOFISCAIS, :OBSERVACAO_CUPOM, :MODELO_BALANCA, :CONTADOR_REINICIO, :ALIQ_ISS, :MAX_DESC_ITEM, :MODELO_DOCF,' +
		' :ARREDONDAR_TRUNCAR, :TECLADO_PDV, :USAR_TEF, :LEITURA_SUP, :VALOR_UNIT_3DIG, :USAR_MOV_OP, :ABRIR_GAVETA, :USAR_CODBARRA, :CONFERIR_ESTOQUE, :LEITOR_SERIAL, :VERIFICAR_PAPEL, :COD_EMPRESA, :DIAABERTO, :DIAFECHADO, :USPOLPREC,' +
    ' :VALOR_GT, :ENDERECO_HWF, :IMPRIMIR_DAV_ECF, :TAB_PRECO_AD)';
  buscas.ParamByName('NUM_SERIE_ECF').AsString := vDadosIni.codifica(vECF.numSerie);
  buscas.ParamByName('MODELO_IMPRESSORA').AsString := vDadosIni.codifica(vECF.modeloImpressora);
  buscas.ParamByName('PORTA_IMPRESSORA').AsInteger := vECF.porta;
  buscas.ParamByName('NUM_EQUIP').AsString := vDadosIni.codifica(vECF.numEquipamento);
  buscas.ParamByName('COD_TERMINAL').AsInteger := vECF.codTerminal;
  buscas.ParamByName('QTDE_DIG_DAV').AsInteger := vECF.qtdeDigDAV;
  buscas.ParamByName('PORTA_LEITOR').AsInteger := vECF.portaLeitor;
  buscas.ParamByName('QT_VIAS_NAOFISCAIS').AsInteger := vECF.qtdeViasCPNF;
  buscas.ParamByName('OBSERVACAO_CUPOM').AsString := vDadosIni.codifica(vECF.obsCupom);
  buscas.ParamByName('MODELO_BALANCA').AsString := vDadosIni.codifica(vECF.modelOBalanca);
  buscas.ParamByName('CONTADOR_REINICIO').AsInteger := vECF.contadorReinicio;
  buscas.ParamByName('ALIQ_ISS').AsFloat := 0;
  buscas.ParamByName('MAX_DESC_ITEM').AsFloat := vECF.maxDescItem;
	buscas.ParamByName('MODELO_DOCF').AsString := vDadosIni.codifica(vECF.modeloDocFiscal);
	buscas.ParamByName('IMPRIMIR_DAV_ECF').AsString := vDadosIni.codifica(vECF.impDavECF);
  buscas.ParamByName('ARREDONDAR_TRUNCAR').AsString := vDadosIni.codifica(vECF.arredondarTruncar);
  buscas.ParamByName('TECLADO_PDV').AsString := vDadosIni.codifica(vECF.tecladoPDV);
  buscas.ParamByName('USAR_TEF').AsString := vDadosIni.codifica(vECF.vUsarTEF);
  buscas.ParamByName('LEITURA_SUP').AsString := vDadosIni.codifica(vECF.supermercado);
  buscas.ParamByName('VALOR_UNIT_3DIG').AsString := vDadosIni.codifica(vECF.TresDigVlUnit);
	buscas.ParamByName('USAR_MOV_OP').AsString := vDadosIni.codifica(vECF.MovOperador);
  buscas.ParamByName('ABRIR_GAVETA').AsString := vDadosIni.codifica(vECF.abrirGaveta);
  buscas.ParamByName('USAR_CODBARRA').AsString := vDadosIni.codifica(vECF.UsarCodBarra);
  buscas.ParamByName('CONFERIR_ESTOQUE').AsString := vDadosIni.codifica(vECF.COnferirEstoque);
  buscas.ParamByName('LEITOR_SERIAL').AsString := vDadosIni.codifica(vECF.usarLeitor);
  buscas.ParamByName('VERIFICAR_PAPEL').AsString := vDadosIni.codifica(vECF.verificarPapel);
  buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
  buscas.ParamByName('DIAABERTO').AsString := vECF.diaAberto;
  buscas.ParamByName('DIAFECHADO').AsString := vECF.diaFechado;
  buscas.ParamByName('USPOLPREC').AsString := vDadosIni.codifica(vECF.politicaPreco);
  buscas.ParamByName('VALOR_GT').AsString := '';
  buscas.ParamByName('ENDERECO_HWF').AsString := vDadosIni.codifica(vECF.EnderecoHwf);
  buscas.ParamByName('TAB_PRECO_AD').AsString := Copy(vECF.vListaTabPreco.Text, 1, 32);
  buscas.Prepare;
  buscas.ExecSQL;
  if dtmAssistente.transF.InTransaction then
    dtmAssistente.transF.Commit;
end;

function TECF_Assistente.setDadosFinalizadores: boolean;
var
  I: Integer;
begin
  Result := true;
  dataSet.Close;
  dataSet := TClientDataSet(dtmAssistente.cdsF);
  transacao := TIBtransaction(dtmAssistente.transF);

  if dtmAssistente.transF.InTransaction then
    dtmAssistente.transF.Rollback;
  //  if not dtmAssistente.transF.InTransaction then
  //    dtmAssistente.transF.StartTransaction;
  montaSelect('select * from finalizadores f' +
    ' where f.cod_terminal = ' + IntToStr(vECF.codTerminal) +
    ' and f.nserieecf = ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
    ' and f.cod_empresa = ' + vDadosIni.codEmpresa); // +
  //  ' and f.cod_finalizador = ' + IntToStr(vFinalizador.codigo[i]));
  while not dataSet.IsEmpty do
    dataSet.Delete;

  for I := 1 to 99 do
  begin
    if (vFinalizador.codigo[i] <> 0) and (Trim(vFinalizador.descricao[i]) <> '') then
    begin
      //      montaSelect('select * from finalizadores f' +
      //        ' where f.cod_terminal = ' + IntToStr(vECF.codTerminal) +
      //        ' and f.nserieecf = ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
      //        ' and f.cod_empresa = ' + vDadosIni.codEmpresa +
      //        ' and f.cod_finalizador = ' + IntToStr(vFinalizador.codigo[i]));
      //      if dataSet.IsEmpty then
      //      begin
      dataSet.Insert;
      dataSet.FieldByName('cod_finalizador').AsInteger := vFinalizador.codigo[i];
      dataSet.FieldByName('cod_terminal').AsInteger := vECF.codTerminal;
      dataSet.FieldByName('nserieecf').AsString := vDadosIni.codifica(vECF.numSerie);
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      //      end
      //      else
      //        dataSet.Edit;
      dataSet.FieldByName('DESCRICAO').AsString := vFinalizador.descricao[i];
      dataSet.FieldByName('VERIFICAR_DEBITO').AsString := vFinalizador.verificarDeb[i];
      dataSet.FieldByName('VERIFICAR_CREDITO').AsString := vFinalizador.verificarCred[i];

      if Pos('PRAZO', UpperCase(Trim(dataSet.FieldByName('DESCRICAO').AsString))) > 0 then
        dataSet.FieldByName('PRAZO').AsString := 'N'
      else
        dataSet.FieldByName('PRAZO').AsString := vFinalizador.parcelar[i];
        
      dataSet.FieldByName('TIPO_FINALIZADOR').AsInteger := vFinalizador.tipo[i];
      dataSet.FieldByName('TECLA_PDV').AsInteger := vFinalizador.tecla[i];
      dataSet.Post;
      if Apply then
        CommitaTransacao
      else
        RollBackTransacao;
    end;
  end;
end;

function TECF_Assistente.setDadosTerminaisImpressoras: boolean;
begin
  Result := true;
  vDadosIni.conectaBanco(dtmAssistente.bdHw, vTerminal.bancoHw, true);
  buscas.Close;
  buscas.Database := dtmAssistente.bdHw;
  buscas.Transaction := dtmAssistente.transHw;
  vDataDoDia := vDadosIni.getDataBanco(buscas);

  dataSet.Close;
  dataSet := TClientDataSet(dtmAssistente.cdsHw);
  transacao := TIBtransaction(dtmAssistente.transHw);

  if dtmAssistente.transF.InTransaction then
    dtmAssistente.transF.Rollback;
  if not dtmAssistente.transF.InTransaction then
    dtmAssistente.transF.StartTransaction;
  ExecutaComandosSqlExec('update terminal_impressoras set atual = ''N'' where cod_terminal = ' +
    IntToStr(vECF.codTerminal));
  montaSelect('select * from terminal_impressoras ti' +
    ' where ti.cod_terminal = ' + inttostr(vECF.codTerminal) +
    ' and ti.num_serie_ecf = ' + QuotedStr({vDadosIni.codifica}(vECF.numSerie)) +
    ' and ti.cod_empresa = ' + vDadosIni.codEmpresa);
  if dataSet.IsEmpty then
  begin
    dataSet.Insert;
    dataSet.FieldByName('cod_terminal').AsInteger := vECF.codTerminal;
    dataSet.FieldByName('num_serie_ecf').AsString := {vDadosIni.codifica}(vECF.numSerie);
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('DATA_CAD_TERM').AsDateTime := vDataDoDia;
    dataSet.FieldByName('DATA_MOD_TERM').AsDateTime := vDataDoDia;
  end
  else
  begin
    dataSet.Edit;
    dataSet.FieldByName('DATA_MOD_TERM').AsDateTime := vDataDoDia;
  end;
  dataSet.FieldByName('IDENT_CNIEE').AsString := vTerminais.CNIEE;
  dataSet.FieldByName('MF_ADICIONAL').AsString := vTerminais.mfAdicional;
  dataSet.FieldByName('DATA_SB').AsString := vTerminais.dataSB;
  dataSet.FieldByName('HORA_SB').AsString := vTerminais.horaSB;
  dataSet.FieldByName('ISSQNDESC').AsString := vTerminais.descontoISSQN;
  dataSet.FieldByName('ATUAL').AsString := 'S';
  dataSet.FieldByName('COD_PROPRIETARIO').AsString := vTerminais.codigoProprietario;
  dataSet.Post;
  if Apply then
  begin
    CommitaTransacao;

    buscas.Close;
    buscas.SQL.Text :=
      'SELECT IMP.NUM_SERIE_ECF, IMP.MF_ADICIONAL, CNIEE.TIPO_ECF,' +
      'CNIEE.MARCA_ECF, CNIEE.MODELO_ECF, CNIEE.VERSAOSB, IMP.DATA_SB, IMP.HORA_SB,' +
      'IMP.COD_TERMINAL, DES.CNPJ_EMPDES, DES.IE_EMPDES, DES.IM_EMPDES, DES.NOME_EMPDES,' +
      'FSC.NOME_PAF, FSC.VERSAO_PAF, FSC.MD5_PAF, FSC.ER_PAF_ECF, IMP.IDENT_CNIEE, IMP.MD5 FROM ' +
      'TERMINAL_IMPRESSORAS IMP, IMPRESSORAS_CNIEE CNIEE, TERMINALF TERM,' +
      'FISCAL_VERSOES FSC,EMPDESVOLV DES' +
      ' WHERE IMP.COD_TERMINAL = ' + inttostr(DataSet.FieldByName('cod_terminal').AsInteger) +
      ' AND IMP.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND IMP.NUM_SERIE_ECF = ' + QuotedStr(DataSet.FieldByName('NUM_SERIE_ECF').AsString) +
      ' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO AND IMP.COD_TERMINAL = ' +
      ' TERM.COD_TERMINAL AND IMP.COD_EMPRESA = ' +
      ' TERM.COD_EMPRESA AND TERM.COD_FISCAL = FSC.COD_FISCAL AND FSC.COD_EMPDES = DES.COD_EMPDES';
    buscas.Open;

    vMD5Func._gravaMD5_RegistrosPAF( buscas,
      Trim(buscas.FieldByName('NUM_SERIE_ECF').AsString) + '|' +
          Trim(buscas.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(buscas.FieldByName('TIPO_ECF').AsString) + '|' +
          Trim(buscas.FieldByName('MARCA_ECF').AsString) + '|' +
          Trim(buscas.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(buscas.FieldByName('VERSAOSB').AsString) + '|' +
          Trim(buscas.FieldByName('DATA_SB').AsString) + '|' +
          Trim(buscas.FieldByName('HORA_SB').AsString) + '|' +
          Trim(buscas.FieldByName('COD_TERMINAL').AsString) + '|' +
          Trim(vDadosIni.vEmp.vCNPJ) + '|' +
          Trim(vDadosIni.vEmp.vIE) + '|' +
          Trim(buscas.FieldByName('ER_PAF_ECF').AsString) + '|',
          'TERMINAL_IMPRESSORAS',
          ' COD_TERMINAL = ' + IntToStr( dataSet.FieldByName('COD_TERMINAL').AsInteger ) +
          ' AND NUM_SERIE_ECF = ' + QuotedStr(dataSet.FieldByName('NUM_SERIE_ECF').AsString) +
          ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa);

//    vMD5Func._gravaMD5_TerminalImpressoras(buscas,
//      dataSet.FieldByName('COD_TERMINAL').AsInteger,
//      dataSet.FieldByName('IDENT_CNIEE').AsString,
//      dataSet.FieldByName('NUM_SERIE_ECF').AsString);
  end
  else
    RollBackTransacao;
end;

function TECF_Assistente.setDadosTotalizadores: boolean;
var
  I: Integer;
begin
  Result := true;
  dataSet.Close;
  dataSet := TClientDataSet(dtmAssistente.cdsF);
  transacao := TIBtransaction(dtmAssistente.transF);

  if dtmAssistente.transF.InTransaction then
    dtmAssistente.transF.Rollback;
  //  if not dtmAssistente.transF.InTransaction then
  //    dtmAssistente.transF.StartTransaction;

  montaSelect('select * from totalizador_naof f' +
    ' where f.cod_terminal = ' + IntToStr(vECF.codTerminal) +
    ' and f.nserieecf = ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
    ' and f.cod_empresa = ' + vDadosIni.codEmpresa); // +
  //        ' and f.sequencia= ' + IntToStr(vTotalizador.codigo[i]));
  while not dataSet.IsEmpty do
    dataSet.Delete;

  for I := 1 to 99 do
  begin
    if (vTotalizador.codigo[i] <> 0) and (Trim(vTotalizador.descricao[i]) <> '') then
    begin
      //      montaSelect('select * from totalizador_naof f' +
      //        ' where f.cod_terminal = ' + IntToStr(vECF.codTerminal) +
      //        ' and f.nserieecf = ' + QuotedStr(vDadosIni.codifica(vECF.numSerie)) +
      //        ' and f.cod_empresa = ' + vDadosIni.codEmpresa +
      //        ' and f.sequencia= ' + IntToStr(vTotalizador.codigo[i]));
      //      if dataSet.IsEmpty then
      //      begin
      dataSet.Insert;
      dataSet.FieldByName('sequencia').AsInteger := vTotalizador.codigo[i];
      dataSet.FieldByName('cod_terminal').AsInteger := vECF.codTerminal;
      dataSet.FieldByName('nserieecf').AsString := vDadosIni.codifica(vECF.numSerie);
      dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
      //      end
      //      else
      //        dataSet.Edit;
      dataSet.FieldByName('DESCRICAO').AsString := vTotalizador.descricao[i];
      dataSet.Post;
      if Apply then
        CommitaTransacao
      else
        RollBackTransacao;
    end;
  end;
end;

function TECF_Assistente.setGrandeTotal: boolean;
var
  arquivo: TIniFile;
  ArqIni: string;
  temp: string;
begin
  try
    Result := true;
    temp := Trim(vECF.valorGrandeTotal);
    temp := StringReplace(temp, ',', '', [rfReplaceAll, rfIgnoreCase]);
    temp := StringReplace(temp, '.', '', [rfReplaceAll, rfIgnoreCase]);
    temp := vDadosIni.codifica(temp);
    try
      ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
      arquivo := TIniFile.Create(ArqIni);                                                   
      arquivo.WriteString('T', 'A', vDadosIni.codifica(IntToStr(vCodigoTerminal)));
      arquivo.WriteString(IntToStr(vCodigoTerminal), 'G', temp);
      arquivo.WriteString(IntToStr(vCodigoTerminal), 'N',vDadosIni.codifica(vECF.numSerie));

      buscas.Close;
      buscas.SQL.Text := 'select * from empdesvolv where empdesvolv.cod_empdes = 1';
      buscas.Open;

      arquivo.WriteString('Empresa Desenvolvedora', 'CNPJ', vDadosIni.codifica(Trim(buscas.FieldByName('CNPJ_EMPDES').AsString)));
      arquivo.WriteString('Empresa Desenvolvedora', 'IE', vDadosIni.codifica(Trim(buscas.FieldByName('IE_EMPDES').AsString)));
      temp := StringReplace(Trim(buscas.FieldByName('IM_EMPDES').AsString), '-', '', [rfReplaceAll]);
      temp := StringReplace(temp, '.', '', [rfReplaceAll]);
      arquivo.WriteString('Empresa Desenvolvedora', 'IM', vDadosIni.codifica(temp));
      arquivo.WriteString('Empresa Desenvolvedora', 'NOMEEMPRESA', vDadosIni.codifica(Trim(buscas.FieldByName('NOME_EMPDES').AsString)));

      buscas.Close;
      buscas.SQL.Text := 'select fv.nome_paf, fv.versao_paf from fiscal_versoes fv' +
        ' inner join terminalf t on t.cod_fiscal = fv.cod_fiscal' +
        ' where t.cod_terminal = ' + IntToStr(vCodigoTerminal) +
        ' and t.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and fv.cod_empdes = 1';
      buscas.Open;

      arquivo.WriteString('Empresa Desenvolvedora', 'NOMEPAF', vDadosIni.codifica(Trim(buscas.FieldByName('NOME_PAF').AsString)));
      arquivo.WriteString('Empresa Desenvolvedora', 'VERSAO', vDadosIni.codifica(Trim(buscas.FieldByName('VERSAO_PAF').AsString)));

    finally
      arquivo.free;
    end;
  except
    Result := false;
  end;
end;

function TECF_Assistente.validaBancos: boolean;
begin
  Result := vDadosIni.conectaBanco(dtmAssistente.bdF,vTerminal.bancoFiscal,true);
  if result then
    Result := vDadosIni.conectaBanco(dtmAssistente.bdHw,vTerminal.bancoHWF, true);
  if Result then
    Result := vDadosIni.conectaBanco(dtmAssistente.bdHw,vTerminal.bancoHw, true);
end;

end.

