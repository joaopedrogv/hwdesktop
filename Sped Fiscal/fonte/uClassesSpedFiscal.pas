unit uClassesSpedFiscal;

interface

uses
  StdCtrls, ComCtrls, IBQuery, Classes, IBDataBase, ACBrSpedFiscal, uSpedHw; //,
//    IBTransaction;

const
  Sigla: array[1..27] of string = ('AC', 'AC', 'AM', 'RR', 'PA', 'AP', 'TO', 'MA', 'PI', 'CE', 'RN',
    'PB', 'PE', 'AL', 'SE', 'BA', 'MG', 'ES', 'RJ', 'SP', 'PR', 'SC', 'RS', 'MS', 'MT', 'GO', 'DF');
  IBGE: array[1..27] of string = ('11', '12', '13', '14', '15', '16', '17', '21', '22', '23', '24',
    '25', '26', '27', '28', '29', '31', '32', '33', '35', '41', '42', '43', '50', '51', '52', '53');

type

  //TSpedFiscal = class
  TSpedFiscal = class(TSpedHw)
  private
    //Componentes de Conexao do Banco
    //vEnderecoBanco: string;
    //vConexao: TIBDataBase;
    //vTransacao, vTransacaoAux: TIBTransaction;
    //vNivel0, vNivel2, vNivel3, vNivel4, vNivel5, vNivel6, vQrAux, vQrAux1: TIBQuery;

    //Valores Bloco E
    FVL_TOT_DEBITOS, FVL_AJ_DEBITOS, FVL_TOT_CREDITOS, FVL_AJ_CREDITOS, FVL_TOT_DED: Currency;

    //
//    FDataIni, FDataFim: string;
//    FSpedF: TACBrSPEDFiscal;
//    FBloco0, FBlocoC, FBlocoD, FBlocoE, FBlocoG, FBlocoH, FBloco1, FBloco9: boolean;
//    FCodEmpresa, FFinalidade, FDestino, FRegime: string;
//    FParticipantes: TStringList;
//    F0190: TStringList;
    F0300: TStringList;
//    F0400: TStringList;
//    F0450: TStringList;
    F0460: TStringList;
//    FC400: TStringList;
//    FAliqPIS, FAliqCOFINS, FValorPISAcumulado, FValorCOFINSAcumulado: Currency;
    FVL_DEVOL_ST: array[1..27] of Currency;
    //    FVL_RESSARC_ST: array[1..27] of Currency;
    FVL_OUT_CRED_ST: array[1..27] of Currency;
    FVL_AJ_CREDITOS_ST: array[1..27] of Currency;
    FVL_RETENCAO_ST: array[1..27] of Currency;
    FVL_AJ_DEBITOS_ST: array[1..27] of Currency;
    FDEB_ESP_ST: array[1..27] of Currency;
    FSigla: array[1..27] of string;
    fApurarST, fApurarIPI: Boolean;
    fApurarSTAnt, fStIpiEmMerc: Boolean;
    fefd_icms_desconsiderar_insc_st_apuracao: Boolean;
    ListCodAJ_E220_ST_Recolhido: TStrings;
    fDiaVencICMS: Smallint;
    fCOD_OR_E116, fCOD_REC_E116, fCOD_OR_E250, fCOD_REC_E250: string;
    fUFIBGE: string;
    fApurarStIpiEmOutDesp: string;
    fH005GerarMotivo01: Boolean;
    FCodContador: Integer;
    FIndexUFEmpresa: Integer;
//    FDataInv: string;

    //Layout  Numero|CPF / CNPJ     |Nome do Participante
    //        NNNNNN|XXXXXXXXXXXXXXX|CCCCCCCCCCCCCCC......
    //Caso necessite por causa do Servico de transporte
//    function StrZero(Num: string; Tam: Integer): string; overload;
//    function SpaceStr(vStr: string; Tam: Integer): string;
//    function StrToFloatFormat(valor: Currency; casasDecimais: integer): Currency;
//    function getParticipante(codigo, cpfcnpj: string): string;
    function getUFParticipante(codigo: string): string;
    function getSiglaUFParticipante(codigo: string): string;
//    function conectarBanco: boolean;
//    function getCampoBlobString(vTexto: AnsiString): AnsiString;
    procedure verificaFormasPagS(numNf: integer; dataNF, serieNF: string);
//    procedure verificaNfSerieD;
    procedure verificaCSTIPI;
//    procedure verificaCamposNuloNF;
//    function verificaCupomSemZ(pNSerieECF: string; pCodTerminal: integer): boolean;
    //procedure verificaCamposNullCupom(pNSerieECF: string; pCodTerminal: integer);
//    procedure verificaPISCOFINSNFSerieD;
//    procedure verificaDataServicoTransporte;
//    function gravaSpedItem(tipo: string; grupo_prod: integer; cod_prod: string;
//      chassi: string; cod_servico: integer; cod_outras: string; unid: string): boolean;
//    function getUnidade(tipo: string; grupo_prod: integer; cod_prod: string;
//      chassi: string; cod_servico: integer; cod_outras: string): string;
//    procedure apagarSpedItem;
    procedure somaFVL_DEVOL_ST(cod_part: string; pVL_DEVOL_ST: Currency);
    procedure somaFVL_OUT_CRED_ST(cod_part: string; pVL_OUT_CRED_ST: Currency);
    //    procedure somaFVL_RESSARC_ST(cod_part: string; pVL_RESSARC_ST: Currency);
    procedure somaFVL_AJ_CREDITOS_ST(UF: string; pVL_AJ_CREDITOS_ST: Currency);
    procedure somaFVL_RETENCAO_ST(cod_part: string; pVL_RETENCAO_ST: Currency);
    procedure somaFVL_AJ_DEBITOS_ST(UF: string; pVL_AJ_DEBITOS_ST: Currency);
    procedure somaFDEB_ESP_ST(UF: string; pDEB_ESP_ST: Currency);
    procedure setSTEstado(cod_part: string);
//    procedure montaRegistro0150(pCOD_PART: string);
//    procedure montaRegistro0190(pUNID: string);
//    procedure montaRegistro0190e0200;
    procedure montaRegistro0300(pCOD_IND_BEM: string);
//    procedure montaRegistro0400(pCOD_NAT: string);
//    procedure montaRegistro0450(pCOD_INF: integer; pTXT: string);
    procedure montaRegistro0460(pCOD_OBS: integer; pTXT: string);
//    procedure montaRegistroC400(pCOD_MOD, pECF_MOD, pECF_FAB, pECF_CX: string);
    procedure montarBloco0;
    procedure montarBlocoC;
    procedure montarBlocoD;
    procedure montarBlocoE;
    procedure montarBlocoG;
    procedure montarBlocoH;
    procedure montarBlocoK;
    procedure montarBloco1;


//    function getCampoPipe(plinha: string; pOrdem: integer): string;
  public
    procedure abreFormSpedFiscal(codEmpresa, EndBanco: string);
    procedure verificarConfiguracoes;
    constructor create;
    destructor Destroy; override;

    procedure teste;
    procedure iniciaSpedFiscal;

//    property DataIni: string read FDataIni write FDataIni;
//    property DataFim: string read FDataFim write FDataFim;
//    property DataInv: string read FDataInv write FDataInv;
//    property Finalidade: string read FFinalidade write FFinalidade;
//    property Destino: string read FDestino write FDestino;
//    property CodEmpresa: string read FCodEmpresa write FCodEmpresa;
//    property EnderecoBanco: string read vEnderecoBanco write vEnderecoBanco;
//    property vBloco0: boolean read FBloco0 write FBloco0;
//    property vBlocoC: boolean read FBlocoC write FBlocoC;
//    property vBlocoD: boolean read FBlocoD write FBlocoD;
//    property vBlocoE: boolean read FBlocoE write FBlocoE;
//    property vBlocoG: boolean read FBlocoG write FBlocoG;
//    property vBlocoH: boolean read FBlocoH write FBlocoH;
//    property vBloco1: boolean read FBloco1 write FBloco1;
//    property vBloco9: boolean read FBloco9 write FBloco9;
  end;

implementation

uses
  Forms, SysUtils, ACBrEFDBloco_0, ACBrEFDBlocos, DB, ACBrEFDBloco_C,
  ACBRSpedFiscalUtilHw, Controls, ACBrEFDBloco_C_Class, ACBrEFDBloco_D,
  ACBrEFDBloco_E, DateUtils, ACBrEFDBloco_H, ACBrEFDBloco_G, ACBrEFDBloco_1,
  uFormSpedFiscal, ACBrEFDBloco_0_Class, IBScript, uDiferencaE310entreE316, 
  Windows;

{ TSpedFiscal }

procedure TSpedFiscal.abreFormSpedFiscal(codEmpresa, EndBanco: string);
begin
  Application.CreateForm(TfrmSpedFiscal, frmSpedFiscal);
  try
    frmSpedFiscal.vCodEmpresa := codEmpresa;
    frmSpedFiscal.vEndBanco := EndBanco;
    frmSpedFiscal.ShowModal;
  finally
    frmSpedFiscal.Free;
    frmSpedFiscal := nil;
  end;
end;

constructor TSpedFiscal.create;
begin
  FSpedF := TACBrSPEDFiscal.Create(Application);
  FSpedF.TrimString := True;
  FSpedF.CurMascara := '#0.00';
  FSpedF.Delimitador := '|';

  FParticipantes := TStringList.Create;
  F0190 := TStringList.Create;
  F0300 := TStringList.Create;
  F0400 := TStringList.Create;
  F0450 := TStringList.Create;
  F0460 := TStringList.Create;
  FC400 := TStringList.Create;

  vConexao := TIBDatabase.Create(Application);
  vTransacao := TIBTransaction.Create(Application);
  vTransacaoAux := TIBTransaction.Create(Application);

  vTransacao.DefaultDatabase := vConexao;
  vTransacaoAux.DefaultDatabase := vConexao;

  vTransacao.Params.Add('read_committed');
  vTransacao.Params.Add('rec_version');
  vTransacao.Params.Add('nowait');
  vTransacaoAux.Params.Add('read_committed');
  vTransacaoAux.Params.Add('rec_version');
  vTransacaoAux.Params.Add('nowait');

  vConexao.Connected := False;
  vConexao.DefaultTransaction := vTransacao;
  vConexao.LoginPrompt := false;
  vConexao.Params.Add('user_name=sysdba');
  vConexao.Params.Add('password=masterkey');

  vNivel0 := TIBQuery.Create(Application);
  vNivel0.Database := vConexao;
  vNivel0.Transaction := vTransacao;
  vNivel2 := TIBQuery.Create(Application);
  vNivel2.Database := vConexao;
  vNivel2.Transaction := vTransacao;
  vNivel3 := TIBQuery.Create(Application);
  vNivel3.Database := vConexao;
  vNivel3.Transaction := vTransacao;
  vNivel4 := TIBQuery.Create(Application);
  vNivel4.Database := vConexao;
  vNivel4.Transaction := vTransacao;
  vNivel5 := TIBQuery.Create(Application);
  vNivel5.Database := vConexao;
  vNivel5.Transaction := vTransacao;
  vNivel6 := TIBQuery.Create(Application);
  vNivel6.Database := vConexao;
  vNivel6.Transaction := vTransacao;
  vQrAux := TIBQuery.Create(Application);
  vQrAux.Database := vConexao;
  vQrAux.Transaction := vTransacao;
  vQrAux1 := TIBQuery.Create(Application);
  vQrAux1.Database := vConexao;
  vQrAux1.Transaction := vTransacao;

  SpedFiscalOuPisCofins := 'F';

end;

destructor TSpedFiscal.Destroy;
begin
  //  vNivel0.Close; vNivel1.Close; vNivel2.Close; vNivel3.Close; vNivel4.Close;
  //  vNivel5.Close; vNivel6.Close;
  vNivel0.Free; vNivel2.Free; vNivel3.Free; vNivel4.Free; vNivel5.Free;
  vNivel6.Free; vTransacao.Free; vTransacaoAux.Free; vConexao.Free; vQrAux.Free; vQrAux1.Free;

  vNivel0 := nil; vNivel2 := nil; vNivel3 := nil; vNivel4 := nil; vNivel5 := nil;
  vNivel6 := nil; vTransacao := nil; vTransacaoAux := nil; vConexao := nil; vQrAux := nil; vQrAux1
  := nil;
  inherited;
end;

//function TSpedFiscal.getCampoBlobString(vTexto: AnsiString): AnsiString;
//var
//  lista: TMemo;
//  I: Integer;
//begin
//  lista := TMemo.Create(Application);
//  try
//    Result := '';
//    lista.Visible := false;
//    lista.Parent := Application.MainForm;
//    lista.Width := 800;
//    lista.Height := 800;
//    lista.WordWrap := False;
//    lista.Clear;
//    lista.Lines.Text := vTexto;
//    for I := 0 to lista.lines.Count - 1 do
//      Result := Result + lista.Lines[i] + ' ';
//    Result := Trim(Result);
//  finally
//    lista.Free;
//    lista := nil;
//  end;
//end;

//function TSpedFiscal.getCampoPipe(plinha: string; pOrdem: integer): string;
//var
//  vTemp:string;
//  vInc: Smallint;
//begin
//  vTemp := plinha;
//  vInc := 0;
//  while pos('|',vTemp) > 0 do
//  begin
//    inc(vInc);
//    if pOrdem =  vInc then
//    begin
//      vTemp := Copy(vTemp,1, pos('|',vTemp) - 1);
//      Result := Trim(vTemp);
//      exit;
//    end;
//    vTemp := Copy(vTemp,pos('|',vTemp) + 1,length(vTemp));
//  end;
//  Result := '';
//end;

//function TSpedFiscal.getParticipante(codigo, cpfcnpj: string): string;
//var
//  I: Integer;
//begin
//  for I := 0 to FParticipantes.Count - 1 do
//    if Trim(copy(FParticipantes[i], pos('|', FParticipantes[i]) + 1, length(FParticipantes[i])))
//      = (Trim(cpfcnpj)) then
//    begin
//      Result := Copy(FParticipantes[i], 1, pos('|', FParticipantes[i]) - 1);
//      Exit;
//    end;
//  FParticipantes.Add(Trim(codigo) + '|' + Trim(cpfcnpj));
//  Result := '';
//end;

function TSpedFiscal.getSiglaUFParticipante(codigo: string): string;
var
  I: Integer;
begin
  for I := 0 to FParticipantes.Count - 1 do
    if copy(FParticipantes[I], 1, pos('|', FParticipantes[I]) - 1) = codigo then
    begin
      Result := getCampoPipe(FParticipantes[i],3);
      Exit;
    end;
  Result := '';
end;

function TSpedFiscal.getUFParticipante(codigo: string): string;
var
  I: Integer;
begin
  for I := 0 to FParticipantes.Count - 1 do
    if copy(FParticipantes[I], 1, pos('|', FParticipantes[I]) - 1) = codigo then
    begin        
      Result := getCampoPipe(FParticipantes[i],2);
//      Result := copy(Trim(copy(FParticipantes[i], pos('|', FParticipantes[i]) + 1,
//        length(FParticipantes[i]))), 1, 2);
      Exit;
    end;
  Result := '';
end;
       {
function TSpedFiscal.getUnidade(tipo: string; grupo_prod: integer; cod_prod,
  chassi: string; cod_servico: integer; cod_outras: string): string;
begin
  try
    vQrAux.Close;
    if tipo = 'P' then
    begin
      vQrAux.SQL.Text := 'select first 1 unid from sped_item' +
        ' where grupo_prod = :grupo_prod and cod_prod = :cod_prod' +
        ' and cod_empresa = :cod_empresa';
      vQrAux.ParamByName('grupo_prod').AsInteger := grupo_prod;
      vQrAux.ParamByName('cod_prod').AsString := cod_prod;
      vQrAux.ParamByName('cod_empresa').AsString := FCodEmpresa;
    end
    else if tipo = 'S' then
    begin
      vQrAux.SQL.Text := 'select first 1 unid from sped_item' +
        ' where cod_servico = :cod_servico and cod_empresa = :cod_empresa';
      vQrAux.ParamByName('cod_servico').AsInteger := cod_servico;
      vQrAux.ParamByName('cod_empresa').AsString := FCodEmpresa;
    end
    else if tipo = 'V' then
    begin
      vQrAux.SQL.Text := 'select first 1 unid from sped_item' +
        ' where chassi = :chassi and cod_empresa = :cod_empresa';
      vQrAux.ParamByName('chassi').AsString := chassi;
      vQrAux.ParamByName('cod_empresa').AsString := FCodEmpresa;
    end
    else if (tipo = 'O') or (tipo = 'D') then
    begin
      vQrAux.SQL.Text  := 'select first 1 unid from sped_item' +
        ' where cod_outras = :cod_outras and cod_empresa = :cod_empresa';
      vQrAux.ParamByName('cod_outras').AsString := cod_outras;
      vQrAux.ParamByName('cod_empresa').AsString := FCodEmpresa;
    end;
    vQrAux.SQL.Text  := vQrAux.SQL.Text + ' and tipo = '+QuotedStr(tipo);
    vQrAux.Open;
    result := Trim(vQrAux.FieldByName('unid').AsString);
    vQrAux.Close;
  except
    on e: exception do begin
      Result := '';
      Application.MessageBox(pchar('Erro ao gravar item para o tipo 200. Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;     }

//function TSpedFiscal.gravaSpedItem(tipo: string; grupo_prod: integer; cod_prod,
//  chassi: string; cod_servico: integer; cod_outras: string; unid: string): boolean;
//begin
//  try
//    montaRegistro0190(UpperCase(unid));
//    vQrAux.Close;
//    vQrAux.SQL.Text := 'select first 1 * from sped_item where ' +
//      ' cod_empresa = :cod_empresa and tipo = :tipo and' +
//      ' grupo_prod = :grupo_prod and cod_prod = :cod_prod and' +
//      ' chassi = :chassi and cod_servico = :cod_servico and cod_outras = :cod_outras';
//    vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//    vQrAux.ParamByName('tipo').AsString := tipo;
//    vQrAux.ParamByName('grupo_prod').AsInteger := grupo_prod;
//    vQrAux.ParamByName('cod_prod').AsString := cod_prod;
//    vQrAux.ParamByName('chassi').AsString := chassi;
//    vQrAux.ParamByName('cod_servico').AsInteger := cod_servico;
//    vQrAux.ParamByName('cod_outras').AsString := cod_outras;
//    vQrAux.Open;
//    if vQrAux.IsEmpty then
//    begin
//      vQrAux.Close;
//      vQrAux.SQL.Text :=
//        'INSERT INTO SPED_ITEM (COD_EMPRESA, TIPO, GRUPO_PROD, COD_PROD, CHASSI, COD_SERVICO, COD_OUTRAS, UNID)' +
//        ' VALUES (:COD_EMPRESA, :TIPO, :GRUPO_PROD, :COD_PROD, :CHASSI, :COD_SERVICO, :COD_OUTRAS, :UNID)';
//      vQrAux.ParamByName('COD_EMPRESA').AsInteger := StrToInt(FCodEmpresa);
//      vQrAux.ParamByName('TIPO').AsString := tipo;
//      vQrAux.ParamByName('GRUPO_PROD').AsInteger := grupo_prod;
//      vQrAux.ParamByName('COD_PROD').AsString := cod_prod;
//      vQrAux.ParamByName('CHASSI').AsString := chassi;
//      vQrAux.ParamByName('COD_SERVICO').AsInteger := cod_servico;
//      vQrAux.ParamByName('COD_OUTRAS').AsString := cod_outras;
//      vQrAux.ParamByName('UNID').AsString := UpperCase(unid);
//      vQrAux.Prepare;
//      vQrAux.ExecSQL;
//    end;
//  except
//    on e: exception do begin
//      Result := False;
//      Application.MessageBox(pchar('Erro ao gravar item para o tipo 200. Erro: ' + e.Message),
//        'Atenção', 0 + 64);
//    end;
//  end;
//end;

procedure TSpedFiscal.iniciaSpedFiscal;
var
  I: Integer;

begin
  //  vEnderecoBanco := 'c:\basesauto\motomol\hwauto.fdb';
  //  FCodEmpresa := '1';
  if not conectarBanco then
  begin

    exit;
  end;
  FParticipantes.Clear;
  F0190.Clear;
  F0300.Clear;
  F0400.Clear;
  F0450.Clear;
  F0460.Clear;
  FC400.Clear;
  for I := 1 to 27 do begin
    FVL_DEVOL_ST[i] := 0;
    FVL_OUT_CRED_ST[i] := 0;
    //    FVL_RESSARC_ST[i] := 0;
    FVL_AJ_CREDITOS_ST[i] := 0;
    FVL_RETENCAO_ST[i] := 0;
    FVL_AJ_DEBITOS_ST[i] := 0;
    FDEB_ESP_ST[i] := 0;
    FSigla[i] := '';
  end;

  fH005GerarMotivo01 := False;
  if vBlocoH then
//    if Copy(FDataIni, 4, 2) = '02' then
//      fH005GerarMotivo01 := True
//    else
      fH005GerarMotivo01 := Application.MessageBox('Deseja registro de inventário para motivo 01: "No final do periodo"?',
        'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;

  FSpedF.Path := ExtractFilePath(FDestino);
  FSpedF.Arquivo := ExtractFileName(FDestino);
  FSpedF.TrimString := True;

  FLabelBloco.Caption := 'Bloco 0';
  FLabelStatus.Caption := 'Iniciando';
  apagarSpedItem;
  if vBloco0 then
    montarBloco0;
  FLabelBloco.Caption := 'Bloco C';
  FLabelStatus.Caption := 'Iniciando';
  if vBlocoC then
    montarBlocoC;
  FLabelBloco.Caption := 'Bloco D';
  FLabelStatus.Caption := 'Iniciando';
  if vBlocoD then
    montarBlocoD;
  FLabelBloco.Caption := 'Bloco E';
  FLabelStatus.Caption := 'Iniciando';
  if vBlocoE then
    montarBlocoE;
  FLabelBloco.Caption := 'Bloco G';
  FLabelStatus.Caption := 'Iniciando';
  if vBlocoG then
    montarBlocoG;
  FLabelBloco.Caption := 'Bloco H';
  FLabelStatus.Caption := 'Iniciando';
  if vBlocoH then
    montarBlocoH;
  FLabelBloco.Caption := 'Bloco 1';
  FLabelStatus.Caption := 'Iniciando';
  if vBloco1 then
    montarBloco1;

  FLabelStatus.Caption := 'Finalizando';

//  montaRegistro0190e0200;
  montaRegistro0200;

  FSpedF.DT_INI := StrToDate(DataIni);
  FSpedF.DT_FIN := StrToDate(DataFim);
  FSpedF.LinhasBuffer := 1000;

  FSpedF.SaveFileTXT;

  gravaCreditoDoPeriodo;

  FLabelCupons.Caption := '';

  FLabelStatus.Caption := 'Finalizado';
end;

procedure TSpedFiscal.montarBloco0;
var
  vScriptTemp : TIBScript;
  vListTmp: TStringList;
  I: Integer;
begin
  vNivel0.Close;
  vNivel0.SQL.Text := 'select SPED_APURAR_ST, SPED_F_DIA_VENC_ICMS, ' +
    ' SPED_F_COD_REC_E116, SPED_F_COD_REC_E250, SPED_F_COD_OB_REC_E116,' +
    ' SPED_F_COD_OB_REC_E250, SPED_STIPI_OUTD from empresa where cod_empresa = ' + FCodEmpresa;
  try
    vNivel0.Open;
  except
    try
      vScriptTemp := TIBScript.Create(Application);
      vScriptTemp.Database := vConexao;
      vScriptTemp.Transaction := vTransacao;

//      vScriptTemp.Script.Text :=
      vListTmp := TStringList.Create;
      vListTmp.Text :=
        'ALTER TABLE EMPRESA ADD SPED_APURAR_ST CHAR(1);' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_DIA_VENC_ICMS SMALLINT;' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_COD_REC_E116 VARCHAR(64);' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_COD_REC_E250 VARCHAR(64);' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_COD_OB_REC_E116 VARCHAR(3);' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_STIPI_OUTD CHAR(1);' + #13 +
        'UPDATE EMPRESA SET SPED_STIPI_OUTD = SPED_F_APURAR_STIPI_OUT_DESP WHERE SPED_STIPI_OUTD IS NULL;' + #13 +
        'ALTER TABLE EMPRESA ADD SPED_F_COD_OB_REC_E250 VARCHAR(3);';

      for I := 0 to vListTmp.Count - 1 do
        try
          vScriptTemp.Script.Text := vListTmp[I];
          vScriptTemp.ExecuteScript;
        except
        end;
      if vScriptTemp.Transaction.InTransaction then
        vScriptTemp.Transaction.Commit;
    finally
      vScriptTemp.Free;
      vScriptTemp := nil;
    end;
  end;

  
  vNivel0.Close;
  vNivel0.SQL.Text := 'select first 1 seqid from PRODUTOS_ALTERACOES' +
    ' where seqid = 0 and cod_empresa = 0';
  try
    vNivel0.Open;
  except
    try
      vScriptTemp := TIBScript.Create(Application);
      vScriptTemp.Database := vConexao;
      vScriptTemp.Transaction := vTransacao;

      vListTmp := TStringList.Create;
      vListTmp.Clear;
      vListTmp.Add('CREATE TABLE PRODUTOS_ALTERACOES ( SEQID INTEGER NOT NULL, COD_EMPRESA INTEGER NOT NULL);');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD GRUPO_PROD  INTEGER NOT NULL;');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD COD_PROD CHAR(6) NOT NULL;');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD TIPO_ALT CHAR(1);');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD VALOR_ANTERIOR VARCHAR(32);');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DATA_ALTERACAO TIMESTAMP;');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DATA_HORA_WS TIMESTAMP;');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD MOV_SPED CHAR(7);');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DATA_INI TIMESTAMP;');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DESCR_PROD_ANTERIOR VARCHAR(75);');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD DATA_HORA_ALT_WS TIMESTAMP;');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD CONSTRAINT PK_PRODUTOS_ALTERACOES PRIMARY KEY (SEQID, COD_EMPRESA);');
      vListTmp.Add('ALTER TABLE PRODUTOS_ALTERACOES ADD CONSTRAINT FK_PRODUTOS_ALTERACOES_PROD FOREIGN KEY (GRUPO_PROD, COD_PROD, COD_EMPRESA) REFERENCES PRODUTOS (GRUPO_PROD, COD_PROD, COD_EMPRESA) ON DELETE CASCADE ON UPDATE CASCADE;');

      for I := 0 to vListTmp.Count - 1 do
        try
          vScriptTemp.Script.Text := vListTmp[I];
          vScriptTemp.ExecuteScript;
        except
        end;
      if vScriptTemp.Transaction.InTransaction then
        vScriptTemp.Transaction.Commit;
    finally
      vScriptTemp.Free;
    end;
  end;
  
  vNivel0.Close;
  vNivel0.SQL.Text := 'select first 1 cod_contador from P_CONTAS_CONTABIL' +
    ' where cod_cta = ''.'' and cod_empresa = 0';
  try
    vNivel0.Open;
  except
    try
      vScriptTemp := TIBScript.Create(Application);
      vScriptTemp.Database := vConexao;
      vScriptTemp.Transaction := vTransacao;

      vListTmp := TStringList.Create;
      vListTmp.Text :=
        'ALTER TABLE P_CONTAS_CONTABIL ADD COD_CONTADOR INTEGER';

      for I := 0 to vListTmp.Count - 1 do
        try
          vScriptTemp.Script.Text := vListTmp[I];
          vScriptTemp.ExecuteScript;
        except
        end;
      if vScriptTemp.Transaction.InTransaction then
        vScriptTemp.Transaction.Commit;
    finally
      vScriptTemp.Free;
      vScriptTemp := nil;
    end;
  end;

  vNivel0.Close;
  vNivel0.SQL.Text := 'select em.nome_emp NOME, em.cgc_emp CNPJ, es.sigla_uf UF, em.ie_emp IE,' +
    ' em.ibge_cod_cidade COD_MUN, em.im_emp IM, em.sped_suframa SUFRAMA,' +
    ' em.sped_ind_perfil IND_PERFIL, em.sped_ind_ativ IND_ATIV,' +
    ' em.fantasia_emp fantasia, em.cep_emp CEP, em.endreco_emp "END",' +
    ' em.numero_end NUM, complemento_emp COMPL, em.bairro_emp BAIRRO,' +
    ' em.telefone_emp FONE,'''' FAX, em.email_emp email, em.cod_contador,' +
    ' em.pis_emp, em.cofins_emp, em.regime, em.sped_apurar_st, em.contribuinte_ipi,' +
    ' em.sped_f_dia_venc_icms, em.sped_f_cod_rec_e116, em.sped_f_cod_rec_e250,' +
    ' em.sped_f_cod_ob_rec_e116, sped_f_cod_ob_rec_e250, SPED_STIPI_OUTD' +
    ' from empresa em' +
    ' inner join estados es on es.codigo_uf = em.uf_emp' +
    ' where em.cod_empresa = :cod_empresa';
  vNivel0.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel0.Open;

  if vNivel0.IsEmpty then
  begin
    //Tratar arqui mensagem ou log
  end
  else
  begin
    FRegime := Trim(vNivel0.FieldByName('regime').AsString);
    FAliqPIS := vNivel0.FieldByName('pis_emp').AsCurrency;
    FAliqCOFINS := vNivel0.FieldByName('cofins_emp').AsCurrency;
    fApurarST := vNivel0.FieldByName('sped_apurar_st').AsString = 'S';
    fApurarIPI := vNivel0.FieldByName('contribuinte_ipi').AsString = 'S';
    fDiaVencICMS := vNivel0.FieldByName('sped_f_dia_venc_icms').AsInteger; 
    fCOD_REC_E116 := vNivel0.FieldByName('sped_f_cod_rec_e116').AsString;
    fCOD_REC_E250 := vNivel0.FieldByName('sped_f_cod_rec_e250').AsString;
    fCOD_OR_E116 := vNivel0.FieldByName('sped_f_cod_ob_rec_e116').AsString;
    fCOD_OR_E250 := vNivel0.FieldByName('sped_f_cod_ob_rec_e250').AsString;
    fApurarStIpiEmOutDesp := vNivel0.FieldByName('SPED_STIPI_OUTD').AsString;

    verificarConfiguracoes;
    vNivel0.Open;

    fefd_icms_desconsiderar_insc_st_apuracao := getConfSisBool('efd_icms_desconsiderar_insc_st_apuracao', vQrAux);
    ListCodAJ_E220_ST_Recolhido := TStringList.Create;
    ListCodAJ_E220_ST_Recolhido := getConfSisBlob('efd_icms_e220_cod_ajuste_st_recolhida', vQrAux);
    fApurarSTAnt := getConfSisBool('efd_icms_e200_apurar_st_antcipacao', vQrAux);
    fStIpiEmMerc  := getConfSisBool('efd_icms_valor_st_ipi_em_vlmerc', vQrAux);
  end;

  with FSpedF.Bloco_0.Registro0000New do
  begin
    if StrToDate(DataIni) >= StrToDate('01/01/2017') then
      COD_VER := vlVersao110
    else if StrToDate(DataIni) >= StrToDate('01/01/2016') then
      COD_VER := vlVersao109
    else if StrToDate(DataIni) >= StrToDate('01/01/2015') then
      COD_VER := vlVersao108
    else if StrToDate(DataIni) >= StrToDate('01/01/2014') then
      COD_VER := vlVersao107
    else if StrToDate(DataIni) >= StrToDate('01/01/2013') then
      COD_VER := vlVersao106
    else if StrToDate(DataIni) >= StrToDate('01/07/2012') then
      COD_VER := vlVersao105
    else if StrToDate(DataIni) >= StrToDate('01/01/2012') then
      COD_VER := vlVersao104
    else if StrToDate(DataIni) >= StrToDate('01/01/2011') then
      COD_VER := vlVersao103
    else
      COD_VER := vlVersao102;

    if FFinalidade = 'Substituto' then
      COD_FIN := raSubstituto
    else
      COD_FIN := raOriginal;
    DT_INI := StrToDate(DataIni);
    DT_FIN := StrToDate(DataFim);
    NOME := Trim(vNivel0.FieldByName('NOME').AsString);
    CNPJ := Trim(vNivel0.FieldByName('CNPJ').AsString);
    FCnpjEmpresa := CNPJ;
    CPF := '';
    UF := vNivel0.FieldByName('UF').AsString;
    FIndexUFEmpresa := -1;
    for I := 1 to 27 do
      if UF = Sigla[I] then
        FIndexUFEmpresa := I;
    IE := vNivel0.FieldByName('IE').AsString;
    if vNivel0.FieldByName('COD_MUN').AsString <> '' then
      COD_MUN := vNivel0.FieldByName('COD_MUN').AsInteger;
    fUFIBGE := Copy(vNivel0.FieldByName('COD_MUN').AsString,1,2);
    IM := Trim(vNivel0.FieldByName('IM').AsString);
    SUFRAMA := Trim(vNivel0.FieldByName('SUFRAMA').AsString);
    if vNivel0.FieldByName('IND_PERFIL').AsString = 'A' then
      IND_PERFIL := pfPerfilA
    else if vNivel0.FieldByName('IND_PERFIL').AsString = 'B' then
      IND_PERFIL := pfPerfilB
    else
      IND_PERFIL := pfPerfilC;
    if vNivel0.FieldByName('IND_ATIV').AsString = '0' then
      IND_ATIV := atIndustrial
    else
      IND_ATIV := atOutros;
  end;

  with FSpedF.Bloco_0.Registro0001New do
  begin
    IND_MOV := imComDados;
  end;

  with FSpedF.Bloco_0.Registro0005New do
  begin
    FANTASIA := Trim(vNivel0.FieldByName('FANTASIA').AsString);
    CEP := Trim(vNivel0.FieldByName('CEP').AsString);
    ENDERECO := Trim(vNivel0.FieldByName('END').AsString);
    NUM := Copy(Trim(vNivel0.FieldByName('NUM').AsString),1,10);
    COMPL := Trim(vNivel0.FieldByName('COMPL').AsString);
    BAIRRO := Trim(vNivel0.FieldByName('BAIRRO').AsString);
    FONE := vNivel0.FieldByName('FONE').AsString;
    FONE := StringReplace( FONE, '(', '', [rfReplaceAll]);
    FONE := StringReplace( FONE, ')', '', [rfReplaceAll]);
    FONE := StringReplace( FONE, '-', '', [rfReplaceAll]);
    FONE := StringReplace( FONE, ' ', '', [rfReplaceAll]);
    FAX := vNivel0.FieldByName('FAX').AsString;
    EMAIL := Trim(vNivel0.FieldByName('EMAIL').AsString);
  end;

  vNivel2.Close;
  vNivel2.SQL.Text := 'select esb.sigla_uf uf_st, esb.inscricao ie_st from empresa_substituto esb' +
    ' where esb.cod_empresa = :cod_empresa';
  vNivel2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.Open;

  while not vNivel2.Eof do
  begin
    with FSpedF.Bloco_0.Registro0015New do
    begin
      UF_ST := vNivel2.FieldByName('UF_ST').AsString;
      IE_ST := vNivel2.FieldByName('IE_ST').AsString;
    end;
    vNivel2.Next;
  end;

  vNivel2.Close;
  vNivel2.SQL.Text :=
    'select ct.nome_cont NOME, ct.cpfcnpj_cont CPF, ct.crc, ct.cnpj_escritorio CNPJ,' +
    ' ct.cep_cont CEP, ct.endereco_cont "END", ct.numero NUM, ct.complemento COMPL,' +
    ' ct.bairro_cont BAIRRO, ct.fone_cont FONE, ct.fax_cont FAX, ct.email_cont EMAIL,' +
    ' cd.ibge_cod_cidade COD_MUN, ct.cod_contador' +
    ' from contador ct' +
    ' inner join empresa em on em.cod_empresa = ct.cod_empresa and em.cod_contador =' +
    ' ct.cod_contador' +
    ' left join cidades cd on cd.cod_cidade = ct.cod_cidade' +
    ' where ct.cod_empresa = :cod_empresa AND CT.cod_contador = :cod_contador';
  vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.ParamByName('cod_contador').AsInteger := vNivel0.FieldByName('cod_contador').AsInteger;
  vNivel2.Open;

  if vNivel2.IsEmpty then
  begin
    //Tratar aqui
  end;

  FCodContador := vNivel2.FieldByName('cod_contador').AsInteger;

  while not vNivel2.Eof do
  begin
    with FSpedF.Bloco_0.Registro0100New do
    begin
      NOME := Trim(vNivel2.FieldByName('NOME').AsString);
      CPF := Trim(vNivel2.FieldByName('CPF').AsString);
      CRC := Trim(vNivel2.FieldByName('CRC').AsString);
      CNPJ := Trim(vNivel2.FieldByName('CNPJ').AsString);
      CEP := Trim(vNivel2.FieldByName('CEP').AsString);
      ENDERECO := Trim(vNivel2.FieldByName('END').AsString);
      NUM := Copy(Trim(vNivel2.FieldByName('NUM').AsString),1,10);
      COMPL := Trim(vNivel2.FieldByName('COMPL').AsString);
      BAIRRO := Trim(vNivel2.FieldByName('BAIRRO').AsString);
      FONE := Trim(vNivel2.FieldByName('FONE').AsString);
      FAX := Trim(vNivel2.FieldByName('FAX').AsString);
      EMAIL := Trim(vNivel2.FieldByName('EMAIL').AsString);
      if vNivel2.FieldByName('COD_MUN').AsString <> '' then
        COD_MUN := vNivel2.FieldByName('COD_MUN').AsInteger;
    end;
    vNivel2.Next;
  end;

  FLabelStatus.Caption := 'Montando registro 0500 - Plano de Contas Contábil';
  vNivel2.Close;
  vNivel2.SQL.Text :=
    'select pc.dt_alt,  pc.cod_nat_cc, pc.ind_cta, pc.nivel, pc.cod_cta, pc.nome_cta' +
    ' from p_contas_contabil pc where pc.cod_empresa = :cod_empresa' +
    ' and pc.cod_contador = ' + IntToStr(FCodContador);
  vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.Open;

  vNivel2.FetchAll;

  FProgressBar.Position := 0;
  FProgressBar.Min := 0;
  FProgressBar.Max := vNivel2.RecordCount;

  vNivel2.First;
  while not vNivel2.Eof do
  begin
    Application.ProcessMessages;
    with FSpedF.Bloco_0.Registro0500New do
    begin
      if vNivel2.FieldByName('DT_ALT').AsDateTime > StrToDate(FDataIni) then
        DT_ALT := StrToDate(FDataIni)
      else
        DT_ALT := vNivel2.FieldByName('DT_ALT').AsDateTime;
      COD_NAT_CC := Trim(vNivel2.FieldByName('COD_NAT_CC').AsString);
      IND_CTA := Trim(vNivel2.FieldByName('IND_CTA').AsString);
      NIVEL := Trim(vNivel2.FieldByName('NIVEL').AsString);
      COD_CTA := Trim(vNivel2.FieldByName('COD_CTA').AsString);
      NOME_CTA := Trim(vNivel2.FieldByName('NOME_CTA').AsString);
    end;
    vNivel2.Next;
    FProgressBar.Position := FProgressBar.Position + 1;
  end;

  FLabelStatus.Caption := 'Montando registro 0600 - Centro de Custos';
  vNivel2.Close;
  vNivel2.SQL.Text :=
    'select cc.cod_ccus, cc.ccus, cc.dt_alt' +
    ' from centro_custos cc where cc.cod_empresa = :cod_empresa';
  vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
  vNivel2.Open;

  vNivel2.FetchAll;

  FProgressBar.Position := 0;
  FProgressBar.Min := 0;
  FProgressBar.Max := vNivel2.RecordCount;

  vNivel2.First;
  while not vNivel2.Eof do
  begin
    Application.ProcessMessages;
    with FSpedF.Bloco_0.Registro0600New do
    begin
      if vNivel2.FieldByName('DT_ALT').AsDateTime > StrToDate(FDataIni) then
        DT_ALT := StrToDate(FDataIni)
      else
        DT_ALT := vNivel2.FieldByName('DT_ALT').AsDateTime;
      COD_CCUS := Trim(vNivel2.FieldByName('cod_ccus').AsString);
      CCUS := Trim(vNivel2.FieldByName('ccus').AsString);
    end;
    vNivel2.Next;
    FProgressBar.Position := FProgressBar.Position + 1;
  end;
  FLabelStatus.Caption := '';

  //Registro 0460 deve ser gerado assim que o registro C190 for informado.
  //Registro C195 sao dados complementares do registro 0460, portanto deve
  //ser gerado caso nao suporte todo o texto no 0460

  FVL_TOT_DEBITOS := 0;
  FVL_AJ_DEBITOS := 0;
  FVL_TOT_CREDITOS := 0;
  FVL_AJ_CREDITOS := 0;
  FVL_TOT_DED := 0;

end;

procedure TSpedFiscal.montarBloco1;
var
  v0200ComProdAgro: Boolean;
  Conf1600: TStrings;
  VincularCadastroAdm, AjustarOperacaoDebitoCreditoPeloVencimento: string;
  QtdeMaximaDiasPrazoParaConsiderarDebito: Integer;
begin
  try
    FSpedF.Bloco_1.Registro1001New.IND_MOV := imSemDados;
    FLabelStatus.Caption := 'Montando registro 1200';

    vNivel2.Close;
    vNivel2.SQL.Text :=
      'select * from sped_cont_cred_fisc sf where sf.cod_empresa = :cod_empresa and' +
      ' sf.data_movimento >= :dataIni and sf.data_movimento <= :dataFim';
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.Open;

    vNivel2.FetchAll;

    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;

    if StrToDate(DataIni) >= StrToDate('01/07/2012') then
    begin

      FSpedF.Bloco_1.Registro1001.IND_MOV := imComDados;

      with FSpedF.Bloco_1.Registro1010New do
      begin
        IND_EXP := 'N';
        IND_CCRF := 'N';
        IND_COMB := 'N';
        IND_USINA := 'N';
        IND_VA := 'N';
        IND_EE := 'N';
        IND_CART := 'N';
        IND_FORM := 'N';
        IND_AER := 'N';

        if vNivel2.RecordCount > 0 then
        begin
          FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
          with FSpedF.Bloco_1.Registro1200New do
          begin
            vNivel2.First;
            while not vNivel2.Eof do
            begin
              COD_AJ_APUR := Trim(vNivel2.FieldByName('COD_AJ_APUR').AsString);
              SLD_CRED := vNivel2.FieldByName('SLD_CRED').AsCurrency;
              CRED_APR := vNivel2.FieldByName('CRED_APR').AsCurrency;
              CRED_RECEB := vNivel2.FieldByName('CRED_RECEB').AsCurrency;
              CRED_UTIL := vNivel2.FieldByName('CRED_UTIL').AsCurrency;
              SLD_CRED_FIM := vNivel2.FieldByName('SLD_CRED_FIM').AsCurrency;

              vNivel3.Close;
              vNivel3.SQL.Text :=
                'select * from sped_cont_cred_fisc_util su where su.cod_empresa = :cod_empresa and' +
                ' su.cod_cont_cred_f = :cod_cont_cred_f';
              vNivel3.ParamByName('cod_cont_cred_f').AsInteger :=
                vNivel2.FieldByName('cod_cont_cred_f').AsInteger;
              vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel3.Open;

              vNivel3.First;
              while not vNivel3.Eof do
              begin
                with FSpedF.Bloco_1.Registro1210New do
                begin
                  TIPO_UTIL := Trim(vNivel3.FieldByName('TIPO_UTIL').AsString);
                  NR_DOC := Trim(vNivel3.FieldByName('NR_DOC').AsString);
                  VL_CRED_UTIL := vNivel3.FieldByName('VL_CRED_UTIL').AsCurrency;
                end;
                vNivel3.Next;
              end;
              vNivel2.Next;
              FProgressBar.Position := FProgressBar.Position + 1;
            end;
          end;
          if not vNivel2.IsEmpty then
            IND_CCRF := 'S';
        end;

        FLabelStatus.Caption := 'Montando registro 1400';

        vNivel2.Close;
        vNivel2.SQL.Text :=
          'select c.IBGE_COD_CIDADE, ''Produtos_Agropecuarios'' cod_item, sum(valor_total) valor_total from notafiscal nf' +
          ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
          ' inner join cidades c on c.cod_cidade = cl.cod_cidade' +
          ' inner join tipos_clientes tc on tc.codigo_tipo = cl.codigo_tipo' +
          ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim' +
          ' and nf.natureza_nf = ''E'' and nf.emissao_propria = ''S'' and nf.status = ''Fechada''' +
          ' and ((nf.modelo_nf <> ''55'') or ( nf.situacao_nfe = ''Autorizada''))' +
          ' and tc.DESCRICAO_TIPO = ''PRODUTOR RURAL NAO EMITENTE''' +
          ' group by 1';
//          fazer union aqui com o select das coperativas, ver o cfop de remessa para deposito e ver se vai usar o sum nos itens da nf
        vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
        vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
        vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel2.Open;

        vNivel2.FetchAll;

        FProgressBar.Position := 0;
        FProgressBar.Min := 0;
        FProgressBar.Max := vNivel2.RecordCount;
        v0200ComProdAgro := False;

        if vNivel2.RecordCount > 0 then
        begin
          FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
          vNivel2.First;
          while not vNivel2.Eof do
          begin
            with FSpedF.Bloco_1.Registro1400New do
            begin
              COD_ITEM := vNivel2.FieldByName('cod_item').AsString;
              MUN := vNivel2.FieldByName('IBGE_COD_CIDADE').AsString;
              VALOR := vNivel2.FieldByName('valor_total').AsFloat;
            end;
            if (Trim(vNivel2.FieldByName('cod_item').AsString) = 'Produtos_Agropecuarios') and (not v0200ComProdAgro) then
            begin
              v0200ComProdAgro := True;
              with FSpedF.Bloco_0.Registro0200New do
              begin
                COD_ITEM := 'Produtos_Agropecuarios';
                DESCR_ITEM := 'Produtos Agropecuários/Hortifrutigranjeiros';
                UNID_INV := 'UN';
                TIPO_ITEM := tiOutras;
              end;
            end;
            vNivel2.Next;
            FProgressBar.Position := FProgressBar.Position + 1;
          end;
          if not vNivel2.IsEmpty then
            IND_VA := 'S';
        end;

        FLabelStatus.Caption := 'Montando registro 1600';

        Conf1600                                   := TStringList.Create;
        Conf1600                                   := getConfSisBlob('efd_icms_1600_conf_cartao', vQrAux);
        VincularCadastroAdm                        := GetIni('Cartao1600', 'VincularCadastroAdm', 'N', Conf1600);
        AjustarOperacaoDebitoCreditoPeloVencimento := GetIni('Cartao1600', 'AjustarOperacaoDebitoCreditoPeloVencimento', 'N', Conf1600);
        QtdeMaximaDiasPrazoParaConsiderarDebito    := StrToIntDef(GetIni('Cartao1600', 'QtdeMaximaDiasPrazoParaConsiderarDebito', '5', Conf1600), 5);

        if VincularCadastroAdm  = 'S' then
        begin
          vNivel2.Close;
          vNivel2.SQL.Text := 'select ad.cod_cliente COD_PART,' +
//            '--case when tr.operacao is null then' +
//            '--  case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
//            '--    case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
//            '--  else' +
//            '--    case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
//            '--  end' +
//            '--else' +
//            '--  tr.operacao' +
//            '--end  operacao,' +
            'sum (' +
            ' case when' +
            '   case when tr.operacao is null then' +
            '     case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
            '       case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
            '     else' +
            '       case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
            '     end' +
            '   else' +
            '     tr.operacao' +
            '   end = ''D'' then fp.valordoc' +
            ' else' +
            '   0' +
            ' end) TOT_DEBITO,' +
            ' sum (' +
            ' case when case when tr.operacao is null then' +
            '     case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
            '       case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
            '     else' +
            '       case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
            '     end' +
            '   else' +
            '     tr.operacao' +
            '   end = ''C'' then fp.valordoc' +
            ' else' +
            '   0' +
            ' end) TOT_CREDITO' +
            ' from formpagamento fp' +
            ' inner join controles cl on cl.codigo_ctrl = fp.cod_controle and cl.codigo_emp = fp.cod_empresa' +
            ' left join terminal_cartao tc on tc.cod_term_adm = fp.cod_terminal_adm and tc.cod_empresa = fp.cod_empresa' +
            ' left join adm_cartao ad on ad.cod_adm = tc.cod_adm and ad.cod_empresa = tc.cod_empresa' +
            ' left join transacao_cartao tr on tr.cod_empresa = fp.cod_empresa and tr.cod_terminal_adm = fp.cod_terminal_adm and tr.n_aut_cart = fp.n_aut_cart and tr.n_docnsu_adm = fp.n_docnsu_adm' +
            ' where ((cl.cartao_sped = 1) or (cl.cartao_sped = 2)) and fp.cod_empresa = :cod_empresa and' +
            ' fp.data_mov >= :dataIni and fp.data_mov <= :dataFim group by 1';
          vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
          vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
          vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel2.ParamByName('AjustarOperacaoDebitoCreditoPeloVencimento').AsString := AjustarOperacaoDebitoCreditoPeloVencimento;
          vNivel2.Open;
        end
        else
        begin
          vNivel2.Close;
          vNivel2.SQL.Text := 'select cl.cartao_sped_part COD_PART,' +
            ' sum (case when case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
            '       case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
            '     else' +
            '       case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
            '     end = ''D'' then fp.valordoc else 0 end) TOT_DEBITO,' +
            ' sum (case when case when :AjustarOperacaoDebitoCreditoPeloVencimento = ''S'' then' +
            '       case when (fp.data_venc - fp.data_mov) <= ' + IntToStr(QtdeMaximaDiasPrazoParaConsiderarDebito) + ' then ''D'' else ''C'' end' +
            '     else' +
            '       case when cl.cartao_sped = 1 then ''D'' else ''C'' end' +
            '     end = ''C'' then fp.valordoc else 0 end) TOT_CREDITO' +
            '  from formpagamento fp' +
            ' inner join controles cl on cl.codigo_ctrl = fp.cod_controle and cl.codigo_emp = fp.cod_empresa' +
            ' where ((cl.cartao_sped = 1) or (cl.cartao_sped = 2)) and fp.cod_empresa = :cod_empresa and' +
            ' fp.data_mov >= :dataIni and fp.data_mov <= :dataFim group by 1';
          vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
          vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
          vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel2.ParamByName('AjustarOperacaoDebitoCreditoPeloVencimento').AsString := AjustarOperacaoDebitoCreditoPeloVencimento;
          vNivel2.Open;
        end;

        vNivel2.FetchAll;

        FProgressBar.Position := 0;
        FProgressBar.Min := 0;
        FProgressBar.Max := vNivel2.RecordCount;

        if vNivel2.RecordCount > 0 then
        begin
          FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
               
          vNivel2.First;
          while not vNivel2.Eof do
          begin
            with FSpedF.Bloco_1.Registro1600New do
            begin
              COD_PART := vNivel2.FieldByName('COD_PART').AsString;
              montaRegistro0150(COD_PART);
              TOT_CREDITO := vNivel2.FieldByName('TOT_CREDITO').AsCurrency;
              TOT_DEBITO := vNivel2.FieldByName('TOT_DEBITO').AsCurrency;
            end;
            vNivel2.Next;
            FProgressBar.Position := FProgressBar.Position + 1;
          end;
          if not vNivel2.IsEmpty then
            IND_CART := 'S';
        end;

      end;

    end
    else
    begin

      if vNivel2.RecordCount > 0 then
      begin
        FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
        with FSpedF.Bloco_1.Registro1200New do
        begin
          vNivel2.First;
          while not vNivel2.Eof do
          begin
            COD_AJ_APUR := Trim(vNivel2.FieldByName('COD_AJ_APUR').AsString);
            SLD_CRED := vNivel2.FieldByName('SLD_CRED').AsCurrency;
            CRED_APR := vNivel2.FieldByName('CRED_APR').AsCurrency;
            CRED_RECEB := vNivel2.FieldByName('CRED_RECEB').AsCurrency;
            CRED_UTIL := vNivel2.FieldByName('CRED_UTIL').AsCurrency;
            SLD_CRED_FIM := vNivel2.FieldByName('SLD_CRED_FIM').AsCurrency;

            vNivel3.Close;
            vNivel3.SQL.Text :=
              'select * from sped_cont_cred_fisc_util su where su.cod_empresa = :cod_empresa and' +
              ' su.cod_cont_cred_f = :cod_cont_cred_f';
            vNivel3.ParamByName('cod_cont_cred_f').AsInteger :=
              vNivel2.FieldByName('cod_cont_cred_f').AsInteger;
            vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.Open;

            vNivel3.First;
            while not vNivel3.Eof do
            begin
              with FSpedF.Bloco_1.Registro1210New do
              begin
                TIPO_UTIL := Trim(vNivel3.FieldByName('TIPO_UTIL').AsString);
                NR_DOC := Trim(vNivel3.FieldByName('NR_DOC').AsString);
                VL_CRED_UTIL := vNivel3.FieldByName('VL_CRED_UTIL').AsCurrency;
              end;
              vNivel3.Next;
            end;
            vNivel2.Next;
            FProgressBar.Position := FProgressBar.Position + 1;
          end;
        end;
      end;

      FLabelStatus.Caption := 'Montando registro 1600';

      vNivel2.Close;
      vNivel2.SQL.Text := 'select cl.cartao_sped_part COD_PART,' +
        ' sum (case when cl.cartao_sped = 1 then fp.valordoc else 0 end) TOT_DEBITO,' +
        ' sum (case when cl.cartao_sped = 2 then fp.valordoc else 0 end) TOT_CREDITO' +
        '  from formpagamento fp' +
        ' inner join controles cl on cl.codigo_ctrl = fp.cod_controle and cl.codigo_emp = fp.cod_empresa' +
        ' where ((cl.cartao_sped = 1) or (cl.cartao_sped = 2)) and fp.cod_empresa = :cod_empresa and' +
        ' fp.data_mov >= :dataIni and fp.data_mov <= :dataFim group by 1';
      vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel2.Open;

      vNivel2.FetchAll;

      FProgressBar.Position := 0;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel2.RecordCount;

      if vNivel2.RecordCount > 0 then
      begin
        FSpedF.Bloco_1.Registro1001New.IND_MOV := imComDados;
             
        vNivel2.First;
        while not vNivel2.Eof do
        begin
          with FSpedF.Bloco_1.Registro1600New do
          begin
            COD_PART := vNivel2.FieldByName('COD_PART').AsString;
            montaRegistro0150(COD_PART);
            TOT_CREDITO := vNivel2.FieldByName('TOT_CREDITO').AsCurrency;
            TOT_DEBITO := vNivel2.FieldByName('TOT_DEBITO').AsCurrency;
          end;
          vNivel2.Next;
          FProgressBar.Position := FProgressBar.Position + 1;
        end;
      end;

    end;
  finally
    vNivel2.Close;
    vNivel3.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoC;
var
  vCampoString: AnsiString;
  vIntegerTemp: Integer;
  vBooleanTemp, vOK: Boolean;
  vCurrencyTemp, vCurrencySoma: Currency;
  vStringTemp, vStringTemp2: string;
  vListaTemp, vListaTotalizadores, vListaSumC470, vListaUltimosC490: TStringList;
  I, J, K, L, M: Integer;
  vOKST, vBreak: Boolean;
  vSomarST, vMensagemDevolucao: Boolean;
  vTempStr: string;
begin
  try
    vMensagemDevolucao := False;
    verificaCamposNuloNF;
    if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao109 then
      verificaICMSInterestadual;
    FSpedF.Bloco_C.RegistroC001.IND_MOV := imSemDados;

    vListaTemp := TStringList.Create;;
    vListaTemp.Clear;

    vListaTotalizadores := TStringList.Create;;
    vListaTotalizadores.Clear;

    vQrAux.Close;
    vQrAux.SQL.Text := 'select nf.num_nf from notafiscal nf' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status = ''Aberta'' and' +
      ' nf.emissao_propria = ''S'' and natureza_nf = ''E'' and situacao_nfe = ''Autorizada'' and' +
      ' nf.modelo_nf  = ''55'' and (nf.da is null or nf.da <> ''S'')';
    vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vQrAux.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vQrAux.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vQrAux.Open;

    vStringTemp := '';
    vQrAux.First;
    while not vQrAux.Eof do
    begin
      vStringTemp := vStringTemp + vQrAux.FieldByName('num_nf').AsString + ', ';
      vQrAux.Next;
    end;

    if Trim(vStringTemp ) <> '' then
    begin
      Delete(vStringTemp, Length(Trim(vStringTemp)), 1);
      Application.MessageBox(pchar('Existem notas fiscais de emissão própria Autorizadas sem Confirmação: ' + vStringTemp),
        'Atenção', 64);
    end;

    vStringTemp := '';

    vNivel2.Close;
    vNivel2.SQL.Text := 'select nf.cod_nf, nf.natureza_nf,' +
      ' case when nf.natureza_nf = ''E'' then ''0''' +
      '     else ''1'' end IND_OPER,' +
      ' case when nf.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
      ' else nf.serie end SER, nf.num_nf NUM_DOC, nf.chave_nfe CHV_NFE, nf.data_lanc DT_DOC,' +
      ' nf.data_ent_saida DT_E_S, nf.valor_total VL_DOC, co.desc_cond_pag IND_PGTO,' +
      ' nf.valor_desc VL_DESC, 0 VL_ABAT_NT, (nf.valor_prod + nf.valor_serv) VL_MERC,' +
      ' case when ((nf.valor_frete is null) or (nf.valor_frete = 0) or' +
      '     (nf.frete_f_nfe = ''S'')) then ''9''' +
      '     else nf.freteconta_tr' +
      ' end IND_FRT,' +
      ' case when nf.frete_f_nfe = ''S'' then 0' +
      '     else nf.valor_frete' +
      ' end VL_FRT, nf.valor_seguro VL_SEG, nf.valor_out_desp VL_OUT_DA, nf.base_icm' +
      ' VL_BC_ICMS, nf.valor_icm VL_ICMS, nf.base_icmsub VL_BC_ICMS_ST, nf.valor_icmsub' +
      ' VL_ICMS_ST, nf.valor_ipi VL_IPI, nf.valor_pis VL_PIS, nf.valor_cofins VL_COFINS,' +
      ' nf.valor_pis_st VL_PIS_ST, nf.valor_cofins_st VL_COFINS_ST, nf.status,' +
      ' nf.TIPO_EMISSAO, nf.extemporaneo,  nf.emissao_propria,' +
      ' nf.dados_interesse_fisco TXT_COMPL,' +
      ' nf.valor_serv VL_SERV_NT, nf.base_iss VL_BC_ISSQN, nf.valor_iss VL_ISSQN,' +
      ' nf.base_irrf VL_BC_IRRF, nf.valor_irrf VL_IRRF, 0 VL_BC_PREV, 0 VL_PREV,' +
      ' ''T''||nf.codigo_tr codigo_tr, nf.placa_tr VEIC_ID, nf.qtde_volumes_tr QTD_VOL,' +
      ' nf.peso_b PESO_BRT, nf.peso_l PESO_LIQ, nf.uf_placa_tr UF_ID, nf.cod_cons,' +
      ' nf.vl_forn, nf.vl_terc, nf.valor_out_desp VL_DA, nf.tp_ligacao,' +
      ' nf.cod_grupo_tensao, nf.vl_serv, nf.vl_serv_nt, nf.tp_assinante, nf.situacao_nfe,' +
      ' nf.vfcpufdest, nf.vicmsufdest, nf.vicmsufremet ' +
      ' from notafiscal nf' +
      ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
      ' nf.modelo_nf in (''1'',''01'',''1A'',''1-A'',''4'',''04'',''55'')'+
      ' and (nf.da is null or nf.da <> ''S'')';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.Open;

    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;
    if not vNivel2.IsEmpty then
      FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;
    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C100';
      Application.ProcessMessages;
      vBooleanTemp := True;
      if (StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '55') and
        (vNivel2.FieldByName('IND_EMIT').AsString = '0') and
        (Trim(vNivel2.FieldByName('situacao_nfe').AsString) = '') then
      begin
        Application.MessageBox(pchar('Nota fiscal modelo 55 de número ' + vNivel2.FieldByName('NUM_DOC').AsString + ' não Autorizada'), 'Atenção', 0 + 64);
        vBooleanTemp := False;
      end
      else if (StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '55') and
        (vNivel2.FieldByName('IND_EMIT').AsString = '0') and
        (Trim(vNivel2.FieldByName('situacao_nfe').AsString) = 'A Inutilizar') then
      begin
        Application.MessageBox(pchar('Nota fiscal modelo 55 de número ' + vNivel2.FieldByName('NUM_DOC').AsString + ' precisa ser Inutilizada'), 'Atenção', 0 + 64);
        vBooleanTemp := False;
      end;

      if vBooleanTemp then
      with FSpedF.Bloco_C.RegistroC100New do
      begin
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        if (vNivel2.FieldByName('extemporaneo').AsString = 'S') then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
            COD_SIT := sdCanceladoExtemp
          else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') then
            COD_SIT := sdExtempCompl
          else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '3') then
            COD_SIT := sdRegimeEspecNEsp
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA') then
            COD_SIT := sdExtempRegular
          else
            COD_SIT := sdRegimeEspecNEsp;
        end
        else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
          COD_SIT := sdCancelado
        else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') and
          ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdFiscalCompl
        else if ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdRegular;
        if COD_MOD = '55' then
        begin
          if (UpperCase(vNivel2.FieldByName('situacao_nfe').AsString) = 'DENEGADA') then
            COD_SIT := sdDoctoDenegado
          else if (UpperCase(vNivel2.FieldByName('situacao_nfe').AsString) = 'INUTILIZADA') then
            COD_SIT := sdDoctoNumInutilizada
          else
          begin
            try
              if (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) >= 890) and
                (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) <= 899) then
                COD_SIT := sdRegimeEspecNEsp;
            except
            end;
          end;

        end;

        IND_OPER := StrToTipoOperacao(vNivel2.FieldByName('IND_OPER').AsString);
        IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        SER := Trim(vNivel2.FieldByName('SER').AsString);
        NUM_DOC := vNivel2.FieldByName('NUM_DOC').AsString;
//        if (vNivel2.FieldByName('emissao_propria').AsString) = 'S' then
        if COD_SIT <> sdDoctoNumInutilizada then
          CHV_NFE := Trim(vNivel2.FieldByName('CHV_NFE').AsString);

        vBooleanTemp := False;
        if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada])
          then
        begin
          vBooleanTemp := True;
          montaRegistro0150(vNivel2.FieldByName('COD_PART').AsString);
          if Trim(vNivel2.FieldByName('codigo_tr').AsString) <> '' then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
              (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
              montaRegistro0150(vNivel2.FieldByName('codigo_tr').AsString);
          //CHV_NFE := Trim(vNivel2.FieldByName('CHV_NFE').AsString);
          COD_PART := vNivel2.FieldByName('COD_PART').AsString;
          DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;
          DT_E_S := vNivel2.FieldByName('DT_E_S').AsDateTime;
          if DT_E_S < DT_DOC then
            DT_E_S := DT_DOC
          else if DT_E_S > StrToDate(FDataFim) then
            DT_E_S := StrToDate(FDataFim);
          VL_DOC := 0;//vNivel2.FieldByName('VL_DOC').AsCurrency;
          if pos('VISTA', UpperCase(vNivel2.FieldByName('IND_PGTO').AsString)) > 0 then
            IND_PGTO := tpVista
          else if pos('SEM PAGAMENTO', UpperCase(vNivel2.FieldByName('IND_PGTO').AsString)) > 0 then
            IND_PGTO := tpSemPagamento
          else IND_PGTO := tpPrazo;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          VL_ABAT_NT := vNivel2.FieldByName('VL_ABAT_NT').AsCurrency;
          VL_MERC := vNivel2.FieldByName('VL_MERC').AsCurrency;
          if vNivel2.FieldByName('IND_FRT').AsString = '0' then
            IND_FRT := tfPorContaTerceiros
          else if vNivel2.FieldByName('IND_FRT').AsString = '1' then
            IND_FRT := tfPorContaEmitente
          else if vNivel2.FieldByName('IND_FRT').AsString = '2' then
            IND_FRT := tfPorContaDestinatario
          else
            IND_FRT := tfSemCobrancaFrete;
          VL_FRT := vNivel2.FieldByName('VL_FRT').AsCurrency;
          VL_SEG := vNivel2.FieldByName('VL_SEG').AsCurrency;
          VL_OUT_DA := vNivel2.FieldByName('VL_OUT_DA').AsCurrency;
          VL_BC_ICMS := 0;//vNivel2.FieldByName('VL_BC_ICMS').AsCurrency;
          VL_ICMS := 0;//vNivel2.FieldByName('VL_ICMS').AsCurrency;

          if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao109 then
            if (vNivel2.FieldByName('VFCPUFDEST').AsCurrency > 0) or
              (vNivel2.FieldByName('VICMSUFDEST').AsCurrency > 0) or
              (vNivel2.FieldByName('VICMSUFREMET').AsCurrency > 0) then
              with RegistroC101.New do
              begin
                VL_FCP_UF_DEST  := vNivel2.FieldByName('VFCPUFDEST').AsCurrency;
                if vNivel2.FieldByName('TIPO_EMISSAO').AsString <> '4' then
                begin
                  VL_ICMS_UF_DEST := vNivel2.FieldByName('VICMSUFDEST').AsCurrency;
                  VL_ICMS_UF_REM  := vNivel2.FieldByName('VICMSUFREMET').AsCurrency;
                end
                else
                begin
                  vMensagemDevolucao := True;
                  VL_ICMS_UF_DEST := vNivel2.FieldByName('VICMSUFREMET').AsCurrency;
                  VL_ICMS_UF_REM  := vNivel2.FieldByName('VICMSUFDEST').AsCurrency;
                end;
              end;

          vStringTemp :='';
          vOKST := False;
          for L := 0 to FSpedF.Bloco_0.Registro0001.Registro0015.Count - 1 do
          begin
            vStringTemp := getSiglaUFParticipante(vNivel2.FieldByName('COD_PART').AsString);
            if vStringTemp = FSpedF.Bloco_0.Registro0001.Registro0015.Items[L].UF_ST then
            begin
              vOKST := True;
              Break;
            end;
          end;
          if not vOKST then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              vOKST := fefd_icms_desconsiderar_insc_st_apuracao;
            
          if not vOKST then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'E') then
              if fApurarST then
                vOKST := True;

//          if vOK then
//          begin
//            VL_BC_ICMS_ST := vNivel2.FieldByName('VL_BC_ICMS_ST').AsCurrency;
//            VL_ICMS_ST := vNivel2.FieldByName('VL_ICMS_ST').AsCurrency;
//          end
//          else
//          begin
            VL_BC_ICMS_ST := 0;
            VL_ICMS_ST := 0;
//          end;

//          if (VL_ICMS_ST > 0) and (COD_SIT in [sdExtempRegular, sdExtempCompl]) then
//            somaFDEB_ESP_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS);
          if fStIpiEmMerc then
          else
          if (fApurarIPI) and (fApurarStIpiEmOutDesp <> 'S') then
            VL_IPI := vNivel2.FieldByName('VL_IPI').AsCurrency;

          vNivel3.Close;
          vNivel3.SQL.Text :=
            'select sum(valor_pis) VL_PIS, sum(valor_cofins) VL_COFINS from notafiscal_item nfi'+
            ' where nfi.cod_nf = '+vNivel2.FieldByName('cod_nf').AsString+
            ' and nfi.cod_empresa = '+FCodEmpresa;
          vNivel3.Open;
          VL_PIS := vNivel3.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsCurrency;

          VL_PIS_ST := vNivel2.FieldByName('VL_PIS_ST').AsCurrency;
          VL_COFINS_ST := vNivel2.FieldByName('VL_COFINS_ST').AsCurrency;
        end;


        if vBooleanTemp then
        begin

          if (vNivel2.FieldByName('emissao_propria').AsString = 'S') and
            (vNivel2.FieldByName('cod_mod').AsString = '55') then
          else
          begin
            vNivel3.Close;
            vNivel3.SQL.Text := 'select c110.cod_inf, spc.txt, c110.txt_compl from' +
              ' notafiscal_sped_c110 c110 inner join sped_informacao_complementar spc on' +
              ' spc.cod_inf = c110.cod_inf and spc.cod_empresa = c110.cod_empresa' +
              ' where c110.cod_nf = :cod_nf and c110.cod_empresa = :cod_empresa' +
              ' order by c110.cod_inf';
            vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
            vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.Open;

            vNivel3.First;
            while not vNivel3.Eof do
            begin
              montaRegistro0450(vNivel3.FieldByName('cod_inf').AsInteger,
                vNivel3.FieldByName('txt').AsString);
              //      vCampoString := getCampoBlobString(vNivel3.FieldByName('txt').AsString);
              //      with FSpedF.Bloco_0.Registro0450New do
              //      begin
              //        COD_INF := vNivel3.FieldByName('cod_inf').AsString;
              //        TXT := vCampoString;
              //      end;

              vCampoString := Trim(getCampoBlobString(vNivel3.FieldByName('txt_compl').AsString));
              with FSpedF.Bloco_C.RegistroC110New do
              begin
                COD_INF := vNivel3.FieldByName('cod_inf').AsString;
                TXT_COMPL := vCampoString;
              end;

              vNivel4.Close;
              vNivel4.SQL.Text := 'select c111.cod_inf, c111.num_proc, c111.ind_proc' +
                ' from notafiscal_sped_c111 c111 where c111.cod_nf = :cod_nf and' +
                ' c111.cod_empresa = :cod_empresa and c111.cod_inf = :cod_inf';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              while not vNivel4.Eof do
              begin
                with FSpedF.Bloco_C.RegistroC111New do
                begin
                  NUM_PROC := vNivel4.FieldByName('NUM_PROC').AsString;
                  IND_PROC := StrToOrigemProcesso(vNivel4.FieldByName('IND_PROC').AsString);
                end;
                vNivel4.Next;
              end;

              vNivel4.Close;
              vNivel4.SQL.Text :=
                'select c112.cod_inf, c112.cod_da, c112.uf, c112.num_da, c112.cod_aut,'
                +
                ' c112.vl_da, c112.dt_vcto, c112.dt_pgto' +
                ' from notafiscal_sped_c112 c112 where c112.cod_nf = :cod_nf and' +
                ' c112.cod_empresa = :cod_empresa and c112.cod_inf = :cod_inf';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              while not vNivel4.Eof do
              begin
                with FSpedF.Bloco_C.RegistroC112New do
                begin
                  if vNivel4.FieldByName('COD_DA').AsString = '0' then
                    COD_DA := daEstadualArrecadacao
                  else
                    COD_DA := daGNRE;
                  UF := vNivel4.FieldByName('UF').AsString;
                  NUM_DA := vNivel4.FieldByName('NUM_DA').AsString;
                  COD_AUT := vNivel4.FieldByName('COD_AUT').AsString;
                  VL_DA := vNivel4.FieldByName('VL_DA').AsCurrency;
                  DT_VCTO := vNivel4.FieldByName('DT_VCTO').AsDateTime;
                  DT_PGTO := vNivel4.FieldByName('DT_PGTO').AsDateTime;

                end;
                vNivel4.Next;
              end;

              vNivel4.Close;
              vNivel4.SQL.Text := 'select nf.cod_nf,' +
                ' case when nf.natureza_nf = ''E'' then ''0''' +
                '     else ''1'' end IND_OPER,' +
                ' case when nf.natureza_nf = ''S'' then ''0''' +
                '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
                ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
                ' else nf.serie end SER, nf.subserie SUB, nf.num_nf NUM_DOC, nf.data_lanc DT_DOC,' +
                ' nf.chave_nfe, c113.chave_nfe_ref' +
                ' from notafiscal_sped_c113 c113' +
                ' inner join notafiscal nf on nf.cod_nf = c113.cod_nf_ref and nf.cod_empresa =' +
                ' c113.cod_empresa' +
                ' where c113.cod_nf = :cod_nf and c113.cod_empresa = :cod_empresa and' +
                ' c113.cod_inf = :cod_inf';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              while not vNivel4.Eof do
              begin
                with FSpedF.Bloco_C.RegistroC113New do
                begin
                  if vNivel4.FieldByName('IND_OPER').AsString = '0' then
                    IND_OPER := tpEntradaAquisicao
                  else
                    IND_OPER := tpSaidaPrestacao;
                  if vNivel4.FieldByName('IND_EMIT').AsString = '0' then
                    IND_EMIT := edEmissaoPropria
                  else
                    IND_EMIT := edTerceiros;
                  COD_PART := vNivel4.FieldByName('COD_PART').AsString;
                  COD_MOD := StrZero(vNivel4.FieldByName('COD_MOD').AsString, 2);
                  SER := vNivel4.FieldByName('SER').AsString;
                  SUB := vNivel4.FieldByName('SUB').AsString;
                  NUM_DOC := vNivel4.FieldByName('NUM_DOC').AsString;
                  DT_DOC := vNivel4.FieldByName('DT_DOC').AsDateTime;
                  CHV_DOCe := Trim(vNivel4.FieldByName('chave_nfe').AsString);
                  if Trim(CHV_DOCe) = '' then
                    CHV_DOCe := Trim(vNivel4.FieldByName('chave_nfe_ref').AsString);
                end;
                vNivel4.Next;
              end;

              vNivel4.Close;
              vNivel4.SQL.Text :=
                'select c114.cod_inf, c114.ecf_fab, c114.num_doc,c114.dt_doc, c114.ecf_cx,'
                +
                ' c114.cod_mod' +
                ' from notafiscal_sped_c114 c114 where c114.cod_nf = :cod_nf and' +
                ' c114.cod_empresa = :cod_empresa and c114.cod_inf = :cod_inf';
              vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
              vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              while not vNivel4.Eof do
              begin
                with FSpedF.Bloco_C.RegistroC114New do
                begin
                  COD_MOD := StrZero(vNivel4.FieldByName('COD_MOD').AsString, 2);
                  ECF_FAB := vNivel4.FieldByName('ECF_FAB').AsString;
                  ECF_CX := vNivel4.FieldByName('ECF_CX').AsString;
                  NUM_DOC := vNivel4.FieldByName('NUM_DOC').AsString;
                  DT_DOC := vNivel4.FieldByName('DT_DOC').AsDateTime;
                end;
                vNivel4.Next;
              end;
              //C115
              if (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
              begin
                vNivel4.Close;
                vNivel4.SQL.Text := 'select c115.ind_carga, c115.cnpj_col, c115.ie_col, c115.cpf_col,'
                  +
                  ' c115.cod_mun_col, c115.cnpj_entg, c115.ie_entg, c115.cpf_entg,' +
                  ' c115.cod_mun_entg from notafiscal_sped_c115 c115' +
                  ' where c115.cod_nf = :cod_nf and' +
                  ' c115.cod_empresa = :cod_empresa and c115.cod_inf = :cod_inf';
                vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
                vNivel4.ParamByName('cod_inf').AsInteger := vNivel3.FieldByName('cod_inf').AsInteger;
                vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vNivel4.Open;
                while not vNivel4.Eof do
                begin
                  with FSpedF.Bloco_C.RegistroC115New do
                  begin
                    IND_CARGA := StrToTipoTransporte(vNivel4.FieldByName('IND_CARGA').AsString);
                    CNPJ_COL := Trim(vNivel4.FieldByName('CNPJ_COL').AsString);
                    IE_COL := vNivel4.FieldByName('IE_COL').AsString;
                    CPF_COL := Trim(vNivel4.FieldByName('CPF_COL').AsString);
                    COD_MUN_COL := vNivel4.FieldByName('COD_MUN_COL').AsString;
                    CNPJ_ENTG := Trim(vNivel4.FieldByName('CNPJ_ENTG').AsString);
                    IE_ENTG := vNivel4.FieldByName('IE_ENTG').AsString;
                    CPF_ENTG := Trim(vNivel4.FieldByName('CPF_ENTG').AsString);
                    COD_MUN_ENTG := vNivel4.FieldByName('COD_MUN_ENTG').AsString;
                  end;
                  vNivel4.Next;
                end;
              end;
              vNivel3.Next;
            end;

          end;

          if vNivel2.FieldByName('natureza_nf').AsString = 'E' then
          begin
            vNivel3.Close;
            vNivel3.SQL.Text :=
              'select c120.num_doc_imp, c120.num_acdraw, c120.cod_doc_imp, c120.pis_imp,'
              +
              ' c120.cofins_imp from notafiscal_sped_c120 c120 where c120.cod_nf = :cod_nf and' +
              ' c120.cod_empresa = :cod_empresa';
            vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
            vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.Open;

            while not vNivel3.Eof do
            begin
              vCampoString := Trim(getCampoBlobString(vNivel3.FieldByName('txt_compl').AsString));
              with FSpedF.Bloco_C.RegistroC120New do
              begin
                if vNivel3.FieldByName('COD_DOC_IMP').AsString = '0' then
                  COD_DOC_IMP := diImportacao
                else
                  COD_DOC_IMP := diSimplificadaImport;
                NUM_DOC__IMP := vNivel3.FieldByName('NUM_DOC__IMP').AsString;
                PIS_IMP := vNivel3.FieldByName('PIS_IMP').AsCurrency;
                COFINS_IMP := vNivel3.FieldByName('COFINS_IMP').AsCurrency;
                //FALTA NUM_ACDRAW:= vNivel3.FieldByName('NUM_ACDRAW').AsString;
              end;
              vNivel3.Next;
            end;
          end;

          if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
            (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
          begin
            with FSpedF.Bloco_C.RegistroC130New do
            begin
              VL_SERV_NT := vNivel2.FieldByName('VL_SERV_NT').AsCurrency;
              VL_BC_ISSQN := vNivel2.FieldByName('VL_BC_ISSQN').AsCurrency;
              VL_ISSQN := vNivel2.FieldByName('VL_ISSQN').AsCurrency;
              VL_BC_IRRF := vNivel2.FieldByName('VL_BC_IRRF').AsCurrency;
              VL_IRRF := vNivel2.FieldByName('VL_IRRF').AsCurrency;
              VL_BC_PREV := vNivel2.FieldByName('VL_BC_PREV').AsCurrency;
              VL_PREV := vNivel2.FieldByName('VL_PREV').AsCurrency;
            end;
          end;
          if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
            (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
          begin
            verificaFormasPagS(vNivel2.FieldByName('NUM_DOC').AsInteger,
              vNivel2.FieldByName('DT_DOC').AsString,
              Trim(vNivel2.FieldByName('SER').AsString));
            vNivel3.close;
            vNivel3.SQL.Text := 'select cn.ind_tit, cn.nome_ctrl DESC_TIT,' +
              ' case when (( not fp.rec_tipvend is null) and (fp.rec_numvend > 0)) then fp.rec_numvend' +
              '   else fp.nrequisicao' +
              ' end NUM_TIT,' +
              ' fp.cod_controle, fp.tipdoc, fp.rec_tipvend,  fp.rec_numvend, ''S'' nat,' +
              ' count(fp.nrequisicao) QTD_PARC, sum(fp.valordoc) VL_TIT' +
              ' from formpagamento fp' +
              ' inner join controles cn on cn.codigo_ctrl = fp.cod_controle and' +
              ' cn.codigo_emp = fp.cod_empresa' +
              ' where fp.num_nota = :num_nfV and sub_serie = :sub_serieV and' +
              ' cod_empresa = :cod_empresa and fp.tpdocs <> ''LCS'' and fp.tpdocs <> ''REC''' +
              ' group by 1, 2, 3, 4, 5, 6, 7 , 8';
            vNivel3.ParamByName('num_nfV').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
            try
              vNivel3.ParamByName('sub_serieV').AsInteger :=
                StrToInt(Trim(vNivel2.FieldByName('SER').AsString));
              vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel3.Open;
            except
            end;

            while not vNivel3.Eof do //if not vNivel3.IsEmpty then
            begin
              if Trim(vNivel3.FieldByName('rec_tipvend').AsString) = 'REC' then
              begin
                vQrAux.Close;
                vQrAux.SQL.Text := 'select cn.ind_tit, cn.nome_ctrl DESC_TIT, fp.nrequisicao NUM_TIT,'
                  +
                  ' fp.cod_controle, fp.tipdoc,' +
                  ' count(fp.nrequisicao) QTD_PARC, sum(fp.valordoc) VL_TIT' +
                  ' from formpagamento fp' +
                  ' inner join controles cn on cn.codigo_ctrl = fp.cod_controle and' +
                  ' cn.codigo_emp = fp.cod_empresa' +
                  ' where fp.nrequisicao = :nrecibo and fp.tpdocs = ''REC'' and' +
                  ' cod_empresa = :cod_empresa and fp.tpdocs <> ''LCS''' +
                  ' group by 1, 2, 3, 4, 5';
                vQrAux.ParamByName('nrecibo').AsInteger := vNivel3.FieldByName('num_tit').AsInteger;
                vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vQrAux.Open;
                if not vQrAux.IsEmpty then
                begin
                  vQrAux.First;
                  while not vQrAux.Eof do
                  begin
                    with FSpedF.Bloco_C.RegistroC140New do
                    begin
                      IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
                      IND_TIT := StrToTipoTitulo(vQrAux.FieldByName('IND_TIT').AsString);
                      if IND_TIT = tcOutros then
                        DESC_TIT := Trim(vQrAux.FieldByName('DESC_TIT').AsString);
                      NUM_TIT := Trim(vQrAux.FieldByName('NUM_TIT').AsString);
                      QTD_PARC := vQrAux.FieldByName('QTD_PARC').AsInteger;
                      VL_TIT := vQrAux.FieldByName('VL_TIT').AsCurrency;
                    end;
                    vNivel4.Close;
                    vNivel4.SQL.Text := 'select  FP.data_venc DT_VCTO, fp.valordoc VL_PARC' +
                      ' from formpagamento fp' +
                      ' inner join controles cn on cn.codigo_ctrl = fp.cod_controle and cn.codigo_emp = fp.cod_empresa' +
                      ' where fp.nrequisicao = :nrequisicao and cod_empresa = :cod_empresa and' +
                      ' fp.cod_controle = :cod_controle and fp.tipdoc = :tipdoc';
                    try
                      vNivel4.ParamByName('nrequisicao').AsInteger :=
                        vQrAux.FieldByName('NUM_TIT').AsInteger;
                      vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                      vNivel4.ParamByName('cod_controle').AsInteger :=
                        vQrAux.FieldByName('cod_controle').AsInteger;
                      vNivel4.ParamByName('tipdoc').AsString :=
                        Trim(vQrAux.FieldByName('tipdoc').AsString);
                      vNivel4.Open;
                    except
                    end;
                    vNivel4.First;
                    vIntegerTemp := 0;
                    while not vNivel4.Eof do
                    begin
                      inc(vIntegerTemp);
                      with FSpedF.Bloco_C.RegistroC141New do
                      begin
                        NUM_PARC := StrZero(IntToStr(vIntegerTemp), 2);
                        if (vNivel4.FieldByName('DT_VCTO').AsString <> '') and
                          (vNivel4.FieldByName('DT_VCTO').AsDateTime >=
                          vNivel2.FieldByName('DT_DOC').AsDateTime) then
                          DT_VCTO := vNivel4.FieldByName('DT_VCTO').AsDateTime
                        else
                          DT_VCTO := vNivel2.FieldByName('DT_DOC').AsDateTime;
                        VL_PARC := vNivel4.FieldByName('VL_PARC').AsCurrency;
                      end;
                      vNivel4.Next;
                    end;
                    vQrAux.Next;
                  end;

                end;
              end
              else
              begin
                with FSpedF.Bloco_C.RegistroC140New do
                begin
                  IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
                  IND_TIT := StrToTipoTitulo(vNivel3.FieldByName('IND_TIT').AsString);
                  if IND_TIT = tcOutros then
                    DESC_TIT := Trim(vNivel3.FieldByName('DESC_TIT').AsString);
                  NUM_TIT := Trim(vNivel3.FieldByName('NUM_TIT').AsString);
                  QTD_PARC := vNivel3.FieldByName('QTD_PARC').AsInteger;
                  VL_TIT := vNivel3.FieldByName('VL_TIT').AsCurrency;
                end;
                vNivel4.Close;
                vNivel4.SQL.Text := 'select  FP.data_venc DT_VCTO, fp.valordoc VL_PARC' +
                  ' from formpagamento fp' +
                  ' inner join controles cn on cn.codigo_ctrl = fp.cod_controle and' +
                  ' cn.codigo_emp = fp.cod_empresa' +
                  ' where fp.num_nota = :num_nf and sub_serie = :sub_serie and' +
                  ' cod_empresa = :cod_empresa and fp.nrequisicao = :nrequisicao and' +
                  ' fp.cod_controle = :cod_controle and cn.ind_tit = :ind_tit and' +
                  ' fp.tipdoc = :tipdoc and ((fp.rec_tipvend <> ''REC'') or (fp.rec_tipvend is null))';
                vNivel4.ParamByName('num_nf').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
                try
                  vNivel4.ParamByName('sub_serie').AsInteger :=
                    StrToInt(Trim(vNivel2.FieldByName('SER').AsString));
                  vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                  vNivel4.ParamByName('nrequisicao').AsInteger :=
                    vNivel3.FieldByName('NUM_TIT').AsInteger;
                  vNivel4.ParamByName('cod_controle').AsInteger :=
                    vNivel3.FieldByName('cod_controle').AsInteger;
                  vNivel4.ParamByName('ind_tit').AsString :=
                    Trim(vNivel3.FieldByName('ind_tit').AsString);
                  vNivel4.ParamByName('tipdoc').AsString :=
                    Trim(vNivel3.FieldByName('tipdoc').AsString);
                  vNivel4.Open;
                except
                end;
                vNivel4.Open;
                vNivel4.First;
                vIntegerTemp := 0;
                while not vNivel4.Eof do
                begin
                  inc(vIntegerTemp);
                  with FSpedF.Bloco_C.RegistroC141New do
                  begin
                    NUM_PARC := StrZero(IntToStr(vIntegerTemp), 2);
                    if (vNivel4.FieldByName('DT_VCTO').AsString <> '') and
                      (vNivel4.FieldByName('DT_VCTO').AsDateTime >=
                      vNivel2.FieldByName('DT_DOC').AsDateTime) then
                      DT_VCTO := vNivel4.FieldByName('DT_VCTO').AsDateTime
                    else
                      DT_VCTO := vNivel2.FieldByName('DT_DOC').AsDateTime;
                    VL_PARC := vNivel4.FieldByName('VL_PARC').AsCurrency;
                  end;
                  vNivel4.Next;
                end;
              end; //else
              vNivel3.Next;
            end; //While
          end
          else if (vNivel2.FieldByName('COD_MOD').AsString <> '55') then //natureza_nf = 'E'
          begin
            vNivel3.Close;
            vNivel3.SQL.Text := 'select ''01'' IND_TIT, cap.num_nota_nfe||''-''||cap.serie NUM_TIT,' +
              ' case when ((cap.n_doc_ctp_orig is null) or (ltrim(rtrim(cap.n_doc_ctp_orig)) = '''')) then cap.n_doc_ctp' +
              '   else cap.n_doc_ctp_orig' +
              ' end n_doc_ctp, cap.data_venc_ctp DT_VCTO, sum(cap.valor_ctp) VL_PARC, count(cap.cod_contrp)' +
              ' from contas_a_pagar cap where cap.num_nota_nfe = :num_nf and cap.serie = :serie' +
              ' and cap.cod_forn_nfe = :cod_forn_nfe and cap.codigo_emp = :cod_empresa group by 1, 2, 3, 4';
            vNivel3.ParamByName('num_nf').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
            vNivel3.ParamByName('SERIE').AsString := vNivel2.FieldByName('SER').AsString;
            vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.ParamByName('cod_forn_nfe').AsInteger :=
              vNivel2.FieldByName('cod_part').AsInteger;
            vNivel3.Open;
            vNivel3.First;
            vCurrencyTemp := 0;
            vIntegerTemp := 0;
            while not vNivel3.Eof do
            begin
              if pos('F', vNivel3.FieldByName('n_doc_ctp').AsString) = 0 then
              begin
                Inc(vIntegerTemp);
                vCurrencyTemp := vCurrencyTemp + vNivel3.FieldByName('VL_PARC').AsCurrency;
              end;
              vNivel3.Next;
            end;

            if vCurrencyTemp > 0 then
              with FSpedF.Bloco_C.RegistroC140New do
              begin
                IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
                IND_TIT := StrToTipoTitulo(vNivel3.FieldByName('IND_TIT').AsString);
                NUM_TIT := Trim(vNivel3.FieldByName('NUM_TIT').AsString);
                QTD_PARC := vIntegerTemp;
                VL_TIT := vCurrencyTemp;
              end;

            vNivel3.First;
            vIntegerTemp := 0;
            while not vNivel3.Eof do
            begin
              if pos('F', vNivel3.FieldByName('n_doc_ctp').AsString) = 0 then
              begin
                inc(vIntegerTemp);
                with FSpedF.Bloco_C.RegistroC141New do
                begin
                  NUM_PARC := StrZero(IntToStr(vIntegerTemp), 2);
                  if (vNivel3.FieldByName('DT_VCTO').AsString <> '') and
                    (vNivel3.FieldByName('DT_VCTO').AsDateTime >=
                    vNivel2.FieldByName('DT_DOC').AsDateTime) then
                    DT_VCTO := vNivel3.FieldByName('DT_VCTO').AsDateTime
                  else
                    DT_VCTO := vNivel2.FieldByName('DT_DOC').AsDateTime;
                  VL_PARC := vNivel3.FieldByName('VL_PARC').AsCurrency;
                end;
              end;
              vNivel3.Next;
            end;
          end;

          if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
            (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
          begin
            if Trim(vNivel2.FieldByName('codigo_tr').AsString) <> '' then
              with FSpedF.Bloco_C.RegistroC160New do
              begin
                COD_PART := vNivel2.FieldByName('codigo_tr').AsString;
                VEIC_ID := vNivel2.FieldByName('VEIC_ID').AsString;
                QTD_VOL := vNivel2.FieldByName('QTD_VOL').AsInteger;
                PESO_BRT := vNivel2.FieldByName('PESO_BRT').AsFloat;
                PESO_LIQ := vNivel2.FieldByName('PESO_LIQ').AsFloat;
                UF_ID := vNivel2.FieldByName('UF_ID').AsString;
              end;
          end;

          if (vNivel2.FieldByName('emissao_propria').AsString = 'S') and
            (vNivel2.FieldByName('COD_MOD').AsString = '55') then
          else
          begin
            vNivel3.Close;
            vNivel3.SQL.Text :=
              'select nfi.nitem NUM_ITEM, nfi.tipo_item , nfi.grupo_prod, nfi.cod_prod,'
              +
              ' nfi.cod_servico, nfi.chassi,  nfi.num_fab_prod, nfi.descricao_item DESCR_COMPL,' +
              ' nfi.descricao_item_outras, nfi.quantidade QTD, nfi.referencia UNID,' +
              ' nfi.valor_total VL_ITEM, nfi.rateio_desconto VL_DESC, nfi.IND_MOV, nfi.altera_estoque_cfop,' +
              ' case when (nfi.tipo_item = ''S'') then ''041''' +
              '   else nfi.cst' +
              ' end CST_ICMS, nfi.codigo_nop CFOP, nfi.codigo_nop COD_NAT,' +
              ' nfi.base_icm VL_BC_ICMS, nfi.aliq_icm ALIQ_ICMS, nfi.valor_icm VL_ICMS,' +
              ' nfi.base_icmsub VL_BC_ICMS_ST, nfi.aliq_icmsub ALIQ_ST,' +
              ' nfi.valor_icmsub VL_ICMS_ST, e.ind_apur_ipi IND_APUR, nfi.cst_ipi, '''' COD_ENQ,' +
              ' nfi.base_ipi VL_BC_IPI, nfi.aliq_ipi ALIQ_IPI, nfi.valor_ipi VL_IPI,' +
              ' nfi.cst_pis, case when (nfi.cst_pis = ''01'') then (nfi.valor_total - nfi.rateio_desconto)' +
              ' else 0' +
              ' end VL_BC_PIS, nfi.aliq_pis, 0 QUANT_BC_PIS, 0 ALIQ_PIS1,' +
              ' nfi.valor_pis VL_PIS, nfi.cst_cofins, case when (nfi.cst_cofins = ''01'') then (nfi.valor_total - nfi.rateio_desconto)' +
              ' else 0' +
              ' end VL_BC_COFINS, nfi.aliq_cofins, 0 QUANT_BC_COFINS, 0 ALIQ_COFINS1,' +
              ' nfi.valor_cofins VL_COFINS, nfi.BASE_ISS VL_BC_ISSQN, nfi.ALIQ_ISS ALIQ_ISSQN,' +
              ' nfi.VALOR_ISS VL_ISSQN, null COD_CTA, nfi.antec_trib' +
              ' from notafiscal_item nfi' +
              ' inner join empresa e on e.cod_empresa = nfi.cod_empresa' +
              ' where nfi.cod_nf = :cod_nf and' +
              ' nfi.cod_empresa = :cod_empresa order by nfi.nitem';
            vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
            vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel3.Open;

            vNivel3.First;
            while not vNivel3.Eof do
            begin
              with FSpedF.Bloco_C.RegistroC170New do
              begin
                NUM_ITEM := vNivel3.FieldByName('NUM_ITEM').AsString;
  //              UNID := getUnidade(vNivel3.FieldByName('tipo_item').AsString,
  //                  vNivel3.FieldByName('grupo_prod').AsInteger,
  //                  vNivel3.FieldByName('cod_prod').AsString,
  //                  vNivel3.FieldByName('chassi').AsString,
  //                  vNivel3.FieldByName('cod_servico').AsInteger,
  //                  (Trim(vNivel3.FieldByName('tipo_item').AsString) +
  //                  StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
  //                  StrZero(vNivel3.FieldByName('NUM_ITEM').AsString, 3)));
  //              if Trim(UNID) = '' then
                  UNID := UpperCase(Trim(vNivel3.FieldByName('UNID').AsString));
                if Trim(UNID) = '' then
                  UNID := 'UN';
                if vNivel3.FieldByName('tipo_item').AsString = 'P' then
                begin
                  COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                    Trim(vNivel3.FieldByName('cod_prod').AsString), 16);

                  gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                    vNivel3.FieldByName('grupo_prod').AsInteger,
                    vNivel3.FieldByName('cod_prod').AsString, '', 0, '', UNID);
                end
                else if vNivel3.FieldByName('tipo_item').AsString = 'S' then
                begin
                  COD_ITEM := 'S' + StrZero(vNivel3.FieldByName('cod_servico').AsString, 16);

                  gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                    0, '', '', vNivel3.FieldByName('cod_servico').AsInteger, '', UNID);
                end
                else if vNivel3.FieldByName('tipo_item').AsString = 'V' then
                begin
                  COD_ITEM := StrZero(vNivel3.FieldByName('chassi').AsString, 17);

                  gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                    0, '', vNivel3.FieldByName('chassi').AsString,
                    0, '', UNID);
                end
                else if vNivel3.FieldByName('tipo_item').AsString = 'O' then
                begin
                  COD_ITEM := 'O' + StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                    StrZero(vNivel3.FieldByName('NUM_ITEM').AsString, 3);

                  gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                    0, '', '', 0, ('O' +
                    StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                    StrZero(vNivel3.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                end
                else if vNivel3.FieldByName('tipo_item').AsString = 'D' then
                begin
                  COD_ITEM := 'D' + StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                    StrZero(vNivel3.FieldByName('NUM_ITEM').AsString, 3);

                  gravaSpedItem(vNivel3.FieldByName('tipo_item').AsString,
                    0, '', '', 0, ('D' +
                    StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                    StrZero(vNivel3.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                end;
                if vNivel3.FieldByName('tipo_item').AsString = 'O' then
                  DESCR_COMPL :=
                    getCampoBlobString(vNivel3.FieldByName('descricao_item_outras').AsString)
                else
                  DESCR_COMPL := vNivel3.FieldByName('DESCR_COMPL').AsString;
                QTD := vNivel3.FieldByName('QTD').AsFloat;
                VL_ITEM := vNivel3.FieldByName('VL_ITEM').AsCurrency;
                VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
                IND_MOV :=
                  StrToMovimentacaoFisica(IntToStr(vNivel3.FieldByName('IND_MOV').AsInteger));
                CST_ICMS := vNivel3.FieldByName('CST_ICMS').AsString;
                CFOP := vNivel3.FieldByName('CFOP').AsString;
                COD_NAT := vNivel3.FieldByName('COD_NAT').AsString;
                montaRegistro0400(COD_NAT);
                VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsFloat;
                ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
                VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsFloat,2);

                vStringTemp :='';
//                vOK := False;
//                for L := 0 to FSpedF.Bloco_0.Registro0001.Registro0015.Count - 1 do
//                begin
//                  vStringTemp := getUFParticipante(vNivel2.FieldByName('COD_PART').AsString);
//                  if vStringTemp = FSpedF.Bloco_0.Registro0001.Registro0015.Items[L].UF_ST then
//                  begin
//                    vOK := True;
//                    Break;
//                  end;
//                end;

                if fStIpiEmMerc then
                begin
                  if Trim(vNivel3.FieldByName('antec_trib').AsString) <> 'S'  then
                  begin
                    VL_ITEM := VL_ITEM + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
                    VL_MERC := VL_MERC + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
                  end;
                end
                else
                if ((copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2,1) = '7') or (copy(CST_ICMS, 2,1) = '6') or (copy(CST_ICMS, 2,1) = '9')) and
                (vOKST) and (Trim(vNivel3.FieldByName('antec_trib').AsString) <> 'S') and (fApurarStIpiEmOutDesp <> 'S') then
                begin
                  VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
                  VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
                  ALIQ_ST := vNivel3.FieldByName('ALIQ_ST').AsFloat;
                end
                else
                begin
                  VL_BC_ICMS_ST := 0;
                  VL_ICMS_ST := 0;
                  ALIQ_ST := 0;
                end;
                if fStIpiEmMerc then
                begin
                  VL_ITEM := VL_ITEM + vNivel3.FieldByName('VL_IPI').AsFloat;
                  VL_MERC := VL_MERC + vNivel3.FieldByName('VL_IPI').AsFloat;
                end
                else
                if (fApurarStIpiEmOutDesp = 'S') then
                begin

                end
                else
                if fApurarIPI then
                begin
                  IND_APUR := StrToApuracaoIPI(IntToStr(vNivel3.FieldByName('IND_APUR').AsInteger));
                  if Trim(vNivel3.FieldByName('CST_IPI').AsString) <> '' then
                    CST_IPI := vNivel3.FieldByName('CST_IPI').AsString
                  else
                  begin
                    if vNivel3.FieldByName('VL_IPI').AsFloat > 0 then
                    begin
                      if vNivel2.FieldByName('natureza_nf').AsString = 'S' then
                        CST_IPI := '50'
                      else
                        CST_IPI := '00';
                    end
                    else
                    begin
                      if vNivel2.FieldByName('natureza_nf').AsString = 'S' then
                        CST_IPI := '52'
                      else
                        CST_IPI := '02';
                    end;
                  end;
                  COD_ENQ := Trim(vNivel3.FieldByName('COD_ENQ').AsString);
                  VL_BC_IPI := vNivel3.FieldByName('VL_BC_IPI').AsFloat;
                  ALIQ_IPI := vNivel3.FieldByName('ALIQ_IPI').AsFloat;
                  VL_IPI := vNivel3.FieldByName('VL_IPI').AsFloat;
                end;
                CST_PIS := Trim(vNivel3.FieldByName('CST_PIS').AsString);
                VL_BC_PIS := vNivel3.FieldByName('VL_BC_PIS').AsFloat;
                ALIQ_PIS_PERC := vNivel3.FieldByName('ALIQ_PIS').AsFloat;
                if vNivel3.FieldByName('QUANT_BC_PIS').AsFloat > 0 then
                  QUANT_BC_PIS := vNivel3.FieldByName('QUANT_BC_PIS').AsFloat;
                ALIQ_PIS_R := vNivel3.FieldByName('ALIQ_PIS1').AsFloat;
                VL_PIS := vNivel3.FieldByName('VL_PIS').AsFloat;
                CST_COFINS := Trim(vNivel3.FieldByName('CST_COFINS').AsString);
                VL_BC_COFINS := vNivel3.FieldByName('VL_BC_COFINS').AsFloat;
                ALIQ_COFINS_PERC := vNivel3.FieldByName('ALIQ_COFINS').AsFloat;
                if vNivel3.FieldByName('QUANT_BC_COFINS').AsFloat > 0 then
                  QUANT_BC_COFINS := vNivel3.FieldByName('QUANT_BC_COFINS').AsFloat;
                ALIQ_COFINS_R := vNivel3.FieldByName('ALIQ_COFINS1').AsFloat;
                VL_COFINS := vNivel3.FieldByName('VL_COFINS').AsFloat;
                COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString);
              end;
              if (StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '01') and
                (vNivel3.FieldByName('tipo_item').AsString = 'S') and
                (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              begin
                with FSpedF.Bloco_C.RegistroC172New do
                begin
                  VL_BC_ISSQN := vNivel3.FieldByName('VL_BC_ISSQN').AsCurrency;
                  ALIQ_ISSQN := vNivel3.FieldByName('ALIQ_ISSQN').AsCurrency;
                  VL_ISSQN := vNivel3.FieldByName('VL_ISSQN').AsCurrency;
                end;
              end;

              if ((StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '01') or
                (StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2) = '55')) and
                (vNivel3.FieldByName('tipo_item').AsString = 'V') then
              begin
                vQrAux.Close;
                vQrAux.SQL.Text := 'select tipo_venda from notafiscal_item_veiculo where' +
                  ' cod_nf = :cod_nf and cod_empresa = :cod_empresa and nitem = :nitem';
                vQrAux.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
                vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vQrAux.ParamByName('nitem').AsInteger := vNivel3.FieldByName('NUM_ITEM').AsInteger;
                vQrAux.Open;
                if (vQrAux.FieldByName('tipo_venda').AsString = 'N') then
                begin
                  with FSpedF.Bloco_C.RegistroC175New do
                  begin
                    if vNivel2.FieldByName('natureza_nf').AsString = 'E' then
                      IND_VEIC_OPER := StrToTipoOperacaoVeiculo('0')
                    else
                      IND_VEIC_OPER := StrToTipoOperacaoVeiculo('3');
                    CNPJ := '';
                    UF := '';
                    CHASSI_VEIC := vNivel3.FieldByName('chassi').AsString;
                  end;
                end;
              end;

              //C176. Minas Gerais esta dispensad0
              if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and (False) then
              begin
                if (vNivel3.FieldByName('tipo_item').AsString = 'P') or
                  (vNivel3.FieldByName('tipo_item').AsString = 'V') then
                begin
                  if vNivel3.FieldByName('tipo_item').AsString = 'P' then
                  begin
                    vNivel4.Close;
                    vNivel4.SQL.Text :=
                      'select first 1 nf.modelo_nf COD_MOD_ULT_E, nf.num_nf NUM_DOC_ULT_E,'
                      +
                      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
                      ' else nf.serie end SER_ULT_E, nf.data_lanc DT_ULT_E, nf.cod_cliente COD_PART_ULT_E,' +
                      ' nfi.quantidade QUANT_ULT_E, nfi.valor_unitario VL_UNIT_ULT_E,' +
                      ' (nfi.valor_icmsub / nfi.quantidade) VL_UNIT_BC_ST  from notafiscal_item nfi' +
                      ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
                      ' where nfi.grupo_prod = :grupo_prod and nfi.cod_prod = :cod_prod and' +
                      ' nfi.cod_empresa = :cod_empresa and nfi.tipo_item = ''P'' ' +
                      ' and nf.status = ''Fechada'' and nf.emissao_propria = ''E'' and (nf.da is null or nf.da <> ''S'') order by nf.data_lanc desc';
                    vNivel4.ParamByName('grupo_prod').AsInteger :=
                      vNivel3.FieldByName('grupo_prod').AsInteger;
                    vNivel4.ParamByName('cod_prod').AsString :=
                      vNivel3.FieldByName('cod_prod').AsString;
                    vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                    vNivel4.Open;
                  end
                  else if vNivel3.FieldByName('tipo_item').AsString = 'V' then
                  begin
                    vNivel4.Close;
                    vNivel4.SQL.Text :=
                      'select first 1 nf.modelo_nf COD_MOD_ULT_E, nf.num_nf NUM_DOC_ULT_E,'
                      +
                      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
                      ' else nf.serie end SER_ULT_E, nf.data_lanc DT_ULT_E, nf.cod_cliente COD_PART_ULT_E,' +
                      ' nfi.quantidade QUANT_ULT_E, nfi.valor_unitario VL_UNIT_ULT_E,' +
                      ' (nfi.valor_icmsub / nfi.quantidade) VL_UNIT_BC_ST  from notafiscal_item nfi' +
                      ' inner join notafiscal nf on nf.cod_nf = nfi.cod_nf and nf.cod_empresa = nfi.cod_empresa' +
                      ' where nfi.chassi = :chassi and' +
                      ' nfi.cod_empresa = :cod_empresa and nfi.tipo_item = ''V'' ' +
                      ' and (nf.da is null or nf.da <> ''S'')'+
                      ' and nf.status = ''Fechada'' and nf.emissao_propria = ''E'' and (nf.da is null or nf.da <> ''S'') order by nf.data_lanc desc';
                    vNivel4.ParamByName('chassi').AsString := vNivel3.FieldByName('chassi').AsString;
                    vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                    vNivel4.Open;
                  end;
                  if not vNivel4.IsEmpty then
                    with FSpedF.Bloco_C.RegistroC176New do
                    begin
                      COD_MOD_ULT_E := vNivel4.FieldByName('COD_MOD_ULT_E').AsString;
                      NUM_DOC_ULT_E := vNivel4.FieldByName('NUM_DOC_ULT_E').AsString;
                      SER_ULT_E := vNivel4.FieldByName('SER_ULT_E').AsString;
                      DT_ULT_E := vNivel4.FieldByName('DT_ULT_E').AsDateTime;
                      COD_PART_ULT_E := vNivel4.FieldByName('COD_PART_ULT_E').AsString;
                      QUANT_ULT_E := vNivel4.FieldByName('QUANT_ULT_E').AsFloat;
                      VL_UNIT_ULT_E := vNivel4.FieldByName('VL_UNIT_ULT_E').AsFloat;
                      VL_UNIT_BC_ST := vNivel4.FieldByName('VL_UNIT_BC_ST').AsFloat;
                    end;
                end;
              end; //natureza_nf = 'S'

              //http://www.spedbrasil.net/forum/topics/registro-c179-informacoes-2
              //Os seguintes Registros estão dispensados em Minas Gerais: C176, C179, C495, 1500.
              vNivel3.Next;
            end;
          end;

          vNivel3.Close;
          vNivel3.SQL.Text := 'select case when nfi.tipo_item = ''S'' then ''041''' +
            ' else nfi.cst' +
            ' end CST_ICMS, nfi.codigo_nop CFOP, nfi.aliq_icm aliq_icms,' +
            ' sum (nfi.valor_total - nfi.rateio_desconto + ' +
            ' nfi.rateio_seguro + nfi.rateio_outdesp + nfi.rateio_acres_fin ) VL_OPR,' +
            ' sum(nfi.base_icm) VL_BC_ICMS, sum(nfi.valor_icm) VL_ICMS,' +
            ' sum( case when ( (coalesce(nfi.antec_trib, '''' ) <> ''S'' ) and ((substring(nfi.cst from 2 for 2) = ''10'') or' +
            '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''90'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''60'')) ) then nfi.base_icmsub' +
            '     else 0' +
            ' end) VL_BC_ICMS_ST, sum( case when ( (coalesce(nfi.antec_trib, '''' ) <> ''S'' ) and ((substring(nfi.cst from 2 for 2) = ''10'') or' +
            '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''90'')or' +
            '     (substring(nfi.cst from 2 for 2) = ''60'')) ) then nfi.valor_icmsub' +
            '     else 0' +
            ' end) VL_ICMS_ST,' +
            ' sum(case when ((substring(nfi.cst from 2 for 2) = ''20'') or' +
            '     (substring(nfi.cst from 2 for 2) = ''70'')) then nfi.vlisento' +
            '     else 0' +
            ' end) VL_RED_BC, sum(nfi.valor_ipi) VL_IPI, sum(nfi.rateio_frete) frete, '''' COD_OBS' +
            ' from notafiscal_item nfi' +
            ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa group by 1,2,3';
          vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
          vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel3.Open;

          vNivel3.first;
          while not vNivel3.Eof do
          begin
            with FSpedF.Bloco_C.RegistroC190New do
            begin
              CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
              CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
              ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
              VL_OPR := vNivel3.FieldByName('VL_OPR').AsFloat;
              if vNivel2.FieldByName('VL_FRT').AsFloat > 0 then
                VL_OPR := VL_OPR + vNivel3.FieldByName('frete').AsFloat;
//              if (copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7')
//                 or (copy(CST_ICMS, 2, 1) = '9') then
//                VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
              VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsFloat;
              VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsFloat,2);
              if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
                FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
              if (vNivel2.FieldByName('natureza_nf').AsString = 'E') and
                ((CFOP <> '1605') or (CFOP = '5605')) then
                FVL_TOT_CREDITOS := FVL_TOT_CREDITOS + VL_ICMS;

              vStringTemp :='';
//              vOK := False;
//              for L := 0 to FSpedF.Bloco_0.Registro0001.Registro0015.Count - 1 do
//              begin
//                vStringTemp := getUFParticipante(vNivel2.FieldByName('COD_PART').AsString);
//                if vStringTemp = FSpedF.Bloco_0.Registro0001.Registro0015.Items[L].UF_ST then
//                begin
//                  vOK := True;
//                  Break;
//                end;
//              end;
//              if not vOK then
//                if (vNivel2.FieldByName('natureza_nf').AsString = 'E') then
//                  if fApurarST then
//                    vOK := True;

              vSomarST:= False;
              if fStIpiEmMerc then
              begin
                VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
              end
              else
              if ((copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7') or (copy(CST_ICMS, 2, 1) = '6') or (copy(CST_ICMS, 2, 1) = '9')) and
                ((vOKST) or ( (fApurarST) and
                              (
                                (CFOP = '5410') or (CFOP = '5411') or (CFOP = '5414') or (CFOP = '5415') or
                                (CFOP = '5660') or (CFOP = '5661') or (CFOP = '1662') or
                                (CFOP = '6410') or (CFOP = '6411') or (CFOP = '6414') or (CFOP = '6415') or
                                (CFOP = '6660') or (CFOP = '6661') or (CFOP = '6662')
                              )
                            )
                ) then
              // De acordo a contabilidade nao deve haver ST para não substitutos
              begin
                vSomarST := True;
                VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
                if fApurarStIpiEmOutDesp <> 'S' then
                begin
                  VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
                  VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
                  if VL_ICMS_ST > 0 then
                    setSTEstado(vNivel2.FieldByName('COD_PART').AsString);
                  if (CFOP = '1410') or (CFOP = '1411') or (CFOP = '1414') or (CFOP = '1415') or
                    (CFOP = '1660') or (CFOP = '1661') or (CFOP = '1662') or (CFOP = '2410') or
                    (CFOP = '2411') or (CFOP = '2414') or (CFOP = '2415') or (CFOP = '2660') or
                    (CFOP = '2661') or (CFOP = '2662') then
                    somaFVL_DEVOL_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST)
                  else if (copy(CFOP, 1, 1) = '1') or (copy(CFOP, 1, 1) = '2') then
                    somaFVL_OUT_CRED_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
                  //              else if (CFOP = '1603') or (CFOP = '2603') then
                  //                somaFVL_RESSARC_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
                  if (copy(CFOP, 1, 1) = '5') or (copy(CFOP, 1, 1) = '6') or (copy(CFOP, 1, 1) = '7')
                    then
                    somaFVL_RETENCAO_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
                end;
              end
              else
              begin
                VL_BC_ICMS_ST := 0;
                VL_ICMS_ST := 0;
                if fApurarStIpiEmOutDesp = 'S' then
                  VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
              end;

              VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsFloat;
              if fStIpiEmMerc then
              begin
                VL_OPR := VL_OPR + vNivel3.FieldByName('VL_IPI').AsFloat;
              end
              else
              if fApurarStIpiEmOutDesp = 'S' then
                VL_IPI := 0
              else
              if fApurarIPI  then
                VL_IPI := vNivel3.FieldByName('VL_IPI').AsFloat;
              COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
              VL_DOC := VL_DOC + VL_OPR;
            end;
            if fStIpiEmMerc then
            else
            if fApurarStIpiEmOutDesp = 'S' then
            begin
              VL_OUT_DA := VL_OUT_DA + vNivel3.FieldByName('VL_ICMS_ST').AsFloat + vNivel3.FieldByName('VL_IPI').AsFloat;
            end
            else if vSomarST then
            begin
              VL_BC_ICMS_ST := VL_BC_ICMS_ST + vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
              VL_ICMS_ST := VL_ICMS_ST + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
            end;
            VL_BC_ICMS := VL_BC_ICMS + vNivel3.FieldByName('VL_BC_ICMS').AsFloat;
            VL_ICMS := VL_ICMS + StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsFloat,2);

            vNivel3.Next;
          end;

          vNivel3.Close;
          vNivel3.SQL.Text := 'select c195.cod_obs, sl.txt TXT_COMPL, count(c195.cod_nf)' +
            ' from notafiscal_sped_c195_c197 c195' +
            ' inner join sped_lancamento_fiscal sl on sl.cod_obs = c195.cod_obs and sl.cod_empresa = c195.cod_empresa' +
            ' where c195.cod_nf = :cod_nf and c195.cod_empresa = :cod_empresa group by 1,2';
          vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
          vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel3.Open;

          while not vNivel3.Eof do
          begin
            montaRegistro0460(vNivel3.FieldByName('cod_obs').AsInteger,
              vNivel3.FieldByName('TXT_COMPL').AsString);
            with FSpedF.Bloco_C.RegistroC195New do
            begin
              COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
              TXT_COMPL := Trim(vNivel3.FieldByName('TXT_COMPL').AsString);
            end;

            vNivel4.Close;
            vNivel4.SQL.Text :=
              'select c195.cod_aj, c195.descr_compl_aj, c195.vl_bc_icms, c195.aliq_icms,'
              +
              ' c195.vl_icms, c195.vl_outros, c195.nitem, nfi.tipo_item, nfi.grupo_prod,' +
              ' nfi.cod_prod, nfi.cod_servico, nfi.chassi from notafiscal_sped_c195_c197 c195' +
              ' inner join sped_lancamento_fiscal sl on sl.cod_obs = c195.cod_obs' +
              ' left join notafiscal_item nfi on nfi.cod_nf = c195.cod_nf and nfi.cod_empresa = c195.cod_empresa and' +
              ' nfi.nitem = c195.nitem where c195.cod_nf = :cod_nf and c195.cod_empresa = :cod_empresa';
            vNivel4.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel4.Open;
            vNivel4.First;
            while not vNivel4.Eof do
            begin
              with FSpedF.Bloco_C.RegistroC197New do
              begin
                COD_AJ := Trim(vNivel4.FieldByName('COD_AJ').AsString);
                DESCR_COMPL_AJ := Trim(vNivel4.FieldByName('DESCR_COMPL_AJ').AsString);
                if vNivel4.FieldByName('nitem').AsInteger > 0 then
                begin
                  if vNivel4.FieldByName('tipo_item').AsString = 'P' then
                    COD_ITEM := 'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
                      Trim(vNivel4.FieldByName('cod_prod').AsString), 16)
                  else if vNivel4.FieldByName('tipo_item').AsString = 'S' then
                    COD_ITEM := 'S' + StrZero(vNivel4.FieldByName('cod_servico').AsString, 16)
                  else if vNivel4.FieldByName('tipo_item').AsString = 'V' then
                    COD_ITEM := StrZero(vNivel4.FieldByName('chassi').AsString, 17)
                  else if vNivel4.FieldByName('tipo_item').AsString = 'O' then
                    COD_ITEM := 'O' + StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel4.FieldByName('nitem').AsString, 3)
                  else if vNivel4.FieldByName('tipo_item').AsString = 'D' then
                    COD_ITEM := 'D' + StrZero(vNivel2.FieldByName('cod_nf').AsString, 7) +
                      StrZero(vNivel4.FieldByName('nitem').AsString, 3);
                end
                else
                  COD_ITEM := '';
                VL_BC_ICMS := vNivel4.FieldByName('VL_BC_ICMS').AsCurrency;
                ALIQ_ICMS := vNivel4.FieldByName('ALIQ_ICMS').AsCurrency;
                VL_ICMS := StrToFloatFormat(vNivel4.FieldByName('VL_ICMS').AsCurrency,2);
                VL_OUTROS := vNivel4.FieldByName('VL_OUTROS').AsCurrency;
                if ((COPY(COD_AJ, 3, 1) = '4') or (COPY(COD_AJ, 3, 1) = '5') or
                  (COPY(COD_AJ, 3, 1) = '6')) and
                  ((COPY(COD_AJ, 4, 1) = '0') or (COPY(COD_AJ, 4, 1) = '3') or
                  (COPY(COD_AJ, 4, 1) = '4') or (COPY(COD_AJ, 4, 1) = '5')) then
                  FVL_AJ_DEBITOS := FVL_AJ_DEBITOS + VL_ICMS;
                if ((COPY(COD_AJ, 3, 1) = '0') or (COPY(COD_AJ, 3, 1) = '1') or
                  (COPY(COD_AJ, 3, 1) = '2')) and
                  ((COPY(COD_AJ, 4, 1) = '0') or (COPY(COD_AJ, 4, 1) = '3') or
                  (COPY(COD_AJ, 4, 1) = '4') or (COPY(COD_AJ, 4, 1) = '5')) then
                  FVL_AJ_CREDITOS := FVL_AJ_CREDITOS + VL_ICMS;
                if (COPY(COD_AJ, 3, 1) = '6') and (COPY(COD_AJ, 4, 1) = '0') then
                  FVL_TOT_DED := FVL_TOT_DED + VL_ICMS;
                if ((COPY(COD_AJ, 3, 1) = '0') or (COPY(COD_AJ, 3, 1) = '1') or
                  (COPY(COD_AJ, 3, 1) = '2')) and
                  (COPY(COD_AJ, 4, 1) = '1') then
                  somaFVL_AJ_CREDITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);
                if ((COPY(COD_AJ, 3, 1) = '3') or (COPY(COD_AJ, 3, 1) = '4') or
                  (COPY(COD_AJ, 3, 1) = '5')) and
                  (COPY(COD_AJ, 4, 1) = '1') then
                  somaFVL_AJ_DEBITOS_ST(Copy(COD_AJ, 1, 2), VL_ICMS);
                if (COPY(COD_AJ, 3, 1) = '7') and (COPY(COD_AJ, 4, 1) = '1') then
                  somaFDEB_ESP_ST(Copy(COD_AJ, 1, 2), VL_ICMS);

              end;
              vNivel4.Next;
            end;
            vNivel3.Next;
          end;
        end;

//        if vOKST then
//        begin
//          VL_BC_ICMS_ST := vNivel2.FieldByName('VL_BC_ICMS_ST').AsCurrency;
//          VL_ICMS_ST := vNivel2.FieldByName('VL_ICMS_ST').AsCurrency;
//        end
//        else
//        begin
//          VL_BC_ICMS_ST := 0;
//          VL_ICMS_ST := 0;
//        end;

      end; //RegistroC100New
      //    FSpedF.WriteBloco_C(False);

      vNivel2.Next;
      FProgressBar.Position := FProgressBar.Position + 1;
    end;

    verificaPISCOFINSNFSerieD;
    if FSpedF.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilA then
    begin
      FLabelStatus.Caption := 'Montando registro C300';
      verificaNfSerieD;

      vNivel2.Close;
      vNivel2.SQL.Text :=
        'select ''02'' COD_MOD, nd.serie SER, nd.subserie SUB, nd.dataemissao DT_DOC,' +
        ' '''' COD_CTA,' +
        ' min(nd.numeronota) NUM_DOC_INI, max(nd.numeronota) NUM_DOC_FIN,' +
        ' sum(' +
        ' case when nd.status = ''FECHADA'' then nd.valor_geral' +
        '     else 0' +
        ' end) VL_DOC, sum(nd.valor_cofins) vl_cofins, sum(nd.valor_pis) vl_pis' +
        ' from nf_serie_d nd' +
        ' where nd.dataemissao >= :dataIni and nd.dataemissao <=' +
        ' :dataFim and nd.cod_empresa = :cod_empresa group by 1,2,3,4,5';
      vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel2.Open;

      vNivel2.FetchAll;
      FProgressBar.Position := 0;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel2.RecordCount;
      if not vNivel2.IsEmpty then
        FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;

      vNivel2.First;
      while not vNivel2.Eof do
      begin
        Application.ProcessMessages;
        with FSpedF.Bloco_C.RegistroC300New do
        begin
          COD_MOD := vNivel2.FieldByName('COD_MOD').AsString;
          SER := Trim(vNivel2.FieldByName('SER').AsString);
          SUB := Trim(vNivel2.FieldByName('SUB').AsString);
          NUM_DOC_INI := Trim(vNivel2.FieldByName('NUM_DOC_INI').AsString);
          NUM_DOC_FIN := Trim(vNivel2.FieldByName('NUM_DOC_FIN').AsString);
          DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_PIS := vNivel2.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel2.FieldByName('VL_COFINS').AsCurrency;
          COD_CTA := Trim(vNivel2.FieldByName('COD_CTA').AsString);
        end;

        vNivel3.Close;
        vNivel3.SQL.Text := 'select nd.numeronota NUM_DOC_CANC from nf_serie_d nd' +
          ' where nd.status = ''CANCELADA'' and nd.dataemissao = :dataIni and nd.cod_empresa = :cod_empresa';
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('dataIni').AsDate := vNivel2.FieldByName('DT_DOC').AsDateTime;
        vNivel3.Open;

        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC310New do
          begin
            NUM_DOC_CANC := vNivel3.FieldByName('NUM_DOC_CANC').AsString;
          end;
          vNivel3.Next;
        end;

        vNivel3.Close;
        vNivel3.SQL.Text := 'select p.cst_prod CST_ICMS, p.codigo_nop CFOP, ndi.aliquota ALIQ_ICMS,'
          +
          ' sum(ndi.vl_tot_item) VL_OPR, sum(ndi.base_icm) VL_BC_ICMS, sum(ndi.valor_icm)' +
          ' VL_ICMS, sum( case when ( (ndi.base_icm > 0) and (ndi.vl_tot_item > ndi.base_icm)) then' +
          '   (ndi.vl_tot_item - ndi.base_icm) else 0 end) VL_RED_BC, '''' COD_OBS' +
          ' from nf_serie_d nd inner join nf_serie_d_itens ndi on ndi.numeronota =' +
          ' nd.numeronota and ndi.cod_empresa = nd.cod_empresa' +
          ' inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod_prod =' +
          ' ndi.cod_prod and p.cod_empresa = ndi.cod_empresa' +
          ' where nd.dataemissao = :dia and nd.cod_empresa = :cod_empresa group by 1,2,3';
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('dia').AsDate := vNivel2.FieldByName('DT_DOC').AsDateTime;
        vNivel3.Open;

        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC320New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsCurrency;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsCurrency;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsCurrency,2);
            //if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsCurrency;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;

          vNivel4.Close;
          vNivel4.SQL.Text :=
            'select ndi.grupo_prod, ndi.cod_prod, p.unidade UNID, 0 VL_DESC,' +
            ' sum(ndi.quantid_item) QTD, sum(ndi.vl_tot_item) VL_ITEM,' +
            ' sum(ndi.base_icm) VL_BC_ICMS, sum(ndi.valor_icm) VL_ICMS,' +
            ' sum(nd.valor_cofins) vl_cofins, sum(nd.valor_pis) vl_pis' +
            ' from nf_serie_d nd inner join nf_serie_d_itens ndi on ndi.numeronota =' +
            ' nd.numeronota and ndi.cod_empresa = nd.cod_empresa' +
            ' inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod_prod =' +
            ' ndi.cod_prod and p.cod_empresa = ndi.cod_empresa' +
            ' where nd.dataemissao = :dia and nd.cod_empresa = :cod_empresa' +
            ' and p.cst_prod = :cst_prod and p.codigo_nop = :codigo_nop and ndi.aliquota = :aliquota' +
            ' group by 1,2,3,4';
          vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
          vNivel4.ParamByName('dia').AsDate := vNivel2.FieldByName('DT_DOC').AsDateTime;
          vNivel4.ParamByName('cst_prod').AsString := vNivel3.FieldByName('CST_ICMS').AsString;
          vNivel4.ParamByName('codigo_nop').AsFloat := vNivel3.FieldByName('CFOP').AsFloat;
          vNivel4.ParamByName('aliquota').AsFloat := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
          vNivel4.Open;

          vNivel4.First;
          while not vNivel4.Eof do
          begin
            with FSpedF.Bloco_C.RegistroC321New do
            begin
              COD_ITEM := 'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
                Trim(vNivel4.FieldByName('cod_prod').AsString), 16);

              QTD := vNivel4.FieldByName('QTD').AsFloat;
//              UNID := getUnidade('P',
//                vNivel4.FieldByName('grupo_prod').AsInteger,
//                vNivel4.FieldByName('cod_prod').AsString,
//                '' , 0,'');
              if Trim(UNID) = '' then
                UNID := UpperCase(Trim(vNivel4.FieldByName('UNID').AsString));

              gravaSpedItem('P',
                vNivel4.FieldByName('grupo_prod').AsInteger,
                vNivel4.FieldByName('cod_prod').AsString, '', 0, '', UNID);

              VL_ITEM := vNivel4.FieldByName('VL_ITEM').AsCurrency;
              VL_DESC := vNivel4.FieldByName('VL_DESC').AsCurrency;
              VL_BC_ICMS := vNivel4.FieldByName('VL_BC_ICMS').AsCurrency;
              VL_ICMS := StrToFloatFormat(vNivel4.FieldByName('VL_ICMS').AsCurrency,2);
              VL_PIS := vNivel4.FieldByName('VL_PIS').AsCurrency;
              VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsCurrency;
            end;
            vNivel4.Next;
          end;

          vNivel3.Next;
        end;

        vNivel2.Next;
        FProgressBar.Position := FProgressBar.Position + 1;
      end;
    end;

    if FSpedF.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilB then
    begin
      FLabelStatus.Caption := 'Montando registro C350';
      verificaNfSerieD;

      vNivel2.Close;
      vNivel2.SQL.Text := 'select nd.numeronota NUM_DOC, nd.serie SER, nd.subserie SUB_SER,' +
        ' nd.dataemissao DT_DOC, c.cpfcgc CNPJ_CPF, nd.valor_geral VL_MERC,' +
        ' nd.valor_geral VL_DOC, 0 VL_DESC, nd.valor_pis VL_PIS, nd.valor_cofins VL_COFINS, '''' COD_CTA' +
        ' from nf_serie_d nd' +
        ' inner join clientes c on c.cod_cliente = nd.cod_cliente and c.cod_empresa =' +
        ' nd.cod_empresa where nd.dataemissao >= :dataIni and nd.dataemissao <=' +
        ' :dataFim and nd.cod_empresa = :cod_empresa and ((nd.status <> ''CANCELADA'')' +
        ' or (nd.status is null))';
      vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
      vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
      vNivel2.Open;
      vNivel2.FetchAll;
      FProgressBar.Position := 0;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel2.RecordCount;
      if not vNivel2.IsEmpty then
        FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;

      vNivel2.First;
      while not vNivel2.Eof do
      begin
        Application.ProcessMessages;
        with FSpedF.Bloco_C.RegistroC350New do
        begin
          SER := Trim(vNivel2.FieldByName('SER').AsString);
          SUB_SER := Trim(vNivel2.FieldByName('SUB_SER').AsString);
          NUM_DOC := Trim(vNivel2.FieldByName('NUM_DOC').AsString);
          DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;
          CNPJ_CPF := Trim(vNivel2.FieldByName('CNPJ_CPF').AsString);
          VL_MERC := vNivel2.FieldByName('VL_MERC').AsCurrency;
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          VL_PIS := vNivel2.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel2.FieldByName('VL_COFINS').AsCurrency;
          COD_CTA := Trim(vNivel2.FieldByName('COD_CTA').AsString);
        end;

        vNivel3.Close;
        vNivel3.SQL.Text := 'select ndi.grupo_prod, ndi.cod_prod, ndi.quantid_item QTD,' +
          ' p.unidade UNID, ndi.vl_tot_item VL_ITEM, 0 VL_DESC' +
          ' from nf_serie_d_itens ndi' +
          ' inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod_prod =' +
          ' ndi.cod_prod and p.cod_empresa = ndi.cod_empresa' +
          ' where ndi.numeronota = :numeronota and ndi.cod_empresa = :cod_empresa';
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('numeronota').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
        vNivel3.Open;

        vIntegerTemp := 0;
        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC370New do
          begin
            inc(vIntegerTemp);
            NUM_ITEM := IntToStr(vIntegerTemp);
            COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
              Trim(vNivel3.FieldByName('cod_prod').AsString), 16);

            QTD := vNivel3.FieldByName('QTD').AsFloat;
//            UNID := getUnidade('P',
//                vNivel3.FieldByName('grupo_prod').AsInteger,
//                vNivel3.FieldByName('cod_prod').AsString,
//                '' , 0, '');
            if Trim(UNID) = '' then
              UNID := UpperCase(Trim(vNivel3.FieldByName('UNID').AsString));

            gravaSpedItem('P',
              vNivel3.FieldByName('grupo_prod').AsInteger,
              vNivel3.FieldByName('cod_prod').AsString, '', 0, '', UNID);
            VL_ITEM := vNivel3.FieldByName('VL_ITEM').AsCurrency;
            VL_DESC := vNivel3.FieldByName('VL_DESC').AsCurrency;
          end;
          vNivel3.Next;
        end;

        vNivel3.Close;
        vNivel3.SQL.Text := 'select p.cst_prod CST_ICMS, p.codigo_nop CFOP, ndi.aliquota ALIQ_ICMS,' +
          ' sum(ndi.vl_tot_item) VL_OPR, sum(ndi.base_icm) VL_BC_ICMS, sum(ndi.valor_icm)' +
          ' VL_ICMS, sum( case when ( (ndi.base_icm > 0) and (ndi.vl_tot_item > ndi.base_icm)) then' +
          '   (ndi.vl_tot_item - ndi.base_icm) else 0 end) VL_RED_BC, '''' COD_OBS' +
          ' from nf_serie_d nd inner join nf_serie_d_itens ndi on ndi.numeronota =' +
          ' nd.numeronota and ndi.cod_empresa = nd.cod_empresa' +
          ' inner join produtos p on p.grupo_prod = ndi.grupo_prod and p.cod_prod =' +
          ' ndi.cod_prod and p.cod_empresa = ndi.cod_empresa' +
          ' where nd.numeronota = :numeronota and nd.cod_empresa = :cod_empresa group by 1,2,3';
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('numeronota').AsInteger := vNivel2.FieldByName('NUM_DOC').AsInteger;
        vNivel3.Open;

        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC390New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsCurrency;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsCurrency;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsCurrency,2);
            //if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsCurrency;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;
          vNivel3.Next;
        end;

        vNivel2.Next;
        FProgressBar.Position := FProgressBar.Position + 1;
      end;
    end;

    FLabelStatus.Caption := 'Montando registro C400';
    vNivel2.Close;
    vNivel2.SQL.Text := 'select ''2D'' COD_MOD, cniee.modelo_ecf ECF_MOD, ti.num_serie_ecf ECF_FAB,'
      +
      ' ti.cod_terminal ECF_CX from terminal_impressoras ti' +
      ' inner join impressoras_cniee cniee on cniee.identificacao = ti.ident_cniee' +
      ' where cod_empresa = :cod_empresa order by 4';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.Open;
    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;

    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C400';
      FLabelCupons.Caption := '';
      vStringTemp := vNivel2.FieldByName('ECF_CX').AsString + ' ' +
        vNivel2.FieldByName('ECF_FAB').AsString;
      Application.ProcessMessages;
      verificaCamposNullCupom(Trim(vNivel2.FieldByName('ECF_FAB').AsString),
        vNivel2.FieldByName('ECF_CX').AsInteger);
      _verificaPISCOFINSCupomFiscal(Trim(vNivel2.FieldByName('ECF_FAB').AsString),
        vNivel2.FieldByName('ECF_CX').AsInteger);
      Application.ProcessMessages;
      FLabelStatus.Caption := 'Montando registro C400';
      if verificaCupomSemZ(Trim(vNivel2.FieldByName('ECF_FAB').AsString),
        vNivel2.FieldByName('ECF_CX').AsInteger) then
      begin
        FLabelStatus.Caption := 'Montando registro C400';
        vNivel3.Close;
        vNivel3.SQL.Text :=
          'select rd.data_mov DT_DOC, rd.cro_mov CRO, rd.nreducoes CRZ, rd.coored NUM_COO_FIN,' +
          ' rd.vltotgeral GT_FIN, rd.vlvendab VL_BRT' +
          ' from resumod rd where rd.cod_terminal = :cod_terminal and rd.nserieecf = :nserie' +
          ' and rd.cod_empresa = :cod_empresa and rd.data_mov >= :dataIni and rd.data_mov <= :dataFim' +
          ' order by 1';
        vNivel3.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
        vNivel3.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
        vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
        vNivel3.Open;
        vNivel3.FetchAll;
        FProgressBar.Position := 0;
        FProgressBar.Min := 0;
        FProgressBar.Max := vNivel3.RecordCount;

        vNivel3.First;
        while not vNivel3.Eof do
        begin

          if (not vNivel3.IsEmpty) and (vNivel3.FieldByName('VL_BRT').AsCurrency > 0) then
          begin
            FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;
            montaRegistroC400(vNivel2.FieldByName('COD_MOD').AsString,
              vNivel2.FieldByName('ECF_MOD').AsString,
              vNivel2.FieldByName('ECF_FAB').AsString,
              vNivel2.FieldByName('ECF_CX').AsString);
          end;

          FLabelCupons.Caption := vStringTemp + ' Dia: ' +
            DateToStr(vNivel3.FieldByName('DT_DOC').AsDateTime) + ' C405';
          Application.ProcessMessages;
          if vNivel3.FieldByName('VL_BRT').AsCurrency > 0 then
          with FSpedF.Bloco_C.RegistroC405New do
          begin
            DT_DOC := vNivel3.FieldByName('DT_DOC').AsDateTime;
            CRO := vNivel3.FieldByName('CRO').AsInteger;
            CRZ := vNivel3.FieldByName('CRZ').AsInteger;
            NUM_COO_FIN := vNivel3.FieldByName('NUM_COO_FIN').AsInteger;
            GT_FIN := vNivel3.FieldByName('GT_FIN').AsCurrency;
            // o valor de venda bruta vai sendo incrementado no c420
            // VL_BRT := vNivel3.FieldByName('VL_BRT').AsCurrency;
            VL_BRT := 0;

            FLabelCupons.Caption := vStringTemp + ' Dia: ' +
              DateToStr(vNivel3.FieldByName('DT_DOC').AsDateTime) + ' C420';
            Application.ProcessMessages;

            vNivel4.Close;
            vNivel4.SQL.Text := 'select' +
              ' case when ((mra.descaliq = ''Can-T'') or (mra.descaliq = ''Canc-T'')) then ''CAN-T''' +
              ' when ((mra.descaliq = ''Can-S'') or (mra.descaliq = ''Canc-S'')) then ''CAN-T''' +
              ' else mra.descaliq ' +
              ' end COD_TOT_PAR, mra.valoraliq VLR_ACUM_TOT,' +
              ' case when ((substring(mra.descaliq from 3 for 1) = ''T'') or' +
              '     (substring(mra.descaliq from 3 for 1) = ''S'')) then' +
              '         substring(mra.descaliq from 1 for 2)' +
              '      else ''0''' +
              ' end NR_TOT, '''' DESCR_NR_TOT, mra.descaliq' +
              ' from mapa_resumo_aliq mra where mra.coored = :coored and' +
              ' mra.cod_terminal = :cod_terminal and mra.nserieecf = :nserie' +
              ' and mra.cod_empresa = :cod_empresa';
            vNivel4.ParamByName('coored').AsInteger := vNivel3.FieldByName('NUM_COO_FIN').AsInteger;
            vNivel4.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
            vNivel4.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel4.Open;
            vNivel4.FetchAll;

            FProgressBar2.Position := 0;
            FProgressBar2.Min := 0;
            FProgressBar2.Max := vNivel4.RecordCount;

            vListaTotalizadores.Clear;

            vNivel4.First;
            while not vNivel4.Eof do
            begin
              IF Trim(vNivel4.FieldByName('COD_TOT_PAR').AsString) <> 'AT' then
              with FSpedF.Bloco_C.RegistroC420New do
              begin
                if Trim(vNivel4.FieldByName('COD_TOT_PAR').AsString) = 'FS' then
                  COD_TOT_PAR := 'FS1'
                else
                  COD_TOT_PAR := Trim(vNivel4.FieldByName('COD_TOT_PAR').AsString);
                  VLR_ACUM_TOT := vNivel4.FieldByName('VLR_ACUM_TOT').AsCurrency;
                try
                  NR_TOT := vNivel4.FieldByName('NR_TOT').AsInteger;
                  DESCR_NR_TOT := Trim(vNivel4.FieldByName('DESCR_NR_TOT').AsString);
                except
                end;

                if (Trim(COD_TOT_PAR) <> 'OPNF') and (Trim(COD_TOT_PAR) <> 'DO') and
                  (Trim(COD_TOT_PAR) <> 'AO') and (Trim(COD_TOT_PAR) <> 'CAN-O') and (Trim(COD_TOT_PAR) <> 'IOF') then
                begin
                  VL_BRT := VL_BRT + VLR_ACUM_TOT;
                  if Pos('CAN', COD_TOT_PAR) = 0 then
                  begin
                    if Trim(COD_TOT_PAR) = 'F1' then
                      vStringTemp2 := 'F'
                    else if Trim(COD_TOT_PAR) = 'I1' then
                      vStringTemp2 := 'I'
                    else if Trim(COD_TOT_PAR) = 'N1' then
                      vStringTemp2 := 'N'
//                    else if (Trim(COD_TOT_PAR) = 'FS1') or (Copy(Trim(COD_TOT_PAR),3,1) = 'S') then
//                      vStringTemp2 := 'SERV'
                    else if (Trim(COD_TOT_PAR) = 'FS1') then
                      vStringTemp2 := 'FS'
                    else if (Trim(COD_TOT_PAR) = 'IS1') then
                      vStringTemp2 := 'IS'
                    else if (Trim(COD_TOT_PAR) = 'NS1') then
                      vStringTemp2 := 'NS'
                    else
                      vStringTemp2 := Trim(vNivel4.FieldByName('descaliq').AsString);

                    vBooleanTemp := False;
                    for I := 0 to vListaTotalizadores.Count - 1 do
                      if getCampoPipe(vListaTotalizadores[i], 1) = vStringTemp2 then
                      begin
                        vListaTotalizadores[i] :=
                          getCampoPipe(vListaTotalizadores[i], 1) + '|' +
                          format('%0.2f', [
                            (StrToFloat(getCampoPipe(vListaTotalizadores[i], 2))) +
                            VLR_ACUM_TOT]) + '|';
                        vBooleanTemp := True;
                        Break;
                      end;

                    if not vBooleanTemp then
                      vListaTotalizadores.Add(
                        Trim(vStringTemp2) + '|' +
                        format('%0.2f', [VLR_ACUM_TOT]) + '|'
                      );
                  end;
                end;

                if (FSpedF.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilA) and
                  ((copy(COD_TOT_PAR, 3, 1) = 'T') or (copy(COD_TOT_PAR, 3, 1) = 'S') or
                  (Trim(COD_TOT_PAR) = 'F1') or (Trim(COD_TOT_PAR) = 'I1') or (Trim(COD_TOT_PAR) = 'N1') or (Trim(COD_TOT_PAR) = 'FS1')) then
                begin
                  if (copy(COD_TOT_PAR, 3, 1) = 'T') or (copy(COD_TOT_PAR, 3, 1) = 'S') then
                    vListaTemp.Add(copy(COD_TOT_PAR, 4, 4) + '|' + Format('%0.2f',[VLR_ACUM_TOT])+'|');
                  //else
                    //vListaTemp.Add(COD_TOT_PAR + '|' + Format('%0.2f',[VLR_ACUM_TOT])+'|');

                  vNivel5.Close;
                  vNivel5.SQL.Text :=
                    'select cp2.prod_serv tipo_item, cp2.grupo_prod, cp2.cod_prod, p.unidade UNID,' +
                    ' p.isento_pis, sum(cp2.valor_pis) VL_PIS, sum(cp2.valor_cofins) VL_COFINS,' +
                    ' SUM(cp2.quantidade) QTD,' +
                    ' sum( (coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0)))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0) ) VL_ITEM' +
                    //' SUM(cp2.quantidade) QTD, sum(cp2.total) VL_ITEM' +
                  ' from cupom cp inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
                    ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
                    ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
                    ' left join produtos p on p.grupo_prod = cp2.grupo_prod and p.cod_prod =' +
                    ' cp2.cod_prod and p.cod_empresa = cp2.cod_empresa' +
                    ' where ((cp2.status_it <> ''CANCELADO'') or (cp2.status_it IS NULL))' +
                    ' and ((cp.status_cp <> ''CANCELADO'') or (cp.status_cp is null))' +
                    ' and cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
                    ' and cp2.descaliq = :descaliq' +
                    ' and cp2.cod_empresa = :cod_empresa and cp.data = :dia group by 1,2,3,4,5';
                  vNivel5.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
                  vNivel5.ParamByName('cod_terminal').AsInteger :=
                    vNivel2.FieldByName('ECF_CX').AsInteger;
                  vNivel5.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
                  if Trim(COD_TOT_PAR) = 'F1' then
                  begin
                    vNivel5.SQL.Text := StringReplace(vNivel5.SQL.Text,
                      'cp2.descaliq = :descaliq',
                      'cp2.aliquota_it = :descaliq', [rfReplaceAll, rfIgnoreCase]);
                    vNivel5.ParamByName('descaliq').AsString := 'FF';
                    //                  vNivel5.ParamByName('descaliq1').AsString := 'F1';
                  end
                  else if Trim(COD_TOT_PAR) = 'I1' then
                  begin
                    vNivel5.SQL.Text := StringReplace(vNivel5.SQL.Text,
                      'cp2.descaliq = :descaliq',
                      'cp2.aliquota_it = :descaliq', [rfReplaceAll, rfIgnoreCase]);
                    vNivel5.ParamByName('descaliq').AsString := 'II';
                    //                  vNivel5.ParamByName('descaliq').AsString := 'I';
                    //                  vNivel5.ParamByName('descaliq1').AsString := 'I1';
                  end
                  else if Trim(COD_TOT_PAR) = 'N1' then
                  begin
                    vNivel5.SQL.Text := StringReplace(vNivel5.SQL.Text,
                      'cp2.descaliq = :descaliq',
                      'cp2.aliquota_it = :descaliq', [rfReplaceAll, rfIgnoreCase]);
                    vNivel5.ParamByName('descaliq').AsString := 'NN';
                    //                  vNivel5.ParamByName('descaliq').AsString := 'N';
                    //                  vNivel5.ParamByName('descaliq1').AsString := 'N1';
                  end
                  else if Trim(COD_TOT_PAR) = 'FS1' then
                    vNivel5.ParamByName('descaliq').AsString := 'FS'
                  else if Trim(COD_TOT_PAR) = 'IS1' then
                    vNivel5.ParamByName('descaliq').AsString := 'IS'
                  else if Trim(COD_TOT_PAR) = 'NS1' then
                    vNivel5.ParamByName('descaliq').AsString := 'NS'
                  else
                    vNivel5.ParamByName('descaliq').AsString := Trim(COD_TOT_PAR);

                  vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                  vNivel5.Open;

                  vCurrencyTemp := 0;
                  vNivel5.First;
                  while not vNivel5.Eof do
                  begin
                    vCurrencyTemp := vCurrencyTemp + vNivel5.FieldByName('VL_ITEM').AsFloat;
                    vNivel5.Next;
                  end;
                  if Abs(vCurrencyTemp - vNivel4.FieldByName('VLR_ACUM_TOT').AsCurrency) <= 0.5 then
                    vCurrencyTemp := 0;

                  vNivel5.First;
                  while not vNivel5.Eof do
                  begin
                    if StrToFloatFormat(vNivel5.FieldByName('VL_ITEM').AsFloat, 2) > 0 then
                    with FSpedF.Bloco_C.RegistroC425New do
                    begin
  //                    UNID := getUnidade('P',
  //                        vNivel5.FieldByName('grupo_prod').AsInteger,
  //                        vNivel5.FieldByName('cod_prod').AsString,
  //                        '', 0,'');
                      if Trim(UNID) = '' then
                        UNID := UpperCase(Trim(vNivel5.FieldByName('UNID').AsString));
                      if Trim(UNID) = '' then
                        UNID := 'UN';
                      if vNivel5.FieldByName('tipo_item').AsString = 'P' then
                      begin
                        COD_ITEM := 'P' + StrZero(vNivel5.FieldByName('grupo_prod').AsString +
                          Trim(vNivel5.FieldByName('cod_prod').AsString), 16);

                        gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                          vNivel5.FieldByName('grupo_prod').AsInteger,
                          vNivel5.FieldByName('cod_prod').AsString, '', 0, '', UNID);
                      end
                      else if vNivel5.FieldByName('tipo_item').AsString = 'S' then
                      begin
                        COD_ITEM := 'S' + StrZero(vNivel5.FieldByName('grupo_prod').AsString, 16);

                        gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                          0, '', '', vNivel5.FieldByName('grupo_prod').AsInteger, '', UNID);
                      end;
                      QTD := vNivel5.FieldByName('QTD').AsFloat;
                      VL_ITEM := vNivel5.FieldByName('VL_ITEM').AsFloat;
                      if vCurrencyTemp > 0 then
                        VL_ITEM := (VL_ITEM / vCurrencyTemp) *
                          (vNivel4.FieldByName('VLR_ACUM_TOT').AsCurrency - vCurrencyTemp) + VL_ITEM;

                      VL_PIS := vNivel5.FieldByName('VL_PIS').AsFloat;
                      VL_COFINS := vNivel5.FieldByName('VL_COFINS').AsFloat;
                    end;
                    vNivel5.Next;
                  end;
                end;
              end;
              vNivel4.Next;
              FProgressBar2.Position := FProgressBar2.Position + 1;
            end;

            FLabelCupons.Caption := vStringTemp + ' Dia: ' +
              DateToStr(vNivel3.FieldByName('DT_DOC').AsDateTime) + ' C460';
            Application.ProcessMessages;

            if FSpedF.Bloco_0.Registro0000.IND_PERFIL <> pfPerfilB then
            begin
              vQrAux.Close;
              vQrAux.SQL.Text := ' select cp2.descaliq, sum(coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0)) VL_ITEM' +
                ' from cupom cp' +
                ' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
                ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
                ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
                ' where cp.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
                ' and cp.cod_empresa = :cod_empresa' +
                ' and coalesce(cp2.status_it,'''') <> ''CANCELADO'' and cp.data = :dia' +
                ' group by 1';
              vQrAux.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
              vQrAux.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
              vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vQrAux.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
              vQrAux.Open;

              if vListaSumC470 = nil then
                vListaSumC470 := TStringList.Create;
              vListaSumC470.Clear;

              vQrAux.First;
              while not vQrAux.Eof do
              begin

                if (Copy(vQrAux.FieldByName('descaliq').AsString,3,1) = 'T') then
                  vListaSumC470.Add(Trim(vQrAux.FieldByName('descaliq').AsString) + '|' +
                    Format('%0.2f', [vQrAux.FieldByName('VL_ITEM').AsFloat]) + '|');

                vQrAux.Next;
              end;

              vQrAux.Close;
              vQrAux.SQL.Text := 'select cp2.descaliq, cp2.cst, max(cp.cupom||''|''||cp2.nitem),' +
                ' sum(coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0)) VL_ITEM' +
                ' from cupom cp' +
                ' inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
                ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
                ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
                ' where cp.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
                ' and cp.cod_empresa = :cod_empresa' +
                ' and coalesce(cp2.status_it,'''') <> ''CANCELADO'' and cp.data = :dia' +
                ' group by 1,2';
              vQrAux.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
              vQrAux.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
              vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vQrAux.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
              vQrAux.Open;

              if vListaUltimosC490 = nil then
                vListaUltimosC490 := TStringList.Create;
              vListaUltimosC490.Clear;

              vQrAux.First;
              while not vQrAux.Eof do
              begin

                if (Copy(vQrAux.FieldByName('descaliq').AsString,3,1) = 'T') then
                  vListaUltimosC490.Add(Trim(vQrAux.FieldByName('descaliq').AsString) + '|' +
                    Trim(vQrAux.FieldByName('cst').AsString) + '|' +
                    Format('%0.2f', [vQrAux.FieldByName('VL_ITEM').AsFloat]) + '|');

                vQrAux.Next;
              end;



              vNivel4.Close;
              vNivel4.SQL.Text := 'select cp.registro, ''2D'' COD_MOD,' +
                ' case when cp.status_cp = ''CANCELADO'' then ''02''' +
                '     else ''00''' +
                ' end COD_SIT, cp.cupom NUM_DOC, cp.data DT_DOC, cp.valorcupom VL_DOC,' +
                ' cp.valor_pis VL_PIS, cp.valor_cofins VL_COFINS, c.cpfcgc CPF_CNPJ, c.nome_cliente NOM_ADQ' +
                ' from cupom cp left join clientes c on c.cod_cliente = cp.cliente and' +
                ' c.cod_empresa = cp.cod_empresa' +
                ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
                ' and cp.cod_empresa = :cod_empresa and cp.data = :dia' +
                ' order by cp.cupom';
              vNivel4.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
              vNivel4.ParamByName('cod_terminal').AsInteger :=
                vNivel2.FieldByName('ECF_CX').AsInteger;
              vNivel4.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
              vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vNivel4.Open;
              vNivel4.FetchAll;

              FProgressBar2.Position := 0;
              FProgressBar2.Min := 0;
              FProgressBar2.Max := vNivel4.RecordCount;

              FValorPISAcumulado := 0;
              FValorCOFINSAcumulado := 0;

              vNivel4.First;
              while not vNivel4.Eof do
              begin

                with FSpedF.Bloco_C.RegistroC460New do
                begin
                  COD_MOD := Trim(vNivel4.FieldByName('COD_MOD').AsString);
                  if vNivel4.FieldByName('COD_SIT').AsString = '02' then
                    COD_SIT := sdCancelado
                  else
                    COD_SIT := sdRegular;
                  NUM_DOC := Trim(vNivel4.FieldByName('NUM_DOC').AsString);
                  vBooleanTemp := False;
                  if COD_SIT = sdRegular then
                  begin
                    vBooleanTemp := True;
                    DT_DOC := vNivel4.FieldByName('DT_DOC').AsDateTime;
//                    VL_DOC := vNivel4.FieldByName('VL_DOC').AsCurrency;
                    VL_PIS := vNivel4.FieldByName('VL_PIS').AsCurrency;
                    VL_COFINS := vNivel4.FieldByName('VL_COFINS').AsCurrency;
                    CPF_CNPJ := Trim(vNivel4.FieldByName('CPF_CNPJ').AsString);
                    NOM_ADQ := Trim(vNivel4.FieldByName('NOM_ADQ').AsString);

                    vNivel5.Close;
                    vNivel5.SQL.Text :=
                      'select cp2.prod_serv tipo_item, cp2.grupo_prod, cp2.cod_prod, cp2.quantidade QTD,' +
                      ' case when cp2.status_it = ''CANCELADO'' then cp2.quantidade' +
                      '     else 0' +
                      ' end QTD_CANC, p.unidade UNID,' +
                      ' (coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0)))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0) VL_ITEM,' +

                      ' case when (cp2.prod_serv = ''S'') then ''041''' +
                      ' when (coalesce(cp2.cst, '''') <> '''') then cp2.cst' +
                      '   else p.cst_prod' +
                      ' end CST_ICMS,' +
                      ' case when ((not cp2.codigo_nop is null) and ( cp2.codigo_nop > 0)) then cp2.codigo_nop' +
                      ' when ((cp2.prod_serv = ''S'') and (not ts.codigo_nop is null)) then ts.codigo_nop' +
                      '   when (cp2.prod_serv = ''S'') then 5949' +
                      '   else p.codigo_nop' +
                      ' end CFOP,' +
                      ' case when (substring(cp2.descaliq from 3 for 1) = ''T'') then' +
                      '  substring(cp2.descaliq from 4 for 2)||'',''||substring(cp2.descaliq from 6 for 2)' +
                      '     else ''0''' +
                      ' end ALIQ_ICMS, cp2.valor_pis VL_PIS, cp2.valor_cofins VL_COFINS, p.isento_pis, cp2.descaliq' +
                      ' from cupom2 cp2' +
                      ' left join produtos p on p.grupo_prod = cp2.grupo_prod and p.cod_prod =' +
                      ' cp2.cod_prod and p.cod_empresa = cp2.cod_empresa' +
                      ' left join tipo_servico ts on ts.cod_servico = cp2.grupo_prod and cp2.prod_serv = ''S''' +
                      ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
                      ' and cp2.cod_empresa = :cod_empresa and cp2.cupom = :cupom and cp2.ordem = :ordem' +
                      ' and coalesce(cp2.status_it,'''') <> ''CANCELADO''' +
                      ' order by cp2.nitem';
                    vNivel5.ParamByName('cod_terminal').AsInteger :=
                      vNivel2.FieldByName('ECF_CX').AsInteger;
                    vNivel5.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
                    vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                    vNivel5.ParamByName('cupom').AsInteger := vNivel4.FieldByName('NUM_DOC').AsInteger;
                    vNivel5.ParamByName('ordem').AsInteger := vNivel4.FieldByName('registro').AsInteger;
                    vNivel5.Open;

                    vNivel5.First;
                    while not vNivel5.Eof do
                    begin
                      with FSpedF.Bloco_C.registroC470New do
                      begin
    //                    UNID := getUnidade(vNivel5.FieldByName('tipo_item').AsString,
    //                        vNivel5.FieldByName('grupo_prod').AsInteger,
    //                        vNivel5.FieldByName('cod_prod').AsString,
    //                        '',
    //                        vNivel5.FieldByName('grupo_prod').AsInteger,
    //                        '');
                        if Trim(UNID) = '' then
                          UNID := UpperCase(Trim(vNivel5.FieldByName('UNID').AsString));
                        if Trim(UNID) = '' then
                          UNID := 'UN';
                        if vNivel5.FieldByName('tipo_item').AsString = 'P' then
                        begin
                          COD_ITEM := 'P' + StrZero(vNivel5.FieldByName('grupo_prod').AsString +
                            Trim(vNivel5.FieldByName('cod_prod').AsString), 16);

                          gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                            vNivel5.FieldByName('grupo_prod').AsInteger,
                            vNivel5.FieldByName('cod_prod').AsString, '', 0, '', UNID);
                        end
                        else if vNivel5.FieldByName('tipo_item').AsString = 'S' then
                        begin
                          COD_ITEM := 'S' + StrZero(vNivel5.FieldByName('grupo_prod').AsString, 16);

                          gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                            0, '', '', vNivel5.FieldByName('grupo_prod').AsInteger, '', UNID);
                        end;
                        QTD := vNivel5.FieldByName('QTD').AsFloat;
                        QTD_CANC := vNivel5.FieldByName('QTD_CANC').AsFloat;
                        VL_ITEM := vNivel5.FieldByName('VL_ITEM').AsFloat;
                        if (Copy(vNivel5.FieldByName('descaliq').AsString,3,1) = 'T') then
                          for I := 0 to vListaSumC470.Count - 1 do
                            if (getCampoPipe(vListaSumC470[I], 1) = Trim(vNivel5.FieldByName('descaliq').AsString))then
                              for K := 0 to vListaTotalizadores.Count - 1 do
                                if (getCampoPipe(vListaSumC470[I], 1) = getCampoPipe(vListaTotalizadores[K], 1)) then
                                  if Abs(StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) - StrToFloat(getCampoPipe(vListaSumC470[k],2))) > 0 then
                                  begin
                                    vCurrencyTemp := VL_ITEM / StrToFloat(getCampoPipe(vListaSumC470[k],2)) *
                                      Abs(StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) - StrToFloat(getCampoPipe(vListaSumC470[k],2)));

                                    if StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) < StrToFloat(getCampoPipe(vListaSumC470[k],2)) then
                                      vCurrencyTemp := (-1) * vCurrencyTemp;

                                    VL_ITEM := VL_ITEM + StrToFloatFormat(vCurrencyTemp,2);
                                  end;
                        CST_ICMS := Trim(vNivel5.FieldByName('CST_ICMS').AsString);
                        CFOP := Trim(vNivel5.FieldByName('CFOP').AsString);
                        if QTD_CANC > 0 then
                          ALIQ_ICMS := 0
                        else
                          ALIQ_ICMS := vNivel5.FieldByName('ALIQ_ICMS').AsFloat;
                        VL_PIS := vNivel5.FieldByName('VL_PIS').AsFloat;
                        VL_COFINS := vNivel5.FieldByName('VL_COFINS').AsFloat;

                        VL_DOC :=  VL_DOC + VL_ITEM;
                      end;
                      vNivel5.Next;
                    end;

                    FValorPISAcumulado := FValorPISAcumulado + vNivel4.FieldByName('VL_PIS').AsCurrency;
                    FValorCOFINSAcumulado := FValorCOFINSAcumulado +
                      vNivel4.FieldByName('VL_COFINS').AsCurrency;
                  end;
                end;
                vNivel4.Next;
                FProgressBar2.Position := FProgressBar2.Position + 1;
              end;
            end;

            if vNivel3.FieldByName('VL_BRT').AsCurrency > 0 then
            with FSpedF.Bloco_C.RegistroC410New do
            begin
              VL_PIS := FValorPISAcumulado;
              VL_COFINS := FValorCOFINSAcumulado;
            end;

            FLabelCupons.Caption := vStringTemp + ' Dia: ' +
              DateToStr(vNivel3.FieldByName('DT_DOC').AsDateTime) + ' C490';
            Application.ProcessMessages;
            vTempStr := '';

            for K := 0 to vListaTotalizadores.Count - 1 do
            begin

            vNivel4.Close;
            vNivel4.SQL.Text := 'select' +
              ' case when (cp2.prod_serv = ''S'') then ''041''' +
              ' when (coalesce(cp2.cst, '''') <> '''') then cp2.cst' +
              '   else p.cst_prod' +
              ' end CST_ICMS,' +
              ' case when ((not cp2.codigo_nop is null) and ( cp2.codigo_nop > 0)) then cp2.codigo_nop' +
              ' when ((cp2.prod_serv = ''S'') and (not ts.codigo_nop is null)) then ts.codigo_nop' +
              '   when (cp2.prod_serv = ''S'') then 5949' +
              '   else p.codigo_nop' +
              ' end CFOP,' +
              ' case when (substring(cp2.descaliq from 3 for 1) = ''T'') then' +
              ' substring(cp2.descaliq from 4 for 2)||'',''||substring(cp2.descaliq from 6 for 2)' +
              '    else ''0'' end ALIQ_ICMS,' +
              ' '''' COD_OBS,' +
              ' sum( (coalesce(cp2.total,0)-(coalesce(cp2.rat_desc,0)+coalesce(cp2.perc_desc,0)))+coalesce(cp2.rat_acres,0)+coalesce(cp2.perc_acresc,0) ) VL_OPR' +
              ' from cupom cp inner join cupom2 cp2 on cp.cod_terminal = cp2.cod_terminal and' +
              ' cp.cod_empresa = cp2.cod_empresa and cp.nserieecf = cp2.nserieecf and' +
              ' cp.registro = cp2.ordem and cp.cupom = cp2.cupom' +
              ' LEFT join produtos p on p.grupo_prod = cp2.grupo_prod and p.cod_prod =' +
              ' cp2.cod_prod and p.cod_empresa = cp2.cod_empresa and cp2.prod_serv = ''P''' +
              ' left join tipo_servico ts on ts.cod_servico = cp2.grupo_prod and cp2.prod_serv = ''S''' +
              ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
              ' and cp2.cod_empresa = :cod_empresa and cp.data  = :dia and cp2.aliquota_it <> ''CANC''' +
              ' and cp2.descaliq = ' + QuotedStr(getCampoPipe(vListaTotalizadores[K],1) ) +
              ' group by 1,2,3,4';//,5';
            if getCampoPipe(vListaTotalizadores[K],1) = 'SERV' then
              vNivel4.SQL.Text := StringReplace(
                vNivel4.SQL.Text,
                ' and cp2.descaliq = ' + QuotedStr(getCampoPipe(vListaTotalizadores[K],1) ),
                ' and cp2.prod_serv = ''S''',
                [rfReplaceAll, rfIgnoreCase]);
            vNivel4.ParamByName('dia').AsDate := vNivel3.FieldByName('DT_DOC').AsDateTime;
            vNivel4.ParamByName('cod_terminal').AsInteger := vNivel2.FieldByName('ECF_CX').AsInteger;
            vNivel4.ParamByName('nserie').AsString := vNivel2.FieldByName('ECF_FAB').AsString;
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel4.Open;

            vCurrencySoma := 0;
            vNivel4.First;
            while not vNivel4.Eof do
            begin
              vCurrencySoma := vCurrencySoma + vNivel4.FieldByName('VL_OPR').AsCurrency;
              vNivel4.Next;
            end;
            vListaTotalizadores[K] := getCampoPipe(vListaTotalizadores[k],1)+'|'+getCampoPipe(vListaTotalizadores[k],2)+'|'+
              Format('%0.2f',[vCurrencySoma]) + '|';

            vTempStr := vTempStr + vListaTotalizadores[K] + #13;

            vNivel4.First;
            while not vNivel4.Eof do
            begin
              Application.ProcessMessages;

              vBreak := False;
              if (getCampoPipe(vListaTotalizadores[K],1) = 'N') or (getCampoPipe(vListaTotalizadores[K],1) = 'FS') or (copy(getCampoPipe(vListaTotalizadores[K],1), 3, 1) = 'S') then// Acontece uma situacao do servico ficar como N no cupom2 quando nao tem aliquota de iss, para nao repetir aqui tem este for abaixo
              for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Count - 1 do
                if Trim(vNivel2.FieldByName('ECF_FAB').AsString) = Trim(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].ECF_FAB) then
                begin
                  for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Count - 1 do
                    if vNivel3.FieldByName('DT_DOC').AsDateTime = FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].DT_DOC then
                    begin
                      for L := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Count - 1 do
                        if (Trim(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].CST_ICMS) =
                            Trim(vNivel4.FieldByName('CST_ICMS').AsString)) and
                          (Trim(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].CFOP) =
                            Trim(vNivel4.FieldByName('CFOP').AsString)) and
                          (FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].ALIQ_ICMS =
                            vNivel4.FieldByName('ALIQ_ICMS').AsFloat) then
                        begin
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_OPR :=
                            FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_OPR +
                            vNivel4.FieldByName('VL_OPR').AsCurrency;
                          if FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].ALIQ_ICMS > 0 then
                          begin
                            FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_BC_ICMS :=
                              FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_OPR;
                            FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_ICMS :=
                              FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].VL_BC_ICMS *
                              FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[L].ALIQ_ICMS / 100;
                          end;
                          vBreak := True;
                          Break;
                        end;
                      Break;
                    end;
                  Break;
                end;

              if not vBreak then
              with FSpedF.Bloco_C.RegistroC490New do
              begin
                CST_ICMS := Trim(vNivel4.FieldByName('CST_ICMS').AsString);
                CFOP := Trim(vNivel4.FieldByName('CFOP').AsString);
                ALIQ_ICMS := vNivel4.FieldByName('ALIQ_ICMS').AsFloat;
                VL_OPR := vNivel4.FieldByName('VL_OPR').AsCurrency;
                VL_BC_ICMS := 0;
                VL_ICMS := 0;

                if Abs(StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) - StrToFloat(getCampoPipe(vListaTotalizadores[k],3))) > 0.5 then
                begin
                  vCurrencyTemp := VL_OPR / vCurrencySoma *
                    Abs(StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) - StrToFloat(getCampoPipe(vListaTotalizadores[k],3)));

                  if StrToFloat(getCampoPipe(vListaTotalizadores[k],2)) < StrToFloat(getCampoPipe(vListaTotalizadores[k],3)) then
                    vCurrencyTemp := (-1) * vCurrencyTemp;

                  VL_OPR := VL_OPR + vCurrencyTemp;
                end;
                if ALIQ_ICMS > 0 then
                begin
                  VL_BC_ICMS := VL_OPR;
                  VL_ICMS := StrToFloatFormat(VL_BC_ICMS * ALIQ_ICMS / 100,2);
                end;

                FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
                COD_OBS := Trim(vNivel4.FieldByName('COD_OBS').AsString);
              end;
              vNivel4.Next;
            end;

            end; //fim for lista totalizadores

          end;

          vNivel3.Next;
          FProgressBar.Position := FProgressBar.Position + 1;
        end;

        FLabelCupons.Caption := 'Validando somatórios';
        Application.ProcessMessages;

        for I := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Count - 1 do
          for J := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Count - 1 do
          begin
            for K := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Count - 1 do
            begin

              if (FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].ALIQ_ICMS > 0) and // talvez pode testar apenas o CST <> '20'
                (copy(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CST_ICMS,2,2) <> '20') then
              begin
                vCurrencySoma := 0;
                for L := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Count - 1 do
                  for M := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Count - 1 do
                    if (FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].ALIQ_ICMS > 0)and // talvez pode testar apenas o CST <> '20'
                      (copy(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CST_ICMS, 2, 2) <> '20') and
                      ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].ALIQ_ICMS =
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].ALIQ_ICMS) and
                      ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CST_ICMS =
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CST_ICMS) and
                      ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CFOP =
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CFOP) then
                      vCurrencySoma := vCurrencySoma + FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].VL_ITEM;

                if Abs(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].VL_OPR - vCurrencySoma) > 0.5  then
                begin
                  vBreak := False;
                  for L := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Count - 1 do
                  begin
                    for M := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Count - 1 do
                    begin
                      if (FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].ALIQ_ICMS > 0)and // talvez pode testar apenas o CST <> '20'
                        (copy(FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CST_ICMS, 2, 2) <> '20') and
                        ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].ALIQ_ICMS =
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].ALIQ_ICMS) and
                        ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CST_ICMS =
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CST_ICMS) and
                        ( FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].CFOP =
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].CFOP) then
                      begin
                        vCurrencySoma := FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC490.Items[K].VL_OPR - vCurrencySoma;
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].VL_ITEM :=
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].RegistroC470.Items[M].VL_ITEM + vCurrencySoma;
                        FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].VL_DOC :=
                          FSpedF.Bloco_C.RegistroC001.RegistroC400.Items[I].RegistroC405.Items[J].RegistroC460.Items[L].VL_DOC + vCurrencySoma;
                        vBreak := True;
                      end;
                      if vBreak then
                        Break;
                    end;
                    if vBreak then
                      Break;
                  end;
                end;
              end;
            end;
          end;

      end;
      vNivel2.Next;
    end;
    FLabelCupons.Caption := '';
    Application.ProcessMessages;

    vNivel2.Close;
    vNivel2.SQL.Text := 'select nf.cod_nf, nf.natureza_nf,' +
      ' case when nf.natureza_nf = ''E'' then ''0''' +
      '     else ''1'' end IND_OPER,' +
      ' case when nf.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
      ' else nf.serie end SER, nf.subserie SUB, nf.num_nf NUM_DOC, nf.chave_nfe CHV_NFE, nf.data_lanc DT_DOC,' +
      ' nf.data_ent_saida DT_E_S, nf.valor_total VL_DOC, co.desc_cond_pag IND_PGTO,' +
      ' nf.valor_desc VL_DESC, 0 VL_ABAT_NT, (nf.valor_prod + nf.valor_serv) VL_MERC,' +
      ' case when ((nf.valor_frete is null) or (nf.valor_frete = 0) or' +
      '     (nf.frete_f_nfe = ''S'')) then ''9''' +
      '     else nf.freteconta_tr' +
      ' end IND_FRT,' +
      ' case when nf.frete_f_nfe = ''S'' then 0' +
      '     else nf.valor_frete' +
      ' end VL_FRT, nf.valor_seguro VL_SEG, nf.valor_out_desp VL_OUT_DA, nf.base_icm' +
      ' VL_BC_ICMS, nf.valor_icm VL_ICMS, nf.base_icmsub VL_BC_ICMS_ST, nf.valor_icmsub' +
      ' VL_ICMS_ST, nf.valor_ipi VL_IPI, nf.valor_pis VL_PIS, nf.valor_cofins VL_COFINS,' +
      ' nf.valor_pis_st VL_PIS_ST, nf.valor_cofins_st VL_COFINS_ST, nf.status,' +
      ' nf.TIPO_EMISSAO, nf.extemporaneo,  nf.emissao_propria,' +
      ' nf.dados_interesse_fisco TXT_COMPL,' +
      ' nf.valor_serv VL_SERV_NT, nf.base_iss VL_BC_ISSQN, nf.valor_iss VL_ISSQN,' +
      ' nf.base_irrf VL_BC_IRRF, nf.valor_irrf VL_IRRF, 0 VL_BC_PREV, 0 VL_PREV,' +
      ' ''T''||nf.codigo_tr codigo_tr, nf.placa_tr VEIC_ID, nf.qtde_volumes_tr QTD_VOL,' +
      ' nf.peso_b PESO_BRT, nf.peso_l PESO_LIQ, nf.uf_placa_tr UF_ID, nf.cod_cons,' +
      ' nf.vl_forn, nf.vl_terc, nf.valor_out_desp VL_DA, nf.tp_ligacao,' +
      ' nf.cod_grupo_tensao, nf.vl_serv, nf.vl_serv_nt, nf.tp_assinante' +
      ' from notafiscal nf' +
      ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
      ' nf.modelo_nf in (''6'',''06'',''28'',''29'')'+
      ' and (nf.da is null or nf.da <> ''S'')';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.Open;

    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;
    if not vNivel2.IsEmpty then
      FSpedF.Bloco_C.RegistroC001.IND_MOV := imComDados;
    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro C500';
      Application.ProcessMessages;
      with FSpedF.Bloco_C.RegistroC500New do
      begin
        if (vNivel2.FieldByName('extemporaneo').AsString = 'S') then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
            COD_SIT := sdCanceladoExtemp
          else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') then
            COD_SIT := sdExtempCompl
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA') then
            COD_SIT := sdExtempRegular
          else
            COD_SIT := sdRegimeEspecNEsp;
        end
        else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
          COD_SIT := sdCancelado
        else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') and
          ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdFiscalCompl
        else if ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdRegular;
        if COD_MOD = '55' then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'DENEGADA') then
            COD_SIT := sdDoctoDenegado
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'INUTILIZADA') then
            COD_SIT := sdDoctoNumInutilizada
          else
          begin
            try
              if (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) >= 890) and
                (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) <= 899) then
                COD_SIT := sdRegimeEspecNEsp;
            except
            end;
          end;
        end;

        IND_OPER := StrToTipoOperacao(vNivel2.FieldByName('IND_OPER').AsString);
        IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        SER := Trim(vNivel2.FieldByName('SER').AsString);
        NUM_DOC := vNivel2.FieldByName('NUM_DOC').AsString;
        DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;

        vBooleanTemp := False;
        if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada])
          then
        begin
          vBooleanTemp := True;
          montaRegistro0150(vNivel2.FieldByName('COD_PART').AsString);
          if Trim(vNivel2.FieldByName('codigo_tr').AsString) <> '' then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
              (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
              montaRegistro0150(vNivel2.FieldByName('codigo_tr').AsString);
          //CHV_NFE := Trim(vNivel2.FieldByName('CHV_NFE').AsString);
          COD_PART := vNivel2.FieldByName('COD_PART').AsString;
          COD_CONS := Trim(vNivel2.FieldByName('COD_CONS').AsString);
          SUB := Trim(vNivel2.FieldByName('SUB').AsString);
          DT_E_S := vNivel2.FieldByName('DT_E_S').AsDateTime;
          if DT_E_S < DT_DOC then
            DT_E_S := DT_DOC
          else if DT_E_S > StrToDate(FDataFim) then
            DT_E_S := StrToDate(FDataFim);
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          VL_FORN := vNivel2.FieldByName('VL_FORN').AsCurrency;
          if VL_FORN <= 0 then
            VL_FORN := VL_DOC;
          VL_SERV_NT := vNivel2.FieldByName('VL_SERV_NT').AsCurrency;
          VL_TERC := vNivel2.FieldByName('VL_TERC').AsCurrency;
          VL_DA := vNivel2.FieldByName('VL_DA').AsCurrency;
          VL_BC_ICMS := vNivel2.FieldByName('VL_BC_ICMS').AsCurrency;
          VL_ICMS := StrToFloatFormat(vNivel2.FieldByName('VL_ICMS').AsCurrency,2);
          VL_BC_ICMS_ST := vNivel2.FieldByName('VL_BC_ICMS_ST').AsCurrency;
          VL_ICMS_ST := vNivel2.FieldByName('VL_ICMS_ST').AsCurrency;
          if (VL_ICMS_ST > 0) and (COD_SIT in [sdExtempRegular, sdExtempCompl]) then
            somaFDEB_ESP_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS);
          VL_PIS := vNivel2.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel2.FieldByName('VL_COFINS').AsCurrency;
          //TP_LIGACAO
          //COD_GRUPO_TENSAO
        end;
      end;
      if vBooleanTemp then
      begin
        vNivel3.Close;
        vNivel3.SQL.Text := 'select case when nfi.tipo_item = ''S'' then ''041''' +
          ' else nfi.cst' +
          ' end CST_ICMS, nfi.codigo_nop CFOP, nfi.aliq_icm aliq_icms,' +
          ' sum (nfi.valor_total - nfi.rateio_desconto + nfi.valor_ipi +' +
          ' nfi.rateio_seguro + nfi.rateio_outdesp + nfi.rateio_acres_fin ) VL_OPR,' +
          ' sum(nfi.base_icm) VL_BC_ICMS, sum(nfi.valor_icm) VL_ICMS,' +
          ' sum( case when ((substring(nfi.cst from 2 for 2) = ''10'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''90'')) then nfi.base_icmsub' +
          '     else 0' +
          ' end) VL_BC_ICMS_ST, sum( case when ((substring(nfi.cst from 2 for 2) = ''10'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''90'')) then nfi.valor_icmsub' +
          '     else 0' +
          ' end) VL_ICMS_ST,' +
          ' sum(case when ((substring(nfi.cst from 2 for 2) = ''20'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')) then nfi.vlisento' +
          '     else 0' +
          ' end) VL_RED_BC, sum(nfi.valor_ipi) VL_IPI, sum(nfi.rateio_frete) frete, '''' COD_OBS' +
          ' from notafiscal_item nfi' +
          ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa group by 1,2,3';
        vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.Open;

        vNivel3.first;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_C.RegistroC590New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsFloat;
            if vNivel2.FieldByName('VL_FRT').AsFloat > 0 then
              VL_OPR := VL_OPR + vNivel3.FieldByName('frete').AsFloat;
            if (copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7') or (copy(CST_ICMS, 2, 1) = '9') then
              VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsFloat;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsFloat,2);

            vStringTemp :='';
            vOK := False;
            for L := 0 to FSpedF.Bloco_0.Registro0001.Registro0015.Count - 1 do
            begin
              vStringTemp := getSiglaUFParticipante(vNivel2.FieldByName('COD_PART').AsString);
              if vStringTemp = FSpedF.Bloco_0.Registro0001.Registro0015.Items[L].UF_ST then
              begin
                vOK := True;
                Break;
              end;
            end;


            if ((copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1)= '7') or (copy(CST_ICMS, 2, 1)= '9'))and
              (vOK) then
            begin
              VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
              VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
              if VL_ICMS_ST > 0 then
                setSTEstado(vNivel2.FieldByName('COD_PART').AsString);
              if (copy(CFOP, 1, 1) = '5') or (copy(CFOP, 1, 1) = '6') then
                somaFVL_RETENCAO_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
            end
            else
            begin
              VL_BC_ICMS_ST := 0;
              VL_ICMS_ST := 0;
            end;
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            if (vNivel2.FieldByName('natureza_nf').AsString = 'E') and
              ((CFOP <> '1605') or (CFOP = '5605')) then
              FVL_TOT_CREDITOS := FVL_TOT_CREDITOS + VL_ICMS;
            VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsFloat;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;
          vNivel3.Next;
        end;
      end;
      vNivel2.Next;
    end;
    FLabelStatus.Caption := 'Finalizando Bloco C';
    if vMensagemDevolucao then
      Application.MessageBox( PChar(
        'Foram escrituradas devoluções de venda com DIFAL/FCP' + #13 + #13 +
        'Provavelmente o arquivo vai gerar inconsistências na validação do PVA' + #13 +
        'Por favor informe a sua contabilidade sobre as devoluções, pois devem ser feitos ajustes na apuração'), 'Atenção', MB_ICONWARNING + MB_OK);
  finally
    vNivel2.Close;
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
    vNivel6.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoD;
var
  vBooleanTemp: Boolean;
begin
  try
    verificaDataServicoTransporte;
    FSpedF.Bloco_D.RegistroD001New.IND_MOV := imSemDados;
    vNivel2.Close;
    vNivel2.SQL.Text :=
      'select st.cod_serv_transp, ''0'' IND_OPER, ''1'' IND_EMIT, ''T''||st.cod_transportador COD_PART,' +
      ' st.modelo COD_MOD, ''00'' COD_SIT, st.serie SER, st.sub_serie SUB,' +
      ' st.num_documento NUM_DOC, st.CHV_CTE, st.data_emissao DT_DOC, st.data_lancamento DT_A_P,' +
      ' '''' TP_CT_e, '''' CHV_CTE_REF, st.valor_total VL_DOC, 0 VL_DESC,' +
      ' case when st.cif_fob_outros is null then 0 else st.cif_fob_outros end IND_FRT,' +
      ' st.valor_total VL_SERV, st.base_calc_icms' +
      ' VL_BC_ICMS, st.valor_icms VL_ICMS,' +
      ' ((case when st.outras is null then 0' +
      '     else st.outras' +
      ' end) +' +
      ' (case when st.isenta_n_tribut is null then 0' +
      '     else st.isenta_n_tribut' +
      ' end)) VL_NT, '''' COD_INF, '''' COD_CTA' +
      ' from servico_transporte st' +
      ' where st.data_lancamento >= :dataIni and st.data_lancamento <= :dataFim and' +
      ' st.cod_empresa = :cod_empresa';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.Open;

    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;
    if not vNivel2.IsEmpty then
      FSpedF.Bloco_D.RegistroD001.IND_MOV := imComDados;
    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro D100';
      Application.ProcessMessages;
      with FSpedF.Bloco_D.RegistroD100New do
      begin
        IND_OPER := StrToTipoOperacao(vNivel2.FieldByName('IND_OPER').AsString);
        IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        COD_SIT := sdRegular;
        SER := Trim(vNivel2.FieldByName('SER').AsString);
        SUB := Trim(vNivel2.FieldByName('SUB').AsString);
        NUM_DOC := vNivel2.FieldByName('NUM_DOC').AsString;
        vBooleanTemp := False;
        if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada])
          then
        begin
          vBooleanTemp := True;
          COD_PART := Trim(vNivel2.FieldByName('COD_PART').AsString);
          montaRegistro0150(COD_PART);
          CHV_CTE := Trim(vNivel2.FieldByName('CHV_CTE').AsString);
          DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;
          if Trim(vNivel2.FieldByName('DT_A_P').AsString) <> '' then
          begin
            DT_A_P := vNivel2.FieldByName('DT_A_P').AsDateTime;
            if DT_A_P < DT_DOC then
              DT_A_P := DT_DOC
            else if DT_A_P > StrToDate(FDataFim) then
              DT_A_P := StrToDate(FDataFim);
          end;
          TP_CT_e := Trim(vNivel2.FieldByName('TP_CT_e').AsString);
          CHV_CTE_REF := Trim(vNivel2.FieldByName('CHV_CTE_REF').AsString);
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          IND_FRT := StrToTipoFrete(Trim(vNivel2.FieldByName('IND_FRT').AsString));
          VL_SERV := vNivel2.FieldByName('VL_SERV').AsCurrency;
          VL_BC_ICMS := vNivel2.FieldByName('VL_BC_ICMS').AsCurrency;
          VL_ICMS := StrToFloatFormat(vNivel2.FieldByName('VL_ICMS').AsCurrency,2);
          VL_NT := vNivel2.FieldByName('VL_NT').AsCurrency;
          COD_INF := Trim(vNivel2.FieldByName('COD_INF').AsString);
          COD_CTA := Trim(vNivel2.FieldByName('COD_CTA').AsString);
        end;
      end;
      if vBooleanTemp then
      begin
        vNivel3.Close;
        vNivel3.SQL.Text := 'select' +
          ' case when ((not st.cst_icms is null) and (st.cst_icms <> '''')) then st.cst_icms' +
          '     when (st.base_calc_icms > 0) then ''000''' +
          '     when ((st.isenta_n_tribut > 0) or (st.outras > 0))  then ''041''' +
          '     else ''090''' +
          ' end cst_icms, st.cfop , st.aliq_icm aliq_icms, st.valor_total VL_OPR,' +
          ' st.base_calc_icms VL_BC_ICMS, st.valor_icms VL_ICMS,' +
          ' case when ((not st.base_calc_icms is null) and (st.valor_total > st.base_calc_icms)) then' +
          '     (st.valor_total - st.base_calc_icms)' +
          '     else 0' +
          ' end VL_RED_BC, '''' COD_OBS' +
          ' from servico_transporte st' +
          ' where st.cod_serv_transp = :cod_serv_transp and st.cod_empresa = :cod_empresa';
        vNivel3.ParamByName('cod_serv_transp').AsInteger := vNivel2.FieldByName('cod_serv_transp').AsInteger;
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.Open;

        vNivel3.First;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_D.RegistroD190New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsCurrency;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsCurrency;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsCurrency,2);
            if (vNivel2.FieldByName('IND_OPER').AsString = '1') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            if (vNivel2.FieldByName('IND_OPER').AsString = '0') and
              ((CFOP <> '1605') or (CFOP = '5605')) then
              FVL_TOT_CREDITOS := FVL_TOT_CREDITOS + VL_ICMS;
            VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsCurrency;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;
          vNivel3.Next;
        end;
      end;
      vNivel2.Next;
    end;

    vNivel2.Close;
    vNivel2.SQL.Text := 'select nf.cod_nf, nf.natureza_nf,' +
      ' case when nf.natureza_nf = ''E'' then ''0''' +
      '     else ''1'' end IND_OPER,' +
      ' case when nf.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, nf.cod_cliente COD_PART, nf.modelo_nf COD_MOD,' +
      ' case when coalesce(nf.sem_serie, '''') = ''S'' then ''''' +
      ' else nf.serie end SER, nf.subserie SUB, nf.num_nf NUM_DOC, nf.chave_nfe CHV_NFE, nf.data_lanc DT_DOC,' +
      ' nf.data_ent_saida DT_E_S, nf.valor_total VL_DOC, co.desc_cond_pag IND_PGTO,' +
      ' nf.valor_desc VL_DESC, 0 VL_ABAT_NT, (nf.valor_prod + nf.valor_serv) VL_SERV,' +
      ' case when ((nf.valor_frete is null) or (nf.valor_frete = 0) or' +
      '     (nf.frete_f_nfe = ''S'')) then ''9''' +
      '     else nf.freteconta_tr' +
      ' end IND_FRT,' +
      ' case when nf.frete_f_nfe = ''S'' then 0' +
      '     else nf.valor_frete' +
      ' end VL_FRT, nf.valor_seguro VL_SEG, nf.valor_out_desp VL_OUT_DA, nf.base_icm' +
      ' VL_BC_ICMS, nf.valor_icm VL_ICMS, nf.base_icmsub VL_BC_ICMS_ST, nf.valor_icmsub' +
      ' VL_ICMS_ST, nf.valor_ipi VL_IPI, nf.valor_pis VL_PIS, nf.valor_cofins VL_COFINS,' +
      ' nf.valor_pis_st VL_PIS_ST, nf.valor_cofins_st VL_COFINS_ST, nf.status,' +
      ' nf.TIPO_EMISSAO, nf.extemporaneo,  nf.emissao_propria,' +
      ' nf.dados_interesse_fisco TXT_COMPL,' +
      ' nf.valor_serv VL_SERV_NT, nf.base_iss VL_BC_ISSQN, nf.valor_iss VL_ISSQN,' +
      ' nf.base_irrf VL_BC_IRRF, nf.valor_irrf VL_IRRF, 0 VL_BC_PREV, 0 VL_PREV,' +
      ' ''T''||nf.codigo_tr codigo_tr, nf.placa_tr VEIC_ID, nf.qtde_volumes_tr QTD_VOL,' +
      ' nf.peso_b PESO_BRT, nf.peso_l PESO_LIQ, nf.uf_placa_tr UF_ID, nf.cod_cons,' +
      ' nf.vl_forn, nf.vl_terc, nf.valor_out_desp VL_DA, nf.tp_ligacao,' +
      ' nf.cod_grupo_tensao, nf.vl_serv, nf.vl_serv_nt, nf.tp_assinante, '''' COD_CTA' +
      ' from notafiscal nf' +
      ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
      ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
      ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
      ' nf.modelo_nf in (''21'',''22'')'+
      ' and (nf.da is null or nf.da <> ''S'')';
    vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel2.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel2.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel2.Open;

    vNivel2.FetchAll;
    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel2.RecordCount;
    if not vNivel2.IsEmpty then
      FSpedF.Bloco_D.RegistroD001.IND_MOV := imComDados;
    vNivel2.First;
    while not vNivel2.Eof do
    begin
      FLabelStatus.Caption := 'Montando registro D500';
      Application.ProcessMessages;
      with FSpedF.Bloco_D.RegistroD500New do
      begin
        if (vNivel2.FieldByName('extemporaneo').AsString = 'S') then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
            COD_SIT := sdCanceladoExtemp
          else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') then
            COD_SIT := sdExtempCompl
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA') then
            COD_SIT := sdExtempRegular
          else
            COD_SIT := sdRegimeEspecNEsp;
        end
        else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'CANCELADA') then
          COD_SIT := sdCancelado
        else if (vNivel2.FieldByName('TIPO_EMISSAO').AsString = '2') and
          ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdFiscalCompl
        else if ((UpperCase(vNivel2.FieldByName('status').AsString) = 'FECHADA')) then
          COD_SIT := sdRegular;
        if COD_MOD = '55' then
        begin
          if (UpperCase(vNivel2.FieldByName('status').AsString) = 'DENEGADA') then
            COD_SIT := sdDoctoDenegado
          else if (UpperCase(vNivel2.FieldByName('status').AsString) = 'INUTILIZADA') then
            COD_SIT := sdDoctoNumInutilizada
          else
          begin
            try
              if (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) >= 890) and
                (StrToIntDef(Trim(vNivel2.FieldByName('SER').AsString),0) <= 899) then
                COD_SIT := sdRegimeEspecNEsp;
            except
            end;
          end;
        end;

        IND_OPER := StrToTipoOperacao(vNivel2.FieldByName('IND_OPER').AsString);
        IND_EMIT := StrToEmitente(vNivel2.FieldByName('IND_EMIT').AsString);
        COD_MOD := StrZero(vNivel2.FieldByName('COD_MOD').AsString, 2);
        SER := Trim(vNivel2.FieldByName('SER').AsString);
        SUB := Trim(vNivel2.FieldByName('SUB').AsString);
        NUM_DOC := vNivel2.FieldByName('NUM_DOC').AsString;
        DT_DOC := vNivel2.FieldByName('DT_DOC').AsDateTime;

        vBooleanTemp := False;
        if not (COD_SIT in [sdCancelado, sdCanceladoExtemp, sdDoctoDenegado, sdDoctoNumInutilizada])
          then
        begin
          vBooleanTemp := True;
          montaRegistro0150(vNivel2.FieldByName('COD_PART').AsString);
          if Trim(vNivel2.FieldByName('codigo_tr').AsString) <> '' then
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') and
              (vNivel2.FieldByName('COD_MOD').AsString <> '55') then
              montaRegistro0150(vNivel2.FieldByName('codigo_tr').AsString);
          //CHV_NFE := Trim(vNivel2.FieldByName('CHV_NFE').AsString);
          COD_PART := vNivel2.FieldByName('COD_PART').AsString;
          DT_A_P := vNivel2.FieldByName('DT_E_S').AsDateTime;
          if DT_A_P < DT_DOC then
            DT_A_P := DT_DOC
          else if DT_A_P > StrToDate(FDataFim) then
            DT_A_P := StrToDate(FDataFim);
          VL_DOC := vNivel2.FieldByName('VL_DOC').AsCurrency;
          VL_DESC := vNivel2.FieldByName('VL_DESC').AsCurrency;
          VL_SERV := vNivel2.FieldByName('VL_SERV').AsCurrency;
          VL_SERV_NT := vNivel2.FieldByName('VL_SERV_NT').AsCurrency;
          VL_TERC := vNivel2.FieldByName('VL_TERC').AsCurrency;
          VL_DA := vNivel2.FieldByName('VL_DA').AsCurrency;
          VL_BC_ICMS := vNivel2.FieldByName('VL_BC_ICMS').AsCurrency;
          VL_ICMS := StrToFloatFormat(vNivel2.FieldByName('VL_ICMS').AsCurrency,2);
          VL_PIS := vNivel2.FieldByName('VL_PIS').AsCurrency;
          VL_COFINS := vNivel2.FieldByName('VL_COFINS').AsCurrency;
          COD_CTA := Trim(vNivel2.FieldByName('COD_CTA').AsString);
          //TP_ASSINANTE
        end;
      end;
      if vBooleanTemp then
      begin
        vNivel3.Close;
        vNivel3.SQL.Text := 'select case when nfi.tipo_item = ''S'' then ''041''' +
          ' else nfi.cst' +
          ' end CST_ICMS, nfi.codigo_nop CFOP, nfi.aliq_icm aliq_icms,' +
          ' sum (nfi.valor_total - nfi.rateio_desconto + nfi.valor_ipi +' +
          ' nfi.rateio_seguro + nfi.rateio_outdesp + nfi.rateio_acres_fin ) VL_OPR,' +
          ' sum(nfi.base_icm) VL_BC_ICMS, sum(nfi.valor_icm) VL_ICMS,' +
          ' sum( case when ((substring(nfi.cst from 2 for 2) = ''10'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''90'')) then nfi.base_icmsub' +
          '     else 0' +
          ' end) VL_BC_ICMS_ST, sum( case when ((substring(nfi.cst from 2 for 2) = ''10'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''30'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')or' +
          '     (substring(nfi.cst from 2 for 2) = ''90'')) then nfi.valor_icmsub' +
          '     else 0' +
          ' end) VL_ICMS_ST,' +
          ' sum(case when ((substring(nfi.cst from 2 for 2) = ''20'') or' +
          '     (substring(nfi.cst from 2 for 2) = ''70'')) then nfi.vlisento' +
          '     else 0' +
          ' end) VL_RED_BC, sum(nfi.valor_ipi) VL_IPI, sum(nfi.rateio_frete) frete, '''' COD_OBS' +
          ' from notafiscal_item nfi' +
          ' where nfi.cod_nf = :cod_nf and nfi.cod_empresa = :cod_empresa group by 1,2,3';
        vNivel3.ParamByName('cod_nf').AsInteger := vNivel2.FieldByName('cod_nf').AsInteger;
        vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
        vNivel3.Open;

        vNivel3.first;
        while not vNivel3.Eof do
        begin
          with FSpedF.Bloco_D.RegistroD590New do
          begin
            CST_ICMS := Trim(vNivel3.FieldByName('CST_ICMS').AsString);
            CFOP := Trim(vNivel3.FieldByName('CFOP').AsString);
            ALIQ_ICMS := vNivel3.FieldByName('ALIQ_ICMS').AsFloat;
            VL_OPR := vNivel3.FieldByName('VL_OPR').AsFloat;
            if vNivel2.FieldByName('VL_FRT').AsFloat > 0 then
              VL_OPR := VL_OPR + vNivel3.FieldByName('frete').AsFloat;
            if (copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7') or (copy(CST_ICMS, 2, 1) = '9') then
              VL_OPR := VL_OPR + vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
            VL_BC_ICMS := vNivel3.FieldByName('VL_BC_ICMS').AsFloat;
            VL_ICMS := StrToFloatFormat(vNivel3.FieldByName('VL_ICMS').AsFloat,2);
            if (vNivel2.FieldByName('natureza_nf').AsString = 'S') then
              FVL_TOT_DEBITOS := FVL_TOT_DEBITOS + VL_ICMS;
            if (vNivel2.FieldByName('natureza_nf').AsString = 'E') and
              ((CFOP <> '1605') or (CFOP = '5605')) then
              FVL_TOT_CREDITOS := FVL_TOT_CREDITOS + VL_ICMS;
            if (copy(CST_ICMS, 2, 1) = '1') or (copy(CST_ICMS, 2, 1) = '3') or (copy(CST_ICMS, 2, 1) = '7') or (copy(CST_ICMS, 2, 1) = '9') then
            begin
//              VL_BC_ICMS_ST := vNivel3.FieldByName('VL_BC_ICMS_ST').AsFloat;
//              VL_ICMS_ST := vNivel3.FieldByName('VL_ICMS_ST').AsFloat;
//              if VL_ICMS_ST > 0 then
//                setSTEstado(vNivel2.FieldByName('COD_PART').AsString);
//              if (copy(CFOP, 1, 1) = '5') or (copy(CFOP, 1, 1) = '6') then
//                somaFVL_RETENCAO_ST(vNivel2.FieldByName('COD_PART').AsString, VL_ICMS_ST);
            end
            else
            begin
//              VL_BC_ICMS_ST := 0;
//              VL_ICMS_ST := 0;
            end;
            VL_RED_BC := vNivel3.FieldByName('VL_RED_BC').AsFloat;
            COD_OBS := Trim(vNivel3.FieldByName('COD_OBS').AsString);
          end;
          vNivel3.Next;
        end;
      end;
      vNivel2.Next;
    end;
  finally
    vNivel2.Close;
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
    vNivel6.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoE;
var
  FVL_ICMS_RECOLHER: Currency;
  vStringTemp: string;
  I: Integer;
  i100, i101: Integer;
  vContEst: Integer;
  UNID: string;
  vUFEmp, vUFPart: string;
  vrEquacao, vDEB_ESP_DIFAL, vVL_OR_E316: Double;
  vDEB_ESP_FCP: Double;
  iAJ: Integer;
begin
  try
    FLabelStatus.Caption := 'Montando registro E100';
    FVL_ICMS_RECOLHER := 0;
    FValorCredFuturo_ICMS := 0;
    FSpedF.Bloco_E.RegistroE001New.IND_MOV := imComDados;
    with FSpedF.Bloco_E.RegistroE100New do
    begin
      DT_INI := StrToDate(FDataIni);
      DT_FIN := StrToDate(FDataFim);
    end;

    with FSpedF.Bloco_E.RegistroE110New do
    begin
      VL_TOT_DEBITOS := FVL_TOT_DEBITOS;
      VL_AJ_DEBITOS := FVL_AJ_DEBITOS;
      VL_TOT_AJ_DEBITOS := 0;
      VL_ESTORNOS_CRED := 0;
      VL_TOT_CREDITOS := FVL_TOT_CREDITOS;
      VL_AJ_CREDITOS := FVL_AJ_CREDITOS;
      VL_TOT_AJ_CREDITOS := 0;
      VL_ESTORNOS_DEB := 0;
      VL_SLD_CREDOR_ANT := FValorCredPerAnt_ICMS;
      VL_SLD_APURADO :=
        (VL_TOT_DEBITOS + (VL_AJ_DEBITOS + VL_TOT_AJ_DEBITOS) + VL_ESTORNOS_CRED) -
        (VL_TOT_CREDITOS + (VL_AJ_CREDITOS + VL_TOT_AJ_CREDITOS) + VL_ESTORNOS_DEB +
        VL_SLD_CREDOR_ANT);
      if VL_SLD_APURADO >= 0 then
        VL_SLD_CREDOR_TRANSPORTAR := 0
      else
      begin
        VL_SLD_CREDOR_TRANSPORTAR := Abs(VL_SLD_APURADO);
        VL_SLD_APURADO := 0;
      end;

      VL_TOT_DED := FVL_TOT_DED;
      VL_ICMS_RECOLHER := VL_SLD_APURADO - VL_TOT_DED;
      if VL_ICMS_RECOLHER < 0 then
      begin
        VL_SLD_CREDOR_TRANSPORTAR := abs(VL_ICMS_RECOLHER);
        VL_ICMS_RECOLHER := 0;
      end;
      FVL_ICMS_RECOLHER := VL_ICMS_RECOLHER;
      DEB_ESP := 0;
      FValorCredFuturo_ICMS := VL_SLD_CREDOR_TRANSPORTAR;
    end;
    if FVL_ICMS_RECOLHER > 0 then
      with FSpedF.Bloco_E.RegistroE116New do
      begin
        if Trim(fCOD_OR_E116) <> '' then
          COD_OR := Trim(fCOD_OR_E116)
        else        
          COD_OR := '000';
        VL_OR := FVL_ICMS_RECOLHER;
        if fDiaVencICMS > 0 then
        begin
          vStringTemp := StrZero(IntToStr(fDiaVencICMS), 2) + '/';
          vStringTemp := vStringTemp + Copy(FormatDateTime('dd/mm/yyyy',IncMonth(StrToDate(FDataIni))), 4, 7);
          try
            StrToDate(vStringTemp);          
          except
            Application.MessageBox(pchar('Dia de Vencimento de ICMS inválido! ' + StrZero(IntToStr(fDiaVencICMS), 2)),
              'Atenção', 0 + 64);
            vStringTemp := FormatDateTime('dd/mm/yyyy',IncMonth(StrToDate(FDataIni)));
            vStringTemp := '09/' + copy(vStringTemp,4,7);
            Application.MessageBox(pchar('Será assumida a data ' + vStringTemp), 'Atenção', 0 + 64);
          end;
        end
        else
        begin
          vStringTemp := FormatDateTime('dd/mm/yyyy',IncMonth(StrToDate(FDataIni)));
          vStringTemp := '09/' + copy(vStringTemp,4,7);
        end;
        DT_VCTO := StrToDate(vStringTemp);
        if Trim(fCOD_REC_E116) <> '' then
          COD_REC := Trim(fCOD_REC_E116)
        else
        begin
          if Trim(fCOD_REC_E116) = '' then
            Application.MessageBox(pchar('Campo Codigo de Receita(E116 - COD_REC) não encontrado no cadastro!' + #13 +
              'Campo exigido pelo PVA. Acesse o cadastro da empresa na aba SPED -> EFD ICMS IPI' + 
              ' e informe o Código exigido!' + #13 +
              'Códigos disponíveis no site do SPED (Tabelas de Códigos de Receita)'), 'Atenção', 0 + 64);
          COD_REC := '0';
        end;
        NUM_PROC := '';
        IND_PROC := opNenhum;
        PROC := '';
        TXT_COMPL := '';
        ShortDateFormat := 'dd/mm/yyyy';
        vStringTemp := DateToStr(StartOfTheMonth(StrToDate(FDataIni)));
        MES_REF := StringReplace(Copy(vStringTemp, 4, 7), '/', '', [rfReplaceAll]);
      end;

    for I := 1 to 27 do
    begin
      if not fApurarST then
      begin
        FVL_DEVOL_ST[I]    := 0;
        FVL_OUT_CRED_ST[I] := 0;
        FVL_RETENCAO_ST[I] := 0;
      end;

      if not fApurarSTAnt then
      begin
        FVL_AJ_CREDITOS_ST[I] := 0;
        FVL_AJ_DEBITOS_ST[I]  := 0;
        FDEB_ESP_ST[I]        := 0;
      end;
      if (FVL_DEVOL_ST[I] = 0) and (FVL_OUT_CRED_ST[I] = 0) and (FVL_RETENCAO_ST[I] = 0) and //st
        (FVL_AJ_CREDITOS_ST[I] = 0) and (FVL_AJ_DEBITOS_ST[I] = 0) and (FDEB_ESP_ST[I] = 0) then// stant
        FSigla[I] := '';
    end;

    if fApurarST or fApurarSTAnt then
      for I := 1 to 27 do
        if Trim(FSigla[i]) <> '' then
        begin
          with FSpedF.Bloco_E.RegistroE200New do
          begin
            UF := FSigla[i];
            DT_INI := StrToDate(FDataIni);
            DT_FIN := StrToDate(FDataFim);
          end;

          with FSpedF.Bloco_E.RegistroE210New do
          begin
            IND_MOV_ST := mstComOperacaoST;
            VL_SLD_CRED_ANT_ST := 0;
            VL_DEVOL_ST := FVL_DEVOL_ST[I];
            VL_RESSARC_ST := 0; //FVL_RESSARC_ST[i];
            VL_OUT_CRED_ST := FVL_OUT_CRED_ST[i];
            VL_AJ_CREDITOS_ST := FVL_AJ_CREDITOS_ST[i];
            VL_RETENCAO_ST := FVL_RETENCAO_ST[i];
            VL_OUT_DEB_ST := 0;
            VL_AJ_DEBITOS_ST := FVL_AJ_DEBITOS_ST[i];
            VL_SLD_DEV_ANT_ST := (VL_RETENCAO_ST + VL_OUT_DEB_ST + VL_AJ_DEBITOS_ST) -
              (VL_SLD_CRED_ANT_ST + VL_DEVOL_ST + VL_RESSARC_ST + VL_OUT_CRED_ST + VL_AJ_CREDITOS_ST);
            if VL_SLD_DEV_ANT_ST >= 0 then
              VL_SLD_CRED_ST_TRANSPORTAR := 0
            else
            begin
              VL_SLD_CRED_ST_TRANSPORTAR := Abs(VL_SLD_DEV_ANT_ST);
              VL_SLD_DEV_ANT_ST := 0;
            end;
            VL_DEDUCOES_ST := 0;
            VL_ICMS_RECOL_ST := VL_SLD_DEV_ANT_ST - VL_DEDUCOES_ST;
            //          if VL_ICMS_RECOL_ST <= 0 then
            //            VL_ICMS_RECOL_ST := 0;
            DEB_ESP_ST := FDEB_ESP_ST[i];
            if fUFIBGE = IBGE[i] then
            begin
              DEB_ESP_ST := 0;
              for vContEst := 1 to 27 do
                DEB_ESP_ST := DEB_ESP_ST + FDEB_ESP_ST[vContEst];
//              if (DEB_ESP_ST - FDEB_ESP_ST[i]) >= 0 then
//                DEB_ESP_ST := DEB_ESP_ST - FDEB_ESP_ST[i];
            end;

            if (DEB_ESP_ST + VL_ICMS_RECOL_ST) > 0 then
            begin
              if fUFIBGE <> IBGE[i] then
              begin
                if DEB_ESP_ST > 0 then
                  with FSpedF.Bloco_E.RegistroE220New do
                  begin
                    COD_AJ_APUR := FSigla[i] + '159999';
                    VL_AJ_APUR := DEB_ESP_ST;
                  end;
                if VL_ICMS_RECOL_ST > 0 then
                  with FSpedF.Bloco_E.RegistroE220New do
                  begin
                    COD_AJ_APUR := FSigla[i] + '149999';
                    VL_AJ_APUR := VL_ICMS_RECOL_ST;
                    //
                    VL_DEDUCOES_ST := VL_AJ_APUR;
                    VL_ICMS_RECOL_ST := VL_SLD_DEV_ANT_ST - VL_DEDUCOES_ST;
                    for iAJ := 0 to ListCodAJ_E220_ST_Recolhido.Count - 1 do
                      if getValue(ListCodAJ_E220_ST_Recolhido[iAJ], 1) = FSigla[i] then
                      begin
                        COD_AJ_APUR := FSigla[i] + getValue(ListCodAJ_E220_ST_Recolhido[iAJ], 2);
                        DESCR_COMPL_AJ := getValue(ListCodAJ_E220_ST_Recolhido[iAJ], 3);
                      end;
                  end;
              end;

              with FSpedF.Bloco_E.RegistroE250New do
              begin
                if Trim(fCOD_OR_E250) <> '' then
                  COD_OR := Trim(fCOD_OR_E250)
                else
                  COD_OR := '999';
                VL_OR := DEB_ESP_ST + VL_ICMS_RECOL_ST;
                DT_VCTO := StrToDate(FDataFim);
                if Trim(fCOD_REC_E250) <> '' then
                  COD_REC := Trim(fCOD_REC_E250)
                else
                begin
                  if Trim(fCOD_REC_E250) = '' then
                    Application.MessageBox(pchar('Campo Codigo de Receita(E250 - COD_REC) não encontrado no cadastro!' + #13 +
                      'Campo exigido pelo PVA. Acesse o cadastro da empresa na aba SPED -> EFD ICMS IPI' +
                      ' e informe o Código exigido!' + #13 +
                      'Códigos disponíveis no site do SPED (Tabelas de Códigos de Receita)'), 'Atenção', 0 + 64);
                  COD_REC := '0';
                end;
                NUM_PROC := '';
                IND_PROC := opNenhum;
                PROC := '';
                TXT_COMPL := '';
                ShortDateFormat := 'dd/mm/yyyy';
                vStringTemp := DateToStr(StartOfTheMonth(StrToDate(FDataIni)) - 1);
                MES_REF := StringReplace(Copy(vStringTemp, 4, 7), '/', '', [rfReplaceAll]);
              end;
            end;
          end;

      end;

    if (FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao109) then
    begin
      // Montando registro E300';
      FLabelStatus.Caption := 'Montando registro E300';
      vNivel2.Close;
      vNivel2.SQL.Text :=
        ' select distinct uf from SPED_F_ICMINTER_AJ' +
        ' where data_lanc>= :dataini and data_lanc <= :datafim' +
        ' and cod_empresa = :cod_empresa' +
        ' union ' +
        ' select distinct uf from SPED_F_ICMINTER_OB_DIFAL' +
        ' where data_lanc>= :dataini and data_lanc <= :datafim' +
        ' and cod_empresa = :cod_empresa' +
        ' union ' +
        ' select distinct es.sigla_uf uf' +
        ' from notafiscal nf' +
        ' inner join cond_pag co on co.cod_cond_pag = nf.cod_cond_pag' +
        ' inner join clientes cl on cl.cod_cliente =  nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
        ' inner join estados es on es.codigo_uf = cl.codigo_uf' +
        ' where nf.cod_empresa = :cod_empresa and nf.data_lanc >= :dataIni and' +
        ' nf.data_lanc <= :dataFim and status <> ''Aberta'' and' +
        ' nf.modelo_nf in (''1'',''01'',''1A'',''1-A'',''4'',''04'',''55'')'+
        ' and (nf.da is null or nf.da <> ''S'')' +
        ' and ((coalesce(nf.vfcpufdest,0) > 0) or (coalesce(nf.vicmsufdest,0) > 0)' +
        ' or (coalesce(nf.vicmsufremet, 0) > 0))' +
        ' union ' +
        ' select distinct es.sigla_uf uf from empresa emp' +
        ' inner join estados es on es.codigo_uf = emp.uf_emp' +
        ' where emp.cod_empresa = :cod_empresa' +
        ' order by 1';
      vNivel2.ParamByName('dataini').AsDate := StrToDate(FDataIni);
      vNivel2.ParamByName('datafim').AsDate := StrToDate(FDataFim);
      vNivel2.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
      vNivel2.Open;
      vNivel2.FetchAll;

      vNivel2.First;
      while not vNivel2.Eof do
      begin
        with FSpedF.Bloco_E.RegistroE300New do
        begin
          // dados do registro E300
          UF := vNivel2.FieldByName('uf').AsString;
          DT_INI := StrToDate(FDataIni);
          DT_FIN := StrToDate(FDataFim);

          vDEB_ESP_DIFAL := 0;
          vDEB_ESP_FCP := 0;
          vVL_OR_E316 := 0;
          with FSpedF.Bloco_E.RegistroE310New do
          begin
            IND_MOV_DIFAL := mDifalSemOperacaoICMS;
            //registro 311
            vNivel4.Close;
            vNivel4.SQL.Text :=
              ' select * from SPED_F_ICMINTER_AJ' +
              ' where data_lanc >= :dataini and data_lanc <= :datafim' +
              ' and cod_empresa = :cod_empresa' +
              ' and uf = :uf' +
              ' order by data_lanc, seqid';
            vNivel4.ParamByName('dataini').AsDate := StrToDate(FDataIni);
            vNivel4.ParamByName('datafim').AsDate := StrToDate(FDataIni);
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
            vNivel4.ParamByName('uf').AsString := vNivel2.FieldByName('uf').AsString;
            vNivel4.Open;
            vNivel4.First;
            while not vNivel4.Eof do
            begin
              with FSpedF.Bloco_E.RegistroE311New do
              begin
                IND_MOV_DIFAL := mDifalComOperacaoICMS;
                COD_AJ_APUR := vNivel4.FieldByName('COD_AJ_APUR').AsString;
                DESCR_COMPL_AJ :=  vNivel4.FieldByName('DESCR_COMPL_AJ').AsString;
                VL_AJ_APUR :=  vNivel4.FieldByName('VL_AJ_APUR').AsFloat;

                //campo VL_OUT_DEB_DIFAL registro E310
                if (Copy(COD_AJ_APUR, 3, 1) = '2') then
                  if (Copy(COD_AJ_APUR, 4, 1) = '0') or (Copy(COD_AJ_APUR, 4, 1) = '1')  then
                    VL_OUT_DEB_DIFAL := VL_OUT_DEB_DIFAL + VL_AJ_APUR;

                //campo VL_OUT_CRED_DIFAL registro E310
                if (Copy(COD_AJ_APUR, 3, 1) = '2') then
                  if (Copy(COD_AJ_APUR, 4, 1) = '2') or (Copy(COD_AJ_APUR, 4, 1) = '3')  then
                    VL_OUT_CRED_DIFAL := VL_OUT_CRED_DIFAL + VL_AJ_APUR;

                //campo VL_DEDUCOES_DIFAL registro E310
                if (Copy(COD_AJ_APUR, 3, 1) = '2') then
                  if (Copy(COD_AJ_APUR, 4, 1) = '4')then
                    VL_DEDUCOES_DIFAL := VL_DEDUCOES_DIFAL + VL_AJ_APUR;

                //campo DEB_ESP_DIFAL registro E310
                if (Copy(COD_AJ_APUR, 3, 1) = '2') then
                  if (Copy(COD_AJ_APUR, 4, 1) = '5')then
                    DEB_ESP_DIFAL := DEB_ESP_DIFAL + VL_AJ_APUR;

                 if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao110 then
                 begin
                   // campos fcp 2017
                 
                  //campo VL_OUT_DEB_FCP registro E310
                  if (Copy(COD_AJ_APUR, 3, 1) = '3') then
                    if (Copy(COD_AJ_APUR, 4, 1) = '0') or (Copy(COD_AJ_APUR, 4, 1) = '1')  then
                      VL_OUT_DEB_FCP := VL_OUT_DEB_FCP + VL_AJ_APUR;

                  //campo VL_OUT_CRED_FCP registro E310
                  if (Copy(COD_AJ_APUR, 3, 1) = '3') then
                    if (Copy(COD_AJ_APUR, 4, 1) = '2') or (Copy(COD_AJ_APUR, 4, 1) = '3')  then
                      VL_OUT_CRED_FCP := VL_OUT_CRED_FCP + VL_AJ_APUR;

                  //campo VL_DEDUCOES_FCP registro E310
                  if (Copy(COD_AJ_APUR, 3, 1) = '3') then
                    if (Copy(COD_AJ_APUR, 4, 1) = '4')then
                      VL_DEDUCOES_FCP := VL_DEDUCOES_FCP + VL_AJ_APUR;

                  //campo DEB_ESP_FCP registro E310
                  if (Copy(COD_AJ_APUR, 3, 1) = '3') then
                    if (Copy(COD_AJ_APUR, 4, 1) = '5')then
                      DEB_ESP_FCP := DEB_ESP_FCP + VL_AJ_APUR;
                 end;

                // registro E312
                vNivel5.Close;
                vNivel5.SQL.Text :=
                  ' select * from SPED_F_ICMINTER_AJ_INF_AD' +
                  ' where seqid_aj = :seqid_aj' +
                  ' and cod_empresa = :cod_empresa' +
                  ' order by seqid';
                vNivel5.ParamByName('seqid_aj').AsInteger := vNivel4.FieldByName('seqid').AsInteger;
                vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
                vNivel5.Open;
                vNivel5.First;
                while not vNivel5.Eof do
                begin
                  with FSpedF.Bloco_E.RegistroE312New do
                  begin
                    NUM_DA := vNivel5.FieldByName('NUM_DA').AsString;
                    NUM_PROC := vNivel5.FieldByName('NUM_PROC').AsString;
                    IND_PROC := StrToOrigemProcesso(vNivel5.FieldByName('NUM_PROC').AsString);
                    PROC := vNivel5.FieldByName('PROC').AsString;
                    TXT_COMPL := vNivel5.FieldByName('TXT_COMPL').AsString;
                  end;
                  vNivel5.Next;
                end;

                //registro E313
                vNivel5.Close;
                vNivel5.SQL.Text :=
                  ' select sp.*, nf.modelo_nf, nf.serie, nf.subserie, nf.num_nf, nf.chave_nfe, nf.data_lanc,' +
                  ' nf.cod_cliente COD_PART, nfi.tipo_item, nfi.referencia unidade, nfi.grupo_prod, nfi.cod_prod, nfi.cod_servico,' +
                  ' nfi.nitem NUM_ITEM, nfi.chassi' +
                  ' from SPED_F_ICMINTER_AJ_INF_DOC sp' +
                  ' left join notafiscal nf on nf.cod_nf = sp.cod_nf and nf.cod_empresa = sp.cod_empresa' +
                  ' left join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa  and nfi.nitem = sp.nitem_nf' +
                  ' where sp.seqid_aj = :seqid_aj' +
                  ' and sp.cod_empresa = :cod_empresa' +
                  ' order by sp.seqid';
                vNivel5.ParamByName('seqid_aj').AsInteger := vNivel4.FieldByName('seqid').AsInteger;
                vNivel5.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
                vNivel5.Open;
                vNivel5.First;
                while not vNivel5.Eof do
                begin
                  with FSpedF.Bloco_E.RegistroE313New do
                  begin
                    COD_PART := vNivel5.FieldByName('COD_PART').AsString;
                    montaRegistro0150(vNivel5.FieldByName('COD_PART').AsString);
                    COD_MOD := vNivel5.FieldByName('modelo_nf').AsString;
                    SER := vNivel5.FieldByName('serie').AsString;
                    if StrToIntDef(vNivel5.FieldByName('subserie').AsString, -1) > 0  then
                      SUB := vNivel5.FieldByName('subserie').AsString;
                    NUM_DOC := vNivel5.FieldByName('num_nf').AsString;
                    CHV_DOCe := vNivel5.FieldByName('chave_nfe').AsString;
                    DT_DOC := vNivel5.FieldByName('data_lanc').AsDateTime;

                    UNID:= vNivel5.FieldByName('unidade').AsString;
                    if vNivel5.FieldByName('tipo_item').AsString = 'P' then
                    begin
                      COD_ITEM := 'P' + StrZero(vNivel5.FieldByName('grupo_prod').AsString +
                        Trim(vNivel5.FieldByName('cod_prod').AsString), 16);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        vNivel5.FieldByName('grupo_prod').AsInteger,
                        vNivel5.FieldByName('cod_prod').AsString, '', 0, '', UNID);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'S' then
                    begin
                      COD_ITEM := 'S' + StrZero(vNivel5.FieldByName('cod_servico').AsString, 16);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', '', vNivel5.FieldByName('cod_servico').AsInteger, '', UNID);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'V' then
                    begin
                      COD_ITEM := StrZero(vNivel5.FieldByName('chassi').AsString, 17);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', vNivel5.FieldByName('chassi').AsString,
                        0, '', UNID);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'O' then
                    begin
                      COD_ITEM := 'O' + StrZero(vNivel5.FieldByName('cod_nf').AsString, 7) +
                        StrZero(vNivel5.FieldByName('NUM_ITEM').AsString, 3);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', '', 0, ('O' +
                        StrZero(vNivel5.FieldByName('cod_nf').AsString, 7) +
                        StrZero(vNivel5.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                    end
                    else if vNivel5.FieldByName('tipo_item').AsString = 'D' then
                    begin
                      COD_ITEM := 'D' + StrZero(vNivel5.FieldByName('cod_nf').AsString, 7) +
                        StrZero(vNivel5.FieldByName('NUM_ITEM').AsString, 3);

                      gravaSpedItem(vNivel5.FieldByName('tipo_item').AsString,
                        0, '', '', 0, ('D' +
                        StrZero(vNivel5.FieldByName('cod_nf').AsString, 7) +
                        StrZero(vNivel5.FieldByName('NUM_ITEM').AsString, 3)), UNID);
                    end;
                    VL_AJ_ITEM := vNivel5.FieldByName('VL_AJ_ITEM').AsFloat;
                  end;
                  vNivel5.Next;
                end;

              end;
              vNivel4.Next;
            end;

            //registro 316
            vNivel4.Close;
            vNivel4.SQL.Text :=
              ' select * from SPED_F_ICMINTER_OB_DIFAL' +
              ' where data_lanc >= :dataini and data_lanc <= :datafim' +
              ' and cod_empresa = :cod_empresa' +
              ' and uf = :uf' +
              ' order by data_lanc, seqid';
            vNivel4.ParamByName('dataini').AsDate := StrToDate(FDataIni);
            vNivel4.ParamByName('datafim').AsDate := StrToDate(FDataFim);
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(CodEmpresa);
            vNivel4.ParamByName('uf').AsString := vNivel2.FieldByName('uf').AsString;
            vNivel4.Open;
            vNivel4.First;
            while not vNivel4.Eof do
            begin
              IND_MOV_DIFAL := mDifalComOperacaoICMS;
              with FSpedF.Bloco_E.RegistroE316New do
              begin
                COD_OR := vNivel4.FieldByName('COD_OR').AsString;
                VL_OR := vNivel4.FieldByName('VL_OR').AsFloat;
                DT_VCTO := vNivel4.FieldByName('DT_VCTO').AsDateTime;
                COD_REC := vNivel4.FieldByName('COD_REC').AsString;
                NUM_PROC := vNivel4.FieldByName('NUM_PROC').AsString;
                IND_PROC := StrToOrigemProcesso(vNivel4.FieldByName('IND_PROC').AsString);
                PROC := vNivel4.FieldByName('PROC').AsString;
                TXT_COMPL := vNivel4.FieldByName('TXT_COMPL').AsString;
                MES_REF := StrZero(vNivel4.FieldByName('mes_ref').AsString, 2) + vNivel4.FieldByName('ano_ref').AsString;
                vVL_OR_E316 := vVL_OR_E316 + VL_OR;
              end;
              vNivel4.Next;
            end;

            // dados do registro E310, montado a partir dos dados dos outros registros

            vUFEmp := FSpedF.Bloco_0.Registro0000.UF;
            for i100 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Count - 1 do
              for i101 := 0 to FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Count - 1 do
                if (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].IND_OPER = StrToTipoOperacao('1')) and
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT <> StrToCodSit('01')) and
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT <> StrToCodSit('07')) then
                begin
                  IND_MOV_DIFAL := mDifalComOperacaoICMS;
                  vUFPart := getSiglaUFParticipante(FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_PART);
                  // campos VL_TOT_DEBITOS_DIFAL e VL_TOT_DEB_FCP registro E310
                  if UF = vUFEmp then
                  begin
                    VL_TOT_DEBITOS_DIFAL := VL_TOT_DEBITOS_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_REM;
                    VL_TOT_DEB_FCP := VL_TOT_DEB_FCP + 0;
                  end
                  else if UF = vUFPart then
                  begin
                    VL_TOT_DEBITOS_DIFAL := VL_TOT_DEBITOS_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_DEST;
                    VL_TOT_DEB_FCP := VL_TOT_DEB_FCP + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_FCP_UF_DEST;
                  end;
                end
                else if (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].IND_OPER = StrToTipoOperacao('0')) then
                begin
                  IND_MOV_DIFAL := mDifalComOperacaoICMS;
                  // campos VL_TOT_CREDITOS_DIFAL e VL_TOT_CRED_FCP registro E310
                  vUFPart := getSiglaUFParticipante(FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_PART);
                  if UF = vUFEmp then
                  begin
                    VL_TOT_CREDITOS_DIFAL := VL_TOT_CREDITOS_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_DEST;
                    VL_TOT_CRED_FCP := VL_TOT_CRED_FCP + 0;
                  end
                  else if UF = vUFPart then
                  begin
                    VL_TOT_CREDITOS_DIFAL := VL_TOT_CREDITOS_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_REM;
                    VL_TOT_CRED_FCP := VL_TOT_CRED_FCP + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_FCP_UF_DEST;
                  end;
                end
                else if (StrToDate(FDataFim) <= StrToDate('31/01/2016')) and
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].IND_OPER = StrToTipoOperacao('1')) and
                  ((FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT = StrToCodSit('01')) or
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT = StrToCodSit('07'))) then
                begin
                  IND_MOV_DIFAL := mDifalComOperacaoICMS;
                  if UF = vUFEmp then
                    vDEB_ESP_DIFAL := vDEB_ESP_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_ICMS_UF_REM
                  else if UF = vUFPart then
                    vDEB_ESP_DIFAL := vDEB_ESP_DIFAL + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_FCP_UF_DEST;
                end
                else if (StrToDate(FDataFim) <= StrToDate('31/01/2017')) then
                begin
                  if UF = vUFEmp then
                    vDEB_ESP_FCP :=  0;
                end
                else if  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].IND_OPER = StrToTipoOperacao('1')) and
                  ((FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT = StrToCodSit('01')) or
                  (FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].COD_SIT = StrToCodSit('07'))) then
                begin
                  if UF <> vUFEmp then
                    vDEB_ESP_FCP := vDEB_ESP_FCP + FSpedF.Bloco_C.RegistroC001.RegistroC100.Items[i100].RegistroC101.Items[i101].VL_FCP_UF_DEST;
                end;

            //campo VL_SLD_DEV_ANT_DIFAL registro E310
            if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao110 then
              vrEquacao := (VL_TOT_DEBITOS_DIFAL + VL_OUT_DEB_DIFAL) -
                (VL_SLD_CRED_ANT_DIF + VL_TOT_CREDITOS_DIFAL + VL_OUT_CRED_DIFAL)
            else
            vrEquacao := (VL_TOT_DEBITOS_DIFAL + VL_OUT_DEB_DIFAL + VL_TOT_DEB_FCP) -
              (VL_SLD_CRED_ANT_DIF + VL_TOT_CREDITOS_DIFAL + VL_OUT_CRED_DIFAL + VL_TOT_CRED_FCP);

            if vrEquacao >= 0 then
              VL_SLD_DEV_ANT_DIFAL := vrEquacao
            else
              VL_SLD_DEV_ANT_DIFAL := 0;
            //campo VL_RECOL registro E310
            vrEquacao := (VL_SLD_DEV_ANT_DIFAL - VL_DEDUCOES_DIFAL);
            if vrEquacao >= 0 then
              VL_RECOL := vrEquacao
            else
              VL_RECOL := 0;
            //campo VL_SLD_CRED_TRANSPORTAR registro E310
            vrEquacao := (VL_SLD_CRED_ANT_DIF + VL_TOT_CREDITOS_DIFAL + VL_OUT_CRED_DIFAL+ VL_TOT_CRED_FCP) -
              (VL_TOT_DEBITOS_DIFAL + VL_OUT_DEB_DIFAL + VL_TOT_DEB_FCP);
            if vrEquacao > 0 then
              VL_SLD_CRED_TRANSPORTAR := vrEquacao
            else
              VL_SLD_CRED_TRANSPORTAR := 0;
            DEB_ESP_DIFAL := vDEB_ESP_DIFAL;
            // novos campos fcp 2017
            if FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao110 then
            begin
              //campo VL_SLD_DEV_ANT_FCP registro E310
              vrEquacao := (VL_TOT_DEB_FCP + VL_OUT_DEB_FCP) -
                (VL_SLD_CRED_ANT_FCP + VL_TOT_CRED_FCP + VL_OUT_CRED_FCP);
              if vrEquacao >= 0 then
                VL_SLD_DEV_ANT_FCP := vrEquacao
              else
                VL_SLD_DEV_ANT_FCP := 0;

              //campo VL_RECOL_FCP registro E310
              vrEquacao := (VL_SLD_DEV_ANT_FCP - VL_DEDUCOES_FCP);
              if vrEquacao >= 0 then
                VL_RECOL_FCP := vrEquacao
              else
                VL_RECOL_FCP := 0;

              vrEquacao := (VL_SLD_CRED_ANT_FCP + VL_TOT_CRED_FCP + VL_OUT_CRED_FCP) -
                (VL_TOT_DEB_FCP + VL_OUT_DEB_FCP);
              if vrEquacao > 0 then
                VL_SLD_CRED_TRANSPORTAR_FCP := vrEquacao
              else
                VL_SLD_CRED_TRANSPORTAR_FCP := 0;

              DEB_ESP_FCP := vDEB_ESP_FCP;
              //fim novos campos fcp 2017
            end;

            //aqui é feita a diferença para apresentar a tela ao usuário para lancamento da diferença
//            vVL_OR_E316 := (VL_RECOL + DEB_ESP_DIFAL) - vVL_OR_E316;
            if StrToFloatFormat(((VL_RECOL + DEB_ESP_DIFAL) - vVL_OR_E316), 2) > 0 then
            begin
              Application.CreateForm(TfrmDifE310eE316, frmDifE310eE316);
              frmDifE310eE316.Edit1.Text := UF;
              frmDifE310eE316.vrObrigacoes := (VL_RECOL + DEB_ESP_DIFAL) - vVL_OR_E316;
              frmDifE310eE316.lbE310.Caption := Format('%0.2n', [(VL_RECOL + DEB_ESP_DIFAL)]);
              frmDifE310eE316.lbE316.Caption := Format('%0.2n', [(vVL_OR_E316)]);
              frmDifE310eE316.vQrAud := vQrAux;

              if frmDifE310eE316.ShowModal = IDOK then
              begin
                with FSpedF.Bloco_E.RegistroE316New do
                begin
                  COD_OR := frmDifE310eE316.vE316.COD_OR;
                  VL_OR := frmDifE310eE316.vE316.VL_OR;
                  DT_VCTO := frmDifE310eE316.vE316.DT_VCTO;
                  COD_REC := frmDifE310eE316.vE316.COD_REC;
                  NUM_PROC := frmDifE310eE316.vE316.NUM_PROC;
                  IND_PROC := frmDifE310eE316.vE316.IND_PROC;
                  PROC := frmDifE310eE316.vE316.PROC;
                  TXT_COMPL := frmDifE310eE316.vE316.TXT_COMPL;
                  MES_REF := frmDifE310eE316.vE316.MES_REF;
                end;
              end;
              FreeAndNil(frmDifE310eE316.vE316);
              frmDifE310eE316.Free;
              frmDifE310eE316 := nil;
            end;
          end;//RegistroE310New
        end;//RegistroE300New
        vNivel2.Next;
      end;
    end;//  endif (FSpedF.Bloco_0.Registro0000.COD_VER >= vlVersao109)

    if (FSpedF.Bloco_0.Registro0000.IND_ATIV = atIndustrial) then
      with FSpedF.Bloco_E.RegistroE500New do
      begin
        IND_APUR := iaMensal;
        DT_INI := StrToDate(FDataIni);
        DT_FIN := StrToDate(FDataFim);

        with FSpedF.Bloco_E.RegistroE520New do
        begin
          VL_SD_ANT_IPI := 0;
          VL_DEB_IPI := 0;
          VL_CRED_IPI := 0;
          VL_OD_IPI := 0;
          VL_OC_IPI := 0;
          VL_SC_IPI := 0;
          VL_SD_IPI := 0;
        end;
      end;

  finally
  end;
end;

procedure TSpedFiscal.montarBlocoG;
var
  vSALDO_IN_ICMS, vSOM_PARC, vVL_TRIB_EXP, vVL_TOTAL, vSOM_ICMS_OC: Currency;
begin
  try
    vSALDO_IN_ICMS := 0;
    //vSALDO_FN_ICMS := 0;
    vSOM_PARC := 0;
    vVL_TRIB_EXP := 0;
    vVL_TOTAL := 0;
    //vIND_PER_SAI := 0;
    //vICMS_APROP := 0;
    vSOM_ICMS_OC := 0;
    FSpedF.Bloco_G.RegistroG001.IND_MOV := imSemDados;
    FLabelStatus.Caption := 'Montando registro G110';

    vNivel3.Close;
    vNivel3.SQL.Text := 'select mc.cod_ind_bem, mc.dt_mov, mc.tipo_mov,' +
      ' mc.vl_imob_icms_op, mc.vl_imob_icms_st, mc.vl_imob_icms_frt,' +
      ' mc.vl_imob_icms_dif, mc.num_parc, mc.vl_parc_pass,' +
      ' case when mc.emissao_propria = ''S'' then ''0''' +
      '     else ''1'' end IND_EMIT, mc.cod_cliente,mc.modelo_nf, mc.serie, mc.num_nf,' +
      ' mc.chv_nfe_cte, mc.data_doc, mc.num_item, mc.grupo_prod, mc.cod_prod' +
      ' from movimento_ciap mc' +
      ' where mc.dt_mov >= :dataIni and mc.dt_mov <= :dataFim and' +
      ' mc.cod_empresa = :cod_empresa';
    vNivel3.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
    vNivel3.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.Open;

    vNivel3.FetchAll;

    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;

    if vNivel3.RecordCount > 0 then
    begin
      FSpedF.Bloco_G.RegistroG001.IND_MOV := imComDados;
      with FSpedF.Bloco_G.RegistroG110New do
      begin
        vNivel3.First;
        while not vNivel3.Eof do
        begin
          Application.ProcessMessages;
          with FSpedF.Bloco_G.RegistroG125New do
          begin
            COD_IND_BEM := vNivel3.FieldByName('cod_ind_bem').AsString;
            montaRegistro0300(COD_IND_BEM);

            DT_MOV := vNivel3.FieldByName('DT_MOV').AsDateTime;
            TIPO_MOV := StrToMovimentoBens(vNivel3.FieldByName('TIPO_MOV').AsString);
            VL_IMOB_ICMS_OP := vNivel3.FieldByName('VL_IMOB_ICMS_OP').AsCurrency;
            VL_IMOB_ICMS_ST := vNivel3.FieldByName('VL_IMOB_ICMS_ST').AsCurrency;
            VL_IMOB_ICMS_FRT := vNivel3.FieldByName('VL_IMOB_ICMS_FRT').AsCurrency;
            VL_IMOB_ICMS_DIF := vNivel3.FieldByName('VL_IMOB_ICMS_DIF').AsCurrency;
            NUM_PARC := vNivel3.FieldByName('NUM_PARC').AsInteger;
            VL_PARC_PASS := vNivel3.FieldByName('VL_PARC_PASS').AsCurrency;
            if TIPO_MOV = mbcSI then
              vSALDO_IN_ICMS := vSALDO_IN_ICMS + (VL_IMOB_ICMS_OP + VL_IMOB_ICMS_ST +
                VL_IMOB_ICMS_FRT + VL_IMOB_ICMS_DIF);
            vSOM_PARC := vSOM_PARC + VL_PARC_PASS;

            if vNivel3.FieldByName('num_nf').AsInteger > 0 then
            begin
              with FSpedF.Bloco_G.RegistroG130New do
              begin
                IND_EMIT := StrToEmitente(vNivel3.FieldByName('IND_EMIT').AsString);
                montaRegistro0150(vNivel3.FieldByName('cod_cliente').AsString);
                COD_PART := Trim(vNivel3.FieldByName('cod_cliente').AsString);
                COD_MOD := Trim(vNivel3.FieldByName('modelo_nf').AsString);
                SERIE := Trim(vNivel3.FieldByName('serie').AsString);
                NUM_DOC := Trim(vNivel3.FieldByName('num_nf').AsString);
                CHV_NFE_CTE := Trim(vNivel3.FieldByName('chv_nfe_cte').AsString);
                DT_DOC := vNivel3.FieldByName('data_doc').AsDateTime;
              end; //with FSpedF.Bloco_G.RegistroG130New do

              with FSpedF.Bloco_G.RegistroG140New do
              begin
                NUM_ITEM := vNivel3.FieldByName('num_item').AsString;
                COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                  Trim(vNivel3.FieldByName('cod_prod').AsString), 16);

                vNivel5.Close;
                vNivel5.SQL.Text := 'select unidade from produtos where grupo_prod = ' +
                  vNivel3.FieldByName('grupo_prod').AsString +
                  ' and cod_prod = ' + QuotedStr(vNivel3.FieldByName('cod_prod').AsString) +
                  ' and cod_empresa = ' + FCodEmpresa;
                vNivel5.Open;

                gravaSpedItem('P',
                  vNivel3.FieldByName('grupo_prod').AsInteger,
                  vNivel3.FieldByName('cod_prod').AsString, '', 0, '',
                  UpperCase(Trim(vNivel5.FieldByName('unidade').AsString)));
              end; //with FSpedF.Bloco_G.RegistroG140New do
            end; //if vNivel3.FieldByName('num_nf').AsInteger > 0 then

            //VL_PARC_APROP
          end; //with FSpedF.Bloco_G.RegistroG125New do

          //Conclusao de Imobilizacao em andamento - Bem resultante
          //Aqui serao montados os IA que resultaram no CI
          if vNivel3.FieldByName('TIPO_MOV').AsString = 'CI' then
          begin
            vNivel4.Close;
            vNivel4.SQL.Text := 'select mc.cod_ind_bem, mc.dt_mov, mc.tipo_mov,' +
              ' mc.vl_imob_icms_op, mc.vl_imob_icms_st, mc.vl_imob_icms_frt,' +
              ' mc.vl_imob_icms_dif, mc.num_parc, mc.vl_parc_pass,' +
              ' case when mc.emissao_propria = ''S'' then ''0''' +
              '     else ''1'' end IND_EMIT, mc.cod_cliente,mc.modelo_nf, mc.serie, mc.num_nf,' +
              ' mc.chv_nfe_cte, mc.data_doc, mc.num_item, mc.grupo_prod, mc.cod_prod' +
              ' from movimento_ciap mc' +
              ' inner join equipamento eq on eq.cod_equip = mc.cod_ind_bem and' +
              ' eq.cod_empresa = mc.cod_empresa' +
              ' where eq.cod_prnc = :cod_prnc and mc.tipo_mov = :tipo_mov and' +
              ' mc.dt_mov < :dataIni and mc.cod_empresa = :cod_empresa';
            vNivel4.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
            vNivel4.ParamByName('cod_prnc').AsInteger :=
              vNivel3.FieldByName('cod_ind_bem').AsInteger;
            vNivel4.ParamByName('tipo_mov').AsString := 'IA';
            vNivel4.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
            vNivel4.Open;

            vNivel4.First;
            while not vNivel4.Eof do
            begin
              with FSpedF.Bloco_G.RegistroG125New do
              begin
                COD_IND_BEM := vNivel4.FieldByName('cod_ind_bem').AsString;
                montaRegistro0300(COD_IND_BEM);
                DT_MOV := vNivel4.FieldByName('DT_MOV').AsDateTime;
                TIPO_MOV := StrToMovimentoBens(vNivel4.FieldByName('TIPO_MOV').AsString);
                VL_IMOB_ICMS_OP := vNivel4.FieldByName('VL_IMOB_ICMS_OP').AsCurrency;
                VL_IMOB_ICMS_ST := vNivel4.FieldByName('VL_IMOB_ICMS_ST').AsCurrency;
                VL_IMOB_ICMS_FRT := vNivel4.FieldByName('VL_IMOB_ICMS_FRT').AsCurrency;
                VL_IMOB_ICMS_DIF := vNivel4.FieldByName('VL_IMOB_ICMS_DIF').AsCurrency;
                NUM_PARC := vNivel4.FieldByName('NUM_PARC').AsInteger;
                VL_PARC_PASS := vNivel4.FieldByName('VL_PARC_PASS').AsCurrency;
                if TIPO_MOV = mbcSI then
                  vSALDO_IN_ICMS := vSALDO_IN_ICMS + (VL_IMOB_ICMS_OP + VL_IMOB_ICMS_ST +
                    VL_IMOB_ICMS_FRT + VL_IMOB_ICMS_DIF);
                vSOM_PARC := vSOM_PARC + VL_PARC_PASS;

                if vNivel4.FieldByName('num_nf').AsInteger > 0 then
                begin
                  with FSpedF.Bloco_G.RegistroG130New do
                  begin
                    IND_EMIT := StrToEmitente(vNivel4.FieldByName('IND_EMIT').AsString);
                    montaRegistro0150(vNivel4.FieldByName('cod_cliente').AsString);
                    COD_PART := Trim(vNivel4.FieldByName('cod_cliente').AsString);
                    COD_MOD := Trim(vNivel4.FieldByName('modelo_nf').AsString);
                    SERIE := Trim(vNivel4.FieldByName('serie').AsString);
                    NUM_DOC := Trim(vNivel4.FieldByName('num_nf').AsString);
                    CHV_NFE_CTE := Trim(vNivel4.FieldByName('chv_nfe_cte').AsString);
                    DT_DOC := vNivel4.FieldByName('data_doc').AsDateTime;
                  end; //with FSpedF.Bloco_G.RegistroG130New do

                  with FSpedF.Bloco_G.RegistroG140New do
                  begin
                    NUM_ITEM := vNivel4.FieldByName('num_item').AsString;
                    COD_ITEM := 'P' + StrZero(vNivel4.FieldByName('grupo_prod').AsString +
                      Trim(vNivel4.FieldByName('cod_prod').AsString), 16);

                    vNivel5.Close;
                    vNivel5.SQL.Text := 'select unidade from produtos where grupo_prod = ' +
                      vNivel4.FieldByName('grupo_prod').AsString +
                      ' and cod_prod = ' + QuotedStr(vNivel4.FieldByName('cod_prod').AsString) +
                      ' and cod_empresa = ' + FCodEmpresa;
                    vNivel5.Open;

                    gravaSpedItem('P',
                      vNivel4.FieldByName('grupo_prod').AsInteger,
                      vNivel4.FieldByName('cod_prod').AsString, '', 0, '',
                      UpperCase(Trim(vNivel5.FieldByName('unidade').AsString)));
                  end; //with FSpedF.Bloco_G.RegistroG140New do
                end; //if vNivel4.FieldByName('num_nf').AsInteger > 0 then

              end; //with FSpedF.Bloco_G.RegistroG125New do
              vNivel4.Next;
            end; //while not vNivel4.Eof do

          end;
          vNivel3.Next;
          FProgressBar.Position := FProgressBar.Position + 1;
        end;

        vNivel2.Close;
        vNivel2.SQL.Text := 'select * from valores_ciap where cod_empresa = ' + FCodEmpresa +
          ' and mes = :mes and ano = :ano';
        vNivel2.ParamByName('mes').AsInteger := StrToInt(Trim(copy(FDataIni, 4, 2))); ;
        vNivel2.ParamByName('ano').AsInteger := StrToInt(Trim(copy(FDataIni, 7, 4)));
        vNivel2.Open;
        vVL_TRIB_EXP := vNivel2.FieldByName('VL_TRIB_EXP').AsCurrency;
        vVL_TOTAL := vNivel2.FieldByName('VL_TOTAL').AsCurrency;

        //DT_INI := StrToDate(FDataIni);
        //DT_FIN := StrToDate(FDataFim);
        //MODO_CIAP
        SALDO_IN_ICMS := vSALDO_IN_ICMS;
        //SALDO_FN_ICMS:=vSALDO_FN_ICMS;
        SOM_PARC := vSOM_PARC;
        VL_TRIB_EXP := vVL_TRIB_EXP;
        VL_TOTAL := vVL_TOTAL;
        try
          if VL_TOTAL > 0 then
            IND_PER_SAI := VL_TRIB_EXP / VL_TOTAL
          else
            IND_PER_SAI := 0;
        except
        end;
        ICMS_APROP := SOM_PARC * IND_PER_SAI;
        SOM_ICMS_OC := vSOM_ICMS_OC;
      end;
    end;

  finally
    vNivel2.Close;
    vNivel3.Close;
    vNivel4.Close;
    vNivel5.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoH;
const
  tipos: array[1..4] of string = ('02', '03', '04', '05');
var
  vCurrencyTemp: Currency;
  I: Integer;
begin
  try
    FSpedF.Bloco_H.RegistroH001New.IND_MOV := imSemDados;
    FLabelStatus.Caption := 'Montando registro H010 - Inventário - Motivo 01';

    if fH005GerarMotivo01 then
    begin
    vNivel3.Close;
    vNivel3.SQL.Text := 'select case when not i.chassi_mt is null then ''V''' +
      ' else ''P''' +
      ' end tipo_item, i.grupo_prod, i.cod_prod, i.chassi_mt chassi, p.unidade unid, i.quantidade QTD, i.valor_prod VL_ITEM,' +
      ' i.inscr_posse IND_PROP, '''' COD_PART, '''' TXT_COMPL, p.cod_cta_estoque COD_CTA from inv_tipo74 i' +
      ' left join produtos p on p.grupo_prod = i.grupo_prod and p.cod_prod = i.cod_prod and' +
      ' p.cod_empresa = i.cod_empresa where i.data_inv = :DataInv and i.cod_empresa = :cod_empresa';
    vNivel3.ParamByName('datainv').AsDate := StrToDate(FDataInv);
    vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
    vNivel3.Open;

    if vNivel3.IsEmpty then
    begin
      {
      vNivel3.Close;
      vNivel3.SQL.Text := 'select ''P'' tipo_item, p.grupo_prod, p.cod_prod, '''' chassi, p.unidade unid, (p.est_f + p.est_r) QTD,' +
        ' p.prec_cusm_prod VL_ITEM, ''00000000000000'' IND_PROP, '''' COD_PART, '''' TXT_COMPL, p.COD_CTA_ESTOQUE COD_CTA' +
        ' from  produtos p where p.cod_empresa = :cod_empresa and p.ativo = 1 and (p.est_f + p.est_r) > 0' +
        ' union' +
        ' select ''V'' tipo_item, 0, '''', e.chassi_c chassi, ''UN'' unid, 1 qtd,' +
        ' (select first 1 v4.custo from comprasmesesv4 v4 where v4.chassi = e.chassi_c and' +
        ' v4.cod_empresa = e.cod_empresa order by v4.data_ch_nota) VL_ITEM , ''00000000000000'' IND_PROP,' +
        ' '''' COD_PART, '''' TXT_COMPL, ''001'' COD_CTA' +
        ' from est_moto e' +
        ' inner join comprasmesesv4 v4 on v4.chassi = e.chassi_c and v4.cod_empresa = e.cod_empresa';
      vNivel3.Open;
      }
    end;

    vNivel3.FetchAll;

    FProgressBar.Position := 0;
    FProgressBar.Min := 0;
    FProgressBar.Max := vNivel3.RecordCount;

    vCurrencyTemp := 0;
    if vNivel3.RecordCount > 0 then
    begin
      FSpedF.Bloco_H.RegistroH001.IND_MOV := imComDados;
      with FSpedF.Bloco_H.RegistroH005New do
      begin
        vNivel3.First;
        while not vNivel3.Eof do
        begin
          Application.ProcessMessages;
          with FSpedF.Bloco_H.RegistroH010New do
          begin
//            UNID := getUnidade(vNivel3.FieldByName('tipo_item').AsString,
//                vNivel3.FieldByName('grupo_prod').AsInteger,
//                vNivel3.FieldByName('cod_prod').AsString,
//                vNivel3.FieldByName('chassi').AsString,
//                0, '');
//            if Trim(UNID) = '' then
            UNID := UpperCase(Trim(vNivel3.FieldByName('UNID').AsString));
            if Trim(UNID) = 'OCA' then
              Application.MessageBox('OCA', '', 0 + 64);

            if Trim(UNID) = '' then
              UNID := 'UN';
            if vNivel3.FieldByName('tipo_item').AsString = 'P' then
            begin
              COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                Trim(vNivel3.FieldByName('cod_prod').AsString), 16);

              gravaSpedItem(Trim(vNivel3.FieldByName('tipo_item').AsString),
                vNivel3.FieldByName('grupo_prod').AsInteger,
                Trim(vNivel3.FieldByName('cod_prod').AsString), '', 0, '', UNID);
            end
            else if vNivel3.FieldByName('tipo_item').AsString = 'V' then
            begin
              COD_ITEM := StrZero(vNivel3.FieldByName('chassi').AsString, 17);

              gravaSpedItem(Trim(vNivel3.FieldByName('tipo_item').AsString),
                0, '', Trim(vNivel3.FieldByName('chassi').AsString),
                0, '', UNID);

              vQrAux.Close;
              vQrAux.SQL.Text := 'select ''N'' tipo, em.versaoest versao from est_moto em' +
                ' where em.chassi_c = :chassi and em.cod_empresa = :cod_empresa' +
                ' union' +
                ' select ''T'' tipo, td.versaov versao from transf_dep td' +
                ' where td.chassiv = :chassi and td.cod_empresa = :cod_empresa' +
                ' union' +
                ' select ''U'' tipo, mu.versao_us versao from mtusadas mu' +
                ' where mu.chassi_us = :chassi and mu.cod_empresa = :cod_empresa';
              vQrAux.ParamByName('chassi').AsString := Trim(vNivel3.FieldByName('chassi').AsString);
              vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
              vQrAux.Open;

              if Trim(vQrAux.FieldByName('tipo').AsString) <> '' then
              begin
                vQrAux1.Close;
                vQrAux1.SQL.Text := 'select COD_CTA_EST_VEIC, COD_CTA_EST_SEMI from TIPMODELO' +
                  ' where codigo = :codigo and cod_empresa = :cod_empresa';
                vQrAux1.ParamByName('codigo').AsInteger := vQrAux.FieldByName('versao').AsInteger;
                vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vQrAux1.Open;
                if Trim(vQrAux.FieldByName('tipo').AsString) <> 'U' then
                  COD_CTA := Trim(vQrAux1.FieldByName('COD_CTA_EST_VEIC').AsString)
                else
                  COD_CTA := Trim(vQrAux1.FieldByName('COD_CTA_EST_SEMI').AsString);
              end;
            end;
            QTD := vNivel3.FieldByName('QTD').AsCurrency;
            VL_UNIT := StrToFloatFormat(vNivel3.FieldByName('VL_ITEM').AsCurrency,6);
            VL_ITEM := StrToFloatFormat(VL_UNIT * QTD,2);
            IND_PROP := piInformante;
            COD_PART := Trim(vNivel3.FieldByName('COD_PART').AsString);
            TXT_COMPL := Trim(vNivel3.FieldByName('TXT_COMPL').AsString);
            if Trim(COD_CTA) <> '' then
            else if Trim(vNivel3.FieldByName('COD_CTA').AsString) <> '' then
              COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString)
            else
              COD_CTA := '001';
            vCurrencyTemp := vCurrencyTemp + VL_ITEM;
          end;
          vNivel3.Next;
          FProgressBar.Position := FProgressBar.Position + 1;
        end;
        DT_INV := StrToDate(FDataInv);
        VL_INV := vCurrencyTemp;
      end;
    end;
    end;

    for I := 1 to Length(tipos) do
    begin
      FLabelStatus.Caption := 'Montando registro H010 - Inventário - Motivo ' + tipos[i];

      vNivel3.Close;
      vNivel3.SQL.Text := 'select case when not i.chassi_mt is null then ''V''' +
        ' else ''P''' +
        ' end tipo_item, i.grupo_prod, i.cod_prod, i.chassi_mt chassi, p.unidade unid, i.quantidade QTD, i.valor_prod VL_ITEM,' +
        ' i.inscr_posse IND_PROP, '''' COD_PART, '''' TXT_COMPL, p.cod_cta_estoque COD_CTA,' +
        ' iv.h020_cst, iv.h020_bc_icms, iv.h020_vl_icms' +
        ' from inv_tipo74 i' +
        ' left join inv_tipo74_sped_sint iv on iv.data_inv = i.data_inv and iv.cod_empresa = i.cod_empresa and iv.grupo_prod = i.grupo_prod and iv.cod_prod = i.cod_prod' +
        ' left join produtos p on p.grupo_prod = i.grupo_prod and p.cod_prod = i.cod_prod and' +
        ' p.cod_empresa = i.cod_empresa where i.data_inv = :DataInv and i.cod_empresa = :cod_empresa' +
        ' and iv.tp_arq_fiscal like ' + QuotedStr('%|' + tipos[I] + '|%');
      vNivel3.ParamByName('datainv').AsDate := StrToDate(FDataInv);
      vNivel3.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vNivel3.Open;

      vNivel3.FetchAll;

      FProgressBar.Position := 0;
      FProgressBar.Min := 0;
      FProgressBar.Max := vNivel3.RecordCount;

      vCurrencyTemp := 0;
      if vNivel3.RecordCount > 0 then
      begin
        FSpedF.Bloco_H.RegistroH001.IND_MOV := imComDados;
        with FSpedF.Bloco_H.RegistroH005New do
        begin
          vNivel3.First;
          while not vNivel3.Eof do
          begin
            Application.ProcessMessages;
            if vNivel3.FieldByName('VL_ITEM').AsCurrency > 0 then            
            with FSpedF.Bloco_H.RegistroH010New do
            begin
              if Trim(UNID) = '' then
                UNID := UpperCase(Trim(vNivel3.FieldByName('UNID').AsString));
              if Trim(UNID) = '' then
                UNID := 'UN';
              if vNivel3.FieldByName('tipo_item').AsString = 'P' then
              begin
                COD_ITEM := 'P' + StrZero(vNivel3.FieldByName('grupo_prod').AsString +
                  Trim(vNivel3.FieldByName('cod_prod').AsString), 16);

                gravaSpedItem(Trim(vNivel3.FieldByName('tipo_item').AsString),
                  vNivel3.FieldByName('grupo_prod').AsInteger,
                  Trim(vNivel3.FieldByName('cod_prod').AsString), '', 0, '', UNID);
              end
              else if vNivel3.FieldByName('tipo_item').AsString = 'V' then
              begin
                COD_ITEM := StrZero(vNivel3.FieldByName('chassi').AsString, 17);

                gravaSpedItem(Trim(vNivel3.FieldByName('tipo_item').AsString),
                  0, '', Trim(vNivel3.FieldByName('chassi').AsString),
                  0, '', UNID);

                vQrAux.Close;
                vQrAux.SQL.Text := 'select ''N'' tipo, em.versaoest versao from est_moto em' +
                  ' where em.chassi_c = :chassi and em.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''T'' tipo, td.versaov versao from transf_dep td' +
                  ' where td.chassiv = :chassi and td.cod_empresa = :cod_empresa' +
                  ' union' +
                  ' select ''U'' tipo, mu.versao_us versao from mtusadas mu' +
                  ' where mu.chassi_us = :chassi and mu.cod_empresa = :cod_empresa';
                vQrAux.ParamByName('chassi').AsString := Trim(vNivel3.FieldByName('chassi').AsString);
                vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                vQrAux.Open;

                if Trim(vQrAux.FieldByName('tipo').AsString) <> '' then
                begin
                  vQrAux1.Close;
                  vQrAux1.SQL.Text := 'select COD_CTA_EST_VEIC, COD_CTA_EST_SEMI from TIPMODELO' +
                    ' where codigo = :codigo and cod_empresa = :cod_empresa';
                  vQrAux1.ParamByName('codigo').AsInteger := vQrAux.FieldByName('versao').AsInteger;
                  vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
                  vQrAux1.Open;
                  if Trim(vQrAux.FieldByName('tipo').AsString) <> 'U' then
                    COD_CTA := Trim(vQrAux1.FieldByName('COD_CTA_EST_VEIC').AsString)
                  else
                    COD_CTA := Trim(vQrAux1.FieldByName('COD_CTA_EST_SEMI').AsString);
                end;
              end;
              QTD := vNivel3.FieldByName('QTD').AsCurrency;
              VL_UNIT := StrToFloatFormat(vNivel3.FieldByName('VL_ITEM').AsCurrency,6);
              VL_ITEM := StrToFloatFormat(VL_UNIT * QTD,2);
              IND_PROP := piInformante;
              COD_PART := Trim(vNivel3.FieldByName('COD_PART').AsString);
              TXT_COMPL := Trim(vNivel3.FieldByName('TXT_COMPL').AsString);
              if Trim(COD_CTA) <> '' then
              else if Trim(vNivel3.FieldByName('COD_CTA').AsString) <> '' then
                COD_CTA := Trim(vNivel3.FieldByName('COD_CTA').AsString)
              else
                COD_CTA := '001';
              vCurrencyTemp := vCurrencyTemp + VL_ITEM;

              if (vCurrencyTemp > 0) then
                if (Trim(vNivel3.FieldByName('h020_cst').AsString) <> '') or
                  (vNivel3.FieldByName('h020_bc_icms').AsFloat > 0) or
                  (vNivel3.FieldByName('h020_vl_icms').AsFloat > 0) then
                begin
                  with FSpedF.Bloco_H.RegistroH020New do
                  begin
                    CST_ICMS := Trim(vNivel3.FieldByName('h020_cst').AsString);
                    BC_ICMS := vNivel3.FieldByName('h020_bc_icms').AsFloat;
                    VL_ICMS := vNivel3.FieldByName('h020_vl_icms').AsFloat;
                  end;
                end;
            end;
            vNivel3.Next;
            FProgressBar.Position := FProgressBar.Position + 1;
          end;
          DT_INV := StrToDate(FDataInv);
          VL_INV := vCurrencyTemp;
          MOT_INV := StrToMotInv(tipos[I])
        end;
      end;
    end;
  finally
    vNivel3.Close;
  end;
end;

procedure TSpedFiscal.montarBlocoK;
begin
  try
    FSpedF.Bloco_K.RegistroK001New.IND_MOV := imSemDados;
  finally

  end;
end;

//procedure TSpedFiscal.montaRegistro0150(pCOD_PART: string);
//var
//  I: Integer;
//begin
//  for I := 0 to FParticipantes.Count - 1 do
//    if copy(FParticipantes[I], 1, pos('|', FParticipantes[I]) - 1) = pCOD_PART then
//      exit;
//
//  vQrAux.close;
//  if pos('T', pCOD_PART) > 0 then
//  begin
//    vQrAux.SQL.Text := 'select ''T''||tr.codigo_tr COD_PART, tr.nome_tr NOME, ''1058'' cod_pais,' +
//      ' tr.cnpj_tr CNPJ, null CPF, tr.ie_tr IE, cd.ibge_cod_cidade COD_MUN, '''' suframa,' +
//      ' tr.end_tr "END", ''''  NUM, '''' COMPL, '''' BAIRRO' +
//      ' from transportador tr' +
//      ' left join cidades cd on cd.nome_cidade = tr.municipio_tr' +
//      ' where tr.cod_empresa = :cod_empresa and tr.codigo_tr = :participante';
//    vQrAux.ParamByName('participante').AsString := copy(pCOD_PART, 2, Length(pCOD_PART));
//  end
//  else
//  begin
//    vQrAux.SQL.Text := 'select cl.cod_cliente COD_PART, cl.nome_cliente NOME, ''1058'' cod_pais,' +
//      ' cl.cpfcgc CNPJ,cl.cpfcgc CPF, cl.insc_est IE, cd.ibge_cod_cidade COD_MUN,' +
//      ' null suframa, cl.endereco "END", cl.num_end_cliente NUM, cl.complemento COMPL,' +
//      ' cl.bairro from clientes cl' +
//      ' left join cidades cd on cd.cod_cidade = cl.cod_cidade' +
//      ' where cl.cod_empresa = :cod_empresa and cl.cod_cliente = :participante';
//    vQrAux.ParamByName('participante').AsString := pCOD_PART;
//  end;
//  vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//  vQrAux.Open;
//  if not vQrAux.IsEmpty then
//  begin
//    with FSpedF.Bloco_0.Registro0150New do
//    begin
//      COD_PART := vQrAux.FieldByName('COD_PART').AsString;
//      NOME := Trim(vQrAux.FieldByName('NOME').AsString);
//      COD_PAIS := vQrAux.FieldByName('COD_PAIS').AsString;
//      if length(Trim(vQrAux.FieldByName('CNPJ').AsString)) = 14 then
//        CNPJ := Trim(vQrAux.FieldByName('CNPJ').AsString)
//      else if length(Trim(vQrAux.FieldByName('CPF').AsString)) = 11 then
//        CPF := Trim(vQrAux.FieldByName('CPF').AsString)
//      else
//      begin
//        CNPJ := '';
//        CPF := '';
//      end;
//      if Trim(vQrAux.FieldByName('IE').AsString) <> 'ISENTO' then
//        IE := Trim(vQrAux.FieldByName('IE').AsString);
//      if vQrAux.FieldByName('COD_MUN').AsString <> '' then
//        COD_MUN := vQrAux.FieldByName('COD_MUN').AsInteger;
//      SUFRAMA := Trim(vQrAux.FieldByName('SUFRAMA').AsString);
//      ENDERECO := Trim(vQrAux.FieldByName('END').AsString);
//      NUM := Trim(vQrAux.FieldByName('NUM').AsString);
//      COMPL := Trim(vQrAux.FieldByName('COMPL').AsString);
//      BAIRRO := Trim(vQrAux.FieldByName('BAIRRO').AsString);
//      FParticipantes.Add(COD_PART + '|' + copy(vQrAux.FieldByName('COD_MUN').AsString, 1, 2));
//    end;
//  end;
//end;

//procedure TSpedFiscal.montaRegistro0190(pUNID: string);
//var
//  I: Integer;
//  vDescricao: string;
//begin
//  for I := 0 to F0190.Count - 1 do
//    if Trim(F0190[I]) = Trim(pUNID) then
//      exit;
//  if UpperCase(Trim(pUNID)) = 'UN' then
//    vDescricao := 'UNIDADES'
//  else if UpperCase(Trim(pUNID)) = 'UNI' then
//    vDescricao := 'UNIDADES'
//  else if UpperCase(Trim(pUNID)) = 'PC' then
//    vDescricao := 'PECAS'
//  else if UpperCase(Trim(pUNID)) = 'PCA' then
//    vDescricao := 'PECAS'
//  else if UpperCase(Trim(pUNID)) = 'KG' then
//    vDescricao := 'KILOS'
//  else if UpperCase(Trim(pUNID)) = 'CX' then
//    vDescricao := 'CAIXAS'
//  else if UpperCase(Trim(pUNID)) = 'CXA' then
//    vDescricao := 'CAIXAS'
//  else if UpperCase(Trim(pUNID)) = 'LT' then
//    vDescricao := 'LITROS'
//  else if UpperCase(Trim(pUNID)) = 'LTR' then
//    vDescricao := 'LITROS'
//  else if UpperCase(Trim(pUNID)) = 'PÇ' then
//    vDescricao := 'PECAS'
//  else if UpperCase(Trim(pUNID)) = 'PÇA' then
//    vDescricao := 'PECAS'
//  else
//    vDescricao := Trim(pUNID)+'1';
//  with FSpedF.Bloco_0.Registro0190New do
//  begin
//    UNID := UpperCase(Trim(pUNID));
//    DESCR := Trim(vDescricao);
//    F0190.Add(UpperCase(pUNID));
//  end;
//end;

//procedure TSpedFiscal.montaRegistro0190e0200;
//var
//  vTemp, vTipoItem: string;
//  lista: TMemo;
//  I: integer;
//begin
//  FLabelStatus.Caption := 'Montando registro 0190 e 0200 - Produtos';
//  try
//    {vQrAux.Close;
//    vQrAux.SQL.Text := 'select si.unid,' +
//      ' case when si.unid = ''UN'' then ''UNIDADES''' +
//      '     when si.unid = ''UNI'' then ''UNIDADES''' +
//      '     when si.unid = ''PC'' then ''PECAS''' +
//      '     when si.unid = ''PCA'' then ''PECAS''' +
//      '     when si.unid = ''KG'' then ''KILOS''' +
//      '     when si.unid = ''CX'' then ''CAIXAS''' +
//      '     when si.unid = ''CXA'' then ''CAIXAS''' +
//      '     when si.unid = ''LTR'' then ''LITROS''' +
//      '     when si.unid = ''PÇ'' then ''PEÇA''' +
//      '     when si.unid = ''PÇA'' then ''PEÇA''' +
//      //    '     when si.unid = ''BT'' then ''LITROS''' +
//    '     else si.unid||''1''' +
//      ' end descr, count(si.unid)' +
//      ' from sped_item si where si.cod_empresa = :cod_empresa and si.unid <> ''''' +
//      ' group by 1,2';
//    vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//    vQrAux.Open;
//    vQrAux.FetchAll;
//
//    FProgressBar.Position := 0;
//    FProgressBar.Min := 0;
//    FProgressBar.Max := vQrAux.RecordCount;
//
//    vQrAux.First;
//    while not vQrAux.Eof do
//    begin
//      Application.ProcessMessages;
//      with FSpedF.Bloco_0.Registro0190New do
//      begin
//        UNID := Trim(vQrAux.FieldByName('unid').AsString);
//        DESCR := Trim(vQrAux.FieldByName('descr').AsString);
//      end;
//      vQrAux.Next;
//      FProgressBar.Position := FProgressBar.Position + 1;
//    end;                                 }
//
//    vQrAux.Close;
//    vQrAux.SQL.Text := 'select si.tipo, si.grupo_prod, si.cod_prod, si.chassi,  si.cod_servico,' +
//      ' si.cod_outras, p.descr_prod DESCR_ITEM, p.num_fab_prod COD_BARRA,' +
//      ' NULL COD_ANT_ITEM, p.unidade UNID_INV,' +
//      ' case when p.consumo = ''S'' then ''07'' ' +
//      '     when ((p.tipo_item is null) or (p.tipo_item = '''')) then ''00''' +
//      '     else p.tipo_item' +
//      ' end tipo_item, p.nbm COD_NCM, null EX_IPI,' +
//      ' substring(p.nbm from 1 for 2) COD_GEN, null COD_LST, P.icm_prod ALIQ_ICMS  from sped_item si' +
//      ' inner join produtos p on p.grupo_prod = si.grupo_prod and' +
//      ' p.cod_prod = si.cod_prod and p.cod_empresa = si.cod_empresa' +
//      ' where si.tipo = ''P'' and si.cod_Empresa = ' + FCodEmpresa +
//      ' union' +
//      ' select si.tipo, si.grupo_prod, si.cod_prod, si.chassi,  si.cod_servico,' +
//      ' si.cod_outras, ts.desc_servico DESCR_ITEM, cast(ts.cod_servico as varchar(20))' +
//      ' COD_BARRA, NULL COD_ANT_ITEM, ''UN'' UNID_INV, ''09'' tipo_item, ''00'' COD_NCM,' +
//      ' null EX_IPI, ''00'' COD_GEN, ts.cod_serv_leicomplementar_166 COD_LST,' +
//      ' 0 ALIQ_ICMS from sped_item si' +
//      ' inner join tipo_servico ts on ts.cod_servico = si.cod_servico' +
//      ' where si.tipo = ''S'' and si.cod_Empresa = ' + FCodEmpresa +
//      ' union' +
//      ' select si.tipo, si.grupo_prod, si.cod_prod, si.chassi,  si.cod_servico,' +
//      ' si.cod_outras, null DESCR_ITEM, si.chassi COD_BARRA, NULL COD_ANT_ITEM,' +
//      ' si.unid UNID_INV, null tipo_item, null COD_NCM,' +
//      ' null EX_IPI, null COD_GEN, null COD_LST, 0 ALIQ_ICMS from sped_item si' +
//      ' where si.tipo = ''V'' or si.tipo = ''O'' or si.tipo = ''D''' +
//      '  and si.cod_Empresa = ' + FCodEmpresa +' order by 1';
//    vQrAux.Open;
//    vQrAux.FetchAll;
//
//    FProgressBar.Position := 0;
//    FProgressBar.Min := 0;
//    FProgressBar.Max := vQrAux.RecordCount;
//
//    vQrAux.First;
//
//    while not vQrAux.Eof do
//    begin
//      Application.ProcessMessages;
//      with FSpedF.Bloco_0.Registro0200New do
//      begin
//        if vQrAux.FieldByName('tipo').AsString = 'P' then
//          COD_ITEM := 'P' + StrZero(vQrAux.FieldByName('grupo_prod').AsString +
//            Trim(vQrAux.FieldByName('cod_prod').AsString), 16)
//        else if vQrAux.FieldByName('tipo').AsString = 'S' then
//          COD_ITEM := 'S' + StrZero(vQrAux.FieldByName('cod_servico').AsString, 16)
//        else if vQrAux.FieldByName('tipo').AsString = 'V' then
//          COD_ITEM := StrZero(vQrAux.FieldByName('chassi').AsString, 17)
//        else if vQrAux.FieldByName('tipo').AsString = 'O' then
//          COD_ITEM := vQrAux.FieldByName('cod_outras').AsString
//        else if vQrAux.FieldByName('tipo').AsString = 'D' then
//          COD_ITEM := vQrAux.FieldByName('cod_outras').AsString;
//        if vQrAux.FieldByName('tipo').AsString = 'V' then
//        begin
//          vQrAux1.Close;
//          vQrAux1.SQL.Text := 'select first 1 tm.descricao DESCR_ITEM,' +
//            ' case when ((nfv.tipo_item is null) or (nfv.tipo_item = '''')) then ''00''' +
//            ' else nfv.tipo_item' +
//            ' end tipo_item, tm.ncmsh COD_NCM,' +
//            ' substring(tm.ncmsh from 1 for 2) COD_GEN, 0 aliq_icms' +
//            ' from notafiscal_item_veiculo nfv' +
//            ' inner join tipmodelo tm on tm.codigo = nfv.versao and tm.cod_empresa =' +
//            ' nfv.cod_empresa' +
//            ' where nfv.chassi = :chassi and nfv.cod_empresa = :cod_empresa';
//          vQrAux1.ParamByName('chassi').AsString := Trim(vQrAux.FieldByName('chassi').AsString);
//          vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//          vQrAux1.Open;
//          if Trim(vQrAux1.FieldByName('DESCR_ITEM').AsString) = '' then
//          begin
//            vQrAux1.Close;
//            vQrAux1.SQL.Text :=
//              'select first 1 tm.descricao DESCR_ITEM, ''00'' tipo_item, tm.ncmsh COD_NCM,' +
//              ' substring(tm.ncmsh from 1 for 2) COD_GEN, 0 aliq_icms' +
//              ' from ent_moto_itens nfv' +
//              ' inner join tipmodelo tm on tm.codigo = nfv.versao and tm.cod_empresa =' +
//              ' nfv.cod_empresa' +
//              ' where nfv.chassi_c = :chassi and nfv.cod_empresa = :cod_empresa';
//            vQrAux1.ParamByName('chassi').AsString := Trim(vQrAux.FieldByName('chassi').AsString);
//            vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//            vQrAux1.Open;
//          end;
//          DESCR_ITEM := Trim(vQrAux1.FieldByName('DESCR_ITEM').AsString);
//          COD_BARRA := Trim(vQrAux.FieldByName('COD_BARRA').AsString);
//          COD_ANT_ITEM := '';
//          UNID_INV := UpperCase(Trim(vQrAux.FieldByName('UNID_INV').AsString));
//          vTipoItem := vQrAux1.FieldByName('TIPO_ITEM').AsString;
//          COD_NCM := Trim(vQrAux1.FieldByName('COD_NCM').AsString);
//          EX_IPI := Trim(vQrAux.FieldByName('EX_IPI').AsString);
//          COD_GEN := Trim(vQrAux1.FieldByName('COD_GEN').AsString);
//          COD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString);
//          ALIQ_ICMS := vQrAux1.FieldByName('ALIQ_ICMS').AsCurrency;
//          vQrAux1.Close;
//        end
//        else if (vQrAux.FieldByName('tipo').AsString = 'O') or (vQrAux.FieldByName('tipo').AsString
//          =
//          'D') then
//        begin
//          vQrAux1.Close;
//          vQrAux1.SQL.Text :=
//            'select first 1 nfi.descricao_item_outras, nfi.descricao_item, ''99'' tipo_item,' +
//            ' nfi.ncm COD_NCM, substring(nfi.ncm from 1 for 2) COD_GEN, nfi.aliq_icm aliq_icms,' +
//            ' nfi.num_fab_prod from notafiscal_item nfi' +
//            ' where nfi.cod_nf = :cod_nf and nfi.nitem = :nitem and nfi.cod_empresa = :cod_empresa';
//          vQrAux1.ParamByName('cod_nf').AsInteger :=
//            StrToInt(copy(vQrAux.FieldByName('cod_outras').AsString, 2, 7));
//          vQrAux1.ParamByName('nitem').AsInteger :=
//            StrToInt(copy(vQrAux.FieldByName('cod_outras').AsString, 9, 3));
//          vQrAux1.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//          vQrAux1.Open;
//          if (vQrAux.FieldByName('tipo').AsString = 'O') then
//            DESCR_ITEM :=
//              Trim(getCampoBlobString(vQrAux1.FieldByName('descricao_item_outras').AsString))
//          else
//            DESCR_ITEM := Trim(getCampoBlobString(vQrAux1.FieldByName('descricao_item').AsString));
//          COD_BARRA := Trim(vQrAux1.FieldByName('num_fab_prod').AsString);
//          COD_ANT_ITEM := '';
//          UNID_INV := UpperCase(Trim(vQrAux.FieldByName('UNID_INV').AsString));
//          vTipoItem := vQrAux1.FieldByName('TIPO_ITEM').AsString;
//          COD_NCM := Trim(vQrAux1.FieldByName('COD_NCM').AsString);
//          EX_IPI := Trim(vQrAux.FieldByName('EX_IPI').AsString);
//          COD_GEN := Trim(vQrAux1.FieldByName('COD_GEN').AsString);
//          COD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString);
//          ALIQ_ICMS := vQrAux1.FieldByName('ALIQ_ICMS').AsCurrency;
//          vQrAux1.Close;
//        end
//        else
//        begin
//          DESCR_ITEM := Trim(vQrAux.FieldByName('DESCR_ITEM').AsString);
//          COD_BARRA := Trim(vQrAux.FieldByName('COD_BARRA').AsString);
//          COD_ANT_ITEM := '';
//          UNID_INV := UpperCase(Trim(vQrAux.FieldByName('UNID_INV').AsString));
//          vTipoItem := vQrAux.FieldByName('TIPO_ITEM').AsString;
//          COD_NCM := Trim(vQrAux.FieldByName('COD_NCM').AsString);
//          EX_IPI := Trim(vQrAux.FieldByName('EX_IPI').AsString);
//          COD_GEN := Trim(vQrAux.FieldByName('COD_GEN').AsString);
//          COD_LST := Trim(vQrAux.FieldByName('COD_LST').AsString);
//          ALIQ_ICMS := vQrAux.FieldByName('ALIQ_ICMS').AsCurrency;
//        end;
//        TIPO_ITEM := StrToTipoItem(vTipoItem);
//        montaRegistro0190(UpperCase(UNID_INV));
//      end;
//      vQrAux.Next;
//      FProgressBar.Position := FProgressBar.Position + 1;
//    end;
//  finally
//    vQrAux.Close;
//  end;
//end;

procedure TSpedFiscal.montaRegistro0300(pCOD_IND_BEM: string);
var
  I, vCOD_PRNC: Integer;
begin
  vCOD_PRNC := 0;
  for I := 0 to F0300.Count - 1 do
    if F0300[I] = pCOD_IND_BEM then
      exit;
  vQrAux.Close;
  vQrAux.SQL.Text := 'select eq.cod_equip COD_IND_BEM, eq.ident_merc, eq.nom_equip DESCR_ITEM,' +
    ' eq.cod_prnc, eq.cod_cta_eq COD_CTA, eq.nr_parc, eq.cod_ccus, eq.func,' +
    ' eq.vida_util from equipamento eq' +
    ' where eq.cod_equip = :COD_IND_BEM and eq.cod_empresa = :cod_empresa';
  vQrAux.ParamByName('COD_IND_BEM').AsInteger := StrToInt(Trim(pCOD_IND_BEM));
  vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(Trim(FCodEmpresa));
  vQrAux.Open;
  try
    with FSpedF.Bloco_0.Registro0300New do
    begin
      COD_IND_BEM := vQrAux.FieldByName('COD_IND_BEM').AsString;
      IDENT_MERC := vQrAux.FieldByName('IDENT_MERC').AsInteger;
      DESCR_ITEM := Trim(vQrAux.FieldByName('DESCR_ITEM').AsString);
      if vQrAux.FieldByName('COD_PRNC').AsInteger > 0 then
      begin
        COD_PRNC := vQrAux.FieldByName('COD_PRNC').AsString;
        vCOD_PRNC := vQrAux.FieldByName('COD_PRNC').AsInteger;
      end;
      COD_CTA := Trim(vQrAux.FieldByName('COD_CTA').AsString);
      if vQrAux.FieldByName('NR_PARC').AsFloat > 0 then
        NR_PARC := vQrAux.FieldByName('NR_PARC').AsFloat;

      with FSpedF.Bloco_0.Registro0305New do
      begin
        COD_CCUS := vQrAux.FieldByName('COD_CCUS').AsString;
        FUNC := Trim(getCampoBlobString(vQrAux.FieldByName('FUNC').AsString));
        if vQrAux.FieldByName('VIDA_UTIL').AsInteger > 0 then
          VIDA_UTIL := vQrAux.FieldByName('VIDA_UTIL').AsInteger;
      end;
      F0300.Add(pCOD_IND_BEM);
    end;
    if vCOD_PRNC > 0 then
    begin
      for I := 0 to F0300.Count - 1 do
        if F0300[I] = IntToStr(vCOD_PRNC) then
          exit;
      vQrAux.Close;
      vQrAux.SQL.Text := 'select eq.cod_equip COD_IND_BEM, eq.ident_merc, eq.nom_equip DESCR_ITEM,'
        +
        ' eq.cod_prnc, eq.cod_cta_eq COD_CTA, eq.nr_parc, eq.cod_ccus, eq.func,' +
        ' eq.vida_util from equipamento eq' +
        ' where eq.cod_equip = :COD_IND_BEM and eq.cod_empresa = :cod_empresa';
      vQrAux.ParamByName('COD_IND_BEM').AsInteger := vCOD_PRNC;
      vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(Trim(FCodEmpresa));
      vQrAux.Open;
      with FSpedF.Bloco_0.Registro0300New do
      begin
        COD_IND_BEM := vQrAux.FieldByName('COD_IND_BEM').AsString;
        IDENT_MERC := vQrAux.FieldByName('IDENT_MERC').AsInteger;
        DESCR_ITEM := Trim(vQrAux.FieldByName('DESCR_ITEM').AsString);
        //COD_PRNC
        COD_CTA := Trim(vQrAux.FieldByName('COD_CTA').AsString);
        if vQrAux.FieldByName('NR_PARC').AsFloat > 0 then
          NR_PARC := vQrAux.FieldByName('NR_PARC').AsFloat;

        with FSpedF.Bloco_0.Registro0305New do
        begin
          COD_CCUS := vQrAux.FieldByName('COD_CCUS').AsString;
          FUNC := Trim(getCampoBlobString(vQrAux.FieldByName('FUNC').AsString));
          if vQrAux.FieldByName('VIDA_UTIL').AsInteger > 0 then
            VIDA_UTIL := vQrAux.FieldByName('VIDA_UTIL').AsInteger;
        end;
        F0300.Add(pCOD_IND_BEM);
      end;
    end;
  finally
    vQrAux.Close;
  end;
end;

//procedure TSpedFiscal.montaRegistro0400(pCOD_NAT: string);
//var
//  I: Integer;
//begin
//  for I := 0 to F0400.Count - 1 do
//    if F0400[I] = pCOD_NAT then
//      exit;
//  vQrAux.Close;
//  vQrAux.SQL.Text := 'select np.descricao_nop from nat_op np where np.codigo_nop = ' + pCOD_NAT;
//  vQrAux.Open;
//  try
//    with FSpedF.Bloco_0.Registro0400New do
//    begin
//      COD_NAT := pCOD_NAT;
//      if Trim(vQrAux.FieldByName('descricao_nop').AsString) <> '' then
//        DESCR_NAT := Trim(getCampoBlobString(Trim(vQrAux.FieldByName('descricao_nop').AsString)))
//      else
//        DESCR_NAT := pCOD_NAT;
//      F0400.Add(pCOD_NAT);
//    end;
//  finally
//    vQrAux.Close;
//  end;
//end;

//procedure TSpedFiscal.montaRegistro0450(pCOD_INF: integer; pTXT: string);
//var
//  I: Integer;
//begin
//  for I := 0 to F0450.Count - 1 do
//    if F0450[I] = IntToStr(pCOD_INF) then
//      exit;
//  with FSpedF.Bloco_0.Registro0450New do
//  begin
//    COD_INF := IntToStr(pCOD_INF);
//    TXT := getCampoBlobString(pTXT);
//    F0450.Add(IntToStr(pCOD_INF));
//  end;
//end;

procedure TSpedFiscal.montaRegistro0460(pCOD_OBS: integer; pTXT: string);
var
  I: Integer;
begin
  for I := 0 to F0460.Count - 1 do
    if F0460[I] = IntToStr(pCOD_OBS) then
      exit;
  with FSpedF.Bloco_0.Registro0460New do
  begin
    COD_OBS := IntToStr(pCOD_OBS);
    TXT := getCampoBlobString(pTXT);
    F0460.Add(IntToStr(pCOD_OBS));
  end;
end;

//procedure TSpedFiscal.montaRegistroC400(pCOD_MOD, pECF_MOD, pECF_FAB, pECF_CX: string);
//var
//  I: Integer;
//begin
//  for I := 0 to FC400.Count - 1 do
//    if FC400[I] = (SpaceStr(pECF_MOD, 20) + SpaceStr(pECF_FAB, 20) + StrZero(pECF_CX, 3)) then
//      exit;
//  with FSpedF.Bloco_C.RegistroC400New do
//  begin
//    COD_MOD := Trim(pCOD_MOD);
//    ECF_MOD := Trim(pECF_MOD);
//    ECF_FAB := Trim(pECF_FAB);
//    ECF_CX := Trim(pECF_CX);
//    FC400.Add(SpaceStr(pECF_MOD, 20) + SpaceStr(pECF_FAB, 20) + StrZero(pECF_CX, 3));
//  end;
//end;

procedure TSpedFiscal.setSTEstado(cod_part: string);
var
  vStringTemp: string;
  I: Integer;
begin
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FSigla[i] := Sigla[i];
end;

procedure TSpedFiscal.somaFDEB_ESP_ST(UF: string; pDEB_ESP_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  for I := 1 to 27 do
    if UF = Sigla[i] then
    begin
      FDEB_ESP_ST[i] := FDEB_ESP_ST[i] + pDEB_ESP_ST;
      FSigla[I]      := UF;
    end;
  {
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FDEB_ESP_ST[i] := FDEB_ESP_ST[i] + pDEB_ESP_ST;
  }
end;

procedure TSpedFiscal.somaFVL_AJ_CREDITOS_ST(UF: string;
  pVL_AJ_CREDITOS_ST: Currency);
var
  I: Integer;
begin
  for I := 1 to 27 do
    if UF = Sigla[i] then
    begin
      FVL_AJ_CREDITOS_ST[i] := FVL_AJ_CREDITOS_ST[i] + pVL_AJ_CREDITOS_ST;
      FSigla[I]             := UF;
    end;
  {
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_AJ_CREDITOS_ST[i] := FVL_AJ_CREDITOS_ST[i] + pVL_AJ_CREDITOS_ST;
  }
end;

procedure TSpedFiscal.somaFVL_AJ_DEBITOS_ST(UF: string;
  pVL_AJ_DEBITOS_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  for I := 1 to 27 do
    if UF = Sigla[i] then
    begin
      FVL_AJ_DEBITOS_ST[i] := FVL_AJ_DEBITOS_ST[i] + pVL_AJ_DEBITOS_ST;
      FSigla[I]            := UF;
    end;
  {
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_AJ_DEBITOS_ST[i] := FVL_AJ_DEBITOS_ST[i] + pVL_AJ_DEBITOS_ST;
  }
end;

procedure TSpedFiscal.somaFVL_DEVOL_ST(cod_part: string;
  pVL_DEVOL_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_DEVOL_ST[i] := FVL_DEVOL_ST[i] + pVL_DEVOL_ST;
end;

procedure TSpedFiscal.somaFVL_OUT_CRED_ST(cod_part: string;
  pVL_OUT_CRED_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_OUT_CRED_ST[i] := FVL_OUT_CRED_ST[i] + pVL_OUT_CRED_ST;
end;

//procedure TSpedFiscal.somaFVL_RESSARC_ST(cod_part: string;
//  pVL_RESSARC_ST: Currency);
//var
//  vStringTemp: string;
//  I: Integer;
//begin
//  vStringTemp := getUFParticipante(cod_part);
//  for I := 1 to 27 do
//    if vStringTemp = IBGE[i] then
//      FVL_RESSARC_ST[i] := FVL_RESSARC_ST[i] + pVL_RESSARC_ST;
//end;

procedure TSpedFiscal.somaFVL_RETENCAO_ST(cod_part: string;
  pVL_RETENCAO_ST: Currency);
var
  vStringTemp: string;
  I: Integer;
begin
  vStringTemp := getUFParticipante(cod_part);
  for I := 1 to 27 do
    if vStringTemp = IBGE[i] then
      FVL_RETENCAO_ST[i] := FVL_RETENCAO_ST[i] + pVL_RETENCAO_ST;
end;

//function TSpedFiscal.SpaceStr(vStr: string; Tam: Integer): string;
//var
//  I: Integer;
//  V1: string;
//begin
//  V1 := Trim(vStr);
//  for I := 1 to Tam - Length(V1) do
//    V1 := ' ' + V1;
//  Result := V1;
//end;

//function TSpedFiscal.StrToFloatFormat(valor: Currency;
//  casasDecimais: integer): Currency;
//begin
//  Result := StrToFloat(Format('%0.' + IntToStr(casasDecimais) + 'f', [valor]));
//end;

//function TSpedFiscal.StrZero(Num: string; Tam: Integer): string;
//var
//  I: Integer;
//  V1: string;
//begin
//  V1 := Trim(Num);
//  for I := 1 to Tam - Length(V1) do
//    V1 := '0' + V1;
//  Result := V1;
//end;

procedure TSpedFiscal.teste;
begin
  FSpedF := TACBrSPEDFiscal.Create(Application);
  FSpedF.DT_INI := StrToDate(DataIni);
  FSpedF.DT_FIN := StrToDate(DataFim);
  FSpedF.LinhasBuffer := 1000;

  FSpedF.IniciaGeracao;

end;

{procedure TSpedFiscal.verificaCamposNullCupom(pNSerieECF: string; pCodTerminal: integer);
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
    vQrExec.Transaction := vTransacao;

    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    vQrTemp2 := TIBQuery.Create(Application);
    vQrTemp2.Database := vConexao;
    vQrTemp2.Transaction := vTransacao;
    try
      FLabelStatus.Caption := 'Verificando Cupon''s';
      Application.ProcessMessages;
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

      vQrExec.Close;
      vQrExec.SQL.Text := 'update MAPA_RESUMO_ALIQ cp set cp.descaliq = ''CAN-T'' ' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
        ' and cp.cod_empresa = :cod_empresa and ((cp.descaliq = ''Canc-T'') or' +
        ' (cp.descaliq = ''Can-T''))';
      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

      vQrExec.Close;
      vQrExec.SQL.Text := 'update MAPA_RESUMO_ALIQ cp set cp.descaliq = ''CAN-S'' ' +
        ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
        ' and cp.cod_empresa = :cod_empresa and ((cp.descaliq = ''Canc-S'') or' +
        ' (cp.descaliq = ''Can-S''))';
      vQrExec.ParamByName('cod_terminal').AsInteger := pCodTerminal;
      vQrExec.ParamByName('nserie').AsString := pNSerieECF;
      vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
      vQrExec.ExecSQL;

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

//       vQrTemp.Close;
//       vQrTemp.SQL.Text := 'select cp.registro, cp.cupom NUM_DOC' +
//         ' from cupom cp ' +
//         ' where cp.cod_terminal = :cod_terminal and cp.nserieecf = :nserie' +
//         ' and cp.cod_empresa = :cod_empresa and cp.data >= :dataIni and cp.data <= :dataFim';
//       vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
//       vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
//       vQrTemp.ParamByName('cod_terminal').AsInteger := pCodTerminal;
//       vQrTemp.ParamByName('nserie').AsString := pNSerieECF;
//       vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//       vQrTemp.Open;
//
//       vQrTemp.FetchAll;
//
//       FProgressBar2.Min := 0;
//       FProgressBar2.Max := vQrTemp.RecordCount;
//       FProgressBar2.Position := 0;
//
//       vQrTemp.First;
//       while not vQrTemp.Eof do
//       begin
//         Application.ProcessMessages;

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

//       vQrTemp.Next;
//       FProgressBar2.Position := FProgressBar2.Position + 1;
//     end;

      FLabelStatus.Caption := 'Definindo PIS/COFINS dos Cupons';
      Application.ProcessMessages;

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
      FProgressBar2.Position := 0;

      vQrTemp.First;
      while not vQrTemp.Eof do
      begin
        vValorAcumuladoPIS := 0;
        vValorAcumuladoCOFINS := 0;

        Application.ProcessMessages;
        vQrTemp2.Close;
        vQrTemp2.SQL.Text :=
          'select cp2.registro, cp2.nitem, cp2.cupom, cp2.ordem, cp2.total, cp2.rat_acres, cp2.rat_desc,' +
          ' case when (cp2.prod_serv = ''S'') then ts.isento_pis' +
          '   else p.isento_pis' +
          ' end isento_pis' +
          ' from cupom2 cp2' +
          ' left join produtos p on p.grupo_prod = cp2.grupo_prod and p.cod_prod = cp2.cod_prod and' +
          ' p.cod_empresa = cp2.cod_empresa and cp2.prod_serv = ''P''' +
          ' left join tipo_servico ts on ts.cod_servico = cp2.grupo_prod and cp2.prod_serv = ''S''' +
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
          if (vQrTemp2.FieldByName('isento_pis').AsString = 'S') or (Pos('SIMPLES', FRegime) > 0)
            then
          begin
            vValorPIS := 0;
            vValorCOFINS := 0;
          end
          else
          begin
            vValorPIS := vQrTemp2.FieldByName('total').AsCurrency +
              vQrTemp2.FieldByName('rat_acres').AsCurrency -
              vQrTemp2.FieldByName('rat_desc').AsCurrency;
            vValorCOFINS := vValorPIS;
            vValorPIS := StrToFloatFormat((vValorPIS * FAliqPIS / 100), 2);
            vValorCOFINS := StrToFloatFormat((vValorCOFINS * FAliqCOFINS / 100), 2);
          end;

          vQrExec.Close;
          vQrExec.SQL.Text :=
            'update cupom2 cp2 set cp2.valor_pis = :valor_pis, cp2.valor_cofins = :valor_cofins' +
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
          vQrExec.Prepare;
          vQrExec.ExecSQL;

          vValorAcumuladoPIS := vValorAcumuladoPIS + vValorPIS;
          vValorAcumuladoCOFINS := vValorAcumuladoCOFINS + vValorCOFINS;

          vQrTemp2.Next;
        end;

        vQrExec.Close;
        vQrExec.SQL.Text :=
          'update cupom2 cp2 set cp2.valor_pis = 0, cp2.valor_cofins = 0' +
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
      end;

    except
    end;
  finally
    vQrExec.Free;
    vQrExec := nil;

    vQrTemp.Free;
    vQrTemp := nil;

    vQrTemp2.Free;
    vQrTemp2 := nil;
  end;
end;     }

//procedure TSpedFiscal.verificaCamposNuloNF;
//var
//  vQrExec: TIBQuery;
//begin
//  try
//    vQrExec := TIBQuery.Create(Application);
//    vQrExec.Database := vConexao;
//    vQrExec.Transaction := vTransacao;
//    try
//      vQrExec.Close;
//      vQrExec.SQL.Text := 'update notafiscal set valor_prod = 0 ' +
//        ' where valor_prod is null and data_lanc >= :dataIni and data_lanc <= :dataFim and cod_empresa = ' +
//        FCodEmpresa;
//      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
//      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
//      vQrExec.Prepare;
//      vQrExec.ExecSQL;
//      vQrExec.Close;
//      vQrExec.SQL.Text := 'update notafiscal set valor_serv = 0 ' +
//        ' where valor_serv is null and data_lanc >= :dataIni and data_lanc <= :dataFim and cod_empresa = ' +
//        FCodEmpresa;
//      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
//      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
//      vQrExec.Prepare;
//      vQrExec.ExecSQL;
//      vQrExec.Close;
//      vQrExec.SQL.Text := 'update notafiscal set aliq_icm = 0 ' +
//        ' where aliq_icm is null and data_lanc >= :dataIni and data_lanc <= :dataFim and cod_empresa = ' +
//        FCodEmpresa;
//      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
//      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
//      vQrExec.Prepare;
//      vQrExec.ExecSQL;
//    except
//    end;
//  finally
//    vQrExec.Free;
//    vQrExec := nil;
//  end;
//end;

procedure TSpedFiscal.verificaCSTIPI;
begin

end;

//function TSpedFiscal.verificaCupomSemZ(pNSerieECF: string; pCodTerminal: integer): boolean;
//var
//  vQrAux: TIBQuery;
//  I: Integer;
//  diaIni: Integer;
//  diaFim: Integer;
//  vData: TDate;
//begin
//  Result := True;
//  try
//    vQrAux := TIBQuery.Create(Application);
//    vQrAux.Database := vConexao;
//    vQrAux.Transaction := vTransacao;
//    try
//      diaIni := StrToInt(copy(FDataIni, 1, 2));
//      diaFim := StrToInt(copy(FDataFim, 1, 2));
//      for I := diaIni to diaFim do
//      begin
//        vData := strtodate(StrZero(IntToStr(i), 2) + copy(FDataIni, 3, 8));
//        vQrAux.Close;
//        vQrAux.SQL.Text := 'select first 1 cp.cupom from cupom cp' +
//          ' where cp.data = :dia and cp.cod_terminal = :cod_terminal and' +
//          ' cp.nserieecf = :nserie and cp.cod_empresa = :cod_empresa';
//        vQrAux.ParamByName('dia').AsDate := vData;
//        vQrAux.ParamByName('cod_terminal').AsInteger := pCodTerminal;
//        vQrAux.ParamByName('nserie').AsString := pNSerieECF;
//        vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//        vQrAux.Open;
//        if not vQrAux.IsEmpty then
//        begin
//          vQrAux.Close;
//          vQrAux.SQL.Text := 'select first 1 res.coored from resumod res' +
//            ' where res.data_mov = :dia and res.cod_terminal = :cod_terminal and' +
//            ' res.nserieecf = :nserie and res.cod_empresa = :cod_empresa';
//          vQrAux.ParamByName('dia').AsDate := vData;
//          vQrAux.ParamByName('cod_terminal').AsInteger := pCodTerminal;
//          vQrAux.ParamByName('nserie').AsString := pNSerieECF;
//          vQrAux.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//          vQrAux.Open;
//          if vQrAux.IsEmpty then
//          begin
//            Result := False;
//            Application.MessageBox(pchar('Sem Redução Z no sistema para a data ' +
//              DateToStr(vData) + #13 +
//              'E Cupons fiscais encontrados. Verifique e cadastre a redução Z no Sistema'),
//              'Atenção', 0 + 64);
//          end;
//        end;
//      end;
//    except
//    end;
//  finally
//    vQrAux.Free;
//    vQrAux := nil;
//  end;
//end;

//procedure TSpedFiscal.verificaDataServicoTransporte;
//var
//  vQrExec: TIBQuery;
//begin
//  try
//    vQrExec := TIBQuery.Create(Application);
//    vQrExec.Database := vConexao;
//    vQrExec.Transaction := vTransacao;
//    try
//      vQrExec.Close;
//      vQrExec.SQL.Text := 'update servico_transporte set data_lancamento = data_emissao' +
//        ' where data_lancamento is null and data_emissao >= :dataIni' +
//        ' and data_emissao <= :dataFim and cod_empresa = ' + FCodEmpresa;
//      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
//      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
//      vQrExec.Prepare;
//      vQrExec.ExecSQL;
//    except
//    end;
//  finally
//    vQrExec.Free;
//    vQrExec := nil;
//  end;
//end;

procedure TSpedFiscal.verificaFormasPagS(numNf: integer; dataNF,
  serieNF: string);
var
  vQrTemp, vQrTemp2, vQrExec: TIBQuery;
begin
  try
    vQrTemp := TIBQuery.Create(Application);
    vQrTemp.Database := vConexao;
    vQrTemp.Transaction := vTransacao;

    vQrTemp2 := TIBQuery.Create(Application);
    vQrTemp2.Database := vConexao;
    vQrTemp2.Transaction := vTransacao;

    vQrExec := TIBQuery.Create(Application);
    vQrExec.Database := vConexao;
    vQrExec.Transaction := vTransacao;
    try
      vQrTemp.Close;
      vQrTemp.SQL.Text := 'select num_nf, data_nf, tipo, nped' +
        ' from pedvenda where num_nf = ' + IntToStr(numNf) + ' and data_nf = :data_nf' +
        ' and cod_empresa = ' + FCodEmpresa + ' and ativo = 1';
      vQrTemp.ParamByName('data_nf').AsDate := StrToDate(dataNF);
      vQrTemp.Open;
      while not vQrTemp.Eof do
      begin
        vQrTemp2.Close;
        vQrTemp2.SQL.Text := 'select nrequisicao from formpagamento' +
          ' where nrequisicao = ' + vQrTemp.FieldByName('nped').AsString +
          ' and tpdocs = ' + QuotedStr(Trim(vQrTemp.FieldByName('tipo').AsString)) +
          ' and cod_empresa = ' + FCodEmpresa +
          ' and num_nota is null ';
        vQrTemp2.Open;
        if not vQrTemp2.IsEmpty then
        begin
          vQrExec.Close;
          vQrExec.SQL.Text := 'update formpagamento set num_nota = ' + IntToStr(numNf) +
            ', sub_serie = ' + Trim(serieNF) +
            ' where nrequisicao = ' + vQrTemp.FieldByName('nped').AsString +
            ' and tpdocs = ' + QuotedStr(Trim(vQrTemp.FieldByName('tipo').AsString)) +
            ' and cod_empresa = ' + FCodEmpresa +
            ' and num_nota is null';
          vQrExec.Prepare;
          vQrExec.ExecSQL;
        end;
        vQrTemp.Next;
      end;
      vQrTemp.Close;
      vQrTemp2.Close;
    except
    end;
  finally
    vQrTemp.Free;
    vQrTemp := nil;
    vQrTemp2.Free;
    vQrTemp2 := nil;
    vQrExec.Free;
    vQrExec := nil;
  end;
end;

procedure TSpedFiscal.verificarConfiguracoes;
var
  vVersaoConfigBanco: Integer;
  vVersaoConfigSped: Integer; // versao da configuracao
begin
  try

    if not conectarBanco then
      Exit;

    vVersaoConfigSped := 1;
    vVersaoConfigBanco := getConfSisInt('efd_icms_versao_config', vQrAux);

    if vVersaoConfigBanco < 1 then
    begin
      setConfSisInt('efd_icms_versao_config', 0, vQrAux,
        'EFD ICMS IPI - Versao da configuração do sistema', nil);
      setConfSisBool('efd_icms_desconsiderar_insc_st_apuracao', True, vQrAux,
        'EFD ICMS IPI - Desconsiderar inscricao de substituto na apuracao do ST do SPED Fiscal',
        'Habilitar ao gerar o arquivo do Sped Fiscal o sistema desconsiderar a inscrição' + #13 +
        'de substituto tributário no estado de destino para dados de ST das notas fiscais');
      setConfSisBlob('efd_icms_e220_cod_ajuste_st_recolhida', vQrAux,
        'EFD ICMS IPI - E220 - Codigo de Ajuste da ST recolhida na apuracao por UF',
        'O codigo possui uma regra que deve ser obedecida para evitar erros de validacao no PVA' + #13 +
        'Regra: O codigo deve iniciar em "14" e logo em seguida outros 4 numeros' + #13 +
        '|Sigla da UF|Codigo de ajuste Tabela 5.1.1 sem a sigla da UF|Descricao complementar|' + #13 +
        '|SP|141499||');
    end;
    
    if vVersaoConfigBanco < 2 then
    begin
      vVersaoConfigSped := 2;
      setConfSisBlob('efd_icms_1600_conf_cartao', vQrAux,
        'EFD ICMS IPI - 1600 - Configurações para obter valores de vendas cartão',
        '[Cartao1600]' + #13 +
        '# Ativa o vinculo com as trasacoes do POS Virtual' + #13 +
        'VincularCadastroAdm=N' + #13 +
        '# Usar o prazo (data_venc - data_mov) para indicar se Credito ou Debito' + #13 +
        'AjustarOperacaoDebitoCreditoPeloVencimento=N' + #13 +
        '# Qtde de dias para considerar o registro como Debito' + #13 +
        'QtdeMaximaDiasPrazoParaConsiderarDebito=5');
    end;

    if vVersaoConfigBanco < 3 then
    begin
      vVersaoConfigSped := 3;
      setConfSisBool('efd_icms_e200_apurar_st_antcipacao', True, vQrAux,
        'EFD ICMS IPI - E200 - Montar o registro E200 com os valores da ST Antecipação', '');
      setConfSisBool('efd_icms_valor_st_ipi_em_vlmerc', True, vQrAux,
        'EFD ICMS IPI - Apurar o valor da ST e IPI nos campos correspondentes ao valor da mercadoria(Conforme Manual)', '');
    end;

    if vVersaoConfigSped > vVersaoConfigBanco then // versao do programa maior que a versao salva no banco
    begin
      vQrAux.Close;
      vQrAux.SQL.Text := 'update config_sistema set value1_f = :value1_f' +
        ' where chave = ''efd_icms_versao_config'' and cod_empresa = ' + FCodEmpresa;
      vQrAux.ParamByName('value1_f').AsFloat := vVersaoConfigSped;
      vQrAux.ExecSQL;
      if vQrAux.Transaction.InTransaction then
        vQrAux.Transaction.Commit;
    end;

    vQrAux.Close;

  except
    on e: exception do
    begin
      Application.MessageBox(pchar('Erro ao abrir configuracoes (config_sistema). Erro: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

//procedure TSpedFiscal.verificaNfSerieD;
//var
//  vQrExec: TIBQuery;
//begin
//  try
//    vQrExec := TIBQuery.Create(Application);
//    vQrExec.Database := vConexao;
//    vQrExec.Transaction := vTransacao;
//    try
//      vQrExec.Close;
//      vQrExec.SQL.Text := 'update nf_serie_d set status = ''FECHADA''' +
//        ' where ((status is null) or (status = '''')) and dataemissao >= :dataIni' +
//        ' and dataemissao <= :dataFim and cod_empresa = ' + FCodEmpresa;
//      vQrExec.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
//      vQrExec.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
//      vQrExec.Prepare;
//      vQrExec.ExecSQL;
//    except
//    end;
//  finally
//    vQrExec.Free;
//    vQrExec := nil;
//  end;
//end;

//procedure TSpedFiscal.verificaPISCOFINSNFSerieD;
//var
//  vQrTemp, vQrTemp2, vQrExec: TIBQuery;
//  vValorPIS: Currency;
//  vValorCOFINS: Currency;
//  vValorAcumuladoPIS: Currency;
//  vValorAcumuladoCOFINS: Currency;
//begin
//  try
//    vQrExec := TIBQuery.Create(Application);
//    vQrExec.Database := vConexao;
//    vQrExec.Transaction := vTransacao;
//
//    vQrTemp := TIBQuery.Create(Application);
//    vQrTemp.Database := vConexao;
//    vQrTemp.Transaction := vTransacao;
//
//    vQrTemp2 := TIBQuery.Create(Application);
//    vQrTemp2.Database := vConexao;
//    vQrTemp2.Transaction := vTransacao;
//    try
//      FLabelStatus.Caption := 'Verificando PIS/COFINS Nota Fiscal 02';
//      Application.ProcessMessages;
//
//      vQrTemp.Close;
//      vQrTemp.SQL.Text := 'select nf.NUMERONOTA, nf.COD_EMPRESA from NF_SERIE_D nf' +
//      ' where nf.cod_empresa = :cod_empresa and nf.DATAEMISSAO >= :dataIni and nf.DATAEMISSAO <= :dataFim' +
//        ' and ((nf.valor_pis is null) or (nf.valor_cofins is null)) '; //and cp.status_cp <> ''CANCELADO''';
//      vQrTemp.ParamByName('dataIni').AsDate := StrToDate(FDataIni);
//      vQrTemp.ParamByName('dataFim').AsDate := StrToDate(FDataFim);
//      vQrTemp.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//      vQrTemp.Open;
//
//      vQrTemp.FetchAll;
//
//      FProgressBar2.Min := 0;
//      FProgressBar2.Max := vQrTemp.RecordCount;
//      FProgressBar2.Position := 0;
//
//      vQrTemp.First;
//      while not vQrTemp.Eof do
//      begin
//        vValorAcumuladoPIS := 0;
//        vValorAcumuladoCOFINS := 0;
//
//        Application.ProcessMessages;
//        vQrTemp2.Close;
//        vQrTemp2.SQL.Text :=
//          'select nfi.NUMERONOTA, nfi.NITEM, nfi.GRUPO_PROD, nfi.COD_PROD, nfi.COD_EMPRESA,' +
//          ' p.isento_pis, nfi.VL_TOT_ITEM from NF_SERIE_D_ITENS nfi' +
//          ' left join produtos p on p.grupo_prod = nfi.grupo_prod and p.cod_prod = nfi.cod_prod and' +
//          ' p.cod_empresa = nfi.cod_empresa' +
//          ' where nfi.cod_empresa = :cod_empresa and nfi.NUMERONOTA = :NUMERONOTA';
//        vQrTemp2.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//        vQrTemp2.ParamByName('NUMERONOTA').AsInteger := vQrTemp.FieldByName('NUMERONOTA').AsInteger;
//        vQrTemp2.Open;
//
//        vQrTemp2.First;
//        while not vQrTemp2.Eof do
//        begin
//          if (vQrTemp2.FieldByName('isento_pis').AsString = 'S') or (Pos('SIMPLES', FRegime) > 0)
//            then
//          begin
//            vValorPIS := 0;
//            vValorCOFINS := 0;
//          end
//          else
//          begin
//            vValorPIS := vQrTemp2.FieldByName('VL_TOT_ITEM').AsCurrency;
//            vValorCOFINS := vValorPIS;
//            vValorPIS := StrToFloatFormat((vValorPIS * FAliqPIS / 100), 2);
//            vValorCOFINS := StrToFloatFormat((vValorCOFINS * FAliqCOFINS / 100), 2);
//          end;
//
//          vQrExec.Close;
//          vQrExec.SQL.Text :=
//            'update NF_SERIE_D_ITENS nfi set nfi.valor_pis = :valor_pis, nfi.valor_cofins = :valor_cofins' +
//            ' where nfi.NUMERONOTA = :NUMERONOTA and nfi.NITEM = :NITEM' +
//            ' and nfi.GRUPO_PROD = :GRUPO_PROD and nfi.COD_PROD = :COD_PROD' +
//            ' and nfi.COD_EMPRESA = :COD_EMPRESA';
//          vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//          vQrExec.ParamByName('NUMERONOTA').AsInteger := vQrTemp.FieldByName('NUMERONOTA').AsInteger;
//          vQrExec.ParamByName('NITEM').AsInteger := vQrTemp2.FieldByName('NITEM').AsInteger;
//          vQrExec.ParamByName('GRUPO_PROD').AsInteger := vQrTemp2.FieldByName('GRUPO_PROD').AsInteger;
//          vQrExec.ParamByName('COD_PROD').AsString := vQrTemp2.FieldByName('COD_PROD').AsString;
//          vQrExec.ParamByName('valor_pis').AsCurrency := vValorPIS;
//          vQrExec.ParamByName('valor_cofins').AsCurrency := vValorCOFINS;
//          vQrExec.Prepare;
//          vQrExec.ExecSQL;
//
//          vValorAcumuladoPIS := vValorAcumuladoPIS + vValorPIS;
//          vValorAcumuladoCOFINS := vValorAcumuladoCOFINS + vValorCOFINS;
//
//          vQrTemp2.Next;
//        end;
//
//        vQrExec.Close;
//        vQrExec.SQL.Text :=
//          'update NF_SERIE_D_ITENS nfi set nfi.valor_pis = 0, nfi.valor_cofins = 0' +
//          ' where nfi.NUMERONOTA = :NUMERONOTA and nfi.COD_EMPRESA = :COD_EMPRESA'+
//          ' and ((nfi.valor_pis is null) or (nfi.valor_cofins is null)) ';
//        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//        vQrExec.ParamByName('NUMERONOTA').AsInteger := vQrTemp.FieldByName('NUMERONOTA').AsInteger;
//        vQrExec.Prepare;
//        vQrExec.ExecSQL;
//
//        vQrExec.Close;
//        vQrExec.SQL.Text :=
//          'update NF_SERIE_D nf set nf.valor_pis = :valor_pis, nf.valor_cofins = :valor_cofins' +
//          ' where nf.cod_empresa = :cod_empresa and nf.NUMERONOTA = :NUMERONOTA';
//        vQrExec.ParamByName('cod_empresa').AsInteger := StrToInt(FCodEmpresa);
//        vQrExec.ParamByName('NUMERONOTA').AsInteger := vQrTemp.FieldByName('NUMERONOTA').AsInteger;
//        vQrExec.ParamByName('valor_pis').AsCurrency := vValorAcumuladoPIS;
//        vQrExec.ParamByName('valor_cofins').AsCurrency := vValorAcumuladoCOFINS;
//        vQrExec.Prepare;
//        vQrExec.ExecSQL;
//
//        vQrTemp.Next;
//        FProgressBar2.Position := FProgressBar2.Position + 1;
//      end;
//    except
//    end;
//  finally
//    vQrExec.Free;
//    vQrExec := nil;
//
//    vQrTemp.Free;
//    vQrTemp := nil;
//
//    vQrTemp2.Free;
//    vQrTemp2 := nil;
//  end;
//end;

end.

