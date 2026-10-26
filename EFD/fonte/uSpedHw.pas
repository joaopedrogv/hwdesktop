unit uSpedHw;

interface

uses
  StdCtrls, ComCtrls, IBX.IBQuery, Classes, IBX.IBDataBase, ACBrSpedFiscal, ACBrSpedPISCOFINS, {ACBrLFD,} DBClient, uSpedHwClasses;

//const
//  cfopDevolucaoCompra: string = '5205|5206|5207|6205|6206|6207|7205|7206|7207|5201|5202|5210|5410|5411|5413|5660|6201|6202|6210|6410|6411|6413|6660|7201|7202|7210|';
//  cfopDevolucaoVenda: string = '1201|1202|1203|1204|1410|1411|1660|1661|1662|2201|2202|2410|2411|2660|2661|2662|';

type

  LogStore = record
    filename: string;
    timeStarted: TDateTime;
  end;

  TSpedHw = class
  strict private
    function GetLogGeral: string;
  private
		FSpedFiscalOuPisCofins: string;
    FBlocoK: boolean;
    FCST_05_BaseZero: Boolean;
    FProdutos: TSpedHwProd;
    Floggeral: string;
    FlogStore: LogStore;

		procedure _gravaMD5_RegistrosPAF(query: TIBQuery; pTextoAcript, pTabela, pWhere: string; pCampoMD5: string = 'MD5'; pCommit: Boolean = True);
    procedure logs(Atext, Afilename: string; Asingleline: Boolean = False; AtimeStart: TDateTime = 0);
    procedure logs_sl(Atext, Afilename: string; AtimeStart: TDateTime = 0);
    procedure logs_elapsed_time(Atext: string = '');

	protected
    //Componentes de Conexao do Banco
    vEnderecoBanco: string;
    vConexao: TIBDataBase;
    vTransacao, vTransacaoAux: TIBTransaction;
    vNivel0, vNivel2, vNivel3, vNivel4, vNivel5, vNivel6, vQrAux, vQrAux1: TIBQuery;

    FCreditosAnteriores, FCreditosAnterioresHistorico: TClientDataSet;    
    FRetencoesAnteriores, FRetencoesAnterioresHistorico: TClientDataSet;

    cfopDevolucaoCompra: string;
    cfopDevolucaoVenda: string;

    FSpedF: TACBrSPEDFiscal;
    FSpedP: TACBrSPEDPisCofins;
    //fLFD: TACBrLFD;
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
    FCNPJEmpresa: string;
    FCNPJGrupo: string;
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
    FRegistro0221: Boolean;
    FRefazerCalculoPISCOFINS: Boolean;
    FAlterarCST4998: Boolean;
    FStop: Boolean;

    F0190: TStringList;
    F0200: TStringList;
    F0400: TStringList;
    F0450: TStringList;
    FC400: TStringList;

    FAliqPIS, FAliqCOFINS, FValorPISAcumulado, FValorCOFINSAcumulado:
    Currency;
    FValorCredFuturo_Pis, FValorCredFuturo_Cofins, FValorCredFuturo_ICMS, FValorCredFuturo_IPI: Currency;//valor de credito a apurar em periodo futuro
    FValorCredPerAnt_Pis, FValorCredPerAnt_Cofins, FValorCredPerAnt_ICMS, FValorCredPerAnt_IPI: Currency;//valor de credito aproveitado do período anterior


    //Layout  Numero|CPF / CNPJ     |Nome do Participante
    //        NNNNNN|XXXXXXXXXXXXXXX|CCCCCCCCCCCCCCC......
    //Caso necessite por causa do Servico de transporte         
    function getCampoPipe(plinha: string; pOrdem: integer; pDelimiter: string = '|'): string;
    function getValue(pStr: string; pPos: integer; pDelimiter: string = '|'): string;
    function StrZero(Num: string; Tam: Integer): string; overload;
    function SpaceStr(vStr: string; Tam: Integer): string;
    function StrToFloatFormat(valor: Double; casasDecimais: integer): Double;
    function getParticipante(codigo, cpfcnpj: string): string;
    function getValueFromList(IndexTest, IndexValue: Integer; ValueTest: string; List: TStringList): string;
		function getCampoBlobString(vTexto: AnsiString): AnsiString;
    function cfopDeDevolucao(pCFOP: Integer; pEntSaida: string): Boolean;
    function getConfSisBool(pChave: string; pBuscas: TIBQuery): Boolean;
    function getConfSisInt(pChave: string; pBuscas: TIBQuery): Integer;
    procedure setConfSisBool(pChave: string; pValue: Boolean; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: string = '');
    procedure setConfSisInt(pChave: string; pValue: integer; pBuscas: TIBQuery; pDisplay: string = ''; pStrings: TStrings = nil);
    procedure setConfSisBlob(pChave: string; pBuscas: TIBQuery; pDisplay: string = ''; pValue: string = ''); overload;
    procedure verificaNfSerieD;
    procedure verificaCamposNuloNF;
		procedure verificaCamposNullCupom(pNSerieECF: string; pCodTerminal: integer);
    procedure verificaPISCOFINSCupomFiscal_nao_usado_mais(pNSerieECF: string; pCodTerminal: integer);
    procedure _verificaPISCOFINSCupomFiscal(pNSerieECF: string; pCodTerminal: integer);
    procedure verificaPISCOFINSNotaFiscal;
    procedure verificaPISCOFINSNFCe;
    procedure verificaPISCOFINSServicoTransporte;
    procedure verificaPISCOFINSNFSerieD;
    procedure verificaDataServicoTransporte;
    procedure verificaICMSInterestadual;
    procedure _verificaPISCOFINS_Servicos;
    procedure _zerarDadosSpedPISCOFINS;
    function gravaSpedItem(tipo: string; grupo_prod: integer; cod_prod: string;
      chassi: string; cod_servico: integer; cod_outras: string; unid: string): boolean;
    procedure AddProdCodigos0221(grupoProd: Integer; codProd: string);

    procedure apagarSpedItem;
    procedure montaRegistro0150(pCOD_PART: string);
    procedure montaRegistro0190(pUNID: string);
    procedure montaRegistro0200; virtual;
    procedure montaRegistro0205(pGrupoProd: Integer; pCodProd: String; pQuery: TIBQuery);
    procedure montaRegistro0400(pCOD_NAT: string); overload;
    procedure montaRegistro0400(var pCOD_NAT: string; pDESC_NATOP: string); overload;
    procedure montaRegistro0450(pCOD_INF: integer; pTXT: string);
    procedure montaRegistroC400(pCOD_MOD, pECF_MOD, pECF_FAB, pECF_CX: string);

    procedure gravaCreditoDoPeriodo;
    function SqlOpen(ASql: string; AQuery: TIBQuery = nil): TIBQuery; overload;
    function SqlOpen(ASql: string; const Args: array of const; AQuery: TIBQuery = nil): TIBQuery; overload;
    function SqlExec(ASql: string; AQuery: TIBQuery = nil): TIBQuery; overload;
    function SqlExec(ASql: string; const Args: array of const; AQuery: TIBQuery = nil): TIBQuery; overload;

    function ExisteNotasPendentes: Boolean;
  public

		destructor Destroy; override;
		function verificaCupomSemZ(pNSerieECF: string; pCodTerminal: integer): boolean;
		function conectarBanco: boolean;
    procedure setCNPJGrupo(pCNPJ: string);
    procedure getCreditoPeriodoAnterior(pData: string; pCNPJ: string = '');

    function getConfSisBlob(pChave: string; pBuscas: TIBQuery): TStrings;
    function GetIni(pChave, pIdentificador, pValorDefault: string; IniText: TStrings): string;

    property Banco: TIBDataBase read vConexao write vConexao;
    property DataIni: string read FDataIni write FDataIni;
    property DataFim: string read FDataFim write FDataFim;
    property DataInv: string read FDataInv write FDataInv;
    property Finalidade: string read FFinalidade write FFinalidade;
    property Destino: string read FDestino write FDestino;
    property CodEmpresa: string read FCodEmpresa write FCodEmpresa;
    property EnderecoBanco: string read vEnderecoBanco write vEnderecoBanco;
    property CNPJGrupo: string read FCNPJGrupo write FCNPJGrupo;
    property SpedFiscalOuPisCofins: string read FSpedFiscalOuPisCofins write FSpedFiscalOuPisCofins;
    property vBloco0: boolean read FBloco0 write FBloco0;
    property vBlocoA: boolean read FBlocoA write FBlocoA;
    property vBlocoC: boolean read FBlocoC write FBlocoC;
    property vBlocoD: boolean read FBlocoD write FBlocoD;
    property vBlocoF: boolean read FBlocoF write FBlocoF;
    property vBlocoE: boolean read FBlocoE write FBlocoE;
    property vBlocoG: boolean read FBlocoG write FBlocoG;
    property vBlocoH: boolean read FBlocoH write FBlocoH;
    property vBlocoK: boolean read FBlocoK write FBlocoK;
    property vBlocoM: boolean read FBlocoM write FBlocoM;
    property vBloco1: boolean read FBloco1 write FBloco1;
    property vBloco9: boolean read FBloco9 write FBloco9;
    property vRefazerCalculoPISCOFINS: Boolean read FRefazerCalculoPISCOFINS write FRefazerCalculoPISCOFINS;
    property vAlterarCST4998: Boolean read FAlterarCST4998 write FAlterarCST4998;
    property vValorCredPerAnt_Pis: Currency read FValorCredPerAnt_Pis write FValorCredPerAnt_Pis;
    property vValorCredPerAnt_Cofins: Currency read FValorCredPerAnt_Cofins write FValorCredPerAnt_Cofins;
    property vValorCredPerAnt_ICMS: Currency read FValorCredPerAnt_ICMS write FValorCredPerAnt_ICMS;
    property vValorCredPerAnt_IPI: Currency read FValorCredPerAnt_IPI write FValorCredPerAnt_IPI;
    property qrAux: TIBQuery read vQrAux write vQrAux;
    property CST_05_BaseZero: Boolean read FCST_05_BaseZero write FCST_05_BaseZero;
    property Produtos: TSpedHwProd read FProdutos write FProdutos;
  var
    FLabelStatus, FLabelBloco, FLabelCupons: TLabel;
    FProgressBar: TProgressBar;
    FProgressBar2: TProgressBar;
  end;

  TSingleton = class
    strict private
      constructor Create;
    class var FInstance: TSingleton;
    public class
    function GetInstance: TSingleton;
    function PesqPros(vCodProcesso, vAcao, vMensagem, vTabela, vCodigoTabMov: string;
      qrBusca: TIBQuery; vGravarAuditoria: boolean; pConfirmarContinuacao: Boolean = False): boolean;
    procedure GravaAuditoria(vCodProcesso, vAcao, vMensagem, vTabela, vCodigoTabMov: string;
      qrBusca: TIBQuery); overload;
    function codifica(wtexto: string): string;
    var
      vNomeUsuario, vCodEmpresa, vModoTreino,vInibeMensPesqPros: string;
      vNivel:Integer;
  end;

var
  vDadosIniSPED:  TSingleton;

implementation

uses
  SysUtils, Forms, ACBrEFDBloco_0, ACBRSpedFiscalUtilHw, ACBRSpedPISCOFINSUtilHw,
  Controls, ACBrEPCBloco_0, DB, ACBrEPCBlocos, ACBrEPCBloco_C, DateUtils, Windows,
  UPesProsSPED, IniFiles, StrUtils, Math, config_sistema_class, uClasseConexao, hw_utils,
  hw_win_utils, ean_utils, Query_OOP;

function __getSenhaFDB_DX: WideString; stdcall; external 'cons40.dll';
function __getUsuarioFDB_DX: WideString; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB_DX(pTexto: WideString): WideString; stdcall; external 'cons40.dll';
function _getMd5(Value: WideString): WideString; stdcall; external 'MD5XE3.dll';
function gravarAuditoria_DX(usuario, usuariogerenteliberou,
  processo, acao, mensagem, tabela, codigotabmov, cod_empresa: WideString): boolean; stdcall; external
  'hw.auditoria.dx.dll';

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
  vUs := __getUsuarioFDB_DX;
  vPw := __getSenhaFDB_DX;
  vConexao.Connected := False;
  if (Trim(vUs) <> '') then
    vConexao.Params[0] := 'user_name=' + __descriptografaTextoFDB_DX(vUs);
  if (Trim(vPw) <> '') then
    vConexao.Params[1] := 'password=' + __descriptografaTextoFDB_DX(vPw);
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
  if Assigned(FProdutos) then
    FreeAndNil(FProdutos);

  inherited;
end;

function TSpedHw.ExisteNotasPendentes: Boolean;
var
  advertencia: Boolean;
  list: TStrings;
  numerosNotasFiscais, S: string;
  utilsCnx: TConexao;
  queryCons: TQuery_OOP;
begin
  Result := False;

  utilsCnx := TConexao.Create(qrAux.Database);
  list := TStringList.Create;
  queryCons := QueryHelper.CreateObj(qrAux);
  try
    utilsCnx.Auditor.listauditoria.Clear;
    utilsCnx.InitAuditor(vDadosIniSPED.vNomeUsuario, StrToInt(CodEmpresa));

    {$REGION 'teste de notas fiscais com problemas'}
    vQrAux.Close;
    vQrAux.SQL.Text := 'select nf.natureza_nf,' +
                       ' case when ((nf.natureza_nf = ''E'') and (nf.num_gerado = ''S'')) or (nf.natureza_nf = ''S'')  then nf.emissao_propria' +
                       '      else ''N'' end emissao_propria,' +
                       ' case when nf.modelo_nf = ''55'' then ''S'' else ''N'' end nfe, nf.status, coalesce(nf.situacao_nfe, '''') situacao_nfe,' +
                       ' count(nf.num_nf) contador' +
                       ' from notafiscal nf' +
                       ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and nf.cod_empresa = :cod_empresa and nf.ativo = 1' +
                       ' group by 1,2,3,4,5';
    vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
    vQrAux.Open;
    while not vQrAux.Eof do
    begin
      advertencia := False;
      if vQrAux.FieldByName('status').AsString = 'Aberta' then
        advertencia := True
      else if vQrAux.FieldByName('status').AsString = 'Fechada' then
      begin
        if (vQrAux.FieldByName('nfe').AsString = 'S') and (vQrAux.FieldByName('emissao_propria').AsString = 'S') then
          if not MatchText(vQrAux.FieldByName('situacao_nfe').AsString, ['Autorizada']) then
            advertencia := True;
      end
      else if vQrAux.FieldByName('status').AsString = 'Cancelada' then
        if (vQrAux.FieldByName('nfe').AsString = 'S') and (vQrAux.FieldByName('emissao_propria').AsString = 'S') then
          if not MatchText(vQrAux.FieldByName('situacao_nfe').AsString, ['Cancelada', 'Inutilizada', 'Denegada']) then
            advertencia := True;

      if advertencia then
        list.Add(Format('%s %d %s de %s com status igual a "%s" emissão %s %s',
                  [IfThen(vQrAux.FieldByName('contador').AsInteger > 1, 'Existem', 'Existe'),
                   vQrAux.FieldByName('contador').AsInteger,
                   IfThen(vQrAux.FieldByName('contador').AsInteger > 1, 'notas fiscais', 'nota fiscal'),
                   IfThen(vQrAux.FieldByName('natureza_nf').AsString = 'S', 'saída', 'entrada'),
                   vQrAux.FieldByName('status').AsString,
                   IfThen(vQrAux.FieldByName('emissao_propria').AsString = 'S', 'própria', 'de terceiros'),
                   IfThen(vQrAux.FieldByName('emissao_propria').AsString = 'S', 'e situação igual a "' +
                          vQrAux.FieldByName('situacao_nfe').AsString + '"')])
                 );

      vQrAux.Next;
    end;

    if list.Count > 0 then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'select nf.natureza_nf,' +
                         ' case when ((nf.natureza_nf = ''E'') and (nf.num_gerado = ''S'')) or (nf.natureza_nf = ''S'')  then nf.emissao_propria' +
                         '      else ''N'' end emissao_propria,' +
                         ' case when nf.modelo_nf = ''55'' then ''S'' else ''N'' end nfe, nf.status, coalesce(nf.situacao_nfe, '''') situacao_nfe,' +
                         ' nf.num_nf' +
                         ' from notafiscal nf' +
                         ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and nf.cod_empresa = :cod_empresa and nf.ativo = 1';
      vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
      vQrAux.Open;

      numerosNotasFiscais := '';
      vQrAux.First;
      while not vQrAux.Eof do
      begin
        advertencia := False;
        if vQrAux.FieldByName('status').AsString = 'Aberta' then
          advertencia := True
        else if vQrAux.FieldByName('status').AsString = 'Fechada' then
        begin
          if (vQrAux.FieldByName('nfe').AsString = 'S') and (vQrAux.FieldByName('emissao_propria').AsString = 'S') then
            if not MatchText(vQrAux.FieldByName('situacao_nfe').AsString, ['Autorizada']) then
              advertencia := True;
        end
        else if vQrAux.FieldByName('status').AsString = 'Cancelada' then
          if (vQrAux.FieldByName('nfe').AsString = 'S') and (vQrAux.FieldByName('emissao_propria').AsString = 'S') then
            if not MatchText(vQrAux.FieldByName('situacao_nfe').AsString, ['Cancelada', 'Inutilizada', 'Denegada']) then
              advertencia := True;

        if advertencia then
          numerosNotasFiscais := numerosNotasFiscais + IfThen(numerosNotasFiscais <> '',   ', ') +
                                 vQrAux.FieldByName('num_nf').AsString;

        vQrAux.Next;
      end;

      if ShowConfirmacao('Foram encontrados registros de notas fiscais com problemas' + sLineBreak + sLineBreak +
                         list.Text + sLineBreak + sLineBreak +
                         'Por favor localize os registros e proceda com as devidas correções' + sLineBreak + sLineBreak +
                         'Relação de números das notas fiscais: ' + numerosNotasFiscais + sLineBreak +
                         'Empresa: ' + PadL(CodEmpresa, 3, '0') + sLineBreak + sLineBreak +
                         'Deseja continuar mesmo assim?') <> ID_YES then
      begin
        FStop := True;
        Exit;
      end
      else
      begin
        with utilsCnx.Auditor.listauditoria.New do
        begin
          cod_processo := IfThen(FSpedFiscalOuPisCofins = 'F', 'EFD019', 'EFD021');
          acao := 'VALIDAR';
          mensagem := Format('GERAR EFD %s COM PENDENCIAS EM NOTAFISCAL %s',
                             [IfThen(FSpedFiscalOuPisCofins = 'F', 'ICMS IPI', 'CONTRIBUIÇÕES'), FDataIni.Substring(3, 7)]);
          tabela := 'NOTAFISCAL';
        end;
      end;
    end;
    {$ENDREGION}

    {$REGION 'teste de notas fiscais de consumidor'}
    list.Clear;
    vQrAux.Close;
    vQrAux.SQL.Text := 'select' +
                       ' nfce.status, coalesce(nfce.situacao_nfce, '''') situacao_nfce,' +
                       ' count(nfce.cod_nfce) contador' +
                       ' from nfce' +
                       ' where nfce.data_lanc >= :dataIni and nfce.data_lanc <= :dataFim and nfce.cod_empresa = :cod_empresa and nfce.ativo = 1' +
                       ' group by 1,2';
    vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
    vQrAux.Open;
    while not vQrAux.Eof do
    begin
      advertencia := False;
      if MatchText(vQrAux.FieldByName('status').AsString, ['Aberta', 'Fechando', 'A Cancelar']) then
        advertencia := True
      else if (vQrAux.FieldByName('status').AsString = 'Fechada') and
              (not MatchText(vQrAux.FieldByName('situacao_nfce').AsString, ['Autorizada'])) then
        advertencia := True
      else if (vQrAux.FieldByName('status').AsString = 'Cancelada') and
              (not MatchText(vQrAux.FieldByName('situacao_nfce').AsString, ['Cancelada', 'Inutilizada', 'Denegada'])) then
        advertencia := True;

      if advertencia then
        list.Add(Format('%s %d %s com status igual a "%s" e situação igual a "%s"',
                  [IfThen(vQrAux.FieldByName('contador').AsInteger > 1, 'Existem', 'Existe'),
                   vQrAux.FieldByName('contador').AsInteger,
                   IfThen(vQrAux.FieldByName('contador').AsInteger > 1, 'NFC-e''s', 'NFC-e'),
                   vQrAux.FieldByName('status').AsString,
                   vQrAux.FieldByName('situacao_nfce').AsString]));
      vQrAux.Next;
    end;

    if list.Count > 0 then
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'select' +
                         ' nfce.status, coalesce(nfce.situacao_nfce, '''') situacao_nfce,' +
                         ' nfce.num_nf' +
                         ' from nfce' +
                         ' where nfce.data_lanc >= :dataIni and nfce.data_lanc <= :dataFim and nfce.cod_empresa = :cod_empresa and nfce.ativo = 1' +
                         ' and nfce.num_nf > 0';
      vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
      vQrAux.Open;

      numerosNotasFiscais := '';
      vQrAux.First;
      while not vQrAux.Eof do
      begin
        advertencia := False;
        if MatchText(vQrAux.FieldByName('status').AsString, ['Aberta', 'Fechando']) then
          advertencia := True
        else if (vQrAux.FieldByName('status').AsString = 'Fechada') and
                (not MatchText(vQrAux.FieldByName('situacao_nfce').AsString, ['Autorizada'])) then
          advertencia := True
        else if (vQrAux.FieldByName('status').AsString = 'Cancelada') and
                (not MatchText(vQrAux.FieldByName('situacao_nfce').AsString, ['Cancelada', 'Inutilizada', 'Denegada'])) then
          advertencia := True;

        if advertencia then
          numerosNotasFiscais := numerosNotasFiscais + IfThen(numerosNotasFiscais <> '',   ', ') +
                                 vQrAux.FieldByName('num_nf').AsString;

        vQrAux.Next;
      end;

      if ShowConfirmacao('Foram encontrados registros de NFC-e com problemas' + sLineBreak + sLineBreak +
                         list.Text + sLineBreak + sLineBreak +
                         'Por favor localize os registros e proceda com as devidas correções' + sLineBreak + sLineBreak +
                         'Relação de números das NFC-e''s: ' + numerosNotasFiscais + sLineBreak +
                         'Empresa: ' + PadL(CodEmpresa, 3, '0') + sLineBreak + sLineBreak +
                         'Deseja continuar mesmo assim?') <> ID_YES then
      begin
        Result := True;
        Exit;
      end
      else
      begin
        with utilsCnx.Auditor.listauditoria.New do
        begin
          cod_processo := IfThen(FSpedFiscalOuPisCofins = 'F', 'EFD020', 'EFD022');
          acao := 'VALIDAR';
          mensagem := Format('GERAR EFD %s COM PENDENCIAS EM NFCE %s',
                             [IfThen(FSpedFiscalOuPisCofins = 'F', 'ICMS IPI', 'CONTRIBUIÇÕES'),FDataIni.Substring(3, 7)]);
          tabela := 'NFCE';
        end;
      end;
    end;
    {$ENDREGION}

    if FSpedFiscalOuPisCofins = 'PC' then
    begin
      queryCons.SQL(
        'select ' +
        ' situacao, list(nfse.seqid) codigos, count(id) contador ' +
        ' from nfse ' +
        ' where dhemi between :dataIni and :dataFim and cod_empresa = :cod_empresa ' +
        ' and situacao in (1,2,3,4) ' +
        ' group by 1 ')
      .ParamAsDateTime('dataFim', StrToDate(FDataIni))
      .ParamAsDateTime('dataFim', StrToDate(FDataFim))
      .ParamValue('cod_empresa', StrToInt(FCodEmpresa))
      .Open();

      list.Clear();
      while not queryCons.Eof do
      begin
        //SituacaoNFSeEnum = (sdpsExcluido,
        // sdpsRascunho, sdpsRejeicao, sdpsEmissao, sdpsEmProcessamento,
        //sdpsAutorizada, sdpsCancelada, sdpsSubstituida );
        S := '';
        case queryCons.fint('situacao') of
          1: S := 'Rascunho';
          2: S := 'Rejeição';
          3: S := 'Emissão';
          4: S := 'Em Processamento';
        end;
        list.Add( Format('Qtde: %d - Situação: %s', [ queryCons.fint('contador'), S ]));
        list.Add( Format('Codigos: %s', [ queryCons.fstr('codigos') ]));
        list.Add('--');

        queryCons.Next();
      end;

      if list.Count > 0 then
      begin
        if ShowConfirmacao('Foram encontrados registros de NFS-e com problemas' + sLineBreak + sLineBreak +
                           list.Text + sLineBreak + sLineBreak +
                           'Por favor localize os registros e proceda com as devidas correções' + sLineBreak + sLineBreak +
                           'Empresa: ' + PadL(CodEmpresa, 3, '0') + sLineBreak + sLineBreak +
                           'Deseja continuar mesmo assim?') <> ID_YES then
        begin
          Result := True;
          Exit;
        end
        else
        begin
          with utilsCnx.Auditor.listauditoria.New do
          begin
            cod_processo := 'EFD023';
            acao := 'VALIDAR';
            mensagem := Format('GERAR EFD CONTRIBUIÇÕES COM PENDENCIAS EM NFSE %s', [ FDataIni.Substring(3, 7) ]);
            tabela := 'NFSE';
          end;
        end;
      end;
    end;

    if utilsCnx.Auditor.listauditoria.Count > 0 then
    begin
      utilsCnx.Auditor.CodProcesso := '';
      if not utilsCnx.Auditor.Permitido then
      begin
        Result := True;
        Exit;
      end;
    end;

  finally
    queryCons.Free();
    utilsCnx.Free;
    list.Free;
  end;
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

function TSpedHw.getCampoPipe(plinha: string; pOrdem: integer;
  pDelimiter: string): string;
var
  vTemp: string;
  vInc: Smallint;
begin
  // recebe uma string como parametro separados por um delimitador,
  // toda vez que encontrar um delimitador quer dizer que vai ser 1 item na string
  // Ex: "1|nome|endereco|", onde a string possui 3 itens
  // sempre finalizar com o delimitador
  // veja tambem a funcao getValue
  vTemp := plinha;
  vInc := 0;
  while pos(pDelimiter, vTemp) > 0 do
  begin
    inc(vInc);
    if pOrdem = vInc then
    begin
      vTemp := Copy(vTemp, 1, pos(pDelimiter, vTemp) - 1);
      Result := Trim(vTemp);
      exit;
    end;
    vTemp := Copy(vTemp, pos(pDelimiter, vTemp) + 1, length(vTemp));
  end;
  Result := '';
end;

function TSpedHw.getValueFromList(IndexTest, IndexValue: Integer;
  ValueTest: string; List: TStringList): string;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to List.Count - 1 do
    if Trim(getCampoPipe(List[i], IndexTest)) = Trim(ValueTest) then
    begin
      Result := Trim(getCampoPipe(List[i], IndexValue));
      Break;
    end;
end;

function TSpedHw.getConfSisBlob(pChave: string; pBuscas: TIBQuery): TStrings;
begin
  Result := TStringList.Create;
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_b retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + FCodEmpresa;
  pBuscas.Open;

  Result.Text := pBuscas.FieldByName('retorno').AsString;
end;

function TSpedHw.getConfSisBool(pChave: string; pBuscas: TIBQuery): Boolean;
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_f retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + FCodEmpresa;
  pBuscas.Open;

  Result := Trunc(pBuscas.FieldByName('retorno').AsFloat) = 1;
end;

function TSpedHw.getConfSisInt(pChave: string; pBuscas: TIBQuery): Integer;
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_f retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + fcodEmpresa;
  pBuscas.Open;

  Result := Trunc(pBuscas.FieldByName('retorno').AsFloat);
end;

procedure TSpedHw.getCreditoPeriodoAnterior(pData: string; pCNPJ: string);
var
  vCNPJ: string;
begin
  FValorCredPerAnt_Pis := 0;
  FValorCredPerAnt_Cofins := 0;
  FValorCredPerAnt_ICMS := 0;

  if not conectarBanco then
    Exit;
  vQrAux.Close;
  if FSpedFiscalOuPisCofins = 'PC' then
    vQrAux.SQL.Text := 'select cgc_emp cnpj from empresa e' +
      ' where e.gerar_sped_piscofins = ''S'' and e.sped_matriz_filial = ''M''' +
      ' and e.cgc_emp like ' + QuotedStr(pCNPJ + '%') + ' order by e.cod_empresa'
  else
    vQrAux.SQL.Text := 'select cgc_emp cnpj from empresa e' +
      ' where e.cod_empresa = ' + FCodEmpresa;
  vQrAux.Open;
  if FSpedFiscalOuPisCofins = 'PC' then
    vCNPJ := Trim(Copy(Trim(vQrAux.FieldByName('cnpj').AsString), 1, 8))
  else
    vCNPJ := Trim(vQrAux.FieldByName('cnpj').AsString);
  vQrAux.Close;
  vQrAux.SQL.Text := 'select cnpj, valor_pis, valor_cofins, valor_icms, valor_pis_util, valor_cofins_util from sped_creditos_periodo' +
    ' where sped = ' + QuotedStr(FSpedFiscalOuPisCofins) +
    ' and cnpj = ' + QuotedStr(vCNPJ) +
    ' and mes = :mes and ano = :ano';
  vQrAux.ParamByName('mes').AsInteger := MonthOf(IncMonth(StrToDate(pData), -1));
  vQrAux.ParamByName('ano').AsInteger := YearOf(IncMonth(StrToDate(pData), -1));
  vQrAux.Open;
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    FValorCredPerAnt_ICMS := vQrAux.FieldByName('valor_icms').AsFloat;

    vQrAux.Close;
    vQrAux.SQL.Text := 'select cnpj, valor_pis, valor_cofins, valor_icms, valor_pis_util, valor_cofins_util from sped_creditos_periodo' +
      ' where sped = ' + QuotedStr('IPI') +
      ' and cnpj = ' + QuotedStr(vCNPJ) +
      ' and mes = :mes and ano = :ano';
    vQrAux.ParamByName('mes').AsInteger := MonthOf(IncMonth(StrToDate(pData), -1));
    vQrAux.ParamByName('ano').AsInteger := YearOf(IncMonth(StrToDate(pData), -1));
    vQrAux.Open;
    FValorCredPerAnt_IPI := vQrAux.FieldByName('valor_icms').AsFloat;
  end
  else if FSpedFiscalOuPisCofins = 'PC' then
  begin
    FValorCredPerAnt_Pis := vQrAux.FieldByName('valor_pis').AsFloat;
    FValorCredPerAnt_Cofins := vQrAux.FieldByName('valor_cofins').AsFloat;
  end;
end;

function TSpedHw.GetIni(pChave, pIdentificador, pValorDefault: string;
  IniText: TStrings): string;
var
  I: Integer;
  ChaveAtiva, IdentificadorAtivo: Boolean;
  Chave, Identificador: string;
begin
  Result := pValorDefault;
  try
    Chave := Trim(UpperCase(pChave));
    Identificador := Trim(UpperCase(pIdentificador));
    ChaveAtiva := False;
    IdentificadorAtivo := False;
    for I := 0 to IniText.Count - 1 do
    begin
      if not ChaveAtiva then
        if Pos('[' + Trim(Chave) + ']', UpperCase(Trim(IniText[I]))) = 1 then
          ChaveAtiva := True;

      if ChaveAtiva then
        if Pos('=', IniText[I]) > 0 then
          if Identificador = Trim(UpperCase(Copy(IniText[I], 1, Pos('=', IniText[I]) - 1))) then
          begin
            Result := Trim(IniText[I]);
            Result := Copy(Result, Pos('=', Result) + 1, Length(Result));
          end;
    end;
  except on E: Exception do
    Application.MessageBox(PChar('Erro ao ler configuracao ' +'[' + pChave + '] -> ' + pIdentificador + ' = ' + #13 +
      'Conf abaixo ' + #13 + #13 + IniText.Text + #13 +
      'Erro: ' + E.Message), 'Atenção', 0 + 64);
  end;
end;

function TSpedHw.GetLogGeral: string;
begin
  if not MatchText(Floggeral, ['S', 'N', 'D']) then
  begin
    Floggeral := IniConf.ReadStr('Sistema', 'Loggeral', 'N');
    Floggeral := IfThen(MatchText(Floggeral, ['S', 'N', 'D']), Floggeral, 'N');
  end;

  Result := Floggeral;
end;

function TSpedHw.getParticipante(codigo, cpfcnpj: string): string;
var
  I: Integer;
begin
  for I := 0 to FParticipantes.Count - 1 do
    if Trim(copy(FParticipantes[i], pos('|', FParticipantes[i]) + 1, length(FParticipantes[i])))
      = (Trim(cpfcnpj)) then
    begin
      Result := Copy(FParticipantes[i], 1, pos('|', FParticipantes[i]) - 1);
      Exit;
    end;
  FParticipantes.Add(Trim(codigo) + '|' + Trim(cpfcnpj));
  Result := '';
end;

function TSpedHw.getValue(pStr: string; pPos: integer;
  pDelimiter: string): string;
begin
  pStr := Trim(Copy(pStr, 2, Length(pStr)));
  Result := getCampoPipe(pStr, pPos, pDelimiter);
end;

procedure TSpedHw.gravaCreditoDoPeriodo;
var
  vGravar: Boolean;
  vSql: string;
  vCNPJ: string;
begin
  vCNPJ := FCNPJEmpresa;
  if FSpedFiscalOuPisCofins = 'PC' then
    vCNPJ := Trim(Copy(Trim(vCNPJ), 1, 8));

  if Trim(vCNPJ) = '' then
    Exit;

  vQrAux.Close;
  vQrAux.SQL.Text := 'select cnpj, valor_pis, valor_cofins, valor_icms from sped_creditos_periodo' +
    ' where sped = ' + QuotedStr(FSpedFiscalOuPisCofins) +
    ' and cnpj = ' + QuotedStr(vCNPJ) +
    ' and mes = :mes and ano = :ano';
  vQrAux.ParamByName('mes').AsInteger := MonthOf(StrToDate(FDataFim));
  vQrAux.ParamByName('ano').AsInteger := YearOf(StrToDate(FDataFim));
  vQrAux.Open;

  if FSpedFiscalOuPisCofins = 'F' then
  begin
    if not vQrAux.IsEmpty then
      if StrToFloatFormat(vQrAux.FieldByName('valor_icms').AsFloat, 2) <> StrToFloatFormat(FValorCredFuturo_ICMS, 2) then
        if Application.MessageBox(PChar('Valor do Crédito de ICMS do mês ' + IntToStr(MonthOf(StrToDate(FDataFim))) +
          ' de ' + IntToStr(YearOf(StrToDate(FDataFim))) + ' (período desta apuração) difere do já gravado' + #13 + #13 +
          'Já gravado: ' + Format('%0.2n', [vQrAux.FieldByName('valor_icms').AsFloat]) + #13 +
          'Do período: ' + Format('%0.2n', [FValorCredFuturo_ICMS]) + #13 + #13 +
          'Deseja gravar o valor do período apurado agora?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
    if vQrAux.IsEmpty then
      vSql := 'insert into SPED_CREDITOS_PERIODO (SPED, CNPJ, MES, ANO, VALOR_ICMS)' +
        ' values (:SPED, :CNPJ, :MES, :ANO, :VALOR_ICMS)'
    else
      vSql := 'update SPED_CREDITOS_PERIODO set VALOR_ICMS = :VALOR_ICMS' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO';
    vQrAux.Close;
    vQrAux.SQL.Text := vSql;
    vQrAux.ParamByName('SPED').AsString := FSpedFiscalOuPisCofins;
    vQrAux.ParamByName('CNPJ').AsString := vCNPJ;
    vQrAux.ParamByName('MES').AsInteger := MonthOf(StrToDate(FDataFim));
    vQrAux.ParamByName('ANO').AsInteger := YearOf(StrToDate(FDataFim));
    vQrAux.ParamByName('VALOR_ICMS').AsFloat := FValorCredFuturo_ICMS;
    vQrAux.ExecSQL;

    vQrAux.Close;
    vQrAux.SQL.Text := 'select cnpj, valor_pis, valor_cofins, valor_icms from sped_creditos_periodo' +
      ' where sped = ' + QuotedStr('IPI') +
      ' and cnpj = ' + QuotedStr(vCNPJ) +
      ' and mes = :mes and ano = :ano';
    vQrAux.ParamByName('mes').AsInteger := MonthOf(StrToDate(FDataFim));
    vQrAux.ParamByName('ano').AsInteger := YearOf(StrToDate(FDataFim));
    vQrAux.Open;

    if not vQrAux.IsEmpty then
      if StrToFloatFormat(vQrAux.FieldByName('valor_icms').AsFloat, 2) <> StrToFloatFormat(FValorCredFuturo_IPI, 2) then
        if Application.MessageBox(PChar('Valor do Crédito de IPI do mês ' + IntToStr(MonthOf(StrToDate(FDataFim))) +
          ' de ' + IntToStr(YearOf(StrToDate(FDataFim))) + ' (período desta apuração) difere do já gravado' + #13 + #13 +
          'Já gravado: ' + Format('%0.2n', [vQrAux.FieldByName('valor_icms').AsFloat]) + #13 +
          'Do período: ' + Format('%0.2n', [FValorCredFuturo_IPI]) + #13 + #13 +
          'Deseja gravar o valor do período apurado agora?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
    if vQrAux.IsEmpty then
      vSql := 'insert into SPED_CREDITOS_PERIODO (SPED, CNPJ, MES, ANO, VALOR_ICMS)' +
        ' values (:SPED, :CNPJ, :MES, :ANO, :VALOR_ICMS)'
    else
      vSql := 'update SPED_CREDITOS_PERIODO set VALOR_ICMS = :VALOR_ICMS' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO';
    vQrAux.Close;
    vQrAux.SQL.Text := vSql;
    vQrAux.ParamByName('SPED').AsString := 'IPI';
    vQrAux.ParamByName('CNPJ').AsString := vCNPJ;
    vQrAux.ParamByName('MES').AsInteger := MonthOf(StrToDate(FDataFim));
    vQrAux.ParamByName('ANO').AsInteger := YearOf(StrToDate(FDataFim));
    vQrAux.ParamByName('VALOR_ICMS').AsFloat := FValorCredFuturo_IPI;
    vQrAux.ExecSQL;

    if vQrAux.Transaction.InTransaction then
      vQrAux.Transaction.Commit;
  end
  else
  begin
    if not vQrAux.IsEmpty then
      if (StrToFloatFormat(vQrAux.FieldByName('valor_pis').AsFloat, 2) <> StrToFloatFormat(FValorCredFuturo_Pis, 2)) or
      (StrToFloatFormat(vQrAux.FieldByName('valor_cofins').AsFloat, 2) <> StrToFloatFormat(FValorCredFuturo_Cofins, 2)) then
        if Application.MessageBox(PChar('Valor do Crédito de PIS ou COFINS do mês ' + IntToStr(MonthOf(StrToDate(FDataFim))) +
          ' de ' + IntToStr(YearOf(StrToDate(FDataFim))) + ' (período desta apuração) difere do já gravado' + #13 + #13 +
          'PIS já gravado: ' + Format('%0.2n', [vQrAux.FieldByName('valor_pis').AsFloat]) + #13 +
          'PIS do período: ' + Format('%0.2n', [FValorCredFuturo_Pis]) + #13 + #13 +
          'COFINS já gravado: ' + Format('%0.2n', [vQrAux.FieldByName('valor_cofins').AsFloat]) + #13 +
          'COFINS do período: ' + Format('%0.2n', [FValorCredFuturo_Cofins]) + #13 + #13 +
          'Deseja gravar os valores do período apurado agora?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;

    if vQrAux.IsEmpty then
      vSql := 'insert into SPED_CREDITOS_PERIODO (SPED, CNPJ, MES, ANO, VALOR_PIS, VALOR_COFINS)' +
        ' values (:SPED, :CNPJ, :MES, :ANO, :VALOR_PIS, :VALOR_COFINS)'
    else
      vSql := 'update SPED_CREDITOS_PERIODO set VALOR_PIS = :VALOR_PIS, VALOR_COFINS = :VALOR_COFINS' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO';
    vQrAux.Close;
    vQrAux.SQL.Text := vSql;
    vQrAux.ParamByName('SPED').AsString := FSpedFiscalOuPisCofins;
    vQrAux.ParamByName('CNPJ').AsString := vCNPJ;
    vQrAux.ParamByName('MES').AsInteger := MonthOf(StrToDate(FDataFim));
    vQrAux.ParamByName('ANO').AsInteger := YearOf(StrToDate(FDataFim));
    vQrAux.ParamByName('VALOR_PIS').AsFloat := FValorCredFuturo_Pis;
    vQrAux.ParamByName('VALOR_COFINS').AsFloat := FValorCredFuturo_Cofins;
    vQrAux.ExecSQL;

    if vQrAux.Transaction.InTransaction then
      vQrAux.Transaction.Commit;
  end;

  vQrAux.Close;
  vQrAux.SQL.Text := 'select cnpj, valor_pis, valor_cofins, valor_icms from sped_creditos_periodo' +
    ' where sped = ' + QuotedStr(FSpedFiscalOuPisCofins) +
    ' and cnpj = ' + QuotedStr(vCNPJ) +
    ' and mes = :mes and ano = :ano';
  vQrAux.ParamByName('mes').AsInteger := MonthOf(IncMonth(StrToDate(FDataIni), -1));
  vQrAux.ParamByName('ano').AsInteger := YearOf(IncMonth(StrToDate(FDataIni), -1));
  vQrAux.Open;

  if FSpedFiscalOuPisCofins = 'F' then
  begin
    if not vQrAux.IsEmpty then
      if StrToFloatFormat(vQrAux.FieldByName('valor_icms').AsFloat, 2) <> StrToFloatFormat(FValorCredPerAnt_ICMS, 2) then
        if Application.MessageBox(PChar('Valor do Crédito de ICMS do mês ' + IntToStr(MonthOf(IncMonth(StrToDate(FDataIni), -1))) +
          ' de ' + IntToStr(YearOf(IncMonth(StrToDate(FDataIni), -1))) + ' (período anterior) difere do já gravado' + #13 + #13 +
          'Já gravado: ' + Format('%0.2n', [vQrAux.FieldByName('valor_icms').AsFloat]) + #13 +
          'Do período: ' + Format('%0.2n', [FValorCredPerAnt_ICMS]) + #13 + #13 +
          'Deseja gravar o valor do período anterior agora?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
    if vQrAux.IsEmpty then
      vSql := 'insert into SPED_CREDITOS_PERIODO (SPED, CNPJ, MES, ANO, VALOR_ICMS)' +
        ' values (:SPED, :CNPJ, :MES, :ANO, :VALOR_ICMS)'
    else
      vSql := 'update SPED_CREDITOS_PERIODO set VALOR_ICMS = :VALOR_ICMS' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO';
    vQrAux.Close;
    vQrAux.SQL.Text := vSql;
    vQrAux.ParamByName('SPED').AsString := FSpedFiscalOuPisCofins;
    vQrAux.ParamByName('CNPJ').AsString := vCNPJ;
    vQrAux.ParamByName('MES').AsInteger := MonthOf(IncMonth(StrToDate(FDataIni), -1));
    vQrAux.ParamByName('ANO').AsInteger := YearOf(IncMonth(StrToDate(FDataIni), -1));
    vQrAux.ParamByName('VALOR_ICMS').AsFloat := FValorCredPerAnt_ICMS;
    vQrAux.ExecSQL;

    vQrAux.Close;
    vQrAux.SQL.Text := 'select cnpj, valor_pis, valor_cofins, valor_icms from sped_creditos_periodo' +
      ' where sped = ' + QuotedStr('IPI') +
      ' and cnpj = ' + QuotedStr(vCNPJ) +
      ' and mes = :mes and ano = :ano';
    vQrAux.ParamByName('mes').AsInteger := MonthOf(IncMonth(StrToDate(FDataIni), -1));
    vQrAux.ParamByName('ano').AsInteger := YearOf(IncMonth(StrToDate(FDataIni), -1));
    vQrAux.Open;

    if not vQrAux.IsEmpty then
      if StrToFloatFormat(vQrAux.FieldByName('valor_icms').AsFloat, 2) <> StrToFloatFormat(FValorCredPerAnt_IPI, 2) then
        if Application.MessageBox(PChar('Valor do Crédito de IPI do mês ' + IntToStr(MonthOf(IncMonth(StrToDate(FDataIni), -1))) +
          ' de ' + IntToStr(YearOf(IncMonth(StrToDate(FDataIni), -1))) + ' (período anterior) difere do já gravado' + #13 + #13 +
          'Já gravado: ' + Format('%0.2n', [vQrAux.FieldByName('valor_icms').AsFloat]) + #13 +
          'Do período: ' + Format('%0.2n', [FValorCredPerAnt_IPI]) + #13 + #13 +
          'Deseja gravar o valor do período anterior agora?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
    if vQrAux.IsEmpty then
      vSql := 'insert into SPED_CREDITOS_PERIODO (SPED, CNPJ, MES, ANO, VALOR_ICMS)' +
        ' values (:SPED, :CNPJ, :MES, :ANO, :VALOR_ICMS)'
    else
      vSql := 'update SPED_CREDITOS_PERIODO set VALOR_ICMS = :VALOR_ICMS' +
        ' where SPED = :SPED and CNPJ = :CNPJ and MES = :MES and ANO = :ANO';
    vQrAux.Close;
    vQrAux.SQL.Text := vSql;
    vQrAux.ParamByName('SPED').AsString := 'IPI';
    vQrAux.ParamByName('CNPJ').AsString := vCNPJ;
    vQrAux.ParamByName('MES').AsInteger := MonthOf(IncMonth(StrToDate(FDataIni), -1));
    vQrAux.ParamByName('ANO').AsInteger := YearOf(IncMonth(StrToDate(FDataIni), -1));
    vQrAux.ParamByName('VALOR_ICMS').AsFloat := FValorCredPerAnt_IPI;
    vQrAux.ExecSQL;

    if vQrAux.Transaction.InTransaction then
      vQrAux.Transaction.Commit;
  end
  else if FCreditosAnteriores <> nil then
  begin
    try
      FCreditosAnteriores.Filter := 'PIS_AT_UTIL > 0 OR COFINS_AT_UTIL > 0';
      FCreditosAnteriores.Filtered := True;

      FCreditosAnteriores.First;
      while not FCreditosAnteriores.Eof do
      begin
        vQrAux.Close;
        vQrAux.SQL.Text := 'insert into SPED_CREDITOS_PERIODO_UTIL (SPED, CNPJ, MES, ANO, MES_UTIL, ANO_UTIL, VALOR_PIS_UTIL, VALOR_COFINS_UTIL)' +
          ' values (:SPED, :CNPJ, :MES, :ANO, :MES_UTIL, :ANO_UTIL, :VALOR_PIS_UTIL, :VALOR_COFINS_UTIL)';
        vQrAux.ParamByName('SPED').AsString := FSpedFiscalOuPisCofins;
        vQrAux.ParamByName('CNPJ').AsString := vCNPJ;
        vQrAux.ParamByName('MES').AsInteger := FCreditosAnteriores.FieldByName('MES').AsInteger;
        vQrAux.ParamByName('ANO').AsInteger := FCreditosAnteriores.FieldByName('ANO').AsInteger;
        vQrAux.ParamByName('MES_UTIL').AsInteger := MonthOf(StrToDate(FDataIni));
        vQrAux.ParamByName('ANO_UTIL').AsInteger := YearOf(StrToDate(FDataIni));
        vQrAux.ParamByName('VALOR_PIS_UTIL').AsFloat := FCreditosAnteriores.FieldByName('PIS_AT_UTIL').AsFloat;
        vQrAux.ParamByName('VALOR_COFINS_UTIL').AsFloat := FCreditosAnteriores.FieldByName('COFINS_AT_UTIL').AsFloat;
        vQrAux.ExecSQL;    

        if vQrAux.Transaction.InTransaction then
          vQrAux.Transaction.Commit;
        FCreditosAnteriores.Next;
      end;
    finally
      FCreditosAnteriores.Filter := '';
      FCreditosAnteriores.Filtered := False;
    end;
  end;
  vQrAux.Close;
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

      if tipo = 'P' then
      begin
        vQrAux.Close;
        vQrAux.SQL.Text := 'update produtos_alteracoes set MOV_SPED = ' + QuotedStr(Copy(FDataIni, 4, 7)) +
          ' where grupo_prod = ' + IntToStr(grupo_prod) +
          ' and cod_prod = ' + QuotedStr(cod_prod) +
          ' and cod_empresa =  ' + FCodEmpresa +
          ' and mov_sped is null' +
          ' and data_alteracao < :dataFimSped'; // teste do campo dt_fim no registro 0205
        vQrAux.ParamByName('dataFimSped').AsDate := StrToDate(FDataFim);
        vQrAux.ExecSQL;

        if (FRegistro0221) and (FSpedFiscalOuPisCofins = 'F') and Assigned(Produtos) then
          AddProdCodigos0221(grupo_prod, cod_prod.Trim);
      end;
    end;

//    if tipo = 'P' then
//      if Assigned(Produtos) then
//        Produtos.AddProduto(grupo_prod, cod_prod, unid);

  except
    on e: exception do begin
      Result := False;
      Application.MessageBox(pchar('Erro ao gravar item para o tipo 200. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

procedure TSpedHw.AddProdCodigos0221(grupoProd: Integer; codProd: string);
var
  news0200: TSpedHwProd;
  prod, mprima: TReg0200;
  codComerc: TReg0221;
  queryOOP: TQuery_OOP;
  existeIndTec, existeSpedItem: Boolean;
  I: Integer;
  sList: TStrings;
begin
  prod := FProdutos.Prods[grupoProd, codProd];

  if prod <> nil then
    Exit;

  queryOOP := QueryHelper.CreateObj(vQrAux);
  try
    queryOOP.Close
      .Table('produtos p', 'p.grupo_prod, p.cod_prod, p.unidade, p.consumo, p.tipo_item tp_itsped, idt.grupo_prod_mprima, idt.cod_prod_mprima, idt.quant,' +
                           ' p1.unidade und_mprima, si.tipo, smp.tipo tipo_mp')
      .Join('indice_tecnico idt', 'idt.grupo_prod_acabado = p.grupo_prod and idt.cod_prod_acabado = p.cod_prod and idt.cod_empresa = p.cod_empresa', TSqlJoin.sqLeft)
      .Join('produtos p1', 'p1.grupo_prod = idt.grupo_prod_mprima and p1.cod_prod = idt.cod_prod_mprima and p1.cod_empresa = idt.cod_empresa', TSqlJoin.sqLeft)
      .Join('sped_item si', 'si.grupo_prod = p.grupo_prod and si.cod_prod = p.cod_prod and si.cod_empresa = p.cod_empresa and si.tipo = ''P''', TSqlJoin.sqLeft)
      .Join('sped_item smp', 'smp.grupo_prod = idt.grupo_prod_mprima and smp.cod_prod = idt.cod_prod_mprima and smp.cod_empresa = idt.cod_empresa and smp.tipo = ''P''', TSqlJoin.sqLeft)
      .Equals('p.grupo_prod', grupoProd)
      .Equals('p.cod_prod', codProd.Trim)
      .Equals('p.cod_empresa', StrToInt(FCodEmpresa))
      .Open()
      .First();

    if queryOOP.IsEmpty or queryOOP.fequals('consumo', 'S') or (not MatchText(queryOOP.fstr('tp_itsped'), ['', '00'])) then
      Exit;

    existeIndTec   := queryOOP.fdif('cod_prod_mprima', ''); // Veio de registros como o C170, entao precisamos gravar pelo menos 1 0221
    existeSpedItem := queryOOP.fequals('tipo', 'P');

    if (not existeSpedItem) and (not existeIndTec) then
      Exit;

    prod := FProdutos.Prods[grupoProd, codProd.Trim];

    if prod <> nil then // Já foi adicionado eu outro momento, não precisa continuar
      Exit;

    prod := TReg0200.Create;

    prod.Grupo_prod := grupoProd;
    prod.Cod_prod   := codProd.Trim;
    prod.Unid       := queryOOP.fstr('unidade');
    prod.Tipo       := TSpedHWTipo0200.t0200Prod;

    news0200 := TSpedHwProd.Create;
    sList := NewStringList();
    try

      if not existeSpedItem then
      begin
        mprima            := TReg0200.Create;
        mprima.Grupo_prod := prod.Grupo_prod;
        mprima.Cod_prod   := prod.Cod_prod;
        mprima.Unid       := prod.Unid;

        news0200.Add(mprima);
      end;

      while not queryOOP.Eof do
      begin

        if not queryOOP.fempty('cod_prod_mprima') then
        begin

          codComerc := TReg0221.Create;
          codComerc.CodigoAtomico := 'P' + StrZero(queryOOP.fstr('grupo_prod_mprima') + queryOOP.fstr('cod_prod_mprima'), 16);
          codComerc.Quantidade := queryOOP.ffloat('quant');

          prod.CodigosComerc.Add(codComerc);

          existeSpedItem := queryOOP.fequals('tipo_mp', 'P');

          if (not existeSpedItem) and (sList.IndexOf(codComerc.CodigoAtomico) = -1) then
          begin
            mprima            := TReg0200.Create;
            mprima.Grupo_prod := queryOOP.fint('grupo_prod_mprima');
            mprima.Cod_prod   := queryOOP.fstr('cod_prod_mprima');
            mprima.Unid       := queryOOP.fstr('und_mprima');

            news0200.Add(mprima);
            sList.Add(codComerc.CodigoAtomico);
          end;
        end;

        queryOOP.Next;
      end;


      for I := 0 to news0200.Count - 1 do
      begin
        queryOOP.Close
          .SQL('INSERT INTO SPED_ITEM (COD_EMPRESA, TIPO, GRUPO_PROD, COD_PROD, CHASSI, COD_SERVICO, COD_OUTRAS, UNID)' +
               ' VALUES (:COD_EMPRESA, ''P'', :GRUPO_PROD, :COD_PROD, '''', 0, '''', :UNID)')
          .ParamValue('COD_EMPRESA', StrToInt(FCodEmpresa))
          .ParamValue('GRUPO_PROD', news0200.Items[I].Grupo_prod)
          .ParamValue('COD_PROD', news0200.Items[I].Cod_prod)
          .ParamValue('UNID', news0200.Items[I].Unid)
          .ExecSQL();
      end;

    finally
      news0200.Free;
      sList.Free;
    end;

    FProdutos.Add(prod);

  finally
    queryOOP.Free;
  end;
end;

procedure TSpedHw.logs(Atext, Afilename: string; Asingleline: Boolean;
  AtimeStart: TDateTime);
var
  Afile: TextFile;
  Adir, Alogname, Atimestr: string;
begin
  if not MatchText(GetLogGeral, ['S', 'D']) then
    Exit;

  FlogStore.filename   := Afilename;
  FlogStore.timeStarted := Now;

  try
    Atimestr := '';
    if AtimeStart > 0 then
    begin
      if (Now - AtimeStart) >= 1  then
      begin
        Atimestr := IntToStr(Trunc(Now - AtimeStart));
        AtimeStart := (Now - AtimeStart) - Trunc(Now - AtimeStart);
        Atimestr := Atimestr + ' dia(s) ' + FormatDateTime('hh:mm:ss.zzz', AtimeStart);
      end
      else
        Atimestr := FormatDateTime('hh:mm:ss.zzz', Now - AtimeStart);
    end;

    Alogname := ExtractFileName(Afilename);
    if Floggeral = 'S' then //Simplificado, Unico arquivo, com o nome da classe
      if Pos('.', Afilename) > 0 then
        System.Delete(Afilename, Pos('.', Afilename), Length(Afilename));

    Adir := ExtractFilePath(Application.ExeName) + 'log\' +
            FormatDateTime('YYYY-MM-DD', Date) + '\';

    ForceDirectories(ExtractFilePath(Adir));

    Afilename := Adir + '\' + Afilename + '.log';

    AssignFile(Afile, Afilename);
    if FileExists(Afilename) then
      Append(Afile)
    else
      Rewrite(Afile);
    if not Asingleline then
    begin
      if Atimestr <> '' then
        Writeln(Afile, Format('/*[%s] {%s} (%s)*/', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atimestr]))
      else
        Writeln(Afile, Format('/*[%s] {%s}*/', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname]));
      Writeln(Afile, Atext);
    end
    else if Atimestr <> '' then
      Writeln(Afile, Format('/*[%s] {%s} (%s)*/ %s', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atimestr, Atext]))
    else
      Writeln(Afile, Format('/*[%s] {%s}*/ %s', [FormatDateTime('YYYY-MM-DD hh:mm:ss', Now), Alogname, Atext]));
    CloseFile(Afile);

  except on E: Exception do
    begin
      LogApp.Error('TSingleton.logs ' + E.Message);
    end;
  end;
end;

procedure TSpedHw.logs_elapsed_time(Atext: string);
begin
  logs_sl(Atext, FlogStore.filename, FlogStore.timeStarted);
end;

procedure TSpedHw.logs_sl(Atext, Afilename: string; AtimeStart: TDateTime);
begin
  logs(Atext, Afilename, True, AtimeStart);
end;

procedure TSpedHw.montaRegistro0150(pCOD_PART: string);
var
  I: Integer;
begin
  if (FSpedFiscalOuPisCofins = 'F') or (FSpedFiscalOuPisCofins = 'L') then
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
    vQrAux.SQL.Text := 'select ''T''||tr.codigo_tr COD_PART, tr.nome_tr NOME, 1058 cod_pais,' +
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
    vQrAux.SQL.Text := 'select cl.cod_cliente COD_PART, cl.nome_cliente NOME, coalesce(cl.cod_pais, 1058) cod_pais,' +
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
        COD_PAIS := IfThen(COD_PAIS = '0', '1058', COD_PAIS);

        if COD_PAIS <> '1058' then
        begin
          CNPJ := '';
          CPF := '';
        end

        else if length(Trim(vQrAux.FieldByName('CNPJ').AsString)) = 14 then
          CNPJ := Trim(vQrAux.FieldByName('CNPJ').AsString)
        else if length(Trim(vQrAux.FieldByName('CPF').AsString)) = 11 then
          CPF := Trim(vQrAux.FieldByName('CPF').AsString)
        else
        begin
          CNPJ := '';
          CPF := '';
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
        FParticipantes.Add(COD_PART + '|' + copy(vQrAux.FieldByName('COD_MUN').AsString, 1, 2) + '|' + vQrAux.FieldByName('sigla_uf').AsString + '|');
      end;
    end
    else if FSpedFiscalOuPisCofins = 'L' then
    begin
      {
      with fLFD.Bloco_0.Registro0150New do
      begin
        COD_PART := vQrAux.FieldByName('COD_PART').AsString;
        NOME := Trim(vQrAux.FieldByName('NOME').AsString);
        COD_PAIS := vQrAux.FieldByName('COD_PAIS').AsString;
        if length(Trim(vQrAux.FieldByName('CNPJ').AsString)) = 14 then
          CNPJ := Trim(vQrAux.FieldByName('CNPJ').AsString)
        else if length(Trim(vQrAux.FieldByName('CPF').AsString)) = 11 then
          CPF := Trim(vQrAux.FieldByName('CPF').AsString)
        else
        begin
          CNPJ := '';
          CPF := '';
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
        FParticipantes.Add(COD_PART + '|' + copy(vQrAux.FieldByName('COD_MUN').AsString, 1, 2) + '|' + vQrAux.FieldByName('sigla_uf').AsString + '|');
      end;
      }
    end
    else
    begin     
      with FSpedP.Bloco_0.Registro0150New do
      begin
        COD_PART := vQrAux.FieldByName('COD_PART').AsString;
        NOME := Trim(vQrAux.FieldByName('NOME').AsString);
        COD_PAIS := vQrAux.FieldByName('COD_PAIS').AsString;
        COD_PAIS := IfThen(COD_PAIS = '0', '1058', COD_PAIS);

        if COD_PAIS <> '1058' then
        begin
          CNPJ := '';
          CPF := '';
        end

        else if length(Trim(vQrAux.FieldByName('CNPJ').AsString)) = 14 then
          CNPJ := Trim(vQrAux.FieldByName('CNPJ').AsString)
        else if length(Trim(vQrAux.FieldByName('CPF').AsString)) = 11 then
          CPF := Trim(vQrAux.FieldByName('CPF').AsString)
        else
        begin
          CNPJ := '';
          CPF := '';
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
        FParticipantes.Add(FCodEmpresa+'|'+COD_PART + '|' + copy(vQrAux.FieldByName('COD_MUN').AsString, 1, 2)+'|'+vQrAux.FieldByName('sigla_uf').AsString+'|' + IfThen( CNPJ <> '', CNPJ, CPF)  + '|');
      end;
    end;
  end;
end;

procedure TSpedHw.montaRegistro0190(pUNID: string);
var
  I: Integer;
  vDescricao: string;
begin
  pUNID := pUNID.ToUpper.Trim;
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    for I := 0 to F0190.Count - 1 do
      if F0190[I] = pUNID then
        exit;
  end
  else
  begin
    for I := 0 to F0190.Count - 1 do
      if (getCampoPipe(F0190[I],1) = FCodEmpresa) and
        (getCampoPipe(F0190[I],2) = pUNID) then
        exit;
  end;
  if MatchText(Trim(pUNID), ['UN', 'UND', 'UNID']) then
    vDescricao := 'UNIDADE'
  else if MatchText(Trim(pUNID), ['PC', 'PCA', 'PÇA', 'PÇ']) then
    vDescricao := 'PECA'
  else if UpperCase(Trim(pUNID)) = 'KG' then
    vDescricao := 'KILOS'
  else if MatchText(Trim(pUNID), ['CX', 'CXA', 'CX1']) then
    vDescricao := 'CAIXA'
  else if MatchText(Trim(pUNID), ['LT', 'LTR']) then
    vDescricao := 'LITROS'
  else if MatchText(Trim(pUNID), ['M', 'MT']) then
    vDescricao := 'METROS'
  else
    vDescricao := IfThen(FSpedFiscalOuPisCofins = 'P', UpperCase(Trim(pUNID))+'1');  //UpperCase(Trim(pUNID))+'1'; // montaRegistro0200 vai preencher a descrição caso fique em branco
  if FSpedFiscalOuPisCofins = 'F' then
  begin
    with FSpedF.Bloco_0.Registro0190New do
    begin
      UNID := UpperCase(Trim(pUNID));
      DESCR := Trim(vDescricao);
      DESCR := IfThen(DESCR.Trim.IsEmpty, UNID + '1', DESCR);
      F0190.Add(UpperCase(Trim(pUNID)));
    end;
  end
  else
  begin
    with FSpedP.Bloco_0.Registro0190New do
    begin
      UNID := UpperCase(Trim(pUNID));
      DESCR := Trim(vDescricao);
      DESCR := IfThen(DESCR.Trim.IsEmpty, UNID + '1', DESCR);
      F0190.Add(FCodEmpresa+'|'+UpperCase(Trim(pUNID))+'|');
    end;
  end;
end;

procedure TSpedHw.montaRegistro0200;
var
  vTemp, vTipoItem: string;
  I: integer;
  vCOD_ITEM, vDESCR_ITEM, vCOD_BARRA, vCOD_ANT_ITEM, vUNID_INV, vCOD_NCM,
  vEX_IPI, vCOD_GEN, vCOD_LST, vTIPO_ITEM, vCEST: string;
  vALIQ_ICMS: Double;
  AexisteReceita: Boolean;
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
      ' substring(p.nbm from 1 for 2) COD_GEN, null COD_LST, P.icm_prod ALIQ_ICMS, p.cest  from sped_item si' +
      ' inner join produtos p on p.grupo_prod = si.grupo_prod and' +
      ' p.cod_prod = si.cod_prod and p.cod_empresa = si.cod_empresa' +
      ' where si.tipo = ''P'' and si.cod_empresa = ' +FCodEmpresa +
      ' union' +
      ' select si.tipo, si.grupo_prod, si.cod_prod, si.chassi,  si.cod_servico,' +
      ' si.cod_outras, ts.desc_servico DESCR_ITEM, cast(ts.cod_servico as varchar(20))' +
      ' COD_BARRA, NULL COD_ANT_ITEM, ''UN'' UNID_INV, ''09'' tipo_item, '''' COD_NCM,' +
      ' null EX_IPI, ''00'' COD_GEN, ts.cod_serv_leicomplementar_166 COD_LST,' +
      ' 0 ALIQ_ICMS, '' '' cest from sped_item si' +
      ' inner join tipo_servico ts on ts.cod_servico = si.cod_servico' +
      ' where si.tipo = ''S'' and si.cod_empresa = ' +FCodEmpresa+
      ' union' +
      ' select si.tipo, si.grupo_prod, si.cod_prod, si.chassi,  si.cod_servico,' +
      ' si.cod_outras, null DESCR_ITEM, si.chassi COD_BARRA, NULL COD_ANT_ITEM,' +
      ' si.unid UNID_INV, null tipo_item, null COD_NCM,' +
      ' null EX_IPI, null COD_GEN, null COD_LST, 0 ALIQ_ICMS, '' '' cest from sped_item si' +
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
        AexisteReceita := False;
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
            ' substring(tm.ncmsh from 1 for 2) COD_GEN, 0 aliq_icms, tm.cest' +
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
              ' substring(tm.ncmsh from 1 for 2) COD_GEN, 0 aliq_icms, tm.cest' +
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
          if StrToDate(DataFim) <= StrToDate('31/12/2014') then
            vCOD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString)
          else if Trim(vQrAux.FieldByName('COD_LST').AsString) <> '' then
          begin
            vCOD_LST := StrZero(Trim(vQrAux.FieldByName('COD_LST').AsString), 4);
            vCOD_LST := Copy(vCOD_LST, 1, 2) + '.' + Copy(vCOD_LST, 3, 2);
          end
          else
            vCOD_LST := '';
          vALIQ_ICMS := vQrAux1.FieldByName('ALIQ_ICMS').AsCurrency;
          vCEST := Trim(vQrAux1.FieldByName('CEST').AsString);
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
            ' nfi.num_fab_prod, nfi.cest from notafiscal_item nfi' +
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
          if StrToDate(DataFim) <= StrToDate('31/12/2014') then
            vCOD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString)
          else if Trim(vQrAux.FieldByName('COD_LST').AsString) <> '' then
          begin
            vCOD_LST := StrZero(Trim(vQrAux.FieldByName('COD_LST').AsString), 4);
            vCOD_LST := Copy(vCOD_LST, 1, 2) + '.' + Copy(vCOD_LST, 3, 2);
          end
          else
            vCOD_LST := '';
          vALIQ_ICMS := vQrAux1.FieldByName('ALIQ_ICMS').AsCurrency;
          vCEST := Trim(vQrAux1.FieldByName('CEST').AsString);
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
          if FSpedFiscalOuPisCofins = 'F' then
          begin
            if StrToDate(DataFim) <= StrToDate('31/12/2014') then
              vCOD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString)
            else if Trim(vQrAux.FieldByName('COD_LST').AsString) <> '' then
            begin
              vCOD_LST := StrZero(Trim(vQrAux.FieldByName('COD_LST').AsString), 4);
              vCOD_LST := Copy(vCOD_LST, 1, 2) + '.' + Copy(vCOD_LST, 3, 2);
            end
            else
              vCOD_LST := '';
          end
          else
          begin
            if StrToDate(DataFim) <= StrToDate('31/05/2015') then
              vCOD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString)
            else if Trim(vQrAux.FieldByName('COD_LST').AsString) <> '' then
            begin
              vCOD_LST := StrZero(Trim(vQrAux.FieldByName('COD_LST').AsString), 4);
              vCOD_LST := Copy(vCOD_LST, 1, 2) + '.' + Copy(vCOD_LST, 3, 2);
            end
            else
              vCOD_LST := '';
          end;
          vALIQ_ICMS := vQrAux.FieldByName('ALIQ_ICMS').AsCurrency;
          vCEST := Trim(vQrAux.FieldByName('CEST').AsString);
        end;
        //vTIPO_ITEM := StrToTipoItem(vvTipoItem);
        montaRegistro0190(vUNID_INV);
      //end;

      vCEST := IfThen(vCEST.Trim.PadLeft(10, '0') <> Trim('').PadLeft(10, '0'), vCEST);

      if FSpedFiscalOuPisCofins = 'F' then
      begin
        with FSpedF.Bloco_0.Registro0200New do
        begin
          COD_ITEM := vCOD_ITEM;
          DESCR_ITEM := vDESCR_ITEM.Replace('|', '');
          COD_BARRA := EANUtils.GetValid(vCOD_BARRA, vQrAux1);
          COD_ANT_ITEM := vCOD_ANT_ITEM;
          UNID_INV := vUNID_INV;
          TIPO_ITEM := StrToTipoItemF(vTipoItem);
          if Length(Trim(vCOD_NCM)) = 8 then
            COD_NCM := vCOD_NCM;
          EX_IPI := vEX_IPI;
          COD_GEN := vCOD_GEN;
          COD_LST := vCOD_LST;
          ALIQ_ICMS := vALIQ_ICMS;
          CEST := vCEST;

          if vQrAux.FieldByName('tipo').AsString = 'P' then
          begin
            montaRegistro0205(vQrAux.FieldByName('grupo_prod').AsInteger, vQrAux.FieldByName('cod_prod').AsString, vQrAux1);

            if vQrAux.FieldByName('cod_outras').AsString = 'A' then
            begin
              SqlOpen('select ind.grupo_prod_mprima, ind.cod_prod_mprima, ind.quant, 0 perda from indice_tecnico ind' +
                      ' where ind.grupo_prod_acabado = %d and ind.cod_prod_acabado = %s and cod_empresa = %s and ind.quant > 0',
                      [vQrAux.FieldByName('grupo_prod').AsInteger,
                       QuotedStr(Trim(vQrAux.FieldByName('cod_prod').AsString)), FCodEmpresa], vQrAux1).First;
              while not vQrAux1.Eof do
              begin
                with FSpedF.Bloco_0.Registro0210New do
                begin
                  COD_ITEM_COMP :=  'P' + StrZero(vQrAux1.FieldByName('grupo_prod_mprima').AsString +
                                             Trim(vQrAux1.FieldByName('cod_prod_mprima').AsString), 16);
                  QTD_COMP      := vQrAux1.FieldByName('quant').AsFloat;
                  PERDA         := vQrAux1.FieldByName('perda').AsFloat;
                end;
                vQrAux1.Next;
              end;
            end;
                   {
            if Assigned(FProdutos) then
              with FProdutos.Get0220(vQrAux.FieldByName('grupo_prod').AsInteger,
                                     vQrAux.FieldByName('cod_prod').AsString,
                                     vUNID_INV) do
                for I := 0 to Count - 1 do
                  with FSpedF.Bloco_0.Registro0220New do
                  begin
                    UNID_CONV := Items[I].Unid;
                    FAT_CONV := Items[I].Fator;
                    montaRegistro0190(UNID_CONV);
                  end;
                  }

            if Assigned(FProdutos) then
            begin
              var prod := FProdutos.AddProduto(vQrAux.FieldByName('grupo_prod').AsInteger,
                                               vQrAux.FieldByName('cod_prod').AsString.Trim,
                                               vUNID_INV);
              if Assigned(prod) then
              begin
                for I := 0 to prod.FatoresConv.Count - 1 do
                  with FSpedF.Bloco_0.Registro0220New do
                  begin
                    UNID_CONV := prod.FatoresConv.Items[I].Unid;
                    FAT_CONV := prod.FatoresConv.Items[I].Fator;
                    montaRegistro0190(UNID_CONV);
                  end;

                if FRegistro0221 and  (vTipoItem = '00') then
                begin
                  if (prod.CodigosComerc.Count = 0) then
                  begin
                    var codComerc:= TReg0221.Create;
                    codComerc.CodigoAtomico := COD_ITEM;
                    codComerc.Quantidade := 1;
                    prod.CodigosComerc.Add(codComerc);
                  end;

                  for I := 0 to prod.CodigosComerc.Count - 1 do
                    with FSpedF.Bloco_0.Registro0221New do
                    begin
                      COD_ITEM_ATOMICO := prod.CodigosComerc.Items[I].CodigoAtomico;
                      QTDE_CONTIDA := prod.CodigosComerc.Items[I].Quantidade;
                    end;
                end;
              end;
            end;

          end;
        end;
      end
      else
      begin
        with FSpedP.Bloco_0.Registro0200New do
        begin
          COD_ITEM := vCOD_ITEM;
          DESCR_ITEM := vDESCR_ITEM.Replace('|', '');
          COD_BARRA := EANUtils.GetValid(vCOD_BARRA, vQrAux1);
          COD_ANT_ITEM := vCOD_ANT_ITEM;
          UNID_INV := vUNID_INV;
          TIPO_ITEM := _StrToTipoItemPC(vTipoItem);
          if Length(Trim(vCOD_NCM)) = 8 then
            COD_NCM := vCOD_NCM;
          EX_IPI := vEX_IPI;
          COD_GEN := vCOD_GEN;
          if Copy(vCOD_LST, 1, 1) = '0' then
            Delete(vCOD_LST, 1, 1);
          COD_LST := vCOD_LST;
          ALIQ_ICMS := vALIQ_ICMS;
          Registro0208.COD_TAB := codIndiTabNaoTem;
        end;
        if vQrAux.FieldByName('tipo').AsString = 'P' then
          montaRegistro0205(vQrAux.FieldByName('grupo_prod').AsInteger, vQrAux.FieldByName('cod_prod').AsString, vQrAux1);
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
      vCEST := getCampoPipe(F0200[I], 12);

      vCEST := IfThen(vCEST.Trim.PadLeft(10, '0') <> Trim('').PadLeft(10, '0'), vCEST);

      if FSpedFiscalOuPisCofins = 'F' then
      begin
        with FSpedF.Bloco_0.Registro0200New do
        begin
          COD_ITEM := vCOD_ITEM;
          DESCR_ITEM := vDESCR_ITEM.Replace('|', '');
          COD_BARRA := EANUtils.GetValid(vCOD_BARRA, vQrAux1);
          COD_ANT_ITEM := vCOD_ANT_ITEM;
          UNID_INV := vUNID_INV;
          TIPO_ITEM := StrToTipoItemF(vTIPO_ITEM);
          COD_NCM := vCOD_NCM;
          EX_IPI := vEX_IPI;
          COD_GEN := vCOD_GEN;
          COD_LST := vCOD_LST;
          ALIQ_ICMS := vALIQ_ICMS;
          CEST := vCEST;
        end;
      end
      else
      begin
        with FSpedP.Bloco_0.Registro0200New do
        begin
          COD_ITEM := vCOD_ITEM;
          DESCR_ITEM := vDESCR_ITEM.Replace('|', '');
          COD_BARRA := EANUtils.GetValid(vCOD_BARRA, vQrAux1);
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


    if FSpedFiscalOuPisCofins = 'F' then
    begin
      var queryOOP := QueryHelper.CreateObj(vQrAux);
      try
        queryOOP
          .Table('unidades', 'sigla, descricao')
          .Open().query.Last;

        for I := 0 to FSpedF.Bloco_0.Registro0001.Registro0190.Count - 1 do
          if FSpedF.Bloco_0.Registro0001.Registro0190.Items[I].DESCR.IsEmpty then
            if (queryOOP.query.Locate('SIGLA', FSpedF.Bloco_0.Registro0001.Registro0190.Items[I].UNID, [loCaseInsensitive]))
            then
              FSpedF.Bloco_0.Registro0001.Registro0190.Items[I].DESCR := queryOOP.fstr('descricao')
            else
              FSpedF.Bloco_0.Registro0001.Registro0190.Items[I].DESCR := FSpedF.Bloco_0.Registro0001.Registro0190.Items[I].UNID + '1';
      finally
        queryOOP.Free;
      end;
    end;

  finally
    vQrAux.Close;
  end;
end;

procedure TSpedHw.montaRegistro0205(pGrupoProd: Integer; pCodProd: String; pQuery: TIBQuery);
var
  vCount: Smallint;
  I: Integer;
begin
  pQuery.Close;
  pQuery.SQL.Text := 'select * from produtos_alteracoes' +
    ' where grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and cod_prod  = ' + QuotedStr(pCodProd) +
    ' and cod_empresa = ' + FCodEmpresa +
    ' and mov_sped = ' + QuotedStr(Copy(FDataIni, 4, 7)) +
    ' and data_alteracao < :dataFimSped' +
    ' order by data_alteracao';
  pQuery.ParamByName('dataFimSped').AsDate := StrToDate(FDataFim);
  pQuery.Open;

  if pQuery.IsEmpty then
  begin
    pQuery.Close;
    Exit;
  end;

  pQuery.First;
  while not pQuery.Eof do
  begin
    if FSpedFiscalOuPisCofins = 'F' then
    begin
      if (pQuery.FieldByName('tipo_alt').AsString = 'A') then
        vCount := 2
      else
        vCount := 1;

      for I := 0 to vCount - 1 do
      begin
        with FSpedF.Bloco_0.Registro0205New do
        begin
          if (pQuery.FieldByName('tipo_alt').AsString = 'D') then
            DESCR_ANT_ITEM := Trim(pQuery.FieldByName('descr_prod_anterior').AsString).Replace('|', '')
          else if (pQuery.FieldByName('tipo_alt').AsString = 'C') then
            COD_ANT_ITEM := 'P' + StrZero( Trim(getCampoPipe(pQuery.FieldByName('valor_anterior').AsString, 1))  + Trim(getCampoPipe(pQuery.FieldByName('valor_anterior').AsString, 2)), 16)
          else if I = 0 then
            DESCR_ANT_ITEM := Trim(pQuery.FieldByName('descr_prod_anterior').AsString)
          else
            COD_ANT_ITEM := 'P' + StrZero( Trim(getCampoPipe(pQuery.FieldByName('valor_anterior').AsString, 1))  + Trim(getCampoPipe(pQuery.FieldByName('valor_anterior').AsString, 2)), 16);
          DT_INI := pQuery.FieldByName('data_ini').AsDateTime;
          DT_FIN := pQuery.FieldByName('data_alteracao').AsDateTime;
        end;
      end;
    end
    else
    begin
      with FSpedP.Bloco_0.Registro0205New do
      begin
        if (pQuery.FieldByName('tipo_alt').AsString = 'D') or (pQuery.FieldByName('tipo_alt').AsString = 'A') then
          DESCR_ANT_ITEM := Trim(pQuery.FieldByName('descr_prod_anterior').AsString).Replace('|', '');
        if (pQuery.FieldByName('tipo_alt').AsString = 'C') or (pQuery.FieldByName('tipo_alt').AsString = 'A') then
          COD_ANT_ITEM := 'P' + StrZero( Trim(getCampoPipe(pQuery.FieldByName('valor_anterior').AsString, 1))  + Trim(getCampoPipe(pQuery.FieldByName('valor_anterior').AsString, 2)), 16);
        DT_INI := pQuery.FieldByName('data_ini').AsDateTime;
        DT_FIM := pQuery.FieldByName('data_alteracao').AsDateTime;
      end;
    end;
    pQuery.Next;
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
      TXT := TXT.Substring(0, 255);
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

procedure TSpedHw.setCNPJGrupo(pCNPJ: string);
begin
  if not conectarBanco then
    Exit;

  vQrAux.Close;
  if vDadosIniSPED.vCodEmpresa <> '' then
    vQrAux.SQL.Text := 'select cgc_emp cnpj from empresa e' +
      ' where e.cod_empresa = ' + vDadosIniSPED.vCodEmpresa
  else if FSpedFiscalOuPisCofins = 'PC' then
    vQrAux.SQL.Text := 'select cgc_emp cnpj from empresa e' +
      ' where e.gerar_sped_piscofins = ''S'' and e.sped_matriz_filial = ''M''' +
      ' and e.cgc_emp like ' + QuotedStr(pCNPJ + '%') + ' order by e.cod_empresa'
  else
    vQrAux.SQL.Text := 'select cgc_emp cnpj from empresa e' +
      ' where e.cod_empresa = ' + FCodEmpresa;
  vQrAux.Open;
  if FSpedFiscalOuPisCofins = 'PC' then
    FCNPJGrupo := Trim(Copy(Trim(vQrAux.FieldByName('cnpj').AsString), 1, 8))
  else
    FCNPJGrupo := Trim(vQrAux.FieldByName('cnpj').AsString);
  vQrAux.Close;
end;

procedure TSpedHw.setConfSisBlob(pChave: string; pBuscas: TIBQuery; pDisplay,
  pValue: string);
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_b retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + FCodEmpresa;
  pBuscas.Open;

  if (pBuscas.IsEmpty) then
  begin
    pBuscas.Close;
    pBuscas.SQL.Text := 'insert into config_sistema (chave, cod_empresa, display_, type1_, value1_b, ordem)' +
      ' values (:chave, :cod_empresa, :display_, :type1_, :value1_b, gen_id(inc_ord_config_sistema, 1))';
    pBuscas.ParamByName('chave').AsString := pChave;
    pBuscas.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    pBuscas.ParamByName('display_').AsString := pDisplay;
    pBuscas.ParamByName('type1_').AsString := 'blob';
    pBuscas.ParamByName('value1_b').AsString := pValue;
    pBuscas.ExecSQL;
    if pBuscas.Transaction.InTransaction  then
      pBuscas.Transaction.Commit;
  end;
end;

procedure TSpedHw.setConfSisBool(pChave: string; pValue: Boolean;
  pBuscas: TIBQuery; pDisplay: string; pStrings: string);
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_f retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + FCodEmpresa;
  pBuscas.Open;

  if (pBuscas.IsEmpty) then
  begin
    pBuscas.Close;
    pBuscas.SQL.Text := 'insert into config_sistema (chave, cod_empresa, display_, type1_, value1_f, value1_b, ordem)' +
      ' values (:chave, :cod_empresa, :display_, :type1_, :value1_f, :value1_b, gen_id(inc_ord_config_sistema, 1))';
    pBuscas.ParamByName('chave').AsString := pChave;
    pBuscas.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    pBuscas.ParamByName('display_').AsString := pDisplay;
    pBuscas.ParamByName('type1_').AsString := 'boolean';
    pBuscas.ParamByName('value1_f').AsFloat := IfThen(pValue, 1, 0);
    if pStrings <> '' then
      pBuscas.ParamByName('value1_b').AsString := pStrings;
    pBuscas.ExecSQL;
    if pBuscas.Transaction.InTransaction  then
      pBuscas.Transaction.Commit;
  end;
end;

procedure TSpedHw.setConfSisInt(pChave: string; pValue: integer;
  pBuscas: TIBQuery; pDisplay: string; pStrings: TStrings);
begin
  pBuscas.Close;
  pBuscas.SQL.Text := 'select value1_f retorno from config_sistema' +
    ' where chave = ' + QuotedStr(pChave) + ' and cod_empresa = ' + FCodEmpresa;
  pBuscas.Open;

  if (pBuscas.IsEmpty) then
  begin
    pBuscas.Close;
    pBuscas.SQL.Text := 'insert into config_sistema (chave, cod_empresa, display_, type1_, value1_f, value1_b, ordem)' +
      ' values (:chave, :cod_empresa, :display_, :type1_, :value1_f, :value1_b, gen_id(inc_ord_config_sistema, 1))';
    pBuscas.ParamByName('chave').AsString := pChave;
    pBuscas.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    pBuscas.ParamByName('display_').AsString := pDisplay;
    pBuscas.ParamByName('type1_').AsString := 'integer';
    pBuscas.ParamByName('value1_f').AsFloat := pValue;
    if pStrings <> nil then
      pBuscas.ParamByName('value1_b').AsString := pStrings.Text;
    pBuscas.ExecSQL;
    if pBuscas.Transaction.InTransaction  then
      pBuscas.Transaction.Commit;
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

function TSpedHw.SqlExec(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  logs(ASql, Self.ClassName + '.SqlExec');

  if AQuery = nil then
    AQuery := vQrAux;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  if not AQuery.Prepared then
    AQuery.Prepare;
  AQuery.ExecSQL;

  Result := AQuery;

  logs_elapsed_time();
end;

function TSpedHw.SqlExec(ASql: string; const Args: array of const; AQuery: TIBQuery): TIBQuery;
begin
  Result := SqlExec(Format(ASql, Args), AQuery);
end;

function TSpedHw.SqlOpen(ASql: string; const Args: array of const; AQuery: TIBQuery): TIBQuery;
begin
  Result := SqlOpen(Format(ASql, Args), AQuery);
end;

function TSpedHw.SqlOpen(ASql: string; AQuery: TIBQuery): TIBQuery;
begin
  logs(ASql, Self.ClassName + '.SqlOpen');

  if AQuery = nil then
    AQuery := vQrAux;

  AQuery.Close;
  AQuery.SQL.Text := ASql;
  AQuery.Open;

  Result := AQuery;

  logs_elapsed_time();
end;

function TSpedHw.StrToFloatFormat(valor: Double;
  casasDecimais: integer): Double;
begin
  Result := RoundTo(valor, 0 - Abs(casasDecimais));
  //Result := StrToFloat(Format('%0.' + IntToStr(casasDecimais) + 'f', [valor]));
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

		if FLabelStatus <> nil then
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
          if (Trim(vQrAux.FieldByName('descaliq').AsString) = 'N') or
            (Trim(vQrAux.FieldByName('descaliq').AsString) = 'I') or
            (Trim(vQrAux.FieldByName('descaliq').AsString) = 'F') or
            (Trim(vQrAux.FieldByName('descaliq').AsString) = 'NS') or
            (Trim(vQrAux.FieldByName('descaliq').AsString) = 'IS') or
            (Trim(vQrAux.FieldByName('descaliq').AsString) = 'FS') then
          vLista.Add(
            Trim(vQrAux.FieldByName('descaliq').AsString) + '1|' +
            Format( '%0.2f' ,[vQrAux.FieldByName('VL_ITEM').AsFloat]) + '|'
          )
          else
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

						vQrExec.Close;
						vQrExec.SQL.Text :=
							'select mp.nserieecf,imp.mf_adicional,cniee.modelo_ecf, imp.cod_proprietario,res.nreducoes,' +
							' case when ((upper(coalesce(mp.descaliq, '''')) = ''CAN-T'') or (upper(coalesce(mp.descaliq, '''')) = ''CANC-T'')) then ''Can-T''' +
							' when ((upper(coalesce(mp.descaliq, '''')) = ''CAN-S'') or (upper(coalesce(mp.descaliq, '''')) = ''CANC-S'')) then ''Can-S''' +
							' else mp.descaliq' +
							' end descaliq, mp.valoraliq, mp.md5' +
							' from resumod res' +
							' inner join terminal_impressoras imp on imp.cod_terminal = res.cod_terminal and imp.num_serie_ecf = res.nserieecf and imp.cod_empresa = res.cod_empresa and imp.atual = ''S''' +
							' inner join mapa_resumo_aliq mp on mp.cod_terminal = res.cod_terminal and mp.nserieecf = res.nserieecf and mp.cod_empresa = res.cod_empresa and mp.coored = res.coored' +
							' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
							' where mp.COD_TERMINAL = ' + IntToStr(pCodTerminal) +
							' AND mp.NSERIEECF = ' + QuotedStr(pNSerieECF) +
							' AND mp.COD_EMPRESA = ' + IntToStr(StrToIntDef(FCodEmpresa, 0)) +
							' AND mp.COORED = ' + IntToStr(vQrAux1.FieldByName('COORED').AsInteger) +
							' AND mp.ALIQ_SEQ = ' + QuotedStr(vMaxMapa);
						vQrExec.Open;

						if not vQrExec.IsEmpty then
							_gravaMD5_RegistrosPAF( vQrExec,
								Trim(vQrExec.FieldByName('NSERIEECF').AsString) + '|' +
								Trim(vQrExec.FieldByName('MF_ADICIONAL').AsString) + '|' +
								Trim(vQrExec.FieldByName('MODELO_ECF').AsString) + '|' +
								Trim(vQrExec.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
								Trim(vQrExec.FieldByName('NREDUCOES').AsString) + '|' +
								Trim(vQrExec.FieldByName('DESCALIQ').AsString) + '|' +
								Trim(vQrExec.FieldByName('VALORALIQ').AsString) + '|',
								'MAPA_RESUMO_ALIQ',
								' COD_TERMINAL = ' + IntToStr(pCodTerminal) +
								' AND NSERIEECF = ' + QuotedStr(pNSerieECF) +
								' AND COD_EMPRESA = ' + IntToStr(StrToIntDef(FCodEmpresa, 0)) +
								' AND COORED = ' + IntToStr(vQrAux1.FieldByName('COORED').AsInteger) +
								' AND ALIQ_SEQ = ' + QuotedStr(vMaxMapa),
                'MD5', False
							);
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

procedure TSpedHw.verificaICMSInterestadual;
var
  vQrExec, vQrTemp: TIBQuery;
  vIE: string;
  vIndIEDest: Smallint;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    try
      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select nf.cod_nf, nf.nfe_iddest, nf.consumidor_final,' +
        ' cl.nfe_indiedest, cl.insc_est from notafiscal nf' +
        ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
        ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and nf.cod_empresa = :cod_empresa' +
        ' and nf.NFE_INDIEDEST is null and NFE_IDDEST = 2 and nf.consumidor_final = ''S''' +
        ' and nf.status <> ''Aberta''';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;
      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        vIE := Trim(vQrTemp.FieldByName('insc_est').AsString);
        if Trim(vIE) = 'ISENTO' then
          vIE := '';
        vIndIEDest := vQrTemp.FieldByName('NFE_INDIEDEST').AsInteger;

        if vIndIEDest = 0 then
          if vIE = '' then
            vIndIEDest := 9
          else
            vIndIEDest := 1;

        vQrExec.Close;
        vQrExec.SQL.Text := 'update notafiscal set nfe_indiedest = :nfe_indiedest' +
          ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa';
        vQrExec.ParamByName('nfe_indiedest').AsInteger := vIndIEDest;
        vQrExec.ParamByName('cod_nf').AsInteger := vQrTemp.FieldByName('cod_nf').AsInteger;
        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vQrExec.ExecSQL;

        if (vQrTemp.FieldByName('nfe_iddest').AsInteger <> 2) or
          (Trim(vQrTemp.FieldByName('consumidor_final').AsString) <> 'S') or
          (vIndIEDest <> 9) then
        begin
          vQrExec.Close;
          vQrExec.SQL.Text := 'update notafiscal set vfcpufdest = 0,' +
            ' vicmsufdest = 0, vicmsufremet = 0' +
            ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa';
          vQrExec.ParamByName('cod_nf').AsInteger := vQrTemp.FieldByName('cod_nf').AsInteger;
          vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vQrExec.ExecSQL;

          vQrExec.Close;
          vQrExec.SQL.Text := 'update notafiscal_item set vbcufdest = 0, pfcpufdest = 0, picmsufdest = 0,' +
            ' picmsinter = 0, picmsinterpart = 0, vfcpufdest = 0, vicmsufdest = 0, vicmsufremet = 0' +
            ' where cod_nf = :cod_nf and cod_empresa = :cod_empresa';
          vQrExec.ParamByName('cod_nf').AsInteger := vQrTemp.FieldByName('cod_nf').AsInteger;
          vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vQrExec.ExecSQL;
        end;

        vQrTemp.Next;
      end;
      vQrTemp.Close;

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

procedure TSpedHw.verificaPISCOFINSCupomFiscal_nao_usado_mais(pNSerieECF: string;
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
(*
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
  *)
end;

procedure TSpedHw.verificaPISCOFINSNFCe;
var
  vQrExec, vQrTemp : TIBQuery;
  con: TConexao;
begin

  FLabelStatus.Caption := 'Definindo PIS/COFINS - NFCe';
  Application.ProcessMessages;

  vQrExec := TIBQuery.Create(Application);
  vQrTemp := TIBQuery.Create(Application);


  con := TConexao.Create;

  try
    var err := '';

    if not con.ConfigureStr(Format(';databasename=%s', [vConexao.DatabaseName])).conectar(err) then
    begin
      ShowAtencao('Não foi possivel refazer o calculo do PISCOFINS para NFCe. Tente novamente');
      Exit;
    end;

    if con.SqlScalar('select DADOS_OFFLINE from EMPDESVOLV where COD_EMPDES = 1').AsString.Equals('S') then
    begin
      con.SqlExec('EXECUTE PROCEDURE SPDB_CHECK_PRIVILEGES(''REPL'', ''SP_NFCE_RESET_PISCOFINS'')').Transaction.Commit();
      if not con.ConfigureStr(';username=REPL').conectar(err) then
      begin
        ShowAtencao('Não foi possivel refazer o calculo do PISCOFINS para NFCe. Tente novamente' + sLineBreak + '*REPL');
        Exit;
      end;
    end;

    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    try
      {
      vQrExec.Close;
      vQrExec.SQL.Text := 'select sucesso from sp_nfce_reset_piscofins(:cod_nfce, :cod_empresa)';
      }
      con.QrAux.Close;
      con.QrAux.SQL.Text := 'select sucesso from sp_nfce_reset_piscofins(:cod_nfce, :cod_empresa)';

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select nfce.cod_nfce, nfce.cod_empresa' +
        ' from nfce' +
        ' where nfce.cod_empresa = :cod_empresa' +
        ' and nfce.data_lanc >= :dataIni' +
        ' and nfce.data_lanc <= :dataFim ' +
        ' and nfce.situacao_nfce in (''Autorizada'', ''Cancelada'', ''Denegada'', ''Inutilizada'')' +
        ' order by nfce.serie, nfce.num_nf';
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.Open;
      vQrTemp.FetchAll;

      FProgressBar2.Min := 0;
      FProgressBar2.Max := vQrTemp.RecordCount;
      FProgressBar2.Position := 1;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        {
        vQrExec.Close;
        vQrExec.ParamByName('cod_nfce').AsInteger := vQrTemp.FieldByName('cod_nfce').AsInteger;
        vQrExec.ParamByName('cod_empresa').AsInteger := vQrTemp.FieldByName('cod_empresa').AsInteger;
        vQrExec.Open;
        }
        con.QrAux.Close;
        con.QrAux.ParamByName('cod_nfce').AsInteger := vQrTemp.FieldByName('cod_nfce').AsInteger;
        con.QrAux.ParamByName('cod_empresa').AsInteger := vQrTemp.FieldByName('cod_empresa').AsInteger;
        con.QrAux.Open;

        FProgressBar2.Position := FProgressBar2.Position + 1;
        Application.ProcessMessages;

        vQrTemp.Next;
      end;
      if con.QrAux.Transaction.InTransaction then
        con.QrAux.Transaction.Commit;
      {
      if vQrExec.Transaction.InTransaction then
        vQrExec.Transaction.Commit;

      vQrExec.Close;
      vQrExec.SQL.Text := 'select sucesso from sp_nfce_sum_totais_piscofins(:cod_nfce, :cod_empresa)';

      FProgressBar2.Position := 1;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        vQrExec.Close;
        vQrExec.ParamByName('cod_nfce').AsInteger := vQrTemp.FieldByName('cod_nfce').AsInteger;
        vQrExec.ParamByName('cod_empresa').AsInteger := vQrTemp.FieldByName('cod_empresa').AsInteger;
        vQrExec.Open;

        FProgressBar2.Position := FProgressBar2.Position + 1;
        Application.ProcessMessages;

        vQrTemp.Next;
      end;

      if vQrExec.Transaction.InTransaction then
        vQrExec.Transaction.Commit;
        }
    except on E: Exception do
      begin
        LogApp.Error('TSpedHw.verificaPISCOFINSNFCe ' + E.Message);
        ShowErro('Não foi possivel refazer o calculo do PISCOFINS para NFCe' + sLineBreak + E.Message);
      end;

      {
      if vQrExec.Transaction.InTransaction then
        vQrExec.Transaction.Rollback;
      }
    end;

    vQrTemp.Close;
    vQrExec.Close;
  finally
    con.Free;
    if Assigned(vQrExec) then
      FreeAndNil(vQrExec);
    if Assigned(vQrTemp) then
      FreeAndNil(vQrTemp);
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
  vTempCSTPIS, vTempCSTCOFINS, vSqlUpdateItem, vTempNAT_REC: String;
  vTempAliqPIS, vTempAliqCOFINS: Double;
  vValorCOFINSTotal, vValorPISTotal, vLucroVeiculoUsado: Currency;
  vTributadoPorQtde, vOK, vVeiculoUsado: Boolean;
  ConfList: TConfig_sistema_classList;
  ConfBC, confNcmCfop: TConfig_sistema_class;
  StrMod: string;
  rowNcmCfop: Integer;
  I: Integer;

  procedure setCFOPDevolucao;
  begin
    vQrTemp.Close;
    vQrTemp.SQL.Text := 'select codigo_nop from nat_op where devolucao_sped = ''S''';
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

    //ConfBC := TConfig_sistema_class.getConf('nf_piscofins_despesas', vQrExec, StrToInt(FCodEmpresa));

    ConfList := TConfig_sistema_classList.Create;
    ConfList.AddKey('nf_piscofins_bases').
             AddKey('nf_piscofins_cst_05_revenda_base_zero').
             AddKey('nf_conf_ncm_cfop_piscofins').
             MakeAll(vQrExec, StrToInt(FCodEmpresa));

    with ConfList.GetConf('nf_piscofins_bases') do
      ConfBC := Clone;

    with ConfList.GetConf('nf_conf_ncm_cfop_piscofins') do
      confNcmCfop := Clone;

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
      vQrTemp.SQL.Text := 'select nf.cod_nf, nf.natureza_nf, nf.tipo_nf, nf.modelo_nf,' +
        ' nf.FRETE_F_NFE, NF.DEVOLUCAO, NF.FRETECONTA_TR from notafiscal nf'+
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
        ' nfi.ncm, nfi.codigo_nop,' +
        ' nfi.valor_total, nfi.rateio_desconto, nfi.base_pis, nfi.base_cofins, nfi.aliq_pis,' +
        ' nfi.aliq_cofins, nfi.aliq_pis_quant, nfi.aliq_cofins_quant, nfi.quantidade,' +
        ' nfi.quant_bc_pis, nfi.quant_bc_cofins, nfi.rateio_seguro, nfi.rateio_outdesp, nfi.rateio_frete,'+
        ' nfi.ncm, nfi.codigo_nop, nfi.valor_ipi, nfi.valor_icmsub, nfi.valor_pis, nfi.valor_cofins, cfop.tipv_veiculo'+
        ' from notafiscal_item nfi' +
        ' left join nat_op cfop on cfop.codigo_nop = nfi.codigo_nop' +
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
          rowNcmCfop := -1;
          for I := 0 to confNcmCfop.value1_b.Count - 1 do
            if ((confNcmCfop.CSVPipe(I, 1) = '99999999') and
                (confNcmCfop.CSVPipe(I, 2) = vQrTemp2.FieldByName('codigo_nop').AsString)) or
               ((confNcmCfop.CSVPipe(I, 1) = vQrTemp2.FieldByName('ncm').AsString) and
                (confNcmCfop.CSVPipe(I, 2) = vQrTemp2.FieldByName('codigo_nop').AsString)) then
            begin
              rowNcmCfop := I;
              Break;
            end;

//          if (vQrTemp2.FieldByName('tipo_item').AsString <> 'D') and (vQrTemp2.FieldByName('tipo_item').AsString <> 'O') then
          if (vQrTemp2.FieldByName('tipo_item').AsString <> 'O') then
          begin
            vTempAliqPIS := 0;
            vTempAliqCOFINS := 0;
            vTempCSTPIS := '';
            vTempCSTCOFINS := '';
            vLucroVeiculoUsado := 0;
            vVeiculoUsado:= False;

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
            end;

            vTributadoPorQtde := False;
            if (vQrTemp.FieldByName('natureza_nf').AsString = 'S') and (vTempCSTPIS = '') then
            begin
              //else
              if (vQrTemp2.FieldByName('tipv_veiculo').AsString = 'T') and (FAlterarCST4998) then
              begin
                vTempCSTPIS := '49';
                vTempCSTCOFINS := '49';
                vTempAliqPIS := 0;
                vTempAliqCOFINS := 0;
              end
              else
              if vQrTemp2.FieldByName('tipo_item').AsString = 'P' then
              begin
                vQrTemp3.Close;
                vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
                  ' ALIQ_PIS_DIFERENCIADA, ALIQ_COFINS_DIFERENCIADA  from produtos' +
                  ' where grupo_prod = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger)+
                  ' and cod_prod = ' + QuotedStr(Trim(vQrTemp2.FieldByName('cod_prod').AsString)) +
                  ' and cod_empresa = ' + FCodEmpresa;
                vQrTemp3.Open;
                //PIS
                if Trim(vQrTemp3.FieldByName('cst_pis').AsString) <> '' then
                  vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString)
                else //if (Trim(vTempCSTPIS) = '') then
                  vTempCSTPIS := '01';

                if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or (vTempCSTPIS = '05') then
                  vTempAliqPIS := vQrTemp3.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat
                else if (vTempCSTPIS = '01') then
                  vTempAliqPIS := FAliqPIS;
                //COFINS
                if Trim(vQrTemp3.FieldByName('cst_cofins').AsString) <> '' then
                  vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString)
                else //if (Trim(vTempCSTCOFINS) = '') then
                  vTempCSTCOFINS := '01';

                if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') or (vTempCSTCOFINS = '05') then
                  vTempAliqCOFINS := vQrTemp3.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat
                else if (vTempCSTCOFINS = '01') then
                  vTempAliqCOFINS := FAliqCOFINS;

              end  //produtos
              else if vQrTemp2.FieldByName('tipo_item').AsString = 'S' then
              begin
                vQrTemp3.Close;
                vQrTemp3.SQL.Text := 'select isento_pis, cst_pis, cst_cofins,' +
                  ' 0 aliq_pis, 0 aliq_cofins  from tipo_servico' +
                  ' where cod_servico = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger);
                vQrTemp3.Open;
                //PIS
                if Trim(vQrTemp3.FieldByName('cst_pis').AsString) <> '' then
                  vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis').AsString)
                else //if (Trim(vTempCSTPIS) = '') then
                  vTempCSTPIS := '01';

                if Trim(vQrTemp3.FieldByName('cst_cofins').AsString) <> '' then
                  vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins').AsString)
                else
                  vTempCSTCOFINS := '01';

                if (vTempCSTPIS = '02') or (vTempCSTPIS = '03') or
                  (vTempCSTPIS = '05') or (vTempCSTPIS = '01') then
                  vTempAliqPIS := FAliqPIS;

                if (vTempCSTCOFINS = '02') or (vTempCSTCOFINS = '03') or
                  (vTempCSTCOFINS = '05') or (vTempCSTCOFINS = '01') then
                  vTempAliqCOFINS := FAliqCOFINS;
              end
              else if vQrTemp2.FieldByName('tipo_item').AsString = 'V' then
              begin
                vQrTemp3.Close;
                vQrTemp3.SQL.Text := 'select tipo_venda, precocompra from notafiscal_item_veiculo' +
                  ' where cod_nf = ' + IntToStr(vQrTemp2.FieldByName('cod_nf').AsInteger) +
                  ' and nitem = ' + IntToStr(vQrTemp2.FieldByName('nitem').AsInteger);
                vQrTemp3.Open;

                if Trim(vQrTemp3.FieldByName('tipo_venda').AsString) = 'U' then
                begin
                  vVeiculoUsado := True;
                  vLucroVeiculoUsado := (vQrTemp2.FieldByName('valor_total').AsFloat -
                    vQrTemp2.FieldByName('rateio_desconto').AsFloat) +
                    vQrTemp2.FieldByName('rateio_seguro').AsFloat +
                    vQrTemp2.FieldByName('rateio_outdesp').AsFloat;
                  if (vQrTemp.FieldByName('FRETECONTA_TR').AsString = '2') and
                    (vQrTemp.FieldByName('FRETE_F_NFE').AsString <> 'S') and
                    (vQrTemp2.FieldByName('rateio_frete').AsFloat > 0) then
                    vLucroVeiculoUsado := vLucroVeiculoUsado + vQrTemp2.FieldByName('rateio_frete').AsFloat;
                  vLucroVeiculoUsado :=  vLucroVeiculoUsado - vQrTemp3.FieldByName('PRECOCOMPRA').AsFloat;
                  if vLucroVeiculoUsado <= 0 then
//                  begin
                    vLucroVeiculoUsado := 0;
//                    vTempCSTPIS := '05';
//                    vTempCSTCOFINS := '05';
//                    vTempAliqPIS := 0;
//                    vTempAliqCOFINS := 0;
//                  end
//                  else
//                  begin
                    vTempCSTPIS := '01';
                    vTempCSTCOFINS := '01';
                    vTempAliqPIS := FAliqPIS;
                    vTempAliqCOFINS := FAliqCOFINS;
//                  end;
                end
                else
//                if vLucroVeiculoUsado = 0 then
                begin
                vTempCSTPIS := '05';
                vTempCSTCOFINS := '05';
                vTempAliqPIS := 0;
                vTempAliqCOFINS := 0;
                end;
              end
              else if vQrTemp2.FieldByName('tipo_item').AsString = 'V' then
              begin
                vTempCSTPIS := '05';
                vTempCSTCOFINS := '05';
                vTempAliqPIS := 0;
                vTempAliqCOFINS := 0;
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
              if (vQrTemp2.FieldByName('tipv_veiculo').AsString = 'T') and (FAlterarCST4998) then
              begin
                vTempCSTPIS := '98';
                vTempCSTCOFINS := '98';
                vTempAliqPIS := 0;
                vTempAliqCOFINS := 0;
              end
              else
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
                vTempCSTPIS := Trim(vQrTemp3.FieldByName('cst_pis_ent').AsString);
                vTempCSTCOFINS := Trim(vQrTemp3.FieldByName('cst_cofins_ent').AsString);
              end
              else if vQrTemp2.FieldByName('tipo_item').AsString = 'V' then
              begin
                vQrTemp3.Close;
                vQrTemp3.SQL.Text := 'select tipo_venda from notafiscal_item_veiculo' +
                  ' where cod_nf = ' + IntToStr(vQrTemp2.FieldByName('cod_nf').AsInteger) +
                  ' and nitem = ' + IntToStr(vQrTemp2.FieldByName('nitem').AsInteger);
                vQrTemp3.Open;
                if Trim(vQrTemp3.FieldByName('tipo_venda').AsString) = 'U' then
                begin
                  vVeiculoUsado := True;
                  vLucroVeiculoUsado := 0;
                  vTempCSTPIS := '50';
                  vTempCSTCOFINS := '50';
                  vTempAliqPIS := FAliqPIS;
                  vTempAliqCOFINS := FAliqCOFINS;
                end
                else
                begin
                vTempCSTPIS := '75';
                vTempCSTCOFINS := '75';
                end;
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

            vTempNAT_REC := '';
            if rowNcmCfop > -1 then
            begin
              vTempCSTPIS       := IfThen(confNcmCfop.CSVPipe(rowNcmCfop, 3) <> '',
                                          confNcmCfop.CSVPipe(rowNcmCfop, 3), vTempCSTPIS);
              vTempCSTCOFINS    := vTempCSTPIS;
              vTempNAT_REC      := IfThen(confNcmCfop.CSVPipe(rowNcmCfop, 4) <> '',
                                          confNcmCfop.CSVPipe(rowNcmCfop, 4), vTempNAT_REC);
              vTributadoPorQtde := vTempCSTPIS = '03';
              if not vTributadoPorQtde then
              begin
                vTempAliqPIS    := IfThen(confNcmCfop.CSVPipe(rowNcmCfop, 5) <> '',
                                          StrToFloatDef(confNcmCfop.CSVPipe(rowNcmCfop, 5), vTempAliqPIS), vTempAliqPIS);
                vTempAliqCOFINS := IfThen(confNcmCfop.CSVPipe(rowNcmCfop, 6) <> '',
                                      StrToFloatDef(confNcmCfop.CSVPipe(rowNcmCfop, 6), vTempAliqCOFINS), vTempAliqCOFINS);
              end
              else
              begin
                vTempAliqPIS    := IfThen(confNcmCfop.CSVPipe(rowNcmCfop, 7) <> '',
                                      StrToFloatDef(confNcmCfop.CSVPipe(rowNcmCfop, 7), vTempAliqPIS), vTempAliqPIS);
                vTempAliqCOFINS := IfThen(confNcmCfop.CSVPipe(rowNcmCfop, 8) <> '',
                                      StrToFloatDef(confNcmCfop.CSVPipe(rowNcmCfop, 8), vTempAliqCOFINS), vTempAliqCOFINS);
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
            if (vVeiculoUsado) then
              vQrExec2.ParamByName('base_pis').AsFloat := vLucroVeiculoUsado
            else
            if (not vTributadoPorQtde) and (vTempAliqPIS > 0) then
            begin
              StrMod := StrZero(IntToStr(StrToIntDef(Trim(vQrTemp.FieldByName('modelo_nf').AsString), 0)), 2);
              StrMod := IfThen(StrMod = '00', vQrTemp.FieldByName('modelo_nf').AsString, StrMod);
              StrMod := Format('%s_Modelo_%s', [IfThen(vQrTemp.FieldByName('natureza_nf').AsString = 'E', 'Entrada', 'Saida'), StrMod]);
              vQrExec2.ParamByName('base_pis').AsFloat :=
                vQrTemp2.FieldByName('valor_total').AsFloat +
                IfThen((ConfBC.ReadString(StrMod, 'Campo_Seguro'  , 'S') = 'S'), vQrTemp2.FieldByName('rateio_seguro').AsFloat) +
                IfThen((ConfBC.ReadString(StrMod, 'Campo_Outras'  , 'S') = 'S'), vQrTemp2.FieldByName('rateio_outdesp').AsFloat) -
                IfThen((ConfBC.ReadString(StrMod, 'Campo_Desconto', 'S') = 'S'), vQrTemp2.FieldByName('rateio_desconto').AsFloat) +
                IfThen((ConfBC.ReadString(StrMod, 'Campo_Frete'   , 'S') = 'S') and (Trim(vQrTemp.FieldByName('frete_f_nfe').AsString) <> 'S'), vQrTemp2.FieldByName('rateio_frete').AsFloat) +
                IfThen((ConfBC.ReadString(StrMod, 'Campo_ValorIPI', IfThen(vQrTemp.FieldByName('natureza_nf').AsString = 'E', 'S')
                                                                    ) = 'S'), vQrTemp2.FieldByName('valor_ipi').AsFloat);

              {
              else
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
              end;
              }
              vQrExec2.ParamByName('base_pis').AsFloat := StrToFloatFormat(
                vQrExec2.ParamByName('base_pis').AsFloat, 2);

            end
            else if (vTributadoPorQtde) then
            begin
              vQrExec2.ParamByName('quant_bc_pis').AsFloat      := vQrTemp2.FieldByName('quantidade').AsFloat;
              vQrExec2.ParamByName('aliq_pis_quant').AsFloat    := vTempAliqPIS;
              vQrExec2.ParamByName('aliq_cofins_quant').AsFloat := vTempAliqCOFINS;
            end;
            vQrExec2.ParamByName('base_cofins').AsFloat         := vQrExec2.ParamByName('base_pis').AsFloat;
            vQrExec2.ParamByName('quant_bc_cofins').AsFloat     := vQrExec2.ParamByName('quant_bc_pis').AsFloat;

  //          if (vTempCSTCOFINS = '01') or (vTempCSTCOFINS = '02') or
  //            (vTempCSTCOFINS = '50') or (vTempCSTCOFINS = '51') or
  //            (vTempCSTCOFINS = '52') or (vTempCSTCOFINS = '53') or
  //            (vTempCSTCOFINS = '54') or (vTempCSTCOFINS = '55') or
  //            (vTempCSTCOFINS = '56') then
            {
            if (vVeiculoUsado) then
              vQrExec2.ParamByName('base_cofins').AsFloat := vLucroVeiculoUsado
            else
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
            }
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

            if Trim(vTempNAT_REC) <> '' then
              vQrExec2.SQL.Text := StringReplace( vQrExec2.SQL.Text, 'nfi.cst_cofins = :cst_cofins',
                  'nfi.cst_cofins = :cst_cofins, nat_rec = ' + QuotedStr(Copy(Trim(vTempNAT_REC), 1, 3)), [rfReplaceAll, rfIgnoreCase])
            else            
            if vQrTemp2.FieldByName('tipo_item').AsString = 'P' then
            begin
              vQrTemp3.close;
              vQrTemp3.SQL.Text := 'select nat_rec from produtos'+
                ' where grupo_prod = ' + IntToStr(vQrTemp2.FieldByName('grupo_prod').AsInteger) +
                ' and cod_prod = ' + QuotedStr(vQrTemp2.FieldByName('cod_prod').AsString) +
                ' and cod_empresa = ' + FCodEmpresa;// +
//                ' and cst_pis = ' + QuotedStr(vTempCSTPIS);
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

            if FCST_05_BaseZero and vTempCSTPIS.Equals('05') then
            begin
              vQrExec2.ParamByName('base_pis').AsFloat        := 0;
              vQrExec2.ParamByName('base_cofins').AsFloat     := 0;
              vQrExec2.ParamByName('quant_bc_pis').AsFloat    := 0;
              vQrExec2.ParamByName('quant_bc_cofins').AsFloat := 0;
              vQrExec2.ParamByName('valor_pis').AsFloat       := 0;
              vQrExec2.ParamByName('valor_cofins').AsFloat    := 0;
            end;

            vValorPISTotal := vValorPISTotal + vQrExec2.ParamByName('valor_pis').AsFloat;
            vValorCOFINSTotal := vValorCOFINSTotal + vQrExec2.ParamByName('valor_cofins').AsFloat;


            vQrExec2.ParamByName('cod_nf').AsInteger := vQrTemp2.FieldByName('cod_nf').AsInteger;
            vQrExec2.ParamByName('nitem').AsInteger := vQrTemp2.FieldByName('nitem').AsInteger;
            vQrExec2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vQrExec2.ExecSQL;
          end
          else
          begin
            vValorPISTotal := vValorPISTotal + vQrTemp2.FieldByName('valor_pis').AsFloat;
            vValorCOFINSTotal := vValorCOFINSTotal + vQrTemp2.FieldByName('valor_cofins').AsFloat;
          end;
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
        'select COD_SERV_TRANSP, VALOR_TOTAL, VALOR_ICMS from SERVICO_TRANSPORTE st' +
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
          vBasePIS := RoundTo( vQrTemp.FieldByName('VALOR_TOTAL').AsFloat - vQrTemp.FieldByName('VALOR_ICMS').AsFloat, -2);
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

procedure TSpedHw._gravaMD5_RegistrosPAF(query: TIBQuery; pTextoAcript, pTabela,
	pWhere, pCampoMD5: string; pCommit: Boolean);
var
	vTempMD5: string;
begin

	try
		vTempMD5 := _getMd5( pTextoAcript );

		query.Close;
		query.SQL.Text := 'update ' + pTabela + ' set ' + pCampoMD5 + ' = ' + QuotedStr(vTempMD5) +
			' where ' + pWhere;
		query.ExecSQL;

		if pCommit then
			if query.Transaction.InTransaction then
        query.Transaction.Commit;
  except
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
  queryCons: TQuery_OOP;
  qSub: TQuery_OOP;
  iCst: Integer;
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

    queryCons := QueryHelper.CreateObj(vQrTemp);
    qSub := QueryHelper.CreateObj(vQrTemp2);
    try
      FLabelStatus.Caption := 'Definindo PIS/COFINS - Nota Fiscal de Serviços';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      qSub.SQL(
        'update nfse set ' +
        'pc_cst = :pc_cst ' +
        ', pc_vbcpiscofins = :pc_vbcpiscofins ' +
        ', pc_paliqpis = :pc_paliqpis ' +
        ', pc_paliqcofins = :pc_paliqcofins ' +
        ', pc_vpis = :pc_vpis ' +
        ', pc_vcofins = :pc_vcofins ' +
        'where id = :id and cod_empresa = :cod_empresa ')
        .ParamValue('cod_empresa', StrToInt(FCodEmpresa));

      queryCons.SQL(
        'select ' +
        '  n.id, (coalesce(n.vserv, 0) + coalesce(n.vdescincond, 0)) vbc, ' +
        '  ts.cst_pis ' +
        'from nfse n ' +
        'inner join tipo_servico ts on ts.cod_servico = n.cod_servico ' +
        'where n.situacao = 5 and n.natureza_emissao in (0,1) and n.pc_cst is null ' +
        'and n.cod_empresa = :cod_empresa ' +
        'and n.dhemi between :dataini and :datafim',
        [ FCodEmpresa, date_fb(StrToDate(FDataIni)), date_fb(StrToDate(FDataFim)) ])
        .ParamValue('cod_empresa', StrToInt(FCodEmpresa))
        .ParamAsDateTime('dataini', StrToDate(FDataIni))
        .ParamAsDateTime('datafim', StrToDate(FDataFim))
        .Open();

      while not queryCons.Eof do
      begin
        if (Pos('SIMPLES', FRegime) > 0) then
          iCst := 99
        else
          iCst := StrToIntDef(queryCons.fstr('cst_pis'), -1);

        case iCst of
          1..9, 49: vTempCSTPIS := IntToStr(iCst).PadLeft(2, '0').Replace('03', '01'); // CSTs validos
          else
            vTempCSTPIS := IfThen(FAliqPIS > 0, '01', '49'); // Default tributavel com aliquota basica
        end;

        vTempBasePIS := queryCons.fcurr('vbc');
        vTempValorPIS := SimpleRoundTo(vTempBasePIS * FAliqPIS / 100, -2 );
        vTempValorCOFINS := SimpleRoundTo(vTempBasePIS * FAliqCOFINS / 100, -2 );

        iCst := StrToInt(vTempCSTPIS);
        case iCst of
          1,2,3,5:
            qSub
              .ParamAsFloat('pc_vbcpiscofins', vTempBasePIS )
              .ParamAsFloat('pc_paliqpis', FAliqPIS )
              .ParamAsFloat('pc_paliqcofins', FAliqCOFINS )
              .ParamAsFloat('pc_vpis', vTempValorPIS )
              .ParamAsFloat('pc_vcofins', vTempValorCOFINS );
          else
            qSub
              .ParamAsFloat('pc_vbcpiscofins', 0 )
              .ParamAsFloat('pc_paliqpis', 0 )
              .ParamAsFloat('pc_paliqcofins', 0 )
              .ParamAsFloat('pc_vpis', 0 )
              .ParamAsFloat('pc_vcofins', 0 );
        end;

        qSub
          .ParamValue('id', queryCons.fstr('id') )
          .ParamValue('pc_cst', vTempCSTPIS )
          .ExecSQL();

        queryCons.Next();
      end;

      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select ps.nped,  ps.tipo, ps.cod_servico, ps.nitem,  ps.cod_empresa,' +
        ' ps.codigo_nop, (coalesce(ps.valor_nfse,0) + coalesce(ps.irrf_servico,0) + ' +
        ' coalesce(ps.pisrf_servico,0) + coalesce(ps.cofinsrf_servico,0) + coalesce(ps.csslrf_servico,0)' +
        ' + coalesce(ps.issret_servico, 0)' +
        ' ) valor_nfse ,' +
        ' ps.aliq_pis, ps.aliq_cofins, ts.cst_pis, ts.cst_cofins,' +
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
        ' and coalesce(ps.status_nfse,'''') <> ''Autorizada''' +
        ' and coalesce(ps.n_nf, 0) = 0';
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

    queryCons.Free();
    qSub.Free();
  end;
end;

procedure TSpedHw._zerarDadosSpedPISCOFINS;
var
  vQrTemp, vQrExec: TIBQuery;
  queryCons: TQuery_OOP;
begin
  try
    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacaoAux;

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    queryCons := QueryHelper.CreateObj(vQrExec);
    try
      FLabelStatus.Caption := 'Reiniciando dados para o cálculo - Nota Fiscal';
      Application.ProcessMessages;

      if not vTransacaoAux.InTransaction then
        vTransacaoAux.StartTransaction;

      queryCons.SQL('update notafiscal nf set nf.conf_piscofins = null' +
                    ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and cod_empresa = :cod_empresa' +
                    ' and not nf.modelo_nf in (''O'', ''E'')' +
                    ' and not nf.conf_piscofins is null')
        .ParamAsDateTime('dataIni', StrToDate(FDataIni))
        .ParamAsDateTime('dataFim', StrToDate(FDataFim))
        .ParamValue('cod_empresa', StrToInt(FCodEmpresa))
        .ExecSQL();
      {
      vQrExec.Close;
      vQrExec.SQL.Text := 'update notafiscal nf set nf.conf_piscofins = null' +
        ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and cod_empresa = :cod_empresa' +
        ' and not nf.conf_piscofins is null and not nf.tipo_nf in (''O'')';
//        ' and not nf.conf_piscofins is null and not nf.tipo_nf in (''D'', ''O'')';
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;
      }
      queryCons.SQL('update notafiscal nf set nf.conf_piscofins = null' +
                    ' where nf.data_contabil >= :dataIni and nf.data_contabil <= :dataFim and cod_empresa = :cod_empresa' +
                    ' and not nf.conf_piscofins is null and nf.modelo_nf in (''O'', ''E'')')
        .ParamAsDateTime('dataIni', StrToDate(FDataIni))
        .ParamAsDateTime('dataFim', StrToDate(FDataFim))
        .ParamValue('cod_empresa', StrToInt(FCodEmpresa))
        .ExecSQL();
      {
      vQrExec.Close;
      vQrExec.SQL.Text := 'update notafiscal nf set nf.conf_piscofins = null' +
        ' where nf.data_contabil >= :dataIni and nf.data_contabil <= :dataFim and cod_empresa = :cod_empresa' +
        ' and not nf.conf_piscofins is null and nf.modelo_nf in (''O'', ''E'')';
//        ' and not nf.conf_piscofins is null and not nf.tipo_nf in (''D'', ''O'')';
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;
      }

      {
      vQrTemp.Close;
      vQrTemp.SQL.Text :=
        'select  min(nf.cod_nf) minimo, max(nf.cod_nf) maximo from notafiscal nf' +
        ' where nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and cod_empresa = :cod_empresa' +
        ' and not nf.tipo_nf in (''O'')';
//        ' and not nf.tipo_nf in (''D'', ''O'')';
      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrTemp.Open;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update notafiscal_item nfi set nfi.cst_pis = null, nfi.cst_cofins = null,' +
        ' nfi.base_pis = null, nfi.base_cofins = null, nfi.valor_pis = null,' +
        ' nfi.valor_cofins = null, nfi.aliq_pis_quant = null, nfi.aliq_cofins_quant = null,' +
        ' nfi.quant_bc_pis = null, nfi.quant_bc_cofins = null' +
        ' where nfi.cod_nf >= :Ini and nfi.cod_nf <= :Fim and cod_empresa = :cod_empresa' +
        ' and not nfi.tipo_item in (''O'')';
//        ' and not nfi.tipo_item in (''D'', ''O'')';
      vQrExec.ParamByName('Ini').AsInteger := vQrTemp.FieldByName('minimo').AsInteger;
      vQrExec.ParamByName('Fim').AsInteger := vQrTemp.FieldByName('maximo').AsInteger;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;
      }
      {
      SqlExec('update notafiscal_item nfi set nfi.cst_pis = null, nfi.cst_cofins = null,' +
              ' nfi.base_pis = null, nfi.base_cofins = null, nfi.valor_pis = null,' +
              ' nfi.valor_cofins = null, nfi.aliq_pis_quant = null, nfi.aliq_cofins_quant = null,' +
              ' nfi.quant_bc_pis = null, nfi.quant_bc_cofins = null' +
              ' where nfi.cod_nf in (select n.cod_nf from notafiscal n' +
              '                      where n.data_lanc >= %s and n.data_lanc <= %s' +
              '                      and n.cod_empresa = %s and not n.tipo_nf in (''O''))' +
              ' and cod_empresa = %s' +
              ' and not nfi.tipo_item in (''O'')',
              [date_fb(StrToDate(FDataIni)), date_fb(StrToDate(FDataFim)), FCodEmpresa, FCodEmpresa], vQrExec);
      }

      queryCons.SQL(
              'update notafiscal_item nfi set nfi.cst_pis = null, nfi.cst_cofins = null,' +
              ' nfi.base_pis = null, nfi.base_cofins = null, nfi.valor_pis = null,' +
              ' nfi.valor_cofins = null, nfi.aliq_pis_quant = null, nfi.aliq_cofins_quant = null,' +
              ' nfi.quant_bc_pis = null, nfi.quant_bc_cofins = null' +
              ' where nfi.cod_nf in (select n.cod_nf from notafiscal n' +
              '                      where n.data_lanc >= :dataIni and n.data_lanc <= :dataFim' +
              '                        and not n.modelo_nf in (''O'', ''E'')' +
              '                        and n.cod_empresa = :cod_empresa and n.conf_piscofins is null' +
              '                      union distinct' +
              '                      select n.cod_nf from notafiscal n' +
              '                      where n.data_contabil >= :dataIni and n.data_contabil <= :dataFim' +
              '                        and cod_empresa = :cod_empresa' +
              '                        and n.conf_piscofins is null and n.modelo_nf in (''O'', ''E''))' +
              ' and cod_empresa = :cod_empresa')// +
        .ParamAsDateTime('dataIni', StrToDate(FDataIni))
        .ParamAsDateTime('dataFim', StrToDate(FDataFim))
        .ParamValue('cod_empresa', StrToInt(FCodEmpresa))
        .ExecSQL();

      FLabelStatus.Caption := 'Reiniciando dados para o cálculo - Cupom Fiscal';
      Application.ProcessMessages;

      queryCons.SQL('update cupom cp set cp.valor_pis = null, cp.valor_cofins = null' +
                    ' where cp.data >= :dataIni and cp.data <= :dataFim and cp.cod_empresa = :cod_empresa' +
                    ' and ((not cp.valor_pis is null) or (not cp.valor_cofins is null))')
        .ParamAsDateTime('dataIni', StrToDate(FDataIni))
        .ParamAsDateTime('dataFim', StrToDate(FDataFim))
        .ParamValue('cod_empresa', StrToInt(FCodEmpresa))
        .ExecSQL();

      {
      vQrExec.Close;
      vQrExec.SQL.Text := 'update cupom cp set cp.valor_pis = null, cp.valor_cofins = null' +
        ' where cp.data >= :dataIni and cp.data <= :dataFim and cp.cod_empresa = :cod_empresa' +
        ' and ((not cp.valor_pis is null) or (not cp.valor_cofins is null))';
      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;
      }

      FLabelStatus.Caption := 'Reiniciando dados para o cálculo - Nota Fiscal de Serviço';
      Application.ProcessMessages;
      {
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
      }
      SqlExec('update nfse set pc_cst = null ' +
              'where situacao = 5 and natureza_emissao in (0,1) ' +
              'and cod_empresa = %s ' +
              'and dhemi between %s and %s',
              [ FCodEmpresa, date_fb(StrToDate(FDataIni)), date_fb(StrToDate(FDataFim)) ], vQrExec);

      SqlExec('update pedvenda_serv ps set ps.cst_pis = null, ps.cst_cofins = null' +
              ' where ps.nped in (select pv.nped from pedvenda pv' +
              '                   where pv.data_nfext >= %s and pv.data_nfext <= %s and pv.cod_empresa = %s and pv.tipo = ''OS'')' +
              ' and ps.cod_empresa = %s and ps.tipo = ''OS''' +
              ' and ((not ps.cst_pis is null) or (not ps.cst_cofins is null))',
              [date_fb(StrToDate(FDataIni)), date_fb(StrToDate(FDataFim)), FCodEmpresa, FCodEmpresa], vQrExec);

      FLabelStatus.Caption := 'Reiniciando dados para o cálculo - Nota Fiscal modelo 02';
      Application.ProcessMessages;
      {
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
      }
      SqlExec('update nf_serie_d_itens ndi set ndi.cst_pis = null, ndi.cst_cofins = null' +
              ' where ndi.numeronota in (select nd.numeronota from nf_serie_d nd ' +
              '                          where nd.dataemissao >= %s and nd.dataemissao <= %s' +
              '                          and nd.cod_empresa = %s)' +
              ' and ndi.cod_empresa = %s' +
              ' and ((not ndi.cst_pis is null) or (not ndi.cst_cofins is null))',
              [date_fb(StrToDate(FDataIni)), date_fb(StrToDate(FDataFim)), FCodEmpresa, FCodEmpresa], vQrExec);

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

    except on E: Exception do
      begin
        LogApp.Error('TSpedHw._zerarDadosSpedPISCOFINS: %s', [E.Message]);
        if vTransacaoAux.InTransaction then
          vTransacaoAux.Rollback;
      end;
    end;
  finally
    FreeAndNil(queryCons);

    vQrExec.Free;
    vQrExec := nil;

    vQrTemp.Free;
    vQrTemp := nil;
  end;
end;

{ TSingleton }

function TSingleton.codifica(wtexto: string): string;
var
  wnormal, wcripto, wsembranco, wresultado: string;
  wtam, wi, wposicao: integer;
begin
  wsembranco := wtexto;
  wresultado := '';
  wtam := length(trim(wsembranco));
  wnormal := '  ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-&*:\/.';
  wcripto := 'œ!=#$%^&*(-|\][›?><:@Ÿ/{}¯àQWERTYUIOPASDFGHJKLZXCVBNM1324580976+ºusabcd';
  for wi := 1 to wtam do
  begin
    wposicao := pos(copy(wsembranco, wi, 1), wnormal);
    wresultado := wresultado + copy(wcripto, wposicao, 1);
  end;
  codifica := wresultado;
end;

constructor TSingleton.Create;
begin

end;

class function TSingleton.GetInstance: TSingleton;
begin
  if FInstance = nil then
  begin
    FInstance := TSingleton.Create();
  end;
  Result := FInstance;
end;

procedure TSingleton.GravaAuditoria(vCodProcesso, vAcao, vMensagem, vTabela, vCodigoTabMov: string; qrBusca: TIBQuery);
var
  vUsarSenhaGerente, vNomeProcesso, vGravAuditoriaProcesso: string;
  vNivelProcesso: Integer;
  vUsuarioAutorizou: string;
  vNivelGerente: Integer;
begin
  qrBusca.Close;
  qrBusca.SQL.Text :=
    'select NIVEL_PROCESSO,NOME_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA from TABELA_PROCESSOS where COD_PROCESSO = ' +
    quotedstr(vCodProcesso) +
    ' AND COD_EMPRESA = ' + vCodEmpresa + ' AND ATIVO = 1';
  qrBusca.open;
  if qrBusca.IsEmpty then
  begin
    Application.MessageBox(pchar('Processo ' + vCodProcesso +
      ' não definido na tabela de Processos'),
      'Erro', MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  vUsarSenhaGerente := qrBusca.FieldByName('senha_gerente').AsString;
  vNivelProcesso := qrBusca.FieldByName('nivel_processo').AsInteger;
  vNomeProcesso := qrBusca.FieldByName('nome_processo').AsString;
  vGravAuditoriaProcesso := qrBusca.FieldByName('GRAVAR_AUDITORIA').AsString;

  vUsuarioAutorizou := '';
  vNivelGerente := 0;
  gravarAuditoria_DX((vNomeUsuario),
    (vUsuarioAutorizou),
    (vCodProcesso),
    (vAcao),
    (vNomeProcesso + ' - ' + vMensagem),
    (vTabela),
    (vCodigoTabMov),
    (vCodEmpresa));
end;

function TSingleton.PesqPros(vCodProcesso, vAcao, vMensagem, vTabela, vCodigoTabMov: string; qrBusca: TIBQuery;
  vGravarAuditoria, pConfirmarContinuacao: Boolean): boolean;
var
  vUsarSenhaGerente, vNomeProcesso, vGravAuditoriaProcesso: string;
  vNivelProcesso, vCodEmpPadrao: Integer;
  vUsuarioAutorizou: string;
  vNivelGerente: Integer;
begin
  try
    qrBusca.Close;
    qrBusca.SQL.Text :=
      'select NIVEL_PROCESSO,NOME_PROCESSO, SENHA_GERENTE, GRAVAR_AUDITORIA from TABELA_PROCESSOS where COD_PROCESSO = ' +
      quotedstr(vCodProcesso) +
      ' AND COD_EMPRESA = ' + vCodEmpresa + ' AND ATIVO = 1';
    qrBusca.open;
    if qrBusca.IsEmpty then
    begin
      Application.MessageBox(pchar('Processo ' + vCodProcesso +
        ' não definido na tabela de Processos'),
        'Erro', MB_ICONINFORMATION + MB_OK);
      Result := False;
      exit;
    end;
    vUsarSenhaGerente := qrBusca.FieldByName('senha_gerente').AsString;
    vNivelProcesso := qrBusca.FieldByName('nivel_processo').AsInteger;
    vNomeProcesso := qrBusca.FieldByName('nome_processo').AsString;
    vGravAuditoriaProcesso := qrBusca.FieldByName('GRAVAR_AUDITORIA').AsString;
    vUsuarioAutorizou := '';
    vNivelGerente := 0;
    if vUsarSenhaGerente = 'S' then
    begin

      Application.CreateForm(TFrmPesqProsSPED, FRMPesqProsSPED);
      try
        FRMPesqProsSPED.Caption := '[' + vCodProcesso + '] - Liberação de Acesso Gerência';
        FRMPesqProsSPED.Panel2.Caption := Trim(vNomeProcesso);
        if vModoTreino = 'S' then
        begin
          FRMPesqProsSPED.MaskEdit1.Text := 'HW';
          FRMPesqProsSPED.MaskEdit2.Text := 'EUJJ'; // nao faz diferensa a senha ser diferente pois logo abaixo o sistema nao pesquisa pela senha
        end;
        FRMPesqProsSPED.ShowModal;
        if FRMPesqProsSPED.ModalResult <> mrOk then
        begin
          Result := False;
          Exit;
        end;

        qrBusca.Close;
        qrBusca.SQL.Text := 'select * from senhas' +
          ' where usuario = ' + QuotedStr(Trim(FRMPesqProsSPED.MaskEdit1.Text)) +
          ' and emp_padrao > 0 and ativo = 1 and cod_empresa = ' + vCodEmpresa;
        qrBusca.Open;
        if qrBusca.FieldByName('emp_padrao').AsInteger  > 0 then
          vCodEmpPadrao := qrBusca.FieldByName('emp_padrao').AsInteger
        else
          vCodEmpPadrao := StrToInt(vCodEmpresa);

        qrBusca.Close;
        qrBusca.SQL.Text := 'select NIVEL_US, USUARIO, ativo from SENHAS' +
          ' where USUARIO = ' + QuotedStr(Trim(FRMPesqProsSPED.MaskEdit1.Text)) +
          ' and COD_EMPRESA = ' + IntToStr(vCodEmpPadrao);
        if vModoTreino <> 'S' then
          qrBusca.SQL.Text :=  qrBusca.SQL.Text +
          ' and SENHA = ' + QuotedStr(codifica(Trim(FRMPesqProsSPED.MaskEdit2.Text)));
        qrBusca.Open;

        if qrBusca.IsEmpty then
        begin
         Application.MessageBox(pchar('Senha inválida para o usuário!'), 'Erro', MB_ICONERROR
            + MB_OK);
          Result := False;
          Exit;
        end;
        vUsuarioAutorizou := qrBusca.FieldByName('USUARIO').AsString;

        if (StrToInt(vCodEmpresa) = vCodEmpPadrao) and (qrBusca.FieldByName('ativo').AsInteger = 1) then
          vNivelGerente := qrBusca.FieldByName('NIVEL_US').AsInteger
        else
        begin
          qrBusca.Close;
          qrBusca.SQL.Text := 'select NIVEL_US, USUARIO from SENHAS' +
            ' where USUARIO = ' + QuotedStr(Trim(FRMPesqProsSPED.MaskEdit1.Text)) +
            ' and ativo = 1 and COD_EMPRESA = ' + vCodEmpresa;
          qrBusca.Open;

          if qrBusca.IsEmpty then
          begin
           Application.MessageBox(pchar('Usuário não tem acesso a esta empresa!'), 'Erro', MB_ICONERROR
              + MB_OK);
            Result := False;
            Exit;
          end;
          vNivelGerente := qrBusca.FieldByName('NIVEL_US').AsInteger
        end;

        qrBusca.Close;
        if vNivelProcesso > vNivelGerente then
        begin
          qrBusca.Close;
          qrBusca.SQL.Text :=
          ' SELECT 1 FIRST FROM TABELA_PROCESSOS T '
          + ' LEFT JOIN TABELA_PROCESSOS_USUARIOS TU ON TU.COD_PROCESSO = T.COD_PROCESSO '
          + ' AND TU.COD_EMPRESA = T.COD_EMPRESA '
          + ' WHERE T.COD_EMPRESA = ' + vCodEmpresa + ' AND T.ATIVO =1 AND TU.USUARIO='
          + QuotedStr(trim(FRMPesqProsSPED.MaskEdit1.Text)) +
          ' AND T.COD_PROCESSO = ' + QuotedStr(vCodProcesso) + '';
          qrBusca.Open;

          if not qrBusca.IsEmpty then
          begin
            Result := True;
            exit;
          end;

          Application.MessageBox(pchar('Processo' +
            ' não Permitido para o usuário' + #13 + #13 +
            'Código: ' + vCodProcesso + #13 +
            'Processo: ' + vNomeProcesso),
            'Erro', MB_ICONINFORMATION + MB_OK);
          Result := False;
          Exit;
        end;
      finally
        FreeAndNil(FrmPesqProsSPED);
      end;
      if pConfirmarContinuacao then
        if Application.MessageBox('Deseja continuar mesmo assim', 'Confirmação', MB_ICONQUESTION + MB_YESNO ) <> ID_YES then
        begin
          Result := False;
          Exit;
        end;
      if ((vGravarAuditoria) or (vGravAuditoriaProcesso = 'S')) then
        gravarAuditoria_DX((vNomeUsuario),
          (vUsuarioAutorizou),
          (vCodProcesso),
          (vAcao),
          (vNomeProcesso + ' - ' + vMensagem),
          (vTabela),
          (vCodigoTabMov),
          (vCodEmpresa));
      Result := true;
      Exit;
    end;

    if vNivelProcesso > vNivel then
    begin
      qrBusca.Close;
      qrBusca.SQL.Text :=
        ' SELECT 1 FIRST FROM TABELA_PROCESSOS T '
        + ' LEFT JOIN TABELA_PROCESSOS_USUARIOS TU ON TU.COD_PROCESSO = T.COD_PROCESSO '
        + ' AND TU.COD_EMPRESA = T.COD_EMPRESA '
        + ' WHERE T.COD_EMPRESA = ' + vCodEmpresa + ' AND T.ATIVO =1 AND TU.USUARIO=' +
        QuotedStr(vNomeUsuario) +
        ' AND T.COD_PROCESSO = ' + QuotedStr(vCodProcesso) + '';
      qrBusca.Open;

      if not qrBusca.IsEmpty then
      begin
        Result := True;
        exit;
      end;

      if vInibeMensPesqPros <> 'S' then
        Application.MessageBox(pchar('Processo' +
          ' não Permitido para o usuário' + #13 + #13 +
          'Código: ' + vCodProcesso + #13 +
          'Processo: ' + vNomeProcesso),
          'Erro', MB_ICONINFORMATION + MB_OK)
      else
        vInibeMensPesqPros := '';

      Result := False;
      Exit;
    end;
    if pConfirmarContinuacao then
      if Application.MessageBox('Deseja continuar mesmo assim', 'Confirmação', MB_ICONQUESTION + MB_YESNO ) <> ID_YES then
      begin
        Result := False;
        Exit;
      end;

    if ((vGravarAuditoria) or (vGravAuditoriaProcesso = 'S')) then
      gravarAuditoria_DX((vNomeUsuario),
        (vUsuarioAutorizou),
        (vCodProcesso),
        (vAcao),
        (vNomeProcesso + ' - ' + vMensagem),
        (vTabela),
        (vCodigoTabMov),
        (vCodEmpresa));
    Result := true;
    Exit;
  finally
    vInibeMensPesqPros := '';
  end;
end;

end.
