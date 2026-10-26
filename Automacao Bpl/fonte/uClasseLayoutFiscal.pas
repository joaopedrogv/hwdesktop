unit uClasseLayoutFiscal;

interface

uses
  uDataSet_OOP, DBClient, DB, Forms, Controls, StdCtrls, Gauges;

type
//  TLayoutFiscal40 = class;

//  TTerminalConfig = class(TDataSet_OOP)
//    constructor create;
//    function abreTerminais: boolean;
//  var
//    vLayout: TLayoutFiscal40;
//  end;

  TLayoutFiscal40 = class(TDataSet_OOP)
  private
    //Variaveis
    linha: AnsiString;
    dataIni: TDate;
    dataFim: TDate;
    labelStatus: TLabel;
    vGauge: TGauge;
    arqtxt: TextFile;
    cancelar: boolean;
    vInc, vMaxGauge: integer;
    vPosGauge: Double;
    //Funcoes auxiliares
    function transformadata(data: string): TDate;
    function transformafloat(valor: string): Double;
    function transformafloat3Dec(valor: string): Double;
    function transformainteiro(valor: string): integer;
    function retornaCodigoUF(sigla: string): Integer;
    function retornaCodigoCidade(cidade: string): integer;
    function retornaCodigoBairro(bairro: string): integer;
    //Fim

    //importacao
    procedure processaclientes;
    procedure processaProdutos;
    procedure processaFuncionarios;
    procedure processaServicos;
    procedure processaEmpresa;
    procedure processaSenhas;
    procedure processaCodBarras;
    //fim importacao

    //exportacao
    procedure montaCupom;
    procedure montaCupom2;
    procedure montaFimCupom;
    procedure montaFormPag;
    procedure montaResumoD;
    procedure montaMapaResumoD;
    procedure montaSangSup;
    procedure montaTipFinal;
    procedure montaclientes;
    procedure montaProdutos;
    procedure montaFuncionarios;
    procedure montaServicos;
    procedure montaEmpresa;
    procedure montaCodBarra;
    procedure montaSenhas;
    //fim exportacao
  public
    constructor create;
    function iniciaExportacao(dataInicial, dataFinal: TDate; labelDeStatus: TLabel; gaugeProgress:
      TGauge; pathArquivo: string): boolean;

    function iniciaImportacao(pathImportacao: string; labelInf, labelTerminal, labelTotal,
    labelCont: TLabel; gaugeProgress: TGauge): boolean;

  end;

implementation

uses IBQuery, IBDatabase, uDtmAtivo, SysUtils, uDadosIni, UdtmTerminalF,
  Windows;

{ TLayoutFiscal40 }

constructor TLayoutFiscal40.create;
begin
  if dtmTerminaisF = nil then
    dtmTerminaisF := TdtmTerminaisF.Create(dtmTerminaisF);
  dataSet := TClientDataSet(dtmTerminaisF.cdsLayout);
  buscas := TIBQuery(dtmTerminaisF.IbTerminalF);
  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
end;

function TLayoutFiscal40.iniciaExportacao(dataInicial, dataFinal: TDate;
  labelDeStatus: TLabel; gaugeProgress: TGauge; pathArquivo: string): boolean;
var
  tempDateFormat, tempTimeFormat: string;
begin
  try
    tempDateFormat := ShortDateFormat;
    tempTimeFormat := ShortTimeFormat;
    ShortDateFormat := 'DD/MM/YYYY';
    ShortTimeFormat := 'HH:MM:SS';

    labelStatus :=  TLabel(labelDeStatus);
    vGauge:= TGauge(gaugeProgress);
    dataIni:= dataInicial;
    dataFim:= dataFinal;

    try
      Screen.Cursor := crHourGlass;
      vGauge.Visible := true;
      labelStatus.Visible := true;
      AssignFile(arqtxt, pathArquivo);
      Rewrite(arqtxt);
      Writeln(arqtxt, 'Fiscal40');
      montaCupom;
      montaCupom2;
      montaFimCupom;
      montaFormPag;
      montaResumoD;
      montaMapaResumoD;
      montaSangSup;
      montaTipFinal;
      montaclientes;
      montaProdutos;
      montaFuncionarios;
      montaServicos;
      montaEmpresa;
      montaCodBarra;
      montaSenhas;
      Writeln(arqtxt, 'fimarquivo');
      labelStatus.Caption := 'Arquivo montado com sucesso! ' + pathArquivo;
    finally
      CloseFile(arqtxt);
      vGauge.Visible := false;
    end;
  finally
    ShortDateFormat := tempDateFormat;
    ShortTimeFormat := tempTimeFormat;
  end;
end;

function TLayoutFiscal40.iniciaImportacao(pathImportacao: string; labelInf, labelTerminal, labelTotal, labelCont: TLabel; gaugeProgress: TGauge): boolean;
var
  v: Boolean;
  max, i: integer;
  j: Double;
begin
  try
    v := true;
    vGauge :=  TGauge(gaugeProgress);
    Screen.Cursor := crHourGlass;
    if not FileExists(pathImportacao) then
    begin
      Application.MessageBox('Arquivo não encontrado', 'Atenção', MB_OK + MB_ICONQUESTION);
      exit;
    end;
    try
      Screen.Cursor := crHourGlass;
      labelInf.Visible := True;
      labelInf.Caption := 'Aguarde. Fazendo contagem dos registros';
      labelInf.Refresh;
      try
        max := 0;
        AssignFile(arqtxt, pathImportacao);
        Reset(arqtxt);
        while not System.Eof(arqtxt) do
        begin
          Readln(arqtxt, linha);
          if (Copy(linha, 1, 2) = 'CL') or (Copy(linha, 1, 2) = 'PR') or
            (Copy(linha, 1, 2) = 'FU') or (Copy(linha, 1, 2) = 'SE') or
            (Copy(linha, 1, 2) = 'EM') or (Copy(linha, 1, 2) = 'SN') or
            (Copy(linha, 1, 2) = 'CB')  or (Copy(linha, 1, 2) = 'MR')
              then
            Inc(max);
        end;
      finally
        CloseFile(arqtxt);
      end;
      labelTotal.Visible := true;
      labelTotal.Caption := 'Total de ' + IntToStr(max) + ' registros';
      labelTotal.Refresh;
      AssignFile(arqtxt, pathImportacao);
      Reset(arqtxt);
      Readln(arqtxt, linha);
      if linha <> 'Fiscal40' then
      begin
        Application.MessageBox('Arquivo não compativel com o esperado', 'Atenção', MB_OK +
          MB_ICONQUESTION);
        exit;
      end;
      i := 0;
      vGauge.Visible := true;
      labelCont.Visible := TRUE;
      Readln(arqtxt, linha);
      while linha <> 'fimarquivo' do
      begin
        Application.ProcessMessages;
        if (Copy(linha, 1, 2) = 'CL') or (Copy(linha, 1, 2) = 'PR') or
          (Copy(linha, 1, 2) = 'FU') or (Copy(linha, 1, 2) = 'SE') or
          (Copy(linha, 1, 2) = 'EM') or (Copy(linha, 1, 2) = 'SN') or (Copy(linha, 1, 2) = 'CB')
            then
        begin
          Inc(i);
          j := (i * 100) / max;
          vGauge.Progress := Trunc(j);
          labelCont.Caption := 'Registro nº ' + IntToStr(i);
          labelCont.Refresh;
          if (i mod 100) = 0  then
            CommitaTransacao;
        end;
        labelInf.Refresh;
        if Copy(linha, 1, 2) = 'CL' then
        begin
          labelInf.Caption := 'Copiando Clientes...';
          processaclientes;
        end
        else if Copy(linha, 1, 2) = 'PR' then
        begin
          labelInf.Caption := 'Copiando Produtos...';
          processaProdutos;
        end
        else if Copy(linha, 1, 2) = 'FU' then
        begin
          labelInf.Caption := 'Copiando Funcionarios...';
          processaFuncionarios;
        end
        else if Copy(linha, 1, 2) = 'SE' then
        begin
          labelInf.Caption := 'Copiando Serviços...';
          processaServicos;
        end
        else if Copy(linha, 1, 2) = 'EM' then
        begin
          labelInf.Caption := 'Copiando dados da Empresa...';
          processaEmpresa;
        end
        else if Copy(linha, 1, 2) = 'SN' then
        begin
          labelInf.Caption := 'Aguarde...';
          processaSenhas;
        end
        else if Copy(linha, 1, 2) = 'CB' then
        begin
          labelInf.Caption := 'Copiando Codigo de Barras...';
          processaCodBarras;
        end;
        Readln(arqtxt, linha);
        if I > max + 1 then
          exit;
      end;
      labelInf.Caption := 'Arquivo processado com sucesso!';
    finally
      vGauge.Visible := false;
      CloseFile(arqtxt);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TLayoutFiscal40.montaclientes;
begin
  try
    montaSelect('select (select sigla_uf from estados where codigo_uf = ccd.codigo_uf) as codigo_uf,'
      +
      ' (select sigla_uf from estados where codigo_uf = ccd.est_codigo_uf) as est_codigo_uf,' +
      ' ccd.* from clientes ccd where ccd.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ccd.data_mod_cad >= :data1 and ccd.data_mod_cad <= :data2', dataIni, dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Clientes...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(1020);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'CL');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_CLIENTE').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('NOME_CLIENTE').AsString);
        VdadosIni.MontaLinha(0044, dataSet.FieldByName('ENDERECO').AsString);
        VdadosIni.MontaLinha(0094, dataSet.FieldByName('BAIRRO').AsString);
        VdadosIni.MontaLinha(0129, dataSet.FieldByName('CIDADE').AsString);
        VdadosIni.MontaLinha(0164, dataSet.FieldByName('CODIGO_UF').AsString);
        VdadosIni.MontaLinha(0166, dataSet.FieldByName('CPFCGC').AsString);
        VdadosIni.MontaLinha(0184, dataSet.FieldByName('INSC_EST').AsString);
        VdadosIni.MontaLinha(0202, dataSet.FieldByName('FONE_CLIENTE').AsString);
        VdadosIni.MontaLinha(0215, dataSet.FieldByName('RAZAO').AsString);
        VdadosIni.MontaLinha(0275, dataSet.FieldByName('CEP').AsString);
        VdadosIni.MontaLinha(0284, dataSet.FieldByName('TIPVCLIENTE').AsString);
        VdadosIni.MontaLinha(0285,
          VdadosIni.StrZero(dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger, 4));
        VdadosIni.MontaLinha(0289, VdadosIni.StrZero(dataSet.FieldByName('CODIGO_TIPO').AsInteger,4));
        VdadosIni.MontaLinha(0293, dataSet.FieldByName('EST_CODIGO_UF').AsString);
        VdadosIni.MontaLinha(0295, dataSet.FieldByName('FAX').AsString);
        VdadosIni.MontaLinha(0309, dataSet.FieldByName('CIDA_COBRANCA').AsString);
        VdadosIni.MontaLinha(0339, dataSet.FieldByName('CEP_COBRANCA').AsString);
        VdadosIni.MontaLinha(0348, dataSet.FieldByName('OBSERVACAO').AsString);
        VdadosIni.MontaLinha(0548, StringReplace(dataSet.FieldByName('DATA_CADASTRO').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0556, dataSet.FieldByName('CONTATO').AsString);
        VdadosIni.MontaLinha(0566, dataSet.FieldByName('NATURALID').AsString);
        VdadosIni.MontaLinha(0586, dataSet.FieldByName('CONJUGE').AsString);
        VdadosIni.MontaLinha(0621, dataSet.FieldByName('RG').AsString);
        VdadosIni.MontaLinha(0631, StringReplace(dataSet.FieldByName('EXPEDIC').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0639, dataSet.FieldByName('ORG_EXPEDIC').AsString);
        VdadosIni.MontaLinha(0659, dataSet.FieldByName('CTPS').AsString);
        VdadosIni.MontaLinha(0669, VdadosIni.StrZero(dataSet.FieldByName('US_CAD_CLI').AsInteger,
          6));
        VdadosIni.MontaLinha(0675, dataSet.FieldByName('END_COBRANCA').AsString);
        VdadosIni.MontaLinha(0725, dataSet.FieldByName('BAIRRO_COBRANCA').AsString);
        VdadosIni.MontaLinha(0760, dataSet.FieldByName('PAI').AsString);
        VdadosIni.MontaLinha(0795, dataSet.FieldByName('MAE').AsString);
        VdadosIni.MontaLinha(0830, StringReplace(dataSet.FieldByName('DATA_NASC').AsString, '/', '',
          [rfReplaceAll]));
        VdadosIni.MontaLinha(0838, dataSet.FieldByName('EMAIL').AsString);
        VdadosIni.MontaLinha(0888, VdadosIni.StrZero(dataSet.FieldByName('DIA_VENC').AsInteger, 6));
        VdadosIni.MontaLinha(0894, StringReplace(dataSet.FieldByName('DATA_MOD_CAD').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0902, dataSet.FieldByName('TIPOCLIENTE').AsString);
        VdadosIni.MontaLinha(0908, dataSet.FieldByName('SEXO').AsString);
        VdadosIni.MontaLinha(0909, dataSet.FieldByName('RAMO_ATIVIDADE').AsString);
        VdadosIni.MontaLinha(0969, VdadosIni.StrZero(dataSet.FieldByName('COD_CIDADE').AsInteger,
          6));
        VdadosIni.MontaLinha(0975, VdadosIni.StrZero(dataSet.FieldByName('COD_BAIRRO').AsInteger,
          6));
        VdadosIni.MontaLinha(0981,
          VdadosIni.StrZero(dataSet.FieldByName('COD_CIDADE_COBRANCA').AsInteger, 6));
        VdadosIni.MontaLinha(0987,
          VdadosIni.StrZero(dataSet.FieldByName('COD_BAIRRO_COBRANCA').AsInteger, 6));
        VdadosIni.MontaLinha(0993, copy(dataSet.FieldByName('ESTADO_CIVIL').AsString,1,12));
        VdadosIni.MontaLinha(1005, VdadosIni.TZero(dataSet.FieldByName('PERC_DESC').AsCurrency, 8));
        VdadosIni.MontaLinha(1013, dataSet.FieldByName('BARRADO').AsString);
        VdadosIni.MontaLinha(1014,copy(dataSet.FieldByName('NUM_END_CLIENTE').AsString,1,6));

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;
end;

procedure TLayoutFiscal40.montaCodBarra;
begin
  try
    montaSelect('select * from cod_barra where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and DAT_MOD_CDBAR >= :data1 and DAT_MOD_CDBAR <= :data2', dataIni, dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Códigos de Barra...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(57);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'CB');
        VdadosIni.MontaLinha(0003, dataSet.FieldByName('COD_BARRA').AsString);
        VdadosIni.MontaLinha(0023, VdadosIni.StrZero(dataSet.FieldByName('GRUPO_PROD').AsInteger,
          6));
        VdadosIni.MontaLinha(0029, dataSet.FieldByName('COD_PROD').AsString);
        VdadosIni.MontaLinha(0035, StringReplace(dataSet.FieldByName('DAT_CAD_CDBAR').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0043, StringReplace(dataSet.FieldByName('DAT_MOD_CDBAR').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0051, VdadosIni.StrZero(dataSet.FieldByName('ATIVO').AsInteger, 6));

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;

end;

procedure TLayoutFiscal40.montaCupom;
begin
  try
    montaSelect('select * from cupom where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and nserieecf = ' +
      QuotedStr(vDadosIni.vNumSerieEcf) + ' and data >= :data1 and data <= :data2', dataIni,
      dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Cupom...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(187);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'CP');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('NSERIEECF').AsString);
        VdadosIni.MontaLinha(0029, VdadosIni.StrZero(dataSet.FieldByName('REGISTRO').AsInteger, 6));
        VdadosIni.MontaLinha(0035, VdadosIni.StrZero(dataSet.FieldByName('CUPOM').AsInteger, 6));
        VdadosIni.MontaLinha(0041, Copy(dataSet.FieldByName('data').AsString, 1, 2) +
          Copy(dataSet.FieldByName('data').AsString, 4, 2) +
          Copy(dataSet.FieldByName('data').AsString, 7, 4));
        VdadosIni.MontaLinha(0049, VdadosIni.StrZero(dataSet.FieldByName('CUPOM').AsInteger, 6));
        VdadosIni.MontaLinha(0055, copy(dataSet.FieldByName('FORMAPAG').AsString, 1, 20));
        VdadosIni.MontaLinha(0075, VdadosIni.TZero(dataSet.FieldByName('VALORPAGO').AsCurrency, 8));
        VdadosIni.MontaLinha(0083, VdadosIni.TZero(dataSet.FieldByName('TOTAL').AsCurrency, 8));
        VdadosIni.MontaLinha(0091, copy(dataSet.FieldByName('CONDPGTO').AsString, 1, 20));
        VdadosIni.MontaLinha(0111, VdadosIni.TZero(dataSet.FieldByName('VALOR_DESC').AsCurrency,
          8));
        VdadosIni.MontaLinha(0119, VdadosIni.TZero(dataSet.FieldByName('VALOR_ACRES').AsCurrency,
          8));
        VdadosIni.MontaLinha(0127, VdadosIni.StrZero(dataSet.FieldByName('COLABORADOR').AsInteger,
          6));
        VdadosIni.MontaLinha(0133, copy(dataSet.FieldByName('STATUS_CP').AsString, 1, 10));
        VdadosIni.MontaLinha(0143, StringReplace(dataSet.FieldByName('HORAABERTURA').AsString, ':',
          '', [rfReplaceAll, rfIgnoreCase]));
        VdadosIni.MontaLinha(0149, StringReplace(dataSet.FieldByName('HORAFECHAMENTO').AsString,
          ':',
          '', [rfReplaceAll, rfIgnoreCase]));
        VdadosIni.MontaLinha(0155, StringReplace(dataSet.FieldByName('HORASUBTOTAL').AsString, ':',
          '', [rfReplaceAll, rfIgnoreCase]));
        VdadosIni.MontaLinha(0161, VdadosIni.TZero(dataSet.FieldByName('VALORCUPOM').AsCurrency,
          8));
        VdadosIni.MontaLinha(0169, VdadosIni.StrZero(dataSet.FieldByName('PED').AsInteger, 6));
        VdadosIni.MontaLinha(0175, VdadosIni.StrZero(dataSet.FieldByName('PREVENDA').AsInteger, 6));
        VdadosIni.MontaLinha(0181, VdadosIni.StrZero(dataSet.FieldByName('CCF').AsInteger, 6));

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;
end;

procedure TLayoutFiscal40.montaCupom2;
begin
  try
    montaSelect('select c2.* from cupom2 c2' +
      ' inner join cupom c on c.cod_terminal = c2.cod_terminal and' +
      ' c.cod_empresa = c2.cod_empresa and c.nserieecf = c2.nserieecf and' +
      ' c.registro = c2.ordem where c.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and c.cod_terminal = ' + vDadosIni.vCodTerminal + ' and c.nserieecf = ' +
      QuotedStr(vDadosIni.vNumSerieEcf) + ' and c.data >= :data1 and c.data <= :data2', dataIni,
      dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Itens dos Cupons...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(195);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'C2');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('NSERIEECF').AsString);
        VdadosIni.MontaLinha(0029, VdadosIni.StrZero(dataSet.FieldByName('REGISTRO').AsInteger, 6));
        VdadosIni.MontaLinha(0035, VdadosIni.StrZero(dataSet.FieldByName('NITEM').AsInteger, 6));
        VdadosIni.MontaLinha(0041, VdadosIni.StrZero(dataSet.FieldByName('CUPOM').AsInteger, 6));
        VdadosIni.MontaLinha(0047, VdadosIni.StrZero(dataSet.FieldByName('ORDEM').AsInteger, 6));
        VdadosIni.MontaLinha(0053, VdadosIni.StrZero(dataSet.FieldByName('GRUPO_PROD').AsInteger,
          6));
        VdadosIni.MontaLinha(0059, dataSet.FieldByName('COD_PROD').AsString);
        VdadosIni.MontaLinha(0065, dataSet.FieldByName('CODBARRA').AsString);
        VdadosIni.MontaLinha(0085, VdadosIni.TZero(dataSet.FieldByName('QUANTIDADE').AsCurrency,
          8));
        VdadosIni.MontaLinha(0093, VdadosIni.TZero(dataSet.FieldByName('PRECO').AsCurrency, 8));
        VdadosIni.MontaLinha(0101, dataSet.FieldByName('ALIQUOTA_IT').AsString);
        VdadosIni.MontaLinha(0105, dataSet.FieldByName('STATUS_IT').AsString);
        VdadosIni.MontaLinha(0115, VdadosIni.TZero(dataSet.FieldByName('TOTAL').AsCurrency, 8));
        VdadosIni.MontaLinha(0124, dataSet.FieldByName('DESCR_IT').AsString);
        VdadosIni.MontaLinha(0153, VdadosIni.TZero(dataSet.FieldByName('PERC_DESC').AsCurrency, 8));
        VdadosIni.MontaLinha(0161, VdadosIni.TZero(dataSet.FieldByName('PERC_ACRESC').AsCurrency,
          8));
        VdadosIni.MontaLinha(0169, VdadosIni.TZero(dataSet.FieldByName('RAT_ACRES').AsCurrency, 8));
        VdadosIni.MontaLinha(0177, VdadosIni.TZero(dataSet.FieldByName('RAT_DESC').AsCurrency, 8));
        VdadosIni.MontaLinha(0185, dataSet.FieldByName('DESCALIQ').AsString);
        VdadosIni.MontaLinha(0192, dataSet.FieldByName('CSDECQTDE').AsString);
        VdadosIni.MontaLinha(0193, dataSet.FieldByName('CSDECVLUNT').AsString);
        VdadosIni.MontaLinha(0194, dataSet.FieldByName('PROD_SERV').AsString);

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;
end;

procedure TLayoutFiscal40.montaEmpresa;
begin
  try
    montaSelect('select estados.sigla_uf,empresa.* from empresa' +
                ' inner join estados on estados.codigo_uf = empresa.uf_emp' +
                ' where cod_empresa= ' + vDadosIni.codEmpresa);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Empresa...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(296);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'EM');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_EMPRESA').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('NOME_EMP').AsString);
        VdadosIni.MontaLinha(0059, dataSet.FieldByName('ENDRECO_EMP').AsString);
        VdadosIni.MontaLinha(0109, dataSet.FieldByName('BAIRRO_EMP').AsString);
        VdadosIni.MontaLinha(0139, dataSet.FieldByName('CIDADE_EMP').AsString);
        VdadosIni.MontaLinha(0169, dataSet.FieldByName('CEP_EMP').AsString);
        VdadosIni.MontaLinha(0178, dataSet.FieldByName('CNPJ_EMP').AsString);
        VdadosIni.MontaLinha(0196, dataSet.FieldByName('IE_EMP').AsString);
        VdadosIni.MontaLinha(0214, dataSet.FieldByName('IM_EMP').AsString);
        VdadosIni.MontaLinha(0232, dataSet.FieldByName('TELEFONE_EMP').AsString);
        VdadosIni.MontaLinha(0246, VdadosIni.StrZero(dataSet.FieldByName('NUMERO_END').AsInteger,
          6));
        VdadosIni.MontaLinha(0252, dataSet.FieldByName('PROP_EMP').AsString);
        VdadosIni.MontaLinha(0292, dataSet.FieldByName('SIGLA_UF').AsString);
        VdadosIni.MontaLinha(0294, dataSet.FieldByName('AUT_SERV_CUPOM').AsString);
        VdadosIni.MontaLinha(0295, dataSet.FieldByName('COPIAR_HWF_TERM_RET').AsString);

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;

end;

procedure TLayoutFiscal40.montaFimCupom;
begin
  try
    montaSelect('select * from fincupom where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and nserieecf = ' +
      QuotedStr(vDadosIni.vNumSerieEcf) + ' and data >= :data1 and data <= :data2', dataIni,
      dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Finalizadores Cupom...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(98);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'FC');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('NSERIEECF').AsString);
        VdadosIni.MontaLinha(0029, VdadosIni.StrZero(dataSet.FieldByName('REGISTRO').AsInteger, 6));
        VdadosIni.MontaLinha(0035, VdadosIni.StrZero(dataSet.FieldByName('ORDEM').AsInteger, 6));
        VdadosIni.MontaLinha(0041, VdadosIni.StrZero(dataSet.FieldByName('CUPOM').AsInteger, 6));
        VdadosIni.MontaLinha(0047, VdadosIni.StrZero(dataSet.FieldByName('FINALIZADOR').AsInteger,
          6));
        VdadosIni.MontaLinha(0053, VdadosIni.TZero(dataSet.FieldByName('VALOR').AsCurrency, 8));
        VdadosIni.MontaLinha(0061, VdadosIni.StrZero(dataSet.FieldByName('GNF_ECF').AsInteger, 6));
        VdadosIni.MontaLinha(0067, VdadosIni.StrZero(dataSet.FieldByName('CCF_ECF').AsInteger, 6));
        VdadosIni.MontaLinha(0073, dataSet.FieldByName('TIPO_DOC').AsString);
        VdadosIni.MontaLinha(0076,
          VdadosIni.StrZero(dataSet.FieldByName('COD_TOTALIZADOR').AsInteger, 6));
        VdadosIni.MontaLinha(0082, StringReplace(dataSet.FieldByName('DATA').AsString, '/', '',
          [rfReplaceAll, rfIgnoreCase]));
        VdadosIni.MontaLinha(0090, VdadosIni.TZero(dataSet.FieldByName('VALOR_REL').AsCurrency, 8));
        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;
end;

procedure TLayoutFiscal40.montaFormPag;
begin
  //
end;

procedure TLayoutFiscal40.montaFuncionarios;
begin
  try
    montaSelect('select es.sigla_uf as codigo_uf,csd.* from colaborador csd' +
      ' inner join estados es on es.codigo_uf = csd.codigo_uf' +
      ' and csd.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and csd.data_mod_col >= :data1 and csd.data_mod_col <= :data2', dataIni, dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Funcionários...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(531);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'FU');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_VENDEDOR').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('CODIGO_UF').AsString);
        VdadosIni.MontaLinha(0011, VdadosIni.StrZero(dataSet.FieldByName('COD_FUNCAO').AsInteger,
          6));
        VdadosIni.MontaLinha(0017, dataSet.FieldByName('NOME_VENDEDOR').AsString);
        VdadosIni.MontaLinha(0052, dataSet.FieldByName('END_VENDEDOR').AsString);
        VdadosIni.MontaLinha(0087, dataSet.FieldByName('BAIRRO_VENDEDOR').AsString);
        VdadosIni.MontaLinha(0122, dataSet.FieldByName('CIDADE_VENDEDOR').AsString);
        VdadosIni.MontaLinha(0157, dataSet.FieldByName('CEP_VENDEDOR').AsString);
        VdadosIni.MontaLinha(0166, dataSet.FieldByName('FONE_VENDEDOR').AsString);
        VdadosIni.MontaLinha(0180, dataSet.FieldByName('CPF_VENDEDOR').AsString);
        VdadosIni.MontaLinha(0191, dataSet.FieldByName('OBS_VENDEDOR').AsString);
        VdadosIni.MontaLinha(0391, StringReplace(dataSet.FieldByName('DATA_MOD_COL').AsString, '/',
          '', [rfReplaceAll, rfIgnoreCase]));
        VdadosIni.MontaLinha(0399, StringReplace(dataSet.FieldByName('DATA_CAD_COL').AsString, '/',
          '', [rfReplaceAll, rfIgnoreCase]));
        VdadosIni.MontaLinha(0407, StringReplace(dataSet.FieldByName('DAT_NASC_COL').AsString, '/',
          '', [rfReplaceAll, rfIgnoreCase]));
        VdadosIni.MontaLinha(0415, VdadosIni.StrZero(dataSet.FieldByName('COD_CIDADE').AsInteger,
          6));
        VdadosIni.MontaLinha(0421, VdadosIni.StrZero(dataSet.FieldByName('COD_BAIRRO').AsInteger,
          6));
        VdadosIni.MontaLinha(0427,
          VdadosIni.StrZero(dataSet.FieldByName('SALARIO_REGISTRO').AsInteger, 6));
        VdadosIni.MontaLinha(0435, VdadosIni.StrZero(dataSet.FieldByName('ATIVO').AsInteger, 6));
        VdadosIni.MontaLinha(0441, dataSet.FieldByName('EMAIL').AsString);
        VdadosIni.MontaLinha(0491, dataSet.FieldByName('FONE_CONTATO').AsString);

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;

end;

procedure TLayoutFiscal40.montaMapaResumoD;
begin
  try
    montaSelect('select mra.* from mapa_resumo_aliq mra inner join resumod rd on' +
      ' rd.cod_terminal = mra.cod_terminal and rd.cod_empresa  = mra.cod_empresa' +
      ' and rd.nserieecf = mra.nserieecf and rd.coored = mra.coored' +
      ' where rd.cod_empresa = ' + vDadosIni.codEmpresa + ' and rd.cod_terminal = ' +
      vDadosIni.vCodTerminal + ' and rd.nserieecf = ' + QuotedStr(vDadosIni.vNumSerieEcf) +
      ' and rd.data_mov >= :data1 and rd.data_mov <= :data2', dataIni, dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Mapara do Movimento Diário...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(58);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'MR');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('NSERIEECF').AsString);
        VdadosIni.MontaLinha(0027, VdadosIni.StrZero(dataSet.FieldByName('COORED').AsInteger, 6));
        VdadosIni.MontaLinha(0033, dataSet.FieldByName('ALIQ_SEQ').AsString);
        VdadosIni.MontaLinha(0037, dataSet.FieldByName('DESCALIQ').AsString);
        VdadosIni.MontaLinha(0044, vDadosIni.StrZero(dataSet.FieldByName('ATIVO').AsInteger, 6));
        VdadosIni.MontaLinha(0050, VdadosIni.TZero(dataSet.FieldByName('VALORALIQ').AsCurrency, 8));
        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;
end;

procedure TLayoutFiscal40.montaProdutos;
begin
  try
    montaSelect('select * from produtos where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and dat_mod_prod >= :data1 and dat_mod_prod <= :data2', dataIni, dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Produtos...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(617);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'PR');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('GRUPO_PROD').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('COD_PROD').AsString);
        VdadosIni.MontaLinha(0015, VdadosIni.TZero(dataSet.FieldByName('CODIGO_NOP').AsCurrency,
          8));
        VdadosIni.MontaLinha(0023, VdadosIni.TZero(dataSet.FieldByName('EST_F').AsCurrency, 8));
        VdadosIni.MontaLinha(0031, VdadosIni.TZero(dataSet.FieldByName('PREC_CUS_PROD').AsCurrency,
          8));
        VdadosIni.MontaLinha(0039, VdadosIni.TZero(dataSet.FieldByName('PREC_TAB_PROD').AsCurrency,
          8));
        VdadosIni.MontaLinha(0047, dataSet.FieldByName('LOCACAO_PROD').AsString);
        VdadosIni.MontaLinha(0055, dataSet.FieldByName('LOCACAO_PROD_1').AsString);
        VdadosIni.MontaLinha(0063, dataSet.FieldByName('APLICACAO_PROD').AsString);
        VdadosIni.MontaLinha(0213, StringReplace(dataSet.FieldByName('DATA_ULT_COMPRA').AsString,
          '/', '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0221, VdadosIni.TZero(dataSet.FieldByName('VL_ULT_COMPRA').AsCurrency,
          8));
        VdadosIni.MontaLinha(0229, dataSet.FieldByName('DESCR_PROD').AsString);
        VdadosIni.MontaLinha(0304, VdadosIni.TZero(dataSet.FieldByName('IPI_PROD').AsCurrency, 8));
        VdadosIni.MontaLinha(0312, VdadosIni.StrZero(dataSet.FieldByName('NUM_NF_REC').AsInteger,
          6));
        VdadosIni.MontaLinha(0318, VdadosIni.TZero(dataSet.FieldByName('ICM_PROD').AsCurrency, 8));
        VdadosIni.MontaLinha(0326, VdadosIni.TZero(dataSet.FieldByName('PERC_TB_PROD').AsCurrency,
          8));
        VdadosIni.MontaLinha(0334, dataSet.FieldByName('NUM_FAB_PROD').AsString);
        VdadosIni.MontaLinha(0354, VdadosIni.TZero(dataSet.FieldByName('PREC_30_PROD').AsCurrency,
          8));
        VdadosIni.MontaLinha(0362, VdadosIni.TZero(dataSet.FieldByName('PREC_60_PROD').AsCurrency,
          8));
        VdadosIni.MontaLinha(0370, VdadosIni.TZero(dataSet.FieldByName('PREC_90_PROD').AsCurrency,
          8));
        VdadosIni.MontaLinha(0378, dataSet.FieldByName('MARCA_P').AsString);
        VdadosIni.MontaLinha(0388, dataSet.FieldByName('ALT_COD_CUPOM').AsString);
        VdadosIni.MontaLinha(0389, VdadosIni.TZero(dataSet.FieldByName('PERC_RED_PROD').AsCurrency,
          8));
        VdadosIni.MontaLinha(0397, dataSet.FieldByName('ISENTO_PROD').AsString);
        VdadosIni.MontaLinha(0398, dataSet.FieldByName('N_INCIDENCIA_PROD').AsString);
        VdadosIni.MontaLinha(0399, dataSet.FieldByName('UNIDADE').AsString);
        VdadosIni.MontaLinha(0402, VdadosIni.TZero(dataSet.FieldByName('PERC_TB_PROD3').AsCurrency,
          8));
        VdadosIni.MontaLinha(0410, VdadosIni.TZero(dataSet.FieldByName('PERC_TB_PROD6').AsCurrency,
          8));
        VdadosIni.MontaLinha(0418, VdadosIni.TZero(dataSet.FieldByName('PERC_TB_PROD9').AsCurrency,
          8));
        VdadosIni.MontaLinha(0426, dataSet.FieldByName('ALT_DESC_CUPOM').AsString);
        VdadosIni.MontaLinha(0427, dataSet.FieldByName('CST_PROD').AsString);
        VdadosIni.MontaLinha(0430, VdadosIni.TZero(dataSet.FieldByName('PREC_PUBLICO').AsCurrency,
          8));
        VdadosIni.MontaLinha(0438, dataSet.FieldByName('COD_PPS').AsString);
        VdadosIni.MontaLinha(0440, StringReplace(dataSet.FieldByName('DAT_CAD_PROD').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0448, StringReplace(dataSet.FieldByName('DAT_MOD_PROD').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0456, dataSet.FieldByName('ISENTO_PIS').AsString);
        VdadosIni.MontaLinha(0457, dataSet.FieldByName('EMB_PROD').AsString);
        VdadosIni.MontaLinha(0467, VdadosIni.TZero(dataSet.FieldByName('QTDEMB').AsFloat, 8));
        VdadosIni.MontaLinha(0475, dataSet.FieldByName('BALANCA_PROD').AsString);
        VdadosIni.MontaLinha(0476, StringReplace(dataSet.FieldByName('VALIDADE_PROD').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0484, VdadosIni.TZero(dataSet.FieldByName('ALIQ_RED_PROD').AsFloat,
          8));
        VdadosIni.MontaLinha(0492, dataSet.FieldByName('TIP_PROD_IND').AsString);
        VdadosIni.MontaLinha(0497, VdadosIni.TZero(dataSet.FieldByName('PERC_TB_ATAC').AsFloat, 8));
        VdadosIni.MontaLinha(0505, VdadosIni.TZero(dataSet.FieldByName('PERC_TB_VARE').AsFloat, 8));
        VdadosIni.MontaLinha(0513, dataSet.FieldByName('NBM').AsString);
        VdadosIni.MontaLinha(0521, StringReplace(dataSet.FieldByName('DATA_MOD_PR').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0529, VdadosIni.StrZero(dataSet.FieldByName('ATIVO').AsInteger, 6));
        VdadosIni.MontaLinha(0535, VdadosIni.TZero(dataSet.FieldByName('PESO_LIQ_PROD').AsFloat,
          8));
        VdadosIni.MontaLinha(0543, VdadosIni.TZero(dataSet.FieldByName('PESO_BRUT_PROD').AsFloat,
          8));
        VdadosIni.MontaLinha(0551, VdadosIni.StrZero(dataSet.FieldByName('COD_MARCA').AsInteger,
          6));
        VdadosIni.MontaLinha(0557, dataSet.FieldByName('TOT_ALIQ').AsString);
        VdadosIni.MontaLinha(0561, VdadosIni.StrZero(dataSet.FieldByName('COD_RECEITA').AsInteger,
          6));
        VdadosIni.MontaLinha(0567, dataSet.FieldByName('PERMITIR_DESCONTO').AsString);
        VdadosIni.MontaLinha(0568, dataSet.FieldByName('ARREDONDAR_TRUNCAR').AsString);
        VdadosIni.MontaLinha(0569, dataSet.FieldByName('EM_PROMOCAO').AsString);
        VdadosIni.MontaLinha(0570, VdadosIni.TZero(dataSet.FieldByName('PRECO_PROMOCAO').AsFloat,
          8));
        VdadosIni.MontaLinha(0578, dataSet.FieldByName('TIPO_FAB').AsString);
        VdadosIni.MontaLinha(0579, dataSet.FieldByName('CSDECQTDE').AsString);
        VdadosIni.MontaLinha(0580, dataSet.FieldByName('CSDECVLUNT').AsString);
        VdadosIni.MontaLinha(0581, dataSet.FieldByName('DESCR_PROD_RED').AsString);
        VdadosIni.MontaLinha(0616, dataSet.FieldByName('CONSUMO').AsString);

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;
end;

procedure TLayoutFiscal40.montaResumoD;
begin
  try
    montaSelect('select * from resumod where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and nserieecf = ' +
      QuotedStr(vDadosIni.vNumSerieEcf) + ' and data_mov >= :data1 and data_mov <= :data2', dataIni,
      dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Movimento Diário...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(191);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'RD');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('NSERIEECF').AsString);
        VdadosIni.MontaLinha(0029, StringReplace(dataSet.FieldByName('DATA_MOV').AsString, '/', '',
          [rfReplaceAll]));
        VdadosIni.MontaLinha(0037, VdadosIni.StrZero(dataSet.FieldByName('SEQINI').AsInteger, 6));
        VdadosIni.MontaLinha(0043, VdadosIni.StrZero(dataSet.FieldByName('SEQFIM').AsInteger, 6));
        VdadosIni.MontaLinha(0049, VdadosIni.TZero3dec(dataSet.FieldByName('VLVENDAB').AsCurrency,
          12));
        VdadosIni.MontaLinha(0061, VdadosIni.TZero3dec(dataSet.FieldByName('VLTOTGERAL').AsCurrency,
          12));
        VdadosIni.MontaLinha(0073, vDadosIni.StrZero(dataSet.FieldByName('CRO_MOV').AsInteger, 6));
        VdadosIni.MontaLinha(0079, vDadosIni.StrZero(dataSet.FieldByName('NREDUCOES').AsInteger,
          6));
        VdadosIni.MontaLinha(0085, vDadosIni.StrZero(dataSet.FieldByName('COORED').AsInteger, 6));
        VdadosIni.MontaLinha(0091, VdadosIni.TZero(dataSet.FieldByName('VLCANCEL').AsCurrency, 8));
        VdadosIni.MontaLinha(0099, VdadosIni.TZero(dataSet.FieldByName('VLACRESCIMO').AsCurrency,
          8));
        VdadosIni.MontaLinha(0107, VdadosIni.TZero(dataSet.FieldByName('VLDESCONTOS').AsCurrency,
          8));
        VdadosIni.MontaLinha(0115, VdadosIni.TZero3dec(dataSet.FieldByName('VLISS').AsCurrency,
          12));
        VdadosIni.MontaLinha(0127, VdadosIni.TZero3dec(dataSet.FieldByName('VLISENTOS').AsCurrency,
          12));
        VdadosIni.MontaLinha(0139,
          VdadosIni.TZero3dec(dataSet.FieldByName('VLNINCIDENCIA').AsCurrency, 12));
        VdadosIni.MontaLinha(0151, VdadosIni.TZero3dec(dataSet.FieldByName('VLSUBST').AsCurrency,
          12));
        VdadosIni.MontaLinha(0163, StringReplace(dataSet.FieldByName('DATA_EMISSAO_Z').AsString,
          '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0171, StringReplace(dataSet.FieldByName('HORA_EMISSAO_Z').AsString,
          '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0179, VdadosIni.TZero3dec(dataSet.FieldByName('VLTOTLIQ').AsCurrency,
          12));
        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;
end;

procedure TLayoutFiscal40.montaSangSup;
begin
  try
    montaSelect('select * from sangsup where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and nserieecf = ' +
      QuotedStr(vDadosIni.vNumSerieEcf) + ' and datalanc >= :data1 and datalanc <= :data2', dataIni,
      dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Sangria e Suprimentos...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(67);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'SS');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, VdadosIni.StrZero(dataSet.FieldByName('NREG').AsInteger, 6));
        VdadosIni.MontaLinha(0015, VdadosIni.TZero(dataSet.FieldByName('VALOR').AsCurrency, 8));
        VdadosIni.MontaLinha(0023, StringReplace(dataSet.FieldByName('DATALANC').AsString, '/', '',
          [rfReplaceAll]));
        VdadosIni.MontaLinha(0031, dataSet.FieldByName('SANGSUPRIMENTO').AsString);
        VdadosIni.MontaLinha(0041, dataSet.FieldByName('NSERIEECF').AsString);
        VdadosIni.MontaLinha(0061, vDadosIni.StrZero(dataSet.FieldByName('FINALIZADOR').AsInteger,
          6));
        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;
end;

procedure TLayoutFiscal40.montaSenhas;
begin
  try
    montaSelect('select * from senhas where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and DATA_MOD_S >= :data1 and DATA_MOD_S <= :data2', dataIni, dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Códigos de Barra...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(74);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'SN');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('CODIGO').AsString,6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('DEPART').AsString);
        VdadosIni.MontaLinha(0019, dataSet.FieldByName('USUARIO').AsString);
        VdadosIni.MontaLinha(0029, vDadosIni.decodifica(dataSet.FieldByName('senha').AsString));
        VdadosIni.MontaLinha(0035, vDadosIni.StrZero(dataSet.FieldByName('NIVEL_US').AsInteger,6));
        VdadosIni.MontaLinha(0041, dataSet.FieldByName('ALT_IMP').AsString);
        VdadosIni.MontaLinha(0042, dataSet.FieldByName('IMP_US').AsString);
        VdadosIni.MontaLinha(0057, dataSet.FieldByName('ESTOQ_NEG').AsString);
        VdadosIni.MontaLinha(0058, StringReplace(dataSet.FieldByName('DATA_CAD_S').AsString,'/','',[rfReplaceAll]));
        VdadosIni.MontaLinha(0066, StringReplace(dataSet.FieldByName('DATA_MOD_S').AsString,'/','',[rfReplaceAll]));

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;

end;

procedure TLayoutFiscal40.montaServicos;
begin
  try
    montaSelect('select * from tipo_servico where data_mod_tipo >= :data1' +
      ' and data_mod_tipo <= :data2' +
      ' AND COALESCE(COD_EMPRESA, ' + vDadosIni.codEmpresa + ') = ' + vDadosIni.codEmpresa, dataIni, dataFim);

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Serviços...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(120);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'SE');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_SERVICO').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('DESC_SERVICO').AsString);
        VdadosIni.MontaLinha(0069, VdadosIni.TZero(dataSet.FieldByName('VALOR_SERVICO').AsCurrency,
          8));
        VdadosIni.MontaLinha(0077, dataSet.FieldByName('ALTCOD').AsString);
        VdadosIni.MontaLinha(0078, StringReplace(dataSet.FieldByName('DATA_CAD_TIPO').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0086, StringReplace(dataSet.FieldByName('DATA_MOD_TIPO').AsString, '/',
          '', [rfReplaceAll]));
        VdadosIni.MontaLinha(0094, VdadosIni.TZero(dataSet.FieldByName('ALIQ_ISS').AsCurrency, 8));
        VdadosIni.MontaLinha(0102, VdadosIni.StrZero(dataSet.FieldByName('ATIVO').AsInteger, 6));
        VdadosIni.MontaLinha(0108, VdadosIni.TZero(dataSet.FieldByName('CODIGO_NOP').AsCurrency,
          8));
        VdadosIni.MontaLinha(0116, dataSet.FieldByName('ALT_DESC').AsString);
        VdadosIni.MontaLinha(0117, dataSet.FieldByName('ISENTO_SERV').AsString);
        VdadosIni.MontaLinha(0118, dataSet.FieldByName('N_INCIDENCIA_SERV').AsString);
        VdadosIni.MontaLinha(0119, dataSet.FieldByName('ARREDONDAR_TRUNCAR').AsString);

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;

end;

procedure TLayoutFiscal40.montaTipFinal;
begin
  try
    montaSelect('select * from finalizadores where cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_terminal = ' + vDadosIni.vCodTerminal + ' and nserieecf = ' +
      QuotedStr(vDadosIni.vNumSerieEcf) );

    dataSet.First;
    if not dataSet.IsEmpty then
    begin
      labelStatus.Caption := 'Montando Finalizadores...';
      vInc := 0;
      vMaxGauge := dataSet.RecordCount;
      labelStatus.Refresh;
      VdadosIni.auxstr := '';
      VdadosIni.auxstr := VdadosIni.Space(105);
      while not dataSet.Eof do
      begin
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        VdadosIni.MontaLinha(0001, 'TF');
        VdadosIni.MontaLinha(0003, VdadosIni.StrZero(dataSet.FieldByName('COD_TERMINAL').AsInteger,
          6));
        VdadosIni.MontaLinha(0009, dataSet.FieldByName('NSERIEECF').AsString);
        VdadosIni.MontaLinha(0029,
          VdadosIni.StrZero(dataSet.FieldByName('COD_FINALIZADOR').AsInteger, 6));
        VdadosIni.MontaLinha(0035, dataSet.FieldByName('DESCRICAO').AsString);
        VdadosIni.MontaLinha(0065, dataSet.FieldByName('VERIFICAR_DEBITO').AsString);
        VdadosIni.MontaLinha(0075, dataSet.FieldByName('VERIFICAR_CREDITO').AsString);
        VdadosIni.MontaLinha(0085,
          vDadosIni.StrZero(dataSet.FieldByName('TIPO_FINALIZADOR').AsInteger, 6));
        VdadosIni.MontaLinha(0091, VdadosIni.StrZero(dataSet.FieldByName('TECLA_PDV').AsInteger,
          6));

        Writeln(arqtxt, VdadosIni.auxstr);
        VdadosIni.LimpaLInha(VdadosIni.auxstr);
        dataSet.Next;

        Inc(vInc);
        vPosGauge := (vInc * 100) / vMaxGauge;
        vGauge.Progress := Trunc(vPosGauge);

        if cancelar then
          exit;
      end;
      vGauge.Progress := 0;
    end;
  finally
    dataSet.Close;
  end;
end;

procedure TLayoutFiscal40.processaclientes;
var
  tempInt: Integer;
begin
try
  montaSelect('select * from clientes where cod_cliente = ' + Copy(linha, 3, 6) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
  if not dataSet.IsEmpty then
    dataSet.edit
  else
  begin
    dataSet.Append;
    dataSet.FieldByName('cod_cliente').AsInteger := transformainteiro(Copy(linha, 3, 6));
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  end;
  dataSet.FieldByName('NOME_CLIENTE').Value := copy(linha, 9, 35);
  dataSet.FieldByName('ENDERECO').Value := copy(linha, 44, 50);
  dataSet.FieldByName('BAIRRO').Value := copy(linha, 94, 35);
  dataSet.FieldByName('CIDADE').Value := copy(linha, 129, 35);
  dataSet.FieldByName('CODIGO_UF').AsInteger := retornaCodigoUF(copy(linha, 164, 2));
  dataSet.FieldByName('CPFCGC').Value := Copy(linha, 166, 18);
  dataSet.FieldByName('INSC_EST').Value := copy(linha, 184, 18);
  dataSet.FieldByName('FONE_CLIENTE').Value := Copy(linha, 202, 13);
  dataSet.FieldByName('RAZAO').Value := Copy(linha, 215, 60);
  dataSet.FieldByName('CEP').Value := Copy(linha, 275, 9);
  dataSet.FieldByName('TIPVCLIENTE').asstring := Copy(linha, 284, 1);
  dataSet.FieldByName('CODIGO_FATURAMENTO').Value := transformainteiro(Copy(linha, 285, 4));
  if dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger = 0 then
    dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger := 1;
  tempInt:= transformainteiro(Copy(linha, 289, 4));
  if tempInt <> 0 then
  dataSet.FieldByName('CODIGO_TIPO').asInteger := tempInt;
  dataSet.FieldByName('EST_CODIGO_UF').asInteger := retornaCodigoUF(Copy(linha, 293, 2));
  dataSet.FieldByName('FAX').Value := Copy(linha, 295, 14);
  dataSet.FieldByName('CIDA_COBRANCA').Value := Copy(linha, 309, 30);
  dataSet.FieldByName('CEP_COBRANCA').Value := Copy(linha, 339, 9);
  dataSet.FieldByName('OBSERVACAO').Value := Copy(linha, 348, 200);
  dataSet.FieldByName('DATA_CADASTRO').Value := transformadata(Copy(linha, 548, 8));
  dataSet.FieldByName('CONTATO').Value := Copy(linha, 556, 10);
  dataSet.FieldByName('NATURALID').Value := Copy(linha, 566, 20);
  dataSet.FieldByName('CONJUGE').Value := Copy(linha, 586, 35);
  dataSet.FieldByName('RG').Value := Copy(linha, 621, 10);
  dataSet.FieldByName('EXPEDIC').Value := transformadata(copy(linha, 631, 8));
  dataSet.FieldByName('ORG_EXPEDIC').Value := Copy(linha, 639, 20);
  dataSet.FieldByName('CTPS').Value := Copy(linha, 659, 10);
  dataSet.FieldByName('US_CAD_CLI').AsInteger := transformainteiro(Copy(linha, 669, 6));
  dataSet.FieldByName('END_COBRANCA').Value := Copy(linha, 675, 50);
  dataSet.FieldByName('BAIRRO_COBRANCA').Value := Copy(linha, 725, 35);
  dataSet.FieldByName('PAI').Value := Copy(linha, 760, 35);
  dataSet.FieldByName('MAE').Value := Copy(linha, 795, 35);
  dataSet.FieldByName('DATA_NASC').Value := transformadata(Copy(linha, 830, 8));
  dataSet.FieldByName('EMAIL').Value := Copy(linha, 838, 50);
  dataSet.FieldByName('DIA_VENC').Value := transformainteiro(Copy(linha, 888, 6));
  dataSet.FieldByName('DATA_MOD_CAD').Value := transformadata(Copy(linha, 894, 8));
  dataSet.FieldByName('TIPOCLIENTE').Value := Copy(linha, 902, 6);
  dataSet.FieldByName('SEXO').Value := Copy(linha, 908, 1);
  dataSet.FieldByName('RAMO_ATIVIDADE').Value := Copy(linha, 909, 60);
  dataSet.FieldByName('COD_CIDADE').Value := transformainteiro(Copy(linha, 969, 6));
  dataSet.FieldByName('COD_BAIRRO').Value := transformainteiro(Copy(linha, 975, 6));
  dataSet.FieldByName('COD_CIDADE_COBRANCA').Value := transformainteiro(Copy(linha, 981, 6));
  dataSet.FieldByName('COD_BAIRRO_COBRANCA').Value := transformainteiro(Copy(linha, 987, 6));
  dataSet.FieldByName('ESTADO_CIVIL').Value := Copy(linha, 993, 12);
  dataSet.FieldByName('PERC_DESC').Value := transformafloat(Copy(linha, 1005, 8));
  dataSet.FieldByName('BARRADO').Value := Copy(linha, 1013, 1);
  dataSet.FieldByName('NUM_END_CLIENTE').AsString := Trim(Copy(linha, 1014, 6));
  if (trim(dataSet.FieldByName('CIDADE').AsString) <> '') then
    dataSet.FieldByName('COD_CIDADE').AsInteger :=
      retornaCodigoCidade(trim(dataSet.FieldByName('CIDADE').AsString));
  if (trim(dataSet.FieldByName('BAIRRO').AsString) <> '') then
    dataSet.FieldByName('COD_BAIRRO').AsInteger :=
      retornaCodigoCidade(trim(dataSet.FieldByName('BAIRRO').AsString));
  if (trim(dataSet.FieldByName('CIDA_COBRANCA').AsString) <> '') then
    dataSet.FieldByName('COD_CIDADE_COBRANCA').AsInteger :=
      retornaCodigoCidade(trim(dataSet.FieldByName('CIDA_COBRANCA').AsString));
  if (trim(dataSet.FieldByName('BAIRRO_COBRANCA').AsString) <> '') then
    dataSet.FieldByName('COD_BAIRRO_COBRANCA').AsInteger :=
      retornaCodigoCidade(trim(dataSet.FieldByName('BAIRRO_COBRANCA').AsString));

    dataSet.Post;
    Apply;
  except
    on e: exception do begin
      dataSet.Cancel;
    end;
  end;
end;

procedure TLayoutFiscal40.processaCodBarras;
var
  codBarra: string;
  grupo: string;
  codigo: string;
begin
try
  codBarra := copy(linha, 3, 20);
  grupo := copy(linha, 23, 6);
  codigo := copy(linha, 29, 6);
  montaSelect('select * from cod_barra where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cod_barra = ' + QuotedStr(Trim(codBarra)) + ' and grupo_prod = ' + Trim(grupo) +
    ' and cod_prod = ' + QuotedStr(trim(codigo)));
  if not dataSet.IsEmpty then
    dataSet.edit
  else
  begin
    dataSet.Append;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('cod_barra').Value := Trim(codBarra);
    dataSet.FieldByName('cod_prod').Value := Trim(codigo);
    dataSet.FieldByName('grupo_prod').Value := Trim(grupo);
  end;
  dataSet.FieldByName('DAT_CAD_CDBAR').Value := transformadata(copy(linha, 35, 8));
  dataSet.FieldByName('DAT_MOD_CDBAR').Value := transformadata(copy(linha, 43, 8));
  try
    dataSet.FieldByName('ATIVO').Value := Trim(Copy(linha, 51, 6));
  except
    dataSet.FieldByName('ATIVO').Value := 1;// transformainteiro(Copy(linha, 51, 6));
  end;
  
    dataSet.Post;
    Apply;
  except
    on e: exception do begin
      dataSet.Cancel;
    end;
  end;
end;

procedure TLayoutFiscal40.processaEmpresa;
begin
try
  montaSelect('select * from empresa where cod_empresa = ' + Copy(linha, 3, 6));
  if not dataSet.IsEmpty then
    dataSet.edit
  else
  begin
    dataSet.Append;
    dataSet.FieldByName('cod_empresa').AsInteger := transformainteiro(Copy(linha, 3, 6));
  end;
  dataSet.FieldByName('NOME_EMP').Value := copy(linha, 9, 50);
  dataSet.FieldByName('ENDRECO_EMP').Value := copy(linha, 59, 50);
  dataSet.FieldByName('BAIRRO_EMP').Value := copy(linha, 109, 30);
  dataSet.FieldByName('CIDADE_EMP').Value := copy(linha, 139, 30);
  dataSet.FieldByName('CEP_EMP').Value := copy(linha, 169, 9);
  dataSet.FieldByName('CNPJ_EMP').Value := Copy(linha, 178, 18);
  dataSet.FieldByName('IE_EMP').Value := copy(linha, 196, 18);
  dataSet.FieldByName('IM_EMP').Value := Copy(linha, 214, 18);
  dataSet.FieldByName('TELEFONE_EMP').Value := Copy(linha, 232, 14);
  dataSet.FieldByName('NUMERO_END').Value := transformainteiro(Copy(linha, 246, 6));
  dataSet.FieldByName('PROP_EMP').Value := Copy(linha, 252, 40);
  dataSet.FieldByName('uf_emp').Value := retornaCodigoUF(Copy(linha, 292, 2));
  dataSet.FieldByName('estado_emp').Value := Copy(linha, 292, 2);
  dataSet.FieldByName('AUT_SERV_CUPOM').Value := Copy(linha, 294, 1);
  dataSet.FieldByName('COPIAR_HWF_TERM_RET').Value := Copy(linha, 295, 1);

    dataSet.Post;
    Apply;
  except
    on e: exception do begin
      dataSet.Cancel;
    end;
  end;
end;

procedure TLayoutFiscal40.processaFuncionarios;
begin
try
  montaSelect('select * from colaborador where cod_vendedor = ' + Copy(linha, 3, 6) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);
  if not dataSet.IsEmpty then
    dataSet.edit
  else
  begin
    dataSet.Append;
    dataSet.FieldByName('COD_VENDEDOR').AsInteger := transformainteiro(Copy(linha, 3, 6));
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  end;
  dataSet.FieldByName('CODIGO_UF').Value := retornaCodigoUF(copy(linha, 9, 2));
  if ExecutaComandosSql('select COD_FUNCAO from funcoes where cod_funcao = ' +
    IntToStr(transformainteiro(copy(linha, 11, 6)))) then
    dataSet.FieldByName('COD_FUNCAO').Value := transformainteiro(copy(linha, 11, 6));
  dataSet.FieldByName('NOME_VENDEDOR').Value := copy(linha, 17, 35);
  dataSet.FieldByName('END_VENDEDOR').Value := copy(linha, 52, 35);
  dataSet.FieldByName('BAIRRO_VENDEDOR').AsString := copy(linha, 87, 35);
  dataSet.FieldByName('CIDADE_VENDEDOR').Value := Copy(linha, 122, 35);
  dataSet.FieldByName('CEP_VENDEDOR').Value := copy(linha, 157, 9);
  dataSet.FieldByName('FONE_VENDEDOR').Value := Copy(linha, 166, 14);
  dataSet.FieldByName('CPF_VENDEDOR').Value := Copy(linha, 180, 11);
  dataSet.FieldByName('OBS_VENDEDOR').Value := Copy(linha, 191, 200);
  dataSet.FieldByName('DATA_MOD_COL').Value := transformadata(Copy(linha, 391, 8));
  dataSet.FieldByName('DATA_CAD_COL').Value := transformadata(Copy(linha, 399, 8));
  dataSet.FieldByName('DAT_NASC_COL').Value := transformadata(Copy(linha, 407, 8));
  dataSet.FieldByName('COD_CIDADE').Value := transformainteiro(Copy(linha, 415, 6));
  dataSet.FieldByName('COD_BAIRRO').Value := transformainteiro(Copy(linha, 421, 6));
  dataSet.FieldByName('SALARIO_REGISTRO').Value := transformafloat(Copy(linha, 427, 8));
  dataSet.FieldByName('ATIVO').Value := transformainteiro(Copy(linha, 435, 6));
  dataSet.FieldByName('EMAIL').Value := Copy(linha, 441, 50);
  dataSet.FieldByName('FONE_CONTATO').Value := Copy(linha, 491, 40);

  if (trim(dataSet.FieldByName('CIDADE_VENDEDOR').AsString) <> '') then
    dataSet.FieldByName('COD_CIDADE').AsInteger :=
      retornaCodigoCidade(trim(dataSet.FieldByName('CIDADE_VENDEDOR').AsString));
  if (trim(dataSet.FieldByName('BAIRRO_VENDEDOR').AsString) <> '') then
    dataSet.FieldByName('COD_BAIRRO').AsInteger :=
      retornaCodigoCidade(trim(dataSet.FieldByName('BAIRRO_VENDEDOR').AsString));
  
    dataSet.Post;
    Apply;
  except
    on e: exception do begin
      dataSet.Cancel;
    end;
  end;
end;

procedure TLayoutFiscal40.processaProdutos;
var
  grupo, codigo: string;
begin
  try
    grupo := IntToStr(transformainteiro(Copy(linha, 3, 6)));
  except
    Exit;
  end;
  try
  codigo := trim(Copy(linha, 9, 6));

  montaSelect('select * from produtos where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cod_prod = ' + QuotedStr(codigo) + ' and grupo_prod = ' + grupo);
  if not dataSet.IsEmpty then
    dataSet.edit
  else
  begin
    dataSet.Append;
    dataSet.FieldByName('grupo_prod').AsString := grupo;
    dataSet.FieldByName('cod_prod').AsString := codigo;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
  end;
  dataSet.FieldByName('CODIGO_NOP').AsFloat := transformainteiro(copy(linha, 15, 8));
  dataSet.FieldByName('EST_F').AsFloat := transformafloat(copy(linha, 23, 8));
  dataSet.FieldByName('PREC_CUS_PROD').Value := transformafloat(copy(linha, 31, 8));
  dataSet.FieldByName('PREC_TAB_PROD').Value := transformafloat(copy(linha, 39, 8));
  dataSet.FieldByName('LOCACAO_PROD').AsString := copy(linha, 47, 8);
  dataSet.FieldByName('LOCACAO_PROD_1').Value := Copy(linha, 55, 8);
  dataSet.FieldByName('APLICACAO_PROD').Value := copy(linha, 63, 150);
  dataSet.FieldByName('DATA_ULT_COMPRA').Value := transformadata(Copy(linha, 213, 8));
  dataSet.FieldByName('VL_ULT_COMPRA').Value := transformafloat(Copy(linha, 221, 8));
  dataSet.FieldByName('DESCR_PROD').Value := Copy(linha, 229, 75);
  dataSet.FieldByName('IPI_PROD').Value := transformafloat(Copy(linha, 304, 8));
  dataSet.FieldByName('NUM_NF_REC').Value := transformainteiro(Copy(linha, 312, 6));
  dataSet.FieldByName('ICM_PROD').Value := transformafloat(Copy(linha, 318, 8));
  dataSet.FieldByName('PERC_TB_PROD').Value := transformafloat(Copy(linha, 326, 8));
  dataSet.FieldByName('NUM_FAB_PROD').Value := Copy(linha, 334, 20);
  dataSet.FieldByName('PREC_30_PROD').Value := transformafloat(Copy(linha, 354, 8));
  dataSet.FieldByName('PREC_60_PROD').Value := transformafloat(Copy(linha, 362, 8));
  dataSet.FieldByName('PREC_90_PROD').Value := transformafloat(Copy(linha, 370, 8));
  dataSet.FieldByName('MARCA_P').Value := Copy(linha, 378, 10);
  dataSet.FieldByName('ALT_COD_CUPOM').Value := Copy(linha, 388, 1);
  dataSet.FieldByName('PERC_RED_PROD').Value := transformafloat(Copy(linha, 389, 8));
  dataSet.FieldByName('ISENTO_PROD').Value := Copy(linha, 397, 1);
  dataSet.FieldByName('N_INCIDENCIA_PROD').Value := Copy(linha, 398, 1);
  dataSet.FieldByName('UNIDADE').Value := Copy(linha, 399, 3);
  dataSet.FieldByName('PERC_TB_PROD3').Value := transformafloat(Copy(linha, 402, 8));
  dataSet.FieldByName('PERC_TB_PROD6').Value := transformafloat(Copy(linha, 410, 8));
  dataSet.FieldByName('PERC_TB_PROD9').Value := transformafloat(Copy(linha, 418, 8));
  dataSet.FieldByName('ALT_DESC_CUPOM').Value := Copy(linha, 426, 1);
  dataSet.FieldByName('CST_PROD').Value := Copy(linha, 427, 3);
  dataSet.FieldByName('PREC_PUBLICO').Value := transformafloat(Copy(linha, 430, 8));
  dataSet.FieldByName('COD_PPS').Value := Copy(linha, 438, 2);
  dataSet.FieldByName('DAT_CAD_PROD').Value := transformadata(Copy(linha, 440, 8));
  dataSet.FieldByName('DAT_MOD_PROD').Value := transformadata(Copy(linha, 448, 8));
  dataSet.FieldByName('ISENTO_PIS').Value := Copy(linha, 456, 1);
  dataSet.FieldByName('EMB_PROD').Value := Copy(linha, 457, 10);
  dataSet.FieldByName('QTDEMB').Value := transformafloat(Copy(linha, 467, 8));
  dataSet.FieldByName('BALANCA_PROD').Value := Copy(linha, 475, 1);
  dataSet.FieldByName('VALIDADE_PROD').Value := transformadata(Copy(linha, 476, 8));
  dataSet.FieldByName('ALIQ_RED_PROD').Value := transformafloat(Copy(linha, 484, 8));
  dataSet.FieldByName('TIP_PROD_IND').Value := Copy(linha, 492, 5);
  dataSet.FieldByName('PERC_TB_ATAC').Value := transformafloat(Copy(linha, 497, 8));
  dataSet.FieldByName('PERC_TB_VARE').Value := transformafloat(Copy(linha, 505, 8));
  dataSet.FieldByName('NBM').Value := Copy(linha, 513, 8);
  dataSet.FieldByName('DATA_MOD_PR').Value := transformadata(Copy(linha, 521, 8));
  try
    dataSet.FieldByName('ATIVO').AsString := Trim(Copy(linha, 529, 6));
  except
    dataSet.FieldByName('ATIVO').Value := 1;// transformainteiro(Copy(linha, 529, 6));
  end;
  dataSet.FieldByName('PESO_LIQ_PROD').Value := transformafloat(Copy(linha, 535, 8));
  dataSet.FieldByName('PESO_BRUT_PROD').Value := transformafloat(Copy(linha, 543, 8));
  dataSet.FieldByName('COD_MARCA').Value := transformainteiro(Copy(linha, 551, 6));
  dataSet.FieldByName('TOT_ALIQ').Value := Copy(linha, 557, 4);
  dataSet.FieldByName('COD_RECEITA').Value := transformainteiro(Copy(linha, 561, 6));
  dataSet.FieldByName('PERMITIR_DESCONTO').Value := Copy(linha, 567, 1);
  dataSet.FieldByName('ARREDONDAR_TRUNCAR').Value := Copy(linha, 568, 1);
  dataSet.FieldByName('EM_PROMOCAO').Value := Copy(linha, 569, 1);
  dataSet.FieldByName('PRECO_PROMOCAO').Value := transformafloat(Copy(linha, 570, 8));
  dataSet.FieldByName('TIPO_FAB').Value := Copy(linha, 578, 1);
  dataSet.FieldByName('CSDECQTDE').Value := Copy(linha, 579, 1);
  dataSet.FieldByName('CSDECVLUNT').Value := Copy(linha, 580, 1);
  dataSet.FieldByName('DESCR_PROD_RED').Value := Copy(linha, 581, 35);
  dataSet.FieldByName('CONSUMO').Value := Copy(linha, 616, 1);

    dataSet.Post;
    Apply;
  except
    on e: exception do begin
      dataSet.Cancel;
    end;
  end;
end;

procedure TLayoutFiscal40.processaSenhas;
begin
try
  montaSelect('select * from senhas where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and usuario = ' + QuotedStr(Trim(Copy(linha, 19, 10))));
  if not dataSet.IsEmpty then
    dataSet.edit
  else
  begin
    dataSet.Append;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('CODIGO').Value := copy(linha, 3, 6);
    dataSet.FieldByName('USUARIO').Value := copy(linha, 19, 10);
  end;
  dataSet.FieldByName('DEPART').Value := copy(linha, 9, 10);
  dataSet.FieldByName('SENHA').Value := vDadosIni.codifica(copy(linha, 29, 6));
  dataSet.FieldByName('NIVEL_US').Value := transformainteiro(copy(linha, 35, 6));
  dataSet.FieldByName('ALT_IMP').Value := copy(linha, 41, 1);
  dataSet.FieldByName('IMP_US').Value := copy(linha, 42, 15);
  dataSet.FieldByName('ESTOQ_NEG').Value := Copy(linha, 57, 1);
  dataSet.FieldByName('DATA_CAD_S').Value := transformadata(Copy(linha, 58, 8));
  dataSet.FieldByName('DATA_MOD_S').Value := transformadata(Copy(linha, 66, 8));

    dataSet.Post;
    Apply;
  except
    on e: exception do begin
      dataSet.Cancel;
    end;
  end;
end;

procedure TLayoutFiscal40.processaServicos;
begin
try
  montaSelect('select * from tipo_servico where cod_Servico = ' + Copy(linha, 3, 6));
  if not dataSet.IsEmpty then
    dataSet.edit
  else
  begin
    dataSet.Append;
    dataSet.FieldByName('cod_servico').AsInteger := transformainteiro(Copy(linha, 3, 6));
  end;
  dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.FieldByName('DESC_SERVICO').Value := copy(linha, 9, 60);
  dataSet.FieldByName('VALOR_SERVICO').Value := transformafloat(copy(linha, 69, 8));
  dataSet.FieldByName('ALTCOD').Value := copy(linha, 77, 1);
  dataSet.FieldByName('DATA_CAD_TIPO').Value := transformadata(copy(linha, 78, 8));
  dataSet.FieldByName('DATA_MOD_TIPO').Value := transformadata(copy(linha, 86, 8));
  dataSet.FieldByName('ALIQ_ISS').Value := transformafloat(Copy(linha, 94, 8));
  dataSet.FieldByName('ATIVO').Value := transformainteiro(copy(linha, 102, 6));
  dataSet.FieldByName('CODIGO_NOP').Value := transformafloat(Copy(linha, 108, 8));
  dataSet.FieldByName('ALT_DESC').Value := Copy(linha, 116, 1);
  dataSet.FieldByName('ISENTO_SERV').Value := Copy(linha, 117, 1);
  dataSet.FieldByName('N_INCIDENCIA_SERV').Value := Copy(linha, 118, 1);
  dataSet.FieldByName('ARREDONDAR_TRUNCAR').Value := Copy(linha, 119, 1);

    dataSet.Post;
    Apply;
  except
    on e: exception do begin
      dataSet.Cancel;
    end;
  end;
end;

function TLayoutFiscal40.retornaCodigoBairro(bairro: string): integer;
var
  temp: string;
begin
  temp := retornaValor('select cod_bairro as valor from bairros where nome_bairro = ' + QuotedStr(bairro));
  if temp = '' then
    Result := 0
  else
  begin
    try
      Result := StrToInt(temp);
    except
      Result := 0;
    end;
  end;
  if Result = 0 then
  begin
    temp := trim(retornaValor('select gen_id(inc_cod_bairro,0) as valor from rdb$database'));
    if temp = '' then
      Exit;
    if ExecutaComandosSqlExec('insert into bairros (nome_Bairro,cod_usuario) values (' +
      QuotedStr(bairro) +
      ',' + IntToStr(vDadosIni.vCodUsuario) + ')') then
    try
      Result := StrToInt(temp);
    except
      Result := 0;
    end;
  end;
end;

function TLayoutFiscal40.retornaCodigoCidade(cidade: string): integer;
var
  temp: string;
begin
  temp := retornaValor('select cod_cidade as valor from cidades where nome_cidade = ' + QuotedStr(cidade));
  if temp = '' then
    Result := 0
  else
  begin
    try
      Result := StrToInt(temp);
    except
      Result := 0;
    end;
  end;
  if Result = 0 then
  begin
    temp := trim(retornaValor('select gen_id(INC_COD_CIDADE,0) as valor from rdb$database'));
    if temp = '' then
      Exit;
    if ExecutaComandosSqlExec('insert into cidades (nome_cidade,cod_usuario) values (' +
      QuotedStr(cidade) +
      ',' + IntToStr(vDadosIni.vCodUsuario) + ')') then
    try
      Result := StrToInt(temp);
    except
      Result := 0;
    end;
  end;
end;

function TLayoutFiscal40.retornaCodigoUF(sigla: string): Integer;
var
  temp: string;
begin

  temp := trim(retornaValor('select codigo_uf as valor from estados where sigla_uf = ' +
    QuotedStr(sigla)));
  if temp = '' then
    Result := 0
  else
  begin
    try
      Result := StrToInt(temp);
    except
      Result := 0;
    end;
  end;
end;

function TLayoutFiscal40.transformadata(data: string): TDate;
begin
  try
    result := StrToDate(Copy(data, 1, 2) + '/' + Copy(data, 3, 2) + '/' + Copy(data, 5, 4));
  except
    result := 0;
  end;
end;

function TLayoutFiscal40.transformafloat(valor: string): Double;
var
  vdouble: Double;
  temp: string;
begin
  try
    temp := Copy(valor, 1, 6) + ',' + Copy(valor, 7, 2);
    vdouble := StrToFloat(temp);
    Result := vdouble;
  except
    result := 0;
  end;
end;

function TLayoutFiscal40.transformafloat3Dec(valor: string): Double;
var
  vdouble: Double;
  temp: string;
begin
  try
    temp := Copy(valor, 1, 9) + ',' + Copy(valor, 10, 3);
    vdouble := StrToFloat(temp);
    Result := vdouble;
  except
    result := 0;
  end;
end;

function TLayoutFiscal40.transformainteiro(valor: string): integer;
var
  inteiro: integer;
begin
  try
    inteiro := StrToInt(valor);
    result := inteiro;
  except
    result := 0;
  end;
end;

{ TTerminalConfig }

//function TTerminalConfig.abreTerminais: boolean;
//begin
//  montaSelect('select * from terminalf where  ativo = 1 and cod_empresa  = ' +
//    vDadosIni.codEmpresa);
//end;

//constructor TTerminalConfig.create;
//begin
//  if dtmTerminaisF = nil then
//    dtmTerminaisF := TdtmTerminaisF.Create(dtmTerminaisF);
//  dataSet := TClientDataSet(dtmTerminaisF.cdsTerminalConfig);
//  buscas := TIBQuery(dtmTerminaisF.IbTerminalF);
//  transacao := TIBTransaction(dtmTerminaisF.TsTerminalF);
//  vLayout := TLayoutFiscal40.create;
//end;

end.

