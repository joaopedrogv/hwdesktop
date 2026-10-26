unit uClassesTRV;

interface

uses
  uDataSet_OOP, uDtmAtivo, Db, Windows, Forms, Controls, DBClient,
  IBQuery, USenha, DBGrids;

type
  TPedVendaTRV = class;
  TPedVendaTRVOrigem = class;
  TPedVendaTRVDestino = class;

  TPedVendaTRV = class(TDataSet_OOP)
  public
    tipo: string;
    vSystemIni: string;
    vBancoOrigem: string;
    vBancoDestino: string;
    vCodEmpresaOrigem: string;
    vCodEmpresaDestino: string;
    vHashOr1, vHashOr2, vHashDs1, vHashDs2: string;
    vReqAb, vOSAb: string;
    vVerificarEstoque: string;
    vVerificarCpfCliente: string;
    vVerificarCpfVendedor: string;
    FvalorDesconto: Currency;
    FvalorAcrescimo: Currency;
    FvalorServicos: Currency;
    FvalorServTerc: Currency;
    FvalorProdTerc: Currency;
    FvalorProdutos: Currency;
    FvlrateioDesconto: Currency;
    FvlrateioAcrescimo: Currency;
    FvlDesconto: Currency;
    FvlAcrescimo: Currency;
    FtodosP, FtodosS: boolean;
    function getQtdeDisponivelEmEstoque: Double; overload;
    function getQtdeDisponivelEmEstoque(grupo_prod: integer; cod_prod: string): Double; overload;
    procedure produtosCalcFields(DataSet: TDataSet);
    function lerConfigTRV: boolean;
    procedure configurarConfigTRV;
    procedure efetuaRateios;
    procedure gravaTipoVendaCliente(OrcReq: boolean; OrcOS: boolean; OrcReqOs: boolean);
    function existeEquipamento(codigo: integer): integer;
  public
    destructor Destroy; override;
    constructor create;
    procedure setValorAUtilizar(valor: Double);
    function ConsultaAvancada(tabela, valorConsulta, Campo, condicao, ordem: string; constante:
      boolean; codemp, dataIni, dataFim: string; datas: boolean; pReqOsOrc: Integer; processadas:
      boolean):
      boolean;
    function detalharVenda: boolean;
    function somar(gridProd, gridServ, gridTerc: TDBGrid; somenteSelecionados: boolean): boolean;
    function processarVenda(gridProd, gridServ, gridTerc: TDBGrid; comDesc, comAcres,
      somenteSelecionados: boolean; valorDesc, valorAcres: Currency;
      OrcReq: boolean; OrcOS: boolean; OrcReqOs: boolean): boolean;
    function removerProcessamentoVenda: boolean;
    procedure somaTotais(utilizar: boolean);
    function voltarVendaParaProcessar: boolean;
    function ValidarCamposObrigatorios: boolean;

    property valorDesconto: Currency read FvalorDesconto;
    property valorAcrescimo: Currency read FvalorAcrescimo;
    property valorProdutos: Currency read FvalorProdutos;
    property valorServicos: Currency read FvalorServicos;
    property valorProdTerc: Currency read FvalorProdTerc;
    property valorServTerc: Currency read FvalorServTerc;
  var
    vProd, vServ, vProdTerc, vServTerc: TClientDataSet;
    vOrigem: TPedVendaTRVOrigem;
    vDestino: TPedVendaTRVDestino;
    vEntrada: TFrmEntrada;
  end;

  TPedVendaTRVOrigem = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
  var
    vPedVenda, vPedVendaProd, vPedVendaServ, vPedVendaProdTerc, vPedVendaServTerc: TClientDataSet;
  end;
  TPedVendaTRVDestino = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
  var
    vPedVenda, vPedVendaProd, vPedVendaServ, vPedVendaServTerc, vAparelho, vOcorrencias, vMecanicos:
    TClientDataSet;
  end;

implementation

uses
  SysUtils, uDtmTRV, IBDatabase, IBStoredProc, Classes, DateUtils, StdCtrls,
  IniFiles, uConfigTRV, uDadosIni;

function SincDocHW(PTipoDoc, PNpedido, vendBanco: PChar; Ptpacao, Pcodempresa: Integer): LongBool;
  stdcall; external 'CompativelHW.dll';

function __getSenhaFDB: PChar; stdcall; external 'cons40.dll';
function __getUsuarioFDB: PChar; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';

{ TPedVendaTRV }

procedure TPedVendaTRV.configurarConfigTRV;
var
  vArqIni, vArqIniTRV: string;
  vArqConfig, vArqConfigTRV: TIniFile;
  vSystemCH: array[0..MAX_PATH] of Char;
begin
  vArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
  if not FileExists(vArqIni) then
    vArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
  try
    vArqConfig := TIniFile.Create(vArqIni);
    if UpperCase(vArqConfig.ReadString('TRV', 'Config', 'Local')) <> 'LOCAL' then
    begin
      GetSystemDirectory(vSystemCH, MAX_PATH);
      vSystemIni := StrPas(vSystemCH);
      if DirectoryExists(vSystemIni) then
      begin
        vSystemIni := StringReplace(vSystemIni + '\ms001.ini', '\\', '\', [rfReplaceAll,
          rfIgnoreCase]);
        Application.CreateForm(TfrmConfigTRV, frmConfigTRV);
        frmConfigTRV.vSystemIni := vSystemIni;
        if frmConfigTRV.ShowModal = mrOk then
          Application.MessageBox('Reinicie o sistema para alterações terem efeito', 'Atenção',
            MB_OK + MB_ICONINFORMATION);
      end;
    end
    else
    begin
      vSystemIni := vArqIni;
      Application.CreateForm(TfrmConfigTRV, frmConfigTRV);
      frmConfigTRV.vSystemIni := vSystemIni;
      if frmConfigTRV.ShowModal = mrOk then
        Application.MessageBox('Reinicie o sistema para alterações terem efeito', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
    end;
  finally
    vArqConfig.Free;
  end;
end;

function TPedVendaTRV.ConsultaAvancada(tabela, valorConsulta, Campo, condicao,
  ordem: string; constante: boolean; codemp, dataIni, dataFim: string;
  datas: boolean; pReqOsOrc: Integer; processadas: boolean): boolean;
var
  tempSql, vCampoTemp, vCondicaoTmp: string;
  vsql_campos: string;
  vsql_inner: string;
begin
	vsql_campos := 'pedvenda.*, colaborador.nome_vendedor, clientes.nome_cliente, clientes.razao, clientes.endereco, clientes.fone_cliente, cidades.nome_cidade, localidade.localidade, setor.setor';
  vsql_inner  := ' left join colaborador on colaborador.cod_vendedor = pedvenda.cod_vendedor and colaborador.cod_empresa = pedvenda.cod_empresa ' +
  							 ' left join clientes on pedvenda.cod_cliente = clientes.cod_cliente and pedvenda.cod_empresa = clientes.cod_empresa' +
                 ' left join cidades on cidades.cod_cidade = clientes.cod_cidade'+
                 ' left join localidade on localidade.cod_localidade = clientes.cod_localidade and localidade.cod_empresa = clientes.cod_empresa'+
                 ' left join setor on setor.cod_setor = localidade.cod_setor and setor.cod_empresa = localidade.cod_empresa';
                 
  if pReqOsOrc = 1 then
    tipo := 'REQ'
  else if pReqOsOrc = 2 then
    tipo := 'OS'
  else
    tipo := 'ORC';

  tempSql := ' and pedvenda.tipo = ' + QuotedStr(tipo);

  vCampoTemp:= '';
  if Campo = 'Placa' then
    vCampoTemp := 'PEDVENDA.PLACA'
  else if Campo = 'Nome Vendedor' then
  	vCampoTemp := 'COLABORADOR.NOME_VENDEDOR'
  else if Campo = 'Nome Cliente ( Nome Fantasia)' then
    vCampoTemp := 'CLIENTES.NOME_CLIENTE'
  else if Campo = 'Nome Cliente (Razao Social)' then
    vCampoTemp := 'CLIENTES.RAZAO'
  else if Campo = 'Endereço Cliente' then
    vCampoTemp := 'CLIENTES.ENDERECO'
  else if Campo = 'Telefone Cliente' then
    vCampoTemp := 'CLIENTES.FONE_CLIENTE'
  else if Campo = 'Cidade' then
    vCampoTemp := 'CIDADES.NOME_CIDADE'
  else if Campo = 'Localidade' then
    vCampoTemp := 'LOCALIDADE.LOCALIDADE'
  else if Campo = 'Setor' then
    vCampoTemp := 'SETOR.SETOR';

  if Trim(vCampoTemp) <> '' then
  begin
    vCondicaoTmp := condicao;
    if vCondicaoTmp = 'Igual' then
      vCondicaoTmp := '='
    else if vCondicaoTmp = 'Maior' then
      vCondicaoTmp := '>'
    else if vCondicaoTmp = 'Maior ou Igual' then
      vCondicaoTmp := '>='
    else if vCondicaoTmp = 'Menor' then
      vCondicaoTmp := '<'
    else if vCondicaoTmp = 'Menor ou Igual' then
      vCondicaoTmp := '<='
    else if vCondicaoTmp = 'Diferente' then
      vCondicaoTmp := '<>'
    else if (vCondicaoTmp = 'Esta contido') then
      vCondicaoTmp := 'like'
    else if (vCondicaoTmp = 'Começa') then
      vCondicaoTmp := 'Começa'
    else
      vCondicaoTmp := '=';
    if vCondicaoTmp = 'like' then
      tempSql := tempSql + ' and ' + vCampoTemp + ' like ' + QuotedStr('%' + valorConsulta + '%')
    else if vCondicaoTmp = 'Começa' then
    begin
    	if (UpperCase(trim(Campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(valorConsulta)) <> trim(valorConsulta)) then
      	tempSql := tempSql + ' and ((' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(valorConsulta)) + '%') + ') ' +
        	' or (' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(valorConsulta))) + '%') + ')) '
      else
	      tempSql := tempSql + ' and ' + vCampoTemp + ' like ' + QuotedStr(valorConsulta + '%');
    end
    else
    begin
    	if (UpperCase(trim(Campo)) = 'PLACA') and (trim(vDadosIni.retornaPlacaNovaAntiga(valorConsulta)) <> trim(valorConsulta)) then
      	tempSql := tempSql + ' and ((' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(valorConsulta))) + ') ' +
        	' or (' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vDadosIni.retornaPlacaNovaAntiga(valorConsulta)))) + ')) '
      else
	      tempSql := tempSql + ' and ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' +QuotedStr(valorConsulta);
    end;
    valorConsulta := '';
  end;

  System.Delete(tempSql, 1, 4);
  if ordem = 'Nome Vendedor' then
  	ordem := 'COLABORADOR.NOME_VENDEDOR'
  else if ordem = 'Nome Cliente ( Nome Fantasia)' then
    ordem := 'CLIENTES.NOME_CLIENTE'
  else if ordem = 'Nome Cliente (Razao Social)' then
    ordem := 'CLIENTES.RAZAO'
  else if ordem = 'Endereço Cliente' then
    ordem := 'CLIENTES.ENDERECO'
  else if ordem = 'Telefone Cliente' then
    ordem := 'CLIENTES.FONE_CLIENTE'
  else if ordem = 'Cidade' then
    ordem := 'CIDADES.NOME_CIDADE'
  else if ordem = 'Localidade' then
    ordem := 'localidade.localidade'
  else if ordem = 'Setor' then
    ordem := 'setor.setor';

  if tipo <> 'ORC' then
    if ((trim(vReqAb) <> 'S') and (trim(vOSAb) <> 'S')) then
      tempSql := tempSql + ' and (pedvenda.status_ped = ''FECHADA'') '
    else if ((pReqOsOrc = 1) and (trim(vReqAb) = 'S')) or  ((pReqOsOrc = 2) and (trim(vOSAb) = 'S')) then
      tempSql := tempSql + ' and ((pedvenda.status_ped = ''FECHADA'') or (trim(coalesce(pedvenda.status_ped, '''')) = '''')) ';
  if processadas then
    tempSql := tempSql + ' and pedvenda.processada_sl = 1 '
  else
    tempSql := tempSql + ' and (pedvenda.processada_sl = 0 or pedvenda.processada_sl is null) ';

  if datas then
    result := ConsultaCampos(tabela, Campo, ordem, dataIni, dataFim, codemp, 1, vsql_campos, vsql_inner, tempSql)
  else
    result := ConsultaCampos(tabela, valorConsulta, Campo, condicao, ordem, True, codemp, vsql_campos, vsql_inner, tempSql);
end;

constructor TPedVendaTRV.create;
var
  temp: string;
begin
  if dtmTRV = nil then
    dtmTRV := TdtmTRV.Create(dtmTRV);

  buscas := TIBQuery(dtmTRV.qrBuscas);
  transacao := TIBTransaction(dtmTRV.transacao);
  dataSet := TClientDataSet(dtmTRV.cdsPedVenda);

  if lerConfigTRV then
  begin
    dtmTRV.bancoOrigem.Connected := false;
    dtmTRV.bancoDestino.Connected := false;
    if (Trim(vHashOr1) <> '') then
      dtmTRV.bancoOrigem.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vHashOr1)));
    if (Trim(vHashOr2) <> '') then
      dtmTRV.bancoOrigem.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vHashOr2)));
    dtmTRV.bancoOrigem.DatabaseName := vBancoOrigem;
    
    if (Trim(vHashDs1) <> '') then
      dtmTRV.bancoDestino.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vHashDs1)));
    if (Trim(vHashDs2) <> '') then
      dtmTRV.bancoDestino.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vHashDs2)));
    dtmTRV.bancoDestino.DatabaseName := vBancoDestino;

    try
      dtmTRV.bancoOrigem.Connected := True;
    except
      Application.MessageBox(pchar('Erro ao concectar a base de dados Origem: ' + #13 +
        vBancoOrigem),
        'Atenção', MB_OK + MB_ICONINFORMATION);
      Application.Terminate;
    end;
    try
      dtmTRV.bancoDestino.Connected := True;
    except
      Application.MessageBox(pchar('Erro ao concectar a base de dados Destino: ' + #13 +
        vBancoDestino),
        'Atenção', MB_OK + MB_ICONINFORMATION);
      Application.Terminate;
    end;
  end
  else
  begin
    Application.MessageBox(pchar('Não foi possivel obter configurações. Verifique seus arquivos *.Ini'),
      'Atenção', MB_OK + MB_ICONINFORMATION);
    Application.Terminate;
  end;

  vOrigem := TPedVendaTRVOrigem.create;
  vDestino := TPedVendaTRVDestino.create;

  //  vProd := TClientDataSet(dtmTRV.cdsItemProd);
  //  vServ := TClientDataSet(dtmTRV.cdsItemServ);
  //  vProdTerc := TClientDataSet(dtmTRV.cdsProdTerceiro);
  //  vServTerc := TClientDataSet(dtmTRV.cdsServTerceiro);

  try
    vOrigem.buscas.Close;
    vOrigem.buscas.sql.Text := ' select * from pedvenda ' +
    	' where cod_empresa = 0 ' +
      ' and nped = 0 ' +
      ' and tipo = ''AAA''';
    vOrigem.buscas.Open;
    temp := vOrigem.buscas.fieldbyname('processada_SL').asstring;
    vOrigem.buscas.Close;
  except
    on e: exception do
    begin
      temp := 'Field ' + QuotedStr('processada_SL') + ' not found';
      if pos(UpperCase(temp), UpperCase(e.Message)) > 0 then
      begin
        vOrigem.buscas.close;
        vOrigem.buscas.sql.text := 'alter table pedvenda add processada_SL integer default 0';
        vOrigem.buscas.ExecSQL;
        vOrigem.CommitaTransacao;
        vOrigem.buscas.close;
        vOrigem.buscas.sql.text := 'update pedvenda set processada_SL = 0';
        vOrigem.buscas.ExecSQL;
        vOrigem.CommitaTransacao;
      end;
    end
  end;
end;

destructor TPedVendaTRV.Destroy;
begin
  vOrigem.Free;
  vOrigem := nil;
  vDestino.Free;
  vDestino := nil;
  buscas.Close;
end;

function TPedVendaTRV.detalharVenda: boolean;
var
  vrTemp: Currency;
begin
 registraErro('DETALHAR');
  vOrigem.vPedVendaProd.Close;
  vOrigem.vPedVendaProd.AutoCalcFields := True;
  vOrigem.vPedVendaProd.OnCalcFields := produtosCalcFields;
  somaTotais(true);
  vOrigem.vPedVendaProd.OnCalcFields := nil;
  Result := true;
end;

procedure TPedVendaTRV.efetuaRateios;
var
  vValorProdPermDesc, descProd, descServ, acrescProd, acrescServ: Currency;
begin
  vValorProdPermDesc := 0;
  vDestino.vPedVendaProd.First;
  while not vDestino.vPedVendaProd.Eof do
  begin
    vDestino.buscas.Close;
    vDestino.buscas.SQL.Text := ' select permitir_desconto from produtos ' +
    	' where grupo_prod = :grupo_prod ' +
      ' and cod_prod = :cod_prod ' +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
				  (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						trim(vCodEmpresaDestino),
        		vDadosIni.codEmpresa) +
      ' and ativo = 1 ';
    vDestino.buscas.ParamByName('grupo_prod').AsInteger := vDestino.vPedVendaProd.FieldByName('grupo_prod').AsInteger;
    vDestino.buscas.ParamByName('cod_prod').AsString := vDestino.vPedVendaProd.FieldByName('cod_prod').AsString;
    vDestino.buscas.Open;
    if vDestino.buscas.FieldByName('PERMITIR_DESCONTO').AsString <> 'N' then
      vValorProdPermDesc := vValorProdPermDesc +
        (vDestino.vPedVendaProd.FieldByName('QUANT_PED_ITEM').AsCurrency
        * vDestino.vPedVendaProd.FieldByName('VLUN_PED_ITEM').AsCurrency);
    vDestino.vPedVendaProd.Next;
  end;
  descProd := 0;
  descServ := 0;
  acrescProd := 0;
  acrescServ := 0;
  if FvalorDesconto > 0 then
  begin
    descProd := (FvalorDesconto / (FvalorProdutos + FvalorServicos)) * FvalorProdutos;
    descServ := (FvalorDesconto / (FvalorProdutos + FvalorServicos)) * FvalorServicos;
  end;
  if FvalorAcrescimo > 0 then
  begin
    acrescProd := (FvalorAcrescimo / (FvalorProdutos + FvalorServicos)) * FvalorProdutos;
    acrescServ := (FvalorAcrescimo / (FvalorProdutos + FvalorServicos)) * FvalorServicos;
  end;

  vDestino.vPedVendaProd.First;
  while not vDestino.vPedVendaProd.Eof do
  begin
    vDestino.buscas.Close;
    vDestino.buscas.SQL.Text := ' select permitir_desconto from produtos ' +
    	' where grupo_prod = :grupo_prod ' +
      ' and cod_prod = :cod_prod' +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
				  (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						trim(vCodEmpresaDestino),
        		vDadosIni.codEmpresa) +
      ' and ativo = 1 ';
    vDestino.buscas.ParamByName('grupo_prod').AsInteger :=
      vDestino.vPedVendaProd.FieldByName('grupo_prod').AsInteger;
    vDestino.buscas.ParamByName('cod_prod').AsString :=
    	vDestino.vPedVendaProd.FieldByName('cod_prod').AsString;
    vDestino.buscas.Open;
    vDestino.vPedVendaProd.Edit;
    vDestino.vPedVendaProd.FieldByName('rateio_acresc').AsCurrency := (acrescProd *
      (vDestino.vPedVendaProd.FieldByName('vltot_ped_item').AsCurrency)) / FvalorProdutos;
    if vDestino.buscas.FieldByName('permitir_desconto').AsString <> 'N' then
      vDestino.vPedVendaProd.FieldByName('rateio_desc').AsCurrency := (descProd *
        (vDestino.vPedVendaProd.FieldByName('vltot_ped_item').AsCurrency)) / vValorProdPermDesc
    else
      vDestino.vPedVendaProd.FieldByName('rateio_desc').AsCurrency := 0;
    vDestino.vPedVendaProd.Post;
    vDestino.vPedVendaProd.Next;
  end;

  vDestino.vPedVendaServ.First;
  while not vDestino.vPedVendaServ.Eof do
  begin
    vDestino.vPedVendaServ.Edit;
    vDestino.vPedVendaServ.FieldByName('rateio_desc').AsCurrency := (descServ *
      (vDestino.vPedVendaServ.FieldByName('valor_tot_serv').AsCurrency)) / FvalorServicos;
    vDestino.vPedVendaServ.FieldByName('rateio_acresc').AsCurrency := (acrescServ *
      (vDestino.vPedVendaServ.FieldByName('valor_tot_serv').AsCurrency)) / FvalorServicos;
    vDestino.vPedVendaServ.Post;
    vDestino.vPedVendaServ.Next;
  end;
end;

function TPedVendaTRV.existeEquipamento(codigo: integer): integer;
var
  cod, i: integer;
begin
  cod := codigo;

  vDestino.buscas.close;
  vDestino.buscas.sql.text := ' select cod_equip from equipamento ' +
  	' where tip_equip <> ''I'' ' +
    ' and cod_equip = ' + IntToStr(cod) +
    ' and cod_empresa = ' +
    	vDadosIni.IfThen(
			 (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
				 trim(vCodEmpresaDestino),
         vDadosIni.codEmpresa);
  vDestino.buscas.open;
  if vDestino.buscas.IsEmpty then
  begin
    try
      vOrigem.buscas.close;
      vOrigem.buscas.sql.text := ' select * from equipamento ' +
      	' where tip_equip <> ''I'' ' +
        ' and cod_equip = ' + IntToStr(cod) +
        ' and cod_empresa = ' +
        	vDadosIni.IfThen(
					 (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						 trim(vCodEmpresaOrigem),
        		 vDadosIni.codEmpresa);
      vOrigem.buscas.open;
      if not vOrigem.buscas.IsEmpty then
      begin
        vDestino.vAparelho.Open;
        vDestino.vAparelho.Insert;
        for i := 0 to vOrigem.buscas.FieldCount - 1 do
          vDestino.vAparelho.Fields[i].Value :=
            vOrigem.buscas.FieldByName(vDestino.vAparelho.Fields[i].FieldName).Value;
        cod := GenCodigo('EQUIPAMENTO', dtmTRV.SpIncCodDest,
        	vDadosIni.IfThen(
						(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
							trim(vCodEmpresaDestino),
        		 	vDadosIni.codEmpresa));
        vDestino.vAparelho.FieldByName('COD_EQUIP').AsInteger := cod;
        vDestino.vAparelho.Post;
        vDestino.vAparelho.Close;
        vOrigem.buscas.close;
      end;
    except
      on e: exception do begin
        Result := 0;
        registraErro('Erro ao importar Equipamento. Erro: ' + e.Message);
      end;
    end;
  end
  else
    vDestino.buscas.close;
  Result := cod;
end;

function TPedVendaTRV.getQtdeDisponivelEmEstoque(grupo_prod: integer;
  cod_prod: string): Double;
var
  sql: string;
  vest, vTemp: Real;
begin
  try
    registraErro('getQtdeDisponivelEmEstoque');
    vTemp := 0;
    sql := 'select sum(itpd.quant_ped_item) as soma1 from pedvenda pd' +
      ' inner join pedvenda_prod itpd on pd.nped = itpd.nped and pd.tipo = itpd.tipo and pd.cod_empresa = itpd.cod_empresa' +
      ' where pd.ativo = 1 ' +
      ' and itpd.grupo_prod = :grupo_prod ' +
      ' and itpd.cod_prod = :cod_prod ' +
      ' and itpd.cod_empresa = ' +
      	vDadosIni.IfThen(
				  (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						trim(vCodEmpresaDestino),
        		vDadosIni.codEmpresa) +
      ' and (pd.data_fech is null or pd.data_fech < :data) ';
    vDestino.buscas.Close;
    if vDadosIni.vEmp.vApresentarEstR = 'S' then
      sql := sql + ' and pd.tipo <> ''ORC'''
    else if vDadosIni.vEmp.vApresentarEstR = 'R' then
      sql := sql + ' and pd.tipo = ''REQ'''
    else if vDadosIni.vEmp.vApresentarEstR = 'O' then
      sql := sql + ' and pd.tipo = ''OS''';
    sql := sql + ' and (pd.tipo <> ' + QuotedStr(tipo) + ' and pd.nped <> ' + dataSet.FieldByName('nped').AsString + ')';
    if (vDadosIni.vEmp.vApresentarEstR = 'R') or
      (vDadosIni.vEmp.vApresentarEstR = 'O') or
      (vDadosIni.vEmp.vApresentarEstR = 'S') then
    begin
      vDestino.buscas.SQL.Text := sql;
      vDestino.buscas.ParamByName('grupo_prod').AsInteger := grupo_prod;
      vDestino.buscas.ParamByName('cod_prod').AsString := cod_prod;
      vDestino.buscas.ParamByName('data').AsDate := 0;
      vDestino.buscas.Open;
      vTemp := vDestino.buscas.FieldByName('soma1').AsFloat;
    end;
    vDestino.buscas.Close;
    sql := 'select * from produtos ' +
    	' where grupo_prod = :grupo_prod ' +
      ' and cod_prod = :cod_prod ' +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
				  (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						trim(vCodEmpresaDestino),
        		vDadosIni.codEmpresa) +
      ' and ativo = 1 ' +
      ' and (coalesce(consumo, ''N'') <> ''S'')';
    vDestino.buscas.SQL.Text := sql;
    vDestino.buscas.ParamByName('grupo_prod').AsInteger := grupo_prod;
    vDestino.buscas.ParamByName('cod_prod').AsString := cod_prod;
    vDestino.buscas.Open;
    Result := vDestino.buscas.FieldByName('est_f').AsFloat +
      vDestino.buscas.FieldByName('est_r').AsFloat - vTemp;
    registraErro(sql + '	' + IntToStr(grupo_prod)+ ' '+ cod_prod);
    vDestino.buscas.Close;
  except
  end;
end;

procedure TPedVendaTRV.gravaTipoVendaCliente(OrcReq: boolean; OrcOS: boolean; OrcReqOs: boolean);
var
  vTipoCliente: string;
begin
  try
    if (vDestino.vPedVenda.FieldByName('tipo').AsString = 'ORC')
    	and (not OrcReq)
      and (not OrcOS)
      and (not OrcReqOs) then
	      Exit;

    vDestino.buscas.Close;
    vDestino.buscas.SQL.Text := ' select tipoCliente, data_ult_compra from clientes ' +
      ' where cod_cliente = ' + IntToStr(vDestino.vPedVenda.FieldByName('cod_cliente').AsInteger) +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
				  (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						trim(vCodEmpresaDestino),
        		vDadosIni.codEmpresa) +
      ' and ativo = 1';
    vDestino.buscas.Open;
    vTipoCliente := Trim(vDestino.buscas.FieldByName('TIPOCLIENTE').AsString);
    if (vTipoCliente = '') and (trim(vDestino.vPedVenda.FieldByName('tipo').AsString) = 'REQ') then
    	vTipoCliente := 'P'
    else if (vTipoCliente = '') and (trim(vDestino.vPedVenda.FieldByName('tipo').AsString) = 'OS') then
      vTipoCliente := 'S'
    else
    begin
      if (Trim(vDestino.vPedVenda.FieldByName('tipo').AsString) = 'OS') and (pos('S', vTipoCliente) = 0) then
      	vTipoCliente := vTipoCliente + '|S'
      else if (Trim(vDestino.vPedVenda.FieldByName('tipo').AsString) = 'REQ') and (pos('P', vTipoCliente) = 0) then
        vTipoCliente := vTipoCliente + '|P'
    end;
    vDestino.buscas.Close;
    vDestino.buscas.SQL.Text := 'update clientes set tipocliente = ' + QuotedStr(vTipoCliente) + ',' +
      ' data_ult_compra = :data ' +
      ' where cod_cliente = ' + IntToStr(vOrigem.vPedVenda.FieldByName('cod_cliente').AsInteger) +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
				  (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						trim(vCodEmpresaDestino),
        		vDadosIni.codEmpresa);
    vDestino.buscas.Params[0].AsDate := vDadosIni.getDataBanco(buscas);
    vDestino.buscas.Prepare;
    vDestino.buscas.ExecSQL;
  except
  end;
end;

function TPedVendaTRV.lerConfigTRV: boolean;
var
  vArqIni, vArqIniTRV: string;
  vArqConfig, vArqConfigTRV: TIniFile;
  vSystemCH: array[0..MAX_PATH] of Char;
begin
  Result := false;

  //  if FileExists(ExtractFilePath(Application.Exename) + 'hwsistemas.ini') then
  //  begin
  //    vArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
  //    vArqIniTRV := vArqIni;
  //  end;
  //
  //  if FileExists(ExtractFilePath(Application.Exename) + 'Config.ini') then
  //  begin
  //    vArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
  //    vArqIniTRV := vArqIni;
  //  end;
  //
  //  if (not FileExists(ExtractFilePath(Application.Exename) + 'Config.ini')) and (not
  //    FileExists(ExtractFilePath(Application.Exename) + 'hwsistemas.ini')) then
  begin
    //    vArqConfig := TIniFile.Create(vArqIni);
    //    if UpperCase(vArqConfig.ReadString('TRV', 'Config', 'Local')) <> 'LOCAL' then
    begin
      GetSystemDirectory(vSystemCH, MAX_PATH);
      vSystemIni := StrPas(vSystemCH);
      if DirectoryExists(vSystemIni) then
      begin
        vSystemIni := StringReplace(vSystemIni + '\ms001.ini', '\\', '\', [rfReplaceAll,
          rfIgnoreCase]);
        vArqIniTRV := vSystemIni;
      end;
    end;
  end;

  if (trim(vBancoOrigem) = '') or (trim(vBancoDestino) = '') or (trim(vDadosIni.vBancoHW) = '') then
  begin
    try
      vArqConfigTRV := TIniFile.Create(vArqIniTRV);
      vBancoOrigem := vArqConfigTRV.ReadString('TRV', 'Origem', '');
      vBancoDestino := vArqConfigTRV.ReadString('TRV', 'Destino', '');
      vCodEmpresaOrigem := vArqConfigTRV.ReadString('TRV', 'CodEmpresaOrigem', '');
      vCodEmpresaDestino := vArqConfigTRV.ReadString('TRV', 'CodEmpresaDestino', '');
      vDadosIni.vBancoHW := vArqConfigTRV.ReadString('TRV', 'Local', '');
      vReqAb := vArqConfigTRV.ReadString('TRV', 'ReqAb', '');
      vOSAb := vArqConfigTRV.ReadString('TRV', 'OSAb', '');
      vVerificarEstoque := vArqConfigTRV.ReadString('TRV', 'VerificarEstoque', '');
      vVerificarCpfCliente := vArqConfigTRV.ReadString('TRV', 'VerificarCpfCliente', '');
      vVerificarCpfVendedor := vArqConfigTRV.ReadString('TRV', 'VerificarCpfVendedor', '');
      vHashOr1 := vArqConfigTRV.ReadString('TRV', 'HashOr1', '');
      vHashOr2 := vArqConfigTRV.ReadString('TRV', 'HashOr2', '');
      vHashDs1 := vArqConfigTRV.ReadString('TRV', 'HashDs1', '');
      vHashDs2 := vArqConfigTRV.ReadString('TRV', 'HashDs2', '');

      if trim(vCodEmpresaOrigem) <> '' then
      begin
        try
          StrToInt(vCodEmpresaOrigem);
        except
          Application.MessageBox('Campo "CodEmpresaOrigem" incorreto nas configurações.' +
          	' Verifique seus arquivos *.Ini', 'Atenção', MB_OK + MB_ICONINFORMATION);
          exit;
        end;
      end;

      if trim(vCodEmpresaDestino) <> '' then
      begin
        try
          StrToInt(vCodEmpresaDestino);
        except
          Application.MessageBox('Campo "CodEmpresaDestino" incorreto configurações.' +
          	' Verifique seus arquivos *.Ini', 'Atenção', MB_OK + MB_ICONINFORMATION);
          exit;
        end;
      end;

      Result := true;

    finally
      vArqConfigTRV.Free;
    end;
  end
  else
  begin
    result := true;
  end;
end;

function TPedVendaTRV.processarVenda(gridProd, gridServ, gridTerc: TDBGrid;
  comDesc, comAcres, somenteSelecionados: boolean; valorDesc,
  valorAcres: Currency; OrcReq: boolean; OrcOS: boolean; OrcReqOs: boolean): boolean;
var
  i, nPedVenda: Integer;
  doc: string;
  vTipoOS: string;
  vObsPed: string;
  vObsOs: string;
  vObsPadOS: string;
  vTipoReqOS: string;
  vCodVendedor: Integer;
  vCodCliente: Integer;
  vCodClientePadrao: Integer;
begin
	try
    Result := false;
    FtodosP := true;
    FtodosS := true;

    vCodVendedor := 0;
    vCodCliente  := 0;
    vCodClientePadrao := 0;

    FvlrateioDesconto := 0;
    FvlrateioAcrescimo := 0;
    FvlDesconto := 0;
    FvlAcrescimo := 0;

    if vOrigem.vPedVenda.IsEmpty then
      Exit;

    vTipoReqOS := 'REQ';
    if (not vOrigem.vPedVendaServ.IsEmpty)
    	or (not vOrigem.vPedVendaProdTerc.IsEmpty)
      or (not vOrigem.vPedVendaServTerc.IsEmpty) then
      	vTipoReqOS := 'OS ';

    if (OrcReq) or (OrcOS) or (OrcReqOs) then
    begin
    	vDestino.buscas.Close;
	    vDestino.buscas.SQL.Text := ' select mensagem_emp from empresa ' +
      	' where cod_empresa = ' +
        	vDadosIni.IfThen(
        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		          trim(vCodEmpresaDestino),
              vDadosIni.codEmpresa);
      vDestino.buscas.Open;
      if buscas.IsEmpty then
      	vObsPed := ''
      else
	      vObsPed := buscas.FieldByName('mensagem_emp').AsString;

      vDestino.buscas.Close;
	    vDestino.buscas.SQL.Text := ' select obs_decl_os from empresa ' +
      	' where cod_empresa = ' +
        	vDadosIni.IfThen(
        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		          trim(vCodEmpresaDestino),
              vDadosIni.codEmpresa);
      vDestino.buscas.Open;
      if buscas.IsEmpty then
      	vObsOs := ''
      else
	      vObsOs := buscas.FieldByName('obs_decl_os').AsString;

    	vDestino.buscas.Close;
	    vDestino.buscas.SQL.Text := ' select obs_pad_os from empresa ' +
      	' where cod_empresa = ' +
        	vDadosIni.IfThen(
        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		          trim(vCodEmpresaDestino),
              vDadosIni.codEmpresa);
      vDestino.buscas.Open;
      if buscas.IsEmpty then
      	vObsPadOS := ''
      else
	      vObsPadOS := buscas.FieldByName('obs_pad_os').AsString;

      vDestino.buscas.Close;
	    vDestino.buscas.SQL.Text := 'select first 1 tipo_os from tipo_vendas ' +
      	' where tipo=''OS'' ' +
        ' order by ordemexibicao ';
      vDestino.buscas.Open;

      if buscas.IsEmpty then
      	vTipoOS := 'CLIENTE'
      else
	      vTipoOS := buscas.FieldByName('tipo_os').AsString;
    end;

    vDestino.buscas.Close;
    vDestino.buscas.SQL.Text := 'select nped, tipo, cod_empresa from ocorrencias_os ' +
      ' where nped = 0 ';

    if OrcReq then
	    vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and tipo = ' + QuotedStr('REQ')
    else if OrcOS then
    	vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and tipo = ' + QuotedStr('OS ')
    else if OrcReqOs then
      vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and tipo = ' + QuotedStr(vTipoReqOS)
    else
      vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

    vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
    	' and cod_empresa = ' +
      	vDadosIni.IfThen(
        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		          trim(vCodEmpresaDestino),
              vDadosIni.codEmpresa);
    vDestino.buscas.Open;

    if not vDestino.buscas.IsEmpty then
    begin
      vDestino.buscas.Close;
      vDestino.buscas.SQL.Text := ' delete from ocorrencias_os ' +
        ' where nped = 0 ';

      if OrcReq then
        vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
        	' and tipo = ' + QuotedStr('REQ')
      else if OrcOS then
        vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
        	' and tipo = ' + QuotedStr('OS ')
      else if OrcReqOs then
        vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
        	' and tipo = ' + QuotedStr(vTipoReqOS)
      else
        vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
        	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

      vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and cod_empresa = ' +
        	vDadosIni.IfThen(
        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		          trim(vCodEmpresaDestino),
              vDadosIni.codEmpresa);
      vDestino.buscas.ExecSQL;
      vDestino.CommitaTransacao;
    end;

    vDestino.buscas.Close;
    vDestino.buscas.SQL.Text := 'select nped, tipo, cod_empresa from pedvenda ' +
    	' where nped = 0 ';
      
    if OrcReq then
      vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and tipo = ' + QuotedStr('REQ')
    else if OrcOS then
      vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and tipo = ' + QuotedStr('OS ')
    else if OrcReqOs then
      vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and tipo = ' + QuotedStr(vTipoReqOS)
    else
      vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

    vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
    	' and cod_empresa = ' +
      	vDadosIni.IfThen(
        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		          trim(vCodEmpresaDestino),
              vDadosIni.codEmpresa);
    vDestino.buscas.Open;

    if not vDestino.buscas.IsEmpty then
    begin
      vDestino.buscas.Close;
	    vDestino.buscas.SQL.Text := ' delete from pedvenda ' +
	      ' where nped = 0 ';
        
  	  if OrcReq then
        vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
        	' and tipo = ' + QuotedStr('REQ')
      else if OrcOS then
        vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
        	' and tipo = ' + QuotedStr('OS ')
      else if OrcReqOs then
        vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
        	' and tipo = ' + QuotedStr(vTipoReqOS)
      else
        vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
        	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

    	vDestino.buscas.SQL.Text := vDestino.buscas.SQL.Text +
      	' and cod_empresa = ' +
        	vDadosIni.IfThen(
        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		          trim(vCodEmpresaDestino),
              vDadosIni.codEmpresa);
      vDestino.buscas.ExecSQL;
      vDestino.CommitaTransacao;
    end;

    //Abrindo Tabelas

    vDestino.vPedVenda.Close;
    vDestino.vPedVenda.CommandText := ' select * from pedvenda ' +
      ' where nped = 0 ';

    if OrcReq then
      vDestino.vPedVenda.CommandText := vDestino.vPedVenda.CommandText +
      	' and tipo = ' + QuotedStr('REQ')
    else if OrcOS then
      vDestino.vPedVenda.CommandText := vDestino.vPedVenda.CommandText +
      	' and tipo = ' + QuotedStr('OS ')
    else if OrcReqOs then
      vDestino.vPedVenda.CommandText := vDestino.vPedVenda.CommandText +
      	' and tipo = ' + QuotedStr(vTipoReqOS)
    else
      vDestino.vPedVenda.CommandText := vDestino.vPedVenda.CommandText +
      	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

    vDestino.vPedVenda.CommandText := vDestino.vPedVenda.CommandText +
    	' and cod_empresa = ' +
      	vDadosIni.IfThen(
        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		          trim(vCodEmpresaDestino),
              vDadosIni.codEmpresa);
    vDestino.vPedVenda.Open;
    
    vDestino.vPedVendaProd.Close;
    vDestino.vPedVendaProd.CommandText := ' select * from pedvenda_prod ' +
    	' where nped = 0 ';

    if OrcReq then
      vDestino.vPedVendaProd.CommandText := vDestino.vPedVendaProd.CommandText +
      	' and tipo = ' + QuotedStr('REQ')
    else if OrcOS then
      vDestino.vPedVendaProd.CommandText := vDestino.vPedVendaProd.CommandText +
      	' and tipo = ' + QuotedStr('OS ')
    else if OrcReqOs then
      vDestino.vPedVendaProd.CommandText := vDestino.vPedVendaProd.CommandText +
      	' and tipo = ' + QuotedStr(vTipoReqOS)
    else
      vDestino.vPedVendaProd.CommandText := vDestino.vPedVendaProd.CommandText +
      	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

    vDestino.vPedVendaProd.CommandText := vDestino.vPedVendaProd.CommandText +
    	' and cod_empresa = ' +
      	vDadosIni.IfThen(
        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		          trim(vCodEmpresaDestino),
              vDadosIni.codEmpresa);
    vDestino.vPedVendaProd.Open;

    vDestino.vPedVendaServ.Close;
    vDestino.vPedVendaServ.CommandText := ' select * from pedvenda_serv ' +
    	' where nped = 0 ';

    if OrcReq then
      vDestino.vPedVendaServ.CommandText := vDestino.vPedVendaServ.CommandText +
      	' and tipo = ' + QuotedStr('REQ')
    else if OrcOS then
      vDestino.vPedVendaServ.CommandText := vDestino.vPedVendaServ.CommandText +
      	' and tipo = ' + QuotedStr('OS ')
    else if OrcReqOs then
      vDestino.vPedVendaServ.CommandText := vDestino.vPedVendaServ.CommandText +
      	' and tipo = ' + QuotedStr(vTipoReqOS)
    else
      vDestino.vPedVendaServ.CommandText := vDestino.vPedVendaServ.CommandText +
      	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

    vDestino.vPedVendaServ.CommandText := vDestino.vPedVendaServ.CommandText +
    	' and cod_empresa = ' +
      	vDadosIni.IfThen(
        	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		        trim(vCodEmpresaDestino),
            vDadosIni.codEmpresa);
    vDestino.vPedVendaServ.Open;
    
    vDestino.vPedVendaServTerc.Close;
    vDestino.vPedVendaServTerc.CommandText := ' select * from pedvenda_serv_terc ' +
    	' where nped = 0 ';

    if OrcReq then
      vDestino.vPedVendaServTerc.CommandText := vDestino.vPedVendaServTerc.CommandText +
      	' and tipo = ' + QuotedStr('REQ')
    else if OrcOS then
      vDestino.vPedVendaServTerc.CommandText := vDestino.vPedVendaServTerc.CommandText +
      	' and tipo = ' + QuotedStr('OS ')
    else if OrcReqOs then
      vDestino.vPedVendaServTerc.CommandText := vDestino.vPedVendaServTerc.CommandText +
      	' and tipo = ' + QuotedStr(vTipoReqOS)
    else
      vDestino.vPedVendaServTerc.CommandText := vDestino.vPedVendaServTerc.CommandText +
      	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

    vDestino.vPedVendaServTerc.CommandText := vDestino.vPedVendaServTerc.CommandText +
    	' and cod_empresa = ' +
      	vDadosIni.IfThen(
        	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		        trim(vCodEmpresaDestino),
            vDadosIni.codEmpresa);
    vDestino.vPedVendaServTerc.Open;
    
    vDestino.vAparelho.Close;
    vDestino.vAparelho.CommandText := ' select * from equipamento where 1=0';
    vDestino.vAparelho.Open;

    vDestino.vOcorrencias.Close;
    vDestino.vOcorrencias.CommandText := ' select * from ocorrencias_os ' +
    	' where nped = 0 ';

    if OrcReq then
      vDestino.vOcorrencias.CommandText := vDestino.vOcorrencias.CommandText +
      	' and tipo = ' + QuotedStr('REQ')
    else if OrcOS then
      vDestino.vOcorrencias.CommandText := vDestino.vOcorrencias.CommandText +
      	' and tipo = ' + QuotedStr('OS ')
    else if OrcReqOs then
      vDestino.vOcorrencias.CommandText := vDestino.vOcorrencias.CommandText +
      	' and tipo = ' + QuotedStr(vTipoReqOS)
    else
      vDestino.vOcorrencias.CommandText := vDestino.vOcorrencias.CommandText +
      	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

    vDestino.vOcorrencias.CommandText := vDestino.vOcorrencias.CommandText +
    	' and cod_empresa = ' +
      	vDadosIni.IfThen(
        	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		        trim(vCodEmpresaDestino),
            vDadosIni.codEmpresa);
    vDestino.vOcorrencias.Open;

    vDestino.vMecanicos.Close;
    vDestino.vMecanicos.CommandText := ' select * from mecanico_os ' +
    	' where nped = 0 ';

    if OrcReq then
      vDestino.vMecanicos.CommandText := vDestino.vMecanicos.CommandText +
      	' and tipo = ' + QuotedStr('REQ')
    else if OrcOS then
      vDestino.vMecanicos.CommandText := vDestino.vMecanicos.CommandText +
      	' and tipo = ' + QuotedStr('OS ')
    else if OrcReqOs then
      vDestino.vMecanicos.CommandText := vDestino.vMecanicos.CommandText +
      	' and tipo = ' + QuotedStr(vTipoReqOS)
    else
      vDestino.vMecanicos.CommandText := vDestino.vMecanicos.CommandText +
      	' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);

    vDestino.vMecanicos.CommandText := vDestino.vMecanicos.CommandText +
    	' and cod_empresa = ' +
      	vDadosIni.IfThen(
        	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		        trim(vCodEmpresaDestino),
            vDadosIni.codEmpresa);
    vDestino.vMecanicos.Open;

    if trim(vVerificarCpfVendedor) = 'S' then
    begin
      vOrigem.buscas.Close;
      vOrigem.buscas.SQL.Text := ' select cod_vendedor, cod_empresa, cpf_vendedor, nome_vendedor from colaborador ' +
        ' where cod_vendedor = :cod_vendedor ' +
        ' and cod_empresa = :cod_empresa ' +
        ' order by cod_vendedor, cod_empresa ';
      vOrigem.buscas.ParamByName('cod_vendedor').AsInteger := vOrigem.dataSet.FieldByName('cod_vendedor').AsInteger;
      if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
        vOrigem.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vCodEmpresaOrigem)
      else
        vOrigem.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      vOrigem.buscas.Open;

    	if vOrigem.buscas.IsEmpty then
      begin
      	Application.MessageBox(PChar('Vendedor do banco de origem não encontrado no cadastro.'),	'Atenção', MB_ICONWARNING + MB_OK);
      	Result := False;
       	exit;
      end;

      if trim(vOrigem.buscas.FieldByName('cpf_vendedor').AsString) = '' then
      begin
      	Application.MessageBox(PChar('Vendedor do banco de origem sem cpf informado, favor verificar cadastro antes de continuar.' + #13 + #13 +
        	'VENDEDOR' +
          'Codigo: ' + IntToStr(vOrigem.buscas.FieldByName('cod_vendedor').AsInteger) + #13 +
          'Nome: ' + trim(vOrigem.buscas.FieldByName('nome_vendedor').AsString) + #13 +
          'Cpf: ' + trim(vOrigem.buscas.FieldByName('cpf_vendedor').AsString)),
        	'Atenção',
          mb_OK);
      	Result := False;
       	exit;
      end;

      vDestino.buscas.Close;
      vDestino.buscas.SQL.Text := ' select first 1 cod_vendedor, cod_empresa, cpf_vendedor, nome_vendedor from colaborador ' +
        ' where cpf_vendedor = :cpf_vendedor ' +
        ' and cod_empresa = :cod_empresa ' +
        ' order by cod_vendedor, cod_empresa ';
      vDestino.buscas.ParamByName('cpf_vendedor').AsString := vOrigem.buscas.FieldByName('cpf_vendedor').AsString;
      if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
        vDestino.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vCodEmpresaDestino)
      else
        vDestino.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      vDestino.buscas.Open;

    	if vDestino.buscas.IsEmpty then
      begin
      	Application.MessageBox(PChar('Vendedor do banco de destino não encontrado no cadastro.' + #13 + #13 +
        	'VENDEDOR' +
          'Nome: ' + trim(vOrigem.buscas.FieldByName('nome_vendedor').AsString) + #13 +
          'Cpf: ' + trim(vOrigem.buscas.FieldByName('cpf_vendedor').AsString)),
        	'Atenção',
          mb_OK);
      	Result := False;
       	exit;
      end;

      vCodVendedor := vDestino.buscas.FieldByName('cod_vendedor').AsInteger;
    end;

    if trim(vVerificarCpfCliente) = 'S' then
    begin
    	vOrigem.buscas.Close;
      vOrigem.buscas.SQL.Text := ' select chave, cod_empresa, value1_f from config_sistema cs ' +
      	' where cs.chave = ''cl_conf_codigo_cliente_padrao'' ' +
        ' and cs.cod_empresa = :cod_empresa ';
      if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
        vOrigem.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vCodEmpresaOrigem)
      else
        vOrigem.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      vOrigem.buscas.Open;

      if vOrigem.buscas.FieldByName('value1_f').AsInteger = vOrigem.dataSet.FieldByName('cod_cliente').AsInteger then
      begin
      	vCodClientePadrao := vOrigem.buscas.FieldByName('value1_f').AsInteger;

        vOrigem.buscas.Close;
        vOrigem.buscas.SQL.Text := ' select cod_cliente, cod_empresa, cpfcgc, nome_cliente from clientes ' +
          ' where cod_cliente = :cod_cliente ' +
          ' and cod_empresa = :cod_empresa ' +
          ' order by cod_cliente, cod_empresa ';
        vOrigem.buscas.ParamByName('cod_cliente').AsInteger := vOrigem.dataSet.FieldByName('cod_cliente').AsInteger;
        if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
          vOrigem.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vCodEmpresaOrigem)
        else
          vOrigem.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        vOrigem.buscas.Open;

        if vOrigem.buscas.IsEmpty then
        begin
          Application.MessageBox(PChar('Cliente padrão do banco de origem não encontrado no cadastro.'),	'Atenção', MB_ICONWARNING + MB_OK);
          Result := False;
          exit;
        end;

        vDestino.buscas.Close;
        vDestino.buscas.SQL.Text := ' select chave, cod_empresa, value1_f from config_sistema cs ' +
          ' where cs.chave = ''cl_conf_codigo_cliente_padrao'' ' +
          ' and cs.cod_empresa = :cod_empresa ';
        if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
          vDestino.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vCodEmpresaDestino)
        else
          vDestino.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        vDestino.buscas.Open;

        if vDestino.buscas.IsEmpty then
        begin
          Application.MessageBox(PChar('Cliente Padrão do banco de destino não encontrado nas configurações.'),	'Atenção', MB_ICONWARNING + MB_OK);
          Result := False;
          exit;
        end;

        vCodClientePadrao := vDestino.buscas.FieldByName('value1_f').AsInteger;

        if vCodClientePadrao <= 0 then
        begin
        	Application.MessageBox(PChar('Cliente Padrão do banco de destino não informado nas configurações.'),	'Atenção', MB_ICONWARNING + MB_OK);
          Result := False;
          exit;
        end;

        vDestino.buscas.Close;
        vDestino.buscas.SQL.Text := ' select first 1 cod_cliente, cod_empresa, cpfcgc, nome_cliente from clientes ' +
          ' where cod_cliente = :cod_cliente ' +
          ' and cod_empresa = :cod_empresa ' +
          ' order by cod_cliente, cod_empresa ';
        vDestino.buscas.ParamByName('cod_cliente').AsInteger := vCodClientePadrao;
        if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
          vDestino.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vCodEmpresaDestino)
        else
          vDestino.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        vDestino.buscas.Open;

        if vDestino.buscas.IsEmpty then
        begin
          Application.MessageBox(PChar('Cliente do banco de destino não encontrado no cadastro.'),	'Atenção', MB_ICONWARNING + MB_OK);
          Result := False;
          exit;
        end;

        vCodCliente := vDestino.buscas.FieldByName('cod_cliente').AsInteger;
      end
      else
      begin
        vOrigem.buscas.Close;
        vOrigem.buscas.SQL.Text := ' select cod_cliente, cod_empresa, cpfcgc, nome_cliente from clientes ' +
          ' where cod_cliente = :cod_cliente ' +
          ' and cod_empresa = :cod_empresa ' +
          ' order by cod_cliente, cod_empresa ';
        vOrigem.buscas.ParamByName('cod_cliente').AsInteger := vOrigem.dataSet.FieldByName('cod_cliente').AsInteger;
        if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
          vOrigem.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vCodEmpresaOrigem)
        else
          vOrigem.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        vOrigem.buscas.Open;

        if vOrigem.buscas.IsEmpty then
        begin
          Application.MessageBox(PChar('Cliente do banco de origem não encontrado no cadastro.'),	'Atenção', MB_ICONWARNING + MB_OK);
          Result := False;
          exit;
        end;

        if trim(vOrigem.buscas.FieldByName('cpfcgc').AsString) = '' then
        begin
          Application.MessageBox(PChar('Cliente do banco de origem sem cpf informado, favor verificar cadastro antes de continuar.' + #13 + #13 +
            'CLIENTE' +
            'Codigo: ' + IntToStr(vOrigem.buscas.FieldByName('cod_cliente').AsInteger) + #13 +
            'Nome: ' + trim(vOrigem.buscas.FieldByName('nome_cliente').AsString) + #13 +
            'Cpf: ' + trim(vOrigem.buscas.FieldByName('cpfcgc').AsString)),
            'Atenção',
            mb_OK);
          Result := False;
          exit;
        end;

        vDestino.buscas.Close;
        vDestino.buscas.SQL.Text := ' select first 1 cod_cliente, cod_empresa, cpfcgc, nome_cliente from clientes ' +
          ' where cpfcgc = :cpfcgc ' +
          ' and cod_empresa = :cod_empresa ' +
          ' order by cod_cliente, cod_empresa ';
        vDestino.buscas.ParamByName('cpfcgc').AsString := vOrigem.buscas.FieldByName('cpfcgc').AsString;
        if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
          vDestino.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vCodEmpresaDestino)
        else
          vDestino.buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
        vDestino.buscas.Open;

        if vDestino.buscas.IsEmpty then
        begin
          Application.MessageBox(PChar('Cliente do banco de destino não encontrado no cadastro.' + #13 + #13 +
	          'CLIENTE' +
            'Nome: ' + trim(vOrigem.buscas.FieldByName('nome_cliente').AsString) + #13 +
            'Cpf: ' + trim(vOrigem.buscas.FieldByName('cpfcgc').AsString)),
            'Atenção',
            mb_OK);
          Result := False;
          exit;
        end;

        vCodCliente := vDestino.buscas.FieldByName('cod_cliente').AsInteger;
      end;
    end;

    //Fazendo somatorios
    somar(gridProd, gridServ, gridTerc, somenteSelecionados);

    //Definindo valores de descontos
    if comDesc then
      FvalorDesconto := valorDesc;
    if comAcres then
      FvalorAcrescimo := valorAcres;

    if not ValidarCamposObrigatorios then
      exit;

    //PedVenda
    vDestino.vPedVenda.Insert;
    for i := 1 to vDestino.vPedVenda.FieldCount - 1 do
    begin
      vDestino.vPedVenda.fields[i].Value := vOrigem.vPedVenda.FieldByName(vDestino.vPedVenda.fields[i].FieldName).Value;

      if (trim(vVerificarCpfVendedor) = 'S')
        and (vCodVendedor > 0)
        and (UpperCase(trim(vDestino.vPedVenda.fields[i].FieldName)) = 'COD_VENDEDOR') then
      begin
        vDestino.vPedVenda.fields[i].Value := vCodVendedor;
      end;

      if (trim(vVerificarCpfCliente) = 'S')
        and (vCodCliente > 0)
        and (UpperCase(trim(vDestino.vPedVenda.fields[i].FieldName)) = 'COD_CLIENTE') then
      begin
        vDestino.vPedVenda.fields[i].Value := vCodCliente;
      end;
    end;

    //vOrigem.vPedVenda.fields[i].Value;
    if (OrcReq) or (OrcReqOs and (trim(vTipoReqOS) = 'REQ')) then
    	vDestino.vPedVenda.FieldByName('tipo').AsString := 'REQ'
    else if (OrcOS) or (OrcReqOs and (trim(vTipoReqOS) = 'OS')) then
    begin
    	vDestino.vPedVenda.FieldByName('tipo').AsString := 'OS ';

      if trim(vOrigem.vPedVenda.FieldByName('TIPO_OS').AsString) = '' then
        vDestino.vPedVenda.FieldByName('TIPO_OS').AsString := vTipoOS;
    end;

    if (OrcReq) or (OrcOS) or (OrcReqOs) then
  	begin
    	if trim(vOrigem.vPedVenda.FieldByName('OBS_PED').AsString) = '' then
	      vDestino.vPedVenda.FieldByName('OBS_PED').AsString := vObsPed;

      if trim(vOrigem.vPedVenda.FieldByName('OBS_OS').AsString) = '' then
	      vDestino.vPedVenda.FieldByName('OBS_OS').AsString := vObsOs;

    	if trim(vOrigem.vPedVenda.FieldByName('ESTADO_VEIC').AsString) = '' then
	      vDestino.vPedVenda.FieldByName('ESTADO_VEIC').AsString := vObsPadOS;

      if vOrigem.vPedVenda.FieldByName('H_ENT').IsNull then
	      vDestino.vPedVenda.FieldByName('H_ENT').value := now;

      if vOrigem.vPedVenda.FieldByName('DT_PROMETIDA').IsNull then
	      vDestino.vPedVenda.FieldByName('DT_PROMETIDA').AsDateTime := DateOf(now);

      if vOrigem.vPedVenda.FieldByName('H_PROMETIDA').IsNull then
	      vDestino.vPedVenda.FieldByName('H_PROMETIDA').value := now;

      if vOrigem.vPedVenda.FieldByName('OBS_LIVRO_REG').IsNull then
      	vDestino.vPedVenda.FieldByName('OBS_LIVRO_REG').AsString := '...';
    end;

    vDestino.vPedVenda.FieldByName('TOT_PROD').AsCurrency := FvalorProdutos;
    vDestino.vPedVenda.FieldByName('TOT_SERV').AsCurrency := FvalorServicos;
    i := existeEquipamento(vDestino.vPedVenda.FieldByName('COD_EQUIP').AsInteger);
    if vOrigem.vPedVenda.FieldByName('COD_EQUIP').AsInteger <> 0 then
      vDestino.vPedVenda.FieldByName('COD_EQUIP').AsInteger := I;
    vDestino.vPedVenda.FieldByName('STATUS_PED').AsString := '';
    vDestino.vPedVenda.FieldByName('DATA_FECH').AsString := '';

    vDestino.vPedVenda.FieldByName('DIA_CXL').Clear;
    vDestino.vPedVenda.FieldByName('OBS_CXL_RQ').Clear;
    vDestino.vPedVenda.FieldByName('STATUS_CXL_RQ').Clear;
    vDestino.vPedVenda.FieldByName('VL_PAGO_CXL').Clear;
    vDestino.vPedVenda.FieldByName('OP_CXL').Clear;

    vDestino.vPedVenda.FieldByName('NCUPOM').Clear;
    vDestino.vPedVenda.FieldByName('OPERADOR').Clear;
    vDestino.vPedVenda.FieldByName('NSERIEECF').Clear;

    vDestino.vPedVenda.FieldByName('NUM_NF').Clear;
    vDestino.vPedVenda.FieldByName('VALOR_NF').Clear;
    //vDestino.vPedVenda.FieldByName('SERIE_NF').Clear;
    vDestino.vPedVenda.FieldByName('VALOR_NF').Clear;

    vDestino.vPedVenda.FieldByName('nped').AsInteger := 0;

    if vDadosIni.IfThen(OrcReq, 'REQ',
    	vDadosIni.IfThen((OrcReqOs) and (trim(vTipoReqOS) = 'REQ'), 'REQ', trim(vOrigem.vPedVenda.FieldByName('tipo').AsString))
      																) = 'REQ' then
    begin
      //    vDestino.vPedVenda.FieldByName('nped').AsInteger := GenCodigo('REQVENDA');
      if (vDadosIni.vEmp.vUsarDAV = 'S') then
        //and (vDestino.vPedVenda.FieldByName('NPREVENDA').AsInteger =    0) then
        vDestino.vPedVenda.FieldByName('NPREVENDA').AsInteger :=
        	GenCodigo('PREVENDA',
          	dtmTRV.SpIncCodDest,
            	vDadosIni.IfThen(
		        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
				          trim(vCodEmpresaDestino),
        		      vDadosIni.codEmpresa));
    end
    else if vDadosIni.IfThen(OrcOS, 'OS',
    	vDadosIni.IfThen((OrcReqOs) and (trim(vTipoReqOS) = 'OS'), 'OS', trim(vOrigem.vPedVenda.FieldByName('tipo').AsString))
      														       ) = 'OS' then
    begin
      //    vOrigem.vPedVenda.FieldByName('nped').AsInteger := GenCodigo('ORDEM_SERV');
      vDestino.vPedVenda.FieldByName('SEQ_FECH').AsInteger :=
      	GenCodigo('SEQ_FECH',
        	dtmTRV.SpIncCodDest,
          	vDadosIni.IfThen(
		        	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
				        trim(vCodEmpresaDestino),
        		    vDadosIni.codEmpresa));
      if (vDadosIni.vEmp.vUsarDAVOS = 'S') then
        //and (vDestino.vPedVenda.FieldByName('NPREVENDA').AsInteger  = 0) then
        vDestino.vPedVenda.FieldByName('NPREVENDA').AsInteger :=
        	GenCodigo('PREVENDA',
          	dtmTRV.SpIncCodDest,
            	vDadosIni.IfThen(
		        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
				          trim(vCodEmpresaDestino),
        		      vDadosIni.codEmpresa));
    end
    else
    begin
      if (vDadosIni.vEmp.vUsarDAV = 'S') then
        //and (vDestino.vPedVenda.FieldByName('NPREVENDA').AsInteger  = 0) then
        vDestino.vPedVenda.FieldByName('NPREVENDA').AsInteger :=
        	GenCodigo('PREVENDA',
          	dtmTRV.SpIncCodDest,
            	vDadosIni.IfThen(
		        		(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
				          trim(vCodEmpresaDestino),
        		      vDadosIni.codEmpresa));
    end;
    vDestino.vPedVenda.FieldByName('VALOR_TOTAL').AsCurrency := FvalorProdutos + FvalorServicos +
      FvalorServTerc + FvalorAcrescimo - FvalorDesconto;
    vDestino.vPedVenda.FieldByName('DESCONTO').AsCurrency := 0; //FvalorDesconto;
    vDestino.vPedVenda.FieldByName('ACRESCIMO').AsCurrency := 0; //FvalorAcrescimo;
    vDestino.vPedVenda.FieldByName('DESC_P_PROD').AsCurrency := 0;
    vDestino.vPedVenda.FieldByName('DESC_P_SERV').AsCurrency := 0;

    if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
	    vDestino.vPedVenda.FieldByName('COD_EMPRESA').AsInteger := StrToInt(trim(vCodEmpresaDestino));

    vDestino.buscas.close;
    vDestino.buscas.sql.text := ' select chassi from veiculos ' +
    	' where cod_empresa = ' +
      	vDadosIni.IfThen(
		    	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
				  	trim(vCodEmpresaDestino),
        		vDadosIni.codEmpresa) +
      ' and ativo = 1 ' +
      ' and placa = ' + QuotedStr(vDestino.vPedVenda.FieldByName('PLACA').AsString);
    vDestino.buscas.Open;
    if not vDestino.buscas.IsEmpty then
      vDestino.vPedVenda.FieldByName('CHASSI').AsString :=
        vDestino.buscas.fieldbyname('chassi').AsString;
    vDestino.buscas.close;
    vDestino.vPedVenda.Post;

    //PedVenda_Prod
    vOrigem.vPedVendaProd.First;
    while not vOrigem.vPedVendaProd.Eof do
    begin
      if (((gridProd.SelectedRows.CurrentRowSelected) and (somenteSelecionados)) or
        (not somenteSelecionados)) and
        (vOrigem.vPedVendaProd.FieldByName('UTILIZAR').AsFloat > 0) then
      begin
        FvlrateioDesconto := FvlrateioDesconto + vOrigem.vPedVendaProd.FieldByName('RATEIO_DESC').AsCurrency;
        FvlrateioAcrescimo := FvlrateioAcrescimo + vOrigem.vPedVendaProd.FieldByName('RATEIO_ACRESC').AsCurrency;
        FvlDesconto := FvlDesconto + vOrigem.vPedVendaProd.FieldByName('DESC_ITEM').AsCurrency;
        FvlAcrescimo := FvlAcrescimo + vOrigem.vPedVendaProd.FieldByName('ACRESC_ITEM').AsCurrency;

        vDestino.vPedVendaProd.Insert;
        for i := 0 to vDestino.vPedVendaProd.FieldCount - 1 do
        begin
          vDestino.vPedVendaProd.fields[i].Value :=
            vOrigem.vPedVendaProd.FieldByName(vDestino.vPedVendaProd.fields[i].FieldName).Value;

          if (trim(vVerificarCpfVendedor) = 'S')
            and (vCodVendedor > 0)
            and (UpperCase(trim(vDestino.vPedVendaProd.fields[i].FieldName)) = 'COD_VENDEDOR') then
          begin
            vDestino.vPedVendaProd.fields[i].Value := vCodVendedor;
          end;
        end;

        if OrcReq then
    			vDestino.vPedVendaProd.FieldByName('tipo').AsString := 'REQ'
        else if OrcOS then
		    	vDestino.vPedVendaProd.FieldByName('tipo').AsString := 'OS '
        else if OrcReqOs then
        	vDestino.vPedVendaProd.FieldByName('tipo').AsString := vTipoReqOS;

        vDestino.vPedVendaProd.FieldByName('nped').AsInteger := 0;
        vDestino.vPedVendaProd.FieldByName('QUANT_PED_item').AsFloat :=
          vOrigem.vPedVendaProd.FieldByName('UTILIZAR').AsFloat;
        vDestino.vPedVendaProd.FieldByName('VLTOT_PED_ITEM').AsCurrency :=
          vDestino.vPedVendaProd.FieldByName('QUANT_PED_item').AsFloat *
          vDestino.vPedVendaProd.FieldByName('VLUN_PED_ITEM').AsCurrency;

        if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
	        vDestino.vPedVendaProd.FieldByName('cod_empresa').AsInteger := StrToInt(trim(vCodEmpresaDestino));

        vDestino.vPedVendaProd.Post;
      end
      else
        FtodosP := false;
      vOrigem.vPedVendaProd.Next;
    end;

    if (trim(vOrigem.vPedVenda.FieldByName('tipo').AsString) = 'ORC')
    	or (trim(vOrigem.vPedVenda.FieldByName('tipo').AsString) = 'OS')
      and (not OrcReq) then
    begin
      //PedVenda_Serv
      vOrigem.vPedVendaServ.First;
      while not vOrigem.vPedVendaServ.Eof do
      begin
        if ((gridServ.SelectedRows.CurrentRowSelected) and (somenteSelecionados)) or
          (not somenteSelecionados) then
        begin
          FvlrateioDesconto := FvlrateioDesconto + vOrigem.vPedVendaServ.FieldByName('RATEIO_DESC').AsCurrency;
          FvlrateioAcrescimo := FvlrateioAcrescimo + vOrigem.vPedVendaServ.FieldByName('RATEIO_ACRESC').AsCurrency;
          FvlDesconto := FvlDesconto + vOrigem.vPedVendaServ.FieldByName('DESC_ITEM').AsCurrency;
          FvlAcrescimo := FvlAcrescimo + vOrigem.vPedVendaServ.FieldByName('ACRESC_ITEM').AsCurrency;

          vDestino.vPedVendaServ.Insert;
          for i := 0 to vOrigem.vPedVendaServ.FieldCount - 1 do
          begin
            vDestino.vPedVendaServ.fields[i].Value :=
              vOrigem.vPedVendaServ.FieldByName(vDestino.vPedVendaServ.fields[i].FieldName).Value;

            if (trim(vVerificarCpfVendedor) = 'S')
              and (vCodVendedor > 0)
              and (UpperCase(trim(vDestino.vPedVendaServ.fields[i].FieldName)) = 'COD_VENDEDOR') then
            begin
              vDestino.vPedVendaServ.fields[i].Value := vCodVendedor;
            end;
          end;

          if OrcReq then
            vDestino.vPedVendaServ.FieldByName('tipo').AsString := 'REQ'
          else if OrcOS then
            vDestino.vPedVendaServ.FieldByName('tipo').AsString := 'OS '
          else if OrcReqOs then
	        	vDestino.vPedVendaServ.FieldByName('tipo').AsString := vTipoReqOS;

          vDestino.vPedVendaServ.FieldByName('nped').AsInteger := 0;

          if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
	        	vDestino.vPedVendaServ.FieldByName('cod_empresa').AsInteger := StrToInt(trim(vCodEmpresaDestino));

          vDestino.vPedVendaServ.Post;
        end
        else
          FtodosS := false;
        vOrigem.vPedVendaServ.Next;
      end;
    end;

    if (trim(vOrigem.vPedVenda.FieldByName('tipo').AsString) = 'ORC')
    	or (trim(vOrigem.vPedVenda.FieldByName('tipo').AsString) = 'OS')
      and (not OrcReq) then
    begin
      //PedVenda_Serv_Terc
      vOrigem.vPedVendaServTerc.First;
      while not vOrigem.vPedVendaServTerc.Eof do
      begin
        if ((gridTerc.SelectedRows.CurrentRowSelected) and (somenteSelecionados)) or
          (not somenteSelecionados) then
        begin
          vDestino.vPedVendaServTerc.Insert;
          for i := 0 to vOrigem.vPedVendaServTerc.FieldCount - 1 do
            vDestino.vPedVendaServTerc.fields[i].Value :=
              vOrigem.vPedVendaServTerc.FieldByName(vDestino.vPedVendaServTerc.fields[i].FieldName).Value;

          if OrcReq then
            vDestino.vPedVendaServTerc.FieldByName('tipo').AsString := 'REQ'
          else if OrcOS then
            vDestino.vPedVendaServTerc.FieldByName('tipo').AsString := 'OS '
          else if OrcReqOs then
	        	vDestino.vPedVendaServTerc.FieldByName('tipo').AsString := vTipoReqOS;

          vDestino.vPedVendaServTerc.FieldByName('nped').AsInteger := 0;

          if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
	        	vDestino.vPedVendaServTerc.FieldByName('cod_empresa').AsInteger := StrToInt(trim(vCodEmpresaDestino));

          vDestino.vPedVendaServTerc.Post;
        end;
        vOrigem.vPedVendaServTerc.Next;
      end;
    end;
  //
  //  //Ocorrencias
//    vOrigem.buscas.Close;
//    vOrigem.buscas.SQL.Text := 'select * from ocorrencias_os ' +
//    	' where nped = ' + vOrigem.vPedVenda.FieldByName('nped').AsString +
//      ' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString);
  //  vOrigem.buscas.Open;
  //  vOrigem.buscas.First;
  //  while not vOrigem.buscas.Eof do
  //  begin
  //    vDestino.vOcorrencias.Insert;
  //    for i := 0 to vDestino.vOcorrencias.FieldCount - 1 do
  //      vDestino.vOcorrencias.fields[i].Value :=
  //        vOrigem.buscas.FieldByName(vDestino.vOcorrencias.fields[i].FieldName).Value;
  //    vDestino.vOcorrencias.FieldByName('nped').AsInteger := 0;
  //    vDestino.vOcorrencias.Post;
  //    vOrigem.buscas.Next;
  //  end;

    if (trim(vOrigem.vPedVenda.FieldByName('tipo').AsString) = 'ORC')
    	or (trim(vOrigem.vPedVenda.FieldByName('tipo').AsString) = 'OS')
      and (not OrcReq) then
    begin
      //Mecanicos OS
      vOrigem.buscas.Close;
      vOrigem.buscas.SQL.Text := 'select * from mecanico_os ' +
        ' where nped = ' + IntToStr(vOrigem.vPedVenda.FieldByName('nped').AsInteger) +
        ' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString) +
        ' and cod_empresa = ' +
        	vDadosIni.IfThen(
		    	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
				  	trim(vCodEmpresaOrigem),
        		vDadosIni.codEmpresa);
      vOrigem.buscas.Open;
      vOrigem.buscas.First;
      while not vOrigem.buscas.Eof do
      begin
        vOrigem.vPedVendaServ.First;
        while not vOrigem.vPedVendaServ.Eof do
        begin
          if ((gridServ.SelectedRows.CurrentRowSelected) and (somenteSelecionados)) or
            (not somenteSelecionados) then
          begin
            if (vOrigem.vPedVendaServ.FieldByName('COD_SERVICO').AsInteger =
              vDestino.vMecanicos.FieldByName('COD_SERVICO').AsInteger) and
              (vOrigem.vPedVendaServ.FieldByName('codigo_nop').AsInteger =
              vDestino.vMecanicos.FieldByName('codigo_nop').AsInteger) then
            begin
              vDestino.vMecanicos.Insert;
              for i := 0 to vDestino.vMecanicos.FieldCount - 1 do
                vDestino.vMecanicos.fields[i].Value :=
                  vOrigem.buscas.FieldByName(vDestino.vMecanicos.fields[i].FieldName).Value;

              if OrcReq then
                vDestino.vMecanicos.FieldByName('tipo').AsString := 'REQ'
              else if OrcOS then
                vDestino.vMecanicos.FieldByName('tipo').AsString := 'OS '
              else if OrcReqOs then
			        	vDestino.vMecanicos.FieldByName('tipo').AsString := vTipoReqOS;

              vDestino.vMecanicos.FieldByName('nped').AsInteger := 0;

              if (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> '') then
	        			vDestino.vMecanicos.FieldByName('cod_empresa').AsInteger := StrToInt(trim(vCodEmpresaDestino));

              vDestino.vMecanicos.Post;
            end;
          end;
          vOrigem.vPedVendaServ.Next;
        end;
        vOrigem.buscas.Next;
      end;
    end;
    //Gravando tipo de venda no cliente
    gravaTipoVendaCliente(OrcReq, OrcOS, OrcReqOs);
    //Efetuando rateios nos produtos e servicos
  //  efetuaRateios;
    //Gravando numero do pedvenda para a OS ou REQ
    if vDadosIni.IfThen(OrcReq, 'REQ',
    	vDadosIni.IfThen((OrcReqOs) and (trim(vTipoReqOS) = 'REQ'), 'REQ', trim(vDestino.vPedVenda.FieldByName('tipo').AsString))
      															  ) = 'REQ' then
    begin
      doc := 'REQVENDA';
      nPedVenda :=
      	Gencodigo('REQVENDA',
        	dtmTRV.SpIncCodDest,
          	vDadosIni.IfThen(
				    	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						  	trim(vCodEmpresaDestino),
        				vDadosIni.codEmpresa));
    end
    else if vDadosIni.IfThen(OrcOS, 'OS',
    	vDadosIni.IfThen((OrcReqOs) and (trim(vTipoReqOS) = 'OS'), 'OS', trim(vDestino.vPedVenda.FieldByName('tipo').AsString))
      		                               ) = 'OS' then
    begin
      doc := 'ORDEM_SERV';
      nPedVenda :=
      	Gencodigo('ORDEM_SERV',
        	dtmTRV.SpIncCodDest,
          	vDadosIni.IfThen(
				    	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						  	trim(vCodEmpresaDestino),
        				vDadosIni.codEmpresa));
    end
    else
    begin
      doc := 'ORCAMENTOS';
      nPedVenda := Gencodigo('ORCAMENTOS',
      	dtmTRV.SpIncCodDest,
        	vDadosIni.IfThen(
				  	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
							trim(vCodEmpresaDestino),
        			vDadosIni.codEmpresa));
    end;
    vDestino.vPedVenda.Edit;
    vDestino.vPedVenda.FieldByName('nped').AsInteger := nPedVenda;
    // Alterando desconto
  //  if ((FtodosP) and (FtodosS)) then
  //  begin
      vDestino.vPedVenda.FieldByName('desconto').AsCurrency := FvlrateioDesconto - FvlDesconto;
      vDestino.vPedVenda.FieldByName('acrescimo').AsCurrency := FvlrateioAcrescimo - FvlAcrescimo;
  //  end;
    vDestino.vPedVenda.Post;
    vDestino.vPedVendaProd.First;
    while not vDestino.vPedVendaProd.Eof do
    begin
      vDestino.vPedVendaProd.Edit;
      vDestino.vPedVendaProd.FieldByName('nped').AsInteger := nPedVenda;
      vDestino.vPedVendaProd.Post;
      vDestino.vPedVendaProd.Next;
    end;
    vDestino.vPedVendaServ.First;
    while not vDestino.vPedVendaServ.Eof do
    begin
      vDestino.vPedVendaServ.Edit;
      vDestino.vPedVendaServ.FieldByName('nped').AsInteger := nPedVenda;
      vDestino.vPedVendaServ.Post;
      vDestino.vPedVendaServ.Next;
    end;
    vDestino.vPedVendaServTerc.First;
    while not vDestino.vPedVendaServTerc.Eof do
    begin
      vDestino.vPedVendaServTerc.Edit;
      vDestino.vPedVendaServTerc.FieldByName('nped').AsInteger := nPedVenda;
      vDestino.vPedVendaServTerc.Post;
      vDestino.vPedVendaServTerc.Next;
    end;
    vDestino.vMecanicos.First;
    while not vDestino.vMecanicos.Eof do
    begin
      vDestino.vMecanicos.Edit;
      vDestino.vMecanicos.FieldByName('nped').AsInteger := nPedVenda;
      vDestino.vMecanicos.FieldByName('n_os').AsInteger := nPedVenda;
      vDestino.vMecanicos.Post;
      vDestino.vMecanicos.Next;
    end;
    vDestino.vOcorrencias.First;
    while not vDestino.vOcorrencias.Eof do
    begin
      vDestino.vOcorrencias.Edit;
      vDestino.vOcorrencias.FieldByName('nped').AsInteger := nPedVenda;
      vDestino.vOcorrencias.FieldByName('n_os').AsInteger := nPedVenda;
      vDestino.vOcorrencias.Post;
      vDestino.vOcorrencias.Next;
    end;

    //Gravando transacao no banco de dados Destino

    try
      vDestino.vPedVenda.OnReconcileError := dataSetReconcileError;
      vDestino.vPedVendaProd.OnReconcileError := dataSetReconcileError;
      vDestino.vPedVendaServ.OnReconcileError := dataSetReconcileError;
      vDestino.vPedVendaServTerc.OnReconcileError := dataSetReconcileError;
      vDestino.vAparelho.OnReconcileError := dataSetReconcileError;
      vDestino.vOcorrencias.OnReconcileError := dataSetReconcileError;
      vDestino.vMecanicos.OnReconcileError := dataSetReconcileError;

      if vDestino.vPedVenda.ChangeCount > 0 then
        if vDestino.vPedVenda.ApplyUpdates(-1) > 0 then
          raiseExceptionCreate('Erro ao salvar dados', '');
      if vDestino.vPedVendaProd.ChangeCount > 0 then
        if vDestino.vPedVendaProd.ApplyUpdates(-1) > 0 then
          raiseExceptionCreate('Erro ao salvar dados', '');
      if vDestino.vPedVendaServ.ChangeCount > 0 then
        if vDestino.vPedVendaServ.ApplyUpdates(-1) > 0 then
          raiseExceptionCreate('Erro ao salvar dados', '');
      if vDestino.vPedVendaServTerc.ChangeCount > 0 then
        if vDestino.vPedVendaServTerc.ApplyUpdates(-1) > 0 then
          raiseExceptionCreate('Erro ao salvar dados', '');
      if vDestino.vAparelho.ChangeCount > 0 then
        if vDestino.vAparelho.ApplyUpdates(-1) > 0 then
          raiseExceptionCreate('Erro ao salvar dados', '');
      if vDestino.vOcorrencias.ChangeCount > 0 then
        if vDestino.vOcorrencias.ApplyUpdates(-1) > 0 then
          raiseExceptionCreate('Erro ao salvar dados', '');
      if vDestino.vMecanicos.ChangeCount > 0 then
        if vDestino.vMecanicos.ApplyUpdates(-1) > 0 then
          raiseExceptionCreate('Erro ao salvar dados', '');
    finally
      vDestino.vPedVenda.OnReconcileError := nil;
      vDestino.vPedVendaProd.OnReconcileError := nil;
      vDestino.vPedVendaServ.OnReconcileError := nil;
      vDestino.vPedVendaServTerc.OnReconcileError := nil;
      vDestino.vAparelho.OnReconcileError := nil;
      vDestino.vOcorrencias.OnReconcileError := nil;
      vDestino.vMecanicos.OnReconcileError := nil;
    end;

    vDestino.CommitaTransacao;
    Result := true;
  except
    on e: exception do begin
      vDestino.RollBackTransacao;
      Application.MessageBox(pchar('Não foi possivel concluir operação. Erro: ' + e.Message),
        'Atenção', MB_OK + MB_ICONEXCLAMATION);
      registraErro(e.Message);

    end;
  end;
  //  SincDocHW(pchar(doc), pchar(IntToStr(nPedVenda)), pchar(vBancoDestino), 1,
  //    StrToInt(vDadosIni.codEmpresa));

    //Alterando pedvenda como processado na Origem
  if Result then
  begin
    vOrigem.ExecutaComandosSqlExec(' update pedvenda set processada_sl = 1 ' +
    	' where nped = ' + vOrigem.vPedVenda.FieldByName('nped').AsString +
      ' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString) +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
				  (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						trim(vCodEmpresaOrigem),
        		vDadosIni.codEmpresa));
    //Gravando transacao no Banco de dados da Origem
    try
      vOrigem.CommitaTransacao;
    except
      on e: exception do begin
        vOrigem.RollBackTransacao;
        Application.MessageBox(pchar('Não foi possível marcar venda como processada. Faça isso manualmente. Erro: ' + e.Message),
          'Atenção', MB_OK + MB_ICONEXCLAMATION);
        registraErro(e.Message);
      end;
    end;
  end;
end;

procedure TPedVendaTRV.produtosCalcFields(DataSet: TDataSet);
begin
  registraErro('produtosCalcFields1');

  if vVerificarEstoque = 'N' then
  begin
    DataSet.FieldByName('UTILIZAR').AsFloat := DataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
    DataSet.FieldByName('DISPONIVEL').AsFloat := DataSet.FieldByName('UTILIZAR').AsFloat;
    Exit;
  end;

  if vOrigem.vPedVenda.FieldByName('tipo').AsString = 'ORC' then
  begin
    DataSet.FieldByName('UTILIZAR').AsFloat := DataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
    DataSet.FieldByName('DISPONIVEL').AsFloat := DataSet.FieldByName('UTILIZAR').AsFloat;
    Exit;
  end;
  DataSet.FieldByName('DISPONIVEL').AsFloat :=
    getQtdeDisponivelEmEstoque(DataSet.FieldByName('GRUPO_PROD').AsInteger,
    DataSet.FieldByName('COD_PROD').AsString);
  if DataSet.FieldByName('QUANT_PED_ITEM').AsFloat > DataSet.FieldByName('DISPONIVEL').AsFloat then
    DataSet.FieldByName('UTILIZAR').AsFloat := DataSet.FieldByName('DISPONIVEL').AsFloat
  else
    DataSet.FieldByName('UTILIZAR').AsFloat := DataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
  if DataSet.FieldByName('DISPONIVEL').AsFloat <= 0 then
    DataSet.FieldByName('UTILIZAR').AsFloat := 0;
end;

function TPedVendaTRV.removerProcessamentoVenda: boolean;
begin
	try
  	Result := false;

    if vOrigem.vPedVenda.IsEmpty then
    	exit;

    vOrigem.buscas.Close;
    vOrigem.buscas.SQL.Text := ' select nped, tipo, cod_empresa, processada_sl from pedvenda ' +
      ' where nped = ' + IntToStr(vOrigem.vPedVenda.FieldByName('nped').AsInteger) +
      ' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString) +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
        	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		        trim(vCodEmpresaOrigem),
            vDadosIni.codEmpresa);
    vOrigem.buscas.Open;

    if vOrigem.buscas.IsEmpty then
    	exit;

    if vOrigem.buscas.FieldByName('processada_sl').AsInteger = 0 then
    begin
    	Application.MessageBox(pchar('O processamento já foi removido desta venda!'),
        'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    vOrigem.ExecutaComandosSqlExec('update pedvenda set processada_sl = 0 ' +
    	' where nped = ' + vOrigem.vPedVenda.FieldByName('nped').AsString +
      ' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString) +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
        	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		        trim(vCodEmpresaOrigem),
            vDadosIni.codEmpresa));
    vOrigem.CommitaTransacao;

  	vOrigem.Refresh;

    Result := true;
  except
    on e: exception do
    begin
    	Result := false;
      vOrigem.RollBackTransacao;
      Application.MessageBox(pchar('Não foi possível desmarcar venda como processada.  Erro: ' + e.Message),
        'Atenção', MB_OK + MB_ICONEXCLAMATION);
      registraErro(e.Message);
    end;
  end;
end;

procedure TPedVendaTRV.setValorAUtilizar(valor: Double);
var
  vr1, vr2: Currency;
begin
  if vOrigem.vPedVendaProd.IsEmpty then
    Exit;

  if vVerificarEstoque = 'N' then
  	Exit;
    
  vr1 := valor;
  vr2 := vOrigem.vPedVendaProd.FieldByName('DISPONIVEL').AsFloat;
  if vr1 > vr2 then
  begin
    Application.MessageBox('Quantidade maior que o disponível no estoque', 'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end;
  vOrigem.vPedVendaProd.edit;
  vOrigem.vPedVendaProd.FieldByName('UTILIZAR').AsFloat;
  vOrigem.vPedVendaProd.post;
end;

function TPedVendaTRV.somar(gridProd, gridServ, gridTerc: TDBGrid; somenteSelecionados: boolean):
  boolean;
begin
  FvalorDesconto := 0;
  FvalorAcrescimo := 0;
  FvalorServicos := 0;
  FvalorProdutos := 0;
  FvalorServTerc := 0;
  FvalorProdTerc := 0;
  
  vOrigem.vPedVendaProd.First;
  while not vOrigem.vPedVendaProd.Eof do
  begin
    if ((gridProd.SelectedRows.CurrentRowSelected) and (somenteSelecionados)) or
      (not somenteSelecionados) then
    begin
      FvalorProdutos := FvalorProdutos +
        (vOrigem.vPedVendaProd.FieldByName('utilizar').AsFloat *
        vOrigem.vPedVendaProd.FieldByName('VLUN_PED_ITEM').AsCurrency);
      if vOrigem.vPedVendaProd.FieldByName('utilizar').AsFloat > 0 then
      begin
        FvalorAcrescimo := FvalorAcrescimo +
          (((vOrigem.vPedVendaProd.FieldByName('RATEIO_ACRESC').AsCurrency
          {+ vOrigem.vPedVendaProd.FieldByName('ACRESC_ITEM').AsCurrency}) /
          vOrigem.vPedVendaProd.FieldByName('quant_ped_item').AsFloat) *
          vOrigem.vPedVendaProd.FieldByName('utilizar').AsFloat);
        FvalorDesconto := FvalorDesconto +
          (((vOrigem.vPedVendaProd.FieldByName('RATEIO_DESC').AsCurrency
          {+ vOrigem.vPedVendaProd.FieldByName('DESC_ITEM').AsCurrency}) /
          vOrigem.vPedVendaProd.FieldByName('quant_ped_item').AsFloat) *
          vOrigem.vPedVendaProd.FieldByName('utilizar').AsFloat);
      end;
      //    FvalorProdutos := FvalorProdutos +
      //     vOrigem.vPedVendaProd.FieldByName('VLTOT_PED_ITEM').AsCurrency;
//      FvalorAcrescimo := FvalorAcrescimo +
//        vOrigem.vPedVendaProd.FieldByName('RATEIO_ACRESC').AsCurrency
        { + vOrigem.vPedVendaProd.FieldByName('ACRESC_ITEM').AsCurrency};
      //      FvalorDesconto := FvalorDesconto +
      //        vOrigem.vPedVendaProd.FieldByName('RATEIO_DESC').AsCurrency
              {+ vOrigem.vPedVendaProd.FieldByName('DESC_ITEM').AsCurrency};
    end;
    vOrigem.vPedVendaProd.Next;
  end;

  vOrigem.vPedVendaServ.First;
  while not vOrigem.vPedVendaServ.Eof do
  begin
    if ((gridServ.SelectedRows.CurrentRowSelected) and (somenteSelecionados)) or
      (not somenteSelecionados) then
    begin
      FvalorServicos := FvalorServicos +
        vOrigem.vPedVendaServ.FieldByName('VALOR_TOT_SERV').AsCurrency;
      FvalorAcrescimo := FvalorAcrescimo +
        vOrigem.vPedVendaServ.FieldByName('RATEIO_ACRESC').AsCurrency
        { + vOrigem.vPedVendaServ.FieldByName('ACRESC_ITEM').AsCurrency};
      FvalorDesconto := FvalorDesconto +
        vOrigem.vPedVendaServ.FieldByName('RATEIO_DESC').AsCurrency
        {+ vOrigem.vPedVendaServ.FieldByName('DESC_ITEM').AsCurrency};
    end;
    vOrigem.vPedVendaServ.Next;
  end;

  vOrigem.vPedVendaServTerc.First;
  while not vOrigem.vPedVendaServTerc.Eof do
  begin
    if ((gridTerc.SelectedRows.CurrentRowSelected) and (somenteSelecionados)) or
      (not somenteSelecionados) then
      FvalorServTerc := FvalorServTerc +
        vOrigem.vPedVendaServTerc.FieldByName('VL_SERVT').AsCurrency;
    vOrigem.vPedVendaServTerc.Next;
  end;
  //  if comDesconto then
  //    FvalorDesconto := valorDesc;
  //  if comAcrescimo then
  //    FvalorAcrescimo := valorAcres;
  Result := true;
end;

procedure TPedVendaTRV.somaTotais(utilizar: boolean);
begin
  vOrigem.vPedVendaProd.Close;
  vOrigem.vPedVendaProd.CommandText := ' select * from pedvenda_prod ' +
  	' where nped = ' + dataSet.FieldByName('nped').AsString +
    ' and tipo = ' + QuotedStr(tipo) +
    ' and cod_empresa = ' +
    	vDadosIni.IfThen(
       	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		      trim(vCodEmpresaOrigem),
          vDadosIni.codEmpresa);
  vOrigem.vPedVendaProd.Open;
  vOrigem.vPedVendaProd.OnCalcFields := nil;
  vOrigem.vPedVendaServ.Close;
  vOrigem.vPedVendaServ.CommandText := ' select * from pedvenda_serv ' +
  	' where nped = ' + dataSet.FieldByName('nped').AsString +
    ' and tipo = ' + QuotedStr(tipo) +
    ' and cod_empresa = ' +
    	vDadosIni.IfThen(
       	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		      trim(vCodEmpresaOrigem),
          vDadosIni.codEmpresa);
  vOrigem.vPedVendaServ.Open;
  vOrigem.vPedVendaServTerc.Close;
  vOrigem.vPedVendaServTerc.CommandText := ' select * from pedvenda_serv_terc ' +
  	' where nped = ' + dataSet.FieldByName('nped').AsString +
    ' and tipo = ' + QuotedStr(tipo) +
    ' and cod_empresa = ' +
    	vDadosIni.IfThen(
       	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		      trim(vCodEmpresaOrigem),
          vDadosIni.codEmpresa);
  vOrigem.vPedVendaServTerc.Open;
  vOrigem.vPedVendaProdTerc.Close;
  vOrigem.vPedVendaProdTerc.CommandText := ' select * from pedvenda_prod_terc ' +
  	' where nped = ' + dataSet.FieldByName('nped').AsString +
    ' and tipo = ' + QuotedStr(tipo) +
    ' and cod_empresa = ' +
    	vDadosIni.IfThen(
       	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		      trim(vCodEmpresaOrigem),
          vDadosIni.codEmpresa);
  vOrigem.vPedVendaProdTerc.Open;

  FvalorDesconto := 0;
  FvalorAcrescimo := 0;
  FvalorServicos := 0;
  FvalorProdutos := 0;
  FvalorServTerc := 0;
  FvalorProdTerc := 0;
  FvlrateioDesconto := 0;
  FvlrateioAcrescimo := 0;

  vOrigem.vPedVendaProd.First;
  while not vOrigem.vPedVendaProd.Eof do
  begin
    if utilizar then
    begin
      FvalorProdutos := FvalorProdutos +
        (vOrigem.vPedVendaProd.FieldByName('utilizar').AsFloat *
        vOrigem.vPedVendaProd.FieldByName('VLUN_PED_ITEM').AsCurrency);
      if vOrigem.vPedVendaProd.FieldByName('utilizar').AsFloat > 0 then
      begin
        FvalorAcrescimo := FvalorAcrescimo +
          (((vOrigem.vPedVendaProd.FieldByName('RATEIO_ACRESC').AsCurrency
          {+ vOrigem.vPedVendaProd.FieldByName('ACRESC_ITEM').AsCurrency}) /
          vOrigem.vPedVendaProd.FieldByName('quant_ped_item').AsFloat) *
          vOrigem.vPedVendaProd.FieldByName('utilizar').AsFloat);
        FvalorDesconto := FvalorDesconto +
          (((vOrigem.vPedVendaProd.FieldByName('RATEIO_DESC').AsCurrency
          {+ vOrigem.vPedVendaProd.FieldByName('DESC_ITEM').AsCurrency}) /
          vOrigem.vPedVendaProd.FieldByName('quant_ped_item').AsFloat) *
          vOrigem.vPedVendaProd.FieldByName('utilizar').AsFloat);
      end;
    end
    else
    begin
      FvalorProdutos := FvalorProdutos +
        vOrigem.vPedVendaProd.FieldByName('VLTOT_PED_ITEM').AsCurrency;
      FvalorAcrescimo := FvalorAcrescimo +
        vOrigem.vPedVendaProd.FieldByName('RATEIO_ACRESC').AsCurrency
        {+ vOrigem.vPedVendaProd.FieldByName('ACRESC_ITEM').AsCurrency};
      FvalorDesconto := FvalorDesconto +
        vOrigem.vPedVendaProd.FieldByName('RATEIO_DESC').AsCurrency
        {+ vOrigem.vPedVendaProd.FieldByName('DESC_ITEM').AsCurrency};
    end;
    vOrigem.vPedVendaProd.Next;
  end;

  vOrigem.vPedVendaServ.First;
  while not vOrigem.vPedVendaServ.Eof do
  begin
    FvalorServicos := FvalorServicos +
      vOrigem.vPedVendaServ.FieldByName('VALOR_TOT_SERV').AsCurrency;
    FvalorAcrescimo := FvalorAcrescimo +
      vOrigem.vPedVendaServ.FieldByName('RATEIO_ACRESC').AsCurrency
      {+ vOrigem.vPedVendaServ.FieldByName('ACRESC_ITEM').AsCurrency};
    FvalorDesconto := FvalorDesconto +
      vOrigem.vPedVendaServ.FieldByName('RATEIO_DESC').AsCurrency
      {+vOrigem.vPedVendaServ.FieldByName('DESC_ITEM').AsCurrency};
    vOrigem.vPedVendaServ.Next;
  end;

  vOrigem.vPedVendaServTerc.First;
  while not vOrigem.vPedVendaServTerc.Eof do
  begin
    FvalorServTerc := FvalorServTerc +
      vOrigem.vPedVendaServTerc.FieldByName('VL_SERVT').AsCurrency;
    vOrigem.vPedVendaServTerc.Next;
  end;

  vOrigem.vPedVendaProdTerc.First;
  while not vOrigem.vPedVendaProdTerc.Eof do
  begin
    FvalorProdTerc := FvalorProdTerc +
      vOrigem.vPedVendaProdTerc.FieldByName('qtde').AsFloat *
      vOrigem.vPedVendaProdTerc.FieldByName('vl_unit').AsCurrency;
    vOrigem.vPedVendaProdTerc.Next;
  end;

end;

function TPedVendaTRV.ValidarCamposObrigatorios: boolean;
var
  vTemp: string;
begin
 try
   Result := False;
   vTemp := '';

   if trim(vVerificarCpfVendedor) <> 'S' then
   begin
     vDestino.buscas.close;
     vDestino.buscas.sql.text := 'SELECT COD_CLIENTE FROM CLIENTES ' +
      ' WHERE ATIVO = 1 ' +
      ' AND COD_CLIENTE = ' + IntToStr(vOrigem.vPedVenda.FieldByName('COD_CLIENTE').AsInteger) +
      ' AND COD_EMPRESA = ' +
        vDadosIni.IfThen(
          (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
            trim(vCodEmpresaDestino),
            vDadosIni.codEmpresa);
     vDestino.buscas.Open;

     if vDestino.buscas.IsEmpty then
     begin
       vOrigem.buscas.close;
       vOrigem.buscas.sql.text := ' SELECT (COD_CLIENTE ||'' - ''|| TRIM(NOME_CLIENTE)) NOME_CLIENTE FROM CLIENTES ' +
         ' WHERE ATIVO = 1 ' +
         ' AND COD_CLIENTE = ' + IntToStr(vOrigem.vPedVenda.FieldByName('COD_CLIENTE').AsInteger) +
         ' AND COD_EMPRESA = ' +
           vDadosIni.IfThen(
             (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
               trim(vCodEmpresaOrigem),
               vDadosIni.codEmpresa);
       vOrigem.buscas.Open;

       if not vOrigem.buscas.IsEmpty then
       begin
        vTemp := QuotedStr(vOrigem.buscas.FieldByName('NOME_CLIENTE').AsString);
        Application.MessageBox(pchar('Cliente não encontrado no banco de destino: ' + #13 + vTemp+ ''), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
       end;
     end;
   end;

   if trim(vVerificarCpfVendedor) <> 'S' then
   begin
     vDestino.buscas.close;
     vDestino.buscas.sql.text := 'SELECT COD_VENDEDOR FROM COLABORADOR ' +
      ' WHERE ATIVO = 1 ' +
      ' AND COD_VENDEDOR = ' + IntToStr(vOrigem.vPedVenda.FieldByName('COD_VENDEDOR').AsInteger) +
      ' AND COD_EMPRESA = ' +
        vDadosIni.IfThen(
          (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
            trim(vCodEmpresaDestino),
            vDadosIni.codEmpresa);
     vDestino.buscas.Open;

     if vDestino.buscas.IsEmpty then
     begin
       vOrigem.buscas.close;
       vOrigem.buscas.sql.text := ' SELECT (COD_VENDEDOR ||'' - ''|| TRIM(NOME_VENDEDOR)) NOME_VENDEDOR FROM COLABORADOR ' +
         ' WHERE ATIVO = 1 ' +
         ' AND COD_VENDEDOR = ' + IntToStr(vOrigem.vPedVenda.FieldByName('COD_VENDEDOR').AsInteger) +
         ' AND COD_EMPRESA = ' +
           vDadosIni.IfThen(
             (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
               trim(vCodEmpresaOrigem),
               vDadosIni.codEmpresa);
       vOrigem.buscas.Open;

       if not vOrigem.buscas.IsEmpty then
       begin
        vTemp := QuotedStr(vOrigem.buscas.FieldByName('NOME_VENDEDOR').AsString);
        Application.MessageBox(pchar('Vendedor não encontrado no banco de destino:  ' + #13 + vTemp+ ''), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
       end;
     end;
   end;

   vDestino.buscas.close;
   vDestino.buscas.sql.text := ' SELECT COD_COND_PAG FROM COND_PAG ' +
    ' WHERE ATIVO = 1 ' +
    ' AND COD_COND_PAG = ' + IntToStr(vOrigem.vPedVenda.FieldByName('COD_COND_PAG').AsInteger);
   vDestino.buscas.Open;

   if vDestino.buscas.IsEmpty then
   begin
     vOrigem.buscas.close;
     vOrigem.buscas.sql.text := ' SELECT (COD_COND_PAG ||'' - ''|| TRIM(DESC_COND_PAG)) DESC_COND_PAG FROM COND_PAG ' +
       ' WHERE ATIVO = 1 ' +
       ' AND COD_COND_PAG = '+IntToStr(vOrigem.vPedVenda.FieldByName('COD_COND_PAG').AsInteger);
     vOrigem.buscas.Open;

     if not vOrigem.buscas.IsEmpty then
     begin
      vTemp := QuotedStr(vOrigem.buscas.FieldByName('DESC_COND_PAG').AsString);
      Application.MessageBox(pchar('Condição de Pagamento não encontrado no banco de destino:  ' + #13 + vTemp+ ''), 'Atenção', MB_ICONERROR + MB_OK);
      exit;
     end;
   end;

   vOrigem.vPedVendaProd.First;
   while not vOrigem.vPedVendaProd.Eof do
   begin
      vDestino.buscas.close;
      vDestino.buscas.sql.text := ' select grupo_prod, cod_prod, cod_empresa from produtos ' +
       ' where ativo = 1 ' +
       ' and grupo_prod = ' + IntToStr(vOrigem.vPedVendaProd.FieldByName('GRUPO_PROD').AsInteger) +
       ' and cod_prod = ' + QuotedStr(vOrigem.vPedVendaProd.FieldByName('COD_PROD').AsString)+
       ' and cod_empresa = ' +
       	 vDadosIni.IfThen(
				   (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						 trim(vCodEmpresaDestino),
        		 vDadosIni.codEmpresa);
      vDestino.buscas.Open;

      if vDestino.buscas.IsEmpty then
      begin
        vOrigem.buscas.close;
        vOrigem.buscas.sql.text := ' select (grupo_prod ||'' - ''|| trim(cod_prod)) grupo_codigo, ' +
          ' trim(num_fab_prod) num_fab_prod, trim(descr_prod) descr_prod from produtos ' +
          ' where ativo = 1 ' +
          ' and grupo_prod = ' + IntToStr(vOrigem.vPedVendaProd.FieldByName('GRUPO_PROD').AsInteger) +
          ' and cod_prod = ' + QuotedStr(vOrigem.vPedVendaProd.FieldByName('COD_PROD').AsString)+
          ' and cod_empresa = ' +
          	vDadosIni.IfThen(
 				     (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						   trim(vCodEmpresaOrigem),
        		   vDadosIni.codEmpresa);
        vOrigem.buscas.Open;

        if not vOrigem.buscas.IsEmpty then
        begin
         vTemp := 'GRUPO_CODIGO = ' + vOrigem.buscas.FieldByName('GRUPO_CODIGO').AsString +
           #13 + 'NUM_FAB_PROD = ' + vOrigem.buscas.FieldByName('NUM_FAB_PROD').AsString +
           #13 + vOrigem.buscas.FieldByName('DESCR_PROD').AsString;
         Application.MessageBox(pchar('Produto não encontrado no banco de destino:  ' + #13 + vTemp+ ''), 'Atenção', MB_ICONERROR + MB_OK);
         exit;
        end;
      end;
     vOrigem.vPedVendaProd.Next;
   end;
   vOrigem.vPedVendaProd.First;

   vOrigem.vPedVendaServ.First;
   while not vOrigem.vPedVendaServ.Eof do
   begin
      vDestino.buscas.close;
      vDestino.buscas.sql.text := 'SELECT COD_SERVICO FROM TIPO_SERVICO ' +
       ' WHERE ATIVO = 1 ' +
       ' AND COD_SERVICO = '+IntToStr(vOrigem.vPedVendaServ.FieldByName('COD_SERVICO').AsInteger);
      vDestino.buscas.Open;

      if vDestino.buscas.IsEmpty then
      begin
        vOrigem.buscas.close;
        vOrigem.buscas.sql.text := ' SELECT (COD_SERVICO ||'' - ''|| TRIM(DESC_SERVICO)) SERVICO FROM TIPO_SERVICO ' +
          ' WHERE ATIVO = 1 ' +
          ' AND COD_SERVICO = '+IntToStr(vOrigem.vPedVendaServ.FieldByName('COD_SERVICO').AsInteger);
        vOrigem.buscas.Open;

        if not vOrigem.buscas.IsEmpty then
        begin
         vTemp := QuotedStr(vOrigem.buscas.FieldByName('SERVICO').AsString);
         Application.MessageBox(pchar('Serviço não encontrado no banco de destino:  ' + #13 + vTemp+ ''), 'Atenção', MB_ICONERROR + MB_OK);
         exit;
        end;
      end;

      vDestino.buscas.close;
      vDestino.buscas.sql.text := ' SELECT COD_SERVICO FROM TIPO_SERVICO ' +
        ' WHERE ATIVO = 1 ' +
        ' AND COD_SERVICO = '+IntToStr(vOrigem.vPedVendaServ.FieldByName('COD_SERVICO').AsInteger);
      vDestino.buscas.Open;

      if vDestino.buscas.IsEmpty then
      begin
        vOrigem.buscas.close;
        vOrigem.buscas.sql.text := ' SELECT (COD_SERVICO ||'' - ''|| TRIM(DESC_SERVICO)) SERVICO FROM TIPO_SERVICO ' +
          ' WHERE ATIVO = 1 ' +
          ' AND COD_SERVICO = '+IntToStr(vOrigem.vPedVendaServ.FieldByName('COD_SERVICO').AsInteger);
        vOrigem.buscas.Open;

        if not vOrigem.buscas.IsEmpty then
        begin
         vTemp := QuotedStr(vOrigem.buscas.FieldByName('SERVICO').AsString);
         Application.MessageBox(pchar('Serviço não encontrado no banco de destino:  ' + #13 + vTemp+ ''), 'Atenção', MB_ICONERROR + MB_OK);
         exit;
        end;
      end;

      vDestino.buscas.close;
      vDestino.buscas.sql.text := 'SELECT COD_VENDEDOR FROM COLABORADOR ' +
       ' WHERE ATIVO = 1 ' +
       ' AND COD_VENDEDOR = '+IntToStr(vOrigem.vPedVendaServ.FieldByName('COD_VENDEDOR').AsInteger) +
       ' AND COD_EMPRESA = ' +
       	 vDadosIni.IfThen(
 				   (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						 trim(vCodEmpresaDestino),
        		 vDadosIni.codEmpresa);
      vDestino.buscas.Open;

      if vDestino.buscas.IsEmpty then
      begin
        vOrigem.buscas.close;
        vOrigem.buscas.sql.text := ' SELECT (COD_VENDEDOR ||'' - ''|| TRIM(NOME_VENDEDOR)) NOME_VENDEDOR FROM COLABORADOR ' +
          ' WHERE ATIVO = 1 ' +
          ' AND COD_VENDEDOR = '+IntToStr(vOrigem.vPedVendaServ.FieldByName('COD_VENDEDOR').AsInteger) +
          ' AND COD_EMPRESA = ' +
            vDadosIni.IfThen(
 				      (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						    trim(vCodEmpresaOrigem),
        		    vDadosIni.codEmpresa);
        vOrigem.buscas.Open;

        if not vOrigem.buscas.IsEmpty then
        begin
         vTemp := QuotedStr(vOrigem.buscas.FieldByName('NOME_VENDEDOR').AsString);
         Application.MessageBox(pchar('Mecânico não encontrado no banco de destino,  ' + #13 + vTemp+ ''), 'Atenção', MB_ICONERROR + MB_OK);
         exit;
        end;
      end;

     vOrigem.vPedVendaServ.Next;
   end;
   vOrigem.vPedVendaServ.First;


   Result := True;
 except
 on e: exception do
   begin
     Result := false;
     Application.MessageBox(pchar('Erro ao validar campos obrigatórios!'), 'Atenção', MB_ICONERROR + MB_OK);
     registraErro(e.Message);
   end;
 end;

end;

function TPedVendaTRV.voltarVendaParaProcessar: boolean;
begin
  try
    if vOrigem.vPedVenda.IsEmpty then
      Exit;
    vOrigem.ExecutaComandosSql('update pedvenda set processada_sl = 0 where nped = ' +
      vOrigem.vPedVenda.FieldByName('nped').AsString +
      ' and tipo = ' + QuotedStr(vOrigem.vPedVenda.FieldByName('tipo').AsString) +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
       	(trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		      trim(vCodEmpresaOrigem),
          vDadosIni.codEmpresa));
    vOrigem.CommitaTransacao;
    Result := true;
  except
    on e: exception do begin
      vOrigem.RollBackTransacao;
      Application.MessageBox(pchar('Não foi possivel marcar venda como processada. Erro: ' + e.Message),
        'Atenção', MB_OK + MB_ICONEXCLAMATION);
      registraErro(e.Message);
    end;
  end;
end;

function TPedVendaTRV.getQtdeDisponivelEmEstoque: Double;
var
  sql: string;
  vest, vTemp: Real;
begin
  try
    vTemp := 0;
    sql := 'select sum(itpd.quant_ped_item) as soma1 from pedvenda pd' +
      ' inner join pedvenda_prod itpd on pd.nped = itpd.nped and pd.tipo = itpd.tipo and pd.cod_empresa = itpd.cod_empresa' +
      ' where pd.ativo = 1 ' +
      ' and itpd.grupo_prod = :grupo_prod ' +
      ' and itpd.cod_prod = :cod_prod ' +
      ' and itpd.cod_empresa = ' +
      	vDadosIni.IfThen(
				  (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
						trim(vCodEmpresaDestino),
        		vDadosIni.codEmpresa) +
      ' and (pd.data_fech is null or pd.data_fech < :data) ';
    vDestino.buscas.Close;
    if vDadosIni.vEmp.vApresentarEstR = 'S' then
      sql := sql + ' and pd.tipo <> ''ORC'''
    else if vDadosIni.vEmp.vApresentarEstR = 'R' then
      sql := sql + ' and pd.tipo = ''REQ'''
    else if vDadosIni.vEmp.vApresentarEstR = 'O' then
      sql := sql + ' and pd.tipo = ''OS''';
    sql := sql + ' and (pd.tipo <> ' + QuotedStr(tipo) +
      ' and pd.nped <> ' + dataSet.FieldByName('nped').AsString + ')';
    if (vDadosIni.vEmp.vApresentarEstR = 'R') or
      (vDadosIni.vEmp.vApresentarEstR = 'O') or
      (vDadosIni.vEmp.vApresentarEstR = 'S') then
    begin
      vDestino.buscas.SQL.Text := sql;
      vDestino.buscas.ParamByName('grupo_prod').AsInteger :=
        vOrigem.vPedVendaProd.FieldByName('grupo_prod').AsInteger;
      vDestino.buscas.ParamByName('cod_prod').AsString := vOrigem.vPedVendaProd.FieldByName('cod_prod').AsString;
      vDestino.buscas.Params[2].AsDate := 0;
      vDestino.buscas.Open;
      vTemp := vDestino.buscas.FieldByName('soma1').AsFloat;
    end;
    vDestino.buscas.Close;
    sql := 'select * from produtos ' +
    	' where grupo_prod = :grupo_prod ' +
      ' and cod_prod = :cod_prod ' +
      ' and cod_empresa = ' +
      	vDadosIni.IfThen(
       	  (trim(vCodEmpresaOrigem) <> '') and (trim(vCodEmpresaDestino) <> ''),
		        trim(vCodEmpresaDestino),
            vDadosIni.codEmpresa) +
      ' and ativo = 1 ' +
      ' and (coalesce(consumo, ''N'') <> ''S'')';
    vDestino.buscas.SQL.Text := sql;
    vDestino.buscas.ParamByName('grupo_prod').AsInteger := vOrigem.vPedVendaProd.FieldByName('grupo_prod').AsInteger;
    vDestino.buscas.ParamByName('cod_prod').AsString := vOrigem.vPedVendaProd.FieldByName('cod_prod').AsString;
    vDestino.buscas.Open;
    Result := vDestino.buscas.FieldByName('est_f').AsFloat +
      vDestino.buscas.FieldByName('est_r').AsFloat - vTemp;
    vDestino.buscas.Close;
  except
  end;
end;

{ TPedVendaTRVProcessamento }

constructor TPedVendaTRVDestino.create;
begin
  buscas := TIBQuery(dtmTRV.buscasDestino);
  transacao := TIBTransaction(dtmTRV.transacaoDestino);
  vPedVenda := TClientDataSet(dtmTRV.cdsPV);
  vPedVendaProd := TClientDataSet(dtmTRV.cdsItemPV);
  vPedVendaServ := TClientDataSet(dtmTRV.cdsServPV);
  vPedVendaServTerc := TClientDataSet(dtmTRV.cdsTercPV);
  vAparelho := TClientDataSet(dtmTRV.cdsEquip);
  vOcorrencias := TClientDataSet(dtmTRV.cdsOcorr);
  vMecanicos := TClientDataSet(dtmTRV.cdsMec);
end;

{ TPedVendaTRVOrigem }

constructor TPedVendaTRVOrigem.create;
begin
  buscas := TIBQuery(dtmTRV.buscasOrigem);
  transacao := TIBTransaction(dtmTRV.transacaoOrigem);
  vPedVenda := TClientDataSet(dtmTRV.cdsPedVenda);
  vPedVendaProd := TClientDataSet(dtmTRV.cdsItemProd);
  vPedVendaServ := TClientDataSet(dtmTRV.cdsItemServ);
  vPedVendaServTerc := TClientDataSet(dtmTRV.cdsServTerceiro);
  vPedVendaProdTerc := TClientDataSet(dtmTRV.cdsProdTerceiro);
  dataSet := TClientDataSet(vPedVenda);
end;

destructor TPedVendaTRVOrigem.Destroy;
begin
  vPedVenda.Close;
  vPedVendaProd.Close;
  vPedVendaServ.Close;
  vPedVendaProdTerc.Close;
  vPedVendaServTerc.Close;
  buscas.Close;
end;

destructor TPedVendaTRVDestino.Destroy;
begin
  vPedVenda.Close;
  vPedVendaProd.Close;
  vPedVendaServ.Close;
  vPedVendaServTerc.Close;
  buscas.Close;
end;

end.

