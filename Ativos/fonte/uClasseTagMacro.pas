unit uClasseTagMacro;

interface

uses
{$IFDEF VER180}
	IBQuery, IBSQL, IBDatabase, DBClient, Provider, DB, Math, Controls, Classes, IniFiles, Types,
{$ELSE}
  IBX.IBDatabase, IBX.IBQuery, IBX.IBSQL, DataSnap.DBClient, DataSnap.Provider, Data.DB, System.Math, System.Classes, System.IniFiles, System.Types,
{$ENDIF}
	hw_utils,
  hw_win_utils,
	Query_OOP,
  Types_OOP,
  uClasseConexao;

type
  TTagMacro = class(TConexao)
  public
    function retornaVariaveisTemplate(
      pOrigem: string;
      pCodCarta: Integer;
      pCodEmpresa: Integer;
      pCodCliente: Integer;
      pNDoc: string;
      pTipo: string;
      pDtCarta: TDateTime;
      pDiasAtraso: integer;
      pCtrlCarta: string;
      pFinanceiroUnificado: Boolean;
      pCodigoUnificada: Integer;
      pCampo: string = 'DADOS_CARTA';
      pContato: string = '';
      pIdentificacao: string = '';
      pAplicativo: string = '';
      pPlataforma: string = '';
      pUrlAnexo: string = '') : TStringDynArray;
  	function _TrocaTAGsMacro(
      pOrigem: string;
      pCodCarta: Integer;
      pCodEmpresa: Integer;
      pCodCliente: Integer;
      pNDoc: string;
      pTipo: string;
      pDtCarta: TDateTime;
      pDiasAtraso: integer;
      pCtrlCarta: string;
      pFinanceiroUnificado: Boolean;
      pCodigoUnificada: Integer;
      pCampo: string = 'DADOS_CARTA';
      pContato: string = '';
      pIdentificacao: string = '';
      pAplicativo: string = '';
      pPlataforma: string = '';
      pUrlAnexo: string = ''): string;
    function _retornaValorMacro(
      pOrigem: string;
      pNomeMacro: string;
      pCodCarta: Integer;
      pCodEmpresa: Integer;
      pCodCliente: Integer;
      pNDoc: string;
      pTipoDoc: string;
      pDataCarta: TDateTime = 0;
      pDiasAtraso: integer = 0;
      pControlesCarta: string = '-1';
      pFinanceiroUnificado: Boolean = False;
      pCodigoUnificada: Integer = 0;
      pContato: string = '';
      pIdentificacao: string = '';
      pAplicativo: string = '';
      pPlataforma: string = '';
      pUrlAnexo: string = ''): string;
  end;

  Conexao_OOP = TConexao_OOP;

implementation

uses
{$IFDEF VER180}
	Forms,
  SysUtils,
  StrUtils;
{$ELSE}
	Vcl.Forms, 
  System.SysUtils,
  System.StrUtils;
{$ENDIF}

{ TTagMacro }

function TTagMacro.retornaVariaveisTemplate(
  pOrigem: string;
  pCodCarta: Integer;
  pCodEmpresa: Integer;
  pCodCliente: Integer;
  pNDoc: string;
  pTipo: string;
  pDtCarta: TDateTime;
  pDiasAtraso: integer;
  pCtrlCarta: string;
  pFinanceiroUnificado: Boolean;
  pCodigoUnificada: Integer;
  pCampo: string = 'DADOS_CARTA';
  pContato: string = '';
  pIdentificacao: string = '';
  pAplicativo: string = '';
  pPlataforma: string = '';
  pUrlAnexo: string = ''): TStringDynArray;
var
  vDados: string;
	Tamanho, Contador, FixoInicial, FixoFinal: Integer;
  VariavelMacro, ValorMacro: string;
  vOK: Boolean;
begin
  SetLength(Result, 0);

  QrAux.Close;
  QrAux.SQL.Text := ' select * from modcartas ' +
    ' where cod_carta = ' + IntToStr(pCodCarta) +
    ' and cod_empresa = ' + IntToStr(pCodEmpresa) +
    ' and ativo = 1 ';
  QrAux.Open;

  vDados      := QrAux.FieldByName(pCampo).AsVariant;

  Tamanho := length(vDados);
  FixoInicial := 0;
  FixoFinal := 0;
  Contador := 0;
  while Contador < Tamanho do
  begin
    if (trim(pAplicativo) = 'E-MAIL') then
    begin
      if (vDados[Contador] = '{') and ((vDados[Contador + 1] = '#') or (vDados[Contador + 1] = '*')) then
        FixoInicial := Contador + 2;
    end
    else if (trim(pAplicativo) = 'WHATSAPP') or (trim(pAplicativo) = 'TELEGRAM') then
    begin
      if (vDados[Contador] = '{') and (vDados[Contador + 1] = '{') then
        FixoInicial := Contador + 2;
    end
    else
    begin
      if (vDados[Contador] = '<') and ((vDados[Contador + 1] = '#') or (vDados[Contador + 1] = '*')) then
        FixoInicial := Contador + 2;
    end;

    vOK := False;
    if (trim(pAplicativo) = 'E-MAIL') then
    begin
      if (vDados[Contador] = '}') and (FixoInicial > 0) then
        vOK := True;
    end
    else if (trim(pAplicativo) = 'WHATSAPP') or (trim(pAplicativo) = 'TELEGRAM') then
    begin
      if (vDados[Contador] = '}') and (vDados[Contador + 1] = '}') and (FixoInicial > 0) then
        vOK := True;
    end
    else
    begin
      if (vDados[Contador] = '>') and (FixoInicial > 0) then
        vOK := True;
    end;

    if (vOK) then
    begin
      FixoFinal := Contador;
      VariavelMacro := copy(vDados, FixoInicial, (FixoFinal - FixoInicial));
      if VariavelMacro = 'INI' then
        ValorMacro := '\INI'
      else
      begin
        ValorMacro :=
          _retornaValorMacro(
            pOrigem,
            VariavelMacro,
            pCodCarta,
            pCodEmpresa,
            pCodCliente,
            pNDoc,
            pTipo,
            pDtCarta,
            pDiasAtraso,
            pCtrlCarta,
            pFinanceiroUnificado,
            pCodigoUnificada,
            pContato,
            pIdentificacao,
            pAplicativo,
            pPlataforma,
            pUrlAnexo
          );

        SetLength(Result, Length(Result) + 1);
        Result[Length(Result) - 1] := VariavelMacro + '|' + trim(ValorMacro) + '|';
      end;
      ValorMacro := trim(ValorMacro);
      //O novo Valor para os vDados já tirado a macro
      if trim(pAplicativo) = 'E-MAIL' then
        vDados := Copy(vDados, 1, FixoInicial - 3) + ValorMacro + Copy(vDados, FixoFinal + 1, (Tamanho - FixoFinal + 1))
      else
        vDados := Copy(vDados, 1, FixoInicial - 3) + ValorMacro + Copy(vDados, FixoFinal + 2, (Tamanho - FixoFinal + 2));
      Tamanho := length(vDados);
      Contador := 0;
      FixoFinal := 0;
    end
    else
      Inc(Contador);
  end;
end;

function TTagMacro._TrocaTAGsMacro(
	pOrigem: string;
  pCodCarta: Integer;
  pCodEmpresa: Integer;
  pCodCliente: Integer;
  pNDoc: string;
  pTipo: string;
  pDtCarta: TDateTime;
  pDiasAtraso: integer;
  pCtrlCarta: string;
  pFinanceiroUnificado: Boolean;
  pCodigoUnificada: Integer;
  pCampo: string = 'DADOS_CARTA';
  pContato: string = '';
  pIdentificacao: string = '';
  pAplicativo: string = '';
  pPlataforma: string = '';
  pUrlAnexo: string = ''): string;
var
  vDados: string;
	Tamanho, Contador, FixoInicial, FixoFinal: Integer;
  VariavelMacro, ValorMacro: string;
  vOK: Boolean;
begin
  QrAux.Close;
  QrAux.SQL.Text := ' select * from modcartas ' +
    ' where cod_carta = ' + IntToStr(pCodCarta) +
    ' and cod_empresa = ' + IntToStr(pCodEmpresa) +
    ' and ativo = 1 ';
  QrAux.Open;

  vDados      := QrAux.FieldByName(pCampo).AsVariant;

  Tamanho := length(vDados);
  FixoInicial := 0;
  FixoFinal := 0;
  Contador := 0;
  while Contador < Tamanho do
  begin
    if (trim(pAplicativo) = 'E-MAIL') then
    begin
      if (vDados[Contador] = '{') and ((vDados[Contador + 1] = '#') or (vDados[Contador + 1] = '*')) then
        FixoInicial := Contador + 2;
    end
    else if (trim(pAplicativo) = 'WHATSAPP') or (trim(pAplicativo) = 'TELEGRAM') then
    begin
      if (vDados[Contador] = '{') and (vDados[Contador + 1] = '{') then
        FixoInicial := Contador + 2;
    end
    else
    begin
      if (vDados[Contador] = '<') and ((vDados[Contador + 1] = '#') or (vDados[Contador + 1] = '*')) then
        FixoInicial := Contador + 2;
    end;

    vOK := False;
    if (trim(pAplicativo) = 'E-MAIL') then
    begin
      if (vDados[Contador] = '}') and (FixoInicial > 0) then
        vOK := True;
    end
    else if (trim(pAplicativo) = 'WHATSAPP') or (trim(pAplicativo) = 'TELEGRAM') then
    begin
      if (vDados[Contador] = '}') and (vDados[Contador + 1] = '}') and (FixoInicial > 0) then
        vOK := True;
    end
    else
    begin
      if (vDados[Contador] = '>') and (FixoInicial > 0) then
        vOK := True;
    end;

    if (vOK) then
    begin
      FixoFinal := Contador;
      VariavelMacro := copy(vDados, FixoInicial, (FixoFinal - FixoInicial));
      if VariavelMacro = 'INI' then
        ValorMacro := '\INI'
      else
        ValorMacro := trim(
          _retornaValorMacro(
            pOrigem,
            VariavelMacro,
            pCodCarta,
            pCodEmpresa,
            pCodCliente,
            pNDoc,
            pTipo,
            pDtCarta,
            pDiasAtraso,
            pCtrlCarta,
            pFinanceiroUnificado,
            pCodigoUnificada,
            pContato,
            pIdentificacao,
            pAplicativo,
            pPlataforma,
            pUrlAnexo
          )
      );

      if ((trim(VariavelMacro) = 'mensagem') and (trim(ValorMacro) = '')) then
        ValorMacro := '¶§' + VariavelMacro + '§¶';

      //O novo Valor para os vDados já tirado a macro
      if trim(pAplicativo) = 'E-MAIL' then
        vDados := Copy(vDados, 1, FixoInicial - 3) + ValorMacro + Copy(vDados, FixoFinal + 1, (Tamanho - FixoFinal + 1))
      else
        vDados := Copy(vDados, 1, FixoInicial - 3) + ValorMacro + Copy(vDados, FixoFinal + 2, (Tamanho - FixoFinal + 2));
      Tamanho := length(vDados);
      Contador := 0;
      FixoFinal := 0;
    end
    else
      Inc(Contador);
  end;
  Result := vDados;
end;

function TTagMacro._retornaValorMacro(
	pOrigem: string;
  pNomeMacro: string;
  pCodCarta: Integer;
  pCodEmpresa: Integer;
  pCodCliente: Integer;
  pNDoc: string;
  pTipoDoc: string;
  pDataCarta: TDateTime = 0;
  pDiasAtraso: integer = 0;
  pControlesCarta: string = '-1';
  pFinanceiroUnificado: Boolean = False;
  pCodigoUnificada: Integer = 0;
  pContato: string = '';
  pIdentificacao: string = '';
  pAplicativo: string = '';
  pPlataforma: string = '';
  pUrlAnexo: string = ''): string;
var
	query: TQuery_OOP;
	vBuscas, vBuscas2, vBuscas3: TIbQuery;
  vn_doc_c: string;
  vdata_venc_c: string;
  vvalor_c: Double;
  vvalor_corr: Double;
  vMultas, vTxJuros, vTxJurosTemp: Double;
  vDataBanco: TDateTime;
  vIdConsulta: string;
  vSql: string;

  function retornoPorCondicao(pCondicao: Boolean; pValorTrue: Variant; pValorFalse: Variant): Variant;
  begin
    if pCondicao then Result := pValorTrue else Result := pValorFalse;
  end;

  function AlnDir(Num: string; Tam: Integer): string;
  var
    I: Integer;
    V1: string;
  begin
    V1 := Num;
    for I := 1 to Tam - Length(V1) do
      V1 := ' ' + V1;
    Result := copy(V1, 1, tam);
  end;

  function retornaTagsConfigIni(pSecao: string; pIdentificado: string): string;
  var
  	ArqConfig: TIniFile;
  begin
  	try
	  	if FileExists(ExtractFilePath(Application.Exename) + 'hwsistemas.ini') then
    		ArqConfig := TIniFile.Create(ExtractFilePath(Application.Exename) + 'hwsistemas.ini')
      else
      	ArqConfig := TIniFile.Create(ExtractFilePath(Application.Exename) + 'Config.ini');

      Result := ArqConfig.ReadString(pSecao, pIdentificado, '');
    finally
      ArqConfig.Free;
    end
  end;

  function retornaValorCampo(pBuscas: TIBQuery; pNomeMacro: string): string;
  begin
//    if pBuscas.FieldByName(pNomeMacro).DataType = ftFloat then
//      Result := FormatFloat('#.##0,00', pBuscas.FieldByName(pNomeMacro).AsFloat)
//    else if pBuscas.FieldByName(pNomeMacro).DataType = ftCurrency then
//      Result := FormatFloat('#.##0,00', pBuscas.FieldByName(pNomeMacro).AsFloat)
//    else if pBuscas.FieldByName(pNomeMacro).DataType = ftDateTime then
//      Result := FormatDateTime('dd/MM/yyyy', pBuscas.FieldByName(pNomeMacro).AsDateTime)
//    else if pBuscas.FieldByName(pNomeMacro).DataType = ftDate then
//      Result := FormatDateTime('dd/MM/yyyy', pBuscas.FieldByName(pNomeMacro).AsDateTime)
//    else if pBuscas.FieldByName(pNomeMacro).DataType = ftTime then
//      Result := FormatDateTime('hh:nn:ss', pBuscas.FieldByName(pNomeMacro).AsDateTime)
//    else if pBuscas.FieldByName(pNomeMacro).DataType = ftBoolean then
//      Result := retornoPorCondicao(pBuscas.FieldByName(pNomeMacro).AsBoolean, 'Verdadeiro', 'Falso')
//    else
      Result := pBuscas.FieldByName(pNomeMacro).AsString;
  end;

begin
	try
    vBuscas := TIBQuery.Create(nil);
    vBuscas.Database := QrAux.Database;
    vBuscas.Transaction := QrAux.Transaction;

    vBuscas2 := TIBQuery.Create(nil);
    vBuscas2.Database := QrAux.Database;
    vBuscas2.Transaction := QrAux.Transaction;

    vBuscas3 := TIBQuery.Create(nil);
    vBuscas3.Database := QrAux.Database;
    vBuscas3.Transaction := QrAux.Transaction;

    Result := '';
    if trim(pNomeMacro) = 'contato_cliente' then
    begin
      Result := trim(pContato);
      Exit;
    end
    else if trim(pNomeMacro) = 'identificacao_cliente' then
    begin
      Result := trim(pIdentificacao);
      Exit;
    end
    else if trim(pNomeMacro) = 'aplicativo' then
    begin
      Result := trim(pAplicativo);
      Exit;
    end
    else if trim(pNomeMacro) = 'plataforma' then
    begin
      Result := trim(pPlataforma);
      Exit;
    end
    else if trim(pNomeMacro) = 'url_anexo' then
    begin
      Result := trim(pUrlAnexo);
      Exit;
    end
    else if trim(pNomeMacro) = 'nome_bot' then
    begin
      vBuscas.Close;
      vBuscas.SQL.Text := ' select nome_bot from config_api ' +
        ' where api = ''HWCLOUD_IA'' ' +
        ' and cod_empresa = ' + IntToStr(pCodEmpresa);
      vBuscas.Open;

      Result := trim(vBuscas.FieldByName('nome_bot').AsString);
      Exit;
    end
    else if trim(pNomeMacro) = 'origem' then
    begin
      if trim(pOrigem) = 'PROPOSTA PRODUTO' then
      begin
        if trim(pTipoDoc) = 'REQ' then
          Result := 'pedido de venda'
        else if trim(pTipoDoc) = 'ORC' then
          Result := 'orçamento'
        else if trim(pTipoDoc) = 'OS' then
          Result := 'ordem de serviço'
        else
          Result := pOrigem;
        Exit;
      end
      else
      begin
        vBuscas.Close;
        vBuscas.SQL.Text := ' select display from msg_origem ' +
          ' where descricao = ' + QuotedStr(pOrigem);
        vBuscas.Open;

        Result := trim(vBuscas.FieldByName('display').AsString);
        Exit;
      end;
    end;

    vBuscas.Close;
    vBuscas.SQL.Text := ' select modcartas.tipo_contrato, modcartas.id_consultas_sql, consultas_sql.sql from modcartas ' +
      ' left join consultas_sql on consultas_sql.id = modcartas.id_consultas_sql ' +
      ' where modcartas.cod_carta = ' + IntToStr(pCodCarta) +
      ' and modcartas.cod_empresa = ' + IntToStr(pCodEmpresa);
    vBuscas.Open;

    vIdConsulta := vBuscas.FieldByName('id_consultas_sql').AsString;
    vSql        := vBuscas.FieldByName('sql').AsString;

    if (trim(vSql) <> '') and (trim(vIdConsulta) = 'tags_Cliente.sql') then
    begin
      vBuscas.Close;
      vBuscas.SQL.Text := vSql;
      vBuscas.ParamByName('cod_cliente').AsInteger := pCodCliente;
      vBuscas.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
      vBuscas.ParamByName('dados').AsInteger := 1;
      vBuscas.Open;

      Result := retornaValorCampo(vBuscas, pNomeMacro);
    end
    else if (trim(vSql) <> '') and (trim(vIdConsulta) = 'tags_PropostaProduto.sql') then
    begin
      vBuscas.Close;
      vBuscas.SQL.Text := vSql;
      vBuscas.ParamByName('nped').AsInteger := StrToInt(pNDoc);
      vBuscas.ParamByName('tipo').AsString := pTipoDoc;
      vBuscas.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
      vBuscas.ParamByName('dados').AsInteger := 1;
      vBuscas.Open;

      Result := retornaValorCampo(vBuscas, pNomeMacro);
    end
    else if (trim(vSql) <> '') and (trim(vIdConsulta) = 'tags_PropostaVeiculo.sql') then
    begin
      vBuscas.Close;
      vBuscas.SQL.Text := vSql;
      vBuscas.ParamByName('n_comando').AsInteger := StrToInt(pNDoc);
      vBuscas.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
      vBuscas.ParamByName('natureza').AsString := 'S';
      vBuscas.ParamByName('dados').AsInteger := 1;
      vBuscas.Open;

      Result := retornaValorCampo(vBuscas, pNomeMacro);
    end
    else if (trim(vSql) <> '') and (trim(vIdConsulta) = 'tags_NFe.sql') then
    begin
      vBuscas.Close;
      vBuscas.SQL.Text := vSql;
      vBuscas.ParamByName('cod_nf').AsInteger := StrToInt(pNDoc);
      vBuscas.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
      vBuscas.ParamByName('dados').AsInteger := 1;
      vBuscas.Open;

      Result := retornaValorCampo(vBuscas, pNomeMacro);
    end
    else if (trim(vSql) <> '') and (trim(vIdConsulta) = 'tags_NFSe.sql') then
    begin
      vBuscas.Close;
      vBuscas.SQL.Text := vSql;
      vBuscas.ParamByName('id').AsString := pNDoc;
      vBuscas.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
      vBuscas.ParamByName('dados').AsInteger := 1;
      vBuscas.Open;

      Result := retornaValorCampo(vBuscas, pNomeMacro);
    end
    else if (trim(vSql) <> '') and (trim(vIdConsulta) = 'tags_NFCe.sql') then
    begin
      vBuscas.Close;
      vBuscas.SQL.Text := vSql;
      vBuscas.ParamByName('cod_nfce').AsInteger := StrToInt(pNDoc);
      vBuscas.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
      vBuscas.ParamByName('dados').AsInteger := 1;
      vBuscas.Open;

      Result := retornaValorCampo(vBuscas, pNomeMacro);
    end;

    if Trim(Result) <> '' then
    	Exit;

    vBuscas3.Close;
    vBuscas3.SQL.Text := 'select * from macro where nome = ' + QuotedStr(pNomeMacro);
    vBuscas3.Open;

    vBuscas.Close;
    vBuscas.SQL.Text := ' select current_date from rdb$database ';
    vBuscas.Open;

    vDataBanco := vBuscas.FieldByName('current_date').AsDateTime;

    vBuscas.Close;
    vBuscas2.Close;

    result := '';
    //Verifica se corresponde à macro da data atual e troca pela data por extenso
    if trim(vBuscas3.FieldByName('NOME').AsString) = 'DATA_ATUAL' then
    begin
    	result := FormatDateTime('dd/mm/yyyy', vDataBanco);
      exit;
    end
    else if trim(vBuscas3.FieldByName('NOME').AsString) = 'NOME_DESPACHANTE' then
    begin
      result := retornaTagsConfigIni('Despachante', 'Nome');
      exit;
    end
    else if trim(vBuscas3.FieldByName('NOME').AsString) = 'END_DESPACHANTE' then
    begin
      Result := retornaTagsConfigIni('Despachante', 'Endereco');
      exit;
    end
    else if trim(vBuscas3.FieldByName('NOME').AsString) = 'FONE_FAX_CEP_DESPACHANTE' then
    begin
      Result := retornaTagsConfigIni('Despachante', 'Fone');
      exit;
    end
    else if trim(vBuscas3.FieldByName('NOME').AsString)  = 'NOME_SOCIO_GERENTE' then
    begin
      Result := retornaTagsConfigIni('Gerente', 'Nome');
      exit;
    end
    else if trim(vBuscas3.FieldByName('NOME').AsString) = 'ESTADO_CIVIL_SOCIO_GERENTE' then
    begin
      Result := retornaTagsConfigIni('Gerente', 'EstadoCivil');
      exit;
    end
    else if trim(vBuscas3.FieldByName('NOME').AsString)  = 'PROFISSAO_SOCIO_GERENTE' then
    begin
      Result := retornaTagsConfigIni('Gerente', 'Profissao');
      exit;
    end
    else if trim(vBuscas3.FieldByName('NOME').AsString)  = 'NACIONALIDADE_SOCIO_GERENTE' then
    begin
      Result := retornaTagsConfigIni('Gerente', 'Nacionalidade');
      exit;
    end
    else if trim(vBuscas3.FieldByName('NOME').AsString)  = 'RG_SOCIO_GERENTE' then
    begin
      Result := retornaTagsConfigIni('Gerente', 'RG');
      exit;
    end
    else if trim(vBuscas3.FieldByName('NOME').AsString)  = 'CPF_SOCIO_GERENTE' then
    begin
      Result := retornaTagsConfigIni('Gerente', 'CPF');
      exit;
    end;

    if trim(vBuscas3.FieldByName('TABELA').AsString) = 'CONTROLE_CREDITOS' then
    begin
      vBuscas.SQL.Text := ' select * from ' + vBuscas3.FieldByName('TABELA').AsString +
        ' where codigo_emp = ' + IntToStr(pCodEmpresa) +
        ' and cod_cliente = ' + IntToStr(pCodCliente) +
        ' and coalesce(status_c,'''')='''' and data_venc_c <= :pData ' +
        ' and codigo_ctrl in (' + pControlesCarta +') '+
        ' order by data_venc_c';
      vBuscas.ParamByName('pData').AsDate := pDataCarta - pDiasAtraso;
    end
    else if trim(vBuscas3.FieldByName('TABELA').AsString) = 'EMPRESA' then
      vBuscas.SQL.Text := ' select * from ' + vBuscas3.FieldByName('TABELA').AsString +
        ' where COD_EMPRESA = ' + IntToStr(pCodEmpresa)
    else if trim(vBuscas3.FieldByName('TABELA').AsString) = 'DATABANCO' then
      vBuscas.SQL.Text := ' select * from ' + vBuscas3.FieldByName('TABELA').AsString
    else if trim(vBuscas3.FieldByName('TABELA').AsString) = 'COM_FAT' then
    begin
      if (vBuscas3.FieldByName('RELACIONAMENTO2').AsInteger = 1) then
      begin
        if (trim(vBuscas3.FieldByName('TABELA_RELAC').AsString) = 'CLIENTES')
        	and ((trim(vBuscas3.FieldByName('TABELA_RELAC2').AsString) = 'BAIRROS')
          	or (trim(vBuscas3.FieldByName('TABELA_RELAC2').AsString) = 'CIDADES')
            or (trim(vBuscas3.FieldByName('TABELA_RELAC2').AsString) = 'ESTADOS')) then
           vBuscas.SQL.Text :=
           ' select r2.' + trim(vBuscas3.FieldByName('CAMPO_RETORNO').AsString) +  ' FROM ' + vBuscas3.FieldByName('TABELA_RELAC2').AsString + ' r2 ' +
           ' inner join ' + vBuscas3.FieldByName('TABELA_RELAC').AsString + ' r1 on ' +
           '		r1.' + trim(vBuscas3.FieldByName('CAMPO2').AsString) + ' = r2.' + trim(vBuscas3.FieldByName('CAMPO_RELAC2').AsString) +
           ' inner join ' + vBuscas3.FieldByName('TABELA').AsString + ' c on ' +
           '		c.' + trim(vBuscas3.FieldByName('CAMPO').AsString) + ' = r1.' + trim(vBuscas3.FieldByName('CAMPO_RELAC').AsString) +
           ' 		and c.cod_empresa = r1.cod_empresa ' +
           ' where c.n_comando = ' + pNDoc +
           ' and c.cod_empresa = ' + IntToStr(pCodEmpresa);
      end
      else if (vBuscas3.FieldByName('RELACIONAMENTO').AsInteger = 1) then
      begin
        if trim(vBuscas3.FieldByName('TABELA_RELAC').AsString) = 'EST_MOTO' then
         vBuscas.SQL.Text := ' select r.' + trim(vBuscas3.FieldByName('CAMPO_RETORNO').AsString) + ' from ' + vBuscas3.FieldByName('TABELA_RELAC').AsString + ' r ' +
          '	inner join ' + vBuscas3.FieldByName('TABELA').AsString + ' c on ' +
          '		c.COD_ESTMOTO = r.CODIGO and c.CHASSIV = r.CHASSI_C and c.COD_EMPRESA = r.COD_EMPRESA ' +
          ' where c.n_comando = ' + pNDoc +
          ' and c.cod_empresa = ' + IntToStr(pCodEmpresa)
        else if trim(vBuscas3.FieldByName('TABELA_RELAC').AsString) = 'COND_PAG' then
         vBuscas.SQL.Text := ' select r.' + trim(vBuscas3.FieldByName('CAMPO_RETORNO').AsString) + ' from ' + vBuscas3.FieldByName('TABELA_RELAC').AsString + ' r ' +
          ' inner join ' + vBuscas3.FieldByName('TABELA').AsString + ' c on ' +
          '		c.' + trim(vBuscas3.FieldByName('CAMPO').AsString) + ' = r.' + trim(vBuscas3.FieldByName('CAMPO_RELAC').AsString) +
          ' where c.n_comando = ' + pNDoc +
          ' and c.cod_empresa = ' + IntToStr(pCodEmpresa)
        else
         vBuscas.SQL.Text := ' select r.' + trim(vBuscas3.FieldByName('CAMPO_RETORNO').AsString) + ' from ' + vBuscas3.FieldByName('TABELA_RELAC').AsString + ' r ' +
          ' inner join ' + vBuscas3.FieldByName('TABELA').AsString + ' c on ' +
          ' 	c.' + trim(vBuscas3.FieldByName('CAMPO').AsString) + ' = r.' + trim(vBuscas3.FieldByName('CAMPO_RELAC').AsString) + ' and c.COD_EMPRESA = r.COD_EMPRESA ' +
          ' where c.n_comando = ' + pNDoc +
          ' and c.cod_empresa = ' + IntToStr(pCodEmpresa);
      end
      else
        vBuscas.SQL.Text := 'select * from ' + vBuscas3.FieldByName('TABELA').AsString +
          ' Where n_comando = ' + pNDoc +
          ' and cod_empresa = ' + IntToStr(pCodEmpresa);
    end
    else if (vBuscas3.FieldByName('RELACIONAMENTO').AsInteger = 1) then
      vBuscas.SQL.Text := 'select r.' + trim(vBuscas3.FieldByName('CAMPO_RETORNO').AsString) + ' from ' + vBuscas3.FieldByName('TABELA_RELAC').AsString + ' r ' +
      	' inner join ' + vBuscas3.FieldByName('TABELA').AsString + ' c on ' +
        '		c.' + trim(vBuscas3.FieldByName('CAMPO').AsString) + ' = r.' + trim(vBuscas3.FieldByName('CAMPO_RELAC').AsString) +
        ' where c.cod_cliente = ' + pNDoc +
        ' and c.cod_empresa = ' + retornoPorCondicao((pFinanceiroUnificado) and (pCodigoUnificada > 0) and (trim(vBuscas3.FieldByName('TABELA').AsString) = 'CLIENTES'), IntToStr(pCodigoUnificada), IntToStr(pCodEmpresa))
    else if (vBuscas3.FieldByName('TABELA').AsString) <> '' then
      vBuscas.SQL.Text := 'select * from ' + vBuscas3.FieldByName('TABELA').AsString +
        ' where cod_cliente = ' + pNDoc +
        ' and cod_empresa = ' + retornoPorCondicao((pFinanceiroUnificado) and (pCodigoUnificada > 0) and (trim(vBuscas3.FieldByName('TABELA').AsString) = 'CLIENTES'), IntToStr(pCodigoUnificada), IntToStr(pCodEmpresa))
    else if (vBuscas3.FieldByName('TABELA').AsString) = '' then
    begin
      Result := pNomeMacro;
      vBuscas.Close;
      exit;
    end;
    vBuscas.Open;

    vBuscas.First;
    result := '';
    while not vBuscas.Eof do
    begin
      if (trim(vBuscas3.FieldByName('CAMPO').AsString) = 'DATA_VENC_C')
        	or (trim(vBuscas3.FieldByName('CAMPO').AsString) = 'DATA_VENC_C_CORR')
          or (trim(vBuscas3.FieldByName('CAMPO').AsString) = 'DATA_VENC_C_ORIG_CORR') then
      begin
      	vn_doc_c := trim(vBuscas.fieldbyname('N_DOC_C').asstring);
        if trim(vBuscas.FieldByName('DATA_VENC_C').AsString) <> '' then
        	 vdata_venc_c := trim(FormatDateTime('DD/MM/YYYY', vBuscas.FieldByName('DATA_VENC_C').AsDateTime))
        else
        	 vdata_venc_c := trim(vBuscas.FieldByName('DATA_VENC_C').AsString);
        vvalor_c := vBuscas.FieldByName('VALOR_C').ascurrency;
        vvalor_corr := vBuscas.FieldByName('VALOR_CORR').ascurrency;

        vBuscas2.Close;
        vBuscas2.SQL.Text := ' select multas, tx_juros from empresa ' +
        	' where cod_empresa = ' + IntToStr(pCodEmpresa);
        vBuscas2.Open;

        vTxJuros := vBuscas2.FieldByName('tx_juros').AsFloat;
        vMultas  := vBuscas2.FieldByName('tx_juros').AsFloat;

        vTxJurosTemp := (vDataBanco - vBuscas.FieldByName('data_venc_c').AsDateTime) * (vTxJuros / 30);

        if (vvalor_c > 0) then
           vvalor_corr := vvalor_c + (((vvalor_c * vTxJurosTemp) / 100) +
             ((vvalor_c * vMultas) / 100))
        else
           vvalor_corr := vvalor_corr + (((vvalor_corr * vTxJurosTemp) / 100) +
             ((vvalor_corr * vMultas) / 100));

        if trim(vBuscas3.FieldByName('CAMPO').asString) = 'DATA_VENC_C' then
          Result := IfThen(trim(Result) <> '', Result + #$D#$A + '\par ', '') +
          	'DOCUMENTO: \b ' + vn_doc_c + ' ' +
            '\b0 COM VENCIMENTO: \b ' + vdata_venc_c + ' ' +
            '\b0 NO VALOR DE: \b ' + trim(AlnDir(format('%m', [vvalor_c]), 12)) + '\b0 '
        else if trim(vBuscas3.FieldByName('CAMPO').asString) = 'DATA_VENC_C_CORR' then
          Result := IfThen(trim(Result) <> '', Result + #$D#$A + '\par ', '') +
          	'DOCUMENTO: \b ' + vn_doc_c + ' ' +
            '\b0 COM VENCIMENTO: \b ' + vdata_venc_c + ' ' +
            '\b0 NO VALOR CORRIGIDO DE: \b ' + trim(IfThen(vvalor_corr > 0,
               AlnDir(format('%m', [vvalor_corr]), 12),
               AlnDir(format('%m', [vvalor_c]), 12))) + '\b0 '
        else if trim(vBuscas3.FieldByName('CAMPO').asString) = 'DATA_VENC_C_ORIG_CORR' then
          Result := IfThen(trim(Result) <> '', Result + #$D#$A + '\par ', '') +
          	'DOCUMENTO: \b ' + vn_doc_c + ' ' +
            '\b0 COM VENCIMENTO: \b ' + vdata_venc_c + ' ' +
            '\b0 NO VALOR DE: \b ' + trim(AlnDir(format('%m', [vvalor_c]), 12)) + ' ' +
            '\b0 E VALOR CORRIGIDO DE: \b ' + trim(IfThen(vvalor_corr > 0,
               AlnDir(format('%m', [vvalor_corr]), 12),
               AlnDir(format('%m', [vvalor_c]), 12))) + '\b0 ';
      end
      else if vBuscas3.FieldByName('RELACIONAMENTO').AsInteger = 1 then
        Result := IfThen(trim(Result) <> '', Result + ' - ', '') +
          vBuscas.FieldByName(trim(vBuscas3.FieldByName('CAMPO_RETORNO').asString)).AsString
      else
        Result := IfThen(trim(Result) <> '', Result + ' - ', '') +
          vBuscas.FieldByName(trim(vBuscas3.FieldByName('CAMPO').AsString)).AsString;
      if trim(vBuscas3.FieldByName('CAMPO').AsString) = 'DATABANCO' then
        Result := FormatDateTime('dddd"," dd "de" mmmm "de" yyyy', vDataBanco);

      vBuscas.Next;
    end;
  finally
    if Assigned(vBuscas) then
    	FreeAndNil(vBuscas);

    if Assigned(vBuscas2) then
    	FreeAndNil(vBuscas2);

    if Assigned(vBuscas3) then
    	FreeAndNil(vBuscas3);
  end;
end;

end.
