unit uClassesMig;

interface

uses
  uClassesMigRegistros, IBQuery, IBDatabase, Classes;

type

  TBaseMig = class(TObject)
  private
    FQrAux    : TIBQuery;
    FBanco    : TIBDatabase;
    FTransacao: TIBTransaction;
    FBuscas   : TIBQuery;
    FFreeTrDb : Boolean;
    procedure SetBuscas(const Value: TIBQuery);
  protected
  public
    destructor destroy; override;
    constructor create; overload;
    constructor create(ATransaction: TIBTransaction); overload;
    function conectar(Banco, Usuario, Senha: string): Boolean;
    function desconectar: Boolean;
    function DefinirSqlInsert(Tabela: string; Campos: TStringList): TStrings;

    procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: Double; ATipoData: Boolean = False; Nullable: Boolean = True); overload;
    procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: Integer; Nullable: Boolean = True); overload;
    procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: string; ALength: Integer; Nullable: Boolean = True; AUpper: Boolean = True); overload;
    procedure SetParamVal(AQuery: TIBQuery; AFieldName: string; Value: Boolean; TrueValue, FalseValue: string; ALength: Integer); overload;

    property QrAux    : TIBQuery       read FQrAux     write FQrAux;
    property Banco    : TIBDatabase    read FBanco     write FBanco;
    property Transacao: TIBTransaction read FTransacao write FTransacao;
    property Buscas   : TIBQuery       read FBuscas    write SetBuscas;
  end;

  TGeraRegistros = class(TBaseMig)
  private
    FLasError: string;
  public
    function Inserir(APedVenda: TReg_PedVenda): Boolean; overload;

    property LasError: string read FLasError;
  end;


implementation

uses
  SysUtils, Forms, StrUtils, Variants, DateUtils, uDadosIni, uDtmAtivo, PedVendaProd_Model, PedVendaServ_Model, 
  formpagamento_class, boletas_class;

{ TConexao }

function TBaseMig.conectar(Banco, Usuario, Senha: string): Boolean;
begin
  try
    FBanco.Connected := False;
    FBanco.Params[0] := 'user_name=' + Usuario;
    FBanco.Params[1] := 'password=' + Senha;
    FBanco.DatabaseName := Banco;

    FBanco.Connected := True;
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Não foi possivel conectar ao banco de dados. Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

constructor TBaseMig.create;
begin
  FFreeTrDb := True;
  FBanco := TIBDatabase.Create(Application);

  FTransacao := TIBTransaction.Create(Application);
  FTransacao.DefaultDatabase := FBanco;
  FTransacao.Params.Add('read_committed');
  FTransacao.Params.Add('rec_version');
  FTransacao.Params.Add('nowait');

  FBanco.Connected          := False;
  FBanco.DefaultTransaction := FTransacao;
  FBanco.LoginPrompt        := false;
  FBanco.Params.Add('user_name=sysdba');
  FBanco.Params.Add('password=masterkey');

  FQrAux             := TIBQuery.Create(Application);
  FQrAux.Database    := FBanco;
  FQrAux.Transaction := FTransacao;

  FBuscas             := TIBQuery.Create(Application);
  FBuscas.Database    := FBanco;
  FBuscas.Transaction := FTransacao;
end;

constructor TBaseMig.create(ATransaction: TIBTransaction);
begin
  FFreeTrDb := False;
  FBanco := TIBDatabase(ATransaction.DefaultDatabase);
  FTransacao := TIBTransaction(ATransaction);

  FQrAux             := TIBQuery.Create(Application);
  FQrAux.Database    := FBanco;
  FQrAux.Transaction := FTransacao;

  FBuscas             := TIBQuery.Create(Application);
  FBuscas.Database    := FBanco;
  FBuscas.Transaction := FTransacao;
end;

function TBaseMig.DefinirSqlInsert(Tabela: string;
  Campos: TStringList): TStrings;
var
  TmpSql: string;
  I: Integer;
  SqlList: TStrings;
begin
  TmpSql := '';
  for I := 0 to Campos.Count - 1 do
    TmpSql := TmpSql + '@' + Campos[I] + ',';

  if Length(TmpSql) > 0 then
    Delete(TmpSql, Length(TmpSql), 1);
  TmpSql := '(' + TmpSql + ')';
  SqlList := TStringList.Create;

  SqlList.Clear;
  SqlList.Add('insert into ' + Tabela);
  SqlList.Add(StringReplace(TmpSql, '@', ' ', [rfReplaceAll]));
  SqlList.Add(' values ');
  SqlList.Add(StringReplace(TmpSql, '@', ' :', [rfReplaceAll]));
  Result := SqlList;
end;

function TBaseMig.desconectar: Boolean;
begin
  try
    if FBanco.Connected then
      FBanco.Connected := False;

    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

destructor TBaseMig.destroy;
begin
  if FFreeTrDb then
  begin
    FreeAndNil(FBanco);
    FreeAndNil(FTransacao);
  end;
  FreeAndNil(FQrAux);
  FreeAndNil(FBuscas);
  inherited;
end;

procedure TBaseMig.SetBuscas(const Value: TIBQuery);
begin
  FBuscas := Value;
end;

procedure TBaseMig.SetParamVal(AQuery: TIBQuery; AFieldName: string;
  Value: Boolean; TrueValue, FalseValue: string; ALength: Integer);
begin
  AQuery.ParamByName(AFieldName).AsString := Copy(string(IfThen(Value, TrueValue, FalseValue)), 1, ALength);
end;

procedure TBaseMig.SetParamVal(AQuery: TIBQuery; AFieldName: string;
  Value: Double; ATipoData, Nullable: Boolean);
begin
  if (Value = 0) and (Nullable) then
    AQuery.ParamByName(AFieldName).Value := Unassigned
  else if ATipoData then
    AQuery.ParamByName(AFieldName).AsDateTime := DateOf(Value) + TimeOf(Value)
  else
    AQuery.ParamByName(AFieldName).AsFloat := Value;
end;

procedure TBaseMig.SetParamVal(AQuery: TIBQuery; AFieldName: string;
  Value: Integer; Nullable: Boolean);
begin
  if (Value = 0) and (Nullable) then
    AQuery.ParamByName(AFieldName).Value := Unassigned
  else
    AQuery.ParamByName(AFieldName).Value := Value;
end;

procedure TBaseMig.SetParamVal(AQuery: TIBQuery; AFieldName, Value: string;
  ALength: Integer; Nullable, AUpper: Boolean);
begin
  if AUpper then
    Value := UpperCase(Value);
  if (Value = '') and (Nullable) then
    AQuery.ParamByName(AFieldName).Value := Unassigned
  else if ALength > 0 then
    AQuery.ParamByName(AFieldName).AsString := Copy(Value, 1, ALength)
  else
  	AQuery.ParamByName(AFieldName).AsString := Value;
end;

{ TGeraRegistros }

function TGeraRegistros.Inserir(APedVenda: TReg_PedVenda): Boolean;
var
  I, J: Integer;
begin
  Result := False;
  FLasError := '';

  QrAux.Close;
  QrAux.SQL := DefinirSqlInsert('PEDVENDA', APedVenda.GetCamposDaTabela);

  try
    SetParamVal(QrAux, 'NPED' , APedVenda.nped);
    SetParamVal(QrAux, 'TIPO' , APedVenda.tipo, 3);
    if (APedVenda.cod_empresa > 0 ) then
    	SetParamVal(QrAux, 'COD_EMPRESA' , APedVenda.cod_empresa)
    else
	    SetParamVal(QrAux, 'COD_EMPRESA' , StrToInt(vDadosIni.CodEmpresa));
    SetParamVal(QrAux, 'ATIVO', 1);
    SetParamVal(QrAux, 'COD_EQUIP', APedVenda.cod_equip);
    SetParamVal(QrAux, 'APARELHO_PED', APedVenda.aparelho_ped, 128);
    SetParamVal(QrAux, 'COD_VEICULO', APedVenda.cod_veiculo);
    SetParamVal(QrAux, 'CHASSI', APedVenda.chassi, 17);
    SetParamVal(QrAux, 'PLACA', APedVenda.placa, 10);
    SetParamVal(QrAux, 'COD_CLIENTE' , APedVenda.cod_cliente);
    SetParamVal(QrAux, 'COD_VENDEDOR' , APedVenda.cod_vendedor);
    SetParamVal(QrAux, 'VALOR_TOTAL' , APedVenda.valor_total, False, False);
    SetParamVal(QrAux, 'COD_COND_PAG' , APedVenda.cod_cond_pag);
    SetParamVal(QrAux, 'DATA_PED' , APedVenda.data_ped, True);
    SetParamVal(QrAux, 'DATA_FECH' , APedVenda.data_fech, True);
    SetParamVal(QrAux, 'DATA_ESTOQUE', APedVenda.data_estoque, True);
    SetParamVal(QrAux, 'DATVENC', APedVenda.datvenc, True);
    SetParamVal(QrAux, 'HORA_FECH' , APedVenda.hora_fech, 8);
    SetParamVal(QrAux, 'DESC_P_PROD' , APedVenda.desc_p_prod, False, False);
    SetParamVal(QrAux, 'DESC_P_SERV' , APedVenda.desc_p_serv, False, False);
    SetParamVal(QrAux, 'DESCONTO' , APedVenda.desconto, False, False);
    SetParamVal(QrAux, 'STATUS_CONTRATO', APedVenda.status_contrato, 1);
    SetParamVal(QrAux, 'OBS_PED' , APedVenda.obs_ped, 50);
    SetParamVal(QrAux, 'OBS_OS'  , APedVenda.obs_os, 0);
    SetParamVal(QrAux, 'OBS_CXL_RQ' , APedVenda.obs_cxl_rq, 50);
    SetParamVal(QrAux, 'OBS_LIVRO_REG', APedVenda.obs_livro_reg, 32);
    SetParamVal(QrAux, 'OBS_MINUTA', APedVenda.obs_minuta, 0);
    SetParamVal(QrAux, 'OBS_TPVENDA', APedVenda.obs_tpvenda, 0);
    SetParamVal(QrAux, 'STATUS_PED' , APedVenda.status_ped, 10);
    SetParamVal(QrAux, 'TIPV' , APedVenda.tipv, 1);
    SetParamVal(QrAux, 'TIPO_OS', APedVenda.tipo_os, 40);
    SetParamVal(QrAux, 'VL_PAGO_CXL' , APedVenda.vl_pago_cxl, False, False);
    SetParamVal(QrAux, 'TIPOR' , APedVenda.tipor, 1);
    SetParamVal(QrAux, 'HORAABERTURA' , APedVenda.horaabertura, False);
    SetParamVal(QrAux, 'MINABERTURA' , APedVenda.minabertura, False);
    SetParamVal(QrAux, 'HORAFECHAMENTO' , APedVenda.horafechamento, False);
    SetParamVal(QrAux, 'MINFECHAMENTO' , APedVenda.minfechamento, False);
    SetParamVal(QrAux, 'VL_ENTRADA' , APedVenda.vl_entrada, False, False);
    SetParamVal(QrAux, 'NPREVENDA' , APedVenda.nprevenda);
    SetParamVal(QrAux, 'ACRESC_P_PROD' , APedVenda.acresc_p_prod, False, False);
    SetParamVal(QrAux, 'ACRESC_P_SERV' , APedVenda.acresc_p_serv, False, False);
    SetParamVal(QrAux, 'ACRESCIMO' , APedVenda.acrescimo, False, False);
    SetParamVal(QrAux, 'TOT_PROD' , APedVenda.tot_prod, False, False);
    SetParamVal(QrAux, 'TOT_SERV' , APedVenda.tot_serv, False, False);
    SetParamVal(QrAux, 'TOT_PROD_TERC' , APedVenda.tot_prod_terc, False, False);
    SetParamVal(QrAux, 'TOT_SERV_TERC' , APedVenda.tot_serv_terc, False, False);
    SetParamVal(QrAux, 'CPFCGC' , APedVenda.cpfcgc, 14);
    SetParamVal(QrAux, 'LIBTRAVA' , APedVenda.libtrava, 1);
    SetParamVal(QrAux, 'SUBTIPO_OS' , APedVenda.subtipo_os, 10);
    SetParamVal(QrAux, 'APROVADA_GERENTE' , APedVenda.aprovada_gerente, 1);
    SetParamVal(QrAux, 'DATA_LIBTRAVA' , APedVenda.data_libtrava, True);
    SetParamVal(QrAux, 'NOME_CLIENTEDAV' , APedVenda.nome_clientedav, 35);
    SetParamVal(QrAux, 'NOME_CLI_ORC', APedVenda.nome_cli_orc, 35);
    SetParamVal(QrAux, 'MD5', APedVenda.md5, 256);
    SetParamVal(QrAux, 'SAVEAUTO', APedVenda.saveauto, 1);
    SetParamVal(QrAux, 'CALC', APedVenda.calc, 1);
    SetParamVal(QrAux, 'DATA_ESTOQUE', APedVenda.data_estoque, True);
    SetParamVal(QrAux, 'STATUS_CXL_RQ', APedVenda.status_cxl_rq, 1);
    SetParamVal(QrAux, 'COD_NFCE', APedVenda.cod_nfce);
    SetParamVal(QrAux, 'NUM_NFCE', APedVenda.num_nfce);
    SetParamVal(QrAux, 'TP_VENDA', APedVenda.tp_venda, 1);
    SetParamVal(QrAux, 'TP_GERAR_PONTOS', APedVenda.tp_gerar_pontos, 1);
    SetParamVal(QrAux, 'VALE_TROCA', APedVenda.vale_troca, 1);
    SetParamVal(QrAux, 'GERAR_NFS', APedVenda.gerar_nfs, 1);
    SetParamVal(QrAux, 'GERAR_NF', APedVenda.gerar_nf, 1);
    SetParamVal(QrAux, 'GERAR_REC_LOC', APedVenda.gerar_rec_loc, 1);
    SetParamVal(QrAux, 'GERAR_BOLETO', APedVenda.gerar_boleto, 1);
    SetParamVal(QrAux, 'COD_US_FECH' , vDadosIni.vCodUsuario);
    SetParamVal(QrAux, 'H_ENT', APedVenda.h_ent, True);
    SetParamVal(QrAux, 'DT_PROMETIDA', APedVenda.dt_prometida, True);
    SetParamVal(QrAux, 'H_PROMETIDA', APedVenda.h_prometida, True);
    SetParamVal(QrAux, 'SEQ_FECH', APedVenda.seq_fech);
    SetParamVal(QrAux, 'ST_TERM_SERV', APedVenda.st_term_serv, 40);
    SetParamVal(QrAux, 'DIA_CXL', APedVenda.dia_cxl, True);
    SetParamVal(QrAux, 'OP_CXL', APedVenda.op_cxl);
    SetParamVal(QrAux, 'TP_ABORD', APedVenda.tp_abord, 3);
    SetParamVal(QrAux, 'FR_PAGBOSCH', APedVenda.fr_pagbosch, 3);
    SetParamVal(QrAux, 'COD_CLI_FAT', APedVenda.cod_cli_fat);
    SetParamVal(QrAux, 'COD_GERADOR' , APedVenda.cod_gerador);

    if not QrAux.Prepared then
      QrAux.Prepare;
    QrAux.ExecSQL;

  except
    on E: Exception do
    begin
      FLasError := 'Inserir PEDVENDA ' + e.Message;
      Exit;
    end;
  end;

  ////////    PEDVENDAPROD

  QrAux.Close;
  QrAux.SQL := DefinirSqlInsert('PEDVENDA_PROD', APedVenda.Prod.GetCamposDaTabela);
  QrAux.SQL.Clear;
  QrAux.SQL.Add('insert into PEDVENDA_PROD');
  QrAux.SQL.Add('(' + TPedVendaProd_Model.GetFieldsSql() + ')');
  QrAux.SQL.Add('values ');
  QrAux.SQL.Add('(' + TPedVendaProd_Model.GetFieldsSql(':') + ')');

  for J := 0 to APedVenda.Prod.Count - 1 do
  begin
    try
      APedVenda.Prod.Items[J].nped := APedVenda.nped;
      APedVenda.Prod.Items[J].tipo := APedVenda.tipo;
      APedVenda.Prod.Items[J].cod_empresa := vDadosIni.cod_empresa;
      APedVenda.Prod.Items[J].SetValuesInParams(QrAux, True);
      SetParamVal(QrAux, 'ATIVO', 1, True); 
      SetParamVal(QrAux, 'COL_COD_VENDEDOR', APedVenda.Prod.Items[J].col_cod_vendedor, True);
      SetParamVal(QrAux, 'COD_NF', 0, True);
      SetParamVal(QrAux, 'N_NF', 0, True);
      SetParamVal(QrAux, 'SERIE', '', 5, True);

      if not QrAux.Prepared then
        QrAux.Prepare;
      QrAux.ExecSQL;
    except
      on E: Exception do
      begin
        FLasError := 'Inserir PEDVENDA_PROD ' + E.Message;
        Exit;
      end;
    end;
  end;

  ////////    PEDVENDASERV

  QrAux.Close;
  QrAux.SQL := DefinirSqlInsert('PEDVENDA_SERV', APedVenda.Serv.GetCamposDaTabela);
  QrAux.SQL.Clear;
  QrAux.SQL.Add('insert into PEDVENDA_SERV');
  QrAux.SQL.Add('(' + TPedVendaServ_Model.GetFieldsSql() + ')');
  QrAux.SQL.Add('values ');
  QrAux.SQL.Add('(' + TPedVendaServ_Model.GetFieldsSql(':') + ')');

  for J := 0 to APedVenda.Serv.Count - 1 do
  begin
    try
      APedVenda.Serv.Items[J].nped := APedVenda.nped;
      APedVenda.Serv.Items[J].tipo := APedVenda.tipo;
      APedVenda.Serv.Items[J].cod_empresa := vDadosIni.cod_empresa;
      APedVenda.Serv.Items[J].SetValuesInParams(QrAux, True);
      SetParamVal(QrAux, 'ATIVO', 1, True);
      SetParamVal(QrAux, 'COD_RPS', 0, True);
      SetParamVal(QrAux, 'N_NF', 0, True);
      SetParamVal(QrAux, 'SERIE', '', 5, True);
      SetParamVal(QrAux, 'EMISSAO_RPS', 0);
      SetParamVal(QrAux, 'EMISSAO_NFSE', 0);

      if not QrAux.Prepared then
        QrAux.Prepare;
      QrAux.ExecSQL;
    except
      on E: Exception do
      begin
        FLasError := 'Inserir PEDVENDA_SERV ' + E.Message;
        Exit;
      end;
    end;
  end;

  ////////    FORMPAGAMENTO
  QrAux.Close;
  QrAux.SQL.Clear;
  QrAux.SQL.Add('insert into FORMPAGAMENTO');
  QrAux.SQL.Add('(' + TFormpagamento_class.GetFieldsSql() + ')');
  QrAux.SQL.Add('values ');
  QrAux.SQL.Add('(' + TFormpagamento_class.GetFieldsSql(':') + ')');

  for J := 0 to APedVenda.FormPagamento.Count - 1 do
  begin
    try
      APedVenda.FormPagamento.Items[J].cod_empresa := vDadosIni.cod_empresa;
      APedVenda.FormPagamento.Items[J].SetValuesInParams(QrAux, True);
      SetParamVal(QrAux, 'ATIVO', 1, True);
      SetParamVal(QrAux, 'RECIBO', APedVenda.FormPagamento.Items[J].recibo, 1, True);
      SetParamVal(QrAux, 'REC_NUMVEND', APedVenda.FormPagamento.Items[J].rec_numvend, True);
      SetParamVal(QrAux, 'REC_TIPVEND', APedVenda.FormPagamento.Items[J].rec_tipvend, 3, True);
      SetParamVal(QrAux, 'NAO_GERA_FINAN', APedVenda.FormPagamento.Items[J].nao_gera_finan, 1, True);
      SetParamVal(QrAux, 'BAIXA_AUTOMATICA', APedVenda.FormPagamento.Items[J].baixa_automatica, 1, True);
      SetParamVal(QrAux, 'COD_BANCO', APedVenda.FormPagamento.Items[J].cod_banco, True);
      SetParamVal(QrAux, 'TERCEIROS', APedVenda.FormPagamento.Items[J].terceiros, 80, True);
      SetParamVal(QrAux, 'AGENCIA', APedVenda.FormPagamento.Items[J].agencia, 10, True);
      SetParamVal(QrAux, 'CONTA', APedVenda.FormPagamento.Items[J].conta, 15, True);
      SetParamVal(QrAux, 'BANCO', APedVenda.FormPagamento.Items[J].banco, 35, True);
      SetParamVal(QrAux, 'COD_CLI_TERC', APedVenda.FormPagamento.Items[J].cod_cli_terc, True);
      SetParamVal(QrAux, 'OPERADOR', APedVenda.FormPagamento.Items[J].operador, True);
      SetParamVal(QrAux, 'OP_CXL', APedVenda.FormPagamento.Items[J].op_cxl, True);
      SetParamVal(QrAux, 'PLANO', APedVenda.FormPagamento.Items[J].plano, 1, True);
      SetParamVal(QrAux, 'COD_COBREBEM', APedVenda.FormPagamento.Items[J].cod_cobrebem, True);
      SetParamVal(QrAux, 'NOSSO_NUMERO_BANCO', APedVenda.FormPagamento.Items[J].nosso_numero_banco, 20, True);
      SetParamVal(QrAux, 'PRCSS', APedVenda.FormPagamento.Items[J].prcss, 1, True);
      SetParamVal(QrAux, 'N_PROCESSAMENTO', APedVenda.FormPagamento.Items[J].n_processamento, True);

      if not QrAux.Prepared then
        QrAux.Prepare;
      QrAux.ExecSQL;
    except
      on E: Exception do
      begin
        FLasError := 'Inserir FORMPAGAMENTO ' + E.Message;
        Exit;
      end;
    end;
  end;

  ////////    BOLETO
  QrAux.Close;
  QrAux.SQL.Clear;
  QrAux.SQL.Add('insert into BOLETAS');
  QrAux.SQL.Add('(' + TBoletas_class.GetFieldsSql() + ')');
  QrAux.SQL.Add('values ');
  QrAux.SQL.Add('(' + TBoletas_class.GetFieldsSql(':') + ')');

  for J := 0 to APedVenda.Boleto.Count - 1 do
  begin
    try
    	APedVenda.Boleto.Items[J].cod_empresa := vDadosIni.cod_empresa;
      APedVenda.Boleto.Items[J].SetValuesInParams(QrAux, True);
      SetParamVal(QrAux, 'ATIVO' , 1, True);
      SetParamVal(QrAux, 'COD_COBREBEM' , 0);
      SetParamVal(QrAux, 'DATA_REMESSA', 0);
      SetParamVal(QrAux, 'DATA_LIM_DESC', 0);
      
      if not QrAux.Prepared then
        QrAux.Prepare;
      QrAux.ExecSQL;
    except
      on E: Exception do
      begin
        FLasError := 'Inserir BOLETAS ' + E.Message;
        Exit;
      end;
    end;
  end;

  Result := True;
end;

end.
