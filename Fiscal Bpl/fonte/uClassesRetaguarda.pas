unit uClassesRetaguarda;

interface

uses
  IBQuery, IBDatabase, uDataSet_OOP, ComCtrls, Controls, config_sistema_class;

type

  TAtualizacaoRetaguarda = class(TObject)
  private
    //Componentes HW Sincronizar dados
    fConexaoHw: TIBDataBase;
    fTransacaoHw: TIBTransaction;
    fBuscasHw, fBuscasHwPed, fExecHw, fQuerySqlOpen: TIBQuery;

    // Componentes PAF Sincronizar dados PAF
    fConexaoF: TIBDataBase;
    fTransacaoF, fTransacaoFExec: TIBTransaction;
    fBuscasF, fBuscasFPed, fBuscasFPed2, fExecF: TIBQuery;

    fInsertCupom: string;
    fInsertCupom2: string;
    fInsertResumoD: string;
    fInsertMapaResumo: string;
    fInsertDocNaoF: string;
    fInsertFinCupom: string;
    fInsertNFSerieD: string;
    fInsertNFSerieDIt: string;
    fInsertSangSupPrest: string;
    fInsertPedVenda: string;
    fInsertPedVendaProd: string;
    fInsertPedVendaServ: string;
    fInsertBaseAtEst: string;
    fUpdateCupom: string;
    fUpdateCupom2: string;
    fUpdateResumoD: string;
    fUpdateMapaResumo: string;
    fUpdateDocNaoF: string;
    fUpdateFinCupom: string;
    fUpdateNFSerieD: string;
    fUpdateNFSerieDIt: string;
    fUpdateSangSupPrest: string;
    fUpdateBaseAtEst: string;
    fTexto: string;
    fMax: Integer;
    fPos: Integer;
    fEmExecucao: Boolean;
    fAcao: string;
    fParamDataIni: string;
    fParamDataFim: string;
    fSleepTimeSemConxecao: Integer;

    function SqlOpen(ASql: string): TIBQuery;
    procedure _montaSql;
    procedure _sincronizarCupom(pCampo2: Boolean = False);
    procedure _sincronizarCupom2(pCampo2: Boolean = False);
    procedure _sincronizarResumoD;
    procedure _sincronizarMapaResumo;
    procedure _sincronizarDocNaoF;
    procedure _sincronizarFinCupom;
    procedure _sincronizarNFSerieD;
    procedure _sincronizarNFSerieDIt;
    procedure _sincronizarSangSupPrest;
    procedure _sincronizarPedVenda(param1, param2, pDataOuRegistro: string; pAlterarDataRegistro: Boolean = False);
    procedure _sincronizarAliq;

  public
    destructor Destroy; override;
    constructor create;
    procedure _setEnviadoRetA;
    procedure _registraErro(pErro: string);

    procedure _atualizarEstoque(pAlterarDataRegistro: Boolean = False);
    procedure _sincronizarDados;
    procedure VerificarVendasSemCupom(Data: TDate);

    property Max: Integer read fMax;
    property Pos: Integer read fPos;
    property Texto: string read fTexto;
    property EmExecucao: Boolean read fEmExecucao;
    property Acao: string read fAcao write fAcao;
    property ParamDataIni: string read fParamDataIni write fParamDataIni;
    property ParamDataFim: string read fParamDataFim write fParamDataFim;
    property SleepTimeSemConxecao: Integer read fSleepTimeSemConxecao;

  var
    vMD5Func : TManutencaoAlteracoesArquivosPAF;
  end;

var
  vHwSinc : TAtualizacaoRetaguarda;

implementation

uses
  uDtmAtivo, uDadosIniFiscal, SysUtils, DB, Classes, uDadosIni, Forms, Variants,
  DateUtils, hw_utils;

{ TAtualizacaoRetaguarda }

constructor TAtualizacaoRetaguarda.create;
begin
  fEmExecucao := False;
  vMD5Func := TManutencaoAlteracoesArquivosPAF.create;
  // Componentes HW
  fConexaoHw := TIBDatabase.Create(Application);
  fTransacaoHw := TIBTransaction.Create(Application);
  fBuscasHw := TIBQuery.Create(Application);
  fBuscasHwPed := TIBQuery.Create(Application);
  fQuerySqlOpen := TIBQuery.Create(Application);
  fExecHw := TIBQuery.Create(Application);

  fConexaoHw.Connected := False;
  fConexaoHw.DefaultTransaction := fTransacaoHw;
  fConexaoHw.LoginPrompt := false;
  fConexaoHw.Params.Add('user_name=sysdba');
  fConexaoHw.Params.Add('password=masterkey');

  fTransacaoHw.DefaultDatabase := fConexaoHw;
  fTransacaoHw.Params.Add('read_committed');
  fTransacaoHw.Params.Add('rec_version');
  fTransacaoHw.Params.Add('nowait');

  fBuscasHw.Database := fConexaoHw;
  fBuscasHw.Transaction := fTransacaoHw;

  fBuscasHwPed.Database := fConexaoHw;
  fBuscasHwPed.Transaction := fTransacaoHw;
  
  fQuerySqlOpen.Database := fConexaoHw;
  fQuerySqlOpen.Transaction := fTransacaoHw;

  fExecHw.Database := fConexaoHw;
  fExecHw.Transaction := fTransacaoHw;

  //Componentes PAF
  fConexaoF := TIBDatabase.Create(Application);
  fTransacaoF := TIBTransaction.Create(Application);
  fTransacaoFExec := TIBTransaction.Create(Application);
  fBuscasF := TIBQuery.Create(Application);
  fBuscasFPed := TIBQuery.Create(Application);
  fBuscasFPed2 := TIBQuery.Create(Application);
  fExecF := TIBQuery.Create(Application);

  fConexaoF.Connected := False;
  fConexaoF.DefaultTransaction := fTransacaoFExec;
  fConexaoF.LoginPrompt := false;
  fConexaoF.Params.Add('user_name=sysdba');
  fConexaoF.Params.Add('password=masterkey');

  fTransacaoF.DefaultDatabase := fConexaoF;
  fTransacaoF.Params.Add('read_committed');
  fTransacaoF.Params.Add('rec_version');
  fTransacaoF.Params.Add('nowait');

  fTransacaoFExec.DefaultDatabase := fConexaoF;
  fTransacaoFExec.Params.Add('read_committed');
  fTransacaoFExec.Params.Add('rec_version');
  fTransacaoFExec.Params.Add('nowait');

  fBuscasF.Database := fConexaoF;
  fBuscasF.Transaction := fTransacaoF;

  fBuscasFPed.Database := fConexaoF;
  fBuscasFPed.Transaction := fTransacaoF;

  fBuscasFPed2.Database := fConexaoF;
  fBuscasFPed2.Transaction := fTransacaoF;

  fExecF.Database := fConexaoF;
  fExecF.Transaction := fTransacaoFExec;

  fInsertCupom := '';
  fInsertCupom2 := '';
  fInsertResumoD := '';
  fInsertMapaResumo := '';
  fInsertDocNaoF := '';
  fInsertFinCupom := '';
  fInsertNFSerieD := '';
  fInsertNFSerieDIt := '';
  fInsertSangSupPrest := '';
  fInsertPedVenda := '';
  fInsertPedVendaProd := '';
  fInsertPedVendaServ := '';
  fInsertBaseAtEst := '';
  fUpdateCupom := '';
  fUpdateCupom2 := '';
  fUpdateCupom := '';
  fUpdateCupom2 := '';
  fUpdateResumoD := '';
  fUpdateMapaResumo := '';
  fUpdateDocNaoF := '';
  fUpdateFinCupom := '';
  fUpdateNFSerieD := '';
  fUpdateNFSerieDIt := '';
  fUpdateSangSupPrest := '';
  fUpdateBaseAtEst := '';

end;

destructor TAtualizacaoRetaguarda.Destroy;
begin
  vMD5Func.free;
  vMD5Func := nil;

  //Hw
  fExecHw.Close;
  fExecHw.Free;
  fExecHw := nil;

  fBuscasHw.Close;
  fBuscasHw.Free;
  fBuscasHw := nil;

  fBuscasHwPed.Close;
  fBuscasHwPed.Free;
  fBuscasHwPed := nil;

  FreeAndNil(fQuerySqlOpen);

  fTransacaoHw.Free;
  fTransacaoHw := nil;

  fConexaoHw.Connected := False;
  fConexaoHw.Free;
  fConexaoHw := nil;

  //paf
  fExecF.Close;
  fExecF.Free;
  fExecF := nil;

  fBuscasF.Close;
  fBuscasF.Free;
  fBuscasF := nil;

  fBuscasFPed.Close;
  fBuscasFPed.Free;
  fBuscasFPed := nil;

  fBuscasFPed2.Close;
  fBuscasFPed2.Free;
  fBuscasFPed2 := nil;

  fTransacaoF.Free;
  fTransacaoF := nil;

  fTransacaoFExec.Free;
  fTransacaoFExec := nil;

  fConexaoF.Connected := False;
  fConexaoF.Free;
  fConexaoF := nil;

  inherited;
end;

function TAtualizacaoRetaguarda.SqlOpen(ASql: string): TIBQuery;
begin
  fQuerySqlOpen.Close;
  fQuerySqlOpen.SQL.Text := ASql;
  fQuerySqlOpen.Open;

  Result := fQuerySqlOpen;
end;

procedure TAtualizacaoRetaguarda.VerificarVendasSemCupom(Data: TDate);
var
  ListaDias: TStrings;
  ListaDAV: TStrings;
  I: Integer;
  SqlData: string;
  vNPed: Integer;
  vTipoPed: string;
  K: Integer;
begin

  if fEmExecucao then
    Exit;

  fEmExecucao := True;
  try
    if not fConexaoHw.Connected then
      if not vDadosIniF.conectaBanco(fConexaoHw, vDadosIniF.vBancoHW, false) then
      begin
        fSleepTimeSemConxecao := 30000;
        Exit;
      end;
      fSleepTimeSemConxecao := 5000;

    fAcao := '';
    try
      if Data > 0 then //somente uma data especifica
        SqlData :=  ' and cp.data = :data'
      else
      begin
        Data := Date; // aqui tudo dos ultimos 12 meses
        SqlData :=  ' and cp.data >= :data - 365';
      end;
      fBuscasHw.Close;
      fBuscasHw.SQL.Text :=
        'select distinct cp.data from cupom cp' +
        ' left join pedvenda pv on pv.nped = cp.ped and pv.nprevenda = cp.prevenda and pv.cod_empresa = cp.cod_empresa' +
        ' where cp.cod_terminal = :cod_terminal' +
        ' and cp.nserieecf = :nserieecf' +
        ' and cp.cod_empresa = :cod_empresa' +
        ' and coalesce(cp.ped, 0) > 0 ' +
        SqlData +
        ' and pv.ncupom is null and coalesce(cp.status_cp, '''') <> ''CANCELADO''' +
        ' order by cp.data desc';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.vNumSerieEcf;
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
      fBuscasHw.ParamByName('DATA').AsDate := DateOf(Data);
      fBuscasHw.Open;

      ListaDias := TStringList.Create;
      ListaDias.Clear;
      ListaDAV := TStringList.Create;
      ListaDAV.Clear;

      fBuscasHw.First;
      while not fBuscasHw.Eof do
      begin
        ListaDias.Add(DateToStr(fBuscasHw.FieldByName('data').AsDateTime));
        fBuscasHw.Next;
      end;

      for I := 0 to ListaDias.Count - 1 do
      begin
        fBuscasHw.Close;
        fBuscasHw.SQL.Text :=
          'select cp.cod_terminal, cp.nserieecf, cp.registro, cp.cupom, cp.status_cp, cp.ped,' +
          ' cp.data, cp.ccf, cp.prevenda,  cp.paf_num_prevenda,' +
          ' pv.nped, pv.tipo, pv.ncupom, pv.status_ped,' +
          ' (select first 1 pp.n_nf from pedvenda_prod pp where pp.nped = pv.nped and pp.cod_empresa = pv.cod_empresa' +
          ' and pp.tipo = pv.tipo and pp.n_nf > 0 and coalesce(pp.status, '''') <> ''CANCELADO'')' +
          ' from cupom cp' +
          ' left join pedvenda pv on pv.nped = cp.ped and pv.nprevenda = cp.prevenda and pv.cod_empresa = cp.cod_empresa' +
          ' where cp.cod_terminal = :cod_terminal' +
          ' and cp.nserieecf = :nserieecf' +
          ' and cp.cod_empresa = :cod_empresa' +
          ' and coalesce(cp.ped, 0) > 0 ' +
          ' and cp.data = :data' +
          ' and pv.ncupom is null and coalesce(cp.status_cp, '''') <> ''CANCELADO''' +
          ' order by cp.data desc';
        fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
        fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.vNumSerieEcf;
        fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
        fBuscasHw.ParamByName('data').AsDate := StrToDate(ListaDias[I]);
        fBuscasHw.Open;

        fBuscasHw.First;
        while not fBuscasHw.Eof do
        begin
          fExecHw.Close;
          fExecHw.SQL.Text := 'select NPED, TIPO from PEDVENDA' +
            ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
            ' and NPED = :NPED';
          if (fBuscasHw.FieldByName('PREVENDA').AsInteger > 0) then
          begin
            fExecHw.SQL.Text := fExecHw.SQL.Text + ' and NPREVENDA = :NPREVENDA';
            fExecHw.ParamByName('NPREVENDA').AsInteger := fBuscasHw.FieldByName('PREVENDA').AsInteger;
          end
          else
          begin
            fExecHw.SQL.Text := fExecHw.SQL.Text + ' and PAF_NUM_PREVENDA = :PAF_NUM_PREVENDA';
            fExecHw.ParamByName('PAF_NUM_PREVENDA').AsInteger := fBuscasHw.FieldByName('PAF_NUM_PREVENDA').AsInteger;
          end;

          fExecHw.ParamByName('NPED').AsInteger := fBuscasHw.FieldByName('PED').AsInteger;
          fExecHw.Open;
          vNPed := fExecHw.FieldByName('NPED').AsInteger;
          vTipoPed := fExecHw.FieldByName('TIPO').AsString;

          fExecHw.Close;
          fExecHw.SQL.Text := 'update PEDVENDA set' +
            ' STATUS_CUPOM = ''C'',' +
            ' CODTERM_STATUS = ' + vDadosIniF.vCodTerminal + ',' +
            ' NCUPOM = :NCUPOM,' +
            ' NSERIEECF = ' + QuotedStr(vDadosIniF.vNumSerieEcf) + ',' +
            ' OPERADOR = :OPERADOR,' +
            ' DATA_CUPOM = :DATA_CUPOM,' +
            ' CCF_CUPOM  = :CCF_CUPOM' +
            ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
            ' and NPED = ' + IntToStr(vNPed) +
            ' and TIPO = ' + QuotedStr(Trim(vTipoPed));
          fExecHw.ParamByName('NCUPOM').AsInteger := fBuscasHw.FieldByName('CUPOM').AsInteger;
          fExecHw.ParamByName('OPERADOR').AsInteger := fBuscasHw.FieldByName('COD_TERMINAL').AsInteger;
          fExecHw.ParamByName('DATA_CUPOM').AsDate := fBuscasHw.FieldByName('DATA').AsDateTime;
          fExecHw.ParamByName('CCF_CUPOM').AsInteger := fBuscasHw.FieldByName('CCF').AsInteger;
          fExecHw.ExecSQL;

          ListaDAV.Add(IntToStr(fBuscasHw.FieldByName('PREVENDA').AsInteger));

          fExecHw.Close;
          fExecHw.SQL.Text := 'update ECF set' +
            ' NCUPOM = :NCUPOM,' +
            ' COD_TERMINAL = ' + vDadosIniF.vCodTerminal + ',' +
            ' NSERIETERMINAL = ' + QuotedStr(vDadosIniF.vNumSerieEcf) +
            ' where NPED = ' + IntToStr(vNPed) +
            ' and TIPO_PED = ' + QuotedStr(Trim(vTipoPed)) +
            ' and COD_EMPRESA = ' + vDadosIniF.codEmpresa;
          fExecHw.ParamByName('NCUPOM').AsInteger := fBuscasHw.FieldByName('CUPOM').AsInteger;
          fExecHw.ExecSQL;

          fExecHw.Close;
          fExecHw.SQL.Text := 'update FORMPAGAMENTO set TIP_CNT = ''C''' +
            ' where NREQUISICAO = ' + IntToStr(vNPed) +
            ' and TPDOCS = '+ QuotedStr(Trim(vTipoPed))+
            ' and COD_EMPRESA = '+vDadosIniF.codEmpresa;
          fExecHw.ExecSQL;

          //alterando o numdoc do formapagamento e do credito
          if (vDadosIniF.vEmp.vConfFormPagamento = 'PED') and (vDadosIniF.getConfSisBool('paf_ecf_form_pag_num_doc_cupom', fExecHw)) then
          begin
            fExecHw.Close;
            fExecHw.SQL.Text :=
              'update formpagamento fp set fp.ndoc = ' + QuotedStr(vDadosIni.StrZero(fBuscasHw.FieldByName('CUPOM').AsInteger, 6))+
                '||substring(fp.ndoc from 7 for (char_length(fp.ndoc) - 6 ) )'+
                ' where  fp.nrequisicao = ' + IntToStr(vNPed) +
                ' and fp.tpdocs = ' + QuotedStr(Trim(vTipoPed)) +
                ' and fp.cod_empresa = ' + vDadosIniF.codEmpresa + ' and fp.ativo = 1 and fp.tipdoc = ''S2''' +
                ' and char_length(fp.ndoc) > 5';
            fExecHw.ExecSQL;

            fBuscasHwPed.Close;
            fBuscasHwPed.SQL.Text :=
              'select n_processamento from formpagamento fp'+
                ' where  fp.nrequisicao = ' + IntToStr(vNPed) +
                ' and fp.tpdocs = ' + QuotedStr(Trim(vTipoPed)) +
                ' and fp.cod_empresa = ' + vDadosIniF.codEmpresa + ' and fp.ativo = 1 and fp.tipdoc = ''S2'' and fp.n_processamento > 0';
            fBuscasHwPed.Open;

            fBuscasHwPed.First;
            while not fBuscasHwPed.Eof do
            begin
              fExecHw.Close;
              fExecHw.SQL.Text :=
                'update controle_creditos cc set cc.n_doc_c = '+QuotedStr(vDadosIniF.StrZero(fBuscasHw.FieldByName('CUPOM').AsInteger,6))+
                '||substring(cc.n_doc_c from 7 for (char_length(cc.n_doc_c) - 6 ) )' +
                ' where cc.cod_cred = ' + IntToStr(fBuscasHwPed.FieldByName('n_processamento').AsInteger) +
                ' and cc.' + vDadosIniF.retornoPorCondicao(vDadosIniF.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIniF.codEmpresa +
                ' and char_length(cc.n_doc_c) > 5';
              fExecHw.ExecSQL;

              fBuscasHwPed.Next;
            end;
          end;

          fBuscasHw.Next;
        end;

        if fExecHw.Transaction.InTransaction then
          fExecHw.Transaction.Commit;

        for K := 0 to ListaDAV.Count - 1 do
          if (StrToIntDef(ListaDAV[K], 0) > 0) then
            vMD5Func._gravaMD5_DAV(fExecHw, StrToIntDef(ListaDAV[K], 0));
      end;

    except
      on E: Exception do
      begin
        if fBuscasHw.Transaction.InTransaction then
          fBuscasHw.Transaction.Rollback;
        vDadosIniF.registraErro('TAtualizacaoRetaguarda.VerificarVendasSemCupom. Erro: ' + e.Message);
      end;
    end;
  finally
    vDadosIniF.desconectaBanco(fConexaoHw);
    fEmExecucao := False;
  end;
end;

procedure TAtualizacaoRetaguarda._atualizarEstoque(pAlterarDataRegistro:
  Boolean = False);
begin

  if fEmExecucao then
    Exit;

  fEmExecucao := True;

  try
    try
      StrToDate(fParamDataIni);
      StrToDate(fParamDataFim);
    except
      fParamDataIni := '';
      fParamDataFim := '';
      Exit;
    end;

    if not fConexaoHw.Connected then
      if not vDadosIniF.conectaBanco(fConexaoHw, vDadosIniF.vBancoHW, false) then
      begin
        fSleepTimeSemConxecao := 30000;
        Exit;
      end;
      fSleepTimeSemConxecao := 5000;

    fAcao := '';
    fEmExecucao := True;
    try

      try
        _sincronizarPedVenda(
          fParamDataIni,
          fParamDataFim,
          'data',
          pAlterarDataRegistro);
      finally
        fTexto := '';
        ParamDataIni := '';
        ParamDataFim := '';
      end;

    finally
      vDadosIniF.desconectaBanco(fConexaoHw);
    end;
  finally
    if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
      vDadosIniF.fechaStatusProcessamento;
    fEmExecucao := False;
  end;
end;

procedure TAtualizacaoRetaguarda._montaSql;
var
  I: Integer;
  vTemp: string;
begin
  //****************  CUPOM  *********************
  fBuscasHw.Close;
  fBuscasF.Close;
  fBuscasHw.SQL.Text := 'select * from CUPOM' +
    ' where COD_TERMINAL is null and NSERIEECF is null and COD_EMPRESA is null and REGISTRO is null';
  fBuscasF.SQL.Text := fBuscasHw.SQL.Text;
  fBuscasHw.Open;
  fBuscasF.Open;

  fInsertCupom := '';
  fUpdateCupom := '';

  for I := 0 to fBuscasHw.FieldCount - 1 do
    if fBuscasF.FindField(fBuscasHw.Fields[I].FieldName) <> nil then
    begin
      fInsertCupom := fInsertCupom + ', ' + fBuscasHw.Fields[I].FieldName;
      fUpdateCupom := fUpdateCupom + ', ' + fBuscasHw.Fields[I].FieldName + ' = :' + fBuscasHw.Fields[I].FieldName;
    end;

  vTemp := StringReplace(fInsertCupom, ', ', ', :', [rfReplaceAll, rfIgnoreCase]);
  Delete(fInsertCupom, 1, 1);
  Delete(vTemp, 1, 1);
  fInsertCupom := 'insert into CUPOM (' + fInsertCupom + ', MD5, VALOR_PIS, VALOR_COFINS) values (' + vTemp + ', ''SISTEMA'', :VALOR_PIS, :VALOR_COFINS)';
  fUpdateCupom := StringReplace(fUpdateCupom, ', COD_TERMINAL = :COD_TERMINAL', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateCupom := StringReplace(fUpdateCupom, ', NSERIEECF = :NSERIEECF', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateCupom := StringReplace(fUpdateCupom, ', COD_EMPRESA = :COD_EMPRESA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateCupom := StringReplace(fUpdateCupom, ', REGISTRO = :REGISTRO', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateCupom := StringReplace(fUpdateCupom, ', CUPOM = :CUPOM', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(fUpdateCupom, 1, 1);
  fUpdateCupom := 'update CUPOM set ' + fUpdateCupom + ', VALOR_PIS = :VALOR_PIS, VALOR_COFINS = :VALOR_COFINS' +
    ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and CUPOM = :CUPOM';

  //****************  CUPOM2  *********************
  fBuscasHw.Close;
  fBuscasF.Close;
  fBuscasHw.SQL.Text := 'select * from CUPOM2' +
    ' where COD_TERMINAL is null and NSERIEECF is null and COD_EMPRESA is null and REGISTRO is null and ORDEM is null';
  fBuscasF.SQL.Text := fBuscasHw.SQL.Text;
  fBuscasHw.Open;
  fBuscasF.Open;

  fInsertCupom2 := '';
  fUpdateCupom2 := '';

  for I := 0 to fBuscasHw.FieldCount - 1 do
    if fBuscasF.FindField(fBuscasHw.Fields[I].FieldName) <> nil then
    begin
      fInsertCupom2 := fInsertCupom2 + ', ' + fBuscasHw.Fields[I].FieldName;
      fUpdateCupom2 := fUpdateCupom2 + ', ' + fBuscasHw.Fields[I].FieldName + ' = :' + fBuscasHw.Fields[I].FieldName;
    end;

  vTemp := StringReplace(fInsertCupom2, ', ', ', :', [rfReplaceAll, rfIgnoreCase]);
  Delete(fInsertCupom2, 1, 1);
  Delete(vTemp, 1, 1);
  fInsertCupom2 := 'insert into CUPOM2 (' + fInsertCupom2 + ', MD5) values (' + vTemp + ', ''SISTEMA'')';
  fUpdateCupom2 := StringReplace(fUpdateCupom2, ', COD_TERMINAL = :COD_TERMINAL', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateCupom2 := StringReplace(fUpdateCupom2, ', NSERIEECF = :NSERIEECF', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateCupom2 := StringReplace(fUpdateCupom2, ', COD_EMPRESA = :COD_EMPRESA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateCupom2 := StringReplace(fUpdateCupom2, ', REGISTRO = :REGISTRO', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateCupom2 := StringReplace(fUpdateCupom2, ', CUPOM = :CUPOM', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateCupom2 := StringReplace(fUpdateCupom2, ', ORDEM = :ORDEM', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(fUpdateCupom2, 1, 1);
  fUpdateCupom2 := 'update CUPOM2 set ' + fUpdateCupom2 +
    ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and ORDEM = :ORDEM and CUPOM = :CUPOM';

  //****************  RESUMOD  *********************
  fBuscasHw.Close;
  fBuscasF.Close;
  fBuscasHw.SQL.Text := 'select * from RESUMOD' +
    ' where COD_TERMINAL is null and NSERIEECF is null and COD_EMPRESA is null and coored is null';
  fBuscasF.SQL.Text := fBuscasHw.SQL.Text;
  fBuscasHw.Open;
  fBuscasF.Open;

  fInsertResumoD := '';
  fUpdateResumoD := '';

  for I := 0 to fBuscasHw.FieldCount - 1 do
    if fBuscasF.FindField(fBuscasHw.Fields[I].FieldName) <> nil then
    begin
      fInsertResumoD := fInsertResumoD + ', ' + fBuscasHw.Fields[I].FieldName;
      fUpdateResumoD := fUpdateResumoD + ', ' + fBuscasHw.Fields[I].FieldName + ' = :' + fBuscasHw.Fields[I].FieldName;
    end;

  vTemp := StringReplace(fInsertResumoD, ', ', ', :', [rfReplaceAll, rfIgnoreCase]);
  Delete(fInsertResumoD, 1, 1);
  Delete(vTemp, 1, 1);
  fInsertResumoD := 'insert into RESUMOD (' + fInsertResumoD + ', MD5) values (' + vTemp + ', ''SISTEMA'')';
  fUpdateResumoD := StringReplace(fUpdateResumoD, ', COD_TERMINAL = :COD_TERMINAL', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateResumoD := StringReplace(fUpdateResumoD, ', NSERIEECF = :NSERIEECF', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateResumoD := StringReplace(fUpdateResumoD, ', COD_EMPRESA = :COD_EMPRESA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateResumoD := StringReplace(fUpdateResumoD, ', COORED = :COORED', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(fUpdateResumoD, 1, 1);
  fUpdateResumoD := 'update RESUMOD set ' + fUpdateResumoD +
    ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and COORED = :COORED';

  //****************  MAPA_RESUMO_ALIQ  *********************
  fBuscasHw.Close;
  fBuscasF.Close;
  fBuscasHw.SQL.Text := 'select * from MAPA_RESUMO_ALIQ' +
    ' where COD_TERMINAL is null and NSERIEECF is null and COD_EMPRESA is null and coored is null and aliq_seq is null';
  fBuscasF.SQL.Text := fBuscasHw.SQL.Text;
  fBuscasHw.Open;
  fBuscasF.Open;

  fInsertMapaResumo := '';
  fUpdateMapaResumo := '';

  for I := 0 to fBuscasHw.FieldCount - 1 do
    if fBuscasF.FindField(fBuscasHw.Fields[I].FieldName) <> nil then
    begin
      fInsertMapaResumo := fInsertMapaResumo + ', ' + fBuscasHw.Fields[I].FieldName;
      fUpdateMapaResumo := fUpdateMapaResumo + ', ' + fBuscasHw.Fields[I].FieldName + ' = :' + fBuscasHw.Fields[I].FieldName;
    end;

  vTemp := StringReplace(fInsertMapaResumo, ', ', ', :', [rfReplaceAll, rfIgnoreCase]);
  Delete(fInsertMapaResumo, 1, 1);
  Delete(vTemp, 1, 1);
  fInsertMapaResumo := 'insert into MAPA_RESUMO_ALIQ (' + fInsertMapaResumo + ', MD5) values (' + vTemp + ', ''SISTEMA'')';
  fUpdateMapaResumo := StringReplace(fUpdateMapaResumo, ', COD_TERMINAL = :COD_TERMINAL', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateMapaResumo := StringReplace(fUpdateMapaResumo, ', NSERIEECF = :NSERIEECF', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateMapaResumo := StringReplace(fUpdateMapaResumo, ', COD_EMPRESA = :COD_EMPRESA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateMapaResumo := StringReplace(fUpdateMapaResumo, ', COORED = :COORED', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateMapaResumo := StringReplace(fUpdateMapaResumo, ', ALIQ_SEQ = :ALIQ_SEQ', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(fUpdateMapaResumo, 1, 1);
  fUpdateMapaResumo := 'update MAPA_RESUMO_ALIQ set ' + fUpdateMapaResumo +
    ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and COORED = :COORED and ALIQ_SEQ = :ALIQ_SEQ';

  //****************  DOC_NAOFISCAL_TERMINAL  *********************
  fBuscasHw.Close;
  fBuscasF.Close;
  fBuscasHw.SQL.Text := 'select * from DOC_NAOFISCAL_TERMINAL' +
    ' where COD_TERMINAL is null and NSERIEECF is null and COD_EMPRESA is null and COO_ECF is null';
  fBuscasF.SQL.Text := fBuscasHw.SQL.Text;
  fBuscasHw.Open;
  fBuscasF.Open;

  fInsertDocNaoF := '';
  fUpdateDocNaoF := '';

  for I := 0 to fBuscasHw.FieldCount - 1 do
    if fBuscasF.FindField(fBuscasHw.Fields[I].FieldName) <> nil then
    begin
      fInsertDocNaoF := fInsertDocNaoF + ', ' + fBuscasHw.Fields[I].FieldName;
      fUpdateDocNaoF := fUpdateDocNaoF + ', ' + fBuscasHw.Fields[I].FieldName + ' = :' + fBuscasHw.Fields[I].FieldName;
    end;

  vTemp := StringReplace(fInsertDocNaoF, ', ', ', :', [rfReplaceAll, rfIgnoreCase]);
  Delete(fInsertDocNaoF, 1, 1);
  Delete(vTemp, 1, 1);
  fInsertDocNaoF := 'insert into DOC_NAOFISCAL_TERMINAL (' + fInsertDocNaoF + ', MD5) values (' + vTemp + ', ''SISTEMA'')';
  fUpdateDocNaoF := StringReplace(fUpdateDocNaoF, ', COD_TERMINAL = :COD_TERMINAL', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateDocNaoF := StringReplace(fUpdateDocNaoF, ', NSERIEECF = :NSERIEECF', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateDocNaoF := StringReplace(fUpdateDocNaoF, ', COD_EMPRESA = :COD_EMPRESA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateDocNaoF := StringReplace(fUpdateDocNaoF, ', COO_ECF = :COO_ECF', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(fUpdateDocNaoF, 1, 1);
  fUpdateDocNaoF := 'update DOC_NAOFISCAL_TERMINAL set ' + fUpdateDocNaoF +
    ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and COO_ECF = :COO_ECF';

  //****************  FINCUPOM  *********************
  fBuscasHw.Close;
  fBuscasF.Close;
  fBuscasHw.SQL.Text := 'select * from FINCUPOM' +
    ' where COD_TERMINAL is null and NSERIEECF is null and COD_EMPRESA is null and REGISTRO is null and TIPO_DOC is null';
  fBuscasF.SQL.Text := fBuscasHw.SQL.Text;
  fBuscasHw.Open;
  fBuscasF.Open;

  fInsertFinCupom := '';
  fUpdateFinCupom := '';

  for I := 0 to fBuscasHw.FieldCount - 1 do
    if fBuscasF.FindField(fBuscasHw.Fields[I].FieldName) <> nil then
    begin
      fInsertFinCupom := fInsertFinCupom + ', ' + fBuscasHw.Fields[I].FieldName;
      fUpdateFinCupom := fUpdateFinCupom + ', ' + fBuscasHw.Fields[I].FieldName + ' = :' + fBuscasHw.Fields[I].FieldName;
    end;

  vTemp := StringReplace(fInsertFinCupom, ', ', ', :', [rfReplaceAll, rfIgnoreCase]);
  Delete(fInsertFinCupom, 1, 1);
  Delete(vTemp, 1, 1);
  fInsertFinCupom := 'insert into FINCUPOM (' + fInsertFinCupom + ', MD5) values (' + vTemp + ', ''SISTEMA'')';
  fUpdateFinCupom := StringReplace(fUpdateFinCupom, ', COD_TERMINAL = :COD_TERMINAL', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateFinCupom := StringReplace(fUpdateFinCupom, ', NSERIEECF = :NSERIEECF', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateFinCupom := StringReplace(fUpdateFinCupom, ', COD_EMPRESA = :COD_EMPRESA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateFinCupom := StringReplace(fUpdateFinCupom, ', REGISTRO = :REGISTRO', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateFinCupom := StringReplace(fUpdateFinCupom, ', TIPO_DOC = :TIPO_DOC', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(fUpdateFinCupom, 1, 1);
  fUpdateFinCupom := 'update FINCUPOM set ' + fUpdateFinCupom +
    ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and TIPO_DOC = :TIPO_DOC';

  //****************  NF_SERIE_D  *********************
  fBuscasHw.Close;
  fBuscasF.Close;
  fBuscasHw.SQL.Text := 'select * from NF_SERIE_D' +
    ' where NUMERONOTA is null and COD_EMPRESA is null';
  fBuscasF.SQL.Text := fBuscasHw.SQL.Text;
  fBuscasHw.Open;
  fBuscasF.Open;

  fInsertNFSerieD := '';
  fUpdateNFSerieD := '';

  for I := 0 to fBuscasHw.FieldCount - 1 do
    if fBuscasF.FindField(fBuscasHw.Fields[I].FieldName) <> nil then
    begin
      fInsertNFSerieD := fInsertNFSerieD + ', ' + fBuscasHw.Fields[I].FieldName;
      fUpdateNFSerieD := fUpdateNFSerieD + ', ' + fBuscasHw.Fields[I].FieldName + ' = :' + fBuscasHw.Fields[I].FieldName;
    end;

  vTemp := StringReplace(fInsertNFSerieD, ', ', ', :', [rfReplaceAll, rfIgnoreCase]);
  Delete(fInsertNFSerieD, 1, 1);
  Delete(vTemp, 1, 1);
  fInsertNFSerieD := 'insert into NF_SERIE_D (' + fInsertNFSerieD + ', MD5) values (' + vTemp + ', ''SISTEMA'')';
  fUpdateNFSerieD := StringReplace(fUpdateNFSerieD, ', NUMERONOTA = :NUMERONOTA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateNFSerieD := StringReplace(fUpdateNFSerieD, ', COD_EMPRESA = :COD_EMPRESA', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(fUpdateNFSerieD, 1, 1);
  fUpdateNFSerieD := 'update NF_SERIE_D set ' + fUpdateNFSerieD +
    ' where NUMERONOTA = :NUMERONOTA and COD_EMPRESA = :COD_EMPRESA';
  
  //****************  NF_SERIE_D_ITENS  *********************
  fBuscasHw.Close;
  fBuscasF.Close;
  fBuscasHw.SQL.Text := 'select * from NF_SERIE_D_ITENS' +
    ' where NUMERONOTA is null and COD_EMPRESA is null and NITEM is null and GRUPO_PROD is null and COD_PROD is null';
  fBuscasF.SQL.Text := fBuscasHw.SQL.Text;
  fBuscasHw.Open;
  fBuscasF.Open;

  fInsertNFSerieDIt := '';
  fUpdateNFSerieDIt := '';

  for I := 0 to fBuscasHw.FieldCount - 1 do
    if fBuscasF.FindField(fBuscasHw.Fields[I].FieldName) <> nil then
    begin
      fInsertNFSerieDIt := fInsertNFSerieDIt + ', ' + fBuscasHw.Fields[I].FieldName;
      fUpdateNFSerieDIt := fUpdateNFSerieDIt + ', ' + fBuscasHw.Fields[I].FieldName + ' = :' + fBuscasHw.Fields[I].FieldName;
    end;

  vTemp := StringReplace(fInsertNFSerieDIt, ', ', ', :', [rfReplaceAll, rfIgnoreCase]);
  Delete(fInsertNFSerieDIt, 1, 1);
  Delete(vTemp, 1, 1);
  fInsertNFSerieDIt := 'insert into NF_SERIE_D_ITENS (' + fInsertNFSerieDIt + ', MD5) values (' + vTemp + ', ''SISTEMA'')';
  fUpdateNFSerieDIt := StringReplace(fUpdateNFSerieDIt, ', NUMERONOTA = :NUMERONOTA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateNFSerieDIt := StringReplace(fUpdateNFSerieDIt, ', COD_EMPRESA = :COD_EMPRESA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateNFSerieDIt := StringReplace(fUpdateNFSerieDIt, ', NITEM = :NITEM', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateNFSerieDIt := StringReplace(fUpdateNFSerieDIt, ', GRUPO_PROD = :GRUPO_PROD', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateNFSerieDIt := StringReplace(fUpdateNFSerieDIt, ', COD_PROD = :COD_PROD', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(fUpdateNFSerieDIt, 1, 1);
  fUpdateNFSerieDIt := 'update NF_SERIE_D_ITENS set ' + fUpdateNFSerieDIt +
    ' where NUMERONOTA = :NUMERONOTA and COD_EMPRESA = :COD_EMPRESA and NITEM = :NITEM and GRUPO_PROD = :GRUPO_PROD and COD_PROD = :COD_PROD';

  //****************  SANGSUP  *********************
  fBuscasHw.Close;
  fBuscasF.Close;
  fBuscasHw.SQL.Text := 'select * from SANGSUP' +
    ' where COD_TERMINAL is null and NSERIEECF is null and COD_EMPRESA is null and NREG is null and SANGSUPRIMENTO is null';
  fBuscasF.SQL.Text := fBuscasHw.SQL.Text;
  fBuscasHw.Open;
  fBuscasF.Open;

  fInsertSangSupPrest := '';
  fUpdateSangSupPrest := '';

  for I := 0 to fBuscasHw.FieldCount - 1 do
    if fBuscasF.FindField(fBuscasHw.Fields[I].FieldName) <> nil then
    begin
      fInsertSangSupPrest := fInsertSangSupPrest + ', ' + fBuscasHw.Fields[I].FieldName;
      fUpdateSangSupPrest := fUpdateSangSupPrest + ', ' + fBuscasHw.Fields[I].FieldName + ' = :' + fBuscasHw.Fields[I].FieldName;
    end;

  vTemp := StringReplace(fInsertSangSupPrest, ', ', ', :', [rfReplaceAll, rfIgnoreCase]);
  Delete(fInsertSangSupPrest, 1, 1);
  Delete(vTemp, 1, 1);
  fInsertSangSupPrest := 'insert into SANGSUP (' + fInsertSangSupPrest + ') values (' + vTemp + ')';
  fUpdateSangSupPrest := StringReplace(fUpdateSangSupPrest, ', COD_TERMINAL = :COD_TERMINAL', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateSangSupPrest := StringReplace(fUpdateSangSupPrest, ', NSERIEECF = :NSERIEECF', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateSangSupPrest := StringReplace(fUpdateSangSupPrest, ', COD_EMPRESA = :COD_EMPRESA', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateSangSupPrest := StringReplace(fUpdateSangSupPrest, ', NREG = :NREG', '', [rfReplaceAll, rfIgnoreCase]);
  fUpdateSangSupPrest := StringReplace(fUpdateSangSupPrest, ', SANGSUPRIMENTO = :SANGSUPRIMENTO', '', [rfReplaceAll, rfIgnoreCase]);
  Delete(fUpdateSangSupPrest, 1, 1);
  fUpdateSangSupPrest := 'update SANGSUP set ' + fUpdateSangSupPrest +
    ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and NREG = :NREG and SANGSUPRIMENTO = :SANGSUPRIMENTO';

  //****************  PEDVENDA  *********************

  fInsertPedVenda :=
    'insert into PEDVENDA (NPED, TIPO, COD_EMPRESA, STATUS_PED, TIPV, TIPOR, OBS_PED, NCUPOM, CCF_CUPOM, DATA_CUPOM, OPERADOR, ACRESCIMO, DESCONTO, NSERIEECF, DATA_PED, DATA_FECH,' +
      ' HORAABERTURA, MINABERTURA, HORAFECHAMENTO, MINFECHAMENTO, TOT_PROD, TOT_SERV, VALOR_TOTAL, OBS_OS, TIPO_OS, COD_VENDEDOR, COD_CLIENTE, COD_COND_PAG)' +
      ' values (:NPED, :TIPO, :COD_EMPRESA, :STATUS_PED, :TIPV, :TIPOR, :OBS_PED, :NCUPOM, :CCF_CUPOM, :DATA_CUPOM, :OPERADOR, :ACRESCIMO, :DESCONTO, :NSERIEECF, :DATA_PED, :DATA_FECH,' +
      ' :HORAABERTURA, :MINABERTURA, :HORAFECHAMENTO, :MINFECHAMENTO, :TOT_PROD, :TOT_SERV, :VALOR_TOTAL, :OBS_OS, :TIPO_OS, :COD_VENDEDOR, :COD_CLIENTE, :COD_COND_PAG)';

  //****************  PEDVENDA_PROD  *********************

  fInsertPedVendaProd :=
    'insert into PEDVENDA_PROD (COD_EMPRESA, TIPO, NPED, COD_VENDEDOR, TP_NF_PED, SIT_ATD, NITEM, GRUPO_PROD, COD_PROD, COD_GRADE, DESCR_PROD_PED, NUM_FAB_PROD, QUANT_PED_ITEM, VLTOT_PED_ITEM,' +
      ' VLUN_PED_ITEM, VLUN_ORIG, VLUN_PED_NF, VLTOT_PED_NF, RATEIO_DESC, RATEIO_ACRESC, ALIQUOTA_CP, DESC_ITEM, ACRESC_ITEM, PCUST_C, PCUST_R, PCUST_MC, PCUST_MR, ICMANT_SUB, CODIGO_NOP, NOME_VEND,' +
      ' TP_DESCACRES, NAT_DESCACRES, VALOR_DESCACRES, UNIDADE)' +
      ' values (:COD_EMPRESA, :TIPO, :NPED, :COD_VENDEDOR, :TP_NF_PED, :SIT_ATD, :NITEM, :GRUPO_PROD, :COD_PROD, :COD_GRADE, :DESCR_PROD_PED, :NUM_FAB_PROD, :QUANT_PED_ITEM, :VLTOT_PED_ITEM,' +
      ' :VLUN_PED_ITEM, :VLUN_ORIG, :VLUN_PED_NF, :VLTOT_PED_NF, :RATEIO_DESC, :RATEIO_ACRESC, :ALIQUOTA_CP, :DESC_ITEM, :ACRESC_ITEM, :PCUST_C, :PCUST_R, :PCUST_MC, :PCUST_MR, :ICMANT_SUB, :CODIGO_NOP, :NOME_VEND,' +
      ' :TP_DESCACRES, :NAT_DESCACRES, :VALOR_DESCACRES, :UNIDADE)';

  //****************  PEDVENDA_SERV  *********************

  fInsertPedVendaServ :=
    'insert into PEDVENDA_SERV (COD_EMPRESA, TIPO, NPED, COD_VENDEDOR, COD_SERVICO, CODIGO_NOP, NITEM, QUANT_SERV_PED, VALOR_TOT_SERV, VALOR_UN_SERV, VLUN_ORIG, RATEIO_DESC, RATEIO_ACRESC, DESC_SERV_PED, COD_VENDEDOR1, DESC_ITEM, ACRESC_ITEM, NOME_VEND)' +
      ' values (:COD_EMPRESA, :TIPO, :NPED, :COD_VENDEDOR, :COD_SERVICO, :CODIGO_NOP, :NITEM, :QUANT_SERV_PED, :VALOR_TOT_SERV, :VALOR_UN_SERV, :VLUN_ORIG, :RATEIO_DESC, :RATEIO_ACRESC, :DESC_SERV_PED, :COD_VENDEDOR1, :DESC_ITEM, :ACRESC_ITEM, :NOME_VEND)';

  //******************************************************

  //**************  PAF_DOC_BASE_ATEST *******************

  fInsertBaseAtEst :=
    'insert into PAF_DOC_BASE_ATEST (DATA_AT, COD_EMPRESA, NSERIEECF, HORA_AT, MF_ADICIONAL, TIPO_ECF, MARCA_ECF, MODELO_ECF, MD5)' +
      ' values (:DATA_AT, :COD_EMPRESA, :NSERIEECF, :HORA_AT, :MF_ADICIONAL, :TIPO_ECF, :MARCA_ECF, :MODELO_ECF, :MD5)';

  fUpdateBaseAtEst :=
    ' update PAF_DOC_BASE_ATEST set NSERIEECF = :NSERIEECF, HORA_AT = :HORA_AT,' +
      ' MF_ADICIONAL = :MF_ADICIONAL, TIPO_ECF = :TIPO_ECF, MARCA_ECF = :MARCA_ECF, MODELO_ECF = :MODELO_ECF, MD5 = :MD5' +
      ' where DATA_AT = :DATA_AT and COD_EMPRESA = :COD_EMPRESA';
  //******************************************************
end;

procedure TAtualizacaoRetaguarda._registraErro(pErro: string);
begin
  vDadosIniF.registraErro(pErro);
end;

procedure TAtualizacaoRetaguarda._setEnviadoRetA;
var
  vLista: TStringList;
  I: Integer;
begin

  if fEmExecucao then
    Exit;

  fEmExecucao := True;
  try
    if not fConexaoF.Connected then
      if not vDadosIniF.conectaBanco(fConexaoF, vDadosIniF.vBancoFiscal, false) then
      begin
        fSleepTimeSemConxecao := 30000;
        Exit;
      end;
      fSleepTimeSemConxecao := 5000;
      
    try
      vLista := TStringList.Create;
      vLista.Clear;
      vLista.Add('CUPOM');
      vLista.Add('CUPOM2');
      vLista.Add('RESUMOD');
      vLista.Add('MAPA_RESUMO_ALIQ');
      vLista.Add('DOC_NAOFISCAL_TERMINAL');
      vLista.Add('FINCUPOM');
      vLista.Add('SANGSUP');

      for I := 0 to vLista.Count - 1 do
      begin
        try
          fExecF.Close;
          fExecF.SQL.Text := 'update ' + vLista[I] + ' set ENVIADO_RET = ''A''' +
            ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and ENVIADO_RET <> ''S''';
          fExecF.ParamByName('COD_TERMINAL').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
          fExecF.ParamByName('NSERIEECF').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
          fExecF.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
          fExecF.ExecSQL;

          if fExecF.Transaction.InTransaction then
            fExecF.Transaction.Commit;

          fExecF.Close;
          fExecF.SQL.Text := 'update ' + vLista[I] + ' set ENVIADO_RET = ''A''' +
            ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and ENVIADO_RET is null';
          fExecF.ParamByName('COD_TERMINAL').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
          fExecF.ParamByName('NSERIEECF').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
          fExecF.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
          fExecF.ExecSQL;

          if fExecF.Transaction.InTransaction then
            fExecF.Transaction.Commit;
        except
        end;
      end;

      vLista.Clear;
      vLista.Add('NF_SERIE_D');
      vLista.Add('NF_SERIE_D_ITENS');
      for I := 0 to vLista.Count - 1 do
      begin
        try
          fExecF.Close;
          fExecF.SQL.Text := 'update ' + vLista[I] + ' set ENVIADO_RET = ''A''' +
            ' where COD_EMPRESA = :COD_EMPRESA and ENVIADO_RET <> ''S''';
          fExecF.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
          fExecF.ExecSQL;

          if fExecF.Transaction.InTransaction then
            fExecF.Transaction.Commit;

          fExecF.Close;
          fExecF.SQL.Text := 'update ' + vLista[I] + ' set ENVIADO_RET = ''A''' +
            ' where COD_EMPRESA = :COD_EMPRESA and ENVIADO_RET is null';
          fExecF.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
          fExecF.ExecSQL;

          if fExecF.Transaction.InTransaction then
            fExecF.Transaction.Commit;
        except
        end;
      end;

    finally
      vDadosIniF.desconectaBanco(fConexaoF);
    end;
  finally
    fEmExecucao := False;
  end;
end;

procedure TAtualizacaoRetaguarda._sincronizarAliq;
var
  I: Integer;
begin
//sincronizar as aliquotas da ecf
end;

procedure TAtualizacaoRetaguarda._sincronizarCupom(pCampo2: Boolean = False);
var
  I, vNPed, vMod: Integer;
  vStatusCP, vTipoPed: string;
  vSqlTmp: string;

  procedure definirPisCofins;
  begin

    fExecF.Close;
    fExecF.SQL.Text :=
      'select sum(cp2.valor_pis) valor_pis, sum(cp2.valor_cofins) valor_cofins from cupom2 cp2' +
      ' where cp2.cod_terminal = :cod_terminal and cp2.nserieecf = :nserie' +
      ' and cp2.cod_empresa = :cod_empresa and cp2.cupom = :cupom and cp2.ordem = :ordem';
    fExecF.ParamByName('cod_terminal').AsInteger := fBuscasF.FieldByName('cod_terminal').AsInteger;
    fExecF.ParamByName('nserie').AsString := fBuscasF.FieldByName('nserieecf').AsString;
    fExecF.ParamByName('cod_empresa').AsInteger := fBuscasF.FieldByName('cod_empresa').AsInteger;
    fExecF.ParamByName('cupom').AsInteger := fBuscasF.FieldByName('cupom').AsInteger;
    fExecF.ParamByName('ordem').AsInteger := fBuscasF.FieldByName('registro').AsInteger;
    fExecF.Open;

    try
      fExecHw.ParamByName('valor_pis').AsCurrency := fExecF.FieldByName('valor_pis').AsFloat;
      fExecHw.ParamByName('valor_cofins').AsCurrency := fExecF.FieldByName('valor_cofins').AsFloat;
    except
    end;
  end;

begin
  try
    // Selecionando todos os registros onde foram inseridos ou alterados
    fBuscasF.Close;
    fBuscasF.SQL.Text :=
      'select * from CUPOM where cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
      ' and cod_empresa = ' + vDadosIniF.codEmpresa;
    if pCampo2 then
      fBuscasF.SQL.Text := fBuscasF.SQL.Text + ' and enviado_ret2 = ''A'' '
    else
      fBuscasF.SQL.Text := fBuscasF.SQL.Text + ' and enviado_ret = ''A'' ';
    fBuscasF.Open;

    fBuscasF.FetchAll;
    fMax := fBuscasF.RecordCount;
    fPos := 0;

    if fMax <= 10 then vMod := 1
    else if fMax <= 100 then vMod := 10
    else if fMax <= 500 then vMod := 50
    else vMod := 100;

    fBuscasF.First;
    while not fBuscasF.Eof do
    begin
      fTexto := 'Cupom Fiscal';

      //Selecionando registro no retaguarda para definir se serão inseridos ou alterados
      fBuscasHw.Close;
      fBuscasHw.SQL.Text := 'select COD_TERMINAL, NSERIEECF, COD_EMPRESA, REGISTRO, CUPOM from CUPOM' +
      	' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and CUPOM = :CUPOM';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
      fBuscasHw.ParamByName('CUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
      fBuscasHw.Open;

      if fBuscasHw.IsEmpty then
        fExecHw.SQL.Text := fInsertCupom
      else
        fExecHw.SQL.Text := fUpdateCupom;

      // Alterando/inserindo registros na tabela
      fExecHw.Close;
      for I:= 0 to fExecHw.Params.Count - 1 do
        if Trim(fExecHw.Params[I].Name) = 'NSERIEECF' then
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            vDadosIniF.decodifica(fBuscasF.FieldByName(fExecHw.Params[I].Name).Value)
        else if (Trim(fExecHw.Params[I].Name) <> 'VALOR_PIS') and (Trim(fExecHw.Params[I].Name) <> 'VALOR_COFINS')then
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            fBuscasF.FieldByName(fExecHw.Params[I].Name).Value;

      definirPisCofins;

      fExecHw.ExecSQL;

      if fExecHw.Transaction.InTransaction then
        fExecHw.Transaction.Commit;

      
      if (fBuscasF.FieldByName('NPED_ORC').AsInteger > 0) then
      begin
        if Trim(fBuscasF.FieldByName('STATUS_CP').AsString) = 'CANCELADO' then
        begin
            fExecHw.Close;
            fExecHw.SQL.Text := 'update PEDVENDA set NSERIEECF = null' +
              ', NCUPOM = null ' +
              ', DATA_CUPOM = null ' +
              ', operador = null '+
              ', CCF_CUPOM = null' +
              ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
              ' and NPED = ' + IntToStr(fBuscasF.FieldByName('NPED_ORC').AsInteger) +
              ' and TIPO = ' + QuotedStr('ORC');
            fExecHw.ExecSQL;
        end
        else
        begin
            fExecHw.Close;
            fExecHw.SQL.Text := 'update PEDVENDA set' +
              ' NCUPOM = :NCUPOM,' +
              ' NSERIEECF = ' + QuotedStr(vDadosIniF.vNumSerieEcf) + ',' +
              ' OPERADOR = :OPERADOR,' +
              ' DATA_CUPOM = :DATA_CUPOM,' +
              ' CCF_CUPOM  = :CCF_CUPOM' +
              ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
              ' and NPED = ' + IntToStr(fBuscasF.FieldByName('NPED_ORC').AsInteger) +
              ' and TIPO = ' + QuotedStr('ORC');
            fExecHw.ParamByName('NCUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
            fExecHw.ParamByName('OPERADOR').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
            fExecHw.ParamByName('DATA_CUPOM').AsDate := fBuscasF.FieldByName('DATA').AsDateTime;
            fExecHw.ParamByName('CCF_CUPOM').AsInteger := fBuscasF.FieldByName('CCF').AsInteger;
            fExecHw.ExecSQL;
        end;    
        if fExecHw.Transaction.InTransaction then
          fExecHw.Transaction.Commit;
          
        _sincronizarPedVenda(
          IntToStr(fBuscasF.FieldByName('REGISTRO').AsInteger),
          IntToStr(fBuscasF.FieldByName('CUPOM').AsInteger), 'registro');
      end
      else
      // Testando se o cupom foi emitido de um PEDVENDA
      //   caso tenha sido emitido de um registro da tabela PEDVENDA o sistema atualiza os dados do cupom na PEDVENDA e outras tabelas
      //   caso o cupom tenha sido feito direto no else o sistem irá chamar um metodo para criar um PEDVENDA e baixar o estoque, ou voltar dependendo do status do cupom
      if (fBuscasF.FieldByName('PREVENDA').AsInteger > 0) or (fBuscasF.FieldByName('PAF_NUM_PREVENDA').AsInteger > 0) then
      begin
        fExecHw.Close;
        fExecHw.SQL.Text := 'select NPED, TIPO from PEDVENDA' +
          ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
          ' and NPED = :NPED';
        if (fBuscasF.FieldByName('PREVENDA').AsInteger > 0) then
        begin
          fExecHw.SQL.Text := fExecHw.SQL.Text + ' and NPREVENDA = :NPREVENDA';
          fExecHw.ParamByName('NPREVENDA').AsInteger := fBuscasF.FieldByName('PREVENDA').AsInteger;
        end
        else
        begin
          fExecHw.SQL.Text := fExecHw.SQL.Text + ' and PAF_NUM_PREVENDA = :PAF_NUM_PREVENDA';
          fExecHw.ParamByName('PAF_NUM_PREVENDA').AsInteger := fBuscasF.FieldByName('PAF_NUM_PREVENDA').AsInteger;
        end;

        fExecHw.ParamByName('NPED').AsInteger := fBuscasF.FieldByName('PED').AsInteger;
        fExecHw.Open;
        vNPed := fExecHw.FieldByName('NPED').AsInteger;
        vTipoPed := fExecHw.FieldByName('TIPO').AsString;

        if (vNPed > 0) and (Trim(vTipoPed) <> '') then
        begin
          if Trim(fBuscasF.FieldByName('STATUS_CP').AsString) = 'CANCELADO' then
          begin
            fExecHw.Close;
            fExecHw.SQL.Text := 'update PEDVENDA set NSERIEECF = null' +
              ', NCUPOM = null ' +
              ', DATA_CUPOM = null ' +
              ', operador = null '+
              ', STATUS_CUPOM = null '+
              ', CODTERM_STATUS = null '+
              ', CCF_CUPOM = null' +
              ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
              ' and NPED = ' + IntToStr(vNPed) +
              ' and TIPO = ' + QuotedStr(Trim(vTipoPed));
            fExecHw.ExecSQL;

            fExecHw.Close;
            fExecHw.SQL.Text := 'update ECF set NCUPOM = null ' +
              ', COD_TERMINAL = null' +
              ', NSERIETERMINAL = null' +
              ' where NPED = ' + IntToStr(vNPed) +
              ' and TIPO_PED = ' + QuotedStr(Trim(vTipoPed)) +
              ' and COD_EMPRESA = ' + vDadosIniF.codEmpresa;
            fExecHw.ExecSQL;

            if Trim(vTipoPed) = 'REQ' then
            begin
              fExecHw.Close;
              fExecHw.SQL.Text := 'update REQVENDA set NSERIEECF = null' +
                ', NCUPOM = null' +
                ', OPERADOR = null'+
                ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
                ' and NREQ = ' + IntToStr(vNPed);
              fExecHw.ExecSQL;
            end
            else
            begin
              fExecHw.Close;
              fExecHw.SQL.Text := 'update ORDEM_SERV set NSERIEECF = null' +
                ', NCUPOM = null' +
                ', OPERADOR = null'+
                ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
                ' and N_OS = ' + IntToStr(vNPed);
              fExecHw.ExecSQL;
						end;

						if fExecHw.Transaction.InTransaction then
							fExecHw.Transaction.Commit;

						if (fBuscasF.FieldByName('PREVENDA').AsInteger > 0) then
							vMD5Func._gravaMD5_DAV(fExecHw, fBuscasF.FieldByName('PREVENDA').AsInteger);
          end
          else
          begin
            fExecHw.Close;
            fExecHw.SQL.Text := 'update PEDVENDA set' +
              ' STATUS_CUPOM = ''C'',' +
              ' CODTERM_STATUS = ' + vDadosIniF.vCodTerminal + ',' +
              ' NCUPOM = :NCUPOM,' +
              ' NSERIEECF = ' + QuotedStr(vDadosIniF.vNumSerieEcf) + ',' +
              ' OPERADOR = :OPERADOR,' +
              ' DATA_CUPOM = :DATA_CUPOM,' +
              ' CCF_CUPOM  = :CCF_CUPOM' +
              ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
              ' and NPED = ' + IntToStr(vNPed) +
              ' and TIPO = ' + QuotedStr(Trim(vTipoPed));
            fExecHw.ParamByName('NCUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
            fExecHw.ParamByName('OPERADOR').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
            fExecHw.ParamByName('DATA_CUPOM').AsDate := fBuscasF.FieldByName('DATA').AsDateTime;
            fExecHw.ParamByName('CCF_CUPOM').AsInteger := fBuscasF.FieldByName('CCF').AsInteger;
            fExecHw.ExecSQL;

            if fExecHw.Transaction.InTransaction then
							fExecHw.Transaction.Commit;

						if (fBuscasF.FieldByName('PREVENDA').AsInteger > 0) then
							vMD5Func._gravaMD5_DAV(fExecHw, fBuscasF.FieldByName('PREVENDA').AsInteger);

            fExecHw.Close;
            fExecHw.SQL.Text := 'update ECF set' +
              ' NCUPOM = :NCUPOM,' +
              ' COD_TERMINAL = ' + vDadosIniF.vCodTerminal + ',' +
              ' NSERIETERMINAL = ' + QuotedStr(vDadosIniF.vNumSerieEcf) +
              ' where NPED = ' + IntToStr(vNPed) +
              ' and TIPO_PED = ' + QuotedStr(Trim(vTipoPed)) +
              ' and COD_EMPRESA = ' + vDadosIniF.codEmpresa;
            fExecHw.ParamByName('NCUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
            fExecHw.ExecSQL;

            if fExecHw.Transaction.InTransaction then
              fExecHw.Transaction.Commit;

            fExecHw.Close;
            fExecHw.SQL.Text := 'update FORMPAGAMENTO set TIP_CNT = ''C''' +
              ' where NREQUISICAO = ' + IntToStr(vNPed) +
              ' and TPDOCS = '+ QuotedStr(Trim(vTipoPed))+
              ' and COD_EMPRESA = '+vDadosIniF.codEmpresa;
            fExecHw.ExecSQL;

            //alterando o numdoc do formapagamento e do credito
            if (vDadosIniF.vEmp.vConfFormPagamento = 'PED') and (vDadosIniF.getConfSisBool('paf_ecf_form_pag_num_doc_cupom', fExecHw)) then
            begin
              fExecHw.Close;
              fExecHw.SQL.Text :=
                'update formpagamento fp set fp.ndoc = ' + QuotedStr(vDadosIni.StrZero(fBuscasF.FieldByName('CUPOM').AsInteger, 6))+
                  '||substring(fp.ndoc from 7 for (char_length(fp.ndoc) - 6 ) )'+
                  ' where  fp.nrequisicao = ' + IntToStr(vNPed) +
                  ' and fp.tpdocs = ' + QuotedStr(Trim(vTipoPed)) +
                  ' and fp.cod_empresa = ' + vDadosIniF.codEmpresa + ' and fp.ativo = 1 and fp.tipdoc = ''S2''' +
                  ' and char_length(fp.ndoc) > 5';
              fExecHw.ExecSQL;

              fBuscasHw.Close;
              fBuscasHw.SQL.Text :=
                'select n_processamento from formpagamento fp'+
                  ' where  fp.nrequisicao = ' + IntToStr(vNPed) +
                  ' and fp.tpdocs = ' + QuotedStr(Trim(vTipoPed)) +
                  ' and fp.cod_empresa = ' + vDadosIniF.codEmpresa + ' and fp.ativo = 1 and fp.tipdoc = ''S2'' and fp.n_processamento > 0';
              fBuscasHw.Open;

              fBuscasHw.First;
              while not fBuscasHw.Eof do
              begin
                fExecHw.Close;
                fExecHw.SQL.Text :=
                  'update controle_creditos cc set cc.n_doc_c = '+QuotedStr(vDadosIniF.StrZero(fBuscasF.FieldByName('CUPOM').AsInteger,6))+
                  '||substring(cc.n_doc_c from 7 for (char_length(cc.n_doc_c) - 6 ) )' +
                  ' where cc.cod_cred = ' + IntToStr(fBuscasHw.FieldByName('n_processamento').AsInteger) +
                  ' and cc.' + vDadosIniF.retornoPorCondicao(vDadosIniF.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = ' + vDadosIniF.codEmpresa +
                  ' and char_length(cc.n_doc_c) > 5';
                fExecHw.ExecSQL;

                fBuscasHw.Next;
              end;
            end;

            if fExecHw.Transaction.InTransaction then
              fExecHw.Transaction.Commit;

            if Trim(vTipoPed) = 'REQ' then
            begin
              fExecHw.Close;
              fExecHw.SQL.Text := 'update REQVENDA set NSERIEECF = ' + QuotedStr(vDadosIniF.vNumSerieEcf) +
                ', NCUPOM = :NCUPOM' +
                ', OPERADOR = :OPERADOR'+
                ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
                ' and NREQ = ' + IntToStr(vNPed);
              fExecHw.ParamByName('NCUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
              fExecHw.ParamByName('OPERADOR').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
              fExecHw.ExecSQL;
            end
            else
            begin
              fExecHw.Close;
              fExecHw.SQL.Text := 'update ORDEM_SERV set NSERIEECF = ' + QuotedStr(vDadosIniF.vNumSerieEcf) +
                ', NCUPOM = :NCUPOM' +
                ', OPERADOR = :OPERADOR'+
                ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
                ' and N_OS = ' + IntToStr(vNPed);
              fExecHw.ParamByName('NCUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
              fExecHw.ParamByName('OPERADOR').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
              fExecHw.ExecSQL;
            end;

            if fExecHw.Transaction.InTransaction then
              fExecHw.Transaction.Commit;
          end;
        end;
      end
      else
      begin
        _sincronizarPedVenda(
          IntToStr(fBuscasF.FieldByName('REGISTRO').AsInteger),
          IntToStr(fBuscasF.FieldByName('CUPOM').AsInteger), 'registro');
      end;

      //Alterando o status de envio do registro
      fExecF.Close;
      if pCampo2 then
        fExecF.SQL.Text := 'update CUPOM set ENVIADO_RET2 = ''S'''
      else
        fExecF.SQL.Text := 'update CUPOM set ENVIADO_RET = ''S''';
      fExecF.SQL.Text := fExecF.SQL.Text +
        ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and CUPOM = :CUPOM';
      fExecF.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fExecF.ParamByName('NSERIEECF').AsString := fBuscasF.FieldByName('NSERIEECF').AsString;
      fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fExecF.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
      fExecF.ParamByName('CUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
      fExecF.ExecSQL;

      if fExecF.Transaction.InTransaction then
        fExecF.Transaction.Commit;

      //Gerando md5 do registro
      fBuscasHw.Close;
      fBuscasHw.SQL.Text :=
        'select cp.nserieecf, imp.mf_adicional, cniee.modelo_ecf, imp.cod_proprietario,' +
        ' cp.ccf, cp.cupom, cp.data, cp.total subtotal, cp.valor_desc, ''V'' ind_tp_desc,' +
        ' cp.valor_acres, ''V'' ind_tp_acresc, cp.valorcupom, cp.status_cp, 0 cance_acres_subt,' +
        ' cp.acres_desc, cp.nome_cliente, cp.cpfcgc, cp.md5' +
        ' from cupom cp' +
        ' inner join terminal_impressoras imp on imp.cod_terminal = cp.cod_terminal and imp.num_serie_ecf = cp.nserieecf and imp.cod_empresa = cp.cod_empresa and imp.atual = ''S''' +
        ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
        ' where cp.COD_TERMINAL = :COD_TERMINAL and cp.NSERIEECF = :NSERIEECF and cp.COD_EMPRESA = :COD_EMPRESA and cp.REGISTRO = :REGISTRO and cp.CUPOM = :CUPOM';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
      fBuscasHw.ParamByName('CUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
      fBuscasHw.Open;

      if not fBuscasHw.IsEmpty then
        vMD5Func._gravaMD5_RegistrosPAF( fExecHw,
          Trim(fBuscasHw.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('ccf').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('cupom').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('data').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('subtotal').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('valor_desc').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('ind_tp_desc').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('valor_acres').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('ind_tp_acresc').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('valorcupom').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('status_cp').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('cance_acres_subt').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('acres_desc').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('nome_cliente').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('cpfcgc').AsString) + '|',
          'CUPOM',
          ' COD_TERMINAL = ' + IntToStr(fBuscasF.FieldByName('COD_TERMINAL').AsInteger) +
          ' AND NSERIEECF = ' + QuotedStr(vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString)) +
          ' AND COD_EMPRESA = ' + IntToStr(fBuscasF.FieldByName('COD_EMPRESA').AsInteger) +
          ' AND REGISTRO = ' + IntToStr(fBuscasF.FieldByName('REGISTRO').AsInteger) +
          ' AND CUPOM = ' + IntToStr(fBuscasF.FieldByName('CUPOM').AsInteger)
        );
//      fBuscasHw.Close;
//      fBuscasHw.Open;
//
//      if not fBuscasHw.IsEmpty then
//        vMD5Func._gravaMD5_Cupom( fExecHw,
//          fBuscasHw.FieldByName('CUPOM').AsInteger,
//          fBuscasHw.FieldByName('COD_TERMINAL').AsInteger,
//          fBuscasHw.FieldByName('REGISTRO').AsInteger,
//          fBuscasHw.FieldByName('NSERIEECF').AsString);

      fBuscasF.Next;
      fPos := fPos + 1;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        if ((fPos mod vMod) = 0) or (fBuscasF.Eof) then
          vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
    end;

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarCupom. Erro: ' + e.Message);
    end;
  end;
end;

procedure TAtualizacaoRetaguarda._sincronizarCupom2(pCampo2: Boolean = False);
var
  I, vMod: Integer;
  Conf: TConfig_sistema_class;
  CST_50_BaseZero: Boolean;
  StrPisCofins: string;
begin
  try
    with TConfig_sistema_class.getConf('nf_piscofins_cst_05_revenda_base_zero', fBuscasHw, vDadosIniF.cod_empresa) do
      CST_50_BaseZero := value1_f = 1;

    fBuscasF.Close;
    fBuscasF.SQL.Text :=
      'select * from CUPOM2 where cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
      ' and cod_empresa = ' + vDadosIniF.codEmpresa;
    if pCampo2 then
      fBuscasF.SQL.Text := fBuscasF.SQL.Text + ' and enviado_ret2 = ''A'' '
    else
      fBuscasF.SQL.Text := fBuscasF.SQL.Text + ' and enviado_ret = ''A'' ';
    fBuscasF.Open;

    fBuscasF.FetchAll;
    fMax := fBuscasF.RecordCount;
    fPos := 0;

    if fMax <= 10 then vMod := 1
    else if fMax <= 100 then vMod := 10
    else if fMax <= 500 then vMod := 50
    else vMod := 100;

    fBuscasF.First;
    while not fBuscasF.Eof do
    begin
      fTexto := 'Itens do Cupom';

      fBuscasHw.Close;
      fBuscasHw.SQL.Text := 'select COD_TERMINAL, NSERIEECF, COD_EMPRESA, REGISTRO, ORDEM, CUPOM, NITEM from CUPOM2' +
      	' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and ORDEM = :ORDEM and CUPOM = :CUPOM';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
      fBuscasHw.ParamByName('ORDEM').AsInteger := fBuscasF.FieldByName('ORDEM').AsInteger;
      fBuscasHw.ParamByName('CUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
      fBuscasHw.Open;

      if fBuscasHw.IsEmpty then
        fExecHw.SQL.Text := fInsertCupom2
      else
        fExecHw.SQL.Text := fUpdateCupom2;

      // Alterando/inserindo registros na tabela
      if not (Assigned(fExecHw.Params.FindParam('CST_PIS')) and
              Assigned(fExecHw.Params.FindParam('BASE_PIS')) and
              Assigned(fExecHw.Params.FindParam('VALOR_PIS')) and
              Assigned(fExecHw.Params.FindParam('BASE_COFINS')) and
              Assigned(fExecHw.Params.FindParam('VALOR_COFINS'))) then //caso nao exista os parametros
        CST_50_BaseZero := False;

      fExecHw.Close;
      for I:= 0 to fExecHw.Params.Count - 1 do
        if Trim(fExecHw.Params[I].Name) = 'NSERIEECF' then
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            vDadosIniF.decodifica(fBuscasF.FieldByName(fExecHw.Params[I].Name).Value)
        else
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            fBuscasF.FieldByName(fExecHw.Params[I].Name).Value;

      StrPisCofins := '';
      if CST_50_BaseZero then
        if fExecHw.ParamByName('CST_PIS').AsString = '05' then
        begin
          fExecHw.ParamByName('BASE_PIS').AsFloat := 0;
          fExecHw.ParamByName('VALOR_PIS').AsFloat := 0;
          fExecHw.ParamByName('BASE_COFINS').AsFloat := 0;
          fExecHw.ParamByName('VALOR_COFINS').AsFloat := 0;

          fExecF.Close;
          fExecF.SQL.Text :=  Format('update cupom set enviado_ret2 = ''A''' +
                                     ' where cod_terminal = %d' +
                                     ' and nserieecf = %s' +
                                     ' and cod_empresa = %d' +
                                     ' and registro = %d' +
                                     ' and cupom = %d' +
                                     ' and data = %s',
                                     [fBuscasF.FieldByName('COD_TERMINAL').AsInteger,
                                      QuotedStr(fBuscasF.FieldByName('NSERIEECF').AsString),
                                      vDadosIniF.cod_empresa,
                                      fBuscasF.FieldByName('ORDEM').AsInteger,
                                      fBuscasF.FieldByName('CUPOM').AsInteger,
                                      date_fb(fBuscasF.FieldByName('DATA').AsDateTime)]);
          fExecF.ExecSQL;
          StrPisCofins := ', BASE_PIS = 0, VALOR_PIS = 0, BASE_COFINS = 0, VALOR_COFINS = 0';
        end;
      fExecHw.ExecSQL;

      if fExecHw.Transaction.InTransaction then
        fExecHw.Transaction.Commit;

      //Alterando o status de envio do registro
      fExecF.Close;
      if pCampo2 then
        fExecF.SQL.Text := 'update CUPOM2 set ENVIADO_RET2 = ''S'''
      else
        fExecF.SQL.Text := 'update CUPOM2 set ENVIADO_RET = ''S''';
      fExecF.SQL.Text := fExecF.SQL.Text +  StrPisCofins +
        ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and ORDEM = :ORDEM and CUPOM = :CUPOM';
      fExecF.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fExecF.ParamByName('NSERIEECF').AsString := fBuscasF.FieldByName('NSERIEECF').AsString;
      fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fExecF.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
      fExecF.ParamByName('ORDEM').AsInteger := fBuscasF.FieldByName('ORDEM').AsInteger;
      fExecF.ParamByName('CUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
      fExecF.ExecSQL;

      if fExecF.Transaction.InTransaction then
        fExecF.Transaction.Commit;

      //Gerando md5 do registro
      fBuscasHw.Close;
      fBuscasHw.SQL.Text :=
        'select cp.nserieecf, imp.mf_adicional, cniee.modelo_ecf, imp.cod_proprietario,' +
        ' cp.ccf, cp.cupom, cp.nitem, cp.grupo_prod||cp.cod_prod codigo, cp.codbarra, cp.prod_serv, cp.descr_it,' +
        ' cp.quantidade, cp.unidade, cp.preco, cp.perc_desc, cp.perc_acresc, cp.total,' +
        ' cp.descaliq, cp.status_it, cp.iat, cp.ippt, cp.csdecqtde, cp.csdecvlunt, cp.md5' +
        ' from cupom2 cp' +
        ' inner join terminal_impressoras imp on imp.cod_terminal = cp.cod_terminal and imp.num_serie_ecf = cp.nserieecf and imp.cod_empresa = cp.cod_empresa and imp.atual = ''S''' +
        ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
        ' where cp.COD_TERMINAL = :COD_TERMINAL and cp.NSERIEECF = :NSERIEECF and cp.COD_EMPRESA = :COD_EMPRESA and cp.REGISTRO = :REGISTRO and cp.ORDEM = :ORDEM and cp.CUPOM = :CUPOM';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
      fBuscasHw.ParamByName('ORDEM').AsInteger := fBuscasF.FieldByName('ORDEM').AsInteger;
      fBuscasHw.ParamByName('CUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
      fBuscasHw.Open;

      if not fBuscasHw.IsEmpty then
        vMD5Func._gravaMD5_RegistrosPAF( fExecHw,
          Trim(fBuscasHw.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('cupom').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('ccf').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('nitem').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('codigo').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('codbarra').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('prod_serv').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('descr_it').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('quantidade').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('unidade').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('preco').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('perc_desc').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('perc_acresc').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('total').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('descaliq').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('status_it').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('iat').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('ippt').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('csdecqtde').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('csdecvlunt').AsString) + '|',
          'CUPOM2',
          ' COD_TERMINAL = ' + IntToStr(fBuscasF.FieldByName('COD_TERMINAL').AsInteger) +
          ' AND NSERIEECF = ' + QuotedStr(vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString)) +
          ' AND COD_EMPRESA = ' + IntToStr(fBuscasF.FieldByName('COD_EMPRESA').AsInteger) +
          ' AND REGISTRO = ' + IntToStr(fBuscasF.FieldByName('REGISTRO').AsInteger) +
          ' AND ORDEM = ' + IntToStr(fBuscasF.FieldByName('ORDEM').AsInteger) +
          ' AND CUPOM = ' + IntToStr(fBuscasF.FieldByName('CUPOM').AsInteger)
        );

//      fBuscasHw.Close;
//      fBuscasHw.Open;

//      if not fBuscasHw.IsEmpty then
//        vMD5Func._gravaMD5_Cupom2( fExecHw,
//          fBuscasHw.FieldByName('cod_terminal').AsInteger,
//            fBuscasHw.FieldByName('registro').AsInteger,
//            fBuscasHw.FieldByName('nitem').AsInteger,
//            fBuscasHw.FieldByName('cupom').AsInteger,
//            fBuscasHw.FieldByName('ordem').AsInteger,
//            fBuscasHw.FieldByName('nserieecf').AsString);

      fBuscasF.Next;
      fPos := fPos + 1;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        if ((fPos mod vMod) = 0) or (fBuscasF.Eof) then
          vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
    end;

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarCupom2. Erro: ' + e.Message);
    end;
  end;
end;

procedure TAtualizacaoRetaguarda._sincronizarDados;
begin

  if fEmExecucao then
    Exit;

  fEmExecucao := True;
  try
    if not fConexaoHw.Connected then
      if not vDadosIniF.conectaBanco(fConexaoHw, vDadosIniF.vBancoHW, false) then
      begin
        fSleepTimeSemConxecao := 30000;
        Exit;
      end;
      fSleepTimeSemConxecao := 5000;

    fAcao := '';
    try

      if not fConexaoF.Connected then
        if not vDadosIniF.conectaBanco(fConexaoF, vDadosIniF.vBancoFiscal, false) then
        begin
          fSleepTimeSemConxecao := 30000;
          Exit;
        end;
        fSleepTimeSemConxecao := 5000;
        
      try
        if Trim(fInsertCupom) = '' then
          _montaSql;

        try
          _sincronizarCupom;
          _sincronizarCupom2;
          _sincronizarCupom(True);
          _sincronizarCupom2(True);
          _sincronizarResumoD;
          _sincronizarMapaResumo;
          _sincronizarDocNaoF;
          _sincronizarFinCupom;
          _sincronizarNFSerieD;
          _sincronizarNFSerieDIt;
          _sincronizarSangSupPrest;
        finally
          fTexto := '';
        end;

//        begin
//          Randomize;
//          fMax := Random(20);
//          fPos := 0;
//          if fTexto = 'Cupom' then
//            fTexto := 'Itens do Cupom'
//          else
//            fTexto := 'Cupom';
//          while fPos < fMax do
//          begin
//            fPos := fPos + 1;
//            Randomize;
//            Sleep(Random(500));
//          end;
//        end;


      finally
        vDadosIniF.desconectaBanco(fConexaoF);
      end;
    finally
      vDadosIniF.desconectaBanco(fConexaoHw);
    end;
  finally
    if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
      vDadosIniF.fechaStatusProcessamento;
    fEmExecucao := False;
  end;
  // Segundo plano desativado então verifica as vendas sem cupom aqui
  if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
    VerificarVendasSemCupom(Date);
end;

procedure TAtualizacaoRetaguarda._sincronizarDocNaoF;
var
  I: Integer;
  vNovoRegistroATEST: Boolean;
  vTempDadosBaseEst: string;
begin
  try
    fBuscasF.Close;
    fBuscasF.SQL.Text :=
      'select * from DOC_NAOFISCAL_TERMINAL where cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
      ' and cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and enviado_ret = ''A'' ';
    fBuscasF.Open;

    fBuscasF.FetchAll;
    fMax := fBuscasF.RecordCount;
    fPos := 0;

    fBuscasF.First;
    while not fBuscasF.Eof do
    begin
      fTexto := 'Cupom Fiscal';

      fBuscasHw.Close;
      fBuscasHw.SQL.Text := 'select COD_TERMINAL, NSERIEECF, COD_EMPRESA, COO_ECF, TIPO_DOC_ECF, DATA_F_EMISSAO,' +
        ' HORA_F_EMISSAO from DOC_NAOFISCAL_TERMINAL' +
      	' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and COO_ECF = :COO_ECF';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('COO_ECF').AsInteger := fBuscasF.FieldByName('COO_ECF').AsInteger;
      fBuscasHw.Open;

      if fBuscasHw.IsEmpty then
        fExecHw.SQL.Text := fInsertDocNaoF
      else
        fExecHw.SQL.Text := fUpdateDocNaoF;

      // Alterando/inserindo registros na tabela
      fExecHw.Close;
      for I:= 0 to fExecHw.Params.Count - 1 do
        if Trim(fExecHw.Params[I].Name) = 'NSERIEECF' then
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            vDadosIniF.decodifica(fBuscasF.FieldByName(fExecHw.Params[I].Name).Value)
        else
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            fBuscasF.FieldByName(fExecHw.Params[I].Name).Value;
      fExecHw.ExecSQL;

      if fExecHw.Transaction.InTransaction then
        fExecHw.Transaction.Commit;

      //Alterando o status de envio do registro
      fExecF.Close;
      fExecF.SQL.Text := 'update DOC_NAOFISCAL_TERMINAL set ENVIADO_RET = ''S''' +
        ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and COO_ECF = :COO_ECF';
      fExecF.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fExecF.ParamByName('NSERIEECF').AsString := fBuscasF.FieldByName('NSERIEECF').AsString;
      fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fExecF.ParamByName('COO_ECF').AsInteger := fBuscasF.FieldByName('COO_ECF').AsInteger;
      fExecF.ExecSQL;

      if fExecF.Transaction.InTransaction then
        fExecF.Transaction.Commit;

      fBuscasHw.Close;
      fBuscasHw.Open;

      //verificando data e hora de atualizacao de estoque
      vNovoRegistroATEST := False;
      if vDadosIniF.strEstaContidoEm(
        Trim(fBuscasHw.FieldByName('TIPO_DOC_ECF').AsString), [ 'RV', 'CN']) then
      begin
        fExecHw.Close;
        fExecHw.SQL.Text := 'select DATA_AT, HORA_AT from PAF_DOC_BASE_ATEST' +
          ' where cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and DATA_AT = :DATA_AT';
        fExecHw.ParamByName('DATA_AT').AsDate := DateOf(fBuscasHw.FieldByName('DATA_F_EMISSAO').AsDateTime);
        fExecHw.Open;

        vNovoRegistroATEST := fExecHw.IsEmpty;

        if not vNovoRegistroATEST then
          vNovoRegistroATEST := StrToTime(fBuscasHw.FieldByName('HORA_F_EMISSAO').AsString) < StrToTime(fExecHw.FieldByName('hora_at').AsString);

        if vNovoRegistroATEST then
        begin
          vNovoRegistroATEST := fExecHw.IsEmpty;
          fExecHw.Close;
          fExecHw.SQL.Text := 'select t.MF_ADICIONAL, i.TIPO_ECF, i.MARCA_ECF, i.MODELO_ECF from TERMINAL_IMPRESSORAS t' +
            ' left join IMPRESSORAS_CNIEE i on i.IDENTIFICACAO = t.IDENT_CNIEE' +
            ' where t.COD_TERMINAL = ' + IntToStr(fBuscasHw.FieldByName('COD_TERMINAL').AsInteger) +
            ' and t.COD_EMPRESA = ' + IntToStr(fBuscasHw.FieldByName('COD_EMPRESA').AsInteger) +
            ' and t.NUM_SERIE_ECF = ' + QuotedStr(fBuscasHw.FieldByName('NSERIEECF').AsString);
          fExecHw.Open;

          vTempDadosBaseEst :=
            Trim(fExecHw.FieldByName('MF_ADICIONAL').AsString) + '|' +
            Trim(fExecHw.FieldByName('TIPO_ECF').AsString) + '|' +
            Trim(fExecHw.FieldByName('MARCA_ECF').AsString) + '|' +
            Trim(fExecHw.FieldByName('MODELO_ECF').AsString) + '|';

          fExecHw.Close;
          if vNovoRegistroATEST then
            fExecHw.SQL.Text := fInsertBaseAtEst
          else
            fExecHw.SQL.Text := fUpdateBaseAtEst;
          fExecHw.ParamByName('DATA_AT').AsDate := fBuscasHw.FieldByName('DATA_F_EMISSAO').AsDateTime;
          fExecHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasHw.FieldByName('COD_EMPRESA').AsInteger;
          fExecHw.ParamByName('NSERIEECF').AsString := fBuscasHw.FieldByName('NSERIEECF').AsString;
          fExecHw.ParamByName('HORA_AT').AsString := fBuscasHw.FieldByName('HORA_F_EMISSAO').AsString;
          fExecHw.ParamByName('MF_ADICIONAL').AsString := vDadosIniF.getCampoPipe(vTempDadosBaseEst, 1);
          fExecHw.ParamByName('TIPO_ECF').AsString := vDadosIniF.getCampoPipe(vTempDadosBaseEst, 2);
          fExecHw.ParamByName('MARCA_ECF').AsString := vDadosIniF.getCampoPipe(vTempDadosBaseEst, 3);
          fExecHw.ParamByName('MODELO_ECF').AsString := vDadosIniF.getCampoPipe(vTempDadosBaseEst, 4);
          fExecHw.ParamByName('MD5').AsString := Copy(vDadosIniF.Sign_RSA_MD5_SomenteTexto(
            FormatDateTime('dd/mm/yyyy', fExecHw.ParamByName('DATA_AT').AsDate) + '|' +
            Trim(fExecHw.ParamByName('HORA_AT').AsString) + '|' +
            Trim(fExecHw.ParamByName('NSERIEECF').AsString) + '|' +
            Trim(fExecHw.ParamByName('MF_ADICIONAL').AsString) + '|' +
            Trim(fExecHw.ParamByName('TIPO_ECF').AsString) + '|' +
            Trim(fExecHw.ParamByName('MARCA_ECF').AsString) + '|' +
            Trim(fExecHw.ParamByName('MODELO_ECF').AsString) + '|'), 1, 32);
          fExecHw.ExecSQL;
        end;
      end;
             
      //Gerando md5 do registro
      fBuscasHw.Close;
      fBuscasHw.SQL.Text :=
        'select doc.nserieecf, imp.mf_adicional, cniee.modelo_ecf,' +
        ' imp.cod_proprietario, doc.coo_ecf, doc.gnf_ecf, doc.grg_ecf, doc.cdc_ecf,' +
        ' doc.tipo_doc_ecf, doc.data_f_emissao, doc.hora_f_emissao, doc.md5' +
        ' from doc_naofiscal_terminal doc' +
        ' inner join terminal_impressoras imp on imp.cod_terminal = doc.cod_terminal and imp.num_serie_ecf = doc.nserieecf and imp.cod_empresa = doc.cod_empresa and imp.atual = ''S''' +
        ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
        ' where doc.COD_TERMINAL = :COD_TERMINAL and doc.NSERIEECF = :NSERIEECF and doc.COD_EMPRESA = :COD_EMPRESA and doc.COO_ECF = :COO_ECF';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('COO_ECF').AsInteger := fBuscasF.FieldByName('COO_ECF').AsInteger;
      fBuscasHw.Open;

      if not fBuscasHw.IsEmpty then
        vMD5Func._gravaMD5_RegistrosPAF( fExecHw,
          Trim(fBuscasHw.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('COO_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('GNF_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('GRG_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('CDC_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('TIPO_DOC_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('DATA_F_EMISSAO').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('HORA_F_EMISSAO').AsString) + '|',
          'DOC_NAOFISCAL_TERMINAL',
          ' COD_TERMINAL = ' + IntToStr(fBuscasF.FieldByName('COD_TERMINAL').AsInteger) +
          ' AND NSERIEECF = ' + QuotedStr(vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString)) +
          ' AND COD_EMPRESA = ' + IntToStr(fBuscasF.FieldByName('COD_EMPRESA').AsInteger) +
          ' AND COO_ECF = ' + IntToStr(fBuscasF.FieldByName('COO_ECF').AsInteger)
        );

//      if not fBuscasHw.IsEmpty then
//        vMD5Func._gravaMD5_DocNaoFiscal( fExecHw,
//          fBuscasHw.FieldByName('COO_ECF').AsInteger,
//          fBuscasHw.FieldByName('COD_TERMINAL').AsInteger,
//          fBuscasHw.FieldByName('NSERIEECF').AsString);

      fBuscasF.Next;
      fPos := fPos + 1;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
    end;

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarDocNaoF. Erro: ' + e.Message);
    end;
  end;

end;

procedure TAtualizacaoRetaguarda._sincronizarFinCupom;
var
  I, vCodClAdm: Integer;
  vValorTroco: Extended;
  vCpfCgcCl, vCpfCgcAdm: string;
  J, vNPED: Integer;
  vTipoPED: string;
  vListaControles, vLisFormPag: TStringList;
begin
  try
    fBuscasF.Close;
    fBuscasF.SQL.Text :=
      'select * from FINCUPOM where cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
      ' and cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and enviado_ret = ''A'' ';
    fBuscasF.Open;

    fBuscasF.FetchAll;
    fMax := fBuscasF.RecordCount;
    fPos := 0;

    fBuscasF.First;
    while not fBuscasF.Eof do
    begin
      fTexto := 'Finalizadores';

      fBuscasHw.Close;
      fBuscasHw.SQL.Text := 'select FC.COD_TERMINAL, FC.NSERIEECF, FC.COD_EMPRESA, FC.REGISTRO, FC.DATA, FC.TIPO_DOC, F.DESCRICAO, FC.VALOR from FINCUPOM FC' +
        ' left JOIN FINALIZADORES F on F.COD_TERMINAL = FC.COD_TERMINAL and F.NSERIEECF = FC.NSERIEECF and F.COD_EMPRESA = FC.COD_EMPRESA AND F.COD_FINALIZADOR = FC.FINALIZADOR' +
      	' where FC.COD_TERMINAL = :COD_TERMINAL and FC.NSERIEECF = :NSERIEECF and FC.COD_EMPRESA = :COD_EMPRESA and FC.REGISTRO = :REGISTRO and FC.TIPO_DOC = :TIPO_DOC';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
      fBuscasHw.ParamByName('TIPO_DOC').AsString := fBuscasF.FieldByName('TIPO_DOC').AsString;
      fBuscasHw.Open;

      if fBuscasHw.IsEmpty then
        fExecHw.SQL.Text := fInsertFinCupom
      else
        fExecHw.SQL.Text := fUpdateFinCupom;

      // Alterando/inserindo registros na tabela
      fExecHw.Close;
      for I:= 0 to fExecHw.Params.Count - 1 do
        if Trim(fExecHw.Params[I].Name) = 'NSERIEECF' then
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            vDadosIniF.decodifica(fBuscasF.FieldByName(fExecHw.Params[I].Name).Value)
        else
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            fBuscasF.FieldByName(fExecHw.Params[I].Name).Value;
      fExecHw.ExecSQL;

      if fExecHw.Transaction.InTransaction then
        fExecHw.Transaction.Commit;

      //Alterando o status de envio do registro
      fExecF.Close;
      fExecF.SQL.Text := 'update FINCUPOM set ENVIADO_RET = ''S''' +
        ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and TIPO_DOC = :TIPO_DOC';
      fExecF.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fExecF.ParamByName('NSERIEECF').AsString := fBuscasF.FieldByName('NSERIEECF').AsString;
      fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fExecF.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
      fExecF.ParamByName('TIPO_DOC').AsString := fBuscasF.FieldByName('TIPO_DOC').AsString;
      fExecF.ExecSQL;

      if fExecF.Transaction.InTransaction then
        fExecF.Transaction.Commit;

      // Gravando informações da transacao de cartao de credito
      if Trim(fBuscasF.FieldByName('N_AUT_CART').AsString) <> '' then
      begin
        fExecF.Close;
        fExecF.SQL.Text := 'select ped, prevenda, paf_num_prevenda from cupom' +
          ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and CUPOM = :CUPOM';
        fExecF.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
        fExecF.ParamByName('NSERIEECF').AsString := fBuscasF.FieldByName('NSERIEECF').AsString;
        fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
        fExecF.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('ORDEM').AsInteger;
        fExecF.ParamByName('CUPOM').AsInteger := fBuscasF.FieldByName('CUPOM').AsInteger;
        fExecF.Open;

        if (fExecF.FieldByName('ped').AsInteger > 0) and
          ((fExecF.FieldByName('prevenda').AsInteger > 0) or (fExecF.FieldByName('paf_num_prevenda').AsInteger > 0)) then
        begin

          fExecHw.Close;
          fExecHw.SQL.Text := 'select NPED, TIPO from PEDVENDA' +
            ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
            ' and NPED = :NPED';
          if (fExecF.FieldByName('PREVENDA').AsInteger > 0) then
          begin
            fExecHw.SQL.Text := fExecHw.SQL.Text + ' and NPREVENDA = :NPREVENDA';
            fExecHw.ParamByName('NPREVENDA').AsInteger := fExecF.FieldByName('PREVENDA').AsInteger;
          end
          else
          begin
            fExecHw.SQL.Text := fExecHw.SQL.Text + ' and PAF_NUM_PREVENDA = :PAF_NUM_PREVENDA';
            fExecHw.ParamByName('PAF_NUM_PREVENDA').AsInteger := fExecF.FieldByName('PAF_NUM_PREVENDA').AsInteger;
          end;
          fExecHw.ParamByName('NPED').AsInteger := fExecF.FieldByName('PED').AsInteger;
          fExecHw.Open;
          vNPed := fExecHw.FieldByName('NPED').AsInteger;
          vTipoPed := fExecHw.FieldByName('TIPO').AsString;

          if (vNPED > 0) and (Trim(vTipoPED) <> '') then
          begin
            fExecHw.Close;
            fExecHw.SQL.Text := 'select c.codigo_ctrl, t.cod_term_adm, t.cod_adm from controles c' +
              ' inner join terminal_cartao t on t.cod_empresa = c.codigo_emp' +
              ' where c.cod_finalizador = ' + IntToStr(fBuscasF.FieldByName('finalizador').AsInteger) +
              ' and c.docs = ''S2''' +
              ' and c.codigo_emp = ' + vDadosIniF.codEmpresa +
              ' and t.cod_terminalf = ' + IntToStr(fBuscasF.FieldByName('cod_terminal').AsInteger);
            fExecHw.Open;

            vListaControles := TStringList.Create;
            vLisFormPag := TStringList.Create;
            vListaControles.Clear;

            fExecHw.First;
            while not fExecHw.Eof do
            begin
              vListaControles.Add(
                IntToStr(fExecHw.FieldByName('codigo_ctrl').AsInteger) + '|' +
                Trim(fExecHw.FieldByName('cod_term_adm').AsString) + '|' +
                IntToStr(fExecHw.FieldByName('cod_adm').AsInteger) + '|'
              );
              fExecHw.Next;
            end;

            for I := 0  to vListaControles.Count - 1 do
            begin
              fExecHw.Close;
              fExecHw.SQL.Text := 'select seqform, n_processamento from formpagamento' +
                ' where cod_empresa = ' + vDadosIniF.codEmpresa +
                ' and cod_controle = ' + vDadosIniF.getCampoPipe(vListaControles[I], 1) +
                ' and tipdoc = ''S2''' +
                ' and nrequisicao = ' + IntToStr(vNPED) +
                ' and tpdocs = ' + QuotedStr(vTipoPED) +
                ' order by nparcela, data_venc';
              fExecHw.Open;

              vLisFormPag.Clear;
              J := 0;
              fExecHw.First;
              while not fExecHw.Eof do
              begin
                J := J + 1;
                vLisFormPag.Add(
                  IntToStr(fExecHw.FieldByName('seqform').AsInteger) + '|' +
                  IntToStr(J) + '|' +
                  IntToStr(fExecHw.FieldByName('n_processamento').AsInteger) + '|'
                );
                fExecHw.Next;
              end;
              for J:= 0 to vLisFormPag.Count - 1 do
              begin
                fExecHw.Close;
                fExecHw.SQL.Text := 'update formpagamento set' +
                  ' n_aut_cart = ' + QuotedStr(fBuscasF.FieldByName('n_aut_cart').AsString) +
                  ', n_docnsu_adm = ' + QuotedStr(fBuscasF.FieldByName('n_docnsu_adm').AsString) +
                  ', cod_terminal_adm = ' + QuotedStr(vDadosIniF.getCampoPipe(vListaControles[i], 2)) +
                  ', nparcela = case when coalesce(nparcela, 0) = 0 then ' + vDadosIniF.getCampoPipe(vLisFormPag[J], 2) + ' else nparcela end' +
                  ' where seqform = ' + vDadosIniF.getCampoPipe(vLisFormPag[J], 1) + ' and cod_empresa = ' + vDadosIniF.codEmpresa;
                fExecHw.ExecSQL;

                if StrToInt( vDadosIniF.getCampoPipe(vLisFormPag[J], 3) ) > 0 then
                begin
                  fExecHw.Close;
                  fExecHw.SQL.Text := 'update controle_creditos set' +
                    ' n_aut_cart = ' + QuotedStr(fBuscasF.FieldByName('n_aut_cart').AsString) +
                    ', n_docnsu_adm = ' + QuotedStr(fBuscasF.FieldByName('n_docnsu_adm').AsString) +
                    ', cod_terminal_adm = ' + QuotedStr(vDadosIniF.getCampoPipe(vListaControles[i], 2)) +
                    ', cod_adm = ' + vDadosIniF.getCampoPipe(vListaControles[i], 3) +
                    ', nparcela = case when coalesce(nparcela, 0) = 0 then ' + vDadosIniF.getCampoPipe(vLisFormPag[J], 2) + ' else nparcela end' +
                    ' where cod_cred = ' + vDadosIniF.getCampoPipe(vLisFormPag[J], 3) + ' and codigo_emp = ' + vDadosIniF.codEmpresa;
                  fExecHw.ExecSQL;
                end;
              end;
            end;
          end;
        end;
      end;

      //Gerando md5 do registro
      fBuscasHw.Close;
      fBuscasHw.Open;

      if not fBuscasHw.IsEmpty then
        vMD5Func._gravaMD5_RegistrosPAF( fExecHw,
          FormatDateTime('dd/mm/yyyy', fBuscasHw.FieldByName('data').AsDateTime) + '|' +
          Trim(fBuscasHw.FieldByName('descricao').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('tipo_doc').AsString) + '|' +
          fBuscasHw.FieldByName('valor').AsString + '|',
          'FINCUPOM',
          ' COD_TERMINAL = ' + vDadosIniF.vCodTerminal +
          ' and NSERIEECF = ' + QuotedStr(fBuscasHw.FieldByName('nserieecf').AsString) +
          ' and COD_EMPRESA = ' + vDadosIniF.codEmpresa +
          ' and REGISTRO = ' + IntToStr(fBuscasHw.FieldByName('registro').AsInteger) +
          ' and TIPO_DOC = ' + QuotedStr(fBuscasHw.FieldByName('tipo_doc').AsString));
//        vMD5Func._gravaMD5_FinCupom( fExecHw,
//            fBuscasHw.FieldByName('registro').AsInteger,
//            fBuscasHw.FieldByName('cod_terminal').AsInteger,
//            fBuscasHw.FieldByName('nserieecf').AsString);

      try vValorTroco := fBuscasF.FieldByName('valorsaque').AsFloat - fBuscasF.FieldByName('valor').AsFloat; except vValorTroco := 0; end;
      if (vValorTroco > 0) and (Trim(fBuscasF.FieldByName('N_AUT_CART').AsString) <> '') then
      begin
        fExecF.Close;
        fExecF.SQL.Text := 'select cpfcgc from cupom' +
          ' where cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
          ' and registro = ' + IntToStr(fBuscasF.FieldByName('ordem').AsInteger) +
          ' and cupom = ' + IntToStr(fBuscasF.FieldByName('cupom').AsInteger) +
          ' and cod_empresa = ' + vDadosIniF.codEmpresa;
        fExecF.Open;
        vCpfCgcCl := fExecF.FieldByName('cpfcgc').AsString;

        if Trim(vCpfCgcCl) <> '' then
        begin
          fBuscasHw.Close;
          fBuscasHw.SQL.Text := 'select c.cpfcgc from terminal_cartao tc' +
            ' inner join adm_cartao a on a.cod_adm = tc.cod_adm and a.cod_empresa = tc.cod_empresa' +
            ' inner join clientes c on c.cod_cliente = a.cod_cliente and c.cod_empresa = a.cod_empresa' +
            ' inner join cupom cp on cp.cod_terminal = tc.cod_terminalf and cp.nserieecf = :nserie' +
            ' and cp.registro = :ordem and cp.cupom = :cupom and cp.cod_empresa = tc.cod_empresa' +
            ' where tc.cod_terminalf = :cod_terminalf and tc.cod_empresa = ' + vDadosIniF.codEmpresa;
          fBuscasHw.ParamByName('nserie').AsString := vDadosIniF.vNumSerieEcf;
          fBuscasHw.ParamByName('ordem').AsInteger := fBuscasF.FieldByName('ordem').AsInteger;
          fBuscasHw.ParamByName('cupom').AsInteger := fBuscasF.FieldByName('cupom').AsInteger;
          fBuscasHw.ParamByName('cod_terminalf').AsInteger := fBuscasF.FieldByName('cod_terminal').AsInteger;
          fBuscasHw.Open;
          vCpfCgcAdm := fBuscasHw.FieldByName('cpfcgc').AsString;
          if Trim(vCpfCgcAdm) <> '' then
          begin
            fExecHw.Close;
            fExecHw.SQL.Text := 'update FINCUPOM set' +
              ' CPFCGC_CLI_TROCO = ' + QuotedStr(Trim(Copy(vCpfCgcCl,1,14))) +
              ', CPFCGC_AMD_TROCO = ' + QuotedStr(Trim(Copy(vCpfCgcAdm,1,14))) +
              ', VALOR_TROCO = :VALOR_TROCO' +
              ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and TIPO_DOC = :TIPO_DOC';
            fExecHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
            fExecHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
            fExecHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
            fExecHw.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
            fExecHw.ParamByName('TIPO_DOC').AsString := fBuscasF.FieldByName('TIPO_DOC').AsString;
            fExecHw.ParamByName('VALOR_TROCO').AsFloat := vValorTroco;
            fExecHw.ExecSQL;

            if fExecHw.Transaction.InTransaction then
              fExecHw.Transaction.Commit;

            fBuscasHw.Close;
            fBuscasHw.SQL.Text := 'SELECT CPFCGC_AMD_TROCO, CUPOM, CCF_ECF, VALOR_TROCO,' +
              ' DATA, CPFCGC_CLI_TROCO, N_AUT_CART, COD_TERMINAL FROM FINCUPOM' +
              ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and REGISTRO = :REGISTRO and TIPO_DOC = :TIPO_DOC';
            fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
            fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
            fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
            fBuscasHw.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
            fBuscasHw.ParamByName('TIPO_DOC').AsString := fBuscasF.FieldByName('TIPO_DOC').AsString;
            fBuscasHw.Open;

            if not fBuscasHw.IsEmpty then
              vMD5Func._gravaMD5_RegistrosPAF( fExecHw,
                fBuscasHw.FieldByName('CPFCGC_AMD_TROCO').AsString + '|' +
                fBuscasHw.FieldByName('CUPOM').AsString + '|' +
                fBuscasHw.FieldByName('CCF_ECF').AsString + '|' +
                fBuscasHw.FieldByName('VALOR_TROCO').AsString + '|' +
                FormatDateTime('dd/mm/yyyy', fBuscasHw.FieldByName('DATA').AsDateTime) + '|' +
                fBuscasHw.FieldByName('CPFCGC_CLI_TROCO').AsString + '|' +
                Trim(fBuscasHw.FieldByName('N_AUT_CART').AsString) + '|' ,
                'FINCUPOM',
                ' COD_TERMINAL = ' + IntToStr(fBuscasF.FieldByName('COD_TERMINAL').AsInteger) +
                ' and NSERIEECF = ' + QuotedStr(vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString)) +
                ' and COD_EMPRESA = ' + IntToStr(fBuscasF.FieldByName('COD_EMPRESA').AsInteger) +
                ' and REGISTRO = ' + IntToStr(fBuscasF.FieldByName('REGISTRO').AsInteger) +
                ' and TIPO_DOC = ' + QuotedStr(fBuscasF.FieldByName('tipo_doc').AsString),
                'MD5H2');
          end;
        end;
      end;

      fBuscasHw.Close;
      fBuscasHw.SQL.Text :=
        'select fin.nserieecf, imp.mf_adicional, cniee.modelo_ecf,' +
        ' imp.cod_proprietario, fin.cupom, fin.ccf_ecf, fin.gnf_ecf,' +
        ' fnz.descricao, fin.valor, fin.status_fc, fin.md5r07' +
        ' from fincupom fin' +
        ' inner join terminal_impressoras imp on imp.cod_terminal = fin.cod_terminal and imp.num_serie_ecf = fin.nserieecf and imp.cod_empresa = fin.cod_empresa and imp.atual = ''S''' +
        ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
        ' inner join finalizadores fnz on fnz.cod_terminal = fin.cod_terminal and fnz.nserieecf = fin.nserieecf and fnz.cod_empresa = fin.cod_empresa and fnz.cod_finalizador = fin.finalizador' +
        ' where fin.COD_TERMINAL = :COD_TERMINAL and fin.NSERIEECF = :NSERIEECF and fin.COD_EMPRESA = :COD_EMPRESA and fin.REGISTRO = :REGISTRO and fin.TIPO_DOC = :TIPO_DOC';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('REGISTRO').AsInteger := fBuscasF.FieldByName('REGISTRO').AsInteger;
      fBuscasHw.ParamByName('TIPO_DOC').AsString := fBuscasF.FieldByName('TIPO_DOC').AsString;
      fBuscasHw.Open;

      if not fBuscasHw.IsEmpty then
        vMD5Func._gravaMD5_RegistrosPAF( fExecHw,
          Trim(fBuscasHw.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('cupom').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('ccf_ecf').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('gnf_ecf').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('descricao').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('valor').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('status_fc').AsString) + '|',
          'FINCUPOM',
          ' COD_TERMINAL = ' + IntToStr(fBuscasF.FieldByName('COD_TERMINAL').AsInteger) +
          ' AND NSERIEECF = ' + QuotedStr(vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString)) +
          ' AND COD_EMPRESA = ' + IntToStr(fBuscasF.FieldByName('COD_EMPRESA').AsInteger) +
          ' AND REGISTRO = ' + IntToStr(fBuscasF.FieldByName('REGISTRO').AsInteger) +
          ' AND TIPO_DOC = ' + QuotedStr(fBuscasF.FieldByName('TIPO_DOC').AsString),
          'MD5R07'
        );

      fBuscasF.Next;
      fPos := fPos + 1;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
    end;

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarFinCupom. Erro: ' + e.Message);
    end;
  end;
end;

procedure TAtualizacaoRetaguarda._sincronizarMapaResumo;
var
  I: Integer;
begin
  try
    fBuscasF.Close;
    fBuscasF.SQL.Text :=
      'select * from MAPA_RESUMO_ALIQ where cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
      ' and cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and enviado_ret = ''A'' ';
    fBuscasF.Open;

    fBuscasF.FetchAll;
    fMax := fBuscasF.RecordCount;
    fPos := 0;

    fBuscasF.First;
    while not fBuscasF.Eof do
    begin
      fTexto := 'Detalhes Z';

      fBuscasHw.Close;
      fBuscasHw.SQL.Text := 'select COD_TERMINAL, NSERIEECF, COD_EMPRESA, COORED, ALIQ_SEQ, DESCALIQ from MAPA_RESUMO_ALIQ' +
      	' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and COORED = :COORED and ALIQ_SEQ = :ALIQ_SEQ';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('COORED').AsInteger := fBuscasF.FieldByName('COORED').AsInteger;
      fBuscasHw.ParamByName('ALIQ_SEQ').AsString := fBuscasF.FieldByName('ALIQ_SEQ').AsString;
      fBuscasHw.Open;

      if fBuscasHw.IsEmpty then
        fExecHw.SQL.Text := fInsertMapaResumo
      else
        fExecHw.SQL.Text := fUpdateMapaResumo;

      // Alterando/inserindo registros na tabela
      fExecHw.Close;
      for I:= 0 to fExecHw.Params.Count - 1 do
        if Trim(fExecHw.Params[I].Name) = 'NSERIEECF' then
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            vDadosIniF.decodifica(fBuscasF.FieldByName(fExecHw.Params[I].Name).Value)
        else
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            fBuscasF.FieldByName(fExecHw.Params[I].Name).Value;
      fExecHw.ExecSQL;

      if fExecHw.Transaction.InTransaction then
        fExecHw.Transaction.Commit;

      //Alterando o status de envio do registro
      fExecF.Close;
      fExecF.SQL.Text := 'update MAPA_RESUMO_ALIQ set ENVIADO_RET = ''S''' +
        ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and COORED = :COORED and ALIQ_SEQ = :ALIQ_SEQ';
      fExecF.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fExecF.ParamByName('NSERIEECF').AsString := fBuscasF.FieldByName('NSERIEECF').AsString;
      fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fExecF.ParamByName('COORED').AsInteger := fBuscasF.FieldByName('COORED').AsInteger;
      fExecF.ParamByName('ALIQ_SEQ').AsString := fBuscasF.FieldByName('ALIQ_SEQ').AsString;
      fExecF.ExecSQL;

      if fExecF.Transaction.InTransaction then
        fExecF.Transaction.Commit;

      //Gerando md5 do registro

      fBuscasHw.Close;
      fBuscasHw.SQL.Text :=
        'select mp.nserieecf,imp.mf_adicional,cniee.modelo_ecf, imp.cod_proprietario,res.nreducoes,' +
        ' case when ((upper(coalesce(mp.descaliq, '''')) = ''CAN-T'') or (upper(coalesce(mp.descaliq, '''')) = ''CANC-T'')) then ''Can-T''' +
        ' when ((upper(coalesce(mp.descaliq, '''')) = ''CAN-S'') or (upper(coalesce(mp.descaliq, '''')) = ''CANC-S'')) then ''Can-S''' +
        ' else mp.descaliq' +
        ' end descaliq, mp.valoraliq, mp.md5' +
        ' from resumod res' +
        ' inner join terminal_impressoras imp on imp.cod_terminal = res.cod_terminal and imp.num_serie_ecf = res.nserieecf and imp.cod_empresa = res.cod_empresa and imp.atual = ''S''' +
        ' inner join mapa_resumo_aliq mp on mp.cod_terminal = res.cod_terminal and mp.nserieecf = res.nserieecf and mp.cod_empresa = res.cod_empresa and mp.coored = res.coored' +
        ' inner join impressoras_cniee cniee on cniee.identificacao = imp.ident_cniee' +
        ' where mp.COD_TERMINAL = ' + IntToStr(fBuscasF.FieldByName('COD_TERMINAL').AsInteger) +
        ' AND mp.NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString)) +
        ' AND mp.COD_EMPRESA = ' + IntToStr(fBuscasF.FieldByName('COD_EMPRESA').AsInteger) +
        ' AND mp.COORED = ' + IntToStr(fBuscasF.FieldByName('COORED').AsInteger) +
        ' AND mp.ALIQ_SEQ = ' + QuotedStr(fBuscasF.FieldByName('ALIQ_SEQ').AsString) ;
      fBuscasHw.Open;

      if not fBuscasHw.IsEmpty then
        vMD5Func._gravaMD5_RegistrosPAF( fExecHw,
          Trim(fBuscasHw.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('NREDUCOES').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('DESCALIQ').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('VALORALIQ').AsString) + '|',
          'MAPA_RESUMO_ALIQ',
          ' COD_TERMINAL = ' + IntToStr(fBuscasF.FieldByName('COD_TERMINAL').AsInteger) +
          ' AND NSERIEECF = ' + QuotedStr(vDadosIni.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString)) +
          ' AND COD_EMPRESA = ' + IntToStr(fBuscasF.FieldByName('COD_EMPRESA').AsInteger) +
          ' AND COORED = ' + IntToStr(fBuscasF.FieldByName('COORED').AsInteger) +
          ' AND ALIQ_SEQ = ' + QuotedStr(fBuscasF.FieldByName('ALIQ_SEQ').AsString)
        );

//      fBuscasHw.Close;
//      fBuscasHw.Open;

//      if not fBuscasHw.IsEmpty then
//        vMD5Func._gravaMD5_DetalhesReducaoZ( fExecHw,
//          fBuscasHw.FieldByName('COORED').AsInteger,
//          fBuscasHw.FieldByName('COD_TERMINAL').AsInteger,
//          fBuscasHw.FieldByName('NSERIEECF').AsString,
//          fBuscasHw.FieldByName('DESCALIQ').AsString);

      fBuscasF.Next;
      fPos := fPos + 1;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
    end;

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarMapaResumo. Erro: ' + e.Message);
    end;
  end;

end;

procedure TAtualizacaoRetaguarda._sincronizarNFSerieD;
var
  I: Integer;
begin
  try
    fBuscasF.Close;
    fBuscasF.SQL.Text :=
      'select * from NF_SERIE_D where cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and enviado_ret = ''A'' ';
    fBuscasF.Open;

    fBuscasF.FetchAll;
    fMax := fBuscasF.RecordCount;
    fPos := 0;

    fBuscasF.First;
    while not fBuscasF.Eof do
    begin
      fTexto := 'NF Modelo 2';

      fBuscasHw.Close;
      fBuscasHw.SQL.Text := 'select NUMERONOTA, COD_EMPRESA from NF_SERIE_D' +
      	' where NUMERONOTA = :NUMERONOTA and COD_EMPRESA = :COD_EMPRESA';
      fBuscasHw.ParamByName('NUMERONOTA').AsInteger := fBuscasF.FieldByName('NUMERONOTA').AsInteger;
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.Open;

      if fBuscasHw.IsEmpty then
        fExecHw.SQL.Text := fInsertNFSerieD
      else
        fExecHw.SQL.Text := fUpdateNFSerieD;

      // Alterando/inserindo registros na tabela
      fExecHw.Close;
      for I:= 0 to fExecHw.Params.Count - 1 do
        fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
          fBuscasF.FieldByName(fExecHw.Params[I].Name).Value;
      fExecHw.ExecSQL;

      if fExecHw.Transaction.InTransaction then
        fExecHw.Transaction.Commit;

      //Alterando o status de envio do registro
      fExecF.Close;
      fExecF.SQL.Text := 'update NF_SERIE_D set ENVIADO_RET = ''S''' +
        ' where NUMERONOTA = :NUMERONOTA and COD_EMPRESA = :COD_EMPRESA';
      fExecF.ParamByName('NUMERONOTA').AsInteger := fBuscasF.FieldByName('NUMERONOTA').AsInteger;
      fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fExecF.ExecSQL;

      if fExecF.Transaction.InTransaction then
        fExecF.Transaction.Commit;

      fBuscasF.Next;
      fPos := fPos + 1;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
    end;

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarNFSerieD. Erro: ' + e.Message);
    end;
  end;
end;

procedure TAtualizacaoRetaguarda._sincronizarNFSerieDIt;
var
  I: Integer;
begin
  try
    fBuscasF.Close;
    fBuscasF.SQL.Text :=
      'select * from NF_SERIE_D_ITENS where cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and enviado_ret = ''A'' ';
    fBuscasF.Open;

    fBuscasF.FetchAll;
    fMax := fBuscasF.RecordCount;
    fPos := 0;

    fBuscasF.First;
    while not fBuscasF.Eof do
    begin
      fTexto := 'Itens NF Mod 2';

      fBuscasHw.Close;
      fBuscasHw.SQL.Text := 'select NUMERONOTA, COD_EMPRESA from NF_SERIE_D_ITENS' +
      	' where NUMERONOTA = :NUMERONOTA and COD_EMPRESA = :COD_EMPRESA and NITEM = :NITEM and GRUPO_PROD = :GRUPO_PROD and COD_PROD = :COD_PROD';
      fBuscasHw.ParamByName('NUMERONOTA').AsInteger := fBuscasF.FieldByName('NUMERONOTA').AsInteger;
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('NITEM').AsInteger := fBuscasF.FieldByName('NITEM').AsInteger;
      fBuscasHw.ParamByName('GRUPO_PROD').AsInteger := fBuscasF.FieldByName('GRUPO_PROD').AsInteger;
      fBuscasHw.ParamByName('COD_PROD').AsString := fBuscasF.FieldByName('COD_PROD').AsString;
      fBuscasHw.Open;

      if fBuscasHw.IsEmpty then
        fExecHw.SQL.Text := fInsertNFSerieDIt
      else
        fExecHw.SQL.Text := fUpdateNFSerieDIt;

      // Alterando/inserindo registros na tabela
      fExecHw.Close;
      for I:= 0 to fExecHw.Params.Count - 1 do
        fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
          fBuscasF.FieldByName(fExecHw.Params[I].Name).Value;
      fExecHw.ExecSQL;

      if fExecHw.Transaction.InTransaction then
        fExecHw.Transaction.Commit;

      //Alterando o status de envio do registro
      fExecF.Close;
      fExecF.SQL.Text := 'update NF_SERIE_D_ITENS set ENVIADO_RET = ''S''' +
        ' where NUMERONOTA = :NUMERONOTA and COD_EMPRESA = :COD_EMPRESA and NITEM = :NITEM and GRUPO_PROD = :GRUPO_PROD and COD_PROD = :COD_PROD';
      fExecF.ParamByName('NUMERONOTA').AsInteger := fBuscasF.FieldByName('NUMERONOTA').AsInteger;
      fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fExecF.ParamByName('NITEM').AsInteger := fBuscasF.FieldByName('NITEM').AsInteger;
      fExecF.ParamByName('GRUPO_PROD').AsInteger := fBuscasF.FieldByName('GRUPO_PROD').AsInteger;
      fExecF.ParamByName('COD_PROD').AsString := fBuscasF.FieldByName('COD_PROD').AsString;
      fExecF.ExecSQL;

      if fExecF.Transaction.InTransaction then
        fExecF.Transaction.Commit;

      fBuscasF.Next;
      fPos := fPos + 1;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
    end;

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarNFSerieDIt. Erro: ' + e.Message);
    end;
  end;
end;

procedure TAtualizacaoRetaguarda._sincronizarPedVenda(param1, param2,
  pDataOuRegistro: string; pAlterarDataRegistro: Boolean = False);
var
  vTipoPed, vNomeVend: string;
  I, vCodVendedor, vCodCliente, vNPed, vnItemP, vnItemS: Integer;
  vTotalProd, vTotalServ, vTotal, vDesconto, vAcrescimo: Extended;
begin
  try
    fBuscasFPed.Close;
    fBuscasFPed.SQL.Text :=
      'select * from cupom' +
      ' where COD_TERMINAL = :COD_TERMINAL' +
      ' and NSERIEECF = :NSERIEECF' +
      ' and COD_EMPRESA = :COD_EMPRESA';
    if pDataOuRegistro = 'data' then
    begin
      fBuscasFPed.SQL.Text := fBuscasFPed.SQL.Text +
        ' and DATA >= :DATAINI' +
        ' and DATA <= :DATAFIM';
      fBuscasFPed.ParamByName('DATAINI').AsDate := StrToDate(param1);
      fBuscasFPed.ParamByName('DATAFIM').AsDate := StrToDate(param2);
    end
    else
    begin
      fBuscasFPed.SQL.Text := fBuscasFPed.SQL.Text +
        ' and REGISTRO = :REGISTRO' +
        ' and CUPOM = :CUPOM';
      fBuscasFPed.ParamByName('REGISTRO').AsInteger := StrToInt(param1);
      fBuscasFPed.ParamByName('CUPOM').AsInteger := StrToInt(param2);
    end;
    fBuscasFPed.ParamByName('COD_TERMINAL').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
    fBuscasFPed.ParamByName('NSERIEECF').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    fBuscasFPed.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
    fBuscasFPed.Open;

    if pDataOuRegistro = 'data' then
    begin
      fBuscasFPed.FetchAll;
      fMax := fBuscasFPed.RecordCount;
      fPos := 0;
    end;

    fBuscasFPed.First;
    while not fBuscasFPed.Eof do
    begin
      if pDataOuRegistro = 'data' then
        fTexto := 'Estoque';
        
      if fBuscasFPed.FieldByName('PED').AsInteger = 0 then
      begin
        if Trim(fBuscasFPed.FieldByName('STATUS_CP').AsString) = 'CANCELADO' then
        begin
          fBuscasHwPed.Close;
          fBuscasHwPed.SQL.Text := 'select NPED, TIPO from PEDVENDA where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
            ' and NCUPOM = :NCUPOM' +
            ' and NSERIEECF = :NSERIEECF' +
            ' and DATA_CUPOM = :DATA_CUPOM' +
            ' and OPERADOR = :OPERADOR';
          fBuscasHwPed.ParamByName('NCUPOM').AsInteger := fBuscasFPed.FieldByName('CUPOM').AsInteger;
          fBuscasHwPed.ParamByName('NSERIEECF').AsString := Trim(vDadosIniF.decodifica(fBuscasFPed.FieldByName('NSERIEECF').AsString));
          fBuscasHwPed.ParamByName('DATA_CUPOM').AsDate := fBuscasFPed.FieldByName('DATA').AsDateTime;
          fBuscasHwPed.ParamByName('OPERADOR').AsInteger := fBuscasFPed.FieldByName('COD_TERMINAL').AsInteger;
          fBuscasHwPed.Open;

          vNPed := fBuscasHwPed.FieldByName('NPED').AsInteger;
          vTipoPed := Trim(fBuscasHwPed.FieldByName('TIPO').AsString);

          if vNPed > 0 then
          begin
            fBuscasHwPed.Close;
            fBuscasHwPed.SQL.Text := 'select GRUPO_PROD, COD_PROD, NITEM, QUANT_PED_ITEM from PEDVENDA_PROD' +
              ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
              ' and NPED = ' + IntToStr(vNPed) +
              ' and TIPO = ' + QuotedStr(vTipoPed) +
              ' and coalesce(STATUS, '''') <> ''CANCELADO''';
            fBuscasHwPed.Open;

            fBuscasHwPed.First;
            while not fBuscasHwPed.Eof do
            begin

              fExecHw.Close;
//              fExecHw.SQL.Text := 'execute procedure VOLTA_ESTOQUE(:GRUPO_PROD, :COD_PROD, :QUANTIDADE , 0, 0, 0,current_date, ' + vDadosIniF.codEmpresa + ')';
              fExecHw.SQL.Text := 'execute procedure movimenta_estoque(:GRUPO_PROD, :COD_PROD, ' + vDadosIniF.codEmpresa + ', 0,  :QUANTIDADE, 0, 0)';
              fExecHw.ParamByName('GRUPO_PROD').AsInteger := fBuscasHwPed.FieldByName('GRUPO_PROD').AsInteger;
              fExecHw.ParamByName('COD_PROD').AsString := fBuscasHwPed.FieldByName('COD_PROD').AsString;
              fExecHw.ParamByName('QUANTIDADE').AsFloat := fBuscasHwPed.FieldByName('QUANT_PED_ITEM').AsFloat;
              fExecHw.ExecSQL;

              fBuscasHwPed.Next;
            end;

            vMD5Func._gravaMD5_Produtos(fBuscasHwPed, fExecHw, vTipoPed, vNPed, False);

            fExecHw.Close;
            fExecHw.SQL.Text := 'delete from PEDVENDA' +
              ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
              ' and NPED = ' + IntToStr(vNPed) +
              ' and TIPO = ' + QuotedStr(vTipoPed);
            fExecHw.ExecSQL;

            if Trim(vTipoPed) = 'REQ' then
            begin
              fExecHw.Close;
              fExecHw.SQL.Text := 'delete from REQVENDA' +
                ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
                ' and NREQ = ' + IntToStr(vNPed);
              fExecHw.ExecSQL;
            end
            else
            begin
              fExecHw.Close;
              fExecHw.SQL.Text := 'delete from ORDEM_SERV' +
                ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
                ' and N_OS = ' + IntToStr(vNPed);
              fExecHw.ExecSQL;
            end;
          end;
        end
        else
        begin
          fBuscasHwPed.Close;
          fBuscasHwPed.SQL.Text := 'select NPED, TIPO from PEDVENDA' +
            ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
            ' and NCUPOM = :NCUPOM' +
            ' and NSERIEECF = :NSERIEECF' +
            ' and OPERADOR = :OPERADOR' +
            ' and TIPO <> ''ORC''';
          fBuscasHwPed.ParamByName('NCUPOM').AsInteger := fBuscasFPed.FieldByName('CUPOM').AsInteger;
          fBuscasHwPed.ParamByName('NSERIEECF').AsString := Trim(vDadosIniF.decodifica(fBuscasFPed.FieldByName('NSERIEECF').AsString));
          fBuscasHwPed.ParamByName('OPERADOR').AsInteger := fBuscasFPed.FieldByName('COD_TERMINAL').AsInteger;
          fBuscasHwPed.Open;

          if fBuscasHwPed.IsEmpty then
          begin
            fExecHw.Close;
            fExecHw.SQL.Text := fInsertPedVenda;

            fBuscasFPed2.Close;
            fBuscasFPed2.SQL.Text := 'select * from CUPOM2' +
              ' where CUPOM = :CUPOM' +
              ' and ORDEM = :ORDEM' +
              ' and COD_TERMINAL = :COD_TERMINAL' +
              ' and COD_EMPRESA  = :COD_EMPRESA' + 
              ' and NSERIEECF = :NSERIEECF' +
              ' order by NITEM';
            fBuscasFPed2.ParamByName('CUPOM').AsInteger := fBuscasFPed.FieldByName('CUPOM').AsInteger;
            fBuscasFPed2.ParamByName('ORDEM').AsInteger := fBuscasFPed.FieldByName('REGISTRO').AsInteger;
            fBuscasFPed2.ParamByName('COD_TERMINAL').AsInteger := fBuscasFPed.FieldByName('COD_TERMINAL').AsInteger;
            fBuscasFPed2.ParamByName('COD_EMPRESA').AsInteger := fBuscasFPed.FieldByName('COD_EMPRESA').AsInteger;
            fBuscasFPed2.ParamByName('NSERIEECF').AsString := fBuscasFPed.FieldByName('NSERIEECF').AsString;
            fBuscasFPed2.Open;

            vTipoPed := 'REQ';
            vTotal := 0;
            vTotalProd := 0;
            vTotalServ := 0;
            vDesconto := 0;
            vAcrescimo := 0;
            fBuscasFPed2.First;
            while not fBuscasFPed2.Eof do
            begin
              if (fBuscasFPed2.FieldByName('PROD_SERV').AsString = 'S') and
                (Trim(fBuscasFPed2.FieldByName('STATUS_IT').AsString) <> 'CANCELADO') then
              begin
                vTotalServ := vTotalServ + fBuscasFPed2.FieldByName('TOTAL').AsCurrency;
                vTipoPed := 'OS';
              end
              else if (fBuscasFPed2.FieldByName('PROD_SERV').AsString = 'P') and
                (Trim(fBuscasFPed2.FieldByName('STATUS_IT').AsString) <> 'CANCELADO') then
                vTotalProd := vTotalProd + fBuscasFPed2.FieldByName('TOTAL').AsCurrency;
              if (Trim(fBuscasFPed2.FieldByName('STATUS_IT').AsString) <> 'CANCELADO') then
              begin
                vTotal := vTotal + fBuscasFPed2.FieldByName('TOTAL').AsFloat +
                  fBuscasFPed2.FieldByName('RAT_ACRES').AsFloat +
                  fBuscasFPed2.FieldByName('PERC_ACRESC').AsFloat -
                  fBuscasFPed2.FieldByName('RAT_DESC').AsFloat -
                  fBuscasFPed2.FieldByName('PERC_DESC').AsFloat;
                vDesconto := vDesconto + fBuscasFPed2.FieldByName('RAT_DESC').AsFloat +
                  fBuscasFPed2.FieldByName('PERC_DESC').AsFloat;
                vAcrescimo := vAcrescimo + fBuscasFPed2.FieldByName('RAT_ACRES').AsFloat +
                  fBuscasFPed2.FieldByName('PERC_ACRESC').AsFloat;
              end;
              fBuscasFPed2.Next;
            end;

            fBuscasHwPed.Close;
            if vTipoPed = 'REQ' then
              fBuscasHwPed.SQL.Text := 'select COD from INCREMENTA_CODIGO(' + vDadosIniF.codEmpresa + ', ''REQVENDA'')'
            else
              fBuscasHwPed.SQL.Text := 'select COD from INCREMENTA_CODIGO(' + vDadosIniF.codEmpresa + ', ''ORDEM_SERV'')';
            fBuscasHwPed.Open;

            vNPed := fBuscasHwPed.FieldByName('COD').AsInteger;
            fExecHw.ParamByName('NPED').AsInteger := vNPed;
            fExecHw.ParamByName('TIPO').AsString := vTipoPed;
            fExecHw.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
            fExecHw.ParamByName('STATUS_PED').AsString := 'FECHADA';
            fExecHw.ParamByName('TIPV').AsString := 'V';
            fExecHw.ParamByName('TIPOR').AsString := 'V';
            fExecHw.ParamByName('OBS_PED').AsString := 'CUPOM FISCAL N° ' + fBuscasFPed.FieldByName('CUPOM').AsString;
            fExecHw.ParamByName('NCUPOM').AsInteger := fBuscasFPed.FieldByName('CUPOM').AsInteger;
            fExecHw.ParamByName('CCF_CUPOM').AsInteger := fBuscasFPed.FieldByName('CCF').AsInteger;
            fExecHw.ParamByName('DATA_CUPOM').AsDateTime := fBuscasFPed.FieldByName('DATA').AsDateTime;
            fExecHw.ParamByName('OPERADOR').AsInteger := fBuscasFPed.FieldByName('COD_TERMINAL').AsInteger;
            fExecHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasFPed.FieldByName('NSERIEECF').AsString);
            fExecHw.ParamByName('DATA_PED').AsDateTime := vDadosIniF.getDataHoraBanco(fBuscasHwPed);
            fExecHw.ParamByName('DATA_FECH').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', fExecHw.ParamByName('DATA_PED').AsDateTime));
            fExecHw.ParamByName('HORAABERTURA').AsString := Copy(TimeToStr(fExecHw.ParamByName('DATA_PED').AsDateTime), 1, 2);
            fExecHw.ParamByName('MINABERTURA').AsString := Copy(TimeToStr(fExecHw.ParamByName('DATA_PED').AsDateTime), 4, 2);
            fExecHw.ParamByName('HORAFECHAMENTO').AsString := fExecHw.ParamByName('HORAABERTURA').AsString;
            fExecHw.ParamByName('MINFECHAMENTO').AsString := fExecHw.ParamByName('MINABERTURA').AsString;
            fExecHw.ParamByName('DATA_PED').AsDateTime := fExecHw.ParamByName('DATA_FECH').AsDate;
            fExecHw.ParamByName('TOT_PROD').AsFloat := vTotalProd;
            fExecHw.ParamByName('TOT_SERV').AsFloat := vTotalServ;
            fExecHw.ParamByName('VALOR_TOTAL').AsFloat := vTotal;
            fExecHw.ParamByName('DESCONTO').AsFloat := vDesconto;
            fExecHw.ParamByName('ACRESCIMO').AsFloat := vAcrescimo;

            if Trim(vTipoPed) = 'OS' then
            begin
              fExecHw.ParamByName('OBS_OS').AsString := 'CUPOM FISCAL N° ' + fBuscasFPed.FieldByName('CUPOM').AsString;
              fExecHw.ParamByName('TIPO_OS').AsString := 'CLIENTE';
            end;

            vCodVendedor := 0;
            try
              vDadosIniF.vCodVendedorPadrao := Trim(IntToStr(StrToInt(vDadosIniF.vCodVendedorPadrao)));
            except
              vDadosIniF.vCodVendedorPadrao := '0';
            end;
            fBuscasHwPed.Close;
            fBuscasHwPed.SQL.Text := 'select COD_VENDEDOR, NOME_VENDEDOR from COLABORADOR' +
              ' where COD_VENDEDOR = :COD_VENDEDOR' +
              ' and COD_EMPRESA = ' + vDadosIniF.codEmpresa;
            if (fBuscasFPed.FieldByName('COD_VENDEDOR').AsInteger > 0) and (vCodVendedor = 0) then
            begin
              fBuscasHwPed.ParamByName('COD_VENDEDOR').AsInteger := fBuscasFPed.FieldByName('COD_VENDEDOR').AsInteger;
              fBuscasHwPed.Open;
              if fBuscasHwPed.FieldByName('COD_VENDEDOR').AsInteger > 0 then
              begin
                vCodVendedor := fBuscasHwPed.FieldByName('COD_VENDEDOR').AsInteger;
                vNomeVend := fBuscasHwPed.FieldByName('NOME_VENDEDOR').AsString;
              end;
            end;
            if (vDadosIniF.vCodVendedorPadrao <> '0') and (vCodVendedor = 0) then
            begin
              fBuscasHwPed.Close;
              fBuscasHwPed.ParamByName('COD_VENDEDOR').AsInteger := StrToInt(vDadosIniF.vCodVendedorPadrao);
              fBuscasHwPed.Open;
              if fBuscasHwPed.FieldByName('COD_VENDEDOR').AsInteger > 0 then
              begin
                vCodVendedor := fBuscasHwPed.FieldByName('COD_VENDEDOR').AsInteger;
                vNomeVend := fBuscasHwPed.FieldByName('NOME_VENDEDOR').AsString;
              end;
            end;
            if (vDadosIniF.vCodUsuario > 0) and (vCodVendedor = 0) then
            begin
              fBuscasHwPed.Close;
              fBuscasHwPed.ParamByName('COD_VENDEDOR').AsInteger := vDadosIniF.vCodUsuario;
              fBuscasHwPed.Open;
              if fBuscasHwPed.FieldByName('COD_VENDEDOR').AsInteger > 0 then
              begin
                vCodVendedor := fBuscasHwPed.FieldByName('COD_VENDEDOR').AsInteger;
                vNomeVend := fBuscasHwPed.FieldByName('NOME_VENDEDOR').AsString;
              end;
            end;
            if (vCodVendedor = 0) then
            begin
              fBuscasHwPed.Close;
              fBuscasHwPed.SQL.Text := 'select first 1 COD_VENDEDOR, NOME_VENDEDOR from COLABORADOR' +
                ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa;
              fBuscasHwPed.Open;
              if fBuscasHwPed.FieldByName('COD_VENDEDOR').AsInteger > 0 then
              begin
                vCodVendedor := fBuscasHwPed.FieldByName('COD_VENDEDOR').AsInteger;
                vNomeVend := fBuscasHwPed.FieldByName('NOME_VENDEDOR').AsString;
              end
              else
                Break;
            end;
            fExecHw.ParamByName('COD_VENDEDOR').AsInteger := vCodVendedor;

            vCodCliente := 0;
            try
              vDadosIniF.vCliente.vCodClientePadrao := Trim(IntToStr(StrToInt(vDadosIniF.vCliente.vCodClientePadrao)));
            except
              vDadosIniF.vCliente.vCodClientePadrao := '0';
            end;
            fBuscasHwPed.Close;
            fBuscasHwPed.SQL.Text := 'select COD_CLIENTE from CLIENTES' +
              ' where COD_CLIENTE = :COD_CLIENTE' +
              ' and COD_EMPRESA = ' + vDadosIniF.codEmpresa;
            if (fBuscasFPed.FieldByName('CLIENTE').AsInteger > 0) and (vCodCliente = 0) then
            begin
              fBuscasHwPed.ParamByName('COD_CLIENTE').AsInteger := fBuscasFPed.FieldByName('CLIENTE').AsInteger;
              fBuscasHwPed.Open;
              if fBuscasHwPed.FieldByName('COD_CLIENTE').AsInteger > 0 then
                vCodCliente := fBuscasHwPed.FieldByName('COD_CLIENTE').AsInteger;
            end;
            if (vDadosIniF.vCliente.vCodClientePadrao <> '0') and (vCodCliente = 0) then
            begin
              fBuscasHwPed.ParamByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIniF.vCliente.vCodClientePadrao);
              fBuscasHwPed.Open;
              if fBuscasHwPed.FieldByName('COD_CLIENTE').AsInteger > 0 then
                vCodCliente := fBuscasHwPed.FieldByName('COD_CLIENTE').AsInteger
              else
                Break;
            end;
            fExecHw.ParamByName('COD_CLIENTE').AsInteger := vCodCliente;

            fBuscasHwPed.Close;
            fBuscasHwPed.SQL.Text := 'select COD_COND_PAG from COND_PAG' +
              ' where DESC_COND_PAG like ' + QuotedStr('%' + 'ISTA' + '%');
            fBuscasHwPed.Open;
            if fBuscasHwPed.FieldByName('COD_COND_PAG').AsInteger > 0 then
              fExecHw.ParamByName('COD_COND_PAG').AsInteger := fBuscasHwPed.FieldByName('COD_COND_PAG').AsInteger
            else
            begin
              fBuscasHwPed.Close;
              fBuscasHwPed.SQL.Text := 'select first 1 COD_COND_PAG from COND_PAG';
              fBuscasHwPed.Open;
              if fBuscasHwPed.FieldByName('COD_COND_PAG').AsInteger > 0 then
                fExecHw.ParamByName('COD_COND_PAG').AsInteger := fBuscasHwPed.FieldByName('COD_COND_PAG').AsInteger
              else
                Break;
            end;
            fExecHw.ExecSQL;

            vnItemP := 0;
            vnItemS := 0;
            fBuscasFPed2.First;
            while not fBuscasFPed2.Eof do
            begin
              if (fBuscasFPed2.FieldByName('PROD_SERV').AsString = 'P') and
                (Trim(fBuscasFPed2.FieldByName('STATUS_IT').AsString) <> 'CANCELADO') then
              begin
                vnItemP := vnItemP + 1;

                fExecHw.Close;
                fExecHw.SQL.Text := fInsertPedVendaProd;
                fExecHw.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
                fExecHw.ParamByName('TIPO').AsString := vTipoPed;
                fExecHw.ParamByName('NPED').AsInteger := vNPed;
                fExecHw.ParamByName('COD_VENDEDOR').AsInteger := vCodVendedor;//para ficar igual ao cabeçalho//fBuscasFPed2.FieldByName('COD_VENDEDOR').AsInteger;
                fExecHw.ParamByName('NOME_VEND').AsString := Trim(SqlOpen('select first 1  NOME_VENDEDOR from COLABORADOR' +
                                                                          ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
                                                                          ' and COD_VENDEDOR = ' + IntToStr(fExecHw.ParamByName('COD_VENDEDOR').AsInteger)).
                                                                          FieldByName('NOME_VENDEDOR').AsString);
                fExecHw.ParamByName('TP_NF_PED').AsString := '2';
                fExecHw.ParamByName('SIT_ATD').AsString := 'NT';
                fExecHw.ParamByName('NITEM').AsInteger := vnItemP;
                fExecHw.ParamByName('GRUPO_PROD').AsInteger := fBuscasFPed2.FieldByName('GRUPO_PROD').AsInteger;
                fExecHw.ParamByName('COD_PROD').AsString := fBuscasFPed2.FieldByName('COD_PROD').AsString;
                fExecHw.ParamByName('COD_GRADE').AsInteger := fBuscasFPed2.FieldByName('COD_GRADE').AsInteger;
                fExecHw.ParamByName('DESCR_PROD_PED').AsString := fBuscasFPed2.FieldByName('DESCR_IT').AsString;
                fExecHw.ParamByName('NUM_FAB_PROD').AsString := fBuscasFPed2.FieldByName('CODBARRA').AsString;
                fExecHw.ParamByName('UNIDADE').AsString := fBuscasFPed2.FieldByName('UNIDADE').AsString;
                fExecHw.ParamByName('QUANT_PED_ITEM').AsFloat := fBuscasFPed2.FieldByName('QUANTIDADE').AsFloat;
                fExecHw.ParamByName('VLTOT_PED_ITEM').AsFloat := fBuscasFPed2.FieldByName('TOTAL').AsFloat;
                fExecHw.ParamByName('VLUN_PED_ITEM').AsFloat := fExecHw.ParamByName('VLTOT_PED_ITEM').AsFloat /
                  fExecHw.ParamByName('QUANT_PED_ITEM').AsFloat;
                fExecHw.ParamByName('VLUN_ORIG').AsFloat := fExecHw.ParamByName('VLUN_PED_ITEM').AsFloat;
                fExecHw.ParamByName('VLUN_PED_NF').AsFloat := fExecHw.ParamByName('VLUN_PED_ITEM').AsFloat;
                fExecHw.ParamByName('VLTOT_PED_NF').AsFloat := fExecHw.ParamByName('VLTOT_PED_ITEM').AsFloat;
                fExecHw.ParamByName('RATEIO_DESC').AsFloat := fBuscasFPed2.FieldByName('RAT_DESC').AsFloat;
                fExecHw.ParamByName('RATEIO_ACRESC').AsFloat := fBuscasFPed2.FieldByName('RAT_ACRES').AsFloat;
                fExecHw.ParamByName('ALIQUOTA_CP').AsString := fBuscasFPed2.FieldByName('ALIQUOTA_IT').AsString;
                fExecHw.ParamByName('DESC_ITEM').AsFloat := fBuscasFPed2.FieldByName('PERC_DESC').AsFloat;
                fExecHw.ParamByName('ACRESC_ITEM').AsFloat := fBuscasFPed2.FieldByName('PERC_ACRESC').AsFloat;
                fExecHw.ParamByName('RATEIO_DESC').AsFloat := fExecHw.ParamByName('RATEIO_DESC').AsFloat +
                  fExecHw.ParamByName('DESC_ITEM').AsFloat;
                fExecHw.ParamByName('RATEIO_ACRESC').AsFloat := fExecHw.ParamByName('RATEIO_ACRESC').AsFloat +
                  fExecHw.ParamByName('ACRESC_ITEM').AsFloat;
                if fBuscasFPed2.FieldByName('PERC_DESC').AsFloat > 0 then
                begin
                  fExecHw.ParamByName('TP_DESCACRES').AsString := 'DESCONTO';
                  fExecHw.ParamByName('NAT_DESCACRES').AsString := 'VALOR';
                  fExecHw.ParamByName('VALOR_DESCACRES').AsFloat := fBuscasFPed2.FieldByName('PERC_DESC').AsFloat;
                end
                else if fBuscasFPed2.FieldByName('PERC_ACRESC').AsFloat > 0 then
                begin
                  fExecHw.ParamByName('TP_DESCACRES').AsString := 'ACRÉSCIMO';
                  fExecHw.ParamByName('NAT_DESCACRES').AsString := 'VALOR';
                  fExecHw.ParamByName('VALOR_DESCACRES').AsFloat := fBuscasFPed2.FieldByName('PERC_ACRESC').AsFloat;
                end;

                fBuscasHwPed.Close;
                fBuscasHwPed.SQL.Text:= 'select PREC_CUS_PROD, PREC_CUSR_PROD, PREC_CUSM_PROD, PREC_CUSMR_PROD,'+
                  ' ICMANT_SUB, CODIGO_NOP from PRODUTOS'+
                  ' where GRUPO_PROD = :GRUPO_PROD' +
                  ' and COD_PROD = :COD_PROD' +
                  ' and COD_EMPRESA = ' + vDadosIniF.codEmpresa;
                fBuscasHwPed.ParamByName('GRUPO_PROD').AsInteger := fBuscasFPed2.FieldByName('GRUPO_PROD').AsInteger;
                fBuscasHwPed.ParamByName('COD_PROD').AsString := fBuscasFPed2.FieldByName('COD_PROD').AsString;
                fBuscasHwPed.Open;
                fExecHw.ParamByName('PCUST_C').AsFloat := fBuscasHwPed.FieldByName('PREC_CUS_PROD').AsFloat;
                fExecHw.ParamByName('PCUST_R').AsFloat := fBuscasHwPed.FieldByName('PREC_CUSR_PROD').AsFloat;
                if fBuscasFPed2.FieldByName('PREC_CUSM_PROD').AsFloat > 0 then
                  fExecHw.ParamByName('PCUST_MC').AsFloat := fBuscasFPed2.FieldByName('PREC_CUSM_PROD').AsFloat
                else
                  fExecHw.ParamByName('PCUST_MC').AsFloat := fBuscasHwPed.FieldByName('PREC_CUSM_PROD').AsFloat;
                fExecHw.ParamByName('PCUST_MR').AsFloat := fBuscasHwPed.FieldByName('PREC_CUSMR_PROD').AsFloat;
                fExecHw.ParamByName('ICMANT_SUB').AsFloat := fBuscasHwPed.FieldByName('ICMANT_SUB').AsFloat;
                if vDadosIniF.vModoCompatibilidade = 'S' then
                  fExecHw.ParamByName('CODIGO_NOP').AsFloat := vnItemP
                else
                  fExecHw.ParamByName('CODIGO_NOP').AsFloat := fBuscasHwPed.FieldByName('CODIGO_NOP').AsFloat;
                fExecHw.ExecSQL;

                fExecHw.Close;
//                fExecHw.SQL.Text := 'execute procedure BAIXA_ESTOQUE(:GRUPO_PROD, :COD_PROD, :QUANTIDADE , 0, 0, 0,current_date, ' + vDadosIniF.codEmpresa + ')';
                fExecHw.SQL.Text := 'execute procedure movimenta_estoque(:GRUPO_PROD, :COD_PROD, ' + vDadosIniF.codEmpresa + ', 0,  0, :QUANTIDADE, 0)';
                fExecHw.ParamByName('GRUPO_PROD').AsInteger := fBuscasFPed2.FieldByName('GRUPO_PROD').AsInteger;
                fExecHw.ParamByName('COD_PROD').AsString := fBuscasFPed2.FieldByName('COD_PROD').AsString;
                fExecHw.ParamByName('QUANTIDADE').AsFloat := fBuscasFPed2.FieldByName('QUANTIDADE').AsFloat;
                fExecHw.ExecSQL;
              end
              else if (fBuscasFPed2.FieldByName('PROD_SERV').AsString = 'S') and
                (Trim(fBuscasFPed2.FieldByName('STATUS_IT').AsString) <> 'CANCELADO') then
              begin
                vnItemS :=vnItemS + 1;

                fExecHw.Close;
                fExecHw.SQL.Text := fInsertPedVendaServ;
                fExecHw.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
                fExecHw.ParamByName('TIPO').AsString := vTipoPed;
                fExecHw.ParamByName('NPED').AsInteger := vNPed;
                fExecHw.ParamByName('COD_SERVICO').AsInteger := fBuscasFPed2.FieldByName('GRUPO_PROD').AsInteger;
                fExecHw.ParamByName('COD_VENDEDOR').AsInteger := vCodVendedor;//para ficar igual do cabeçalho//fBuscasFPed2.FieldByName('COD_VENDEDOR').AsInteger;
                fExecHw.ParamByName('NOME_VEND').AsString := Trim(SqlOpen('select first 1  NOME_VENDEDOR from COLABORADOR' +
                                                                          ' where COD_EMPRESA = ' + vDadosIniF.codEmpresa +
                                                                          ' and COD_VENDEDOR = ' + IntToStr(fExecHw.ParamByName('COD_VENDEDOR').AsInteger)).
                                                                          FieldByName('NOME_VENDEDOR').AsString);
                fExecHw.ParamByName('NITEM').AsInteger := vnItemS;
                fExecHw.ParamByName('QUANT_SERV_PED').AsFloat := fBuscasFPed2.FieldByName('QUANTIDADE').AsFloat;
                fExecHw.ParamByName('VALOR_TOT_SERV').AsFloat := fBuscasFPed2.FieldByName('TOTAL').AsFloat;
                fExecHw.ParamByName('VALOR_UN_SERV').AsFloat := fExecHw.ParamByName('VALOR_TOT_SERV').AsFloat /
                  fExecHw.ParamByName('QUANT_SERV_PED').AsFloat;
                fExecHw.ParamByName('VLUN_ORIG').AsFloat := fExecHw.ParamByName('VALOR_UN_SERV').AsFloat;
                fExecHw.ParamByName('RATEIO_DESC').AsFloat := fBuscasFPed2.FieldByName('RAT_DESC').AsFloat;
                fExecHw.ParamByName('RATEIO_ACRESC').AsFloat := fBuscasFPed2.FieldByName('RAT_ACRES').AsFloat;
                fExecHw.ParamByName('DESC_SERV_PED').AsString := fBuscasFPed2.FieldByName('DESCR_IT').AsString;
                fExecHw.ParamByName('COD_VENDEDOR1').AsInteger := vCodVendedor;
                fExecHw.ParamByName('DESC_ITEM').AsFloat := fBuscasFPed2.FieldByName('PERC_DESC').AsFloat;
                fExecHw.ParamByName('ACRESC_ITEM').AsFloat := fBuscasFPed2.FieldByName('PERC_ACRESC').AsFloat;
                fExecHw.ParamByName('RATEIO_DESC').AsCurrency := fExecHw.ParamByName('RATEIO_DESC').AsCurrency +
                  fBuscasFPed2.FieldByName('PERC_DESC').AsCurrency;
                fExecHw.ParamByName('RATEIO_ACRESC').AsCurrency := fExecHw.ParamByName('RATEIO_ACRESC').AsCurrency +
                  fBuscasFPed2.FieldByName('PERC_ACRESC').AsCurrency;

                if vDadosIniF.vModoCompatibilidade = 'S' then
                  fExecHw.ParamByName('CODIGO_NOP').AsFloat := vnItemS
                else
                begin
                  fBuscasHwPed.Close;
                  fBuscasHwPed.SQL.Text:= 'select CODIGO_NOP from TIPO_SERVICO'+
                    ' where COD_SERVICO = :COD_SERVICO';
                  fBuscasHwPed.ParamByName('COD_SERVICO').AsInteger := fBuscasFPed2.FieldByName('GRUPO_PROD').AsInteger;
                  fBuscasHwPed.Open;
                  fExecHw.ParamByName('CODIGO_NOP').AsFloat := fBuscasHwPed.FieldByName('CODIGO_NOP').AsFloat;
                end;
                fExecHw.ExecSQL;
              end;
              fBuscasFPed2.Next;
            end;

            if fExecHw.Transaction.InTransaction then
              fExecHw.Transaction.Commit;

            if fBuscasHwPed.Transaction.InTransaction then
              fBuscasHwPed.Transaction.Commit;

            vMD5Func._gravaMD5_Produtos(fBuscasHwPed, fExecHw, vTipoPed, vNPed);
          end;
        end;
      end;

      fBuscasFPed.Next;
      if pDataOuRegistro = 'data' then
      begin
        fPos := fPos + 1;
        if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
          vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
      end;
    end;

    if pAlterarDataRegistro then
      vDadosIniF._GravaConfiguracoesString('DataAtEstoque', DateToStr(Date));

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarPedVenda. Erro: ' + e.Message);
    end;
  end;
end;

procedure TAtualizacaoRetaguarda._sincronizarResumoD;
var
  I: Integer;
begin
  try
    fBuscasF.Close;
    fBuscasF.SQL.Text :=
      'select * from RESUMOD where cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
      ' and cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and enviado_ret = ''A'' ';
    fBuscasF.Open;

    fBuscasF.FetchAll;
    fMax := fBuscasF.RecordCount;
    fPos := 0;

    fBuscasF.First;
    while not fBuscasF.Eof do
    begin
      fTexto := 'Redução Z';

      fBuscasHw.Close;
      fBuscasHw.SQL.Text := 'select COD_TERMINAL, NSERIEECF, COD_EMPRESA, COORED, DATA_MOV from RESUMOD' +
      	' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and COORED = :COORED';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('COORED').AsInteger := fBuscasF.FieldByName('COORED').AsInteger;
      fBuscasHw.Open;

      if fBuscasHw.IsEmpty then
        fExecHw.SQL.Text := fInsertResumoD
      else
        fExecHw.SQL.Text := fUpdateResumoD;

      // Alterando/inserindo registros na tabela
      fExecHw.Close;
      for I:= 0 to fExecHw.Params.Count - 1 do
        if Trim(fExecHw.Params[I].Name) = 'NSERIEECF' then
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            vDadosIniF.decodifica(fBuscasF.FieldByName(fExecHw.Params[I].Name).Value)
        else
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            fBuscasF.FieldByName(fExecHw.Params[I].Name).Value;
      fExecHw.ExecSQL;

      if fExecHw.Transaction.InTransaction then
        fExecHw.Transaction.Commit;

      //Alterando o status de envio do registro
      fExecF.Close;
      fExecF.SQL.Text := 'update RESUMOD set ENVIADO_RET = ''S''' +
        ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and COORED = :COORED';
      fExecF.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fExecF.ParamByName('NSERIEECF').AsString := fBuscasF.FieldByName('NSERIEECF').AsString;
      fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fExecF.ParamByName('COORED').AsInteger := fBuscasF.FieldByName('COORED').AsInteger;
      fExecF.ExecSQL;

      if fExecF.Transaction.InTransaction then
        fExecF.Transaction.Commit;

      //Gerando md5 do registro
      fBuscasHw.Close;
      fBuscasHw.SQL.Text :=
        'SELECT RES.NSERIEECF,IMP.MF_ADICIONAL,CNIEE.MODELO_ECF,IMP.COD_PROPRIETARIO,RES.NREDUCOES,RES.COORED,' +
        'RES.CRO_MOV,RES.DATA_MOV,RES.DATA_EMISSAO_Z,RES.HORA_EMISSAO_Z,RES.VLVENDAB,' +
        'IMP.ISSQNDESC, RES.MD5 FROM ' +
        'RESUMOD RES, TERMINAL_IMPRESSORAS IMP,IMPRESSORAS_CNIEE CNIEE WHERE' +
        ' RES.COD_TERMINAL = ' + IntToStr(fBuscasF.FieldByName('COD_TERMINAL').AsInteger) +
        ' AND RES.NSERIEECF = ' + QuotedStr(vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString)) +
        ' AND RES.COD_EMPRESA = ' + IntToStr(fBuscasF.FieldByName('COD_EMPRESA').AsInteger) +
        ' AND RES.COORED = ' + IntToStr(fBuscasF.FieldByName('COORED').AsInteger) +
        ' AND RES.COD_TERMINAL = IMP.COD_TERMINAL AND RES.COD_EMPRESA = ' +
        ' IMP.COD_EMPRESA AND IMP.ATUAL = ''S'' AND IMP.IDENT_CNIEE = CNIEE.IDENTIFICACAO ';
      fBuscasHw.Open;

      if not fBuscasHw.IsEmpty then
        vMD5Func._gravaMD5_RegistrosPAF( fExecHw,
          Trim(fBuscasHw.FieldByName('NSERIEECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MF_ADICIONAL').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('MODELO_ECF').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('COD_PROPRIETARIO').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('NREDUCOES').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('COORED').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('CRO_MOV').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('DATA_MOV').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('DATA_EMISSAO_Z').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('HORA_EMISSAO_Z').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('VLVENDAB').AsString) + '|' +
          Trim(fBuscasHw.FieldByName('ISSQNDESC').AsString) + '|',
          'RESUMOD',
          ' COD_TERMINAL = ' + IntToStr(fBuscasF.FieldByName('COD_TERMINAL').AsInteger) +
          ' AND NSERIEECF = ' + QuotedStr(vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString)) +
          ' AND COD_EMPRESA = ' + IntToStr(fBuscasF.FieldByName('COD_EMPRESA').AsInteger) +
          ' AND COORED = ' + IntToStr(fBuscasF.FieldByName('COORED').AsInteger)
        );

//      if not fBuscasHw.IsEmpty then
//        vMD5Func._gravaMD5_ReducaoZ( fExecHw,
//          fBuscasHw.FieldByName('COORED').AsInteger,
//          fBuscasHw.FieldByName('COD_TERMINAL').AsInteger,
//          fBuscasHw.FieldByName('NSERIEECF').AsString,
//          fBuscasHw.FieldByName('DATA_MOV').AsString);

      fBuscasF.Next;
      fPos := fPos + 1;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
    end;

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarResumoD. Erro: ' + e.Message);
    end;
  end;
end;

procedure TAtualizacaoRetaguarda._sincronizarSangSupPrest;
var
  I: Integer;
begin
  try
    fBuscasF.Close;
    fBuscasF.SQL.Text :=
      'select * from SANGSUP where cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
      ' and cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and enviado_ret = ''A'' ';
    fBuscasF.Open;

    fBuscasF.FetchAll;
    fMax := fBuscasF.RecordCount;
    fPos := 0;

    fBuscasF.First;
    while not fBuscasF.Eof do
    begin
      fTexto := 'Receb ñ Fisc';

      fBuscasHw.Close;
      fBuscasHw.SQL.Text := 'select COD_TERMINAL, NSERIEECF, COD_EMPRESA, NREG, SANGSUPRIMENTO from SANGSUP' +
      	' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and NREG = :NREG and SANGSUPRIMENTO = :SANGSUPRIMENTO';
      fBuscasHw.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fBuscasHw.ParamByName('NSERIEECF').AsString := vDadosIniF.decodifica(fBuscasF.FieldByName('NSERIEECF').AsString);
      fBuscasHw.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fBuscasHw.ParamByName('NREG').AsInteger := fBuscasF.FieldByName('NREG').AsInteger;
      fBuscasHw.ParamByName('SANGSUPRIMENTO').AsString := fBuscasF.FieldByName('SANGSUPRIMENTO').AsString;
      fBuscasHw.Open;

      if fBuscasHw.IsEmpty then
        fExecHw.SQL.Text := fInsertSangSupPrest
      else
        fExecHw.SQL.Text := fUpdateSangSupPrest;

      // Alterando/inserindo registros na tabela
      fExecHw.Close;
      for I:= 0 to fExecHw.Params.Count - 1 do
        if Trim(fExecHw.Params[I].Name) = 'NSERIEECF' then
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            vDadosIniF.decodifica(fBuscasF.FieldByName(fExecHw.Params[I].Name).Value)
        else
          fExecHw.ParamByName(fExecHw.Params[I].Name).Value :=
            fBuscasF.FieldByName(fExecHw.Params[I].Name).Value;
      fExecHw.ExecSQL;

      if fExecHw.Transaction.InTransaction then
        fExecHw.Transaction.Commit;

      //Alterando o status de envio do registro
      fExecF.Close;
      fExecF.SQL.Text := 'update SANGSUP set ENVIADO_RET = ''S''' +
        ' where COD_TERMINAL = :COD_TERMINAL and NSERIEECF = :NSERIEECF and COD_EMPRESA = :COD_EMPRESA and NREG = :NREG and SANGSUPRIMENTO = :SANGSUPRIMENTO';
      fExecF.ParamByName('COD_TERMINAL').AsInteger := fBuscasF.FieldByName('COD_TERMINAL').AsInteger;
      fExecF.ParamByName('NSERIEECF').AsString := fBuscasF.FieldByName('NSERIEECF').AsString;
      fExecF.ParamByName('COD_EMPRESA').AsInteger := fBuscasF.FieldByName('COD_EMPRESA').AsInteger;
      fExecF.ParamByName('NREG').AsInteger := fBuscasF.FieldByName('NREG').AsInteger;
      fExecF.ParamByName('SANGSUPRIMENTO').AsString := fBuscasF.FieldByName('SANGSUPRIMENTO').AsString;
      fExecF.ExecSQL;

      if fExecF.Transaction.InTransaction then
        fExecF.Transaction.Commit;

      fBuscasF.Next;
      fPos := fPos + 1;
      if vDadosIniF.vSincronizacaoEmSegundoPlano <> 'S' then
        vDadosIniF.abreStatusProcessamento('Sincronização', fTexto + ': ' + IntToStr(fPos) + ' de ' +IntToStr(fMax));
    end;

  except
    on E:Exception do begin
      if fTransacaoHw.InTransaction then
        fTransacaoHw.Rollback;
      if fTransacaoFExec.InTransaction then
        fTransacaoFExec.Rollback;
      vDadosIniF.registraErro('_sincronizarSangSupPrest. Erro: ' + e.Message);
    end;
  end;
end;

end.
