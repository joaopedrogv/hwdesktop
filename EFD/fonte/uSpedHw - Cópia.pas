unit uSpedHw;

interface

uses
  StdCtrls, ComCtrls, IBQuery, Classes, IBDataBase, ACBrSpedFiscal, ACBrSpedPISCOFINS;

//const
//  cfopDevolucaoCompra: string = '5205|5206|5207|6205|6206|6207|7205|7206|7207|5201|5202|5210|5410|5411|5413|5660|6201|6202|6210|6410|6411|6413|6660|7201|7202|7210|';
//  cfopDevolucaoVenda: string = '1201|1202|1203|1204|1410|1411|1660|1661|1662|2201|2202|2410|2411|2660|2661|2662|';

type
  TSpedHw = class
  private
    FSpedFiscalOuPisCofins: string;
  protected
    //Componentes de Conexao do Banco
    vEnderecoBanco: string;
    vConexao: TIBDataBase;
    vTransacao, vTransacaoAux: TIBTransaction;
    vNivel0, vNivel2, vNivel3, vNivel4, vNivel5, vNivel6, vQrAux, vQrAux1: TIBQuery;

    cfopDevolucaoCompra: string;
    cfopDevolucaoVenda: string;

    FSpedF: TACBrSPEDFiscal;
    FSpedP: TACBrSPEDPisCofins;
    FParticipantes: TStringList;
    FDataIni: string;
    FDataFim: string;
    FDataInv: string;
    FCodEmpresa: string;
    FFinalidade: string;
    FDestino: string;
    FRegime: string;
    FIncidTribPISCOFINS: string;
    FIndicadorRegimeCumulativo: Integer;
    FInd_apur_ipi: string;
    FBlocoA: boolean;
    FBlocoF: boolean;
    FBlocoG: boolean;
    FBlocoD: boolean;
    FBlocoE: boolean;
    FBloco9: boolean;
    FBloco0: boolean;
    FBloco1: boolean;
    FBlocoH: boolean;
    FBlocoM: boolean;
    FBlocoC: boolean;
    FRefazerCalculoPISCOFINS: Boolean;

    F0190: TStringList;
    F0200: TStringList;
    F0400: TStringList;
    F0450: TStringList;
    FC400: TStringList;

    FAliqPIS, FAliqCOFINS, FValorPISAcumulado, FValorCOFINSAcumulado:
    Currency;

    //Layout  Numero|CPF / CNPJ     |Nome do Participante
    //        NNNNNN|XXXXXXXXXXXXXXX|CCCCCCCCCCCCCCC......
    //Caso necessite por causa do Servico de transporte         
    function getCampoPipe(plinha: string; pOrdem: integer): string;
    function StrZero(Num: string; Tam: Integer): string; overload;
    function SpaceStr(vStr: string; Tam: Integer): string;
    function StrToFloatFormat(valor: Currency; casasDecimais: integer): Currency;
    function getParticipante(pCOD_PART: string): string;
    function conectarBanco: boolean;
    function getCampoBlobString(vTexto: AnsiString): AnsiString;
    function cfopDeDevolucao(pCFOP: Integer; pEntSaida: string): Boolean;
    procedure verificaNfSerieD;
    procedure verificaCamposNuloNF;
    function verificaCupomSemZ(pNSerieECF: string; pCodTerminal: integer): boolean;
    procedure verificaCamposNullCupom(pNSerieECF: string; pCodTerminal: integer);
    procedure verificaPISCOFINSCupomFiscal(pNSerieECF: string; pCodTerminal: integer);
    procedure _verificaPISCOFINSCupomFiscal(pNSerieECF: string; pCodTerminal: integer);
    procedure verificaPISCOFINSNotaFiscal;
    procedure verificaPISCOFINSServicoTransporte;
    procedure verificaPISCOFINSNFSerieD;
    procedure verificaDataServicoTransporte;
    procedure _verificaPISCOFINS_Servicos;
    procedure _zerarDadosSpedPISCOFINS;
    function gravaSpedItem(tipo: string; grupo_prod: integer; cod_prod: string;
      chassi: string; cod_servico: integer; cod_outras: string; unid: string): boolean;
    procedure apagarSpedItem;
    procedure montaRegistro0150(pCOD_PART: string);
    procedure montaRegistro0190(pUNID: string);
    procedure montaRegistro0200;
    procedure montaRegistro0400(pCOD_NAT: string); overload;
    procedure montaRegistro0400(var pCOD_NAT: string; pDESC_NATOP: string); overload;
    procedure montaRegistro0450(pCOD_INF: integer; pTXT: string);
    procedure montaRegistroC400(pCOD_MOD, pECF_MOD, pECF_FAB, pECF_CX: string);
  public

    destructor Destroy; override;

    property DataIni: string read FDataIni write FDataIni;
    property DataFim: string read FDataFim write FDataFim;
    property DataInv: string read FDataInv write FDataInv;
    property Finalidade: string read FFinalidade write FFinalidade;
    property Destino: string read FDestino write FDestino;
    property CodEmpresa: string read FCodEmpresa write FCodEmpresa;
    property EnderecoBanco: string read vEnderecoBanco write vEnderecoBanco;
    property SpedFiscalOuPisCofins: string read FSpedFiscalOuPisCofins write FSpedFiscalOuPisCofins;
    property vBloco0: boolean read FBloco0 write FBloco0;
    property vBlocoA: boolean read FBlocoA write FBlocoA;
    property vBlocoC: boolean read FBlocoC write FBlocoC;
    property vBlocoD: boolean read FBlocoD write FBlocoD;
    property vBlocoF: boolean read FBlocoF write FBlocoF;
    property vBlocoE: boolean read FBlocoE write FBlocoE;
    property vBlocoG: boolean read FBlocoG write FBlocoG;
    property vBlocoH: boolean read FBlocoH write FBlocoH;
    property vBlocoM: boolean read FBlocoM write FBlocoM;
    property vBloco1: boolean read FBloco1 write FBloco1;
    property vBloco9: boolean read FBloco9 write FBloco9;
    property vRefazerCalculoPISCOFINS: Boolean read FRefazerCalculoPISCOFINS write FRefazerCalculoPISCOFINS;
  var
    FLabelStatus, FLabelBloco, FLabelCupons: TLabel;
    FProgressBar: TProgressBar;
    FProgressBar2: TProgressBar;
    FMemoLog: TMemo;
  end;

implementation

uses
  SysUtils, Forms, ACBrEFDBloco_0, ACBRSpedFiscalUtilHw, ACBRSpedPISCOFINSUtilHw,
  Controls, ACBrEPCBloco_0, DB, ACBrEPCBlocos, ACBrEPCBloco_C;

function __getSenhaFDB: PChar; stdcall; external 'cons40.dll';
function __getUsuarioFDB: PChar; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';

{ TSpedHw }

procedure TSpedHw.apagarSpedItem;
begin
  try
    vQrAux.Close;
    vQrAux.SQL.Text := 'delete from sped_item';
    if FSpedFiscalOuPisCofins = 'F' then
    begin
      vQrAux.SQL.Text := vQrAux.SQL.Text + ' where cod_empresa = :cod_empresa';
      vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    end;
    vQrAux.Prepare;
    vQrAux.ExecSQL;
  except
    on e: exception do begin
      Application.MessageBox(pchar('Erro ao apagar SpedItem para o tipo 200. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TSpedHw.cfopDeDevolucao(pCFOP: Integer; pEntSaida: string): Boolean;
var
  vTemp: string;
begin

  vTemp := IntToStr(pCFOP)+'|';

  if pEntSaida = 'E' then
    Result := Pos(vTemp, cfopDevolucaoCompra) > 0
  else
    Result := Pos(vTemp, cfopDevolucaoVenda) > 0;
end;

function TSpedHw.conectarBanco: boolean;
var
  vPw, vUs: string;
begin
  vUs := string(__getUsuarioFDB);
  vPw := string(__getSenhaFDB);
  vConexao.Connected := False;
  if (Trim(vUs) <> '') then
    vConexao.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
  if (Trim(vPw) <> '') then
    vConexao.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
  vConexao.DatabaseName := vEnderecoBanco;
  try
    vConexao.Connected := True;
    Result := True;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar('Não foi possivel conectar ao banco de dados. Erro: ' + e.Message),'Atenção' , 0 + 64);
    end;
  end;
end;

destructor TSpedHw.Destroy;
begin

  inherited;
end;

function TSpedHw.getCampoBlobString(vTexto: AnsiString): AnsiString;
var
  lista: TMemo;
  I: Integer;
begin
  lista := TMemo.Create(Application);
  try
    Result := '';
    lista.Visible := false;
    lista.Parent := Application.MainForm;
    lista.Width := 800;
    lista.Height := 800;
    lista.WordWrap := False;
    lista.Clear;
    lista.Lines.Text := vTexto;
    for I := 0 to lista.lines.Count - 1 do
      Result := Result + lista.Lines[i] + ' ';
    Result := Trim(Result);
  finally
    lista.Free;
    lista := nil;
  end;
end;

function TSpedHw.getCampoPipe(plinha: string; pOrdem: integer): string;
var
  vTemp:string;
  vInc: Smallint;
begin
  vTemp := plinha;
  vInc := 0;
  while pos('|',vTemp) > 0 do
  begin
    inc(vInc);
    if pOrdem =  vInc then
    begin
      vTemp := Copy(vTemp,1, pos('|',vTemp) - 1);
      Result := Trim(vTemp);
      exit;
    end;
    vTemp := Copy(vTemp,pos('|',vTemp) + 1,length(vTemp));
  end;
  Result := '';
end;

function TSpedHw.getParticipante(pCOD_PART: string): string;
var
  I: Integer;
  vCPFCNPJ: string;
begin
  Result := pCOD_PART;
  if FSpedFiscalOuPisCofins <> 'F' then
  begin
    vQrAux.Close;
    if pos('T', pCOD_PART) > 0 then
    begin
      vQrAux.SQL.Text := 'select ''T''||tr.codigo_tr COD_PART, tr.cnpj_tr CNPJ, null CPF from transportador tr' +
        ' where tr.cod_empresa = :cod_empresa and tr.codigo_tr = :participante';
      vQrAux.ParamByName('participante').AsString := copy(pCOD_PART, 2, Length(pCOD_PART));
    end
    else
    begin
      vQrAux.SQL.Text := 'select cl.cod_cliente COD_PART, cl.cpfcgc CNPJ from clientes cl' +
        ' where cl.cod_empresa = :cod_empresa and cl.cod_cliente = :participante';
      vQrAux.ParamByName('participante').AsString := pCOD_PART;
    end;
    vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vQrAux.Open;

    if length(Trim(vQrAux.FieldByName('CNPJ').AsString)) = 14 then
      vCPFCNPJ := Trim(vQrAux.FieldByName('CNPJ').AsString)
    else if length(Trim(vQrAux.FieldByName('CPF').AsString)) = 11 then
      vCPFCNPJ := Trim(vQrAux.FieldByName('CPF').AsString)
    else
      Exit;

    for I := 0 to FParticipantes.Count - 1 do
      if (getCampoPipe(FParticipantes[I],5) = vCPFCNPJ) then
      begin
        Result := getCampoPipe(FParticipantes[I],2);
        Break;
      end;
  end;
end;

function TSpedHw.gravaSpedItem(tipo: string; grupo_prod: integer; cod_prod,
  chassi: string; cod_servico: integer; cod_outras, unid: string): boolean;
begin
  try
    montaRegistro0190(unid);
    vQrAux.Close;
    vQrAux.SQL.Text := 'select first 1 * from sped_item where ' +
      ' cod_empresa = :cod_empresa and tipo = :tipo and' +
      ' grupo_prod = :grupo_prod and cod_prod = :cod_prod and' +
      ' chassi = :chassi and cod_servico = :cod_servico and cod_outras = :cod_outras';
    vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vQrAux.ParamByName('tipo').AsString := tipo;
    vQrAux.ParamByName('grupo_prod').AsInteger := grupo_prod;
    vQrAux.ParamByName('cod_prod').AsString := cod_prod;
    vQrAux.ParamByName('chassi').AsString := chassi;
    vQrAux.ParamByName('cod_servico').AsInteger := cod_servico;
    vQrAux.ParamByName('cod_outras').AsString := cod_outras;
    vQrAux.Open;
    if vQrAux.IsEmpty then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text :=
        'INSERT INTO SPED_ITEM (COD_EMPRESA, TIPO, GRUPO_PROD, COD_PROD, CHASSI, COD_SERVICO, COD_OUTRAS, UNID)' +
        ' VALUES (:COD_EMPRESA, :TIPO, :GRUPO_PROD, :COD_PROD, :CHASSI, :COD_SERVICO, :COD_OUTRAS, :UNID)';
      vQrAux.ParamByName('COD_EMPRESA').AsInteger := StrToInt(FCodEmpresa);
      vQrAux.ParamByName('TIPO').AsString := tipo;
      vQrAux.ParamByName('GRUPO_PROD').AsInteger := grupo_prod;
      vQrAux.ParamByName('COD_PROD').AsString := cod_prod;
      vQrAux.ParamByName('CHASSI').AsString := chassi;
      vQrAux.ParamByName('COD_SERVICO').AsInteger := cod_servico;
      vQrAux.ParamByName('COD_OUTRAS').AsString := cod_outras;
      vQrAux.ParamByName('UNID').AsString := UpperCase(Trim(unid));
      vQrAux.Prepare;
      vQrAux.ExecSQL;
    end;
  except
    on e: exception do begin
      Result := False;
      Application.MessageBox(pchar('Erro ao gravar item para o tipo 200. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

procedure TSpedHw.montaRegistro0150(pCOD_PART: string);
var
  I: Integer;
  vCPFCNPJ: string;
begin
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    for I := 0 to FParticipantes.Count - 1 do
      if copy(FParticipantes[I], 1, pos('|', FParticipantes[I]) - 1) = pCOD_PART then
        exit;
  end
  else
  begin
    for I := 0 to FParticipantes.Count - 1 do
      if (getCampoPipe(FParticipantes[I],1) = FCodEmpresa) and
        (getCampoPipe(FParticipantes[I],2) = pCOD_PART) then
        exit;
  end;

  vQrAux.close;
  if pos('T', pCOD_PART) > 0 then
  begin
    vQrAux.SQL.Text := 'select ''T''||tr.codigo_tr COD_PART, tr.nome_tr NOME, ''1058'' cod_pais,' +
      ' tr.cnpj_tr CNPJ, null CPF, tr.ie_tr IE, cd.ibge_cod_cidade COD_MUN, '''' suframa,' +
      ' tr.end_tr "END", ''''  NUM, '''' COMPL, '''' BAIRRO, es.sigla_uf' +
      ' from transportador tr' +
      ' left join cidades cd on cd.nome_cidade = tr.municipio_tr' +
      ' left join estados es on es.codigo_uf = tr.uf_tr' +
      ' where tr.cod_empresa = :cod_empresa and tr.codigo_tr = :participante';
    vQrAux.ParamByName('participante').AsString := copy(pCOD_PART, 2, Length(pCOD_PART));
  end
  else
  begin
    vQrAux.SQL.Text := 'select cl.cod_cliente COD_PART, cl.nome_cliente NOME, ''1058'' cod_pais,' +
      ' cl.cpfcgc CNPJ,cl.cpfcgc CPF, cl.insc_est IE, cd.ibge_cod_cidade COD_MUN,' +
      ' null suframa, cl.endereco "END", cl.num_end_cliente NUM, cl.complemento COMPL,' +
      ' cl.bairro, es.sigla_uf from clientes cl' +
      ' left join cidades cd on cd.cod_cidade = cl.cod_cidade' +
      ' left join estados es on es.codigo_uf = cl.codigo_uf' +
      ' where cl.cod_empresa = :cod_empresa and cl.cod_cliente = :participante';
    vQrAux.ParamByName('participante').AsString := pCOD_PART;
  end;
  vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vQrAux.Open;
  if not vQrAux.IsEmpty then
  begin
    if FSpedFiscalOuPisCofins = 'F' then
    begin
      with FSpedF.Bloco_0.Registro0150New do
      begin
        COD_PART := vQrAux.FieldByName('COD_PART').AsString;
        NOME := Trim(vQrAux.FieldByName('NOME').AsString);
        COD_PAIS := vQrAux.FieldByName('COD_PAIS').AsString;
        if length(Trim(vQrAux.FieldByName('CNPJ').AsString)) = 14 then
        begin
          CNPJ := Trim(vQrAux.FieldByName('CNPJ').AsString);
          vCPFCNPJ := CNPJ;
        end
        else if length(Trim(vQrAux.FieldByName('CPF').AsString)) = 11 then
        begin
          CPF := Trim(vQrAux.FieldByName('CPF').AsString);
          vCPFCNPJ := CPF;
        end
        else
        begin
          CNPJ := '';
          CPF := '';
          vCPFCNPJ := '';
        end;
        if Trim(vQrAux.FieldByName('IE').AsString) <> 'ISENTO' then
          IE := Trim(vQrAux.FieldByName('IE').AsString);
        if vQrAux.FieldByName('COD_MUN').AsString <> '' then
          COD_MUN := vQrAux.FieldByName('COD_MUN').AsInteger;
        SUFRAMA := Trim(vQrAux.FieldByName('SUFRAMA').AsString);
        ENDERECO := Trim(vQrAux.FieldByName('END').AsString);
        NUM := Copy(Trim(vQrAux.FieldByName('NUM').AsString),1,10);
        COMPL := Trim(vQrAux.FieldByName('COMPL').AsString);
        BAIRRO := Trim(vQrAux.FieldByName('BAIRRO').AsString);
        FParticipantes.Add(COD_PART + '|' + copy(vQrAux.FieldByName('COD_MUN').AsString, 1, 2) + '|' + vQrAux.FieldByName('sigla_uf').AsString + '|' + vCPFCNPJ + '|');
      end;
    end
    else
    begin     
      with FSpedP.Bloco_0.Registro0150New do
      begin
        COD_PART := vQrAux.FieldByName('COD_PART').AsString;
        NOME := Trim(vQrAux.FieldByName('NOME').AsString);
        COD_PAIS := vQrAux.FieldByName('COD_PAIS').AsString;
        if length(Trim(vQrAux.FieldByName('CNPJ').AsString)) = 14 then
        begin
          CNPJ := Trim(vQrAux.FieldByName('CNPJ').AsString);
          vCPFCNPJ := CNPJ;
        end
        else if length(Trim(vQrAux.FieldByName('CPF').AsString)) = 11 then
        begin
          CPF := Trim(vQrAux.FieldByName('CPF').AsString);
          vCPFCNPJ := CPF;
        end
        else
        begin
          CNPJ := '';
          CPF := '';
          vCPFCNPJ := '';
        end;
        if Trim(vQrAux.FieldByName('IE').AsString) <> 'ISENTO' then
          IE := Trim(vQrAux.FieldByName('IE').AsString);
        if vQrAux.FieldByName('COD_MUN').AsString <> '' then
          COD_MUN := vQrAux.FieldByName('COD_MUN').AsInteger;
        SUFRAMA := Trim(vQrAux.FieldByName('SUFRAMA').AsString);
        ENDERECO := Trim(vQrAux.FieldByName('END').AsString);
        NUM := Copy(Trim(vQrAux.FieldByName('NUM').AsString),1,10);
        COMPL := Trim(vQrAux.FieldByName('COMPL').AsString);
        BAIRRO := Trim(vQrAux.FieldByName('BAIRRO').AsString);
        FParticipantes.Add(FCodEmpresa+'|'+COD_PART + '|' + copy(vQrAux.FieldByName('COD_MUN').AsString, 1, 2)+'|'+vQrAux.FieldByName('sigla_uf').AsString+'|' + vCPFCNPJ + '|');
      end;
    end;
  end;
end;

procedure TSpedHw.montaRegistro0190(pUNID: string);
var
  I: Integer;
  vDescricao: string;
begin
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    for I := 0 to F0190.Count - 1 do
      if UpperCase(Trim(F0190[I])) = UpperCase(Trim(pUNID)) then
        exit;
  end
  else
  begin
    for I := 0 to F0190.Count - 1 do
      if (getCampoPipe(F0190[I],1) = FCodEmpresa) and
        (getCampoPipe(F0190[I],2) = UpperCase(Trim(pUNID))) then
        exit;
  end;
  if UpperCase(Trim(pUNID)) = 'UN' then
    vDescricao := 'UNIDADES'
  else if UpperCase(Trim(pUNID)) = 'UNI' then
    vDescricao := 'UNIDADES'
  else if UpperCase(Trim(pUNID)) = 'PC' then
    vDescricao := 'PECAS'
  else if UpperCase(Trim(pUNID)) = 'PCA' then
    vDescricao := 'PECAS'
  else if UpperCase(Trim(pUNID)) = 'KG' then
    vDescricao := 'KILOS'
  else if UpperCase(Trim(pUNID)) = 'CX' then
    vDescricao := 'CAIXAS'
  else if UpperCase(Trim(pUNID)) = 'CXA' then
    vDescricao := 'CAIXAS'
  else if UpperCase(Trim(pUNID)) = 'LT' then
    vDescricao := 'LITROS'
  else if UpperCase(Trim(pUNID)) = 'LTR' then
    vDescricao := 'LITROS'
  else if UpperCase(Trim(pUNID)) = 'PÇ' then
    vDescricao := 'PECAS'
  else if UpperCase(Trim(pUNID)) = 'PÇA' then
    vDescricao := 'PECAS'
  else
    vDescricao := UpperCase(Trim(pUNID))+'1';
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    with FSpedF.Bloco_0.Registro0190New do
    begin
      UNID := UpperCase(Trim(pUNID));
      DESCR := Trim(vDescricao);
      F0190.Add(UpperCase(Trim(pUNID)));
    end;
  end
  else
  begin
    with FSpedP.Bloco_0.Registro0190New do
    begin
      UNID := UpperCase(Trim(pUNID));
      DESCR := Trim(vDescricao);
      F0190.Add(FCodEmpresa+'|'+UpperCase(Trim(pUNID))+'|');
    end;
  end;
end;

procedure TSpedHw.montaRegistro0200;
var
  vTemp, vTipoItem: string;
  I: integer;
  vCOD_ITEM, vDESCR_ITEM, vCOD_BARRA, vCOD_ANT_ITEM, vUNID_INV, vCOD_NCM,
  vEX_IPI, vCOD_GEN, vCOD_LST, vTIPO_ITEM: string;
  vALIQ_ICMS: Double;
begin
  FLabelStatus.Caption := 'Montando registro 0190 e 0200 - Produtos';
  try
    vQrAux.Close;
    vQrAux.SQL.Text := 'select si.tipo, si.grupo_prod, si.cod_prod, si.chassi,  si.cod_servico,' +
      ' si.cod_outras, p.descr_prod DESCR_ITEM, p.num_fab_prod COD_BARRA,' +
      ' NULL COD_ANT_ITEM, p.unidade UNID_INV,' +
      ' case when p.consumo = ''S'' then ''07'' ' +
      '     when ((p.tipo_item is null) or (p.tipo_item = '''')) then ''00''' +
      '     else p.tipo_item' +
      ' end tipo_item, p.nbm COD_NCM, null EX_IPI,' +
      ' substring(p.nbm from 1 for 2) COD_GEN, null COD_LST, P.icm_prod ALIQ_ICMS  from sped_item si' +
      ' inner join produtos p on p.grupo_prod = si.grupo_prod and' +
      ' p.cod_prod = si.cod_prod and p.cod_empresa = si.cod_empresa' +
      ' where si.tipo = ''P'' and si.cod_empresa = ' +FCodEmpresa +
      ' union' +
      ' select si.tipo, si.grupo_prod, si.cod_prod, si.chassi,  si.cod_servico,' +
      ' si.cod_outras, ts.desc_servico DESCR_ITEM, cast(ts.cod_servico as varchar(20))' +
      ' COD_BARRA, NULL COD_ANT_ITEM, ''UN'' UNID_INV, ''09'' tipo_item, '''' COD_NCM,' +
      ' null EX_IPI, ''00'' COD_GEN, ts.cod_serv_leicomplementar_166 COD_LST,' +
      ' 0 ALIQ_ICMS from sped_item si' +
      ' inner join tipo_servico ts on ts.cod_servico = si.cod_servico' +
      ' where si.tipo = ''S'' and si.cod_empresa = ' +FCodEmpresa+
      ' union' +
      ' select si.tipo, si.grupo_prod, si.cod_prod, si.chassi,  si.cod_servico,' +
      ' si.cod_outras, null DESCR_ITEM, si.chassi COD_BARRA, NULL COD_ANT_ITEM,' +
      ' si.unid UNID_INV, null tipo_item, null COD_NCM,' +
      ' null EX_IPI, null COD_GEN, null COD_LST, 0 ALIQ_ICMS from sped_item si' +
      ' where (si.tipo = ''V'' or si.tipo = ''O'' or si.tipo = ''D'')' +
      ' and si.cod_empresa = ' + FCodEmpresa + ' order by 1';
    vQrAux.Open;
    vQrAux.FetchAll;

    if F0200 = nil then
      F0200 := TStringList.Create;

    FProgressBar.Min := 0;
    FProgressBar.Max := vQrAux.RecordCount + F0200.Count;
    FProgressBar.Position := 1;

    vQrAux.First;

    while not vQrAux.Eof do
    begin
      Application.ProcessMessages;
      //with FSpedF.Bloco_0.Registro0200New do
      //begin
        if vQrAux.FieldByName('tipo').AsString = 'P' then
          vCOD_ITEM := 'P' + StrZero(vQrAux.FieldByName('grupo_prod').AsString +
            Trim(vQrAux.FieldByName('cod_prod').AsString), 16)
        else if vQrAux.FieldByName('tipo').AsString = 'S' then
          vCOD_ITEM := 'S' + StrZero(vQrAux.FieldByName('cod_servico').AsString, 16)
        else if vQrAux.FieldByName('tipo').AsString = 'V' then
          vCOD_ITEM := StrZero(vQrAux.FieldByName('chassi').AsString, 17)
        else if vQrAux.FieldByName('tipo').AsString = 'O' then
          vCOD_ITEM := vQrAux.FieldByName('cod_outras').AsString
        else if vQrAux.FieldByName('tipo').AsString = 'D' then
          vCOD_ITEM := vQrAux.FieldByName('cod_outras').AsString;
        if vQrAux.FieldByName('tipo').AsString = 'V' then
        begin
          vQrAux1.Close;
          vQrAux1.SQL.Text := 'select first 1 tm.descricao DESCR_ITEM,' +
            ' case when ((nfv.tipo_item is null) or (nfv.tipo_item = '''')) then ''00''' +
            ' else nfv.tipo_item' +
            ' end tipo_item, tm.ncmsh COD_NCM,' +
            ' substring(tm.ncmsh from 1 for 2) COD_GEN, 0 aliq_icms' +
            ' from notafiscal_item_veiculo nfv' +
            ' inner join tipmodelo tm on tm.codigo = nfv.versao and tm.cod_empresa =' +
            ' nfv.cod_empresa' +
            ' where nfv.chassi = :chassi and nfv.cod_empresa = :cod_empresa';
          vQrAux1.ParamByName('chassi').AsString := Trim(vQrAux.FieldByName('chassi').AsString);
          vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vQrAux1.Open;
          if Trim(vQrAux1.FieldByName('DESCR_ITEM').AsString) = '' then
          begin
            vQrAux1.Close;
            vQrAux1.SQL.Text :=
              'select first 1 tm.descricao DESCR_ITEM, ''00'' tipo_item, tm.ncmsh COD_NCM,' +
              ' substring(tm.ncmsh from 1 for 2) COD_GEN, 0 aliq_icms' +
              ' from ent_moto_itens nfv' +
              ' inner join tipmodelo tm on tm.codigo = nfv.versao and tm.cod_empresa =' +
              ' nfv.cod_empresa' +
              ' where nfv.chassi_c = :chassi and nfv.cod_empresa = :cod_empresa';
            vQrAux1.ParamByName('chassi').AsString := Trim(vQrAux.FieldByName('chassi').AsString);
            vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vQrAux1.Open;
          end;
          vDESCR_ITEM := Trim(vQrAux1.FieldByName('DESCR_ITEM').AsString);
          vCOD_BARRA := Trim(vQrAux.FieldByName('COD_BARRA').AsString);
          vCOD_ANT_ITEM := '';
          vUNID_INV := Trim(vQrAux.FieldByName('UNID_INV').AsString);
          vTipoItem := vQrAux1.FieldByName('TIPO_ITEM').AsString;
          vCOD_NCM := Trim(vQrAux1.FieldByName('COD_NCM').AsString);
          vEX_IPI := Trim(vQrAux.FieldByName('EX_IPI').AsString);
          vCOD_GEN := Trim(vQrAux1.FieldByName('COD_GEN').AsString);
          vCOD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString);
          vALIQ_ICMS := vQrAux1.FieldByName('ALIQ_ICMS').AsCurrency;
          vQrAux1.Close;
        end
        else if (vQrAux.FieldByName('tipo').AsString = 'O') or (vQrAux.FieldByName('tipo').AsString
          =
          'D') then
        begin
          vQrAux1.Close;
          vQrAux1.SQL.Text :=
            'select first 1 nfi.descricao_item_outras, nfi.descricao_item, ''99'' tipo_item,' +
            ' nfi.ncm COD_NCM, substring(nfi.ncm from 1 for 2) COD_GEN, nfi.aliq_icm aliq_icms,' +
            ' nfi.num_fab_prod from notafiscal_item nfi' +
            ' where nfi.cod_nf = :cod_nf and nfi.nitem = :nitem and nfi.cod_empresa = :cod_empresa';
          vQrAux1.ParamByName('cod_nf').AsInteger :=
            StrToInt(copy(vQrAux.FieldByName('cod_outras').AsString, 2, 7));
          vQrAux1.ParamByName('nitem').AsInteger :=
            StrToInt(copy(vQrAux.FieldByName('cod_outras').AsString, 9, 3));
          vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vQrAux1.Open;
          if (vQrAux.FieldByName('tipo').AsString = 'O') then
            vDESCR_ITEM :=
              Trim(getCampoBlobString(vQrAux1.FieldByName('descricao_item_outras').AsString))
          else
            vDESCR_ITEM := Trim(getCampoBlobString(vQrAux1.FieldByName('descricao_item').AsString));
          vCOD_BARRA := Trim(vQrAux1.FieldByName('num_fab_prod').AsString);
          vCOD_ANT_ITEM := '';
          vUNID_INV := Trim(vQrAux.FieldByName('UNID_INV').AsString);
          vTipoItem := vQrAux1.FieldByName('TIPO_ITEM').AsString;
          vCOD_NCM := Trim(vQrAux1.FieldByName('COD_NCM').AsString);
          vEX_IPI := Trim(vQrAux.FieldByName('EX_IPI').AsString);
          vCOD_GEN := Trim(vQrAux1.FieldByName('COD_GEN').AsString);
          vCOD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString);
          vALIQ_ICMS := vQrAux1.FieldByName('ALIQ_ICMS').AsCurrency;
          vQrAux1.Close;
        end
        else
        begin
          vDESCR_ITEM := Trim(vQrAux.FieldByName('DESCR_ITEM').AsString);
          vCOD_BARRA := Trim(vQrAux.FieldByName('COD_BARRA').AsString);
          vCOD_ANT_ITEM := '';
          vUNID_INV := Trim(vQrAux.FieldByName('UNID_INV').AsString);
          vTipoItem := vQrAux.FieldByName('TIPO_ITEM').AsString;
          vCOD_NCM := Trim(vQrAux.FieldByName('COD_NCM').AsString);
          vEX_IPI := Trim(vQrAux.FieldByName('EX_IPI').AsString);
          vCOD_GEN := Trim(vQrAux.FieldByName('COD_GEN').AsString);
          vCOD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString);
          vALIQ_ICMS := vQrAux.FieldByName('ALIQ_ICMS').AsCurrency;
        end;
        //vTIPO_ITEM := StrToTipoItem(vvTipoItem);
        montaRegistro0190(vUNID_INV);
      //end;
      if FSpedFiscalOuPisCofins = 'F' then
      begin
        with FSpedF.Bloco_0.Registro0200New do
        begin
          COD_ITEM := vCOD_ITEM;
          DESCR_ITEM := vDESCR_ITEM;
          COD_BARRA := vCOD_BARRA;
          COD_ANT_ITEM := vCOD_ANT_ITEM;
          UNID_INV := vUNID_INV;
          TIPO_ITEM := StrToTipoItemF(vTipoItem);
          if Length(Trim(vCOD_NCM)) = 8 then
            COD_NCM := vCOD_NCM;
          EX_IPI := vEX_IPI;
          COD_GEN := vCOD_GEN;
          COD_LST := vCOD_LST;
          ALIQ_ICMS := vALIQ_ICMS;
        end;
      end
      else
      begin
        with FSpedP.Bloco_0.Registro0200New do
        begin
          COD_ITEM := vCOD_ITEM;
          DESCR_ITEM := vDESCR_ITEM;
          COD_BARRA := vCOD_BARRA;
          COD_ANT_ITEM := vCOD_ANT_ITEM;
          UNID_INV := vUNID_INV;
          TIPO_ITEM := _StrToTipoItemPC(vTipoItem);
          if Length(Trim(vCOD_NCM)) = 8 then
            COD_NCM := vCOD_NCM;
          EX_IPI := vEX_IPI;
          COD_GEN := vCOD_GEN;
          COD_LST := vCOD_LST;
          ALIQ_ICMS := vALIQ_ICMS;
          Registro0208.COD_TAB := codIndiTabNaoTem;
        end;
      end;
      vQrAux.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;
    for I := 0 to F0200.Count - 1 do
    begin
      vCOD_ITEM := getCampoPipe(F0200[I], 1);
      vDESCR_ITEM := getCampoPipe(F0200[I], 2);
      vCOD_BARRA := getCampoPipe(F0200[I], 3);
      vCOD_ANT_ITEM := getCampoPipe(F0200[I], 4);
      vUNID_INV := getCampoPipe(F0200[I], 5);
      vTIPO_ITEM := getCampoPipe(F0200[I], 6);
      vCOD_NCM := getCampoPipe(F0200[I], 7);
      vEX_IPI := getCampoPipe(F0200[I], 8);
      vCOD_GEN := getCampoPipe(F0200[I], 9);
      vCOD_LST := getCampoPipe(F0200[I], 10);
      if getCampoPipe(F0200[I], 11) <> '' then
        vALIQ_ICMS := StrToFloat(getCampoPipe(F0200[I], 11));

      if FSpedFiscalOuPisCofins = 'F' then
      begin
        with FSpedF.Bloco_0.Registro0200New do
        begin
          COD_ITEM := vCOD_ITEM;
          DESCR_ITEM := vDESCR_ITEM;
          COD_BARRA := vCOD_BARRA;
          COD_ANT_ITEM := vCOD_ANT_ITEM;
          UNID_INV := vUNID_INV;
          TIPO_ITEM := StrToTipoItemF(vTIPO_ITEM);
          COD_NCM := vCOD_NCM;
          EX_IPI := vEX_IPI;
          COD_GEN := vCOD_GEN;
          COD_LST := vCOD_LST;
          ALIQ_ICMS := vALIQ_ICMS;
        end;
      end
      else
      begin
        with FSpedP.Bloco_0.Registro0200New do
        begin
          COD_ITEM := vCOD_ITEM;
          DESCR_ITEM := vDESCR_ITEM;
          COD_BARRA := vCOD_BARRA;
          COD_ANT_ITEM := vCOD_ANT_ITEM;
          UNID_INV := vUNID_INV;
          TIPO_ITEM := _StrToTipoItemPC(vTIPO_ITEM);
          COD_NCM := vCOD_NCM;
          EX_IPI := vEX_IPI;
          COD_GEN := vCOD_GEN;
          COD_LST := vCOD_LST;
          ALIQ_ICMS := vALIQ_ICMS;
          Registro0208.COD_TAB := codIndiTabNaoTem;
        end;
      end;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;

  finally
    vQrAux.Close;
  end;
end;

procedure TSpedHw.montaRegistro0400(pCOD_NAT: string);
var
  I: Integer;
begin
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    for I := 0 to F0400.Count - 1 do
      if F0400[I] = pCOD_NAT then
        exit;
  end
  else
  begin
    for I := 0 to F0400.Count - 1 do
      if (getCampoPipe(F0400[I],1) = FCodEmpresa) and
        (getCampoPipe(F0400[I],2) = pCOD_NAT) then
        exit;
  end;
  vQrAux.Close;
  vQrAux.SQL.Text := 'select np.descricao_nop from nat_op np where np.codigo_nop = ' + pCOD_NAT;
  vQrAux.Open;
  try
    if FSpedFiscalOuPisCofins = 'F' then
    begin
      with FSpedF.Bloco_0.Registro0400New do
      begin
        COD_NAT := pCOD_NAT;
        if Trim(vQrAux.FieldByName('descricao_nop').AsString) <> '' then
          DESCR_NAT := Trim(getCampoBlobString(Trim(vQrAux.FieldByName('descricao_nop').AsString)))
        else
          DESCR_NAT := pCOD_NAT;
        F0400.Add(pCOD_NAT);
      end;
    end
    else
    begin
      with FSpedP.Bloco_0.Registro0400New do
      begin
        COD_NAT := pCOD_NAT;
        if Trim(vQrAux.FieldByName('descricao_nop').AsString) <> '' then
          DESCR_NAT := Trim(getCampoBlobString(Trim(vQrAux.FieldByName('descricao_nop').AsString)))
        else
          DESCR_NAT := pCOD_NAT;
        F0400.Add(FCodEmpresa+'|'+pCOD_NAT+'|');
      end;
    end;
  finally
    vQrAux.Close;
  end;
end;

procedure TSpedHw.montaRegistro0400(var pCOD_NAT: string; pDESC_NATOP: string);
var
  I: Integer;
  vNItem: string;
begin
  {if FSpedFiscalOuPisCofins = 'F' then
  begin
    //for I := 0 to F0400.Count - 1 do
      //if F0400[I] = (pCOD_NAT + pDESC_NATOP) then
        //exit;
    for I := 0 to F0400.Count - 1 do
      if (getCampoPipe(F0400[I],1) = pCOD_NAT) and
        (getCampoPipe(F0400[I],2) = pDESC_NATOP) then
      begin
        pCOD_NAT := pCOD_NAT + getCampoPipe(F0400[I],3);
        exit;
      end;
  end
  else
  begin
    for I := 0 to F0400.Count - 1 do
      if (getCampoPipe(F0400[I],1) = FCodEmpresa) and
        (getCampoPipe(F0400[I],2) = pCOD_NAT) and
        (getCampoPipe(F0400[I],3) = pDESC_NATOP) then
      begin
        pCOD_NAT := pCOD_NAT + getCampoPipe(F0400[I],4);
        exit;
      end;
  end;
  vQrAux.Close;
  vQrAux.SQL.Text := 'select np.descricao_nop from nat_op_descricao np' +
    ' where np.codigo_nop = ' + pCOD_NAT + ' and np.DESCRICAO_NOP = ' + QuotedStr(pDESC_NATOP);
  vQrAux.Open;
  if vQrAux.IsEmpty then
  begin
    vQrAux.Close;
    vQrAux.SQL.Text := 'select np.descricao_nop from nat_op np where np.codigo_nop = ' + pCOD_NAT;
    vQrAux.Open;
    vNItem := '0';
  end
  else
    vNItem := vQrAux.FieldByName('NITEM_NOP_DESC').AsString;

  try
    if FSpedFiscalOuPisCofins = 'F' then
    begin
      with FSpedF.Bloco_0.Registro0400New do
      begin
        COD_NAT := pCOD_NAT + vNItem;
        if Trim(vQrAux.FieldByName('descricao_nop').AsString) <> '' then
          DESCR_NAT := Trim(getCampoBlobString(Trim(vQrAux.FieldByName('descricao_nop').AsString)))
        else
          DESCR_NAT := pCOD_NAT;
        //F0400.Add(pCOD_NAT + pDESC_NATOP);
        F0400.Add(pCOD_NAT + '|' + pDESC_NATOP + '|' + vNItem + '|');
        pCOD_NAT := pCOD_NAT + vNItem;
      end;
    end
    else
    begin
      with FSpedP.Bloco_0.Registro0400New do
      begin
        COD_NAT := pCOD_NAT + vNItem;
        if Trim(vQrAux.FieldByName('descricao_nop').AsString) <> '' then
          DESCR_NAT := Trim(getCampoBlobString(Trim(vQrAux.FieldByName('descricao_nop').AsString)))
        else
          DESCR_NAT := pCOD_NAT;
        F0400.Add(FCodEmpresa + '|' + pCOD_NAT + '|' + pDESC_NATOP + '|' + vNItem + '|');
        pCOD_NAT := pCOD_NAT + vNItem;
      end;
    end;
  finally
    vQrAux.Close;
  end;    }

  if pDESC_NATOP = '' then
  begin
    vQrAux.Close;
    vQrAux.SQL.Text := 'select np.descricao_nop from nat_op np where np.codigo_nop = ' + pCOD_NAT;
    vQrAux.Open;
    pDESC_NATOP := Trim(vQrAux.FieldByName('descricao_nop').AsString);
  end;

  vNItem := '0';
  for I := 0 to F0400.Count - 1 do
    if (getCampoPipe(F0400[I],1) = FCodEmpresa) and
      (getCampoPipe(F0400[I],2) = pCOD_NAT) then
    begin
      if (getCampoPipe(F0400[I],3) = pDESC_NATOP) then
      begin
        pCOD_NAT := pCOD_NAT + getCampoPipe(F0400[I],4);
        Exit;
      end;

        vNItem := IntToStr(
          StrToInt(Trim(getCampoPipe(F0400[I],4))) + 1);
    end;

  try
    if FSpedFiscalOuPisCofins = 'F' then
    begin
      with FSpedF.Bloco_0.Registro0400New do
      begin
        COD_NAT := pCOD_NAT + vNItem;
        if Trim(pDESC_NATOP) <> '' then
          DESCR_NAT := Trim(pDESC_NATOP)
        else
          DESCR_NAT := pCOD_NAT;
      end;
    end
    else
    begin
      with FSpedP.Bloco_0.Registro0400New do
      begin
        COD_NAT := pCOD_NAT + vNItem;
        if Trim(pDESC_NATOP) <> '' then
          DESCR_NAT := Trim(pDESC_NATOP)
        else
          DESCR_NAT := pCOD_NAT;
      end;
    end;
  finally
    vQrAux.Close;
  end;

  F0400.Add(FCodEmpresa + '|' + pCOD_NAT + '|' + pDESC_NATOP + '|' + vNItem + '|');
  pCOD_NAT := pCOD_NAT + vNItem;

end;

procedure TSpedHw.montaRegistro0450(pCOD_INF: integer; pTXT: string);
var
  I: Integer;
begin
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    for I := 0 to F0450.Count - 1 do
      if F0450[I] = IntToStr(pCOD_INF) then
        exit;
  end
  else
  begin
    for I := 0 to F0450.Count - 1 do
      if (getCampoPipe(F0450[I],1) = FCodEmpresa) and
        (getCampoPipe(F0450[I],2) = IntToStr(pCOD_INF)) then
        exit;
  end;
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    with FSpedF.Bloco_0.Registro0450New do
    begin
      COD_INF := IntToStr(pCOD_INF);
      TXT := getCampoBlobString(pTXT);
      F0450.Add(IntToStr(pCOD_INF));
    end;
  end
  else
  begin
    with FSpedP.Bloco_0.Registro0450New do
    begin
      COD_INF := IntToStr(pCOD_INF);
      TXT := getCampoBlobString(pTXT);
      F0450.Add(FCodEmpresa+'|'+IntToStr(pCOD_INF)+'|');
    end;
  end;
end;

procedure TSpedHw.montaRegistroC400(pCOD_MOD, pECF_MOD, pECF_FAB,
  pECF_CX: string);
var
  I: Integer;
begin
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    for I := 0 to FC400.Count - 1 do
      if FC400[I] = (SpaceStr(pECF_MOD, 20) + SpaceStr(pECF_FAB, 20) + StrZero(pECF_CX, 3)) then
        exit;
  end
  else
  begin
    for I := 0 to FC400.Count - 1 do
      if (getCampoPipe(FC400[I],1) = FCodEmpresa) and
        (getCampoPipe(FC400[I],2) = pCOD_MOD) and
        (getCampoPipe(FC400[I],3) = pECF_MOD) and
        (getCampoPipe(FC400[I],4) = pECF_FAB) and
        (getCampoPipe(FC400[I],5) = pECF_CX) then
        exit;
  end;
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    with FSpedF.Bloco_C.RegistroC400New do
    begin
      COD_MOD := Trim(pCOD_MOD);
      ECF_MOD := Trim(pECF_MOD);
      ECF_FAB := Trim(pECF_FAB);
      ECF_CX := Trim(pECF_CX);
      FC400.Add(SpaceStr(pECF_MOD, 20) + SpaceStr(pECF_FAB, 20) + StrZero(pECF_CX, 3));
    end;
  end
  else
  begin
    with FSpedP.Bloco_C.RegistroC400New do
    begin
      COD_MOD := Trim(pCOD_MOD);
      ECF_MOD := Trim(pECF_MOD);
      ECF_FAB := Trim(pECF_FAB);
      ECF_CX := StrToInt(Trim(pECF_CX));
      FC400.Add(FCodEmpresa+'|'+pCOD_MOD+'|'+pECF_MOD+'|'+ECF_FAB+'|'+pECF_CX+'|');
    end;
  end;
end;

function TSpedHw.SpaceStr(vStr: string; Tam: Integer): string;
var
  I: Integer;
  V1: string;
begin
  V1 := Trim(vStr);
  for I := 1 to Tam - Length(V1) do
    V1 := ' ' + V1;
  Result := V1;
end;

function TSpedHw.StrToFloatFormat(valor: Currency;
  casasDecimais: integer): Currency;
begin
  Result := StrToFloat(Format('%0.' + IntToStr(casasDecimais) + 'f', [valor]));
end;

function TSpedHw.StrZero(Num: string; Tam: Integer): string;
var
  I: Integer;
  V1: string;
begin
  V1 := Trim(Num);
  for I := 1 to Tam - Length(V1) do
    V1 := '0' + V1;
  Result := V1;
end;

procedure TSpedHw.verificaCamposNullCupom(pNSerieECF: string;
  pCodTerminal: integer);
var
  vQrTemp, vQrTemp2, vQrExec: TIBQuery;
  vValorPIS: Currency;
  vValorCOFINS: Currency;
  vValorAcumuladoPIS: Currency;
  vValorAcumuladoCOFINS: Currency;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    vQrTemp2 := TIBQuery.Create(Application);
    vQrTemp2.Database := vConexao;
    vQrTemp2.Transaction := vTransacao;
    try
      FLabelStatus.Caption := 'Verificando campos nulos - Cupom Fiscal';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update cupom cp set cp.valor_desc = 0' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
        ' and cp.cod_empresa = :cod_empresa and cp.data >= :dataIni and cp.data <= :dataFim' +
        ' and cp.valor_desc is null';
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

//      vQrExec.Close;
//      vQrExec.SQL.Text := 'update MAPA_RESUMO_ALIQ cp set cp.descaliq = ''CAN-T'' ' +
//        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
//        ' and cp.cod_empresa = :cod_empresa and ((cp.descaliq = ''Canc-T'') or' +
//        ' (cp.descaliq = ''Can-T''))';
//      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
//      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
//      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//      vQrExec.ExecSQL;

//      vQrExec.Close;
//      vQrExec.SQL.Text := 'update MAPA_RESUMO_ALIQ cp set cp.descaliq = ''CAN-S'' ' +
//        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
//        ' and cp.cod_empresa = :cod_empresa and ((cp.descaliq = ''Canc-S'') or' +
//        ' (cp.descaliq = ''Can-S''))';
//      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
//      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
//      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//      vQrExec.ExecSQL;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update cupom cp set cp.valor_acres = 0' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
        ' and cp.cod_empresa = :cod_empresa and cp.data >= :dataIni and cp.data <= :dataFim' +
        ' and cp.valor_acres is null';
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update cupom cp set cp.status_cp = '''' ' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
        ' and cp.cod_empresa = :cod_empresa and cp.data >= :dataIni and cp.data <= :dataFim' +
        ' and cp.status_cp is null';
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

      { vQrTemp.Close;
       vQrTemp.SQL.Text := 'select cp.registro, cp.cupom NUM_DOC' +
         ' from cupom cp ' +
         ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
         ' and cp.cod_empresa = :cod_empresa and cp.data >= :dataIni and cp.data <= :dataFim';
       vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
       vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
       vQrTemp.ParamByName('cod_terminal').AsInteger := pCodTerminal;
       vQrTemp.ParamByName('nserie').AsString := pNSerieECF;
       vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
       vQrTemp.Open;

       vQrTemp.FetchAll;

       FProgressBar2.Min := 0;
       FProgressBar2.Max := vQrTemp.RecordCount;
       FProgressBar2.Position := 0;

       vQrTemp.First;
       while not vQrTemp.Eof do
       begin
         Application.ProcessMessages;   }

      vQrExec.Close;
      vQrExec.SQL.Text := 'update cupom2 cp2 set cp2.rat_acres = 0' +
        ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
        ' and cp2.cod_empresa = :cod_empresa' + // and cp2.cupom = :cupom and cp2.ordem = :ordem' +
      ' and cp2.rat_acres is null';
      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      //vQrExec.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('NUM_DOC').AsInteger;
      //vQrExec.ParamByName('ordem').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
      vQrExec.Prepare;
      vQrExec.ExecSQL;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update cupom2 cp2 set cp2.rat_desc = 0' +
        ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
        ' and cp2.cod_empresa = :cod_empresa' + // and cp2.cupom = :cupom and cp2.ordem = :ordem' +
      ' and cp2.rat_desc is null';
      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      //vQrExec.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('NUM_DOC').AsInteger;
      //vQrExec.ParamByName('ordem').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
      vQrExec.Prepare;
      vQrExec.ExecSQL;

      //Update para corrigir CST para nao dar erro no SPED
      vQrExec.Close;
      vQrExec.SQL.Text := 'update cupom2 cp2' +
        ' set cp2.cst = substring(cp2.cst from 1 for 1)||''60''' +
        ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
        ' and cp2.cod_empresa = :cod_empresa' +
        ' and cp2.descaliq = ''F'' and substring(cp2.cst from 2 for 2) <> ''60''';
      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.Prepare;
      vQrExec.ExecSQL;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select cp2.registro, cp2.nitem, cp2.cupom, cp2.ordem,' +
        ' cp2.grupo_prod, cp2.cod_prod, cp2.prod_serv, cp2.descaliq from cupom cp' +
        ' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
        ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
        ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
        ' and cp.cod_empresa = :cod_empresa and cp.data >= :dataIni and cp.data <= :dataFim' +
        ' and coalesce(codigo_nop, 0) = 0'; //and cp.status_cp <> ''CANCELADO''';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrTemp.ParamByName('nserie').AsString := pNSerieECF;
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        vQrTemp2.Close;
        if vQrTemp.FieldByName('prod_serv').AsString = 'S' then
          vQrTemp2.SQL.Text := 'select codigo_nop from tipo_servico' +
            ' where cod_servico = ' + IntToStr(vQrTemp.FieldByName('grupo_prod').AsInteger)
        else                                                                               
          vQrTemp2.SQL.Text := 'select codigo_nop from produtos' +
            ' where grupo_prod = ' + IntToStr(vQrTemp.FieldByName('grupo_prod').AsInteger) +
            ' and cod_prod = ' + QuotedStr(vQrTemp.FieldByName('cod_prod').AsString) +
            ' and cod_empresa = ' + FCodEmpresa;

        vQrTemp2.Open;    
        vQrExec.Close;
        vQrExec.SQL.Text :=
          'update cupom2 cp2 set cp2.codigo_nop = :codigo_nop' +
          ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
          ' and cp2.cod_empresa = :cod_empresa and cp2.registro = :registro' +
          ' and cp2.nitem = :nitem and cp2.cupom = :cupom and cp2.ordem = :ordem';
        vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
        vQrExec.ParamByName('nserie').AsString := pNSerieECF;
        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrExec.ParamByName('registro').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
        vQrExec.ParamByName('nitem').AsInteger := vQrTemp.FieldByName('nitem').AsInteger;
        vQrExec.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('cupom').AsInteger;
        vQrExec.ParamByName('ordem').AsInteger := vQrTemp.FieldByName('ordem').AsInteger;
        if vQrTemp2.FieldByName('codigo_nop').AsFloat > 0 then
          vQrExec.ParamByName('codigo_nop').AsFloat := vQrTemp2.FieldByName('codigo_nop').AsFloat
        else if Trim(vQrTemp.FieldByName('prod_serv').AsString) = 'S' then
          vQrExec.ParamByName('codigo_nop').AsFloat := 5933
        else if Trim(vQrTemp.FieldByName('descaliq').AsString) = 'F' then
          vQrExec.ParamByName('codigo_nop').AsFloat := 5403
        else
          vQrExec.ParamByName('codigo_nop').AsFloat := 5102;
        vQrExec.Prepare;
        vQrExec.ExecSQL;

        vQrTemp.Next;
      end;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;

    vQrTemp.Free;
    vQrTemp := nil;

    vQrTemp2.Free;
    vQrTemp2 := nil;
  end;
end;

procedure TSpedHw.verificaCamposNuloNF;
var
  vQrExec: TIBQuery;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;
    try
      FLabelStatus.Caption := 'Corrigindo campos nulos - Nota Fiscal';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update notafiscal set valor_prod = 0 ' +
        ' where valor_prod is null and data_lanc >= :dataIni and data_lanc <= :dataFim and cod_empresa = ' +
        FCodEmpresa;
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.Prepare;
      vQrExec.ExecSQL;
      vQrExec.Close;
      vQrExec.SQL.Text := 'update notafiscal set valor_serv = 0 ' +
        ' where valor_serv is null and data_lanc >= :dataIni and data_lanc <= :dataFim and cod_empresa = ' +
        FCodEmpresa;
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.Prepare;
      vQrExec.ExecSQL;
      vQrExec.Close;
      vQrExec.SQL.Text := 'update notafiscal set aliq_icm = 0 ' +
        ' where aliq_icm is null and data_lanc >= :dataIni and data_lanc <= :dataFim and cod_empresa = ' +
        FCodEmpresa;
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.Prepare;
      vQrExec.ExecSQL;
      
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;
  end;
end;

function TSpedHw.verificaCupomSemZ(pNSerieECF: string;
  pCodTerminal: integer): boolean;
var
  vQrExec: TIBQuery;
  I: Integer;
  diaIni: Integer;
  diaFim: Integer;
  vData: TDate;
  vValorTotalISS, vValorCP2, vValorI: Extended;
  vLista: TStringList;
  vMaxMapa: string;
  vTmpMax: Integer;
begin
  Result := True;
  try
    vQrAux := TIBQuery.Create(Application);
    vQrAux.Database := vConexao;
    vQrAux.Transaction := vTransacao;

    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    FLabelStatus.Caption := 'Verificando movimento sem Redução Z';
    Application.ProcessMessages;

    try
      diaIni := StrToInt(copy(FDataIni, 1, 2));
      diaFim := StrToInt(copy(FDataFim, 1, 2));
      for I := diaIni to diaFim do
      begin
        vData := strtodate(StrZero(IntToStr(i), 2) + copy(FDataIni, 3, 8));
        vQrAux.Close;
        vQrAux.SQL.Text := 'select first 1 cp.cupom from cupom cp' +
          ' where cp.data = :dia and cp.cod_terminal = :cod_terminal and' +
          ' cp.nserieecf = :nserie and cp.cod_empresa = :cod_empresa';
        vQrAux.ParamByName('dia').AsDate := vData;
        vQrAux.ParamByName('cod_terminal').AsInteger := pCodTerminal;
        vQrAux.ParamByName('nserie').AsString := pNSerieECF;
        vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrAux.Open;
        if not vQrAux.IsEmpty then
        begin
          vQrAux.Close;
          vQrAux.SQL.Text := 'select first 1 res.coored from resumod res' +
            ' where res.data_mov = :dia and res.cod_terminal = :cod_terminal and' +
            ' res.nserieecf = :nserie and res.cod_empresa = :cod_empresa';
          vQrAux.ParamByName('dia').AsDate := vData;
          vQrAux.ParamByName('cod_terminal').AsInteger := pCodTerminal;
          vQrAux.ParamByName('nserie').AsString := pNSerieECF;
          vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vQrAux.Open;
          if vQrAux.IsEmpty then
          begin
            Result := False;
            Application.MessageBox(pchar('Sem Redução Z no sistema para a data ' +
              DateToStr(vData) + #13 +
              'E Cupons fiscais encontrados. Verifique e cadastre a redução Z no Sistema' + #13 +
              'Caixa ' + IntToStr(pCodTerminal) + ' - ' + pNSerieECF),
              'Atenção', 0 + 64);
          end;
        end;
      end;

      vLista := TStringList.Create;

      vQrAux1.Close;
      vQrAux1.SQL.Text := 'select * from resumod res' +
        ' where res.data_mov >= :dataIni and res.data_mov <= :dataFim' +
        ' and res.cod_terminal = :cod_terminal and' +
        ' res.nserieecf = :nserie and res.cod_empresa = :cod_empresa';
      vQrAux1.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrAux1.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrAux1.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrAux1.ParamByName('nserie').AsString := pNSerieECF;
      vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrAux1.Open;

      vQrAux1.First;
      while not vQrAux1.Eof do
      begin

        vValorTotalISS := vQrAux1.FieldByName('VLISS').AsFloat;
        vValorCP2 := 0;
        vTmpMax := 0;

        vQrAux.Close;
        vQrAux.SQL.Text := 'select cp2.descaliq,' +
          ' sum( (coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0)))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0) ) VL_ITEM' +
          ' from cupom cp' +
          ' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
          ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
          ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
          ' where ((cp2.status_it <> ''CANCELADO'') or (cp2.status_it IS NULL))' +
          ' and ((cp.status_cp <> ''CANCELADO'') or (cp.status_cp is null))' +
          ' and cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
          ' and cp2.cod_empresa = :cod_empresa and cp.data = :dia' +
          ' and cp2.prod_serv = ''S''' +
          ' group by 1';
        vQrAux.ParamByName('dia').AsDate := vQrAux1.FieldByName('DATA_MOV').AsDateTime;
        vQrAux.ParamByName('cod_terminal').AsInteger := pCodTerminal;
        vQrAux.ParamByName('nserie').AsString := pNSerieECF;
        vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrAux.Open;

        vLista.Clear;
        vQrAux.First;
        while not vQrAux.Eof do
        begin
          vLista.Add(
            Trim(vQrAux.FieldByName('descaliq').AsString) + '|' +
            Format( '%0.2f' ,[vQrAux.FieldByName('VL_ITEM').AsFloat]) + '|'
          );
          vValorCP2 := vValorCP2 + vQrAux.FieldByName('VL_ITEM').AsFloat;
          vQrAux.Next;
        end;

        for I := 0 to vLista.Count - 1 do
        begin

          vQrAux.Close;
          vQrAux.SQL.Text := 'select * from mapa_resumo_aliq mra where mra.coored = :coored and' +
            ' mra.cod_terminal = :cod_terminal and mra.nserieecf = :nserie' +
            ' and mra.descaliq = :descaliq' +
  //          ' and upper(mra.descaliq) like ''%S%'' and (not mra.descaliq like ''C%'')' +
            ' and mra.cod_empresa = :cod_empresa';
          vQrAux.ParamByName('coored').AsInteger := vQrAux1.FieldByName('COORED').AsInteger;
          vQrAux.ParamByName('cod_terminal').AsInteger := pCodTerminal;
          vQrAux.ParamByName('nserie').AsString := pNSerieECF;
          vQrAux.ParamByName('descaliq').AsString := getCampoPipe(vLista[I], 1);
          vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vQrAux.Open;

          if vQrAux.IsEmpty then
          begin
            if vValorTotalISS = 0 then
              vValorI := StrToFloat(getCampoPipe(vLista[I],2))
            else if Abs(vValorTotalISS - vValorCP2) > 0.5 then
            begin
              vValorI := StrToFloat(getCampoPipe(vLista[I],2)) / vValorCP2 * Abs(vValorTotalISS - vValorCP2);

              if vValorTotalISS < vValorCP2 then
                vValorI := (-1) * vValorI;

              vValorI := StrToFloat(getCampoPipe(vLista[I],2)) + vValorI;
            end
            else
              vValorI := StrToFloat(getCampoPipe(vLista[I],2));


            vQrAux.Close;
            vQrAux.SQL.Text := 'select max(mra.aliq_seq) maximo from mapa_resumo_aliq mra' +
              ' where mra.coored = :coored and' +
              ' mra.cod_terminal = :cod_terminal and mra.nserieecf = :nserie' +
              ' and mra.cod_empresa = :cod_empresa';
            vQrAux.ParamByName('coored').AsInteger := vQrAux1.FieldByName('COORED').AsInteger;
            vQrAux.ParamByName('cod_terminal').AsInteger := pCodTerminal;
            vQrAux.ParamByName('nserie').AsString := pNSerieECF;
            vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vQrAux.Open;

            vMaxMapa := Trim(vQrAux.FieldByName('maximo').AsString);

            try
              vMaxMapa := IntToStr(StrToInt(vMaxMapa) + 1 );
            except
              if vTmpMax = 0 then
                vTmpMax := 90
              else
                vTmpMax := vTmpMax + 1;
              vMaxMapa := IntToStr(vTmpMax);
            end;

            vQrExec.Close;
            vQrExec.SQL.Text := 'insert into mapa_resumo_aliq' +
              ' (COD_TERMINAL, NSERIEECF, COD_EMPRESA, COORED, ALIQ_SEQ, DESCALIQ, ATIVO, VALORALIQ)' +
              ' values' +
              ' (:COD_TERMINAL, :NSERIEECF, :COD_EMPRESA, :COORED, :ALIQ_SEQ, :DESCALIQ, 1, :VALORALIQ)';
            vQrExec.ParamByName('COD_TERMINAL').AsInteger := pCodTerminal;
            vQrExec.ParamByName('NSERIEECF').AsString := pNSerieECF;
            vQrExec.ParamByName('COD_EMPRESA').AsInteger := StrToInt(FCodEmpresa);
            vQrExec.ParamByName('COORED').AsInteger := vQrAux1.FieldByName('COORED').AsInteger;
            vQrExec.ParamByName('ALIQ_SEQ').AsString := vMaxMapa;
            vQrExec.ParamByName('DESCALIQ').AsString := getCampoPipe(vLista[I], 1);
            vQrExec.ParamByName('VALORALIQ').AsFloat := vValorI;
            vQrExec.ExecSQL;
          end;
        end;

        vQrAux1.Next;
      end;
      if vQrExec.Transaction.InTransaction then
        vQrExec.Transaction.Commit;
    except
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;
  end;
end;

procedure TSpedHw.verificaDataServicoTransporte;
var
  vQrExec: TIBQuery;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;
    try

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;
        
      vQrExec.Close;
      vQrExec.SQL.Text := 'update servico_transporte set data_lancamento = data_emissao' +
        ' where data_lancamento is null and data_emissao >= :dataIni' +
        ' and data_emissao <= :dataFim and cod_empresa = ' + FCodEmpresa;
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.Prepare;
      vQrExec.ExecSQL;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;
  end;
end;

procedure TSpedHw.verificaNfSerieD;
var
  vQrExec: TIBQuery;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;
    try

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update nf_serie_d set status = ''FECHADA''' +
        ' where ((status is null) or (status = '''')) and dataemissao >= :dataIni' +
        ' and dataemissao <= :dataFim and cod_empresa = ' + FCodEmpresa;
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.Prepare;
      vQrExec.ExecSQL;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except                  
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;
  end;
end;

procedure TSpedHw.verificaPISCOFINSCupomFiscal(pNSerieECF: string;
  pCodTerminal: integer);
var
  vQrTemp, vQrTemp2, vQrTemp3, vQrExec: TIBQuery;
  vValorPIS, vBasePIS: Currency;
  vValorCOFINS, vBaseCOFINS: Currency;
  vValorAcumuladoPIS: Currency;
  vValorAcumuladoCOFINS: Currency;

  vTempCSTPIS, vTempCSTCOFINS: String;
  vTempAliqPIS, vTempAliqCOFINS: Double;

begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    vQrTemp2 := TIBQuery.Create(Application);
    vQrTemp2.Database := vConexao;
    vQrTemp2.Transaction := vTransacao;
    
    vQrTemp3 := TIBQuery.Create(Application);
    vQrTemp3.Database := vConexao;
    vQrTemp3.Transaction := vTransacao;
    try
      FLabelStatus.Caption := 'Definindo PIS/COFINS - Cupons Fiscal';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select cp.registro, cp.cupom from cupom cp' +
        //' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
        //' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
        //' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
        ' and cp.cod_empresa = :cod_empresa and cp.data >= :dataIni and cp.data <= :dataFim' +
        ' and ((cp.valor_pis is null) or (cp.valor_cofins is null)) '; //and cp.status_cp <> ''CANCELADO''';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrTemp.ParamByName('nserie').AsString := pNSerieECF;
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;

      vQrTemp.FetchAll;

      FProgressBar2.Min := 0;
      FProgressBar2.Max := vQrTemp.RecordCount;
      FProgressBar2.Position := 1;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        vValorAcumuladoPIS := 0;
        vValorAcumuladoCOFINS := 0;

        Application.ProcessMessages;
        vQrTemp2.Close;
        vQrTemp2.SQL.Text :=
          'select cp2.registro, cp2.nitem, cp2.cupom, cp2.ordem, cp2.total,' +
          ' (coalesce(cp2.rat_acres,0) + coalesce(cp2.perc_acresc, 0)) rat_acres,' +
          ' (coalesce(cp2.rat_desc,0) + coalesce(cp2.perc_desc, 0)) rat_desc,' +
          ' cp2.prod_serv tipo_item, cp2.quantidade, cp2.grupo_prod, cp2.cod_prod' +
          ' from cupom2 cp2' +
          ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
          ' and cp2.cod_empresa = :cod_empresa and cp2.cupom = :cupom and cp2.ordem = :ordem';
        vQrTemp2.ParamByName('cod_terminal').AsInteger := pCodTerminal;
        vQrTemp2.ParamByName('nserie').AsString := pNSerieECF;
        vQrTemp2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrTemp2.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('cupom').AsInteger;
        vQrTemp2.ParamByName('ordem').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
        vQrTemp2.Open;

        vQrTemp2.First;
        while not vQrTemp2.Eof do
        begin
          vTempAliqPIS := 0;
          vTempAliqCOFINS := 0;
          vTempCSTPIS := '';
          vTempCSTCOFINS := '';

          {if (FRegime = 'SIMPLES') then
          begin
            vTempCSTPIS := '99';
            vTempCSTCOFINS := '99';
          end
          else
          begin
            if (Trim(FIncidTribPISCOFINS) = '') then
            begin
              Application.MessageBox(
                'Indicador de Incidência Tributária do PIS/COFINS não definida no Cadastro da Empresa',
                'Atenção', 0 + 64);
              Exit;
            end;
          end;}

          if Trim(vTempCSTPIS) = '' then
          begin
            if vQrTemp2.FieldByName('tipo_item').AsString = 'P' then
            begin
              vQrTemp3.Close;
              vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
                ' ALIQ_PIS_DIFERENCIADA, ALIQ_COFINS_DIFERENCIADA  from produtos' +
                ' where grupo_prod = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger)+
                ' and cod_prod = ' + QuotedStr(Trim(vQrTemp2.FieldByName('cod_prod').AsString)) +
                ' and cod_empresa = ' + FCodEmpresa;
              vQrTemp3.Open;

//              if Trim(vQrTemp3.FieldByName('isento_pis').AsString) = 'S' then
//              begin
//                vTempCSTPIS := '04';
//                vTempCSTCOFINS := '04';
//              end
//              else
              begin
                //PIS
                if (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '01') or
                  (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '') then
                begin
                  vTempCSTPIS := '01';
                  vTempAliqPIS := FAliqPIS;
                end
                else
                begin
                  vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString);
                  if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') then
                    vTempAliqPIS := vQrTemp3.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat
                  else if (vTempCSTPIS = '05') then
                  begin
                    vTempCSTPIS := '01';
                    vTempAliqPIS := FAliqPIS;
                  end;
                end;
                //COFINS
                if (Trim(vQrTemp3.FieldByName('cst_cofins').AsString) = '01') or
                  (Trim(vQrTemp3.FieldByName('cst_cofins').AsString) = '') then
                begin
                  vTempCSTCOFINS := '01';
                  vTempAliqCOFINS := FAliqCOFINS;
                end
                else
                begin
                  vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString);
                  if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') then
                    vTempAliqCOFINS := vQrTemp3.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat
                  else if (vTempCSTCOFINS = '05') then
                  begin
                    vTempCSTCOFINS := '01';
                    vTempAliqCOFINS := FAliqCOFINS;
                  end;
                end;
              end;
            end
            else if vQrTemp2.FieldByName('tipo_item').AsString = 'S' then
            begin
              vQrTemp3.Close;
              vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
                ' 0 aliq_pis, 0 aliq_cofins from tipo_servico' +
                ' where cod_servico = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger);
              vQrTemp3.Open;

              {if (Pos('SIMPLES', FRegime) > 0) then
              begin
                vTempCSTPIS := '99';
                vTempCSTCOFINS := '99';
                vTempAliqPIS := 0;
                vTempAliqCOFINS := 0;
              end
              else}
//              if (vQrTemp3.FieldByName('isento_pis').AsString = 'S') then
//              begin
//                vTempCSTPIS := '04';
//                vTempCSTCOFINS := '04';
//                vTempAliqPIS := 0;
//                vTempAliqCOFINS := 0;
//              end
//              else
              begin
                if (Trim(vQrTemp3.FieldByName('cst_pis').AsString) <> '') then
                  vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString)
                else if FAliqPIS > 0 then
                  vTempCSTPIS := '01'
                else
                  vTempCSTPIS := '49';

                if (vTempCSTPIS = '01') then
                  vTempAliqPIS := FAliqPIS
                else if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or
                  (vTempCSTPIS = '05') or (vTempCSTPIS = '49') then
                  vTempAliqPIS := vQrTemp3.FieldByName('aliq_pis').AsFloat
                else if (vTempCSTPIS = '04') or (vTempCSTPIS = '06') or
                  (vTempCSTPIS = '07') or (vTempCSTPIS = '08') or
                  (vTempCSTPIS = '09') then
                  vTempAliqPIS := 0;

                if (Trim(vQrTemp3.FieldByName('cst_cofins').AsString) <> '') then
                  vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString)
                else if FAliqCOFINS > 0 then
                  vTempCSTCOFINS := '01'
                else
                  vTempCSTCOFINS := '49';

                if (vTempCSTCOFINS = '01') then
                  vTempAliqCOFINS := FAliqCOFINS
                else if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') or
                  (vTempCSTCOFINS = '05') or (vTempCSTCOFINS = '49') then
                  vTempAliqCOFINS := vQrTemp3.FieldByName('aliq_cofins').AsFloat
                else if (vTempCSTCOFINS = '04') or (vTempCSTCOFINS = '06') or
                  (vTempCSTCOFINS = '07') or (vTempCSTCOFINS = '08') or
                  (vTempCSTCOFINS = '09') then
                  vTempAliqCOFINS := 0;
              end;

            end;

          end;

          vValorPIS := 0;
          vBasePIS := 0;
          if vTempAliqPIS > 0 then
            if (vTempCSTPIS = '01') or (vTempCSTPIS = '02') or
              (vTempCSTPIS = '50') or (vTempCSTPIS = '51') or
              (vTempCSTPIS = '52') or (vTempCSTPIS = '53') or
              (vTempCSTPIS = '54') or (vTempCSTPIS = '55') or
              (vTempCSTPIS = '56') or (vTempCSTPIS = '03') then
            begin
              vBasePIS := vQrTemp2.FieldByName('total').AsFloat +
                vQrTemp2.FieldByName('rat_acres').AsFloat -
                vQrTemp2.FieldByName('rat_desc').AsFloat;

              if (vTempCSTPIS = '03') then
              begin
                vBasePIS := 0;
                vValorPIS := StrToFloatFormat(vQrTemp2.FieldByName('quantidade').AsFloat * vTempAliqPIS, 2);
              end
              else
                vValorPIS := StrToFloatFormat( vBasePIS * vTempAliqPIS / 100 , 2);
            end;

          vValorCOFINS := 0;
          vBaseCOFINS := 0;
          if vTempAliqCOFINS > 0 then
            if (vTempCSTCOFINS = '01') or (vTempCSTCOFINS = '02') or
              (vTempCSTCOFINS = '50') or (vTempCSTCOFINS = '51') or
              (vTempCSTCOFINS = '52') or (vTempCSTCOFINS = '53') or
              (vTempCSTCOFINS = '54') or (vTempCSTCOFINS = '55') or
              (vTempCSTCOFINS = '56') or (vTempCSTCOFINS = '03') then
            begin
              vBaseCOFINS := vQrTemp2.FieldByName('total').AsFloat +
                vQrTemp2.FieldByName('rat_acres').AsFloat -
                vQrTemp2.FieldByName('rat_desc').AsFloat;

              if (vTempCSTCOFINS = '03') then
              begin
                vBaseCOFINS := 0;
                vValorCOFINS := StrToFloatFormat(vQrTemp2.FieldByName('quantidade').AsFloat * vTempAliqCOFINS, 2);
              end
              else
                vValorCOFINS := StrToFloatFormat( vBaseCOFINS * vTempAliqCOFINS / 100 , 2);
            end;

          vQrExec.Close;
          vQrExec.SQL.Text :=
            'update cupom2 cp2 set cp2.valor_pis = :valor_pis, cp2.valor_cofins = :valor_cofins,' +
            ' base_pis = :base_pis, base_cofins = :base_cofins,' +
            ' cst_pis = :cst_pis, cst_cofins = :cst_cofins,' +
            ' aliq_pis = :aliq_pis, aliq_cofins = :aliq_cofins' +
            ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
            ' and cp2.cod_empresa = :cod_empresa and cp2.registro = :registro' +
            ' and cp2.nitem = :nitem and cp2.cupom = :cupom and cp2.ordem = :ordem';
          vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
          vQrExec.ParamByName('nserie').AsString := pNSerieECF;
          vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vQrExec.ParamByName('registro').AsInteger := vQrTemp2.FieldByName('registro').AsInteger;
          vQrExec.ParamByName('nitem').AsInteger := vQrTemp2.FieldByName('nitem').AsInteger;
          vQrExec.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('cupom').AsInteger;
          vQrExec.ParamByName('ordem').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
          vQrExec.ParamByName('valor_pis').AsCurrency := vValorPIS;
          vQrExec.ParamByName('valor_cofins').AsCurrency := vValorCOFINS;
          
          vQrExec.ParamByName('base_pis').AsCurrency := vBasePIS;
          vQrExec.ParamByName('base_cofins').AsCurrency := vBaseCOFINS;
          vQrExec.ParamByName('aliq_pis').AsCurrency := vTempAliqPIS;
          vQrExec.ParamByName('aliq_cofins').AsCurrency := vTempAliqCOFINS;
          vQrExec.ParamByName('cst_pis').AsString := vTempCSTPIS;
          vQrExec.ParamByName('cst_cofins').AsString := vTempCSTCOFINS;
          vQrExec.Prepare;
          vQrExec.ExecSQL;

          vValorAcumuladoPIS := vValorAcumuladoPIS + vValorPIS;
          vValorAcumuladoCOFINS := vValorAcumuladoCOFINS + vValorCOFINS;

          vQrTemp2.Next;
        end;

        vQrExec.Close;
        vQrExec.SQL.Text :=
          'update cupom2 cp2 set cp2.valor_pis = 0, cp2.valor_cofins = 0,' +
          ' base_pis = 0, base_cofins = 0, cst_pis = ''49'', cst_cofins = ''49'',' +
          ' aliq_pis = 0, aliq_cofins = 0' +
          ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
          ' and cp2.cod_empresa = :cod_empresa and cp2.cupom = :cupom and cp2.ordem = :ordem'+
          ' and ((cp2.valor_pis is null) or (cp2.valor_cofins is null)) ';
        vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
        vQrExec.ParamByName('nserie').AsString := pNSerieECF;
        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrExec.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('cupom').AsInteger;
        vQrExec.ParamByName('ordem').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
        vQrExec.Prepare;
        vQrExec.ExecSQL;

        vQrExec.Close;
        vQrExec.SQL.Text :=
          'update cupom cp set cp.valor_pis = :valor_pis, cp.valor_cofins = :valor_cofins' +
          ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
          ' and cp.cod_empresa = :cod_empresa and cp.registro = :registro and cp.cupom = :cupom';
        vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
        vQrExec.ParamByName('nserie').AsString := pNSerieECF;
        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrExec.ParamByName('registro').AsInteger := vQrTemp.FieldByName('registro').AsInteger;
        vQrExec.ParamByName('cupom').AsInteger := vQrTemp.FieldByName('cupom').AsInteger;
        vQrExec.ParamByName('valor_pis').AsCurrency := vValorAcumuladoPIS;
        vQrExec.ParamByName('valor_cofins').AsCurrency := vValorAcumuladoCOFINS;
        vQrExec.Prepare;
        vQrExec.ExecSQL;

        vQrTemp.Next;
        FProgressBar2.Position := FProgressBar2.Position + 1;

        if (FProgressBar2.Position mod 50) = 0 then
          if vTransacaoAux.InTransaction then
          begin
            vTransacaoAux.Commit;
            if not vTransacaoAux.InTransaction then
              vTransacaoAux.StartTransaction;
          end;

        Application.ProcessMessages;
      end;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;

    vQrTemp.Free;
    vQrTemp := nil;

    vQrTemp2.Free;
    vQrTemp2 := nil;
    
    vQrTemp3.Free;
    vQrTemp3 := nil;
  end;
end;

procedure TSpedHw.verificaPISCOFINSNFSerieD;
var
  vQrTemp, vQrExec: TIBQuery;
  vValorPIS, vValorCOFINS, vBasePIS, vBaseCOFINS, vValorAcumuladoPIS, vValorAcumuladoCOFINS: Currency;
  vAliqPIS, vAliqCOFINS:Double;
  vCST_PIS, vCST_COFINS: string;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrExec.SQL.Text :=
      'update nf_serie_d_itens ndi set ndi.cst_pis = :cst_pis, ndi.cst_cofins = :cst_cofins,' +
      ' ndi.base_pis = :base_pis, ndi.base_cofins = :base_cofins, ndi.valor_pis = :valor_pis,' +
      ' ndi.valor_cofins = :valor_cofins, ndi.aliq_pis = :aliq_pis, ndi.aliq_cofins = :aliq_cofins' +
      ' where ndi.numeronota = :numeronota and ndi.nitem = :nitem and' +
      ' ndi.grupo_prod = :grupo_prod and ndi.cod_prod = :cod_prod and' +
      ' ndi.cod_empresa = :cod_empresa';

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

//    vQrTemp2 := TIBQuery.Create(Application);
//    vQrTemp2.Database := vConexao;
//    vQrTemp2.Transaction := vTransacao;
    try
      FLabelStatus.Caption := 'Definindo - PIS/COFINS - Nota Fiscal modelo 02';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrTemp.Close;
      vQrTemp.SQL.Text :=
        'select ndi.numeronota, ndi.nitem, ndi.grupo_prod, ndi.cod_prod, ndi.cod_empresa,' +
        ' ndi.quantid_item, ndi.vl_tot_item, p.cst_pis, p.cst_cofins, p.isento_pis,' +
        ' p.aliq_pis_diferenciada, p.aliq_cofins_diferenciada'+
        ' from nf_serie_d nd' +
        ' inner join nf_serie_d_itens ndi on ndi.numeronota = nd.numeronota and' +
        ' ndi.cod_empresa = nd.cod_empresa' +
        ' left join produtos p on p.grupo_prod = ndi.grupo_prod and' +
        ' p.cod_prod = ndi.cod_prod and p.cod_empresa = ndi.cod_empresa' +
        ' where nd.dataemissao >= :dataIni and nd.dataemissao <=' +
        ' :dataFim and nd.cod_empresa = :cod_empresa  and' +
        ' ((ndi.cst_pis = '''') or (ndi.cst_pis is null) or (ndi.cst_cofins = '''') or' +
        ' (ndi.cst_cofins is null))'; //and cp.status_cp <> ''CANCELADO''';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;

      vQrTemp.FetchAll;

      FProgressBar2.Min := 0;
      FProgressBar2.Max := vQrTemp.RecordCount;
      FProgressBar2.Position := 1;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        vValorPIS := 0;
        vValorCOFINS := 0;
        vBasePIS := 0;
        vBaseCOFINS := 0;
        vAliqPIS := 0;
        vAliqCOFINS := 0;
        vCST_PIS := '';
        vCST_COFINS := '';
        Application.ProcessMessages;
        if (Pos('SIMPLES', FRegime) > 0) then
        begin
          vCST_PIS := '99';
          vCST_COFINS := '99';
        end
//        else if (vQrTemp.FieldByName('isento_pis').AsString = 'S')  then
//        begin
//          vCST_PIS := '04';
//          vCST_COFINS := '04';
//        end
        else if (Trim(vQrTemp.FieldByName('cst_pis').AsString) = '01') or
            (Trim(vQrTemp.FieldByName('cst_pis').AsString) = '') then
        begin                        
          vCST_PIS := '01';
          vCST_COFINS := '01';
          vAliqPIS := FAliqPIS;
          vAliqCOFINS := FAliqCOFINS;
        end
        else if (Trim(vQrTemp.FieldByName('cst_pis').AsString) <> '') then
        begin
          vCST_PIS := Trim(vQrTemp.FieldByName('cst_pis').AsString);
          vCST_COFINS := Trim(vQrTemp.FieldByName('cst_cofins').AsString);
          vAliqPIS := vQrTemp.FieldByName('aliq_pis_diferenciada').AsFloat;
          vAliqCOFINS := vQrTemp.FieldByName('aliq_cofins_diferenciada').AsFloat;
        end
        else
        begin
          vCST_PIS := '01';
          vCST_COFINS := '01';
          vAliqPIS := FAliqPIS;
          vAliqCOFINS := FAliqCOFINS;
        end;

        vValorPIS := 0;
        vBasePIS := 0;
        vValorCOFINS := 0;
        vBaseCOFINS := 0;
        if vAliqPIS > 0 then
          if (vCST_PIS = '01') or (vCST_PIS = '02') or (vCST_PIS = '05') or
            (vCST_PIS = '50') or (vCST_PIS = '51') or
            (vCST_PIS = '52') or (vCST_PIS = '53') or
            (vCST_PIS = '54') or (vCST_PIS = '55') or
            (vCST_PIS = '56') or (vCST_PIS = '03') then
          begin
            vBasePIS := StrToFloatFormat( vQrTemp.FieldByName('vl_tot_item').AsFloat,2);
            vBaseCOFINS := StrToFloatFormat( vQrTemp.FieldByName('vl_tot_item').AsFloat,2);

            if (vCST_PIS = '03') then
            begin
              vBasePIS := 0;
              vValorPIS := StrToFloatFormat(vQrTemp.FieldByName('quantid_item').AsFloat * vAliqPIS, 2);
              vBaseCOFINS := 0;
              vValorCOFINS := StrToFloatFormat(vQrTemp.FieldByName('quantid_item').AsFloat * vAliqCOFINS, 2);
            end
            else
            begin
              vValorPIS := StrToFloatFormat( vBasePIS * vAliqPIS / 100 , 2);
              vValorCOFINS := StrToFloatFormat( vBaseCOFINS * vAliqCOFINS / 100 , 2);
            end;
          end;

        vQrExec.close;
        vQrExec.ParamByName('cst_pis').AsString := vCST_PIS;
        vQrExec.ParamByName('cst_cofins').AsString := vCST_COFINS;
        vQrExec.ParamByName('base_pis').AsCurrency := vBasePIS;
        vQrExec.ParamByName('base_cofins').AsCurrency := vBaseCOFINS;
        vQrExec.ParamByName('valor_pis').AsCurrency := vValorPIS;
        vQrExec.ParamByName('valor_cofins').AsCurrency := vValorCOFINS;
        vQrExec.ParamByName('aliq_pis').AsFloat := vAliqPIS;
        vQrExec.ParamByName('aliq_cofins').AsFloat := vAliqCOFINS;
        vQrExec.ParamByName('numeronota').AsInteger := vQrTemp.FieldByName('numeronota').AsInteger;
        vQrExec.ParamByName('nitem').AsInteger := vQrTemp.FieldByName('nitem').AsInteger;
        vQrExec.ParamByName('grupo_prod').AsInteger := vQrTemp.FieldByName('grupo_prod').AsInteger;
        vQrExec.ParamByName('cod_prod').AsString := vQrTemp.FieldByName('cod_prod').AsString;
        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrExec.ExecSQL;

        vQrTemp.Next;
        FProgressBar2.Position := FProgressBar2.Position + 1;
        Application.ProcessMessages;
      end;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;

    vQrTemp.Free;
    vQrTemp := nil;

//    vQrTemp2.Free;
//    vQrTemp2 := nil;
  end;
end;

procedure TSpedHw.verificaPISCOFINSNotaFiscal;
var
  vQrTemp, vQrTemp2, vQrTemp3, vQrExec, vQrExec2: TIBQuery;
  vTempCSTPIS, vTempCSTCOFINS, vSqlUpdateItem: String;
  vTempAliqPIS, vTempAliqCOFINS: Double;
  vValorCOFINSTotal, vValorPISTotal: Currency;
  vTributadoPorQtde, vOK: Boolean;

  procedure setCFOPDevolucao;
  begin
    vQrTemp.Close;
    vQrTemp.SQL.Text := 'select codigo_nop from nat_op where devolucao = ''S''';
    vQrTemp.Open;
    if not vQrTemp.IsEmpty then
    begin
      cfopDevolucaoCompra := '';
      cfopDevolucaoVenda := '';

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        if vQrTemp.FieldByName('codigo_nop').AsFloat > 3000 then
          cfopDevolucaoVenda := cfopDevolucaoVenda + IntToStr(Trunc(vQrTemp.FieldByName('codigo_nop').AsFloat)) + '|'
        else
          cfopDevolucaoCompra :=  cfopDevolucaoCompra + IntToStr(Trunc(vQrTemp.FieldByName('codigo_nop').AsFloat)) + '|';
        vQrTemp.Next;
      end;
    end;
  end;

begin
  try

    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrExec2 := TIBQuery.Create(Application);
    vQrExec2.Database := vConexao;
    vQrExec2.Transaction := vTransacaoAux;

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    vQrTemp2 := TIBQuery.Create(Application);
    vQrTemp2.Database := vConexao;
    vQrTemp2.Transaction := vTransacao;

    vQrTemp3 := TIBQuery.Create(Application);
    vQrTemp3.Database := vConexao;
    vQrTemp3.Transaction := vTransacao;

    setCFOPDevolucao;

    vQrExec.Close;
    vQrExec.SQL.Text := 'update notafiscal_item set nat_rec = ''404''' +
      ' where tipo_item = ''V'' and cst_pis = ''05'' and ((nat_rec is null) or (nat_rec = ''''))';
    vQrExec.ExecSQL;

    vQrExec.Close;
    vQrExec.SQL.Text := 'update notafiscal nf set nf.valor_pis = :valor_pis,' +
      ' nf.valor_cofins = :valor_cofins, nf.CONF_PISCOFINS = :CONF_PISCOFINS ' +
      ' where nf.cod_nf = :cod_nf and nf.cod_empresa = :cod_empresa';

    vSqlUpdateItem := 'update notafiscal_item nfi set nfi.base_pis = :base_pis,' +
      ' nfi.base_cofins = :base_cofins, nfi.aliq_pis = :aliq_pis, nfi.aliq_cofins = :aliq_cofins,' +
      ' nfi.aliq_pis_quant = :aliq_pis_quant, nfi.aliq_cofins_quant = :aliq_cofins_quant,' +
      ' nfi.quant_bc_pis = :quant_bc_pis, nfi.quant_bc_cofins = :quant_bc_cofins,' +
      ' nfi.valor_pis = :valor_pis, nfi.valor_cofins = :valor_cofins,'+
      ' nfi.cst_pis = :cst_pis, nfi.cst_cofins = :cst_cofins'+
      ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa and' +
      ' nfi.nitem = :nitem';

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    try
      FLabelStatus.Caption := 'Definindo PIS/COFINS - Nota Fiscal';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select nf.cod_nf, nf.natureza_nf, nf.tipo_nf, nf.FRETE_F_NFE, NF.DEVOLUCAO from notafiscal nf'+
        ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim' +
        ' and nf.cod_empresa = :cod_empresa and (nf.CONF_PISCOFINS is null or nf.CONF_PISCOFINS <> ''C'')'+
        ' and (nf.status <> ''Cancelada'' and nf.status <> ''Aberta'')';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;
      //http://download.microsoft.com/download/F/B/9/FB9F0DF8-4CE2-416D-9D08-BABC7EA48F85/Windows6.0-KB948465-X86.exe

      vQrTemp2.Close;
      vQrTemp2.SQL.Text :=
        'select nfi.cod_nf, nfi.nitem, nfi.grupo_prod, nfi.cod_prod,  nfi.cod_servico, nfi.tipo_item,' +
        ' nfi.valor_total, nfi.rateio_desconto, nfi.base_pis, nfi.base_cofins, nfi.aliq_pis,' +
        ' nfi.aliq_cofins, nfi.aliq_pis_quant, nfi.aliq_cofins_quant, nfi.quantidade,' +
        ' nfi.quant_bc_pis, nfi.quant_bc_cofins, nfi.rateio_seguro, nfi.rateio_outdesp, nfi.rateio_frete,'+
        ' nfi.ncm, nfi.codigo_nop, nfi.valor_ipi, nfi.valor_icmsub'+
        ' from notafiscal_item nfi' +
        ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa';

      vQrTemp.FetchAll;

      FProgressBar2.Min := 0;
      FProgressBar2.Max := vQrTemp.RecordCount;
      FProgressBar2.Position := 1;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin

        vQrTemp2.Close;
        vQrTemp2.ParamByName('cod_nf').AsInteger := vQrTemp.FieldByName('cod_nf').AsInteger;
        vQrTemp2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrTemp2.Open;

        vValorPISTotal:=0;
        vValorCOFINSTotal:=0;

        vQrTemp2.First;
        while not vQrTemp2.Eof do
        begin
          vTempAliqPIS := 0;
          vTempAliqCOFINS := 0;
          vTempCSTPIS := '';
          vTempCSTCOFINS := '';

          if (FRegime = 'SIMPLES') then
          begin
//            vTempCSTPIS := '99';
//            vTempCSTCOFINS := '99';
          end
          else
          begin
            if (Trim(FIncidTribPISCOFINS) = '') then
            begin
              Application.MessageBox(
                'Indicador de Incidência Tributária do PIS/COFINS não definida no Cadastro da Empresa',
                'Atenção', 0 + 64);
              Exit;
            end;
//            else if (vQrTemp.FieldByName('natureza_nf').AsString = 'E') and
//              (Trim(FIncidTribPISCOFINS) = '2') then
//            begin
//              vTempCSTPIS := '99';
//              vTempCSTCOFINS := '99';
//            end;
          end;

          vTributadoPorQtde := False;
          if (vQrTemp.FieldByName('natureza_nf').AsString = 'S') and (vTempCSTPIS = '') then
          begin
            //else
            if vQrTemp2.FieldByName('tipo_item').AsString = 'P' then
            begin
              vQrTemp3.Close;
              vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
                ' ALIQ_PIS_DIFERENCIADA, ALIQ_COFINS_DIFERENCIADA  from produtos' +
                ' where grupo_prod = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger)+
                ' and cod_prod = ' + QuotedStr(Trim(vQrTemp2.FieldByName('cod_prod').AsString)) +
                ' and cod_empresa = ' + FCodEmpresa;
              vQrTemp3.Open;
//              if Trim(vQrTemp3.FieldByName('isento_pis').AsString) = 'S' then
//              begin
//                vTempCSTPIS := '04';
//                vTempCSTCOFINS := '04';
//              end
//              else
              begin
                //PIS
                if (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '01') or
                  (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '') then
                begin
                  vTempCSTPIS := '01';
                  vTempAliqPIS := FAliqPIS;
                end
                else
                begin
                  vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString);
                  if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') then
                    vTempAliqPIS := vQrTemp3.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat
                  else if (vTempCSTPIS = '05') then
                  begin
                    vTempCSTPIS := '01';
                    vTempAliqPIS := FAliqPIS;
                  end;
                end;
                //COFINS
                if (Trim(vQrTemp3.FieldByName('cst_cofins').AsString) = '01') or
                  (Trim(vQrTemp3.FieldByName('cst_cofins').AsString) = '') then
                begin
                  vTempCSTCOFINS := '01';
                  vTempAliqCOFINS := FAliqCOFINS;
                end
                else
                begin
                  vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString);
                  if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') then
                    vTempAliqCOFINS := vQrTemp3.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat
                  else if (vTempCSTCOFINS = '05') then
                  begin
                    vTempCSTCOFINS := '01';
                    vTempAliqCOFINS := FAliqCOFINS;
                  end;
                end;
              end;
            end  //produtos
            else if vQrTemp2.FieldByName('tipo_item').AsString = 'S' then
            begin
              vQrTemp3.Close;
              vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
                ' 0 aliq_pis, 0 aliq_cofins  from tipo_servico' +
                ' where cod_servico = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger);
              vQrTemp3.Open;
//              if Trim(vQrTemp3.FieldByName('isento_pis').AsString) = 'S' then
//              begin
//                vTempCSTPIS := '04';
//                vTempCSTCOFINS := '04';
//              end
//              else
              begin
                //PIS
                if (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '01') or
                  (Trim(vQrTemp3.FieldByName('cst_pis').AsString) = '') then
                begin
                  vTempCSTPIS := '01';
                  vTempAliqPIS := FAliqPIS;
                end
                else
                begin
                  vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString);
                  if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or (vTempCSTPIS = '05') then
                  begin
                    vTempCSTPIS := '01';
                    vTempAliqPIS := FAliqPIS;
                  end;
                end;
                //COFINS
                if (Trim(vQrTemp3.FieldByName('cst_cofins').AsString) = '01') or
                  (Trim(vQrTemp3.FieldByName('cst_cofins').AsString) = '') then
                begin
                  vTempCSTCOFINS := '01';
                  vTempAliqCOFINS := FAliqCOFINS;
                end
                else
                begin
                  vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString);
                  if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') or (vTempCSTCOFINS = '05') then
                  begin
                    vTempCSTCOFINS := '01';
                    vTempAliqCOFINS := FAliqCOFINS;
                  end;
                end;
              end;
            end
            else if vQrTemp2.FieldByName('tipo_item').AsString = 'V' then
            begin
              vTempCSTPIS := '05';
              vTempCSTCOFINS := '05';
              vTempAliqPIS := 0;
              vTempAliqCOFINS := 0;
            end
//            else if vQrTemp2.FieldByName('tipo_item').AsString = 'D' then
//            begin
//              vTempCSTPIS := '07';
//              vTempCSTCOFINS := '07';
//              vTempAliqPIS := 0;
//              vTempAliqCOFINS := 0;
//            end
            else
            begin
              vTempCSTPIS := '01';
              vTempCSTCOFINS := '01';
              vTempAliqPIS := FAliqPIS;
              vTempAliqCOFINS := FAliqCOFINS;
            end;

            vTributadoPorQtde := (vTempCSTPIS = '03');

//            if vQrTemp.FieldByName('devolucao').AsString = 'SIM' then
            if FRegime = 'LUCRO REAL' then
              if cfopDeDevolucao( Trunc(vQrTemp2.FieldByName('codigo_nop').AsFloat), vQrTemp.FieldByName('natureza_nf').AsString) then
              begin
                vTempCSTPIS := '49';
                vTempCSTCOFINS := '49';
              end
          end
          else if (vTempCSTPIS = '') then //Entrada
          begin
            if vQrTemp2.FieldByName('tipo_item').AsString = 'P' then
            begin
              vQrTemp3.Close;
              vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
                ' ALIQ_PIS_DIFERENCIADA, ALIQ_COFINS_DIFERENCIADA, cst_pis_ent, cst_cofins_ent,' +
                ' ALIQ_CRED_PIS, ALIQ_CRED_COFINS from produtos' +
                ' where grupo_prod = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger)+
                ' and cod_prod = ' + QuotedStr(Trim(vQrTemp2.FieldByName('cod_prod').AsString)) +
                ' and cod_empresa = ' + FCodEmpresa;
              vQrTemp3.Open;
//              if Trim(vQrTemp3.FieldByName('isento_pis').AsString) = 'S' then
//              begin
//                vTempCSTPIS := '73';
//                vTempCSTCOFINS := '73';
//              end
//              else
              begin
                vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis_ent').AsString);
                vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins_ent').AsString);
              end;

              if vQrTemp3.FieldByName('ALIQ_CRED_PIS').AsFloat > 0 then
                vTempAliqPIS := vQrTemp3.FieldByName('ALIQ_CRED_PIS').AsFloat;

              if vQrTemp3.FieldByName('ALIQ_CRED_COFINS').AsFloat > 0 then
                vTempAliqCOFINS := vQrTemp3.FieldByName('ALIQ_CRED_COFINS').AsFloat;

            end
            else if vQrTemp2.FieldByName('tipo_item').AsString = 'S' then
            begin
              vQrTemp3.Close;
              vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
                ' 0 aliq_pis, 0 aliq_cofins, cst_pis_ent, cst_cofins_ent from tipo_servico' +
                ' where cod_servico = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger);
              vQrTemp3.Open;
//              if Trim(vQrTemp3.FieldByName('isento_pis').AsString) = 'S' then
//              begin
//                vTempCSTPIS := '73';
//                vTempCSTCOFINS := '73';
//              end
//              else
              begin
                vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis_ent').AsString);
                vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins_ent').AsString);
//                vTempAliqPIS := FAliqPIS;
//                vTempAliqCOFINS := FAliqCOFINS;
              end;
            end
            else if vQrTemp2.FieldByName('tipo_item').AsString = 'V' then
            begin
              vTempCSTPIS := '75';
              vTempCSTCOFINS := '75';
            end
//            else if vQrTemp2.FieldByName('tipo_item').AsString = 'D' then
//            begin
//              vTempCSTPIS := '71';
//              vTempCSTCOFINS := '71';
//            end
            else
            begin
              vTempCSTPIS := '50';
              vTempCSTCOFINS := '50';
              vTempAliqPIS := FAliqPIS;
              vTempAliqCOFINS := FAliqCOFINS;
            end;

            if (vTempCSTPIS = '70') or (vTempCSTPIS = '71') or (vTempCSTPIS = '72') or
            (vTempCSTPIS = '73') or (vTempCSTPIS = '74') then
              vTempAliqPIS := 0
            else if (vTempCSTPIS = '50') or (vTempCSTPIS = '51') or (vTempCSTPIS = '52') or
              (vTempCSTPIS = '53') or (vTempCSTPIS = '54') or (vTempCSTPIS = '55') or
              (vTempCSTPIS = '56') or (vTempCSTPIS = '') or (vTempCSTPIS = '60') or (vTempCSTPIS = '61') or
              (vTempCSTPIS = '62') or (vTempCSTPIS = '63') or (vTempCSTPIS = '64') or (vTempCSTPIS = '65') or
              (vTempCSTPIS = '66') then
            begin
              if (vTempCSTPIS = '') then
                vTempCSTPIS := '50';
              if vTempAliqPIS = 0 then
                vTempAliqPIS := FAliqPIS;
            end;

            if (vTempCSTCOFINS = '70') or (vTempCSTCOFINS = '71') or (vTempCSTCOFINS = '72') or
            (vTempCSTCOFINS = '73') or (vTempCSTCOFINS = '74') then
              vTempAliqCOFINS := 0
            else if (vTempCSTCOFINS = '50') or (vTempCSTCOFINS = '51') or (vTempCSTCOFINS = '52') or
              (vTempCSTCOFINS = '53') or (vTempCSTCOFINS = '54') or (vTempCSTCOFINS = '55') or
              (vTempCSTCOFINS = '56') or (vTempCSTCOFINS = '') or (vTempCSTCOFINS = '60') or
              (vTempCSTCOFINS = '61') or (vTempCSTCOFINS = '62') or (vTempCSTCOFINS = '63') or
              (vTempCSTCOFINS = '64') or (vTempCSTCOFINS = '65') or (vTempCSTCOFINS = '66') then
            begin
              if (vTempCSTCOFINS = '') then
                vTempCSTCOFINS := '50';
              if vTempAliqCOFINS = 0 then
                vTempAliqCOFINS := FAliqCOFINS;
            end;
            
            //if vQrTemp.FieldByName('devolucao').AsString = 'SIM' then
            if FRegime = 'LUCRO PRESUMIDO' then
              if cfopDeDevolucao( Trunc(vQrTemp2.FieldByName('codigo_nop').AsFloat), vQrTemp.FieldByName('natureza_nf').AsString) then
              begin
                vTempCSTPIS := '99';
                vTempCSTCOFINS := '99';
              end;
          end;

          vQrExec2.Close;
          vQrExec2.SQL.Text := vSqlUpdateItem;
          vQrExec2.ParamByName('aliq_pis_quant').AsFloat := 0;
          vQrExec2.ParamByName('aliq_cofins_quant').AsFloat := 0;
          vQrExec2.ParamByName('aliq_pis').AsFloat := 0;
          vQrExec2.ParamByName('aliq_cofins').AsFloat := 0;
          vQrExec2.ParamByName('base_pis').AsFloat := 0;
          vQrExec2.ParamByName('base_cofins').AsFloat := 0;
          vQrExec2.ParamByName('valor_pis').AsFloat := 0;
          vQrExec2.ParamByName('valor_cofins').AsFloat := 0;
          vQrExec2.ParamByName('quant_bc_pis').AsFloat := 0;
          vQrExec2.ParamByName('quant_bc_cofins').AsFloat := 0;

//          if (vTempCSTPIS = '01') or (vTempCSTPIS = '02') or
//            (vTempCSTPIS = '50') or (vTempCSTPIS = '51') or
//            (vTempCSTPIS = '52') or (vTempCSTPIS = '53') or
//            (vTempCSTPIS = '54') or (vTempCSTPIS = '55') or
//            (vTempCSTPIS = '56') then
          if (not vTributadoPorQtde) and (vTempAliqPIS > 0) then
          begin
            vQrExec2.ParamByName('base_pis').AsFloat :=
              (vQrTemp2.FieldByName('valor_total').AsFloat +
              vQrTemp2.FieldByName('rateio_seguro').AsFloat +
              vQrTemp2.FieldByName('rateio_outdesp').AsFloat) -
              vQrTemp2.FieldByName('rateio_desconto').AsFloat;
            if (vQrTemp.FieldByName('FRETE_F_NFE').AsString <> 'S') then
              vQrExec2.ParamByName('base_pis').AsFloat :=
                vQrExec2.ParamByName('base_pis').AsFloat +
                vQrTemp2.FieldByName('rateio_frete').AsFloat ;

            if (vQrTemp.FieldByName('natureza_nf').AsString = 'E') then
              vQrExec2.ParamByName('base_pis').AsFloat :=
                vQrExec2.ParamByName('base_pis').AsFloat +
                vQrTemp2.FieldByName('valor_ipi').AsFloat; // + vQrTemp2.FieldByName('valor_icmsub').AsFloat;
            // De acordo a solução abaixo o ICMS ST não faz parte do crédito PIS e COFINS para Não cumulativo
            ///  SOLUÇÃO DE CONSULTA Nº -12, DE 22 DE FEVEREIRO DE 2012
            ///                 DOU de 24-02-2012

            vQrExec2.ParamByName('base_pis').AsFloat := StrToFloatFormat(
              vQrExec2.ParamByName('base_pis').AsFloat, 2);

          end
          else if (vTributadoPorQtde) then
          begin
            vQrExec2.ParamByName('quant_bc_pis').AsFloat :=
              vQrTemp2.FieldByName('quantidade').AsFloat;
            vQrExec2.ParamByName('aliq_pis_quant').AsFloat :=
              vTempAliqPIS;
          end;

//          if (vTempCSTCOFINS = '01') or (vTempCSTCOFINS = '02') or
//            (vTempCSTCOFINS = '50') or (vTempCSTCOFINS = '51') or
//            (vTempCSTCOFINS = '52') or (vTempCSTCOFINS = '53') or
//            (vTempCSTCOFINS = '54') or (vTempCSTCOFINS = '55') or
//            (vTempCSTCOFINS = '56') then
          if (not vTributadoPorQtde) and (vTempAliqPIS > 0) then
          begin
            vQrExec2.ParamByName('base_cofins').AsFloat :=
              (vQrTemp2.FieldByName('valor_total').AsFloat +
              vQrTemp2.FieldByName('rateio_seguro').AsFloat +
              vQrTemp2.FieldByName('rateio_outdesp').AsFloat) -
              vQrTemp2.FieldByName('rateio_desconto').AsFloat;
            if (vQrTemp.FieldByName('FRETE_F_NFE').AsString <> 'S') then
              vQrExec2.ParamByName('base_cofins').AsFloat :=
                vQrExec2.ParamByName('base_cofins').AsFloat +
                vQrTemp2.FieldByName('rateio_frete').AsFloat ;

            if (vQrTemp.FieldByName('natureza_nf').AsString = 'E') then
              vQrExec2.ParamByName('base_cofins').AsFloat :=
                vQrExec2.ParamByName('base_cofins').AsFloat +
                vQrTemp2.FieldByName('valor_ipi').AsFloat; // + vQrTemp2.FieldByName('valor_icmsub').AsFloat;
            /// De acordo a solução abaixo o ICMS ST não faz parte do crédito PIS e COFINS para Não cumulativo
            ///  SOLUÇÃO DE CONSULTA Nº -12, DE 22 DE FEVEREIRO DE 2012
            ///                 DOU de 24-02-2012

            vQrExec2.ParamByName('base_cofins').AsFloat := StrToFloatFormat(
              vQrExec2.ParamByName('base_cofins').AsFloat, 2);
          end
          else if (vTributadoPorQtde) then//and (vTempAliqPIS > 0) then
          begin
            vQrExec2.ParamByName('quant_bc_cofins').AsFloat :=
              vQrTemp2.FieldByName('quantidade').AsFloat;
            vQrExec2.ParamByName('aliq_cofins_quant').AsFloat :=
              vTempAliqCOFINS;
          end;

          if vTempAliqPIS > 0 then
          begin
            if (vTributadoPorQtde) then
            begin
              vQrExec2.ParamByName('valor_pis').AsFloat := StrToFloatFormat(
                vQrExec2.ParamByName('quant_bc_pis').AsFloat * vTempAliqPIS, 2);
              vTempAliqPIS := 0;
            end
            else
              vQrExec2.ParamByName('valor_pis').AsFloat := StrToFloatFormat(
                vQrExec2.ParamByName('base_pis').AsFloat * vTempAliqPIS / 100 , 2);
          end;

          if vTempAliqCOFINS > 0 then
          begin
            if (vTributadoPorQtde) then
            begin
              vQrExec2.ParamByName('valor_cofins').AsFloat := StrToFloatFormat(
                vQrExec2.ParamByName('quant_bc_cofins').AsFloat * vTempAliqCOFINS, 2);
              vTempAliqCOFINS := 0;
            end
            else
              vQrExec2.ParamByName('valor_cofins').AsFloat := StrToFloatFormat(
                vQrExec2.ParamByName('base_cofins').AsFloat * vTempAliqCOFINS / 100 , 2);
          end;
          vQrExec2.ParamByName('aliq_pis').AsFloat := vTempAliqPIS;
          vQrExec2.ParamByName('aliq_cofins').AsFloat := vTempAliqCOFINS;
          vQrExec2.ParamByName('cst_pis').AsString := vTempCSTPIS;
          vQrExec2.ParamByName('cst_cofins').AsString := vTempCSTCOFINS;

          if vQrTemp2.FieldByName('tipo_item').AsString = 'P' then
          begin
            vQrTemp3.close;
            vQrTemp3.SQL.Text := 'select nat_rec from produtos'+
              ' where grupo_prod = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger) +
              ' and cod_prod = ' + QuotedStr(vQrTemp2.FieldByName('cod_prod').AsString) +
              ' and cod_empresa = ' + FCodEmpresa +
              ' and cst_pis = ' + QuotedStr(vTempCSTPIS);
            vQrTemp3.Open;

            if Trim(vQrTemp3.FieldByName('nat_rec').AsString) = '' then
            begin
              vQrTemp3.close;
              vQrTemp3.SQL.Text := 'select nat_rec from nbm'+
                ' where cod_ncm = ' + QuotedStr(vQrTemp2.FieldByName('ncm').AsString) +
                ' and cst_pis = ' + QuotedStr(vTempCSTPIS);
              vQrTemp3.Open;
            end;

            if Trim(vQrTemp3.FieldByName('nat_rec').AsString) <> '' then
              vQrExec2.SQL.Text := StringReplace( vQrExec2.SQL.Text, 'nfi.cst_cofins = :cst_cofins',
                'nfi.cst_cofins = :cst_cofins, nat_rec = ' + QuotedStr(vQrTemp3.FieldByName('nat_rec').AsString), [rfReplaceAll, rfIgnoreCase]);
          end
          else
          begin

            vOK := False;
            if vQrTemp2.FieldByName('tipo_item').AsString = 'S' then
            begin
              vQrTemp3.Close;
              vQrTemp3.SQL.Text := 'select t.nat_rec from tipo_servico t' +
                ' where t.cod_servico = ' + IntToStr(vQrTemp2.FieldByName('cod_servico').AsInteger);
              vQrTemp3.Open;
              vOK := Trim(vQrTemp3.FieldByName('nat_rec').AsString) <> '';
            end;
            if not vOK then
            begin
              vQrTemp3.close;
              vQrTemp3.SQL.Text := 'select nat_rec from nbm'+
                ' where cod_ncm = ' + QuotedStr(vQrTemp2.FieldByName('ncm').AsString) +
                ' and cst_pis = ' + QuotedStr(vTempCSTPIS);
              vQrTemp3.Open;
            end;
            if (vQrTemp2.FieldByName('tipo_item').AsString = 'V') and (vTempCSTPIS = '05') then
              vQrExec2.SQL.Text := StringReplace( vQrExec2.SQL.Text, 'nfi.cst_cofins = :cst_cofins',
                'nfi.cst_cofins = :cst_cofins, nat_rec = ''404''', [rfReplaceAll, rfIgnoreCase])
            else
              vQrExec2.SQL.Text := StringReplace( vQrExec2.SQL.Text, 'nfi.cst_cofins = :cst_cofins',
                'nfi.cst_cofins = :cst_cofins, nat_rec = ' + QuotedStr(vQrTemp3.FieldByName('nat_rec').AsString), [rfReplaceAll, rfIgnoreCase]);
//            if Trim(vQrTemp3.FieldByName('nat_rec').AsString) <> '' then
//            begin
//              vQrExec2.SQL.Text := StringReplace( vQrExec2.SQL.Text, 'nfi.cst_cofins = :cst_cofins',
//                'nfi.cst_cofins = :cst_cofins, nat_rec = ' + QuotedStr(vQrTemp3.FieldByName('nat_rec').AsString), [rfReplaceAll, rfIgnoreCase]);
//            end
//            else if (vQrTemp2.FieldByName('tipo_item').AsString = 'V') and (vTempCSTPIS = '05') then
//              vQrExec2.SQL.Text := StringReplace( vQrExec2.SQL.Text, 'nfi.cst_cofins = :cst_cofins',
//                'nfi.cst_cofins = :cst_cofins, nat_rec = ''404''', [rfReplaceAll, rfIgnoreCase]);
          end;

          vValorPISTotal := vValorPISTotal + vQrExec2.ParamByName('valor_pis').AsFloat;
          vValorCOFINSTotal := vValorCOFINSTotal + vQrExec2.ParamByName('valor_cofins').AsFloat;


          vQrExec2.ParamByName('cod_nf').AsInteger := vQrTemp2.FieldByName('cod_nf').AsInteger;
          vQrExec2.ParamByName('nitem').AsInteger := vQrTemp2.FieldByName('nitem').AsInteger;
          vQrExec2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vQrExec2.ExecSQL;
          vQrTemp2.Next;
        end;

        vQrExec.Close;
        vQrExec.ParamByName('cod_nf').AsInteger := vQrTemp.FieldByName('cod_nf').AsInteger;
        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrExec.ParamByName('CONF_PISCOFINS').AsString := 'C';
        vQrExec.ParamByName('valor_pis').AsFloat := vValorPISTotal;
        vQrExec.ParamByName('valor_cofins').AsFloat := vValorCOFINSTotal;
        vQrExec.ExecSQL;

        vQrTemp.Next;
        FProgressBar2.Position := FProgressBar2.Position + 1;
        Application.ProcessMessages;
      end;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except
      on e: exception do
      begin
        if vTransacaoAux.InTransaction then
          vTransacaoAux.Rollback;
        Application.MessageBox(pchar('Erro ao recalcular dados da NF. Erro: ' + e.Message), 'Atenção', 0 + 64 );
      end;
    end;

  finally
    vQrExec.Free;
    vQrExec := nil;
    vQrExec2.Free;
    vQrExec2 := nil;

    vQrTemp.Free;
    vQrTemp := nil;
    vQrTemp2.Free;
    vQrTemp2 := nil;
    vQrTemp3.Free;
    vQrTemp3 := nil;

  end;
end;

procedure TSpedHw.verificaPISCOFINSServicoTransporte;
var
  vQrTemp, vQrExec: TIBQuery;
  vValorPIS, vValorCOFINS, vBasePIS, vBaseCOFINS, vValorAcumuladoPIS, vValorAcumuladoCOFINS: Currency;
  vAliqPIS, vAliqCOFINS:Double;
  vCST_PIS, vCST_COFINS: string;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    try
      FLabelStatus.Caption := 'Definindo PIS/COFINS - Conhecimento de Transporte';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrTemp.Close;
      vQrTemp.SQL.Text :=
        'select COD_SERV_TRANSP, VALOR_TOTAL from SERVICO_TRANSPORTE st' +
        ' where st.DATA_LANCAMENTO >= :dataIni and st.DATA_LANCAMENTO <= :dataFim and st.cod_empresa = :cod_empresa';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;
      vQrTemp.FetchAll;

      FProgressBar2.Min := 0;
      FProgressBar2.Max := vQrTemp.RecordCount;
      FProgressBar2.Position := 1;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin

        vValorPIS := 0;
        vValorCOFINS := 0;
        vBasePIS := 0;
        vBaseCOFINS := 0;
        vAliqPIS := 0;
        vAliqCOFINS := 0;
        vCST_PIS := '';
        vCST_COFINS := '';

        Application.ProcessMessages;
        if (Pos('SIMPLES', FRegime) > 0) then
        begin
          vCST_PIS := '99';
          vCST_COFINS := '99';
        end;
        if (vCST_PIS = '' ) then
        begin
          vAliqPIS := FAliqPIS;
          vAliqCOFINS := FAliqCOFINS;
          vBasePIS := StrToFloatFormat( vQrTemp.FieldByName('VALOR_TOTAL').AsFloat,2);
          vBaseCOFINS := vBasePIS;
          vValorPIS := StrToFloatFormat( vBasePIS * vAliqPIS / 100 ,2);
          vValorCOFINS := StrToFloatFormat( vBaseCOFINS * vAliqCOFINS / 100 ,2);
          vCST_PIS := '50';
          vCST_COFINS := '50';
        end;

        vQrExec.close;
        vQrExec.SQL.Text := 'update servico_transporte set cst_pis = :cst_pis, cst_cofins = :cst_cofins,' +
          ' base_pis = :base_pis, base_cofins = :base_cofins, valor_pis = :valor_pis, valor_cofins = :valor_cofins,' +
          ' aliq_pis = :aliq_pis, aliq_cofins = :aliq_cofins'+
          ' where COD_SERV_TRANSP = :COD_SERV_TRANSP and cod_empresa = :cod_empresa';
        vQrExec.ParamByName('cst_pis').AsString := vCST_PIS;
        vQrExec.ParamByName('cst_cofins').AsString := vCST_COFINS;
        vQrExec.ParamByName('base_pis').AsCurrency := vBasePIS;
        vQrExec.ParamByName('base_cofins').AsCurrency := vBaseCOFINS;
        vQrExec.ParamByName('valor_pis').AsCurrency := vValorPIS;
        vQrExec.ParamByName('valor_cofins').AsCurrency := vValorCOFINS;
        vQrExec.ParamByName('aliq_pis').AsFloat := vAliqPIS;
        vQrExec.ParamByName('aliq_cofins').AsFloat := vAliqCOFINS;
        vQrExec.ParamByName('COD_SERV_TRANSP').AsInteger := vQrTemp.FieldByName('COD_SERV_TRANSP').AsInteger;
        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrExec.ExecSQL;

        vQrTemp.Next;
        FProgressBar2.Position := FProgressBar2.Position + 1;
        Application.ProcessMessages;
      end;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except                  
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;

    vQrTemp.Free;
    vQrTemp := nil;
  end;
end;

procedure TSpedHw._verificaPISCOFINSCupomFiscal(pNSerieECF: string;
  pCodTerminal: integer);
var
  vQrTemp, vQrExec: TIBQuery;
  vBasePIS: Currency;
  vBaseCOFINS: Currency;
  vTempCSTPIS, vTempCSTCOFINS: String;
  vTempAliqPIS, vTempAliqCOFINS: Double;
  vMinR, vMaxR, vMinO, vMaxO: Integer;

begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    try
      FLabelStatus.Caption := 'Definindo PIS/COFINS - Cupons Fiscal - Caixa ' + StrZero(IntToStr(pCodTerminal),3) + '  '+ pNSerieECF;
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select ' +
        ' min(cp2.registro) minimoR, max(cp2.registro) maximoR,' +
        ' min(cp2.ordem) minimoO, max(cp2.ordem) maximoO' +
        ' from cupom cp' +
        ' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and cp.nserieecf = cp2.nserieecf and' +
        ' cp.cod_empresa = cp2.cod_empresa and cp2.ordem = cp.registro and cp.cupom = cp2.cupom' +
        ' left join produtos p on  p.grupo_prod = cp2.grupo_prod and p.cod_prod = cp2.cod_prod and' +
        ' p.cod_empresa = cp2.cod_empresa' +
        ' left join tipo_servico ts on ts.cod_servico = cp2.grupo_prod' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserieecf' +
        ' and cp.data >= :dataIni and cp.data <= :dataFim and cp.cod_empresa = :cod_empresa' +
        ' and ((cp2.status_it <> ''CANCELADO'') or (cp2.status_it is null))';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrTemp.ParamByName('nserieecf').AsString := pNSerieECF;
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;

      vMinR := vQrTemp.FieldByName('minimoR').AsInteger;
      vMaxR := vQrTemp.FieldByName('maximoR').AsInteger;
      vMinO := vQrTemp.FieldByName('minimoO').AsInteger;
      vMaxO := vQrTemp.FieldByName('maximoO').AsInteger;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select distinct' +
        ' cp2.prod_serv,' +
        ' case when cp2.prod_serv = ''P'' then p.isento_pis else ts.isento_pis end isento_pis,' +
        ' case when cp2.prod_serv = ''P'' then p.cst_pis else ts.cst_pis end cst_pis,' +
        ' case when cp2.prod_serv = ''P'' then p.cst_cofins else ts.cst_cofins end cst_cofins,' +
        ' case when cp2.prod_serv = ''P'' then p.aliq_pis_diferenciada else 0 end aliq_pis_diferenciada,' +
        ' case when cp2.prod_serv = ''P'' then p.aliq_cofins_diferenciada else 0 end aliq_cofins_diferenciada,' +
        ' cp2.grupo_prod, cp2.cod_prod' +
        ' from cupom cp' +
        ' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and cp.nserieecf = cp2.nserieecf and' +
        ' cp.cod_empresa = cp2.cod_empresa and cp2.ordem = cp.registro and cp.cupom = cp2.cupom' +
        ' left join produtos p on  p.grupo_prod = cp2.grupo_prod and p.cod_prod = cp2.cod_prod and' +
        ' p.cod_empresa = cp2.cod_empresa' +
        ' left join tipo_servico ts on ts.cod_servico = cp2.grupo_prod' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserieecf' +
        ' and cp.data >= :dataIni and cp.data <= :dataFim and cp.cod_empresa = :cod_empresa' +
        ' and ((cp2.status_it <> ''CANCELADO'') or (cp2.status_it is null))' +
        ' and ((cp.valor_pis is null) or (cp.valor_cofins is null))';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrTemp.ParamByName('nserieecf').AsString := pNSerieECF;
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;

      vQrTemp.FetchAll;

      FProgressBar2.Min := 0;
      FProgressBar2.Max := vQrTemp.RecordCount;
      FProgressBar2.Position := 1;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        Application.ProcessMessages;

        vTempAliqPIS := 0;
        vTempAliqCOFINS := 0;
        vTempCSTPIS := '';
        vTempCSTCOFINS := '';

//        if (Trim(vQrTemp.FieldByName('isento_pis').AsString) = 'S') and
//          (Trim(vQrTemp.FieldByName('cst_pis').AsString) = '') then
//        begin
//          vTempCSTPIS := '04';
//          vTempCSTCOFINS := '04';
//        end
//        else
        begin
          if (Trim(vQrTemp.FieldByName('cst_pis').AsString) = '01') or
            (Trim(vQrTemp.FieldByName('cst_pis').AsString) = '') then
          begin
            vTempCSTPIS := '01';
            vTempAliqPIS := FAliqPIS;
            vTempCSTCOFINS := '01';
            vTempAliqCOFINS := FAliqCOFINS;
          end
          else
          begin
            vTempCSTPIS := Trim(vQrTemp.FieldByName('cst_pis').AsString);
            vTempCSTCOFINS := Trim(vQrTemp.FieldByName('cst_cofins').AsString);
//            if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') then
            begin
              vTempAliqPIS := vQrTemp.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat;
              vTempAliqCOFINS := vQrTemp.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat;
            end;
          end;
        end;

        vQrExec.Close;
        vQrExec.SQL.Text :=
          'update cupom2 cp2 set cst_pis = :cst_pis, cst_cofins = :cst_cofins,' +
          ' aliq_pis = :aliq_pis, aliq_cofins = :aliq_cofins, base_pis = null, base_cofins = null' +
          ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
          ' and cp2.cod_empresa = :cod_empresa and cp2.grupo_prod = :grupo_prod'+
          ' and cp2.registro >= ' + IntToStr(vMinR) + ' and cp2.registro <= ' + IntToStr(vMaxR)+
          ' and cp2.ordem >= ' + IntToStr(vMinO) + ' and cp2.ordem <= ' + IntToStr(vMaxO);

        if vQrTemp.FieldByName('prod_serv').AsString = 'P' then
          vQrExec.SQL.Text := vQrExec.SQL.Text + ' and cp2.cod_prod = :cod_prod and cp2.prod_serv = ''P'''
        else
          vQrExec.SQL.Text := vQrExec.SQL.Text + ' and cp2.prod_serv = ''S''';

        vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
        vQrExec.ParamByName('nserie').AsString := pNSerieECF;
        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrExec.ParamByName('grupo_prod').AsInteger := vQrTemp.FieldByName('grupo_prod').AsInteger;
        if vQrTemp.FieldByName('prod_serv').AsString = 'P' then
          vQrExec.ParamByName('cod_prod').AsString := vQrTemp.FieldByName('cod_prod').AsString;
        vQrExec.ParamByName('aliq_pis').AsCurrency := vTempAliqPIS;
        vQrExec.ParamByName('aliq_cofins').AsCurrency := vTempAliqCOFINS;
        vQrExec.ParamByName('cst_pis').AsString := vTempCSTPIS;
        vQrExec.ParamByName('cst_cofins').AsString := vTempCSTCOFINS;
        vQrExec.Prepare;
        vQrExec.ExecSQL;

        vQrTemp.Next;
        FProgressBar2.Position := FProgressBar2.Position + 1;
        Application.ProcessMessages;
      end;

      vQrExec.Close;
      vQrExec.SQL.Text :=
        'update cupom cp set cp.valor_pis = 0, cp.valor_cofins = 0' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserieecf' +
        ' and cp.data >= :dataIni and cp.data <= :dataFim and cp.cod_empresa = :cod_empresa' +
        ' and ((cp.valor_pis is null) or (cp.valor_cofins is null))';
      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrExec.ParamByName('nserieecf').AsString := pNSerieECF;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.Prepare;
      vQrExec.ExecSQL;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except                  
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;

    vQrTemp.Free;
    vQrTemp := nil;
  end;
end;

procedure TSpedHw._verificaPISCOFINS_Servicos;
var
  vQrTemp, vQrTemp2, vQrExec: TIBQuery;
  vTempCSTPIS, vTempCSTCOFINS: string;
  vTempAliqPIS, vTempAliqCOFINS, vTempBasePIS, vTempBaseCOFINS, vTempValorPIS, vTempValorCOFINS, vValorServ, vIRRFServ:
  Double;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrExec.Close;
    vQrExec.SQL.Text :=
      'update pedvenda_serv ps set ps.cst_pis = :cst_pis, ps.aliq_pis = :aliq_pis,' +
      ' ps.base_pis = :vl_bc_pis, ps.valor_pis = :vl_pis, ps.cst_cofins = :cst_cofins,' +
      ' ps.aliq_cofins = :aliq_cofins, ps.base_cofins = :vl_bc_cofins , ps.valor_cofins = :vl_cofins' +
      ' where ps.nped = :nped and ps.tipo = :tipo and ps.cod_servico = :cod_servico and' +
      ' ps.nitem = :nitem and ps.cod_empresa = :cod_empresa and ps.codigo_nop = :codigo_nop';

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    vQrTemp2 := TIBQuery.Create(Application);
    vQrTemp2.Database := vConexao;
    vQrTemp2.Transaction := vTransacao;
    try
      FLabelStatus.Caption := 'Definindo PIS/COFINS - Nota Fiscal de Serviços';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select ps.nped,  ps.tipo, ps.cod_servico, ps.nitem,  ps.cod_empresa,' +
        ' ps.codigo_nop, (coalesce(ps.valor_nfse,0) + coalesce(ps.irrf_servico,0)) valor_nfse , ps.aliq_pis, ps.aliq_cofins, ts.cst_pis, ts.cst_cofins,' +
        ' ts.isento_pis, ps.quant_serv_ped, ts.irrf_servico, ts.vl_teto_irrf from pedvenda pv' +
        ' inner join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and' +
        ' pv.cod_empresa = ps.cod_empresa' +
        ' inner join tipo_servico ts on ts.cod_servico = ps.cod_servico' +
        ' where ps.status_nfse = ''Autorizada'' and ps.emissao_nfse >= :dataIni and' +
        ' ps.emissao_nfse <= :dataFim and pv.cod_empresa = :cod_empresa and' +
        ' (ps.cst_pis is null or ps.cst_cofins = '''')';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsString := FCodEmpresa;
      vQrTemp.Open;

      vQrTemp.FetchAll;

      FProgressBar2.Min := 0;
      FProgressBar2.Max := vQrTemp.RecordCount;
      FProgressBar2.Position := 1;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        if (Pos('SIMPLES', FRegime) > 0) then
        begin
          vTempCSTPIS := '99';
          vTempCSTCOFINS := '99';
          vTempAliqPIS := 0;
          vTempAliqCOFINS := 0;
        end
//        else if (vQrTemp.FieldByName('isento_pis').AsString = 'S') then
//        begin
//          vTempCSTPIS := '04';
//          vTempCSTCOFINS := '04';
//          vTempAliqPIS := 0;
//          vTempAliqCOFINS := 0;
//        end
        else
        begin
          if (Trim(vQrTemp.FieldByName('cst_pis').AsString) <> '') then
            vTempCSTPIS := Trim(vQrTemp.FieldByName('cst_pis').AsString)
          else if FAliqPIS > 0 then
            vTempCSTPIS := '01'
          else
            vTempCSTPIS := '49';

          if (vTempCSTPIS = '01') then
            vTempAliqPIS := FAliqPIS
          else if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or
            (vTempCSTPIS = '05') or (vTempCSTPIS = '49') then
            vTempAliqPIS := vQrTemp.FieldByName('aliq_pis').AsFloat
          else if (vTempCSTPIS = '04') or (vTempCSTPIS = '06') or
            (vTempCSTPIS = '07') or (vTempCSTPIS = '08') or
            (vTempCSTPIS = '09') then
            vTempAliqPIS := 0;

          if (Trim(vQrTemp.FieldByName('cst_cofins').AsString) <> '') then
            vTempCSTCOFINS := Trim(vQrTemp.FieldByName('cst_cofins').AsString)
          else if FAliqCOFINS > 0 then
            vTempCSTCOFINS := '01'
          else
            vTempCSTCOFINS := '49';

          if (vTempCSTCOFINS = '01') then
            vTempAliqCOFINS := FAliqCOFINS
          else if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') or
            (vTempCSTCOFINS = '05') or (vTempCSTCOFINS = '49') then
            vTempAliqCOFINS := vQrTemp.FieldByName('aliq_cofins').AsFloat
          else if (vTempCSTCOFINS = '04') or (vTempCSTCOFINS = '06') or
            (vTempCSTCOFINS = '07') or (vTempCSTCOFINS = '08') or
            (vTempCSTCOFINS = '09') then
            vTempAliqCOFINS := 0;
        end;

        if vTempAliqPIS <= 0 then
        begin
          vTempBasePIS := 0;
          vTempValorPIS := 0;
          vTempAliqPIS := 0;
        end
        else if vTempAliqPIS > 0 then
        begin
          if (vTempCSTPIS = '03') then
          begin
            vTempBasePIS := 0; //cst 03 base e aliquota nao devem ser preenchidos.
            vTempValorPIS := StrToFloatFormat(vQrTemp.FieldByName('quant_serv_ped').AsFloat *
              vTempAliqPIS, 2);
          end
          else
          begin
            vTempBasePIS := StrToFloatFormat(vQrTemp.FieldByName('valor_nfse').AsFloat, 2);
            vTempValorPIS := StrToFloatFormat(vTempBasePIS * vTempAliqPIS / 100, 2);
          end;
        end;

        if vTempAliqCOFINS <= 0 then
        begin
          vTempBaseCOFINS := 0;
          vTempValorCOFINS := 0;
          vTempAliqCOFINS := 0;
        end
        else if vTempAliqCOFINS > 0 then
        begin
          if (vTempCSTCOFINS = '03') then
          begin
            vTempBaseCOFINS := 0; //cst 03 base e aliquota nao devem ser preenchidos.
            vTempValorCOFINS := StrToFloatFormat(vQrTemp.FieldByName('quant_serv_ped').AsFloat *
              vTempAliqCOFINS, 2);
          end
          else
          begin
            vTempBaseCOFINS := StrToFloatFormat(vQrTemp.FieldByName('valor_nfse').AsFloat, 2);
            vTempValorCOFINS := StrToFloatFormat(vTempBaseCOFINS * vTempAliqCOFINS / 100, 2);
          end;
        end;

        vQrExec.Close;

        vQrExec.Close;
        vQrExec.ParamByName('cst_pis').AsString := vTempCSTPIS;
        vQrExec.ParamByName('aliq_pis').AsFloat := vTempAliqPIS;
        vQrExec.ParamByName('vl_bc_pis').AsFloat := vTempBasePIS;
        vQrExec.ParamByName('vl_pis').AsFloat := vTempValorPIS;
        vQrExec.ParamByName('cst_cofins').AsString := vTempCSTCOFINS;
        vQrExec.ParamByName('aliq_cofins').AsFloat := vTempAliqCOFINS;
        vQrExec.ParamByName('vl_bc_cofins').AsFloat := vTempBaseCOFINS;
        vQrExec.ParamByName('vl_cofins').AsFloat := vTempValorCOFINS;
        vQrExec.ParamByName('nped').AsInteger := vQrTemp.FieldByName('nped').AsInteger;
        vQrExec.ParamByName('tipo').AsString := vQrTemp.FieldByName('tipo').AsString;
        vQrExec.ParamByName('cod_servico').AsInteger :=
          vQrTemp.FieldByName('cod_servico').AsInteger;
        vQrExec.ParamByName('nitem').AsInteger := vQrTemp.FieldByName('nitem').AsInteger;
        vQrExec.ParamByName('cod_empresa').AsInteger :=
          vQrTemp.FieldByName('cod_empresa').AsInteger;
        vQrExec.ParamByName('codigo_nop').AsFloat := vQrTemp.FieldByName('codigo_nop').AsFloat;
        vQrExec.ExecSQL;

        vQrTemp.Next;
        FProgressBar2.Position := FProgressBar2.Position + 1;
        Application.ProcessMessages;
      end;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select ps.nped,  ps.tipo, ps.cod_servico, ps.nitem,  ps.cod_empresa,' +
        ' ps.codigo_nop, (coalesce(ps.valor_tot_serv,0) - coalesce(ps.rateio_desc,0)) valor_nfse, ps.aliq_pis, ps.aliq_cofins, ts.cst_pis, ts.cst_cofins,' +
        ' ts.isento_pis, ps.quant_serv_ped, ts.irrf_servico, ts.vl_teto_irrf from pedvenda pv' +
        ' inner join pedvenda_serv ps on pv.nped = ps.nped and pv.tipo = ps.tipo and' +
        ' pv.cod_empresa = ps.cod_empresa' +
        ' inner join tipo_servico ts on ts.cod_servico = ps.cod_servico' +
        ' where pv.NUM_NFEEXT > 0 and pv.DATA_NFEXT >= :dataIni and' +
        ' pv.DATA_NFEXT <= :dataFim and pv.cod_empresa = :cod_empresa and' +
        ' (ps.cst_pis is null or ps.cst_cofins = '''')' +
        ' and ((ps.lote_nfse is null) or (ps.lote_nfse = 0))';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsString := FCodEmpresa;
      vQrTemp.Open;

      vQrTemp.FetchAll;

      FProgressBar2.Min := 0;
      FProgressBar2.Max := vQrTemp.RecordCount;
      FProgressBar2.Position := 1;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        
        vTempCSTPIS := '';
        vTempCSTCOFINS := '';
        vTempAliqPIS := 0;
        vTempAliqCOFINS := 0;
        vTempBasePIS := 0;
        vTempBaseCOFINS := 0;
        vTempValorPIS := 0;
        vTempValorCOFINS := 0;
        vValorServ := 0;
        vIRRFServ := 0;

        if (Pos('SIMPLES', FRegime) > 0) then
        begin
          vTempCSTPIS := '99';
          vTempCSTCOFINS := '99';
          vTempAliqPIS := 0;
          vTempAliqCOFINS := 0;
        end
//        else if (vQrTemp.FieldByName('isento_pis').AsString = 'S') then
//        begin
//          vTempCSTPIS := '04';
//          vTempCSTCOFINS := '04';
//          vTempAliqPIS := 0;
//          vTempAliqCOFINS := 0;
//        end
        else
        begin
          if (Trim(vQrTemp.FieldByName('cst_pis').AsString) <> '') then
            vTempCSTPIS := Trim(vQrTemp.FieldByName('cst_pis').AsString)
          else if FAliqPIS > 0 then
            vTempCSTPIS := '01'
          else
            vTempCSTPIS := '49';

          if (vTempCSTPIS = '01') then
            vTempAliqPIS := FAliqPIS
          else if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or
            (vTempCSTPIS = '05') or (vTempCSTPIS = '49') then
            vTempAliqPIS := vQrTemp.FieldByName('aliq_pis').AsFloat
          else if (vTempCSTPIS = '04') or (vTempCSTPIS = '06') or
            (vTempCSTPIS = '07') or (vTempCSTPIS = '08') or
            (vTempCSTPIS = '09') then
            vTempAliqPIS := 0;

          if (Trim(vQrTemp.FieldByName('cst_cofins').AsString) <> '') then
            vTempCSTCOFINS := Trim(vQrTemp.FieldByName('cst_cofins').AsString)
          else if FAliqCOFINS > 0 then
            vTempCSTCOFINS := '01'
          else
            vTempCSTCOFINS := '49';

          if (vTempCSTCOFINS = '01') then
            vTempAliqCOFINS := FAliqCOFINS
          else if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') or
            (vTempCSTCOFINS = '05') or (vTempCSTCOFINS = '49') then
            vTempAliqCOFINS := vQrTemp.FieldByName('aliq_cofins').AsFloat
          else if (vTempCSTCOFINS = '04') or (vTempCSTCOFINS = '06') or
            (vTempCSTCOFINS = '07') or (vTempCSTCOFINS = '08') or
            (vTempCSTCOFINS = '09') then
            vTempAliqCOFINS := 0;
        end;

        if vTempAliqPIS <= 0 then
        begin
          vTempBasePIS := 0;
          vTempValorPIS := 0;
          vTempAliqPIS := 0;
          vTempBaseCOFINS := 0;
          vTempValorCOFINS := 0;
          vTempAliqCOFINS := 0;
        end
        else if vTempAliqPIS > 0 then
        begin
          if (vTempCSTPIS = '03') then
          begin
            vTempBasePIS := 0; //cst 03 base e aliquota nao devem ser preenchidos.
            vTempBaseCOFINS := 0; //cst 03 base e aliquota nao devem ser preenchidos.
            vTempValorPIS := StrToFloatFormat(vQrTemp.FieldByName('quant_serv_ped').AsFloat *
              vTempAliqPIS, 2);
            vTempValorCOFINS := StrToFloatFormat(vQrTemp.FieldByName('quant_serv_ped').AsFloat *
              vTempAliqCOFINS, 2);
          end
          else
          begin
            if (vQrTemp.FieldByName('irrf_servico').AsFloat > 0) and
              (vQrTemp.FieldByName('vl_teto_irrf').AsFloat > 0) and
              (vQrTemp.FieldByName('valor_nfse').AsFloat > vQrTemp.FieldByName('vl_teto_irrf').AsFloat) then
            begin
              vIRRFServ := StrToFloatFormat((vQrTemp.FieldByName('valor_nfse').AsFloat *
                vQrTemp.FieldByName('irrf_servico').AsFloat / 100),2);
              vValorServ := StrToFloatFormat(vQrTemp.FieldByName('valor_nfse').AsFloat - vIRRFServ,2);
              vTempBasePIS := StrToFloatFormat(vQrTemp.FieldByName('valor_nfse').AsFloat, 2);
              vTempBaseCOFINS := StrToFloatFormat(vQrTemp.FieldByName('valor_nfse').AsFloat, 2);
            end
            else
            begin
              vTempBasePIS := StrToFloatFormat(vQrTemp.FieldByName('valor_nfse').AsFloat, 2);
              vTempBaseCOFINS := StrToFloatFormat(vQrTemp.FieldByName('valor_nfse').AsFloat, 2);
            end;
            vTempValorPIS := StrToFloatFormat(vTempBasePIS * vTempAliqPIS / 100, 2);
            vTempValorCOFINS := StrToFloatFormat(vTempBaseCOFINS * vTempAliqCOFINS / 100, 2);
          end;
        end;

        vQrExec.Close;
        vQrExec.SQL.Text :=
          'update pedvenda_serv ps set ps.cst_pis = :cst_pis, ps.aliq_pis = :aliq_pis,' +
          ' ps.base_pis = :vl_bc_pis, ps.valor_pis = :vl_pis, ps.cst_cofins = :cst_cofins,' +
          ' ps.aliq_cofins = :aliq_cofins, ps.base_cofins = :vl_bc_cofins , ps.valor_cofins = :vl_cofins' ;

        if (vQrTemp.FieldByName('irrf_servico').AsFloat > 0) and
          (vQrTemp.FieldByName('vl_teto_irrf').AsFloat > 0) and
          (vQrTemp.FieldByName('valor_nfse').AsFloat > vQrTemp.FieldByName('vl_teto_irrf').AsFloat) then
        begin
          vQrExec.SQL.Text := vQrExec.SQL.Text +
            ', ps.valor_nfse = :valor_nfse, ps.irrf_servico = :irrf_servico' +
            ' where ps.nped = :nped and ps.tipo = :tipo and ps.cod_servico = :cod_servico and' +
            ' ps.nitem = :nitem and ps.cod_empresa = :cod_empresa and ps.codigo_nop = :codigo_nop';
          vQrExec.ParamByName('valor_nfse').AsFloat := vValorServ;
          vQrExec.ParamByName('irrf_servico').AsFloat := vIRRFServ;
        end
        else
          vQrExec.SQL.Text := vQrExec.SQL.Text +
            ' where ps.nped = :nped and ps.tipo = :tipo and ps.cod_servico = :cod_servico and' +
            ' ps.nitem = :nitem and ps.cod_empresa = :cod_empresa and ps.codigo_nop = :codigo_nop';

        vQrExec.ParamByName('cst_pis').AsString := vTempCSTPIS;
        vQrExec.ParamByName('aliq_pis').AsFloat := vTempAliqPIS;
        vQrExec.ParamByName('vl_bc_pis').AsFloat := vTempBasePIS;
        vQrExec.ParamByName('vl_pis').AsFloat := vTempValorPIS;
        vQrExec.ParamByName('cst_cofins').AsString := vTempCSTCOFINS;
        vQrExec.ParamByName('aliq_cofins').AsFloat := vTempAliqCOFINS;
        vQrExec.ParamByName('vl_bc_cofins').AsFloat := vTempBaseCOFINS;
        vQrExec.ParamByName('vl_cofins').AsFloat := vTempValorCOFINS;
        vQrExec.ParamByName('nped').AsInteger := vQrTemp.FieldByName('nped').AsInteger;
        vQrExec.ParamByName('tipo').AsString := vQrTemp.FieldByName('tipo').AsString;
        vQrExec.ParamByName('cod_servico').AsInteger :=
          vQrTemp.FieldByName('cod_servico').AsInteger;
        vQrExec.ParamByName('nitem').AsInteger := vQrTemp.FieldByName('nitem').AsInteger;
        vQrExec.ParamByName('cod_empresa').AsInteger :=
          vQrTemp.FieldByName('cod_empresa').AsInteger;
        vQrExec.ParamByName('codigo_nop').AsFloat := vQrTemp.FieldByName('codigo_nop').AsFloat;
        vQrExec.ExecSQL;

        vQrTemp.Next;
        FProgressBar2.Position := FProgressBar2.Position + 1;
        Application.ProcessMessages;
      end;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except                  
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;

    vQrTemp.Free;
    vQrTemp := nil;

    vQrTemp2.Free;
    vQrTemp2 := nil;
  end;
end;

procedure TSpedHw._zerarDadosSpedPISCOFINS;
var
  vQrTemp, vQrExec: TIBQuery;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    try
      FLabelStatus.Caption := 'Reiniciando dados para o cálculo - Nota Fiscal';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update notafiscal nf set nf.conf_piscofins = null' +
        ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and cod_empresa = :cod_empresa' +
        ' and not nf.conf_piscofins is null';
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

      vQrTemp.Close;
      vQrTemp.SQL.Text :=
        'select  min(nf.cod_nf) minimo, max(nf.cod_nf) maximo from notafiscal nf' +
        ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and cod_empresa = :cod_empresa';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update notafiscal_item nfi set nfi.cst_pis = null, nfi.cst_cofins = null,' +
        ' nfi.base_pis = null, nfi.base_cofins = null, nfi.valor_pis = null,' +
        ' nfi.valor_cofins = null, nfi.aliq_pis_quant = null, nfi.aliq_cofins_quant = null,' +
        ' nfi.quant_bc_pis = null, nfi.quant_bc_cofins = null' +
        ' where nfi.cod_nf >= :Ini and nfi.cod_nf <= :Fim and cod_empresa = :cod_empresa';
      vQrExec.ParamByName('Ini').AsInteger := vQrTemp.FieldByName('minimo').AsInteger;
      vQrExec.ParamByName('Fim').AsInteger := vQrTemp.FieldByName('maximo').AsInteger;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

      FLabelStatus.Caption := 'Reiniciando dados para o cálculo - Cupom Fiscal';
      Application.ProcessMessages;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update cupom cp set cp.valor_pis = null, cp.valor_cofins = null' +
        ' where cp.data >= :dataIni and cp.data <= :dataFim and cp.cod_empresa = :cod_empresa' +
        ' and ((not cp.valor_pis is null) or (not cp.valor_cofins is null))';
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

      FLabelStatus.Caption := 'Reiniciando dados para o cálculo - Nota Fiscal de Serviço';
      Application.ProcessMessages;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select min(pv.nped) minimo, max(pv.nped) maximo from pedvenda pv ' +
        ' where pv.data_nfext >= :dataIni and pv.data_nfext <= :dataFim and pv.cod_empresa = :cod_empresa';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update pedvenda_serv ps set ps.cst_pis = null, ps.cst_cofins = null' +
        ' where ps.nped >= :Ini and ps.nped <= :Fim and ps.cod_empresa = :cod_empresa and ps.tipo = ''OS''' +
        ' and ((not ps.cst_pis is null) or (not ps.cst_cofins is null))';
      vQrExec.ParamByName('Ini').AsInteger := vQrTemp.FieldByName('minimo').AsInteger;
      vQrExec.ParamByName('Fim').AsInteger := vQrTemp.FieldByName('maximo').AsInteger;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

      FLabelStatus.Caption := 'Reiniciando dados para o cálculo - Nota Fiscal modelo 02';
      Application.ProcessMessages;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select min(nd.numeronota) minimo, max(nd.numeronota) maximo from nf_serie_d nd ' +
        ' where nd.dataemissao >= :dataIni and nd.dataemissao <= :dataFim and nd.cod_empresa = :cod_empresa';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update nf_serie_d_itens ndi set ndi.cst_pis = null, ndi.cst_cofins = null' +
        ' where ndi.numeronota >= :Ini and ndi.numeronota <= :Fim and ndi.cod_empresa = :cod_empresa' +
        ' and ((not ndi.cst_pis is null) or (not ndi.cst_cofins is null))';
      vQrExec.ParamByName('Ini').AsInteger := vQrTemp.FieldByName('minimo').AsInteger;
      vQrExec.ParamByName('Fim').AsInteger := vQrTemp.FieldByName('maximo').AsInteger;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

      FLabelStatus.Caption := 'Reiniciando dados para o cálculo - Conhecimento de Transporte';
      Application.ProcessMessages;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update servico_transporte st set st.cst_pis = null, st.cst_cofins = null' +
        ' where st.data_lancamento >= :dataIni and st.data_lancamento <= :dataFim and st.cod_empresa = :cod_empresa' +
        ' and ((not st.cst_pis is null) or (not st.cst_cofins is null))';
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

      if vTransacaoAux.InTransaction then
        vTransacaoAux.Commit;

    except
      if vTransacaoAux.InTransaction then
        vTransacaoAux.Rollback;
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;

    vQrTemp.Free;
    vQrTemp := nil;
  end;
end;

end.
