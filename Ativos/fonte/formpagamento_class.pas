unit formpagamento_class;

interface

uses
{$IFDEF VER180}
  basefb_class,
  Classes,
  Contnrs,
  IBQuery,
  Variants, DB;
{$ELSE}
  basefb_class,
  System.Classes,
  System.Contnrs,
  IBX.IBQuery,
  System.Variants;
{$ENDIF}

type
  TFormpagamento_class = class(TBaseFb_class)
  private
    Fseqform              : Integer;
    Fcod_empresa          : Integer;
    Fnrequisicao          : Integer;
    Fndoc                 : string;
    Ftipdoc               : string;
    Fcod_controle         : Integer;
    Fcliente              : string;
    Fcod_cliente          : Integer;
    Fhistorico            : string;
    Fcod_banco            : Integer;
    Fterceiros            : string;
    Fdata_mov             : TDateTime;
    Fvalordoc             : Double;
    Ftpdocs               : string;
    Fn_conta_plc          : Double;
    Fdata_venc            : TDateTime;
    Fprcss                : string;
    Fagencia              : string;
    Fconta                : string;
    Fbanco                : string;
    Fcod_cli_terc         : Integer;
    Foperador             : Integer;
    Ftip_cnt              : string;
    Fop_cxl               : Integer;
    Fcxl                  : string;
    Fcodigo_func          : Integer;
    Fn_aut_cart           : string;
    Fplano                : string;
    Fativo                : Integer;
    Fnum_nota             : Integer;
    Fsub_serie            : Integer;
    Fcod_cobrebem         : Integer;
    Fnosso_numero_banco   : string;
    Frecibo               : string;
    Fncoo_ecf             : Integer;
    Fsecao                : Integer;
    Fcod_terminal         : Integer;
    Fnserieecf            : string;
    Fregistro             : Integer;
    Frec_tipvend          : string;
    Frec_numvend          : Integer;
    Fn_processamento      : Integer;
    Fref_frete            : string;
    Fvalor_contabil       : Double;
    Fcod_banco_str        : string;
    Fvl_baixa_comissao    : Double;
    Fvl_baixa_comissao_ger: Double;
    Fus_cad               : Integer;
    Fnparcela             : Integer;
    Fqtde_parc            : Integer;
    Fn_docnsu_adm         : string;
    Fcod_terminal_adm     : string;
    Fnao_gera_finan       : string;
    Fbaixa_automatica     : string;
    Fmd5                  : string;
    Falterado             : string;
    Ftef                  : string;
    Fcod_gerador          : Integer;
    Fndoc_ant             : string;
    Fcod_nfce             : Integer;
    Fprg_fid              : string;
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    function SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean = False): TIBQuery;

    class function GetFieldsSql(Aalias: string = ''): string;

    property seqform              : Integer   read Fseqform               write Fseqform;
    property cod_empresa          : Integer   read Fcod_empresa           write Fcod_empresa;
    property nrequisicao          : Integer   read Fnrequisicao           write Fnrequisicao;
    property ndoc                 : string    read Fndoc                  write Fndoc;
    property tipdoc               : string    read Ftipdoc                write Ftipdoc;
    property cod_controle         : Integer   read Fcod_controle          write Fcod_controle;
    property cliente              : string    read Fcliente               write Fcliente;
    property cod_cliente          : Integer   read Fcod_cliente           write Fcod_cliente;
    property historico            : string    read Fhistorico             write Fhistorico;
    property cod_banco            : Integer   read Fcod_banco             write Fcod_banco;
    property terceiros            : string    read Fterceiros             write Fterceiros;
    property data_mov             : TDateTime read Fdata_mov              write Fdata_mov;
    property valordoc             : Double    read Fvalordoc              write Fvalordoc;
    property tpdocs               : string    read Ftpdocs                write Ftpdocs;
    property n_conta_plc          : Double    read Fn_conta_plc           write Fn_conta_plc;
    property data_venc            : TDateTime read Fdata_venc             write Fdata_venc;
    property prcss                : string    read Fprcss                 write Fprcss;
    property agencia              : string    read Fagencia               write Fagencia;
    property conta                : string    read Fconta                 write Fconta;
    property banco                : string    read Fbanco                 write Fbanco;
    property cod_cli_terc         : Integer   read Fcod_cli_terc          write Fcod_cli_terc;
    property operador             : Integer   read Foperador              write Foperador;
    property tip_cnt              : string    read Ftip_cnt               write Ftip_cnt;
    property op_cxl               : Integer   read Fop_cxl                write Fop_cxl;
    property cxl                  : string    read Fcxl                   write Fcxl;
    property codigo_func          : Integer   read Fcodigo_func           write Fcodigo_func;
    property n_aut_cart           : string    read Fn_aut_cart            write Fn_aut_cart;
    property plano                : string    read Fplano                 write Fplano;
    property ativo                : Integer   read Fativo                 write Fativo;
    property num_nota             : Integer   read Fnum_nota              write Fnum_nota;
    property sub_serie            : Integer   read Fsub_serie             write Fsub_serie;
    property cod_cobrebem         : Integer   read Fcod_cobrebem          write Fcod_cobrebem;
    property nosso_numero_banco   : string    read Fnosso_numero_banco    write Fnosso_numero_banco;
    property recibo               : string    read Frecibo                write Frecibo;
    property ncoo_ecf             : Integer   read Fncoo_ecf              write Fncoo_ecf;
    property secao                : Integer   read Fsecao                 write Fsecao;
    property cod_terminal         : Integer   read Fcod_terminal          write Fcod_terminal;
    property nserieecf            : string    read Fnserieecf             write Fnserieecf;
    property registro             : Integer   read Fregistro              write Fregistro;
    property rec_tipvend          : string    read Frec_tipvend           write Frec_tipvend;
    property rec_numvend          : Integer   read Frec_numvend           write Frec_numvend;
    property n_processamento      : Integer   read Fn_processamento       write Fn_processamento;
    property ref_frete            : string    read Fref_frete             write Fref_frete;
    property valor_contabil       : Double    read Fvalor_contabil        write Fvalor_contabil;
    property cod_banco_str        : string    read Fcod_banco_str         write Fcod_banco_str;
    property vl_baixa_comissao    : Double    read Fvl_baixa_comissao     write Fvl_baixa_comissao;
    property vl_baixa_comissao_ger: Double    read Fvl_baixa_comissao_ger write Fvl_baixa_comissao_ger;
    property us_cad               : Integer   read Fus_cad                write Fus_cad;
    property nparcela             : Integer   read Fnparcela              write Fnparcela;
    property qtde_parc            : Integer   read Fqtde_parc             write Fqtde_parc;
    property n_docnsu_adm         : string    read Fn_docnsu_adm          write Fn_docnsu_adm;
    property cod_terminal_adm     : string    read Fcod_terminal_adm      write Fcod_terminal_adm;
    property nao_gera_finan       : string    read Fnao_gera_finan        write Fnao_gera_finan;
    property baixa_automatica     : string    read Fbaixa_automatica      write Fbaixa_automatica;
    property md5                  : string    read Fmd5                   write Fmd5;
    property alterado             : string    read Falterado              write Falterado;
    property tef                  : string    read Ftef                   write Ftef;
    property cod_gerador          : Integer   read Fcod_gerador           write Fcod_gerador;
    property ndoc_ant             : string    read Fndoc_ant              write Fndoc_ant;
    property cod_nfce             : Integer   read Fcod_nfce              write Fcod_nfce;
    property prg_fid              : string    read Fprg_fid               write Fprg_fid;
  end;

  TFormpagamento_classList = class(TObjectList)
  private
    function GetItem(Index: Integer): TFormpagamento_class;
    procedure SetItem(Index: Integer; const Value: TFormpagamento_class);
  public
    function New: TFormpagamento_class;
    procedure SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean = False); virtual;

    property Items[Index: Integer]: TFormpagamento_class read GetItem write SetItem;
  end;

implementation

uses
	hw_utils,
  SysUtils;

{ TFormpagamento_class }

constructor TFormpagamento_class.Create;
begin
  Fativo := 1;
end;

destructor TFormpagamento_class.Destroy;
begin
  inherited;
end;

class function TFormpagamento_class.GetFieldsSql(Aalias: string): string;
begin
  Result := '@seqform, @cod_empresa, @nrequisicao, @ndoc, @tipdoc, @cod_controle, @cliente, @cod_cliente, @historico,' +
            ' @cod_banco, @terceiros, @data_mov, @valordoc, @tpdocs, @n_conta_plc, @data_venc, @prcss, @agencia, @conta,' +
            ' @banco, @cod_cli_terc, @operador, @tip_cnt, @op_cxl, @cxl, @codigo_func, @n_aut_cart, @plano, @ativo, @num_nota,' +
            ' @sub_serie, @cod_cobrebem, @nosso_numero_banco, @recibo, @ncoo_ecf, @secao, @cod_terminal, @nserieecf, @registro,' +
            ' @rec_tipvend, @rec_numvend, @n_processamento, @ref_frete, @valor_contabil, @cod_banco_str,' +
            ' @vl_baixa_comissao, @vl_baixa_comissao_ger, @us_cad, @nparcela, @qtde_parc, @n_docnsu_adm, @cod_terminal_adm,' +
            ' @nao_gera_finan, @baixa_automatica, @md5, @alterado, @tef, @cod_gerador, @ndoc_ant, @cod_nfce, @prg_fid';
  if (Trim(Aalias) <> '') and (Trim(Aalias) <> ':') then
    Aalias := Trim(Aalias) + '.';
  Result := StringReplace(Result, '@', Aalias, [rfReplaceAll]);
end;

procedure TFormpagamento_class.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  if not AcheckFields then
  begin
    Fseqform               := ADataSet.FieldByName('SEQFORM').AsInteger;
    Fcod_empresa           := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    Fnrequisicao           := ADataSet.FieldByName('NREQUISICAO').AsInteger;
    Fndoc                  := Trim(ADataSet.FieldByName('NDOC').AsString);
    Ftipdoc                := Trim(ADataSet.FieldByName('TIPDOC').AsString);
    Fcod_controle          := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    Fcliente               := Trim(ADataSet.FieldByName('CLIENTE').AsString);
    Fcod_cliente           := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    Fhistorico             := Trim(ADataSet.FieldByName('HISTORICO').AsString);
    Fcod_banco             := ADataSet.FieldByName('COD_BANCO').AsInteger;
    Fterceiros             := Trim(ADataSet.FieldByName('TERCEIROS').AsString);
    Fdata_mov              := ADataSet.FieldByName('DATA_MOV').AsDateTime;
    Fvalordoc              := ADataSet.FieldByName('VALORDOC').AsFloat;
    Ftpdocs                := Trim(ADataSet.FieldByName('TPDOCS').AsString);
    Fn_conta_plc           := ADataSet.FieldByName('N_CONTA_PLC').AsFloat;
    Fdata_venc             := ADataSet.FieldByName('DATA_VENC').AsDateTime;
    Fprcss                 := Trim(ADataSet.FieldByName('PRCSS').AsString);
    Fagencia               := Trim(ADataSet.FieldByName('AGENCIA').AsString);
    Fconta                 := Trim(ADataSet.FieldByName('CONTA').AsString);
    Fbanco                 := Trim(ADataSet.FieldByName('BANCO').AsString);
    Fcod_cli_terc          := ADataSet.FieldByName('COD_CLI_TERC').AsInteger;
    Foperador              := ADataSet.FieldByName('OPERADOR').AsInteger;
    Ftip_cnt               := Trim(ADataSet.FieldByName('TIP_CNT').AsString);
    Fop_cxl                := ADataSet.FieldByName('OP_CXL').AsInteger;
    Fcxl                   := trim(ADataSet.FieldByName('CXL').AsString);
    Fcodigo_func           := ADataSet.FieldByName('CODIGO_FUNC').AsInteger;
    Fn_aut_cart            := Trim(ADataSet.FieldByName('N_AUT_CART').AsString);
    Fplano                 := Trim(ADataSet.FieldByName('PLANO').AsString);
    Fativo                 := ADataSet.FieldByName('ATIVO').AsInteger;
    Fnum_nota              := ADataSet.FieldByName('NUM_NOTA').AsInteger;
    Fsub_serie             := ADataSet.FieldByName('SUB_SERIE').AsInteger;
    Fcod_cobrebem          := ADataSet.FieldByName('COD_COBREBEM').AsInteger;
    Fnosso_numero_banco    := Trim(ADataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString);
    Frecibo                := Trim(ADataSet.FieldByName('RECIBO').AsString);
    Fncoo_ecf              := ADataSet.FieldByName('NCOO_ECF').AsInteger;
    Fsecao                 := ADataSet.FieldByName('SECAO').AsInteger;
    Fcod_terminal          := ADataSet.FieldByName('COD_TERMINAL').AsInteger;
    Fnserieecf             := Trim(ADataSet.FieldByName('NSERIEECF').AsString);
    Fregistro              := ADataSet.FieldByName('REGISTRO').AsInteger;
    Frec_tipvend           := Trim(ADataSet.FieldByName('REC_TIPVEND').AsString);
    Frec_numvend           := ADataSet.FieldByName('REC_NUMVEND').AsInteger;
    Fn_processamento       := ADataSet.FieldByName('N_PROCESSAMENTO').AsInteger;
    Fref_frete             := Trim(ADataSet.FieldByName('REF_FRETE').AsString);
    Fvalor_contabil        := ADataSet.FieldByName('VALOR_CONTABIL').AsFloat;
    Fcod_banco_str         := Trim(ADataSet.FieldByName('COD_BANCO_STR').AsString);
    Fvl_baixa_comissao     := ADataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat;
    Fvl_baixa_comissao_ger := ADataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat;
    Fus_cad                := ADataSet.FieldByName('US_CAD').AsInteger;
    Fnparcela              := ADataSet.FieldByName('NPARCELA').AsInteger;
    Fqtde_parc             := ADataSet.FieldByName('QTDE_PARC').AsInteger;
    Fn_docnsu_adm          := Trim(ADataSet.FieldByName('N_DOCNSU_ADM').AsString);
    Fcod_terminal_adm      := Trim(ADataSet.FieldByName('COD_TERMINAL_ADM').AsString);
    Fnao_gera_finan        := Trim(ADataSet.FieldByName('NAO_GERA_FINAN').AsString);
    Fbaixa_automatica      := Trim(ADataSet.FieldByName('BAIXA_AUTOMATICA').AsString);
    Fmd5                   := Trim(ADataSet.FieldByName('MD5').AsString);
    Falterado              := Trim(ADataSet.FieldByName('ALTERADO').AsString);
    Ftef                   := Trim(ADataSet.FieldByName('TEF').AsString);
    Fcod_gerador           := ADataSet.FieldByName('COD_GERADOR').AsInteger;
    Fndoc_ant              := Trim(ADataSet.FieldByName('NDOC_ANT').AsString);
    Fcod_nfce              := ADataSet.FieldByName('COD_NFCE').AsInteger;
    Fprg_fid               := Trim(ADataSet.FieldByName('PRG_FID').AsString);
  end
  else
  begin
    if Assigned(ADataSet.FindField('SEQFORM'              )) then Fseqform               := ADataSet.FieldByName('SEQFORM').AsInteger;
    if Assigned(ADataSet.FindField('COD_EMPRESA'          )) then Fcod_empresa           := ADataSet.FieldByName('COD_EMPRESA').AsInteger;
    if Assigned(ADataSet.FindField('NREQUISICAO'          )) then Fnrequisicao           := ADataSet.FieldByName('NREQUISICAO').AsInteger;
    if Assigned(ADataSet.FindField('NDOC'                 )) then Fndoc                  := Trim(ADataSet.FieldByName('NDOC').AsString);
    if Assigned(ADataSet.FindField('TIPDOC'               )) then Ftipdoc                := Trim(ADataSet.FieldByName('TIPDOC').AsString);
    if Assigned(ADataSet.FindField('COD_CONTROLE'         )) then Fcod_controle          := ADataSet.FieldByName('COD_CONTROLE').AsInteger;
    if Assigned(ADataSet.FindField('CLIENTE'              )) then Fcliente               := Trim(ADataSet.FieldByName('CLIENTE').AsString);
    if Assigned(ADataSet.FindField('COD_CLIENTE'          )) then Fcod_cliente           := ADataSet.FieldByName('COD_CLIENTE').AsInteger;
    if Assigned(ADataSet.FindField('HISTORICO'            )) then Fhistorico             := Trim(ADataSet.FieldByName('HISTORICO').AsString);
    if Assigned(ADataSet.FindField('COD_BANCO'            )) then Fcod_banco             := ADataSet.FieldByName('COD_BANCO').AsInteger;
    if Assigned(ADataSet.FindField('TERCEIROS'            )) then Fterceiros             := Trim(ADataSet.FieldByName('TERCEIROS').AsString);
    if Assigned(ADataSet.FindField('DATA_MOV'             )) then Fdata_mov              := ADataSet.FieldByName('DATA_MOV').AsDateTime;
    if Assigned(ADataSet.FindField('VALORDOC'             )) then Fvalordoc              := ADataSet.FieldByName('VALORDOC').AsFloat;
    if Assigned(ADataSet.FindField('TPDOCS'               )) then Ftpdocs                := Trim(ADataSet.FieldByName('TPDOCS').AsString);
    if Assigned(ADataSet.FindField('N_CONTA_PLC'          )) then Fn_conta_plc           := ADataSet.FieldByName('N_CONTA_PLC').AsFloat;
    if Assigned(ADataSet.FindField('DATA_VENC'            )) then Fdata_venc             := ADataSet.FieldByName('DATA_VENC').AsDateTime;
    if Assigned(ADataSet.FindField('PRCSS'                )) then Fprcss                 := Trim(ADataSet.FieldByName('PRCSS').AsString);
    if Assigned(ADataSet.FindField('AGENCIA'              )) then Fagencia               := Trim(ADataSet.FieldByName('AGENCIA').AsString);
    if Assigned(ADataSet.FindField('CONTA'                )) then Fconta                 := Trim(ADataSet.FieldByName('CONTA').AsString);
    if Assigned(ADataSet.FindField('BANCO'                )) then Fbanco                 := Trim(ADataSet.FieldByName('BANCO').AsString);
    if Assigned(ADataSet.FindField('COD_CLI_TERC'         )) then Fcod_cli_terc          := ADataSet.FieldByName('COD_CLI_TERC').AsInteger;
    if Assigned(ADataSet.FindField('OPERADOR'             )) then Foperador              := ADataSet.FieldByName('OPERADOR').AsInteger;
    if Assigned(ADataSet.FindField('TIP_CNT'              )) then Ftip_cnt               := Trim(ADataSet.FieldByName('TIP_CNT').AsString);
    if Assigned(ADataSet.FindField('OP_CXL'               )) then Fop_cxl                := ADataSet.FieldByName('OP_CXL').AsInteger;
    if Assigned(ADataSet.FindField('CXL'                  )) then Fcxl                   := Trim(ADataSet.FieldByName('CXL').AsString);    
    if Assigned(ADataSet.FindField('CODIGO_FUNC'          )) then Fcodigo_func           := ADataSet.FieldByName('CODIGO_FUNC').AsInteger;
    if Assigned(ADataSet.FindField('N_AUT_CART'           )) then Fn_aut_cart            := Trim(ADataSet.FieldByName('N_AUT_CART').AsString);
    if Assigned(ADataSet.FindField('PLANO'                )) then Fplano                 := Trim(ADataSet.FieldByName('PLANO').AsString);
    if Assigned(ADataSet.FindField('ATIVO'                )) then Fativo                 := ADataSet.FieldByName('ATIVO').AsInteger;
    if Assigned(ADataSet.FindField('NUM_NOTA'             )) then Fnum_nota              := ADataSet.FieldByName('NUM_NOTA').AsInteger;
    if Assigned(ADataSet.FindField('SUB_SERIE'            )) then Fsub_serie             := ADataSet.FieldByName('SUB_SERIE').AsInteger;
    if Assigned(ADataSet.FindField('COD_COBREBEM'         )) then Fcod_cobrebem          := ADataSet.FieldByName('COD_COBREBEM').AsInteger;    
    if Assigned(ADataSet.FindField('NOSSO_NUMERO_BANCO'   )) then Fnosso_numero_banco    := Trim(ADataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString);
    if Assigned(ADataSet.FindField('RECIBO'               )) then Frecibo                := Trim(ADataSet.FieldByName('RECIBO').AsString);
    if Assigned(ADataSet.FindField('NCOO_ECF'             )) then Fncoo_ecf              := ADataSet.FieldByName('NCOO_ECF').AsInteger;
    if Assigned(ADataSet.FindField('SECAO'                )) then Fsecao                 := ADataSet.FieldByName('SECAO').AsInteger;
    if Assigned(ADataSet.FindField('COD_TERMINAL'         )) then Fcod_terminal          := ADataSet.FieldByName('COD_TERMINAL').AsInteger;
    if Assigned(ADataSet.FindField('NSERIEECF'            )) then Fnserieecf             := Trim(ADataSet.FieldByName('NSERIEECF').AsString);
    if Assigned(ADataSet.FindField('REGISTRO'             )) then Fregistro              := ADataSet.FieldByName('REGISTRO').AsInteger;
    if Assigned(ADataSet.FindField('REC_TIPVEND'          )) then Frec_tipvend           := Trim(ADataSet.FieldByName('REC_TIPVEND').AsString);
    if Assigned(ADataSet.FindField('REC_NUMVEND'          )) then Frec_numvend           := ADataSet.FieldByName('REC_NUMVEND').AsInteger;
    if Assigned(ADataSet.FindField('N_PROCESSAMENTO'      )) then Fn_processamento       := ADataSet.FieldByName('N_PROCESSAMENTO').AsInteger;
    if Assigned(ADataSet.FindField('REF_FRETE'            )) then Fref_frete             := Trim(ADataSet.FieldByName('REF_FRETE').AsString);
    if Assigned(ADataSet.FindField('VALOR_CONTABIL'       )) then Fvalor_contabil        := ADataSet.FieldByName('VALOR_CONTABIL').AsFloat;
    if Assigned(ADataSet.FindField('COD_BANCO_STR'        )) then Fcod_banco_str         := Trim(ADataSet.FieldByName('COD_BANCO_STR').AsString);
    if Assigned(ADataSet.FindField('VL_BAIXA_COMISSAO'    )) then Fvl_baixa_comissao     := ADataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat;
    if Assigned(ADataSet.FindField('VL_BAIXA_COMISSAO_GER')) then Fvl_baixa_comissao_ger := ADataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat;
    if Assigned(ADataSet.FindField('US_CAD'               )) then Fus_cad                := ADataSet.FieldByName('US_CAD').AsInteger;
    if Assigned(ADataSet.FindField('NPARCELA'             )) then Fnparcela              := ADataSet.FieldByName('NPARCELA').AsInteger;
    if Assigned(ADataSet.FindField('QTDE_PARC'            )) then Fqtde_parc             := ADataSet.FieldByName('QTDE_PARC').AsInteger;    
    if Assigned(ADataSet.FindField('N_DOCNSU_ADM'         )) then Fn_docnsu_adm          := Trim(ADataSet.FieldByName('N_DOCNSU_ADM').AsString);
    if Assigned(ADataSet.FindField('COD_TERMINAL_ADM'     )) then Fcod_terminal_adm      := Trim(ADataSet.FieldByName('COD_TERMINAL_ADM').AsString);
    if Assigned(ADataSet.FindField('NAO_GERA_FINAN'       )) then Fnao_gera_finan        := Trim(ADataSet.FieldByName('NAO_GERA_FINAN').AsString);
    if Assigned(ADataSet.FindField('BAIXA_AUTOMATICA'     )) then Fbaixa_automatica      := Trim(ADataSet.FieldByName('BAIXA_AUTOMATICA').AsString);
    if Assigned(ADataSet.FindField('MD5'                  )) then Fmd5                   := Trim(ADataSet.FieldByName('MD5').AsString);
    if Assigned(ADataSet.FindField('ALTERADO'             )) then Falterado              := Trim(ADataSet.FieldByName('ALTERADO').AsString);
    if Assigned(ADataSet.FindField('TEF'                  )) then Ftef                   := Trim(ADataSet.FieldByName('TEF').AsString);
    if Assigned(ADataSet.FindField('COD_GERADOR'          )) then Fcod_gerador           := ADataSet.FieldByName('COD_GERADOR').AsInteger;
    if Assigned(ADataSet.FindField('NDOC_ANT'             )) then Fndoc_ant              := Trim(ADataSet.FieldByName('NDOC_ANT').AsString);
    if Assigned(ADataSet.FindField('COD_NFCE'             )) then Fcod_nfce              := ADataSet.FieldByName('COD_NFCE').AsInteger;
    if Assigned(ADataSet.FindField('PRG_FID'              )) then Fprg_fid               := Trim(ADataSet.FieldByName('PRG_FID').AsString);
  end;
end;

function TFormpagamento_class.SetValuesInParams(ADataSet: TIBQuery; AcheckParams: Boolean): TIBQuery;
begin
  Result := ADataSet;

  if not AcheckParams then
  begin
    ADataSet.ParamByName('SEQFORM').AsInteger             := Fseqform;
    ADataSet.ParamByName('COD_EMPRESA').AsInteger         := Fcod_empresa;
    ADataSet.ParamByName('NREQUISICAO').AsInteger         := Fnrequisicao;
    ADataSet.ParamByName('NDOC').AsString                 := Copy(Fndoc              , 1, 20);
    ADataSet.ParamByName('TIPDOC').AsString               := Copy(Ftipdoc            , 1, 2);
    ADataSet.ParamByName('COD_CONTROLE').AsInteger        := Fcod_controle;
    ADataSet.ParamByName('CLIENTE').AsString              := Copy(Fcliente           , 1, 60);
    ADataSet.ParamByName('COD_CLIENTE').AsInteger         := Fcod_cliente;
    ADataSet.ParamByName('HISTORICO').AsString            := Copy(Fhistorico         , 1, 80);
    ADataSet.ParamByName('COD_BANCO').AsInteger           := Fcod_banco;
    ADataSet.ParamByName('TERCEIROS').AsString            := Copy(Fterceiros         , 1, 80);
    ADataSet.ParamByName('DATA_MOV').AsDateTime           := Fdata_mov;
    ADataSet.ParamByName('VALORDOC').AsFloat              := Fvalordoc;
    ADataSet.ParamByName('TPDOCS').AsString               := Copy(Ftpdocs            , 1, 6);
    ADataSet.ParamByName('N_CONTA_PLC').AsFloat           := Fn_conta_plc;
    ADataSet.ParamByName('DATA_VENC').AsDateTime          := Fdata_venc;
    ADataSet.ParamByName('PRCSS').AsString                := Copy(Fprcss             , 1, 1);
    ADataSet.ParamByName('AGENCIA').AsString              := Copy(Fagencia           , 1, 10);
    ADataSet.ParamByName('CONTA').AsString                := Copy(Fconta             , 1, 15);
    ADataSet.ParamByName('BANCO').AsString                := Copy(Fbanco             , 1, 35);
    ADataSet.ParamByName('COD_CLI_TERC').AsInteger        := Fcod_cli_terc;
    ADataSet.ParamByName('OPERADOR').AsInteger            := Foperador;
    ADataSet.ParamByName('TIP_CNT').AsString              := Copy(Ftip_cnt           , 1, 1);
    ADataSet.ParamByName('OP_CXL').AsInteger              := Fop_cxl;
    ADataSet.ParamByName('CXL').AsString                  := Copy(Fcxl               , 1, 1);
    ADataSet.ParamByName('CODIGO_FUNC').AsInteger         := Fcodigo_func;
    ADataSet.ParamByName('N_AUT_CART').AsString           := Copy(Fn_aut_cart        , 1, 20);
    ADataSet.ParamByName('PLANO').AsString                := Copy(Fplano             , 1, 1);
    ADataSet.ParamByName('ATIVO').AsInteger               := Fativo;
    ADataSet.ParamByName('NUM_NOTA').AsInteger            := Fnum_nota;
    ADataSet.ParamByName('SUB_SERIE').AsInteger           := Fsub_serie;
    ADataSet.ParamByName('COD_COBREBEM').AsInteger        := Fcod_cobrebem;
    ADataSet.ParamByName('NOSSO_NUMERO_BANCO').AsString   := Copy(Fnosso_numero_banco, 1, 20);
    ADataSet.ParamByName('RECIBO').AsString               := Copy(Frecibo            , 1, 1);
    ADataSet.ParamByName('NCOO_ECF').AsInteger            := Fncoo_ecf;
    ADataSet.ParamByName('SECAO').AsInteger               := Fsecao;
    ADataSet.ParamByName('COD_TERMINAL').AsInteger        := Fcod_terminal;
    ADataSet.ParamByName('NSERIEECF').AsString            := Copy(Fnserieecf         , 1, 20);
    ADataSet.ParamByName('REGISTRO').AsInteger            := Fregistro;
    ADataSet.ParamByName('REC_TIPVEND').AsString          := Copy(Frec_tipvend       , 1, 3);
    ADataSet.ParamByName('REC_NUMVEND').AsInteger         := Frec_numvend;
    ADataSet.ParamByName('N_PROCESSAMENTO').AsInteger     := Fn_processamento;
    ADataSet.ParamByName('REF_FRETE').AsString            := Copy(Fref_frete         , 1, 1);
    ADataSet.ParamByName('VALOR_CONTABIL').AsFloat        := Fvalor_contabil;
    ADataSet.ParamByName('COD_BANCO_STR').AsString        := Copy(Fcod_banco_str     , 1, 11);
    ADataSet.ParamByName('VL_BAIXA_COMISSAO').AsFloat     := Fvl_baixa_comissao;
    ADataSet.ParamByName('VL_BAIXA_COMISSAO_GER').AsFloat := Fvl_baixa_comissao_ger;
    ADataSet.ParamByName('US_CAD').AsInteger              := Fus_cad;
    ADataSet.ParamByName('NPARCELA').AsInteger            := Fnparcela;
    ADataSet.ParamByName('QTDE_PARC').AsInteger           := Fqtde_parc;
    ADataSet.ParamByName('N_DOCNSU_ADM').AsString         := Copy(Fn_docnsu_adm      , 1, 10);
    ADataSet.ParamByName('COD_TERMINAL_ADM').AsString     := Copy(Fcod_terminal_adm  , 1, 10);
    ADataSet.ParamByName('NAO_GERA_FINAN').AsString       := Copy(Fnao_gera_finan    , 1, 1);
    ADataSet.ParamByName('BAIXA_AUTOMATICA').AsString     := Copy(Fbaixa_automatica  , 1, 1);
    ADataSet.ParamByName('MD5').AsString                  := Copy(Fmd5               , 1, 32);
    ADataSet.ParamByName('ALTERADO').AsString             := Copy(Falterado          , 1, 1);
    ADataSet.ParamByName('TEF').AsString                  := Copy(Ftef               , 1, 1);
    ADataSet.ParamByName('COD_GERADOR').AsInteger         := Fcod_gerador;
    ADataSet.ParamByName('NDOC_ANT').AsString             := Copy(Fndoc_ant          , 1, 20);
    ADataSet.ParamByName('COD_NFCE').AsInteger            := Fcod_nfce;
    ADataSet.ParamByName('PRG_FID').AsString              := Copy(Fprg_fid           , 1, 1);
  end
  else
  begin
    if Assigned(ADataSet.Params.FindParam('SEQFORM'              )) then   ADataSet.ParamByName('SEQFORM').AsInteger             := Fseqform;
    if Assigned(ADataSet.Params.FindParam('COD_EMPRESA'          )) then   ADataSet.ParamByName('COD_EMPRESA').AsInteger         := Fcod_empresa;
    if Assigned(ADataSet.Params.FindParam('NREQUISICAO'          )) then   ADataSet.ParamByName('NREQUISICAO').AsInteger         := Fnrequisicao;
    if Assigned(ADataSet.Params.FindParam('NDOC'                 )) then   ADataSet.ParamByName('NDOC').AsString                 := Copy(Fndoc              , 1, 20);
    if Assigned(ADataSet.Params.FindParam('TIPDOC'               )) then   ADataSet.ParamByName('TIPDOC').AsString               := Copy(Ftipdoc            , 1, 2);
    if Assigned(ADataSet.Params.FindParam('COD_CONTROLE'         )) then   ADataSet.ParamByName('COD_CONTROLE').AsInteger        := Fcod_controle;
    if Assigned(ADataSet.Params.FindParam('CLIENTE'              )) then   ADataSet.ParamByName('CLIENTE').AsString              := Copy(Fcliente           , 1, 60);
    if Assigned(ADataSet.Params.FindParam('COD_CLIENTE'          )) then   ADataSet.ParamByName('COD_CLIENTE').AsInteger         := Fcod_cliente;
    if Assigned(ADataSet.Params.FindParam('HISTORICO'            )) then   ADataSet.ParamByName('HISTORICO').AsString            := Copy(Fhistorico         , 1, 80);
    if Assigned(ADataSet.Params.FindParam('COD_BANCO'            )) then   ADataSet.ParamByName('COD_BANCO').AsInteger           := Fcod_banco;
    if Assigned(ADataSet.Params.FindParam('TERCEIROS'            )) then   ADataSet.ParamByName('TERCEIROS').AsString            := Copy(Fterceiros         , 1, 80);
    if Assigned(ADataSet.Params.FindParam('DATA_MOV'             )) then   ADataSet.ParamByName('DATA_MOV').AsDateTime           := Fdata_mov;
    if Assigned(ADataSet.Params.FindParam('VALORDOC'             )) then   ADataSet.ParamByName('VALORDOC').AsFloat              := Fvalordoc;
    if Assigned(ADataSet.Params.FindParam('TPDOCS'               )) then   ADataSet.ParamByName('TPDOCS').AsString               := Copy(Ftpdocs            , 1, 6);
    if Assigned(ADataSet.Params.FindParam('N_CONTA_PLC'          )) then   ADataSet.ParamByName('N_CONTA_PLC').AsFloat           := Fn_conta_plc;
    if Assigned(ADataSet.Params.FindParam('DATA_VENC'            )) then   ADataSet.ParamByName('DATA_VENC').AsDateTime          := Fdata_venc;
    if Assigned(ADataSet.Params.FindParam('PRCSS'                )) then   ADataSet.ParamByName('PRCSS').AsString                := Copy(Fprcss             , 1, 1);
    if Assigned(ADataSet.Params.FindParam('AGENCIA'              )) then   ADataSet.ParamByName('AGENCIA').AsString              := Copy(Fagencia           , 1, 10);
    if Assigned(ADataSet.Params.FindParam('CONTA'                )) then   ADataSet.ParamByName('CONTA').AsString                := Copy(Fconta             , 1, 15);
    if Assigned(ADataSet.Params.FindParam('BANCO'                )) then   ADataSet.ParamByName('BANCO').AsString                := Copy(Fbanco             , 1, 35);
    if Assigned(ADataSet.Params.FindParam('COD_CLI_TERC'         )) then   ADataSet.ParamByName('COD_CLI_TERC').AsInteger        := Fcod_cli_terc;
    if Assigned(ADataSet.Params.FindParam('OPERADOR'             )) then   ADataSet.ParamByName('OPERADOR').AsInteger            := Foperador;
    if Assigned(ADataSet.Params.FindParam('TIP_CNT'              )) then   ADataSet.ParamByName('TIP_CNT').AsString              := Copy(Ftip_cnt           , 1, 1);
    if Assigned(ADataSet.Params.FindParam('OP_CXL'               )) then   ADataSet.ParamByName('OP_CXL').AsInteger              := Fop_cxl;
    if Assigned(ADataSet.Params.FindParam('CXL'                  )) then   ADataSet.ParamByName('CXL').AsString                  := Copy(Fcxl               , 1, 1);
    if Assigned(ADataSet.Params.FindParam('CODIGO_FUNC'          )) then   ADataSet.ParamByName('CODIGO_FUNC').AsInteger         := Fcodigo_func;
    if Assigned(ADataSet.Params.FindParam('N_AUT_CART'           )) then   ADataSet.ParamByName('N_AUT_CART').AsString           := Copy(Fn_aut_cart        , 1, 20);
    if Assigned(ADataSet.Params.FindParam('PLANO'                )) then   ADataSet.ParamByName('PLANO').AsString                := Copy(Fplano             , 1, 1);
    if Assigned(ADataSet.Params.FindParam('ATIVO'                )) then   ADataSet.ParamByName('ATIVO').AsInteger               := Fativo;
    if Assigned(ADataSet.Params.FindParam('NUM_NOTA'             )) then   ADataSet.ParamByName('NUM_NOTA').AsInteger            := Fnum_nota;
    if Assigned(ADataSet.Params.FindParam('SUB_SERIE'            )) then   ADataSet.ParamByName('SUB_SERIE').AsInteger           := Fsub_serie;
    if Assigned(ADataSet.Params.FindParam('COD_COBREBEM'         )) then   ADataSet.ParamByName('COD_COBREBEM').AsInteger        := Fcod_cobrebem;
    if Assigned(ADataSet.Params.FindParam('NOSSO_NUMERO_BANCO'   )) then   ADataSet.ParamByName('NOSSO_NUMERO_BANCO').AsString   := Copy(Fnosso_numero_banco, 1, 20);
    if Assigned(ADataSet.Params.FindParam('RECIBO'               )) then   ADataSet.ParamByName('RECIBO').AsString               := Copy(Frecibo            , 1, 1);
    if Assigned(ADataSet.Params.FindParam('NCOO_ECF'             )) then   ADataSet.ParamByName('NCOO_ECF').AsInteger            := Fncoo_ecf;
    if Assigned(ADataSet.Params.FindParam('SECAO'                )) then   ADataSet.ParamByName('SECAO').AsInteger               := Fsecao;
    if Assigned(ADataSet.Params.FindParam('COD_TERMINAL'         )) then   ADataSet.ParamByName('COD_TERMINAL').AsInteger        := Fcod_terminal;
    if Assigned(ADataSet.Params.FindParam('NSERIEECF'            )) then   ADataSet.ParamByName('NSERIEECF').AsString            := Copy(Fnserieecf         , 1, 20);
    if Assigned(ADataSet.Params.FindParam('REGISTRO'             )) then   ADataSet.ParamByName('REGISTRO').AsInteger            := Fregistro;
    if Assigned(ADataSet.Params.FindParam('REC_TIPVEND'          )) then   ADataSet.ParamByName('REC_TIPVEND').AsString          := Copy(Frec_tipvend       , 1, 3);
    if Assigned(ADataSet.Params.FindParam('REC_NUMVEND'          )) then   ADataSet.ParamByName('REC_NUMVEND').AsInteger         := Frec_numvend;
    if Assigned(ADataSet.Params.FindParam('N_PROCESSAMENTO'      )) then   ADataSet.ParamByName('N_PROCESSAMENTO').AsInteger     := Fn_processamento;
    if Assigned(ADataSet.Params.FindParam('REF_FRETE'            )) then   ADataSet.ParamByName('REF_FRETE').AsString            := Copy(Fref_frete         , 1, 1);
    if Assigned(ADataSet.Params.FindParam('VALOR_CONTABIL'       )) then   ADataSet.ParamByName('VALOR_CONTABIL').AsFloat        := Fvalor_contabil;
    if Assigned(ADataSet.Params.FindParam('COD_BANCO_STR'        )) then   ADataSet.ParamByName('COD_BANCO_STR').AsString        := Copy(Fcod_banco_str     , 1, 11);
    if Assigned(ADataSet.Params.FindParam('VL_BAIXA_COMISSAO'    )) then   ADataSet.ParamByName('VL_BAIXA_COMISSAO').AsFloat     := Fvl_baixa_comissao;
    if Assigned(ADataSet.Params.FindParam('VL_BAIXA_COMISSAO_GER')) then   ADataSet.ParamByName('VL_BAIXA_COMISSAO_GER').AsFloat := Fvl_baixa_comissao_ger;
    if Assigned(ADataSet.Params.FindParam('US_CAD'               )) then   ADataSet.ParamByName('US_CAD').AsInteger              := Fus_cad;
    if Assigned(ADataSet.Params.FindParam('NPARCELA'             )) then   ADataSet.ParamByName('NPARCELA').AsInteger            := Fnparcela;
    if Assigned(ADataSet.Params.FindParam('QTDE_PARC'            )) then   ADataSet.ParamByName('QTDE_PARC').AsInteger           := Fqtde_parc;    
    if Assigned(ADataSet.Params.FindParam('N_DOCNSU_ADM'         )) then   ADataSet.ParamByName('N_DOCNSU_ADM').AsString         := Copy(Fn_docnsu_adm      , 1, 10);
    if Assigned(ADataSet.Params.FindParam('COD_TERMINAL_ADM'     )) then   ADataSet.ParamByName('COD_TERMINAL_ADM').AsString     := Copy(Fcod_terminal_adm  , 1, 10);
    if Assigned(ADataSet.Params.FindParam('NAO_GERA_FINAN'       )) then   ADataSet.ParamByName('NAO_GERA_FINAN').AsString       := Copy(Fnao_gera_finan    , 1, 1);
    if Assigned(ADataSet.Params.FindParam('BAIXA_AUTOMATICA'     )) then   ADataSet.ParamByName('BAIXA_AUTOMATICA').AsString     := Copy(Fbaixa_automatica  , 1, 1);
    if Assigned(ADataSet.Params.FindParam('MD5'                  )) then   ADataSet.ParamByName('MD5').AsString                  := Copy(Fmd5               , 1, 32);
    if Assigned(ADataSet.Params.FindParam('ALTERADO'             )) then   ADataSet.ParamByName('ALTERADO').AsString             := Copy(Falterado          , 1, 1);
    if Assigned(ADataSet.Params.FindParam('TEF'                  )) then   ADataSet.ParamByName('TEF').AsString                  := Copy(Ftef               , 1, 1);
    if Assigned(ADataSet.Params.FindParam('COD_GERADOR'          )) then   ADataSet.ParamByName('COD_GERADOR').AsInteger         := Fcod_gerador;
    if Assigned(ADataSet.Params.FindParam('NDOC_ANT'             )) then   ADataSet.ParamByName('NDOC_ANT').AsString             := Copy(Fndoc_ant          , 1, 20);    
    if Assigned(ADataSet.Params.FindParam('COD_NFCE'             )) then   ADataSet.ParamByName('COD_NFCE').AsInteger            := Fcod_nfce;
    if Assigned(ADataSet.Params.FindParam('PRG_FID'              )) then   ADataSet.ParamByName('PRG_FID').AsString              := Copy(Fprg_fid           , 1, 1);
  end;
end;

{ TFormpagamento_classList }

function TFormpagamento_classList.GetItem(Index: Integer): TFormpagamento_class;
begin
  Result := TFormpagamento_class(inherited Items[Index]);
end;

function TFormpagamento_classList.New: TFormpagamento_class;
begin
  Result := TFormpagamento_class.Create;
  Add(Result);
end;

procedure TFormpagamento_classList.SetItem(Index: Integer; const Value: TFormpagamento_class);
begin
  Put(Index, Value);
end;

procedure TFormpagamento_classList.SetValuesFrom(ADataSet: TDataSet; AcheckFields: Boolean);
begin
  ADataSet.First;
  while not ADataSet.Eof do
  begin
    Self.New.SetValuesFrom(ADataSet, AcheckFields);
    ADataSet.Next;
  end;
end;

initialization
  RegisterClass(TFormpagamento_class);
finalization
  UnRegisterClass(TFormpagamento_class);

end.
